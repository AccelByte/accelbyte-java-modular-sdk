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
    --limit '19' \
    --offset '26' \
    --sortBy 'createdAt' \
    --tags 'd7KmRTd4,wbM3zHE2,v8s85Ofy' \
    > test.out 2>&1
eval_tap $? 2 'AdminListAchievements' test.out

#- 3 AdminCreateNewAchievement
./ng net.accelbyte.sdk.cli.Main achievement adminCreateNewAchievement \
    --namespace "$AB_NAMESPACE" \
    --body '{"achievementCode": "dR0Lmw3k", "customAttributes": {"wH6bMrD5": {}, "aPQTuRHT": {}, "iaOK6wy0": {}}, "defaultLanguage": "ws7zzyd9", "description": {"aw3PgRw8": "u4LX4AfG", "4p3n71aY": "E4XLOcx9", "tM41vw9R": "p1TYtDCk"}, "global": false, "goalValue": 0.5162285902710474, "hidden": false, "incremental": true, "lockedIcons": [{"slug": "iL2AJuBu", "url": "v0kPN3JF"}, {"slug": "f56CnBLY", "url": "qOrLab19"}, {"slug": "71tYEiMG", "url": "Rlvskq1R"}], "name": {"JChxee4A": "vnysVsST", "vgCvvY4m": "y1sXDHHy", "10ySqWU0": "U9ErOet4"}, "statCode": "IRxJYu1y", "tags": ["tVD9s5d6", "tiNruHyN", "8AwdsMxw"], "unlockedIcons": [{"slug": "wxWNdB6t", "url": "YDWckTD2"}, {"slug": "ekXjHBLF", "url": "nIIBrzLL"}, {"slug": "SKkzRple", "url": "75G94Ns3"}]}' \
    > test.out 2>&1
eval_tap $? 3 'AdminCreateNewAchievement' test.out

#- 4 ExportAchievements
./ng net.accelbyte.sdk.cli.Main achievement exportAchievements \
    --namespace "$AB_NAMESPACE" \
    --tags 'EE2eq9Dt,vSzrza8e,pBvLiKD7' \
    > test.out 2>&1
eval_tap $? 4 'ExportAchievements' test.out

#- 5 ImportAchievements
./ng net.accelbyte.sdk.cli.Main achievement importAchievements \
    --namespace "$AB_NAMESPACE" \
    --file 'tmp.dat' \
    --strategy 'BoeVhuDG' \
    > test.out 2>&1
eval_tap $? 5 'ImportAchievements' test.out

#- 6 AdminGetAchievement
./ng net.accelbyte.sdk.cli.Main achievement adminGetAchievement \
    --achievementCode 'ZHCzCj7h' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 6 'AdminGetAchievement' test.out

#- 7 AdminUpdateAchievement
./ng net.accelbyte.sdk.cli.Main achievement adminUpdateAchievement \
    --achievementCode 'agQDkLBx' \
    --namespace "$AB_NAMESPACE" \
    --body '{"customAttributes": {"DblZ3ppn": {}, "ERfKy5GQ": {}, "tnp82F5x": {}}, "defaultLanguage": "969DeC8c", "description": {"v8FW74JU": "9uDQLLJi", "MSC1K9jk": "krwgWnuA", "u8kcfPnh": "K2ZZqDWt"}, "global": false, "goalValue": 0.0993110448648582, "hidden": true, "incremental": false, "lockedIcons": [{"slug": "cP7ASYXM", "url": "rNXwWOfD"}, {"slug": "TOnEFvyJ", "url": "MgX0bARY"}, {"slug": "ChgJf1Ul", "url": "dlIKi0X2"}], "name": {"cEkJro4r": "0UHpMBIM", "QyIcwcqS": "hnSjcjrz", "Gh6zueQs": "UYE0LZm7"}, "statCode": "1MO6GcZM", "tags": ["uWGJcpLc", "bCj6mRxm", "DVuhLmo8"], "unlockedIcons": [{"slug": "WGFS8I6E", "url": "JT3zRoO1"}, {"slug": "g12vTcRc", "url": "k7RBnEAE"}, {"slug": "uusjCf9K", "url": "gSVix7Cn"}]}' \
    > test.out 2>&1
eval_tap $? 7 'AdminUpdateAchievement' test.out

#- 8 AdminDeleteAchievement
./ng net.accelbyte.sdk.cli.Main achievement adminDeleteAchievement \
    --achievementCode 'fBly5IvX' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 8 'AdminDeleteAchievement' test.out

#- 9 AdminUpdateAchievementListOrder
./ng net.accelbyte.sdk.cli.Main achievement adminUpdateAchievementListOrder \
    --achievementCode 'CKWiBAHH' \
    --namespace "$AB_NAMESPACE" \
    --body '{"targetOrder": 56}' \
    > test.out 2>&1
eval_tap $? 9 'AdminUpdateAchievementListOrder' test.out

#- 10 AdminListGlobalAchievements
./ng net.accelbyte.sdk.cli.Main achievement adminListGlobalAchievements \
    --namespace "$AB_NAMESPACE" \
    --achievementCodes 'YVFlfhAL' \
    --limit '6' \
    --offset '17' \
    --sortBy 'achievedAt:asc' \
    --status 'QA3pIRz9' \
    --tags 'oiuVoS2k,PZRAJyNc,VH8sY4GZ' \
    > test.out 2>&1
eval_tap $? 10 'AdminListGlobalAchievements' test.out

#- 11 AdminListGlobalAchievementContributors
./ng net.accelbyte.sdk.cli.Main achievement adminListGlobalAchievementContributors \
    --achievementCode 'sQCqywag' \
    --namespace "$AB_NAMESPACE" \
    --limit '18' \
    --offset '32' \
    --sortBy 'contributedValue' \
    > test.out 2>&1
eval_tap $? 11 'AdminListGlobalAchievementContributors' test.out

#- 12 ResetGlobalAchievement
./ng net.accelbyte.sdk.cli.Main achievement resetGlobalAchievement \
    --achievementCode '4XerAc5F' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 12 'ResetGlobalAchievement' test.out

#- 13 BulkCreatePSNEvent
./ng net.accelbyte.sdk.cli.Main achievement bulkCreatePSNEvent \
    --namespace "$AB_NAMESPACE" \
    --body '{"data": [{"events": [{"dateTime": "TLGQejiO", "eventData": {"eventName": "t1gML4Dk", "properties": {"3Kqf9X5i": {}, "I5dSGsSJ": {}, "cSUDVwY3": {}}}, "eventId": "t6tUZxNy", "version": "2pIVuZw6"}, {"dateTime": "sAoFPTxq", "eventData": {"eventName": "TGR0rmll", "properties": {"WZQbqoTi": {}, "hmFpsMJD": {}, "Mkgw9BYg": {}}}, "eventId": "ocsJbYqb", "version": "vERvZFKe"}, {"dateTime": "lacWvP1N", "eventData": {"eventName": "XjDbBLlJ", "properties": {"9kknepry": {}, "1TYc941U": {}, "sCnmiBO8": {}}}, "eventId": "4Yq1IjRm", "version": "r7aLJbOR"}], "thirdPartyUserId": "CMluHVmJ", "userId": "2AnZlUun"}, {"events": [{"dateTime": "ozjMgWt4", "eventData": {"eventName": "UBe7Cce9", "properties": {"AAeb8yzD": {}, "shIvbA2L": {}, "KIBaOX7o": {}}}, "eventId": "fvPtZIGT", "version": "ucB1ZFLO"}, {"dateTime": "ewOpVOO6", "eventData": {"eventName": "XJx3jyq8", "properties": {"o1baITsH": {}, "0BDwk8ka": {}, "oGeJKguJ": {}}}, "eventId": "qFUpqAhj", "version": "WQOLX3Ga"}, {"dateTime": "w9MLKRbL", "eventData": {"eventName": "yzDdqW8Z", "properties": {"NibVsqRW": {}, "QVpt4ppM": {}, "68lbpNmg": {}}}, "eventId": "i5zRH7v4", "version": "uVSYzvHz"}], "thirdPartyUserId": "Gd3oYol2", "userId": "kJ8aOK0b"}, {"events": [{"dateTime": "JCjMYp8T", "eventData": {"eventName": "VP7W3vaa", "properties": {"7KbbOnAd": {}, "aI4Md8eI": {}, "3wXxzh5G": {}}}, "eventId": "hprReMx0", "version": "cgCdfH9G"}, {"dateTime": "Alw25s7h", "eventData": {"eventName": "FAGZLV5o", "properties": {"XiZkCrn3": {}, "ff1vbpnB": {}, "uicONPgF": {}}}, "eventId": "XaHlabna", "version": "lX2o4Ppg"}, {"dateTime": "Qb7DhCqk", "eventData": {"eventName": "447ZlGw2", "properties": {"0Gtuna2T": {}, "C2YdUzSh": {}, "8SJKFbH4": {}}}, "eventId": "rUsnGoFD", "version": "NlRLWmHA"}], "thirdPartyUserId": "GGYGRbZo", "userId": "UDayvRFR"}]}' \
    > test.out 2>&1
eval_tap $? 13 'BulkCreatePSNEvent' test.out

#- 14 AdminListTags
./ng net.accelbyte.sdk.cli.Main achievement adminListTags \
    --namespace "$AB_NAMESPACE" \
    --limit '51' \
    --name 'Xg4UlZsM' \
    --offset '8' \
    --sortBy 'createdAt' \
    > test.out 2>&1
eval_tap $? 14 'AdminListTags' test.out

#- 15 AdminListUserAchievements
./ng net.accelbyte.sdk.cli.Main achievement adminListUserAchievements \
    --namespace "$AB_NAMESPACE" \
    --userId 'TiAM3A8t' \
    --limit '7' \
    --offset '32' \
    --preferUnlocked  \
    --sortBy 'achievedAt' \
    --tags 'Ve9QH6Er,9NLqJszP,xYU6tirx' \
    > test.out 2>&1
eval_tap $? 15 'AdminListUserAchievements' test.out

#- 16 AdminResetAchievement
./ng net.accelbyte.sdk.cli.Main achievement adminResetAchievement \
    --achievementCode 'vDz4RUM8' \
    --namespace "$AB_NAMESPACE" \
    --userId 'BvKd8Zxh' \
    > test.out 2>&1
eval_tap $? 16 'AdminResetAchievement' test.out

#- 17 AdminUnlockAchievement
./ng net.accelbyte.sdk.cli.Main achievement adminUnlockAchievement \
    --achievementCode 'nB4pt6T8' \
    --namespace "$AB_NAMESPACE" \
    --userId 'astGFouh' \
    > test.out 2>&1
eval_tap $? 17 'AdminUnlockAchievement' test.out

#- 18 AdminAnonymizeUserAchievement
./ng net.accelbyte.sdk.cli.Main achievement adminAnonymizeUserAchievement \
    --namespace "$AB_NAMESPACE" \
    --userId 'Ag67nEZy' \
    > test.out 2>&1
eval_tap $? 18 'AdminAnonymizeUserAchievement' test.out

#- 19 AdminListUserContributions
./ng net.accelbyte.sdk.cli.Main achievement adminListUserContributions \
    --namespace "$AB_NAMESPACE" \
    --userId 'YpI9tiIa' \
    --achievementCodes 'RaoCvE4f' \
    --limit '55' \
    --offset '68' \
    --sortBy 'contributedValue:asc' \
    --tags 'NvgpFFfO,XEaLxtdK,zwxInrbb' \
    > test.out 2>&1
eval_tap $? 19 'AdminListUserContributions' test.out

#- 20 PublicListAchievements
./ng net.accelbyte.sdk.cli.Main achievement publicListAchievements \
    --namespace "$AB_NAMESPACE" \
    --global  \
    --limit '6' \
    --offset '97' \
    --sortBy 'listOrder' \
    --tags 'N2j3c4NT,te1fH780,VgDK1X0R' \
    --language 'mUe5JZfK' \
    > test.out 2>&1
eval_tap $? 20 'PublicListAchievements' test.out

#- 21 PublicGetAchievement
./ng net.accelbyte.sdk.cli.Main achievement publicGetAchievement \
    --achievementCode '4SWQ3CZZ' \
    --namespace "$AB_NAMESPACE" \
    --language 'khUs7y5U' \
    > test.out 2>&1
eval_tap $? 21 'PublicGetAchievement' test.out

#- 22 PublicListGlobalAchievements
./ng net.accelbyte.sdk.cli.Main achievement publicListGlobalAchievements \
    --namespace "$AB_NAMESPACE" \
    --achievementCodes 'sUctNzls' \
    --limit '62' \
    --offset '84' \
    --sortBy 'achievedAt' \
    --status 'wwr5JEUT' \
    --tags 'n5Wo78it,drTgVexu,RrbC2VXN' \
    > test.out 2>&1
eval_tap $? 22 'PublicListGlobalAchievements' test.out

#- 23 ListGlobalAchievementContributors
./ng net.accelbyte.sdk.cli.Main achievement listGlobalAchievementContributors \
    --achievementCode 'CF6bNw7b' \
    --namespace "$AB_NAMESPACE" \
    --limit '81' \
    --offset '33' \
    --sortBy 'contributedValue' \
    > test.out 2>&1
eval_tap $? 23 'ListGlobalAchievementContributors' test.out

#- 24 PublicListTags
./ng net.accelbyte.sdk.cli.Main achievement publicListTags \
    --namespace "$AB_NAMESPACE" \
    --limit '77' \
    --name 'xxAZyYGZ' \
    --offset '67' \
    --sortBy 'createdAt' \
    > test.out 2>&1
eval_tap $? 24 'PublicListTags' test.out

#- 25 PublicListUserAchievements
./ng net.accelbyte.sdk.cli.Main achievement publicListUserAchievements \
    --namespace "$AB_NAMESPACE" \
    --userId '6lffFoA7' \
    --limit '84' \
    --offset '11' \
    --preferUnlocked  \
    --sortBy 'achievedAt' \
    --tags 'r7pQrEOR,9gURJzOI,6UQaAqXB' \
    > test.out 2>&1
eval_tap $? 25 'PublicListUserAchievements' test.out

#- 26 PublicUnlockAchievement
./ng net.accelbyte.sdk.cli.Main achievement publicUnlockAchievement \
    --achievementCode '0bZEEu7w' \
    --namespace "$AB_NAMESPACE" \
    --userId 'Gt8TXXyS' \
    > test.out 2>&1
eval_tap $? 26 'PublicUnlockAchievement' test.out

#- 27 ListUserContributions
./ng net.accelbyte.sdk.cli.Main achievement listUserContributions \
    --namespace "$AB_NAMESPACE" \
    --userId 'tZltzNpS' \
    --achievementCodes 'MEmMXUog' \
    --limit '21' \
    --offset '77' \
    --sortBy 'contributedValue:asc' \
    --tags 'nZCvcY5k,YmWNSlmG,TavVRgq7' \
    > test.out 2>&1
eval_tap $? 27 'ListUserContributions' test.out

#- 28 ClaimGlobalAchievementReward
./ng net.accelbyte.sdk.cli.Main achievement claimGlobalAchievementReward \
    --achievementCode 'jyzTvriQ' \
    --namespace "$AB_NAMESPACE" \
    --userId '549k9fuL' \
    > test.out 2>&1
eval_tap $? 28 'ClaimGlobalAchievementReward' test.out


rm -f "tmp.dat"

exit $EXIT_CODE