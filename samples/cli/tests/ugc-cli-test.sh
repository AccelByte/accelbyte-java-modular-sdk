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
echo "1..160"

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
    --limit '61' \
    --offset '98' \
    > test.out 2>&1
eval_tap $? 2 'SingleAdminGetChannel' test.out

#- 3 AdminCreateChannel
./ng net.accelbyte.sdk.cli.Main ugc adminCreateChannel \
    --namespace "$AB_NAMESPACE" \
    --body '{"id": "XxvHl5oh", "name": "AA0vxT5K"}' \
    > test.out 2>&1
eval_tap $? 3 'AdminCreateChannel' test.out

#- 4 SingleAdminUpdateChannel
./ng net.accelbyte.sdk.cli.Main ugc singleAdminUpdateChannel \
    --channelId 'lVcu6RUN' \
    --namespace "$AB_NAMESPACE" \
    --body '{"name": "CkSjyaZQ"}' \
    > test.out 2>&1
eval_tap $? 4 'SingleAdminUpdateChannel' test.out

#- 5 SingleAdminDeleteChannel
./ng net.accelbyte.sdk.cli.Main ugc singleAdminDeleteChannel \
    --channelId 'gFgcIMys' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 5 'SingleAdminDeleteChannel' test.out

#- 6 AdminUploadContentDirect
eval_tap 0 6 'AdminUploadContentDirect # SKIP deprecated' test.out

#- 7 AdminUploadContentS3
./ng net.accelbyte.sdk.cli.Main ugc adminUploadContentS3 \
    --channelId 'q7yTqxEW' \
    --namespace "$AB_NAMESPACE" \
    --body '{"contentType": "2Se0Dj2Q", "customAttributes": {"V7R79uQq": {}, "fViF12nj": {}, "7nAOd1Z8": {}}, "fileExtension": "vii4GsBP", "name": "d2Yqa9LM", "preview": "dSX74dkb", "previewMetadata": {"previewContentType": "pIgvolct", "previewFileExtension": "G1JIQ3T3"}, "shareCode": "mOwjVSuV", "subType": "x4EzFlT8", "tags": ["jzFaaPvg", "Gty5oGtR", "JXFyg6LO"], "type": "fTey5DeD"}' \
    > test.out 2>&1
eval_tap $? 7 'AdminUploadContentS3' test.out

#- 8 SingleAdminUpdateContentS3
./ng net.accelbyte.sdk.cli.Main ugc singleAdminUpdateContentS3 \
    --channelId 'QI2xsrxJ' \
    --contentId 'gOFvWZqD' \
    --namespace "$AB_NAMESPACE" \
    --body '{"contentType": "2edxKEsw", "customAttributes": {"dsi74OGg": {}, "koIozkw4": {}, "AXdPzxYL": {}}, "fileExtension": "IDzoLPwW", "name": "naOFYKxC", "payload": "B2sGQpDp", "preview": "i8dWdugz", "previewMetadata": {"previewContentType": "5lVHAHqu", "previewFileExtension": "SWooVVt1"}, "shareCode": "Nnr1rN93", "subType": "i8j8k5x3", "tags": ["zZ1uPtfM", "Gv10KA6h", "w5aSwvUj"], "type": "hJsylIP5", "updateContentFile": true}' \
    > test.out 2>&1
eval_tap $? 8 'SingleAdminUpdateContentS3' test.out

#- 9 AdminSearchChannelSpecificContent
./ng net.accelbyte.sdk.cli.Main ugc adminSearchChannelSpecificContent \
    --channelId '9lAkFXlF' \
    --namespace "$AB_NAMESPACE" \
    --creator 'ff36Kseh' \
    --ishidden 'OL72ao1k' \
    --isofficial 'MTpSyTk2' \
    --limit '80' \
    --name 'RPt5VI99' \
    --offset '25' \
    --orderby '11zhlqQC' \
    --sortby '4JJjZmur' \
    --subtype 'lCyhNQqB' \
    --tags 'VQm4LR9V,h8SoNWIy,bhtcNCV0' \
    --type 'BgzkXRNX' \
    --userId '7sXjsFWj' \
    > test.out 2>&1
eval_tap $? 9 'AdminSearchChannelSpecificContent' test.out

#- 10 SingleAdminUpdateContentDirect
eval_tap 0 10 'SingleAdminUpdateContentDirect # SKIP deprecated' test.out

#- 11 SingleAdminDeleteContent
./ng net.accelbyte.sdk.cli.Main ugc singleAdminDeleteContent \
    --channelId 'xx4ysjUR' \
    --contentId 'qdBEqAjx' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 11 'SingleAdminDeleteContent' test.out

#- 12 SingleAdminGetContent
./ng net.accelbyte.sdk.cli.Main ugc singleAdminGetContent \
    --namespace "$AB_NAMESPACE" \
    --limit '70' \
    --offset '66' \
    > test.out 2>&1
eval_tap $? 12 'SingleAdminGetContent' test.out

#- 13 AdminGetContentBulk
./ng net.accelbyte.sdk.cli.Main ugc adminGetContentBulk \
    --namespace "$AB_NAMESPACE" \
    --body '{"contentIds": ["1Wdd96i8", "nLmlDjgC", "JROUxiDy"]}' \
    > test.out 2>&1
eval_tap $? 13 'AdminGetContentBulk' test.out

#- 14 AdminSearchContent
./ng net.accelbyte.sdk.cli.Main ugc adminSearchContent \
    --namespace "$AB_NAMESPACE" \
    --creator 'cVoTFuYB' \
    --ishidden 'xicNM780' \
    --isofficial '9YIewptV' \
    --limit '68' \
    --name 'qSgUsVXp' \
    --offset '32' \
    --orderby 'jEt62FDi' \
    --sortby 'iU1Yi8tx' \
    --subtype 'YmEj5c3U' \
    --tags 'eQh5WwNA,JZRdJJvz,4tXaSRwA' \
    --type 'U0EM9gim' \
    --userId '8J2wGAex' \
    > test.out 2>&1
eval_tap $? 14 'AdminSearchContent' test.out

#- 15 AdminGetContentBulkByShareCodes
./ng net.accelbyte.sdk.cli.Main ugc adminGetContentBulkByShareCodes \
    --namespace "$AB_NAMESPACE" \
    --body '{"shareCodes": ["hPrjj2ZB", "nyu2cgrC", "YbCdwJMw"]}' \
    > test.out 2>&1
eval_tap $? 15 'AdminGetContentBulkByShareCodes' test.out

#- 16 AdminGetUserContentByShareCode
./ng net.accelbyte.sdk.cli.Main ugc adminGetUserContentByShareCode \
    --namespace "$AB_NAMESPACE" \
    --shareCode 'F1FRFqdo' \
    > test.out 2>&1
eval_tap $? 16 'AdminGetUserContentByShareCode' test.out

#- 17 AdminGetSpecificContent
./ng net.accelbyte.sdk.cli.Main ugc adminGetSpecificContent \
    --contentId '8a5UQlgc' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 17 'AdminGetSpecificContent' test.out

#- 18 AdminDownloadContentPreview
./ng net.accelbyte.sdk.cli.Main ugc adminDownloadContentPreview \
    --contentId 'VioaQdvF' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 18 'AdminDownloadContentPreview' test.out

#- 19 RollbackContentVersion
./ng net.accelbyte.sdk.cli.Main ugc rollbackContentVersion \
    --contentId 'Y3GDaPul' \
    --namespace "$AB_NAMESPACE" \
    --versionId '3JD6eHQK' \
    > test.out 2>&1
eval_tap $? 19 'RollbackContentVersion' test.out

#- 20 AdminUpdateScreenshots
./ng net.accelbyte.sdk.cli.Main ugc adminUpdateScreenshots \
    --contentId 'N4sXbf5t' \
    --namespace "$AB_NAMESPACE" \
    --body '{"screenshots": [{"description": "grs5oupu", "screenshotId": "SvdlHOnr"}, {"description": "TUJQP1aQ", "screenshotId": "BtaxQecU"}, {"description": "DprxJ3gV", "screenshotId": "FyL5Nsc6"}]}' \
    > test.out 2>&1
eval_tap $? 20 'AdminUpdateScreenshots' test.out

#- 21 AdminUploadContentScreenshot
./ng net.accelbyte.sdk.cli.Main ugc adminUploadContentScreenshot \
    --contentId 'ooqWYZSB' \
    --namespace "$AB_NAMESPACE" \
    --body '{"screenshots": [{"contentType": "wxvWcopH", "description": "C1VDLGlH", "fileExtension": "jpg"}, {"contentType": "Rp5BUvJb", "description": "Rff6Ciym", "fileExtension": "jpg"}, {"contentType": "P06HGGkW", "description": "oKtyDkcf", "fileExtension": "png"}]}' \
    > test.out 2>&1
eval_tap $? 21 'AdminUploadContentScreenshot' test.out

#- 22 AdminDeleteContentScreenshot
./ng net.accelbyte.sdk.cli.Main ugc adminDeleteContentScreenshot \
    --contentId '1c002qRt' \
    --namespace "$AB_NAMESPACE" \
    --screenshotId 'efPH2Kr3' \
    > test.out 2>&1
eval_tap $? 22 'AdminDeleteContentScreenshot' test.out

#- 23 ListContentVersions
./ng net.accelbyte.sdk.cli.Main ugc listContentVersions \
    --contentId 'IrN43vXk' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 23 'ListContentVersions' test.out

#- 24 SingleAdminGetAllGroups
./ng net.accelbyte.sdk.cli.Main ugc singleAdminGetAllGroups \
    --namespace "$AB_NAMESPACE" \
    --limit '37' \
    --offset '93' \
    > test.out 2>&1
eval_tap $? 24 'SingleAdminGetAllGroups' test.out

#- 25 AdminCreateGroup
./ng net.accelbyte.sdk.cli.Main ugc adminCreateGroup \
    --namespace "$AB_NAMESPACE" \
    --body '{"contents": ["mt3Ts3jG", "eomszxNv", "2pDwDqoZ"], "name": "8rg3WNc5"}' \
    > test.out 2>&1
eval_tap $? 25 'AdminCreateGroup' test.out

#- 26 SingleAdminGetGroup
./ng net.accelbyte.sdk.cli.Main ugc singleAdminGetGroup \
    --groupId 'NhzLUJ2V' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 26 'SingleAdminGetGroup' test.out

#- 27 SingleAdminUpdateGroup
./ng net.accelbyte.sdk.cli.Main ugc singleAdminUpdateGroup \
    --groupId 'egr4jUvb' \
    --namespace "$AB_NAMESPACE" \
    --body '{"contents": ["xh4uPjak", "bHnUqsN9", "dYRE2Us6"], "name": "ZDVcqr1r"}' \
    > test.out 2>&1
eval_tap $? 27 'SingleAdminUpdateGroup' test.out

#- 28 SingleAdminDeleteGroup
./ng net.accelbyte.sdk.cli.Main ugc singleAdminDeleteGroup \
    --groupId '5UbTDa32' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 28 'SingleAdminDeleteGroup' test.out

#- 29 SingleAdminGetGroupContents
./ng net.accelbyte.sdk.cli.Main ugc singleAdminGetGroupContents \
    --groupId 'RMdZbUVp' \
    --namespace "$AB_NAMESPACE" \
    --limit '48' \
    --offset '42' \
    > test.out 2>&1
eval_tap $? 29 'SingleAdminGetGroupContents' test.out

#- 30 AdminGetTag
./ng net.accelbyte.sdk.cli.Main ugc adminGetTag \
    --namespace "$AB_NAMESPACE" \
    --limit '99' \
    --offset '59' \
    > test.out 2>&1
eval_tap $? 30 'AdminGetTag' test.out

#- 31 AdminCreateTag
./ng net.accelbyte.sdk.cli.Main ugc adminCreateTag \
    --namespace "$AB_NAMESPACE" \
    --body '{"tag": "yI9gglfs"}' \
    > test.out 2>&1
eval_tap $? 31 'AdminCreateTag' test.out

#- 32 AdminUpdateTag
./ng net.accelbyte.sdk.cli.Main ugc adminUpdateTag \
    --namespace "$AB_NAMESPACE" \
    --tagId 'j3yj3jUN' \
    --body '{"tag": "bwzenwx3"}' \
    > test.out 2>&1
eval_tap $? 32 'AdminUpdateTag' test.out

#- 33 AdminDeleteTag
./ng net.accelbyte.sdk.cli.Main ugc adminDeleteTag \
    --namespace "$AB_NAMESPACE" \
    --tagId '0GqI6Cw0' \
    > test.out 2>&1
eval_tap $? 33 'AdminDeleteTag' test.out

#- 34 AdminGetType
./ng net.accelbyte.sdk.cli.Main ugc adminGetType \
    --namespace "$AB_NAMESPACE" \
    --limit '55' \
    --offset '57' \
    > test.out 2>&1
eval_tap $? 34 'AdminGetType' test.out

#- 35 AdminCreateType
./ng net.accelbyte.sdk.cli.Main ugc adminCreateType \
    --namespace "$AB_NAMESPACE" \
    --body '{"subtype": ["vk8ULYqs", "sAZBcnXD", "REQtlC1o"], "type": "dyOScpAr"}' \
    > test.out 2>&1
eval_tap $? 35 'AdminCreateType' test.out

#- 36 AdminUpdateType
./ng net.accelbyte.sdk.cli.Main ugc adminUpdateType \
    --namespace "$AB_NAMESPACE" \
    --typeId 'hV9XSpI6' \
    --body '{"subtype": ["KZaoHnCy", "jiboWDcj", "af27UT2t"], "type": "7LygzJdd"}' \
    > test.out 2>&1
eval_tap $? 36 'AdminUpdateType' test.out

#- 37 AdminDeleteType
./ng net.accelbyte.sdk.cli.Main ugc adminDeleteType \
    --namespace "$AB_NAMESPACE" \
    --typeId 'hBHhVm8d' \
    > test.out 2>&1
eval_tap $? 37 'AdminDeleteType' test.out

#- 38 AdminGetChannel
./ng net.accelbyte.sdk.cli.Main ugc adminGetChannel \
    --namespace "$AB_NAMESPACE" \
    --userId 'QFxUT5uz' \
    --limit '98' \
    --name 'leZ2UZ1q' \
    --offset '82' \
    > test.out 2>&1
eval_tap $? 38 'AdminGetChannel' test.out

#- 39 AdminDeleteAllUserChannels
./ng net.accelbyte.sdk.cli.Main ugc adminDeleteAllUserChannels \
    --namespace "$AB_NAMESPACE" \
    --userId '3hcqPn9h' \
    > test.out 2>&1
eval_tap $? 39 'AdminDeleteAllUserChannels' test.out

#- 40 AdminUpdateChannel
./ng net.accelbyte.sdk.cli.Main ugc adminUpdateChannel \
    --channelId 'PMXO4Qh5' \
    --namespace "$AB_NAMESPACE" \
    --userId 'NvBd83m7' \
    --body '{"name": "gP5hbfiH"}' \
    > test.out 2>&1
eval_tap $? 40 'AdminUpdateChannel' test.out

#- 41 AdminDeleteChannel
./ng net.accelbyte.sdk.cli.Main ugc adminDeleteChannel \
    --channelId 'jrJwIMsH' \
    --namespace "$AB_NAMESPACE" \
    --userId 'hXLChRrK' \
    > test.out 2>&1
eval_tap $? 41 'AdminDeleteChannel' test.out

#- 42 AdminUpdateContentS3ByShareCode
./ng net.accelbyte.sdk.cli.Main ugc adminUpdateContentS3ByShareCode \
    --channelId 'Uwh7nRhx' \
    --namespace "$AB_NAMESPACE" \
    --shareCode 'U7TSus5y' \
    --userId 'DJNoAkvT' \
    --body '{"contentType": "BruxvF8R", "customAttributes": {"7lwl6nX8": {}, "j8rjFjVH": {}, "jt38Mygy": {}}, "fileExtension": "4Mxp5iS7", "name": "EdOoFByw", "payload": "2dZP4CdY", "preview": "PX6TNgTb", "previewMetadata": {"previewContentType": "HHh5Oi8F", "previewFileExtension": "hUo3Q6cV"}, "shareCode": "ucryIljK", "subType": "iRRZTib4", "tags": ["jmx7BSPN", "ENv83gJs", "snw4OION"], "type": "ZNJlg9eG", "updateContentFile": false}' \
    > test.out 2>&1
eval_tap $? 42 'AdminUpdateContentS3ByShareCode' test.out

#- 43 AdminUpdateContentS3
./ng net.accelbyte.sdk.cli.Main ugc adminUpdateContentS3 \
    --channelId 'KkBiIlrg' \
    --contentId 'AatT1tsK' \
    --namespace "$AB_NAMESPACE" \
    --userId 'MO2zsmXS' \
    --body '{"contentType": "ZoVQsAEe", "customAttributes": {"EoEqS5LQ": {}, "2ZUULYmo": {}, "9Yn8XjdG": {}}, "fileExtension": "YKydqxDC", "name": "4Alb63KM", "payload": "8MEvcvah", "preview": "jcIfRAsk", "previewMetadata": {"previewContentType": "FMzv1HKZ", "previewFileExtension": "xU3MGIzh"}, "shareCode": "CK1uD4i3", "subType": "NoTuZKNO", "tags": ["kjokTGlM", "7IhuJGXI", "WJHRSlUS"], "type": "7AR6fluS", "updateContentFile": false}' \
    > test.out 2>&1
eval_tap $? 43 'AdminUpdateContentS3' test.out

#- 44 DeleteContentByShareCode
./ng net.accelbyte.sdk.cli.Main ugc deleteContentByShareCode \
    --channelId 'LUIyWkn4' \
    --namespace "$AB_NAMESPACE" \
    --shareCode 'KbCthuF8' \
    --userId 'sNvBKY09' \
    > test.out 2>&1
eval_tap $? 44 'DeleteContentByShareCode' test.out

#- 45 AdminUpdateContentDirect
eval_tap 0 45 'AdminUpdateContentDirect # SKIP deprecated' test.out

#- 46 AdminDeleteContent
./ng net.accelbyte.sdk.cli.Main ugc adminDeleteContent \
    --channelId 'ouZYnARV' \
    --contentId 'ThIQNdBh' \
    --namespace "$AB_NAMESPACE" \
    --userId 'R380WTnE' \
    > test.out 2>&1
eval_tap $? 46 'AdminDeleteContent' test.out

#- 47 AdminGetContent
./ng net.accelbyte.sdk.cli.Main ugc adminGetContent \
    --namespace "$AB_NAMESPACE" \
    --userId '8H0pT03M' \
    --limit '42' \
    --offset '33' \
    > test.out 2>&1
eval_tap $? 47 'AdminGetContent' test.out

#- 48 AdminDeleteAllUserContents
./ng net.accelbyte.sdk.cli.Main ugc adminDeleteAllUserContents \
    --namespace "$AB_NAMESPACE" \
    --userId 'O5rFCHF4' \
    > test.out 2>&1
eval_tap $? 48 'AdminDeleteAllUserContents' test.out

#- 49 AdminHideUserContent
./ng net.accelbyte.sdk.cli.Main ugc adminHideUserContent \
    --contentId 'VVkb9kR2' \
    --namespace "$AB_NAMESPACE" \
    --userId 'hkYX2xxQ' \
    --body '{"isHidden": false}' \
    > test.out 2>&1
eval_tap $? 49 'AdminHideUserContent' test.out

#- 50 AdminGetAllGroups
./ng net.accelbyte.sdk.cli.Main ugc adminGetAllGroups \
    --namespace "$AB_NAMESPACE" \
    --userId 'hBd0SpmB' \
    --limit '4' \
    --offset '47' \
    > test.out 2>&1
eval_tap $? 50 'AdminGetAllGroups' test.out

#- 51 AdminDeleteAllUserGroup
./ng net.accelbyte.sdk.cli.Main ugc adminDeleteAllUserGroup \
    --namespace "$AB_NAMESPACE" \
    --userId 'SYYWQOGo' \
    > test.out 2>&1
eval_tap $? 51 'AdminDeleteAllUserGroup' test.out

#- 52 AdminGetGroup
./ng net.accelbyte.sdk.cli.Main ugc adminGetGroup \
    --groupId 'uWbqiFbf' \
    --namespace "$AB_NAMESPACE" \
    --userId 'X55io1fJ' \
    > test.out 2>&1
eval_tap $? 52 'AdminGetGroup' test.out

#- 53 AdminUpdateGroup
./ng net.accelbyte.sdk.cli.Main ugc adminUpdateGroup \
    --groupId 'X5YNXty2' \
    --namespace "$AB_NAMESPACE" \
    --userId 'PC56DLdl' \
    --body '{"contents": ["w9Xy1nHG", "wgmhknTo", "H4SoqIOi"], "name": "haejTOKH"}' \
    > test.out 2>&1
eval_tap $? 53 'AdminUpdateGroup' test.out

#- 54 AdminDeleteGroup
./ng net.accelbyte.sdk.cli.Main ugc adminDeleteGroup \
    --groupId 'LnYcFaFu' \
    --namespace "$AB_NAMESPACE" \
    --userId 'A0McLs3F' \
    > test.out 2>&1
eval_tap $? 54 'AdminDeleteGroup' test.out

#- 55 AdminGetGroupContents
./ng net.accelbyte.sdk.cli.Main ugc adminGetGroupContents \
    --groupId 'g3PxPRHk' \
    --namespace "$AB_NAMESPACE" \
    --userId 'DTn9degs' \
    --limit '70' \
    --offset '15' \
    > test.out 2>&1
eval_tap $? 55 'AdminGetGroupContents' test.out

#- 56 AdminDeleteAllUserStates
./ng net.accelbyte.sdk.cli.Main ugc adminDeleteAllUserStates \
    --namespace "$AB_NAMESPACE" \
    --userId 'IBtxZjsf' \
    > test.out 2>&1
eval_tap $? 56 'AdminDeleteAllUserStates' test.out

#- 57 SearchChannelSpecificContent
./ng net.accelbyte.sdk.cli.Main ugc searchChannelSpecificContent \
    --channelId 'zOzetR19' \
    --namespace "$AB_NAMESPACE" \
    --creator 'XBGWgg4O' \
    --ishidden 'rOQ7Cpqt' \
    --isofficial 'adYw9R5G' \
    --limit '2' \
    --name 'zAzyzqEN' \
    --offset '46' \
    --orderby 'FWBGUBbb' \
    --sortby '1Na5oIm2' \
    --subtype 'fJlUylBc' \
    --tags 'RZE08Wdl,tullc7qJ,Yh1FCGsk' \
    --type 'AXSXMRSt' \
    --userId 'Qad0ZfwT' \
    > test.out 2>&1
eval_tap $? 57 'SearchChannelSpecificContent' test.out

#- 58 PublicSearchContent
./ng net.accelbyte.sdk.cli.Main ugc publicSearchContent \
    --namespace "$AB_NAMESPACE" \
    --creator 'FU0DgdC7' \
    --ishidden 'mLoH1lOA' \
    --isofficial 'o5ruqf98' \
    --limit '96' \
    --name 'VRzhTIAX' \
    --offset '91' \
    --orderby '0ITmzAKq' \
    --sortby 'CTeZkuQs' \
    --subtype 'YpSTSSSO' \
    --tags 'lnbNOBGC,hEjksyWX,o9UnpwhA' \
    --type 'ztx6gv3j' \
    --userId '4i0H7U4t' \
    > test.out 2>&1
eval_tap $? 58 'PublicSearchContent' test.out

#- 59 PublicGetContentBulk
./ng net.accelbyte.sdk.cli.Main ugc publicGetContentBulk \
    --namespace "$AB_NAMESPACE" \
    --body '{"contentIds": ["Y10J7VCE", "gW4kZffa", "gObWVsu5"]}' \
    > test.out 2>&1
eval_tap $? 59 'PublicGetContentBulk' test.out

#- 60 GetFollowedContent
./ng net.accelbyte.sdk.cli.Main ugc getFollowedContent \
    --namespace "$AB_NAMESPACE" \
    --limit '98' \
    --offset '80' \
    > test.out 2>&1
eval_tap $? 60 'GetFollowedContent' test.out

#- 61 GetLikedContent
./ng net.accelbyte.sdk.cli.Main ugc getLikedContent \
    --namespace "$AB_NAMESPACE" \
    --isofficial  \
    --limit '84' \
    --name 'E9F1VSpJ' \
    --offset '68' \
    --orderby '0FbuZ8PC' \
    --sortby '9c5HjpdL' \
    --subtype 's7E2l21O' \
    --tags 'H3pZIstD,oCjH9OHV,jWJkEd3z' \
    --type 'liUqLYC5' \
    > test.out 2>&1
eval_tap $? 61 'GetLikedContent' test.out

#- 62 PublicGetContentBulkByShareCodes
./ng net.accelbyte.sdk.cli.Main ugc publicGetContentBulkByShareCodes \
    --namespace "$AB_NAMESPACE" \
    --body '{"shareCodes": ["1UkLUDD6", "17FoAXbq", "HlC7mXyD"]}' \
    > test.out 2>&1
eval_tap $? 62 'PublicGetContentBulkByShareCodes' test.out

#- 63 PublicDownloadContentByShareCode
./ng net.accelbyte.sdk.cli.Main ugc publicDownloadContentByShareCode \
    --namespace "$AB_NAMESPACE" \
    --shareCode 'SBzOzrem' \
    > test.out 2>&1
eval_tap $? 63 'PublicDownloadContentByShareCode' test.out

#- 64 PublicDownloadContentByContentID
./ng net.accelbyte.sdk.cli.Main ugc publicDownloadContentByContentID \
    --contentId 'oHcZeTSo' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 64 'PublicDownloadContentByContentID' test.out

#- 65 AddDownloadCount
./ng net.accelbyte.sdk.cli.Main ugc addDownloadCount \
    --contentId 'lgbiT6Y8' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 65 'AddDownloadCount' test.out

#- 66 UpdateContentLikeStatus
./ng net.accelbyte.sdk.cli.Main ugc updateContentLikeStatus \
    --contentId '83UYRFLU' \
    --namespace "$AB_NAMESPACE" \
    --body '{"likeStatus": false}' \
    > test.out 2>&1
eval_tap $? 66 'UpdateContentLikeStatus' test.out

#- 67 PublicDownloadContentPreview
./ng net.accelbyte.sdk.cli.Main ugc publicDownloadContentPreview \
    --contentId 'ROh4GnYJ' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 67 'PublicDownloadContentPreview' test.out

#- 68 GetTag
./ng net.accelbyte.sdk.cli.Main ugc getTag \
    --namespace "$AB_NAMESPACE" \
    --limit '80' \
    --offset '17' \
    > test.out 2>&1
eval_tap $? 68 'GetTag' test.out

#- 69 GetType
./ng net.accelbyte.sdk.cli.Main ugc getType \
    --namespace "$AB_NAMESPACE" \
    --limit '5' \
    --offset '35' \
    > test.out 2>&1
eval_tap $? 69 'GetType' test.out

#- 70 PublicSearchCreator
./ng net.accelbyte.sdk.cli.Main ugc publicSearchCreator \
    --namespace "$AB_NAMESPACE" \
    --limit '66' \
    --offset '61' \
    --orderby 'CR7qUDww' \
    --sortby 'wgPkZ35u' \
    > test.out 2>&1
eval_tap $? 70 'PublicSearchCreator' test.out

#- 71 GetFollowedUsers
./ng net.accelbyte.sdk.cli.Main ugc getFollowedUsers \
    --namespace "$AB_NAMESPACE" \
    --limit '7' \
    --offset '38' \
    > test.out 2>&1
eval_tap $? 71 'GetFollowedUsers' test.out

#- 72 PublicGetCreator
./ng net.accelbyte.sdk.cli.Main ugc publicGetCreator \
    --namespace "$AB_NAMESPACE" \
    --userId 'yjsafgfp' \
    > test.out 2>&1
eval_tap $? 72 'PublicGetCreator' test.out

#- 73 GetChannels
./ng net.accelbyte.sdk.cli.Main ugc getChannels \
    --namespace "$AB_NAMESPACE" \
    --userId 'AtxeirLs' \
    --limit '22' \
    --name 'PtL5Rcai' \
    --offset '88' \
    > test.out 2>&1
eval_tap $? 73 'GetChannels' test.out

#- 74 PublicCreateChannel
./ng net.accelbyte.sdk.cli.Main ugc publicCreateChannel \
    --namespace "$AB_NAMESPACE" \
    --userId 'ewnMyiZl' \
    --body '{"name": "bAZO3Hyu"}' \
    > test.out 2>&1
eval_tap $? 74 'PublicCreateChannel' test.out

#- 75 DeleteAllUserChannel
./ng net.accelbyte.sdk.cli.Main ugc deleteAllUserChannel \
    --namespace "$AB_NAMESPACE" \
    --userId '7dbLDAgP' \
    > test.out 2>&1
eval_tap $? 75 'DeleteAllUserChannel' test.out

#- 76 UpdateChannel
./ng net.accelbyte.sdk.cli.Main ugc updateChannel \
    --channelId 'dNidbFBg' \
    --namespace "$AB_NAMESPACE" \
    --userId '8comUSbo' \
    --body '{"name": "68MGDdxe"}' \
    > test.out 2>&1
eval_tap $? 76 'UpdateChannel' test.out

#- 77 DeleteChannel
./ng net.accelbyte.sdk.cli.Main ugc deleteChannel \
    --channelId 'OIgvRc6K' \
    --namespace "$AB_NAMESPACE" \
    --userId '39XIBNQb' \
    > test.out 2>&1
eval_tap $? 77 'DeleteChannel' test.out

#- 78 CreateContentDirect
eval_tap 0 78 'CreateContentDirect # SKIP deprecated' test.out

#- 79 CreateContentS3
./ng net.accelbyte.sdk.cli.Main ugc createContentS3 \
    --channelId 'b5Yl3l3D' \
    --namespace "$AB_NAMESPACE" \
    --userId 'UX063Xfn' \
    --body '{"contentType": "r6dIIRNK", "customAttributes": {"zNyGBEZN": {}, "PezZ1MW1": {}, "5EwKYipM": {}}, "fileExtension": "KMUOrBsm", "name": "BcjcQY73", "preview": "33ZRci3D", "previewMetadata": {"previewContentType": "5Xh75Xwp", "previewFileExtension": "S1akhHt2"}, "subType": "53J74O7w", "tags": ["UnY5zyHk", "vnXOlw5w", "nKDf7fON"], "type": "ab6kygZG"}' \
    > test.out 2>&1
eval_tap $? 79 'CreateContentS3' test.out

#- 80 PublicUpdateContentByShareCode
./ng net.accelbyte.sdk.cli.Main ugc publicUpdateContentByShareCode \
    --channelId 'hSudBF4C' \
    --namespace "$AB_NAMESPACE" \
    --shareCode 'L5mDnHgU' \
    --userId 'p8bJ5RrF' \
    --body '{"contentType": "m5HJxKSO", "customAttributes": {"vlpEX3SR": {}, "ZlW6Ylcj": {}, "nQxiUCpy": {}}, "fileExtension": "WuGG0Yd4", "name": "7WpuwGUP", "payload": "cUKp21Y0", "preview": "zaseNJCa", "previewMetadata": {"previewContentType": "8A6ZmGVL", "previewFileExtension": "zmfVOMYw"}, "subType": "nFyy3jzT", "tags": ["sIGbwxmS", "07FB6KZq", "GctGkzgE"], "type": "BxLCQJ47", "updateContentFile": false}' \
    > test.out 2>&1
eval_tap $? 80 'PublicUpdateContentByShareCode' test.out

#- 81 UpdateContentS3
./ng net.accelbyte.sdk.cli.Main ugc updateContentS3 \
    --channelId 'OGFF4qRE' \
    --contentId 'UIu5xTKP' \
    --namespace "$AB_NAMESPACE" \
    --userId 'q9688Ryx' \
    --body '{"contentType": "rCkzcq6p", "customAttributes": {"YrPXpKdV": {}, "DI4OYf13": {}, "UTVkYE3W": {}}, "fileExtension": "ikQY9j2I", "name": "31AqLJm8", "payload": "nUTkfcLH", "preview": "2sUs2KDx", "previewMetadata": {"previewContentType": "vUq5OyhF", "previewFileExtension": "t5bmwJyn"}, "subType": "DEDbb1uY", "tags": ["30Ds6YbP", "7BxUMheQ", "vSxivkCY"], "type": "hMSOIXct", "updateContentFile": false}' \
    > test.out 2>&1
eval_tap $? 81 'UpdateContentS3' test.out

#- 82 PublicDeleteContentByShareCode
./ng net.accelbyte.sdk.cli.Main ugc publicDeleteContentByShareCode \
    --channelId '0JPNuS8L' \
    --namespace "$AB_NAMESPACE" \
    --shareCode 'qdanQx6x' \
    --userId 'KtgB0Eks' \
    > test.out 2>&1
eval_tap $? 82 'PublicDeleteContentByShareCode' test.out

#- 83 UpdateContentDirect
eval_tap 0 83 'UpdateContentDirect # SKIP deprecated' test.out

#- 84 DeleteContent
./ng net.accelbyte.sdk.cli.Main ugc deleteContent \
    --channelId 'thNFNPcp' \
    --contentId 'MEV2vcL6' \
    --namespace "$AB_NAMESPACE" \
    --userId 's5t8X5ud' \
    > test.out 2>&1
eval_tap $? 84 'DeleteContent' test.out

#- 85 UpdateContentShareCode
./ng net.accelbyte.sdk.cli.Main ugc updateContentShareCode \
    --channelId '1esEMsZ2' \
    --contentId 'Px1nptpZ' \
    --namespace "$AB_NAMESPACE" \
    --userId 'dkKGu8vC' \
    --body '{"shareCode": "kosvFSp6"}' \
    > test.out 2>&1
eval_tap $? 85 'UpdateContentShareCode' test.out

#- 86 PublicGetUserContent
./ng net.accelbyte.sdk.cli.Main ugc publicGetUserContent \
    --namespace "$AB_NAMESPACE" \
    --userId 'OQYamPvf' \
    --limit '91' \
    --offset '95' \
    > test.out 2>&1
eval_tap $? 86 'PublicGetUserContent' test.out

#- 87 DeleteAllUserContents
./ng net.accelbyte.sdk.cli.Main ugc deleteAllUserContents \
    --namespace "$AB_NAMESPACE" \
    --userId '25rxcwpj' \
    > test.out 2>&1
eval_tap $? 87 'DeleteAllUserContents' test.out

#- 88 UpdateScreenshots
./ng net.accelbyte.sdk.cli.Main ugc updateScreenshots \
    --contentId 'FmC1UkFq' \
    --namespace "$AB_NAMESPACE" \
    --userId '0XVFmf1c' \
    --body '{"screenshots": [{"description": "9SjLs9nW", "screenshotId": "F2vMxfBZ"}, {"description": "9Ds4zBA1", "screenshotId": "JQUCuQUL"}, {"description": "IHB5B7Q2", "screenshotId": "X9XdhJUH"}]}' \
    > test.out 2>&1
eval_tap $? 88 'UpdateScreenshots' test.out

#- 89 UploadContentScreenshot
./ng net.accelbyte.sdk.cli.Main ugc uploadContentScreenshot \
    --contentId 'xQXPPjz8' \
    --namespace "$AB_NAMESPACE" \
    --userId 'VwhleL6h' \
    --body '{"screenshots": [{"contentType": "HR5kCPt5", "description": "LnA5nbSk", "fileExtension": "jpg"}, {"contentType": "GRuYogeH", "description": "4fYaAdil", "fileExtension": "bmp"}, {"contentType": "zxsc2lye", "description": "OFbKDp26", "fileExtension": "jpeg"}]}' \
    > test.out 2>&1
eval_tap $? 89 'UploadContentScreenshot' test.out

#- 90 DeleteContentScreenshot
./ng net.accelbyte.sdk.cli.Main ugc deleteContentScreenshot \
    --contentId 'RJylx55P' \
    --namespace "$AB_NAMESPACE" \
    --screenshotId 'FF7qmb5G' \
    --userId 'L96i1F0E' \
    > test.out 2>&1
eval_tap $? 90 'DeleteContentScreenshot' test.out

#- 91 UpdateUserFollowStatus
./ng net.accelbyte.sdk.cli.Main ugc updateUserFollowStatus \
    --namespace "$AB_NAMESPACE" \
    --userId '0l27oH3U' \
    --body '{"followStatus": true}' \
    > test.out 2>&1
eval_tap $? 91 'UpdateUserFollowStatus' test.out

#- 92 GetPublicFollowers
./ng net.accelbyte.sdk.cli.Main ugc getPublicFollowers \
    --namespace "$AB_NAMESPACE" \
    --userId 'a9nJgWZ2' \
    --limit '63' \
    --offset '97' \
    > test.out 2>&1
eval_tap $? 92 'GetPublicFollowers' test.out

#- 93 GetPublicFollowing
./ng net.accelbyte.sdk.cli.Main ugc getPublicFollowing \
    --namespace "$AB_NAMESPACE" \
    --userId 'BJ7sfRij' \
    --limit '81' \
    --offset '68' \
    > test.out 2>&1
eval_tap $? 93 'GetPublicFollowing' test.out

#- 94 GetGroups
./ng net.accelbyte.sdk.cli.Main ugc getGroups \
    --namespace "$AB_NAMESPACE" \
    --userId 'q9qfgzdM' \
    --limit '70' \
    --offset '44' \
    > test.out 2>&1
eval_tap $? 94 'GetGroups' test.out

#- 95 CreateGroup
./ng net.accelbyte.sdk.cli.Main ugc createGroup \
    --namespace "$AB_NAMESPACE" \
    --userId '1HIHAYpa' \
    --body '{"contents": ["fYCvjBhf", "PM7u04FG", "Icib2IWu"], "name": "uV9C02yo"}' \
    > test.out 2>&1
eval_tap $? 95 'CreateGroup' test.out

#- 96 DeleteAllUserGroup
./ng net.accelbyte.sdk.cli.Main ugc deleteAllUserGroup \
    --namespace "$AB_NAMESPACE" \
    --userId 'mtAcUdwR' \
    > test.out 2>&1
eval_tap $? 96 'DeleteAllUserGroup' test.out

#- 97 GetGroup
./ng net.accelbyte.sdk.cli.Main ugc getGroup \
    --groupId 'skbqWWzr' \
    --namespace "$AB_NAMESPACE" \
    --userId 'dYjlMSj6' \
    > test.out 2>&1
eval_tap $? 97 'GetGroup' test.out

#- 98 UpdateGroup
./ng net.accelbyte.sdk.cli.Main ugc updateGroup \
    --groupId 'H2SzOvJJ' \
    --namespace "$AB_NAMESPACE" \
    --userId 'adllcbJJ' \
    --body '{"contents": ["yGJ9SprY", "smt0PF80", "qCJuwBGo"], "name": "EpStmC6T"}' \
    > test.out 2>&1
eval_tap $? 98 'UpdateGroup' test.out

#- 99 DeleteGroup
./ng net.accelbyte.sdk.cli.Main ugc deleteGroup \
    --groupId 'QVc6CLHp' \
    --namespace "$AB_NAMESPACE" \
    --userId 'FBIM4YOj' \
    > test.out 2>&1
eval_tap $? 99 'DeleteGroup' test.out

#- 100 GetGroupContent
./ng net.accelbyte.sdk.cli.Main ugc getGroupContent \
    --groupId 'uyJvJPwk' \
    --namespace "$AB_NAMESPACE" \
    --userId 'DbUrGX0e' \
    --limit '12' \
    --offset '42' \
    > test.out 2>&1
eval_tap $? 100 'GetGroupContent' test.out

#- 101 DeleteAllUserStates
./ng net.accelbyte.sdk.cli.Main ugc deleteAllUserStates \
    --namespace "$AB_NAMESPACE" \
    --userId 'y34fARdS' \
    > test.out 2>&1
eval_tap $? 101 'DeleteAllUserStates' test.out

#- 102 AdminGetContentByChannelIDV2
./ng net.accelbyte.sdk.cli.Main ugc adminGetContentByChannelIDV2 \
    --channelId 'FGI5u1f6' \
    --namespace "$AB_NAMESPACE" \
    --limit '93' \
    --name 'hLPRXMOu' \
    --offset '1' \
    --sortBy 'pBkHrZGw' \
    > test.out 2>&1
eval_tap $? 102 'AdminGetContentByChannelIDV2' test.out

#- 103 AdminCreateContentV2
./ng net.accelbyte.sdk.cli.Main ugc adminCreateContentV2 \
    --channelId 'ChVffGpw' \
    --namespace "$AB_NAMESPACE" \
    --body '{"contentType": "xLf0l266", "customAttributes": {"ne0rGbx6": {}, "ZYha7T72": {}, "zzTd4C10": {}}, "fileExtension": "UbtZBP4a", "name": "C232BCvA", "shareCode": "HX8MiTGA", "subType": "I22SoWhD", "tags": ["yxYSC6Lp", "NiqxQvt1", "txwSIigZ"], "type": "q8q97aBl"}' \
    > test.out 2>&1
eval_tap $? 103 'AdminCreateContentV2' test.out

#- 104 AdminDeleteOfficialContentV2
./ng net.accelbyte.sdk.cli.Main ugc adminDeleteOfficialContentV2 \
    --channelId 'P1w2U8ok' \
    --contentId 'yUCbqYAu' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 104 'AdminDeleteOfficialContentV2' test.out

#- 105 AdminUpdateOfficialContentV2
./ng net.accelbyte.sdk.cli.Main ugc adminUpdateOfficialContentV2 \
    --channelId 'LjLkXVX1' \
    --contentId 'vOWyGJM0' \
    --namespace "$AB_NAMESPACE" \
    --body '{"customAttributes": {"p7O9TcAd": {}, "fNkUidty": {}, "HWeTiMTZ": {}}, "name": "pYM5ljUn", "shareCode": "7Fili6fd", "subType": "ggxSU6NV", "tags": ["UxGxkApM", "OUv7VNRp", "M6GYp8qZ"], "type": "25Uhs6fA"}' \
    > test.out 2>&1
eval_tap $? 105 'AdminUpdateOfficialContentV2' test.out

#- 106 AdminUpdateOfficialContentFileLocation
./ng net.accelbyte.sdk.cli.Main ugc adminUpdateOfficialContentFileLocation \
    --channelId 'YIrA88pY' \
    --contentId 'jeloKzT8' \
    --namespace "$AB_NAMESPACE" \
    --body '{"fileExtension": "FtoAGCj7", "fileLocation": "xvUmNaIv"}' \
    > test.out 2>&1
eval_tap $? 106 'AdminUpdateOfficialContentFileLocation' test.out

#- 107 AdminGenerateOfficialContentUploadURLV2
./ng net.accelbyte.sdk.cli.Main ugc adminGenerateOfficialContentUploadURLV2 \
    --channelId 'X2aE9EcH' \
    --contentId '9DZVStW8' \
    --namespace "$AB_NAMESPACE" \
    --body '{"contentType": "3dxuhji0", "fileExtension": "MwrFNqmN"}' \
    > test.out 2>&1
eval_tap $? 107 'AdminGenerateOfficialContentUploadURLV2' test.out

#- 108 AdminGetConfigs
./ng net.accelbyte.sdk.cli.Main ugc adminGetConfigs \
    --namespace "$AB_NAMESPACE" \
    --limit '23' \
    --offset '62' \
    > test.out 2>&1
eval_tap $? 108 'AdminGetConfigs' test.out

#- 109 AdminUpdateConfig
./ng net.accelbyte.sdk.cli.Main ugc adminUpdateConfig \
    --key 'EwozO06w' \
    --namespace "$AB_NAMESPACE" \
    --body '{"value": "z9WNMmPd"}' \
    > test.out 2>&1
eval_tap $? 109 'AdminUpdateConfig' test.out

#- 110 AdminListContentV2
./ng net.accelbyte.sdk.cli.Main ugc adminListContentV2 \
    --namespace "$AB_NAMESPACE" \
    --isOfficial  \
    --limit '66' \
    --name 'I1EwSWFO' \
    --offset '22' \
    --sortBy 'WnrxWVUn' \
    --subType 'TjAYbR7r' \
    --tags 'zuVBr4ib,pCNgSRKx,ovdZFjEV' \
    --type 'x2ecpcYL' \
    > test.out 2>&1
eval_tap $? 110 'AdminListContentV2' test.out

#- 111 AdminBulkGetContentByIDsV2
./ng net.accelbyte.sdk.cli.Main ugc adminBulkGetContentByIDsV2 \
    --namespace "$AB_NAMESPACE" \
    --body '{"contentIds": ["bniBYCzy", "MlKQWnwl", "NZP3nZr0"]}' \
    > test.out 2>&1
eval_tap $? 111 'AdminBulkGetContentByIDsV2' test.out

#- 112 AdminGetContentBulkByShareCodesV2
./ng net.accelbyte.sdk.cli.Main ugc adminGetContentBulkByShareCodesV2 \
    --namespace "$AB_NAMESPACE" \
    --body '{"shareCodes": ["hTtSMsTg", "m7LIyqCP", "mLkwxlYW"]}' \
    > test.out 2>&1
eval_tap $? 112 'AdminGetContentBulkByShareCodesV2' test.out

#- 113 AdminGetContentByShareCodeV2
./ng net.accelbyte.sdk.cli.Main ugc adminGetContentByShareCodeV2 \
    --namespace "$AB_NAMESPACE" \
    --shareCode 'HRJDR3GT' \
    > test.out 2>&1
eval_tap $? 113 'AdminGetContentByShareCodeV2' test.out

#- 114 AdminGetContentByContentIDV2
./ng net.accelbyte.sdk.cli.Main ugc adminGetContentByContentIDV2 \
    --contentId 'ae2DCx3t' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 114 'AdminGetContentByContentIDV2' test.out

#- 115 RollbackContentVersionV2
./ng net.accelbyte.sdk.cli.Main ugc rollbackContentVersionV2 \
    --contentId 'bQFunx0Q' \
    --namespace "$AB_NAMESPACE" \
    --versionId 'rZX2GFfO' \
    > test.out 2>&1
eval_tap $? 115 'RollbackContentVersionV2' test.out

#- 116 AdminUpdateScreenshotsV2
./ng net.accelbyte.sdk.cli.Main ugc adminUpdateScreenshotsV2 \
    --contentId 'dq7cxcjg' \
    --namespace "$AB_NAMESPACE" \
    --body '{"screenshots": [{"description": "WQg19pGS", "screenshotId": "qBrdgTnb"}, {"description": "Zotlx1Gl", "screenshotId": "JAlQY9ye"}, {"description": "FjAOacGx", "screenshotId": "dykchlBG"}]}' \
    > test.out 2>&1
eval_tap $? 116 'AdminUpdateScreenshotsV2' test.out

#- 117 AdminUploadContentScreenshotV2
./ng net.accelbyte.sdk.cli.Main ugc adminUploadContentScreenshotV2 \
    --contentId 'FEj9mVRe' \
    --namespace "$AB_NAMESPACE" \
    --body '{"screenshots": [{"contentType": "VayHQdJJ", "description": "OGQ3T29n", "fileExtension": "jfif"}, {"contentType": "5bujWDKP", "description": "vEfJCESd", "fileExtension": "bmp"}, {"contentType": "24Z8d9yP", "description": "6o98wf9m", "fileExtension": "jpg"}]}' \
    > test.out 2>&1
eval_tap $? 117 'AdminUploadContentScreenshotV2' test.out

#- 118 AdminDeleteContentScreenshotV2
./ng net.accelbyte.sdk.cli.Main ugc adminDeleteContentScreenshotV2 \
    --contentId '1V4ehOjq' \
    --namespace "$AB_NAMESPACE" \
    --screenshotId '8TuYaoyi' \
    > test.out 2>&1
eval_tap $? 118 'AdminDeleteContentScreenshotV2' test.out

#- 119 ListContentVersionsV2
./ng net.accelbyte.sdk.cli.Main ugc listContentVersionsV2 \
    --contentId 'udlYaYrH' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 119 'ListContentVersionsV2' test.out

#- 120 AdminGetOfficialGroupContentsV2
./ng net.accelbyte.sdk.cli.Main ugc adminGetOfficialGroupContentsV2 \
    --groupId 'Ghjzdw6J' \
    --namespace "$AB_NAMESPACE" \
    --limit '6' \
    --offset '90' \
    > test.out 2>&1
eval_tap $? 120 'AdminGetOfficialGroupContentsV2' test.out

#- 121 AdminListStagingContents
./ng net.accelbyte.sdk.cli.Main ugc adminListStagingContents \
    --namespace "$AB_NAMESPACE" \
    --limit '35' \
    --offset '45' \
    --sortBy 'lLimEwUl' \
    --status 'zyB3XDyt' \
    > test.out 2>&1
eval_tap $? 121 'AdminListStagingContents' test.out

#- 122 AdminGetStagingContentByID
./ng net.accelbyte.sdk.cli.Main ugc adminGetStagingContentByID \
    --contentId 'Oe2uWwX7' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 122 'AdminGetStagingContentByID' test.out

#- 123 AdminApproveStagingContent
./ng net.accelbyte.sdk.cli.Main ugc adminApproveStagingContent \
    --contentId 'oZJSitSY' \
    --namespace "$AB_NAMESPACE" \
    --body '{"approved": false, "note": "9fGdOwFK"}' \
    > test.out 2>&1
eval_tap $? 123 'AdminApproveStagingContent' test.out

#- 124 AdminUpdateContentByShareCodeV2
./ng net.accelbyte.sdk.cli.Main ugc adminUpdateContentByShareCodeV2 \
    --channelId 'XUeNqf7J' \
    --namespace "$AB_NAMESPACE" \
    --shareCode 'uhzHoC5u' \
    --userId 'YS8D1lS8' \
    --body '{"customAttributes": {"iYzovovj": {}, "fsJyvwTN": {}, "zqxRIlfS": {}}, "name": "OyWhyvRL", "shareCode": "3OmQ2LjL", "subType": "JLYYc66x", "tags": ["FN0pLFzB", "NqHdou0c", "BcKeR7Yf"], "type": "Q2TmVZwz"}' \
    > test.out 2>&1
eval_tap $? 124 'AdminUpdateContentByShareCodeV2' test.out

#- 125 AdminDeleteContentByShareCodeV2
./ng net.accelbyte.sdk.cli.Main ugc adminDeleteContentByShareCodeV2 \
    --channelId 'TtXTqpNR' \
    --namespace "$AB_NAMESPACE" \
    --shareCode 'BbFPXuiw' \
    --userId 'hT3IEzrz' \
    > test.out 2>&1
eval_tap $? 125 'AdminDeleteContentByShareCodeV2' test.out

#- 126 AdminDeleteUserContentV2
./ng net.accelbyte.sdk.cli.Main ugc adminDeleteUserContentV2 \
    --channelId 'a4uQkexy' \
    --contentId 'WgKKuYDg' \
    --namespace "$AB_NAMESPACE" \
    --userId 'sq9r5crA' \
    > test.out 2>&1
eval_tap $? 126 'AdminDeleteUserContentV2' test.out

#- 127 AdminUpdateUserContentV2
./ng net.accelbyte.sdk.cli.Main ugc adminUpdateUserContentV2 \
    --channelId 'LStmLGVY' \
    --contentId 'mQxxPW9f' \
    --namespace "$AB_NAMESPACE" \
    --userId 'ipBqhrwc' \
    --body '{"customAttributes": {"qXqtbXmz": {}, "89CgCmE9": {}, "yPMI6IDM": {}}, "name": "CXCPSTta", "shareCode": "br4Z3iSl", "subType": "VN4rqSD7", "tags": ["qmfObGsK", "MKk9lnx8", "5qCUAsKZ"], "type": "q7W7tZcA"}' \
    > test.out 2>&1
eval_tap $? 127 'AdminUpdateUserContentV2' test.out

#- 128 AdminUpdateUserContentFileLocation
./ng net.accelbyte.sdk.cli.Main ugc adminUpdateUserContentFileLocation \
    --channelId 'wJ4HPlty' \
    --contentId 'FM3RtTt7' \
    --namespace "$AB_NAMESPACE" \
    --userId 'sgAE2edB' \
    --body '{"fileExtension": "iEwFIgd1", "fileLocation": "xFmzPnLf"}' \
    > test.out 2>&1
eval_tap $? 128 'AdminUpdateUserContentFileLocation' test.out

#- 129 AdminGenerateUserContentUploadURLV2
./ng net.accelbyte.sdk.cli.Main ugc adminGenerateUserContentUploadURLV2 \
    --channelId 'oMWn4kFE' \
    --contentId 'kH2EeAEr' \
    --namespace "$AB_NAMESPACE" \
    --userId 'f3nwphQl' \
    --body '{"contentType": "iUk4bFz8", "fileExtension": "wZTalUA4"}' \
    > test.out 2>&1
eval_tap $? 129 'AdminGenerateUserContentUploadURLV2' test.out

#- 130 AdminGetContentByUserIDV2
./ng net.accelbyte.sdk.cli.Main ugc adminGetContentByUserIDV2 \
    --namespace "$AB_NAMESPACE" \
    --userId 'nciHzGAW' \
    --limit '63' \
    --offset '91' \
    --sortBy '5hjYBbZ5' \
    > test.out 2>&1
eval_tap $? 130 'AdminGetContentByUserIDV2' test.out

#- 131 AdminUpdateContentHideStatusV2
./ng net.accelbyte.sdk.cli.Main ugc adminUpdateContentHideStatusV2 \
    --contentId 'KJZjjg6E' \
    --namespace "$AB_NAMESPACE" \
    --userId '07CS55Ir' \
    --body '{"isHidden": true}' \
    > test.out 2>&1
eval_tap $? 131 'AdminUpdateContentHideStatusV2' test.out

#- 132 AdminGetUserGroupContentsV2
./ng net.accelbyte.sdk.cli.Main ugc adminGetUserGroupContentsV2 \
    --groupId 'gx76EVoZ' \
    --namespace "$AB_NAMESPACE" \
    --userId '7HzAjFKQ' \
    --limit '33' \
    --offset '27' \
    > test.out 2>&1
eval_tap $? 132 'AdminGetUserGroupContentsV2' test.out

#- 133 AdminListUserStagingContents
./ng net.accelbyte.sdk.cli.Main ugc adminListUserStagingContents \
    --namespace "$AB_NAMESPACE" \
    --userId 'FhVYgjwg' \
    --limit '7' \
    --offset '52' \
    --sortBy 'Rhujnp4u' \
    --status 'NPWY1IjR' \
    > test.out 2>&1
eval_tap $? 133 'AdminListUserStagingContents' test.out

#- 134 PublicGetContentByChannelIDV2
./ng net.accelbyte.sdk.cli.Main ugc publicGetContentByChannelIDV2 \
    --channelId 'NmK7EBq6' \
    --namespace "$AB_NAMESPACE" \
    --limit '98' \
    --name 'OaFcRG4u' \
    --offset '92' \
    --sortBy 'Mf4oH68J' \
    > test.out 2>&1
eval_tap $? 134 'PublicGetContentByChannelIDV2' test.out

#- 135 PublicListContentV2
./ng net.accelbyte.sdk.cli.Main ugc publicListContentV2 \
    --namespace "$AB_NAMESPACE" \
    --isOfficial  \
    --limit '0' \
    --name 'QnbsQRwA' \
    --offset '58' \
    --sortBy 'dm8WXbqa' \
    --subType 'Ge4pKdcV' \
    --tags 'qW7dxc54,7Oi7UxXh,FjK0tBje' \
    --type '91fUV2cV' \
    > test.out 2>&1
eval_tap $? 135 'PublicListContentV2' test.out

#- 136 PublicBulkGetContentByIDV2
./ng net.accelbyte.sdk.cli.Main ugc publicBulkGetContentByIDV2 \
    --namespace "$AB_NAMESPACE" \
    --body '{"contentIds": ["9mwUXP9v", "oAdZpt4b", "DCBCrthT"]}' \
    > test.out 2>&1
eval_tap $? 136 'PublicBulkGetContentByIDV2' test.out

#- 137 PublicGetContentBulkByShareCodesV2
./ng net.accelbyte.sdk.cli.Main ugc publicGetContentBulkByShareCodesV2 \
    --namespace "$AB_NAMESPACE" \
    --body '{"shareCodes": ["lqcl04I2", "2TypqpYb", "lFjQYEs2"]}' \
    > test.out 2>&1
eval_tap $? 137 'PublicGetContentBulkByShareCodesV2' test.out

#- 138 PublicGetContentByShareCodeV2
./ng net.accelbyte.sdk.cli.Main ugc publicGetContentByShareCodeV2 \
    --namespace "$AB_NAMESPACE" \
    --shareCode 'o41L72Xq' \
    > test.out 2>&1
eval_tap $? 138 'PublicGetContentByShareCodeV2' test.out

#- 139 PublicGetContentByIDV2
./ng net.accelbyte.sdk.cli.Main ugc publicGetContentByIDV2 \
    --contentId 'dkr5Wb6C' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 139 'PublicGetContentByIDV2' test.out

#- 140 PublicAddDownloadCountV2
./ng net.accelbyte.sdk.cli.Main ugc publicAddDownloadCountV2 \
    --contentId 'R7EfXteB' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 140 'PublicAddDownloadCountV2' test.out

#- 141 PublicListContentDownloaderV2
./ng net.accelbyte.sdk.cli.Main ugc publicListContentDownloaderV2 \
    --contentId 'ansrvFO3' \
    --namespace "$AB_NAMESPACE" \
    --limit '96' \
    --offset '65' \
    --sortBy 'FJD5u7xu' \
    --userId '9ERp0PVP' \
    > test.out 2>&1
eval_tap $? 141 'PublicListContentDownloaderV2' test.out

#- 142 PublicListContentLikeV2
./ng net.accelbyte.sdk.cli.Main ugc publicListContentLikeV2 \
    --contentId 'MNqlDtAz' \
    --namespace "$AB_NAMESPACE" \
    --limit '87' \
    --offset '25' \
    --sortBy 'qDfY5qJC' \
    > test.out 2>&1
eval_tap $? 142 'PublicListContentLikeV2' test.out

#- 143 UpdateContentLikeStatusV2
./ng net.accelbyte.sdk.cli.Main ugc updateContentLikeStatusV2 \
    --contentId 'kCzAnhUV' \
    --namespace "$AB_NAMESPACE" \
    --body '{"likeStatus": true}' \
    > test.out 2>&1
eval_tap $? 143 'UpdateContentLikeStatusV2' test.out

#- 144 PublicCreateContentV2
./ng net.accelbyte.sdk.cli.Main ugc publicCreateContentV2 \
    --channelId 'fA23yj6K' \
    --namespace "$AB_NAMESPACE" \
    --userId 'jhkiUQ0h' \
    --body '{"contentType": "zV0mvrEQ", "customAttributes": {"F4SD7ZCE": {}, "Ky1lLuGu": {}, "OaaRW2nO": {}}, "fileExtension": "oOHvjtcq", "name": "iM7wO3Pm", "subType": "cQq14YEl", "tags": ["Pcr6uBjX", "84NVOLxe", "FuROgmfz"], "type": "D8qNZ9zw"}' \
    > test.out 2>&1
eval_tap $? 144 'PublicCreateContentV2' test.out

#- 145 PublicUpdateContentByShareCodeV2
./ng net.accelbyte.sdk.cli.Main ugc publicUpdateContentByShareCodeV2 \
    --channelId 'gNjohIIk' \
    --namespace "$AB_NAMESPACE" \
    --shareCode 'jvGyp8Ya' \
    --userId '6rWU4nPN' \
    --body '{"customAttributes": {"zdaJNNfj": {}, "x9BoEwll": {}, "uXRIGs89": {}}, "name": "mL9qH8RI", "subType": "9Ok56GZU", "tags": ["QLX5woWr", "23AeqhOr", "LIHY2v4r"], "type": "284hHG3Q"}' \
    > test.out 2>&1
eval_tap $? 145 'PublicUpdateContentByShareCodeV2' test.out

#- 146 PublicDeleteContentByShareCodeV2
./ng net.accelbyte.sdk.cli.Main ugc publicDeleteContentByShareCodeV2 \
    --channelId 'hE2XegM1' \
    --namespace "$AB_NAMESPACE" \
    --shareCode 'ltGMI0mi' \
    --userId 'xhZeQtlD' \
    > test.out 2>&1
eval_tap $? 146 'PublicDeleteContentByShareCodeV2' test.out

#- 147 PublicDeleteContentV2
./ng net.accelbyte.sdk.cli.Main ugc publicDeleteContentV2 \
    --channelId 'Xkh663tX' \
    --contentId 'uvNHkaPD' \
    --namespace "$AB_NAMESPACE" \
    --userId 'gffxCNgA' \
    > test.out 2>&1
eval_tap $? 147 'PublicDeleteContentV2' test.out

#- 148 PublicUpdateContentV2
./ng net.accelbyte.sdk.cli.Main ugc publicUpdateContentV2 \
    --channelId 'FbiR3kkh' \
    --contentId 'fR2w1NxP' \
    --namespace "$AB_NAMESPACE" \
    --userId 'pFg5QGxK' \
    --body '{"customAttributes": {"qgAdrdse": {}, "k7ho1Z8r": {}, "zln2bggy": {}}, "name": "UbJ9QKDR", "subType": "ilRoPBt3", "tags": ["ZeBBghqb", "r44peNLi", "pfpk9ai4"], "type": "ihvBoogA"}' \
    > test.out 2>&1
eval_tap $? 148 'PublicUpdateContentV2' test.out

#- 149 PublicUpdateContentFileLocation
./ng net.accelbyte.sdk.cli.Main ugc publicUpdateContentFileLocation \
    --channelId 'e2ZlautG' \
    --contentId 'GrG4Amtw' \
    --namespace "$AB_NAMESPACE" \
    --userId '9kFUbniV' \
    --body '{"fileExtension": "LoBKUkW5", "fileLocation": "RNkACAKG"}' \
    > test.out 2>&1
eval_tap $? 149 'PublicUpdateContentFileLocation' test.out

#- 150 UpdateContentShareCodeV2
./ng net.accelbyte.sdk.cli.Main ugc updateContentShareCodeV2 \
    --channelId 'UO8xoufi' \
    --contentId 'o9s2jUZB' \
    --namespace "$AB_NAMESPACE" \
    --userId 'AQTAfMgd' \
    --body '{"shareCode": "P3obNEJP"}' \
    > test.out 2>&1
eval_tap $? 150 'UpdateContentShareCodeV2' test.out

#- 151 PublicGenerateContentUploadURLV2
./ng net.accelbyte.sdk.cli.Main ugc publicGenerateContentUploadURLV2 \
    --channelId 'pQMuzC63' \
    --contentId 'hpjqzYJB' \
    --namespace "$AB_NAMESPACE" \
    --userId 'D8l3nBJi' \
    --body '{"contentType": "CGmbX5jX", "fileExtension": "mqm3gVay"}' \
    > test.out 2>&1
eval_tap $? 151 'PublicGenerateContentUploadURLV2' test.out

#- 152 PublicGetContentByUserIDV2
./ng net.accelbyte.sdk.cli.Main ugc publicGetContentByUserIDV2 \
    --namespace "$AB_NAMESPACE" \
    --userId 'thHd2mtT' \
    --limit '27' \
    --offset '19' \
    --sortBy 'V0qQnckb' \
    > test.out 2>&1
eval_tap $? 152 'PublicGetContentByUserIDV2' test.out

#- 153 UpdateScreenshotsV2
./ng net.accelbyte.sdk.cli.Main ugc updateScreenshotsV2 \
    --contentId 'GdMwImUK' \
    --namespace "$AB_NAMESPACE" \
    --userId 'MMi142Oe' \
    --body '{"screenshots": [{"description": "DAgTAzkH", "screenshotId": "Fy3JuDOf"}, {"description": "fzqWIQgK", "screenshotId": "RyPn9SFX"}, {"description": "t4vWucG0", "screenshotId": "czvk1sTM"}]}' \
    > test.out 2>&1
eval_tap $? 153 'UpdateScreenshotsV2' test.out

#- 154 UploadContentScreenshotV2
./ng net.accelbyte.sdk.cli.Main ugc uploadContentScreenshotV2 \
    --contentId 'kehDjElT' \
    --namespace "$AB_NAMESPACE" \
    --userId 'nyKsa86L' \
    --body '{"screenshots": [{"contentType": "sHhc0ODF", "description": "p7KvfzGw", "fileExtension": "jpg"}, {"contentType": "4o3jq0zN", "description": "DEUC4zTw", "fileExtension": "pjp"}, {"contentType": "SrLunkun", "description": "SjDgCWTv", "fileExtension": "pjp"}]}' \
    > test.out 2>&1
eval_tap $? 154 'UploadContentScreenshotV2' test.out

#- 155 DeleteContentScreenshotV2
./ng net.accelbyte.sdk.cli.Main ugc deleteContentScreenshotV2 \
    --contentId 'fphRekxh' \
    --namespace "$AB_NAMESPACE" \
    --screenshotId '3eeogEez' \
    --userId 'zZ74Qpqe' \
    > test.out 2>&1
eval_tap $? 155 'DeleteContentScreenshotV2' test.out

#- 156 PublicGetGroupContentsV2
./ng net.accelbyte.sdk.cli.Main ugc publicGetGroupContentsV2 \
    --groupId 'dMl8d0Qo' \
    --namespace "$AB_NAMESPACE" \
    --userId 'dDz61osy' \
    --limit '19' \
    --offset '96' \
    > test.out 2>&1
eval_tap $? 156 'PublicGetGroupContentsV2' test.out

#- 157 ListUserStagingContents
./ng net.accelbyte.sdk.cli.Main ugc listUserStagingContents \
    --namespace "$AB_NAMESPACE" \
    --userId '01ukdgoB' \
    --limit '64' \
    --offset '94' \
    --sortBy '6WICMxWS' \
    --status 'phwpBd9h' \
    > test.out 2>&1
eval_tap $? 157 'ListUserStagingContents' test.out

#- 158 GetUserStagingContentByID
./ng net.accelbyte.sdk.cli.Main ugc getUserStagingContentByID \
    --contentId '1v4WZXsn' \
    --namespace "$AB_NAMESPACE" \
    --userId 'G8KRsnJa' \
    > test.out 2>&1
eval_tap $? 158 'GetUserStagingContentByID' test.out

#- 159 UpdateStagingContent
./ng net.accelbyte.sdk.cli.Main ugc updateStagingContent \
    --contentId 'OwG30N1r' \
    --namespace "$AB_NAMESPACE" \
    --userId 'hTMJFAQc' \
    --body '{"fileExtension": "IUfGwGQk", "fileLocation": "5NN8cwXl"}' \
    > test.out 2>&1
eval_tap $? 159 'UpdateStagingContent' test.out

#- 160 DeleteUserStagingContentByID
./ng net.accelbyte.sdk.cli.Main ugc deleteUserStagingContentByID \
    --contentId 'jMwzWt2K' \
    --namespace "$AB_NAMESPACE" \
    --userId 'QdrVZwtM' \
    > test.out 2>&1
eval_tap $? 160 'DeleteUserStagingContentByID' test.out


rm -f "tmp.dat"

exit $EXIT_CODE