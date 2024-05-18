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
    --userId 'JLKndjUJ' \
    > test.out 2>&1
eval_tap $? 8 'GetUserProfiles' test.out

#- 9 GetProfile
./ng net.accelbyte.sdk.cli.Main social getProfile \
    --namespace "$AB_NAMESPACE" \
    --profileId 'YHBjXkLu' \
    --userId 'u2lLYK7u' \
    > test.out 2>&1
eval_tap $? 9 'GetProfile' test.out

#- 10 GetUserNamespaceSlots
eval_tap 0 10 'GetUserNamespaceSlots # SKIP deprecated' test.out

#- 11 GetSlotData
eval_tap 0 11 'GetSlotData # SKIP deprecated' test.out

#- 12 PublicGetUserGameProfiles
./ng net.accelbyte.sdk.cli.Main social publicGetUserGameProfiles \
    --namespace "$AB_NAMESPACE" \
    --userIds 'kWw27mCV,gjlj4s8j,ezHutLoI' \
    > test.out 2>&1
eval_tap $? 12 'PublicGetUserGameProfiles' test.out

#- 13 PublicGetUserProfiles
./ng net.accelbyte.sdk.cli.Main social publicGetUserProfiles \
    --namespace "$AB_NAMESPACE" \
    --userId 'BSE35OKB' \
    > test.out 2>&1
eval_tap $? 13 'PublicGetUserProfiles' test.out

#- 14 PublicCreateProfile
./ng net.accelbyte.sdk.cli.Main social publicCreateProfile \
    --namespace "$AB_NAMESPACE" \
    --userId 'ZoCJrHof' \
    --body '{"achievements": ["XbNAbOIf", "AftFRQUn", "VGyyZH0O"], "attributes": {"iY3KqQQm": "5io7NgGt", "ca99DoO2": "QpbwZ7p4", "wOZdrzkT": "0WPWGXo5"}, "avatarUrl": "kkwgPtiS", "inventories": ["ZWoQ3qer", "FClpyIAF", "ZqNZdtmu"], "label": "PB3M1V1o", "profileName": "NQf6wEON", "statistics": ["jIDsPd0t", "xAi4G9SV", "X0vB54TC"], "tags": ["pXhF0xTC", "90ePpsYh", "pLMWEll7"]}' \
    > test.out 2>&1
eval_tap $? 14 'PublicCreateProfile' test.out

#- 15 PublicGetProfile
./ng net.accelbyte.sdk.cli.Main social publicGetProfile \
    --namespace "$AB_NAMESPACE" \
    --profileId 'wnHRK6Vs' \
    --userId '2nhxAS7y' \
    > test.out 2>&1
eval_tap $? 15 'PublicGetProfile' test.out

#- 16 PublicUpdateProfile
./ng net.accelbyte.sdk.cli.Main social publicUpdateProfile \
    --namespace "$AB_NAMESPACE" \
    --profileId 'UbNIw9AY' \
    --userId 'CZ6R92hX' \
    --body '{"achievements": ["iHAMTAz2", "goHpCByk", "IsxWHLgD"], "attributes": {"FLboL5U3": "dgivjK6I", "QxY9pfki": "NUZQFqRS", "JezyWuCq": "WxIWlS3d"}, "avatarUrl": "lw677jwO", "inventories": ["aB2sViCX", "2vlKpRhw", "yn1Te1LI"], "label": "mlRue1fS", "profileName": "yTvxpw05", "statistics": ["zCg3la8O", "vWGMGw4v", "3cXMo005"], "tags": ["zZgKKaDb", "ZNhRIO2N", "eaPg7P0x"]}' \
    > test.out 2>&1
eval_tap $? 16 'PublicUpdateProfile' test.out

#- 17 PublicDeleteProfile
./ng net.accelbyte.sdk.cli.Main social publicDeleteProfile \
    --namespace "$AB_NAMESPACE" \
    --profileId 'icom6o1b' \
    --userId 'OvnTQkkR' \
    > test.out 2>&1
eval_tap $? 17 'PublicDeleteProfile' test.out

#- 18 PublicGetProfileAttribute
./ng net.accelbyte.sdk.cli.Main social publicGetProfileAttribute \
    --attributeName 'w6ipVMpA' \
    --namespace "$AB_NAMESPACE" \
    --profileId 'V09EV8Hj' \
    --userId 'aDOxKO7S' \
    > test.out 2>&1
eval_tap $? 18 'PublicGetProfileAttribute' test.out

#- 19 PublicUpdateAttribute
./ng net.accelbyte.sdk.cli.Main social publicUpdateAttribute \
    --attributeName 'L9uFYEVs' \
    --namespace "$AB_NAMESPACE" \
    --profileId 'L9JHJDeX' \
    --userId 'shKNm5Kf' \
    --body '{"name": "gqgNjpUY", "value": "xIOV9aa5"}' \
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
    --limit '30' \
    --offset '20' \
    --statCodes 'GPpJon7I' \
    > test.out 2>&1
eval_tap $? 26 'GetGlobalStatItems' test.out

#- 27 GetGlobalStatItemByStatCode
./ng net.accelbyte.sdk.cli.Main social getGlobalStatItemByStatCode \
    --namespace "$AB_NAMESPACE" \
    --statCode 'yDydzaxV' \
    > test.out 2>&1
eval_tap $? 27 'GetGlobalStatItemByStatCode' test.out

#- 28 GetStatCycles
./ng net.accelbyte.sdk.cli.Main social getStatCycles \
    --namespace "$AB_NAMESPACE" \
    --cycleType 'DAILY' \
    --limit '74' \
    --name 'XMpIr78i' \
    --offset '50' \
    --sortBy 'nd78AYgi' \
    --status 'STOPPED' \
    > test.out 2>&1
eval_tap $? 28 'GetStatCycles' test.out

#- 29 CreateStatCycle
./ng net.accelbyte.sdk.cli.Main social createStatCycle \
    --namespace "$AB_NAMESPACE" \
    --body '{"cycleType": "DAILY", "description": "fod757RA", "end": "1979-10-10T00:00:00Z", "name": "ojrDjpeN", "resetDate": 76, "resetDay": 8, "resetMonth": 45, "resetTime": "xuONE0c6", "seasonPeriod": 46, "start": "1992-11-16T00:00:00Z"}' \
    > test.out 2>&1
eval_tap $? 29 'CreateStatCycle' test.out

#- 30 BulkGetStatCycle
./ng net.accelbyte.sdk.cli.Main social bulkGetStatCycle \
    --namespace "$AB_NAMESPACE" \
    --body '{"cycleIds": ["Nhvaxinl", "7mKFPMjt", "YkSTLBAK"]}' \
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
    --cycleId 'SEloX68j' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 33 'GetStatCycle' test.out

#- 34 UpdateStatCycle
./ng net.accelbyte.sdk.cli.Main social updateStatCycle \
    --cycleId 'v7RrnHCG' \
    --namespace "$AB_NAMESPACE" \
    --body '{"cycleType": "WEEKLY", "description": "hcHxeMVm", "end": "1974-06-07T00:00:00Z", "name": "wQgvwWfM", "resetDate": 25, "resetDay": 37, "resetMonth": 26, "resetTime": "4DbHu8zd", "seasonPeriod": 29, "start": "1984-05-18T00:00:00Z"}' \
    > test.out 2>&1
eval_tap $? 34 'UpdateStatCycle' test.out

#- 35 DeleteStatCycle
./ng net.accelbyte.sdk.cli.Main social deleteStatCycle \
    --cycleId 'HDWACCl5' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 35 'DeleteStatCycle' test.out

#- 36 BulkAddStats
./ng net.accelbyte.sdk.cli.Main social bulkAddStats \
    --cycleId '7QcqoDgK' \
    --namespace "$AB_NAMESPACE" \
    --body '{"statCodes": ["ncD5kjPG", "hkmzrkIK", "myjROCVo"]}' \
    > test.out 2>&1
eval_tap $? 36 'BulkAddStats' test.out

#- 37 StopStatCycle
./ng net.accelbyte.sdk.cli.Main social stopStatCycle \
    --cycleId '86pAur50' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 37 'StopStatCycle' test.out

#- 38 BulkFetchStatItems
./ng net.accelbyte.sdk.cli.Main social bulkFetchStatItems \
    --namespace "$AB_NAMESPACE" \
    --statCode 'szGxLTDm' \
    --userIds 'alDCMZJb' \
    > test.out 2>&1
eval_tap $? 38 'BulkFetchStatItems' test.out

#- 39 BulkIncUserStatItem
./ng net.accelbyte.sdk.cli.Main social bulkIncUserStatItem \
    --namespace "$AB_NAMESPACE" \
    --body '[{"inc": 0.5823523729191086, "statCode": "7BQrD9md", "userId": "zXH9b8Zq"}, {"inc": 0.5700376588121494, "statCode": "Lkb8zcHT", "userId": "WSM2R3D0"}, {"inc": 0.4107274078494947, "statCode": "jmariaY6", "userId": "aBh44znK"}]' \
    > test.out 2>&1
eval_tap $? 39 'BulkIncUserStatItem' test.out

#- 40 BulkIncUserStatItemValue
./ng net.accelbyte.sdk.cli.Main social bulkIncUserStatItemValue \
    --namespace "$AB_NAMESPACE" \
    --body '[{"inc": 0.9001033924432545, "statCode": "yWrkUtXk", "userId": "TkOt3onJ"}, {"inc": 0.9621119358881683, "statCode": "R5Hh3JoX", "userId": "WBTQZ5WS"}, {"inc": 0.22867509167904265, "statCode": "lQSxRlGt", "userId": "gS7gP6o1"}]' \
    > test.out 2>&1
eval_tap $? 40 'BulkIncUserStatItemValue' test.out

#- 41 BulkFetchOrDefaultStatItems
./ng net.accelbyte.sdk.cli.Main social bulkFetchOrDefaultStatItems \
    --namespace "$AB_NAMESPACE" \
    --statCode '362VMe2w' \
    --userIds 'Ke9WaZm7,gPoKPqBO,1NMVMP5e' \
    > test.out 2>&1
eval_tap $? 41 'BulkFetchOrDefaultStatItems' test.out

#- 42 BulkResetUserStatItem
./ng net.accelbyte.sdk.cli.Main social bulkResetUserStatItem \
    --namespace "$AB_NAMESPACE" \
    --body '[{"statCode": "XJolXzJ1", "userId": "31dFzh5d"}, {"statCode": "mWusP9g2", "userId": "gwYD74VS"}, {"statCode": "HKAfyNcR", "userId": "La0W5ZpA"}]' \
    > test.out 2>&1
eval_tap $? 42 'BulkResetUserStatItem' test.out

#- 43 GetStats
./ng net.accelbyte.sdk.cli.Main social getStats \
    --namespace "$AB_NAMESPACE" \
    --cycleIds 'dbAyrX7F' \
    --isGlobal  \
    --isPublic  \
    --limit '2' \
    --offset '65' \
    > test.out 2>&1
eval_tap $? 43 'GetStats' test.out

#- 44 CreateStat
./ng net.accelbyte.sdk.cli.Main social createStat \
    --namespace "$AB_NAMESPACE" \
    --body '{"cycleIds": ["zUqnbNE4", "p1zpxWuv", "ePFazlL0"], "defaultValue": 0.5986021753251757, "description": "7EauQDYT", "globalAggregationMethod": "MIN", "ignoreAdditionalDataOnValueRejected": true, "incrementOnly": true, "isPublic": false, "maximum": 0.9310228902058248, "minimum": 0.7530633334642683, "name": "Ing9o58o", "setAsGlobal": false, "setBy": "SERVER", "statCode": "ZGXFJxG6", "tags": ["n6iB3KmN", "ckktEujO", "docCzRcE"]}' \
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
    --limit '86' \
    --offset '15' \
    --keyword 'taRu48xL' \
    > test.out 2>&1
eval_tap $? 47 'QueryStats' test.out

#- 48 GetStat
./ng net.accelbyte.sdk.cli.Main social getStat \
    --namespace "$AB_NAMESPACE" \
    --statCode 'xI8pX1P4' \
    > test.out 2>&1
eval_tap $? 48 'GetStat' test.out

#- 49 DeleteStat
./ng net.accelbyte.sdk.cli.Main social deleteStat \
    --namespace "$AB_NAMESPACE" \
    --statCode 'Hu0JUipV' \
    > test.out 2>&1
eval_tap $? 49 'DeleteStat' test.out

#- 50 UpdateStat
./ng net.accelbyte.sdk.cli.Main social updateStat \
    --namespace "$AB_NAMESPACE" \
    --statCode 'Uc0Axp6m' \
    --body '{"cycleIds": ["LvbkCoHp", "abCAEue9", "kpFDfg0d"], "defaultValue": 0.3690796977221902, "description": "fjo3g4uA", "globalAggregationMethod": "LAST", "ignoreAdditionalDataOnValueRejected": false, "isPublic": true, "name": "iWI4c6i3", "tags": ["68HPjiR2", "LeURXeiS", "ejRM2usk"]}' \
    > test.out 2>&1
eval_tap $? 50 'UpdateStat' test.out

#- 51 GetStatItems
./ng net.accelbyte.sdk.cli.Main social getStatItems \
    --namespace "$AB_NAMESPACE" \
    --statCode 'xgqSncRQ' \
    --limit '89' \
    --offset '43' \
    --sortBy '27hsPE0B' \
    > test.out 2>&1
eval_tap $? 51 'GetStatItems' test.out

#- 52 DeleteTiedStat
./ng net.accelbyte.sdk.cli.Main social deleteTiedStat \
    --namespace "$AB_NAMESPACE" \
    --statCode 'R3ktBKt4' \
    > test.out 2>&1
eval_tap $? 52 'DeleteTiedStat' test.out

#- 53 GetUserStatCycleItems
./ng net.accelbyte.sdk.cli.Main social getUserStatCycleItems \
    --cycleId 'ble7vj29' \
    --namespace "$AB_NAMESPACE" \
    --userId 'iP0IuciE' \
    --isPublic  \
    --limit '40' \
    --offset '64' \
    --sortBy 'dBd1SQW9' \
    --statCodes 'VLz9nm5s' \
    > test.out 2>&1
eval_tap $? 53 'GetUserStatCycleItems' test.out

#- 54 GetUserStatItems
./ng net.accelbyte.sdk.cli.Main social getUserStatItems \
    --namespace "$AB_NAMESPACE" \
    --userId 'bE3HjoXI' \
    --isPublic  \
    --limit '79' \
    --offset '81' \
    --sortBy 'QJTKn5Xv' \
    --statCodes 'Cr0hf0D6' \
    --tags 'uBqIzqge' \
    > test.out 2>&1
eval_tap $? 54 'GetUserStatItems' test.out

#- 55 BulkCreateUserStatItems
./ng net.accelbyte.sdk.cli.Main social bulkCreateUserStatItems \
    --namespace "$AB_NAMESPACE" \
    --userId 't2UiCq89' \
    --body '[{"statCode": "bCuWjYSK"}, {"statCode": "YrKKZ81Z"}, {"statCode": "EQB49nVR"}]' \
    > test.out 2>&1
eval_tap $? 55 'BulkCreateUserStatItems' test.out

#- 56 BulkIncUserStatItem1
./ng net.accelbyte.sdk.cli.Main social bulkIncUserStatItem1 \
    --namespace "$AB_NAMESPACE" \
    --userId 'LpMdutNy' \
    --body '[{"inc": 0.34457144365257353, "statCode": "wnAAflrQ"}, {"inc": 0.0569155111820171, "statCode": "DUKlWeF1"}, {"inc": 0.4102423677128354, "statCode": "UadbsDVs"}]' \
    > test.out 2>&1
eval_tap $? 56 'BulkIncUserStatItem1' test.out

#- 57 BulkIncUserStatItemValue1
./ng net.accelbyte.sdk.cli.Main social bulkIncUserStatItemValue1 \
    --namespace "$AB_NAMESPACE" \
    --userId 'wXax5eVR' \
    --body '[{"inc": 0.06047979543002657, "statCode": "QdEGsssi"}, {"inc": 0.5654826486379863, "statCode": "wweQiGtk"}, {"inc": 0.010637427713878211, "statCode": "iCxWFIEV"}]' \
    > test.out 2>&1
eval_tap $? 57 'BulkIncUserStatItemValue1' test.out

#- 58 BulkResetUserStatItem1
./ng net.accelbyte.sdk.cli.Main social bulkResetUserStatItem1 \
    --namespace "$AB_NAMESPACE" \
    --userId 'wlee4IKq' \
    --body '[{"statCode": "MCJDcemw"}, {"statCode": "8iXxedR8"}, {"statCode": "q8MGH87C"}]' \
    > test.out 2>&1
eval_tap $? 58 'BulkResetUserStatItem1' test.out

#- 59 CreateUserStatItem
./ng net.accelbyte.sdk.cli.Main social createUserStatItem \
    --namespace "$AB_NAMESPACE" \
    --statCode 'VBIRSfBG' \
    --userId 'SS0pjSdd' \
    > test.out 2>&1
eval_tap $? 59 'CreateUserStatItem' test.out

#- 60 DeleteUserStatItems
./ng net.accelbyte.sdk.cli.Main social deleteUserStatItems \
    --namespace "$AB_NAMESPACE" \
    --statCode 'v41thP3J' \
    --userId 'COV6JrG0' \
    > test.out 2>&1
eval_tap $? 60 'DeleteUserStatItems' test.out

#- 61 IncUserStatItemValue
./ng net.accelbyte.sdk.cli.Main social incUserStatItemValue \
    --namespace "$AB_NAMESPACE" \
    --statCode 'VKXI8s3H' \
    --userId 'LWfeGBQ5' \
    --body '{"inc": 0.3765998929716293}' \
    > test.out 2>&1
eval_tap $? 61 'IncUserStatItemValue' test.out

#- 62 ResetUserStatItemValue
./ng net.accelbyte.sdk.cli.Main social resetUserStatItemValue \
    --namespace "$AB_NAMESPACE" \
    --statCode 'ArFrUsuu' \
    --userId '0kO32q7q' \
    --additionalKey 'VcUFFYxj' \
    --body '{"additionalData": {"7kqsyaxy": {}, "717fb5E5": {}, "jt0Jhrjc": {}}}' \
    > test.out 2>&1
eval_tap $? 62 'ResetUserStatItemValue' test.out

#- 63 GetGlobalStatItems1
./ng net.accelbyte.sdk.cli.Main social getGlobalStatItems1 \
    --namespace "$AB_NAMESPACE" \
    --limit '8' \
    --offset '70' \
    --statCodes '8nljMwfV' \
    > test.out 2>&1
eval_tap $? 63 'GetGlobalStatItems1' test.out

#- 64 GetGlobalStatItemByStatCode1
./ng net.accelbyte.sdk.cli.Main social getGlobalStatItemByStatCode1 \
    --namespace "$AB_NAMESPACE" \
    --statCode 'oPH7oE12' \
    > test.out 2>&1
eval_tap $? 64 'GetGlobalStatItemByStatCode1' test.out

#- 65 GetStatCycles1
./ng net.accelbyte.sdk.cli.Main social getStatCycles1 \
    --namespace "$AB_NAMESPACE" \
    --cycleType 'ANNUALLY' \
    --limit '71' \
    --name 'JqanyL1D' \
    --offset '78' \
    --sortBy 'VckU9BX8' \
    --status 'ACTIVE' \
    > test.out 2>&1
eval_tap $? 65 'GetStatCycles1' test.out

#- 66 BulkGetStatCycle1
./ng net.accelbyte.sdk.cli.Main social bulkGetStatCycle1 \
    --namespace "$AB_NAMESPACE" \
    --body '{"cycleIds": ["aCEKdVcj", "SWlHGe2A", "Gk28ZsUe"]}' \
    > test.out 2>&1
eval_tap $? 66 'BulkGetStatCycle1' test.out

#- 67 GetStatCycle1
./ng net.accelbyte.sdk.cli.Main social getStatCycle1 \
    --cycleId '2RptCORe' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 67 'GetStatCycle1' test.out

#- 68 BulkFetchStatItems1
./ng net.accelbyte.sdk.cli.Main social bulkFetchStatItems1 \
    --namespace "$AB_NAMESPACE" \
    --statCode 'fnMasl9S' \
    --userIds 'vYMhBxxg' \
    > test.out 2>&1
eval_tap $? 68 'BulkFetchStatItems1' test.out

#- 69 PublicBulkIncUserStatItem
./ng net.accelbyte.sdk.cli.Main social publicBulkIncUserStatItem \
    --namespace "$AB_NAMESPACE" \
    --body '[{"inc": 0.5807774604692689, "statCode": "4jw5qZ3O", "userId": "ZVNTTqKP"}, {"inc": 0.858986727612761, "statCode": "7NQqaXhs", "userId": "eefO7VWs"}, {"inc": 0.2617618315692668, "statCode": "c1t4S15b", "userId": "tVJZQb7o"}]' \
    > test.out 2>&1
eval_tap $? 69 'PublicBulkIncUserStatItem' test.out

#- 70 PublicBulkIncUserStatItemValue
./ng net.accelbyte.sdk.cli.Main social publicBulkIncUserStatItemValue \
    --namespace "$AB_NAMESPACE" \
    --body '[{"inc": 0.007061824959048391, "statCode": "S06Eoi8R", "userId": "FrBBwhA3"}, {"inc": 0.5959827842857591, "statCode": "yQ4GPZvQ", "userId": "mVvms5Nb"}, {"inc": 0.9929456284572051, "statCode": "9bqoKp08", "userId": "3hcG7bJp"}]' \
    > test.out 2>&1
eval_tap $? 70 'PublicBulkIncUserStatItemValue' test.out

#- 71 BulkResetUserStatItem2
./ng net.accelbyte.sdk.cli.Main social bulkResetUserStatItem2 \
    --namespace "$AB_NAMESPACE" \
    --body '[{"statCode": "GSHZou4S", "userId": "zw7w8GcF"}, {"statCode": "ZKMSVfwm", "userId": "8HKqA1kP"}, {"statCode": "o86hdUO4", "userId": "khGA2H55"}]' \
    > test.out 2>&1
eval_tap $? 71 'BulkResetUserStatItem2' test.out

#- 72 CreateStat1
./ng net.accelbyte.sdk.cli.Main social createStat1 \
    --namespace "$AB_NAMESPACE" \
    --body '{"cycleIds": ["52kw3GUk", "ZsOFMldX", "vwsrxdD7"], "defaultValue": 0.9710685495666609, "description": "k5nqI1AP", "globalAggregationMethod": "MIN", "ignoreAdditionalDataOnValueRejected": true, "incrementOnly": true, "isPublic": false, "maximum": 0.14740663934341514, "minimum": 0.00515220972411079, "name": "ZPharngI", "setAsGlobal": false, "setBy": "SERVER", "statCode": "k0WEk7Qm", "tags": ["mQTiJ6HF", "KJoC1kAT", "YmyOWpwo"]}' \
    > test.out 2>&1
eval_tap $? 72 'CreateStat1' test.out

#- 73 PublicListMyStatCycleItems
./ng net.accelbyte.sdk.cli.Main social publicListMyStatCycleItems \
    --cycleId 'dDA7YTw5' \
    --namespace "$AB_NAMESPACE" \
    --limit '58' \
    --offset '69' \
    --sortBy '565EDa54' \
    --statCodes 'vyFY7k71,sj41EuHi,3XBumEme' \
    > test.out 2>&1
eval_tap $? 73 'PublicListMyStatCycleItems' test.out

#- 74 PublicListMyStatItems
./ng net.accelbyte.sdk.cli.Main social publicListMyStatItems \
    --namespace "$AB_NAMESPACE" \
    --limit '45' \
    --offset '74' \
    --sortBy 'H05fstTU' \
    --statCodes 'dCzSWk4v,pycv5PVc,OwgWzZ2w' \
    --tags 'DfN1liSQ,BykqAMVs,yhx5T7dg' \
    > test.out 2>&1
eval_tap $? 74 'PublicListMyStatItems' test.out

#- 75 PublicListAllMyStatItems
./ng net.accelbyte.sdk.cli.Main social publicListAllMyStatItems \
    --namespace "$AB_NAMESPACE" \
    --additionalKey 'VXeiU1fZ' \
    --statCodes 'G9CVWcDY,Bj9MTpdd,3KCM1I1l' \
    --tags 'EkCip92X,CjO3ZryR,r0mEI4pe' \
    > test.out 2>&1
eval_tap $? 75 'PublicListAllMyStatItems' test.out

#- 76 GetUserStatCycleItems1
./ng net.accelbyte.sdk.cli.Main social getUserStatCycleItems1 \
    --cycleId 'EfMiY2H3' \
    --namespace "$AB_NAMESPACE" \
    --userId 'bRsO1hk3' \
    --limit '6' \
    --offset '44' \
    --sortBy 'dAacj9kk' \
    --statCodes 'Bd3YWRrc' \
    > test.out 2>&1
eval_tap $? 76 'GetUserStatCycleItems1' test.out

#- 77 PublicQueryUserStatItems
./ng net.accelbyte.sdk.cli.Main social publicQueryUserStatItems \
    --namespace "$AB_NAMESPACE" \
    --userId 'JkRXeLRx' \
    --limit '18' \
    --offset '73' \
    --sortBy 'CcycLALa' \
    --statCodes 'myGXTuig' \
    --tags '5brOvVVb' \
    > test.out 2>&1
eval_tap $? 77 'PublicQueryUserStatItems' test.out

#- 78 PublicBulkCreateUserStatItems
./ng net.accelbyte.sdk.cli.Main social publicBulkCreateUserStatItems \
    --namespace "$AB_NAMESPACE" \
    --userId '6pJF3zXW' \
    --body '[{"statCode": "BhC53v6l"}, {"statCode": "c1psNCbH"}, {"statCode": "9g11te1U"}]' \
    > test.out 2>&1
eval_tap $? 78 'PublicBulkCreateUserStatItems' test.out

#- 79 PublicQueryUserStatItems1
./ng net.accelbyte.sdk.cli.Main social publicQueryUserStatItems1 \
    --namespace "$AB_NAMESPACE" \
    --userId '7j7htnVr' \
    --additionalKey 'I3AuOhzZ' \
    --statCodes 'Wew7IDps,5NafZlYo,aA5gIwlr' \
    --tags 't7KcW2Sc,XIAilD5c,aiZ5SMN3' \
    > test.out 2>&1
eval_tap $? 79 'PublicQueryUserStatItems1' test.out

#- 80 PublicBulkIncUserStatItem1
./ng net.accelbyte.sdk.cli.Main social publicBulkIncUserStatItem1 \
    --namespace "$AB_NAMESPACE" \
    --userId 'zoUEqLnV' \
    --body '[{"inc": 0.4709464588104614, "statCode": "5mUYTyG2"}, {"inc": 0.0992268391546065, "statCode": "5WgWt3BU"}, {"inc": 0.2589561714242714, "statCode": "YezqsozT"}]' \
    > test.out 2>&1
eval_tap $? 80 'PublicBulkIncUserStatItem1' test.out

#- 81 BulkIncUserStatItemValue2
./ng net.accelbyte.sdk.cli.Main social bulkIncUserStatItemValue2 \
    --namespace "$AB_NAMESPACE" \
    --userId 'QtGPY4pl' \
    --body '[{"inc": 0.023543921386866673, "statCode": "8825ANOb"}, {"inc": 0.7314920879127643, "statCode": "QiiInpPT"}, {"inc": 0.5344219743787081, "statCode": "FqlJ4k5v"}]' \
    > test.out 2>&1
eval_tap $? 81 'BulkIncUserStatItemValue2' test.out

#- 82 BulkResetUserStatItem3
./ng net.accelbyte.sdk.cli.Main social bulkResetUserStatItem3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'fFJw0XZ8' \
    --body '[{"statCode": "Wng1Lecr"}, {"statCode": "v7alkBxd"}, {"statCode": "q5yIuH66"}]' \
    > test.out 2>&1
eval_tap $? 82 'BulkResetUserStatItem3' test.out

#- 83 PublicCreateUserStatItem
./ng net.accelbyte.sdk.cli.Main social publicCreateUserStatItem \
    --namespace "$AB_NAMESPACE" \
    --statCode 'y8ck5Jvc' \
    --userId '1ZXVtxYf' \
    > test.out 2>&1
eval_tap $? 83 'PublicCreateUserStatItem' test.out

#- 84 DeleteUserStatItems1
./ng net.accelbyte.sdk.cli.Main social deleteUserStatItems1 \
    --namespace "$AB_NAMESPACE" \
    --statCode 'h8C822ax' \
    --userId 'H2ABbjIx' \
    > test.out 2>&1
eval_tap $? 84 'DeleteUserStatItems1' test.out

#- 85 PublicIncUserStatItem
./ng net.accelbyte.sdk.cli.Main social publicIncUserStatItem \
    --namespace "$AB_NAMESPACE" \
    --statCode '7TmWMs0O' \
    --userId 'yMWDVtoI' \
    --body '{"inc": 0.9447631569778727}' \
    > test.out 2>&1
eval_tap $? 85 'PublicIncUserStatItem' test.out

#- 86 PublicIncUserStatItemValue
./ng net.accelbyte.sdk.cli.Main social publicIncUserStatItemValue \
    --namespace "$AB_NAMESPACE" \
    --statCode 'eJj9MOUC' \
    --userId 'B2oSFRxT' \
    --body '{"inc": 0.30537135456255193}' \
    > test.out 2>&1
eval_tap $? 86 'PublicIncUserStatItemValue' test.out

#- 87 ResetUserStatItemValue1
./ng net.accelbyte.sdk.cli.Main social resetUserStatItemValue1 \
    --namespace "$AB_NAMESPACE" \
    --statCode 'ZNuxbxaT' \
    --userId '1LTPgBjX' \
    > test.out 2>&1
eval_tap $? 87 'ResetUserStatItemValue1' test.out

#- 88 BulkUpdateUserStatItemV2
./ng net.accelbyte.sdk.cli.Main social bulkUpdateUserStatItemV2 \
    --namespace "$AB_NAMESPACE" \
    --body '[{"additionalData": {"3UQsWYmB": {}, "RfHUXPzy": {}, "YBtCISIu": {}}, "additionalKey": "mbmQBHrT", "statCode": "BPTlZfED", "updateStrategy": "INCREMENT", "userId": "8JHi9nKZ", "value": 0.0034153575622148935}, {"additionalData": {"DVpkIQ9h": {}, "HKA7GdMd": {}, "OddfP5Ks": {}}, "additionalKey": "TY5CpGrP", "statCode": "2SBb9lYk", "updateStrategy": "INCREMENT", "userId": "xhxMUbKl", "value": 0.7740810434647785}, {"additionalData": {"kvVt3fks": {}, "J5wgmUwB": {}, "Dgj1DVPN": {}}, "additionalKey": "pU69NMqG", "statCode": "NyOBm4pd", "updateStrategy": "MAX", "userId": "NJvycOWE", "value": 0.6609244236905563}]' \
    > test.out 2>&1
eval_tap $? 88 'BulkUpdateUserStatItemV2' test.out

#- 89 BulkFetchOrDefaultStatItems1
./ng net.accelbyte.sdk.cli.Main social bulkFetchOrDefaultStatItems1 \
    --namespace "$AB_NAMESPACE" \
    --additionalKey 'MkO2nQVj' \
    --statCode 'WJKY7Ffb' \
    --userIds 'UyuHlutC,jWnG59kn,3jOgUaGc' \
    > test.out 2>&1
eval_tap $? 89 'BulkFetchOrDefaultStatItems1' test.out

#- 90 AdminListUsersStatItems
./ng net.accelbyte.sdk.cli.Main social adminListUsersStatItems \
    --namespace "$AB_NAMESPACE" \
    --userId 'lUIxU7zr' \
    --additionalKey 'uAg4sjWl' \
    --statCodes 'yFVpDIt4,6hR8MnRw,G5TpaHJm' \
    --tags '912XratS,HPtV5wpn,I4WguZA3' \
    > test.out 2>&1
eval_tap $? 90 'AdminListUsersStatItems' test.out

#- 91 BulkUpdateUserStatItem
./ng net.accelbyte.sdk.cli.Main social bulkUpdateUserStatItem \
    --namespace "$AB_NAMESPACE" \
    --userId 'NBI5UXQy' \
    --additionalKey 'KOAP8pwD' \
    --body '[{"additionalData": {"FYS6hiT5": {}, "bS8Jxs58": {}, "kHMuGMkr": {}}, "statCode": "OsHYi9Px", "updateStrategy": "OVERRIDE", "value": 0.46564676511388525}, {"additionalData": {"8dZLPFDH": {}, "ZBnxsxNk": {}, "kWyk5CL8": {}}, "statCode": "3sboZPVJ", "updateStrategy": "MIN", "value": 0.15877172585303445}, {"additionalData": {"31I8Oloe": {}, "h3XEIXx5": {}, "sHRLMJIa": {}}, "statCode": "vfQbDwFY", "updateStrategy": "MIN", "value": 0.2524333961452626}]' \
    > test.out 2>&1
eval_tap $? 91 'BulkUpdateUserStatItem' test.out

#- 92 BulkResetUserStatItemValues
./ng net.accelbyte.sdk.cli.Main social bulkResetUserStatItemValues \
    --namespace "$AB_NAMESPACE" \
    --userId 'hXF0Fiz6' \
    --additionalKey 'xcya92cV' \
    --body '[{"additionalData": {"RRT0jwMj": {}, "U5Bgs6I7": {}, "rhRAOVLv": {}}, "statCode": "DhWi0FYU"}, {"additionalData": {"NauW29Rd": {}, "wJ40XaYn": {}, "W43sessP": {}}, "statCode": "qvaJyxiq"}, {"additionalData": {"Cx67w5JS": {}, "tOHx0Tqd": {}, "vSUA1z15": {}}, "statCode": "LcTFSO8v"}]' \
    > test.out 2>&1
eval_tap $? 92 'BulkResetUserStatItemValues' test.out

#- 93 DeleteUserStatItems2
./ng net.accelbyte.sdk.cli.Main social deleteUserStatItems2 \
    --namespace "$AB_NAMESPACE" \
    --statCode 'f552D2Am' \
    --userId 'n2Ge6y7p' \
    --additionalKey 'u0DlzIy5' \
    > test.out 2>&1
eval_tap $? 93 'DeleteUserStatItems2' test.out

#- 94 UpdateUserStatItemValue
./ng net.accelbyte.sdk.cli.Main social updateUserStatItemValue \
    --namespace "$AB_NAMESPACE" \
    --statCode 'GXY8bd5v' \
    --userId 'JQpaH2KH' \
    --additionalKey 'HGiOqTXC' \
    --body '{"additionalData": {"CrNygSKb": {}, "0iVbCzVy": {}, "CJl8O9vX": {}}, "updateStrategy": "MIN", "value": 0.3581399322330814}' \
    > test.out 2>&1
eval_tap $? 94 'UpdateUserStatItemValue' test.out

#- 95 BulkUpdateUserStatItem1
./ng net.accelbyte.sdk.cli.Main social bulkUpdateUserStatItem1 \
    --namespace "$AB_NAMESPACE" \
    --body '[{"additionalData": {"sSAmUZ22": {}, "JD7cSt4V": {}, "EtjpQRSk": {}}, "additionalKey": "5kPuzr0y", "statCode": "krGFjoSR", "updateStrategy": "MAX", "userId": "a9x2Ye9h", "value": 0.8584641998566618}, {"additionalData": {"Av1riKdh": {}, "tLmfR8Qy": {}, "uSyjVy0b": {}}, "additionalKey": "nIiU2wtP", "statCode": "JHq5Q7lb", "updateStrategy": "MAX", "userId": "dF9nOsJI", "value": 0.04342928452075767}, {"additionalData": {"EBvofyL5": {}, "2iuX5UtE": {}, "HEWM25QS": {}}, "additionalKey": "sFOc1leR", "statCode": "eJgTgZji", "updateStrategy": "MIN", "userId": "GCt8eiA0", "value": 0.06346192733329703}]' \
    > test.out 2>&1
eval_tap $? 95 'BulkUpdateUserStatItem1' test.out

#- 96 PublicQueryUserStatItems2
./ng net.accelbyte.sdk.cli.Main social publicQueryUserStatItems2 \
    --namespace "$AB_NAMESPACE" \
    --userId 'Tanj1ahS' \
    --additionalKey '3mBgqnXE' \
    --statCodes 'OPwLsFxa,taw6HkdE,5Vz06e9k' \
    --tags 'CreljsqD,PpNe5brK,4Uzk4uxr' \
    > test.out 2>&1
eval_tap $? 96 'PublicQueryUserStatItems2' test.out

#- 97 BulkUpdateUserStatItem2
./ng net.accelbyte.sdk.cli.Main social bulkUpdateUserStatItem2 \
    --namespace "$AB_NAMESPACE" \
    --userId 'yx3q27eL' \
    --additionalKey 'GnpzoLUF' \
    --body '[{"additionalData": {"JUfZyh9X": {}, "OPsHxDvW": {}, "SfImgUgV": {}}, "statCode": "WSe6hast", "updateStrategy": "OVERRIDE", "value": 0.027449602369745918}, {"additionalData": {"39LxhCCl": {}, "JSAsZCeo": {}, "tHjxLLL8": {}}, "statCode": "LYpN9kds", "updateStrategy": "MAX", "value": 0.1837658628325971}, {"additionalData": {"JrFUFsTn": {}, "RZeDg1Ad": {}, "TCNCkc87": {}}, "statCode": "wQrfccQa", "updateStrategy": "OVERRIDE", "value": 0.26829685166472084}]' \
    > test.out 2>&1
eval_tap $? 97 'BulkUpdateUserStatItem2' test.out

#- 98 UpdateUserStatItemValue1
./ng net.accelbyte.sdk.cli.Main social updateUserStatItemValue1 \
    --namespace "$AB_NAMESPACE" \
    --statCode 'N4HeCJAg' \
    --userId 't1lCOYgy' \
    --additionalKey 'ZgTLtxar' \
    --body '{"additionalData": {"6ykOFxdD": {}, "usvyJa3y": {}, "W4mZVFYZ": {}}, "updateStrategy": "MAX", "value": 0.13097151410387908}' \
    > test.out 2>&1
eval_tap $? 98 'UpdateUserStatItemValue1' test.out


rm -f "tmp.dat"

exit $EXIT_CODE