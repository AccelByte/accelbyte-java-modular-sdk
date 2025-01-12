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
    --podName '7sZ5Zh6d' \
    --logType 'v4P8STal' \
    --offset '92' \
    --origin 'EdltuhS5' \
    > test.out 2>&1
eval_tap $? 2 'GetServerLogs' test.out

#- 3 ListTerminatedServers
./ng net.accelbyte.sdk.cli.Main dslogmanager listTerminatedServers \
    --namespace "$AB_NAMESPACE" \
    --deployment 'psxYMkXa' \
    --endDate 'Clp4Geup' \
    --gameMode 'AMQWx2uX' \
    --limit '26' \
    --next '2kyAECzK' \
    --partyId 'gr86ENII' \
    --podName 'FAYLV5s4' \
    --previous 'zzw4bzTs' \
    --provider 'k3TmNhz8' \
    --region 'rLJysfgz' \
    --sessionId 'iqJhKWRY' \
    --source '3rY5b9Im' \
    --startDate 'piRtlYeB' \
    --status 'v6i50YKI' \
    --userId 'NOsr64Bb' \
    > test.out 2>&1
eval_tap $? 3 'ListTerminatedServers' test.out

#- 4 DownloadServerLogs
./ng net.accelbyte.sdk.cli.Main dslogmanager downloadServerLogs \
    --namespace "$AB_NAMESPACE" \
    --podName 'byrUkBol' \
    > test.out 2>&1
eval_tap $? 4 'DownloadServerLogs' test.out

#- 5 CheckServerLogs
./ng net.accelbyte.sdk.cli.Main dslogmanager checkServerLogs \
    --namespace "$AB_NAMESPACE" \
    --podName 'GFB9J2wf' \
    > test.out 2>&1
eval_tap $? 5 'CheckServerLogs' test.out

#- 6 BatchDownloadServerLogs
./ng net.accelbyte.sdk.cli.Main dslogmanager batchDownloadServerLogs \
    --body '{"Downloads": [{"alloc_id": "fkYmbH4Q", "namespace": "hQD7oQN4", "pod_name": "XJUVOGGk"}, {"alloc_id": "33TPX6xS", "namespace": "BHY1d1e0", "pod_name": "eR1sM3Nl"}, {"alloc_id": "7FaSzmPe", "namespace": "3G3Dnr7g", "pod_name": "68PU1eEN"}]}' \
    > test.out 2>&1
eval_tap $? 6 'BatchDownloadServerLogs' test.out

#- 7 ListMetadataServers
./ng net.accelbyte.sdk.cli.Main dslogmanager listMetadataServers \
    --body '{"pod_names": ["Mw9OE8EX", "qJrjyW8G", "TqL0qBk3"]}' \
    > test.out 2>&1
eval_tap $? 7 'ListMetadataServers' test.out

#- 8 ListAllTerminatedServers
./ng net.accelbyte.sdk.cli.Main dslogmanager listAllTerminatedServers \
    --deployment 'K290aJZc' \
    --endDate 'hvtCbc6x' \
    --gameMode 'YXyY8xHZ' \
    --limit '13' \
    --namespace "$AB_NAMESPACE" \
    --next 'vywUv2o9' \
    --partyId 'LFBhjCKW' \
    --podName 'dKOdWus9' \
    --previous 'BWqteEYV' \
    --provider 'QXuPQgfo' \
    --region 'tx9n1BAO' \
    --sessionId 'TsEFYrjg' \
    --startDate '86icCSf2' \
    --status 'zvpuBhaT' \
    --userId 'QPZmgB5w' \
    > test.out 2>&1
eval_tap $? 8 'ListAllTerminatedServers' test.out

#- 9 PublicGetMessages
./ng net.accelbyte.sdk.cli.Main dslogmanager publicGetMessages \
    > test.out 2>&1
eval_tap $? 9 'PublicGetMessages' test.out


rm -f "tmp.dat"

exit $EXIT_CODE