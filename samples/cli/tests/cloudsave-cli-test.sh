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
    --limit '66' \
    --offset '58' \
    --query 'I2HV52U5' \
    > test.out 2>&1
eval_tap $? 2 'AdminListAdminGameRecordV1' test.out

#- 3 AdminBulkGetAdminGameRecordV1
./ng net.accelbyte.sdk.cli.Main cloudsave adminBulkGetAdminGameRecordV1 \
    --namespace "$AB_NAMESPACE" \
    --body '{"keys": ["y7Bhyl20", "5hsRpcOp", "hCFuzsr6"]}' \
    > test.out 2>&1
eval_tap $? 3 'AdminBulkGetAdminGameRecordV1' test.out

#- 4 AdminGetAdminGameRecordV1
./ng net.accelbyte.sdk.cli.Main cloudsave adminGetAdminGameRecordV1 \
    --key 'Y4zaHWVi' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 4 'AdminGetAdminGameRecordV1' test.out

#- 5 AdminPutAdminGameRecordV1
./ng net.accelbyte.sdk.cli.Main cloudsave adminPutAdminGameRecordV1 \
    --key 'E3MAT6Bo' \
    --namespace "$AB_NAMESPACE" \
    --body '{}' \
    > test.out 2>&1
eval_tap $? 5 'AdminPutAdminGameRecordV1' test.out

#- 6 AdminPostAdminGameRecordV1
./ng net.accelbyte.sdk.cli.Main cloudsave adminPostAdminGameRecordV1 \
    --key 'y2HOPDwr' \
    --namespace "$AB_NAMESPACE" \
    --body '{}' \
    > test.out 2>&1
eval_tap $? 6 'AdminPostAdminGameRecordV1' test.out

#- 7 AdminDeleteAdminGameRecordV1
./ng net.accelbyte.sdk.cli.Main cloudsave adminDeleteAdminGameRecordV1 \
    --key 'EZgMN71y' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 7 'AdminDeleteAdminGameRecordV1' test.out

#- 8 AdminListGameBinaryRecordsV1
./ng net.accelbyte.sdk.cli.Main cloudsave adminListGameBinaryRecordsV1 \
    --namespace "$AB_NAMESPACE" \
    --limit '95' \
    --offset '65' \
    --query 'Hu55P8hR' \
    > test.out 2>&1
eval_tap $? 8 'AdminListGameBinaryRecordsV1' test.out

#- 9 AdminPostGameBinaryRecordV1
./ng net.accelbyte.sdk.cli.Main cloudsave adminPostGameBinaryRecordV1 \
    --namespace "$AB_NAMESPACE" \
    --body '{"file_type": "q6SqGr8e", "key": "gSy3JoaU", "set_by": "CLIENT"}' \
    > test.out 2>&1
eval_tap $? 9 'AdminPostGameBinaryRecordV1' test.out

#- 10 AdminGetGameBinaryRecordV1
./ng net.accelbyte.sdk.cli.Main cloudsave adminGetGameBinaryRecordV1 \
    --key 'K2I8GQhG' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 10 'AdminGetGameBinaryRecordV1' test.out

#- 11 AdminPutGameBinaryRecordV1
./ng net.accelbyte.sdk.cli.Main cloudsave adminPutGameBinaryRecordV1 \
    --key 'unY9vSXc' \
    --namespace "$AB_NAMESPACE" \
    --body '{"content_type": "byBUXEej", "file_location": "a9pr5QIh"}' \
    > test.out 2>&1
eval_tap $? 11 'AdminPutGameBinaryRecordV1' test.out

#- 12 AdminDeleteGameBinaryRecordV1
./ng net.accelbyte.sdk.cli.Main cloudsave adminDeleteGameBinaryRecordV1 \
    --key 'bD4nRXiy' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 12 'AdminDeleteGameBinaryRecordV1' test.out

#- 13 AdminPutGameBinaryRecorMetadataV1
./ng net.accelbyte.sdk.cli.Main cloudsave adminPutGameBinaryRecorMetadataV1 \
    --key 'IQ3yGMez' \
    --namespace "$AB_NAMESPACE" \
    --body '{"set_by": "SERVER"}' \
    > test.out 2>&1
eval_tap $? 13 'AdminPutGameBinaryRecorMetadataV1' test.out

#- 14 AdminPostGameBinaryPresignedURLV1
./ng net.accelbyte.sdk.cli.Main cloudsave adminPostGameBinaryPresignedURLV1 \
    --key 'UMSvafB5' \
    --namespace "$AB_NAMESPACE" \
    --body '{"file_type": "NSsEtMoq"}' \
    > test.out 2>&1
eval_tap $? 14 'AdminPostGameBinaryPresignedURLV1' test.out

#- 15 AdminPutAdminGameRecordConcurrentHandlerV1
./ng net.accelbyte.sdk.cli.Main cloudsave adminPutAdminGameRecordConcurrentHandlerV1 \
    --key '6k6ovGd3' \
    --namespace "$AB_NAMESPACE" \
    --body '{"updatedAt": "SCCK4BIu", "value": {"M0bAum6Z": {}, "dmB4PK1W": {}, "ZuFIvi3d": {}}}' \
    > test.out 2>&1
eval_tap $? 15 'AdminPutAdminGameRecordConcurrentHandlerV1' test.out

#- 16 AdminPutGameRecordConcurrentHandlerV1
./ng net.accelbyte.sdk.cli.Main cloudsave adminPutGameRecordConcurrentHandlerV1 \
    --key '0wkjFV8v' \
    --namespace "$AB_NAMESPACE" \
    --body '{"set_by": "CLIENT", "updatedAt": "rILlH2ft", "value": {"k5jHCntd": {}, "3jegZxwe": {}, "DV7uEiGP": {}}}' \
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
    --body '{"appConfig": {"appName": "ZgqUSdsA"}, "customConfig": {"GRPCAddress": "yhANQ7ID"}, "customFunction": {"afterBulkReadGameBinaryRecord": false, "afterBulkReadGameRecord": true, "afterBulkReadPlayerBinaryRecord": false, "afterBulkReadPlayerRecord": false, "afterReadGameBinaryRecord": false, "afterReadGameRecord": false, "afterReadPlayerBinaryRecord": false, "afterReadPlayerRecord": true, "beforeWriteAdminGameRecord": true, "beforeWriteAdminPlayerRecord": true, "beforeWriteGameBinaryRecord": false, "beforeWriteGameRecord": false, "beforeWritePlayerBinaryRecord": false, "beforeWritePlayerRecord": true}, "extendType": "APP"}' \
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
    --body '{"appConfig": {"appName": "BHHrVcZh"}, "customConfig": {"GRPCAddress": "taQninhT"}, "customFunction": {"afterBulkReadGameBinaryRecord": false, "afterBulkReadGameRecord": true, "afterBulkReadPlayerBinaryRecord": false, "afterBulkReadPlayerRecord": true, "afterReadGameBinaryRecord": true, "afterReadGameRecord": true, "afterReadPlayerBinaryRecord": false, "afterReadPlayerRecord": false, "beforeWriteAdminGameRecord": false, "beforeWriteAdminPlayerRecord": true, "beforeWriteGameBinaryRecord": true, "beforeWriteGameRecord": false, "beforeWritePlayerBinaryRecord": true, "beforeWritePlayerRecord": false}, "extendType": "CUSTOM"}' \
    > test.out 2>&1
eval_tap $? 20 'UpdatePluginConfig' test.out

#- 21 ListGameRecordsHandlerV1
./ng net.accelbyte.sdk.cli.Main cloudsave listGameRecordsHandlerV1 \
    --namespace "$AB_NAMESPACE" \
    --query 'IaK2bcq8' \
    --limit '33' \
    --offset '85' \
    > test.out 2>&1
eval_tap $? 21 'ListGameRecordsHandlerV1' test.out

#- 22 AdminGetGameRecordHandlerV1
./ng net.accelbyte.sdk.cli.Main cloudsave adminGetGameRecordHandlerV1 \
    --key 'R7g97nPO' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 22 'AdminGetGameRecordHandlerV1' test.out

#- 23 AdminPutGameRecordHandlerV1
./ng net.accelbyte.sdk.cli.Main cloudsave adminPutGameRecordHandlerV1 \
    --key 'xaEQWYBk' \
    --namespace "$AB_NAMESPACE" \
    --body '{}' \
    > test.out 2>&1
eval_tap $? 23 'AdminPutGameRecordHandlerV1' test.out

#- 24 AdminPostGameRecordHandlerV1
./ng net.accelbyte.sdk.cli.Main cloudsave adminPostGameRecordHandlerV1 \
    --key 'DWklOm8P' \
    --namespace "$AB_NAMESPACE" \
    --body '{}' \
    > test.out 2>&1
eval_tap $? 24 'AdminPostGameRecordHandlerV1' test.out

#- 25 AdminDeleteGameRecordHandlerV1
./ng net.accelbyte.sdk.cli.Main cloudsave adminDeleteGameRecordHandlerV1 \
    --key '0v1GL6Ti' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 25 'AdminDeleteGameRecordHandlerV1' test.out

#- 26 BulkGetAdminPlayerRecordByUserIdsV1
./ng net.accelbyte.sdk.cli.Main cloudsave bulkGetAdminPlayerRecordByUserIdsV1 \
    --key 'uEQrGjPi' \
    --namespace "$AB_NAMESPACE" \
    --body '{"userIds": ["CnJ5Y4ld", "czuCGjtN", "nq7D0H5m"]}' \
    > test.out 2>&1
eval_tap $? 26 'BulkGetAdminPlayerRecordByUserIdsV1' test.out

#- 27 BulkGetPlayerRecordSizeHandlerV1
./ng net.accelbyte.sdk.cli.Main cloudsave bulkGetPlayerRecordSizeHandlerV1 \
    --namespace "$AB_NAMESPACE" \
    --body '{"data": [{"keys": ["R4wbmiAW", "lD0xKWLg", "HsFhPdE5"], "user_id": "ucS36kae"}, {"keys": ["h4A3eggo", "4verSA8u", "TX5TszMQ"], "user_id": "043sxaOZ"}, {"keys": ["WnQ9YzuW", "pRsHp0rS", "728Fouiu"], "user_id": "ACvrN8ce"}]}' \
    > test.out 2>&1
eval_tap $? 27 'BulkGetPlayerRecordSizeHandlerV1' test.out

#- 28 ListPlayerRecordHandlerV1
eval_tap 0 28 'ListPlayerRecordHandlerV1 # SKIP deprecated' test.out

#- 29 AdminListAdminUserRecordsV1
./ng net.accelbyte.sdk.cli.Main cloudsave adminListAdminUserRecordsV1 \
    --namespace "$AB_NAMESPACE" \
    --userId 'PgVvtcvd' \
    --limit '66' \
    --offset '25' \
    > test.out 2>&1
eval_tap $? 29 'AdminListAdminUserRecordsV1' test.out

#- 30 AdminBulkGetAdminPlayerRecordV1
./ng net.accelbyte.sdk.cli.Main cloudsave adminBulkGetAdminPlayerRecordV1 \
    --namespace "$AB_NAMESPACE" \
    --userId 'YIHRL3Kv' \
    --body '{"keys": ["KAtAuLg0", "zSHypRne", "JMk50GEJ"]}' \
    > test.out 2>&1
eval_tap $? 30 'AdminBulkGetAdminPlayerRecordV1' test.out

#- 31 AdminGetAdminPlayerRecordV1
./ng net.accelbyte.sdk.cli.Main cloudsave adminGetAdminPlayerRecordV1 \
    --key 'xAoxiuPI' \
    --namespace "$AB_NAMESPACE" \
    --userId 'pqhzHmku' \
    > test.out 2>&1
eval_tap $? 31 'AdminGetAdminPlayerRecordV1' test.out

#- 32 AdminPutAdminPlayerRecordV1
./ng net.accelbyte.sdk.cli.Main cloudsave adminPutAdminPlayerRecordV1 \
    --key 'z7VazpWH' \
    --namespace "$AB_NAMESPACE" \
    --userId 'kIxxBgDk' \
    --body '{}' \
    > test.out 2>&1
eval_tap $? 32 'AdminPutAdminPlayerRecordV1' test.out

#- 33 AdminPostPlayerAdminRecordV1
./ng net.accelbyte.sdk.cli.Main cloudsave adminPostPlayerAdminRecordV1 \
    --key 'WXeNVYCl' \
    --namespace "$AB_NAMESPACE" \
    --userId 'FXW3qnMq' \
    --body '{}' \
    > test.out 2>&1
eval_tap $? 33 'AdminPostPlayerAdminRecordV1' test.out

#- 34 AdminDeleteAdminPlayerRecordV1
./ng net.accelbyte.sdk.cli.Main cloudsave adminDeleteAdminPlayerRecordV1 \
    --key '0DwcLVhZ' \
    --namespace "$AB_NAMESPACE" \
    --userId 'GYLhELwj' \
    > test.out 2>&1
eval_tap $? 34 'AdminDeleteAdminPlayerRecordV1' test.out

#- 35 AdminListPlayerBinaryRecordsV1
./ng net.accelbyte.sdk.cli.Main cloudsave adminListPlayerBinaryRecordsV1 \
    --namespace "$AB_NAMESPACE" \
    --userId 'NWUZNR0J' \
    --limit '88' \
    --offset '13' \
    --query 't3PR10Si' \
    > test.out 2>&1
eval_tap $? 35 'AdminListPlayerBinaryRecordsV1' test.out

#- 36 AdminPostPlayerBinaryRecordV1
./ng net.accelbyte.sdk.cli.Main cloudsave adminPostPlayerBinaryRecordV1 \
    --namespace "$AB_NAMESPACE" \
    --userId 'bODIePCR' \
    --body '{"file_type": "RMqBJLJe", "is_public": true, "key": "eFJOi70i", "set_by": "CLIENT"}' \
    > test.out 2>&1
eval_tap $? 36 'AdminPostPlayerBinaryRecordV1' test.out

#- 37 AdminGetPlayerBinaryRecordV1
./ng net.accelbyte.sdk.cli.Main cloudsave adminGetPlayerBinaryRecordV1 \
    --key 'GIGVPGqw' \
    --namespace "$AB_NAMESPACE" \
    --userId 'NO8Oswom' \
    > test.out 2>&1
eval_tap $? 37 'AdminGetPlayerBinaryRecordV1' test.out

#- 38 AdminPutPlayerBinaryRecordV1
./ng net.accelbyte.sdk.cli.Main cloudsave adminPutPlayerBinaryRecordV1 \
    --key 'RQMwFSeG' \
    --namespace "$AB_NAMESPACE" \
    --userId 'CobLaJeP' \
    --body '{"content_type": "jZYfPh1G", "file_location": "iE1WKwN5"}' \
    > test.out 2>&1
eval_tap $? 38 'AdminPutPlayerBinaryRecordV1' test.out

#- 39 AdminDeletePlayerBinaryRecordV1
./ng net.accelbyte.sdk.cli.Main cloudsave adminDeletePlayerBinaryRecordV1 \
    --key 'UsNlnZDF' \
    --namespace "$AB_NAMESPACE" \
    --userId 'SsajNb9K' \
    > test.out 2>&1
eval_tap $? 39 'AdminDeletePlayerBinaryRecordV1' test.out

#- 40 AdminPutPlayerBinaryRecorMetadataV1
./ng net.accelbyte.sdk.cli.Main cloudsave adminPutPlayerBinaryRecorMetadataV1 \
    --key 'R9A8OBF1' \
    --namespace "$AB_NAMESPACE" \
    --userId 'utLITG8W' \
    --body '{"is_public": false, "set_by": "SERVER"}' \
    > test.out 2>&1
eval_tap $? 40 'AdminPutPlayerBinaryRecorMetadataV1' test.out

#- 41 AdminPostPlayerBinaryPresignedURLV1
./ng net.accelbyte.sdk.cli.Main cloudsave adminPostPlayerBinaryPresignedURLV1 \
    --key 'RPfhLB81' \
    --namespace "$AB_NAMESPACE" \
    --userId '5vDiQzXD' \
    --body '{"file_type": "yzcsX5UA"}' \
    > test.out 2>&1
eval_tap $? 41 'AdminPostPlayerBinaryPresignedURLV1' test.out

#- 42 AdminPutAdminPlayerRecordConcurrentHandlerV1
./ng net.accelbyte.sdk.cli.Main cloudsave adminPutAdminPlayerRecordConcurrentHandlerV1 \
    --key '5CZVRgM5' \
    --namespace "$AB_NAMESPACE" \
    --userId '2FrFVfNH' \
    --responseBody  \
    --body '{"updatedAt": "E4AM7gv7", "value": {"ObGpaSTn": {}, "yKFCh8wV": {}, "hybRKDpP": {}}}' \
    > test.out 2>&1
eval_tap $? 42 'AdminPutAdminPlayerRecordConcurrentHandlerV1' test.out

#- 43 AdminPutPlayerRecordConcurrentHandlerV1
./ng net.accelbyte.sdk.cli.Main cloudsave adminPutPlayerRecordConcurrentHandlerV1 \
    --key 'KkSIodLC' \
    --namespace "$AB_NAMESPACE" \
    --userId 'oRzKXSUu' \
    --responseBody  \
    --body '{"set_by": "SERVER", "updatedAt": "UuNALXbq", "value": {"f9u5iB6Q": {}, "TKPxvRa5": {}, "HHrPPsw3": {}}}' \
    > test.out 2>&1
eval_tap $? 43 'AdminPutPlayerRecordConcurrentHandlerV1' test.out

#- 44 AdminPutPlayerPublicRecordConcurrentHandlerV1
./ng net.accelbyte.sdk.cli.Main cloudsave adminPutPlayerPublicRecordConcurrentHandlerV1 \
    --key 'oxjzq1wo' \
    --namespace "$AB_NAMESPACE" \
    --userId 'dFK7lEmU' \
    --responseBody  \
    --body '{"set_by": "SERVER", "updatedAt": "22bZjAg5", "value": {"mHaH3kwN": {}, "YlxZ8rKV": {}, "HTAyfRIV": {}}}' \
    > test.out 2>&1
eval_tap $? 44 'AdminPutPlayerPublicRecordConcurrentHandlerV1' test.out

#- 45 AdminRetrievePlayerRecords
./ng net.accelbyte.sdk.cli.Main cloudsave adminRetrievePlayerRecords \
    --namespace "$AB_NAMESPACE" \
    --userId 'nAnuC4kk' \
    --limit '84' \
    --offset '6' \
    > test.out 2>&1
eval_tap $? 45 'AdminRetrievePlayerRecords' test.out

#- 46 AdminPutPlayerRecordsHandlerV1
./ng net.accelbyte.sdk.cli.Main cloudsave adminPutPlayerRecordsHandlerV1 \
    --namespace "$AB_NAMESPACE" \
    --userId 'J1fGcYQJ' \
    --body '{"data": [{"key": "7k93jLXv", "value": {"y8p9abcI": {}, "KBNLtSx3": {}, "ENkUrMIO": {}}}, {"key": "vmSnHkEI", "value": {"tozKHGg3": {}, "W8tsSVi7": {}, "ha3SsiBe": {}}}, {"key": "M08R3TqG", "value": {"7Bzl72X3": {}, "N4IjCD11": {}, "wRZ8tSLi": {}}}]}' \
    > test.out 2>&1
eval_tap $? 46 'AdminPutPlayerRecordsHandlerV1' test.out

#- 47 AdminGetPlayerRecordsHandlerV1
./ng net.accelbyte.sdk.cli.Main cloudsave adminGetPlayerRecordsHandlerV1 \
    --namespace "$AB_NAMESPACE" \
    --userId 'CtMQt6xx' \
    --body '{"keys": ["J0Xp6Mey", "XkzhxyWA", "uwkQSwc8"]}' \
    > test.out 2>&1
eval_tap $? 47 'AdminGetPlayerRecordsHandlerV1' test.out

#- 48 AdminGetPlayerRecordHandlerV1
./ng net.accelbyte.sdk.cli.Main cloudsave adminGetPlayerRecordHandlerV1 \
    --key 'XJOAcmHL' \
    --namespace "$AB_NAMESPACE" \
    --userId 'TnyXovtE' \
    > test.out 2>&1
eval_tap $? 48 'AdminGetPlayerRecordHandlerV1' test.out

#- 49 AdminPutPlayerRecordHandlerV1
./ng net.accelbyte.sdk.cli.Main cloudsave adminPutPlayerRecordHandlerV1 \
    --key 'erT7HsaQ' \
    --namespace "$AB_NAMESPACE" \
    --userId 'Mh6PXAmF' \
    --body '{}' \
    > test.out 2>&1
eval_tap $? 49 'AdminPutPlayerRecordHandlerV1' test.out

#- 50 AdminPostPlayerRecordHandlerV1
./ng net.accelbyte.sdk.cli.Main cloudsave adminPostPlayerRecordHandlerV1 \
    --key 'DMV5XrEz' \
    --namespace "$AB_NAMESPACE" \
    --userId 'bTybaHlu' \
    --body '{}' \
    > test.out 2>&1
eval_tap $? 50 'AdminPostPlayerRecordHandlerV1' test.out

#- 51 AdminDeletePlayerRecordHandlerV1
./ng net.accelbyte.sdk.cli.Main cloudsave adminDeletePlayerRecordHandlerV1 \
    --key 'PUYLDhtv' \
    --namespace "$AB_NAMESPACE" \
    --userId 'WEAvLMud' \
    > test.out 2>&1
eval_tap $? 51 'AdminDeletePlayerRecordHandlerV1' test.out

#- 52 AdminGetPlayerPublicRecordHandlerV1
./ng net.accelbyte.sdk.cli.Main cloudsave adminGetPlayerPublicRecordHandlerV1 \
    --key 'fXALUqLj' \
    --namespace "$AB_NAMESPACE" \
    --userId 'LUGkdKZo' \
    > test.out 2>&1
eval_tap $? 52 'AdminGetPlayerPublicRecordHandlerV1' test.out

#- 53 AdminPutPlayerPublicRecordHandlerV1
./ng net.accelbyte.sdk.cli.Main cloudsave adminPutPlayerPublicRecordHandlerV1 \
    --key '8mOPuLsg' \
    --namespace "$AB_NAMESPACE" \
    --userId 'h2QBjWeC' \
    --body '{}' \
    > test.out 2>&1
eval_tap $? 53 'AdminPutPlayerPublicRecordHandlerV1' test.out

#- 54 AdminPostPlayerPublicRecordHandlerV1
./ng net.accelbyte.sdk.cli.Main cloudsave adminPostPlayerPublicRecordHandlerV1 \
    --key 'eukHULDk' \
    --namespace "$AB_NAMESPACE" \
    --userId 'pMjLY2li' \
    --body '{}' \
    > test.out 2>&1
eval_tap $? 54 'AdminPostPlayerPublicRecordHandlerV1' test.out

#- 55 AdminDeletePlayerPublicRecordHandlerV1
./ng net.accelbyte.sdk.cli.Main cloudsave adminDeletePlayerPublicRecordHandlerV1 \
    --key 'aFWb8Smg' \
    --namespace "$AB_NAMESPACE" \
    --userId 'myNAjSNA' \
    > test.out 2>&1
eval_tap $? 55 'AdminDeletePlayerPublicRecordHandlerV1' test.out

#- 56 AdminGetPlayerRecordSizeHandlerV1
./ng net.accelbyte.sdk.cli.Main cloudsave adminGetPlayerRecordSizeHandlerV1 \
    --key 'y3zn12YF' \
    --namespace "$AB_NAMESPACE" \
    --userId 'aZosqPIh' \
    > test.out 2>&1
eval_tap $? 56 'AdminGetPlayerRecordSizeHandlerV1' test.out

#- 57 ListGameBinaryRecordsV1
./ng net.accelbyte.sdk.cli.Main cloudsave listGameBinaryRecordsV1 \
    --namespace "$AB_NAMESPACE" \
    --limit '5' \
    --offset '68' \
    --query 'jLiVRKC8' \
    > test.out 2>&1
eval_tap $? 57 'ListGameBinaryRecordsV1' test.out

#- 58 PostGameBinaryRecordV1
./ng net.accelbyte.sdk.cli.Main cloudsave postGameBinaryRecordV1 \
    --namespace "$AB_NAMESPACE" \
    --body '{"file_type": "tMqBNpEf", "key": "IZyBZOi7"}' \
    > test.out 2>&1
eval_tap $? 58 'PostGameBinaryRecordV1' test.out

#- 59 BulkGetGameBinaryRecordV1
./ng net.accelbyte.sdk.cli.Main cloudsave bulkGetGameBinaryRecordV1 \
    --namespace "$AB_NAMESPACE" \
    --body '{"keys": ["1CNDpL8i", "b6uaOb2c", "HIuzUlLh"]}' \
    > test.out 2>&1
eval_tap $? 59 'BulkGetGameBinaryRecordV1' test.out

#- 60 GetGameBinaryRecordV1
./ng net.accelbyte.sdk.cli.Main cloudsave getGameBinaryRecordV1 \
    --key '2TI41eYW' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 60 'GetGameBinaryRecordV1' test.out

#- 61 PutGameBinaryRecordV1
./ng net.accelbyte.sdk.cli.Main cloudsave putGameBinaryRecordV1 \
    --key 'M2U0VSSh' \
    --namespace "$AB_NAMESPACE" \
    --body '{"content_type": "GAB1gz1O", "file_location": "z6AP11le"}' \
    > test.out 2>&1
eval_tap $? 61 'PutGameBinaryRecordV1' test.out

#- 62 DeleteGameBinaryRecordV1
./ng net.accelbyte.sdk.cli.Main cloudsave deleteGameBinaryRecordV1 \
    --key '5K2XqTaQ' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 62 'DeleteGameBinaryRecordV1' test.out

#- 63 PostGameBinaryPresignedURLV1
./ng net.accelbyte.sdk.cli.Main cloudsave postGameBinaryPresignedURLV1 \
    --key 'ajaHXs2G' \
    --namespace "$AB_NAMESPACE" \
    --body '{"file_type": "KpD1XXej"}' \
    > test.out 2>&1
eval_tap $? 63 'PostGameBinaryPresignedURLV1' test.out

#- 64 PutGameRecordConcurrentHandlerV1
./ng net.accelbyte.sdk.cli.Main cloudsave putGameRecordConcurrentHandlerV1 \
    --key '6uu4Cdhw' \
    --namespace "$AB_NAMESPACE" \
    --body '{"updatedAt": "gbEixL72", "value": {"3SzfxWdo": {}, "VUpbZ9rK": {}, "so2UpoKx": {}}}' \
    > test.out 2>&1
eval_tap $? 64 'PutGameRecordConcurrentHandlerV1' test.out

#- 65 GetGameRecordsBulk
./ng net.accelbyte.sdk.cli.Main cloudsave getGameRecordsBulk \
    --namespace "$AB_NAMESPACE" \
    --body '{"keys": ["uZhDcySW", "RPx0Jp3I", "94ySz2Al"]}' \
    > test.out 2>&1
eval_tap $? 65 'GetGameRecordsBulk' test.out

#- 66 GetGameRecordHandlerV1
./ng net.accelbyte.sdk.cli.Main cloudsave getGameRecordHandlerV1 \
    --key 'in6Lcpk0' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 66 'GetGameRecordHandlerV1' test.out

#- 67 PutGameRecordHandlerV1
./ng net.accelbyte.sdk.cli.Main cloudsave putGameRecordHandlerV1 \
    --key 'YuhJ5NBk' \
    --namespace "$AB_NAMESPACE" \
    --body '{}' \
    > test.out 2>&1
eval_tap $? 67 'PutGameRecordHandlerV1' test.out

#- 68 PostGameRecordHandlerV1
./ng net.accelbyte.sdk.cli.Main cloudsave postGameRecordHandlerV1 \
    --key 'Epin6kBZ' \
    --namespace "$AB_NAMESPACE" \
    --body '{}' \
    > test.out 2>&1
eval_tap $? 68 'PostGameRecordHandlerV1' test.out

#- 69 DeleteGameRecordHandlerV1
./ng net.accelbyte.sdk.cli.Main cloudsave deleteGameRecordHandlerV1 \
    --key '72u6l6Xz' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 69 'DeleteGameRecordHandlerV1' test.out

#- 70 BulkGetPlayerPublicBinaryRecordsV1
./ng net.accelbyte.sdk.cli.Main cloudsave bulkGetPlayerPublicBinaryRecordsV1 \
    --key 'sPRcdNZn' \
    --namespace "$AB_NAMESPACE" \
    --body '{"userIds": ["UobF43Ia", "LgIonMic", "ij6Kbw0j"]}' \
    > test.out 2>&1
eval_tap $? 70 'BulkGetPlayerPublicBinaryRecordsV1' test.out

#- 71 BulkGetPlayerPublicRecordHandlerV1
./ng net.accelbyte.sdk.cli.Main cloudsave bulkGetPlayerPublicRecordHandlerV1 \
    --key 'LGfmd5zf' \
    --namespace "$AB_NAMESPACE" \
    --body '{"userIds": ["YMIIXxhr", "cZmrF0Id", "sMRfmrLg"]}' \
    > test.out 2>&1
eval_tap $? 71 'BulkGetPlayerPublicRecordHandlerV1' test.out

#- 72 ListMyBinaryRecordsV1
./ng net.accelbyte.sdk.cli.Main cloudsave listMyBinaryRecordsV1 \
    --namespace "$AB_NAMESPACE" \
    --limit '98' \
    --offset '14' \
    --query 'Y4mAx9js' \
    > test.out 2>&1
eval_tap $? 72 'ListMyBinaryRecordsV1' test.out

#- 73 BulkGetMyBinaryRecordV1
./ng net.accelbyte.sdk.cli.Main cloudsave bulkGetMyBinaryRecordV1 \
    --namespace "$AB_NAMESPACE" \
    --body '{"keys": ["UEUqUdwi", "lb3Mw3QW", "yxz2QboF"]}' \
    > test.out 2>&1
eval_tap $? 73 'BulkGetMyBinaryRecordV1' test.out

#- 74 RetrievePlayerRecords
./ng net.accelbyte.sdk.cli.Main cloudsave retrievePlayerRecords \
    --namespace "$AB_NAMESPACE" \
    --limit '14' \
    --offset '11' \
    > test.out 2>&1
eval_tap $? 74 'RetrievePlayerRecords' test.out

#- 75 GetPlayerRecordsBulkHandlerV1
./ng net.accelbyte.sdk.cli.Main cloudsave getPlayerRecordsBulkHandlerV1 \
    --namespace "$AB_NAMESPACE" \
    --body '{"keys": ["oCYGcEnj", "bhz3HoXe", "LheJOppM"]}' \
    > test.out 2>&1
eval_tap $? 75 'GetPlayerRecordsBulkHandlerV1' test.out

#- 76 PublicDeletePlayerPublicRecordHandlerV1
./ng net.accelbyte.sdk.cli.Main cloudsave publicDeletePlayerPublicRecordHandlerV1 \
    --key 'zqR0Xqfk' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 76 'PublicDeletePlayerPublicRecordHandlerV1' test.out

#- 77 PostPlayerBinaryRecordV1
./ng net.accelbyte.sdk.cli.Main cloudsave postPlayerBinaryRecordV1 \
    --namespace "$AB_NAMESPACE" \
    --userId 'ho6hN7Bn' \
    --body '{"file_type": "MxghvFLI", "is_public": false, "key": "ETJOJdOn"}' \
    > test.out 2>&1
eval_tap $? 77 'PostPlayerBinaryRecordV1' test.out

#- 78 ListOtherPlayerPublicBinaryRecordsV1
./ng net.accelbyte.sdk.cli.Main cloudsave listOtherPlayerPublicBinaryRecordsV1 \
    --namespace "$AB_NAMESPACE" \
    --userId 'QOGRR0HJ' \
    --limit '18' \
    --offset '72' \
    > test.out 2>&1
eval_tap $? 78 'ListOtherPlayerPublicBinaryRecordsV1' test.out

#- 79 BulkGetOtherPlayerPublicBinaryRecordsV1
./ng net.accelbyte.sdk.cli.Main cloudsave bulkGetOtherPlayerPublicBinaryRecordsV1 \
    --namespace "$AB_NAMESPACE" \
    --userId '8gakNoCq' \
    --body '{"keys": ["umgTc72I", "HnjeGSlB", "VAU3rA71"]}' \
    > test.out 2>&1
eval_tap $? 79 'BulkGetOtherPlayerPublicBinaryRecordsV1' test.out

#- 80 GetPlayerBinaryRecordV1
./ng net.accelbyte.sdk.cli.Main cloudsave getPlayerBinaryRecordV1 \
    --key '9D9zgUwy' \
    --namespace "$AB_NAMESPACE" \
    --userId 'PrQi77Ra' \
    > test.out 2>&1
eval_tap $? 80 'GetPlayerBinaryRecordV1' test.out

#- 81 PutPlayerBinaryRecordV1
./ng net.accelbyte.sdk.cli.Main cloudsave putPlayerBinaryRecordV1 \
    --key '5RTGVmyJ' \
    --namespace "$AB_NAMESPACE" \
    --userId 'MnOGjVEf' \
    --body '{"content_type": "wjAD0VsA", "file_location": "55uHHsvE"}' \
    > test.out 2>&1
eval_tap $? 81 'PutPlayerBinaryRecordV1' test.out

#- 82 DeletePlayerBinaryRecordV1
./ng net.accelbyte.sdk.cli.Main cloudsave deletePlayerBinaryRecordV1 \
    --key 'bOgKeH83' \
    --namespace "$AB_NAMESPACE" \
    --userId 'iYo14hlH' \
    > test.out 2>&1
eval_tap $? 82 'DeletePlayerBinaryRecordV1' test.out

#- 83 PutPlayerBinaryRecorMetadataV1
./ng net.accelbyte.sdk.cli.Main cloudsave putPlayerBinaryRecorMetadataV1 \
    --key 'S4xpIoKG' \
    --namespace "$AB_NAMESPACE" \
    --userId 'k5yFTo7H' \
    --body '{"is_public": false}' \
    > test.out 2>&1
eval_tap $? 83 'PutPlayerBinaryRecorMetadataV1' test.out

#- 84 PostPlayerBinaryPresignedURLV1
./ng net.accelbyte.sdk.cli.Main cloudsave postPlayerBinaryPresignedURLV1 \
    --key 'oi5IMtDa' \
    --namespace "$AB_NAMESPACE" \
    --userId 'CnmSrDFZ' \
    --body '{"file_type": "0r82ZJso"}' \
    > test.out 2>&1
eval_tap $? 84 'PostPlayerBinaryPresignedURLV1' test.out

#- 85 GetPlayerPublicBinaryRecordsV1
./ng net.accelbyte.sdk.cli.Main cloudsave getPlayerPublicBinaryRecordsV1 \
    --key '4OhAPFJS' \
    --namespace "$AB_NAMESPACE" \
    --userId '7dDd7rHM' \
    > test.out 2>&1
eval_tap $? 85 'GetPlayerPublicBinaryRecordsV1' test.out

#- 86 PutPlayerRecordConcurrentHandlerV1
./ng net.accelbyte.sdk.cli.Main cloudsave putPlayerRecordConcurrentHandlerV1 \
    --key '2WMkfC39' \
    --namespace "$AB_NAMESPACE" \
    --userId 'ci5W8ldo' \
    --responseBody  \
    --body '{"updatedAt": "c4r0JWn4", "value": {"V85CNDAi": {}, "ZZf3Jdcf": {}, "pOkQqZ8e": {}}}' \
    > test.out 2>&1
eval_tap $? 86 'PutPlayerRecordConcurrentHandlerV1' test.out

#- 87 PutPlayerPublicRecordConcurrentHandlerV1
./ng net.accelbyte.sdk.cli.Main cloudsave putPlayerPublicRecordConcurrentHandlerV1 \
    --key 'UBtUBWoP' \
    --namespace "$AB_NAMESPACE" \
    --userId 'G3ISolnE' \
    --responseBody  \
    --body '{"updatedAt": "uRArypdK", "value": {"CBC2ZyWS": {}, "tdMuZZg6": {}, "b4paWo9F": {}}}' \
    > test.out 2>&1
eval_tap $? 87 'PutPlayerPublicRecordConcurrentHandlerV1' test.out

#- 88 GetOtherPlayerPublicRecordKeyHandlerV1
./ng net.accelbyte.sdk.cli.Main cloudsave getOtherPlayerPublicRecordKeyHandlerV1 \
    --namespace "$AB_NAMESPACE" \
    --userId 'xn4MJdH1' \
    --limit '0' \
    --offset '53' \
    > test.out 2>&1
eval_tap $? 88 'GetOtherPlayerPublicRecordKeyHandlerV1' test.out

#- 89 GetOtherPlayerPublicRecordHandlerV1
./ng net.accelbyte.sdk.cli.Main cloudsave getOtherPlayerPublicRecordHandlerV1 \
    --namespace "$AB_NAMESPACE" \
    --userId 'tTkixTEo' \
    --body '{"keys": ["yrrXou5l", "JOS4I5Js", "AyIgtfwo"]}' \
    > test.out 2>&1
eval_tap $? 89 'GetOtherPlayerPublicRecordHandlerV1' test.out

#- 90 GetPlayerRecordHandlerV1
./ng net.accelbyte.sdk.cli.Main cloudsave getPlayerRecordHandlerV1 \
    --key 'MY3p8HPu' \
    --namespace "$AB_NAMESPACE" \
    --userId 'hUyuWPMK' \
    > test.out 2>&1
eval_tap $? 90 'GetPlayerRecordHandlerV1' test.out

#- 91 PutPlayerRecordHandlerV1
./ng net.accelbyte.sdk.cli.Main cloudsave putPlayerRecordHandlerV1 \
    --key 'D9F6KS9r' \
    --namespace "$AB_NAMESPACE" \
    --userId 'qgmcMiUq' \
    --body '{}' \
    > test.out 2>&1
eval_tap $? 91 'PutPlayerRecordHandlerV1' test.out

#- 92 PostPlayerRecordHandlerV1
./ng net.accelbyte.sdk.cli.Main cloudsave postPlayerRecordHandlerV1 \
    --key 'x12JM8wS' \
    --namespace "$AB_NAMESPACE" \
    --userId 'FOHLXnHV' \
    --body '{}' \
    > test.out 2>&1
eval_tap $? 92 'PostPlayerRecordHandlerV1' test.out

#- 93 DeletePlayerRecordHandlerV1
./ng net.accelbyte.sdk.cli.Main cloudsave deletePlayerRecordHandlerV1 \
    --key 'LxTFQ5vy' \
    --namespace "$AB_NAMESPACE" \
    --userId '1q6TYrIj' \
    > test.out 2>&1
eval_tap $? 93 'DeletePlayerRecordHandlerV1' test.out

#- 94 GetPlayerPublicRecordHandlerV1
./ng net.accelbyte.sdk.cli.Main cloudsave getPlayerPublicRecordHandlerV1 \
    --key 'ct8CXrYA' \
    --namespace "$AB_NAMESPACE" \
    --userId 'QY2Sjmz7' \
    > test.out 2>&1
eval_tap $? 94 'GetPlayerPublicRecordHandlerV1' test.out

#- 95 PutPlayerPublicRecordHandlerV1
./ng net.accelbyte.sdk.cli.Main cloudsave putPlayerPublicRecordHandlerV1 \
    --key '67g4m68f' \
    --namespace "$AB_NAMESPACE" \
    --userId 'dsGURjaq' \
    --body '{}' \
    > test.out 2>&1
eval_tap $? 95 'PutPlayerPublicRecordHandlerV1' test.out

#- 96 PostPlayerPublicRecordHandlerV1
./ng net.accelbyte.sdk.cli.Main cloudsave postPlayerPublicRecordHandlerV1 \
    --key 'RtW60SSe' \
    --namespace "$AB_NAMESPACE" \
    --userId 'SXByYoAN' \
    --body '{}' \
    > test.out 2>&1
eval_tap $? 96 'PostPlayerPublicRecordHandlerV1' test.out


rm -f "tmp.dat"

exit $EXIT_CODE