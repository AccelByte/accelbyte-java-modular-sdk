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
    --limit '69' \
    --offset '68' \
    > test.out 2>&1
eval_tap $? 2 'SingleAdminGetChannel' test.out

#- 3 AdminCreateChannel
./ng net.accelbyte.sdk.cli.Main ugc adminCreateChannel \
    --namespace "$AB_NAMESPACE" \
    --body '{"id": "7e9ohm2x", "name": "IwZVolwi"}' \
    > test.out 2>&1
eval_tap $? 3 'AdminCreateChannel' test.out

#- 4 SingleAdminUpdateChannel
./ng net.accelbyte.sdk.cli.Main ugc singleAdminUpdateChannel \
    --channelId 'goUFBPaY' \
    --namespace "$AB_NAMESPACE" \
    --body '{"name": "CQq9dleA"}' \
    > test.out 2>&1
eval_tap $? 4 'SingleAdminUpdateChannel' test.out

#- 5 SingleAdminDeleteChannel
./ng net.accelbyte.sdk.cli.Main ugc singleAdminDeleteChannel \
    --channelId 'NyxK1Lk1' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 5 'SingleAdminDeleteChannel' test.out

#- 6 AdminUploadContentDirect
eval_tap 0 6 'AdminUploadContentDirect # SKIP deprecated' test.out

#- 7 AdminUploadContentS3
./ng net.accelbyte.sdk.cli.Main ugc adminUploadContentS3 \
    --channelId 'CHclrR8I' \
    --namespace "$AB_NAMESPACE" \
    --body '{"contentType": "oecrNzwl", "customAttributes": {"9HiQILMR": {}, "qRpEZRlQ": {}, "33SLSnCA": {}}, "fileExtension": "kp5W5Hyl", "name": "wOcHRcuk", "preview": "niip1blA", "previewMetadata": {"previewContentType": "wM6MONVV", "previewFileExtension": "nF14LXaM"}, "shareCode": "UNrDldLU", "subType": "9o8tkml0", "tags": ["dhGA4H8m", "RlxsAhhY", "vYGb6cuK"], "type": "hDheSqeE"}' \
    > test.out 2>&1
eval_tap $? 7 'AdminUploadContentS3' test.out

#- 8 SingleAdminUpdateContentS3
./ng net.accelbyte.sdk.cli.Main ugc singleAdminUpdateContentS3 \
    --channelId 'X6uqrZQg' \
    --contentId 'GEQBLwFj' \
    --namespace "$AB_NAMESPACE" \
    --body '{"contentType": "U8ntTGPo", "customAttributes": {"MJVIT7GQ": {}, "rP7mnRem": {}, "qKFyEUAH": {}}, "fileExtension": "5aIYeUmo", "name": "yGBljzY1", "payload": "M7xBkr00", "preview": "W83weXns", "previewMetadata": {"previewContentType": "qKpkn6Dt", "previewFileExtension": "kX5WsEww"}, "shareCode": "XLWaQJFD", "subType": "QfNzGrFF", "tags": ["y4hZBxIe", "YTAaK56O", "0mDqDXLa"], "type": "W8fhcG06", "updateContentFile": true}' \
    > test.out 2>&1
eval_tap $? 8 'SingleAdminUpdateContentS3' test.out

#- 9 AdminSearchChannelSpecificContent
./ng net.accelbyte.sdk.cli.Main ugc adminSearchChannelSpecificContent \
    --channelId 'P28uQeAU' \
    --namespace "$AB_NAMESPACE" \
    --creator 'q6IiZgXD' \
    --ishidden 'GkRTNuLc' \
    --isofficial 'rml955w5' \
    --limit '81' \
    --name 'uLQVZfdT' \
    --offset '91' \
    --orderby 'XwiPoXNk' \
    --sortby 'EUgfzoOl' \
    --subtype 'CNaMp2O5' \
    --tags 'EFWC1650,6KAsY3N2,H1CgNhxX' \
    --type 'K6bbGWyH' \
    --userId '41cRIah0' \
    > test.out 2>&1
eval_tap $? 9 'AdminSearchChannelSpecificContent' test.out

#- 10 SingleAdminUpdateContentDirect
eval_tap 0 10 'SingleAdminUpdateContentDirect # SKIP deprecated' test.out

#- 11 SingleAdminDeleteContent
./ng net.accelbyte.sdk.cli.Main ugc singleAdminDeleteContent \
    --channelId 'Yq14RE9V' \
    --contentId 'Ra4VDB1k' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 11 'SingleAdminDeleteContent' test.out

#- 12 SingleAdminGetContent
./ng net.accelbyte.sdk.cli.Main ugc singleAdminGetContent \
    --namespace "$AB_NAMESPACE" \
    --limit '71' \
    --offset '96' \
    > test.out 2>&1
eval_tap $? 12 'SingleAdminGetContent' test.out

#- 13 AdminGetContentBulk
./ng net.accelbyte.sdk.cli.Main ugc adminGetContentBulk \
    --namespace "$AB_NAMESPACE" \
    --body '{"contentIds": ["mVBpH6il", "UlTjQQmd", "yHgWbLPu"]}' \
    > test.out 2>&1
eval_tap $? 13 'AdminGetContentBulk' test.out

#- 14 AdminSearchContent
./ng net.accelbyte.sdk.cli.Main ugc adminSearchContent \
    --namespace "$AB_NAMESPACE" \
    --creator 'HWx2398d' \
    --ishidden 'dlw8zEhw' \
    --isofficial 'i1OoIZWx' \
    --limit '4' \
    --name 'KSXOOt19' \
    --offset '94' \
    --orderby 'pDa6VuhU' \
    --sortby 'gebckXwu' \
    --subtype 'DjcBYiIR' \
    --tags 'rcmXARFQ,5IwNbVmj,jtJHtee2' \
    --type 'bG62yyit' \
    --userId 'cmC6NZAX' \
    > test.out 2>&1
eval_tap $? 14 'AdminSearchContent' test.out

#- 15 AdminGetContentBulkByShareCodes
./ng net.accelbyte.sdk.cli.Main ugc adminGetContentBulkByShareCodes \
    --namespace "$AB_NAMESPACE" \
    --body '{"shareCodes": ["gVP7NPlG", "I7eVdAA1", "SJlPDVhi"]}' \
    > test.out 2>&1
eval_tap $? 15 'AdminGetContentBulkByShareCodes' test.out

#- 16 AdminGetUserContentByShareCode
./ng net.accelbyte.sdk.cli.Main ugc adminGetUserContentByShareCode \
    --namespace "$AB_NAMESPACE" \
    --shareCode 'X1H8AinF' \
    > test.out 2>&1
eval_tap $? 16 'AdminGetUserContentByShareCode' test.out

#- 17 AdminGetSpecificContent
./ng net.accelbyte.sdk.cli.Main ugc adminGetSpecificContent \
    --contentId 'Ym7UU1DR' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 17 'AdminGetSpecificContent' test.out

#- 18 AdminDownloadContentPreview
./ng net.accelbyte.sdk.cli.Main ugc adminDownloadContentPreview \
    --contentId 'QnWi5Zfh' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 18 'AdminDownloadContentPreview' test.out

#- 19 RollbackContentVersion
./ng net.accelbyte.sdk.cli.Main ugc rollbackContentVersion \
    --contentId 'Vodl1Lzx' \
    --namespace "$AB_NAMESPACE" \
    --versionId 'MZePIEJN' \
    > test.out 2>&1
eval_tap $? 19 'RollbackContentVersion' test.out

#- 20 AdminUpdateScreenshots
./ng net.accelbyte.sdk.cli.Main ugc adminUpdateScreenshots \
    --contentId 'LODtVVgt' \
    --namespace "$AB_NAMESPACE" \
    --body '{"screenshots": [{"description": "TtqOhlda", "screenshotId": "LHXaC3PB"}, {"description": "Ej6BZezv", "screenshotId": "qshYykGc"}, {"description": "g35MX4Zl", "screenshotId": "Er59am9L"}]}' \
    > test.out 2>&1
eval_tap $? 20 'AdminUpdateScreenshots' test.out

#- 21 AdminUploadContentScreenshot
./ng net.accelbyte.sdk.cli.Main ugc adminUploadContentScreenshot \
    --contentId 'OV6xOfql' \
    --namespace "$AB_NAMESPACE" \
    --body '{"screenshots": [{"contentType": "Qm43qx09", "description": "fwKNZVSw", "fileExtension": "jfif"}, {"contentType": "hMWDbPcA", "description": "0pfwtPZI", "fileExtension": "jpg"}, {"contentType": "f4AQHbB8", "description": "GQ6xu1u2", "fileExtension": "jpg"}]}' \
    > test.out 2>&1
eval_tap $? 21 'AdminUploadContentScreenshot' test.out

#- 22 AdminDeleteContentScreenshot
./ng net.accelbyte.sdk.cli.Main ugc adminDeleteContentScreenshot \
    --contentId 'X0kzc3Bi' \
    --namespace "$AB_NAMESPACE" \
    --screenshotId 'k0IGOUtb' \
    > test.out 2>&1
eval_tap $? 22 'AdminDeleteContentScreenshot' test.out

#- 23 ListContentVersions
./ng net.accelbyte.sdk.cli.Main ugc listContentVersions \
    --contentId '6YZNe4lf' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 23 'ListContentVersions' test.out

#- 24 SingleAdminGetAllGroups
./ng net.accelbyte.sdk.cli.Main ugc singleAdminGetAllGroups \
    --namespace "$AB_NAMESPACE" \
    --limit '56' \
    --offset '38' \
    > test.out 2>&1
eval_tap $? 24 'SingleAdminGetAllGroups' test.out

#- 25 AdminCreateGroup
./ng net.accelbyte.sdk.cli.Main ugc adminCreateGroup \
    --namespace "$AB_NAMESPACE" \
    --body '{"contents": ["vSINdAss", "EKPX6Bff", "RDrf27TD"], "name": "16qFNoEO"}' \
    > test.out 2>&1
eval_tap $? 25 'AdminCreateGroup' test.out

#- 26 SingleAdminGetGroup
./ng net.accelbyte.sdk.cli.Main ugc singleAdminGetGroup \
    --groupId 'eWUJa4Uf' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 26 'SingleAdminGetGroup' test.out

#- 27 SingleAdminUpdateGroup
./ng net.accelbyte.sdk.cli.Main ugc singleAdminUpdateGroup \
    --groupId 'wqRCOyOl' \
    --namespace "$AB_NAMESPACE" \
    --body '{"contents": ["8t4WzLSf", "7P16Qq6a", "TCN6SNNv"], "name": "z0yQ5DCl"}' \
    > test.out 2>&1
eval_tap $? 27 'SingleAdminUpdateGroup' test.out

#- 28 SingleAdminDeleteGroup
./ng net.accelbyte.sdk.cli.Main ugc singleAdminDeleteGroup \
    --groupId 'kfG6Lyig' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 28 'SingleAdminDeleteGroup' test.out

#- 29 SingleAdminGetGroupContents
./ng net.accelbyte.sdk.cli.Main ugc singleAdminGetGroupContents \
    --groupId '8RlkGeZV' \
    --namespace "$AB_NAMESPACE" \
    --limit '58' \
    --offset '8' \
    > test.out 2>&1
eval_tap $? 29 'SingleAdminGetGroupContents' test.out

#- 30 AdminGetTag
./ng net.accelbyte.sdk.cli.Main ugc adminGetTag \
    --namespace "$AB_NAMESPACE" \
    --limit '20' \
    --offset '90' \
    > test.out 2>&1
eval_tap $? 30 'AdminGetTag' test.out

#- 31 AdminCreateTag
./ng net.accelbyte.sdk.cli.Main ugc adminCreateTag \
    --namespace "$AB_NAMESPACE" \
    --body '{"tag": "B3nMKfMo"}' \
    > test.out 2>&1
eval_tap $? 31 'AdminCreateTag' test.out

#- 32 AdminUpdateTag
./ng net.accelbyte.sdk.cli.Main ugc adminUpdateTag \
    --namespace "$AB_NAMESPACE" \
    --tagId 'G47vWHl6' \
    --body '{"tag": "AdWEm1Hd"}' \
    > test.out 2>&1
eval_tap $? 32 'AdminUpdateTag' test.out

#- 33 AdminDeleteTag
./ng net.accelbyte.sdk.cli.Main ugc adminDeleteTag \
    --namespace "$AB_NAMESPACE" \
    --tagId 'yNUawbKU' \
    > test.out 2>&1
eval_tap $? 33 'AdminDeleteTag' test.out

#- 34 AdminGetType
./ng net.accelbyte.sdk.cli.Main ugc adminGetType \
    --namespace "$AB_NAMESPACE" \
    --limit '92' \
    --offset '62' \
    > test.out 2>&1
eval_tap $? 34 'AdminGetType' test.out

#- 35 AdminCreateType
./ng net.accelbyte.sdk.cli.Main ugc adminCreateType \
    --namespace "$AB_NAMESPACE" \
    --body '{"subtype": ["y3a4cdUU", "5ZGYSedW", "hUljavas"], "type": "n54qsmDQ"}' \
    > test.out 2>&1
eval_tap $? 35 'AdminCreateType' test.out

#- 36 AdminUpdateType
./ng net.accelbyte.sdk.cli.Main ugc adminUpdateType \
    --namespace "$AB_NAMESPACE" \
    --typeId 'gJYWkT60' \
    --body '{"subtype": ["ZMOA1NZk", "k9KD2RZv", "aGnlxxCG"], "type": "R8lbBiDY"}' \
    > test.out 2>&1
eval_tap $? 36 'AdminUpdateType' test.out

#- 37 AdminDeleteType
./ng net.accelbyte.sdk.cli.Main ugc adminDeleteType \
    --namespace "$AB_NAMESPACE" \
    --typeId 'PdgFnpUz' \
    > test.out 2>&1
eval_tap $? 37 'AdminDeleteType' test.out

#- 38 AdminGetChannel
./ng net.accelbyte.sdk.cli.Main ugc adminGetChannel \
    --namespace "$AB_NAMESPACE" \
    --userId 'zsDiId4v' \
    --limit '49' \
    --name '0bvaOiLH' \
    --offset '92' \
    > test.out 2>&1
eval_tap $? 38 'AdminGetChannel' test.out

#- 39 AdminDeleteAllUserChannels
./ng net.accelbyte.sdk.cli.Main ugc adminDeleteAllUserChannels \
    --namespace "$AB_NAMESPACE" \
    --userId 'BEL8O4Z6' \
    > test.out 2>&1
eval_tap $? 39 'AdminDeleteAllUserChannels' test.out

#- 40 AdminUpdateChannel
./ng net.accelbyte.sdk.cli.Main ugc adminUpdateChannel \
    --channelId 'Wqcb6YYD' \
    --namespace "$AB_NAMESPACE" \
    --userId '3EqVvq0y' \
    --body '{"name": "WsDjhEcp"}' \
    > test.out 2>&1
eval_tap $? 40 'AdminUpdateChannel' test.out

#- 41 AdminDeleteChannel
./ng net.accelbyte.sdk.cli.Main ugc adminDeleteChannel \
    --channelId 'YrcpqKbq' \
    --namespace "$AB_NAMESPACE" \
    --userId 'y7bbuwsg' \
    > test.out 2>&1
eval_tap $? 41 'AdminDeleteChannel' test.out

#- 42 AdminUpdateContentS3ByShareCode
./ng net.accelbyte.sdk.cli.Main ugc adminUpdateContentS3ByShareCode \
    --channelId 'BkwnjKio' \
    --namespace "$AB_NAMESPACE" \
    --shareCode 'U5cI3jWa' \
    --userId 'SntSTkxk' \
    --body '{"contentType": "qydP32ZV", "customAttributes": {"jdnRAuAI": {}, "CwL7dgCB": {}, "mFuPTsbD": {}}, "fileExtension": "yN0RY8WX", "name": "vHvAjnka", "payload": "OJpTUiRW", "preview": "4uCrqveW", "previewMetadata": {"previewContentType": "UJ1rnZsN", "previewFileExtension": "luZvGYjR"}, "shareCode": "2zbe7bWj", "subType": "lUNCcW6H", "tags": ["S0IClGQC", "mQT5r9AY", "IzE6OfLf"], "type": "q9d6iukm", "updateContentFile": false}' \
    > test.out 2>&1
eval_tap $? 42 'AdminUpdateContentS3ByShareCode' test.out

#- 43 AdminUpdateContentS3
./ng net.accelbyte.sdk.cli.Main ugc adminUpdateContentS3 \
    --channelId '6MYq3vz2' \
    --contentId 'WPLuJQHv' \
    --namespace "$AB_NAMESPACE" \
    --userId '1YQO0gov' \
    --body '{"contentType": "Ly80qQl5", "customAttributes": {"ty4uXCCb": {}, "zlNfx1HF": {}, "iV9dBdJe": {}}, "fileExtension": "4RP8ygHB", "name": "fX6ljhBM", "payload": "8nXVEeeG", "preview": "IavRCLsr", "previewMetadata": {"previewContentType": "cstPCVOR", "previewFileExtension": "0h8vnNRq"}, "shareCode": "ZUyK2E0A", "subType": "IK9eyMPu", "tags": ["5azobpHr", "zZWPPgsn", "ZdBCcmcN"], "type": "Qd0qB6Uf", "updateContentFile": false}' \
    > test.out 2>&1
eval_tap $? 43 'AdminUpdateContentS3' test.out

#- 44 DeleteContentByShareCode
./ng net.accelbyte.sdk.cli.Main ugc deleteContentByShareCode \
    --channelId '5vWXVMHv' \
    --namespace "$AB_NAMESPACE" \
    --shareCode 'zmmITgQq' \
    --userId 'yzB8KsMd' \
    > test.out 2>&1
eval_tap $? 44 'DeleteContentByShareCode' test.out

#- 45 AdminUpdateContentDirect
eval_tap 0 45 'AdminUpdateContentDirect # SKIP deprecated' test.out

#- 46 AdminDeleteContent
./ng net.accelbyte.sdk.cli.Main ugc adminDeleteContent \
    --channelId 'vrXB2pQC' \
    --contentId 'qDJsGzhN' \
    --namespace "$AB_NAMESPACE" \
    --userId 'wc3kPGfN' \
    > test.out 2>&1
eval_tap $? 46 'AdminDeleteContent' test.out

#- 47 AdminGetContent
./ng net.accelbyte.sdk.cli.Main ugc adminGetContent \
    --namespace "$AB_NAMESPACE" \
    --userId 'AeUODtj0' \
    --limit '10' \
    --offset '17' \
    > test.out 2>&1
eval_tap $? 47 'AdminGetContent' test.out

#- 48 AdminDeleteAllUserContents
./ng net.accelbyte.sdk.cli.Main ugc adminDeleteAllUserContents \
    --namespace "$AB_NAMESPACE" \
    --userId 'vdZHgYQk' \
    > test.out 2>&1
eval_tap $? 48 'AdminDeleteAllUserContents' test.out

#- 49 AdminHideUserContent
./ng net.accelbyte.sdk.cli.Main ugc adminHideUserContent \
    --contentId 'Fp4AgZGs' \
    --namespace "$AB_NAMESPACE" \
    --userId 'CCm0wObY' \
    --body '{"isHidden": true}' \
    > test.out 2>&1
eval_tap $? 49 'AdminHideUserContent' test.out

#- 50 AdminGetAllGroups
./ng net.accelbyte.sdk.cli.Main ugc adminGetAllGroups \
    --namespace "$AB_NAMESPACE" \
    --userId 'ZMfgaKT6' \
    --limit '52' \
    --offset '84' \
    > test.out 2>&1
eval_tap $? 50 'AdminGetAllGroups' test.out

#- 51 AdminDeleteAllUserGroup
./ng net.accelbyte.sdk.cli.Main ugc adminDeleteAllUserGroup \
    --namespace "$AB_NAMESPACE" \
    --userId 'ON4DVctW' \
    > test.out 2>&1
eval_tap $? 51 'AdminDeleteAllUserGroup' test.out

#- 52 AdminGetGroup
./ng net.accelbyte.sdk.cli.Main ugc adminGetGroup \
    --groupId 'pv28V7sm' \
    --namespace "$AB_NAMESPACE" \
    --userId 'Q7fOihIR' \
    > test.out 2>&1
eval_tap $? 52 'AdminGetGroup' test.out

#- 53 AdminUpdateGroup
./ng net.accelbyte.sdk.cli.Main ugc adminUpdateGroup \
    --groupId 'hn8UrQtA' \
    --namespace "$AB_NAMESPACE" \
    --userId 'hd0hE4I6' \
    --body '{"contents": ["xKgHEYyv", "L6sPxD2r", "YvFqqnHF"], "name": "xcog6ldG"}' \
    > test.out 2>&1
eval_tap $? 53 'AdminUpdateGroup' test.out

#- 54 AdminDeleteGroup
./ng net.accelbyte.sdk.cli.Main ugc adminDeleteGroup \
    --groupId '55upACIa' \
    --namespace "$AB_NAMESPACE" \
    --userId 'xIixeoMR' \
    > test.out 2>&1
eval_tap $? 54 'AdminDeleteGroup' test.out

#- 55 AdminGetGroupContents
./ng net.accelbyte.sdk.cli.Main ugc adminGetGroupContents \
    --groupId 'ikYYjtKY' \
    --namespace "$AB_NAMESPACE" \
    --userId 'oJs9eitL' \
    --limit '41' \
    --offset '24' \
    > test.out 2>&1
eval_tap $? 55 'AdminGetGroupContents' test.out

#- 56 AdminDeleteAllUserStates
./ng net.accelbyte.sdk.cli.Main ugc adminDeleteAllUserStates \
    --namespace "$AB_NAMESPACE" \
    --userId 'S3G6oMNV' \
    > test.out 2>&1
eval_tap $? 56 'AdminDeleteAllUserStates' test.out

#- 57 SearchChannelSpecificContent
./ng net.accelbyte.sdk.cli.Main ugc searchChannelSpecificContent \
    --channelId 'AlCEzWDy' \
    --namespace "$AB_NAMESPACE" \
    --creator 'hXKUcKmX' \
    --ishidden 'eGtzr4oh' \
    --isofficial 'U4sBrqyL' \
    --limit '3' \
    --name 'vIIuBFHI' \
    --offset '6' \
    --orderby 'QIgjciDM' \
    --sortby 'meYP1eMh' \
    --subtype 'MXbKGsQF' \
    --tags 'vAYLfcgW,KV9LWGnn,74VGMPdD' \
    --type '3GvD5otp' \
    --userId 'lQ4aSjIZ' \
    > test.out 2>&1
eval_tap $? 57 'SearchChannelSpecificContent' test.out

#- 58 PublicSearchContent
./ng net.accelbyte.sdk.cli.Main ugc publicSearchContent \
    --namespace "$AB_NAMESPACE" \
    --creator 'wtZa1vHi' \
    --ishidden '9poMULDy' \
    --isofficial 'VtfdG9sw' \
    --limit '81' \
    --name 'nIzf0tnr' \
    --offset '49' \
    --orderby 'Xd0GpD88' \
    --sortby 'OmmjUkN3' \
    --subtype 'Iqn4TI7v' \
    --tags 'behaUEVn,2XUEKpRK,PpdYQW5c' \
    --type 'MkDC6FvD' \
    --userId 'bT4DpmRQ' \
    > test.out 2>&1
eval_tap $? 58 'PublicSearchContent' test.out

#- 59 PublicGetContentBulk
./ng net.accelbyte.sdk.cli.Main ugc publicGetContentBulk \
    --namespace "$AB_NAMESPACE" \
    --body '{"contentIds": ["vCBeTPho", "T7V2X2vD", "eOCAVTWI"]}' \
    > test.out 2>&1
eval_tap $? 59 'PublicGetContentBulk' test.out

#- 60 GetFollowedContent
./ng net.accelbyte.sdk.cli.Main ugc getFollowedContent \
    --namespace "$AB_NAMESPACE" \
    --limit '58' \
    --offset '73' \
    > test.out 2>&1
eval_tap $? 60 'GetFollowedContent' test.out

#- 61 GetLikedContent
./ng net.accelbyte.sdk.cli.Main ugc getLikedContent \
    --namespace "$AB_NAMESPACE" \
    --isofficial  \
    --limit '66' \
    --name 'NyXmnqpu' \
    --offset '62' \
    --orderby 'OJsjEBfl' \
    --sortby 'leWcU3jT' \
    --subtype '6qa34ccJ' \
    --tags 'l1WR7cdh,0pgeNo2z,LYF4OaNI' \
    --type 'qQReiMkH' \
    > test.out 2>&1
eval_tap $? 61 'GetLikedContent' test.out

#- 62 PublicGetContentBulkByShareCodes
./ng net.accelbyte.sdk.cli.Main ugc publicGetContentBulkByShareCodes \
    --namespace "$AB_NAMESPACE" \
    --body '{"shareCodes": ["DVSScDKk", "NkCTAT3e", "KYKZM2zA"]}' \
    > test.out 2>&1
eval_tap $? 62 'PublicGetContentBulkByShareCodes' test.out

#- 63 PublicDownloadContentByShareCode
./ng net.accelbyte.sdk.cli.Main ugc publicDownloadContentByShareCode \
    --namespace "$AB_NAMESPACE" \
    --shareCode 'KtR1EpjQ' \
    > test.out 2>&1
eval_tap $? 63 'PublicDownloadContentByShareCode' test.out

#- 64 PublicDownloadContentByContentID
./ng net.accelbyte.sdk.cli.Main ugc publicDownloadContentByContentID \
    --contentId 'Y6oMiFCw' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 64 'PublicDownloadContentByContentID' test.out

#- 65 AddDownloadCount
./ng net.accelbyte.sdk.cli.Main ugc addDownloadCount \
    --contentId '8I1ozE0g' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 65 'AddDownloadCount' test.out

#- 66 UpdateContentLikeStatus
./ng net.accelbyte.sdk.cli.Main ugc updateContentLikeStatus \
    --contentId 'ISmxNlV8' \
    --namespace "$AB_NAMESPACE" \
    --body '{"likeStatus": false}' \
    > test.out 2>&1
eval_tap $? 66 'UpdateContentLikeStatus' test.out

#- 67 PublicDownloadContentPreview
./ng net.accelbyte.sdk.cli.Main ugc publicDownloadContentPreview \
    --contentId 'Qi1moxq9' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 67 'PublicDownloadContentPreview' test.out

#- 68 GetTag
./ng net.accelbyte.sdk.cli.Main ugc getTag \
    --namespace "$AB_NAMESPACE" \
    --limit '96' \
    --offset '41' \
    > test.out 2>&1
eval_tap $? 68 'GetTag' test.out

#- 69 GetType
./ng net.accelbyte.sdk.cli.Main ugc getType \
    --namespace "$AB_NAMESPACE" \
    --limit '15' \
    --offset '22' \
    > test.out 2>&1
eval_tap $? 69 'GetType' test.out

#- 70 PublicSearchCreator
./ng net.accelbyte.sdk.cli.Main ugc publicSearchCreator \
    --namespace "$AB_NAMESPACE" \
    --limit '22' \
    --offset '45' \
    --orderby 'YjAV8la8' \
    --sortby '9bVH6XCO' \
    > test.out 2>&1
eval_tap $? 70 'PublicSearchCreator' test.out

#- 71 GetFollowedUsers
./ng net.accelbyte.sdk.cli.Main ugc getFollowedUsers \
    --namespace "$AB_NAMESPACE" \
    --limit '35' \
    --offset '16' \
    > test.out 2>&1
eval_tap $? 71 'GetFollowedUsers' test.out

#- 72 PublicGetCreator
./ng net.accelbyte.sdk.cli.Main ugc publicGetCreator \
    --namespace "$AB_NAMESPACE" \
    --userId 'etdckPlH' \
    > test.out 2>&1
eval_tap $? 72 'PublicGetCreator' test.out

#- 73 GetChannels
./ng net.accelbyte.sdk.cli.Main ugc getChannels \
    --namespace "$AB_NAMESPACE" \
    --userId 'NJlXi7my' \
    --limit '55' \
    --name 'ISKZKOkC' \
    --offset '77' \
    > test.out 2>&1
eval_tap $? 73 'GetChannels' test.out

#- 74 PublicCreateChannel
./ng net.accelbyte.sdk.cli.Main ugc publicCreateChannel \
    --namespace "$AB_NAMESPACE" \
    --userId 'b8sQemsu' \
    --body '{"name": "oStoSayu"}' \
    > test.out 2>&1
eval_tap $? 74 'PublicCreateChannel' test.out

#- 75 DeleteAllUserChannel
./ng net.accelbyte.sdk.cli.Main ugc deleteAllUserChannel \
    --namespace "$AB_NAMESPACE" \
    --userId 'O7MdmX6D' \
    > test.out 2>&1
eval_tap $? 75 'DeleteAllUserChannel' test.out

#- 76 UpdateChannel
./ng net.accelbyte.sdk.cli.Main ugc updateChannel \
    --channelId 'bBqjYiaH' \
    --namespace "$AB_NAMESPACE" \
    --userId 'huPwSF9W' \
    --body '{"name": "Cu8GkDTa"}' \
    > test.out 2>&1
eval_tap $? 76 'UpdateChannel' test.out

#- 77 DeleteChannel
./ng net.accelbyte.sdk.cli.Main ugc deleteChannel \
    --channelId 'l0mKlkVS' \
    --namespace "$AB_NAMESPACE" \
    --userId 'yR0eaJcr' \
    > test.out 2>&1
eval_tap $? 77 'DeleteChannel' test.out

#- 78 CreateContentDirect
eval_tap 0 78 'CreateContentDirect # SKIP deprecated' test.out

#- 79 CreateContentS3
./ng net.accelbyte.sdk.cli.Main ugc createContentS3 \
    --channelId 'WV4PSv3w' \
    --namespace "$AB_NAMESPACE" \
    --userId 'XaPsU45C' \
    --body '{"contentType": "dmc26sCY", "customAttributes": {"7x34hZOh": {}, "VCgSgcMI": {}, "qfscbg1m": {}}, "fileExtension": "0cOGxl3D", "name": "rrYgzF8m", "preview": "zoeHTiJK", "previewMetadata": {"previewContentType": "GM7387wF", "previewFileExtension": "52H4TJq9"}, "subType": "t0mtm9JX", "tags": ["ofZiovQY", "vUJJIGuY", "DYMTU7IP"], "type": "poT8n2jq"}' \
    > test.out 2>&1
eval_tap $? 79 'CreateContentS3' test.out

#- 80 PublicUpdateContentByShareCode
./ng net.accelbyte.sdk.cli.Main ugc publicUpdateContentByShareCode \
    --channelId '5ASuJGl7' \
    --namespace "$AB_NAMESPACE" \
    --shareCode 'H0peYiez' \
    --userId 'nzeXUK0a' \
    --body '{"contentType": "cN68CYCF", "customAttributes": {"YykJPUcE": {}, "Ldru32KZ": {}, "xKeG6Qxs": {}}, "fileExtension": "vUuMOLcc", "name": "oUEIcgdx", "payload": "9k93GBV4", "preview": "CDc80mlk", "previewMetadata": {"previewContentType": "VePlVUtI", "previewFileExtension": "cQrDmEn1"}, "subType": "vPgSt64Z", "tags": ["QP0aPRnc", "zksR0Oxr", "PRqg9hnE"], "type": "6pKdQCUk", "updateContentFile": true}' \
    > test.out 2>&1
eval_tap $? 80 'PublicUpdateContentByShareCode' test.out

#- 81 UpdateContentS3
./ng net.accelbyte.sdk.cli.Main ugc updateContentS3 \
    --channelId '2JtE887J' \
    --contentId 'ZRCae3sq' \
    --namespace "$AB_NAMESPACE" \
    --userId 'bjeqMvV3' \
    --body '{"contentType": "fta9EJOE", "customAttributes": {"fxjUHnQO": {}, "a6j78BpC": {}, "6IV2cbU3": {}}, "fileExtension": "76mhW8KM", "name": "WZEFE7IF", "payload": "HCPTbHrt", "preview": "MQMs92RX", "previewMetadata": {"previewContentType": "uoZb9zmI", "previewFileExtension": "Mz3u3nTB"}, "subType": "RYnhacOE", "tags": ["Pfx8m3WM", "Xt14WN3G", "pHpievsn"], "type": "k1njriyK", "updateContentFile": false}' \
    > test.out 2>&1
eval_tap $? 81 'UpdateContentS3' test.out

#- 82 PublicDeleteContentByShareCode
./ng net.accelbyte.sdk.cli.Main ugc publicDeleteContentByShareCode \
    --channelId 'eeKrHY9t' \
    --namespace "$AB_NAMESPACE" \
    --shareCode 'p4s2nBer' \
    --userId 'UgDYSVUP' \
    > test.out 2>&1
eval_tap $? 82 'PublicDeleteContentByShareCode' test.out

#- 83 UpdateContentDirect
eval_tap 0 83 'UpdateContentDirect # SKIP deprecated' test.out

#- 84 DeleteContent
./ng net.accelbyte.sdk.cli.Main ugc deleteContent \
    --channelId 'VlJgM0AU' \
    --contentId 'QdilBjUe' \
    --namespace "$AB_NAMESPACE" \
    --userId 'Y6DgDOFY' \
    > test.out 2>&1
eval_tap $? 84 'DeleteContent' test.out

#- 85 UpdateContentShareCode
./ng net.accelbyte.sdk.cli.Main ugc updateContentShareCode \
    --channelId '6du37Gol' \
    --contentId 'QH4q7Her' \
    --namespace "$AB_NAMESPACE" \
    --userId 'pAuCpCIz' \
    --body '{"shareCode": "2kTjrvvP"}' \
    > test.out 2>&1
eval_tap $? 85 'UpdateContentShareCode' test.out

#- 86 PublicGetUserContent
./ng net.accelbyte.sdk.cli.Main ugc publicGetUserContent \
    --namespace "$AB_NAMESPACE" \
    --userId 'R0QTTrWN' \
    --limit '32' \
    --offset '85' \
    > test.out 2>&1
eval_tap $? 86 'PublicGetUserContent' test.out

#- 87 DeleteAllUserContents
./ng net.accelbyte.sdk.cli.Main ugc deleteAllUserContents \
    --namespace "$AB_NAMESPACE" \
    --userId '4U4zqZvI' \
    > test.out 2>&1
eval_tap $? 87 'DeleteAllUserContents' test.out

#- 88 UpdateScreenshots
./ng net.accelbyte.sdk.cli.Main ugc updateScreenshots \
    --contentId 'HsdaQpmX' \
    --namespace "$AB_NAMESPACE" \
    --userId 'Ob2MHrYf' \
    --body '{"screenshots": [{"description": "M6QkX08X", "screenshotId": "WcYQnHv7"}, {"description": "BrthCZEn", "screenshotId": "tBc1Ovvf"}, {"description": "l4bprVGR", "screenshotId": "TvhqVSLY"}]}' \
    > test.out 2>&1
eval_tap $? 88 'UpdateScreenshots' test.out

#- 89 UploadContentScreenshot
./ng net.accelbyte.sdk.cli.Main ugc uploadContentScreenshot \
    --contentId 'Ymntj6ZV' \
    --namespace "$AB_NAMESPACE" \
    --userId '00kffP8B' \
    --body '{"screenshots": [{"contentType": "zslWpMTJ", "description": "Zf6n9YOg", "fileExtension": "bmp"}, {"contentType": "pzymw5jD", "description": "49aXhg1j", "fileExtension": "jpg"}, {"contentType": "Cep0HGSy", "description": "jWD7NrxY", "fileExtension": "png"}]}' \
    > test.out 2>&1
eval_tap $? 89 'UploadContentScreenshot' test.out

#- 90 DeleteContentScreenshot
./ng net.accelbyte.sdk.cli.Main ugc deleteContentScreenshot \
    --contentId '55pq13tN' \
    --namespace "$AB_NAMESPACE" \
    --screenshotId '21QtSzSY' \
    --userId '82Y4kvRa' \
    > test.out 2>&1
eval_tap $? 90 'DeleteContentScreenshot' test.out

#- 91 UpdateUserFollowStatus
./ng net.accelbyte.sdk.cli.Main ugc updateUserFollowStatus \
    --namespace "$AB_NAMESPACE" \
    --userId 'sCbaNLrS' \
    --body '{"followStatus": true}' \
    > test.out 2>&1
eval_tap $? 91 'UpdateUserFollowStatus' test.out

#- 92 GetPublicFollowers
./ng net.accelbyte.sdk.cli.Main ugc getPublicFollowers \
    --namespace "$AB_NAMESPACE" \
    --userId 'ZDaqlYWw' \
    --limit '91' \
    --offset '77' \
    > test.out 2>&1
eval_tap $? 92 'GetPublicFollowers' test.out

#- 93 GetPublicFollowing
./ng net.accelbyte.sdk.cli.Main ugc getPublicFollowing \
    --namespace "$AB_NAMESPACE" \
    --userId 'ilo59cd2' \
    --limit '54' \
    --offset '75' \
    > test.out 2>&1
eval_tap $? 93 'GetPublicFollowing' test.out

#- 94 GetGroups
./ng net.accelbyte.sdk.cli.Main ugc getGroups \
    --namespace "$AB_NAMESPACE" \
    --userId 'aHv22SnN' \
    --limit '54' \
    --offset '2' \
    > test.out 2>&1
eval_tap $? 94 'GetGroups' test.out

#- 95 CreateGroup
./ng net.accelbyte.sdk.cli.Main ugc createGroup \
    --namespace "$AB_NAMESPACE" \
    --userId 'ieSmBaAB' \
    --body '{"contents": ["bzApDjnZ", "CnLvBzhB", "ewn3Mjlj"], "name": "gkFgWIwb"}' \
    > test.out 2>&1
eval_tap $? 95 'CreateGroup' test.out

#- 96 DeleteAllUserGroup
./ng net.accelbyte.sdk.cli.Main ugc deleteAllUserGroup \
    --namespace "$AB_NAMESPACE" \
    --userId 'y41QzsuE' \
    > test.out 2>&1
eval_tap $? 96 'DeleteAllUserGroup' test.out

#- 97 GetGroup
./ng net.accelbyte.sdk.cli.Main ugc getGroup \
    --groupId 'KFMBaxGj' \
    --namespace "$AB_NAMESPACE" \
    --userId 'm4TlA089' \
    > test.out 2>&1
eval_tap $? 97 'GetGroup' test.out

#- 98 UpdateGroup
./ng net.accelbyte.sdk.cli.Main ugc updateGroup \
    --groupId 'Z7ardKWy' \
    --namespace "$AB_NAMESPACE" \
    --userId 'ertdzGxb' \
    --body '{"contents": ["4rT8zfhL", "cEmQNkdd", "TNBhO50C"], "name": "uPX3w81d"}' \
    > test.out 2>&1
eval_tap $? 98 'UpdateGroup' test.out

#- 99 DeleteGroup
./ng net.accelbyte.sdk.cli.Main ugc deleteGroup \
    --groupId 'rRAWo4Dd' \
    --namespace "$AB_NAMESPACE" \
    --userId 'DDPxhwrR' \
    > test.out 2>&1
eval_tap $? 99 'DeleteGroup' test.out

#- 100 GetGroupContent
./ng net.accelbyte.sdk.cli.Main ugc getGroupContent \
    --groupId 'tKA2WqFd' \
    --namespace "$AB_NAMESPACE" \
    --userId 'GeoiOjnz' \
    --limit '18' \
    --offset '22' \
    > test.out 2>&1
eval_tap $? 100 'GetGroupContent' test.out

#- 101 DeleteAllUserStates
./ng net.accelbyte.sdk.cli.Main ugc deleteAllUserStates \
    --namespace "$AB_NAMESPACE" \
    --userId 'FdcARSF7' \
    > test.out 2>&1
eval_tap $? 101 'DeleteAllUserStates' test.out

#- 102 AdminGetContentByChannelIDV2
./ng net.accelbyte.sdk.cli.Main ugc adminGetContentByChannelIDV2 \
    --channelId '3yf26JzU' \
    --namespace "$AB_NAMESPACE" \
    --limit '82' \
    --name 'reES7EMS' \
    --offset '14' \
    --sortBy '3aGuiBVL' \
    > test.out 2>&1
eval_tap $? 102 'AdminGetContentByChannelIDV2' test.out

#- 103 AdminCreateContentV2
./ng net.accelbyte.sdk.cli.Main ugc adminCreateContentV2 \
    --channelId 'sT7UUh45' \
    --namespace "$AB_NAMESPACE" \
    --body '{"contentType": "aeJrE2g4", "customAttributes": {"Vop4H0os": {}, "zeRskl2N": {}, "xozd0Y6R": {}}, "fileExtension": "1wUcOxFP", "name": "vDh4AUx4", "shareCode": "wnqWi0If", "subType": "lo9IekUj", "tags": ["VQ77RNQG", "9dCXCA53", "bNibpDq4"], "type": "WkYuHGZC"}' \
    > test.out 2>&1
eval_tap $? 103 'AdminCreateContentV2' test.out

#- 104 AdminDeleteOfficialContentV2
./ng net.accelbyte.sdk.cli.Main ugc adminDeleteOfficialContentV2 \
    --channelId 'WeSJzbSd' \
    --contentId 'cmyjacW0' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 104 'AdminDeleteOfficialContentV2' test.out

#- 105 AdminUpdateOfficialContentV2
./ng net.accelbyte.sdk.cli.Main ugc adminUpdateOfficialContentV2 \
    --channelId 'EQda1x6X' \
    --contentId '2spBOQdu' \
    --namespace "$AB_NAMESPACE" \
    --body '{"customAttributes": {"ClcvBlGh": {}, "dA3ckN1W": {}, "3um2jkQZ": {}}, "name": "XxiB5GQu", "shareCode": "Jyw49aD6", "subType": "W8yKGxJU", "tags": ["aKrovCKq", "VKNoUGze", "lWR7NK8f"], "type": "iWX8i1cF"}' \
    > test.out 2>&1
eval_tap $? 105 'AdminUpdateOfficialContentV2' test.out

#- 106 AdminCopyContent
./ng net.accelbyte.sdk.cli.Main ugc adminCopyContent \
    --channelId 'wZIEcgSc' \
    --contentId 'M0zv8DZt' \
    --namespace "$AB_NAMESPACE" \
    --body '{"customAttributes": {"Olm48H9U": {}, "ExwdOtqO": {}, "r2nnNTxr": {}}, "name": "L9TK7VqV", "subType": "JlAF7wcY", "tags": ["NrljcnFn", "HcjXDLu1", "TrqpG1zM"], "targetChannelId": "McASh5np", "type": "fhvn6ahV"}' \
    > test.out 2>&1
eval_tap $? 106 'AdminCopyContent' test.out

#- 107 AdminUpdateOfficialContentFileLocation
./ng net.accelbyte.sdk.cli.Main ugc adminUpdateOfficialContentFileLocation \
    --channelId '9JfrU2kg' \
    --contentId 'JhxkgvQb' \
    --namespace "$AB_NAMESPACE" \
    --body '{"fileExtension": "YZCJXa6O", "fileLocation": "l3VB1dmc"}' \
    > test.out 2>&1
eval_tap $? 107 'AdminUpdateOfficialContentFileLocation' test.out

#- 108 AdminGenerateOfficialContentUploadURLV2
./ng net.accelbyte.sdk.cli.Main ugc adminGenerateOfficialContentUploadURLV2 \
    --channelId 'muIaFdF9' \
    --contentId 'Lj3B2Dn6' \
    --namespace "$AB_NAMESPACE" \
    --body '{"contentType": "vdPDmmzE", "fileExtension": "9uAyvtCV"}' \
    > test.out 2>&1
eval_tap $? 108 'AdminGenerateOfficialContentUploadURLV2' test.out

#- 109 AdminGetConfigs
./ng net.accelbyte.sdk.cli.Main ugc adminGetConfigs \
    --namespace "$AB_NAMESPACE" \
    --limit '90' \
    --offset '48' \
    > test.out 2>&1
eval_tap $? 109 'AdminGetConfigs' test.out

#- 110 AdminUpdateConfig
./ng net.accelbyte.sdk.cli.Main ugc adminUpdateConfig \
    --key 'd404L6gf' \
    --namespace "$AB_NAMESPACE" \
    --body '{"value": "xXAjRiOH"}' \
    > test.out 2>&1
eval_tap $? 110 'AdminUpdateConfig' test.out

#- 111 AdminListContentV2
./ng net.accelbyte.sdk.cli.Main ugc adminListContentV2 \
    --namespace "$AB_NAMESPACE" \
    --isOfficial  \
    --limit '73' \
    --name '2q11oN3j' \
    --offset '100' \
    --sortBy 'v1HXD2Ff' \
    --subType 'b0LEBfyg' \
    --tags '6j4Qeot0,gVUpoih0,hdmGW2Ay' \
    --type 'jyZPPkd7' \
    > test.out 2>&1
eval_tap $? 111 'AdminListContentV2' test.out

#- 112 AdminBulkGetContentByIDsV2
./ng net.accelbyte.sdk.cli.Main ugc adminBulkGetContentByIDsV2 \
    --namespace "$AB_NAMESPACE" \
    --body '{"contentIds": ["PEjzSHpw", "m5sCDnGQ", "PPHTObbA"]}' \
    > test.out 2>&1
eval_tap $? 112 'AdminBulkGetContentByIDsV2' test.out

#- 113 AdminGetContentBulkByShareCodesV2
./ng net.accelbyte.sdk.cli.Main ugc adminGetContentBulkByShareCodesV2 \
    --namespace "$AB_NAMESPACE" \
    --body '{"shareCodes": ["9YNQHL42", "mnGgDup9", "3CGwORT5"]}' \
    > test.out 2>&1
eval_tap $? 113 'AdminGetContentBulkByShareCodesV2' test.out

#- 114 AdminGetContentByShareCodeV2
./ng net.accelbyte.sdk.cli.Main ugc adminGetContentByShareCodeV2 \
    --namespace "$AB_NAMESPACE" \
    --shareCode 'SmNjAT3y' \
    > test.out 2>&1
eval_tap $? 114 'AdminGetContentByShareCodeV2' test.out

#- 115 AdminGetContentByContentIDV2
./ng net.accelbyte.sdk.cli.Main ugc adminGetContentByContentIDV2 \
    --contentId '19i586b4' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 115 'AdminGetContentByContentIDV2' test.out

#- 116 RollbackContentVersionV2
./ng net.accelbyte.sdk.cli.Main ugc rollbackContentVersionV2 \
    --contentId 'GJEsgKjv' \
    --namespace "$AB_NAMESPACE" \
    --versionId 'peQqZTfQ' \
    > test.out 2>&1
eval_tap $? 116 'RollbackContentVersionV2' test.out

#- 117 AdminUpdateScreenshotsV2
./ng net.accelbyte.sdk.cli.Main ugc adminUpdateScreenshotsV2 \
    --contentId 'oZ33LPWr' \
    --namespace "$AB_NAMESPACE" \
    --body '{"screenshots": [{"description": "Y1KamCBF", "screenshotId": "kJ1Qj0S9"}, {"description": "hKpHnPUJ", "screenshotId": "B27pmKv1"}, {"description": "4DmPOXFP", "screenshotId": "uMPe9nLf"}]}' \
    > test.out 2>&1
eval_tap $? 117 'AdminUpdateScreenshotsV2' test.out

#- 118 AdminUploadContentScreenshotV2
./ng net.accelbyte.sdk.cli.Main ugc adminUploadContentScreenshotV2 \
    --contentId 'ia8zsHi3' \
    --namespace "$AB_NAMESPACE" \
    --body '{"screenshots": [{"contentType": "Wh3Sk0OT", "description": "gRwQzZx0", "fileExtension": "png"}, {"contentType": "7h5Wg8Gs", "description": "ibkyWHBr", "fileExtension": "pjp"}, {"contentType": "V6rpu80j", "description": "HqsC1xNS", "fileExtension": "bmp"}]}' \
    > test.out 2>&1
eval_tap $? 118 'AdminUploadContentScreenshotV2' test.out

#- 119 AdminDeleteContentScreenshotV2
./ng net.accelbyte.sdk.cli.Main ugc adminDeleteContentScreenshotV2 \
    --contentId '2Vs2YZLE' \
    --namespace "$AB_NAMESPACE" \
    --screenshotId 'rCPoeRq3' \
    > test.out 2>&1
eval_tap $? 119 'AdminDeleteContentScreenshotV2' test.out

#- 120 ListContentVersionsV2
./ng net.accelbyte.sdk.cli.Main ugc listContentVersionsV2 \
    --contentId 'pO5Fktge' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 120 'ListContentVersionsV2' test.out

#- 121 AdminGetOfficialGroupContentsV2
./ng net.accelbyte.sdk.cli.Main ugc adminGetOfficialGroupContentsV2 \
    --groupId 'sgXI72mu' \
    --namespace "$AB_NAMESPACE" \
    --limit '58' \
    --offset '28' \
    > test.out 2>&1
eval_tap $? 121 'AdminGetOfficialGroupContentsV2' test.out

#- 122 AdminListStagingContents
./ng net.accelbyte.sdk.cli.Main ugc adminListStagingContents \
    --namespace "$AB_NAMESPACE" \
    --limit '17' \
    --offset '29' \
    --sortBy 'CylPj25j' \
    --status 'T78BjsXf' \
    > test.out 2>&1
eval_tap $? 122 'AdminListStagingContents' test.out

#- 123 AdminGetStagingContentByID
./ng net.accelbyte.sdk.cli.Main ugc adminGetStagingContentByID \
    --contentId 'S5ItXMrP' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 123 'AdminGetStagingContentByID' test.out

#- 124 AdminApproveStagingContent
./ng net.accelbyte.sdk.cli.Main ugc adminApproveStagingContent \
    --contentId '40nd2Vdh' \
    --namespace "$AB_NAMESPACE" \
    --body '{"approved": true, "note": "GeM9iV8h"}' \
    > test.out 2>&1
eval_tap $? 124 'AdminApproveStagingContent' test.out

#- 125 AdminUpdateContentByShareCodeV2
./ng net.accelbyte.sdk.cli.Main ugc adminUpdateContentByShareCodeV2 \
    --channelId 'MG8VAjW2' \
    --namespace "$AB_NAMESPACE" \
    --shareCode 'eIMnBRYo' \
    --userId 'hZOJxR4n' \
    --body '{"customAttributes": {"xRXOI9z6": {}, "L094jcis": {}, "FrL0LAas": {}}, "name": "dMlO3liq", "shareCode": "w7QsWIDi", "subType": "jRZouBmX", "tags": ["yfKrOgCh", "S3BVlk1r", "d2Si4YR4"], "type": "NGlNrv3R"}' \
    > test.out 2>&1
eval_tap $? 125 'AdminUpdateContentByShareCodeV2' test.out

#- 126 AdminDeleteContentByShareCodeV2
./ng net.accelbyte.sdk.cli.Main ugc adminDeleteContentByShareCodeV2 \
    --channelId 'Rq7dymal' \
    --namespace "$AB_NAMESPACE" \
    --shareCode 'K3aBIPar' \
    --userId 'TbZQzi4u' \
    > test.out 2>&1
eval_tap $? 126 'AdminDeleteContentByShareCodeV2' test.out

#- 127 AdminDeleteUserContentV2
./ng net.accelbyte.sdk.cli.Main ugc adminDeleteUserContentV2 \
    --channelId 'XRT5kv7R' \
    --contentId 'cqEw3ucH' \
    --namespace "$AB_NAMESPACE" \
    --userId 'Nc0UAFVr' \
    > test.out 2>&1
eval_tap $? 127 'AdminDeleteUserContentV2' test.out

#- 128 AdminUpdateUserContentV2
./ng net.accelbyte.sdk.cli.Main ugc adminUpdateUserContentV2 \
    --channelId 'CKrjlwZ9' \
    --contentId 'FtG2dTbM' \
    --namespace "$AB_NAMESPACE" \
    --userId 'AAsQ9e5O' \
    --body '{"customAttributes": {"j7cxwYLP": {}, "wi9ErvB6": {}, "JtcusDXH": {}}, "name": "zqdqBi8s", "shareCode": "mCZVZ3yF", "subType": "CoEx5mMX", "tags": ["3JyJcjNw", "njvEN7HZ", "n6xpeHrc"], "type": "5RLUL9IW"}' \
    > test.out 2>&1
eval_tap $? 128 'AdminUpdateUserContentV2' test.out

#- 129 AdminUpdateUserContentFileLocation
./ng net.accelbyte.sdk.cli.Main ugc adminUpdateUserContentFileLocation \
    --channelId 'TsVjYTDj' \
    --contentId 'pCtBWPUr' \
    --namespace "$AB_NAMESPACE" \
    --userId '4LS0NZZt' \
    --body '{"fileExtension": "5E2da0lq", "fileLocation": "B2x83Wnr"}' \
    > test.out 2>&1
eval_tap $? 129 'AdminUpdateUserContentFileLocation' test.out

#- 130 AdminGenerateUserContentUploadURLV2
./ng net.accelbyte.sdk.cli.Main ugc adminGenerateUserContentUploadURLV2 \
    --channelId 'yqatJfyy' \
    --contentId 'UarThW6W' \
    --namespace "$AB_NAMESPACE" \
    --userId 'eGmQOnfS' \
    --body '{"contentType": "WkLcxBGQ", "fileExtension": "dCh2C6hB"}' \
    > test.out 2>&1
eval_tap $? 130 'AdminGenerateUserContentUploadURLV2' test.out

#- 131 AdminGetContentByUserIDV2
./ng net.accelbyte.sdk.cli.Main ugc adminGetContentByUserIDV2 \
    --namespace "$AB_NAMESPACE" \
    --userId '0npnj3D5' \
    --limit '68' \
    --offset '55' \
    --sortBy '0HTpbSgv' \
    > test.out 2>&1
eval_tap $? 131 'AdminGetContentByUserIDV2' test.out

#- 132 AdminUpdateContentHideStatusV2
./ng net.accelbyte.sdk.cli.Main ugc adminUpdateContentHideStatusV2 \
    --contentId '34VJZa5K' \
    --namespace "$AB_NAMESPACE" \
    --userId 'pPVdq3IE' \
    --body '{"isHidden": false}' \
    > test.out 2>&1
eval_tap $? 132 'AdminUpdateContentHideStatusV2' test.out

#- 133 AdminGetUserGroupContentsV2
./ng net.accelbyte.sdk.cli.Main ugc adminGetUserGroupContentsV2 \
    --groupId 'oR7itWqP' \
    --namespace "$AB_NAMESPACE" \
    --userId '4w5OcsvF' \
    --limit '26' \
    --offset '41' \
    > test.out 2>&1
eval_tap $? 133 'AdminGetUserGroupContentsV2' test.out

#- 134 AdminListUserStagingContents
./ng net.accelbyte.sdk.cli.Main ugc adminListUserStagingContents \
    --namespace "$AB_NAMESPACE" \
    --userId 'YRsOOrMH' \
    --limit '11' \
    --offset '100' \
    --sortBy 'nobQD9xD' \
    --status 'em07Uqoi' \
    > test.out 2>&1
eval_tap $? 134 'AdminListUserStagingContents' test.out

#- 135 PublicGetContentByChannelIDV2
./ng net.accelbyte.sdk.cli.Main ugc publicGetContentByChannelIDV2 \
    --channelId 'jf2Atbbk' \
    --namespace "$AB_NAMESPACE" \
    --limit '80' \
    --name 'wknQULpu' \
    --offset '96' \
    --sortBy 'QWk2ygHz' \
    > test.out 2>&1
eval_tap $? 135 'PublicGetContentByChannelIDV2' test.out

#- 136 PublicListContentV2
./ng net.accelbyte.sdk.cli.Main ugc publicListContentV2 \
    --namespace "$AB_NAMESPACE" \
    --isOfficial  \
    --limit '60' \
    --name 'NzDo3cmP' \
    --offset '50' \
    --sortBy 'BpqLRWnO' \
    --subType 'AK8BsEPw' \
    --tags 'ARZuVA3e,dOhW7mLa,zlha597h' \
    --type 'BkljGwGv' \
    > test.out 2>&1
eval_tap $? 136 'PublicListContentV2' test.out

#- 137 PublicBulkGetContentByIDV2
./ng net.accelbyte.sdk.cli.Main ugc publicBulkGetContentByIDV2 \
    --namespace "$AB_NAMESPACE" \
    --body '{"contentIds": ["EJueD9LR", "hWVhW7m1", "nSNs6bOB"]}' \
    > test.out 2>&1
eval_tap $? 137 'PublicBulkGetContentByIDV2' test.out

#- 138 PublicGetContentBulkByShareCodesV2
./ng net.accelbyte.sdk.cli.Main ugc publicGetContentBulkByShareCodesV2 \
    --namespace "$AB_NAMESPACE" \
    --body '{"shareCodes": ["1VZLV4ZE", "tctSNYZt", "duVd8uM9"]}' \
    > test.out 2>&1
eval_tap $? 138 'PublicGetContentBulkByShareCodesV2' test.out

#- 139 PublicGetContentByShareCodeV2
./ng net.accelbyte.sdk.cli.Main ugc publicGetContentByShareCodeV2 \
    --namespace "$AB_NAMESPACE" \
    --shareCode 'rJfEIP1s' \
    > test.out 2>&1
eval_tap $? 139 'PublicGetContentByShareCodeV2' test.out

#- 140 PublicGetContentByIDV2
./ng net.accelbyte.sdk.cli.Main ugc publicGetContentByIDV2 \
    --contentId '5m0PcTFH' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 140 'PublicGetContentByIDV2' test.out

#- 141 PublicAddDownloadCountV2
./ng net.accelbyte.sdk.cli.Main ugc publicAddDownloadCountV2 \
    --contentId '9zZAizNH' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 141 'PublicAddDownloadCountV2' test.out

#- 142 PublicListContentDownloaderV2
./ng net.accelbyte.sdk.cli.Main ugc publicListContentDownloaderV2 \
    --contentId 'OjxhaoDD' \
    --namespace "$AB_NAMESPACE" \
    --limit '57' \
    --offset '97' \
    --sortBy '8NRK3B2Q' \
    --userId 'PvcnbQRn' \
    > test.out 2>&1
eval_tap $? 142 'PublicListContentDownloaderV2' test.out

#- 143 PublicListContentLikeV2
./ng net.accelbyte.sdk.cli.Main ugc publicListContentLikeV2 \
    --contentId 'wYBubUu4' \
    --namespace "$AB_NAMESPACE" \
    --limit '91' \
    --offset '50' \
    --sortBy 'PKvW4jjf' \
    > test.out 2>&1
eval_tap $? 143 'PublicListContentLikeV2' test.out

#- 144 UpdateContentLikeStatusV2
./ng net.accelbyte.sdk.cli.Main ugc updateContentLikeStatusV2 \
    --contentId 'Ub3jId20' \
    --namespace "$AB_NAMESPACE" \
    --body '{"likeStatus": true}' \
    > test.out 2>&1
eval_tap $? 144 'UpdateContentLikeStatusV2' test.out

#- 145 PublicCreateContentV2
./ng net.accelbyte.sdk.cli.Main ugc publicCreateContentV2 \
    --channelId '5qGBcRWU' \
    --namespace "$AB_NAMESPACE" \
    --userId 'Rc6iTBB3' \
    --body '{"contentType": "pMEPDerA", "customAttributes": {"DxeKmTcv": {}, "HP18hSrp": {}, "HvGquF3O": {}}, "fileExtension": "OpPKDF2o", "name": "huljl4iM", "subType": "tq5DEyi3", "tags": ["KAtVVRAL", "lWMPrmTT", "5vjcIfBx"], "type": "29e6oooG"}' \
    > test.out 2>&1
eval_tap $? 145 'PublicCreateContentV2' test.out

#- 146 PublicUpdateContentByShareCodeV2
./ng net.accelbyte.sdk.cli.Main ugc publicUpdateContentByShareCodeV2 \
    --channelId '4hAzYEwt' \
    --namespace "$AB_NAMESPACE" \
    --shareCode 'ThTMwu80' \
    --userId 'm0Vj83tU' \
    --body '{"customAttributes": {"U6s6VQwg": {}, "Z9KZV453": {}, "rzw3F4Is": {}}, "name": "qVaPKfO1", "subType": "pjfutcjk", "tags": ["9QLIcSXz", "mhLzlKpl", "2LmqgiUE"], "type": "4bYDLEC6"}' \
    > test.out 2>&1
eval_tap $? 146 'PublicUpdateContentByShareCodeV2' test.out

#- 147 PublicDeleteContentByShareCodeV2
./ng net.accelbyte.sdk.cli.Main ugc publicDeleteContentByShareCodeV2 \
    --channelId '6tC4ijtI' \
    --namespace "$AB_NAMESPACE" \
    --shareCode 'N3L03EJo' \
    --userId 'ej1Xj0Py' \
    > test.out 2>&1
eval_tap $? 147 'PublicDeleteContentByShareCodeV2' test.out

#- 148 PublicDeleteContentV2
./ng net.accelbyte.sdk.cli.Main ugc publicDeleteContentV2 \
    --channelId 'mk4QeMoU' \
    --contentId 'hOx9yLIG' \
    --namespace "$AB_NAMESPACE" \
    --userId 'iiQdqPGe' \
    > test.out 2>&1
eval_tap $? 148 'PublicDeleteContentV2' test.out

#- 149 PublicUpdateContentV2
./ng net.accelbyte.sdk.cli.Main ugc publicUpdateContentV2 \
    --channelId 'LcX5LPeU' \
    --contentId 'OfaaN4eO' \
    --namespace "$AB_NAMESPACE" \
    --userId 'cfWDs1JC' \
    --body '{"customAttributes": {"XhuDjyOq": {}, "idQlV42j": {}, "l5FPALlY": {}}, "name": "IR8lTamv", "subType": "k7rVcU0R", "tags": ["8F23B24Q", "TskEjh9a", "JzduMwub"], "type": "pAnN8nxX"}' \
    > test.out 2>&1
eval_tap $? 149 'PublicUpdateContentV2' test.out

#- 150 PublicUpdateContentFileLocation
./ng net.accelbyte.sdk.cli.Main ugc publicUpdateContentFileLocation \
    --channelId 'jM3RzLUN' \
    --contentId 'lqEUCsob' \
    --namespace "$AB_NAMESPACE" \
    --userId 'tFPYlTon' \
    --body '{"fileExtension": "x9MORwDS", "fileLocation": "ABcD5oZS"}' \
    > test.out 2>&1
eval_tap $? 150 'PublicUpdateContentFileLocation' test.out

#- 151 UpdateContentShareCodeV2
./ng net.accelbyte.sdk.cli.Main ugc updateContentShareCodeV2 \
    --channelId '6h1XIZv1' \
    --contentId 'l7ZDCQAt' \
    --namespace "$AB_NAMESPACE" \
    --userId 'iB5qOjGc' \
    --body '{"shareCode": "oZHBtPfA"}' \
    > test.out 2>&1
eval_tap $? 151 'UpdateContentShareCodeV2' test.out

#- 152 PublicGenerateContentUploadURLV2
./ng net.accelbyte.sdk.cli.Main ugc publicGenerateContentUploadURLV2 \
    --channelId 'QTONoTXz' \
    --contentId 'HGsDXSAo' \
    --namespace "$AB_NAMESPACE" \
    --userId 'F30Qk4gC' \
    --body '{"contentType": "lVzncgPT", "fileExtension": "POo99igU"}' \
    > test.out 2>&1
eval_tap $? 152 'PublicGenerateContentUploadURLV2' test.out

#- 153 PublicGetContentByUserIDV2
./ng net.accelbyte.sdk.cli.Main ugc publicGetContentByUserIDV2 \
    --namespace "$AB_NAMESPACE" \
    --userId 'WrcKqVme' \
    --limit '78' \
    --offset '52' \
    --sortBy 'sHrWc8XU' \
    > test.out 2>&1
eval_tap $? 153 'PublicGetContentByUserIDV2' test.out

#- 154 UpdateScreenshotsV2
./ng net.accelbyte.sdk.cli.Main ugc updateScreenshotsV2 \
    --contentId '6zqhU7aM' \
    --namespace "$AB_NAMESPACE" \
    --userId '8MqUssrw' \
    --body '{"screenshots": [{"description": "DlwLEJrk", "screenshotId": "0mIOPehX"}, {"description": "148VTKca", "screenshotId": "PY0Hqxaj"}, {"description": "pnPye79A", "screenshotId": "t0D7Kgl1"}]}' \
    > test.out 2>&1
eval_tap $? 154 'UpdateScreenshotsV2' test.out

#- 155 UploadContentScreenshotV2
./ng net.accelbyte.sdk.cli.Main ugc uploadContentScreenshotV2 \
    --contentId 'DO2wlWvL' \
    --namespace "$AB_NAMESPACE" \
    --userId '7Sd1oEgr' \
    --body '{"screenshots": [{"contentType": "g7UGNrtm", "description": "9XN4YlkU", "fileExtension": "pjp"}, {"contentType": "VHcInblx", "description": "s9bakzMm", "fileExtension": "png"}, {"contentType": "oFnzr4Px", "description": "iMOoF5F8", "fileExtension": "jpeg"}]}' \
    > test.out 2>&1
eval_tap $? 155 'UploadContentScreenshotV2' test.out

#- 156 DeleteContentScreenshotV2
./ng net.accelbyte.sdk.cli.Main ugc deleteContentScreenshotV2 \
    --contentId 'v0VBfsjL' \
    --namespace "$AB_NAMESPACE" \
    --screenshotId 'k296CIpR' \
    --userId 'P4Q1AExZ' \
    > test.out 2>&1
eval_tap $? 156 'DeleteContentScreenshotV2' test.out

#- 157 PublicGetGroupContentsV2
./ng net.accelbyte.sdk.cli.Main ugc publicGetGroupContentsV2 \
    --groupId 'qkyOUBAl' \
    --namespace "$AB_NAMESPACE" \
    --userId 'w629vEsm' \
    --limit '100' \
    --offset '62' \
    > test.out 2>&1
eval_tap $? 157 'PublicGetGroupContentsV2' test.out

#- 158 ListUserStagingContents
./ng net.accelbyte.sdk.cli.Main ugc listUserStagingContents \
    --namespace "$AB_NAMESPACE" \
    --userId 'QECZREuy' \
    --limit '69' \
    --offset '28' \
    --sortBy 'NsEvsZ64' \
    --status 'ki29SFf4' \
    > test.out 2>&1
eval_tap $? 158 'ListUserStagingContents' test.out

#- 159 GetUserStagingContentByID
./ng net.accelbyte.sdk.cli.Main ugc getUserStagingContentByID \
    --contentId 'r3cGwena' \
    --namespace "$AB_NAMESPACE" \
    --userId 'RamkRq3y' \
    > test.out 2>&1
eval_tap $? 159 'GetUserStagingContentByID' test.out

#- 160 UpdateStagingContent
./ng net.accelbyte.sdk.cli.Main ugc updateStagingContent \
    --contentId '2LqyZZ1C' \
    --namespace "$AB_NAMESPACE" \
    --userId 'wDAtRR6M' \
    --body '{"fileExtension": "RRiPqB6E", "fileLocation": "oVEk9jCa"}' \
    > test.out 2>&1
eval_tap $? 160 'UpdateStagingContent' test.out

#- 161 DeleteUserStagingContentByID
./ng net.accelbyte.sdk.cli.Main ugc deleteUserStagingContentByID \
    --contentId 'Nu93YVBf' \
    --namespace "$AB_NAMESPACE" \
    --userId 'YxN0RzGx' \
    > test.out 2>&1
eval_tap $? 161 'DeleteUserStagingContentByID' test.out


rm -f "tmp.dat"

exit $EXIT_CODE