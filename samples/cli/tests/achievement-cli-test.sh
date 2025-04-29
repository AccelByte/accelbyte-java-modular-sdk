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
    --limit '3' \
    --offset '1' \
    --sortBy 'updatedAt' \
    --tags 'ogTBqN0V,NxaZ9iVR,UeENlgD1' \
    > test.out 2>&1
eval_tap $? 2 'AdminListAchievements' test.out

#- 3 AdminCreateNewAchievement
./ng net.accelbyte.sdk.cli.Main achievement adminCreateNewAchievement \
    --namespace "$AB_NAMESPACE" \
    --body '{"achievementCode": "dcI6AMou", "customAttributes": {"4tRGbY9A": {}, "1k83459r": {}, "ogZalUmt": {}}, "defaultLanguage": "YHvItMbE", "description": {"e3cLzeEL": "tx4megCa", "6skQU5Cj": "BPWwhhOO", "smYnazjZ": "TTd9x3QH"}, "global": true, "goalValue": 0.7524522380047585, "hidden": true, "incremental": true, "lockedIcons": [{"slug": "B8qyIh6M", "url": "hlNuvHSV"}, {"slug": "JGPDNsxV", "url": "xOOcuwJs"}, {"slug": "vktTOmts", "url": "EW0II6Xx"}], "name": {"3O832ziI": "RK2pyOuW", "9alDCYZP": "t2pCzUEZ", "iQUPpSb8": "Gt4B69Or"}, "statCode": "kbLO9jTz", "tags": ["hamORrd0", "wIiv0Oyf", "pvpVSV5I"], "unlockedIcons": [{"slug": "3SaTMC4Y", "url": "fHXtLPaY"}, {"slug": "7TwfAy9S", "url": "LwFsRRrA"}, {"slug": "b0HOBWvU", "url": "BsCUjUrn"}]}' \
    > test.out 2>&1
eval_tap $? 3 'AdminCreateNewAchievement' test.out

#- 4 ExportAchievements
./ng net.accelbyte.sdk.cli.Main achievement exportAchievements \
    --namespace "$AB_NAMESPACE" \
    --tags 'X9oqJ2rv,TCU2MOD3,NrI8moXt' \
    > test.out 2>&1
eval_tap $? 4 'ExportAchievements' test.out

#- 5 ImportAchievements
./ng net.accelbyte.sdk.cli.Main achievement importAchievements \
    --namespace "$AB_NAMESPACE" \
    --file 'tmp.dat' \
    --strategy 'lmO8B1S5' \
    > test.out 2>&1
eval_tap $? 5 'ImportAchievements' test.out

#- 6 AdminGetAchievement
./ng net.accelbyte.sdk.cli.Main achievement adminGetAchievement \
    --achievementCode 'sJPP5plj' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 6 'AdminGetAchievement' test.out

#- 7 AdminUpdateAchievement
./ng net.accelbyte.sdk.cli.Main achievement adminUpdateAchievement \
    --achievementCode 'ctaRMhyD' \
    --namespace "$AB_NAMESPACE" \
    --body '{"customAttributes": {"XlL4q1nQ": {}, "h7aa21r7": {}, "TUGcmxIF": {}}, "defaultLanguage": "gZ42yDnW", "description": {"GenFjdsF": "cH4FhBqU", "jToLkA5i": "LBq4vSoW", "aXFaRJL1": "qngfet7z"}, "global": true, "goalValue": 0.21027689142610761, "hidden": false, "incremental": true, "lockedIcons": [{"slug": "Esf96itQ", "url": "F2IEalQ0"}, {"slug": "IWm1JjF5", "url": "cDmj0Knh"}, {"slug": "6SMjmb81", "url": "nLQZaXBI"}], "name": {"UjXc2llS": "Cj64JkCs", "s1n7WjHR": "SPuxwKLD", "aocKHHju": "R06lqsJm"}, "statCode": "0hqUilhT", "tags": ["m0HIVB9d", "GZjwpIr1", "VWaqeIZ9"], "unlockedIcons": [{"slug": "kzrSc06L", "url": "nUPMiPQg"}, {"slug": "FJnCFqOm", "url": "nTv8oDAH"}, {"slug": "3JmUMCSQ", "url": "kv3lPmTr"}]}' \
    > test.out 2>&1
eval_tap $? 7 'AdminUpdateAchievement' test.out

#- 8 AdminDeleteAchievement
./ng net.accelbyte.sdk.cli.Main achievement adminDeleteAchievement \
    --achievementCode '9CpNKynD' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 8 'AdminDeleteAchievement' test.out

#- 9 AdminUpdateAchievementListOrder
./ng net.accelbyte.sdk.cli.Main achievement adminUpdateAchievementListOrder \
    --achievementCode 'Rr2vhTZw' \
    --namespace "$AB_NAMESPACE" \
    --body '{"targetOrder": 5}' \
    > test.out 2>&1
eval_tap $? 9 'AdminUpdateAchievementListOrder' test.out

#- 10 AdminListGlobalAchievements
./ng net.accelbyte.sdk.cli.Main achievement adminListGlobalAchievements \
    --namespace "$AB_NAMESPACE" \
    --achievementCodes 'a85j3p21' \
    --limit '100' \
    --offset '66' \
    --sortBy 'createdAt:asc' \
    --status '3Z7wkrkU' \
    --tags 'pMc1nPV9,Wb1iI2BH,Fwn793Q1' \
    > test.out 2>&1
eval_tap $? 10 'AdminListGlobalAchievements' test.out

#- 11 AdminListGlobalAchievementContributors
./ng net.accelbyte.sdk.cli.Main achievement adminListGlobalAchievementContributors \
    --achievementCode 'nBYF20ZU' \
    --namespace "$AB_NAMESPACE" \
    --limit '66' \
    --offset '86' \
    --sortBy 'contributedValue:desc' \
    > test.out 2>&1
eval_tap $? 11 'AdminListGlobalAchievementContributors' test.out

#- 12 ResetGlobalAchievement
./ng net.accelbyte.sdk.cli.Main achievement resetGlobalAchievement \
    --achievementCode 'YBdapXXH' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 12 'ResetGlobalAchievement' test.out

#- 13 BulkCreatePSNEvent
./ng net.accelbyte.sdk.cli.Main achievement bulkCreatePSNEvent \
    --namespace "$AB_NAMESPACE" \
    --body '{"data": [{"events": [{"dateTime": "ClQTGWp6", "eventData": {"eventName": "vJw6UXqo", "properties": {"pcwZKpEM": {}, "KeDD31s4": {}, "fTkMbKBo": {}}}, "eventId": "iGi1Tkqk", "version": "ZhX7s654"}, {"dateTime": "dEHlacCs", "eventData": {"eventName": "dvXapSV2", "properties": {"pdVXA1z5": {}, "09AXm3Ih": {}, "telCG98f": {}}}, "eventId": "6IdbhPNc", "version": "H013DbiK"}, {"dateTime": "W2wlWsWe", "eventData": {"eventName": "DdkHqOri", "properties": {"VFxyEfLa": {}, "JLo0iWAN": {}, "uB1GsUnX": {}}}, "eventId": "QueszrDr", "version": "dBMIql2P"}], "thirdPartyUserId": "Y7OhT872", "userId": "LbUqlryl"}, {"events": [{"dateTime": "lialPwaH", "eventData": {"eventName": "XYOlvSd2", "properties": {"sItVMjOI": {}, "AkL6YvoH": {}, "1j4bNjQ8": {}}}, "eventId": "1dVWHTec", "version": "3UILm9mA"}, {"dateTime": "9UULGg8A", "eventData": {"eventName": "KG4ln7Gt", "properties": {"8ADnJkWn": {}, "Rv3bIYtl": {}, "xkIMfb9v": {}}}, "eventId": "jSjPLLm1", "version": "vEzaWSn2"}, {"dateTime": "VLevYcIs", "eventData": {"eventName": "ucs3PFWp", "properties": {"AlWxmdHP": {}, "wJPPWA4c": {}, "zR87XgoS": {}}}, "eventId": "LxLlrckz", "version": "j88UNFI6"}], "thirdPartyUserId": "7rb8w03E", "userId": "HTuFzJQJ"}, {"events": [{"dateTime": "wiWGbzXP", "eventData": {"eventName": "ZA4KI0Gx", "properties": {"MuXCBnSg": {}, "1c6t30cz": {}, "1SVPc373": {}}}, "eventId": "TMgtBFkg", "version": "4AUHJS92"}, {"dateTime": "PF0hbqfg", "eventData": {"eventName": "ydUfnvwp", "properties": {"R2h7YBsh": {}, "Mmo8MX9M": {}, "aLutRwcs": {}}}, "eventId": "crQe4Ab2", "version": "OOCQqdas"}, {"dateTime": "2V5Edkw8", "eventData": {"eventName": "ZQCqKPCi", "properties": {"EwrvFgtv": {}, "SKBC1qze": {}, "3zxo3IKs": {}}}, "eventId": "QbxBhtNT", "version": "W1jpxMym"}], "thirdPartyUserId": "91AvPb0x", "userId": "kg7Bd2xg"}]}' \
    > test.out 2>&1
eval_tap $? 13 'BulkCreatePSNEvent' test.out

#- 14 AdminListTags
./ng net.accelbyte.sdk.cli.Main achievement adminListTags \
    --namespace "$AB_NAMESPACE" \
    --limit '59' \
    --name 'EcpDotGP' \
    --offset '90' \
    --sortBy 'createdAt:desc' \
    > test.out 2>&1
eval_tap $? 14 'AdminListTags' test.out

#- 15 AdminListUserAchievements
./ng net.accelbyte.sdk.cli.Main achievement adminListUserAchievements \
    --namespace "$AB_NAMESPACE" \
    --userId 'MWP1hKkJ' \
    --limit '19' \
    --offset '19' \
    --preferUnlocked  \
    --sortBy 'createdAt:asc' \
    --tags 'EVh5Fdhr,uOSW0WvJ,7xp5B0HF' \
    > test.out 2>&1
eval_tap $? 15 'AdminListUserAchievements' test.out

#- 16 AdminBulkUnlockAchievement
./ng net.accelbyte.sdk.cli.Main achievement adminBulkUnlockAchievement \
    --namespace "$AB_NAMESPACE" \
    --userId '0i8jR5BH' \
    --body '{"achievementCodes": ["GBl6EbUu", "smaHStix", "drvj7sxY"]}' \
    > test.out 2>&1
eval_tap $? 16 'AdminBulkUnlockAchievement' test.out

#- 17 AdminResetAchievement
./ng net.accelbyte.sdk.cli.Main achievement adminResetAchievement \
    --achievementCode '2J589HCN' \
    --namespace "$AB_NAMESPACE" \
    --userId 'geKLujnJ' \
    > test.out 2>&1
eval_tap $? 17 'AdminResetAchievement' test.out

#- 18 AdminUnlockAchievement
./ng net.accelbyte.sdk.cli.Main achievement adminUnlockAchievement \
    --achievementCode 'B6afmYCK' \
    --namespace "$AB_NAMESPACE" \
    --userId '4ASHjB2P' \
    > test.out 2>&1
eval_tap $? 18 'AdminUnlockAchievement' test.out

#- 19 AdminAnonymizeUserAchievement
./ng net.accelbyte.sdk.cli.Main achievement adminAnonymizeUserAchievement \
    --namespace "$AB_NAMESPACE" \
    --userId 'bhee1V35' \
    > test.out 2>&1
eval_tap $? 19 'AdminAnonymizeUserAchievement' test.out

#- 20 AdminListUserContributions
./ng net.accelbyte.sdk.cli.Main achievement adminListUserContributions \
    --namespace "$AB_NAMESPACE" \
    --userId 'V7w7AK3F' \
    --achievementCodes 'esTR3enQ' \
    --limit '85' \
    --offset '68' \
    --sortBy 'contributedValue:asc' \
    --tags 'O8vkiF3U,vEaiGTDI,f8MI2MyJ' \
    > test.out 2>&1
eval_tap $? 20 'AdminListUserContributions' test.out

#- 21 PublicListAchievements
./ng net.accelbyte.sdk.cli.Main achievement publicListAchievements \
    --namespace "$AB_NAMESPACE" \
    --global  \
    --limit '78' \
    --offset '71' \
    --sortBy 'createdAt:asc' \
    --tags 'meXsXweJ,YXRcVNfO,isIwIr5L' \
    --language 'YWgHYhDx' \
    > test.out 2>&1
eval_tap $? 21 'PublicListAchievements' test.out

#- 22 PublicGetAchievement
./ng net.accelbyte.sdk.cli.Main achievement publicGetAchievement \
    --achievementCode 'r2h52FEt' \
    --namespace "$AB_NAMESPACE" \
    --language 'RViadSeF' \
    > test.out 2>&1
eval_tap $? 22 'PublicGetAchievement' test.out

#- 23 PublicListGlobalAchievements
./ng net.accelbyte.sdk.cli.Main achievement publicListGlobalAchievements \
    --namespace "$AB_NAMESPACE" \
    --achievementCodes 'QHwZ35kB' \
    --limit '24' \
    --offset '74' \
    --sortBy 'achievedAt' \
    --status 'G0hEnL88' \
    --tags 't5GuCpgA,2guNcFMn,dU6hwqiT' \
    > test.out 2>&1
eval_tap $? 23 'PublicListGlobalAchievements' test.out

#- 24 ListGlobalAchievementContributors
./ng net.accelbyte.sdk.cli.Main achievement listGlobalAchievementContributors \
    --achievementCode 'VpxNv9Wt' \
    --namespace "$AB_NAMESPACE" \
    --limit '75' \
    --offset '2' \
    --sortBy 'contributedValue:desc' \
    > test.out 2>&1
eval_tap $? 24 'ListGlobalAchievementContributors' test.out

#- 25 PublicListTags
./ng net.accelbyte.sdk.cli.Main achievement publicListTags \
    --namespace "$AB_NAMESPACE" \
    --limit '0' \
    --name 'rztxHQbj' \
    --offset '68' \
    --sortBy 'name:desc' \
    > test.out 2>&1
eval_tap $? 25 'PublicListTags' test.out

#- 26 PublicListUserAchievements
./ng net.accelbyte.sdk.cli.Main achievement publicListUserAchievements \
    --namespace "$AB_NAMESPACE" \
    --userId 'IEQkzGKb' \
    --limit '4' \
    --offset '55' \
    --preferUnlocked  \
    --sortBy 'createdAt:desc' \
    --tags 'eK6j3TNZ,yJTITRlL,BPb7tH9I' \
    > test.out 2>&1
eval_tap $? 26 'PublicListUserAchievements' test.out

#- 27 PublicBulkUnlockAchievement
./ng net.accelbyte.sdk.cli.Main achievement publicBulkUnlockAchievement \
    --namespace "$AB_NAMESPACE" \
    --userId 'EKFcXB5C' \
    --body '{"achievementCodes": ["J9Z4J18W", "kRYHmX05", "pr42UI1W"]}' \
    > test.out 2>&1
eval_tap $? 27 'PublicBulkUnlockAchievement' test.out

#- 28 PublicUnlockAchievement
./ng net.accelbyte.sdk.cli.Main achievement publicUnlockAchievement \
    --achievementCode 'LYJy3FCF' \
    --namespace "$AB_NAMESPACE" \
    --userId 'gi6j9Aqy' \
    > test.out 2>&1
eval_tap $? 28 'PublicUnlockAchievement' test.out

#- 29 ListUserContributions
./ng net.accelbyte.sdk.cli.Main achievement listUserContributions \
    --namespace "$AB_NAMESPACE" \
    --userId 'bMAmyfP9' \
    --achievementCodes 'C3zFb1HI' \
    --limit '99' \
    --offset '43' \
    --sortBy 'contributedValue' \
    --tags '4g2jcVpF,AUo7RpNY,ZQQEFrvO' \
    > test.out 2>&1
eval_tap $? 29 'ListUserContributions' test.out

#- 30 ClaimGlobalAchievementReward
./ng net.accelbyte.sdk.cli.Main achievement claimGlobalAchievementReward \
    --achievementCode 'tIlewp9w' \
    --namespace "$AB_NAMESPACE" \
    --userId 'GpIxtTRA' \
    > test.out 2>&1
eval_tap $? 30 'ClaimGlobalAchievementReward' test.out


rm -f "tmp.dat"

exit $EXIT_CODE