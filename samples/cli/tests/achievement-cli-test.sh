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
    --limit '67' \
    --offset '38' \
    --sortBy 'updatedAt:asc' \
    --tags 'hRJSSURt,10yapQsb,mhmE0hpc' \
    > test.out 2>&1
eval_tap $? 2 'AdminListAchievements' test.out

#- 3 AdminCreateNewAchievement
./ng net.accelbyte.sdk.cli.Main achievement adminCreateNewAchievement \
    --namespace "$AB_NAMESPACE" \
    --body '{"achievementCode": "4RZ0OXir", "customAttributes": {"zG9IkwPB": {}, "7Ehbh8Qt": {}, "pTpwLGA7": {}}, "defaultLanguage": "KrpxbUVV", "description": {"2C5oe11D": "PcIXtY93", "0fomxMjW": "W2OFf2tP", "zEGV6DK7": "OCsWHTcM"}, "global": false, "goalValue": 0.7195806148960705, "hidden": true, "incremental": false, "lockedIcons": [{"slug": "eFAhbSeQ", "url": "cMtg329y"}, {"slug": "NgDKpPXT", "url": "NuWhuLj3"}, {"slug": "axTtIV6G", "url": "OAc5ni2T"}], "name": {"fbAGvy1K": "pJCMaGtp", "5mO5jfpU": "dleSKCe3", "Wv3dkfSg": "pieN7Tny"}, "statCode": "0W9tcdFG", "tags": ["9E6B1YZd", "BDxahxlN", "zQb0foxm"], "unlockedIcons": [{"slug": "GvtcYdbD", "url": "vRvzcurp"}, {"slug": "N3SWKoUS", "url": "VSv1LDdu"}, {"slug": "JK95mVyo", "url": "l1QgguNB"}]}' \
    > test.out 2>&1
eval_tap $? 3 'AdminCreateNewAchievement' test.out

#- 4 ExportAchievements
./ng net.accelbyte.sdk.cli.Main achievement exportAchievements \
    --namespace "$AB_NAMESPACE" \
    --tags 'pT71HXDq,piioM4Mz,7HyizXdf' \
    > test.out 2>&1
eval_tap $? 4 'ExportAchievements' test.out

#- 5 ImportAchievements
./ng net.accelbyte.sdk.cli.Main achievement importAchievements \
    --namespace "$AB_NAMESPACE" \
    --file 'tmp.dat' \
    --strategy 'mpRQ6mLq' \
    > test.out 2>&1
eval_tap $? 5 'ImportAchievements' test.out

#- 6 AdminGetAchievement
./ng net.accelbyte.sdk.cli.Main achievement adminGetAchievement \
    --achievementCode 'I12eZGAM' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 6 'AdminGetAchievement' test.out

#- 7 AdminUpdateAchievement
./ng net.accelbyte.sdk.cli.Main achievement adminUpdateAchievement \
    --achievementCode 'y0GBgdXL' \
    --namespace "$AB_NAMESPACE" \
    --body '{"customAttributes": {"UZtHFgf0": {}, "hqYlVN5i": {}, "y0gY1jtl": {}}, "defaultLanguage": "kpjPwocQ", "description": {"oND1F5du": "M4uFuEST", "pIFkgCzd": "27KC4eEq", "QmksQ6SW": "jjJiK03F"}, "global": false, "goalValue": 0.849979863389363, "hidden": false, "incremental": false, "lockedIcons": [{"slug": "wu7UEP0h", "url": "mjRsytVQ"}, {"slug": "ZPNTlkH8", "url": "5sDbnGmG"}, {"slug": "AWVSZH4k", "url": "z9WgB4Ol"}], "name": {"tDsNJCyS": "lC6E4sAf", "WaD1qsuo": "UQckqG8n", "39TQvf9i": "wjZ0zcF8"}, "statCode": "SVvmi0U7", "tags": ["h3ccsM6d", "3u0c1DXJ", "o8vowXvi"], "unlockedIcons": [{"slug": "TXtmqfKB", "url": "tT4vQFMm"}, {"slug": "P5hJmULU", "url": "2dj0cqAN"}, {"slug": "PmTO5n7K", "url": "7XvDejBX"}]}' \
    > test.out 2>&1
eval_tap $? 7 'AdminUpdateAchievement' test.out

#- 8 AdminDeleteAchievement
./ng net.accelbyte.sdk.cli.Main achievement adminDeleteAchievement \
    --achievementCode 'zzV8zQ34' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 8 'AdminDeleteAchievement' test.out

#- 9 AdminUpdateAchievementListOrder
./ng net.accelbyte.sdk.cli.Main achievement adminUpdateAchievementListOrder \
    --achievementCode 'XcipUTYy' \
    --namespace "$AB_NAMESPACE" \
    --body '{"targetOrder": 58}' \
    > test.out 2>&1
eval_tap $? 9 'AdminUpdateAchievementListOrder' test.out

#- 10 AdminListGlobalAchievements
./ng net.accelbyte.sdk.cli.Main achievement adminListGlobalAchievements \
    --namespace "$AB_NAMESPACE" \
    --achievementCodes 'KLNQYcHR' \
    --limit '9' \
    --offset '98' \
    --sortBy 'M5dcZcSc' \
    --status '1DyUPItj' \
    --tags 'iHR5nhPi,tERSqeOC,2yfpqxxg' \
    > test.out 2>&1
eval_tap $? 10 'AdminListGlobalAchievements' test.out

#- 11 AdminListGlobalAchievementContributors
./ng net.accelbyte.sdk.cli.Main achievement adminListGlobalAchievementContributors \
    --achievementCode 'yVEBkJTQ' \
    --namespace "$AB_NAMESPACE" \
    --limit '56' \
    --offset '31' \
    --sortBy 'ScJH6PQM' \
    > test.out 2>&1
eval_tap $? 11 'AdminListGlobalAchievementContributors' test.out

#- 12 ResetGlobalAchievement
./ng net.accelbyte.sdk.cli.Main achievement resetGlobalAchievement \
    --achievementCode 'usD1Ebh7' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 12 'ResetGlobalAchievement' test.out

#- 13 AdminListTags
./ng net.accelbyte.sdk.cli.Main achievement adminListTags \
    --namespace "$AB_NAMESPACE" \
    --limit '37' \
    --name 'QtJiekqR' \
    --offset '34' \
    --sortBy 'FLe39dmf' \
    > test.out 2>&1
eval_tap $? 13 'AdminListTags' test.out

#- 14 AdminListUserAchievements
./ng net.accelbyte.sdk.cli.Main achievement adminListUserAchievements \
    --namespace "$AB_NAMESPACE" \
    --userId 'miDHvSL5' \
    --limit '79' \
    --offset '37' \
    --preferUnlocked  \
    --sortBy '8ipgfxc7' \
    --tags 'Llcqyw6P,II0qZHni,qAJdibD7' \
    > test.out 2>&1
eval_tap $? 14 'AdminListUserAchievements' test.out

#- 15 AdminResetAchievement
./ng net.accelbyte.sdk.cli.Main achievement adminResetAchievement \
    --achievementCode 'Dti8GSvJ' \
    --namespace "$AB_NAMESPACE" \
    --userId 'RbVFgCKt' \
    > test.out 2>&1
eval_tap $? 15 'AdminResetAchievement' test.out

#- 16 AdminUnlockAchievement
./ng net.accelbyte.sdk.cli.Main achievement adminUnlockAchievement \
    --achievementCode 'MI9FsO2S' \
    --namespace "$AB_NAMESPACE" \
    --userId '0l8wFeNX' \
    > test.out 2>&1
eval_tap $? 16 'AdminUnlockAchievement' test.out

#- 17 AdminAnonymizeUserAchievement
./ng net.accelbyte.sdk.cli.Main achievement adminAnonymizeUserAchievement \
    --namespace "$AB_NAMESPACE" \
    --userId 'jWMv1wY4' \
    > test.out 2>&1
eval_tap $? 17 'AdminAnonymizeUserAchievement' test.out

#- 18 AdminListUserContributions
./ng net.accelbyte.sdk.cli.Main achievement adminListUserContributions \
    --namespace "$AB_NAMESPACE" \
    --userId 'rfNAVba4' \
    --achievementCodes '5bZtbCza' \
    --limit '16' \
    --offset '8' \
    --sortBy 'd0T3Oxsa' \
    --tags '0UZanMeY,saEUbYlZ,V0egJGFZ' \
    > test.out 2>&1
eval_tap $? 18 'AdminListUserContributions' test.out

#- 19 PublicListAchievements
./ng net.accelbyte.sdk.cli.Main achievement publicListAchievements \
    --namespace "$AB_NAMESPACE" \
    --global  \
    --limit '1' \
    --offset '2' \
    --sortBy 'listOrder:desc' \
    --tags 'FNDyDT6Y,NvwkJt07,tojv1PE2' \
    --language 'ugodnSDt' \
    > test.out 2>&1
eval_tap $? 19 'PublicListAchievements' test.out

#- 20 PublicGetAchievement
./ng net.accelbyte.sdk.cli.Main achievement publicGetAchievement \
    --achievementCode 'iK71q8jR' \
    --namespace "$AB_NAMESPACE" \
    --language 'HImyv84c' \
    > test.out 2>&1
eval_tap $? 20 'PublicGetAchievement' test.out

#- 21 PublicListGlobalAchievements
./ng net.accelbyte.sdk.cli.Main achievement publicListGlobalAchievements \
    --namespace "$AB_NAMESPACE" \
    --achievementCodes 'HzeOuA0Z' \
    --limit '18' \
    --offset '11' \
    --sortBy 'NAo7LiXO' \
    --status 'zGUAlxM4' \
    --tags 'FMnizgJ7,Q1I91k1s,QWqW6ant' \
    > test.out 2>&1
eval_tap $? 21 'PublicListGlobalAchievements' test.out

#- 22 ListGlobalAchievementContributors
./ng net.accelbyte.sdk.cli.Main achievement listGlobalAchievementContributors \
    --achievementCode 'lDEwyIhj' \
    --namespace "$AB_NAMESPACE" \
    --limit '12' \
    --offset '31' \
    --sortBy 'r0rw7O7K' \
    > test.out 2>&1
eval_tap $? 22 'ListGlobalAchievementContributors' test.out

#- 23 PublicListTags
./ng net.accelbyte.sdk.cli.Main achievement publicListTags \
    --namespace "$AB_NAMESPACE" \
    --limit '70' \
    --name 'AuCrmGqB' \
    --offset '46' \
    --sortBy '55ytkuBD' \
    > test.out 2>&1
eval_tap $? 23 'PublicListTags' test.out

#- 24 PublicListUserAchievements
./ng net.accelbyte.sdk.cli.Main achievement publicListUserAchievements \
    --namespace "$AB_NAMESPACE" \
    --userId 'uzrVqyjP' \
    --limit '77' \
    --offset '6' \
    --preferUnlocked  \
    --sortBy 'vcrkhM8f' \
    --tags 'EWpajRH3,DKSVylRq,JYueTL62' \
    > test.out 2>&1
eval_tap $? 24 'PublicListUserAchievements' test.out

#- 25 PublicUnlockAchievement
./ng net.accelbyte.sdk.cli.Main achievement publicUnlockAchievement \
    --achievementCode 'l5vZNpT8' \
    --namespace "$AB_NAMESPACE" \
    --userId 'tjhb6tmm' \
    > test.out 2>&1
eval_tap $? 25 'PublicUnlockAchievement' test.out

#- 26 ListUserContributions
./ng net.accelbyte.sdk.cli.Main achievement listUserContributions \
    --namespace "$AB_NAMESPACE" \
    --userId 'oMW410eY' \
    --achievementCodes 'dXXG3l1Q' \
    --limit '42' \
    --offset '33' \
    --sortBy '8v9h9Agj' \
    --tags '7CGEVloa,ql3luYZQ,DsrKUQW6' \
    > test.out 2>&1
eval_tap $? 26 'ListUserContributions' test.out

#- 27 ClaimGlobalAchievementReward
./ng net.accelbyte.sdk.cli.Main achievement claimGlobalAchievementReward \
    --achievementCode '2XpnmEmp' \
    --namespace "$AB_NAMESPACE" \
    --userId 'nX3svCO2' \
    > test.out 2>&1
eval_tap $? 27 'ClaimGlobalAchievementReward' test.out


rm -f "tmp.dat"

exit $EXIT_CODE