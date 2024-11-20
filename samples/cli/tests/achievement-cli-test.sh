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
    --limit '66' \
    --offset '92' \
    --sortBy 'listOrder' \
    --tags 'RDJDvZdM,6eHCcPyy,GoTcQ5IE' \
    > test.out 2>&1
eval_tap $? 2 'AdminListAchievements' test.out

#- 3 AdminCreateNewAchievement
./ng net.accelbyte.sdk.cli.Main achievement adminCreateNewAchievement \
    --namespace "$AB_NAMESPACE" \
    --body '{"achievementCode": "8ceGLPQX", "customAttributes": {"y5JxvTxE": {}, "AgKWhzK3": {}, "12c5YvxS": {}}, "defaultLanguage": "VpMteNU2", "description": {"vYLK988y": "xAMrLsPZ", "gK1LTW3x": "rU16NO35", "dMh3kJbc": "HmkLYMvN"}, "global": false, "goalValue": 0.6666250006422927, "hidden": false, "incremental": true, "lockedIcons": [{"slug": "gcmiNIS4", "url": "fsJ5p9jC"}, {"slug": "DUh780E8", "url": "8wPSQQma"}, {"slug": "6sOXLgIV", "url": "zaMyzeeD"}], "name": {"aIZHdZZ5": "D9Qiwbul", "AoWNXRMt": "JYesTz72", "Wn7wake2": "zGNn1KtE"}, "statCode": "Kx4fw8d0", "tags": ["j9AfrpsD", "SLuoARwb", "DW5rA9AF"], "unlockedIcons": [{"slug": "Hi1TCy9W", "url": "70c3tGM2"}, {"slug": "pN9ESMZB", "url": "D3FSLKWa"}, {"slug": "PZSPVXJO", "url": "7glUcRcq"}]}' \
    > test.out 2>&1
eval_tap $? 3 'AdminCreateNewAchievement' test.out

#- 4 ExportAchievements
./ng net.accelbyte.sdk.cli.Main achievement exportAchievements \
    --namespace "$AB_NAMESPACE" \
    --tags 'WPaAuq2u,A6VuBPVD,QDDmb46Q' \
    > test.out 2>&1
eval_tap $? 4 'ExportAchievements' test.out

#- 5 ImportAchievements
./ng net.accelbyte.sdk.cli.Main achievement importAchievements \
    --namespace "$AB_NAMESPACE" \
    --file 'tmp.dat' \
    --strategy 'wCWBkJyp' \
    > test.out 2>&1
eval_tap $? 5 'ImportAchievements' test.out

#- 6 AdminGetAchievement
./ng net.accelbyte.sdk.cli.Main achievement adminGetAchievement \
    --achievementCode 'mvT4btTV' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 6 'AdminGetAchievement' test.out

#- 7 AdminUpdateAchievement
./ng net.accelbyte.sdk.cli.Main achievement adminUpdateAchievement \
    --achievementCode 'uTlYylRl' \
    --namespace "$AB_NAMESPACE" \
    --body '{"customAttributes": {"7Ot4npjZ": {}, "W3kinmhF": {}, "hIxQ8Dkm": {}}, "defaultLanguage": "cuTXkNx6", "description": {"mPn8UjHz": "cmZZSCaD", "8KmyenpX": "YK0D1ET4", "bTzPUwNQ": "hLmeBrq6"}, "global": true, "goalValue": 0.45180970847120305, "hidden": false, "incremental": true, "lockedIcons": [{"slug": "5tQetNNn", "url": "emFj96k9"}, {"slug": "TiZ45iFm", "url": "YcYxwXfI"}, {"slug": "ptfv7Lin", "url": "46ZD51sa"}], "name": {"Sx1k90fx": "ERi3GuA9", "mLoZ5ZvP": "c3qbBuMN", "7I4h44OW": "5IqrBTQr"}, "statCode": "G6AJNNB1", "tags": ["AJF8fsms", "HfDDC8DH", "UssLLlsG"], "unlockedIcons": [{"slug": "US7JrftP", "url": "6hNusakx"}, {"slug": "li4Mh9K1", "url": "zcNjMw6z"}, {"slug": "4ovHZElp", "url": "VBV2eThl"}]}' \
    > test.out 2>&1
eval_tap $? 7 'AdminUpdateAchievement' test.out

#- 8 AdminDeleteAchievement
./ng net.accelbyte.sdk.cli.Main achievement adminDeleteAchievement \
    --achievementCode 'n75Wzb5f' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 8 'AdminDeleteAchievement' test.out

#- 9 AdminUpdateAchievementListOrder
./ng net.accelbyte.sdk.cli.Main achievement adminUpdateAchievementListOrder \
    --achievementCode 'lJSAbsjA' \
    --namespace "$AB_NAMESPACE" \
    --body '{"targetOrder": 23}' \
    > test.out 2>&1
eval_tap $? 9 'AdminUpdateAchievementListOrder' test.out

#- 10 AdminListGlobalAchievements
./ng net.accelbyte.sdk.cli.Main achievement adminListGlobalAchievements \
    --namespace "$AB_NAMESPACE" \
    --achievementCodes 'Olwsq7XZ' \
    --limit '36' \
    --offset '93' \
    --sortBy 'createdAt:asc' \
    --status 'laH0sNSg' \
    --tags 'gfIcNEYO,d7TVeOL6,HAtAV6SH' \
    > test.out 2>&1
eval_tap $? 10 'AdminListGlobalAchievements' test.out

#- 11 AdminListGlobalAchievementContributors
./ng net.accelbyte.sdk.cli.Main achievement adminListGlobalAchievementContributors \
    --achievementCode 'GbtWNpt3' \
    --namespace "$AB_NAMESPACE" \
    --limit '55' \
    --offset '77' \
    --sortBy 'contributedValue' \
    > test.out 2>&1
eval_tap $? 11 'AdminListGlobalAchievementContributors' test.out

#- 12 ResetGlobalAchievement
./ng net.accelbyte.sdk.cli.Main achievement resetGlobalAchievement \
    --achievementCode 'UUu7oqLk' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 12 'ResetGlobalAchievement' test.out

#- 13 BulkCreatePSNEvent
./ng net.accelbyte.sdk.cli.Main achievement bulkCreatePSNEvent \
    --namespace "$AB_NAMESPACE" \
    --body '{"data": [{"events": [{"dateTime": "WwIYuWEv", "eventData": {"eventName": "ZFRUyn7J", "properties": {"u3PXtFoP": {}, "M3NP9pZh": {}, "YHqZgxJr": {}}}, "eventId": "E4YikZ9s", "version": "cZTWJkda"}, {"dateTime": "GTWuteCX", "eventData": {"eventName": "GpCkYOci", "properties": {"rTK1w4wK": {}, "UDzLCK4K": {}, "qmZgdwip": {}}}, "eventId": "UYlXtHDL", "version": "lDgPUrzA"}, {"dateTime": "zWKUvEqG", "eventData": {"eventName": "ikl0nghr", "properties": {"3Z8WN0wc": {}, "vPLu5EEp": {}, "YfRGPpZ6": {}}}, "eventId": "t9vWX7Vj", "version": "yDiG1V9B"}], "thirdPartyUserId": "kjsFXCgP", "userId": "oXzp45Q2"}, {"events": [{"dateTime": "KPNuVxfb", "eventData": {"eventName": "c5kC5kwL", "properties": {"E2daULGR": {}, "8rhtCEUx": {}, "8SGp4kGd": {}}}, "eventId": "89KBg3Ou", "version": "qZleRBo6"}, {"dateTime": "lTIVAo4W", "eventData": {"eventName": "FBG8XXYK", "properties": {"vvS1IxEQ": {}, "T98lzX3u": {}, "lCmW2jnI": {}}}, "eventId": "sTWBMBPo", "version": "famLVk9V"}, {"dateTime": "mRdGfQHW", "eventData": {"eventName": "Sbea9U8y", "properties": {"3nI7rzTV": {}, "BMKZGeHf": {}, "zPCbtVSd": {}}}, "eventId": "rtJPp4qV", "version": "NdaNMJyv"}], "thirdPartyUserId": "BOQaRdQ8", "userId": "dwOjey5Q"}, {"events": [{"dateTime": "ljohzlj0", "eventData": {"eventName": "ZSpOB4uT", "properties": {"gFYDWNyN": {}, "x6znKlIa": {}, "YKKceXIT": {}}}, "eventId": "Eza5cz0S", "version": "Ef1RTSaF"}, {"dateTime": "Hpa7LNqc", "eventData": {"eventName": "jOwITNH4", "properties": {"V52eY5J2": {}, "FrLmf1SN": {}, "t6UTiEen": {}}}, "eventId": "vJVN8OyJ", "version": "M9jlvuiL"}, {"dateTime": "9HsvCyz0", "eventData": {"eventName": "OclhWkN4", "properties": {"7Dh9bAPr": {}, "nrpWuGGk": {}, "08QJJykh": {}}}, "eventId": "uGU1TJf5", "version": "apymCQki"}], "thirdPartyUserId": "RPDFEKPH", "userId": "XJWRYIpk"}]}' \
    > test.out 2>&1
eval_tap $? 13 'BulkCreatePSNEvent' test.out

#- 14 AdminListTags
./ng net.accelbyte.sdk.cli.Main achievement adminListTags \
    --namespace "$AB_NAMESPACE" \
    --limit '34' \
    --name 'QBojl7hz' \
    --offset '88' \
    --sortBy 'createdAt:asc' \
    > test.out 2>&1
eval_tap $? 14 'AdminListTags' test.out

#- 15 AdminListUserAchievements
./ng net.accelbyte.sdk.cli.Main achievement adminListUserAchievements \
    --namespace "$AB_NAMESPACE" \
    --userId 'MGqgX49Z' \
    --limit '12' \
    --offset '55' \
    --preferUnlocked  \
    --sortBy 'createdAt' \
    --tags 'FST0CvR7,c4lX0mYr,2NA4Gb62' \
    > test.out 2>&1
eval_tap $? 15 'AdminListUserAchievements' test.out

#- 16 AdminResetAchievement
./ng net.accelbyte.sdk.cli.Main achievement adminResetAchievement \
    --achievementCode '6N2meHO9' \
    --namespace "$AB_NAMESPACE" \
    --userId 'cDwASFh4' \
    > test.out 2>&1
eval_tap $? 16 'AdminResetAchievement' test.out

#- 17 AdminUnlockAchievement
./ng net.accelbyte.sdk.cli.Main achievement adminUnlockAchievement \
    --achievementCode 'oVuEei60' \
    --namespace "$AB_NAMESPACE" \
    --userId 'M8z97R5r' \
    > test.out 2>&1
eval_tap $? 17 'AdminUnlockAchievement' test.out

#- 18 AdminAnonymizeUserAchievement
./ng net.accelbyte.sdk.cli.Main achievement adminAnonymizeUserAchievement \
    --namespace "$AB_NAMESPACE" \
    --userId 'IB0A0I91' \
    > test.out 2>&1
eval_tap $? 18 'AdminAnonymizeUserAchievement' test.out

#- 19 AdminListUserContributions
./ng net.accelbyte.sdk.cli.Main achievement adminListUserContributions \
    --namespace "$AB_NAMESPACE" \
    --userId 'PewGONT0' \
    --achievementCodes 'Zo7Lk9TR' \
    --limit '51' \
    --offset '25' \
    --sortBy 'contributedValue' \
    --tags 'YehpMFsr,VhF20Ron,m3HbRSB9' \
    > test.out 2>&1
eval_tap $? 19 'AdminListUserContributions' test.out

#- 20 PublicListAchievements
./ng net.accelbyte.sdk.cli.Main achievement publicListAchievements \
    --namespace "$AB_NAMESPACE" \
    --global  \
    --limit '18' \
    --offset '59' \
    --sortBy 'createdAt' \
    --tags 'kLZCiFiT,6fC3ib5q,PH0KBS87' \
    --language 'nChXq89S' \
    > test.out 2>&1
eval_tap $? 20 'PublicListAchievements' test.out

#- 21 PublicGetAchievement
./ng net.accelbyte.sdk.cli.Main achievement publicGetAchievement \
    --achievementCode 'vq3Qf2GW' \
    --namespace "$AB_NAMESPACE" \
    --language 'TfwonpSS' \
    > test.out 2>&1
eval_tap $? 21 'PublicGetAchievement' test.out

#- 22 PublicListGlobalAchievements
./ng net.accelbyte.sdk.cli.Main achievement publicListGlobalAchievements \
    --namespace "$AB_NAMESPACE" \
    --achievementCodes 'dZdjjnvX' \
    --limit '39' \
    --offset '78' \
    --sortBy 'createdAt:desc' \
    --status 'TYiyxIVt' \
    --tags 'w9cBjbdO,98TTroTZ,t0wCMMuP' \
    > test.out 2>&1
eval_tap $? 22 'PublicListGlobalAchievements' test.out

#- 23 ListGlobalAchievementContributors
./ng net.accelbyte.sdk.cli.Main achievement listGlobalAchievementContributors \
    --achievementCode 'rr95fsrz' \
    --namespace "$AB_NAMESPACE" \
    --limit '57' \
    --offset '21' \
    --sortBy 'contributedValue:desc' \
    > test.out 2>&1
eval_tap $? 23 'ListGlobalAchievementContributors' test.out

#- 24 PublicListTags
./ng net.accelbyte.sdk.cli.Main achievement publicListTags \
    --namespace "$AB_NAMESPACE" \
    --limit '60' \
    --name 'Kqpt7Rbq' \
    --offset '46' \
    --sortBy 'name' \
    > test.out 2>&1
eval_tap $? 24 'PublicListTags' test.out

#- 25 PublicListUserAchievements
./ng net.accelbyte.sdk.cli.Main achievement publicListUserAchievements \
    --namespace "$AB_NAMESPACE" \
    --userId 'lDGenGiB' \
    --limit '44' \
    --offset '93' \
    --preferUnlocked  \
    --sortBy 'createdAt' \
    --tags '2RgwX5gA,y6GTM6SB,AkwV3QRE' \
    > test.out 2>&1
eval_tap $? 25 'PublicListUserAchievements' test.out

#- 26 PublicUnlockAchievement
./ng net.accelbyte.sdk.cli.Main achievement publicUnlockAchievement \
    --achievementCode 'MadHwvoQ' \
    --namespace "$AB_NAMESPACE" \
    --userId '60OZKkeX' \
    > test.out 2>&1
eval_tap $? 26 'PublicUnlockAchievement' test.out

#- 27 ListUserContributions
./ng net.accelbyte.sdk.cli.Main achievement listUserContributions \
    --namespace "$AB_NAMESPACE" \
    --userId 'mH0WiarF' \
    --achievementCodes 'Qb52P6Is' \
    --limit '9' \
    --offset '70' \
    --sortBy 'contributedValue:desc' \
    --tags 'eqQNxaAW,gQzJmDQT,UIwmdPbh' \
    > test.out 2>&1
eval_tap $? 27 'ListUserContributions' test.out

#- 28 ClaimGlobalAchievementReward
./ng net.accelbyte.sdk.cli.Main achievement claimGlobalAchievementReward \
    --achievementCode 'TV7xi4C4' \
    --namespace "$AB_NAMESPACE" \
    --userId '6wo1kU0Q' \
    > test.out 2>&1
eval_tap $? 28 'ClaimGlobalAchievementReward' test.out


rm -f "tmp.dat"

exit $EXIT_CODE