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
    --podName 'v1vDhVSZ' \
    --logType '3PzzgFPZ' \
    --offset '40' \
    --origin 'y83jO4KP' \
    > test.out 2>&1
eval_tap $? 2 'GetServerLogs' test.out

#- 3 ListTerminatedServers
./ng net.accelbyte.sdk.cli.Main dslogmanager listTerminatedServers \
    --namespace "$AB_NAMESPACE" \
    --deployment 'ckeiIHoG' \
    --endDate 'oo81ELak' \
    --gameMode '5T2SwLW2' \
    --limit '41' \
    --next 'D7GDjvPV' \
    --partyId 'e5tMNwjL' \
    --podName 'hVXNgWYe' \
    --previous '9be1kfbP' \
    --provider 'ds9JiBiJ' \
    --region 'rNJNayGI' \
    --sessionId 'KtAEHfsR' \
    --source 'zMx30LrC' \
    --startDate 'jfv2u1Bg' \
    --status '1Mg88Neg' \
    --userId 'hXBUdBuJ' \
    > test.out 2>&1
eval_tap $? 3 'ListTerminatedServers' test.out

#- 4 DownloadServerLogs
./ng net.accelbyte.sdk.cli.Main dslogmanager downloadServerLogs \
    --namespace "$AB_NAMESPACE" \
    --podName 'ZEoYLthJ' \
    > test.out 2>&1
eval_tap $? 4 'DownloadServerLogs' test.out

#- 5 CheckServerLogs
./ng net.accelbyte.sdk.cli.Main dslogmanager checkServerLogs \
    --namespace "$AB_NAMESPACE" \
    --podName 'p6XDHIOR' \
    > test.out 2>&1
eval_tap $? 5 'CheckServerLogs' test.out

#- 6 BatchDownloadServerLogs
./ng net.accelbyte.sdk.cli.Main dslogmanager batchDownloadServerLogs \
    --body '{"Downloads": [{"alloc_id": "GWofUjD0", "namespace": "lVJI1b8h", "pod_name": "ddY8yTiW"}, {"alloc_id": "7eV2JCsr", "namespace": "gXvJhfmV", "pod_name": "zELvI5T1"}, {"alloc_id": "11cSpxb3", "namespace": "m1OGIDqf", "pod_name": "9Ut0JzYH"}]}' \
    > test.out 2>&1
eval_tap $? 6 'BatchDownloadServerLogs' test.out

#- 7 ListMetadataServers
./ng net.accelbyte.sdk.cli.Main dslogmanager listMetadataServers \
    --body '{"pod_names": ["jhqZH4vT", "6qknnbYc", "8TpYZNGo"]}' \
    > test.out 2>&1
eval_tap $? 7 'ListMetadataServers' test.out

#- 8 ListAllTerminatedServers
./ng net.accelbyte.sdk.cli.Main dslogmanager listAllTerminatedServers \
    --deployment 'RlLwrOsE' \
    --endDate 'jLQeszk8' \
    --gameMode '9FUEKRFM' \
    --limit '71' \
    --namespace "$AB_NAMESPACE" \
    --next 'xmIrKU5V' \
    --partyId 'i3iJsyKO' \
    --podName 'L2Z0oiug' \
    --previous 'EwBbT8xD' \
    --provider 'EYrox6F9' \
    --region '9qvCNdoy' \
    --sessionId 'vyz4wymc' \
    --startDate 'D7Cketjr' \
    --status '6HFgqFPk' \
    --userId 'EWcJ0PA8' \
    > test.out 2>&1
eval_tap $? 8 'ListAllTerminatedServers' test.out

#- 9 PublicGetMessages
./ng net.accelbyte.sdk.cli.Main dslogmanager publicGetMessages \
    > test.out 2>&1
eval_tap $? 9 'PublicGetMessages' test.out


rm -f "tmp.dat"

exit $EXIT_CODE