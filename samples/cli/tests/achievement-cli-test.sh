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
    --limit '27' \
    --offset '48' \
    --sortBy 'listOrder:asc' \
    --tags 'C5HkMhiJ,jcAJ8mkj,BiE4PaP4' \
    > test.out 2>&1
eval_tap $? 2 'AdminListAchievements' test.out

#- 3 AdminCreateNewAchievement
./ng net.accelbyte.sdk.cli.Main achievement adminCreateNewAchievement \
    --namespace "$AB_NAMESPACE" \
    --body '{"achievementCode": "kLr2r5ob", "customAttributes": {"nAiwzz4d": {}, "XFpiqbls": {}, "JPUjnoxT": {}}, "defaultLanguage": "fq4d6YFH", "description": {"gbhaCTtd": "ZwlEDDZB", "HpvvFb14": "jjiF0P1E", "411ACpXD": "mYbsJhZW"}, "global": false, "goalValue": 0.1386181757623226, "hidden": false, "incremental": true, "lockedIcons": [{"slug": "BQaJ9ZTG", "url": "duIupp38"}, {"slug": "3QLrB3yd", "url": "WNNztNib"}, {"slug": "LQ53l4Mh", "url": "S18QYhLE"}], "name": {"CfT8io8w": "2v24qOej", "qRyGTZV0": "vOJJmSh4", "nsWI54Ny": "3NqqxvgO"}, "statCode": "OLzIy0ON", "tags": ["A2Uvqej3", "cNTOrT3M", "ZBhJdXbj"], "unlockedIcons": [{"slug": "mgVwt4tc", "url": "uNYpJey3"}, {"slug": "hSwpeobe", "url": "TsxPiSCK"}, {"slug": "4Rw5RaHM", "url": "jfKsOJQz"}]}' \
    > test.out 2>&1
eval_tap $? 3 'AdminCreateNewAchievement' test.out

#- 4 ExportAchievements
./ng net.accelbyte.sdk.cli.Main achievement exportAchievements \
    --namespace "$AB_NAMESPACE" \
    --tags 'pvhtth20,7Ln1ISfu,rQnRBSEn' \
    > test.out 2>&1
eval_tap $? 4 'ExportAchievements' test.out

#- 5 ImportAchievements
./ng net.accelbyte.sdk.cli.Main achievement importAchievements \
    --namespace "$AB_NAMESPACE" \
    --file 'tmp.dat' \
    --strategy '0BaExELl' \
    > test.out 2>&1
eval_tap $? 5 'ImportAchievements' test.out

#- 6 AdminGetAchievement
./ng net.accelbyte.sdk.cli.Main achievement adminGetAchievement \
    --achievementCode 'ZwVOMP9H' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 6 'AdminGetAchievement' test.out

#- 7 AdminUpdateAchievement
./ng net.accelbyte.sdk.cli.Main achievement adminUpdateAchievement \
    --achievementCode 'SAPM2Wnm' \
    --namespace "$AB_NAMESPACE" \
    --body '{"customAttributes": {"476S6Kga": {}, "WP3F6VpX": {}, "YJqg8ivY": {}}, "defaultLanguage": "MjDFveeh", "description": {"NHAUhA8M": "oX2K0OFY", "JdVX1IOV": "cBge89oS", "nxtjRfYp": "CXlUXNBv"}, "global": false, "goalValue": 0.48230615392145904, "hidden": true, "incremental": false, "lockedIcons": [{"slug": "YEw4acvv", "url": "Fmgd9Gqv"}, {"slug": "FZ3xy8it", "url": "zj6KyKsM"}, {"slug": "TJ7hTGkY", "url": "XRSyV92L"}], "name": {"hL81Ccl7": "Esrb6yRv", "Dyz3bjlV": "UVpZnhWL", "lcN0hCq0": "XhmeDnHw"}, "statCode": "M74TJwUZ", "tags": ["zU67cBTS", "bSJJ8oMH", "cO17Gssx"], "unlockedIcons": [{"slug": "VrmHlQv5", "url": "abMqTOHm"}, {"slug": "4maCEmH3", "url": "WPWPK25V"}, {"slug": "OxnhWqms", "url": "F3nYqOQO"}]}' \
    > test.out 2>&1
eval_tap $? 7 'AdminUpdateAchievement' test.out

#- 8 AdminDeleteAchievement
./ng net.accelbyte.sdk.cli.Main achievement adminDeleteAchievement \
    --achievementCode 'SefTNyIP' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 8 'AdminDeleteAchievement' test.out

#- 9 AdminUpdateAchievementListOrder
./ng net.accelbyte.sdk.cli.Main achievement adminUpdateAchievementListOrder \
    --achievementCode 'aVzcqOKm' \
    --namespace "$AB_NAMESPACE" \
    --body '{"targetOrder": 69}' \
    > test.out 2>&1
eval_tap $? 9 'AdminUpdateAchievementListOrder' test.out

#- 10 AdminListGlobalAchievements
./ng net.accelbyte.sdk.cli.Main achievement adminListGlobalAchievements \
    --namespace "$AB_NAMESPACE" \
    --achievementCodes '6G9UslPr' \
    --limit '14' \
    --offset '39' \
    --sortBy 'createdAt' \
    --status 'nUnq4wka' \
    --tags 'SDT0j8Sf,MLWkhypX,i24wTenf' \
    > test.out 2>&1
eval_tap $? 10 'AdminListGlobalAchievements' test.out

#- 11 AdminListGlobalAchievementContributors
./ng net.accelbyte.sdk.cli.Main achievement adminListGlobalAchievementContributors \
    --achievementCode 'sOT7uFF2' \
    --namespace "$AB_NAMESPACE" \
    --limit '54' \
    --offset '66' \
    --sortBy 'contributedValue:asc' \
    > test.out 2>&1
eval_tap $? 11 'AdminListGlobalAchievementContributors' test.out

#- 12 ResetGlobalAchievement
./ng net.accelbyte.sdk.cli.Main achievement resetGlobalAchievement \
    --achievementCode 'FFR2zv5p' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 12 'ResetGlobalAchievement' test.out

#- 13 BulkCreatePSNEvent
./ng net.accelbyte.sdk.cli.Main achievement bulkCreatePSNEvent \
    --namespace "$AB_NAMESPACE" \
    --body '{"data": [{"events": [{"dateTime": "6vHOrug5", "eventData": {"eventName": "Aqdm2ywv", "properties": {"8L2V7EnR": {}, "thMY5b2d": {}, "DLk6NXIY": {}}}, "eventId": "xelRsQhG", "version": "z1B9EAlc"}, {"dateTime": "J4UKNGNn", "eventData": {"eventName": "bTBmizPn", "properties": {"OIGxyufH": {}, "tM9LCDaG": {}, "A1yvxGZC": {}}}, "eventId": "OfQzyCGA", "version": "1SiFl67N"}, {"dateTime": "bIhBimWU", "eventData": {"eventName": "kQ2t5UdK", "properties": {"IwX2JMCX": {}, "iewdlzhu": {}, "VWribE2f": {}}}, "eventId": "CjjcWh9V", "version": "gKev2c3z"}], "thirdPartyUserId": "ZJNd4gcH", "userId": "pCKRME3o"}, {"events": [{"dateTime": "jJVYabXz", "eventData": {"eventName": "U84OQB8k", "properties": {"HyXZzIxE": {}, "eNCaJ6vS": {}, "D3tYVjRu": {}}}, "eventId": "nCeoZrvf", "version": "srUyAWBt"}, {"dateTime": "GPxzsgRf", "eventData": {"eventName": "TuAPCvez", "properties": {"Jat9e7pe": {}, "v4HNkq4Z": {}, "dliazx5S": {}}}, "eventId": "dAe9YaD7", "version": "6s6PDXCR"}, {"dateTime": "87oBnKRN", "eventData": {"eventName": "7VY3I8MB", "properties": {"U0Shux36": {}, "n5HmQvsg": {}, "DBdSIRXB": {}}}, "eventId": "RSO3sCRH", "version": "cNnu19ce"}], "thirdPartyUserId": "YXRc5gza", "userId": "cX7J0QRR"}, {"events": [{"dateTime": "Wi0g1EOx", "eventData": {"eventName": "vX0wTReD", "properties": {"wF12uem8": {}, "yvkJfoJI": {}, "IkqDhk5Z": {}}}, "eventId": "MyiksOhA", "version": "zzJ6lDgy"}, {"dateTime": "h5dyX79R", "eventData": {"eventName": "R7SOlLYI", "properties": {"YyTk10pk": {}, "o3ksBMc6": {}, "EUWcjYtA": {}}}, "eventId": "kPwzk7Y4", "version": "NjHNiTfh"}, {"dateTime": "DgPNs89f", "eventData": {"eventName": "vU4m7PZw", "properties": {"IJotLnJR": {}, "jHn2oZ78": {}, "DTMAYtG0": {}}}, "eventId": "hpqNeI16", "version": "ge7a4LIs"}], "thirdPartyUserId": "nuo5f6ZK", "userId": "28gqxiTi"}]}' \
    > test.out 2>&1
eval_tap $? 13 'BulkCreatePSNEvent' test.out

#- 14 AdminListTags
./ng net.accelbyte.sdk.cli.Main achievement adminListTags \
    --namespace "$AB_NAMESPACE" \
    --limit '74' \
    --name 'vWyOSsD9' \
    --offset '46' \
    --sortBy 'name:asc' \
    > test.out 2>&1
eval_tap $? 14 'AdminListTags' test.out

#- 15 AdminListUserAchievements
./ng net.accelbyte.sdk.cli.Main achievement adminListUserAchievements \
    --namespace "$AB_NAMESPACE" \
    --userId 'b1QSj37V' \
    --limit '69' \
    --offset '48' \
    --preferUnlocked  \
    --sortBy 'createdAt:asc' \
    --tags 'SoNHzfIZ,aQaa2Ck7,XA6zxIEd' \
    > test.out 2>&1
eval_tap $? 15 'AdminListUserAchievements' test.out

#- 16 AdminBulkUnlockAchievement
./ng net.accelbyte.sdk.cli.Main achievement adminBulkUnlockAchievement \
    --namespace "$AB_NAMESPACE" \
    --userId 'RmG0GmrK' \
    --body '{"achievementCodes": ["KDQYh6Kw", "o8PwyKOr", "EObDvNM3"]}' \
    > test.out 2>&1
eval_tap $? 16 'AdminBulkUnlockAchievement' test.out

#- 17 AdminResetAchievement
./ng net.accelbyte.sdk.cli.Main achievement adminResetAchievement \
    --achievementCode 'iBD8Xb5Y' \
    --namespace "$AB_NAMESPACE" \
    --userId 'mTOQdiWT' \
    > test.out 2>&1
eval_tap $? 17 'AdminResetAchievement' test.out

#- 18 AdminUnlockAchievement
./ng net.accelbyte.sdk.cli.Main achievement adminUnlockAchievement \
    --achievementCode '1bYiJ8es' \
    --namespace "$AB_NAMESPACE" \
    --userId 'JWkDVd6o' \
    > test.out 2>&1
eval_tap $? 18 'AdminUnlockAchievement' test.out

#- 19 AdminAnonymizeUserAchievement
./ng net.accelbyte.sdk.cli.Main achievement adminAnonymizeUserAchievement \
    --namespace "$AB_NAMESPACE" \
    --userId 'JNVfCOgr' \
    > test.out 2>&1
eval_tap $? 19 'AdminAnonymizeUserAchievement' test.out

#- 20 AdminListUserContributions
./ng net.accelbyte.sdk.cli.Main achievement adminListUserContributions \
    --namespace "$AB_NAMESPACE" \
    --userId 'F5S8kPai' \
    --achievementCodes 'dAGfO1Hg' \
    --limit '30' \
    --offset '86' \
    --sortBy 'contributedValue:asc' \
    --tags 'jJmPdiJS,UxERVuBt,ve4HMw3I' \
    > test.out 2>&1
eval_tap $? 20 'AdminListUserContributions' test.out

#- 21 PublicListAchievements
./ng net.accelbyte.sdk.cli.Main achievement publicListAchievements \
    --namespace "$AB_NAMESPACE" \
    --global  \
    --limit '93' \
    --offset '20' \
    --sortBy 'createdAt' \
    --tags 'f5KPxHde,eqT93ZSw,w6Babaxm' \
    --language 'PloWCxyU' \
    > test.out 2>&1
eval_tap $? 21 'PublicListAchievements' test.out

#- 22 PublicGetAchievement
./ng net.accelbyte.sdk.cli.Main achievement publicGetAchievement \
    --achievementCode 'whK4OtiV' \
    --namespace "$AB_NAMESPACE" \
    --language 'MpZsbXLx' \
    > test.out 2>&1
eval_tap $? 22 'PublicGetAchievement' test.out

#- 23 PublicListGlobalAchievements
./ng net.accelbyte.sdk.cli.Main achievement publicListGlobalAchievements \
    --namespace "$AB_NAMESPACE" \
    --achievementCodes 'fFNGNUE2' \
    --limit '43' \
    --offset '64' \
    --sortBy 'createdAt:desc' \
    --status 'zCxyE1Fb' \
    --tags 'n9j110XD,r17ugYxj,4zUY1r76' \
    > test.out 2>&1
eval_tap $? 23 'PublicListGlobalAchievements' test.out

#- 24 ListGlobalAchievementContributors
./ng net.accelbyte.sdk.cli.Main achievement listGlobalAchievementContributors \
    --achievementCode 'WxIcMOqA' \
    --namespace "$AB_NAMESPACE" \
    --limit '29' \
    --offset '69' \
    --sortBy 'contributedValue:desc' \
    > test.out 2>&1
eval_tap $? 24 'ListGlobalAchievementContributors' test.out

#- 25 PublicListTags
./ng net.accelbyte.sdk.cli.Main achievement publicListTags \
    --namespace "$AB_NAMESPACE" \
    --limit '70' \
    --name 'N8OLi4R9' \
    --offset '43' \
    --sortBy 'name:asc' \
    > test.out 2>&1
eval_tap $? 25 'PublicListTags' test.out

#- 26 PublicListUserAchievements
./ng net.accelbyte.sdk.cli.Main achievement publicListUserAchievements \
    --namespace "$AB_NAMESPACE" \
    --userId 'Wu7oJUkU' \
    --limit '51' \
    --offset '67' \
    --preferUnlocked  \
    --sortBy 'achievedAt:desc' \
    --tags 'QTOJVQZO,YwJjX6IK,fa3DP1V1' \
    > test.out 2>&1
eval_tap $? 26 'PublicListUserAchievements' test.out

#- 27 PublicBulkUnlockAchievement
./ng net.accelbyte.sdk.cli.Main achievement publicBulkUnlockAchievement \
    --namespace "$AB_NAMESPACE" \
    --userId 'l7WMPP1e' \
    --body '{"achievementCodes": ["eA2FrNjo", "LqvZNEPJ", "I9YuugsZ"]}' \
    > test.out 2>&1
eval_tap $? 27 'PublicBulkUnlockAchievement' test.out

#- 28 PublicUnlockAchievement
./ng net.accelbyte.sdk.cli.Main achievement publicUnlockAchievement \
    --achievementCode 'rbo22sUI' \
    --namespace "$AB_NAMESPACE" \
    --userId '6BefpiSf' \
    > test.out 2>&1
eval_tap $? 28 'PublicUnlockAchievement' test.out

#- 29 ListUserContributions
./ng net.accelbyte.sdk.cli.Main achievement listUserContributions \
    --namespace "$AB_NAMESPACE" \
    --userId '23P4Nk51' \
    --achievementCodes 'MxQLNngu' \
    --limit '36' \
    --offset '13' \
    --sortBy 'contributedValue:asc' \
    --tags '5piaAio3,e5ul7GfD,Grsf42pk' \
    > test.out 2>&1
eval_tap $? 29 'ListUserContributions' test.out

#- 30 ClaimGlobalAchievementReward
./ng net.accelbyte.sdk.cli.Main achievement claimGlobalAchievementReward \
    --achievementCode 'QQftC2ME' \
    --namespace "$AB_NAMESPACE" \
    --userId 'V48A0XhL' \
    > test.out 2>&1
eval_tap $? 30 'ClaimGlobalAchievementReward' test.out


rm -f "tmp.dat"

exit $EXIT_CODE