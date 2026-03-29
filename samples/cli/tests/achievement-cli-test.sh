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
    --limit '7' \
    --offset '42' \
    --sortBy 'createdAt:desc' \
    --tags 'KoAuBY8A,b0IMGDmm,zNiqzvTg' \
    > test.out 2>&1
eval_tap $? 2 'AdminListAchievements' test.out

#- 3 AdminCreateNewAchievement
./ng net.accelbyte.sdk.cli.Main achievement adminCreateNewAchievement \
    --namespace "$AB_NAMESPACE" \
    --body '{"achievementCode": "7u4GyT8z", "customAttributes": {"myjiKTuP": {}, "sZjnZoXQ": {}, "vL9ciEEe": {}}, "defaultLanguage": "922gGXgX", "description": {"dHxtyVpl": "qSm5oRcp", "7sgOB6V4": "eg0zDSs2", "9MRCddqZ": "xAZ2Ez0l"}, "global": true, "goalValue": 0.8096183887034425, "hidden": true, "incremental": true, "lockedIcons": [{"slug": "thPb4NiL", "url": "eUjrADlh"}, {"slug": "ajJn4yL3", "url": "RFeiTo5e"}, {"slug": "Gd6l6fTL", "url": "ENmxbCAf"}], "name": {"mqbrMWh9": "6OaC54Bj", "AjVsN6A8": "pOEuyked", "zjuqo5HR": "MavYslPu"}, "statCode": "xuYC57cT", "tags": ["LgDPL1WI", "nswu1iJ0", "DlVQaSRJ"], "unlockedIcons": [{"slug": "PZagXgbe", "url": "gaeQkmex"}, {"slug": "SNhvPdD8", "url": "R9o9jLGU"}, {"slug": "mo7e6QfO", "url": "qfm6XEXs"}]}' \
    > test.out 2>&1
eval_tap $? 3 'AdminCreateNewAchievement' test.out

#- 4 ExportAchievements
./ng net.accelbyte.sdk.cli.Main achievement exportAchievements \
    --namespace "$AB_NAMESPACE" \
    --tags 'J73A6S2T,z87sAEMQ,frT8S6P2' \
    > test.out 2>&1
eval_tap $? 4 'ExportAchievements' test.out

#- 5 ImportAchievements
./ng net.accelbyte.sdk.cli.Main achievement importAchievements \
    --namespace "$AB_NAMESPACE" \
    --file 'tmp.dat' \
    --strategy 'CYEfT6Qh' \
    > test.out 2>&1
eval_tap $? 5 'ImportAchievements' test.out

#- 6 AdminGetAchievement
./ng net.accelbyte.sdk.cli.Main achievement adminGetAchievement \
    --achievementCode 'EZnLS1FW' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 6 'AdminGetAchievement' test.out

#- 7 AdminUpdateAchievement
./ng net.accelbyte.sdk.cli.Main achievement adminUpdateAchievement \
    --achievementCode '5ChN2iyO' \
    --namespace "$AB_NAMESPACE" \
    --body '{"customAttributes": {"m16ULf0D": {}, "megc0KEx": {}, "8uvTr8Ul": {}}, "defaultLanguage": "50vjfdpr", "description": {"cRwD5ScO": "uxZ5GwCl", "ahG5LuHJ": "zWpsYqeh", "h7ZZYnPx": "kGhpdFLG"}, "global": false, "goalValue": 0.8836498127208532, "hidden": false, "incremental": true, "lockedIcons": [{"slug": "5nFxgNhs", "url": "aW5FTcOj"}, {"slug": "04BOkilE", "url": "hFLYVEvw"}, {"slug": "MFn4yrex", "url": "KsHe19aX"}], "name": {"ehVYtfMy": "4lDkELcJ", "2eJEORcr": "sseIwp3h", "sl0iOvD2": "vgXjt6IT"}, "statCode": "0O4eWIl6", "tags": ["woIrkIsV", "8Vqz3pwQ", "5bVx3wKc"], "unlockedIcons": [{"slug": "SuHsjABs", "url": "kXVooTr2"}, {"slug": "Uk9ylSkP", "url": "waXf1vns"}, {"slug": "ngk2rZWn", "url": "0Dgv1Rkz"}]}' \
    > test.out 2>&1
eval_tap $? 7 'AdminUpdateAchievement' test.out

#- 8 AdminDeleteAchievement
./ng net.accelbyte.sdk.cli.Main achievement adminDeleteAchievement \
    --achievementCode 'GN9Yczfx' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 8 'AdminDeleteAchievement' test.out

#- 9 AdminUpdateAchievementListOrder
./ng net.accelbyte.sdk.cli.Main achievement adminUpdateAchievementListOrder \
    --achievementCode 'v13vzVEn' \
    --namespace "$AB_NAMESPACE" \
    --body '{"targetOrder": 100}' \
    > test.out 2>&1
eval_tap $? 9 'AdminUpdateAchievementListOrder' test.out

#- 10 AdminListGlobalAchievements
./ng net.accelbyte.sdk.cli.Main achievement adminListGlobalAchievements \
    --namespace "$AB_NAMESPACE" \
    --achievementCodes 'GJQx6wZT' \
    --limit '46' \
    --offset '45' \
    --sortBy 'achievedAt:asc' \
    --status '1Qqk5Uyk' \
    --tags '9EBxxMEX,2L8u0CtF,3UySXm4M' \
    > test.out 2>&1
eval_tap $? 10 'AdminListGlobalAchievements' test.out

#- 11 AdminListGlobalAchievementContributors
./ng net.accelbyte.sdk.cli.Main achievement adminListGlobalAchievementContributors \
    --achievementCode 'tNeUZwmh' \
    --namespace "$AB_NAMESPACE" \
    --limit '40' \
    --offset '2' \
    --sortBy 'contributedValue:asc' \
    > test.out 2>&1
eval_tap $? 11 'AdminListGlobalAchievementContributors' test.out

#- 12 ResetGlobalAchievement
./ng net.accelbyte.sdk.cli.Main achievement resetGlobalAchievement \
    --achievementCode 'zPUA9TxC' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 12 'ResetGlobalAchievement' test.out

#- 13 BulkCreatePSNEvent
./ng net.accelbyte.sdk.cli.Main achievement bulkCreatePSNEvent \
    --namespace "$AB_NAMESPACE" \
    --body '{"data": [{"events": [{"dateTime": "kwqudZyb", "eventData": {"eventName": "CCBGi4ze", "properties": {"AuKpLE9P": {}, "xoZEKhcm": {}, "qwCcIVz9": {}}}, "eventId": "G5ivCZ5N", "version": "dxgxYJEu"}, {"dateTime": "kvUjbsl0", "eventData": {"eventName": "3toOazmM", "properties": {"mSpBcc9g": {}, "rtYDLh1c": {}, "Yee8qzas": {}}}, "eventId": "v1dj3Rvt", "version": "RnF481ex"}, {"dateTime": "ibmnTOGf", "eventData": {"eventName": "l6iALyVn", "properties": {"IqJxUB2e": {}, "Y7hRJwVd": {}, "Ech7RCaH": {}}}, "eventId": "VsLGtD9t", "version": "3uZyWub6"}], "thirdPartyUserId": "OOUaHQP4", "userId": "Jj2LAA6F"}, {"events": [{"dateTime": "3c7CMt8c", "eventData": {"eventName": "bA1bh7pQ", "properties": {"ZcGSwNof": {}, "TRmEZR13": {}, "Fhe76g0C": {}}}, "eventId": "24a3BKl3", "version": "lmTnppeZ"}, {"dateTime": "3v2cYHMy", "eventData": {"eventName": "PgrwPbBW", "properties": {"znqRywmZ": {}, "i4m4iq8M": {}, "jpE4T03T": {}}}, "eventId": "DlhDR3k3", "version": "f3hvX9Gj"}, {"dateTime": "mmBVxr9i", "eventData": {"eventName": "zY0PcDtB", "properties": {"iaUQgeAN": {}, "P9oNGsF0": {}, "N6ZXDpgu": {}}}, "eventId": "keTHyWh8", "version": "QOCEFlyU"}], "thirdPartyUserId": "n13LOTkO", "userId": "LE0JnIbV"}, {"events": [{"dateTime": "I9iPuXpu", "eventData": {"eventName": "3FzC5lIr", "properties": {"3x0QjoxQ": {}, "u3RyIQXP": {}, "cwVYHv7x": {}}}, "eventId": "yWz8QtFA", "version": "VFx9uWVu"}, {"dateTime": "souW45Fd", "eventData": {"eventName": "rD2hijHU", "properties": {"FyAtPueZ": {}, "UFTXtcDh": {}, "0aqH8Oz4": {}}}, "eventId": "xTg3KKCm", "version": "cnYN136l"}, {"dateTime": "XwqrYGhS", "eventData": {"eventName": "BrVcPSCT", "properties": {"zLnfQNOz": {}, "eRDHF4dS": {}, "52PmSaUO": {}}}, "eventId": "OTw2xZZ3", "version": "gVkan1wj"}], "thirdPartyUserId": "MskSBQrr", "userId": "hbLO7asx"}]}' \
    > test.out 2>&1
eval_tap $? 13 'BulkCreatePSNEvent' test.out

#- 14 AdminListTags
./ng net.accelbyte.sdk.cli.Main achievement adminListTags \
    --namespace "$AB_NAMESPACE" \
    --limit '92' \
    --name 'DadZ6gIm' \
    --offset '60' \
    --sortBy 'createdAt' \
    > test.out 2>&1
eval_tap $? 14 'AdminListTags' test.out

#- 15 AdminListUserAchievements
./ng net.accelbyte.sdk.cli.Main achievement adminListUserAchievements \
    --namespace "$AB_NAMESPACE" \
    --userId 'yq1qc4et' \
    --limit '26' \
    --offset '83' \
    --preferUnlocked  \
    --sortBy 'achievedAt:asc' \
    --tags 'zaIrZdg0,iC6toDoL,PY3Glf8s' \
    > test.out 2>&1
eval_tap $? 15 'AdminListUserAchievements' test.out

#- 16 AdminBulkUnlockAchievement
./ng net.accelbyte.sdk.cli.Main achievement adminBulkUnlockAchievement \
    --namespace "$AB_NAMESPACE" \
    --userId 'lxowP1mP' \
    --body '{"achievementCodes": ["nP4xeO3o", "DUKNROqD", "nR0ryDTt"]}' \
    > test.out 2>&1
eval_tap $? 16 'AdminBulkUnlockAchievement' test.out

#- 17 AdminResetAchievement
./ng net.accelbyte.sdk.cli.Main achievement adminResetAchievement \
    --achievementCode 'lGf8e6KH' \
    --namespace "$AB_NAMESPACE" \
    --userId '2MMr89Eb' \
    > test.out 2>&1
eval_tap $? 17 'AdminResetAchievement' test.out

#- 18 AdminUnlockAchievement
./ng net.accelbyte.sdk.cli.Main achievement adminUnlockAchievement \
    --achievementCode 'K9vOQPps' \
    --namespace "$AB_NAMESPACE" \
    --userId '5ueeSKeV' \
    > test.out 2>&1
eval_tap $? 18 'AdminUnlockAchievement' test.out

#- 19 AdminAnonymizeUserAchievement
./ng net.accelbyte.sdk.cli.Main achievement adminAnonymizeUserAchievement \
    --namespace "$AB_NAMESPACE" \
    --userId 'AB4WmJLm' \
    > test.out 2>&1
eval_tap $? 19 'AdminAnonymizeUserAchievement' test.out

#- 20 AdminListUserContributions
./ng net.accelbyte.sdk.cli.Main achievement adminListUserContributions \
    --namespace "$AB_NAMESPACE" \
    --userId '7m7NjiHo' \
    --achievementCodes 'RVrnnUcC' \
    --limit '45' \
    --offset '90' \
    --sortBy 'contributedValue:asc' \
    --tags '3FsvQwN2,9v0M1eIz,yorshZyQ' \
    > test.out 2>&1
eval_tap $? 20 'AdminListUserContributions' test.out

#- 21 PublicListAchievements
./ng net.accelbyte.sdk.cli.Main achievement publicListAchievements \
    --namespace "$AB_NAMESPACE" \
    --global  \
    --limit '13' \
    --offset '22' \
    --sortBy 'createdAt' \
    --tags 'GTKpfHWp,oB3mCAsr,Jfgrl8ef' \
    --language 'S8jpMQzw' \
    > test.out 2>&1
eval_tap $? 21 'PublicListAchievements' test.out

#- 22 PublicGetAchievement
./ng net.accelbyte.sdk.cli.Main achievement publicGetAchievement \
    --achievementCode 'xwYcfysd' \
    --namespace "$AB_NAMESPACE" \
    --language 'zgPMGi4Q' \
    > test.out 2>&1
eval_tap $? 22 'PublicGetAchievement' test.out

#- 23 PublicListGlobalAchievements
./ng net.accelbyte.sdk.cli.Main achievement publicListGlobalAchievements \
    --namespace "$AB_NAMESPACE" \
    --achievementCodes 'YZLSJDSx' \
    --limit '69' \
    --offset '6' \
    --sortBy 'createdAt:desc' \
    --status 'DQctGcyf' \
    --tags '6twpBpDE,0xYSfgF3,gYg4rGs4' \
    > test.out 2>&1
eval_tap $? 23 'PublicListGlobalAchievements' test.out

#- 24 ListGlobalAchievementContributors
./ng net.accelbyte.sdk.cli.Main achievement listGlobalAchievementContributors \
    --achievementCode 'vuDbb5yj' \
    --namespace "$AB_NAMESPACE" \
    --limit '54' \
    --offset '37' \
    --sortBy 'contributedValue' \
    > test.out 2>&1
eval_tap $? 24 'ListGlobalAchievementContributors' test.out

#- 25 PublicListTags
./ng net.accelbyte.sdk.cli.Main achievement publicListTags \
    --namespace "$AB_NAMESPACE" \
    --limit '60' \
    --name '8mwNO3eG' \
    --offset '9' \
    --sortBy 'name:asc' \
    > test.out 2>&1
eval_tap $? 25 'PublicListTags' test.out

#- 26 PublicListUserAchievements
./ng net.accelbyte.sdk.cli.Main achievement publicListUserAchievements \
    --namespace "$AB_NAMESPACE" \
    --userId 'ORtngkeL' \
    --limit '46' \
    --offset '13' \
    --preferUnlocked  \
    --sortBy 'createdAt:desc' \
    --tags 'A8q0PY3V,tPfjouCS,wdvck5pb' \
    > test.out 2>&1
eval_tap $? 26 'PublicListUserAchievements' test.out

#- 27 PublicBulkUnlockAchievement
./ng net.accelbyte.sdk.cli.Main achievement publicBulkUnlockAchievement \
    --namespace "$AB_NAMESPACE" \
    --userId '3sI44HGF' \
    --body '{"achievementCodes": ["1pH9pqaH", "7epgvA8z", "nk2LAObU"]}' \
    > test.out 2>&1
eval_tap $? 27 'PublicBulkUnlockAchievement' test.out

#- 28 PublicUnlockAchievement
./ng net.accelbyte.sdk.cli.Main achievement publicUnlockAchievement \
    --achievementCode '5gm2z2qp' \
    --namespace "$AB_NAMESPACE" \
    --userId 'JMTNi42e' \
    > test.out 2>&1
eval_tap $? 28 'PublicUnlockAchievement' test.out

#- 29 ListUserContributions
./ng net.accelbyte.sdk.cli.Main achievement listUserContributions \
    --namespace "$AB_NAMESPACE" \
    --userId 'NQFDCWUw' \
    --achievementCodes 'ucHxh750' \
    --limit '48' \
    --offset '100' \
    --sortBy 'contributedValue:desc' \
    --tags 'fLQie6Ht,mEGYZDJr,WsOyVE7E' \
    > test.out 2>&1
eval_tap $? 29 'ListUserContributions' test.out

#- 30 ClaimGlobalAchievementReward
./ng net.accelbyte.sdk.cli.Main achievement claimGlobalAchievementReward \
    --achievementCode '0L9c38HO' \
    --namespace "$AB_NAMESPACE" \
    --userId 'fCB856VC' \
    > test.out 2>&1
eval_tap $? 30 'ClaimGlobalAchievementReward' test.out


rm -f "tmp.dat"

exit $EXIT_CODE