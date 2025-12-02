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
    --limit '68' \
    --offset '85' \
    --sortBy 'listOrder' \
    --tags 'xzUWjOa7,5V7JXP7M,snZWYsXO' \
    > test.out 2>&1
eval_tap $? 2 'AdminListAchievements' test.out

#- 3 AdminCreateNewAchievement
./ng net.accelbyte.sdk.cli.Main achievement adminCreateNewAchievement \
    --namespace "$AB_NAMESPACE" \
    --body '{"achievementCode": "4x1OODtw", "customAttributes": {"Zl5qi7Ga": {}, "Xraap6B6": {}, "1bnmmqlf": {}}, "defaultLanguage": "B5bcjyT2", "description": {"HbY4gwDv": "ihBCSXEp", "XIO1Svyy": "Oeh6kL0L", "WRJnOTpx": "h9E9aJpN"}, "global": true, "goalValue": 0.317361588504558, "hidden": false, "incremental": false, "lockedIcons": [{"slug": "HGqfaHlI", "url": "AsaPksnn"}, {"slug": "puwdVoO2", "url": "c5yc8Bji"}, {"slug": "IYZc1xv5", "url": "UxzDG06G"}], "name": {"c68385Sm": "OlXPdaxA", "Bbdoefy1": "0EOlTrv3", "npwRndTo": "zY77wWXj"}, "statCode": "e5ds9JjP", "tags": ["nSVdyFrb", "5V0V1cuB", "piAuIBBv"], "unlockedIcons": [{"slug": "OFD1Js3L", "url": "RULAHZkt"}, {"slug": "Zy10rylV", "url": "ql0DGNM8"}, {"slug": "UVQnp4jO", "url": "RaGUwQP3"}]}' \
    > test.out 2>&1
eval_tap $? 3 'AdminCreateNewAchievement' test.out

#- 4 ExportAchievements
./ng net.accelbyte.sdk.cli.Main achievement exportAchievements \
    --namespace "$AB_NAMESPACE" \
    --tags 'InQk1qtL,VXasbM0r,jGshlgkf' \
    > test.out 2>&1
eval_tap $? 4 'ExportAchievements' test.out

#- 5 ImportAchievements
./ng net.accelbyte.sdk.cli.Main achievement importAchievements \
    --namespace "$AB_NAMESPACE" \
    --file 'tmp.dat' \
    --strategy 'EQeLoq2d' \
    > test.out 2>&1
eval_tap $? 5 'ImportAchievements' test.out

#- 6 AdminGetAchievement
./ng net.accelbyte.sdk.cli.Main achievement adminGetAchievement \
    --achievementCode 'IzurH76n' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 6 'AdminGetAchievement' test.out

#- 7 AdminUpdateAchievement
./ng net.accelbyte.sdk.cli.Main achievement adminUpdateAchievement \
    --achievementCode 'hWWfeoz4' \
    --namespace "$AB_NAMESPACE" \
    --body '{"customAttributes": {"t2DlsQba": {}, "UGbvomZd": {}, "iBMGOzKJ": {}}, "defaultLanguage": "eBIEjNX6", "description": {"pQfyk53I": "7Sh3OtIw", "4JsYfXp0": "3bJz9CF9", "nqZNomIP": "qohWD3fp"}, "global": false, "goalValue": 0.3719948596964502, "hidden": true, "incremental": true, "lockedIcons": [{"slug": "dEhJ7Ej6", "url": "Ft2zhs1n"}, {"slug": "xWK1dQ6c", "url": "MqrgamEZ"}, {"slug": "r4FB5fYH", "url": "bvep3aNz"}], "name": {"AHv5UUjo": "GhajswJ0", "uI6rwYfV": "XipOXRIU", "wvsJD6cM": "YZfPNmpr"}, "statCode": "iMRzYKzh", "tags": ["agocYE4i", "v1DFWsq7", "QlIOLBiV"], "unlockedIcons": [{"slug": "DXynsvlX", "url": "6lLjDors"}, {"slug": "oK2how63", "url": "5O7kOBSz"}, {"slug": "8gTeh7xf", "url": "EXlq6P2Y"}]}' \
    > test.out 2>&1
eval_tap $? 7 'AdminUpdateAchievement' test.out

#- 8 AdminDeleteAchievement
./ng net.accelbyte.sdk.cli.Main achievement adminDeleteAchievement \
    --achievementCode 'ExL1ifyW' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 8 'AdminDeleteAchievement' test.out

#- 9 AdminUpdateAchievementListOrder
./ng net.accelbyte.sdk.cli.Main achievement adminUpdateAchievementListOrder \
    --achievementCode 'hpm5XuHS' \
    --namespace "$AB_NAMESPACE" \
    --body '{"targetOrder": 51}' \
    > test.out 2>&1
eval_tap $? 9 'AdminUpdateAchievementListOrder' test.out

#- 10 AdminListGlobalAchievements
./ng net.accelbyte.sdk.cli.Main achievement adminListGlobalAchievements \
    --namespace "$AB_NAMESPACE" \
    --achievementCodes 'U9fGMOdy' \
    --limit '57' \
    --offset '86' \
    --sortBy 'achievedAt' \
    --status '1Ser1PkO' \
    --tags 'MI1J4r0O,FlPFD1wI,fechPv9E' \
    > test.out 2>&1
eval_tap $? 10 'AdminListGlobalAchievements' test.out

#- 11 AdminListGlobalAchievementContributors
./ng net.accelbyte.sdk.cli.Main achievement adminListGlobalAchievementContributors \
    --achievementCode 'Oyu8Zem8' \
    --namespace "$AB_NAMESPACE" \
    --limit '12' \
    --offset '66' \
    --sortBy 'contributedValue' \
    > test.out 2>&1
eval_tap $? 11 'AdminListGlobalAchievementContributors' test.out

#- 12 ResetGlobalAchievement
./ng net.accelbyte.sdk.cli.Main achievement resetGlobalAchievement \
    --achievementCode 'V6pS10vq' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 12 'ResetGlobalAchievement' test.out

#- 13 BulkCreatePSNEvent
./ng net.accelbyte.sdk.cli.Main achievement bulkCreatePSNEvent \
    --namespace "$AB_NAMESPACE" \
    --body '{"data": [{"events": [{"dateTime": "X6yiC8nk", "eventData": {"eventName": "FtFuhxZu", "properties": {"gnmwCu4a": {}, "WUVUZx4X": {}, "l5Xn8GQt": {}}}, "eventId": "CfPAT73g", "version": "zHpBxAZ1"}, {"dateTime": "eqWlztyg", "eventData": {"eventName": "RGacOi9A", "properties": {"Q6JuvrP6": {}, "ur5UNbEi": {}, "0SZXQhjW": {}}}, "eventId": "E8Wlo35M", "version": "cpeAfUeF"}, {"dateTime": "KqVTbLTc", "eventData": {"eventName": "bUCRxm4A", "properties": {"xBA0A4kP": {}, "r8kRauVB": {}, "qowKckT7": {}}}, "eventId": "dMSA1ljj", "version": "kUSdpf49"}], "thirdPartyUserId": "eot04MmA", "userId": "8bmrPRCM"}, {"events": [{"dateTime": "xW1xjS5B", "eventData": {"eventName": "fK0bxiZm", "properties": {"OOEM2l8Q": {}, "tUXe7SSy": {}, "erpJnEF7": {}}}, "eventId": "jyKVBUnC", "version": "hyWSTWmY"}, {"dateTime": "MuXVE29k", "eventData": {"eventName": "jON23kph", "properties": {"fFXz4I47": {}, "zYECLMnm": {}, "GOUxeeJR": {}}}, "eventId": "Bfz0M3a1", "version": "iI5Luo6p"}, {"dateTime": "iP28bT9K", "eventData": {"eventName": "KayWn3EX", "properties": {"xymC92M1": {}, "7BAcUMIe": {}, "kYjIdmVw": {}}}, "eventId": "WRKjqABF", "version": "kM1qZJhO"}], "thirdPartyUserId": "lNB7XgYI", "userId": "jAc58h9g"}, {"events": [{"dateTime": "kaF9aT03", "eventData": {"eventName": "xraOACQt", "properties": {"UKugZ0Is": {}, "0Rqkn1kN": {}, "Zej238gs": {}}}, "eventId": "fYSVbOZF", "version": "Bg83AeCZ"}, {"dateTime": "RrMgqD0u", "eventData": {"eventName": "mEdvJXkX", "properties": {"65ZQEHv8": {}, "U8jerKaE": {}, "w1qiUEAN": {}}}, "eventId": "GMiri7eR", "version": "unfmvbKk"}, {"dateTime": "DTHpuEH2", "eventData": {"eventName": "FYOXxZvG", "properties": {"aWz6L6Ub": {}, "Lpr5GTGU": {}, "JsHxJXsB": {}}}, "eventId": "9aRCDvJf", "version": "uHlzDHQi"}], "thirdPartyUserId": "OxbQorSc", "userId": "NpHEYRg4"}]}' \
    > test.out 2>&1
eval_tap $? 13 'BulkCreatePSNEvent' test.out

#- 14 AdminListTags
./ng net.accelbyte.sdk.cli.Main achievement adminListTags \
    --namespace "$AB_NAMESPACE" \
    --limit '75' \
    --name '3xY3j1ri' \
    --offset '75' \
    --sortBy 'name:desc' \
    > test.out 2>&1
eval_tap $? 14 'AdminListTags' test.out

#- 15 AdminListUserAchievements
./ng net.accelbyte.sdk.cli.Main achievement adminListUserAchievements \
    --namespace "$AB_NAMESPACE" \
    --userId 'jiHCl8xC' \
    --limit '17' \
    --offset '7' \
    --preferUnlocked  \
    --sortBy 'achievedAt' \
    --tags '4fpaJa4u,2YSIYqCx,aqN48UCB' \
    > test.out 2>&1
eval_tap $? 15 'AdminListUserAchievements' test.out

#- 16 AdminBulkUnlockAchievement
./ng net.accelbyte.sdk.cli.Main achievement adminBulkUnlockAchievement \
    --namespace "$AB_NAMESPACE" \
    --userId 'oqOO0cwC' \
    --body '{"achievementCodes": ["fTD8PMtz", "fkMzqkD5", "IduypsJf"]}' \
    > test.out 2>&1
eval_tap $? 16 'AdminBulkUnlockAchievement' test.out

#- 17 AdminResetAchievement
./ng net.accelbyte.sdk.cli.Main achievement adminResetAchievement \
    --achievementCode 'p1ELfTaM' \
    --namespace "$AB_NAMESPACE" \
    --userId 'h63zsSvm' \
    > test.out 2>&1
eval_tap $? 17 'AdminResetAchievement' test.out

#- 18 AdminUnlockAchievement
./ng net.accelbyte.sdk.cli.Main achievement adminUnlockAchievement \
    --achievementCode 'xXWgF9XG' \
    --namespace "$AB_NAMESPACE" \
    --userId 't9jSA53I' \
    > test.out 2>&1
eval_tap $? 18 'AdminUnlockAchievement' test.out

#- 19 AdminAnonymizeUserAchievement
./ng net.accelbyte.sdk.cli.Main achievement adminAnonymizeUserAchievement \
    --namespace "$AB_NAMESPACE" \
    --userId 'jWl45HAE' \
    > test.out 2>&1
eval_tap $? 19 'AdminAnonymizeUserAchievement' test.out

#- 20 AdminListUserContributions
./ng net.accelbyte.sdk.cli.Main achievement adminListUserContributions \
    --namespace "$AB_NAMESPACE" \
    --userId 'ymuqPTia' \
    --achievementCodes 'XmjYF769' \
    --limit '11' \
    --offset '51' \
    --sortBy 'contributedValue:desc' \
    --tags 'hTVkNzhm,PsvtaWHY,jUDV6OLX' \
    > test.out 2>&1
eval_tap $? 20 'AdminListUserContributions' test.out

#- 21 PublicListAchievements
./ng net.accelbyte.sdk.cli.Main achievement publicListAchievements \
    --namespace "$AB_NAMESPACE" \
    --global  \
    --limit '92' \
    --offset '17' \
    --sortBy 'createdAt:desc' \
    --tags '0dCP7vcA,SUTXrDDc,ga8Ch2x9' \
    --language 'hRsDGtri' \
    > test.out 2>&1
eval_tap $? 21 'PublicListAchievements' test.out

#- 22 PublicGetAchievement
./ng net.accelbyte.sdk.cli.Main achievement publicGetAchievement \
    --achievementCode 'frUNPt5B' \
    --namespace "$AB_NAMESPACE" \
    --language 'Ou5Rp4bm' \
    > test.out 2>&1
eval_tap $? 22 'PublicGetAchievement' test.out

#- 23 PublicListGlobalAchievements
./ng net.accelbyte.sdk.cli.Main achievement publicListGlobalAchievements \
    --namespace "$AB_NAMESPACE" \
    --achievementCodes '9MVe4twh' \
    --limit '79' \
    --offset '24' \
    --sortBy 'achievedAt:asc' \
    --status 'X68duPhS' \
    --tags '2kzweMMs,7FWzh9YA,bTfdgFy8' \
    > test.out 2>&1
eval_tap $? 23 'PublicListGlobalAchievements' test.out

#- 24 ListGlobalAchievementContributors
./ng net.accelbyte.sdk.cli.Main achievement listGlobalAchievementContributors \
    --achievementCode 'EMVBFszm' \
    --namespace "$AB_NAMESPACE" \
    --limit '82' \
    --offset '3' \
    --sortBy 'contributedValue:asc' \
    > test.out 2>&1
eval_tap $? 24 'ListGlobalAchievementContributors' test.out

#- 25 PublicListTags
./ng net.accelbyte.sdk.cli.Main achievement publicListTags \
    --namespace "$AB_NAMESPACE" \
    --limit '80' \
    --name '0fSKtpeN' \
    --offset '31' \
    --sortBy 'name:asc' \
    > test.out 2>&1
eval_tap $? 25 'PublicListTags' test.out

#- 26 PublicListUserAchievements
./ng net.accelbyte.sdk.cli.Main achievement publicListUserAchievements \
    --namespace "$AB_NAMESPACE" \
    --userId 'BsJpRC3F' \
    --limit '96' \
    --offset '94' \
    --preferUnlocked  \
    --sortBy 'achievedAt:asc' \
    --tags '64mfM11T,wqd2Talu,XIKE0VIi' \
    > test.out 2>&1
eval_tap $? 26 'PublicListUserAchievements' test.out

#- 27 PublicBulkUnlockAchievement
./ng net.accelbyte.sdk.cli.Main achievement publicBulkUnlockAchievement \
    --namespace "$AB_NAMESPACE" \
    --userId 'kDzjUOJ5' \
    --body '{"achievementCodes": ["KDqQ0tq7", "pX0zQoO5", "0KAoW4GH"]}' \
    > test.out 2>&1
eval_tap $? 27 'PublicBulkUnlockAchievement' test.out

#- 28 PublicUnlockAchievement
./ng net.accelbyte.sdk.cli.Main achievement publicUnlockAchievement \
    --achievementCode '6qFVed8k' \
    --namespace "$AB_NAMESPACE" \
    --userId 'FiM20TPR' \
    > test.out 2>&1
eval_tap $? 28 'PublicUnlockAchievement' test.out

#- 29 ListUserContributions
./ng net.accelbyte.sdk.cli.Main achievement listUserContributions \
    --namespace "$AB_NAMESPACE" \
    --userId 'cf9yWDeE' \
    --achievementCodes 'uLJAuUhf' \
    --limit '70' \
    --offset '66' \
    --sortBy 'contributedValue:desc' \
    --tags 'HGJqu8E2,AkrvEqTX,7Gd6p2RK' \
    > test.out 2>&1
eval_tap $? 29 'ListUserContributions' test.out

#- 30 ClaimGlobalAchievementReward
./ng net.accelbyte.sdk.cli.Main achievement claimGlobalAchievementReward \
    --achievementCode '0NPzGjHJ' \
    --namespace "$AB_NAMESPACE" \
    --userId 'cGVdG2O0' \
    > test.out 2>&1
eval_tap $? 30 'ClaimGlobalAchievementReward' test.out


rm -f "tmp.dat"

exit $EXIT_CODE