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
echo "1..104"

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
    --limit '39' \
    --offset '53' \
    --query 'DAWlexFl' \
    --tags '2MOhgipW,1cTkZA8L,3ztB7Ftg' \
    > test.out 2>&1
eval_tap $? 2 'AdminListAdminGameRecordV1' test.out

#- 3 AdminBulkGetAdminGameRecordV1
./ng net.accelbyte.sdk.cli.Main cloudsave adminBulkGetAdminGameRecordV1 \
    --namespace "$AB_NAMESPACE" \
    --body '{"keys": ["4QZfwZHS", "6a5MaacB", "eB515hHs"]}' \
    > test.out 2>&1
eval_tap $? 3 'AdminBulkGetAdminGameRecordV1' test.out

#- 4 AdminGetAdminGameRecordV1
./ng net.accelbyte.sdk.cli.Main cloudsave adminGetAdminGameRecordV1 \
    --key 'UGip5MtV' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 4 'AdminGetAdminGameRecordV1' test.out

#- 5 AdminPutAdminGameRecordV1
./ng net.accelbyte.sdk.cli.Main cloudsave adminPutAdminGameRecordV1 \
    --key 'OBY2GrE6' \
    --namespace "$AB_NAMESPACE" \
    --body '{}' \
    > test.out 2>&1
eval_tap $? 5 'AdminPutAdminGameRecordV1' test.out

#- 6 AdminPostAdminGameRecordV1
./ng net.accelbyte.sdk.cli.Main cloudsave adminPostAdminGameRecordV1 \
    --key 'dPQIqtAZ' \
    --namespace "$AB_NAMESPACE" \
    --body '{}' \
    > test.out 2>&1
eval_tap $? 6 'AdminPostAdminGameRecordV1' test.out

#- 7 AdminDeleteAdminGameRecordV1
./ng net.accelbyte.sdk.cli.Main cloudsave adminDeleteAdminGameRecordV1 \
    --key '48a73byE' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 7 'AdminDeleteAdminGameRecordV1' test.out

#- 8 AdminListGameBinaryRecordsV1
./ng net.accelbyte.sdk.cli.Main cloudsave adminListGameBinaryRecordsV1 \
    --namespace "$AB_NAMESPACE" \
    --limit '0' \
    --offset '53' \
    --query 'LH2Qqvun' \
    --tags 'ApmTETL5,eS0oAbZn,q0YKdOol' \
    > test.out 2>&1
eval_tap $? 8 'AdminListGameBinaryRecordsV1' test.out

#- 9 AdminPostGameBinaryRecordV1
./ng net.accelbyte.sdk.cli.Main cloudsave adminPostGameBinaryRecordV1 \
    --namespace "$AB_NAMESPACE" \
    --body '{"file_type": "EogiNJKr", "key": "30Pb2Y4O", "set_by": "CLIENT", "ttl_config": {"action": "DELETE", "expires_at": "1985-07-30T00:00:00Z"}}' \
    > test.out 2>&1
eval_tap $? 9 'AdminPostGameBinaryRecordV1' test.out

#- 10 AdminGetGameBinaryRecordV1
./ng net.accelbyte.sdk.cli.Main cloudsave adminGetGameBinaryRecordV1 \
    --key '0u04mpid' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 10 'AdminGetGameBinaryRecordV1' test.out

#- 11 AdminPutGameBinaryRecordV1
./ng net.accelbyte.sdk.cli.Main cloudsave adminPutGameBinaryRecordV1 \
    --key 'tXdWsNXx' \
    --namespace "$AB_NAMESPACE" \
    --body '{"content_type": "dwyFP9N2", "file_location": "H5CoITHf"}' \
    > test.out 2>&1
eval_tap $? 11 'AdminPutGameBinaryRecordV1' test.out

#- 12 AdminDeleteGameBinaryRecordV1
./ng net.accelbyte.sdk.cli.Main cloudsave adminDeleteGameBinaryRecordV1 \
    --key 'z0RT1GaK' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 12 'AdminDeleteGameBinaryRecordV1' test.out

#- 13 AdminPutGameBinaryRecorMetadataV1
./ng net.accelbyte.sdk.cli.Main cloudsave adminPutGameBinaryRecorMetadataV1 \
    --key 'p4TaXaLG' \
    --namespace "$AB_NAMESPACE" \
    --body '{"set_by": "SERVER", "tags": ["JAdhZYSq", "K3UQq7H7", "voox0uB9"], "ttl_config": {"action": "DELETE", "expires_at": "1972-12-05T00:00:00Z"}}' \
    > test.out 2>&1
eval_tap $? 13 'AdminPutGameBinaryRecorMetadataV1' test.out

#- 14 AdminPostGameBinaryPresignedURLV1
./ng net.accelbyte.sdk.cli.Main cloudsave adminPostGameBinaryPresignedURLV1 \
    --key '3LheKhu7' \
    --namespace "$AB_NAMESPACE" \
    --body '{"file_type": "4i1CzNXw"}' \
    > test.out 2>&1
eval_tap $? 14 'AdminPostGameBinaryPresignedURLV1' test.out

#- 15 DeleteGameBinaryRecordTTLConfig
./ng net.accelbyte.sdk.cli.Main cloudsave deleteGameBinaryRecordTTLConfig \
    --key '4LJWiYJL' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 15 'DeleteGameBinaryRecordTTLConfig' test.out

#- 16 AdminPutAdminGameRecordConcurrentHandlerV1
./ng net.accelbyte.sdk.cli.Main cloudsave adminPutAdminGameRecordConcurrentHandlerV1 \
    --key 'mcoNOG2I' \
    --namespace "$AB_NAMESPACE" \
    --body '{"tags": ["3iHiB7kx", "p2cD5I0G", "g1DvY7mv"], "updatedAt": "1976-11-30T00:00:00Z", "value": {"Hk7iJQCW": {}, "eZxcHLoT": {}, "lJvnsKDw": {}}}' \
    > test.out 2>&1
eval_tap $? 16 'AdminPutAdminGameRecordConcurrentHandlerV1' test.out

#- 17 AdminPutGameRecordConcurrentHandlerV1
./ng net.accelbyte.sdk.cli.Main cloudsave adminPutGameRecordConcurrentHandlerV1 \
    --key 'W5YZTnUQ' \
    --namespace "$AB_NAMESPACE" \
    --body '{"set_by": "SERVER", "tags": ["oupzLkPE", "XcabKWD8", "4XjpqX6K"], "ttl_config": {"action": "DELETE", "expires_at": "1979-12-10T00:00:00Z"}, "updatedAt": "1971-05-16T00:00:00Z", "value": {"d5KXmR25": {}, "JbgYQWvu": {}, "mXcVFAoo": {}}}' \
    > test.out 2>&1
eval_tap $? 17 'AdminPutGameRecordConcurrentHandlerV1' test.out

#- 18 GetPluginConfig
./ng net.accelbyte.sdk.cli.Main cloudsave getPluginConfig \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 18 'GetPluginConfig' test.out

#- 19 CreatePluginConfig
./ng net.accelbyte.sdk.cli.Main cloudsave createPluginConfig \
    --namespace "$AB_NAMESPACE" \
    --body '{"appConfig": {"appName": "uwM0R5Lp"}, "customConfig": {"GRPCAddress": "vBI7oxNg"}, "customFunction": {"afterBulkReadGameBinaryRecord": false, "afterBulkReadGameRecord": true, "afterBulkReadPlayerBinaryRecord": false, "afterBulkReadPlayerRecord": true, "afterReadGameBinaryRecord": false, "afterReadGameRecord": true, "afterReadPlayerBinaryRecord": true, "afterReadPlayerRecord": false, "beforeWriteAdminGameRecord": false, "beforeWriteAdminPlayerRecord": true, "beforeWriteGameBinaryRecord": false, "beforeWriteGameRecord": false, "beforeWritePlayerBinaryRecord": false, "beforeWritePlayerRecord": false}, "extendType": "CUSTOM"}' \
    > test.out 2>&1
eval_tap $? 19 'CreatePluginConfig' test.out

#- 20 DeletePluginConfig
./ng net.accelbyte.sdk.cli.Main cloudsave deletePluginConfig \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 20 'DeletePluginConfig' test.out

#- 21 UpdatePluginConfig
./ng net.accelbyte.sdk.cli.Main cloudsave updatePluginConfig \
    --namespace "$AB_NAMESPACE" \
    --body '{"appConfig": {"appName": "FMwNrSac"}, "customConfig": {"GRPCAddress": "f2RfOpnz"}, "customFunction": {"afterBulkReadGameBinaryRecord": true, "afterBulkReadGameRecord": true, "afterBulkReadPlayerBinaryRecord": true, "afterBulkReadPlayerRecord": false, "afterReadGameBinaryRecord": false, "afterReadGameRecord": true, "afterReadPlayerBinaryRecord": false, "afterReadPlayerRecord": true, "beforeWriteAdminGameRecord": false, "beforeWriteAdminPlayerRecord": true, "beforeWriteGameBinaryRecord": false, "beforeWriteGameRecord": false, "beforeWritePlayerBinaryRecord": true, "beforeWritePlayerRecord": true}, "extendType": "APP"}' \
    > test.out 2>&1
eval_tap $? 21 'UpdatePluginConfig' test.out

#- 22 ListGameRecordsHandlerV1
./ng net.accelbyte.sdk.cli.Main cloudsave listGameRecordsHandlerV1 \
    --namespace "$AB_NAMESPACE" \
    --query 'bUeg3lXC' \
    --tags '2RGatDdJ,cARzIZna,SSVtvRoq' \
    --limit '52' \
    --offset '72' \
    > test.out 2>&1
eval_tap $? 22 'ListGameRecordsHandlerV1' test.out

#- 23 AdminGetGameRecordHandlerV1
./ng net.accelbyte.sdk.cli.Main cloudsave adminGetGameRecordHandlerV1 \
    --key 'vg6PC3Dy' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 23 'AdminGetGameRecordHandlerV1' test.out

#- 24 AdminPutGameRecordHandlerV1
./ng net.accelbyte.sdk.cli.Main cloudsave adminPutGameRecordHandlerV1 \
    --key 'VktnNW0M' \
    --namespace "$AB_NAMESPACE" \
    --body '{}' \
    > test.out 2>&1
eval_tap $? 24 'AdminPutGameRecordHandlerV1' test.out

#- 25 AdminPostGameRecordHandlerV1
./ng net.accelbyte.sdk.cli.Main cloudsave adminPostGameRecordHandlerV1 \
    --key 'AYxpux5t' \
    --namespace "$AB_NAMESPACE" \
    --body '{}' \
    > test.out 2>&1
eval_tap $? 25 'AdminPostGameRecordHandlerV1' test.out

#- 26 AdminDeleteGameRecordHandlerV1
./ng net.accelbyte.sdk.cli.Main cloudsave adminDeleteGameRecordHandlerV1 \
    --key 'mP1Knm8G' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 26 'AdminDeleteGameRecordHandlerV1' test.out

#- 27 DeleteGameRecordTTLConfig
./ng net.accelbyte.sdk.cli.Main cloudsave deleteGameRecordTTLConfig \
    --key 'DTTP75rR' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 27 'DeleteGameRecordTTLConfig' test.out

#- 28 AdminListTagsHandlerV1
./ng net.accelbyte.sdk.cli.Main cloudsave adminListTagsHandlerV1 \
    --namespace "$AB_NAMESPACE" \
    --limit '47' \
    --offset '49' \
    > test.out 2>&1
eval_tap $? 28 'AdminListTagsHandlerV1' test.out

#- 29 AdminPostTagHandlerV1
./ng net.accelbyte.sdk.cli.Main cloudsave adminPostTagHandlerV1 \
    --namespace "$AB_NAMESPACE" \
    --body '{"tag": "fkhTgnWL"}' \
    > test.out 2>&1
eval_tap $? 29 'AdminPostTagHandlerV1' test.out

#- 30 AdminDeleteTagHandlerV1
./ng net.accelbyte.sdk.cli.Main cloudsave adminDeleteTagHandlerV1 \
    --namespace "$AB_NAMESPACE" \
    --tag 'Pmi6o8Bl' \
    > test.out 2>&1
eval_tap $? 30 'AdminDeleteTagHandlerV1' test.out

#- 31 BulkGetAdminPlayerRecordByUserIdsV1
./ng net.accelbyte.sdk.cli.Main cloudsave bulkGetAdminPlayerRecordByUserIdsV1 \
    --key 'LjM9VLXS' \
    --namespace "$AB_NAMESPACE" \
    --body '{"userIds": ["Cut4y48b", "pVpSWlNm", "oDpWvIWc"]}' \
    > test.out 2>&1
eval_tap $? 31 'BulkGetAdminPlayerRecordByUserIdsV1' test.out

#- 32 BulkGetPlayerRecordSizeHandlerV1
./ng net.accelbyte.sdk.cli.Main cloudsave bulkGetPlayerRecordSizeHandlerV1 \
    --namespace "$AB_NAMESPACE" \
    --body '{"data": [{"keys": ["eP2mW4ov", "xIBcXnQC", "jruheZXp"], "user_id": "62T1NWcG"}, {"keys": ["SGNi2vGu", "wOY7KTDB", "NNhoATdY"], "user_id": "68zR2K1u"}, {"keys": ["J4qhAhfO", "EanUR06t", "RPNc7MBJ"], "user_id": "VtB5Rz0J"}]}' \
    > test.out 2>&1
eval_tap $? 32 'BulkGetPlayerRecordSizeHandlerV1' test.out

#- 33 ListPlayerRecordHandlerV1
eval_tap 0 33 'ListPlayerRecordHandlerV1 # SKIP deprecated' test.out

#- 34 AdminBulkPutPlayerRecordsByKeyHandlerV1
./ng net.accelbyte.sdk.cli.Main cloudsave adminBulkPutPlayerRecordsByKeyHandlerV1 \
    --key 'dkFgIOVK' \
    --namespace "$AB_NAMESPACE" \
    --body '{"data": [{"user_id": "N2uWBYq8", "value": {"MvHylY0m": {}, "av72rWcA": {}, "rehnkPkl": {}}}, {"user_id": "Wt2YpFlO", "value": {"7uA5xMco": {}, "0fZtMdbA": {}, "0B45NOwB": {}}}, {"user_id": "fyWrpnsb", "value": {"Lsa2VrYA": {}, "WR9QOnCd": {}, "CiSw0jRk": {}}}]}' \
    > test.out 2>&1
eval_tap $? 34 'AdminBulkPutPlayerRecordsByKeyHandlerV1' test.out

#- 35 AdminBulkGetPlayerRecordsByUserIDsHandlerV1
./ng net.accelbyte.sdk.cli.Main cloudsave adminBulkGetPlayerRecordsByUserIDsHandlerV1 \
    --key 'y4sMQbDJ' \
    --namespace "$AB_NAMESPACE" \
    --body '{"userIds": ["0VsFFc2i", "4VUWGZTo", "uT7ZBByy"]}' \
    > test.out 2>&1
eval_tap $? 35 'AdminBulkGetPlayerRecordsByUserIDsHandlerV1' test.out

#- 36 AdminListAdminUserRecordsV1
./ng net.accelbyte.sdk.cli.Main cloudsave adminListAdminUserRecordsV1 \
    --namespace "$AB_NAMESPACE" \
    --userId 'PFzrOBHW' \
    --limit '33' \
    --offset '94' \
    --query 'NLPj482Q' \
    --tags 'DbRtLW3Z,NybWdYho,zVecK35L' \
    > test.out 2>&1
eval_tap $? 36 'AdminListAdminUserRecordsV1' test.out

#- 37 AdminBulkGetAdminPlayerRecordV1
./ng net.accelbyte.sdk.cli.Main cloudsave adminBulkGetAdminPlayerRecordV1 \
    --namespace "$AB_NAMESPACE" \
    --userId 'qcPsEbGU' \
    --body '{"keys": ["fuEPJs9f", "nW8IBIvW", "08j9lUDD"]}' \
    > test.out 2>&1
eval_tap $? 37 'AdminBulkGetAdminPlayerRecordV1' test.out

#- 38 AdminGetAdminPlayerRecordV1
./ng net.accelbyte.sdk.cli.Main cloudsave adminGetAdminPlayerRecordV1 \
    --key 'Gi1qeHeS' \
    --namespace "$AB_NAMESPACE" \
    --userId 'ypUR7IK0' \
    > test.out 2>&1
eval_tap $? 38 'AdminGetAdminPlayerRecordV1' test.out

#- 39 AdminPutAdminPlayerRecordV1
./ng net.accelbyte.sdk.cli.Main cloudsave adminPutAdminPlayerRecordV1 \
    --key 'ol6CnOkN' \
    --namespace "$AB_NAMESPACE" \
    --userId 'O8vyNnww' \
    --body '{}' \
    > test.out 2>&1
eval_tap $? 39 'AdminPutAdminPlayerRecordV1' test.out

#- 40 AdminPostPlayerAdminRecordV1
./ng net.accelbyte.sdk.cli.Main cloudsave adminPostPlayerAdminRecordV1 \
    --key 'LNiByJ7F' \
    --namespace "$AB_NAMESPACE" \
    --userId 'BLF1g04q' \
    --body '{}' \
    > test.out 2>&1
eval_tap $? 40 'AdminPostPlayerAdminRecordV1' test.out

#- 41 AdminDeleteAdminPlayerRecordV1
./ng net.accelbyte.sdk.cli.Main cloudsave adminDeleteAdminPlayerRecordV1 \
    --key 'YDPyd7Rn' \
    --namespace "$AB_NAMESPACE" \
    --userId 'miDP5Vz9' \
    > test.out 2>&1
eval_tap $? 41 'AdminDeleteAdminPlayerRecordV1' test.out

#- 42 AdminListPlayerBinaryRecordsV1
./ng net.accelbyte.sdk.cli.Main cloudsave adminListPlayerBinaryRecordsV1 \
    --namespace "$AB_NAMESPACE" \
    --userId 'RN97yMq5' \
    --limit '56' \
    --offset '77' \
    --query 'DFMrnwZE' \
    --tags '1t8UgRmi,qqxi5tKg,rnXQBBNi' \
    > test.out 2>&1
eval_tap $? 42 'AdminListPlayerBinaryRecordsV1' test.out

#- 43 AdminPostPlayerBinaryRecordV1
./ng net.accelbyte.sdk.cli.Main cloudsave adminPostPlayerBinaryRecordV1 \
    --namespace "$AB_NAMESPACE" \
    --userId 'ILQ0EwIm' \
    --body '{"file_type": "eHOZdyhn", "is_public": true, "key": "aTMnKfRz", "set_by": "SERVER"}' \
    > test.out 2>&1
eval_tap $? 43 'AdminPostPlayerBinaryRecordV1' test.out

#- 44 AdminGetPlayerBinaryRecordV1
./ng net.accelbyte.sdk.cli.Main cloudsave adminGetPlayerBinaryRecordV1 \
    --key 'RlCG4kh9' \
    --namespace "$AB_NAMESPACE" \
    --userId 'PcoKqZJr' \
    > test.out 2>&1
eval_tap $? 44 'AdminGetPlayerBinaryRecordV1' test.out

#- 45 AdminPutPlayerBinaryRecordV1
./ng net.accelbyte.sdk.cli.Main cloudsave adminPutPlayerBinaryRecordV1 \
    --key 'MN0ReOgm' \
    --namespace "$AB_NAMESPACE" \
    --userId 'V8gf48fP' \
    --body '{"content_type": "QJaDBcWm", "file_location": "E20F5fQI"}' \
    > test.out 2>&1
eval_tap $? 45 'AdminPutPlayerBinaryRecordV1' test.out

#- 46 AdminDeletePlayerBinaryRecordV1
./ng net.accelbyte.sdk.cli.Main cloudsave adminDeletePlayerBinaryRecordV1 \
    --key 'CbTWF0uP' \
    --namespace "$AB_NAMESPACE" \
    --userId 'SIYC3uxs' \
    > test.out 2>&1
eval_tap $? 46 'AdminDeletePlayerBinaryRecordV1' test.out

#- 47 AdminPutPlayerBinaryRecorMetadataV1
./ng net.accelbyte.sdk.cli.Main cloudsave adminPutPlayerBinaryRecorMetadataV1 \
    --key 'mBMOQ34g' \
    --namespace "$AB_NAMESPACE" \
    --userId 'THnVLnF3' \
    --body '{"is_public": false, "set_by": "SERVER", "tags": ["m4icyJOQ", "Up08Lucu", "1qjzz47I"]}' \
    > test.out 2>&1
eval_tap $? 47 'AdminPutPlayerBinaryRecorMetadataV1' test.out

#- 48 AdminPostPlayerBinaryPresignedURLV1
./ng net.accelbyte.sdk.cli.Main cloudsave adminPostPlayerBinaryPresignedURLV1 \
    --key '3wXqj6lA' \
    --namespace "$AB_NAMESPACE" \
    --userId '1MymCvTF' \
    --body '{"file_type": "1S2o0pBr"}' \
    > test.out 2>&1
eval_tap $? 48 'AdminPostPlayerBinaryPresignedURLV1' test.out

#- 49 AdminPutAdminPlayerRecordConcurrentHandlerV1
./ng net.accelbyte.sdk.cli.Main cloudsave adminPutAdminPlayerRecordConcurrentHandlerV1 \
    --key 'YVWka678' \
    --namespace "$AB_NAMESPACE" \
    --userId 'GETbNBmD' \
    --responseBody  \
    --body '{"tags": ["IlpDrY0j", "ksf4IFzX", "jlJgP9Xk"], "updatedAt": "1987-01-17T00:00:00Z", "value": {"oNXdKYdX": {}, "cAvBr8WZ": {}, "mIEVJHoF": {}}}' \
    > test.out 2>&1
eval_tap $? 49 'AdminPutAdminPlayerRecordConcurrentHandlerV1' test.out

#- 50 AdminPutPlayerRecordConcurrentHandlerV1
./ng net.accelbyte.sdk.cli.Main cloudsave adminPutPlayerRecordConcurrentHandlerV1 \
    --key 'NQu6SdnL' \
    --namespace "$AB_NAMESPACE" \
    --userId '1GwBQl5y' \
    --responseBody  \
    --body '{"set_by": "CLIENT", "tags": ["3iyzTYyM", "yTPp1NSk", "raz5qYLE"], "ttl_config": {"action": "DELETE", "expires_at": "1986-01-12T00:00:00Z"}, "updatedAt": "1974-04-13T00:00:00Z", "value": {"YoUzh7jZ": {}, "5vhHddGN": {}, "bCu4ucIT": {}}}' \
    > test.out 2>&1
eval_tap $? 50 'AdminPutPlayerRecordConcurrentHandlerV1' test.out

#- 51 AdminPutPlayerPublicRecordConcurrentHandlerV1
./ng net.accelbyte.sdk.cli.Main cloudsave adminPutPlayerPublicRecordConcurrentHandlerV1 \
    --key 'X7QM7eI9' \
    --namespace "$AB_NAMESPACE" \
    --userId 'T42OjSsn' \
    --responseBody  \
    --body '{"set_by": "SERVER", "tags": ["4h1POiLr", "XdBsYsrz", "hifTE2mU"], "ttl_config": {"action": "DELETE", "expires_at": "1978-11-28T00:00:00Z"}, "updatedAt": "1994-11-26T00:00:00Z", "value": {"Y449IxxQ": {}, "31J4c8sW": {}, "lYBQjaUC": {}}}' \
    > test.out 2>&1
eval_tap $? 51 'AdminPutPlayerPublicRecordConcurrentHandlerV1' test.out

#- 52 AdminRetrievePlayerRecords
./ng net.accelbyte.sdk.cli.Main cloudsave adminRetrievePlayerRecords \
    --namespace "$AB_NAMESPACE" \
    --userId '7GrziAUn' \
    --limit '74' \
    --offset '43' \
    --query '1FJpH69O' \
    --tags 'h5KSW4mp,N4i8zRPJ,quCuQPur' \
    > test.out 2>&1
eval_tap $? 52 'AdminRetrievePlayerRecords' test.out

#- 53 AdminPutPlayerRecordsHandlerV1
./ng net.accelbyte.sdk.cli.Main cloudsave adminPutPlayerRecordsHandlerV1 \
    --namespace "$AB_NAMESPACE" \
    --userId '29A5WFGN' \
    --body '{"data": [{"key": "HkLm4WeQ", "value": {"qeF1Bcfh": {}, "PPYUSf6S": {}, "wMUKmhNz": {}}}, {"key": "mn7lGQ6I", "value": {"qugF5MOS": {}, "db8fw4iV": {}, "Fh8GLFTm": {}}}, {"key": "MTOWsw78", "value": {"MmQL2yz4": {}, "xUrAWw4t": {}, "BLByy1Sg": {}}}]}' \
    > test.out 2>&1
eval_tap $? 53 'AdminPutPlayerRecordsHandlerV1' test.out

#- 54 AdminGetPlayerRecordsHandlerV1
./ng net.accelbyte.sdk.cli.Main cloudsave adminGetPlayerRecordsHandlerV1 \
    --namespace "$AB_NAMESPACE" \
    --userId 'WlZeXAFI' \
    --body '{"keys": ["f4jSIdRN", "NtX3e2KE", "XH76GJ68"]}' \
    > test.out 2>&1
eval_tap $? 54 'AdminGetPlayerRecordsHandlerV1' test.out

#- 55 AdminGetPlayerRecordHandlerV1
./ng net.accelbyte.sdk.cli.Main cloudsave adminGetPlayerRecordHandlerV1 \
    --key 'rK3sV85p' \
    --namespace "$AB_NAMESPACE" \
    --userId 'QcQ8vIet' \
    > test.out 2>&1
eval_tap $? 55 'AdminGetPlayerRecordHandlerV1' test.out

#- 56 AdminPutPlayerRecordHandlerV1
./ng net.accelbyte.sdk.cli.Main cloudsave adminPutPlayerRecordHandlerV1 \
    --key 'NojWWfEQ' \
    --namespace "$AB_NAMESPACE" \
    --userId 'na7NOfFk' \
    --body '{}' \
    > test.out 2>&1
eval_tap $? 56 'AdminPutPlayerRecordHandlerV1' test.out

#- 57 AdminPostPlayerRecordHandlerV1
./ng net.accelbyte.sdk.cli.Main cloudsave adminPostPlayerRecordHandlerV1 \
    --key 'It6lCHbs' \
    --namespace "$AB_NAMESPACE" \
    --userId 'QDfhbvZP' \
    --body '{}' \
    > test.out 2>&1
eval_tap $? 57 'AdminPostPlayerRecordHandlerV1' test.out

#- 58 AdminDeletePlayerRecordHandlerV1
./ng net.accelbyte.sdk.cli.Main cloudsave adminDeletePlayerRecordHandlerV1 \
    --key 'knNlDKGc' \
    --namespace "$AB_NAMESPACE" \
    --userId 'sU3fQDA0' \
    > test.out 2>&1
eval_tap $? 58 'AdminDeletePlayerRecordHandlerV1' test.out

#- 59 AdminGetPlayerPublicRecordHandlerV1
./ng net.accelbyte.sdk.cli.Main cloudsave adminGetPlayerPublicRecordHandlerV1 \
    --key 'sLbotsO1' \
    --namespace "$AB_NAMESPACE" \
    --userId 'OYQVkWT4' \
    > test.out 2>&1
eval_tap $? 59 'AdminGetPlayerPublicRecordHandlerV1' test.out

#- 60 AdminPutPlayerPublicRecordHandlerV1
./ng net.accelbyte.sdk.cli.Main cloudsave adminPutPlayerPublicRecordHandlerV1 \
    --key '2iuSI82y' \
    --namespace "$AB_NAMESPACE" \
    --userId '4eURcyxC' \
    --body '{}' \
    > test.out 2>&1
eval_tap $? 60 'AdminPutPlayerPublicRecordHandlerV1' test.out

#- 61 AdminPostPlayerPublicRecordHandlerV1
./ng net.accelbyte.sdk.cli.Main cloudsave adminPostPlayerPublicRecordHandlerV1 \
    --key 'fba3hLxf' \
    --namespace "$AB_NAMESPACE" \
    --userId 'qm8uyLik' \
    --body '{}' \
    > test.out 2>&1
eval_tap $? 61 'AdminPostPlayerPublicRecordHandlerV1' test.out

#- 62 AdminDeletePlayerPublicRecordHandlerV1
./ng net.accelbyte.sdk.cli.Main cloudsave adminDeletePlayerPublicRecordHandlerV1 \
    --key 'rF3kV3QO' \
    --namespace "$AB_NAMESPACE" \
    --userId 'oIzenpGM' \
    > test.out 2>&1
eval_tap $? 62 'AdminDeletePlayerPublicRecordHandlerV1' test.out

#- 63 AdminGetPlayerRecordSizeHandlerV1
./ng net.accelbyte.sdk.cli.Main cloudsave adminGetPlayerRecordSizeHandlerV1 \
    --key 'NKlHVX4K' \
    --namespace "$AB_NAMESPACE" \
    --userId 'KvkFPw5w' \
    > test.out 2>&1
eval_tap $? 63 'AdminGetPlayerRecordSizeHandlerV1' test.out

#- 64 ListGameBinaryRecordsV1
./ng net.accelbyte.sdk.cli.Main cloudsave listGameBinaryRecordsV1 \
    --namespace "$AB_NAMESPACE" \
    --limit '16' \
    --offset '88' \
    --query 'tDQYXVoG' \
    --tags 'nrqpjXnj,eHDSaN6V,0HRgf2cM' \
    > test.out 2>&1
eval_tap $? 64 'ListGameBinaryRecordsV1' test.out

#- 65 PostGameBinaryRecordV1
./ng net.accelbyte.sdk.cli.Main cloudsave postGameBinaryRecordV1 \
    --namespace "$AB_NAMESPACE" \
    --body '{"file_type": "2mf40QYh", "key": "9UIiBR7b"}' \
    > test.out 2>&1
eval_tap $? 65 'PostGameBinaryRecordV1' test.out

#- 66 BulkGetGameBinaryRecordV1
./ng net.accelbyte.sdk.cli.Main cloudsave bulkGetGameBinaryRecordV1 \
    --namespace "$AB_NAMESPACE" \
    --body '{"keys": ["2dzzTfs6", "gXzzZrOk", "fvXrRimt"]}' \
    > test.out 2>&1
eval_tap $? 66 'BulkGetGameBinaryRecordV1' test.out

#- 67 GetGameBinaryRecordV1
./ng net.accelbyte.sdk.cli.Main cloudsave getGameBinaryRecordV1 \
    --key 'jsxntc0J' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 67 'GetGameBinaryRecordV1' test.out

#- 68 PutGameBinaryRecordV1
./ng net.accelbyte.sdk.cli.Main cloudsave putGameBinaryRecordV1 \
    --key 'Td0LCDMk' \
    --namespace "$AB_NAMESPACE" \
    --body '{"content_type": "7ktx8IIi", "file_location": "MQcmfmhG"}' \
    > test.out 2>&1
eval_tap $? 68 'PutGameBinaryRecordV1' test.out

#- 69 DeleteGameBinaryRecordV1
./ng net.accelbyte.sdk.cli.Main cloudsave deleteGameBinaryRecordV1 \
    --key 'blSbUfAL' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 69 'DeleteGameBinaryRecordV1' test.out

#- 70 PostGameBinaryPresignedURLV1
./ng net.accelbyte.sdk.cli.Main cloudsave postGameBinaryPresignedURLV1 \
    --key 'oOqDmQf8' \
    --namespace "$AB_NAMESPACE" \
    --body '{"file_type": "WeKzi1YQ"}' \
    > test.out 2>&1
eval_tap $? 70 'PostGameBinaryPresignedURLV1' test.out

#- 71 PutGameRecordConcurrentHandlerV1
./ng net.accelbyte.sdk.cli.Main cloudsave putGameRecordConcurrentHandlerV1 \
    --key 'GbmYPKW8' \
    --namespace "$AB_NAMESPACE" \
    --body '{"updatedAt": "1996-04-11T00:00:00Z", "value": {"zcV67fbL": {}, "XeuK2jlC": {}, "C73I7bGH": {}}}' \
    > test.out 2>&1
eval_tap $? 71 'PutGameRecordConcurrentHandlerV1' test.out

#- 72 GetGameRecordsBulk
./ng net.accelbyte.sdk.cli.Main cloudsave getGameRecordsBulk \
    --namespace "$AB_NAMESPACE" \
    --body '{"keys": ["LnmwsqeA", "WaVym6zC", "G67LkTr6"]}' \
    > test.out 2>&1
eval_tap $? 72 'GetGameRecordsBulk' test.out

#- 73 GetGameRecordHandlerV1
./ng net.accelbyte.sdk.cli.Main cloudsave getGameRecordHandlerV1 \
    --key 'xv6IYQuN' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 73 'GetGameRecordHandlerV1' test.out

#- 74 PutGameRecordHandlerV1
./ng net.accelbyte.sdk.cli.Main cloudsave putGameRecordHandlerV1 \
    --key 'AHthmQux' \
    --namespace "$AB_NAMESPACE" \
    --body '{}' \
    > test.out 2>&1
eval_tap $? 74 'PutGameRecordHandlerV1' test.out

#- 75 PostGameRecordHandlerV1
./ng net.accelbyte.sdk.cli.Main cloudsave postGameRecordHandlerV1 \
    --key 'sSnvlITf' \
    --namespace "$AB_NAMESPACE" \
    --body '{}' \
    > test.out 2>&1
eval_tap $? 75 'PostGameRecordHandlerV1' test.out

#- 76 DeleteGameRecordHandlerV1
./ng net.accelbyte.sdk.cli.Main cloudsave deleteGameRecordHandlerV1 \
    --key 'f9vgJqyz' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 76 'DeleteGameRecordHandlerV1' test.out

#- 77 PublicListTagsHandlerV1
./ng net.accelbyte.sdk.cli.Main cloudsave publicListTagsHandlerV1 \
    --namespace "$AB_NAMESPACE" \
    --limit '0' \
    --offset '2' \
    > test.out 2>&1
eval_tap $? 77 'PublicListTagsHandlerV1' test.out

#- 78 BulkGetPlayerPublicBinaryRecordsV1
./ng net.accelbyte.sdk.cli.Main cloudsave bulkGetPlayerPublicBinaryRecordsV1 \
    --key 'uDP0CVuh' \
    --namespace "$AB_NAMESPACE" \
    --body '{"userIds": ["PoZaHsh5", "mGhEYFm0", "exzTNstq"]}' \
    > test.out 2>&1
eval_tap $? 78 'BulkGetPlayerPublicBinaryRecordsV1' test.out

#- 79 BulkGetPlayerPublicRecordHandlerV1
./ng net.accelbyte.sdk.cli.Main cloudsave bulkGetPlayerPublicRecordHandlerV1 \
    --key 'HnAgTrfB' \
    --namespace "$AB_NAMESPACE" \
    --body '{"userIds": ["d9MKStzh", "zjR0rkyk", "gSYwacyM"]}' \
    > test.out 2>&1
eval_tap $? 79 'BulkGetPlayerPublicRecordHandlerV1' test.out

#- 80 ListMyBinaryRecordsV1
./ng net.accelbyte.sdk.cli.Main cloudsave listMyBinaryRecordsV1 \
    --namespace "$AB_NAMESPACE" \
    --limit '62' \
    --offset '34' \
    --query 'LKQ6deTO' \
    --tags 'TPvpKc4o,Dverzgi1,HGklJtjl' \
    > test.out 2>&1
eval_tap $? 80 'ListMyBinaryRecordsV1' test.out

#- 81 BulkGetMyBinaryRecordV1
./ng net.accelbyte.sdk.cli.Main cloudsave bulkGetMyBinaryRecordV1 \
    --namespace "$AB_NAMESPACE" \
    --body '{"keys": ["jp3lODJI", "BEkanvJW", "aRST6OFh"]}' \
    > test.out 2>&1
eval_tap $? 81 'BulkGetMyBinaryRecordV1' test.out

#- 82 RetrievePlayerRecords
./ng net.accelbyte.sdk.cli.Main cloudsave retrievePlayerRecords \
    --namespace "$AB_NAMESPACE" \
    --limit '63' \
    --offset '88' \
    --tags 'VMeuGenQ,AohvMC0w,eEGvOxw1' \
    > test.out 2>&1
eval_tap $? 82 'RetrievePlayerRecords' test.out

#- 83 GetPlayerRecordsBulkHandlerV1
./ng net.accelbyte.sdk.cli.Main cloudsave getPlayerRecordsBulkHandlerV1 \
    --namespace "$AB_NAMESPACE" \
    --body '{"keys": ["UtEHdDmU", "ARxoLtlK", "LX3eulgo"]}' \
    > test.out 2>&1
eval_tap $? 83 'GetPlayerRecordsBulkHandlerV1' test.out

#- 84 PublicDeletePlayerPublicRecordHandlerV1
./ng net.accelbyte.sdk.cli.Main cloudsave publicDeletePlayerPublicRecordHandlerV1 \
    --key 'KNY5LYxs' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 84 'PublicDeletePlayerPublicRecordHandlerV1' test.out

#- 85 PostPlayerBinaryRecordV1
./ng net.accelbyte.sdk.cli.Main cloudsave postPlayerBinaryRecordV1 \
    --namespace "$AB_NAMESPACE" \
    --userId 'HLgeJX5z' \
    --body '{"file_type": "wfP9ijtb", "is_public": true, "key": "A48u9kmu"}' \
    > test.out 2>&1
eval_tap $? 85 'PostPlayerBinaryRecordV1' test.out

#- 86 ListOtherPlayerPublicBinaryRecordsV1
./ng net.accelbyte.sdk.cli.Main cloudsave listOtherPlayerPublicBinaryRecordsV1 \
    --namespace "$AB_NAMESPACE" \
    --userId 'E0niFPPX' \
    --limit '40' \
    --offset '47' \
    --tags '8Hm3VHhu,lh71ZgMz,YUgG51Zx' \
    > test.out 2>&1
eval_tap $? 86 'ListOtherPlayerPublicBinaryRecordsV1' test.out

#- 87 BulkGetOtherPlayerPublicBinaryRecordsV1
./ng net.accelbyte.sdk.cli.Main cloudsave bulkGetOtherPlayerPublicBinaryRecordsV1 \
    --namespace "$AB_NAMESPACE" \
    --userId 'I8hTfVmM' \
    --body '{"keys": ["kNBvEfR5", "8MEgVNzg", "oTl1upox"]}' \
    > test.out 2>&1
eval_tap $? 87 'BulkGetOtherPlayerPublicBinaryRecordsV1' test.out

#- 88 GetPlayerBinaryRecordV1
./ng net.accelbyte.sdk.cli.Main cloudsave getPlayerBinaryRecordV1 \
    --key 'kDJ4g3ol' \
    --namespace "$AB_NAMESPACE" \
    --userId '2sTWcxrg' \
    > test.out 2>&1
eval_tap $? 88 'GetPlayerBinaryRecordV1' test.out

#- 89 PutPlayerBinaryRecordV1
./ng net.accelbyte.sdk.cli.Main cloudsave putPlayerBinaryRecordV1 \
    --key 'K0gd3Td2' \
    --namespace "$AB_NAMESPACE" \
    --userId 'kLIXSti2' \
    --body '{"content_type": "5r7cyRqI", "file_location": "A33SOJZ6"}' \
    > test.out 2>&1
eval_tap $? 89 'PutPlayerBinaryRecordV1' test.out

#- 90 DeletePlayerBinaryRecordV1
./ng net.accelbyte.sdk.cli.Main cloudsave deletePlayerBinaryRecordV1 \
    --key '0dyrqd12' \
    --namespace "$AB_NAMESPACE" \
    --userId 'EJfvVsD8' \
    > test.out 2>&1
eval_tap $? 90 'DeletePlayerBinaryRecordV1' test.out

#- 91 PutPlayerBinaryRecorMetadataV1
./ng net.accelbyte.sdk.cli.Main cloudsave putPlayerBinaryRecorMetadataV1 \
    --key 'ppLIi0et' \
    --namespace "$AB_NAMESPACE" \
    --userId 'kLmHcEVk' \
    --body '{"is_public": false}' \
    > test.out 2>&1
eval_tap $? 91 'PutPlayerBinaryRecorMetadataV1' test.out

#- 92 PostPlayerBinaryPresignedURLV1
./ng net.accelbyte.sdk.cli.Main cloudsave postPlayerBinaryPresignedURLV1 \
    --key '2wZtQgZC' \
    --namespace "$AB_NAMESPACE" \
    --userId 'tyXMNJm9' \
    --body '{"file_type": "F2GzYB2d"}' \
    > test.out 2>&1
eval_tap $? 92 'PostPlayerBinaryPresignedURLV1' test.out

#- 93 GetPlayerPublicBinaryRecordsV1
./ng net.accelbyte.sdk.cli.Main cloudsave getPlayerPublicBinaryRecordsV1 \
    --key 'aEhPcZpe' \
    --namespace "$AB_NAMESPACE" \
    --userId 'UJpHiE2V' \
    > test.out 2>&1
eval_tap $? 93 'GetPlayerPublicBinaryRecordsV1' test.out

#- 94 PutPlayerRecordConcurrentHandlerV1
./ng net.accelbyte.sdk.cli.Main cloudsave putPlayerRecordConcurrentHandlerV1 \
    --key 'kUFPA41U' \
    --namespace "$AB_NAMESPACE" \
    --userId 'pWwz7Rjm' \
    --responseBody  \
    --body '{"updatedAt": "1975-01-24T00:00:00Z", "value": {"qe0bplWv": {}, "BoiTTBIA": {}, "QWVwIkGW": {}}}' \
    > test.out 2>&1
eval_tap $? 94 'PutPlayerRecordConcurrentHandlerV1' test.out

#- 95 PutPlayerPublicRecordConcurrentHandlerV1
./ng net.accelbyte.sdk.cli.Main cloudsave putPlayerPublicRecordConcurrentHandlerV1 \
    --key 'OtuyCDGa' \
    --namespace "$AB_NAMESPACE" \
    --userId 'NWEj5m2S' \
    --responseBody  \
    --body '{"updatedAt": "1997-12-03T00:00:00Z", "value": {"nD5E7q2R": {}, "X7nmp54n": {}, "TUhBxRih": {}}}' \
    > test.out 2>&1
eval_tap $? 95 'PutPlayerPublicRecordConcurrentHandlerV1' test.out

#- 96 GetOtherPlayerPublicRecordKeyHandlerV1
./ng net.accelbyte.sdk.cli.Main cloudsave getOtherPlayerPublicRecordKeyHandlerV1 \
    --namespace "$AB_NAMESPACE" \
    --userId 'fdO1DA0n' \
    --limit '59' \
    --offset '31' \
    --tags '3dBqoL3m,FDuveSsl,B8fyUaPh' \
    > test.out 2>&1
eval_tap $? 96 'GetOtherPlayerPublicRecordKeyHandlerV1' test.out

#- 97 GetOtherPlayerPublicRecordHandlerV1
./ng net.accelbyte.sdk.cli.Main cloudsave getOtherPlayerPublicRecordHandlerV1 \
    --namespace "$AB_NAMESPACE" \
    --userId 'tbsNQ3Ql' \
    --body '{"keys": ["YqIYgF5V", "GnzeGsFf", "cDWut2ou"]}' \
    > test.out 2>&1
eval_tap $? 97 'GetOtherPlayerPublicRecordHandlerV1' test.out

#- 98 GetPlayerRecordHandlerV1
./ng net.accelbyte.sdk.cli.Main cloudsave getPlayerRecordHandlerV1 \
    --key 'HfxQXuTf' \
    --namespace "$AB_NAMESPACE" \
    --userId '1auP38vC' \
    > test.out 2>&1
eval_tap $? 98 'GetPlayerRecordHandlerV1' test.out

#- 99 PutPlayerRecordHandlerV1
./ng net.accelbyte.sdk.cli.Main cloudsave putPlayerRecordHandlerV1 \
    --key 'ObBpQmhm' \
    --namespace "$AB_NAMESPACE" \
    --userId 'FflDXvY8' \
    --body '{}' \
    > test.out 2>&1
eval_tap $? 99 'PutPlayerRecordHandlerV1' test.out

#- 100 PostPlayerRecordHandlerV1
./ng net.accelbyte.sdk.cli.Main cloudsave postPlayerRecordHandlerV1 \
    --key 'djPdd2hk' \
    --namespace "$AB_NAMESPACE" \
    --userId 'GMazOAUs' \
    --body '{}' \
    > test.out 2>&1
eval_tap $? 100 'PostPlayerRecordHandlerV1' test.out

#- 101 DeletePlayerRecordHandlerV1
./ng net.accelbyte.sdk.cli.Main cloudsave deletePlayerRecordHandlerV1 \
    --key '7vvgGDux' \
    --namespace "$AB_NAMESPACE" \
    --userId 'msGpZ3Bu' \
    > test.out 2>&1
eval_tap $? 101 'DeletePlayerRecordHandlerV1' test.out

#- 102 GetPlayerPublicRecordHandlerV1
./ng net.accelbyte.sdk.cli.Main cloudsave getPlayerPublicRecordHandlerV1 \
    --key 'vJOjmLFt' \
    --namespace "$AB_NAMESPACE" \
    --userId 'tmliWshS' \
    > test.out 2>&1
eval_tap $? 102 'GetPlayerPublicRecordHandlerV1' test.out

#- 103 PutPlayerPublicRecordHandlerV1
./ng net.accelbyte.sdk.cli.Main cloudsave putPlayerPublicRecordHandlerV1 \
    --key 'G2MNltKW' \
    --namespace "$AB_NAMESPACE" \
    --userId 'UOCls5FC' \
    --body '{}' \
    > test.out 2>&1
eval_tap $? 103 'PutPlayerPublicRecordHandlerV1' test.out

#- 104 PostPlayerPublicRecordHandlerV1
./ng net.accelbyte.sdk.cli.Main cloudsave postPlayerPublicRecordHandlerV1 \
    --key 'u8A7nyLW' \
    --namespace "$AB_NAMESPACE" \
    --userId 'nJ7ewanO' \
    --body '{}' \
    > test.out 2>&1
eval_tap $? 104 'PostPlayerPublicRecordHandlerV1' test.out


rm -f "tmp.dat"

exit $EXIT_CODE