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
    --limit '95' \
    --offset '34' \
    --statCodes 'meN8gvGK' \
    > test.out 2>&1
eval_tap $? 26 'GetGlobalStatItems' test.out

#- 27 GetGlobalStatItemByStatCode
./ng net.accelbyte.sdk.cli.Main social getGlobalStatItemByStatCode \
    --namespace "$AB_NAMESPACE" \
    --statCode '0tGr2em3' \
    > test.out 2>&1
eval_tap $? 27 'GetGlobalStatItemByStatCode' test.out

#- 28 GetStatCycles
./ng net.accelbyte.sdk.cli.Main social getStatCycles \
    --namespace "$AB_NAMESPACE" \
    --cycleType 'MONTHLY' \
    --limit '6' \
    --name 'oannOnyI' \
    --offset '72' \
    --sortBy '3dQ0KgVR' \
    --status 'STOPPED' \
    > test.out 2>&1
eval_tap $? 28 'GetStatCycles' test.out

#- 29 CreateStatCycle
./ng net.accelbyte.sdk.cli.Main social createStatCycle \
    --namespace "$AB_NAMESPACE" \
    --body '{"cycleType": "DAILY", "description": "e1iezx9W", "end": "1991-03-26T00:00:00Z", "id": "VA7BlYll", "name": "OTVztPuO", "resetDate": 79, "resetDay": 58, "resetMonth": 88, "resetTime": "U9mFHoIq", "seasonPeriod": 12, "start": "1977-07-12T00:00:00Z"}' \
    > test.out 2>&1
eval_tap $? 29 'CreateStatCycle' test.out

#- 30 BulkGetStatCycle
./ng net.accelbyte.sdk.cli.Main social bulkGetStatCycle \
    --namespace "$AB_NAMESPACE" \
    --body '{"cycleIds": ["5pp0SHyg", "K6ntj4ie", "shV02Gav"]}' \
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
    --cycleId 'ai4qHN0W' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 33 'GetStatCycle' test.out

#- 34 UpdateStatCycle
./ng net.accelbyte.sdk.cli.Main social updateStatCycle \
    --cycleId 'mYA93qVT' \
    --namespace "$AB_NAMESPACE" \
    --body '{"cycleType": "WEEKLY", "description": "WsdsEnAK", "end": "1978-06-10T00:00:00Z", "name": "uyPmWgpD", "resetDate": 10, "resetDay": 83, "resetMonth": 16, "resetTime": "Qc33JNcv", "seasonPeriod": 26, "start": "1984-08-21T00:00:00Z"}' \
    > test.out 2>&1
eval_tap $? 34 'UpdateStatCycle' test.out

#- 35 DeleteStatCycle
./ng net.accelbyte.sdk.cli.Main social deleteStatCycle \
    --cycleId 'fBNBo3o4' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 35 'DeleteStatCycle' test.out

#- 36 BulkAddStats
./ng net.accelbyte.sdk.cli.Main social bulkAddStats \
    --cycleId 'EJFx4VtL' \
    --namespace "$AB_NAMESPACE" \
    --body '{"statCodes": ["BP787Wv8", "eWZNZzLI", "SWNYZMTA"]}' \
    > test.out 2>&1
eval_tap $? 36 'BulkAddStats' test.out

#- 37 StopStatCycle
./ng net.accelbyte.sdk.cli.Main social stopStatCycle \
    --cycleId 'jPsbm99z' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 37 'StopStatCycle' test.out

#- 38 BulkFetchStatItems
./ng net.accelbyte.sdk.cli.Main social bulkFetchStatItems \
    --namespace "$AB_NAMESPACE" \
    --statCode 'wN7AVO3h' \
    --userIds 'vhfGer88' \
    > test.out 2>&1
eval_tap $? 38 'BulkFetchStatItems' test.out

#- 39 BulkIncUserStatItem
./ng net.accelbyte.sdk.cli.Main social bulkIncUserStatItem \
    --namespace "$AB_NAMESPACE" \
    --body '[{"inc": 0.764690111191139, "statCode": "iBPV94MQ", "userId": "3JfigPaQ"}, {"inc": 0.25720707532335496, "statCode": "QimS3Z9H", "userId": "RwJOYhVg"}, {"inc": 0.8899239643735806, "statCode": "FD0JtJoD", "userId": "jALC53nz"}]' \
    > test.out 2>&1
eval_tap $? 39 'BulkIncUserStatItem' test.out

#- 40 BulkIncUserStatItemValue
./ng net.accelbyte.sdk.cli.Main social bulkIncUserStatItemValue \
    --namespace "$AB_NAMESPACE" \
    --body '[{"inc": 0.8521975250637279, "statCode": "Pp5SS403", "userId": "RNlvz1Fy"}, {"inc": 0.13894660667925973, "statCode": "xAuE6UCK", "userId": "lZzcXFoY"}, {"inc": 0.22356347937329202, "statCode": "PL7XquNo", "userId": "tUQUyV9M"}]' \
    > test.out 2>&1
eval_tap $? 40 'BulkIncUserStatItemValue' test.out

#- 41 BulkFetchOrDefaultStatItems
./ng net.accelbyte.sdk.cli.Main social bulkFetchOrDefaultStatItems \
    --namespace "$AB_NAMESPACE" \
    --statCode 'rsulreHK' \
    --userIds 'MEui8v09,gMOXtjyF,BymiRqPg' \
    > test.out 2>&1
eval_tap $? 41 'BulkFetchOrDefaultStatItems' test.out

#- 42 BulkResetUserStatItem
./ng net.accelbyte.sdk.cli.Main social bulkResetUserStatItem \
    --namespace "$AB_NAMESPACE" \
    --body '[{"statCode": "iYdErJgm", "userId": "pOM38PUq"}, {"statCode": "LCVDHTXE", "userId": "MwB921Ko"}, {"statCode": "hb0IXkZP", "userId": "K0vonf5a"}]' \
    > test.out 2>&1
eval_tap $? 42 'BulkResetUserStatItem' test.out

#- 43 GetStats
./ng net.accelbyte.sdk.cli.Main social getStats \
    --namespace "$AB_NAMESPACE" \
    --cycleIds 'IC8lpILi' \
    --isGlobal  \
    --isPublic  \
    --limit '48' \
    --offset '53' \
    > test.out 2>&1
eval_tap $? 43 'GetStats' test.out

#- 44 CreateStat
./ng net.accelbyte.sdk.cli.Main social createStat \
    --namespace "$AB_NAMESPACE" \
    --body '{"capCycleOverride": true, "cycleIds": ["4LsabquK", "J9pksNgY", "TrL6yKtV"], "cycleOverrides": [{"cycleId": "akZ6Rexg", "maximum": 0.025290588997098795, "minimum": 0.6558677953681934}, {"cycleId": "5hreXRX2", "maximum": 0.5875513316322327, "minimum": 0.5107780838725621}, {"cycleId": "snLGYyVl", "maximum": 0.9012869224657043, "minimum": 0.7137291182966978}], "defaultValue": 0.8722578768437224, "description": "LYsxWzn3", "globalAggregationMethod": "TOTAL", "ignoreAdditionalDataOnValueRejected": true, "incrementOnly": false, "isPublic": false, "maximum": 0.7612485492989487, "minimum": 0.49472319378015606, "name": "vfnIruTp", "setAsGlobal": true, "setBy": "CLIENT", "statCode": "gJL7sUsI", "tags": ["Xm2GezRk", "jya7zsui", "FkTwDnVU"], "visibility": "SERVERONLY"}' \
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
    --limit '75' \
    --offset '38' \
    --keyword 'LgziyJhR' \
    > test.out 2>&1
eval_tap $? 47 'QueryStats' test.out

#- 48 GetStat
./ng net.accelbyte.sdk.cli.Main social getStat \
    --namespace "$AB_NAMESPACE" \
    --statCode 'rugJhocr' \
    > test.out 2>&1
eval_tap $? 48 'GetStat' test.out

#- 49 DeleteStat
./ng net.accelbyte.sdk.cli.Main social deleteStat \
    --namespace "$AB_NAMESPACE" \
    --statCode 'HOT6QQoz' \
    > test.out 2>&1
eval_tap $? 49 'DeleteStat' test.out

#- 50 UpdateStat
./ng net.accelbyte.sdk.cli.Main social updateStat \
    --namespace "$AB_NAMESPACE" \
    --statCode 'UmmR3ZIa' \
    --body '{"capCycleOverride": true, "cycleIds": ["JyempuwI", "TwMrfNMP", "Mn89mW6r"], "cycleOverrides": [{"cycleId": "x1prneao", "maximum": 0.3152255180718423, "minimum": 0.8004790407145649}, {"cycleId": "SI2qE0O3", "maximum": 0.8426470243285316, "minimum": 0.3498744063784779}, {"cycleId": "OTZxXy4K", "maximum": 0.8483148158903177, "minimum": 0.1264742584013726}], "defaultValue": 0.22374865210919614, "description": "HVq02mLe", "globalAggregationMethod": "LAST", "ignoreAdditionalDataOnValueRejected": false, "isPublic": true, "name": "BApvIXwS", "tags": ["TITVoji9", "oH2c7OdQ", "LSde9Fbn"], "visibility": "SERVERONLY"}' \
    > test.out 2>&1
eval_tap $? 50 'UpdateStat' test.out

#- 51 GetStatItems
./ng net.accelbyte.sdk.cli.Main social getStatItems \
    --namespace "$AB_NAMESPACE" \
    --statCode 'KxrWS218' \
    --limit '77' \
    --offset '75' \
    --sortBy 'QkdqUH7H' \
    > test.out 2>&1
eval_tap $? 51 'GetStatItems' test.out

#- 52 DeleteTiedStat
./ng net.accelbyte.sdk.cli.Main social deleteTiedStat \
    --namespace "$AB_NAMESPACE" \
    --statCode 'HbPV56ov' \
    > test.out 2>&1
eval_tap $? 52 'DeleteTiedStat' test.out

#- 53 GetUserStatCycleItems
./ng net.accelbyte.sdk.cli.Main social getUserStatCycleItems \
    --cycleId 'Ug4WutrN' \
    --namespace "$AB_NAMESPACE" \
    --userId 'FXjKVSho' \
    --isPublic  \
    --limit '88' \
    --offset '71' \
    --sortBy 'z4u7l8B0' \
    --statCodes 'uGQvooQI' \
    > test.out 2>&1
eval_tap $? 53 'GetUserStatCycleItems' test.out

#- 54 GetUserStatItems
./ng net.accelbyte.sdk.cli.Main social getUserStatItems \
    --namespace "$AB_NAMESPACE" \
    --userId '7NQP8z9m' \
    --isPublic  \
    --limit '42' \
    --offset '19' \
    --sortBy '5tekuXTb' \
    --statCodes 'uHRsvOGD' \
    --tags 'XKXqBUdr' \
    > test.out 2>&1
eval_tap $? 54 'GetUserStatItems' test.out

#- 55 BulkCreateUserStatItems
./ng net.accelbyte.sdk.cli.Main social bulkCreateUserStatItems \
    --namespace "$AB_NAMESPACE" \
    --userId 'h4AoeHFb' \
    --body '[{"statCode": "JwxfaMBc"}, {"statCode": "YGvyluj3"}, {"statCode": "Phspr6lh"}]' \
    > test.out 2>&1
eval_tap $? 55 'BulkCreateUserStatItems' test.out

#- 56 BulkIncUserStatItem1
./ng net.accelbyte.sdk.cli.Main social bulkIncUserStatItem1 \
    --namespace "$AB_NAMESPACE" \
    --userId 'Keki1vzK' \
    --body '[{"inc": 0.17930705459461116, "statCode": "X2kTtlj9"}, {"inc": 0.8321328516687733, "statCode": "LVftH8XS"}, {"inc": 0.7522544917011538, "statCode": "mD63Cihf"}]' \
    > test.out 2>&1
eval_tap $? 56 'BulkIncUserStatItem1' test.out

#- 57 BulkIncUserStatItemValue1
./ng net.accelbyte.sdk.cli.Main social bulkIncUserStatItemValue1 \
    --namespace "$AB_NAMESPACE" \
    --userId 'PBjBaV40' \
    --body '[{"inc": 0.7521323093877136, "statCode": "JZo7RRCZ"}, {"inc": 0.7388163486416067, "statCode": "m5kQaGjq"}, {"inc": 0.24172856846883228, "statCode": "Wgf0iQnH"}]' \
    > test.out 2>&1
eval_tap $? 57 'BulkIncUserStatItemValue1' test.out

#- 58 BulkResetUserStatItem1
./ng net.accelbyte.sdk.cli.Main social bulkResetUserStatItem1 \
    --namespace "$AB_NAMESPACE" \
    --userId 'j1LXYwkr' \
    --body '[{"statCode": "SdOMWnd2"}, {"statCode": "4uvvNg7k"}, {"statCode": "LXySl6xo"}]' \
    > test.out 2>&1
eval_tap $? 58 'BulkResetUserStatItem1' test.out

#- 59 CreateUserStatItem
./ng net.accelbyte.sdk.cli.Main social createUserStatItem \
    --namespace "$AB_NAMESPACE" \
    --statCode 'dfeCvZzu' \
    --userId '2ibDgB7b' \
    > test.out 2>&1
eval_tap $? 59 'CreateUserStatItem' test.out

#- 60 DeleteUserStatItems
./ng net.accelbyte.sdk.cli.Main social deleteUserStatItems \
    --namespace "$AB_NAMESPACE" \
    --statCode 'soo6jtgZ' \
    --userId 'HBdGB7cS' \
    > test.out 2>&1
eval_tap $? 60 'DeleteUserStatItems' test.out

#- 61 IncUserStatItemValue
./ng net.accelbyte.sdk.cli.Main social incUserStatItemValue \
    --namespace "$AB_NAMESPACE" \
    --statCode 'V4HbXHTD' \
    --userId 'IjDGUY76' \
    --body '{"inc": 0.20686127327489945}' \
    > test.out 2>&1
eval_tap $? 61 'IncUserStatItemValue' test.out

#- 62 ResetUserStatItemValue
./ng net.accelbyte.sdk.cli.Main social resetUserStatItemValue \
    --namespace "$AB_NAMESPACE" \
    --statCode '5HjBLZIk' \
    --userId '5qUSR8Zq' \
    --additionalKey 'QHCbjzr5' \
    --body '{"additionalData": {"pG9ntRLu": {}, "AGeKAuhr": {}, "87xSkWhY": {}}}' \
    > test.out 2>&1
eval_tap $? 62 'ResetUserStatItemValue' test.out

#- 63 GetGlobalStatItems1
./ng net.accelbyte.sdk.cli.Main social getGlobalStatItems1 \
    --namespace "$AB_NAMESPACE" \
    --limit '9' \
    --offset '88' \
    --statCodes 'FnAHJ7BJ' \
    > test.out 2>&1
eval_tap $? 63 'GetGlobalStatItems1' test.out

#- 64 GetGlobalStatItemByStatCode1
./ng net.accelbyte.sdk.cli.Main social getGlobalStatItemByStatCode1 \
    --namespace "$AB_NAMESPACE" \
    --statCode 'hjLkQDSs' \
    > test.out 2>&1
eval_tap $? 64 'GetGlobalStatItemByStatCode1' test.out

#- 65 GetStatCycles1
./ng net.accelbyte.sdk.cli.Main social getStatCycles1 \
    --namespace "$AB_NAMESPACE" \
    --cycleType 'DAILY' \
    --limit '48' \
    --name 'nrLEpf63' \
    --offset '2' \
    --sortBy 'prdQz5gH' \
    --status 'INIT' \
    > test.out 2>&1
eval_tap $? 65 'GetStatCycles1' test.out

#- 66 BulkGetStatCycle1
./ng net.accelbyte.sdk.cli.Main social bulkGetStatCycle1 \
    --namespace "$AB_NAMESPACE" \
    --body '{"cycleIds": ["N9Wl3opr", "ZwwSEJod", "twbSSlts"]}' \
    > test.out 2>&1
eval_tap $? 66 'BulkGetStatCycle1' test.out

#- 67 GetStatCycle1
./ng net.accelbyte.sdk.cli.Main social getStatCycle1 \
    --cycleId 'AcJEVArT' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 67 'GetStatCycle1' test.out

#- 68 BulkFetchStatItems1
./ng net.accelbyte.sdk.cli.Main social bulkFetchStatItems1 \
    --namespace "$AB_NAMESPACE" \
    --statCode '1OGkWxxZ' \
    --userIds 'xGQH73p3' \
    > test.out 2>&1
eval_tap $? 68 'BulkFetchStatItems1' test.out

#- 69 PublicBulkIncUserStatItem
./ng net.accelbyte.sdk.cli.Main social publicBulkIncUserStatItem \
    --namespace "$AB_NAMESPACE" \
    --body '[{"inc": 0.2772588665664295, "statCode": "a0nz2o6E", "userId": "H20FWfMO"}, {"inc": 0.32652776136045214, "statCode": "R9n3TEoF", "userId": "cIkLhTpT"}, {"inc": 0.7303410406894036, "statCode": "qgBcU6dC", "userId": "vPHJi5LP"}]' \
    > test.out 2>&1
eval_tap $? 69 'PublicBulkIncUserStatItem' test.out

#- 70 PublicBulkIncUserStatItemValue
./ng net.accelbyte.sdk.cli.Main social publicBulkIncUserStatItemValue \
    --namespace "$AB_NAMESPACE" \
    --body '[{"inc": 0.190255386456731, "statCode": "CFcudhMX", "userId": "NknWSwnu"}, {"inc": 0.9790372497446227, "statCode": "VUdEEwbz", "userId": "1PMX0psC"}, {"inc": 0.25203771950105747, "statCode": "9caafTBI", "userId": "gbMC2lmS"}]' \
    > test.out 2>&1
eval_tap $? 70 'PublicBulkIncUserStatItemValue' test.out

#- 71 BulkResetUserStatItem2
./ng net.accelbyte.sdk.cli.Main social bulkResetUserStatItem2 \
    --namespace "$AB_NAMESPACE" \
    --body '[{"statCode": "WEFohCGv", "userId": "UtxuHQep"}, {"statCode": "Et7SJGkW", "userId": "sbouZ65J"}, {"statCode": "pYXFbb8z", "userId": "HtJ63GU4"}]' \
    > test.out 2>&1
eval_tap $? 71 'BulkResetUserStatItem2' test.out

#- 72 CreateStat1
./ng net.accelbyte.sdk.cli.Main social createStat1 \
    --namespace "$AB_NAMESPACE" \
    --body '{"capCycleOverride": false, "cycleIds": ["q4KIwAJn", "m5PpJLzm", "GdgzQugs"], "cycleOverrides": [{"cycleId": "zp1kwIMk", "maximum": 0.684759756170891, "minimum": 0.46880723272488733}, {"cycleId": "SwgYsBbc", "maximum": 0.6877049818029817, "minimum": 0.713625238123597}, {"cycleId": "IYpokudP", "maximum": 0.49615220795837, "minimum": 0.21073038406680078}], "defaultValue": 0.3606145470730059, "description": "6lyQ4VWa", "globalAggregationMethod": "MAX", "ignoreAdditionalDataOnValueRejected": false, "incrementOnly": false, "isPublic": true, "maximum": 0.3012313181164592, "minimum": 0.6255411943925637, "name": "45jsS6m4", "setAsGlobal": false, "setBy": "CLIENT", "statCode": "9V7uTzus", "tags": ["AUR3Sbl4", "DLfPdD5b", "sfDJwPlx"], "visibility": "SERVERONLY"}' \
    > test.out 2>&1
eval_tap $? 72 'CreateStat1' test.out

#- 73 PublicListMyStatCycleItems
./ng net.accelbyte.sdk.cli.Main social publicListMyStatCycleItems \
    --cycleId 'Za6aSESp' \
    --namespace "$AB_NAMESPACE" \
    --limit '78' \
    --offset '16' \
    --sortBy 'yXR2I7jo' \
    --statCodes 'mrdFDNap,0qmVO5gz,P69zt18W' \
    > test.out 2>&1
eval_tap $? 73 'PublicListMyStatCycleItems' test.out

#- 74 PublicListMyStatItems
./ng net.accelbyte.sdk.cli.Main social publicListMyStatItems \
    --namespace "$AB_NAMESPACE" \
    --limit '91' \
    --offset '8' \
    --sortBy 'e2K0k9mQ' \
    --statCodes '78paYAqX,6b7jf6gA,HS8RZkys' \
    --tags 'fwdrwjbl,yHGYLw8n,gsjIHXln' \
    > test.out 2>&1
eval_tap $? 74 'PublicListMyStatItems' test.out

#- 75 PublicListAllMyStatItems
./ng net.accelbyte.sdk.cli.Main social publicListAllMyStatItems \
    --namespace "$AB_NAMESPACE" \
    --additionalKey 'CYuAdVhY' \
    --statCodes 'cvhZ5Tp1,hLW4lpVA,uWRYcwPI' \
    --tags 'EtWXFTI3,l2FPSfT9,te7llwaX' \
    > test.out 2>&1
eval_tap $? 75 'PublicListAllMyStatItems' test.out

#- 76 GetUserStatCycleItems1
./ng net.accelbyte.sdk.cli.Main social getUserStatCycleItems1 \
    --cycleId 'HvopbwTg' \
    --namespace "$AB_NAMESPACE" \
    --userId '9CNfrYcv' \
    --limit '0' \
    --offset '13' \
    --sortBy 'iT8GjH6d' \
    --statCodes 'guinCuYe' \
    > test.out 2>&1
eval_tap $? 76 'GetUserStatCycleItems1' test.out

#- 77 PublicQueryUserStatItems1
./ng net.accelbyte.sdk.cli.Main social publicQueryUserStatItems1 \
    --namespace "$AB_NAMESPACE" \
    --userId 'FQoZ0m3b' \
    --limit '30' \
    --offset '58' \
    --sortBy 'a0Tt6CK3' \
    --statCodes 'znJanA6J' \
    --tags 'cLcRiK46' \
    > test.out 2>&1
eval_tap $? 77 'PublicQueryUserStatItems1' test.out

#- 78 PublicBulkCreateUserStatItems
./ng net.accelbyte.sdk.cli.Main social publicBulkCreateUserStatItems \
    --namespace "$AB_NAMESPACE" \
    --userId 'QAs4Smzd' \
    --body '[{"statCode": "jW4PJxK4"}, {"statCode": "zsIyHpqT"}, {"statCode": "MNpv2F8U"}]' \
    > test.out 2>&1
eval_tap $? 78 'PublicBulkCreateUserStatItems' test.out

#- 79 PublicQueryUserStatItems
./ng net.accelbyte.sdk.cli.Main social publicQueryUserStatItems \
    --namespace "$AB_NAMESPACE" \
    --userId 'otO3n9Sf' \
    --additionalKey '545Sdotx' \
    --statCodes 'G7MsBGlz,eq0YC5iJ,uWwMU0sF' \
    --tags 'mL7nriPW,aL4QXXha,s5j1pjZK' \
    > test.out 2>&1
eval_tap $? 79 'PublicQueryUserStatItems' test.out

#- 80 PublicBulkIncUserStatItem1
./ng net.accelbyte.sdk.cli.Main social publicBulkIncUserStatItem1 \
    --namespace "$AB_NAMESPACE" \
    --userId 'eRuYhZR6' \
    --body '[{"inc": 0.07106486664668665, "statCode": "KlGrWi6j"}, {"inc": 0.4310907800403321, "statCode": "f1kgIAQb"}, {"inc": 0.962054441541059, "statCode": "DqNHo1At"}]' \
    > test.out 2>&1
eval_tap $? 80 'PublicBulkIncUserStatItem1' test.out

#- 81 BulkIncUserStatItemValue2
./ng net.accelbyte.sdk.cli.Main social bulkIncUserStatItemValue2 \
    --namespace "$AB_NAMESPACE" \
    --userId '6EuwzrAq' \
    --body '[{"inc": 0.8392379406760887, "statCode": "ZSZtdvBk"}, {"inc": 0.6609558904488234, "statCode": "8U5FVVsH"}, {"inc": 0.6847731424863757, "statCode": "BkkkY9WD"}]' \
    > test.out 2>&1
eval_tap $? 81 'BulkIncUserStatItemValue2' test.out

#- 82 BulkResetUserStatItem3
./ng net.accelbyte.sdk.cli.Main social bulkResetUserStatItem3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'BsKtkMyT' \
    --body '[{"statCode": "uDbUCoX3"}, {"statCode": "RAe42p75"}, {"statCode": "4yL9J5nE"}]' \
    > test.out 2>&1
eval_tap $? 82 'BulkResetUserStatItem3' test.out

#- 83 PublicCreateUserStatItem
./ng net.accelbyte.sdk.cli.Main social publicCreateUserStatItem \
    --namespace "$AB_NAMESPACE" \
    --statCode 'Z8nncN9E' \
    --userId '3hAWW6lQ' \
    > test.out 2>&1
eval_tap $? 83 'PublicCreateUserStatItem' test.out

#- 84 DeleteUserStatItems1
./ng net.accelbyte.sdk.cli.Main social deleteUserStatItems1 \
    --namespace "$AB_NAMESPACE" \
    --statCode 'e15N8Y00' \
    --userId 're6zwWxB' \
    > test.out 2>&1
eval_tap $? 84 'DeleteUserStatItems1' test.out

#- 85 PublicIncUserStatItem
./ng net.accelbyte.sdk.cli.Main social publicIncUserStatItem \
    --namespace "$AB_NAMESPACE" \
    --statCode 't5Vngaxh' \
    --userId '5sMC5otj' \
    --body '{"inc": 0.7949261246361584}' \
    > test.out 2>&1
eval_tap $? 85 'PublicIncUserStatItem' test.out

#- 86 PublicIncUserStatItemValue
./ng net.accelbyte.sdk.cli.Main social publicIncUserStatItemValue \
    --namespace "$AB_NAMESPACE" \
    --statCode 'JKpeBFgy' \
    --userId 'dTJzhj5W' \
    --body '{"inc": 0.8983316906487697}' \
    > test.out 2>&1
eval_tap $? 86 'PublicIncUserStatItemValue' test.out

#- 87 ResetUserStatItemValue1
./ng net.accelbyte.sdk.cli.Main social resetUserStatItemValue1 \
    --namespace "$AB_NAMESPACE" \
    --statCode '9UfqssJ9' \
    --userId 'YHy7rpoe' \
    > test.out 2>&1
eval_tap $? 87 'ResetUserStatItemValue1' test.out

#- 88 BulkUpdateUserStatItemV2
./ng net.accelbyte.sdk.cli.Main social bulkUpdateUserStatItemV2 \
    --namespace "$AB_NAMESPACE" \
    --body '[{"additionalData": {"LoosC5gn": {}, "cgupUAYp": {}, "l6nXE5ke": {}}, "additionalKey": "dcUVCNTw", "statCode": "lGflOw0H", "updateStrategy": "MIN", "userId": "9UqAaIsI", "value": 0.4747577115944852}, {"additionalData": {"6krNNHNc": {}, "FxwWmYma": {}, "wNAPMtuE": {}}, "additionalKey": "4AWAn7JC", "statCode": "l0JRqml5", "updateStrategy": "MIN", "userId": "IAlsG10A", "value": 0.035797339849050314}, {"additionalData": {"VdC79B26": {}, "VTdOJPqT": {}, "VGLQuGrp": {}}, "additionalKey": "SVgMFTL7", "statCode": "kcD6IX9F", "updateStrategy": "MIN", "userId": "5Vn3RK8J", "value": 0.008516402148848634}]' \
    > test.out 2>&1
eval_tap $? 88 'BulkUpdateUserStatItemV2' test.out

#- 89 BulkFetchOrDefaultStatItems1
./ng net.accelbyte.sdk.cli.Main social bulkFetchOrDefaultStatItems1 \
    --namespace "$AB_NAMESPACE" \
    --additionalKey 'is4tBBeZ' \
    --statCode 'PizJYn6I' \
    --userIds 'kw1jywAL,4leS0R8E,zyrWabLM' \
    > test.out 2>&1
eval_tap $? 89 'BulkFetchOrDefaultStatItems1' test.out

#- 90 AdminListUsersStatItems
./ng net.accelbyte.sdk.cli.Main social adminListUsersStatItems \
    --namespace "$AB_NAMESPACE" \
    --userId 'Qk9soLAi' \
    --additionalKey 'm3uz8r0I' \
    --statCodes 'v29URQIf,xiBQPRcp,TO2IlK8W' \
    --tags 'dDgbCmrC,fgFkFIj0,4dywUNiP' \
    > test.out 2>&1
eval_tap $? 90 'AdminListUsersStatItems' test.out

#- 91 BulkUpdateUserStatItem
./ng net.accelbyte.sdk.cli.Main social bulkUpdateUserStatItem \
    --namespace "$AB_NAMESPACE" \
    --userId '15IscLwE' \
    --additionalKey 'hS1IyoPX' \
    --body '[{"additionalData": {"HDCJriH2": {}, "kaLt4Do7": {}, "4kSfcIYg": {}}, "statCode": "YMTXnzXp", "updateStrategy": "INCREMENT", "value": 0.7055591283221219}, {"additionalData": {"WNIMre9o": {}, "WKkJ6Wjv": {}, "21oxuEgQ": {}}, "statCode": "yuB3rqLz", "updateStrategy": "INCREMENT", "value": 0.012618110851876585}, {"additionalData": {"hEbEdYq0": {}, "poBS5h9M": {}, "AOl8Wk4r": {}}, "statCode": "rxkuIqu6", "updateStrategy": "OVERRIDE", "value": 0.20043137969484026}]' \
    > test.out 2>&1
eval_tap $? 91 'BulkUpdateUserStatItem' test.out

#- 92 BulkGetOrDefaultByUserId
./ng net.accelbyte.sdk.cli.Main social bulkGetOrDefaultByUserId \
    --namespace "$AB_NAMESPACE" \
    --userId 'uuxaIpsp' \
    --additionalKey 'eL5Q2XH3' \
    --body '{"statCodes": ["5G2uxjVu", "OjXJw6Xt", "Kt7GInJv"]}' \
    > test.out 2>&1
eval_tap $? 92 'BulkGetOrDefaultByUserId' test.out

#- 93 BulkResetUserStatItemValues
./ng net.accelbyte.sdk.cli.Main social bulkResetUserStatItemValues \
    --namespace "$AB_NAMESPACE" \
    --userId 'ffubbiOU' \
    --additionalKey 'BFsFjF0U' \
    --body '[{"additionalData": {"PDTnW6dn": {}, "67wasP5b": {}, "L1wdfojc": {}}, "statCode": "PLFF55C3"}, {"additionalData": {"U5PdUUAX": {}, "wgoFBqlA": {}, "Hy5gbLcn": {}}, "statCode": "8yfI1VoZ"}, {"additionalData": {"3ws9LuEf": {}, "ERnMjBmz": {}, "hy9rFylj": {}}, "statCode": "LuWGc6nF"}]' \
    > test.out 2>&1
eval_tap $? 93 'BulkResetUserStatItemValues' test.out

#- 94 DeleteUserStatItems2
./ng net.accelbyte.sdk.cli.Main social deleteUserStatItems2 \
    --namespace "$AB_NAMESPACE" \
    --statCode '8ko5d8zI' \
    --userId 'setmFtmy' \
    --additionalKey 'P6vvLobm' \
    > test.out 2>&1
eval_tap $? 94 'DeleteUserStatItems2' test.out

#- 95 UpdateUserStatItemValue
./ng net.accelbyte.sdk.cli.Main social updateUserStatItemValue \
    --namespace "$AB_NAMESPACE" \
    --statCode '2WQjTeIa' \
    --userId 'jQPmC64J' \
    --additionalKey 'juGYVm94' \
    --body '{"additionalData": {"m1YVYGMa": {}, "lSj8gHqa": {}, "5IwpRD4w": {}}, "updateStrategy": "INCREMENT", "value": 0.7055630713275011}' \
    > test.out 2>&1
eval_tap $? 95 'UpdateUserStatItemValue' test.out

#- 96 BulkUpdateUserStatItem1
./ng net.accelbyte.sdk.cli.Main social bulkUpdateUserStatItem1 \
    --namespace "$AB_NAMESPACE" \
    --body '[{"additionalData": {"7ojI791a": {}, "mw6QH9Ch": {}, "paUfPDSY": {}}, "additionalKey": "iOqJiHXv", "statCode": "LDCIMz9W", "updateStrategy": "MIN", "userId": "Hxax99M3", "value": 0.33837945833457417}, {"additionalData": {"R4hzNI0d": {}, "DyZWpsz4": {}, "MgsivoCX": {}}, "additionalKey": "Ib2NXqha", "statCode": "klUsJqix", "updateStrategy": "INCREMENT", "userId": "pIZsZJie", "value": 0.75580436041657}, {"additionalData": {"9rIWPaT7": {}, "F3RMISWp": {}, "Gm3PLKYe": {}}, "additionalKey": "ezFRYVWx", "statCode": "GldVtuL8", "updateStrategy": "INCREMENT", "userId": "GH1raHlX", "value": 0.3832793135641739}]' \
    > test.out 2>&1
eval_tap $? 96 'BulkUpdateUserStatItem1' test.out

#- 97 PublicQueryUserStatItems2
./ng net.accelbyte.sdk.cli.Main social publicQueryUserStatItems2 \
    --namespace "$AB_NAMESPACE" \
    --userId 'XWa3naa3' \
    --additionalKey 'pFa8tYzm' \
    --statCodes 'dJbf9Iz0,605GwlFE,FjVnehWa' \
    --tags '9Vu7lCbc,Rw0pm5mn,g1kFjmJf' \
    > test.out 2>&1
eval_tap $? 97 'PublicQueryUserStatItems2' test.out

#- 98 BulkUpdateUserStatItem2
./ng net.accelbyte.sdk.cli.Main social bulkUpdateUserStatItem2 \
    --namespace "$AB_NAMESPACE" \
    --userId 'l6jQ5hjL' \
    --additionalKey 'qczbVnWb' \
    --body '[{"additionalData": {"a60yPwQ5": {}, "4az7EYIO": {}, "Ida20mGy": {}}, "statCode": "yBsWxHJu", "updateStrategy": "MAX", "value": 0.03449765399113103}, {"additionalData": {"pcumcEim": {}, "ifoKkv0V": {}, "m33jVC9B": {}}, "statCode": "vzrc8S26", "updateStrategy": "MAX", "value": 0.43897902835024116}, {"additionalData": {"bb6S3dAN": {}, "8u78zhQI": {}, "fGegjOTI": {}}, "statCode": "NGqgmNLU", "updateStrategy": "INCREMENT", "value": 0.22417567915085146}]' \
    > test.out 2>&1
eval_tap $? 98 'BulkUpdateUserStatItem2' test.out

#- 99 UpdateUserStatItemValue1
./ng net.accelbyte.sdk.cli.Main social updateUserStatItemValue1 \
    --namespace "$AB_NAMESPACE" \
    --statCode 'FbuvmNts' \
    --userId 'h3taQJwR' \
    --additionalKey 'bjuqLibd' \
    --body '{"additionalData": {"jjer21Hb": {}, "nzWYGJY3": {}, "8aFKvGzl": {}}, "updateStrategy": "OVERRIDE", "value": 0.5494105043003719}' \
    > test.out 2>&1
eval_tap $? 99 'UpdateUserStatItemValue1' test.out


rm -f "tmp.dat"

exit $EXIT_CODE