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
echo "1..96"

#- 1 Login
./ng net.accelbyte.sdk.cli.Main loginClient \
    > test.out 2>&1
eval_tap $? 1 'Login' test.out

if [ $EXIT_CODE -ne 0 ]; then
  echo "Bail out! Login failed."
  exit $EXIT_CODE
fi

touch "tmp.dat"

#- 2 AdminListAdminGameRecordV1
./ng net.accelbyte.sdk.cli.Main cloudsave adminListAdminGameRecordV1 \
    --namespace "$AB_NAMESPACE" \
    --limit '21' \
    --offset '66' \
    --query 'zJXS1ew5' \
    > test.out 2>&1
eval_tap $? 2 'AdminListAdminGameRecordV1' test.out

#- 3 AdminBulkGetAdminGameRecordV1
./ng net.accelbyte.sdk.cli.Main cloudsave adminBulkGetAdminGameRecordV1 \
    --namespace "$AB_NAMESPACE" \
    --body '{"keys": ["j1wEKlWl", "XUyf3rYJ", "tZum5JPt"]}' \
    > test.out 2>&1
eval_tap $? 3 'AdminBulkGetAdminGameRecordV1' test.out

#- 4 AdminGetAdminGameRecordV1
./ng net.accelbyte.sdk.cli.Main cloudsave adminGetAdminGameRecordV1 \
    --key 'SKWAelXu' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 4 'AdminGetAdminGameRecordV1' test.out

#- 5 AdminPutAdminGameRecordV1
./ng net.accelbyte.sdk.cli.Main cloudsave adminPutAdminGameRecordV1 \
    --key '4U9qgHZq' \
    --namespace "$AB_NAMESPACE" \
    --body '{}' \
    > test.out 2>&1
eval_tap $? 5 'AdminPutAdminGameRecordV1' test.out

#- 6 AdminPostAdminGameRecordV1
./ng net.accelbyte.sdk.cli.Main cloudsave adminPostAdminGameRecordV1 \
    --key 'wcgu86sk' \
    --namespace "$AB_NAMESPACE" \
    --body '{}' \
    > test.out 2>&1
eval_tap $? 6 'AdminPostAdminGameRecordV1' test.out

#- 7 AdminDeleteAdminGameRecordV1
./ng net.accelbyte.sdk.cli.Main cloudsave adminDeleteAdminGameRecordV1 \
    --key 'qZxEuDJq' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 7 'AdminDeleteAdminGameRecordV1' test.out

#- 8 AdminListGameBinaryRecordsV1
./ng net.accelbyte.sdk.cli.Main cloudsave adminListGameBinaryRecordsV1 \
    --namespace "$AB_NAMESPACE" \
    --limit '100' \
    --offset '99' \
    --query 'TeWs4Mu9' \
    > test.out 2>&1
eval_tap $? 8 'AdminListGameBinaryRecordsV1' test.out

#- 9 AdminPostGameBinaryRecordV1
./ng net.accelbyte.sdk.cli.Main cloudsave adminPostGameBinaryRecordV1 \
    --namespace "$AB_NAMESPACE" \
    --body '{"file_type": "6OUKHyQv", "key": "NU0YBtXS", "set_by": "CLIENT"}' \
    > test.out 2>&1
eval_tap $? 9 'AdminPostGameBinaryRecordV1' test.out

#- 10 AdminGetGameBinaryRecordV1
./ng net.accelbyte.sdk.cli.Main cloudsave adminGetGameBinaryRecordV1 \
    --key 'E48TeUn7' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 10 'AdminGetGameBinaryRecordV1' test.out

#- 11 AdminPutGameBinaryRecordV1
./ng net.accelbyte.sdk.cli.Main cloudsave adminPutGameBinaryRecordV1 \
    --key 'cSI2QrP9' \
    --namespace "$AB_NAMESPACE" \
    --body '{"content_type": "piGit6G5", "file_location": "gWfFiFHy"}' \
    > test.out 2>&1
eval_tap $? 11 'AdminPutGameBinaryRecordV1' test.out

#- 12 AdminDeleteGameBinaryRecordV1
./ng net.accelbyte.sdk.cli.Main cloudsave adminDeleteGameBinaryRecordV1 \
    --key 'fkGmxDuW' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 12 'AdminDeleteGameBinaryRecordV1' test.out

#- 13 AdminPutGameBinaryRecorMetadataV1
./ng net.accelbyte.sdk.cli.Main cloudsave adminPutGameBinaryRecorMetadataV1 \
    --key 'uoS0Mi2e' \
    --namespace "$AB_NAMESPACE" \
    --body '{"set_by": "SERVER"}' \
    > test.out 2>&1
eval_tap $? 13 'AdminPutGameBinaryRecorMetadataV1' test.out

#- 14 AdminPostGameBinaryPresignedURLV1
./ng net.accelbyte.sdk.cli.Main cloudsave adminPostGameBinaryPresignedURLV1 \
    --key '9PUA4cik' \
    --namespace "$AB_NAMESPACE" \
    --body '{"file_type": "6RfOCUln"}' \
    > test.out 2>&1
eval_tap $? 14 'AdminPostGameBinaryPresignedURLV1' test.out

#- 15 AdminPutAdminGameRecordConcurrentHandlerV1
./ng net.accelbyte.sdk.cli.Main cloudsave adminPutAdminGameRecordConcurrentHandlerV1 \
    --key '74Y5w7AM' \
    --namespace "$AB_NAMESPACE" \
    --body '{"updatedAt": "grtbCWHD", "value": {"u3p5mfDa": {}, "oOo1tgpO": {}, "GDJ4aOOi": {}}}' \
    > test.out 2>&1
eval_tap $? 15 'AdminPutAdminGameRecordConcurrentHandlerV1' test.out

#- 16 AdminPutGameRecordConcurrentHandlerV1
./ng net.accelbyte.sdk.cli.Main cloudsave adminPutGameRecordConcurrentHandlerV1 \
    --key 'L21NdkE4' \
    --namespace "$AB_NAMESPACE" \
    --body '{"set_by": "CLIENT", "updatedAt": "WamsB1MB", "value": {"KcUkXpcX": {}, "rRjaGM6L": {}, "B5bqKdf9": {}}}' \
    > test.out 2>&1
eval_tap $? 16 'AdminPutGameRecordConcurrentHandlerV1' test.out

#- 17 GetPluginConfig
./ng net.accelbyte.sdk.cli.Main cloudsave getPluginConfig \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 17 'GetPluginConfig' test.out

#- 18 CreatePluginConfig
./ng net.accelbyte.sdk.cli.Main cloudsave createPluginConfig \
    --namespace "$AB_NAMESPACE" \
    --body '{"appConfig": {"appName": "OEt3Ejl9"}, "customConfig": {"GRPCAddress": "zeismPr6"}, "customFunction": {"afterBulkReadGameBinaryRecord": true, "afterBulkReadGameRecord": true, "afterBulkReadPlayerBinaryRecord": true, "afterBulkReadPlayerRecord": true, "afterReadGameBinaryRecord": true, "afterReadGameRecord": false, "afterReadPlayerBinaryRecord": false, "afterReadPlayerRecord": false, "beforeWriteAdminGameRecord": false, "beforeWriteAdminPlayerRecord": true, "beforeWriteGameBinaryRecord": true, "beforeWriteGameRecord": false, "beforeWritePlayerBinaryRecord": false, "beforeWritePlayerRecord": true}, "extendType": "CUSTOM"}' \
    > test.out 2>&1
eval_tap $? 18 'CreatePluginConfig' test.out

#- 19 DeletePluginConfig
./ng net.accelbyte.sdk.cli.Main cloudsave deletePluginConfig \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 19 'DeletePluginConfig' test.out

#- 20 UpdatePluginConfig
./ng net.accelbyte.sdk.cli.Main cloudsave updatePluginConfig \
    --namespace "$AB_NAMESPACE" \
    --body '{"appConfig": {"appName": "0prs5KnC"}, "customConfig": {"GRPCAddress": "dlIxAqSr"}, "customFunction": {"afterBulkReadGameBinaryRecord": false, "afterBulkReadGameRecord": false, "afterBulkReadPlayerBinaryRecord": true, "afterBulkReadPlayerRecord": true, "afterReadGameBinaryRecord": false, "afterReadGameRecord": true, "afterReadPlayerBinaryRecord": true, "afterReadPlayerRecord": true, "beforeWriteAdminGameRecord": false, "beforeWriteAdminPlayerRecord": false, "beforeWriteGameBinaryRecord": true, "beforeWriteGameRecord": false, "beforeWritePlayerBinaryRecord": false, "beforeWritePlayerRecord": false}, "extendType": "CUSTOM"}' \
    > test.out 2>&1
eval_tap $? 20 'UpdatePluginConfig' test.out

#- 21 ListGameRecordsHandlerV1
./ng net.accelbyte.sdk.cli.Main cloudsave listGameRecordsHandlerV1 \
    --namespace "$AB_NAMESPACE" \
    --query 'mC5tmJz6' \
    --limit '85' \
    --offset '28' \
    > test.out 2>&1
eval_tap $? 21 'ListGameRecordsHandlerV1' test.out

#- 22 AdminGetGameRecordHandlerV1
./ng net.accelbyte.sdk.cli.Main cloudsave adminGetGameRecordHandlerV1 \
    --key 'EKd27T70' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 22 'AdminGetGameRecordHandlerV1' test.out

#- 23 AdminPutGameRecordHandlerV1
./ng net.accelbyte.sdk.cli.Main cloudsave adminPutGameRecordHandlerV1 \
    --key 'eb4tvO2v' \
    --namespace "$AB_NAMESPACE" \
    --body '{}' \
    > test.out 2>&1
eval_tap $? 23 'AdminPutGameRecordHandlerV1' test.out

#- 24 AdminPostGameRecordHandlerV1
./ng net.accelbyte.sdk.cli.Main cloudsave adminPostGameRecordHandlerV1 \
    --key '3Q0fqAEs' \
    --namespace "$AB_NAMESPACE" \
    --body '{}' \
    > test.out 2>&1
eval_tap $? 24 'AdminPostGameRecordHandlerV1' test.out

#- 25 AdminDeleteGameRecordHandlerV1
./ng net.accelbyte.sdk.cli.Main cloudsave adminDeleteGameRecordHandlerV1 \
    --key 'BNzgyUPP' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 25 'AdminDeleteGameRecordHandlerV1' test.out

#- 26 BulkGetAdminPlayerRecordByUserIdsV1
./ng net.accelbyte.sdk.cli.Main cloudsave bulkGetAdminPlayerRecordByUserIdsV1 \
    --key '6clL7G4S' \
    --namespace "$AB_NAMESPACE" \
    --body '{"userIds": ["LWMBwnyB", "UeUlIVIp", "ljVScR4W"]}' \
    > test.out 2>&1
eval_tap $? 26 'BulkGetAdminPlayerRecordByUserIdsV1' test.out

#- 27 BulkGetPlayerRecordSizeHandlerV1
./ng net.accelbyte.sdk.cli.Main cloudsave bulkGetPlayerRecordSizeHandlerV1 \
    --namespace "$AB_NAMESPACE" \
    --body '{"data": [{"keys": ["yc1U6EPO", "TthbIHb8", "cCRJu4q4"], "user_id": "Nmp4Pn04"}, {"keys": ["t24gyqE1", "STw4KM8B", "expcz8LL"], "user_id": "ltm6279s"}, {"keys": ["QZVbhaFA", "blTQboL6", "j0hqRZYk"], "user_id": "yvjNCCJE"}]}' \
    > test.out 2>&1
eval_tap $? 27 'BulkGetPlayerRecordSizeHandlerV1' test.out

#- 28 ListPlayerRecordHandlerV1
eval_tap 0 28 'ListPlayerRecordHandlerV1 # SKIP deprecated' test.out

#- 29 AdminListAdminUserRecordsV1
./ng net.accelbyte.sdk.cli.Main cloudsave adminListAdminUserRecordsV1 \
    --namespace "$AB_NAMESPACE" \
    --userId 'rUVKM5yg' \
    --limit '74' \
    --offset '17' \
    > test.out 2>&1
eval_tap $? 29 'AdminListAdminUserRecordsV1' test.out

#- 30 AdminBulkGetAdminPlayerRecordV1
./ng net.accelbyte.sdk.cli.Main cloudsave adminBulkGetAdminPlayerRecordV1 \
    --namespace "$AB_NAMESPACE" \
    --userId 'NaaBxS14' \
    --body '{"keys": ["4Xp5eqMI", "XpXrF2xc", "bjz1gnlp"]}' \
    > test.out 2>&1
eval_tap $? 30 'AdminBulkGetAdminPlayerRecordV1' test.out

#- 31 AdminGetAdminPlayerRecordV1
./ng net.accelbyte.sdk.cli.Main cloudsave adminGetAdminPlayerRecordV1 \
    --key 'm8WZtCyy' \
    --namespace "$AB_NAMESPACE" \
    --userId 'EwlaqU3p' \
    > test.out 2>&1
eval_tap $? 31 'AdminGetAdminPlayerRecordV1' test.out

#- 32 AdminPutAdminPlayerRecordV1
./ng net.accelbyte.sdk.cli.Main cloudsave adminPutAdminPlayerRecordV1 \
    --key 'i05Aj2Zo' \
    --namespace "$AB_NAMESPACE" \
    --userId 'CnDwAwXX' \
    --body '{}' \
    > test.out 2>&1
eval_tap $? 32 'AdminPutAdminPlayerRecordV1' test.out

#- 33 AdminPostPlayerAdminRecordV1
./ng net.accelbyte.sdk.cli.Main cloudsave adminPostPlayerAdminRecordV1 \
    --key '6FyfsBTB' \
    --namespace "$AB_NAMESPACE" \
    --userId 'IFS74Vfs' \
    --body '{}' \
    > test.out 2>&1
eval_tap $? 33 'AdminPostPlayerAdminRecordV1' test.out

#- 34 AdminDeleteAdminPlayerRecordV1
./ng net.accelbyte.sdk.cli.Main cloudsave adminDeleteAdminPlayerRecordV1 \
    --key 'DNQfXuAn' \
    --namespace "$AB_NAMESPACE" \
    --userId 'FtjoGMbD' \
    > test.out 2>&1
eval_tap $? 34 'AdminDeleteAdminPlayerRecordV1' test.out

#- 35 AdminListPlayerBinaryRecordsV1
./ng net.accelbyte.sdk.cli.Main cloudsave adminListPlayerBinaryRecordsV1 \
    --namespace "$AB_NAMESPACE" \
    --userId '9DnGieCg' \
    --limit '99' \
    --offset '30' \
    --query 'FzcH6T1r' \
    > test.out 2>&1
eval_tap $? 35 'AdminListPlayerBinaryRecordsV1' test.out

#- 36 AdminPostPlayerBinaryRecordV1
./ng net.accelbyte.sdk.cli.Main cloudsave adminPostPlayerBinaryRecordV1 \
    --namespace "$AB_NAMESPACE" \
    --userId 'V16OqmKA' \
    --body '{"file_type": "mjlqtsv6", "is_public": false, "key": "Bpzw85sy", "set_by": "SERVER"}' \
    > test.out 2>&1
eval_tap $? 36 'AdminPostPlayerBinaryRecordV1' test.out

#- 37 AdminGetPlayerBinaryRecordV1
./ng net.accelbyte.sdk.cli.Main cloudsave adminGetPlayerBinaryRecordV1 \
    --key '6R1WBqS8' \
    --namespace "$AB_NAMESPACE" \
    --userId 'HWsQxt1N' \
    > test.out 2>&1
eval_tap $? 37 'AdminGetPlayerBinaryRecordV1' test.out

#- 38 AdminPutPlayerBinaryRecordV1
./ng net.accelbyte.sdk.cli.Main cloudsave adminPutPlayerBinaryRecordV1 \
    --key 'TkmHroWQ' \
    --namespace "$AB_NAMESPACE" \
    --userId 'dIZxg1sl' \
    --body '{"content_type": "PdHvVq8n", "file_location": "8KOMbC11"}' \
    > test.out 2>&1
eval_tap $? 38 'AdminPutPlayerBinaryRecordV1' test.out

#- 39 AdminDeletePlayerBinaryRecordV1
./ng net.accelbyte.sdk.cli.Main cloudsave adminDeletePlayerBinaryRecordV1 \
    --key 'tYM35GIJ' \
    --namespace "$AB_NAMESPACE" \
    --userId 'IYXPKLeY' \
    > test.out 2>&1
eval_tap $? 39 'AdminDeletePlayerBinaryRecordV1' test.out

#- 40 AdminPutPlayerBinaryRecorMetadataV1
./ng net.accelbyte.sdk.cli.Main cloudsave adminPutPlayerBinaryRecorMetadataV1 \
    --key 'FmfIzYbG' \
    --namespace "$AB_NAMESPACE" \
    --userId 'UIlamh3H' \
    --body '{"is_public": false, "set_by": "CLIENT"}' \
    > test.out 2>&1
eval_tap $? 40 'AdminPutPlayerBinaryRecorMetadataV1' test.out

#- 41 AdminPostPlayerBinaryPresignedURLV1
./ng net.accelbyte.sdk.cli.Main cloudsave adminPostPlayerBinaryPresignedURLV1 \
    --key 'phtpYeWz' \
    --namespace "$AB_NAMESPACE" \
    --userId 'qSDRMcWk' \
    --body '{"file_type": "P9TCWoIo"}' \
    > test.out 2>&1
eval_tap $? 41 'AdminPostPlayerBinaryPresignedURLV1' test.out

#- 42 AdminPutAdminPlayerRecordConcurrentHandlerV1
./ng net.accelbyte.sdk.cli.Main cloudsave adminPutAdminPlayerRecordConcurrentHandlerV1 \
    --key 'Quoz9KGM' \
    --namespace "$AB_NAMESPACE" \
    --userId 'lndZQErW' \
    --responseBody  \
    --body '{"updatedAt": "hpAUNYVy", "value": {"Vur36rU5": {}, "sWFpNRTy": {}, "Mzj1h6rp": {}}}' \
    > test.out 2>&1
eval_tap $? 42 'AdminPutAdminPlayerRecordConcurrentHandlerV1' test.out

#- 43 AdminPutPlayerRecordConcurrentHandlerV1
./ng net.accelbyte.sdk.cli.Main cloudsave adminPutPlayerRecordConcurrentHandlerV1 \
    --key '83mEDB5X' \
    --namespace "$AB_NAMESPACE" \
    --userId 'DUKtnifL' \
    --responseBody  \
    --body '{"set_by": "SERVER", "updatedAt": "t5Bn8W2C", "value": {"Xx1UpV5z": {}, "cheQsCrc": {}, "hVxDQ9ek": {}}}' \
    > test.out 2>&1
eval_tap $? 43 'AdminPutPlayerRecordConcurrentHandlerV1' test.out

#- 44 AdminPutPlayerPublicRecordConcurrentHandlerV1
./ng net.accelbyte.sdk.cli.Main cloudsave adminPutPlayerPublicRecordConcurrentHandlerV1 \
    --key '1vpkuIAH' \
    --namespace "$AB_NAMESPACE" \
    --userId 'OU9G7tz9' \
    --responseBody  \
    --body '{"set_by": "CLIENT", "updatedAt": "1ycPpW1U", "value": {"E7a5tUCZ": {}, "InliOpeD": {}, "3EYBNtfd": {}}}' \
    > test.out 2>&1
eval_tap $? 44 'AdminPutPlayerPublicRecordConcurrentHandlerV1' test.out

#- 45 AdminRetrievePlayerRecords
./ng net.accelbyte.sdk.cli.Main cloudsave adminRetrievePlayerRecords \
    --namespace "$AB_NAMESPACE" \
    --userId 'j2MvlrW7' \
    --limit '10' \
    --offset '9' \
    > test.out 2>&1
eval_tap $? 45 'AdminRetrievePlayerRecords' test.out

#- 46 AdminPutPlayerRecordsHandlerV1
./ng net.accelbyte.sdk.cli.Main cloudsave adminPutPlayerRecordsHandlerV1 \
    --namespace "$AB_NAMESPACE" \
    --userId '27kxuCRX' \
    --body '{"data": [{"key": "GjZeL9AW", "value": {"ULyvQIrh": {}, "Q6CdILJW": {}, "OoXvd9j1": {}}}, {"key": "ILSEqa1R", "value": {"FpaeoHsl": {}, "BefATGK0": {}, "Ltc0uY1J": {}}}, {"key": "NIhwHM9I", "value": {"pVX1kHr7": {}, "wVcHKRvt": {}, "15VTeHGC": {}}}]}' \
    > test.out 2>&1
eval_tap $? 46 'AdminPutPlayerRecordsHandlerV1' test.out

#- 47 AdminGetPlayerRecordsHandlerV1
./ng net.accelbyte.sdk.cli.Main cloudsave adminGetPlayerRecordsHandlerV1 \
    --namespace "$AB_NAMESPACE" \
    --userId '5VZx1lKw' \
    --body '{"keys": ["uqRXHoXk", "4XXO6Hio", "Oczx9Evr"]}' \
    > test.out 2>&1
eval_tap $? 47 'AdminGetPlayerRecordsHandlerV1' test.out

#- 48 AdminGetPlayerRecordHandlerV1
./ng net.accelbyte.sdk.cli.Main cloudsave adminGetPlayerRecordHandlerV1 \
    --key 'iqzgykUF' \
    --namespace "$AB_NAMESPACE" \
    --userId 'gM8INRux' \
    > test.out 2>&1
eval_tap $? 48 'AdminGetPlayerRecordHandlerV1' test.out

#- 49 AdminPutPlayerRecordHandlerV1
./ng net.accelbyte.sdk.cli.Main cloudsave adminPutPlayerRecordHandlerV1 \
    --key 'geARYz5W' \
    --namespace "$AB_NAMESPACE" \
    --userId 'dM6GeG7I' \
    --body '{}' \
    > test.out 2>&1
eval_tap $? 49 'AdminPutPlayerRecordHandlerV1' test.out

#- 50 AdminPostPlayerRecordHandlerV1
./ng net.accelbyte.sdk.cli.Main cloudsave adminPostPlayerRecordHandlerV1 \
    --key 'XIFownWm' \
    --namespace "$AB_NAMESPACE" \
    --userId 'vlkBldrL' \
    --body '{}' \
    > test.out 2>&1
eval_tap $? 50 'AdminPostPlayerRecordHandlerV1' test.out

#- 51 AdminDeletePlayerRecordHandlerV1
./ng net.accelbyte.sdk.cli.Main cloudsave adminDeletePlayerRecordHandlerV1 \
    --key 'OSDiY3L8' \
    --namespace "$AB_NAMESPACE" \
    --userId 'k8LND3Be' \
    > test.out 2>&1
eval_tap $? 51 'AdminDeletePlayerRecordHandlerV1' test.out

#- 52 AdminGetPlayerPublicRecordHandlerV1
./ng net.accelbyte.sdk.cli.Main cloudsave adminGetPlayerPublicRecordHandlerV1 \
    --key 'T2JrgocF' \
    --namespace "$AB_NAMESPACE" \
    --userId 'ZzKAIva0' \
    > test.out 2>&1
eval_tap $? 52 'AdminGetPlayerPublicRecordHandlerV1' test.out

#- 53 AdminPutPlayerPublicRecordHandlerV1
./ng net.accelbyte.sdk.cli.Main cloudsave adminPutPlayerPublicRecordHandlerV1 \
    --key 'v8ABAAKE' \
    --namespace "$AB_NAMESPACE" \
    --userId 'T3k3gwr6' \
    --body '{}' \
    > test.out 2>&1
eval_tap $? 53 'AdminPutPlayerPublicRecordHandlerV1' test.out

#- 54 AdminPostPlayerPublicRecordHandlerV1
./ng net.accelbyte.sdk.cli.Main cloudsave adminPostPlayerPublicRecordHandlerV1 \
    --key 'wwDg60qM' \
    --namespace "$AB_NAMESPACE" \
    --userId 'X1ZVSnGS' \
    --body '{}' \
    > test.out 2>&1
eval_tap $? 54 'AdminPostPlayerPublicRecordHandlerV1' test.out

#- 55 AdminDeletePlayerPublicRecordHandlerV1
./ng net.accelbyte.sdk.cli.Main cloudsave adminDeletePlayerPublicRecordHandlerV1 \
    --key 'Q5JL0qD1' \
    --namespace "$AB_NAMESPACE" \
    --userId 'LGk71iOF' \
    > test.out 2>&1
eval_tap $? 55 'AdminDeletePlayerPublicRecordHandlerV1' test.out

#- 56 AdminGetPlayerRecordSizeHandlerV1
./ng net.accelbyte.sdk.cli.Main cloudsave adminGetPlayerRecordSizeHandlerV1 \
    --key 'WyxNPGYR' \
    --namespace "$AB_NAMESPACE" \
    --userId 'yuXY2nDo' \
    > test.out 2>&1
eval_tap $? 56 'AdminGetPlayerRecordSizeHandlerV1' test.out

#- 57 ListGameBinaryRecordsV1
./ng net.accelbyte.sdk.cli.Main cloudsave listGameBinaryRecordsV1 \
    --namespace "$AB_NAMESPACE" \
    --limit '49' \
    --offset '16' \
    --query 'MLImUo8b' \
    > test.out 2>&1
eval_tap $? 57 'ListGameBinaryRecordsV1' test.out

#- 58 PostGameBinaryRecordV1
./ng net.accelbyte.sdk.cli.Main cloudsave postGameBinaryRecordV1 \
    --namespace "$AB_NAMESPACE" \
    --body '{"file_type": "BbJ34ZU6", "key": "kkMCL6aN"}' \
    > test.out 2>&1
eval_tap $? 58 'PostGameBinaryRecordV1' test.out

#- 59 BulkGetGameBinaryRecordV1
./ng net.accelbyte.sdk.cli.Main cloudsave bulkGetGameBinaryRecordV1 \
    --namespace "$AB_NAMESPACE" \
    --body '{"keys": ["aQrwHOoO", "S9pizZHi", "YJSCTcTd"]}' \
    > test.out 2>&1
eval_tap $? 59 'BulkGetGameBinaryRecordV1' test.out

#- 60 GetGameBinaryRecordV1
./ng net.accelbyte.sdk.cli.Main cloudsave getGameBinaryRecordV1 \
    --key 'G7FCQWRJ' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 60 'GetGameBinaryRecordV1' test.out

#- 61 PutGameBinaryRecordV1
./ng net.accelbyte.sdk.cli.Main cloudsave putGameBinaryRecordV1 \
    --key 'b4rSlPX1' \
    --namespace "$AB_NAMESPACE" \
    --body '{"content_type": "oAvjleX3", "file_location": "3V0Oiv01"}' \
    > test.out 2>&1
eval_tap $? 61 'PutGameBinaryRecordV1' test.out

#- 62 DeleteGameBinaryRecordV1
./ng net.accelbyte.sdk.cli.Main cloudsave deleteGameBinaryRecordV1 \
    --key '7YIE6M22' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 62 'DeleteGameBinaryRecordV1' test.out

#- 63 PostGameBinaryPresignedURLV1
./ng net.accelbyte.sdk.cli.Main cloudsave postGameBinaryPresignedURLV1 \
    --key '55B9mifH' \
    --namespace "$AB_NAMESPACE" \
    --body '{"file_type": "0BppYIyA"}' \
    > test.out 2>&1
eval_tap $? 63 'PostGameBinaryPresignedURLV1' test.out

#- 64 PutGameRecordConcurrentHandlerV1
./ng net.accelbyte.sdk.cli.Main cloudsave putGameRecordConcurrentHandlerV1 \
    --key 'p4SLodN7' \
    --namespace "$AB_NAMESPACE" \
    --body '{"updatedAt": "yKMkmlqQ", "value": {"JfDd346S": {}, "EsGkDzFx": {}, "9eXdpfYZ": {}}}' \
    > test.out 2>&1
eval_tap $? 64 'PutGameRecordConcurrentHandlerV1' test.out

#- 65 GetGameRecordsBulk
./ng net.accelbyte.sdk.cli.Main cloudsave getGameRecordsBulk \
    --namespace "$AB_NAMESPACE" \
    --body '{"keys": ["tdVekZ8f", "XzLLdSc7", "S3hh2wDR"]}' \
    > test.out 2>&1
eval_tap $? 65 'GetGameRecordsBulk' test.out

#- 66 GetGameRecordHandlerV1
./ng net.accelbyte.sdk.cli.Main cloudsave getGameRecordHandlerV1 \
    --key 'yAp4PQIh' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 66 'GetGameRecordHandlerV1' test.out

#- 67 PutGameRecordHandlerV1
./ng net.accelbyte.sdk.cli.Main cloudsave putGameRecordHandlerV1 \
    --key 'sBdb3RTi' \
    --namespace "$AB_NAMESPACE" \
    --body '{}' \
    > test.out 2>&1
eval_tap $? 67 'PutGameRecordHandlerV1' test.out

#- 68 PostGameRecordHandlerV1
./ng net.accelbyte.sdk.cli.Main cloudsave postGameRecordHandlerV1 \
    --key 'rSlCkfr9' \
    --namespace "$AB_NAMESPACE" \
    --body '{}' \
    > test.out 2>&1
eval_tap $? 68 'PostGameRecordHandlerV1' test.out

#- 69 DeleteGameRecordHandlerV1
./ng net.accelbyte.sdk.cli.Main cloudsave deleteGameRecordHandlerV1 \
    --key 'MywrrLHb' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 69 'DeleteGameRecordHandlerV1' test.out

#- 70 BulkGetPlayerPublicBinaryRecordsV1
./ng net.accelbyte.sdk.cli.Main cloudsave bulkGetPlayerPublicBinaryRecordsV1 \
    --key '4rP2wf4I' \
    --namespace "$AB_NAMESPACE" \
    --body '{"userIds": ["Chayk2Gs", "JqN0gNat", "AA7CCIRF"]}' \
    > test.out 2>&1
eval_tap $? 70 'BulkGetPlayerPublicBinaryRecordsV1' test.out

#- 71 BulkGetPlayerPublicRecordHandlerV1
./ng net.accelbyte.sdk.cli.Main cloudsave bulkGetPlayerPublicRecordHandlerV1 \
    --key 't6yM3ae8' \
    --namespace "$AB_NAMESPACE" \
    --body '{"userIds": ["AbFhVaGC", "It7atFxn", "oytHPH8j"]}' \
    > test.out 2>&1
eval_tap $? 71 'BulkGetPlayerPublicRecordHandlerV1' test.out

#- 72 ListMyBinaryRecordsV1
./ng net.accelbyte.sdk.cli.Main cloudsave listMyBinaryRecordsV1 \
    --namespace "$AB_NAMESPACE" \
    --limit '4' \
    --offset '88' \
    --query 'KmnU2niK' \
    > test.out 2>&1
eval_tap $? 72 'ListMyBinaryRecordsV1' test.out

#- 73 BulkGetMyBinaryRecordV1
./ng net.accelbyte.sdk.cli.Main cloudsave bulkGetMyBinaryRecordV1 \
    --namespace "$AB_NAMESPACE" \
    --body '{"keys": ["uYFKbV0I", "sQlibuwW", "74KOJ9lk"]}' \
    > test.out 2>&1
eval_tap $? 73 'BulkGetMyBinaryRecordV1' test.out

#- 74 RetrievePlayerRecords
./ng net.accelbyte.sdk.cli.Main cloudsave retrievePlayerRecords \
    --namespace "$AB_NAMESPACE" \
    --limit '47' \
    --offset '12' \
    > test.out 2>&1
eval_tap $? 74 'RetrievePlayerRecords' test.out

#- 75 GetPlayerRecordsBulkHandlerV1
./ng net.accelbyte.sdk.cli.Main cloudsave getPlayerRecordsBulkHandlerV1 \
    --namespace "$AB_NAMESPACE" \
    --body '{"keys": ["WbCBOCpz", "2lExwp85", "Qc85V2MH"]}' \
    > test.out 2>&1
eval_tap $? 75 'GetPlayerRecordsBulkHandlerV1' test.out

#- 76 PublicDeletePlayerPublicRecordHandlerV1
./ng net.accelbyte.sdk.cli.Main cloudsave publicDeletePlayerPublicRecordHandlerV1 \
    --key 'fphMJHW0' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 76 'PublicDeletePlayerPublicRecordHandlerV1' test.out

#- 77 PostPlayerBinaryRecordV1
./ng net.accelbyte.sdk.cli.Main cloudsave postPlayerBinaryRecordV1 \
    --namespace "$AB_NAMESPACE" \
    --userId 'v0xNTiD1' \
    --body '{"file_type": "UgsTNXcr", "is_public": false, "key": "pekVflaW"}' \
    > test.out 2>&1
eval_tap $? 77 'PostPlayerBinaryRecordV1' test.out

#- 78 ListOtherPlayerPublicBinaryRecordsV1
./ng net.accelbyte.sdk.cli.Main cloudsave listOtherPlayerPublicBinaryRecordsV1 \
    --namespace "$AB_NAMESPACE" \
    --userId 'HGHwaSRW' \
    --limit '89' \
    --offset '13' \
    > test.out 2>&1
eval_tap $? 78 'ListOtherPlayerPublicBinaryRecordsV1' test.out

#- 79 BulkGetOtherPlayerPublicBinaryRecordsV1
./ng net.accelbyte.sdk.cli.Main cloudsave bulkGetOtherPlayerPublicBinaryRecordsV1 \
    --namespace "$AB_NAMESPACE" \
    --userId 'MMvh4tA0' \
    --body '{"keys": ["Pv7kQiaO", "ssjWItvx", "xhEa8qd6"]}' \
    > test.out 2>&1
eval_tap $? 79 'BulkGetOtherPlayerPublicBinaryRecordsV1' test.out

#- 80 GetPlayerBinaryRecordV1
./ng net.accelbyte.sdk.cli.Main cloudsave getPlayerBinaryRecordV1 \
    --key 'yKiaeFc6' \
    --namespace "$AB_NAMESPACE" \
    --userId 'CVvdZWzO' \
    > test.out 2>&1
eval_tap $? 80 'GetPlayerBinaryRecordV1' test.out

#- 81 PutPlayerBinaryRecordV1
./ng net.accelbyte.sdk.cli.Main cloudsave putPlayerBinaryRecordV1 \
    --key 'IRvxvLlF' \
    --namespace "$AB_NAMESPACE" \
    --userId 'GZNxGoio' \
    --body '{"content_type": "9K9roKDr", "file_location": "oJMPpzTR"}' \
    > test.out 2>&1
eval_tap $? 81 'PutPlayerBinaryRecordV1' test.out

#- 82 DeletePlayerBinaryRecordV1
./ng net.accelbyte.sdk.cli.Main cloudsave deletePlayerBinaryRecordV1 \
    --key 'vc4oyAu9' \
    --namespace "$AB_NAMESPACE" \
    --userId 'f4xeoArK' \
    > test.out 2>&1
eval_tap $? 82 'DeletePlayerBinaryRecordV1' test.out

#- 83 PutPlayerBinaryRecorMetadataV1
./ng net.accelbyte.sdk.cli.Main cloudsave putPlayerBinaryRecorMetadataV1 \
    --key 'F5lwDi5V' \
    --namespace "$AB_NAMESPACE" \
    --userId 'wRpPrGgu' \
    --body '{"is_public": true}' \
    > test.out 2>&1
eval_tap $? 83 'PutPlayerBinaryRecorMetadataV1' test.out

#- 84 PostPlayerBinaryPresignedURLV1
./ng net.accelbyte.sdk.cli.Main cloudsave postPlayerBinaryPresignedURLV1 \
    --key '25wfERoK' \
    --namespace "$AB_NAMESPACE" \
    --userId 'l228aBiS' \
    --body '{"file_type": "ouBiw3Up"}' \
    > test.out 2>&1
eval_tap $? 84 'PostPlayerBinaryPresignedURLV1' test.out

#- 85 GetPlayerPublicBinaryRecordsV1
./ng net.accelbyte.sdk.cli.Main cloudsave getPlayerPublicBinaryRecordsV1 \
    --key 'iPlTqFvT' \
    --namespace "$AB_NAMESPACE" \
    --userId 'dngVvPL0' \
    > test.out 2>&1
eval_tap $? 85 'GetPlayerPublicBinaryRecordsV1' test.out

#- 86 PutPlayerRecordConcurrentHandlerV1
./ng net.accelbyte.sdk.cli.Main cloudsave putPlayerRecordConcurrentHandlerV1 \
    --key 'xCVFMdHR' \
    --namespace "$AB_NAMESPACE" \
    --userId 'sPMzdrr0' \
    --responseBody  \
    --body '{"updatedAt": "bty2advN", "value": {"nrI9bzKt": {}, "0wDesSXf": {}, "8q9dh3wN": {}}}' \
    > test.out 2>&1
eval_tap $? 86 'PutPlayerRecordConcurrentHandlerV1' test.out

#- 87 PutPlayerPublicRecordConcurrentHandlerV1
./ng net.accelbyte.sdk.cli.Main cloudsave putPlayerPublicRecordConcurrentHandlerV1 \
    --key 'fcOoesqy' \
    --namespace "$AB_NAMESPACE" \
    --userId 'WLOSHNRw' \
    --responseBody  \
    --body '{"updatedAt": "YCQZKEER", "value": {"ahxWpqim": {}, "a2YH1xYY": {}, "NKcoiXBS": {}}}' \
    > test.out 2>&1
eval_tap $? 87 'PutPlayerPublicRecordConcurrentHandlerV1' test.out

#- 88 GetOtherPlayerPublicRecordKeyHandlerV1
./ng net.accelbyte.sdk.cli.Main cloudsave getOtherPlayerPublicRecordKeyHandlerV1 \
    --namespace "$AB_NAMESPACE" \
    --userId 'SVWe1pf2' \
    --limit '35' \
    --offset '79' \
    > test.out 2>&1
eval_tap $? 88 'GetOtherPlayerPublicRecordKeyHandlerV1' test.out

#- 89 GetOtherPlayerPublicRecordHandlerV1
./ng net.accelbyte.sdk.cli.Main cloudsave getOtherPlayerPublicRecordHandlerV1 \
    --namespace "$AB_NAMESPACE" \
    --userId 'QLuPLtBS' \
    --body '{"keys": ["idmBW8wJ", "6j5ZKhgF", "16NdYPmn"]}' \
    > test.out 2>&1
eval_tap $? 89 'GetOtherPlayerPublicRecordHandlerV1' test.out

#- 90 GetPlayerRecordHandlerV1
./ng net.accelbyte.sdk.cli.Main cloudsave getPlayerRecordHandlerV1 \
    --key 'Zo0l06rC' \
    --namespace "$AB_NAMESPACE" \
    --userId 'vFWm923E' \
    > test.out 2>&1
eval_tap $? 90 'GetPlayerRecordHandlerV1' test.out

#- 91 PutPlayerRecordHandlerV1
./ng net.accelbyte.sdk.cli.Main cloudsave putPlayerRecordHandlerV1 \
    --key 'cRQkKYOe' \
    --namespace "$AB_NAMESPACE" \
    --userId 'gKzyoeUj' \
    --body '{}' \
    > test.out 2>&1
eval_tap $? 91 'PutPlayerRecordHandlerV1' test.out

#- 92 PostPlayerRecordHandlerV1
./ng net.accelbyte.sdk.cli.Main cloudsave postPlayerRecordHandlerV1 \
    --key '8vqlXOJn' \
    --namespace "$AB_NAMESPACE" \
    --userId 'ny7JE9ie' \
    --body '{}' \
    > test.out 2>&1
eval_tap $? 92 'PostPlayerRecordHandlerV1' test.out

#- 93 DeletePlayerRecordHandlerV1
./ng net.accelbyte.sdk.cli.Main cloudsave deletePlayerRecordHandlerV1 \
    --key 'CVUlmdTm' \
    --namespace "$AB_NAMESPACE" \
    --userId 'cbHhcqfc' \
    > test.out 2>&1
eval_tap $? 93 'DeletePlayerRecordHandlerV1' test.out

#- 94 GetPlayerPublicRecordHandlerV1
./ng net.accelbyte.sdk.cli.Main cloudsave getPlayerPublicRecordHandlerV1 \
    --key 'lUlylqsD' \
    --namespace "$AB_NAMESPACE" \
    --userId 'WeukQ0Yr' \
    > test.out 2>&1
eval_tap $? 94 'GetPlayerPublicRecordHandlerV1' test.out

#- 95 PutPlayerPublicRecordHandlerV1
./ng net.accelbyte.sdk.cli.Main cloudsave putPlayerPublicRecordHandlerV1 \
    --key 'tAP7MSiv' \
    --namespace "$AB_NAMESPACE" \
    --userId 'tHzd6l8A' \
    --body '{}' \
    > test.out 2>&1
eval_tap $? 95 'PutPlayerPublicRecordHandlerV1' test.out

#- 96 PostPlayerPublicRecordHandlerV1
./ng net.accelbyte.sdk.cli.Main cloudsave postPlayerPublicRecordHandlerV1 \
    --key 'gQuWv7x0' \
    --namespace "$AB_NAMESPACE" \
    --userId 'y3It043C' \
    --body '{}' \
    > test.out 2>&1
eval_tap $? 96 'PostPlayerPublicRecordHandlerV1' test.out


rm -f "tmp.dat"

exit $EXIT_CODE