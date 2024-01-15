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
    --limit '27' \
    --offset '20' \
    --sortBy 'listOrder:asc' \
    --tags 'BiO6xhiz,Mrbkdvrx,ggSlFKOA' \
    > test.out 2>&1
eval_tap $? 2 'AdminListAchievements' test.out

#- 3 AdminCreateNewAchievement
./ng net.accelbyte.sdk.cli.Main achievement adminCreateNewAchievement \
    --namespace "$AB_NAMESPACE" \
    --body '{"achievementCode": "1t7CPrdj", "customAttributes": {"fydaWiZo": {}, "0NoFkPK0": {}, "IR2r1ms7": {}}, "defaultLanguage": "KU7rSdq9", "description": {"7G4kk1Zp": "sEJc4PsM", "MKpgZ795": "ABzTY0bE", "KGPXYb5E": "XRZQYLbO"}, "global": true, "goalValue": 0.2772355463216364, "hidden": false, "incremental": true, "lockedIcons": [{"slug": "ZtlQ4P64", "url": "ydYNhFKf"}, {"slug": "rhr8ZXIz", "url": "mvDN4icD"}, {"slug": "k857tceZ", "url": "xjjijjb7"}], "name": {"eDtAFShe": "Xa3RBp2q", "IckDf595": "0RZhSAe2", "HhMuIPhy": "4hgtXx3G"}, "statCode": "dFJXQKmH", "tags": ["oACM65L7", "xE3o7uKu", "g0uYXTB9"], "unlockedIcons": [{"slug": "6pgp4arC", "url": "joy3nNWz"}, {"slug": "2XgqEcgx", "url": "iJDJwCGW"}, {"slug": "1h4eOwPc", "url": "GTKb8Xbm"}]}' \
    > test.out 2>&1
eval_tap $? 3 'AdminCreateNewAchievement' test.out

#- 4 ExportAchievements
./ng net.accelbyte.sdk.cli.Main achievement exportAchievements \
    --namespace "$AB_NAMESPACE" \
    --tags 'rZXfG9lY,eQYJh2hG,porbDqd6' \
    > test.out 2>&1
eval_tap $? 4 'ExportAchievements' test.out

#- 5 ImportAchievements
./ng net.accelbyte.sdk.cli.Main achievement importAchievements \
    --namespace "$AB_NAMESPACE" \
    --file 'tmp.dat' \
    --strategy 'fAlCAEk0' \
    > test.out 2>&1
eval_tap $? 5 'ImportAchievements' test.out

#- 6 AdminGetAchievement
./ng net.accelbyte.sdk.cli.Main achievement adminGetAchievement \
    --achievementCode '94sCRBab' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 6 'AdminGetAchievement' test.out

#- 7 AdminUpdateAchievement
./ng net.accelbyte.sdk.cli.Main achievement adminUpdateAchievement \
    --achievementCode '16ZWL0I7' \
    --namespace "$AB_NAMESPACE" \
    --body '{"customAttributes": {"ts7GomfL": {}, "O6QGhpx3": {}, "topTMS1m": {}}, "defaultLanguage": "ay750uds", "description": {"9l0GCfbj": "3Skk0vD9", "spDDgiYp": "xfr0Dzix", "YM1WwwA5": "8GAjoFV8"}, "global": true, "goalValue": 0.2885837635223263, "hidden": false, "incremental": false, "lockedIcons": [{"slug": "sNYVYzEu", "url": "Ng5qZ8zc"}, {"slug": "mI0tEqtu", "url": "swXlxfgD"}, {"slug": "8MA19VBh", "url": "6mKHCfl5"}], "name": {"OfUwDHXg": "Y9nXMj85", "3hgVO3tH": "dukMEJOg", "NG8WEfIw": "GCdk5hTN"}, "statCode": "UchRbda7", "tags": ["rCu9Q5Gp", "bUVl8RFC", "kadapVZ3"], "unlockedIcons": [{"slug": "1dtgt55H", "url": "PpMaOPI7"}, {"slug": "IgTUWRPm", "url": "4gF94iNL"}, {"slug": "ChDltv6s", "url": "3H60PS6Z"}]}' \
    > test.out 2>&1
eval_tap $? 7 'AdminUpdateAchievement' test.out

#- 8 AdminDeleteAchievement
./ng net.accelbyte.sdk.cli.Main achievement adminDeleteAchievement \
    --achievementCode 'jEu4wFJR' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 8 'AdminDeleteAchievement' test.out

#- 9 AdminUpdateAchievementListOrder
./ng net.accelbyte.sdk.cli.Main achievement adminUpdateAchievementListOrder \
    --achievementCode '7DbR6QAE' \
    --namespace "$AB_NAMESPACE" \
    --body '{"targetOrder": 82}' \
    > test.out 2>&1
eval_tap $? 9 'AdminUpdateAchievementListOrder' test.out

#- 10 AdminListGlobalAchievements
./ng net.accelbyte.sdk.cli.Main achievement adminListGlobalAchievements \
    --namespace "$AB_NAMESPACE" \
    --achievementCodes 'lYJ64p0C' \
    --limit '73' \
    --offset '90' \
    --sortBy 'efC6VQ0B' \
    --status 'AyCumNLb' \
    --tags 'yajHtUig,59QQcjFB,0t1VI5xD' \
    > test.out 2>&1
eval_tap $? 10 'AdminListGlobalAchievements' test.out

#- 11 AdminListGlobalAchievementContributors
./ng net.accelbyte.sdk.cli.Main achievement adminListGlobalAchievementContributors \
    --achievementCode 'kIUWNcz8' \
    --namespace "$AB_NAMESPACE" \
    --limit '28' \
    --offset '2' \
    --sortBy 'KWQupLNJ' \
    > test.out 2>&1
eval_tap $? 11 'AdminListGlobalAchievementContributors' test.out

#- 12 ResetGlobalAchievement
./ng net.accelbyte.sdk.cli.Main achievement resetGlobalAchievement \
    --achievementCode 'dMMzaCn8' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 12 'ResetGlobalAchievement' test.out

#- 13 AdminListTags
./ng net.accelbyte.sdk.cli.Main achievement adminListTags \
    --namespace "$AB_NAMESPACE" \
    --limit '54' \
    --name 'mzNG5Zl2' \
    --offset '17' \
    --sortBy 'i5Z0vfg5' \
    > test.out 2>&1
eval_tap $? 13 'AdminListTags' test.out

#- 14 AdminListUserAchievements
./ng net.accelbyte.sdk.cli.Main achievement adminListUserAchievements \
    --namespace "$AB_NAMESPACE" \
    --userId 'X927i95p' \
    --limit '100' \
    --offset '77' \
    --preferUnlocked  \
    --sortBy 'GPKsj5uT' \
    --tags '39FuqLCb,EEqHjfTc,0w5zqqrq' \
    > test.out 2>&1
eval_tap $? 14 'AdminListUserAchievements' test.out

#- 15 AdminResetAchievement
./ng net.accelbyte.sdk.cli.Main achievement adminResetAchievement \
    --achievementCode 'VAFfM7tS' \
    --namespace "$AB_NAMESPACE" \
    --userId 'NkoslHov' \
    > test.out 2>&1
eval_tap $? 15 'AdminResetAchievement' test.out

#- 16 AdminUnlockAchievement
./ng net.accelbyte.sdk.cli.Main achievement adminUnlockAchievement \
    --achievementCode 'rIBWLRRk' \
    --namespace "$AB_NAMESPACE" \
    --userId '8PwL6isQ' \
    > test.out 2>&1
eval_tap $? 16 'AdminUnlockAchievement' test.out

#- 17 AdminAnonymizeUserAchievement
./ng net.accelbyte.sdk.cli.Main achievement adminAnonymizeUserAchievement \
    --namespace "$AB_NAMESPACE" \
    --userId 'NRNxczGc' \
    > test.out 2>&1
eval_tap $? 17 'AdminAnonymizeUserAchievement' test.out

#- 18 AdminListUserContributions
./ng net.accelbyte.sdk.cli.Main achievement adminListUserContributions \
    --namespace "$AB_NAMESPACE" \
    --userId 'Kl4BeRmt' \
    --achievementCodes 'bhvfZRja' \
    --limit '21' \
    --offset '76' \
    --sortBy '6R6Vnvc2' \
    --tags 'ammSxzYT,YD62cTmL,ra0zzqSG' \
    > test.out 2>&1
eval_tap $? 18 'AdminListUserContributions' test.out

#- 19 PublicListAchievements
./ng net.accelbyte.sdk.cli.Main achievement publicListAchievements \
    --namespace "$AB_NAMESPACE" \
    --global  \
    --limit '39' \
    --offset '65' \
    --sortBy 'createdAt:asc' \
    --tags 'nqVpGCzv,J6ufW8jj,YROCa6pB' \
    --language 'kJJm8ixg' \
    > test.out 2>&1
eval_tap $? 19 'PublicListAchievements' test.out

#- 20 PublicGetAchievement
./ng net.accelbyte.sdk.cli.Main achievement publicGetAchievement \
    --achievementCode 'hy2zNF44' \
    --namespace "$AB_NAMESPACE" \
    --language 'E2GaPb4N' \
    > test.out 2>&1
eval_tap $? 20 'PublicGetAchievement' test.out

#- 21 PublicListGlobalAchievements
./ng net.accelbyte.sdk.cli.Main achievement publicListGlobalAchievements \
    --namespace "$AB_NAMESPACE" \
    --achievementCodes 'RDYY20Tg' \
    --limit '81' \
    --offset '17' \
    --sortBy 'cWHfs0ep' \
    --status '0J4YZfj8' \
    --tags 'tTJpG7lH,t7hDMF4x,SmqrV9M8' \
    > test.out 2>&1
eval_tap $? 21 'PublicListGlobalAchievements' test.out

#- 22 ListGlobalAchievementContributors
./ng net.accelbyte.sdk.cli.Main achievement listGlobalAchievementContributors \
    --achievementCode 'h5lF3Huj' \
    --namespace "$AB_NAMESPACE" \
    --limit '4' \
    --offset '26' \
    --sortBy '9dftK5eT' \
    > test.out 2>&1
eval_tap $? 22 'ListGlobalAchievementContributors' test.out

#- 23 PublicListTags
./ng net.accelbyte.sdk.cli.Main achievement publicListTags \
    --namespace "$AB_NAMESPACE" \
    --limit '37' \
    --name 'nRXyKZ67' \
    --offset '74' \
    --sortBy '8ajsDKus' \
    > test.out 2>&1
eval_tap $? 23 'PublicListTags' test.out

#- 24 PublicListUserAchievements
./ng net.accelbyte.sdk.cli.Main achievement publicListUserAchievements \
    --namespace "$AB_NAMESPACE" \
    --userId 'NCpa9lyo' \
    --limit '55' \
    --offset '42' \
    --preferUnlocked  \
    --sortBy '8NlFob5D' \
    --tags 'uYkgSN5A,pyL1NPJn,kLXjpITY' \
    > test.out 2>&1
eval_tap $? 24 'PublicListUserAchievements' test.out

#- 25 PublicUnlockAchievement
./ng net.accelbyte.sdk.cli.Main achievement publicUnlockAchievement \
    --achievementCode 'pLLba8n5' \
    --namespace "$AB_NAMESPACE" \
    --userId 'CsgF45y8' \
    > test.out 2>&1
eval_tap $? 25 'PublicUnlockAchievement' test.out

#- 26 ListUserContributions
./ng net.accelbyte.sdk.cli.Main achievement listUserContributions \
    --namespace "$AB_NAMESPACE" \
    --userId 'mpsoCAO7' \
    --achievementCodes 'URuhLllm' \
    --limit '78' \
    --offset '99' \
    --sortBy 'YB8Ubeft' \
    --tags '48kyZgoa,aMVaVRpB,d00JMLAT' \
    > test.out 2>&1
eval_tap $? 26 'ListUserContributions' test.out

#- 27 ClaimGlobalAchievementReward
./ng net.accelbyte.sdk.cli.Main achievement claimGlobalAchievementReward \
    --achievementCode 'YtXGiust' \
    --namespace "$AB_NAMESPACE" \
    --userId 'xqIgSiTi' \
    > test.out 2>&1
eval_tap $? 27 'ClaimGlobalAchievementReward' test.out


rm -f "tmp.dat"

exit $EXIT_CODE