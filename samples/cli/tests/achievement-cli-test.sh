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
echo "1..31"

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
    --limit '80' \
    --offset '91' \
    --sortBy 'createdAt:desc' \
    --tags 'VNwWbMVl,Spyyd4jg,eh7LKKvu' \
    > test.out 2>&1
eval_tap $? 2 'AdminListAchievements' test.out

#- 3 AdminCreateNewAchievement
./ng net.accelbyte.sdk.cli.Main achievement adminCreateNewAchievement \
    --namespace "$AB_NAMESPACE" \
    --body '{"achievementCode": "y7mAaatJ", "customAttributes": {"CiGKukMD": {}, "8s0HEVFs": {}, "OyixIg9H": {}}, "defaultLanguage": "PrbAtbq8", "description": {"wpgf8vYY": "93dXWrKe", "2s8NSWAq": "WEFmJqIg", "E6dbsQ8s": "22sDXdug"}, "global": false, "goalValue": 0.20026258968382682, "hidden": false, "incremental": true, "lockedIcons": [{"slug": "riMjtn6r", "url": "03K05DJF"}, {"slug": "EcQSapIM", "url": "rHkIEWLi"}, {"slug": "xemIgAC9", "url": "h926kUEL"}], "name": {"makrtV9D": "eGXItdM9", "RQ3pZzAJ": "52h9YcsE", "l4zeoZK3": "qTszst2I"}, "statCode": "VUsPn1N4", "tags": ["JCFMVIvC", "4TO5ziYQ", "nPHcF9YU"], "unlockedIcons": [{"slug": "AUy4yYS9", "url": "jBmNWPIq"}, {"slug": "PGTG0M4e", "url": "DGfzQSa8"}, {"slug": "UE9pB0LB", "url": "pwHhdJwK"}]}' \
    > test.out 2>&1
eval_tap $? 3 'AdminCreateNewAchievement' test.out

#- 4 ExportAchievements
./ng net.accelbyte.sdk.cli.Main achievement exportAchievements \
    --namespace "$AB_NAMESPACE" \
    --tags 'AOBdlkrK,vXA49ImV,aR1kheza' \
    > test.out 2>&1
eval_tap $? 4 'ExportAchievements' test.out

#- 5 ImportAchievements
./ng net.accelbyte.sdk.cli.Main achievement importAchievements \
    --namespace "$AB_NAMESPACE" \
    --file 'tmp.dat' \
    --strategy 'HOC6wQOU' \
    > test.out 2>&1
eval_tap $? 5 'ImportAchievements' test.out

#- 6 AdminGetAchievement
./ng net.accelbyte.sdk.cli.Main achievement adminGetAchievement \
    --achievementCode 'hcifVedr' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 6 'AdminGetAchievement' test.out

#- 7 AdminUpdateAchievement
./ng net.accelbyte.sdk.cli.Main achievement adminUpdateAchievement \
    --achievementCode 'UKaYAe1p' \
    --namespace "$AB_NAMESPACE" \
    --body '{"customAttributes": {"I1dm3qKa": {}, "PvTINvRa": {}, "5QMU9UJc": {}}, "defaultLanguage": "qRWLS6sN", "description": {"rD98EGG8": "Xzsujyzi", "RL3LpnHC": "30ddJkOb", "f1pHgR1t": "HTVIAY2Y"}, "global": true, "goalValue": 0.9235129826340317, "hidden": false, "incremental": false, "lockedIcons": [{"slug": "sKlbxg6W", "url": "vYLi4Bgk"}, {"slug": "XxOrRGQl", "url": "tEksjzuK"}, {"slug": "lmoa1WZf", "url": "y46ZoL0A"}], "name": {"Vq02dgyP": "PwyxeA2r", "ClzyRT9W": "QAI0yDAz", "vX08dfwP": "lL82RTRy"}, "statCode": "vE7C82Ko", "tags": ["F7btJbaE", "ZNHIFFYB", "Hy7JwMFX"], "unlockedIcons": [{"slug": "LAEmwtAf", "url": "4YYi87HS"}, {"slug": "lyRgzYd3", "url": "9pX8T9E7"}, {"slug": "YmOcwrBJ", "url": "SfEafP8y"}]}' \
    > test.out 2>&1
eval_tap $? 7 'AdminUpdateAchievement' test.out

#- 8 AdminDeleteAchievement
./ng net.accelbyte.sdk.cli.Main achievement adminDeleteAchievement \
    --achievementCode 'c5ethCMA' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 8 'AdminDeleteAchievement' test.out

#- 9 AdminUpdateAchievementListOrder
./ng net.accelbyte.sdk.cli.Main achievement adminUpdateAchievementListOrder \
    --achievementCode '2D800j5j' \
    --namespace "$AB_NAMESPACE" \
    --body '{"targetOrder": 66}' \
    > test.out 2>&1
eval_tap $? 9 'AdminUpdateAchievementListOrder' test.out

#- 10 AdminListGlobalAchievements
./ng net.accelbyte.sdk.cli.Main achievement adminListGlobalAchievements \
    --namespace "$AB_NAMESPACE" \
    --achievementCodes 'R0TH9xTD' \
    --limit '77' \
    --offset '59' \
    --sortBy 'achievedAt:desc' \
    --status 'Iz1qtAbE' \
    --tags 'yp2BVfbP,Llf1GYap,9ApBx9jz' \
    > test.out 2>&1
eval_tap $? 10 'AdminListGlobalAchievements' test.out

#- 11 AdminListGlobalAchievementContributors
./ng net.accelbyte.sdk.cli.Main achievement adminListGlobalAchievementContributors \
    --achievementCode 'Q9G1kg2y' \
    --namespace "$AB_NAMESPACE" \
    --limit '73' \
    --offset '24' \
    --sortBy 'contributedValue:asc' \
    > test.out 2>&1
eval_tap $? 11 'AdminListGlobalAchievementContributors' test.out

#- 12 ResetGlobalAchievement
./ng net.accelbyte.sdk.cli.Main achievement resetGlobalAchievement \
    --achievementCode 'NEK1agi6' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 12 'ResetGlobalAchievement' test.out

#- 13 BulkCreatePSNEvent
./ng net.accelbyte.sdk.cli.Main achievement bulkCreatePSNEvent \
    --namespace "$AB_NAMESPACE" \
    --body '{"data": [{"events": [{"dateTime": "uJesOu9f", "eventData": {"eventName": "ZxwJ12q3", "properties": {"o8ICPXal": {}, "H4EaMjsL": {}, "HrQ3ZJ4s": {}}}, "eventId": "3pf9ZSlA", "version": "YTwKO1n4"}, {"dateTime": "VSXFcGa0", "eventData": {"eventName": "589jcPi9", "properties": {"d0WLlatF": {}, "wPG9Uyho": {}, "4HP47c1Y": {}}}, "eventId": "RDfOo7iz", "version": "CdJMVEup"}, {"dateTime": "7l82hhf5", "eventData": {"eventName": "NTSLM29y", "properties": {"UIB9aw67": {}, "URCXb3i7": {}, "3yhlVnx0": {}}}, "eventId": "hONJ0cUa", "version": "ou3OzpZk"}], "thirdPartyUserId": "7fr2pkmg", "userId": "S0zN4hTi"}, {"events": [{"dateTime": "ppbaxGKh", "eventData": {"eventName": "N0Sq75xd", "properties": {"yoaFEGkI": {}, "63RQsb3q": {}, "MlrkCjOD": {}}}, "eventId": "S7YOZC0V", "version": "8Sko3z1x"}, {"dateTime": "QY1tB4Uu", "eventData": {"eventName": "f7UK6Cvb", "properties": {"V1qN0tqz": {}, "28i8DICx": {}, "JViQ7ywu": {}}}, "eventId": "GIyTyfwS", "version": "tNbnF1zA"}, {"dateTime": "RDo4OjTk", "eventData": {"eventName": "d2WBKL0I", "properties": {"Cp3HKQ0P": {}, "7n1frXiW": {}, "meHjVZV8": {}}}, "eventId": "uD7XSzQs", "version": "mfP9SSua"}], "thirdPartyUserId": "6SRrWee8", "userId": "WVC2i6Vv"}, {"events": [{"dateTime": "JmchYath", "eventData": {"eventName": "2Yhk5fFg", "properties": {"lofJPZs6": {}, "DYonMvrb": {}, "FXVRqTna": {}}}, "eventId": "U5B5w6RI", "version": "A4kV25Kw"}, {"dateTime": "ToCN2KOu", "eventData": {"eventName": "sYA25gWV", "properties": {"Ubpu6MEp": {}, "b93Ktihd": {}, "vDeeDyw5": {}}}, "eventId": "S5JOC6rY", "version": "OjAxB14J"}, {"dateTime": "0CxQUI7t", "eventData": {"eventName": "PTPZ2RdK", "properties": {"32OCEqr4": {}, "dE8k4nvs": {}, "jJwZiijB": {}}}, "eventId": "uggdXvwh", "version": "7RowM36A"}], "thirdPartyUserId": "fqQuWm7V", "userId": "uQttF2p2"}]}' \
    > test.out 2>&1
eval_tap $? 13 'BulkCreatePSNEvent' test.out

#- 14 AdminListTags
./ng net.accelbyte.sdk.cli.Main achievement adminListTags \
    --namespace "$AB_NAMESPACE" \
    --limit '92' \
    --name '67dQRy9c' \
    --offset '23' \
    --sortBy 'name' \
    > test.out 2>&1
eval_tap $? 14 'AdminListTags' test.out

#- 15 AdminListUserAchievements
./ng net.accelbyte.sdk.cli.Main achievement adminListUserAchievements \
    --namespace "$AB_NAMESPACE" \
    --userId 'TNDCH40V' \
    --limit '87' \
    --offset '65' \
    --preferUnlocked  \
    --sortBy 'achievedAt:desc' \
    --tags 'xSqWhYUy,rNSD7i13,xyWwPuHy' \
    > test.out 2>&1
eval_tap $? 15 'AdminListUserAchievements' test.out

#- 16 AdminBatchQueryUserAchievements
./ng net.accelbyte.sdk.cli.Main achievement adminBatchQueryUserAchievements \
    --namespace "$AB_NAMESPACE" \
    --userId 'sFIlcnv6' \
    --body '{"codes": ["Ikq5OlVX", "wJyNWUHP", "mOdq0VD9"], "status": 51}' \
    > test.out 2>&1
eval_tap $? 16 'AdminBatchQueryUserAchievements' test.out

#- 17 AdminBulkUnlockAchievement
./ng net.accelbyte.sdk.cli.Main achievement adminBulkUnlockAchievement \
    --namespace "$AB_NAMESPACE" \
    --userId 'sHRvssSz' \
    --body '{"achievementCodes": ["MRDNu7i0", "HzobXtPa", "SdSErSNn"]}' \
    > test.out 2>&1
eval_tap $? 17 'AdminBulkUnlockAchievement' test.out

#- 18 AdminResetAchievement
./ng net.accelbyte.sdk.cli.Main achievement adminResetAchievement \
    --achievementCode 'R6tDH8Qe' \
    --namespace "$AB_NAMESPACE" \
    --userId 'H5mBT6zF' \
    > test.out 2>&1
eval_tap $? 18 'AdminResetAchievement' test.out

#- 19 AdminUnlockAchievement
./ng net.accelbyte.sdk.cli.Main achievement adminUnlockAchievement \
    --achievementCode 'EufgI8FU' \
    --namespace "$AB_NAMESPACE" \
    --userId '3hjvUEVb' \
    > test.out 2>&1
eval_tap $? 19 'AdminUnlockAchievement' test.out

#- 20 AdminAnonymizeUserAchievement
./ng net.accelbyte.sdk.cli.Main achievement adminAnonymizeUserAchievement \
    --namespace "$AB_NAMESPACE" \
    --userId 'hAd9K4Dh' \
    > test.out 2>&1
eval_tap $? 20 'AdminAnonymizeUserAchievement' test.out

#- 21 AdminListUserContributions
./ng net.accelbyte.sdk.cli.Main achievement adminListUserContributions \
    --namespace "$AB_NAMESPACE" \
    --userId 'LGoQnxzV' \
    --achievementCodes '0Nn8d7OY' \
    --limit '2' \
    --offset '99' \
    --sortBy 'contributedValue:asc' \
    --tags 'dHAmv2ZX,GcfQXW1V,CNR3dVXK' \
    > test.out 2>&1
eval_tap $? 21 'AdminListUserContributions' test.out

#- 22 PublicListAchievements
./ng net.accelbyte.sdk.cli.Main achievement publicListAchievements \
    --namespace "$AB_NAMESPACE" \
    --global  \
    --limit '44' \
    --offset '80' \
    --sortBy 'createdAt:asc' \
    --tags 'YyLQjYXq,LQAV9NI9,qKvuIrkB' \
    --language 'K0P5gcwN' \
    > test.out 2>&1
eval_tap $? 22 'PublicListAchievements' test.out

#- 23 PublicGetAchievement
./ng net.accelbyte.sdk.cli.Main achievement publicGetAchievement \
    --achievementCode 'yb0ybsJk' \
    --namespace "$AB_NAMESPACE" \
    --language 'pyhPQm86' \
    > test.out 2>&1
eval_tap $? 23 'PublicGetAchievement' test.out

#- 24 PublicListGlobalAchievements
./ng net.accelbyte.sdk.cli.Main achievement publicListGlobalAchievements \
    --namespace "$AB_NAMESPACE" \
    --achievementCodes 'azqhlxvA' \
    --limit '42' \
    --offset '94' \
    --sortBy 'createdAt:desc' \
    --status 'ivfQWMWo' \
    --tags 'SnXLhFjB,WxO34UhH,pllDAv5v' \
    > test.out 2>&1
eval_tap $? 24 'PublicListGlobalAchievements' test.out

#- 25 ListGlobalAchievementContributors
./ng net.accelbyte.sdk.cli.Main achievement listGlobalAchievementContributors \
    --achievementCode 'sn2dutQY' \
    --namespace "$AB_NAMESPACE" \
    --limit '17' \
    --offset '95' \
    --sortBy 'contributedValue:asc' \
    > test.out 2>&1
eval_tap $? 25 'ListGlobalAchievementContributors' test.out

#- 26 PublicListTags
./ng net.accelbyte.sdk.cli.Main achievement publicListTags \
    --namespace "$AB_NAMESPACE" \
    --limit '14' \
    --name 'EYTe9xSr' \
    --offset '83' \
    --sortBy 'createdAt:asc' \
    > test.out 2>&1
eval_tap $? 26 'PublicListTags' test.out

#- 27 PublicListUserAchievements
./ng net.accelbyte.sdk.cli.Main achievement publicListUserAchievements \
    --namespace "$AB_NAMESPACE" \
    --userId 'Z9zwaV2x' \
    --limit '23' \
    --offset '95' \
    --preferUnlocked  \
    --sortBy 'achievedAt:asc' \
    --tags 'lbDT0SUA,TmlvyM0K,6HnKwrkt' \
    > test.out 2>&1
eval_tap $? 27 'PublicListUserAchievements' test.out

#- 28 PublicBulkUnlockAchievement
./ng net.accelbyte.sdk.cli.Main achievement publicBulkUnlockAchievement \
    --namespace "$AB_NAMESPACE" \
    --userId 'mFxYl7qP' \
    --body '{"achievementCodes": ["9CIfclLC", "b8YxVkSk", "1lwDHcN1"]}' \
    > test.out 2>&1
eval_tap $? 28 'PublicBulkUnlockAchievement' test.out

#- 29 PublicUnlockAchievement
./ng net.accelbyte.sdk.cli.Main achievement publicUnlockAchievement \
    --achievementCode '0MlLoc4g' \
    --namespace "$AB_NAMESPACE" \
    --userId 'XBE46uYc' \
    > test.out 2>&1
eval_tap $? 29 'PublicUnlockAchievement' test.out

#- 30 ListUserContributions
./ng net.accelbyte.sdk.cli.Main achievement listUserContributions \
    --namespace "$AB_NAMESPACE" \
    --userId 'qkf2NJkN' \
    --achievementCodes 'kBvgImnY' \
    --limit '77' \
    --offset '40' \
    --sortBy 'contributedValue:asc' \
    --tags 'r9OGr3Vk,ybgtP56l,jHXkQpuw' \
    > test.out 2>&1
eval_tap $? 30 'ListUserContributions' test.out

#- 31 ClaimGlobalAchievementReward
./ng net.accelbyte.sdk.cli.Main achievement claimGlobalAchievementReward \
    --achievementCode 'y62xLgqz' \
    --namespace "$AB_NAMESPACE" \
    --userId 'nPyvhHKw' \
    > test.out 2>&1
eval_tap $? 31 'ClaimGlobalAchievementReward' test.out


rm -f "tmp.dat"

exit $EXIT_CODE