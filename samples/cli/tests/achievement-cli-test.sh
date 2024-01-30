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
    --limit '19' \
    --offset '24' \
    --sortBy 'createdAt:asc' \
    --tags '9geXej0s,fEBwuPt1,M9qGziqj' \
    > test.out 2>&1
eval_tap $? 2 'AdminListAchievements' test.out

#- 3 AdminCreateNewAchievement
./ng net.accelbyte.sdk.cli.Main achievement adminCreateNewAchievement \
    --namespace "$AB_NAMESPACE" \
    --body '{"achievementCode": "0MsAaYDJ", "customAttributes": {"ZGb9M1GX": {}, "zzHlFxZD": {}, "33A12O9q": {}}, "defaultLanguage": "e3hxH2v5", "description": {"RsNqGKQy": "CyoLdSPY", "H8eaSOfY": "Gf971bOq", "iYI6dwzs": "GqpAiSyN"}, "global": true, "goalValue": 0.9122349806890331, "hidden": true, "incremental": true, "lockedIcons": [{"slug": "NbIY8Kgc", "url": "awIjDJpK"}, {"slug": "BvVoCZ9c", "url": "f5zxrOhe"}, {"slug": "4ippAy6P", "url": "SR2E9lmC"}], "name": {"QfXsgnQ1": "oizeQrGr", "aH5YrwaG": "Gfmgl4lQ", "BPadfvYW": "9VIlULUS"}, "statCode": "W0mKVFUJ", "tags": ["nEKxzjok", "HRsWTsX1", "3mBZgm2T"], "unlockedIcons": [{"slug": "WWn03CG6", "url": "gUXAw9nv"}, {"slug": "7pKvWoh6", "url": "NWY1AkeS"}, {"slug": "fHyAHMb2", "url": "1wEgEkXc"}]}' \
    > test.out 2>&1
eval_tap $? 3 'AdminCreateNewAchievement' test.out

#- 4 ExportAchievements
./ng net.accelbyte.sdk.cli.Main achievement exportAchievements \
    --namespace "$AB_NAMESPACE" \
    --tags 'lcms1usQ,TjUXbUJs,LteoFmMH' \
    > test.out 2>&1
eval_tap $? 4 'ExportAchievements' test.out

#- 5 ImportAchievements
./ng net.accelbyte.sdk.cli.Main achievement importAchievements \
    --namespace "$AB_NAMESPACE" \
    --file 'tmp.dat' \
    --strategy 'beY6SvVX' \
    > test.out 2>&1
eval_tap $? 5 'ImportAchievements' test.out

#- 6 AdminGetAchievement
./ng net.accelbyte.sdk.cli.Main achievement adminGetAchievement \
    --achievementCode 'JCRYjtPR' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 6 'AdminGetAchievement' test.out

#- 7 AdminUpdateAchievement
./ng net.accelbyte.sdk.cli.Main achievement adminUpdateAchievement \
    --achievementCode '0vSu4hMH' \
    --namespace "$AB_NAMESPACE" \
    --body '{"customAttributes": {"wnwxhV9g": {}, "7DmKOMYe": {}, "wPQygJWR": {}}, "defaultLanguage": "M7lgszW5", "description": {"RE7hnowD": "Uz5hMTq0", "gDfuX4lg": "L3tZvMNP", "4SwANHDx": "fHhCq6tE"}, "global": false, "goalValue": 0.33976652970815113, "hidden": false, "incremental": false, "lockedIcons": [{"slug": "rAZugZX0", "url": "SwSPl4CG"}, {"slug": "qrAqlFvP", "url": "vRvVEPnA"}, {"slug": "g8f0gqwU", "url": "H1LlXarx"}], "name": {"FqkrwwWr": "AA1TaW9e", "hrlaIdtT": "3IEDbUxz", "B7yZiTVO": "AOvo9f19"}, "statCode": "kpqIBtxX", "tags": ["TOxHGr46", "6oP3WZi9", "Qgv4sCSi"], "unlockedIcons": [{"slug": "s4tACCoa", "url": "KrjxfDUb"}, {"slug": "34rVqSUt", "url": "9xAgmtdX"}, {"slug": "NEc0urT7", "url": "DYknwLL0"}]}' \
    > test.out 2>&1
eval_tap $? 7 'AdminUpdateAchievement' test.out

#- 8 AdminDeleteAchievement
./ng net.accelbyte.sdk.cli.Main achievement adminDeleteAchievement \
    --achievementCode '5153fbGk' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 8 'AdminDeleteAchievement' test.out

#- 9 AdminUpdateAchievementListOrder
./ng net.accelbyte.sdk.cli.Main achievement adminUpdateAchievementListOrder \
    --achievementCode 'Ae5mzSKJ' \
    --namespace "$AB_NAMESPACE" \
    --body '{"targetOrder": 10}' \
    > test.out 2>&1
eval_tap $? 9 'AdminUpdateAchievementListOrder' test.out

#- 10 AdminListGlobalAchievements
./ng net.accelbyte.sdk.cli.Main achievement adminListGlobalAchievements \
    --namespace "$AB_NAMESPACE" \
    --achievementCodes 'isltblvA' \
    --limit '23' \
    --offset '45' \
    --sortBy 'lcQUnwt2' \
    --status 'buiE3o8Q' \
    --tags 'HRdOOHLY,Zuh8jd3b,lHIkzxgL' \
    > test.out 2>&1
eval_tap $? 10 'AdminListGlobalAchievements' test.out

#- 11 AdminListGlobalAchievementContributors
./ng net.accelbyte.sdk.cli.Main achievement adminListGlobalAchievementContributors \
    --achievementCode 'ibtofU1T' \
    --namespace "$AB_NAMESPACE" \
    --limit '76' \
    --offset '52' \
    --sortBy 'Dij5T1qC' \
    > test.out 2>&1
eval_tap $? 11 'AdminListGlobalAchievementContributors' test.out

#- 12 ResetGlobalAchievement
./ng net.accelbyte.sdk.cli.Main achievement resetGlobalAchievement \
    --achievementCode 'cJ9du9gE' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 12 'ResetGlobalAchievement' test.out

#- 13 AdminListTags
./ng net.accelbyte.sdk.cli.Main achievement adminListTags \
    --namespace "$AB_NAMESPACE" \
    --limit '24' \
    --name 'HPMVPUlo' \
    --offset '98' \
    --sortBy 'NHyqyhzH' \
    > test.out 2>&1
eval_tap $? 13 'AdminListTags' test.out

#- 14 AdminListUserAchievements
./ng net.accelbyte.sdk.cli.Main achievement adminListUserAchievements \
    --namespace "$AB_NAMESPACE" \
    --userId '4lree1Jx' \
    --limit '13' \
    --offset '21' \
    --preferUnlocked  \
    --sortBy 'V3K9WAFi' \
    --tags 'TtL8JQJK,FAhSaRGD,mdRKYhsX' \
    > test.out 2>&1
eval_tap $? 14 'AdminListUserAchievements' test.out

#- 15 AdminResetAchievement
./ng net.accelbyte.sdk.cli.Main achievement adminResetAchievement \
    --achievementCode 'kiHtpemZ' \
    --namespace "$AB_NAMESPACE" \
    --userId 'RTDEJsjm' \
    > test.out 2>&1
eval_tap $? 15 'AdminResetAchievement' test.out

#- 16 AdminUnlockAchievement
./ng net.accelbyte.sdk.cli.Main achievement adminUnlockAchievement \
    --achievementCode 'QTJHl0sH' \
    --namespace "$AB_NAMESPACE" \
    --userId '84ranR6P' \
    > test.out 2>&1
eval_tap $? 16 'AdminUnlockAchievement' test.out

#- 17 AdminAnonymizeUserAchievement
./ng net.accelbyte.sdk.cli.Main achievement adminAnonymizeUserAchievement \
    --namespace "$AB_NAMESPACE" \
    --userId 'PBmsg6es' \
    > test.out 2>&1
eval_tap $? 17 'AdminAnonymizeUserAchievement' test.out

#- 18 AdminListUserContributions
./ng net.accelbyte.sdk.cli.Main achievement adminListUserContributions \
    --namespace "$AB_NAMESPACE" \
    --userId 'PpduTC2S' \
    --achievementCodes '3zC4MHkk' \
    --limit '58' \
    --offset '65' \
    --sortBy '5m3XL23m' \
    --tags 'T5SBAwuj,jMUS0U6B,r0PZsN30' \
    > test.out 2>&1
eval_tap $? 18 'AdminListUserContributions' test.out

#- 19 PublicListAchievements
./ng net.accelbyte.sdk.cli.Main achievement publicListAchievements \
    --namespace "$AB_NAMESPACE" \
    --global  \
    --limit '14' \
    --offset '56' \
    --sortBy 'listOrder:asc' \
    --tags 'l8lWtNH1,bf4PqOvM,XhEfjGAs' \
    --language 'IvPJZWWS' \
    > test.out 2>&1
eval_tap $? 19 'PublicListAchievements' test.out

#- 20 PublicGetAchievement
./ng net.accelbyte.sdk.cli.Main achievement publicGetAchievement \
    --achievementCode 'Vhqp86be' \
    --namespace "$AB_NAMESPACE" \
    --language 'f3tZBIoC' \
    > test.out 2>&1
eval_tap $? 20 'PublicGetAchievement' test.out

#- 21 PublicListGlobalAchievements
./ng net.accelbyte.sdk.cli.Main achievement publicListGlobalAchievements \
    --namespace "$AB_NAMESPACE" \
    --achievementCodes 'yOxnONV5' \
    --limit '27' \
    --offset '51' \
    --sortBy 'zRsk91Tn' \
    --status 'YFKiJw0H' \
    --tags 'sjOQ1ono,GLZoLTFU,Izsp3cVr' \
    > test.out 2>&1
eval_tap $? 21 'PublicListGlobalAchievements' test.out

#- 22 ListGlobalAchievementContributors
./ng net.accelbyte.sdk.cli.Main achievement listGlobalAchievementContributors \
    --achievementCode '3IN5aiIp' \
    --namespace "$AB_NAMESPACE" \
    --limit '48' \
    --offset '47' \
    --sortBy 'GVzbfsID' \
    > test.out 2>&1
eval_tap $? 22 'ListGlobalAchievementContributors' test.out

#- 23 PublicListTags
./ng net.accelbyte.sdk.cli.Main achievement publicListTags \
    --namespace "$AB_NAMESPACE" \
    --limit '15' \
    --name 'XEfDhb5c' \
    --offset '79' \
    --sortBy '0MAl1dje' \
    > test.out 2>&1
eval_tap $? 23 'PublicListTags' test.out

#- 24 PublicListUserAchievements
./ng net.accelbyte.sdk.cli.Main achievement publicListUserAchievements \
    --namespace "$AB_NAMESPACE" \
    --userId 'V7sLgWnu' \
    --limit '89' \
    --offset '89' \
    --preferUnlocked  \
    --sortBy 'aCDYHoAj' \
    --tags 'UBYecfOI,TmWMtzkl,ZmBi5c6N' \
    > test.out 2>&1
eval_tap $? 24 'PublicListUserAchievements' test.out

#- 25 PublicUnlockAchievement
./ng net.accelbyte.sdk.cli.Main achievement publicUnlockAchievement \
    --achievementCode '6DSsX6R7' \
    --namespace "$AB_NAMESPACE" \
    --userId 'DPsSbNAW' \
    > test.out 2>&1
eval_tap $? 25 'PublicUnlockAchievement' test.out

#- 26 ListUserContributions
./ng net.accelbyte.sdk.cli.Main achievement listUserContributions \
    --namespace "$AB_NAMESPACE" \
    --userId '2ngpFToa' \
    --achievementCodes 'JaOnBPhD' \
    --limit '65' \
    --offset '60' \
    --sortBy 'bBuoCy8e' \
    --tags 'UM8yr27z,6IIMJo1E,qZcwzhRC' \
    > test.out 2>&1
eval_tap $? 26 'ListUserContributions' test.out

#- 27 ClaimGlobalAchievementReward
./ng net.accelbyte.sdk.cli.Main achievement claimGlobalAchievementReward \
    --achievementCode 'AJuD6nVE' \
    --namespace "$AB_NAMESPACE" \
    --userId 'N2d0Y5lu' \
    > test.out 2>&1
eval_tap $? 27 'ClaimGlobalAchievementReward' test.out


rm -f "tmp.dat"

exit $EXIT_CODE