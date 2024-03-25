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
    --userId 'djfOij1m' \
    > test.out 2>&1
eval_tap $? 8 'GetUserProfiles' test.out

#- 9 GetProfile
./ng net.accelbyte.sdk.cli.Main social getProfile \
    --namespace "$AB_NAMESPACE" \
    --profileId 'MaYF9aCx' \
    --userId '3ory84kE' \
    > test.out 2>&1
eval_tap $? 9 'GetProfile' test.out

#- 10 GetUserNamespaceSlots
eval_tap 0 10 'GetUserNamespaceSlots # SKIP deprecated' test.out

#- 11 GetSlotData
eval_tap 0 11 'GetSlotData # SKIP deprecated' test.out

#- 12 PublicGetUserGameProfiles
./ng net.accelbyte.sdk.cli.Main social publicGetUserGameProfiles \
    --namespace "$AB_NAMESPACE" \
    --userIds 'DX8DtPX4,Em08gpZ9,Jxb6J7QK' \
    > test.out 2>&1
eval_tap $? 12 'PublicGetUserGameProfiles' test.out

#- 13 PublicGetUserProfiles
./ng net.accelbyte.sdk.cli.Main social publicGetUserProfiles \
    --namespace "$AB_NAMESPACE" \
    --userId 'HXb3PvYJ' \
    > test.out 2>&1
eval_tap $? 13 'PublicGetUserProfiles' test.out

#- 14 PublicCreateProfile
./ng net.accelbyte.sdk.cli.Main social publicCreateProfile \
    --namespace "$AB_NAMESPACE" \
    --userId 'bS6kLV6r' \
    --body '{"achievements": ["gGppryQo", "7uSrcXTX", "aALu6AgF"], "attributes": {"mKHCJrUt": "P7tQeIOj", "gauCa0iW": "VHnuMEHj", "iqXfm4kU": "eanQ4ydU"}, "avatarUrl": "IQNNqwOu", "inventories": ["HkQxxJ6q", "QsafLe8j", "LP2kVT0I"], "label": "bismzsbE", "profileName": "5jT2C5Xi", "statistics": ["k1PLeKRn", "CEo0weI9", "u6LOwewN"], "tags": ["5Wq9UN1f", "mhukgCa9", "AMsZHrn5"]}' \
    > test.out 2>&1
eval_tap $? 14 'PublicCreateProfile' test.out

#- 15 PublicGetProfile
./ng net.accelbyte.sdk.cli.Main social publicGetProfile \
    --namespace "$AB_NAMESPACE" \
    --profileId 'vwETa8zw' \
    --userId '6NtvuwFU' \
    > test.out 2>&1
eval_tap $? 15 'PublicGetProfile' test.out

#- 16 PublicUpdateProfile
./ng net.accelbyte.sdk.cli.Main social publicUpdateProfile \
    --namespace "$AB_NAMESPACE" \
    --profileId '6yZvJJ6h' \
    --userId 'NekGOKv5' \
    --body '{"achievements": ["13IH0tbI", "riNXSq7v", "v8CdN9Jq"], "attributes": {"7azvLE0p": "AMpXa3ll", "JsIAopgB": "LyeW1d38", "0aZQeN8s": "I1PxhaC4"}, "avatarUrl": "5MdkRdF3", "inventories": ["NnF5n0Ow", "pIRW9Ara", "CVqVJRHh"], "label": "akklm7iw", "profileName": "FAFzWLrP", "statistics": ["aJmtW8je", "nUMUdHCc", "sF7lQ15x"], "tags": ["vi67GI51", "NgE7BP0Y", "mPWhzIS5"]}' \
    > test.out 2>&1
eval_tap $? 16 'PublicUpdateProfile' test.out

#- 17 PublicDeleteProfile
./ng net.accelbyte.sdk.cli.Main social publicDeleteProfile \
    --namespace "$AB_NAMESPACE" \
    --profileId '2utDbuW1' \
    --userId '4WdWvCdt' \
    > test.out 2>&1
eval_tap $? 17 'PublicDeleteProfile' test.out

#- 18 PublicGetProfileAttribute
./ng net.accelbyte.sdk.cli.Main social publicGetProfileAttribute \
    --attributeName 'qAxrdZZe' \
    --namespace "$AB_NAMESPACE" \
    --profileId 'lNamJraM' \
    --userId 'kqmNs9Cw' \
    > test.out 2>&1
eval_tap $? 18 'PublicGetProfileAttribute' test.out

#- 19 PublicUpdateAttribute
./ng net.accelbyte.sdk.cli.Main social publicUpdateAttribute \
    --attributeName 'kTEEjFdB' \
    --namespace "$AB_NAMESPACE" \
    --profileId 'PQOnJ9zl' \
    --userId 'jRSyEVht' \
    --body '{"name": "BcLtHGub", "value": "tn12Vk6F"}' \
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
    --limit '57' \
    --offset '34' \
    --statCodes 'OHGVuZAL' \
    > test.out 2>&1
eval_tap $? 26 'GetGlobalStatItems' test.out

#- 27 GetGlobalStatItemByStatCode
./ng net.accelbyte.sdk.cli.Main social getGlobalStatItemByStatCode \
    --namespace "$AB_NAMESPACE" \
    --statCode 'VDMrrqHZ' \
    > test.out 2>&1
eval_tap $? 27 'GetGlobalStatItemByStatCode' test.out

#- 28 GetStatCycles
./ng net.accelbyte.sdk.cli.Main social getStatCycles \
    --namespace "$AB_NAMESPACE" \
    --cycleType 'MONTHLY' \
    --limit '57' \
    --name 'UUsjsvrU' \
    --offset '38' \
    --sortBy 'g7v3w5zR' \
    --status 'STOPPED' \
    > test.out 2>&1
eval_tap $? 28 'GetStatCycles' test.out

#- 29 CreateStatCycle
./ng net.accelbyte.sdk.cli.Main social createStatCycle \
    --namespace "$AB_NAMESPACE" \
    --body '{"cycleType": "MONTHLY", "description": "EaUlTV2w", "end": "1983-07-11T00:00:00Z", "name": "kx4xwO4p", "resetDate": 8, "resetDay": 75, "resetMonth": 32, "resetTime": "u3AFdml2", "seasonPeriod": 87, "start": "1987-08-03T00:00:00Z"}' \
    > test.out 2>&1
eval_tap $? 29 'CreateStatCycle' test.out

#- 30 BulkGetStatCycle
./ng net.accelbyte.sdk.cli.Main social bulkGetStatCycle \
    --namespace "$AB_NAMESPACE" \
    --body '{"cycleIds": ["lZAVqzET", "wkjayQrJ", "teEyCJPt"]}' \
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
    --cycleId 'bKPesaEs' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 33 'GetStatCycle' test.out

#- 34 UpdateStatCycle
./ng net.accelbyte.sdk.cli.Main social updateStatCycle \
    --cycleId 'pqRbhO7c' \
    --namespace "$AB_NAMESPACE" \
    --body '{"cycleType": "SEASONAL", "description": "v4CgkGLb", "end": "1974-05-03T00:00:00Z", "name": "pIx4TU5h", "resetDate": 98, "resetDay": 3, "resetMonth": 56, "resetTime": "VtPhwRql", "seasonPeriod": 36, "start": "1978-01-12T00:00:00Z"}' \
    > test.out 2>&1
eval_tap $? 34 'UpdateStatCycle' test.out

#- 35 DeleteStatCycle
./ng net.accelbyte.sdk.cli.Main social deleteStatCycle \
    --cycleId 'iZ2R6BUm' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 35 'DeleteStatCycle' test.out

#- 36 BulkAddStats
./ng net.accelbyte.sdk.cli.Main social bulkAddStats \
    --cycleId 'LUvku7cW' \
    --namespace "$AB_NAMESPACE" \
    --body '{"statCodes": ["7VjrkHzb", "oZyX4kdB", "0cHldyee"]}' \
    > test.out 2>&1
eval_tap $? 36 'BulkAddStats' test.out

#- 37 StopStatCycle
./ng net.accelbyte.sdk.cli.Main social stopStatCycle \
    --cycleId 'ImWuLa97' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 37 'StopStatCycle' test.out

#- 38 BulkFetchStatItems
./ng net.accelbyte.sdk.cli.Main social bulkFetchStatItems \
    --namespace "$AB_NAMESPACE" \
    --statCode 'MNXsFaCr' \
    --userIds 'zPOLTJCy' \
    > test.out 2>&1
eval_tap $? 38 'BulkFetchStatItems' test.out

#- 39 BulkIncUserStatItem
./ng net.accelbyte.sdk.cli.Main social bulkIncUserStatItem \
    --namespace "$AB_NAMESPACE" \
    --body '[{"inc": 0.2631386547142843, "statCode": "640EM3KO", "userId": "q1cvMtnc"}, {"inc": 0.9535730984346531, "statCode": "3t0CvNh0", "userId": "I8qQWRsE"}, {"inc": 0.6724136230042553, "statCode": "mmMD8ssO", "userId": "1yjyIu9y"}]' \
    > test.out 2>&1
eval_tap $? 39 'BulkIncUserStatItem' test.out

#- 40 BulkIncUserStatItemValue
./ng net.accelbyte.sdk.cli.Main social bulkIncUserStatItemValue \
    --namespace "$AB_NAMESPACE" \
    --body '[{"inc": 0.9098847013532626, "statCode": "7WDMtNIx", "userId": "uVyVceat"}, {"inc": 0.7844443980297579, "statCode": "PH3LOH7j", "userId": "ksflIuqS"}, {"inc": 0.6138725405543065, "statCode": "K1uZ9XR0", "userId": "YY1PJB40"}]' \
    > test.out 2>&1
eval_tap $? 40 'BulkIncUserStatItemValue' test.out

#- 41 BulkFetchOrDefaultStatItems
./ng net.accelbyte.sdk.cli.Main social bulkFetchOrDefaultStatItems \
    --namespace "$AB_NAMESPACE" \
    --statCode 'QYaNOMaX' \
    --userIds 'DUrjBxp1,sRL9ifrp,SRprGir6' \
    > test.out 2>&1
eval_tap $? 41 'BulkFetchOrDefaultStatItems' test.out

#- 42 BulkResetUserStatItem
./ng net.accelbyte.sdk.cli.Main social bulkResetUserStatItem \
    --namespace "$AB_NAMESPACE" \
    --body '[{"statCode": "uzCAfnVn", "userId": "BZwLoywV"}, {"statCode": "9FWUgilz", "userId": "LXHd198v"}, {"statCode": "jGzFOQK8", "userId": "6h5pP2B4"}]' \
    > test.out 2>&1
eval_tap $? 42 'BulkResetUserStatItem' test.out

#- 43 GetStats
./ng net.accelbyte.sdk.cli.Main social getStats \
    --namespace "$AB_NAMESPACE" \
    --cycleIds 'GZx10OEo' \
    --isGlobal  \
    --isPublic  \
    --limit '78' \
    --offset '61' \
    > test.out 2>&1
eval_tap $? 43 'GetStats' test.out

#- 44 CreateStat
./ng net.accelbyte.sdk.cli.Main social createStat \
    --namespace "$AB_NAMESPACE" \
    --body '{"cycleIds": ["a7dGUwyJ", "psSPoWqz", "wRz4H9Sf"], "defaultValue": 0.9823836197195189, "description": "6It07crv", "globalAggregationMethod": "MIN", "ignoreAdditionalDataOnValueRejected": false, "incrementOnly": true, "isPublic": true, "maximum": 0.2567192001331614, "minimum": 0.9794661512719107, "name": "4dcILyLM", "setAsGlobal": true, "setBy": "SERVER", "statCode": "vlE1ipc5", "tags": ["6SPQOISe", "StZGoWKw", "KdCH1E4C"]}' \
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
    --limit '91' \
    --offset '13' \
    --keyword 'bXjMiwID' \
    > test.out 2>&1
eval_tap $? 47 'QueryStats' test.out

#- 48 GetStat
./ng net.accelbyte.sdk.cli.Main social getStat \
    --namespace "$AB_NAMESPACE" \
    --statCode 'cNgiashQ' \
    > test.out 2>&1
eval_tap $? 48 'GetStat' test.out

#- 49 DeleteStat
./ng net.accelbyte.sdk.cli.Main social deleteStat \
    --namespace "$AB_NAMESPACE" \
    --statCode 'bD8SqqNC' \
    > test.out 2>&1
eval_tap $? 49 'DeleteStat' test.out

#- 50 UpdateStat
./ng net.accelbyte.sdk.cli.Main social updateStat \
    --namespace "$AB_NAMESPACE" \
    --statCode 'E4BOx7TZ' \
    --body '{"cycleIds": ["vtGxsm9p", "E6rJ4UdI", "AmvqSMkW"], "defaultValue": 0.3593414248112681, "description": "rEZZILC6", "globalAggregationMethod": "MAX", "ignoreAdditionalDataOnValueRejected": true, "isPublic": false, "name": "yzlRh4ea", "tags": ["koild64t", "Bq5BMTO3", "IhzMpu1Z"]}' \
    > test.out 2>&1
eval_tap $? 50 'UpdateStat' test.out

#- 51 GetStatItems
./ng net.accelbyte.sdk.cli.Main social getStatItems \
    --namespace "$AB_NAMESPACE" \
    --statCode 'Die50PSL' \
    --limit '38' \
    --offset '63' \
    --sortBy '0w4zsIiU' \
    > test.out 2>&1
eval_tap $? 51 'GetStatItems' test.out

#- 52 DeleteTiedStat
./ng net.accelbyte.sdk.cli.Main social deleteTiedStat \
    --namespace "$AB_NAMESPACE" \
    --statCode 'jFQHJ4sy' \
    > test.out 2>&1
eval_tap $? 52 'DeleteTiedStat' test.out

#- 53 GetUserStatCycleItems
./ng net.accelbyte.sdk.cli.Main social getUserStatCycleItems \
    --cycleId '8v30WVqP' \
    --namespace "$AB_NAMESPACE" \
    --userId '1c9pGzGX' \
    --isPublic  \
    --limit '12' \
    --offset '17' \
    --sortBy 'JUlb5dGC' \
    --statCodes '475Rw9HQ' \
    > test.out 2>&1
eval_tap $? 53 'GetUserStatCycleItems' test.out

#- 54 GetUserStatItems
./ng net.accelbyte.sdk.cli.Main social getUserStatItems \
    --namespace "$AB_NAMESPACE" \
    --userId 'I0TuO5Hi' \
    --isPublic  \
    --limit '94' \
    --offset '66' \
    --sortBy 'LPhdThRZ' \
    --statCodes 'nG0JY8dp' \
    --tags 'NJaVWMFi' \
    > test.out 2>&1
eval_tap $? 54 'GetUserStatItems' test.out

#- 55 BulkCreateUserStatItems
./ng net.accelbyte.sdk.cli.Main social bulkCreateUserStatItems \
    --namespace "$AB_NAMESPACE" \
    --userId 'EXI6EsyM' \
    --body '[{"statCode": "u5E8AlKy"}, {"statCode": "MdHpm1Pt"}, {"statCode": "mR7SjakL"}]' \
    > test.out 2>&1
eval_tap $? 55 'BulkCreateUserStatItems' test.out

#- 56 BulkIncUserStatItem1
./ng net.accelbyte.sdk.cli.Main social bulkIncUserStatItem1 \
    --namespace "$AB_NAMESPACE" \
    --userId '4y7uCWVg' \
    --body '[{"inc": 0.8395584869016482, "statCode": "lKLXuoyU"}, {"inc": 0.9112139820248579, "statCode": "4fxpdnvk"}, {"inc": 0.8209108899041798, "statCode": "rvs8NosO"}]' \
    > test.out 2>&1
eval_tap $? 56 'BulkIncUserStatItem1' test.out

#- 57 BulkIncUserStatItemValue1
./ng net.accelbyte.sdk.cli.Main social bulkIncUserStatItemValue1 \
    --namespace "$AB_NAMESPACE" \
    --userId 'XaM27Q76' \
    --body '[{"inc": 0.12907555241704483, "statCode": "83lrn4aG"}, {"inc": 0.5018694862724316, "statCode": "mxKkAcwL"}, {"inc": 0.43693514125464805, "statCode": "yVvcraYk"}]' \
    > test.out 2>&1
eval_tap $? 57 'BulkIncUserStatItemValue1' test.out

#- 58 BulkResetUserStatItem1
./ng net.accelbyte.sdk.cli.Main social bulkResetUserStatItem1 \
    --namespace "$AB_NAMESPACE" \
    --userId 'TpMNOZ1i' \
    --body '[{"statCode": "JQm7Eid0"}, {"statCode": "aRT7kRm6"}, {"statCode": "eB9Q8dZ0"}]' \
    > test.out 2>&1
eval_tap $? 58 'BulkResetUserStatItem1' test.out

#- 59 CreateUserStatItem
./ng net.accelbyte.sdk.cli.Main social createUserStatItem \
    --namespace "$AB_NAMESPACE" \
    --statCode 'JuNxs5w2' \
    --userId 'IAX06Kp8' \
    > test.out 2>&1
eval_tap $? 59 'CreateUserStatItem' test.out

#- 60 DeleteUserStatItems
./ng net.accelbyte.sdk.cli.Main social deleteUserStatItems \
    --namespace "$AB_NAMESPACE" \
    --statCode 'ZE2NbZDc' \
    --userId 'tHK4Tf5G' \
    > test.out 2>&1
eval_tap $? 60 'DeleteUserStatItems' test.out

#- 61 IncUserStatItemValue
./ng net.accelbyte.sdk.cli.Main social incUserStatItemValue \
    --namespace "$AB_NAMESPACE" \
    --statCode 'X3D2CKOp' \
    --userId 'aRKK5nPA' \
    --body '{"inc": 0.8319592474110352}' \
    > test.out 2>&1
eval_tap $? 61 'IncUserStatItemValue' test.out

#- 62 ResetUserStatItemValue
./ng net.accelbyte.sdk.cli.Main social resetUserStatItemValue \
    --namespace "$AB_NAMESPACE" \
    --statCode 'UUZpGJgJ' \
    --userId 'Ci1vf4Cj' \
    --additionalKey '1PdPefLF' \
    --body '{"additionalData": {"NzsL1kOk": {}, "al2bmGOs": {}, "zjLD0qm4": {}}}' \
    > test.out 2>&1
eval_tap $? 62 'ResetUserStatItemValue' test.out

#- 63 GetGlobalStatItems1
./ng net.accelbyte.sdk.cli.Main social getGlobalStatItems1 \
    --namespace "$AB_NAMESPACE" \
    --limit '95' \
    --offset '8' \
    --statCodes 'zllrh7aV' \
    > test.out 2>&1
eval_tap $? 63 'GetGlobalStatItems1' test.out

#- 64 GetGlobalStatItemByStatCode1
./ng net.accelbyte.sdk.cli.Main social getGlobalStatItemByStatCode1 \
    --namespace "$AB_NAMESPACE" \
    --statCode 'A3LefWXa' \
    > test.out 2>&1
eval_tap $? 64 'GetGlobalStatItemByStatCode1' test.out

#- 65 GetStatCycles1
./ng net.accelbyte.sdk.cli.Main social getStatCycles1 \
    --namespace "$AB_NAMESPACE" \
    --cycleType 'DAILY' \
    --limit '74' \
    --name 'U4kKmlro' \
    --offset '99' \
    --sortBy 'tFuHtm5o' \
    --status 'STOPPED' \
    > test.out 2>&1
eval_tap $? 65 'GetStatCycles1' test.out

#- 66 BulkGetStatCycle1
./ng net.accelbyte.sdk.cli.Main social bulkGetStatCycle1 \
    --namespace "$AB_NAMESPACE" \
    --body '{"cycleIds": ["k8NJ1Kx9", "8LrS4i4X", "DlApPxzJ"]}' \
    > test.out 2>&1
eval_tap $? 66 'BulkGetStatCycle1' test.out

#- 67 GetStatCycle1
./ng net.accelbyte.sdk.cli.Main social getStatCycle1 \
    --cycleId 'E4t9xEBt' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 67 'GetStatCycle1' test.out

#- 68 BulkFetchStatItems1
./ng net.accelbyte.sdk.cli.Main social bulkFetchStatItems1 \
    --namespace "$AB_NAMESPACE" \
    --statCode 'mD0NwKB7' \
    --userIds 'UHWYRV0A' \
    > test.out 2>&1
eval_tap $? 68 'BulkFetchStatItems1' test.out

#- 69 PublicBulkIncUserStatItem
./ng net.accelbyte.sdk.cli.Main social publicBulkIncUserStatItem \
    --namespace "$AB_NAMESPACE" \
    --body '[{"inc": 0.39618665236279893, "statCode": "MEYtmHP0", "userId": "eWWLGMTS"}, {"inc": 0.15506787011449708, "statCode": "VNrb2ycW", "userId": "BrP6pylG"}, {"inc": 0.3452101489364211, "statCode": "ye6TbprH", "userId": "jLc3fqq1"}]' \
    > test.out 2>&1
eval_tap $? 69 'PublicBulkIncUserStatItem' test.out

#- 70 PublicBulkIncUserStatItemValue
./ng net.accelbyte.sdk.cli.Main social publicBulkIncUserStatItemValue \
    --namespace "$AB_NAMESPACE" \
    --body '[{"inc": 0.9119170849458178, "statCode": "oFY9qSZD", "userId": "uy3J7ZXU"}, {"inc": 0.09324515799801292, "statCode": "Dg9d3Gu2", "userId": "yD2hgGN8"}, {"inc": 0.9067631643813293, "statCode": "QMFk8lX8", "userId": "RETWcxFe"}]' \
    > test.out 2>&1
eval_tap $? 70 'PublicBulkIncUserStatItemValue' test.out

#- 71 BulkResetUserStatItem2
./ng net.accelbyte.sdk.cli.Main social bulkResetUserStatItem2 \
    --namespace "$AB_NAMESPACE" \
    --body '[{"statCode": "l4hTvYvV", "userId": "H7suwJLf"}, {"statCode": "O0znMjtu", "userId": "xlhJxfwi"}, {"statCode": "EdU180km", "userId": "ZvJCGcX6"}]' \
    > test.out 2>&1
eval_tap $? 71 'BulkResetUserStatItem2' test.out

#- 72 CreateStat1
./ng net.accelbyte.sdk.cli.Main social createStat1 \
    --namespace "$AB_NAMESPACE" \
    --body '{"cycleIds": ["URIoGa4U", "424ASzjA", "e9iOPK0M"], "defaultValue": 0.34782330060809463, "description": "efch3byB", "globalAggregationMethod": "TOTAL", "ignoreAdditionalDataOnValueRejected": true, "incrementOnly": true, "isPublic": true, "maximum": 0.37566662221986147, "minimum": 0.05839619665117868, "name": "OrtWwtGD", "setAsGlobal": true, "setBy": "SERVER", "statCode": "uNIj2xVm", "tags": ["idiInsSo", "zgyk38IX", "jtjbAwHd"]}' \
    > test.out 2>&1
eval_tap $? 72 'CreateStat1' test.out

#- 73 PublicListMyStatCycleItems
./ng net.accelbyte.sdk.cli.Main social publicListMyStatCycleItems \
    --cycleId '62lTNe1O' \
    --namespace "$AB_NAMESPACE" \
    --limit '70' \
    --offset '94' \
    --sortBy 'qHfYiVuS' \
    --statCodes 'E2UJ6Chd,WmgBQcau,wQv3Ibe0' \
    > test.out 2>&1
eval_tap $? 73 'PublicListMyStatCycleItems' test.out

#- 74 PublicListMyStatItems
./ng net.accelbyte.sdk.cli.Main social publicListMyStatItems \
    --namespace "$AB_NAMESPACE" \
    --limit '11' \
    --offset '10' \
    --sortBy 'd20iyNsK' \
    --statCodes 'tABQ1tEF,pHGTelCK,XUKZM6Al' \
    --tags '4hmIYhZg,m8cXfElV,WzSrmSGI' \
    > test.out 2>&1
eval_tap $? 74 'PublicListMyStatItems' test.out

#- 75 PublicListAllMyStatItems
./ng net.accelbyte.sdk.cli.Main social publicListAllMyStatItems \
    --namespace "$AB_NAMESPACE" \
    --additionalKey 'LSu9ZChM' \
    --statCodes 'GzuHsq3P,M8Nel9D5,Y8qnH8Le' \
    --tags 'x5KhedeO,qqDCaQvI,p8HsCotK' \
    > test.out 2>&1
eval_tap $? 75 'PublicListAllMyStatItems' test.out

#- 76 GetUserStatCycleItems1
./ng net.accelbyte.sdk.cli.Main social getUserStatCycleItems1 \
    --cycleId 'Naw8EUOn' \
    --namespace "$AB_NAMESPACE" \
    --userId 'tW61grTl' \
    --limit '76' \
    --offset '5' \
    --sortBy 'dtPXx4Jx' \
    --statCodes 'oXOVYYvz' \
    > test.out 2>&1
eval_tap $? 76 'GetUserStatCycleItems1' test.out

#- 77 PublicQueryUserStatItems
./ng net.accelbyte.sdk.cli.Main social publicQueryUserStatItems \
    --namespace "$AB_NAMESPACE" \
    --userId 'vMs0CAMV' \
    --limit '68' \
    --offset '88' \
    --sortBy 'dx8okHLS' \
    --statCodes 'H3ghNcd1' \
    --tags 'NJb3LnX7' \
    > test.out 2>&1
eval_tap $? 77 'PublicQueryUserStatItems' test.out

#- 78 PublicBulkCreateUserStatItems
./ng net.accelbyte.sdk.cli.Main social publicBulkCreateUserStatItems \
    --namespace "$AB_NAMESPACE" \
    --userId '7sZ6Y9PJ' \
    --body '[{"statCode": "b5ueYhol"}, {"statCode": "ApmdYDnc"}, {"statCode": "IzJjYZlz"}]' \
    > test.out 2>&1
eval_tap $? 78 'PublicBulkCreateUserStatItems' test.out

#- 79 PublicQueryUserStatItems1
./ng net.accelbyte.sdk.cli.Main social publicQueryUserStatItems1 \
    --namespace "$AB_NAMESPACE" \
    --userId 'JvzlJ0Wx' \
    --additionalKey 'P3RwTz16' \
    --statCodes 'BES64vkg,76meXDvt,Zs3vaunN' \
    --tags 'WACWVx8Y,QPTU9jIH,bUeXgYdM' \
    > test.out 2>&1
eval_tap $? 79 'PublicQueryUserStatItems1' test.out

#- 80 PublicBulkIncUserStatItem1
./ng net.accelbyte.sdk.cli.Main social publicBulkIncUserStatItem1 \
    --namespace "$AB_NAMESPACE" \
    --userId 'GPLIBHk2' \
    --body '[{"inc": 0.5876951029154288, "statCode": "cd1qaUmL"}, {"inc": 0.6108037334336739, "statCode": "lOmfMzlJ"}, {"inc": 0.19221752199387232, "statCode": "uUJD6vk4"}]' \
    > test.out 2>&1
eval_tap $? 80 'PublicBulkIncUserStatItem1' test.out

#- 81 BulkIncUserStatItemValue2
./ng net.accelbyte.sdk.cli.Main social bulkIncUserStatItemValue2 \
    --namespace "$AB_NAMESPACE" \
    --userId 'wDGZMGht' \
    --body '[{"inc": 0.8153304069321068, "statCode": "Yn4JRYGJ"}, {"inc": 0.023698652473792214, "statCode": "I3lM8use"}, {"inc": 0.034492368471689794, "statCode": "Sw106Byc"}]' \
    > test.out 2>&1
eval_tap $? 81 'BulkIncUserStatItemValue2' test.out

#- 82 BulkResetUserStatItem3
./ng net.accelbyte.sdk.cli.Main social bulkResetUserStatItem3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'scEtPJ4x' \
    --body '[{"statCode": "4ICBNidz"}, {"statCode": "BsoPFFeI"}, {"statCode": "8ioGkDxH"}]' \
    > test.out 2>&1
eval_tap $? 82 'BulkResetUserStatItem3' test.out

#- 83 PublicCreateUserStatItem
./ng net.accelbyte.sdk.cli.Main social publicCreateUserStatItem \
    --namespace "$AB_NAMESPACE" \
    --statCode 'CusFe4A8' \
    --userId 'wXxLclBe' \
    > test.out 2>&1
eval_tap $? 83 'PublicCreateUserStatItem' test.out

#- 84 DeleteUserStatItems1
./ng net.accelbyte.sdk.cli.Main social deleteUserStatItems1 \
    --namespace "$AB_NAMESPACE" \
    --statCode 'r0gSBwq0' \
    --userId '5cWz0Nbl' \
    > test.out 2>&1
eval_tap $? 84 'DeleteUserStatItems1' test.out

#- 85 PublicIncUserStatItem
./ng net.accelbyte.sdk.cli.Main social publicIncUserStatItem \
    --namespace "$AB_NAMESPACE" \
    --statCode 'qcoh6DeW' \
    --userId 'fe1aAJSg' \
    --body '{"inc": 0.5694399311574154}' \
    > test.out 2>&1
eval_tap $? 85 'PublicIncUserStatItem' test.out

#- 86 PublicIncUserStatItemValue
./ng net.accelbyte.sdk.cli.Main social publicIncUserStatItemValue \
    --namespace "$AB_NAMESPACE" \
    --statCode 'hb4p5CQE' \
    --userId 'r2B42wNt' \
    --body '{"inc": 0.20899059073803383}' \
    > test.out 2>&1
eval_tap $? 86 'PublicIncUserStatItemValue' test.out

#- 87 ResetUserStatItemValue1
./ng net.accelbyte.sdk.cli.Main social resetUserStatItemValue1 \
    --namespace "$AB_NAMESPACE" \
    --statCode 'lOeCZfmt' \
    --userId 'kFQdFAgl' \
    > test.out 2>&1
eval_tap $? 87 'ResetUserStatItemValue1' test.out

#- 88 BulkUpdateUserStatItemV2
./ng net.accelbyte.sdk.cli.Main social bulkUpdateUserStatItemV2 \
    --namespace "$AB_NAMESPACE" \
    --body '[{"additionalData": {"hQmSM3rl": {}, "9C8cWPa7": {}, "LEvWEr11": {}}, "additionalKey": "n72vIX1k", "statCode": "8jStIFVD", "updateStrategy": "OVERRIDE", "userId": "h83EUTpL", "value": 0.27237217386831203}, {"additionalData": {"bqhJUkqa": {}, "hZ40uoX3": {}, "dVa3Upjt": {}}, "additionalKey": "vHkilJqc", "statCode": "oEyrLPn2", "updateStrategy": "INCREMENT", "userId": "WMypsS9t", "value": 0.9862380720510614}, {"additionalData": {"EMljl0bJ": {}, "3sEc35QL": {}, "6KIEbXmG": {}}, "additionalKey": "q7miv1EL", "statCode": "5H1TAvuT", "updateStrategy": "INCREMENT", "userId": "zte4Rtz4", "value": 0.6745482618020594}]' \
    > test.out 2>&1
eval_tap $? 88 'BulkUpdateUserStatItemV2' test.out

#- 89 BulkFetchOrDefaultStatItems1
./ng net.accelbyte.sdk.cli.Main social bulkFetchOrDefaultStatItems1 \
    --namespace "$AB_NAMESPACE" \
    --additionalKey 'oBNXj4rx' \
    --statCode '9e8HQzMp' \
    --userIds 'ERrusYxj,tq7HfIog,yVkOIaNO' \
    > test.out 2>&1
eval_tap $? 89 'BulkFetchOrDefaultStatItems1' test.out

#- 90 AdminListUsersStatItems
./ng net.accelbyte.sdk.cli.Main social adminListUsersStatItems \
    --namespace "$AB_NAMESPACE" \
    --userId 'pKkhtZTh' \
    --additionalKey 'IKPVmfpz' \
    --statCodes 'G8ARno5C,bSN6AhuC,aCjCG48W' \
    --tags '9Ol9MEJQ,hrTh4xsw,ZY9wjoU0' \
    > test.out 2>&1
eval_tap $? 90 'AdminListUsersStatItems' test.out

#- 91 BulkUpdateUserStatItem
./ng net.accelbyte.sdk.cli.Main social bulkUpdateUserStatItem \
    --namespace "$AB_NAMESPACE" \
    --userId 'Huy061WC' \
    --additionalKey '9VvvCZYM' \
    --body '[{"additionalData": {"i4Wjc29z": {}, "szUWYWFV": {}, "JIHgXUUR": {}}, "statCode": "AWJXn8T9", "updateStrategy": "MAX", "value": 0.17060536797253767}, {"additionalData": {"LMIZmJrb": {}, "WRSGQM3s": {}, "1DTpOMga": {}}, "statCode": "YTJ1KXBU", "updateStrategy": "MAX", "value": 0.9253694101344745}, {"additionalData": {"05KV7qh3": {}, "hmcvFcDQ": {}, "dqXbtwpi": {}}, "statCode": "jPrpXuaj", "updateStrategy": "MAX", "value": 0.5104692859535752}]' \
    > test.out 2>&1
eval_tap $? 91 'BulkUpdateUserStatItem' test.out

#- 92 BulkResetUserStatItemValues
./ng net.accelbyte.sdk.cli.Main social bulkResetUserStatItemValues \
    --namespace "$AB_NAMESPACE" \
    --userId 'JEuzrTBI' \
    --additionalKey 'jD00CCkZ' \
    --body '[{"additionalData": {"iBkO4oAG": {}, "hHUTth2H": {}, "yGw7AtUE": {}}, "statCode": "CxGgLVHK"}, {"additionalData": {"Rd74pH5W": {}, "UtLRdZzn": {}, "uoVPiATF": {}}, "statCode": "47jUTbHc"}, {"additionalData": {"QF212DJn": {}, "Ofwg3gOg": {}, "bARYOo6D": {}}, "statCode": "gcL4dRbL"}]' \
    > test.out 2>&1
eval_tap $? 92 'BulkResetUserStatItemValues' test.out

#- 93 DeleteUserStatItems2
./ng net.accelbyte.sdk.cli.Main social deleteUserStatItems2 \
    --namespace "$AB_NAMESPACE" \
    --statCode 'nbxZezup' \
    --userId 'YMybyAE6' \
    --additionalKey 'LdtSbKgg' \
    > test.out 2>&1
eval_tap $? 93 'DeleteUserStatItems2' test.out

#- 94 UpdateUserStatItemValue
./ng net.accelbyte.sdk.cli.Main social updateUserStatItemValue \
    --namespace "$AB_NAMESPACE" \
    --statCode 'TX8xczKw' \
    --userId 'f3q9UgXg' \
    --additionalKey 'KpoJTY8e' \
    --body '{"additionalData": {"EmJgufUr": {}, "gTPUnFg6": {}, "BZ3VgyP3": {}}, "updateStrategy": "OVERRIDE", "value": 0.15902842331592826}' \
    > test.out 2>&1
eval_tap $? 94 'UpdateUserStatItemValue' test.out

#- 95 BulkUpdateUserStatItem1
./ng net.accelbyte.sdk.cli.Main social bulkUpdateUserStatItem1 \
    --namespace "$AB_NAMESPACE" \
    --body '[{"additionalData": {"7bRsEIXN": {}, "H1PTAjQv": {}, "Rkyo5arC": {}}, "additionalKey": "7in9WdDE", "statCode": "d4gI4U6M", "updateStrategy": "OVERRIDE", "userId": "ecVHebjz", "value": 0.3063646822173175}, {"additionalData": {"tRStHFUZ": {}, "1CHzb6if": {}, "mst6enIt": {}}, "additionalKey": "mAG0gv9h", "statCode": "8hvgNHNl", "updateStrategy": "MIN", "userId": "0UzIVjVw", "value": 0.49054585035568155}, {"additionalData": {"XtHZR9j7": {}, "r3vjTGNr": {}, "QDKhzZiQ": {}}, "additionalKey": "Jq9X4GEi", "statCode": "rXyR1YBY", "updateStrategy": "OVERRIDE", "userId": "HfElHhDg", "value": 0.8036980458444839}]' \
    > test.out 2>&1
eval_tap $? 95 'BulkUpdateUserStatItem1' test.out

#- 96 PublicQueryUserStatItems2
./ng net.accelbyte.sdk.cli.Main social publicQueryUserStatItems2 \
    --namespace "$AB_NAMESPACE" \
    --userId 'UISVr1cq' \
    --additionalKey 'kq2X9boN' \
    --statCodes 'gUQ9BdI4,ajzo8ddf,ef3KS3me' \
    --tags 'J2CTRWTM,9qmPv5Sh,K8SllOFM' \
    > test.out 2>&1
eval_tap $? 96 'PublicQueryUserStatItems2' test.out

#- 97 BulkUpdateUserStatItem2
./ng net.accelbyte.sdk.cli.Main social bulkUpdateUserStatItem2 \
    --namespace "$AB_NAMESPACE" \
    --userId 'sMMVb2OC' \
    --additionalKey 'YlXKHZ7L' \
    --body '[{"additionalData": {"3fYnwbcn": {}, "wY2Mlt2a": {}, "a4bbhynI": {}}, "statCode": "jDziDoSm", "updateStrategy": "INCREMENT", "value": 0.6729209281603831}, {"additionalData": {"GTAKL41f": {}, "5O3nRszK": {}, "AWrnApCi": {}}, "statCode": "1IqqATT3", "updateStrategy": "MAX", "value": 0.7587248910395055}, {"additionalData": {"HG5dg7nD": {}, "lo8w1fou": {}, "1aKKUOEh": {}}, "statCode": "ojXRUgL5", "updateStrategy": "INCREMENT", "value": 0.10060091575444041}]' \
    > test.out 2>&1
eval_tap $? 97 'BulkUpdateUserStatItem2' test.out

#- 98 UpdateUserStatItemValue1
./ng net.accelbyte.sdk.cli.Main social updateUserStatItemValue1 \
    --namespace "$AB_NAMESPACE" \
    --statCode '9tZnojmc' \
    --userId 'h9P0tgfO' \
    --additionalKey 'Dg60nDxB' \
    --body '{"additionalData": {"joOLptmR": {}, "mntNHaPw": {}, "uzTHiGrV": {}}, "updateStrategy": "MIN", "value": 0.06059682425520696}' \
    > test.out 2>&1
eval_tap $? 98 'UpdateUserStatItemValue1' test.out


rm -f "tmp.dat"

exit $EXIT_CODE