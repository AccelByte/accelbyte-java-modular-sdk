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
    --limit '57' \
    --offset '24' \
    --sortBy 'updatedAt:desc' \
    --tags '3I5nddum,TqtyA7U3,yBtgRaAq' \
    > test.out 2>&1
eval_tap $? 2 'AdminListAchievements' test.out

#- 3 AdminCreateNewAchievement
./ng net.accelbyte.sdk.cli.Main achievement adminCreateNewAchievement \
    --namespace "$AB_NAMESPACE" \
    --body '{"achievementCode": "MMa2qKlL", "customAttributes": {"sty64kWM": {}, "WuoUr2vV": {}, "ObGcAXLo": {}}, "defaultLanguage": "yUeGOqE9", "description": {"TMnGnGOw": "RRENfXCx", "zSQzxrHE": "AivT4RUf", "LaPSCdnN": "JpK23GQm"}, "global": true, "goalValue": 0.8206829268058722, "hidden": false, "incremental": true, "lockedIcons": [{"slug": "loL2NdFn", "url": "SQZ7eI6l"}, {"slug": "RsuFtYda", "url": "G26pMeVc"}, {"slug": "jQlQGyOy", "url": "sfgD5WNZ"}], "name": {"dYpRKs7i": "I4QVvjyU", "ebEb6MhG": "QthRh9cI", "snprJ1LH": "cec9grCx"}, "statCode": "Cmtk1w7B", "tags": ["qid3frHT", "i4Z95JcE", "EPWIwx2z"], "unlockedIcons": [{"slug": "JKh0qEDW", "url": "dBIt2ZPS"}, {"slug": "8agXbpXI", "url": "w33lEQ0O"}, {"slug": "oaaLyXGo", "url": "hACXdO7t"}]}' \
    > test.out 2>&1
eval_tap $? 3 'AdminCreateNewAchievement' test.out

#- 4 ExportAchievements
./ng net.accelbyte.sdk.cli.Main achievement exportAchievements \
    --namespace "$AB_NAMESPACE" \
    --tags 'fcXiTKEX,XHQf0piH,RkvAL9A3' \
    > test.out 2>&1
eval_tap $? 4 'ExportAchievements' test.out

#- 5 ImportAchievements
./ng net.accelbyte.sdk.cli.Main achievement importAchievements \
    --namespace "$AB_NAMESPACE" \
    --file 'tmp.dat' \
    --strategy 'nBlwLthw' \
    > test.out 2>&1
eval_tap $? 5 'ImportAchievements' test.out

#- 6 AdminGetAchievement
./ng net.accelbyte.sdk.cli.Main achievement adminGetAchievement \
    --achievementCode 'XRFooq0H' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 6 'AdminGetAchievement' test.out

#- 7 AdminUpdateAchievement
./ng net.accelbyte.sdk.cli.Main achievement adminUpdateAchievement \
    --achievementCode 'yonmUqce' \
    --namespace "$AB_NAMESPACE" \
    --body '{"customAttributes": {"lU80oG9f": {}, "AizOfwHO": {}, "jsiPU8IY": {}}, "defaultLanguage": "gdDudBfc", "description": {"BBHUlhs9": "zRCX15qY", "67XOxzOV": "TbDEySZh", "oxryq9cF": "aOCmmpAy"}, "global": true, "goalValue": 0.48641185395298125, "hidden": true, "incremental": false, "lockedIcons": [{"slug": "qhlThxMj", "url": "dh0bPLRz"}, {"slug": "4ngPa25m", "url": "orijmlU9"}, {"slug": "X37XroqB", "url": "1wA3zMdS"}], "name": {"zjrM9L1T": "y2wYwEzf", "cRP4Amvh": "EafXJwsF", "tBvqRxrb": "a9PESgbP"}, "statCode": "acmUpbsM", "tags": ["WCRqdLdu", "OOlwMdg3", "XPZZ5290"], "unlockedIcons": [{"slug": "bJR59DUG", "url": "JExtTOgT"}, {"slug": "raZAWTZP", "url": "WOX6wCuJ"}, {"slug": "5luBgyJi", "url": "urvrRl6r"}]}' \
    > test.out 2>&1
eval_tap $? 7 'AdminUpdateAchievement' test.out

#- 8 AdminDeleteAchievement
./ng net.accelbyte.sdk.cli.Main achievement adminDeleteAchievement \
    --achievementCode 'yvKT31xo' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 8 'AdminDeleteAchievement' test.out

#- 9 AdminUpdateAchievementListOrder
./ng net.accelbyte.sdk.cli.Main achievement adminUpdateAchievementListOrder \
    --achievementCode 'urooBJsl' \
    --namespace "$AB_NAMESPACE" \
    --body '{"targetOrder": 89}' \
    > test.out 2>&1
eval_tap $? 9 'AdminUpdateAchievementListOrder' test.out

#- 10 AdminListGlobalAchievements
./ng net.accelbyte.sdk.cli.Main achievement adminListGlobalAchievements \
    --namespace "$AB_NAMESPACE" \
    --achievementCodes 'L4r0SkzJ' \
    --limit '75' \
    --offset '53' \
    --sortBy 'qzOzuLsx' \
    --status 'zqJEKwiU' \
    --tags 'N18Lo5ft,I3B4tUbC,LySw8HeG' \
    > test.out 2>&1
eval_tap $? 10 'AdminListGlobalAchievements' test.out

#- 11 AdminListGlobalAchievementContributors
./ng net.accelbyte.sdk.cli.Main achievement adminListGlobalAchievementContributors \
    --achievementCode 'z01R6HCr' \
    --namespace "$AB_NAMESPACE" \
    --limit '41' \
    --offset '45' \
    --sortBy '9OgyMKWd' \
    > test.out 2>&1
eval_tap $? 11 'AdminListGlobalAchievementContributors' test.out

#- 12 ResetGlobalAchievement
./ng net.accelbyte.sdk.cli.Main achievement resetGlobalAchievement \
    --achievementCode 'eb4wmLLL' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 12 'ResetGlobalAchievement' test.out

#- 13 BulkCreatePSNEvent
./ng net.accelbyte.sdk.cli.Main achievement bulkCreatePSNEvent \
    --namespace "$AB_NAMESPACE" \
    --body '{"data": [{"events": [{"dateTime": "KS0kF2wh", "eventData": {"eventName": "UNdr4OjK", "properties": {"gz6bssx3": {}, "OMmGDXET": {}, "8y3u8lcg": {}}}, "eventId": "l69I6nHw", "version": "AqiTDsoC"}, {"dateTime": "pH0wIc31", "eventData": {"eventName": "VI3Olyc4", "properties": {"NSCi5CFB": {}, "E2kKJuj3": {}, "YSpJNqnu": {}}}, "eventId": "6oXq1YdA", "version": "tuhzS8sv"}, {"dateTime": "WEYBC7rD", "eventData": {"eventName": "PJZMNuOF", "properties": {"lb1WShHh": {}, "UjkxIr3N": {}, "wPVADMUj": {}}}, "eventId": "wc9pcWnb", "version": "yUQnKkv8"}], "thirdPartyUserId": "SuWNeyyH", "userId": "WCN4yBDO"}, {"events": [{"dateTime": "fjbmVe0o", "eventData": {"eventName": "Bj5XUY77", "properties": {"IKdmAHIc": {}, "M92rlJkI": {}, "U9QQzgoq": {}}}, "eventId": "tpYSo1OA", "version": "kfHBurpk"}, {"dateTime": "VhiJqFPF", "eventData": {"eventName": "UvBb3N8Z", "properties": {"duDV0bXK": {}, "99srl0PD": {}, "igyPXpYa": {}}}, "eventId": "yAFy6II6", "version": "SMegDfcp"}, {"dateTime": "aMR7WlhE", "eventData": {"eventName": "R4ryWTmV", "properties": {"XbPJXFBd": {}, "5C4gqaCZ": {}, "6BWC2rAp": {}}}, "eventId": "oM2p1eiK", "version": "8Yj9CWzW"}], "thirdPartyUserId": "rD4y8Ypm", "userId": "jiTbM2lb"}, {"events": [{"dateTime": "ABh1jAep", "eventData": {"eventName": "yC7PRRfy", "properties": {"e3jocDlF": {}, "SHR3oSck": {}, "4SDCW6j9": {}}}, "eventId": "6GQzv8NR", "version": "cqVUOg80"}, {"dateTime": "kXnDE1nn", "eventData": {"eventName": "7zT1InDU", "properties": {"hs98PY70": {}, "dmzMxpmr": {}, "eWQj7M6O": {}}}, "eventId": "FcPU3eq9", "version": "31mG8MsH"}, {"dateTime": "XW8GudB0", "eventData": {"eventName": "dINtFRIM", "properties": {"GUMSI5mE": {}, "UJ0DGVFx": {}, "UspGAade": {}}}, "eventId": "HJMZ1qp8", "version": "HeI788X2"}], "thirdPartyUserId": "vDYtTBbm", "userId": "5H1eMZ0x"}]}' \
    > test.out 2>&1
eval_tap $? 13 'BulkCreatePSNEvent' test.out

#- 14 AdminListTags
./ng net.accelbyte.sdk.cli.Main achievement adminListTags \
    --namespace "$AB_NAMESPACE" \
    --limit '25' \
    --name 'emimbwwn' \
    --offset '31' \
    --sortBy 'SPELA0wU' \
    > test.out 2>&1
eval_tap $? 14 'AdminListTags' test.out

#- 15 AdminListUserAchievements
./ng net.accelbyte.sdk.cli.Main achievement adminListUserAchievements \
    --namespace "$AB_NAMESPACE" \
    --userId 'peSHoGR3' \
    --limit '40' \
    --offset '79' \
    --preferUnlocked  \
    --sortBy 'XwlCBAVv' \
    --tags 'iuXvTl9X,1lG947ju,FUeARg2o' \
    > test.out 2>&1
eval_tap $? 15 'AdminListUserAchievements' test.out

#- 16 AdminResetAchievement
./ng net.accelbyte.sdk.cli.Main achievement adminResetAchievement \
    --achievementCode 'nRNL98Wq' \
    --namespace "$AB_NAMESPACE" \
    --userId 'uMtoj6Js' \
    > test.out 2>&1
eval_tap $? 16 'AdminResetAchievement' test.out

#- 17 AdminUnlockAchievement
./ng net.accelbyte.sdk.cli.Main achievement adminUnlockAchievement \
    --achievementCode 'vVN9RCSo' \
    --namespace "$AB_NAMESPACE" \
    --userId 'rhux5UqO' \
    > test.out 2>&1
eval_tap $? 17 'AdminUnlockAchievement' test.out

#- 18 AdminAnonymizeUserAchievement
./ng net.accelbyte.sdk.cli.Main achievement adminAnonymizeUserAchievement \
    --namespace "$AB_NAMESPACE" \
    --userId 'uBBWRMh9' \
    > test.out 2>&1
eval_tap $? 18 'AdminAnonymizeUserAchievement' test.out

#- 19 AdminListUserContributions
./ng net.accelbyte.sdk.cli.Main achievement adminListUserContributions \
    --namespace "$AB_NAMESPACE" \
    --userId 'FmKIc1d2' \
    --achievementCodes 'xhcUfhQ8' \
    --limit '26' \
    --offset '50' \
    --sortBy 'HHnCEEzj' \
    --tags 'DX6vZI7M,v1xIEDQP,Scgb1r3y' \
    > test.out 2>&1
eval_tap $? 19 'AdminListUserContributions' test.out

#- 20 PublicListAchievements
./ng net.accelbyte.sdk.cli.Main achievement publicListAchievements \
    --namespace "$AB_NAMESPACE" \
    --global  \
    --limit '3' \
    --offset '55' \
    --sortBy 'createdAt:asc' \
    --tags '1GnQuAak,W0SEEEWy,GEsXeUj6' \
    --language '2gdLuzqa' \
    > test.out 2>&1
eval_tap $? 20 'PublicListAchievements' test.out

#- 21 PublicGetAchievement
./ng net.accelbyte.sdk.cli.Main achievement publicGetAchievement \
    --achievementCode 'fmVoQLv8' \
    --namespace "$AB_NAMESPACE" \
    --language 'AUszvpFW' \
    > test.out 2>&1
eval_tap $? 21 'PublicGetAchievement' test.out

#- 22 PublicListGlobalAchievements
./ng net.accelbyte.sdk.cli.Main achievement publicListGlobalAchievements \
    --namespace "$AB_NAMESPACE" \
    --achievementCodes 'shFaidaJ' \
    --limit '9' \
    --offset '75' \
    --sortBy 'fr0JuHSi' \
    --status 'N8dEGBbk' \
    --tags 'CJDsCjXx,YkXTVU4v,026izIsb' \
    > test.out 2>&1
eval_tap $? 22 'PublicListGlobalAchievements' test.out

#- 23 ListGlobalAchievementContributors
./ng net.accelbyte.sdk.cli.Main achievement listGlobalAchievementContributors \
    --achievementCode 'zRDXLY94' \
    --namespace "$AB_NAMESPACE" \
    --limit '23' \
    --offset '57' \
    --sortBy 'iLwU1it1' \
    > test.out 2>&1
eval_tap $? 23 'ListGlobalAchievementContributors' test.out

#- 24 PublicListTags
./ng net.accelbyte.sdk.cli.Main achievement publicListTags \
    --namespace "$AB_NAMESPACE" \
    --limit '66' \
    --name 'ky0S2GWs' \
    --offset '85' \
    --sortBy 'nZIGiAxG' \
    > test.out 2>&1
eval_tap $? 24 'PublicListTags' test.out

#- 25 PublicListUserAchievements
./ng net.accelbyte.sdk.cli.Main achievement publicListUserAchievements \
    --namespace "$AB_NAMESPACE" \
    --userId 'ZIPV2PsA' \
    --limit '26' \
    --offset '19' \
    --preferUnlocked  \
    --sortBy 'prIxD8YU' \
    --tags 'hp0h5aKb,xsaB7rhh,5XfwSVVB' \
    > test.out 2>&1
eval_tap $? 25 'PublicListUserAchievements' test.out

#- 26 PublicUnlockAchievement
./ng net.accelbyte.sdk.cli.Main achievement publicUnlockAchievement \
    --achievementCode 'nQtU7E8e' \
    --namespace "$AB_NAMESPACE" \
    --userId 'C3mRdMjw' \
    > test.out 2>&1
eval_tap $? 26 'PublicUnlockAchievement' test.out

#- 27 ListUserContributions
./ng net.accelbyte.sdk.cli.Main achievement listUserContributions \
    --namespace "$AB_NAMESPACE" \
    --userId 'mqg0Ccdp' \
    --achievementCodes '1Veeesa3' \
    --limit '69' \
    --offset '13' \
    --sortBy 'YICkLYkr' \
    --tags '3yZUeiV6,fAg37j2O,soFZ02Jq' \
    > test.out 2>&1
eval_tap $? 27 'ListUserContributions' test.out

#- 28 ClaimGlobalAchievementReward
./ng net.accelbyte.sdk.cli.Main achievement claimGlobalAchievementReward \
    --achievementCode 'KmkcRUz2' \
    --namespace "$AB_NAMESPACE" \
    --userId 'KqKtZ7SH' \
    > test.out 2>&1
eval_tap $? 28 'ClaimGlobalAchievementReward' test.out


rm -f "tmp.dat"

exit $EXIT_CODE