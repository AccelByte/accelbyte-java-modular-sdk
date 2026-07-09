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
echo "1..161"

#- 1 Login
./ng net.accelbyte.sdk.cli.Main loginClient \
    > test.out 2>&1
eval_tap $? 1 'Login' test.out

if [ $EXIT_CODE -ne 0 ]; then
  echo "Bail out! Login failed."
  exit $EXIT_CODE
fi

touch "tmp.dat"

#- 2 SingleAdminGetChannel
./ng net.accelbyte.sdk.cli.Main ugc singleAdminGetChannel \
    --namespace "$AB_NAMESPACE" \
    --limit '31' \
    --offset '54' \
    > test.out 2>&1
eval_tap $? 2 'SingleAdminGetChannel' test.out

#- 3 AdminCreateChannel
./ng net.accelbyte.sdk.cli.Main ugc adminCreateChannel \
    --namespace "$AB_NAMESPACE" \
    --body '{"id": "wYZ50xcz", "name": "9QgXqQKS"}' \
    > test.out 2>&1
eval_tap $? 3 'AdminCreateChannel' test.out

#- 4 SingleAdminUpdateChannel
./ng net.accelbyte.sdk.cli.Main ugc singleAdminUpdateChannel \
    --channelId '8gCklyL2' \
    --namespace "$AB_NAMESPACE" \
    --body '{"name": "sCZqGil2"}' \
    > test.out 2>&1
eval_tap $? 4 'SingleAdminUpdateChannel' test.out

#- 5 SingleAdminDeleteChannel
./ng net.accelbyte.sdk.cli.Main ugc singleAdminDeleteChannel \
    --channelId 'jGRcjcoT' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 5 'SingleAdminDeleteChannel' test.out

#- 6 AdminUploadContentDirect
eval_tap 0 6 'AdminUploadContentDirect # SKIP deprecated' test.out

#- 7 AdminUploadContentS3
./ng net.accelbyte.sdk.cli.Main ugc adminUploadContentS3 \
    --channelId 'Kd6X3WOV' \
    --namespace "$AB_NAMESPACE" \
    --body '{"contentType": "pIJWWEId", "customAttributes": {"8x2TY1hx": {}, "1byO46Cf": {}, "7n9tprz6": {}}, "fileExtension": "9jTU9dRl", "name": "7hbV0OcH", "preview": "v9i9YUng", "previewMetadata": {"previewContentType": "TIquNZxG", "previewFileExtension": "BIVHEtW1"}, "shareCode": "sgPlkPXv", "subType": "eZw7pWVj", "tags": ["r46x63s4", "29ZM0zD2", "asFrq9S2"], "type": "2zjIDyQ5"}' \
    > test.out 2>&1
eval_tap $? 7 'AdminUploadContentS3' test.out

#- 8 SingleAdminUpdateContentS3
./ng net.accelbyte.sdk.cli.Main ugc singleAdminUpdateContentS3 \
    --channelId 'lVlRb6x3' \
    --contentId 'WtgRumet' \
    --namespace "$AB_NAMESPACE" \
    --body '{"contentType": "3AI1YdCW", "customAttributes": {"JSUsULsa": {}, "j5LoLwdF": {}, "ncGF4SMD": {}}, "fileExtension": "PSaMVwnH", "name": "zPwZq1P8", "payload": "3WiUiUAQ", "preview": "lxLVSX1n", "previewMetadata": {"previewContentType": "lpKs3OJ4", "previewFileExtension": "Qwg2wAU0"}, "shareCode": "TcSfWRdN", "subType": "9hUsmWDv", "tags": ["pXUyhZCy", "xMilDYpb", "gmLHsU7l"], "type": "uwRhb97a", "updateContentFile": false}' \
    > test.out 2>&1
eval_tap $? 8 'SingleAdminUpdateContentS3' test.out

#- 9 AdminSearchChannelSpecificContent
./ng net.accelbyte.sdk.cli.Main ugc adminSearchChannelSpecificContent \
    --channelId 'k4b4YBMY' \
    --namespace "$AB_NAMESPACE" \
    --creator 'P38jjYKU' \
    --ishidden 't6E6IaLX' \
    --isofficial 'JXlRCgmz' \
    --limit '52' \
    --name 'ius8kd2Y' \
    --offset '50' \
    --orderby '8sVfbZhf' \
    --sortby '5WKkmL1W' \
    --subtype 'FDFLhxGu' \
    --tags 'sFAIQYvo,EAVibceG,PXHrHEkk' \
    --type 'An3zD7dw' \
    --userId 'lyoKPnB8' \
    > test.out 2>&1
eval_tap $? 9 'AdminSearchChannelSpecificContent' test.out

#- 10 SingleAdminUpdateContentDirect
eval_tap 0 10 'SingleAdminUpdateContentDirect # SKIP deprecated' test.out

#- 11 SingleAdminDeleteContent
./ng net.accelbyte.sdk.cli.Main ugc singleAdminDeleteContent \
    --channelId '0BJjlTlK' \
    --contentId 'QUAfW9PE' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 11 'SingleAdminDeleteContent' test.out

#- 12 SingleAdminGetContent
./ng net.accelbyte.sdk.cli.Main ugc singleAdminGetContent \
    --namespace "$AB_NAMESPACE" \
    --limit '14' \
    --offset '69' \
    > test.out 2>&1
eval_tap $? 12 'SingleAdminGetContent' test.out

#- 13 AdminGetContentBulk
./ng net.accelbyte.sdk.cli.Main ugc adminGetContentBulk \
    --namespace "$AB_NAMESPACE" \
    --body '{"contentIds": ["qu24ZXyN", "dlZha2uD", "qNwebRMP"]}' \
    > test.out 2>&1
eval_tap $? 13 'AdminGetContentBulk' test.out

#- 14 AdminSearchContent
./ng net.accelbyte.sdk.cli.Main ugc adminSearchContent \
    --namespace "$AB_NAMESPACE" \
    --creator 'jXduG17I' \
    --ishidden '6f3hFdRA' \
    --isofficial 'YnRBZmm5' \
    --limit '63' \
    --name 'qm6lgZXk' \
    --offset '77' \
    --orderby 'FTqNJdmn' \
    --sortby 'GftXP7aE' \
    --subtype 'BivyU0sg' \
    --tags 'F0GnPenb,jj5q0n8e,1Knt2z2X' \
    --type 'UEzSjLyN' \
    --userId '9y0OqvRL' \
    > test.out 2>&1
eval_tap $? 14 'AdminSearchContent' test.out

#- 15 AdminGetContentBulkByShareCodes
./ng net.accelbyte.sdk.cli.Main ugc adminGetContentBulkByShareCodes \
    --namespace "$AB_NAMESPACE" \
    --body '{"shareCodes": ["ROtnN6fV", "MV6Ed9M0", "x5Ml4k8M"]}' \
    > test.out 2>&1
eval_tap $? 15 'AdminGetContentBulkByShareCodes' test.out

#- 16 AdminGetUserContentByShareCode
./ng net.accelbyte.sdk.cli.Main ugc adminGetUserContentByShareCode \
    --namespace "$AB_NAMESPACE" \
    --shareCode '6HcLaQBg' \
    > test.out 2>&1
eval_tap $? 16 'AdminGetUserContentByShareCode' test.out

#- 17 AdminGetSpecificContent
./ng net.accelbyte.sdk.cli.Main ugc adminGetSpecificContent \
    --contentId 'TSiVjb19' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 17 'AdminGetSpecificContent' test.out

#- 18 AdminDownloadContentPreview
./ng net.accelbyte.sdk.cli.Main ugc adminDownloadContentPreview \
    --contentId 'fh12grF2' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 18 'AdminDownloadContentPreview' test.out

#- 19 RollbackContentVersion
./ng net.accelbyte.sdk.cli.Main ugc rollbackContentVersion \
    --contentId 'nInjvwV3' \
    --namespace "$AB_NAMESPACE" \
    --versionId 'Z1utubud' \
    > test.out 2>&1
eval_tap $? 19 'RollbackContentVersion' test.out

#- 20 AdminUpdateScreenshots
./ng net.accelbyte.sdk.cli.Main ugc adminUpdateScreenshots \
    --contentId 'pXe4EF6E' \
    --namespace "$AB_NAMESPACE" \
    --body '{"screenshots": [{"description": "MIddrdmU", "screenshotId": "TTR4V9Y5"}, {"description": "1mgae2ma", "screenshotId": "wLHD4DMV"}, {"description": "wXL9eNgB", "screenshotId": "tD9lIAhp"}]}' \
    > test.out 2>&1
eval_tap $? 20 'AdminUpdateScreenshots' test.out

#- 21 AdminUploadContentScreenshot
./ng net.accelbyte.sdk.cli.Main ugc adminUploadContentScreenshot \
    --contentId 'iDtosnei' \
    --namespace "$AB_NAMESPACE" \
    --body '{"screenshots": [{"contentType": "4mgyFOyX", "description": "wJIEcM2B", "fileExtension": "pjp"}, {"contentType": "Bt4z7kd6", "description": "HriMnttf", "fileExtension": "png"}, {"contentType": "KHcBekSK", "description": "99VH4auN", "fileExtension": "pjp"}]}' \
    > test.out 2>&1
eval_tap $? 21 'AdminUploadContentScreenshot' test.out

#- 22 AdminDeleteContentScreenshot
./ng net.accelbyte.sdk.cli.Main ugc adminDeleteContentScreenshot \
    --contentId 'egDkmBIt' \
    --namespace "$AB_NAMESPACE" \
    --screenshotId '728FEe7r' \
    > test.out 2>&1
eval_tap $? 22 'AdminDeleteContentScreenshot' test.out

#- 23 ListContentVersions
./ng net.accelbyte.sdk.cli.Main ugc listContentVersions \
    --contentId 'e138ac0J' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 23 'ListContentVersions' test.out

#- 24 SingleAdminGetAllGroups
./ng net.accelbyte.sdk.cli.Main ugc singleAdminGetAllGroups \
    --namespace "$AB_NAMESPACE" \
    --limit '76' \
    --offset '88' \
    > test.out 2>&1
eval_tap $? 24 'SingleAdminGetAllGroups' test.out

#- 25 AdminCreateGroup
./ng net.accelbyte.sdk.cli.Main ugc adminCreateGroup \
    --namespace "$AB_NAMESPACE" \
    --body '{"contents": ["yEjrbEhN", "wm3a1FAv", "LzztcHBs"], "name": "gVLoHBWn"}' \
    > test.out 2>&1
eval_tap $? 25 'AdminCreateGroup' test.out

#- 26 SingleAdminGetGroup
./ng net.accelbyte.sdk.cli.Main ugc singleAdminGetGroup \
    --groupId '5THLxjem' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 26 'SingleAdminGetGroup' test.out

#- 27 SingleAdminUpdateGroup
./ng net.accelbyte.sdk.cli.Main ugc singleAdminUpdateGroup \
    --groupId 'pMSZvtFj' \
    --namespace "$AB_NAMESPACE" \
    --body '{"contents": ["HsF93wfg", "0lrKBlOx", "UgXJO5BM"], "name": "aIjuuuTj"}' \
    > test.out 2>&1
eval_tap $? 27 'SingleAdminUpdateGroup' test.out

#- 28 SingleAdminDeleteGroup
./ng net.accelbyte.sdk.cli.Main ugc singleAdminDeleteGroup \
    --groupId '68H7mNYj' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 28 'SingleAdminDeleteGroup' test.out

#- 29 SingleAdminGetGroupContents
./ng net.accelbyte.sdk.cli.Main ugc singleAdminGetGroupContents \
    --groupId 'hGaBXWva' \
    --namespace "$AB_NAMESPACE" \
    --limit '78' \
    --offset '100' \
    > test.out 2>&1
eval_tap $? 29 'SingleAdminGetGroupContents' test.out

#- 30 AdminGetTag
./ng net.accelbyte.sdk.cli.Main ugc adminGetTag \
    --namespace "$AB_NAMESPACE" \
    --limit '58' \
    --offset '58' \
    > test.out 2>&1
eval_tap $? 30 'AdminGetTag' test.out

#- 31 AdminCreateTag
./ng net.accelbyte.sdk.cli.Main ugc adminCreateTag \
    --namespace "$AB_NAMESPACE" \
    --body '{"tag": "C80HpF24"}' \
    > test.out 2>&1
eval_tap $? 31 'AdminCreateTag' test.out

#- 32 AdminUpdateTag
./ng net.accelbyte.sdk.cli.Main ugc adminUpdateTag \
    --namespace "$AB_NAMESPACE" \
    --tagId 'GeLNZbFc' \
    --body '{"tag": "yKqgnVtj"}' \
    > test.out 2>&1
eval_tap $? 32 'AdminUpdateTag' test.out

#- 33 AdminDeleteTag
./ng net.accelbyte.sdk.cli.Main ugc adminDeleteTag \
    --namespace "$AB_NAMESPACE" \
    --tagId 'Z6Wurz0S' \
    > test.out 2>&1
eval_tap $? 33 'AdminDeleteTag' test.out

#- 34 AdminGetType
./ng net.accelbyte.sdk.cli.Main ugc adminGetType \
    --namespace "$AB_NAMESPACE" \
    --limit '30' \
    --offset '51' \
    > test.out 2>&1
eval_tap $? 34 'AdminGetType' test.out

#- 35 AdminCreateType
./ng net.accelbyte.sdk.cli.Main ugc adminCreateType \
    --namespace "$AB_NAMESPACE" \
    --body '{"subtype": ["xJaygDCX", "TifDhlGh", "5qzqS8OO"], "type": "YoHealP0"}' \
    > test.out 2>&1
eval_tap $? 35 'AdminCreateType' test.out

#- 36 AdminUpdateType
./ng net.accelbyte.sdk.cli.Main ugc adminUpdateType \
    --namespace "$AB_NAMESPACE" \
    --typeId 'heMI32Di' \
    --body '{"subtype": ["aVcs6epg", "z5znCNh5", "AFO8Jgm5"], "type": "iqseEKFy"}' \
    > test.out 2>&1
eval_tap $? 36 'AdminUpdateType' test.out

#- 37 AdminDeleteType
./ng net.accelbyte.sdk.cli.Main ugc adminDeleteType \
    --namespace "$AB_NAMESPACE" \
    --typeId '4HU97tft' \
    > test.out 2>&1
eval_tap $? 37 'AdminDeleteType' test.out

#- 38 AdminGetChannel
./ng net.accelbyte.sdk.cli.Main ugc adminGetChannel \
    --namespace "$AB_NAMESPACE" \
    --userId 'c22WP4xs' \
    --limit '63' \
    --name 'VuTRDKjC' \
    --offset '74' \
    > test.out 2>&1
eval_tap $? 38 'AdminGetChannel' test.out

#- 39 AdminDeleteAllUserChannels
./ng net.accelbyte.sdk.cli.Main ugc adminDeleteAllUserChannels \
    --namespace "$AB_NAMESPACE" \
    --userId 'z5xN04Oh' \
    > test.out 2>&1
eval_tap $? 39 'AdminDeleteAllUserChannels' test.out

#- 40 AdminUpdateChannel
./ng net.accelbyte.sdk.cli.Main ugc adminUpdateChannel \
    --channelId '3nOCFATv' \
    --namespace "$AB_NAMESPACE" \
    --userId 'vlWraHaW' \
    --body '{"name": "xG5aeAI6"}' \
    > test.out 2>&1
eval_tap $? 40 'AdminUpdateChannel' test.out

#- 41 AdminDeleteChannel
./ng net.accelbyte.sdk.cli.Main ugc adminDeleteChannel \
    --channelId 'O4G8TMvw' \
    --namespace "$AB_NAMESPACE" \
    --userId 'MXQJWjh1' \
    > test.out 2>&1
eval_tap $? 41 'AdminDeleteChannel' test.out

#- 42 AdminUpdateContentS3ByShareCode
./ng net.accelbyte.sdk.cli.Main ugc adminUpdateContentS3ByShareCode \
    --channelId 'jx9syf4U' \
    --namespace "$AB_NAMESPACE" \
    --shareCode 'lfePv3Fk' \
    --userId 'oiF4uavF' \
    --body '{"contentType": "pyBEc5BM", "customAttributes": {"6vLaDpWl": {}, "X6LRjZ0b": {}, "MxfnnAGP": {}}, "fileExtension": "GCkdkfhJ", "name": "2snQlhC5", "payload": "mCLc7jBC", "preview": "H5wH6tGw", "previewMetadata": {"previewContentType": "IqmDQkAN", "previewFileExtension": "B0tnrLmz"}, "shareCode": "p5vM4a1a", "subType": "EdjKPqdf", "tags": ["KjA6ZyqW", "FuAiZxRN", "fkP1K2nO"], "type": "IPuF2ogq", "updateContentFile": false}' \
    > test.out 2>&1
eval_tap $? 42 'AdminUpdateContentS3ByShareCode' test.out

#- 43 AdminUpdateContentS3
./ng net.accelbyte.sdk.cli.Main ugc adminUpdateContentS3 \
    --channelId 'cFb0eClM' \
    --contentId 'LahNQU15' \
    --namespace "$AB_NAMESPACE" \
    --userId 'TZh1fliU' \
    --body '{"contentType": "dex5ehXO", "customAttributes": {"ibcZ0vbX": {}, "3ImFUlUd": {}, "SLxISwD0": {}}, "fileExtension": "BhYeEkNW", "name": "8QKkMZRY", "payload": "B4Akvdjr", "preview": "4HCNnzPX", "previewMetadata": {"previewContentType": "ufuaiHgp", "previewFileExtension": "PohEevfB"}, "shareCode": "08HVWnKl", "subType": "B6wWmbRr", "tags": ["nT5O7r2L", "Yr5d3d7E", "t1VzN17a"], "type": "pF3Ruzjb", "updateContentFile": false}' \
    > test.out 2>&1
eval_tap $? 43 'AdminUpdateContentS3' test.out

#- 44 DeleteContentByShareCode
./ng net.accelbyte.sdk.cli.Main ugc deleteContentByShareCode \
    --channelId 'EQ8xf5Hb' \
    --namespace "$AB_NAMESPACE" \
    --shareCode 'h5oaoTy4' \
    --userId '5yyNnYzj' \
    > test.out 2>&1
eval_tap $? 44 'DeleteContentByShareCode' test.out

#- 45 AdminUpdateContentDirect
eval_tap 0 45 'AdminUpdateContentDirect # SKIP deprecated' test.out

#- 46 AdminDeleteContent
./ng net.accelbyte.sdk.cli.Main ugc adminDeleteContent \
    --channelId 'YMouTgpO' \
    --contentId 'kXK9wprh' \
    --namespace "$AB_NAMESPACE" \
    --userId '2ja8AOu5' \
    > test.out 2>&1
eval_tap $? 46 'AdminDeleteContent' test.out

#- 47 AdminGetContent
./ng net.accelbyte.sdk.cli.Main ugc adminGetContent \
    --namespace "$AB_NAMESPACE" \
    --userId 'O8vTHYib' \
    --limit '79' \
    --offset '46' \
    > test.out 2>&1
eval_tap $? 47 'AdminGetContent' test.out

#- 48 AdminDeleteAllUserContents
./ng net.accelbyte.sdk.cli.Main ugc adminDeleteAllUserContents \
    --namespace "$AB_NAMESPACE" \
    --userId 'htc2Qzd3' \
    > test.out 2>&1
eval_tap $? 48 'AdminDeleteAllUserContents' test.out

#- 49 AdminHideUserContent
./ng net.accelbyte.sdk.cli.Main ugc adminHideUserContent \
    --contentId 'JVaLUbo1' \
    --namespace "$AB_NAMESPACE" \
    --userId 'esA7TyHI' \
    --body '{"isHidden": false}' \
    > test.out 2>&1
eval_tap $? 49 'AdminHideUserContent' test.out

#- 50 AdminGetAllGroups
./ng net.accelbyte.sdk.cli.Main ugc adminGetAllGroups \
    --namespace "$AB_NAMESPACE" \
    --userId 'uENhtIZe' \
    --limit '76' \
    --offset '78' \
    > test.out 2>&1
eval_tap $? 50 'AdminGetAllGroups' test.out

#- 51 AdminDeleteAllUserGroup
./ng net.accelbyte.sdk.cli.Main ugc adminDeleteAllUserGroup \
    --namespace "$AB_NAMESPACE" \
    --userId 'h1FgXGRM' \
    > test.out 2>&1
eval_tap $? 51 'AdminDeleteAllUserGroup' test.out

#- 52 AdminGetGroup
./ng net.accelbyte.sdk.cli.Main ugc adminGetGroup \
    --groupId 'onRvtiTF' \
    --namespace "$AB_NAMESPACE" \
    --userId 'xPkjo4QD' \
    > test.out 2>&1
eval_tap $? 52 'AdminGetGroup' test.out

#- 53 AdminUpdateGroup
./ng net.accelbyte.sdk.cli.Main ugc adminUpdateGroup \
    --groupId 'j5meXcAd' \
    --namespace "$AB_NAMESPACE" \
    --userId '9GDPFBYv' \
    --body '{"contents": ["opwnZp1P", "gHsRZ9EE", "7Nxj33MT"], "name": "wFs2A49G"}' \
    > test.out 2>&1
eval_tap $? 53 'AdminUpdateGroup' test.out

#- 54 AdminDeleteGroup
./ng net.accelbyte.sdk.cli.Main ugc adminDeleteGroup \
    --groupId 'wtAuMAvO' \
    --namespace "$AB_NAMESPACE" \
    --userId 'woGEwvfo' \
    > test.out 2>&1
eval_tap $? 54 'AdminDeleteGroup' test.out

#- 55 AdminGetGroupContents
./ng net.accelbyte.sdk.cli.Main ugc adminGetGroupContents \
    --groupId 'NbR9CDzE' \
    --namespace "$AB_NAMESPACE" \
    --userId 'dBHsyoWz' \
    --limit '20' \
    --offset '34' \
    > test.out 2>&1
eval_tap $? 55 'AdminGetGroupContents' test.out

#- 56 AdminDeleteAllUserStates
./ng net.accelbyte.sdk.cli.Main ugc adminDeleteAllUserStates \
    --namespace "$AB_NAMESPACE" \
    --userId '5FJpr28D' \
    > test.out 2>&1
eval_tap $? 56 'AdminDeleteAllUserStates' test.out

#- 57 SearchChannelSpecificContent
./ng net.accelbyte.sdk.cli.Main ugc searchChannelSpecificContent \
    --channelId 'aOlSX6Co' \
    --namespace "$AB_NAMESPACE" \
    --creator 'd0wTNxeM' \
    --ishidden 'J7giMkVj' \
    --isofficial 'Zhw6YHKa' \
    --limit '15' \
    --name 'POYlZnBl' \
    --offset '24' \
    --orderby '2Gi3j6C0' \
    --sortby 'DvMlsGng' \
    --subtype 'eGp3ZmbY' \
    --tags 'ueadz6Ys,AqLi4pGY,ZFFbdgEP' \
    --type 'wGo8oNSU' \
    --userId 'NwxWnwl1' \
    > test.out 2>&1
eval_tap $? 57 'SearchChannelSpecificContent' test.out

#- 58 PublicSearchContent
./ng net.accelbyte.sdk.cli.Main ugc publicSearchContent \
    --namespace "$AB_NAMESPACE" \
    --creator 'xLBDpweO' \
    --ishidden 'abzC5o4b' \
    --isofficial 'tdKZ5VB6' \
    --limit '84' \
    --name 'WTouItLS' \
    --offset '25' \
    --orderby 'zbpjZMEm' \
    --sortby 'CGo46e0i' \
    --subtype '2q7CxqXD' \
    --tags 'roghtKEp,4YBlI0Wd,r7XTBIvI' \
    --type 'm7OUSE2J' \
    --userId 'm2ezyzjX' \
    > test.out 2>&1
eval_tap $? 58 'PublicSearchContent' test.out

#- 59 PublicGetContentBulk
./ng net.accelbyte.sdk.cli.Main ugc publicGetContentBulk \
    --namespace "$AB_NAMESPACE" \
    --body '{"contentIds": ["jbTrxiYL", "wwlvab9H", "v0Rw3G1g"]}' \
    > test.out 2>&1
eval_tap $? 59 'PublicGetContentBulk' test.out

#- 60 GetFollowedContent
./ng net.accelbyte.sdk.cli.Main ugc getFollowedContent \
    --namespace "$AB_NAMESPACE" \
    --limit '99' \
    --offset '74' \
    > test.out 2>&1
eval_tap $? 60 'GetFollowedContent' test.out

#- 61 GetLikedContent
./ng net.accelbyte.sdk.cli.Main ugc getLikedContent \
    --namespace "$AB_NAMESPACE" \
    --isofficial  \
    --limit '24' \
    --name 'RG5tAFyJ' \
    --offset '0' \
    --orderby 'aW8YuZiH' \
    --sortby 'ZbN7a94k' \
    --subtype 'SYSrSBYf' \
    --tags 'a5G7YXB6,DUxhwB7z,p8CUO5SE' \
    --type 'FOGD9uQr' \
    > test.out 2>&1
eval_tap $? 61 'GetLikedContent' test.out

#- 62 PublicGetContentBulkByShareCodes
./ng net.accelbyte.sdk.cli.Main ugc publicGetContentBulkByShareCodes \
    --namespace "$AB_NAMESPACE" \
    --body '{"shareCodes": ["J7LgirVN", "xvrRUTb4", "tsSyNIHI"]}' \
    > test.out 2>&1
eval_tap $? 62 'PublicGetContentBulkByShareCodes' test.out

#- 63 PublicDownloadContentByShareCode
./ng net.accelbyte.sdk.cli.Main ugc publicDownloadContentByShareCode \
    --namespace "$AB_NAMESPACE" \
    --shareCode 'i4LJJB2f' \
    > test.out 2>&1
eval_tap $? 63 'PublicDownloadContentByShareCode' test.out

#- 64 PublicDownloadContentByContentID
./ng net.accelbyte.sdk.cli.Main ugc publicDownloadContentByContentID \
    --contentId 'zMLCgNr5' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 64 'PublicDownloadContentByContentID' test.out

#- 65 AddDownloadCount
./ng net.accelbyte.sdk.cli.Main ugc addDownloadCount \
    --contentId 'V0L3xZVs' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 65 'AddDownloadCount' test.out

#- 66 UpdateContentLikeStatus
./ng net.accelbyte.sdk.cli.Main ugc updateContentLikeStatus \
    --contentId '1T52aePu' \
    --namespace "$AB_NAMESPACE" \
    --body '{"likeStatus": true}' \
    > test.out 2>&1
eval_tap $? 66 'UpdateContentLikeStatus' test.out

#- 67 PublicDownloadContentPreview
./ng net.accelbyte.sdk.cli.Main ugc publicDownloadContentPreview \
    --contentId 'hBsvnfQz' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 67 'PublicDownloadContentPreview' test.out

#- 68 GetTag
./ng net.accelbyte.sdk.cli.Main ugc getTag \
    --namespace "$AB_NAMESPACE" \
    --limit '53' \
    --offset '68' \
    > test.out 2>&1
eval_tap $? 68 'GetTag' test.out

#- 69 GetType
./ng net.accelbyte.sdk.cli.Main ugc getType \
    --namespace "$AB_NAMESPACE" \
    --limit '68' \
    --offset '4' \
    > test.out 2>&1
eval_tap $? 69 'GetType' test.out

#- 70 PublicSearchCreator
./ng net.accelbyte.sdk.cli.Main ugc publicSearchCreator \
    --namespace "$AB_NAMESPACE" \
    --limit '72' \
    --offset '98' \
    --orderby 'NjFGW1RO' \
    --sortby '8gCR17t8' \
    > test.out 2>&1
eval_tap $? 70 'PublicSearchCreator' test.out

#- 71 GetFollowedUsers
./ng net.accelbyte.sdk.cli.Main ugc getFollowedUsers \
    --namespace "$AB_NAMESPACE" \
    --limit '66' \
    --offset '36' \
    > test.out 2>&1
eval_tap $? 71 'GetFollowedUsers' test.out

#- 72 PublicGetCreator
./ng net.accelbyte.sdk.cli.Main ugc publicGetCreator \
    --namespace "$AB_NAMESPACE" \
    --userId 'NuvXqP2q' \
    > test.out 2>&1
eval_tap $? 72 'PublicGetCreator' test.out

#- 73 GetChannels
./ng net.accelbyte.sdk.cli.Main ugc getChannels \
    --namespace "$AB_NAMESPACE" \
    --userId 'CC9tOrLS' \
    --limit '15' \
    --name 'wyFmGxgZ' \
    --offset '42' \
    > test.out 2>&1
eval_tap $? 73 'GetChannels' test.out

#- 74 PublicCreateChannel
./ng net.accelbyte.sdk.cli.Main ugc publicCreateChannel \
    --namespace "$AB_NAMESPACE" \
    --userId 'iQvRKI2O' \
    --body '{"name": "rtKSTQow"}' \
    > test.out 2>&1
eval_tap $? 74 'PublicCreateChannel' test.out

#- 75 DeleteAllUserChannel
./ng net.accelbyte.sdk.cli.Main ugc deleteAllUserChannel \
    --namespace "$AB_NAMESPACE" \
    --userId 'MhhxS7tr' \
    > test.out 2>&1
eval_tap $? 75 'DeleteAllUserChannel' test.out

#- 76 UpdateChannel
./ng net.accelbyte.sdk.cli.Main ugc updateChannel \
    --channelId 'rOmp7Z1K' \
    --namespace "$AB_NAMESPACE" \
    --userId 'v7HXmxnQ' \
    --body '{"name": "TDouMt3w"}' \
    > test.out 2>&1
eval_tap $? 76 'UpdateChannel' test.out

#- 77 DeleteChannel
./ng net.accelbyte.sdk.cli.Main ugc deleteChannel \
    --channelId 'WELQuhRu' \
    --namespace "$AB_NAMESPACE" \
    --userId 'YewS5URT' \
    > test.out 2>&1
eval_tap $? 77 'DeleteChannel' test.out

#- 78 CreateContentDirect
eval_tap 0 78 'CreateContentDirect # SKIP deprecated' test.out

#- 79 CreateContentS3
./ng net.accelbyte.sdk.cli.Main ugc createContentS3 \
    --channelId 'x655sLCK' \
    --namespace "$AB_NAMESPACE" \
    --userId 'fPwwa2Ok' \
    --body '{"contentType": "6rXzKcU2", "customAttributes": {"BYFbHTVF": {}, "fNHa6wLS": {}, "Y1ttrzmz": {}}, "fileExtension": "IlvooNMt", "name": "lIYFOaJH", "preview": "pj4IDI5s", "previewMetadata": {"previewContentType": "Voy24LwX", "previewFileExtension": "W6MXDVKY"}, "subType": "zlkJMlkH", "tags": ["lo9Ljmj4", "rGaj7nAW", "kAS6Tdre"], "type": "ihSsG4WG"}' \
    > test.out 2>&1
eval_tap $? 79 'CreateContentS3' test.out

#- 80 PublicUpdateContentByShareCode
./ng net.accelbyte.sdk.cli.Main ugc publicUpdateContentByShareCode \
    --channelId 'bR1Eh49g' \
    --namespace "$AB_NAMESPACE" \
    --shareCode 'u444YIS6' \
    --userId '8PmFjQIM' \
    --body '{"contentType": "8HYUZIj4", "customAttributes": {"oqLDXzTC": {}, "Pk7HqKEo": {}, "vWlqbJgf": {}}, "fileExtension": "OlsoHcsd", "name": "zRkT6DuA", "payload": "fzLPqkHA", "preview": "gqgDbP4L", "previewMetadata": {"previewContentType": "GGXaZL8A", "previewFileExtension": "eFS6o8u0"}, "subType": "n5GcpPLv", "tags": ["RBPPnxBE", "NO1t0b85", "8kVzQ92L"], "type": "5LEZ3Z1n", "updateContentFile": true}' \
    > test.out 2>&1
eval_tap $? 80 'PublicUpdateContentByShareCode' test.out

#- 81 UpdateContentS3
./ng net.accelbyte.sdk.cli.Main ugc updateContentS3 \
    --channelId 'VOaqJyka' \
    --contentId 'nucRFs9j' \
    --namespace "$AB_NAMESPACE" \
    --userId 'j4JtxZfE' \
    --body '{"contentType": "xqcPgAsP", "customAttributes": {"3nnqqCx0": {}, "O50kKKAm": {}, "NrDbOfqE": {}}, "fileExtension": "2bG3S3eN", "name": "KQqKp6dl", "payload": "mGic97jU", "preview": "GxVyLv28", "previewMetadata": {"previewContentType": "ldwczimA", "previewFileExtension": "rNtinpbR"}, "subType": "n9zqeh0N", "tags": ["607QtuyI", "WsZYZNd3", "M5XPUsk4"], "type": "IgZsP15Z", "updateContentFile": true}' \
    > test.out 2>&1
eval_tap $? 81 'UpdateContentS3' test.out

#- 82 PublicDeleteContentByShareCode
./ng net.accelbyte.sdk.cli.Main ugc publicDeleteContentByShareCode \
    --channelId 'v8gxZNL0' \
    --namespace "$AB_NAMESPACE" \
    --shareCode 'OicMRiyl' \
    --userId 'WTT54se1' \
    > test.out 2>&1
eval_tap $? 82 'PublicDeleteContentByShareCode' test.out

#- 83 UpdateContentDirect
eval_tap 0 83 'UpdateContentDirect # SKIP deprecated' test.out

#- 84 DeleteContent
./ng net.accelbyte.sdk.cli.Main ugc deleteContent \
    --channelId 'PDTK2FDp' \
    --contentId 'hJhHE7Yt' \
    --namespace "$AB_NAMESPACE" \
    --userId 'g0cJLuZh' \
    > test.out 2>&1
eval_tap $? 84 'DeleteContent' test.out

#- 85 UpdateContentShareCode
./ng net.accelbyte.sdk.cli.Main ugc updateContentShareCode \
    --channelId 'BLPqGYSY' \
    --contentId 'HCM4xAwy' \
    --namespace "$AB_NAMESPACE" \
    --userId 'AeeaFFSh' \
    --body '{"shareCode": "U211xDUa"}' \
    > test.out 2>&1
eval_tap $? 85 'UpdateContentShareCode' test.out

#- 86 PublicGetUserContent
./ng net.accelbyte.sdk.cli.Main ugc publicGetUserContent \
    --namespace "$AB_NAMESPACE" \
    --userId 'mFkO5iAw' \
    --limit '42' \
    --offset '98' \
    > test.out 2>&1
eval_tap $? 86 'PublicGetUserContent' test.out

#- 87 DeleteAllUserContents
./ng net.accelbyte.sdk.cli.Main ugc deleteAllUserContents \
    --namespace "$AB_NAMESPACE" \
    --userId 'KlClPxge' \
    > test.out 2>&1
eval_tap $? 87 'DeleteAllUserContents' test.out

#- 88 UpdateScreenshots
./ng net.accelbyte.sdk.cli.Main ugc updateScreenshots \
    --contentId 'BUTJZMD1' \
    --namespace "$AB_NAMESPACE" \
    --userId 'j76EPAW7' \
    --body '{"screenshots": [{"description": "Tg6Zu29h", "screenshotId": "Jx3BcUoe"}, {"description": "OWk7ZhnU", "screenshotId": "iZOalCoc"}, {"description": "FqP6rHnQ", "screenshotId": "DoEYKTSp"}]}' \
    > test.out 2>&1
eval_tap $? 88 'UpdateScreenshots' test.out

#- 89 UploadContentScreenshot
./ng net.accelbyte.sdk.cli.Main ugc uploadContentScreenshot \
    --contentId 'az9YBMAv' \
    --namespace "$AB_NAMESPACE" \
    --userId '5h6ilbYr' \
    --body '{"screenshots": [{"contentType": "80vfthNB", "description": "kVHSCzZm", "fileExtension": "jpeg"}, {"contentType": "CZLTYmq4", "description": "v8PXobEV", "fileExtension": "png"}, {"contentType": "gXM72bmj", "description": "EhH7iGzr", "fileExtension": "bmp"}]}' \
    > test.out 2>&1
eval_tap $? 89 'UploadContentScreenshot' test.out

#- 90 DeleteContentScreenshot
./ng net.accelbyte.sdk.cli.Main ugc deleteContentScreenshot \
    --contentId 'kuBN45hS' \
    --namespace "$AB_NAMESPACE" \
    --screenshotId 'zKlRqNwi' \
    --userId 'gQwUZuVf' \
    > test.out 2>&1
eval_tap $? 90 'DeleteContentScreenshot' test.out

#- 91 UpdateUserFollowStatus
./ng net.accelbyte.sdk.cli.Main ugc updateUserFollowStatus \
    --namespace "$AB_NAMESPACE" \
    --userId 'E6lJVF5L' \
    --body '{"followStatus": false}' \
    > test.out 2>&1
eval_tap $? 91 'UpdateUserFollowStatus' test.out

#- 92 GetPublicFollowers
./ng net.accelbyte.sdk.cli.Main ugc getPublicFollowers \
    --namespace "$AB_NAMESPACE" \
    --userId 'VLAe0kli' \
    --limit '61' \
    --offset '35' \
    > test.out 2>&1
eval_tap $? 92 'GetPublicFollowers' test.out

#- 93 GetPublicFollowing
./ng net.accelbyte.sdk.cli.Main ugc getPublicFollowing \
    --namespace "$AB_NAMESPACE" \
    --userId 'W2gdCGNd' \
    --limit '72' \
    --offset '50' \
    > test.out 2>&1
eval_tap $? 93 'GetPublicFollowing' test.out

#- 94 GetGroups
./ng net.accelbyte.sdk.cli.Main ugc getGroups \
    --namespace "$AB_NAMESPACE" \
    --userId 'uMYIhpSa' \
    --limit '91' \
    --offset '68' \
    > test.out 2>&1
eval_tap $? 94 'GetGroups' test.out

#- 95 CreateGroup
./ng net.accelbyte.sdk.cli.Main ugc createGroup \
    --namespace "$AB_NAMESPACE" \
    --userId 'IFCVAY7E' \
    --body '{"contents": ["gSc8IN6z", "NdZzb9GN", "ySpkk5Fu"], "name": "QYefVnFt"}' \
    > test.out 2>&1
eval_tap $? 95 'CreateGroup' test.out

#- 96 DeleteAllUserGroup
./ng net.accelbyte.sdk.cli.Main ugc deleteAllUserGroup \
    --namespace "$AB_NAMESPACE" \
    --userId 'VBThEq7J' \
    > test.out 2>&1
eval_tap $? 96 'DeleteAllUserGroup' test.out

#- 97 GetGroup
./ng net.accelbyte.sdk.cli.Main ugc getGroup \
    --groupId 'cq9gNOmA' \
    --namespace "$AB_NAMESPACE" \
    --userId 'irwzu5Fv' \
    > test.out 2>&1
eval_tap $? 97 'GetGroup' test.out

#- 98 UpdateGroup
./ng net.accelbyte.sdk.cli.Main ugc updateGroup \
    --groupId 'TeuXTpo0' \
    --namespace "$AB_NAMESPACE" \
    --userId 'YOPnO3Bb' \
    --body '{"contents": ["Xxsna8ag", "344KbfqC", "gXJbNGIM"], "name": "uTmXmKbA"}' \
    > test.out 2>&1
eval_tap $? 98 'UpdateGroup' test.out

#- 99 DeleteGroup
./ng net.accelbyte.sdk.cli.Main ugc deleteGroup \
    --groupId 'z4XP88Dr' \
    --namespace "$AB_NAMESPACE" \
    --userId 'UwnPkK7U' \
    > test.out 2>&1
eval_tap $? 99 'DeleteGroup' test.out

#- 100 GetGroupContent
./ng net.accelbyte.sdk.cli.Main ugc getGroupContent \
    --groupId 'lESL1q9b' \
    --namespace "$AB_NAMESPACE" \
    --userId 'nfYkkl0P' \
    --limit '68' \
    --offset '14' \
    > test.out 2>&1
eval_tap $? 100 'GetGroupContent' test.out

#- 101 DeleteAllUserStates
./ng net.accelbyte.sdk.cli.Main ugc deleteAllUserStates \
    --namespace "$AB_NAMESPACE" \
    --userId 'XItn6xbJ' \
    > test.out 2>&1
eval_tap $? 101 'DeleteAllUserStates' test.out

#- 102 AdminGetContentByChannelIDV2
./ng net.accelbyte.sdk.cli.Main ugc adminGetContentByChannelIDV2 \
    --channelId 'G33UnZjG' \
    --namespace "$AB_NAMESPACE" \
    --limit '73' \
    --name 'rfgiye3h' \
    --offset '37' \
    --sortBy 'h7Y4eD3y' \
    > test.out 2>&1
eval_tap $? 102 'AdminGetContentByChannelIDV2' test.out

#- 103 AdminCreateContentV2
./ng net.accelbyte.sdk.cli.Main ugc adminCreateContentV2 \
    --channelId 'RGK8d31J' \
    --namespace "$AB_NAMESPACE" \
    --body '{"contentType": "oCO4ECcP", "customAttributes": {"CeFQUdEJ": {}, "JP0WT2wu": {}, "NW6Osg7S": {}}, "fileExtension": "WFbweCzf", "name": "7A6aoqyy", "shareCode": "6sXe8XgT", "subType": "H89uXa7W", "tags": ["VxqBLC9C", "F9KU7jqq", "4qqQKVds"], "type": "mCZVlgo2"}' \
    > test.out 2>&1
eval_tap $? 103 'AdminCreateContentV2' test.out

#- 104 AdminDeleteOfficialContentV2
./ng net.accelbyte.sdk.cli.Main ugc adminDeleteOfficialContentV2 \
    --channelId 'FgBdCN70' \
    --contentId 'n7vm00tk' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 104 'AdminDeleteOfficialContentV2' test.out

#- 105 AdminUpdateOfficialContentV2
./ng net.accelbyte.sdk.cli.Main ugc adminUpdateOfficialContentV2 \
    --channelId 'Tdx37lI3' \
    --contentId 'FgxXY8aX' \
    --namespace "$AB_NAMESPACE" \
    --body '{"customAttributes": {"Ve0x1m4g": {}, "DkSyAp9l": {}, "036ug7Qj": {}}, "name": "1uw6YFvx", "shareCode": "Ed9basEQ", "subType": "DN84gE3l", "tags": ["K9HMzJuN", "5JEqQHRb", "hMv3rz8e"], "type": "jKq0K9Pi"}' \
    > test.out 2>&1
eval_tap $? 105 'AdminUpdateOfficialContentV2' test.out

#- 106 AdminCopyContent
./ng net.accelbyte.sdk.cli.Main ugc adminCopyContent \
    --channelId 'zDRClKTP' \
    --contentId 'WEQpMywv' \
    --namespace "$AB_NAMESPACE" \
    --body '{"customAttributes": {"uNQJqmXY": {}, "nE2VE264": {}, "RoBN5QC0": {}}, "name": "4gpcSihO", "subType": "QIwkRDDx", "tags": ["y3YxSdBl", "Xmzan6VF", "r11Xyfzx"], "targetChannelId": "C5RPsZGA", "type": "bdo4Tw1P"}' \
    > test.out 2>&1
eval_tap $? 106 'AdminCopyContent' test.out

#- 107 AdminUpdateOfficialContentFileLocation
./ng net.accelbyte.sdk.cli.Main ugc adminUpdateOfficialContentFileLocation \
    --channelId 'P6KRdKXx' \
    --contentId 'yYsmriGq' \
    --namespace "$AB_NAMESPACE" \
    --body '{"fileExtension": "b2z1k3U4", "fileLocation": "jsEKMhCQ"}' \
    > test.out 2>&1
eval_tap $? 107 'AdminUpdateOfficialContentFileLocation' test.out

#- 108 AdminGenerateOfficialContentUploadURLV2
./ng net.accelbyte.sdk.cli.Main ugc adminGenerateOfficialContentUploadURLV2 \
    --channelId 'ehWiJk0T' \
    --contentId 'jSmgPYhz' \
    --namespace "$AB_NAMESPACE" \
    --body '{"contentType": "QErc9bN9", "fileExtension": "VRnJ2Ano"}' \
    > test.out 2>&1
eval_tap $? 108 'AdminGenerateOfficialContentUploadURLV2' test.out

#- 109 AdminGetConfigs
./ng net.accelbyte.sdk.cli.Main ugc adminGetConfigs \
    --namespace "$AB_NAMESPACE" \
    --limit '6' \
    --offset '6' \
    > test.out 2>&1
eval_tap $? 109 'AdminGetConfigs' test.out

#- 110 AdminUpdateConfig
./ng net.accelbyte.sdk.cli.Main ugc adminUpdateConfig \
    --key 'majrNr1w' \
    --namespace "$AB_NAMESPACE" \
    --body '{"value": "cQTyPf9F"}' \
    > test.out 2>&1
eval_tap $? 110 'AdminUpdateConfig' test.out

#- 111 AdminListContentV2
./ng net.accelbyte.sdk.cli.Main ugc adminListContentV2 \
    --namespace "$AB_NAMESPACE" \
    --isOfficial  \
    --limit '6' \
    --name 'MmP8VbdM' \
    --offset '37' \
    --sortBy 'owCRYbBL' \
    --subType 'wk023Kjg' \
    --tags 'CA2CZKq2,6uBNYsDa,o1hEmr2M' \
    --type 'j3CctcWK' \
    > test.out 2>&1
eval_tap $? 111 'AdminListContentV2' test.out

#- 112 AdminBulkGetContentByIDsV2
./ng net.accelbyte.sdk.cli.Main ugc adminBulkGetContentByIDsV2 \
    --namespace "$AB_NAMESPACE" \
    --body '{"contentIds": ["0f2A1YmW", "v8tMf2JM", "SLA03Nbt"]}' \
    > test.out 2>&1
eval_tap $? 112 'AdminBulkGetContentByIDsV2' test.out

#- 113 AdminGetContentBulkByShareCodesV2
./ng net.accelbyte.sdk.cli.Main ugc adminGetContentBulkByShareCodesV2 \
    --namespace "$AB_NAMESPACE" \
    --body '{"shareCodes": ["mvIGWHIx", "PtAEFXr9", "KSSe7Mbk"]}' \
    > test.out 2>&1
eval_tap $? 113 'AdminGetContentBulkByShareCodesV2' test.out

#- 114 AdminGetContentByShareCodeV2
./ng net.accelbyte.sdk.cli.Main ugc adminGetContentByShareCodeV2 \
    --namespace "$AB_NAMESPACE" \
    --shareCode 'rFZlKn8j' \
    > test.out 2>&1
eval_tap $? 114 'AdminGetContentByShareCodeV2' test.out

#- 115 AdminGetContentByContentIDV2
./ng net.accelbyte.sdk.cli.Main ugc adminGetContentByContentIDV2 \
    --contentId 'CadzBUOi' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 115 'AdminGetContentByContentIDV2' test.out

#- 116 RollbackContentVersionV2
./ng net.accelbyte.sdk.cli.Main ugc rollbackContentVersionV2 \
    --contentId 'VUOMjf7N' \
    --namespace "$AB_NAMESPACE" \
    --versionId 'ZhuteMkA' \
    > test.out 2>&1
eval_tap $? 116 'RollbackContentVersionV2' test.out

#- 117 AdminUpdateScreenshotsV2
./ng net.accelbyte.sdk.cli.Main ugc adminUpdateScreenshotsV2 \
    --contentId 'Z8ajpCi8' \
    --namespace "$AB_NAMESPACE" \
    --body '{"screenshots": [{"description": "GE7Z9rsl", "screenshotId": "kXyzpH5n"}, {"description": "oD5xEBNI", "screenshotId": "uUwIrHPy"}, {"description": "oq1lN1Y6", "screenshotId": "N8URPkzh"}]}' \
    > test.out 2>&1
eval_tap $? 117 'AdminUpdateScreenshotsV2' test.out

#- 118 AdminUploadContentScreenshotV2
./ng net.accelbyte.sdk.cli.Main ugc adminUploadContentScreenshotV2 \
    --contentId 'vooWZlF4' \
    --namespace "$AB_NAMESPACE" \
    --body '{"screenshots": [{"contentType": "yhuvGbCh", "description": "m8AGk3CG", "fileExtension": "png"}, {"contentType": "IpKCZa43", "description": "GisdLo4Q", "fileExtension": "jfif"}, {"contentType": "wbxaOwJt", "description": "rF2hbYwb", "fileExtension": "bmp"}]}' \
    > test.out 2>&1
eval_tap $? 118 'AdminUploadContentScreenshotV2' test.out

#- 119 AdminDeleteContentScreenshotV2
./ng net.accelbyte.sdk.cli.Main ugc adminDeleteContentScreenshotV2 \
    --contentId 'wo7SPUoo' \
    --namespace "$AB_NAMESPACE" \
    --screenshotId 'RuApra3V' \
    > test.out 2>&1
eval_tap $? 119 'AdminDeleteContentScreenshotV2' test.out

#- 120 ListContentVersionsV2
./ng net.accelbyte.sdk.cli.Main ugc listContentVersionsV2 \
    --contentId 'KVXoUbXc' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 120 'ListContentVersionsV2' test.out

#- 121 AdminGetOfficialGroupContentsV2
./ng net.accelbyte.sdk.cli.Main ugc adminGetOfficialGroupContentsV2 \
    --groupId 'jZ5q7gPv' \
    --namespace "$AB_NAMESPACE" \
    --limit '84' \
    --offset '22' \
    > test.out 2>&1
eval_tap $? 121 'AdminGetOfficialGroupContentsV2' test.out

#- 122 AdminListStagingContents
./ng net.accelbyte.sdk.cli.Main ugc adminListStagingContents \
    --namespace "$AB_NAMESPACE" \
    --limit '26' \
    --offset '16' \
    --sortBy 'cy1rfJnu' \
    --status 'e934awbi' \
    > test.out 2>&1
eval_tap $? 122 'AdminListStagingContents' test.out

#- 123 AdminGetStagingContentByID
./ng net.accelbyte.sdk.cli.Main ugc adminGetStagingContentByID \
    --contentId 'i5Rp80q9' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 123 'AdminGetStagingContentByID' test.out

#- 124 AdminApproveStagingContent
./ng net.accelbyte.sdk.cli.Main ugc adminApproveStagingContent \
    --contentId 'zP5TLNYi' \
    --namespace "$AB_NAMESPACE" \
    --body '{"approved": false, "note": "HBnDKaZ2"}' \
    > test.out 2>&1
eval_tap $? 124 'AdminApproveStagingContent' test.out

#- 125 AdminUpdateContentByShareCodeV2
./ng net.accelbyte.sdk.cli.Main ugc adminUpdateContentByShareCodeV2 \
    --channelId 'WJSgQVqJ' \
    --namespace "$AB_NAMESPACE" \
    --shareCode 'nxn9FbcX' \
    --userId 'sAM5VYLA' \
    --body '{"customAttributes": {"yBy1wMwI": {}, "XMSmtwi7": {}, "sb352PBf": {}}, "name": "47oswOIB", "shareCode": "kYjKjX3b", "subType": "tEurILJn", "tags": ["b3NDUoTZ", "d4sHXj2P", "XqeRXn1R"], "type": "VH3nKcni"}' \
    > test.out 2>&1
eval_tap $? 125 'AdminUpdateContentByShareCodeV2' test.out

#- 126 AdminDeleteContentByShareCodeV2
./ng net.accelbyte.sdk.cli.Main ugc adminDeleteContentByShareCodeV2 \
    --channelId 'EMCYLKO6' \
    --namespace "$AB_NAMESPACE" \
    --shareCode 'GbrRxYnP' \
    --userId 'xJryu704' \
    > test.out 2>&1
eval_tap $? 126 'AdminDeleteContentByShareCodeV2' test.out

#- 127 AdminDeleteUserContentV2
./ng net.accelbyte.sdk.cli.Main ugc adminDeleteUserContentV2 \
    --channelId '74D2UK1e' \
    --contentId '1vBrPp9U' \
    --namespace "$AB_NAMESPACE" \
    --userId 'MEEzODFP' \
    > test.out 2>&1
eval_tap $? 127 'AdminDeleteUserContentV2' test.out

#- 128 AdminUpdateUserContentV2
./ng net.accelbyte.sdk.cli.Main ugc adminUpdateUserContentV2 \
    --channelId 'ErqAEkqX' \
    --contentId '6JGYmbXH' \
    --namespace "$AB_NAMESPACE" \
    --userId 'Ftn1gktn' \
    --body '{"customAttributes": {"veubrxoq": {}, "odyuv8F1": {}, "HM3wZwg1": {}}, "name": "PwyzqeFV", "shareCode": "5ZZ26nt9", "subType": "ccPxrGv3", "tags": ["J4WW8dRl", "aOyOwtBX", "0u2Y588w"], "type": "aKASlR3s"}' \
    > test.out 2>&1
eval_tap $? 128 'AdminUpdateUserContentV2' test.out

#- 129 AdminUpdateUserContentFileLocation
./ng net.accelbyte.sdk.cli.Main ugc adminUpdateUserContentFileLocation \
    --channelId 'pX9yrVUf' \
    --contentId 'KADsMIAq' \
    --namespace "$AB_NAMESPACE" \
    --userId 'CVs2zCNE' \
    --body '{"fileExtension": "kFYI0zjr", "fileLocation": "XEcKHDBJ"}' \
    > test.out 2>&1
eval_tap $? 129 'AdminUpdateUserContentFileLocation' test.out

#- 130 AdminGenerateUserContentUploadURLV2
./ng net.accelbyte.sdk.cli.Main ugc adminGenerateUserContentUploadURLV2 \
    --channelId 'v1J5QP4f' \
    --contentId 'T6V5gtuA' \
    --namespace "$AB_NAMESPACE" \
    --userId 'OMNTnJTE' \
    --body '{"contentType": "q1qPUmxE", "fileExtension": "xq7ufly3"}' \
    > test.out 2>&1
eval_tap $? 130 'AdminGenerateUserContentUploadURLV2' test.out

#- 131 AdminGetContentByUserIDV2
./ng net.accelbyte.sdk.cli.Main ugc adminGetContentByUserIDV2 \
    --namespace "$AB_NAMESPACE" \
    --userId 'UVdBOpgv' \
    --limit '32' \
    --offset '41' \
    --sortBy 'E9jtQu7h' \
    > test.out 2>&1
eval_tap $? 131 'AdminGetContentByUserIDV2' test.out

#- 132 AdminUpdateContentHideStatusV2
./ng net.accelbyte.sdk.cli.Main ugc adminUpdateContentHideStatusV2 \
    --contentId 'PKj9YfAu' \
    --namespace "$AB_NAMESPACE" \
    --userId 'DEu0puqM' \
    --body '{"isHidden": true}' \
    > test.out 2>&1
eval_tap $? 132 'AdminUpdateContentHideStatusV2' test.out

#- 133 AdminGetUserGroupContentsV2
./ng net.accelbyte.sdk.cli.Main ugc adminGetUserGroupContentsV2 \
    --groupId 'KvXJTKqu' \
    --namespace "$AB_NAMESPACE" \
    --userId 'lPWM6JPJ' \
    --limit '8' \
    --offset '57' \
    > test.out 2>&1
eval_tap $? 133 'AdminGetUserGroupContentsV2' test.out

#- 134 AdminListUserStagingContents
./ng net.accelbyte.sdk.cli.Main ugc adminListUserStagingContents \
    --namespace "$AB_NAMESPACE" \
    --userId 'GDxCjYkE' \
    --limit '62' \
    --offset '54' \
    --sortBy 'cTSodmtk' \
    --status 'iY9NSoM8' \
    > test.out 2>&1
eval_tap $? 134 'AdminListUserStagingContents' test.out

#- 135 PublicGetContentByChannelIDV2
./ng net.accelbyte.sdk.cli.Main ugc publicGetContentByChannelIDV2 \
    --channelId 'SsiD5vk9' \
    --namespace "$AB_NAMESPACE" \
    --limit '5' \
    --name 'sJ49yLEg' \
    --offset '49' \
    --sortBy 'RZnw8gRm' \
    > test.out 2>&1
eval_tap $? 135 'PublicGetContentByChannelIDV2' test.out

#- 136 PublicListContentV2
./ng net.accelbyte.sdk.cli.Main ugc publicListContentV2 \
    --namespace "$AB_NAMESPACE" \
    --isOfficial  \
    --limit '89' \
    --name 'flgFEqDX' \
    --offset '79' \
    --sortBy 'tNnWJzds' \
    --subType 'draYnptg' \
    --tags 'n4n6aPRm,i34K570H,JNmdc20W' \
    --type 'WunBscHF' \
    > test.out 2>&1
eval_tap $? 136 'PublicListContentV2' test.out

#- 137 PublicBulkGetContentByIDV2
./ng net.accelbyte.sdk.cli.Main ugc publicBulkGetContentByIDV2 \
    --namespace "$AB_NAMESPACE" \
    --body '{"contentIds": ["yvqdvFYs", "vDEuXPqg", "q00Z3Dho"]}' \
    > test.out 2>&1
eval_tap $? 137 'PublicBulkGetContentByIDV2' test.out

#- 138 PublicGetContentBulkByShareCodesV2
./ng net.accelbyte.sdk.cli.Main ugc publicGetContentBulkByShareCodesV2 \
    --namespace "$AB_NAMESPACE" \
    --body '{"shareCodes": ["dczXCAF2", "3IUlawtP", "GVStvFuM"]}' \
    > test.out 2>&1
eval_tap $? 138 'PublicGetContentBulkByShareCodesV2' test.out

#- 139 PublicGetContentByShareCodeV2
./ng net.accelbyte.sdk.cli.Main ugc publicGetContentByShareCodeV2 \
    --namespace "$AB_NAMESPACE" \
    --shareCode 'RDSqUZUL' \
    > test.out 2>&1
eval_tap $? 139 'PublicGetContentByShareCodeV2' test.out

#- 140 PublicGetContentByIDV2
./ng net.accelbyte.sdk.cli.Main ugc publicGetContentByIDV2 \
    --contentId 'nCXAfEPS' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 140 'PublicGetContentByIDV2' test.out

#- 141 PublicAddDownloadCountV2
./ng net.accelbyte.sdk.cli.Main ugc publicAddDownloadCountV2 \
    --contentId 'vnsLKNVr' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 141 'PublicAddDownloadCountV2' test.out

#- 142 PublicListContentDownloaderV2
./ng net.accelbyte.sdk.cli.Main ugc publicListContentDownloaderV2 \
    --contentId 'h6PxverY' \
    --namespace "$AB_NAMESPACE" \
    --limit '100' \
    --offset '25' \
    --sortBy 'VG5LA7Mo' \
    --userId 'wEKft6Rk' \
    > test.out 2>&1
eval_tap $? 142 'PublicListContentDownloaderV2' test.out

#- 143 PublicListContentLikeV2
./ng net.accelbyte.sdk.cli.Main ugc publicListContentLikeV2 \
    --contentId 'L9JUEn3G' \
    --namespace "$AB_NAMESPACE" \
    --limit '52' \
    --offset '17' \
    --sortBy '3HwdEdRx' \
    > test.out 2>&1
eval_tap $? 143 'PublicListContentLikeV2' test.out

#- 144 UpdateContentLikeStatusV2
./ng net.accelbyte.sdk.cli.Main ugc updateContentLikeStatusV2 \
    --contentId 'kwx0B2ay' \
    --namespace "$AB_NAMESPACE" \
    --body '{"likeStatus": false}' \
    > test.out 2>&1
eval_tap $? 144 'UpdateContentLikeStatusV2' test.out

#- 145 PublicCreateContentV2
./ng net.accelbyte.sdk.cli.Main ugc publicCreateContentV2 \
    --channelId 'inAdHr6N' \
    --namespace "$AB_NAMESPACE" \
    --userId '4PsZ71A1' \
    --body '{"contentType": "VnZZgddM", "customAttributes": {"C3SH3HuR": {}, "GJylRlhX": {}, "ANi2r0yF": {}}, "fileExtension": "lPgv7PuN", "name": "98VNWQov", "subType": "yOLmYtZy", "tags": ["KnMSBPoD", "ICJI0q7w", "qkPxPRsl"], "type": "YIi5vQKt"}' \
    > test.out 2>&1
eval_tap $? 145 'PublicCreateContentV2' test.out

#- 146 PublicUpdateContentByShareCodeV2
./ng net.accelbyte.sdk.cli.Main ugc publicUpdateContentByShareCodeV2 \
    --channelId '7qxbLYpD' \
    --namespace "$AB_NAMESPACE" \
    --shareCode 'xfOQ1Z7b' \
    --userId 'Yofzriap' \
    --body '{"customAttributes": {"Zfo2iHA9": {}, "EgF0Qega": {}, "rcsfMmum": {}}, "name": "KKqMEjjK", "subType": "0CjPxqCc", "tags": ["WH7y1GfU", "Vs58Dvhz", "sxyMBLXH"], "type": "jNQuJDet"}' \
    > test.out 2>&1
eval_tap $? 146 'PublicUpdateContentByShareCodeV2' test.out

#- 147 PublicDeleteContentByShareCodeV2
./ng net.accelbyte.sdk.cli.Main ugc publicDeleteContentByShareCodeV2 \
    --channelId 'CBoEptox' \
    --namespace "$AB_NAMESPACE" \
    --shareCode 'Lx2q4VoJ' \
    --userId 'P5MT37ir' \
    > test.out 2>&1
eval_tap $? 147 'PublicDeleteContentByShareCodeV2' test.out

#- 148 PublicDeleteContentV2
./ng net.accelbyte.sdk.cli.Main ugc publicDeleteContentV2 \
    --channelId 'MNajOd8Z' \
    --contentId 'ax5cacuP' \
    --namespace "$AB_NAMESPACE" \
    --userId 'gDIwZf8Z' \
    > test.out 2>&1
eval_tap $? 148 'PublicDeleteContentV2' test.out

#- 149 PublicUpdateContentV2
./ng net.accelbyte.sdk.cli.Main ugc publicUpdateContentV2 \
    --channelId 'sW8mM5Aa' \
    --contentId '5NgZ53v4' \
    --namespace "$AB_NAMESPACE" \
    --userId 'ElmovQx6' \
    --body '{"customAttributes": {"8xY9lhEl": {}, "9IZPwYB2": {}, "CELIGp0Y": {}}, "name": "LK4AEzv9", "subType": "gyqNIIA2", "tags": ["0lxLEmxI", "0bokQjMC", "ewZNAa0W"], "type": "DLDnBsbr"}' \
    > test.out 2>&1
eval_tap $? 149 'PublicUpdateContentV2' test.out

#- 150 PublicUpdateContentFileLocation
./ng net.accelbyte.sdk.cli.Main ugc publicUpdateContentFileLocation \
    --channelId 'Lm0ULyJi' \
    --contentId 'o22H5f2E' \
    --namespace "$AB_NAMESPACE" \
    --userId '1Utjhevo' \
    --body '{"fileExtension": "qTEVuX6Z", "fileLocation": "CXWnUdHM"}' \
    > test.out 2>&1
eval_tap $? 150 'PublicUpdateContentFileLocation' test.out

#- 151 UpdateContentShareCodeV2
./ng net.accelbyte.sdk.cli.Main ugc updateContentShareCodeV2 \
    --channelId 'E0fawHtB' \
    --contentId 'mL9eHdr3' \
    --namespace "$AB_NAMESPACE" \
    --userId 'BV5S4miO' \
    --body '{"shareCode": "41Bni4cj"}' \
    > test.out 2>&1
eval_tap $? 151 'UpdateContentShareCodeV2' test.out

#- 152 PublicGenerateContentUploadURLV2
./ng net.accelbyte.sdk.cli.Main ugc publicGenerateContentUploadURLV2 \
    --channelId 'Cjh3AnDL' \
    --contentId 'BmAFQbhS' \
    --namespace "$AB_NAMESPACE" \
    --userId 'uND322zD' \
    --body '{"contentType": "Eb48Hvup", "fileExtension": "utX7ZToh"}' \
    > test.out 2>&1
eval_tap $? 152 'PublicGenerateContentUploadURLV2' test.out

#- 153 PublicGetContentByUserIDV2
./ng net.accelbyte.sdk.cli.Main ugc publicGetContentByUserIDV2 \
    --namespace "$AB_NAMESPACE" \
    --userId 'fGMVxhtl' \
    --limit '49' \
    --offset '92' \
    --sortBy 'sJC22JqF' \
    > test.out 2>&1
eval_tap $? 153 'PublicGetContentByUserIDV2' test.out

#- 154 UpdateScreenshotsV2
./ng net.accelbyte.sdk.cli.Main ugc updateScreenshotsV2 \
    --contentId 'kIUqPpn1' \
    --namespace "$AB_NAMESPACE" \
    --userId '1X4PKl9f' \
    --body '{"screenshots": [{"description": "sAn5qZZR", "screenshotId": "uFRE7hoO"}, {"description": "VuJC8z6O", "screenshotId": "furWEcUd"}, {"description": "MfCr4F7V", "screenshotId": "23pi1MCE"}]}' \
    > test.out 2>&1
eval_tap $? 154 'UpdateScreenshotsV2' test.out

#- 155 UploadContentScreenshotV2
./ng net.accelbyte.sdk.cli.Main ugc uploadContentScreenshotV2 \
    --contentId 'DdWpNjDe' \
    --namespace "$AB_NAMESPACE" \
    --userId 'fJkESlQN' \
    --body '{"screenshots": [{"contentType": "CFAyaa5t", "description": "phkYZOVc", "fileExtension": "jfif"}, {"contentType": "ovGDayYW", "description": "WW5vBrjU", "fileExtension": "png"}, {"contentType": "PhtT6okg", "description": "j8mpIyMb", "fileExtension": "jpeg"}]}' \
    > test.out 2>&1
eval_tap $? 155 'UploadContentScreenshotV2' test.out

#- 156 DeleteContentScreenshotV2
./ng net.accelbyte.sdk.cli.Main ugc deleteContentScreenshotV2 \
    --contentId 'npN3yXUq' \
    --namespace "$AB_NAMESPACE" \
    --screenshotId 'cfKiPN1i' \
    --userId 'vKUTSqf4' \
    > test.out 2>&1
eval_tap $? 156 'DeleteContentScreenshotV2' test.out

#- 157 PublicGetGroupContentsV2
./ng net.accelbyte.sdk.cli.Main ugc publicGetGroupContentsV2 \
    --groupId 'IB82gh5I' \
    --namespace "$AB_NAMESPACE" \
    --userId 'FlQAwxND' \
    --limit '17' \
    --offset '87' \
    > test.out 2>&1
eval_tap $? 157 'PublicGetGroupContentsV2' test.out

#- 158 ListUserStagingContents
./ng net.accelbyte.sdk.cli.Main ugc listUserStagingContents \
    --namespace "$AB_NAMESPACE" \
    --userId 'ynOHFrio' \
    --limit '6' \
    --offset '16' \
    --sortBy 'ZZfltGBr' \
    --status 'SaSVXojH' \
    > test.out 2>&1
eval_tap $? 158 'ListUserStagingContents' test.out

#- 159 GetUserStagingContentByID
./ng net.accelbyte.sdk.cli.Main ugc getUserStagingContentByID \
    --contentId 'FaZeqcn0' \
    --namespace "$AB_NAMESPACE" \
    --userId 'MQCb31WE' \
    > test.out 2>&1
eval_tap $? 159 'GetUserStagingContentByID' test.out

#- 160 UpdateStagingContent
./ng net.accelbyte.sdk.cli.Main ugc updateStagingContent \
    --contentId 'PHfZK0nc' \
    --namespace "$AB_NAMESPACE" \
    --userId 'RUbnR6A8' \
    --body '{"fileExtension": "LwxLO9Lx", "fileLocation": "MIxKZp7l"}' \
    > test.out 2>&1
eval_tap $? 160 'UpdateStagingContent' test.out

#- 161 DeleteUserStagingContentByID
./ng net.accelbyte.sdk.cli.Main ugc deleteUserStagingContentByID \
    --contentId 'auwyhhzl' \
    --namespace "$AB_NAMESPACE" \
    --userId 'Yd8QmafS' \
    > test.out 2>&1
eval_tap $? 161 'DeleteUserStagingContentByID' test.out


rm -f "tmp.dat"

exit $EXIT_CODE