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
    --limit '38' \
    --next 'Uboq0uxL' \
    --nodeIP '3h1xWwxD' \
    --previous 't3nxfH8a' \
    > test.out 2>&1
eval_tap $? 2 'ListNodesIPAddress' test.out

#- 3 DeleteNodeByID
./ng net.accelbyte.sdk.cli.Main dsartifact deleteNodeByID \
    --nodeIP 'MZ4yxjGI' \
    --podName '4ziavtX3' \
    > test.out 2>&1
eval_tap $? 3 'DeleteNodeByID' test.out

#- 4 ListQueue
./ng net.accelbyte.sdk.cli.Main dsartifact listQueue \
    --limit '99' \
    --next 'Su3EQrae' \
    --previous 'aDnLAEvV' \
    --nodeIP 'DAUfbCAk' \
    > test.out 2>&1
eval_tap $? 4 'ListQueue' test.out

#- 5 GetActiveQueue
./ng net.accelbyte.sdk.cli.Main dsartifact getActiveQueue \
    --nodeIP 'iqrLjORT' \
    > test.out 2>&1
eval_tap $? 5 'GetActiveQueue' test.out

#- 6 SetActiveQueue
./ng net.accelbyte.sdk.cli.Main dsartifact setActiveQueue \
    --nodeIP 'o4PZc203' \
    --podName '5cR777t7' \
    > test.out 2>&1
eval_tap $? 6 'SetActiveQueue' test.out

#- 7 DeleteActiveQueue
./ng net.accelbyte.sdk.cli.Main dsartifact deleteActiveQueue \
    --nodeIP 'Ku4TxsoH' \
    > test.out 2>&1
eval_tap $? 7 'DeleteActiveQueue' test.out

#- 8 ReportFailedUpload
./ng net.accelbyte.sdk.cli.Main dsartifact reportFailedUpload \
    --nodeIP 'LV2N5X6u' \
    --podName 'IDh8Vtbw' \
    > test.out 2>&1
eval_tap $? 8 'ReportFailedUpload' test.out

#- 9 DeleteQueue
./ng net.accelbyte.sdk.cli.Main dsartifact deleteQueue \
    --namespace "$AB_NAMESPACE" \
    --nodeIP 'boUw9d5I' \
    --podName 'klvQynok' \
    > test.out 2>&1
eval_tap $? 9 'DeleteQueue' test.out

#- 10 ListAllActiveQueue
./ng net.accelbyte.sdk.cli.Main dsartifact listAllActiveQueue \
    --namespace "$AB_NAMESPACE" \
    --limit '93' \
    --next 'AajbwpV1' \
    --nodeIP 'gN5EwoEr' \
    --podName 'gA5MHPzE' \
    --previous 'pDcvgHOj' \
    > test.out 2>&1
eval_tap $? 10 'ListAllActiveQueue' test.out

#- 11 ListAllQueue
./ng net.accelbyte.sdk.cli.Main dsartifact listAllQueue \
    --namespace "$AB_NAMESPACE" \
    --excludeUploading  \
    --limit '75' \
    --next 'kqt0iBsd' \
    --nodeIP 'U2vmspFR' \
    --order 'McCWLXAq' \
    --podName '9VoGUO2p' \
    --previous '0mKseuwh' \
    > test.out 2>&1
eval_tap $? 11 'ListAllQueue' test.out

#- 12 ListTerminatedServersWithNamespace
./ng net.accelbyte.sdk.cli.Main dsartifact listTerminatedServersWithNamespace \
    --namespace "$AB_NAMESPACE" \
    --deployment 'L6E0Qa0t' \
    --gameMode 'KZTue8sc' \
    --limit '57' \
    --next '4dmT18Pw' \
    --partyId 'j5gTfwm7' \
    --podName 'C6r1YKkn' \
    --previous 'ijxOMaMY' \
    --provider '2iKheHMV' \
    --region '2rEJaS6p' \
    --sessionId 'fgykMfq2' \
    --userId 'PSlkocBn' \
    > test.out 2>&1
eval_tap $? 12 'ListTerminatedServersWithNamespace' test.out

#- 13 DownloadServerArtifacts
./ng net.accelbyte.sdk.cli.Main dsartifact downloadServerArtifacts \
    --namespace "$AB_NAMESPACE" \
    --podName 'VDQwhm6l' \
    > test.out 2>&1
eval_tap $? 13 'DownloadServerArtifacts' test.out

#- 14 CheckServerArtifact
./ng net.accelbyte.sdk.cli.Main dsartifact checkServerArtifact \
    --namespace "$AB_NAMESPACE" \
    --podName 'KQ3o05wH' \
    > test.out 2>&1
eval_tap $? 14 'CheckServerArtifact' test.out

#- 15 ListTerminatedServers
./ng net.accelbyte.sdk.cli.Main dsartifact listTerminatedServers \
    --deployment 'mAPW1yuT' \
    --gameMode 'FAlTSz09' \
    --limit '96' \
    --next 'ls0czrgi' \
    --partyId 'EjwVW05q' \
    --podName 'kQfwyTjI' \
    --previous 'lhQHL3SK' \
    --provider 'Lb0WieVa' \
    --region 'D7B9yys4' \
    --sessionId 'YP5fqd4Z' \
    --userId 'mjKRFaQJ' \
    > test.out 2>&1
eval_tap $? 15 'ListTerminatedServers' test.out

#- 16 PublicGetMessages
./ng net.accelbyte.sdk.cli.Main dsartifact publicGetMessages \
    > test.out 2>&1
eval_tap $? 16 'PublicGetMessages' test.out


rm -f "tmp.dat"

exit $EXIT_CODE