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
    --limit '83' \
    --offset '83' \
    --sortBy 'updatedAt:desc' \
    --tags 'lg5cJePC,QNrUZcC2,jyvGYe1t' \
    > test.out 2>&1
eval_tap $? 2 'AdminListAchievements' test.out

#- 3 AdminCreateNewAchievement
./ng net.accelbyte.sdk.cli.Main achievement adminCreateNewAchievement \
    --namespace "$AB_NAMESPACE" \
    --body '{"achievementCode": "WPD2RY5U", "customAttributes": {"pHDo8JIy": {}, "OQeFOJOx": {}, "aQ4S2WkJ": {}}, "defaultLanguage": "bIMrmqwp", "description": {"HFyWmkha": "lDwKBkzI", "3fLLi41J": "cqLWyrX9", "Iaet5tFB": "0MEfLax6"}, "global": true, "goalValue": 0.8913628395184982, "hidden": true, "incremental": true, "lockedIcons": [{"slug": "P07iq8Pc", "url": "zOT2tXBg"}, {"slug": "Z0ygN4IT", "url": "s0WEQUyz"}, {"slug": "i18OQYws", "url": "YjcyQ7XT"}], "name": {"LEs1XKja": "9SEc5mUr", "N8lTY5we": "GVkXyjjQ", "6FuA5HOr": "DPUN8Kk4"}, "statCode": "J4yQrKZb", "tags": ["At19SGNR", "OmMIm7QC", "4KuMNJ3g"], "unlockedIcons": [{"slug": "n5y2cBIR", "url": "AbxkglXh"}, {"slug": "1GDOYBgA", "url": "uIDdHXLG"}, {"slug": "CXfq7MPN", "url": "kBPNcxYo"}]}' \
    > test.out 2>&1
eval_tap $? 3 'AdminCreateNewAchievement' test.out

#- 4 ExportAchievements
./ng net.accelbyte.sdk.cli.Main achievement exportAchievements \
    --namespace "$AB_NAMESPACE" \
    --tags 'jPNK7hQn,94ANTFRC,5QyzvwjG' \
    > test.out 2>&1
eval_tap $? 4 'ExportAchievements' test.out

#- 5 ImportAchievements
./ng net.accelbyte.sdk.cli.Main achievement importAchievements \
    --namespace "$AB_NAMESPACE" \
    --file 'tmp.dat' \
    --strategy 'cmNFVfbX' \
    > test.out 2>&1
eval_tap $? 5 'ImportAchievements' test.out

#- 6 AdminGetAchievement
./ng net.accelbyte.sdk.cli.Main achievement adminGetAchievement \
    --achievementCode 'xuy1hQ0h' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 6 'AdminGetAchievement' test.out

#- 7 AdminUpdateAchievement
./ng net.accelbyte.sdk.cli.Main achievement adminUpdateAchievement \
    --achievementCode 'lyVHb12I' \
    --namespace "$AB_NAMESPACE" \
    --body '{"customAttributes": {"QYQWcrXa": {}, "F21BkbtV": {}, "9UBRMifV": {}}, "defaultLanguage": "ox1UIMwd", "description": {"AfLN4TQo": "gfB0UniG", "FWJ57YgA": "pmFE2Izp", "VZBo5IAR": "3JJiBM1z"}, "global": true, "goalValue": 0.7863931221930414, "hidden": true, "incremental": true, "lockedIcons": [{"slug": "hU2h5xrN", "url": "IDtuUsUY"}, {"slug": "iTcjugVp", "url": "70K9IeIu"}, {"slug": "1or7vthF", "url": "udadtOwY"}], "name": {"lc4OMLEd": "dbg1Sc5r", "fSVvDXlI": "NOhgjFoe", "i8aN5fxs": "QdQ4UxBX"}, "statCode": "pMUUVFYI", "tags": ["78FBPzWo", "VoMqmeOo", "aLLDT0dx"], "unlockedIcons": [{"slug": "am00qYUn", "url": "mtQpb5ci"}, {"slug": "qoA96tew", "url": "Timnk7kc"}, {"slug": "Yu0gIfDT", "url": "bogqxFyf"}]}' \
    > test.out 2>&1
eval_tap $? 7 'AdminUpdateAchievement' test.out

#- 8 AdminDeleteAchievement
./ng net.accelbyte.sdk.cli.Main achievement adminDeleteAchievement \
    --achievementCode 'uvZpTlRB' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 8 'AdminDeleteAchievement' test.out

#- 9 AdminUpdateAchievementListOrder
./ng net.accelbyte.sdk.cli.Main achievement adminUpdateAchievementListOrder \
    --achievementCode '0mCjDA6B' \
    --namespace "$AB_NAMESPACE" \
    --body '{"targetOrder": 65}' \
    > test.out 2>&1
eval_tap $? 9 'AdminUpdateAchievementListOrder' test.out

#- 10 AdminListGlobalAchievements
./ng net.accelbyte.sdk.cli.Main achievement adminListGlobalAchievements \
    --namespace "$AB_NAMESPACE" \
    --achievementCodes 'MVURWBzj' \
    --limit '46' \
    --offset '31' \
    --sortBy 'oh2qxddG' \
    --status '5bgZ1bRV' \
    --tags 'UPFq76Kx,b6osEZI4,zBpvRej0' \
    > test.out 2>&1
eval_tap $? 10 'AdminListGlobalAchievements' test.out

#- 11 AdminListGlobalAchievementContributors
./ng net.accelbyte.sdk.cli.Main achievement adminListGlobalAchievementContributors \
    --achievementCode '2gXwhryO' \
    --namespace "$AB_NAMESPACE" \
    --limit '50' \
    --offset '30' \
    --sortBy 'DU5VhjGO' \
    > test.out 2>&1
eval_tap $? 11 'AdminListGlobalAchievementContributors' test.out

#- 12 ResetGlobalAchievement
./ng net.accelbyte.sdk.cli.Main achievement resetGlobalAchievement \
    --achievementCode 'UUuNzD27' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 12 'ResetGlobalAchievement' test.out

#- 13 BulkCreatePSNEvent
./ng net.accelbyte.sdk.cli.Main achievement bulkCreatePSNEvent \
    --namespace "$AB_NAMESPACE" \
    --body '{"data": [{"events": [{"dateTime": "zkaGmt0Y", "eventData": {"eventName": "HmfzjbMq", "properties": {"TeEWpRrE": {}, "aPFhVeaE": {}, "zQ7X6ULl": {}}}, "eventId": "WDy4Uzf9", "version": "8zWEcZzh"}, {"dateTime": "EKYlhgSR", "eventData": {"eventName": "hciY7GQ7", "properties": {"tJkxtItq": {}, "gzncMd9m": {}, "6ozUxlvw": {}}}, "eventId": "HvTUopA0", "version": "dSYUb3K3"}, {"dateTime": "IcE0M3iU", "eventData": {"eventName": "r0aMg1fo", "properties": {"NPNDssMI": {}, "aeXzXxv3": {}, "YWxyFdZd": {}}}, "eventId": "yM7TvtKk", "version": "u0XLxKZj"}], "thirdPartyUserId": "EPiYpFp6", "userId": "j5WNcYiM"}, {"events": [{"dateTime": "XBX5jhZv", "eventData": {"eventName": "VhW9vWLR", "properties": {"k2veseTI": {}, "aG4RW9wz": {}, "gGwMIOdc": {}}}, "eventId": "irQxQ5q5", "version": "lwmWe9AV"}, {"dateTime": "EWfFfOHe", "eventData": {"eventName": "UkBgKsLu", "properties": {"VxNHm6WM": {}, "NccZyUD8": {}, "hCYxrpSA": {}}}, "eventId": "z75P2p9u", "version": "iEZOFVxc"}, {"dateTime": "H2rKxQ7S", "eventData": {"eventName": "L2Mfww4O", "properties": {"dLrliD3W": {}, "gxUjDona": {}, "ublHXT2d": {}}}, "eventId": "ejIUk26q", "version": "d2grsCt5"}], "thirdPartyUserId": "YxkXKWYs", "userId": "GQ0biZIy"}, {"events": [{"dateTime": "TI0Twfbs", "eventData": {"eventName": "2k8FIAm6", "properties": {"x8kkyQ0k": {}, "7vqzh6tS": {}, "KRPeW0i8": {}}}, "eventId": "78jhC9RQ", "version": "cG0ssHQs"}, {"dateTime": "t3y3UD32", "eventData": {"eventName": "AiCVHwqW", "properties": {"Do5NnbeJ": {}, "D3fokZrs": {}, "5XJcjlK8": {}}}, "eventId": "QOcsxjUG", "version": "QoyZG7v7"}, {"dateTime": "W0XWuoO1", "eventData": {"eventName": "SXCHmS0t", "properties": {"vVdREzWu": {}, "dowO5bns": {}, "SOn3q1pB": {}}}, "eventId": "w0fZjkxF", "version": "z6LdwRmL"}], "thirdPartyUserId": "yVPWRhUb", "userId": "y3EQeeDv"}]}' \
    > test.out 2>&1
eval_tap $? 13 'BulkCreatePSNEvent' test.out

#- 14 AdminListTags
./ng net.accelbyte.sdk.cli.Main achievement adminListTags \
    --namespace "$AB_NAMESPACE" \
    --limit '62' \
    --name '67o7j98H' \
    --offset '42' \
    --sortBy 'IXpsd3lz' \
    > test.out 2>&1
eval_tap $? 14 'AdminListTags' test.out

#- 15 AdminListUserAchievements
./ng net.accelbyte.sdk.cli.Main achievement adminListUserAchievements \
    --namespace "$AB_NAMESPACE" \
    --userId 'LhJbDlEg' \
    --limit '95' \
    --offset '49' \
    --preferUnlocked  \
    --sortBy 'ALQYzkn0' \
    --tags 'lzk4qW2j,onqivRti,cY7duD60' \
    > test.out 2>&1
eval_tap $? 15 'AdminListUserAchievements' test.out

#- 16 AdminResetAchievement
./ng net.accelbyte.sdk.cli.Main achievement adminResetAchievement \
    --achievementCode '5i0bdNVh' \
    --namespace "$AB_NAMESPACE" \
    --userId 'bmHiRoD2' \
    > test.out 2>&1
eval_tap $? 16 'AdminResetAchievement' test.out

#- 17 AdminUnlockAchievement
./ng net.accelbyte.sdk.cli.Main achievement adminUnlockAchievement \
    --achievementCode 'JPPZNjpq' \
    --namespace "$AB_NAMESPACE" \
    --userId 'beYiWYmQ' \
    > test.out 2>&1
eval_tap $? 17 'AdminUnlockAchievement' test.out

#- 18 AdminAnonymizeUserAchievement
./ng net.accelbyte.sdk.cli.Main achievement adminAnonymizeUserAchievement \
    --namespace "$AB_NAMESPACE" \
    --userId 'wvhqsPgZ' \
    > test.out 2>&1
eval_tap $? 18 'AdminAnonymizeUserAchievement' test.out

#- 19 AdminListUserContributions
./ng net.accelbyte.sdk.cli.Main achievement adminListUserContributions \
    --namespace "$AB_NAMESPACE" \
    --userId '0feta0cn' \
    --achievementCodes 'DYzeecGW' \
    --limit '2' \
    --offset '61' \
    --sortBy 'wJkZZ8mD' \
    --tags 'r7l4Vbzt,idwodIgj,utEGzRZY' \
    > test.out 2>&1
eval_tap $? 19 'AdminListUserContributions' test.out

#- 20 PublicListAchievements
./ng net.accelbyte.sdk.cli.Main achievement publicListAchievements \
    --namespace "$AB_NAMESPACE" \
    --global  \
    --limit '51' \
    --offset '37' \
    --sortBy 'listOrder:desc' \
    --tags 'OSp67qNw,yX03S8Dk,YTR6v6rT' \
    --language 'DKVX5D5x' \
    > test.out 2>&1
eval_tap $? 20 'PublicListAchievements' test.out

#- 21 PublicGetAchievement
./ng net.accelbyte.sdk.cli.Main achievement publicGetAchievement \
    --achievementCode 'tbzlQ4jS' \
    --namespace "$AB_NAMESPACE" \
    --language 'dSJkt5ex' \
    > test.out 2>&1
eval_tap $? 21 'PublicGetAchievement' test.out

#- 22 PublicListGlobalAchievements
./ng net.accelbyte.sdk.cli.Main achievement publicListGlobalAchievements \
    --namespace "$AB_NAMESPACE" \
    --achievementCodes 'oU9pzcvN' \
    --limit '12' \
    --offset '24' \
    --sortBy 'huCUZijx' \
    --status 'HGlLEQG0' \
    --tags 'v0xFWrkp,V4kSYS9o,IZwPEaiY' \
    > test.out 2>&1
eval_tap $? 22 'PublicListGlobalAchievements' test.out

#- 23 ListGlobalAchievementContributors
./ng net.accelbyte.sdk.cli.Main achievement listGlobalAchievementContributors \
    --achievementCode 'WSIEthLW' \
    --namespace "$AB_NAMESPACE" \
    --limit '78' \
    --offset '80' \
    --sortBy 'hRfJL8Jp' \
    > test.out 2>&1
eval_tap $? 23 'ListGlobalAchievementContributors' test.out

#- 24 PublicListTags
./ng net.accelbyte.sdk.cli.Main achievement publicListTags \
    --namespace "$AB_NAMESPACE" \
    --limit '2' \
    --name 'FIlQ0jy3' \
    --offset '97' \
    --sortBy 'dpADrXlO' \
    > test.out 2>&1
eval_tap $? 24 'PublicListTags' test.out

#- 25 PublicListUserAchievements
./ng net.accelbyte.sdk.cli.Main achievement publicListUserAchievements \
    --namespace "$AB_NAMESPACE" \
    --userId 'QrHCngYF' \
    --limit '65' \
    --offset '80' \
    --preferUnlocked  \
    --sortBy 'Fvyat3FZ' \
    --tags '6ef5q8dw,HilDG5q7,GAc2b8ug' \
    > test.out 2>&1
eval_tap $? 25 'PublicListUserAchievements' test.out

#- 26 PublicUnlockAchievement
./ng net.accelbyte.sdk.cli.Main achievement publicUnlockAchievement \
    --achievementCode '04RGCt4i' \
    --namespace "$AB_NAMESPACE" \
    --userId 'Ycjk3ax4' \
    > test.out 2>&1
eval_tap $? 26 'PublicUnlockAchievement' test.out

#- 27 ListUserContributions
./ng net.accelbyte.sdk.cli.Main achievement listUserContributions \
    --namespace "$AB_NAMESPACE" \
    --userId 'WYzR2ruM' \
    --achievementCodes 'obg4fgOl' \
    --limit '19' \
    --offset '74' \
    --sortBy 'leP45yG5' \
    --tags 'ewb8kAnI,TBLAZ2kX,J4WSPTVQ' \
    > test.out 2>&1
eval_tap $? 27 'ListUserContributions' test.out

#- 28 ClaimGlobalAchievementReward
./ng net.accelbyte.sdk.cli.Main achievement claimGlobalAchievementReward \
    --achievementCode '2BexDTUo' \
    --namespace "$AB_NAMESPACE" \
    --userId 'qzhg4B0g' \
    > test.out 2>&1
eval_tap $? 28 'ClaimGlobalAchievementReward' test.out


rm -f "tmp.dat"

exit $EXIT_CODE