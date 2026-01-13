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
    --limit '63' \
    --offset '49' \
    --sortBy 'createdAt:desc' \
    --tags '94F9xR2m,dszVQMJT,cX5Rw5eq' \
    > test.out 2>&1
eval_tap $? 2 'AdminListAchievements' test.out

#- 3 AdminCreateNewAchievement
./ng net.accelbyte.sdk.cli.Main achievement adminCreateNewAchievement \
    --namespace "$AB_NAMESPACE" \
    --body '{"achievementCode": "MJSqK1NQ", "customAttributes": {"K9RbYcjq": {}, "YiQFWWDs": {}, "9ymxEQqr": {}}, "defaultLanguage": "V0zyT2h8", "description": {"ucnnnzh3": "wHbaFA7N", "vv1VPUII": "xR2dYo0x", "PRqexb06": "kf69xuK5"}, "global": false, "goalValue": 0.2662490721401123, "hidden": false, "incremental": true, "lockedIcons": [{"slug": "wOjG0lWF", "url": "0mH8iS3y"}, {"slug": "2bvUgeuk", "url": "RFGLcwY0"}, {"slug": "XNudp6gV", "url": "hSLZxb8H"}], "name": {"DMROR8aD": "WAx95iMF", "U044JfoD": "KNmzVVoO", "EpDJGAy5": "UDarb2uE"}, "statCode": "e1YLtB7r", "tags": ["mgqyIACl", "r1ckede9", "zwfeiSeP"], "unlockedIcons": [{"slug": "9sDsn10E", "url": "pOT5Lv7i"}, {"slug": "hzR7gVfN", "url": "WyHBsmKL"}, {"slug": "yHzPKATt", "url": "livvmZNV"}]}' \
    > test.out 2>&1
eval_tap $? 3 'AdminCreateNewAchievement' test.out

#- 4 ExportAchievements
./ng net.accelbyte.sdk.cli.Main achievement exportAchievements \
    --namespace "$AB_NAMESPACE" \
    --tags '1abTGiTw,gSrfmOMB,m9Wew63b' \
    > test.out 2>&1
eval_tap $? 4 'ExportAchievements' test.out

#- 5 ImportAchievements
./ng net.accelbyte.sdk.cli.Main achievement importAchievements \
    --namespace "$AB_NAMESPACE" \
    --file 'tmp.dat' \
    --strategy 'jeMZiKs2' \
    > test.out 2>&1
eval_tap $? 5 'ImportAchievements' test.out

#- 6 AdminGetAchievement
./ng net.accelbyte.sdk.cli.Main achievement adminGetAchievement \
    --achievementCode 'YaaEjtgc' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 6 'AdminGetAchievement' test.out

#- 7 AdminUpdateAchievement
./ng net.accelbyte.sdk.cli.Main achievement adminUpdateAchievement \
    --achievementCode 'rvrCOJcl' \
    --namespace "$AB_NAMESPACE" \
    --body '{"customAttributes": {"emWXj6Hf": {}, "MwFWxted": {}, "aXdP6gh6": {}}, "defaultLanguage": "dr2uuxyW", "description": {"XZ13gPcO": "f4UeB53n", "bhRSTbcr": "KFn1nKba", "trsv27de": "h6LfJcUE"}, "global": true, "goalValue": 0.33602390435195095, "hidden": false, "incremental": false, "lockedIcons": [{"slug": "iO41Gvfc", "url": "7OvlIs96"}, {"slug": "ge0udtM3", "url": "nNJMl7tW"}, {"slug": "5bRM023n", "url": "YU36S8fN"}], "name": {"c8GJrkAx": "C0jFs7Ct", "Ppgmnf2r": "KcAl5l56", "FfQ6HnjM": "ilOm5oNv"}, "statCode": "ajsY6HPc", "tags": ["QiZ1F5r1", "lqFOpdWI", "vgQZ2J9Y"], "unlockedIcons": [{"slug": "q8DbUqev", "url": "1kyC0qDw"}, {"slug": "ewhBQn2O", "url": "w6GqQ4sG"}, {"slug": "h1GXyEEv", "url": "0mIOPW27"}]}' \
    > test.out 2>&1
eval_tap $? 7 'AdminUpdateAchievement' test.out

#- 8 AdminDeleteAchievement
./ng net.accelbyte.sdk.cli.Main achievement adminDeleteAchievement \
    --achievementCode '9RVkwrHV' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 8 'AdminDeleteAchievement' test.out

#- 9 AdminUpdateAchievementListOrder
./ng net.accelbyte.sdk.cli.Main achievement adminUpdateAchievementListOrder \
    --achievementCode 'uDBpBmvV' \
    --namespace "$AB_NAMESPACE" \
    --body '{"targetOrder": 43}' \
    > test.out 2>&1
eval_tap $? 9 'AdminUpdateAchievementListOrder' test.out

#- 10 AdminListGlobalAchievements
./ng net.accelbyte.sdk.cli.Main achievement adminListGlobalAchievements \
    --namespace "$AB_NAMESPACE" \
    --achievementCodes 'CFLRZ2iX' \
    --limit '8' \
    --offset '60' \
    --sortBy 'achievedAt:desc' \
    --status 'OLLs1Eg9' \
    --tags 'DgCxAafa,CaTY13xU,JVu4xQnP' \
    > test.out 2>&1
eval_tap $? 10 'AdminListGlobalAchievements' test.out

#- 11 AdminListGlobalAchievementContributors
./ng net.accelbyte.sdk.cli.Main achievement adminListGlobalAchievementContributors \
    --achievementCode 'O0ouYAUb' \
    --namespace "$AB_NAMESPACE" \
    --limit '96' \
    --offset '21' \
    --sortBy 'contributedValue:desc' \
    > test.out 2>&1
eval_tap $? 11 'AdminListGlobalAchievementContributors' test.out

#- 12 ResetGlobalAchievement
./ng net.accelbyte.sdk.cli.Main achievement resetGlobalAchievement \
    --achievementCode '2Q3LcZrA' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 12 'ResetGlobalAchievement' test.out

#- 13 BulkCreatePSNEvent
./ng net.accelbyte.sdk.cli.Main achievement bulkCreatePSNEvent \
    --namespace "$AB_NAMESPACE" \
    --body '{"data": [{"events": [{"dateTime": "a5Wevnxj", "eventData": {"eventName": "AJj26wKF", "properties": {"QHBht3Up": {}, "hRIznSff": {}, "LjSwSChE": {}}}, "eventId": "cy0idl2H", "version": "s4ERHGbK"}, {"dateTime": "gqgnkSwq", "eventData": {"eventName": "Lj63R7H5", "properties": {"5yixzd53": {}, "zHx5gEOh": {}, "wmbXGGEX": {}}}, "eventId": "WglEb49W", "version": "VrqNkVDw"}, {"dateTime": "o4asAaUT", "eventData": {"eventName": "helLZgbC", "properties": {"pA2MbIF6": {}, "Qj647d5d": {}, "SzbpbXIJ": {}}}, "eventId": "VQzSgUWD", "version": "udSlGvHj"}], "thirdPartyUserId": "9nAWVJsX", "userId": "7eQ5mMUr"}, {"events": [{"dateTime": "rDA5P45B", "eventData": {"eventName": "8Z6M43g0", "properties": {"v6Iotzzq": {}, "l12Sw0Dv": {}, "5EJR6ov6": {}}}, "eventId": "XEZ62rP6", "version": "KGc3jAoV"}, {"dateTime": "uNgDqhOb", "eventData": {"eventName": "BJBDHVuK", "properties": {"vnxcPCJV": {}, "miksbb4T": {}, "rsGprqqB": {}}}, "eventId": "fVi8NSt1", "version": "IVqzbfDm"}, {"dateTime": "F2dlhcE4", "eventData": {"eventName": "FVM7MqKs", "properties": {"llp0ZGvf": {}, "VBSlYomd": {}, "ocj1VZL1": {}}}, "eventId": "tB9D4qYT", "version": "xGFBAxoH"}], "thirdPartyUserId": "BCf7dcOq", "userId": "YHRFFpnP"}, {"events": [{"dateTime": "Fjb7iaDi", "eventData": {"eventName": "ByX4fFwH", "properties": {"E46tViCm": {}, "1TjJxqUR": {}, "CzypYs0i": {}}}, "eventId": "q6HhKJNM", "version": "iyfv7HB7"}, {"dateTime": "WdcKtSXn", "eventData": {"eventName": "j6ee5CRL", "properties": {"uhjF8rej": {}, "WWciyXOR": {}, "da7eFAWJ": {}}}, "eventId": "P5liuP18", "version": "o9WotIYn"}, {"dateTime": "DixbUowU", "eventData": {"eventName": "Y154nRmL", "properties": {"xPjnYPmv": {}, "nlFGlhFx": {}, "t6VzZr3o": {}}}, "eventId": "E1ylyPZw", "version": "ZvBw8YNn"}], "thirdPartyUserId": "ogK8qLmp", "userId": "6eUs9Sid"}]}' \
    > test.out 2>&1
eval_tap $? 13 'BulkCreatePSNEvent' test.out

#- 14 AdminListTags
./ng net.accelbyte.sdk.cli.Main achievement adminListTags \
    --namespace "$AB_NAMESPACE" \
    --limit '51' \
    --name 'isjGL95o' \
    --offset '42' \
    --sortBy 'createdAt' \
    > test.out 2>&1
eval_tap $? 14 'AdminListTags' test.out

#- 15 AdminListUserAchievements
./ng net.accelbyte.sdk.cli.Main achievement adminListUserAchievements \
    --namespace "$AB_NAMESPACE" \
    --userId 'ui6s5v0r' \
    --limit '66' \
    --offset '24' \
    --preferUnlocked  \
    --sortBy 'achievedAt' \
    --tags 'b5Sy4zPt,ELJjkPpO,hdU4ccTk' \
    > test.out 2>&1
eval_tap $? 15 'AdminListUserAchievements' test.out

#- 16 AdminBulkUnlockAchievement
./ng net.accelbyte.sdk.cli.Main achievement adminBulkUnlockAchievement \
    --namespace "$AB_NAMESPACE" \
    --userId 'RXTVeCsw' \
    --body '{"achievementCodes": ["jWq03U7y", "5jODFegj", "buBLzgd1"]}' \
    > test.out 2>&1
eval_tap $? 16 'AdminBulkUnlockAchievement' test.out

#- 17 AdminResetAchievement
./ng net.accelbyte.sdk.cli.Main achievement adminResetAchievement \
    --achievementCode '2d8o9vp9' \
    --namespace "$AB_NAMESPACE" \
    --userId 'ZgGNAA94' \
    > test.out 2>&1
eval_tap $? 17 'AdminResetAchievement' test.out

#- 18 AdminUnlockAchievement
./ng net.accelbyte.sdk.cli.Main achievement adminUnlockAchievement \
    --achievementCode 'v0jJHUpi' \
    --namespace "$AB_NAMESPACE" \
    --userId 'b2vlkZU3' \
    > test.out 2>&1
eval_tap $? 18 'AdminUnlockAchievement' test.out

#- 19 AdminAnonymizeUserAchievement
./ng net.accelbyte.sdk.cli.Main achievement adminAnonymizeUserAchievement \
    --namespace "$AB_NAMESPACE" \
    --userId 'aeVIeCLi' \
    > test.out 2>&1
eval_tap $? 19 'AdminAnonymizeUserAchievement' test.out

#- 20 AdminListUserContributions
./ng net.accelbyte.sdk.cli.Main achievement adminListUserContributions \
    --namespace "$AB_NAMESPACE" \
    --userId 'vS84I9c5' \
    --achievementCodes 'oKiTNOvN' \
    --limit '88' \
    --offset '34' \
    --sortBy 'contributedValue' \
    --tags 'SebgRaaT,WLWAq2Tx,dikZHWCM' \
    > test.out 2>&1
eval_tap $? 20 'AdminListUserContributions' test.out

#- 21 PublicListAchievements
./ng net.accelbyte.sdk.cli.Main achievement publicListAchievements \
    --namespace "$AB_NAMESPACE" \
    --global  \
    --limit '95' \
    --offset '3' \
    --sortBy 'listOrder:asc' \
    --tags '42fhrEFd,vyHPgDmQ,b7TRDKzy' \
    --language 'BzlttLRL' \
    > test.out 2>&1
eval_tap $? 21 'PublicListAchievements' test.out

#- 22 PublicGetAchievement
./ng net.accelbyte.sdk.cli.Main achievement publicGetAchievement \
    --achievementCode '72QhhiiI' \
    --namespace "$AB_NAMESPACE" \
    --language 'LQY3Hmgy' \
    > test.out 2>&1
eval_tap $? 22 'PublicGetAchievement' test.out

#- 23 PublicListGlobalAchievements
./ng net.accelbyte.sdk.cli.Main achievement publicListGlobalAchievements \
    --namespace "$AB_NAMESPACE" \
    --achievementCodes '0mJr5aqq' \
    --limit '79' \
    --offset '53' \
    --sortBy 'createdAt:desc' \
    --status 'owuMyk61' \
    --tags 'JOHcrYG2,aiFC8uQ5,NpxtjMqm' \
    > test.out 2>&1
eval_tap $? 23 'PublicListGlobalAchievements' test.out

#- 24 ListGlobalAchievementContributors
./ng net.accelbyte.sdk.cli.Main achievement listGlobalAchievementContributors \
    --achievementCode 'AFvsDG0T' \
    --namespace "$AB_NAMESPACE" \
    --limit '87' \
    --offset '64' \
    --sortBy 'contributedValue:desc' \
    > test.out 2>&1
eval_tap $? 24 'ListGlobalAchievementContributors' test.out

#- 25 PublicListTags
./ng net.accelbyte.sdk.cli.Main achievement publicListTags \
    --namespace "$AB_NAMESPACE" \
    --limit '51' \
    --name 'yjIpxpIn' \
    --offset '58' \
    --sortBy 'name:desc' \
    > test.out 2>&1
eval_tap $? 25 'PublicListTags' test.out

#- 26 PublicListUserAchievements
./ng net.accelbyte.sdk.cli.Main achievement publicListUserAchievements \
    --namespace "$AB_NAMESPACE" \
    --userId '86sBevzk' \
    --limit '75' \
    --offset '88' \
    --preferUnlocked  \
    --sortBy 'createdAt' \
    --tags 'R4gGKvOH,MxwSLA7E,pfWqUmDb' \
    > test.out 2>&1
eval_tap $? 26 'PublicListUserAchievements' test.out

#- 27 PublicBulkUnlockAchievement
./ng net.accelbyte.sdk.cli.Main achievement publicBulkUnlockAchievement \
    --namespace "$AB_NAMESPACE" \
    --userId '257GDPdb' \
    --body '{"achievementCodes": ["hCGXNIcq", "QcC7UC72", "G2APWh90"]}' \
    > test.out 2>&1
eval_tap $? 27 'PublicBulkUnlockAchievement' test.out

#- 28 PublicUnlockAchievement
./ng net.accelbyte.sdk.cli.Main achievement publicUnlockAchievement \
    --achievementCode 'od8jofT8' \
    --namespace "$AB_NAMESPACE" \
    --userId 'pLLF1JXb' \
    > test.out 2>&1
eval_tap $? 28 'PublicUnlockAchievement' test.out

#- 29 ListUserContributions
./ng net.accelbyte.sdk.cli.Main achievement listUserContributions \
    --namespace "$AB_NAMESPACE" \
    --userId '17MKy1Cw' \
    --achievementCodes 'GRb0aDHM' \
    --limit '5' \
    --offset '90' \
    --sortBy 'contributedValue:desc' \
    --tags 'FILtB181,gE4MC9W0,RmikQeHz' \
    > test.out 2>&1
eval_tap $? 29 'ListUserContributions' test.out

#- 30 ClaimGlobalAchievementReward
./ng net.accelbyte.sdk.cli.Main achievement claimGlobalAchievementReward \
    --achievementCode 'yG1JKmNY' \
    --namespace "$AB_NAMESPACE" \
    --userId 'OCBvQcfG' \
    > test.out 2>&1
eval_tap $? 30 'ClaimGlobalAchievementReward' test.out


rm -f "tmp.dat"

exit $EXIT_CODE