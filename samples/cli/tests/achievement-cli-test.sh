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
    --limit '6' \
    --offset '1' \
    --sortBy 'listOrder:asc' \
    --tags '7Ile7wEb,HqVqEFcd,OXeOvlwf' \
    > test.out 2>&1
eval_tap $? 2 'AdminListAchievements' test.out

#- 3 AdminCreateNewAchievement
./ng net.accelbyte.sdk.cli.Main achievement adminCreateNewAchievement \
    --namespace "$AB_NAMESPACE" \
    --body '{"achievementCode": "vQ65jT0C", "customAttributes": {"byJ7EOqm": {}, "ogRkhTPG": {}, "eJstVmIa": {}}, "defaultLanguage": "wGTSTM6Y", "description": {"MDYWbira": "RIEsgy6u", "oq6K3UfG": "Om1oXTXB", "5Rc8r3zV": "YY5oJAqv"}, "global": true, "goalValue": 0.5107079113959238, "hidden": true, "incremental": false, "lockedIcons": [{"slug": "WCXVUTVo", "url": "ChNjrMUM"}, {"slug": "qCzZluM6", "url": "oMQWuSnh"}, {"slug": "M1oPd1sz", "url": "kGewot2f"}], "name": {"VEWR4CsJ": "Kx5fk4xx", "2ERCjnPl": "Qua72C3S", "qhlfOMIV": "vxXSPsBq"}, "statCode": "3uSk9Nuy", "tags": ["rxdwc1Eu", "PwRjz0Rm", "L2sBo6RL"], "unlockedIcons": [{"slug": "BHKqNiz4", "url": "OLAbWiOK"}, {"slug": "6O1NdoPH", "url": "rd4UsDrt"}, {"slug": "v6ws7WfV", "url": "2049vgzc"}]}' \
    > test.out 2>&1
eval_tap $? 3 'AdminCreateNewAchievement' test.out

#- 4 ExportAchievements
./ng net.accelbyte.sdk.cli.Main achievement exportAchievements \
    --namespace "$AB_NAMESPACE" \
    --tags 'qn48JMJr,8GBCFehS,4sbHdPf4' \
    > test.out 2>&1
eval_tap $? 4 'ExportAchievements' test.out

#- 5 ImportAchievements
./ng net.accelbyte.sdk.cli.Main achievement importAchievements \
    --namespace "$AB_NAMESPACE" \
    --file 'tmp.dat' \
    --strategy 'RQWC1Dxc' \
    > test.out 2>&1
eval_tap $? 5 'ImportAchievements' test.out

#- 6 AdminGetAchievement
./ng net.accelbyte.sdk.cli.Main achievement adminGetAchievement \
    --achievementCode '4XlMFATJ' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 6 'AdminGetAchievement' test.out

#- 7 AdminUpdateAchievement
./ng net.accelbyte.sdk.cli.Main achievement adminUpdateAchievement \
    --achievementCode 'BGl9HuyH' \
    --namespace "$AB_NAMESPACE" \
    --body '{"customAttributes": {"MatAvjDF": {}, "jW4a0Nxr": {}, "BPcTK4Wd": {}}, "defaultLanguage": "oWg4524I", "description": {"lAsmdBfx": "SXq9ORnU", "wM6FoI1n": "kSAl4ORU", "DleXcUFQ": "F24uRU1Q"}, "global": false, "goalValue": 0.023436693039954992, "hidden": false, "incremental": true, "lockedIcons": [{"slug": "GyzE5RHU", "url": "hXoQ3Sjb"}, {"slug": "IjpfyhTy", "url": "vPAf7QSG"}, {"slug": "iJqt0dt5", "url": "LIbD1Atj"}], "name": {"R4oSlITn": "W8zVl89R", "YNO7GIcv": "BTr4U5ky", "a7c7pEJn": "cBCCzIRT"}, "statCode": "zZ7Y9DlC", "tags": ["6FO8AjQk", "tjjIRWzZ", "k9cBFfHs"], "unlockedIcons": [{"slug": "sxTrpI2r", "url": "MEyA48s8"}, {"slug": "KNpKmU0m", "url": "DeeTvSra"}, {"slug": "S99OvwDF", "url": "SFUdSjvb"}]}' \
    > test.out 2>&1
eval_tap $? 7 'AdminUpdateAchievement' test.out

#- 8 AdminDeleteAchievement
./ng net.accelbyte.sdk.cli.Main achievement adminDeleteAchievement \
    --achievementCode 'nWfIMdUv' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 8 'AdminDeleteAchievement' test.out

#- 9 AdminUpdateAchievementListOrder
./ng net.accelbyte.sdk.cli.Main achievement adminUpdateAchievementListOrder \
    --achievementCode 'XdmRl4Ne' \
    --namespace "$AB_NAMESPACE" \
    --body '{"targetOrder": 1}' \
    > test.out 2>&1
eval_tap $? 9 'AdminUpdateAchievementListOrder' test.out

#- 10 AdminListGlobalAchievements
./ng net.accelbyte.sdk.cli.Main achievement adminListGlobalAchievements \
    --namespace "$AB_NAMESPACE" \
    --achievementCodes 'NX2m4RDK' \
    --limit '90' \
    --offset '13' \
    --sortBy 'EyqwYlzI' \
    --status 'GxvOltas' \
    --tags '8VknxnX1,PkEXI202,MWmKXPaT' \
    > test.out 2>&1
eval_tap $? 10 'AdminListGlobalAchievements' test.out

#- 11 AdminListGlobalAchievementContributors
./ng net.accelbyte.sdk.cli.Main achievement adminListGlobalAchievementContributors \
    --achievementCode 'y60aYqur' \
    --namespace "$AB_NAMESPACE" \
    --limit '7' \
    --offset '100' \
    --sortBy 'Wrek5QWJ' \
    > test.out 2>&1
eval_tap $? 11 'AdminListGlobalAchievementContributors' test.out

#- 12 ResetGlobalAchievement
./ng net.accelbyte.sdk.cli.Main achievement resetGlobalAchievement \
    --achievementCode '04ayPw3r' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 12 'ResetGlobalAchievement' test.out

#- 13 BulkCreatePSNEvent
./ng net.accelbyte.sdk.cli.Main achievement bulkCreatePSNEvent \
    --namespace "$AB_NAMESPACE" \
    --body '{"data": [{"events": [{"dateTime": "YWs91ypz", "eventData": {"eventName": "AHztG1Ri", "properties": {"UDuH6khL": {}, "inVRVogQ": {}, "SRq03xak": {}}}, "eventId": "hGxCpn2w", "version": "qirnJ2A4"}, {"dateTime": "ZkBrl0hH", "eventData": {"eventName": "rsDn2qLX", "properties": {"7JDlUVTl": {}, "fnEnlLnw": {}, "iFYAgJKs": {}}}, "eventId": "AUjJjwbw", "version": "0DV1lI9r"}, {"dateTime": "q97ZWFI0", "eventData": {"eventName": "nKEbkObl", "properties": {"LcH2NU6X": {}, "ouSyk6G0": {}, "wTUJBV6D": {}}}, "eventId": "7188Xqkt", "version": "ItGnmo5w"}], "thirdPartyUserId": "gZUISJT0", "userId": "ZMMKrdfH"}, {"events": [{"dateTime": "gLY48RSM", "eventData": {"eventName": "dsdACeUU", "properties": {"p0UekCCt": {}, "z7fvvwkx": {}, "qA84S3KJ": {}}}, "eventId": "0KZrRdTu", "version": "TeS6EfkD"}, {"dateTime": "6VvfT4Rk", "eventData": {"eventName": "TBGthvgn", "properties": {"mbx62rtB": {}, "n23ronVs": {}, "KzzdDUcI": {}}}, "eventId": "pkNUPmhu", "version": "13QDOrGB"}, {"dateTime": "EZdbH6gh", "eventData": {"eventName": "YB3nsMAb", "properties": {"zDr6NSix": {}, "2pNgwzAf": {}, "aaoBMfBl": {}}}, "eventId": "qifPuyWj", "version": "lChsqiQB"}], "thirdPartyUserId": "o1sr8C9A", "userId": "V4NP8VrQ"}, {"events": [{"dateTime": "AK8c2Lih", "eventData": {"eventName": "Uors1sdt", "properties": {"PEMtpicq": {}, "NfWiGsXK": {}, "nb51qfnv": {}}}, "eventId": "8VaY6CmF", "version": "3T1vbp3T"}, {"dateTime": "PbKf4z5S", "eventData": {"eventName": "I7gI1je2", "properties": {"IKlJrP1W": {}, "rmdVzvuu": {}, "wZZUBtsW": {}}}, "eventId": "DGZd3Fue", "version": "JaKk3lHe"}, {"dateTime": "qKXDEUNN", "eventData": {"eventName": "OucXwgsL", "properties": {"0kmLn907": {}, "RqIq5zKU": {}, "drdGtDkl": {}}}, "eventId": "A5YUBnbx", "version": "tkTTdIz7"}], "thirdPartyUserId": "al9Ysnk2", "userId": "62lvHoUU"}]}' \
    > test.out 2>&1
eval_tap $? 13 'BulkCreatePSNEvent' test.out

#- 14 AdminListTags
./ng net.accelbyte.sdk.cli.Main achievement adminListTags \
    --namespace "$AB_NAMESPACE" \
    --limit '80' \
    --name 'nliMjRQb' \
    --offset '88' \
    --sortBy '2LH3h6NK' \
    > test.out 2>&1
eval_tap $? 14 'AdminListTags' test.out

#- 15 AdminListUserAchievements
./ng net.accelbyte.sdk.cli.Main achievement adminListUserAchievements \
    --namespace "$AB_NAMESPACE" \
    --userId '26ApKamK' \
    --limit '38' \
    --offset '6' \
    --preferUnlocked  \
    --sortBy '3JxpZhlO' \
    --tags 'A8DBJKDp,AUU1g0AV,RjWBa3ya' \
    > test.out 2>&1
eval_tap $? 15 'AdminListUserAchievements' test.out

#- 16 AdminResetAchievement
./ng net.accelbyte.sdk.cli.Main achievement adminResetAchievement \
    --achievementCode 'Hvr5aIrd' \
    --namespace "$AB_NAMESPACE" \
    --userId 'uJxQqKJK' \
    > test.out 2>&1
eval_tap $? 16 'AdminResetAchievement' test.out

#- 17 AdminUnlockAchievement
./ng net.accelbyte.sdk.cli.Main achievement adminUnlockAchievement \
    --achievementCode 'yFasdkmU' \
    --namespace "$AB_NAMESPACE" \
    --userId 'c3EDZu7y' \
    > test.out 2>&1
eval_tap $? 17 'AdminUnlockAchievement' test.out

#- 18 AdminAnonymizeUserAchievement
./ng net.accelbyte.sdk.cli.Main achievement adminAnonymizeUserAchievement \
    --namespace "$AB_NAMESPACE" \
    --userId '5SwGNZRO' \
    > test.out 2>&1
eval_tap $? 18 'AdminAnonymizeUserAchievement' test.out

#- 19 AdminListUserContributions
./ng net.accelbyte.sdk.cli.Main achievement adminListUserContributions \
    --namespace "$AB_NAMESPACE" \
    --userId 'mTH2xDI8' \
    --achievementCodes 'pkZ2x0hQ' \
    --limit '98' \
    --offset '28' \
    --sortBy 'uzJOK1lH' \
    --tags 'hRTkgjBm,jlrqVhTa,f9gsSDJl' \
    > test.out 2>&1
eval_tap $? 19 'AdminListUserContributions' test.out

#- 20 PublicListAchievements
./ng net.accelbyte.sdk.cli.Main achievement publicListAchievements \
    --namespace "$AB_NAMESPACE" \
    --global  \
    --limit '91' \
    --offset '3' \
    --sortBy 'updatedAt' \
    --tags 'tNCaofUR,fv24c7tp,FZVtG8k6' \
    --language '5DYSiykJ' \
    > test.out 2>&1
eval_tap $? 20 'PublicListAchievements' test.out

#- 21 PublicGetAchievement
./ng net.accelbyte.sdk.cli.Main achievement publicGetAchievement \
    --achievementCode 'a81PmYsT' \
    --namespace "$AB_NAMESPACE" \
    --language 'hXn13ZfP' \
    > test.out 2>&1
eval_tap $? 21 'PublicGetAchievement' test.out

#- 22 PublicListGlobalAchievements
./ng net.accelbyte.sdk.cli.Main achievement publicListGlobalAchievements \
    --namespace "$AB_NAMESPACE" \
    --achievementCodes 'JUJuKSgY' \
    --limit '50' \
    --offset '44' \
    --sortBy 'Rxpxm1IS' \
    --status 'SudFnNqT' \
    --tags 'uqZui4sI,TkmvcwV8,GLnLuCMd' \
    > test.out 2>&1
eval_tap $? 22 'PublicListGlobalAchievements' test.out

#- 23 ListGlobalAchievementContributors
./ng net.accelbyte.sdk.cli.Main achievement listGlobalAchievementContributors \
    --achievementCode 'Kr9o5BqU' \
    --namespace "$AB_NAMESPACE" \
    --limit '66' \
    --offset '61' \
    --sortBy '6fR4DM4x' \
    > test.out 2>&1
eval_tap $? 23 'ListGlobalAchievementContributors' test.out

#- 24 PublicListTags
./ng net.accelbyte.sdk.cli.Main achievement publicListTags \
    --namespace "$AB_NAMESPACE" \
    --limit '67' \
    --name 'eUB3AruP' \
    --offset '12' \
    --sortBy 'aJtWgdIp' \
    > test.out 2>&1
eval_tap $? 24 'PublicListTags' test.out

#- 25 PublicListUserAchievements
./ng net.accelbyte.sdk.cli.Main achievement publicListUserAchievements \
    --namespace "$AB_NAMESPACE" \
    --userId '6aSCkgnc' \
    --limit '72' \
    --offset '7' \
    --preferUnlocked  \
    --sortBy 'MqSVxOR1' \
    --tags '30vRTwPC,BSw2vf0Q,b0YUD5qh' \
    > test.out 2>&1
eval_tap $? 25 'PublicListUserAchievements' test.out

#- 26 PublicUnlockAchievement
./ng net.accelbyte.sdk.cli.Main achievement publicUnlockAchievement \
    --achievementCode 'mUznh0VV' \
    --namespace "$AB_NAMESPACE" \
    --userId 'cJXFW0Fd' \
    > test.out 2>&1
eval_tap $? 26 'PublicUnlockAchievement' test.out

#- 27 ListUserContributions
./ng net.accelbyte.sdk.cli.Main achievement listUserContributions \
    --namespace "$AB_NAMESPACE" \
    --userId 'sqqSPcpn' \
    --achievementCodes 'qWpkX0Jw' \
    --limit '64' \
    --offset '48' \
    --sortBy 'MpwNwQxI' \
    --tags 'KxI1rXiU,NNmEcetU,nvsMgu1Z' \
    > test.out 2>&1
eval_tap $? 27 'ListUserContributions' test.out

#- 28 ClaimGlobalAchievementReward
./ng net.accelbyte.sdk.cli.Main achievement claimGlobalAchievementReward \
    --achievementCode 'M4tAtIY5' \
    --namespace "$AB_NAMESPACE" \
    --userId 'M3BMW2V6' \
    > test.out 2>&1
eval_tap $? 28 'ClaimGlobalAchievementReward' test.out


rm -f "tmp.dat"

exit $EXIT_CODE