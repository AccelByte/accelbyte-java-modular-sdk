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
    --limit '30' \
    --offset '1' \
    --sortBy 'createdAt:asc' \
    --tags 'nbgvKKDg,gLY99xbR,alHRsnV4' \
    > test.out 2>&1
eval_tap $? 2 'AdminListAchievements' test.out

#- 3 AdminCreateNewAchievement
./ng net.accelbyte.sdk.cli.Main achievement adminCreateNewAchievement \
    --namespace "$AB_NAMESPACE" \
    --body '{"achievementCode": "edp0GYW1", "customAttributes": {"UKV9sNFT": {}, "mtBPh81K": {}, "x9AY6mnT": {}}, "defaultLanguage": "KUgcaKKt", "description": {"FqlJv7vU": "oAPlLRM6", "ewpTm0Fw": "jCZ5Ctd6", "2RXrAguy": "M6G9scjf"}, "global": false, "goalValue": 0.9663057940744185, "hidden": true, "incremental": true, "lockedIcons": [{"slug": "H7B2ux61", "url": "ySecmRWw"}, {"slug": "Bnr0ogar", "url": "uFgKamrM"}, {"slug": "lo1C5OfW", "url": "DQ3Anumx"}], "name": {"D0tiA6jj": "FGKKj0eO", "mHv23kxS": "tJIF5m18", "XpholjW1": "5nHq8w8u"}, "statCode": "nRjQPySV", "tags": ["qs8l5RGy", "SvS7OkW6", "1LO2CAP8"], "unlockedIcons": [{"slug": "yQwag3UZ", "url": "Dhk1BZgH"}, {"slug": "e6oQKAbQ", "url": "kqruxeee"}, {"slug": "cePjgCeW", "url": "5nzDHQgK"}]}' \
    > test.out 2>&1
eval_tap $? 3 'AdminCreateNewAchievement' test.out

#- 4 ExportAchievements
./ng net.accelbyte.sdk.cli.Main achievement exportAchievements \
    --namespace "$AB_NAMESPACE" \
    --tags 'fipQdF0E,60ZM8rTs,IhyfS2pR' \
    > test.out 2>&1
eval_tap $? 4 'ExportAchievements' test.out

#- 5 ImportAchievements
./ng net.accelbyte.sdk.cli.Main achievement importAchievements \
    --namespace "$AB_NAMESPACE" \
    --file 'tmp.dat' \
    --strategy '7Q1rt9e6' \
    > test.out 2>&1
eval_tap $? 5 'ImportAchievements' test.out

#- 6 AdminGetAchievement
./ng net.accelbyte.sdk.cli.Main achievement adminGetAchievement \
    --achievementCode '5tgOPvRT' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 6 'AdminGetAchievement' test.out

#- 7 AdminUpdateAchievement
./ng net.accelbyte.sdk.cli.Main achievement adminUpdateAchievement \
    --achievementCode 'eZitgYeO' \
    --namespace "$AB_NAMESPACE" \
    --body '{"customAttributes": {"8FkebPaj": {}, "C4L9Vp4h": {}, "n3EFcdLc": {}}, "defaultLanguage": "QoKQivYk", "description": {"rbQcnS3Z": "vFG6y6DT", "GPE2wK3r": "3ZvyEoIa", "7CuC00ve": "SXgyPPTl"}, "global": false, "goalValue": 0.15637502030235084, "hidden": true, "incremental": true, "lockedIcons": [{"slug": "K1UhUXMO", "url": "9i4aGHtC"}, {"slug": "xydFNm3q", "url": "jjjsRdYw"}, {"slug": "r90OckDu", "url": "Q0whCuCB"}], "name": {"UwYT1deG": "21H0OSHU", "YLSKX4sN": "tdKve0B5", "yTOjhEuR": "hRCa9E5t"}, "statCode": "yxQ7HYBl", "tags": ["szkC7kRR", "2ViyTTkY", "pVs4YsSd"], "unlockedIcons": [{"slug": "xuSR7XWl", "url": "S5OXc4CZ"}, {"slug": "VsrjKW3b", "url": "bLdZ67xG"}, {"slug": "hTkQQZha", "url": "BUAnkJff"}]}' \
    > test.out 2>&1
eval_tap $? 7 'AdminUpdateAchievement' test.out

#- 8 AdminDeleteAchievement
./ng net.accelbyte.sdk.cli.Main achievement adminDeleteAchievement \
    --achievementCode 'P89NKLS1' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 8 'AdminDeleteAchievement' test.out

#- 9 AdminUpdateAchievementListOrder
./ng net.accelbyte.sdk.cli.Main achievement adminUpdateAchievementListOrder \
    --achievementCode 'gVoRzV6a' \
    --namespace "$AB_NAMESPACE" \
    --body '{"targetOrder": 72}' \
    > test.out 2>&1
eval_tap $? 9 'AdminUpdateAchievementListOrder' test.out

#- 10 AdminListGlobalAchievements
./ng net.accelbyte.sdk.cli.Main achievement adminListGlobalAchievements \
    --namespace "$AB_NAMESPACE" \
    --achievementCodes 'mktOJ3Gc' \
    --limit '91' \
    --offset '77' \
    --sortBy 'bG4BPxxU' \
    --status 'dXBPPjyj' \
    --tags 'jPz2cOKo,N3M5uZD6,bNBySyrx' \
    > test.out 2>&1
eval_tap $? 10 'AdminListGlobalAchievements' test.out

#- 11 AdminListGlobalAchievementContributors
./ng net.accelbyte.sdk.cli.Main achievement adminListGlobalAchievementContributors \
    --achievementCode 'IlmG0s4j' \
    --namespace "$AB_NAMESPACE" \
    --limit '1' \
    --offset '65' \
    --sortBy 'BNhBanOD' \
    > test.out 2>&1
eval_tap $? 11 'AdminListGlobalAchievementContributors' test.out

#- 12 ResetGlobalAchievement
./ng net.accelbyte.sdk.cli.Main achievement resetGlobalAchievement \
    --achievementCode 'vx6CTaUr' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 12 'ResetGlobalAchievement' test.out

#- 13 BulkCreatePSNEvent
./ng net.accelbyte.sdk.cli.Main achievement bulkCreatePSNEvent \
    --namespace "$AB_NAMESPACE" \
    --body '{"data": [{"events": [{"dateTime": "hVMdBptF", "eventData": {"eventName": "DPfERigq", "properties": {"dyCabPrO": {}, "N1przs3f": {}, "iIf8PGQb": {}}}, "eventId": "gdjaYVJT", "version": "PMGU7IHN"}, {"dateTime": "eHFcYs2x", "eventData": {"eventName": "VlNwTtBZ", "properties": {"ToDTh6W5": {}, "WOeHcEQv": {}, "jQinPx2U": {}}}, "eventId": "TjtVObO3", "version": "7cQhmWJW"}, {"dateTime": "fl9U54Cp", "eventData": {"eventName": "BKxnb0BR", "properties": {"pCvg0reS": {}, "QCCsopYP": {}, "Lb9sMfVc": {}}}, "eventId": "p0JZ8E4h", "version": "7A7WMidv"}], "thirdPartyUserId": "v2XuJcdq", "userId": "uHIeIxCY"}, {"events": [{"dateTime": "vaisKkic", "eventData": {"eventName": "cdvaOlxv", "properties": {"pmGBi700": {}, "anfx76kb": {}, "2YE04jZl": {}}}, "eventId": "MiT4NQrk", "version": "nPiY1HbV"}, {"dateTime": "beeliNN0", "eventData": {"eventName": "NMHROs9A", "properties": {"YFEMGfqF": {}, "ANxocHSj": {}, "sv71tjGw": {}}}, "eventId": "pfaL5idE", "version": "U4xVtHz0"}, {"dateTime": "yXKAc1H8", "eventData": {"eventName": "mk7jryd4", "properties": {"bEmOmSZo": {}, "MsCJA9jE": {}, "456iNDkY": {}}}, "eventId": "DWF9thJ9", "version": "duWIGjeO"}], "thirdPartyUserId": "cCgqjbIR", "userId": "k2i1vyA9"}, {"events": [{"dateTime": "3hdG582M", "eventData": {"eventName": "Wd7vbINP", "properties": {"lbWDyrzJ": {}, "GJbuTInu": {}, "4GvPKcoU": {}}}, "eventId": "lm4oXroo", "version": "KHVT5Vz2"}, {"dateTime": "OfyNN7Az", "eventData": {"eventName": "hbfEWQ2N", "properties": {"fCuqay2C": {}, "eP32DkfF": {}, "Rj2GBGyq": {}}}, "eventId": "fhbqkAFa", "version": "ijnA1KT8"}, {"dateTime": "McbxjRev", "eventData": {"eventName": "7BUwNHXK", "properties": {"xxVjW8J5": {}, "UzKgNvqq": {}, "xJLmWuBb": {}}}, "eventId": "phYv30su", "version": "TYpDLNkR"}], "thirdPartyUserId": "gIIVWLYG", "userId": "7j4lHRTR"}]}' \
    > test.out 2>&1
eval_tap $? 13 'BulkCreatePSNEvent' test.out

#- 14 AdminListTags
./ng net.accelbyte.sdk.cli.Main achievement adminListTags \
    --namespace "$AB_NAMESPACE" \
    --limit '24' \
    --name 'cR7Ep7Kz' \
    --offset '39' \
    --sortBy 'G2aVK38d' \
    > test.out 2>&1
eval_tap $? 14 'AdminListTags' test.out

#- 15 AdminListUserAchievements
./ng net.accelbyte.sdk.cli.Main achievement adminListUserAchievements \
    --namespace "$AB_NAMESPACE" \
    --userId 'uVROTTke' \
    --limit '78' \
    --offset '56' \
    --preferUnlocked  \
    --sortBy 'YfTXWQEE' \
    --tags 'VhjleHYc,XqClbpMc,FnsRreta' \
    > test.out 2>&1
eval_tap $? 15 'AdminListUserAchievements' test.out

#- 16 AdminResetAchievement
./ng net.accelbyte.sdk.cli.Main achievement adminResetAchievement \
    --achievementCode '9xjNdM6Q' \
    --namespace "$AB_NAMESPACE" \
    --userId '5ORcO63k' \
    > test.out 2>&1
eval_tap $? 16 'AdminResetAchievement' test.out

#- 17 AdminUnlockAchievement
./ng net.accelbyte.sdk.cli.Main achievement adminUnlockAchievement \
    --achievementCode '7hOBCs0X' \
    --namespace "$AB_NAMESPACE" \
    --userId 'bKrLGIgd' \
    > test.out 2>&1
eval_tap $? 17 'AdminUnlockAchievement' test.out

#- 18 AdminAnonymizeUserAchievement
./ng net.accelbyte.sdk.cli.Main achievement adminAnonymizeUserAchievement \
    --namespace "$AB_NAMESPACE" \
    --userId 'kEVGCvbA' \
    > test.out 2>&1
eval_tap $? 18 'AdminAnonymizeUserAchievement' test.out

#- 19 AdminListUserContributions
./ng net.accelbyte.sdk.cli.Main achievement adminListUserContributions \
    --namespace "$AB_NAMESPACE" \
    --userId '4qTVKogt' \
    --achievementCodes 'FISZp5jW' \
    --limit '56' \
    --offset '55' \
    --sortBy '8PSBRN2W' \
    --tags '1Frq6AZ7,dJxyFGpQ,YLn4PqK0' \
    > test.out 2>&1
eval_tap $? 19 'AdminListUserContributions' test.out

#- 20 PublicListAchievements
./ng net.accelbyte.sdk.cli.Main achievement publicListAchievements \
    --namespace "$AB_NAMESPACE" \
    --global  \
    --limit '76' \
    --offset '13' \
    --sortBy 'listOrder:asc' \
    --tags '17RkLg2N,ZyeKI6SP,cyS1iBR3' \
    --language 'NIKpAv9y' \
    > test.out 2>&1
eval_tap $? 20 'PublicListAchievements' test.out

#- 21 PublicGetAchievement
./ng net.accelbyte.sdk.cli.Main achievement publicGetAchievement \
    --achievementCode 'ARDRUPQw' \
    --namespace "$AB_NAMESPACE" \
    --language 'tlGgbKGL' \
    > test.out 2>&1
eval_tap $? 21 'PublicGetAchievement' test.out

#- 22 PublicListGlobalAchievements
./ng net.accelbyte.sdk.cli.Main achievement publicListGlobalAchievements \
    --namespace "$AB_NAMESPACE" \
    --achievementCodes 'G7zG76ub' \
    --limit '79' \
    --offset '71' \
    --sortBy 'g65aa4DP' \
    --status 'Gew2dXVS' \
    --tags 'qz7QvRe3,HLEaYnyU,xpIwgXqs' \
    > test.out 2>&1
eval_tap $? 22 'PublicListGlobalAchievements' test.out

#- 23 ListGlobalAchievementContributors
./ng net.accelbyte.sdk.cli.Main achievement listGlobalAchievementContributors \
    --achievementCode 'U12NemiE' \
    --namespace "$AB_NAMESPACE" \
    --limit '0' \
    --offset '3' \
    --sortBy 'eqdGfokw' \
    > test.out 2>&1
eval_tap $? 23 'ListGlobalAchievementContributors' test.out

#- 24 PublicListTags
./ng net.accelbyte.sdk.cli.Main achievement publicListTags \
    --namespace "$AB_NAMESPACE" \
    --limit '64' \
    --name 'Nho05Qha' \
    --offset '95' \
    --sortBy '0kcdaaWZ' \
    > test.out 2>&1
eval_tap $? 24 'PublicListTags' test.out

#- 25 PublicListUserAchievements
./ng net.accelbyte.sdk.cli.Main achievement publicListUserAchievements \
    --namespace "$AB_NAMESPACE" \
    --userId 'N2LrPg0u' \
    --limit '55' \
    --offset '14' \
    --preferUnlocked  \
    --sortBy 'gWnMng5I' \
    --tags 'zh51InSL,NZxyzdhU,IqDqAc6G' \
    > test.out 2>&1
eval_tap $? 25 'PublicListUserAchievements' test.out

#- 26 PublicUnlockAchievement
./ng net.accelbyte.sdk.cli.Main achievement publicUnlockAchievement \
    --achievementCode 'AOXY0TTm' \
    --namespace "$AB_NAMESPACE" \
    --userId 'Wq1KndRi' \
    > test.out 2>&1
eval_tap $? 26 'PublicUnlockAchievement' test.out

#- 27 ListUserContributions
./ng net.accelbyte.sdk.cli.Main achievement listUserContributions \
    --namespace "$AB_NAMESPACE" \
    --userId 'dqm4w6Sr' \
    --achievementCodes 'Cxhp6Zpo' \
    --limit '70' \
    --offset '84' \
    --sortBy '5okCzKDD' \
    --tags 'UK7ihxzD,de78xfOr,ycQbXgKO' \
    > test.out 2>&1
eval_tap $? 27 'ListUserContributions' test.out

#- 28 ClaimGlobalAchievementReward
./ng net.accelbyte.sdk.cli.Main achievement claimGlobalAchievementReward \
    --achievementCode 'nHz0xOxO' \
    --namespace "$AB_NAMESPACE" \
    --userId '4uyhREs7' \
    > test.out 2>&1
eval_tap $? 28 'ClaimGlobalAchievementReward' test.out


rm -f "tmp.dat"

exit $EXIT_CODE