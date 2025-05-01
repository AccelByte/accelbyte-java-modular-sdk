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
    --limit '68' \
    --offset '87' \
    --sortBy 'listOrder' \
    --tags 'd0eM5rb3,i0pgoCQ1,sq89z0hg' \
    > test.out 2>&1
eval_tap $? 2 'AdminListAchievements' test.out

#- 3 AdminCreateNewAchievement
./ng net.accelbyte.sdk.cli.Main achievement adminCreateNewAchievement \
    --namespace "$AB_NAMESPACE" \
    --body '{"achievementCode": "DE5h9pNR", "customAttributes": {"3nL5ZpOB": {}, "rqqzIcSL": {}, "M4vykwLn": {}}, "defaultLanguage": "YYRQ5XaF", "description": {"JBxegQLg": "Kn0rvkjV", "2ET2hJPO": "Ju8XxVY8", "haWeklfq": "TDT0zkw5"}, "global": true, "goalValue": 0.8175794394884781, "hidden": true, "incremental": false, "lockedIcons": [{"slug": "VtQ3xa8T", "url": "1uPQNDBg"}, {"slug": "zuRmojUT", "url": "jZCLacQl"}, {"slug": "ExnzAS3s", "url": "QY8wZrgc"}], "name": {"IZsZx0mN": "f0iNPF8D", "pSWm301y": "XxHSm6RE", "ur1Rw07M": "vPTUHyOU"}, "statCode": "1Xx3GkbC", "tags": ["44g9S8SD", "oTax5v67", "EE9DTvb6"], "unlockedIcons": [{"slug": "bU7bCNLR", "url": "YRDU5a4E"}, {"slug": "gahvejyZ", "url": "9qaydZ64"}, {"slug": "8OBcLgph", "url": "fbQGsVLv"}]}' \
    > test.out 2>&1
eval_tap $? 3 'AdminCreateNewAchievement' test.out

#- 4 ExportAchievements
./ng net.accelbyte.sdk.cli.Main achievement exportAchievements \
    --namespace "$AB_NAMESPACE" \
    --tags 'JChoiaPL,dhA50E9o,yqzsPChY' \
    > test.out 2>&1
eval_tap $? 4 'ExportAchievements' test.out

#- 5 ImportAchievements
./ng net.accelbyte.sdk.cli.Main achievement importAchievements \
    --namespace "$AB_NAMESPACE" \
    --file 'tmp.dat' \
    --strategy 'aBfosQoO' \
    > test.out 2>&1
eval_tap $? 5 'ImportAchievements' test.out

#- 6 AdminGetAchievement
./ng net.accelbyte.sdk.cli.Main achievement adminGetAchievement \
    --achievementCode 'QMlSlUVC' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 6 'AdminGetAchievement' test.out

#- 7 AdminUpdateAchievement
./ng net.accelbyte.sdk.cli.Main achievement adminUpdateAchievement \
    --achievementCode 'olBorjT7' \
    --namespace "$AB_NAMESPACE" \
    --body '{"customAttributes": {"CReNrJfA": {}, "twUCBWSr": {}, "jnlu08pl": {}}, "defaultLanguage": "wAMXJxRQ", "description": {"dDil3cET": "GxXzWcJ8", "vXWEvqFz": "mtyzsgoE", "1Hwc99ok": "JN5d5WMi"}, "global": false, "goalValue": 0.5878920590868408, "hidden": true, "incremental": true, "lockedIcons": [{"slug": "j4QPh4uv", "url": "Pw1ydkec"}, {"slug": "WgBszOhW", "url": "y8ZxOJhl"}, {"slug": "2CfVDhHU", "url": "CkNB6rmF"}], "name": {"8QgO8FEf": "AXmP06eD", "qVJnIqPB": "wpwQvbWK", "IaOSOiuy": "KAeoJsxW"}, "statCode": "notHCi8D", "tags": ["7cZq9kHJ", "ckjNCPv3", "dkacKwnh"], "unlockedIcons": [{"slug": "dlDjMo8G", "url": "4uV3JE09"}, {"slug": "XyZQEGGZ", "url": "w14bMwtF"}, {"slug": "f9TlhY9S", "url": "vREondLK"}]}' \
    > test.out 2>&1
eval_tap $? 7 'AdminUpdateAchievement' test.out

#- 8 AdminDeleteAchievement
./ng net.accelbyte.sdk.cli.Main achievement adminDeleteAchievement \
    --achievementCode 'wKbhNLsp' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 8 'AdminDeleteAchievement' test.out

#- 9 AdminUpdateAchievementListOrder
./ng net.accelbyte.sdk.cli.Main achievement adminUpdateAchievementListOrder \
    --achievementCode 'JCWhRttQ' \
    --namespace "$AB_NAMESPACE" \
    --body '{"targetOrder": 61}' \
    > test.out 2>&1
eval_tap $? 9 'AdminUpdateAchievementListOrder' test.out

#- 10 AdminListGlobalAchievements
./ng net.accelbyte.sdk.cli.Main achievement adminListGlobalAchievements \
    --namespace "$AB_NAMESPACE" \
    --achievementCodes 'w2DPnkZv' \
    --limit '46' \
    --offset '52' \
    --sortBy 'createdAt' \
    --status 'wPu9VXCG' \
    --tags 'hIzc2nxr,xtaOKibA,AEpv2ees' \
    > test.out 2>&1
eval_tap $? 10 'AdminListGlobalAchievements' test.out

#- 11 AdminListGlobalAchievementContributors
./ng net.accelbyte.sdk.cli.Main achievement adminListGlobalAchievementContributors \
    --achievementCode 'po7KagOX' \
    --namespace "$AB_NAMESPACE" \
    --limit '66' \
    --offset '90' \
    --sortBy 'contributedValue:asc' \
    > test.out 2>&1
eval_tap $? 11 'AdminListGlobalAchievementContributors' test.out

#- 12 ResetGlobalAchievement
./ng net.accelbyte.sdk.cli.Main achievement resetGlobalAchievement \
    --achievementCode 'oVvDQlUm' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 12 'ResetGlobalAchievement' test.out

#- 13 BulkCreatePSNEvent
./ng net.accelbyte.sdk.cli.Main achievement bulkCreatePSNEvent \
    --namespace "$AB_NAMESPACE" \
    --body '{"data": [{"events": [{"dateTime": "Jpe54jwj", "eventData": {"eventName": "WefUsHng", "properties": {"y2y4exXs": {}, "UsJkMqTU": {}, "A3oPl2RB": {}}}, "eventId": "o1TubvRD", "version": "FjXxqa0W"}, {"dateTime": "YloQWoHj", "eventData": {"eventName": "8IKCvNXV", "properties": {"lcs9hDpY": {}, "O3TCuCgn": {}, "JjufT9X9": {}}}, "eventId": "F3HeTZnB", "version": "ARwGa4CC"}, {"dateTime": "M31JiDL5", "eventData": {"eventName": "Y61AMVJo", "properties": {"p1eAfqu8": {}, "8LUzNUzi": {}, "yIxFPFix": {}}}, "eventId": "JNhbz4N4", "version": "Ugw0lWSg"}], "thirdPartyUserId": "4h0GAO2k", "userId": "5XKKLQJq"}, {"events": [{"dateTime": "2O3WWJMq", "eventData": {"eventName": "XksFoEJ1", "properties": {"S6lH69my": {}, "dMVC9c3v": {}, "8PBXL5CU": {}}}, "eventId": "IJ03EoGd", "version": "sxFONleX"}, {"dateTime": "EeuREnQE", "eventData": {"eventName": "vUubex2e", "properties": {"YZ80wTU7": {}, "3lRG4x7T": {}, "0AeyAzBp": {}}}, "eventId": "bjSXjXxc", "version": "ktaGhta4"}, {"dateTime": "jIwSQKR1", "eventData": {"eventName": "tF7TVPeP", "properties": {"DGY9G7nV": {}, "IxZ5XQJt": {}, "PdnClYwi": {}}}, "eventId": "q07t6PAa", "version": "s4q85N58"}], "thirdPartyUserId": "KzhHrhJV", "userId": "95C6no3W"}, {"events": [{"dateTime": "D2Kiwkp1", "eventData": {"eventName": "rTu6CipY", "properties": {"paULiesT": {}, "tAxjp4q3": {}, "edNN5oOF": {}}}, "eventId": "z6e1chKB", "version": "zN7GGKbE"}, {"dateTime": "MmfT8Ovr", "eventData": {"eventName": "Bdj1mHNT", "properties": {"gSxEnBtj": {}, "BppRXCt3": {}, "jlhVV1zt": {}}}, "eventId": "fznkmnWP", "version": "49zO15Z7"}, {"dateTime": "rpBLLMRg", "eventData": {"eventName": "WnMB0eIp", "properties": {"adJ9HdHE": {}, "YiwZ0gCo": {}, "DIz4uzZH": {}}}, "eventId": "8LWHzBlv", "version": "BXYeBfct"}], "thirdPartyUserId": "u1moF0mk", "userId": "3LhsaNwP"}]}' \
    > test.out 2>&1
eval_tap $? 13 'BulkCreatePSNEvent' test.out

#- 14 AdminListTags
./ng net.accelbyte.sdk.cli.Main achievement adminListTags \
    --namespace "$AB_NAMESPACE" \
    --limit '7' \
    --name 'jmBFVkH8' \
    --offset '7' \
    --sortBy 'createdAt:desc' \
    > test.out 2>&1
eval_tap $? 14 'AdminListTags' test.out

#- 15 AdminListUserAchievements
./ng net.accelbyte.sdk.cli.Main achievement adminListUserAchievements \
    --namespace "$AB_NAMESPACE" \
    --userId 'Ui2GSwW0' \
    --limit '77' \
    --offset '1' \
    --preferUnlocked  \
    --sortBy 'achievedAt:asc' \
    --tags 'mgAfiuWo,kwLG0EYy,phSAEhzH' \
    > test.out 2>&1
eval_tap $? 15 'AdminListUserAchievements' test.out

#- 16 AdminBulkUnlockAchievement
./ng net.accelbyte.sdk.cli.Main achievement adminBulkUnlockAchievement \
    --namespace "$AB_NAMESPACE" \
    --userId 'vHBCZluW' \
    --body '{"achievementCodes": ["gVFTUcXp", "GfBpkJHU", "J7yMOogi"]}' \
    > test.out 2>&1
eval_tap $? 16 'AdminBulkUnlockAchievement' test.out

#- 17 AdminResetAchievement
./ng net.accelbyte.sdk.cli.Main achievement adminResetAchievement \
    --achievementCode 'yZqjlOhn' \
    --namespace "$AB_NAMESPACE" \
    --userId 'pF12VdWq' \
    > test.out 2>&1
eval_tap $? 17 'AdminResetAchievement' test.out

#- 18 AdminUnlockAchievement
./ng net.accelbyte.sdk.cli.Main achievement adminUnlockAchievement \
    --achievementCode 'dRt9W9v9' \
    --namespace "$AB_NAMESPACE" \
    --userId 'alqY4UmG' \
    > test.out 2>&1
eval_tap $? 18 'AdminUnlockAchievement' test.out

#- 19 AdminAnonymizeUserAchievement
./ng net.accelbyte.sdk.cli.Main achievement adminAnonymizeUserAchievement \
    --namespace "$AB_NAMESPACE" \
    --userId 'MnioB293' \
    > test.out 2>&1
eval_tap $? 19 'AdminAnonymizeUserAchievement' test.out

#- 20 AdminListUserContributions
./ng net.accelbyte.sdk.cli.Main achievement adminListUserContributions \
    --namespace "$AB_NAMESPACE" \
    --userId 'orNS5yCp' \
    --achievementCodes 'Vv8HMtMi' \
    --limit '92' \
    --offset '3' \
    --sortBy 'contributedValue:desc' \
    --tags 'XGEj6TMb,L2xqMvr7,EjexGgs3' \
    > test.out 2>&1
eval_tap $? 20 'AdminListUserContributions' test.out

#- 21 PublicListAchievements
./ng net.accelbyte.sdk.cli.Main achievement publicListAchievements \
    --namespace "$AB_NAMESPACE" \
    --global  \
    --limit '78' \
    --offset '64' \
    --sortBy 'updatedAt:desc' \
    --tags 'STIjuHh5,UtOR3r9V,htgTsJeV' \
    --language 'Ryu9F06o' \
    > test.out 2>&1
eval_tap $? 21 'PublicListAchievements' test.out

#- 22 PublicGetAchievement
./ng net.accelbyte.sdk.cli.Main achievement publicGetAchievement \
    --achievementCode 'PKpkCG2Y' \
    --namespace "$AB_NAMESPACE" \
    --language 'VlBVGvaX' \
    > test.out 2>&1
eval_tap $? 22 'PublicGetAchievement' test.out

#- 23 PublicListGlobalAchievements
./ng net.accelbyte.sdk.cli.Main achievement publicListGlobalAchievements \
    --namespace "$AB_NAMESPACE" \
    --achievementCodes 'xVwzElgh' \
    --limit '66' \
    --offset '71' \
    --sortBy 'achievedAt' \
    --status 'mWOnSyM3' \
    --tags 'xewQblbN,b3H0lUWJ,mLnMJn36' \
    > test.out 2>&1
eval_tap $? 23 'PublicListGlobalAchievements' test.out

#- 24 ListGlobalAchievementContributors
./ng net.accelbyte.sdk.cli.Main achievement listGlobalAchievementContributors \
    --achievementCode 'XylMP6cA' \
    --namespace "$AB_NAMESPACE" \
    --limit '84' \
    --offset '31' \
    --sortBy 'contributedValue' \
    > test.out 2>&1
eval_tap $? 24 'ListGlobalAchievementContributors' test.out

#- 25 PublicListTags
./ng net.accelbyte.sdk.cli.Main achievement publicListTags \
    --namespace "$AB_NAMESPACE" \
    --limit '40' \
    --name 'QNGUe5us' \
    --offset '76' \
    --sortBy 'createdAt:desc' \
    > test.out 2>&1
eval_tap $? 25 'PublicListTags' test.out

#- 26 PublicListUserAchievements
./ng net.accelbyte.sdk.cli.Main achievement publicListUserAchievements \
    --namespace "$AB_NAMESPACE" \
    --userId 'aHdwGXHp' \
    --limit '50' \
    --offset '53' \
    --preferUnlocked  \
    --sortBy 'createdAt' \
    --tags 'mPdz06J8,am0OwGpU,9l0fl7FS' \
    > test.out 2>&1
eval_tap $? 26 'PublicListUserAchievements' test.out

#- 27 PublicBulkUnlockAchievement
./ng net.accelbyte.sdk.cli.Main achievement publicBulkUnlockAchievement \
    --namespace "$AB_NAMESPACE" \
    --userId 'MjsSykOa' \
    --body '{"achievementCodes": ["QBfMEAnx", "KETivxoT", "KHpMjEJr"]}' \
    > test.out 2>&1
eval_tap $? 27 'PublicBulkUnlockAchievement' test.out

#- 28 PublicUnlockAchievement
./ng net.accelbyte.sdk.cli.Main achievement publicUnlockAchievement \
    --achievementCode 'Xg7SDEoN' \
    --namespace "$AB_NAMESPACE" \
    --userId '5C4j75uu' \
    > test.out 2>&1
eval_tap $? 28 'PublicUnlockAchievement' test.out

#- 29 ListUserContributions
./ng net.accelbyte.sdk.cli.Main achievement listUserContributions \
    --namespace "$AB_NAMESPACE" \
    --userId 's9edzpCe' \
    --achievementCodes 'RJWieOtx' \
    --limit '20' \
    --offset '47' \
    --sortBy 'contributedValue' \
    --tags 'moERhpfw,nR5qjFKq,kl5OpoFn' \
    > test.out 2>&1
eval_tap $? 29 'ListUserContributions' test.out

#- 30 ClaimGlobalAchievementReward
./ng net.accelbyte.sdk.cli.Main achievement claimGlobalAchievementReward \
    --achievementCode '0OAl3jOQ' \
    --namespace "$AB_NAMESPACE" \
    --userId 'gRY5nQPH' \
    > test.out 2>&1
eval_tap $? 30 'ClaimGlobalAchievementReward' test.out


rm -f "tmp.dat"

exit $EXIT_CODE