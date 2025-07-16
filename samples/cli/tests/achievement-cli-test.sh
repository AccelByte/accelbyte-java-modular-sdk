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
    --limit '1' \
    --offset '22' \
    --sortBy 'updatedAt:asc' \
    --tags 'BQYqn8gW,UqqTwmIm,a2KZ5RTE' \
    > test.out 2>&1
eval_tap $? 2 'AdminListAchievements' test.out

#- 3 AdminCreateNewAchievement
./ng net.accelbyte.sdk.cli.Main achievement adminCreateNewAchievement \
    --namespace "$AB_NAMESPACE" \
    --body '{"achievementCode": "BeZJMeeG", "customAttributes": {"bQzKgA7a": {}, "9hOkHnNf": {}, "ik5ZWnfo": {}}, "defaultLanguage": "26irKNEq", "description": {"TZxljXlj": "tgOjuR2J", "YVV6EwsT": "nfS3eAV6", "VfLsPy2H": "Iie62cGN"}, "global": true, "goalValue": 0.7356049643123869, "hidden": false, "incremental": true, "lockedIcons": [{"slug": "xgghjFn9", "url": "V8T31XEu"}, {"slug": "71ezLUqT", "url": "wK9LYrfL"}, {"slug": "nvuqEOZ5", "url": "fa6pg3H8"}], "name": {"S0plyaIX": "TNlQERjS", "FoofFyEP": "FwvVqFYx", "JBZpivlo": "FCbmSCWD"}, "statCode": "DnOAqVMX", "tags": ["vb7o0cnk", "C0r8uCqJ", "9BpZ7Fxt"], "unlockedIcons": [{"slug": "HWZZM181", "url": "WEEi2QY8"}, {"slug": "hdOGvs9R", "url": "2JYBWn17"}, {"slug": "hwuzKFXZ", "url": "J1BaQsfq"}]}' \
    > test.out 2>&1
eval_tap $? 3 'AdminCreateNewAchievement' test.out

#- 4 ExportAchievements
./ng net.accelbyte.sdk.cli.Main achievement exportAchievements \
    --namespace "$AB_NAMESPACE" \
    --tags 'CTbBTiQK,GGT5cjh3,ceWkZbd0' \
    > test.out 2>&1
eval_tap $? 4 'ExportAchievements' test.out

#- 5 ImportAchievements
./ng net.accelbyte.sdk.cli.Main achievement importAchievements \
    --namespace "$AB_NAMESPACE" \
    --file 'tmp.dat' \
    --strategy 'TgxnGUYw' \
    > test.out 2>&1
eval_tap $? 5 'ImportAchievements' test.out

#- 6 AdminGetAchievement
./ng net.accelbyte.sdk.cli.Main achievement adminGetAchievement \
    --achievementCode 'UAJaoXiD' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 6 'AdminGetAchievement' test.out

#- 7 AdminUpdateAchievement
./ng net.accelbyte.sdk.cli.Main achievement adminUpdateAchievement \
    --achievementCode 'BpJ8rtAD' \
    --namespace "$AB_NAMESPACE" \
    --body '{"customAttributes": {"BejQDLL5": {}, "e1iOIRh4": {}, "ew1Z5zCO": {}}, "defaultLanguage": "X21cczcw", "description": {"NjIsLPr9": "tzOmhmKV", "u3kIAIIj": "uExVvMxF", "2ETXvxXN": "2Dg40UWH"}, "global": true, "goalValue": 0.45088071717085654, "hidden": false, "incremental": true, "lockedIcons": [{"slug": "b90GVsQg", "url": "4VytnwnW"}, {"slug": "itSZv6zj", "url": "oEDcSYuw"}, {"slug": "XgrrKtUe", "url": "TG38gsGL"}], "name": {"pQPR2vZs": "DmdwFv3U", "vjyjnuJo": "LufP6eYG", "FPw1AhDd": "sASZRVVA"}, "statCode": "F8bADAvf", "tags": ["dxRZiwea", "qTKGLK1q", "lZsyKyMQ"], "unlockedIcons": [{"slug": "PZ42V79w", "url": "8mLNTm9x"}, {"slug": "IxjcnRZZ", "url": "LAvCXrSw"}, {"slug": "S7Zc6jvN", "url": "kRearChW"}]}' \
    > test.out 2>&1
eval_tap $? 7 'AdminUpdateAchievement' test.out

#- 8 AdminDeleteAchievement
./ng net.accelbyte.sdk.cli.Main achievement adminDeleteAchievement \
    --achievementCode 'gkgEM5jm' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 8 'AdminDeleteAchievement' test.out

#- 9 AdminUpdateAchievementListOrder
./ng net.accelbyte.sdk.cli.Main achievement adminUpdateAchievementListOrder \
    --achievementCode 'HHuHzZsp' \
    --namespace "$AB_NAMESPACE" \
    --body '{"targetOrder": 17}' \
    > test.out 2>&1
eval_tap $? 9 'AdminUpdateAchievementListOrder' test.out

#- 10 AdminListGlobalAchievements
./ng net.accelbyte.sdk.cli.Main achievement adminListGlobalAchievements \
    --namespace "$AB_NAMESPACE" \
    --achievementCodes '6qXR0KsO' \
    --limit '91' \
    --offset '74' \
    --sortBy 'createdAt' \
    --status 'b1Be2Bsv' \
    --tags 'fWImcgyS,Xe0EILxF,rOEmHIO4' \
    > test.out 2>&1
eval_tap $? 10 'AdminListGlobalAchievements' test.out

#- 11 AdminListGlobalAchievementContributors
./ng net.accelbyte.sdk.cli.Main achievement adminListGlobalAchievementContributors \
    --achievementCode '2Cs0DG78' \
    --namespace "$AB_NAMESPACE" \
    --limit '7' \
    --offset '90' \
    --sortBy 'contributedValue' \
    > test.out 2>&1
eval_tap $? 11 'AdminListGlobalAchievementContributors' test.out

#- 12 ResetGlobalAchievement
./ng net.accelbyte.sdk.cli.Main achievement resetGlobalAchievement \
    --achievementCode 'RRa8ahcu' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 12 'ResetGlobalAchievement' test.out

#- 13 BulkCreatePSNEvent
./ng net.accelbyte.sdk.cli.Main achievement bulkCreatePSNEvent \
    --namespace "$AB_NAMESPACE" \
    --body '{"data": [{"events": [{"dateTime": "NSQvPOWe", "eventData": {"eventName": "zoIzVpOK", "properties": {"qtj4H5bq": {}, "bR09b7TB": {}, "EZtzICOr": {}}}, "eventId": "YLWqMpEP", "version": "UlDA364H"}, {"dateTime": "VInJBgb7", "eventData": {"eventName": "Ybi1n1Ga", "properties": {"qFs9B7sq": {}, "nDFaohPl": {}, "g31HrL0T": {}}}, "eventId": "zuaFikYP", "version": "m9RVPola"}, {"dateTime": "XHCXCEaY", "eventData": {"eventName": "KMMpkAKk", "properties": {"griBA2wq": {}, "FpPnplDx": {}, "TXsOkshT": {}}}, "eventId": "56VpY7PG", "version": "8rVrvUtY"}], "thirdPartyUserId": "smzVtQjR", "userId": "B8vVWMCI"}, {"events": [{"dateTime": "HQxUEmJx", "eventData": {"eventName": "lWpe0LyT", "properties": {"kmRgKzl3": {}, "8EOftXyW": {}, "XNzhLkM2": {}}}, "eventId": "lZ2pqJDP", "version": "PdmyIli1"}, {"dateTime": "SVc7K35p", "eventData": {"eventName": "gzsoGaJd", "properties": {"Q5Ja3fxC": {}, "aZ3hCPvw": {}, "Q1c4mVy5": {}}}, "eventId": "SeeP1rdf", "version": "XCQciTTC"}, {"dateTime": "nEfBqZJP", "eventData": {"eventName": "phhLyJ7B", "properties": {"S0QOrYdW": {}, "p2bkdsE0": {}, "c28H9Pkc": {}}}, "eventId": "flO8mnnj", "version": "oiyDc4Vq"}], "thirdPartyUserId": "8qdmrhmC", "userId": "Mw48A1OB"}, {"events": [{"dateTime": "8gx1AHbk", "eventData": {"eventName": "8iDWHp4I", "properties": {"X7VBIFt3": {}, "8lpB4Cyy": {}, "sXtQuaGh": {}}}, "eventId": "8YBvCqCH", "version": "JkjIr1w9"}, {"dateTime": "OdS1uSNF", "eventData": {"eventName": "jjCVmKAP", "properties": {"9CPXAzlv": {}, "zv14y2mi": {}, "NYu0kHbl": {}}}, "eventId": "yMvp8wmF", "version": "qup5GDI4"}, {"dateTime": "JCRRfZPS", "eventData": {"eventName": "Gjky0zgm", "properties": {"B77nYP2I": {}, "RQFKFedy": {}, "kv8Xyaec": {}}}, "eventId": "J82eHDKN", "version": "GbJNg9Wm"}], "thirdPartyUserId": "FyKcQEsW", "userId": "x5Hn3MKw"}]}' \
    > test.out 2>&1
eval_tap $? 13 'BulkCreatePSNEvent' test.out

#- 14 AdminListTags
./ng net.accelbyte.sdk.cli.Main achievement adminListTags \
    --namespace "$AB_NAMESPACE" \
    --limit '53' \
    --name 'PwM6tSP5' \
    --offset '21' \
    --sortBy 'name:desc' \
    > test.out 2>&1
eval_tap $? 14 'AdminListTags' test.out

#- 15 AdminListUserAchievements
./ng net.accelbyte.sdk.cli.Main achievement adminListUserAchievements \
    --namespace "$AB_NAMESPACE" \
    --userId 'pAM7duNs' \
    --limit '11' \
    --offset '96' \
    --preferUnlocked  \
    --sortBy 'achievedAt' \
    --tags 'RNrEaTGj,jUGeNvj6,Y1oeSn8b' \
    > test.out 2>&1
eval_tap $? 15 'AdminListUserAchievements' test.out

#- 16 AdminBulkUnlockAchievement
./ng net.accelbyte.sdk.cli.Main achievement adminBulkUnlockAchievement \
    --namespace "$AB_NAMESPACE" \
    --userId 'fonLoPec' \
    --body '{"achievementCodes": ["6i72iPpM", "X6yWOqkE", "Gnsmz0PZ"]}' \
    > test.out 2>&1
eval_tap $? 16 'AdminBulkUnlockAchievement' test.out

#- 17 AdminResetAchievement
./ng net.accelbyte.sdk.cli.Main achievement adminResetAchievement \
    --achievementCode 'FE3BzKuj' \
    --namespace "$AB_NAMESPACE" \
    --userId 'IxLf04qJ' \
    > test.out 2>&1
eval_tap $? 17 'AdminResetAchievement' test.out

#- 18 AdminUnlockAchievement
./ng net.accelbyte.sdk.cli.Main achievement adminUnlockAchievement \
    --achievementCode 'BOtBMAA4' \
    --namespace "$AB_NAMESPACE" \
    --userId 'QIAdSSQr' \
    > test.out 2>&1
eval_tap $? 18 'AdminUnlockAchievement' test.out

#- 19 AdminAnonymizeUserAchievement
./ng net.accelbyte.sdk.cli.Main achievement adminAnonymizeUserAchievement \
    --namespace "$AB_NAMESPACE" \
    --userId 'QsWN44UK' \
    > test.out 2>&1
eval_tap $? 19 'AdminAnonymizeUserAchievement' test.out

#- 20 AdminListUserContributions
./ng net.accelbyte.sdk.cli.Main achievement adminListUserContributions \
    --namespace "$AB_NAMESPACE" \
    --userId 'TMMXv6k5' \
    --achievementCodes 'etfQaQsH' \
    --limit '8' \
    --offset '40' \
    --sortBy 'contributedValue' \
    --tags 'jEw9Dhf0,VuiI5NEV,BU5wfIFd' \
    > test.out 2>&1
eval_tap $? 20 'AdminListUserContributions' test.out

#- 21 PublicListAchievements
./ng net.accelbyte.sdk.cli.Main achievement publicListAchievements \
    --namespace "$AB_NAMESPACE" \
    --global  \
    --limit '42' \
    --offset '32' \
    --sortBy 'createdAt:desc' \
    --tags 'ks0P0pXd,tNywLHkg,m7lnuJAm' \
    --language 'Wx2uP2YS' \
    > test.out 2>&1
eval_tap $? 21 'PublicListAchievements' test.out

#- 22 PublicGetAchievement
./ng net.accelbyte.sdk.cli.Main achievement publicGetAchievement \
    --achievementCode 'v1kfVL45' \
    --namespace "$AB_NAMESPACE" \
    --language 'xGMSgjoF' \
    > test.out 2>&1
eval_tap $? 22 'PublicGetAchievement' test.out

#- 23 PublicListGlobalAchievements
./ng net.accelbyte.sdk.cli.Main achievement publicListGlobalAchievements \
    --namespace "$AB_NAMESPACE" \
    --achievementCodes 'pdajbcZc' \
    --limit '55' \
    --offset '98' \
    --sortBy 'createdAt:desc' \
    --status 'NXiUeK0Q' \
    --tags 's3tf5iew,86Jbd6bk,vhJCnZFC' \
    > test.out 2>&1
eval_tap $? 23 'PublicListGlobalAchievements' test.out

#- 24 ListGlobalAchievementContributors
./ng net.accelbyte.sdk.cli.Main achievement listGlobalAchievementContributors \
    --achievementCode 'ZWh2sCQG' \
    --namespace "$AB_NAMESPACE" \
    --limit '6' \
    --offset '37' \
    --sortBy 'contributedValue' \
    > test.out 2>&1
eval_tap $? 24 'ListGlobalAchievementContributors' test.out

#- 25 PublicListTags
./ng net.accelbyte.sdk.cli.Main achievement publicListTags \
    --namespace "$AB_NAMESPACE" \
    --limit '87' \
    --name 'g2z9WqES' \
    --offset '0' \
    --sortBy 'createdAt:desc' \
    > test.out 2>&1
eval_tap $? 25 'PublicListTags' test.out

#- 26 PublicListUserAchievements
./ng net.accelbyte.sdk.cli.Main achievement publicListUserAchievements \
    --namespace "$AB_NAMESPACE" \
    --userId 'xfrqToy5' \
    --limit '70' \
    --offset '24' \
    --preferUnlocked  \
    --sortBy 'achievedAt:desc' \
    --tags 'c9J7PkIO,ao3laZDa,P53cctHb' \
    > test.out 2>&1
eval_tap $? 26 'PublicListUserAchievements' test.out

#- 27 PublicBulkUnlockAchievement
./ng net.accelbyte.sdk.cli.Main achievement publicBulkUnlockAchievement \
    --namespace "$AB_NAMESPACE" \
    --userId 'YKtYIDzj' \
    --body '{"achievementCodes": ["WOA25ILz", "GV99MEL7", "GpzfO9vG"]}' \
    > test.out 2>&1
eval_tap $? 27 'PublicBulkUnlockAchievement' test.out

#- 28 PublicUnlockAchievement
./ng net.accelbyte.sdk.cli.Main achievement publicUnlockAchievement \
    --achievementCode 'YzRQfDf0' \
    --namespace "$AB_NAMESPACE" \
    --userId 'mU7S4gtB' \
    > test.out 2>&1
eval_tap $? 28 'PublicUnlockAchievement' test.out

#- 29 ListUserContributions
./ng net.accelbyte.sdk.cli.Main achievement listUserContributions \
    --namespace "$AB_NAMESPACE" \
    --userId 'hOIAZo4k' \
    --achievementCodes '95cGWHc3' \
    --limit '44' \
    --offset '77' \
    --sortBy 'contributedValue' \
    --tags 'XjHhhzIl,CMc1gga4,TSayd2tA' \
    > test.out 2>&1
eval_tap $? 29 'ListUserContributions' test.out

#- 30 ClaimGlobalAchievementReward
./ng net.accelbyte.sdk.cli.Main achievement claimGlobalAchievementReward \
    --achievementCode 'OwH5N6JP' \
    --namespace "$AB_NAMESPACE" \
    --userId 'N3n3t39l' \
    > test.out 2>&1
eval_tap $? 30 'ClaimGlobalAchievementReward' test.out


rm -f "tmp.dat"

exit $EXIT_CODE