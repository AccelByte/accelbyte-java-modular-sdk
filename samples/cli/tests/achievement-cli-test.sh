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
echo "1..28"

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
    --limit '73' \
    --offset '16' \
    --sortBy 'updatedAt:asc' \
    --tags 'J03I3WuV,yTRIL4y9,odC2MGqv' \
    > test.out 2>&1
eval_tap $? 2 'AdminListAchievements' test.out

#- 3 AdminCreateNewAchievement
./ng net.accelbyte.sdk.cli.Main achievement adminCreateNewAchievement \
    --namespace "$AB_NAMESPACE" \
    --body '{"achievementCode": "XY92KtcX", "customAttributes": {"IisZ1Uav": {}, "oIMimbkn": {}, "qB8qcqP9": {}}, "defaultLanguage": "JFzE0BPr", "description": {"p6ZaTCYE": "2g9Hw1eV", "eHpS9xAY": "LvwBo7cH", "pgJ4C7wd": "hfz3UiOg"}, "global": false, "goalValue": 0.7794328441375099, "hidden": false, "incremental": true, "lockedIcons": [{"slug": "YeL8Vb0T", "url": "Uc5A3Akw"}, {"slug": "4PvxBPpR", "url": "Pbb3N6vg"}, {"slug": "NkjIPKRp", "url": "SZnuMDBs"}], "name": {"K7VLtU21": "X4lsGOKD", "nEQa9WO6": "d71zs7rv", "hG48LuH9": "37IOb4s4"}, "statCode": "fJqXiFbS", "tags": ["fDac3vlh", "7hdLKSJt", "5WiFiGA7"], "unlockedIcons": [{"slug": "054NdDCN", "url": "2lj8DzBZ"}, {"slug": "oZuVbka9", "url": "ar7Eudh1"}, {"slug": "bgv0Mich", "url": "hvjoommp"}]}' \
    > test.out 2>&1
eval_tap $? 3 'AdminCreateNewAchievement' test.out

#- 4 ExportAchievements
./ng net.accelbyte.sdk.cli.Main achievement exportAchievements \
    --namespace "$AB_NAMESPACE" \
    --tags 'eubBysKA,r7jqB2PL,Fvq86T2Y' \
    > test.out 2>&1
eval_tap $? 4 'ExportAchievements' test.out

#- 5 ImportAchievements
./ng net.accelbyte.sdk.cli.Main achievement importAchievements \
    --namespace "$AB_NAMESPACE" \
    --file 'tmp.dat' \
    --strategy '0Not6GdX' \
    > test.out 2>&1
eval_tap $? 5 'ImportAchievements' test.out

#- 6 AdminGetAchievement
./ng net.accelbyte.sdk.cli.Main achievement adminGetAchievement \
    --achievementCode 'pCHOkdWC' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 6 'AdminGetAchievement' test.out

#- 7 AdminUpdateAchievement
./ng net.accelbyte.sdk.cli.Main achievement adminUpdateAchievement \
    --achievementCode 'wDHmQPzv' \
    --namespace "$AB_NAMESPACE" \
    --body '{"customAttributes": {"gieiWhQb": {}, "lfX9H0fG": {}, "7YJHPYcf": {}}, "defaultLanguage": "MwOANSOr", "description": {"Cximdxlo": "kj8NP4hB", "KgUAlnwE": "3qk1p8RW", "Bnuf3TYC": "4B7OZJgK"}, "global": false, "goalValue": 0.6913552364069437, "hidden": true, "incremental": false, "lockedIcons": [{"slug": "th1L6ltE", "url": "XIMyFeUy"}, {"slug": "0FguZfjw", "url": "2Fy33wGy"}, {"slug": "MoJkO15L", "url": "YklQKFC3"}], "name": {"S1gOwJtO": "6ChSI9fS", "NMAzFa8i": "0Ce2T1GH", "dAghBH1I": "4pbf9fe7"}, "statCode": "VAOxuM9E", "tags": ["kY6lLwqZ", "7hqI2uAp", "Fzoo2uLz"], "unlockedIcons": [{"slug": "pGtXJQW1", "url": "hF7O1mDD"}, {"slug": "2M26QjvD", "url": "AZDIuq1I"}, {"slug": "097Evv8c", "url": "SCfdLI4O"}]}' \
    > test.out 2>&1
eval_tap $? 7 'AdminUpdateAchievement' test.out

#- 8 AdminDeleteAchievement
./ng net.accelbyte.sdk.cli.Main achievement adminDeleteAchievement \
    --achievementCode 'UltYpMXU' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 8 'AdminDeleteAchievement' test.out

#- 9 AdminUpdateAchievementListOrder
./ng net.accelbyte.sdk.cli.Main achievement adminUpdateAchievementListOrder \
    --achievementCode 'KVF5rq7w' \
    --namespace "$AB_NAMESPACE" \
    --body '{"targetOrder": 66}' \
    > test.out 2>&1
eval_tap $? 9 'AdminUpdateAchievementListOrder' test.out

#- 10 AdminListGlobalAchievements
./ng net.accelbyte.sdk.cli.Main achievement adminListGlobalAchievements \
    --namespace "$AB_NAMESPACE" \
    --achievementCodes 'FPA6a3Vc' \
    --limit '48' \
    --offset '4' \
    --sortBy 'YtpKIGa1' \
    --status 'ZFk6yflF' \
    --tags 'AbQEsHWY,yzPiBPV9,53Jqs0pf' \
    > test.out 2>&1
eval_tap $? 10 'AdminListGlobalAchievements' test.out

#- 11 AdminListGlobalAchievementContributors
./ng net.accelbyte.sdk.cli.Main achievement adminListGlobalAchievementContributors \
    --achievementCode 'QEAUrgqj' \
    --namespace "$AB_NAMESPACE" \
    --limit '88' \
    --offset '98' \
    --sortBy 'pF2CrN4L' \
    > test.out 2>&1
eval_tap $? 11 'AdminListGlobalAchievementContributors' test.out

#- 12 ResetGlobalAchievement
./ng net.accelbyte.sdk.cli.Main achievement resetGlobalAchievement \
    --achievementCode '7hf4GIf7' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 12 'ResetGlobalAchievement' test.out

#- 13 BulkCreatePSNEvent
./ng net.accelbyte.sdk.cli.Main achievement bulkCreatePSNEvent \
    --namespace "$AB_NAMESPACE" \
    --body '{"data": [{"events": [{"dateTime": "2HUflWnK", "eventData": {"eventName": "IjRNjbpQ", "properties": {"fMYb1ylK": {}, "CxrlfOhu": {}, "kBo8VFUX": {}}}, "eventId": "VNnydY5t", "version": "NR2uhuuC"}, {"dateTime": "WsERH35l", "eventData": {"eventName": "fRV6C49M", "properties": {"RSGUhOz6": {}, "V8Q9Qpig": {}, "klhNE6eG": {}}}, "eventId": "D1ZMVmLv", "version": "OKtjjuXF"}, {"dateTime": "NokWIhlW", "eventData": {"eventName": "ksGLXEE8", "properties": {"WrShXCFS": {}, "gToenSIy": {}, "f8iSxRTb": {}}}, "eventId": "w7TNvuTG", "version": "Dx3IKArH"}], "thirdPartyUserId": "xpfSrVpb", "userId": "b42hVaWs"}, {"events": [{"dateTime": "B4n5QNB1", "eventData": {"eventName": "7fYG56EK", "properties": {"kkxOVIAK": {}, "qMCZQA41": {}, "giJrRho5": {}}}, "eventId": "ehXiYJJM", "version": "2atIJ295"}, {"dateTime": "O6VZPzhD", "eventData": {"eventName": "JyS1oLx3", "properties": {"VeAlAtDl": {}, "JMMJk481": {}, "wy2jASvZ": {}}}, "eventId": "IpPDqbNo", "version": "rfJd2AcX"}, {"dateTime": "AUOdiXeg", "eventData": {"eventName": "PNL3GNKV", "properties": {"P3BUBRWo": {}, "2MnGjVKX": {}, "BTcAgH5W": {}}}, "eventId": "FhMHpFvO", "version": "Vc46WjBD"}], "thirdPartyUserId": "X8DrMDHm", "userId": "1DdTK4jv"}, {"events": [{"dateTime": "a84P9eHD", "eventData": {"eventName": "PokrhcO2", "properties": {"MEQoKbDP": {}, "3IIZ47Gt": {}, "cykdTuQA": {}}}, "eventId": "qybbyrjR", "version": "gBKkAQFH"}, {"dateTime": "H5OCSTFU", "eventData": {"eventName": "UKAe8139", "properties": {"4OUr7udv": {}, "WzD7qi6m": {}, "PnVIk79C": {}}}, "eventId": "rYOYFVh8", "version": "BdDG4jo6"}, {"dateTime": "wWsSwlQB", "eventData": {"eventName": "IBHPHlPB", "properties": {"6X9tGVq6": {}, "ml9P6Kw4": {}, "jBPO3mcG": {}}}, "eventId": "wufSdQBh", "version": "7LUNd00n"}], "thirdPartyUserId": "DkihAWld", "userId": "LhTHXtIa"}]}' \
    > test.out 2>&1
eval_tap $? 13 'BulkCreatePSNEvent' test.out

#- 14 AdminListTags
./ng net.accelbyte.sdk.cli.Main achievement adminListTags \
    --namespace "$AB_NAMESPACE" \
    --limit '75' \
    --name 'dPnae64U' \
    --offset '6' \
    --sortBy 'SeR1Or1z' \
    > test.out 2>&1
eval_tap $? 14 'AdminListTags' test.out

#- 15 AdminListUserAchievements
./ng net.accelbyte.sdk.cli.Main achievement adminListUserAchievements \
    --namespace "$AB_NAMESPACE" \
    --userId 'tX8mQjy3' \
    --limit '64' \
    --offset '29' \
    --preferUnlocked  \
    --sortBy 'vVVZyNbw' \
    --tags 'T5399XvJ,e1yLyWE6,l0rVtLNO' \
    > test.out 2>&1
eval_tap $? 15 'AdminListUserAchievements' test.out

#- 16 AdminResetAchievement
./ng net.accelbyte.sdk.cli.Main achievement adminResetAchievement \
    --achievementCode 'OkMRkpBI' \
    --namespace "$AB_NAMESPACE" \
    --userId 'SAiTMKyg' \
    > test.out 2>&1
eval_tap $? 16 'AdminResetAchievement' test.out

#- 17 AdminUnlockAchievement
./ng net.accelbyte.sdk.cli.Main achievement adminUnlockAchievement \
    --achievementCode 'NltNGvFj' \
    --namespace "$AB_NAMESPACE" \
    --userId 'LJ9ZY9Tq' \
    > test.out 2>&1
eval_tap $? 17 'AdminUnlockAchievement' test.out

#- 18 AdminAnonymizeUserAchievement
./ng net.accelbyte.sdk.cli.Main achievement adminAnonymizeUserAchievement \
    --namespace "$AB_NAMESPACE" \
    --userId 'vgEVp3PQ' \
    > test.out 2>&1
eval_tap $? 18 'AdminAnonymizeUserAchievement' test.out

#- 19 AdminListUserContributions
./ng net.accelbyte.sdk.cli.Main achievement adminListUserContributions \
    --namespace "$AB_NAMESPACE" \
    --userId '9VtrZnMu' \
    --achievementCodes 'ys3OPI6g' \
    --limit '16' \
    --offset '26' \
    --sortBy 'tk1Lndx1' \
    --tags 'Su22TzMm,8P2ba9V6,D5Wwwj00' \
    > test.out 2>&1
eval_tap $? 19 'AdminListUserContributions' test.out

#- 20 PublicListAchievements
./ng net.accelbyte.sdk.cli.Main achievement publicListAchievements \
    --namespace "$AB_NAMESPACE" \
    --global  \
    --limit '92' \
    --offset '93' \
    --sortBy 'listOrder' \
    --tags 'FXqQjIGG,V4cnZhMm,ywqbXy4y' \
    --language 'xqftbd94' \
    > test.out 2>&1
eval_tap $? 20 'PublicListAchievements' test.out

#- 21 PublicGetAchievement
./ng net.accelbyte.sdk.cli.Main achievement publicGetAchievement \
    --achievementCode '8ToO7C1g' \
    --namespace "$AB_NAMESPACE" \
    --language 'C1JGY2Yc' \
    > test.out 2>&1
eval_tap $? 21 'PublicGetAchievement' test.out

#- 22 PublicListGlobalAchievements
./ng net.accelbyte.sdk.cli.Main achievement publicListGlobalAchievements \
    --namespace "$AB_NAMESPACE" \
    --achievementCodes '4cF01zOG' \
    --limit '35' \
    --offset '52' \
    --sortBy 'LgLeuBHr' \
    --status 'X99kSM8C' \
    --tags 'hOkaLZuI,DliLP0WL,xz70bxqg' \
    > test.out 2>&1
eval_tap $? 22 'PublicListGlobalAchievements' test.out

#- 23 ListGlobalAchievementContributors
./ng net.accelbyte.sdk.cli.Main achievement listGlobalAchievementContributors \
    --achievementCode 'E7EPw869' \
    --namespace "$AB_NAMESPACE" \
    --limit '20' \
    --offset '8' \
    --sortBy 'TjskClTs' \
    > test.out 2>&1
eval_tap $? 23 'ListGlobalAchievementContributors' test.out

#- 24 PublicListTags
./ng net.accelbyte.sdk.cli.Main achievement publicListTags \
    --namespace "$AB_NAMESPACE" \
    --limit '7' \
    --name 'kvyVGRdc' \
    --offset '81' \
    --sortBy 'sbRLmSwG' \
    > test.out 2>&1
eval_tap $? 24 'PublicListTags' test.out

#- 25 PublicListUserAchievements
./ng net.accelbyte.sdk.cli.Main achievement publicListUserAchievements \
    --namespace "$AB_NAMESPACE" \
    --userId 'lL93xNLR' \
    --limit '33' \
    --offset '20' \
    --preferUnlocked  \
    --sortBy 'sGBy62CG' \
    --tags '3IR5OId2,FCZfArxO,duJXSWph' \
    > test.out 2>&1
eval_tap $? 25 'PublicListUserAchievements' test.out

#- 26 PublicUnlockAchievement
./ng net.accelbyte.sdk.cli.Main achievement publicUnlockAchievement \
    --achievementCode 'xf9NLdtc' \
    --namespace "$AB_NAMESPACE" \
    --userId 'HoBrKwyq' \
    > test.out 2>&1
eval_tap $? 26 'PublicUnlockAchievement' test.out

#- 27 ListUserContributions
./ng net.accelbyte.sdk.cli.Main achievement listUserContributions \
    --namespace "$AB_NAMESPACE" \
    --userId 'skd6Ctgj' \
    --achievementCodes 'dUpidH4P' \
    --limit '16' \
    --offset '21' \
    --sortBy 'jzEBPiNp' \
    --tags 'aVX5ziWG,dQV9OUgg,9PYN2yhs' \
    > test.out 2>&1
eval_tap $? 27 'ListUserContributions' test.out

#- 28 ClaimGlobalAchievementReward
./ng net.accelbyte.sdk.cli.Main achievement claimGlobalAchievementReward \
    --achievementCode 'CkP4aw6Y' \
    --namespace "$AB_NAMESPACE" \
    --userId 'pI15jSAO' \
    > test.out 2>&1
eval_tap $? 28 'ClaimGlobalAchievementReward' test.out


rm -f "tmp.dat"

exit $EXIT_CODE