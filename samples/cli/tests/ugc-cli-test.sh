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
    --limit '48' \
    --offset '32' \
    > test.out 2>&1
eval_tap $? 2 'SingleAdminGetChannel' test.out

#- 3 AdminCreateChannel
./ng net.accelbyte.sdk.cli.Main ugc adminCreateChannel \
    --namespace "$AB_NAMESPACE" \
    --body '{"id": "tBHpC3If", "name": "VksmFhVG"}' \
    > test.out 2>&1
eval_tap $? 3 'AdminCreateChannel' test.out

#- 4 SingleAdminUpdateChannel
./ng net.accelbyte.sdk.cli.Main ugc singleAdminUpdateChannel \
    --channelId 'tgkdDt4m' \
    --namespace "$AB_NAMESPACE" \
    --body '{"name": "QcJLPZqk"}' \
    > test.out 2>&1
eval_tap $? 4 'SingleAdminUpdateChannel' test.out

#- 5 SingleAdminDeleteChannel
./ng net.accelbyte.sdk.cli.Main ugc singleAdminDeleteChannel \
    --channelId 'ArXilqz3' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 5 'SingleAdminDeleteChannel' test.out

#- 6 AdminUploadContentDirect
eval_tap 0 6 'AdminUploadContentDirect # SKIP deprecated' test.out

#- 7 AdminUploadContentS3
./ng net.accelbyte.sdk.cli.Main ugc adminUploadContentS3 \
    --channelId 'UsFYLXN3' \
    --namespace "$AB_NAMESPACE" \
    --body '{"contentType": "Tha1FQgh", "customAttributes": {"cJMM6RWT": {}, "7yE9gR2W": {}, "8G5CxZ7z": {}}, "fileExtension": "gup0tEi1", "name": "7G6N5ctw", "preview": "RSVSLPN7", "previewMetadata": {"previewContentType": "ajtaUNuY", "previewFileExtension": "is4ownZ1"}, "shareCode": "vJ9QjT6K", "subType": "U53BZ9IJ", "tags": ["XwKz560e", "NP147y72", "cNSD8Gw6"], "type": "GVNKgjUA"}' \
    > test.out 2>&1
eval_tap $? 7 'AdminUploadContentS3' test.out

#- 8 SingleAdminUpdateContentS3
./ng net.accelbyte.sdk.cli.Main ugc singleAdminUpdateContentS3 \
    --channelId 'mOklPjcI' \
    --contentId 'xOTFzb9c' \
    --namespace "$AB_NAMESPACE" \
    --body '{"contentType": "wJ471TDq", "customAttributes": {"kDUWXOZ9": {}, "z1lueaPY": {}, "rJeCaTgv": {}}, "fileExtension": "bJOcNoPL", "name": "r9Li8W9Q", "payload": "WdoxAErn", "preview": "Au82NoY0", "previewMetadata": {"previewContentType": "1KKROzgX", "previewFileExtension": "wIfai8Jq"}, "shareCode": "1Z4DAKiL", "subType": "AUJJI6oc", "tags": ["gaVTPTYJ", "xsf6ZmQo", "EtT8MCel"], "type": "FKhX8Zgm", "updateContentFile": false}' \
    > test.out 2>&1
eval_tap $? 8 'SingleAdminUpdateContentS3' test.out

#- 9 AdminSearchChannelSpecificContent
./ng net.accelbyte.sdk.cli.Main ugc adminSearchChannelSpecificContent \
    --channelId 'bDjMDOrY' \
    --namespace "$AB_NAMESPACE" \
    --creator '1LHBT4EP' \
    --ishidden '6HCov4qh' \
    --isofficial 'zkIYFMxl' \
    --limit '44' \
    --name 'UwF5feyF' \
    --offset '73' \
    --orderby 'ZQOWNbyV' \
    --sortby 'rNGc5ekn' \
    --subtype '7jtaFoKW' \
    --tags 'sTINAKXO,AGsTRx57,cutQcH4Q' \
    --type 'nCD5q3Fl' \
    --userId 'r1air60W' \
    > test.out 2>&1
eval_tap $? 9 'AdminSearchChannelSpecificContent' test.out

#- 10 SingleAdminUpdateContentDirect
eval_tap 0 10 'SingleAdminUpdateContentDirect # SKIP deprecated' test.out

#- 11 SingleAdminDeleteContent
./ng net.accelbyte.sdk.cli.Main ugc singleAdminDeleteContent \
    --channelId 'vgkgiPe5' \
    --contentId 'w0UHkvsP' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 11 'SingleAdminDeleteContent' test.out

#- 12 SingleAdminGetContent
./ng net.accelbyte.sdk.cli.Main ugc singleAdminGetContent \
    --namespace "$AB_NAMESPACE" \
    --limit '37' \
    --offset '98' \
    > test.out 2>&1
eval_tap $? 12 'SingleAdminGetContent' test.out

#- 13 AdminGetContentBulk
./ng net.accelbyte.sdk.cli.Main ugc adminGetContentBulk \
    --namespace "$AB_NAMESPACE" \
    --body '{"contentIds": ["v26dPP6W", "WyD1cjaq", "CKcdbIDP"]}' \
    > test.out 2>&1
eval_tap $? 13 'AdminGetContentBulk' test.out

#- 14 AdminSearchContent
./ng net.accelbyte.sdk.cli.Main ugc adminSearchContent \
    --namespace "$AB_NAMESPACE" \
    --creator 'u99x54Wp' \
    --ishidden 'sjGMZYGB' \
    --isofficial 'bfKcj2wi' \
    --limit '84' \
    --name 'I9tizvc0' \
    --offset '23' \
    --orderby 'IVGFRSva' \
    --sortby 'fPpKImd8' \
    --subtype '5GtIt56Z' \
    --tags 'Z44DExkO,OhZba8HO,8LVLjLRp' \
    --type 't3GYYkmh' \
    --userId 'upoF5eD3' \
    > test.out 2>&1
eval_tap $? 14 'AdminSearchContent' test.out

#- 15 AdminGetContentBulkByShareCodes
./ng net.accelbyte.sdk.cli.Main ugc adminGetContentBulkByShareCodes \
    --namespace "$AB_NAMESPACE" \
    --body '{"shareCodes": ["LCJh8UJK", "akWwLNwt", "CbGi5Aea"]}' \
    > test.out 2>&1
eval_tap $? 15 'AdminGetContentBulkByShareCodes' test.out

#- 16 AdminGetUserContentByShareCode
./ng net.accelbyte.sdk.cli.Main ugc adminGetUserContentByShareCode \
    --namespace "$AB_NAMESPACE" \
    --shareCode '3zRzkO3f' \
    > test.out 2>&1
eval_tap $? 16 'AdminGetUserContentByShareCode' test.out

#- 17 AdminGetSpecificContent
./ng net.accelbyte.sdk.cli.Main ugc adminGetSpecificContent \
    --contentId 'jW4xAfz7' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 17 'AdminGetSpecificContent' test.out

#- 18 AdminDownloadContentPreview
./ng net.accelbyte.sdk.cli.Main ugc adminDownloadContentPreview \
    --contentId 'aNFzZcAV' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 18 'AdminDownloadContentPreview' test.out

#- 19 RollbackContentVersion
./ng net.accelbyte.sdk.cli.Main ugc rollbackContentVersion \
    --contentId 'LuORmOUO' \
    --namespace "$AB_NAMESPACE" \
    --versionId '29ymb25d' \
    > test.out 2>&1
eval_tap $? 19 'RollbackContentVersion' test.out

#- 20 AdminUpdateScreenshots
./ng net.accelbyte.sdk.cli.Main ugc adminUpdateScreenshots \
    --contentId 'rrRU7kNe' \
    --namespace "$AB_NAMESPACE" \
    --body '{"screenshots": [{"description": "OX44bCEN", "screenshotId": "PNcoRY3M"}, {"description": "oeZI8bAH", "screenshotId": "ELn7FbSB"}, {"description": "x5iF8Zoi", "screenshotId": "4nSa9TI5"}]}' \
    > test.out 2>&1
eval_tap $? 20 'AdminUpdateScreenshots' test.out

#- 21 AdminUploadContentScreenshot
./ng net.accelbyte.sdk.cli.Main ugc adminUploadContentScreenshot \
    --contentId 'ucArgtNs' \
    --namespace "$AB_NAMESPACE" \
    --body '{"screenshots": [{"contentType": "yAQWqOCT", "description": "gp14rJU8", "fileExtension": "pjp"}, {"contentType": "xyVeAYHF", "description": "csr9qCx5", "fileExtension": "pjp"}, {"contentType": "b9FN5gVb", "description": "SMPz0Fdq", "fileExtension": "jpg"}]}' \
    > test.out 2>&1
eval_tap $? 21 'AdminUploadContentScreenshot' test.out

#- 22 AdminDeleteContentScreenshot
./ng net.accelbyte.sdk.cli.Main ugc adminDeleteContentScreenshot \
    --contentId 'LXANOrI4' \
    --namespace "$AB_NAMESPACE" \
    --screenshotId 'aI4o1kCR' \
    > test.out 2>&1
eval_tap $? 22 'AdminDeleteContentScreenshot' test.out

#- 23 ListContentVersions
./ng net.accelbyte.sdk.cli.Main ugc listContentVersions \
    --contentId 'pNsYAJcv' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 23 'ListContentVersions' test.out

#- 24 SingleAdminGetAllGroups
./ng net.accelbyte.sdk.cli.Main ugc singleAdminGetAllGroups \
    --namespace "$AB_NAMESPACE" \
    --limit '46' \
    --offset '17' \
    > test.out 2>&1
eval_tap $? 24 'SingleAdminGetAllGroups' test.out

#- 25 AdminCreateGroup
./ng net.accelbyte.sdk.cli.Main ugc adminCreateGroup \
    --namespace "$AB_NAMESPACE" \
    --body '{"contents": ["JPqH3YWV", "vPT2qKmq", "mK6G96OG"], "name": "tY6aTgdx"}' \
    > test.out 2>&1
eval_tap $? 25 'AdminCreateGroup' test.out

#- 26 SingleAdminGetGroup
./ng net.accelbyte.sdk.cli.Main ugc singleAdminGetGroup \
    --groupId 'BQ7k80FT' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 26 'SingleAdminGetGroup' test.out

#- 27 SingleAdminUpdateGroup
./ng net.accelbyte.sdk.cli.Main ugc singleAdminUpdateGroup \
    --groupId '1DGWg0Ac' \
    --namespace "$AB_NAMESPACE" \
    --body '{"contents": ["rt2lnfLI", "FrxiuUc9", "8m3n9nW1"], "name": "usGTNnys"}' \
    > test.out 2>&1
eval_tap $? 27 'SingleAdminUpdateGroup' test.out

#- 28 SingleAdminDeleteGroup
./ng net.accelbyte.sdk.cli.Main ugc singleAdminDeleteGroup \
    --groupId 'slih5wWe' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 28 'SingleAdminDeleteGroup' test.out

#- 29 SingleAdminGetGroupContents
./ng net.accelbyte.sdk.cli.Main ugc singleAdminGetGroupContents \
    --groupId 'ha9lSgcA' \
    --namespace "$AB_NAMESPACE" \
    --limit '77' \
    --offset '15' \
    > test.out 2>&1
eval_tap $? 29 'SingleAdminGetGroupContents' test.out

#- 30 AdminGetTag
./ng net.accelbyte.sdk.cli.Main ugc adminGetTag \
    --namespace "$AB_NAMESPACE" \
    --limit '2' \
    --offset '83' \
    > test.out 2>&1
eval_tap $? 30 'AdminGetTag' test.out

#- 31 AdminCreateTag
./ng net.accelbyte.sdk.cli.Main ugc adminCreateTag \
    --namespace "$AB_NAMESPACE" \
    --body '{"tag": "UmXnQnMj"}' \
    > test.out 2>&1
eval_tap $? 31 'AdminCreateTag' test.out

#- 32 AdminUpdateTag
./ng net.accelbyte.sdk.cli.Main ugc adminUpdateTag \
    --namespace "$AB_NAMESPACE" \
    --tagId 'C2wl1HCQ' \
    --body '{"tag": "Vw0TqSN7"}' \
    > test.out 2>&1
eval_tap $? 32 'AdminUpdateTag' test.out

#- 33 AdminDeleteTag
./ng net.accelbyte.sdk.cli.Main ugc adminDeleteTag \
    --namespace "$AB_NAMESPACE" \
    --tagId 'y5LCr4q2' \
    > test.out 2>&1
eval_tap $? 33 'AdminDeleteTag' test.out

#- 34 AdminGetType
./ng net.accelbyte.sdk.cli.Main ugc adminGetType \
    --namespace "$AB_NAMESPACE" \
    --limit '43' \
    --offset '9' \
    > test.out 2>&1
eval_tap $? 34 'AdminGetType' test.out

#- 35 AdminCreateType
./ng net.accelbyte.sdk.cli.Main ugc adminCreateType \
    --namespace "$AB_NAMESPACE" \
    --body '{"subtype": ["QF9YPmKh", "FYHfZUde", "5CF1RzVU"], "type": "L2S4eBFO"}' \
    > test.out 2>&1
eval_tap $? 35 'AdminCreateType' test.out

#- 36 AdminUpdateType
./ng net.accelbyte.sdk.cli.Main ugc adminUpdateType \
    --namespace "$AB_NAMESPACE" \
    --typeId 'xVD5bFTX' \
    --body '{"subtype": ["hzBDGGKd", "RCefyXww", "b3Sn3IxH"], "type": "eUD9wQTy"}' \
    > test.out 2>&1
eval_tap $? 36 'AdminUpdateType' test.out

#- 37 AdminDeleteType
./ng net.accelbyte.sdk.cli.Main ugc adminDeleteType \
    --namespace "$AB_NAMESPACE" \
    --typeId 'ncHGnrSy' \
    > test.out 2>&1
eval_tap $? 37 'AdminDeleteType' test.out

#- 38 AdminGetChannel
./ng net.accelbyte.sdk.cli.Main ugc adminGetChannel \
    --namespace "$AB_NAMESPACE" \
    --userId 'f1dqyZpX' \
    --limit '91' \
    --name 'paIdbHz8' \
    --offset '19' \
    > test.out 2>&1
eval_tap $? 38 'AdminGetChannel' test.out

#- 39 AdminDeleteAllUserChannels
./ng net.accelbyte.sdk.cli.Main ugc adminDeleteAllUserChannels \
    --namespace "$AB_NAMESPACE" \
    --userId 'cnnCPYBf' \
    > test.out 2>&1
eval_tap $? 39 'AdminDeleteAllUserChannels' test.out

#- 40 AdminUpdateChannel
./ng net.accelbyte.sdk.cli.Main ugc adminUpdateChannel \
    --channelId 'ndzA3hlh' \
    --namespace "$AB_NAMESPACE" \
    --userId 'E6X8LKAJ' \
    --body '{"name": "fjZQQdfL"}' \
    > test.out 2>&1
eval_tap $? 40 'AdminUpdateChannel' test.out

#- 41 AdminDeleteChannel
./ng net.accelbyte.sdk.cli.Main ugc adminDeleteChannel \
    --channelId 'DIHOGC2i' \
    --namespace "$AB_NAMESPACE" \
    --userId 'AGsWdr2R' \
    > test.out 2>&1
eval_tap $? 41 'AdminDeleteChannel' test.out

#- 42 AdminUpdateContentS3ByShareCode
./ng net.accelbyte.sdk.cli.Main ugc adminUpdateContentS3ByShareCode \
    --channelId 'tcbfuRz9' \
    --namespace "$AB_NAMESPACE" \
    --shareCode 'hvms9Nkp' \
    --userId '4hj8i8IT' \
    --body '{"contentType": "IEMUl0h5", "customAttributes": {"WZQyLt50": {}, "BxQjTr6s": {}, "JkLN7xfy": {}}, "fileExtension": "acyBKW7R", "name": "CpEIZuHI", "payload": "pRNaeNjd", "preview": "0yEsrPc6", "previewMetadata": {"previewContentType": "kftl9PXA", "previewFileExtension": "FLbWYtST"}, "shareCode": "QLYUQmxh", "subType": "iGdmCFVJ", "tags": ["ZLn9G63W", "HDR77fcA", "nFsIQ5de"], "type": "2YOTcpEZ", "updateContentFile": true}' \
    > test.out 2>&1
eval_tap $? 42 'AdminUpdateContentS3ByShareCode' test.out

#- 43 AdminUpdateContentS3
./ng net.accelbyte.sdk.cli.Main ugc adminUpdateContentS3 \
    --channelId 'NKkKAJxh' \
    --contentId 'JR3KiJZd' \
    --namespace "$AB_NAMESPACE" \
    --userId 'fnZyjIN4' \
    --body '{"contentType": "vQbhzDFH", "customAttributes": {"5FYREZ0P": {}, "JAtnNWPm": {}, "oguQPKZr": {}}, "fileExtension": "sV4mf1Nn", "name": "89vkMs6G", "payload": "AbIhp3z6", "preview": "9dW31xWx", "previewMetadata": {"previewContentType": "cg0zuBYj", "previewFileExtension": "8yzuj3ng"}, "shareCode": "nRegmdsI", "subType": "NSLWYzAk", "tags": ["RvKb8Knq", "GN9iomth", "oOuTS4TZ"], "type": "lXfV7lrC", "updateContentFile": true}' \
    > test.out 2>&1
eval_tap $? 43 'AdminUpdateContentS3' test.out

#- 44 DeleteContentByShareCode
./ng net.accelbyte.sdk.cli.Main ugc deleteContentByShareCode \
    --channelId 'VprHuqr6' \
    --namespace "$AB_NAMESPACE" \
    --shareCode '0PuLxxXP' \
    --userId 'qXiqFKWK' \
    > test.out 2>&1
eval_tap $? 44 'DeleteContentByShareCode' test.out

#- 45 AdminUpdateContentDirect
eval_tap 0 45 'AdminUpdateContentDirect # SKIP deprecated' test.out

#- 46 AdminDeleteContent
./ng net.accelbyte.sdk.cli.Main ugc adminDeleteContent \
    --channelId 'xDSqPJFH' \
    --contentId 'pTff0BKP' \
    --namespace "$AB_NAMESPACE" \
    --userId 'nmZQEk99' \
    > test.out 2>&1
eval_tap $? 46 'AdminDeleteContent' test.out

#- 47 AdminGetContent
./ng net.accelbyte.sdk.cli.Main ugc adminGetContent \
    --namespace "$AB_NAMESPACE" \
    --userId 'cLJigyWb' \
    --limit '93' \
    --offset '3' \
    > test.out 2>&1
eval_tap $? 47 'AdminGetContent' test.out

#- 48 AdminDeleteAllUserContents
./ng net.accelbyte.sdk.cli.Main ugc adminDeleteAllUserContents \
    --namespace "$AB_NAMESPACE" \
    --userId 'UtAmL9kF' \
    > test.out 2>&1
eval_tap $? 48 'AdminDeleteAllUserContents' test.out

#- 49 AdminHideUserContent
./ng net.accelbyte.sdk.cli.Main ugc adminHideUserContent \
    --contentId 'uNrcPw6c' \
    --namespace "$AB_NAMESPACE" \
    --userId 'WYi1F7Fp' \
    --body '{"isHidden": true}' \
    > test.out 2>&1
eval_tap $? 49 'AdminHideUserContent' test.out

#- 50 AdminGetAllGroups
./ng net.accelbyte.sdk.cli.Main ugc adminGetAllGroups \
    --namespace "$AB_NAMESPACE" \
    --userId 'W9gazUui' \
    --limit '70' \
    --offset '42' \
    > test.out 2>&1
eval_tap $? 50 'AdminGetAllGroups' test.out

#- 51 AdminDeleteAllUserGroup
./ng net.accelbyte.sdk.cli.Main ugc adminDeleteAllUserGroup \
    --namespace "$AB_NAMESPACE" \
    --userId '3XJMB1Qq' \
    > test.out 2>&1
eval_tap $? 51 'AdminDeleteAllUserGroup' test.out

#- 52 AdminGetGroup
./ng net.accelbyte.sdk.cli.Main ugc adminGetGroup \
    --groupId 'StZFI8hd' \
    --namespace "$AB_NAMESPACE" \
    --userId 'KKZJvr5Y' \
    > test.out 2>&1
eval_tap $? 52 'AdminGetGroup' test.out

#- 53 AdminUpdateGroup
./ng net.accelbyte.sdk.cli.Main ugc adminUpdateGroup \
    --groupId 'Tz5MJiLc' \
    --namespace "$AB_NAMESPACE" \
    --userId 'LTXuypPT' \
    --body '{"contents": ["5Djwgjpp", "EL1SWQVP", "PIGMSUKK"], "name": "bGQ9xYeZ"}' \
    > test.out 2>&1
eval_tap $? 53 'AdminUpdateGroup' test.out

#- 54 AdminDeleteGroup
./ng net.accelbyte.sdk.cli.Main ugc adminDeleteGroup \
    --groupId 'RRD4RvjZ' \
    --namespace "$AB_NAMESPACE" \
    --userId '9dA1xfR7' \
    > test.out 2>&1
eval_tap $? 54 'AdminDeleteGroup' test.out

#- 55 AdminGetGroupContents
./ng net.accelbyte.sdk.cli.Main ugc adminGetGroupContents \
    --groupId 'Fh7fQdjv' \
    --namespace "$AB_NAMESPACE" \
    --userId 'Eey0nQui' \
    --limit '34' \
    --offset '17' \
    > test.out 2>&1
eval_tap $? 55 'AdminGetGroupContents' test.out

#- 56 AdminDeleteAllUserStates
./ng net.accelbyte.sdk.cli.Main ugc adminDeleteAllUserStates \
    --namespace "$AB_NAMESPACE" \
    --userId 'lcbSq1CD' \
    > test.out 2>&1
eval_tap $? 56 'AdminDeleteAllUserStates' test.out

#- 57 SearchChannelSpecificContent
./ng net.accelbyte.sdk.cli.Main ugc searchChannelSpecificContent \
    --channelId 'qRRNBCw8' \
    --namespace "$AB_NAMESPACE" \
    --creator 'd60bYyuM' \
    --ishidden 'IBMRTWSL' \
    --isofficial 's008fwFl' \
    --limit '45' \
    --name 'hFoUaI9i' \
    --offset '47' \
    --orderby 'LJMnHJyt' \
    --sortby 'jWuWVJr5' \
    --subtype 'EsJgccny' \
    --tags 'Ffl42fmf,HcwHHwby,MX32TCge' \
    --type 'xFkntU34' \
    --userId '6uzLH0lU' \
    > test.out 2>&1
eval_tap $? 57 'SearchChannelSpecificContent' test.out

#- 58 PublicSearchContent
./ng net.accelbyte.sdk.cli.Main ugc publicSearchContent \
    --namespace "$AB_NAMESPACE" \
    --creator '7OyDZLNC' \
    --ishidden '5NHbavc7' \
    --isofficial 'Jm2syBd4' \
    --limit '19' \
    --name 'dKLxaiaI' \
    --offset '10' \
    --orderby 'uXmLwoqL' \
    --sortby 'QyK1B1vS' \
    --subtype 'o3iggbM8' \
    --tags 'ZhKzaBjQ,S4Ygt38q,b4yz0vVM' \
    --type 'ufTdyAf4' \
    --userId 'xkGyBrtG' \
    > test.out 2>&1
eval_tap $? 58 'PublicSearchContent' test.out

#- 59 PublicGetContentBulk
./ng net.accelbyte.sdk.cli.Main ugc publicGetContentBulk \
    --namespace "$AB_NAMESPACE" \
    --body '{"contentIds": ["ABYULMTy", "2i4oR50B", "wV3p2euG"]}' \
    > test.out 2>&1
eval_tap $? 59 'PublicGetContentBulk' test.out

#- 60 GetFollowedContent
./ng net.accelbyte.sdk.cli.Main ugc getFollowedContent \
    --namespace "$AB_NAMESPACE" \
    --limit '97' \
    --offset '49' \
    > test.out 2>&1
eval_tap $? 60 'GetFollowedContent' test.out

#- 61 GetLikedContent
./ng net.accelbyte.sdk.cli.Main ugc getLikedContent \
    --namespace "$AB_NAMESPACE" \
    --isofficial  \
    --limit '3' \
    --name 'Vt1SLHr6' \
    --offset '91' \
    --orderby 'p43NhY1b' \
    --sortby 'vIdTdYZG' \
    --subtype 'os66lkdb' \
    --tags 'X2c9Unqf,rpzbXKwA,UYyzIRgu' \
    --type 'dB14lU2i' \
    > test.out 2>&1
eval_tap $? 61 'GetLikedContent' test.out

#- 62 PublicGetContentBulkByShareCodes
./ng net.accelbyte.sdk.cli.Main ugc publicGetContentBulkByShareCodes \
    --namespace "$AB_NAMESPACE" \
    --body '{"shareCodes": ["L1Tx9MOt", "I5NSrfmb", "6earn4dm"]}' \
    > test.out 2>&1
eval_tap $? 62 'PublicGetContentBulkByShareCodes' test.out

#- 63 PublicDownloadContentByShareCode
./ng net.accelbyte.sdk.cli.Main ugc publicDownloadContentByShareCode \
    --namespace "$AB_NAMESPACE" \
    --shareCode 'ogxiOtND' \
    > test.out 2>&1
eval_tap $? 63 'PublicDownloadContentByShareCode' test.out

#- 64 PublicDownloadContentByContentID
./ng net.accelbyte.sdk.cli.Main ugc publicDownloadContentByContentID \
    --contentId 'd3YRAAKf' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 64 'PublicDownloadContentByContentID' test.out

#- 65 AddDownloadCount
./ng net.accelbyte.sdk.cli.Main ugc addDownloadCount \
    --contentId 'C1rIC67C' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 65 'AddDownloadCount' test.out

#- 66 UpdateContentLikeStatus
./ng net.accelbyte.sdk.cli.Main ugc updateContentLikeStatus \
    --contentId '8gVMa9Ac' \
    --namespace "$AB_NAMESPACE" \
    --body '{"likeStatus": false}' \
    > test.out 2>&1
eval_tap $? 66 'UpdateContentLikeStatus' test.out

#- 67 PublicDownloadContentPreview
./ng net.accelbyte.sdk.cli.Main ugc publicDownloadContentPreview \
    --contentId 'oEuThMWy' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 67 'PublicDownloadContentPreview' test.out

#- 68 GetTag
./ng net.accelbyte.sdk.cli.Main ugc getTag \
    --namespace "$AB_NAMESPACE" \
    --limit '98' \
    --offset '44' \
    > test.out 2>&1
eval_tap $? 68 'GetTag' test.out

#- 69 GetType
./ng net.accelbyte.sdk.cli.Main ugc getType \
    --namespace "$AB_NAMESPACE" \
    --limit '92' \
    --offset '42' \
    > test.out 2>&1
eval_tap $? 69 'GetType' test.out

#- 70 PublicSearchCreator
./ng net.accelbyte.sdk.cli.Main ugc publicSearchCreator \
    --namespace "$AB_NAMESPACE" \
    --limit '10' \
    --offset '73' \
    --orderby 'pqvk9lyI' \
    --sortby 'gn1Mwh8z' \
    > test.out 2>&1
eval_tap $? 70 'PublicSearchCreator' test.out

#- 71 GetFollowedUsers
./ng net.accelbyte.sdk.cli.Main ugc getFollowedUsers \
    --namespace "$AB_NAMESPACE" \
    --limit '66' \
    --offset '29' \
    > test.out 2>&1
eval_tap $? 71 'GetFollowedUsers' test.out

#- 72 PublicGetCreator
./ng net.accelbyte.sdk.cli.Main ugc publicGetCreator \
    --namespace "$AB_NAMESPACE" \
    --userId 'q2JboV6k' \
    > test.out 2>&1
eval_tap $? 72 'PublicGetCreator' test.out

#- 73 GetChannels
./ng net.accelbyte.sdk.cli.Main ugc getChannels \
    --namespace "$AB_NAMESPACE" \
    --userId 'cmgYTfho' \
    --limit '29' \
    --name '0W38kRHf' \
    --offset '58' \
    > test.out 2>&1
eval_tap $? 73 'GetChannels' test.out

#- 74 PublicCreateChannel
./ng net.accelbyte.sdk.cli.Main ugc publicCreateChannel \
    --namespace "$AB_NAMESPACE" \
    --userId 'D71IVmKG' \
    --body '{"name": "Oag12Zpk"}' \
    > test.out 2>&1
eval_tap $? 74 'PublicCreateChannel' test.out

#- 75 DeleteAllUserChannel
./ng net.accelbyte.sdk.cli.Main ugc deleteAllUserChannel \
    --namespace "$AB_NAMESPACE" \
    --userId 'SM6l9yk9' \
    > test.out 2>&1
eval_tap $? 75 'DeleteAllUserChannel' test.out

#- 76 UpdateChannel
./ng net.accelbyte.sdk.cli.Main ugc updateChannel \
    --channelId '9r2Ixe95' \
    --namespace "$AB_NAMESPACE" \
    --userId 'yUC8oaON' \
    --body '{"name": "qN71ybYL"}' \
    > test.out 2>&1
eval_tap $? 76 'UpdateChannel' test.out

#- 77 DeleteChannel
./ng net.accelbyte.sdk.cli.Main ugc deleteChannel \
    --channelId 'TflKdUe7' \
    --namespace "$AB_NAMESPACE" \
    --userId 'L5odHGKT' \
    > test.out 2>&1
eval_tap $? 77 'DeleteChannel' test.out

#- 78 CreateContentDirect
eval_tap 0 78 'CreateContentDirect # SKIP deprecated' test.out

#- 79 CreateContentS3
./ng net.accelbyte.sdk.cli.Main ugc createContentS3 \
    --channelId 'aCc7n7g9' \
    --namespace "$AB_NAMESPACE" \
    --userId 'xb04caRj' \
    --body '{"contentType": "0sb2Unzm", "customAttributes": {"0D5BkFdl": {}, "9w6Vu5yX": {}, "gXdBnUsf": {}}, "fileExtension": "Us90mw9M", "name": "V7Aqm2a4", "preview": "dhCvAcP2", "previewMetadata": {"previewContentType": "wJHvQNJJ", "previewFileExtension": "Oijjtj3N"}, "subType": "C8yOfUxI", "tags": ["RcBX1KEI", "ZDuKvPuM", "DfrQSn33"], "type": "o3fufshs"}' \
    > test.out 2>&1
eval_tap $? 79 'CreateContentS3' test.out

#- 80 PublicUpdateContentByShareCode
./ng net.accelbyte.sdk.cli.Main ugc publicUpdateContentByShareCode \
    --channelId '6uqyUL76' \
    --namespace "$AB_NAMESPACE" \
    --shareCode 'DTO8Q9iC' \
    --userId 'AtCZFV5h' \
    --body '{"contentType": "v68U0gjL", "customAttributes": {"3n1R6Yrw": {}, "rNRSKJnA": {}, "WOwg6zVx": {}}, "fileExtension": "U2qdSc7x", "name": "ONJj9pgc", "payload": "dVY9KEL2", "preview": "xgha4t0E", "previewMetadata": {"previewContentType": "RU6APDWZ", "previewFileExtension": "SCkqaR98"}, "subType": "yJqJhhmd", "tags": ["VOUcAKig", "zIhVNyhg", "3o6Qptvo"], "type": "AmYp7Yhw", "updateContentFile": false}' \
    > test.out 2>&1
eval_tap $? 80 'PublicUpdateContentByShareCode' test.out

#- 81 UpdateContentS3
./ng net.accelbyte.sdk.cli.Main ugc updateContentS3 \
    --channelId 'HfS48QXL' \
    --contentId 'Cz3ARjrJ' \
    --namespace "$AB_NAMESPACE" \
    --userId 'Xvc91TpJ' \
    --body '{"contentType": "ADII5Ei1", "customAttributes": {"n1M396M8": {}, "qMN0WuS8": {}, "PcDXbrAa": {}}, "fileExtension": "vRvwkjDF", "name": "10wevpHZ", "payload": "T0LfYMbV", "preview": "1lqAtsU5", "previewMetadata": {"previewContentType": "PhMoTkLx", "previewFileExtension": "Sisz4dGF"}, "subType": "IIcaEnTA", "tags": ["Z4iNE7xn", "QTqPAHo5", "hOCqpnNG"], "type": "8JtT8C8w", "updateContentFile": true}' \
    > test.out 2>&1
eval_tap $? 81 'UpdateContentS3' test.out

#- 82 PublicDeleteContentByShareCode
./ng net.accelbyte.sdk.cli.Main ugc publicDeleteContentByShareCode \
    --channelId 'HdNDQVSX' \
    --namespace "$AB_NAMESPACE" \
    --shareCode 'BjZlsuvw' \
    --userId 'dDQ6E6Ht' \
    > test.out 2>&1
eval_tap $? 82 'PublicDeleteContentByShareCode' test.out

#- 83 UpdateContentDirect
eval_tap 0 83 'UpdateContentDirect # SKIP deprecated' test.out

#- 84 DeleteContent
./ng net.accelbyte.sdk.cli.Main ugc deleteContent \
    --channelId 'RJrt0Vcd' \
    --contentId '675r0sYA' \
    --namespace "$AB_NAMESPACE" \
    --userId 'ZuEURkej' \
    > test.out 2>&1
eval_tap $? 84 'DeleteContent' test.out

#- 85 UpdateContentShareCode
./ng net.accelbyte.sdk.cli.Main ugc updateContentShareCode \
    --channelId 'Qc0MA1OK' \
    --contentId 'gu6fmvgg' \
    --namespace "$AB_NAMESPACE" \
    --userId 'bZk0jTFv' \
    --body '{"shareCode": "Rnx88Etq"}' \
    > test.out 2>&1
eval_tap $? 85 'UpdateContentShareCode' test.out

#- 86 PublicGetUserContent
./ng net.accelbyte.sdk.cli.Main ugc publicGetUserContent \
    --namespace "$AB_NAMESPACE" \
    --userId '4YRCmqaB' \
    --limit '8' \
    --offset '42' \
    > test.out 2>&1
eval_tap $? 86 'PublicGetUserContent' test.out

#- 87 DeleteAllUserContents
./ng net.accelbyte.sdk.cli.Main ugc deleteAllUserContents \
    --namespace "$AB_NAMESPACE" \
    --userId '83eSkBKt' \
    > test.out 2>&1
eval_tap $? 87 'DeleteAllUserContents' test.out

#- 88 UpdateScreenshots
./ng net.accelbyte.sdk.cli.Main ugc updateScreenshots \
    --contentId '1npsmanj' \
    --namespace "$AB_NAMESPACE" \
    --userId 'ZuGr6KVL' \
    --body '{"screenshots": [{"description": "6JpvEK6J", "screenshotId": "aQfJavCP"}, {"description": "WtxGDIau", "screenshotId": "nUYA2lJM"}, {"description": "UzPAKXMZ", "screenshotId": "KDzf0biD"}]}' \
    > test.out 2>&1
eval_tap $? 88 'UpdateScreenshots' test.out

#- 89 UploadContentScreenshot
./ng net.accelbyte.sdk.cli.Main ugc uploadContentScreenshot \
    --contentId 'IgOg8QAN' \
    --namespace "$AB_NAMESPACE" \
    --userId '1v60uXQk' \
    --body '{"screenshots": [{"contentType": "OFTNI1fc", "description": "PLxsLb48", "fileExtension": "pjp"}, {"contentType": "efrR4HlQ", "description": "MfzLwllf", "fileExtension": "jpeg"}, {"contentType": "zQJXhkRp", "description": "SU1X7xEA", "fileExtension": "jfif"}]}' \
    > test.out 2>&1
eval_tap $? 89 'UploadContentScreenshot' test.out

#- 90 DeleteContentScreenshot
./ng net.accelbyte.sdk.cli.Main ugc deleteContentScreenshot \
    --contentId 'wMoxLQ3y' \
    --namespace "$AB_NAMESPACE" \
    --screenshotId '5CHrWSO2' \
    --userId 'f9bn2PMw' \
    > test.out 2>&1
eval_tap $? 90 'DeleteContentScreenshot' test.out

#- 91 UpdateUserFollowStatus
./ng net.accelbyte.sdk.cli.Main ugc updateUserFollowStatus \
    --namespace "$AB_NAMESPACE" \
    --userId 'dGj3KRKF' \
    --body '{"followStatus": true}' \
    > test.out 2>&1
eval_tap $? 91 'UpdateUserFollowStatus' test.out

#- 92 GetPublicFollowers
./ng net.accelbyte.sdk.cli.Main ugc getPublicFollowers \
    --namespace "$AB_NAMESPACE" \
    --userId '8twdwXWT' \
    --limit '84' \
    --offset '55' \
    > test.out 2>&1
eval_tap $? 92 'GetPublicFollowers' test.out

#- 93 GetPublicFollowing
./ng net.accelbyte.sdk.cli.Main ugc getPublicFollowing \
    --namespace "$AB_NAMESPACE" \
    --userId 'DnxyEtnw' \
    --limit '10' \
    --offset '96' \
    > test.out 2>&1
eval_tap $? 93 'GetPublicFollowing' test.out

#- 94 GetGroups
./ng net.accelbyte.sdk.cli.Main ugc getGroups \
    --namespace "$AB_NAMESPACE" \
    --userId 'lpziGtfs' \
    --limit '57' \
    --offset '75' \
    > test.out 2>&1
eval_tap $? 94 'GetGroups' test.out

#- 95 CreateGroup
./ng net.accelbyte.sdk.cli.Main ugc createGroup \
    --namespace "$AB_NAMESPACE" \
    --userId 'BdEKvpRG' \
    --body '{"contents": ["aj58lCAe", "bt8il9Iv", "v5sZkgL6"], "name": "phoYT3Yb"}' \
    > test.out 2>&1
eval_tap $? 95 'CreateGroup' test.out

#- 96 DeleteAllUserGroup
./ng net.accelbyte.sdk.cli.Main ugc deleteAllUserGroup \
    --namespace "$AB_NAMESPACE" \
    --userId 'AiDcBQRj' \
    > test.out 2>&1
eval_tap $? 96 'DeleteAllUserGroup' test.out

#- 97 GetGroup
./ng net.accelbyte.sdk.cli.Main ugc getGroup \
    --groupId '0FQWm2zW' \
    --namespace "$AB_NAMESPACE" \
    --userId 'EEytGxfc' \
    > test.out 2>&1
eval_tap $? 97 'GetGroup' test.out

#- 98 UpdateGroup
./ng net.accelbyte.sdk.cli.Main ugc updateGroup \
    --groupId 'M8NFiu4j' \
    --namespace "$AB_NAMESPACE" \
    --userId 'bBCkFI6A' \
    --body '{"contents": ["Ka6iE6mT", "ReIaVEwx", "TJVEW905"], "name": "6G3Tp0kE"}' \
    > test.out 2>&1
eval_tap $? 98 'UpdateGroup' test.out

#- 99 DeleteGroup
./ng net.accelbyte.sdk.cli.Main ugc deleteGroup \
    --groupId 'qgbzdAz0' \
    --namespace "$AB_NAMESPACE" \
    --userId '29zoUOQu' \
    > test.out 2>&1
eval_tap $? 99 'DeleteGroup' test.out

#- 100 GetGroupContent
./ng net.accelbyte.sdk.cli.Main ugc getGroupContent \
    --groupId 'mk0SCf8i' \
    --namespace "$AB_NAMESPACE" \
    --userId 'uyiaV7yU' \
    --limit '12' \
    --offset '78' \
    > test.out 2>&1
eval_tap $? 100 'GetGroupContent' test.out

#- 101 DeleteAllUserStates
./ng net.accelbyte.sdk.cli.Main ugc deleteAllUserStates \
    --namespace "$AB_NAMESPACE" \
    --userId 'nDs14ROP' \
    > test.out 2>&1
eval_tap $? 101 'DeleteAllUserStates' test.out

#- 102 AdminGetContentByChannelIDV2
./ng net.accelbyte.sdk.cli.Main ugc adminGetContentByChannelIDV2 \
    --channelId 'G6civxWH' \
    --namespace "$AB_NAMESPACE" \
    --limit '73' \
    --name 'hyd0hWsp' \
    --offset '66' \
    --sortBy 'qJwUJDAz' \
    > test.out 2>&1
eval_tap $? 102 'AdminGetContentByChannelIDV2' test.out

#- 103 AdminCreateContentV2
./ng net.accelbyte.sdk.cli.Main ugc adminCreateContentV2 \
    --channelId 'HH9p8vxd' \
    --namespace "$AB_NAMESPACE" \
    --body '{"contentType": "2a8vAmd6", "customAttributes": {"GvHFvHU5": {}, "rnigwrmL": {}, "o5gxdJdi": {}}, "fileExtension": "pQlxyQrf", "name": "IxUunhTZ", "shareCode": "sxAub4Uj", "subType": "8FQND88A", "tags": ["8WgF1KGS", "C0EcHGQ0", "pkysO2X3"], "type": "NenNxXR5"}' \
    > test.out 2>&1
eval_tap $? 103 'AdminCreateContentV2' test.out

#- 104 AdminDeleteOfficialContentV2
./ng net.accelbyte.sdk.cli.Main ugc adminDeleteOfficialContentV2 \
    --channelId 'wCf5BYyB' \
    --contentId 'pMtQuT86' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 104 'AdminDeleteOfficialContentV2' test.out

#- 105 AdminUpdateOfficialContentV2
./ng net.accelbyte.sdk.cli.Main ugc adminUpdateOfficialContentV2 \
    --channelId 'KoC34Ry0' \
    --contentId 'ggxBKaSC' \
    --namespace "$AB_NAMESPACE" \
    --body '{"customAttributes": {"X0KzKuQe": {}, "5xAXXeqn": {}, "rMIETpv6": {}}, "name": "sNksBvzR", "shareCode": "wPINZ7Yr", "subType": "F4EbWthj", "tags": ["0GsebdUc", "yFLtVxz8", "89TXCdWi"], "type": "2GEtKRAE"}' \
    > test.out 2>&1
eval_tap $? 105 'AdminUpdateOfficialContentV2' test.out

#- 106 AdminUpdateOfficialContentFileLocation
./ng net.accelbyte.sdk.cli.Main ugc adminUpdateOfficialContentFileLocation \
    --channelId 'r42y9MMv' \
    --contentId 'PjT5ySHK' \
    --namespace "$AB_NAMESPACE" \
    --body '{"fileExtension": "hlfQ8jlK", "fileLocation": "vPErYERT"}' \
    > test.out 2>&1
eval_tap $? 106 'AdminUpdateOfficialContentFileLocation' test.out

#- 107 AdminGenerateOfficialContentUploadURLV2
./ng net.accelbyte.sdk.cli.Main ugc adminGenerateOfficialContentUploadURLV2 \
    --channelId 'iqlpfKt4' \
    --contentId 'GkUVyB7x' \
    --namespace "$AB_NAMESPACE" \
    --body '{"contentType": "jQfjKH3J", "fileExtension": "VX15ojmu"}' \
    > test.out 2>&1
eval_tap $? 107 'AdminGenerateOfficialContentUploadURLV2' test.out

#- 108 AdminGetConfigs
./ng net.accelbyte.sdk.cli.Main ugc adminGetConfigs \
    --namespace "$AB_NAMESPACE" \
    --limit '71' \
    --offset '18' \
    > test.out 2>&1
eval_tap $? 108 'AdminGetConfigs' test.out

#- 109 AdminUpdateConfig
./ng net.accelbyte.sdk.cli.Main ugc adminUpdateConfig \
    --key '71mqGHE1' \
    --namespace "$AB_NAMESPACE" \
    --body '{"value": "LcHKJ11j"}' \
    > test.out 2>&1
eval_tap $? 109 'AdminUpdateConfig' test.out

#- 110 AdminListContentV2
./ng net.accelbyte.sdk.cli.Main ugc adminListContentV2 \
    --namespace "$AB_NAMESPACE" \
    --isOfficial  \
    --limit '31' \
    --name '61pgX0vU' \
    --offset '65' \
    --sortBy 'YzRX1VkS' \
    --subType 'z8fY8CMj' \
    --tags 'InYepGgo,szyu3Uyi,6Xquqqh2' \
    --type 'SCauSddV' \
    > test.out 2>&1
eval_tap $? 110 'AdminListContentV2' test.out

#- 111 AdminBulkGetContentByIDsV2
./ng net.accelbyte.sdk.cli.Main ugc adminBulkGetContentByIDsV2 \
    --namespace "$AB_NAMESPACE" \
    --body '{"contentIds": ["k6CHAIt9", "jPMivj8e", "fzKRIuP1"]}' \
    > test.out 2>&1
eval_tap $? 111 'AdminBulkGetContentByIDsV2' test.out

#- 112 AdminGetContentBulkByShareCodesV2
./ng net.accelbyte.sdk.cli.Main ugc adminGetContentBulkByShareCodesV2 \
    --namespace "$AB_NAMESPACE" \
    --body '{"shareCodes": ["eE7DY3b4", "F4t54wGu", "ewmZsB5n"]}' \
    > test.out 2>&1
eval_tap $? 112 'AdminGetContentBulkByShareCodesV2' test.out

#- 113 AdminGetContentByShareCodeV2
./ng net.accelbyte.sdk.cli.Main ugc adminGetContentByShareCodeV2 \
    --namespace "$AB_NAMESPACE" \
    --shareCode 'sATZBP4l' \
    > test.out 2>&1
eval_tap $? 113 'AdminGetContentByShareCodeV2' test.out

#- 114 AdminGetContentByContentIDV2
./ng net.accelbyte.sdk.cli.Main ugc adminGetContentByContentIDV2 \
    --contentId 'SmToblq8' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 114 'AdminGetContentByContentIDV2' test.out

#- 115 RollbackContentVersionV2
./ng net.accelbyte.sdk.cli.Main ugc rollbackContentVersionV2 \
    --contentId 'vIKpOuNX' \
    --namespace "$AB_NAMESPACE" \
    --versionId 'CUkbKp62' \
    > test.out 2>&1
eval_tap $? 115 'RollbackContentVersionV2' test.out

#- 116 AdminUpdateScreenshotsV2
./ng net.accelbyte.sdk.cli.Main ugc adminUpdateScreenshotsV2 \
    --contentId 'fHT2K2A1' \
    --namespace "$AB_NAMESPACE" \
    --body '{"screenshots": [{"description": "6YAnwVhE", "screenshotId": "IcoJI3Pe"}, {"description": "tlPg3U1h", "screenshotId": "NB9J8Akh"}, {"description": "le7AnQ0r", "screenshotId": "aLLFcqrL"}]}' \
    > test.out 2>&1
eval_tap $? 116 'AdminUpdateScreenshotsV2' test.out

#- 117 AdminUploadContentScreenshotV2
./ng net.accelbyte.sdk.cli.Main ugc adminUploadContentScreenshotV2 \
    --contentId 'xqM3jkJ2' \
    --namespace "$AB_NAMESPACE" \
    --body '{"screenshots": [{"contentType": "7fx74iFI", "description": "i42TztyC", "fileExtension": "png"}, {"contentType": "PlBp42KZ", "description": "PEEWfqcA", "fileExtension": "jpg"}, {"contentType": "0kfeCGwU", "description": "4IJMFRD8", "fileExtension": "jpg"}]}' \
    > test.out 2>&1
eval_tap $? 117 'AdminUploadContentScreenshotV2' test.out

#- 118 AdminDeleteContentScreenshotV2
./ng net.accelbyte.sdk.cli.Main ugc adminDeleteContentScreenshotV2 \
    --contentId 'fY06gaPW' \
    --namespace "$AB_NAMESPACE" \
    --screenshotId 'A28ZQixQ' \
    > test.out 2>&1
eval_tap $? 118 'AdminDeleteContentScreenshotV2' test.out

#- 119 ListContentVersionsV2
./ng net.accelbyte.sdk.cli.Main ugc listContentVersionsV2 \
    --contentId 'YHQJ9Lb4' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 119 'ListContentVersionsV2' test.out

#- 120 AdminGetOfficialGroupContentsV2
./ng net.accelbyte.sdk.cli.Main ugc adminGetOfficialGroupContentsV2 \
    --groupId 'OYkgpfQI' \
    --namespace "$AB_NAMESPACE" \
    --limit '76' \
    --offset '67' \
    > test.out 2>&1
eval_tap $? 120 'AdminGetOfficialGroupContentsV2' test.out

#- 121 AdminListStagingContents
./ng net.accelbyte.sdk.cli.Main ugc adminListStagingContents \
    --namespace "$AB_NAMESPACE" \
    --limit '16' \
    --offset '77' \
    --sortBy 'Qr0kQwk4' \
    --status 'QDXPd7I9' \
    > test.out 2>&1
eval_tap $? 121 'AdminListStagingContents' test.out

#- 122 AdminGetStagingContentByID
./ng net.accelbyte.sdk.cli.Main ugc adminGetStagingContentByID \
    --contentId 'OsFGffcG' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 122 'AdminGetStagingContentByID' test.out

#- 123 AdminApproveStagingContent
./ng net.accelbyte.sdk.cli.Main ugc adminApproveStagingContent \
    --contentId '127P2ane' \
    --namespace "$AB_NAMESPACE" \
    --body '{"approved": false, "note": "JbiILbYu"}' \
    > test.out 2>&1
eval_tap $? 123 'AdminApproveStagingContent' test.out

#- 124 AdminUpdateContentByShareCodeV2
./ng net.accelbyte.sdk.cli.Main ugc adminUpdateContentByShareCodeV2 \
    --channelId 'SN0x86hZ' \
    --namespace "$AB_NAMESPACE" \
    --shareCode 'QTA0lPMN' \
    --userId 'wEpi3Nbl' \
    --body '{"customAttributes": {"splyCvwp": {}, "jBzcgO9f": {}, "SRhoKjLz": {}}, "name": "607cp8Dd", "shareCode": "jBtv09nc", "subType": "kKZOak8H", "tags": ["1JbihwTD", "ngu66uJs", "D99YTpN3"], "type": "UM9EjwKb"}' \
    > test.out 2>&1
eval_tap $? 124 'AdminUpdateContentByShareCodeV2' test.out

#- 125 AdminDeleteContentByShareCodeV2
./ng net.accelbyte.sdk.cli.Main ugc adminDeleteContentByShareCodeV2 \
    --channelId 'N2tANSlF' \
    --namespace "$AB_NAMESPACE" \
    --shareCode 'gkUd7s3u' \
    --userId 'utidcC1t' \
    > test.out 2>&1
eval_tap $? 125 'AdminDeleteContentByShareCodeV2' test.out

#- 126 AdminDeleteUserContentV2
./ng net.accelbyte.sdk.cli.Main ugc adminDeleteUserContentV2 \
    --channelId 'yKytvGiX' \
    --contentId 'zN6DGsBZ' \
    --namespace "$AB_NAMESPACE" \
    --userId 'Uevr6tSo' \
    > test.out 2>&1
eval_tap $? 126 'AdminDeleteUserContentV2' test.out

#- 127 AdminUpdateUserContentV2
./ng net.accelbyte.sdk.cli.Main ugc adminUpdateUserContentV2 \
    --channelId '1Cef0QH6' \
    --contentId 'QvR9qf8W' \
    --namespace "$AB_NAMESPACE" \
    --userId 'dRABCDo6' \
    --body '{"customAttributes": {"Rbv4MjH4": {}, "TJ1UkZOF": {}, "axZdrfgV": {}}, "name": "o3sa9p0g", "shareCode": "7ds6S08k", "subType": "2z7szJIB", "tags": ["g7eZ8SF4", "oEcGtcYy", "Tqf6ZVFe"], "type": "iHpMgVSE"}' \
    > test.out 2>&1
eval_tap $? 127 'AdminUpdateUserContentV2' test.out

#- 128 AdminUpdateUserContentFileLocation
./ng net.accelbyte.sdk.cli.Main ugc adminUpdateUserContentFileLocation \
    --channelId 'Mj58Lyzx' \
    --contentId 'ISFLcAYh' \
    --namespace "$AB_NAMESPACE" \
    --userId '9ZqsS9qa' \
    --body '{"fileExtension": "AsRDsuHE", "fileLocation": "fgt8lhS9"}' \
    > test.out 2>&1
eval_tap $? 128 'AdminUpdateUserContentFileLocation' test.out

#- 129 AdminGenerateUserContentUploadURLV2
./ng net.accelbyte.sdk.cli.Main ugc adminGenerateUserContentUploadURLV2 \
    --channelId 'pdm0RUwH' \
    --contentId '6MqMSMKP' \
    --namespace "$AB_NAMESPACE" \
    --userId 'UL70mFjw' \
    --body '{"contentType": "BqpXpVMj", "fileExtension": "HmKG7Ksu"}' \
    > test.out 2>&1
eval_tap $? 129 'AdminGenerateUserContentUploadURLV2' test.out

#- 130 AdminGetContentByUserIDV2
./ng net.accelbyte.sdk.cli.Main ugc adminGetContentByUserIDV2 \
    --namespace "$AB_NAMESPACE" \
    --userId '9gmauOlk' \
    --limit '5' \
    --offset '66' \
    --sortBy '1MzBqnY5' \
    > test.out 2>&1
eval_tap $? 130 'AdminGetContentByUserIDV2' test.out

#- 131 AdminUpdateContentHideStatusV2
./ng net.accelbyte.sdk.cli.Main ugc adminUpdateContentHideStatusV2 \
    --contentId 'FjZnjnic' \
    --namespace "$AB_NAMESPACE" \
    --userId 'vkrrqQPH' \
    --body '{"isHidden": false}' \
    > test.out 2>&1
eval_tap $? 131 'AdminUpdateContentHideStatusV2' test.out

#- 132 AdminGetUserGroupContentsV2
./ng net.accelbyte.sdk.cli.Main ugc adminGetUserGroupContentsV2 \
    --groupId 'tUSVcbpt' \
    --namespace "$AB_NAMESPACE" \
    --userId 'UFEUtIKd' \
    --limit '41' \
    --offset '3' \
    > test.out 2>&1
eval_tap $? 132 'AdminGetUserGroupContentsV2' test.out

#- 133 AdminListUserStagingContents
./ng net.accelbyte.sdk.cli.Main ugc adminListUserStagingContents \
    --namespace "$AB_NAMESPACE" \
    --userId 't7LullPp' \
    --limit '74' \
    --offset '88' \
    --sortBy '064G2Tls' \
    --status 'o07VwjRe' \
    > test.out 2>&1
eval_tap $? 133 'AdminListUserStagingContents' test.out

#- 134 PublicGetContentByChannelIDV2
./ng net.accelbyte.sdk.cli.Main ugc publicGetContentByChannelIDV2 \
    --channelId '31VnpJwa' \
    --namespace "$AB_NAMESPACE" \
    --limit '70' \
    --name '0GxVmuCV' \
    --offset '33' \
    --sortBy '56IrSRmP' \
    > test.out 2>&1
eval_tap $? 134 'PublicGetContentByChannelIDV2' test.out

#- 135 PublicListContentV2
./ng net.accelbyte.sdk.cli.Main ugc publicListContentV2 \
    --namespace "$AB_NAMESPACE" \
    --isOfficial  \
    --limit '59' \
    --name 'XgMJPHli' \
    --offset '23' \
    --sortBy 'NV1CPhiA' \
    --subType 'rApAo9eT' \
    --tags 'nyEZGpaa,EwyXJ9JX,anY7iTWh' \
    --type 'paHBZk0Z' \
    > test.out 2>&1
eval_tap $? 135 'PublicListContentV2' test.out

#- 136 PublicBulkGetContentByIDV2
./ng net.accelbyte.sdk.cli.Main ugc publicBulkGetContentByIDV2 \
    --namespace "$AB_NAMESPACE" \
    --body '{"contentIds": ["OyyH9DY8", "9bmSXHIS", "TiX3bTPZ"]}' \
    > test.out 2>&1
eval_tap $? 136 'PublicBulkGetContentByIDV2' test.out

#- 137 PublicGetContentBulkByShareCodesV2
./ng net.accelbyte.sdk.cli.Main ugc publicGetContentBulkByShareCodesV2 \
    --namespace "$AB_NAMESPACE" \
    --body '{"shareCodes": ["mmkHBG1U", "wdaCIyWw", "b6XdqhMm"]}' \
    > test.out 2>&1
eval_tap $? 137 'PublicGetContentBulkByShareCodesV2' test.out

#- 138 PublicGetContentByShareCodeV2
./ng net.accelbyte.sdk.cli.Main ugc publicGetContentByShareCodeV2 \
    --namespace "$AB_NAMESPACE" \
    --shareCode 'hO2ntKh1' \
    > test.out 2>&1
eval_tap $? 138 'PublicGetContentByShareCodeV2' test.out

#- 139 PublicGetContentByIDV2
./ng net.accelbyte.sdk.cli.Main ugc publicGetContentByIDV2 \
    --contentId '5AA6QVeC' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 139 'PublicGetContentByIDV2' test.out

#- 140 PublicAddDownloadCountV2
./ng net.accelbyte.sdk.cli.Main ugc publicAddDownloadCountV2 \
    --contentId 'RZXc34Xl' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 140 'PublicAddDownloadCountV2' test.out

#- 141 PublicListContentDownloaderV2
./ng net.accelbyte.sdk.cli.Main ugc publicListContentDownloaderV2 \
    --contentId 'IEcdEu2L' \
    --namespace "$AB_NAMESPACE" \
    --limit '57' \
    --offset '58' \
    --sortBy '0vrFx5bj' \
    --userId '4dy8fvi1' \
    > test.out 2>&1
eval_tap $? 141 'PublicListContentDownloaderV2' test.out

#- 142 PublicListContentLikeV2
./ng net.accelbyte.sdk.cli.Main ugc publicListContentLikeV2 \
    --contentId 'CBS4Vajr' \
    --namespace "$AB_NAMESPACE" \
    --limit '73' \
    --offset '62' \
    --sortBy 'G9DXlRcR' \
    > test.out 2>&1
eval_tap $? 142 'PublicListContentLikeV2' test.out

#- 143 UpdateContentLikeStatusV2
./ng net.accelbyte.sdk.cli.Main ugc updateContentLikeStatusV2 \
    --contentId 'mXM2ZPn2' \
    --namespace "$AB_NAMESPACE" \
    --body '{"likeStatus": false}' \
    > test.out 2>&1
eval_tap $? 143 'UpdateContentLikeStatusV2' test.out

#- 144 PublicCreateContentV2
./ng net.accelbyte.sdk.cli.Main ugc publicCreateContentV2 \
    --channelId 'N3UXybBL' \
    --namespace "$AB_NAMESPACE" \
    --userId 'EK7UQZcZ' \
    --body '{"contentType": "uezWccJt", "customAttributes": {"m0xvFLEG": {}, "qZ6ibVDr": {}, "HyDmsswR": {}}, "fileExtension": "bYVINj3l", "name": "Sbr2F3Cj", "subType": "n2nFv1V6", "tags": ["tVTpUA1t", "3MaQuaYl", "c9rfpbvg"], "type": "8Ww3nFzy"}' \
    > test.out 2>&1
eval_tap $? 144 'PublicCreateContentV2' test.out

#- 145 PublicUpdateContentByShareCodeV2
./ng net.accelbyte.sdk.cli.Main ugc publicUpdateContentByShareCodeV2 \
    --channelId 'PD3bBXxb' \
    --namespace "$AB_NAMESPACE" \
    --shareCode 'bYZN8dT5' \
    --userId 'WyZvd6aE' \
    --body '{"customAttributes": {"pSeVUGUa": {}, "VFVUReB9": {}, "8Egv1ViI": {}}, "name": "ZkSnMf7g", "subType": "ARaCp1jr", "tags": ["OGI3D0wK", "wAOeQs3u", "O3l4Wvhp"], "type": "JF3WGbeQ"}' \
    > test.out 2>&1
eval_tap $? 145 'PublicUpdateContentByShareCodeV2' test.out

#- 146 PublicDeleteContentByShareCodeV2
./ng net.accelbyte.sdk.cli.Main ugc publicDeleteContentByShareCodeV2 \
    --channelId '9xZQCG5X' \
    --namespace "$AB_NAMESPACE" \
    --shareCode 'J8zqZw38' \
    --userId 'lkfueWkQ' \
    > test.out 2>&1
eval_tap $? 146 'PublicDeleteContentByShareCodeV2' test.out

#- 147 PublicDeleteContentV2
./ng net.accelbyte.sdk.cli.Main ugc publicDeleteContentV2 \
    --channelId 'zmlOcfDn' \
    --contentId 'AvxQFXQe' \
    --namespace "$AB_NAMESPACE" \
    --userId 'IATYba70' \
    > test.out 2>&1
eval_tap $? 147 'PublicDeleteContentV2' test.out

#- 148 PublicUpdateContentV2
./ng net.accelbyte.sdk.cli.Main ugc publicUpdateContentV2 \
    --channelId '4tHsMG85' \
    --contentId '0VIR9e0t' \
    --namespace "$AB_NAMESPACE" \
    --userId 'Ewn4KbZk' \
    --body '{"customAttributes": {"95UAKgrq": {}, "47bDYt2L": {}, "Oa3hzKqx": {}}, "name": "18htGvLo", "subType": "By55bTz0", "tags": ["qPbXuKZr", "BHdGCqxA", "cgLyHV6N"], "type": "aAmQBzK5"}' \
    > test.out 2>&1
eval_tap $? 148 'PublicUpdateContentV2' test.out

#- 149 PublicUpdateContentFileLocation
./ng net.accelbyte.sdk.cli.Main ugc publicUpdateContentFileLocation \
    --channelId 'U6Xjx8kx' \
    --contentId 'SzUQe1X2' \
    --namespace "$AB_NAMESPACE" \
    --userId '0TEFNZbl' \
    --body '{"fileExtension": "mv6E998r", "fileLocation": "KxkHLo7x"}' \
    > test.out 2>&1
eval_tap $? 149 'PublicUpdateContentFileLocation' test.out

#- 150 UpdateContentShareCodeV2
./ng net.accelbyte.sdk.cli.Main ugc updateContentShareCodeV2 \
    --channelId '4F0H8mNH' \
    --contentId 'gCWx9Hxe' \
    --namespace "$AB_NAMESPACE" \
    --userId 'oWGxmJqA' \
    --body '{"shareCode": "QzkGR2eJ"}' \
    > test.out 2>&1
eval_tap $? 150 'UpdateContentShareCodeV2' test.out

#- 151 PublicGenerateContentUploadURLV2
./ng net.accelbyte.sdk.cli.Main ugc publicGenerateContentUploadURLV2 \
    --channelId 'APrUVPXB' \
    --contentId '6AZIizEw' \
    --namespace "$AB_NAMESPACE" \
    --userId 'xuwNK35l' \
    --body '{"contentType": "qg75bc4F", "fileExtension": "USOoXagp"}' \
    > test.out 2>&1
eval_tap $? 151 'PublicGenerateContentUploadURLV2' test.out

#- 152 PublicGetContentByUserIDV2
./ng net.accelbyte.sdk.cli.Main ugc publicGetContentByUserIDV2 \
    --namespace "$AB_NAMESPACE" \
    --userId 'pcFZ6snS' \
    --limit '91' \
    --offset '22' \
    --sortBy 'Nwm0Qjd0' \
    > test.out 2>&1
eval_tap $? 152 'PublicGetContentByUserIDV2' test.out

#- 153 UpdateScreenshotsV2
./ng net.accelbyte.sdk.cli.Main ugc updateScreenshotsV2 \
    --contentId 'F8IcFWaI' \
    --namespace "$AB_NAMESPACE" \
    --userId 'JkODwIEz' \
    --body '{"screenshots": [{"description": "hpHhqRh7", "screenshotId": "EoT7HXpn"}, {"description": "NsOtPQOw", "screenshotId": "70ksLMp5"}, {"description": "vTa0sIKY", "screenshotId": "g67ihbi2"}]}' \
    > test.out 2>&1
eval_tap $? 153 'UpdateScreenshotsV2' test.out

#- 154 UploadContentScreenshotV2
./ng net.accelbyte.sdk.cli.Main ugc uploadContentScreenshotV2 \
    --contentId 'uCkJDZ9L' \
    --namespace "$AB_NAMESPACE" \
    --userId 'u8ZUVQhF' \
    --body '{"screenshots": [{"contentType": "wCckCt2R", "description": "yz3q47sl", "fileExtension": "pjp"}, {"contentType": "07mmR9nM", "description": "jJhnxt9d", "fileExtension": "bmp"}, {"contentType": "AvSjUA7O", "description": "tKmXWk77", "fileExtension": "jpeg"}]}' \
    > test.out 2>&1
eval_tap $? 154 'UploadContentScreenshotV2' test.out

#- 155 DeleteContentScreenshotV2
./ng net.accelbyte.sdk.cli.Main ugc deleteContentScreenshotV2 \
    --contentId 'lvhwayki' \
    --namespace "$AB_NAMESPACE" \
    --screenshotId 'ulxKs3kU' \
    --userId 'HyjCjbp6' \
    > test.out 2>&1
eval_tap $? 155 'DeleteContentScreenshotV2' test.out

#- 156 PublicGetGroupContentsV2
./ng net.accelbyte.sdk.cli.Main ugc publicGetGroupContentsV2 \
    --groupId '9hW9ldPS' \
    --namespace "$AB_NAMESPACE" \
    --userId 'HR24FTmp' \
    --limit '85' \
    --offset '31' \
    > test.out 2>&1
eval_tap $? 156 'PublicGetGroupContentsV2' test.out

#- 157 ListUserStagingContents
./ng net.accelbyte.sdk.cli.Main ugc listUserStagingContents \
    --namespace "$AB_NAMESPACE" \
    --userId 'TtFpYhXJ' \
    --limit '73' \
    --offset '3' \
    --sortBy 'Dg8VGf7U' \
    --status '0xKXqPMT' \
    > test.out 2>&1
eval_tap $? 157 'ListUserStagingContents' test.out

#- 158 GetUserStagingContentByID
./ng net.accelbyte.sdk.cli.Main ugc getUserStagingContentByID \
    --contentId 'dFukmZK4' \
    --namespace "$AB_NAMESPACE" \
    --userId 'loIxL9WV' \
    > test.out 2>&1
eval_tap $? 158 'GetUserStagingContentByID' test.out

#- 159 UpdateStagingContent
./ng net.accelbyte.sdk.cli.Main ugc updateStagingContent \
    --contentId '34ukds5a' \
    --namespace "$AB_NAMESPACE" \
    --userId 'rgBE7ULx' \
    --body '{"fileExtension": "kypDtRk2", "fileLocation": "154Kd6JO"}' \
    > test.out 2>&1
eval_tap $? 159 'UpdateStagingContent' test.out

#- 160 DeleteUserStagingContentByID
./ng net.accelbyte.sdk.cli.Main ugc deleteUserStagingContentByID \
    --contentId '35748eNg' \
    --namespace "$AB_NAMESPACE" \
    --userId 'hu87nELd' \
    > test.out 2>&1
eval_tap $? 160 'DeleteUserStagingContentByID' test.out


rm -f "tmp.dat"

exit $EXIT_CODE