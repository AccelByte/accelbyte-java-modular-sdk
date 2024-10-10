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
    --limit '47' \
    --offset '15' \
    --sortBy 'createdAt:asc' \
    --tags 'pNey3ti6,qJc6V9Ol,GJVwUa9g' \
    > test.out 2>&1
eval_tap $? 2 'AdminListAchievements' test.out

#- 3 AdminCreateNewAchievement
./ng net.accelbyte.sdk.cli.Main achievement adminCreateNewAchievement \
    --namespace "$AB_NAMESPACE" \
    --body '{"achievementCode": "MypvnKzr", "customAttributes": {"oirOdvvc": {}, "R1lG6HEZ": {}, "CbkasJmR": {}}, "defaultLanguage": "A308a868", "description": {"P4Xpqw4u": "9eR1SroV", "WLx2d1a9": "r47nUhOx", "39TLJB3K": "z7HiNRH6"}, "global": false, "goalValue": 0.8155374747858567, "hidden": false, "incremental": true, "lockedIcons": [{"slug": "jaruT36e", "url": "zj32kUpn"}, {"slug": "jb8SfyAe", "url": "tAAlvK6c"}, {"slug": "Gx0jKz0d", "url": "mlZShl9A"}], "name": {"CNQrh0QH": "0Z5MgP43", "jfrhcM9n": "Qf3RBvzP", "S7i0KcAg": "8rYQrKgJ"}, "statCode": "QEWCe0Gj", "tags": ["pyKzKjfK", "yog5nAv4", "UOcRFXOC"], "unlockedIcons": [{"slug": "lkonbURc", "url": "vhe9AB7k"}, {"slug": "oFz2JtiT", "url": "DEuR9JOA"}, {"slug": "oA22LZHM", "url": "tgWfstNj"}]}' \
    > test.out 2>&1
eval_tap $? 3 'AdminCreateNewAchievement' test.out

#- 4 ExportAchievements
./ng net.accelbyte.sdk.cli.Main achievement exportAchievements \
    --namespace "$AB_NAMESPACE" \
    --tags 'UF0qfdsw,7SdLJSUa,MLRJnLzs' \
    > test.out 2>&1
eval_tap $? 4 'ExportAchievements' test.out

#- 5 ImportAchievements
./ng net.accelbyte.sdk.cli.Main achievement importAchievements \
    --namespace "$AB_NAMESPACE" \
    --file 'tmp.dat' \
    --strategy '8Se9iNYE' \
    > test.out 2>&1
eval_tap $? 5 'ImportAchievements' test.out

#- 6 AdminGetAchievement
./ng net.accelbyte.sdk.cli.Main achievement adminGetAchievement \
    --achievementCode 'QqisyD4x' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 6 'AdminGetAchievement' test.out

#- 7 AdminUpdateAchievement
./ng net.accelbyte.sdk.cli.Main achievement adminUpdateAchievement \
    --achievementCode '3rBbkHCi' \
    --namespace "$AB_NAMESPACE" \
    --body '{"customAttributes": {"Hsw3pJ9c": {}, "oTARN0p6": {}, "v5iY0eLl": {}}, "defaultLanguage": "xtE0oqCb", "description": {"oCssm3Cn": "uVeBBp5L", "s5r650BO": "Ql9zmZsM", "ORUktmtS": "fvQJOFzY"}, "global": false, "goalValue": 0.4663971740072733, "hidden": false, "incremental": true, "lockedIcons": [{"slug": "IGyXsXZv", "url": "cxtNxvba"}, {"slug": "txdOopFG", "url": "ydkaeadL"}, {"slug": "wVLJBk7n", "url": "zaGO9teb"}], "name": {"iIYPcEel": "teOOzSoT", "tYaowQNP": "AyCbUEEe", "73bW5Wve": "RAFS2nTq"}, "statCode": "tUOZPhRL", "tags": ["x3CeATeU", "63eWFnWR", "LkQPqbG8"], "unlockedIcons": [{"slug": "Y1wYZKHW", "url": "LA4xID8r"}, {"slug": "VB59GXoV", "url": "xoqWtx8v"}, {"slug": "iSsQJezl", "url": "C3pAOZII"}]}' \
    > test.out 2>&1
eval_tap $? 7 'AdminUpdateAchievement' test.out

#- 8 AdminDeleteAchievement
./ng net.accelbyte.sdk.cli.Main achievement adminDeleteAchievement \
    --achievementCode 'YQNMddh8' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 8 'AdminDeleteAchievement' test.out

#- 9 AdminUpdateAchievementListOrder
./ng net.accelbyte.sdk.cli.Main achievement adminUpdateAchievementListOrder \
    --achievementCode 'HgiiU0tS' \
    --namespace "$AB_NAMESPACE" \
    --body '{"targetOrder": 23}' \
    > test.out 2>&1
eval_tap $? 9 'AdminUpdateAchievementListOrder' test.out

#- 10 AdminListGlobalAchievements
./ng net.accelbyte.sdk.cli.Main achievement adminListGlobalAchievements \
    --namespace "$AB_NAMESPACE" \
    --achievementCodes 'hGeZjdaX' \
    --limit '92' \
    --offset '84' \
    --sortBy 'XpoIB8tT' \
    --status 'hPD2G8jx' \
    --tags 'iTT3uANz,Y5ZdEaTj,sdyTPnzW' \
    > test.out 2>&1
eval_tap $? 10 'AdminListGlobalAchievements' test.out

#- 11 AdminListGlobalAchievementContributors
./ng net.accelbyte.sdk.cli.Main achievement adminListGlobalAchievementContributors \
    --achievementCode 'J0zeZADB' \
    --namespace "$AB_NAMESPACE" \
    --limit '45' \
    --offset '3' \
    --sortBy 'ELtJdkG9' \
    > test.out 2>&1
eval_tap $? 11 'AdminListGlobalAchievementContributors' test.out

#- 12 ResetGlobalAchievement
./ng net.accelbyte.sdk.cli.Main achievement resetGlobalAchievement \
    --achievementCode '2lBxJGDn' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 12 'ResetGlobalAchievement' test.out

#- 13 BulkCreatePSNEvent
./ng net.accelbyte.sdk.cli.Main achievement bulkCreatePSNEvent \
    --namespace "$AB_NAMESPACE" \
    --body '{"data": [{"events": [{"dateTime": "r11djyVF", "eventData": {"eventName": "ZdcBm0OS", "properties": {"FxBHyg8W": {}, "TPGAvmK4": {}, "VArNvIV4": {}}}, "eventId": "kVLKRriK", "version": "MCrpb0jR"}, {"dateTime": "bsIEkS77", "eventData": {"eventName": "1sRPbos5", "properties": {"wXuNE6WM": {}, "DsyCa56F": {}, "eYKqm3NW": {}}}, "eventId": "JoXk9vpI", "version": "oOKemHzK"}, {"dateTime": "SMGqO92B", "eventData": {"eventName": "D0XDahfu", "properties": {"XF4I3aMZ": {}, "fi3KtPZA": {}, "kNTiGnLx": {}}}, "eventId": "0rN1ZO02", "version": "TMUetzPw"}], "thirdPartyUserId": "gpVkMDtB", "userId": "9MGuWAEX"}, {"events": [{"dateTime": "LLWkCY4b", "eventData": {"eventName": "Wta3So0f", "properties": {"zh7mnOxV": {}, "vGBTy9t0": {}, "V6L2BOlz": {}}}, "eventId": "tKtP72hI", "version": "tvke48vs"}, {"dateTime": "vihCZBDq", "eventData": {"eventName": "BMk6fuO1", "properties": {"n6gZp6LL": {}, "X2co5jcI": {}, "YCvpxRMu": {}}}, "eventId": "0unuKU6j", "version": "fkqDyBQD"}, {"dateTime": "BB1eSGrW", "eventData": {"eventName": "SLwdV6xp", "properties": {"lhF4QWzU": {}, "EUnezBI9": {}, "Tv61DFBQ": {}}}, "eventId": "VtVO6V3X", "version": "wyk1O4nC"}], "thirdPartyUserId": "37Pa4MiX", "userId": "HKcY7qVU"}, {"events": [{"dateTime": "sX3AlEq8", "eventData": {"eventName": "v9poifxL", "properties": {"ZTVl9mTD": {}, "FZ0XOaOn": {}, "mbgmGk65": {}}}, "eventId": "SOuXmPMB", "version": "acquJ6NC"}, {"dateTime": "lg2qlgZt", "eventData": {"eventName": "jAdCHFpo", "properties": {"BFxUHuYz": {}, "uCYF6Hgu": {}, "04268yBI": {}}}, "eventId": "hgoEIf7R", "version": "zzMRDt7r"}, {"dateTime": "d7bDXd1i", "eventData": {"eventName": "TTdGdeA7", "properties": {"CVGViAFH": {}, "ajmgYQ4C": {}, "ySv3zbor": {}}}, "eventId": "yuqpcfee", "version": "oARbeYzJ"}], "thirdPartyUserId": "yCR5Hzkj", "userId": "H4cOpKe5"}]}' \
    > test.out 2>&1
eval_tap $? 13 'BulkCreatePSNEvent' test.out

#- 14 AdminListTags
./ng net.accelbyte.sdk.cli.Main achievement adminListTags \
    --namespace "$AB_NAMESPACE" \
    --limit '86' \
    --name 'hUNc8Ogw' \
    --offset '74' \
    --sortBy '3wF6MlOV' \
    > test.out 2>&1
eval_tap $? 14 'AdminListTags' test.out

#- 15 AdminListUserAchievements
./ng net.accelbyte.sdk.cli.Main achievement adminListUserAchievements \
    --namespace "$AB_NAMESPACE" \
    --userId 'VElzB6kW' \
    --limit '81' \
    --offset '82' \
    --preferUnlocked  \
    --sortBy 'g0rAFTCu' \
    --tags 'uyFljG2U,n86wWlu7,lGgKHvjt' \
    > test.out 2>&1
eval_tap $? 15 'AdminListUserAchievements' test.out

#- 16 AdminResetAchievement
./ng net.accelbyte.sdk.cli.Main achievement adminResetAchievement \
    --achievementCode 'bPzvHOpf' \
    --namespace "$AB_NAMESPACE" \
    --userId 'JJMMpUnv' \
    > test.out 2>&1
eval_tap $? 16 'AdminResetAchievement' test.out

#- 17 AdminUnlockAchievement
./ng net.accelbyte.sdk.cli.Main achievement adminUnlockAchievement \
    --achievementCode 'vbitBFXx' \
    --namespace "$AB_NAMESPACE" \
    --userId 'eKgx5S2c' \
    > test.out 2>&1
eval_tap $? 17 'AdminUnlockAchievement' test.out

#- 18 AdminAnonymizeUserAchievement
./ng net.accelbyte.sdk.cli.Main achievement adminAnonymizeUserAchievement \
    --namespace "$AB_NAMESPACE" \
    --userId 't8hfEGxv' \
    > test.out 2>&1
eval_tap $? 18 'AdminAnonymizeUserAchievement' test.out

#- 19 AdminListUserContributions
./ng net.accelbyte.sdk.cli.Main achievement adminListUserContributions \
    --namespace "$AB_NAMESPACE" \
    --userId '8MJlVrFn' \
    --achievementCodes 'H75FeykT' \
    --limit '18' \
    --offset '61' \
    --sortBy '6TU54B1N' \
    --tags 'ar1QDtn2,uOyv4H3d,M7cELCqR' \
    > test.out 2>&1
eval_tap $? 19 'AdminListUserContributions' test.out

#- 20 PublicListAchievements
./ng net.accelbyte.sdk.cli.Main achievement publicListAchievements \
    --namespace "$AB_NAMESPACE" \
    --global  \
    --limit '100' \
    --offset '7' \
    --sortBy 'listOrder:asc' \
    --tags 'au2mASGa,5jJw3fO7,u1QIeK2U' \
    --language 'qJBUW3gj' \
    > test.out 2>&1
eval_tap $? 20 'PublicListAchievements' test.out

#- 21 PublicGetAchievement
./ng net.accelbyte.sdk.cli.Main achievement publicGetAchievement \
    --achievementCode 'pP1IPoJI' \
    --namespace "$AB_NAMESPACE" \
    --language '59UBnUVb' \
    > test.out 2>&1
eval_tap $? 21 'PublicGetAchievement' test.out

#- 22 PublicListGlobalAchievements
./ng net.accelbyte.sdk.cli.Main achievement publicListGlobalAchievements \
    --namespace "$AB_NAMESPACE" \
    --achievementCodes '81y5it8w' \
    --limit '35' \
    --offset '84' \
    --sortBy 'YlOxbsGC' \
    --status 'uwFbh4rM' \
    --tags 'kyQVq9db,zZNvPbKy,crRaevZC' \
    > test.out 2>&1
eval_tap $? 22 'PublicListGlobalAchievements' test.out

#- 23 ListGlobalAchievementContributors
./ng net.accelbyte.sdk.cli.Main achievement listGlobalAchievementContributors \
    --achievementCode 'FZaFPtca' \
    --namespace "$AB_NAMESPACE" \
    --limit '23' \
    --offset '33' \
    --sortBy 'KJqrqsaD' \
    > test.out 2>&1
eval_tap $? 23 'ListGlobalAchievementContributors' test.out

#- 24 PublicListTags
./ng net.accelbyte.sdk.cli.Main achievement publicListTags \
    --namespace "$AB_NAMESPACE" \
    --limit '81' \
    --name 'ggtkHe5z' \
    --offset '10' \
    --sortBy 'ESD7riUM' \
    > test.out 2>&1
eval_tap $? 24 'PublicListTags' test.out

#- 25 PublicListUserAchievements
./ng net.accelbyte.sdk.cli.Main achievement publicListUserAchievements \
    --namespace "$AB_NAMESPACE" \
    --userId 'XboXQ3gy' \
    --limit '80' \
    --offset '52' \
    --preferUnlocked  \
    --sortBy 'yuxQ4ioe' \
    --tags 'Qoc8DdtO,rcrq5zyo,cwhcLjva' \
    > test.out 2>&1
eval_tap $? 25 'PublicListUserAchievements' test.out

#- 26 PublicUnlockAchievement
./ng net.accelbyte.sdk.cli.Main achievement publicUnlockAchievement \
    --achievementCode 'OWVhMQ9N' \
    --namespace "$AB_NAMESPACE" \
    --userId '8eyQfUsP' \
    > test.out 2>&1
eval_tap $? 26 'PublicUnlockAchievement' test.out

#- 27 ListUserContributions
./ng net.accelbyte.sdk.cli.Main achievement listUserContributions \
    --namespace "$AB_NAMESPACE" \
    --userId 'U7GLu8Ez' \
    --achievementCodes 'Gj5vrXMa' \
    --limit '62' \
    --offset '82' \
    --sortBy 'KS2jLBZF' \
    --tags 'VzB9Ed1T,IVD30XMa,2la225NV' \
    > test.out 2>&1
eval_tap $? 27 'ListUserContributions' test.out

#- 28 ClaimGlobalAchievementReward
./ng net.accelbyte.sdk.cli.Main achievement claimGlobalAchievementReward \
    --achievementCode '5hdLOEiV' \
    --namespace "$AB_NAMESPACE" \
    --userId 'ZjCEN1oY' \
    > test.out 2>&1
eval_tap $? 28 'ClaimGlobalAchievementReward' test.out


rm -f "tmp.dat"

exit $EXIT_CODE