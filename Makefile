# Copyright (c) 2022 AccelByte Inc. All Rights Reserved.
# This is licensed software from AccelByte Inc, for limitations
# and restrictions contact your company contract manager.

SHELL := /bin/bash

.PHONY: build samples

build:
	docker run -t --rm -u $$(id -u):$$(id -g) -v $$(pwd):/data/ -w /data/ -e GRADLE_USER_HOME=/data/.gradle gradle:8.5-jdk8 \
			gradle --console=plain -i --no-daemon build

samples:
	rm -f samples.err
	find samples -type f -iname build.gradle -exec dirname {} \; | while read DIRECTORY; do \
		echo -e "\n# $$DIRECTORY\n"; \
		docker run -t --rm -u $$(id -u):$$(id -g) -v $$(pwd):/data/ -w /data/$$DIRECTORY -e GRADLE_USER_HOME=/data/.gradle gradle:8.5-jdk8 \
				gradle --console=plain -i --no-daemon build || touch samples.err; \
	done
	[ ! -f samples.err ] || (rm samples.err && exit 1)

test_core:
	@test -n "$(SDK_MOCK_SERVER_PATH)" || (echo "SDK_MOCK_SERVER_PATH is not set" ; exit 1)
	sed -i "s/\r//" "$(SDK_MOCK_SERVER_PATH)/mock-server.sh" && \
			trap "docker stop -t 1 justice-codegen-sdk-mock-server; docker rm -f justice-codegen-sdk-httpbin" EXIT && \
			docker run -d --name justice-codegen-sdk-httpbin -p 8070:80 kennethreitz/httpbin && \
			(bash "$(SDK_MOCK_SERVER_PATH)/mock-server.sh" -s /data/spec &) && \
			(for i in $$(seq 1 10); do docker run -t --rm --add-host=host.docker.internal:host-gateway dwdraju/alpine-curl-jq curl http://host.docker.internal:8070 >/dev/null && exit 0 || sleep 10; done; exit 1) && \
			(for i in $$(seq 1 10); do docker run -t --rm --add-host=host.docker.internal:host-gateway dwdraju/alpine-curl-jq curl http://host.docker.internal:8080 >/dev/null && exit 0 || sleep 10; done; exit 1) && \
			docker run -t --rm -u $$(id -u):$$(id -g) -v $$(pwd):/data/ -w /data/ --network host -e AB_HTTPBIN_URL=http://localhost:8070 -e GRADLE_USER_HOME=/data/.gradle gradle:8.5-jdk8 \
					gradle --console=plain -i --no-daemon testCore
	
test_integration:
	@test -n "$(ENV_FILE_PATH)" || (echo "ENV_FILE_PATH is not set" ; exit 1)
	docker run -t --rm -u $$(id -u):$$(id -g) -v $$(pwd):/data/ -w /data/ --env-file $(ENV_FILE_PATH) -e GRADLE_USER_HOME=/data/.gradle gradle:8.5-jdk8 \
			gradle --console=plain -i --no-daemon testIntegration

test_cli:
	@test -n "$(SDK_MOCK_SERVER_PATH)" || (echo "SDK_MOCK_SERVER_PATH is not set" ; exit 1)
	rm -f test.err
	docker run -t --rm -u $$(id -u):$$(id -g) -v $$(pwd):/data/ -w /data/samples/cli -e GRADLE_USER_HOME=/data/.gradle gradle:8.5-jdk8 \
			gradle --console=plain -i --no-daemon installDist
	sed -i "s/\r//" "$(SDK_MOCK_SERVER_PATH)/mock-server.sh" && \
			trap "docker stop -t 1 justice-codegen-sdk-mock-server" EXIT && \
			(bash "$(SDK_MOCK_SERVER_PATH)/mock-server.sh" -s /data/spec &) && \
			(for i in $$(seq 1 10); do docker run -t --rm --add-host=host.docker.internal:host-gateway dwdraju/alpine-curl-jq curl http://host.docker.internal:8080 >/dev/null && exit 0 || sleep 10; done; exit 1) && \
			sed -i "s/\r//" samples/cli/tests/* && \
			rm -f samples/cli/tests/*.tap && \
			for FILE in $$(ls samples/cli/tests/*.sh); do \
					echo "# $$(basename "$$FILE")"; \
					(set -o pipefail; docker run --rm -u $$(id -u):$$(id -g) -v $$(pwd):/data -w /data/samples/cli  --network host -e GRADLE_USER_HOME=/data/.gradle gradle:8.5-jdk8 \
							bash "/data/$${FILE}" | tee "$${FILE}.tap") || touch test.err; \
			done
	[ ! -f test.err ]

publish:
	@test -n "$(AGS_VER)" || (echo "AGS_VER is not set" ; exit 1)
	@echo "AGS version: "$(AGS_VER)
	publish_modules=$$(./scripts/gradle-modules-by-ags-tag.sh $(AGS_VER)); \
	if [ -z "$$publish_modules" ]; then \
		echo "No modules to publish for AGS_VER: $(AGS_VER)"; \
		exit 1; \
	fi; \
	docker run -t --rm -u  $$(id -u):$$(id -g) \
			-v $$(pwd):/data/ -w /data/ \
			-e GRADLE_USER_HOME=/data/.gradle \
			-e PUBLISH_OSSRH_USERNAME="$$PUBLISH_OSSRH_USERNAME" \
			-e PUBLISH_OSSRH_PASSWORD="$$PUBLISH_OSSRH_PASSWORD" \
			-e PUBLISH_ASC_KEY="$$(cat "$$PUBLISH_ASC_KEY_FILE_PATH")" \
			-e PUBLISH_ASC_KEY_PASSWORD="$$PUBLISH_ASC_KEY_PASSWORD" \
			gradle:8.5-jdk8 gradle --console=plain -i --no-daemon  $$publish_modules closeAndReleaseSonatypeStagingRepository

test_broken_link:
	@test -n "$(SDK_MD_CRAWLER_PATH)" || (echo "SDK_MD_CRAWLER_PATH is not set" ; exit 1)
	rm -f test.err
	bash "$(SDK_MD_CRAWLER_PATH)/md-crawler.sh" -i README.md
	#DOCKER_SKIP_BUILD=1 bash "$(SDK_MD_CRAWLER_PATH)/md-crawler.sh" -i CHANGELOG.md
	(for FILE in $$(find docs -type f); do \
			(set -o pipefail; DOCKER_SKIP_BUILD=1 bash "$(SDK_MD_CRAWLER_PATH)/md-crawler.sh" -i $$FILE) || touch test.err; \
	done)
	DOCKER_SKIP_BUILD=1 bash "$(SDK_MD_CRAWLER_PATH)/md-crawler.sh" -i "https://docs.accelbyte.io/guides/customization/java-sdk-guide.html"
	[ ! -f test.err ]

version:
	find spec -type f -iname '*.json' | grep -oP '(?<=/)\w+(?=.json)' | xargs -I{} sh -c './scripts/bump-version.sh {} || exit 255'

tag_modules:
	find spec -type f -iname '*.json' | grep -oP '(?<=/)\w+(?=.json)' | xargs -I{} sh -c './scripts/tag-module.sh {} || exit 255'

tag_ags:
	@test -n "$(AGS_VER)" || (echo "AGS_VER is not set" ; exit 1)
	@echo "AGS version: "$(AGS_VER)
	git fetch origin
	@if git rev-parse "ags/v$(AGS_VER)" >/dev/null 2>&1; then \
		echo "AGS tag already exists!"; exit 1; \
		else \
			LAST_COMMIT=$(git log --format="%H" -n 1); \
			git tag "ags/v$(AGS_VER)" $$LAST_COMMIT; \
	fi

push_tag:
	@test -n "$(AGS_VER)" || (echo "AGS_VER is not set" ; exit 1)
	@echo "AGS version: "$(AGS_VER)
	@if git rev-parse "ags/v$(AGS_VER)" >/dev/null 2>&1; then \
		git tag --contains $$(git rev-list -n 1 'ags/v$(AGS_VER)') | \
			grep -v 'ags/v$(AGS_VER)' | \
			xargs -I{} sh -c 'git push origin {} || exit 255'; \
	else \
		echo "AGS tag does not exists!"; exit 1; \
	fi

push_tags:
	@test -n "$(AGS_VER)" || (echo "AGS_VER is not set" ; exit 1)
	@echo "AGS version: "$(AGS_VER)
	@if git rev-parse "ags/v$(AGS_VER)" >/dev/null 2>&1; then \
		git tag --contains $$(git rev-list -n 1 'ags/v$(AGS_VER)') | \
			grep -v 'ags/v$(AGS_VER)' | \
			xargs -I{} sh -c 'git push origin {} || exit 255'; \
	else \
		echo "AGS tag does not exists!"; exit 1; \
	fi

outstanding_deprecation:
	find * -type f -iname '*.java' \
		| xargs awk ' \
				BEGIN { \
					count_ok = 0; \
					count_not_ok = 0; \
					"date +%s -d \"6 months ago\"" | getline limit_epoch; \
				} \
				match($$0,/@deprecated +([0-9]{4}-[0-9]{1,2}-[0-9]{1,2})/,since_date) { \
					"date +%s -d " since_date[1] | getline since_epoch; \
					if (limit_epoch < since_epoch) { \
						count_ok += 1; \
						print "ok - " FILENAME ":" $$0; \
					} \
					else { \
						count_not_ok += 1; \
						print "not ok - " FILENAME ":" $$0; \
					} \
				} \
				END { \
					exit (count_not_ok ? 1 : 0); \
				}' \
		| tee outstanding_deprecation.out
	@echo 1..$$(grep -c '^\(not \)\?ok' outstanding_deprecation.out) 