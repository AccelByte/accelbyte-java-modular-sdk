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
echo "1..98"

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
    --userId 'T75IdHpC' \
    > test.out 2>&1
eval_tap $? 8 'GetUserProfiles' test.out

#- 9 GetProfile
./ng net.accelbyte.sdk.cli.Main social getProfile \
    --namespace "$AB_NAMESPACE" \
    --profileId 'mc1Nur1y' \
    --userId 'stDcss1r' \
    > test.out 2>&1
eval_tap $? 9 'GetProfile' test.out

#- 10 GetUserNamespaceSlots
eval_tap 0 10 'GetUserNamespaceSlots # SKIP deprecated' test.out

#- 11 GetSlotData
eval_tap 0 11 'GetSlotData # SKIP deprecated' test.out

#- 12 PublicGetUserGameProfiles
./ng net.accelbyte.sdk.cli.Main social publicGetUserGameProfiles \
    --namespace "$AB_NAMESPACE" \
    --userIds 'MpKp8WjJ,lbiBlYdz,nhZPLCQp' \
    > test.out 2>&1
eval_tap $? 12 'PublicGetUserGameProfiles' test.out

#- 13 PublicGetUserProfiles
./ng net.accelbyte.sdk.cli.Main social publicGetUserProfiles \
    --namespace "$AB_NAMESPACE" \
    --userId 'Rs7uHYWi' \
    > test.out 2>&1
eval_tap $? 13 'PublicGetUserProfiles' test.out

#- 14 PublicCreateProfile
./ng net.accelbyte.sdk.cli.Main social publicCreateProfile \
    --namespace "$AB_NAMESPACE" \
    --userId 'oVW71j7q' \
    --body '{"achievements": ["Ca0fJqV5", "sXhrMAL2", "VEoUYaYP"], "attributes": {"IwIO6NSM": "4cvYYf4V", "aBDol5mi": "H4UuSeK0", "hXEySiSR": "1FnONQD3"}, "avatarUrl": "g53BobAM", "inventories": ["d432EGEU", "9VJNM3pK", "zaIOHpsJ"], "label": "o1GwcrOB", "profileName": "Ehsv1Cpt", "statistics": ["rHFlU4xA", "hcIWkYHI", "TcuFC6XI"], "tags": ["iF0KvJOj", "s9yF15Q4", "Rv3q3gX3"]}' \
    > test.out 2>&1
eval_tap $? 14 'PublicCreateProfile' test.out

#- 15 PublicGetProfile
./ng net.accelbyte.sdk.cli.Main social publicGetProfile \
    --namespace "$AB_NAMESPACE" \
    --profileId 'XEjG6PQd' \
    --userId 'hc4uvgMm' \
    > test.out 2>&1
eval_tap $? 15 'PublicGetProfile' test.out

#- 16 PublicUpdateProfile
./ng net.accelbyte.sdk.cli.Main social publicUpdateProfile \
    --namespace "$AB_NAMESPACE" \
    --profileId 'jH0vTpIw' \
    --userId 'sORoVlNO' \
    --body '{"achievements": ["3uM62afA", "Wtbl5d70", "UNJyFTmU"], "attributes": {"gVuaXnEU": "mHI0ftaQ", "UoBZXcw6": "8wNLFFFU", "BlSICU3J": "4iv0gsJS"}, "avatarUrl": "829VyjSa", "inventories": ["NdwHwXU8", "PavLOyS5", "2OJCJq45"], "label": "GbH6Nzra", "profileName": "ldDtEf9M", "statistics": ["L2okGIgs", "0lyTPK1J", "4ZV2B7tA"], "tags": ["HhsdzuL0", "Gwt8keW9", "d2jjQ3jU"]}' \
    > test.out 2>&1
eval_tap $? 16 'PublicUpdateProfile' test.out

#- 17 PublicDeleteProfile
./ng net.accelbyte.sdk.cli.Main social publicDeleteProfile \
    --namespace "$AB_NAMESPACE" \
    --profileId 'Z2sIt51K' \
    --userId 'TKF9p3Rc' \
    > test.out 2>&1
eval_tap $? 17 'PublicDeleteProfile' test.out

#- 18 PublicGetProfileAttribute
./ng net.accelbyte.sdk.cli.Main social publicGetProfileAttribute \
    --attributeName 'XWSkRBr9' \
    --namespace "$AB_NAMESPACE" \
    --profileId 'WzlNQ9aG' \
    --userId 'CgQWDpsr' \
    > test.out 2>&1
eval_tap $? 18 'PublicGetProfileAttribute' test.out

#- 19 PublicUpdateAttribute
./ng net.accelbyte.sdk.cli.Main social publicUpdateAttribute \
    --attributeName 'ZaOn9X1K' \
    --namespace "$AB_NAMESPACE" \
    --profileId 'w53hW8eS' \
    --userId 'GGEc7WgB' \
    --body '{"name": "0x62A7Io", "value": "ROvXqfZy"}' \
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
    --limit '11' \
    --offset '58' \
    --statCodes 'kMnalAGR' \
    > test.out 2>&1
eval_tap $? 26 'GetGlobalStatItems' test.out

#- 27 GetGlobalStatItemByStatCode
./ng net.accelbyte.sdk.cli.Main social getGlobalStatItemByStatCode \
    --namespace "$AB_NAMESPACE" \
    --statCode '81urSp0h' \
    > test.out 2>&1
eval_tap $? 27 'GetGlobalStatItemByStatCode' test.out

#- 28 GetStatCycles
./ng net.accelbyte.sdk.cli.Main social getStatCycles \
    --namespace "$AB_NAMESPACE" \
    --cycleType 'SEASONAL' \
    --limit '14' \
    --name '8G7HMGFw' \
    --offset '44' \
    --sortBy 'Hm6n1uwI' \
    --status 'ACTIVE' \
    > test.out 2>&1
eval_tap $? 28 'GetStatCycles' test.out

#- 29 CreateStatCycle
./ng net.accelbyte.sdk.cli.Main social createStatCycle \
    --namespace "$AB_NAMESPACE" \
    --body '{"cycleType": "SEASONAL", "description": "iaaPjR8n", "end": "1990-07-31T00:00:00Z", "name": "eJPjtvi6", "resetDate": 54, "resetDay": 46, "resetMonth": 92, "resetTime": "LcHvAuH9", "seasonPeriod": 90, "start": "1972-10-24T00:00:00Z"}' \
    > test.out 2>&1
eval_tap $? 29 'CreateStatCycle' test.out

#- 30 BulkGetStatCycle
./ng net.accelbyte.sdk.cli.Main social bulkGetStatCycle \
    --namespace "$AB_NAMESPACE" \
    --body '{"cycleIds": ["4b0rW6QW", "xunBaTgS", "7qc5FDs0"]}' \
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
    --cycleId 'AvZ1GCdv' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 33 'GetStatCycle' test.out

#- 34 UpdateStatCycle
./ng net.accelbyte.sdk.cli.Main social updateStatCycle \
    --cycleId 'BCL9jViR' \
    --namespace "$AB_NAMESPACE" \
    --body '{"cycleType": "DAILY", "description": "ZOmMiZ5O", "end": "1997-02-03T00:00:00Z", "name": "pl66QOS7", "resetDate": 12, "resetDay": 98, "resetMonth": 22, "resetTime": "qTrhnVuv", "seasonPeriod": 36, "start": "1989-10-16T00:00:00Z"}' \
    > test.out 2>&1
eval_tap $? 34 'UpdateStatCycle' test.out

#- 35 DeleteStatCycle
./ng net.accelbyte.sdk.cli.Main social deleteStatCycle \
    --cycleId 'ddgjGeS0' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 35 'DeleteStatCycle' test.out

#- 36 BulkAddStats
./ng net.accelbyte.sdk.cli.Main social bulkAddStats \
    --cycleId 'PqheLiba' \
    --namespace "$AB_NAMESPACE" \
    --body '{"statCodes": ["vbKijf8x", "Rr2Twole", "b3qzkIo0"]}' \
    > test.out 2>&1
eval_tap $? 36 'BulkAddStats' test.out

#- 37 StopStatCycle
./ng net.accelbyte.sdk.cli.Main social stopStatCycle \
    --cycleId 'ZAWTDCFc' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 37 'StopStatCycle' test.out

#- 38 BulkFetchStatItems
./ng net.accelbyte.sdk.cli.Main social bulkFetchStatItems \
    --namespace "$AB_NAMESPACE" \
    --statCode 'LDnDx5Qh' \
    --userIds 'KZWWXu6S' \
    > test.out 2>&1
eval_tap $? 38 'BulkFetchStatItems' test.out

#- 39 BulkIncUserStatItem
./ng net.accelbyte.sdk.cli.Main social bulkIncUserStatItem \
    --namespace "$AB_NAMESPACE" \
    --body '[{"inc": 0.6478434034326237, "statCode": "D5zXbVVZ", "userId": "a3D6fTtf"}, {"inc": 0.22839518325514063, "statCode": "ysXGI85B", "userId": "SvSGx4BI"}, {"inc": 0.8061044842182342, "statCode": "Q4miEgHN", "userId": "JesnMeKe"}]' \
    > test.out 2>&1
eval_tap $? 39 'BulkIncUserStatItem' test.out

#- 40 BulkIncUserStatItemValue
./ng net.accelbyte.sdk.cli.Main social bulkIncUserStatItemValue \
    --namespace "$AB_NAMESPACE" \
    --body '[{"inc": 0.46282569596982026, "statCode": "gX29SOKA", "userId": "jGEbevTC"}, {"inc": 0.2956018979114786, "statCode": "mxeaczeL", "userId": "nv5vWLrs"}, {"inc": 0.5582488018246907, "statCode": "vsYjNbJQ", "userId": "Hva97beb"}]' \
    > test.out 2>&1
eval_tap $? 40 'BulkIncUserStatItemValue' test.out

#- 41 BulkFetchOrDefaultStatItems
./ng net.accelbyte.sdk.cli.Main social bulkFetchOrDefaultStatItems \
    --namespace "$AB_NAMESPACE" \
    --statCode 'rErv6u9H' \
    --userIds '69CzJGPU,YMg6rowY,20W30PSx' \
    > test.out 2>&1
eval_tap $? 41 'BulkFetchOrDefaultStatItems' test.out

#- 42 BulkResetUserStatItem
./ng net.accelbyte.sdk.cli.Main social bulkResetUserStatItem \
    --namespace "$AB_NAMESPACE" \
    --body '[{"statCode": "xB4AJsiA", "userId": "1wQ3oQDY"}, {"statCode": "k0FnZ3T8", "userId": "vT1J7rVY"}, {"statCode": "Td6MleWi", "userId": "p60nc5Ne"}]' \
    > test.out 2>&1
eval_tap $? 42 'BulkResetUserStatItem' test.out

#- 43 GetStats
./ng net.accelbyte.sdk.cli.Main social getStats \
    --namespace "$AB_NAMESPACE" \
    --cycleIds '8eUDYYRk' \
    --isGlobal  \
    --isPublic  \
    --limit '64' \
    --offset '36' \
    > test.out 2>&1
eval_tap $? 43 'GetStats' test.out

#- 44 CreateStat
./ng net.accelbyte.sdk.cli.Main social createStat \
    --namespace "$AB_NAMESPACE" \
    --body '{"cycleIds": ["4GnS2v2q", "FYV5Ih4R", "FbFyaPED"], "defaultValue": 0.6107955822228235, "description": "tzZZnMn7", "globalAggregationMethod": "MIN", "ignoreAdditionalDataOnValueRejected": true, "incrementOnly": false, "isPublic": true, "maximum": 0.12425882570528934, "minimum": 0.52405246404257, "name": "24jrrYt3", "setAsGlobal": true, "setBy": "CLIENT", "statCode": "DKuBA59e", "tags": ["lMSXzmFx", "uF66SUrq", "O9EHDgiu"]}' \
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
    --limit '92' \
    --offset '19' \
    --keyword 'ab7MSMBj' \
    > test.out 2>&1
eval_tap $? 47 'QueryStats' test.out

#- 48 GetStat
./ng net.accelbyte.sdk.cli.Main social getStat \
    --namespace "$AB_NAMESPACE" \
    --statCode '6XxLCOIV' \
    > test.out 2>&1
eval_tap $? 48 'GetStat' test.out

#- 49 DeleteStat
./ng net.accelbyte.sdk.cli.Main social deleteStat \
    --namespace "$AB_NAMESPACE" \
    --statCode 'W3GjkzqO' \
    > test.out 2>&1
eval_tap $? 49 'DeleteStat' test.out

#- 50 UpdateStat
./ng net.accelbyte.sdk.cli.Main social updateStat \
    --namespace "$AB_NAMESPACE" \
    --statCode 'TRlPJ472' \
    --body '{"cycleIds": ["xnwjNM74", "mAv7qVRT", "j2euermd"], "defaultValue": 0.6278921111028886, "description": "yP8Pe8H7", "globalAggregationMethod": "LAST", "ignoreAdditionalDataOnValueRejected": true, "isPublic": false, "name": "UxnjdAoR", "tags": ["SMLZxmvT", "qC2DMEBO", "sQNdxWGE"]}' \
    > test.out 2>&1
eval_tap $? 50 'UpdateStat' test.out

#- 51 GetStatItems
./ng net.accelbyte.sdk.cli.Main social getStatItems \
    --namespace "$AB_NAMESPACE" \
    --statCode 'EXXxpGQI' \
    --limit '72' \
    --offset '23' \
    --sortBy '6s6Y5eZO' \
    > test.out 2>&1
eval_tap $? 51 'GetStatItems' test.out

#- 52 DeleteTiedStat
./ng net.accelbyte.sdk.cli.Main social deleteTiedStat \
    --namespace "$AB_NAMESPACE" \
    --statCode 'Hp8lzNJG' \
    > test.out 2>&1
eval_tap $? 52 'DeleteTiedStat' test.out

#- 53 GetUserStatCycleItems
./ng net.accelbyte.sdk.cli.Main social getUserStatCycleItems \
    --cycleId 'lW4hHDuB' \
    --namespace "$AB_NAMESPACE" \
    --userId 'nmmf7rjd' \
    --isPublic  \
    --limit '44' \
    --offset '2' \
    --sortBy '8jcO19IP' \
    --statCodes 'OaDpm5Sc' \
    > test.out 2>&1
eval_tap $? 53 'GetUserStatCycleItems' test.out

#- 54 GetUserStatItems
./ng net.accelbyte.sdk.cli.Main social getUserStatItems \
    --namespace "$AB_NAMESPACE" \
    --userId '4Arhy75E' \
    --isPublic  \
    --limit '66' \
    --offset '47' \
    --sortBy 'f1pxCOvr' \
    --statCodes 'qLjGxPwb' \
    --tags 'B6Ju2IGL' \
    > test.out 2>&1
eval_tap $? 54 'GetUserStatItems' test.out

#- 55 BulkCreateUserStatItems
./ng net.accelbyte.sdk.cli.Main social bulkCreateUserStatItems \
    --namespace "$AB_NAMESPACE" \
    --userId 'LMoW55qi' \
    --body '[{"statCode": "6JmfjDXu"}, {"statCode": "6H31m217"}, {"statCode": "MKrMWnRy"}]' \
    > test.out 2>&1
eval_tap $? 55 'BulkCreateUserStatItems' test.out

#- 56 BulkIncUserStatItem1
./ng net.accelbyte.sdk.cli.Main social bulkIncUserStatItem1 \
    --namespace "$AB_NAMESPACE" \
    --userId '46LEGlQ2' \
    --body '[{"inc": 0.9427529880829324, "statCode": "98b8AYXn"}, {"inc": 0.9515449593579832, "statCode": "Sx2mBxUP"}, {"inc": 0.8814106713985118, "statCode": "I4TfVeU1"}]' \
    > test.out 2>&1
eval_tap $? 56 'BulkIncUserStatItem1' test.out

#- 57 BulkIncUserStatItemValue1
./ng net.accelbyte.sdk.cli.Main social bulkIncUserStatItemValue1 \
    --namespace "$AB_NAMESPACE" \
    --userId 'OgzNu8zO' \
    --body '[{"inc": 0.4209932025230336, "statCode": "Rs2hxVAZ"}, {"inc": 0.7196818244707327, "statCode": "elnrY48N"}, {"inc": 0.2866088148510696, "statCode": "V0e17wb6"}]' \
    > test.out 2>&1
eval_tap $? 57 'BulkIncUserStatItemValue1' test.out

#- 58 BulkResetUserStatItem1
./ng net.accelbyte.sdk.cli.Main social bulkResetUserStatItem1 \
    --namespace "$AB_NAMESPACE" \
    --userId 'TvZoW0QP' \
    --body '[{"statCode": "N1M9w49R"}, {"statCode": "rNzuE9Zd"}, {"statCode": "if6ARF7p"}]' \
    > test.out 2>&1
eval_tap $? 58 'BulkResetUserStatItem1' test.out

#- 59 CreateUserStatItem
./ng net.accelbyte.sdk.cli.Main social createUserStatItem \
    --namespace "$AB_NAMESPACE" \
    --statCode 'SdlYK4MX' \
    --userId '7nOWX8JD' \
    > test.out 2>&1
eval_tap $? 59 'CreateUserStatItem' test.out

#- 60 DeleteUserStatItems
./ng net.accelbyte.sdk.cli.Main social deleteUserStatItems \
    --namespace "$AB_NAMESPACE" \
    --statCode 'Aft6aV84' \
    --userId '8xaMn0N6' \
    > test.out 2>&1
eval_tap $? 60 'DeleteUserStatItems' test.out

#- 61 IncUserStatItemValue
./ng net.accelbyte.sdk.cli.Main social incUserStatItemValue \
    --namespace "$AB_NAMESPACE" \
    --statCode 'JAc3CJsm' \
    --userId 'Qn6V6dbj' \
    --body '{"inc": 0.8232794806393225}' \
    > test.out 2>&1
eval_tap $? 61 'IncUserStatItemValue' test.out

#- 62 ResetUserStatItemValue
./ng net.accelbyte.sdk.cli.Main social resetUserStatItemValue \
    --namespace "$AB_NAMESPACE" \
    --statCode '19Irz5YF' \
    --userId 'vcB0YaE9' \
    --additionalKey 'o3b0gRGv' \
    --body '{"additionalData": {"vM3MxH33": {}, "J4ZelNA1": {}, "g7xsYGwU": {}}}' \
    > test.out 2>&1
eval_tap $? 62 'ResetUserStatItemValue' test.out

#- 63 GetGlobalStatItems1
./ng net.accelbyte.sdk.cli.Main social getGlobalStatItems1 \
    --namespace "$AB_NAMESPACE" \
    --limit '14' \
    --offset '68' \
    --statCodes '3zcyWjzR' \
    > test.out 2>&1
eval_tap $? 63 'GetGlobalStatItems1' test.out

#- 64 GetGlobalStatItemByStatCode1
./ng net.accelbyte.sdk.cli.Main social getGlobalStatItemByStatCode1 \
    --namespace "$AB_NAMESPACE" \
    --statCode 'DnOxu5Q2' \
    > test.out 2>&1
eval_tap $? 64 'GetGlobalStatItemByStatCode1' test.out

#- 65 GetStatCycles1
./ng net.accelbyte.sdk.cli.Main social getStatCycles1 \
    --namespace "$AB_NAMESPACE" \
    --cycleType 'SEASONAL' \
    --limit '29' \
    --name 'W6pihgd8' \
    --offset '3' \
    --sortBy 'tlaETf7u' \
    --status 'ACTIVE' \
    > test.out 2>&1
eval_tap $? 65 'GetStatCycles1' test.out

#- 66 BulkGetStatCycle1
./ng net.accelbyte.sdk.cli.Main social bulkGetStatCycle1 \
    --namespace "$AB_NAMESPACE" \
    --body '{"cycleIds": ["6zESdvQq", "WPVeZV9f", "oF7vTxzW"]}' \
    > test.out 2>&1
eval_tap $? 66 'BulkGetStatCycle1' test.out

#- 67 GetStatCycle1
./ng net.accelbyte.sdk.cli.Main social getStatCycle1 \
    --cycleId 'cKHzYXcc' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 67 'GetStatCycle1' test.out

#- 68 BulkFetchStatItems1
./ng net.accelbyte.sdk.cli.Main social bulkFetchStatItems1 \
    --namespace "$AB_NAMESPACE" \
    --statCode '026Lzfqn' \
    --userIds '0Um1tRkN' \
    > test.out 2>&1
eval_tap $? 68 'BulkFetchStatItems1' test.out

#- 69 PublicBulkIncUserStatItem
./ng net.accelbyte.sdk.cli.Main social publicBulkIncUserStatItem \
    --namespace "$AB_NAMESPACE" \
    --body '[{"inc": 0.541632186479433, "statCode": "o6HwfuJ6", "userId": "tQ0s7jnS"}, {"inc": 0.39665221172981935, "statCode": "m6xrIgIA", "userId": "XeCeKB6e"}, {"inc": 0.4251303531044196, "statCode": "QmWMy94M", "userId": "xEHpu6gb"}]' \
    > test.out 2>&1
eval_tap $? 69 'PublicBulkIncUserStatItem' test.out

#- 70 PublicBulkIncUserStatItemValue
./ng net.accelbyte.sdk.cli.Main social publicBulkIncUserStatItemValue \
    --namespace "$AB_NAMESPACE" \
    --body '[{"inc": 0.3627493576043932, "statCode": "4MB2veud", "userId": "CtvmIAlJ"}, {"inc": 0.1859542980856106, "statCode": "xbZTPqce", "userId": "WEus5b6N"}, {"inc": 0.656839826743873, "statCode": "pgDoy2RX", "userId": "7UzgG9RP"}]' \
    > test.out 2>&1
eval_tap $? 70 'PublicBulkIncUserStatItemValue' test.out

#- 71 BulkResetUserStatItem2
./ng net.accelbyte.sdk.cli.Main social bulkResetUserStatItem2 \
    --namespace "$AB_NAMESPACE" \
    --body '[{"statCode": "UTa39oDi", "userId": "zYo55JjF"}, {"statCode": "o55BQsJs", "userId": "z6XFNGpL"}, {"statCode": "ijaKFCi5", "userId": "F2qqlP6B"}]' \
    > test.out 2>&1
eval_tap $? 71 'BulkResetUserStatItem2' test.out

#- 72 CreateStat1
./ng net.accelbyte.sdk.cli.Main social createStat1 \
    --namespace "$AB_NAMESPACE" \
    --body '{"cycleIds": ["N1nDRixn", "gHzqrn8T", "MtjbLWcz"], "defaultValue": 0.925818158459902, "description": "Av7XpIsV", "globalAggregationMethod": "LAST", "ignoreAdditionalDataOnValueRejected": true, "incrementOnly": false, "isPublic": true, "maximum": 0.6860071827322978, "minimum": 0.3611009589810452, "name": "JfRhgeXD", "setAsGlobal": true, "setBy": "CLIENT", "statCode": "p1QNANbA", "tags": ["oWNGbh30", "kCSRlr9f", "5wnOWxbh"]}' \
    > test.out 2>&1
eval_tap $? 72 'CreateStat1' test.out

#- 73 PublicListMyStatCycleItems
./ng net.accelbyte.sdk.cli.Main social publicListMyStatCycleItems \
    --cycleId 'uP14aju1' \
    --namespace "$AB_NAMESPACE" \
    --limit '95' \
    --offset '87' \
    --sortBy 'PhQ6R99s' \
    --statCodes 'NAs46ldL,JKHCSZWr,DZpYEGEb' \
    > test.out 2>&1
eval_tap $? 73 'PublicListMyStatCycleItems' test.out

#- 74 PublicListMyStatItems
./ng net.accelbyte.sdk.cli.Main social publicListMyStatItems \
    --namespace "$AB_NAMESPACE" \
    --limit '67' \
    --offset '40' \
    --sortBy '2umVqqDf' \
    --statCodes 'oFqd3Bty,Dr8iCpEy,yK3ElZvf' \
    --tags 'YrUnMGP2,96JZgGRx,aHvIZdc0' \
    > test.out 2>&1
eval_tap $? 74 'PublicListMyStatItems' test.out

#- 75 PublicListAllMyStatItems
./ng net.accelbyte.sdk.cli.Main social publicListAllMyStatItems \
    --namespace "$AB_NAMESPACE" \
    --additionalKey '5tc8gcy0' \
    --statCodes 'ghZPFYqU,a1DCvl82,M9IRBQuu' \
    --tags 'pFhKcUro,DLP7cWrw,8BDJv6sT' \
    > test.out 2>&1
eval_tap $? 75 'PublicListAllMyStatItems' test.out

#- 76 GetUserStatCycleItems1
./ng net.accelbyte.sdk.cli.Main social getUserStatCycleItems1 \
    --cycleId 'mIyZZuSl' \
    --namespace "$AB_NAMESPACE" \
    --userId '8ZyxM3Xi' \
    --limit '70' \
    --offset '1' \
    --sortBy 'xfSPgPUO' \
    --statCodes 'n1L9r2Z8' \
    > test.out 2>&1
eval_tap $? 76 'GetUserStatCycleItems1' test.out

#- 77 PublicQueryUserStatItems
./ng net.accelbyte.sdk.cli.Main social publicQueryUserStatItems \
    --namespace "$AB_NAMESPACE" \
    --userId 'LNhhThRb' \
    --limit '12' \
    --offset '38' \
    --sortBy 'RAbS0k4A' \
    --statCodes 'Dpg0VyKL' \
    --tags 'L1miOy7B' \
    > test.out 2>&1
eval_tap $? 77 'PublicQueryUserStatItems' test.out

#- 78 PublicBulkCreateUserStatItems
./ng net.accelbyte.sdk.cli.Main social publicBulkCreateUserStatItems \
    --namespace "$AB_NAMESPACE" \
    --userId 'FmC9sc14' \
    --body '[{"statCode": "REqskZJZ"}, {"statCode": "f03M86wF"}, {"statCode": "eTxMFThV"}]' \
    > test.out 2>&1
eval_tap $? 78 'PublicBulkCreateUserStatItems' test.out

#- 79 PublicQueryUserStatItems1
./ng net.accelbyte.sdk.cli.Main social publicQueryUserStatItems1 \
    --namespace "$AB_NAMESPACE" \
    --userId '74cAzDrD' \
    --additionalKey 'BBtbSRQm' \
    --statCodes 'ONkX5BCk,RDYbRDW3,zSQ1iPis' \
    --tags 'UorNvVHO,J9Z5U6d2,dr6ddZDM' \
    > test.out 2>&1
eval_tap $? 79 'PublicQueryUserStatItems1' test.out

#- 80 PublicBulkIncUserStatItem1
./ng net.accelbyte.sdk.cli.Main social publicBulkIncUserStatItem1 \
    --namespace "$AB_NAMESPACE" \
    --userId 'H5Wx8AmT' \
    --body '[{"inc": 0.11515829007211009, "statCode": "7hjevZTi"}, {"inc": 0.9101216701443983, "statCode": "4j9EGKdp"}, {"inc": 0.15700928288864924, "statCode": "8MqmztTC"}]' \
    > test.out 2>&1
eval_tap $? 80 'PublicBulkIncUserStatItem1' test.out

#- 81 BulkIncUserStatItemValue2
./ng net.accelbyte.sdk.cli.Main social bulkIncUserStatItemValue2 \
    --namespace "$AB_NAMESPACE" \
    --userId 'Pv2lede7' \
    --body '[{"inc": 0.2542229432846227, "statCode": "1CFDiaQT"}, {"inc": 0.8598863661237446, "statCode": "hT1MbtS7"}, {"inc": 0.5048415469933956, "statCode": "Gpywbwud"}]' \
    > test.out 2>&1
eval_tap $? 81 'BulkIncUserStatItemValue2' test.out

#- 82 BulkResetUserStatItem3
./ng net.accelbyte.sdk.cli.Main social bulkResetUserStatItem3 \
    --namespace "$AB_NAMESPACE" \
    --userId '3IJnAQdI' \
    --body '[{"statCode": "ZkIg1F66"}, {"statCode": "OfN4wxiL"}, {"statCode": "6lByyUkP"}]' \
    > test.out 2>&1
eval_tap $? 82 'BulkResetUserStatItem3' test.out

#- 83 PublicCreateUserStatItem
./ng net.accelbyte.sdk.cli.Main social publicCreateUserStatItem \
    --namespace "$AB_NAMESPACE" \
    --statCode 'VO49HpL1' \
    --userId 'M8gY7Ofa' \
    > test.out 2>&1
eval_tap $? 83 'PublicCreateUserStatItem' test.out

#- 84 DeleteUserStatItems1
./ng net.accelbyte.sdk.cli.Main social deleteUserStatItems1 \
    --namespace "$AB_NAMESPACE" \
    --statCode '86aLRIXS' \
    --userId 'W9jaY187' \
    > test.out 2>&1
eval_tap $? 84 'DeleteUserStatItems1' test.out

#- 85 PublicIncUserStatItem
./ng net.accelbyte.sdk.cli.Main social publicIncUserStatItem \
    --namespace "$AB_NAMESPACE" \
    --statCode 'SCq3D9wW' \
    --userId 'eXZ7XNvZ' \
    --body '{"inc": 0.040782385078430905}' \
    > test.out 2>&1
eval_tap $? 85 'PublicIncUserStatItem' test.out

#- 86 PublicIncUserStatItemValue
./ng net.accelbyte.sdk.cli.Main social publicIncUserStatItemValue \
    --namespace "$AB_NAMESPACE" \
    --statCode 'GZ7UxfjQ' \
    --userId '2OPyECEL' \
    --body '{"inc": 0.3888120426800755}' \
    > test.out 2>&1
eval_tap $? 86 'PublicIncUserStatItemValue' test.out

#- 87 ResetUserStatItemValue1
./ng net.accelbyte.sdk.cli.Main social resetUserStatItemValue1 \
    --namespace "$AB_NAMESPACE" \
    --statCode 'SmdYTWTA' \
    --userId 'VzHGhEVD' \
    > test.out 2>&1
eval_tap $? 87 'ResetUserStatItemValue1' test.out

#- 88 BulkUpdateUserStatItemV2
./ng net.accelbyte.sdk.cli.Main social bulkUpdateUserStatItemV2 \
    --namespace "$AB_NAMESPACE" \
    --body '[{"additionalData": {"2dNgxi4M": {}, "iIOuFWdh": {}, "JT78Cobn": {}}, "additionalKey": "MEUArNJu", "statCode": "MZ28XkkV", "updateStrategy": "MAX", "userId": "db9JLCk4", "value": 0.3615669172367194}, {"additionalData": {"yXfsmq6G": {}, "WiH4XFEz": {}, "fDLFOKki": {}}, "additionalKey": "rchlahjt", "statCode": "Y7L8vKvI", "updateStrategy": "MIN", "userId": "RO22pStz", "value": 0.769067151239801}, {"additionalData": {"OXSmeInX": {}, "5ZkHw4Vl": {}, "FdRZqrsb": {}}, "additionalKey": "ogKaDbri", "statCode": "GqCLmQsm", "updateStrategy": "INCREMENT", "userId": "WNvCsIuT", "value": 0.4771425512108376}]' \
    > test.out 2>&1
eval_tap $? 88 'BulkUpdateUserStatItemV2' test.out

#- 89 BulkFetchOrDefaultStatItems1
./ng net.accelbyte.sdk.cli.Main social bulkFetchOrDefaultStatItems1 \
    --namespace "$AB_NAMESPACE" \
    --additionalKey 'G22MqoDx' \
    --statCode '0JcSkDQT' \
    --userIds '5ejbV1Gy,7FI5U9XS,HQAfZNq9' \
    > test.out 2>&1
eval_tap $? 89 'BulkFetchOrDefaultStatItems1' test.out

#- 90 AdminListUsersStatItems
./ng net.accelbyte.sdk.cli.Main social adminListUsersStatItems \
    --namespace "$AB_NAMESPACE" \
    --userId 'eyFY5LHB' \
    --additionalKey '31tll0JH' \
    --statCodes 'QWYhzdv6,KJqZKdIu,5xBpC4cg' \
    --tags 'W9v9UuzT,6uIwnwXE,IlUlLtkX' \
    > test.out 2>&1
eval_tap $? 90 'AdminListUsersStatItems' test.out

#- 91 BulkUpdateUserStatItem
./ng net.accelbyte.sdk.cli.Main social bulkUpdateUserStatItem \
    --namespace "$AB_NAMESPACE" \
    --userId 'al682f58' \
    --additionalKey 'kepMQiTf' \
    --body '[{"additionalData": {"ICL5fB7u": {}, "SAD73eHM": {}, "e8k4DTVw": {}}, "statCode": "KEFhhlqg", "updateStrategy": "MIN", "value": 0.24334539627720753}, {"additionalData": {"gAxD3ANT": {}, "smbno9BS": {}, "Jw57SOKO": {}}, "statCode": "ff1IsX1m", "updateStrategy": "INCREMENT", "value": 0.4489066083215494}, {"additionalData": {"sXmSUDI9": {}, "3j5plqqM": {}, "LbfsmTbh": {}}, "statCode": "pLhMsiU7", "updateStrategy": "MIN", "value": 0.9972758202517077}]' \
    > test.out 2>&1
eval_tap $? 91 'BulkUpdateUserStatItem' test.out

#- 92 BulkResetUserStatItemValues
./ng net.accelbyte.sdk.cli.Main social bulkResetUserStatItemValues \
    --namespace "$AB_NAMESPACE" \
    --userId '3CwbhGl8' \
    --additionalKey 'BU0r7XcX' \
    --body '[{"additionalData": {"fqtWx0zL": {}, "rCz00pIU": {}, "KbFSqihb": {}}, "statCode": "TaPznoXW"}, {"additionalData": {"Khv2haUQ": {}, "HGgvE82M": {}, "nd9P7SMR": {}}, "statCode": "nOvpJAHn"}, {"additionalData": {"hqfJqMp0": {}, "uIHZ3cWj": {}, "3zASf6P9": {}}, "statCode": "QPl8dxBF"}]' \
    > test.out 2>&1
eval_tap $? 92 'BulkResetUserStatItemValues' test.out

#- 93 DeleteUserStatItems2
./ng net.accelbyte.sdk.cli.Main social deleteUserStatItems2 \
    --namespace "$AB_NAMESPACE" \
    --statCode 'ngStfi9f' \
    --userId 'zAD7Z89q' \
    --additionalKey '75tISAUH' \
    > test.out 2>&1
eval_tap $? 93 'DeleteUserStatItems2' test.out

#- 94 UpdateUserStatItemValue
./ng net.accelbyte.sdk.cli.Main social updateUserStatItemValue \
    --namespace "$AB_NAMESPACE" \
    --statCode 'D0TNV3i4' \
    --userId 'M12kGcOX' \
    --additionalKey 'odSw8woo' \
    --body '{"additionalData": {"NLRjnuM8": {}, "f35ICcfS": {}, "7ug2rF4A": {}}, "updateStrategy": "MIN", "value": 0.551823657851038}' \
    > test.out 2>&1
eval_tap $? 94 'UpdateUserStatItemValue' test.out

#- 95 BulkUpdateUserStatItem1
./ng net.accelbyte.sdk.cli.Main social bulkUpdateUserStatItem1 \
    --namespace "$AB_NAMESPACE" \
    --body '[{"additionalData": {"JVIRk0M8": {}, "lrzKIkzM": {}, "ppRsrTfw": {}}, "additionalKey": "2nIogFM2", "statCode": "uly1w8dK", "updateStrategy": "MAX", "userId": "l5BXPAzP", "value": 0.7959383580203347}, {"additionalData": {"9MQebzIe": {}, "cVkWTvD8": {}, "UMP54U1E": {}}, "additionalKey": "0YoFQGVn", "statCode": "rzX0v2HR", "updateStrategy": "MIN", "userId": "Nsd06RLU", "value": 0.7694581031468615}, {"additionalData": {"PYgfhqFr": {}, "BA3lbztT": {}, "cZF5KbSr": {}}, "additionalKey": "0EQVCy8L", "statCode": "Xq40nqWk", "updateStrategy": "INCREMENT", "userId": "GVt6kpXI", "value": 0.8231454385102597}]' \
    > test.out 2>&1
eval_tap $? 95 'BulkUpdateUserStatItem1' test.out

#- 96 PublicQueryUserStatItems2
./ng net.accelbyte.sdk.cli.Main social publicQueryUserStatItems2 \
    --namespace "$AB_NAMESPACE" \
    --userId 'k4eynrkf' \
    --additionalKey '1vgbpwxN' \
    --statCodes 'ePMGGpYE,3ESQbpkE,W3Z9GSQt' \
    --tags 'FlnaD8EY,QnEOoBOB,SI2sbTJ9' \
    > test.out 2>&1
eval_tap $? 96 'PublicQueryUserStatItems2' test.out

#- 97 BulkUpdateUserStatItem2
./ng net.accelbyte.sdk.cli.Main social bulkUpdateUserStatItem2 \
    --namespace "$AB_NAMESPACE" \
    --userId 'wdXiBp9j' \
    --additionalKey 'ubCoPlaS' \
    --body '[{"additionalData": {"vf12nJYM": {}, "Jm6bufD0": {}, "BgO7GRbt": {}}, "statCode": "PgO6lF8t", "updateStrategy": "MAX", "value": 0.4105907461501275}, {"additionalData": {"0sshgvbE": {}, "XmNUdTXy": {}, "dZCLdl0k": {}}, "statCode": "01Z8dpdD", "updateStrategy": "OVERRIDE", "value": 0.8265785028611483}, {"additionalData": {"Vi9k2H3n": {}, "AdtprPWp": {}, "eTj9VJ7E": {}}, "statCode": "lKuQa4m4", "updateStrategy": "MAX", "value": 0.9831476346563721}]' \
    > test.out 2>&1
eval_tap $? 97 'BulkUpdateUserStatItem2' test.out

#- 98 UpdateUserStatItemValue1
./ng net.accelbyte.sdk.cli.Main social updateUserStatItemValue1 \
    --namespace "$AB_NAMESPACE" \
    --statCode 'Ohhe84yt' \
    --userId '6gWqpyUy' \
    --additionalKey 'I70w0puF' \
    --body '{"additionalData": {"voQPwJLV": {}, "K8N7gEcK": {}, "dkMg7QnL": {}}, "updateStrategy": "OVERRIDE", "value": 0.3367354718197706}' \
    > test.out 2>&1
eval_tap $? 98 'UpdateUserStatItemValue1' test.out


rm -f "tmp.dat"

exit $EXIT_CODE