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
    --podName 'hj3ax7Hi' \
    --logType '2L3GW9nM' \
    --offset '37' \
    --origin 'THNcCrL3' \
    > test.out 2>&1
eval_tap $? 2 'GetServerLogs' test.out

#- 3 ListTerminatedServers
./ng net.accelbyte.sdk.cli.Main dslogmanager listTerminatedServers \
    --namespace "$AB_NAMESPACE" \
    --deployment 'eWc2klVi' \
    --endDate 'KvuuWP2a' \
    --gameMode 'nEJVC0Sp' \
    --limit '0' \
    --next 'ltmniDdG' \
    --partyId 'i7cz9aIg' \
    --podName '9cubp4ud' \
    --previous '2boTk73k' \
    --provider 'CU1N6ZZp' \
    --region 'FqSnSqZk' \
    --sessionId 'VeH0AMfF' \
    --source 'mm1I8AH8' \
    --startDate '2dUTmgws' \
    --status 'vlkYbK4Y' \
    --userId '3XbqjNcZ' \
    > test.out 2>&1
eval_tap $? 3 'ListTerminatedServers' test.out

#- 4 DownloadServerLogs
./ng net.accelbyte.sdk.cli.Main dslogmanager downloadServerLogs \
    --namespace "$AB_NAMESPACE" \
    --podName 'U9EZzyOu' \
    > test.out 2>&1
eval_tap $? 4 'DownloadServerLogs' test.out

#- 5 CheckServerLogs
./ng net.accelbyte.sdk.cli.Main dslogmanager checkServerLogs \
    --namespace "$AB_NAMESPACE" \
    --podName 'aALTRYnZ' \
    > test.out 2>&1
eval_tap $? 5 'CheckServerLogs' test.out

#- 6 BatchDownloadServerLogs
./ng net.accelbyte.sdk.cli.Main dslogmanager batchDownloadServerLogs \
    --body '{"Downloads": [{"alloc_id": "pVKXj9Az", "namespace": "DJbw2y7i", "pod_name": "UWUlY1mw"}, {"alloc_id": "qFCZUs6w", "namespace": "YF3xYUhW", "pod_name": "wMAN62SZ"}, {"alloc_id": "ZnXm1OZC", "namespace": "13WP1HaW", "pod_name": "xGp2Bwgs"}]}' \
    > test.out 2>&1
eval_tap $? 6 'BatchDownloadServerLogs' test.out

#- 7 ListAllTerminatedServers
./ng net.accelbyte.sdk.cli.Main dslogmanager listAllTerminatedServers \
    --deployment 'kzwfbCUN' \
    --endDate 'yeFBiOdm' \
    --gameMode 'wS0yhDSv' \
    --limit '34' \
    --namespace "$AB_NAMESPACE" \
    --next 'rgSmJRws' \
    --partyId 'JOJxUm5h' \
    --podName '9f08nw3F' \
    --previous 't8bIwV6x' \
    --provider 'CuRz8Dk9' \
    --region 'gp1qttPI' \
    --sessionId 'YCmG8cth' \
    --startDate 'MFjTXomw' \
    --status 'LFVhJN08' \
    --userId 'wCxBlKeE' \
    > test.out 2>&1
eval_tap $? 7 'ListAllTerminatedServers' test.out

#- 8 PublicGetMessages
./ng net.accelbyte.sdk.cli.Main dslogmanager publicGetMessages \
    > test.out 2>&1
eval_tap $? 8 'PublicGetMessages' test.out


rm -f "tmp.dat"

exit $EXIT_CODE