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
    --podName 'Osayg6Bn' \
    --logType 'NzlWmtc6' \
    --offset '68' \
    --origin 'DlZxNjkU' \
    > test.out 2>&1
eval_tap $? 2 'GetServerLogs' test.out

#- 3 ListTerminatedServers
./ng net.accelbyte.sdk.cli.Main dslogmanager listTerminatedServers \
    --namespace "$AB_NAMESPACE" \
    --deployment 'QTVQBGNk' \
    --endDate 'pcHw2eWN' \
    --gameMode 'AEAPp1CD' \
    --limit '57' \
    --next '3sqLlFD5' \
    --partyId 'ajyAcGB1' \
    --podName 'Uvuoxs1y' \
    --previous 'HSUlTrRn' \
    --provider 'SjBhKdLQ' \
    --region 'YkVTHjgz' \
    --sessionId 'pP37qxhG' \
    --source 'y8rdjoae' \
    --startDate 'KmIwpc1i' \
    --status 'vX2cwmYO' \
    --userId 'ff1oq195' \
    > test.out 2>&1
eval_tap $? 3 'ListTerminatedServers' test.out

#- 4 DownloadServerLogs
./ng net.accelbyte.sdk.cli.Main dslogmanager downloadServerLogs \
    --namespace "$AB_NAMESPACE" \
    --podName 'nZWCv2Vd' \
    > test.out 2>&1
eval_tap $? 4 'DownloadServerLogs' test.out

#- 5 CheckServerLogs
./ng net.accelbyte.sdk.cli.Main dslogmanager checkServerLogs \
    --namespace "$AB_NAMESPACE" \
    --podName 'pmPiabpT' \
    > test.out 2>&1
eval_tap $? 5 'CheckServerLogs' test.out

#- 6 BatchDownloadServerLogs
./ng net.accelbyte.sdk.cli.Main dslogmanager batchDownloadServerLogs \
    --body '{"Downloads": [{"alloc_id": "uCULen2a", "namespace": "3f3l7Ccs", "pod_name": "2HPQLZV0"}, {"alloc_id": "2lZsy1Cq", "namespace": "12xIBdH1", "pod_name": "3QvIjCfI"}, {"alloc_id": "ZgMF658k", "namespace": "rgwIxkZY", "pod_name": "vnE42h7g"}]}' \
    > test.out 2>&1
eval_tap $? 6 'BatchDownloadServerLogs' test.out

#- 7 ListMetadataServers
./ng net.accelbyte.sdk.cli.Main dslogmanager listMetadataServers \
    --body '{"pod_names": ["haWP0YFz", "8Tardw3d", "wXAHRkGB"]}' \
    > test.out 2>&1
eval_tap $? 7 'ListMetadataServers' test.out

#- 8 ListAllTerminatedServers
./ng net.accelbyte.sdk.cli.Main dslogmanager listAllTerminatedServers \
    --deployment 'Yp8mmc3s' \
    --endDate 'R5bmEgcD' \
    --gameMode 'IQJXUO90' \
    --limit '24' \
    --namespace "$AB_NAMESPACE" \
    --next 'FCnRc8hO' \
    --partyId 'UnE3pSjP' \
    --podName '3OTdsmMt' \
    --previous 'NzDCDzPM' \
    --provider 'ao67cS7J' \
    --region 'yuGmj8QJ' \
    --sessionId 'vAnWgH0C' \
    --startDate 'ndQYJLsI' \
    --status 'bNq2D7S4' \
    --userId 'IgUkfHhK' \
    > test.out 2>&1
eval_tap $? 8 'ListAllTerminatedServers' test.out

#- 9 PublicGetMessages
./ng net.accelbyte.sdk.cli.Main dslogmanager publicGetMessages \
    > test.out 2>&1
eval_tap $? 9 'PublicGetMessages' test.out


rm -f "tmp.dat"

exit $EXIT_CODE