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
    --limit '41' \
    --offset '2' \
    --sortBy 'listOrder' \
    --tags 'vwtDeCCs,28J2TzSL,ri5mbyYm' \
    > test.out 2>&1
eval_tap $? 2 'AdminListAchievements' test.out

#- 3 AdminCreateNewAchievement
./ng net.accelbyte.sdk.cli.Main achievement adminCreateNewAchievement \
    --namespace "$AB_NAMESPACE" \
    --body '{"achievementCode": "8v09lJTJ", "customAttributes": {"r7wii0Sy": {}, "J68ACsTF": {}, "sYYdD1kr": {}}, "defaultLanguage": "o5NluWtg", "description": {"yHU3T6G5": "bxf9bqJx", "1BMXDXUJ": "OoNJfuhi", "9l83ut4p": "PbKUnEBm"}, "global": true, "goalValue": 0.7026910944223936, "hidden": false, "incremental": false, "lockedIcons": [{"slug": "NGqcq37c", "url": "w9UrJAw4"}, {"slug": "QNvj36dZ", "url": "grbASxqP"}, {"slug": "nsH8Tkes", "url": "tqcthWmz"}], "name": {"HE9ox9qx": "LUuRZjzQ", "5Z5puu0L": "DBhWhN2K", "TU6qQbkO": "nbytZht9"}, "statCode": "zEwQPhRL", "tags": ["hsC8uwcU", "1DacOIn7", "JwoV7crH"], "unlockedIcons": [{"slug": "BuhR0Ma1", "url": "c18ZW6ju"}, {"slug": "LVcxNfW9", "url": "3TSZomra"}, {"slug": "zQPO8g2y", "url": "360TuPLY"}]}' \
    > test.out 2>&1
eval_tap $? 3 'AdminCreateNewAchievement' test.out

#- 4 ExportAchievements
./ng net.accelbyte.sdk.cli.Main achievement exportAchievements \
    --namespace "$AB_NAMESPACE" \
    --tags 'oEsKsL86,puvVyXkU,zrgEjaAt' \
    > test.out 2>&1
eval_tap $? 4 'ExportAchievements' test.out

#- 5 ImportAchievements
./ng net.accelbyte.sdk.cli.Main achievement importAchievements \
    --namespace "$AB_NAMESPACE" \
    --file 'tmp.dat' \
    --strategy 'rIAwGqNU' \
    > test.out 2>&1
eval_tap $? 5 'ImportAchievements' test.out

#- 6 AdminGetAchievement
./ng net.accelbyte.sdk.cli.Main achievement adminGetAchievement \
    --achievementCode 'OudTjz91' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 6 'AdminGetAchievement' test.out

#- 7 AdminUpdateAchievement
./ng net.accelbyte.sdk.cli.Main achievement adminUpdateAchievement \
    --achievementCode 'z8DkTLDC' \
    --namespace "$AB_NAMESPACE" \
    --body '{"customAttributes": {"lNVQRiF4": {}, "yx5QAaOd": {}, "krVV8Ixm": {}}, "defaultLanguage": "Zbxbg1PC", "description": {"OoRCNTMy": "Qq5k7tic", "YjPcuT7P": "rCLbNdkB", "eByszXWL": "Dc5vjgXJ"}, "global": false, "goalValue": 0.6537055253876675, "hidden": true, "incremental": false, "lockedIcons": [{"slug": "DAixak2g", "url": "PUgZkEgp"}, {"slug": "bGDw8Esg", "url": "bfklHxjb"}, {"slug": "RGPJjupP", "url": "8QXaaDHY"}], "name": {"efwQ6VoG": "ScgW6Re9", "W2AdHToy": "KOSEFD8I", "Thw2HVl2": "p4VLGJmL"}, "statCode": "gIl30JvV", "tags": ["l6X8Vzhw", "YxRj1l3E", "ZnEl2wK6"], "unlockedIcons": [{"slug": "hqOihK81", "url": "4TLBngIs"}, {"slug": "pyEGfZvo", "url": "Pgtdl3GW"}, {"slug": "GDuKUKM7", "url": "vYDbx9P8"}]}' \
    > test.out 2>&1
eval_tap $? 7 'AdminUpdateAchievement' test.out

#- 8 AdminDeleteAchievement
./ng net.accelbyte.sdk.cli.Main achievement adminDeleteAchievement \
    --achievementCode 'Z1rJXUg5' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 8 'AdminDeleteAchievement' test.out

#- 9 AdminUpdateAchievementListOrder
./ng net.accelbyte.sdk.cli.Main achievement adminUpdateAchievementListOrder \
    --achievementCode 'sKtZt9uI' \
    --namespace "$AB_NAMESPACE" \
    --body '{"targetOrder": 80}' \
    > test.out 2>&1
eval_tap $? 9 'AdminUpdateAchievementListOrder' test.out

#- 10 AdminListGlobalAchievements
./ng net.accelbyte.sdk.cli.Main achievement adminListGlobalAchievements \
    --namespace "$AB_NAMESPACE" \
    --achievementCodes 'ukKKs8Y8' \
    --limit '75' \
    --offset '65' \
    --sortBy 'createdAt' \
    --status 'NkusvZEx' \
    --tags 'tE0OrN3c,j1CoFMzm,e3R2lVo4' \
    > test.out 2>&1
eval_tap $? 10 'AdminListGlobalAchievements' test.out

#- 11 AdminListGlobalAchievementContributors
./ng net.accelbyte.sdk.cli.Main achievement adminListGlobalAchievementContributors \
    --achievementCode 'X4NAyBmd' \
    --namespace "$AB_NAMESPACE" \
    --limit '87' \
    --offset '45' \
    --sortBy 'contributedValue' \
    > test.out 2>&1
eval_tap $? 11 'AdminListGlobalAchievementContributors' test.out

#- 12 ResetGlobalAchievement
./ng net.accelbyte.sdk.cli.Main achievement resetGlobalAchievement \
    --achievementCode 'mio1lve1' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 12 'ResetGlobalAchievement' test.out

#- 13 BulkCreatePSNEvent
./ng net.accelbyte.sdk.cli.Main achievement bulkCreatePSNEvent \
    --namespace "$AB_NAMESPACE" \
    --body '{"data": [{"events": [{"dateTime": "51uosO3E", "eventData": {"eventName": "qrJKPPKC", "properties": {"VR4EQEdt": {}, "TNjmhOE6": {}, "CAq5XBUP": {}}}, "eventId": "yzMaqUwN", "version": "J8IfVkQ7"}, {"dateTime": "jCr5gGqM", "eventData": {"eventName": "FJeTELJ3", "properties": {"wYrNJaY1": {}, "3tQ2IKLO": {}, "45bYHDx7": {}}}, "eventId": "vKFQjis7", "version": "tfjDIQLA"}, {"dateTime": "sVQ40PC8", "eventData": {"eventName": "w58GVABg", "properties": {"FJGJ8sW7": {}, "2f85BEWc": {}, "EA13AB3k": {}}}, "eventId": "lSPhx7et", "version": "HQ7KEADc"}], "thirdPartyUserId": "m3D0YG9e", "userId": "EoDtPYWK"}, {"events": [{"dateTime": "KZDJxJe4", "eventData": {"eventName": "j2sth1B2", "properties": {"BMQ5vDhy": {}, "JkgBPDGv": {}, "FOAnfXKo": {}}}, "eventId": "leCfeKUp", "version": "9ILOb1sR"}, {"dateTime": "t1Z6EKCI", "eventData": {"eventName": "hBkQkhNG", "properties": {"Pjhj0AMI": {}, "L9OAG0zj": {}, "dDJlK4ph": {}}}, "eventId": "riqSqGhA", "version": "Ex6WZUCR"}, {"dateTime": "DO2tCI8Z", "eventData": {"eventName": "WI0w1N3T", "properties": {"cRqmOMtV": {}, "JmVpyP40": {}, "tNqDr9hy": {}}}, "eventId": "vKgL9RrO", "version": "HQBl8VcW"}], "thirdPartyUserId": "ioTiUbUs", "userId": "NrkRoyGh"}, {"events": [{"dateTime": "ufEOlmCS", "eventData": {"eventName": "14zgvca2", "properties": {"T3esSLxf": {}, "FAxXTV3C": {}, "KToQ0aP3": {}}}, "eventId": "TeMenV1K", "version": "C2P8cFPb"}, {"dateTime": "ubj13wR2", "eventData": {"eventName": "27Y88MEh", "properties": {"kOyGwFXn": {}, "5UISbjfI": {}, "qVsW1UJt": {}}}, "eventId": "LGTKLbgi", "version": "ktbus1gj"}, {"dateTime": "xRsZDCwo", "eventData": {"eventName": "vjks0gMs", "properties": {"Uk5Z3DTe": {}, "nfTJlQDY": {}, "UoRDH70y": {}}}, "eventId": "O8g0rRwh", "version": "qoOoyioj"}], "thirdPartyUserId": "Nlb31hn6", "userId": "H16fdgMN"}]}' \
    > test.out 2>&1
eval_tap $? 13 'BulkCreatePSNEvent' test.out

#- 14 AdminListTags
./ng net.accelbyte.sdk.cli.Main achievement adminListTags \
    --namespace "$AB_NAMESPACE" \
    --limit '61' \
    --name 'w2zxJ2P7' \
    --offset '22' \
    --sortBy 'createdAt' \
    > test.out 2>&1
eval_tap $? 14 'AdminListTags' test.out

#- 15 AdminListUserAchievements
./ng net.accelbyte.sdk.cli.Main achievement adminListUserAchievements \
    --namespace "$AB_NAMESPACE" \
    --userId 'rap2nNV2' \
    --limit '80' \
    --offset '84' \
    --preferUnlocked  \
    --sortBy 'createdAt:asc' \
    --tags 'XgSXbpx3,h4RCjBQO,LE7xWKbi' \
    > test.out 2>&1
eval_tap $? 15 'AdminListUserAchievements' test.out

#- 16 AdminBulkUnlockAchievement
./ng net.accelbyte.sdk.cli.Main achievement adminBulkUnlockAchievement \
    --namespace "$AB_NAMESPACE" \
    --userId 'VDoAynn4' \
    --body '{"achievementCodes": ["ZoFCDMaC", "yD2dxn6S", "dONHV40R"]}' \
    > test.out 2>&1
eval_tap $? 16 'AdminBulkUnlockAchievement' test.out

#- 17 AdminResetAchievement
./ng net.accelbyte.sdk.cli.Main achievement adminResetAchievement \
    --achievementCode '7W9h7YEv' \
    --namespace "$AB_NAMESPACE" \
    --userId 'AMw0oLr7' \
    > test.out 2>&1
eval_tap $? 17 'AdminResetAchievement' test.out

#- 18 AdminUnlockAchievement
./ng net.accelbyte.sdk.cli.Main achievement adminUnlockAchievement \
    --achievementCode 'VNwSDtxk' \
    --namespace "$AB_NAMESPACE" \
    --userId 'jJE4TCTJ' \
    > test.out 2>&1
eval_tap $? 18 'AdminUnlockAchievement' test.out

#- 19 AdminAnonymizeUserAchievement
./ng net.accelbyte.sdk.cli.Main achievement adminAnonymizeUserAchievement \
    --namespace "$AB_NAMESPACE" \
    --userId 'klaxHMi6' \
    > test.out 2>&1
eval_tap $? 19 'AdminAnonymizeUserAchievement' test.out

#- 20 AdminListUserContributions
./ng net.accelbyte.sdk.cli.Main achievement adminListUserContributions \
    --namespace "$AB_NAMESPACE" \
    --userId 'DVafY9Yh' \
    --achievementCodes 'k4YQKwz3' \
    --limit '7' \
    --offset '28' \
    --sortBy 'contributedValue' \
    --tags 'MQdAdQoW,y8vkAuv4,cTOBIJAt' \
    > test.out 2>&1
eval_tap $? 20 'AdminListUserContributions' test.out

#- 21 PublicListAchievements
./ng net.accelbyte.sdk.cli.Main achievement publicListAchievements \
    --namespace "$AB_NAMESPACE" \
    --global  \
    --limit '68' \
    --offset '61' \
    --sortBy 'listOrder' \
    --tags 'eUkYr3rm,TvwfFsci,5KA17li6' \
    --language 'KZKmMvhQ' \
    > test.out 2>&1
eval_tap $? 21 'PublicListAchievements' test.out

#- 22 PublicGetAchievement
./ng net.accelbyte.sdk.cli.Main achievement publicGetAchievement \
    --achievementCode '9zWkx7H2' \
    --namespace "$AB_NAMESPACE" \
    --language 'mwllb6jT' \
    > test.out 2>&1
eval_tap $? 22 'PublicGetAchievement' test.out

#- 23 PublicListGlobalAchievements
./ng net.accelbyte.sdk.cli.Main achievement publicListGlobalAchievements \
    --namespace "$AB_NAMESPACE" \
    --achievementCodes 'p8D3DOZR' \
    --limit '42' \
    --offset '7' \
    --sortBy 'createdAt:desc' \
    --status 'q8j08Msh' \
    --tags 'euEc0nM1,dBzIKu9T,dQFrUZmO' \
    > test.out 2>&1
eval_tap $? 23 'PublicListGlobalAchievements' test.out

#- 24 ListGlobalAchievementContributors
./ng net.accelbyte.sdk.cli.Main achievement listGlobalAchievementContributors \
    --achievementCode 'ZpkAnnHm' \
    --namespace "$AB_NAMESPACE" \
    --limit '32' \
    --offset '37' \
    --sortBy 'contributedValue:asc' \
    > test.out 2>&1
eval_tap $? 24 'ListGlobalAchievementContributors' test.out

#- 25 PublicListTags
./ng net.accelbyte.sdk.cli.Main achievement publicListTags \
    --namespace "$AB_NAMESPACE" \
    --limit '22' \
    --name 'PBaNHHx6' \
    --offset '53' \
    --sortBy 'createdAt:desc' \
    > test.out 2>&1
eval_tap $? 25 'PublicListTags' test.out

#- 26 PublicListUserAchievements
./ng net.accelbyte.sdk.cli.Main achievement publicListUserAchievements \
    --namespace "$AB_NAMESPACE" \
    --userId 'xdUhnVUI' \
    --limit '100' \
    --offset '71' \
    --preferUnlocked  \
    --sortBy 'createdAt' \
    --tags 'fl4jhQbw,mvW1zqhq,Yqxjzb2P' \
    > test.out 2>&1
eval_tap $? 26 'PublicListUserAchievements' test.out

#- 27 PublicBulkUnlockAchievement
./ng net.accelbyte.sdk.cli.Main achievement publicBulkUnlockAchievement \
    --namespace "$AB_NAMESPACE" \
    --userId 'pc2J8nGL' \
    --body '{"achievementCodes": ["RDcYth0T", "U3RFeIkQ", "IXIvJ8mu"]}' \
    > test.out 2>&1
eval_tap $? 27 'PublicBulkUnlockAchievement' test.out

#- 28 PublicUnlockAchievement
./ng net.accelbyte.sdk.cli.Main achievement publicUnlockAchievement \
    --achievementCode 'MBWHr2ei' \
    --namespace "$AB_NAMESPACE" \
    --userId 'ffUNDT0N' \
    > test.out 2>&1
eval_tap $? 28 'PublicUnlockAchievement' test.out

#- 29 ListUserContributions
./ng net.accelbyte.sdk.cli.Main achievement listUserContributions \
    --namespace "$AB_NAMESPACE" \
    --userId 'wGWyV74F' \
    --achievementCodes 'HQVr8MmD' \
    --limit '57' \
    --offset '6' \
    --sortBy 'contributedValue:asc' \
    --tags '2K8JqzRP,0W29hldu,4cSLJMWl' \
    > test.out 2>&1
eval_tap $? 29 'ListUserContributions' test.out

#- 30 ClaimGlobalAchievementReward
./ng net.accelbyte.sdk.cli.Main achievement claimGlobalAchievementReward \
    --achievementCode 'zeaCxf2V' \
    --namespace "$AB_NAMESPACE" \
    --userId 'HwybuodS' \
    > test.out 2>&1
eval_tap $? 30 'ClaimGlobalAchievementReward' test.out


rm -f "tmp.dat"

exit $EXIT_CODE