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
    --limit '98' \
    --offset '43' \
    --statCodes 'vLHhUMlM' \
    > test.out 2>&1
eval_tap $? 26 'GetGlobalStatItems' test.out

#- 27 GetGlobalStatItemByStatCode
./ng net.accelbyte.sdk.cli.Main social getGlobalStatItemByStatCode \
    --namespace "$AB_NAMESPACE" \
    --statCode '1K40kzAP' \
    > test.out 2>&1
eval_tap $? 27 'GetGlobalStatItemByStatCode' test.out

#- 28 GetStatCycles
./ng net.accelbyte.sdk.cli.Main social getStatCycles \
    --namespace "$AB_NAMESPACE" \
    --cycleType 'MONTHLY' \
    --limit '24' \
    --name 'qJ7RIjqM' \
    --offset '39' \
    --sortBy 'gyw9oNAP' \
    --status 'INIT' \
    > test.out 2>&1
eval_tap $? 28 'GetStatCycles' test.out

#- 29 CreateStatCycle
./ng net.accelbyte.sdk.cli.Main social createStatCycle \
    --namespace "$AB_NAMESPACE" \
    --body '{"cycleType": "SEASONAL", "description": "QIsJusUo", "end": "1971-11-19T00:00:00Z", "id": "biY9umpf", "name": "cyYQidfu", "resetDate": 83, "resetDay": 70, "resetMonth": 19, "resetTime": "UHT5JHAC", "seasonPeriod": 72, "start": "1974-06-22T00:00:00Z"}' \
    > test.out 2>&1
eval_tap $? 29 'CreateStatCycle' test.out

#- 30 BulkGetStatCycle
./ng net.accelbyte.sdk.cli.Main social bulkGetStatCycle \
    --namespace "$AB_NAMESPACE" \
    --body '{"cycleIds": ["mUrTgshW", "JApY0jJz", "p2HzOUH3"]}' \
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
    --cycleId 'SJYuFvMq' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 33 'GetStatCycle' test.out

#- 34 UpdateStatCycle
./ng net.accelbyte.sdk.cli.Main social updateStatCycle \
    --cycleId '7lVfHJaf' \
    --namespace "$AB_NAMESPACE" \
    --body '{"cycleType": "WEEKLY", "description": "ALF7iXjd", "end": "1984-10-28T00:00:00Z", "name": "hqAvQyq4", "resetDate": 11, "resetDay": 68, "resetMonth": 13, "resetTime": "jsVY4Tju", "seasonPeriod": 71, "start": "1992-07-20T00:00:00Z"}' \
    > test.out 2>&1
eval_tap $? 34 'UpdateStatCycle' test.out

#- 35 DeleteStatCycle
./ng net.accelbyte.sdk.cli.Main social deleteStatCycle \
    --cycleId 'v44z6J7p' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 35 'DeleteStatCycle' test.out

#- 36 BulkAddStats
./ng net.accelbyte.sdk.cli.Main social bulkAddStats \
    --cycleId '9fXgkNl4' \
    --namespace "$AB_NAMESPACE" \
    --body '{"statCodes": ["RRZWuZIG", "ECVGPWF3", "M2wkDmo9"]}' \
    > test.out 2>&1
eval_tap $? 36 'BulkAddStats' test.out

#- 37 StopStatCycle
./ng net.accelbyte.sdk.cli.Main social stopStatCycle \
    --cycleId 'VJEPuVm7' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 37 'StopStatCycle' test.out

#- 38 BulkFetchStatItems
./ng net.accelbyte.sdk.cli.Main social bulkFetchStatItems \
    --namespace "$AB_NAMESPACE" \
    --statCode 's9omnNAg' \
    --userIds 'X3mxRTDb' \
    > test.out 2>&1
eval_tap $? 38 'BulkFetchStatItems' test.out

#- 39 BulkIncUserStatItem
./ng net.accelbyte.sdk.cli.Main social bulkIncUserStatItem \
    --namespace "$AB_NAMESPACE" \
    --body '[{"inc": 0.8652086000680729, "statCode": "zHwgv1oS", "userId": "kOEt9mB4"}, {"inc": 0.5895368702642239, "statCode": "WBhSNg5U", "userId": "D5pdpDhV"}, {"inc": 0.7222344280860907, "statCode": "eiy0YQ7T", "userId": "lSSob450"}]' \
    > test.out 2>&1
eval_tap $? 39 'BulkIncUserStatItem' test.out

#- 40 BulkIncUserStatItemValue
./ng net.accelbyte.sdk.cli.Main social bulkIncUserStatItemValue \
    --namespace "$AB_NAMESPACE" \
    --body '[{"inc": 0.8872132208593281, "statCode": "CKSZZTyE", "userId": "PBgMlWQk"}, {"inc": 0.13056804338874894, "statCode": "YtCiQ7RB", "userId": "D9H8vTHu"}, {"inc": 0.7404006584504838, "statCode": "KMmxchc4", "userId": "SkAay9dL"}]' \
    > test.out 2>&1
eval_tap $? 40 'BulkIncUserStatItemValue' test.out

#- 41 BulkFetchOrDefaultStatItems
./ng net.accelbyte.sdk.cli.Main social bulkFetchOrDefaultStatItems \
    --namespace "$AB_NAMESPACE" \
    --statCode 'oDYujreq' \
    --userIds 'enPWKiwK,zBhOYeDM,CMOrd9Sc' \
    > test.out 2>&1
eval_tap $? 41 'BulkFetchOrDefaultStatItems' test.out

#- 42 BulkResetUserStatItem
./ng net.accelbyte.sdk.cli.Main social bulkResetUserStatItem \
    --namespace "$AB_NAMESPACE" \
    --body '[{"statCode": "7ziRuyDa", "userId": "8s06Y1vm"}, {"statCode": "PIYpBp9G", "userId": "ryQJcMWo"}, {"statCode": "HaQFhLdU", "userId": "V3mHXf2a"}]' \
    > test.out 2>&1
eval_tap $? 42 'BulkResetUserStatItem' test.out

#- 43 GetStats
./ng net.accelbyte.sdk.cli.Main social getStats \
    --namespace "$AB_NAMESPACE" \
    --cycleIds 'axqPo4a3' \
    --isGlobal  \
    --isPublic  \
    --limit '64' \
    --offset '71' \
    > test.out 2>&1
eval_tap $? 43 'GetStats' test.out

#- 44 CreateStat
./ng net.accelbyte.sdk.cli.Main social createStat \
    --namespace "$AB_NAMESPACE" \
    --body '{"capCycleOverride": false, "cycleIds": ["CG5LicgQ", "CQhzHSUw", "hFXwL0UI"], "cycleOverrides": [{"cycleId": "500SCQ4D", "maximum": 0.9404381614461219, "minimum": 0.22950888948755}, {"cycleId": "DnDq4Bbw", "maximum": 0.9120411397712953, "minimum": 0.9037250056014843}, {"cycleId": "wOy6vtGW", "maximum": 0.7493942095452159, "minimum": 0.8111465522592494}], "defaultValue": 0.8043843809856561, "description": "eIxHbAAL", "globalAggregationMethod": "TOTAL", "ignoreAdditionalDataOnValueRejected": true, "incrementOnly": false, "isPublic": true, "maximum": 0.8167903979928429, "minimum": 0.7233377963702458, "name": "jh2taLvp", "setAsGlobal": true, "setBy": "CLIENT", "statCode": "O6anwtCM", "tags": ["NCvlS76H", "riMSbZ8k", "TLtZeRUB"], "visibility": "SHOWALL"}' \
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
    --limit '64' \
    --offset '67' \
    --keyword 'jNMOFf6z' \
    > test.out 2>&1
eval_tap $? 47 'QueryStats' test.out

#- 48 GetStat
./ng net.accelbyte.sdk.cli.Main social getStat \
    --namespace "$AB_NAMESPACE" \
    --statCode '0EHrA3FB' \
    > test.out 2>&1
eval_tap $? 48 'GetStat' test.out

#- 49 DeleteStat
./ng net.accelbyte.sdk.cli.Main social deleteStat \
    --namespace "$AB_NAMESPACE" \
    --statCode 'wKoeYSPG' \
    > test.out 2>&1
eval_tap $? 49 'DeleteStat' test.out

#- 50 UpdateStat
./ng net.accelbyte.sdk.cli.Main social updateStat \
    --namespace "$AB_NAMESPACE" \
    --statCode 'CdEru8et' \
    --body '{"capCycleOverride": true, "cycleIds": ["81YBm4T3", "9G5JngMb", "gmmRrK8d"], "cycleOverrides": [{"cycleId": "26UiATqR", "maximum": 0.047596937672814144, "minimum": 0.5598781233626076}, {"cycleId": "gM0Ovz7T", "maximum": 0.716121686833448, "minimum": 0.20386671770615572}, {"cycleId": "BAMtdgtT", "maximum": 0.21916365988575404, "minimum": 0.7820109963447134}], "defaultValue": 0.8220096390098718, "description": "iV0G4jmM", "globalAggregationMethod": "MIN", "ignoreAdditionalDataOnValueRejected": false, "isPublic": true, "name": "Ukh2ThiK", "tags": ["AMgeZ11Y", "waRd9Mqy", "3JyrX4Oh"], "visibility": "SERVERONLY"}' \
    > test.out 2>&1
eval_tap $? 50 'UpdateStat' test.out

#- 51 GetStatItems
./ng net.accelbyte.sdk.cli.Main social getStatItems \
    --namespace "$AB_NAMESPACE" \
    --statCode 'B2m44R1I' \
    --limit '16' \
    --offset '100' \
    --sortBy 'CUZXRkXB' \
    > test.out 2>&1
eval_tap $? 51 'GetStatItems' test.out

#- 52 DeleteTiedStat
./ng net.accelbyte.sdk.cli.Main social deleteTiedStat \
    --namespace "$AB_NAMESPACE" \
    --statCode 'ug1FwrU2' \
    > test.out 2>&1
eval_tap $? 52 'DeleteTiedStat' test.out

#- 53 GetUserStatCycleItems
./ng net.accelbyte.sdk.cli.Main social getUserStatCycleItems \
    --cycleId 'UwaHbebn' \
    --namespace "$AB_NAMESPACE" \
    --userId 'fk7urHfo' \
    --isPublic  \
    --limit '22' \
    --offset '42' \
    --sortBy 'RlGzvOkV' \
    --statCodes 'blXFYcKF' \
    > test.out 2>&1
eval_tap $? 53 'GetUserStatCycleItems' test.out

#- 54 GetUserStatItems
./ng net.accelbyte.sdk.cli.Main social getUserStatItems \
    --namespace "$AB_NAMESPACE" \
    --userId 'Pj3SGXpx' \
    --isPublic  \
    --limit '13' \
    --offset '27' \
    --sortBy 'UjJScskU' \
    --statCodes 'ivx7EL4E' \
    --tags 'Ktspgysj' \
    > test.out 2>&1
eval_tap $? 54 'GetUserStatItems' test.out

#- 55 BulkCreateUserStatItems
./ng net.accelbyte.sdk.cli.Main social bulkCreateUserStatItems \
    --namespace "$AB_NAMESPACE" \
    --userId 'vzK6iI2U' \
    --body '[{"statCode": "znFmFLnj"}, {"statCode": "yjGYgcHC"}, {"statCode": "wcHnyEL5"}]' \
    > test.out 2>&1
eval_tap $? 55 'BulkCreateUserStatItems' test.out

#- 56 BulkIncUserStatItem1
./ng net.accelbyte.sdk.cli.Main social bulkIncUserStatItem1 \
    --namespace "$AB_NAMESPACE" \
    --userId 'h1c5GPcM' \
    --body '[{"inc": 0.8015357582952486, "statCode": "akhhAYrz"}, {"inc": 0.6302451060881494, "statCode": "v72CUnBx"}, {"inc": 0.298724263176559, "statCode": "kCz296OL"}]' \
    > test.out 2>&1
eval_tap $? 56 'BulkIncUserStatItem1' test.out

#- 57 BulkIncUserStatItemValue1
./ng net.accelbyte.sdk.cli.Main social bulkIncUserStatItemValue1 \
    --namespace "$AB_NAMESPACE" \
    --userId 'r1BDxjkn' \
    --body '[{"inc": 0.043329991528935796, "statCode": "Vp3N3UcO"}, {"inc": 0.8140240155710601, "statCode": "y2gFnrqm"}, {"inc": 0.05355669013247755, "statCode": "fLI6849b"}]' \
    > test.out 2>&1
eval_tap $? 57 'BulkIncUserStatItemValue1' test.out

#- 58 BulkResetUserStatItem1
./ng net.accelbyte.sdk.cli.Main social bulkResetUserStatItem1 \
    --namespace "$AB_NAMESPACE" \
    --userId 'D7LIQvxT' \
    --body '[{"statCode": "8M5Hf1yF"}, {"statCode": "VTXNbl6K"}, {"statCode": "0CXpjfTo"}]' \
    > test.out 2>&1
eval_tap $? 58 'BulkResetUserStatItem1' test.out

#- 59 CreateUserStatItem
./ng net.accelbyte.sdk.cli.Main social createUserStatItem \
    --namespace "$AB_NAMESPACE" \
    --statCode 'XIdzTe4q' \
    --userId 'gr2sXdpO' \
    > test.out 2>&1
eval_tap $? 59 'CreateUserStatItem' test.out

#- 60 DeleteUserStatItems
./ng net.accelbyte.sdk.cli.Main social deleteUserStatItems \
    --namespace "$AB_NAMESPACE" \
    --statCode 'XPD6Qzgp' \
    --userId '75p06Nwx' \
    > test.out 2>&1
eval_tap $? 60 'DeleteUserStatItems' test.out

#- 61 IncUserStatItemValue
./ng net.accelbyte.sdk.cli.Main social incUserStatItemValue \
    --namespace "$AB_NAMESPACE" \
    --statCode 'joTzuulj' \
    --userId 's5mxcAOh' \
    --body '{"inc": 0.43433730790152536}' \
    > test.out 2>&1
eval_tap $? 61 'IncUserStatItemValue' test.out

#- 62 ResetUserStatItemValue
./ng net.accelbyte.sdk.cli.Main social resetUserStatItemValue \
    --namespace "$AB_NAMESPACE" \
    --statCode 'w04UhMls' \
    --userId 'Ke2UjLw5' \
    --additionalKey 'eNfxGPQS' \
    --body '{"additionalData": {"fP9pZ4jE": {}, "35uvfZsp": {}, "xElSwZnT": {}}}' \
    > test.out 2>&1
eval_tap $? 62 'ResetUserStatItemValue' test.out

#- 63 GetGlobalStatItems1
./ng net.accelbyte.sdk.cli.Main social getGlobalStatItems1 \
    --namespace "$AB_NAMESPACE" \
    --limit '76' \
    --offset '41' \
    --statCodes 'dUevXXhC' \
    > test.out 2>&1
eval_tap $? 63 'GetGlobalStatItems1' test.out

#- 64 GetGlobalStatItemByStatCode1
./ng net.accelbyte.sdk.cli.Main social getGlobalStatItemByStatCode1 \
    --namespace "$AB_NAMESPACE" \
    --statCode 'i1eRJK79' \
    > test.out 2>&1
eval_tap $? 64 'GetGlobalStatItemByStatCode1' test.out

#- 65 GetStatCycles1
./ng net.accelbyte.sdk.cli.Main social getStatCycles1 \
    --namespace "$AB_NAMESPACE" \
    --cycleType 'DAILY' \
    --limit '96' \
    --name 'dNEjefOl' \
    --offset '80' \
    --sortBy 'qMYpBcyw' \
    --status 'STOPPED' \
    > test.out 2>&1
eval_tap $? 65 'GetStatCycles1' test.out

#- 66 BulkGetStatCycle1
./ng net.accelbyte.sdk.cli.Main social bulkGetStatCycle1 \
    --namespace "$AB_NAMESPACE" \
    --body '{"cycleIds": ["w8DU0M7k", "pEQpld0J", "6Gnm6UIT"]}' \
    > test.out 2>&1
eval_tap $? 66 'BulkGetStatCycle1' test.out

#- 67 GetStatCycle1
./ng net.accelbyte.sdk.cli.Main social getStatCycle1 \
    --cycleId 'bWAnpZAl' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 67 'GetStatCycle1' test.out

#- 68 BulkFetchStatItems1
./ng net.accelbyte.sdk.cli.Main social bulkFetchStatItems1 \
    --namespace "$AB_NAMESPACE" \
    --statCode 'eFQGg6Ma' \
    --userIds 'sffK84aw' \
    > test.out 2>&1
eval_tap $? 68 'BulkFetchStatItems1' test.out

#- 69 PublicBulkIncUserStatItem
./ng net.accelbyte.sdk.cli.Main social publicBulkIncUserStatItem \
    --namespace "$AB_NAMESPACE" \
    --body '[{"inc": 0.6868364945931397, "statCode": "5nCdd8XC", "userId": "U10l1gO4"}, {"inc": 0.3950491881950986, "statCode": "vPbmvJG1", "userId": "LZpUIFma"}, {"inc": 0.3924768412799894, "statCode": "0DVSxy1u", "userId": "4XcQghrg"}]' \
    > test.out 2>&1
eval_tap $? 69 'PublicBulkIncUserStatItem' test.out

#- 70 PublicBulkIncUserStatItemValue
./ng net.accelbyte.sdk.cli.Main social publicBulkIncUserStatItemValue \
    --namespace "$AB_NAMESPACE" \
    --body '[{"inc": 0.9971104369478075, "statCode": "3yQHeXqk", "userId": "lWdSPRX6"}, {"inc": 0.4436729328234459, "statCode": "zyJGln3g", "userId": "yzLCDEkH"}, {"inc": 0.9609433614233888, "statCode": "XpShXw96", "userId": "uNP6ahsf"}]' \
    > test.out 2>&1
eval_tap $? 70 'PublicBulkIncUserStatItemValue' test.out

#- 71 BulkResetUserStatItem2
./ng net.accelbyte.sdk.cli.Main social bulkResetUserStatItem2 \
    --namespace "$AB_NAMESPACE" \
    --body '[{"statCode": "I0OctFQ9", "userId": "mh1fhbmx"}, {"statCode": "p5FVNyIQ", "userId": "F3JpHkVW"}, {"statCode": "2al5NXSj", "userId": "XPOh9GP3"}]' \
    > test.out 2>&1
eval_tap $? 71 'BulkResetUserStatItem2' test.out

#- 72 CreateStat1
./ng net.accelbyte.sdk.cli.Main social createStat1 \
    --namespace "$AB_NAMESPACE" \
    --body '{"capCycleOverride": false, "cycleIds": ["ItVwedkK", "m1GlX4JM", "y5OkLpZ1"], "cycleOverrides": [{"cycleId": "Q0Vl10Y1", "maximum": 0.08615471000078612, "minimum": 0.4952074363903046}, {"cycleId": "R6ctejCH", "maximum": 0.696845072184376, "minimum": 0.8237758670823587}, {"cycleId": "CUmVrzqe", "maximum": 0.7783018385757124, "minimum": 0.8900883633920248}], "defaultValue": 0.5719241868192786, "description": "pi3O3m7K", "globalAggregationMethod": "MAX", "ignoreAdditionalDataOnValueRejected": true, "incrementOnly": true, "isPublic": false, "maximum": 0.3443420536451256, "minimum": 0.9501097033181521, "name": "Jm0T125Y", "setAsGlobal": true, "setBy": "CLIENT", "statCode": "orhQzoOo", "tags": ["1RuNJFwK", "xPWT2DID", "d5jV07Mv"], "visibility": "SERVERONLY"}' \
    > test.out 2>&1
eval_tap $? 72 'CreateStat1' test.out

#- 73 PublicListMyStatCycleItems
./ng net.accelbyte.sdk.cli.Main social publicListMyStatCycleItems \
    --cycleId 'W8orFs6R' \
    --namespace "$AB_NAMESPACE" \
    --limit '32' \
    --offset '48' \
    --sortBy 'bt91Olhd' \
    --statCodes 'IQlEw4EN,6K80bmna,NSOaNG1M' \
    > test.out 2>&1
eval_tap $? 73 'PublicListMyStatCycleItems' test.out

#- 74 PublicListMyStatItems
./ng net.accelbyte.sdk.cli.Main social publicListMyStatItems \
    --namespace "$AB_NAMESPACE" \
    --limit '28' \
    --offset '85' \
    --sortBy 'jO1ZCbUD' \
    --statCodes '6X9GuQDG,ORVZtOQ7,vFaR9Sur' \
    --tags 'LrpRu10P,varzK5Fk,DefyjEzE' \
    > test.out 2>&1
eval_tap $? 74 'PublicListMyStatItems' test.out

#- 75 PublicListAllMyStatItems
./ng net.accelbyte.sdk.cli.Main social publicListAllMyStatItems \
    --namespace "$AB_NAMESPACE" \
    --additionalKey 'vZcoPCQf' \
    --statCodes 'YIXQP6Ng,dklJtnd2,oKlPjxtm' \
    --tags 'LUNwi6Af,oPnXDKHB,TMhodYWw' \
    > test.out 2>&1
eval_tap $? 75 'PublicListAllMyStatItems' test.out

#- 76 GetUserStatCycleItems1
./ng net.accelbyte.sdk.cli.Main social getUserStatCycleItems1 \
    --cycleId '7mDBDDNP' \
    --namespace "$AB_NAMESPACE" \
    --userId 'QTp8EFoL' \
    --limit '79' \
    --offset '52' \
    --sortBy 'gwWWRJ0B' \
    --statCodes 'rjGDwUry' \
    > test.out 2>&1
eval_tap $? 76 'GetUserStatCycleItems1' test.out

#- 77 PublicQueryUserStatItems1
./ng net.accelbyte.sdk.cli.Main social publicQueryUserStatItems1 \
    --namespace "$AB_NAMESPACE" \
    --userId 'XUaTOSca' \
    --limit '11' \
    --offset '22' \
    --sortBy '8Olm8jeP' \
    --statCodes 'QFqF7FI8' \
    --tags 'Kek466jV' \
    > test.out 2>&1
eval_tap $? 77 'PublicQueryUserStatItems1' test.out

#- 78 PublicBulkCreateUserStatItems
./ng net.accelbyte.sdk.cli.Main social publicBulkCreateUserStatItems \
    --namespace "$AB_NAMESPACE" \
    --userId 'AS9TtGyd' \
    --body '[{"statCode": "ZkUUSGkN"}, {"statCode": "ezhWdoju"}, {"statCode": "8pyH0sS2"}]' \
    > test.out 2>&1
eval_tap $? 78 'PublicBulkCreateUserStatItems' test.out

#- 79 PublicQueryUserStatItems
./ng net.accelbyte.sdk.cli.Main social publicQueryUserStatItems \
    --namespace "$AB_NAMESPACE" \
    --userId '9inwZttE' \
    --additionalKey 'zpLK5iDp' \
    --statCodes '3gmXIE9g,LJsj47h0,DVmYK0B9' \
    --tags '5lnNa49L,BvuSTpA4,ng7QNBTI' \
    > test.out 2>&1
eval_tap $? 79 'PublicQueryUserStatItems' test.out

#- 80 PublicBulkIncUserStatItem1
./ng net.accelbyte.sdk.cli.Main social publicBulkIncUserStatItem1 \
    --namespace "$AB_NAMESPACE" \
    --userId 'IaBMZuzR' \
    --body '[{"inc": 0.17704224283168846, "statCode": "LsPA3RIV"}, {"inc": 0.31618738877696906, "statCode": "vGlASpDk"}, {"inc": 0.5843035257905237, "statCode": "DGH1vlfI"}]' \
    > test.out 2>&1
eval_tap $? 80 'PublicBulkIncUserStatItem1' test.out

#- 81 BulkIncUserStatItemValue2
./ng net.accelbyte.sdk.cli.Main social bulkIncUserStatItemValue2 \
    --namespace "$AB_NAMESPACE" \
    --userId 'ynXo5fJ5' \
    --body '[{"inc": 0.7669303727795521, "statCode": "RLovLGm2"}, {"inc": 0.6957563079437625, "statCode": "k9SOglea"}, {"inc": 0.7729301733257292, "statCode": "ASXiCqVm"}]' \
    > test.out 2>&1
eval_tap $? 81 'BulkIncUserStatItemValue2' test.out

#- 82 BulkResetUserStatItem3
./ng net.accelbyte.sdk.cli.Main social bulkResetUserStatItem3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'NMOmXECA' \
    --body '[{"statCode": "0CJNsmX2"}, {"statCode": "W4NENHyV"}, {"statCode": "BjogL0Vk"}]' \
    > test.out 2>&1
eval_tap $? 82 'BulkResetUserStatItem3' test.out

#- 83 PublicCreateUserStatItem
./ng net.accelbyte.sdk.cli.Main social publicCreateUserStatItem \
    --namespace "$AB_NAMESPACE" \
    --statCode '0zOIwI69' \
    --userId 'r5hliFL6' \
    > test.out 2>&1
eval_tap $? 83 'PublicCreateUserStatItem' test.out

#- 84 DeleteUserStatItems1
./ng net.accelbyte.sdk.cli.Main social deleteUserStatItems1 \
    --namespace "$AB_NAMESPACE" \
    --statCode 'mecKuTNb' \
    --userId '4TR670Le' \
    > test.out 2>&1
eval_tap $? 84 'DeleteUserStatItems1' test.out

#- 85 PublicIncUserStatItem
./ng net.accelbyte.sdk.cli.Main social publicIncUserStatItem \
    --namespace "$AB_NAMESPACE" \
    --statCode 'tCfqMClv' \
    --userId 'pkJszdW2' \
    --body '{"inc": 0.11742309208369861}' \
    > test.out 2>&1
eval_tap $? 85 'PublicIncUserStatItem' test.out

#- 86 PublicIncUserStatItemValue
./ng net.accelbyte.sdk.cli.Main social publicIncUserStatItemValue \
    --namespace "$AB_NAMESPACE" \
    --statCode 'g3VkkcNQ' \
    --userId 'FBcZ5Cwj' \
    --body '{"inc": 0.4337444617144621}' \
    > test.out 2>&1
eval_tap $? 86 'PublicIncUserStatItemValue' test.out

#- 87 ResetUserStatItemValue1
./ng net.accelbyte.sdk.cli.Main social resetUserStatItemValue1 \
    --namespace "$AB_NAMESPACE" \
    --statCode 'bfg99vU5' \
    --userId 'GRUoz189' \
    > test.out 2>&1
eval_tap $? 87 'ResetUserStatItemValue1' test.out

#- 88 BulkUpdateUserStatItemV2
./ng net.accelbyte.sdk.cli.Main social bulkUpdateUserStatItemV2 \
    --namespace "$AB_NAMESPACE" \
    --body '[{"additionalData": {"n1lkmoZF": {}, "bVHtWXnX": {}, "RjoKtAPQ": {}}, "additionalKey": "4mdLDxjl", "requestId": "fqlhYGVz", "statCode": "HPpJMKlb", "updateStrategy": "OVERRIDE", "userId": "N2AEdDbB", "value": 0.15598396951284488}, {"additionalData": {"f9WqUlfI": {}, "5l9j6tW6": {}, "Ph2g8Agh": {}}, "additionalKey": "NxgvTblU", "requestId": "oEIvgfzl", "statCode": "C9W4VbJe", "updateStrategy": "OVERRIDE", "userId": "K9cFcmmW", "value": 0.2100839607411603}, {"additionalData": {"rmZQlsjV": {}, "R09QXyfW": {}, "3i3IwvRI": {}}, "additionalKey": "GnklFadQ", "requestId": "UH1qOr17", "statCode": "tGeE1Wb9", "updateStrategy": "MAX", "userId": "SJqkfTXt", "value": 0.40473199338832466}]' \
    > test.out 2>&1
eval_tap $? 88 'BulkUpdateUserStatItemV2' test.out

#- 89 BulkFetchOrDefaultStatItems1
./ng net.accelbyte.sdk.cli.Main social bulkFetchOrDefaultStatItems1 \
    --namespace "$AB_NAMESPACE" \
    --additionalKey 'pgInt1I1' \
    --statCode 'uxPJNo80' \
    --userIds 'zZnKzrSK,sutvJi8i,xQobkq2E' \
    > test.out 2>&1
eval_tap $? 89 'BulkFetchOrDefaultStatItems1' test.out

#- 90 AdminListUsersStatItems
./ng net.accelbyte.sdk.cli.Main social adminListUsersStatItems \
    --namespace "$AB_NAMESPACE" \
    --userId 'sXK0EnAl' \
    --additionalKey 'SihrpVIH' \
    --statCodes '1GUSkGGo,HBTUftgX,9WUhGDgl' \
    --tags 'tQ4zhJvq,H719SNRz,Yef8XsxX' \
    > test.out 2>&1
eval_tap $? 90 'AdminListUsersStatItems' test.out

#- 91 BulkUpdateUserStatItem
./ng net.accelbyte.sdk.cli.Main social bulkUpdateUserStatItem \
    --namespace "$AB_NAMESPACE" \
    --userId '95KndlWK' \
    --additionalKey 'Qa756UyW' \
    --body '[{"additionalData": {"9tzLwNov": {}, "A0wNGV7v": {}, "Q4qac4eV": {}}, "requestId": "GqW52G7A", "statCode": "Q4UJIAi3", "updateStrategy": "MAX", "value": 0.5911079872177069}, {"additionalData": {"RGge9TNO": {}, "fTgkJ9Mt": {}, "tyn1LvuX": {}}, "requestId": "998xFT8S", "statCode": "qpzjTO1f", "updateStrategy": "MAX", "value": 0.3910170852534094}, {"additionalData": {"yvlUCNiW": {}, "8lApgkXF": {}, "HQZDCYTs": {}}, "requestId": "F8BrNDlG", "statCode": "o4to7Ypz", "updateStrategy": "OVERRIDE", "value": 0.40190691644622767}]' \
    > test.out 2>&1
eval_tap $? 91 'BulkUpdateUserStatItem' test.out

#- 92 BulkGetOrDefaultByUserId
./ng net.accelbyte.sdk.cli.Main social bulkGetOrDefaultByUserId \
    --namespace "$AB_NAMESPACE" \
    --userId 'e87Vx9fV' \
    --additionalKey 'K6zpV3sf' \
    --body '{"statCodes": ["pacG5TcZ", "pQZfCckJ", "pt5gpm9w"]}' \
    > test.out 2>&1
eval_tap $? 92 'BulkGetOrDefaultByUserId' test.out

#- 93 BulkResetUserStatItemValues
./ng net.accelbyte.sdk.cli.Main social bulkResetUserStatItemValues \
    --namespace "$AB_NAMESPACE" \
    --userId 'qguxoCPp' \
    --additionalKey 'isIHlAEd' \
    --body '[{"additionalData": {"n9tCCnfb": {}, "fxXDWAvD": {}, "exHMgbav": {}}, "statCode": "deEtP52G"}, {"additionalData": {"LVkfClqk": {}, "Z6U0Yw8d": {}, "vPOiiooO": {}}, "statCode": "taMLTyz6"}, {"additionalData": {"Jwjl5Jml": {}, "RJ5HQwMS": {}, "ZmOKnkGq": {}}, "statCode": "twyppyFx"}]' \
    > test.out 2>&1
eval_tap $? 93 'BulkResetUserStatItemValues' test.out

#- 94 DeleteUserStatItems2
./ng net.accelbyte.sdk.cli.Main social deleteUserStatItems2 \
    --namespace "$AB_NAMESPACE" \
    --statCode 'zUgAmEsd' \
    --userId 'XTc9HnSh' \
    --additionalKey 'TkNLJuae' \
    > test.out 2>&1
eval_tap $? 94 'DeleteUserStatItems2' test.out

#- 95 UpdateUserStatItemValue
./ng net.accelbyte.sdk.cli.Main social updateUserStatItemValue \
    --namespace "$AB_NAMESPACE" \
    --statCode 'LGIAxKAB' \
    --userId 'FeFELR6m' \
    --additionalKey 'IRN5Tbxw' \
    --body '{"additionalData": {"tpu4zaAB": {}, "qoYY8yXS": {}, "HQAOunr1": {}}, "updateStrategy": "OVERRIDE", "value": 0.12749791829488666}' \
    > test.out 2>&1
eval_tap $? 95 'UpdateUserStatItemValue' test.out

#- 96 BulkUpdateUserStatItem1
./ng net.accelbyte.sdk.cli.Main social bulkUpdateUserStatItem1 \
    --namespace "$AB_NAMESPACE" \
    --body '[{"additionalData": {"fR5SCcli": {}, "fH2ab80x": {}, "RL3ZKnX5": {}}, "additionalKey": "rwSH90Rb", "requestId": "vz7fMMoM", "statCode": "AHnwcToj", "updateStrategy": "OVERRIDE", "userId": "9OPg1P8W", "value": 0.0925827361114342}, {"additionalData": {"jRktEDWh": {}, "rdunc1nC": {}, "1SMCWr4r": {}}, "additionalKey": "yKkWsn5L", "requestId": "EeCv6B5f", "statCode": "ZkJwmgXt", "updateStrategy": "INCREMENT", "userId": "tdanrKVw", "value": 0.46099263926979883}, {"additionalData": {"keqsXd7w": {}, "XZM8DM8G": {}, "ARZQgDqp": {}}, "additionalKey": "6d7AhSo4", "requestId": "9p61Sb6a", "statCode": "gm6eZpmH", "updateStrategy": "MAX", "userId": "9v1DTOdC", "value": 0.9618476588353511}]' \
    > test.out 2>&1
eval_tap $? 96 'BulkUpdateUserStatItem1' test.out

#- 97 PublicQueryUserStatItems2
./ng net.accelbyte.sdk.cli.Main social publicQueryUserStatItems2 \
    --namespace "$AB_NAMESPACE" \
    --userId '2pbrQ82F' \
    --additionalKey 'GDXBd5Ze' \
    --statCodes 'ttOEEhTu,CldoyQDx,PnolEnn2' \
    --tags 'pk64FpeF,IC6XQwQ4,IZXUT7OF' \
    > test.out 2>&1
eval_tap $? 97 'PublicQueryUserStatItems2' test.out

#- 98 BulkUpdateUserStatItem2
./ng net.accelbyte.sdk.cli.Main social bulkUpdateUserStatItem2 \
    --namespace "$AB_NAMESPACE" \
    --userId 'qCO2zUyW' \
    --additionalKey 'lQzA8OON' \
    --body '[{"additionalData": {"kEh0lsiS": {}, "kFMFHf3l": {}, "vBUR15Kh": {}}, "requestId": "MjwVuSki", "statCode": "KMMf2Iwl", "updateStrategy": "OVERRIDE", "value": 0.8836371775808048}, {"additionalData": {"5GR05ho7": {}, "cTSY3JEO": {}, "uprkbTir": {}}, "requestId": "DNjtf9vs", "statCode": "vJZ2Zs9f", "updateStrategy": "MAX", "value": 0.41633156263301596}, {"additionalData": {"NaA2v5Io": {}, "bKKozGWN": {}, "v0cPp3f2": {}}, "requestId": "os5Pt25o", "statCode": "zOXBX8i3", "updateStrategy": "MIN", "value": 0.27642782929844456}]' \
    > test.out 2>&1
eval_tap $? 98 'BulkUpdateUserStatItem2' test.out

#- 99 UpdateUserStatItemValue1
./ng net.accelbyte.sdk.cli.Main social updateUserStatItemValue1 \
    --namespace "$AB_NAMESPACE" \
    --statCode 'vL8cOfu0' \
    --userId 'SGmFAHqV' \
    --additionalKey '6aKDmHqV' \
    --body '{"additionalData": {"dNlUcvR3": {}, "cYFJdNgh": {}, "KBwLvGwb": {}}, "updateStrategy": "MAX", "value": 0.8641882612034257}' \
    > test.out 2>&1
eval_tap $? 99 'UpdateUserStatItemValue1' test.out


rm -f "tmp.dat"

exit $EXIT_CODE