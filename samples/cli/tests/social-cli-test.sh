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
    --limit '10' \
    --offset '9' \
    --statCodes '1DnVuCCH' \
    > test.out 2>&1
eval_tap $? 26 'GetGlobalStatItems' test.out

#- 27 GetGlobalStatItemByStatCode
./ng net.accelbyte.sdk.cli.Main social getGlobalStatItemByStatCode \
    --namespace "$AB_NAMESPACE" \
    --statCode 'wgx9b8NZ' \
    > test.out 2>&1
eval_tap $? 27 'GetGlobalStatItemByStatCode' test.out

#- 28 GetStatCycles
./ng net.accelbyte.sdk.cli.Main social getStatCycles \
    --namespace "$AB_NAMESPACE" \
    --cycleType 'MONTHLY' \
    --limit '56' \
    --name 'VxToy65R' \
    --offset '60' \
    --sortBy 'J6K4NdLn' \
    --status 'ACTIVE' \
    > test.out 2>&1
eval_tap $? 28 'GetStatCycles' test.out

#- 29 CreateStatCycle
./ng net.accelbyte.sdk.cli.Main social createStatCycle \
    --namespace "$AB_NAMESPACE" \
    --body '{"cycleType": "ANNUALLY", "description": "rsnsf2B4", "end": "1980-02-03T00:00:00Z", "id": "AerchELx", "name": "Ibi4jGXO", "resetDate": 59, "resetDay": 65, "resetMonth": 80, "resetTime": "Px7e3Zaq", "seasonPeriod": 83, "start": "1998-07-03T00:00:00Z"}' \
    > test.out 2>&1
eval_tap $? 29 'CreateStatCycle' test.out

#- 30 BulkGetStatCycle
./ng net.accelbyte.sdk.cli.Main social bulkGetStatCycle \
    --namespace "$AB_NAMESPACE" \
    --body '{"cycleIds": ["DKQFDxvs", "SMzip7f7", "SdzXvqLi"]}' \
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
    --cycleId 'eB7YCy4J' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 33 'GetStatCycle' test.out

#- 34 UpdateStatCycle
./ng net.accelbyte.sdk.cli.Main social updateStatCycle \
    --cycleId 'rbVVTpvM' \
    --namespace "$AB_NAMESPACE" \
    --body '{"cycleType": "MONTHLY", "description": "Lb2U4sRc", "end": "1992-05-24T00:00:00Z", "name": "3BDXuPBr", "resetDate": 7, "resetDay": 45, "resetMonth": 11, "resetTime": "XqYqy7Vt", "seasonPeriod": 90, "start": "1980-10-04T00:00:00Z"}' \
    > test.out 2>&1
eval_tap $? 34 'UpdateStatCycle' test.out

#- 35 DeleteStatCycle
./ng net.accelbyte.sdk.cli.Main social deleteStatCycle \
    --cycleId 'eD0ffnSO' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 35 'DeleteStatCycle' test.out

#- 36 BulkAddStats
./ng net.accelbyte.sdk.cli.Main social bulkAddStats \
    --cycleId 's7Ns2ofB' \
    --namespace "$AB_NAMESPACE" \
    --body '{"statCodes": ["Fq5glID2", "i0KGSeYx", "4ixGFjRn"]}' \
    > test.out 2>&1
eval_tap $? 36 'BulkAddStats' test.out

#- 37 StopStatCycle
./ng net.accelbyte.sdk.cli.Main social stopStatCycle \
    --cycleId 'UzGb3UKW' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 37 'StopStatCycle' test.out

#- 38 BulkFetchStatItems
./ng net.accelbyte.sdk.cli.Main social bulkFetchStatItems \
    --namespace "$AB_NAMESPACE" \
    --statCode 'sLo942X2' \
    --userIds 'mdwBSx52' \
    > test.out 2>&1
eval_tap $? 38 'BulkFetchStatItems' test.out

#- 39 BulkIncUserStatItem
./ng net.accelbyte.sdk.cli.Main social bulkIncUserStatItem \
    --namespace "$AB_NAMESPACE" \
    --body '[{"inc": 0.21200902542349442, "statCode": "7cIpNWRo", "userId": "8AmIi0i4"}, {"inc": 0.6250877505686846, "statCode": "GSbDG1ZN", "userId": "JE3Rpku7"}, {"inc": 0.8027898494956536, "statCode": "Rz0khzU0", "userId": "13r6jm9A"}]' \
    > test.out 2>&1
eval_tap $? 39 'BulkIncUserStatItem' test.out

#- 40 BulkIncUserStatItemValue
./ng net.accelbyte.sdk.cli.Main social bulkIncUserStatItemValue \
    --namespace "$AB_NAMESPACE" \
    --body '[{"inc": 0.13469555989967208, "statCode": "ORawOn2u", "userId": "sBc28iLB"}, {"inc": 0.2558767891081277, "statCode": "KotoEbPR", "userId": "UPl2l6YG"}, {"inc": 0.7680891901367335, "statCode": "tVEstscV", "userId": "EwTmJEQQ"}]' \
    > test.out 2>&1
eval_tap $? 40 'BulkIncUserStatItemValue' test.out

#- 41 BulkFetchOrDefaultStatItems
./ng net.accelbyte.sdk.cli.Main social bulkFetchOrDefaultStatItems \
    --namespace "$AB_NAMESPACE" \
    --statCode 'd7FKk97j' \
    --userIds 'gBUqrfdh,r5v7p7gD,6DzUtuxo' \
    > test.out 2>&1
eval_tap $? 41 'BulkFetchOrDefaultStatItems' test.out

#- 42 BulkResetUserStatItem
./ng net.accelbyte.sdk.cli.Main social bulkResetUserStatItem \
    --namespace "$AB_NAMESPACE" \
    --body '[{"statCode": "a9yXt7Gi", "userId": "HE978Daw"}, {"statCode": "pIS0tgtO", "userId": "7ulwQZ5U"}, {"statCode": "tUF1TS8s", "userId": "scBZAp9b"}]' \
    > test.out 2>&1
eval_tap $? 42 'BulkResetUserStatItem' test.out

#- 43 GetStats
./ng net.accelbyte.sdk.cli.Main social getStats \
    --namespace "$AB_NAMESPACE" \
    --cycleIds 'ln8ERZiw' \
    --isGlobal  \
    --isPublic  \
    --limit '94' \
    --offset '23' \
    > test.out 2>&1
eval_tap $? 43 'GetStats' test.out

#- 44 CreateStat
./ng net.accelbyte.sdk.cli.Main social createStat \
    --namespace "$AB_NAMESPACE" \
    --body '{"capCycleOverride": true, "cycleIds": ["HqshLxU2", "gFpsn2sP", "NdanW3Et"], "cycleOverrides": [{"cycleId": "kS7GuAVY", "maximum": 0.34577396993434484, "minimum": 0.503264322119258}, {"cycleId": "pmuUSovQ", "maximum": 0.6853489113945318, "minimum": 0.4609589136060632}, {"cycleId": "PYQd6O5C", "maximum": 0.7164528087945715, "minimum": 0.24108841778925238}], "defaultValue": 0.49535186572935874, "description": "6N1Il0Y1", "globalAggregationMethod": "MAX", "ignoreAdditionalDataOnValueRejected": false, "incrementOnly": false, "isPublic": true, "maximum": 0.9209296730890401, "minimum": 0.44184302715018575, "name": "edXtVFpi", "setAsGlobal": true, "setBy": "CLIENT", "statCode": "hkPppycp", "tags": ["gVEVafVu", "xJ1FpatI", "yKvGNzkr"], "visibility": "SHOWALL"}' \
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
    --limit '10' \
    --offset '85' \
    --keyword 'nEO2usN5' \
    > test.out 2>&1
eval_tap $? 47 'QueryStats' test.out

#- 48 GetStat
./ng net.accelbyte.sdk.cli.Main social getStat \
    --namespace "$AB_NAMESPACE" \
    --statCode 'SUEgg2xE' \
    > test.out 2>&1
eval_tap $? 48 'GetStat' test.out

#- 49 DeleteStat
./ng net.accelbyte.sdk.cli.Main social deleteStat \
    --namespace "$AB_NAMESPACE" \
    --statCode 'v5yh3gOY' \
    > test.out 2>&1
eval_tap $? 49 'DeleteStat' test.out

#- 50 UpdateStat
./ng net.accelbyte.sdk.cli.Main social updateStat \
    --namespace "$AB_NAMESPACE" \
    --statCode 'XPOxuajd' \
    --body '{"capCycleOverride": true, "cycleIds": ["iPWlmvQW", "YO3Y8Q7S", "2DJMkkqU"], "cycleOverrides": [{"cycleId": "o0wAuI7D", "maximum": 0.11016430517924292, "minimum": 0.10610538937096303}, {"cycleId": "M4DpCTNA", "maximum": 0.23644256018603793, "minimum": 0.7399830171932757}, {"cycleId": "bdq59TlH", "maximum": 0.2527240336203379, "minimum": 0.030014546224676475}], "defaultValue": 0.11693141261405993, "description": "XTt9zFxn", "globalAggregationMethod": "LAST", "ignoreAdditionalDataOnValueRejected": false, "isPublic": false, "name": "bqLWQ8CK", "tags": ["vZvobuw0", "FK5gPo8G", "TFdHYE0r"], "visibility": "SHOWALL"}' \
    > test.out 2>&1
eval_tap $? 50 'UpdateStat' test.out

#- 51 GetStatItems
./ng net.accelbyte.sdk.cli.Main social getStatItems \
    --namespace "$AB_NAMESPACE" \
    --statCode '49GXBO2J' \
    --limit '76' \
    --offset '6' \
    --sortBy 'QH5hAxWd' \
    > test.out 2>&1
eval_tap $? 51 'GetStatItems' test.out

#- 52 DeleteTiedStat
./ng net.accelbyte.sdk.cli.Main social deleteTiedStat \
    --namespace "$AB_NAMESPACE" \
    --statCode 'aQxLAxVv' \
    > test.out 2>&1
eval_tap $? 52 'DeleteTiedStat' test.out

#- 53 GetUserStatCycleItems
./ng net.accelbyte.sdk.cli.Main social getUserStatCycleItems \
    --cycleId 'MR1W7hSQ' \
    --namespace "$AB_NAMESPACE" \
    --userId '5ZJ034aI' \
    --isPublic  \
    --limit '85' \
    --offset '72' \
    --sortBy 'zReRjYwz' \
    --statCodes 'UI1DBDBY' \
    > test.out 2>&1
eval_tap $? 53 'GetUserStatCycleItems' test.out

#- 54 GetUserStatItems
./ng net.accelbyte.sdk.cli.Main social getUserStatItems \
    --namespace "$AB_NAMESPACE" \
    --userId 'HDIjkC4w' \
    --isPublic  \
    --limit '81' \
    --offset '83' \
    --sortBy 'gLX46Gl7' \
    --statCodes 'w1A6PK3h' \
    --tags 'GIcCPDlA' \
    > test.out 2>&1
eval_tap $? 54 'GetUserStatItems' test.out

#- 55 BulkCreateUserStatItems
./ng net.accelbyte.sdk.cli.Main social bulkCreateUserStatItems \
    --namespace "$AB_NAMESPACE" \
    --userId 'kDgpqnpW' \
    --body '[{"statCode": "1rxUrsAL"}, {"statCode": "ZUvQP6mk"}, {"statCode": "fOJKwZN4"}]' \
    > test.out 2>&1
eval_tap $? 55 'BulkCreateUserStatItems' test.out

#- 56 BulkIncUserStatItem1
./ng net.accelbyte.sdk.cli.Main social bulkIncUserStatItem1 \
    --namespace "$AB_NAMESPACE" \
    --userId 'XL8QDAab' \
    --body '[{"inc": 0.996750200021435, "statCode": "4Igc5r0Y"}, {"inc": 0.8570584015219138, "statCode": "fjCjREto"}, {"inc": 0.624416796562864, "statCode": "WdptCEse"}]' \
    > test.out 2>&1
eval_tap $? 56 'BulkIncUserStatItem1' test.out

#- 57 BulkIncUserStatItemValue1
./ng net.accelbyte.sdk.cli.Main social bulkIncUserStatItemValue1 \
    --namespace "$AB_NAMESPACE" \
    --userId 'pf3PA1p3' \
    --body '[{"inc": 0.31114878669486246, "statCode": "qdTOAsCF"}, {"inc": 0.9156100504655197, "statCode": "zYfFWRDe"}, {"inc": 0.6372446643721894, "statCode": "z2BxttIE"}]' \
    > test.out 2>&1
eval_tap $? 57 'BulkIncUserStatItemValue1' test.out

#- 58 BulkResetUserStatItem1
./ng net.accelbyte.sdk.cli.Main social bulkResetUserStatItem1 \
    --namespace "$AB_NAMESPACE" \
    --userId 'bhImxWNJ' \
    --body '[{"statCode": "zhEUmVEx"}, {"statCode": "GrY4CaaF"}, {"statCode": "kmKoWUim"}]' \
    > test.out 2>&1
eval_tap $? 58 'BulkResetUserStatItem1' test.out

#- 59 CreateUserStatItem
./ng net.accelbyte.sdk.cli.Main social createUserStatItem \
    --namespace "$AB_NAMESPACE" \
    --statCode 'bktr377P' \
    --userId 'vSX6NSbH' \
    > test.out 2>&1
eval_tap $? 59 'CreateUserStatItem' test.out

#- 60 DeleteUserStatItems
./ng net.accelbyte.sdk.cli.Main social deleteUserStatItems \
    --namespace "$AB_NAMESPACE" \
    --statCode '1HvriFlh' \
    --userId 'Z2WzSL7v' \
    > test.out 2>&1
eval_tap $? 60 'DeleteUserStatItems' test.out

#- 61 IncUserStatItemValue
./ng net.accelbyte.sdk.cli.Main social incUserStatItemValue \
    --namespace "$AB_NAMESPACE" \
    --statCode 'UhpYOgTP' \
    --userId 'vqipqKkm' \
    --body '{"inc": 0.25510415208509196}' \
    > test.out 2>&1
eval_tap $? 61 'IncUserStatItemValue' test.out

#- 62 ResetUserStatItemValue
./ng net.accelbyte.sdk.cli.Main social resetUserStatItemValue \
    --namespace "$AB_NAMESPACE" \
    --statCode '1MaGBGBX' \
    --userId '9KsNRnZY' \
    --additionalKey 'u9t7JoX2' \
    --body '{"additionalData": {"sY0A7Ul8": {}, "HvzerbQ7": {}, "P36D0EKF": {}}}' \
    > test.out 2>&1
eval_tap $? 62 'ResetUserStatItemValue' test.out

#- 63 GetGlobalStatItems1
./ng net.accelbyte.sdk.cli.Main social getGlobalStatItems1 \
    --namespace "$AB_NAMESPACE" \
    --limit '56' \
    --offset '44' \
    --statCodes 'XLIE5cOq' \
    > test.out 2>&1
eval_tap $? 63 'GetGlobalStatItems1' test.out

#- 64 GetGlobalStatItemByStatCode1
./ng net.accelbyte.sdk.cli.Main social getGlobalStatItemByStatCode1 \
    --namespace "$AB_NAMESPACE" \
    --statCode '1LdEi3zV' \
    > test.out 2>&1
eval_tap $? 64 'GetGlobalStatItemByStatCode1' test.out

#- 65 GetStatCycles1
./ng net.accelbyte.sdk.cli.Main social getStatCycles1 \
    --namespace "$AB_NAMESPACE" \
    --cycleType 'DAILY' \
    --limit '13' \
    --name 'tATQnvEd' \
    --offset '81' \
    --sortBy 'nMJvQWk4' \
    --status 'STOPPED' \
    > test.out 2>&1
eval_tap $? 65 'GetStatCycles1' test.out

#- 66 BulkGetStatCycle1
./ng net.accelbyte.sdk.cli.Main social bulkGetStatCycle1 \
    --namespace "$AB_NAMESPACE" \
    --body '{"cycleIds": ["LvpVMYL8", "Z3rmsGgq", "6EZKNksx"]}' \
    > test.out 2>&1
eval_tap $? 66 'BulkGetStatCycle1' test.out

#- 67 GetStatCycle1
./ng net.accelbyte.sdk.cli.Main social getStatCycle1 \
    --cycleId '7zrwCvif' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 67 'GetStatCycle1' test.out

#- 68 BulkFetchStatItems1
./ng net.accelbyte.sdk.cli.Main social bulkFetchStatItems1 \
    --namespace "$AB_NAMESPACE" \
    --statCode 'zTOVuPvq' \
    --userIds 'ETDPmvCA' \
    > test.out 2>&1
eval_tap $? 68 'BulkFetchStatItems1' test.out

#- 69 PublicBulkIncUserStatItem
./ng net.accelbyte.sdk.cli.Main social publicBulkIncUserStatItem \
    --namespace "$AB_NAMESPACE" \
    --body '[{"inc": 0.1187257451150735, "statCode": "IwYByDZs", "userId": "KgUyJa1j"}, {"inc": 0.40919009046195143, "statCode": "SPFj2PF9", "userId": "7YhpHojO"}, {"inc": 0.3092127417995284, "statCode": "ttqr0Uxb", "userId": "7zIZEmKU"}]' \
    > test.out 2>&1
eval_tap $? 69 'PublicBulkIncUserStatItem' test.out

#- 70 PublicBulkIncUserStatItemValue
./ng net.accelbyte.sdk.cli.Main social publicBulkIncUserStatItemValue \
    --namespace "$AB_NAMESPACE" \
    --body '[{"inc": 0.6360077636775843, "statCode": "Os4AJT8F", "userId": "8x8e4vCR"}, {"inc": 0.22875114321760182, "statCode": "qATAX6ND", "userId": "zsFmvWkj"}, {"inc": 0.11548718935984015, "statCode": "Sobjqymh", "userId": "hETXd3YX"}]' \
    > test.out 2>&1
eval_tap $? 70 'PublicBulkIncUserStatItemValue' test.out

#- 71 BulkResetUserStatItem2
./ng net.accelbyte.sdk.cli.Main social bulkResetUserStatItem2 \
    --namespace "$AB_NAMESPACE" \
    --body '[{"statCode": "rz0x0Euo", "userId": "4lHNRH9N"}, {"statCode": "kT9ss0fc", "userId": "3lEpnPCi"}, {"statCode": "bEve73GX", "userId": "Ud35ynxS"}]' \
    > test.out 2>&1
eval_tap $? 71 'BulkResetUserStatItem2' test.out

#- 72 CreateStat1
./ng net.accelbyte.sdk.cli.Main social createStat1 \
    --namespace "$AB_NAMESPACE" \
    --body '{"capCycleOverride": true, "cycleIds": ["IFzFZUgc", "tVu91H35", "vnwt4t0M"], "cycleOverrides": [{"cycleId": "FTP7WHsl", "maximum": 0.05378303671954676, "minimum": 0.5749230045877668}, {"cycleId": "XpeMRpYs", "maximum": 0.6562799358022549, "minimum": 0.189970555345243}, {"cycleId": "DQFNpEsa", "maximum": 0.46737776897328775, "minimum": 0.573406237770287}], "defaultValue": 0.9761479225067753, "description": "Ql0FP7rK", "globalAggregationMethod": "TOTAL", "ignoreAdditionalDataOnValueRejected": false, "incrementOnly": true, "isPublic": false, "maximum": 0.23899860669182804, "minimum": 0.06896199022007043, "name": "N3RRf9T0", "setAsGlobal": true, "setBy": "SERVER", "statCode": "ZtDX9Srg", "tags": ["Bhb0M1vC", "SFHMzL7d", "m4aghiFf"], "visibility": "SERVERONLY"}' \
    > test.out 2>&1
eval_tap $? 72 'CreateStat1' test.out

#- 73 PublicListMyStatCycleItems
./ng net.accelbyte.sdk.cli.Main social publicListMyStatCycleItems \
    --cycleId '9MhZjNls' \
    --namespace "$AB_NAMESPACE" \
    --limit '26' \
    --offset '36' \
    --sortBy 'ihMpTyiW' \
    --statCodes '4tU48Pac,gMuG3VAX,CxfvbBnG' \
    > test.out 2>&1
eval_tap $? 73 'PublicListMyStatCycleItems' test.out

#- 74 PublicListMyStatItems
./ng net.accelbyte.sdk.cli.Main social publicListMyStatItems \
    --namespace "$AB_NAMESPACE" \
    --limit '69' \
    --offset '91' \
    --sortBy 'U2kCUIaL' \
    --statCodes '6mJo6HXm,oV9k5brQ,l2I0phmp' \
    --tags 'ck9sEuKq,bTM8yyfj,JVWFze2T' \
    > test.out 2>&1
eval_tap $? 74 'PublicListMyStatItems' test.out

#- 75 PublicListAllMyStatItems
./ng net.accelbyte.sdk.cli.Main social publicListAllMyStatItems \
    --namespace "$AB_NAMESPACE" \
    --additionalKey 'UQZsnuwA' \
    --statCodes 'AZABi3dk,IRmkMfnc,jwQpr8EW' \
    --tags 'yzfZxu8k,9bTAFTza,iREwncT3' \
    > test.out 2>&1
eval_tap $? 75 'PublicListAllMyStatItems' test.out

#- 76 GetUserStatCycleItems1
./ng net.accelbyte.sdk.cli.Main social getUserStatCycleItems1 \
    --cycleId 'iFo10Wjp' \
    --namespace "$AB_NAMESPACE" \
    --userId 'FLd4rvtg' \
    --limit '37' \
    --offset '96' \
    --sortBy 'ITRFo4Ih' \
    --statCodes '7kcCD9Aa' \
    > test.out 2>&1
eval_tap $? 76 'GetUserStatCycleItems1' test.out

#- 77 PublicQueryUserStatItems1
./ng net.accelbyte.sdk.cli.Main social publicQueryUserStatItems1 \
    --namespace "$AB_NAMESPACE" \
    --userId 'JKJMlGPi' \
    --limit '38' \
    --offset '2' \
    --sortBy 'jJhXittp' \
    --statCodes 'mu2KkCGe' \
    --tags 'IZgH6oD6' \
    > test.out 2>&1
eval_tap $? 77 'PublicQueryUserStatItems1' test.out

#- 78 PublicBulkCreateUserStatItems
./ng net.accelbyte.sdk.cli.Main social publicBulkCreateUserStatItems \
    --namespace "$AB_NAMESPACE" \
    --userId 'uIcPWxbk' \
    --body '[{"statCode": "NwF4bHJC"}, {"statCode": "5mv9Oyy3"}, {"statCode": "KyS5FSA8"}]' \
    > test.out 2>&1
eval_tap $? 78 'PublicBulkCreateUserStatItems' test.out

#- 79 PublicQueryUserStatItems
./ng net.accelbyte.sdk.cli.Main social publicQueryUserStatItems \
    --namespace "$AB_NAMESPACE" \
    --userId 'f9HE4A8s' \
    --additionalKey 'h205K7Gd' \
    --statCodes '8qN6ntMR,9lagWsRi,MfcftiCA' \
    --tags 'yM7OhfAZ,MLZvgKGH,TXSJymTX' \
    > test.out 2>&1
eval_tap $? 79 'PublicQueryUserStatItems' test.out

#- 80 PublicBulkIncUserStatItem1
./ng net.accelbyte.sdk.cli.Main social publicBulkIncUserStatItem1 \
    --namespace "$AB_NAMESPACE" \
    --userId '5NQQdpmu' \
    --body '[{"inc": 0.4196120103240951, "statCode": "qdQjfzGQ"}, {"inc": 0.46191096825430256, "statCode": "yp4Wx60j"}, {"inc": 0.9437765446148518, "statCode": "MYGAMdjK"}]' \
    > test.out 2>&1
eval_tap $? 80 'PublicBulkIncUserStatItem1' test.out

#- 81 BulkIncUserStatItemValue2
./ng net.accelbyte.sdk.cli.Main social bulkIncUserStatItemValue2 \
    --namespace "$AB_NAMESPACE" \
    --userId 'jAMFmLIv' \
    --body '[{"inc": 0.09674845742648508, "statCode": "lmYzZ50j"}, {"inc": 0.8608829692008098, "statCode": "N90fum90"}, {"inc": 0.19960619303409255, "statCode": "M5bAIdLz"}]' \
    > test.out 2>&1
eval_tap $? 81 'BulkIncUserStatItemValue2' test.out

#- 82 BulkResetUserStatItem3
./ng net.accelbyte.sdk.cli.Main social bulkResetUserStatItem3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'Lej7MtME' \
    --body '[{"statCode": "XBuSSZ6Q"}, {"statCode": "GPAbCGzW"}, {"statCode": "fM4hAnaO"}]' \
    > test.out 2>&1
eval_tap $? 82 'BulkResetUserStatItem3' test.out

#- 83 PublicCreateUserStatItem
./ng net.accelbyte.sdk.cli.Main social publicCreateUserStatItem \
    --namespace "$AB_NAMESPACE" \
    --statCode 'QWGq3Oox' \
    --userId 's7V0To5J' \
    > test.out 2>&1
eval_tap $? 83 'PublicCreateUserStatItem' test.out

#- 84 DeleteUserStatItems1
./ng net.accelbyte.sdk.cli.Main social deleteUserStatItems1 \
    --namespace "$AB_NAMESPACE" \
    --statCode 'VHUwTmOs' \
    --userId 'rEFaf813' \
    > test.out 2>&1
eval_tap $? 84 'DeleteUserStatItems1' test.out

#- 85 PublicIncUserStatItem
./ng net.accelbyte.sdk.cli.Main social publicIncUserStatItem \
    --namespace "$AB_NAMESPACE" \
    --statCode 'iz5PulQe' \
    --userId '409MpgBH' \
    --body '{"inc": 0.8562001123864367}' \
    > test.out 2>&1
eval_tap $? 85 'PublicIncUserStatItem' test.out

#- 86 PublicIncUserStatItemValue
./ng net.accelbyte.sdk.cli.Main social publicIncUserStatItemValue \
    --namespace "$AB_NAMESPACE" \
    --statCode 'F3AgeoCO' \
    --userId 'YmXX9XL8' \
    --body '{"inc": 0.26935249671699013}' \
    > test.out 2>&1
eval_tap $? 86 'PublicIncUserStatItemValue' test.out

#- 87 ResetUserStatItemValue1
./ng net.accelbyte.sdk.cli.Main social resetUserStatItemValue1 \
    --namespace "$AB_NAMESPACE" \
    --statCode 'Vci3oMED' \
    --userId 'vW1x2pKH' \
    > test.out 2>&1
eval_tap $? 87 'ResetUserStatItemValue1' test.out

#- 88 BulkUpdateUserStatItemV2
./ng net.accelbyte.sdk.cli.Main social bulkUpdateUserStatItemV2 \
    --namespace "$AB_NAMESPACE" \
    --body '[{"additionalData": {"6OWEKN1M": {}, "kzF6s6yO": {}, "Frr0jeVq": {}}, "additionalKey": "V0yeAmMU", "statCode": "TYJVVq6j", "updateStrategy": "OVERRIDE", "userId": "A1EEjDaY", "value": 0.09079408349173479}, {"additionalData": {"w8LIBtEp": {}, "W88WX1Po": {}, "VBEfPltJ": {}}, "additionalKey": "g7xMyeGm", "statCode": "JhU3EvUl", "updateStrategy": "INCREMENT", "userId": "Y2lPA6wU", "value": 0.9884702194319861}, {"additionalData": {"OaOGU7gQ": {}, "jI7IlCnS": {}, "wZsriw6Z": {}}, "additionalKey": "LQPy7Je8", "statCode": "IDiZnamU", "updateStrategy": "MIN", "userId": "iroyt4bA", "value": 0.2955072217641391}]' \
    > test.out 2>&1
eval_tap $? 88 'BulkUpdateUserStatItemV2' test.out

#- 89 BulkFetchOrDefaultStatItems1
./ng net.accelbyte.sdk.cli.Main social bulkFetchOrDefaultStatItems1 \
    --namespace "$AB_NAMESPACE" \
    --additionalKey 'ihDEsVik' \
    --statCode '2E46OI77' \
    --userIds '1msHCSHG,RXaOi80U,MtUeOUh1' \
    > test.out 2>&1
eval_tap $? 89 'BulkFetchOrDefaultStatItems1' test.out

#- 90 AdminListUsersStatItems
./ng net.accelbyte.sdk.cli.Main social adminListUsersStatItems \
    --namespace "$AB_NAMESPACE" \
    --userId 'Nezogjh8' \
    --additionalKey 'saMU2J1T' \
    --statCodes 'rQrzR0cy,rnhjnY3a,7uGNMSNN' \
    --tags 'YQiJNk1V,n6efG7Tg,D2Ehmg27' \
    > test.out 2>&1
eval_tap $? 90 'AdminListUsersStatItems' test.out

#- 91 BulkUpdateUserStatItem
./ng net.accelbyte.sdk.cli.Main social bulkUpdateUserStatItem \
    --namespace "$AB_NAMESPACE" \
    --userId 'AOsKyzYz' \
    --additionalKey 'Uvtp2LuS' \
    --body '[{"additionalData": {"LQdOlWyD": {}, "mdyls2pv": {}, "4UgNDowK": {}}, "statCode": "J9eJqt8I", "updateStrategy": "MAX", "value": 0.1910566271823052}, {"additionalData": {"kY7Kwf5A": {}, "pai7yEiX": {}, "NsCRhEQq": {}}, "statCode": "6b3yQ0fd", "updateStrategy": "INCREMENT", "value": 0.1394653278064676}, {"additionalData": {"UX8oPL5M": {}, "WFaOFJu1": {}, "bU18DWyF": {}}, "statCode": "AhjKPqbT", "updateStrategy": "OVERRIDE", "value": 0.28272610849163304}]' \
    > test.out 2>&1
eval_tap $? 91 'BulkUpdateUserStatItem' test.out

#- 92 BulkGetOrDefaultByUserId
./ng net.accelbyte.sdk.cli.Main social bulkGetOrDefaultByUserId \
    --namespace "$AB_NAMESPACE" \
    --userId '3ydZ6bfG' \
    --additionalKey 'DN7OLM1G' \
    --body '{"statCodes": ["10MzvOH9", "dMrvyGQQ", "aYaxXiOJ"]}' \
    > test.out 2>&1
eval_tap $? 92 'BulkGetOrDefaultByUserId' test.out

#- 93 BulkResetUserStatItemValues
./ng net.accelbyte.sdk.cli.Main social bulkResetUserStatItemValues \
    --namespace "$AB_NAMESPACE" \
    --userId 'bJr6eGgn' \
    --additionalKey 'AjVgdl85' \
    --body '[{"additionalData": {"6ogg5P4D": {}, "Z3Tpwfrb": {}, "SBzXN8rq": {}}, "statCode": "5TMwVvXs"}, {"additionalData": {"LPOL4cuk": {}, "ecHoXn8r": {}, "uFFmHqtO": {}}, "statCode": "B6GQUgWk"}, {"additionalData": {"ovmsIQ1M": {}, "k1ATKbNa": {}, "YdevRrZP": {}}, "statCode": "xq2SOjKY"}]' \
    > test.out 2>&1
eval_tap $? 93 'BulkResetUserStatItemValues' test.out

#- 94 DeleteUserStatItems2
./ng net.accelbyte.sdk.cli.Main social deleteUserStatItems2 \
    --namespace "$AB_NAMESPACE" \
    --statCode 'jeFENIOd' \
    --userId '4SXd7vWX' \
    --additionalKey 'VoXfAYMk' \
    > test.out 2>&1
eval_tap $? 94 'DeleteUserStatItems2' test.out

#- 95 UpdateUserStatItemValue
./ng net.accelbyte.sdk.cli.Main social updateUserStatItemValue \
    --namespace "$AB_NAMESPACE" \
    --statCode 'oMY5rAKY' \
    --userId '1ZFQVhd1' \
    --additionalKey 'xahdatqX' \
    --body '{"additionalData": {"bvzKSH1R": {}, "LH9O2sJf": {}, "41PCimIY": {}}, "updateStrategy": "MAX", "value": 0.9501472062255486}' \
    > test.out 2>&1
eval_tap $? 95 'UpdateUserStatItemValue' test.out

#- 96 BulkUpdateUserStatItem1
./ng net.accelbyte.sdk.cli.Main social bulkUpdateUserStatItem1 \
    --namespace "$AB_NAMESPACE" \
    --body '[{"additionalData": {"CX2hAYpJ": {}, "rB8GTgih": {}, "TjUF5dmL": {}}, "additionalKey": "nLrRnUSs", "statCode": "nK11Hdlh", "updateStrategy": "INCREMENT", "userId": "ci5Z0iNM", "value": 0.9290207208743048}, {"additionalData": {"SIMsAh46": {}, "w8rqwO4k": {}, "OIHRKI8v": {}}, "additionalKey": "uYSUprG6", "statCode": "Oa6ZFuxw", "updateStrategy": "MIN", "userId": "yy0a56iK", "value": 0.5288852785843783}, {"additionalData": {"JLdI1JGq": {}, "76NZ8lir": {}, "HgwwNC6t": {}}, "additionalKey": "dkWwzRrJ", "statCode": "n88EEgBM", "updateStrategy": "MAX", "userId": "oTBmpHQj", "value": 0.15261730254540884}]' \
    > test.out 2>&1
eval_tap $? 96 'BulkUpdateUserStatItem1' test.out

#- 97 PublicQueryUserStatItems2
./ng net.accelbyte.sdk.cli.Main social publicQueryUserStatItems2 \
    --namespace "$AB_NAMESPACE" \
    --userId 'zaZNee3k' \
    --additionalKey 'W2r6Ju6U' \
    --statCodes 'zMH0tE0q,bl64ARWr,daS8PD5U' \
    --tags 'iaKrB3zE,OreQCoGq,D7AxkUpr' \
    > test.out 2>&1
eval_tap $? 97 'PublicQueryUserStatItems2' test.out

#- 98 BulkUpdateUserStatItem2
./ng net.accelbyte.sdk.cli.Main social bulkUpdateUserStatItem2 \
    --namespace "$AB_NAMESPACE" \
    --userId 'Iy0pqnl8' \
    --additionalKey 'wq6V5s17' \
    --body '[{"additionalData": {"ORbEocMQ": {}, "29iCl0az": {}, "dOmsZ1yW": {}}, "statCode": "OlmpNSpU", "updateStrategy": "MIN", "value": 0.024582009698882024}, {"additionalData": {"KCTzYHEQ": {}, "YYDxjEdh": {}, "zNMsA0jO": {}}, "statCode": "ttH2slry", "updateStrategy": "MAX", "value": 0.8155166808772959}, {"additionalData": {"0085ZpLq": {}, "5EDAq9j9": {}, "o5gV0yYk": {}}, "statCode": "4aNiPaeh", "updateStrategy": "MAX", "value": 0.4598347687064619}]' \
    > test.out 2>&1
eval_tap $? 98 'BulkUpdateUserStatItem2' test.out

#- 99 UpdateUserStatItemValue1
./ng net.accelbyte.sdk.cli.Main social updateUserStatItemValue1 \
    --namespace "$AB_NAMESPACE" \
    --statCode 'XIwWoPa7' \
    --userId 'NvWA07c0' \
    --additionalKey 'QoDH4Fcu' \
    --body '{"additionalData": {"N6tlGLo5": {}, "nfcV1i8G": {}, "Az397u0s": {}}, "updateStrategy": "MAX", "value": 0.26782323180191736}' \
    > test.out 2>&1
eval_tap $? 99 'UpdateUserStatItemValue1' test.out


rm -f "tmp.dat"

exit $EXIT_CODE