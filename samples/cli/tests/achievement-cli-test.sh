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
echo "1..30"

#- 1 Login
./ng net.accelbyte.sdk.cli.Main loginClient \
    > test.out 2>&1
eval_tap $? 1 'Login' test.out

if [ $EXIT_CODE -ne 0 ]; then
  echo "Bail out! Login failed."
  exit $EXIT_CODE
fi

touch "tmp.dat"

#- 2 AdminListAchievements
./ng net.accelbyte.sdk.cli.Main achievement adminListAchievements \
    --namespace "$AB_NAMESPACE" \
    --global  \
    --limit '60' \
    --offset '0' \
    --sortBy 'createdAt:asc' \
    --tags '11g2AqDg,9GRLfOwf,xHhPNtNY' \
    > test.out 2>&1
eval_tap $? 2 'AdminListAchievements' test.out

#- 3 AdminCreateNewAchievement
./ng net.accelbyte.sdk.cli.Main achievement adminCreateNewAchievement \
    --namespace "$AB_NAMESPACE" \
    --body '{"achievementCode": "ii9CoO6N", "customAttributes": {"QMmAmcev": {}, "5Io8jNLK": {}, "jvGncDcE": {}}, "defaultLanguage": "uRr9ehlx", "description": {"wEJlO5rw": "ScmVeyr7", "YInRq4o3": "mqLcZPYA", "FxKTqh8r": "hKKVD1Jl"}, "global": false, "goalValue": 0.176666536730812, "hidden": false, "incremental": false, "lockedIcons": [{"slug": "5aml62W0", "url": "ArNlGocx"}, {"slug": "FvFZqVv1", "url": "pInuQc1m"}, {"slug": "88pgyDwh", "url": "rev2ioYG"}], "name": {"cSjQ3XTW": "7nyZRdli", "zHdJMhd3": "YVbzyxe2", "t93hU3CE": "lkOiF2hM"}, "statCode": "3NBc0ZO5", "tags": ["wOz73lpB", "ogEHuBUE", "wptd8TDb"], "unlockedIcons": [{"slug": "tzp5wYrK", "url": "wJawUOiq"}, {"slug": "WkjWcpLj", "url": "g3yTqfzU"}, {"slug": "4oXsb5hC", "url": "LYkWRs33"}]}' \
    > test.out 2>&1
eval_tap $? 3 'AdminCreateNewAchievement' test.out

#- 4 ExportAchievements
./ng net.accelbyte.sdk.cli.Main achievement exportAchievements \
    --namespace "$AB_NAMESPACE" \
    --tags 'EDsa5CBf,h3U9riVz,dB4yDxMA' \
    > test.out 2>&1
eval_tap $? 4 'ExportAchievements' test.out

#- 5 ImportAchievements
./ng net.accelbyte.sdk.cli.Main achievement importAchievements \
    --namespace "$AB_NAMESPACE" \
    --file 'tmp.dat' \
    --strategy 'RNwJAJoe' \
    > test.out 2>&1
eval_tap $? 5 'ImportAchievements' test.out

#- 6 AdminGetAchievement
./ng net.accelbyte.sdk.cli.Main achievement adminGetAchievement \
    --achievementCode '9oxf6D76' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 6 'AdminGetAchievement' test.out

#- 7 AdminUpdateAchievement
./ng net.accelbyte.sdk.cli.Main achievement adminUpdateAchievement \
    --achievementCode '4jM9axUt' \
    --namespace "$AB_NAMESPACE" \
    --body '{"customAttributes": {"kJyq3f08": {}, "QhPSMgjw": {}, "TDhh1mCx": {}}, "defaultLanguage": "VjQQ9mtN", "description": {"hQMiH1aA": "wvfckvbn", "mecPrBWY": "OAkuCIck", "FtcszF4P": "RvGk8ea0"}, "global": false, "goalValue": 0.6063954488271049, "hidden": true, "incremental": false, "lockedIcons": [{"slug": "y77EovHL", "url": "av5dpEsq"}, {"slug": "amtIcsVJ", "url": "eR7TSz0O"}, {"slug": "IwR7pdfI", "url": "q7IXnf24"}], "name": {"BLvgd2ko": "hn59Wdrs", "PEGW1J9U": "THkHrBJ9", "lCdYcBi1": "EuP2baKb"}, "statCode": "OqDInr0d", "tags": ["tYXL4ZS3", "xKRUZXLM", "mFWDoMpa"], "unlockedIcons": [{"slug": "QmuJy3b6", "url": "bzp1bxqg"}, {"slug": "Tz5usAJO", "url": "bvTorsH6"}, {"slug": "QMQDPsUO", "url": "mUyJHbmf"}]}' \
    > test.out 2>&1
eval_tap $? 7 'AdminUpdateAchievement' test.out

#- 8 AdminDeleteAchievement
./ng net.accelbyte.sdk.cli.Main achievement adminDeleteAchievement \
    --achievementCode 'EeL4SdP2' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 8 'AdminDeleteAchievement' test.out

#- 9 AdminUpdateAchievementListOrder
./ng net.accelbyte.sdk.cli.Main achievement adminUpdateAchievementListOrder \
    --achievementCode 's73ch1Pn' \
    --namespace "$AB_NAMESPACE" \
    --body '{"targetOrder": 70}' \
    > test.out 2>&1
eval_tap $? 9 'AdminUpdateAchievementListOrder' test.out

#- 10 AdminListGlobalAchievements
./ng net.accelbyte.sdk.cli.Main achievement adminListGlobalAchievements \
    --namespace "$AB_NAMESPACE" \
    --achievementCodes 'g3aMjZOS' \
    --limit '0' \
    --offset '46' \
    --sortBy 'achievedAt:desc' \
    --status 'xa1U8Knr' \
    --tags 'JU9ZVMGD,uuvWmEOs,VMjNXObP' \
    > test.out 2>&1
eval_tap $? 10 'AdminListGlobalAchievements' test.out

#- 11 AdminListGlobalAchievementContributors
./ng net.accelbyte.sdk.cli.Main achievement adminListGlobalAchievementContributors \
    --achievementCode 'oFm9Ntbb' \
    --namespace "$AB_NAMESPACE" \
    --limit '69' \
    --offset '5' \
    --sortBy 'contributedValue:desc' \
    > test.out 2>&1
eval_tap $? 11 'AdminListGlobalAchievementContributors' test.out

#- 12 ResetGlobalAchievement
./ng net.accelbyte.sdk.cli.Main achievement resetGlobalAchievement \
    --achievementCode 'PBZyFwOQ' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 12 'ResetGlobalAchievement' test.out

#- 13 BulkCreatePSNEvent
./ng net.accelbyte.sdk.cli.Main achievement bulkCreatePSNEvent \
    --namespace "$AB_NAMESPACE" \
    --body '{"data": [{"events": [{"dateTime": "DsBOzrob", "eventData": {"eventName": "GQc4ZaLw", "properties": {"bLWLLhUK": {}, "KNLKxEIx": {}, "cdKLPAuR": {}}}, "eventId": "A93umToq", "version": "8pJZhKdh"}, {"dateTime": "fNayBbhq", "eventData": {"eventName": "2YOorMKJ", "properties": {"LtzbI6eF": {}, "m8AhLZPZ": {}, "TMoPGfx9": {}}}, "eventId": "knI3SW8G", "version": "YV8JhZ3I"}, {"dateTime": "tkXQpt9n", "eventData": {"eventName": "jedtg145", "properties": {"ibehfZ6W": {}, "iJ8jssjQ": {}, "LVVzwK8H": {}}}, "eventId": "KJBdJsjn", "version": "4iwFBEAa"}], "thirdPartyUserId": "Lrfdm0O1", "userId": "66qEQMeF"}, {"events": [{"dateTime": "1p4X2XSI", "eventData": {"eventName": "U5p6ZtPr", "properties": {"puckQB25": {}, "3SYR9lQE": {}, "GU8A8JJM": {}}}, "eventId": "mNheSBMt", "version": "cjo9e0mf"}, {"dateTime": "3RoOg16T", "eventData": {"eventName": "8zeQXUKw", "properties": {"wUqeKSNg": {}, "T7a8cLwn": {}, "su2na4N9": {}}}, "eventId": "7XpfNkm2", "version": "b1bL7HRE"}, {"dateTime": "ZKOZmG9U", "eventData": {"eventName": "svxmnf7Q", "properties": {"z33PiexF": {}, "tMwXrcsM": {}, "H5mOdCr3": {}}}, "eventId": "gBsyLF7g", "version": "PsfVQo82"}], "thirdPartyUserId": "Z1wTnfmQ", "userId": "JNmGp7GW"}, {"events": [{"dateTime": "GfWfStyD", "eventData": {"eventName": "SBNyT8LR", "properties": {"3P51hAyE": {}, "XeIgue01": {}, "mgLY4CmV": {}}}, "eventId": "MrLccdrQ", "version": "b6P3IbxU"}, {"dateTime": "N0xcBNbh", "eventData": {"eventName": "knwHxl2Q", "properties": {"P110emjl": {}, "EoLy82Rf": {}, "sKXHWkGk": {}}}, "eventId": "3jAr1Eum", "version": "0j7zZbYt"}, {"dateTime": "bx2YRJXR", "eventData": {"eventName": "nyg1iGYP", "properties": {"SPxgshSu": {}, "cCvWptrr": {}, "sgxPwZSR": {}}}, "eventId": "ErUVpTjk", "version": "EcckqW8V"}], "thirdPartyUserId": "FUWdRNbv", "userId": "iYMwXiUJ"}]}' \
    > test.out 2>&1
eval_tap $? 13 'BulkCreatePSNEvent' test.out

#- 14 AdminListTags
./ng net.accelbyte.sdk.cli.Main achievement adminListTags \
    --namespace "$AB_NAMESPACE" \
    --limit '5' \
    --name 'dOJl6q2f' \
    --offset '25' \
    --sortBy 'name:desc' \
    > test.out 2>&1
eval_tap $? 14 'AdminListTags' test.out

#- 15 AdminListUserAchievements
./ng net.accelbyte.sdk.cli.Main achievement adminListUserAchievements \
    --namespace "$AB_NAMESPACE" \
    --userId 'YEXCWVk7' \
    --limit '21' \
    --offset '2' \
    --preferUnlocked  \
    --sortBy 'achievedAt:desc' \
    --tags '7kRUK4Ur,SuOPTvqM,FdL3AMf7' \
    > test.out 2>&1
eval_tap $? 15 'AdminListUserAchievements' test.out

#- 16 AdminBulkUnlockAchievement
./ng net.accelbyte.sdk.cli.Main achievement adminBulkUnlockAchievement \
    --namespace "$AB_NAMESPACE" \
    --userId 'i7dnrK5w' \
    --body '{"achievementCodes": ["z4F1KqBD", "rn1EWrEw", "R3Ml5iTm"]}' \
    > test.out 2>&1
eval_tap $? 16 'AdminBulkUnlockAchievement' test.out

#- 17 AdminResetAchievement
./ng net.accelbyte.sdk.cli.Main achievement adminResetAchievement \
    --achievementCode 'uKE5y9AK' \
    --namespace "$AB_NAMESPACE" \
    --userId 'LdMf5eaQ' \
    > test.out 2>&1
eval_tap $? 17 'AdminResetAchievement' test.out

#- 18 AdminUnlockAchievement
./ng net.accelbyte.sdk.cli.Main achievement adminUnlockAchievement \
    --achievementCode 'dhxxjIFh' \
    --namespace "$AB_NAMESPACE" \
    --userId '9LNBqAac' \
    > test.out 2>&1
eval_tap $? 18 'AdminUnlockAchievement' test.out

#- 19 AdminAnonymizeUserAchievement
./ng net.accelbyte.sdk.cli.Main achievement adminAnonymizeUserAchievement \
    --namespace "$AB_NAMESPACE" \
    --userId 'LiZZuKO8' \
    > test.out 2>&1
eval_tap $? 19 'AdminAnonymizeUserAchievement' test.out

#- 20 AdminListUserContributions
./ng net.accelbyte.sdk.cli.Main achievement adminListUserContributions \
    --namespace "$AB_NAMESPACE" \
    --userId '2Odtl7Er' \
    --achievementCodes 'G3tTdgJY' \
    --limit '38' \
    --offset '97' \
    --sortBy 'contributedValue:desc' \
    --tags 'FHqNIvNW,YXipGVUZ,65CJKIuF' \
    > test.out 2>&1
eval_tap $? 20 'AdminListUserContributions' test.out

#- 21 PublicListAchievements
./ng net.accelbyte.sdk.cli.Main achievement publicListAchievements \
    --namespace "$AB_NAMESPACE" \
    --global  \
    --limit '51' \
    --offset '20' \
    --sortBy 'listOrder' \
    --tags 'A52WJzSR,lbNTX4Go,ZFTDpruD' \
    --language '23bYf8rQ' \
    > test.out 2>&1
eval_tap $? 21 'PublicListAchievements' test.out

#- 22 PublicGetAchievement
./ng net.accelbyte.sdk.cli.Main achievement publicGetAchievement \
    --achievementCode 'SQCQMdrM' \
    --namespace "$AB_NAMESPACE" \
    --language 'puWcKDmt' \
    > test.out 2>&1
eval_tap $? 22 'PublicGetAchievement' test.out

#- 23 PublicListGlobalAchievements
./ng net.accelbyte.sdk.cli.Main achievement publicListGlobalAchievements \
    --namespace "$AB_NAMESPACE" \
    --achievementCodes 'z6kRnO9g' \
    --limit '89' \
    --offset '65' \
    --sortBy 'createdAt:desc' \
    --status '3XrKIvas' \
    --tags 'b59wRrtH,0Wz2f1LG,VkOlZi5d' \
    > test.out 2>&1
eval_tap $? 23 'PublicListGlobalAchievements' test.out

#- 24 ListGlobalAchievementContributors
./ng net.accelbyte.sdk.cli.Main achievement listGlobalAchievementContributors \
    --achievementCode 'ETFYwRxp' \
    --namespace "$AB_NAMESPACE" \
    --limit '11' \
    --offset '35' \
    --sortBy 'contributedValue:asc' \
    > test.out 2>&1
eval_tap $? 24 'ListGlobalAchievementContributors' test.out

#- 25 PublicListTags
./ng net.accelbyte.sdk.cli.Main achievement publicListTags \
    --namespace "$AB_NAMESPACE" \
    --limit '46' \
    --name 'JrfGpyTI' \
    --offset '92' \
    --sortBy 'name:desc' \
    > test.out 2>&1
eval_tap $? 25 'PublicListTags' test.out

#- 26 PublicListUserAchievements
./ng net.accelbyte.sdk.cli.Main achievement publicListUserAchievements \
    --namespace "$AB_NAMESPACE" \
    --userId 'hAXEtssO' \
    --limit '78' \
    --offset '52' \
    --preferUnlocked  \
    --sortBy 'achievedAt' \
    --tags '89HaK0Jm,GS4buAkm,PmXnluZt' \
    > test.out 2>&1
eval_tap $? 26 'PublicListUserAchievements' test.out

#- 27 PublicBulkUnlockAchievement
./ng net.accelbyte.sdk.cli.Main achievement publicBulkUnlockAchievement \
    --namespace "$AB_NAMESPACE" \
    --userId 'WGLJHFb5' \
    --body '{"achievementCodes": ["Mi4kP2me", "e9CDQTC9", "t8KCDvSH"]}' \
    > test.out 2>&1
eval_tap $? 27 'PublicBulkUnlockAchievement' test.out

#- 28 PublicUnlockAchievement
./ng net.accelbyte.sdk.cli.Main achievement publicUnlockAchievement \
    --achievementCode 'B2h9PPwi' \
    --namespace "$AB_NAMESPACE" \
    --userId 'gLJ4n8pJ' \
    > test.out 2>&1
eval_tap $? 28 'PublicUnlockAchievement' test.out

#- 29 ListUserContributions
./ng net.accelbyte.sdk.cli.Main achievement listUserContributions \
    --namespace "$AB_NAMESPACE" \
    --userId '8E8brmaF' \
    --achievementCodes 'h8LlpaQT' \
    --limit '0' \
    --offset '96' \
    --sortBy 'contributedValue' \
    --tags 'e9B63xNO,QjSZXE8J,3VRDtwVL' \
    > test.out 2>&1
eval_tap $? 29 'ListUserContributions' test.out

#- 30 ClaimGlobalAchievementReward
./ng net.accelbyte.sdk.cli.Main achievement claimGlobalAchievementReward \
    --achievementCode '3w58Y3iG' \
    --namespace "$AB_NAMESPACE" \
    --userId '9v9otEP0' \
    > test.out 2>&1
eval_tap $? 30 'ClaimGlobalAchievementReward' test.out


rm -f "tmp.dat"

exit $EXIT_CODE