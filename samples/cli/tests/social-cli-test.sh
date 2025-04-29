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
    --limit '73' \
    --offset '49' \
    --statCodes 'OamJgnru' \
    > test.out 2>&1
eval_tap $? 26 'GetGlobalStatItems' test.out

#- 27 GetGlobalStatItemByStatCode
./ng net.accelbyte.sdk.cli.Main social getGlobalStatItemByStatCode \
    --namespace "$AB_NAMESPACE" \
    --statCode 'STud9owa' \
    > test.out 2>&1
eval_tap $? 27 'GetGlobalStatItemByStatCode' test.out

#- 28 GetStatCycles
./ng net.accelbyte.sdk.cli.Main social getStatCycles \
    --namespace "$AB_NAMESPACE" \
    --cycleType 'MONTHLY' \
    --limit '57' \
    --name 'VlolEmSJ' \
    --offset '48' \
    --sortBy 'X6wDA3KS' \
    --status 'STOPPED' \
    > test.out 2>&1
eval_tap $? 28 'GetStatCycles' test.out

#- 29 CreateStatCycle
./ng net.accelbyte.sdk.cli.Main social createStatCycle \
    --namespace "$AB_NAMESPACE" \
    --body '{"cycleType": "WEEKLY", "description": "V3UjQqyD", "end": "1976-04-24T00:00:00Z", "id": "Thm98E3t", "name": "4LYxD9gj", "resetDate": 8, "resetDay": 51, "resetMonth": 32, "resetTime": "HaK1u4ya", "seasonPeriod": 30, "start": "1981-05-19T00:00:00Z"}' \
    > test.out 2>&1
eval_tap $? 29 'CreateStatCycle' test.out

#- 30 BulkGetStatCycle
./ng net.accelbyte.sdk.cli.Main social bulkGetStatCycle \
    --namespace "$AB_NAMESPACE" \
    --body '{"cycleIds": ["24JshoKJ", "3ydkxvHs", "Xoj0NihK"]}' \
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
    --cycleId 'kum3KJ8C' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 33 'GetStatCycle' test.out

#- 34 UpdateStatCycle
./ng net.accelbyte.sdk.cli.Main social updateStatCycle \
    --cycleId 'YGr7n51l' \
    --namespace "$AB_NAMESPACE" \
    --body '{"cycleType": "MONTHLY", "description": "pxvMvlSS", "end": "1977-10-28T00:00:00Z", "name": "7xV27FgD", "resetDate": 4, "resetDay": 76, "resetMonth": 67, "resetTime": "pwW4Vnfm", "seasonPeriod": 65, "start": "1988-01-12T00:00:00Z"}' \
    > test.out 2>&1
eval_tap $? 34 'UpdateStatCycle' test.out

#- 35 DeleteStatCycle
./ng net.accelbyte.sdk.cli.Main social deleteStatCycle \
    --cycleId 'WClcTg1y' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 35 'DeleteStatCycle' test.out

#- 36 BulkAddStats
./ng net.accelbyte.sdk.cli.Main social bulkAddStats \
    --cycleId 'tkFvTEES' \
    --namespace "$AB_NAMESPACE" \
    --body '{"statCodes": ["zaZSDtPJ", "MvWCS8Vy", "lka0bKc7"]}' \
    > test.out 2>&1
eval_tap $? 36 'BulkAddStats' test.out

#- 37 StopStatCycle
./ng net.accelbyte.sdk.cli.Main social stopStatCycle \
    --cycleId 'ZMnoeI4j' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 37 'StopStatCycle' test.out

#- 38 BulkFetchStatItems
./ng net.accelbyte.sdk.cli.Main social bulkFetchStatItems \
    --namespace "$AB_NAMESPACE" \
    --statCode 'kKIjVgsY' \
    --userIds 'agSeVwId' \
    > test.out 2>&1
eval_tap $? 38 'BulkFetchStatItems' test.out

#- 39 BulkIncUserStatItem
./ng net.accelbyte.sdk.cli.Main social bulkIncUserStatItem \
    --namespace "$AB_NAMESPACE" \
    --body '[{"inc": 0.6077369831371816, "statCode": "5dVueopW", "userId": "hlgNmz6G"}, {"inc": 0.6258874417924353, "statCode": "KLrB12fI", "userId": "zdU9ytDr"}, {"inc": 0.137162012590487, "statCode": "NWBVy9K5", "userId": "XWZjhC5M"}]' \
    > test.out 2>&1
eval_tap $? 39 'BulkIncUserStatItem' test.out

#- 40 BulkIncUserStatItemValue
./ng net.accelbyte.sdk.cli.Main social bulkIncUserStatItemValue \
    --namespace "$AB_NAMESPACE" \
    --body '[{"inc": 0.07228932296840362, "statCode": "zXie0X6D", "userId": "WGI7hqtg"}, {"inc": 0.5006763605228328, "statCode": "YwcBfjoA", "userId": "SBB2DDlY"}, {"inc": 0.9009359127160944, "statCode": "v3iBEIvy", "userId": "y5fy4A6B"}]' \
    > test.out 2>&1
eval_tap $? 40 'BulkIncUserStatItemValue' test.out

#- 41 BulkFetchOrDefaultStatItems
./ng net.accelbyte.sdk.cli.Main social bulkFetchOrDefaultStatItems \
    --namespace "$AB_NAMESPACE" \
    --statCode 'CnIoaSY4' \
    --userIds '3DGPsf7o,uDKQB7Wy,0MZIMEpp' \
    > test.out 2>&1
eval_tap $? 41 'BulkFetchOrDefaultStatItems' test.out

#- 42 BulkResetUserStatItem
./ng net.accelbyte.sdk.cli.Main social bulkResetUserStatItem \
    --namespace "$AB_NAMESPACE" \
    --body '[{"statCode": "nuW56FH9", "userId": "tWbydgIF"}, {"statCode": "ElMD37BN", "userId": "RKP0UxOY"}, {"statCode": "gOKVdih3", "userId": "8dUJyp06"}]' \
    > test.out 2>&1
eval_tap $? 42 'BulkResetUserStatItem' test.out

#- 43 GetStats
./ng net.accelbyte.sdk.cli.Main social getStats \
    --namespace "$AB_NAMESPACE" \
    --cycleIds 'S2cx4S7L' \
    --isGlobal  \
    --isPublic  \
    --limit '61' \
    --offset '57' \
    > test.out 2>&1
eval_tap $? 43 'GetStats' test.out

#- 44 CreateStat
./ng net.accelbyte.sdk.cli.Main social createStat \
    --namespace "$AB_NAMESPACE" \
    --body '{"capCycleOverride": true, "cycleIds": ["J1Ue7f7E", "FTkea6Rv", "3bGQxzg3"], "cycleOverrides": [{"cycleId": "8wl6IQ1K", "maximum": 0.8934425058607475, "minimum": 0.6633042050941348}, {"cycleId": "DNRzjafx", "maximum": 0.2682674659941461, "minimum": 0.41923867996675745}, {"cycleId": "yAkiCspJ", "maximum": 0.9882129902555117, "minimum": 0.9014630730737491}], "defaultValue": 0.7705843748018573, "description": "5ND0RgQu", "globalAggregationMethod": "LAST", "ignoreAdditionalDataOnValueRejected": true, "incrementOnly": false, "isPublic": false, "maximum": 0.64716042001223, "minimum": 0.33736976825411324, "name": "3HmlK2D7", "setAsGlobal": true, "setBy": "CLIENT", "statCode": "WLKb6BnL", "tags": ["ZFG3eqez", "YjcvUkht", "Ykcu5c73"], "visibility": "SHOWALL"}' \
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
    --limit '44' \
    --offset '91' \
    --keyword 'PKAuTgG7' \
    > test.out 2>&1
eval_tap $? 47 'QueryStats' test.out

#- 48 GetStat
./ng net.accelbyte.sdk.cli.Main social getStat \
    --namespace "$AB_NAMESPACE" \
    --statCode 'mms0OAxI' \
    > test.out 2>&1
eval_tap $? 48 'GetStat' test.out

#- 49 DeleteStat
./ng net.accelbyte.sdk.cli.Main social deleteStat \
    --namespace "$AB_NAMESPACE" \
    --statCode 'CohdTw2m' \
    > test.out 2>&1
eval_tap $? 49 'DeleteStat' test.out

#- 50 UpdateStat
./ng net.accelbyte.sdk.cli.Main social updateStat \
    --namespace "$AB_NAMESPACE" \
    --statCode 'sotwTEQz' \
    --body '{"capCycleOverride": true, "cycleIds": ["FFR2iw0k", "M5Cs8Kva", "dUKW2CC4"], "cycleOverrides": [{"cycleId": "I3atjJAg", "maximum": 0.5061353307530495, "minimum": 0.34339157932391273}, {"cycleId": "0r01Totr", "maximum": 0.6187382817341135, "minimum": 0.35454955405830135}, {"cycleId": "XBud1Ngf", "maximum": 0.9665701154714574, "minimum": 0.7649289253922392}], "defaultValue": 0.26926305560997943, "description": "aI6eqXC0", "globalAggregationMethod": "TOTAL", "ignoreAdditionalDataOnValueRejected": false, "isPublic": true, "name": "VxsQlDQX", "tags": ["zUHpX6CF", "u1uj7zPh", "FfUL3WpI"], "visibility": "SERVERONLY"}' \
    > test.out 2>&1
eval_tap $? 50 'UpdateStat' test.out

#- 51 GetStatItems
./ng net.accelbyte.sdk.cli.Main social getStatItems \
    --namespace "$AB_NAMESPACE" \
    --statCode 'fZ9xO0US' \
    --limit '89' \
    --offset '30' \
    --sortBy 'qjyELTL9' \
    > test.out 2>&1
eval_tap $? 51 'GetStatItems' test.out

#- 52 DeleteTiedStat
./ng net.accelbyte.sdk.cli.Main social deleteTiedStat \
    --namespace "$AB_NAMESPACE" \
    --statCode 'mlhJ72eT' \
    > test.out 2>&1
eval_tap $? 52 'DeleteTiedStat' test.out

#- 53 GetUserStatCycleItems
./ng net.accelbyte.sdk.cli.Main social getUserStatCycleItems \
    --cycleId '1PfYAesa' \
    --namespace "$AB_NAMESPACE" \
    --userId 'tU1B5rbK' \
    --isPublic  \
    --limit '7' \
    --offset '90' \
    --sortBy 'nIZvhD7d' \
    --statCodes 'cse0LcEk' \
    > test.out 2>&1
eval_tap $? 53 'GetUserStatCycleItems' test.out

#- 54 GetUserStatItems
./ng net.accelbyte.sdk.cli.Main social getUserStatItems \
    --namespace "$AB_NAMESPACE" \
    --userId 'Gn0QwmEO' \
    --isPublic  \
    --limit '73' \
    --offset '54' \
    --sortBy 'miDsJBNS' \
    --statCodes 'scnDOsjz' \
    --tags 'ILuKWlDZ' \
    > test.out 2>&1
eval_tap $? 54 'GetUserStatItems' test.out

#- 55 BulkCreateUserStatItems
./ng net.accelbyte.sdk.cli.Main social bulkCreateUserStatItems \
    --namespace "$AB_NAMESPACE" \
    --userId '5VtnNKeU' \
    --body '[{"statCode": "oewAEVId"}, {"statCode": "GgNzScCV"}, {"statCode": "kEO9L7gA"}]' \
    > test.out 2>&1
eval_tap $? 55 'BulkCreateUserStatItems' test.out

#- 56 BulkIncUserStatItem1
./ng net.accelbyte.sdk.cli.Main social bulkIncUserStatItem1 \
    --namespace "$AB_NAMESPACE" \
    --userId 'JVyY4kVZ' \
    --body '[{"inc": 0.399980114186299, "statCode": "Znbxd3wL"}, {"inc": 0.07680471467840388, "statCode": "sSMFKY6A"}, {"inc": 0.7754508600340806, "statCode": "0Gy60A12"}]' \
    > test.out 2>&1
eval_tap $? 56 'BulkIncUserStatItem1' test.out

#- 57 BulkIncUserStatItemValue1
./ng net.accelbyte.sdk.cli.Main social bulkIncUserStatItemValue1 \
    --namespace "$AB_NAMESPACE" \
    --userId 'C6vmkzQi' \
    --body '[{"inc": 0.14620184809821202, "statCode": "uLHyvofW"}, {"inc": 0.8647855387481068, "statCode": "H13jH0lD"}, {"inc": 0.24656835903943308, "statCode": "8ZgoGcpg"}]' \
    > test.out 2>&1
eval_tap $? 57 'BulkIncUserStatItemValue1' test.out

#- 58 BulkResetUserStatItem1
./ng net.accelbyte.sdk.cli.Main social bulkResetUserStatItem1 \
    --namespace "$AB_NAMESPACE" \
    --userId 'pWJaEqf1' \
    --body '[{"statCode": "DBMoFV9Q"}, {"statCode": "aIVCyXFB"}, {"statCode": "sclERPpQ"}]' \
    > test.out 2>&1
eval_tap $? 58 'BulkResetUserStatItem1' test.out

#- 59 CreateUserStatItem
./ng net.accelbyte.sdk.cli.Main social createUserStatItem \
    --namespace "$AB_NAMESPACE" \
    --statCode 'tib1KkEl' \
    --userId '935JYr21' \
    > test.out 2>&1
eval_tap $? 59 'CreateUserStatItem' test.out

#- 60 DeleteUserStatItems
./ng net.accelbyte.sdk.cli.Main social deleteUserStatItems \
    --namespace "$AB_NAMESPACE" \
    --statCode 'C09b8hIW' \
    --userId 'WOT0VqQS' \
    > test.out 2>&1
eval_tap $? 60 'DeleteUserStatItems' test.out

#- 61 IncUserStatItemValue
./ng net.accelbyte.sdk.cli.Main social incUserStatItemValue \
    --namespace "$AB_NAMESPACE" \
    --statCode 'vhQi1iDe' \
    --userId 'UTU4YkKy' \
    --body '{"inc": 0.3541218371397036}' \
    > test.out 2>&1
eval_tap $? 61 'IncUserStatItemValue' test.out

#- 62 ResetUserStatItemValue
./ng net.accelbyte.sdk.cli.Main social resetUserStatItemValue \
    --namespace "$AB_NAMESPACE" \
    --statCode 'kr9D7j3D' \
    --userId 'JTe8tSgG' \
    --additionalKey 'er21D5LH' \
    --body '{"additionalData": {"ZAxrqnEe": {}, "tqQZiqay": {}, "VMvO7aG0": {}}}' \
    > test.out 2>&1
eval_tap $? 62 'ResetUserStatItemValue' test.out

#- 63 GetGlobalStatItems1
./ng net.accelbyte.sdk.cli.Main social getGlobalStatItems1 \
    --namespace "$AB_NAMESPACE" \
    --limit '43' \
    --offset '35' \
    --statCodes 'T3PRgy0A' \
    > test.out 2>&1
eval_tap $? 63 'GetGlobalStatItems1' test.out

#- 64 GetGlobalStatItemByStatCode1
./ng net.accelbyte.sdk.cli.Main social getGlobalStatItemByStatCode1 \
    --namespace "$AB_NAMESPACE" \
    --statCode 'rnR9MiDv' \
    > test.out 2>&1
eval_tap $? 64 'GetGlobalStatItemByStatCode1' test.out

#- 65 GetStatCycles1
./ng net.accelbyte.sdk.cli.Main social getStatCycles1 \
    --namespace "$AB_NAMESPACE" \
    --cycleType 'ANNUALLY' \
    --limit '57' \
    --name 'wDsXxHtN' \
    --offset '94' \
    --sortBy 'c9uHv2MX' \
    --status 'ACTIVE' \
    > test.out 2>&1
eval_tap $? 65 'GetStatCycles1' test.out

#- 66 BulkGetStatCycle1
./ng net.accelbyte.sdk.cli.Main social bulkGetStatCycle1 \
    --namespace "$AB_NAMESPACE" \
    --body '{"cycleIds": ["BKHjQJuu", "z860kYUT", "nPMQ5OXZ"]}' \
    > test.out 2>&1
eval_tap $? 66 'BulkGetStatCycle1' test.out

#- 67 GetStatCycle1
./ng net.accelbyte.sdk.cli.Main social getStatCycle1 \
    --cycleId 'SNbSk2sN' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 67 'GetStatCycle1' test.out

#- 68 BulkFetchStatItems1
./ng net.accelbyte.sdk.cli.Main social bulkFetchStatItems1 \
    --namespace "$AB_NAMESPACE" \
    --statCode 'mWd7WUS3' \
    --userIds '40MYkRAx' \
    > test.out 2>&1
eval_tap $? 68 'BulkFetchStatItems1' test.out

#- 69 PublicBulkIncUserStatItem
./ng net.accelbyte.sdk.cli.Main social publicBulkIncUserStatItem \
    --namespace "$AB_NAMESPACE" \
    --body '[{"inc": 0.909206270066868, "statCode": "zi6GVmdc", "userId": "fdLmGGXp"}, {"inc": 0.3021384775233501, "statCode": "Wu5XcG3N", "userId": "Qx5Dy61G"}, {"inc": 0.8005548193636401, "statCode": "Aujx1tE6", "userId": "DUpDe04q"}]' \
    > test.out 2>&1
eval_tap $? 69 'PublicBulkIncUserStatItem' test.out

#- 70 PublicBulkIncUserStatItemValue
./ng net.accelbyte.sdk.cli.Main social publicBulkIncUserStatItemValue \
    --namespace "$AB_NAMESPACE" \
    --body '[{"inc": 0.7007732298213754, "statCode": "hLAm9OsY", "userId": "CUgPmhUv"}, {"inc": 0.5312083420284041, "statCode": "0RIk8mll", "userId": "BNTnyANj"}, {"inc": 0.5105344141271898, "statCode": "v40Uj2yH", "userId": "knECFLBf"}]' \
    > test.out 2>&1
eval_tap $? 70 'PublicBulkIncUserStatItemValue' test.out

#- 71 BulkResetUserStatItem2
./ng net.accelbyte.sdk.cli.Main social bulkResetUserStatItem2 \
    --namespace "$AB_NAMESPACE" \
    --body '[{"statCode": "Bg2gNLJE", "userId": "zib5mSbH"}, {"statCode": "Mq9BY0IT", "userId": "BpgQoPKO"}, {"statCode": "Xkmr2i3z", "userId": "c2Xm3iX2"}]' \
    > test.out 2>&1
eval_tap $? 71 'BulkResetUserStatItem2' test.out

#- 72 CreateStat1
./ng net.accelbyte.sdk.cli.Main social createStat1 \
    --namespace "$AB_NAMESPACE" \
    --body '{"capCycleOverride": true, "cycleIds": ["2oJyILOz", "LDjxloZi", "nUIlYOrz"], "cycleOverrides": [{"cycleId": "WRHcnQL3", "maximum": 0.010898622166290117, "minimum": 0.42624318585234255}, {"cycleId": "qYz6rSeE", "maximum": 0.2584772871394355, "minimum": 0.6645552037744791}, {"cycleId": "VRE4gErp", "maximum": 0.5306507180012916, "minimum": 0.8733126444537384}], "defaultValue": 0.9950201156023513, "description": "bJVdyDlv", "globalAggregationMethod": "MIN", "ignoreAdditionalDataOnValueRejected": false, "incrementOnly": false, "isPublic": false, "maximum": 0.3605364740176892, "minimum": 0.579351005481022, "name": "XHPIYikZ", "setAsGlobal": true, "setBy": "SERVER", "statCode": "xsi8UkEI", "tags": ["osfeLVue", "oodJ8jHk", "6uVpxMs4"], "visibility": "SERVERONLY"}' \
    > test.out 2>&1
eval_tap $? 72 'CreateStat1' test.out

#- 73 PublicListMyStatCycleItems
./ng net.accelbyte.sdk.cli.Main social publicListMyStatCycleItems \
    --cycleId '5B7WY7u0' \
    --namespace "$AB_NAMESPACE" \
    --limit '83' \
    --offset '67' \
    --sortBy 'bGBKBeeN' \
    --statCodes 'wNf3u867,FbFFad6S,7zkbAL1E' \
    > test.out 2>&1
eval_tap $? 73 'PublicListMyStatCycleItems' test.out

#- 74 PublicListMyStatItems
./ng net.accelbyte.sdk.cli.Main social publicListMyStatItems \
    --namespace "$AB_NAMESPACE" \
    --limit '85' \
    --offset '99' \
    --sortBy 'OaHDUB0p' \
    --statCodes 'Qqzr6udq,CVER6fZs,2HXVbOOd' \
    --tags 'MVQSnNG9,lQd0iopA,PAgTZJ3X' \
    > test.out 2>&1
eval_tap $? 74 'PublicListMyStatItems' test.out

#- 75 PublicListAllMyStatItems
./ng net.accelbyte.sdk.cli.Main social publicListAllMyStatItems \
    --namespace "$AB_NAMESPACE" \
    --additionalKey 'iRriBfSY' \
    --statCodes 'ZUjppuVc,nRvmibIz,IZApudBS' \
    --tags 'E67LFlbS,DL3NROrB,DRl5iaY4' \
    > test.out 2>&1
eval_tap $? 75 'PublicListAllMyStatItems' test.out

#- 76 GetUserStatCycleItems1
./ng net.accelbyte.sdk.cli.Main social getUserStatCycleItems1 \
    --cycleId '3K3ZULJy' \
    --namespace "$AB_NAMESPACE" \
    --userId 'WE3OSF7q' \
    --limit '21' \
    --offset '92' \
    --sortBy 'hpx6v93e' \
    --statCodes 'mRFDXxYn' \
    > test.out 2>&1
eval_tap $? 76 'GetUserStatCycleItems1' test.out

#- 77 PublicQueryUserStatItems1
./ng net.accelbyte.sdk.cli.Main social publicQueryUserStatItems1 \
    --namespace "$AB_NAMESPACE" \
    --userId 'BdFyLgQb' \
    --limit '18' \
    --offset '37' \
    --sortBy 'SiVZ6qI5' \
    --statCodes 'KeZXfYwP' \
    --tags 'mxg2UmNI' \
    > test.out 2>&1
eval_tap $? 77 'PublicQueryUserStatItems1' test.out

#- 78 PublicBulkCreateUserStatItems
./ng net.accelbyte.sdk.cli.Main social publicBulkCreateUserStatItems \
    --namespace "$AB_NAMESPACE" \
    --userId 'x8cW8hnM' \
    --body '[{"statCode": "ar3W78Jt"}, {"statCode": "6whVOMDW"}, {"statCode": "sPX28Eni"}]' \
    > test.out 2>&1
eval_tap $? 78 'PublicBulkCreateUserStatItems' test.out

#- 79 PublicQueryUserStatItems
./ng net.accelbyte.sdk.cli.Main social publicQueryUserStatItems \
    --namespace "$AB_NAMESPACE" \
    --userId 'QSN92y6y' \
    --additionalKey 'w7rKoc1F' \
    --statCodes 'fICHa59i,4lNrjnz6,xt8epwtC' \
    --tags '17RtnVmv,rxrLGeN5,T2CvDJxt' \
    > test.out 2>&1
eval_tap $? 79 'PublicQueryUserStatItems' test.out

#- 80 PublicBulkIncUserStatItem1
./ng net.accelbyte.sdk.cli.Main social publicBulkIncUserStatItem1 \
    --namespace "$AB_NAMESPACE" \
    --userId 'je1uFZyO' \
    --body '[{"inc": 0.5973847395213634, "statCode": "BIS71xRG"}, {"inc": 0.9329077799448798, "statCode": "FQzGIdF1"}, {"inc": 0.18618372747508827, "statCode": "FUPGUz7Q"}]' \
    > test.out 2>&1
eval_tap $? 80 'PublicBulkIncUserStatItem1' test.out

#- 81 BulkIncUserStatItemValue2
./ng net.accelbyte.sdk.cli.Main social bulkIncUserStatItemValue2 \
    --namespace "$AB_NAMESPACE" \
    --userId 'PZpqnQ4g' \
    --body '[{"inc": 0.9828132088020152, "statCode": "WhCBLLmV"}, {"inc": 0.07184118100893666, "statCode": "Voz5EuKO"}, {"inc": 0.10170960395713924, "statCode": "5HGPaeAk"}]' \
    > test.out 2>&1
eval_tap $? 81 'BulkIncUserStatItemValue2' test.out

#- 82 BulkResetUserStatItem3
./ng net.accelbyte.sdk.cli.Main social bulkResetUserStatItem3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'kMXoTapp' \
    --body '[{"statCode": "foFp9zCD"}, {"statCode": "AMNeGCgc"}, {"statCode": "pGQvbEj0"}]' \
    > test.out 2>&1
eval_tap $? 82 'BulkResetUserStatItem3' test.out

#- 83 PublicCreateUserStatItem
./ng net.accelbyte.sdk.cli.Main social publicCreateUserStatItem \
    --namespace "$AB_NAMESPACE" \
    --statCode 'OHAK6jXy' \
    --userId 'WZBTEg4O' \
    > test.out 2>&1
eval_tap $? 83 'PublicCreateUserStatItem' test.out

#- 84 DeleteUserStatItems1
./ng net.accelbyte.sdk.cli.Main social deleteUserStatItems1 \
    --namespace "$AB_NAMESPACE" \
    --statCode 'X75gw2dT' \
    --userId '3Z4uuNB7' \
    > test.out 2>&1
eval_tap $? 84 'DeleteUserStatItems1' test.out

#- 85 PublicIncUserStatItem
./ng net.accelbyte.sdk.cli.Main social publicIncUserStatItem \
    --namespace "$AB_NAMESPACE" \
    --statCode '735LYmVC' \
    --userId 'BsCEPGTa' \
    --body '{"inc": 0.6389559683824111}' \
    > test.out 2>&1
eval_tap $? 85 'PublicIncUserStatItem' test.out

#- 86 PublicIncUserStatItemValue
./ng net.accelbyte.sdk.cli.Main social publicIncUserStatItemValue \
    --namespace "$AB_NAMESPACE" \
    --statCode '6Hbu4LPJ' \
    --userId 'fTigXImz' \
    --body '{"inc": 0.47673010278230776}' \
    > test.out 2>&1
eval_tap $? 86 'PublicIncUserStatItemValue' test.out

#- 87 ResetUserStatItemValue1
./ng net.accelbyte.sdk.cli.Main social resetUserStatItemValue1 \
    --namespace "$AB_NAMESPACE" \
    --statCode '4eUzP09l' \
    --userId 'pGSD74qb' \
    > test.out 2>&1
eval_tap $? 87 'ResetUserStatItemValue1' test.out

#- 88 BulkUpdateUserStatItemV2
./ng net.accelbyte.sdk.cli.Main social bulkUpdateUserStatItemV2 \
    --namespace "$AB_NAMESPACE" \
    --body '[{"additionalData": {"tO29wwKf": {}, "PmYR1TmD": {}, "CQo917l4": {}}, "additionalKey": "v13Re2U7", "statCode": "3rg3eZEF", "updateStrategy": "INCREMENT", "userId": "CFVsSyAI", "value": 0.8962927384220715}, {"additionalData": {"dot44JMo": {}, "6z9WP6sP": {}, "QdPUAoJG": {}}, "additionalKey": "AvkTn8G0", "statCode": "D7tHcLFF", "updateStrategy": "INCREMENT", "userId": "flWi07b9", "value": 0.14047862686189505}, {"additionalData": {"2LvbenKp": {}, "1RHFgtht": {}, "wELPzNTz": {}}, "additionalKey": "DF4AaDle", "statCode": "YdnPoseI", "updateStrategy": "MAX", "userId": "bCoaugj1", "value": 0.7063932958274619}]' \
    > test.out 2>&1
eval_tap $? 88 'BulkUpdateUserStatItemV2' test.out

#- 89 BulkFetchOrDefaultStatItems1
./ng net.accelbyte.sdk.cli.Main social bulkFetchOrDefaultStatItems1 \
    --namespace "$AB_NAMESPACE" \
    --additionalKey 'oIrrlT67' \
    --statCode 'rvnUTruz' \
    --userIds 'y2E2KBpA,vPJINofa,AvCY3vFf' \
    > test.out 2>&1
eval_tap $? 89 'BulkFetchOrDefaultStatItems1' test.out

#- 90 AdminListUsersStatItems
./ng net.accelbyte.sdk.cli.Main social adminListUsersStatItems \
    --namespace "$AB_NAMESPACE" \
    --userId 'PFniY8c5' \
    --additionalKey 'QL4YgtQ7' \
    --statCodes 'jgq9DtPE,4fP6YVD5,5kRsIKuH' \
    --tags 'PoF8wJ7X,ymhMVWA8,ZJ00H3ON' \
    > test.out 2>&1
eval_tap $? 90 'AdminListUsersStatItems' test.out

#- 91 BulkUpdateUserStatItem
./ng net.accelbyte.sdk.cli.Main social bulkUpdateUserStatItem \
    --namespace "$AB_NAMESPACE" \
    --userId 'aENXstUw' \
    --additionalKey 'hCqzJdyU' \
    --body '[{"additionalData": {"QZEGoPOJ": {}, "lJRyoXOD": {}, "ioJrrZpm": {}}, "statCode": "8GP43kwv", "updateStrategy": "INCREMENT", "value": 0.9410807019874322}, {"additionalData": {"jxoyLqSs": {}, "iespaqCK": {}, "mtqADIfR": {}}, "statCode": "Ds8DHEk3", "updateStrategy": "MIN", "value": 0.11035743879664739}, {"additionalData": {"TE4abulG": {}, "MNDQuzJF": {}, "DzTilQhJ": {}}, "statCode": "C5dXfFSV", "updateStrategy": "MAX", "value": 0.013621395289089011}]' \
    > test.out 2>&1
eval_tap $? 91 'BulkUpdateUserStatItem' test.out

#- 92 BulkGetOrDefaultByUserId
./ng net.accelbyte.sdk.cli.Main social bulkGetOrDefaultByUserId \
    --namespace "$AB_NAMESPACE" \
    --userId 'K8feUIW2' \
    --additionalKey 'FxB4vMp2' \
    --body '{"statCodes": ["YRqObH41", "zDUelXEt", "UkzGWAx6"]}' \
    > test.out 2>&1
eval_tap $? 92 'BulkGetOrDefaultByUserId' test.out

#- 93 BulkResetUserStatItemValues
./ng net.accelbyte.sdk.cli.Main social bulkResetUserStatItemValues \
    --namespace "$AB_NAMESPACE" \
    --userId 'XmJFtw3n' \
    --additionalKey 'SBtxhcLG' \
    --body '[{"additionalData": {"d8jkztA2": {}, "a7mMnZw5": {}, "H6d5pN0t": {}}, "statCode": "ZmbwlCMR"}, {"additionalData": {"wuvTEtu3": {}, "fWseSRSU": {}, "xLgMiIeF": {}}, "statCode": "KW5GzRg8"}, {"additionalData": {"7rXvOZLx": {}, "n3g5qbMw": {}, "UzaCwNpH": {}}, "statCode": "UHuLbfQy"}]' \
    > test.out 2>&1
eval_tap $? 93 'BulkResetUserStatItemValues' test.out

#- 94 DeleteUserStatItems2
./ng net.accelbyte.sdk.cli.Main social deleteUserStatItems2 \
    --namespace "$AB_NAMESPACE" \
    --statCode '4WeP8k2A' \
    --userId 'AWkcyMFx' \
    --additionalKey 'Mi4uEMWm' \
    > test.out 2>&1
eval_tap $? 94 'DeleteUserStatItems2' test.out

#- 95 UpdateUserStatItemValue
./ng net.accelbyte.sdk.cli.Main social updateUserStatItemValue \
    --namespace "$AB_NAMESPACE" \
    --statCode 'cIiluZJ7' \
    --userId '7mHcgZJU' \
    --additionalKey 'brCUMO3D' \
    --body '{"additionalData": {"M7fizGmH": {}, "uk45qc84": {}, "ojzECUNV": {}}, "updateStrategy": "INCREMENT", "value": 0.49420730520697786}' \
    > test.out 2>&1
eval_tap $? 95 'UpdateUserStatItemValue' test.out

#- 96 BulkUpdateUserStatItem1
./ng net.accelbyte.sdk.cli.Main social bulkUpdateUserStatItem1 \
    --namespace "$AB_NAMESPACE" \
    --body '[{"additionalData": {"FL1CGaNz": {}, "ATTVTCLt": {}, "cb61n9g8": {}}, "additionalKey": "3IGM206s", "statCode": "FBeqErlD", "updateStrategy": "MAX", "userId": "96niFM57", "value": 0.1260424206696431}, {"additionalData": {"UnKplh4d": {}, "AaGOvzuL": {}, "diA7qrFV": {}}, "additionalKey": "ZzQPl0UE", "statCode": "RR5dqpxG", "updateStrategy": "INCREMENT", "userId": "tEasDyfg", "value": 0.9796049465928317}, {"additionalData": {"Ktsqtu8r": {}, "AWMdU9yI": {}, "1ySOIxro": {}}, "additionalKey": "OT5MBIWH", "statCode": "ylp3ElnV", "updateStrategy": "INCREMENT", "userId": "NK0liggr", "value": 0.6156150611627017}]' \
    > test.out 2>&1
eval_tap $? 96 'BulkUpdateUserStatItem1' test.out

#- 97 PublicQueryUserStatItems2
./ng net.accelbyte.sdk.cli.Main social publicQueryUserStatItems2 \
    --namespace "$AB_NAMESPACE" \
    --userId '3X6nyMlg' \
    --additionalKey 'HTHItQd7' \
    --statCodes 'ftLTPwY0,8vlZocVZ,ibXIOHWM' \
    --tags '4UscZp5n,bFrJOE3j,p5tPGz7X' \
    > test.out 2>&1
eval_tap $? 97 'PublicQueryUserStatItems2' test.out

#- 98 BulkUpdateUserStatItem2
./ng net.accelbyte.sdk.cli.Main social bulkUpdateUserStatItem2 \
    --namespace "$AB_NAMESPACE" \
    --userId 'WqthJ3cR' \
    --additionalKey '8lEx9FMd' \
    --body '[{"additionalData": {"4GR5r2sb": {}, "QrRhgw8z": {}, "5Sem7qzz": {}}, "statCode": "25PDiPKP", "updateStrategy": "INCREMENT", "value": 0.842975158602747}, {"additionalData": {"Yvpq95QQ": {}, "U9rr1iGR": {}, "KPbiPlbf": {}}, "statCode": "wFSUuX2A", "updateStrategy": "MAX", "value": 0.6107195490642977}, {"additionalData": {"IdRkIqkG": {}, "3KfQ9NEr": {}, "BvDtUStX": {}}, "statCode": "aIJHJ3Pj", "updateStrategy": "MIN", "value": 0.07552090821350355}]' \
    > test.out 2>&1
eval_tap $? 98 'BulkUpdateUserStatItem2' test.out

#- 99 UpdateUserStatItemValue1
./ng net.accelbyte.sdk.cli.Main social updateUserStatItemValue1 \
    --namespace "$AB_NAMESPACE" \
    --statCode 'KNrBNPhj' \
    --userId 'uduFzVpP' \
    --additionalKey 'Td4K0DsR' \
    --body '{"additionalData": {"0KIVvI9n": {}, "K7J8GTI9": {}, "jhUsuCp4": {}}, "updateStrategy": "MIN", "value": 0.06542804400208135}' \
    > test.out 2>&1
eval_tap $? 99 'UpdateUserStatItemValue1' test.out


rm -f "tmp.dat"

exit $EXIT_CODE