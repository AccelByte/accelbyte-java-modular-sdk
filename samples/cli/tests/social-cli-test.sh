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
    --limit '25' \
    --offset '63' \
    --statCodes '7UjLubBI' \
    > test.out 2>&1
eval_tap $? 26 'GetGlobalStatItems' test.out

#- 27 GetGlobalStatItemByStatCode
./ng net.accelbyte.sdk.cli.Main social getGlobalStatItemByStatCode \
    --namespace "$AB_NAMESPACE" \
    --statCode 'hILWA9GV' \
    > test.out 2>&1
eval_tap $? 27 'GetGlobalStatItemByStatCode' test.out

#- 28 GetStatCycles
./ng net.accelbyte.sdk.cli.Main social getStatCycles \
    --namespace "$AB_NAMESPACE" \
    --cycleType 'ANNUALLY' \
    --limit '92' \
    --name 'cJi0ntGK' \
    --offset '73' \
    --sortBy 'NLCuUsSq' \
    --status 'STOPPED' \
    > test.out 2>&1
eval_tap $? 28 'GetStatCycles' test.out

#- 29 CreateStatCycle
./ng net.accelbyte.sdk.cli.Main social createStatCycle \
    --namespace "$AB_NAMESPACE" \
    --body '{"cycleType": "MONTHLY", "description": "nuSzVFxm", "end": "1972-09-21T00:00:00Z", "id": "TORJFrDw", "name": "zs3v5ntP", "resetDate": 27, "resetDay": 20, "resetMonth": 55, "resetTime": "BKRIGtTE", "seasonPeriod": 74, "start": "1977-08-13T00:00:00Z"}' \
    > test.out 2>&1
eval_tap $? 29 'CreateStatCycle' test.out

#- 30 BulkGetStatCycle
./ng net.accelbyte.sdk.cli.Main social bulkGetStatCycle \
    --namespace "$AB_NAMESPACE" \
    --body '{"cycleIds": ["K6gBkt51", "DNaG3pPU", "OilnfJtv"]}' \
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
    --cycleId 'C64oE84w' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 33 'GetStatCycle' test.out

#- 34 UpdateStatCycle
./ng net.accelbyte.sdk.cli.Main social updateStatCycle \
    --cycleId 'kyOeo4eA' \
    --namespace "$AB_NAMESPACE" \
    --body '{"cycleType": "DAILY", "description": "mUdc4cVU", "end": "1996-08-09T00:00:00Z", "name": "KyHubkLR", "resetDate": 0, "resetDay": 7, "resetMonth": 20, "resetTime": "m1JQM1SM", "seasonPeriod": 98, "start": "1992-10-13T00:00:00Z"}' \
    > test.out 2>&1
eval_tap $? 34 'UpdateStatCycle' test.out

#- 35 DeleteStatCycle
./ng net.accelbyte.sdk.cli.Main social deleteStatCycle \
    --cycleId 'wMEtvnA2' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 35 'DeleteStatCycle' test.out

#- 36 BulkAddStats
./ng net.accelbyte.sdk.cli.Main social bulkAddStats \
    --cycleId '9shFNnKj' \
    --namespace "$AB_NAMESPACE" \
    --body '{"statCodes": ["WVi6ghx7", "HUy9eddd", "hI5HyLdQ"]}' \
    > test.out 2>&1
eval_tap $? 36 'BulkAddStats' test.out

#- 37 StopStatCycle
./ng net.accelbyte.sdk.cli.Main social stopStatCycle \
    --cycleId 'PerUFbNr' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 37 'StopStatCycle' test.out

#- 38 BulkFetchStatItems
./ng net.accelbyte.sdk.cli.Main social bulkFetchStatItems \
    --namespace "$AB_NAMESPACE" \
    --statCode 'ttiLNQi3' \
    --userIds 'FMQHtFid' \
    > test.out 2>&1
eval_tap $? 38 'BulkFetchStatItems' test.out

#- 39 BulkIncUserStatItem
./ng net.accelbyte.sdk.cli.Main social bulkIncUserStatItem \
    --namespace "$AB_NAMESPACE" \
    --body '[{"inc": 0.12823245389857285, "statCode": "TPsRbCLT", "userId": "ck8RKtVS"}, {"inc": 0.42584350133692095, "statCode": "g1sNdTjS", "userId": "B2jcMHv1"}, {"inc": 0.6290774180268237, "statCode": "YiE02uv7", "userId": "acUSqqRT"}]' \
    > test.out 2>&1
eval_tap $? 39 'BulkIncUserStatItem' test.out

#- 40 BulkIncUserStatItemValue
./ng net.accelbyte.sdk.cli.Main social bulkIncUserStatItemValue \
    --namespace "$AB_NAMESPACE" \
    --body '[{"inc": 0.24169526410881192, "statCode": "NRuH7KHT", "userId": "wyumEPxV"}, {"inc": 0.9343483462402653, "statCode": "3pSQ7BdW", "userId": "QgnItyP2"}, {"inc": 0.657341741596073, "statCode": "GiPG6dyO", "userId": "xcAwoUO0"}]' \
    > test.out 2>&1
eval_tap $? 40 'BulkIncUserStatItemValue' test.out

#- 41 BulkFetchOrDefaultStatItems
./ng net.accelbyte.sdk.cli.Main social bulkFetchOrDefaultStatItems \
    --namespace "$AB_NAMESPACE" \
    --statCode 'uceQT2O3' \
    --userIds 'LxmB2ptL,EPIvGiPp,U03APArk' \
    > test.out 2>&1
eval_tap $? 41 'BulkFetchOrDefaultStatItems' test.out

#- 42 BulkResetUserStatItem
./ng net.accelbyte.sdk.cli.Main social bulkResetUserStatItem \
    --namespace "$AB_NAMESPACE" \
    --body '[{"statCode": "nqbKq7JZ", "userId": "NRhrAcwc"}, {"statCode": "CsGssz2d", "userId": "0HW4cEhe"}, {"statCode": "NxMXM3FD", "userId": "tM77ldrW"}]' \
    > test.out 2>&1
eval_tap $? 42 'BulkResetUserStatItem' test.out

#- 43 GetStats
./ng net.accelbyte.sdk.cli.Main social getStats \
    --namespace "$AB_NAMESPACE" \
    --cycleIds '4UtAVfo8' \
    --isGlobal  \
    --isPublic  \
    --limit '97' \
    --offset '70' \
    > test.out 2>&1
eval_tap $? 43 'GetStats' test.out

#- 44 CreateStat
./ng net.accelbyte.sdk.cli.Main social createStat \
    --namespace "$AB_NAMESPACE" \
    --body '{"capCycleOverride": false, "cycleIds": ["Upl5UEsk", "MsXUto86", "ShkVY441"], "cycleOverrides": [{"cycleId": "40GvZok0", "maximum": 0.5177563394690397, "minimum": 0.711801753459066}, {"cycleId": "P4fu5aLU", "maximum": 0.6014159305712274, "minimum": 0.02785795470648189}, {"cycleId": "2O72YSBt", "maximum": 0.8532544230155, "minimum": 0.6780028300398719}], "defaultValue": 0.43913050924749963, "description": "iNOl8dny", "globalAggregationMethod": "TOTAL", "ignoreAdditionalDataOnValueRejected": true, "incrementOnly": false, "isPublic": false, "maximum": 0.7241668093606957, "minimum": 0.41723766308400634, "name": "pL1thkuE", "setAsGlobal": false, "setBy": "SERVER", "statCode": "l1SGIixU", "tags": ["SITjVroT", "L5iQZbnd", "JKlMmxSb"], "visibility": "SERVERONLY"}' \
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
    --limit '19' \
    --offset '71' \
    --keyword 'Me8sG5sU' \
    > test.out 2>&1
eval_tap $? 47 'QueryStats' test.out

#- 48 GetStat
./ng net.accelbyte.sdk.cli.Main social getStat \
    --namespace "$AB_NAMESPACE" \
    --statCode 'vVR0rJjO' \
    > test.out 2>&1
eval_tap $? 48 'GetStat' test.out

#- 49 DeleteStat
./ng net.accelbyte.sdk.cli.Main social deleteStat \
    --namespace "$AB_NAMESPACE" \
    --statCode 'Wq0ORNyN' \
    > test.out 2>&1
eval_tap $? 49 'DeleteStat' test.out

#- 50 UpdateStat
./ng net.accelbyte.sdk.cli.Main social updateStat \
    --namespace "$AB_NAMESPACE" \
    --statCode '3zAOu30K' \
    --body '{"capCycleOverride": true, "cycleIds": ["xhZKsHnJ", "stA9RkAP", "6bcv8iGZ"], "cycleOverrides": [{"cycleId": "WYIk0y3M", "maximum": 0.7881019923050442, "minimum": 0.9972656277452702}, {"cycleId": "g5LdDHlb", "maximum": 0.7604931724692857, "minimum": 0.2588583576527663}, {"cycleId": "tkLQFDbi", "maximum": 0.7658285129049687, "minimum": 0.16827651219684514}], "defaultValue": 0.9915288634083091, "description": "wEN68XCP", "globalAggregationMethod": "MIN", "ignoreAdditionalDataOnValueRejected": false, "isPublic": false, "name": "LIPAZUWV", "tags": ["4Ia8T69T", "TOOTby6H", "7edh7Xjc"], "visibility": "SERVERONLY"}' \
    > test.out 2>&1
eval_tap $? 50 'UpdateStat' test.out

#- 51 GetStatItems
./ng net.accelbyte.sdk.cli.Main social getStatItems \
    --namespace "$AB_NAMESPACE" \
    --statCode 'JZZC98NB' \
    --limit '0' \
    --offset '62' \
    --sortBy 'LnrievMz' \
    > test.out 2>&1
eval_tap $? 51 'GetStatItems' test.out

#- 52 DeleteTiedStat
./ng net.accelbyte.sdk.cli.Main social deleteTiedStat \
    --namespace "$AB_NAMESPACE" \
    --statCode 'SHafwaOU' \
    > test.out 2>&1
eval_tap $? 52 'DeleteTiedStat' test.out

#- 53 GetUserStatCycleItems
./ng net.accelbyte.sdk.cli.Main social getUserStatCycleItems \
    --cycleId 'Cnu6kht6' \
    --namespace "$AB_NAMESPACE" \
    --userId 'DXfyHGw1' \
    --isPublic  \
    --limit '58' \
    --offset '49' \
    --sortBy '8JMvQbbS' \
    --statCodes 'R5MQ4gkB' \
    > test.out 2>&1
eval_tap $? 53 'GetUserStatCycleItems' test.out

#- 54 GetUserStatItems
./ng net.accelbyte.sdk.cli.Main social getUserStatItems \
    --namespace "$AB_NAMESPACE" \
    --userId 'wz47iSyX' \
    --isPublic  \
    --limit '66' \
    --offset '9' \
    --sortBy 'JItFEIrh' \
    --statCodes '6AMEYWdM' \
    --tags 'SRBLYyMq' \
    > test.out 2>&1
eval_tap $? 54 'GetUserStatItems' test.out

#- 55 BulkCreateUserStatItems
./ng net.accelbyte.sdk.cli.Main social bulkCreateUserStatItems \
    --namespace "$AB_NAMESPACE" \
    --userId '0mB7jejU' \
    --body '[{"statCode": "sRPn1ZG8"}, {"statCode": "Xtdj6YRQ"}, {"statCode": "AeUftHZC"}]' \
    > test.out 2>&1
eval_tap $? 55 'BulkCreateUserStatItems' test.out

#- 56 BulkIncUserStatItem1
./ng net.accelbyte.sdk.cli.Main social bulkIncUserStatItem1 \
    --namespace "$AB_NAMESPACE" \
    --userId 'kEJ5yEqe' \
    --body '[{"inc": 0.1424113451888599, "statCode": "NgopzePq"}, {"inc": 0.9671035152109299, "statCode": "9sCDo0QW"}, {"inc": 0.3776608275250659, "statCode": "0FLREfdg"}]' \
    > test.out 2>&1
eval_tap $? 56 'BulkIncUserStatItem1' test.out

#- 57 BulkIncUserStatItemValue1
./ng net.accelbyte.sdk.cli.Main social bulkIncUserStatItemValue1 \
    --namespace "$AB_NAMESPACE" \
    --userId 'XK4u0uPY' \
    --body '[{"inc": 0.03489592662008312, "statCode": "guiyEXBK"}, {"inc": 0.8525488142604765, "statCode": "4SLG2xXt"}, {"inc": 0.40363882397975226, "statCode": "bSCa2Vew"}]' \
    > test.out 2>&1
eval_tap $? 57 'BulkIncUserStatItemValue1' test.out

#- 58 BulkResetUserStatItem1
./ng net.accelbyte.sdk.cli.Main social bulkResetUserStatItem1 \
    --namespace "$AB_NAMESPACE" \
    --userId 'Duwum1p5' \
    --body '[{"statCode": "OUVdPiRG"}, {"statCode": "DxHmJjAB"}, {"statCode": "tKUSkO2I"}]' \
    > test.out 2>&1
eval_tap $? 58 'BulkResetUserStatItem1' test.out

#- 59 CreateUserStatItem
./ng net.accelbyte.sdk.cli.Main social createUserStatItem \
    --namespace "$AB_NAMESPACE" \
    --statCode 'Q9jEEDpO' \
    --userId 'c5wjMkcD' \
    > test.out 2>&1
eval_tap $? 59 'CreateUserStatItem' test.out

#- 60 DeleteUserStatItems
./ng net.accelbyte.sdk.cli.Main social deleteUserStatItems \
    --namespace "$AB_NAMESPACE" \
    --statCode 'ybsqOSLd' \
    --userId 'w5Q2BYeT' \
    > test.out 2>&1
eval_tap $? 60 'DeleteUserStatItems' test.out

#- 61 IncUserStatItemValue
./ng net.accelbyte.sdk.cli.Main social incUserStatItemValue \
    --namespace "$AB_NAMESPACE" \
    --statCode 'SnEefxOA' \
    --userId 'D9JGaMH5' \
    --body '{"inc": 0.21227507116954136}' \
    > test.out 2>&1
eval_tap $? 61 'IncUserStatItemValue' test.out

#- 62 ResetUserStatItemValue
./ng net.accelbyte.sdk.cli.Main social resetUserStatItemValue \
    --namespace "$AB_NAMESPACE" \
    --statCode 'CcvZx5gf' \
    --userId 'UUssGnBC' \
    --additionalKey 'YaW9u0CS' \
    --body '{"additionalData": {"g86jhf44": {}, "99RY4Kq7": {}, "kTaUkARw": {}}}' \
    > test.out 2>&1
eval_tap $? 62 'ResetUserStatItemValue' test.out

#- 63 GetGlobalStatItems1
./ng net.accelbyte.sdk.cli.Main social getGlobalStatItems1 \
    --namespace "$AB_NAMESPACE" \
    --limit '8' \
    --offset '23' \
    --statCodes 'jRTs4JGs' \
    > test.out 2>&1
eval_tap $? 63 'GetGlobalStatItems1' test.out

#- 64 GetGlobalStatItemByStatCode1
./ng net.accelbyte.sdk.cli.Main social getGlobalStatItemByStatCode1 \
    --namespace "$AB_NAMESPACE" \
    --statCode 'Z7s97I2g' \
    > test.out 2>&1
eval_tap $? 64 'GetGlobalStatItemByStatCode1' test.out

#- 65 GetStatCycles1
./ng net.accelbyte.sdk.cli.Main social getStatCycles1 \
    --namespace "$AB_NAMESPACE" \
    --cycleType 'DAILY' \
    --limit '71' \
    --name 'o90A9hLX' \
    --offset '78' \
    --sortBy 'esAoNvgi' \
    --status 'STOPPED' \
    > test.out 2>&1
eval_tap $? 65 'GetStatCycles1' test.out

#- 66 BulkGetStatCycle1
./ng net.accelbyte.sdk.cli.Main social bulkGetStatCycle1 \
    --namespace "$AB_NAMESPACE" \
    --body '{"cycleIds": ["eEQpTYqb", "IbBVgZMt", "4R5DzGMy"]}' \
    > test.out 2>&1
eval_tap $? 66 'BulkGetStatCycle1' test.out

#- 67 GetStatCycle1
./ng net.accelbyte.sdk.cli.Main social getStatCycle1 \
    --cycleId 'OTwbLPWa' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 67 'GetStatCycle1' test.out

#- 68 BulkFetchStatItems1
./ng net.accelbyte.sdk.cli.Main social bulkFetchStatItems1 \
    --namespace "$AB_NAMESPACE" \
    --statCode 'MTecunkH' \
    --userIds 'CPuan2KC' \
    > test.out 2>&1
eval_tap $? 68 'BulkFetchStatItems1' test.out

#- 69 PublicBulkIncUserStatItem
./ng net.accelbyte.sdk.cli.Main social publicBulkIncUserStatItem \
    --namespace "$AB_NAMESPACE" \
    --body '[{"inc": 0.39726269477018106, "statCode": "N8iGd6dN", "userId": "Pbt6ukKJ"}, {"inc": 0.7946405629721891, "statCode": "btQT9oPL", "userId": "QaEdOUZb"}, {"inc": 0.2712369334335315, "statCode": "K7A6jOdG", "userId": "mHfu1dPN"}]' \
    > test.out 2>&1
eval_tap $? 69 'PublicBulkIncUserStatItem' test.out

#- 70 PublicBulkIncUserStatItemValue
./ng net.accelbyte.sdk.cli.Main social publicBulkIncUserStatItemValue \
    --namespace "$AB_NAMESPACE" \
    --body '[{"inc": 0.2827984068042694, "statCode": "gFkNaQaU", "userId": "L4XOugF2"}, {"inc": 0.2990147696743497, "statCode": "oVTSKW8S", "userId": "9feF7EfM"}, {"inc": 0.7581277646938009, "statCode": "NxGKXkRe", "userId": "615nb5pA"}]' \
    > test.out 2>&1
eval_tap $? 70 'PublicBulkIncUserStatItemValue' test.out

#- 71 BulkResetUserStatItem2
./ng net.accelbyte.sdk.cli.Main social bulkResetUserStatItem2 \
    --namespace "$AB_NAMESPACE" \
    --body '[{"statCode": "5gF4wPvd", "userId": "1kgDQaHJ"}, {"statCode": "5a276grI", "userId": "jfFla1Xk"}, {"statCode": "nHkNzxaH", "userId": "nHonAoWR"}]' \
    > test.out 2>&1
eval_tap $? 71 'BulkResetUserStatItem2' test.out

#- 72 CreateStat1
./ng net.accelbyte.sdk.cli.Main social createStat1 \
    --namespace "$AB_NAMESPACE" \
    --body '{"capCycleOverride": false, "cycleIds": ["Opv3LVDj", "1flEOQhF", "Ep0dtMkT"], "cycleOverrides": [{"cycleId": "SgGZVHa9", "maximum": 0.6846894605544958, "minimum": 0.24686244023160897}, {"cycleId": "yyaP2qrC", "maximum": 0.6330650389733313, "minimum": 0.08727030700980465}, {"cycleId": "Ar56fu52", "maximum": 0.5270337831536964, "minimum": 0.47617348499560275}], "defaultValue": 0.42305322808958834, "description": "EW3N1fw9", "globalAggregationMethod": "MAX", "ignoreAdditionalDataOnValueRejected": false, "incrementOnly": false, "isPublic": true, "maximum": 0.862302010013291, "minimum": 0.9303320536586095, "name": "rFpeXBg9", "setAsGlobal": false, "setBy": "CLIENT", "statCode": "mdg5PEsS", "tags": ["RMxoXP1U", "OzrXXF1U", "KMXxIm4W"], "visibility": "SERVERONLY"}' \
    > test.out 2>&1
eval_tap $? 72 'CreateStat1' test.out

#- 73 PublicListMyStatCycleItems
./ng net.accelbyte.sdk.cli.Main social publicListMyStatCycleItems \
    --cycleId 'SIKd1Wh3' \
    --namespace "$AB_NAMESPACE" \
    --limit '1' \
    --offset '12' \
    --sortBy 'Bx6nTABK' \
    --statCodes 'unpU9C0B,Zh6zdGw2,KjP6ezZp' \
    > test.out 2>&1
eval_tap $? 73 'PublicListMyStatCycleItems' test.out

#- 74 PublicListMyStatItems
./ng net.accelbyte.sdk.cli.Main social publicListMyStatItems \
    --namespace "$AB_NAMESPACE" \
    --limit '83' \
    --offset '73' \
    --sortBy 'XTX3s2U2' \
    --statCodes 'UM42v1pR,XTkcbizw,HS2ySztM' \
    --tags 'TuOUvRxm,IaNI3feV,VztGzqvG' \
    > test.out 2>&1
eval_tap $? 74 'PublicListMyStatItems' test.out

#- 75 PublicListAllMyStatItems
./ng net.accelbyte.sdk.cli.Main social publicListAllMyStatItems \
    --namespace "$AB_NAMESPACE" \
    --additionalKey 'vl4dphtb' \
    --statCodes 'ghlGYCYA,iVf4b4nW,U5obpIO9' \
    --tags 'DWLhEWM6,dDJ2CSLm,leG4WojD' \
    > test.out 2>&1
eval_tap $? 75 'PublicListAllMyStatItems' test.out

#- 76 GetUserStatCycleItems1
./ng net.accelbyte.sdk.cli.Main social getUserStatCycleItems1 \
    --cycleId 'zdTD8rHv' \
    --namespace "$AB_NAMESPACE" \
    --userId 'zXEP6bJU' \
    --limit '83' \
    --offset '76' \
    --sortBy 'MXbzWG8I' \
    --statCodes 'gOJl5nGv' \
    > test.out 2>&1
eval_tap $? 76 'GetUserStatCycleItems1' test.out

#- 77 PublicQueryUserStatItems1
./ng net.accelbyte.sdk.cli.Main social publicQueryUserStatItems1 \
    --namespace "$AB_NAMESPACE" \
    --userId 'igToJn5E' \
    --limit '35' \
    --offset '42' \
    --sortBy 'fLkxkCp5' \
    --statCodes '4g4JrUA9' \
    --tags 'sSJvzSs0' \
    > test.out 2>&1
eval_tap $? 77 'PublicQueryUserStatItems1' test.out

#- 78 PublicBulkCreateUserStatItems
./ng net.accelbyte.sdk.cli.Main social publicBulkCreateUserStatItems \
    --namespace "$AB_NAMESPACE" \
    --userId 'f6VXrma9' \
    --body '[{"statCode": "ou9cDBjI"}, {"statCode": "3GIyhVoT"}, {"statCode": "ePCmbOlJ"}]' \
    > test.out 2>&1
eval_tap $? 78 'PublicBulkCreateUserStatItems' test.out

#- 79 PublicQueryUserStatItems
./ng net.accelbyte.sdk.cli.Main social publicQueryUserStatItems \
    --namespace "$AB_NAMESPACE" \
    --userId '6rn3MD4J' \
    --additionalKey 'T0Ecervy' \
    --statCodes 'y8G8rVdV,qeSl8CmQ,4uhf3HWM' \
    --tags 'jhjCM5pj,Hsg1lLcB,NFYvMiUl' \
    > test.out 2>&1
eval_tap $? 79 'PublicQueryUserStatItems' test.out

#- 80 PublicBulkIncUserStatItem1
./ng net.accelbyte.sdk.cli.Main social publicBulkIncUserStatItem1 \
    --namespace "$AB_NAMESPACE" \
    --userId 'jPwwCAdZ' \
    --body '[{"inc": 0.16733680075662372, "statCode": "iaGnjCNj"}, {"inc": 0.9369247781540542, "statCode": "M86YJS40"}, {"inc": 0.1337195437825096, "statCode": "C7yv5iJD"}]' \
    > test.out 2>&1
eval_tap $? 80 'PublicBulkIncUserStatItem1' test.out

#- 81 BulkIncUserStatItemValue2
./ng net.accelbyte.sdk.cli.Main social bulkIncUserStatItemValue2 \
    --namespace "$AB_NAMESPACE" \
    --userId 'EeIhNSmh' \
    --body '[{"inc": 0.5595370727138478, "statCode": "ZhsSzlHN"}, {"inc": 0.918101918384545, "statCode": "aBO8kWqK"}, {"inc": 0.9939091522162968, "statCode": "p5jRNHmG"}]' \
    > test.out 2>&1
eval_tap $? 81 'BulkIncUserStatItemValue2' test.out

#- 82 BulkResetUserStatItem3
./ng net.accelbyte.sdk.cli.Main social bulkResetUserStatItem3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'vPhmoZp4' \
    --body '[{"statCode": "OIhJUoqE"}, {"statCode": "QwsL1oGr"}, {"statCode": "ibXdNa28"}]' \
    > test.out 2>&1
eval_tap $? 82 'BulkResetUserStatItem3' test.out

#- 83 PublicCreateUserStatItem
./ng net.accelbyte.sdk.cli.Main social publicCreateUserStatItem \
    --namespace "$AB_NAMESPACE" \
    --statCode 'c9JQ8Z8X' \
    --userId 'QM7KO2mb' \
    > test.out 2>&1
eval_tap $? 83 'PublicCreateUserStatItem' test.out

#- 84 DeleteUserStatItems1
./ng net.accelbyte.sdk.cli.Main social deleteUserStatItems1 \
    --namespace "$AB_NAMESPACE" \
    --statCode 'Os68ZECg' \
    --userId 'RtoPXTfc' \
    > test.out 2>&1
eval_tap $? 84 'DeleteUserStatItems1' test.out

#- 85 PublicIncUserStatItem
./ng net.accelbyte.sdk.cli.Main social publicIncUserStatItem \
    --namespace "$AB_NAMESPACE" \
    --statCode '6AIPEmzU' \
    --userId 'ppsrpMGu' \
    --body '{"inc": 0.2471148914259056}' \
    > test.out 2>&1
eval_tap $? 85 'PublicIncUserStatItem' test.out

#- 86 PublicIncUserStatItemValue
./ng net.accelbyte.sdk.cli.Main social publicIncUserStatItemValue \
    --namespace "$AB_NAMESPACE" \
    --statCode '66pSt0QE' \
    --userId 'yu8rJGcB' \
    --body '{"inc": 0.6573908442193309}' \
    > test.out 2>&1
eval_tap $? 86 'PublicIncUserStatItemValue' test.out

#- 87 ResetUserStatItemValue1
./ng net.accelbyte.sdk.cli.Main social resetUserStatItemValue1 \
    --namespace "$AB_NAMESPACE" \
    --statCode 'i0vkLq9C' \
    --userId '5N1mX6pq' \
    > test.out 2>&1
eval_tap $? 87 'ResetUserStatItemValue1' test.out

#- 88 BulkUpdateUserStatItemV2
./ng net.accelbyte.sdk.cli.Main social bulkUpdateUserStatItemV2 \
    --namespace "$AB_NAMESPACE" \
    --body '[{"additionalData": {"GyoE0Piv": {}, "WJBzH96f": {}, "17xi0LZa": {}}, "additionalKey": "60JFm0PN", "statCode": "SCOiG2Rr", "updateStrategy": "MIN", "userId": "T5Tr9d4G", "value": 0.21139875886951132}, {"additionalData": {"TkKwjMEo": {}, "PDoEAbfQ": {}, "Yd4BGAoP": {}}, "additionalKey": "FSz65meO", "statCode": "8ITgkC8h", "updateStrategy": "MAX", "userId": "z5Exxw76", "value": 0.86511047264428}, {"additionalData": {"hQOI2pmZ": {}, "q4Ki6j9Q": {}, "WjDmF3q8": {}}, "additionalKey": "vUhBeOAD", "statCode": "hX4LAnfM", "updateStrategy": "MIN", "userId": "NACRHvaB", "value": 0.45842636702099626}]' \
    > test.out 2>&1
eval_tap $? 88 'BulkUpdateUserStatItemV2' test.out

#- 89 BulkFetchOrDefaultStatItems1
./ng net.accelbyte.sdk.cli.Main social bulkFetchOrDefaultStatItems1 \
    --namespace "$AB_NAMESPACE" \
    --additionalKey 'uLhRN8M9' \
    --statCode '9vhqxZcD' \
    --userIds '5ud5MASe,galCvQYi,es5MeK1B' \
    > test.out 2>&1
eval_tap $? 89 'BulkFetchOrDefaultStatItems1' test.out

#- 90 AdminListUsersStatItems
./ng net.accelbyte.sdk.cli.Main social adminListUsersStatItems \
    --namespace "$AB_NAMESPACE" \
    --userId 'WKGJ7UUu' \
    --additionalKey '2Mic56O7' \
    --statCodes '35p8EGtv,tDPa7sKn,wU4AH0sq' \
    --tags 'DnIJnyuk,aQnMtYmF,oI5CDq71' \
    > test.out 2>&1
eval_tap $? 90 'AdminListUsersStatItems' test.out

#- 91 BulkUpdateUserStatItem
./ng net.accelbyte.sdk.cli.Main social bulkUpdateUserStatItem \
    --namespace "$AB_NAMESPACE" \
    --userId 'pGzE3XE2' \
    --additionalKey 'jKovChRv' \
    --body '[{"additionalData": {"J8ClInyQ": {}, "YBqknrJQ": {}, "c8hrzELA": {}}, "statCode": "Rcou9jO5", "updateStrategy": "MIN", "value": 0.8685264334673803}, {"additionalData": {"WCLXAIPU": {}, "9lEyJoy8": {}, "iGb5H4N3": {}}, "statCode": "YPZuZ1kb", "updateStrategy": "MIN", "value": 0.5126153014091394}, {"additionalData": {"6MLkErdG": {}, "ry6G63sQ": {}, "WY4QDYWv": {}}, "statCode": "ySnCkbKP", "updateStrategy": "OVERRIDE", "value": 0.36536248741002286}]' \
    > test.out 2>&1
eval_tap $? 91 'BulkUpdateUserStatItem' test.out

#- 92 BulkGetOrDefaultByUserId
./ng net.accelbyte.sdk.cli.Main social bulkGetOrDefaultByUserId \
    --namespace "$AB_NAMESPACE" \
    --userId 'HPG2kGoi' \
    --additionalKey 'uu8OsTOq' \
    --body '{"statCodes": ["SMmHJm3x", "mlxznxYQ", "AArSdaVW"]}' \
    > test.out 2>&1
eval_tap $? 92 'BulkGetOrDefaultByUserId' test.out

#- 93 BulkResetUserStatItemValues
./ng net.accelbyte.sdk.cli.Main social bulkResetUserStatItemValues \
    --namespace "$AB_NAMESPACE" \
    --userId 'HdXbX1Vx' \
    --additionalKey 'tHVtXGid' \
    --body '[{"additionalData": {"HLoCky2X": {}, "apDY8V2e": {}, "EhxTn8eg": {}}, "statCode": "xyKSWNtg"}, {"additionalData": {"znqDoRms": {}, "lJJVcbzy": {}, "dhGptXQF": {}}, "statCode": "4PgGKG7F"}, {"additionalData": {"nJOdGap4": {}, "P3iGQwla": {}, "MUjifqpa": {}}, "statCode": "ONfiVBws"}]' \
    > test.out 2>&1
eval_tap $? 93 'BulkResetUserStatItemValues' test.out

#- 94 DeleteUserStatItems2
./ng net.accelbyte.sdk.cli.Main social deleteUserStatItems2 \
    --namespace "$AB_NAMESPACE" \
    --statCode 'QYMbLPIA' \
    --userId '1ZfhkKVc' \
    --additionalKey 'QZ4nGPyr' \
    > test.out 2>&1
eval_tap $? 94 'DeleteUserStatItems2' test.out

#- 95 UpdateUserStatItemValue
./ng net.accelbyte.sdk.cli.Main social updateUserStatItemValue \
    --namespace "$AB_NAMESPACE" \
    --statCode 'drwpGBhw' \
    --userId 'tXQpnl3w' \
    --additionalKey 'mHiKMJPu' \
    --body '{"additionalData": {"wMKUxx4y": {}, "YifIZ0A3": {}, "Ism8W42f": {}}, "updateStrategy": "OVERRIDE", "value": 0.4901404897375372}' \
    > test.out 2>&1
eval_tap $? 95 'UpdateUserStatItemValue' test.out

#- 96 BulkUpdateUserStatItem1
./ng net.accelbyte.sdk.cli.Main social bulkUpdateUserStatItem1 \
    --namespace "$AB_NAMESPACE" \
    --body '[{"additionalData": {"XkI7mCMs": {}, "aeh7MxlE": {}, "4Yha2NZu": {}}, "additionalKey": "lwHo09w0", "statCode": "wT1TrBVn", "updateStrategy": "MAX", "userId": "5zmvaCw1", "value": 0.28291485712742637}, {"additionalData": {"faJXVSJs": {}, "ZmDEIVmt": {}, "qCk7Kw9C": {}}, "additionalKey": "JVlHOK9E", "statCode": "BKKnr0j4", "updateStrategy": "MIN", "userId": "AdIdkuAR", "value": 0.4153926666043338}, {"additionalData": {"6SolQXOd": {}, "wZBtZBO6": {}, "atajNXWb": {}}, "additionalKey": "2ULqJz3C", "statCode": "FdfwaxnP", "updateStrategy": "INCREMENT", "userId": "OGU0gkTR", "value": 0.4915739291353227}]' \
    > test.out 2>&1
eval_tap $? 96 'BulkUpdateUserStatItem1' test.out

#- 97 PublicQueryUserStatItems2
./ng net.accelbyte.sdk.cli.Main social publicQueryUserStatItems2 \
    --namespace "$AB_NAMESPACE" \
    --userId 'q8JrmbSO' \
    --additionalKey 'rvL7KC5y' \
    --statCodes 'EMhzA6A6,mr4riJ62,kFBCeHDa' \
    --tags 'LZWoqpvR,BMmE1l4y,2V0zZgYS' \
    > test.out 2>&1
eval_tap $? 97 'PublicQueryUserStatItems2' test.out

#- 98 BulkUpdateUserStatItem2
./ng net.accelbyte.sdk.cli.Main social bulkUpdateUserStatItem2 \
    --namespace "$AB_NAMESPACE" \
    --userId 'ZB4CNvbu' \
    --additionalKey 'OLHbOi6n' \
    --body '[{"additionalData": {"M2w1UqoZ": {}, "qVP6QVu7": {}, "AHtZ4wT5": {}}, "statCode": "QkXQTnSt", "updateStrategy": "MIN", "value": 0.5648828058085329}, {"additionalData": {"a6EVhJLU": {}, "I0UQexLP": {}, "BkHOg4AS": {}}, "statCode": "IpEFLh14", "updateStrategy": "OVERRIDE", "value": 0.20076281608427238}, {"additionalData": {"b1p7mo96": {}, "NQR0DUy2": {}, "9WjrCnjD": {}}, "statCode": "uQs5PHC5", "updateStrategy": "OVERRIDE", "value": 0.8836275226036233}]' \
    > test.out 2>&1
eval_tap $? 98 'BulkUpdateUserStatItem2' test.out

#- 99 UpdateUserStatItemValue1
./ng net.accelbyte.sdk.cli.Main social updateUserStatItemValue1 \
    --namespace "$AB_NAMESPACE" \
    --statCode 'F3DAdYyI' \
    --userId 'BMo2EgHE' \
    --additionalKey 'o28BVqJ4' \
    --body '{"additionalData": {"TBr6T3wO": {}, "VJlN8yUT": {}, "QV60b3pD": {}}, "updateStrategy": "OVERRIDE", "value": 0.8872061578938215}' \
    > test.out 2>&1
eval_tap $? 99 'UpdateUserStatItemValue1' test.out


rm -f "tmp.dat"

exit $EXIT_CODE