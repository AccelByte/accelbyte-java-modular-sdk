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
    --userId '0KuQs6GR' \
    > test.out 2>&1
eval_tap $? 8 'GetUserProfiles' test.out

#- 9 GetProfile
./ng net.accelbyte.sdk.cli.Main social getProfile \
    --namespace "$AB_NAMESPACE" \
    --profileId '9Y914L1z' \
    --userId '5U1txsh0' \
    > test.out 2>&1
eval_tap $? 9 'GetProfile' test.out

#- 10 GetUserNamespaceSlots
eval_tap 0 10 'GetUserNamespaceSlots # SKIP deprecated' test.out

#- 11 GetSlotData
eval_tap 0 11 'GetSlotData # SKIP deprecated' test.out

#- 12 PublicGetUserGameProfiles
./ng net.accelbyte.sdk.cli.Main social publicGetUserGameProfiles \
    --namespace "$AB_NAMESPACE" \
    --userIds 'YvApYjKD,8Uoe1Bmc,EiHrOWfh' \
    > test.out 2>&1
eval_tap $? 12 'PublicGetUserGameProfiles' test.out

#- 13 PublicGetUserProfiles
./ng net.accelbyte.sdk.cli.Main social publicGetUserProfiles \
    --namespace "$AB_NAMESPACE" \
    --userId 'mp5Ure32' \
    > test.out 2>&1
eval_tap $? 13 'PublicGetUserProfiles' test.out

#- 14 PublicCreateProfile
./ng net.accelbyte.sdk.cli.Main social publicCreateProfile \
    --namespace "$AB_NAMESPACE" \
    --userId 'LSVhYtEF' \
    --body '{"achievements": ["BRUKhN7i", "OUS9gjoX", "6iB48Myl"], "attributes": {"7RW5RjS0": "fajQ5p17", "lvsmxXC1": "eSGCrjWJ", "nUogAItK": "ONtHPzAU"}, "avatarUrl": "EbGVx8Jc", "inventories": ["xm3tuOWz", "oeyTc2bP", "pVgHzoV8"], "label": "YqmAgjSm", "profileName": "kfT2DssJ", "statistics": ["Ol16myIK", "HY9letLI", "76kZ1M0S"], "tags": ["KzgkAAEH", "2hPquyPM", "dOABcpwh"]}' \
    > test.out 2>&1
eval_tap $? 14 'PublicCreateProfile' test.out

#- 15 PublicGetProfile
./ng net.accelbyte.sdk.cli.Main social publicGetProfile \
    --namespace "$AB_NAMESPACE" \
    --profileId 'HaqrfRb4' \
    --userId 'XQCZrYEE' \
    > test.out 2>&1
eval_tap $? 15 'PublicGetProfile' test.out

#- 16 PublicUpdateProfile
./ng net.accelbyte.sdk.cli.Main social publicUpdateProfile \
    --namespace "$AB_NAMESPACE" \
    --profileId 'H7LdDn14' \
    --userId 'wCY5Wsct' \
    --body '{"achievements": ["axixHNuN", "n5wmeNkE", "E1BfLx5f"], "attributes": {"ZCIBGFmZ": "0vBhM5Wp", "mLahvA4T": "xvtdvaJl", "5kwePVd2": "0bjX6ynP"}, "avatarUrl": "7fMzFA3U", "inventories": ["oYmHWjCb", "qEMnWvuF", "bE0MMxEj"], "label": "219Wsb1M", "profileName": "nU70bCvh", "statistics": ["v3aw7wPm", "y1Li2W9T", "iJzRQFAq"], "tags": ["LPkp4iiw", "xFp4vRVf", "dXVmhXKZ"]}' \
    > test.out 2>&1
eval_tap $? 16 'PublicUpdateProfile' test.out

#- 17 PublicDeleteProfile
./ng net.accelbyte.sdk.cli.Main social publicDeleteProfile \
    --namespace "$AB_NAMESPACE" \
    --profileId 'Ke6Cpk77' \
    --userId 'OJfBmJJ5' \
    > test.out 2>&1
eval_tap $? 17 'PublicDeleteProfile' test.out

#- 18 PublicGetProfileAttribute
./ng net.accelbyte.sdk.cli.Main social publicGetProfileAttribute \
    --attributeName '47neFYVK' \
    --namespace "$AB_NAMESPACE" \
    --profileId 'jHbn6q0O' \
    --userId '9XqiCwHs' \
    > test.out 2>&1
eval_tap $? 18 'PublicGetProfileAttribute' test.out

#- 19 PublicUpdateAttribute
./ng net.accelbyte.sdk.cli.Main social publicUpdateAttribute \
    --attributeName '3NFENygh' \
    --namespace "$AB_NAMESPACE" \
    --profileId 'e0P2QvMF' \
    --userId 'frzH6X1g' \
    --body '{"name": "t4gLXgKw", "value": "wiZHjJko"}' \
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
    --limit '6' \
    --offset '30' \
    --statCodes 'g2U87Anw' \
    > test.out 2>&1
eval_tap $? 26 'GetGlobalStatItems' test.out

#- 27 GetGlobalStatItemByStatCode
./ng net.accelbyte.sdk.cli.Main social getGlobalStatItemByStatCode \
    --namespace "$AB_NAMESPACE" \
    --statCode 'fLfCte9I' \
    > test.out 2>&1
eval_tap $? 27 'GetGlobalStatItemByStatCode' test.out

#- 28 GetStatCycles
./ng net.accelbyte.sdk.cli.Main social getStatCycles \
    --namespace "$AB_NAMESPACE" \
    --cycleType 'ANNUALLY' \
    --limit '81' \
    --name 'kJE9gYZA' \
    --offset '71' \
    --sortBy 'DjUMGxvv' \
    --status 'INIT' \
    > test.out 2>&1
eval_tap $? 28 'GetStatCycles' test.out

#- 29 CreateStatCycle
./ng net.accelbyte.sdk.cli.Main social createStatCycle \
    --namespace "$AB_NAMESPACE" \
    --body '{"cycleType": "MONTHLY", "description": "9kb5CDa5", "end": "1988-04-01T00:00:00Z", "name": "45wLfSWQ", "resetDate": 75, "resetDay": 1, "resetMonth": 41, "resetTime": "hgcvszEM", "seasonPeriod": 27, "start": "1986-03-13T00:00:00Z"}' \
    > test.out 2>&1
eval_tap $? 29 'CreateStatCycle' test.out

#- 30 BulkGetStatCycle
./ng net.accelbyte.sdk.cli.Main social bulkGetStatCycle \
    --namespace "$AB_NAMESPACE" \
    --body '{"cycleIds": ["Lj0n3sZ7", "8u8pK148", "fCtR8KyI"]}' \
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
    --cycleId '1IxHHGQL' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 33 'GetStatCycle' test.out

#- 34 UpdateStatCycle
./ng net.accelbyte.sdk.cli.Main social updateStatCycle \
    --cycleId 'KuPLxfh0' \
    --namespace "$AB_NAMESPACE" \
    --body '{"cycleType": "ANNUALLY", "description": "EAmj4FSe", "end": "1989-05-06T00:00:00Z", "name": "BWouQV8l", "resetDate": 63, "resetDay": 7, "resetMonth": 65, "resetTime": "h6iSIaH7", "seasonPeriod": 87, "start": "1986-04-02T00:00:00Z"}' \
    > test.out 2>&1
eval_tap $? 34 'UpdateStatCycle' test.out

#- 35 DeleteStatCycle
./ng net.accelbyte.sdk.cli.Main social deleteStatCycle \
    --cycleId 'kGwRl3QF' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 35 'DeleteStatCycle' test.out

#- 36 BulkAddStats
./ng net.accelbyte.sdk.cli.Main social bulkAddStats \
    --cycleId 'JYJTFs7c' \
    --namespace "$AB_NAMESPACE" \
    --body '{"statCodes": ["pEj2Zegj", "R33uGJtc", "p1BefM1v"]}' \
    > test.out 2>&1
eval_tap $? 36 'BulkAddStats' test.out

#- 37 StopStatCycle
./ng net.accelbyte.sdk.cli.Main social stopStatCycle \
    --cycleId 'Ctq0aMhY' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 37 'StopStatCycle' test.out

#- 38 BulkFetchStatItems
./ng net.accelbyte.sdk.cli.Main social bulkFetchStatItems \
    --namespace "$AB_NAMESPACE" \
    --statCode '8Ly5C28T' \
    --userIds 'VlEbQWVg' \
    > test.out 2>&1
eval_tap $? 38 'BulkFetchStatItems' test.out

#- 39 BulkIncUserStatItem
./ng net.accelbyte.sdk.cli.Main social bulkIncUserStatItem \
    --namespace "$AB_NAMESPACE" \
    --body '[{"inc": 0.11391595742053406, "statCode": "42w3sSKt", "userId": "e5AU1RU9"}, {"inc": 0.8262283123657117, "statCode": "H66jF3tp", "userId": "8XhrSomS"}, {"inc": 0.7774582008902647, "statCode": "us7Rd2t4", "userId": "A1WCW6o0"}]' \
    > test.out 2>&1
eval_tap $? 39 'BulkIncUserStatItem' test.out

#- 40 BulkIncUserStatItemValue
./ng net.accelbyte.sdk.cli.Main social bulkIncUserStatItemValue \
    --namespace "$AB_NAMESPACE" \
    --body '[{"inc": 0.291948238731348, "statCode": "J3oAmP9u", "userId": "oz2Oq9sa"}, {"inc": 0.3887306790613938, "statCode": "OS4hQBnO", "userId": "1adT317O"}, {"inc": 0.5600374824948077, "statCode": "joyKO5CM", "userId": "3C7rs0gC"}]' \
    > test.out 2>&1
eval_tap $? 40 'BulkIncUserStatItemValue' test.out

#- 41 BulkFetchOrDefaultStatItems
./ng net.accelbyte.sdk.cli.Main social bulkFetchOrDefaultStatItems \
    --namespace "$AB_NAMESPACE" \
    --statCode 'DYmNyOzR' \
    --userIds 'crewd7nn,8H20JZ1l,Cyknnfrq' \
    > test.out 2>&1
eval_tap $? 41 'BulkFetchOrDefaultStatItems' test.out

#- 42 BulkResetUserStatItem
./ng net.accelbyte.sdk.cli.Main social bulkResetUserStatItem \
    --namespace "$AB_NAMESPACE" \
    --body '[{"statCode": "IKZQybWD", "userId": "heInyGGW"}, {"statCode": "oUMqjGmc", "userId": "1gx5JUbg"}, {"statCode": "JA5EavAq", "userId": "IFujMSiA"}]' \
    > test.out 2>&1
eval_tap $? 42 'BulkResetUserStatItem' test.out

#- 43 GetStats
./ng net.accelbyte.sdk.cli.Main social getStats \
    --namespace "$AB_NAMESPACE" \
    --cycleIds 'OnxlerWf' \
    --isGlobal  \
    --isPublic  \
    --limit '58' \
    --offset '78' \
    > test.out 2>&1
eval_tap $? 43 'GetStats' test.out

#- 44 CreateStat
./ng net.accelbyte.sdk.cli.Main social createStat \
    --namespace "$AB_NAMESPACE" \
    --body '{"cycleIds": ["iM3k1l1Y", "qydJJFAp", "mlzEKFuT"], "defaultValue": 0.20784816963488884, "description": "QTCjLTsn", "globalAggregationMethod": "LAST", "ignoreAdditionalDataOnValueRejected": true, "incrementOnly": true, "isPublic": true, "maximum": 0.6787630018793005, "minimum": 0.8614625601613296, "name": "9924771v", "setAsGlobal": false, "setBy": "CLIENT", "statCode": "ezW2SZb1", "tags": ["hPLe0veO", "NKf7SaUh", "g1x3NY87"]}' \
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
    --limit '100' \
    --offset '53' \
    --keyword 'YQENlcLU' \
    > test.out 2>&1
eval_tap $? 47 'QueryStats' test.out

#- 48 GetStat
./ng net.accelbyte.sdk.cli.Main social getStat \
    --namespace "$AB_NAMESPACE" \
    --statCode 'TLeMWOpu' \
    > test.out 2>&1
eval_tap $? 48 'GetStat' test.out

#- 49 DeleteStat
./ng net.accelbyte.sdk.cli.Main social deleteStat \
    --namespace "$AB_NAMESPACE" \
    --statCode 'H3o9qZr3' \
    > test.out 2>&1
eval_tap $? 49 'DeleteStat' test.out

#- 50 UpdateStat
./ng net.accelbyte.sdk.cli.Main social updateStat \
    --namespace "$AB_NAMESPACE" \
    --statCode '9wxWDlsn' \
    --body '{"cycleIds": ["Kil1OVWY", "lZ3za4Nb", "heaFJKOm"], "defaultValue": 0.9440048040231643, "description": "l5NFjoYE", "globalAggregationMethod": "MIN", "ignoreAdditionalDataOnValueRejected": true, "isPublic": false, "name": "oIGbjf5A", "tags": ["AGwJeSWQ", "RxGMdgn3", "KFOmuEEW"]}' \
    > test.out 2>&1
eval_tap $? 50 'UpdateStat' test.out

#- 51 GetStatItems
./ng net.accelbyte.sdk.cli.Main social getStatItems \
    --namespace "$AB_NAMESPACE" \
    --statCode 'BV7wqZTz' \
    --limit '56' \
    --offset '83' \
    --sortBy 's4bZI2JE' \
    > test.out 2>&1
eval_tap $? 51 'GetStatItems' test.out

#- 52 DeleteTiedStat
./ng net.accelbyte.sdk.cli.Main social deleteTiedStat \
    --namespace "$AB_NAMESPACE" \
    --statCode 'IqDmp7SM' \
    > test.out 2>&1
eval_tap $? 52 'DeleteTiedStat' test.out

#- 53 GetUserStatCycleItems
./ng net.accelbyte.sdk.cli.Main social getUserStatCycleItems \
    --cycleId 'kP4bxdxE' \
    --namespace "$AB_NAMESPACE" \
    --userId '81vhlQv9' \
    --isPublic  \
    --limit '35' \
    --offset '18' \
    --sortBy 'a0FNarrL' \
    --statCodes 'f3xggsyI' \
    > test.out 2>&1
eval_tap $? 53 'GetUserStatCycleItems' test.out

#- 54 GetUserStatItems
./ng net.accelbyte.sdk.cli.Main social getUserStatItems \
    --namespace "$AB_NAMESPACE" \
    --userId '3FPA9Cqq' \
    --isPublic  \
    --limit '86' \
    --offset '28' \
    --sortBy 'axQppkSC' \
    --statCodes 'yCfkSyp9' \
    --tags 'FIbQUFX0' \
    > test.out 2>&1
eval_tap $? 54 'GetUserStatItems' test.out

#- 55 BulkCreateUserStatItems
./ng net.accelbyte.sdk.cli.Main social bulkCreateUserStatItems \
    --namespace "$AB_NAMESPACE" \
    --userId 'jSjDhAI3' \
    --body '[{"statCode": "JeHQhbTy"}, {"statCode": "t5nJXjsz"}, {"statCode": "8R8wjRAy"}]' \
    > test.out 2>&1
eval_tap $? 55 'BulkCreateUserStatItems' test.out

#- 56 BulkIncUserStatItem1
./ng net.accelbyte.sdk.cli.Main social bulkIncUserStatItem1 \
    --namespace "$AB_NAMESPACE" \
    --userId '6GkQeuol' \
    --body '[{"inc": 0.010142281013784782, "statCode": "rotpY3Uz"}, {"inc": 0.379304502124986, "statCode": "4cU6MB5D"}, {"inc": 0.5930269689369635, "statCode": "GEHIG4tE"}]' \
    > test.out 2>&1
eval_tap $? 56 'BulkIncUserStatItem1' test.out

#- 57 BulkIncUserStatItemValue1
./ng net.accelbyte.sdk.cli.Main social bulkIncUserStatItemValue1 \
    --namespace "$AB_NAMESPACE" \
    --userId 'i87g5EiE' \
    --body '[{"inc": 0.3794538252795099, "statCode": "ztbM0PJY"}, {"inc": 0.2698285502133938, "statCode": "rRWu5w50"}, {"inc": 0.5302516521507824, "statCode": "tiSIRZgB"}]' \
    > test.out 2>&1
eval_tap $? 57 'BulkIncUserStatItemValue1' test.out

#- 58 BulkResetUserStatItem1
./ng net.accelbyte.sdk.cli.Main social bulkResetUserStatItem1 \
    --namespace "$AB_NAMESPACE" \
    --userId '0Ij6h4wA' \
    --body '[{"statCode": "3vKrwmKC"}, {"statCode": "w8UnzQ7L"}, {"statCode": "QhyhKcrI"}]' \
    > test.out 2>&1
eval_tap $? 58 'BulkResetUserStatItem1' test.out

#- 59 CreateUserStatItem
./ng net.accelbyte.sdk.cli.Main social createUserStatItem \
    --namespace "$AB_NAMESPACE" \
    --statCode 'T2xRluUR' \
    --userId 'FLiWaP9C' \
    > test.out 2>&1
eval_tap $? 59 'CreateUserStatItem' test.out

#- 60 DeleteUserStatItems
./ng net.accelbyte.sdk.cli.Main social deleteUserStatItems \
    --namespace "$AB_NAMESPACE" \
    --statCode 'BH6p5cPV' \
    --userId 'gNS6g1Vs' \
    > test.out 2>&1
eval_tap $? 60 'DeleteUserStatItems' test.out

#- 61 IncUserStatItemValue
./ng net.accelbyte.sdk.cli.Main social incUserStatItemValue \
    --namespace "$AB_NAMESPACE" \
    --statCode 't8YbBn3x' \
    --userId 'MwsZJtRz' \
    --body '{"inc": 0.09309239811566761}' \
    > test.out 2>&1
eval_tap $? 61 'IncUserStatItemValue' test.out

#- 62 ResetUserStatItemValue
./ng net.accelbyte.sdk.cli.Main social resetUserStatItemValue \
    --namespace "$AB_NAMESPACE" \
    --statCode '52JfZxlU' \
    --userId 'IMIonj5q' \
    --additionalKey '7coBkTB9' \
    --body '{"additionalData": {"hnU8ndw1": {}, "axJgAriX": {}, "SlhPcIbP": {}}}' \
    > test.out 2>&1
eval_tap $? 62 'ResetUserStatItemValue' test.out

#- 63 GetGlobalStatItems1
./ng net.accelbyte.sdk.cli.Main social getGlobalStatItems1 \
    --namespace "$AB_NAMESPACE" \
    --limit '8' \
    --offset '12' \
    --statCodes 'tIpesDZm' \
    > test.out 2>&1
eval_tap $? 63 'GetGlobalStatItems1' test.out

#- 64 GetGlobalStatItemByStatCode1
./ng net.accelbyte.sdk.cli.Main social getGlobalStatItemByStatCode1 \
    --namespace "$AB_NAMESPACE" \
    --statCode 'Sxfp0qX4' \
    > test.out 2>&1
eval_tap $? 64 'GetGlobalStatItemByStatCode1' test.out

#- 65 GetStatCycles1
./ng net.accelbyte.sdk.cli.Main social getStatCycles1 \
    --namespace "$AB_NAMESPACE" \
    --cycleType 'WEEKLY' \
    --limit '94' \
    --name 'rjxTKOm5' \
    --offset '23' \
    --sortBy 'vuXxwNSn' \
    --status 'ACTIVE' \
    > test.out 2>&1
eval_tap $? 65 'GetStatCycles1' test.out

#- 66 BulkGetStatCycle1
./ng net.accelbyte.sdk.cli.Main social bulkGetStatCycle1 \
    --namespace "$AB_NAMESPACE" \
    --body '{"cycleIds": ["XVWmE4sJ", "GkvI6jEF", "3fZjUydE"]}' \
    > test.out 2>&1
eval_tap $? 66 'BulkGetStatCycle1' test.out

#- 67 GetStatCycle1
./ng net.accelbyte.sdk.cli.Main social getStatCycle1 \
    --cycleId 'lff0z3IB' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 67 'GetStatCycle1' test.out

#- 68 BulkFetchStatItems1
./ng net.accelbyte.sdk.cli.Main social bulkFetchStatItems1 \
    --namespace "$AB_NAMESPACE" \
    --statCode '4enONiR7' \
    --userIds 'McS428Bq' \
    > test.out 2>&1
eval_tap $? 68 'BulkFetchStatItems1' test.out

#- 69 PublicBulkIncUserStatItem
./ng net.accelbyte.sdk.cli.Main social publicBulkIncUserStatItem \
    --namespace "$AB_NAMESPACE" \
    --body '[{"inc": 0.9523070178687851, "statCode": "QaLywc6U", "userId": "41RJ5QRR"}, {"inc": 0.6911721407788015, "statCode": "yT2lH1Rw", "userId": "oUVQRWZK"}, {"inc": 0.35977026546779156, "statCode": "4KfbY1Ki", "userId": "aRh3vnLJ"}]' \
    > test.out 2>&1
eval_tap $? 69 'PublicBulkIncUserStatItem' test.out

#- 70 PublicBulkIncUserStatItemValue
./ng net.accelbyte.sdk.cli.Main social publicBulkIncUserStatItemValue \
    --namespace "$AB_NAMESPACE" \
    --body '[{"inc": 0.9904468284351704, "statCode": "p7sXUVsp", "userId": "14JaHqkE"}, {"inc": 0.594598523295552, "statCode": "ewEANYCf", "userId": "9LACCjk0"}, {"inc": 0.13668545695450085, "statCode": "swSd9EDx", "userId": "wt2XVX6T"}]' \
    > test.out 2>&1
eval_tap $? 70 'PublicBulkIncUserStatItemValue' test.out

#- 71 BulkResetUserStatItem2
./ng net.accelbyte.sdk.cli.Main social bulkResetUserStatItem2 \
    --namespace "$AB_NAMESPACE" \
    --body '[{"statCode": "Jh3dMP80", "userId": "kBBlNntg"}, {"statCode": "FPmhuV1L", "userId": "9oECvbsx"}, {"statCode": "arLc3s4p", "userId": "mBOap0Gg"}]' \
    > test.out 2>&1
eval_tap $? 71 'BulkResetUserStatItem2' test.out

#- 72 CreateStat1
./ng net.accelbyte.sdk.cli.Main social createStat1 \
    --namespace "$AB_NAMESPACE" \
    --body '{"cycleIds": ["5tnA2Erp", "WwX9rpuV", "4p99k37t"], "defaultValue": 0.47399876642197947, "description": "Xlrm2Ygj", "globalAggregationMethod": "TOTAL", "ignoreAdditionalDataOnValueRejected": false, "incrementOnly": true, "isPublic": false, "maximum": 0.6968761659503742, "minimum": 0.29323971502156654, "name": "YuHCW05W", "setAsGlobal": true, "setBy": "CLIENT", "statCode": "Lwbb83jz", "tags": ["icfdVefi", "opUtPmUW", "Tt6hXnTG"]}' \
    > test.out 2>&1
eval_tap $? 72 'CreateStat1' test.out

#- 73 PublicListMyStatCycleItems
./ng net.accelbyte.sdk.cli.Main social publicListMyStatCycleItems \
    --cycleId 'TZrdIoHa' \
    --namespace "$AB_NAMESPACE" \
    --limit '2' \
    --offset '60' \
    --sortBy 'Vw8s8K5W' \
    --statCodes 'iQZDh1Bz,kdnYwm2R,OPUwCsKP' \
    > test.out 2>&1
eval_tap $? 73 'PublicListMyStatCycleItems' test.out

#- 74 PublicListMyStatItems
./ng net.accelbyte.sdk.cli.Main social publicListMyStatItems \
    --namespace "$AB_NAMESPACE" \
    --limit '87' \
    --offset '13' \
    --sortBy 'EuPkNWFf' \
    --statCodes 'RAfy0puh,Rp1Fmh3n,tlhQ5OWt' \
    --tags '2bvZXgWq,mNtJbB5Q,nqSzClY2' \
    > test.out 2>&1
eval_tap $? 74 'PublicListMyStatItems' test.out

#- 75 PublicListAllMyStatItems
./ng net.accelbyte.sdk.cli.Main social publicListAllMyStatItems \
    --namespace "$AB_NAMESPACE" \
    --additionalKey '0CPy4pYO' \
    --statCodes 'Gp7PDsSm,oEvzlo5F,cXRzphZH' \
    --tags 'MXZ7exGS,mNX8xIkJ,qRIYd51H' \
    > test.out 2>&1
eval_tap $? 75 'PublicListAllMyStatItems' test.out

#- 76 GetUserStatCycleItems1
./ng net.accelbyte.sdk.cli.Main social getUserStatCycleItems1 \
    --cycleId 'aUnubPuV' \
    --namespace "$AB_NAMESPACE" \
    --userId '0vl9ql2v' \
    --limit '57' \
    --offset '73' \
    --sortBy '2bIAi83D' \
    --statCodes 'RtG66YY9' \
    > test.out 2>&1
eval_tap $? 76 'GetUserStatCycleItems1' test.out

#- 77 PublicQueryUserStatItems
./ng net.accelbyte.sdk.cli.Main social publicQueryUserStatItems \
    --namespace "$AB_NAMESPACE" \
    --userId '5D1BnnPa' \
    --limit '3' \
    --offset '36' \
    --sortBy 'nmpnA1ZN' \
    --statCodes 'EljMSk8m' \
    --tags 'FMpRF05z' \
    > test.out 2>&1
eval_tap $? 77 'PublicQueryUserStatItems' test.out

#- 78 PublicBulkCreateUserStatItems
./ng net.accelbyte.sdk.cli.Main social publicBulkCreateUserStatItems \
    --namespace "$AB_NAMESPACE" \
    --userId '4Gu1XHCr' \
    --body '[{"statCode": "hFZQxO7j"}, {"statCode": "BJ5UCiLF"}, {"statCode": "c0nJM61k"}]' \
    > test.out 2>&1
eval_tap $? 78 'PublicBulkCreateUserStatItems' test.out

#- 79 PublicQueryUserStatItems1
./ng net.accelbyte.sdk.cli.Main social publicQueryUserStatItems1 \
    --namespace "$AB_NAMESPACE" \
    --userId '47HPx4v6' \
    --additionalKey 'rCr08XXH' \
    --statCodes 'PiqSCdy3,YIQWCt3c,VRGPZSre' \
    --tags 'DoSv1p2n,X0WvvfZa,Gf7Rf6vN' \
    > test.out 2>&1
eval_tap $? 79 'PublicQueryUserStatItems1' test.out

#- 80 PublicBulkIncUserStatItem1
./ng net.accelbyte.sdk.cli.Main social publicBulkIncUserStatItem1 \
    --namespace "$AB_NAMESPACE" \
    --userId 'yaDnKaLd' \
    --body '[{"inc": 0.6012481114360478, "statCode": "yk1TXj07"}, {"inc": 0.5058142805954738, "statCode": "gw0P8llz"}, {"inc": 0.8928546820431806, "statCode": "ZbavPYOl"}]' \
    > test.out 2>&1
eval_tap $? 80 'PublicBulkIncUserStatItem1' test.out

#- 81 BulkIncUserStatItemValue2
./ng net.accelbyte.sdk.cli.Main social bulkIncUserStatItemValue2 \
    --namespace "$AB_NAMESPACE" \
    --userId 'UIDBmDOI' \
    --body '[{"inc": 0.5004320625163563, "statCode": "r0VLWLZg"}, {"inc": 0.3788490063750176, "statCode": "qZ32IuaT"}, {"inc": 0.6980201566401362, "statCode": "L7ZqHTCy"}]' \
    > test.out 2>&1
eval_tap $? 81 'BulkIncUserStatItemValue2' test.out

#- 82 BulkResetUserStatItem3
./ng net.accelbyte.sdk.cli.Main social bulkResetUserStatItem3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'sCg6jEui' \
    --body '[{"statCode": "EzJeiYx6"}, {"statCode": "pZmRdtZn"}, {"statCode": "gRtqL1tH"}]' \
    > test.out 2>&1
eval_tap $? 82 'BulkResetUserStatItem3' test.out

#- 83 PublicCreateUserStatItem
./ng net.accelbyte.sdk.cli.Main social publicCreateUserStatItem \
    --namespace "$AB_NAMESPACE" \
    --statCode 'H9d8R89p' \
    --userId 'k96rsU92' \
    > test.out 2>&1
eval_tap $? 83 'PublicCreateUserStatItem' test.out

#- 84 DeleteUserStatItems1
./ng net.accelbyte.sdk.cli.Main social deleteUserStatItems1 \
    --namespace "$AB_NAMESPACE" \
    --statCode 'qztYvke4' \
    --userId 'vWiID1q8' \
    > test.out 2>&1
eval_tap $? 84 'DeleteUserStatItems1' test.out

#- 85 PublicIncUserStatItem
./ng net.accelbyte.sdk.cli.Main social publicIncUserStatItem \
    --namespace "$AB_NAMESPACE" \
    --statCode 'lIESKUiM' \
    --userId 'JdRzjsAL' \
    --body '{"inc": 0.24263020602375995}' \
    > test.out 2>&1
eval_tap $? 85 'PublicIncUserStatItem' test.out

#- 86 PublicIncUserStatItemValue
./ng net.accelbyte.sdk.cli.Main social publicIncUserStatItemValue \
    --namespace "$AB_NAMESPACE" \
    --statCode '8gOARKtE' \
    --userId 'sI8d7dxl' \
    --body '{"inc": 0.11665266410229602}' \
    > test.out 2>&1
eval_tap $? 86 'PublicIncUserStatItemValue' test.out

#- 87 ResetUserStatItemValue1
./ng net.accelbyte.sdk.cli.Main social resetUserStatItemValue1 \
    --namespace "$AB_NAMESPACE" \
    --statCode 'OAbXem4b' \
    --userId '0hYycJLg' \
    > test.out 2>&1
eval_tap $? 87 'ResetUserStatItemValue1' test.out

#- 88 BulkUpdateUserStatItemV2
./ng net.accelbyte.sdk.cli.Main social bulkUpdateUserStatItemV2 \
    --namespace "$AB_NAMESPACE" \
    --body '[{"additionalData": {"jkCEdr7S": {}, "0GQtaQxp": {}, "g2ZfCTU3": {}}, "additionalKey": "CSGBJRLU", "statCode": "FU8gDwQa", "updateStrategy": "OVERRIDE", "userId": "9k6EZ2Kf", "value": 0.27094535494677885}, {"additionalData": {"UrIgUbnU": {}, "m0hwusdy": {}, "mDdCqAVd": {}}, "additionalKey": "vNS09PNU", "statCode": "CIja5rE3", "updateStrategy": "MAX", "userId": "irci3n4q", "value": 0.41591570623797725}, {"additionalData": {"P3KcC44d": {}, "CcJFsx4R": {}, "y6yyyPrm": {}}, "additionalKey": "MNErVezu", "statCode": "mwckSjqC", "updateStrategy": "MIN", "userId": "XiNpi8gR", "value": 0.35960356890102685}]' \
    > test.out 2>&1
eval_tap $? 88 'BulkUpdateUserStatItemV2' test.out

#- 89 BulkFetchOrDefaultStatItems1
./ng net.accelbyte.sdk.cli.Main social bulkFetchOrDefaultStatItems1 \
    --namespace "$AB_NAMESPACE" \
    --additionalKey 'OeeClQkJ' \
    --statCode 'dJM4jOTU' \
    --userIds 'VvhjWJOA,8WlmdEe9,rtUa3frO' \
    > test.out 2>&1
eval_tap $? 89 'BulkFetchOrDefaultStatItems1' test.out

#- 90 AdminListUsersStatItems
./ng net.accelbyte.sdk.cli.Main social adminListUsersStatItems \
    --namespace "$AB_NAMESPACE" \
    --userId 'F9Lmii6w' \
    --additionalKey 'BrWg9IDb' \
    --statCodes '5Z2CobUJ,s3rfoChH,ze8Vq3ve' \
    --tags 'AF5Xb7mr,uWgnsctt,kX8eEQwK' \
    > test.out 2>&1
eval_tap $? 90 'AdminListUsersStatItems' test.out

#- 91 BulkUpdateUserStatItem
./ng net.accelbyte.sdk.cli.Main social bulkUpdateUserStatItem \
    --namespace "$AB_NAMESPACE" \
    --userId 'wtkdZEqR' \
    --additionalKey 'dW2IRQw2' \
    --body '[{"additionalData": {"uajKtbgX": {}, "hhDKa1hU": {}, "VhrQAM81": {}}, "statCode": "WRABYS09", "updateStrategy": "MIN", "value": 0.2000248451512504}, {"additionalData": {"LoOaIsyg": {}, "lohvNSzK": {}, "vJYnjJAg": {}}, "statCode": "7impYJuK", "updateStrategy": "INCREMENT", "value": 0.9121226514447489}, {"additionalData": {"9qJy6HPA": {}, "xss5KtYW": {}, "4P9g7wLU": {}}, "statCode": "TveCocwQ", "updateStrategy": "MAX", "value": 0.26318719644412025}]' \
    > test.out 2>&1
eval_tap $? 91 'BulkUpdateUserStatItem' test.out

#- 92 BulkResetUserStatItemValues
./ng net.accelbyte.sdk.cli.Main social bulkResetUserStatItemValues \
    --namespace "$AB_NAMESPACE" \
    --userId 'XfUGsWyu' \
    --additionalKey 'yv4fkrV5' \
    --body '[{"additionalData": {"6tQ0lYZk": {}, "NOjZ2toh": {}, "QO6FUAMx": {}}, "statCode": "M7VnvydT"}, {"additionalData": {"M2HVbxTK": {}, "mde4l3qe": {}, "idwC1iB5": {}}, "statCode": "2liQBrm9"}, {"additionalData": {"WQ5GtTAw": {}, "dnHPacKF": {}, "LpqiJF39": {}}, "statCode": "xoceqWQq"}]' \
    > test.out 2>&1
eval_tap $? 92 'BulkResetUserStatItemValues' test.out

#- 93 DeleteUserStatItems2
./ng net.accelbyte.sdk.cli.Main social deleteUserStatItems2 \
    --namespace "$AB_NAMESPACE" \
    --statCode 'joK7JSlH' \
    --userId 'xcAKtozA' \
    --additionalKey 'XmJdTKL2' \
    > test.out 2>&1
eval_tap $? 93 'DeleteUserStatItems2' test.out

#- 94 UpdateUserStatItemValue
./ng net.accelbyte.sdk.cli.Main social updateUserStatItemValue \
    --namespace "$AB_NAMESPACE" \
    --statCode 'WbZGKSax' \
    --userId 'YEv2LBkJ' \
    --additionalKey '9uBtYYw6' \
    --body '{"additionalData": {"4mkL0Twq": {}, "DZxL7N2E": {}, "kzL02Wz9": {}}, "updateStrategy": "OVERRIDE", "value": 0.916891321395771}' \
    > test.out 2>&1
eval_tap $? 94 'UpdateUserStatItemValue' test.out

#- 95 BulkUpdateUserStatItem1
./ng net.accelbyte.sdk.cli.Main social bulkUpdateUserStatItem1 \
    --namespace "$AB_NAMESPACE" \
    --body '[{"additionalData": {"VhV8gRH6": {}, "UdXzRfXO": {}, "IkUSJckU": {}}, "additionalKey": "SIpk8OmR", "statCode": "BhHA8SI3", "updateStrategy": "OVERRIDE", "userId": "jE7wypuh", "value": 0.5600397311492378}, {"additionalData": {"jLjeoSiD": {}, "wYwTiIWe": {}, "LLX70eIa": {}}, "additionalKey": "KKvlli8E", "statCode": "Vsw5VqH4", "updateStrategy": "OVERRIDE", "userId": "C5zXPmQz", "value": 5.9166799909693424e-05}, {"additionalData": {"T8e1Leuc": {}, "btVf028f": {}, "tq9LfciI": {}}, "additionalKey": "dQNZIq3i", "statCode": "6lAdRksd", "updateStrategy": "MAX", "userId": "TTeWJZqr", "value": 0.13740295567913208}]' \
    > test.out 2>&1
eval_tap $? 95 'BulkUpdateUserStatItem1' test.out

#- 96 PublicQueryUserStatItems2
./ng net.accelbyte.sdk.cli.Main social publicQueryUserStatItems2 \
    --namespace "$AB_NAMESPACE" \
    --userId 'jIOQkrwc' \
    --additionalKey '9hfUAFO3' \
    --statCodes 'E30F0Qi3,zuV5rXVG,MPaqgP6s' \
    --tags 'wrsoC6cw,3iEryw0j,FigHLMJl' \
    > test.out 2>&1
eval_tap $? 96 'PublicQueryUserStatItems2' test.out

#- 97 BulkUpdateUserStatItem2
./ng net.accelbyte.sdk.cli.Main social bulkUpdateUserStatItem2 \
    --namespace "$AB_NAMESPACE" \
    --userId 'OXv1xnq1' \
    --additionalKey '0SPsbTrq' \
    --body '[{"additionalData": {"b55LYZRN": {}, "CAstskeq": {}, "T6y7qhem": {}}, "statCode": "VdFD7wYD", "updateStrategy": "OVERRIDE", "value": 0.9347837778640866}, {"additionalData": {"EL640UGB": {}, "Ad0Gyx6B": {}, "nuo8U19N": {}}, "statCode": "7iJ3tneZ", "updateStrategy": "OVERRIDE", "value": 0.6191501589796927}, {"additionalData": {"3SOVpeeM": {}, "j6Bfb7uU": {}, "MfKjycTi": {}}, "statCode": "OLIhpdC2", "updateStrategy": "MIN", "value": 0.4125805518874983}]' \
    > test.out 2>&1
eval_tap $? 97 'BulkUpdateUserStatItem2' test.out

#- 98 UpdateUserStatItemValue1
./ng net.accelbyte.sdk.cli.Main social updateUserStatItemValue1 \
    --namespace "$AB_NAMESPACE" \
    --statCode 'wmrOrfGN' \
    --userId 'Lc2DCuM1' \
    --additionalKey 'doHBPy04' \
    --body '{"additionalData": {"LAch59nL": {}, "VP0fQ0aC": {}, "CHa16koJ": {}}, "updateStrategy": "MIN", "value": 0.11966307737138204}' \
    > test.out 2>&1
eval_tap $? 98 'UpdateUserStatItemValue1' test.out


rm -f "tmp.dat"

exit $EXIT_CODE