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
    --userId 'WLrobUny' \
    > test.out 2>&1
eval_tap $? 8 'GetUserProfiles' test.out

#- 9 GetProfile
./ng net.accelbyte.sdk.cli.Main social getProfile \
    --namespace "$AB_NAMESPACE" \
    --profileId '8s2kzhP1' \
    --userId '01FMJ8U3' \
    > test.out 2>&1
eval_tap $? 9 'GetProfile' test.out

#- 10 GetUserNamespaceSlots
eval_tap 0 10 'GetUserNamespaceSlots # SKIP deprecated' test.out

#- 11 GetSlotData
eval_tap 0 11 'GetSlotData # SKIP deprecated' test.out

#- 12 PublicGetUserGameProfiles
./ng net.accelbyte.sdk.cli.Main social publicGetUserGameProfiles \
    --namespace "$AB_NAMESPACE" \
    --userIds 'O5N8PbIa,Z84wqaYH,RypzWbDX' \
    > test.out 2>&1
eval_tap $? 12 'PublicGetUserGameProfiles' test.out

#- 13 PublicGetUserProfiles
./ng net.accelbyte.sdk.cli.Main social publicGetUserProfiles \
    --namespace "$AB_NAMESPACE" \
    --userId 'x5szFybT' \
    > test.out 2>&1
eval_tap $? 13 'PublicGetUserProfiles' test.out

#- 14 PublicCreateProfile
./ng net.accelbyte.sdk.cli.Main social publicCreateProfile \
    --namespace "$AB_NAMESPACE" \
    --userId 'Lzf6ewnw' \
    --body '{"achievements": ["ioyDWYVB", "anZ8LhE1", "nUR0PPTa"], "attributes": {"kW4sZmbC": "OrkDFPpQ", "QU5KqE3G": "K59RY71w", "Y8EaDRpy": "jpW0XBBY"}, "avatarUrl": "QXtlCWQv", "inventories": ["bKk8pHDO", "L2m944N1", "m8Y4iL1P"], "label": "oOzAd1oC", "profileName": "jMhvU5Hq", "statistics": ["N2EBX3P5", "Gl2FOfD7", "kKNxPTrD"], "tags": ["G3kmHcF2", "G7cGQG0q", "H1QmJCjS"]}' \
    > test.out 2>&1
eval_tap $? 14 'PublicCreateProfile' test.out

#- 15 PublicGetProfile
./ng net.accelbyte.sdk.cli.Main social publicGetProfile \
    --namespace "$AB_NAMESPACE" \
    --profileId 'K52Jgv1X' \
    --userId 'LcB4CT2U' \
    > test.out 2>&1
eval_tap $? 15 'PublicGetProfile' test.out

#- 16 PublicUpdateProfile
./ng net.accelbyte.sdk.cli.Main social publicUpdateProfile \
    --namespace "$AB_NAMESPACE" \
    --profileId '530UfFHq' \
    --userId 'VnimwSsJ' \
    --body '{"achievements": ["sVkjSGzl", "KaaAjNr7", "ZeX6OrkS"], "attributes": {"cpr7YMvN": "2wpoQsf2", "gN7yIvwX": "2U2QonD1", "tbnjCgdZ": "11kSBCjn"}, "avatarUrl": "w5j4AaS4", "inventories": ["ixyGbPY7", "YUE88PNV", "lulnij9u"], "label": "H3VJdVCM", "profileName": "7jXqM9bo", "statistics": ["8yHDSQcw", "VqtM4by3", "GxAEmn3J"], "tags": ["q58QF65s", "t6bHcTSL", "9Q0pMKNW"]}' \
    > test.out 2>&1
eval_tap $? 16 'PublicUpdateProfile' test.out

#- 17 PublicDeleteProfile
./ng net.accelbyte.sdk.cli.Main social publicDeleteProfile \
    --namespace "$AB_NAMESPACE" \
    --profileId 'VqYzN0ej' \
    --userId 'yCWPFDNr' \
    > test.out 2>&1
eval_tap $? 17 'PublicDeleteProfile' test.out

#- 18 PublicGetProfileAttribute
./ng net.accelbyte.sdk.cli.Main social publicGetProfileAttribute \
    --attributeName 'agdELWr5' \
    --namespace "$AB_NAMESPACE" \
    --profileId 'U0ZOkcX9' \
    --userId 'HiPSajkW' \
    > test.out 2>&1
eval_tap $? 18 'PublicGetProfileAttribute' test.out

#- 19 PublicUpdateAttribute
./ng net.accelbyte.sdk.cli.Main social publicUpdateAttribute \
    --attributeName '2d4bLERk' \
    --namespace "$AB_NAMESPACE" \
    --profileId 'XtXHEdei' \
    --userId 'P9PLvRHg' \
    --body '{"name": "7IEj58mq", "value": "tynya8pH"}' \
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
    --limit '80' \
    --offset '41' \
    --statCodes 'p0U7XQOc' \
    > test.out 2>&1
eval_tap $? 26 'GetGlobalStatItems' test.out

#- 27 GetGlobalStatItemByStatCode
./ng net.accelbyte.sdk.cli.Main social getGlobalStatItemByStatCode \
    --namespace "$AB_NAMESPACE" \
    --statCode 'JjauejIy' \
    > test.out 2>&1
eval_tap $? 27 'GetGlobalStatItemByStatCode' test.out

#- 28 GetStatCycles
./ng net.accelbyte.sdk.cli.Main social getStatCycles \
    --namespace "$AB_NAMESPACE" \
    --cycleType 'DAILY' \
    --limit '30' \
    --name 'UCOdZDVt' \
    --offset '54' \
    --sortBy 'ZRJJbpnA' \
    --status 'STOPPED' \
    > test.out 2>&1
eval_tap $? 28 'GetStatCycles' test.out

#- 29 CreateStatCycle
./ng net.accelbyte.sdk.cli.Main social createStatCycle \
    --namespace "$AB_NAMESPACE" \
    --body '{"cycleType": "MONTHLY", "description": "XrPfVUxu", "end": "1986-12-20T00:00:00Z", "name": "sK3k1o8e", "resetDate": 9, "resetDay": 20, "resetMonth": 94, "resetTime": "hrStx9eL", "seasonPeriod": 37, "start": "1994-12-26T00:00:00Z"}' \
    > test.out 2>&1
eval_tap $? 29 'CreateStatCycle' test.out

#- 30 BulkGetStatCycle
./ng net.accelbyte.sdk.cli.Main social bulkGetStatCycle \
    --namespace "$AB_NAMESPACE" \
    --body '{"cycleIds": ["8xG4eP3W", "pzJac7OG", "Iue8arWz"]}' \
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
    --cycleId 'QUEeDv5v' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 33 'GetStatCycle' test.out

#- 34 UpdateStatCycle
./ng net.accelbyte.sdk.cli.Main social updateStatCycle \
    --cycleId 'cm2NeBiI' \
    --namespace "$AB_NAMESPACE" \
    --body '{"cycleType": "MONTHLY", "description": "Krdr3wH8", "end": "1984-06-01T00:00:00Z", "name": "0oXyPT9q", "resetDate": 12, "resetDay": 91, "resetMonth": 4, "resetTime": "N0urhFZH", "seasonPeriod": 32, "start": "1981-12-28T00:00:00Z"}' \
    > test.out 2>&1
eval_tap $? 34 'UpdateStatCycle' test.out

#- 35 DeleteStatCycle
./ng net.accelbyte.sdk.cli.Main social deleteStatCycle \
    --cycleId 's7LOTZab' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 35 'DeleteStatCycle' test.out

#- 36 BulkAddStats
./ng net.accelbyte.sdk.cli.Main social bulkAddStats \
    --cycleId 'IwOqEduf' \
    --namespace "$AB_NAMESPACE" \
    --body '{"statCodes": ["cwyARx1n", "GuFrFlMv", "LJiFKxvt"]}' \
    > test.out 2>&1
eval_tap $? 36 'BulkAddStats' test.out

#- 37 StopStatCycle
./ng net.accelbyte.sdk.cli.Main social stopStatCycle \
    --cycleId 'ThFBDqNY' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 37 'StopStatCycle' test.out

#- 38 BulkFetchStatItems
./ng net.accelbyte.sdk.cli.Main social bulkFetchStatItems \
    --namespace "$AB_NAMESPACE" \
    --statCode 'qfQwepIt' \
    --userIds 'BfmA52c8' \
    > test.out 2>&1
eval_tap $? 38 'BulkFetchStatItems' test.out

#- 39 BulkIncUserStatItem
./ng net.accelbyte.sdk.cli.Main social bulkIncUserStatItem \
    --namespace "$AB_NAMESPACE" \
    --body '[{"inc": 0.8826138106607307, "statCode": "MxNToKIQ", "userId": "CoJNUbNi"}, {"inc": 0.2085129389100776, "statCode": "LzJ7f6Pd", "userId": "xWa0envO"}, {"inc": 0.9507947451698475, "statCode": "N09Cznfl", "userId": "gloniRjM"}]' \
    > test.out 2>&1
eval_tap $? 39 'BulkIncUserStatItem' test.out

#- 40 BulkIncUserStatItemValue
./ng net.accelbyte.sdk.cli.Main social bulkIncUserStatItemValue \
    --namespace "$AB_NAMESPACE" \
    --body '[{"inc": 0.36742730992244776, "statCode": "L4SPY0V8", "userId": "ZbjqxpV7"}, {"inc": 0.6527116429155908, "statCode": "E3gJVHbG", "userId": "csaKL0Kl"}, {"inc": 0.8121277644930109, "statCode": "QD638A8T", "userId": "KpZWeSSW"}]' \
    > test.out 2>&1
eval_tap $? 40 'BulkIncUserStatItemValue' test.out

#- 41 BulkFetchOrDefaultStatItems
./ng net.accelbyte.sdk.cli.Main social bulkFetchOrDefaultStatItems \
    --namespace "$AB_NAMESPACE" \
    --statCode 'KMeWebuo' \
    --userIds 'Ep7TwGuP,HRrhq8aa,e7uJnqvk' \
    > test.out 2>&1
eval_tap $? 41 'BulkFetchOrDefaultStatItems' test.out

#- 42 BulkResetUserStatItem
./ng net.accelbyte.sdk.cli.Main social bulkResetUserStatItem \
    --namespace "$AB_NAMESPACE" \
    --body '[{"statCode": "1HAQmFRK", "userId": "s3WjCyJZ"}, {"statCode": "mBtZf2X0", "userId": "e6ypTU9K"}, {"statCode": "SEcbAJox", "userId": "Xtx7A6Ab"}]' \
    > test.out 2>&1
eval_tap $? 42 'BulkResetUserStatItem' test.out

#- 43 GetStats
./ng net.accelbyte.sdk.cli.Main social getStats \
    --namespace "$AB_NAMESPACE" \
    --cycleIds 'LE1vn3SM' \
    --isGlobal  \
    --isPublic  \
    --limit '65' \
    --offset '17' \
    > test.out 2>&1
eval_tap $? 43 'GetStats' test.out

#- 44 CreateStat
./ng net.accelbyte.sdk.cli.Main social createStat \
    --namespace "$AB_NAMESPACE" \
    --body '{"cycleIds": ["1v7LF6oW", "SEceArbg", "EjgLbuL1"], "defaultValue": 0.7714442243107474, "description": "nsDXDGt4", "globalAggregationMethod": "LAST", "ignoreAdditionalDataOnValueRejected": true, "incrementOnly": false, "isPublic": true, "maximum": 0.6688441351035743, "minimum": 0.9370351037896685, "name": "ZFFt1le4", "setAsGlobal": true, "setBy": "SERVER", "statCode": "rNv7fG6d", "tags": ["o5M7CX5d", "wetpz2gl", "tcfFd6Js"]}' \
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
    --limit '73' \
    --offset '23' \
    --keyword 'RgE1u5b0' \
    > test.out 2>&1
eval_tap $? 47 'QueryStats' test.out

#- 48 GetStat
./ng net.accelbyte.sdk.cli.Main social getStat \
    --namespace "$AB_NAMESPACE" \
    --statCode 'ucLv2CEk' \
    > test.out 2>&1
eval_tap $? 48 'GetStat' test.out

#- 49 DeleteStat
./ng net.accelbyte.sdk.cli.Main social deleteStat \
    --namespace "$AB_NAMESPACE" \
    --statCode 'qp74Hrj1' \
    > test.out 2>&1
eval_tap $? 49 'DeleteStat' test.out

#- 50 UpdateStat
./ng net.accelbyte.sdk.cli.Main social updateStat \
    --namespace "$AB_NAMESPACE" \
    --statCode 'oQDd1Roj' \
    --body '{"cycleIds": ["I09gBnvt", "jPpYrgqc", "GDY6WDr5"], "defaultValue": 0.9101493018226512, "description": "u9rvkRDU", "globalAggregationMethod": "MAX", "ignoreAdditionalDataOnValueRejected": false, "isPublic": false, "name": "KTSmmHsQ", "tags": ["MqpGYSHe", "Bg14NIOt", "r0BEL2Zg"]}' \
    > test.out 2>&1
eval_tap $? 50 'UpdateStat' test.out

#- 51 GetStatItems
./ng net.accelbyte.sdk.cli.Main social getStatItems \
    --namespace "$AB_NAMESPACE" \
    --statCode 'ZLbxEaEf' \
    --limit '88' \
    --offset '42' \
    --sortBy 'VebC1V17' \
    > test.out 2>&1
eval_tap $? 51 'GetStatItems' test.out

#- 52 DeleteTiedStat
./ng net.accelbyte.sdk.cli.Main social deleteTiedStat \
    --namespace "$AB_NAMESPACE" \
    --statCode 'jekTSSe4' \
    > test.out 2>&1
eval_tap $? 52 'DeleteTiedStat' test.out

#- 53 GetUserStatCycleItems
./ng net.accelbyte.sdk.cli.Main social getUserStatCycleItems \
    --cycleId 'Bq2svqHN' \
    --namespace "$AB_NAMESPACE" \
    --userId 'wfHN06Q1' \
    --isPublic  \
    --limit '95' \
    --offset '83' \
    --sortBy 'r8fPulxD' \
    --statCodes 'EeCU3Gdo' \
    > test.out 2>&1
eval_tap $? 53 'GetUserStatCycleItems' test.out

#- 54 GetUserStatItems
./ng net.accelbyte.sdk.cli.Main social getUserStatItems \
    --namespace "$AB_NAMESPACE" \
    --userId '3EapfR53' \
    --isPublic  \
    --limit '52' \
    --offset '63' \
    --sortBy 'NjtR3XDC' \
    --statCodes 'm7F7VAli' \
    --tags 'ZqZFjix8' \
    > test.out 2>&1
eval_tap $? 54 'GetUserStatItems' test.out

#- 55 BulkCreateUserStatItems
./ng net.accelbyte.sdk.cli.Main social bulkCreateUserStatItems \
    --namespace "$AB_NAMESPACE" \
    --userId 'Eg4ug46X' \
    --body '[{"statCode": "srsGlP1K"}, {"statCode": "8l8zUdZS"}, {"statCode": "qHNXxJPd"}]' \
    > test.out 2>&1
eval_tap $? 55 'BulkCreateUserStatItems' test.out

#- 56 BulkIncUserStatItem1
./ng net.accelbyte.sdk.cli.Main social bulkIncUserStatItem1 \
    --namespace "$AB_NAMESPACE" \
    --userId '6SutAquR' \
    --body '[{"inc": 0.07029040076180892, "statCode": "kMgPJ9Xj"}, {"inc": 0.3180286549036728, "statCode": "eFZZdltu"}, {"inc": 0.253726667195607, "statCode": "qSKjP6RJ"}]' \
    > test.out 2>&1
eval_tap $? 56 'BulkIncUserStatItem1' test.out

#- 57 BulkIncUserStatItemValue1
./ng net.accelbyte.sdk.cli.Main social bulkIncUserStatItemValue1 \
    --namespace "$AB_NAMESPACE" \
    --userId 'c6zf7NP5' \
    --body '[{"inc": 0.4148392470563582, "statCode": "jdDAaSUo"}, {"inc": 0.5710819057639265, "statCode": "tAZhxWjx"}, {"inc": 0.2690222391876409, "statCode": "un4RINMV"}]' \
    > test.out 2>&1
eval_tap $? 57 'BulkIncUserStatItemValue1' test.out

#- 58 BulkResetUserStatItem1
./ng net.accelbyte.sdk.cli.Main social bulkResetUserStatItem1 \
    --namespace "$AB_NAMESPACE" \
    --userId '5MYJVcnT' \
    --body '[{"statCode": "rW47Yopb"}, {"statCode": "p1O3Spzx"}, {"statCode": "xzisOwtK"}]' \
    > test.out 2>&1
eval_tap $? 58 'BulkResetUserStatItem1' test.out

#- 59 CreateUserStatItem
./ng net.accelbyte.sdk.cli.Main social createUserStatItem \
    --namespace "$AB_NAMESPACE" \
    --statCode 'ESy0bp1Y' \
    --userId 'swjlvtzq' \
    > test.out 2>&1
eval_tap $? 59 'CreateUserStatItem' test.out

#- 60 DeleteUserStatItems
./ng net.accelbyte.sdk.cli.Main social deleteUserStatItems \
    --namespace "$AB_NAMESPACE" \
    --statCode 'AL0GuiPh' \
    --userId 'NmFDt60f' \
    > test.out 2>&1
eval_tap $? 60 'DeleteUserStatItems' test.out

#- 61 IncUserStatItemValue
./ng net.accelbyte.sdk.cli.Main social incUserStatItemValue \
    --namespace "$AB_NAMESPACE" \
    --statCode 'p4o5rSIR' \
    --userId '0aZxSy0M' \
    --body '{"inc": 0.6968381877198849}' \
    > test.out 2>&1
eval_tap $? 61 'IncUserStatItemValue' test.out

#- 62 ResetUserStatItemValue
./ng net.accelbyte.sdk.cli.Main social resetUserStatItemValue \
    --namespace "$AB_NAMESPACE" \
    --statCode 'ZuKDDHsK' \
    --userId 'bG4Sy1FL' \
    --additionalKey 'I5eQ4Y6j' \
    --body '{"additionalData": {"7pw03Not": {}, "1wXOsrCX": {}, "61RZJLLZ": {}}}' \
    > test.out 2>&1
eval_tap $? 62 'ResetUserStatItemValue' test.out

#- 63 GetGlobalStatItems1
./ng net.accelbyte.sdk.cli.Main social getGlobalStatItems1 \
    --namespace "$AB_NAMESPACE" \
    --limit '4' \
    --offset '82' \
    --statCodes 'pwCFXdAA' \
    > test.out 2>&1
eval_tap $? 63 'GetGlobalStatItems1' test.out

#- 64 GetGlobalStatItemByStatCode1
./ng net.accelbyte.sdk.cli.Main social getGlobalStatItemByStatCode1 \
    --namespace "$AB_NAMESPACE" \
    --statCode 'UceqmZiP' \
    > test.out 2>&1
eval_tap $? 64 'GetGlobalStatItemByStatCode1' test.out

#- 65 GetStatCycles1
./ng net.accelbyte.sdk.cli.Main social getStatCycles1 \
    --namespace "$AB_NAMESPACE" \
    --cycleType 'DAILY' \
    --limit '63' \
    --name 'fqeRNsAV' \
    --offset '67' \
    --sortBy 'BNIQ9sKS' \
    --status 'STOPPED' \
    > test.out 2>&1
eval_tap $? 65 'GetStatCycles1' test.out

#- 66 BulkGetStatCycle1
./ng net.accelbyte.sdk.cli.Main social bulkGetStatCycle1 \
    --namespace "$AB_NAMESPACE" \
    --body '{"cycleIds": ["mU0gGHoE", "B9FMqIfZ", "LAwkzZBl"]}' \
    > test.out 2>&1
eval_tap $? 66 'BulkGetStatCycle1' test.out

#- 67 GetStatCycle1
./ng net.accelbyte.sdk.cli.Main social getStatCycle1 \
    --cycleId 'DZZ5Mu8Z' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 67 'GetStatCycle1' test.out

#- 68 BulkFetchStatItems1
./ng net.accelbyte.sdk.cli.Main social bulkFetchStatItems1 \
    --namespace "$AB_NAMESPACE" \
    --statCode 'WKAFaAgo' \
    --userIds '4NMkaog5' \
    > test.out 2>&1
eval_tap $? 68 'BulkFetchStatItems1' test.out

#- 69 PublicBulkIncUserStatItem
./ng net.accelbyte.sdk.cli.Main social publicBulkIncUserStatItem \
    --namespace "$AB_NAMESPACE" \
    --body '[{"inc": 0.1740343719794284, "statCode": "1m47ewM2", "userId": "q8SRzUpD"}, {"inc": 0.2922124225378713, "statCode": "QSfx5bA9", "userId": "kOqjwV2L"}, {"inc": 0.7363371869873048, "statCode": "ElfEtGkR", "userId": "6n6u0nC2"}]' \
    > test.out 2>&1
eval_tap $? 69 'PublicBulkIncUserStatItem' test.out

#- 70 PublicBulkIncUserStatItemValue
./ng net.accelbyte.sdk.cli.Main social publicBulkIncUserStatItemValue \
    --namespace "$AB_NAMESPACE" \
    --body '[{"inc": 0.2920479735089925, "statCode": "oNquQq1A", "userId": "f50FZrGq"}, {"inc": 0.21997095231216757, "statCode": "23JonzzV", "userId": "hu2sT4eJ"}, {"inc": 0.05771622640384122, "statCode": "RUYVqqRz", "userId": "ec5ikAQ9"}]' \
    > test.out 2>&1
eval_tap $? 70 'PublicBulkIncUserStatItemValue' test.out

#- 71 BulkResetUserStatItem2
./ng net.accelbyte.sdk.cli.Main social bulkResetUserStatItem2 \
    --namespace "$AB_NAMESPACE" \
    --body '[{"statCode": "6czge0so", "userId": "iJM80iwS"}, {"statCode": "gPbxT7Ok", "userId": "YqKZ9Dso"}, {"statCode": "v4KO6VM8", "userId": "2YRNJEKG"}]' \
    > test.out 2>&1
eval_tap $? 71 'BulkResetUserStatItem2' test.out

#- 72 CreateStat1
./ng net.accelbyte.sdk.cli.Main social createStat1 \
    --namespace "$AB_NAMESPACE" \
    --body '{"cycleIds": ["cDSfRiL0", "aS829sTS", "r5XyOERT"], "defaultValue": 0.886071048619437, "description": "75ZrfKG8", "globalAggregationMethod": "MIN", "ignoreAdditionalDataOnValueRejected": false, "incrementOnly": true, "isPublic": true, "maximum": 0.3753791869770654, "minimum": 0.8403889054418975, "name": "8VT8Bjid", "setAsGlobal": true, "setBy": "CLIENT", "statCode": "ayTiq565", "tags": ["AY5EDUxo", "NqJM8fxb", "QTkHIzKZ"]}' \
    > test.out 2>&1
eval_tap $? 72 'CreateStat1' test.out

#- 73 PublicListMyStatCycleItems
./ng net.accelbyte.sdk.cli.Main social publicListMyStatCycleItems \
    --cycleId 'jNCIveAq' \
    --namespace "$AB_NAMESPACE" \
    --limit '89' \
    --offset '66' \
    --sortBy 'UFpnXXNN' \
    --statCodes '42Jg9jGk,IZFecviP,sFI5yEmt' \
    > test.out 2>&1
eval_tap $? 73 'PublicListMyStatCycleItems' test.out

#- 74 PublicListMyStatItems
./ng net.accelbyte.sdk.cli.Main social publicListMyStatItems \
    --namespace "$AB_NAMESPACE" \
    --limit '9' \
    --offset '70' \
    --sortBy 'y2OoPIrp' \
    --statCodes 'K0zGO13N,6R7etthy,7U6I9QUT' \
    --tags 'EB1AEBa8,6dVquCSz,fxbtnnn2' \
    > test.out 2>&1
eval_tap $? 74 'PublicListMyStatItems' test.out

#- 75 PublicListAllMyStatItems
./ng net.accelbyte.sdk.cli.Main social publicListAllMyStatItems \
    --namespace "$AB_NAMESPACE" \
    --additionalKey 'T1XGdnnZ' \
    --statCodes 'qp7HFFxL,hVtkFZS6,31xPeiU4' \
    --tags 'QnAKalBE,ehcKuKHM,wpO7d8ye' \
    > test.out 2>&1
eval_tap $? 75 'PublicListAllMyStatItems' test.out

#- 76 GetUserStatCycleItems1
./ng net.accelbyte.sdk.cli.Main social getUserStatCycleItems1 \
    --cycleId 'smLyavqY' \
    --namespace "$AB_NAMESPACE" \
    --userId 'owAv59hb' \
    --limit '7' \
    --offset '63' \
    --sortBy 'RzYGxBMw' \
    --statCodes 'n9Z5NDZ0' \
    > test.out 2>&1
eval_tap $? 76 'GetUserStatCycleItems1' test.out

#- 77 PublicQueryUserStatItems
./ng net.accelbyte.sdk.cli.Main social publicQueryUserStatItems \
    --namespace "$AB_NAMESPACE" \
    --userId 'qEu83u0Q' \
    --limit '48' \
    --offset '10' \
    --sortBy '2WKVVXzO' \
    --statCodes '4yjWC4VC' \
    --tags 'NquH5Uol' \
    > test.out 2>&1
eval_tap $? 77 'PublicQueryUserStatItems' test.out

#- 78 PublicBulkCreateUserStatItems
./ng net.accelbyte.sdk.cli.Main social publicBulkCreateUserStatItems \
    --namespace "$AB_NAMESPACE" \
    --userId '5oK35nGT' \
    --body '[{"statCode": "kjnseLit"}, {"statCode": "QGt5rkkX"}, {"statCode": "gBYPSGrE"}]' \
    > test.out 2>&1
eval_tap $? 78 'PublicBulkCreateUserStatItems' test.out

#- 79 PublicQueryUserStatItems1
./ng net.accelbyte.sdk.cli.Main social publicQueryUserStatItems1 \
    --namespace "$AB_NAMESPACE" \
    --userId 'CbvcVpd0' \
    --additionalKey 'y2auMKj7' \
    --statCodes 's1f0futB,Q7LAFNkD,2mkfsFEq' \
    --tags 'tI1lpI2n,1zX6nUsl,jO301ZPe' \
    > test.out 2>&1
eval_tap $? 79 'PublicQueryUserStatItems1' test.out

#- 80 PublicBulkIncUserStatItem1
./ng net.accelbyte.sdk.cli.Main social publicBulkIncUserStatItem1 \
    --namespace "$AB_NAMESPACE" \
    --userId 'qI88ce6V' \
    --body '[{"inc": 0.05384958816754415, "statCode": "CHximX1U"}, {"inc": 0.43845084413211544, "statCode": "LvCwDtDU"}, {"inc": 0.8012845963981456, "statCode": "ZZQKJ0I8"}]' \
    > test.out 2>&1
eval_tap $? 80 'PublicBulkIncUserStatItem1' test.out

#- 81 BulkIncUserStatItemValue2
./ng net.accelbyte.sdk.cli.Main social bulkIncUserStatItemValue2 \
    --namespace "$AB_NAMESPACE" \
    --userId '1YvHwcMD' \
    --body '[{"inc": 0.2571029040919328, "statCode": "gkKd3zx3"}, {"inc": 0.5506291964703568, "statCode": "2AAMTNqQ"}, {"inc": 0.27600719913073246, "statCode": "SuMV6BkE"}]' \
    > test.out 2>&1
eval_tap $? 81 'BulkIncUserStatItemValue2' test.out

#- 82 BulkResetUserStatItem3
./ng net.accelbyte.sdk.cli.Main social bulkResetUserStatItem3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'CDdmNFMe' \
    --body '[{"statCode": "VNHbiyU2"}, {"statCode": "0UkHMUgN"}, {"statCode": "f06E6q0O"}]' \
    > test.out 2>&1
eval_tap $? 82 'BulkResetUserStatItem3' test.out

#- 83 PublicCreateUserStatItem
./ng net.accelbyte.sdk.cli.Main social publicCreateUserStatItem \
    --namespace "$AB_NAMESPACE" \
    --statCode 'AS24U366' \
    --userId '566PaiIF' \
    > test.out 2>&1
eval_tap $? 83 'PublicCreateUserStatItem' test.out

#- 84 DeleteUserStatItems1
./ng net.accelbyte.sdk.cli.Main social deleteUserStatItems1 \
    --namespace "$AB_NAMESPACE" \
    --statCode 'R5WvpfNU' \
    --userId 'LuMYF2ee' \
    > test.out 2>&1
eval_tap $? 84 'DeleteUserStatItems1' test.out

#- 85 PublicIncUserStatItem
./ng net.accelbyte.sdk.cli.Main social publicIncUserStatItem \
    --namespace "$AB_NAMESPACE" \
    --statCode '5uKjMTyQ' \
    --userId 'PEiO3ver' \
    --body '{"inc": 0.4690688425932612}' \
    > test.out 2>&1
eval_tap $? 85 'PublicIncUserStatItem' test.out

#- 86 PublicIncUserStatItemValue
./ng net.accelbyte.sdk.cli.Main social publicIncUserStatItemValue \
    --namespace "$AB_NAMESPACE" \
    --statCode 'dxV9q4cO' \
    --userId 'gPDQTcC8' \
    --body '{"inc": 0.14753874824949453}' \
    > test.out 2>&1
eval_tap $? 86 'PublicIncUserStatItemValue' test.out

#- 87 ResetUserStatItemValue1
./ng net.accelbyte.sdk.cli.Main social resetUserStatItemValue1 \
    --namespace "$AB_NAMESPACE" \
    --statCode 'mcFKcy6P' \
    --userId 'NVhKQBu2' \
    > test.out 2>&1
eval_tap $? 87 'ResetUserStatItemValue1' test.out

#- 88 BulkUpdateUserStatItemV2
./ng net.accelbyte.sdk.cli.Main social bulkUpdateUserStatItemV2 \
    --namespace "$AB_NAMESPACE" \
    --body '[{"additionalData": {"qq4T3woW": {}, "8rZPJ5kC": {}, "BUqPOL1G": {}}, "additionalKey": "LV57iP9Q", "statCode": "W6Pvzlka", "updateStrategy": "MAX", "userId": "fOK3hFll", "value": 0.30216561500988737}, {"additionalData": {"1mB6KZZz": {}, "crge8oB0": {}, "S6TJGH6A": {}}, "additionalKey": "gAklGffI", "statCode": "KEpbW1SQ", "updateStrategy": "MIN", "userId": "b0QVvWhH", "value": 0.5329683387913778}, {"additionalData": {"QynVRm84": {}, "2FuTPZgL": {}, "xJwAc2hl": {}}, "additionalKey": "2NOYBj09", "statCode": "DIiK67fb", "updateStrategy": "INCREMENT", "userId": "vDFEoegd", "value": 0.021250771440538885}]' \
    > test.out 2>&1
eval_tap $? 88 'BulkUpdateUserStatItemV2' test.out

#- 89 BulkFetchOrDefaultStatItems1
./ng net.accelbyte.sdk.cli.Main social bulkFetchOrDefaultStatItems1 \
    --namespace "$AB_NAMESPACE" \
    --additionalKey '0qoJhO0t' \
    --statCode 'QK8EX6t0' \
    --userIds 'tHtaG6bi,4CV5qQeo,AVwSxTKH' \
    > test.out 2>&1
eval_tap $? 89 'BulkFetchOrDefaultStatItems1' test.out

#- 90 AdminListUsersStatItems
./ng net.accelbyte.sdk.cli.Main social adminListUsersStatItems \
    --namespace "$AB_NAMESPACE" \
    --userId 'tviAKwE0' \
    --additionalKey 'n4B8cPDT' \
    --statCodes 'xHFCdaQt,OUATXwir,0iezp7QZ' \
    --tags 'ZnDjjjzu,FU8A0tor,2AWO25jR' \
    > test.out 2>&1
eval_tap $? 90 'AdminListUsersStatItems' test.out

#- 91 BulkUpdateUserStatItem
./ng net.accelbyte.sdk.cli.Main social bulkUpdateUserStatItem \
    --namespace "$AB_NAMESPACE" \
    --userId 'HaTEHQ94' \
    --additionalKey 'ElD3331f' \
    --body '[{"additionalData": {"T8U8mZhE": {}, "HhzZwWof": {}, "KolNpEWh": {}}, "statCode": "RQugJUXx", "updateStrategy": "MAX", "value": 0.20857136733609916}, {"additionalData": {"9SwkxvSj": {}, "VVbZ8xEj": {}, "uiYJo0iu": {}}, "statCode": "w8A6ZplT", "updateStrategy": "OVERRIDE", "value": 0.026443373492753275}, {"additionalData": {"tNpTZHQb": {}, "k4dEEoN8": {}, "q8a6qTRV": {}}, "statCode": "Ym0D8epo", "updateStrategy": "MIN", "value": 0.8416864435094776}]' \
    > test.out 2>&1
eval_tap $? 91 'BulkUpdateUserStatItem' test.out

#- 92 BulkResetUserStatItemValues
./ng net.accelbyte.sdk.cli.Main social bulkResetUserStatItemValues \
    --namespace "$AB_NAMESPACE" \
    --userId 'a9akhESs' \
    --additionalKey 'tIIraqKQ' \
    --body '[{"additionalData": {"Cge1xOlJ": {}, "fjaY7C8T": {}, "hWLDxTRz": {}}, "statCode": "2L4Yb5i7"}, {"additionalData": {"5jAdarTs": {}, "n3QH81HF": {}, "NnmDIzXq": {}}, "statCode": "EE2QvfWH"}, {"additionalData": {"Nv0G78yu": {}, "J25PGlEd": {}, "kBWT4grD": {}}, "statCode": "pOWue7Lv"}]' \
    > test.out 2>&1
eval_tap $? 92 'BulkResetUserStatItemValues' test.out

#- 93 DeleteUserStatItems2
./ng net.accelbyte.sdk.cli.Main social deleteUserStatItems2 \
    --namespace "$AB_NAMESPACE" \
    --statCode 'YReCIb9f' \
    --userId 'XryRKQCd' \
    --additionalKey 'OriLavpJ' \
    > test.out 2>&1
eval_tap $? 93 'DeleteUserStatItems2' test.out

#- 94 UpdateUserStatItemValue
./ng net.accelbyte.sdk.cli.Main social updateUserStatItemValue \
    --namespace "$AB_NAMESPACE" \
    --statCode 'YqtDRFch' \
    --userId 'NF4WizMr' \
    --additionalKey '3E8MdiqI' \
    --body '{"additionalData": {"JjtpNPNU": {}, "ifSXUneC": {}, "XERV102G": {}}, "updateStrategy": "INCREMENT", "value": 0.3696068317623804}' \
    > test.out 2>&1
eval_tap $? 94 'UpdateUserStatItemValue' test.out

#- 95 BulkUpdateUserStatItem1
./ng net.accelbyte.sdk.cli.Main social bulkUpdateUserStatItem1 \
    --namespace "$AB_NAMESPACE" \
    --body '[{"additionalData": {"38CZUB9X": {}, "4Dc2vKtK": {}, "Ra4PYXRm": {}}, "additionalKey": "ehkLjnZU", "statCode": "NkFviN8I", "updateStrategy": "INCREMENT", "userId": "15O4HBvZ", "value": 0.052237382456940984}, {"additionalData": {"mC9vVk9K": {}, "WfQE01mh": {}, "YnRmtQrq": {}}, "additionalKey": "hH3phHQC", "statCode": "rhbaWBte", "updateStrategy": "MIN", "userId": "x8av6CIH", "value": 0.973447441597991}, {"additionalData": {"H2VKuCnY": {}, "preYOMuj": {}, "Fw7YrIn1": {}}, "additionalKey": "ncWbxePr", "statCode": "iWRqK4Jx", "updateStrategy": "INCREMENT", "userId": "qFwSGX2w", "value": 0.8319990253405247}]' \
    > test.out 2>&1
eval_tap $? 95 'BulkUpdateUserStatItem1' test.out

#- 96 PublicQueryUserStatItems2
./ng net.accelbyte.sdk.cli.Main social publicQueryUserStatItems2 \
    --namespace "$AB_NAMESPACE" \
    --userId 'lzGqTUwE' \
    --additionalKey '35PmQ9dj' \
    --statCodes 'YqGzzDKS,5PfH4crr,X8WTEZhB' \
    --tags '3ZWEWNsE,dhyz6UJ6,WIQS1Nis' \
    > test.out 2>&1
eval_tap $? 96 'PublicQueryUserStatItems2' test.out

#- 97 BulkUpdateUserStatItem2
./ng net.accelbyte.sdk.cli.Main social bulkUpdateUserStatItem2 \
    --namespace "$AB_NAMESPACE" \
    --userId 'XPWrtyaP' \
    --additionalKey 'fUyF6Vn0' \
    --body '[{"additionalData": {"UgL51uqE": {}, "T2Xnnq5x": {}, "XcUZXzvW": {}}, "statCode": "XvfS5cOF", "updateStrategy": "OVERRIDE", "value": 0.10975222722766853}, {"additionalData": {"deyftPM4": {}, "ovHjMSnb": {}, "kHusd6xJ": {}}, "statCode": "RmFsZSdd", "updateStrategy": "MAX", "value": 0.022350890906531973}, {"additionalData": {"wir6NOYt": {}, "C6nkoFrr": {}, "zUqxpOz6": {}}, "statCode": "kbjb1sSg", "updateStrategy": "MAX", "value": 0.11302967904472683}]' \
    > test.out 2>&1
eval_tap $? 97 'BulkUpdateUserStatItem2' test.out

#- 98 UpdateUserStatItemValue1
./ng net.accelbyte.sdk.cli.Main social updateUserStatItemValue1 \
    --namespace "$AB_NAMESPACE" \
    --statCode 'tb9GB8rv' \
    --userId 'pLFMGxBA' \
    --additionalKey 'uAV495iq' \
    --body '{"additionalData": {"MIDaL9bL": {}, "nOZDVlaq": {}, "DbvE1g1y": {}}, "updateStrategy": "MAX", "value": 0.5860542551767426}' \
    > test.out 2>&1
eval_tap $? 98 'UpdateUserStatItemValue1' test.out


rm -f "tmp.dat"

exit $EXIT_CODE