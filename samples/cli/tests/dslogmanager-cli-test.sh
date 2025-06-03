#!/usr/bin/env bash

# Copyright (c) 2021 AccelByte Inc. All Rights Reserved.
# This is licensed software from AccelByte Inc, for limitations
# and restrictions contact your company contract manager.

# Code generated. DO NOT EDIT.

# Meta:
# - random seed: 
# - template file: 

# Instructions:
# - Run the Justice SDK Mock Server first before running this script.

export AB_BASE_URL="http://127.0.0.1:8080"
export AB_CLIENT_ID="admin"
export AB_CLIENT_SECRET="admin"
export AB_NAMESPACE="test"

EXIT_CODE=0

eval_tap() {
  if [ $1 -eq 0 ]; then
    echo "ok $2 - $3"
  else
    EXIT_CODE=1
    echo "not ok $2 - $3"
    sed 's/^/# /g' $4
  fi
  rm -f $4
}

chmod +x ./ng
trap "./ng ng-stop" EXIT
java -jar build/install/cli/lib/nailgun-server-*.jar 1>&2 &
(for i in $(seq 1 100); do bash -c "timeout 1 echo > /dev/tcp/127.0.0.1/2113" 2>/dev/null && exit 0 || sleep 1; done; exit 1) || exit 1
for JAR in build/install/cli/lib/*.jar; do ./ng ng-cp $JAR 1>&2; done
./ng ng-cp 1>&2

echo "TAP version 13"
echo "1..9"

#- 1 Login
./ng net.accelbyte.sdk.cli.Main loginClient \
    > test.out 2>&1
eval_tap $? 1 'Login' test.out

if [ $EXIT_CODE -ne 0 ]; then
  echo "Bail out! Login failed."
  exit $EXIT_CODE
fi

touch "tmp.dat"

#- 2 GetServerLogs
./ng net.accelbyte.sdk.cli.Main dslogmanager getServerLogs \
    --namespace "$AB_NAMESPACE" \
    --podName 'f9sQysLQ' \
    --logType '5MsJzQkM' \
    --offset '87' \
    --origin 'BMelN1Ie' \
    > test.out 2>&1
eval_tap $? 2 'GetServerLogs' test.out

#- 3 ListTerminatedServers
./ng net.accelbyte.sdk.cli.Main dslogmanager listTerminatedServers \
    --namespace "$AB_NAMESPACE" \
    --deployment 'odZwincv' \
    --endDate 'gq3c2P9q' \
    --gameMode '9kYQWGdj' \
    --limit '89' \
    --next 'cq9rnCAL' \
    --partyId 'QQuPDHiM' \
    --podName '27eltN9l' \
    --previous 'eEeNAMFQ' \
    --provider 'TzoJAZhT' \
    --region 'OZbOotGo' \
    --sessionId 'X9YRDbIE' \
    --source 'AbGDXSzw' \
    --startDate 'h585KlWN' \
    --status 'nhkUxcnF' \
    --userId 'UOg99Qfy' \
    > test.out 2>&1
eval_tap $? 3 'ListTerminatedServers' test.out

#- 4 DownloadServerLogs
./ng net.accelbyte.sdk.cli.Main dslogmanager downloadServerLogs \
    --namespace "$AB_NAMESPACE" \
    --podName 'ruwib67E' \
    > test.out 2>&1
eval_tap $? 4 'DownloadServerLogs' test.out

#- 5 CheckServerLogs
./ng net.accelbyte.sdk.cli.Main dslogmanager checkServerLogs \
    --namespace "$AB_NAMESPACE" \
    --podName 'hx8a6gVe' \
    > test.out 2>&1
eval_tap $? 5 'CheckServerLogs' test.out

#- 6 BatchDownloadServerLogs
./ng net.accelbyte.sdk.cli.Main dslogmanager batchDownloadServerLogs \
    --body '{"Downloads": [{"alloc_id": "WkHgypRK", "namespace": "EYXeun65", "pod_name": "nw6Zfbnm"}, {"alloc_id": "GMa32yJW", "namespace": "OwiNuD26", "pod_name": "XDy2q1tA"}, {"alloc_id": "CfsQYn1B", "namespace": "JmH1TyV5", "pod_name": "FzPdD1ls"}]}' \
    > test.out 2>&1
eval_tap $? 6 'BatchDownloadServerLogs' test.out

#- 7 ListMetadataServers
./ng net.accelbyte.sdk.cli.Main dslogmanager listMetadataServers \
    --body '{"pod_names": ["wqx3JFsK", "Y8cDP3o3", "kGIyYoGd"]}' \
    > test.out 2>&1
eval_tap $? 7 'ListMetadataServers' test.out

#- 8 ListAllTerminatedServers
./ng net.accelbyte.sdk.cli.Main dslogmanager listAllTerminatedServers \
    --deployment 'VLI09gVx' \
    --endDate 'ozDQ3rUk' \
    --gameMode 'DDSFELXs' \
    --limit '60' \
    --namespace "$AB_NAMESPACE" \
    --next 'fzOWksPK' \
    --partyId 'sWQzN7IK' \
    --podName 'c6Oqog29' \
    --previous '6y4XGKFw' \
    --provider 'W5BGfZho' \
    --region '6w1iCLjR' \
    --sessionId 'LOPCGQdD' \
    --startDate 'wRvF4fUj' \
    --status 'MxZ3SNkd' \
    --userId 'kKwHuWwB' \
    > test.out 2>&1
eval_tap $? 8 'ListAllTerminatedServers' test.out

#- 9 PublicGetMessages
./ng net.accelbyte.sdk.cli.Main dslogmanager publicGetMessages \
    > test.out 2>&1
eval_tap $? 9 'PublicGetMessages' test.out


rm -f "tmp.dat"

exit $EXIT_CODE