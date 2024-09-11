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
    --userId 'cSbTVIgg' \
    > test.out 2>&1
eval_tap $? 8 'GetUserProfiles' test.out

#- 9 GetProfile
./ng net.accelbyte.sdk.cli.Main social getProfile \
    --namespace "$AB_NAMESPACE" \
    --profileId '4476vLOQ' \
    --userId 'T4FhGXiI' \
    > test.out 2>&1
eval_tap $? 9 'GetProfile' test.out

#- 10 GetUserNamespaceSlots
eval_tap 0 10 'GetUserNamespaceSlots # SKIP deprecated' test.out

#- 11 GetSlotData
eval_tap 0 11 'GetSlotData # SKIP deprecated' test.out

#- 12 PublicGetUserGameProfiles
./ng net.accelbyte.sdk.cli.Main social publicGetUserGameProfiles \
    --namespace "$AB_NAMESPACE" \
    --userIds 'nPyJGEDc,yOMCZWWN,ys98w8Eb' \
    > test.out 2>&1
eval_tap $? 12 'PublicGetUserGameProfiles' test.out

#- 13 PublicGetUserProfiles
./ng net.accelbyte.sdk.cli.Main social publicGetUserProfiles \
    --namespace "$AB_NAMESPACE" \
    --userId 'xi0qXMZa' \
    > test.out 2>&1
eval_tap $? 13 'PublicGetUserProfiles' test.out

#- 14 PublicCreateProfile
./ng net.accelbyte.sdk.cli.Main social publicCreateProfile \
    --namespace "$AB_NAMESPACE" \
    --userId 'ee88tMfA' \
    --body '{"achievements": ["gET4XIDg", "egR94Ep2", "VcjyWLBY"], "attributes": {"60igaksp": "XoImJxWr", "1DtTTT4a": "iCUa2bcK", "h4pnxGLC": "yx1ET8SZ"}, "avatarUrl": "T5S39VXH", "inventories": ["wHjsqxRW", "Jzv3kWpC", "R7CwOAVf"], "label": "XMvwfLdG", "profileName": "BPcBzIPk", "statistics": ["wdTCDqpl", "h9r3Aj7h", "MncCiB8w"], "tags": ["I4AuhswR", "kzrnqmZv", "Rt1ihBcV"]}' \
    > test.out 2>&1
eval_tap $? 14 'PublicCreateProfile' test.out

#- 15 PublicGetProfile
./ng net.accelbyte.sdk.cli.Main social publicGetProfile \
    --namespace "$AB_NAMESPACE" \
    --profileId 'dJ95DG0P' \
    --userId 'wO73vF6g' \
    > test.out 2>&1
eval_tap $? 15 'PublicGetProfile' test.out

#- 16 PublicUpdateProfile
./ng net.accelbyte.sdk.cli.Main social publicUpdateProfile \
    --namespace "$AB_NAMESPACE" \
    --profileId '43GpJVh2' \
    --userId 'vFgXjWrK' \
    --body '{"achievements": ["8kz1Be51", "T86080NV", "yNFnhH1M"], "attributes": {"9fhXAqgl": "5A3pIJBR", "MZuV9GEJ": "h6toMEGX", "szSsRFZH": "Arthyhye"}, "avatarUrl": "IUuIagmn", "inventories": ["rSWyIc99", "ww9qNOJx", "47Yuo6k0"], "label": "3OENv9i8", "profileName": "Qnl3QIb3", "statistics": ["w4ABgjlH", "qf9Ph1R9", "8aRkKQqy"], "tags": ["NSFTVkGF", "0AusLPQb", "PG2ZUdpC"]}' \
    > test.out 2>&1
eval_tap $? 16 'PublicUpdateProfile' test.out

#- 17 PublicDeleteProfile
./ng net.accelbyte.sdk.cli.Main social publicDeleteProfile \
    --namespace "$AB_NAMESPACE" \
    --profileId 'BBbcNaxk' \
    --userId '2OBgkOPe' \
    > test.out 2>&1
eval_tap $? 17 'PublicDeleteProfile' test.out

#- 18 PublicGetProfileAttribute
./ng net.accelbyte.sdk.cli.Main social publicGetProfileAttribute \
    --attributeName 'RLfIUcCD' \
    --namespace "$AB_NAMESPACE" \
    --profileId 'dcOjcACo' \
    --userId 'Akn3vEBd' \
    > test.out 2>&1
eval_tap $? 18 'PublicGetProfileAttribute' test.out

#- 19 PublicUpdateAttribute
./ng net.accelbyte.sdk.cli.Main social publicUpdateAttribute \
    --attributeName 'Q83A9faH' \
    --namespace "$AB_NAMESPACE" \
    --profileId 'TcdplhnF' \
    --userId 'SzLYPVqS' \
    --body '{"name": "ctnOLua0", "value": "qtepUPTy"}' \
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
    --limit '87' \
    --offset '7' \
    --statCodes 'Vusmva3t' \
    > test.out 2>&1
eval_tap $? 26 'GetGlobalStatItems' test.out

#- 27 GetGlobalStatItemByStatCode
./ng net.accelbyte.sdk.cli.Main social getGlobalStatItemByStatCode \
    --namespace "$AB_NAMESPACE" \
    --statCode 'VubdExG8' \
    > test.out 2>&1
eval_tap $? 27 'GetGlobalStatItemByStatCode' test.out

#- 28 GetStatCycles
./ng net.accelbyte.sdk.cli.Main social getStatCycles \
    --namespace "$AB_NAMESPACE" \
    --cycleType 'MONTHLY' \
    --limit '60' \
    --name 'LnEIMciE' \
    --offset '41' \
    --sortBy '2yiLmfQd' \
    --status 'STOPPED' \
    > test.out 2>&1
eval_tap $? 28 'GetStatCycles' test.out

#- 29 CreateStatCycle
./ng net.accelbyte.sdk.cli.Main social createStatCycle \
    --namespace "$AB_NAMESPACE" \
    --body '{"cycleType": "DAILY", "description": "5NkqYLIo", "end": "1992-12-03T00:00:00Z", "id": "JiwQmBma", "name": "YC8Sfmue", "resetDate": 57, "resetDay": 64, "resetMonth": 61, "resetTime": "PBKd6Iv5", "seasonPeriod": 39, "start": "1981-10-21T00:00:00Z"}' \
    > test.out 2>&1
eval_tap $? 29 'CreateStatCycle' test.out

#- 30 BulkGetStatCycle
./ng net.accelbyte.sdk.cli.Main social bulkGetStatCycle \
    --namespace "$AB_NAMESPACE" \
    --body '{"cycleIds": ["vB3G9y7z", "PoHH3YMY", "NchbPSVa"]}' \
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
    --cycleId '3a5WljRg' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 33 'GetStatCycle' test.out

#- 34 UpdateStatCycle
./ng net.accelbyte.sdk.cli.Main social updateStatCycle \
    --cycleId 'VoBLtN4I' \
    --namespace "$AB_NAMESPACE" \
    --body '{"cycleType": "MONTHLY", "description": "QJ73rjXP", "end": "1971-04-03T00:00:00Z", "name": "W1Dyjogc", "resetDate": 55, "resetDay": 67, "resetMonth": 79, "resetTime": "JasnfDVt", "seasonPeriod": 5, "start": "1982-06-08T00:00:00Z"}' \
    > test.out 2>&1
eval_tap $? 34 'UpdateStatCycle' test.out

#- 35 DeleteStatCycle
./ng net.accelbyte.sdk.cli.Main social deleteStatCycle \
    --cycleId 'YiN4HeD2' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 35 'DeleteStatCycle' test.out

#- 36 BulkAddStats
./ng net.accelbyte.sdk.cli.Main social bulkAddStats \
    --cycleId 'kqnhqYOF' \
    --namespace "$AB_NAMESPACE" \
    --body '{"statCodes": ["AGeBuuKc", "0l2qQbIA", "3vLhC7vt"]}' \
    > test.out 2>&1
eval_tap $? 36 'BulkAddStats' test.out

#- 37 StopStatCycle
./ng net.accelbyte.sdk.cli.Main social stopStatCycle \
    --cycleId '7490BI16' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 37 'StopStatCycle' test.out

#- 38 BulkFetchStatItems
./ng net.accelbyte.sdk.cli.Main social bulkFetchStatItems \
    --namespace "$AB_NAMESPACE" \
    --statCode 'iEyU1gbH' \
    --userIds 'P8MqHYJG' \
    > test.out 2>&1
eval_tap $? 38 'BulkFetchStatItems' test.out

#- 39 BulkIncUserStatItem
./ng net.accelbyte.sdk.cli.Main social bulkIncUserStatItem \
    --namespace "$AB_NAMESPACE" \
    --body '[{"inc": 0.12241200708019462, "statCode": "iKATtsHm", "userId": "MXzHGfZu"}, {"inc": 0.4051415090670072, "statCode": "ndMTIxgW", "userId": "IttnGkB9"}, {"inc": 0.06832220577971537, "statCode": "MQ4Tyqra", "userId": "HrA3tH8d"}]' \
    > test.out 2>&1
eval_tap $? 39 'BulkIncUserStatItem' test.out

#- 40 BulkIncUserStatItemValue
./ng net.accelbyte.sdk.cli.Main social bulkIncUserStatItemValue \
    --namespace "$AB_NAMESPACE" \
    --body '[{"inc": 0.12190325035569904, "statCode": "JyyUI4D5", "userId": "E9Jasb6x"}, {"inc": 0.9019981615272357, "statCode": "0CRBPpzP", "userId": "N7fVbp7T"}, {"inc": 0.6257168675890584, "statCode": "Hpi8hkJB", "userId": "xdzme0W1"}]' \
    > test.out 2>&1
eval_tap $? 40 'BulkIncUserStatItemValue' test.out

#- 41 BulkFetchOrDefaultStatItems
./ng net.accelbyte.sdk.cli.Main social bulkFetchOrDefaultStatItems \
    --namespace "$AB_NAMESPACE" \
    --statCode 'BWAWiaGG' \
    --userIds 'WA36N6dq,yajpJOiF,M1GnymFG' \
    > test.out 2>&1
eval_tap $? 41 'BulkFetchOrDefaultStatItems' test.out

#- 42 BulkResetUserStatItem
./ng net.accelbyte.sdk.cli.Main social bulkResetUserStatItem \
    --namespace "$AB_NAMESPACE" \
    --body '[{"statCode": "IogB47wR", "userId": "FCmH1Ajs"}, {"statCode": "sBAnyMKX", "userId": "k1vS7g5Y"}, {"statCode": "q716WLz3", "userId": "CXiVH8Ln"}]' \
    > test.out 2>&1
eval_tap $? 42 'BulkResetUserStatItem' test.out

#- 43 GetStats
./ng net.accelbyte.sdk.cli.Main social getStats \
    --namespace "$AB_NAMESPACE" \
    --cycleIds 'D0Kv1CLL' \
    --isGlobal  \
    --isPublic  \
    --limit '65' \
    --offset '17' \
    > test.out 2>&1
eval_tap $? 43 'GetStats' test.out

#- 44 CreateStat
./ng net.accelbyte.sdk.cli.Main social createStat \
    --namespace "$AB_NAMESPACE" \
    --body '{"cycleIds": ["8bHfBQxx", "cRTGmORN", "SPVp0mpi"], "defaultValue": 0.8166079650086675, "description": "5qHfucVl", "globalAggregationMethod": "LAST", "ignoreAdditionalDataOnValueRejected": true, "incrementOnly": true, "isPublic": false, "maximum": 0.09107139637217776, "minimum": 0.6145248925629595, "name": "nhSoSFaO", "setAsGlobal": false, "setBy": "CLIENT", "statCode": "zg0n0QKQ", "tags": ["zX32CUX8", "16VP6hJs", "oiE11Olg"]}' \
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
    --limit '50' \
    --offset '58' \
    --keyword 'QSmXpWG6' \
    > test.out 2>&1
eval_tap $? 47 'QueryStats' test.out

#- 48 GetStat
./ng net.accelbyte.sdk.cli.Main social getStat \
    --namespace "$AB_NAMESPACE" \
    --statCode '22GmBpY8' \
    > test.out 2>&1
eval_tap $? 48 'GetStat' test.out

#- 49 DeleteStat
./ng net.accelbyte.sdk.cli.Main social deleteStat \
    --namespace "$AB_NAMESPACE" \
    --statCode 'r5ivWxAd' \
    > test.out 2>&1
eval_tap $? 49 'DeleteStat' test.out

#- 50 UpdateStat
./ng net.accelbyte.sdk.cli.Main social updateStat \
    --namespace "$AB_NAMESPACE" \
    --statCode 'dJsTphMJ' \
    --body '{"cycleIds": ["zL6bia9P", "gxBZhkh8", "WbuLvFRR"], "defaultValue": 0.37212986445211405, "description": "yzPV05E3", "globalAggregationMethod": "MIN", "ignoreAdditionalDataOnValueRejected": true, "isPublic": true, "name": "FKyChIHY", "tags": ["pADU2VlT", "4e8AY4jY", "db4VM1iW"]}' \
    > test.out 2>&1
eval_tap $? 50 'UpdateStat' test.out

#- 51 GetStatItems
./ng net.accelbyte.sdk.cli.Main social getStatItems \
    --namespace "$AB_NAMESPACE" \
    --statCode 'nZ1nXJ3X' \
    --limit '5' \
    --offset '45' \
    --sortBy 'aeAihjSe' \
    > test.out 2>&1
eval_tap $? 51 'GetStatItems' test.out

#- 52 DeleteTiedStat
./ng net.accelbyte.sdk.cli.Main social deleteTiedStat \
    --namespace "$AB_NAMESPACE" \
    --statCode '6oYgnZZz' \
    > test.out 2>&1
eval_tap $? 52 'DeleteTiedStat' test.out

#- 53 GetUserStatCycleItems
./ng net.accelbyte.sdk.cli.Main social getUserStatCycleItems \
    --cycleId 'WbNgB1Sz' \
    --namespace "$AB_NAMESPACE" \
    --userId 'HtFOLAIP' \
    --isPublic  \
    --limit '0' \
    --offset '17' \
    --sortBy '4TELWHdj' \
    --statCodes 'uhBjaGsj' \
    > test.out 2>&1
eval_tap $? 53 'GetUserStatCycleItems' test.out

#- 54 GetUserStatItems
./ng net.accelbyte.sdk.cli.Main social getUserStatItems \
    --namespace "$AB_NAMESPACE" \
    --userId 'm60NhBt6' \
    --isPublic  \
    --limit '48' \
    --offset '62' \
    --sortBy 'S3OVvIIN' \
    --statCodes '8JHpZekW' \
    --tags 'NSkqLT9I' \
    > test.out 2>&1
eval_tap $? 54 'GetUserStatItems' test.out

#- 55 BulkCreateUserStatItems
./ng net.accelbyte.sdk.cli.Main social bulkCreateUserStatItems \
    --namespace "$AB_NAMESPACE" \
    --userId 'RgcYYtBj' \
    --body '[{"statCode": "w8zWTONQ"}, {"statCode": "huCVcOz8"}, {"statCode": "SWlZOHem"}]' \
    > test.out 2>&1
eval_tap $? 55 'BulkCreateUserStatItems' test.out

#- 56 BulkIncUserStatItem1
./ng net.accelbyte.sdk.cli.Main social bulkIncUserStatItem1 \
    --namespace "$AB_NAMESPACE" \
    --userId 'ZcnQv2ZI' \
    --body '[{"inc": 0.9940477059593074, "statCode": "cvCR4Fpa"}, {"inc": 0.16607651692305803, "statCode": "tny74e2U"}, {"inc": 0.8607978933770755, "statCode": "geDkGtHa"}]' \
    > test.out 2>&1
eval_tap $? 56 'BulkIncUserStatItem1' test.out

#- 57 BulkIncUserStatItemValue1
./ng net.accelbyte.sdk.cli.Main social bulkIncUserStatItemValue1 \
    --namespace "$AB_NAMESPACE" \
    --userId 'Sk5heJql' \
    --body '[{"inc": 0.4323701816965706, "statCode": "Bg6GDON9"}, {"inc": 0.5610296978404316, "statCode": "FIez9tvx"}, {"inc": 0.025927486243094044, "statCode": "3njATBB3"}]' \
    > test.out 2>&1
eval_tap $? 57 'BulkIncUserStatItemValue1' test.out

#- 58 BulkResetUserStatItem1
./ng net.accelbyte.sdk.cli.Main social bulkResetUserStatItem1 \
    --namespace "$AB_NAMESPACE" \
    --userId 'qVSp2yYp' \
    --body '[{"statCode": "tQiETup2"}, {"statCode": "Afxd8G2Y"}, {"statCode": "lo52AWvE"}]' \
    > test.out 2>&1
eval_tap $? 58 'BulkResetUserStatItem1' test.out

#- 59 CreateUserStatItem
./ng net.accelbyte.sdk.cli.Main social createUserStatItem \
    --namespace "$AB_NAMESPACE" \
    --statCode 'aJtndZNt' \
    --userId 'bi2ywtwW' \
    > test.out 2>&1
eval_tap $? 59 'CreateUserStatItem' test.out

#- 60 DeleteUserStatItems
./ng net.accelbyte.sdk.cli.Main social deleteUserStatItems \
    --namespace "$AB_NAMESPACE" \
    --statCode 'WS3ec5xF' \
    --userId 'iBUsx7B7' \
    > test.out 2>&1
eval_tap $? 60 'DeleteUserStatItems' test.out

#- 61 IncUserStatItemValue
./ng net.accelbyte.sdk.cli.Main social incUserStatItemValue \
    --namespace "$AB_NAMESPACE" \
    --statCode 'ZkZtyoQK' \
    --userId 'MqVrBRoC' \
    --body '{"inc": 0.7984416496610729}' \
    > test.out 2>&1
eval_tap $? 61 'IncUserStatItemValue' test.out

#- 62 ResetUserStatItemValue
./ng net.accelbyte.sdk.cli.Main social resetUserStatItemValue \
    --namespace "$AB_NAMESPACE" \
    --statCode 'rymCKxQc' \
    --userId 'i7kiLTj0' \
    --additionalKey 'iJxjuHwf' \
    --body '{"additionalData": {"aGvo418S": {}, "ifRomSFe": {}, "GEDeop0x": {}}}' \
    > test.out 2>&1
eval_tap $? 62 'ResetUserStatItemValue' test.out

#- 63 GetGlobalStatItems1
./ng net.accelbyte.sdk.cli.Main social getGlobalStatItems1 \
    --namespace "$AB_NAMESPACE" \
    --limit '63' \
    --offset '19' \
    --statCodes 'WaGyQngI' \
    > test.out 2>&1
eval_tap $? 63 'GetGlobalStatItems1' test.out

#- 64 GetGlobalStatItemByStatCode1
./ng net.accelbyte.sdk.cli.Main social getGlobalStatItemByStatCode1 \
    --namespace "$AB_NAMESPACE" \
    --statCode 'YKHHJvOh' \
    > test.out 2>&1
eval_tap $? 64 'GetGlobalStatItemByStatCode1' test.out

#- 65 GetStatCycles1
./ng net.accelbyte.sdk.cli.Main social getStatCycles1 \
    --namespace "$AB_NAMESPACE" \
    --cycleType 'DAILY' \
    --limit '34' \
    --name 'jckptkWA' \
    --offset '40' \
    --sortBy 'gfSzMJ2H' \
    --status 'ACTIVE' \
    > test.out 2>&1
eval_tap $? 65 'GetStatCycles1' test.out

#- 66 BulkGetStatCycle1
./ng net.accelbyte.sdk.cli.Main social bulkGetStatCycle1 \
    --namespace "$AB_NAMESPACE" \
    --body '{"cycleIds": ["EOxpOMd6", "jCmDHYHc", "rtA2RyPf"]}' \
    > test.out 2>&1
eval_tap $? 66 'BulkGetStatCycle1' test.out

#- 67 GetStatCycle1
./ng net.accelbyte.sdk.cli.Main social getStatCycle1 \
    --cycleId 'iCA8cz3F' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 67 'GetStatCycle1' test.out

#- 68 BulkFetchStatItems1
./ng net.accelbyte.sdk.cli.Main social bulkFetchStatItems1 \
    --namespace "$AB_NAMESPACE" \
    --statCode 'ddjbQtc2' \
    --userIds '7JhAI8im' \
    > test.out 2>&1
eval_tap $? 68 'BulkFetchStatItems1' test.out

#- 69 PublicBulkIncUserStatItem
./ng net.accelbyte.sdk.cli.Main social publicBulkIncUserStatItem \
    --namespace "$AB_NAMESPACE" \
    --body '[{"inc": 0.477877650509283, "statCode": "P4A2qf3Q", "userId": "YsUcCRFs"}, {"inc": 0.3016603953193625, "statCode": "VLNsQRQg", "userId": "2TFBVAs5"}, {"inc": 0.05508147044802092, "statCode": "HjcnAOx4", "userId": "Mk0CXRHA"}]' \
    > test.out 2>&1
eval_tap $? 69 'PublicBulkIncUserStatItem' test.out

#- 70 PublicBulkIncUserStatItemValue
./ng net.accelbyte.sdk.cli.Main social publicBulkIncUserStatItemValue \
    --namespace "$AB_NAMESPACE" \
    --body '[{"inc": 0.22059271186359974, "statCode": "yWutdk6Z", "userId": "WI8MdETv"}, {"inc": 0.7821974965685503, "statCode": "Se6914PC", "userId": "hiM2aYhj"}, {"inc": 0.2594430700578575, "statCode": "DkpJqibs", "userId": "njGL978F"}]' \
    > test.out 2>&1
eval_tap $? 70 'PublicBulkIncUserStatItemValue' test.out

#- 71 BulkResetUserStatItem2
./ng net.accelbyte.sdk.cli.Main social bulkResetUserStatItem2 \
    --namespace "$AB_NAMESPACE" \
    --body '[{"statCode": "B2QVyU94", "userId": "0hl26W2X"}, {"statCode": "ESx35cys", "userId": "7kYjPjcz"}, {"statCode": "jICvrfxT", "userId": "0Qhgx1Pc"}]' \
    > test.out 2>&1
eval_tap $? 71 'BulkResetUserStatItem2' test.out

#- 72 CreateStat1
./ng net.accelbyte.sdk.cli.Main social createStat1 \
    --namespace "$AB_NAMESPACE" \
    --body '{"cycleIds": ["qq5AdhHH", "rUTfmGYL", "vqXD71Qo"], "defaultValue": 0.7684912222625601, "description": "q4m5TN00", "globalAggregationMethod": "LAST", "ignoreAdditionalDataOnValueRejected": true, "incrementOnly": false, "isPublic": true, "maximum": 0.49552027730495396, "minimum": 0.22599746149305855, "name": "zWp771aN", "setAsGlobal": true, "setBy": "SERVER", "statCode": "Ud1TAzqh", "tags": ["nQcZyGq9", "g5umgW1o", "7tkk1Fx7"]}' \
    > test.out 2>&1
eval_tap $? 72 'CreateStat1' test.out

#- 73 PublicListMyStatCycleItems
./ng net.accelbyte.sdk.cli.Main social publicListMyStatCycleItems \
    --cycleId 'AXwkDXMk' \
    --namespace "$AB_NAMESPACE" \
    --limit '50' \
    --offset '35' \
    --sortBy 'VFeEH8p7' \
    --statCodes 'Xy1QNN5b,7qRrbwsb,N7uG6fF6' \
    > test.out 2>&1
eval_tap $? 73 'PublicListMyStatCycleItems' test.out

#- 74 PublicListMyStatItems
./ng net.accelbyte.sdk.cli.Main social publicListMyStatItems \
    --namespace "$AB_NAMESPACE" \
    --limit '30' \
    --offset '55' \
    --sortBy 'zxv4lOwn' \
    --statCodes '79N0Fngy,K1QhsC5I,e7cA7BOW' \
    --tags 'qahOo0Yu,lgDg3QV4,U9ogyDlV' \
    > test.out 2>&1
eval_tap $? 74 'PublicListMyStatItems' test.out

#- 75 PublicListAllMyStatItems
./ng net.accelbyte.sdk.cli.Main social publicListAllMyStatItems \
    --namespace "$AB_NAMESPACE" \
    --additionalKey 'V7xtDoPG' \
    --statCodes 'Z0SEjtYk,TX30lACB,fQ7UFceN' \
    --tags 'evH4oR9n,apRxFNc7,pAWq8Gwa' \
    > test.out 2>&1
eval_tap $? 75 'PublicListAllMyStatItems' test.out

#- 76 GetUserStatCycleItems1
./ng net.accelbyte.sdk.cli.Main social getUserStatCycleItems1 \
    --cycleId 'GPeS6C8i' \
    --namespace "$AB_NAMESPACE" \
    --userId 'q53GBN0T' \
    --limit '62' \
    --offset '45' \
    --sortBy 'wtOS1ACh' \
    --statCodes '3xV5HmeB' \
    > test.out 2>&1
eval_tap $? 76 'GetUserStatCycleItems1' test.out

#- 77 PublicQueryUserStatItems
./ng net.accelbyte.sdk.cli.Main social publicQueryUserStatItems \
    --namespace "$AB_NAMESPACE" \
    --userId 'I8P4YRnn' \
    --limit '95' \
    --offset '20' \
    --sortBy 'lRrBqgU2' \
    --statCodes 'aEGq5LRX' \
    --tags '9hK8svQT' \
    > test.out 2>&1
eval_tap $? 77 'PublicQueryUserStatItems' test.out

#- 78 PublicBulkCreateUserStatItems
./ng net.accelbyte.sdk.cli.Main social publicBulkCreateUserStatItems \
    --namespace "$AB_NAMESPACE" \
    --userId '6tfQAfaL' \
    --body '[{"statCode": "arYMmcj6"}, {"statCode": "DD5tvViK"}, {"statCode": "vq95vRcU"}]' \
    > test.out 2>&1
eval_tap $? 78 'PublicBulkCreateUserStatItems' test.out

#- 79 PublicQueryUserStatItems1
./ng net.accelbyte.sdk.cli.Main social publicQueryUserStatItems1 \
    --namespace "$AB_NAMESPACE" \
    --userId 'MGSJhOkn' \
    --additionalKey '1W6E69Bc' \
    --statCodes 'FB64fA3g,SUAt7bOe,vYDowHjv' \
    --tags 'd7n5cPHw,iww568ZI,tmtKaYZE' \
    > test.out 2>&1
eval_tap $? 79 'PublicQueryUserStatItems1' test.out

#- 80 PublicBulkIncUserStatItem1
./ng net.accelbyte.sdk.cli.Main social publicBulkIncUserStatItem1 \
    --namespace "$AB_NAMESPACE" \
    --userId 'JW6z2PUn' \
    --body '[{"inc": 0.764109106376449, "statCode": "fwYnFwjR"}, {"inc": 0.3592531002477696, "statCode": "oroWfmIL"}, {"inc": 0.2544738125813253, "statCode": "Q2kDlh1a"}]' \
    > test.out 2>&1
eval_tap $? 80 'PublicBulkIncUserStatItem1' test.out

#- 81 BulkIncUserStatItemValue2
./ng net.accelbyte.sdk.cli.Main social bulkIncUserStatItemValue2 \
    --namespace "$AB_NAMESPACE" \
    --userId '0WEcPYbH' \
    --body '[{"inc": 0.4457100017801071, "statCode": "bH9oitFd"}, {"inc": 0.8939573643894703, "statCode": "RbhsSNIR"}, {"inc": 0.27024517321148267, "statCode": "yUZGhpct"}]' \
    > test.out 2>&1
eval_tap $? 81 'BulkIncUserStatItemValue2' test.out

#- 82 BulkResetUserStatItem3
./ng net.accelbyte.sdk.cli.Main social bulkResetUserStatItem3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'vsEFHz8g' \
    --body '[{"statCode": "NDIVCHW3"}, {"statCode": "jtrtAr60"}, {"statCode": "NmPuuE34"}]' \
    > test.out 2>&1
eval_tap $? 82 'BulkResetUserStatItem3' test.out

#- 83 PublicCreateUserStatItem
./ng net.accelbyte.sdk.cli.Main social publicCreateUserStatItem \
    --namespace "$AB_NAMESPACE" \
    --statCode 'JJyMHG5D' \
    --userId 'zXXYFr06' \
    > test.out 2>&1
eval_tap $? 83 'PublicCreateUserStatItem' test.out

#- 84 DeleteUserStatItems1
./ng net.accelbyte.sdk.cli.Main social deleteUserStatItems1 \
    --namespace "$AB_NAMESPACE" \
    --statCode 'HktLQJ86' \
    --userId 'eQ3vhCSN' \
    > test.out 2>&1
eval_tap $? 84 'DeleteUserStatItems1' test.out

#- 85 PublicIncUserStatItem
./ng net.accelbyte.sdk.cli.Main social publicIncUserStatItem \
    --namespace "$AB_NAMESPACE" \
    --statCode 'zm13PuPL' \
    --userId 'AVjOqK09' \
    --body '{"inc": 0.14001279233950414}' \
    > test.out 2>&1
eval_tap $? 85 'PublicIncUserStatItem' test.out

#- 86 PublicIncUserStatItemValue
./ng net.accelbyte.sdk.cli.Main social publicIncUserStatItemValue \
    --namespace "$AB_NAMESPACE" \
    --statCode 'zmshGHjT' \
    --userId 'zSVsGAB1' \
    --body '{"inc": 0.46564217673953556}' \
    > test.out 2>&1
eval_tap $? 86 'PublicIncUserStatItemValue' test.out

#- 87 ResetUserStatItemValue1
./ng net.accelbyte.sdk.cli.Main social resetUserStatItemValue1 \
    --namespace "$AB_NAMESPACE" \
    --statCode 'ehPUCOxi' \
    --userId 'ZdRN2pKl' \
    > test.out 2>&1
eval_tap $? 87 'ResetUserStatItemValue1' test.out

#- 88 BulkUpdateUserStatItemV2
./ng net.accelbyte.sdk.cli.Main social bulkUpdateUserStatItemV2 \
    --namespace "$AB_NAMESPACE" \
    --body '[{"additionalData": {"iCxEf8oA": {}, "XyJvwPDO": {}, "uwWK88xV": {}}, "additionalKey": "Xjt4EpFN", "statCode": "uz1vTPHi", "updateStrategy": "OVERRIDE", "userId": "AcwAuEHm", "value": 0.979651815290651}, {"additionalData": {"A8T0h1dO": {}, "YS9LzslT": {}, "532EjKcX": {}}, "additionalKey": "hgGsI4u7", "statCode": "ZuJMXLo1", "updateStrategy": "OVERRIDE", "userId": "JBouL01y", "value": 0.17459528589909012}, {"additionalData": {"2z7NcPw1": {}, "rjqv1H0N": {}, "6tVSViNl": {}}, "additionalKey": "KJawAKAS", "statCode": "IdblhYkh", "updateStrategy": "INCREMENT", "userId": "1pNyixZB", "value": 0.12962235912582398}]' \
    > test.out 2>&1
eval_tap $? 88 'BulkUpdateUserStatItemV2' test.out

#- 89 BulkFetchOrDefaultStatItems1
./ng net.accelbyte.sdk.cli.Main social bulkFetchOrDefaultStatItems1 \
    --namespace "$AB_NAMESPACE" \
    --additionalKey '0xXL5HVH' \
    --statCode 'CaE0riQc' \
    --userIds 'wVsLIM0x,jdY8x2oW,mfmZSZ8j' \
    > test.out 2>&1
eval_tap $? 89 'BulkFetchOrDefaultStatItems1' test.out

#- 90 AdminListUsersStatItems
./ng net.accelbyte.sdk.cli.Main social adminListUsersStatItems \
    --namespace "$AB_NAMESPACE" \
    --userId 'EFMNU44U' \
    --additionalKey 'ZSnt9v9h' \
    --statCodes 'QYM99GA0,axfA3sTJ,p72mMlQQ' \
    --tags 'U0nB6ufH,V9llh7TW,aNflcJlx' \
    > test.out 2>&1
eval_tap $? 90 'AdminListUsersStatItems' test.out

#- 91 BulkUpdateUserStatItem
./ng net.accelbyte.sdk.cli.Main social bulkUpdateUserStatItem \
    --namespace "$AB_NAMESPACE" \
    --userId 'I8JbCUKz' \
    --additionalKey 'lC98W5o7' \
    --body '[{"additionalData": {"ujjynmaq": {}, "qwRKbBVD": {}, "6hjGi3bG": {}}, "statCode": "td9Uh1CA", "updateStrategy": "MAX", "value": 0.48831263676468095}, {"additionalData": {"EaNXl8Oi": {}, "QWVODDta": {}, "vg6EEqxp": {}}, "statCode": "mwuc8VVe", "updateStrategy": "OVERRIDE", "value": 0.5446563071687189}, {"additionalData": {"A8NKZw5I": {}, "8iTDqHwt": {}, "1Mvr7b64": {}}, "statCode": "QBRsPBx3", "updateStrategy": "MAX", "value": 0.18280927399872005}]' \
    > test.out 2>&1
eval_tap $? 91 'BulkUpdateUserStatItem' test.out

#- 92 BulkGetOrDefaultByUserId
./ng net.accelbyte.sdk.cli.Main social bulkGetOrDefaultByUserId \
    --namespace "$AB_NAMESPACE" \
    --userId 'eN9hVcUs' \
    --additionalKey 'GhpCCTsu' \
    --body '{"statCodes": ["q4i1g0bV", "yjjMOayZ", "oKO9e37o"]}' \
    > test.out 2>&1
eval_tap $? 92 'BulkGetOrDefaultByUserId' test.out

#- 93 BulkResetUserStatItemValues
./ng net.accelbyte.sdk.cli.Main social bulkResetUserStatItemValues \
    --namespace "$AB_NAMESPACE" \
    --userId 'w5Gwicdb' \
    --additionalKey 'FNNZtNVK' \
    --body '[{"additionalData": {"YloPlIM3": {}, "Ww144Chl": {}, "herb0grp": {}}, "statCode": "n10SNviE"}, {"additionalData": {"v627G6iB": {}, "P8ajfprY": {}, "6HCxXSo3": {}}, "statCode": "fedSZxof"}, {"additionalData": {"JjtFRhRj": {}, "KkMMM7rx": {}, "EEN6gqp8": {}}, "statCode": "tdUEN78F"}]' \
    > test.out 2>&1
eval_tap $? 93 'BulkResetUserStatItemValues' test.out

#- 94 DeleteUserStatItems2
./ng net.accelbyte.sdk.cli.Main social deleteUserStatItems2 \
    --namespace "$AB_NAMESPACE" \
    --statCode 'RISmGydQ' \
    --userId 'CZE91R0w' \
    --additionalKey 'FOUzqc9I' \
    > test.out 2>&1
eval_tap $? 94 'DeleteUserStatItems2' test.out

#- 95 UpdateUserStatItemValue
./ng net.accelbyte.sdk.cli.Main social updateUserStatItemValue \
    --namespace "$AB_NAMESPACE" \
    --statCode 'lL7w7VgZ' \
    --userId 'EPe4BVen' \
    --additionalKey 'ktu0T0mq' \
    --body '{"additionalData": {"4tGvyypr": {}, "thUknNv0": {}, "LV7Qunsg": {}}, "updateStrategy": "OVERRIDE", "value": 0.7969556228722076}' \
    > test.out 2>&1
eval_tap $? 95 'UpdateUserStatItemValue' test.out

#- 96 BulkUpdateUserStatItem1
./ng net.accelbyte.sdk.cli.Main social bulkUpdateUserStatItem1 \
    --namespace "$AB_NAMESPACE" \
    --body '[{"additionalData": {"9DP7JkfE": {}, "iXJMm7jI": {}, "Y7f8ddJo": {}}, "additionalKey": "7GV2jJX6", "statCode": "5r3OGwwv", "updateStrategy": "INCREMENT", "userId": "MhPl1SRV", "value": 0.8654941807639164}, {"additionalData": {"gnnG0cQj": {}, "oW0hbBvJ": {}, "9pnQ6ZQH": {}}, "additionalKey": "x7nIeMPP", "statCode": "ktU10PxC", "updateStrategy": "MIN", "userId": "R0jfuMaa", "value": 0.47547051499557635}, {"additionalData": {"Iwu4deiu": {}, "QQYOAZkh": {}, "lQYuivKW": {}}, "additionalKey": "wvSaAuH5", "statCode": "GpjuFABB", "updateStrategy": "OVERRIDE", "userId": "PmVplCxq", "value": 0.03505009687942984}]' \
    > test.out 2>&1
eval_tap $? 96 'BulkUpdateUserStatItem1' test.out

#- 97 PublicQueryUserStatItems2
./ng net.accelbyte.sdk.cli.Main social publicQueryUserStatItems2 \
    --namespace "$AB_NAMESPACE" \
    --userId '9p9XXBk2' \
    --additionalKey 'sfwTfo2t' \
    --statCodes 'zfKqYxWb,gEvEcbxE,KsAnTpi3' \
    --tags 'WvtrRzCO,mirJCc9p,Y3JHfoc3' \
    > test.out 2>&1
eval_tap $? 97 'PublicQueryUserStatItems2' test.out

#- 98 BulkUpdateUserStatItem2
./ng net.accelbyte.sdk.cli.Main social bulkUpdateUserStatItem2 \
    --namespace "$AB_NAMESPACE" \
    --userId 'jC3p9IWG' \
    --additionalKey 'W5iHYAyv' \
    --body '[{"additionalData": {"vkkTqYPs": {}, "yYYQ6OnV": {}, "QGipm2th": {}}, "statCode": "GkwSjKlP", "updateStrategy": "INCREMENT", "value": 0.5537392358707518}, {"additionalData": {"z542gZmV": {}, "qbPpY5yk": {}, "h5boRrqk": {}}, "statCode": "HLflx8Xa", "updateStrategy": "MIN", "value": 0.7403379640333766}, {"additionalData": {"j1Bwinop": {}, "4Zz2V1Bl": {}, "fVfu8mFr": {}}, "statCode": "HFp0uj2s", "updateStrategy": "INCREMENT", "value": 0.4726980772159769}]' \
    > test.out 2>&1
eval_tap $? 98 'BulkUpdateUserStatItem2' test.out

#- 99 UpdateUserStatItemValue1
./ng net.accelbyte.sdk.cli.Main social updateUserStatItemValue1 \
    --namespace "$AB_NAMESPACE" \
    --statCode 'mYLKUOGx' \
    --userId 'XFSmBi53' \
    --additionalKey 'in8E8Kwl' \
    --body '{"additionalData": {"0cQ40c0c": {}, "z2oPkDPa": {}, "GObgNIJj": {}}, "updateStrategy": "INCREMENT", "value": 0.08133039321521263}' \
    > test.out 2>&1
eval_tap $? 99 'UpdateUserStatItemValue1' test.out


rm -f "tmp.dat"

exit $EXIT_CODE