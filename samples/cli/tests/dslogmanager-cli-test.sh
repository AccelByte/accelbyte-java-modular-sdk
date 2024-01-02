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
echo "1..8"

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
    --podName 'aR3suoPF' \
    --logType 'V3xTrvj4' \
    --offset '61' \
    --origin 'y1RW6gWa' \
    > test.out 2>&1
eval_tap $? 2 'GetServerLogs' test.out

#- 3 ListTerminatedServers
./ng net.accelbyte.sdk.cli.Main dslogmanager listTerminatedServers \
    --namespace "$AB_NAMESPACE" \
    --deployment 'wISBtCpc' \
    --endDate 'G62Lq5Lg' \
    --gameMode 'qzFjOtNs' \
    --limit '78' \
    --next 'W45hdskI' \
    --partyId 'QYVnw8e8' \
    --podName 'U1qFYgut' \
    --previous 'gKijQi3P' \
    --provider 'dqbKxYkB' \
    --region 'Y88JOBfi' \
    --sessionId 'OcxWBHHD' \
    --source '3LDQUYkg' \
    --startDate '7l66QwXu' \
    --status 'Q05LAoKQ' \
    --userId 'lkF4cpCT' \
    > test.out 2>&1
eval_tap $? 3 'ListTerminatedServers' test.out

#- 4 DownloadServerLogs
./ng net.accelbyte.sdk.cli.Main dslogmanager downloadServerLogs \
    --namespace "$AB_NAMESPACE" \
    --podName '4qzUSKhr' \
    > test.out 2>&1
eval_tap $? 4 'DownloadServerLogs' test.out

#- 5 CheckServerLogs
./ng net.accelbyte.sdk.cli.Main dslogmanager checkServerLogs \
    --namespace "$AB_NAMESPACE" \
    --podName 'EkHvk4Gm' \
    > test.out 2>&1
eval_tap $? 5 'CheckServerLogs' test.out

#- 6 BatchDownloadServerLogs
./ng net.accelbyte.sdk.cli.Main dslogmanager batchDownloadServerLogs \
    --body '{"Downloads": [{"alloc_id": "fgxUybc3", "namespace": "nFy6O8jB", "pod_name": "uV39h1W7"}, {"alloc_id": "joytAyq1", "namespace": "yhEzAt1e", "pod_name": "tt78hW5L"}, {"alloc_id": "t0OatYrC", "namespace": "W7hxEjff", "pod_name": "8hSky2jQ"}]}' \
    > test.out 2>&1
eval_tap $? 6 'BatchDownloadServerLogs' test.out

#- 7 ListAllTerminatedServers
./ng net.accelbyte.sdk.cli.Main dslogmanager listAllTerminatedServers \
    --deployment 'VZGZunnN' \
    --endDate 'ZRLZBS4Y' \
    --gameMode 'QIXnsr6S' \
    --limit '61' \
    --namespace "$AB_NAMESPACE" \
    --next 'VffaYjZK' \
    --partyId 'U2aydDjN' \
    --podName 'h89gRH0N' \
    --previous 'ShlsRVrL' \
    --provider 'ep3hOhr8' \
    --region 'D8mddTIX' \
    --sessionId 'dn9yc6ug' \
    --startDate '7QeiWg4g' \
    --status 'Z9QtldwZ' \
    --userId 'YsAcFsYv' \
    > test.out 2>&1
eval_tap $? 7 'ListAllTerminatedServers' test.out

#- 8 PublicGetMessages
./ng net.accelbyte.sdk.cli.Main dslogmanager publicGetMessages \
    > test.out 2>&1
eval_tap $? 8 'PublicGetMessages' test.out


rm -f "tmp.dat"

exit $EXIT_CODE