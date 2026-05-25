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
echo "1..100"

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
    --limit '97' \
    --offset '33' \
    --statCodes 'W8xNjRth' \
    > test.out 2>&1
eval_tap $? 26 'GetGlobalStatItems' test.out

#- 27 GetGlobalStatItemByStatCode
./ng net.accelbyte.sdk.cli.Main social getGlobalStatItemByStatCode \
    --namespace "$AB_NAMESPACE" \
    --statCode '4d5ZFWls' \
    > test.out 2>&1
eval_tap $? 27 'GetGlobalStatItemByStatCode' test.out

#- 28 GetStatCycles
./ng net.accelbyte.sdk.cli.Main social getStatCycles \
    --namespace "$AB_NAMESPACE" \
    --cycleType 'MONTHLY' \
    --limit '77' \
    --name 'Egv5hgPh' \
    --offset '49' \
    --sortBy 'xUGiFXBo' \
    --status 'ACTIVE' \
    > test.out 2>&1
eval_tap $? 28 'GetStatCycles' test.out

#- 29 CreateStatCycle
./ng net.accelbyte.sdk.cli.Main social createStatCycle \
    --namespace "$AB_NAMESPACE" \
    --body '{"cycleType": "SEASONAL", "description": "Jzjj9Vgi", "end": "1979-03-16T00:00:00Z", "id": "K4uU8lVH", "name": "usTuH9aV", "resetDate": 19, "resetDay": 99, "resetMonth": 39, "resetTime": "plkjQsBU", "seasonPeriod": 14, "start": "1979-08-12T00:00:00Z"}' \
    > test.out 2>&1
eval_tap $? 29 'CreateStatCycle' test.out

#- 30 BulkGetStatCycle
./ng net.accelbyte.sdk.cli.Main social bulkGetStatCycle \
    --namespace "$AB_NAMESPACE" \
    --body '{"cycleIds": ["5DQm97gl", "UDf1Jyh8", "0jgnhyMy"]}' \
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
    --cycleId 'THuuoPdM' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 33 'GetStatCycle' test.out

#- 34 UpdateStatCycle
./ng net.accelbyte.sdk.cli.Main social updateStatCycle \
    --cycleId '4RAflNQT' \
    --namespace "$AB_NAMESPACE" \
    --body '{"cycleType": "MONTHLY", "description": "uCnWjwdd", "end": "1988-04-01T00:00:00Z", "name": "wgxBEath", "resetDate": 63, "resetDay": 10, "resetMonth": 66, "resetTime": "mokMRl9D", "seasonPeriod": 75, "start": "1983-10-16T00:00:00Z"}' \
    > test.out 2>&1
eval_tap $? 34 'UpdateStatCycle' test.out

#- 35 DeleteStatCycle
./ng net.accelbyte.sdk.cli.Main social deleteStatCycle \
    --cycleId 'rqxlZWyw' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 35 'DeleteStatCycle' test.out

#- 36 ResetStatCycle
./ng net.accelbyte.sdk.cli.Main social resetStatCycle \
    --cycleId 'xScFXetG' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 36 'ResetStatCycle' test.out

#- 37 BulkAddStats
./ng net.accelbyte.sdk.cli.Main social bulkAddStats \
    --cycleId 'zZT3nF6R' \
    --namespace "$AB_NAMESPACE" \
    --body '{"statCodes": ["VO9lm9I0", "yQwDQzMN", "iK1AGcBd"]}' \
    > test.out 2>&1
eval_tap $? 37 'BulkAddStats' test.out

#- 38 StopStatCycle
./ng net.accelbyte.sdk.cli.Main social stopStatCycle \
    --cycleId '6jDPtXLz' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 38 'StopStatCycle' test.out

#- 39 BulkFetchStatItems
./ng net.accelbyte.sdk.cli.Main social bulkFetchStatItems \
    --namespace "$AB_NAMESPACE" \
    --statCode 'QJl4NZFx' \
    --userIds 'S80S9BvI' \
    > test.out 2>&1
eval_tap $? 39 'BulkFetchStatItems' test.out

#- 40 BulkIncUserStatItem
./ng net.accelbyte.sdk.cli.Main social bulkIncUserStatItem \
    --namespace "$AB_NAMESPACE" \
    --body '[{"inc": 0.016057179815117784, "statCode": "YyYmDfUG", "userId": "ThKV1Hhr"}, {"inc": 0.5321859665260255, "statCode": "elzODOEl", "userId": "dEIqrXLl"}, {"inc": 0.40368369556600403, "statCode": "CMt4dKuc", "userId": "MvniuTKQ"}]' \
    > test.out 2>&1
eval_tap $? 40 'BulkIncUserStatItem' test.out

#- 41 BulkIncUserStatItemValue
./ng net.accelbyte.sdk.cli.Main social bulkIncUserStatItemValue \
    --namespace "$AB_NAMESPACE" \
    --body '[{"inc": 0.3163374044607057, "statCode": "RJGJ4ov2", "userId": "gZ7Poe78"}, {"inc": 0.5511334733206478, "statCode": "ePqrMqOS", "userId": "w9fPQ5m8"}, {"inc": 0.7434783543147162, "statCode": "YGBMLQpd", "userId": "iQEpWd8E"}]' \
    > test.out 2>&1
eval_tap $? 41 'BulkIncUserStatItemValue' test.out

#- 42 BulkFetchOrDefaultStatItems
./ng net.accelbyte.sdk.cli.Main social bulkFetchOrDefaultStatItems \
    --namespace "$AB_NAMESPACE" \
    --statCode 'hbWTdiYS' \
    --userIds '3kicgSXR,Fy873PUl,eDpGnmwB' \
    > test.out 2>&1
eval_tap $? 42 'BulkFetchOrDefaultStatItems' test.out

#- 43 BulkResetUserStatItem
./ng net.accelbyte.sdk.cli.Main social bulkResetUserStatItem \
    --namespace "$AB_NAMESPACE" \
    --body '[{"statCode": "lE54fRBf", "userId": "Y1bBjijR"}, {"statCode": "y1EbQZ7f", "userId": "81RNZQ1B"}, {"statCode": "uHCwOWDE", "userId": "KEnptXq9"}]' \
    > test.out 2>&1
eval_tap $? 43 'BulkResetUserStatItem' test.out

#- 44 GetStats
./ng net.accelbyte.sdk.cli.Main social getStats \
    --namespace "$AB_NAMESPACE" \
    --cycleIds '2h8XT1D6' \
    --isGlobal  \
    --isPublic  \
    --limit '99' \
    --offset '94' \
    > test.out 2>&1
eval_tap $? 44 'GetStats' test.out

#- 45 CreateStat
./ng net.accelbyte.sdk.cli.Main social createStat \
    --namespace "$AB_NAMESPACE" \
    --body '{"capCycleOverride": false, "cycleIds": ["TpLE09Uk", "tSX7p9QT", "VXuPgWqv"], "cycleOverrides": [{"cycleId": "WlMiiedJ", "maximum": 0.10963351034549884, "minimum": 0.9911119748603967}, {"cycleId": "4ZyFDzVL", "maximum": 0.47550006050658455, "minimum": 0.3824739059276654}, {"cycleId": "9iNrhKmx", "maximum": 0.6107314499100042, "minimum": 0.8622740712948737}], "defaultValue": 0.1668122310564768, "description": "VqyHK36G", "globalAggregationMethod": "LAST", "ignoreAdditionalDataOnValueRejected": false, "incrementOnly": true, "isPublic": true, "maximum": 0.6522320754164909, "minimum": 0.03705652883036692, "name": "o1on9y7A", "setAsGlobal": false, "setBy": "CLIENT", "statCode": "oXNn9wgz", "tags": ["UESN2nBa", "jgQpSVs2", "glPum9ik"], "visibility": "SHOWALL"}' \
    > test.out 2>&1
eval_tap $? 45 'CreateStat' test.out

#- 46 ExportStats
./ng net.accelbyte.sdk.cli.Main social exportStats \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 46 'ExportStats' test.out

#- 47 ImportStats
./ng net.accelbyte.sdk.cli.Main social importStats \
    --namespace "$AB_NAMESPACE" \
    --replaceExisting  \
    --file 'tmp.dat' \
    > test.out 2>&1
eval_tap $? 47 'ImportStats' test.out

#- 48 QueryStats
./ng net.accelbyte.sdk.cli.Main social queryStats \
    --namespace "$AB_NAMESPACE" \
    --isGlobal  \
    --isPublic  \
    --limit '81' \
    --offset '32' \
    --keyword 'hbndybBi' \
    > test.out 2>&1
eval_tap $? 48 'QueryStats' test.out

#- 49 GetStat
./ng net.accelbyte.sdk.cli.Main social getStat \
    --namespace "$AB_NAMESPACE" \
    --statCode '3chv6H99' \
    > test.out 2>&1
eval_tap $? 49 'GetStat' test.out

#- 50 DeleteStat
./ng net.accelbyte.sdk.cli.Main social deleteStat \
    --namespace "$AB_NAMESPACE" \
    --statCode 'gNTN1yVk' \
    > test.out 2>&1
eval_tap $? 50 'DeleteStat' test.out

#- 51 UpdateStat
./ng net.accelbyte.sdk.cli.Main social updateStat \
    --namespace "$AB_NAMESPACE" \
    --statCode 'Q9x1P4pH' \
    --body '{"capCycleOverride": false, "cycleIds": ["qEbka8Ul", "NgGdRbGD", "Qq2vCSsb"], "cycleOverrides": [{"cycleId": "eoyJkU6z", "maximum": 0.5195515828527879, "minimum": 0.9947391608639007}, {"cycleId": "98yboOg3", "maximum": 0.7327164283621784, "minimum": 0.9686369111641551}, {"cycleId": "umvUkYyD", "maximum": 0.9264989433587509, "minimum": 0.2806687300854749}], "defaultValue": 0.35663165636135485, "description": "aiCsr0xy", "globalAggregationMethod": "LAST", "ignoreAdditionalDataOnValueRejected": false, "incrementOnly": true, "isPublic": true, "maximum": 0.07764888224378574, "minimum": 0.6642471174741822, "name": "GBqzh6XA", "setAsGlobal": true, "setBy": "CLIENT", "tags": ["yIiFFV59", "IYHUoMUS", "RKNBX0i8"], "visibility": "SERVERONLY"}' \
    > test.out 2>&1
eval_tap $? 51 'UpdateStat' test.out

#- 52 GetStatItems
./ng net.accelbyte.sdk.cli.Main social getStatItems \
    --namespace "$AB_NAMESPACE" \
    --statCode 'N3F3gSQf' \
    --limit '2' \
    --offset '70' \
    --sortBy '8ypUw4Fa' \
    > test.out 2>&1
eval_tap $? 52 'GetStatItems' test.out

#- 53 DeleteTiedStat
./ng net.accelbyte.sdk.cli.Main social deleteTiedStat \
    --namespace "$AB_NAMESPACE" \
    --statCode 'vJnSHWev' \
    > test.out 2>&1
eval_tap $? 53 'DeleteTiedStat' test.out

#- 54 GetUserStatCycleItems
./ng net.accelbyte.sdk.cli.Main social getUserStatCycleItems \
    --cycleId 'lntSgh8s' \
    --namespace "$AB_NAMESPACE" \
    --userId '8WvZGVc4' \
    --isPublic  \
    --limit '6' \
    --offset '38' \
    --sortBy 'dJsSNlgw' \
    --statCodes 'IqKXaNGd' \
    > test.out 2>&1
eval_tap $? 54 'GetUserStatCycleItems' test.out

#- 55 GetUserStatItems
./ng net.accelbyte.sdk.cli.Main social getUserStatItems \
    --namespace "$AB_NAMESPACE" \
    --userId 'YUgAjAeZ' \
    --isPublic  \
    --limit '85' \
    --offset '90' \
    --sortBy 'dl0nnUgr' \
    --statCodes 'FaHFwIAS' \
    --tags 'p9stOHlE' \
    > test.out 2>&1
eval_tap $? 55 'GetUserStatItems' test.out

#- 56 BulkCreateUserStatItems
./ng net.accelbyte.sdk.cli.Main social bulkCreateUserStatItems \
    --namespace "$AB_NAMESPACE" \
    --userId 'eeLBQyT3' \
    --body '[{"statCode": "WMdKf4XL"}, {"statCode": "W3sMy1M1"}, {"statCode": "NFgP1Y73"}]' \
    > test.out 2>&1
eval_tap $? 56 'BulkCreateUserStatItems' test.out

#- 57 BulkIncUserStatItem1
./ng net.accelbyte.sdk.cli.Main social bulkIncUserStatItem1 \
    --namespace "$AB_NAMESPACE" \
    --userId '3WUsnzSc' \
    --body '[{"inc": 0.7117383533547532, "statCode": "wfThPyXT"}, {"inc": 0.47489444745566656, "statCode": "oU80Umbw"}, {"inc": 0.9827258119279934, "statCode": "50TE4jPm"}]' \
    > test.out 2>&1
eval_tap $? 57 'BulkIncUserStatItem1' test.out

#- 58 BulkIncUserStatItemValue1
./ng net.accelbyte.sdk.cli.Main social bulkIncUserStatItemValue1 \
    --namespace "$AB_NAMESPACE" \
    --userId '0PDU4oG3' \
    --body '[{"inc": 0.257029983224041, "statCode": "tLeKqA5L"}, {"inc": 0.575136282602124, "statCode": "5lDWH5yt"}, {"inc": 0.880960420036622, "statCode": "ZMlNp2Zp"}]' \
    > test.out 2>&1
eval_tap $? 58 'BulkIncUserStatItemValue1' test.out

#- 59 BulkResetUserStatItem1
./ng net.accelbyte.sdk.cli.Main social bulkResetUserStatItem1 \
    --namespace "$AB_NAMESPACE" \
    --userId 'ZFIqBWx4' \
    --body '[{"statCode": "ymimGC3d"}, {"statCode": "Qh2V8HHe"}, {"statCode": "teAMf0Yz"}]' \
    > test.out 2>&1
eval_tap $? 59 'BulkResetUserStatItem1' test.out

#- 60 CreateUserStatItem
./ng net.accelbyte.sdk.cli.Main social createUserStatItem \
    --namespace "$AB_NAMESPACE" \
    --statCode '77aC1mnH' \
    --userId 'H3FPQfBu' \
    > test.out 2>&1
eval_tap $? 60 'CreateUserStatItem' test.out

#- 61 DeleteUserStatItems
./ng net.accelbyte.sdk.cli.Main social deleteUserStatItems \
    --namespace "$AB_NAMESPACE" \
    --statCode 'UONBBMah' \
    --userId 'Ff84BSfL' \
    > test.out 2>&1
eval_tap $? 61 'DeleteUserStatItems' test.out

#- 62 IncUserStatItemValue
./ng net.accelbyte.sdk.cli.Main social incUserStatItemValue \
    --namespace "$AB_NAMESPACE" \
    --statCode 'aGnJxEyi' \
    --userId 'L2Zmq52X' \
    --body '{"inc": 0.7713339604922884}' \
    > test.out 2>&1
eval_tap $? 62 'IncUserStatItemValue' test.out

#- 63 ResetUserStatItemValue
./ng net.accelbyte.sdk.cli.Main social resetUserStatItemValue \
    --namespace "$AB_NAMESPACE" \
    --statCode '8THl8z0e' \
    --userId 'UlTID4nn' \
    --additionalKey 'QTRsZAXc' \
    --body '{"additionalData": {"uOgVQXIs": {}, "YgckbuZA": {}, "crisniES": {}}}' \
    > test.out 2>&1
eval_tap $? 63 'ResetUserStatItemValue' test.out

#- 64 GetGlobalStatItems1
./ng net.accelbyte.sdk.cli.Main social getGlobalStatItems1 \
    --namespace "$AB_NAMESPACE" \
    --limit '18' \
    --offset '43' \
    --statCodes 'MEtBjDpe' \
    > test.out 2>&1
eval_tap $? 64 'GetGlobalStatItems1' test.out

#- 65 GetGlobalStatItemByStatCode1
./ng net.accelbyte.sdk.cli.Main social getGlobalStatItemByStatCode1 \
    --namespace "$AB_NAMESPACE" \
    --statCode 'XBuTF5it' \
    > test.out 2>&1
eval_tap $? 65 'GetGlobalStatItemByStatCode1' test.out

#- 66 GetStatCycles1
./ng net.accelbyte.sdk.cli.Main social getStatCycles1 \
    --namespace "$AB_NAMESPACE" \
    --cycleType 'WEEKLY' \
    --limit '37' \
    --name 'b3vkiX6r' \
    --offset '79' \
    --sortBy 'B24O88jS' \
    --status 'ACTIVE' \
    > test.out 2>&1
eval_tap $? 66 'GetStatCycles1' test.out

#- 67 BulkGetStatCycle1
./ng net.accelbyte.sdk.cli.Main social bulkGetStatCycle1 \
    --namespace "$AB_NAMESPACE" \
    --body '{"cycleIds": ["3tzT8u87", "Qp5fJeHk", "YXyzHFOY"]}' \
    > test.out 2>&1
eval_tap $? 67 'BulkGetStatCycle1' test.out

#- 68 GetStatCycle1
./ng net.accelbyte.sdk.cli.Main social getStatCycle1 \
    --cycleId 'gh1Ag6VI' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 68 'GetStatCycle1' test.out

#- 69 BulkFetchStatItems1
./ng net.accelbyte.sdk.cli.Main social bulkFetchStatItems1 \
    --namespace "$AB_NAMESPACE" \
    --statCode 'MaAKJGpZ' \
    --userIds 'dNFbUq1A' \
    > test.out 2>&1
eval_tap $? 69 'BulkFetchStatItems1' test.out

#- 70 PublicBulkIncUserStatItem
./ng net.accelbyte.sdk.cli.Main social publicBulkIncUserStatItem \
    --namespace "$AB_NAMESPACE" \
    --body '[{"inc": 0.1072823497179961, "statCode": "LsSU8KG7", "userId": "EdX1OsQ9"}, {"inc": 0.27504486224992486, "statCode": "eVuYG7PX", "userId": "ekMReaMt"}, {"inc": 0.45652173255135053, "statCode": "zUOF20Cd", "userId": "rICfi4Go"}]' \
    > test.out 2>&1
eval_tap $? 70 'PublicBulkIncUserStatItem' test.out

#- 71 PublicBulkIncUserStatItemValue
./ng net.accelbyte.sdk.cli.Main social publicBulkIncUserStatItemValue \
    --namespace "$AB_NAMESPACE" \
    --body '[{"inc": 0.06406689744374194, "statCode": "7AUWElNH", "userId": "MM7ZAT2u"}, {"inc": 0.952470171557003, "statCode": "EjfCpx6B", "userId": "hT2VqYJm"}, {"inc": 0.4340922667192174, "statCode": "wVJnAAwS", "userId": "N8wL9Xok"}]' \
    > test.out 2>&1
eval_tap $? 71 'PublicBulkIncUserStatItemValue' test.out

#- 72 BulkResetUserStatItem2
./ng net.accelbyte.sdk.cli.Main social bulkResetUserStatItem2 \
    --namespace "$AB_NAMESPACE" \
    --body '[{"statCode": "C6ZoMDVN", "userId": "mVtEwzrC"}, {"statCode": "HLKAGMVZ", "userId": "hnN3t4T9"}, {"statCode": "qATpDWot", "userId": "3Ge0SQSr"}]' \
    > test.out 2>&1
eval_tap $? 72 'BulkResetUserStatItem2' test.out

#- 73 CreateStat1
./ng net.accelbyte.sdk.cli.Main social createStat1 \
    --namespace "$AB_NAMESPACE" \
    --body '{"capCycleOverride": true, "cycleIds": ["7lRXrqGQ", "pg8jRI0z", "TX0rcbyG"], "cycleOverrides": [{"cycleId": "06JkxwHC", "maximum": 0.0253595583788796, "minimum": 0.5376979286321902}, {"cycleId": "Y9JdM3II", "maximum": 0.7676452012696887, "minimum": 0.525665320462787}, {"cycleId": "k6neRKSC", "maximum": 0.534287372870478, "minimum": 0.6343944552688874}], "defaultValue": 0.6220772120191292, "description": "hwQxo4aT", "globalAggregationMethod": "TOTAL", "ignoreAdditionalDataOnValueRejected": true, "incrementOnly": false, "isPublic": false, "maximum": 0.7780596872309266, "minimum": 0.8780151755231628, "name": "jaBI1eDi", "setAsGlobal": true, "setBy": "SERVER", "statCode": "mifYyu7k", "tags": ["TXoi0ENK", "M7Q4LxuC", "HhzQoiB7"], "visibility": "SERVERONLY"}' \
    > test.out 2>&1
eval_tap $? 73 'CreateStat1' test.out

#- 74 PublicListMyStatCycleItems
./ng net.accelbyte.sdk.cli.Main social publicListMyStatCycleItems \
    --cycleId 'CvYTxTgT' \
    --namespace "$AB_NAMESPACE" \
    --limit '27' \
    --offset '20' \
    --sortBy 'Bx21SCoL' \
    --statCodes 'm41d390G,h3oPegnH,7Dk76nzC' \
    > test.out 2>&1
eval_tap $? 74 'PublicListMyStatCycleItems' test.out

#- 75 PublicListMyStatItems
./ng net.accelbyte.sdk.cli.Main social publicListMyStatItems \
    --namespace "$AB_NAMESPACE" \
    --limit '29' \
    --offset '11' \
    --sortBy 'LUaMoYBF' \
    --statCodes 'pPUyK4jk,m8ERIGZC,qoMqZFEM' \
    --tags 'dm49tdsI,E1aLItfz,ApUtM4HU' \
    > test.out 2>&1
eval_tap $? 75 'PublicListMyStatItems' test.out

#- 76 PublicListAllMyStatItems
./ng net.accelbyte.sdk.cli.Main social publicListAllMyStatItems \
    --namespace "$AB_NAMESPACE" \
    --additionalKey 'HYolf2MO' \
    --statCodes 'JrkdSNfS,U5OkOEFd,ZgDPnhNl' \
    --tags 'NEcaWhGl,CzzYjhVW,oJz3qdeP' \
    > test.out 2>&1
eval_tap $? 76 'PublicListAllMyStatItems' test.out

#- 77 GetUserStatCycleItems1
./ng net.accelbyte.sdk.cli.Main social getUserStatCycleItems1 \
    --cycleId 'MOpOBEDe' \
    --namespace "$AB_NAMESPACE" \
    --userId 'HrOodoGi' \
    --limit '45' \
    --offset '68' \
    --sortBy '6GTPLwni' \
    --statCodes '1qePdI3m' \
    > test.out 2>&1
eval_tap $? 77 'GetUserStatCycleItems1' test.out

#- 78 PublicQueryUserStatItems1
./ng net.accelbyte.sdk.cli.Main social publicQueryUserStatItems1 \
    --namespace "$AB_NAMESPACE" \
    --userId 'xd5XEBVi' \
    --limit '42' \
    --offset '30' \
    --sortBy 'JdwV7U3n' \
    --statCodes 'DZQynBbm' \
    --tags 'zmFmgYEY' \
    > test.out 2>&1
eval_tap $? 78 'PublicQueryUserStatItems1' test.out

#- 79 PublicBulkCreateUserStatItems
./ng net.accelbyte.sdk.cli.Main social publicBulkCreateUserStatItems \
    --namespace "$AB_NAMESPACE" \
    --userId 'UMJoIXdR' \
    --body '[{"statCode": "NPAhgniP"}, {"statCode": "mD8LU28r"}, {"statCode": "fiAvKU2U"}]' \
    > test.out 2>&1
eval_tap $? 79 'PublicBulkCreateUserStatItems' test.out

#- 80 PublicQueryUserStatItems
./ng net.accelbyte.sdk.cli.Main social publicQueryUserStatItems \
    --namespace "$AB_NAMESPACE" \
    --userId 'vXbJFNYr' \
    --additionalKey 'RBT48jM0' \
    --statCodes 'h0GZuET4,9ecfNL5F,Gc7pwsb6' \
    --tags 'vR40JaLD,FUpl1Pq6,SPdwVOtm' \
    > test.out 2>&1
eval_tap $? 80 'PublicQueryUserStatItems' test.out

#- 81 PublicBulkIncUserStatItem1
./ng net.accelbyte.sdk.cli.Main social publicBulkIncUserStatItem1 \
    --namespace "$AB_NAMESPACE" \
    --userId '0TGWsy0E' \
    --body '[{"inc": 0.21428269453454962, "statCode": "dkHfEu3O"}, {"inc": 0.6727783129802463, "statCode": "foyRXKAB"}, {"inc": 0.7950044300279911, "statCode": "TQbVlpyx"}]' \
    > test.out 2>&1
eval_tap $? 81 'PublicBulkIncUserStatItem1' test.out

#- 82 BulkIncUserStatItemValue2
./ng net.accelbyte.sdk.cli.Main social bulkIncUserStatItemValue2 \
    --namespace "$AB_NAMESPACE" \
    --userId 'tUXATE9w' \
    --body '[{"inc": 0.6506754971302633, "statCode": "ePmEB22L"}, {"inc": 0.3255709047725621, "statCode": "QxcxSpv4"}, {"inc": 0.9763086945446392, "statCode": "h7WTS69t"}]' \
    > test.out 2>&1
eval_tap $? 82 'BulkIncUserStatItemValue2' test.out

#- 83 BulkResetUserStatItem3
./ng net.accelbyte.sdk.cli.Main social bulkResetUserStatItem3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'xuv7iXV8' \
    --body '[{"statCode": "wK0TBmJE"}, {"statCode": "JMcmSWRC"}, {"statCode": "sIIJ4u9o"}]' \
    > test.out 2>&1
eval_tap $? 83 'BulkResetUserStatItem3' test.out

#- 84 PublicCreateUserStatItem
./ng net.accelbyte.sdk.cli.Main social publicCreateUserStatItem \
    --namespace "$AB_NAMESPACE" \
    --statCode 'J0HvafkI' \
    --userId 'zdLgsXR2' \
    > test.out 2>&1
eval_tap $? 84 'PublicCreateUserStatItem' test.out

#- 85 DeleteUserStatItems1
./ng net.accelbyte.sdk.cli.Main social deleteUserStatItems1 \
    --namespace "$AB_NAMESPACE" \
    --statCode 'rty22LfK' \
    --userId 'Ve9jJ67T' \
    > test.out 2>&1
eval_tap $? 85 'DeleteUserStatItems1' test.out

#- 86 PublicIncUserStatItem
./ng net.accelbyte.sdk.cli.Main social publicIncUserStatItem \
    --namespace "$AB_NAMESPACE" \
    --statCode 'jvdAFxc5' \
    --userId 'fwMvUyDU' \
    --body '{"inc": 0.19344289340872423}' \
    > test.out 2>&1
eval_tap $? 86 'PublicIncUserStatItem' test.out

#- 87 PublicIncUserStatItemValue
./ng net.accelbyte.sdk.cli.Main social publicIncUserStatItemValue \
    --namespace "$AB_NAMESPACE" \
    --statCode 'Itg9FxB7' \
    --userId '758rkCFy' \
    --body '{"inc": 0.05401500830628736}' \
    > test.out 2>&1
eval_tap $? 87 'PublicIncUserStatItemValue' test.out

#- 88 ResetUserStatItemValue1
./ng net.accelbyte.sdk.cli.Main social resetUserStatItemValue1 \
    --namespace "$AB_NAMESPACE" \
    --statCode '3nboXoDx' \
    --userId 'fBLqHgxi' \
    > test.out 2>&1
eval_tap $? 88 'ResetUserStatItemValue1' test.out

#- 89 BulkUpdateUserStatItemV2
./ng net.accelbyte.sdk.cli.Main social bulkUpdateUserStatItemV2 \
    --namespace "$AB_NAMESPACE" \
    --body '[{"additionalData": {"wrC8eRaW": {}, "gjLTk8nf": {}, "AL3KfYfU": {}}, "additionalKey": "H9iKeKKR", "requestId": "qfGOf8tP", "statCode": "WJqbI6zX", "updateStrategy": "MIN", "userId": "CU6ZgECV", "value": 0.3510121337978599}, {"additionalData": {"GhUlyiXi": {}, "y7uRVhQf": {}, "TAkaduES": {}}, "additionalKey": "iInCDXqK", "requestId": "tqcM0gR7", "statCode": "ke81aNtH", "updateStrategy": "MIN", "userId": "j37dGKoN", "value": 0.6116062213601171}, {"additionalData": {"tshmMIiy": {}, "ns1mfKQI": {}, "vrKqu4bx": {}}, "additionalKey": "PtYTcoMZ", "requestId": "Oe4oYRpy", "statCode": "1wiKTnoU", "updateStrategy": "MAX", "userId": "3ygSkkJz", "value": 0.7578276146400567}]' \
    > test.out 2>&1
eval_tap $? 89 'BulkUpdateUserStatItemV2' test.out

#- 90 BulkFetchOrDefaultStatItems1
./ng net.accelbyte.sdk.cli.Main social bulkFetchOrDefaultStatItems1 \
    --namespace "$AB_NAMESPACE" \
    --additionalKey 'xuYxMSOb' \
    --statCode '0Z2G855A' \
    --userIds 'cXc9j3O3,rGZ0g8vz,s11Vs75Q' \
    > test.out 2>&1
eval_tap $? 90 'BulkFetchOrDefaultStatItems1' test.out

#- 91 AdminListUsersStatItems
./ng net.accelbyte.sdk.cli.Main social adminListUsersStatItems \
    --namespace "$AB_NAMESPACE" \
    --userId 'FmBLSwkH' \
    --additionalKey 'tZsh4vTT' \
    --statCodes 'NkY6uqbw,Ri1dB57q,rLTL2CsZ' \
    --tags 'rsKe2s8b,uUBdGHWd,aiiMtLK7' \
    > test.out 2>&1
eval_tap $? 91 'AdminListUsersStatItems' test.out

#- 92 BulkUpdateUserStatItem
./ng net.accelbyte.sdk.cli.Main social bulkUpdateUserStatItem \
    --namespace "$AB_NAMESPACE" \
    --userId 'x4Axoub0' \
    --additionalKey 'KczhiTfd' \
    --body '[{"additionalData": {"J0FO87Oy": {}, "MUMWEhRW": {}, "O5IdDjzM": {}}, "requestId": "ZcftDlWu", "statCode": "N5xfAhib", "updateStrategy": "OVERRIDE", "value": 0.38149153760211973}, {"additionalData": {"y2DXAYlN": {}, "cTnVTjaR": {}, "ba1dkfcL": {}}, "requestId": "ZjL1C35s", "statCode": "Ep1ClSlE", "updateStrategy": "MAX", "value": 0.09766212571621113}, {"additionalData": {"87W2Aivu": {}, "RZHQTLTw": {}, "Bk0iJWdG": {}}, "requestId": "bblmfJ2t", "statCode": "yB8OV5sY", "updateStrategy": "INCREMENT", "value": 0.6806038670380917}]' \
    > test.out 2>&1
eval_tap $? 92 'BulkUpdateUserStatItem' test.out

#- 93 BulkGetOrDefaultByUserId
./ng net.accelbyte.sdk.cli.Main social bulkGetOrDefaultByUserId \
    --namespace "$AB_NAMESPACE" \
    --userId 'cR2qGur0' \
    --additionalKey 'zswgBbi8' \
    --body '{"statCodes": ["bWo5pYXz", "l729eVKo", "RRZm988U"]}' \
    > test.out 2>&1
eval_tap $? 93 'BulkGetOrDefaultByUserId' test.out

#- 94 BulkResetUserStatItemValues
./ng net.accelbyte.sdk.cli.Main social bulkResetUserStatItemValues \
    --namespace "$AB_NAMESPACE" \
    --userId 'Eu8F2mP6' \
    --additionalKey '13ux6KTD' \
    --body '[{"additionalData": {"WyvadFtl": {}, "w9GMBZie": {}, "gNXYSeug": {}}, "statCode": "lRPQZsvm"}, {"additionalData": {"5KjjV7ox": {}, "NBTKsQ4f": {}, "WiKAwnQh": {}}, "statCode": "ANRu8JCk"}, {"additionalData": {"X0OfV21k": {}, "4PxVhO9K": {}, "qv8LY0tm": {}}, "statCode": "yX9Myyrf"}]' \
    > test.out 2>&1
eval_tap $? 94 'BulkResetUserStatItemValues' test.out

#- 95 DeleteUserStatItems2
./ng net.accelbyte.sdk.cli.Main social deleteUserStatItems2 \
    --namespace "$AB_NAMESPACE" \
    --statCode 'y7XL5Xui' \
    --userId 'XImeg2hw' \
    --additionalKey 'KTeuLMa5' \
    > test.out 2>&1
eval_tap $? 95 'DeleteUserStatItems2' test.out

#- 96 UpdateUserStatItemValue
./ng net.accelbyte.sdk.cli.Main social updateUserStatItemValue \
    --namespace "$AB_NAMESPACE" \
    --statCode 'TG8sCbGQ' \
    --userId 'z2A8Kx8r' \
    --additionalKey 'FAuGEVkj' \
    --body '{"additionalData": {"MUU3l7JY": {}, "vholf2yM": {}, "4YObbplr": {}}, "updateStrategy": "INCREMENT", "value": 0.6450138979734273}' \
    > test.out 2>&1
eval_tap $? 96 'UpdateUserStatItemValue' test.out

#- 97 BulkUpdateUserStatItem1
./ng net.accelbyte.sdk.cli.Main social bulkUpdateUserStatItem1 \
    --namespace "$AB_NAMESPACE" \
    --body '[{"additionalData": {"6KQVQHnM": {}, "SkaCko0E": {}, "CMNKUkWY": {}}, "additionalKey": "PIhDKa3a", "requestId": "NcUR1Pq4", "statCode": "xH2JtAMF", "updateStrategy": "MAX", "userId": "sWOoJ50N", "value": 0.005952962211930646}, {"additionalData": {"m1Xe8MwF": {}, "XVHKvNGs": {}, "t8jKhOm8": {}}, "additionalKey": "SfKUaydS", "requestId": "bbST2fYU", "statCode": "0uE3reRJ", "updateStrategy": "MIN", "userId": "pkVOVwwS", "value": 0.02332976387918617}, {"additionalData": {"eae1QKbd": {}, "ggLVMP5j": {}, "VHy0CAu0": {}}, "additionalKey": "OzMHSuIY", "requestId": "vA9bn9nt", "statCode": "44eOU56j", "updateStrategy": "OVERRIDE", "userId": "LLMYoCqg", "value": 0.21645849954414187}]' \
    > test.out 2>&1
eval_tap $? 97 'BulkUpdateUserStatItem1' test.out

#- 98 PublicQueryUserStatItems2
./ng net.accelbyte.sdk.cli.Main social publicQueryUserStatItems2 \
    --namespace "$AB_NAMESPACE" \
    --userId 'YS3Vv38A' \
    --additionalKey 'Vv2hZWwH' \
    --statCodes 'hawFvecN,ioZYhGjm,KuKnXjs4' \
    --tags 'bEhnmqyp,qFcmN9nt,WZezUAc9' \
    > test.out 2>&1
eval_tap $? 98 'PublicQueryUserStatItems2' test.out

#- 99 BulkUpdateUserStatItem2
./ng net.accelbyte.sdk.cli.Main social bulkUpdateUserStatItem2 \
    --namespace "$AB_NAMESPACE" \
    --userId 'BdFvz7rE' \
    --additionalKey 'tJZSr3Q9' \
    --body '[{"additionalData": {"BB50qVCy": {}, "WaysPMiN": {}, "aDSMsEky": {}}, "requestId": "18NbFLh6", "statCode": "vRbRoR6w", "updateStrategy": "MIN", "value": 0.9527092227815294}, {"additionalData": {"b90g8JOW": {}, "OVUMVqld": {}, "QWCJnqxb": {}}, "requestId": "BQOh30fv", "statCode": "lVE3V7Qs", "updateStrategy": "INCREMENT", "value": 0.4481977573339393}, {"additionalData": {"IqVkH63z": {}, "cesnioqk": {}, "5FUL6OiO": {}}, "requestId": "5i9wPWVy", "statCode": "24ARf8lN", "updateStrategy": "MIN", "value": 0.33528186082367095}]' \
    > test.out 2>&1
eval_tap $? 99 'BulkUpdateUserStatItem2' test.out

#- 100 UpdateUserStatItemValue1
./ng net.accelbyte.sdk.cli.Main social updateUserStatItemValue1 \
    --namespace "$AB_NAMESPACE" \
    --statCode '6nK2dFr5' \
    --userId 'sKO6S4BQ' \
    --additionalKey 'cUcmaUz2' \
    --body '{"additionalData": {"DKC0eGgf": {}, "s3PoUrpx": {}, "U5hPoIS8": {}}, "updateStrategy": "MIN", "value": 0.5050110852830049}' \
    > test.out 2>&1
eval_tap $? 100 'UpdateUserStatItemValue1' test.out


rm -f "tmp.dat"

exit $EXIT_CODE