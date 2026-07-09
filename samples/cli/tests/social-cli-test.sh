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
    --limit '59' \
    --offset '39' \
    --statCodes '26sk1v9C' \
    > test.out 2>&1
eval_tap $? 26 'GetGlobalStatItems' test.out

#- 27 GetGlobalStatItemByStatCode
./ng net.accelbyte.sdk.cli.Main social getGlobalStatItemByStatCode \
    --namespace "$AB_NAMESPACE" \
    --statCode 'bAydh75o' \
    > test.out 2>&1
eval_tap $? 27 'GetGlobalStatItemByStatCode' test.out

#- 28 GetStatCycles
./ng net.accelbyte.sdk.cli.Main social getStatCycles \
    --namespace "$AB_NAMESPACE" \
    --cycleType 'ANNUALLY' \
    --limit '14' \
    --name '0SSs1oee' \
    --offset '43' \
    --sortBy 'nEOWlTSS' \
    --status 'INIT' \
    > test.out 2>&1
eval_tap $? 28 'GetStatCycles' test.out

#- 29 CreateStatCycle
./ng net.accelbyte.sdk.cli.Main social createStatCycle \
    --namespace "$AB_NAMESPACE" \
    --body '{"cycleType": "MONTHLY", "description": "70m0yTtG", "end": "1995-05-15T00:00:00Z", "id": "uiLCjSw9", "name": "b9XofiWX", "resetDate": 46, "resetDay": 70, "resetMonth": 65, "resetTime": "0huD37DG", "seasonPeriod": 2, "start": "1995-10-13T00:00:00Z"}' \
    > test.out 2>&1
eval_tap $? 29 'CreateStatCycle' test.out

#- 30 BulkGetStatCycle
./ng net.accelbyte.sdk.cli.Main social bulkGetStatCycle \
    --namespace "$AB_NAMESPACE" \
    --body '{"cycleIds": ["T07E1Wn6", "NolHjjEH", "XL4j9NXX"]}' \
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
    --cycleId 'ZmReETwD' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 33 'GetStatCycle' test.out

#- 34 UpdateStatCycle
./ng net.accelbyte.sdk.cli.Main social updateStatCycle \
    --cycleId 'H5OWDrzZ' \
    --namespace "$AB_NAMESPACE" \
    --body '{"cycleType": "MONTHLY", "description": "eycLYrKP", "end": "1980-11-03T00:00:00Z", "name": "Qkf6Cf9X", "resetDate": 10, "resetDay": 87, "resetMonth": 4, "resetTime": "EedCpxEh", "seasonPeriod": 20, "start": "1980-05-13T00:00:00Z"}' \
    > test.out 2>&1
eval_tap $? 34 'UpdateStatCycle' test.out

#- 35 DeleteStatCycle
./ng net.accelbyte.sdk.cli.Main social deleteStatCycle \
    --cycleId 'KiBj5GDU' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 35 'DeleteStatCycle' test.out

#- 36 ResetStatCycle
./ng net.accelbyte.sdk.cli.Main social resetStatCycle \
    --cycleId 'AEYZR86w' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 36 'ResetStatCycle' test.out

#- 37 BulkAddStats
./ng net.accelbyte.sdk.cli.Main social bulkAddStats \
    --cycleId 'nGc1bIjN' \
    --namespace "$AB_NAMESPACE" \
    --body '{"statCodes": ["iqdOcUPF", "Kok3Ny4M", "HjXyHTzP"]}' \
    > test.out 2>&1
eval_tap $? 37 'BulkAddStats' test.out

#- 38 StopStatCycle
./ng net.accelbyte.sdk.cli.Main social stopStatCycle \
    --cycleId 'JdsMIPUo' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 38 'StopStatCycle' test.out

#- 39 BulkFetchStatItems
./ng net.accelbyte.sdk.cli.Main social bulkFetchStatItems \
    --namespace "$AB_NAMESPACE" \
    --statCode '02k4YQt2' \
    --userIds '15Ty53dg' \
    > test.out 2>&1
eval_tap $? 39 'BulkFetchStatItems' test.out

#- 40 BulkIncUserStatItem
./ng net.accelbyte.sdk.cli.Main social bulkIncUserStatItem \
    --namespace "$AB_NAMESPACE" \
    --body '[{"inc": 0.018639573730459547, "statCode": "kSoimUUG", "userId": "gE1plOSn"}, {"inc": 0.3794065253057539, "statCode": "gdhOOzZ9", "userId": "7YHWd6BZ"}, {"inc": 0.9893156473091436, "statCode": "MwkVBHk6", "userId": "QTLK3bKM"}]' \
    > test.out 2>&1
eval_tap $? 40 'BulkIncUserStatItem' test.out

#- 41 BulkIncUserStatItemValue
./ng net.accelbyte.sdk.cli.Main social bulkIncUserStatItemValue \
    --namespace "$AB_NAMESPACE" \
    --body '[{"inc": 0.5443085993026722, "statCode": "NNNGODyS", "userId": "WZPO0zp9"}, {"inc": 0.605037174341285, "statCode": "V0X1y2zg", "userId": "qIyWedpm"}, {"inc": 0.20361834156163106, "statCode": "M8l3HNTY", "userId": "q6CEFboN"}]' \
    > test.out 2>&1
eval_tap $? 41 'BulkIncUserStatItemValue' test.out

#- 42 BulkFetchOrDefaultStatItems
./ng net.accelbyte.sdk.cli.Main social bulkFetchOrDefaultStatItems \
    --namespace "$AB_NAMESPACE" \
    --statCode 'WipthjA6' \
    --userIds 'PO5oJhIW,qwhpFJKO,A3EAwjUP' \
    > test.out 2>&1
eval_tap $? 42 'BulkFetchOrDefaultStatItems' test.out

#- 43 BulkResetUserStatItem
./ng net.accelbyte.sdk.cli.Main social bulkResetUserStatItem \
    --namespace "$AB_NAMESPACE" \
    --body '[{"statCode": "xpQcsY9O", "userId": "nmpYXm9P"}, {"statCode": "sOmaClVC", "userId": "WTNjxyds"}, {"statCode": "rBnYq3R9", "userId": "JNnRuSMj"}]' \
    > test.out 2>&1
eval_tap $? 43 'BulkResetUserStatItem' test.out

#- 44 GetStats
./ng net.accelbyte.sdk.cli.Main social getStats \
    --namespace "$AB_NAMESPACE" \
    --cycleIds 'o5pJrJIW' \
    --isGlobal  \
    --isPublic  \
    --limit '99' \
    --offset '79' \
    > test.out 2>&1
eval_tap $? 44 'GetStats' test.out

#- 45 CreateStat
./ng net.accelbyte.sdk.cli.Main social createStat \
    --namespace "$AB_NAMESPACE" \
    --body '{"capCycleOverride": true, "cycleIds": ["7Q4uzPhD", "f9lct9uD", "EpklNx8M"], "cycleOverrides": [{"cycleId": "Bkiu8ZYh", "maximum": 0.9965469411275669, "minimum": 0.0781409200784231}, {"cycleId": "ym4745K9", "maximum": 0.21114939877715289, "minimum": 0.12278886492317198}, {"cycleId": "Wvow2YsB", "maximum": 0.8403152461243667, "minimum": 0.10730281618019755}], "defaultValue": 0.966273581737841, "description": "e4OrdBUs", "globalAggregationMethod": "TOTAL", "ignoreAdditionalDataOnValueRejected": false, "incrementOnly": false, "isPublic": false, "maximum": 0.28721332668098265, "minimum": 0.4359322854697981, "name": "frnSjtzY", "setAsGlobal": true, "setBy": "CLIENT", "statCode": "8GZ0A93L", "tags": ["63GqNsYn", "wRWLfoAi", "iXZUhsAj"], "visibility": "SHOWALL"}' \
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
    --limit '17' \
    --offset '75' \
    --keyword 'vzqEtlcB' \
    > test.out 2>&1
eval_tap $? 48 'QueryStats' test.out

#- 49 GetStat
./ng net.accelbyte.sdk.cli.Main social getStat \
    --namespace "$AB_NAMESPACE" \
    --statCode '5rHrrs6G' \
    > test.out 2>&1
eval_tap $? 49 'GetStat' test.out

#- 50 DeleteStat
./ng net.accelbyte.sdk.cli.Main social deleteStat \
    --namespace "$AB_NAMESPACE" \
    --statCode '0BVry7XO' \
    > test.out 2>&1
eval_tap $? 50 'DeleteStat' test.out

#- 51 UpdateStat
./ng net.accelbyte.sdk.cli.Main social updateStat \
    --namespace "$AB_NAMESPACE" \
    --statCode '8f0gYIOJ' \
    --body '{"capCycleOverride": false, "cycleIds": ["i1cbOSD4", "2G0wnai2", "XVJVAfHz"], "cycleOverrides": [{"cycleId": "Ry061TGB", "maximum": 0.10996309907146207, "minimum": 0.4207107336166096}, {"cycleId": "FfYh6wDB", "maximum": 0.17685248610753868, "minimum": 0.2318662704841813}, {"cycleId": "cqxuTCtc", "maximum": 0.525414162987689, "minimum": 0.07511455223336738}], "defaultValue": 0.32989303433170414, "description": "y0gjfawj", "globalAggregationMethod": "LAST", "ignoreAdditionalDataOnValueRejected": true, "incrementOnly": true, "isPublic": false, "maximum": 0.26781297933306114, "minimum": 0.08963170579479918, "name": "Xcqyq8mT", "setAsGlobal": true, "setBy": "SERVER", "tags": ["LfqBx29R", "ZlTxqdLB", "j1ridFCP"], "visibility": "SHOWALL"}' \
    > test.out 2>&1
eval_tap $? 51 'UpdateStat' test.out

#- 52 GetStatItems
./ng net.accelbyte.sdk.cli.Main social getStatItems \
    --namespace "$AB_NAMESPACE" \
    --statCode 'YEJ3BlOV' \
    --limit '87' \
    --offset '18' \
    --sortBy 'SZojEH09' \
    > test.out 2>&1
eval_tap $? 52 'GetStatItems' test.out

#- 53 DeleteTiedStat
./ng net.accelbyte.sdk.cli.Main social deleteTiedStat \
    --namespace "$AB_NAMESPACE" \
    --statCode 'ZIB2Qe5g' \
    > test.out 2>&1
eval_tap $? 53 'DeleteTiedStat' test.out

#- 54 GetUserStatCycleItems
./ng net.accelbyte.sdk.cli.Main social getUserStatCycleItems \
    --cycleId 'daXbTgik' \
    --namespace "$AB_NAMESPACE" \
    --userId 'p97lo6Wd' \
    --isPublic  \
    --limit '99' \
    --offset '66' \
    --sortBy 'AiVRmn8Y' \
    --statCodes 'nYGZrVbK' \
    > test.out 2>&1
eval_tap $? 54 'GetUserStatCycleItems' test.out

#- 55 GetUserStatItems
./ng net.accelbyte.sdk.cli.Main social getUserStatItems \
    --namespace "$AB_NAMESPACE" \
    --userId 'DJCE7dQt' \
    --isPublic  \
    --limit '70' \
    --offset '19' \
    --sortBy '5FAmk3R9' \
    --statCodes 'mwG2WKmA' \
    --tags 'sSs8knIy' \
    > test.out 2>&1
eval_tap $? 55 'GetUserStatItems' test.out

#- 56 BulkCreateUserStatItems
./ng net.accelbyte.sdk.cli.Main social bulkCreateUserStatItems \
    --namespace "$AB_NAMESPACE" \
    --userId 'ODHO4C8g' \
    --body '[{"statCode": "xYfPVInf"}, {"statCode": "rk2fYVO2"}, {"statCode": "Pl2H18DB"}]' \
    > test.out 2>&1
eval_tap $? 56 'BulkCreateUserStatItems' test.out

#- 57 BulkIncUserStatItem1
./ng net.accelbyte.sdk.cli.Main social bulkIncUserStatItem1 \
    --namespace "$AB_NAMESPACE" \
    --userId 'ewjLm0S5' \
    --body '[{"inc": 0.044960203537104504, "statCode": "Sg0bjR2S"}, {"inc": 0.2690280118048869, "statCode": "BRCx3yq2"}, {"inc": 0.6026369876982484, "statCode": "ksjb0weB"}]' \
    > test.out 2>&1
eval_tap $? 57 'BulkIncUserStatItem1' test.out

#- 58 BulkIncUserStatItemValue1
./ng net.accelbyte.sdk.cli.Main social bulkIncUserStatItemValue1 \
    --namespace "$AB_NAMESPACE" \
    --userId 'KZLhqjxK' \
    --body '[{"inc": 0.7495176269082996, "statCode": "svprhuaU"}, {"inc": 0.1518693134720056, "statCode": "TFXHjGtD"}, {"inc": 0.26049191918611936, "statCode": "nBOBua0o"}]' \
    > test.out 2>&1
eval_tap $? 58 'BulkIncUserStatItemValue1' test.out

#- 59 BulkResetUserStatItem1
./ng net.accelbyte.sdk.cli.Main social bulkResetUserStatItem1 \
    --namespace "$AB_NAMESPACE" \
    --userId 'bajSVGVG' \
    --body '[{"statCode": "4djUe4wv"}, {"statCode": "bq5aVAfB"}, {"statCode": "0Rv2kiUo"}]' \
    > test.out 2>&1
eval_tap $? 59 'BulkResetUserStatItem1' test.out

#- 60 CreateUserStatItem
./ng net.accelbyte.sdk.cli.Main social createUserStatItem \
    --namespace "$AB_NAMESPACE" \
    --statCode 'cj3uYhhA' \
    --userId 'mIRkdmsT' \
    > test.out 2>&1
eval_tap $? 60 'CreateUserStatItem' test.out

#- 61 DeleteUserStatItems
./ng net.accelbyte.sdk.cli.Main social deleteUserStatItems \
    --namespace "$AB_NAMESPACE" \
    --statCode 'WUA4gApQ' \
    --userId 'tHi3eiyH' \
    > test.out 2>&1
eval_tap $? 61 'DeleteUserStatItems' test.out

#- 62 IncUserStatItemValue
./ng net.accelbyte.sdk.cli.Main social incUserStatItemValue \
    --namespace "$AB_NAMESPACE" \
    --statCode 'D3aa8dyU' \
    --userId 'Qm9Rx2dI' \
    --body '{"inc": 0.13000519765427776}' \
    > test.out 2>&1
eval_tap $? 62 'IncUserStatItemValue' test.out

#- 63 ResetUserStatItemValue
./ng net.accelbyte.sdk.cli.Main social resetUserStatItemValue \
    --namespace "$AB_NAMESPACE" \
    --statCode 'koCHEgbb' \
    --userId 'dni7y5hN' \
    --additionalKey 'iUKQKOzS' \
    --body '{"additionalData": {"GAKUZRoG": {}, "p709rYqu": {}, "ZfruJtwT": {}}}' \
    > test.out 2>&1
eval_tap $? 63 'ResetUserStatItemValue' test.out

#- 64 GetGlobalStatItems1
./ng net.accelbyte.sdk.cli.Main social getGlobalStatItems1 \
    --namespace "$AB_NAMESPACE" \
    --limit '93' \
    --offset '68' \
    --statCodes 'XfQ7tqeh' \
    > test.out 2>&1
eval_tap $? 64 'GetGlobalStatItems1' test.out

#- 65 GetGlobalStatItemByStatCode1
./ng net.accelbyte.sdk.cli.Main social getGlobalStatItemByStatCode1 \
    --namespace "$AB_NAMESPACE" \
    --statCode 'SgW55x0H' \
    > test.out 2>&1
eval_tap $? 65 'GetGlobalStatItemByStatCode1' test.out

#- 66 GetStatCycles1
./ng net.accelbyte.sdk.cli.Main social getStatCycles1 \
    --namespace "$AB_NAMESPACE" \
    --cycleType 'MONTHLY' \
    --limit '25' \
    --name 'yeoJ85zr' \
    --offset '37' \
    --sortBy 'fvmUHcP0' \
    --status 'ACTIVE' \
    > test.out 2>&1
eval_tap $? 66 'GetStatCycles1' test.out

#- 67 BulkGetStatCycle1
./ng net.accelbyte.sdk.cli.Main social bulkGetStatCycle1 \
    --namespace "$AB_NAMESPACE" \
    --body '{"cycleIds": ["ngDrgjDT", "l3na4tR7", "rRGRACT5"]}' \
    > test.out 2>&1
eval_tap $? 67 'BulkGetStatCycle1' test.out

#- 68 GetStatCycle1
./ng net.accelbyte.sdk.cli.Main social getStatCycle1 \
    --cycleId 'TuS9u2vi' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 68 'GetStatCycle1' test.out

#- 69 BulkFetchStatItems1
./ng net.accelbyte.sdk.cli.Main social bulkFetchStatItems1 \
    --namespace "$AB_NAMESPACE" \
    --statCode 'vpowf24u' \
    --userIds 'sOfSyZlR' \
    > test.out 2>&1
eval_tap $? 69 'BulkFetchStatItems1' test.out

#- 70 PublicBulkIncUserStatItem
./ng net.accelbyte.sdk.cli.Main social publicBulkIncUserStatItem \
    --namespace "$AB_NAMESPACE" \
    --body '[{"inc": 0.5779606681850046, "statCode": "YvNsm5Hc", "userId": "guGHoG9J"}, {"inc": 0.4741236381672749, "statCode": "6vpQd8iY", "userId": "UBDZiV74"}, {"inc": 0.8902814120716466, "statCode": "FrasdoPz", "userId": "FtHYtr9D"}]' \
    > test.out 2>&1
eval_tap $? 70 'PublicBulkIncUserStatItem' test.out

#- 71 PublicBulkIncUserStatItemValue
./ng net.accelbyte.sdk.cli.Main social publicBulkIncUserStatItemValue \
    --namespace "$AB_NAMESPACE" \
    --body '[{"inc": 0.9183393545572333, "statCode": "IP6AHMSd", "userId": "NftPZGXD"}, {"inc": 0.90157888319441, "statCode": "a8IqEYnR", "userId": "DWiq8eAf"}, {"inc": 0.5563990460045795, "statCode": "AHkKjqBS", "userId": "BYy53Dpd"}]' \
    > test.out 2>&1
eval_tap $? 71 'PublicBulkIncUserStatItemValue' test.out

#- 72 BulkResetUserStatItem2
./ng net.accelbyte.sdk.cli.Main social bulkResetUserStatItem2 \
    --namespace "$AB_NAMESPACE" \
    --body '[{"statCode": "zkQFP0rJ", "userId": "zYhDughy"}, {"statCode": "0603dGsC", "userId": "7ZHGtkqM"}, {"statCode": "GOiTJJ8c", "userId": "ATu7tXQc"}]' \
    > test.out 2>&1
eval_tap $? 72 'BulkResetUserStatItem2' test.out

#- 73 CreateStat1
./ng net.accelbyte.sdk.cli.Main social createStat1 \
    --namespace "$AB_NAMESPACE" \
    --body '{"capCycleOverride": false, "cycleIds": ["2dld5lNp", "6XD3xDrb", "5gVmewct"], "cycleOverrides": [{"cycleId": "Ev8imhGa", "maximum": 0.6634078217142689, "minimum": 0.7473435117067805}, {"cycleId": "xVkm3584", "maximum": 0.7617498197245255, "minimum": 0.9539590859035774}, {"cycleId": "cBB1xEE8", "maximum": 0.705077765557283, "minimum": 0.46715130898685353}], "defaultValue": 0.5535756614678147, "description": "UfTJHi3Q", "globalAggregationMethod": "MIN", "ignoreAdditionalDataOnValueRejected": false, "incrementOnly": true, "isPublic": true, "maximum": 0.05623599344902541, "minimum": 0.08492644848357067, "name": "Oja1li8X", "setAsGlobal": false, "setBy": "SERVER", "statCode": "jYyoVbOb", "tags": ["LJIQ5EOY", "RFTfqKTx", "4APeMJ5Y"], "visibility": "SERVERONLY"}' \
    > test.out 2>&1
eval_tap $? 73 'CreateStat1' test.out

#- 74 PublicListMyStatCycleItems
./ng net.accelbyte.sdk.cli.Main social publicListMyStatCycleItems \
    --cycleId 'm7j6vktm' \
    --namespace "$AB_NAMESPACE" \
    --limit '62' \
    --offset '24' \
    --sortBy 'MKWQfqXV' \
    --statCodes 'o5RNiSga,VorLSLqo,XscQOh4z' \
    > test.out 2>&1
eval_tap $? 74 'PublicListMyStatCycleItems' test.out

#- 75 PublicListMyStatItems
./ng net.accelbyte.sdk.cli.Main social publicListMyStatItems \
    --namespace "$AB_NAMESPACE" \
    --limit '92' \
    --offset '49' \
    --sortBy 'LOZny5bQ' \
    --statCodes 'WqLr5YYL,FniXdWal,ydN0LGCd' \
    --tags 'pHqw9vPA,sDGZRtrI,6IUhgYOg' \
    > test.out 2>&1
eval_tap $? 75 'PublicListMyStatItems' test.out

#- 76 PublicListAllMyStatItems
./ng net.accelbyte.sdk.cli.Main social publicListAllMyStatItems \
    --namespace "$AB_NAMESPACE" \
    --additionalKey 'L6ZMERFx' \
    --statCodes 'jUnZ55vc,NTc7FFxV,VLAHAiwC' \
    --tags '70c01HIt,AX2BsDxD,LdDhe4Ye' \
    > test.out 2>&1
eval_tap $? 76 'PublicListAllMyStatItems' test.out

#- 77 GetUserStatCycleItems1
./ng net.accelbyte.sdk.cli.Main social getUserStatCycleItems1 \
    --cycleId 'H8wQ9vKi' \
    --namespace "$AB_NAMESPACE" \
    --userId 'Os34z7Pk' \
    --limit '60' \
    --offset '69' \
    --sortBy 'sNWnORiE' \
    --statCodes 'bO3hWZIc' \
    > test.out 2>&1
eval_tap $? 77 'GetUserStatCycleItems1' test.out

#- 78 PublicQueryUserStatItems1
./ng net.accelbyte.sdk.cli.Main social publicQueryUserStatItems1 \
    --namespace "$AB_NAMESPACE" \
    --userId 'GaApo7Lg' \
    --limit '18' \
    --offset '84' \
    --sortBy 'EFLSRzfo' \
    --statCodes 'hu1N8yK3' \
    --tags 'cvUjyWeu' \
    > test.out 2>&1
eval_tap $? 78 'PublicQueryUserStatItems1' test.out

#- 79 PublicBulkCreateUserStatItems
./ng net.accelbyte.sdk.cli.Main social publicBulkCreateUserStatItems \
    --namespace "$AB_NAMESPACE" \
    --userId '6H8LHZ9c' \
    --body '[{"statCode": "SdwLwyUe"}, {"statCode": "UzdVLi7u"}, {"statCode": "hy9HClwE"}]' \
    > test.out 2>&1
eval_tap $? 79 'PublicBulkCreateUserStatItems' test.out

#- 80 PublicQueryUserStatItems
./ng net.accelbyte.sdk.cli.Main social publicQueryUserStatItems \
    --namespace "$AB_NAMESPACE" \
    --userId 'ieK6xtzv' \
    --additionalKey 'A34y96p3' \
    --statCodes 'lJcjK7NO,5lAjwp8J,gkq8m6vg' \
    --tags 'ntMtyIC6,SGuGYfZk,9jYzEc3p' \
    > test.out 2>&1
eval_tap $? 80 'PublicQueryUserStatItems' test.out

#- 81 PublicBulkIncUserStatItem1
./ng net.accelbyte.sdk.cli.Main social publicBulkIncUserStatItem1 \
    --namespace "$AB_NAMESPACE" \
    --userId 'CUipBroH' \
    --body '[{"inc": 0.02012991884784643, "statCode": "y0jAATYb"}, {"inc": 0.9326881476514869, "statCode": "EMdFrPcM"}, {"inc": 0.8214402334381757, "statCode": "AaL5Em5h"}]' \
    > test.out 2>&1
eval_tap $? 81 'PublicBulkIncUserStatItem1' test.out

#- 82 BulkIncUserStatItemValue2
./ng net.accelbyte.sdk.cli.Main social bulkIncUserStatItemValue2 \
    --namespace "$AB_NAMESPACE" \
    --userId 'hXUVBEOX' \
    --body '[{"inc": 0.3231070924405398, "statCode": "MHMHgyzk"}, {"inc": 0.7361483282243966, "statCode": "QagJwsdP"}, {"inc": 0.5188738308476158, "statCode": "2pI2L1uX"}]' \
    > test.out 2>&1
eval_tap $? 82 'BulkIncUserStatItemValue2' test.out

#- 83 BulkResetUserStatItem3
./ng net.accelbyte.sdk.cli.Main social bulkResetUserStatItem3 \
    --namespace "$AB_NAMESPACE" \
    --userId '6CP4RYwU' \
    --body '[{"statCode": "eoSsFbvb"}, {"statCode": "EwpOXGVv"}, {"statCode": "xbTDVN4X"}]' \
    > test.out 2>&1
eval_tap $? 83 'BulkResetUserStatItem3' test.out

#- 84 PublicCreateUserStatItem
./ng net.accelbyte.sdk.cli.Main social publicCreateUserStatItem \
    --namespace "$AB_NAMESPACE" \
    --statCode 'MKK4m2Gb' \
    --userId 'F4Y2pRaw' \
    > test.out 2>&1
eval_tap $? 84 'PublicCreateUserStatItem' test.out

#- 85 DeleteUserStatItems1
./ng net.accelbyte.sdk.cli.Main social deleteUserStatItems1 \
    --namespace "$AB_NAMESPACE" \
    --statCode 'gjLEo3QY' \
    --userId 'HJjxFqdM' \
    > test.out 2>&1
eval_tap $? 85 'DeleteUserStatItems1' test.out

#- 86 PublicIncUserStatItem
./ng net.accelbyte.sdk.cli.Main social publicIncUserStatItem \
    --namespace "$AB_NAMESPACE" \
    --statCode '2uIL1dfZ' \
    --userId 'WIbxd0lX' \
    --body '{"inc": 0.9766886086683412}' \
    > test.out 2>&1
eval_tap $? 86 'PublicIncUserStatItem' test.out

#- 87 PublicIncUserStatItemValue
./ng net.accelbyte.sdk.cli.Main social publicIncUserStatItemValue \
    --namespace "$AB_NAMESPACE" \
    --statCode 'sMf6ioGd' \
    --userId 'KqFswFvu' \
    --body '{"inc": 0.9712946690154597}' \
    > test.out 2>&1
eval_tap $? 87 'PublicIncUserStatItemValue' test.out

#- 88 ResetUserStatItemValue1
./ng net.accelbyte.sdk.cli.Main social resetUserStatItemValue1 \
    --namespace "$AB_NAMESPACE" \
    --statCode 'qS9Of6Wr' \
    --userId 'oaoNbk0B' \
    > test.out 2>&1
eval_tap $? 88 'ResetUserStatItemValue1' test.out

#- 89 BulkUpdateUserStatItemV2
./ng net.accelbyte.sdk.cli.Main social bulkUpdateUserStatItemV2 \
    --namespace "$AB_NAMESPACE" \
    --body '[{"additionalData": {"pNfae1Yq": {}, "HIdBb4K5": {}, "BGhADvQX": {}}, "additionalKey": "aLMYOb64", "requestId": "XTCuBPum", "statCode": "6BidCKgG", "updateStrategy": "INCREMENT", "userId": "6JWM9BIQ", "value": 0.3247953022178046}, {"additionalData": {"uUZWakMT": {}, "PieJbAS2": {}, "5esLx0gM": {}}, "additionalKey": "P7KzPLBy", "requestId": "QSqD3zkj", "statCode": "maXpW762", "updateStrategy": "OVERRIDE", "userId": "dYx5vvVF", "value": 0.36180298608394845}, {"additionalData": {"KnsMfzvT": {}, "vdbq0yln": {}, "WCFE030Z": {}}, "additionalKey": "sfguqzMr", "requestId": "F3Tvf65X", "statCode": "Qwdqyy0d", "updateStrategy": "INCREMENT", "userId": "icRjengy", "value": 0.2681876880896715}]' \
    > test.out 2>&1
eval_tap $? 89 'BulkUpdateUserStatItemV2' test.out

#- 90 BulkFetchOrDefaultStatItems1
./ng net.accelbyte.sdk.cli.Main social bulkFetchOrDefaultStatItems1 \
    --namespace "$AB_NAMESPACE" \
    --additionalKey 'kDCdjJh4' \
    --statCode 'iBlB19SU' \
    --userIds 'JyMkvsFq,1TzC37ry,7MfHxIjQ' \
    > test.out 2>&1
eval_tap $? 90 'BulkFetchOrDefaultStatItems1' test.out

#- 91 AdminListUsersStatItems
./ng net.accelbyte.sdk.cli.Main social adminListUsersStatItems \
    --namespace "$AB_NAMESPACE" \
    --userId '7PfRfnph' \
    --additionalKey '3rNuqRaQ' \
    --statCodes 'ceQpGScI,gnop0now,D2h1H5e1' \
    --tags '3ZqOdgX1,mfl0aQJ2,OO2HMQKS' \
    > test.out 2>&1
eval_tap $? 91 'AdminListUsersStatItems' test.out

#- 92 BulkUpdateUserStatItem
./ng net.accelbyte.sdk.cli.Main social bulkUpdateUserStatItem \
    --namespace "$AB_NAMESPACE" \
    --userId '4Y7cfqvD' \
    --additionalKey 'c1apAGLY' \
    --body '[{"additionalData": {"5WxThxzN": {}, "iEiUlIDL": {}, "zfY7XaYh": {}}, "requestId": "JEDStNcD", "statCode": "wqLG5vm9", "updateStrategy": "MAX", "value": 0.01110113370878052}, {"additionalData": {"oIUJAFaE": {}, "o8kHGzXG": {}, "yjYnxr77": {}}, "requestId": "pkb2ozIm", "statCode": "KvScNejI", "updateStrategy": "OVERRIDE", "value": 0.22338353094836738}, {"additionalData": {"wTFKIwCB": {}, "B5Zw2f7Z": {}, "HGYgKnXf": {}}, "requestId": "kAFeH4g0", "statCode": "WdodUeRX", "updateStrategy": "INCREMENT", "value": 0.8350718051825807}]' \
    > test.out 2>&1
eval_tap $? 92 'BulkUpdateUserStatItem' test.out

#- 93 BulkGetOrDefaultByUserId
./ng net.accelbyte.sdk.cli.Main social bulkGetOrDefaultByUserId \
    --namespace "$AB_NAMESPACE" \
    --userId 'hq1g51fv' \
    --additionalKey 'BnGe2Okn' \
    --body '{"statCodes": ["0qkTuqZo", "Wm7vgp6c", "4ewQOqzv"]}' \
    > test.out 2>&1
eval_tap $? 93 'BulkGetOrDefaultByUserId' test.out

#- 94 BulkResetUserStatItemValues
./ng net.accelbyte.sdk.cli.Main social bulkResetUserStatItemValues \
    --namespace "$AB_NAMESPACE" \
    --userId 'KVOSpoZz' \
    --additionalKey 'Y8SNgKZ2' \
    --body '[{"additionalData": {"i3X2vXdC": {}, "8RxFtcJy": {}, "qxGZdnxD": {}}, "statCode": "fz0UsCME"}, {"additionalData": {"9Fg3MAxK": {}, "ZRZ2pVgT": {}, "jPFeq8eq": {}}, "statCode": "kQDQUUKe"}, {"additionalData": {"8DaQHRKS": {}, "4LpQcysR": {}, "P1pt59zq": {}}, "statCode": "sEqGEMzu"}]' \
    > test.out 2>&1
eval_tap $? 94 'BulkResetUserStatItemValues' test.out

#- 95 DeleteUserStatItems2
./ng net.accelbyte.sdk.cli.Main social deleteUserStatItems2 \
    --namespace "$AB_NAMESPACE" \
    --statCode '1D70kAOk' \
    --userId 'jA6llDr5' \
    --additionalKey 'RRdp1Ps0' \
    > test.out 2>&1
eval_tap $? 95 'DeleteUserStatItems2' test.out

#- 96 UpdateUserStatItemValue
./ng net.accelbyte.sdk.cli.Main social updateUserStatItemValue \
    --namespace "$AB_NAMESPACE" \
    --statCode 'hgwS0SIt' \
    --userId 'gHDu45OI' \
    --additionalKey 'hVCrcjtv' \
    --body '{"additionalData": {"kWyOgh3h": {}, "zyOx6IzK": {}, "OPGsjqcm": {}}, "updateStrategy": "MAX", "value": 0.9546403059861968}' \
    > test.out 2>&1
eval_tap $? 96 'UpdateUserStatItemValue' test.out

#- 97 BulkUpdateUserStatItem1
./ng net.accelbyte.sdk.cli.Main social bulkUpdateUserStatItem1 \
    --namespace "$AB_NAMESPACE" \
    --body '[{"additionalData": {"ONuvsbxB": {}, "MjYI4rPp": {}, "UoeXJWgP": {}}, "additionalKey": "mOocZR59", "requestId": "TzcZKPVy", "statCode": "Z9hKHXuk", "updateStrategy": "MIN", "userId": "96znYyg2", "value": 0.1128187994314781}, {"additionalData": {"QvlXAoYq": {}, "w2n0T8xy": {}, "5aa2Oquz": {}}, "additionalKey": "8t68xOeU", "requestId": "N9Ho70ts", "statCode": "tUBhqCHL", "updateStrategy": "MIN", "userId": "LTItPhJO", "value": 0.8083784244439155}, {"additionalData": {"GUDWd3vr": {}, "DdpHHvi1": {}, "Yy8cZeB9": {}}, "additionalKey": "bieG6nwm", "requestId": "VKaBhI89", "statCode": "rW4wm37u", "updateStrategy": "MAX", "userId": "0XCH6DYc", "value": 0.718942918363107}]' \
    > test.out 2>&1
eval_tap $? 97 'BulkUpdateUserStatItem1' test.out

#- 98 PublicQueryUserStatItems2
./ng net.accelbyte.sdk.cli.Main social publicQueryUserStatItems2 \
    --namespace "$AB_NAMESPACE" \
    --userId 'J9O6IfYq' \
    --additionalKey 'njrMOiaT' \
    --statCodes 'CkRZg54N,kA67XxrH,skIZjwHc' \
    --tags 'SvRUJqBt,Lr3ep9a9,oN4kGwSB' \
    > test.out 2>&1
eval_tap $? 98 'PublicQueryUserStatItems2' test.out

#- 99 BulkUpdateUserStatItem2
./ng net.accelbyte.sdk.cli.Main social bulkUpdateUserStatItem2 \
    --namespace "$AB_NAMESPACE" \
    --userId 'R9BR65hP' \
    --additionalKey '0SELOikZ' \
    --body '[{"additionalData": {"Q5l3hLXf": {}, "ODEDSZe4": {}, "MFlgM8Ss": {}}, "requestId": "WLaLY64w", "statCode": "mLSvZYbE", "updateStrategy": "MAX", "value": 0.07759040624837987}, {"additionalData": {"nibyKitk": {}, "zDPehUFm": {}, "Zni9cSFo": {}}, "requestId": "R66HlzxR", "statCode": "zKcyERZQ", "updateStrategy": "MAX", "value": 0.010124305603442796}, {"additionalData": {"N1H9dAsW": {}, "hiFTjU2N": {}, "Fc6oZJwm": {}}, "requestId": "pUBpw1rV", "statCode": "3cCGIFnw", "updateStrategy": "INCREMENT", "value": 0.4081683749088513}]' \
    > test.out 2>&1
eval_tap $? 99 'BulkUpdateUserStatItem2' test.out

#- 100 UpdateUserStatItemValue1
./ng net.accelbyte.sdk.cli.Main social updateUserStatItemValue1 \
    --namespace "$AB_NAMESPACE" \
    --statCode 'IJnV7Ydj' \
    --userId 'ZzKo5LaN' \
    --additionalKey 'nCUeFmQV' \
    --body '{"additionalData": {"Bm0yyMsB": {}, "Gl0Vjw4C": {}, "BfVZGioV": {}}, "updateStrategy": "OVERRIDE", "value": 0.665533783463968}' \
    > test.out 2>&1
eval_tap $? 100 'UpdateUserStatItemValue1' test.out


rm -f "tmp.dat"

exit $EXIT_CODE