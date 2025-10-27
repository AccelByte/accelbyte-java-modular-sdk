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
    --limit '50' \
    --offset '55' \
    > test.out 2>&1
eval_tap $? 2 'SingleAdminGetChannel' test.out

#- 3 AdminCreateChannel
./ng net.accelbyte.sdk.cli.Main ugc adminCreateChannel \
    --namespace "$AB_NAMESPACE" \
    --body '{"id": "kjJLPRR2", "name": "gEcMvZSQ"}' \
    > test.out 2>&1
eval_tap $? 3 'AdminCreateChannel' test.out

#- 4 SingleAdminUpdateChannel
./ng net.accelbyte.sdk.cli.Main ugc singleAdminUpdateChannel \
    --channelId 'ORa97g9b' \
    --namespace "$AB_NAMESPACE" \
    --body '{"name": "mznS3kRO"}' \
    > test.out 2>&1
eval_tap $? 4 'SingleAdminUpdateChannel' test.out

#- 5 SingleAdminDeleteChannel
./ng net.accelbyte.sdk.cli.Main ugc singleAdminDeleteChannel \
    --channelId 'Rjzy9x6k' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 5 'SingleAdminDeleteChannel' test.out

#- 6 AdminUploadContentDirect
eval_tap 0 6 'AdminUploadContentDirect # SKIP deprecated' test.out

#- 7 AdminUploadContentS3
./ng net.accelbyte.sdk.cli.Main ugc adminUploadContentS3 \
    --channelId 'sCh0btTd' \
    --namespace "$AB_NAMESPACE" \
    --body '{"contentType": "IQGgaix3", "customAttributes": {"cZm6GHaB": {}, "Bakigjjk": {}, "BjDZjasY": {}}, "fileExtension": "Od7AyDLf", "name": "B35xAoAW", "preview": "4qjLHlLN", "previewMetadata": {"previewContentType": "R0UzKO0y", "previewFileExtension": "VPn0KdJa"}, "shareCode": "gzkSnaHf", "subType": "nW2cIerq", "tags": ["qwSDZo3T", "Azan5JFu", "j53oiK4h"], "type": "Xtq5vPlE"}' \
    > test.out 2>&1
eval_tap $? 7 'AdminUploadContentS3' test.out

#- 8 SingleAdminUpdateContentS3
./ng net.accelbyte.sdk.cli.Main ugc singleAdminUpdateContentS3 \
    --channelId 'kAIW0L2u' \
    --contentId 'ThBzDdUh' \
    --namespace "$AB_NAMESPACE" \
    --body '{"contentType": "RVgvKSmZ", "customAttributes": {"WEx2SkHz": {}, "cmHKTKPY": {}, "hrLd55K7": {}}, "fileExtension": "WdmxpDVB", "name": "MYa2PCDV", "payload": "Syerj5my", "preview": "6swkZPw2", "previewMetadata": {"previewContentType": "aotIqb8G", "previewFileExtension": "gPoSVi3P"}, "shareCode": "i6vw8gzp", "subType": "oV9c8CHk", "tags": ["7aduVZm1", "qKiEHCvd", "iDxXt2g9"], "type": "2RJmQQ71", "updateContentFile": true}' \
    > test.out 2>&1
eval_tap $? 8 'SingleAdminUpdateContentS3' test.out

#- 9 AdminSearchChannelSpecificContent
./ng net.accelbyte.sdk.cli.Main ugc adminSearchChannelSpecificContent \
    --channelId 'iNyk7L5L' \
    --namespace "$AB_NAMESPACE" \
    --creator 'ur3LAEpB' \
    --ishidden 'mJ4gfYCN' \
    --isofficial 'JmWfX1Pj' \
    --limit '56' \
    --name 'DkCgv0oR' \
    --offset '95' \
    --orderby '5O5T4eN7' \
    --sortby '5R1S6Njr' \
    --subtype 'PoJQvYBG' \
    --tags '8hk3hNS9,TaogsINY,nebIMHx9' \
    --type 'WdN2GHgv' \
    --userId 'twqscToo' \
    > test.out 2>&1
eval_tap $? 9 'AdminSearchChannelSpecificContent' test.out

#- 10 SingleAdminUpdateContentDirect
eval_tap 0 10 'SingleAdminUpdateContentDirect # SKIP deprecated' test.out

#- 11 SingleAdminDeleteContent
./ng net.accelbyte.sdk.cli.Main ugc singleAdminDeleteContent \
    --channelId 'BL7NLZtH' \
    --contentId 'ttr45MD8' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 11 'SingleAdminDeleteContent' test.out

#- 12 SingleAdminGetContent
./ng net.accelbyte.sdk.cli.Main ugc singleAdminGetContent \
    --namespace "$AB_NAMESPACE" \
    --limit '36' \
    --offset '97' \
    > test.out 2>&1
eval_tap $? 12 'SingleAdminGetContent' test.out

#- 13 AdminGetContentBulk
./ng net.accelbyte.sdk.cli.Main ugc adminGetContentBulk \
    --namespace "$AB_NAMESPACE" \
    --body '{"contentIds": ["MIbGM3CT", "uPJFCNeA", "uakZPpLp"]}' \
    > test.out 2>&1
eval_tap $? 13 'AdminGetContentBulk' test.out

#- 14 AdminSearchContent
./ng net.accelbyte.sdk.cli.Main ugc adminSearchContent \
    --namespace "$AB_NAMESPACE" \
    --creator 'EboSdrBK' \
    --ishidden 'PaDBz7cu' \
    --isofficial 'D49F2psl' \
    --limit '54' \
    --name 'm4YE0vVu' \
    --offset '98' \
    --orderby 'mLi6Yiga' \
    --sortby 'yr8RXtHJ' \
    --subtype 'tPghqy7u' \
    --tags '3xjIayjz,ShvsP4WD,9xDrq0Ja' \
    --type 'kaV6Iblv' \
    --userId 'kmYL2BWl' \
    > test.out 2>&1
eval_tap $? 14 'AdminSearchContent' test.out

#- 15 AdminGetContentBulkByShareCodes
./ng net.accelbyte.sdk.cli.Main ugc adminGetContentBulkByShareCodes \
    --namespace "$AB_NAMESPACE" \
    --body '{"shareCodes": ["SD4syw4e", "NugK6NzP", "90RLMDMf"]}' \
    > test.out 2>&1
eval_tap $? 15 'AdminGetContentBulkByShareCodes' test.out

#- 16 AdminGetUserContentByShareCode
./ng net.accelbyte.sdk.cli.Main ugc adminGetUserContentByShareCode \
    --namespace "$AB_NAMESPACE" \
    --shareCode '6dJkJmvu' \
    > test.out 2>&1
eval_tap $? 16 'AdminGetUserContentByShareCode' test.out

#- 17 AdminGetSpecificContent
./ng net.accelbyte.sdk.cli.Main ugc adminGetSpecificContent \
    --contentId 'ctrDmvb0' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 17 'AdminGetSpecificContent' test.out

#- 18 AdminDownloadContentPreview
./ng net.accelbyte.sdk.cli.Main ugc adminDownloadContentPreview \
    --contentId 'asP1mZvm' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 18 'AdminDownloadContentPreview' test.out

#- 19 RollbackContentVersion
./ng net.accelbyte.sdk.cli.Main ugc rollbackContentVersion \
    --contentId '2NHu7sqS' \
    --namespace "$AB_NAMESPACE" \
    --versionId '2D0z9ebV' \
    > test.out 2>&1
eval_tap $? 19 'RollbackContentVersion' test.out

#- 20 AdminUpdateScreenshots
./ng net.accelbyte.sdk.cli.Main ugc adminUpdateScreenshots \
    --contentId 'VzKXZOWe' \
    --namespace "$AB_NAMESPACE" \
    --body '{"screenshots": [{"description": "zi4l8HGt", "screenshotId": "B1bdM5JV"}, {"description": "zleouqzr", "screenshotId": "5nIRABQH"}, {"description": "76O70WxU", "screenshotId": "069Qhdom"}]}' \
    > test.out 2>&1
eval_tap $? 20 'AdminUpdateScreenshots' test.out

#- 21 AdminUploadContentScreenshot
./ng net.accelbyte.sdk.cli.Main ugc adminUploadContentScreenshot \
    --contentId 'nifDtwRg' \
    --namespace "$AB_NAMESPACE" \
    --body '{"screenshots": [{"contentType": "9OSlCozd", "description": "OzsfPako", "fileExtension": "jpg"}, {"contentType": "ls0MRaQL", "description": "eo3I3Dqy", "fileExtension": "jpeg"}, {"contentType": "RTafyDA3", "description": "PJLPigcb", "fileExtension": "jpg"}]}' \
    > test.out 2>&1
eval_tap $? 21 'AdminUploadContentScreenshot' test.out

#- 22 AdminDeleteContentScreenshot
./ng net.accelbyte.sdk.cli.Main ugc adminDeleteContentScreenshot \
    --contentId 'Gv7vJb2T' \
    --namespace "$AB_NAMESPACE" \
    --screenshotId '2XXoYJAk' \
    > test.out 2>&1
eval_tap $? 22 'AdminDeleteContentScreenshot' test.out

#- 23 ListContentVersions
./ng net.accelbyte.sdk.cli.Main ugc listContentVersions \
    --contentId 'o764iAyx' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 23 'ListContentVersions' test.out

#- 24 SingleAdminGetAllGroups
./ng net.accelbyte.sdk.cli.Main ugc singleAdminGetAllGroups \
    --namespace "$AB_NAMESPACE" \
    --limit '61' \
    --offset '13' \
    > test.out 2>&1
eval_tap $? 24 'SingleAdminGetAllGroups' test.out

#- 25 AdminCreateGroup
./ng net.accelbyte.sdk.cli.Main ugc adminCreateGroup \
    --namespace "$AB_NAMESPACE" \
    --body '{"contents": ["swcdltTr", "wd1yqJY1", "10gSjmfr"], "name": "9GPtJwbu"}' \
    > test.out 2>&1
eval_tap $? 25 'AdminCreateGroup' test.out

#- 26 SingleAdminGetGroup
./ng net.accelbyte.sdk.cli.Main ugc singleAdminGetGroup \
    --groupId 'VVOPlys4' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 26 'SingleAdminGetGroup' test.out

#- 27 SingleAdminUpdateGroup
./ng net.accelbyte.sdk.cli.Main ugc singleAdminUpdateGroup \
    --groupId '7rQXFBlG' \
    --namespace "$AB_NAMESPACE" \
    --body '{"contents": ["HveqiEMm", "oknFDLB5", "459lAAkU"], "name": "ASqPDjnJ"}' \
    > test.out 2>&1
eval_tap $? 27 'SingleAdminUpdateGroup' test.out

#- 28 SingleAdminDeleteGroup
./ng net.accelbyte.sdk.cli.Main ugc singleAdminDeleteGroup \
    --groupId 'cIhyKG68' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 28 'SingleAdminDeleteGroup' test.out

#- 29 SingleAdminGetGroupContents
./ng net.accelbyte.sdk.cli.Main ugc singleAdminGetGroupContents \
    --groupId 'vVxmWYqM' \
    --namespace "$AB_NAMESPACE" \
    --limit '98' \
    --offset '52' \
    > test.out 2>&1
eval_tap $? 29 'SingleAdminGetGroupContents' test.out

#- 30 AdminGetTag
./ng net.accelbyte.sdk.cli.Main ugc adminGetTag \
    --namespace "$AB_NAMESPACE" \
    --limit '15' \
    --offset '92' \
    > test.out 2>&1
eval_tap $? 30 'AdminGetTag' test.out

#- 31 AdminCreateTag
./ng net.accelbyte.sdk.cli.Main ugc adminCreateTag \
    --namespace "$AB_NAMESPACE" \
    --body '{"tag": "kb8UIMDL"}' \
    > test.out 2>&1
eval_tap $? 31 'AdminCreateTag' test.out

#- 32 AdminUpdateTag
./ng net.accelbyte.sdk.cli.Main ugc adminUpdateTag \
    --namespace "$AB_NAMESPACE" \
    --tagId 'ndIvLfSn' \
    --body '{"tag": "ZOtqvWvb"}' \
    > test.out 2>&1
eval_tap $? 32 'AdminUpdateTag' test.out

#- 33 AdminDeleteTag
./ng net.accelbyte.sdk.cli.Main ugc adminDeleteTag \
    --namespace "$AB_NAMESPACE" \
    --tagId 'VUrZC86i' \
    > test.out 2>&1
eval_tap $? 33 'AdminDeleteTag' test.out

#- 34 AdminGetType
./ng net.accelbyte.sdk.cli.Main ugc adminGetType \
    --namespace "$AB_NAMESPACE" \
    --limit '84' \
    --offset '27' \
    > test.out 2>&1
eval_tap $? 34 'AdminGetType' test.out

#- 35 AdminCreateType
./ng net.accelbyte.sdk.cli.Main ugc adminCreateType \
    --namespace "$AB_NAMESPACE" \
    --body '{"subtype": ["DboMHLg7", "QTiBDxAQ", "D9q0uKhq"], "type": "ai7VmN2t"}' \
    > test.out 2>&1
eval_tap $? 35 'AdminCreateType' test.out

#- 36 AdminUpdateType
./ng net.accelbyte.sdk.cli.Main ugc adminUpdateType \
    --namespace "$AB_NAMESPACE" \
    --typeId 'fU7MCC61' \
    --body '{"subtype": ["DeAqoVXl", "Nma3ttmV", "QVmJWq6a"], "type": "iWdxZcll"}' \
    > test.out 2>&1
eval_tap $? 36 'AdminUpdateType' test.out

#- 37 AdminDeleteType
./ng net.accelbyte.sdk.cli.Main ugc adminDeleteType \
    --namespace "$AB_NAMESPACE" \
    --typeId '5LikPBRc' \
    > test.out 2>&1
eval_tap $? 37 'AdminDeleteType' test.out

#- 38 AdminGetChannel
./ng net.accelbyte.sdk.cli.Main ugc adminGetChannel \
    --namespace "$AB_NAMESPACE" \
    --userId 'GjHSK5Si' \
    --limit '11' \
    --name 'IAT2qnAZ' \
    --offset '94' \
    > test.out 2>&1
eval_tap $? 38 'AdminGetChannel' test.out

#- 39 AdminDeleteAllUserChannels
./ng net.accelbyte.sdk.cli.Main ugc adminDeleteAllUserChannels \
    --namespace "$AB_NAMESPACE" \
    --userId 'KBkAk6A7' \
    > test.out 2>&1
eval_tap $? 39 'AdminDeleteAllUserChannels' test.out

#- 40 AdminUpdateChannel
./ng net.accelbyte.sdk.cli.Main ugc adminUpdateChannel \
    --channelId 'baPskaVe' \
    --namespace "$AB_NAMESPACE" \
    --userId 'BSqOwnOL' \
    --body '{"name": "iXM7ZCno"}' \
    > test.out 2>&1
eval_tap $? 40 'AdminUpdateChannel' test.out

#- 41 AdminDeleteChannel
./ng net.accelbyte.sdk.cli.Main ugc adminDeleteChannel \
    --channelId 'cXuPJMrm' \
    --namespace "$AB_NAMESPACE" \
    --userId 'INMMSCtC' \
    > test.out 2>&1
eval_tap $? 41 'AdminDeleteChannel' test.out

#- 42 AdminUpdateContentS3ByShareCode
./ng net.accelbyte.sdk.cli.Main ugc adminUpdateContentS3ByShareCode \
    --channelId 'iru0ynLS' \
    --namespace "$AB_NAMESPACE" \
    --shareCode '602Kug9u' \
    --userId 'Q489GYuH' \
    --body '{"contentType": "cKKTC4V5", "customAttributes": {"FVIvIrhW": {}, "rIq9oXGD": {}, "smwnXLTz": {}}, "fileExtension": "v71YyFcy", "name": "FYt1dSEt", "payload": "06pByn8M", "preview": "5qJJIadp", "previewMetadata": {"previewContentType": "JR2V6meq", "previewFileExtension": "I9HO7Y0H"}, "shareCode": "BOQEGAcs", "subType": "yEgixmTM", "tags": ["ees4GgvU", "RjMc946V", "WW3X99E4"], "type": "mUCj8YpC", "updateContentFile": false}' \
    > test.out 2>&1
eval_tap $? 42 'AdminUpdateContentS3ByShareCode' test.out

#- 43 AdminUpdateContentS3
./ng net.accelbyte.sdk.cli.Main ugc adminUpdateContentS3 \
    --channelId 'QsuernM2' \
    --contentId 'BSiEfXo8' \
    --namespace "$AB_NAMESPACE" \
    --userId 'FB4YCTTo' \
    --body '{"contentType": "btc4Z6of", "customAttributes": {"gO5RDNqS": {}, "goNp9Fck": {}, "l4XswxgD": {}}, "fileExtension": "ye7PV6lz", "name": "InoYa11K", "payload": "0YX6L9eJ", "preview": "pjAYceiC", "previewMetadata": {"previewContentType": "1xEnS0BR", "previewFileExtension": "GKXYOR5c"}, "shareCode": "iYahjwYA", "subType": "T7p86IUs", "tags": ["2APqRu91", "7WM6Cdvx", "g4P0wL6n"], "type": "PiyEovQz", "updateContentFile": false}' \
    > test.out 2>&1
eval_tap $? 43 'AdminUpdateContentS3' test.out

#- 44 DeleteContentByShareCode
./ng net.accelbyte.sdk.cli.Main ugc deleteContentByShareCode \
    --channelId '4201rkVX' \
    --namespace "$AB_NAMESPACE" \
    --shareCode 'Ook2O5Q9' \
    --userId 'min2IKqR' \
    > test.out 2>&1
eval_tap $? 44 'DeleteContentByShareCode' test.out

#- 45 AdminUpdateContentDirect
eval_tap 0 45 'AdminUpdateContentDirect # SKIP deprecated' test.out

#- 46 AdminDeleteContent
./ng net.accelbyte.sdk.cli.Main ugc adminDeleteContent \
    --channelId '2R7sb0Mi' \
    --contentId 'Hi6jOtRK' \
    --namespace "$AB_NAMESPACE" \
    --userId 'C7RNEq9U' \
    > test.out 2>&1
eval_tap $? 46 'AdminDeleteContent' test.out

#- 47 AdminGetContent
./ng net.accelbyte.sdk.cli.Main ugc adminGetContent \
    --namespace "$AB_NAMESPACE" \
    --userId 'eDdLxYBV' \
    --limit '87' \
    --offset '21' \
    > test.out 2>&1
eval_tap $? 47 'AdminGetContent' test.out

#- 48 AdminDeleteAllUserContents
./ng net.accelbyte.sdk.cli.Main ugc adminDeleteAllUserContents \
    --namespace "$AB_NAMESPACE" \
    --userId 'bwezAdO0' \
    > test.out 2>&1
eval_tap $? 48 'AdminDeleteAllUserContents' test.out

#- 49 AdminHideUserContent
./ng net.accelbyte.sdk.cli.Main ugc adminHideUserContent \
    --contentId 'fbAdaVnW' \
    --namespace "$AB_NAMESPACE" \
    --userId 'lO177Ofj' \
    --body '{"isHidden": true}' \
    > test.out 2>&1
eval_tap $? 49 'AdminHideUserContent' test.out

#- 50 AdminGetAllGroups
./ng net.accelbyte.sdk.cli.Main ugc adminGetAllGroups \
    --namespace "$AB_NAMESPACE" \
    --userId 'z0DIGqYY' \
    --limit '88' \
    --offset '51' \
    > test.out 2>&1
eval_tap $? 50 'AdminGetAllGroups' test.out

#- 51 AdminDeleteAllUserGroup
./ng net.accelbyte.sdk.cli.Main ugc adminDeleteAllUserGroup \
    --namespace "$AB_NAMESPACE" \
    --userId '2Uy6RHVx' \
    > test.out 2>&1
eval_tap $? 51 'AdminDeleteAllUserGroup' test.out

#- 52 AdminGetGroup
./ng net.accelbyte.sdk.cli.Main ugc adminGetGroup \
    --groupId '4NQSLsvU' \
    --namespace "$AB_NAMESPACE" \
    --userId 'Md5UkbEx' \
    > test.out 2>&1
eval_tap $? 52 'AdminGetGroup' test.out

#- 53 AdminUpdateGroup
./ng net.accelbyte.sdk.cli.Main ugc adminUpdateGroup \
    --groupId 'FxDAHg7m' \
    --namespace "$AB_NAMESPACE" \
    --userId 'RBX5iRva' \
    --body '{"contents": ["CweAjCq1", "zGUiytnq", "GCaHt2p7"], "name": "jE0lQFOW"}' \
    > test.out 2>&1
eval_tap $? 53 'AdminUpdateGroup' test.out

#- 54 AdminDeleteGroup
./ng net.accelbyte.sdk.cli.Main ugc adminDeleteGroup \
    --groupId '14RU0QG7' \
    --namespace "$AB_NAMESPACE" \
    --userId 'pTg7oob2' \
    > test.out 2>&1
eval_tap $? 54 'AdminDeleteGroup' test.out

#- 55 AdminGetGroupContents
./ng net.accelbyte.sdk.cli.Main ugc adminGetGroupContents \
    --groupId 'bHINfTFo' \
    --namespace "$AB_NAMESPACE" \
    --userId 'trffYcfG' \
    --limit '51' \
    --offset '31' \
    > test.out 2>&1
eval_tap $? 55 'AdminGetGroupContents' test.out

#- 56 AdminDeleteAllUserStates
./ng net.accelbyte.sdk.cli.Main ugc adminDeleteAllUserStates \
    --namespace "$AB_NAMESPACE" \
    --userId '8Ka9JzWv' \
    > test.out 2>&1
eval_tap $? 56 'AdminDeleteAllUserStates' test.out

#- 57 SearchChannelSpecificContent
./ng net.accelbyte.sdk.cli.Main ugc searchChannelSpecificContent \
    --channelId 'TJbDXbTe' \
    --namespace "$AB_NAMESPACE" \
    --creator 'amS3PGFc' \
    --ishidden 'o7LGSkR4' \
    --isofficial 'FsLfhEfe' \
    --limit '44' \
    --name 'XXzSUBoI' \
    --offset '95' \
    --orderby 'T3d8ZlwJ' \
    --sortby 'SVGbfK7t' \
    --subtype 'nSe3e5pn' \
    --tags 'TFF1HRhS,CO9OYXZd,irrBJuzC' \
    --type 'dCtKksVM' \
    --userId 'JtuwFGuB' \
    > test.out 2>&1
eval_tap $? 57 'SearchChannelSpecificContent' test.out

#- 58 PublicSearchContent
./ng net.accelbyte.sdk.cli.Main ugc publicSearchContent \
    --namespace "$AB_NAMESPACE" \
    --creator 'FJ4QgS0O' \
    --ishidden 'XVhA5MER' \
    --isofficial 'yykoK1Fo' \
    --limit '19' \
    --name 'jdO7TAkF' \
    --offset '48' \
    --orderby 'qIuHW721' \
    --sortby 'WW3PPrfw' \
    --subtype 'nlOQbAAV' \
    --tags '2oKV6MAp,Dy5yaJEJ,DvaiGVbA' \
    --type 'aEJipbcR' \
    --userId 'sOjDlao2' \
    > test.out 2>&1
eval_tap $? 58 'PublicSearchContent' test.out

#- 59 PublicGetContentBulk
./ng net.accelbyte.sdk.cli.Main ugc publicGetContentBulk \
    --namespace "$AB_NAMESPACE" \
    --body '{"contentIds": ["fFKgigyu", "bliiVlOK", "1zGg4sQe"]}' \
    > test.out 2>&1
eval_tap $? 59 'PublicGetContentBulk' test.out

#- 60 GetFollowedContent
./ng net.accelbyte.sdk.cli.Main ugc getFollowedContent \
    --namespace "$AB_NAMESPACE" \
    --limit '98' \
    --offset '93' \
    > test.out 2>&1
eval_tap $? 60 'GetFollowedContent' test.out

#- 61 GetLikedContent
./ng net.accelbyte.sdk.cli.Main ugc getLikedContent \
    --namespace "$AB_NAMESPACE" \
    --isofficial  \
    --limit '59' \
    --name 'kXtamEuy' \
    --offset '28' \
    --orderby 'SF75UD1y' \
    --sortby 'W76tbI6R' \
    --subtype '0CYJ1mYF' \
    --tags 'kIjOqCML,ozQRK5Sl,IBeknKJa' \
    --type 'l7YR5kZU' \
    > test.out 2>&1
eval_tap $? 61 'GetLikedContent' test.out

#- 62 PublicGetContentBulkByShareCodes
./ng net.accelbyte.sdk.cli.Main ugc publicGetContentBulkByShareCodes \
    --namespace "$AB_NAMESPACE" \
    --body '{"shareCodes": ["t40o6s61", "cLWtdYys", "Oq7owzWK"]}' \
    > test.out 2>&1
eval_tap $? 62 'PublicGetContentBulkByShareCodes' test.out

#- 63 PublicDownloadContentByShareCode
./ng net.accelbyte.sdk.cli.Main ugc publicDownloadContentByShareCode \
    --namespace "$AB_NAMESPACE" \
    --shareCode 'YWpPz48X' \
    > test.out 2>&1
eval_tap $? 63 'PublicDownloadContentByShareCode' test.out

#- 64 PublicDownloadContentByContentID
./ng net.accelbyte.sdk.cli.Main ugc publicDownloadContentByContentID \
    --contentId 'sGiLLSNy' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 64 'PublicDownloadContentByContentID' test.out

#- 65 AddDownloadCount
./ng net.accelbyte.sdk.cli.Main ugc addDownloadCount \
    --contentId 'w9rjMmtz' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 65 'AddDownloadCount' test.out

#- 66 UpdateContentLikeStatus
./ng net.accelbyte.sdk.cli.Main ugc updateContentLikeStatus \
    --contentId '30NS0Ho0' \
    --namespace "$AB_NAMESPACE" \
    --body '{"likeStatus": true}' \
    > test.out 2>&1
eval_tap $? 66 'UpdateContentLikeStatus' test.out

#- 67 PublicDownloadContentPreview
./ng net.accelbyte.sdk.cli.Main ugc publicDownloadContentPreview \
    --contentId 'Xit8rATZ' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 67 'PublicDownloadContentPreview' test.out

#- 68 GetTag
./ng net.accelbyte.sdk.cli.Main ugc getTag \
    --namespace "$AB_NAMESPACE" \
    --limit '0' \
    --offset '62' \
    > test.out 2>&1
eval_tap $? 68 'GetTag' test.out

#- 69 GetType
./ng net.accelbyte.sdk.cli.Main ugc getType \
    --namespace "$AB_NAMESPACE" \
    --limit '13' \
    --offset '27' \
    > test.out 2>&1
eval_tap $? 69 'GetType' test.out

#- 70 PublicSearchCreator
./ng net.accelbyte.sdk.cli.Main ugc publicSearchCreator \
    --namespace "$AB_NAMESPACE" \
    --limit '24' \
    --offset '26' \
    --orderby 'dfUZkGix' \
    --sortby 'Y0UWCq0g' \
    > test.out 2>&1
eval_tap $? 70 'PublicSearchCreator' test.out

#- 71 GetFollowedUsers
./ng net.accelbyte.sdk.cli.Main ugc getFollowedUsers \
    --namespace "$AB_NAMESPACE" \
    --limit '55' \
    --offset '21' \
    > test.out 2>&1
eval_tap $? 71 'GetFollowedUsers' test.out

#- 72 PublicGetCreator
./ng net.accelbyte.sdk.cli.Main ugc publicGetCreator \
    --namespace "$AB_NAMESPACE" \
    --userId 'HXbgHyIV' \
    > test.out 2>&1
eval_tap $? 72 'PublicGetCreator' test.out

#- 73 GetChannels
./ng net.accelbyte.sdk.cli.Main ugc getChannels \
    --namespace "$AB_NAMESPACE" \
    --userId 'LCFbmEmF' \
    --limit '54' \
    --name 'JKjk3Ubw' \
    --offset '4' \
    > test.out 2>&1
eval_tap $? 73 'GetChannels' test.out

#- 74 PublicCreateChannel
./ng net.accelbyte.sdk.cli.Main ugc publicCreateChannel \
    --namespace "$AB_NAMESPACE" \
    --userId 'KYjLUBU8' \
    --body '{"name": "Mw4PbRV1"}' \
    > test.out 2>&1
eval_tap $? 74 'PublicCreateChannel' test.out

#- 75 DeleteAllUserChannel
./ng net.accelbyte.sdk.cli.Main ugc deleteAllUserChannel \
    --namespace "$AB_NAMESPACE" \
    --userId 'xNpoYDTo' \
    > test.out 2>&1
eval_tap $? 75 'DeleteAllUserChannel' test.out

#- 76 UpdateChannel
./ng net.accelbyte.sdk.cli.Main ugc updateChannel \
    --channelId '7JAoYfSD' \
    --namespace "$AB_NAMESPACE" \
    --userId 'Sbp7UvKd' \
    --body '{"name": "jkR5RZiy"}' \
    > test.out 2>&1
eval_tap $? 76 'UpdateChannel' test.out

#- 77 DeleteChannel
./ng net.accelbyte.sdk.cli.Main ugc deleteChannel \
    --channelId 'SyxHgATf' \
    --namespace "$AB_NAMESPACE" \
    --userId 'SvgoBJlS' \
    > test.out 2>&1
eval_tap $? 77 'DeleteChannel' test.out

#- 78 CreateContentDirect
eval_tap 0 78 'CreateContentDirect # SKIP deprecated' test.out

#- 79 CreateContentS3
./ng net.accelbyte.sdk.cli.Main ugc createContentS3 \
    --channelId 'DCmdAV5k' \
    --namespace "$AB_NAMESPACE" \
    --userId 'H6XtHa1Q' \
    --body '{"contentType": "7mo15HAn", "customAttributes": {"Gup8CJAG": {}, "pdECzxIQ": {}, "Rim64O7L": {}}, "fileExtension": "PJGLDxYe", "name": "EQ0yuI3v", "preview": "reVJ0MQz", "previewMetadata": {"previewContentType": "D5kRuEW1", "previewFileExtension": "gWcG9leO"}, "subType": "HS5T9hkE", "tags": ["Vmq2OOWm", "nRccjChe", "eMyrgMrQ"], "type": "qM3u4ijv"}' \
    > test.out 2>&1
eval_tap $? 79 'CreateContentS3' test.out

#- 80 PublicUpdateContentByShareCode
./ng net.accelbyte.sdk.cli.Main ugc publicUpdateContentByShareCode \
    --channelId 'hyt2LNSc' \
    --namespace "$AB_NAMESPACE" \
    --shareCode 'z0m5pHEm' \
    --userId 'VDyekN84' \
    --body '{"contentType": "VeeFqSBE", "customAttributes": {"bniqrqxu": {}, "h1FndiMA": {}, "7eqczC9q": {}}, "fileExtension": "8vlmJr1o", "name": "bjT40yqG", "payload": "RvMS4oFm", "preview": "xaezeuBO", "previewMetadata": {"previewContentType": "cwRNALEo", "previewFileExtension": "Scyi0z2C"}, "subType": "96mlqUHA", "tags": ["QJ2bI2xp", "MCZWxu6z", "LSOEtw4n"], "type": "U3yyoYgx", "updateContentFile": false}' \
    > test.out 2>&1
eval_tap $? 80 'PublicUpdateContentByShareCode' test.out

#- 81 UpdateContentS3
./ng net.accelbyte.sdk.cli.Main ugc updateContentS3 \
    --channelId '8wFUy1zc' \
    --contentId 'k8mHRXO5' \
    --namespace "$AB_NAMESPACE" \
    --userId '1wHnOMFK' \
    --body '{"contentType": "tMEslihP", "customAttributes": {"Q4AaqGmL": {}, "7kCm2llr": {}, "qQwkxFQw": {}}, "fileExtension": "QLMugUEk", "name": "sO18QhAj", "payload": "4ixneG3X", "preview": "4NjMNDF5", "previewMetadata": {"previewContentType": "5sBzb1Kk", "previewFileExtension": "MdlOA8d6"}, "subType": "9WWPLiVJ", "tags": ["qhqkKdVt", "M9US3bjZ", "xrY3jeKK"], "type": "C9AtGMZ6", "updateContentFile": true}' \
    > test.out 2>&1
eval_tap $? 81 'UpdateContentS3' test.out

#- 82 PublicDeleteContentByShareCode
./ng net.accelbyte.sdk.cli.Main ugc publicDeleteContentByShareCode \
    --channelId 'fh4tUDGe' \
    --namespace "$AB_NAMESPACE" \
    --shareCode 'ouFGHbWY' \
    --userId 'BqwfFMIU' \
    > test.out 2>&1
eval_tap $? 82 'PublicDeleteContentByShareCode' test.out

#- 83 UpdateContentDirect
eval_tap 0 83 'UpdateContentDirect # SKIP deprecated' test.out

#- 84 DeleteContent
./ng net.accelbyte.sdk.cli.Main ugc deleteContent \
    --channelId 'yovWoqLD' \
    --contentId 'onU9TP59' \
    --namespace "$AB_NAMESPACE" \
    --userId '18Yd3osZ' \
    > test.out 2>&1
eval_tap $? 84 'DeleteContent' test.out

#- 85 UpdateContentShareCode
./ng net.accelbyte.sdk.cli.Main ugc updateContentShareCode \
    --channelId 'DFhTh8nL' \
    --contentId 'Evorawhz' \
    --namespace "$AB_NAMESPACE" \
    --userId 'hw6D4dKN' \
    --body '{"shareCode": "V3W4yVgM"}' \
    > test.out 2>&1
eval_tap $? 85 'UpdateContentShareCode' test.out

#- 86 PublicGetUserContent
./ng net.accelbyte.sdk.cli.Main ugc publicGetUserContent \
    --namespace "$AB_NAMESPACE" \
    --userId 'rsT0hQnA' \
    --limit '55' \
    --offset '36' \
    > test.out 2>&1
eval_tap $? 86 'PublicGetUserContent' test.out

#- 87 DeleteAllUserContents
./ng net.accelbyte.sdk.cli.Main ugc deleteAllUserContents \
    --namespace "$AB_NAMESPACE" \
    --userId 'fXAe7CAR' \
    > test.out 2>&1
eval_tap $? 87 'DeleteAllUserContents' test.out

#- 88 UpdateScreenshots
./ng net.accelbyte.sdk.cli.Main ugc updateScreenshots \
    --contentId 'EqdEQOug' \
    --namespace "$AB_NAMESPACE" \
    --userId '4z1iNw8I' \
    --body '{"screenshots": [{"description": "TM3da1xO", "screenshotId": "M5IJTtWS"}, {"description": "sI3T2Amf", "screenshotId": "MdptQTRY"}, {"description": "addno2qT", "screenshotId": "RgD2Rl02"}]}' \
    > test.out 2>&1
eval_tap $? 88 'UpdateScreenshots' test.out

#- 89 UploadContentScreenshot
./ng net.accelbyte.sdk.cli.Main ugc uploadContentScreenshot \
    --contentId 'EgWpYQF5' \
    --namespace "$AB_NAMESPACE" \
    --userId 'bRfVQ2KT' \
    --body '{"screenshots": [{"contentType": "TNsLD4YO", "description": "4NqfA6cz", "fileExtension": "png"}, {"contentType": "85drjA7h", "description": "CwRTRcLr", "fileExtension": "png"}, {"contentType": "xrUuzBnn", "description": "Umex3MaA", "fileExtension": "jfif"}]}' \
    > test.out 2>&1
eval_tap $? 89 'UploadContentScreenshot' test.out

#- 90 DeleteContentScreenshot
./ng net.accelbyte.sdk.cli.Main ugc deleteContentScreenshot \
    --contentId 'p5Te5xK4' \
    --namespace "$AB_NAMESPACE" \
    --screenshotId 'Wy5mMdiu' \
    --userId '0bcrdVhl' \
    > test.out 2>&1
eval_tap $? 90 'DeleteContentScreenshot' test.out

#- 91 UpdateUserFollowStatus
./ng net.accelbyte.sdk.cli.Main ugc updateUserFollowStatus \
    --namespace "$AB_NAMESPACE" \
    --userId 'dx5xrEx0' \
    --body '{"followStatus": false}' \
    > test.out 2>&1
eval_tap $? 91 'UpdateUserFollowStatus' test.out

#- 92 GetPublicFollowers
./ng net.accelbyte.sdk.cli.Main ugc getPublicFollowers \
    --namespace "$AB_NAMESPACE" \
    --userId 'pad8L3Cq' \
    --limit '81' \
    --offset '33' \
    > test.out 2>&1
eval_tap $? 92 'GetPublicFollowers' test.out

#- 93 GetPublicFollowing
./ng net.accelbyte.sdk.cli.Main ugc getPublicFollowing \
    --namespace "$AB_NAMESPACE" \
    --userId 'Hk4vZt0p' \
    --limit '36' \
    --offset '22' \
    > test.out 2>&1
eval_tap $? 93 'GetPublicFollowing' test.out

#- 94 GetGroups
./ng net.accelbyte.sdk.cli.Main ugc getGroups \
    --namespace "$AB_NAMESPACE" \
    --userId 'KCZ3N0qo' \
    --limit '72' \
    --offset '80' \
    > test.out 2>&1
eval_tap $? 94 'GetGroups' test.out

#- 95 CreateGroup
./ng net.accelbyte.sdk.cli.Main ugc createGroup \
    --namespace "$AB_NAMESPACE" \
    --userId 'ZLoFBtT4' \
    --body '{"contents": ["mBuKkK5Z", "A8qI4SyV", "7TC09ynq"], "name": "kW2AJLQN"}' \
    > test.out 2>&1
eval_tap $? 95 'CreateGroup' test.out

#- 96 DeleteAllUserGroup
./ng net.accelbyte.sdk.cli.Main ugc deleteAllUserGroup \
    --namespace "$AB_NAMESPACE" \
    --userId 'GZwMgWPS' \
    > test.out 2>&1
eval_tap $? 96 'DeleteAllUserGroup' test.out

#- 97 GetGroup
./ng net.accelbyte.sdk.cli.Main ugc getGroup \
    --groupId 'Xu9OZ8ZZ' \
    --namespace "$AB_NAMESPACE" \
    --userId 'ZmXL950x' \
    > test.out 2>&1
eval_tap $? 97 'GetGroup' test.out

#- 98 UpdateGroup
./ng net.accelbyte.sdk.cli.Main ugc updateGroup \
    --groupId 'PpZBqy2O' \
    --namespace "$AB_NAMESPACE" \
    --userId 'N95097xn' \
    --body '{"contents": ["NsQFg4EB", "PN2Q6pXd", "h5wP7Ur9"], "name": "JUCgIPjc"}' \
    > test.out 2>&1
eval_tap $? 98 'UpdateGroup' test.out

#- 99 DeleteGroup
./ng net.accelbyte.sdk.cli.Main ugc deleteGroup \
    --groupId '3JfTAaLP' \
    --namespace "$AB_NAMESPACE" \
    --userId 'UkwpLhKr' \
    > test.out 2>&1
eval_tap $? 99 'DeleteGroup' test.out

#- 100 GetGroupContent
./ng net.accelbyte.sdk.cli.Main ugc getGroupContent \
    --groupId 'GKxoA65D' \
    --namespace "$AB_NAMESPACE" \
    --userId 'wss3PPLa' \
    --limit '94' \
    --offset '63' \
    > test.out 2>&1
eval_tap $? 100 'GetGroupContent' test.out

#- 101 DeleteAllUserStates
./ng net.accelbyte.sdk.cli.Main ugc deleteAllUserStates \
    --namespace "$AB_NAMESPACE" \
    --userId 'Ojq4GHqD' \
    > test.out 2>&1
eval_tap $? 101 'DeleteAllUserStates' test.out

#- 102 AdminGetContentByChannelIDV2
./ng net.accelbyte.sdk.cli.Main ugc adminGetContentByChannelIDV2 \
    --channelId '8M0iBKeK' \
    --namespace "$AB_NAMESPACE" \
    --limit '29' \
    --name 'Wypg2BjS' \
    --offset '72' \
    --sortBy '1RAsdEmi' \
    > test.out 2>&1
eval_tap $? 102 'AdminGetContentByChannelIDV2' test.out

#- 103 AdminCreateContentV2
./ng net.accelbyte.sdk.cli.Main ugc adminCreateContentV2 \
    --channelId 'q5O9kG06' \
    --namespace "$AB_NAMESPACE" \
    --body '{"contentType": "PP44UnrL", "customAttributes": {"KGu7ErYl": {}, "N0fKijJj": {}, "TtoMoA4k": {}}, "fileExtension": "lWfwMdu1", "name": "9nb1N4aZ", "shareCode": "YM2Y3l67", "subType": "S6gir4VY", "tags": ["wNRuTQTO", "PqCdDPrg", "0po13Ay9"], "type": "JMCXaBeH"}' \
    > test.out 2>&1
eval_tap $? 103 'AdminCreateContentV2' test.out

#- 104 AdminDeleteOfficialContentV2
./ng net.accelbyte.sdk.cli.Main ugc adminDeleteOfficialContentV2 \
    --channelId 'MAM7juEe' \
    --contentId 'sewmch9p' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 104 'AdminDeleteOfficialContentV2' test.out

#- 105 AdminUpdateOfficialContentV2
./ng net.accelbyte.sdk.cli.Main ugc adminUpdateOfficialContentV2 \
    --channelId 'ICVWLblm' \
    --contentId 'xTBdq08M' \
    --namespace "$AB_NAMESPACE" \
    --body '{"customAttributes": {"XRu1DUdD": {}, "TBr3VmB2": {}, "qOz04tgb": {}}, "name": "c32qkpYW", "shareCode": "3BVoo7yq", "subType": "53ZNvyZK", "tags": ["MtIU99ea", "u0bdEsSh", "UQiHt8Ni"], "type": "wz3pSvF3"}' \
    > test.out 2>&1
eval_tap $? 105 'AdminUpdateOfficialContentV2' test.out

#- 106 AdminCopyContent
./ng net.accelbyte.sdk.cli.Main ugc adminCopyContent \
    --channelId 'jncGliak' \
    --contentId '5v3n4T5L' \
    --namespace "$AB_NAMESPACE" \
    --body '{"customAttributes": {"agElOPLg": {}, "IBa9Uc2T": {}, "ejxe1dUB": {}}, "name": "0kkt2yBv", "subType": "BUf8ui6P", "tags": ["ZvRzHfNG", "qHZHBIRP", "g0lK6T24"], "targetChannelId": "S8nYcgzC", "type": "khPiOaAK"}' \
    > test.out 2>&1
eval_tap $? 106 'AdminCopyContent' test.out

#- 107 AdminUpdateOfficialContentFileLocation
./ng net.accelbyte.sdk.cli.Main ugc adminUpdateOfficialContentFileLocation \
    --channelId 'INqhmYya' \
    --contentId 'zjnjbsGY' \
    --namespace "$AB_NAMESPACE" \
    --body '{"fileExtension": "cLDNYgnk", "fileLocation": "dGZTuoDu"}' \
    > test.out 2>&1
eval_tap $? 107 'AdminUpdateOfficialContentFileLocation' test.out

#- 108 AdminGenerateOfficialContentUploadURLV2
./ng net.accelbyte.sdk.cli.Main ugc adminGenerateOfficialContentUploadURLV2 \
    --channelId 'XcRyDp39' \
    --contentId '9EFZEajn' \
    --namespace "$AB_NAMESPACE" \
    --body '{"contentType": "soF0sqFS", "fileExtension": "h1l6rAXG"}' \
    > test.out 2>&1
eval_tap $? 108 'AdminGenerateOfficialContentUploadURLV2' test.out

#- 109 AdminGetConfigs
./ng net.accelbyte.sdk.cli.Main ugc adminGetConfigs \
    --namespace "$AB_NAMESPACE" \
    --limit '77' \
    --offset '28' \
    > test.out 2>&1
eval_tap $? 109 'AdminGetConfigs' test.out

#- 110 AdminUpdateConfig
./ng net.accelbyte.sdk.cli.Main ugc adminUpdateConfig \
    --key 'pljao6gs' \
    --namespace "$AB_NAMESPACE" \
    --body '{"value": "RVaNzT9p"}' \
    > test.out 2>&1
eval_tap $? 110 'AdminUpdateConfig' test.out

#- 111 AdminListContentV2
./ng net.accelbyte.sdk.cli.Main ugc adminListContentV2 \
    --namespace "$AB_NAMESPACE" \
    --isOfficial  \
    --limit '74' \
    --name 'MO20EYp6' \
    --offset '5' \
    --sortBy 'HFlypqoR' \
    --subType 'pPSUYQkb' \
    --tags '6kmiwm9R,pOlThObj,O8REpWfA' \
    --type 'fi501B6I' \
    > test.out 2>&1
eval_tap $? 111 'AdminListContentV2' test.out

#- 112 AdminBulkGetContentByIDsV2
./ng net.accelbyte.sdk.cli.Main ugc adminBulkGetContentByIDsV2 \
    --namespace "$AB_NAMESPACE" \
    --body '{"contentIds": ["HOdYb10v", "f6Kfi6S4", "YgNaPkzG"]}' \
    > test.out 2>&1
eval_tap $? 112 'AdminBulkGetContentByIDsV2' test.out

#- 113 AdminGetContentBulkByShareCodesV2
./ng net.accelbyte.sdk.cli.Main ugc adminGetContentBulkByShareCodesV2 \
    --namespace "$AB_NAMESPACE" \
    --body '{"shareCodes": ["BO31syvt", "bisAA2ka", "Vy713qtM"]}' \
    > test.out 2>&1
eval_tap $? 113 'AdminGetContentBulkByShareCodesV2' test.out

#- 114 AdminGetContentByShareCodeV2
./ng net.accelbyte.sdk.cli.Main ugc adminGetContentByShareCodeV2 \
    --namespace "$AB_NAMESPACE" \
    --shareCode 'XV2KwPRV' \
    > test.out 2>&1
eval_tap $? 114 'AdminGetContentByShareCodeV2' test.out

#- 115 AdminGetContentByContentIDV2
./ng net.accelbyte.sdk.cli.Main ugc adminGetContentByContentIDV2 \
    --contentId 'LdHuuhf0' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 115 'AdminGetContentByContentIDV2' test.out

#- 116 RollbackContentVersionV2
./ng net.accelbyte.sdk.cli.Main ugc rollbackContentVersionV2 \
    --contentId 'uwZET97j' \
    --namespace "$AB_NAMESPACE" \
    --versionId 'JfQWDQVZ' \
    > test.out 2>&1
eval_tap $? 116 'RollbackContentVersionV2' test.out

#- 117 AdminUpdateScreenshotsV2
./ng net.accelbyte.sdk.cli.Main ugc adminUpdateScreenshotsV2 \
    --contentId 'cOLb7Yiz' \
    --namespace "$AB_NAMESPACE" \
    --body '{"screenshots": [{"description": "otitV1S6", "screenshotId": "NPivM5hK"}, {"description": "31h8C8FR", "screenshotId": "VnOnxLH0"}, {"description": "KTcdldWv", "screenshotId": "6vgUj2cx"}]}' \
    > test.out 2>&1
eval_tap $? 117 'AdminUpdateScreenshotsV2' test.out

#- 118 AdminUploadContentScreenshotV2
./ng net.accelbyte.sdk.cli.Main ugc adminUploadContentScreenshotV2 \
    --contentId 'uCb53q9J' \
    --namespace "$AB_NAMESPACE" \
    --body '{"screenshots": [{"contentType": "iP2Rq6fb", "description": "oJx1mtwQ", "fileExtension": "jpg"}, {"contentType": "jiYMtRow", "description": "UmRxkPTb", "fileExtension": "bmp"}, {"contentType": "RZ2V2ucV", "description": "am6YVQmh", "fileExtension": "jfif"}]}' \
    > test.out 2>&1
eval_tap $? 118 'AdminUploadContentScreenshotV2' test.out

#- 119 AdminDeleteContentScreenshotV2
./ng net.accelbyte.sdk.cli.Main ugc adminDeleteContentScreenshotV2 \
    --contentId 'tj2WtBu9' \
    --namespace "$AB_NAMESPACE" \
    --screenshotId 'dnQonZwL' \
    > test.out 2>&1
eval_tap $? 119 'AdminDeleteContentScreenshotV2' test.out

#- 120 ListContentVersionsV2
./ng net.accelbyte.sdk.cli.Main ugc listContentVersionsV2 \
    --contentId 'lRox7uSj' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 120 'ListContentVersionsV2' test.out

#- 121 AdminGetOfficialGroupContentsV2
./ng net.accelbyte.sdk.cli.Main ugc adminGetOfficialGroupContentsV2 \
    --groupId 'fZ5AqpC7' \
    --namespace "$AB_NAMESPACE" \
    --limit '60' \
    --offset '60' \
    > test.out 2>&1
eval_tap $? 121 'AdminGetOfficialGroupContentsV2' test.out

#- 122 AdminListStagingContents
./ng net.accelbyte.sdk.cli.Main ugc adminListStagingContents \
    --namespace "$AB_NAMESPACE" \
    --limit '38' \
    --offset '99' \
    --sortBy 'j9UtNlfC' \
    --status 'IKinxpli' \
    > test.out 2>&1
eval_tap $? 122 'AdminListStagingContents' test.out

#- 123 AdminGetStagingContentByID
./ng net.accelbyte.sdk.cli.Main ugc adminGetStagingContentByID \
    --contentId '0Lf4VBZ2' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 123 'AdminGetStagingContentByID' test.out

#- 124 AdminApproveStagingContent
./ng net.accelbyte.sdk.cli.Main ugc adminApproveStagingContent \
    --contentId 'LqqlL4Qh' \
    --namespace "$AB_NAMESPACE" \
    --body '{"approved": true, "note": "XBhziJzb"}' \
    > test.out 2>&1
eval_tap $? 124 'AdminApproveStagingContent' test.out

#- 125 AdminUpdateContentByShareCodeV2
./ng net.accelbyte.sdk.cli.Main ugc adminUpdateContentByShareCodeV2 \
    --channelId 'eOigxOzw' \
    --namespace "$AB_NAMESPACE" \
    --shareCode 'dbxQ3Ygz' \
    --userId 'UwKShnk1' \
    --body '{"customAttributes": {"9L0K6xeY": {}, "hPNvKeJF": {}, "b00dKnNB": {}}, "name": "e2LoDPtr", "shareCode": "PajVIA4b", "subType": "OxQe1zDM", "tags": ["x07rcDFX", "U5C1OYMz", "wRETILtH"], "type": "djOlRiZL"}' \
    > test.out 2>&1
eval_tap $? 125 'AdminUpdateContentByShareCodeV2' test.out

#- 126 AdminDeleteContentByShareCodeV2
./ng net.accelbyte.sdk.cli.Main ugc adminDeleteContentByShareCodeV2 \
    --channelId 'F3iYrCXH' \
    --namespace "$AB_NAMESPACE" \
    --shareCode 'JsajUWNr' \
    --userId 'CKDRneUc' \
    > test.out 2>&1
eval_tap $? 126 'AdminDeleteContentByShareCodeV2' test.out

#- 127 AdminDeleteUserContentV2
./ng net.accelbyte.sdk.cli.Main ugc adminDeleteUserContentV2 \
    --channelId 'GaNn9fbt' \
    --contentId 'n1pLCu41' \
    --namespace "$AB_NAMESPACE" \
    --userId 'PhVbLnwR' \
    > test.out 2>&1
eval_tap $? 127 'AdminDeleteUserContentV2' test.out

#- 128 AdminUpdateUserContentV2
./ng net.accelbyte.sdk.cli.Main ugc adminUpdateUserContentV2 \
    --channelId 'GHu1UBMW' \
    --contentId 'hP0JjrhK' \
    --namespace "$AB_NAMESPACE" \
    --userId 'olmaQUV3' \
    --body '{"customAttributes": {"rVShPtfk": {}, "NyaNStbe": {}, "viI8sioI": {}}, "name": "BgUPotcK", "shareCode": "fR4eW4TX", "subType": "NsszDXdg", "tags": ["e02Zr9S5", "r9ti9dWB", "qu0HI32P"], "type": "3NODZsTR"}' \
    > test.out 2>&1
eval_tap $? 128 'AdminUpdateUserContentV2' test.out

#- 129 AdminUpdateUserContentFileLocation
./ng net.accelbyte.sdk.cli.Main ugc adminUpdateUserContentFileLocation \
    --channelId '2oKdjtCM' \
    --contentId 'LbVLm1MA' \
    --namespace "$AB_NAMESPACE" \
    --userId 'pg8fl4yu' \
    --body '{"fileExtension": "b2iPku56", "fileLocation": "h9kRx9hQ"}' \
    > test.out 2>&1
eval_tap $? 129 'AdminUpdateUserContentFileLocation' test.out

#- 130 AdminGenerateUserContentUploadURLV2
./ng net.accelbyte.sdk.cli.Main ugc adminGenerateUserContentUploadURLV2 \
    --channelId 'MZwDHDR7' \
    --contentId 'GnrMvPiN' \
    --namespace "$AB_NAMESPACE" \
    --userId 'xh54TukD' \
    --body '{"contentType": "yVUl6if1", "fileExtension": "zSVeZyBS"}' \
    > test.out 2>&1
eval_tap $? 130 'AdminGenerateUserContentUploadURLV2' test.out

#- 131 AdminGetContentByUserIDV2
./ng net.accelbyte.sdk.cli.Main ugc adminGetContentByUserIDV2 \
    --namespace "$AB_NAMESPACE" \
    --userId 'gFn8MhJd' \
    --limit '5' \
    --offset '75' \
    --sortBy '1wVXlfcp' \
    > test.out 2>&1
eval_tap $? 131 'AdminGetContentByUserIDV2' test.out

#- 132 AdminUpdateContentHideStatusV2
./ng net.accelbyte.sdk.cli.Main ugc adminUpdateContentHideStatusV2 \
    --contentId 'YdnCis3G' \
    --namespace "$AB_NAMESPACE" \
    --userId '4G4ZGsnf' \
    --body '{"isHidden": true}' \
    > test.out 2>&1
eval_tap $? 132 'AdminUpdateContentHideStatusV2' test.out

#- 133 AdminGetUserGroupContentsV2
./ng net.accelbyte.sdk.cli.Main ugc adminGetUserGroupContentsV2 \
    --groupId 'Uy2GG6Rh' \
    --namespace "$AB_NAMESPACE" \
    --userId 'wHxGiPEo' \
    --limit '9' \
    --offset '15' \
    > test.out 2>&1
eval_tap $? 133 'AdminGetUserGroupContentsV2' test.out

#- 134 AdminListUserStagingContents
./ng net.accelbyte.sdk.cli.Main ugc adminListUserStagingContents \
    --namespace "$AB_NAMESPACE" \
    --userId 'oVsdh01E' \
    --limit '53' \
    --offset '34' \
    --sortBy 'M5qFe6TS' \
    --status '8oS11GD9' \
    > test.out 2>&1
eval_tap $? 134 'AdminListUserStagingContents' test.out

#- 135 PublicGetContentByChannelIDV2
./ng net.accelbyte.sdk.cli.Main ugc publicGetContentByChannelIDV2 \
    --channelId 'BOcvGBuN' \
    --namespace "$AB_NAMESPACE" \
    --limit '64' \
    --name 'Q5xfe5x9' \
    --offset '79' \
    --sortBy 'wf4Minbn' \
    > test.out 2>&1
eval_tap $? 135 'PublicGetContentByChannelIDV2' test.out

#- 136 PublicListContentV2
./ng net.accelbyte.sdk.cli.Main ugc publicListContentV2 \
    --namespace "$AB_NAMESPACE" \
    --isOfficial  \
    --limit '78' \
    --name 'AXVDBWyc' \
    --offset '1' \
    --sortBy 'InMW532p' \
    --subType 'owYcFlwj' \
    --tags 'kksCWOC8,YBUbSCe7,mXvS7Xum' \
    --type 'aQ3kjHFG' \
    > test.out 2>&1
eval_tap $? 136 'PublicListContentV2' test.out

#- 137 PublicBulkGetContentByIDV2
./ng net.accelbyte.sdk.cli.Main ugc publicBulkGetContentByIDV2 \
    --namespace "$AB_NAMESPACE" \
    --body '{"contentIds": ["yh1dQUvt", "5B9r7fvZ", "Dz4tCaT5"]}' \
    > test.out 2>&1
eval_tap $? 137 'PublicBulkGetContentByIDV2' test.out

#- 138 PublicGetContentBulkByShareCodesV2
./ng net.accelbyte.sdk.cli.Main ugc publicGetContentBulkByShareCodesV2 \
    --namespace "$AB_NAMESPACE" \
    --body '{"shareCodes": ["lwPir4ki", "rcuZ5zWH", "cpFfdFHH"]}' \
    > test.out 2>&1
eval_tap $? 138 'PublicGetContentBulkByShareCodesV2' test.out

#- 139 PublicGetContentByShareCodeV2
./ng net.accelbyte.sdk.cli.Main ugc publicGetContentByShareCodeV2 \
    --namespace "$AB_NAMESPACE" \
    --shareCode 'W0ImezCh' \
    > test.out 2>&1
eval_tap $? 139 'PublicGetContentByShareCodeV2' test.out

#- 140 PublicGetContentByIDV2
./ng net.accelbyte.sdk.cli.Main ugc publicGetContentByIDV2 \
    --contentId 'Ezkk9koC' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 140 'PublicGetContentByIDV2' test.out

#- 141 PublicAddDownloadCountV2
./ng net.accelbyte.sdk.cli.Main ugc publicAddDownloadCountV2 \
    --contentId '3ayS7Dpz' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 141 'PublicAddDownloadCountV2' test.out

#- 142 PublicListContentDownloaderV2
./ng net.accelbyte.sdk.cli.Main ugc publicListContentDownloaderV2 \
    --contentId 'qDFukNWA' \
    --namespace "$AB_NAMESPACE" \
    --limit '92' \
    --offset '35' \
    --sortBy 'xQeQHDg3' \
    --userId 'sIYxu2g6' \
    > test.out 2>&1
eval_tap $? 142 'PublicListContentDownloaderV2' test.out

#- 143 PublicListContentLikeV2
./ng net.accelbyte.sdk.cli.Main ugc publicListContentLikeV2 \
    --contentId 'JJaggUg4' \
    --namespace "$AB_NAMESPACE" \
    --limit '70' \
    --offset '88' \
    --sortBy 'FDyUcPb7' \
    > test.out 2>&1
eval_tap $? 143 'PublicListContentLikeV2' test.out

#- 144 UpdateContentLikeStatusV2
./ng net.accelbyte.sdk.cli.Main ugc updateContentLikeStatusV2 \
    --contentId 'LWzeGurJ' \
    --namespace "$AB_NAMESPACE" \
    --body '{"likeStatus": false}' \
    > test.out 2>&1
eval_tap $? 144 'UpdateContentLikeStatusV2' test.out

#- 145 PublicCreateContentV2
./ng net.accelbyte.sdk.cli.Main ugc publicCreateContentV2 \
    --channelId 'fJVo2o68' \
    --namespace "$AB_NAMESPACE" \
    --userId 'jANjwr2L' \
    --body '{"contentType": "YJ6iV52e", "customAttributes": {"NKTkNEkA": {}, "WJK9myg4": {}, "QdqREIK2": {}}, "fileExtension": "F0ZcEBo7", "name": "7I0b7tdF", "subType": "vKP0S1J7", "tags": ["r3E2LrDC", "wWyLoOHv", "3qxNeAT7"], "type": "IygavXep"}' \
    > test.out 2>&1
eval_tap $? 145 'PublicCreateContentV2' test.out

#- 146 PublicUpdateContentByShareCodeV2
./ng net.accelbyte.sdk.cli.Main ugc publicUpdateContentByShareCodeV2 \
    --channelId '6Tm4GEal' \
    --namespace "$AB_NAMESPACE" \
    --shareCode 'UAA7nx2G' \
    --userId 'eWEuCAAO' \
    --body '{"customAttributes": {"bVR0mSdF": {}, "45iqulwN": {}, "taejppm7": {}}, "name": "vouJoPli", "subType": "oVSF5r7F", "tags": ["agFvgAmL", "KXUOgnLV", "tEoFyoqb"], "type": "Gd33vbSs"}' \
    > test.out 2>&1
eval_tap $? 146 'PublicUpdateContentByShareCodeV2' test.out

#- 147 PublicDeleteContentByShareCodeV2
./ng net.accelbyte.sdk.cli.Main ugc publicDeleteContentByShareCodeV2 \
    --channelId 'Ud1lhyEf' \
    --namespace "$AB_NAMESPACE" \
    --shareCode 'ecPxKisY' \
    --userId 'oqrqr1bK' \
    > test.out 2>&1
eval_tap $? 147 'PublicDeleteContentByShareCodeV2' test.out

#- 148 PublicDeleteContentV2
./ng net.accelbyte.sdk.cli.Main ugc publicDeleteContentV2 \
    --channelId '3MalS4hL' \
    --contentId 'IH6wg1qX' \
    --namespace "$AB_NAMESPACE" \
    --userId 'yjaKXxOI' \
    > test.out 2>&1
eval_tap $? 148 'PublicDeleteContentV2' test.out

#- 149 PublicUpdateContentV2
./ng net.accelbyte.sdk.cli.Main ugc publicUpdateContentV2 \
    --channelId 'iFoRe01F' \
    --contentId 'K0qD49TY' \
    --namespace "$AB_NAMESPACE" \
    --userId 'bRiMz7KO' \
    --body '{"customAttributes": {"ZSn52ZiY": {}, "xhmkcbaE": {}, "2tAj6bhB": {}}, "name": "dlApeGa5", "subType": "jN31bCql", "tags": ["gZXpN2nM", "swW0Psn5", "3wvzyHje"], "type": "r7HhwexY"}' \
    > test.out 2>&1
eval_tap $? 149 'PublicUpdateContentV2' test.out

#- 150 PublicUpdateContentFileLocation
./ng net.accelbyte.sdk.cli.Main ugc publicUpdateContentFileLocation \
    --channelId 'rslLcZ1m' \
    --contentId 'xJcBcC6b' \
    --namespace "$AB_NAMESPACE" \
    --userId 'p6IG5gqF' \
    --body '{"fileExtension": "5yBBSw6e", "fileLocation": "50XTnfE1"}' \
    > test.out 2>&1
eval_tap $? 150 'PublicUpdateContentFileLocation' test.out

#- 151 UpdateContentShareCodeV2
./ng net.accelbyte.sdk.cli.Main ugc updateContentShareCodeV2 \
    --channelId '6vG8sETo' \
    --contentId 'H7nVb1HF' \
    --namespace "$AB_NAMESPACE" \
    --userId 'OzfJ5NxK' \
    --body '{"shareCode": "3udAEp2c"}' \
    > test.out 2>&1
eval_tap $? 151 'UpdateContentShareCodeV2' test.out

#- 152 PublicGenerateContentUploadURLV2
./ng net.accelbyte.sdk.cli.Main ugc publicGenerateContentUploadURLV2 \
    --channelId 'rLsiOYEM' \
    --contentId 'BDzcniUh' \
    --namespace "$AB_NAMESPACE" \
    --userId 'eWrB2um1' \
    --body '{"contentType": "QdfrXBYV", "fileExtension": "2kJOCcQn"}' \
    > test.out 2>&1
eval_tap $? 152 'PublicGenerateContentUploadURLV2' test.out

#- 153 PublicGetContentByUserIDV2
./ng net.accelbyte.sdk.cli.Main ugc publicGetContentByUserIDV2 \
    --namespace "$AB_NAMESPACE" \
    --userId 'TNZDV1zO' \
    --limit '31' \
    --offset '83' \
    --sortBy 'XTvZPz9F' \
    > test.out 2>&1
eval_tap $? 153 'PublicGetContentByUserIDV2' test.out

#- 154 UpdateScreenshotsV2
./ng net.accelbyte.sdk.cli.Main ugc updateScreenshotsV2 \
    --contentId '6x6WAmG0' \
    --namespace "$AB_NAMESPACE" \
    --userId 'wUcBgyIL' \
    --body '{"screenshots": [{"description": "FtJthhtt", "screenshotId": "7rF23tSa"}, {"description": "elv45s0C", "screenshotId": "zdOHvRqu"}, {"description": "PSxXg3jj", "screenshotId": "oUIrDEiT"}]}' \
    > test.out 2>&1
eval_tap $? 154 'UpdateScreenshotsV2' test.out

#- 155 UploadContentScreenshotV2
./ng net.accelbyte.sdk.cli.Main ugc uploadContentScreenshotV2 \
    --contentId 'NU0CcG9x' \
    --namespace "$AB_NAMESPACE" \
    --userId 'u8zJ6b72' \
    --body '{"screenshots": [{"contentType": "hFm1Ft6o", "description": "LKWiX8H7", "fileExtension": "jpeg"}, {"contentType": "cyl5ct7K", "description": "sPZxO2Qy", "fileExtension": "bmp"}, {"contentType": "SlZDBmU2", "description": "2xrAdtqG", "fileExtension": "png"}]}' \
    > test.out 2>&1
eval_tap $? 155 'UploadContentScreenshotV2' test.out

#- 156 DeleteContentScreenshotV2
./ng net.accelbyte.sdk.cli.Main ugc deleteContentScreenshotV2 \
    --contentId 'jW6KaJAp' \
    --namespace "$AB_NAMESPACE" \
    --screenshotId 'REsjYzzI' \
    --userId 'nIUk1Yvg' \
    > test.out 2>&1
eval_tap $? 156 'DeleteContentScreenshotV2' test.out

#- 157 PublicGetGroupContentsV2
./ng net.accelbyte.sdk.cli.Main ugc publicGetGroupContentsV2 \
    --groupId 'JVaNm2j8' \
    --namespace "$AB_NAMESPACE" \
    --userId 'IvgF01k3' \
    --limit '77' \
    --offset '91' \
    > test.out 2>&1
eval_tap $? 157 'PublicGetGroupContentsV2' test.out

#- 158 ListUserStagingContents
./ng net.accelbyte.sdk.cli.Main ugc listUserStagingContents \
    --namespace "$AB_NAMESPACE" \
    --userId 'tmWq58NR' \
    --limit '47' \
    --offset '13' \
    --sortBy '5ltX9Vs9' \
    --status 'HteLhr6a' \
    > test.out 2>&1
eval_tap $? 158 'ListUserStagingContents' test.out

#- 159 GetUserStagingContentByID
./ng net.accelbyte.sdk.cli.Main ugc getUserStagingContentByID \
    --contentId 'L9QJNQ2H' \
    --namespace "$AB_NAMESPACE" \
    --userId '6QedbIBZ' \
    > test.out 2>&1
eval_tap $? 159 'GetUserStagingContentByID' test.out

#- 160 UpdateStagingContent
./ng net.accelbyte.sdk.cli.Main ugc updateStagingContent \
    --contentId 'n1DKRW0O' \
    --namespace "$AB_NAMESPACE" \
    --userId 'IyrDFsa3' \
    --body '{"fileExtension": "KqZYUO5c", "fileLocation": "zTOinNYG"}' \
    > test.out 2>&1
eval_tap $? 160 'UpdateStagingContent' test.out

#- 161 DeleteUserStagingContentByID
./ng net.accelbyte.sdk.cli.Main ugc deleteUserStagingContentByID \
    --contentId 'qgS1IuQj' \
    --namespace "$AB_NAMESPACE" \
    --userId 'CHDBRvza' \
    > test.out 2>&1
eval_tap $? 161 'DeleteUserStagingContentByID' test.out


rm -f "tmp.dat"

exit $EXIT_CODE