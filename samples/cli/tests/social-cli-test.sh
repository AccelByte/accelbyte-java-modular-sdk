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
./ng net.accelbyte.sdk.cli.Main social getUserProfiles \
    --namespace "$AB_NAMESPACE" \
    --userId 'EH9x3XBF' \
    > test.out 2>&1
eval_tap $? 8 'GetUserProfiles' test.out

#- 9 GetProfile
./ng net.accelbyte.sdk.cli.Main social getProfile \
    --namespace "$AB_NAMESPACE" \
    --profileId 'wInsNlUn' \
    --userId 'AObbXGdL' \
    > test.out 2>&1
eval_tap $? 9 'GetProfile' test.out

#- 10 GetUserNamespaceSlots
eval_tap 0 10 'GetUserNamespaceSlots # SKIP deprecated' test.out

#- 11 GetSlotData
eval_tap 0 11 'GetSlotData # SKIP deprecated' test.out

#- 12 PublicGetUserGameProfiles
./ng net.accelbyte.sdk.cli.Main social publicGetUserGameProfiles \
    --namespace "$AB_NAMESPACE" \
    --userIds 'JpWZb5eu,SbWsAxox,KhDBcJ0I' \
    > test.out 2>&1
eval_tap $? 12 'PublicGetUserGameProfiles' test.out

#- 13 PublicGetUserProfiles
./ng net.accelbyte.sdk.cli.Main social publicGetUserProfiles \
    --namespace "$AB_NAMESPACE" \
    --userId 'QYLyivIz' \
    > test.out 2>&1
eval_tap $? 13 'PublicGetUserProfiles' test.out

#- 14 PublicCreateProfile
./ng net.accelbyte.sdk.cli.Main social publicCreateProfile \
    --namespace "$AB_NAMESPACE" \
    --userId '0v7sEA0N' \
    --body '{"achievements": ["MUwe02Li", "pwXCrBhS", "LlEQUVYi"], "attributes": {"t5MLC17Y": "HHAyKZNp", "kopTuuLy": "gkiB8hYK", "vek0d4ZU": "hFsJIoof"}, "avatarUrl": "tJA8YJxJ", "inventories": ["EQCIsg2R", "92F2gXnM", "FnJb7vWv"], "label": "3GZX5CjJ", "profileName": "OXF1VTYe", "statistics": ["jVz522Oc", "WZGdprIR", "eJOEsx5n"], "tags": ["ROW9mZKb", "NNkq2IKV", "WWgf7gts"]}' \
    > test.out 2>&1
eval_tap $? 14 'PublicCreateProfile' test.out

#- 15 PublicGetProfile
./ng net.accelbyte.sdk.cli.Main social publicGetProfile \
    --namespace "$AB_NAMESPACE" \
    --profileId 'hcmUUIof' \
    --userId 'kEJPshW8' \
    > test.out 2>&1
eval_tap $? 15 'PublicGetProfile' test.out

#- 16 PublicUpdateProfile
./ng net.accelbyte.sdk.cli.Main social publicUpdateProfile \
    --namespace "$AB_NAMESPACE" \
    --profileId 'DagfqNuc' \
    --userId 'jDX4WSCW' \
    --body '{"achievements": ["6n11TUqx", "W1tlqfrm", "CrNYar04"], "attributes": {"i9XF6w4h": "WTnUZcsz", "NTP9MJal": "FtUWmJmm", "snYZ8teX": "HAePAAqU"}, "avatarUrl": "xlosadpy", "inventories": ["rAktsQAJ", "9hqGwmcJ", "K5eo1ywX"], "label": "cfiywXAw", "profileName": "dNKC6Bv8", "statistics": ["CeE3W0Zr", "DYfKFM8W", "Isv84t9h"], "tags": ["kDVtul62", "6bhdxirk", "vJ5COGrj"]}' \
    > test.out 2>&1
eval_tap $? 16 'PublicUpdateProfile' test.out

#- 17 PublicDeleteProfile
./ng net.accelbyte.sdk.cli.Main social publicDeleteProfile \
    --namespace "$AB_NAMESPACE" \
    --profileId 'MT0VriOw' \
    --userId '5vvzEPS6' \
    > test.out 2>&1
eval_tap $? 17 'PublicDeleteProfile' test.out

#- 18 PublicGetProfileAttribute
./ng net.accelbyte.sdk.cli.Main social publicGetProfileAttribute \
    --attributeName 'xytNslHq' \
    --namespace "$AB_NAMESPACE" \
    --profileId 'icyctZRT' \
    --userId 'ThZ7lEmi' \
    > test.out 2>&1
eval_tap $? 18 'PublicGetProfileAttribute' test.out

#- 19 PublicUpdateAttribute
./ng net.accelbyte.sdk.cli.Main social publicUpdateAttribute \
    --attributeName 'QfP1poQV' \
    --namespace "$AB_NAMESPACE" \
    --profileId '2PY8atqP' \
    --userId 'acJlq7Vf' \
    --body '{"name": "53vavitq", "value": "84jsmrnz"}' \
    > test.out 2>&1
eval_tap $? 19 'PublicUpdateAttribute' test.out

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
    --limit '89' \
    --offset '86' \
    --statCodes 'bIhGrHro' \
    > test.out 2>&1
eval_tap $? 26 'GetGlobalStatItems' test.out

#- 27 GetGlobalStatItemByStatCode
./ng net.accelbyte.sdk.cli.Main social getGlobalStatItemByStatCode \
    --namespace "$AB_NAMESPACE" \
    --statCode 'zw5PwcuB' \
    > test.out 2>&1
eval_tap $? 27 'GetGlobalStatItemByStatCode' test.out

#- 28 GetStatCycles
./ng net.accelbyte.sdk.cli.Main social getStatCycles \
    --namespace "$AB_NAMESPACE" \
    --cycleType 'DAILY' \
    --limit '54' \
    --name 'rxHYYASJ' \
    --offset '99' \
    --sortBy '09oUh7Ma' \
    --status 'STOPPED' \
    > test.out 2>&1
eval_tap $? 28 'GetStatCycles' test.out

#- 29 CreateStatCycle
./ng net.accelbyte.sdk.cli.Main social createStatCycle \
    --namespace "$AB_NAMESPACE" \
    --body '{"cycleType": "WEEKLY", "description": "ZR7v1i2R", "end": "1982-10-12T00:00:00Z", "name": "8sHtvAK0", "resetDate": 15, "resetDay": 20, "resetMonth": 63, "resetTime": "xL3FzH7X", "seasonPeriod": 27, "start": "1972-11-05T00:00:00Z"}' \
    > test.out 2>&1
eval_tap $? 29 'CreateStatCycle' test.out

#- 30 BulkGetStatCycle
./ng net.accelbyte.sdk.cli.Main social bulkGetStatCycle \
    --namespace "$AB_NAMESPACE" \
    --body '{"cycleIds": ["AnHbUyPb", "krvjtkde", "8fJ6TXhR"]}' \
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
    --cycleId 'YwwR5WcS' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 33 'GetStatCycle' test.out

#- 34 UpdateStatCycle
./ng net.accelbyte.sdk.cli.Main social updateStatCycle \
    --cycleId 'Rv8hYnkw' \
    --namespace "$AB_NAMESPACE" \
    --body '{"cycleType": "ANNUALLY", "description": "UZT7UXr2", "end": "1997-02-19T00:00:00Z", "name": "7FKVdF1w", "resetDate": 15, "resetDay": 70, "resetMonth": 26, "resetTime": "nFcev4Ue", "seasonPeriod": 3, "start": "1992-07-30T00:00:00Z"}' \
    > test.out 2>&1
eval_tap $? 34 'UpdateStatCycle' test.out

#- 35 DeleteStatCycle
./ng net.accelbyte.sdk.cli.Main social deleteStatCycle \
    --cycleId 'Nf5xElUD' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 35 'DeleteStatCycle' test.out

#- 36 BulkAddStats
./ng net.accelbyte.sdk.cli.Main social bulkAddStats \
    --cycleId 'i8ql4AY8' \
    --namespace "$AB_NAMESPACE" \
    --body '{"statCodes": ["a0pmOyMM", "TE736TeU", "3TVZSiTa"]}' \
    > test.out 2>&1
eval_tap $? 36 'BulkAddStats' test.out

#- 37 StopStatCycle
./ng net.accelbyte.sdk.cli.Main social stopStatCycle \
    --cycleId 'NGafYI1G' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 37 'StopStatCycle' test.out

#- 38 BulkFetchStatItems
./ng net.accelbyte.sdk.cli.Main social bulkFetchStatItems \
    --namespace "$AB_NAMESPACE" \
    --statCode '7sourI4m' \
    --userIds 'FgtSJ3sW' \
    > test.out 2>&1
eval_tap $? 38 'BulkFetchStatItems' test.out

#- 39 BulkIncUserStatItem
./ng net.accelbyte.sdk.cli.Main social bulkIncUserStatItem \
    --namespace "$AB_NAMESPACE" \
    --body '[{"inc": 0.7074193215233091, "statCode": "oiaHSvrm", "userId": "PC3G3vgX"}, {"inc": 0.14503366140006768, "statCode": "gTv2G6EH", "userId": "tJPAOVi3"}, {"inc": 0.21089246669160444, "statCode": "q8wI7EWI", "userId": "gzCmXsxn"}]' \
    > test.out 2>&1
eval_tap $? 39 'BulkIncUserStatItem' test.out

#- 40 BulkIncUserStatItemValue
./ng net.accelbyte.sdk.cli.Main social bulkIncUserStatItemValue \
    --namespace "$AB_NAMESPACE" \
    --body '[{"inc": 0.18192359119290968, "statCode": "tSOHoiw1", "userId": "cYf31DU3"}, {"inc": 0.302052946931047, "statCode": "XBk3fkHe", "userId": "4HYaTOPU"}, {"inc": 0.2945109191206511, "statCode": "BJVhX8Ch", "userId": "YCHICIzQ"}]' \
    > test.out 2>&1
eval_tap $? 40 'BulkIncUserStatItemValue' test.out

#- 41 BulkFetchOrDefaultStatItems
./ng net.accelbyte.sdk.cli.Main social bulkFetchOrDefaultStatItems \
    --namespace "$AB_NAMESPACE" \
    --statCode 'bUc7uPPD' \
    --userIds 'dltflElf,1hkXMo01,HMt2QWbi' \
    > test.out 2>&1
eval_tap $? 41 'BulkFetchOrDefaultStatItems' test.out

#- 42 BulkResetUserStatItem
./ng net.accelbyte.sdk.cli.Main social bulkResetUserStatItem \
    --namespace "$AB_NAMESPACE" \
    --body '[{"statCode": "K9XG1qEK", "userId": "8zMFqr5a"}, {"statCode": "bysQOg3a", "userId": "tRmeFiOU"}, {"statCode": "tFPYl44H", "userId": "jPofX5iU"}]' \
    > test.out 2>&1
eval_tap $? 42 'BulkResetUserStatItem' test.out

#- 43 GetStats
./ng net.accelbyte.sdk.cli.Main social getStats \
    --namespace "$AB_NAMESPACE" \
    --cycleIds '2wYmkohh' \
    --isGlobal  \
    --isPublic  \
    --limit '11' \
    --offset '95' \
    > test.out 2>&1
eval_tap $? 43 'GetStats' test.out

#- 44 CreateStat
./ng net.accelbyte.sdk.cli.Main social createStat \
    --namespace "$AB_NAMESPACE" \
    --body '{"cycleIds": ["LkSiDVZU", "a6yw1Z00", "w9wQstmV"], "defaultValue": 0.4706648554136038, "description": "BnJ8oJ62", "globalAggregationMethod": "TOTAL", "ignoreAdditionalDataOnValueRejected": true, "incrementOnly": false, "isPublic": false, "maximum": 0.662829911587832, "minimum": 0.41873277905764195, "name": "IWHXwL4Q", "setAsGlobal": true, "setBy": "SERVER", "statCode": "9Dnld9hU", "tags": ["toBH4IAR", "lITzSttv", "M6T37Cyq"]}' \
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
    --limit '14' \
    --offset '71' \
    --keyword 'I4U4Hm8I' \
    > test.out 2>&1
eval_tap $? 47 'QueryStats' test.out

#- 48 GetStat
./ng net.accelbyte.sdk.cli.Main social getStat \
    --namespace "$AB_NAMESPACE" \
    --statCode '0ocBIglT' \
    > test.out 2>&1
eval_tap $? 48 'GetStat' test.out

#- 49 DeleteStat
./ng net.accelbyte.sdk.cli.Main social deleteStat \
    --namespace "$AB_NAMESPACE" \
    --statCode 'PlBqqKee' \
    > test.out 2>&1
eval_tap $? 49 'DeleteStat' test.out

#- 50 UpdateStat
./ng net.accelbyte.sdk.cli.Main social updateStat \
    --namespace "$AB_NAMESPACE" \
    --statCode 'gpoj7IZ4' \
    --body '{"cycleIds": ["B2lIhx1L", "goZJNlGq", "8wfKTnz3"], "defaultValue": 0.3644108580398019, "description": "hA5JOCe5", "globalAggregationMethod": "LAST", "ignoreAdditionalDataOnValueRejected": false, "isPublic": true, "name": "6jJciI4i", "tags": ["r9psvhNE", "hnQ5Wzot", "s8ZRNjFp"]}' \
    > test.out 2>&1
eval_tap $? 50 'UpdateStat' test.out

#- 51 GetStatItems
./ng net.accelbyte.sdk.cli.Main social getStatItems \
    --namespace "$AB_NAMESPACE" \
    --statCode 'SNfcExkN' \
    --limit '82' \
    --offset '7' \
    --sortBy 'zyGU6hd0' \
    > test.out 2>&1
eval_tap $? 51 'GetStatItems' test.out

#- 52 DeleteTiedStat
./ng net.accelbyte.sdk.cli.Main social deleteTiedStat \
    --namespace "$AB_NAMESPACE" \
    --statCode 'hU4e4VVX' \
    > test.out 2>&1
eval_tap $? 52 'DeleteTiedStat' test.out

#- 53 GetUserStatCycleItems
./ng net.accelbyte.sdk.cli.Main social getUserStatCycleItems \
    --cycleId 's8rTX4fv' \
    --namespace "$AB_NAMESPACE" \
    --userId 'szSwgoWO' \
    --isPublic  \
    --limit '90' \
    --offset '89' \
    --sortBy 'Zhx5K7ln' \
    --statCodes 'RqNrme5k' \
    > test.out 2>&1
eval_tap $? 53 'GetUserStatCycleItems' test.out

#- 54 GetUserStatItems
./ng net.accelbyte.sdk.cli.Main social getUserStatItems \
    --namespace "$AB_NAMESPACE" \
    --userId 'MNmb6mSB' \
    --isPublic  \
    --limit '56' \
    --offset '20' \
    --sortBy '0cGQYMqY' \
    --statCodes '5hWBQkOf' \
    --tags 'Vr6M4853' \
    > test.out 2>&1
eval_tap $? 54 'GetUserStatItems' test.out

#- 55 BulkCreateUserStatItems
./ng net.accelbyte.sdk.cli.Main social bulkCreateUserStatItems \
    --namespace "$AB_NAMESPACE" \
    --userId 'N1Qt0pxb' \
    --body '[{"statCode": "uN3VQa6Q"}, {"statCode": "UqY6763U"}, {"statCode": "HSA3IIOd"}]' \
    > test.out 2>&1
eval_tap $? 55 'BulkCreateUserStatItems' test.out

#- 56 BulkIncUserStatItem1
./ng net.accelbyte.sdk.cli.Main social bulkIncUserStatItem1 \
    --namespace "$AB_NAMESPACE" \
    --userId '7oWcgTc9' \
    --body '[{"inc": 0.5525858295017014, "statCode": "IUqDULBU"}, {"inc": 0.4988913558000596, "statCode": "Zz5Fh9ER"}, {"inc": 0.19280558067009157, "statCode": "ONfyNp0f"}]' \
    > test.out 2>&1
eval_tap $? 56 'BulkIncUserStatItem1' test.out

#- 57 BulkIncUserStatItemValue1
./ng net.accelbyte.sdk.cli.Main social bulkIncUserStatItemValue1 \
    --namespace "$AB_NAMESPACE" \
    --userId 'tTQd8IjN' \
    --body '[{"inc": 0.5667167336991488, "statCode": "oKO1J8Ta"}, {"inc": 0.07146076440085236, "statCode": "wLOOaSti"}, {"inc": 0.5854802664536444, "statCode": "BnC6N2gb"}]' \
    > test.out 2>&1
eval_tap $? 57 'BulkIncUserStatItemValue1' test.out

#- 58 BulkResetUserStatItem1
./ng net.accelbyte.sdk.cli.Main social bulkResetUserStatItem1 \
    --namespace "$AB_NAMESPACE" \
    --userId 'xbkb94XP' \
    --body '[{"statCode": "H0US6Z0F"}, {"statCode": "RkAxFKNc"}, {"statCode": "RpMFAoPO"}]' \
    > test.out 2>&1
eval_tap $? 58 'BulkResetUserStatItem1' test.out

#- 59 CreateUserStatItem
./ng net.accelbyte.sdk.cli.Main social createUserStatItem \
    --namespace "$AB_NAMESPACE" \
    --statCode 'gZOLrkjg' \
    --userId 'mWc0jY0r' \
    > test.out 2>&1
eval_tap $? 59 'CreateUserStatItem' test.out

#- 60 DeleteUserStatItems
./ng net.accelbyte.sdk.cli.Main social deleteUserStatItems \
    --namespace "$AB_NAMESPACE" \
    --statCode 'bMQGRVXB' \
    --userId 'Oa4uUHcE' \
    > test.out 2>&1
eval_tap $? 60 'DeleteUserStatItems' test.out

#- 61 IncUserStatItemValue
./ng net.accelbyte.sdk.cli.Main social incUserStatItemValue \
    --namespace "$AB_NAMESPACE" \
    --statCode 'gR69FpOR' \
    --userId '6vjXaxKv' \
    --body '{"inc": 0.0948070642338098}' \
    > test.out 2>&1
eval_tap $? 61 'IncUserStatItemValue' test.out

#- 62 ResetUserStatItemValue
./ng net.accelbyte.sdk.cli.Main social resetUserStatItemValue \
    --namespace "$AB_NAMESPACE" \
    --statCode 'YgfzyH8k' \
    --userId 'J4LzADIk' \
    --additionalKey 'R4XYfLLD' \
    --body '{"additionalData": {"B58p7VvN": {}, "pGjBhiiF": {}, "TfZfwrEW": {}}}' \
    > test.out 2>&1
eval_tap $? 62 'ResetUserStatItemValue' test.out

#- 63 GetGlobalStatItems1
./ng net.accelbyte.sdk.cli.Main social getGlobalStatItems1 \
    --namespace "$AB_NAMESPACE" \
    --limit '10' \
    --offset '69' \
    --statCodes '64S32iGV' \
    > test.out 2>&1
eval_tap $? 63 'GetGlobalStatItems1' test.out

#- 64 GetGlobalStatItemByStatCode1
./ng net.accelbyte.sdk.cli.Main social getGlobalStatItemByStatCode1 \
    --namespace "$AB_NAMESPACE" \
    --statCode 'kRMX0XrW' \
    > test.out 2>&1
eval_tap $? 64 'GetGlobalStatItemByStatCode1' test.out

#- 65 GetStatCycles1
./ng net.accelbyte.sdk.cli.Main social getStatCycles1 \
    --namespace "$AB_NAMESPACE" \
    --cycleType 'MONTHLY' \
    --limit '94' \
    --name 'wTzztgd7' \
    --offset '95' \
    --sortBy 'ArIX2nMs' \
    --status 'STOPPED' \
    > test.out 2>&1
eval_tap $? 65 'GetStatCycles1' test.out

#- 66 BulkGetStatCycle1
./ng net.accelbyte.sdk.cli.Main social bulkGetStatCycle1 \
    --namespace "$AB_NAMESPACE" \
    --body '{"cycleIds": ["h0Pu6Suq", "kJEEF91c", "aA9mIP3r"]}' \
    > test.out 2>&1
eval_tap $? 66 'BulkGetStatCycle1' test.out

#- 67 GetStatCycle1
./ng net.accelbyte.sdk.cli.Main social getStatCycle1 \
    --cycleId 'BR0QcKp8' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 67 'GetStatCycle1' test.out

#- 68 BulkFetchStatItems1
./ng net.accelbyte.sdk.cli.Main social bulkFetchStatItems1 \
    --namespace "$AB_NAMESPACE" \
    --statCode 'wzdl3JBx' \
    --userIds 'ua5UzrsD' \
    > test.out 2>&1
eval_tap $? 68 'BulkFetchStatItems1' test.out

#- 69 PublicBulkIncUserStatItem
./ng net.accelbyte.sdk.cli.Main social publicBulkIncUserStatItem \
    --namespace "$AB_NAMESPACE" \
    --body '[{"inc": 0.4369564866906581, "statCode": "uIvtQiBc", "userId": "xEfQDSJk"}, {"inc": 0.7452071381045144, "statCode": "3Dxue34b", "userId": "5QbIB58A"}, {"inc": 0.8545189461323877, "statCode": "FwATwEQD", "userId": "3kwJPlGu"}]' \
    > test.out 2>&1
eval_tap $? 69 'PublicBulkIncUserStatItem' test.out

#- 70 PublicBulkIncUserStatItemValue
./ng net.accelbyte.sdk.cli.Main social publicBulkIncUserStatItemValue \
    --namespace "$AB_NAMESPACE" \
    --body '[{"inc": 0.8444013519595666, "statCode": "KqFgd4dr", "userId": "c38NN5ER"}, {"inc": 0.5183640435277851, "statCode": "QrpIZSxT", "userId": "mKtUsSDT"}, {"inc": 0.04261084683987337, "statCode": "zAzZDIyQ", "userId": "KLtmj0Dr"}]' \
    > test.out 2>&1
eval_tap $? 70 'PublicBulkIncUserStatItemValue' test.out

#- 71 BulkResetUserStatItem2
./ng net.accelbyte.sdk.cli.Main social bulkResetUserStatItem2 \
    --namespace "$AB_NAMESPACE" \
    --body '[{"statCode": "W99fcn2q", "userId": "hnfgOLKJ"}, {"statCode": "JOwLzPa1", "userId": "04lYNSGl"}, {"statCode": "E4rK6BIr", "userId": "4UAZvB2y"}]' \
    > test.out 2>&1
eval_tap $? 71 'BulkResetUserStatItem2' test.out

#- 72 CreateStat1
./ng net.accelbyte.sdk.cli.Main social createStat1 \
    --namespace "$AB_NAMESPACE" \
    --body '{"cycleIds": ["QMsMzAJf", "ivtsyTgY", "sKCVX9jK"], "defaultValue": 0.09572925003591382, "description": "33UhvUVR", "globalAggregationMethod": "MAX", "ignoreAdditionalDataOnValueRejected": false, "incrementOnly": false, "isPublic": true, "maximum": 0.03001302074488199, "minimum": 0.06341673531113012, "name": "kj5TiDBw", "setAsGlobal": true, "setBy": "SERVER", "statCode": "P5k3ymD6", "tags": ["IClWrqOu", "Vn8sQCef", "ov10kqxw"]}' \
    > test.out 2>&1
eval_tap $? 72 'CreateStat1' test.out

#- 73 PublicListMyStatCycleItems
./ng net.accelbyte.sdk.cli.Main social publicListMyStatCycleItems \
    --cycleId '1uFr2ve0' \
    --namespace "$AB_NAMESPACE" \
    --limit '69' \
    --offset '59' \
    --sortBy 'hiU8a6TZ' \
    --statCodes 'gaFKwMQ3,7wxP4POo,boYumXt0' \
    > test.out 2>&1
eval_tap $? 73 'PublicListMyStatCycleItems' test.out

#- 74 PublicListMyStatItems
./ng net.accelbyte.sdk.cli.Main social publicListMyStatItems \
    --namespace "$AB_NAMESPACE" \
    --limit '57' \
    --offset '51' \
    --sortBy 'qe9tGqLT' \
    --statCodes 'XxS62QLQ,bSCNT9lf,b2mTORUZ' \
    --tags 'gYpB9dF4,9iCHQ1bo,qE6vtHI4' \
    > test.out 2>&1
eval_tap $? 74 'PublicListMyStatItems' test.out

#- 75 PublicListAllMyStatItems
./ng net.accelbyte.sdk.cli.Main social publicListAllMyStatItems \
    --namespace "$AB_NAMESPACE" \
    --additionalKey 'O82rnXMq' \
    --statCodes '97klntAy,FRRREBnq,RyeuAcEW' \
    --tags 'aBMTkw0N,zeH1UsWt,7tLPbp7g' \
    > test.out 2>&1
eval_tap $? 75 'PublicListAllMyStatItems' test.out

#- 76 GetUserStatCycleItems1
./ng net.accelbyte.sdk.cli.Main social getUserStatCycleItems1 \
    --cycleId 'xgqc5nY4' \
    --namespace "$AB_NAMESPACE" \
    --userId 'ILW55QxK' \
    --limit '69' \
    --offset '1' \
    --sortBy 'eI5fivxo' \
    --statCodes 'VHErmKg4' \
    > test.out 2>&1
eval_tap $? 76 'GetUserStatCycleItems1' test.out

#- 77 PublicQueryUserStatItems
./ng net.accelbyte.sdk.cli.Main social publicQueryUserStatItems \
    --namespace "$AB_NAMESPACE" \
    --userId 'kMviwTh6' \
    --limit '48' \
    --offset '9' \
    --sortBy 'hZatxOVm' \
    --statCodes '9WGNlXsN' \
    --tags 'Yn7WmNDZ' \
    > test.out 2>&1
eval_tap $? 77 'PublicQueryUserStatItems' test.out

#- 78 PublicBulkCreateUserStatItems
./ng net.accelbyte.sdk.cli.Main social publicBulkCreateUserStatItems \
    --namespace "$AB_NAMESPACE" \
    --userId 'iDmNOmnt' \
    --body '[{"statCode": "2VSRthWC"}, {"statCode": "Oe4D9mCq"}, {"statCode": "J1scnI19"}]' \
    > test.out 2>&1
eval_tap $? 78 'PublicBulkCreateUserStatItems' test.out

#- 79 PublicQueryUserStatItems1
./ng net.accelbyte.sdk.cli.Main social publicQueryUserStatItems1 \
    --namespace "$AB_NAMESPACE" \
    --userId 'jT3e4BG4' \
    --additionalKey 'U37MWc4f' \
    --statCodes 'mek5l8bW,cI2CV5Xg,hzL83omb' \
    --tags 'zdXECaeB,eIluwPgZ,Nk85aBpT' \
    > test.out 2>&1
eval_tap $? 79 'PublicQueryUserStatItems1' test.out

#- 80 PublicBulkIncUserStatItem1
./ng net.accelbyte.sdk.cli.Main social publicBulkIncUserStatItem1 \
    --namespace "$AB_NAMESPACE" \
    --userId 'RPLvKwbp' \
    --body '[{"inc": 0.238470522515548, "statCode": "mbvJSA6X"}, {"inc": 0.06955516550448215, "statCode": "9Uu00S7i"}, {"inc": 0.8303176302913551, "statCode": "13nL2N83"}]' \
    > test.out 2>&1
eval_tap $? 80 'PublicBulkIncUserStatItem1' test.out

#- 81 BulkIncUserStatItemValue2
./ng net.accelbyte.sdk.cli.Main social bulkIncUserStatItemValue2 \
    --namespace "$AB_NAMESPACE" \
    --userId 'wkdl8S2y' \
    --body '[{"inc": 0.41155345872341786, "statCode": "icLB5epe"}, {"inc": 0.1819360558861013, "statCode": "eIQ9X12I"}, {"inc": 0.352090106605658, "statCode": "DAcCRVnB"}]' \
    > test.out 2>&1
eval_tap $? 81 'BulkIncUserStatItemValue2' test.out

#- 82 BulkResetUserStatItem3
./ng net.accelbyte.sdk.cli.Main social bulkResetUserStatItem3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'UiCO1bLb' \
    --body '[{"statCode": "Y5NaVTGp"}, {"statCode": "GdC6kqN9"}, {"statCode": "OTwGu82O"}]' \
    > test.out 2>&1
eval_tap $? 82 'BulkResetUserStatItem3' test.out

#- 83 PublicCreateUserStatItem
./ng net.accelbyte.sdk.cli.Main social publicCreateUserStatItem \
    --namespace "$AB_NAMESPACE" \
    --statCode 'hZjBJEJt' \
    --userId 'CMMKqjDN' \
    > test.out 2>&1
eval_tap $? 83 'PublicCreateUserStatItem' test.out

#- 84 DeleteUserStatItems1
./ng net.accelbyte.sdk.cli.Main social deleteUserStatItems1 \
    --namespace "$AB_NAMESPACE" \
    --statCode 'PuUPQxbT' \
    --userId 'Jp0zEU5l' \
    > test.out 2>&1
eval_tap $? 84 'DeleteUserStatItems1' test.out

#- 85 PublicIncUserStatItem
./ng net.accelbyte.sdk.cli.Main social publicIncUserStatItem \
    --namespace "$AB_NAMESPACE" \
    --statCode 'JCX4HkjL' \
    --userId 'Mc3OvHVw' \
    --body '{"inc": 0.6962288138417855}' \
    > test.out 2>&1
eval_tap $? 85 'PublicIncUserStatItem' test.out

#- 86 PublicIncUserStatItemValue
./ng net.accelbyte.sdk.cli.Main social publicIncUserStatItemValue \
    --namespace "$AB_NAMESPACE" \
    --statCode 'RyN2cNlh' \
    --userId 'vwDG969b' \
    --body '{"inc": 0.3766858902024328}' \
    > test.out 2>&1
eval_tap $? 86 'PublicIncUserStatItemValue' test.out

#- 87 ResetUserStatItemValue1
./ng net.accelbyte.sdk.cli.Main social resetUserStatItemValue1 \
    --namespace "$AB_NAMESPACE" \
    --statCode 'Sfmn70Yq' \
    --userId 'G5PQopJS' \
    > test.out 2>&1
eval_tap $? 87 'ResetUserStatItemValue1' test.out

#- 88 BulkUpdateUserStatItemV2
./ng net.accelbyte.sdk.cli.Main social bulkUpdateUserStatItemV2 \
    --namespace "$AB_NAMESPACE" \
    --body '[{"additionalData": {"9XZqhmtY": {}, "1qbaVgo0": {}, "1okgQcFx": {}}, "additionalKey": "CXiSmld7", "statCode": "8i9yYVCK", "updateStrategy": "OVERRIDE", "userId": "n92ignwV", "value": 0.5753802831184339}, {"additionalData": {"jHbehGaO": {}, "m3pYBUbc": {}, "7kQBC9wQ": {}}, "additionalKey": "2J3Kc96b", "statCode": "sJTyQlwl", "updateStrategy": "OVERRIDE", "userId": "YN8kVxSa", "value": 0.09294760105229538}, {"additionalData": {"DFFf3XaN": {}, "bhwPnGMT": {}, "doI4mnvs": {}}, "additionalKey": "l3c9ByOm", "statCode": "oKer4oy5", "updateStrategy": "INCREMENT", "userId": "yKJW2BWN", "value": 0.733154884203095}]' \
    > test.out 2>&1
eval_tap $? 88 'BulkUpdateUserStatItemV2' test.out

#- 89 BulkFetchOrDefaultStatItems1
./ng net.accelbyte.sdk.cli.Main social bulkFetchOrDefaultStatItems1 \
    --namespace "$AB_NAMESPACE" \
    --additionalKey 'yT4FsHjA' \
    --statCode 'xZ051z1P' \
    --userIds 'UJqAyOJU,srvzDczL,NSOgLuQp' \
    > test.out 2>&1
eval_tap $? 89 'BulkFetchOrDefaultStatItems1' test.out

#- 90 AdminListUsersStatItems
./ng net.accelbyte.sdk.cli.Main social adminListUsersStatItems \
    --namespace "$AB_NAMESPACE" \
    --userId 'U0aTUcXg' \
    --additionalKey 'TbPxqu2N' \
    --statCodes 'sFy3CQ9O,06ytjgmD,HTZcBAES' \
    --tags 'CiwoLl8S,yBlOEhq0,RnrMJs73' \
    > test.out 2>&1
eval_tap $? 90 'AdminListUsersStatItems' test.out

#- 91 BulkUpdateUserStatItem
./ng net.accelbyte.sdk.cli.Main social bulkUpdateUserStatItem \
    --namespace "$AB_NAMESPACE" \
    --userId '7vNv9nsG' \
    --additionalKey 'K7rF9bwP' \
    --body '[{"additionalData": {"6l4E2ofz": {}, "nkk6qQb7": {}, "4abtyfv4": {}}, "statCode": "dgMWCEyh", "updateStrategy": "MAX", "value": 0.44769033552257176}, {"additionalData": {"19CCHTsu": {}, "Qi18Sou3": {}, "7d7XdSTn": {}}, "statCode": "cOBgfESA", "updateStrategy": "MAX", "value": 0.25489023426762536}, {"additionalData": {"38PGbyIa": {}, "fXEwr5uB": {}, "LzQS5kuT": {}}, "statCode": "JfUidAUI", "updateStrategy": "MAX", "value": 0.5065332220334561}]' \
    > test.out 2>&1
eval_tap $? 91 'BulkUpdateUserStatItem' test.out

#- 92 BulkGetOrDefaultByUserId
./ng net.accelbyte.sdk.cli.Main social bulkGetOrDefaultByUserId \
    --namespace "$AB_NAMESPACE" \
    --userId 'EwREegM9' \
    --additionalKey '3e47bE2d' \
    --body '{"statCodes": ["s4mtkJ1k", "5HAUut0f", "gHn71clb"]}' \
    > test.out 2>&1
eval_tap $? 92 'BulkGetOrDefaultByUserId' test.out

#- 93 BulkResetUserStatItemValues
./ng net.accelbyte.sdk.cli.Main social bulkResetUserStatItemValues \
    --namespace "$AB_NAMESPACE" \
    --userId 'e2xV6gW7' \
    --additionalKey 'Q5IvnlgD' \
    --body '[{"additionalData": {"KUL94odr": {}, "PEbfqhzw": {}, "HfZojm7h": {}}, "statCode": "FRfAO4Q1"}, {"additionalData": {"kODbdbde": {}, "2VQCvprX": {}, "7qezS8hA": {}}, "statCode": "UMLm7OJB"}, {"additionalData": {"GgUob2yX": {}, "AJDc6u00": {}, "YI9fBGPX": {}}, "statCode": "bOTCETyJ"}]' \
    > test.out 2>&1
eval_tap $? 93 'BulkResetUserStatItemValues' test.out

#- 94 DeleteUserStatItems2
./ng net.accelbyte.sdk.cli.Main social deleteUserStatItems2 \
    --namespace "$AB_NAMESPACE" \
    --statCode 'pRgCwXPE' \
    --userId 'AaxzJTvZ' \
    --additionalKey 'NCK3dMj1' \
    > test.out 2>&1
eval_tap $? 94 'DeleteUserStatItems2' test.out

#- 95 UpdateUserStatItemValue
./ng net.accelbyte.sdk.cli.Main social updateUserStatItemValue \
    --namespace "$AB_NAMESPACE" \
    --statCode 'x824nGJs' \
    --userId '0y4PcS65' \
    --additionalKey 'PsoMN5ui' \
    --body '{"additionalData": {"N3KZQJfk": {}, "ZjoLh8X6": {}, "Gp45UFjG": {}}, "updateStrategy": "OVERRIDE", "value": 0.6036329484298579}' \
    > test.out 2>&1
eval_tap $? 95 'UpdateUserStatItemValue' test.out

#- 96 BulkUpdateUserStatItem1
./ng net.accelbyte.sdk.cli.Main social bulkUpdateUserStatItem1 \
    --namespace "$AB_NAMESPACE" \
    --body '[{"additionalData": {"EAtjLeyf": {}, "Gnq1B1x4": {}, "VG8hOpVZ": {}}, "additionalKey": "9SKjiuut", "statCode": "53lwLlD1", "updateStrategy": "MAX", "userId": "3qDlOpPk", "value": 0.00387651425185076}, {"additionalData": {"OqiXdIz7": {}, "GIVz510H": {}, "f5vh5d5b": {}}, "additionalKey": "shdJyAWo", "statCode": "sSI6K9rR", "updateStrategy": "OVERRIDE", "userId": "7Wpiq1pC", "value": 0.6075734473871506}, {"additionalData": {"qYgrbitr": {}, "KPuW8fm2": {}, "Lnpim9a4": {}}, "additionalKey": "u9TbHZ8l", "statCode": "hEFeqz50", "updateStrategy": "MAX", "userId": "HR2UjUR8", "value": 0.4360014384154953}]' \
    > test.out 2>&1
eval_tap $? 96 'BulkUpdateUserStatItem1' test.out

#- 97 PublicQueryUserStatItems2
./ng net.accelbyte.sdk.cli.Main social publicQueryUserStatItems2 \
    --namespace "$AB_NAMESPACE" \
    --userId 'WHPLcAk1' \
    --additionalKey 'oowazlKx' \
    --statCodes '3CPkhzpf,1ZPTHNqO,gLORsujj' \
    --tags 'qllEnLoc,NItrrRvx,5QvyxJbw' \
    > test.out 2>&1
eval_tap $? 97 'PublicQueryUserStatItems2' test.out

#- 98 BulkUpdateUserStatItem2
./ng net.accelbyte.sdk.cli.Main social bulkUpdateUserStatItem2 \
    --namespace "$AB_NAMESPACE" \
    --userId 'HcCV7JCx' \
    --additionalKey 'rqXGXIIM' \
    --body '[{"additionalData": {"2eJJpG1d": {}, "0sBW0wNA": {}, "PmSh6SqU": {}}, "statCode": "o5ry9Nr5", "updateStrategy": "OVERRIDE", "value": 0.1269147721949937}, {"additionalData": {"bJ1P0krZ": {}, "qYmQuOFT": {}, "upgNnAbH": {}}, "statCode": "MddqalZJ", "updateStrategy": "MAX", "value": 0.720513815212249}, {"additionalData": {"EO4Fc7qZ": {}, "aK5oJVU0": {}, "ro6dn56P": {}}, "statCode": "yplwSyu1", "updateStrategy": "MAX", "value": 0.9636093641862159}]' \
    > test.out 2>&1
eval_tap $? 98 'BulkUpdateUserStatItem2' test.out

#- 99 UpdateUserStatItemValue1
./ng net.accelbyte.sdk.cli.Main social updateUserStatItemValue1 \
    --namespace "$AB_NAMESPACE" \
    --statCode 'v1MDFYHN' \
    --userId 'midDWdHC' \
    --additionalKey 'Fn5ANSFH' \
    --body '{"additionalData": {"2OJA2nX3": {}, "rvWRgUWF": {}, "p55W7Dwq": {}}, "updateStrategy": "MAX", "value": 0.593948039306725}' \
    > test.out 2>&1
eval_tap $? 99 'UpdateUserStatItemValue1' test.out


rm -f "tmp.dat"

exit $EXIT_CODE