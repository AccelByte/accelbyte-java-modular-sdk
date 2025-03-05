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
echo "1..16"

#- 1 Login
./ng net.accelbyte.sdk.cli.Main loginClient \
    > test.out 2>&1
eval_tap $? 1 'Login' test.out

if [ $EXIT_CODE -ne 0 ]; then
  echo "Bail out! Login failed."
  exit $EXIT_CODE
fi

touch "tmp.dat"

#- 2 ListNodesIPAddress
./ng net.accelbyte.sdk.cli.Main dsartifact listNodesIPAddress \
    --limit '32' \
    --next 'SNa6IlWN' \
    --nodeIP '8ajqQIDu' \
    --previous 'k9L0jXwV' \
    > test.out 2>&1
eval_tap $? 2 'ListNodesIPAddress' test.out

#- 3 DeleteNodeByID
./ng net.accelbyte.sdk.cli.Main dsartifact deleteNodeByID \
    --nodeIP 'IswVMvLV' \
    --podName 'kxDKofFD' \
    > test.out 2>&1
eval_tap $? 3 'DeleteNodeByID' test.out

#- 4 ListQueue
./ng net.accelbyte.sdk.cli.Main dsartifact listQueue \
    --limit '73' \
    --next 'xmJ1gBry' \
    --previous '5hiHSP0n' \
    --nodeIP '6up0UHju' \
    > test.out 2>&1
eval_tap $? 4 'ListQueue' test.out

#- 5 GetActiveQueue
./ng net.accelbyte.sdk.cli.Main dsartifact getActiveQueue \
    --nodeIP 'ahfSuxuX' \
    > test.out 2>&1
eval_tap $? 5 'GetActiveQueue' test.out

#- 6 SetActiveQueue
./ng net.accelbyte.sdk.cli.Main dsartifact setActiveQueue \
    --nodeIP 'BQLPPCU2' \
    --podName 'DRmwCSf5' \
    > test.out 2>&1
eval_tap $? 6 'SetActiveQueue' test.out

#- 7 DeleteActiveQueue
./ng net.accelbyte.sdk.cli.Main dsartifact deleteActiveQueue \
    --nodeIP 'IM538Uvh' \
    > test.out 2>&1
eval_tap $? 7 'DeleteActiveQueue' test.out

#- 8 ReportFailedUpload
./ng net.accelbyte.sdk.cli.Main dsartifact reportFailedUpload \
    --nodeIP 'd3Rzs5Ar' \
    --podName 'astDiG0i' \
    > test.out 2>&1
eval_tap $? 8 'ReportFailedUpload' test.out

#- 9 DeleteQueue
./ng net.accelbyte.sdk.cli.Main dsartifact deleteQueue \
    --namespace "$AB_NAMESPACE" \
    --nodeIP 'JUQi4xkt' \
    --podName 'gdqm0X80' \
    > test.out 2>&1
eval_tap $? 9 'DeleteQueue' test.out

#- 10 ListAllActiveQueue
./ng net.accelbyte.sdk.cli.Main dsartifact listAllActiveQueue \
    --namespace "$AB_NAMESPACE" \
    --limit '80' \
    --next 'svfydO0P' \
    --nodeIP 'pjcr2URj' \
    --podName 'xCIYxfQt' \
    --previous 'tbYkQOe4' \
    > test.out 2>&1
eval_tap $? 10 'ListAllActiveQueue' test.out

#- 11 ListAllQueue
./ng net.accelbyte.sdk.cli.Main dsartifact listAllQueue \
    --namespace "$AB_NAMESPACE" \
    --excludeUploading  \
    --limit '16' \
    --next 'pMDPYEZt' \
    --nodeIP 'MEI1C2MT' \
    --order '0b8LHE6G' \
    --podName '1UXEBqJE' \
    --previous 'UR438xVM' \
    > test.out 2>&1
eval_tap $? 11 'ListAllQueue' test.out

#- 12 ListTerminatedServersWithNamespace
./ng net.accelbyte.sdk.cli.Main dsartifact listTerminatedServersWithNamespace \
    --namespace "$AB_NAMESPACE" \
    --deployment 'yFxe2lRx' \
    --gameMode 'yOyoNHYV' \
    --limit '79' \
    --next 'z8b79U6v' \
    --partyId 'qk6u9Wci' \
    --podName '8iGw6NK9' \
    --previous 'GtPIQ0xs' \
    --provider '20ZhZ301' \
    --region 'wzL6npjz' \
    --sessionId 'OX0cfavP' \
    --userId 'RQnEmUAt' \
    > test.out 2>&1
eval_tap $? 12 'ListTerminatedServersWithNamespace' test.out

#- 13 DownloadServerArtifacts
./ng net.accelbyte.sdk.cli.Main dsartifact downloadServerArtifacts \
    --namespace "$AB_NAMESPACE" \
    --podName 'o2YbhAkQ' \
    > test.out 2>&1
eval_tap $? 13 'DownloadServerArtifacts' test.out

#- 14 CheckServerArtifact
./ng net.accelbyte.sdk.cli.Main dsartifact checkServerArtifact \
    --namespace "$AB_NAMESPACE" \
    --podName '774uiarg' \
    > test.out 2>&1
eval_tap $? 14 'CheckServerArtifact' test.out

#- 15 ListTerminatedServers
./ng net.accelbyte.sdk.cli.Main dsartifact listTerminatedServers \
    --deployment 'GZzGu5Rk' \
    --gameMode 'fb0L71fm' \
    --limit '4' \
    --next 'ED3ZBEkR' \
    --partyId '4zxY1uOk' \
    --podName 'wBDJuDAr' \
    --previous 'pzUTYeAT' \
    --provider 'gKU9LcnA' \
    --region '2GUN2QkT' \
    --sessionId 'DJVbU9Eh' \
    --userId 'XPGCBZ3F' \
    > test.out 2>&1
eval_tap $? 15 'ListTerminatedServers' test.out

#- 16 PublicGetMessages
./ng net.accelbyte.sdk.cli.Main dsartifact publicGetMessages \
    > test.out 2>&1
eval_tap $? 16 'PublicGetMessages' test.out


rm -f "tmp.dat"

exit $EXIT_CODE