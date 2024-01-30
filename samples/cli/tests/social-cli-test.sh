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
    --userId 'ReMsDH5F' \
    > test.out 2>&1
eval_tap $? 8 'GetUserProfiles' test.out

#- 9 GetProfile
./ng net.accelbyte.sdk.cli.Main social getProfile \
    --namespace "$AB_NAMESPACE" \
    --profileId '1yAloJiP' \
    --userId 'tWcm31I4' \
    > test.out 2>&1
eval_tap $? 9 'GetProfile' test.out

#- 10 GetUserNamespaceSlots
eval_tap 0 10 'GetUserNamespaceSlots # SKIP deprecated' test.out

#- 11 GetSlotData
eval_tap 0 11 'GetSlotData # SKIP deprecated' test.out

#- 12 PublicGetUserGameProfiles
./ng net.accelbyte.sdk.cli.Main social publicGetUserGameProfiles \
    --namespace "$AB_NAMESPACE" \
    --userIds '4Hc1emIB,kzqs6rbi,ExJei6PI' \
    > test.out 2>&1
eval_tap $? 12 'PublicGetUserGameProfiles' test.out

#- 13 PublicGetUserProfiles
./ng net.accelbyte.sdk.cli.Main social publicGetUserProfiles \
    --namespace "$AB_NAMESPACE" \
    --userId 'R1Iwiepi' \
    > test.out 2>&1
eval_tap $? 13 'PublicGetUserProfiles' test.out

#- 14 PublicCreateProfile
./ng net.accelbyte.sdk.cli.Main social publicCreateProfile \
    --namespace "$AB_NAMESPACE" \
    --userId '8CYd1kQy' \
    --body '{"achievements": ["Kkct3C2c", "hXLwmivD", "QX8qD9Qt"], "attributes": {"ouAt63H2": "le7Xh5cL", "QxpzNg0Y": "ouiekquW", "l2cdlQyq": "Q3K4akmx"}, "avatarUrl": "NnazVXWi", "inventories": ["nueqxqE6", "ooGbH4Ll", "RS0ljDLn"], "label": "62CwrPaV", "profileName": "LmBdUt7k", "statistics": ["L87tr04d", "FjUTAEG8", "ai5DqfL2"], "tags": ["V7lhBgRC", "CmhUxia5", "GAbMg4VR"]}' \
    > test.out 2>&1
eval_tap $? 14 'PublicCreateProfile' test.out

#- 15 PublicGetProfile
./ng net.accelbyte.sdk.cli.Main social publicGetProfile \
    --namespace "$AB_NAMESPACE" \
    --profileId 'PtOjjqJD' \
    --userId '06enA3ui' \
    > test.out 2>&1
eval_tap $? 15 'PublicGetProfile' test.out

#- 16 PublicUpdateProfile
./ng net.accelbyte.sdk.cli.Main social publicUpdateProfile \
    --namespace "$AB_NAMESPACE" \
    --profileId 'Dvs9o7ee' \
    --userId '3KwXZ4i9' \
    --body '{"achievements": ["x1ej8tjz", "EUmTnFsc", "wdffFHG2"], "attributes": {"ntoAtJTm": "WTZRuIu4", "Nil41COQ": "LmQI7PGQ", "ID5BX4It": "ZZoly1HX"}, "avatarUrl": "WPlVgvkB", "inventories": ["mdgZV0pk", "ATSoNg4Y", "2YmOKGF3"], "label": "p8DFtjwg", "profileName": "bdknTWTw", "statistics": ["vP78S2H9", "hSW0tizQ", "bwF4Q85x"], "tags": ["DpExvken", "SPvRhJlw", "W21A6mhv"]}' \
    > test.out 2>&1
eval_tap $? 16 'PublicUpdateProfile' test.out

#- 17 PublicDeleteProfile
./ng net.accelbyte.sdk.cli.Main social publicDeleteProfile \
    --namespace "$AB_NAMESPACE" \
    --profileId 'F3L2fWI5' \
    --userId 'PctL6KtR' \
    > test.out 2>&1
eval_tap $? 17 'PublicDeleteProfile' test.out

#- 18 PublicGetProfileAttribute
./ng net.accelbyte.sdk.cli.Main social publicGetProfileAttribute \
    --attributeName 'sVdJiVHD' \
    --namespace "$AB_NAMESPACE" \
    --profileId 'dSu5JTCh' \
    --userId 'tNF3SiEy' \
    > test.out 2>&1
eval_tap $? 18 'PublicGetProfileAttribute' test.out

#- 19 PublicUpdateAttribute
./ng net.accelbyte.sdk.cli.Main social publicUpdateAttribute \
    --attributeName '0OExtjya' \
    --namespace "$AB_NAMESPACE" \
    --profileId 'LqxmojMi' \
    --userId 'buEDRkbE' \
    --body '{"name": "0XgWevMo", "value": "tN3Tm1er"}' \
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
    --offset '15' \
    --statCodes 'fx4SsoWF' \
    > test.out 2>&1
eval_tap $? 26 'GetGlobalStatItems' test.out

#- 27 GetGlobalStatItemByStatCode
./ng net.accelbyte.sdk.cli.Main social getGlobalStatItemByStatCode \
    --namespace "$AB_NAMESPACE" \
    --statCode 'XLXQivcf' \
    > test.out 2>&1
eval_tap $? 27 'GetGlobalStatItemByStatCode' test.out

#- 28 GetStatCycles
./ng net.accelbyte.sdk.cli.Main social getStatCycles \
    --namespace "$AB_NAMESPACE" \
    --cycleType 'ANNUALLY' \
    --limit '17' \
    --name 'khTh2zkX' \
    --offset '8' \
    --sortBy 'YfOrNdC4' \
    --status 'ACTIVE' \
    > test.out 2>&1
eval_tap $? 28 'GetStatCycles' test.out

#- 29 CreateStatCycle
./ng net.accelbyte.sdk.cli.Main social createStatCycle \
    --namespace "$AB_NAMESPACE" \
    --body '{"cycleType": "MONTHLY", "description": "L83Z8Byq", "end": "1994-10-31T00:00:00Z", "name": "nHsBqtxV", "resetDate": 85, "resetDay": 28, "resetMonth": 36, "resetTime": "APXwiPqw", "seasonPeriod": 58, "start": "1973-12-04T00:00:00Z"}' \
    > test.out 2>&1
eval_tap $? 29 'CreateStatCycle' test.out

#- 30 BulkGetStatCycle
./ng net.accelbyte.sdk.cli.Main social bulkGetStatCycle \
    --namespace "$AB_NAMESPACE" \
    --body '{"cycleIds": ["zFsfDpk1", "IWgf4GjN", "GyonyYgV"]}' \
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
    --cycleId 'cHwLaMmZ' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 33 'GetStatCycle' test.out

#- 34 UpdateStatCycle
./ng net.accelbyte.sdk.cli.Main social updateStatCycle \
    --cycleId 'KBSFuUjn' \
    --namespace "$AB_NAMESPACE" \
    --body '{"cycleType": "DAILY", "description": "1aKcZnVL", "end": "1996-05-03T00:00:00Z", "name": "5KSebxLm", "resetDate": 51, "resetDay": 66, "resetMonth": 42, "resetTime": "zImlmzc0", "seasonPeriod": 97, "start": "1987-04-20T00:00:00Z"}' \
    > test.out 2>&1
eval_tap $? 34 'UpdateStatCycle' test.out

#- 35 DeleteStatCycle
./ng net.accelbyte.sdk.cli.Main social deleteStatCycle \
    --cycleId '7o8AzpNH' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 35 'DeleteStatCycle' test.out

#- 36 BulkAddStats
./ng net.accelbyte.sdk.cli.Main social bulkAddStats \
    --cycleId 'wjtqlpyT' \
    --namespace "$AB_NAMESPACE" \
    --body '{"statCodes": ["U2daOMf5", "bJC2xsEK", "SIRfk2nB"]}' \
    > test.out 2>&1
eval_tap $? 36 'BulkAddStats' test.out

#- 37 StopStatCycle
./ng net.accelbyte.sdk.cli.Main social stopStatCycle \
    --cycleId 'vc4uX18k' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 37 'StopStatCycle' test.out

#- 38 BulkFetchStatItems
./ng net.accelbyte.sdk.cli.Main social bulkFetchStatItems \
    --namespace "$AB_NAMESPACE" \
    --statCode 'U8pqXEyJ' \
    --userIds 'GvdSvQnd' \
    > test.out 2>&1
eval_tap $? 38 'BulkFetchStatItems' test.out

#- 39 BulkIncUserStatItem
./ng net.accelbyte.sdk.cli.Main social bulkIncUserStatItem \
    --namespace "$AB_NAMESPACE" \
    --body '[{"inc": 0.6992457167066919, "statCode": "FAgeBAk1", "userId": "TPL71AjU"}, {"inc": 0.7780351919841628, "statCode": "H8LnIPo5", "userId": "AClCgxyZ"}, {"inc": 0.7163598651923959, "statCode": "QJrEvPLB", "userId": "tVpWoqfD"}]' \
    > test.out 2>&1
eval_tap $? 39 'BulkIncUserStatItem' test.out

#- 40 BulkIncUserStatItemValue
./ng net.accelbyte.sdk.cli.Main social bulkIncUserStatItemValue \
    --namespace "$AB_NAMESPACE" \
    --body '[{"inc": 0.3173842935418989, "statCode": "urYPKU8o", "userId": "oHoxHUEP"}, {"inc": 0.28038822210532055, "statCode": "qXw4QjlL", "userId": "1fZjuqOo"}, {"inc": 0.4717874639434121, "statCode": "UzSoYNMu", "userId": "YR9V98or"}]' \
    > test.out 2>&1
eval_tap $? 40 'BulkIncUserStatItemValue' test.out

#- 41 BulkFetchOrDefaultStatItems
./ng net.accelbyte.sdk.cli.Main social bulkFetchOrDefaultStatItems \
    --namespace "$AB_NAMESPACE" \
    --statCode 'CGLfBSbA' \
    --userIds '0BBYoyAe,FbfL7ezk,47gkIz2C' \
    > test.out 2>&1
eval_tap $? 41 'BulkFetchOrDefaultStatItems' test.out

#- 42 BulkResetUserStatItem
./ng net.accelbyte.sdk.cli.Main social bulkResetUserStatItem \
    --namespace "$AB_NAMESPACE" \
    --body '[{"statCode": "9B7rV9SJ", "userId": "kNZw87Se"}, {"statCode": "oizODSTH", "userId": "Gr3SbHD9"}, {"statCode": "j6fin2QS", "userId": "086zIGZ5"}]' \
    > test.out 2>&1
eval_tap $? 42 'BulkResetUserStatItem' test.out

#- 43 GetStats
./ng net.accelbyte.sdk.cli.Main social getStats \
    --namespace "$AB_NAMESPACE" \
    --cycleIds '7aJQtzmX' \
    --isGlobal  \
    --isPublic  \
    --limit '67' \
    --offset '12' \
    > test.out 2>&1
eval_tap $? 43 'GetStats' test.out

#- 44 CreateStat
./ng net.accelbyte.sdk.cli.Main social createStat \
    --namespace "$AB_NAMESPACE" \
    --body '{"cycleIds": ["BgKftLu3", "psOlr2D1", "I7FgTLpU"], "defaultValue": 0.13512173706499442, "description": "q9K8q548", "ignoreAdditionalDataOnValueRejected": true, "incrementOnly": true, "isPublic": false, "maximum": 0.17017150694163508, "minimum": 0.785782117121824, "name": "h50sSUzl", "setAsGlobal": true, "setBy": "SERVER", "statCode": "32wGI68K", "tags": ["c6CxClNB", "Vp9YfwXl", "lipTTTtb"]}' \
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
    --limit '34' \
    --offset '35' \
    --keyword 'HH6Xwvw0' \
    > test.out 2>&1
eval_tap $? 47 'QueryStats' test.out

#- 48 GetStat
./ng net.accelbyte.sdk.cli.Main social getStat \
    --namespace "$AB_NAMESPACE" \
    --statCode 'WPCFY1NC' \
    > test.out 2>&1
eval_tap $? 48 'GetStat' test.out

#- 49 DeleteStat
./ng net.accelbyte.sdk.cli.Main social deleteStat \
    --namespace "$AB_NAMESPACE" \
    --statCode 'TkpYFP9I' \
    > test.out 2>&1
eval_tap $? 49 'DeleteStat' test.out

#- 50 UpdateStat
./ng net.accelbyte.sdk.cli.Main social updateStat \
    --namespace "$AB_NAMESPACE" \
    --statCode 'p5f66XoQ' \
    --body '{"cycleIds": ["k6VT2m7y", "GWVM6qTm", "Tp84HDxl"], "defaultValue": 0.22982324036000357, "description": "HkOYVhHs", "ignoreAdditionalDataOnValueRejected": true, "isPublic": false, "name": "dnITWGK5", "tags": ["Pn9pKPek", "UqaZyfkM", "9yEkUCIQ"]}' \
    > test.out 2>&1
eval_tap $? 50 'UpdateStat' test.out

#- 51 GetStatItems
./ng net.accelbyte.sdk.cli.Main social getStatItems \
    --namespace "$AB_NAMESPACE" \
    --statCode 'FkCCCT6R' \
    --limit '52' \
    --offset '4' \
    --sortBy 'E6bEGP26' \
    > test.out 2>&1
eval_tap $? 51 'GetStatItems' test.out

#- 52 DeleteTiedStat
./ng net.accelbyte.sdk.cli.Main social deleteTiedStat \
    --namespace "$AB_NAMESPACE" \
    --statCode '4Y5rv7Ye' \
    > test.out 2>&1
eval_tap $? 52 'DeleteTiedStat' test.out

#- 53 GetUserStatCycleItems
./ng net.accelbyte.sdk.cli.Main social getUserStatCycleItems \
    --cycleId '3ZUnoBUX' \
    --namespace "$AB_NAMESPACE" \
    --userId 'YilmK1cY' \
    --isPublic  \
    --limit '16' \
    --offset '52' \
    --sortBy '5665eH3N' \
    --statCodes '1cQLvvvg' \
    > test.out 2>&1
eval_tap $? 53 'GetUserStatCycleItems' test.out

#- 54 GetUserStatItems
./ng net.accelbyte.sdk.cli.Main social getUserStatItems \
    --namespace "$AB_NAMESPACE" \
    --userId 'Vas7rm2e' \
    --isPublic  \
    --limit '94' \
    --offset '39' \
    --sortBy 'D498g8wi' \
    --statCodes 'QBHn64sx' \
    --tags 'mF0Uj32u' \
    > test.out 2>&1
eval_tap $? 54 'GetUserStatItems' test.out

#- 55 BulkCreateUserStatItems
./ng net.accelbyte.sdk.cli.Main social bulkCreateUserStatItems \
    --namespace "$AB_NAMESPACE" \
    --userId '7WJOtyQt' \
    --body '[{"statCode": "jWK3gvJm"}, {"statCode": "vmxCEwpg"}, {"statCode": "ykyT1x2y"}]' \
    > test.out 2>&1
eval_tap $? 55 'BulkCreateUserStatItems' test.out

#- 56 BulkIncUserStatItem1
./ng net.accelbyte.sdk.cli.Main social bulkIncUserStatItem1 \
    --namespace "$AB_NAMESPACE" \
    --userId 'aHfejUTg' \
    --body '[{"inc": 0.8846378942917382, "statCode": "uCWBmdi5"}, {"inc": 0.030955112821630548, "statCode": "ccbahJAs"}, {"inc": 0.4605122100181118, "statCode": "zTqZhzpU"}]' \
    > test.out 2>&1
eval_tap $? 56 'BulkIncUserStatItem1' test.out

#- 57 BulkIncUserStatItemValue1
./ng net.accelbyte.sdk.cli.Main social bulkIncUserStatItemValue1 \
    --namespace "$AB_NAMESPACE" \
    --userId 'Y2HlSKrG' \
    --body '[{"inc": 0.029540298664523124, "statCode": "TtE03jO7"}, {"inc": 0.9000958432937294, "statCode": "nZCnr5Ph"}, {"inc": 0.608662373598131, "statCode": "2yhmxiWJ"}]' \
    > test.out 2>&1
eval_tap $? 57 'BulkIncUserStatItemValue1' test.out

#- 58 BulkResetUserStatItem1
./ng net.accelbyte.sdk.cli.Main social bulkResetUserStatItem1 \
    --namespace "$AB_NAMESPACE" \
    --userId 'OlkRLt4R' \
    --body '[{"statCode": "SBt99h5u"}, {"statCode": "gs0Bybgl"}, {"statCode": "WQO0qQ9T"}]' \
    > test.out 2>&1
eval_tap $? 58 'BulkResetUserStatItem1' test.out

#- 59 CreateUserStatItem
./ng net.accelbyte.sdk.cli.Main social createUserStatItem \
    --namespace "$AB_NAMESPACE" \
    --statCode 'ZMJLUnaF' \
    --userId 'di5VEBd4' \
    > test.out 2>&1
eval_tap $? 59 'CreateUserStatItem' test.out

#- 60 DeleteUserStatItems
./ng net.accelbyte.sdk.cli.Main social deleteUserStatItems \
    --namespace "$AB_NAMESPACE" \
    --statCode 'YLcLnEc1' \
    --userId 'aQpNbdy6' \
    > test.out 2>&1
eval_tap $? 60 'DeleteUserStatItems' test.out

#- 61 IncUserStatItemValue
./ng net.accelbyte.sdk.cli.Main social incUserStatItemValue \
    --namespace "$AB_NAMESPACE" \
    --statCode 'LExyr9QD' \
    --userId 'MKv99Wtv' \
    --body '{"inc": 0.9797460126367145}' \
    > test.out 2>&1
eval_tap $? 61 'IncUserStatItemValue' test.out

#- 62 ResetUserStatItemValue
./ng net.accelbyte.sdk.cli.Main social resetUserStatItemValue \
    --namespace "$AB_NAMESPACE" \
    --statCode 'dXlIOTOo' \
    --userId 'VyImAiGf' \
    --additionalKey 'bHvQkOnD' \
    --body '{"additionalData": {"gNXzgDLc": {}, "K43YxAiP": {}, "tJs5qYTh": {}}}' \
    > test.out 2>&1
eval_tap $? 62 'ResetUserStatItemValue' test.out

#- 63 GetGlobalStatItems1
./ng net.accelbyte.sdk.cli.Main social getGlobalStatItems1 \
    --namespace "$AB_NAMESPACE" \
    --limit '88' \
    --offset '70' \
    --statCodes 'q0I38uLA' \
    > test.out 2>&1
eval_tap $? 63 'GetGlobalStatItems1' test.out

#- 64 GetGlobalStatItemByStatCode1
./ng net.accelbyte.sdk.cli.Main social getGlobalStatItemByStatCode1 \
    --namespace "$AB_NAMESPACE" \
    --statCode 'sQaK4NtL' \
    > test.out 2>&1
eval_tap $? 64 'GetGlobalStatItemByStatCode1' test.out

#- 65 GetStatCycles1
./ng net.accelbyte.sdk.cli.Main social getStatCycles1 \
    --namespace "$AB_NAMESPACE" \
    --cycleType 'SEASONAL' \
    --limit '21' \
    --name 'hUh48Q7p' \
    --offset '59' \
    --sortBy '451kXPQ0' \
    --status 'ACTIVE' \
    > test.out 2>&1
eval_tap $? 65 'GetStatCycles1' test.out

#- 66 BulkGetStatCycle1
./ng net.accelbyte.sdk.cli.Main social bulkGetStatCycle1 \
    --namespace "$AB_NAMESPACE" \
    --body '{"cycleIds": ["AmPR928z", "2TnUvYhy", "MhvcfkVk"]}' \
    > test.out 2>&1
eval_tap $? 66 'BulkGetStatCycle1' test.out

#- 67 GetStatCycle1
./ng net.accelbyte.sdk.cli.Main social getStatCycle1 \
    --cycleId 'pdYLG6MY' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 67 'GetStatCycle1' test.out

#- 68 BulkFetchStatItems1
./ng net.accelbyte.sdk.cli.Main social bulkFetchStatItems1 \
    --namespace "$AB_NAMESPACE" \
    --statCode 'RVqjBHQI' \
    --userIds 'bfiBCOiw' \
    > test.out 2>&1
eval_tap $? 68 'BulkFetchStatItems1' test.out

#- 69 PublicBulkIncUserStatItem
./ng net.accelbyte.sdk.cli.Main social publicBulkIncUserStatItem \
    --namespace "$AB_NAMESPACE" \
    --body '[{"inc": 0.5689275694074023, "statCode": "2dF2ya4W", "userId": "HtK7Wd40"}, {"inc": 0.5866529822370695, "statCode": "xcipZARR", "userId": "mcgw0tNX"}, {"inc": 0.6877156928794921, "statCode": "6Rg9tD7I", "userId": "KuHqrwf3"}]' \
    > test.out 2>&1
eval_tap $? 69 'PublicBulkIncUserStatItem' test.out

#- 70 PublicBulkIncUserStatItemValue
./ng net.accelbyte.sdk.cli.Main social publicBulkIncUserStatItemValue \
    --namespace "$AB_NAMESPACE" \
    --body '[{"inc": 0.5029893985965558, "statCode": "bhjISjf6", "userId": "ab6ForHL"}, {"inc": 0.3871601876622519, "statCode": "LLYzysYo", "userId": "DzZfrYGk"}, {"inc": 0.8021285377073308, "statCode": "UGMMdPRT", "userId": "FUy3YNRV"}]' \
    > test.out 2>&1
eval_tap $? 70 'PublicBulkIncUserStatItemValue' test.out

#- 71 BulkResetUserStatItem2
./ng net.accelbyte.sdk.cli.Main social bulkResetUserStatItem2 \
    --namespace "$AB_NAMESPACE" \
    --body '[{"statCode": "f374HFBG", "userId": "k7yrS4lP"}, {"statCode": "g5SHoGVz", "userId": "oeBRr4pu"}, {"statCode": "4AazB6Pj", "userId": "YTURzV9u"}]' \
    > test.out 2>&1
eval_tap $? 71 'BulkResetUserStatItem2' test.out

#- 72 CreateStat1
./ng net.accelbyte.sdk.cli.Main social createStat1 \
    --namespace "$AB_NAMESPACE" \
    --body '{"cycleIds": ["BhGXhmZ6", "UNPiTvZT", "WKjB6ZTW"], "defaultValue": 0.17623547491986558, "description": "2KSGNA9K", "ignoreAdditionalDataOnValueRejected": true, "incrementOnly": false, "isPublic": false, "maximum": 0.24215769335992565, "minimum": 0.4744107903427769, "name": "MCqsnd5K", "setAsGlobal": true, "setBy": "SERVER", "statCode": "BscarlKU", "tags": ["1M0OGsJv", "Eqng3QRc", "xS9ioZUA"]}' \
    > test.out 2>&1
eval_tap $? 72 'CreateStat1' test.out

#- 73 PublicListMyStatCycleItems
./ng net.accelbyte.sdk.cli.Main social publicListMyStatCycleItems \
    --cycleId '5HmtWoxm' \
    --namespace "$AB_NAMESPACE" \
    --limit '10' \
    --offset '50' \
    --sortBy 'wtLlWWya' \
    --statCodes 'lNZpnIkR,T00onjMr,E5OWZsU1' \
    > test.out 2>&1
eval_tap $? 73 'PublicListMyStatCycleItems' test.out

#- 74 PublicListMyStatItems
./ng net.accelbyte.sdk.cli.Main social publicListMyStatItems \
    --namespace "$AB_NAMESPACE" \
    --limit '51' \
    --offset '78' \
    --sortBy 'moyzzhZr' \
    --statCodes 'lwnFS2z4,yKTYcucP,qShxHcxC' \
    --tags 'qlfBT6uh,ghtxj45e,wjya1H3b' \
    > test.out 2>&1
eval_tap $? 74 'PublicListMyStatItems' test.out

#- 75 PublicListAllMyStatItems
./ng net.accelbyte.sdk.cli.Main social publicListAllMyStatItems \
    --namespace "$AB_NAMESPACE" \
    --additionalKey 'hjrH0h8E' \
    --statCodes '8Jc1JfvA,I6TTDPgM,i99VpFr9' \
    --tags 'ReJKHIqz,bAHsaSgg,KkkKsTCJ' \
    > test.out 2>&1
eval_tap $? 75 'PublicListAllMyStatItems' test.out

#- 76 GetUserStatCycleItems1
./ng net.accelbyte.sdk.cli.Main social getUserStatCycleItems1 \
    --cycleId 'YkMt09IH' \
    --namespace "$AB_NAMESPACE" \
    --userId 'lifK9PrX' \
    --limit '52' \
    --offset '73' \
    --sortBy 'EWthYjmK' \
    --statCodes '2s6kvMGD' \
    > test.out 2>&1
eval_tap $? 76 'GetUserStatCycleItems1' test.out

#- 77 PublicQueryUserStatItems
./ng net.accelbyte.sdk.cli.Main social publicQueryUserStatItems \
    --namespace "$AB_NAMESPACE" \
    --userId '4BkDu26R' \
    --limit '69' \
    --offset '42' \
    --sortBy 'cIYEN5nD' \
    --statCodes 'tMWvf1Bj' \
    --tags 'TVXDq8xh' \
    > test.out 2>&1
eval_tap $? 77 'PublicQueryUserStatItems' test.out

#- 78 PublicBulkCreateUserStatItems
./ng net.accelbyte.sdk.cli.Main social publicBulkCreateUserStatItems \
    --namespace "$AB_NAMESPACE" \
    --userId 'w47Enet7' \
    --body '[{"statCode": "5J3UqVRz"}, {"statCode": "vXMvgKob"}, {"statCode": "vpOQZRol"}]' \
    > test.out 2>&1
eval_tap $? 78 'PublicBulkCreateUserStatItems' test.out

#- 79 PublicQueryUserStatItems1
./ng net.accelbyte.sdk.cli.Main social publicQueryUserStatItems1 \
    --namespace "$AB_NAMESPACE" \
    --userId 'XVpijz82' \
    --additionalKey 'HAZDDWLH' \
    --statCodes 'I5ISTMcy,Aup4PMAf,Q9AfLkmn' \
    --tags '8WGw0wr4,Daj1F8ac,mKOmMgvD' \
    > test.out 2>&1
eval_tap $? 79 'PublicQueryUserStatItems1' test.out

#- 80 PublicBulkIncUserStatItem1
./ng net.accelbyte.sdk.cli.Main social publicBulkIncUserStatItem1 \
    --namespace "$AB_NAMESPACE" \
    --userId 'S4kovYJQ' \
    --body '[{"inc": 0.46930549001634625, "statCode": "CcAo6HPd"}, {"inc": 0.6131678626397388, "statCode": "3H2dCO3V"}, {"inc": 0.8780868021687177, "statCode": "71ggBCFU"}]' \
    > test.out 2>&1
eval_tap $? 80 'PublicBulkIncUserStatItem1' test.out

#- 81 BulkIncUserStatItemValue2
./ng net.accelbyte.sdk.cli.Main social bulkIncUserStatItemValue2 \
    --namespace "$AB_NAMESPACE" \
    --userId '4Mhuq539' \
    --body '[{"inc": 0.3183874063340538, "statCode": "SLpbWW2h"}, {"inc": 0.35871534238970026, "statCode": "w4bw30yl"}, {"inc": 0.975710550800489, "statCode": "H24Yjqdc"}]' \
    > test.out 2>&1
eval_tap $? 81 'BulkIncUserStatItemValue2' test.out

#- 82 BulkResetUserStatItem3
./ng net.accelbyte.sdk.cli.Main social bulkResetUserStatItem3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'pmT4nzKv' \
    --body '[{"statCode": "ONco3jyx"}, {"statCode": "hk2AjeIA"}, {"statCode": "539ZcUt0"}]' \
    > test.out 2>&1
eval_tap $? 82 'BulkResetUserStatItem3' test.out

#- 83 PublicCreateUserStatItem
./ng net.accelbyte.sdk.cli.Main social publicCreateUserStatItem \
    --namespace "$AB_NAMESPACE" \
    --statCode 'DKcCHp9C' \
    --userId 'EDAr5loF' \
    > test.out 2>&1
eval_tap $? 83 'PublicCreateUserStatItem' test.out

#- 84 DeleteUserStatItems1
./ng net.accelbyte.sdk.cli.Main social deleteUserStatItems1 \
    --namespace "$AB_NAMESPACE" \
    --statCode 'jIZKoRat' \
    --userId 'UO18eGdO' \
    > test.out 2>&1
eval_tap $? 84 'DeleteUserStatItems1' test.out

#- 85 PublicIncUserStatItem
./ng net.accelbyte.sdk.cli.Main social publicIncUserStatItem \
    --namespace "$AB_NAMESPACE" \
    --statCode '3VtpW73B' \
    --userId 'onqzsaF3' \
    --body '{"inc": 0.6484874066098885}' \
    > test.out 2>&1
eval_tap $? 85 'PublicIncUserStatItem' test.out

#- 86 PublicIncUserStatItemValue
./ng net.accelbyte.sdk.cli.Main social publicIncUserStatItemValue \
    --namespace "$AB_NAMESPACE" \
    --statCode '343BOJyG' \
    --userId 'iTlyUTcn' \
    --body '{"inc": 0.5014726241732109}' \
    > test.out 2>&1
eval_tap $? 86 'PublicIncUserStatItemValue' test.out

#- 87 ResetUserStatItemValue1
./ng net.accelbyte.sdk.cli.Main social resetUserStatItemValue1 \
    --namespace "$AB_NAMESPACE" \
    --statCode 'kIohWUgN' \
    --userId 'UwHiubpo' \
    > test.out 2>&1
eval_tap $? 87 'ResetUserStatItemValue1' test.out

#- 88 BulkUpdateUserStatItemV2
./ng net.accelbyte.sdk.cli.Main social bulkUpdateUserStatItemV2 \
    --namespace "$AB_NAMESPACE" \
    --body '[{"additionalData": {"JTvF2mAa": {}, "wHzpqquO": {}, "ee5jOBtC": {}}, "additionalKey": "aW5pv8vA", "statCode": "hfbRONzx", "updateStrategy": "MAX", "userId": "IFi6pVn8", "value": 0.3749860306534055}, {"additionalData": {"pYFrBB6h": {}, "fhFy7CGQ": {}, "Ij51hwZ5": {}}, "additionalKey": "XmGk9ecL", "statCode": "7Tk514ga", "updateStrategy": "MAX", "userId": "jErYMdMA", "value": 0.23840221245618676}, {"additionalData": {"HQpC4axN": {}, "pjUth8Hu": {}, "vRThPh5t": {}}, "additionalKey": "l1SCTF7W", "statCode": "mxXkAr6J", "updateStrategy": "MAX", "userId": "VyBJeDO9", "value": 0.08987652292133952}]' \
    > test.out 2>&1
eval_tap $? 88 'BulkUpdateUserStatItemV2' test.out

#- 89 BulkFetchOrDefaultStatItems1
./ng net.accelbyte.sdk.cli.Main social bulkFetchOrDefaultStatItems1 \
    --namespace "$AB_NAMESPACE" \
    --additionalKey 'c5cYAjnl' \
    --statCode 'FbfaduBT' \
    --userIds '9W1dPvxX,L00RsrdA,mSeA0miI' \
    > test.out 2>&1
eval_tap $? 89 'BulkFetchOrDefaultStatItems1' test.out

#- 90 AdminListUsersStatItems
./ng net.accelbyte.sdk.cli.Main social adminListUsersStatItems \
    --namespace "$AB_NAMESPACE" \
    --userId 'bcuvudX0' \
    --additionalKey 'IO6ml42P' \
    --statCodes 'COhny6Ih,CmiiPe5h,DpMtbXme' \
    --tags 'R8dSa3QC,GlUk9BRi,57vCwE1P' \
    > test.out 2>&1
eval_tap $? 90 'AdminListUsersStatItems' test.out

#- 91 BulkUpdateUserStatItem
./ng net.accelbyte.sdk.cli.Main social bulkUpdateUserStatItem \
    --namespace "$AB_NAMESPACE" \
    --userId 'tqavTLbX' \
    --additionalKey 'BBtyxB9t' \
    --body '[{"additionalData": {"9cNRt1OP": {}, "RvNuaNTL": {}, "iVyzAYAj": {}}, "statCode": "uQfP17r5", "updateStrategy": "INCREMENT", "value": 0.8233618453213107}, {"additionalData": {"HMkGHnn0": {}, "P7EC8ece": {}, "emIXZsz5": {}}, "statCode": "2IgKloP8", "updateStrategy": "INCREMENT", "value": 0.7713877879632176}, {"additionalData": {"RyMkPNA7": {}, "mj7yqWhu": {}, "bBNaT3q3": {}}, "statCode": "1Hmoc0Hb", "updateStrategy": "MIN", "value": 0.4216845158162945}]' \
    > test.out 2>&1
eval_tap $? 91 'BulkUpdateUserStatItem' test.out

#- 92 BulkResetUserStatItemValues
./ng net.accelbyte.sdk.cli.Main social bulkResetUserStatItemValues \
    --namespace "$AB_NAMESPACE" \
    --userId 'CX9NBelh' \
    --additionalKey 'PO8cE2dk' \
    --body '[{"additionalData": {"ft8wJ11D": {}, "dN3eB7zb": {}, "HZEN2NB1": {}}, "statCode": "BDcSgObh"}, {"additionalData": {"L2gtGH3X": {}, "l0YltDjP": {}, "j77u3Wjg": {}}, "statCode": "8HhmpNoE"}, {"additionalData": {"czcgX70Y": {}, "YkpGh3K8": {}, "Vy22lBxM": {}}, "statCode": "sfrku3Sb"}]' \
    > test.out 2>&1
eval_tap $? 92 'BulkResetUserStatItemValues' test.out

#- 93 DeleteUserStatItems2
./ng net.accelbyte.sdk.cli.Main social deleteUserStatItems2 \
    --namespace "$AB_NAMESPACE" \
    --statCode 'NSfK0jkN' \
    --userId 'gAyqiT8T' \
    --additionalKey 'YyhuPZHz' \
    > test.out 2>&1
eval_tap $? 93 'DeleteUserStatItems2' test.out

#- 94 UpdateUserStatItemValue
./ng net.accelbyte.sdk.cli.Main social updateUserStatItemValue \
    --namespace "$AB_NAMESPACE" \
    --statCode 'lt3XA5c7' \
    --userId 'aVicUqHw' \
    --additionalKey 'OtVZbAA0' \
    --body '{"additionalData": {"mlqNGYZo": {}, "4Q7NlICt": {}, "TKRuji5D": {}}, "updateStrategy": "MAX", "value": 0.8272328823004422}' \
    > test.out 2>&1
eval_tap $? 94 'UpdateUserStatItemValue' test.out

#- 95 BulkUpdateUserStatItem1
./ng net.accelbyte.sdk.cli.Main social bulkUpdateUserStatItem1 \
    --namespace "$AB_NAMESPACE" \
    --body '[{"additionalData": {"yXootUW8": {}, "NE22jjDq": {}, "qcL9oiGJ": {}}, "additionalKey": "jHke5jtF", "statCode": "REnJ7yor", "updateStrategy": "MAX", "userId": "27dlP2Kl", "value": 0.18344579967467967}, {"additionalData": {"ezMemgkx": {}, "H9iwRHg9": {}, "Gb4dpJAI": {}}, "additionalKey": "Qrf0bRPh", "statCode": "rsgq4xaV", "updateStrategy": "INCREMENT", "userId": "IJiZoslS", "value": 0.11243453689293847}, {"additionalData": {"OF01pCjk": {}, "ReYuv2Dn": {}, "cqsccxpW": {}}, "additionalKey": "dLSNfFpU", "statCode": "lx9x3ZLD", "updateStrategy": "MIN", "userId": "ISuAhUYX", "value": 0.509354804589769}]' \
    > test.out 2>&1
eval_tap $? 95 'BulkUpdateUserStatItem1' test.out

#- 96 PublicQueryUserStatItems2
./ng net.accelbyte.sdk.cli.Main social publicQueryUserStatItems2 \
    --namespace "$AB_NAMESPACE" \
    --userId 'QWG0Ackn' \
    --additionalKey 'x6KWZwYd' \
    --statCodes 'MONSYxoG,OBx1uYth,Td9LmfKi' \
    --tags 'x0Yu8EIh,yE5Isnr2,6jj4rRKj' \
    > test.out 2>&1
eval_tap $? 96 'PublicQueryUserStatItems2' test.out

#- 97 BulkUpdateUserStatItem2
./ng net.accelbyte.sdk.cli.Main social bulkUpdateUserStatItem2 \
    --namespace "$AB_NAMESPACE" \
    --userId 'kQPzjxqS' \
    --additionalKey 'xYphGelh' \
    --body '[{"additionalData": {"LRYiVQJ9": {}, "h1WWfCKU": {}, "3Imix6KS": {}}, "statCode": "o5Bg6Euv", "updateStrategy": "MIN", "value": 0.49358771112106525}, {"additionalData": {"MRE3kKxa": {}, "I5S8Kyz4": {}, "DtBZqB25": {}}, "statCode": "u2Uoi15W", "updateStrategy": "INCREMENT", "value": 0.030435702480670956}, {"additionalData": {"GxSEma05": {}, "4iBdmA9v": {}, "MUZuPOnV": {}}, "statCode": "vBZPK4Ak", "updateStrategy": "INCREMENT", "value": 0.017836553300313307}]' \
    > test.out 2>&1
eval_tap $? 97 'BulkUpdateUserStatItem2' test.out

#- 98 UpdateUserStatItemValue1
./ng net.accelbyte.sdk.cli.Main social updateUserStatItemValue1 \
    --namespace "$AB_NAMESPACE" \
    --statCode '6ZLeSe9j' \
    --userId 'dCs2H2OE' \
    --additionalKey '8G4qlgqS' \
    --body '{"additionalData": {"DTMzuaoL": {}, "oKMM3MGc": {}, "QY11aqkO": {}}, "updateStrategy": "MAX", "value": 0.42006499959368915}' \
    > test.out 2>&1
eval_tap $? 98 'UpdateUserStatItemValue1' test.out


rm -f "tmp.dat"

exit $EXIT_CODE