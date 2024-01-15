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
    --podName '5pajsOiU' \
    --logType '1ll9tzFw' \
    --offset '70' \
    --origin 'NagszOTK' \
    > test.out 2>&1
eval_tap $? 2 'GetServerLogs' test.out

#- 3 ListTerminatedServers
./ng net.accelbyte.sdk.cli.Main dslogmanager listTerminatedServers \
    --namespace "$AB_NAMESPACE" \
    --deployment 'sQVzbl7J' \
    --endDate 'JUmWCyzB' \
    --gameMode 'DCedHVXq' \
    --limit '69' \
    --next '8C27IcQe' \
    --partyId 'KjlYfwmH' \
    --podName 'SqpcsGzW' \
    --previous 'KJxmn5Lz' \
    --provider 'PsW8WvDl' \
    --region 'Bz9W5e8m' \
    --sessionId 'yv4nwPAo' \
    --source 'Yxzy1MEC' \
    --startDate 'jADRFEfb' \
    --status 'm80qgWzk' \
    --userId 'tbCfvzZT' \
    > test.out 2>&1
eval_tap $? 3 'ListTerminatedServers' test.out

#- 4 DownloadServerLogs
./ng net.accelbyte.sdk.cli.Main dslogmanager downloadServerLogs \
    --namespace "$AB_NAMESPACE" \
    --podName 'cAqklEcX' \
    > test.out 2>&1
eval_tap $? 4 'DownloadServerLogs' test.out

#- 5 CheckServerLogs
./ng net.accelbyte.sdk.cli.Main dslogmanager checkServerLogs \
    --namespace "$AB_NAMESPACE" \
    --podName 'yDLzE5UN' \
    > test.out 2>&1
eval_tap $? 5 'CheckServerLogs' test.out

#- 6 BatchDownloadServerLogs
./ng net.accelbyte.sdk.cli.Main dslogmanager batchDownloadServerLogs \
    --body '{"Downloads": [{"alloc_id": "cujHp2Ns", "namespace": "dA4fyUtI", "pod_name": "wrjfzvf4"}, {"alloc_id": "lkWBxxFz", "namespace": "zldCGZd6", "pod_name": "fvhEEfQs"}, {"alloc_id": "kySEqfwm", "namespace": "p5T7LriU", "pod_name": "x9sS9XKp"}]}' \
    > test.out 2>&1
eval_tap $? 6 'BatchDownloadServerLogs' test.out

#- 7 ListAllTerminatedServers
./ng net.accelbyte.sdk.cli.Main dslogmanager listAllTerminatedServers \
    --deployment '30PmPWWj' \
    --endDate 'qgz5Afc8' \
    --gameMode 'JKLjDPVA' \
    --limit '47' \
    --namespace "$AB_NAMESPACE" \
    --next 'l2qAZaCo' \
    --partyId 'D0BhvVjq' \
    --podName '3Nbuhf51' \
    --previous 'ig7aPqYA' \
    --provider '1aGIw343' \
    --region 'wKUVCQho' \
    --sessionId 'yhp8Dfmx' \
    --startDate 'hkRFxPkH' \
    --status 'd2YvThwt' \
    --userId '974lIboT' \
    > test.out 2>&1
eval_tap $? 7 'ListAllTerminatedServers' test.out

#- 8 PublicGetMessages
./ng net.accelbyte.sdk.cli.Main dslogmanager publicGetMessages \
    > test.out 2>&1
eval_tap $? 8 'PublicGetMessages' test.out


rm -f "tmp.dat"

exit $EXIT_CODE