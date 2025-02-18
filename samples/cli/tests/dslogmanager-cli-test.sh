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
    --podName 'eyBBHw9M' \
    --logType '58UaY3GU' \
    --offset '2' \
    --origin 'INX3FJoo' \
    > test.out 2>&1
eval_tap $? 2 'GetServerLogs' test.out

#- 3 ListTerminatedServers
./ng net.accelbyte.sdk.cli.Main dslogmanager listTerminatedServers \
    --namespace "$AB_NAMESPACE" \
    --deployment 'P3ywef4j' \
    --endDate 'VcpVtKCm' \
    --gameMode 'f5uFEqrs' \
    --limit '89' \
    --next 'an1CHh2V' \
    --partyId 'McLu5g9d' \
    --podName 'tYsCpy2h' \
    --previous '4N7Ssp5K' \
    --provider 'ljRzPLim' \
    --region 'VeoIz9m3' \
    --sessionId '3WPLmL0D' \
    --source '2YqrOv7Y' \
    --startDate 'MKeDVJ5N' \
    --status '3TqafBl5' \
    --userId 'ngHHcrAI' \
    > test.out 2>&1
eval_tap $? 3 'ListTerminatedServers' test.out

#- 4 DownloadServerLogs
./ng net.accelbyte.sdk.cli.Main dslogmanager downloadServerLogs \
    --namespace "$AB_NAMESPACE" \
    --podName 'wnYAgXpd' \
    > test.out 2>&1
eval_tap $? 4 'DownloadServerLogs' test.out

#- 5 CheckServerLogs
./ng net.accelbyte.sdk.cli.Main dslogmanager checkServerLogs \
    --namespace "$AB_NAMESPACE" \
    --podName '7xrJSXuf' \
    > test.out 2>&1
eval_tap $? 5 'CheckServerLogs' test.out

#- 6 BatchDownloadServerLogs
./ng net.accelbyte.sdk.cli.Main dslogmanager batchDownloadServerLogs \
    --body '{"Downloads": [{"alloc_id": "NCdNGoRg", "namespace": "rJ8UFt4N", "pod_name": "SorAkRp5"}, {"alloc_id": "TMAoYbnk", "namespace": "B7SwDkAH", "pod_name": "zzs5RacQ"}, {"alloc_id": "JJNX6zQd", "namespace": "2R7fxx2y", "pod_name": "naX28WPh"}]}' \
    > test.out 2>&1
eval_tap $? 6 'BatchDownloadServerLogs' test.out

#- 7 ListMetadataServers
./ng net.accelbyte.sdk.cli.Main dslogmanager listMetadataServers \
    --body '{"pod_names": ["eCmitEmZ", "qjK6ZLRS", "eHi5H95i"]}' \
    > test.out 2>&1
eval_tap $? 7 'ListMetadataServers' test.out

#- 8 ListAllTerminatedServers
./ng net.accelbyte.sdk.cli.Main dslogmanager listAllTerminatedServers \
    --deployment 'JjxxE9Oc' \
    --endDate 'fdA4SHjM' \
    --gameMode 'wgaejiaF' \
    --limit '97' \
    --namespace "$AB_NAMESPACE" \
    --next '8Lwu7YU8' \
    --partyId '2DcjMswp' \
    --podName 'RNkmf61C' \
    --previous 'CzOzAZQD' \
    --provider 'fdeiMxn4' \
    --region 'Bed3CKpx' \
    --sessionId 'iHMGc03A' \
    --startDate 'MNVeI88H' \
    --status '881wErLy' \
    --userId 'urxyE7L5' \
    > test.out 2>&1
eval_tap $? 8 'ListAllTerminatedServers' test.out

#- 9 PublicGetMessages
./ng net.accelbyte.sdk.cli.Main dslogmanager publicGetMessages \
    > test.out 2>&1
eval_tap $? 9 'PublicGetMessages' test.out


rm -f "tmp.dat"

exit $EXIT_CODE