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
    --limit '34' \
    --offset '69' \
    --sortBy 'listOrder:desc' \
    --tags 'xF6z9v7f,j7BrGlwb,URpIChWR' \
    > test.out 2>&1
eval_tap $? 2 'AdminListAchievements' test.out

#- 3 AdminCreateNewAchievement
./ng net.accelbyte.sdk.cli.Main achievement adminCreateNewAchievement \
    --namespace "$AB_NAMESPACE" \
    --body '{"achievementCode": "nHUJvKsv", "customAttributes": {"YCoLU1K0": {}, "AsrrIwDh": {}, "JcyS0BJA": {}}, "defaultLanguage": "kmgoKegL", "description": {"yKMIHXki": "hpgl1KrQ", "ynba5kKc": "x2hc6h0Y", "FJOAYrFY": "MKtkXj9M"}, "global": true, "goalValue": 0.6915110342668832, "hidden": false, "incremental": true, "lockedIcons": [{"slug": "dKclcIka", "url": "sTMHlacO"}, {"slug": "py9zOETS", "url": "Udl7iBmd"}, {"slug": "bzgRgUSg", "url": "epcss7Kq"}], "name": {"spnvfdLS": "a6rfwrd4", "Ina5cVDm": "dha9uzKA", "RH8x4MBO": "y5jZdaJt"}, "statCode": "ZWEvHaJr", "tags": ["sSRDOOFQ", "P3ZqMs8z", "U1rhqZ3Z"], "unlockedIcons": [{"slug": "iMCYDnAQ", "url": "0cUHw39t"}, {"slug": "fO10Z3Pn", "url": "wg4EEh2i"}, {"slug": "BfAYPEXz", "url": "6TJzB87K"}]}' \
    > test.out 2>&1
eval_tap $? 3 'AdminCreateNewAchievement' test.out

#- 4 ExportAchievements
./ng net.accelbyte.sdk.cli.Main achievement exportAchievements \
    --namespace "$AB_NAMESPACE" \
    --tags 'ki3KHDZH,6jJWkUcm,766BlLoR' \
    > test.out 2>&1
eval_tap $? 4 'ExportAchievements' test.out

#- 5 ImportAchievements
./ng net.accelbyte.sdk.cli.Main achievement importAchievements \
    --namespace "$AB_NAMESPACE" \
    --file 'tmp.dat' \
    --strategy 'Zmw8yruY' \
    > test.out 2>&1
eval_tap $? 5 'ImportAchievements' test.out

#- 6 AdminGetAchievement
./ng net.accelbyte.sdk.cli.Main achievement adminGetAchievement \
    --achievementCode 'qqvfHjjR' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 6 'AdminGetAchievement' test.out

#- 7 AdminUpdateAchievement
./ng net.accelbyte.sdk.cli.Main achievement adminUpdateAchievement \
    --achievementCode 'il8XI2jd' \
    --namespace "$AB_NAMESPACE" \
    --body '{"customAttributes": {"hNNeq2P8": {}, "wEXkZzhd": {}, "fIvGOpmz": {}}, "defaultLanguage": "arUq5clV", "description": {"7sw0Bgm5": "BevCzPYr", "flnnTeEY": "Q046AqlE", "JVANsTIw": "CJtsTj5I"}, "global": true, "goalValue": 0.2742050027394045, "hidden": false, "incremental": false, "lockedIcons": [{"slug": "yoLPaxeA", "url": "Z7AKufvB"}, {"slug": "3pazaPyf", "url": "if3tieOe"}, {"slug": "qIYQZpqS", "url": "ySYa0Dza"}], "name": {"2YTqZemo": "gynr92SW", "af1EYLuz": "D4u9Iivr", "kypWQbzu": "O3wVLZJO"}, "statCode": "uNpvdg3f", "tags": ["4RF93BtS", "1bjUjbVA", "BCcBVAB0"], "unlockedIcons": [{"slug": "sZID3SSo", "url": "OlUOAUMs"}, {"slug": "tSH4aSVT", "url": "5imXacsy"}, {"slug": "0ywvp0mv", "url": "YXl9nsil"}]}' \
    > test.out 2>&1
eval_tap $? 7 'AdminUpdateAchievement' test.out

#- 8 AdminDeleteAchievement
./ng net.accelbyte.sdk.cli.Main achievement adminDeleteAchievement \
    --achievementCode 'sKhrWlld' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 8 'AdminDeleteAchievement' test.out

#- 9 AdminUpdateAchievementListOrder
./ng net.accelbyte.sdk.cli.Main achievement adminUpdateAchievementListOrder \
    --achievementCode 'nJZETyWa' \
    --namespace "$AB_NAMESPACE" \
    --body '{"targetOrder": 82}' \
    > test.out 2>&1
eval_tap $? 9 'AdminUpdateAchievementListOrder' test.out

#- 10 AdminListGlobalAchievements
./ng net.accelbyte.sdk.cli.Main achievement adminListGlobalAchievements \
    --namespace "$AB_NAMESPACE" \
    --achievementCodes 'giPR2hhm' \
    --limit '84' \
    --offset '30' \
    --sortBy 'createdAt:desc' \
    --status 'Yvp1YYn7' \
    --tags 'MBjZqbZJ,e6nCunWY,b6ODYH3Q' \
    > test.out 2>&1
eval_tap $? 10 'AdminListGlobalAchievements' test.out

#- 11 AdminListGlobalAchievementContributors
./ng net.accelbyte.sdk.cli.Main achievement adminListGlobalAchievementContributors \
    --achievementCode 'QzaZHw3O' \
    --namespace "$AB_NAMESPACE" \
    --limit '1' \
    --offset '0' \
    --sortBy 'contributedValue:asc' \
    > test.out 2>&1
eval_tap $? 11 'AdminListGlobalAchievementContributors' test.out

#- 12 ResetGlobalAchievement
./ng net.accelbyte.sdk.cli.Main achievement resetGlobalAchievement \
    --achievementCode '52XyPFdr' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 12 'ResetGlobalAchievement' test.out

#- 13 BulkCreatePSNEvent
./ng net.accelbyte.sdk.cli.Main achievement bulkCreatePSNEvent \
    --namespace "$AB_NAMESPACE" \
    --body '{"data": [{"events": [{"dateTime": "F2K7QXuE", "eventData": {"eventName": "ioZsF1lg", "properties": {"WfQzdjpJ": {}, "wfWvMnvf": {}, "S0SMa4fN": {}}}, "eventId": "6JD34iXU", "version": "912bfKmN"}, {"dateTime": "f4muzVfK", "eventData": {"eventName": "fnUzDC65", "properties": {"6D8gdCg4": {}, "JtjVmZ5h": {}, "oJMHD7fs": {}}}, "eventId": "TthEsuVf", "version": "zxOLHhav"}, {"dateTime": "Oh15rVcs", "eventData": {"eventName": "lIpxDGdd", "properties": {"Kcso4w3d": {}, "hxyG15Ce": {}, "lzsflUI2": {}}}, "eventId": "9ZDBW22I", "version": "MYbtTbWT"}], "thirdPartyUserId": "Gsbxhhw3", "userId": "mlWvdLXQ"}, {"events": [{"dateTime": "3ou7OMip", "eventData": {"eventName": "Y5LR5gca", "properties": {"6TJQkXaF": {}, "9Q9Aa3T0": {}, "YYJDepkf": {}}}, "eventId": "LDEbBQ9c", "version": "rdgIHpqw"}, {"dateTime": "9Z94G9V2", "eventData": {"eventName": "fXM8Dhfx", "properties": {"OBD9vPCQ": {}, "ruLlmlNp": {}, "UevWRkAw": {}}}, "eventId": "hOUllPSU", "version": "oSOCEZ78"}, {"dateTime": "0sqNzSY4", "eventData": {"eventName": "2oJblQZw", "properties": {"uvlbpzAD": {}, "n6OBkWB5": {}, "AQS2tQdZ": {}}}, "eventId": "6M1jAzhD", "version": "1tNUYflS"}], "thirdPartyUserId": "Yq2jFWmX", "userId": "lO5Ao1cl"}, {"events": [{"dateTime": "Xo83h5yt", "eventData": {"eventName": "qkThK6t7", "properties": {"Lk945070": {}, "Ahgg7g46": {}, "tuDKz6vB": {}}}, "eventId": "iuF6GViB", "version": "c11WEp9Z"}, {"dateTime": "1BF0ENXQ", "eventData": {"eventName": "J2lKDgQa", "properties": {"otmJluhS": {}, "ST2YgltW": {}, "rhohE8l4": {}}}, "eventId": "d8PZgPRM", "version": "AajuOGdf"}, {"dateTime": "jrTrqR7y", "eventData": {"eventName": "pcVvtZaU", "properties": {"oEYRIyEZ": {}, "Y7ofVwK8": {}, "MdHLMaPW": {}}}, "eventId": "RqQFPetG", "version": "rhPp20Ho"}], "thirdPartyUserId": "iVIHVddX", "userId": "MM7uCTjT"}]}' \
    > test.out 2>&1
eval_tap $? 13 'BulkCreatePSNEvent' test.out

#- 14 AdminListTags
./ng net.accelbyte.sdk.cli.Main achievement adminListTags \
    --namespace "$AB_NAMESPACE" \
    --limit '6' \
    --name 'r6EKwaSy' \
    --offset '55' \
    --sortBy 'createdAt' \
    > test.out 2>&1
eval_tap $? 14 'AdminListTags' test.out

#- 15 AdminListUserAchievements
./ng net.accelbyte.sdk.cli.Main achievement adminListUserAchievements \
    --namespace "$AB_NAMESPACE" \
    --userId 'Z3kX52ER' \
    --limit '72' \
    --offset '10' \
    --preferUnlocked  \
    --sortBy 'achievedAt:desc' \
    --tags 'm74SKIgh,oWcXcded,9XIf5y1r' \
    > test.out 2>&1
eval_tap $? 15 'AdminListUserAchievements' test.out

#- 16 AdminBulkUnlockAchievement
./ng net.accelbyte.sdk.cli.Main achievement adminBulkUnlockAchievement \
    --namespace "$AB_NAMESPACE" \
    --userId '8AEA9v1V' \
    --body '{"achievementCodes": ["JJa6iP7I", "jWTn4A5B", "Dou7Eexf"]}' \
    > test.out 2>&1
eval_tap $? 16 'AdminBulkUnlockAchievement' test.out

#- 17 AdminResetAchievement
./ng net.accelbyte.sdk.cli.Main achievement adminResetAchievement \
    --achievementCode 'AyMqinfD' \
    --namespace "$AB_NAMESPACE" \
    --userId 'U5a07pfY' \
    > test.out 2>&1
eval_tap $? 17 'AdminResetAchievement' test.out

#- 18 AdminUnlockAchievement
./ng net.accelbyte.sdk.cli.Main achievement adminUnlockAchievement \
    --achievementCode 'xxhAVb5c' \
    --namespace "$AB_NAMESPACE" \
    --userId 'SihYVKZN' \
    > test.out 2>&1
eval_tap $? 18 'AdminUnlockAchievement' test.out

#- 19 AdminAnonymizeUserAchievement
./ng net.accelbyte.sdk.cli.Main achievement adminAnonymizeUserAchievement \
    --namespace "$AB_NAMESPACE" \
    --userId 'AmMFDeV1' \
    > test.out 2>&1
eval_tap $? 19 'AdminAnonymizeUserAchievement' test.out

#- 20 AdminListUserContributions
./ng net.accelbyte.sdk.cli.Main achievement adminListUserContributions \
    --namespace "$AB_NAMESPACE" \
    --userId 'N9Uxrsrr' \
    --achievementCodes 'BBEBHJDP' \
    --limit '12' \
    --offset '33' \
    --sortBy 'contributedValue' \
    --tags 'AlKjvU0Q,qdPod6rD,r3yqOvas' \
    > test.out 2>&1
eval_tap $? 20 'AdminListUserContributions' test.out

#- 21 PublicListAchievements
./ng net.accelbyte.sdk.cli.Main achievement publicListAchievements \
    --namespace "$AB_NAMESPACE" \
    --global  \
    --limit '22' \
    --offset '43' \
    --sortBy 'listOrder:desc' \
    --tags 'oPPp55nF,PSiUICWq,UBeXJQR0' \
    --language 'pO9kqIAc' \
    > test.out 2>&1
eval_tap $? 21 'PublicListAchievements' test.out

#- 22 PublicGetAchievement
./ng net.accelbyte.sdk.cli.Main achievement publicGetAchievement \
    --achievementCode 'jXu3juJb' \
    --namespace "$AB_NAMESPACE" \
    --language 'RZi3OVBC' \
    > test.out 2>&1
eval_tap $? 22 'PublicGetAchievement' test.out

#- 23 PublicListGlobalAchievements
./ng net.accelbyte.sdk.cli.Main achievement publicListGlobalAchievements \
    --namespace "$AB_NAMESPACE" \
    --achievementCodes 'EkUYpK4L' \
    --limit '0' \
    --offset '48' \
    --sortBy 'achievedAt' \
    --status 'fVHee50E' \
    --tags 'RxNbcBRc,EmmTMR1s,zbCQZMZD' \
    > test.out 2>&1
eval_tap $? 23 'PublicListGlobalAchievements' test.out

#- 24 ListGlobalAchievementContributors
./ng net.accelbyte.sdk.cli.Main achievement listGlobalAchievementContributors \
    --achievementCode 'saIBZEWv' \
    --namespace "$AB_NAMESPACE" \
    --limit '9' \
    --offset '61' \
    --sortBy 'contributedValue:asc' \
    > test.out 2>&1
eval_tap $? 24 'ListGlobalAchievementContributors' test.out

#- 25 PublicListTags
./ng net.accelbyte.sdk.cli.Main achievement publicListTags \
    --namespace "$AB_NAMESPACE" \
    --limit '57' \
    --name 'EAdrsUSr' \
    --offset '61' \
    --sortBy 'createdAt:asc' \
    > test.out 2>&1
eval_tap $? 25 'PublicListTags' test.out

#- 26 PublicListUserAchievements
./ng net.accelbyte.sdk.cli.Main achievement publicListUserAchievements \
    --namespace "$AB_NAMESPACE" \
    --userId 'LrleRqAg' \
    --limit '11' \
    --offset '49' \
    --preferUnlocked  \
    --sortBy 'achievedAt:desc' \
    --tags '9ypvJA6W,DGjAdWYj,sRRT5Sr5' \
    > test.out 2>&1
eval_tap $? 26 'PublicListUserAchievements' test.out

#- 27 PublicBulkUnlockAchievement
./ng net.accelbyte.sdk.cli.Main achievement publicBulkUnlockAchievement \
    --namespace "$AB_NAMESPACE" \
    --userId 'q5LEAHoO' \
    --body '{"achievementCodes": ["Bpg46X0E", "E7eEBFtK", "5KuJqcnQ"]}' \
    > test.out 2>&1
eval_tap $? 27 'PublicBulkUnlockAchievement' test.out

#- 28 PublicUnlockAchievement
./ng net.accelbyte.sdk.cli.Main achievement publicUnlockAchievement \
    --achievementCode '11kXLKdy' \
    --namespace "$AB_NAMESPACE" \
    --userId 'qpS6EpuN' \
    > test.out 2>&1
eval_tap $? 28 'PublicUnlockAchievement' test.out

#- 29 ListUserContributions
./ng net.accelbyte.sdk.cli.Main achievement listUserContributions \
    --namespace "$AB_NAMESPACE" \
    --userId 'BIyozMYG' \
    --achievementCodes 'YhtrTttk' \
    --limit '48' \
    --offset '38' \
    --sortBy 'contributedValue:asc' \
    --tags 'WHa4vchu,aIaD5dvb,2YQ3oKhk' \
    > test.out 2>&1
eval_tap $? 29 'ListUserContributions' test.out

#- 30 ClaimGlobalAchievementReward
./ng net.accelbyte.sdk.cli.Main achievement claimGlobalAchievementReward \
    --achievementCode 'SxFx4y5N' \
    --namespace "$AB_NAMESPACE" \
    --userId '8OXscjTa' \
    > test.out 2>&1
eval_tap $? 30 'ClaimGlobalAchievementReward' test.out


rm -f "tmp.dat"

exit $EXIT_CODE