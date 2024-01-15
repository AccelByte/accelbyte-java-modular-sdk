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
    --userId 'HZd8BT4t' \
    > test.out 2>&1
eval_tap $? 8 'GetUserProfiles' test.out

#- 9 GetProfile
./ng net.accelbyte.sdk.cli.Main social getProfile \
    --namespace "$AB_NAMESPACE" \
    --profileId 'MZPuNlw6' \
    --userId 'B84JdhqW' \
    > test.out 2>&1
eval_tap $? 9 'GetProfile' test.out

#- 10 GetUserNamespaceSlots
eval_tap 0 10 'GetUserNamespaceSlots # SKIP deprecated' test.out

#- 11 GetSlotData
eval_tap 0 11 'GetSlotData # SKIP deprecated' test.out

#- 12 PublicGetUserGameProfiles
./ng net.accelbyte.sdk.cli.Main social publicGetUserGameProfiles \
    --namespace "$AB_NAMESPACE" \
    --userIds 'paV1qJVQ,gU3L4v7M,gpAVn4P1' \
    > test.out 2>&1
eval_tap $? 12 'PublicGetUserGameProfiles' test.out

#- 13 PublicGetUserProfiles
./ng net.accelbyte.sdk.cli.Main social publicGetUserProfiles \
    --namespace "$AB_NAMESPACE" \
    --userId 'aW4EvXbd' \
    > test.out 2>&1
eval_tap $? 13 'PublicGetUserProfiles' test.out

#- 14 PublicCreateProfile
./ng net.accelbyte.sdk.cli.Main social publicCreateProfile \
    --namespace "$AB_NAMESPACE" \
    --userId 'H7FfjTuC' \
    --body '{"achievements": ["ymiHNCLV", "6ltcJ69U", "LL67Bvzu"], "attributes": {"7o8cyiIJ": "dtKAv9Mo", "QRv1HW8M": "LMVqfodb", "2wVc4mbb": "v6IVRv3L"}, "avatarUrl": "XaqcSNvZ", "inventories": ["nQhIyJ3w", "dqnRgD00", "R4igq6JH"], "label": "XyQHydW3", "profileName": "af0Rkkn0", "statistics": ["RW8UYUn5", "C3aK3Y8u", "12EwucIk"], "tags": ["LCD8X7u4", "D27BQtDW", "hzG222Lc"]}' \
    > test.out 2>&1
eval_tap $? 14 'PublicCreateProfile' test.out

#- 15 PublicGetProfile
./ng net.accelbyte.sdk.cli.Main social publicGetProfile \
    --namespace "$AB_NAMESPACE" \
    --profileId 'FrnajbX5' \
    --userId 'Hp3mvvdQ' \
    > test.out 2>&1
eval_tap $? 15 'PublicGetProfile' test.out

#- 16 PublicUpdateProfile
./ng net.accelbyte.sdk.cli.Main social publicUpdateProfile \
    --namespace "$AB_NAMESPACE" \
    --profileId 'Pw36ETyJ' \
    --userId 'Ki8uq4tz' \
    --body '{"achievements": ["mboq2DXk", "2iB7LDPf", "tYuLIRwF"], "attributes": {"e5iPcHPb": "WgKh8gJb", "oZXjPdsl": "fc9cji1o", "wZFhLnbk": "a80lQwrs"}, "avatarUrl": "oA28wyZB", "inventories": ["kRLZ5Qp3", "dZ2slH25", "7zo9mBDX"], "label": "6nka66rw", "profileName": "TpDj18Hx", "statistics": ["vHzUEDoy", "XysQiRy1", "dj1q8YCo"], "tags": ["lBoaj3la", "OLBIRP9V", "qnQjhQ5J"]}' \
    > test.out 2>&1
eval_tap $? 16 'PublicUpdateProfile' test.out

#- 17 PublicDeleteProfile
./ng net.accelbyte.sdk.cli.Main social publicDeleteProfile \
    --namespace "$AB_NAMESPACE" \
    --profileId '2MlxJNBG' \
    --userId 'zmZQ83fY' \
    > test.out 2>&1
eval_tap $? 17 'PublicDeleteProfile' test.out

#- 18 PublicGetProfileAttribute
./ng net.accelbyte.sdk.cli.Main social publicGetProfileAttribute \
    --attributeName 'duHZmZUG' \
    --namespace "$AB_NAMESPACE" \
    --profileId '2CpXmmnK' \
    --userId 'PYHusLSv' \
    > test.out 2>&1
eval_tap $? 18 'PublicGetProfileAttribute' test.out

#- 19 PublicUpdateAttribute
./ng net.accelbyte.sdk.cli.Main social publicUpdateAttribute \
    --attributeName 'p9g0sAvS' \
    --namespace "$AB_NAMESPACE" \
    --profileId '5P6Yksy0' \
    --userId 'GatnS055' \
    --body '{"name": "ReZcYiZu", "value": "STa6ctTv"}' \
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
    --limit '39' \
    --offset '69' \
    --statCodes 'jjl5Gef6' \
    > test.out 2>&1
eval_tap $? 26 'GetGlobalStatItems' test.out

#- 27 GetGlobalStatItemByStatCode
./ng net.accelbyte.sdk.cli.Main social getGlobalStatItemByStatCode \
    --namespace "$AB_NAMESPACE" \
    --statCode 'YZaifXI0' \
    > test.out 2>&1
eval_tap $? 27 'GetGlobalStatItemByStatCode' test.out

#- 28 GetStatCycles
./ng net.accelbyte.sdk.cli.Main social getStatCycles \
    --namespace "$AB_NAMESPACE" \
    --cycleType 'MONTHLY' \
    --limit '3' \
    --name '5ND81uv9' \
    --offset '45' \
    --sortBy 'KUnDhtrt' \
    --status 'ACTIVE' \
    > test.out 2>&1
eval_tap $? 28 'GetStatCycles' test.out

#- 29 CreateStatCycle
./ng net.accelbyte.sdk.cli.Main social createStatCycle \
    --namespace "$AB_NAMESPACE" \
    --body '{"cycleType": "MONTHLY", "description": "TfYWr0jJ", "end": "1991-06-27T00:00:00Z", "name": "KNyGQkhG", "resetDate": 42, "resetDay": 33, "resetMonth": 35, "resetTime": "XfCHuehq", "seasonPeriod": 46, "start": "1972-08-26T00:00:00Z"}' \
    > test.out 2>&1
eval_tap $? 29 'CreateStatCycle' test.out

#- 30 BulkGetStatCycle
./ng net.accelbyte.sdk.cli.Main social bulkGetStatCycle \
    --namespace "$AB_NAMESPACE" \
    --body '{"cycleIds": ["Ch8n1DOA", "8vSzLsQw", "OQ4TNpmE"]}' \
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
    --cycleId 'w6U5AjKk' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 33 'GetStatCycle' test.out

#- 34 UpdateStatCycle
./ng net.accelbyte.sdk.cli.Main social updateStatCycle \
    --cycleId 'waOTxDzG' \
    --namespace "$AB_NAMESPACE" \
    --body '{"cycleType": "SEASONAL", "description": "3mSZPKG0", "end": "1992-08-13T00:00:00Z", "name": "U2CIqRdU", "resetDate": 3, "resetDay": 17, "resetMonth": 45, "resetTime": "chYwGvMA", "seasonPeriod": 3, "start": "1974-05-20T00:00:00Z"}' \
    > test.out 2>&1
eval_tap $? 34 'UpdateStatCycle' test.out

#- 35 DeleteStatCycle
./ng net.accelbyte.sdk.cli.Main social deleteStatCycle \
    --cycleId 'iyc2ZIwS' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 35 'DeleteStatCycle' test.out

#- 36 BulkAddStats
./ng net.accelbyte.sdk.cli.Main social bulkAddStats \
    --cycleId 'jiVnHgLX' \
    --namespace "$AB_NAMESPACE" \
    --body '{"statCodes": ["ZFxDdbIy", "aItEVhn7", "xyCWiPjg"]}' \
    > test.out 2>&1
eval_tap $? 36 'BulkAddStats' test.out

#- 37 StopStatCycle
./ng net.accelbyte.sdk.cli.Main social stopStatCycle \
    --cycleId 'NMzxXfbo' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 37 'StopStatCycle' test.out

#- 38 BulkFetchStatItems
./ng net.accelbyte.sdk.cli.Main social bulkFetchStatItems \
    --namespace "$AB_NAMESPACE" \
    --statCode 'srcALIN8' \
    --userIds 'xguyUcIc' \
    > test.out 2>&1
eval_tap $? 38 'BulkFetchStatItems' test.out

#- 39 BulkIncUserStatItem
./ng net.accelbyte.sdk.cli.Main social bulkIncUserStatItem \
    --namespace "$AB_NAMESPACE" \
    --body '[{"inc": 0.5696774363963162, "statCode": "yqMvdmjt", "userId": "5GSr1uuz"}, {"inc": 0.44741066793976814, "statCode": "9dSApEyL", "userId": "hdOweUmg"}, {"inc": 0.5869297881125413, "statCode": "XcLa7oug", "userId": "qzR5zcwK"}]' \
    > test.out 2>&1
eval_tap $? 39 'BulkIncUserStatItem' test.out

#- 40 BulkIncUserStatItemValue
./ng net.accelbyte.sdk.cli.Main social bulkIncUserStatItemValue \
    --namespace "$AB_NAMESPACE" \
    --body '[{"inc": 0.16202974513484725, "statCode": "09gTxE7g", "userId": "y6Zn4i3C"}, {"inc": 0.8668320023917369, "statCode": "8cRQch4w", "userId": "9kMAdQox"}, {"inc": 0.39554347409266266, "statCode": "nIcteFT3", "userId": "Iltbx55H"}]' \
    > test.out 2>&1
eval_tap $? 40 'BulkIncUserStatItemValue' test.out

#- 41 BulkFetchOrDefaultStatItems
./ng net.accelbyte.sdk.cli.Main social bulkFetchOrDefaultStatItems \
    --namespace "$AB_NAMESPACE" \
    --statCode '5vnnowDp' \
    --userIds 'aHrG8qnk,8wkAyAyv,3aaYVpeY' \
    > test.out 2>&1
eval_tap $? 41 'BulkFetchOrDefaultStatItems' test.out

#- 42 BulkResetUserStatItem
./ng net.accelbyte.sdk.cli.Main social bulkResetUserStatItem \
    --namespace "$AB_NAMESPACE" \
    --body '[{"statCode": "PgnoqsQ2", "userId": "K1YSEFBi"}, {"statCode": "btPXHovr", "userId": "hX72uSyR"}, {"statCode": "JyEaHoJJ", "userId": "zJV6CMUu"}]' \
    > test.out 2>&1
eval_tap $? 42 'BulkResetUserStatItem' test.out

#- 43 GetStats
./ng net.accelbyte.sdk.cli.Main social getStats \
    --namespace "$AB_NAMESPACE" \
    --cycleIds 'URHsCahF' \
    --isGlobal  \
    --isPublic  \
    --limit '25' \
    --offset '91' \
    > test.out 2>&1
eval_tap $? 43 'GetStats' test.out

#- 44 CreateStat
./ng net.accelbyte.sdk.cli.Main social createStat \
    --namespace "$AB_NAMESPACE" \
    --body '{"cycleIds": ["TwrtMAtQ", "kFgoBz1v", "jXz18l1a"], "defaultValue": 0.7951868160396012, "description": "wor1Olmt", "ignoreAdditionalDataOnValueRejected": true, "incrementOnly": false, "isPublic": true, "maximum": 0.40126502150017207, "minimum": 0.9624507093343927, "name": "4hoamqvb", "setAsGlobal": true, "setBy": "SERVER", "statCode": "7i2qwoca", "tags": ["1eooxexH", "5N3QHLjP", "1NRJYcE0"]}' \
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
    --limit '76' \
    --offset '28' \
    --keyword 'atgSLeUp' \
    > test.out 2>&1
eval_tap $? 47 'QueryStats' test.out

#- 48 GetStat
./ng net.accelbyte.sdk.cli.Main social getStat \
    --namespace "$AB_NAMESPACE" \
    --statCode 'FkV3VLDM' \
    > test.out 2>&1
eval_tap $? 48 'GetStat' test.out

#- 49 DeleteStat
./ng net.accelbyte.sdk.cli.Main social deleteStat \
    --namespace "$AB_NAMESPACE" \
    --statCode 'aqZkhroz' \
    > test.out 2>&1
eval_tap $? 49 'DeleteStat' test.out

#- 50 UpdateStat
./ng net.accelbyte.sdk.cli.Main social updateStat \
    --namespace "$AB_NAMESPACE" \
    --statCode 'hpuq9Nsj' \
    --body '{"cycleIds": ["gYzFEUsD", "aAfsdDWg", "nyMCXpqI"], "defaultValue": 0.2538371820516576, "description": "RU9D5811", "ignoreAdditionalDataOnValueRejected": false, "isPublic": true, "name": "c5STnASi", "tags": ["azxtCac7", "nWR8VXjH", "uTop0PhX"]}' \
    > test.out 2>&1
eval_tap $? 50 'UpdateStat' test.out

#- 51 GetStatItems
./ng net.accelbyte.sdk.cli.Main social getStatItems \
    --namespace "$AB_NAMESPACE" \
    --statCode 'PdHP5GnI' \
    --limit '37' \
    --offset '70' \
    --sortBy 'XVkjVsCF' \
    > test.out 2>&1
eval_tap $? 51 'GetStatItems' test.out

#- 52 DeleteTiedStat
./ng net.accelbyte.sdk.cli.Main social deleteTiedStat \
    --namespace "$AB_NAMESPACE" \
    --statCode 'YiSwXDey' \
    > test.out 2>&1
eval_tap $? 52 'DeleteTiedStat' test.out

#- 53 GetUserStatCycleItems
./ng net.accelbyte.sdk.cli.Main social getUserStatCycleItems \
    --cycleId 'cIxa4Tkg' \
    --namespace "$AB_NAMESPACE" \
    --userId 'jCNLZJNc' \
    --isPublic  \
    --limit '51' \
    --offset '68' \
    --sortBy 'TjrOyyIV' \
    --statCodes 'ggHUga4Z' \
    > test.out 2>&1
eval_tap $? 53 'GetUserStatCycleItems' test.out

#- 54 GetUserStatItems
./ng net.accelbyte.sdk.cli.Main social getUserStatItems \
    --namespace "$AB_NAMESPACE" \
    --userId 'XWpwy6LO' \
    --isPublic  \
    --limit '71' \
    --offset '94' \
    --sortBy 'KBPmC4jw' \
    --statCodes 'eZlE3B1C' \
    --tags 'OmTDYjUO' \
    > test.out 2>&1
eval_tap $? 54 'GetUserStatItems' test.out

#- 55 BulkCreateUserStatItems
./ng net.accelbyte.sdk.cli.Main social bulkCreateUserStatItems \
    --namespace "$AB_NAMESPACE" \
    --userId 'jIGEMxef' \
    --body '[{"statCode": "ZSAAVQZw"}, {"statCode": "BeVdL4FQ"}, {"statCode": "p1ODsE5z"}]' \
    > test.out 2>&1
eval_tap $? 55 'BulkCreateUserStatItems' test.out

#- 56 BulkIncUserStatItem1
./ng net.accelbyte.sdk.cli.Main social bulkIncUserStatItem1 \
    --namespace "$AB_NAMESPACE" \
    --userId 'iyXAtdaZ' \
    --body '[{"inc": 0.7532245008112668, "statCode": "VsRbfDZl"}, {"inc": 0.39393497746318706, "statCode": "bnGZEDF7"}, {"inc": 0.4032747874631477, "statCode": "bb8u4ExG"}]' \
    > test.out 2>&1
eval_tap $? 56 'BulkIncUserStatItem1' test.out

#- 57 BulkIncUserStatItemValue1
./ng net.accelbyte.sdk.cli.Main social bulkIncUserStatItemValue1 \
    --namespace "$AB_NAMESPACE" \
    --userId 'ihv3ls5M' \
    --body '[{"inc": 0.037034786205312864, "statCode": "AZ3Qo2yo"}, {"inc": 0.04389274714072777, "statCode": "cGyJ5S44"}, {"inc": 0.2926519446482404, "statCode": "IqjTzbC7"}]' \
    > test.out 2>&1
eval_tap $? 57 'BulkIncUserStatItemValue1' test.out

#- 58 BulkResetUserStatItem1
./ng net.accelbyte.sdk.cli.Main social bulkResetUserStatItem1 \
    --namespace "$AB_NAMESPACE" \
    --userId 'gPoFLbp6' \
    --body '[{"statCode": "eTRENsMA"}, {"statCode": "sm6uOoZ2"}, {"statCode": "2QpoY9DI"}]' \
    > test.out 2>&1
eval_tap $? 58 'BulkResetUserStatItem1' test.out

#- 59 CreateUserStatItem
./ng net.accelbyte.sdk.cli.Main social createUserStatItem \
    --namespace "$AB_NAMESPACE" \
    --statCode 'TnFeWoXd' \
    --userId 'YNTqjOCi' \
    > test.out 2>&1
eval_tap $? 59 'CreateUserStatItem' test.out

#- 60 DeleteUserStatItems
./ng net.accelbyte.sdk.cli.Main social deleteUserStatItems \
    --namespace "$AB_NAMESPACE" \
    --statCode 'UpZj0V1N' \
    --userId 'OSHOtVAV' \
    > test.out 2>&1
eval_tap $? 60 'DeleteUserStatItems' test.out

#- 61 IncUserStatItemValue
./ng net.accelbyte.sdk.cli.Main social incUserStatItemValue \
    --namespace "$AB_NAMESPACE" \
    --statCode 'SKTydIgt' \
    --userId 'Zx0FR5dy' \
    --body '{"inc": 0.3399380771521875}' \
    > test.out 2>&1
eval_tap $? 61 'IncUserStatItemValue' test.out

#- 62 ResetUserStatItemValue
./ng net.accelbyte.sdk.cli.Main social resetUserStatItemValue \
    --namespace "$AB_NAMESPACE" \
    --statCode '9gNvGthb' \
    --userId '2abDY06F' \
    --additionalKey 'zr6vTd2n' \
    --body '{"additionalData": {"1ifjMot6": {}, "uSHgiQlH": {}, "ttGGgKX4": {}}}' \
    > test.out 2>&1
eval_tap $? 62 'ResetUserStatItemValue' test.out

#- 63 GetGlobalStatItems1
./ng net.accelbyte.sdk.cli.Main social getGlobalStatItems1 \
    --namespace "$AB_NAMESPACE" \
    --limit '93' \
    --offset '60' \
    --statCodes 'yyATfabq' \
    > test.out 2>&1
eval_tap $? 63 'GetGlobalStatItems1' test.out

#- 64 GetGlobalStatItemByStatCode1
./ng net.accelbyte.sdk.cli.Main social getGlobalStatItemByStatCode1 \
    --namespace "$AB_NAMESPACE" \
    --statCode '9K5nDpYK' \
    > test.out 2>&1
eval_tap $? 64 'GetGlobalStatItemByStatCode1' test.out

#- 65 GetStatCycles1
./ng net.accelbyte.sdk.cli.Main social getStatCycles1 \
    --namespace "$AB_NAMESPACE" \
    --cycleType 'WEEKLY' \
    --limit '94' \
    --name 'F8wTJerW' \
    --offset '98' \
    --sortBy '5CBJYJMA' \
    --status 'ACTIVE' \
    > test.out 2>&1
eval_tap $? 65 'GetStatCycles1' test.out

#- 66 BulkGetStatCycle1
./ng net.accelbyte.sdk.cli.Main social bulkGetStatCycle1 \
    --namespace "$AB_NAMESPACE" \
    --body '{"cycleIds": ["9MAL1b62", "sxT9yJhf", "gdAPEdbk"]}' \
    > test.out 2>&1
eval_tap $? 66 'BulkGetStatCycle1' test.out

#- 67 GetStatCycle1
./ng net.accelbyte.sdk.cli.Main social getStatCycle1 \
    --cycleId 'IbXK3mLc' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 67 'GetStatCycle1' test.out

#- 68 BulkFetchStatItems1
./ng net.accelbyte.sdk.cli.Main social bulkFetchStatItems1 \
    --namespace "$AB_NAMESPACE" \
    --statCode 'x1tzy1Bz' \
    --userIds 'fs7Hg0Lx' \
    > test.out 2>&1
eval_tap $? 68 'BulkFetchStatItems1' test.out

#- 69 PublicBulkIncUserStatItem
./ng net.accelbyte.sdk.cli.Main social publicBulkIncUserStatItem \
    --namespace "$AB_NAMESPACE" \
    --body '[{"inc": 0.06071636837060512, "statCode": "QDCWXjwc", "userId": "ZATifwuK"}, {"inc": 0.6618476589645308, "statCode": "QojCSE6q", "userId": "UjoIIBxq"}, {"inc": 0.8795365563396486, "statCode": "ewsrrlN1", "userId": "KptsMAzD"}]' \
    > test.out 2>&1
eval_tap $? 69 'PublicBulkIncUserStatItem' test.out

#- 70 PublicBulkIncUserStatItemValue
./ng net.accelbyte.sdk.cli.Main social publicBulkIncUserStatItemValue \
    --namespace "$AB_NAMESPACE" \
    --body '[{"inc": 0.5710270444394725, "statCode": "gfWoNjV8", "userId": "bGwT4gBg"}, {"inc": 0.7392355814986148, "statCode": "gSpLvxiA", "userId": "s9mXJn9I"}, {"inc": 0.36824690244359637, "statCode": "ac0voKs0", "userId": "fKGAPuRM"}]' \
    > test.out 2>&1
eval_tap $? 70 'PublicBulkIncUserStatItemValue' test.out

#- 71 BulkResetUserStatItem2
./ng net.accelbyte.sdk.cli.Main social bulkResetUserStatItem2 \
    --namespace "$AB_NAMESPACE" \
    --body '[{"statCode": "dq7eANEW", "userId": "wIw4xROh"}, {"statCode": "QYlHnLN4", "userId": "XnnqsXRP"}, {"statCode": "xyw40x7h", "userId": "MqxfNRz0"}]' \
    > test.out 2>&1
eval_tap $? 71 'BulkResetUserStatItem2' test.out

#- 72 CreateStat1
./ng net.accelbyte.sdk.cli.Main social createStat1 \
    --namespace "$AB_NAMESPACE" \
    --body '{"cycleIds": ["QsnxWMMX", "wb4KPvlw", "5cDly0QB"], "defaultValue": 0.1366556103123574, "description": "hiOQb1hF", "ignoreAdditionalDataOnValueRejected": false, "incrementOnly": false, "isPublic": false, "maximum": 0.5103479439019962, "minimum": 0.9668687146622548, "name": "5ohTrlxA", "setAsGlobal": false, "setBy": "SERVER", "statCode": "dHdfFORs", "tags": ["aVvarDSW", "OCFVJY5Z", "oXM8owhm"]}' \
    > test.out 2>&1
eval_tap $? 72 'CreateStat1' test.out

#- 73 PublicListMyStatCycleItems
./ng net.accelbyte.sdk.cli.Main social publicListMyStatCycleItems \
    --cycleId 'INjkzlWB' \
    --namespace "$AB_NAMESPACE" \
    --limit '69' \
    --offset '73' \
    --sortBy 'HMpbuKjU' \
    --statCodes 'WqB79x0E,wEOViYmw,w6EKFxfM' \
    > test.out 2>&1
eval_tap $? 73 'PublicListMyStatCycleItems' test.out

#- 74 PublicListMyStatItems
./ng net.accelbyte.sdk.cli.Main social publicListMyStatItems \
    --namespace "$AB_NAMESPACE" \
    --limit '28' \
    --offset '99' \
    --sortBy 'ByU2WaNL' \
    --statCodes 't1qRpfBW,kM4L6kuj,IKMEX7CA' \
    --tags 'ziDPlbZB,ic2bRcdn,s9yKKx2F' \
    > test.out 2>&1
eval_tap $? 74 'PublicListMyStatItems' test.out

#- 75 PublicListAllMyStatItems
./ng net.accelbyte.sdk.cli.Main social publicListAllMyStatItems \
    --namespace "$AB_NAMESPACE" \
    --additionalKey 'V0hnhkmD' \
    --statCodes 'eYUbEEX5,purIUnsj,BuPSkXxl' \
    --tags '69h13ufb,s4ncVMR1,JbJQ8kTe' \
    > test.out 2>&1
eval_tap $? 75 'PublicListAllMyStatItems' test.out

#- 76 GetUserStatCycleItems1
./ng net.accelbyte.sdk.cli.Main social getUserStatCycleItems1 \
    --cycleId 's49HEP74' \
    --namespace "$AB_NAMESPACE" \
    --userId 'iUZty4SN' \
    --limit '50' \
    --offset '0' \
    --sortBy '3WLrznk2' \
    --statCodes 'tLGH79ur' \
    > test.out 2>&1
eval_tap $? 76 'GetUserStatCycleItems1' test.out

#- 77 PublicQueryUserStatItems
./ng net.accelbyte.sdk.cli.Main social publicQueryUserStatItems \
    --namespace "$AB_NAMESPACE" \
    --userId 'G0SI76YC' \
    --limit '64' \
    --offset '70' \
    --sortBy 'QmZs88Vi' \
    --statCodes 'xrznXCQW' \
    --tags 'BHLB0HuZ' \
    > test.out 2>&1
eval_tap $? 77 'PublicQueryUserStatItems' test.out

#- 78 PublicBulkCreateUserStatItems
./ng net.accelbyte.sdk.cli.Main social publicBulkCreateUserStatItems \
    --namespace "$AB_NAMESPACE" \
    --userId 'D0LgZBXc' \
    --body '[{"statCode": "SCNaVadz"}, {"statCode": "xktWtZzj"}, {"statCode": "p2zNq9Sa"}]' \
    > test.out 2>&1
eval_tap $? 78 'PublicBulkCreateUserStatItems' test.out

#- 79 PublicQueryUserStatItems1
./ng net.accelbyte.sdk.cli.Main social publicQueryUserStatItems1 \
    --namespace "$AB_NAMESPACE" \
    --userId 'jsyYFALp' \
    --additionalKey '0v2k8FZn' \
    --statCodes 'jgBRYWag,FpKWVuDn,h9KR1wkl' \
    --tags '40LOX8oX,vbHNHPnS,FVEeeeND' \
    > test.out 2>&1
eval_tap $? 79 'PublicQueryUserStatItems1' test.out

#- 80 PublicBulkIncUserStatItem1
./ng net.accelbyte.sdk.cli.Main social publicBulkIncUserStatItem1 \
    --namespace "$AB_NAMESPACE" \
    --userId 'wtyCD0NS' \
    --body '[{"inc": 0.5626892295552325, "statCode": "qnPrfHIs"}, {"inc": 0.43731229529583926, "statCode": "dfa6Wvz8"}, {"inc": 0.8420026423251891, "statCode": "BxdxB3hw"}]' \
    > test.out 2>&1
eval_tap $? 80 'PublicBulkIncUserStatItem1' test.out

#- 81 BulkIncUserStatItemValue2
./ng net.accelbyte.sdk.cli.Main social bulkIncUserStatItemValue2 \
    --namespace "$AB_NAMESPACE" \
    --userId 'RJR8HdBe' \
    --body '[{"inc": 0.895776780693911, "statCode": "pbOeUUk2"}, {"inc": 0.6257652721734792, "statCode": "NwGFGBHz"}, {"inc": 0.21408352548791554, "statCode": "wUBi8o0G"}]' \
    > test.out 2>&1
eval_tap $? 81 'BulkIncUserStatItemValue2' test.out

#- 82 BulkResetUserStatItem3
./ng net.accelbyte.sdk.cli.Main social bulkResetUserStatItem3 \
    --namespace "$AB_NAMESPACE" \
    --userId '7gsiezD7' \
    --body '[{"statCode": "7eAkcmpx"}, {"statCode": "Cbaek2mn"}, {"statCode": "8ERgOoTh"}]' \
    > test.out 2>&1
eval_tap $? 82 'BulkResetUserStatItem3' test.out

#- 83 PublicCreateUserStatItem
./ng net.accelbyte.sdk.cli.Main social publicCreateUserStatItem \
    --namespace "$AB_NAMESPACE" \
    --statCode '7frhAQR1' \
    --userId 'yiTGF2GW' \
    > test.out 2>&1
eval_tap $? 83 'PublicCreateUserStatItem' test.out

#- 84 DeleteUserStatItems1
./ng net.accelbyte.sdk.cli.Main social deleteUserStatItems1 \
    --namespace "$AB_NAMESPACE" \
    --statCode 'gt4jeyUP' \
    --userId 'B3PyCW35' \
    > test.out 2>&1
eval_tap $? 84 'DeleteUserStatItems1' test.out

#- 85 PublicIncUserStatItem
./ng net.accelbyte.sdk.cli.Main social publicIncUserStatItem \
    --namespace "$AB_NAMESPACE" \
    --statCode 'QvF4gtZH' \
    --userId 'fMxptlNq' \
    --body '{"inc": 0.7384658011331823}' \
    > test.out 2>&1
eval_tap $? 85 'PublicIncUserStatItem' test.out

#- 86 PublicIncUserStatItemValue
./ng net.accelbyte.sdk.cli.Main social publicIncUserStatItemValue \
    --namespace "$AB_NAMESPACE" \
    --statCode 'OPQmljbA' \
    --userId 'ZYdnDX7U' \
    --body '{"inc": 0.17377960393285008}' \
    > test.out 2>&1
eval_tap $? 86 'PublicIncUserStatItemValue' test.out

#- 87 ResetUserStatItemValue1
./ng net.accelbyte.sdk.cli.Main social resetUserStatItemValue1 \
    --namespace "$AB_NAMESPACE" \
    --statCode '6d5r9hMw' \
    --userId 'ibYRA4SG' \
    > test.out 2>&1
eval_tap $? 87 'ResetUserStatItemValue1' test.out

#- 88 BulkUpdateUserStatItemV2
./ng net.accelbyte.sdk.cli.Main social bulkUpdateUserStatItemV2 \
    --namespace "$AB_NAMESPACE" \
    --body '[{"additionalData": {"r31rkUTQ": {}, "lUPOQQD4": {}, "Gi3Niey3": {}}, "additionalKey": "Cyt5BdwK", "statCode": "kDF7Y1iq", "updateStrategy": "INCREMENT", "userId": "wueovIz2", "value": 0.5360076318521827}, {"additionalData": {"NncYfxQg": {}, "pXKJj3zo": {}, "SLHxK3AM": {}}, "additionalKey": "SCw1U457", "statCode": "HwUKAWr3", "updateStrategy": "MIN", "userId": "nEPeBgXc", "value": 0.10416680016203161}, {"additionalData": {"86k8gq2L": {}, "vDBqh2cs": {}, "K5lw4zko": {}}, "additionalKey": "3Y8VkZei", "statCode": "ix6MpQ6y", "updateStrategy": "MAX", "userId": "kaHz3xHZ", "value": 0.32245290023424056}]' \
    > test.out 2>&1
eval_tap $? 88 'BulkUpdateUserStatItemV2' test.out

#- 89 BulkFetchOrDefaultStatItems1
./ng net.accelbyte.sdk.cli.Main social bulkFetchOrDefaultStatItems1 \
    --namespace "$AB_NAMESPACE" \
    --additionalKey 'tp1J7SxT' \
    --statCode 'bWRkp0Si' \
    --userIds 'AzJHIBNS,BXh7OrsW,NoShPG8f' \
    > test.out 2>&1
eval_tap $? 89 'BulkFetchOrDefaultStatItems1' test.out

#- 90 AdminListUsersStatItems
./ng net.accelbyte.sdk.cli.Main social adminListUsersStatItems \
    --namespace "$AB_NAMESPACE" \
    --userId 'qw73940O' \
    --additionalKey 'KZ8amUH4' \
    --statCodes 'pk3xTQpP,eoDfnSKT,9DJm2DaH' \
    --tags '6iN657nh,xYoRUyBg,UYHFRPSo' \
    > test.out 2>&1
eval_tap $? 90 'AdminListUsersStatItems' test.out

#- 91 BulkUpdateUserStatItem
./ng net.accelbyte.sdk.cli.Main social bulkUpdateUserStatItem \
    --namespace "$AB_NAMESPACE" \
    --userId '3cQ7gyGl' \
    --additionalKey '9UYWmPWX' \
    --body '[{"additionalData": {"2mAFcLBP": {}, "xyqKuzGr": {}, "wG06EV8F": {}}, "statCode": "BvjfD6xE", "updateStrategy": "MAX", "value": 0.12579473524408413}, {"additionalData": {"B8asMARa": {}, "gXOm66dW": {}, "FbQcuyp7": {}}, "statCode": "xAYrlPYw", "updateStrategy": "INCREMENT", "value": 0.3817811531927334}, {"additionalData": {"q5740VZT": {}, "fZkS5H0r": {}, "14o96hns": {}}, "statCode": "tKIW3tu9", "updateStrategy": "INCREMENT", "value": 0.6762517169455304}]' \
    > test.out 2>&1
eval_tap $? 91 'BulkUpdateUserStatItem' test.out

#- 92 BulkResetUserStatItemValues
./ng net.accelbyte.sdk.cli.Main social bulkResetUserStatItemValues \
    --namespace "$AB_NAMESPACE" \
    --userId 'MYbYZrLh' \
    --additionalKey 'YM4swRw0' \
    --body '[{"additionalData": {"T0scRWYn": {}, "RJiwRtKc": {}, "lS5Ka0Og": {}}, "statCode": "lgmqOUWt"}, {"additionalData": {"RzjPhEsN": {}, "t7JCrM34": {}, "kpYHxLes": {}}, "statCode": "WxUQ0ce9"}, {"additionalData": {"An2poGtQ": {}, "BDPCILXD": {}, "7Gvf2ATM": {}}, "statCode": "clpdGNOs"}]' \
    > test.out 2>&1
eval_tap $? 92 'BulkResetUserStatItemValues' test.out

#- 93 DeleteUserStatItems2
./ng net.accelbyte.sdk.cli.Main social deleteUserStatItems2 \
    --namespace "$AB_NAMESPACE" \
    --statCode 'QBJXxNpc' \
    --userId '8mqL0vrs' \
    --additionalKey 'o9nZ4nal' \
    > test.out 2>&1
eval_tap $? 93 'DeleteUserStatItems2' test.out

#- 94 UpdateUserStatItemValue
./ng net.accelbyte.sdk.cli.Main social updateUserStatItemValue \
    --namespace "$AB_NAMESPACE" \
    --statCode 'MkAW9ygp' \
    --userId 'PDqXpl15' \
    --additionalKey 'ByGshsHT' \
    --body '{"additionalData": {"PIFXKbMT": {}, "z8uQGEHp": {}, "d9Pv4sDW": {}}, "updateStrategy": "MIN", "value": 0.7256014701398473}' \
    > test.out 2>&1
eval_tap $? 94 'UpdateUserStatItemValue' test.out

#- 95 BulkUpdateUserStatItem1
./ng net.accelbyte.sdk.cli.Main social bulkUpdateUserStatItem1 \
    --namespace "$AB_NAMESPACE" \
    --body '[{"additionalData": {"W5oefvDY": {}, "Bn421Hxv": {}, "ifFuw3Sy": {}}, "additionalKey": "JjfjEPuq", "statCode": "Yi8aFN2D", "updateStrategy": "MIN", "userId": "3C2vQI24", "value": 0.630049706693691}, {"additionalData": {"1VurYBH0": {}, "LFXIs2lj": {}, "L6dKhph5": {}}, "additionalKey": "Z4eFmHZ3", "statCode": "zz4eBONw", "updateStrategy": "MAX", "userId": "zEAREH6e", "value": 0.5730166404207726}, {"additionalData": {"XMNddo0s": {}, "okVi5kqr": {}, "kxKIK7eb": {}}, "additionalKey": "jnBBMCww", "statCode": "onRjBdPe", "updateStrategy": "MIN", "userId": "LRCzkR9R", "value": 0.4349517529675132}]' \
    > test.out 2>&1
eval_tap $? 95 'BulkUpdateUserStatItem1' test.out

#- 96 PublicQueryUserStatItems2
./ng net.accelbyte.sdk.cli.Main social publicQueryUserStatItems2 \
    --namespace "$AB_NAMESPACE" \
    --userId 'fH5CYjf7' \
    --additionalKey 'pWPVyhdu' \
    --statCodes 'tGJ1xnIq,QtVwM8Yk,IDYPK7IQ' \
    --tags 'eEDfiVnv,QG5F7g7D,Nl1Ofhf6' \
    > test.out 2>&1
eval_tap $? 96 'PublicQueryUserStatItems2' test.out

#- 97 BulkUpdateUserStatItem2
./ng net.accelbyte.sdk.cli.Main social bulkUpdateUserStatItem2 \
    --namespace "$AB_NAMESPACE" \
    --userId 'HIFd0wD7' \
    --additionalKey 'XixblO17' \
    --body '[{"additionalData": {"The16JKo": {}, "xLZ21X23": {}, "ZzgWI1Cp": {}}, "statCode": "8emBHyVj", "updateStrategy": "MAX", "value": 0.37617267518447584}, {"additionalData": {"f6bVCtqu": {}, "fZzGfcmn": {}, "0OVPo2s2": {}}, "statCode": "ZngIt9V7", "updateStrategy": "OVERRIDE", "value": 0.25338660107155153}, {"additionalData": {"HdAoqdsS": {}, "2zOgJd9X": {}, "0N2NQ9i3": {}}, "statCode": "vuBR4EPr", "updateStrategy": "OVERRIDE", "value": 0.220198228405728}]' \
    > test.out 2>&1
eval_tap $? 97 'BulkUpdateUserStatItem2' test.out

#- 98 UpdateUserStatItemValue1
./ng net.accelbyte.sdk.cli.Main social updateUserStatItemValue1 \
    --namespace "$AB_NAMESPACE" \
    --statCode 'bYUpXVuU' \
    --userId 'ihC9ioC9' \
    --additionalKey 'Dz1ttMs2' \
    --body '{"additionalData": {"IV4PzyHA": {}, "tkHkcJoG": {}, "GE456z3B": {}}, "updateStrategy": "OVERRIDE", "value": 0.9003168000780415}' \
    > test.out 2>&1
eval_tap $? 98 'UpdateUserStatItemValue1' test.out


rm -f "tmp.dat"

exit $EXIT_CODE