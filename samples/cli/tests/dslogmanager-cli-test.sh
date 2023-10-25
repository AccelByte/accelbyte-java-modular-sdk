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
    --podName 'rgfsqb7Y' \
    --logType '5UQHDHGS' \
    --offset '45' \
    --origin 'fejZm6cT' \
    > test.out 2>&1
eval_tap $? 2 'GetServerLogs' test.out

#- 3 ListTerminatedServers
./ng net.accelbyte.sdk.cli.Main dslogmanager listTerminatedServers \
    --namespace "$AB_NAMESPACE" \
    --deployment 'bfu6YEvk' \
    --endDate 'k4Kiioh7' \
    --gameMode 'bote5xOD' \
    --limit '44' \
    --next 'xnptc0r7' \
    --partyId 'pwfv82Ik' \
    --podName 'r2MiEd9w' \
    --previous 'z8lcOnpC' \
    --provider 'xOIol6ur' \
    --region '9ZPzwXM5' \
    --sessionId '9YXUNAE4' \
    --source '6nsL8ZBb' \
    --startDate 'LcLak1th' \
    --status 'X0PcR7hn' \
    --userId 'zesYZlPN' \
    > test.out 2>&1
eval_tap $? 3 'ListTerminatedServers' test.out

#- 4 DownloadServerLogs
./ng net.accelbyte.sdk.cli.Main dslogmanager downloadServerLogs \
    --namespace "$AB_NAMESPACE" \
    --podName 'vT2HxOr5' \
    > test.out 2>&1
eval_tap $? 4 'DownloadServerLogs' test.out

#- 5 CheckServerLogs
./ng net.accelbyte.sdk.cli.Main dslogmanager checkServerLogs \
    --namespace "$AB_NAMESPACE" \
    --podName 'TTssmMdk' \
    > test.out 2>&1
eval_tap $? 5 'CheckServerLogs' test.out

#- 6 BatchDownloadServerLogs
./ng net.accelbyte.sdk.cli.Main dslogmanager batchDownloadServerLogs \
    --body '{"Downloads": [{"alloc_id": "U7feFGfy", "namespace": "kgqBJhCw", "pod_name": "vX85hWbP"}, {"alloc_id": "MN51wHBp", "namespace": "CzuvXjHL", "pod_name": "6NyhgfEf"}, {"alloc_id": "CagLMtr5", "namespace": "UCg8pUsL", "pod_name": "bVfXoKkp"}]}' \
    > test.out 2>&1
eval_tap $? 6 'BatchDownloadServerLogs' test.out

#- 7 ListAllTerminatedServers
./ng net.accelbyte.sdk.cli.Main dslogmanager listAllTerminatedServers \
    --deployment 'SFNuS3uH' \
    --endDate 'kF2VvPoz' \
    --gameMode '3HDH5tEA' \
    --limit '68' \
    --namespace "$AB_NAMESPACE" \
    --next '9A5AMowZ' \
    --partyId 'I4OGoWkA' \
    --podName 'sIfLC7ZD' \
    --previous 'ArSuk1m9' \
    --provider 'OOwVnXYa' \
    --region 'DiFIQ88n' \
    --sessionId '2aWIpuFh' \
    --startDate 'LHTfcE57' \
    --status 'hwfJh1Mn' \
    --userId 'FXWuUNdd' \
    > test.out 2>&1
eval_tap $? 7 'ListAllTerminatedServers' test.out

#- 8 PublicGetMessages
./ng net.accelbyte.sdk.cli.Main dslogmanager publicGetMessages \
    > test.out 2>&1
eval_tap $? 8 'PublicGetMessages' test.out


rm -f "tmp.dat"

exit $EXIT_CODE