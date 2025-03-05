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
    --podName '1pZwY6ih' \
    --logType 'cRXbhlPC' \
    --offset '23' \
    --origin 'zcPRphCQ' \
    > test.out 2>&1
eval_tap $? 2 'GetServerLogs' test.out

#- 3 ListTerminatedServers
./ng net.accelbyte.sdk.cli.Main dslogmanager listTerminatedServers \
    --namespace "$AB_NAMESPACE" \
    --deployment 'xzrK3ukx' \
    --endDate 'FfQHIj4K' \
    --gameMode 'Oc1DBepo' \
    --limit '3' \
    --next 'qdLdMBn5' \
    --partyId 'mecgh9b9' \
    --podName 'ZDekSNV1' \
    --previous 'VExQNOPr' \
    --provider 'hB3FxufB' \
    --region 'dH2kys4k' \
    --sessionId 'isSnHdB4' \
    --source 'dBTyaSj0' \
    --startDate '2heHwedz' \
    --status 'QWTdVaqH' \
    --userId 'faw4iRrn' \
    > test.out 2>&1
eval_tap $? 3 'ListTerminatedServers' test.out

#- 4 DownloadServerLogs
./ng net.accelbyte.sdk.cli.Main dslogmanager downloadServerLogs \
    --namespace "$AB_NAMESPACE" \
    --podName 'JEBy0plw' \
    > test.out 2>&1
eval_tap $? 4 'DownloadServerLogs' test.out

#- 5 CheckServerLogs
./ng net.accelbyte.sdk.cli.Main dslogmanager checkServerLogs \
    --namespace "$AB_NAMESPACE" \
    --podName '8nWlsG6U' \
    > test.out 2>&1
eval_tap $? 5 'CheckServerLogs' test.out

#- 6 BatchDownloadServerLogs
./ng net.accelbyte.sdk.cli.Main dslogmanager batchDownloadServerLogs \
    --body '{"Downloads": [{"alloc_id": "z020vYhH", "namespace": "sEpVDKj0", "pod_name": "oKaDPTKk"}, {"alloc_id": "ZpMocOJ8", "namespace": "Y9xgxYO6", "pod_name": "8XaS6JCX"}, {"alloc_id": "RFSXBOk9", "namespace": "sFZeALHb", "pod_name": "G371TSFE"}]}' \
    > test.out 2>&1
eval_tap $? 6 'BatchDownloadServerLogs' test.out

#- 7 ListMetadataServers
./ng net.accelbyte.sdk.cli.Main dslogmanager listMetadataServers \
    --body '{"pod_names": ["CmAWbdeS", "URGDv7Yo", "43XiqqX8"]}' \
    > test.out 2>&1
eval_tap $? 7 'ListMetadataServers' test.out

#- 8 ListAllTerminatedServers
./ng net.accelbyte.sdk.cli.Main dslogmanager listAllTerminatedServers \
    --deployment 'BpaC37nh' \
    --endDate 'E3IuNYJo' \
    --gameMode 'J3pCSqFh' \
    --limit '81' \
    --namespace "$AB_NAMESPACE" \
    --next 'x1ODl8FL' \
    --partyId 'J0e6gAHb' \
    --podName 'QP15qzrJ' \
    --previous 'MMEoVLTg' \
    --provider 'nfhQHfsm' \
    --region 'bLP7h1J3' \
    --sessionId 'BwjZFY8R' \
    --startDate 'hfe4DIAa' \
    --status 'oKRGHich' \
    --userId 'TJ8txSC9' \
    > test.out 2>&1
eval_tap $? 8 'ListAllTerminatedServers' test.out

#- 9 PublicGetMessages
./ng net.accelbyte.sdk.cli.Main dslogmanager publicGetMessages \
    > test.out 2>&1
eval_tap $? 9 'PublicGetMessages' test.out


rm -f "tmp.dat"

exit $EXIT_CODE