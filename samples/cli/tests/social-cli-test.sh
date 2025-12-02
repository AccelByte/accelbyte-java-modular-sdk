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
    --limit '62' \
    --offset '35' \
    --statCodes 'fF1p66ik' \
    > test.out 2>&1
eval_tap $? 26 'GetGlobalStatItems' test.out

#- 27 GetGlobalStatItemByStatCode
./ng net.accelbyte.sdk.cli.Main social getGlobalStatItemByStatCode \
    --namespace "$AB_NAMESPACE" \
    --statCode '0p6U2kLo' \
    > test.out 2>&1
eval_tap $? 27 'GetGlobalStatItemByStatCode' test.out

#- 28 GetStatCycles
./ng net.accelbyte.sdk.cli.Main social getStatCycles \
    --namespace "$AB_NAMESPACE" \
    --cycleType 'SEASONAL' \
    --limit '87' \
    --name 'e53uVA5A' \
    --offset '87' \
    --sortBy 'pIAorIdj' \
    --status 'INIT' \
    > test.out 2>&1
eval_tap $? 28 'GetStatCycles' test.out

#- 29 CreateStatCycle
./ng net.accelbyte.sdk.cli.Main social createStatCycle \
    --namespace "$AB_NAMESPACE" \
    --body '{"cycleType": "DAILY", "description": "dkrjHwQR", "end": "1990-02-16T00:00:00Z", "id": "TGfRMcP8", "name": "HgEHMxQV", "resetDate": 91, "resetDay": 94, "resetMonth": 27, "resetTime": "oAL1S8Uq", "seasonPeriod": 14, "start": "1977-09-30T00:00:00Z"}' \
    > test.out 2>&1
eval_tap $? 29 'CreateStatCycle' test.out

#- 30 BulkGetStatCycle
./ng net.accelbyte.sdk.cli.Main social bulkGetStatCycle \
    --namespace "$AB_NAMESPACE" \
    --body '{"cycleIds": ["TnCa20KB", "nsrFzosO", "SktJzeDt"]}' \
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
    --cycleId '9LeydOhB' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 33 'GetStatCycle' test.out

#- 34 UpdateStatCycle
./ng net.accelbyte.sdk.cli.Main social updateStatCycle \
    --cycleId 'b6Ao6ws5' \
    --namespace "$AB_NAMESPACE" \
    --body '{"cycleType": "DAILY", "description": "7o0PsrVu", "end": "1985-11-22T00:00:00Z", "name": "kehR9sq5", "resetDate": 43, "resetDay": 8, "resetMonth": 24, "resetTime": "5Ype5Udb", "seasonPeriod": 48, "start": "1981-11-01T00:00:00Z"}' \
    > test.out 2>&1
eval_tap $? 34 'UpdateStatCycle' test.out

#- 35 DeleteStatCycle
./ng net.accelbyte.sdk.cli.Main social deleteStatCycle \
    --cycleId 'WtFTgmcE' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 35 'DeleteStatCycle' test.out

#- 36 BulkAddStats
./ng net.accelbyte.sdk.cli.Main social bulkAddStats \
    --cycleId 'bQjihocf' \
    --namespace "$AB_NAMESPACE" \
    --body '{"statCodes": ["16HaPieu", "9WF9pxHJ", "aQsv5j1t"]}' \
    > test.out 2>&1
eval_tap $? 36 'BulkAddStats' test.out

#- 37 StopStatCycle
./ng net.accelbyte.sdk.cli.Main social stopStatCycle \
    --cycleId 'jkLmvaFg' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 37 'StopStatCycle' test.out

#- 38 BulkFetchStatItems
./ng net.accelbyte.sdk.cli.Main social bulkFetchStatItems \
    --namespace "$AB_NAMESPACE" \
    --statCode 'buKGrVoi' \
    --userIds '7YDT6dAa' \
    > test.out 2>&1
eval_tap $? 38 'BulkFetchStatItems' test.out

#- 39 BulkIncUserStatItem
./ng net.accelbyte.sdk.cli.Main social bulkIncUserStatItem \
    --namespace "$AB_NAMESPACE" \
    --body '[{"inc": 0.6664270303789134, "statCode": "uqIQQceJ", "userId": "2DKeuYYn"}, {"inc": 0.5888085484102444, "statCode": "qsNrcioI", "userId": "yM3CjbI8"}, {"inc": 0.8431059116421259, "statCode": "TW5ifWuu", "userId": "7YCckm9I"}]' \
    > test.out 2>&1
eval_tap $? 39 'BulkIncUserStatItem' test.out

#- 40 BulkIncUserStatItemValue
./ng net.accelbyte.sdk.cli.Main social bulkIncUserStatItemValue \
    --namespace "$AB_NAMESPACE" \
    --body '[{"inc": 0.14855913153929523, "statCode": "VyTgdE4F", "userId": "Z6ci8NSn"}, {"inc": 0.10622429038405679, "statCode": "YRSAATte", "userId": "xCi8CiMU"}, {"inc": 0.1803696963311151, "statCode": "UZP6ueFp", "userId": "GfbQyYYR"}]' \
    > test.out 2>&1
eval_tap $? 40 'BulkIncUserStatItemValue' test.out

#- 41 BulkFetchOrDefaultStatItems
./ng net.accelbyte.sdk.cli.Main social bulkFetchOrDefaultStatItems \
    --namespace "$AB_NAMESPACE" \
    --statCode '3cJxKFbO' \
    --userIds 'M5arvxFN,UbV5NCPt,bnCy1oil' \
    > test.out 2>&1
eval_tap $? 41 'BulkFetchOrDefaultStatItems' test.out

#- 42 BulkResetUserStatItem
./ng net.accelbyte.sdk.cli.Main social bulkResetUserStatItem \
    --namespace "$AB_NAMESPACE" \
    --body '[{"statCode": "LkWJMBTj", "userId": "sixxDGaS"}, {"statCode": "hRLmglu1", "userId": "o2u352IQ"}, {"statCode": "Y9toq3dE", "userId": "sEcU3F8B"}]' \
    > test.out 2>&1
eval_tap $? 42 'BulkResetUserStatItem' test.out

#- 43 GetStats
./ng net.accelbyte.sdk.cli.Main social getStats \
    --namespace "$AB_NAMESPACE" \
    --cycleIds '5bom2rYG' \
    --isGlobal  \
    --isPublic  \
    --limit '90' \
    --offset '6' \
    > test.out 2>&1
eval_tap $? 43 'GetStats' test.out

#- 44 CreateStat
./ng net.accelbyte.sdk.cli.Main social createStat \
    --namespace "$AB_NAMESPACE" \
    --body '{"capCycleOverride": false, "cycleIds": ["IvJXWMGx", "FlIOZOdw", "gdlI7xL6"], "cycleOverrides": [{"cycleId": "MxVItUHZ", "maximum": 0.08887846064983063, "minimum": 0.1960245029177582}, {"cycleId": "P0hFSEex", "maximum": 0.6923073919222201, "minimum": 0.08619705136579325}, {"cycleId": "g0625ndX", "maximum": 0.2139135913383592, "minimum": 0.6170802750699778}], "defaultValue": 0.5827003457147046, "description": "ej4yg3Bp", "globalAggregationMethod": "MAX", "ignoreAdditionalDataOnValueRejected": false, "incrementOnly": true, "isPublic": true, "maximum": 0.9413449697076406, "minimum": 0.5183131643160581, "name": "plDtjSgC", "setAsGlobal": false, "setBy": "CLIENT", "statCode": "EJ4Sly8S", "tags": ["HlPvJ3Z2", "fcF1GfUe", "V2YZAEHb"], "visibility": "SHOWALL"}' \
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
    --limit '66' \
    --offset '67' \
    --keyword 'TgSoUmbs' \
    > test.out 2>&1
eval_tap $? 47 'QueryStats' test.out

#- 48 GetStat
./ng net.accelbyte.sdk.cli.Main social getStat \
    --namespace "$AB_NAMESPACE" \
    --statCode 'SmEBmTrv' \
    > test.out 2>&1
eval_tap $? 48 'GetStat' test.out

#- 49 DeleteStat
./ng net.accelbyte.sdk.cli.Main social deleteStat \
    --namespace "$AB_NAMESPACE" \
    --statCode 'w4tMRbcq' \
    > test.out 2>&1
eval_tap $? 49 'DeleteStat' test.out

#- 50 UpdateStat
./ng net.accelbyte.sdk.cli.Main social updateStat \
    --namespace "$AB_NAMESPACE" \
    --statCode 'c85Ggjye' \
    --body '{"capCycleOverride": false, "cycleIds": ["jGUmsHGM", "ne1IR4SR", "C182Zw3h"], "cycleOverrides": [{"cycleId": "UIMDFcP8", "maximum": 0.06897861325431642, "minimum": 0.15828502244125542}, {"cycleId": "lKQQ7nz1", "maximum": 0.17693700213956187, "minimum": 0.4820054233976596}, {"cycleId": "NblCjyKa", "maximum": 0.14726895134415707, "minimum": 0.46002516446784314}], "defaultValue": 0.9089175086282543, "description": "bEoGFg2R", "globalAggregationMethod": "TOTAL", "ignoreAdditionalDataOnValueRejected": true, "isPublic": false, "name": "bjKwG8Q1", "tags": ["Y21bmuAY", "TqN9Mw2v", "PTCO1RAg"], "visibility": "SERVERONLY"}' \
    > test.out 2>&1
eval_tap $? 50 'UpdateStat' test.out

#- 51 GetStatItems
./ng net.accelbyte.sdk.cli.Main social getStatItems \
    --namespace "$AB_NAMESPACE" \
    --statCode 'EA2SFLvF' \
    --limit '36' \
    --offset '0' \
    --sortBy 'rMfazOvj' \
    > test.out 2>&1
eval_tap $? 51 'GetStatItems' test.out

#- 52 DeleteTiedStat
./ng net.accelbyte.sdk.cli.Main social deleteTiedStat \
    --namespace "$AB_NAMESPACE" \
    --statCode '24v79EBO' \
    > test.out 2>&1
eval_tap $? 52 'DeleteTiedStat' test.out

#- 53 GetUserStatCycleItems
./ng net.accelbyte.sdk.cli.Main social getUserStatCycleItems \
    --cycleId 'zYckuQAa' \
    --namespace "$AB_NAMESPACE" \
    --userId '6g814JNs' \
    --isPublic  \
    --limit '75' \
    --offset '90' \
    --sortBy 'b0jN1Lt4' \
    --statCodes 'KjlqimNQ' \
    > test.out 2>&1
eval_tap $? 53 'GetUserStatCycleItems' test.out

#- 54 GetUserStatItems
./ng net.accelbyte.sdk.cli.Main social getUserStatItems \
    --namespace "$AB_NAMESPACE" \
    --userId 'ySC0jbeF' \
    --isPublic  \
    --limit '93' \
    --offset '87' \
    --sortBy 'IZp8XfSs' \
    --statCodes '5qWImDiA' \
    --tags 'xabRSB4Z' \
    > test.out 2>&1
eval_tap $? 54 'GetUserStatItems' test.out

#- 55 BulkCreateUserStatItems
./ng net.accelbyte.sdk.cli.Main social bulkCreateUserStatItems \
    --namespace "$AB_NAMESPACE" \
    --userId 'hcu8iILu' \
    --body '[{"statCode": "YlkKQ8bf"}, {"statCode": "MNSiAO4g"}, {"statCode": "S5u0ksZz"}]' \
    > test.out 2>&1
eval_tap $? 55 'BulkCreateUserStatItems' test.out

#- 56 BulkIncUserStatItem1
./ng net.accelbyte.sdk.cli.Main social bulkIncUserStatItem1 \
    --namespace "$AB_NAMESPACE" \
    --userId 'c8vKUfd3' \
    --body '[{"inc": 0.1843425039450015, "statCode": "qzDUkIXg"}, {"inc": 0.0003523073595697035, "statCode": "0jiSRvE6"}, {"inc": 0.3241579025978507, "statCode": "00JE2GRo"}]' \
    > test.out 2>&1
eval_tap $? 56 'BulkIncUserStatItem1' test.out

#- 57 BulkIncUserStatItemValue1
./ng net.accelbyte.sdk.cli.Main social bulkIncUserStatItemValue1 \
    --namespace "$AB_NAMESPACE" \
    --userId '9Y9r1fEe' \
    --body '[{"inc": 0.3275396596462926, "statCode": "BoyEY5CW"}, {"inc": 0.7457748796746466, "statCode": "wN8iSZCk"}, {"inc": 0.2964195572618811, "statCode": "Pu2uCmXp"}]' \
    > test.out 2>&1
eval_tap $? 57 'BulkIncUserStatItemValue1' test.out

#- 58 BulkResetUserStatItem1
./ng net.accelbyte.sdk.cli.Main social bulkResetUserStatItem1 \
    --namespace "$AB_NAMESPACE" \
    --userId 'BrGzmJSn' \
    --body '[{"statCode": "sIlhwqZN"}, {"statCode": "8aKtvA5j"}, {"statCode": "G2GOgmH3"}]' \
    > test.out 2>&1
eval_tap $? 58 'BulkResetUserStatItem1' test.out

#- 59 CreateUserStatItem
./ng net.accelbyte.sdk.cli.Main social createUserStatItem \
    --namespace "$AB_NAMESPACE" \
    --statCode '1V4an34t' \
    --userId 'NO8uHx5J' \
    > test.out 2>&1
eval_tap $? 59 'CreateUserStatItem' test.out

#- 60 DeleteUserStatItems
./ng net.accelbyte.sdk.cli.Main social deleteUserStatItems \
    --namespace "$AB_NAMESPACE" \
    --statCode 'j3ankeYx' \
    --userId 'fxP9432q' \
    > test.out 2>&1
eval_tap $? 60 'DeleteUserStatItems' test.out

#- 61 IncUserStatItemValue
./ng net.accelbyte.sdk.cli.Main social incUserStatItemValue \
    --namespace "$AB_NAMESPACE" \
    --statCode 'T8EKKpUV' \
    --userId 'j5gZPmQO' \
    --body '{"inc": 0.3271793370788493}' \
    > test.out 2>&1
eval_tap $? 61 'IncUserStatItemValue' test.out

#- 62 ResetUserStatItemValue
./ng net.accelbyte.sdk.cli.Main social resetUserStatItemValue \
    --namespace "$AB_NAMESPACE" \
    --statCode 'OPr9slKe' \
    --userId 'xBhvbfgK' \
    --additionalKey 'ompFyISY' \
    --body '{"additionalData": {"WUC2RoTB": {}, "STF0EzQn": {}, "SRZo7yRY": {}}}' \
    > test.out 2>&1
eval_tap $? 62 'ResetUserStatItemValue' test.out

#- 63 GetGlobalStatItems1
./ng net.accelbyte.sdk.cli.Main social getGlobalStatItems1 \
    --namespace "$AB_NAMESPACE" \
    --limit '4' \
    --offset '62' \
    --statCodes 'k6G2b3RU' \
    > test.out 2>&1
eval_tap $? 63 'GetGlobalStatItems1' test.out

#- 64 GetGlobalStatItemByStatCode1
./ng net.accelbyte.sdk.cli.Main social getGlobalStatItemByStatCode1 \
    --namespace "$AB_NAMESPACE" \
    --statCode 'mFnYuBJu' \
    > test.out 2>&1
eval_tap $? 64 'GetGlobalStatItemByStatCode1' test.out

#- 65 GetStatCycles1
./ng net.accelbyte.sdk.cli.Main social getStatCycles1 \
    --namespace "$AB_NAMESPACE" \
    --cycleType 'DAILY' \
    --limit '88' \
    --name 'Tu1pje5c' \
    --offset '41' \
    --sortBy 'hCODO8t3' \
    --status 'ACTIVE' \
    > test.out 2>&1
eval_tap $? 65 'GetStatCycles1' test.out

#- 66 BulkGetStatCycle1
./ng net.accelbyte.sdk.cli.Main social bulkGetStatCycle1 \
    --namespace "$AB_NAMESPACE" \
    --body '{"cycleIds": ["SJotRQ5o", "AEKCx4n3", "vnQ0BopL"]}' \
    > test.out 2>&1
eval_tap $? 66 'BulkGetStatCycle1' test.out

#- 67 GetStatCycle1
./ng net.accelbyte.sdk.cli.Main social getStatCycle1 \
    --cycleId 'QnC8dwNL' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 67 'GetStatCycle1' test.out

#- 68 BulkFetchStatItems1
./ng net.accelbyte.sdk.cli.Main social bulkFetchStatItems1 \
    --namespace "$AB_NAMESPACE" \
    --statCode '2URGc2MH' \
    --userIds 'E3ft3lTe' \
    > test.out 2>&1
eval_tap $? 68 'BulkFetchStatItems1' test.out

#- 69 PublicBulkIncUserStatItem
./ng net.accelbyte.sdk.cli.Main social publicBulkIncUserStatItem \
    --namespace "$AB_NAMESPACE" \
    --body '[{"inc": 0.012124728502829418, "statCode": "CeILlIwU", "userId": "iLd4DQud"}, {"inc": 0.805680134296174, "statCode": "uhCdyRXS", "userId": "Oij6Jo2z"}, {"inc": 0.21962257932697093, "statCode": "h5Y1PNGY", "userId": "yzwchph8"}]' \
    > test.out 2>&1
eval_tap $? 69 'PublicBulkIncUserStatItem' test.out

#- 70 PublicBulkIncUserStatItemValue
./ng net.accelbyte.sdk.cli.Main social publicBulkIncUserStatItemValue \
    --namespace "$AB_NAMESPACE" \
    --body '[{"inc": 0.9097712424259109, "statCode": "FfXSFEYG", "userId": "mCiNex9u"}, {"inc": 0.026116418885409942, "statCode": "wkNE6G3Q", "userId": "woQEbmhX"}, {"inc": 0.6215289582405893, "statCode": "XzLXbHXB", "userId": "NuEobZeF"}]' \
    > test.out 2>&1
eval_tap $? 70 'PublicBulkIncUserStatItemValue' test.out

#- 71 BulkResetUserStatItem2
./ng net.accelbyte.sdk.cli.Main social bulkResetUserStatItem2 \
    --namespace "$AB_NAMESPACE" \
    --body '[{"statCode": "PiotOcgM", "userId": "PnmoyVTg"}, {"statCode": "RiF5DZSS", "userId": "LlIGFENf"}, {"statCode": "TRIFfr44", "userId": "09Ge5ljf"}]' \
    > test.out 2>&1
eval_tap $? 71 'BulkResetUserStatItem2' test.out

#- 72 CreateStat1
./ng net.accelbyte.sdk.cli.Main social createStat1 \
    --namespace "$AB_NAMESPACE" \
    --body '{"capCycleOverride": true, "cycleIds": ["y19PQ13s", "6grx0Jvx", "kjwbi5X3"], "cycleOverrides": [{"cycleId": "o6LoEMw2", "maximum": 0.7832552621227388, "minimum": 0.052069318380166374}, {"cycleId": "OmkHKtKo", "maximum": 0.3984911046851226, "minimum": 0.5169927153117194}, {"cycleId": "X9Y9ydik", "maximum": 0.2609493431257405, "minimum": 0.319323389269336}], "defaultValue": 0.20760735108481965, "description": "gAv1hi02", "globalAggregationMethod": "TOTAL", "ignoreAdditionalDataOnValueRejected": false, "incrementOnly": false, "isPublic": true, "maximum": 0.10775773383423581, "minimum": 0.8502884151430109, "name": "3gbz5Jjm", "setAsGlobal": false, "setBy": "SERVER", "statCode": "OjqiLp7b", "tags": ["1CJA4kCH", "Uw0qpfIT", "BXn9NxBi"], "visibility": "SHOWALL"}' \
    > test.out 2>&1
eval_tap $? 72 'CreateStat1' test.out

#- 73 PublicListMyStatCycleItems
./ng net.accelbyte.sdk.cli.Main social publicListMyStatCycleItems \
    --cycleId 'GQBhHPQH' \
    --namespace "$AB_NAMESPACE" \
    --limit '36' \
    --offset '41' \
    --sortBy 'zM6IEvG6' \
    --statCodes '0nOyZBgK,4H3VDLgq,J6KJxQAm' \
    > test.out 2>&1
eval_tap $? 73 'PublicListMyStatCycleItems' test.out

#- 74 PublicListMyStatItems
./ng net.accelbyte.sdk.cli.Main social publicListMyStatItems \
    --namespace "$AB_NAMESPACE" \
    --limit '16' \
    --offset '94' \
    --sortBy 'S8CY6Ral' \
    --statCodes 'g1c8Gueq,XPZ5LecA,Yhu5ATuY' \
    --tags 'kb6eP8YO,KZvloycN,YsdrK6EX' \
    > test.out 2>&1
eval_tap $? 74 'PublicListMyStatItems' test.out

#- 75 PublicListAllMyStatItems
./ng net.accelbyte.sdk.cli.Main social publicListAllMyStatItems \
    --namespace "$AB_NAMESPACE" \
    --additionalKey 'qCGhiY1g' \
    --statCodes '1BMitfaM,hAcMOSnd,F1IycngV' \
    --tags '0O5CYIGA,GwaEVZPb,yxx9Pnl4' \
    > test.out 2>&1
eval_tap $? 75 'PublicListAllMyStatItems' test.out

#- 76 GetUserStatCycleItems1
./ng net.accelbyte.sdk.cli.Main social getUserStatCycleItems1 \
    --cycleId 'EH1I6FMC' \
    --namespace "$AB_NAMESPACE" \
    --userId '7NKSYxMZ' \
    --limit '70' \
    --offset '30' \
    --sortBy '3AUWvciq' \
    --statCodes 'FQ0PXhhR' \
    > test.out 2>&1
eval_tap $? 76 'GetUserStatCycleItems1' test.out

#- 77 PublicQueryUserStatItems1
./ng net.accelbyte.sdk.cli.Main social publicQueryUserStatItems1 \
    --namespace "$AB_NAMESPACE" \
    --userId 'jTVZshvH' \
    --limit '45' \
    --offset '31' \
    --sortBy 'lgGNQ8BT' \
    --statCodes 'keW6pU2b' \
    --tags 'wxOhu8T1' \
    > test.out 2>&1
eval_tap $? 77 'PublicQueryUserStatItems1' test.out

#- 78 PublicBulkCreateUserStatItems
./ng net.accelbyte.sdk.cli.Main social publicBulkCreateUserStatItems \
    --namespace "$AB_NAMESPACE" \
    --userId 's9VPXOCM' \
    --body '[{"statCode": "IDea4XP6"}, {"statCode": "fqhvcHEK"}, {"statCode": "bvrAVcNc"}]' \
    > test.out 2>&1
eval_tap $? 78 'PublicBulkCreateUserStatItems' test.out

#- 79 PublicQueryUserStatItems
./ng net.accelbyte.sdk.cli.Main social publicQueryUserStatItems \
    --namespace "$AB_NAMESPACE" \
    --userId 'LRMlprPg' \
    --additionalKey 'xuuVLsnG' \
    --statCodes 'BzUr82YW,YPEwlLvE,dAI7QFTY' \
    --tags 'c6NRnHP0,zAC7hIl1,IGxWHwAv' \
    > test.out 2>&1
eval_tap $? 79 'PublicQueryUserStatItems' test.out

#- 80 PublicBulkIncUserStatItem1
./ng net.accelbyte.sdk.cli.Main social publicBulkIncUserStatItem1 \
    --namespace "$AB_NAMESPACE" \
    --userId 'JJh1Usip' \
    --body '[{"inc": 0.7950615059134728, "statCode": "ArofKbGv"}, {"inc": 0.6392352981241326, "statCode": "zg3TNzVO"}, {"inc": 0.8838989271115081, "statCode": "OfsyqmgN"}]' \
    > test.out 2>&1
eval_tap $? 80 'PublicBulkIncUserStatItem1' test.out

#- 81 BulkIncUserStatItemValue2
./ng net.accelbyte.sdk.cli.Main social bulkIncUserStatItemValue2 \
    --namespace "$AB_NAMESPACE" \
    --userId 'e1ywiDhB' \
    --body '[{"inc": 0.859886404019865, "statCode": "JAkE9ncD"}, {"inc": 0.37438556773757836, "statCode": "ONsNHHVn"}, {"inc": 0.8779879604407907, "statCode": "sua5hLBY"}]' \
    > test.out 2>&1
eval_tap $? 81 'BulkIncUserStatItemValue2' test.out

#- 82 BulkResetUserStatItem3
./ng net.accelbyte.sdk.cli.Main social bulkResetUserStatItem3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'Hwn07fTk' \
    --body '[{"statCode": "cPXsJG1D"}, {"statCode": "gUWY7c1h"}, {"statCode": "yOgjcZxp"}]' \
    > test.out 2>&1
eval_tap $? 82 'BulkResetUserStatItem3' test.out

#- 83 PublicCreateUserStatItem
./ng net.accelbyte.sdk.cli.Main social publicCreateUserStatItem \
    --namespace "$AB_NAMESPACE" \
    --statCode 'pCDCGP14' \
    --userId 'EZoMxvfX' \
    > test.out 2>&1
eval_tap $? 83 'PublicCreateUserStatItem' test.out

#- 84 DeleteUserStatItems1
./ng net.accelbyte.sdk.cli.Main social deleteUserStatItems1 \
    --namespace "$AB_NAMESPACE" \
    --statCode 'FFhLE46t' \
    --userId '8OtLuku8' \
    > test.out 2>&1
eval_tap $? 84 'DeleteUserStatItems1' test.out

#- 85 PublicIncUserStatItem
./ng net.accelbyte.sdk.cli.Main social publicIncUserStatItem \
    --namespace "$AB_NAMESPACE" \
    --statCode 'N1ctrdTY' \
    --userId 'gebDwsVR' \
    --body '{"inc": 0.9836070623850183}' \
    > test.out 2>&1
eval_tap $? 85 'PublicIncUserStatItem' test.out

#- 86 PublicIncUserStatItemValue
./ng net.accelbyte.sdk.cli.Main social publicIncUserStatItemValue \
    --namespace "$AB_NAMESPACE" \
    --statCode 'tz0a71nn' \
    --userId 'VmyU0L1K' \
    --body '{"inc": 0.6784388861541073}' \
    > test.out 2>&1
eval_tap $? 86 'PublicIncUserStatItemValue' test.out

#- 87 ResetUserStatItemValue1
./ng net.accelbyte.sdk.cli.Main social resetUserStatItemValue1 \
    --namespace "$AB_NAMESPACE" \
    --statCode 'SHhzUhsn' \
    --userId 'Owd3cCjW' \
    > test.out 2>&1
eval_tap $? 87 'ResetUserStatItemValue1' test.out

#- 88 BulkUpdateUserStatItemV2
./ng net.accelbyte.sdk.cli.Main social bulkUpdateUserStatItemV2 \
    --namespace "$AB_NAMESPACE" \
    --body '[{"additionalData": {"Kpa4Zka5": {}, "MgQKs6LH": {}, "q3tMhulV": {}}, "additionalKey": "uKLeGqvc", "requestId": "776fa7HY", "statCode": "0EOxmYDu", "updateStrategy": "MIN", "userId": "XXenBpD1", "value": 0.6808511522097136}, {"additionalData": {"wTvg2RSY": {}, "PqFMrBAh": {}, "papxqYXh": {}}, "additionalKey": "igu8vghy", "requestId": "yG6PfEeR", "statCode": "uCX2aTnk", "updateStrategy": "OVERRIDE", "userId": "pnjqFLsa", "value": 0.05094828912015836}, {"additionalData": {"d6xdPBO6": {}, "klpjeYu9": {}, "dvcfNT0h": {}}, "additionalKey": "Z7U8lujc", "requestId": "XRYw3yoV", "statCode": "nkEkeL8F", "updateStrategy": "INCREMENT", "userId": "qIVn66PJ", "value": 0.5671915658768336}]' \
    > test.out 2>&1
eval_tap $? 88 'BulkUpdateUserStatItemV2' test.out

#- 89 BulkFetchOrDefaultStatItems1
./ng net.accelbyte.sdk.cli.Main social bulkFetchOrDefaultStatItems1 \
    --namespace "$AB_NAMESPACE" \
    --additionalKey 'ajYPkgoN' \
    --statCode 'UMVZDCH5' \
    --userIds 'B0tzlS7P,sAdbxZTG,4KJQDNBr' \
    > test.out 2>&1
eval_tap $? 89 'BulkFetchOrDefaultStatItems1' test.out

#- 90 AdminListUsersStatItems
./ng net.accelbyte.sdk.cli.Main social adminListUsersStatItems \
    --namespace "$AB_NAMESPACE" \
    --userId 'GQf9AmzS' \
    --additionalKey 'QDrXPnm1' \
    --statCodes 'qDkoNDa3,pxeptKMl,rLvMk0MI' \
    --tags 'EVtrjLfG,tc8XSdtx,OlA931HQ' \
    > test.out 2>&1
eval_tap $? 90 'AdminListUsersStatItems' test.out

#- 91 BulkUpdateUserStatItem
./ng net.accelbyte.sdk.cli.Main social bulkUpdateUserStatItem \
    --namespace "$AB_NAMESPACE" \
    --userId 'nVdw7nHj' \
    --additionalKey 'YzTsTbqS' \
    --body '[{"additionalData": {"E0t6izxW": {}, "79MgQp71": {}, "a5yVtRiW": {}}, "requestId": "byrgsta1", "statCode": "XlR97qpW", "updateStrategy": "MIN", "value": 0.4685810848011315}, {"additionalData": {"M8PrOc23": {}, "495n1M5F": {}, "poSluVGQ": {}}, "requestId": "hGKVwdAl", "statCode": "8I9kVllH", "updateStrategy": "MIN", "value": 0.4966467369439417}, {"additionalData": {"4MpGmFEi": {}, "8Xwf4FTM": {}, "k28lAS8o": {}}, "requestId": "J43fRhgz", "statCode": "YVzTIa8m", "updateStrategy": "INCREMENT", "value": 0.9963830863113993}]' \
    > test.out 2>&1
eval_tap $? 91 'BulkUpdateUserStatItem' test.out

#- 92 BulkGetOrDefaultByUserId
./ng net.accelbyte.sdk.cli.Main social bulkGetOrDefaultByUserId \
    --namespace "$AB_NAMESPACE" \
    --userId 'FOaF4H2x' \
    --additionalKey 'Eo3itFcP' \
    --body '{"statCodes": ["pitiJJ93", "00jr5bXv", "ndeDfDbR"]}' \
    > test.out 2>&1
eval_tap $? 92 'BulkGetOrDefaultByUserId' test.out

#- 93 BulkResetUserStatItemValues
./ng net.accelbyte.sdk.cli.Main social bulkResetUserStatItemValues \
    --namespace "$AB_NAMESPACE" \
    --userId 'iOwGbDby' \
    --additionalKey 'U7jTE4kQ' \
    --body '[{"additionalData": {"OoCpelbZ": {}, "3Giliveb": {}, "fzc59O5I": {}}, "statCode": "o32qkvgv"}, {"additionalData": {"9XuGg4D0": {}, "ufanaYwk": {}, "S6cFAR6E": {}}, "statCode": "5FDLitdb"}, {"additionalData": {"I5RTSVYc": {}, "IQzOKonX": {}, "4a2VbYWB": {}}, "statCode": "JqAoz2E5"}]' \
    > test.out 2>&1
eval_tap $? 93 'BulkResetUserStatItemValues' test.out

#- 94 DeleteUserStatItems2
./ng net.accelbyte.sdk.cli.Main social deleteUserStatItems2 \
    --namespace "$AB_NAMESPACE" \
    --statCode 'ifWnLNy3' \
    --userId '9geDQ9lp' \
    --additionalKey 'nBXwZUMd' \
    > test.out 2>&1
eval_tap $? 94 'DeleteUserStatItems2' test.out

#- 95 UpdateUserStatItemValue
./ng net.accelbyte.sdk.cli.Main social updateUserStatItemValue \
    --namespace "$AB_NAMESPACE" \
    --statCode 'YOkaulwB' \
    --userId 'YWjmjzV8' \
    --additionalKey 'T8JnLy7C' \
    --body '{"additionalData": {"jLj8b7KG": {}, "odCfZ6mM": {}, "5x6D4jUF": {}}, "updateStrategy": "OVERRIDE", "value": 0.6877024131205808}' \
    > test.out 2>&1
eval_tap $? 95 'UpdateUserStatItemValue' test.out

#- 96 BulkUpdateUserStatItem1
./ng net.accelbyte.sdk.cli.Main social bulkUpdateUserStatItem1 \
    --namespace "$AB_NAMESPACE" \
    --body '[{"additionalData": {"C7E31vLU": {}, "EJFHrmr0": {}, "HdjlPU9J": {}}, "additionalKey": "LPN87Vk2", "requestId": "yHMoX9IB", "statCode": "1A2Y3VKm", "updateStrategy": "MIN", "userId": "xkLIZS99", "value": 0.925245323287604}, {"additionalData": {"LpvzIemX": {}, "6Kizj7yX": {}, "fumrviIC": {}}, "additionalKey": "HIeYBIBA", "requestId": "8c2wcA8S", "statCode": "AuAtnPPr", "updateStrategy": "INCREMENT", "userId": "N3C2nCcr", "value": 0.5461639092674453}, {"additionalData": {"dhrc4sIt": {}, "5gKvI45o": {}, "uhMzrE45": {}}, "additionalKey": "rpTL5Uod", "requestId": "LNN1fqQp", "statCode": "XT3ukIrQ", "updateStrategy": "MIN", "userId": "52LyDZHr", "value": 0.04186303189296803}]' \
    > test.out 2>&1
eval_tap $? 96 'BulkUpdateUserStatItem1' test.out

#- 97 PublicQueryUserStatItems2
./ng net.accelbyte.sdk.cli.Main social publicQueryUserStatItems2 \
    --namespace "$AB_NAMESPACE" \
    --userId '5t9uwYV2' \
    --additionalKey 'W0jzNf05' \
    --statCodes 'Kq41bEpB,xFqDO48k,AZRfOSkE' \
    --tags 'gToN71vp,4KPsdYDz,Bd7U7aYe' \
    > test.out 2>&1
eval_tap $? 97 'PublicQueryUserStatItems2' test.out

#- 98 BulkUpdateUserStatItem2
./ng net.accelbyte.sdk.cli.Main social bulkUpdateUserStatItem2 \
    --namespace "$AB_NAMESPACE" \
    --userId 'Ec852YIx' \
    --additionalKey 'VVWmlO4z' \
    --body '[{"additionalData": {"Tl9w6rkO": {}, "Og6f7JJ2": {}, "ZfhcKsxb": {}}, "requestId": "PMUPBcU6", "statCode": "v0LhGXZ9", "updateStrategy": "MAX", "value": 0.9608991071370088}, {"additionalData": {"M3mqXxYO": {}, "djUY9ztW": {}, "2un3qLo9": {}}, "requestId": "Uh2H1rRG", "statCode": "6juvYKEQ", "updateStrategy": "INCREMENT", "value": 0.7560703067004044}, {"additionalData": {"UwibEnTw": {}, "RtkF9JQ0": {}, "Fz7CZaGo": {}}, "requestId": "V0cDanvr", "statCode": "xIZ1TGxD", "updateStrategy": "INCREMENT", "value": 0.9191538173548263}]' \
    > test.out 2>&1
eval_tap $? 98 'BulkUpdateUserStatItem2' test.out

#- 99 UpdateUserStatItemValue1
./ng net.accelbyte.sdk.cli.Main social updateUserStatItemValue1 \
    --namespace "$AB_NAMESPACE" \
    --statCode 'aWX5hSBq' \
    --userId 'G6yTO0NE' \
    --additionalKey 'Sc7trsSz' \
    --body '{"additionalData": {"k8NtpkIu": {}, "biFGJC3V": {}, "xmlXGXBa": {}}, "updateStrategy": "MIN", "value": 0.7618259137927231}' \
    > test.out 2>&1
eval_tap $? 99 'UpdateUserStatItemValue1' test.out


rm -f "tmp.dat"

exit $EXIT_CODE