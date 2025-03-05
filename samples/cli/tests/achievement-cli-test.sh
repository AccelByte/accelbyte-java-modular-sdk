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
    --limit '22' \
    --offset '32' \
    --sortBy 'updatedAt' \
    --tags 'VdzxclFt,eM5eSEvN,4wvJ8tLo' \
    > test.out 2>&1
eval_tap $? 2 'AdminListAchievements' test.out

#- 3 AdminCreateNewAchievement
./ng net.accelbyte.sdk.cli.Main achievement adminCreateNewAchievement \
    --namespace "$AB_NAMESPACE" \
    --body '{"achievementCode": "isXOLMU2", "customAttributes": {"RZDfVRht": {}, "tWSuslam": {}, "EhbvjugI": {}}, "defaultLanguage": "LOxrXQqd", "description": {"vE3ji7yD": "4XUGQhzk", "xgvkiQHC": "phbJxfVF", "6FtE2hJc": "LGkExpZp"}, "global": true, "goalValue": 0.8274878749189378, "hidden": true, "incremental": false, "lockedIcons": [{"slug": "l4MV556d", "url": "Gca7pTFG"}, {"slug": "OasJh72L", "url": "nlUhdBcg"}, {"slug": "HTU4Ejvu", "url": "1RY3SaLh"}], "name": {"P1kz3a5M": "J1edWmrM", "OyUdCGmZ": "lffSQwzr", "QNLUTchA": "sE6VnubK"}, "statCode": "26O1Kspd", "tags": ["RkarifCQ", "DgOo1DAA", "ANnLeSVA"], "unlockedIcons": [{"slug": "ixUiZcsV", "url": "0Fpw2uLq"}, {"slug": "lknaMno1", "url": "HCyA3t4M"}, {"slug": "wZSOS9fy", "url": "7WzIoBkN"}]}' \
    > test.out 2>&1
eval_tap $? 3 'AdminCreateNewAchievement' test.out

#- 4 ExportAchievements
./ng net.accelbyte.sdk.cli.Main achievement exportAchievements \
    --namespace "$AB_NAMESPACE" \
    --tags '9gnW2ToV,3ZaXnvU6,jhS3QX5f' \
    > test.out 2>&1
eval_tap $? 4 'ExportAchievements' test.out

#- 5 ImportAchievements
./ng net.accelbyte.sdk.cli.Main achievement importAchievements \
    --namespace "$AB_NAMESPACE" \
    --file 'tmp.dat' \
    --strategy 'nnceeR7Z' \
    > test.out 2>&1
eval_tap $? 5 'ImportAchievements' test.out

#- 6 AdminGetAchievement
./ng net.accelbyte.sdk.cli.Main achievement adminGetAchievement \
    --achievementCode 'GKNWFAcR' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 6 'AdminGetAchievement' test.out

#- 7 AdminUpdateAchievement
./ng net.accelbyte.sdk.cli.Main achievement adminUpdateAchievement \
    --achievementCode 'd1aIhVbq' \
    --namespace "$AB_NAMESPACE" \
    --body '{"customAttributes": {"BtkpVjnt": {}, "CVpcOOQZ": {}, "z27uwrWC": {}}, "defaultLanguage": "FUcikUqD", "description": {"KhomBpMv": "KJlFkZQT", "icuMRN8t": "mLe8rSyb", "1GNJbgt6": "sa3GjLbG"}, "global": true, "goalValue": 0.6143939339377091, "hidden": false, "incremental": false, "lockedIcons": [{"slug": "UzWl2fPC", "url": "QJgTxcH2"}, {"slug": "rqil4zYH", "url": "2lViTlg7"}, {"slug": "YLYuSiEN", "url": "fS4tJWXa"}], "name": {"UIiYGTVr": "iZ6fXsGb", "KQJUdVfB": "PFUNia40", "GrzNKbSr": "Lo9EK6Dj"}, "statCode": "qO0hHfQP", "tags": ["YoBSRZJP", "ExKDeRVX", "Y0NUnhtz"], "unlockedIcons": [{"slug": "rZ1WzG0Z", "url": "tj9Ygamu"}, {"slug": "mQUIVpz9", "url": "fqBtxvdS"}, {"slug": "faQfergU", "url": "onzj9o2r"}]}' \
    > test.out 2>&1
eval_tap $? 7 'AdminUpdateAchievement' test.out

#- 8 AdminDeleteAchievement
./ng net.accelbyte.sdk.cli.Main achievement adminDeleteAchievement \
    --achievementCode 'Dwg4U8ec' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 8 'AdminDeleteAchievement' test.out

#- 9 AdminUpdateAchievementListOrder
./ng net.accelbyte.sdk.cli.Main achievement adminUpdateAchievementListOrder \
    --achievementCode 'd8qO2ChI' \
    --namespace "$AB_NAMESPACE" \
    --body '{"targetOrder": 51}' \
    > test.out 2>&1
eval_tap $? 9 'AdminUpdateAchievementListOrder' test.out

#- 10 AdminListGlobalAchievements
./ng net.accelbyte.sdk.cli.Main achievement adminListGlobalAchievements \
    --namespace "$AB_NAMESPACE" \
    --achievementCodes 'jDC9azMB' \
    --limit '10' \
    --offset '38' \
    --sortBy 'achievedAt:asc' \
    --status '8aqhLvKe' \
    --tags 'M4am1jPJ,sZ4S4NPs,1k060o9H' \
    > test.out 2>&1
eval_tap $? 10 'AdminListGlobalAchievements' test.out

#- 11 AdminListGlobalAchievementContributors
./ng net.accelbyte.sdk.cli.Main achievement adminListGlobalAchievementContributors \
    --achievementCode 'eWs17uUV' \
    --namespace "$AB_NAMESPACE" \
    --limit '56' \
    --offset '90' \
    --sortBy 'contributedValue:desc' \
    > test.out 2>&1
eval_tap $? 11 'AdminListGlobalAchievementContributors' test.out

#- 12 ResetGlobalAchievement
./ng net.accelbyte.sdk.cli.Main achievement resetGlobalAchievement \
    --achievementCode '5A3PdhYZ' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 12 'ResetGlobalAchievement' test.out

#- 13 BulkCreatePSNEvent
./ng net.accelbyte.sdk.cli.Main achievement bulkCreatePSNEvent \
    --namespace "$AB_NAMESPACE" \
    --body '{"data": [{"events": [{"dateTime": "j5zoF8LW", "eventData": {"eventName": "2t0Tnd7N", "properties": {"Q0h4p6I7": {}, "RnOSKfhW": {}, "VX2Ktwxh": {}}}, "eventId": "HtjgpzNy", "version": "ODyvNKcW"}, {"dateTime": "AZGfxdhn", "eventData": {"eventName": "qz9K59JA", "properties": {"9mDEPnxi": {}, "aScf71fe": {}, "K2BOuLqM": {}}}, "eventId": "VGNEFyVr", "version": "vRhgmqFT"}, {"dateTime": "exnMHqQU", "eventData": {"eventName": "fCIn2esQ", "properties": {"92eD0VU4": {}, "wCN2v2a6": {}, "RqMSDzzD": {}}}, "eventId": "rH9IhBFf", "version": "OAIpcreo"}], "thirdPartyUserId": "iqakiMtq", "userId": "QUu1eQSY"}, {"events": [{"dateTime": "fV7MVRhF", "eventData": {"eventName": "n4VXE324", "properties": {"W4mxG3OG": {}, "QbeBNvmC": {}, "qdBCZhye": {}}}, "eventId": "wXcu1fuW", "version": "mo0gUQC6"}, {"dateTime": "v3VT4TdH", "eventData": {"eventName": "6zPWEICe", "properties": {"hXdy8QZU": {}, "tEbWUEfH": {}, "Ahiw09Cx": {}}}, "eventId": "2b9EfsKv", "version": "hCGGUDRM"}, {"dateTime": "MsObJfJn", "eventData": {"eventName": "phU5Xvop", "properties": {"cAOxjC9t": {}, "kJmGe5RE": {}, "FlNaRb7s": {}}}, "eventId": "uUsxVEHF", "version": "nsYoqSVX"}], "thirdPartyUserId": "DGjPg8YB", "userId": "vfOREnKW"}, {"events": [{"dateTime": "gn5OHRIN", "eventData": {"eventName": "1LpKihoY", "properties": {"R6g2icis": {}, "lPVxPjjp": {}, "ijxf8NLg": {}}}, "eventId": "EfLhjcU5", "version": "dHzb5hdS"}, {"dateTime": "YS3Fhova", "eventData": {"eventName": "xBveWLw0", "properties": {"sfcAzoGN": {}, "WpzLnhXt": {}, "YlDf7AHZ": {}}}, "eventId": "bQC9Ltm2", "version": "5AMEukE5"}, {"dateTime": "0FwEon7n", "eventData": {"eventName": "xRVau85S", "properties": {"tAYGaShw": {}, "mzgJNGyk": {}, "E4Qui1D1": {}}}, "eventId": "1UCDVY2D", "version": "XCC9iFm1"}], "thirdPartyUserId": "GfI1Ot5L", "userId": "ClGxp9CT"}]}' \
    > test.out 2>&1
eval_tap $? 13 'BulkCreatePSNEvent' test.out

#- 14 AdminListTags
./ng net.accelbyte.sdk.cli.Main achievement adminListTags \
    --namespace "$AB_NAMESPACE" \
    --limit '49' \
    --name 'pTfDN2Hh' \
    --offset '83' \
    --sortBy 'name' \
    > test.out 2>&1
eval_tap $? 14 'AdminListTags' test.out

#- 15 AdminListUserAchievements
./ng net.accelbyte.sdk.cli.Main achievement adminListUserAchievements \
    --namespace "$AB_NAMESPACE" \
    --userId 'lhR3dBPt' \
    --limit '30' \
    --offset '52' \
    --preferUnlocked  \
    --sortBy 'achievedAt:desc' \
    --tags 'kdjqH01T,Pws7jrGh,iq8uo4iY' \
    > test.out 2>&1
eval_tap $? 15 'AdminListUserAchievements' test.out

#- 16 AdminResetAchievement
./ng net.accelbyte.sdk.cli.Main achievement adminResetAchievement \
    --achievementCode 'KYYcs0Lo' \
    --namespace "$AB_NAMESPACE" \
    --userId '27iZ8Xgr' \
    > test.out 2>&1
eval_tap $? 16 'AdminResetAchievement' test.out

#- 17 AdminUnlockAchievement
./ng net.accelbyte.sdk.cli.Main achievement adminUnlockAchievement \
    --achievementCode 'Mf1xSmtZ' \
    --namespace "$AB_NAMESPACE" \
    --userId 'FonGGZb4' \
    > test.out 2>&1
eval_tap $? 17 'AdminUnlockAchievement' test.out

#- 18 AdminAnonymizeUserAchievement
./ng net.accelbyte.sdk.cli.Main achievement adminAnonymizeUserAchievement \
    --namespace "$AB_NAMESPACE" \
    --userId 'Eq1SMrU5' \
    > test.out 2>&1
eval_tap $? 18 'AdminAnonymizeUserAchievement' test.out

#- 19 AdminListUserContributions
./ng net.accelbyte.sdk.cli.Main achievement adminListUserContributions \
    --namespace "$AB_NAMESPACE" \
    --userId '56jGKPPd' \
    --achievementCodes 'lGiCKxDo' \
    --limit '22' \
    --offset '89' \
    --sortBy 'contributedValue:asc' \
    --tags 'd11N9nt1,q31NgZeh,CpO06JBk' \
    > test.out 2>&1
eval_tap $? 19 'AdminListUserContributions' test.out

#- 20 PublicListAchievements
./ng net.accelbyte.sdk.cli.Main achievement publicListAchievements \
    --namespace "$AB_NAMESPACE" \
    --global  \
    --limit '11' \
    --offset '87' \
    --sortBy 'createdAt:asc' \
    --tags 'zhqshnH1,8avPENCr,OVc6Ota3' \
    --language 'wMRlFSsN' \
    > test.out 2>&1
eval_tap $? 20 'PublicListAchievements' test.out

#- 21 PublicGetAchievement
./ng net.accelbyte.sdk.cli.Main achievement publicGetAchievement \
    --achievementCode 'VcTA1Ido' \
    --namespace "$AB_NAMESPACE" \
    --language 'g1tyXBQr' \
    > test.out 2>&1
eval_tap $? 21 'PublicGetAchievement' test.out

#- 22 PublicListGlobalAchievements
./ng net.accelbyte.sdk.cli.Main achievement publicListGlobalAchievements \
    --namespace "$AB_NAMESPACE" \
    --achievementCodes 'vjkGRdeU' \
    --limit '10' \
    --offset '60' \
    --sortBy 'createdAt:asc' \
    --status 'XsmsuViE' \
    --tags 'QBQ7KGft,H1W4EPOu,ti0XtiGS' \
    > test.out 2>&1
eval_tap $? 22 'PublicListGlobalAchievements' test.out

#- 23 ListGlobalAchievementContributors
./ng net.accelbyte.sdk.cli.Main achievement listGlobalAchievementContributors \
    --achievementCode 'wJ57tX7O' \
    --namespace "$AB_NAMESPACE" \
    --limit '93' \
    --offset '73' \
    --sortBy 'contributedValue' \
    > test.out 2>&1
eval_tap $? 23 'ListGlobalAchievementContributors' test.out

#- 24 PublicListTags
./ng net.accelbyte.sdk.cli.Main achievement publicListTags \
    --namespace "$AB_NAMESPACE" \
    --limit '25' \
    --name 'x2CHFds8' \
    --offset '64' \
    --sortBy 'name:asc' \
    > test.out 2>&1
eval_tap $? 24 'PublicListTags' test.out

#- 25 PublicListUserAchievements
./ng net.accelbyte.sdk.cli.Main achievement publicListUserAchievements \
    --namespace "$AB_NAMESPACE" \
    --userId 'JBJF1dni' \
    --limit '40' \
    --offset '69' \
    --preferUnlocked  \
    --sortBy 'achievedAt:desc' \
    --tags 'J9tPjQgO,7NPhpNdc,mYuQ8CVS' \
    > test.out 2>&1
eval_tap $? 25 'PublicListUserAchievements' test.out

#- 26 PublicUnlockAchievement
./ng net.accelbyte.sdk.cli.Main achievement publicUnlockAchievement \
    --achievementCode 'shxdbk0t' \
    --namespace "$AB_NAMESPACE" \
    --userId 'ED5KdO68' \
    > test.out 2>&1
eval_tap $? 26 'PublicUnlockAchievement' test.out

#- 27 ListUserContributions
./ng net.accelbyte.sdk.cli.Main achievement listUserContributions \
    --namespace "$AB_NAMESPACE" \
    --userId 'HXOmPJBc' \
    --achievementCodes 'ovLD9HXD' \
    --limit '24' \
    --offset '32' \
    --sortBy 'contributedValue:desc' \
    --tags '51y5zgEy,dV1SjctW,sfTKELqj' \
    > test.out 2>&1
eval_tap $? 27 'ListUserContributions' test.out

#- 28 ClaimGlobalAchievementReward
./ng net.accelbyte.sdk.cli.Main achievement claimGlobalAchievementReward \
    --achievementCode 'yvRnPrNj' \
    --namespace "$AB_NAMESPACE" \
    --userId 'MEPfAanj' \
    > test.out 2>&1
eval_tap $? 28 'ClaimGlobalAchievementReward' test.out


rm -f "tmp.dat"

exit $EXIT_CODE