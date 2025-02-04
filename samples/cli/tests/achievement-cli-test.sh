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
    --limit '36' \
    --offset '70' \
    --sortBy 'listOrder:asc' \
    --tags 'Fd5USggn,aEolxkyw,XOvH9Bx9' \
    > test.out 2>&1
eval_tap $? 2 'AdminListAchievements' test.out

#- 3 AdminCreateNewAchievement
./ng net.accelbyte.sdk.cli.Main achievement adminCreateNewAchievement \
    --namespace "$AB_NAMESPACE" \
    --body '{"achievementCode": "9fJBisiQ", "customAttributes": {"Dn78xj58": {}, "I1mSAD4z": {}, "TC1PYKzr": {}}, "defaultLanguage": "xZDnKN83", "description": {"0JoxVFTX": "7GQWFDLw", "h8OFpaks": "HvhwsQKL", "lyKkfBnU": "VWAw4Z6q"}, "global": true, "goalValue": 0.8884005287563791, "hidden": false, "incremental": false, "lockedIcons": [{"slug": "DRaFHwIO", "url": "Zmr24j2O"}, {"slug": "LOwssLhO", "url": "1i1DEHrH"}, {"slug": "48qyG1Tg", "url": "78x3QHsd"}], "name": {"7SHhAxy2": "IDnuIUIf", "4fGwvEbt": "eZmwXpaP", "freD2GxJ": "a02tRdtL"}, "statCode": "P57Fxn5B", "tags": ["gLBsZZDi", "rikoxgpN", "zbIpprL7"], "unlockedIcons": [{"slug": "VVcARtWB", "url": "BBgjTnXM"}, {"slug": "OWHrGYjA", "url": "8pu7PvbC"}, {"slug": "Y1ejzgqo", "url": "lauS6xdO"}]}' \
    > test.out 2>&1
eval_tap $? 3 'AdminCreateNewAchievement' test.out

#- 4 ExportAchievements
./ng net.accelbyte.sdk.cli.Main achievement exportAchievements \
    --namespace "$AB_NAMESPACE" \
    --tags 'RmvT9Xy1,1HYh2FEL,mq5th2wO' \
    > test.out 2>&1
eval_tap $? 4 'ExportAchievements' test.out

#- 5 ImportAchievements
./ng net.accelbyte.sdk.cli.Main achievement importAchievements \
    --namespace "$AB_NAMESPACE" \
    --file 'tmp.dat' \
    --strategy 'fUBlYZt5' \
    > test.out 2>&1
eval_tap $? 5 'ImportAchievements' test.out

#- 6 AdminGetAchievement
./ng net.accelbyte.sdk.cli.Main achievement adminGetAchievement \
    --achievementCode 'ukvZF1Iy' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 6 'AdminGetAchievement' test.out

#- 7 AdminUpdateAchievement
./ng net.accelbyte.sdk.cli.Main achievement adminUpdateAchievement \
    --achievementCode 'P1aVxzBF' \
    --namespace "$AB_NAMESPACE" \
    --body '{"customAttributes": {"8CRz8TUT": {}, "TcqbHBqC": {}, "mRPPSa0C": {}}, "defaultLanguage": "2IhQDVtQ", "description": {"sGh5sYco": "4nbxZXh7", "CV5uOJ9b": "4gcRQOl9", "N6jYX6Bz": "W9XmxQtn"}, "global": true, "goalValue": 0.4818629213553346, "hidden": false, "incremental": true, "lockedIcons": [{"slug": "34K6yf1v", "url": "shUFC86W"}, {"slug": "UM2D3kHv", "url": "QLlY5Vfd"}, {"slug": "nc0lt9B1", "url": "PJD3e5Z7"}], "name": {"kxiOoRzY": "PRkmIlVf", "J4zeQTsE": "XoCqFLpR", "mfGmm5mg": "Ca3um0Wu"}, "statCode": "x30R5omE", "tags": ["iMyZVMRg", "xZ68uPSV", "eGZugEaQ"], "unlockedIcons": [{"slug": "PmVYENDU", "url": "7rE1qOtb"}, {"slug": "zsmrPSSW", "url": "tAHKC7yz"}, {"slug": "RYpmTAZ4", "url": "wezJaHsQ"}]}' \
    > test.out 2>&1
eval_tap $? 7 'AdminUpdateAchievement' test.out

#- 8 AdminDeleteAchievement
./ng net.accelbyte.sdk.cli.Main achievement adminDeleteAchievement \
    --achievementCode 'efbZ3qrg' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 8 'AdminDeleteAchievement' test.out

#- 9 AdminUpdateAchievementListOrder
./ng net.accelbyte.sdk.cli.Main achievement adminUpdateAchievementListOrder \
    --achievementCode 'GBNuRalS' \
    --namespace "$AB_NAMESPACE" \
    --body '{"targetOrder": 99}' \
    > test.out 2>&1
eval_tap $? 9 'AdminUpdateAchievementListOrder' test.out

#- 10 AdminListGlobalAchievements
./ng net.accelbyte.sdk.cli.Main achievement adminListGlobalAchievements \
    --namespace "$AB_NAMESPACE" \
    --achievementCodes 'kgCjfktG' \
    --limit '94' \
    --offset '49' \
    --sortBy 'achievedAt' \
    --status 'l9AViV93' \
    --tags 'lqFM84SU,sZF7PHk8,1i3PlMIs' \
    > test.out 2>&1
eval_tap $? 10 'AdminListGlobalAchievements' test.out

#- 11 AdminListGlobalAchievementContributors
./ng net.accelbyte.sdk.cli.Main achievement adminListGlobalAchievementContributors \
    --achievementCode 'dFd0AZ4b' \
    --namespace "$AB_NAMESPACE" \
    --limit '20' \
    --offset '76' \
    --sortBy 'contributedValue' \
    > test.out 2>&1
eval_tap $? 11 'AdminListGlobalAchievementContributors' test.out

#- 12 ResetGlobalAchievement
./ng net.accelbyte.sdk.cli.Main achievement resetGlobalAchievement \
    --achievementCode 'HGG4uRN4' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 12 'ResetGlobalAchievement' test.out

#- 13 BulkCreatePSNEvent
./ng net.accelbyte.sdk.cli.Main achievement bulkCreatePSNEvent \
    --namespace "$AB_NAMESPACE" \
    --body '{"data": [{"events": [{"dateTime": "BJ45bdci", "eventData": {"eventName": "rDExDqQu", "properties": {"eYXXQdrx": {}, "X6phruVa": {}, "cPiwUZRY": {}}}, "eventId": "btPW898V", "version": "FLdUrQAw"}, {"dateTime": "96t9qFZI", "eventData": {"eventName": "osutsR3x", "properties": {"ZlzIqei8": {}, "VcX2wKEe": {}, "ASGIRwym": {}}}, "eventId": "Qv3A5eAT", "version": "zv5cCjRm"}, {"dateTime": "MxRtNQWv", "eventData": {"eventName": "N4HjODHp", "properties": {"3L2F7u0v": {}, "B9U3JOiZ": {}, "EpeHZMAa": {}}}, "eventId": "AC4olThe", "version": "yThSKwiW"}], "thirdPartyUserId": "gUxR1J0c", "userId": "WgSPOAPl"}, {"events": [{"dateTime": "l2gqkbCd", "eventData": {"eventName": "VLT8L4Nh", "properties": {"xGq9iS64": {}, "5bkXnrqh": {}, "g1ClHGBM": {}}}, "eventId": "oX1IYPCb", "version": "dukzp79u"}, {"dateTime": "etnNgfxY", "eventData": {"eventName": "mJYVgUHN", "properties": {"IjnVbfuA": {}, "79XZxSxI": {}, "5CO7pavj": {}}}, "eventId": "fEWZRxAC", "version": "cfYHhAoS"}, {"dateTime": "cbZpztTb", "eventData": {"eventName": "18WRxE9q", "properties": {"BPpfSF4L": {}, "LihoJc79": {}, "ejkrUUCk": {}}}, "eventId": "XcBnCMGz", "version": "kMz3kZRa"}], "thirdPartyUserId": "3KvK4Zuo", "userId": "RPv6FHzh"}, {"events": [{"dateTime": "PPBOPlNO", "eventData": {"eventName": "iPSEXmzC", "properties": {"VS7yAtWv": {}, "SWpzQ1aA": {}, "pNnppmGz": {}}}, "eventId": "rlVDO946", "version": "I5Iq6n2f"}, {"dateTime": "oDudqVzH", "eventData": {"eventName": "cp0NQjMe", "properties": {"d5yrbxsf": {}, "6c83mJ0K": {}, "RMKhHiAR": {}}}, "eventId": "IPPFNV5n", "version": "MNTAQ6eF"}, {"dateTime": "03iwzIie", "eventData": {"eventName": "UoApO2e5", "properties": {"UEZOW5EZ": {}, "6viQ78pR": {}, "6mDkYOrl": {}}}, "eventId": "2592X900", "version": "QsFLqbm4"}], "thirdPartyUserId": "ra7B6wR3", "userId": "2swjK0Ow"}]}' \
    > test.out 2>&1
eval_tap $? 13 'BulkCreatePSNEvent' test.out

#- 14 AdminListTags
./ng net.accelbyte.sdk.cli.Main achievement adminListTags \
    --namespace "$AB_NAMESPACE" \
    --limit '85' \
    --name 'OfRl8lDx' \
    --offset '29' \
    --sortBy 'createdAt:desc' \
    > test.out 2>&1
eval_tap $? 14 'AdminListTags' test.out

#- 15 AdminListUserAchievements
./ng net.accelbyte.sdk.cli.Main achievement adminListUserAchievements \
    --namespace "$AB_NAMESPACE" \
    --userId 'C6BiRWO6' \
    --limit '9' \
    --offset '25' \
    --preferUnlocked  \
    --sortBy 'createdAt' \
    --tags 'bIW6OSoK,3Xni5MuC,rcBZD0ef' \
    > test.out 2>&1
eval_tap $? 15 'AdminListUserAchievements' test.out

#- 16 AdminResetAchievement
./ng net.accelbyte.sdk.cli.Main achievement adminResetAchievement \
    --achievementCode 'kO25Prz2' \
    --namespace "$AB_NAMESPACE" \
    --userId 'M3cQ2Pg7' \
    > test.out 2>&1
eval_tap $? 16 'AdminResetAchievement' test.out

#- 17 AdminUnlockAchievement
./ng net.accelbyte.sdk.cli.Main achievement adminUnlockAchievement \
    --achievementCode 'QnN22Swv' \
    --namespace "$AB_NAMESPACE" \
    --userId 'OTwBc4BI' \
    > test.out 2>&1
eval_tap $? 17 'AdminUnlockAchievement' test.out

#- 18 AdminAnonymizeUserAchievement
./ng net.accelbyte.sdk.cli.Main achievement adminAnonymizeUserAchievement \
    --namespace "$AB_NAMESPACE" \
    --userId 'sNZ5SmwI' \
    > test.out 2>&1
eval_tap $? 18 'AdminAnonymizeUserAchievement' test.out

#- 19 AdminListUserContributions
./ng net.accelbyte.sdk.cli.Main achievement adminListUserContributions \
    --namespace "$AB_NAMESPACE" \
    --userId 'VGWOYj81' \
    --achievementCodes 'iMxoSMqX' \
    --limit '84' \
    --offset '55' \
    --sortBy 'contributedValue' \
    --tags 'rFLc7arM,HEEkwIFD,7qkgMlch' \
    > test.out 2>&1
eval_tap $? 19 'AdminListUserContributions' test.out

#- 20 PublicListAchievements
./ng net.accelbyte.sdk.cli.Main achievement publicListAchievements \
    --namespace "$AB_NAMESPACE" \
    --global  \
    --limit '16' \
    --offset '45' \
    --sortBy 'createdAt:asc' \
    --tags 'JTmliwbH,0wf6PJ28,R2xSbTcW' \
    --language 'mlKLv10S' \
    > test.out 2>&1
eval_tap $? 20 'PublicListAchievements' test.out

#- 21 PublicGetAchievement
./ng net.accelbyte.sdk.cli.Main achievement publicGetAchievement \
    --achievementCode 'GuvT4KP2' \
    --namespace "$AB_NAMESPACE" \
    --language '1XRgsk4y' \
    > test.out 2>&1
eval_tap $? 21 'PublicGetAchievement' test.out

#- 22 PublicListGlobalAchievements
./ng net.accelbyte.sdk.cli.Main achievement publicListGlobalAchievements \
    --namespace "$AB_NAMESPACE" \
    --achievementCodes '3IDKDjvg' \
    --limit '96' \
    --offset '35' \
    --sortBy 'createdAt' \
    --status 'hi7yX8VK' \
    --tags '6aXnUh1D,guruEOxW,B9HF27Rf' \
    > test.out 2>&1
eval_tap $? 22 'PublicListGlobalAchievements' test.out

#- 23 ListGlobalAchievementContributors
./ng net.accelbyte.sdk.cli.Main achievement listGlobalAchievementContributors \
    --achievementCode '4G4tMpQM' \
    --namespace "$AB_NAMESPACE" \
    --limit '42' \
    --offset '48' \
    --sortBy 'contributedValue:desc' \
    > test.out 2>&1
eval_tap $? 23 'ListGlobalAchievementContributors' test.out

#- 24 PublicListTags
./ng net.accelbyte.sdk.cli.Main achievement publicListTags \
    --namespace "$AB_NAMESPACE" \
    --limit '33' \
    --name 'KWifDejL' \
    --offset '48' \
    --sortBy 'name' \
    > test.out 2>&1
eval_tap $? 24 'PublicListTags' test.out

#- 25 PublicListUserAchievements
./ng net.accelbyte.sdk.cli.Main achievement publicListUserAchievements \
    --namespace "$AB_NAMESPACE" \
    --userId 'efJvD6A7' \
    --limit '67' \
    --offset '18' \
    --preferUnlocked  \
    --sortBy 'achievedAt:desc' \
    --tags 'HsokKBtt,LP59vJw3,k1FQwOSc' \
    > test.out 2>&1
eval_tap $? 25 'PublicListUserAchievements' test.out

#- 26 PublicUnlockAchievement
./ng net.accelbyte.sdk.cli.Main achievement publicUnlockAchievement \
    --achievementCode 'YfW1CxVu' \
    --namespace "$AB_NAMESPACE" \
    --userId 'V5ZSMzZX' \
    > test.out 2>&1
eval_tap $? 26 'PublicUnlockAchievement' test.out

#- 27 ListUserContributions
./ng net.accelbyte.sdk.cli.Main achievement listUserContributions \
    --namespace "$AB_NAMESPACE" \
    --userId 'g623qwMM' \
    --achievementCodes '5o7prL0I' \
    --limit '4' \
    --offset '94' \
    --sortBy 'contributedValue' \
    --tags 'zpuC3BuK,QcGloZ2Y,Ln9EdI35' \
    > test.out 2>&1
eval_tap $? 27 'ListUserContributions' test.out

#- 28 ClaimGlobalAchievementReward
./ng net.accelbyte.sdk.cli.Main achievement claimGlobalAchievementReward \
    --achievementCode 'zx2aDqk5' \
    --namespace "$AB_NAMESPACE" \
    --userId 'kUrE3aW0' \
    > test.out 2>&1
eval_tap $? 28 'ClaimGlobalAchievementReward' test.out


rm -f "tmp.dat"

exit $EXIT_CODE