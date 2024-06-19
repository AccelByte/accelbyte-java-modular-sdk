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
    --offset '100' \
    --sortBy 'createdAt' \
    --tags 'WCfvdQC3,Cqq8gXQA,RcGOKpiE' \
    > test.out 2>&1
eval_tap $? 2 'AdminListAchievements' test.out

#- 3 AdminCreateNewAchievement
./ng net.accelbyte.sdk.cli.Main achievement adminCreateNewAchievement \
    --namespace "$AB_NAMESPACE" \
    --body '{"achievementCode": "fdCdph6S", "customAttributes": {"pyBQuMgj": {}, "HKBXE9uV": {}, "sgSggYwm": {}}, "defaultLanguage": "Etf7mccT", "description": {"XxjGiC4X": "UDJFDDKK", "QNiv0m6Y": "RpSd9ktc", "hUrcj8Ii": "xF8tJXLn"}, "global": false, "goalValue": 0.126758611186237, "hidden": true, "incremental": true, "lockedIcons": [{"slug": "hMYUItds", "url": "sSypLtgp"}, {"slug": "RIdSjAU1", "url": "pHZk6t1X"}, {"slug": "ke4sUZWl", "url": "EeEWhY4f"}], "name": {"HVu5c6wQ": "VuWTjaIj", "FN7S7s8U": "8jkKaom8", "APk6jVX5": "5TezJ1lH"}, "statCode": "jQFbx9du", "tags": ["EiTx0O3Y", "yWlNwLif", "WuWEVhKx"], "unlockedIcons": [{"slug": "UKPlxT9U", "url": "trphySJ1"}, {"slug": "6tirkF83", "url": "RyoDWK8x"}, {"slug": "E7kpqCDJ", "url": "P0aN8rmF"}]}' \
    > test.out 2>&1
eval_tap $? 3 'AdminCreateNewAchievement' test.out

#- 4 ExportAchievements
./ng net.accelbyte.sdk.cli.Main achievement exportAchievements \
    --namespace "$AB_NAMESPACE" \
    --tags 'o5wn0yHD,RO7zyDIO,KLJCjbao' \
    > test.out 2>&1
eval_tap $? 4 'ExportAchievements' test.out

#- 5 ImportAchievements
./ng net.accelbyte.sdk.cli.Main achievement importAchievements \
    --namespace "$AB_NAMESPACE" \
    --file 'tmp.dat' \
    --strategy '5DfwVBs1' \
    > test.out 2>&1
eval_tap $? 5 'ImportAchievements' test.out

#- 6 AdminGetAchievement
./ng net.accelbyte.sdk.cli.Main achievement adminGetAchievement \
    --achievementCode 'wERheUDC' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 6 'AdminGetAchievement' test.out

#- 7 AdminUpdateAchievement
./ng net.accelbyte.sdk.cli.Main achievement adminUpdateAchievement \
    --achievementCode 'GC2xHvXI' \
    --namespace "$AB_NAMESPACE" \
    --body '{"customAttributes": {"hv0Phbty": {}, "vYjz2hSC": {}, "Mh4WOIAI": {}}, "defaultLanguage": "eudvbpaV", "description": {"s7WO1JDg": "AHyTUuDi", "Kv2MJtoV": "4VCScvs0", "tG6rU1jr": "X46NghBs"}, "global": false, "goalValue": 0.9161870081513808, "hidden": false, "incremental": true, "lockedIcons": [{"slug": "asjTh49c", "url": "WRqEoURB"}, {"slug": "2RB7IpcV", "url": "gyMpwOd6"}, {"slug": "Qwc5aaNA", "url": "vWjEq5aU"}], "name": {"jWh8XlRW": "TzkNixHT", "pxfebOlN": "5UbvFRrA", "z4vE8WKS": "pWekt3nv"}, "statCode": "Y4Auf8bD", "tags": ["IpAx8D6W", "t7Vz7Woi", "8LpwJtXq"], "unlockedIcons": [{"slug": "nGiykui4", "url": "Wmrv74GL"}, {"slug": "VDYNSN6y", "url": "Std50ygc"}, {"slug": "P5XrxMqO", "url": "NgMXGEpf"}]}' \
    > test.out 2>&1
eval_tap $? 7 'AdminUpdateAchievement' test.out

#- 8 AdminDeleteAchievement
./ng net.accelbyte.sdk.cli.Main achievement adminDeleteAchievement \
    --achievementCode '5BvKWTbR' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 8 'AdminDeleteAchievement' test.out

#- 9 AdminUpdateAchievementListOrder
./ng net.accelbyte.sdk.cli.Main achievement adminUpdateAchievementListOrder \
    --achievementCode '9Gc9WjFc' \
    --namespace "$AB_NAMESPACE" \
    --body '{"targetOrder": 85}' \
    > test.out 2>&1
eval_tap $? 9 'AdminUpdateAchievementListOrder' test.out

#- 10 AdminListGlobalAchievements
./ng net.accelbyte.sdk.cli.Main achievement adminListGlobalAchievements \
    --namespace "$AB_NAMESPACE" \
    --achievementCodes 'rLSmWpbT' \
    --limit '52' \
    --offset '84' \
    --sortBy 'LInfXR6x' \
    --status 'H4Ozf3YS' \
    --tags '9sIdbzb9,w6QBgHCk,kOUmMwFN' \
    > test.out 2>&1
eval_tap $? 10 'AdminListGlobalAchievements' test.out

#- 11 AdminListGlobalAchievementContributors
./ng net.accelbyte.sdk.cli.Main achievement adminListGlobalAchievementContributors \
    --achievementCode 'RTZBnH0d' \
    --namespace "$AB_NAMESPACE" \
    --limit '9' \
    --offset '62' \
    --sortBy '82z05KI3' \
    > test.out 2>&1
eval_tap $? 11 'AdminListGlobalAchievementContributors' test.out

#- 12 ResetGlobalAchievement
./ng net.accelbyte.sdk.cli.Main achievement resetGlobalAchievement \
    --achievementCode '6FwkLPrm' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 12 'ResetGlobalAchievement' test.out

#- 13 BulkCreatePSNEvent
./ng net.accelbyte.sdk.cli.Main achievement bulkCreatePSNEvent \
    --namespace "$AB_NAMESPACE" \
    --body '{"data": [{"events": [{"dateTime": "5G6RWx20", "eventData": {"eventName": "ENPG6N9j", "properties": {"wgbhruu2": {}, "qa9NtYtH": {}, "rvkPnoN1": {}}}, "eventId": "6e1bp0sH", "version": "SumC1w8h"}, {"dateTime": "laSbYV3G", "eventData": {"eventName": "dotHTKmm", "properties": {"tWJzqYmk": {}, "LAD36r3Q": {}, "Is55CNMN": {}}}, "eventId": "44M2rFUa", "version": "MbrNRrVm"}, {"dateTime": "ojCGdR7m", "eventData": {"eventName": "PXaGCWXZ", "properties": {"y76h0o7y": {}, "IlttMLgA": {}, "eBgny408": {}}}, "eventId": "qHJbAICT", "version": "EaSXIRcX"}], "thirdPartyUserId": "mDXp3yWB", "userId": "i2dmnNAb"}, {"events": [{"dateTime": "Mx3ubxiQ", "eventData": {"eventName": "LlFSRDep", "properties": {"l6U0ZyRp": {}, "ILdHQQA2": {}, "vicsLhpi": {}}}, "eventId": "Kzy4ebby", "version": "rRzZZxzZ"}, {"dateTime": "3goQbFng", "eventData": {"eventName": "fr1G5VI0", "properties": {"x31tt0ZK": {}, "h7JellTM": {}, "Q6UirBU9": {}}}, "eventId": "qEkyvW6s", "version": "FlpBPtYR"}, {"dateTime": "53bd40O8", "eventData": {"eventName": "nbkMvaza", "properties": {"SPmPCI6o": {}, "ZUCLDVTs": {}, "B98BVgod": {}}}, "eventId": "d6HkKq8g", "version": "yM8KY31g"}], "thirdPartyUserId": "kZOJeHR7", "userId": "b36a2I4D"}, {"events": [{"dateTime": "6r6KiU0w", "eventData": {"eventName": "mSXTtikL", "properties": {"4XgTf9Hh": {}, "yjQmnams": {}, "bQV0rPUi": {}}}, "eventId": "hOAYkT7V", "version": "zVfWifXQ"}, {"dateTime": "WU9CLJue", "eventData": {"eventName": "ZNwBgVc9", "properties": {"27lL8nAW": {}, "olGysd5j": {}, "khSbUCGs": {}}}, "eventId": "deDw1l45", "version": "2bD8vZze"}, {"dateTime": "75ZxfHFL", "eventData": {"eventName": "F2C4RZjT", "properties": {"ycC6XToC": {}, "M8uxYQCm": {}, "LfHdBYpF": {}}}, "eventId": "segDl3xm", "version": "qMlgNCrK"}], "thirdPartyUserId": "UCBKyFlk", "userId": "Gy434mHg"}]}' \
    > test.out 2>&1
eval_tap $? 13 'BulkCreatePSNEvent' test.out

#- 14 AdminListTags
./ng net.accelbyte.sdk.cli.Main achievement adminListTags \
    --namespace "$AB_NAMESPACE" \
    --limit '54' \
    --name '5bS36ZEm' \
    --offset '84' \
    --sortBy 'ICyMSwFq' \
    > test.out 2>&1
eval_tap $? 14 'AdminListTags' test.out

#- 15 AdminListUserAchievements
./ng net.accelbyte.sdk.cli.Main achievement adminListUserAchievements \
    --namespace "$AB_NAMESPACE" \
    --userId 'OaWKQRHl' \
    --limit '73' \
    --offset '76' \
    --preferUnlocked  \
    --sortBy '92YQP0Z4' \
    --tags '5lIgGSu5,umv8BlNh,fdoaEAZ8' \
    > test.out 2>&1
eval_tap $? 15 'AdminListUserAchievements' test.out

#- 16 AdminResetAchievement
./ng net.accelbyte.sdk.cli.Main achievement adminResetAchievement \
    --achievementCode 'RLTKnafh' \
    --namespace "$AB_NAMESPACE" \
    --userId 'vqE5sKIj' \
    > test.out 2>&1
eval_tap $? 16 'AdminResetAchievement' test.out

#- 17 AdminUnlockAchievement
./ng net.accelbyte.sdk.cli.Main achievement adminUnlockAchievement \
    --achievementCode 'rF9Q1Tnl' \
    --namespace "$AB_NAMESPACE" \
    --userId 'FmWr0SWr' \
    > test.out 2>&1
eval_tap $? 17 'AdminUnlockAchievement' test.out

#- 18 AdminAnonymizeUserAchievement
./ng net.accelbyte.sdk.cli.Main achievement adminAnonymizeUserAchievement \
    --namespace "$AB_NAMESPACE" \
    --userId 'ghmKc3JS' \
    > test.out 2>&1
eval_tap $? 18 'AdminAnonymizeUserAchievement' test.out

#- 19 AdminListUserContributions
./ng net.accelbyte.sdk.cli.Main achievement adminListUserContributions \
    --namespace "$AB_NAMESPACE" \
    --userId 'SgB8NVEm' \
    --achievementCodes 'r4WRueWe' \
    --limit '82' \
    --offset '97' \
    --sortBy 'ule1zkWp' \
    --tags 'tjIyCKBk,ngdyhfJC,rLYjzLWy' \
    > test.out 2>&1
eval_tap $? 19 'AdminListUserContributions' test.out

#- 20 PublicListAchievements
./ng net.accelbyte.sdk.cli.Main achievement publicListAchievements \
    --namespace "$AB_NAMESPACE" \
    --global  \
    --limit '0' \
    --offset '69' \
    --sortBy 'updatedAt' \
    --tags 'QrNQ5kHz,3f4sDmLo,X3ddt70L' \
    --language '6N4cEQ7m' \
    > test.out 2>&1
eval_tap $? 20 'PublicListAchievements' test.out

#- 21 PublicGetAchievement
./ng net.accelbyte.sdk.cli.Main achievement publicGetAchievement \
    --achievementCode 'UAlVNLiJ' \
    --namespace "$AB_NAMESPACE" \
    --language 'jT4gcrP1' \
    > test.out 2>&1
eval_tap $? 21 'PublicGetAchievement' test.out

#- 22 PublicListGlobalAchievements
./ng net.accelbyte.sdk.cli.Main achievement publicListGlobalAchievements \
    --namespace "$AB_NAMESPACE" \
    --achievementCodes 'kTgqx7jP' \
    --limit '18' \
    --offset '16' \
    --sortBy 'nSzK3nF5' \
    --status 'tFkKBNVj' \
    --tags 'PwHBgARO,zAIaql77,tLlUnEmS' \
    > test.out 2>&1
eval_tap $? 22 'PublicListGlobalAchievements' test.out

#- 23 ListGlobalAchievementContributors
./ng net.accelbyte.sdk.cli.Main achievement listGlobalAchievementContributors \
    --achievementCode 't3C5hDcx' \
    --namespace "$AB_NAMESPACE" \
    --limit '78' \
    --offset '52' \
    --sortBy 'wTvm2DJ2' \
    > test.out 2>&1
eval_tap $? 23 'ListGlobalAchievementContributors' test.out

#- 24 PublicListTags
./ng net.accelbyte.sdk.cli.Main achievement publicListTags \
    --namespace "$AB_NAMESPACE" \
    --limit '74' \
    --name 'w3S26xme' \
    --offset '66' \
    --sortBy 'aMQiM65N' \
    > test.out 2>&1
eval_tap $? 24 'PublicListTags' test.out

#- 25 PublicListUserAchievements
./ng net.accelbyte.sdk.cli.Main achievement publicListUserAchievements \
    --namespace "$AB_NAMESPACE" \
    --userId 'XZje7D07' \
    --limit '18' \
    --offset '96' \
    --preferUnlocked  \
    --sortBy 'zGBiY0yN' \
    --tags 'MSrPNGeI,0fuTeWDp,pY4WyywA' \
    > test.out 2>&1
eval_tap $? 25 'PublicListUserAchievements' test.out

#- 26 PublicUnlockAchievement
./ng net.accelbyte.sdk.cli.Main achievement publicUnlockAchievement \
    --achievementCode 'SGWcJiLv' \
    --namespace "$AB_NAMESPACE" \
    --userId 'zwFSJJks' \
    > test.out 2>&1
eval_tap $? 26 'PublicUnlockAchievement' test.out

#- 27 ListUserContributions
./ng net.accelbyte.sdk.cli.Main achievement listUserContributions \
    --namespace "$AB_NAMESPACE" \
    --userId 'l5fNvz7R' \
    --achievementCodes 'd5SjzXwX' \
    --limit '13' \
    --offset '90' \
    --sortBy 'TEUjcQuS' \
    --tags 'OMyEaa5N,KI7sDAzF,2CE7vJmR' \
    > test.out 2>&1
eval_tap $? 27 'ListUserContributions' test.out

#- 28 ClaimGlobalAchievementReward
./ng net.accelbyte.sdk.cli.Main achievement claimGlobalAchievementReward \
    --achievementCode '0x8LHsr8' \
    --namespace "$AB_NAMESPACE" \
    --userId 'SnokWWqt' \
    > test.out 2>&1
eval_tap $? 28 'ClaimGlobalAchievementReward' test.out


rm -f "tmp.dat"

exit $EXIT_CODE