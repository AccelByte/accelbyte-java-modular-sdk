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
    --limit '45' \
    --offset '59' \
    --statCodes '5wugEwmZ' \
    > test.out 2>&1
eval_tap $? 26 'GetGlobalStatItems' test.out

#- 27 GetGlobalStatItemByStatCode
./ng net.accelbyte.sdk.cli.Main social getGlobalStatItemByStatCode \
    --namespace "$AB_NAMESPACE" \
    --statCode '1bqrWlgp' \
    > test.out 2>&1
eval_tap $? 27 'GetGlobalStatItemByStatCode' test.out

#- 28 GetStatCycles
./ng net.accelbyte.sdk.cli.Main social getStatCycles \
    --namespace "$AB_NAMESPACE" \
    --cycleType 'ANNUALLY' \
    --limit '46' \
    --name 'VOIaAo0V' \
    --offset '44' \
    --sortBy 'oruDja53' \
    --status 'STOPPED' \
    > test.out 2>&1
eval_tap $? 28 'GetStatCycles' test.out

#- 29 CreateStatCycle
./ng net.accelbyte.sdk.cli.Main social createStatCycle \
    --namespace "$AB_NAMESPACE" \
    --body '{"cycleType": "WEEKLY", "description": "Fzuz6aEi", "end": "1976-01-05T00:00:00Z", "id": "ZKx4fjXe", "name": "N78Ng5Rj", "resetDate": 75, "resetDay": 48, "resetMonth": 35, "resetTime": "6NPTuy8B", "seasonPeriod": 26, "start": "1996-05-25T00:00:00Z"}' \
    > test.out 2>&1
eval_tap $? 29 'CreateStatCycle' test.out

#- 30 BulkGetStatCycle
./ng net.accelbyte.sdk.cli.Main social bulkGetStatCycle \
    --namespace "$AB_NAMESPACE" \
    --body '{"cycleIds": ["zlMp9LA0", "RHNw97aR", "6W3OuCO3"]}' \
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
    --cycleId 'KuKljh3q' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 33 'GetStatCycle' test.out

#- 34 UpdateStatCycle
./ng net.accelbyte.sdk.cli.Main social updateStatCycle \
    --cycleId 'aYmdhszZ' \
    --namespace "$AB_NAMESPACE" \
    --body '{"cycleType": "SEASONAL", "description": "RQ3Ah3BZ", "end": "1984-01-15T00:00:00Z", "name": "zkWxby41", "resetDate": 64, "resetDay": 59, "resetMonth": 28, "resetTime": "XTDfoQtd", "seasonPeriod": 64, "start": "1984-02-22T00:00:00Z"}' \
    > test.out 2>&1
eval_tap $? 34 'UpdateStatCycle' test.out

#- 35 DeleteStatCycle
./ng net.accelbyte.sdk.cli.Main social deleteStatCycle \
    --cycleId 'ibrXmnDj' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 35 'DeleteStatCycle' test.out

#- 36 BulkAddStats
./ng net.accelbyte.sdk.cli.Main social bulkAddStats \
    --cycleId 'wPuZCu6D' \
    --namespace "$AB_NAMESPACE" \
    --body '{"statCodes": ["TWNwP8m9", "aRHhleZq", "gtRdz2RJ"]}' \
    > test.out 2>&1
eval_tap $? 36 'BulkAddStats' test.out

#- 37 StopStatCycle
./ng net.accelbyte.sdk.cli.Main social stopStatCycle \
    --cycleId 'nkJw8WVr' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 37 'StopStatCycle' test.out

#- 38 BulkFetchStatItems
./ng net.accelbyte.sdk.cli.Main social bulkFetchStatItems \
    --namespace "$AB_NAMESPACE" \
    --statCode 'uu6V7EK3' \
    --userIds 'FZjM4kFR' \
    > test.out 2>&1
eval_tap $? 38 'BulkFetchStatItems' test.out

#- 39 BulkIncUserStatItem
./ng net.accelbyte.sdk.cli.Main social bulkIncUserStatItem \
    --namespace "$AB_NAMESPACE" \
    --body '[{"inc": 0.3997118751350307, "statCode": "EwXJwQPX", "userId": "AewseXdx"}, {"inc": 0.1574405535927309, "statCode": "AXQFSL7u", "userId": "P3XbRaaX"}, {"inc": 0.5895075230273881, "statCode": "GEHxCqbl", "userId": "7UEx2g5q"}]' \
    > test.out 2>&1
eval_tap $? 39 'BulkIncUserStatItem' test.out

#- 40 BulkIncUserStatItemValue
./ng net.accelbyte.sdk.cli.Main social bulkIncUserStatItemValue \
    --namespace "$AB_NAMESPACE" \
    --body '[{"inc": 0.029393669528211763, "statCode": "NBHeKCLh", "userId": "hI7gJK2k"}, {"inc": 0.9117412848124646, "statCode": "aXLCYZEN", "userId": "8wepBRdx"}, {"inc": 0.9074441105606499, "statCode": "pgCCjUBR", "userId": "5fpoEeY1"}]' \
    > test.out 2>&1
eval_tap $? 40 'BulkIncUserStatItemValue' test.out

#- 41 BulkFetchOrDefaultStatItems
./ng net.accelbyte.sdk.cli.Main social bulkFetchOrDefaultStatItems \
    --namespace "$AB_NAMESPACE" \
    --statCode 'NmX2yAxa' \
    --userIds 'D1gNq3uv,2h9FvHuI,706sMgBS' \
    > test.out 2>&1
eval_tap $? 41 'BulkFetchOrDefaultStatItems' test.out

#- 42 BulkResetUserStatItem
./ng net.accelbyte.sdk.cli.Main social bulkResetUserStatItem \
    --namespace "$AB_NAMESPACE" \
    --body '[{"statCode": "AbjCrj2j", "userId": "KBgGzHho"}, {"statCode": "SoXkjF2J", "userId": "t3NbQi8m"}, {"statCode": "ylV08PuZ", "userId": "X4oBmmwK"}]' \
    > test.out 2>&1
eval_tap $? 42 'BulkResetUserStatItem' test.out

#- 43 GetStats
./ng net.accelbyte.sdk.cli.Main social getStats \
    --namespace "$AB_NAMESPACE" \
    --cycleIds 'MG3hU0hl' \
    --isGlobal  \
    --isPublic  \
    --limit '74' \
    --offset '22' \
    > test.out 2>&1
eval_tap $? 43 'GetStats' test.out

#- 44 CreateStat
./ng net.accelbyte.sdk.cli.Main social createStat \
    --namespace "$AB_NAMESPACE" \
    --body '{"capCycleOverride": true, "cycleIds": ["fhEqq7hQ", "A6K5oPnJ", "WGD3BcNZ"], "cycleOverrides": [{"cycleId": "NDmVuZJC", "maximum": 0.8503363306658068, "minimum": 0.046644723939086696}, {"cycleId": "Yd9H9kZb", "maximum": 0.15728119667748408, "minimum": 0.4924649155766134}, {"cycleId": "6678fPjf", "maximum": 0.25872959997917133, "minimum": 0.21202628658213818}], "defaultValue": 0.8476055253145752, "description": "kU8LkyDV", "globalAggregationMethod": "MIN", "ignoreAdditionalDataOnValueRejected": true, "incrementOnly": false, "isPublic": false, "maximum": 0.4260752462662645, "minimum": 0.17601514513522187, "name": "BSHCOcmJ", "setAsGlobal": false, "setBy": "CLIENT", "statCode": "3DD9Xv4V", "tags": ["qtDC2eQT", "mLVUiX51", "Mwf5F0f7"], "visibility": "SHOWALL"}' \
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
    --limit '76' \
    --offset '40' \
    --keyword '0434jPGC' \
    > test.out 2>&1
eval_tap $? 47 'QueryStats' test.out

#- 48 GetStat
./ng net.accelbyte.sdk.cli.Main social getStat \
    --namespace "$AB_NAMESPACE" \
    --statCode 'GNMvcuvf' \
    > test.out 2>&1
eval_tap $? 48 'GetStat' test.out

#- 49 DeleteStat
./ng net.accelbyte.sdk.cli.Main social deleteStat \
    --namespace "$AB_NAMESPACE" \
    --statCode 'FpjxPLlI' \
    > test.out 2>&1
eval_tap $? 49 'DeleteStat' test.out

#- 50 UpdateStat
./ng net.accelbyte.sdk.cli.Main social updateStat \
    --namespace "$AB_NAMESPACE" \
    --statCode 'kCWGIswM' \
    --body '{"capCycleOverride": false, "cycleIds": ["rEE8PcWT", "5wQS9mM1", "O8QhScz4"], "cycleOverrides": [{"cycleId": "4KbVxtTY", "maximum": 0.5300386410822466, "minimum": 0.5484143918681845}, {"cycleId": "qnB8rfO9", "maximum": 0.7657501783729536, "minimum": 0.18567980218469426}, {"cycleId": "GYEZy9HX", "maximum": 0.3334999205266824, "minimum": 0.32435310312843635}], "defaultValue": 0.18501680931191877, "description": "xU9zpLJV", "globalAggregationMethod": "MAX", "ignoreAdditionalDataOnValueRejected": false, "isPublic": false, "name": "jBybceTp", "tags": ["HlTtaRxh", "xcaIcCwe", "u29VKNCz"], "visibility": "SERVERONLY"}' \
    > test.out 2>&1
eval_tap $? 50 'UpdateStat' test.out

#- 51 GetStatItems
./ng net.accelbyte.sdk.cli.Main social getStatItems \
    --namespace "$AB_NAMESPACE" \
    --statCode 'ftMoSddf' \
    --limit '37' \
    --offset '79' \
    --sortBy 'TvVuTF8E' \
    > test.out 2>&1
eval_tap $? 51 'GetStatItems' test.out

#- 52 DeleteTiedStat
./ng net.accelbyte.sdk.cli.Main social deleteTiedStat \
    --namespace "$AB_NAMESPACE" \
    --statCode 'amaLzsiF' \
    > test.out 2>&1
eval_tap $? 52 'DeleteTiedStat' test.out

#- 53 GetUserStatCycleItems
./ng net.accelbyte.sdk.cli.Main social getUserStatCycleItems \
    --cycleId '20vXxdn7' \
    --namespace "$AB_NAMESPACE" \
    --userId 'kjpRI2gc' \
    --isPublic  \
    --limit '63' \
    --offset '71' \
    --sortBy 'lsy4iCZj' \
    --statCodes 'VdQKNQjP' \
    > test.out 2>&1
eval_tap $? 53 'GetUserStatCycleItems' test.out

#- 54 GetUserStatItems
./ng net.accelbyte.sdk.cli.Main social getUserStatItems \
    --namespace "$AB_NAMESPACE" \
    --userId 'zDLNwsdL' \
    --isPublic  \
    --limit '82' \
    --offset '54' \
    --sortBy 'dPbdUjKL' \
    --statCodes 'abccpyiA' \
    --tags 'H4mmmsGE' \
    > test.out 2>&1
eval_tap $? 54 'GetUserStatItems' test.out

#- 55 BulkCreateUserStatItems
./ng net.accelbyte.sdk.cli.Main social bulkCreateUserStatItems \
    --namespace "$AB_NAMESPACE" \
    --userId '6lRorSDy' \
    --body '[{"statCode": "xyjiCYGu"}, {"statCode": "PdFPvx1p"}, {"statCode": "lGdJCeV6"}]' \
    > test.out 2>&1
eval_tap $? 55 'BulkCreateUserStatItems' test.out

#- 56 BulkIncUserStatItem1
./ng net.accelbyte.sdk.cli.Main social bulkIncUserStatItem1 \
    --namespace "$AB_NAMESPACE" \
    --userId 'PO1Mcvci' \
    --body '[{"inc": 0.9696426773016933, "statCode": "nXgEUubO"}, {"inc": 0.9569721340233028, "statCode": "oNlly3CS"}, {"inc": 0.6738012613587558, "statCode": "p1uGzMWS"}]' \
    > test.out 2>&1
eval_tap $? 56 'BulkIncUserStatItem1' test.out

#- 57 BulkIncUserStatItemValue1
./ng net.accelbyte.sdk.cli.Main social bulkIncUserStatItemValue1 \
    --namespace "$AB_NAMESPACE" \
    --userId '9dpAk8KA' \
    --body '[{"inc": 0.351901313342015, "statCode": "xK0PLBpC"}, {"inc": 0.362127639700365, "statCode": "pJMN7H78"}, {"inc": 0.518996562660659, "statCode": "gJhEaADw"}]' \
    > test.out 2>&1
eval_tap $? 57 'BulkIncUserStatItemValue1' test.out

#- 58 BulkResetUserStatItem1
./ng net.accelbyte.sdk.cli.Main social bulkResetUserStatItem1 \
    --namespace "$AB_NAMESPACE" \
    --userId 'tS8idG0m' \
    --body '[{"statCode": "vxZH0XPt"}, {"statCode": "VZ3uHmei"}, {"statCode": "qrmWZuvm"}]' \
    > test.out 2>&1
eval_tap $? 58 'BulkResetUserStatItem1' test.out

#- 59 CreateUserStatItem
./ng net.accelbyte.sdk.cli.Main social createUserStatItem \
    --namespace "$AB_NAMESPACE" \
    --statCode 've2KH9jq' \
    --userId '7sppprzv' \
    > test.out 2>&1
eval_tap $? 59 'CreateUserStatItem' test.out

#- 60 DeleteUserStatItems
./ng net.accelbyte.sdk.cli.Main social deleteUserStatItems \
    --namespace "$AB_NAMESPACE" \
    --statCode 'CdjbhsMl' \
    --userId 'bByKakEM' \
    > test.out 2>&1
eval_tap $? 60 'DeleteUserStatItems' test.out

#- 61 IncUserStatItemValue
./ng net.accelbyte.sdk.cli.Main social incUserStatItemValue \
    --namespace "$AB_NAMESPACE" \
    --statCode 'FFNvPLjE' \
    --userId '9cfMfai9' \
    --body '{"inc": 0.8663169073748315}' \
    > test.out 2>&1
eval_tap $? 61 'IncUserStatItemValue' test.out

#- 62 ResetUserStatItemValue
./ng net.accelbyte.sdk.cli.Main social resetUserStatItemValue \
    --namespace "$AB_NAMESPACE" \
    --statCode 'sckeXEgf' \
    --userId '1AF6K888' \
    --additionalKey 'BIOryrJc' \
    --body '{"additionalData": {"7knCQ8dx": {}, "Zo3WelA8": {}, "9inXeuGL": {}}}' \
    > test.out 2>&1
eval_tap $? 62 'ResetUserStatItemValue' test.out

#- 63 GetGlobalStatItems1
./ng net.accelbyte.sdk.cli.Main social getGlobalStatItems1 \
    --namespace "$AB_NAMESPACE" \
    --limit '75' \
    --offset '33' \
    --statCodes 'rVaBizSI' \
    > test.out 2>&1
eval_tap $? 63 'GetGlobalStatItems1' test.out

#- 64 GetGlobalStatItemByStatCode1
./ng net.accelbyte.sdk.cli.Main social getGlobalStatItemByStatCode1 \
    --namespace "$AB_NAMESPACE" \
    --statCode 'YmaMNGW9' \
    > test.out 2>&1
eval_tap $? 64 'GetGlobalStatItemByStatCode1' test.out

#- 65 GetStatCycles1
./ng net.accelbyte.sdk.cli.Main social getStatCycles1 \
    --namespace "$AB_NAMESPACE" \
    --cycleType 'MONTHLY' \
    --limit '83' \
    --name '1dhulErN' \
    --offset '24' \
    --sortBy 'qHo2Dp1d' \
    --status 'INIT' \
    > test.out 2>&1
eval_tap $? 65 'GetStatCycles1' test.out

#- 66 BulkGetStatCycle1
./ng net.accelbyte.sdk.cli.Main social bulkGetStatCycle1 \
    --namespace "$AB_NAMESPACE" \
    --body '{"cycleIds": ["erVdNhqX", "cTkegGcy", "AvXHqPc0"]}' \
    > test.out 2>&1
eval_tap $? 66 'BulkGetStatCycle1' test.out

#- 67 GetStatCycle1
./ng net.accelbyte.sdk.cli.Main social getStatCycle1 \
    --cycleId 'l6VkqgxL' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 67 'GetStatCycle1' test.out

#- 68 BulkFetchStatItems1
./ng net.accelbyte.sdk.cli.Main social bulkFetchStatItems1 \
    --namespace "$AB_NAMESPACE" \
    --statCode 'rhiyNpDu' \
    --userIds 'PbaKKIaQ' \
    > test.out 2>&1
eval_tap $? 68 'BulkFetchStatItems1' test.out

#- 69 PublicBulkIncUserStatItem
./ng net.accelbyte.sdk.cli.Main social publicBulkIncUserStatItem \
    --namespace "$AB_NAMESPACE" \
    --body '[{"inc": 0.283676395300132, "statCode": "RSq2gy0Y", "userId": "wizEkHdU"}, {"inc": 0.07163081607861022, "statCode": "a8N8lJjj", "userId": "xSiho6sS"}, {"inc": 0.9628997119723386, "statCode": "hzscszv5", "userId": "YUQR3mEw"}]' \
    > test.out 2>&1
eval_tap $? 69 'PublicBulkIncUserStatItem' test.out

#- 70 PublicBulkIncUserStatItemValue
./ng net.accelbyte.sdk.cli.Main social publicBulkIncUserStatItemValue \
    --namespace "$AB_NAMESPACE" \
    --body '[{"inc": 0.11891819600186815, "statCode": "FhWtsLO2", "userId": "VbX5ZT6s"}, {"inc": 0.8471017511098103, "statCode": "C3kATjGN", "userId": "d1zTwTXw"}, {"inc": 0.5772803753358807, "statCode": "9QPjFsio", "userId": "IB7ORYzq"}]' \
    > test.out 2>&1
eval_tap $? 70 'PublicBulkIncUserStatItemValue' test.out

#- 71 BulkResetUserStatItem2
./ng net.accelbyte.sdk.cli.Main social bulkResetUserStatItem2 \
    --namespace "$AB_NAMESPACE" \
    --body '[{"statCode": "cIHqkcDs", "userId": "UN4ZMkLv"}, {"statCode": "eyjZTDDV", "userId": "OxTHX3sQ"}, {"statCode": "NdM5lB5S", "userId": "ORXsqwKu"}]' \
    > test.out 2>&1
eval_tap $? 71 'BulkResetUserStatItem2' test.out

#- 72 CreateStat1
./ng net.accelbyte.sdk.cli.Main social createStat1 \
    --namespace "$AB_NAMESPACE" \
    --body '{"capCycleOverride": false, "cycleIds": ["T44RCOqj", "4vZjvVbH", "aK64g1oH"], "cycleOverrides": [{"cycleId": "72yQWKFR", "maximum": 0.18275506128247143, "minimum": 0.526063395824088}, {"cycleId": "lVkG49Kq", "maximum": 0.7036393806901642, "minimum": 0.5598775466181368}, {"cycleId": "AqkKDIfz", "maximum": 0.843313967123734, "minimum": 0.6609448992005154}], "defaultValue": 0.4525855807594916, "description": "F79MvHuF", "globalAggregationMethod": "LAST", "ignoreAdditionalDataOnValueRejected": false, "incrementOnly": true, "isPublic": false, "maximum": 0.19393220246603537, "minimum": 0.6629768402752373, "name": "7vrOasq5", "setAsGlobal": false, "setBy": "CLIENT", "statCode": "6GNRMQdQ", "tags": ["htW85xXa", "cOQ7OF7p", "Nz49OumR"], "visibility": "SHOWALL"}' \
    > test.out 2>&1
eval_tap $? 72 'CreateStat1' test.out

#- 73 PublicListMyStatCycleItems
./ng net.accelbyte.sdk.cli.Main social publicListMyStatCycleItems \
    --cycleId 'anKYj0am' \
    --namespace "$AB_NAMESPACE" \
    --limit '6' \
    --offset '49' \
    --sortBy 'PuaDoBZT' \
    --statCodes 'hnvxFF8Q,PNG9CVlc,BleHQKTf' \
    > test.out 2>&1
eval_tap $? 73 'PublicListMyStatCycleItems' test.out

#- 74 PublicListMyStatItems
./ng net.accelbyte.sdk.cli.Main social publicListMyStatItems \
    --namespace "$AB_NAMESPACE" \
    --limit '45' \
    --offset '38' \
    --sortBy 'rBZ9Ehp9' \
    --statCodes '9QoyJnYg,ZHQ0aRhL,mMo2rdzS' \
    --tags 'AwKFXZF9,zWyNAFVr,7GBUmrLv' \
    > test.out 2>&1
eval_tap $? 74 'PublicListMyStatItems' test.out

#- 75 PublicListAllMyStatItems
./ng net.accelbyte.sdk.cli.Main social publicListAllMyStatItems \
    --namespace "$AB_NAMESPACE" \
    --additionalKey 'AeAq1S9Q' \
    --statCodes 'Nh5hl2vv,6oslGbQm,xf0j5tyl' \
    --tags 'pT33O0ti,Yq8NhObN,nPKREMyu' \
    > test.out 2>&1
eval_tap $? 75 'PublicListAllMyStatItems' test.out

#- 76 GetUserStatCycleItems1
./ng net.accelbyte.sdk.cli.Main social getUserStatCycleItems1 \
    --cycleId 'Ll7Be6ZH' \
    --namespace "$AB_NAMESPACE" \
    --userId 'UP5I18kO' \
    --limit '47' \
    --offset '34' \
    --sortBy 'OYFBCmsl' \
    --statCodes '9CZ1ErlC' \
    > test.out 2>&1
eval_tap $? 76 'GetUserStatCycleItems1' test.out

#- 77 PublicQueryUserStatItems1
./ng net.accelbyte.sdk.cli.Main social publicQueryUserStatItems1 \
    --namespace "$AB_NAMESPACE" \
    --userId 'ZhWuHeuj' \
    --limit '94' \
    --offset '9' \
    --sortBy 'eIPw2WOH' \
    --statCodes 'SVrJjkVf' \
    --tags 'z04lVC3s' \
    > test.out 2>&1
eval_tap $? 77 'PublicQueryUserStatItems1' test.out

#- 78 PublicBulkCreateUserStatItems
./ng net.accelbyte.sdk.cli.Main social publicBulkCreateUserStatItems \
    --namespace "$AB_NAMESPACE" \
    --userId 'ZgY38G76' \
    --body '[{"statCode": "Rwm7ea27"}, {"statCode": "VqEBI87A"}, {"statCode": "KlPMw4fw"}]' \
    > test.out 2>&1
eval_tap $? 78 'PublicBulkCreateUserStatItems' test.out

#- 79 PublicQueryUserStatItems
./ng net.accelbyte.sdk.cli.Main social publicQueryUserStatItems \
    --namespace "$AB_NAMESPACE" \
    --userId 'Sn5zlxGO' \
    --additionalKey 'dAw4RfwF' \
    --statCodes 'P0MFsxm2,HJi1VsMz,CD1u7wT1' \
    --tags 'hpeLta7Z,XgJqulok,c67aoLyg' \
    > test.out 2>&1
eval_tap $? 79 'PublicQueryUserStatItems' test.out

#- 80 PublicBulkIncUserStatItem1
./ng net.accelbyte.sdk.cli.Main social publicBulkIncUserStatItem1 \
    --namespace "$AB_NAMESPACE" \
    --userId 'TErzcWML' \
    --body '[{"inc": 0.299341604126357, "statCode": "JqEJWJXm"}, {"inc": 0.043963453805608066, "statCode": "dsXE4KpK"}, {"inc": 0.6544468109640321, "statCode": "fh8wpahW"}]' \
    > test.out 2>&1
eval_tap $? 80 'PublicBulkIncUserStatItem1' test.out

#- 81 BulkIncUserStatItemValue2
./ng net.accelbyte.sdk.cli.Main social bulkIncUserStatItemValue2 \
    --namespace "$AB_NAMESPACE" \
    --userId 'W10pTqQV' \
    --body '[{"inc": 0.1602209254052508, "statCode": "lEI5ZGAE"}, {"inc": 0.09205966113091846, "statCode": "v0PAiC63"}, {"inc": 0.9693051127294121, "statCode": "xvacJxmV"}]' \
    > test.out 2>&1
eval_tap $? 81 'BulkIncUserStatItemValue2' test.out

#- 82 BulkResetUserStatItem3
./ng net.accelbyte.sdk.cli.Main social bulkResetUserStatItem3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'b8030WXy' \
    --body '[{"statCode": "CYmsyNwC"}, {"statCode": "uUJDY4TC"}, {"statCode": "DE1CQ6Zk"}]' \
    > test.out 2>&1
eval_tap $? 82 'BulkResetUserStatItem3' test.out

#- 83 PublicCreateUserStatItem
./ng net.accelbyte.sdk.cli.Main social publicCreateUserStatItem \
    --namespace "$AB_NAMESPACE" \
    --statCode 'wjjb9ypN' \
    --userId 'fXaC2F1t' \
    > test.out 2>&1
eval_tap $? 83 'PublicCreateUserStatItem' test.out

#- 84 DeleteUserStatItems1
./ng net.accelbyte.sdk.cli.Main social deleteUserStatItems1 \
    --namespace "$AB_NAMESPACE" \
    --statCode '6rEE1Ao1' \
    --userId 'Sq5KsRQb' \
    > test.out 2>&1
eval_tap $? 84 'DeleteUserStatItems1' test.out

#- 85 PublicIncUserStatItem
./ng net.accelbyte.sdk.cli.Main social publicIncUserStatItem \
    --namespace "$AB_NAMESPACE" \
    --statCode 'GnNEPDUW' \
    --userId 'JzDqRZtI' \
    --body '{"inc": 0.6521259646456794}' \
    > test.out 2>&1
eval_tap $? 85 'PublicIncUserStatItem' test.out

#- 86 PublicIncUserStatItemValue
./ng net.accelbyte.sdk.cli.Main social publicIncUserStatItemValue \
    --namespace "$AB_NAMESPACE" \
    --statCode 'haYrMpAK' \
    --userId 'OtOOWYn4' \
    --body '{"inc": 0.6519204060142835}' \
    > test.out 2>&1
eval_tap $? 86 'PublicIncUserStatItemValue' test.out

#- 87 ResetUserStatItemValue1
./ng net.accelbyte.sdk.cli.Main social resetUserStatItemValue1 \
    --namespace "$AB_NAMESPACE" \
    --statCode 'dmQNlny0' \
    --userId '8MrxeCgJ' \
    > test.out 2>&1
eval_tap $? 87 'ResetUserStatItemValue1' test.out

#- 88 BulkUpdateUserStatItemV2
./ng net.accelbyte.sdk.cli.Main social bulkUpdateUserStatItemV2 \
    --namespace "$AB_NAMESPACE" \
    --body '[{"additionalData": {"Q8QxXs0S": {}, "m9tW34qL": {}, "5bfYqxlQ": {}}, "additionalKey": "p63bDNpN", "statCode": "wmErdOJq", "updateStrategy": "OVERRIDE", "userId": "VHKUgFtH", "value": 0.2250884805993345}, {"additionalData": {"5lqkFUGx": {}, "ucdYczBb": {}, "e2hFZHyk": {}}, "additionalKey": "d7bf5uqw", "statCode": "80dpP2U4", "updateStrategy": "OVERRIDE", "userId": "4NGu5QZF", "value": 0.15078998397970556}, {"additionalData": {"v6tjTuQG": {}, "k8q0xaId": {}, "9B1vsDvP": {}}, "additionalKey": "G6wRe9xJ", "statCode": "RCrgsi17", "updateStrategy": "MAX", "userId": "r6YCWtPP", "value": 0.3779243847142183}]' \
    > test.out 2>&1
eval_tap $? 88 'BulkUpdateUserStatItemV2' test.out

#- 89 BulkFetchOrDefaultStatItems1
./ng net.accelbyte.sdk.cli.Main social bulkFetchOrDefaultStatItems1 \
    --namespace "$AB_NAMESPACE" \
    --additionalKey 'Ubl14na5' \
    --statCode '174OpgRz' \
    --userIds 'Plci5mss,8AGsXFSC,GkxUAzek' \
    > test.out 2>&1
eval_tap $? 89 'BulkFetchOrDefaultStatItems1' test.out

#- 90 AdminListUsersStatItems
./ng net.accelbyte.sdk.cli.Main social adminListUsersStatItems \
    --namespace "$AB_NAMESPACE" \
    --userId 'vCSIQ8K8' \
    --additionalKey 'ZPGgdFfs' \
    --statCodes 'Xofy9LmV,ALy3r6xo,M5zOf5TB' \
    --tags 'CS7CTiS4,kQafT1r3,5y3wGBXI' \
    > test.out 2>&1
eval_tap $? 90 'AdminListUsersStatItems' test.out

#- 91 BulkUpdateUserStatItem
./ng net.accelbyte.sdk.cli.Main social bulkUpdateUserStatItem \
    --namespace "$AB_NAMESPACE" \
    --userId 'd9IqjAaj' \
    --additionalKey '8agIy3pn' \
    --body '[{"additionalData": {"B7oN6UYz": {}, "ZScoCT9b": {}, "CDt0Phva": {}}, "statCode": "O18S0uss", "updateStrategy": "INCREMENT", "value": 0.19394600547930596}, {"additionalData": {"OPq1Z5M3": {}, "AE7xWyYa": {}, "YZxsFvyx": {}}, "statCode": "K97xSfXC", "updateStrategy": "MAX", "value": 0.6721790682395758}, {"additionalData": {"N5PIP86J": {}, "oRNo2RNT": {}, "NYqAdwzc": {}}, "statCode": "bvrmnYRZ", "updateStrategy": "OVERRIDE", "value": 0.9124176744888965}]' \
    > test.out 2>&1
eval_tap $? 91 'BulkUpdateUserStatItem' test.out

#- 92 BulkGetOrDefaultByUserId
./ng net.accelbyte.sdk.cli.Main social bulkGetOrDefaultByUserId \
    --namespace "$AB_NAMESPACE" \
    --userId 'dPaDQKgg' \
    --additionalKey 'aaxruh3F' \
    --body '{"statCodes": ["uWdzMljt", "7V0eK6M3", "ejtwQuK6"]}' \
    > test.out 2>&1
eval_tap $? 92 'BulkGetOrDefaultByUserId' test.out

#- 93 BulkResetUserStatItemValues
./ng net.accelbyte.sdk.cli.Main social bulkResetUserStatItemValues \
    --namespace "$AB_NAMESPACE" \
    --userId 'quG6AyQc' \
    --additionalKey 'xTJ2zsrv' \
    --body '[{"additionalData": {"z6CUywXz": {}, "qxBOtMO8": {}, "T5mGBZeW": {}}, "statCode": "35ESWR4w"}, {"additionalData": {"iCPzDlqx": {}, "4jdhKy1d": {}, "Rx7HtmmN": {}}, "statCode": "aThILyCr"}, {"additionalData": {"qDmO1e9V": {}, "df7qTVoH": {}, "SaDi3qw8": {}}, "statCode": "DyYghfyR"}]' \
    > test.out 2>&1
eval_tap $? 93 'BulkResetUserStatItemValues' test.out

#- 94 DeleteUserStatItems2
./ng net.accelbyte.sdk.cli.Main social deleteUserStatItems2 \
    --namespace "$AB_NAMESPACE" \
    --statCode '3sPAp287' \
    --userId '8hece3dV' \
    --additionalKey 'HASuMxyO' \
    > test.out 2>&1
eval_tap $? 94 'DeleteUserStatItems2' test.out

#- 95 UpdateUserStatItemValue
./ng net.accelbyte.sdk.cli.Main social updateUserStatItemValue \
    --namespace "$AB_NAMESPACE" \
    --statCode '1ZsbhwxC' \
    --userId 'j1NsXrfZ' \
    --additionalKey 'DQRzemm3' \
    --body '{"additionalData": {"nRrat1rU": {}, "zcBHuF36": {}, "R1XbsdlX": {}}, "updateStrategy": "MAX", "value": 0.5375548622345225}' \
    > test.out 2>&1
eval_tap $? 95 'UpdateUserStatItemValue' test.out

#- 96 BulkUpdateUserStatItem1
./ng net.accelbyte.sdk.cli.Main social bulkUpdateUserStatItem1 \
    --namespace "$AB_NAMESPACE" \
    --body '[{"additionalData": {"c9kTwHdl": {}, "8ujhrOFb": {}, "YdPAAKiG": {}}, "additionalKey": "39ir287I", "statCode": "hiK7QufD", "updateStrategy": "INCREMENT", "userId": "h9seCpHT", "value": 0.44716045306025687}, {"additionalData": {"oFWS9QvV": {}, "QAxHkXj9": {}, "iwHd9nPr": {}}, "additionalKey": "aYRSe6ui", "statCode": "6gGLIqvW", "updateStrategy": "INCREMENT", "userId": "BF73z1Gx", "value": 0.03264199630227482}, {"additionalData": {"Yj7jc9E7": {}, "iSlz8BTl": {}, "jMonYl9p": {}}, "additionalKey": "Z1xik5sE", "statCode": "PPQRbV6U", "updateStrategy": "INCREMENT", "userId": "ihSggTcr", "value": 0.7035838351976843}]' \
    > test.out 2>&1
eval_tap $? 96 'BulkUpdateUserStatItem1' test.out

#- 97 PublicQueryUserStatItems2
./ng net.accelbyte.sdk.cli.Main social publicQueryUserStatItems2 \
    --namespace "$AB_NAMESPACE" \
    --userId 'A9l4TgXA' \
    --additionalKey '6nLvwLqx' \
    --statCodes 'PFRAEBvG,zfv8x9lt,coiMgbaQ' \
    --tags 'p3XTTSna,5tiyCzwA,5ETcSHdO' \
    > test.out 2>&1
eval_tap $? 97 'PublicQueryUserStatItems2' test.out

#- 98 BulkUpdateUserStatItem2
./ng net.accelbyte.sdk.cli.Main social bulkUpdateUserStatItem2 \
    --namespace "$AB_NAMESPACE" \
    --userId 'vVBCHuHj' \
    --additionalKey 'NzBUgFAb' \
    --body '[{"additionalData": {"I2Ss6CGl": {}, "Th8IxMll": {}, "Reggkn0f": {}}, "statCode": "Fw3GSB3u", "updateStrategy": "OVERRIDE", "value": 0.5935441937314183}, {"additionalData": {"ctrZKpQa": {}, "PPUTkEFG": {}, "ONQtSq57": {}}, "statCode": "pQtJysHJ", "updateStrategy": "OVERRIDE", "value": 0.49254597217039453}, {"additionalData": {"gbqqurh1": {}, "JLiwa8yZ": {}, "6wfOOYj8": {}}, "statCode": "4c9JZ39n", "updateStrategy": "INCREMENT", "value": 0.08645128215192288}]' \
    > test.out 2>&1
eval_tap $? 98 'BulkUpdateUserStatItem2' test.out

#- 99 UpdateUserStatItemValue1
./ng net.accelbyte.sdk.cli.Main social updateUserStatItemValue1 \
    --namespace "$AB_NAMESPACE" \
    --statCode 'LppPupDM' \
    --userId 'aGhLpIip' \
    --additionalKey 'hBo6iE2a' \
    --body '{"additionalData": {"d9E2AshP": {}, "sk6Cn9gT": {}, "ZCEkjz7Q": {}}, "updateStrategy": "OVERRIDE", "value": 0.3251674897392881}' \
    > test.out 2>&1
eval_tap $? 99 'UpdateUserStatItemValue1' test.out


rm -f "tmp.dat"

exit $EXIT_CODE