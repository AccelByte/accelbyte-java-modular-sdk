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
    --limit '18' \
    --offset '89' \
    --sortBy 'updatedAt' \
    --tags 'In3C54xG,oTE00Rpx,GrzqFPZt' \
    > test.out 2>&1
eval_tap $? 2 'AdminListAchievements' test.out

#- 3 AdminCreateNewAchievement
./ng net.accelbyte.sdk.cli.Main achievement adminCreateNewAchievement \
    --namespace "$AB_NAMESPACE" \
    --body '{"achievementCode": "nx7FI4Nj", "customAttributes": {"96RWtgV6": {}, "o5B55KNZ": {}, "T8ULTcB0": {}}, "defaultLanguage": "n1a2Um3H", "description": {"rlJwlkrW": "e4TQvMH4", "i7uWkvYQ": "7YmZOA0f", "WrKsgitN": "etgYMKqd"}, "global": false, "goalValue": 0.43229959476860114, "hidden": true, "incremental": true, "lockedIcons": [{"slug": "y5kqfN6c", "url": "iKtmXlrw"}, {"slug": "A0bkDTPy", "url": "JfCPjNX0"}, {"slug": "dAc6E9hB", "url": "YXVMdC85"}], "name": {"zVLhT9rY": "H4FHKiu4", "licfp0Qt": "2gkaY5Qr", "xbH6bDm2": "hLraUY1z"}, "statCode": "IvP8OJQk", "tags": ["T3F6lcCs", "1HQwFguh", "OBCt6mu8"], "unlockedIcons": [{"slug": "juiICa25", "url": "CBDPT09M"}, {"slug": "a6z9S4wh", "url": "cFCfsl8O"}, {"slug": "xFzwuTdB", "url": "FGBvS5iI"}]}' \
    > test.out 2>&1
eval_tap $? 3 'AdminCreateNewAchievement' test.out

#- 4 ExportAchievements
./ng net.accelbyte.sdk.cli.Main achievement exportAchievements \
    --namespace "$AB_NAMESPACE" \
    --tags 'ePyKUhA5,kVWVBVCp,mjLVBPal' \
    > test.out 2>&1
eval_tap $? 4 'ExportAchievements' test.out

#- 5 ImportAchievements
./ng net.accelbyte.sdk.cli.Main achievement importAchievements \
    --namespace "$AB_NAMESPACE" \
    --file 'tmp.dat' \
    --strategy 'd6hkPv7d' \
    > test.out 2>&1
eval_tap $? 5 'ImportAchievements' test.out

#- 6 AdminGetAchievement
./ng net.accelbyte.sdk.cli.Main achievement adminGetAchievement \
    --achievementCode 'QuUjIWZl' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 6 'AdminGetAchievement' test.out

#- 7 AdminUpdateAchievement
./ng net.accelbyte.sdk.cli.Main achievement adminUpdateAchievement \
    --achievementCode 'M7BO7JKH' \
    --namespace "$AB_NAMESPACE" \
    --body '{"customAttributes": {"CfMH4dFD": {}, "GMKfbNKm": {}, "f7WgmbsH": {}}, "defaultLanguage": "lJUGSZsR", "description": {"kEVAthwC": "tmdNrVHd", "WZ2t4SZW": "BOtFvasH", "R4hvSKw1": "B8UEZOXc"}, "global": true, "goalValue": 0.8557268020545216, "hidden": true, "incremental": true, "lockedIcons": [{"slug": "eBtsbBHr", "url": "LWcWAnhD"}, {"slug": "SR3FAaxW", "url": "HINcmTPw"}, {"slug": "MXVs8T0F", "url": "noyyKQzg"}], "name": {"CZdYyd84": "8yiF8VpY", "xaRjhBrI": "xywNdTCF", "cmYhAuwU": "rRPuESZk"}, "statCode": "QtRYUoLW", "tags": ["lKlO1jUh", "W5lYEa2R", "FgTzgSHU"], "unlockedIcons": [{"slug": "poPvfNqp", "url": "fgcDMGWY"}, {"slug": "UbKGAYPZ", "url": "ZSKHKQJ2"}, {"slug": "QYTbDeIv", "url": "3roVHmFB"}]}' \
    > test.out 2>&1
eval_tap $? 7 'AdminUpdateAchievement' test.out

#- 8 AdminDeleteAchievement
./ng net.accelbyte.sdk.cli.Main achievement adminDeleteAchievement \
    --achievementCode 'Oo80GFDN' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 8 'AdminDeleteAchievement' test.out

#- 9 AdminUpdateAchievementListOrder
./ng net.accelbyte.sdk.cli.Main achievement adminUpdateAchievementListOrder \
    --achievementCode 'yiMt5Twa' \
    --namespace "$AB_NAMESPACE" \
    --body '{"targetOrder": 0}' \
    > test.out 2>&1
eval_tap $? 9 'AdminUpdateAchievementListOrder' test.out

#- 10 AdminListGlobalAchievements
./ng net.accelbyte.sdk.cli.Main achievement adminListGlobalAchievements \
    --namespace "$AB_NAMESPACE" \
    --achievementCodes 'GrUaRRP3' \
    --limit '4' \
    --offset '92' \
    --sortBy 'QKPOHDNV' \
    --status 'sAcuUQlB' \
    --tags 'cXyksha1,kaXdz7KL,yFEIX8Z3' \
    > test.out 2>&1
eval_tap $? 10 'AdminListGlobalAchievements' test.out

#- 11 AdminListGlobalAchievementContributors
./ng net.accelbyte.sdk.cli.Main achievement adminListGlobalAchievementContributors \
    --achievementCode 'hVXBasJH' \
    --namespace "$AB_NAMESPACE" \
    --limit '79' \
    --offset '64' \
    --sortBy 'ZJkoUb4v' \
    > test.out 2>&1
eval_tap $? 11 'AdminListGlobalAchievementContributors' test.out

#- 12 ResetGlobalAchievement
./ng net.accelbyte.sdk.cli.Main achievement resetGlobalAchievement \
    --achievementCode 'YhJqCf6l' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 12 'ResetGlobalAchievement' test.out

#- 13 AdminListTags
./ng net.accelbyte.sdk.cli.Main achievement adminListTags \
    --namespace "$AB_NAMESPACE" \
    --limit '30' \
    --name 'EKhfBsCX' \
    --offset '64' \
    --sortBy 'hzM7J6tO' \
    > test.out 2>&1
eval_tap $? 13 'AdminListTags' test.out

#- 14 AdminListUserAchievements
./ng net.accelbyte.sdk.cli.Main achievement adminListUserAchievements \
    --namespace "$AB_NAMESPACE" \
    --userId 'LF60Ljm1' \
    --limit '81' \
    --offset '86' \
    --preferUnlocked  \
    --sortBy 'jrjxIGeO' \
    --tags 'nB5NehLh,zjzW3FLE,R2dDVvzW' \
    > test.out 2>&1
eval_tap $? 14 'AdminListUserAchievements' test.out

#- 15 AdminResetAchievement
./ng net.accelbyte.sdk.cli.Main achievement adminResetAchievement \
    --achievementCode 'jpLMAP2h' \
    --namespace "$AB_NAMESPACE" \
    --userId 'v6sLAlAV' \
    > test.out 2>&1
eval_tap $? 15 'AdminResetAchievement' test.out

#- 16 AdminUnlockAchievement
./ng net.accelbyte.sdk.cli.Main achievement adminUnlockAchievement \
    --achievementCode '7A4LVyWa' \
    --namespace "$AB_NAMESPACE" \
    --userId 'pA59F5qu' \
    > test.out 2>&1
eval_tap $? 16 'AdminUnlockAchievement' test.out

#- 17 AdminAnonymizeUserAchievement
./ng net.accelbyte.sdk.cli.Main achievement adminAnonymizeUserAchievement \
    --namespace "$AB_NAMESPACE" \
    --userId 'vUdOnHgK' \
    > test.out 2>&1
eval_tap $? 17 'AdminAnonymizeUserAchievement' test.out

#- 18 AdminListUserContributions
./ng net.accelbyte.sdk.cli.Main achievement adminListUserContributions \
    --namespace "$AB_NAMESPACE" \
    --userId 'fqnUfHee' \
    --achievementCodes 'ctOI4r7d' \
    --limit '0' \
    --offset '84' \
    --sortBy 'dAuQc7f8' \
    --tags 'w8ElKhts,e7kfPLhh,JjnJRzA7' \
    > test.out 2>&1
eval_tap $? 18 'AdminListUserContributions' test.out

#- 19 PublicListAchievements
./ng net.accelbyte.sdk.cli.Main achievement publicListAchievements \
    --namespace "$AB_NAMESPACE" \
    --global  \
    --limit '67' \
    --offset '97' \
    --sortBy 'listOrder:asc' \
    --tags '7bib1W6i,AfeK89Cs,QmmQjd7i' \
    --language 'Gw8voZLc' \
    > test.out 2>&1
eval_tap $? 19 'PublicListAchievements' test.out

#- 20 PublicGetAchievement
./ng net.accelbyte.sdk.cli.Main achievement publicGetAchievement \
    --achievementCode '6sHHOfOC' \
    --namespace "$AB_NAMESPACE" \
    --language 'QicwBbpI' \
    > test.out 2>&1
eval_tap $? 20 'PublicGetAchievement' test.out

#- 21 PublicListGlobalAchievements
./ng net.accelbyte.sdk.cli.Main achievement publicListGlobalAchievements \
    --namespace "$AB_NAMESPACE" \
    --achievementCodes 'IaqFDZhW' \
    --limit '4' \
    --offset '75' \
    --sortBy '76ESUnKh' \
    --status '1kbs2EzM' \
    --tags 'UEdzqvdk,7fIbKvnl,9jELvYps' \
    > test.out 2>&1
eval_tap $? 21 'PublicListGlobalAchievements' test.out

#- 22 ListGlobalAchievementContributors
./ng net.accelbyte.sdk.cli.Main achievement listGlobalAchievementContributors \
    --achievementCode 'U3iJgLvY' \
    --namespace "$AB_NAMESPACE" \
    --limit '39' \
    --offset '12' \
    --sortBy 'wTfEPVVX' \
    > test.out 2>&1
eval_tap $? 22 'ListGlobalAchievementContributors' test.out

#- 23 PublicListTags
./ng net.accelbyte.sdk.cli.Main achievement publicListTags \
    --namespace "$AB_NAMESPACE" \
    --limit '55' \
    --name 'yFTkGWcJ' \
    --offset '25' \
    --sortBy 'igqs0Mqg' \
    > test.out 2>&1
eval_tap $? 23 'PublicListTags' test.out

#- 24 PublicListUserAchievements
./ng net.accelbyte.sdk.cli.Main achievement publicListUserAchievements \
    --namespace "$AB_NAMESPACE" \
    --userId 'hqushcOA' \
    --limit '27' \
    --offset '99' \
    --preferUnlocked  \
    --sortBy 'KIkkKeKJ' \
    --tags 'ZN3li0Lh,dkL2gaJw,UWOxLX8a' \
    > test.out 2>&1
eval_tap $? 24 'PublicListUserAchievements' test.out

#- 25 PublicUnlockAchievement
./ng net.accelbyte.sdk.cli.Main achievement publicUnlockAchievement \
    --achievementCode 'AgRcdaEO' \
    --namespace "$AB_NAMESPACE" \
    --userId '2L4z7FKQ' \
    > test.out 2>&1
eval_tap $? 25 'PublicUnlockAchievement' test.out

#- 26 ListUserContributions
./ng net.accelbyte.sdk.cli.Main achievement listUserContributions \
    --namespace "$AB_NAMESPACE" \
    --userId 'F0aVTHgY' \
    --achievementCodes 'ECVvFZ39' \
    --limit '82' \
    --offset '78' \
    --sortBy 'BnQNWOGK' \
    --tags 'Hhh2BKMG,EAY7CtWS,aa79LZi4' \
    > test.out 2>&1
eval_tap $? 26 'ListUserContributions' test.out

#- 27 ClaimGlobalAchievementReward
./ng net.accelbyte.sdk.cli.Main achievement claimGlobalAchievementReward \
    --achievementCode 'voi7ShsD' \
    --namespace "$AB_NAMESPACE" \
    --userId 'eMW2S33t' \
    > test.out 2>&1
eval_tap $? 27 'ClaimGlobalAchievementReward' test.out


rm -f "tmp.dat"

exit $EXIT_CODE