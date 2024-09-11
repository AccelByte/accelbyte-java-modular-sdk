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
    --limit '78' \
    --offset '45' \
    --sortBy 'listOrder:asc' \
    --tags 'p8uCg031,EQkJvCBq,xcNT2PcO' \
    > test.out 2>&1
eval_tap $? 2 'AdminListAchievements' test.out

#- 3 AdminCreateNewAchievement
./ng net.accelbyte.sdk.cli.Main achievement adminCreateNewAchievement \
    --namespace "$AB_NAMESPACE" \
    --body '{"achievementCode": "ARVuImnu", "customAttributes": {"46vU7qUY": {}, "YZnyVaE3": {}, "WV3XWkMc": {}}, "defaultLanguage": "yE6uoc92", "description": {"s0RWxDHM": "YjpjsXKz", "l1vc2GHA": "n5u8ZrKb", "6D4fCogf": "FYqvlnMX"}, "global": false, "goalValue": 0.07263960052463136, "hidden": true, "incremental": true, "lockedIcons": [{"slug": "tJIGNNT1", "url": "UjrZWPSf"}, {"slug": "KO5fF3sX", "url": "N2roINSo"}, {"slug": "o9uQjueq", "url": "IpY04MaU"}], "name": {"dbUsxSV1": "qRn8cmBO", "O5Ty3lWH": "PXJbhdJ5", "FNpc2sgz": "dBv6ppCP"}, "statCode": "SZupsEWm", "tags": ["msKkom3A", "jdoctdnF", "PSgIB9dr"], "unlockedIcons": [{"slug": "xrkrsSO7", "url": "VogiiUHF"}, {"slug": "JDQ3ae8c", "url": "1bmOpVYo"}, {"slug": "n36xUGeJ", "url": "dP91Pes2"}]}' \
    > test.out 2>&1
eval_tap $? 3 'AdminCreateNewAchievement' test.out

#- 4 ExportAchievements
./ng net.accelbyte.sdk.cli.Main achievement exportAchievements \
    --namespace "$AB_NAMESPACE" \
    --tags 'fwqE0Bnb,97y65715,LWwHq8Ju' \
    > test.out 2>&1
eval_tap $? 4 'ExportAchievements' test.out

#- 5 ImportAchievements
./ng net.accelbyte.sdk.cli.Main achievement importAchievements \
    --namespace "$AB_NAMESPACE" \
    --file 'tmp.dat' \
    --strategy 'eO8CnWmF' \
    > test.out 2>&1
eval_tap $? 5 'ImportAchievements' test.out

#- 6 AdminGetAchievement
./ng net.accelbyte.sdk.cli.Main achievement adminGetAchievement \
    --achievementCode 'stgHVAgB' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 6 'AdminGetAchievement' test.out

#- 7 AdminUpdateAchievement
./ng net.accelbyte.sdk.cli.Main achievement adminUpdateAchievement \
    --achievementCode 'J29LFVMd' \
    --namespace "$AB_NAMESPACE" \
    --body '{"customAttributes": {"AxxUNyRh": {}, "YuQwwDgD": {}, "w6OPIjUt": {}}, "defaultLanguage": "xPTtJoB1", "description": {"oDn6gMyc": "b9dA3Xde", "qJLyOnm3": "funo04JY", "cQs2RzGo": "sE01VcYf"}, "global": true, "goalValue": 0.36702368424652754, "hidden": true, "incremental": false, "lockedIcons": [{"slug": "viOXQe4t", "url": "xPYzbQb9"}, {"slug": "3P4Ux2rw", "url": "bG9YN0sF"}, {"slug": "tLNSTby6", "url": "k2oSEMH1"}], "name": {"BmNQRlYZ": "vn96Gk2K", "cqFTEZiV": "Qd0RPhDw", "2c9jLs4m": "vrrnoTz1"}, "statCode": "4JmcTUMF", "tags": ["x2aAcPY2", "b8WHNFuM", "h26zIYti"], "unlockedIcons": [{"slug": "xVZKriV4", "url": "50UAvrfU"}, {"slug": "cGDfw7ne", "url": "S6Cet0xP"}, {"slug": "9sRN2ggG", "url": "xuLPUAf5"}]}' \
    > test.out 2>&1
eval_tap $? 7 'AdminUpdateAchievement' test.out

#- 8 AdminDeleteAchievement
./ng net.accelbyte.sdk.cli.Main achievement adminDeleteAchievement \
    --achievementCode 'qRGjVH5c' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 8 'AdminDeleteAchievement' test.out

#- 9 AdminUpdateAchievementListOrder
./ng net.accelbyte.sdk.cli.Main achievement adminUpdateAchievementListOrder \
    --achievementCode 'cMTiDgJk' \
    --namespace "$AB_NAMESPACE" \
    --body '{"targetOrder": 83}' \
    > test.out 2>&1
eval_tap $? 9 'AdminUpdateAchievementListOrder' test.out

#- 10 AdminListGlobalAchievements
./ng net.accelbyte.sdk.cli.Main achievement adminListGlobalAchievements \
    --namespace "$AB_NAMESPACE" \
    --achievementCodes '8uZIB87v' \
    --limit '22' \
    --offset '31' \
    --sortBy 'wWtUt4kA' \
    --status 'UhkeRXem' \
    --tags 'LcDUYt7W,WgsAdtp8,tkR9otu8' \
    > test.out 2>&1
eval_tap $? 10 'AdminListGlobalAchievements' test.out

#- 11 AdminListGlobalAchievementContributors
./ng net.accelbyte.sdk.cli.Main achievement adminListGlobalAchievementContributors \
    --achievementCode 'yJjj8mMx' \
    --namespace "$AB_NAMESPACE" \
    --limit '33' \
    --offset '1' \
    --sortBy 'E6vjX1zr' \
    > test.out 2>&1
eval_tap $? 11 'AdminListGlobalAchievementContributors' test.out

#- 12 ResetGlobalAchievement
./ng net.accelbyte.sdk.cli.Main achievement resetGlobalAchievement \
    --achievementCode 'NjBazZCI' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 12 'ResetGlobalAchievement' test.out

#- 13 BulkCreatePSNEvent
./ng net.accelbyte.sdk.cli.Main achievement bulkCreatePSNEvent \
    --namespace "$AB_NAMESPACE" \
    --body '{"data": [{"events": [{"dateTime": "jF6Hi879", "eventData": {"eventName": "7qBdgiSI", "properties": {"P2VO0kSP": {}, "vO9kA2Np": {}, "Qe7qeiBn": {}}}, "eventId": "JCyJyCb7", "version": "RgmPr3zB"}, {"dateTime": "6sfmLaII", "eventData": {"eventName": "BVavqEYH", "properties": {"NNaAkfpw": {}, "aLUQozXM": {}, "jrsTELWq": {}}}, "eventId": "nsJsrw8E", "version": "UjvSzMFI"}, {"dateTime": "ote6uRI1", "eventData": {"eventName": "yfXiv2gX", "properties": {"gETEpuyD": {}, "QaRHVmWC": {}, "xD4i6JuN": {}}}, "eventId": "K0uvJFQf", "version": "YTBEkTqe"}], "thirdPartyUserId": "HBnWaEdh", "userId": "ltwD7aSH"}, {"events": [{"dateTime": "PagAcmZR", "eventData": {"eventName": "nMbT7I8d", "properties": {"TQzlvIZu": {}, "8euvEY6k": {}, "5uFssw4j": {}}}, "eventId": "KhL8ZOsV", "version": "I2mOFpGH"}, {"dateTime": "8iT2vKci", "eventData": {"eventName": "QMXiZ9su", "properties": {"oF7epHJG": {}, "oLvzww3z": {}, "6OFcySlr": {}}}, "eventId": "5H7UxaGx", "version": "lM0k40FT"}, {"dateTime": "o8DcehWg", "eventData": {"eventName": "pT0pbdIz", "properties": {"eye3Y02l": {}, "PGzWEuKp": {}, "ZZapddfR": {}}}, "eventId": "Ctz0h6Jg", "version": "EP0oQqv1"}], "thirdPartyUserId": "Y0oLxNzR", "userId": "VCB7X78O"}, {"events": [{"dateTime": "MrbtxvdZ", "eventData": {"eventName": "XK7tKjrS", "properties": {"pDpvKPCL": {}, "dhIS0vHC": {}, "9v1WWk20": {}}}, "eventId": "cCBYQFkH", "version": "BfuAZYWJ"}, {"dateTime": "I3ORNTV0", "eventData": {"eventName": "MzZOpfnk", "properties": {"VtKxv6J6": {}, "WcO9DqB3": {}, "DrZBPqjQ": {}}}, "eventId": "47BTw1hL", "version": "mO35nWtc"}, {"dateTime": "zMj8ojiP", "eventData": {"eventName": "wBfJCAEa", "properties": {"HgBHopb8": {}, "uvip2rPO": {}, "PuP4LfY8": {}}}, "eventId": "2jc7q8Wz", "version": "KNRv6geN"}], "thirdPartyUserId": "5Kd2Zc0O", "userId": "lAqkvMhq"}]}' \
    > test.out 2>&1
eval_tap $? 13 'BulkCreatePSNEvent' test.out

#- 14 AdminListTags
./ng net.accelbyte.sdk.cli.Main achievement adminListTags \
    --namespace "$AB_NAMESPACE" \
    --limit '97' \
    --name '38QqAFnS' \
    --offset '14' \
    --sortBy 'O19nyZwC' \
    > test.out 2>&1
eval_tap $? 14 'AdminListTags' test.out

#- 15 AdminListUserAchievements
./ng net.accelbyte.sdk.cli.Main achievement adminListUserAchievements \
    --namespace "$AB_NAMESPACE" \
    --userId 'MjdIFrbk' \
    --limit '16' \
    --offset '28' \
    --preferUnlocked  \
    --sortBy 'L09qBkCR' \
    --tags 'ZD8jW9Bo,bdPFOcDx,y0PpC7NP' \
    > test.out 2>&1
eval_tap $? 15 'AdminListUserAchievements' test.out

#- 16 AdminResetAchievement
./ng net.accelbyte.sdk.cli.Main achievement adminResetAchievement \
    --achievementCode 'RlvJKHBp' \
    --namespace "$AB_NAMESPACE" \
    --userId 'XGn88EOx' \
    > test.out 2>&1
eval_tap $? 16 'AdminResetAchievement' test.out

#- 17 AdminUnlockAchievement
./ng net.accelbyte.sdk.cli.Main achievement adminUnlockAchievement \
    --achievementCode 'e6iikYcO' \
    --namespace "$AB_NAMESPACE" \
    --userId 'dddJGAtW' \
    > test.out 2>&1
eval_tap $? 17 'AdminUnlockAchievement' test.out

#- 18 AdminAnonymizeUserAchievement
./ng net.accelbyte.sdk.cli.Main achievement adminAnonymizeUserAchievement \
    --namespace "$AB_NAMESPACE" \
    --userId 'kXRXowku' \
    > test.out 2>&1
eval_tap $? 18 'AdminAnonymizeUserAchievement' test.out

#- 19 AdminListUserContributions
./ng net.accelbyte.sdk.cli.Main achievement adminListUserContributions \
    --namespace "$AB_NAMESPACE" \
    --userId '1JBl3hf0' \
    --achievementCodes 'i4BXIVux' \
    --limit '64' \
    --offset '6' \
    --sortBy 'TWOAsQOH' \
    --tags 'wKB5BTKZ,7ZJqJQO7,Vcsz0WUb' \
    > test.out 2>&1
eval_tap $? 19 'AdminListUserContributions' test.out

#- 20 PublicListAchievements
./ng net.accelbyte.sdk.cli.Main achievement publicListAchievements \
    --namespace "$AB_NAMESPACE" \
    --global  \
    --limit '79' \
    --offset '15' \
    --sortBy 'updatedAt' \
    --tags 'YvnCHoQt,ZuXqkQGw,wu0jct5c' \
    --language 'CDjMe1Ks' \
    > test.out 2>&1
eval_tap $? 20 'PublicListAchievements' test.out

#- 21 PublicGetAchievement
./ng net.accelbyte.sdk.cli.Main achievement publicGetAchievement \
    --achievementCode 'TY1TOKo7' \
    --namespace "$AB_NAMESPACE" \
    --language 'UlaGoMkW' \
    > test.out 2>&1
eval_tap $? 21 'PublicGetAchievement' test.out

#- 22 PublicListGlobalAchievements
./ng net.accelbyte.sdk.cli.Main achievement publicListGlobalAchievements \
    --namespace "$AB_NAMESPACE" \
    --achievementCodes 'eaN4HySd' \
    --limit '60' \
    --offset '54' \
    --sortBy 'td4Zs19W' \
    --status 'IEVBYmLm' \
    --tags 'qp6Y6187,NGiVqW63,uFblzE2i' \
    > test.out 2>&1
eval_tap $? 22 'PublicListGlobalAchievements' test.out

#- 23 ListGlobalAchievementContributors
./ng net.accelbyte.sdk.cli.Main achievement listGlobalAchievementContributors \
    --achievementCode 'R1yQUMTJ' \
    --namespace "$AB_NAMESPACE" \
    --limit '10' \
    --offset '83' \
    --sortBy 'oLHtANzy' \
    > test.out 2>&1
eval_tap $? 23 'ListGlobalAchievementContributors' test.out

#- 24 PublicListTags
./ng net.accelbyte.sdk.cli.Main achievement publicListTags \
    --namespace "$AB_NAMESPACE" \
    --limit '49' \
    --name 'agYJQs77' \
    --offset '15' \
    --sortBy 'ARoDRSV4' \
    > test.out 2>&1
eval_tap $? 24 'PublicListTags' test.out

#- 25 PublicListUserAchievements
./ng net.accelbyte.sdk.cli.Main achievement publicListUserAchievements \
    --namespace "$AB_NAMESPACE" \
    --userId 'dE7yh3KA' \
    --limit '61' \
    --offset '22' \
    --preferUnlocked  \
    --sortBy 'BPoh6fuK' \
    --tags 'ww9FaRqg,YtySkzOA,nYxvXfvv' \
    > test.out 2>&1
eval_tap $? 25 'PublicListUserAchievements' test.out

#- 26 PublicUnlockAchievement
./ng net.accelbyte.sdk.cli.Main achievement publicUnlockAchievement \
    --achievementCode 'jSNDgDXj' \
    --namespace "$AB_NAMESPACE" \
    --userId 'UFE0OJSo' \
    > test.out 2>&1
eval_tap $? 26 'PublicUnlockAchievement' test.out

#- 27 ListUserContributions
./ng net.accelbyte.sdk.cli.Main achievement listUserContributions \
    --namespace "$AB_NAMESPACE" \
    --userId 'wQ0fLptc' \
    --achievementCodes 'iDz0HPp2' \
    --limit '82' \
    --offset '56' \
    --sortBy 'vbwCGKrH' \
    --tags 'PUJa6PF0,I4xVYBUc,q5k4L1w3' \
    > test.out 2>&1
eval_tap $? 27 'ListUserContributions' test.out

#- 28 ClaimGlobalAchievementReward
./ng net.accelbyte.sdk.cli.Main achievement claimGlobalAchievementReward \
    --achievementCode 'Ruw1NzMN' \
    --namespace "$AB_NAMESPACE" \
    --userId 'O0AJ72cg' \
    > test.out 2>&1
eval_tap $? 28 'ClaimGlobalAchievementReward' test.out


rm -f "tmp.dat"

exit $EXIT_CODE