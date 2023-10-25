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
echo "1..95"

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
    --userId 'YQAO6clK' \
    > test.out 2>&1
eval_tap $? 8 'GetUserProfiles' test.out

#- 9 GetProfile
./ng net.accelbyte.sdk.cli.Main social getProfile \
    --namespace "$AB_NAMESPACE" \
    --profileId 'BLwOjuIs' \
    --userId 'ksvc1iBW' \
    > test.out 2>&1
eval_tap $? 9 'GetProfile' test.out

#- 10 GetUserNamespaceSlots
eval_tap 0 10 'GetUserNamespaceSlots # SKIP deprecated' test.out

#- 11 GetSlotData
eval_tap 0 11 'GetSlotData # SKIP deprecated' test.out

#- 12 PublicGetUserGameProfiles
./ng net.accelbyte.sdk.cli.Main social publicGetUserGameProfiles \
    --namespace "$AB_NAMESPACE" \
    --userIds 'RPE42YGH,7ljlPBx1,iRdq9ceL' \
    > test.out 2>&1
eval_tap $? 12 'PublicGetUserGameProfiles' test.out

#- 13 PublicGetUserProfiles
./ng net.accelbyte.sdk.cli.Main social publicGetUserProfiles \
    --namespace "$AB_NAMESPACE" \
    --userId 'B4w28DLn' \
    > test.out 2>&1
eval_tap $? 13 'PublicGetUserProfiles' test.out

#- 14 PublicCreateProfile
./ng net.accelbyte.sdk.cli.Main social publicCreateProfile \
    --namespace "$AB_NAMESPACE" \
    --userId 'BB7kzdgb' \
    --body '{"achievements": ["GwZvtxYY", "QDAIajxt", "64qAAOGI"], "attributes": {"h7xGsPX7": "Y2Krk7Dr", "uC0QDZwn": "H81iqMtQ", "OwhZVUmM": "pTr6JPvL"}, "avatarUrl": "uersADrb", "inventories": ["zQTjifUP", "IQ0LNp9F", "SoOuL1ue"], "label": "ZdJW6bUM", "profileName": "PYICBIHK", "statistics": ["yir0Dp47", "XbQrl1pT", "nu7xBhVm"], "tags": ["BodS4kXv", "wTmLjDU9", "sFCpq6bX"]}' \
    > test.out 2>&1
eval_tap $? 14 'PublicCreateProfile' test.out

#- 15 PublicGetProfile
./ng net.accelbyte.sdk.cli.Main social publicGetProfile \
    --namespace "$AB_NAMESPACE" \
    --profileId 'J4Mit1ZZ' \
    --userId 'DZqvoR3M' \
    > test.out 2>&1
eval_tap $? 15 'PublicGetProfile' test.out

#- 16 PublicUpdateProfile
./ng net.accelbyte.sdk.cli.Main social publicUpdateProfile \
    --namespace "$AB_NAMESPACE" \
    --profileId 'lEVckSKF' \
    --userId 'p9JVfVpF' \
    --body '{"achievements": ["CyU0GzA6", "AbXqZvFW", "D3Tsmj1i"], "attributes": {"nJpDP8Gt": "u38yL5qY", "K1HJA94V": "3TS9lRzS", "8RzaBcHi": "Ac07ByZ0"}, "avatarUrl": "mt66wXNq", "inventories": ["3J04wsI4", "33rIOEif", "xhJFVuhK"], "label": "S9I15by4", "profileName": "ptyhWijq", "statistics": ["c8adUzaI", "SxmegGRr", "Qw8cp7FN"], "tags": ["puVDm2eI", "PydkgSYj", "8cw8Cq2q"]}' \
    > test.out 2>&1
eval_tap $? 16 'PublicUpdateProfile' test.out

#- 17 PublicDeleteProfile
./ng net.accelbyte.sdk.cli.Main social publicDeleteProfile \
    --namespace "$AB_NAMESPACE" \
    --profileId 'WXdFTjD7' \
    --userId 'Ma7iBDJE' \
    > test.out 2>&1
eval_tap $? 17 'PublicDeleteProfile' test.out

#- 18 PublicGetProfileAttribute
./ng net.accelbyte.sdk.cli.Main social publicGetProfileAttribute \
    --attributeName 'T4ZUrGVT' \
    --namespace "$AB_NAMESPACE" \
    --profileId 'OL2zrvOc' \
    --userId 'LNpKVW6G' \
    > test.out 2>&1
eval_tap $? 18 'PublicGetProfileAttribute' test.out

#- 19 PublicUpdateAttribute
./ng net.accelbyte.sdk.cli.Main social publicUpdateAttribute \
    --attributeName 'H9v4kmTg' \
    --namespace "$AB_NAMESPACE" \
    --profileId 'DlUABQNn' \
    --userId 'yTyhEvU3' \
    --body '{"name": "qG2IgD62", "value": "X0bNzPo1"}' \
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
    --limit '36' \
    --offset '4' \
    --statCodes 'Vx841UFq' \
    > test.out 2>&1
eval_tap $? 26 'GetGlobalStatItems' test.out

#- 27 GetGlobalStatItemByStatCode
./ng net.accelbyte.sdk.cli.Main social getGlobalStatItemByStatCode \
    --namespace "$AB_NAMESPACE" \
    --statCode 'Mj3PK7Rb' \
    > test.out 2>&1
eval_tap $? 27 'GetGlobalStatItemByStatCode' test.out

#- 28 GetStatCycles
./ng net.accelbyte.sdk.cli.Main social getStatCycles \
    --namespace "$AB_NAMESPACE" \
    --cycleType 'MONTHLY' \
    --limit '85' \
    --name 'O53Ny5rY' \
    --offset '81' \
    --sortBy 'FRbV3dGa' \
    --status 'STOPPED' \
    > test.out 2>&1
eval_tap $? 28 'GetStatCycles' test.out

#- 29 CreateStatCycle
./ng net.accelbyte.sdk.cli.Main social createStatCycle \
    --namespace "$AB_NAMESPACE" \
    --body '{"cycleType": "SEASONAL", "description": "yKmDskbW", "end": "1976-04-17T00:00:00Z", "name": "E1U6x2V4", "resetDate": 10, "resetDay": 21, "resetMonth": 55, "resetTime": "ygfT6Qlm", "seasonPeriod": 48, "start": "1974-07-02T00:00:00Z"}' \
    > test.out 2>&1
eval_tap $? 29 'CreateStatCycle' test.out

#- 30 BulkGetStatCycle
./ng net.accelbyte.sdk.cli.Main social bulkGetStatCycle \
    --namespace "$AB_NAMESPACE" \
    --body '{"cycleIds": ["UnLbURL8", "dOWAhCz1", "kPNWme6W"]}' \
    > test.out 2>&1
eval_tap $? 30 'BulkGetStatCycle' test.out

#- 31 GetStatCycle
./ng net.accelbyte.sdk.cli.Main social getStatCycle \
    --cycleId '46qU5OSZ' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 31 'GetStatCycle' test.out

#- 32 UpdateStatCycle
./ng net.accelbyte.sdk.cli.Main social updateStatCycle \
    --cycleId '0FRQeDWB' \
    --namespace "$AB_NAMESPACE" \
    --body '{"cycleType": "MONTHLY", "description": "rxozmdDW", "end": "1981-05-23T00:00:00Z", "name": "ADMg0HKI", "resetDate": 6, "resetDay": 96, "resetMonth": 60, "resetTime": "HiCc0nsI", "seasonPeriod": 10, "start": "1981-09-11T00:00:00Z"}' \
    > test.out 2>&1
eval_tap $? 32 'UpdateStatCycle' test.out

#- 33 DeleteStatCycle
./ng net.accelbyte.sdk.cli.Main social deleteStatCycle \
    --cycleId '90cgw5e5' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 33 'DeleteStatCycle' test.out

#- 34 BulkAddStats
./ng net.accelbyte.sdk.cli.Main social bulkAddStats \
    --cycleId 'h8L2iIZk' \
    --namespace "$AB_NAMESPACE" \
    --body '{"statCodes": ["ILZiSD5G", "uuq8kOK6", "lk8TNQaY"]}' \
    > test.out 2>&1
eval_tap $? 34 'BulkAddStats' test.out

#- 35 StopStatCycle
./ng net.accelbyte.sdk.cli.Main social stopStatCycle \
    --cycleId '3VUSLp49' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 35 'StopStatCycle' test.out

#- 36 BulkFetchStatItems
./ng net.accelbyte.sdk.cli.Main social bulkFetchStatItems \
    --namespace "$AB_NAMESPACE" \
    --statCode 'nJ9MOmgT' \
    --userIds 'm9csbubk' \
    > test.out 2>&1
eval_tap $? 36 'BulkFetchStatItems' test.out

#- 37 BulkIncUserStatItem
./ng net.accelbyte.sdk.cli.Main social bulkIncUserStatItem \
    --namespace "$AB_NAMESPACE" \
    --body '[{"inc": 0.8339722965025415, "statCode": "aBXFTa0l", "userId": "MXqyUQI6"}, {"inc": 0.5925729094438614, "statCode": "5c2HrQet", "userId": "OSVkebmy"}, {"inc": 0.9830266869420069, "statCode": "MnpGgQFH", "userId": "PdL5viX6"}]' \
    > test.out 2>&1
eval_tap $? 37 'BulkIncUserStatItem' test.out

#- 38 BulkIncUserStatItemValue
./ng net.accelbyte.sdk.cli.Main social bulkIncUserStatItemValue \
    --namespace "$AB_NAMESPACE" \
    --body '[{"inc": 0.03770087103138531, "statCode": "Ihhz8F6J", "userId": "8b7IWhBV"}, {"inc": 0.5320743153279209, "statCode": "BkNKSZZP", "userId": "Vw4fx9W0"}, {"inc": 0.7473256031756098, "statCode": "USbn6NMS", "userId": "o89PAA9B"}]' \
    > test.out 2>&1
eval_tap $? 38 'BulkIncUserStatItemValue' test.out

#- 39 BulkFetchOrDefaultStatItems
./ng net.accelbyte.sdk.cli.Main social bulkFetchOrDefaultStatItems \
    --namespace "$AB_NAMESPACE" \
    --statCode 'RtiYEIps' \
    --userIds 'vzFJjkNL,FqwDCJcj,Fa0tTTIg' \
    > test.out 2>&1
eval_tap $? 39 'BulkFetchOrDefaultStatItems' test.out

#- 40 BulkResetUserStatItem
./ng net.accelbyte.sdk.cli.Main social bulkResetUserStatItem \
    --namespace "$AB_NAMESPACE" \
    --body '[{"statCode": "ikDy5tgK", "userId": "QkwprZ5A"}, {"statCode": "NLoiaalf", "userId": "MzCvdgDO"}, {"statCode": "SYZ67ClG", "userId": "IKTFddNV"}]' \
    > test.out 2>&1
eval_tap $? 40 'BulkResetUserStatItem' test.out

#- 41 GetStats
./ng net.accelbyte.sdk.cli.Main social getStats \
    --namespace "$AB_NAMESPACE" \
    --cycleIds 'DOXp95O3' \
    --isGlobal  \
    --isPublic  \
    --limit '9' \
    --offset '48' \
    > test.out 2>&1
eval_tap $? 41 'GetStats' test.out

#- 42 CreateStat
./ng net.accelbyte.sdk.cli.Main social createStat \
    --namespace "$AB_NAMESPACE" \
    --body '{"cycleIds": ["Sy8vvSA5", "ZXX5xBrs", "6R03CKRn"], "defaultValue": 0.6645739510872256, "description": "i7qqDrtp", "ignoreAdditionalDataOnValueRejected": false, "incrementOnly": true, "isPublic": false, "maximum": 0.6922963822304907, "minimum": 0.5813881788765817, "name": "5BQnXbHY", "setAsGlobal": false, "setBy": "SERVER", "statCode": "1fmzwvqA", "tags": ["vkAo4jbF", "dQn8SMRL", "8HceTevu"]}' \
    > test.out 2>&1
eval_tap $? 42 'CreateStat' test.out

#- 43 ExportStats
./ng net.accelbyte.sdk.cli.Main social exportStats \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 43 'ExportStats' test.out

#- 44 ImportStats
./ng net.accelbyte.sdk.cli.Main social importStats \
    --namespace "$AB_NAMESPACE" \
    --replaceExisting  \
    --file 'tmp.dat' \
    > test.out 2>&1
eval_tap $? 44 'ImportStats' test.out

#- 45 QueryStats
./ng net.accelbyte.sdk.cli.Main social queryStats \
    --namespace "$AB_NAMESPACE" \
    --isGlobal  \
    --isPublic  \
    --limit '43' \
    --offset '14' \
    --keyword 'NqsM3MIk' \
    > test.out 2>&1
eval_tap $? 45 'QueryStats' test.out

#- 46 GetStat
./ng net.accelbyte.sdk.cli.Main social getStat \
    --namespace "$AB_NAMESPACE" \
    --statCode 'FrN3utby' \
    > test.out 2>&1
eval_tap $? 46 'GetStat' test.out

#- 47 DeleteStat
./ng net.accelbyte.sdk.cli.Main social deleteStat \
    --namespace "$AB_NAMESPACE" \
    --statCode 'nunCp4AG' \
    > test.out 2>&1
eval_tap $? 47 'DeleteStat' test.out

#- 48 UpdateStat
./ng net.accelbyte.sdk.cli.Main social updateStat \
    --namespace "$AB_NAMESPACE" \
    --statCode 'FhTykgCu' \
    --body '{"cycleIds": ["rtCfQXy9", "Ld2FNbMN", "STLJwWfF"], "defaultValue": 0.5049317240431136, "description": "1muA1Nw1", "ignoreAdditionalDataOnValueRejected": false, "isPublic": true, "name": "g0CF7Amy", "tags": ["4jZxbMOy", "he9K5RQN", "ccuJV7xc"]}' \
    > test.out 2>&1
eval_tap $? 48 'UpdateStat' test.out

#- 49 DeleteTiedStat
./ng net.accelbyte.sdk.cli.Main social deleteTiedStat \
    --namespace "$AB_NAMESPACE" \
    --statCode 'wGH1XtLU' \
    > test.out 2>&1
eval_tap $? 49 'DeleteTiedStat' test.out

#- 50 GetUserStatCycleItems
./ng net.accelbyte.sdk.cli.Main social getUserStatCycleItems \
    --cycleId 'irO54I7a' \
    --namespace "$AB_NAMESPACE" \
    --userId 'oI5VOsTB' \
    --isPublic  \
    --limit '94' \
    --offset '86' \
    --sortBy 'dqdR8rsz' \
    --statCodes 'iqwMIHyS' \
    > test.out 2>&1
eval_tap $? 50 'GetUserStatCycleItems' test.out

#- 51 GetUserStatItems
./ng net.accelbyte.sdk.cli.Main social getUserStatItems \
    --namespace "$AB_NAMESPACE" \
    --userId 'QB4IeaeU' \
    --isPublic  \
    --limit '47' \
    --offset '69' \
    --sortBy 'V2V9ecMX' \
    --statCodes '1aa3w6Ha' \
    --tags 'PLXvxDWl' \
    > test.out 2>&1
eval_tap $? 51 'GetUserStatItems' test.out

#- 52 BulkCreateUserStatItems
./ng net.accelbyte.sdk.cli.Main social bulkCreateUserStatItems \
    --namespace "$AB_NAMESPACE" \
    --userId 'sHh8pJtq' \
    --body '[{"statCode": "DLsAdRM8"}, {"statCode": "u2VnqY1H"}, {"statCode": "4HYmdrvz"}]' \
    > test.out 2>&1
eval_tap $? 52 'BulkCreateUserStatItems' test.out

#- 53 BulkIncUserStatItem1
./ng net.accelbyte.sdk.cli.Main social bulkIncUserStatItem1 \
    --namespace "$AB_NAMESPACE" \
    --userId 'mUJgkpTG' \
    --body '[{"inc": 0.904507453276028, "statCode": "JMdHLzvx"}, {"inc": 0.10096195535631547, "statCode": "j9RFPQV4"}, {"inc": 0.8075514034940835, "statCode": "Z8gy12rZ"}]' \
    > test.out 2>&1
eval_tap $? 53 'BulkIncUserStatItem1' test.out

#- 54 BulkIncUserStatItemValue1
./ng net.accelbyte.sdk.cli.Main social bulkIncUserStatItemValue1 \
    --namespace "$AB_NAMESPACE" \
    --userId 'XIeqVhrd' \
    --body '[{"inc": 0.18707574592107046, "statCode": "spwSw4uL"}, {"inc": 0.5816299047364631, "statCode": "CmK7pbPH"}, {"inc": 0.7108236549933232, "statCode": "HC5RMCGT"}]' \
    > test.out 2>&1
eval_tap $? 54 'BulkIncUserStatItemValue1' test.out

#- 55 BulkResetUserStatItem1
./ng net.accelbyte.sdk.cli.Main social bulkResetUserStatItem1 \
    --namespace "$AB_NAMESPACE" \
    --userId 'x8wPaUDH' \
    --body '[{"statCode": "sKmr4eGi"}, {"statCode": "6fXyBQn8"}, {"statCode": "nHwF0oiB"}]' \
    > test.out 2>&1
eval_tap $? 55 'BulkResetUserStatItem1' test.out

#- 56 CreateUserStatItem
./ng net.accelbyte.sdk.cli.Main social createUserStatItem \
    --namespace "$AB_NAMESPACE" \
    --statCode 'xZ1SQgPU' \
    --userId 'mLnylMzH' \
    > test.out 2>&1
eval_tap $? 56 'CreateUserStatItem' test.out

#- 57 DeleteUserStatItems
./ng net.accelbyte.sdk.cli.Main social deleteUserStatItems \
    --namespace "$AB_NAMESPACE" \
    --statCode 'XswNVMEe' \
    --userId '5jTSB89p' \
    > test.out 2>&1
eval_tap $? 57 'DeleteUserStatItems' test.out

#- 58 IncUserStatItemValue
./ng net.accelbyte.sdk.cli.Main social incUserStatItemValue \
    --namespace "$AB_NAMESPACE" \
    --statCode 'Botj5rSU' \
    --userId '5z4tgGkR' \
    --body '{"inc": 0.8551548358599559}' \
    > test.out 2>&1
eval_tap $? 58 'IncUserStatItemValue' test.out

#- 59 ResetUserStatItemValue
./ng net.accelbyte.sdk.cli.Main social resetUserStatItemValue \
    --namespace "$AB_NAMESPACE" \
    --statCode 'teuZKm95' \
    --userId 'ooeCopTz' \
    --additionalKey 'avM0AsBh' \
    --body '{"additionalData": {"z8UOUDLy": {}, "UcSDPEMf": {}, "1wjdvh3e": {}}}' \
    > test.out 2>&1
eval_tap $? 59 'ResetUserStatItemValue' test.out

#- 60 GetGlobalStatItems1
./ng net.accelbyte.sdk.cli.Main social getGlobalStatItems1 \
    --namespace "$AB_NAMESPACE" \
    --limit '96' \
    --offset '44' \
    --statCodes 'IybHM6Kq' \
    > test.out 2>&1
eval_tap $? 60 'GetGlobalStatItems1' test.out

#- 61 GetGlobalStatItemByStatCode1
./ng net.accelbyte.sdk.cli.Main social getGlobalStatItemByStatCode1 \
    --namespace "$AB_NAMESPACE" \
    --statCode '0N0ihhKO' \
    > test.out 2>&1
eval_tap $? 61 'GetGlobalStatItemByStatCode1' test.out

#- 62 GetStatCycles1
./ng net.accelbyte.sdk.cli.Main social getStatCycles1 \
    --namespace "$AB_NAMESPACE" \
    --cycleType 'ANNUALLY' \
    --limit '4' \
    --name '3SlTmoAw' \
    --offset '26' \
    --sortBy '4W03BdKr' \
    --status 'INIT' \
    > test.out 2>&1
eval_tap $? 62 'GetStatCycles1' test.out

#- 63 BulkGetStatCycle1
./ng net.accelbyte.sdk.cli.Main social bulkGetStatCycle1 \
    --namespace "$AB_NAMESPACE" \
    --body '{"cycleIds": ["JMevDC5W", "hlsJ8pLP", "QYxepTur"]}' \
    > test.out 2>&1
eval_tap $? 63 'BulkGetStatCycle1' test.out

#- 64 GetStatCycle1
./ng net.accelbyte.sdk.cli.Main social getStatCycle1 \
    --cycleId '6Rt6AsTL' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 64 'GetStatCycle1' test.out

#- 65 BulkFetchStatItems1
./ng net.accelbyte.sdk.cli.Main social bulkFetchStatItems1 \
    --namespace "$AB_NAMESPACE" \
    --statCode 'vBWaVu5Z' \
    --userIds 'oN7la043' \
    > test.out 2>&1
eval_tap $? 65 'BulkFetchStatItems1' test.out

#- 66 PublicBulkIncUserStatItem
./ng net.accelbyte.sdk.cli.Main social publicBulkIncUserStatItem \
    --namespace "$AB_NAMESPACE" \
    --body '[{"inc": 0.6513682887501726, "statCode": "5C1PtrAr", "userId": "fBZGwdeF"}, {"inc": 0.010971262098132373, "statCode": "Bytzi9iT", "userId": "4O9QZWZy"}, {"inc": 0.6539283296645376, "statCode": "Ph3USd0H", "userId": "LUk37Ayp"}]' \
    > test.out 2>&1
eval_tap $? 66 'PublicBulkIncUserStatItem' test.out

#- 67 PublicBulkIncUserStatItemValue
./ng net.accelbyte.sdk.cli.Main social publicBulkIncUserStatItemValue \
    --namespace "$AB_NAMESPACE" \
    --body '[{"inc": 0.5205184766471875, "statCode": "9gwTFxEs", "userId": "tuVYNoty"}, {"inc": 0.24071356808364797, "statCode": "ktjPsajh", "userId": "dTh65WSd"}, {"inc": 0.6084526918333721, "statCode": "b6KQGOo6", "userId": "8AoqOxCx"}]' \
    > test.out 2>&1
eval_tap $? 67 'PublicBulkIncUserStatItemValue' test.out

#- 68 BulkResetUserStatItem2
./ng net.accelbyte.sdk.cli.Main social bulkResetUserStatItem2 \
    --namespace "$AB_NAMESPACE" \
    --body '[{"statCode": "YlMgxgGK", "userId": "NptGflyS"}, {"statCode": "jzNtvLC5", "userId": "xt72BOx6"}, {"statCode": "9xV9G7jT", "userId": "n382Xsjm"}]' \
    > test.out 2>&1
eval_tap $? 68 'BulkResetUserStatItem2' test.out

#- 69 CreateStat1
./ng net.accelbyte.sdk.cli.Main social createStat1 \
    --namespace "$AB_NAMESPACE" \
    --body '{"cycleIds": ["7ixB7ueQ", "6unk0vIS", "qD9Ml0Mp"], "defaultValue": 0.1507037379053553, "description": "2TelpV3s", "ignoreAdditionalDataOnValueRejected": false, "incrementOnly": false, "isPublic": false, "maximum": 0.6457090970618982, "minimum": 0.7929242353994439, "name": "GiAm3YIQ", "setAsGlobal": false, "setBy": "SERVER", "statCode": "iLqBywTw", "tags": ["ztAU064h", "y7jxxzqK", "swTQnied"]}' \
    > test.out 2>&1
eval_tap $? 69 'CreateStat1' test.out

#- 70 PublicListMyStatCycleItems
./ng net.accelbyte.sdk.cli.Main social publicListMyStatCycleItems \
    --cycleId 'XJ4QO1vR' \
    --namespace "$AB_NAMESPACE" \
    --limit '68' \
    --offset '3' \
    --sortBy 'SeIzIv9z' \
    --statCodes 'lVfvIVVB,KGFDhxIr,8oNtlEmv' \
    > test.out 2>&1
eval_tap $? 70 'PublicListMyStatCycleItems' test.out

#- 71 PublicListMyStatItems
./ng net.accelbyte.sdk.cli.Main social publicListMyStatItems \
    --namespace "$AB_NAMESPACE" \
    --limit '86' \
    --offset '54' \
    --sortBy 'xY0ueDsj' \
    --statCodes 'y5Fy8Sl7,W8UFnFHh,iS2sMD5m' \
    --tags 'Y0Dd2y7I,JSNcQ7TQ,0UjJkWbB' \
    > test.out 2>&1
eval_tap $? 71 'PublicListMyStatItems' test.out

#- 72 PublicListAllMyStatItems
./ng net.accelbyte.sdk.cli.Main social publicListAllMyStatItems \
    --namespace "$AB_NAMESPACE" \
    --additionalKey 'XX7mUKiK' \
    --statCodes 'ndUSjgZr,PouvpQtk,jQxdHToP' \
    --tags 'xa6zgjZJ,F6HC74cH,oVLarhx9' \
    > test.out 2>&1
eval_tap $? 72 'PublicListAllMyStatItems' test.out

#- 73 GetUserStatCycleItems1
./ng net.accelbyte.sdk.cli.Main social getUserStatCycleItems1 \
    --cycleId '5NmjbCiD' \
    --namespace "$AB_NAMESPACE" \
    --userId 'bS10i6ix' \
    --limit '8' \
    --offset '92' \
    --sortBy '5QUFyAi5' \
    --statCodes '0kxzajv5' \
    > test.out 2>&1
eval_tap $? 73 'GetUserStatCycleItems1' test.out

#- 74 PublicQueryUserStatItems
./ng net.accelbyte.sdk.cli.Main social publicQueryUserStatItems \
    --namespace "$AB_NAMESPACE" \
    --userId 'fNikW07b' \
    --limit '52' \
    --offset '2' \
    --sortBy 'EHBYXX5T' \
    --statCodes 'BuXnmXF9' \
    --tags 'XNhIZCjb' \
    > test.out 2>&1
eval_tap $? 74 'PublicQueryUserStatItems' test.out

#- 75 PublicBulkCreateUserStatItems
./ng net.accelbyte.sdk.cli.Main social publicBulkCreateUserStatItems \
    --namespace "$AB_NAMESPACE" \
    --userId 'RZhTj1Zh' \
    --body '[{"statCode": "H9249MVV"}, {"statCode": "ZQ4bObcf"}, {"statCode": "g31JUmqO"}]' \
    > test.out 2>&1
eval_tap $? 75 'PublicBulkCreateUserStatItems' test.out

#- 76 PublicQueryUserStatItems1
./ng net.accelbyte.sdk.cli.Main social publicQueryUserStatItems1 \
    --namespace "$AB_NAMESPACE" \
    --userId 'e3Id47FH' \
    --additionalKey 'xGrwD017' \
    --statCodes 'l83E4k7l,lrACuRgd,Xzd2x7eL' \
    --tags 'lkk4RWHO,ATovGkkY,JU0VeEiw' \
    > test.out 2>&1
eval_tap $? 76 'PublicQueryUserStatItems1' test.out

#- 77 PublicBulkIncUserStatItem1
./ng net.accelbyte.sdk.cli.Main social publicBulkIncUserStatItem1 \
    --namespace "$AB_NAMESPACE" \
    --userId 'b445ifLC' \
    --body '[{"inc": 0.9456606216963612, "statCode": "Fxwm4GHy"}, {"inc": 0.06215673896097451, "statCode": "LDJmy6bc"}, {"inc": 0.14749812917354777, "statCode": "CwtWvTg7"}]' \
    > test.out 2>&1
eval_tap $? 77 'PublicBulkIncUserStatItem1' test.out

#- 78 BulkIncUserStatItemValue2
./ng net.accelbyte.sdk.cli.Main social bulkIncUserStatItemValue2 \
    --namespace "$AB_NAMESPACE" \
    --userId 'jz98D4WW' \
    --body '[{"inc": 0.28418198539011974, "statCode": "BruGPJm8"}, {"inc": 0.9285588910108238, "statCode": "T9Sj16EY"}, {"inc": 0.33014298376535656, "statCode": "0EamOEv4"}]' \
    > test.out 2>&1
eval_tap $? 78 'BulkIncUserStatItemValue2' test.out

#- 79 BulkResetUserStatItem3
./ng net.accelbyte.sdk.cli.Main social bulkResetUserStatItem3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'xr6bK23O' \
    --body '[{"statCode": "TOJgl4co"}, {"statCode": "sbhOdJ9G"}, {"statCode": "SbABTVLk"}]' \
    > test.out 2>&1
eval_tap $? 79 'BulkResetUserStatItem3' test.out

#- 80 PublicCreateUserStatItem
./ng net.accelbyte.sdk.cli.Main social publicCreateUserStatItem \
    --namespace "$AB_NAMESPACE" \
    --statCode 'jyAndawn' \
    --userId 'hdEOb2Di' \
    > test.out 2>&1
eval_tap $? 80 'PublicCreateUserStatItem' test.out

#- 81 DeleteUserStatItems1
./ng net.accelbyte.sdk.cli.Main social deleteUserStatItems1 \
    --namespace "$AB_NAMESPACE" \
    --statCode 'SykYy0EI' \
    --userId 'reHqfH9R' \
    > test.out 2>&1
eval_tap $? 81 'DeleteUserStatItems1' test.out

#- 82 PublicIncUserStatItem
./ng net.accelbyte.sdk.cli.Main social publicIncUserStatItem \
    --namespace "$AB_NAMESPACE" \
    --statCode '3RdnUiCF' \
    --userId 'USAvfSwC' \
    --body '{"inc": 0.5739159295853838}' \
    > test.out 2>&1
eval_tap $? 82 'PublicIncUserStatItem' test.out

#- 83 PublicIncUserStatItemValue
./ng net.accelbyte.sdk.cli.Main social publicIncUserStatItemValue \
    --namespace "$AB_NAMESPACE" \
    --statCode 'ASHd5pSA' \
    --userId 'lWum4dnN' \
    --body '{"inc": 0.432283689763849}' \
    > test.out 2>&1
eval_tap $? 83 'PublicIncUserStatItemValue' test.out

#- 84 ResetUserStatItemValue1
./ng net.accelbyte.sdk.cli.Main social resetUserStatItemValue1 \
    --namespace "$AB_NAMESPACE" \
    --statCode 'JOahwER2' \
    --userId 'x6RclHho' \
    > test.out 2>&1
eval_tap $? 84 'ResetUserStatItemValue1' test.out

#- 85 BulkUpdateUserStatItemV2
./ng net.accelbyte.sdk.cli.Main social bulkUpdateUserStatItemV2 \
    --namespace "$AB_NAMESPACE" \
    --body '[{"additionalData": {"c8NLAuUv": {}, "jT4sS5SQ": {}, "0G1TaLUi": {}}, "additionalKey": "XJ8SapIV", "statCode": "1jJbZAnT", "updateStrategy": "MAX", "userId": "XWfj2hyw", "value": 0.15264913127264956}, {"additionalData": {"6UqyWIoS": {}, "LkINlFKj": {}, "dEtwgj3e": {}}, "additionalKey": "jzG8P8kU", "statCode": "OmuO3sYQ", "updateStrategy": "INCREMENT", "userId": "S5tjr8xx", "value": 0.9694454449164287}, {"additionalData": {"tFnk2ale": {}, "4CRyREvl": {}, "xkCpkFEI": {}}, "additionalKey": "1wjEi9K6", "statCode": "U5sYyCih", "updateStrategy": "INCREMENT", "userId": "mtfuZFpr", "value": 0.46404174605770987}]' \
    > test.out 2>&1
eval_tap $? 85 'BulkUpdateUserStatItemV2' test.out

#- 86 BulkFetchOrDefaultStatItems1
./ng net.accelbyte.sdk.cli.Main social bulkFetchOrDefaultStatItems1 \
    --namespace "$AB_NAMESPACE" \
    --additionalKey 'E0mi7eFU' \
    --statCode 'fJvV2hGr' \
    --userIds 'nAXfQoNb,54EMJhtX,EKAN4zC9' \
    > test.out 2>&1
eval_tap $? 86 'BulkFetchOrDefaultStatItems1' test.out

#- 87 AdminListUsersStatItems
./ng net.accelbyte.sdk.cli.Main social adminListUsersStatItems \
    --namespace "$AB_NAMESPACE" \
    --userId 'DOZDS2KW' \
    --additionalKey '4iupNQbB' \
    --statCodes '7CBAeY7d,Zda3W0Cf,1cQniGPu' \
    --tags '3wJV5QJ9,EHaLaFT0,KBaWXRXF' \
    > test.out 2>&1
eval_tap $? 87 'AdminListUsersStatItems' test.out

#- 88 BulkUpdateUserStatItem
./ng net.accelbyte.sdk.cli.Main social bulkUpdateUserStatItem \
    --namespace "$AB_NAMESPACE" \
    --userId 'hkdZzB72' \
    --additionalKey 'NUkLMEQd' \
    --body '[{"additionalData": {"hsf6cJVn": {}, "KhwqH3ls": {}, "m7H8KTCx": {}}, "statCode": "XA7FApE7", "updateStrategy": "OVERRIDE", "value": 0.9918351156229605}, {"additionalData": {"Ofe1uUc3": {}, "apYsCFvt": {}, "MHiUE65m": {}}, "statCode": "ZgXqv4d3", "updateStrategy": "MIN", "value": 0.19654208489688652}, {"additionalData": {"X2Ff4JbY": {}, "sIgcVuvp": {}, "BoVD9qzo": {}}, "statCode": "HXR4R2mF", "updateStrategy": "MAX", "value": 0.010937017117876757}]' \
    > test.out 2>&1
eval_tap $? 88 'BulkUpdateUserStatItem' test.out

#- 89 BulkResetUserStatItemValues
./ng net.accelbyte.sdk.cli.Main social bulkResetUserStatItemValues \
    --namespace "$AB_NAMESPACE" \
    --userId 'p4VJHR5O' \
    --additionalKey 'skXJGI0p' \
    --body '[{"additionalData": {"frZMqAkx": {}, "jbaFQFbd": {}, "X1LgWzO2": {}}, "statCode": "g0dp1pYx"}, {"additionalData": {"6aiKVhuL": {}, "yJ8s9ts1": {}, "1tUDZSkL": {}}, "statCode": "R1WW4VRa"}, {"additionalData": {"QLWhwJhX": {}, "bHc9Kuym": {}, "CPsXmYjE": {}}, "statCode": "GPfnWFA7"}]' \
    > test.out 2>&1
eval_tap $? 89 'BulkResetUserStatItemValues' test.out

#- 90 DeleteUserStatItems2
./ng net.accelbyte.sdk.cli.Main social deleteUserStatItems2 \
    --namespace "$AB_NAMESPACE" \
    --statCode 'VBFeNAsc' \
    --userId 'KuYn6cVh' \
    --additionalKey '3OBlBttV' \
    > test.out 2>&1
eval_tap $? 90 'DeleteUserStatItems2' test.out

#- 91 UpdateUserStatItemValue
./ng net.accelbyte.sdk.cli.Main social updateUserStatItemValue \
    --namespace "$AB_NAMESPACE" \
    --statCode 'lDQ4g5J6' \
    --userId '6EaqHwIo' \
    --additionalKey 'K2dQDPy9' \
    --body '{"additionalData": {"mAUz4ciE": {}, "kGVlqxhd": {}, "AtS8FcLX": {}}, "updateStrategy": "OVERRIDE", "value": 0.7134643953403967}' \
    > test.out 2>&1
eval_tap $? 91 'UpdateUserStatItemValue' test.out

#- 92 BulkUpdateUserStatItem1
./ng net.accelbyte.sdk.cli.Main social bulkUpdateUserStatItem1 \
    --namespace "$AB_NAMESPACE" \
    --body '[{"additionalData": {"HB2PuwJf": {}, "mRpSpLfO": {}, "VMRcWlUF": {}}, "additionalKey": "5eHTFbdC", "statCode": "vy7KXEae", "updateStrategy": "MIN", "userId": "MmTVOk7Z", "value": 0.12307044947434465}, {"additionalData": {"2WGWdK0I": {}, "1sLVwUf6": {}, "K9VDaNZr": {}}, "additionalKey": "3KBGgoy3", "statCode": "tMorJQ1t", "updateStrategy": "OVERRIDE", "userId": "MjP8hncH", "value": 0.049451176747362546}, {"additionalData": {"y7Q05doH": {}, "zp4rWKz1": {}, "5a9N9yX3": {}}, "additionalKey": "mxPPPZPO", "statCode": "JfDre2Bs", "updateStrategy": "INCREMENT", "userId": "XMQ53bvk", "value": 0.6743610216651238}]' \
    > test.out 2>&1
eval_tap $? 92 'BulkUpdateUserStatItem1' test.out

#- 93 PublicQueryUserStatItems2
./ng net.accelbyte.sdk.cli.Main social publicQueryUserStatItems2 \
    --namespace "$AB_NAMESPACE" \
    --userId 'SWFLySxU' \
    --additionalKey 'HnQUevkP' \
    --statCodes 'YKvonym7,LXMsEz5I,tONoDhD4' \
    --tags 'lca1kcwC,jg6b26kd,y6PI5t2n' \
    > test.out 2>&1
eval_tap $? 93 'PublicQueryUserStatItems2' test.out

#- 94 BulkUpdateUserStatItem2
./ng net.accelbyte.sdk.cli.Main social bulkUpdateUserStatItem2 \
    --namespace "$AB_NAMESPACE" \
    --userId 'UilCLfCs' \
    --additionalKey 'RjEddcQo' \
    --body '[{"additionalData": {"Rtaj1pk6": {}, "xjDqoNZr": {}, "yzUz0ZUS": {}}, "statCode": "efSezrBh", "updateStrategy": "MIN", "value": 0.09652233625705364}, {"additionalData": {"ufZDdHUL": {}, "672wM2Qt": {}, "hYLR73gc": {}}, "statCode": "rspujwEr", "updateStrategy": "MIN", "value": 0.9757566752883444}, {"additionalData": {"UbqswG2f": {}, "ZKINsMhC": {}, "tki1LgFQ": {}}, "statCode": "cLi4BEOa", "updateStrategy": "INCREMENT", "value": 0.34603614663046456}]' \
    > test.out 2>&1
eval_tap $? 94 'BulkUpdateUserStatItem2' test.out

#- 95 UpdateUserStatItemValue1
./ng net.accelbyte.sdk.cli.Main social updateUserStatItemValue1 \
    --namespace "$AB_NAMESPACE" \
    --statCode 'Aekhvpt1' \
    --userId 'emFxRaP4' \
    --additionalKey 'mgb62Xzd' \
    --body '{"additionalData": {"eR1gXtWA": {}, "KKd0eNuI": {}, "pkabY5d7": {}}, "updateStrategy": "MIN", "value": 0.6791407973386308}' \
    > test.out 2>&1
eval_tap $? 95 'UpdateUserStatItemValue1' test.out


rm -f "tmp.dat"

exit $EXIT_CODE