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
    --limit '97' \
    --offset '46' \
    > test.out 2>&1
eval_tap $? 2 'SingleAdminGetChannel' test.out

#- 3 AdminCreateChannel
./ng net.accelbyte.sdk.cli.Main ugc adminCreateChannel \
    --namespace "$AB_NAMESPACE" \
    --body '{"id": "rulcQ8DZ", "name": "qRppMPil"}' \
    > test.out 2>&1
eval_tap $? 3 'AdminCreateChannel' test.out

#- 4 SingleAdminUpdateChannel
./ng net.accelbyte.sdk.cli.Main ugc singleAdminUpdateChannel \
    --channelId 'Y903o1nK' \
    --namespace "$AB_NAMESPACE" \
    --body '{"name": "GjRxZb4J"}' \
    > test.out 2>&1
eval_tap $? 4 'SingleAdminUpdateChannel' test.out

#- 5 SingleAdminDeleteChannel
./ng net.accelbyte.sdk.cli.Main ugc singleAdminDeleteChannel \
    --channelId '1XZKKn7G' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 5 'SingleAdminDeleteChannel' test.out

#- 6 AdminUploadContentDirect
eval_tap 0 6 'AdminUploadContentDirect # SKIP deprecated' test.out

#- 7 AdminUploadContentS3
./ng net.accelbyte.sdk.cli.Main ugc adminUploadContentS3 \
    --channelId '1JdFS8w8' \
    --namespace "$AB_NAMESPACE" \
    --body '{"contentType": "2IpUZgte", "customAttributes": {"IEQ5OECI": {}, "9DaxMkJg": {}, "nx7g8MFr": {}}, "fileExtension": "22u7ie9E", "name": "VKFDCtmj", "preview": "P7rLeQwG", "previewMetadata": {"previewContentType": "zzxzpGjP", "previewFileExtension": "aJz1mCfa"}, "shareCode": "CzZYjUD6", "subType": "30ZPxeit", "tags": ["4kDMeK5n", "R1LvezTY", "W2UpGAJ5"], "type": "0L8caUgi"}' \
    > test.out 2>&1
eval_tap $? 7 'AdminUploadContentS3' test.out

#- 8 SingleAdminUpdateContentS3
./ng net.accelbyte.sdk.cli.Main ugc singleAdminUpdateContentS3 \
    --channelId 'Wyr0kE2Z' \
    --contentId 'ZGlgu5gq' \
    --namespace "$AB_NAMESPACE" \
    --body '{"contentType": "21pDlclZ", "customAttributes": {"WptAjnxW": {}, "C6fZ8AvZ": {}, "WhnSgc75": {}}, "fileExtension": "MHKKO3l8", "name": "sjdmE4Op", "payload": "mg0zzf0W", "preview": "7FxWFlX1", "previewMetadata": {"previewContentType": "1sQKCC1Q", "previewFileExtension": "mbTMPgCa"}, "shareCode": "C3JScE8V", "subType": "4s3h9MmW", "tags": ["ITZMMn0H", "YvnwfAhO", "CHyEijAl"], "type": "B96ID58X", "updateContentFile": true}' \
    > test.out 2>&1
eval_tap $? 8 'SingleAdminUpdateContentS3' test.out

#- 9 AdminSearchChannelSpecificContent
./ng net.accelbyte.sdk.cli.Main ugc adminSearchChannelSpecificContent \
    --channelId 'd4gKnaQc' \
    --namespace "$AB_NAMESPACE" \
    --creator 'Q5aSKjzB' \
    --ishidden 'Jj9rHFy9' \
    --isofficial '5N1eOGdo' \
    --limit '36' \
    --name 'QgtagvJC' \
    --offset '27' \
    --orderby 'e2LQiBtW' \
    --sortby 'LX10kiWp' \
    --subtype 'cRPAh5aM' \
    --tags 'rv7MQpFl,O3lKSZJV,54tR8X7b' \
    --type 'fqjx4Uc1' \
    --userId '583E6sYQ' \
    > test.out 2>&1
eval_tap $? 9 'AdminSearchChannelSpecificContent' test.out

#- 10 SingleAdminUpdateContentDirect
eval_tap 0 10 'SingleAdminUpdateContentDirect # SKIP deprecated' test.out

#- 11 SingleAdminDeleteContent
./ng net.accelbyte.sdk.cli.Main ugc singleAdminDeleteContent \
    --channelId 'vrpvk4nd' \
    --contentId 'Bc0lnEGh' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 11 'SingleAdminDeleteContent' test.out

#- 12 SingleAdminGetContent
./ng net.accelbyte.sdk.cli.Main ugc singleAdminGetContent \
    --namespace "$AB_NAMESPACE" \
    --limit '42' \
    --offset '59' \
    > test.out 2>&1
eval_tap $? 12 'SingleAdminGetContent' test.out

#- 13 AdminGetContentBulk
./ng net.accelbyte.sdk.cli.Main ugc adminGetContentBulk \
    --namespace "$AB_NAMESPACE" \
    --body '{"contentIds": ["PiTY1Bag", "wVNDy9Om", "DcpfJjdY"]}' \
    > test.out 2>&1
eval_tap $? 13 'AdminGetContentBulk' test.out

#- 14 AdminSearchContent
./ng net.accelbyte.sdk.cli.Main ugc adminSearchContent \
    --namespace "$AB_NAMESPACE" \
    --creator 'NQgpk7u3' \
    --ishidden 'kZ1YxXL2' \
    --isofficial 'rgntRLgV' \
    --limit '20' \
    --name 'npbUUZWd' \
    --offset '55' \
    --orderby 'ztllbWyp' \
    --sortby 'IiLfI5jn' \
    --subtype 'kOOZAmmu' \
    --tags 'mUPtfeQL,UWwYiRF7,0aboHbLK' \
    --type 'aTqdxkJd' \
    --userId 'upDXu1Eq' \
    > test.out 2>&1
eval_tap $? 14 'AdminSearchContent' test.out

#- 15 AdminGetContentBulkByShareCodes
./ng net.accelbyte.sdk.cli.Main ugc adminGetContentBulkByShareCodes \
    --namespace "$AB_NAMESPACE" \
    --body '{"shareCodes": ["6nVfVimQ", "1GrCpMsK", "3VNgjMxZ"]}' \
    > test.out 2>&1
eval_tap $? 15 'AdminGetContentBulkByShareCodes' test.out

#- 16 AdminGetUserContentByShareCode
./ng net.accelbyte.sdk.cli.Main ugc adminGetUserContentByShareCode \
    --namespace "$AB_NAMESPACE" \
    --shareCode 'rEHigClO' \
    > test.out 2>&1
eval_tap $? 16 'AdminGetUserContentByShareCode' test.out

#- 17 AdminGetSpecificContent
./ng net.accelbyte.sdk.cli.Main ugc adminGetSpecificContent \
    --contentId 'sLdRmt7L' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 17 'AdminGetSpecificContent' test.out

#- 18 AdminDownloadContentPreview
./ng net.accelbyte.sdk.cli.Main ugc adminDownloadContentPreview \
    --contentId 'XsCw98tU' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 18 'AdminDownloadContentPreview' test.out

#- 19 RollbackContentVersion
./ng net.accelbyte.sdk.cli.Main ugc rollbackContentVersion \
    --contentId 'WuGWcaM8' \
    --namespace "$AB_NAMESPACE" \
    --versionId 'v477yZIo' \
    > test.out 2>&1
eval_tap $? 19 'RollbackContentVersion' test.out

#- 20 AdminUpdateScreenshots
./ng net.accelbyte.sdk.cli.Main ugc adminUpdateScreenshots \
    --contentId 'BmVGZXD7' \
    --namespace "$AB_NAMESPACE" \
    --body '{"screenshots": [{"description": "VgeBBoyP", "screenshotId": "njSpp29W"}, {"description": "o2PZA3gl", "screenshotId": "nPApB9ZX"}, {"description": "Abul7T9z", "screenshotId": "Oj19ngnU"}]}' \
    > test.out 2>&1
eval_tap $? 20 'AdminUpdateScreenshots' test.out

#- 21 AdminUploadContentScreenshot
./ng net.accelbyte.sdk.cli.Main ugc adminUploadContentScreenshot \
    --contentId 'HkRxWhHX' \
    --namespace "$AB_NAMESPACE" \
    --body '{"screenshots": [{"contentType": "wXE5X4mP", "description": "uSJutWxI", "fileExtension": "png"}, {"contentType": "ELhiKWGr", "description": "sD7O39pl", "fileExtension": "bmp"}, {"contentType": "dV1vldUd", "description": "X2UGVJhE", "fileExtension": "bmp"}]}' \
    > test.out 2>&1
eval_tap $? 21 'AdminUploadContentScreenshot' test.out

#- 22 AdminDeleteContentScreenshot
./ng net.accelbyte.sdk.cli.Main ugc adminDeleteContentScreenshot \
    --contentId '28vikRrS' \
    --namespace "$AB_NAMESPACE" \
    --screenshotId 'sdrdd63o' \
    > test.out 2>&1
eval_tap $? 22 'AdminDeleteContentScreenshot' test.out

#- 23 ListContentVersions
./ng net.accelbyte.sdk.cli.Main ugc listContentVersions \
    --contentId 'DHMfVT8a' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 23 'ListContentVersions' test.out

#- 24 SingleAdminGetAllGroups
./ng net.accelbyte.sdk.cli.Main ugc singleAdminGetAllGroups \
    --namespace "$AB_NAMESPACE" \
    --limit '59' \
    --offset '3' \
    > test.out 2>&1
eval_tap $? 24 'SingleAdminGetAllGroups' test.out

#- 25 AdminCreateGroup
./ng net.accelbyte.sdk.cli.Main ugc adminCreateGroup \
    --namespace "$AB_NAMESPACE" \
    --body '{"contents": ["20dOUwRx", "T21CKKTa", "OFceq8TD"], "name": "ykfL1iis"}' \
    > test.out 2>&1
eval_tap $? 25 'AdminCreateGroup' test.out

#- 26 SingleAdminGetGroup
./ng net.accelbyte.sdk.cli.Main ugc singleAdminGetGroup \
    --groupId 'H3NGahuq' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 26 'SingleAdminGetGroup' test.out

#- 27 SingleAdminUpdateGroup
./ng net.accelbyte.sdk.cli.Main ugc singleAdminUpdateGroup \
    --groupId 'UwpFMBmw' \
    --namespace "$AB_NAMESPACE" \
    --body '{"contents": ["tlhdA9UM", "srnPXxrX", "IadMy3i1"], "name": "XJOuFJIv"}' \
    > test.out 2>&1
eval_tap $? 27 'SingleAdminUpdateGroup' test.out

#- 28 SingleAdminDeleteGroup
./ng net.accelbyte.sdk.cli.Main ugc singleAdminDeleteGroup \
    --groupId 'cSWwlFwx' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 28 'SingleAdminDeleteGroup' test.out

#- 29 SingleAdminGetGroupContents
./ng net.accelbyte.sdk.cli.Main ugc singleAdminGetGroupContents \
    --groupId 'mzb6icwQ' \
    --namespace "$AB_NAMESPACE" \
    --limit '32' \
    --offset '11' \
    > test.out 2>&1
eval_tap $? 29 'SingleAdminGetGroupContents' test.out

#- 30 AdminGetTag
./ng net.accelbyte.sdk.cli.Main ugc adminGetTag \
    --namespace "$AB_NAMESPACE" \
    --limit '43' \
    --offset '39' \
    > test.out 2>&1
eval_tap $? 30 'AdminGetTag' test.out

#- 31 AdminCreateTag
./ng net.accelbyte.sdk.cli.Main ugc adminCreateTag \
    --namespace "$AB_NAMESPACE" \
    --body '{"tag": "ZulTRaqZ"}' \
    > test.out 2>&1
eval_tap $? 31 'AdminCreateTag' test.out

#- 32 AdminUpdateTag
./ng net.accelbyte.sdk.cli.Main ugc adminUpdateTag \
    --namespace "$AB_NAMESPACE" \
    --tagId 'VzVDIbH3' \
    --body '{"tag": "VFVRFf2j"}' \
    > test.out 2>&1
eval_tap $? 32 'AdminUpdateTag' test.out

#- 33 AdminDeleteTag
./ng net.accelbyte.sdk.cli.Main ugc adminDeleteTag \
    --namespace "$AB_NAMESPACE" \
    --tagId 'mgXv3wHD' \
    > test.out 2>&1
eval_tap $? 33 'AdminDeleteTag' test.out

#- 34 AdminGetType
./ng net.accelbyte.sdk.cli.Main ugc adminGetType \
    --namespace "$AB_NAMESPACE" \
    --limit '45' \
    --offset '76' \
    > test.out 2>&1
eval_tap $? 34 'AdminGetType' test.out

#- 35 AdminCreateType
./ng net.accelbyte.sdk.cli.Main ugc adminCreateType \
    --namespace "$AB_NAMESPACE" \
    --body '{"subtype": ["S2cTQ5yL", "Hygr4Xpm", "pI9NrF4W"], "type": "qbku1Y5Q"}' \
    > test.out 2>&1
eval_tap $? 35 'AdminCreateType' test.out

#- 36 AdminUpdateType
./ng net.accelbyte.sdk.cli.Main ugc adminUpdateType \
    --namespace "$AB_NAMESPACE" \
    --typeId '3CZEByeM' \
    --body '{"subtype": ["JOChoofT", "ICzS7P05", "e7K3ItaG"], "type": "FAmf8ZcI"}' \
    > test.out 2>&1
eval_tap $? 36 'AdminUpdateType' test.out

#- 37 AdminDeleteType
./ng net.accelbyte.sdk.cli.Main ugc adminDeleteType \
    --namespace "$AB_NAMESPACE" \
    --typeId 'RDmXMbym' \
    > test.out 2>&1
eval_tap $? 37 'AdminDeleteType' test.out

#- 38 AdminGetChannel
./ng net.accelbyte.sdk.cli.Main ugc adminGetChannel \
    --namespace "$AB_NAMESPACE" \
    --userId 'p6LOAzrk' \
    --limit '6' \
    --name 'WikFMRoU' \
    --offset '6' \
    > test.out 2>&1
eval_tap $? 38 'AdminGetChannel' test.out

#- 39 AdminDeleteAllUserChannels
./ng net.accelbyte.sdk.cli.Main ugc adminDeleteAllUserChannels \
    --namespace "$AB_NAMESPACE" \
    --userId 'e8zLgGut' \
    > test.out 2>&1
eval_tap $? 39 'AdminDeleteAllUserChannels' test.out

#- 40 AdminUpdateChannel
./ng net.accelbyte.sdk.cli.Main ugc adminUpdateChannel \
    --channelId 'Zp4NbYQd' \
    --namespace "$AB_NAMESPACE" \
    --userId 'Q9rPU10B' \
    --body '{"name": "4CQMcLyV"}' \
    > test.out 2>&1
eval_tap $? 40 'AdminUpdateChannel' test.out

#- 41 AdminDeleteChannel
./ng net.accelbyte.sdk.cli.Main ugc adminDeleteChannel \
    --channelId 'nd0Cuyfk' \
    --namespace "$AB_NAMESPACE" \
    --userId 'SJahuQuJ' \
    > test.out 2>&1
eval_tap $? 41 'AdminDeleteChannel' test.out

#- 42 AdminUpdateContentS3ByShareCode
./ng net.accelbyte.sdk.cli.Main ugc adminUpdateContentS3ByShareCode \
    --channelId 'gAQXODc7' \
    --namespace "$AB_NAMESPACE" \
    --shareCode 'vBPNTSqH' \
    --userId 'jsQZ7hRt' \
    --body '{"contentType": "gJwihzal", "customAttributes": {"Tn1JA9Is": {}, "9wAZ5iq5": {}, "UMrhZMp8": {}}, "fileExtension": "CJ72PTZT", "name": "T3duWOJ7", "payload": "QbAw0UKF", "preview": "4NEi7mwo", "previewMetadata": {"previewContentType": "CLj2g1EE", "previewFileExtension": "4XSa7aM0"}, "shareCode": "nzKdwEEr", "subType": "1nQwicFe", "tags": ["ZSRp5bWO", "dIQH6i2P", "3xWCzXN4"], "type": "u3jXMbTt", "updateContentFile": true}' \
    > test.out 2>&1
eval_tap $? 42 'AdminUpdateContentS3ByShareCode' test.out

#- 43 AdminUpdateContentS3
./ng net.accelbyte.sdk.cli.Main ugc adminUpdateContentS3 \
    --channelId 'p9XWn57a' \
    --contentId 'ay0WvblD' \
    --namespace "$AB_NAMESPACE" \
    --userId 'cralM9AW' \
    --body '{"contentType": "QCbwYHhD", "customAttributes": {"Yjdgv60U": {}, "ciVy316i": {}, "R9RmgYVB": {}}, "fileExtension": "mYIWvrmr", "name": "OrR7fh1A", "payload": "LmN4X1Tf", "preview": "vEG2ZpTN", "previewMetadata": {"previewContentType": "QCUrEQiA", "previewFileExtension": "J7tNwFbr"}, "shareCode": "CwslaQoy", "subType": "GxOMoocA", "tags": ["Esi7k0VF", "FB48CFAo", "nisq06qK"], "type": "fceYb0fH", "updateContentFile": true}' \
    > test.out 2>&1
eval_tap $? 43 'AdminUpdateContentS3' test.out

#- 44 DeleteContentByShareCode
./ng net.accelbyte.sdk.cli.Main ugc deleteContentByShareCode \
    --channelId 'ekKwto3j' \
    --namespace "$AB_NAMESPACE" \
    --shareCode 't4D6wN2k' \
    --userId 'lwhmVV85' \
    > test.out 2>&1
eval_tap $? 44 'DeleteContentByShareCode' test.out

#- 45 AdminUpdateContentDirect
eval_tap 0 45 'AdminUpdateContentDirect # SKIP deprecated' test.out

#- 46 AdminDeleteContent
./ng net.accelbyte.sdk.cli.Main ugc adminDeleteContent \
    --channelId 'ejbxAGMA' \
    --contentId 'iGEqSOFA' \
    --namespace "$AB_NAMESPACE" \
    --userId 'gd5vMiWI' \
    > test.out 2>&1
eval_tap $? 46 'AdminDeleteContent' test.out

#- 47 AdminGetContent
./ng net.accelbyte.sdk.cli.Main ugc adminGetContent \
    --namespace "$AB_NAMESPACE" \
    --userId '6j6GRSXa' \
    --limit '52' \
    --offset '35' \
    > test.out 2>&1
eval_tap $? 47 'AdminGetContent' test.out

#- 48 AdminDeleteAllUserContents
./ng net.accelbyte.sdk.cli.Main ugc adminDeleteAllUserContents \
    --namespace "$AB_NAMESPACE" \
    --userId 'c6VqoZNm' \
    > test.out 2>&1
eval_tap $? 48 'AdminDeleteAllUserContents' test.out

#- 49 AdminHideUserContent
./ng net.accelbyte.sdk.cli.Main ugc adminHideUserContent \
    --contentId 'FtTcu9SS' \
    --namespace "$AB_NAMESPACE" \
    --userId 'Oqv8ruE5' \
    --body '{"isHidden": false}' \
    > test.out 2>&1
eval_tap $? 49 'AdminHideUserContent' test.out

#- 50 AdminGetAllGroups
./ng net.accelbyte.sdk.cli.Main ugc adminGetAllGroups \
    --namespace "$AB_NAMESPACE" \
    --userId 'gYRZJ8NP' \
    --limit '72' \
    --offset '55' \
    > test.out 2>&1
eval_tap $? 50 'AdminGetAllGroups' test.out

#- 51 AdminDeleteAllUserGroup
./ng net.accelbyte.sdk.cli.Main ugc adminDeleteAllUserGroup \
    --namespace "$AB_NAMESPACE" \
    --userId 'KYn8fpf6' \
    > test.out 2>&1
eval_tap $? 51 'AdminDeleteAllUserGroup' test.out

#- 52 AdminGetGroup
./ng net.accelbyte.sdk.cli.Main ugc adminGetGroup \
    --groupId 'h1hj0trr' \
    --namespace "$AB_NAMESPACE" \
    --userId 'WOsPpTrA' \
    > test.out 2>&1
eval_tap $? 52 'AdminGetGroup' test.out

#- 53 AdminUpdateGroup
./ng net.accelbyte.sdk.cli.Main ugc adminUpdateGroup \
    --groupId 'L8Fld2AP' \
    --namespace "$AB_NAMESPACE" \
    --userId '92drSBIe' \
    --body '{"contents": ["7yGfkp6g", "BSrDpGIy", "R4W6cHTE"], "name": "NNRYMepg"}' \
    > test.out 2>&1
eval_tap $? 53 'AdminUpdateGroup' test.out

#- 54 AdminDeleteGroup
./ng net.accelbyte.sdk.cli.Main ugc adminDeleteGroup \
    --groupId '5xw7FQgE' \
    --namespace "$AB_NAMESPACE" \
    --userId 'DuFGiuws' \
    > test.out 2>&1
eval_tap $? 54 'AdminDeleteGroup' test.out

#- 55 AdminGetGroupContents
./ng net.accelbyte.sdk.cli.Main ugc adminGetGroupContents \
    --groupId 'LzM9aVXI' \
    --namespace "$AB_NAMESPACE" \
    --userId 'NhhLZUWJ' \
    --limit '12' \
    --offset '65' \
    > test.out 2>&1
eval_tap $? 55 'AdminGetGroupContents' test.out

#- 56 AdminDeleteAllUserStates
./ng net.accelbyte.sdk.cli.Main ugc adminDeleteAllUserStates \
    --namespace "$AB_NAMESPACE" \
    --userId 's5kYbsPs' \
    > test.out 2>&1
eval_tap $? 56 'AdminDeleteAllUserStates' test.out

#- 57 SearchChannelSpecificContent
./ng net.accelbyte.sdk.cli.Main ugc searchChannelSpecificContent \
    --channelId 'gBjNJM5q' \
    --namespace "$AB_NAMESPACE" \
    --creator 'AEORRyoz' \
    --ishidden '7yCTc8BG' \
    --isofficial 'qsCYODSn' \
    --limit '27' \
    --name 'p0WGR4Iw' \
    --offset '65' \
    --orderby 'frctmbJo' \
    --sortby '4W57Ucxm' \
    --subtype 'IyTVyMV5' \
    --tags 'omcX2MGX,khfUKyqW,nlf8ROGX' \
    --type '7CIOC87p' \
    --userId 'aDBQf46p' \
    > test.out 2>&1
eval_tap $? 57 'SearchChannelSpecificContent' test.out

#- 58 PublicSearchContent
./ng net.accelbyte.sdk.cli.Main ugc publicSearchContent \
    --namespace "$AB_NAMESPACE" \
    --creator 'taZNXUci' \
    --ishidden 'YJQxue4d' \
    --isofficial 'Hn9NDJ6o' \
    --limit '25' \
    --name 'qlUq1FDr' \
    --offset '77' \
    --orderby 'SpHk9hFr' \
    --sortby 'ZXv7OPdP' \
    --subtype 'Tok6YdvB' \
    --tags 'A5cBJYhl,VOWeoizv,UqhJvDam' \
    --type 'SFwoWMzm' \
    --userId 'eF7YatoN' \
    > test.out 2>&1
eval_tap $? 58 'PublicSearchContent' test.out

#- 59 PublicGetContentBulk
./ng net.accelbyte.sdk.cli.Main ugc publicGetContentBulk \
    --namespace "$AB_NAMESPACE" \
    --body '{"contentIds": ["ElaYiDsi", "AzvYBEe9", "TWgJytUX"]}' \
    > test.out 2>&1
eval_tap $? 59 'PublicGetContentBulk' test.out

#- 60 GetFollowedContent
./ng net.accelbyte.sdk.cli.Main ugc getFollowedContent \
    --namespace "$AB_NAMESPACE" \
    --limit '81' \
    --offset '62' \
    > test.out 2>&1
eval_tap $? 60 'GetFollowedContent' test.out

#- 61 GetLikedContent
./ng net.accelbyte.sdk.cli.Main ugc getLikedContent \
    --namespace "$AB_NAMESPACE" \
    --isofficial  \
    --limit '64' \
    --name '8LHKd43b' \
    --offset '55' \
    --orderby 'FW8ZWRW2' \
    --sortby 'OayZn7xc' \
    --subtype 'FG7Tx74e' \
    --tags 'gsIqhbnq,Dmrt3r21,7kLUMVLW' \
    --type 'jYyHGhBZ' \
    > test.out 2>&1
eval_tap $? 61 'GetLikedContent' test.out

#- 62 PublicGetContentBulkByShareCodes
./ng net.accelbyte.sdk.cli.Main ugc publicGetContentBulkByShareCodes \
    --namespace "$AB_NAMESPACE" \
    --body '{"shareCodes": ["2iXE75jl", "iZABcLfe", "bCMWcagA"]}' \
    > test.out 2>&1
eval_tap $? 62 'PublicGetContentBulkByShareCodes' test.out

#- 63 PublicDownloadContentByShareCode
./ng net.accelbyte.sdk.cli.Main ugc publicDownloadContentByShareCode \
    --namespace "$AB_NAMESPACE" \
    --shareCode 'dfHONlQZ' \
    > test.out 2>&1
eval_tap $? 63 'PublicDownloadContentByShareCode' test.out

#- 64 PublicDownloadContentByContentID
./ng net.accelbyte.sdk.cli.Main ugc publicDownloadContentByContentID \
    --contentId 'mbOEhcjG' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 64 'PublicDownloadContentByContentID' test.out

#- 65 AddDownloadCount
./ng net.accelbyte.sdk.cli.Main ugc addDownloadCount \
    --contentId 'pN6xdqWs' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 65 'AddDownloadCount' test.out

#- 66 UpdateContentLikeStatus
./ng net.accelbyte.sdk.cli.Main ugc updateContentLikeStatus \
    --contentId '2e4PPjsP' \
    --namespace "$AB_NAMESPACE" \
    --body '{"likeStatus": false}' \
    > test.out 2>&1
eval_tap $? 66 'UpdateContentLikeStatus' test.out

#- 67 PublicDownloadContentPreview
./ng net.accelbyte.sdk.cli.Main ugc publicDownloadContentPreview \
    --contentId 'FtqMthVv' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 67 'PublicDownloadContentPreview' test.out

#- 68 GetTag
./ng net.accelbyte.sdk.cli.Main ugc getTag \
    --namespace "$AB_NAMESPACE" \
    --limit '78' \
    --offset '11' \
    > test.out 2>&1
eval_tap $? 68 'GetTag' test.out

#- 69 GetType
./ng net.accelbyte.sdk.cli.Main ugc getType \
    --namespace "$AB_NAMESPACE" \
    --limit '27' \
    --offset '85' \
    > test.out 2>&1
eval_tap $? 69 'GetType' test.out

#- 70 PublicSearchCreator
./ng net.accelbyte.sdk.cli.Main ugc publicSearchCreator \
    --namespace "$AB_NAMESPACE" \
    --limit '40' \
    --offset '10' \
    --orderby 'hEWJ2Ubk' \
    --sortby 'DfNx4PMz' \
    > test.out 2>&1
eval_tap $? 70 'PublicSearchCreator' test.out

#- 71 GetFollowedUsers
./ng net.accelbyte.sdk.cli.Main ugc getFollowedUsers \
    --namespace "$AB_NAMESPACE" \
    --limit '66' \
    --offset '33' \
    > test.out 2>&1
eval_tap $? 71 'GetFollowedUsers' test.out

#- 72 PublicGetCreator
./ng net.accelbyte.sdk.cli.Main ugc publicGetCreator \
    --namespace "$AB_NAMESPACE" \
    --userId 'jrU5JaJc' \
    > test.out 2>&1
eval_tap $? 72 'PublicGetCreator' test.out

#- 73 GetChannels
./ng net.accelbyte.sdk.cli.Main ugc getChannels \
    --namespace "$AB_NAMESPACE" \
    --userId '7cL7n6z0' \
    --limit '61' \
    --name '6BL20RTL' \
    --offset '96' \
    > test.out 2>&1
eval_tap $? 73 'GetChannels' test.out

#- 74 PublicCreateChannel
./ng net.accelbyte.sdk.cli.Main ugc publicCreateChannel \
    --namespace "$AB_NAMESPACE" \
    --userId 'mVPzgpcC' \
    --body '{"name": "kfhM36qx"}' \
    > test.out 2>&1
eval_tap $? 74 'PublicCreateChannel' test.out

#- 75 DeleteAllUserChannel
./ng net.accelbyte.sdk.cli.Main ugc deleteAllUserChannel \
    --namespace "$AB_NAMESPACE" \
    --userId 'oiCqOf5y' \
    > test.out 2>&1
eval_tap $? 75 'DeleteAllUserChannel' test.out

#- 76 UpdateChannel
./ng net.accelbyte.sdk.cli.Main ugc updateChannel \
    --channelId '6q83xqry' \
    --namespace "$AB_NAMESPACE" \
    --userId 'mmq80HQw' \
    --body '{"name": "Oa35RvVr"}' \
    > test.out 2>&1
eval_tap $? 76 'UpdateChannel' test.out

#- 77 DeleteChannel
./ng net.accelbyte.sdk.cli.Main ugc deleteChannel \
    --channelId 'vQeTOZrw' \
    --namespace "$AB_NAMESPACE" \
    --userId 'KG1hSQzI' \
    > test.out 2>&1
eval_tap $? 77 'DeleteChannel' test.out

#- 78 CreateContentDirect
eval_tap 0 78 'CreateContentDirect # SKIP deprecated' test.out

#- 79 CreateContentS3
./ng net.accelbyte.sdk.cli.Main ugc createContentS3 \
    --channelId 'Dmk6DzjW' \
    --namespace "$AB_NAMESPACE" \
    --userId 'rhi36NWa' \
    --body '{"contentType": "bxehV3lO", "customAttributes": {"mYuDcR06": {}, "YaBXGazB": {}, "KponUrwp": {}}, "fileExtension": "2WWmYIT5", "name": "21EIUzPM", "preview": "09JZWXu0", "previewMetadata": {"previewContentType": "eesc1Ajs", "previewFileExtension": "bGaFagpv"}, "subType": "nrnRqNBd", "tags": ["iAsPfHTI", "iSFX8d0J", "Rtl3ofGb"], "type": "5tasHa14"}' \
    > test.out 2>&1
eval_tap $? 79 'CreateContentS3' test.out

#- 80 PublicUpdateContentByShareCode
./ng net.accelbyte.sdk.cli.Main ugc publicUpdateContentByShareCode \
    --channelId 'zRtra0c8' \
    --namespace "$AB_NAMESPACE" \
    --shareCode 'qd8EAEuV' \
    --userId 'U9jD6CYm' \
    --body '{"contentType": "mNpdoFZi", "customAttributes": {"cAM3xGgy": {}, "d9f5mZtH": {}, "Pvk8jtOJ": {}}, "fileExtension": "d6zw7PRZ", "name": "Ez56fsDq", "payload": "Ow03UqnN", "preview": "TpX1Veaq", "previewMetadata": {"previewContentType": "VnHVN7be", "previewFileExtension": "tJFkbpqj"}, "subType": "DUoguFRP", "tags": ["Oiz2EVW3", "z0OOiJEi", "HbX4C2rb"], "type": "faNFo69j", "updateContentFile": false}' \
    > test.out 2>&1
eval_tap $? 80 'PublicUpdateContentByShareCode' test.out

#- 81 UpdateContentS3
./ng net.accelbyte.sdk.cli.Main ugc updateContentS3 \
    --channelId 'xkjjMqNx' \
    --contentId '35iyOA0H' \
    --namespace "$AB_NAMESPACE" \
    --userId 'pY3Al5LX' \
    --body '{"contentType": "Kx5Xn1Fz", "customAttributes": {"ERz4TIJv": {}, "R7XI5snN": {}, "uHHBt1Pe": {}}, "fileExtension": "NR1bVOGe", "name": "9WdgK0Dt", "payload": "VL6a10hO", "preview": "TJJKm3OY", "previewMetadata": {"previewContentType": "b5iZV7oP", "previewFileExtension": "7cOIyZW6"}, "subType": "heGcViMf", "tags": ["wYkVbxIC", "epOr0Dov", "ItDJE9d2"], "type": "5sOt7ACp", "updateContentFile": true}' \
    > test.out 2>&1
eval_tap $? 81 'UpdateContentS3' test.out

#- 82 PublicDeleteContentByShareCode
./ng net.accelbyte.sdk.cli.Main ugc publicDeleteContentByShareCode \
    --channelId 'gWPrbqKM' \
    --namespace "$AB_NAMESPACE" \
    --shareCode 'jdUZcyal' \
    --userId 'oPN7Gfsr' \
    > test.out 2>&1
eval_tap $? 82 'PublicDeleteContentByShareCode' test.out

#- 83 UpdateContentDirect
eval_tap 0 83 'UpdateContentDirect # SKIP deprecated' test.out

#- 84 DeleteContent
./ng net.accelbyte.sdk.cli.Main ugc deleteContent \
    --channelId 'CTT1moKb' \
    --contentId 'GEl1N2Z0' \
    --namespace "$AB_NAMESPACE" \
    --userId 'zdYWx6zK' \
    > test.out 2>&1
eval_tap $? 84 'DeleteContent' test.out

#- 85 UpdateContentShareCode
./ng net.accelbyte.sdk.cli.Main ugc updateContentShareCode \
    --channelId 'AjJNuHir' \
    --contentId 'JFeO2MQY' \
    --namespace "$AB_NAMESPACE" \
    --userId 'SPoXSjhn' \
    --body '{"shareCode": "omufbTnU"}' \
    > test.out 2>&1
eval_tap $? 85 'UpdateContentShareCode' test.out

#- 86 PublicGetUserContent
./ng net.accelbyte.sdk.cli.Main ugc publicGetUserContent \
    --namespace "$AB_NAMESPACE" \
    --userId 'uoZil67c' \
    --limit '82' \
    --offset '58' \
    > test.out 2>&1
eval_tap $? 86 'PublicGetUserContent' test.out

#- 87 DeleteAllUserContents
./ng net.accelbyte.sdk.cli.Main ugc deleteAllUserContents \
    --namespace "$AB_NAMESPACE" \
    --userId 'GKAM3d1z' \
    > test.out 2>&1
eval_tap $? 87 'DeleteAllUserContents' test.out

#- 88 UpdateScreenshots
./ng net.accelbyte.sdk.cli.Main ugc updateScreenshots \
    --contentId 'pFFPMbGR' \
    --namespace "$AB_NAMESPACE" \
    --userId 'zZuCLfzW' \
    --body '{"screenshots": [{"description": "U12H5P63", "screenshotId": "1unYUzO0"}, {"description": "vsEGDIoH", "screenshotId": "g2cJXksH"}, {"description": "OQ0DetPl", "screenshotId": "VkZWIJiq"}]}' \
    > test.out 2>&1
eval_tap $? 88 'UpdateScreenshots' test.out

#- 89 UploadContentScreenshot
./ng net.accelbyte.sdk.cli.Main ugc uploadContentScreenshot \
    --contentId 'rfEfxxPE' \
    --namespace "$AB_NAMESPACE" \
    --userId 'Vx8HN9kB' \
    --body '{"screenshots": [{"contentType": "gnaLvg9Z", "description": "j7pWWGgU", "fileExtension": "jpg"}, {"contentType": "iPzWqG7K", "description": "BIRw6V6M", "fileExtension": "jpg"}, {"contentType": "I0KREs7y", "description": "sEQICr8x", "fileExtension": "bmp"}]}' \
    > test.out 2>&1
eval_tap $? 89 'UploadContentScreenshot' test.out

#- 90 DeleteContentScreenshot
./ng net.accelbyte.sdk.cli.Main ugc deleteContentScreenshot \
    --contentId 'K98FZr1i' \
    --namespace "$AB_NAMESPACE" \
    --screenshotId 'rxvyyQaZ' \
    --userId 'MCIo7c2D' \
    > test.out 2>&1
eval_tap $? 90 'DeleteContentScreenshot' test.out

#- 91 UpdateUserFollowStatus
./ng net.accelbyte.sdk.cli.Main ugc updateUserFollowStatus \
    --namespace "$AB_NAMESPACE" \
    --userId 'eH2ix6qZ' \
    --body '{"followStatus": false}' \
    > test.out 2>&1
eval_tap $? 91 'UpdateUserFollowStatus' test.out

#- 92 GetPublicFollowers
./ng net.accelbyte.sdk.cli.Main ugc getPublicFollowers \
    --namespace "$AB_NAMESPACE" \
    --userId '60YGwHNL' \
    --limit '4' \
    --offset '98' \
    > test.out 2>&1
eval_tap $? 92 'GetPublicFollowers' test.out

#- 93 GetPublicFollowing
./ng net.accelbyte.sdk.cli.Main ugc getPublicFollowing \
    --namespace "$AB_NAMESPACE" \
    --userId '3Z3B97bt' \
    --limit '89' \
    --offset '92' \
    > test.out 2>&1
eval_tap $? 93 'GetPublicFollowing' test.out

#- 94 GetGroups
./ng net.accelbyte.sdk.cli.Main ugc getGroups \
    --namespace "$AB_NAMESPACE" \
    --userId 'okaghQE7' \
    --limit '54' \
    --offset '33' \
    > test.out 2>&1
eval_tap $? 94 'GetGroups' test.out

#- 95 CreateGroup
./ng net.accelbyte.sdk.cli.Main ugc createGroup \
    --namespace "$AB_NAMESPACE" \
    --userId 'GTGxBpRn' \
    --body '{"contents": ["mXhi7xNO", "3sydHiKd", "PV2hDLuE"], "name": "CfeV7SD2"}' \
    > test.out 2>&1
eval_tap $? 95 'CreateGroup' test.out

#- 96 DeleteAllUserGroup
./ng net.accelbyte.sdk.cli.Main ugc deleteAllUserGroup \
    --namespace "$AB_NAMESPACE" \
    --userId 'jVdH9UG3' \
    > test.out 2>&1
eval_tap $? 96 'DeleteAllUserGroup' test.out

#- 97 GetGroup
./ng net.accelbyte.sdk.cli.Main ugc getGroup \
    --groupId 'qEAcCKJR' \
    --namespace "$AB_NAMESPACE" \
    --userId 'D1KHBTgR' \
    > test.out 2>&1
eval_tap $? 97 'GetGroup' test.out

#- 98 UpdateGroup
./ng net.accelbyte.sdk.cli.Main ugc updateGroup \
    --groupId '03u0Ay3j' \
    --namespace "$AB_NAMESPACE" \
    --userId 'qvbSQQJy' \
    --body '{"contents": ["zamgKdBY", "U2ZPqGFf", "N58WAQq6"], "name": "JsZsmUki"}' \
    > test.out 2>&1
eval_tap $? 98 'UpdateGroup' test.out

#- 99 DeleteGroup
./ng net.accelbyte.sdk.cli.Main ugc deleteGroup \
    --groupId 'OQckUIrO' \
    --namespace "$AB_NAMESPACE" \
    --userId 'BsnhnzuQ' \
    > test.out 2>&1
eval_tap $? 99 'DeleteGroup' test.out

#- 100 GetGroupContent
./ng net.accelbyte.sdk.cli.Main ugc getGroupContent \
    --groupId 'EW0QpaQ2' \
    --namespace "$AB_NAMESPACE" \
    --userId 'y4Yucqf6' \
    --limit '36' \
    --offset '64' \
    > test.out 2>&1
eval_tap $? 100 'GetGroupContent' test.out

#- 101 DeleteAllUserStates
./ng net.accelbyte.sdk.cli.Main ugc deleteAllUserStates \
    --namespace "$AB_NAMESPACE" \
    --userId '6LRN1ULa' \
    > test.out 2>&1
eval_tap $? 101 'DeleteAllUserStates' test.out

#- 102 AdminGetContentByChannelIDV2
./ng net.accelbyte.sdk.cli.Main ugc adminGetContentByChannelIDV2 \
    --channelId 'RjLmhwJt' \
    --namespace "$AB_NAMESPACE" \
    --limit '69' \
    --name 'DwWPzowt' \
    --offset '55' \
    --sortBy 'mFbZqIHq' \
    > test.out 2>&1
eval_tap $? 102 'AdminGetContentByChannelIDV2' test.out

#- 103 AdminCreateContentV2
./ng net.accelbyte.sdk.cli.Main ugc adminCreateContentV2 \
    --channelId 'pyQtaKwh' \
    --namespace "$AB_NAMESPACE" \
    --body '{"contentType": "Vnk1HbIS", "customAttributes": {"9A085nFN": {}, "GQHbYbnp": {}, "MdXDGUx8": {}}, "fileExtension": "QBllm02b", "name": "WZXzhU8H", "shareCode": "yzrvvSd4", "subType": "Qsb0lXlx", "tags": ["yT2HOgtE", "RSVLapQ5", "htx4lpzz"], "type": "OQ93uW2o"}' \
    > test.out 2>&1
eval_tap $? 103 'AdminCreateContentV2' test.out

#- 104 AdminDeleteOfficialContentV2
./ng net.accelbyte.sdk.cli.Main ugc adminDeleteOfficialContentV2 \
    --channelId '9DfmNeTS' \
    --contentId 'QNTcR2Sy' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 104 'AdminDeleteOfficialContentV2' test.out

#- 105 AdminUpdateOfficialContentV2
./ng net.accelbyte.sdk.cli.Main ugc adminUpdateOfficialContentV2 \
    --channelId 'rX9olOaM' \
    --contentId 'WRDH1eRz' \
    --namespace "$AB_NAMESPACE" \
    --body '{"customAttributes": {"pE0JtYEc": {}, "vLxRlXl0": {}, "gNpnb3Wh": {}}, "name": "1VVAwsjK", "shareCode": "400mBDSz", "subType": "1OQMdFeT", "tags": ["O0K0V8qU", "Y5NndSJH", "zmsbovNF"], "type": "QroZcoWj"}' \
    > test.out 2>&1
eval_tap $? 105 'AdminUpdateOfficialContentV2' test.out

#- 106 AdminUpdateOfficialContentFileLocation
./ng net.accelbyte.sdk.cli.Main ugc adminUpdateOfficialContentFileLocation \
    --channelId '2OfdKy4Q' \
    --contentId 'vMfBX04W' \
    --namespace "$AB_NAMESPACE" \
    --body '{"fileExtension": "OsZQCH8v", "fileLocation": "scI2dyDC"}' \
    > test.out 2>&1
eval_tap $? 106 'AdminUpdateOfficialContentFileLocation' test.out

#- 107 AdminGenerateOfficialContentUploadURLV2
./ng net.accelbyte.sdk.cli.Main ugc adminGenerateOfficialContentUploadURLV2 \
    --channelId 'suzfAB5q' \
    --contentId 'p2oMXGJK' \
    --namespace "$AB_NAMESPACE" \
    --body '{"contentType": "3nFJTIUN", "fileExtension": "W49rZwAb"}' \
    > test.out 2>&1
eval_tap $? 107 'AdminGenerateOfficialContentUploadURLV2' test.out

#- 108 AdminGetConfigs
./ng net.accelbyte.sdk.cli.Main ugc adminGetConfigs \
    --namespace "$AB_NAMESPACE" \
    --limit '86' \
    --offset '78' \
    > test.out 2>&1
eval_tap $? 108 'AdminGetConfigs' test.out

#- 109 AdminUpdateConfig
./ng net.accelbyte.sdk.cli.Main ugc adminUpdateConfig \
    --key 'sYECwhlf' \
    --namespace "$AB_NAMESPACE" \
    --body '{"value": "JLOQ1GtV"}' \
    > test.out 2>&1
eval_tap $? 109 'AdminUpdateConfig' test.out

#- 110 AdminListContentV2
./ng net.accelbyte.sdk.cli.Main ugc adminListContentV2 \
    --namespace "$AB_NAMESPACE" \
    --isOfficial  \
    --limit '97' \
    --name 'af1oEm6w' \
    --offset '74' \
    --sortBy 'RfpQnKmE' \
    --subType 'iJvH1i8u' \
    --tags 'mxwhvuvp,zZe1ClIr,whCGFRr0' \
    --type 'G5m628Cp' \
    > test.out 2>&1
eval_tap $? 110 'AdminListContentV2' test.out

#- 111 AdminBulkGetContentByIDsV2
./ng net.accelbyte.sdk.cli.Main ugc adminBulkGetContentByIDsV2 \
    --namespace "$AB_NAMESPACE" \
    --body '{"contentIds": ["GPnuLEwB", "R3v58PlA", "TqrJ8IlF"]}' \
    > test.out 2>&1
eval_tap $? 111 'AdminBulkGetContentByIDsV2' test.out

#- 112 AdminGetContentBulkByShareCodesV2
./ng net.accelbyte.sdk.cli.Main ugc adminGetContentBulkByShareCodesV2 \
    --namespace "$AB_NAMESPACE" \
    --body '{"shareCodes": ["NC0UxNH9", "yjzpmOWX", "bt4z0O5i"]}' \
    > test.out 2>&1
eval_tap $? 112 'AdminGetContentBulkByShareCodesV2' test.out

#- 113 AdminGetContentByShareCodeV2
./ng net.accelbyte.sdk.cli.Main ugc adminGetContentByShareCodeV2 \
    --namespace "$AB_NAMESPACE" \
    --shareCode 'jeeXMfnC' \
    > test.out 2>&1
eval_tap $? 113 'AdminGetContentByShareCodeV2' test.out

#- 114 AdminGetContentByContentIDV2
./ng net.accelbyte.sdk.cli.Main ugc adminGetContentByContentIDV2 \
    --contentId 'lbzB7x83' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 114 'AdminGetContentByContentIDV2' test.out

#- 115 RollbackContentVersionV2
./ng net.accelbyte.sdk.cli.Main ugc rollbackContentVersionV2 \
    --contentId 'a7U9RyOF' \
    --namespace "$AB_NAMESPACE" \
    --versionId 'IVVc8Qbf' \
    > test.out 2>&1
eval_tap $? 115 'RollbackContentVersionV2' test.out

#- 116 AdminUpdateScreenshotsV2
./ng net.accelbyte.sdk.cli.Main ugc adminUpdateScreenshotsV2 \
    --contentId 'unEsixTT' \
    --namespace "$AB_NAMESPACE" \
    --body '{"screenshots": [{"description": "v8uzSPd5", "screenshotId": "ZyZ6Y96W"}, {"description": "956CVo5W", "screenshotId": "vbx6nQN9"}, {"description": "HBr3r0Kl", "screenshotId": "W5aeBWpW"}]}' \
    > test.out 2>&1
eval_tap $? 116 'AdminUpdateScreenshotsV2' test.out

#- 117 AdminUploadContentScreenshotV2
./ng net.accelbyte.sdk.cli.Main ugc adminUploadContentScreenshotV2 \
    --contentId 'ktvSWYuP' \
    --namespace "$AB_NAMESPACE" \
    --body '{"screenshots": [{"contentType": "xbDwspN9", "description": "hv2jSl2X", "fileExtension": "bmp"}, {"contentType": "4x6jYbzO", "description": "QipZW8ry", "fileExtension": "pjp"}, {"contentType": "sj64Xxtw", "description": "ImaFRX6m", "fileExtension": "jpeg"}]}' \
    > test.out 2>&1
eval_tap $? 117 'AdminUploadContentScreenshotV2' test.out

#- 118 AdminDeleteContentScreenshotV2
./ng net.accelbyte.sdk.cli.Main ugc adminDeleteContentScreenshotV2 \
    --contentId 'r2pQzSb8' \
    --namespace "$AB_NAMESPACE" \
    --screenshotId 'LqGZ34QS' \
    > test.out 2>&1
eval_tap $? 118 'AdminDeleteContentScreenshotV2' test.out

#- 119 ListContentVersionsV2
./ng net.accelbyte.sdk.cli.Main ugc listContentVersionsV2 \
    --contentId 'b7QvqjYw' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 119 'ListContentVersionsV2' test.out

#- 120 AdminGetOfficialGroupContentsV2
./ng net.accelbyte.sdk.cli.Main ugc adminGetOfficialGroupContentsV2 \
    --groupId '9fpKcPNj' \
    --namespace "$AB_NAMESPACE" \
    --limit '98' \
    --offset '41' \
    > test.out 2>&1
eval_tap $? 120 'AdminGetOfficialGroupContentsV2' test.out

#- 121 AdminListStagingContents
./ng net.accelbyte.sdk.cli.Main ugc adminListStagingContents \
    --namespace "$AB_NAMESPACE" \
    --limit '9' \
    --offset '53' \
    --sortBy '5zmNXtSz' \
    --status 'WByhLQq8' \
    > test.out 2>&1
eval_tap $? 121 'AdminListStagingContents' test.out

#- 122 AdminGetStagingContentByID
./ng net.accelbyte.sdk.cli.Main ugc adminGetStagingContentByID \
    --contentId 'rgtHtx9r' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 122 'AdminGetStagingContentByID' test.out

#- 123 AdminApproveStagingContent
./ng net.accelbyte.sdk.cli.Main ugc adminApproveStagingContent \
    --contentId 'xrDtCNqz' \
    --namespace "$AB_NAMESPACE" \
    --body '{"approved": false, "note": "AC0sLyzl"}' \
    > test.out 2>&1
eval_tap $? 123 'AdminApproveStagingContent' test.out

#- 124 AdminUpdateContentByShareCodeV2
./ng net.accelbyte.sdk.cli.Main ugc adminUpdateContentByShareCodeV2 \
    --channelId '5lzz6W2E' \
    --namespace "$AB_NAMESPACE" \
    --shareCode 'AhhNH64M' \
    --userId 'U19UoonZ' \
    --body '{"customAttributes": {"cw7rIrQT": {}, "acCsBBuk": {}, "1keca8xq": {}}, "name": "5trqcUM2", "shareCode": "KIBETA75", "subType": "WaA7joKB", "tags": ["BOKP4jY7", "dj8YcLyA", "tVqQg2Pd"], "type": "JsmPFg2H"}' \
    > test.out 2>&1
eval_tap $? 124 'AdminUpdateContentByShareCodeV2' test.out

#- 125 AdminDeleteContentByShareCodeV2
./ng net.accelbyte.sdk.cli.Main ugc adminDeleteContentByShareCodeV2 \
    --channelId 'OpzXEquh' \
    --namespace "$AB_NAMESPACE" \
    --shareCode 'nqMy488m' \
    --userId 'ID0VQcc7' \
    > test.out 2>&1
eval_tap $? 125 'AdminDeleteContentByShareCodeV2' test.out

#- 126 AdminDeleteUserContentV2
./ng net.accelbyte.sdk.cli.Main ugc adminDeleteUserContentV2 \
    --channelId 'Tyjoft0m' \
    --contentId '75CRY0ou' \
    --namespace "$AB_NAMESPACE" \
    --userId 'jntuND0B' \
    > test.out 2>&1
eval_tap $? 126 'AdminDeleteUserContentV2' test.out

#- 127 AdminUpdateUserContentV2
./ng net.accelbyte.sdk.cli.Main ugc adminUpdateUserContentV2 \
    --channelId 'SwT4ENpm' \
    --contentId 'tePBF3gj' \
    --namespace "$AB_NAMESPACE" \
    --userId 'nJFEdJze' \
    --body '{"customAttributes": {"iz62s3nx": {}, "BcSzLyjx": {}, "U5yzc8kG": {}}, "name": "uNaZBExF", "shareCode": "QUj8kulG", "subType": "RAk8jmA2", "tags": ["sF7MoY3Q", "E5XxbVBf", "zcE79YLu"], "type": "WccJQPra"}' \
    > test.out 2>&1
eval_tap $? 127 'AdminUpdateUserContentV2' test.out

#- 128 AdminUpdateUserContentFileLocation
./ng net.accelbyte.sdk.cli.Main ugc adminUpdateUserContentFileLocation \
    --channelId 'ZjUNL9Z7' \
    --contentId 'LMnE8lyl' \
    --namespace "$AB_NAMESPACE" \
    --userId 'hm3tUIrH' \
    --body '{"fileExtension": "JT8seRms", "fileLocation": "g7MCQW9b"}' \
    > test.out 2>&1
eval_tap $? 128 'AdminUpdateUserContentFileLocation' test.out

#- 129 AdminGenerateUserContentUploadURLV2
./ng net.accelbyte.sdk.cli.Main ugc adminGenerateUserContentUploadURLV2 \
    --channelId '0ycHFadE' \
    --contentId 'AkTAUDQ0' \
    --namespace "$AB_NAMESPACE" \
    --userId 'rI5tjmkX' \
    --body '{"contentType": "v2sK1AG2", "fileExtension": "pV8NOr98"}' \
    > test.out 2>&1
eval_tap $? 129 'AdminGenerateUserContentUploadURLV2' test.out

#- 130 AdminGetContentByUserIDV2
./ng net.accelbyte.sdk.cli.Main ugc adminGetContentByUserIDV2 \
    --namespace "$AB_NAMESPACE" \
    --userId 'lVnpuX3q' \
    --limit '39' \
    --offset '25' \
    --sortBy 'GSXOSUcD' \
    > test.out 2>&1
eval_tap $? 130 'AdminGetContentByUserIDV2' test.out

#- 131 AdminUpdateContentHideStatusV2
./ng net.accelbyte.sdk.cli.Main ugc adminUpdateContentHideStatusV2 \
    --contentId 'QgbT5BMz' \
    --namespace "$AB_NAMESPACE" \
    --userId 'NyV7X0Z3' \
    --body '{"isHidden": true}' \
    > test.out 2>&1
eval_tap $? 131 'AdminUpdateContentHideStatusV2' test.out

#- 132 AdminGetUserGroupContentsV2
./ng net.accelbyte.sdk.cli.Main ugc adminGetUserGroupContentsV2 \
    --groupId 'xil14Yl8' \
    --namespace "$AB_NAMESPACE" \
    --userId 'QjCSY1PM' \
    --limit '70' \
    --offset '100' \
    > test.out 2>&1
eval_tap $? 132 'AdminGetUserGroupContentsV2' test.out

#- 133 AdminListUserStagingContents
./ng net.accelbyte.sdk.cli.Main ugc adminListUserStagingContents \
    --namespace "$AB_NAMESPACE" \
    --userId 'FE6EAwLM' \
    --limit '56' \
    --offset '27' \
    --sortBy 'wuKGG3q2' \
    --status 'GeHFpIh7' \
    > test.out 2>&1
eval_tap $? 133 'AdminListUserStagingContents' test.out

#- 134 PublicGetContentByChannelIDV2
./ng net.accelbyte.sdk.cli.Main ugc publicGetContentByChannelIDV2 \
    --channelId 't6IcX56w' \
    --namespace "$AB_NAMESPACE" \
    --limit '72' \
    --name 'xOpH2tAK' \
    --offset '20' \
    --sortBy 'LfzIrNvw' \
    > test.out 2>&1
eval_tap $? 134 'PublicGetContentByChannelIDV2' test.out

#- 135 PublicListContentV2
./ng net.accelbyte.sdk.cli.Main ugc publicListContentV2 \
    --namespace "$AB_NAMESPACE" \
    --isOfficial  \
    --limit '18' \
    --name 'a1huFwrD' \
    --offset '66' \
    --sortBy '5fQ9d6q0' \
    --subType 'PsFgf719' \
    --tags 'ln8jPSWt,R4iP52Y1,jy1fKjRo' \
    --type 'fG06XPCK' \
    > test.out 2>&1
eval_tap $? 135 'PublicListContentV2' test.out

#- 136 PublicBulkGetContentByIDV2
./ng net.accelbyte.sdk.cli.Main ugc publicBulkGetContentByIDV2 \
    --namespace "$AB_NAMESPACE" \
    --body '{"contentIds": ["g6LUnm1X", "EDjSPqGA", "DjzoQXVU"]}' \
    > test.out 2>&1
eval_tap $? 136 'PublicBulkGetContentByIDV2' test.out

#- 137 PublicGetContentBulkByShareCodesV2
./ng net.accelbyte.sdk.cli.Main ugc publicGetContentBulkByShareCodesV2 \
    --namespace "$AB_NAMESPACE" \
    --body '{"shareCodes": ["0RX9Dch4", "1vYgCKMV", "oB1cdXA2"]}' \
    > test.out 2>&1
eval_tap $? 137 'PublicGetContentBulkByShareCodesV2' test.out

#- 138 PublicGetContentByShareCodeV2
./ng net.accelbyte.sdk.cli.Main ugc publicGetContentByShareCodeV2 \
    --namespace "$AB_NAMESPACE" \
    --shareCode 'TMfwVMnd' \
    > test.out 2>&1
eval_tap $? 138 'PublicGetContentByShareCodeV2' test.out

#- 139 PublicGetContentByIDV2
./ng net.accelbyte.sdk.cli.Main ugc publicGetContentByIDV2 \
    --contentId 'p9PYxd6o' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 139 'PublicGetContentByIDV2' test.out

#- 140 PublicAddDownloadCountV2
./ng net.accelbyte.sdk.cli.Main ugc publicAddDownloadCountV2 \
    --contentId 'DHNESm0O' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 140 'PublicAddDownloadCountV2' test.out

#- 141 PublicListContentDownloaderV2
./ng net.accelbyte.sdk.cli.Main ugc publicListContentDownloaderV2 \
    --contentId '36RjbDjH' \
    --namespace "$AB_NAMESPACE" \
    --limit '31' \
    --offset '92' \
    --sortBy '5XkcXusm' \
    --userId 'XYFsEcln' \
    > test.out 2>&1
eval_tap $? 141 'PublicListContentDownloaderV2' test.out

#- 142 PublicListContentLikeV2
./ng net.accelbyte.sdk.cli.Main ugc publicListContentLikeV2 \
    --contentId 'NQ07zYFS' \
    --namespace "$AB_NAMESPACE" \
    --limit '12' \
    --offset '94' \
    --sortBy 'kQBYUSXb' \
    > test.out 2>&1
eval_tap $? 142 'PublicListContentLikeV2' test.out

#- 143 UpdateContentLikeStatusV2
./ng net.accelbyte.sdk.cli.Main ugc updateContentLikeStatusV2 \
    --contentId '0Wnvmd1D' \
    --namespace "$AB_NAMESPACE" \
    --body '{"likeStatus": true}' \
    > test.out 2>&1
eval_tap $? 143 'UpdateContentLikeStatusV2' test.out

#- 144 PublicCreateContentV2
./ng net.accelbyte.sdk.cli.Main ugc publicCreateContentV2 \
    --channelId '00TR10Fc' \
    --namespace "$AB_NAMESPACE" \
    --userId 'H1QKebtL' \
    --body '{"contentType": "ZrEYjwoo", "customAttributes": {"o8bxZl9p": {}, "jqw0cZ4A": {}, "SAui5HAf": {}}, "fileExtension": "Wx69VyE9", "name": "CWRjQ1Az", "subType": "rHLiZ0zj", "tags": ["l63BfsaF", "DgBjXX8v", "oGKIeV1g"], "type": "T9kRlYBV"}' \
    > test.out 2>&1
eval_tap $? 144 'PublicCreateContentV2' test.out

#- 145 PublicUpdateContentByShareCodeV2
./ng net.accelbyte.sdk.cli.Main ugc publicUpdateContentByShareCodeV2 \
    --channelId 'goZEKCYm' \
    --namespace "$AB_NAMESPACE" \
    --shareCode 'jvkrCQJZ' \
    --userId 'FlPCMRJw' \
    --body '{"customAttributes": {"o6biBAOT": {}, "XobHM3g3": {}, "LBx5aXpg": {}}, "name": "D0uRQyl5", "subType": "hR6hgxk4", "tags": ["D5QuhzQv", "B9TOf2rw", "LO5qeihx"], "type": "AuvdR8cQ"}' \
    > test.out 2>&1
eval_tap $? 145 'PublicUpdateContentByShareCodeV2' test.out

#- 146 PublicDeleteContentByShareCodeV2
./ng net.accelbyte.sdk.cli.Main ugc publicDeleteContentByShareCodeV2 \
    --channelId 'cRBY56QA' \
    --namespace "$AB_NAMESPACE" \
    --shareCode 'zJ9Hb0RV' \
    --userId 'ivsOTB61' \
    > test.out 2>&1
eval_tap $? 146 'PublicDeleteContentByShareCodeV2' test.out

#- 147 PublicDeleteContentV2
./ng net.accelbyte.sdk.cli.Main ugc publicDeleteContentV2 \
    --channelId 'dlay0b3d' \
    --contentId 'CXfNwA6e' \
    --namespace "$AB_NAMESPACE" \
    --userId 'O0klBn4C' \
    > test.out 2>&1
eval_tap $? 147 'PublicDeleteContentV2' test.out

#- 148 PublicUpdateContentV2
./ng net.accelbyte.sdk.cli.Main ugc publicUpdateContentV2 \
    --channelId 'Es7s4vU6' \
    --contentId 'dXMpegVx' \
    --namespace "$AB_NAMESPACE" \
    --userId '4P5fVPFb' \
    --body '{"customAttributes": {"dG9qBJil": {}, "IEsx6QJC": {}, "qgEBbYzi": {}}, "name": "wN1yjpBw", "subType": "Imv4Iyew", "tags": ["CYcQCG9T", "mLxPc0Bv", "wcjh0ce2"], "type": "Hwt76WUV"}' \
    > test.out 2>&1
eval_tap $? 148 'PublicUpdateContentV2' test.out

#- 149 PublicUpdateContentFileLocation
./ng net.accelbyte.sdk.cli.Main ugc publicUpdateContentFileLocation \
    --channelId 'K1iJ3FG0' \
    --contentId 'NcsXzYvd' \
    --namespace "$AB_NAMESPACE" \
    --userId 'xDCs1bcm' \
    --body '{"fileExtension": "dbShxVdi", "fileLocation": "tMPVY7rw"}' \
    > test.out 2>&1
eval_tap $? 149 'PublicUpdateContentFileLocation' test.out

#- 150 UpdateContentShareCodeV2
./ng net.accelbyte.sdk.cli.Main ugc updateContentShareCodeV2 \
    --channelId 'nQxWZw6a' \
    --contentId 'BNSvWESS' \
    --namespace "$AB_NAMESPACE" \
    --userId 'At9Hj3iU' \
    --body '{"shareCode": "t0oqqugG"}' \
    > test.out 2>&1
eval_tap $? 150 'UpdateContentShareCodeV2' test.out

#- 151 PublicGenerateContentUploadURLV2
./ng net.accelbyte.sdk.cli.Main ugc publicGenerateContentUploadURLV2 \
    --channelId 'yMoy2IJK' \
    --contentId 'o0a2xRBg' \
    --namespace "$AB_NAMESPACE" \
    --userId 'V4oC4RZd' \
    --body '{"contentType": "0BE9fHjZ", "fileExtension": "J217hAnP"}' \
    > test.out 2>&1
eval_tap $? 151 'PublicGenerateContentUploadURLV2' test.out

#- 152 PublicGetContentByUserIDV2
./ng net.accelbyte.sdk.cli.Main ugc publicGetContentByUserIDV2 \
    --namespace "$AB_NAMESPACE" \
    --userId 'NlQkKRpI' \
    --limit '97' \
    --offset '16' \
    --sortBy '8Z1A0S52' \
    > test.out 2>&1
eval_tap $? 152 'PublicGetContentByUserIDV2' test.out

#- 153 UpdateScreenshotsV2
./ng net.accelbyte.sdk.cli.Main ugc updateScreenshotsV2 \
    --contentId 'p9qcexAt' \
    --namespace "$AB_NAMESPACE" \
    --userId 'cNHedzMi' \
    --body '{"screenshots": [{"description": "YhsHzONN", "screenshotId": "7buT2MXP"}, {"description": "ZGRYwmLJ", "screenshotId": "IyANNZ8C"}, {"description": "fABjVNPE", "screenshotId": "FsFYM1rO"}]}' \
    > test.out 2>&1
eval_tap $? 153 'UpdateScreenshotsV2' test.out

#- 154 UploadContentScreenshotV2
./ng net.accelbyte.sdk.cli.Main ugc uploadContentScreenshotV2 \
    --contentId 'Rrx8f6cI' \
    --namespace "$AB_NAMESPACE" \
    --userId '4nWcyvBs' \
    --body '{"screenshots": [{"contentType": "bF9FhzUT", "description": "DfQdNX8N", "fileExtension": "jpg"}, {"contentType": "epcEkbtI", "description": "wrvjL25h", "fileExtension": "pjp"}, {"contentType": "zWRz3Ptx", "description": "MoInIoUL", "fileExtension": "pjp"}]}' \
    > test.out 2>&1
eval_tap $? 154 'UploadContentScreenshotV2' test.out

#- 155 DeleteContentScreenshotV2
./ng net.accelbyte.sdk.cli.Main ugc deleteContentScreenshotV2 \
    --contentId 'vgWG901o' \
    --namespace "$AB_NAMESPACE" \
    --screenshotId 'AbLFRgE4' \
    --userId '5IIr3Y0G' \
    > test.out 2>&1
eval_tap $? 155 'DeleteContentScreenshotV2' test.out

#- 156 PublicGetGroupContentsV2
./ng net.accelbyte.sdk.cli.Main ugc publicGetGroupContentsV2 \
    --groupId 'mXrMrNlz' \
    --namespace "$AB_NAMESPACE" \
    --userId 'QLnv8Huo' \
    --limit '26' \
    --offset '69' \
    > test.out 2>&1
eval_tap $? 156 'PublicGetGroupContentsV2' test.out

#- 157 ListUserStagingContents
./ng net.accelbyte.sdk.cli.Main ugc listUserStagingContents \
    --namespace "$AB_NAMESPACE" \
    --userId 'BhnI9MbV' \
    --limit '16' \
    --offset '40' \
    --sortBy '4Lj5d2xd' \
    --status 'mBqGm9VJ' \
    > test.out 2>&1
eval_tap $? 157 'ListUserStagingContents' test.out

#- 158 GetUserStagingContentByID
./ng net.accelbyte.sdk.cli.Main ugc getUserStagingContentByID \
    --contentId 'dmvRjxL5' \
    --namespace "$AB_NAMESPACE" \
    --userId 'DRoeYz3V' \
    > test.out 2>&1
eval_tap $? 158 'GetUserStagingContentByID' test.out

#- 159 UpdateStagingContent
./ng net.accelbyte.sdk.cli.Main ugc updateStagingContent \
    --contentId '8oupkJBc' \
    --namespace "$AB_NAMESPACE" \
    --userId '4RrtOLWV' \
    --body '{"fileExtension": "JYdhsDUO", "fileLocation": "UYgv9puD"}' \
    > test.out 2>&1
eval_tap $? 159 'UpdateStagingContent' test.out

#- 160 DeleteUserStagingContentByID
./ng net.accelbyte.sdk.cli.Main ugc deleteUserStagingContentByID \
    --contentId 'QKy9HhnU' \
    --namespace "$AB_NAMESPACE" \
    --userId 'JZI0E2BR' \
    > test.out 2>&1
eval_tap $? 160 'DeleteUserStagingContentByID' test.out


rm -f "tmp.dat"

exit $EXIT_CODE