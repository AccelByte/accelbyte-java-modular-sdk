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
    --limit '31' \
    --offset '14' \
    --sortBy 'createdAt' \
    --tags 'bbWTpoiR,7JdlVZdT,XIhYnBZe' \
    > test.out 2>&1
eval_tap $? 2 'AdminListAchievements' test.out

#- 3 AdminCreateNewAchievement
./ng net.accelbyte.sdk.cli.Main achievement adminCreateNewAchievement \
    --namespace "$AB_NAMESPACE" \
    --body '{"achievementCode": "TLOUlRFk", "customAttributes": {"9TyT3qeo": {}, "vRuZL0pc": {}, "SCWkkdi3": {}}, "defaultLanguage": "mYVcmCxb", "description": {"SZ80maeX": "TZ5NAe7I", "i6uXdHxb": "ahk5cHmD", "ZEM6C3dd": "LSU91cxE"}, "global": true, "goalValue": 0.231615961153402, "hidden": false, "incremental": false, "lockedIcons": [{"slug": "icHKbfjX", "url": "mpynA7NA"}, {"slug": "muURLr6R", "url": "TjXrZ3mm"}, {"slug": "F2lIew5s", "url": "FUFlOcDU"}], "name": {"7xG1cBqN": "CyvYCxFr", "cAGpSTIw": "7t2IJPq0", "zmYsnkD2": "JdTMIP5Z"}, "statCode": "DqMnJwhc", "tags": ["PsP60baO", "uNcShGoZ", "PtihehjJ"], "unlockedIcons": [{"slug": "89OpcqGZ", "url": "ri19yNyc"}, {"slug": "aAREIN5u", "url": "bq7NUORZ"}, {"slug": "N18NuW1q", "url": "KVEWftmY"}]}' \
    > test.out 2>&1
eval_tap $? 3 'AdminCreateNewAchievement' test.out

#- 4 ExportAchievements
./ng net.accelbyte.sdk.cli.Main achievement exportAchievements \
    --namespace "$AB_NAMESPACE" \
    --tags 'i4xbi4dL,FhoKrv7N,4hQdvCV8' \
    > test.out 2>&1
eval_tap $? 4 'ExportAchievements' test.out

#- 5 ImportAchievements
./ng net.accelbyte.sdk.cli.Main achievement importAchievements \
    --namespace "$AB_NAMESPACE" \
    --file 'tmp.dat' \
    --strategy 'B1CIOuE6' \
    > test.out 2>&1
eval_tap $? 5 'ImportAchievements' test.out

#- 6 AdminGetAchievement
./ng net.accelbyte.sdk.cli.Main achievement adminGetAchievement \
    --achievementCode 'oIeIWLTh' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 6 'AdminGetAchievement' test.out

#- 7 AdminUpdateAchievement
./ng net.accelbyte.sdk.cli.Main achievement adminUpdateAchievement \
    --achievementCode '7y56nb7T' \
    --namespace "$AB_NAMESPACE" \
    --body '{"customAttributes": {"JMd5Sq4B": {}, "RIxMYLzO": {}, "1WzDLYET": {}}, "defaultLanguage": "SZOZHrcu", "description": {"axUIF04e": "Mt65zmqz", "ju3e8eBp": "XsUD78mi", "34Mp8i0q": "qi9x17sg"}, "global": true, "goalValue": 0.36894300272926384, "hidden": false, "incremental": true, "lockedIcons": [{"slug": "O2FDmC35", "url": "f1L6Umuy"}, {"slug": "E6EhG4NN", "url": "UDDe6a8H"}, {"slug": "HcFqVdnY", "url": "VF7mIEuZ"}], "name": {"eC3WfzHU": "MHK9F0MC", "QlGdUZQb": "ay9ULcu8", "tZbvzK7b": "dQIv8Ons"}, "statCode": "R4vu1Orn", "tags": ["dhLnNBzX", "yGCBXmcQ", "bMEHtzVc"], "unlockedIcons": [{"slug": "RKLK4kID", "url": "AdRKbtki"}, {"slug": "PLWcdr7x", "url": "cpvdErYp"}, {"slug": "S2HzBgY6", "url": "7IAVfJdJ"}]}' \
    > test.out 2>&1
eval_tap $? 7 'AdminUpdateAchievement' test.out

#- 8 AdminDeleteAchievement
./ng net.accelbyte.sdk.cli.Main achievement adminDeleteAchievement \
    --achievementCode 'nuDQ8NJl' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 8 'AdminDeleteAchievement' test.out

#- 9 AdminUpdateAchievementListOrder
./ng net.accelbyte.sdk.cli.Main achievement adminUpdateAchievementListOrder \
    --achievementCode '2ruKH0DC' \
    --namespace "$AB_NAMESPACE" \
    --body '{"targetOrder": 97}' \
    > test.out 2>&1
eval_tap $? 9 'AdminUpdateAchievementListOrder' test.out

#- 10 AdminListGlobalAchievements
./ng net.accelbyte.sdk.cli.Main achievement adminListGlobalAchievements \
    --namespace "$AB_NAMESPACE" \
    --achievementCodes 'kFS5xx1S' \
    --limit '90' \
    --offset '59' \
    --sortBy 'achievedAt:desc' \
    --status '4k0DSklN' \
    --tags '6rwDOZyi,Kv4mmVOW,TQbND0kq' \
    > test.out 2>&1
eval_tap $? 10 'AdminListGlobalAchievements' test.out

#- 11 AdminListGlobalAchievementContributors
./ng net.accelbyte.sdk.cli.Main achievement adminListGlobalAchievementContributors \
    --achievementCode 'omcb7xZF' \
    --namespace "$AB_NAMESPACE" \
    --limit '23' \
    --offset '46' \
    --sortBy 'contributedValue:desc' \
    > test.out 2>&1
eval_tap $? 11 'AdminListGlobalAchievementContributors' test.out

#- 12 ResetGlobalAchievement
./ng net.accelbyte.sdk.cli.Main achievement resetGlobalAchievement \
    --achievementCode 'bST4tn4x' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 12 'ResetGlobalAchievement' test.out

#- 13 BulkCreatePSNEvent
./ng net.accelbyte.sdk.cli.Main achievement bulkCreatePSNEvent \
    --namespace "$AB_NAMESPACE" \
    --body '{"data": [{"events": [{"dateTime": "1sKNuZtU", "eventData": {"eventName": "LLsMl7f1", "properties": {"CfPOXoxg": {}, "HQzmNuaQ": {}, "Ozo2y9AM": {}}}, "eventId": "Rqt7ENNx", "version": "YZvrT736"}, {"dateTime": "CrTEb670", "eventData": {"eventName": "CFl5Zkfm", "properties": {"TyXDXASA": {}, "4ME4RZyI": {}, "wjPowRtH": {}}}, "eventId": "JAyybzB4", "version": "r9Pbp2Hn"}, {"dateTime": "UEG7Qj0F", "eventData": {"eventName": "8ZCzm4Hv", "properties": {"NMntXHcq": {}, "lZ4J8qtA": {}, "zqoX8a0t": {}}}, "eventId": "rVsB2HKQ", "version": "B9Hx48ld"}], "thirdPartyUserId": "haVcE0JA", "userId": "TzsEimlQ"}, {"events": [{"dateTime": "9NCJSRDt", "eventData": {"eventName": "iJaQXtgs", "properties": {"yPWNQaNo": {}, "6aj4Scrh": {}, "wULuUaMP": {}}}, "eventId": "TX7jssFx", "version": "mIRoWGMX"}, {"dateTime": "sCBxGuvm", "eventData": {"eventName": "0mcpNcKn", "properties": {"WUny40UL": {}, "Z49rf6XD": {}, "gZFTgh5c": {}}}, "eventId": "3O49Li3m", "version": "zRXtN0Yd"}, {"dateTime": "SFZoUvVG", "eventData": {"eventName": "Wqsi2IsN", "properties": {"D3IRn0pD": {}, "buf73dMH": {}, "jV4BPBPc": {}}}, "eventId": "3O45PpWt", "version": "NNmjSvMo"}], "thirdPartyUserId": "ooatGN0v", "userId": "gHPTnflm"}, {"events": [{"dateTime": "o2bhqwhX", "eventData": {"eventName": "GW65FgxW", "properties": {"NyIXPsCx": {}, "6hBf5hcw": {}, "KsacL0kB": {}}}, "eventId": "Y5zZy2sM", "version": "x6PEKvcZ"}, {"dateTime": "TVYegbbi", "eventData": {"eventName": "1OVFxZgG", "properties": {"7jZV69T6": {}, "lf7uTguU": {}, "JuNB1vLu": {}}}, "eventId": "FNxsx3qz", "version": "YCHDAcHI"}, {"dateTime": "7VjImOrr", "eventData": {"eventName": "AsMlAtOw", "properties": {"5bYdyblu": {}, "qKy8bJ9t": {}, "eVBafnF3": {}}}, "eventId": "0Lpqyqjp", "version": "em7oEtML"}], "thirdPartyUserId": "ntrbgJ4X", "userId": "WqLGUt0i"}]}' \
    > test.out 2>&1
eval_tap $? 13 'BulkCreatePSNEvent' test.out

#- 14 AdminListTags
./ng net.accelbyte.sdk.cli.Main achievement adminListTags \
    --namespace "$AB_NAMESPACE" \
    --limit '62' \
    --name 'kSrYRhvW' \
    --offset '7' \
    --sortBy 'name' \
    > test.out 2>&1
eval_tap $? 14 'AdminListTags' test.out

#- 15 AdminListUserAchievements
./ng net.accelbyte.sdk.cli.Main achievement adminListUserAchievements \
    --namespace "$AB_NAMESPACE" \
    --userId '4mkzWLWJ' \
    --limit '57' \
    --offset '81' \
    --preferUnlocked  \
    --sortBy 'achievedAt:desc' \
    --tags 'qvakx948,wJxsUYSo,xXpzWyZi' \
    > test.out 2>&1
eval_tap $? 15 'AdminListUserAchievements' test.out

#- 16 AdminBatchQueryUserAchievements
./ng net.accelbyte.sdk.cli.Main achievement adminBatchQueryUserAchievements \
    --namespace "$AB_NAMESPACE" \
    --userId 'pUhAznvF' \
    --body '{"codes": ["yRW1t5YW", "E4wRaGZn", "Q5FyFWKR"], "status": 55}' \
    > test.out 2>&1
eval_tap $? 16 'AdminBatchQueryUserAchievements' test.out

#- 17 AdminBulkUnlockAchievement
./ng net.accelbyte.sdk.cli.Main achievement adminBulkUnlockAchievement \
    --namespace "$AB_NAMESPACE" \
    --userId 'aPdxk7Ve' \
    --body '{"achievementCodes": ["WVLVbSfP", "lGn6ROIo", "vDL3DQhY"]}' \
    > test.out 2>&1
eval_tap $? 17 'AdminBulkUnlockAchievement' test.out

#- 18 AdminResetAchievement
./ng net.accelbyte.sdk.cli.Main achievement adminResetAchievement \
    --achievementCode 'ZO62SrAP' \
    --namespace "$AB_NAMESPACE" \
    --userId 'AAsC9Pyr' \
    > test.out 2>&1
eval_tap $? 18 'AdminResetAchievement' test.out

#- 19 AdminUnlockAchievement
./ng net.accelbyte.sdk.cli.Main achievement adminUnlockAchievement \
    --achievementCode 'Bs5RJuGJ' \
    --namespace "$AB_NAMESPACE" \
    --userId 'jyqMiR1F' \
    > test.out 2>&1
eval_tap $? 19 'AdminUnlockAchievement' test.out

#- 20 AdminAnonymizeUserAchievement
./ng net.accelbyte.sdk.cli.Main achievement adminAnonymizeUserAchievement \
    --namespace "$AB_NAMESPACE" \
    --userId 'BIVr4ylr' \
    > test.out 2>&1
eval_tap $? 20 'AdminAnonymizeUserAchievement' test.out

#- 21 AdminListUserContributions
./ng net.accelbyte.sdk.cli.Main achievement adminListUserContributions \
    --namespace "$AB_NAMESPACE" \
    --userId 'DEj5irB3' \
    --achievementCodes 'jP7uJusa' \
    --limit '99' \
    --offset '87' \
    --sortBy 'contributedValue' \
    --tags '1ENLoztb,GYW1Gj5O,Hv3XdH1z' \
    > test.out 2>&1
eval_tap $? 21 'AdminListUserContributions' test.out

#- 22 PublicListAchievements
./ng net.accelbyte.sdk.cli.Main achievement publicListAchievements \
    --namespace "$AB_NAMESPACE" \
    --global  \
    --limit '48' \
    --offset '56' \
    --sortBy 'listOrder:desc' \
    --tags 'C6I330Mu,zlyCp077,pssPp1o5' \
    --language 'MvVtz3Bd' \
    > test.out 2>&1
eval_tap $? 22 'PublicListAchievements' test.out

#- 23 PublicGetAchievement
./ng net.accelbyte.sdk.cli.Main achievement publicGetAchievement \
    --achievementCode 'WibxbTDa' \
    --namespace "$AB_NAMESPACE" \
    --language 'MQxmZDt1' \
    > test.out 2>&1
eval_tap $? 23 'PublicGetAchievement' test.out

#- 24 PublicListGlobalAchievements
./ng net.accelbyte.sdk.cli.Main achievement publicListGlobalAchievements \
    --namespace "$AB_NAMESPACE" \
    --achievementCodes '7xqAXqEb' \
    --limit '94' \
    --offset '97' \
    --sortBy 'createdAt:asc' \
    --status 'OeSkb2Uz' \
    --tags 'HJj0yg1S,aZZmeERz,w3qbtHKk' \
    > test.out 2>&1
eval_tap $? 24 'PublicListGlobalAchievements' test.out

#- 25 ListGlobalAchievementContributors
./ng net.accelbyte.sdk.cli.Main achievement listGlobalAchievementContributors \
    --achievementCode '72ka7wI6' \
    --namespace "$AB_NAMESPACE" \
    --limit '85' \
    --offset '28' \
    --sortBy 'contributedValue:desc' \
    > test.out 2>&1
eval_tap $? 25 'ListGlobalAchievementContributors' test.out

#- 26 PublicListTags
./ng net.accelbyte.sdk.cli.Main achievement publicListTags \
    --namespace "$AB_NAMESPACE" \
    --limit '84' \
    --name 'La2QGSVs' \
    --offset '0' \
    --sortBy 'name' \
    > test.out 2>&1
eval_tap $? 26 'PublicListTags' test.out

#- 27 PublicListUserAchievements
./ng net.accelbyte.sdk.cli.Main achievement publicListUserAchievements \
    --namespace "$AB_NAMESPACE" \
    --userId 'D9OQhNK6' \
    --limit '22' \
    --offset '12' \
    --preferUnlocked  \
    --sortBy 'achievedAt:asc' \
    --tags 'RsIOE3Su,Ru6SAqbA,Pr8v0cwy' \
    > test.out 2>&1
eval_tap $? 27 'PublicListUserAchievements' test.out

#- 28 PublicBulkUnlockAchievement
./ng net.accelbyte.sdk.cli.Main achievement publicBulkUnlockAchievement \
    --namespace "$AB_NAMESPACE" \
    --userId 'aMzAVv2T' \
    --body '{"achievementCodes": ["KdksuN58", "vMmw0n2B", "EkcILWXN"]}' \
    > test.out 2>&1
eval_tap $? 28 'PublicBulkUnlockAchievement' test.out

#- 29 PublicUnlockAchievement
./ng net.accelbyte.sdk.cli.Main achievement publicUnlockAchievement \
    --achievementCode '8gDU0im3' \
    --namespace "$AB_NAMESPACE" \
    --userId 'lobaprhe' \
    > test.out 2>&1
eval_tap $? 29 'PublicUnlockAchievement' test.out

#- 30 ListUserContributions
./ng net.accelbyte.sdk.cli.Main achievement listUserContributions \
    --namespace "$AB_NAMESPACE" \
    --userId 'ZQmokGt5' \
    --achievementCodes '0QNaxQiU' \
    --limit '35' \
    --offset '77' \
    --sortBy 'contributedValue' \
    --tags 'nywosUGw,QgJAwrYG,JFu6adAG' \
    > test.out 2>&1
eval_tap $? 30 'ListUserContributions' test.out

#- 31 ClaimGlobalAchievementReward
./ng net.accelbyte.sdk.cli.Main achievement claimGlobalAchievementReward \
    --achievementCode 'rMcrJaAI' \
    --namespace "$AB_NAMESPACE" \
    --userId 'hiI0TZbD' \
    > test.out 2>&1
eval_tap $? 31 'ClaimGlobalAchievementReward' test.out


rm -f "tmp.dat"

exit $EXIT_CODE