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
    --userId 'QBYYdcr3' \
    > test.out 2>&1
eval_tap $? 8 'GetUserProfiles' test.out

#- 9 GetProfile
./ng net.accelbyte.sdk.cli.Main social getProfile \
    --namespace "$AB_NAMESPACE" \
    --profileId 'UQyYv2BF' \
    --userId '0MI6Yx7d' \
    > test.out 2>&1
eval_tap $? 9 'GetProfile' test.out

#- 10 GetUserNamespaceSlots
eval_tap 0 10 'GetUserNamespaceSlots # SKIP deprecated' test.out

#- 11 GetSlotData
eval_tap 0 11 'GetSlotData # SKIP deprecated' test.out

#- 12 PublicGetUserGameProfiles
./ng net.accelbyte.sdk.cli.Main social publicGetUserGameProfiles \
    --namespace "$AB_NAMESPACE" \
    --userIds 'CPB3lyb3,GJdpFZc6,KRRKJjXY' \
    > test.out 2>&1
eval_tap $? 12 'PublicGetUserGameProfiles' test.out

#- 13 PublicGetUserProfiles
./ng net.accelbyte.sdk.cli.Main social publicGetUserProfiles \
    --namespace "$AB_NAMESPACE" \
    --userId 'RLrV2iY2' \
    > test.out 2>&1
eval_tap $? 13 'PublicGetUserProfiles' test.out

#- 14 PublicCreateProfile
./ng net.accelbyte.sdk.cli.Main social publicCreateProfile \
    --namespace "$AB_NAMESPACE" \
    --userId '71mRfNaA' \
    --body '{"achievements": ["dPIycmwK", "gPsVtYSs", "CzXzkuoV"], "attributes": {"I9o4WWHl": "EhbR7TCV", "KiS9za1X": "aq7jZsTV", "c0r4oTIU": "cGWodk8p"}, "avatarUrl": "tEeLDThh", "inventories": ["B8sOWhqk", "xiZmcxH9", "pywk645b"], "label": "efEWvWfE", "profileName": "nNkJEvdc", "statistics": ["O4i94kAl", "Wu7gQZxz", "oLYA0GtJ"], "tags": ["gwQ5r5D3", "dYiJUqjF", "wnCdPxRw"]}' \
    > test.out 2>&1
eval_tap $? 14 'PublicCreateProfile' test.out

#- 15 PublicGetProfile
./ng net.accelbyte.sdk.cli.Main social publicGetProfile \
    --namespace "$AB_NAMESPACE" \
    --profileId '8n8V2kX7' \
    --userId 'BW5ioV6Z' \
    > test.out 2>&1
eval_tap $? 15 'PublicGetProfile' test.out

#- 16 PublicUpdateProfile
./ng net.accelbyte.sdk.cli.Main social publicUpdateProfile \
    --namespace "$AB_NAMESPACE" \
    --profileId 'OY8khc2i' \
    --userId '0keu2I7a' \
    --body '{"achievements": ["vePzJYjc", "5dRICoMJ", "4aGZpYo4"], "attributes": {"peUb9YGx": "q6y4BUgu", "XBa5IqZp": "rttSWlqE", "8258QguE": "hWKjUwd8"}, "avatarUrl": "yveAn33K", "inventories": ["BY61UI52", "Ncj9eJnk", "HXLsdPBt"], "label": "hkAFUqtY", "profileName": "WahzfI3v", "statistics": ["8Ujqi0RX", "9RG2M539", "GOzq1lsq"], "tags": ["tIBKWLT5", "3ENJSaQN", "1ZePGegc"]}' \
    > test.out 2>&1
eval_tap $? 16 'PublicUpdateProfile' test.out

#- 17 PublicDeleteProfile
./ng net.accelbyte.sdk.cli.Main social publicDeleteProfile \
    --namespace "$AB_NAMESPACE" \
    --profileId 'RHQkwghI' \
    --userId 'yC85WxES' \
    > test.out 2>&1
eval_tap $? 17 'PublicDeleteProfile' test.out

#- 18 PublicGetProfileAttribute
./ng net.accelbyte.sdk.cli.Main social publicGetProfileAttribute \
    --attributeName 'zE7NAAs5' \
    --namespace "$AB_NAMESPACE" \
    --profileId 'Tj8yggNH' \
    --userId 'Uxs8di0S' \
    > test.out 2>&1
eval_tap $? 18 'PublicGetProfileAttribute' test.out

#- 19 PublicUpdateAttribute
./ng net.accelbyte.sdk.cli.Main social publicUpdateAttribute \
    --attributeName 'z68QArzQ' \
    --namespace "$AB_NAMESPACE" \
    --profileId 'XOvtWPqd' \
    --userId 'I05cz7TP' \
    --body '{"name": "0c098DUq", "value": "AmV2Ymq8"}' \
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
    --limit '77' \
    --offset '37' \
    --statCodes '1Lqe2nmZ' \
    > test.out 2>&1
eval_tap $? 26 'GetGlobalStatItems' test.out

#- 27 GetGlobalStatItemByStatCode
./ng net.accelbyte.sdk.cli.Main social getGlobalStatItemByStatCode \
    --namespace "$AB_NAMESPACE" \
    --statCode 'afWhdHlE' \
    > test.out 2>&1
eval_tap $? 27 'GetGlobalStatItemByStatCode' test.out

#- 28 GetStatCycles
./ng net.accelbyte.sdk.cli.Main social getStatCycles \
    --namespace "$AB_NAMESPACE" \
    --cycleType 'ANNUALLY' \
    --limit '44' \
    --name 'Rbk1bZBq' \
    --offset '4' \
    --sortBy 'iazTtxwm' \
    --status 'ACTIVE' \
    > test.out 2>&1
eval_tap $? 28 'GetStatCycles' test.out

#- 29 CreateStatCycle
./ng net.accelbyte.sdk.cli.Main social createStatCycle \
    --namespace "$AB_NAMESPACE" \
    --body '{"cycleType": "MONTHLY", "description": "IeyoLcXW", "end": "1997-06-08T00:00:00Z", "id": "AvO7bN21", "name": "vD75W2yD", "resetDate": 78, "resetDay": 95, "resetMonth": 13, "resetTime": "Twhbs3k4", "seasonPeriod": 1, "start": "1987-12-14T00:00:00Z"}' \
    > test.out 2>&1
eval_tap $? 29 'CreateStatCycle' test.out

#- 30 BulkGetStatCycle
./ng net.accelbyte.sdk.cli.Main social bulkGetStatCycle \
    --namespace "$AB_NAMESPACE" \
    --body '{"cycleIds": ["KViKklIv", "RrbM5n0o", "8o8z9mnx"]}' \
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
    --cycleId 'FXbdNmz9' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 33 'GetStatCycle' test.out

#- 34 UpdateStatCycle
./ng net.accelbyte.sdk.cli.Main social updateStatCycle \
    --cycleId 'cZVRTfJb' \
    --namespace "$AB_NAMESPACE" \
    --body '{"cycleType": "WEEKLY", "description": "h5iT5rDX", "end": "1980-03-20T00:00:00Z", "name": "XWPwxR02", "resetDate": 60, "resetDay": 18, "resetMonth": 35, "resetTime": "xTF1NwNZ", "seasonPeriod": 43, "start": "1979-09-23T00:00:00Z"}' \
    > test.out 2>&1
eval_tap $? 34 'UpdateStatCycle' test.out

#- 35 DeleteStatCycle
./ng net.accelbyte.sdk.cli.Main social deleteStatCycle \
    --cycleId 'yzCX2fvk' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 35 'DeleteStatCycle' test.out

#- 36 BulkAddStats
./ng net.accelbyte.sdk.cli.Main social bulkAddStats \
    --cycleId 'Da4OxWNB' \
    --namespace "$AB_NAMESPACE" \
    --body '{"statCodes": ["rdWdXAgB", "Im4WFkpH", "bK0uN7Wl"]}' \
    > test.out 2>&1
eval_tap $? 36 'BulkAddStats' test.out

#- 37 StopStatCycle
./ng net.accelbyte.sdk.cli.Main social stopStatCycle \
    --cycleId 'CyEycSRh' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 37 'StopStatCycle' test.out

#- 38 BulkFetchStatItems
./ng net.accelbyte.sdk.cli.Main social bulkFetchStatItems \
    --namespace "$AB_NAMESPACE" \
    --statCode 'rbNETpJY' \
    --userIds 'YcUTD4vj' \
    > test.out 2>&1
eval_tap $? 38 'BulkFetchStatItems' test.out

#- 39 BulkIncUserStatItem
./ng net.accelbyte.sdk.cli.Main social bulkIncUserStatItem \
    --namespace "$AB_NAMESPACE" \
    --body '[{"inc": 0.12633027588927292, "statCode": "CDTtxTmC", "userId": "XS7l3Xcr"}, {"inc": 0.0697890637506483, "statCode": "nYmNhL7D", "userId": "45U5sCz3"}, {"inc": 0.7486243865233906, "statCode": "gqSwKYO2", "userId": "kGXlXLV6"}]' \
    > test.out 2>&1
eval_tap $? 39 'BulkIncUserStatItem' test.out

#- 40 BulkIncUserStatItemValue
./ng net.accelbyte.sdk.cli.Main social bulkIncUserStatItemValue \
    --namespace "$AB_NAMESPACE" \
    --body '[{"inc": 0.2694749405794121, "statCode": "42LwJMSz", "userId": "fw4Sq2HX"}, {"inc": 0.2261265086440709, "statCode": "EDkWnKuI", "userId": "NEffe4Sn"}, {"inc": 0.8493282981744403, "statCode": "RLaXMIOv", "userId": "ojZ95W1N"}]' \
    > test.out 2>&1
eval_tap $? 40 'BulkIncUserStatItemValue' test.out

#- 41 BulkFetchOrDefaultStatItems
./ng net.accelbyte.sdk.cli.Main social bulkFetchOrDefaultStatItems \
    --namespace "$AB_NAMESPACE" \
    --statCode 'UFwOdtrW' \
    --userIds '12tS10qc,TOWxvuzb,2fKEx93N' \
    > test.out 2>&1
eval_tap $? 41 'BulkFetchOrDefaultStatItems' test.out

#- 42 BulkResetUserStatItem
./ng net.accelbyte.sdk.cli.Main social bulkResetUserStatItem \
    --namespace "$AB_NAMESPACE" \
    --body '[{"statCode": "FJVe2En3", "userId": "NoPE0Ogi"}, {"statCode": "M502fF3i", "userId": "NnNKw6mT"}, {"statCode": "oF4MpvDC", "userId": "0i78vRsT"}]' \
    > test.out 2>&1
eval_tap $? 42 'BulkResetUserStatItem' test.out

#- 43 GetStats
./ng net.accelbyte.sdk.cli.Main social getStats \
    --namespace "$AB_NAMESPACE" \
    --cycleIds 'Z42KhmRK' \
    --isGlobal  \
    --isPublic  \
    --limit '79' \
    --offset '23' \
    > test.out 2>&1
eval_tap $? 43 'GetStats' test.out

#- 44 CreateStat
./ng net.accelbyte.sdk.cli.Main social createStat \
    --namespace "$AB_NAMESPACE" \
    --body '{"cycleIds": ["As9Ur8YY", "r3BuaQ5w", "4sXFEgWV"], "cycleOverrides": [{"cycleId": "k0KsZA0R", "maximum": 0.2461410857129891, "minimum": 0.5750633283348994}, {"cycleId": "8yI7Bego", "maximum": 0.9713771134145079, "minimum": 0.2664485755208008}, {"cycleId": "KMAc4nNH", "maximum": 0.15917051211067956, "minimum": 0.4700562756304919}], "defaultValue": 0.32510065659462895, "description": "IWecFbRw", "globalAggregationMethod": "LAST", "ignoreAdditionalDataOnValueRejected": false, "incrementOnly": false, "isPublic": true, "maximum": 0.585299225405872, "minimum": 0.785416207687382, "name": "V1tcRXpR", "setAsGlobal": false, "setBy": "CLIENT", "statCode": "S1OEY06H", "tags": ["m7F10ohb", "3aRoXieM", "5wjxzjRN"], "visibility": "SHOWALL"}' \
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
    --limit '40' \
    --offset '54' \
    --keyword 'FBp5tFYV' \
    > test.out 2>&1
eval_tap $? 47 'QueryStats' test.out

#- 48 GetStat
./ng net.accelbyte.sdk.cli.Main social getStat \
    --namespace "$AB_NAMESPACE" \
    --statCode 'NxlSBiWB' \
    > test.out 2>&1
eval_tap $? 48 'GetStat' test.out

#- 49 DeleteStat
./ng net.accelbyte.sdk.cli.Main social deleteStat \
    --namespace "$AB_NAMESPACE" \
    --statCode 'NkW92igV' \
    > test.out 2>&1
eval_tap $? 49 'DeleteStat' test.out

#- 50 UpdateStat
./ng net.accelbyte.sdk.cli.Main social updateStat \
    --namespace "$AB_NAMESPACE" \
    --statCode 'jjdDBMTV' \
    --body '{"cycleIds": ["817GMrFj", "lIOfyp2Z", "DbA8HHA2"], "cycleOverrides": [{"cycleId": "UsuqLy5G", "maximum": 0.8079636246188286, "minimum": 0.2916328805082261}, {"cycleId": "2QMkjqQ4", "maximum": 0.19615222580174774, "minimum": 0.402007524916005}, {"cycleId": "MvoUwQ8u", "maximum": 0.6968719776092898, "minimum": 0.9308471371053749}], "defaultValue": 0.7073214529610222, "description": "vZBWfoqY", "globalAggregationMethod": "MIN", "ignoreAdditionalDataOnValueRejected": false, "isPublic": false, "name": "4ETW2U8Q", "tags": ["FT6PAQf0", "NByCHb1E", "ko16mo1j"], "visibility": "SERVERONLY"}' \
    > test.out 2>&1
eval_tap $? 50 'UpdateStat' test.out

#- 51 GetStatItems
./ng net.accelbyte.sdk.cli.Main social getStatItems \
    --namespace "$AB_NAMESPACE" \
    --statCode 'wNyNfZqR' \
    --limit '2' \
    --offset '37' \
    --sortBy 'PYRPLgPD' \
    > test.out 2>&1
eval_tap $? 51 'GetStatItems' test.out

#- 52 DeleteTiedStat
./ng net.accelbyte.sdk.cli.Main social deleteTiedStat \
    --namespace "$AB_NAMESPACE" \
    --statCode 'syaTt3Om' \
    > test.out 2>&1
eval_tap $? 52 'DeleteTiedStat' test.out

#- 53 GetUserStatCycleItems
./ng net.accelbyte.sdk.cli.Main social getUserStatCycleItems \
    --cycleId 't4tJyqmk' \
    --namespace "$AB_NAMESPACE" \
    --userId 'JJHyt1Ai' \
    --isPublic  \
    --limit '21' \
    --offset '36' \
    --sortBy '4vMOOUwq' \
    --statCodes 't0mC1ThD' \
    > test.out 2>&1
eval_tap $? 53 'GetUserStatCycleItems' test.out

#- 54 GetUserStatItems
./ng net.accelbyte.sdk.cli.Main social getUserStatItems \
    --namespace "$AB_NAMESPACE" \
    --userId 'Z3F1WyQ4' \
    --isPublic  \
    --limit '67' \
    --offset '1' \
    --sortBy 'iEtwZN76' \
    --statCodes 'gFKkJZ1l' \
    --tags '9Fz26pNV' \
    > test.out 2>&1
eval_tap $? 54 'GetUserStatItems' test.out

#- 55 BulkCreateUserStatItems
./ng net.accelbyte.sdk.cli.Main social bulkCreateUserStatItems \
    --namespace "$AB_NAMESPACE" \
    --userId 'layVlNfk' \
    --body '[{"statCode": "qTDkZh7A"}, {"statCode": "B5hfYQLC"}, {"statCode": "cXymdEv2"}]' \
    > test.out 2>&1
eval_tap $? 55 'BulkCreateUserStatItems' test.out

#- 56 BulkIncUserStatItem1
./ng net.accelbyte.sdk.cli.Main social bulkIncUserStatItem1 \
    --namespace "$AB_NAMESPACE" \
    --userId 'BsgdkP6S' \
    --body '[{"inc": 0.14204585626039212, "statCode": "0hLckMHu"}, {"inc": 0.7725755596596164, "statCode": "sKPH9BqX"}, {"inc": 0.9470274736888604, "statCode": "dIKFLRw7"}]' \
    > test.out 2>&1
eval_tap $? 56 'BulkIncUserStatItem1' test.out

#- 57 BulkIncUserStatItemValue1
./ng net.accelbyte.sdk.cli.Main social bulkIncUserStatItemValue1 \
    --namespace "$AB_NAMESPACE" \
    --userId 'lJQvMMw8' \
    --body '[{"inc": 0.8165831253341929, "statCode": "1lza6bks"}, {"inc": 0.9361020282547653, "statCode": "YTSZKvSl"}, {"inc": 0.9255651809295522, "statCode": "xMOA0dNS"}]' \
    > test.out 2>&1
eval_tap $? 57 'BulkIncUserStatItemValue1' test.out

#- 58 BulkResetUserStatItem1
./ng net.accelbyte.sdk.cli.Main social bulkResetUserStatItem1 \
    --namespace "$AB_NAMESPACE" \
    --userId 'l3HoDe4d' \
    --body '[{"statCode": "0iZvpnho"}, {"statCode": "vQxskS8w"}, {"statCode": "Am0gSmEH"}]' \
    > test.out 2>&1
eval_tap $? 58 'BulkResetUserStatItem1' test.out

#- 59 CreateUserStatItem
./ng net.accelbyte.sdk.cli.Main social createUserStatItem \
    --namespace "$AB_NAMESPACE" \
    --statCode '6TbQU0hI' \
    --userId 'zQuPEt6f' \
    > test.out 2>&1
eval_tap $? 59 'CreateUserStatItem' test.out

#- 60 DeleteUserStatItems
./ng net.accelbyte.sdk.cli.Main social deleteUserStatItems \
    --namespace "$AB_NAMESPACE" \
    --statCode 'uW3QYoPj' \
    --userId 'td5auymw' \
    > test.out 2>&1
eval_tap $? 60 'DeleteUserStatItems' test.out

#- 61 IncUserStatItemValue
./ng net.accelbyte.sdk.cli.Main social incUserStatItemValue \
    --namespace "$AB_NAMESPACE" \
    --statCode 'OriBeu35' \
    --userId 'VuisqVHE' \
    --body '{"inc": 0.9292842024379574}' \
    > test.out 2>&1
eval_tap $? 61 'IncUserStatItemValue' test.out

#- 62 ResetUserStatItemValue
./ng net.accelbyte.sdk.cli.Main social resetUserStatItemValue \
    --namespace "$AB_NAMESPACE" \
    --statCode '6hy34N6Y' \
    --userId 'WFUyCfXt' \
    --additionalKey 'gIvud2cP' \
    --body '{"additionalData": {"kU5yGPD2": {}, "6EqI0jkC": {}, "QNSrlAa8": {}}}' \
    > test.out 2>&1
eval_tap $? 62 'ResetUserStatItemValue' test.out

#- 63 GetGlobalStatItems1
./ng net.accelbyte.sdk.cli.Main social getGlobalStatItems1 \
    --namespace "$AB_NAMESPACE" \
    --limit '25' \
    --offset '61' \
    --statCodes 'M3sxG1LX' \
    > test.out 2>&1
eval_tap $? 63 'GetGlobalStatItems1' test.out

#- 64 GetGlobalStatItemByStatCode1
./ng net.accelbyte.sdk.cli.Main social getGlobalStatItemByStatCode1 \
    --namespace "$AB_NAMESPACE" \
    --statCode 'cpbF2IHC' \
    > test.out 2>&1
eval_tap $? 64 'GetGlobalStatItemByStatCode1' test.out

#- 65 GetStatCycles1
./ng net.accelbyte.sdk.cli.Main social getStatCycles1 \
    --namespace "$AB_NAMESPACE" \
    --cycleType 'WEEKLY' \
    --limit '29' \
    --name 'jmy1ntCs' \
    --offset '99' \
    --sortBy 'He5DEg4c' \
    --status 'INIT' \
    > test.out 2>&1
eval_tap $? 65 'GetStatCycles1' test.out

#- 66 BulkGetStatCycle1
./ng net.accelbyte.sdk.cli.Main social bulkGetStatCycle1 \
    --namespace "$AB_NAMESPACE" \
    --body '{"cycleIds": ["b8i481HX", "QSL9aiWG", "VCoMnyI1"]}' \
    > test.out 2>&1
eval_tap $? 66 'BulkGetStatCycle1' test.out

#- 67 GetStatCycle1
./ng net.accelbyte.sdk.cli.Main social getStatCycle1 \
    --cycleId '1wbKfQ5e' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 67 'GetStatCycle1' test.out

#- 68 BulkFetchStatItems1
./ng net.accelbyte.sdk.cli.Main social bulkFetchStatItems1 \
    --namespace "$AB_NAMESPACE" \
    --statCode 'hLpGVChu' \
    --userIds 'j2PPl83y' \
    > test.out 2>&1
eval_tap $? 68 'BulkFetchStatItems1' test.out

#- 69 PublicBulkIncUserStatItem
./ng net.accelbyte.sdk.cli.Main social publicBulkIncUserStatItem \
    --namespace "$AB_NAMESPACE" \
    --body '[{"inc": 0.5246206725349909, "statCode": "pXQek2Qj", "userId": "pf7qdQXj"}, {"inc": 0.9244582764949044, "statCode": "S6qnnnNN", "userId": "P19HGkwn"}, {"inc": 0.3955673918041027, "statCode": "dk3ZXNqC", "userId": "Yf4oL9BB"}]' \
    > test.out 2>&1
eval_tap $? 69 'PublicBulkIncUserStatItem' test.out

#- 70 PublicBulkIncUserStatItemValue
./ng net.accelbyte.sdk.cli.Main social publicBulkIncUserStatItemValue \
    --namespace "$AB_NAMESPACE" \
    --body '[{"inc": 0.381493983790111, "statCode": "jGBOOXk2", "userId": "6nnu86w9"}, {"inc": 0.5748891833005748, "statCode": "GABD12UA", "userId": "nUikD1fR"}, {"inc": 0.8081709129716715, "statCode": "5OOOLm9A", "userId": "UmWvLsDt"}]' \
    > test.out 2>&1
eval_tap $? 70 'PublicBulkIncUserStatItemValue' test.out

#- 71 BulkResetUserStatItem2
./ng net.accelbyte.sdk.cli.Main social bulkResetUserStatItem2 \
    --namespace "$AB_NAMESPACE" \
    --body '[{"statCode": "hwI6ikmC", "userId": "uSjjvAO2"}, {"statCode": "MAF36flu", "userId": "39NWSg6j"}, {"statCode": "fhAhHXzX", "userId": "2y6dFi7Z"}]' \
    > test.out 2>&1
eval_tap $? 71 'BulkResetUserStatItem2' test.out

#- 72 CreateStat1
./ng net.accelbyte.sdk.cli.Main social createStat1 \
    --namespace "$AB_NAMESPACE" \
    --body '{"cycleIds": ["JIBNaeEM", "6cEZxYj5", "mayPLNDd"], "cycleOverrides": [{"cycleId": "4RrWPNlE", "maximum": 0.9354434546124767, "minimum": 0.05231029350564076}, {"cycleId": "DkgVT02m", "maximum": 0.5683884587796687, "minimum": 0.8722273983643803}, {"cycleId": "kqW4pTWr", "maximum": 0.25954478636295675, "minimum": 0.2576343704358639}], "defaultValue": 0.9437368125880716, "description": "zPxYFdXR", "globalAggregationMethod": "MAX", "ignoreAdditionalDataOnValueRejected": true, "incrementOnly": true, "isPublic": true, "maximum": 0.17448593110023214, "minimum": 0.6895963735899654, "name": "5i1GD7q5", "setAsGlobal": true, "setBy": "SERVER", "statCode": "E5MR5SNS", "tags": ["vv082eg5", "IEIqatXg", "XD1jVaoe"], "visibility": "SHOWALL"}' \
    > test.out 2>&1
eval_tap $? 72 'CreateStat1' test.out

#- 73 PublicListMyStatCycleItems
./ng net.accelbyte.sdk.cli.Main social publicListMyStatCycleItems \
    --cycleId 'C1y1vGF4' \
    --namespace "$AB_NAMESPACE" \
    --limit '61' \
    --offset '79' \
    --sortBy 'MN0vW2v7' \
    --statCodes 'HszFGa9m,0DKOIqcM,79oxCyqM' \
    > test.out 2>&1
eval_tap $? 73 'PublicListMyStatCycleItems' test.out

#- 74 PublicListMyStatItems
./ng net.accelbyte.sdk.cli.Main social publicListMyStatItems \
    --namespace "$AB_NAMESPACE" \
    --limit '56' \
    --offset '9' \
    --sortBy 'dS0QY1cx' \
    --statCodes '1lLVKUCz,fhtoPDJo,WOqPR1qX' \
    --tags 'zGX1ljwI,n9MGf8Nc,qyjMnBj5' \
    > test.out 2>&1
eval_tap $? 74 'PublicListMyStatItems' test.out

#- 75 PublicListAllMyStatItems
./ng net.accelbyte.sdk.cli.Main social publicListAllMyStatItems \
    --namespace "$AB_NAMESPACE" \
    --additionalKey 'OLbsQIn9' \
    --statCodes 'lSxy4der,yn37TYkU,xKy4dZWB' \
    --tags 'V1Vf9DE1,g3pKf4Wp,NXVGNY7r' \
    > test.out 2>&1
eval_tap $? 75 'PublicListAllMyStatItems' test.out

#- 76 GetUserStatCycleItems1
./ng net.accelbyte.sdk.cli.Main social getUserStatCycleItems1 \
    --cycleId '6DY0A9VI' \
    --namespace "$AB_NAMESPACE" \
    --userId 'WNXe0kbc' \
    --limit '7' \
    --offset '98' \
    --sortBy 'owLrs2rf' \
    --statCodes 'UaIQ2pJa' \
    > test.out 2>&1
eval_tap $? 76 'GetUserStatCycleItems1' test.out

#- 77 PublicQueryUserStatItems
./ng net.accelbyte.sdk.cli.Main social publicQueryUserStatItems \
    --namespace "$AB_NAMESPACE" \
    --userId 'aguBUeVX' \
    --limit '52' \
    --offset '59' \
    --sortBy 'ndHXjw05' \
    --statCodes 'DknnOn0b' \
    --tags '503Qut7w' \
    > test.out 2>&1
eval_tap $? 77 'PublicQueryUserStatItems' test.out

#- 78 PublicBulkCreateUserStatItems
./ng net.accelbyte.sdk.cli.Main social publicBulkCreateUserStatItems \
    --namespace "$AB_NAMESPACE" \
    --userId 'pTo0h68J' \
    --body '[{"statCode": "j8v5rq6I"}, {"statCode": "9jWruWpL"}, {"statCode": "nKbtkmJM"}]' \
    > test.out 2>&1
eval_tap $? 78 'PublicBulkCreateUserStatItems' test.out

#- 79 PublicQueryUserStatItems1
./ng net.accelbyte.sdk.cli.Main social publicQueryUserStatItems1 \
    --namespace "$AB_NAMESPACE" \
    --userId 'vI1J0jtF' \
    --additionalKey 'oZchlHgA' \
    --statCodes 'Qcf5MLg9,JBWHE1h5,05gTpEQp' \
    --tags '6EzM1n4x,XwmHNqCN,0iLsCRDD' \
    > test.out 2>&1
eval_tap $? 79 'PublicQueryUserStatItems1' test.out

#- 80 PublicBulkIncUserStatItem1
./ng net.accelbyte.sdk.cli.Main social publicBulkIncUserStatItem1 \
    --namespace "$AB_NAMESPACE" \
    --userId 'gpvURFC2' \
    --body '[{"inc": 0.7827675074379774, "statCode": "2Jii3JFy"}, {"inc": 0.7960548411999052, "statCode": "AX7AhIQn"}, {"inc": 0.36595296097916763, "statCode": "XTYLSXtA"}]' \
    > test.out 2>&1
eval_tap $? 80 'PublicBulkIncUserStatItem1' test.out

#- 81 BulkIncUserStatItemValue2
./ng net.accelbyte.sdk.cli.Main social bulkIncUserStatItemValue2 \
    --namespace "$AB_NAMESPACE" \
    --userId '8vakbYdQ' \
    --body '[{"inc": 0.017510770729941227, "statCode": "oeQQhcqK"}, {"inc": 0.2594370443491273, "statCode": "3BoZHjUX"}, {"inc": 0.29729845010294365, "statCode": "aVdC6dOS"}]' \
    > test.out 2>&1
eval_tap $? 81 'BulkIncUserStatItemValue2' test.out

#- 82 BulkResetUserStatItem3
./ng net.accelbyte.sdk.cli.Main social bulkResetUserStatItem3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'YuRdFbhS' \
    --body '[{"statCode": "7NE6Jvcf"}, {"statCode": "DJj7vdP7"}, {"statCode": "droxYXhp"}]' \
    > test.out 2>&1
eval_tap $? 82 'BulkResetUserStatItem3' test.out

#- 83 PublicCreateUserStatItem
./ng net.accelbyte.sdk.cli.Main social publicCreateUserStatItem \
    --namespace "$AB_NAMESPACE" \
    --statCode 'tcI50AyW' \
    --userId 'A4OrqcSG' \
    > test.out 2>&1
eval_tap $? 83 'PublicCreateUserStatItem' test.out

#- 84 DeleteUserStatItems1
./ng net.accelbyte.sdk.cli.Main social deleteUserStatItems1 \
    --namespace "$AB_NAMESPACE" \
    --statCode 'FQ2KG7qM' \
    --userId 'IuFMFixj' \
    > test.out 2>&1
eval_tap $? 84 'DeleteUserStatItems1' test.out

#- 85 PublicIncUserStatItem
./ng net.accelbyte.sdk.cli.Main social publicIncUserStatItem \
    --namespace "$AB_NAMESPACE" \
    --statCode 'liRBXf6G' \
    --userId 'hXDxTLPD' \
    --body '{"inc": 0.09283525176654428}' \
    > test.out 2>&1
eval_tap $? 85 'PublicIncUserStatItem' test.out

#- 86 PublicIncUserStatItemValue
./ng net.accelbyte.sdk.cli.Main social publicIncUserStatItemValue \
    --namespace "$AB_NAMESPACE" \
    --statCode 'LNK6Vi0V' \
    --userId 'CbVoP15s' \
    --body '{"inc": 0.29184822447367575}' \
    > test.out 2>&1
eval_tap $? 86 'PublicIncUserStatItemValue' test.out

#- 87 ResetUserStatItemValue1
./ng net.accelbyte.sdk.cli.Main social resetUserStatItemValue1 \
    --namespace "$AB_NAMESPACE" \
    --statCode 'blp6McKR' \
    --userId '28H5pkaE' \
    > test.out 2>&1
eval_tap $? 87 'ResetUserStatItemValue1' test.out

#- 88 BulkUpdateUserStatItemV2
./ng net.accelbyte.sdk.cli.Main social bulkUpdateUserStatItemV2 \
    --namespace "$AB_NAMESPACE" \
    --body '[{"additionalData": {"4CmBtQuQ": {}, "OOYDEe2g": {}, "2pVJRg6x": {}}, "additionalKey": "XEMhTdoj", "statCode": "rN4Z6JEU", "updateStrategy": "OVERRIDE", "userId": "BRQt6r4U", "value": 0.504831234964549}, {"additionalData": {"MVf6wsw8": {}, "RIpg5VCj": {}, "pAdpYgnK": {}}, "additionalKey": "bG0VD4SZ", "statCode": "rMpVq7QX", "updateStrategy": "INCREMENT", "userId": "vM4yijap", "value": 0.32762107506557314}, {"additionalData": {"PrdTs9f8": {}, "eW5b2mIT": {}, "saGqYz76": {}}, "additionalKey": "ZVWOc717", "statCode": "FrpmLvCn", "updateStrategy": "MAX", "userId": "tIASufIO", "value": 0.5116648639498934}]' \
    > test.out 2>&1
eval_tap $? 88 'BulkUpdateUserStatItemV2' test.out

#- 89 BulkFetchOrDefaultStatItems1
./ng net.accelbyte.sdk.cli.Main social bulkFetchOrDefaultStatItems1 \
    --namespace "$AB_NAMESPACE" \
    --additionalKey 'npqeIkB9' \
    --statCode 'dQwaS5KQ' \
    --userIds 'lzZTNwsF,Kn6zNPh0,Avz0pXqE' \
    > test.out 2>&1
eval_tap $? 89 'BulkFetchOrDefaultStatItems1' test.out

#- 90 AdminListUsersStatItems
./ng net.accelbyte.sdk.cli.Main social adminListUsersStatItems \
    --namespace "$AB_NAMESPACE" \
    --userId 'PWJ3lokC' \
    --additionalKey 'HrhVFK5C' \
    --statCodes '8qrrwbFx,zri0pdV1,aLhbRJ9b' \
    --tags 't6d1XNVs,mU2QKk2J,79xlvXn1' \
    > test.out 2>&1
eval_tap $? 90 'AdminListUsersStatItems' test.out

#- 91 BulkUpdateUserStatItem
./ng net.accelbyte.sdk.cli.Main social bulkUpdateUserStatItem \
    --namespace "$AB_NAMESPACE" \
    --userId 'mQxc8vHn' \
    --additionalKey '7PqopiOg' \
    --body '[{"additionalData": {"tapb8Yjm": {}, "V6nJteup": {}, "viJWGAvJ": {}}, "statCode": "2XjM6cXR", "updateStrategy": "MIN", "value": 0.01775512446541283}, {"additionalData": {"UF2K8EyB": {}, "fqE6JdoN": {}, "EN2RV7up": {}}, "statCode": "xtcPJsXf", "updateStrategy": "INCREMENT", "value": 0.8215801833025187}, {"additionalData": {"Cql5Ti7V": {}, "KD3kgKHE": {}, "G1rjVYtQ": {}}, "statCode": "h4YsKOyU", "updateStrategy": "MAX", "value": 0.9990088448688283}]' \
    > test.out 2>&1
eval_tap $? 91 'BulkUpdateUserStatItem' test.out

#- 92 BulkGetOrDefaultByUserId
./ng net.accelbyte.sdk.cli.Main social bulkGetOrDefaultByUserId \
    --namespace "$AB_NAMESPACE" \
    --userId 'Pu13o6E3' \
    --additionalKey 'IFozIfjU' \
    --body '{"statCodes": ["33VO63En", "e766huMW", "572J6FzU"]}' \
    > test.out 2>&1
eval_tap $? 92 'BulkGetOrDefaultByUserId' test.out

#- 93 BulkResetUserStatItemValues
./ng net.accelbyte.sdk.cli.Main social bulkResetUserStatItemValues \
    --namespace "$AB_NAMESPACE" \
    --userId 'lrJmcElM' \
    --additionalKey 'mejuLFuU' \
    --body '[{"additionalData": {"7tqAQch7": {}, "9uzIUWCo": {}, "277tox59": {}}, "statCode": "nVr6mz32"}, {"additionalData": {"tl6dGHtg": {}, "ONDJP4pM": {}, "52d9vl0U": {}}, "statCode": "LfyK2ODD"}, {"additionalData": {"e72EEepk": {}, "h2JyIcUQ": {}, "cmtANLWw": {}}, "statCode": "71d2esuq"}]' \
    > test.out 2>&1
eval_tap $? 93 'BulkResetUserStatItemValues' test.out

#- 94 DeleteUserStatItems2
./ng net.accelbyte.sdk.cli.Main social deleteUserStatItems2 \
    --namespace "$AB_NAMESPACE" \
    --statCode '99sAdgRL' \
    --userId 'tqQLeiRc' \
    --additionalKey 'qSWp7zNH' \
    > test.out 2>&1
eval_tap $? 94 'DeleteUserStatItems2' test.out

#- 95 UpdateUserStatItemValue
./ng net.accelbyte.sdk.cli.Main social updateUserStatItemValue \
    --namespace "$AB_NAMESPACE" \
    --statCode 'lfVQyYVM' \
    --userId 'OBkKQsRV' \
    --additionalKey 'fnez5vWj' \
    --body '{"additionalData": {"ULD5GHxa": {}, "50OQWUnE": {}, "Auq1srfN": {}}, "updateStrategy": "OVERRIDE", "value": 0.3281254887038322}' \
    > test.out 2>&1
eval_tap $? 95 'UpdateUserStatItemValue' test.out

#- 96 BulkUpdateUserStatItem1
./ng net.accelbyte.sdk.cli.Main social bulkUpdateUserStatItem1 \
    --namespace "$AB_NAMESPACE" \
    --body '[{"additionalData": {"0mbSTC8k": {}, "1AAam8Su": {}, "9vQz607w": {}}, "additionalKey": "uXqlhetu", "statCode": "s35CSBgq", "updateStrategy": "MIN", "userId": "SHt90mix", "value": 0.12630684982850748}, {"additionalData": {"ik3FyTf4": {}, "rhffr8aL": {}, "OrvZwYmB": {}}, "additionalKey": "5GYIzxkX", "statCode": "YzScG0lQ", "updateStrategy": "OVERRIDE", "userId": "07PLFuAH", "value": 0.5653250104243537}, {"additionalData": {"gn1cYaDg": {}, "Ur9wl4OA": {}, "Gr8lRCwa": {}}, "additionalKey": "poiBkUv8", "statCode": "JpYScu8v", "updateStrategy": "INCREMENT", "userId": "pplsfU8Z", "value": 0.5958514352245577}]' \
    > test.out 2>&1
eval_tap $? 96 'BulkUpdateUserStatItem1' test.out

#- 97 PublicQueryUserStatItems2
./ng net.accelbyte.sdk.cli.Main social publicQueryUserStatItems2 \
    --namespace "$AB_NAMESPACE" \
    --userId 'XxWZ3vPt' \
    --additionalKey 'guM5j3Nf' \
    --statCodes 'r8tGZRb5,ViFOaKJF,j8cZUeOX' \
    --tags 'd2ghDytP,a1B4ltu4,A9ywTQcP' \
    > test.out 2>&1
eval_tap $? 97 'PublicQueryUserStatItems2' test.out

#- 98 BulkUpdateUserStatItem2
./ng net.accelbyte.sdk.cli.Main social bulkUpdateUserStatItem2 \
    --namespace "$AB_NAMESPACE" \
    --userId 'RnIQrT8b' \
    --additionalKey 'B6VFU8HS' \
    --body '[{"additionalData": {"2blYn7Mn": {}, "7yzgsXNg": {}, "SgJmsrDX": {}}, "statCode": "R2pVTDq7", "updateStrategy": "INCREMENT", "value": 0.9818114386750977}, {"additionalData": {"k01ioZJQ": {}, "9utX9R4D": {}, "2GJbGvNH": {}}, "statCode": "mYxaGQj1", "updateStrategy": "OVERRIDE", "value": 0.5030910719514525}, {"additionalData": {"3Xt1KtMK": {}, "UrUgVGD5": {}, "TO3Gb9Zr": {}}, "statCode": "vdPNJfQj", "updateStrategy": "INCREMENT", "value": 0.8242411010417677}]' \
    > test.out 2>&1
eval_tap $? 98 'BulkUpdateUserStatItem2' test.out

#- 99 UpdateUserStatItemValue1
./ng net.accelbyte.sdk.cli.Main social updateUserStatItemValue1 \
    --namespace "$AB_NAMESPACE" \
    --statCode 'CPb6BooK' \
    --userId 'sTnitfCO' \
    --additionalKey '5YRLQqas' \
    --body '{"additionalData": {"WR4Xkvkr": {}, "H9nxsvNW": {}, "MFxKawzQ": {}}, "updateStrategy": "MIN", "value": 0.3196531649382791}' \
    > test.out 2>&1
eval_tap $? 99 'UpdateUserStatItemValue1' test.out


rm -f "tmp.dat"

exit $EXIT_CODE