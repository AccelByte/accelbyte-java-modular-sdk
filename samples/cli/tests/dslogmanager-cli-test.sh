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
    --podName 'P54kurbx' \
    --logType 'L4Nd3x4o' \
    --offset '32' \
    --origin 'PQi1pkvn' \
    > test.out 2>&1
eval_tap $? 2 'GetServerLogs' test.out

#- 3 ListTerminatedServers
./ng net.accelbyte.sdk.cli.Main dslogmanager listTerminatedServers \
    --namespace "$AB_NAMESPACE" \
    --deployment 't6g3Gw7f' \
    --endDate 'jdwl87EV' \
    --gameMode 'wDPyVeJS' \
    --limit '37' \
    --next 'yIR63l1m' \
    --partyId 'V7H9nEv8' \
    --podName 'qJ25i9XO' \
    --previous 'bMQEE5fC' \
    --provider 'vj7UZjSP' \
    --region 'k5CyUuFR' \
    --sessionId 'UFgpwMvO' \
    --source 'J5b6AvZi' \
    --startDate 'vy82CqVc' \
    --status 'nU7bbIWt' \
    --userId 'qKbdA7nr' \
    > test.out 2>&1
eval_tap $? 3 'ListTerminatedServers' test.out

#- 4 DownloadServerLogs
./ng net.accelbyte.sdk.cli.Main dslogmanager downloadServerLogs \
    --namespace "$AB_NAMESPACE" \
    --podName 'lEf2u9ao' \
    > test.out 2>&1
eval_tap $? 4 'DownloadServerLogs' test.out

#- 5 CheckServerLogs
./ng net.accelbyte.sdk.cli.Main dslogmanager checkServerLogs \
    --namespace "$AB_NAMESPACE" \
    --podName 'cAyQT0fI' \
    > test.out 2>&1
eval_tap $? 5 'CheckServerLogs' test.out

#- 6 BatchDownloadServerLogs
./ng net.accelbyte.sdk.cli.Main dslogmanager batchDownloadServerLogs \
    --body '{"Downloads": [{"alloc_id": "qPaILYJJ", "namespace": "5EraFZOZ", "pod_name": "sInnnXF6"}, {"alloc_id": "t3gxMAHZ", "namespace": "4yvgren5", "pod_name": "qk7wG0Of"}, {"alloc_id": "XYcvUJb7", "namespace": "frOZ9FK5", "pod_name": "c1rq0hBt"}]}' \
    > test.out 2>&1
eval_tap $? 6 'BatchDownloadServerLogs' test.out

#- 7 ListAllTerminatedServers
./ng net.accelbyte.sdk.cli.Main dslogmanager listAllTerminatedServers \
    --deployment 'eUtSQfI4' \
    --endDate '9wEGBPh4' \
    --gameMode 'fkPbF9Ro' \
    --limit '30' \
    --namespace "$AB_NAMESPACE" \
    --next 'lLW6u2uK' \
    --partyId 'qsE1u1aD' \
    --podName 'LGhWvovx' \
    --previous 'aSHZKuvr' \
    --provider '7tXd0GXT' \
    --region 'd77r86Lf' \
    --sessionId '3dbpsyiR' \
    --startDate 'TxL5MCkJ' \
    --status 'JK7Ct61v' \
    --userId 'pnDjubCL' \
    > test.out 2>&1
eval_tap $? 7 'ListAllTerminatedServers' test.out

#- 8 PublicGetMessages
./ng net.accelbyte.sdk.cli.Main dslogmanager publicGetMessages \
    > test.out 2>&1
eval_tap $? 8 'PublicGetMessages' test.out


rm -f "tmp.dat"

exit $EXIT_CODE