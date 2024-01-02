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
echo "1..27"

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
    --limit '74' \
    --offset '47' \
    --sortBy 'createdAt:desc' \
    --tags 'yqxKCFKm,2j1IaWBY,HAqVojuP' \
    > test.out 2>&1
eval_tap $? 2 'AdminListAchievements' test.out

#- 3 AdminCreateNewAchievement
./ng net.accelbyte.sdk.cli.Main achievement adminCreateNewAchievement \
    --namespace "$AB_NAMESPACE" \
    --body '{"achievementCode": "MioNzcmi", "customAttributes": {"xNKugm2I": {}, "EKXyB81J": {}, "WkLZPsbo": {}}, "defaultLanguage": "Eu2r2EZV", "description": {"AGGy38Iu": "3RSM7XPN", "ABRWJEer": "u0752tdf", "lQah1h3Z": "a1XABQP1"}, "global": true, "goalValue": 0.2980942212280373, "hidden": true, "incremental": false, "lockedIcons": [{"slug": "wiiNWl2O", "url": "OrVRDfk3"}, {"slug": "dpGbksMo", "url": "AY04QchE"}, {"slug": "mnZSNbxP", "url": "ecSaO5qC"}], "name": {"2NVgnQSQ": "MlD1Vw0R", "n5PR022n": "Lpn1arNi", "9oxMH6XJ": "r4NN75Po"}, "statCode": "YhQmsO5u", "tags": ["p6YbQgYk", "2L6tBWLG", "aqZO3GUk"], "unlockedIcons": [{"slug": "yPysJAQU", "url": "ZRqZy567"}, {"slug": "4OVDlFmw", "url": "Q1p4aoy6"}, {"slug": "F7SqKBCQ", "url": "KXeXyNBq"}]}' \
    > test.out 2>&1
eval_tap $? 3 'AdminCreateNewAchievement' test.out

#- 4 ExportAchievements
./ng net.accelbyte.sdk.cli.Main achievement exportAchievements \
    --namespace "$AB_NAMESPACE" \
    --tags 'NH0CQp1S,E7JuUMVS,faxEeemo' \
    > test.out 2>&1
eval_tap $? 4 'ExportAchievements' test.out

#- 5 ImportAchievements
./ng net.accelbyte.sdk.cli.Main achievement importAchievements \
    --namespace "$AB_NAMESPACE" \
    --file 'tmp.dat' \
    --strategy 'pNXD8x4y' \
    > test.out 2>&1
eval_tap $? 5 'ImportAchievements' test.out

#- 6 AdminGetAchievement
./ng net.accelbyte.sdk.cli.Main achievement adminGetAchievement \
    --achievementCode 'jqaPgeg1' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 6 'AdminGetAchievement' test.out

#- 7 AdminUpdateAchievement
./ng net.accelbyte.sdk.cli.Main achievement adminUpdateAchievement \
    --achievementCode 'a8WVZ0TF' \
    --namespace "$AB_NAMESPACE" \
    --body '{"customAttributes": {"i3k8WmWf": {}, "R1yQ8w5y": {}, "BO1qt5DB": {}}, "defaultLanguage": "W68AoHSy", "description": {"UwCSvabR": "Kc7OMBn5", "7Y3oHYQ4": "E1Ws3Eff", "XYbQJAqU": "qwxkF9dN"}, "global": false, "goalValue": 0.8005544465472588, "hidden": true, "incremental": false, "lockedIcons": [{"slug": "erTp8aYC", "url": "KMUJHgSV"}, {"slug": "ydh53Wjt", "url": "0bMhvWWV"}, {"slug": "Y7zDrb99", "url": "bY8K0Mu4"}], "name": {"4ug7Sd7p": "sUuyHNO8", "MGAvU3Jn": "4wZ8VS12", "1JrrVKur": "OZYfmSjJ"}, "statCode": "Dx3rpU5Y", "tags": ["bYTy0hhb", "buanMwbV", "GcquzbJe"], "unlockedIcons": [{"slug": "GpqTloZe", "url": "bVagohJv"}, {"slug": "VJFlzEyE", "url": "aUbT1W3T"}, {"slug": "MiiB1wa1", "url": "H9H9vsCE"}]}' \
    > test.out 2>&1
eval_tap $? 7 'AdminUpdateAchievement' test.out

#- 8 AdminDeleteAchievement
./ng net.accelbyte.sdk.cli.Main achievement adminDeleteAchievement \
    --achievementCode 'TGh6Re6M' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 8 'AdminDeleteAchievement' test.out

#- 9 AdminUpdateAchievementListOrder
./ng net.accelbyte.sdk.cli.Main achievement adminUpdateAchievementListOrder \
    --achievementCode 'HPzfWloZ' \
    --namespace "$AB_NAMESPACE" \
    --body '{"targetOrder": 61}' \
    > test.out 2>&1
eval_tap $? 9 'AdminUpdateAchievementListOrder' test.out

#- 10 AdminListGlobalAchievements
./ng net.accelbyte.sdk.cli.Main achievement adminListGlobalAchievements \
    --namespace "$AB_NAMESPACE" \
    --achievementCodes 'kfATOWHm' \
    --limit '51' \
    --offset '98' \
    --sortBy 'x0VmZess' \
    --status 'proXrNec' \
    --tags 'OQiAs0FR,l4zCeSNo,JfYAS1En' \
    > test.out 2>&1
eval_tap $? 10 'AdminListGlobalAchievements' test.out

#- 11 AdminListGlobalAchievementContributors
./ng net.accelbyte.sdk.cli.Main achievement adminListGlobalAchievementContributors \
    --achievementCode 'pV6YDBoV' \
    --namespace "$AB_NAMESPACE" \
    --limit '70' \
    --offset '88' \
    --sortBy 'HQsa6nS0' \
    > test.out 2>&1
eval_tap $? 11 'AdminListGlobalAchievementContributors' test.out

#- 12 ResetGlobalAchievement
./ng net.accelbyte.sdk.cli.Main achievement resetGlobalAchievement \
    --achievementCode 'U2iGDxgG' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 12 'ResetGlobalAchievement' test.out

#- 13 AdminListTags
./ng net.accelbyte.sdk.cli.Main achievement adminListTags \
    --namespace "$AB_NAMESPACE" \
    --limit '4' \
    --name 'mxCOEsup' \
    --offset '70' \
    --sortBy 'nOIvY1nC' \
    > test.out 2>&1
eval_tap $? 13 'AdminListTags' test.out

#- 14 AdminListUserAchievements
./ng net.accelbyte.sdk.cli.Main achievement adminListUserAchievements \
    --namespace "$AB_NAMESPACE" \
    --userId 'Biahcg7I' \
    --limit '49' \
    --offset '3' \
    --preferUnlocked  \
    --sortBy 'vayMODGR' \
    --tags 'y7XHGWz5,bxxEdI75,YqRVbdoE' \
    > test.out 2>&1
eval_tap $? 14 'AdminListUserAchievements' test.out

#- 15 AdminResetAchievement
./ng net.accelbyte.sdk.cli.Main achievement adminResetAchievement \
    --achievementCode 'wMeHE24p' \
    --namespace "$AB_NAMESPACE" \
    --userId 'q1Gdnrci' \
    > test.out 2>&1
eval_tap $? 15 'AdminResetAchievement' test.out

#- 16 AdminUnlockAchievement
./ng net.accelbyte.sdk.cli.Main achievement adminUnlockAchievement \
    --achievementCode 'EwwRLehO' \
    --namespace "$AB_NAMESPACE" \
    --userId 'WNxGO5rr' \
    > test.out 2>&1
eval_tap $? 16 'AdminUnlockAchievement' test.out

#- 17 AdminAnonymizeUserAchievement
./ng net.accelbyte.sdk.cli.Main achievement adminAnonymizeUserAchievement \
    --namespace "$AB_NAMESPACE" \
    --userId '1vC749pH' \
    > test.out 2>&1
eval_tap $? 17 'AdminAnonymizeUserAchievement' test.out

#- 18 AdminListUserContributions
./ng net.accelbyte.sdk.cli.Main achievement adminListUserContributions \
    --namespace "$AB_NAMESPACE" \
    --userId 'FJaBjKIo' \
    --achievementCodes 'KB9Eu1dD' \
    --limit '17' \
    --offset '80' \
    --sortBy 'kRBxDitt' \
    --tags 'SNay85I7,XDz2oblJ,cOnKTPNF' \
    > test.out 2>&1
eval_tap $? 18 'AdminListUserContributions' test.out

#- 19 PublicListAchievements
./ng net.accelbyte.sdk.cli.Main achievement publicListAchievements \
    --namespace "$AB_NAMESPACE" \
    --global  \
    --limit '20' \
    --offset '66' \
    --sortBy 'createdAt:desc' \
    --tags 'p4IJ1ijv,wmceMXYa,T8vElHPx' \
    --language 'sDiXOLeb' \
    > test.out 2>&1
eval_tap $? 19 'PublicListAchievements' test.out

#- 20 PublicGetAchievement
./ng net.accelbyte.sdk.cli.Main achievement publicGetAchievement \
    --achievementCode 'dUO95OxI' \
    --namespace "$AB_NAMESPACE" \
    --language 'I4eXj3C4' \
    > test.out 2>&1
eval_tap $? 20 'PublicGetAchievement' test.out

#- 21 PublicListGlobalAchievements
./ng net.accelbyte.sdk.cli.Main achievement publicListGlobalAchievements \
    --namespace "$AB_NAMESPACE" \
    --achievementCodes 'OkVPXlbC' \
    --limit '74' \
    --offset '4' \
    --sortBy 'DIUQDV7T' \
    --status 'gzT98zjC' \
    --tags 'TcPS4pps,kWyAg26e,0VgEDyBc' \
    > test.out 2>&1
eval_tap $? 21 'PublicListGlobalAchievements' test.out

#- 22 ListGlobalAchievementContributors
./ng net.accelbyte.sdk.cli.Main achievement listGlobalAchievementContributors \
    --achievementCode 'qtIdbvXJ' \
    --namespace "$AB_NAMESPACE" \
    --limit '82' \
    --offset '28' \
    --sortBy 'h5kg0VR4' \
    > test.out 2>&1
eval_tap $? 22 'ListGlobalAchievementContributors' test.out

#- 23 PublicListTags
./ng net.accelbyte.sdk.cli.Main achievement publicListTags \
    --namespace "$AB_NAMESPACE" \
    --limit '40' \
    --name 'ZqZqb66L' \
    --offset '76' \
    --sortBy 'gKYfo5QK' \
    > test.out 2>&1
eval_tap $? 23 'PublicListTags' test.out

#- 24 PublicListUserAchievements
./ng net.accelbyte.sdk.cli.Main achievement publicListUserAchievements \
    --namespace "$AB_NAMESPACE" \
    --userId 'ylqIY4hH' \
    --limit '18' \
    --offset '34' \
    --preferUnlocked  \
    --sortBy 'aFo9B0CJ' \
    --tags '4PvyynVr,ntOJdZMK,qK9Svsvc' \
    > test.out 2>&1
eval_tap $? 24 'PublicListUserAchievements' test.out

#- 25 PublicUnlockAchievement
./ng net.accelbyte.sdk.cli.Main achievement publicUnlockAchievement \
    --achievementCode '41AuNGpw' \
    --namespace "$AB_NAMESPACE" \
    --userId 'OL9188nZ' \
    > test.out 2>&1
eval_tap $? 25 'PublicUnlockAchievement' test.out

#- 26 ListUserContributions
./ng net.accelbyte.sdk.cli.Main achievement listUserContributions \
    --namespace "$AB_NAMESPACE" \
    --userId 'p9Jd4dCR' \
    --achievementCodes 'bqLkpZmb' \
    --limit '17' \
    --offset '36' \
    --sortBy 'dd2vTjrf' \
    --tags 'cjRq2Sai,gaOZvD3a,1iVj0WNB' \
    > test.out 2>&1
eval_tap $? 26 'ListUserContributions' test.out

#- 27 ClaimGlobalAchievementReward
./ng net.accelbyte.sdk.cli.Main achievement claimGlobalAchievementReward \
    --achievementCode '1MzzLoia' \
    --namespace "$AB_NAMESPACE" \
    --userId 'EA8MviVO' \
    > test.out 2>&1
eval_tap $? 27 'ClaimGlobalAchievementReward' test.out


rm -f "tmp.dat"

exit $EXIT_CODE