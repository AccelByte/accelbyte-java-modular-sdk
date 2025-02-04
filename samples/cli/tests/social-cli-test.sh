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
    --userId 'OMPVhP8D' \
    > test.out 2>&1
eval_tap $? 8 'GetUserProfiles' test.out

#- 9 GetProfile
./ng net.accelbyte.sdk.cli.Main social getProfile \
    --namespace "$AB_NAMESPACE" \
    --profileId '7DYUWtji' \
    --userId 'QwL7s3VK' \
    > test.out 2>&1
eval_tap $? 9 'GetProfile' test.out

#- 10 GetUserNamespaceSlots
eval_tap 0 10 'GetUserNamespaceSlots # SKIP deprecated' test.out

#- 11 GetSlotData
eval_tap 0 11 'GetSlotData # SKIP deprecated' test.out

#- 12 PublicGetUserGameProfiles
./ng net.accelbyte.sdk.cli.Main social publicGetUserGameProfiles \
    --namespace "$AB_NAMESPACE" \
    --userIds 'cdnXVPDJ,diHQ3BM6,LY8Og8DQ' \
    > test.out 2>&1
eval_tap $? 12 'PublicGetUserGameProfiles' test.out

#- 13 PublicGetUserProfiles
./ng net.accelbyte.sdk.cli.Main social publicGetUserProfiles \
    --namespace "$AB_NAMESPACE" \
    --userId 'b0zwJM36' \
    > test.out 2>&1
eval_tap $? 13 'PublicGetUserProfiles' test.out

#- 14 PublicCreateProfile
./ng net.accelbyte.sdk.cli.Main social publicCreateProfile \
    --namespace "$AB_NAMESPACE" \
    --userId 'D5oLUf9u' \
    --body '{"achievements": ["AASX3Gfr", "p5SWTymd", "6abzn6z6"], "attributes": {"1fMsjBnz": "mQlSojbH", "3KdFRell": "b3Sp73XK", "kxdomgSK": "8F2JnTe3"}, "avatarUrl": "pVNUMDlQ", "inventories": ["GDTe6i3Y", "vsjTb3CQ", "DOjvZQ4M"], "label": "SlkwCE5A", "profileName": "apgWo8tM", "statistics": ["OdJsYLJq", "BU2HLwWI", "riDp69tn"], "tags": ["6PrDO7xb", "LhrV9CMN", "Ept0FLfD"]}' \
    > test.out 2>&1
eval_tap $? 14 'PublicCreateProfile' test.out

#- 15 PublicGetProfile
./ng net.accelbyte.sdk.cli.Main social publicGetProfile \
    --namespace "$AB_NAMESPACE" \
    --profileId 'ISVK2DrF' \
    --userId 'Mr4zYd5l' \
    > test.out 2>&1
eval_tap $? 15 'PublicGetProfile' test.out

#- 16 PublicUpdateProfile
./ng net.accelbyte.sdk.cli.Main social publicUpdateProfile \
    --namespace "$AB_NAMESPACE" \
    --profileId '67q11WtT' \
    --userId 'rSDz3BhJ' \
    --body '{"achievements": ["amQmOzyn", "iCrRpgpz", "Vz0mraua"], "attributes": {"0wdRUUKx": "6BPN0WES", "RsIKlli4": "YUY7zxBw", "idC7yzQZ": "GfnSLAKf"}, "avatarUrl": "35Ip0h3m", "inventories": ["JtqjWbFc", "330SSsV4", "WFAev6Zr"], "label": "d8zqUh44", "profileName": "SOqF9ZfV", "statistics": ["rybUjGYb", "Qppq8GuM", "FMahof6x"], "tags": ["f3EX6Lng", "ocYr36fA", "3JaQsGSm"]}' \
    > test.out 2>&1
eval_tap $? 16 'PublicUpdateProfile' test.out

#- 17 PublicDeleteProfile
./ng net.accelbyte.sdk.cli.Main social publicDeleteProfile \
    --namespace "$AB_NAMESPACE" \
    --profileId '9uJA5W5n' \
    --userId 'cYdz3DsJ' \
    > test.out 2>&1
eval_tap $? 17 'PublicDeleteProfile' test.out

#- 18 PublicGetProfileAttribute
./ng net.accelbyte.sdk.cli.Main social publicGetProfileAttribute \
    --attributeName '0UQIm6FO' \
    --namespace "$AB_NAMESPACE" \
    --profileId 'i8Mkudvj' \
    --userId 'HQAkCd3J' \
    > test.out 2>&1
eval_tap $? 18 'PublicGetProfileAttribute' test.out

#- 19 PublicUpdateAttribute
./ng net.accelbyte.sdk.cli.Main social publicUpdateAttribute \
    --attributeName 'XxyWmadp' \
    --namespace "$AB_NAMESPACE" \
    --profileId 'x3c91sNQ' \
    --userId 'RwxIYiVu' \
    --body '{"name": "83PvJ7hb", "value": "kpWdQb8H"}' \
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
    --limit '78' \
    --offset '35' \
    --statCodes 'wnbu3xBE' \
    > test.out 2>&1
eval_tap $? 26 'GetGlobalStatItems' test.out

#- 27 GetGlobalStatItemByStatCode
./ng net.accelbyte.sdk.cli.Main social getGlobalStatItemByStatCode \
    --namespace "$AB_NAMESPACE" \
    --statCode '8LGmPSUQ' \
    > test.out 2>&1
eval_tap $? 27 'GetGlobalStatItemByStatCode' test.out

#- 28 GetStatCycles
./ng net.accelbyte.sdk.cli.Main social getStatCycles \
    --namespace "$AB_NAMESPACE" \
    --cycleType 'DAILY' \
    --limit '29' \
    --name 'NA8dcsrA' \
    --offset '3' \
    --sortBy 'IiM3Esfi' \
    --status 'STOPPED' \
    > test.out 2>&1
eval_tap $? 28 'GetStatCycles' test.out

#- 29 CreateStatCycle
./ng net.accelbyte.sdk.cli.Main social createStatCycle \
    --namespace "$AB_NAMESPACE" \
    --body '{"cycleType": "ANNUALLY", "description": "8o9PSTIH", "end": "1993-05-02T00:00:00Z", "id": "G8CKAABj", "name": "5K7c6yIc", "resetDate": 78, "resetDay": 47, "resetMonth": 54, "resetTime": "HXvohWDB", "seasonPeriod": 81, "start": "1990-01-19T00:00:00Z"}' \
    > test.out 2>&1
eval_tap $? 29 'CreateStatCycle' test.out

#- 30 BulkGetStatCycle
./ng net.accelbyte.sdk.cli.Main social bulkGetStatCycle \
    --namespace "$AB_NAMESPACE" \
    --body '{"cycleIds": ["e3qiQzTV", "4vWQiZCM", "9lYVRAUL"]}' \
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
    --cycleId 'pmVRZNIb' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 33 'GetStatCycle' test.out

#- 34 UpdateStatCycle
./ng net.accelbyte.sdk.cli.Main social updateStatCycle \
    --cycleId 'PapW0djV' \
    --namespace "$AB_NAMESPACE" \
    --body '{"cycleType": "DAILY", "description": "pTEAyv37", "end": "1979-06-09T00:00:00Z", "name": "p1hcLpVe", "resetDate": 23, "resetDay": 39, "resetMonth": 91, "resetTime": "yfpGaHnF", "seasonPeriod": 90, "start": "1979-09-02T00:00:00Z"}' \
    > test.out 2>&1
eval_tap $? 34 'UpdateStatCycle' test.out

#- 35 DeleteStatCycle
./ng net.accelbyte.sdk.cli.Main social deleteStatCycle \
    --cycleId 'alsccSUO' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 35 'DeleteStatCycle' test.out

#- 36 BulkAddStats
./ng net.accelbyte.sdk.cli.Main social bulkAddStats \
    --cycleId 'H9yulpb0' \
    --namespace "$AB_NAMESPACE" \
    --body '{"statCodes": ["B8W4GyJs", "jTW5p7L2", "iKO88cDk"]}' \
    > test.out 2>&1
eval_tap $? 36 'BulkAddStats' test.out

#- 37 StopStatCycle
./ng net.accelbyte.sdk.cli.Main social stopStatCycle \
    --cycleId 'z7HCg37Z' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 37 'StopStatCycle' test.out

#- 38 BulkFetchStatItems
./ng net.accelbyte.sdk.cli.Main social bulkFetchStatItems \
    --namespace "$AB_NAMESPACE" \
    --statCode 'AO7i1nX1' \
    --userIds 'rgtX1Smf' \
    > test.out 2>&1
eval_tap $? 38 'BulkFetchStatItems' test.out

#- 39 BulkIncUserStatItem
./ng net.accelbyte.sdk.cli.Main social bulkIncUserStatItem \
    --namespace "$AB_NAMESPACE" \
    --body '[{"inc": 0.06288673899557806, "statCode": "SY6FbwFI", "userId": "Nfh8Ewni"}, {"inc": 0.4578106949092223, "statCode": "m0INqSPk", "userId": "hxBtWVpu"}, {"inc": 0.4844234948714635, "statCode": "d34PrKII", "userId": "onzFLq3r"}]' \
    > test.out 2>&1
eval_tap $? 39 'BulkIncUserStatItem' test.out

#- 40 BulkIncUserStatItemValue
./ng net.accelbyte.sdk.cli.Main social bulkIncUserStatItemValue \
    --namespace "$AB_NAMESPACE" \
    --body '[{"inc": 0.8409595464089473, "statCode": "X05dDoHb", "userId": "pKTIk9Hg"}, {"inc": 0.8942779532462823, "statCode": "xF6u326e", "userId": "m0DJlNan"}, {"inc": 0.7303059588495026, "statCode": "FESZyr29", "userId": "S06KYCoA"}]' \
    > test.out 2>&1
eval_tap $? 40 'BulkIncUserStatItemValue' test.out

#- 41 BulkFetchOrDefaultStatItems
./ng net.accelbyte.sdk.cli.Main social bulkFetchOrDefaultStatItems \
    --namespace "$AB_NAMESPACE" \
    --statCode 'VfhRGX5F' \
    --userIds 'L8Zq8jZ0,7ki1HKgz,QS1lRq3x' \
    > test.out 2>&1
eval_tap $? 41 'BulkFetchOrDefaultStatItems' test.out

#- 42 BulkResetUserStatItem
./ng net.accelbyte.sdk.cli.Main social bulkResetUserStatItem \
    --namespace "$AB_NAMESPACE" \
    --body '[{"statCode": "iTnpBPwx", "userId": "MTfllsv2"}, {"statCode": "OEbf6EcA", "userId": "MA3Z5I43"}, {"statCode": "am0My7CM", "userId": "c0h2aswZ"}]' \
    > test.out 2>&1
eval_tap $? 42 'BulkResetUserStatItem' test.out

#- 43 GetStats
./ng net.accelbyte.sdk.cli.Main social getStats \
    --namespace "$AB_NAMESPACE" \
    --cycleIds 'i9dbxwV4' \
    --isGlobal  \
    --isPublic  \
    --limit '82' \
    --offset '79' \
    > test.out 2>&1
eval_tap $? 43 'GetStats' test.out

#- 44 CreateStat
./ng net.accelbyte.sdk.cli.Main social createStat \
    --namespace "$AB_NAMESPACE" \
    --body '{"capCycleOverride": true, "cycleIds": ["JzJYvCGQ", "3EXSobpk", "htBKEgcd"], "cycleOverrides": [{"cycleId": "QWzKoh3a", "maximum": 0.8963189827919905, "minimum": 0.18191734237335788}, {"cycleId": "3kb7DndJ", "maximum": 0.2857642733125877, "minimum": 0.2976171880377988}, {"cycleId": "FhWedcyK", "maximum": 0.05951865224591679, "minimum": 0.7996900692247186}], "defaultValue": 0.8735054047062973, "description": "6PkllrbG", "globalAggregationMethod": "MAX", "ignoreAdditionalDataOnValueRejected": false, "incrementOnly": true, "isPublic": false, "maximum": 0.9998393234436643, "minimum": 0.06705017807336378, "name": "d4XeCVqF", "setAsGlobal": true, "setBy": "SERVER", "statCode": "mxKe9H89", "tags": ["ZeGl1l8f", "oo7W6WXh", "MZBMBZum"], "visibility": "SHOWALL"}' \
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
    --limit '24' \
    --offset '35' \
    --keyword 'gRO6IEX2' \
    > test.out 2>&1
eval_tap $? 47 'QueryStats' test.out

#- 48 GetStat
./ng net.accelbyte.sdk.cli.Main social getStat \
    --namespace "$AB_NAMESPACE" \
    --statCode 'xs48NXDS' \
    > test.out 2>&1
eval_tap $? 48 'GetStat' test.out

#- 49 DeleteStat
./ng net.accelbyte.sdk.cli.Main social deleteStat \
    --namespace "$AB_NAMESPACE" \
    --statCode 'w0NGxoB6' \
    > test.out 2>&1
eval_tap $? 49 'DeleteStat' test.out

#- 50 UpdateStat
./ng net.accelbyte.sdk.cli.Main social updateStat \
    --namespace "$AB_NAMESPACE" \
    --statCode 'yx8AbRJE' \
    --body '{"capCycleOverride": false, "cycleIds": ["uY485Xcv", "OTSpNmq5", "3hfy2wUh"], "cycleOverrides": [{"cycleId": "FxDDG5Zj", "maximum": 0.32319283105521723, "minimum": 0.4777691976867653}, {"cycleId": "xLpggJ3E", "maximum": 0.1416611256370286, "minimum": 0.17285000555960117}, {"cycleId": "8TJAIDyf", "maximum": 0.25289825959351286, "minimum": 0.9614903108611214}], "defaultValue": 0.0010520524523650598, "description": "dVDbpSFR", "globalAggregationMethod": "MAX", "ignoreAdditionalDataOnValueRejected": true, "isPublic": false, "name": "wCxbjpry", "tags": ["ZxvxpSmx", "0bIYweP0", "a8pyh108"], "visibility": "SHOWALL"}' \
    > test.out 2>&1
eval_tap $? 50 'UpdateStat' test.out

#- 51 GetStatItems
./ng net.accelbyte.sdk.cli.Main social getStatItems \
    --namespace "$AB_NAMESPACE" \
    --statCode 'kv2InS1Z' \
    --limit '95' \
    --offset '39' \
    --sortBy '0YdTk1TJ' \
    > test.out 2>&1
eval_tap $? 51 'GetStatItems' test.out

#- 52 DeleteTiedStat
./ng net.accelbyte.sdk.cli.Main social deleteTiedStat \
    --namespace "$AB_NAMESPACE" \
    --statCode '4t3Byn8u' \
    > test.out 2>&1
eval_tap $? 52 'DeleteTiedStat' test.out

#- 53 GetUserStatCycleItems
./ng net.accelbyte.sdk.cli.Main social getUserStatCycleItems \
    --cycleId 'yvZRnQAH' \
    --namespace "$AB_NAMESPACE" \
    --userId '6JXMynMN' \
    --isPublic  \
    --limit '91' \
    --offset '43' \
    --sortBy 'raoIjiF5' \
    --statCodes 'rFpm4S5j' \
    > test.out 2>&1
eval_tap $? 53 'GetUserStatCycleItems' test.out

#- 54 GetUserStatItems
./ng net.accelbyte.sdk.cli.Main social getUserStatItems \
    --namespace "$AB_NAMESPACE" \
    --userId 'rV1G1ki1' \
    --isPublic  \
    --limit '25' \
    --offset '5' \
    --sortBy 'Q6oFNAMh' \
    --statCodes 'oXWtBwM0' \
    --tags '6zNJqg5y' \
    > test.out 2>&1
eval_tap $? 54 'GetUserStatItems' test.out

#- 55 BulkCreateUserStatItems
./ng net.accelbyte.sdk.cli.Main social bulkCreateUserStatItems \
    --namespace "$AB_NAMESPACE" \
    --userId 'KxAfaQdZ' \
    --body '[{"statCode": "BNxfbYzN"}, {"statCode": "DG2yw2PA"}, {"statCode": "zxK5T11B"}]' \
    > test.out 2>&1
eval_tap $? 55 'BulkCreateUserStatItems' test.out

#- 56 BulkIncUserStatItem1
./ng net.accelbyte.sdk.cli.Main social bulkIncUserStatItem1 \
    --namespace "$AB_NAMESPACE" \
    --userId 'lV4KV9Bh' \
    --body '[{"inc": 0.9258682771137571, "statCode": "x6NidWbK"}, {"inc": 0.43667992151080615, "statCode": "6T6Iok9l"}, {"inc": 0.7793433577833123, "statCode": "0hGTVVja"}]' \
    > test.out 2>&1
eval_tap $? 56 'BulkIncUserStatItem1' test.out

#- 57 BulkIncUserStatItemValue1
./ng net.accelbyte.sdk.cli.Main social bulkIncUserStatItemValue1 \
    --namespace "$AB_NAMESPACE" \
    --userId 'dD2nv7KP' \
    --body '[{"inc": 0.8316103605026571, "statCode": "UR22AWQ0"}, {"inc": 0.6391149266510698, "statCode": "FCQ5lYA6"}, {"inc": 0.9206915284286206, "statCode": "273pBiUv"}]' \
    > test.out 2>&1
eval_tap $? 57 'BulkIncUserStatItemValue1' test.out

#- 58 BulkResetUserStatItem1
./ng net.accelbyte.sdk.cli.Main social bulkResetUserStatItem1 \
    --namespace "$AB_NAMESPACE" \
    --userId 'etZWkouJ' \
    --body '[{"statCode": "s1jQTXoh"}, {"statCode": "6VTjGMDI"}, {"statCode": "gqTP0v4m"}]' \
    > test.out 2>&1
eval_tap $? 58 'BulkResetUserStatItem1' test.out

#- 59 CreateUserStatItem
./ng net.accelbyte.sdk.cli.Main social createUserStatItem \
    --namespace "$AB_NAMESPACE" \
    --statCode 'FPnqDGD9' \
    --userId 'SYrpCMQK' \
    > test.out 2>&1
eval_tap $? 59 'CreateUserStatItem' test.out

#- 60 DeleteUserStatItems
./ng net.accelbyte.sdk.cli.Main social deleteUserStatItems \
    --namespace "$AB_NAMESPACE" \
    --statCode 'r24f6fLW' \
    --userId 'Uz7bcpib' \
    > test.out 2>&1
eval_tap $? 60 'DeleteUserStatItems' test.out

#- 61 IncUserStatItemValue
./ng net.accelbyte.sdk.cli.Main social incUserStatItemValue \
    --namespace "$AB_NAMESPACE" \
    --statCode 'irYy6msf' \
    --userId 'j95AzTQ0' \
    --body '{"inc": 0.39662632697026134}' \
    > test.out 2>&1
eval_tap $? 61 'IncUserStatItemValue' test.out

#- 62 ResetUserStatItemValue
./ng net.accelbyte.sdk.cli.Main social resetUserStatItemValue \
    --namespace "$AB_NAMESPACE" \
    --statCode 'oyWm5G7W' \
    --userId 'i978UEeN' \
    --additionalKey 'tYbLIDAJ' \
    --body '{"additionalData": {"4yBuof1K": {}, "BeZxXkAU": {}, "m1xPsZeG": {}}}' \
    > test.out 2>&1
eval_tap $? 62 'ResetUserStatItemValue' test.out

#- 63 GetGlobalStatItems1
./ng net.accelbyte.sdk.cli.Main social getGlobalStatItems1 \
    --namespace "$AB_NAMESPACE" \
    --limit '19' \
    --offset '87' \
    --statCodes 'yN1AWm8C' \
    > test.out 2>&1
eval_tap $? 63 'GetGlobalStatItems1' test.out

#- 64 GetGlobalStatItemByStatCode1
./ng net.accelbyte.sdk.cli.Main social getGlobalStatItemByStatCode1 \
    --namespace "$AB_NAMESPACE" \
    --statCode 'OdsHDTox' \
    > test.out 2>&1
eval_tap $? 64 'GetGlobalStatItemByStatCode1' test.out

#- 65 GetStatCycles1
./ng net.accelbyte.sdk.cli.Main social getStatCycles1 \
    --namespace "$AB_NAMESPACE" \
    --cycleType 'MONTHLY' \
    --limit '6' \
    --name 'lMPu4ZUn' \
    --offset '64' \
    --sortBy '4qbOlP6q' \
    --status 'INIT' \
    > test.out 2>&1
eval_tap $? 65 'GetStatCycles1' test.out

#- 66 BulkGetStatCycle1
./ng net.accelbyte.sdk.cli.Main social bulkGetStatCycle1 \
    --namespace "$AB_NAMESPACE" \
    --body '{"cycleIds": ["yZEbJ3Yi", "ASXZ8o98", "JObvZcWn"]}' \
    > test.out 2>&1
eval_tap $? 66 'BulkGetStatCycle1' test.out

#- 67 GetStatCycle1
./ng net.accelbyte.sdk.cli.Main social getStatCycle1 \
    --cycleId 'JvvFoGku' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 67 'GetStatCycle1' test.out

#- 68 BulkFetchStatItems1
./ng net.accelbyte.sdk.cli.Main social bulkFetchStatItems1 \
    --namespace "$AB_NAMESPACE" \
    --statCode 'cRR7o75Q' \
    --userIds 'GALxwSBP' \
    > test.out 2>&1
eval_tap $? 68 'BulkFetchStatItems1' test.out

#- 69 PublicBulkIncUserStatItem
./ng net.accelbyte.sdk.cli.Main social publicBulkIncUserStatItem \
    --namespace "$AB_NAMESPACE" \
    --body '[{"inc": 0.3662267727551971, "statCode": "CQ37y70z", "userId": "6Re2DtLU"}, {"inc": 0.3958805641387675, "statCode": "2iPKJ5HP", "userId": "V0YX3lYB"}, {"inc": 0.9143401190982765, "statCode": "2AEt2xOt", "userId": "siwc4zo7"}]' \
    > test.out 2>&1
eval_tap $? 69 'PublicBulkIncUserStatItem' test.out

#- 70 PublicBulkIncUserStatItemValue
./ng net.accelbyte.sdk.cli.Main social publicBulkIncUserStatItemValue \
    --namespace "$AB_NAMESPACE" \
    --body '[{"inc": 0.171778589050554, "statCode": "FqzYfYDq", "userId": "6frrvxXf"}, {"inc": 0.8886639945256893, "statCode": "bK1YUZ2B", "userId": "F6YWbIYv"}, {"inc": 0.06220064983609275, "statCode": "6OvRiQPh", "userId": "O1eCL4SP"}]' \
    > test.out 2>&1
eval_tap $? 70 'PublicBulkIncUserStatItemValue' test.out

#- 71 BulkResetUserStatItem2
./ng net.accelbyte.sdk.cli.Main social bulkResetUserStatItem2 \
    --namespace "$AB_NAMESPACE" \
    --body '[{"statCode": "yZ4deSdw", "userId": "7xX543vp"}, {"statCode": "cnnKkr2B", "userId": "ECjw4XKH"}, {"statCode": "92e2hBPD", "userId": "NbTA5QRZ"}]' \
    > test.out 2>&1
eval_tap $? 71 'BulkResetUserStatItem2' test.out

#- 72 CreateStat1
./ng net.accelbyte.sdk.cli.Main social createStat1 \
    --namespace "$AB_NAMESPACE" \
    --body '{"capCycleOverride": true, "cycleIds": ["sVEcGAMp", "ge80w9nC", "Gut5XU6V"], "cycleOverrides": [{"cycleId": "GPhswpX0", "maximum": 0.7202514087160131, "minimum": 0.3717117607839443}, {"cycleId": "oxjMLR61", "maximum": 0.3664986530654455, "minimum": 0.48298544529861864}, {"cycleId": "z9eKnDAw", "maximum": 0.7956853327413086, "minimum": 0.7190616191088993}], "defaultValue": 0.7782783426675116, "description": "t9C6nNbh", "globalAggregationMethod": "MIN", "ignoreAdditionalDataOnValueRejected": false, "incrementOnly": true, "isPublic": false, "maximum": 0.14726233902917996, "minimum": 0.17757878520913883, "name": "al4wRNZK", "setAsGlobal": true, "setBy": "SERVER", "statCode": "e4Dl9DVR", "tags": ["MNyPEDsF", "OSXPaBrH", "NDpkNysG"], "visibility": "SERVERONLY"}' \
    > test.out 2>&1
eval_tap $? 72 'CreateStat1' test.out

#- 73 PublicListMyStatCycleItems
./ng net.accelbyte.sdk.cli.Main social publicListMyStatCycleItems \
    --cycleId 'ysa2n3CC' \
    --namespace "$AB_NAMESPACE" \
    --limit '71' \
    --offset '46' \
    --sortBy 'jam8dIKR' \
    --statCodes 'OpnsXGkU,OPlZHr8b,TtXqWXX7' \
    > test.out 2>&1
eval_tap $? 73 'PublicListMyStatCycleItems' test.out

#- 74 PublicListMyStatItems
./ng net.accelbyte.sdk.cli.Main social publicListMyStatItems \
    --namespace "$AB_NAMESPACE" \
    --limit '75' \
    --offset '22' \
    --sortBy 'UQYUT56C' \
    --statCodes 'DKe9D8b8,7lWNBoU3,lC5zFdKI' \
    --tags 'E1bw7lGV,TqQEYnaE,qXhE0WnB' \
    > test.out 2>&1
eval_tap $? 74 'PublicListMyStatItems' test.out

#- 75 PublicListAllMyStatItems
./ng net.accelbyte.sdk.cli.Main social publicListAllMyStatItems \
    --namespace "$AB_NAMESPACE" \
    --additionalKey 'aaLZhALo' \
    --statCodes '2qLxKhkl,khmVF5FT,79AUchOT' \
    --tags 'MQGpwl4X,JkamGUts,mGs8kPSx' \
    > test.out 2>&1
eval_tap $? 75 'PublicListAllMyStatItems' test.out

#- 76 GetUserStatCycleItems1
./ng net.accelbyte.sdk.cli.Main social getUserStatCycleItems1 \
    --cycleId 'V1bHtJfY' \
    --namespace "$AB_NAMESPACE" \
    --userId 'pIFjRUHw' \
    --limit '39' \
    --offset '58' \
    --sortBy 'J7qQU3Hj' \
    --statCodes '419lcDpC' \
    > test.out 2>&1
eval_tap $? 76 'GetUserStatCycleItems1' test.out

#- 77 PublicQueryUserStatItems
./ng net.accelbyte.sdk.cli.Main social publicQueryUserStatItems \
    --namespace "$AB_NAMESPACE" \
    --userId 'MnkA21oz' \
    --limit '2' \
    --offset '55' \
    --sortBy 'jHXGBhMe' \
    --statCodes 'ZHQlZ96W' \
    --tags 'yUDyOKD5' \
    > test.out 2>&1
eval_tap $? 77 'PublicQueryUserStatItems' test.out

#- 78 PublicBulkCreateUserStatItems
./ng net.accelbyte.sdk.cli.Main social publicBulkCreateUserStatItems \
    --namespace "$AB_NAMESPACE" \
    --userId '6Z2xscyJ' \
    --body '[{"statCode": "clRUsVP5"}, {"statCode": "kT9D5Rav"}, {"statCode": "ts4vass2"}]' \
    > test.out 2>&1
eval_tap $? 78 'PublicBulkCreateUserStatItems' test.out

#- 79 PublicQueryUserStatItems1
./ng net.accelbyte.sdk.cli.Main social publicQueryUserStatItems1 \
    --namespace "$AB_NAMESPACE" \
    --userId 'qiUJVQ1V' \
    --additionalKey 'mKE0jgeg' \
    --statCodes 'O0iUQOgd,tczUBTxz,Am9uMRgN' \
    --tags 'utVfN4ZW,Mb8a4YjM,SZPDre7e' \
    > test.out 2>&1
eval_tap $? 79 'PublicQueryUserStatItems1' test.out

#- 80 PublicBulkIncUserStatItem1
./ng net.accelbyte.sdk.cli.Main social publicBulkIncUserStatItem1 \
    --namespace "$AB_NAMESPACE" \
    --userId '7QuemGVt' \
    --body '[{"inc": 0.630647150042189, "statCode": "jrPmExf6"}, {"inc": 0.9767646490244871, "statCode": "AmaO7aia"}, {"inc": 0.9509492278387355, "statCode": "xh4CSitd"}]' \
    > test.out 2>&1
eval_tap $? 80 'PublicBulkIncUserStatItem1' test.out

#- 81 BulkIncUserStatItemValue2
./ng net.accelbyte.sdk.cli.Main social bulkIncUserStatItemValue2 \
    --namespace "$AB_NAMESPACE" \
    --userId 'MOzzYKhd' \
    --body '[{"inc": 0.9150359952598409, "statCode": "wfi7iE5b"}, {"inc": 0.011836251607905468, "statCode": "dbquxsgM"}, {"inc": 0.6350431814071805, "statCode": "tR4t8lYt"}]' \
    > test.out 2>&1
eval_tap $? 81 'BulkIncUserStatItemValue2' test.out

#- 82 BulkResetUserStatItem3
./ng net.accelbyte.sdk.cli.Main social bulkResetUserStatItem3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'ZVWd7Xna' \
    --body '[{"statCode": "YztIb6K5"}, {"statCode": "DPg3N7uO"}, {"statCode": "FOFhq0iV"}]' \
    > test.out 2>&1
eval_tap $? 82 'BulkResetUserStatItem3' test.out

#- 83 PublicCreateUserStatItem
./ng net.accelbyte.sdk.cli.Main social publicCreateUserStatItem \
    --namespace "$AB_NAMESPACE" \
    --statCode 'xlHsNuyV' \
    --userId 'p9gNkQc6' \
    > test.out 2>&1
eval_tap $? 83 'PublicCreateUserStatItem' test.out

#- 84 DeleteUserStatItems1
./ng net.accelbyte.sdk.cli.Main social deleteUserStatItems1 \
    --namespace "$AB_NAMESPACE" \
    --statCode '5laMGezy' \
    --userId 'gSTXK3ax' \
    > test.out 2>&1
eval_tap $? 84 'DeleteUserStatItems1' test.out

#- 85 PublicIncUserStatItem
./ng net.accelbyte.sdk.cli.Main social publicIncUserStatItem \
    --namespace "$AB_NAMESPACE" \
    --statCode 'USkgapPU' \
    --userId 'D14fO6Mt' \
    --body '{"inc": 0.9848188152216559}' \
    > test.out 2>&1
eval_tap $? 85 'PublicIncUserStatItem' test.out

#- 86 PublicIncUserStatItemValue
./ng net.accelbyte.sdk.cli.Main social publicIncUserStatItemValue \
    --namespace "$AB_NAMESPACE" \
    --statCode '5N47tF70' \
    --userId 'bL4drrdl' \
    --body '{"inc": 0.19157283526714963}' \
    > test.out 2>&1
eval_tap $? 86 'PublicIncUserStatItemValue' test.out

#- 87 ResetUserStatItemValue1
./ng net.accelbyte.sdk.cli.Main social resetUserStatItemValue1 \
    --namespace "$AB_NAMESPACE" \
    --statCode 'Mk5LsjYj' \
    --userId '22P5EoRt' \
    > test.out 2>&1
eval_tap $? 87 'ResetUserStatItemValue1' test.out

#- 88 BulkUpdateUserStatItemV2
./ng net.accelbyte.sdk.cli.Main social bulkUpdateUserStatItemV2 \
    --namespace "$AB_NAMESPACE" \
    --body '[{"additionalData": {"xgW9ydC9": {}, "YW8L2y4t": {}, "4GQyX367": {}}, "additionalKey": "W5YIrQzd", "statCode": "AbMA8Xf8", "updateStrategy": "INCREMENT", "userId": "J0nAfl1h", "value": 0.4211831013206375}, {"additionalData": {"OQHB3RZB": {}, "WUmJGLAr": {}, "xFwnTDCR": {}}, "additionalKey": "DqEdgGwG", "statCode": "PwbldPe9", "updateStrategy": "INCREMENT", "userId": "nT3ol7NL", "value": 0.39811937491671134}, {"additionalData": {"Dkiilbq6": {}, "CUZJEc8y": {}, "wZRQMp2g": {}}, "additionalKey": "AyzteeuY", "statCode": "6PsbWiBA", "updateStrategy": "INCREMENT", "userId": "BQ562mOo", "value": 0.24681870059572253}]' \
    > test.out 2>&1
eval_tap $? 88 'BulkUpdateUserStatItemV2' test.out

#- 89 BulkFetchOrDefaultStatItems1
./ng net.accelbyte.sdk.cli.Main social bulkFetchOrDefaultStatItems1 \
    --namespace "$AB_NAMESPACE" \
    --additionalKey 'fwQeJVww' \
    --statCode 'qIFcghXC' \
    --userIds '0joae4Gn,7usHNx2O,CNy1IOnn' \
    > test.out 2>&1
eval_tap $? 89 'BulkFetchOrDefaultStatItems1' test.out

#- 90 AdminListUsersStatItems
./ng net.accelbyte.sdk.cli.Main social adminListUsersStatItems \
    --namespace "$AB_NAMESPACE" \
    --userId 'q7gdeSyu' \
    --additionalKey '3DkQXidQ' \
    --statCodes 'N0vpIxaN,fTxRm25H,RqpPlBXf' \
    --tags 'AzYfJEaN,0xDdVBCG,Wca7W7KA' \
    > test.out 2>&1
eval_tap $? 90 'AdminListUsersStatItems' test.out

#- 91 BulkUpdateUserStatItem
./ng net.accelbyte.sdk.cli.Main social bulkUpdateUserStatItem \
    --namespace "$AB_NAMESPACE" \
    --userId '0nryxIIF' \
    --additionalKey 'vta5ewpz' \
    --body '[{"additionalData": {"DBD95Wa9": {}, "igWpta91": {}, "fLTEgEEn": {}}, "statCode": "TPZsslFs", "updateStrategy": "INCREMENT", "value": 0.5392189379646072}, {"additionalData": {"zUtTWI5A": {}, "2QRLgEU1": {}, "cyafHrTm": {}}, "statCode": "VueisACQ", "updateStrategy": "MIN", "value": 0.8676609469672643}, {"additionalData": {"pJ9B9xxN": {}, "EiBo8Me7": {}, "7LCuuEMb": {}}, "statCode": "qo9cVppf", "updateStrategy": "MIN", "value": 0.24061686260739235}]' \
    > test.out 2>&1
eval_tap $? 91 'BulkUpdateUserStatItem' test.out

#- 92 BulkGetOrDefaultByUserId
./ng net.accelbyte.sdk.cli.Main social bulkGetOrDefaultByUserId \
    --namespace "$AB_NAMESPACE" \
    --userId 'oWMs9ByR' \
    --additionalKey 'MpBOrySJ' \
    --body '{"statCodes": ["OxINXBaC", "HWhkxAzn", "IbHrgwq2"]}' \
    > test.out 2>&1
eval_tap $? 92 'BulkGetOrDefaultByUserId' test.out

#- 93 BulkResetUserStatItemValues
./ng net.accelbyte.sdk.cli.Main social bulkResetUserStatItemValues \
    --namespace "$AB_NAMESPACE" \
    --userId '7QAxD7oM' \
    --additionalKey 'Wil4MK5G' \
    --body '[{"additionalData": {"pfrV8uYv": {}, "lxzF8p17": {}, "hGkbeDYc": {}}, "statCode": "c9xC1dpy"}, {"additionalData": {"wqov5ch9": {}, "wBX2Qhbq": {}, "jOeBod6L": {}}, "statCode": "RtnjfV0A"}, {"additionalData": {"fBdTZoaY": {}, "kU1hyi3z": {}, "xLjctUM5": {}}, "statCode": "8NUEdGWy"}]' \
    > test.out 2>&1
eval_tap $? 93 'BulkResetUserStatItemValues' test.out

#- 94 DeleteUserStatItems2
./ng net.accelbyte.sdk.cli.Main social deleteUserStatItems2 \
    --namespace "$AB_NAMESPACE" \
    --statCode 'eIT0DrS5' \
    --userId 'vBCfJLlG' \
    --additionalKey 'a2LeAql0' \
    > test.out 2>&1
eval_tap $? 94 'DeleteUserStatItems2' test.out

#- 95 UpdateUserStatItemValue
./ng net.accelbyte.sdk.cli.Main social updateUserStatItemValue \
    --namespace "$AB_NAMESPACE" \
    --statCode 'oDZQ3O1F' \
    --userId 'gNvD0OW5' \
    --additionalKey 'TLZAiPDE' \
    --body '{"additionalData": {"aWTQVVME": {}, "TV83FFHv": {}, "d6BbFXQy": {}}, "updateStrategy": "MIN", "value": 0.2779781765987476}' \
    > test.out 2>&1
eval_tap $? 95 'UpdateUserStatItemValue' test.out

#- 96 BulkUpdateUserStatItem1
./ng net.accelbyte.sdk.cli.Main social bulkUpdateUserStatItem1 \
    --namespace "$AB_NAMESPACE" \
    --body '[{"additionalData": {"umDzIpGx": {}, "suxPg95P": {}, "epgWh5nD": {}}, "additionalKey": "i3jpD250", "statCode": "I0Z5wj7s", "updateStrategy": "MIN", "userId": "KY0W0buV", "value": 0.303599295694716}, {"additionalData": {"nUCrbxFY": {}, "uZvypLSK": {}, "NyVNdq60": {}}, "additionalKey": "iqxKZ0Ce", "statCode": "7yYSObQv", "updateStrategy": "OVERRIDE", "userId": "nGFd6vgE", "value": 0.4218011215427375}, {"additionalData": {"WuyHOhIV": {}, "4JoeHghw": {}, "GJVBM1m7": {}}, "additionalKey": "mpsbp9Bd", "statCode": "CId90e2s", "updateStrategy": "MAX", "userId": "enRmhGWg", "value": 0.9249707095399685}]' \
    > test.out 2>&1
eval_tap $? 96 'BulkUpdateUserStatItem1' test.out

#- 97 PublicQueryUserStatItems2
./ng net.accelbyte.sdk.cli.Main social publicQueryUserStatItems2 \
    --namespace "$AB_NAMESPACE" \
    --userId 'NvcpCIGO' \
    --additionalKey '5bRZorLl' \
    --statCodes 'RTs7Wf0U,oZwpFhPg,1JqIOrXR' \
    --tags 'OqFUxHFO,Vmcj19lX,za6XWHbr' \
    > test.out 2>&1
eval_tap $? 97 'PublicQueryUserStatItems2' test.out

#- 98 BulkUpdateUserStatItem2
./ng net.accelbyte.sdk.cli.Main social bulkUpdateUserStatItem2 \
    --namespace "$AB_NAMESPACE" \
    --userId 'LTXOyBsn' \
    --additionalKey 'AukKnoOd' \
    --body '[{"additionalData": {"Vq5RfiTH": {}, "ecCPp9BO": {}, "924Nqtf7": {}}, "statCode": "T9aQz9bi", "updateStrategy": "INCREMENT", "value": 0.8641616696968767}, {"additionalData": {"JDRHGrKR": {}, "cmp5P3r2": {}, "4qFYx3sy": {}}, "statCode": "VrvPY6zb", "updateStrategy": "MIN", "value": 0.46892295615630997}, {"additionalData": {"jXhawANJ": {}, "t8dWHS2F": {}, "u9Kw9aoB": {}}, "statCode": "6Vsb01z8", "updateStrategy": "MIN", "value": 0.8501739250305277}]' \
    > test.out 2>&1
eval_tap $? 98 'BulkUpdateUserStatItem2' test.out

#- 99 UpdateUserStatItemValue1
./ng net.accelbyte.sdk.cli.Main social updateUserStatItemValue1 \
    --namespace "$AB_NAMESPACE" \
    --statCode 'NdoWZFy7' \
    --userId 'oh2QGGC1' \
    --additionalKey '07fpGZL6' \
    --body '{"additionalData": {"jxyIAGuR": {}, "6LQzZwCr": {}, "E3B3E4HO": {}}, "updateStrategy": "MIN", "value": 0.24800576980347044}' \
    > test.out 2>&1
eval_tap $? 99 'UpdateUserStatItemValue1' test.out


rm -f "tmp.dat"

exit $EXIT_CODE