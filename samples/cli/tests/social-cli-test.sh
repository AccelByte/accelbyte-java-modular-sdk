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
    --limit '63' \
    --offset '44' \
    --statCodes 'IO7XvTPz' \
    > test.out 2>&1
eval_tap $? 26 'GetGlobalStatItems' test.out

#- 27 GetGlobalStatItemByStatCode
./ng net.accelbyte.sdk.cli.Main social getGlobalStatItemByStatCode \
    --namespace "$AB_NAMESPACE" \
    --statCode 'DrRZVMA9' \
    > test.out 2>&1
eval_tap $? 27 'GetGlobalStatItemByStatCode' test.out

#- 28 GetStatCycles
./ng net.accelbyte.sdk.cli.Main social getStatCycles \
    --namespace "$AB_NAMESPACE" \
    --cycleType 'WEEKLY' \
    --limit '70' \
    --name 'dFZn8QLA' \
    --offset '39' \
    --sortBy 'sOBjBMFP' \
    --status 'STOPPED' \
    > test.out 2>&1
eval_tap $? 28 'GetStatCycles' test.out

#- 29 CreateStatCycle
./ng net.accelbyte.sdk.cli.Main social createStatCycle \
    --namespace "$AB_NAMESPACE" \
    --body '{"cycleType": "WEEKLY", "description": "wKu7mWvQ", "end": "1994-01-13T00:00:00Z", "id": "tv0vr56k", "name": "jFv9DUWo", "resetDate": 93, "resetDay": 46, "resetMonth": 61, "resetTime": "wa6XVwiw", "seasonPeriod": 69, "start": "1982-11-15T00:00:00Z"}' \
    > test.out 2>&1
eval_tap $? 29 'CreateStatCycle' test.out

#- 30 BulkGetStatCycle
./ng net.accelbyte.sdk.cli.Main social bulkGetStatCycle \
    --namespace "$AB_NAMESPACE" \
    --body '{"cycleIds": ["qJxJcIwP", "rd4A4NiC", "StXRvCCm"]}' \
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
    --cycleId 'FFwpndgH' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 33 'GetStatCycle' test.out

#- 34 UpdateStatCycle
./ng net.accelbyte.sdk.cli.Main social updateStatCycle \
    --cycleId 'uqORvy3h' \
    --namespace "$AB_NAMESPACE" \
    --body '{"cycleType": "DAILY", "description": "DQNPFZFP", "end": "1979-11-25T00:00:00Z", "name": "LDZCwsQZ", "resetDate": 54, "resetDay": 16, "resetMonth": 78, "resetTime": "HNocViaO", "seasonPeriod": 11, "start": "1983-12-31T00:00:00Z"}' \
    > test.out 2>&1
eval_tap $? 34 'UpdateStatCycle' test.out

#- 35 DeleteStatCycle
./ng net.accelbyte.sdk.cli.Main social deleteStatCycle \
    --cycleId 'kXeNfH0k' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 35 'DeleteStatCycle' test.out

#- 36 BulkAddStats
./ng net.accelbyte.sdk.cli.Main social bulkAddStats \
    --cycleId 'A9nTsvFA' \
    --namespace "$AB_NAMESPACE" \
    --body '{"statCodes": ["wM12iR5c", "gLKniVP2", "RJ2Ps6cP"]}' \
    > test.out 2>&1
eval_tap $? 36 'BulkAddStats' test.out

#- 37 StopStatCycle
./ng net.accelbyte.sdk.cli.Main social stopStatCycle \
    --cycleId 'qS0yRq0s' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 37 'StopStatCycle' test.out

#- 38 BulkFetchStatItems
./ng net.accelbyte.sdk.cli.Main social bulkFetchStatItems \
    --namespace "$AB_NAMESPACE" \
    --statCode 'C2fIzzMj' \
    --userIds '2GprlS2S' \
    > test.out 2>&1
eval_tap $? 38 'BulkFetchStatItems' test.out

#- 39 BulkIncUserStatItem
./ng net.accelbyte.sdk.cli.Main social bulkIncUserStatItem \
    --namespace "$AB_NAMESPACE" \
    --body '[{"inc": 0.3831980315761707, "statCode": "hJdJOmaG", "userId": "yFpzEH9K"}, {"inc": 0.8519511948586937, "statCode": "jWKjczBb", "userId": "h6j5bu6D"}, {"inc": 0.851709457518269, "statCode": "rAnGmgkT", "userId": "XIIc7rlw"}]' \
    > test.out 2>&1
eval_tap $? 39 'BulkIncUserStatItem' test.out

#- 40 BulkIncUserStatItemValue
./ng net.accelbyte.sdk.cli.Main social bulkIncUserStatItemValue \
    --namespace "$AB_NAMESPACE" \
    --body '[{"inc": 0.43842344363951946, "statCode": "qF4pFwKy", "userId": "4Vg8Q4Ax"}, {"inc": 0.08228248402638716, "statCode": "mdDhZ2CX", "userId": "BNNyqefX"}, {"inc": 0.685281082297381, "statCode": "JvKKBnDY", "userId": "d8GDwoNv"}]' \
    > test.out 2>&1
eval_tap $? 40 'BulkIncUserStatItemValue' test.out

#- 41 BulkFetchOrDefaultStatItems
./ng net.accelbyte.sdk.cli.Main social bulkFetchOrDefaultStatItems \
    --namespace "$AB_NAMESPACE" \
    --statCode 'CryJDa0w' \
    --userIds 'CShbaT80,3N8HJ5rW,jW6MZPWE' \
    > test.out 2>&1
eval_tap $? 41 'BulkFetchOrDefaultStatItems' test.out

#- 42 BulkResetUserStatItem
./ng net.accelbyte.sdk.cli.Main social bulkResetUserStatItem \
    --namespace "$AB_NAMESPACE" \
    --body '[{"statCode": "RqLzIjyv", "userId": "oIXjiPf7"}, {"statCode": "4pVxQRDj", "userId": "AyPy56At"}, {"statCode": "4UazH3Oa", "userId": "8PgQHa0G"}]' \
    > test.out 2>&1
eval_tap $? 42 'BulkResetUserStatItem' test.out

#- 43 GetStats
./ng net.accelbyte.sdk.cli.Main social getStats \
    --namespace "$AB_NAMESPACE" \
    --cycleIds 'lsmSbXs5' \
    --isGlobal  \
    --isPublic  \
    --limit '78' \
    --offset '98' \
    > test.out 2>&1
eval_tap $? 43 'GetStats' test.out

#- 44 CreateStat
./ng net.accelbyte.sdk.cli.Main social createStat \
    --namespace "$AB_NAMESPACE" \
    --body '{"capCycleOverride": true, "cycleIds": ["jAdoR8BE", "kDC1Ridv", "ydN795NF"], "cycleOverrides": [{"cycleId": "CmLMlTIp", "maximum": 0.3204713681696405, "minimum": 0.9701861904792669}, {"cycleId": "cGwwLxxp", "maximum": 0.3420831295082638, "minimum": 0.054652307065032435}, {"cycleId": "36G22XQy", "maximum": 0.8661766668740575, "minimum": 0.6846965355256341}], "defaultValue": 0.7887119951431001, "description": "gvwSWFAC", "globalAggregationMethod": "LAST", "ignoreAdditionalDataOnValueRejected": false, "incrementOnly": true, "isPublic": false, "maximum": 0.2521779647518705, "minimum": 0.3401916625829887, "name": "wDzd4NVy", "setAsGlobal": true, "setBy": "SERVER", "statCode": "oAENxgll", "tags": ["cDDVIUUh", "4r2nPzdy", "IRy1LXJK"], "visibility": "SHOWALL"}' \
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
    --limit '20' \
    --offset '98' \
    --keyword 'sikGNRXZ' \
    > test.out 2>&1
eval_tap $? 47 'QueryStats' test.out

#- 48 GetStat
./ng net.accelbyte.sdk.cli.Main social getStat \
    --namespace "$AB_NAMESPACE" \
    --statCode 'VbnyzSuZ' \
    > test.out 2>&1
eval_tap $? 48 'GetStat' test.out

#- 49 DeleteStat
./ng net.accelbyte.sdk.cli.Main social deleteStat \
    --namespace "$AB_NAMESPACE" \
    --statCode 'CsphtESz' \
    > test.out 2>&1
eval_tap $? 49 'DeleteStat' test.out

#- 50 UpdateStat
./ng net.accelbyte.sdk.cli.Main social updateStat \
    --namespace "$AB_NAMESPACE" \
    --statCode '6rTOrgWi' \
    --body '{"capCycleOverride": true, "cycleIds": ["Xxwlg6AD", "LL8dKy7U", "ZIQMz9Gt"], "cycleOverrides": [{"cycleId": "nksME7XL", "maximum": 0.4711769517073593, "minimum": 0.7824789092139802}, {"cycleId": "dPmRcZcp", "maximum": 0.7964161802928492, "minimum": 0.4858801124791936}, {"cycleId": "k8benlOJ", "maximum": 0.08197690358670529, "minimum": 0.3348275684466011}], "defaultValue": 0.052399126807444074, "description": "uWYxKgYq", "globalAggregationMethod": "MIN", "ignoreAdditionalDataOnValueRejected": false, "incrementOnly": false, "isPublic": false, "maximum": 0.5614267082211455, "minimum": 0.6926642896132218, "name": "xCYQxW7E", "setAsGlobal": false, "setBy": "CLIENT", "tags": ["K9veudHE", "IrSUVR45", "PgjNPxgM"], "visibility": "SHOWALL"}' \
    > test.out 2>&1
eval_tap $? 50 'UpdateStat' test.out

#- 51 GetStatItems
./ng net.accelbyte.sdk.cli.Main social getStatItems \
    --namespace "$AB_NAMESPACE" \
    --statCode 'Y22QzuUK' \
    --limit '2' \
    --offset '90' \
    --sortBy 'KDC2AlOi' \
    > test.out 2>&1
eval_tap $? 51 'GetStatItems' test.out

#- 52 DeleteTiedStat
./ng net.accelbyte.sdk.cli.Main social deleteTiedStat \
    --namespace "$AB_NAMESPACE" \
    --statCode 'ZPXoY6Ac' \
    > test.out 2>&1
eval_tap $? 52 'DeleteTiedStat' test.out

#- 53 GetUserStatCycleItems
./ng net.accelbyte.sdk.cli.Main social getUserStatCycleItems \
    --cycleId 'wsn0ab6s' \
    --namespace "$AB_NAMESPACE" \
    --userId 'BLlDp2jd' \
    --isPublic  \
    --limit '89' \
    --offset '98' \
    --sortBy 'fOE3N1hD' \
    --statCodes 'LMPgtdtX' \
    > test.out 2>&1
eval_tap $? 53 'GetUserStatCycleItems' test.out

#- 54 GetUserStatItems
./ng net.accelbyte.sdk.cli.Main social getUserStatItems \
    --namespace "$AB_NAMESPACE" \
    --userId 'HGlNXG0v' \
    --isPublic  \
    --limit '36' \
    --offset '87' \
    --sortBy 'zWoRGGxY' \
    --statCodes 'FnZ5BgRV' \
    --tags 'km10iGSb' \
    > test.out 2>&1
eval_tap $? 54 'GetUserStatItems' test.out

#- 55 BulkCreateUserStatItems
./ng net.accelbyte.sdk.cli.Main social bulkCreateUserStatItems \
    --namespace "$AB_NAMESPACE" \
    --userId '2zY1MGMV' \
    --body '[{"statCode": "LaMVGFT9"}, {"statCode": "yhx3JWIf"}, {"statCode": "dLCAeMik"}]' \
    > test.out 2>&1
eval_tap $? 55 'BulkCreateUserStatItems' test.out

#- 56 BulkIncUserStatItem1
./ng net.accelbyte.sdk.cli.Main social bulkIncUserStatItem1 \
    --namespace "$AB_NAMESPACE" \
    --userId 'aXO1XSE4' \
    --body '[{"inc": 0.33653780422868196, "statCode": "us674u0S"}, {"inc": 0.767420843675042, "statCode": "3DmZZ6ZX"}, {"inc": 0.3816121775717183, "statCode": "6aXOj2hd"}]' \
    > test.out 2>&1
eval_tap $? 56 'BulkIncUserStatItem1' test.out

#- 57 BulkIncUserStatItemValue1
./ng net.accelbyte.sdk.cli.Main social bulkIncUserStatItemValue1 \
    --namespace "$AB_NAMESPACE" \
    --userId 'Juzf2MR0' \
    --body '[{"inc": 0.5005867055200519, "statCode": "v4QRzeRo"}, {"inc": 0.3185724141896449, "statCode": "wsbFm5iy"}, {"inc": 0.11426445252527528, "statCode": "fb10hbjH"}]' \
    > test.out 2>&1
eval_tap $? 57 'BulkIncUserStatItemValue1' test.out

#- 58 BulkResetUserStatItem1
./ng net.accelbyte.sdk.cli.Main social bulkResetUserStatItem1 \
    --namespace "$AB_NAMESPACE" \
    --userId 'ig0JD6qU' \
    --body '[{"statCode": "MjGmpxbz"}, {"statCode": "IcXBf5S7"}, {"statCode": "mLuaChK3"}]' \
    > test.out 2>&1
eval_tap $? 58 'BulkResetUserStatItem1' test.out

#- 59 CreateUserStatItem
./ng net.accelbyte.sdk.cli.Main social createUserStatItem \
    --namespace "$AB_NAMESPACE" \
    --statCode '9FiP1sdr' \
    --userId '5BtZXBnq' \
    > test.out 2>&1
eval_tap $? 59 'CreateUserStatItem' test.out

#- 60 DeleteUserStatItems
./ng net.accelbyte.sdk.cli.Main social deleteUserStatItems \
    --namespace "$AB_NAMESPACE" \
    --statCode 'qnreznXJ' \
    --userId '4ru0rrc9' \
    > test.out 2>&1
eval_tap $? 60 'DeleteUserStatItems' test.out

#- 61 IncUserStatItemValue
./ng net.accelbyte.sdk.cli.Main social incUserStatItemValue \
    --namespace "$AB_NAMESPACE" \
    --statCode 'eqYrF4GM' \
    --userId 'yL6Kh6ZN' \
    --body '{"inc": 0.4665802875205928}' \
    > test.out 2>&1
eval_tap $? 61 'IncUserStatItemValue' test.out

#- 62 ResetUserStatItemValue
./ng net.accelbyte.sdk.cli.Main social resetUserStatItemValue \
    --namespace "$AB_NAMESPACE" \
    --statCode '2BLaIogx' \
    --userId 'jgE0tNnL' \
    --additionalKey 'wu0e8fhW' \
    --body '{"additionalData": {"e5I0JBxS": {}, "U3yCd5LA": {}, "C2AJBGxR": {}}}' \
    > test.out 2>&1
eval_tap $? 62 'ResetUserStatItemValue' test.out

#- 63 GetGlobalStatItems1
./ng net.accelbyte.sdk.cli.Main social getGlobalStatItems1 \
    --namespace "$AB_NAMESPACE" \
    --limit '7' \
    --offset '36' \
    --statCodes 'LPKSB7KG' \
    > test.out 2>&1
eval_tap $? 63 'GetGlobalStatItems1' test.out

#- 64 GetGlobalStatItemByStatCode1
./ng net.accelbyte.sdk.cli.Main social getGlobalStatItemByStatCode1 \
    --namespace "$AB_NAMESPACE" \
    --statCode 'BLywJrNR' \
    > test.out 2>&1
eval_tap $? 64 'GetGlobalStatItemByStatCode1' test.out

#- 65 GetStatCycles1
./ng net.accelbyte.sdk.cli.Main social getStatCycles1 \
    --namespace "$AB_NAMESPACE" \
    --cycleType 'WEEKLY' \
    --limit '33' \
    --name 'GVhiH5Ke' \
    --offset '15' \
    --sortBy 'IdMehhqs' \
    --status 'ACTIVE' \
    > test.out 2>&1
eval_tap $? 65 'GetStatCycles1' test.out

#- 66 BulkGetStatCycle1
./ng net.accelbyte.sdk.cli.Main social bulkGetStatCycle1 \
    --namespace "$AB_NAMESPACE" \
    --body '{"cycleIds": ["ySaXYuam", "gOR9RCkh", "dc6uqWwP"]}' \
    > test.out 2>&1
eval_tap $? 66 'BulkGetStatCycle1' test.out

#- 67 GetStatCycle1
./ng net.accelbyte.sdk.cli.Main social getStatCycle1 \
    --cycleId '6AR3Syrc' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 67 'GetStatCycle1' test.out

#- 68 BulkFetchStatItems1
./ng net.accelbyte.sdk.cli.Main social bulkFetchStatItems1 \
    --namespace "$AB_NAMESPACE" \
    --statCode 'lsiPJyaA' \
    --userIds 'cdjpe6jI' \
    > test.out 2>&1
eval_tap $? 68 'BulkFetchStatItems1' test.out

#- 69 PublicBulkIncUserStatItem
./ng net.accelbyte.sdk.cli.Main social publicBulkIncUserStatItem \
    --namespace "$AB_NAMESPACE" \
    --body '[{"inc": 0.9838770571987653, "statCode": "b2ks4uOO", "userId": "UmKzhpGb"}, {"inc": 0.10408579133449003, "statCode": "oxNC53RX", "userId": "Y9vF6z8i"}, {"inc": 0.32304973705507556, "statCode": "Nxxe9hHX", "userId": "9PcCnVpv"}]' \
    > test.out 2>&1
eval_tap $? 69 'PublicBulkIncUserStatItem' test.out

#- 70 PublicBulkIncUserStatItemValue
./ng net.accelbyte.sdk.cli.Main social publicBulkIncUserStatItemValue \
    --namespace "$AB_NAMESPACE" \
    --body '[{"inc": 0.2319468499055799, "statCode": "rdvXiTJ6", "userId": "E76TXpQU"}, {"inc": 0.355836479730016, "statCode": "Rcx19eJ9", "userId": "rIjf8Qk2"}, {"inc": 0.9726992304768827, "statCode": "AQyXnVn6", "userId": "s0nIzFYq"}]' \
    > test.out 2>&1
eval_tap $? 70 'PublicBulkIncUserStatItemValue' test.out

#- 71 BulkResetUserStatItem2
./ng net.accelbyte.sdk.cli.Main social bulkResetUserStatItem2 \
    --namespace "$AB_NAMESPACE" \
    --body '[{"statCode": "u0laqjau", "userId": "huoLQaDw"}, {"statCode": "1NAefzrH", "userId": "AzzSqBw8"}, {"statCode": "foNFhEGq", "userId": "EYEqYFdi"}]' \
    > test.out 2>&1
eval_tap $? 71 'BulkResetUserStatItem2' test.out

#- 72 CreateStat1
./ng net.accelbyte.sdk.cli.Main social createStat1 \
    --namespace "$AB_NAMESPACE" \
    --body '{"capCycleOverride": true, "cycleIds": ["kShtE8JN", "GjOIvyBO", "zqve0NWK"], "cycleOverrides": [{"cycleId": "w3aX76Ym", "maximum": 0.6686618337426984, "minimum": 0.8900698582155788}, {"cycleId": "GLkchKxM", "maximum": 0.7007761203131425, "minimum": 0.8254935458290622}, {"cycleId": "h3FW4Gnx", "maximum": 0.5288196026090128, "minimum": 0.6499424843227007}], "defaultValue": 0.8864116864604225, "description": "3EXyypmb", "globalAggregationMethod": "LAST", "ignoreAdditionalDataOnValueRejected": true, "incrementOnly": false, "isPublic": true, "maximum": 0.5604075543258348, "minimum": 0.15872530078607716, "name": "2eZptJLU", "setAsGlobal": true, "setBy": "CLIENT", "statCode": "yme2D3xh", "tags": ["KS7o43Lg", "ALjDgjXr", "SklHpRYN"], "visibility": "SERVERONLY"}' \
    > test.out 2>&1
eval_tap $? 72 'CreateStat1' test.out

#- 73 PublicListMyStatCycleItems
./ng net.accelbyte.sdk.cli.Main social publicListMyStatCycleItems \
    --cycleId 'ewemRLdT' \
    --namespace "$AB_NAMESPACE" \
    --limit '17' \
    --offset '52' \
    --sortBy 'FXwHgByC' \
    --statCodes 'KIcORQ48,6JqeMNQJ,J93HAcri' \
    > test.out 2>&1
eval_tap $? 73 'PublicListMyStatCycleItems' test.out

#- 74 PublicListMyStatItems
./ng net.accelbyte.sdk.cli.Main social publicListMyStatItems \
    --namespace "$AB_NAMESPACE" \
    --limit '41' \
    --offset '5' \
    --sortBy 'HV9J8X4a' \
    --statCodes 'phPyg4Ji,7Eaq9n9u,B8KcblZ2' \
    --tags 'sX3DqRfz,LmVphnmC,osCZvBP3' \
    > test.out 2>&1
eval_tap $? 74 'PublicListMyStatItems' test.out

#- 75 PublicListAllMyStatItems
./ng net.accelbyte.sdk.cli.Main social publicListAllMyStatItems \
    --namespace "$AB_NAMESPACE" \
    --additionalKey 'OiJEZhXZ' \
    --statCodes 'UrQuua6P,sdAL1S32,CBwPQR3A' \
    --tags 'L2tzrguP,xcDx9hnA,SywYgiag' \
    > test.out 2>&1
eval_tap $? 75 'PublicListAllMyStatItems' test.out

#- 76 GetUserStatCycleItems1
./ng net.accelbyte.sdk.cli.Main social getUserStatCycleItems1 \
    --cycleId 'H3VL1olv' \
    --namespace "$AB_NAMESPACE" \
    --userId 'pp9ASw7w' \
    --limit '47' \
    --offset '99' \
    --sortBy 'ivxwICk4' \
    --statCodes 'qdQE83dL' \
    > test.out 2>&1
eval_tap $? 76 'GetUserStatCycleItems1' test.out

#- 77 PublicQueryUserStatItems1
./ng net.accelbyte.sdk.cli.Main social publicQueryUserStatItems1 \
    --namespace "$AB_NAMESPACE" \
    --userId '4w3NeQ0o' \
    --limit '38' \
    --offset '67' \
    --sortBy 'HPZaEY9W' \
    --statCodes 'gjusEsfP' \
    --tags '5CzJQWXq' \
    > test.out 2>&1
eval_tap $? 77 'PublicQueryUserStatItems1' test.out

#- 78 PublicBulkCreateUserStatItems
./ng net.accelbyte.sdk.cli.Main social publicBulkCreateUserStatItems \
    --namespace "$AB_NAMESPACE" \
    --userId '52mqGtt6' \
    --body '[{"statCode": "A6YYjFgP"}, {"statCode": "4S84p3Im"}, {"statCode": "amnTiSjr"}]' \
    > test.out 2>&1
eval_tap $? 78 'PublicBulkCreateUserStatItems' test.out

#- 79 PublicQueryUserStatItems
./ng net.accelbyte.sdk.cli.Main social publicQueryUserStatItems \
    --namespace "$AB_NAMESPACE" \
    --userId 'm8bll0uC' \
    --additionalKey 'beA5zU5e' \
    --statCodes 'f1OHCpcV,BA7iep79,WguwUg3Y' \
    --tags 'SxN96HMw,nREl7jSh,9P88QNQN' \
    > test.out 2>&1
eval_tap $? 79 'PublicQueryUserStatItems' test.out

#- 80 PublicBulkIncUserStatItem1
./ng net.accelbyte.sdk.cli.Main social publicBulkIncUserStatItem1 \
    --namespace "$AB_NAMESPACE" \
    --userId 'XmLvuoK0' \
    --body '[{"inc": 0.7137031535925898, "statCode": "TkkGsONZ"}, {"inc": 0.5329361121527518, "statCode": "aWTQQxjn"}, {"inc": 0.7136111343227193, "statCode": "Pv7pUS5r"}]' \
    > test.out 2>&1
eval_tap $? 80 'PublicBulkIncUserStatItem1' test.out

#- 81 BulkIncUserStatItemValue2
./ng net.accelbyte.sdk.cli.Main social bulkIncUserStatItemValue2 \
    --namespace "$AB_NAMESPACE" \
    --userId '9VIR7nKj' \
    --body '[{"inc": 0.767396993250992, "statCode": "TxECTGx8"}, {"inc": 0.22148810367440241, "statCode": "GNe3oj3Q"}, {"inc": 0.7534871767598161, "statCode": "81a94gAL"}]' \
    > test.out 2>&1
eval_tap $? 81 'BulkIncUserStatItemValue2' test.out

#- 82 BulkResetUserStatItem3
./ng net.accelbyte.sdk.cli.Main social bulkResetUserStatItem3 \
    --namespace "$AB_NAMESPACE" \
    --userId '6Tsg8Wrb' \
    --body '[{"statCode": "whry90Uo"}, {"statCode": "PYIwBbCB"}, {"statCode": "upAxzoV4"}]' \
    > test.out 2>&1
eval_tap $? 82 'BulkResetUserStatItem3' test.out

#- 83 PublicCreateUserStatItem
./ng net.accelbyte.sdk.cli.Main social publicCreateUserStatItem \
    --namespace "$AB_NAMESPACE" \
    --statCode 'tQBM8EJy' \
    --userId 'We9v98cj' \
    > test.out 2>&1
eval_tap $? 83 'PublicCreateUserStatItem' test.out

#- 84 DeleteUserStatItems1
./ng net.accelbyte.sdk.cli.Main social deleteUserStatItems1 \
    --namespace "$AB_NAMESPACE" \
    --statCode 'uE1trVzs' \
    --userId '6kRd1f22' \
    > test.out 2>&1
eval_tap $? 84 'DeleteUserStatItems1' test.out

#- 85 PublicIncUserStatItem
./ng net.accelbyte.sdk.cli.Main social publicIncUserStatItem \
    --namespace "$AB_NAMESPACE" \
    --statCode 'L5ER9L07' \
    --userId '0u35Z3EA' \
    --body '{"inc": 0.5449650208760567}' \
    > test.out 2>&1
eval_tap $? 85 'PublicIncUserStatItem' test.out

#- 86 PublicIncUserStatItemValue
./ng net.accelbyte.sdk.cli.Main social publicIncUserStatItemValue \
    --namespace "$AB_NAMESPACE" \
    --statCode 'LlJNqLE2' \
    --userId 'imouQwxe' \
    --body '{"inc": 0.5796849678752221}' \
    > test.out 2>&1
eval_tap $? 86 'PublicIncUserStatItemValue' test.out

#- 87 ResetUserStatItemValue1
./ng net.accelbyte.sdk.cli.Main social resetUserStatItemValue1 \
    --namespace "$AB_NAMESPACE" \
    --statCode 'EYtrABpV' \
    --userId 'jECEoOZ0' \
    > test.out 2>&1
eval_tap $? 87 'ResetUserStatItemValue1' test.out

#- 88 BulkUpdateUserStatItemV2
./ng net.accelbyte.sdk.cli.Main social bulkUpdateUserStatItemV2 \
    --namespace "$AB_NAMESPACE" \
    --body '[{"additionalData": {"h0gD6mko": {}, "YJ56AG1o": {}, "0mdJzVNK": {}}, "additionalKey": "Wu3saEYM", "requestId": "7B8GUSa5", "statCode": "SGDytf2q", "updateStrategy": "MAX", "userId": "7gpJSw44", "value": 0.2024428853204422}, {"additionalData": {"SHVmjQWc": {}, "yHAJV8L9": {}, "nWjEFIyS": {}}, "additionalKey": "ebyW0p58", "requestId": "xcTXoMLL", "statCode": "f1TJ5wZV", "updateStrategy": "MIN", "userId": "E3Y8VMiv", "value": 0.19698769715805264}, {"additionalData": {"gClW7l1f": {}, "Y2GhDqlV": {}, "GdWtcY2s": {}}, "additionalKey": "fZ97VXm5", "requestId": "8ayjFZvD", "statCode": "uNx2Pv8P", "updateStrategy": "MAX", "userId": "aNDE3lLw", "value": 0.4822242494840334}]' \
    > test.out 2>&1
eval_tap $? 88 'BulkUpdateUserStatItemV2' test.out

#- 89 BulkFetchOrDefaultStatItems1
./ng net.accelbyte.sdk.cli.Main social bulkFetchOrDefaultStatItems1 \
    --namespace "$AB_NAMESPACE" \
    --additionalKey '1A6sVSaN' \
    --statCode 'fcHy0WkL' \
    --userIds 'kVRhUKHW,APVAcEwl,KKu9ca6U' \
    > test.out 2>&1
eval_tap $? 89 'BulkFetchOrDefaultStatItems1' test.out

#- 90 AdminListUsersStatItems
./ng net.accelbyte.sdk.cli.Main social adminListUsersStatItems \
    --namespace "$AB_NAMESPACE" \
    --userId '1uMk2fDR' \
    --additionalKey 'T9y3JnQR' \
    --statCodes '2gmqLH6s,m0jaGoQg,xwCJFv9s' \
    --tags 'Hdbiwje1,ssajFjFn,onbXxLxi' \
    > test.out 2>&1
eval_tap $? 90 'AdminListUsersStatItems' test.out

#- 91 BulkUpdateUserStatItem
./ng net.accelbyte.sdk.cli.Main social bulkUpdateUserStatItem \
    --namespace "$AB_NAMESPACE" \
    --userId 'tg3RWTem' \
    --additionalKey 'byOg69az' \
    --body '[{"additionalData": {"YNaoz2n5": {}, "qMbh3S3f": {}, "7btV1vYU": {}}, "requestId": "sl5EEq3A", "statCode": "VgyF3Hv8", "updateStrategy": "MAX", "value": 0.6744446616004454}, {"additionalData": {"N7vIXrf8": {}, "AlGe9DvJ": {}, "ReFsWWCK": {}}, "requestId": "4NyiXx2Y", "statCode": "pPAhvP2S", "updateStrategy": "INCREMENT", "value": 0.3105661253857972}, {"additionalData": {"3CTD2UEj": {}, "CxNTNiGC": {}, "ttfDlNbC": {}}, "requestId": "RJoKAZ2J", "statCode": "B0Iaa34S", "updateStrategy": "MIN", "value": 0.3722756319532067}]' \
    > test.out 2>&1
eval_tap $? 91 'BulkUpdateUserStatItem' test.out

#- 92 BulkGetOrDefaultByUserId
./ng net.accelbyte.sdk.cli.Main social bulkGetOrDefaultByUserId \
    --namespace "$AB_NAMESPACE" \
    --userId '6RYEVexx' \
    --additionalKey 'JpVsgqNs' \
    --body '{"statCodes": ["QDnYF9jC", "w5EgktEt", "2kSuXXTz"]}' \
    > test.out 2>&1
eval_tap $? 92 'BulkGetOrDefaultByUserId' test.out

#- 93 BulkResetUserStatItemValues
./ng net.accelbyte.sdk.cli.Main social bulkResetUserStatItemValues \
    --namespace "$AB_NAMESPACE" \
    --userId '6HlxIQvA' \
    --additionalKey 'OO7QAIiA' \
    --body '[{"additionalData": {"4oAhpfrB": {}, "HYdGvA2D": {}, "3PouTE2g": {}}, "statCode": "HCirpgm3"}, {"additionalData": {"5sNIomwU": {}, "hzZZXW3z": {}, "adU8CEb4": {}}, "statCode": "zSzB1rtN"}, {"additionalData": {"CPD7oX6f": {}, "ImEmseAi": {}, "BqLcRv70": {}}, "statCode": "ybxutrcB"}]' \
    > test.out 2>&1
eval_tap $? 93 'BulkResetUserStatItemValues' test.out

#- 94 DeleteUserStatItems2
./ng net.accelbyte.sdk.cli.Main social deleteUserStatItems2 \
    --namespace "$AB_NAMESPACE" \
    --statCode 'LpV4vTwb' \
    --userId 'FrLpOWPp' \
    --additionalKey 'BuDbrMFR' \
    > test.out 2>&1
eval_tap $? 94 'DeleteUserStatItems2' test.out

#- 95 UpdateUserStatItemValue
./ng net.accelbyte.sdk.cli.Main social updateUserStatItemValue \
    --namespace "$AB_NAMESPACE" \
    --statCode 'hY5F2W3A' \
    --userId 'MtwyUiyE' \
    --additionalKey 'kasUUIaM' \
    --body '{"additionalData": {"ynmojKID": {}, "iERYdPLn": {}, "eZqql1qz": {}}, "updateStrategy": "MAX", "value": 0.2572880387445161}' \
    > test.out 2>&1
eval_tap $? 95 'UpdateUserStatItemValue' test.out

#- 96 BulkUpdateUserStatItem1
./ng net.accelbyte.sdk.cli.Main social bulkUpdateUserStatItem1 \
    --namespace "$AB_NAMESPACE" \
    --body '[{"additionalData": {"GpClyUKu": {}, "sNlsqXZM": {}, "gn4OR73K": {}}, "additionalKey": "Igi5kCEK", "requestId": "4ok1YNKb", "statCode": "tMnSVAPS", "updateStrategy": "INCREMENT", "userId": "gAlJAlLB", "value": 0.06084375725051561}, {"additionalData": {"8itMH1Lg": {}, "MP1rM8tB": {}, "3eoC4r0u": {}}, "additionalKey": "yjyqTzMn", "requestId": "CJLJ31TE", "statCode": "gxJ0Rz6k", "updateStrategy": "INCREMENT", "userId": "TzzagQSL", "value": 0.48389424490772415}, {"additionalData": {"KZWYj3Db": {}, "zvl8tg6i": {}, "ychf3mb4": {}}, "additionalKey": "u0C97FHP", "requestId": "qfWkjqk8", "statCode": "nP1cymoW", "updateStrategy": "INCREMENT", "userId": "ryp0qy2Z", "value": 0.8493062268177546}]' \
    > test.out 2>&1
eval_tap $? 96 'BulkUpdateUserStatItem1' test.out

#- 97 PublicQueryUserStatItems2
./ng net.accelbyte.sdk.cli.Main social publicQueryUserStatItems2 \
    --namespace "$AB_NAMESPACE" \
    --userId 'eieTgEMR' \
    --additionalKey 'ewpN2aRa' \
    --statCodes '8NlOMaTn,JbO31z7H,35R47x7C' \
    --tags 'NLVafa7L,h1BCy1S4,xpteKd3B' \
    > test.out 2>&1
eval_tap $? 97 'PublicQueryUserStatItems2' test.out

#- 98 BulkUpdateUserStatItem2
./ng net.accelbyte.sdk.cli.Main social bulkUpdateUserStatItem2 \
    --namespace "$AB_NAMESPACE" \
    --userId 'ITEPF1VM' \
    --additionalKey 'p2yIeIWn' \
    --body '[{"additionalData": {"tFRrdsdf": {}, "ssF9lDVp": {}, "OdwoUZ75": {}}, "requestId": "DpKjE29x", "statCode": "5L93S6xH", "updateStrategy": "MAX", "value": 0.9918948267651276}, {"additionalData": {"hgbC5Cef": {}, "xB03YQVN": {}, "q7ps9jtO": {}}, "requestId": "brwtYvl2", "statCode": "T6JhTJz2", "updateStrategy": "INCREMENT", "value": 0.7490668712262499}, {"additionalData": {"MfsY7sdY": {}, "L7kw7ULp": {}, "ApzEi71n": {}}, "requestId": "VLZckRza", "statCode": "3gBxyM0a", "updateStrategy": "OVERRIDE", "value": 0.5174339411581167}]' \
    > test.out 2>&1
eval_tap $? 98 'BulkUpdateUserStatItem2' test.out

#- 99 UpdateUserStatItemValue1
./ng net.accelbyte.sdk.cli.Main social updateUserStatItemValue1 \
    --namespace "$AB_NAMESPACE" \
    --statCode 'qs5HV8rn' \
    --userId '4PeeCN9L' \
    --additionalKey 'G8gA7IQu' \
    --body '{"additionalData": {"OFs3b672": {}, "rKg1nrHa": {}, "AWuMJxsz": {}}, "updateStrategy": "INCREMENT", "value": 0.7963069852163728}' \
    > test.out 2>&1
eval_tap $? 99 'UpdateUserStatItemValue1' test.out


rm -f "tmp.dat"

exit $EXIT_CODE