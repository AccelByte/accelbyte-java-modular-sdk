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
echo "1..99"

#- 1 Login
./ng net.accelbyte.sdk.cli.Main loginClient \
    > test.out 2>&1
eval_tap $? 1 'Login' test.out

if [ $EXIT_CODE -ne 0 ]; then
  echo "Bail out! Login failed."
  exit $EXIT_CODE
fi

touch "tmp.dat"

#- 2 GetNamespaceSlotConfig
eval_tap 0 2 'GetNamespaceSlotConfig # SKIP deprecated' test.out

#- 3 UpdateNamespaceSlotConfig
eval_tap 0 3 'UpdateNamespaceSlotConfig # SKIP deprecated' test.out

#- 4 DeleteNamespaceSlotConfig
eval_tap 0 4 'DeleteNamespaceSlotConfig # SKIP deprecated' test.out

#- 5 GetUserSlotConfig
eval_tap 0 5 'GetUserSlotConfig # SKIP deprecated' test.out

#- 6 UpdateUserSlotConfig
eval_tap 0 6 'UpdateUserSlotConfig # SKIP deprecated' test.out

#- 7 DeleteUserSlotConfig
eval_tap 0 7 'DeleteUserSlotConfig # SKIP deprecated' test.out

#- 8 GetUserProfiles
eval_tap 0 8 'GetUserProfiles # SKIP deprecated' test.out

#- 9 GetProfile
eval_tap 0 9 'GetProfile # SKIP deprecated' test.out

#- 10 GetUserNamespaceSlots
eval_tap 0 10 'GetUserNamespaceSlots # SKIP deprecated' test.out

#- 11 GetSlotData
eval_tap 0 11 'GetSlotData # SKIP deprecated' test.out

#- 12 PublicGetUserGameProfiles
eval_tap 0 12 'PublicGetUserGameProfiles # SKIP deprecated' test.out

#- 13 PublicGetUserProfiles
eval_tap 0 13 'PublicGetUserProfiles # SKIP deprecated' test.out

#- 14 PublicCreateProfile
eval_tap 0 14 'PublicCreateProfile # SKIP deprecated' test.out

#- 15 PublicGetProfile
eval_tap 0 15 'PublicGetProfile # SKIP deprecated' test.out

#- 16 PublicUpdateProfile
eval_tap 0 16 'PublicUpdateProfile # SKIP deprecated' test.out

#- 17 PublicDeleteProfile
eval_tap 0 17 'PublicDeleteProfile # SKIP deprecated' test.out

#- 18 PublicGetProfileAttribute
eval_tap 0 18 'PublicGetProfileAttribute # SKIP deprecated' test.out

#- 19 PublicUpdateAttribute
eval_tap 0 19 'PublicUpdateAttribute # SKIP deprecated' test.out

#- 20 PublicGetUserNamespaceSlots
eval_tap 0 20 'PublicGetUserNamespaceSlots # SKIP deprecated' test.out

#- 21 PublicCreateUserNamespaceSlot
eval_tap 0 21 'PublicCreateUserNamespaceSlot # SKIP deprecated' test.out

#- 22 PublicGetSlotData
eval_tap 0 22 'PublicGetSlotData # SKIP deprecated' test.out

#- 23 PublicUpdateUserNamespaceSlot
eval_tap 0 23 'PublicUpdateUserNamespaceSlot # SKIP deprecated' test.out

#- 24 PublicDeleteUserNamespaceSlot
eval_tap 0 24 'PublicDeleteUserNamespaceSlot # SKIP deprecated' test.out

#- 25 PublicUpdateUserNamespaceSlotMetadata
eval_tap 0 25 'PublicUpdateUserNamespaceSlotMetadata # SKIP deprecated' test.out

#- 26 GetGlobalStatItems
./ng net.accelbyte.sdk.cli.Main social getGlobalStatItems \
    --namespace "$AB_NAMESPACE" \
    --limit '83' \
    --offset '42' \
    --statCodes 'o9XFaFK4' \
    > test.out 2>&1
eval_tap $? 26 'GetGlobalStatItems' test.out

#- 27 GetGlobalStatItemByStatCode
./ng net.accelbyte.sdk.cli.Main social getGlobalStatItemByStatCode \
    --namespace "$AB_NAMESPACE" \
    --statCode 'HHnaJs1J' \
    > test.out 2>&1
eval_tap $? 27 'GetGlobalStatItemByStatCode' test.out

#- 28 GetStatCycles
./ng net.accelbyte.sdk.cli.Main social getStatCycles \
    --namespace "$AB_NAMESPACE" \
    --cycleType 'SEASONAL' \
    --limit '47' \
    --name 'OTnUUtLJ' \
    --offset '20' \
    --sortBy 'YeK3jCKv' \
    --status 'ACTIVE' \
    > test.out 2>&1
eval_tap $? 28 'GetStatCycles' test.out

#- 29 CreateStatCycle
./ng net.accelbyte.sdk.cli.Main social createStatCycle \
    --namespace "$AB_NAMESPACE" \
    --body '{"cycleType": "MONTHLY", "description": "q2FcQ26J", "end": "1972-03-22T00:00:00Z", "id": "0BGxig0u", "name": "b2Xh49Wo", "resetDate": 10, "resetDay": 77, "resetMonth": 39, "resetTime": "bstRqj9J", "seasonPeriod": 2, "start": "1985-12-22T00:00:00Z"}' \
    > test.out 2>&1
eval_tap $? 29 'CreateStatCycle' test.out

#- 30 BulkGetStatCycle
./ng net.accelbyte.sdk.cli.Main social bulkGetStatCycle \
    --namespace "$AB_NAMESPACE" \
    --body '{"cycleIds": ["OdRpPxPw", "j2Cv38fg", "evv6klHj"]}' \
    > test.out 2>&1
eval_tap $? 30 'BulkGetStatCycle' test.out

#- 31 ExportStatCycle
./ng net.accelbyte.sdk.cli.Main social exportStatCycle \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 31 'ExportStatCycle' test.out

#- 32 ImportStatCycle
./ng net.accelbyte.sdk.cli.Main social importStatCycle \
    --namespace "$AB_NAMESPACE" \
    --replaceExisting  \
    --file 'tmp.dat' \
    > test.out 2>&1
eval_tap $? 32 'ImportStatCycle' test.out

#- 33 GetStatCycle
./ng net.accelbyte.sdk.cli.Main social getStatCycle \
    --cycleId '9Pk1fA4Z' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 33 'GetStatCycle' test.out

#- 34 UpdateStatCycle
./ng net.accelbyte.sdk.cli.Main social updateStatCycle \
    --cycleId 'pI5pDU6h' \
    --namespace "$AB_NAMESPACE" \
    --body '{"cycleType": "WEEKLY", "description": "CQp1rVg3", "end": "1992-11-21T00:00:00Z", "name": "aIYNi5yw", "resetDate": 53, "resetDay": 33, "resetMonth": 40, "resetTime": "TVDRuL5x", "seasonPeriod": 55, "start": "1988-03-07T00:00:00Z"}' \
    > test.out 2>&1
eval_tap $? 34 'UpdateStatCycle' test.out

#- 35 DeleteStatCycle
./ng net.accelbyte.sdk.cli.Main social deleteStatCycle \
    --cycleId '4lGsJBMS' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 35 'DeleteStatCycle' test.out

#- 36 BulkAddStats
./ng net.accelbyte.sdk.cli.Main social bulkAddStats \
    --cycleId 'S4EZx3Fz' \
    --namespace "$AB_NAMESPACE" \
    --body '{"statCodes": ["2EEGbnB2", "FSuTG0IT", "dgFhHIJx"]}' \
    > test.out 2>&1
eval_tap $? 36 'BulkAddStats' test.out

#- 37 StopStatCycle
./ng net.accelbyte.sdk.cli.Main social stopStatCycle \
    --cycleId 'nKYrmwMR' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 37 'StopStatCycle' test.out

#- 38 BulkFetchStatItems
./ng net.accelbyte.sdk.cli.Main social bulkFetchStatItems \
    --namespace "$AB_NAMESPACE" \
    --statCode 'YfMQasTj' \
    --userIds 'lI8rLyny' \
    > test.out 2>&1
eval_tap $? 38 'BulkFetchStatItems' test.out

#- 39 BulkIncUserStatItem
./ng net.accelbyte.sdk.cli.Main social bulkIncUserStatItem \
    --namespace "$AB_NAMESPACE" \
    --body '[{"inc": 0.1734790187293096, "statCode": "XCbQHGDQ", "userId": "me4RiqU6"}, {"inc": 0.7146047695183921, "statCode": "qjqbpIZC", "userId": "9dmoeuRC"}, {"inc": 0.9159964336218578, "statCode": "osY0uBNY", "userId": "48ObZ9bE"}]' \
    > test.out 2>&1
eval_tap $? 39 'BulkIncUserStatItem' test.out

#- 40 BulkIncUserStatItemValue
./ng net.accelbyte.sdk.cli.Main social bulkIncUserStatItemValue \
    --namespace "$AB_NAMESPACE" \
    --body '[{"inc": 0.8651817439389203, "statCode": "MIhMnJol", "userId": "o5ZZw6bA"}, {"inc": 0.619371318853396, "statCode": "9P9xJBNu", "userId": "DNnTuiTj"}, {"inc": 0.9428248321371072, "statCode": "0E9qqGiA", "userId": "oJgTMwTp"}]' \
    > test.out 2>&1
eval_tap $? 40 'BulkIncUserStatItemValue' test.out

#- 41 BulkFetchOrDefaultStatItems
./ng net.accelbyte.sdk.cli.Main social bulkFetchOrDefaultStatItems \
    --namespace "$AB_NAMESPACE" \
    --statCode 'Rqt4dWGg' \
    --userIds 'ycFyCJla,CPqaNz8C,ZhRhui6u' \
    > test.out 2>&1
eval_tap $? 41 'BulkFetchOrDefaultStatItems' test.out

#- 42 BulkResetUserStatItem
./ng net.accelbyte.sdk.cli.Main social bulkResetUserStatItem \
    --namespace "$AB_NAMESPACE" \
    --body '[{"statCode": "RJpOFAED", "userId": "9dRaeSia"}, {"statCode": "ISDVJCVY", "userId": "bCqDSp23"}, {"statCode": "4ZR73k57", "userId": "ebQAFgYH"}]' \
    > test.out 2>&1
eval_tap $? 42 'BulkResetUserStatItem' test.out

#- 43 GetStats
./ng net.accelbyte.sdk.cli.Main social getStats \
    --namespace "$AB_NAMESPACE" \
    --cycleIds 's15m7OkY' \
    --isGlobal  \
    --isPublic  \
    --limit '77' \
    --offset '44' \
    > test.out 2>&1
eval_tap $? 43 'GetStats' test.out

#- 44 CreateStat
./ng net.accelbyte.sdk.cli.Main social createStat \
    --namespace "$AB_NAMESPACE" \
    --body '{"capCycleOverride": false, "cycleIds": ["TEIarJEP", "PPMfj6Ts", "Nu2axUya"], "cycleOverrides": [{"cycleId": "K17xdCMK", "maximum": 0.8477471527929608, "minimum": 0.009020181761542956}, {"cycleId": "zOg57SAn", "maximum": 0.7883540131146782, "minimum": 0.5498663791178685}, {"cycleId": "IBAUgkpw", "maximum": 0.7810575897712271, "minimum": 0.949069757828633}], "defaultValue": 0.01720167218820401, "description": "85WO8b6n", "globalAggregationMethod": "TOTAL", "ignoreAdditionalDataOnValueRejected": false, "incrementOnly": false, "isPublic": false, "maximum": 0.4824708488976016, "minimum": 0.07582969057950473, "name": "lVy9JYmz", "setAsGlobal": false, "setBy": "CLIENT", "statCode": "SauNz2ea", "tags": ["jos5SJWs", "feh4ELmW", "swwYCy1Q"], "visibility": "SERVERONLY"}' \
    > test.out 2>&1
eval_tap $? 44 'CreateStat' test.out

#- 45 ExportStats
./ng net.accelbyte.sdk.cli.Main social exportStats \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 45 'ExportStats' test.out

#- 46 ImportStats
./ng net.accelbyte.sdk.cli.Main social importStats \
    --namespace "$AB_NAMESPACE" \
    --replaceExisting  \
    --file 'tmp.dat' \
    > test.out 2>&1
eval_tap $? 46 'ImportStats' test.out

#- 47 QueryStats
./ng net.accelbyte.sdk.cli.Main social queryStats \
    --namespace "$AB_NAMESPACE" \
    --isGlobal  \
    --isPublic  \
    --limit '54' \
    --offset '15' \
    --keyword 'I7cy1URz' \
    > test.out 2>&1
eval_tap $? 47 'QueryStats' test.out

#- 48 GetStat
./ng net.accelbyte.sdk.cli.Main social getStat \
    --namespace "$AB_NAMESPACE" \
    --statCode 'UTFHhVEC' \
    > test.out 2>&1
eval_tap $? 48 'GetStat' test.out

#- 49 DeleteStat
./ng net.accelbyte.sdk.cli.Main social deleteStat \
    --namespace "$AB_NAMESPACE" \
    --statCode 'N8NFQtQ1' \
    > test.out 2>&1
eval_tap $? 49 'DeleteStat' test.out

#- 50 UpdateStat
./ng net.accelbyte.sdk.cli.Main social updateStat \
    --namespace "$AB_NAMESPACE" \
    --statCode 'piFwsufC' \
    --body '{"capCycleOverride": true, "cycleIds": ["WgZKEl4b", "z500Y2Xo", "PBWXKodG"], "cycleOverrides": [{"cycleId": "LJbTsQvV", "maximum": 0.23631866096163967, "minimum": 0.6681512809456461}, {"cycleId": "VCniqgCi", "maximum": 0.1841708192079402, "minimum": 0.6749257500319029}, {"cycleId": "5oDsY9xq", "maximum": 0.2873074960138622, "minimum": 0.4219777694507868}], "defaultValue": 0.11538450775072262, "description": "HvLsVIiY", "globalAggregationMethod": "MAX", "ignoreAdditionalDataOnValueRejected": true, "isPublic": true, "name": "AzGvoI1I", "tags": ["Isc7WMGT", "pyQCQxuy", "g047431V"], "visibility": "SHOWALL"}' \
    > test.out 2>&1
eval_tap $? 50 'UpdateStat' test.out

#- 51 GetStatItems
./ng net.accelbyte.sdk.cli.Main social getStatItems \
    --namespace "$AB_NAMESPACE" \
    --statCode 'HPe0bHe5' \
    --limit '29' \
    --offset '87' \
    --sortBy 'mOJSA9aw' \
    > test.out 2>&1
eval_tap $? 51 'GetStatItems' test.out

#- 52 DeleteTiedStat
./ng net.accelbyte.sdk.cli.Main social deleteTiedStat \
    --namespace "$AB_NAMESPACE" \
    --statCode 'vfiWRALV' \
    > test.out 2>&1
eval_tap $? 52 'DeleteTiedStat' test.out

#- 53 GetUserStatCycleItems
./ng net.accelbyte.sdk.cli.Main social getUserStatCycleItems \
    --cycleId 'zb7ssw8d' \
    --namespace "$AB_NAMESPACE" \
    --userId 'KL7Y2soF' \
    --isPublic  \
    --limit '99' \
    --offset '61' \
    --sortBy 'R0pzGhSc' \
    --statCodes 'KpkJ1l5w' \
    > test.out 2>&1
eval_tap $? 53 'GetUserStatCycleItems' test.out

#- 54 GetUserStatItems
./ng net.accelbyte.sdk.cli.Main social getUserStatItems \
    --namespace "$AB_NAMESPACE" \
    --userId 'AxUR44hw' \
    --isPublic  \
    --limit '40' \
    --offset '72' \
    --sortBy 'Yrv6Vgbe' \
    --statCodes '0R2BAfXf' \
    --tags 'OOGyNXDg' \
    > test.out 2>&1
eval_tap $? 54 'GetUserStatItems' test.out

#- 55 BulkCreateUserStatItems
./ng net.accelbyte.sdk.cli.Main social bulkCreateUserStatItems \
    --namespace "$AB_NAMESPACE" \
    --userId 'y9iQPA2I' \
    --body '[{"statCode": "nNXnfxmy"}, {"statCode": "zKlmmw3N"}, {"statCode": "6uLvoBNl"}]' \
    > test.out 2>&1
eval_tap $? 55 'BulkCreateUserStatItems' test.out

#- 56 BulkIncUserStatItem1
./ng net.accelbyte.sdk.cli.Main social bulkIncUserStatItem1 \
    --namespace "$AB_NAMESPACE" \
    --userId '9pRXAqSQ' \
    --body '[{"inc": 0.05563575226266948, "statCode": "rDenm2dV"}, {"inc": 0.3615953272342689, "statCode": "kWjRCDgC"}, {"inc": 0.756343903894033, "statCode": "Shm86Oso"}]' \
    > test.out 2>&1
eval_tap $? 56 'BulkIncUserStatItem1' test.out

#- 57 BulkIncUserStatItemValue1
./ng net.accelbyte.sdk.cli.Main social bulkIncUserStatItemValue1 \
    --namespace "$AB_NAMESPACE" \
    --userId '0roMPWIF' \
    --body '[{"inc": 0.7538194576701174, "statCode": "OR2MnwwA"}, {"inc": 0.33375768133000405, "statCode": "VhtWVt8C"}, {"inc": 0.7825554781456879, "statCode": "6uHKSX6L"}]' \
    > test.out 2>&1
eval_tap $? 57 'BulkIncUserStatItemValue1' test.out

#- 58 BulkResetUserStatItem1
./ng net.accelbyte.sdk.cli.Main social bulkResetUserStatItem1 \
    --namespace "$AB_NAMESPACE" \
    --userId '0mRCsfc3' \
    --body '[{"statCode": "tXkabvbR"}, {"statCode": "ODOKWSfZ"}, {"statCode": "KkTtZJQu"}]' \
    > test.out 2>&1
eval_tap $? 58 'BulkResetUserStatItem1' test.out

#- 59 CreateUserStatItem
./ng net.accelbyte.sdk.cli.Main social createUserStatItem \
    --namespace "$AB_NAMESPACE" \
    --statCode 'iBaZJ4XT' \
    --userId 'cYZKjkl6' \
    > test.out 2>&1
eval_tap $? 59 'CreateUserStatItem' test.out

#- 60 DeleteUserStatItems
./ng net.accelbyte.sdk.cli.Main social deleteUserStatItems \
    --namespace "$AB_NAMESPACE" \
    --statCode 'TKzAqpV4' \
    --userId 'fZ7Oslxf' \
    > test.out 2>&1
eval_tap $? 60 'DeleteUserStatItems' test.out

#- 61 IncUserStatItemValue
./ng net.accelbyte.sdk.cli.Main social incUserStatItemValue \
    --namespace "$AB_NAMESPACE" \
    --statCode 'm8stBPB3' \
    --userId 'tubPqebQ' \
    --body '{"inc": 0.3906527910730957}' \
    > test.out 2>&1
eval_tap $? 61 'IncUserStatItemValue' test.out

#- 62 ResetUserStatItemValue
./ng net.accelbyte.sdk.cli.Main social resetUserStatItemValue \
    --namespace "$AB_NAMESPACE" \
    --statCode 'YC3Q1Q0g' \
    --userId '8WAdRJob' \
    --additionalKey 'UN5V7mxx' \
    --body '{"additionalData": {"OIu8E1DZ": {}, "9DKtqoX6": {}, "QrtwUE3s": {}}}' \
    > test.out 2>&1
eval_tap $? 62 'ResetUserStatItemValue' test.out

#- 63 GetGlobalStatItems1
./ng net.accelbyte.sdk.cli.Main social getGlobalStatItems1 \
    --namespace "$AB_NAMESPACE" \
    --limit '8' \
    --offset '13' \
    --statCodes 'vPPoYc9K' \
    > test.out 2>&1
eval_tap $? 63 'GetGlobalStatItems1' test.out

#- 64 GetGlobalStatItemByStatCode1
./ng net.accelbyte.sdk.cli.Main social getGlobalStatItemByStatCode1 \
    --namespace "$AB_NAMESPACE" \
    --statCode 'HT5zX6sS' \
    > test.out 2>&1
eval_tap $? 64 'GetGlobalStatItemByStatCode1' test.out

#- 65 GetStatCycles1
./ng net.accelbyte.sdk.cli.Main social getStatCycles1 \
    --namespace "$AB_NAMESPACE" \
    --cycleType 'WEEKLY' \
    --limit '32' \
    --name 'naQtiYch' \
    --offset '81' \
    --sortBy 'BnsocWHf' \
    --status 'ACTIVE' \
    > test.out 2>&1
eval_tap $? 65 'GetStatCycles1' test.out

#- 66 BulkGetStatCycle1
./ng net.accelbyte.sdk.cli.Main social bulkGetStatCycle1 \
    --namespace "$AB_NAMESPACE" \
    --body '{"cycleIds": ["Yqch44uI", "86JhFuhr", "r6KcLsuH"]}' \
    > test.out 2>&1
eval_tap $? 66 'BulkGetStatCycle1' test.out

#- 67 GetStatCycle1
./ng net.accelbyte.sdk.cli.Main social getStatCycle1 \
    --cycleId 'RbTJrvDU' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 67 'GetStatCycle1' test.out

#- 68 BulkFetchStatItems1
./ng net.accelbyte.sdk.cli.Main social bulkFetchStatItems1 \
    --namespace "$AB_NAMESPACE" \
    --statCode 'WQ1nCacG' \
    --userIds 'BsJHb2iq' \
    > test.out 2>&1
eval_tap $? 68 'BulkFetchStatItems1' test.out

#- 69 PublicBulkIncUserStatItem
./ng net.accelbyte.sdk.cli.Main social publicBulkIncUserStatItem \
    --namespace "$AB_NAMESPACE" \
    --body '[{"inc": 0.6322256768189233, "statCode": "SHniqScl", "userId": "INwF8EwW"}, {"inc": 0.06761575237011741, "statCode": "HFWklnoj", "userId": "ESm2ncPU"}, {"inc": 0.5865469189327742, "statCode": "dnQkDpPk", "userId": "TONaQLPC"}]' \
    > test.out 2>&1
eval_tap $? 69 'PublicBulkIncUserStatItem' test.out

#- 70 PublicBulkIncUserStatItemValue
./ng net.accelbyte.sdk.cli.Main social publicBulkIncUserStatItemValue \
    --namespace "$AB_NAMESPACE" \
    --body '[{"inc": 0.1933725093327957, "statCode": "imhGX5kZ", "userId": "U4SkBkhh"}, {"inc": 0.9084040257946333, "statCode": "5bO8T7Vp", "userId": "9M7hPqw6"}, {"inc": 0.2027728194412587, "statCode": "lzuH4SMe", "userId": "ajXIw0EI"}]' \
    > test.out 2>&1
eval_tap $? 70 'PublicBulkIncUserStatItemValue' test.out

#- 71 BulkResetUserStatItem2
./ng net.accelbyte.sdk.cli.Main social bulkResetUserStatItem2 \
    --namespace "$AB_NAMESPACE" \
    --body '[{"statCode": "g8lsy8Rh", "userId": "UdpFpPla"}, {"statCode": "jpjaeu82", "userId": "IWQ5d7N9"}, {"statCode": "ZzzFlbzn", "userId": "ujJNICLh"}]' \
    > test.out 2>&1
eval_tap $? 71 'BulkResetUserStatItem2' test.out

#- 72 CreateStat1
./ng net.accelbyte.sdk.cli.Main social createStat1 \
    --namespace "$AB_NAMESPACE" \
    --body '{"capCycleOverride": true, "cycleIds": ["cPT9g71J", "wqcVFyk2", "M25bEfKe"], "cycleOverrides": [{"cycleId": "DfkYPXdg", "maximum": 0.6113860770404267, "minimum": 0.8709760463715515}, {"cycleId": "OabYr3SI", "maximum": 0.42125864079561715, "minimum": 0.016517532572885907}, {"cycleId": "mThZQPEr", "maximum": 0.7084406781346628, "minimum": 0.5347579626317315}], "defaultValue": 0.8033290768549377, "description": "qArJBv0A", "globalAggregationMethod": "LAST", "ignoreAdditionalDataOnValueRejected": false, "incrementOnly": false, "isPublic": false, "maximum": 0.2456747611481397, "minimum": 0.8156360793291032, "name": "TeQ7avSe", "setAsGlobal": true, "setBy": "SERVER", "statCode": "8PIVLrSv", "tags": ["3lZnvd02", "VH6CUow1", "KNCmESnY"], "visibility": "SERVERONLY"}' \
    > test.out 2>&1
eval_tap $? 72 'CreateStat1' test.out

#- 73 PublicListMyStatCycleItems
./ng net.accelbyte.sdk.cli.Main social publicListMyStatCycleItems \
    --cycleId 'GOdHbVqk' \
    --namespace "$AB_NAMESPACE" \
    --limit '62' \
    --offset '55' \
    --sortBy 'mksov9UA' \
    --statCodes '1OpbwRlZ,fKahdQjN,3umH98Do' \
    > test.out 2>&1
eval_tap $? 73 'PublicListMyStatCycleItems' test.out

#- 74 PublicListMyStatItems
./ng net.accelbyte.sdk.cli.Main social publicListMyStatItems \
    --namespace "$AB_NAMESPACE" \
    --limit '19' \
    --offset '48' \
    --sortBy 'BDbKnKyi' \
    --statCodes 'zyUgy4mS,4Xduy5PI,VBpqkazD' \
    --tags 'uHJ9OMMh,YdFvYZqw,PnN9MeeJ' \
    > test.out 2>&1
eval_tap $? 74 'PublicListMyStatItems' test.out

#- 75 PublicListAllMyStatItems
./ng net.accelbyte.sdk.cli.Main social publicListAllMyStatItems \
    --namespace "$AB_NAMESPACE" \
    --additionalKey 'QH0IvWnH' \
    --statCodes '1gkIqrcJ,ZDWPB2Wm,smBCQeHD' \
    --tags 'OQKkIY6y,x0qXv4Fr,8Li5p6DM' \
    > test.out 2>&1
eval_tap $? 75 'PublicListAllMyStatItems' test.out

#- 76 GetUserStatCycleItems1
./ng net.accelbyte.sdk.cli.Main social getUserStatCycleItems1 \
    --cycleId '8nBEeCkS' \
    --namespace "$AB_NAMESPACE" \
    --userId '9wJImt93' \
    --limit '10' \
    --offset '12' \
    --sortBy 'wmrYAQ7N' \
    --statCodes 'jqxg8fJz' \
    > test.out 2>&1
eval_tap $? 76 'GetUserStatCycleItems1' test.out

#- 77 PublicQueryUserStatItems1
./ng net.accelbyte.sdk.cli.Main social publicQueryUserStatItems1 \
    --namespace "$AB_NAMESPACE" \
    --userId 'bkcY4sRr' \
    --limit '58' \
    --offset '78' \
    --sortBy 'zAln2fHK' \
    --statCodes 'yqeFk6SS' \
    --tags 'mNfQEPKw' \
    > test.out 2>&1
eval_tap $? 77 'PublicQueryUserStatItems1' test.out

#- 78 PublicBulkCreateUserStatItems
./ng net.accelbyte.sdk.cli.Main social publicBulkCreateUserStatItems \
    --namespace "$AB_NAMESPACE" \
    --userId 'bOkmbwzU' \
    --body '[{"statCode": "Rp7xLXMr"}, {"statCode": "ON6sQHiy"}, {"statCode": "NRh9EioU"}]' \
    > test.out 2>&1
eval_tap $? 78 'PublicBulkCreateUserStatItems' test.out

#- 79 PublicQueryUserStatItems
./ng net.accelbyte.sdk.cli.Main social publicQueryUserStatItems \
    --namespace "$AB_NAMESPACE" \
    --userId 'y9aiqovq' \
    --additionalKey 'O5rSgeVW' \
    --statCodes 'I5QUe9BN,dXg8oqXS,XMif7WPP' \
    --tags '4GRFofi9,nFuKR65W,6JJK7QOL' \
    > test.out 2>&1
eval_tap $? 79 'PublicQueryUserStatItems' test.out

#- 80 PublicBulkIncUserStatItem1
./ng net.accelbyte.sdk.cli.Main social publicBulkIncUserStatItem1 \
    --namespace "$AB_NAMESPACE" \
    --userId '9yB8CL4t' \
    --body '[{"inc": 0.37403736554755673, "statCode": "Qqgt225Z"}, {"inc": 0.3028715820985114, "statCode": "7zzzwC7k"}, {"inc": 0.8582980998290155, "statCode": "bRjDdFSU"}]' \
    > test.out 2>&1
eval_tap $? 80 'PublicBulkIncUserStatItem1' test.out

#- 81 BulkIncUserStatItemValue2
./ng net.accelbyte.sdk.cli.Main social bulkIncUserStatItemValue2 \
    --namespace "$AB_NAMESPACE" \
    --userId 'qwmLdSeW' \
    --body '[{"inc": 0.17003051785756307, "statCode": "rJJ99urp"}, {"inc": 0.880013600042075, "statCode": "lV7DqCKv"}, {"inc": 0.1335825629736893, "statCode": "Kv5zXrpT"}]' \
    > test.out 2>&1
eval_tap $? 81 'BulkIncUserStatItemValue2' test.out

#- 82 BulkResetUserStatItem3
./ng net.accelbyte.sdk.cli.Main social bulkResetUserStatItem3 \
    --namespace "$AB_NAMESPACE" \
    --userId '3zVjZm7R' \
    --body '[{"statCode": "ULBn3iQy"}, {"statCode": "LODsZb3w"}, {"statCode": "DbV5iyQv"}]' \
    > test.out 2>&1
eval_tap $? 82 'BulkResetUserStatItem3' test.out

#- 83 PublicCreateUserStatItem
./ng net.accelbyte.sdk.cli.Main social publicCreateUserStatItem \
    --namespace "$AB_NAMESPACE" \
    --statCode 'ji2xJpRx' \
    --userId 'ecf215pR' \
    > test.out 2>&1
eval_tap $? 83 'PublicCreateUserStatItem' test.out

#- 84 DeleteUserStatItems1
./ng net.accelbyte.sdk.cli.Main social deleteUserStatItems1 \
    --namespace "$AB_NAMESPACE" \
    --statCode 'WvDupvcv' \
    --userId 'rMtJs81X' \
    > test.out 2>&1
eval_tap $? 84 'DeleteUserStatItems1' test.out

#- 85 PublicIncUserStatItem
./ng net.accelbyte.sdk.cli.Main social publicIncUserStatItem \
    --namespace "$AB_NAMESPACE" \
    --statCode 'tWgtycKO' \
    --userId 'VKEWTihg' \
    --body '{"inc": 0.06452122702773888}' \
    > test.out 2>&1
eval_tap $? 85 'PublicIncUserStatItem' test.out

#- 86 PublicIncUserStatItemValue
./ng net.accelbyte.sdk.cli.Main social publicIncUserStatItemValue \
    --namespace "$AB_NAMESPACE" \
    --statCode 'oWinquN2' \
    --userId 'Lia8fuVO' \
    --body '{"inc": 0.21936036119074565}' \
    > test.out 2>&1
eval_tap $? 86 'PublicIncUserStatItemValue' test.out

#- 87 ResetUserStatItemValue1
./ng net.accelbyte.sdk.cli.Main social resetUserStatItemValue1 \
    --namespace "$AB_NAMESPACE" \
    --statCode 'FHkNrsW3' \
    --userId 'DbUHnlgK' \
    > test.out 2>&1
eval_tap $? 87 'ResetUserStatItemValue1' test.out

#- 88 BulkUpdateUserStatItemV2
./ng net.accelbyte.sdk.cli.Main social bulkUpdateUserStatItemV2 \
    --namespace "$AB_NAMESPACE" \
    --body '[{"additionalData": {"MZzOzpuo": {}, "HgnB1vHU": {}, "vSE8tvfy": {}}, "additionalKey": "zODz77eB", "statCode": "m0zEIuHY", "updateStrategy": "MIN", "userId": "vi0bv5gQ", "value": 0.12208687276573893}, {"additionalData": {"dNvaLX9b": {}, "t2TaTl9N": {}, "Rhppjpau": {}}, "additionalKey": "K0F2lUvl", "statCode": "ccdQvKYQ", "updateStrategy": "INCREMENT", "userId": "4busJjq7", "value": 0.6651688495669471}, {"additionalData": {"jHEUP3BK": {}, "ikP3P11M": {}, "Rc4RezN1": {}}, "additionalKey": "Xj5NIGcm", "statCode": "oy397F9a", "updateStrategy": "INCREMENT", "userId": "5IzCwnt1", "value": 0.6038392760638526}]' \
    > test.out 2>&1
eval_tap $? 88 'BulkUpdateUserStatItemV2' test.out

#- 89 BulkFetchOrDefaultStatItems1
./ng net.accelbyte.sdk.cli.Main social bulkFetchOrDefaultStatItems1 \
    --namespace "$AB_NAMESPACE" \
    --additionalKey 'C4ay62CF' \
    --statCode 'f3lsAQdj' \
    --userIds 'AFDMZLRZ,IXdgnkNK,96xEX9gu' \
    > test.out 2>&1
eval_tap $? 89 'BulkFetchOrDefaultStatItems1' test.out

#- 90 AdminListUsersStatItems
./ng net.accelbyte.sdk.cli.Main social adminListUsersStatItems \
    --namespace "$AB_NAMESPACE" \
    --userId 'BgBtL8XG' \
    --additionalKey 'Jeii5mDx' \
    --statCodes 'Zf83HLVX,tARXC9Za,Rj0I1krc' \
    --tags 'apdm10cF,kuiLb5xK,ABxKFNQ4' \
    > test.out 2>&1
eval_tap $? 90 'AdminListUsersStatItems' test.out

#- 91 BulkUpdateUserStatItem
./ng net.accelbyte.sdk.cli.Main social bulkUpdateUserStatItem \
    --namespace "$AB_NAMESPACE" \
    --userId 'fOumwGfA' \
    --additionalKey 'qyA8GI4o' \
    --body '[{"additionalData": {"xrm8bAjA": {}, "CglxYYTy": {}, "s4VAgoBC": {}}, "statCode": "En1i9PfH", "updateStrategy": "MIN", "value": 0.8586573101225216}, {"additionalData": {"0veT3ytb": {}, "KIV5XoLD": {}, "fWmeNRYB": {}}, "statCode": "tXqOvslb", "updateStrategy": "MAX", "value": 0.3706035227958038}, {"additionalData": {"ppyZuylF": {}, "8dqf9AQe": {}, "7jU51HNP": {}}, "statCode": "gBWEVZrO", "updateStrategy": "MAX", "value": 0.3599421220763753}]' \
    > test.out 2>&1
eval_tap $? 91 'BulkUpdateUserStatItem' test.out

#- 92 BulkGetOrDefaultByUserId
./ng net.accelbyte.sdk.cli.Main social bulkGetOrDefaultByUserId \
    --namespace "$AB_NAMESPACE" \
    --userId 'mKUzulLh' \
    --additionalKey 'ta3LOE9V' \
    --body '{"statCodes": ["9OAprHR0", "0e8daw6H", "plK0kbzb"]}' \
    > test.out 2>&1
eval_tap $? 92 'BulkGetOrDefaultByUserId' test.out

#- 93 BulkResetUserStatItemValues
./ng net.accelbyte.sdk.cli.Main social bulkResetUserStatItemValues \
    --namespace "$AB_NAMESPACE" \
    --userId '0LCAuDbk' \
    --additionalKey '5hj7IjXy' \
    --body '[{"additionalData": {"jFhDrPvx": {}, "HGGndu6l": {}, "vt65UJKa": {}}, "statCode": "tQ61Dah6"}, {"additionalData": {"PVDGqliH": {}, "Cy0AncSO": {}, "uFZWsOOG": {}}, "statCode": "NrzlD3Et"}, {"additionalData": {"9wQ3vWX5": {}, "qzuRgDi5": {}, "2UpRDIWg": {}}, "statCode": "QzfSrLvu"}]' \
    > test.out 2>&1
eval_tap $? 93 'BulkResetUserStatItemValues' test.out

#- 94 DeleteUserStatItems2
./ng net.accelbyte.sdk.cli.Main social deleteUserStatItems2 \
    --namespace "$AB_NAMESPACE" \
    --statCode 'q7oFuUQY' \
    --userId 'UoCphMig' \
    --additionalKey 'a4GBmww3' \
    > test.out 2>&1
eval_tap $? 94 'DeleteUserStatItems2' test.out

#- 95 UpdateUserStatItemValue
./ng net.accelbyte.sdk.cli.Main social updateUserStatItemValue \
    --namespace "$AB_NAMESPACE" \
    --statCode 'JH5wxRPN' \
    --userId 'cnSHzWXF' \
    --additionalKey 'GquuhY4g' \
    --body '{"additionalData": {"cdQm8Ynh": {}, "mQAzMXFH": {}, "r7TAT5Hc": {}}, "updateStrategy": "OVERRIDE", "value": 0.6851146190183975}' \
    > test.out 2>&1
eval_tap $? 95 'UpdateUserStatItemValue' test.out

#- 96 BulkUpdateUserStatItem1
./ng net.accelbyte.sdk.cli.Main social bulkUpdateUserStatItem1 \
    --namespace "$AB_NAMESPACE" \
    --body '[{"additionalData": {"jRGUY2Yc": {}, "PTuOqntG": {}, "2FexdV2T": {}}, "additionalKey": "wAB2aKKG", "statCode": "KbcVKJoh", "updateStrategy": "MIN", "userId": "jGhCv42e", "value": 0.6735653158756608}, {"additionalData": {"Hk459RZ0": {}, "QAWjGAmy": {}, "uhhYl3mW": {}}, "additionalKey": "rWzXPPAT", "statCode": "49nlhhqS", "updateStrategy": "INCREMENT", "userId": "LuL0GnOt", "value": 0.13145286197688288}, {"additionalData": {"iuRfhgHe": {}, "ZqIGE59Q": {}, "pJTmVvGc": {}}, "additionalKey": "ERvsWHHL", "statCode": "wDftopfl", "updateStrategy": "MAX", "userId": "HlEJVf8y", "value": 0.8986781250090177}]' \
    > test.out 2>&1
eval_tap $? 96 'BulkUpdateUserStatItem1' test.out

#- 97 PublicQueryUserStatItems2
./ng net.accelbyte.sdk.cli.Main social publicQueryUserStatItems2 \
    --namespace "$AB_NAMESPACE" \
    --userId 'ekBC4Wsv' \
    --additionalKey 'ETXLWeGR' \
    --statCodes 'SEs3l026,HeTMuiDA,UQPDEusz' \
    --tags 'KMm4f2E1,0jhec9Gf,XkHhgEje' \
    > test.out 2>&1
eval_tap $? 97 'PublicQueryUserStatItems2' test.out

#- 98 BulkUpdateUserStatItem2
./ng net.accelbyte.sdk.cli.Main social bulkUpdateUserStatItem2 \
    --namespace "$AB_NAMESPACE" \
    --userId 'tQqfLmT4' \
    --additionalKey 'uw8ZBcql' \
    --body '[{"additionalData": {"FRFAmulu": {}, "u4F5sqxe": {}, "398vgVMR": {}}, "statCode": "A5gvMITt", "updateStrategy": "INCREMENT", "value": 0.41113764929880836}, {"additionalData": {"lVw6gBbM": {}, "8exvljZh": {}, "HjfGNU8s": {}}, "statCode": "Pa1lLs0s", "updateStrategy": "MIN", "value": 0.2821738991480097}, {"additionalData": {"RCZ5hbUW": {}, "R0pM2e7k": {}, "iP1rO8R7": {}}, "statCode": "NeTrOFtb", "updateStrategy": "OVERRIDE", "value": 0.9621151536907389}]' \
    > test.out 2>&1
eval_tap $? 98 'BulkUpdateUserStatItem2' test.out

#- 99 UpdateUserStatItemValue1
./ng net.accelbyte.sdk.cli.Main social updateUserStatItemValue1 \
    --namespace "$AB_NAMESPACE" \
    --statCode '3GMRgI7d' \
    --userId 'aI4TSNtD' \
    --additionalKey 'zqBqxp4i' \
    --body '{"additionalData": {"f92d4Gju": {}, "YudRdoWo": {}, "0wTCLZom": {}}, "updateStrategy": "INCREMENT", "value": 0.5455353400893613}' \
    > test.out 2>&1
eval_tap $? 99 'UpdateUserStatItemValue1' test.out


rm -f "tmp.dat"

exit $EXIT_CODE