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
    --limit '90' \
    --offset '87' \
    > test.out 2>&1
eval_tap $? 2 'SingleAdminGetChannel' test.out

#- 3 AdminCreateChannel
./ng net.accelbyte.sdk.cli.Main ugc adminCreateChannel \
    --namespace "$AB_NAMESPACE" \
    --body '{"id": "l96OqJC0", "name": "H2fqAPeD"}' \
    > test.out 2>&1
eval_tap $? 3 'AdminCreateChannel' test.out

#- 4 SingleAdminUpdateChannel
./ng net.accelbyte.sdk.cli.Main ugc singleAdminUpdateChannel \
    --channelId 'wGnUH1ZQ' \
    --namespace "$AB_NAMESPACE" \
    --body '{"name": "tN0eaKLp"}' \
    > test.out 2>&1
eval_tap $? 4 'SingleAdminUpdateChannel' test.out

#- 5 SingleAdminDeleteChannel
./ng net.accelbyte.sdk.cli.Main ugc singleAdminDeleteChannel \
    --channelId 'M0yvJia0' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 5 'SingleAdminDeleteChannel' test.out

#- 6 AdminUploadContentDirect
eval_tap 0 6 'AdminUploadContentDirect # SKIP deprecated' test.out

#- 7 AdminUploadContentS3
./ng net.accelbyte.sdk.cli.Main ugc adminUploadContentS3 \
    --channelId 'KrmXTi0O' \
    --namespace "$AB_NAMESPACE" \
    --body '{"contentType": "d9H4n7X2", "customAttributes": {"66mSB2KI": {}, "vSqwoJZ8": {}, "WFOan3ED": {}}, "fileExtension": "ntQVVXpr", "name": "rrZpQRqa", "preview": "bh3VfwuG", "previewMetadata": {"previewContentType": "LVsEwmqF", "previewFileExtension": "7bsgOgCD"}, "shareCode": "ccK1vqek", "subType": "4ZuEGCHp", "tags": ["qBcRXsoT", "aeMGjH12", "ero8tREQ"], "type": "rJiBokBC"}' \
    > test.out 2>&1
eval_tap $? 7 'AdminUploadContentS3' test.out

#- 8 SingleAdminUpdateContentS3
./ng net.accelbyte.sdk.cli.Main ugc singleAdminUpdateContentS3 \
    --channelId 'XbkIXTGs' \
    --contentId 'qlZmZn9G' \
    --namespace "$AB_NAMESPACE" \
    --body '{"contentType": "ZpYvosUi", "customAttributes": {"Lejgw8xv": {}, "UqDnohtC": {}, "AH5aCHX1": {}}, "fileExtension": "bgoqNhIn", "name": "dHiKivtY", "payload": "WK5qQOKr", "preview": "1rWvlthi", "previewMetadata": {"previewContentType": "HKNf2mo9", "previewFileExtension": "pYAnrtmc"}, "shareCode": "Oe8Cm6BF", "subType": "hWoPAc9L", "tags": ["6NjtQrBd", "010M8aBw", "Z9uaCxKa"], "type": "WvwTJYLl", "updateContentFile": true}' \
    > test.out 2>&1
eval_tap $? 8 'SingleAdminUpdateContentS3' test.out

#- 9 AdminSearchChannelSpecificContent
./ng net.accelbyte.sdk.cli.Main ugc adminSearchChannelSpecificContent \
    --channelId 'hvGY8c2Y' \
    --namespace "$AB_NAMESPACE" \
    --creator 'v0ps2m3w' \
    --ishidden 'sWzEwBpz' \
    --isofficial 'SpKlftTL' \
    --limit '3' \
    --name '7YWy7ujQ' \
    --offset '48' \
    --orderby 'IzP85LD4' \
    --sortby 'pGzaL4CQ' \
    --subtype 'gJ5D955G' \
    --tags 'N3Sgjf8V,eId4qgFn,khnqoTqs' \
    --type '8KIFz2JV' \
    --userId 'B7W2vAd1' \
    > test.out 2>&1
eval_tap $? 9 'AdminSearchChannelSpecificContent' test.out

#- 10 SingleAdminUpdateContentDirect
eval_tap 0 10 'SingleAdminUpdateContentDirect # SKIP deprecated' test.out

#- 11 SingleAdminDeleteContent
./ng net.accelbyte.sdk.cli.Main ugc singleAdminDeleteContent \
    --channelId 'Tred3NGl' \
    --contentId '6KV8w3qL' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 11 'SingleAdminDeleteContent' test.out

#- 12 SingleAdminGetContent
./ng net.accelbyte.sdk.cli.Main ugc singleAdminGetContent \
    --namespace "$AB_NAMESPACE" \
    --limit '67' \
    --offset '94' \
    > test.out 2>&1
eval_tap $? 12 'SingleAdminGetContent' test.out

#- 13 AdminGetContentBulk
./ng net.accelbyte.sdk.cli.Main ugc adminGetContentBulk \
    --namespace "$AB_NAMESPACE" \
    --body '{"contentIds": ["TqVbT6i1", "DgurTDEO", "2psiUUXB"]}' \
    > test.out 2>&1
eval_tap $? 13 'AdminGetContentBulk' test.out

#- 14 AdminSearchContent
./ng net.accelbyte.sdk.cli.Main ugc adminSearchContent \
    --namespace "$AB_NAMESPACE" \
    --creator 'ALIHpgj5' \
    --ishidden 'XPuAYa4T' \
    --isofficial 'zg4ji79C' \
    --limit '97' \
    --name 'YL8XOXXH' \
    --offset '12' \
    --orderby 'tQvh1MPK' \
    --sortby 'KV8LpO8T' \
    --subtype '9AiFkJIA' \
    --tags 'qvYtymwL,92VW11b9,v1On8VW3' \
    --type 'gttk753P' \
    --userId 'IIhcJHSo' \
    > test.out 2>&1
eval_tap $? 14 'AdminSearchContent' test.out

#- 15 AdminGetContentBulkByShareCodes
./ng net.accelbyte.sdk.cli.Main ugc adminGetContentBulkByShareCodes \
    --namespace "$AB_NAMESPACE" \
    --body '{"shareCodes": ["fhdkXpEE", "RiyBaIOC", "fvCHLlev"]}' \
    > test.out 2>&1
eval_tap $? 15 'AdminGetContentBulkByShareCodes' test.out

#- 16 AdminGetUserContentByShareCode
./ng net.accelbyte.sdk.cli.Main ugc adminGetUserContentByShareCode \
    --namespace "$AB_NAMESPACE" \
    --shareCode 'OxnR0Gb6' \
    > test.out 2>&1
eval_tap $? 16 'AdminGetUserContentByShareCode' test.out

#- 17 AdminGetSpecificContent
./ng net.accelbyte.sdk.cli.Main ugc adminGetSpecificContent \
    --contentId '3l0J8lCF' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 17 'AdminGetSpecificContent' test.out

#- 18 AdminDownloadContentPreview
./ng net.accelbyte.sdk.cli.Main ugc adminDownloadContentPreview \
    --contentId '1SJ7Zw0o' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 18 'AdminDownloadContentPreview' test.out

#- 19 RollbackContentVersion
./ng net.accelbyte.sdk.cli.Main ugc rollbackContentVersion \
    --contentId 'tqocKffx' \
    --namespace "$AB_NAMESPACE" \
    --versionId 'lJw8WEYw' \
    > test.out 2>&1
eval_tap $? 19 'RollbackContentVersion' test.out

#- 20 AdminUpdateScreenshots
./ng net.accelbyte.sdk.cli.Main ugc adminUpdateScreenshots \
    --contentId 'GYXqIqFZ' \
    --namespace "$AB_NAMESPACE" \
    --body '{"screenshots": [{"description": "13tC0w9K", "screenshotId": "GcmT9F8k"}, {"description": "t4OVamnL", "screenshotId": "xu4sL6XO"}, {"description": "MRexyDl0", "screenshotId": "3fcva3uB"}]}' \
    > test.out 2>&1
eval_tap $? 20 'AdminUpdateScreenshots' test.out

#- 21 AdminUploadContentScreenshot
./ng net.accelbyte.sdk.cli.Main ugc adminUploadContentScreenshot \
    --contentId 'k4wvBZUN' \
    --namespace "$AB_NAMESPACE" \
    --body '{"screenshots": [{"contentType": "JbRSGQpq", "description": "Q2gvmCEM", "fileExtension": "bmp"}, {"contentType": "lTboYMDm", "description": "yAzLZ3t5", "fileExtension": "jfif"}, {"contentType": "Q9bomRnv", "description": "04CzsZyF", "fileExtension": "png"}]}' \
    > test.out 2>&1
eval_tap $? 21 'AdminUploadContentScreenshot' test.out

#- 22 AdminDeleteContentScreenshot
./ng net.accelbyte.sdk.cli.Main ugc adminDeleteContentScreenshot \
    --contentId 'h97vkOtO' \
    --namespace "$AB_NAMESPACE" \
    --screenshotId '4iC43rAT' \
    > test.out 2>&1
eval_tap $? 22 'AdminDeleteContentScreenshot' test.out

#- 23 ListContentVersions
./ng net.accelbyte.sdk.cli.Main ugc listContentVersions \
    --contentId 'RkukzjDR' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 23 'ListContentVersions' test.out

#- 24 SingleAdminGetAllGroups
./ng net.accelbyte.sdk.cli.Main ugc singleAdminGetAllGroups \
    --namespace "$AB_NAMESPACE" \
    --limit '30' \
    --offset '97' \
    > test.out 2>&1
eval_tap $? 24 'SingleAdminGetAllGroups' test.out

#- 25 AdminCreateGroup
./ng net.accelbyte.sdk.cli.Main ugc adminCreateGroup \
    --namespace "$AB_NAMESPACE" \
    --body '{"contents": ["ipjt0zFU", "EN8AUWdn", "Omk16nLT"], "name": "mabwTSlI"}' \
    > test.out 2>&1
eval_tap $? 25 'AdminCreateGroup' test.out

#- 26 SingleAdminGetGroup
./ng net.accelbyte.sdk.cli.Main ugc singleAdminGetGroup \
    --groupId 'fd5i5xqi' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 26 'SingleAdminGetGroup' test.out

#- 27 SingleAdminUpdateGroup
./ng net.accelbyte.sdk.cli.Main ugc singleAdminUpdateGroup \
    --groupId 'XFiRFulY' \
    --namespace "$AB_NAMESPACE" \
    --body '{"contents": ["njZ0jZDc", "gmyhMYUQ", "Ct0iS0Ag"], "name": "EO8DyJky"}' \
    > test.out 2>&1
eval_tap $? 27 'SingleAdminUpdateGroup' test.out

#- 28 SingleAdminDeleteGroup
./ng net.accelbyte.sdk.cli.Main ugc singleAdminDeleteGroup \
    --groupId 'IYQWC4Ur' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 28 'SingleAdminDeleteGroup' test.out

#- 29 SingleAdminGetGroupContents
./ng net.accelbyte.sdk.cli.Main ugc singleAdminGetGroupContents \
    --groupId 'U4DU5Ty6' \
    --namespace "$AB_NAMESPACE" \
    --limit '25' \
    --offset '3' \
    > test.out 2>&1
eval_tap $? 29 'SingleAdminGetGroupContents' test.out

#- 30 AdminGetTag
./ng net.accelbyte.sdk.cli.Main ugc adminGetTag \
    --namespace "$AB_NAMESPACE" \
    --limit '90' \
    --offset '31' \
    > test.out 2>&1
eval_tap $? 30 'AdminGetTag' test.out

#- 31 AdminCreateTag
./ng net.accelbyte.sdk.cli.Main ugc adminCreateTag \
    --namespace "$AB_NAMESPACE" \
    --body '{"tag": "eZthOKLe"}' \
    > test.out 2>&1
eval_tap $? 31 'AdminCreateTag' test.out

#- 32 AdminUpdateTag
./ng net.accelbyte.sdk.cli.Main ugc adminUpdateTag \
    --namespace "$AB_NAMESPACE" \
    --tagId 'b8ccDNgl' \
    --body '{"tag": "fHCEbr6V"}' \
    > test.out 2>&1
eval_tap $? 32 'AdminUpdateTag' test.out

#- 33 AdminDeleteTag
./ng net.accelbyte.sdk.cli.Main ugc adminDeleteTag \
    --namespace "$AB_NAMESPACE" \
    --tagId 'hBdON4Zi' \
    > test.out 2>&1
eval_tap $? 33 'AdminDeleteTag' test.out

#- 34 AdminGetType
./ng net.accelbyte.sdk.cli.Main ugc adminGetType \
    --namespace "$AB_NAMESPACE" \
    --limit '71' \
    --offset '70' \
    > test.out 2>&1
eval_tap $? 34 'AdminGetType' test.out

#- 35 AdminCreateType
./ng net.accelbyte.sdk.cli.Main ugc adminCreateType \
    --namespace "$AB_NAMESPACE" \
    --body '{"subtype": ["uJxmmHdE", "A9DtO5P4", "EwQ6d3v1"], "type": "Uin9rEjx"}' \
    > test.out 2>&1
eval_tap $? 35 'AdminCreateType' test.out

#- 36 AdminUpdateType
./ng net.accelbyte.sdk.cli.Main ugc adminUpdateType \
    --namespace "$AB_NAMESPACE" \
    --typeId 'cnFeppY6' \
    --body '{"subtype": ["1SiMSOaU", "S2y4WwPH", "vaxyTM8l"], "type": "pbB4p15N"}' \
    > test.out 2>&1
eval_tap $? 36 'AdminUpdateType' test.out

#- 37 AdminDeleteType
./ng net.accelbyte.sdk.cli.Main ugc adminDeleteType \
    --namespace "$AB_NAMESPACE" \
    --typeId 'x93Nz9Cz' \
    > test.out 2>&1
eval_tap $? 37 'AdminDeleteType' test.out

#- 38 AdminGetChannel
./ng net.accelbyte.sdk.cli.Main ugc adminGetChannel \
    --namespace "$AB_NAMESPACE" \
    --userId 'Vd0oI1tD' \
    --limit '3' \
    --name 'K5mrAWWd' \
    --offset '81' \
    > test.out 2>&1
eval_tap $? 38 'AdminGetChannel' test.out

#- 39 AdminDeleteAllUserChannels
./ng net.accelbyte.sdk.cli.Main ugc adminDeleteAllUserChannels \
    --namespace "$AB_NAMESPACE" \
    --userId '2C7FoxDC' \
    > test.out 2>&1
eval_tap $? 39 'AdminDeleteAllUserChannels' test.out

#- 40 AdminUpdateChannel
./ng net.accelbyte.sdk.cli.Main ugc adminUpdateChannel \
    --channelId 'VcomJzUL' \
    --namespace "$AB_NAMESPACE" \
    --userId 'EyT95uLh' \
    --body '{"name": "vIFNT0Fh"}' \
    > test.out 2>&1
eval_tap $? 40 'AdminUpdateChannel' test.out

#- 41 AdminDeleteChannel
./ng net.accelbyte.sdk.cli.Main ugc adminDeleteChannel \
    --channelId 'p6RR36dD' \
    --namespace "$AB_NAMESPACE" \
    --userId 'A26FFtn3' \
    > test.out 2>&1
eval_tap $? 41 'AdminDeleteChannel' test.out

#- 42 AdminUpdateContentS3ByShareCode
./ng net.accelbyte.sdk.cli.Main ugc adminUpdateContentS3ByShareCode \
    --channelId 'hU2RS9Ch' \
    --namespace "$AB_NAMESPACE" \
    --shareCode '5SE5lm9N' \
    --userId 'READyk5b' \
    --body '{"contentType": "s9knRnmp", "customAttributes": {"m5XsTUGc": {}, "bdJUiwLE": {}, "o3DdoHFS": {}}, "fileExtension": "wsmuKAXE", "name": "Iqj2WWew", "payload": "kMStAk4w", "preview": "D0qTHXVZ", "previewMetadata": {"previewContentType": "jf3fe2eg", "previewFileExtension": "S9maw9tS"}, "shareCode": "fN1R2xd0", "subType": "SoG1dUH3", "tags": ["1CtrDX0t", "XRuF1VKz", "sHTetukr"], "type": "9CduGBCB", "updateContentFile": true}' \
    > test.out 2>&1
eval_tap $? 42 'AdminUpdateContentS3ByShareCode' test.out

#- 43 AdminUpdateContentS3
./ng net.accelbyte.sdk.cli.Main ugc adminUpdateContentS3 \
    --channelId 'jcFvzcm9' \
    --contentId 'hCJnnxgA' \
    --namespace "$AB_NAMESPACE" \
    --userId 'aiCIC4aV' \
    --body '{"contentType": "mLpoZhHW", "customAttributes": {"ng8uEm3J": {}, "TNeAlGK0": {}, "IFs70OFM": {}}, "fileExtension": "g2gknheU", "name": "6bnqAvTZ", "payload": "XsYzmJJB", "preview": "9698p6IJ", "previewMetadata": {"previewContentType": "yYNzDvMz", "previewFileExtension": "GRUvOHfm"}, "shareCode": "2LbdiWUs", "subType": "p6kSTkQC", "tags": ["kbsB6nVC", "L6pQzUKv", "CAzXpZyP"], "type": "ivIqY2wf", "updateContentFile": true}' \
    > test.out 2>&1
eval_tap $? 43 'AdminUpdateContentS3' test.out

#- 44 DeleteContentByShareCode
./ng net.accelbyte.sdk.cli.Main ugc deleteContentByShareCode \
    --channelId '8Fm8ILgC' \
    --namespace "$AB_NAMESPACE" \
    --shareCode 'eMojM4ZE' \
    --userId 'sWgKIiq2' \
    > test.out 2>&1
eval_tap $? 44 'DeleteContentByShareCode' test.out

#- 45 AdminUpdateContentDirect
eval_tap 0 45 'AdminUpdateContentDirect # SKIP deprecated' test.out

#- 46 AdminDeleteContent
./ng net.accelbyte.sdk.cli.Main ugc adminDeleteContent \
    --channelId 'ZODYHu3q' \
    --contentId 'if7mOlPO' \
    --namespace "$AB_NAMESPACE" \
    --userId 'z8RP6tSX' \
    > test.out 2>&1
eval_tap $? 46 'AdminDeleteContent' test.out

#- 47 AdminGetContent
./ng net.accelbyte.sdk.cli.Main ugc adminGetContent \
    --namespace "$AB_NAMESPACE" \
    --userId 'BRPrRe6E' \
    --limit '56' \
    --offset '34' \
    > test.out 2>&1
eval_tap $? 47 'AdminGetContent' test.out

#- 48 AdminDeleteAllUserContents
./ng net.accelbyte.sdk.cli.Main ugc adminDeleteAllUserContents \
    --namespace "$AB_NAMESPACE" \
    --userId 'QW7rixMX' \
    > test.out 2>&1
eval_tap $? 48 'AdminDeleteAllUserContents' test.out

#- 49 AdminHideUserContent
./ng net.accelbyte.sdk.cli.Main ugc adminHideUserContent \
    --contentId '35R1Jfgp' \
    --namespace "$AB_NAMESPACE" \
    --userId 's7OCV0z5' \
    --body '{"isHidden": false}' \
    > test.out 2>&1
eval_tap $? 49 'AdminHideUserContent' test.out

#- 50 AdminGetAllGroups
./ng net.accelbyte.sdk.cli.Main ugc adminGetAllGroups \
    --namespace "$AB_NAMESPACE" \
    --userId 'pGGrH2sx' \
    --limit '41' \
    --offset '83' \
    > test.out 2>&1
eval_tap $? 50 'AdminGetAllGroups' test.out

#- 51 AdminDeleteAllUserGroup
./ng net.accelbyte.sdk.cli.Main ugc adminDeleteAllUserGroup \
    --namespace "$AB_NAMESPACE" \
    --userId 'GTEXIjDU' \
    > test.out 2>&1
eval_tap $? 51 'AdminDeleteAllUserGroup' test.out

#- 52 AdminGetGroup
./ng net.accelbyte.sdk.cli.Main ugc adminGetGroup \
    --groupId 'GdGRUs9C' \
    --namespace "$AB_NAMESPACE" \
    --userId '7eph49n7' \
    > test.out 2>&1
eval_tap $? 52 'AdminGetGroup' test.out

#- 53 AdminUpdateGroup
./ng net.accelbyte.sdk.cli.Main ugc adminUpdateGroup \
    --groupId 'yDRu4plH' \
    --namespace "$AB_NAMESPACE" \
    --userId 'PYiKcngC' \
    --body '{"contents": ["JG0QcB75", "nj61NCHq", "a9onNmes"], "name": "mh8TnRle"}' \
    > test.out 2>&1
eval_tap $? 53 'AdminUpdateGroup' test.out

#- 54 AdminDeleteGroup
./ng net.accelbyte.sdk.cli.Main ugc adminDeleteGroup \
    --groupId '43dynsvu' \
    --namespace "$AB_NAMESPACE" \
    --userId 'OgeECLBV' \
    > test.out 2>&1
eval_tap $? 54 'AdminDeleteGroup' test.out

#- 55 AdminGetGroupContents
./ng net.accelbyte.sdk.cli.Main ugc adminGetGroupContents \
    --groupId 'FwLwztiV' \
    --namespace "$AB_NAMESPACE" \
    --userId '6ihGSKSh' \
    --limit '11' \
    --offset '90' \
    > test.out 2>&1
eval_tap $? 55 'AdminGetGroupContents' test.out

#- 56 AdminDeleteAllUserStates
./ng net.accelbyte.sdk.cli.Main ugc adminDeleteAllUserStates \
    --namespace "$AB_NAMESPACE" \
    --userId 'KwsrJuah' \
    > test.out 2>&1
eval_tap $? 56 'AdminDeleteAllUserStates' test.out

#- 57 SearchChannelSpecificContent
./ng net.accelbyte.sdk.cli.Main ugc searchChannelSpecificContent \
    --channelId 'iUPskHDS' \
    --namespace "$AB_NAMESPACE" \
    --creator 'aWDTiZyl' \
    --ishidden 'mVBlA60l' \
    --isofficial 'ZXoHKzGf' \
    --limit '86' \
    --name '4i05jKRy' \
    --offset '30' \
    --orderby 'b5YUlYt3' \
    --sortby 'zeyJ7MAp' \
    --subtype 'k87qrRbL' \
    --tags '8izwh8X8,XLaz6aiv,7E4PbAkS' \
    --type 'tb12axNP' \
    --userId '67s3SwbH' \
    > test.out 2>&1
eval_tap $? 57 'SearchChannelSpecificContent' test.out

#- 58 PublicSearchContent
./ng net.accelbyte.sdk.cli.Main ugc publicSearchContent \
    --namespace "$AB_NAMESPACE" \
    --creator 'KbifqV6b' \
    --ishidden 'zFyHA9WN' \
    --isofficial '0URXzNOs' \
    --limit '26' \
    --name 'mlnkrZbm' \
    --offset '9' \
    --orderby 'cmnfgjhR' \
    --sortby 'ytBcdB54' \
    --subtype 'nVv91FKP' \
    --tags 'oLmw6fsU,P1xH1Gm8,jQnFs9ry' \
    --type 'hvvT0W1c' \
    --userId 'upVdO4ec' \
    > test.out 2>&1
eval_tap $? 58 'PublicSearchContent' test.out

#- 59 PublicGetContentBulk
./ng net.accelbyte.sdk.cli.Main ugc publicGetContentBulk \
    --namespace "$AB_NAMESPACE" \
    --body '{"contentIds": ["nunCiqQZ", "rBo5tate", "ij0QvyXU"]}' \
    > test.out 2>&1
eval_tap $? 59 'PublicGetContentBulk' test.out

#- 60 GetFollowedContent
./ng net.accelbyte.sdk.cli.Main ugc getFollowedContent \
    --namespace "$AB_NAMESPACE" \
    --limit '67' \
    --offset '22' \
    > test.out 2>&1
eval_tap $? 60 'GetFollowedContent' test.out

#- 61 GetLikedContent
./ng net.accelbyte.sdk.cli.Main ugc getLikedContent \
    --namespace "$AB_NAMESPACE" \
    --isofficial  \
    --limit '4' \
    --name 'Is6wxT0R' \
    --offset '33' \
    --orderby 'BqzFHmwH' \
    --sortby '6MVXJtTu' \
    --subtype '5K9L4t54' \
    --tags 'Yq6htKLt,1yJcidxE,ZQohqbi7' \
    --type 'tx3Nuaq4' \
    > test.out 2>&1
eval_tap $? 61 'GetLikedContent' test.out

#- 62 PublicGetContentBulkByShareCodes
./ng net.accelbyte.sdk.cli.Main ugc publicGetContentBulkByShareCodes \
    --namespace "$AB_NAMESPACE" \
    --body '{"shareCodes": ["Xvhv0hBf", "UzJXBpvC", "MEC84tYi"]}' \
    > test.out 2>&1
eval_tap $? 62 'PublicGetContentBulkByShareCodes' test.out

#- 63 PublicDownloadContentByShareCode
./ng net.accelbyte.sdk.cli.Main ugc publicDownloadContentByShareCode \
    --namespace "$AB_NAMESPACE" \
    --shareCode '8GUHmdQv' \
    > test.out 2>&1
eval_tap $? 63 'PublicDownloadContentByShareCode' test.out

#- 64 PublicDownloadContentByContentID
./ng net.accelbyte.sdk.cli.Main ugc publicDownloadContentByContentID \
    --contentId 'PkRERJ3D' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 64 'PublicDownloadContentByContentID' test.out

#- 65 AddDownloadCount
./ng net.accelbyte.sdk.cli.Main ugc addDownloadCount \
    --contentId 'aRDcBlao' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 65 'AddDownloadCount' test.out

#- 66 UpdateContentLikeStatus
./ng net.accelbyte.sdk.cli.Main ugc updateContentLikeStatus \
    --contentId 'k0kxVKYv' \
    --namespace "$AB_NAMESPACE" \
    --body '{"likeStatus": true}' \
    > test.out 2>&1
eval_tap $? 66 'UpdateContentLikeStatus' test.out

#- 67 PublicDownloadContentPreview
./ng net.accelbyte.sdk.cli.Main ugc publicDownloadContentPreview \
    --contentId 'WE4qaa1j' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 67 'PublicDownloadContentPreview' test.out

#- 68 GetTag
./ng net.accelbyte.sdk.cli.Main ugc getTag \
    --namespace "$AB_NAMESPACE" \
    --limit '83' \
    --offset '17' \
    > test.out 2>&1
eval_tap $? 68 'GetTag' test.out

#- 69 GetType
./ng net.accelbyte.sdk.cli.Main ugc getType \
    --namespace "$AB_NAMESPACE" \
    --limit '48' \
    --offset '38' \
    > test.out 2>&1
eval_tap $? 69 'GetType' test.out

#- 70 PublicSearchCreator
./ng net.accelbyte.sdk.cli.Main ugc publicSearchCreator \
    --namespace "$AB_NAMESPACE" \
    --limit '26' \
    --offset '2' \
    --orderby 'yyBM6u7R' \
    --sortby 'uinJ4Gqn' \
    > test.out 2>&1
eval_tap $? 70 'PublicSearchCreator' test.out

#- 71 GetFollowedUsers
./ng net.accelbyte.sdk.cli.Main ugc getFollowedUsers \
    --namespace "$AB_NAMESPACE" \
    --limit '99' \
    --offset '3' \
    > test.out 2>&1
eval_tap $? 71 'GetFollowedUsers' test.out

#- 72 PublicGetCreator
./ng net.accelbyte.sdk.cli.Main ugc publicGetCreator \
    --namespace "$AB_NAMESPACE" \
    --userId 'z14euEkJ' \
    > test.out 2>&1
eval_tap $? 72 'PublicGetCreator' test.out

#- 73 GetChannels
./ng net.accelbyte.sdk.cli.Main ugc getChannels \
    --namespace "$AB_NAMESPACE" \
    --userId 'mSwFC62r' \
    --limit '20' \
    --name 'rMVIQk2e' \
    --offset '90' \
    > test.out 2>&1
eval_tap $? 73 'GetChannels' test.out

#- 74 PublicCreateChannel
./ng net.accelbyte.sdk.cli.Main ugc publicCreateChannel \
    --namespace "$AB_NAMESPACE" \
    --userId 'yBlE1OGJ' \
    --body '{"name": "4Qh2tl9p"}' \
    > test.out 2>&1
eval_tap $? 74 'PublicCreateChannel' test.out

#- 75 DeleteAllUserChannel
./ng net.accelbyte.sdk.cli.Main ugc deleteAllUserChannel \
    --namespace "$AB_NAMESPACE" \
    --userId 'LEdlcb1k' \
    > test.out 2>&1
eval_tap $? 75 'DeleteAllUserChannel' test.out

#- 76 UpdateChannel
./ng net.accelbyte.sdk.cli.Main ugc updateChannel \
    --channelId 'OOXd8onv' \
    --namespace "$AB_NAMESPACE" \
    --userId 'vz2doVr7' \
    --body '{"name": "NiEfiVRq"}' \
    > test.out 2>&1
eval_tap $? 76 'UpdateChannel' test.out

#- 77 DeleteChannel
./ng net.accelbyte.sdk.cli.Main ugc deleteChannel \
    --channelId '8IQKoKSv' \
    --namespace "$AB_NAMESPACE" \
    --userId 'WrFUaiOc' \
    > test.out 2>&1
eval_tap $? 77 'DeleteChannel' test.out

#- 78 CreateContentDirect
eval_tap 0 78 'CreateContentDirect # SKIP deprecated' test.out

#- 79 CreateContentS3
./ng net.accelbyte.sdk.cli.Main ugc createContentS3 \
    --channelId 'AnxVzY4M' \
    --namespace "$AB_NAMESPACE" \
    --userId 'Y072umeA' \
    --body '{"contentType": "pMRVgPRw", "customAttributes": {"5WDQnYAC": {}, "sC4L4OuA": {}, "DdRqhkM6": {}}, "fileExtension": "YLEFhXFk", "name": "YYSsTbX7", "preview": "BXNFL2ZX", "previewMetadata": {"previewContentType": "mrQVxtHv", "previewFileExtension": "3YFSBsnQ"}, "subType": "egfalEws", "tags": ["a1cA6f33", "y1k761h1", "Tjka9LDm"], "type": "BXXyYpJi"}' \
    > test.out 2>&1
eval_tap $? 79 'CreateContentS3' test.out

#- 80 PublicUpdateContentByShareCode
./ng net.accelbyte.sdk.cli.Main ugc publicUpdateContentByShareCode \
    --channelId 'ZQcfkg88' \
    --namespace "$AB_NAMESPACE" \
    --shareCode 'E45a1GqY' \
    --userId 'x53u73m4' \
    --body '{"contentType": "TaHbliLh", "customAttributes": {"CI47Fcxr": {}, "5WsVqkTx": {}, "aVThg8Kb": {}}, "fileExtension": "wZweDIuK", "name": "CqZmjSEt", "payload": "w7SW7j09", "preview": "JZbml0U0", "previewMetadata": {"previewContentType": "Zrkky9Bw", "previewFileExtension": "ycSQVISs"}, "subType": "ydWMZONM", "tags": ["iLptTaR2", "VnnOvm99", "mCeLAhJv"], "type": "8IlbW9gD", "updateContentFile": false}' \
    > test.out 2>&1
eval_tap $? 80 'PublicUpdateContentByShareCode' test.out

#- 81 UpdateContentS3
./ng net.accelbyte.sdk.cli.Main ugc updateContentS3 \
    --channelId 'RQzmk1k0' \
    --contentId 'lt3Kio2v' \
    --namespace "$AB_NAMESPACE" \
    --userId 'MyIQzM1g' \
    --body '{"contentType": "V7UWVvwd", "customAttributes": {"OcjrjuUw": {}, "g37cFvEd": {}, "L0xk6rg3": {}}, "fileExtension": "FYd4D39S", "name": "i3o3ctwP", "payload": "SpuI1S0H", "preview": "H6OJzeYE", "previewMetadata": {"previewContentType": "Z6FcuObW", "previewFileExtension": "iVbOgdy9"}, "subType": "vcpz66Zx", "tags": ["C34aKthe", "7ChxtZEi", "gHT7pGvH"], "type": "2Wpmke3P", "updateContentFile": false}' \
    > test.out 2>&1
eval_tap $? 81 'UpdateContentS3' test.out

#- 82 PublicDeleteContentByShareCode
./ng net.accelbyte.sdk.cli.Main ugc publicDeleteContentByShareCode \
    --channelId 'qE7mLC9U' \
    --namespace "$AB_NAMESPACE" \
    --shareCode 'b70naEdQ' \
    --userId 'LsYVY9fD' \
    > test.out 2>&1
eval_tap $? 82 'PublicDeleteContentByShareCode' test.out

#- 83 UpdateContentDirect
eval_tap 0 83 'UpdateContentDirect # SKIP deprecated' test.out

#- 84 DeleteContent
./ng net.accelbyte.sdk.cli.Main ugc deleteContent \
    --channelId '7Of1woNs' \
    --contentId 'qYI1Wuxl' \
    --namespace "$AB_NAMESPACE" \
    --userId 'ZqrUo0PV' \
    > test.out 2>&1
eval_tap $? 84 'DeleteContent' test.out

#- 85 UpdateContentShareCode
./ng net.accelbyte.sdk.cli.Main ugc updateContentShareCode \
    --channelId 'mHSodG8F' \
    --contentId 'qLOrZaaP' \
    --namespace "$AB_NAMESPACE" \
    --userId 'QWpszzfv' \
    --body '{"shareCode": "dJLtpCjH"}' \
    > test.out 2>&1
eval_tap $? 85 'UpdateContentShareCode' test.out

#- 86 PublicGetUserContent
./ng net.accelbyte.sdk.cli.Main ugc publicGetUserContent \
    --namespace "$AB_NAMESPACE" \
    --userId 'zMGUZmAy' \
    --limit '13' \
    --offset '86' \
    > test.out 2>&1
eval_tap $? 86 'PublicGetUserContent' test.out

#- 87 DeleteAllUserContents
./ng net.accelbyte.sdk.cli.Main ugc deleteAllUserContents \
    --namespace "$AB_NAMESPACE" \
    --userId 'zLEs7L9d' \
    > test.out 2>&1
eval_tap $? 87 'DeleteAllUserContents' test.out

#- 88 UpdateScreenshots
./ng net.accelbyte.sdk.cli.Main ugc updateScreenshots \
    --contentId 'fEQDBHj1' \
    --namespace "$AB_NAMESPACE" \
    --userId 'mmoPwa9S' \
    --body '{"screenshots": [{"description": "KXrf0ban", "screenshotId": "QZlvF1dg"}, {"description": "92rUOYGJ", "screenshotId": "5kibqSbQ"}, {"description": "096ILXRE", "screenshotId": "xh2MHR4X"}]}' \
    > test.out 2>&1
eval_tap $? 88 'UpdateScreenshots' test.out

#- 89 UploadContentScreenshot
./ng net.accelbyte.sdk.cli.Main ugc uploadContentScreenshot \
    --contentId 'TreTWdPD' \
    --namespace "$AB_NAMESPACE" \
    --userId 'lwbK2U1e' \
    --body '{"screenshots": [{"contentType": "R016Uu6J", "description": "zwv6949q", "fileExtension": "jfif"}, {"contentType": "pEJWuBq7", "description": "9QA2spMf", "fileExtension": "jpeg"}, {"contentType": "9pk1OWSS", "description": "sPgPFFz4", "fileExtension": "png"}]}' \
    > test.out 2>&1
eval_tap $? 89 'UploadContentScreenshot' test.out

#- 90 DeleteContentScreenshot
./ng net.accelbyte.sdk.cli.Main ugc deleteContentScreenshot \
    --contentId 'DTs2WMn8' \
    --namespace "$AB_NAMESPACE" \
    --screenshotId 'OA3wN9Vw' \
    --userId 'lm10QOv8' \
    > test.out 2>&1
eval_tap $? 90 'DeleteContentScreenshot' test.out

#- 91 UpdateUserFollowStatus
./ng net.accelbyte.sdk.cli.Main ugc updateUserFollowStatus \
    --namespace "$AB_NAMESPACE" \
    --userId 'vKenZeOq' \
    --body '{"followStatus": true}' \
    > test.out 2>&1
eval_tap $? 91 'UpdateUserFollowStatus' test.out

#- 92 GetPublicFollowers
./ng net.accelbyte.sdk.cli.Main ugc getPublicFollowers \
    --namespace "$AB_NAMESPACE" \
    --userId '6KzeMYZE' \
    --limit '39' \
    --offset '18' \
    > test.out 2>&1
eval_tap $? 92 'GetPublicFollowers' test.out

#- 93 GetPublicFollowing
./ng net.accelbyte.sdk.cli.Main ugc getPublicFollowing \
    --namespace "$AB_NAMESPACE" \
    --userId 'WuUdTgrb' \
    --limit '62' \
    --offset '60' \
    > test.out 2>&1
eval_tap $? 93 'GetPublicFollowing' test.out

#- 94 GetGroups
./ng net.accelbyte.sdk.cli.Main ugc getGroups \
    --namespace "$AB_NAMESPACE" \
    --userId 'yMUTZZID' \
    --limit '29' \
    --offset '53' \
    > test.out 2>&1
eval_tap $? 94 'GetGroups' test.out

#- 95 CreateGroup
./ng net.accelbyte.sdk.cli.Main ugc createGroup \
    --namespace "$AB_NAMESPACE" \
    --userId 'bPP4AbFX' \
    --body '{"contents": ["gHf0PL36", "WdvUCYW2", "Q3VBC3TR"], "name": "S2yKRuGI"}' \
    > test.out 2>&1
eval_tap $? 95 'CreateGroup' test.out

#- 96 DeleteAllUserGroup
./ng net.accelbyte.sdk.cli.Main ugc deleteAllUserGroup \
    --namespace "$AB_NAMESPACE" \
    --userId 'jRA9fVtC' \
    > test.out 2>&1
eval_tap $? 96 'DeleteAllUserGroup' test.out

#- 97 GetGroup
./ng net.accelbyte.sdk.cli.Main ugc getGroup \
    --groupId 'WJFaZhMA' \
    --namespace "$AB_NAMESPACE" \
    --userId 'aQwsMjWm' \
    > test.out 2>&1
eval_tap $? 97 'GetGroup' test.out

#- 98 UpdateGroup
./ng net.accelbyte.sdk.cli.Main ugc updateGroup \
    --groupId 'al7QIXYp' \
    --namespace "$AB_NAMESPACE" \
    --userId '1KXztudb' \
    --body '{"contents": ["zLHcYsk9", "aR8oCSca", "VcQO6VAt"], "name": "7uISGCVr"}' \
    > test.out 2>&1
eval_tap $? 98 'UpdateGroup' test.out

#- 99 DeleteGroup
./ng net.accelbyte.sdk.cli.Main ugc deleteGroup \
    --groupId 'jNzZ1YCd' \
    --namespace "$AB_NAMESPACE" \
    --userId 'kQKgUjR9' \
    > test.out 2>&1
eval_tap $? 99 'DeleteGroup' test.out

#- 100 GetGroupContent
./ng net.accelbyte.sdk.cli.Main ugc getGroupContent \
    --groupId '3bwuC5Fk' \
    --namespace "$AB_NAMESPACE" \
    --userId 'jK5Cveqi' \
    --limit '28' \
    --offset '25' \
    > test.out 2>&1
eval_tap $? 100 'GetGroupContent' test.out

#- 101 DeleteAllUserStates
./ng net.accelbyte.sdk.cli.Main ugc deleteAllUserStates \
    --namespace "$AB_NAMESPACE" \
    --userId 'kqYsI6ka' \
    > test.out 2>&1
eval_tap $? 101 'DeleteAllUserStates' test.out

#- 102 AdminGetContentByChannelIDV2
./ng net.accelbyte.sdk.cli.Main ugc adminGetContentByChannelIDV2 \
    --channelId 'bnRY9ssg' \
    --namespace "$AB_NAMESPACE" \
    --limit '56' \
    --name 'qT1uOhb7' \
    --offset '94' \
    --sortBy 'koVT8Rwc' \
    > test.out 2>&1
eval_tap $? 102 'AdminGetContentByChannelIDV2' test.out

#- 103 AdminCreateContentV2
./ng net.accelbyte.sdk.cli.Main ugc adminCreateContentV2 \
    --channelId 'jp18z6u0' \
    --namespace "$AB_NAMESPACE" \
    --body '{"contentType": "LMe6Tlbb", "customAttributes": {"E47uBWit": {}, "aPuU0Lax": {}, "XzK3CykG": {}}, "fileExtension": "uN2oo4rL", "name": "NOarfAwH", "shareCode": "Z5aGS4ik", "subType": "khmAfEP3", "tags": ["fCuNiQql", "sju3vAZY", "EtCYBp6F"], "type": "5VqxEYGn"}' \
    > test.out 2>&1
eval_tap $? 103 'AdminCreateContentV2' test.out

#- 104 AdminDeleteOfficialContentV2
./ng net.accelbyte.sdk.cli.Main ugc adminDeleteOfficialContentV2 \
    --channelId 'gtD8mM2o' \
    --contentId 'sbkERI87' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 104 'AdminDeleteOfficialContentV2' test.out

#- 105 AdminUpdateOfficialContentV2
./ng net.accelbyte.sdk.cli.Main ugc adminUpdateOfficialContentV2 \
    --channelId 'kLNaK6oH' \
    --contentId 'feoAzv7Q' \
    --namespace "$AB_NAMESPACE" \
    --body '{"customAttributes": {"eqzGwsgh": {}, "b1jwBmbr": {}, "ttd2aUNi": {}}, "name": "VUjLAgG0", "shareCode": "xUjc1r0y", "subType": "iFZKwiMY", "tags": ["j8BSJRr0", "oGz9UiPe", "N7YDznWw"], "type": "eShfSirL"}' \
    > test.out 2>&1
eval_tap $? 105 'AdminUpdateOfficialContentV2' test.out

#- 106 AdminCopyContent
./ng net.accelbyte.sdk.cli.Main ugc adminCopyContent \
    --channelId '5a6XPFEN' \
    --contentId 'VHwKjVBy' \
    --namespace "$AB_NAMESPACE" \
    --body '{"customAttributes": {"ldTn2Bz3": {}, "5Pwb9VOk": {}, "k2pGvnED": {}}, "name": "FMWU7Thg", "subType": "8cTjYuvU", "tags": ["sjBJP0cc", "anH8b3Ss", "VdoJfFv2"], "targetChannelId": "6X1rd2Ex", "type": "16UPhhq2"}' \
    > test.out 2>&1
eval_tap $? 106 'AdminCopyContent' test.out

#- 107 AdminUpdateOfficialContentFileLocation
./ng net.accelbyte.sdk.cli.Main ugc adminUpdateOfficialContentFileLocation \
    --channelId 'xLnfbEdt' \
    --contentId 'dQhSeGq5' \
    --namespace "$AB_NAMESPACE" \
    --body '{"fileExtension": "TEvh34Ro", "fileLocation": "kl23HAoR"}' \
    > test.out 2>&1
eval_tap $? 107 'AdminUpdateOfficialContentFileLocation' test.out

#- 108 AdminGenerateOfficialContentUploadURLV2
./ng net.accelbyte.sdk.cli.Main ugc adminGenerateOfficialContentUploadURLV2 \
    --channelId 'jABs3w6c' \
    --contentId 'sOBj2wEX' \
    --namespace "$AB_NAMESPACE" \
    --body '{"contentType": "g48HtLWx", "fileExtension": "yKhdn3Dl"}' \
    > test.out 2>&1
eval_tap $? 108 'AdminGenerateOfficialContentUploadURLV2' test.out

#- 109 AdminGetConfigs
./ng net.accelbyte.sdk.cli.Main ugc adminGetConfigs \
    --namespace "$AB_NAMESPACE" \
    --limit '76' \
    --offset '19' \
    > test.out 2>&1
eval_tap $? 109 'AdminGetConfigs' test.out

#- 110 AdminUpdateConfig
./ng net.accelbyte.sdk.cli.Main ugc adminUpdateConfig \
    --key 'GBJfTV71' \
    --namespace "$AB_NAMESPACE" \
    --body '{"value": "GFBSfqvg"}' \
    > test.out 2>&1
eval_tap $? 110 'AdminUpdateConfig' test.out

#- 111 AdminListContentV2
./ng net.accelbyte.sdk.cli.Main ugc adminListContentV2 \
    --namespace "$AB_NAMESPACE" \
    --isOfficial  \
    --limit '56' \
    --name 'rr5hK1Yi' \
    --offset '25' \
    --sortBy 'sFw21lEd' \
    --subType 'LGUxsR0K' \
    --tags 'hTNlWopM,GRfraOeX,5TKbE2Jh' \
    --type 'rs2kIYEI' \
    > test.out 2>&1
eval_tap $? 111 'AdminListContentV2' test.out

#- 112 AdminBulkGetContentByIDsV2
./ng net.accelbyte.sdk.cli.Main ugc adminBulkGetContentByIDsV2 \
    --namespace "$AB_NAMESPACE" \
    --body '{"contentIds": ["sJIxhvcM", "I5GBIw2h", "QWsfFgbm"]}' \
    > test.out 2>&1
eval_tap $? 112 'AdminBulkGetContentByIDsV2' test.out

#- 113 AdminGetContentBulkByShareCodesV2
./ng net.accelbyte.sdk.cli.Main ugc adminGetContentBulkByShareCodesV2 \
    --namespace "$AB_NAMESPACE" \
    --body '{"shareCodes": ["4dgAC6eh", "gCeF61OC", "0MFbzG9W"]}' \
    > test.out 2>&1
eval_tap $? 113 'AdminGetContentBulkByShareCodesV2' test.out

#- 114 AdminGetContentByShareCodeV2
./ng net.accelbyte.sdk.cli.Main ugc adminGetContentByShareCodeV2 \
    --namespace "$AB_NAMESPACE" \
    --shareCode '8XtyqACq' \
    > test.out 2>&1
eval_tap $? 114 'AdminGetContentByShareCodeV2' test.out

#- 115 AdminGetContentByContentIDV2
./ng net.accelbyte.sdk.cli.Main ugc adminGetContentByContentIDV2 \
    --contentId '3jw9oAHr' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 115 'AdminGetContentByContentIDV2' test.out

#- 116 RollbackContentVersionV2
./ng net.accelbyte.sdk.cli.Main ugc rollbackContentVersionV2 \
    --contentId 'UfNKpz9W' \
    --namespace "$AB_NAMESPACE" \
    --versionId 'af3EfxmV' \
    > test.out 2>&1
eval_tap $? 116 'RollbackContentVersionV2' test.out

#- 117 AdminUpdateScreenshotsV2
./ng net.accelbyte.sdk.cli.Main ugc adminUpdateScreenshotsV2 \
    --contentId '1L8bbIbX' \
    --namespace "$AB_NAMESPACE" \
    --body '{"screenshots": [{"description": "UW0f6Fyz", "screenshotId": "0mDKnNER"}, {"description": "e3PKkgCx", "screenshotId": "gdnFH1UA"}, {"description": "yJ0Tjv6y", "screenshotId": "9KjVD3xv"}]}' \
    > test.out 2>&1
eval_tap $? 117 'AdminUpdateScreenshotsV2' test.out

#- 118 AdminUploadContentScreenshotV2
./ng net.accelbyte.sdk.cli.Main ugc adminUploadContentScreenshotV2 \
    --contentId 'fPbOf4tc' \
    --namespace "$AB_NAMESPACE" \
    --body '{"screenshots": [{"contentType": "BdTtGM5v", "description": "14ey2a2G", "fileExtension": "bmp"}, {"contentType": "GjZrfaLz", "description": "POGY3Q2J", "fileExtension": "jpeg"}, {"contentType": "QweuktrY", "description": "rYXJGQNw", "fileExtension": "jfif"}]}' \
    > test.out 2>&1
eval_tap $? 118 'AdminUploadContentScreenshotV2' test.out

#- 119 AdminDeleteContentScreenshotV2
./ng net.accelbyte.sdk.cli.Main ugc adminDeleteContentScreenshotV2 \
    --contentId 'X6m4FdkR' \
    --namespace "$AB_NAMESPACE" \
    --screenshotId 'JtzkUVNw' \
    > test.out 2>&1
eval_tap $? 119 'AdminDeleteContentScreenshotV2' test.out

#- 120 ListContentVersionsV2
./ng net.accelbyte.sdk.cli.Main ugc listContentVersionsV2 \
    --contentId 'DJ2Rhwq9' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 120 'ListContentVersionsV2' test.out

#- 121 AdminGetOfficialGroupContentsV2
./ng net.accelbyte.sdk.cli.Main ugc adminGetOfficialGroupContentsV2 \
    --groupId '0MXI7UCa' \
    --namespace "$AB_NAMESPACE" \
    --limit '19' \
    --offset '73' \
    > test.out 2>&1
eval_tap $? 121 'AdminGetOfficialGroupContentsV2' test.out

#- 122 AdminListStagingContents
./ng net.accelbyte.sdk.cli.Main ugc adminListStagingContents \
    --namespace "$AB_NAMESPACE" \
    --limit '36' \
    --offset '69' \
    --sortBy 'oistxvqM' \
    --status '4HP6u7qe' \
    > test.out 2>&1
eval_tap $? 122 'AdminListStagingContents' test.out

#- 123 AdminGetStagingContentByID
./ng net.accelbyte.sdk.cli.Main ugc adminGetStagingContentByID \
    --contentId 'iAEuRLk4' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 123 'AdminGetStagingContentByID' test.out

#- 124 AdminApproveStagingContent
./ng net.accelbyte.sdk.cli.Main ugc adminApproveStagingContent \
    --contentId 'qQFxbOE0' \
    --namespace "$AB_NAMESPACE" \
    --body '{"approved": false, "note": "pDCyCodu"}' \
    > test.out 2>&1
eval_tap $? 124 'AdminApproveStagingContent' test.out

#- 125 AdminUpdateContentByShareCodeV2
./ng net.accelbyte.sdk.cli.Main ugc adminUpdateContentByShareCodeV2 \
    --channelId '49WDfxYD' \
    --namespace "$AB_NAMESPACE" \
    --shareCode 'qfPhrG88' \
    --userId '0EbpKY8I' \
    --body '{"customAttributes": {"4hhs7mPT": {}, "SyOQfP2H": {}, "v6bd1Z0A": {}}, "name": "o5StVhRY", "shareCode": "x4k7S63Q", "subType": "iq8P1CYm", "tags": ["jMTyHgoL", "oGN6OaGz", "9a3RG9xu"], "type": "adf5GJG9"}' \
    > test.out 2>&1
eval_tap $? 125 'AdminUpdateContentByShareCodeV2' test.out

#- 126 AdminDeleteContentByShareCodeV2
./ng net.accelbyte.sdk.cli.Main ugc adminDeleteContentByShareCodeV2 \
    --channelId 'eD0FFVtu' \
    --namespace "$AB_NAMESPACE" \
    --shareCode 'p5o8wsMu' \
    --userId '8eh0ckYL' \
    > test.out 2>&1
eval_tap $? 126 'AdminDeleteContentByShareCodeV2' test.out

#- 127 AdminDeleteUserContentV2
./ng net.accelbyte.sdk.cli.Main ugc adminDeleteUserContentV2 \
    --channelId 'W9fTDp4w' \
    --contentId '1s8I77XV' \
    --namespace "$AB_NAMESPACE" \
    --userId 'jw37p07X' \
    > test.out 2>&1
eval_tap $? 127 'AdminDeleteUserContentV2' test.out

#- 128 AdminUpdateUserContentV2
./ng net.accelbyte.sdk.cli.Main ugc adminUpdateUserContentV2 \
    --channelId 'huzH46qE' \
    --contentId 'rkTR9f60' \
    --namespace "$AB_NAMESPACE" \
    --userId 'I3MeRJBA' \
    --body '{"customAttributes": {"DCirrjmv": {}, "BgfLQdnZ": {}, "ob7VkC86": {}}, "name": "BXZmXc78", "shareCode": "CCCK9Zgj", "subType": "81tgfhAb", "tags": ["JiXcyqfZ", "3IkrRLcg", "vBJ8xAI5"], "type": "0TzaTfmf"}' \
    > test.out 2>&1
eval_tap $? 128 'AdminUpdateUserContentV2' test.out

#- 129 AdminUpdateUserContentFileLocation
./ng net.accelbyte.sdk.cli.Main ugc adminUpdateUserContentFileLocation \
    --channelId 'UyiIUNgo' \
    --contentId 'yk1OEBeb' \
    --namespace "$AB_NAMESPACE" \
    --userId 'W8ygvosv' \
    --body '{"fileExtension": "2ixxft41", "fileLocation": "hFBtkaBv"}' \
    > test.out 2>&1
eval_tap $? 129 'AdminUpdateUserContentFileLocation' test.out

#- 130 AdminGenerateUserContentUploadURLV2
./ng net.accelbyte.sdk.cli.Main ugc adminGenerateUserContentUploadURLV2 \
    --channelId 'wYZGNrHL' \
    --contentId '2dlKt3ft' \
    --namespace "$AB_NAMESPACE" \
    --userId 'QsaxpOkp' \
    --body '{"contentType": "NkPvFMjZ", "fileExtension": "YRnkPL01"}' \
    > test.out 2>&1
eval_tap $? 130 'AdminGenerateUserContentUploadURLV2' test.out

#- 131 AdminGetContentByUserIDV2
./ng net.accelbyte.sdk.cli.Main ugc adminGetContentByUserIDV2 \
    --namespace "$AB_NAMESPACE" \
    --userId '5ailE6t4' \
    --limit '98' \
    --offset '32' \
    --sortBy 't3CS1lX4' \
    > test.out 2>&1
eval_tap $? 131 'AdminGetContentByUserIDV2' test.out

#- 132 AdminUpdateContentHideStatusV2
./ng net.accelbyte.sdk.cli.Main ugc adminUpdateContentHideStatusV2 \
    --contentId '4gYDtQYG' \
    --namespace "$AB_NAMESPACE" \
    --userId '7vY38nhn' \
    --body '{"isHidden": false}' \
    > test.out 2>&1
eval_tap $? 132 'AdminUpdateContentHideStatusV2' test.out

#- 133 AdminGetUserGroupContentsV2
./ng net.accelbyte.sdk.cli.Main ugc adminGetUserGroupContentsV2 \
    --groupId 'QVlwpQEy' \
    --namespace "$AB_NAMESPACE" \
    --userId '67Ibr0Xe' \
    --limit '55' \
    --offset '53' \
    > test.out 2>&1
eval_tap $? 133 'AdminGetUserGroupContentsV2' test.out

#- 134 AdminListUserStagingContents
./ng net.accelbyte.sdk.cli.Main ugc adminListUserStagingContents \
    --namespace "$AB_NAMESPACE" \
    --userId 'a0rc9D2N' \
    --limit '66' \
    --offset '67' \
    --sortBy 'X415yZR6' \
    --status 'YmCrSSOZ' \
    > test.out 2>&1
eval_tap $? 134 'AdminListUserStagingContents' test.out

#- 135 PublicGetContentByChannelIDV2
./ng net.accelbyte.sdk.cli.Main ugc publicGetContentByChannelIDV2 \
    --channelId 'shBHiqOc' \
    --namespace "$AB_NAMESPACE" \
    --limit '6' \
    --name 'whP5sV0W' \
    --offset '46' \
    --sortBy 'Zk4RCuev' \
    > test.out 2>&1
eval_tap $? 135 'PublicGetContentByChannelIDV2' test.out

#- 136 PublicListContentV2
./ng net.accelbyte.sdk.cli.Main ugc publicListContentV2 \
    --namespace "$AB_NAMESPACE" \
    --isOfficial  \
    --limit '77' \
    --name '4qRoihHp' \
    --offset '48' \
    --sortBy 'POILBFrt' \
    --subType 'mgdjRltW' \
    --tags 'BRJnujCr,9aCI3G2u,qfSaSwrB' \
    --type 'HkLAmaCP' \
    > test.out 2>&1
eval_tap $? 136 'PublicListContentV2' test.out

#- 137 PublicBulkGetContentByIDV2
./ng net.accelbyte.sdk.cli.Main ugc publicBulkGetContentByIDV2 \
    --namespace "$AB_NAMESPACE" \
    --body '{"contentIds": ["GmnEmzG3", "mPQsTeyY", "Qs2Nfvld"]}' \
    > test.out 2>&1
eval_tap $? 137 'PublicBulkGetContentByIDV2' test.out

#- 138 PublicGetContentBulkByShareCodesV2
./ng net.accelbyte.sdk.cli.Main ugc publicGetContentBulkByShareCodesV2 \
    --namespace "$AB_NAMESPACE" \
    --body '{"shareCodes": ["GFi42s29", "ik1F3bAO", "mSElWwvY"]}' \
    > test.out 2>&1
eval_tap $? 138 'PublicGetContentBulkByShareCodesV2' test.out

#- 139 PublicGetContentByShareCodeV2
./ng net.accelbyte.sdk.cli.Main ugc publicGetContentByShareCodeV2 \
    --namespace "$AB_NAMESPACE" \
    --shareCode 'PxokxehN' \
    > test.out 2>&1
eval_tap $? 139 'PublicGetContentByShareCodeV2' test.out

#- 140 PublicGetContentByIDV2
./ng net.accelbyte.sdk.cli.Main ugc publicGetContentByIDV2 \
    --contentId 'L2zEr1S8' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 140 'PublicGetContentByIDV2' test.out

#- 141 PublicAddDownloadCountV2
./ng net.accelbyte.sdk.cli.Main ugc publicAddDownloadCountV2 \
    --contentId 'eVDho0Uy' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 141 'PublicAddDownloadCountV2' test.out

#- 142 PublicListContentDownloaderV2
./ng net.accelbyte.sdk.cli.Main ugc publicListContentDownloaderV2 \
    --contentId 'XHS8ZLIk' \
    --namespace "$AB_NAMESPACE" \
    --limit '31' \
    --offset '59' \
    --sortBy '2OFA2EZP' \
    --userId 'J5FOjq2p' \
    > test.out 2>&1
eval_tap $? 142 'PublicListContentDownloaderV2' test.out

#- 143 PublicListContentLikeV2
./ng net.accelbyte.sdk.cli.Main ugc publicListContentLikeV2 \
    --contentId 'UVpUiek9' \
    --namespace "$AB_NAMESPACE" \
    --limit '42' \
    --offset '27' \
    --sortBy 'g2gSI27o' \
    > test.out 2>&1
eval_tap $? 143 'PublicListContentLikeV2' test.out

#- 144 UpdateContentLikeStatusV2
./ng net.accelbyte.sdk.cli.Main ugc updateContentLikeStatusV2 \
    --contentId 'kreiiBH6' \
    --namespace "$AB_NAMESPACE" \
    --body '{"likeStatus": true}' \
    > test.out 2>&1
eval_tap $? 144 'UpdateContentLikeStatusV2' test.out

#- 145 PublicCreateContentV2
./ng net.accelbyte.sdk.cli.Main ugc publicCreateContentV2 \
    --channelId 'heve8Vjw' \
    --namespace "$AB_NAMESPACE" \
    --userId 'ha6nBBDo' \
    --body '{"contentType": "a2jyLsEB", "customAttributes": {"eTolJZUF": {}, "E1Ri5hAf": {}, "OdEtBeKn": {}}, "fileExtension": "ZunmSe7z", "name": "YyVQXDMF", "subType": "K3nZ64Di", "tags": ["QKVVsotI", "vt5IYE6y", "Zf0shdZH"], "type": "BaRL5RJY"}' \
    > test.out 2>&1
eval_tap $? 145 'PublicCreateContentV2' test.out

#- 146 PublicUpdateContentByShareCodeV2
./ng net.accelbyte.sdk.cli.Main ugc publicUpdateContentByShareCodeV2 \
    --channelId 'p9tdaTjc' \
    --namespace "$AB_NAMESPACE" \
    --shareCode 'ir2HcAGV' \
    --userId '8U2v8r12' \
    --body '{"customAttributes": {"hnW8pbgP": {}, "bv0JtuvK": {}, "vIrsNL4p": {}}, "name": "S3hLoUoQ", "subType": "vwlqppaS", "tags": ["ZbWus8v1", "HUEsNYNg", "ePU8v4h8"], "type": "miUW6xCT"}' \
    > test.out 2>&1
eval_tap $? 146 'PublicUpdateContentByShareCodeV2' test.out

#- 147 PublicDeleteContentByShareCodeV2
./ng net.accelbyte.sdk.cli.Main ugc publicDeleteContentByShareCodeV2 \
    --channelId 'sAch2CQe' \
    --namespace "$AB_NAMESPACE" \
    --shareCode '2nTOa2Vk' \
    --userId 'JWH4p2GR' \
    > test.out 2>&1
eval_tap $? 147 'PublicDeleteContentByShareCodeV2' test.out

#- 148 PublicDeleteContentV2
./ng net.accelbyte.sdk.cli.Main ugc publicDeleteContentV2 \
    --channelId 'MA8uVRjQ' \
    --contentId 'K8dLb8dW' \
    --namespace "$AB_NAMESPACE" \
    --userId 'dsKnNvSC' \
    > test.out 2>&1
eval_tap $? 148 'PublicDeleteContentV2' test.out

#- 149 PublicUpdateContentV2
./ng net.accelbyte.sdk.cli.Main ugc publicUpdateContentV2 \
    --channelId 'WZmHYM9T' \
    --contentId 'i5z4nQfK' \
    --namespace "$AB_NAMESPACE" \
    --userId 'vcDaC3XR' \
    --body '{"customAttributes": {"HykLvuDd": {}, "775N78vV": {}, "2OkaxmKV": {}}, "name": "76z41YGb", "subType": "cIcrMIQ5", "tags": ["zKgjq0oh", "LpYy1AJq", "NUWkSCdt"], "type": "O61S9m0b"}' \
    > test.out 2>&1
eval_tap $? 149 'PublicUpdateContentV2' test.out

#- 150 PublicUpdateContentFileLocation
./ng net.accelbyte.sdk.cli.Main ugc publicUpdateContentFileLocation \
    --channelId 'h4JlXUUe' \
    --contentId 'qNLX3PR9' \
    --namespace "$AB_NAMESPACE" \
    --userId 'sXFfGSyv' \
    --body '{"fileExtension": "smKXDnF4", "fileLocation": "5TXOO2Sq"}' \
    > test.out 2>&1
eval_tap $? 150 'PublicUpdateContentFileLocation' test.out

#- 151 UpdateContentShareCodeV2
./ng net.accelbyte.sdk.cli.Main ugc updateContentShareCodeV2 \
    --channelId 'DHZLms0l' \
    --contentId 'UDC3Q6TT' \
    --namespace "$AB_NAMESPACE" \
    --userId 'EgNt014w' \
    --body '{"shareCode": "TdWEhATe"}' \
    > test.out 2>&1
eval_tap $? 151 'UpdateContentShareCodeV2' test.out

#- 152 PublicGenerateContentUploadURLV2
./ng net.accelbyte.sdk.cli.Main ugc publicGenerateContentUploadURLV2 \
    --channelId 'ylJVFUpG' \
    --contentId 'OZvqq8b3' \
    --namespace "$AB_NAMESPACE" \
    --userId 'r8FGfA03' \
    --body '{"contentType": "3369o7ZH", "fileExtension": "CqHQsSVc"}' \
    > test.out 2>&1
eval_tap $? 152 'PublicGenerateContentUploadURLV2' test.out

#- 153 PublicGetContentByUserIDV2
./ng net.accelbyte.sdk.cli.Main ugc publicGetContentByUserIDV2 \
    --namespace "$AB_NAMESPACE" \
    --userId '2vkREGbV' \
    --limit '10' \
    --offset '37' \
    --sortBy 'SNAWNdFu' \
    > test.out 2>&1
eval_tap $? 153 'PublicGetContentByUserIDV2' test.out

#- 154 UpdateScreenshotsV2
./ng net.accelbyte.sdk.cli.Main ugc updateScreenshotsV2 \
    --contentId 'D8BVETIh' \
    --namespace "$AB_NAMESPACE" \
    --userId 'GxmFitDl' \
    --body '{"screenshots": [{"description": "W2nNMZlf", "screenshotId": "itoGLPSP"}, {"description": "Bx6NtVlB", "screenshotId": "bi49evk3"}, {"description": "w5L7KxJA", "screenshotId": "4RdwHENg"}]}' \
    > test.out 2>&1
eval_tap $? 154 'UpdateScreenshotsV2' test.out

#- 155 UploadContentScreenshotV2
./ng net.accelbyte.sdk.cli.Main ugc uploadContentScreenshotV2 \
    --contentId 'jc6ozZ1U' \
    --namespace "$AB_NAMESPACE" \
    --userId '0JWCYiiZ' \
    --body '{"screenshots": [{"contentType": "fTqex4qM", "description": "EBJaReAT", "fileExtension": "jpeg"}, {"contentType": "GDIXxjwF", "description": "5Cd2ltN1", "fileExtension": "pjp"}, {"contentType": "XgEZSqI5", "description": "wULeaUKD", "fileExtension": "jpeg"}]}' \
    > test.out 2>&1
eval_tap $? 155 'UploadContentScreenshotV2' test.out

#- 156 DeleteContentScreenshotV2
./ng net.accelbyte.sdk.cli.Main ugc deleteContentScreenshotV2 \
    --contentId '0PmQXpAi' \
    --namespace "$AB_NAMESPACE" \
    --screenshotId 'wonXWWLQ' \
    --userId 'jE7cv02T' \
    > test.out 2>&1
eval_tap $? 156 'DeleteContentScreenshotV2' test.out

#- 157 PublicGetGroupContentsV2
./ng net.accelbyte.sdk.cli.Main ugc publicGetGroupContentsV2 \
    --groupId 'hl2dM8ND' \
    --namespace "$AB_NAMESPACE" \
    --userId 'WTSx3yrT' \
    --limit '24' \
    --offset '45' \
    > test.out 2>&1
eval_tap $? 157 'PublicGetGroupContentsV2' test.out

#- 158 ListUserStagingContents
./ng net.accelbyte.sdk.cli.Main ugc listUserStagingContents \
    --namespace "$AB_NAMESPACE" \
    --userId 'jBwINtPS' \
    --limit '39' \
    --offset '13' \
    --sortBy 'zKUhInOk' \
    --status 'jVq55kfI' \
    > test.out 2>&1
eval_tap $? 158 'ListUserStagingContents' test.out

#- 159 GetUserStagingContentByID
./ng net.accelbyte.sdk.cli.Main ugc getUserStagingContentByID \
    --contentId '5R4cnlnt' \
    --namespace "$AB_NAMESPACE" \
    --userId 'WoHQgfzK' \
    > test.out 2>&1
eval_tap $? 159 'GetUserStagingContentByID' test.out

#- 160 UpdateStagingContent
./ng net.accelbyte.sdk.cli.Main ugc updateStagingContent \
    --contentId 'aAkV4DAz' \
    --namespace "$AB_NAMESPACE" \
    --userId 'ZRP5QIU3' \
    --body '{"fileExtension": "nzVJfHak", "fileLocation": "c6U6rpEi"}' \
    > test.out 2>&1
eval_tap $? 160 'UpdateStagingContent' test.out

#- 161 DeleteUserStagingContentByID
./ng net.accelbyte.sdk.cli.Main ugc deleteUserStagingContentByID \
    --contentId 'TmMV0KwT' \
    --namespace "$AB_NAMESPACE" \
    --userId 'ExH1Wwwo' \
    > test.out 2>&1
eval_tap $? 161 'DeleteUserStagingContentByID' test.out


rm -f "tmp.dat"

exit $EXIT_CODE