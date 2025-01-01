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
    --userId 'TRZ1pr9D' \
    > test.out 2>&1
eval_tap $? 8 'GetUserProfiles' test.out

#- 9 GetProfile
./ng net.accelbyte.sdk.cli.Main social getProfile \
    --namespace "$AB_NAMESPACE" \
    --profileId 'FqBEFTO0' \
    --userId 'lrgzidyM' \
    > test.out 2>&1
eval_tap $? 9 'GetProfile' test.out

#- 10 GetUserNamespaceSlots
eval_tap 0 10 'GetUserNamespaceSlots # SKIP deprecated' test.out

#- 11 GetSlotData
eval_tap 0 11 'GetSlotData # SKIP deprecated' test.out

#- 12 PublicGetUserGameProfiles
./ng net.accelbyte.sdk.cli.Main social publicGetUserGameProfiles \
    --namespace "$AB_NAMESPACE" \
    --userIds 'JvEau6nZ,hn5kTnif,CHCfB4AV' \
    > test.out 2>&1
eval_tap $? 12 'PublicGetUserGameProfiles' test.out

#- 13 PublicGetUserProfiles
./ng net.accelbyte.sdk.cli.Main social publicGetUserProfiles \
    --namespace "$AB_NAMESPACE" \
    --userId 'cq5AJ2bD' \
    > test.out 2>&1
eval_tap $? 13 'PublicGetUserProfiles' test.out

#- 14 PublicCreateProfile
./ng net.accelbyte.sdk.cli.Main social publicCreateProfile \
    --namespace "$AB_NAMESPACE" \
    --userId 'U8zkPmwg' \
    --body '{"achievements": ["yKALI8nC", "iWzS9143", "8xsj4OwK"], "attributes": {"tL3tKMm5": "LJw2IAoI", "nENNMrlS": "Ig1E7Wsi", "OJklu7ci": "3NOTy7BQ"}, "avatarUrl": "WC3xo43y", "inventories": ["NOWqJYX4", "Z9oSpgQu", "9Q2nen90"], "label": "2bXKQqYP", "profileName": "LRnP5MGN", "statistics": ["nFn6QgXN", "cMFUf0uo", "ExNCo47e"], "tags": ["KPxtr08h", "bVLMjyPi", "sd2KWUnI"]}' \
    > test.out 2>&1
eval_tap $? 14 'PublicCreateProfile' test.out

#- 15 PublicGetProfile
./ng net.accelbyte.sdk.cli.Main social publicGetProfile \
    --namespace "$AB_NAMESPACE" \
    --profileId '9Jw9jqFk' \
    --userId 'cOTyC288' \
    > test.out 2>&1
eval_tap $? 15 'PublicGetProfile' test.out

#- 16 PublicUpdateProfile
./ng net.accelbyte.sdk.cli.Main social publicUpdateProfile \
    --namespace "$AB_NAMESPACE" \
    --profileId 'tn5XFn8P' \
    --userId 'vhXGF5La' \
    --body '{"achievements": ["QJsR9824", "IrNtGJzF", "kwHaSP19"], "attributes": {"QAlwUXs9": "Ni0SQDNJ", "U12N6cer": "lX3CVsCa", "JhN5r7Ac": "lnRpaC9Z"}, "avatarUrl": "hDO8Rm7e", "inventories": ["SThdddsa", "O94tvl0b", "GCMyewWT"], "label": "OGa5Js8D", "profileName": "myDaJysS", "statistics": ["tw1L5qpI", "2d2NOY7a", "fZw7OAJm"], "tags": ["ayDIHZA2", "4bKbrdfM", "ymGlcpBo"]}' \
    > test.out 2>&1
eval_tap $? 16 'PublicUpdateProfile' test.out

#- 17 PublicDeleteProfile
./ng net.accelbyte.sdk.cli.Main social publicDeleteProfile \
    --namespace "$AB_NAMESPACE" \
    --profileId 'DyllkW4F' \
    --userId 'MJQdsWFj' \
    > test.out 2>&1
eval_tap $? 17 'PublicDeleteProfile' test.out

#- 18 PublicGetProfileAttribute
./ng net.accelbyte.sdk.cli.Main social publicGetProfileAttribute \
    --attributeName 'eG9ydEfK' \
    --namespace "$AB_NAMESPACE" \
    --profileId 'Mghn7M9H' \
    --userId '6YgH6wD7' \
    > test.out 2>&1
eval_tap $? 18 'PublicGetProfileAttribute' test.out

#- 19 PublicUpdateAttribute
./ng net.accelbyte.sdk.cli.Main social publicUpdateAttribute \
    --attributeName 'JSSA8r3l' \
    --namespace "$AB_NAMESPACE" \
    --profileId 'YkhRQhw3' \
    --userId 'YPG8bWf0' \
    --body '{"name": "sIgsUoKu", "value": "iCSUaAE3"}' \
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
    --limit '27' \
    --offset '1' \
    --statCodes 'zqQZ8BD8' \
    > test.out 2>&1
eval_tap $? 26 'GetGlobalStatItems' test.out

#- 27 GetGlobalStatItemByStatCode
./ng net.accelbyte.sdk.cli.Main social getGlobalStatItemByStatCode \
    --namespace "$AB_NAMESPACE" \
    --statCode 'JT2C88lL' \
    > test.out 2>&1
eval_tap $? 27 'GetGlobalStatItemByStatCode' test.out

#- 28 GetStatCycles
./ng net.accelbyte.sdk.cli.Main social getStatCycles \
    --namespace "$AB_NAMESPACE" \
    --cycleType 'DAILY' \
    --limit '39' \
    --name 'fNM5fGfV' \
    --offset '17' \
    --sortBy '7VfUzwys' \
    --status 'ACTIVE' \
    > test.out 2>&1
eval_tap $? 28 'GetStatCycles' test.out

#- 29 CreateStatCycle
./ng net.accelbyte.sdk.cli.Main social createStatCycle \
    --namespace "$AB_NAMESPACE" \
    --body '{"cycleType": "DAILY", "description": "AQk9sDtn", "end": "1973-03-13T00:00:00Z", "id": "XSX99Pnj", "name": "ToLqLlp8", "resetDate": 57, "resetDay": 70, "resetMonth": 92, "resetTime": "ir56lN1g", "seasonPeriod": 50, "start": "1997-01-31T00:00:00Z"}' \
    > test.out 2>&1
eval_tap $? 29 'CreateStatCycle' test.out

#- 30 BulkGetStatCycle
./ng net.accelbyte.sdk.cli.Main social bulkGetStatCycle \
    --namespace "$AB_NAMESPACE" \
    --body '{"cycleIds": ["cJUKDc6c", "Slxz5a7M", "bawiV6g4"]}' \
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
    --cycleId 'Ojyfmh5Z' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 33 'GetStatCycle' test.out

#- 34 UpdateStatCycle
./ng net.accelbyte.sdk.cli.Main social updateStatCycle \
    --cycleId 'ppdaNdd3' \
    --namespace "$AB_NAMESPACE" \
    --body '{"cycleType": "ANNUALLY", "description": "MXPY6MVq", "end": "1977-01-29T00:00:00Z", "name": "7vJkjGUN", "resetDate": 6, "resetDay": 55, "resetMonth": 54, "resetTime": "dOvQTJtw", "seasonPeriod": 9, "start": "1977-03-10T00:00:00Z"}' \
    > test.out 2>&1
eval_tap $? 34 'UpdateStatCycle' test.out

#- 35 DeleteStatCycle
./ng net.accelbyte.sdk.cli.Main social deleteStatCycle \
    --cycleId '8EBFLlwQ' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 35 'DeleteStatCycle' test.out

#- 36 BulkAddStats
./ng net.accelbyte.sdk.cli.Main social bulkAddStats \
    --cycleId 'bCLxYwzr' \
    --namespace "$AB_NAMESPACE" \
    --body '{"statCodes": ["IGnMiOj0", "KAWkV21b", "wD1JHBvQ"]}' \
    > test.out 2>&1
eval_tap $? 36 'BulkAddStats' test.out

#- 37 StopStatCycle
./ng net.accelbyte.sdk.cli.Main social stopStatCycle \
    --cycleId 'PRgxKicG' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 37 'StopStatCycle' test.out

#- 38 BulkFetchStatItems
./ng net.accelbyte.sdk.cli.Main social bulkFetchStatItems \
    --namespace "$AB_NAMESPACE" \
    --statCode 'kq8Jczxt' \
    --userIds '2SNHOQv5' \
    > test.out 2>&1
eval_tap $? 38 'BulkFetchStatItems' test.out

#- 39 BulkIncUserStatItem
./ng net.accelbyte.sdk.cli.Main social bulkIncUserStatItem \
    --namespace "$AB_NAMESPACE" \
    --body '[{"inc": 0.3990884580987589, "statCode": "I9yY8jpZ", "userId": "BdiHlBLy"}, {"inc": 0.2420968998086711, "statCode": "nJGZp1NU", "userId": "odPHFwPg"}, {"inc": 0.5520933946133847, "statCode": "UGBxKubH", "userId": "FjI8IK9K"}]' \
    > test.out 2>&1
eval_tap $? 39 'BulkIncUserStatItem' test.out

#- 40 BulkIncUserStatItemValue
./ng net.accelbyte.sdk.cli.Main social bulkIncUserStatItemValue \
    --namespace "$AB_NAMESPACE" \
    --body '[{"inc": 0.18073719480657569, "statCode": "MhCi9Rar", "userId": "UQfWRIfh"}, {"inc": 0.3338661622051078, "statCode": "u51hAKFU", "userId": "JlZQxoq0"}, {"inc": 0.2536722536646049, "statCode": "aeAmKJZ8", "userId": "tEqR9EDN"}]' \
    > test.out 2>&1
eval_tap $? 40 'BulkIncUserStatItemValue' test.out

#- 41 BulkFetchOrDefaultStatItems
./ng net.accelbyte.sdk.cli.Main social bulkFetchOrDefaultStatItems \
    --namespace "$AB_NAMESPACE" \
    --statCode 'UVNh2rw6' \
    --userIds 'Cesh6hFH,v9FzGnjc,oiQeJn2F' \
    > test.out 2>&1
eval_tap $? 41 'BulkFetchOrDefaultStatItems' test.out

#- 42 BulkResetUserStatItem
./ng net.accelbyte.sdk.cli.Main social bulkResetUserStatItem \
    --namespace "$AB_NAMESPACE" \
    --body '[{"statCode": "ylRbyX7B", "userId": "4OxfPhYD"}, {"statCode": "wzRQgIWa", "userId": "5xxo2dZv"}, {"statCode": "AVG3SQgR", "userId": "1qENGaOb"}]' \
    > test.out 2>&1
eval_tap $? 42 'BulkResetUserStatItem' test.out

#- 43 GetStats
./ng net.accelbyte.sdk.cli.Main social getStats \
    --namespace "$AB_NAMESPACE" \
    --cycleIds 'f6SuoPrA' \
    --isGlobal  \
    --isPublic  \
    --limit '79' \
    --offset '35' \
    > test.out 2>&1
eval_tap $? 43 'GetStats' test.out

#- 44 CreateStat
./ng net.accelbyte.sdk.cli.Main social createStat \
    --namespace "$AB_NAMESPACE" \
    --body '{"cycleIds": ["R041rBug", "fDc1YDVq", "kLFGmkrX"], "cycleOverrides": [{"cycleId": "N43Fvhga", "maximum": 0.2977837145125497, "minimum": 0.21902023533201798}, {"cycleId": "8rqym4TJ", "maximum": 0.6541227915583898, "minimum": 0.09606592500209754}, {"cycleId": "sPiXazBn", "maximum": 0.7870087487043812, "minimum": 0.24345810331937923}], "defaultValue": 0.05529687257594884, "description": "LwIi9w4w", "globalAggregationMethod": "LAST", "ignoreAdditionalDataOnValueRejected": false, "incrementOnly": true, "isPublic": true, "maximum": 0.590355578674245, "minimum": 0.7677030902943022, "name": "pW6IZlAX", "setAsGlobal": true, "setBy": "SERVER", "statCode": "60zm9xPP", "tags": ["Nfr7UFWu", "2Q225rw8", "SgdRL7eP"], "visibility": "SHOWALL"}' \
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
    --limit '78' \
    --offset '15' \
    --keyword 'qxZHexF3' \
    > test.out 2>&1
eval_tap $? 47 'QueryStats' test.out

#- 48 GetStat
./ng net.accelbyte.sdk.cli.Main social getStat \
    --namespace "$AB_NAMESPACE" \
    --statCode 'USpFiQHL' \
    > test.out 2>&1
eval_tap $? 48 'GetStat' test.out

#- 49 DeleteStat
./ng net.accelbyte.sdk.cli.Main social deleteStat \
    --namespace "$AB_NAMESPACE" \
    --statCode 'fG9QqFt0' \
    > test.out 2>&1
eval_tap $? 49 'DeleteStat' test.out

#- 50 UpdateStat
./ng net.accelbyte.sdk.cli.Main social updateStat \
    --namespace "$AB_NAMESPACE" \
    --statCode 'slts6BgZ' \
    --body '{"cycleIds": ["huZvvsGL", "wWFmCyai", "aCMQ1lYQ"], "cycleOverrides": [{"cycleId": "GaIcUBO6", "maximum": 0.9743656963232875, "minimum": 0.9811970177284125}, {"cycleId": "nSAHEsuT", "maximum": 0.8609078443109873, "minimum": 0.026509341990800128}, {"cycleId": "FkcyJVzu", "maximum": 0.40458458765988115, "minimum": 0.8328565247344433}], "defaultValue": 0.8737026770241151, "description": "blHVoZu5", "globalAggregationMethod": "MIN", "ignoreAdditionalDataOnValueRejected": true, "isPublic": false, "name": "ysD6nsfm", "tags": ["AHRM3lw1", "qgbuD2li", "VyjNFLxs"], "visibility": "SHOWALL"}' \
    > test.out 2>&1
eval_tap $? 50 'UpdateStat' test.out

#- 51 GetStatItems
./ng net.accelbyte.sdk.cli.Main social getStatItems \
    --namespace "$AB_NAMESPACE" \
    --statCode '3WlKtRSs' \
    --limit '92' \
    --offset '32' \
    --sortBy 'VbwdUoHs' \
    > test.out 2>&1
eval_tap $? 51 'GetStatItems' test.out

#- 52 DeleteTiedStat
./ng net.accelbyte.sdk.cli.Main social deleteTiedStat \
    --namespace "$AB_NAMESPACE" \
    --statCode 'iYWd7Wvk' \
    > test.out 2>&1
eval_tap $? 52 'DeleteTiedStat' test.out

#- 53 GetUserStatCycleItems
./ng net.accelbyte.sdk.cli.Main social getUserStatCycleItems \
    --cycleId 'IL98zk93' \
    --namespace "$AB_NAMESPACE" \
    --userId 'iOVv4IHm' \
    --isPublic  \
    --limit '4' \
    --offset '89' \
    --sortBy '7PEIt0ss' \
    --statCodes '6mZ352z8' \
    > test.out 2>&1
eval_tap $? 53 'GetUserStatCycleItems' test.out

#- 54 GetUserStatItems
./ng net.accelbyte.sdk.cli.Main social getUserStatItems \
    --namespace "$AB_NAMESPACE" \
    --userId 'IcU0VK9b' \
    --isPublic  \
    --limit '71' \
    --offset '87' \
    --sortBy 'v2z3KcFj' \
    --statCodes 'eVUdrWRU' \
    --tags 'E1PnhAWl' \
    > test.out 2>&1
eval_tap $? 54 'GetUserStatItems' test.out

#- 55 BulkCreateUserStatItems
./ng net.accelbyte.sdk.cli.Main social bulkCreateUserStatItems \
    --namespace "$AB_NAMESPACE" \
    --userId '5DUfWYc7' \
    --body '[{"statCode": "He43aHOg"}, {"statCode": "NBaJM4pZ"}, {"statCode": "npRnJu0j"}]' \
    > test.out 2>&1
eval_tap $? 55 'BulkCreateUserStatItems' test.out

#- 56 BulkIncUserStatItem1
./ng net.accelbyte.sdk.cli.Main social bulkIncUserStatItem1 \
    --namespace "$AB_NAMESPACE" \
    --userId 'lqdzQJF8' \
    --body '[{"inc": 0.16690382986776697, "statCode": "qIxAbbZf"}, {"inc": 0.4995068160030175, "statCode": "6vVLqOyT"}, {"inc": 0.5187930720710043, "statCode": "0TMcTdfc"}]' \
    > test.out 2>&1
eval_tap $? 56 'BulkIncUserStatItem1' test.out

#- 57 BulkIncUserStatItemValue1
./ng net.accelbyte.sdk.cli.Main social bulkIncUserStatItemValue1 \
    --namespace "$AB_NAMESPACE" \
    --userId 'iaTUlllP' \
    --body '[{"inc": 0.31133914115512507, "statCode": "UMHg9Seb"}, {"inc": 0.9714969705708435, "statCode": "5lp1tPSB"}, {"inc": 0.4391475201003082, "statCode": "griFKwPw"}]' \
    > test.out 2>&1
eval_tap $? 57 'BulkIncUserStatItemValue1' test.out

#- 58 BulkResetUserStatItem1
./ng net.accelbyte.sdk.cli.Main social bulkResetUserStatItem1 \
    --namespace "$AB_NAMESPACE" \
    --userId 'bSGkWGLn' \
    --body '[{"statCode": "peQWnZaY"}, {"statCode": "l0u4Hgbe"}, {"statCode": "90j7gGTy"}]' \
    > test.out 2>&1
eval_tap $? 58 'BulkResetUserStatItem1' test.out

#- 59 CreateUserStatItem
./ng net.accelbyte.sdk.cli.Main social createUserStatItem \
    --namespace "$AB_NAMESPACE" \
    --statCode 'UM68uNJT' \
    --userId 'tjfTwrP2' \
    > test.out 2>&1
eval_tap $? 59 'CreateUserStatItem' test.out

#- 60 DeleteUserStatItems
./ng net.accelbyte.sdk.cli.Main social deleteUserStatItems \
    --namespace "$AB_NAMESPACE" \
    --statCode '2GuxVdIU' \
    --userId 'WFW4s27d' \
    > test.out 2>&1
eval_tap $? 60 'DeleteUserStatItems' test.out

#- 61 IncUserStatItemValue
./ng net.accelbyte.sdk.cli.Main social incUserStatItemValue \
    --namespace "$AB_NAMESPACE" \
    --statCode 'F5eJGBWA' \
    --userId 'GuSFkhRD' \
    --body '{"inc": 0.21653195565733507}' \
    > test.out 2>&1
eval_tap $? 61 'IncUserStatItemValue' test.out

#- 62 ResetUserStatItemValue
./ng net.accelbyte.sdk.cli.Main social resetUserStatItemValue \
    --namespace "$AB_NAMESPACE" \
    --statCode 'udVLk1cE' \
    --userId 'pDUT04WA' \
    --additionalKey 'lGifwGMr' \
    --body '{"additionalData": {"cKFbH9Br": {}, "T3fwTXA1": {}, "vmqdF8Mn": {}}}' \
    > test.out 2>&1
eval_tap $? 62 'ResetUserStatItemValue' test.out

#- 63 GetGlobalStatItems1
./ng net.accelbyte.sdk.cli.Main social getGlobalStatItems1 \
    --namespace "$AB_NAMESPACE" \
    --limit '17' \
    --offset '34' \
    --statCodes 'wi9WGtuF' \
    > test.out 2>&1
eval_tap $? 63 'GetGlobalStatItems1' test.out

#- 64 GetGlobalStatItemByStatCode1
./ng net.accelbyte.sdk.cli.Main social getGlobalStatItemByStatCode1 \
    --namespace "$AB_NAMESPACE" \
    --statCode 'iA1cOAhL' \
    > test.out 2>&1
eval_tap $? 64 'GetGlobalStatItemByStatCode1' test.out

#- 65 GetStatCycles1
./ng net.accelbyte.sdk.cli.Main social getStatCycles1 \
    --namespace "$AB_NAMESPACE" \
    --cycleType 'SEASONAL' \
    --limit '55' \
    --name 'LWyQkjAx' \
    --offset '52' \
    --sortBy '7mtIZqGb' \
    --status 'ACTIVE' \
    > test.out 2>&1
eval_tap $? 65 'GetStatCycles1' test.out

#- 66 BulkGetStatCycle1
./ng net.accelbyte.sdk.cli.Main social bulkGetStatCycle1 \
    --namespace "$AB_NAMESPACE" \
    --body '{"cycleIds": ["lK73vapH", "T1FKwL77", "fGXPAE4O"]}' \
    > test.out 2>&1
eval_tap $? 66 'BulkGetStatCycle1' test.out

#- 67 GetStatCycle1
./ng net.accelbyte.sdk.cli.Main social getStatCycle1 \
    --cycleId 'cN77AMnj' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 67 'GetStatCycle1' test.out

#- 68 BulkFetchStatItems1
./ng net.accelbyte.sdk.cli.Main social bulkFetchStatItems1 \
    --namespace "$AB_NAMESPACE" \
    --statCode 'jXvC7A80' \
    --userIds 'WXriwB82' \
    > test.out 2>&1
eval_tap $? 68 'BulkFetchStatItems1' test.out

#- 69 PublicBulkIncUserStatItem
./ng net.accelbyte.sdk.cli.Main social publicBulkIncUserStatItem \
    --namespace "$AB_NAMESPACE" \
    --body '[{"inc": 0.2249524340240966, "statCode": "yDJskDMZ", "userId": "rX7Jcirt"}, {"inc": 0.762527264993342, "statCode": "hqsVYOUg", "userId": "NaJbWQ6P"}, {"inc": 0.3077235109930194, "statCode": "DcZEE6uH", "userId": "UUxWChoL"}]' \
    > test.out 2>&1
eval_tap $? 69 'PublicBulkIncUserStatItem' test.out

#- 70 PublicBulkIncUserStatItemValue
./ng net.accelbyte.sdk.cli.Main social publicBulkIncUserStatItemValue \
    --namespace "$AB_NAMESPACE" \
    --body '[{"inc": 0.715535839067943, "statCode": "eRnZcpOU", "userId": "nIh15JcA"}, {"inc": 0.5104207188804745, "statCode": "2tCMRF7Z", "userId": "QMiMArd9"}, {"inc": 0.04380432176192117, "statCode": "y7FimAWU", "userId": "o6M7OgHn"}]' \
    > test.out 2>&1
eval_tap $? 70 'PublicBulkIncUserStatItemValue' test.out

#- 71 BulkResetUserStatItem2
./ng net.accelbyte.sdk.cli.Main social bulkResetUserStatItem2 \
    --namespace "$AB_NAMESPACE" \
    --body '[{"statCode": "KzC1tlTB", "userId": "rRB7xddt"}, {"statCode": "pzcAXOON", "userId": "a8SuB6a6"}, {"statCode": "1xS9qKMC", "userId": "qf2Hdje3"}]' \
    > test.out 2>&1
eval_tap $? 71 'BulkResetUserStatItem2' test.out

#- 72 CreateStat1
./ng net.accelbyte.sdk.cli.Main social createStat1 \
    --namespace "$AB_NAMESPACE" \
    --body '{"cycleIds": ["22Ig7Rsh", "LfRuAGLM", "zT3TV9Xg"], "cycleOverrides": [{"cycleId": "IF5UCmh5", "maximum": 0.8070700247542244, "minimum": 0.6870416787169068}, {"cycleId": "LKVYVfwn", "maximum": 0.3581426586038028, "minimum": 0.8046215992345594}, {"cycleId": "W9un5XuL", "maximum": 0.6175881701692693, "minimum": 0.8278164562116574}], "defaultValue": 0.05317513333352841, "description": "W7SDy2bj", "globalAggregationMethod": "MIN", "ignoreAdditionalDataOnValueRejected": false, "incrementOnly": false, "isPublic": false, "maximum": 0.7044650800213573, "minimum": 0.209353476766573, "name": "VlnYvPBR", "setAsGlobal": false, "setBy": "CLIENT", "statCode": "K0pKFFo5", "tags": ["IcXrJO3H", "Ijq3Eo42", "BBpvWAib"], "visibility": "SERVERONLY"}' \
    > test.out 2>&1
eval_tap $? 72 'CreateStat1' test.out

#- 73 PublicListMyStatCycleItems
./ng net.accelbyte.sdk.cli.Main social publicListMyStatCycleItems \
    --cycleId 'VSdXMep0' \
    --namespace "$AB_NAMESPACE" \
    --limit '64' \
    --offset '93' \
    --sortBy 'VAaUDcvC' \
    --statCodes 'eGOeM3QW,zUQ418ra,IbhbjUBS' \
    > test.out 2>&1
eval_tap $? 73 'PublicListMyStatCycleItems' test.out

#- 74 PublicListMyStatItems
./ng net.accelbyte.sdk.cli.Main social publicListMyStatItems \
    --namespace "$AB_NAMESPACE" \
    --limit '88' \
    --offset '75' \
    --sortBy '5GzKAvor' \
    --statCodes 'v0f0byLR,e2Bdo6ft,JwY3QZ9I' \
    --tags 'vXRALEsx,oMhidzVF,4l9gV0gv' \
    > test.out 2>&1
eval_tap $? 74 'PublicListMyStatItems' test.out

#- 75 PublicListAllMyStatItems
./ng net.accelbyte.sdk.cli.Main social publicListAllMyStatItems \
    --namespace "$AB_NAMESPACE" \
    --additionalKey 'UJhyi0J3' \
    --statCodes 'KzyZJMgH,A11yzjK8,ljscRPsh' \
    --tags 'jBhHInJv,K3mg76Eg,jzIbJhMc' \
    > test.out 2>&1
eval_tap $? 75 'PublicListAllMyStatItems' test.out

#- 76 GetUserStatCycleItems1
./ng net.accelbyte.sdk.cli.Main social getUserStatCycleItems1 \
    --cycleId 'goZdBnUE' \
    --namespace "$AB_NAMESPACE" \
    --userId '9hFtnsXL' \
    --limit '51' \
    --offset '78' \
    --sortBy '8PJ660Di' \
    --statCodes 'OWXZdA8E' \
    > test.out 2>&1
eval_tap $? 76 'GetUserStatCycleItems1' test.out

#- 77 PublicQueryUserStatItems
./ng net.accelbyte.sdk.cli.Main social publicQueryUserStatItems \
    --namespace "$AB_NAMESPACE" \
    --userId 'QRCWGibw' \
    --limit '76' \
    --offset '48' \
    --sortBy 'P8AWsGZE' \
    --statCodes 'SDTZuOhl' \
    --tags 's2UZvaOi' \
    > test.out 2>&1
eval_tap $? 77 'PublicQueryUserStatItems' test.out

#- 78 PublicBulkCreateUserStatItems
./ng net.accelbyte.sdk.cli.Main social publicBulkCreateUserStatItems \
    --namespace "$AB_NAMESPACE" \
    --userId 'iECqjZhU' \
    --body '[{"statCode": "m26KBQ88"}, {"statCode": "pPekovGH"}, {"statCode": "QfoHBq8V"}]' \
    > test.out 2>&1
eval_tap $? 78 'PublicBulkCreateUserStatItems' test.out

#- 79 PublicQueryUserStatItems1
./ng net.accelbyte.sdk.cli.Main social publicQueryUserStatItems1 \
    --namespace "$AB_NAMESPACE" \
    --userId 'UXZTRgvQ' \
    --additionalKey 'f4A4CBeg' \
    --statCodes 'A6hGputb,02Dp4VTp,N5iIebdK' \
    --tags 'HuqN3M1O,lp8ie1KO,EvOXEOWX' \
    > test.out 2>&1
eval_tap $? 79 'PublicQueryUserStatItems1' test.out

#- 80 PublicBulkIncUserStatItem1
./ng net.accelbyte.sdk.cli.Main social publicBulkIncUserStatItem1 \
    --namespace "$AB_NAMESPACE" \
    --userId 'E1EBLIUr' \
    --body '[{"inc": 0.16696065511051494, "statCode": "fUmwGfzp"}, {"inc": 0.9826304694787209, "statCode": "26IsiEUq"}, {"inc": 0.8454504188702681, "statCode": "u7lJ34P6"}]' \
    > test.out 2>&1
eval_tap $? 80 'PublicBulkIncUserStatItem1' test.out

#- 81 BulkIncUserStatItemValue2
./ng net.accelbyte.sdk.cli.Main social bulkIncUserStatItemValue2 \
    --namespace "$AB_NAMESPACE" \
    --userId 'MdCatNLy' \
    --body '[{"inc": 0.9509227412699829, "statCode": "I4UmP0wD"}, {"inc": 0.6105224849720611, "statCode": "85eSvl56"}, {"inc": 0.2396157843835599, "statCode": "cZZyWRMI"}]' \
    > test.out 2>&1
eval_tap $? 81 'BulkIncUserStatItemValue2' test.out

#- 82 BulkResetUserStatItem3
./ng net.accelbyte.sdk.cli.Main social bulkResetUserStatItem3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'nRccgXxs' \
    --body '[{"statCode": "LFJpUQ6d"}, {"statCode": "Gun2LA0k"}, {"statCode": "P8h5m5HK"}]' \
    > test.out 2>&1
eval_tap $? 82 'BulkResetUserStatItem3' test.out

#- 83 PublicCreateUserStatItem
./ng net.accelbyte.sdk.cli.Main social publicCreateUserStatItem \
    --namespace "$AB_NAMESPACE" \
    --statCode '2AkluW1K' \
    --userId '8t1fHkAH' \
    > test.out 2>&1
eval_tap $? 83 'PublicCreateUserStatItem' test.out

#- 84 DeleteUserStatItems1
./ng net.accelbyte.sdk.cli.Main social deleteUserStatItems1 \
    --namespace "$AB_NAMESPACE" \
    --statCode 'QMnOPgKA' \
    --userId '1GYGC2IR' \
    > test.out 2>&1
eval_tap $? 84 'DeleteUserStatItems1' test.out

#- 85 PublicIncUserStatItem
./ng net.accelbyte.sdk.cli.Main social publicIncUserStatItem \
    --namespace "$AB_NAMESPACE" \
    --statCode '1riySEyY' \
    --userId 'qpWvwydO' \
    --body '{"inc": 0.8838075625789735}' \
    > test.out 2>&1
eval_tap $? 85 'PublicIncUserStatItem' test.out

#- 86 PublicIncUserStatItemValue
./ng net.accelbyte.sdk.cli.Main social publicIncUserStatItemValue \
    --namespace "$AB_NAMESPACE" \
    --statCode 'LdjEkR8M' \
    --userId 'mgnU89PJ' \
    --body '{"inc": 0.45161319564267877}' \
    > test.out 2>&1
eval_tap $? 86 'PublicIncUserStatItemValue' test.out

#- 87 ResetUserStatItemValue1
./ng net.accelbyte.sdk.cli.Main social resetUserStatItemValue1 \
    --namespace "$AB_NAMESPACE" \
    --statCode 'pYEYdDAP' \
    --userId 'iWbz5PhJ' \
    > test.out 2>&1
eval_tap $? 87 'ResetUserStatItemValue1' test.out

#- 88 BulkUpdateUserStatItemV2
./ng net.accelbyte.sdk.cli.Main social bulkUpdateUserStatItemV2 \
    --namespace "$AB_NAMESPACE" \
    --body '[{"additionalData": {"FbUxY6Qn": {}, "FmcFh623": {}, "Kztx33OF": {}}, "additionalKey": "jaLZ9jdw", "statCode": "ELr1wf0D", "updateStrategy": "MAX", "userId": "8QJOj4yi", "value": 0.4301669507583705}, {"additionalData": {"L8n6oP7Z": {}, "tOfynuSj": {}, "lRuR8iVl": {}}, "additionalKey": "HavjJALQ", "statCode": "yFTimZ3p", "updateStrategy": "MIN", "userId": "NKWz6NsR", "value": 0.7264737398423656}, {"additionalData": {"HxYHWvWB": {}, "IyIA8Qtf": {}, "WB27wcyY": {}}, "additionalKey": "QT0j5i0s", "statCode": "oErqANjJ", "updateStrategy": "INCREMENT", "userId": "rXyN8ydb", "value": 0.14019795984229366}]' \
    > test.out 2>&1
eval_tap $? 88 'BulkUpdateUserStatItemV2' test.out

#- 89 BulkFetchOrDefaultStatItems1
./ng net.accelbyte.sdk.cli.Main social bulkFetchOrDefaultStatItems1 \
    --namespace "$AB_NAMESPACE" \
    --additionalKey 'AkGfRmHn' \
    --statCode 'd5swSSlx' \
    --userIds '11Uh0rdu,Bn7AISJ6,imCfKwSc' \
    > test.out 2>&1
eval_tap $? 89 'BulkFetchOrDefaultStatItems1' test.out

#- 90 AdminListUsersStatItems
./ng net.accelbyte.sdk.cli.Main social adminListUsersStatItems \
    --namespace "$AB_NAMESPACE" \
    --userId 'IzCMwzUC' \
    --additionalKey 'TaqAAQNQ' \
    --statCodes 'UdFNlfum,0BoayxIY,oErYHcuA' \
    --tags 'ZxMEjB1u,rE1eakXL,WlCC09Ij' \
    > test.out 2>&1
eval_tap $? 90 'AdminListUsersStatItems' test.out

#- 91 BulkUpdateUserStatItem
./ng net.accelbyte.sdk.cli.Main social bulkUpdateUserStatItem \
    --namespace "$AB_NAMESPACE" \
    --userId 'm05g9IoK' \
    --additionalKey 'eAxXNrZH' \
    --body '[{"additionalData": {"cavj1WAP": {}, "Z9uS0AWb": {}, "Nj0416eW": {}}, "statCode": "lVLPNkWg", "updateStrategy": "INCREMENT", "value": 0.026927553794838244}, {"additionalData": {"mgjEw5pm": {}, "Fvxc2Mvd": {}, "K18gqHno": {}}, "statCode": "TDKXIPF9", "updateStrategy": "OVERRIDE", "value": 0.46620612201047573}, {"additionalData": {"NSiF5zkT": {}, "n6Hosowo": {}, "2vU12K2c": {}}, "statCode": "T66ZKz25", "updateStrategy": "INCREMENT", "value": 0.546086528294972}]' \
    > test.out 2>&1
eval_tap $? 91 'BulkUpdateUserStatItem' test.out

#- 92 BulkGetOrDefaultByUserId
./ng net.accelbyte.sdk.cli.Main social bulkGetOrDefaultByUserId \
    --namespace "$AB_NAMESPACE" \
    --userId 'NX8EOjDN' \
    --additionalKey 'zqE8MS8S' \
    --body '{"statCodes": ["s18zVNq0", "QNXYGwAb", "eS9bXnUg"]}' \
    > test.out 2>&1
eval_tap $? 92 'BulkGetOrDefaultByUserId' test.out

#- 93 BulkResetUserStatItemValues
./ng net.accelbyte.sdk.cli.Main social bulkResetUserStatItemValues \
    --namespace "$AB_NAMESPACE" \
    --userId 'w5ilVqMZ' \
    --additionalKey 'rQOMmocT' \
    --body '[{"additionalData": {"3E90DL6c": {}, "n3E4oOPH": {}, "0OtsDkA8": {}}, "statCode": "8Y7f2YTV"}, {"additionalData": {"GocGeUf9": {}, "8yP9g9ZM": {}, "LDJs6W8Y": {}}, "statCode": "abtEfbEe"}, {"additionalData": {"gyNZt5Im": {}, "vgtayRB6": {}, "EEfjMXxZ": {}}, "statCode": "cQpt9vea"}]' \
    > test.out 2>&1
eval_tap $? 93 'BulkResetUserStatItemValues' test.out

#- 94 DeleteUserStatItems2
./ng net.accelbyte.sdk.cli.Main social deleteUserStatItems2 \
    --namespace "$AB_NAMESPACE" \
    --statCode '70DoE3Cj' \
    --userId 'ekmxzrVQ' \
    --additionalKey '9brLWoI1' \
    > test.out 2>&1
eval_tap $? 94 'DeleteUserStatItems2' test.out

#- 95 UpdateUserStatItemValue
./ng net.accelbyte.sdk.cli.Main social updateUserStatItemValue \
    --namespace "$AB_NAMESPACE" \
    --statCode 'GRJqMUpK' \
    --userId 'PkvuhnyU' \
    --additionalKey 'Ouq0pC7P' \
    --body '{"additionalData": {"aRcyzEPH": {}, "fXXlfmpB": {}, "q8LIjVkL": {}}, "updateStrategy": "MAX", "value": 0.512287094083101}' \
    > test.out 2>&1
eval_tap $? 95 'UpdateUserStatItemValue' test.out

#- 96 BulkUpdateUserStatItem1
./ng net.accelbyte.sdk.cli.Main social bulkUpdateUserStatItem1 \
    --namespace "$AB_NAMESPACE" \
    --body '[{"additionalData": {"n8lGAgSe": {}, "zwOhf9de": {}, "hKLJ57tO": {}}, "additionalKey": "ZeNl8KSA", "statCode": "5eFrnEfu", "updateStrategy": "MAX", "userId": "xaaNpQ5H", "value": 0.09854656792105732}, {"additionalData": {"R7omqeyA": {}, "ZObeJ0tQ": {}, "bFmI8cwz": {}}, "additionalKey": "8YsjL5vk", "statCode": "uWnB7M3M", "updateStrategy": "MIN", "userId": "CsC3a1TK", "value": 0.5221785652635424}, {"additionalData": {"QuJsJOtr": {}, "IlWeVeTc": {}, "tHzRJekW": {}}, "additionalKey": "egU2PKGl", "statCode": "BvJNwOaC", "updateStrategy": "OVERRIDE", "userId": "WOtqCzbq", "value": 0.32262810038138157}]' \
    > test.out 2>&1
eval_tap $? 96 'BulkUpdateUserStatItem1' test.out

#- 97 PublicQueryUserStatItems2
./ng net.accelbyte.sdk.cli.Main social publicQueryUserStatItems2 \
    --namespace "$AB_NAMESPACE" \
    --userId 'HxOLtUI5' \
    --additionalKey 'sFGEBUsR' \
    --statCodes 'hYO7zLWL,KZIt40CQ,grk032x8' \
    --tags 't55x5TAd,q2xx82xL,0DgaV3YF' \
    > test.out 2>&1
eval_tap $? 97 'PublicQueryUserStatItems2' test.out

#- 98 BulkUpdateUserStatItem2
./ng net.accelbyte.sdk.cli.Main social bulkUpdateUserStatItem2 \
    --namespace "$AB_NAMESPACE" \
    --userId 'hdH0ekuf' \
    --additionalKey 'bN8AtadB' \
    --body '[{"additionalData": {"0dR1PjmF": {}, "ehehVTKY": {}, "oSIk024K": {}}, "statCode": "thHo8SHm", "updateStrategy": "INCREMENT", "value": 0.5474484392564989}, {"additionalData": {"Ailx31PZ": {}, "vMkqdlx0": {}, "a80JKxMP": {}}, "statCode": "YM2dyNzz", "updateStrategy": "MIN", "value": 0.9961861435551639}, {"additionalData": {"ENLJ68r9": {}, "gpbtUQ8u": {}, "UbTwVpAk": {}}, "statCode": "e5eleguj", "updateStrategy": "MIN", "value": 0.2636389072169676}]' \
    > test.out 2>&1
eval_tap $? 98 'BulkUpdateUserStatItem2' test.out

#- 99 UpdateUserStatItemValue1
./ng net.accelbyte.sdk.cli.Main social updateUserStatItemValue1 \
    --namespace "$AB_NAMESPACE" \
    --statCode 'ZWfYg2PV' \
    --userId 'sQRb6iwn' \
    --additionalKey 'YI26B32U' \
    --body '{"additionalData": {"btD5o3fO": {}, "hYnG1ych": {}, "ZPzHA2Zy": {}}, "updateStrategy": "INCREMENT", "value": 0.01202209599765458}' \
    > test.out 2>&1
eval_tap $? 99 'UpdateUserStatItemValue1' test.out


rm -f "tmp.dat"

exit $EXIT_CODE