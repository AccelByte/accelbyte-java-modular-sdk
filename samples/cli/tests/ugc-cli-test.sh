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
    --limit '47' \
    --offset '87' \
    > test.out 2>&1
eval_tap $? 2 'SingleAdminGetChannel' test.out

#- 3 AdminCreateChannel
./ng net.accelbyte.sdk.cli.Main ugc adminCreateChannel \
    --namespace "$AB_NAMESPACE" \
    --body '{"id": "GKLkIvSu", "name": "xw9pXB6w"}' \
    > test.out 2>&1
eval_tap $? 3 'AdminCreateChannel' test.out

#- 4 SingleAdminUpdateChannel
./ng net.accelbyte.sdk.cli.Main ugc singleAdminUpdateChannel \
    --channelId 'eKxfSCON' \
    --namespace "$AB_NAMESPACE" \
    --body '{"name": "Ww9qjO06"}' \
    > test.out 2>&1
eval_tap $? 4 'SingleAdminUpdateChannel' test.out

#- 5 SingleAdminDeleteChannel
./ng net.accelbyte.sdk.cli.Main ugc singleAdminDeleteChannel \
    --channelId 'BZa5rKoB' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 5 'SingleAdminDeleteChannel' test.out

#- 6 AdminUploadContentDirect
eval_tap 0 6 'AdminUploadContentDirect # SKIP deprecated' test.out

#- 7 AdminUploadContentS3
./ng net.accelbyte.sdk.cli.Main ugc adminUploadContentS3 \
    --channelId '3V4Q8xDY' \
    --namespace "$AB_NAMESPACE" \
    --body '{"contentType": "yDNJaCmM", "customAttributes": {"CxJaliFy": {}, "4as0EC9q": {}, "T7At7W15": {}}, "fileExtension": "Pv4xGx0S", "name": "5nuAsXDs", "preview": "TUOrpYsA", "previewMetadata": {"previewContentType": "uQssDQJ0", "previewFileExtension": "ihMLkDj7"}, "shareCode": "oqWC0Nc5", "subType": "2Idp36KV", "tags": ["fI9D2SCo", "JwdKoAnb", "r5at9y7h"], "type": "FUF5DvwN"}' \
    > test.out 2>&1
eval_tap $? 7 'AdminUploadContentS3' test.out

#- 8 SingleAdminUpdateContentS3
./ng net.accelbyte.sdk.cli.Main ugc singleAdminUpdateContentS3 \
    --channelId '86iS2PxS' \
    --contentId 'xLH2ekud' \
    --namespace "$AB_NAMESPACE" \
    --body '{"contentType": "c5xQZS1b", "customAttributes": {"XyjvnIZQ": {}, "b1bKaxpK": {}, "5fc7mUpt": {}}, "fileExtension": "eZMqWqB3", "name": "R5K9xMuV", "payload": "LzFKihvb", "preview": "lmkUaSYE", "previewMetadata": {"previewContentType": "OvdFCqLq", "previewFileExtension": "HQjHo9Pr"}, "shareCode": "YkbxyPcJ", "subType": "YPuL9zg5", "tags": ["DLIYM4Pt", "zHOkuapM", "IfDtlQ46"], "type": "h4XoHcdi", "updateContentFile": false}' \
    > test.out 2>&1
eval_tap $? 8 'SingleAdminUpdateContentS3' test.out

#- 9 AdminSearchChannelSpecificContent
./ng net.accelbyte.sdk.cli.Main ugc adminSearchChannelSpecificContent \
    --channelId 'VPj4hja2' \
    --namespace "$AB_NAMESPACE" \
    --creator '5YHT0N92' \
    --ishidden 'A4hV6sAz' \
    --isofficial '8hmXmb1p' \
    --limit '53' \
    --name 'MLjP4uFY' \
    --offset '71' \
    --orderby 'S0u8tS1V' \
    --sortby 'cU8zhqde' \
    --subtype '4YdhxkiW' \
    --tags 'cVkDO6qX,d4FhjSy0,szMfypmQ' \
    --type 'uJ9l3Spv' \
    --userId 'eOsCBuQ6' \
    > test.out 2>&1
eval_tap $? 9 'AdminSearchChannelSpecificContent' test.out

#- 10 SingleAdminUpdateContentDirect
eval_tap 0 10 'SingleAdminUpdateContentDirect # SKIP deprecated' test.out

#- 11 SingleAdminDeleteContent
./ng net.accelbyte.sdk.cli.Main ugc singleAdminDeleteContent \
    --channelId '1lXmbBcS' \
    --contentId '6FZ3NrlF' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 11 'SingleAdminDeleteContent' test.out

#- 12 SingleAdminGetContent
./ng net.accelbyte.sdk.cli.Main ugc singleAdminGetContent \
    --namespace "$AB_NAMESPACE" \
    --limit '20' \
    --offset '37' \
    > test.out 2>&1
eval_tap $? 12 'SingleAdminGetContent' test.out

#- 13 AdminGetContentBulk
./ng net.accelbyte.sdk.cli.Main ugc adminGetContentBulk \
    --namespace "$AB_NAMESPACE" \
    --body '{"contentIds": ["f6R5VT2N", "4t7uAI0G", "DdMZNqDH"]}' \
    > test.out 2>&1
eval_tap $? 13 'AdminGetContentBulk' test.out

#- 14 AdminSearchContent
./ng net.accelbyte.sdk.cli.Main ugc adminSearchContent \
    --namespace "$AB_NAMESPACE" \
    --creator 'fwc7x4pE' \
    --ishidden 'zKIuMY33' \
    --isofficial 'kdIZCJRS' \
    --limit '99' \
    --name 'bsiZqL3D' \
    --offset '68' \
    --orderby '28kivJh0' \
    --sortby 'jogYuPqn' \
    --subtype 'RdkK7BHa' \
    --tags 'Tjitr5vC,YjNwdwjf,RURLmQQP' \
    --type 'DmNv3mRj' \
    --userId 'E0jDEoxd' \
    > test.out 2>&1
eval_tap $? 14 'AdminSearchContent' test.out

#- 15 AdminGetContentBulkByShareCodes
./ng net.accelbyte.sdk.cli.Main ugc adminGetContentBulkByShareCodes \
    --namespace "$AB_NAMESPACE" \
    --body '{"shareCodes": ["WXTgpncW", "49to8gzX", "6OsjhbyX"]}' \
    > test.out 2>&1
eval_tap $? 15 'AdminGetContentBulkByShareCodes' test.out

#- 16 AdminGetUserContentByShareCode
./ng net.accelbyte.sdk.cli.Main ugc adminGetUserContentByShareCode \
    --namespace "$AB_NAMESPACE" \
    --shareCode 'Ej1uu5XD' \
    > test.out 2>&1
eval_tap $? 16 'AdminGetUserContentByShareCode' test.out

#- 17 AdminGetSpecificContent
./ng net.accelbyte.sdk.cli.Main ugc adminGetSpecificContent \
    --contentId 'UAkR7zWF' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 17 'AdminGetSpecificContent' test.out

#- 18 AdminDownloadContentPreview
./ng net.accelbyte.sdk.cli.Main ugc adminDownloadContentPreview \
    --contentId 'NKg4NBpG' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 18 'AdminDownloadContentPreview' test.out

#- 19 RollbackContentVersion
./ng net.accelbyte.sdk.cli.Main ugc rollbackContentVersion \
    --contentId 'zzGFLT7t' \
    --namespace "$AB_NAMESPACE" \
    --versionId 'NBrGVxqz' \
    > test.out 2>&1
eval_tap $? 19 'RollbackContentVersion' test.out

#- 20 AdminUpdateScreenshots
./ng net.accelbyte.sdk.cli.Main ugc adminUpdateScreenshots \
    --contentId 'mOvJLip7' \
    --namespace "$AB_NAMESPACE" \
    --body '{"screenshots": [{"description": "GOwaPP7m", "screenshotId": "Mggk5Kg3"}, {"description": "4BmwRnJ9", "screenshotId": "Gn6T4nRj"}, {"description": "bYrlewD7", "screenshotId": "F7iPF8W9"}]}' \
    > test.out 2>&1
eval_tap $? 20 'AdminUpdateScreenshots' test.out

#- 21 AdminUploadContentScreenshot
./ng net.accelbyte.sdk.cli.Main ugc adminUploadContentScreenshot \
    --contentId 'WQKBg87y' \
    --namespace "$AB_NAMESPACE" \
    --body '{"screenshots": [{"contentType": "4MPI9xx1", "description": "09RdmOXg", "fileExtension": "png"}, {"contentType": "81bFK11Z", "description": "3pKgBWmm", "fileExtension": "jfif"}, {"contentType": "03s1UBPy", "description": "xjc2b5kh", "fileExtension": "jfif"}]}' \
    > test.out 2>&1
eval_tap $? 21 'AdminUploadContentScreenshot' test.out

#- 22 AdminDeleteContentScreenshot
./ng net.accelbyte.sdk.cli.Main ugc adminDeleteContentScreenshot \
    --contentId 'CRzN2M0p' \
    --namespace "$AB_NAMESPACE" \
    --screenshotId 'Lr9P1KPr' \
    > test.out 2>&1
eval_tap $? 22 'AdminDeleteContentScreenshot' test.out

#- 23 ListContentVersions
./ng net.accelbyte.sdk.cli.Main ugc listContentVersions \
    --contentId 'v37Bz6GW' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 23 'ListContentVersions' test.out

#- 24 SingleAdminGetAllGroups
./ng net.accelbyte.sdk.cli.Main ugc singleAdminGetAllGroups \
    --namespace "$AB_NAMESPACE" \
    --limit '44' \
    --offset '1' \
    > test.out 2>&1
eval_tap $? 24 'SingleAdminGetAllGroups' test.out

#- 25 AdminCreateGroup
./ng net.accelbyte.sdk.cli.Main ugc adminCreateGroup \
    --namespace "$AB_NAMESPACE" \
    --body '{"contents": ["jx2WisXb", "7JipXKAd", "PTrjfHWu"], "name": "DqTJ3NfR"}' \
    > test.out 2>&1
eval_tap $? 25 'AdminCreateGroup' test.out

#- 26 SingleAdminGetGroup
./ng net.accelbyte.sdk.cli.Main ugc singleAdminGetGroup \
    --groupId 'bRSd170A' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 26 'SingleAdminGetGroup' test.out

#- 27 SingleAdminUpdateGroup
./ng net.accelbyte.sdk.cli.Main ugc singleAdminUpdateGroup \
    --groupId 'CQxZ0Efh' \
    --namespace "$AB_NAMESPACE" \
    --body '{"contents": ["tTFSd5uJ", "KbDwStan", "gZ70TIQQ"], "name": "KwVH07nM"}' \
    > test.out 2>&1
eval_tap $? 27 'SingleAdminUpdateGroup' test.out

#- 28 SingleAdminDeleteGroup
./ng net.accelbyte.sdk.cli.Main ugc singleAdminDeleteGroup \
    --groupId 'HfEc4K61' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 28 'SingleAdminDeleteGroup' test.out

#- 29 SingleAdminGetGroupContents
./ng net.accelbyte.sdk.cli.Main ugc singleAdminGetGroupContents \
    --groupId 'kA5OD8Yn' \
    --namespace "$AB_NAMESPACE" \
    --limit '10' \
    --offset '59' \
    > test.out 2>&1
eval_tap $? 29 'SingleAdminGetGroupContents' test.out

#- 30 AdminGetTag
./ng net.accelbyte.sdk.cli.Main ugc adminGetTag \
    --namespace "$AB_NAMESPACE" \
    --limit '36' \
    --offset '64' \
    > test.out 2>&1
eval_tap $? 30 'AdminGetTag' test.out

#- 31 AdminCreateTag
./ng net.accelbyte.sdk.cli.Main ugc adminCreateTag \
    --namespace "$AB_NAMESPACE" \
    --body '{"tag": "jcxGI6t1"}' \
    > test.out 2>&1
eval_tap $? 31 'AdminCreateTag' test.out

#- 32 AdminUpdateTag
./ng net.accelbyte.sdk.cli.Main ugc adminUpdateTag \
    --namespace "$AB_NAMESPACE" \
    --tagId 'MkeTkhV5' \
    --body '{"tag": "8Am8ECiT"}' \
    > test.out 2>&1
eval_tap $? 32 'AdminUpdateTag' test.out

#- 33 AdminDeleteTag
./ng net.accelbyte.sdk.cli.Main ugc adminDeleteTag \
    --namespace "$AB_NAMESPACE" \
    --tagId 'ilkVo4QW' \
    > test.out 2>&1
eval_tap $? 33 'AdminDeleteTag' test.out

#- 34 AdminGetType
./ng net.accelbyte.sdk.cli.Main ugc adminGetType \
    --namespace "$AB_NAMESPACE" \
    --limit '1' \
    --offset '10' \
    > test.out 2>&1
eval_tap $? 34 'AdminGetType' test.out

#- 35 AdminCreateType
./ng net.accelbyte.sdk.cli.Main ugc adminCreateType \
    --namespace "$AB_NAMESPACE" \
    --body '{"subtype": ["S8ipbpjy", "wtV44WGW", "gmUH1YAN"], "type": "a7S3yBiD"}' \
    > test.out 2>&1
eval_tap $? 35 'AdminCreateType' test.out

#- 36 AdminUpdateType
./ng net.accelbyte.sdk.cli.Main ugc adminUpdateType \
    --namespace "$AB_NAMESPACE" \
    --typeId '6oW2lPtF' \
    --body '{"subtype": ["tgQxEXpy", "wd85ZQMI", "AypxZcIF"], "type": "rrhz4LbT"}' \
    > test.out 2>&1
eval_tap $? 36 'AdminUpdateType' test.out

#- 37 AdminDeleteType
./ng net.accelbyte.sdk.cli.Main ugc adminDeleteType \
    --namespace "$AB_NAMESPACE" \
    --typeId 'uYOaQByG' \
    > test.out 2>&1
eval_tap $? 37 'AdminDeleteType' test.out

#- 38 AdminGetChannel
./ng net.accelbyte.sdk.cli.Main ugc adminGetChannel \
    --namespace "$AB_NAMESPACE" \
    --userId 'Qi05kOW0' \
    --limit '43' \
    --name '6nt7bXno' \
    --offset '10' \
    > test.out 2>&1
eval_tap $? 38 'AdminGetChannel' test.out

#- 39 AdminDeleteAllUserChannels
./ng net.accelbyte.sdk.cli.Main ugc adminDeleteAllUserChannels \
    --namespace "$AB_NAMESPACE" \
    --userId 'ivjOwhPN' \
    > test.out 2>&1
eval_tap $? 39 'AdminDeleteAllUserChannels' test.out

#- 40 AdminUpdateChannel
./ng net.accelbyte.sdk.cli.Main ugc adminUpdateChannel \
    --channelId 'BCelZVaJ' \
    --namespace "$AB_NAMESPACE" \
    --userId '0j8lBFve' \
    --body '{"name": "RPz4Jx08"}' \
    > test.out 2>&1
eval_tap $? 40 'AdminUpdateChannel' test.out

#- 41 AdminDeleteChannel
./ng net.accelbyte.sdk.cli.Main ugc adminDeleteChannel \
    --channelId 'yGlQtx59' \
    --namespace "$AB_NAMESPACE" \
    --userId 'lVSNUh3q' \
    > test.out 2>&1
eval_tap $? 41 'AdminDeleteChannel' test.out

#- 42 AdminUpdateContentS3ByShareCode
./ng net.accelbyte.sdk.cli.Main ugc adminUpdateContentS3ByShareCode \
    --channelId 'pBD9Cz1A' \
    --namespace "$AB_NAMESPACE" \
    --shareCode 'f5pjXUsq' \
    --userId 'eoIekjqi' \
    --body '{"contentType": "hVHW8UWu", "customAttributes": {"TUbL6hoa": {}, "8LSx9i1n": {}, "g1I6lhx4": {}}, "fileExtension": "dJEtbxzZ", "name": "N07EtNDp", "payload": "42P82RH1", "preview": "R1iQyEvd", "previewMetadata": {"previewContentType": "yo9Q83ZX", "previewFileExtension": "MIbImJKI"}, "shareCode": "fNYLZT7F", "subType": "E2KpHsv7", "tags": ["DoTvAOn0", "R4Aa0QWg", "vxkLNPIs"], "type": "iJjDVNjM", "updateContentFile": false}' \
    > test.out 2>&1
eval_tap $? 42 'AdminUpdateContentS3ByShareCode' test.out

#- 43 AdminUpdateContentS3
./ng net.accelbyte.sdk.cli.Main ugc adminUpdateContentS3 \
    --channelId 'PrQzqwOm' \
    --contentId '4afX8S6s' \
    --namespace "$AB_NAMESPACE" \
    --userId 'sfUFOtll' \
    --body '{"contentType": "IJRqgnrX", "customAttributes": {"7mmMdlfq": {}, "6oiXoFmC": {}, "Z5jN4syT": {}}, "fileExtension": "chBQXjth", "name": "UYJOECTf", "payload": "MOXMnK0l", "preview": "Z7yrkMLc", "previewMetadata": {"previewContentType": "b7CsKtjx", "previewFileExtension": "4f00tM5B"}, "shareCode": "6QMyhcX9", "subType": "tzYxHwTq", "tags": ["58oRW33r", "zoE2Ri3Y", "dvlfQdw3"], "type": "fuqHSmqi", "updateContentFile": false}' \
    > test.out 2>&1
eval_tap $? 43 'AdminUpdateContentS3' test.out

#- 44 DeleteContentByShareCode
./ng net.accelbyte.sdk.cli.Main ugc deleteContentByShareCode \
    --channelId 'Xs4CmEmh' \
    --namespace "$AB_NAMESPACE" \
    --shareCode 'VSFDcyqN' \
    --userId '8kXHtL9F' \
    > test.out 2>&1
eval_tap $? 44 'DeleteContentByShareCode' test.out

#- 45 AdminUpdateContentDirect
eval_tap 0 45 'AdminUpdateContentDirect # SKIP deprecated' test.out

#- 46 AdminDeleteContent
./ng net.accelbyte.sdk.cli.Main ugc adminDeleteContent \
    --channelId 'kBoLoUMs' \
    --contentId 'Y2sfM9uQ' \
    --namespace "$AB_NAMESPACE" \
    --userId 'diC9yMuj' \
    > test.out 2>&1
eval_tap $? 46 'AdminDeleteContent' test.out

#- 47 AdminGetContent
./ng net.accelbyte.sdk.cli.Main ugc adminGetContent \
    --namespace "$AB_NAMESPACE" \
    --userId 'p2CeTOui' \
    --limit '24' \
    --offset '4' \
    > test.out 2>&1
eval_tap $? 47 'AdminGetContent' test.out

#- 48 AdminDeleteAllUserContents
./ng net.accelbyte.sdk.cli.Main ugc adminDeleteAllUserContents \
    --namespace "$AB_NAMESPACE" \
    --userId 'RbaZl8Nh' \
    > test.out 2>&1
eval_tap $? 48 'AdminDeleteAllUserContents' test.out

#- 49 AdminHideUserContent
./ng net.accelbyte.sdk.cli.Main ugc adminHideUserContent \
    --contentId 'jt1lwP09' \
    --namespace "$AB_NAMESPACE" \
    --userId 'f2gwYI9G' \
    --body '{"isHidden": false}' \
    > test.out 2>&1
eval_tap $? 49 'AdminHideUserContent' test.out

#- 50 AdminGetAllGroups
./ng net.accelbyte.sdk.cli.Main ugc adminGetAllGroups \
    --namespace "$AB_NAMESPACE" \
    --userId 'J8HnPHYN' \
    --limit '9' \
    --offset '66' \
    > test.out 2>&1
eval_tap $? 50 'AdminGetAllGroups' test.out

#- 51 AdminDeleteAllUserGroup
./ng net.accelbyte.sdk.cli.Main ugc adminDeleteAllUserGroup \
    --namespace "$AB_NAMESPACE" \
    --userId 'PvHsekH4' \
    > test.out 2>&1
eval_tap $? 51 'AdminDeleteAllUserGroup' test.out

#- 52 AdminGetGroup
./ng net.accelbyte.sdk.cli.Main ugc adminGetGroup \
    --groupId 'HqQf4pOQ' \
    --namespace "$AB_NAMESPACE" \
    --userId 'kgUvg7GS' \
    > test.out 2>&1
eval_tap $? 52 'AdminGetGroup' test.out

#- 53 AdminUpdateGroup
./ng net.accelbyte.sdk.cli.Main ugc adminUpdateGroup \
    --groupId 'TRYbqc4b' \
    --namespace "$AB_NAMESPACE" \
    --userId 'JcQ8YjmA' \
    --body '{"contents": ["Q6C9AZvr", "Ql9t4uXk", "lnRMzHcq"], "name": "KyNYr2bd"}' \
    > test.out 2>&1
eval_tap $? 53 'AdminUpdateGroup' test.out

#- 54 AdminDeleteGroup
./ng net.accelbyte.sdk.cli.Main ugc adminDeleteGroup \
    --groupId 'AKZkzede' \
    --namespace "$AB_NAMESPACE" \
    --userId '6C2dCA9v' \
    > test.out 2>&1
eval_tap $? 54 'AdminDeleteGroup' test.out

#- 55 AdminGetGroupContents
./ng net.accelbyte.sdk.cli.Main ugc adminGetGroupContents \
    --groupId 'pVoa68z4' \
    --namespace "$AB_NAMESPACE" \
    --userId 'ipayCFWR' \
    --limit '4' \
    --offset '99' \
    > test.out 2>&1
eval_tap $? 55 'AdminGetGroupContents' test.out

#- 56 AdminDeleteAllUserStates
./ng net.accelbyte.sdk.cli.Main ugc adminDeleteAllUserStates \
    --namespace "$AB_NAMESPACE" \
    --userId 'CkPq7Lqn' \
    > test.out 2>&1
eval_tap $? 56 'AdminDeleteAllUserStates' test.out

#- 57 SearchChannelSpecificContent
./ng net.accelbyte.sdk.cli.Main ugc searchChannelSpecificContent \
    --channelId 'R9kBCTSY' \
    --namespace "$AB_NAMESPACE" \
    --creator 'xXyMMaQz' \
    --ishidden 'AJtAK6VB' \
    --isofficial 'MuJR9Z8S' \
    --limit '74' \
    --name '7yxgFQ3K' \
    --offset '76' \
    --orderby 'i28HIY5R' \
    --sortby 'vwuFsWJF' \
    --subtype 'v1n8Z8KG' \
    --tags 'cTaxxIfz,Fsb9lkpJ,GIN8pcWI' \
    --type 'QoRrnNsH' \
    --userId '6TkG5GKf' \
    > test.out 2>&1
eval_tap $? 57 'SearchChannelSpecificContent' test.out

#- 58 PublicSearchContent
./ng net.accelbyte.sdk.cli.Main ugc publicSearchContent \
    --namespace "$AB_NAMESPACE" \
    --creator 'trkkxnCN' \
    --ishidden 'RskeJxhs' \
    --isofficial 'EN8vc1N6' \
    --limit '35' \
    --name 'Jdaqd4Ks' \
    --offset '93' \
    --orderby 'YgiN2pEw' \
    --sortby 'TRPMbwQ1' \
    --subtype 'xhUPwLRe' \
    --tags '9QYyKT0z,hRsOYfCw,10LyS00E' \
    --type 'RtLfLVtt' \
    --userId 'HuVUNTvF' \
    > test.out 2>&1
eval_tap $? 58 'PublicSearchContent' test.out

#- 59 PublicGetContentBulk
./ng net.accelbyte.sdk.cli.Main ugc publicGetContentBulk \
    --namespace "$AB_NAMESPACE" \
    --body '{"contentIds": ["Zdrow50q", "cfnNI5p3", "upQmQ2vd"]}' \
    > test.out 2>&1
eval_tap $? 59 'PublicGetContentBulk' test.out

#- 60 GetFollowedContent
./ng net.accelbyte.sdk.cli.Main ugc getFollowedContent \
    --namespace "$AB_NAMESPACE" \
    --limit '45' \
    --offset '13' \
    > test.out 2>&1
eval_tap $? 60 'GetFollowedContent' test.out

#- 61 GetLikedContent
./ng net.accelbyte.sdk.cli.Main ugc getLikedContent \
    --namespace "$AB_NAMESPACE" \
    --isofficial  \
    --limit '74' \
    --name '45z3TQfm' \
    --offset '75' \
    --orderby 'OSCr9cbb' \
    --sortby 'l1M1rNIP' \
    --subtype 'gmJV6QDu' \
    --tags 'nB61RMIG,BvaIh47q,FwOGVtfO' \
    --type 'aOqjMkSH' \
    > test.out 2>&1
eval_tap $? 61 'GetLikedContent' test.out

#- 62 PublicGetContentBulkByShareCodes
./ng net.accelbyte.sdk.cli.Main ugc publicGetContentBulkByShareCodes \
    --namespace "$AB_NAMESPACE" \
    --body '{"shareCodes": ["0gRXJohk", "7FhEzyq9", "yF1XgCl7"]}' \
    > test.out 2>&1
eval_tap $? 62 'PublicGetContentBulkByShareCodes' test.out

#- 63 PublicDownloadContentByShareCode
./ng net.accelbyte.sdk.cli.Main ugc publicDownloadContentByShareCode \
    --namespace "$AB_NAMESPACE" \
    --shareCode 'BM5zHd69' \
    > test.out 2>&1
eval_tap $? 63 'PublicDownloadContentByShareCode' test.out

#- 64 PublicDownloadContentByContentID
./ng net.accelbyte.sdk.cli.Main ugc publicDownloadContentByContentID \
    --contentId '5QJUUlvW' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 64 'PublicDownloadContentByContentID' test.out

#- 65 AddDownloadCount
./ng net.accelbyte.sdk.cli.Main ugc addDownloadCount \
    --contentId 'bXsjG9Ba' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 65 'AddDownloadCount' test.out

#- 66 UpdateContentLikeStatus
./ng net.accelbyte.sdk.cli.Main ugc updateContentLikeStatus \
    --contentId 'E0DF921J' \
    --namespace "$AB_NAMESPACE" \
    --body '{"likeStatus": false}' \
    > test.out 2>&1
eval_tap $? 66 'UpdateContentLikeStatus' test.out

#- 67 PublicDownloadContentPreview
./ng net.accelbyte.sdk.cli.Main ugc publicDownloadContentPreview \
    --contentId 'gxbMgQTM' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 67 'PublicDownloadContentPreview' test.out

#- 68 GetTag
./ng net.accelbyte.sdk.cli.Main ugc getTag \
    --namespace "$AB_NAMESPACE" \
    --limit '22' \
    --offset '0' \
    > test.out 2>&1
eval_tap $? 68 'GetTag' test.out

#- 69 GetType
./ng net.accelbyte.sdk.cli.Main ugc getType \
    --namespace "$AB_NAMESPACE" \
    --limit '46' \
    --offset '16' \
    > test.out 2>&1
eval_tap $? 69 'GetType' test.out

#- 70 PublicSearchCreator
./ng net.accelbyte.sdk.cli.Main ugc publicSearchCreator \
    --namespace "$AB_NAMESPACE" \
    --limit '79' \
    --offset '47' \
    --orderby 'NTShZhNU' \
    --sortby 'OpW6o0eb' \
    > test.out 2>&1
eval_tap $? 70 'PublicSearchCreator' test.out

#- 71 GetFollowedUsers
./ng net.accelbyte.sdk.cli.Main ugc getFollowedUsers \
    --namespace "$AB_NAMESPACE" \
    --limit '33' \
    --offset '6' \
    > test.out 2>&1
eval_tap $? 71 'GetFollowedUsers' test.out

#- 72 PublicGetCreator
./ng net.accelbyte.sdk.cli.Main ugc publicGetCreator \
    --namespace "$AB_NAMESPACE" \
    --userId 'r8ovHUxn' \
    > test.out 2>&1
eval_tap $? 72 'PublicGetCreator' test.out

#- 73 GetChannels
./ng net.accelbyte.sdk.cli.Main ugc getChannels \
    --namespace "$AB_NAMESPACE" \
    --userId 'BpuseYPM' \
    --limit '90' \
    --name 'yTaCzJoi' \
    --offset '43' \
    > test.out 2>&1
eval_tap $? 73 'GetChannels' test.out

#- 74 PublicCreateChannel
./ng net.accelbyte.sdk.cli.Main ugc publicCreateChannel \
    --namespace "$AB_NAMESPACE" \
    --userId 'HmIdcOLp' \
    --body '{"name": "4jVNCQWL"}' \
    > test.out 2>&1
eval_tap $? 74 'PublicCreateChannel' test.out

#- 75 DeleteAllUserChannel
./ng net.accelbyte.sdk.cli.Main ugc deleteAllUserChannel \
    --namespace "$AB_NAMESPACE" \
    --userId 'urxQ3rZ3' \
    > test.out 2>&1
eval_tap $? 75 'DeleteAllUserChannel' test.out

#- 76 UpdateChannel
./ng net.accelbyte.sdk.cli.Main ugc updateChannel \
    --channelId '6HIPP4dQ' \
    --namespace "$AB_NAMESPACE" \
    --userId 'CS0hIqZE' \
    --body '{"name": "I7Ur0nza"}' \
    > test.out 2>&1
eval_tap $? 76 'UpdateChannel' test.out

#- 77 DeleteChannel
./ng net.accelbyte.sdk.cli.Main ugc deleteChannel \
    --channelId 'L6do4lCQ' \
    --namespace "$AB_NAMESPACE" \
    --userId 'rMUCGHU3' \
    > test.out 2>&1
eval_tap $? 77 'DeleteChannel' test.out

#- 78 CreateContentDirect
eval_tap 0 78 'CreateContentDirect # SKIP deprecated' test.out

#- 79 CreateContentS3
./ng net.accelbyte.sdk.cli.Main ugc createContentS3 \
    --channelId 'ZCkQx2Nh' \
    --namespace "$AB_NAMESPACE" \
    --userId 'IJALleGr' \
    --body '{"contentType": "ChVvORT7", "customAttributes": {"le15wtzg": {}, "YDaCibKG": {}, "6pLGJsju": {}}, "fileExtension": "eTG57bw9", "name": "EPa28vWO", "preview": "PiiXYdR5", "previewMetadata": {"previewContentType": "mQqJnklg", "previewFileExtension": "9fLuCsUl"}, "subType": "DuxGUe7I", "tags": ["6v886QYr", "CFhCrrri", "iK6MdlML"], "type": "okomwKY7"}' \
    > test.out 2>&1
eval_tap $? 79 'CreateContentS3' test.out

#- 80 PublicUpdateContentByShareCode
./ng net.accelbyte.sdk.cli.Main ugc publicUpdateContentByShareCode \
    --channelId 'FPOu4L9q' \
    --namespace "$AB_NAMESPACE" \
    --shareCode 'rvnrJM72' \
    --userId 'eEgyQBTD' \
    --body '{"contentType": "VcjSjkhj", "customAttributes": {"bBatAH1z": {}, "Hcmr1bj1": {}, "x3ULA8aS": {}}, "fileExtension": "5no0BDKC", "name": "A02jUVn8", "payload": "HNuZ1Orv", "preview": "mR24s59e", "previewMetadata": {"previewContentType": "Mszb3CuD", "previewFileExtension": "lgcS9yg6"}, "subType": "robqPzc2", "tags": ["gco6Evwl", "57CnyyLZ", "py3Do7Ys"], "type": "3Vveozjk", "updateContentFile": true}' \
    > test.out 2>&1
eval_tap $? 80 'PublicUpdateContentByShareCode' test.out

#- 81 UpdateContentS3
./ng net.accelbyte.sdk.cli.Main ugc updateContentS3 \
    --channelId 'fLO3NGfP' \
    --contentId 'AnAWQLqW' \
    --namespace "$AB_NAMESPACE" \
    --userId 'MdgpFS0Q' \
    --body '{"contentType": "ecriIkKN", "customAttributes": {"8vyLDUae": {}, "VKMOZjej": {}, "KDq9QWJP": {}}, "fileExtension": "nnSAJkZK", "name": "qCBQJier", "payload": "Ul0LlQA6", "preview": "AmA6Q1dT", "previewMetadata": {"previewContentType": "70Q4WrcV", "previewFileExtension": "N62EUZHW"}, "subType": "vj7brRCW", "tags": ["TDDYghDI", "jI4y0RgU", "Qx9EU7bl"], "type": "TnCyx3kn", "updateContentFile": false}' \
    > test.out 2>&1
eval_tap $? 81 'UpdateContentS3' test.out

#- 82 PublicDeleteContentByShareCode
./ng net.accelbyte.sdk.cli.Main ugc publicDeleteContentByShareCode \
    --channelId 'qaaDi7eJ' \
    --namespace "$AB_NAMESPACE" \
    --shareCode 'RDyOdL2v' \
    --userId 'da5d6gKa' \
    > test.out 2>&1
eval_tap $? 82 'PublicDeleteContentByShareCode' test.out

#- 83 UpdateContentDirect
eval_tap 0 83 'UpdateContentDirect # SKIP deprecated' test.out

#- 84 DeleteContent
./ng net.accelbyte.sdk.cli.Main ugc deleteContent \
    --channelId 'l5QfWcDo' \
    --contentId 'YVn7KKkw' \
    --namespace "$AB_NAMESPACE" \
    --userId 'APyye1ay' \
    > test.out 2>&1
eval_tap $? 84 'DeleteContent' test.out

#- 85 UpdateContentShareCode
./ng net.accelbyte.sdk.cli.Main ugc updateContentShareCode \
    --channelId 'bNQW3XNe' \
    --contentId 'KJcPnNCl' \
    --namespace "$AB_NAMESPACE" \
    --userId 'mXDkRTNB' \
    --body '{"shareCode": "55kqSg3t"}' \
    > test.out 2>&1
eval_tap $? 85 'UpdateContentShareCode' test.out

#- 86 PublicGetUserContent
./ng net.accelbyte.sdk.cli.Main ugc publicGetUserContent \
    --namespace "$AB_NAMESPACE" \
    --userId 'iD25gDXX' \
    --limit '78' \
    --offset '78' \
    > test.out 2>&1
eval_tap $? 86 'PublicGetUserContent' test.out

#- 87 DeleteAllUserContents
./ng net.accelbyte.sdk.cli.Main ugc deleteAllUserContents \
    --namespace "$AB_NAMESPACE" \
    --userId 'YuexQv0T' \
    > test.out 2>&1
eval_tap $? 87 'DeleteAllUserContents' test.out

#- 88 UpdateScreenshots
./ng net.accelbyte.sdk.cli.Main ugc updateScreenshots \
    --contentId 'GBsmkEmU' \
    --namespace "$AB_NAMESPACE" \
    --userId 'kVH1fROb' \
    --body '{"screenshots": [{"description": "YZxUZxEC", "screenshotId": "VXvdeIcs"}, {"description": "XAbTYhWJ", "screenshotId": "xOC2JF1B"}, {"description": "iPPS5u1o", "screenshotId": "ThQoC8QQ"}]}' \
    > test.out 2>&1
eval_tap $? 88 'UpdateScreenshots' test.out

#- 89 UploadContentScreenshot
./ng net.accelbyte.sdk.cli.Main ugc uploadContentScreenshot \
    --contentId '71SvKpRX' \
    --namespace "$AB_NAMESPACE" \
    --userId 'LIfocwr6' \
    --body '{"screenshots": [{"contentType": "t9KHcFQU", "description": "90JfFi98", "fileExtension": "bmp"}, {"contentType": "h9j9hNFV", "description": "ZX5vu0KW", "fileExtension": "jpeg"}, {"contentType": "2oLzu6aT", "description": "ZvPvyVWq", "fileExtension": "jpeg"}]}' \
    > test.out 2>&1
eval_tap $? 89 'UploadContentScreenshot' test.out

#- 90 DeleteContentScreenshot
./ng net.accelbyte.sdk.cli.Main ugc deleteContentScreenshot \
    --contentId 'jz99uTns' \
    --namespace "$AB_NAMESPACE" \
    --screenshotId '9fVXtBVF' \
    --userId 'f53sby93' \
    > test.out 2>&1
eval_tap $? 90 'DeleteContentScreenshot' test.out

#- 91 UpdateUserFollowStatus
./ng net.accelbyte.sdk.cli.Main ugc updateUserFollowStatus \
    --namespace "$AB_NAMESPACE" \
    --userId 'O065GJhE' \
    --body '{"followStatus": true}' \
    > test.out 2>&1
eval_tap $? 91 'UpdateUserFollowStatus' test.out

#- 92 GetPublicFollowers
./ng net.accelbyte.sdk.cli.Main ugc getPublicFollowers \
    --namespace "$AB_NAMESPACE" \
    --userId '5flBhlEi' \
    --limit '90' \
    --offset '36' \
    > test.out 2>&1
eval_tap $? 92 'GetPublicFollowers' test.out

#- 93 GetPublicFollowing
./ng net.accelbyte.sdk.cli.Main ugc getPublicFollowing \
    --namespace "$AB_NAMESPACE" \
    --userId 'eLk1DsKV' \
    --limit '11' \
    --offset '0' \
    > test.out 2>&1
eval_tap $? 93 'GetPublicFollowing' test.out

#- 94 GetGroups
./ng net.accelbyte.sdk.cli.Main ugc getGroups \
    --namespace "$AB_NAMESPACE" \
    --userId 'q57Brt0p' \
    --limit '18' \
    --offset '100' \
    > test.out 2>&1
eval_tap $? 94 'GetGroups' test.out

#- 95 CreateGroup
./ng net.accelbyte.sdk.cli.Main ugc createGroup \
    --namespace "$AB_NAMESPACE" \
    --userId 'VoBKFdGZ' \
    --body '{"contents": ["VKoApKW0", "Wx1LOYsr", "ki8ucUK1"], "name": "BrXyrkBs"}' \
    > test.out 2>&1
eval_tap $? 95 'CreateGroup' test.out

#- 96 DeleteAllUserGroup
./ng net.accelbyte.sdk.cli.Main ugc deleteAllUserGroup \
    --namespace "$AB_NAMESPACE" \
    --userId '9GCPlqqD' \
    > test.out 2>&1
eval_tap $? 96 'DeleteAllUserGroup' test.out

#- 97 GetGroup
./ng net.accelbyte.sdk.cli.Main ugc getGroup \
    --groupId 'wwkIhe48' \
    --namespace "$AB_NAMESPACE" \
    --userId 'vFc0cyPA' \
    > test.out 2>&1
eval_tap $? 97 'GetGroup' test.out

#- 98 UpdateGroup
./ng net.accelbyte.sdk.cli.Main ugc updateGroup \
    --groupId '6Nn0dVnL' \
    --namespace "$AB_NAMESPACE" \
    --userId 'dMkbzU36' \
    --body '{"contents": ["Dockek1p", "YojLC4rf", "P1idRmD9"], "name": "NxDiFI2J"}' \
    > test.out 2>&1
eval_tap $? 98 'UpdateGroup' test.out

#- 99 DeleteGroup
./ng net.accelbyte.sdk.cli.Main ugc deleteGroup \
    --groupId 'VchdpVSp' \
    --namespace "$AB_NAMESPACE" \
    --userId 'VNwGolFS' \
    > test.out 2>&1
eval_tap $? 99 'DeleteGroup' test.out

#- 100 GetGroupContent
./ng net.accelbyte.sdk.cli.Main ugc getGroupContent \
    --groupId 'qALTQBg3' \
    --namespace "$AB_NAMESPACE" \
    --userId 'MSQKhLLx' \
    --limit '37' \
    --offset '38' \
    > test.out 2>&1
eval_tap $? 100 'GetGroupContent' test.out

#- 101 DeleteAllUserStates
./ng net.accelbyte.sdk.cli.Main ugc deleteAllUserStates \
    --namespace "$AB_NAMESPACE" \
    --userId 'kxe39vxr' \
    > test.out 2>&1
eval_tap $? 101 'DeleteAllUserStates' test.out

#- 102 AdminGetContentByChannelIDV2
./ng net.accelbyte.sdk.cli.Main ugc adminGetContentByChannelIDV2 \
    --channelId 'iu8V5nri' \
    --namespace "$AB_NAMESPACE" \
    --limit '96' \
    --name 'PJuxlNHr' \
    --offset '85' \
    --sortBy 'KK3Cslzo' \
    > test.out 2>&1
eval_tap $? 102 'AdminGetContentByChannelIDV2' test.out

#- 103 AdminCreateContentV2
./ng net.accelbyte.sdk.cli.Main ugc adminCreateContentV2 \
    --channelId 'W79Swbsk' \
    --namespace "$AB_NAMESPACE" \
    --body '{"contentType": "dueADd56", "customAttributes": {"VOWIOwSS": {}, "JDAoXoMg": {}, "5lx46lj9": {}}, "fileExtension": "CGfZcTIo", "name": "wJR3sRXH", "shareCode": "JqRde6c7", "subType": "zdcGB5mO", "tags": ["EFOMvnjs", "CUEgJkDa", "PeM1WkF8"], "type": "qyVHMXHJ"}' \
    > test.out 2>&1
eval_tap $? 103 'AdminCreateContentV2' test.out

#- 104 AdminDeleteOfficialContentV2
./ng net.accelbyte.sdk.cli.Main ugc adminDeleteOfficialContentV2 \
    --channelId 'vxW7r3uq' \
    --contentId 'qx9uVyiu' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 104 'AdminDeleteOfficialContentV2' test.out

#- 105 AdminUpdateOfficialContentV2
./ng net.accelbyte.sdk.cli.Main ugc adminUpdateOfficialContentV2 \
    --channelId 'vVQx24Fc' \
    --contentId 'W5qlrbTz' \
    --namespace "$AB_NAMESPACE" \
    --body '{"customAttributes": {"3tBqzvo4": {}, "othkovUG": {}, "ipnavp8G": {}}, "name": "0lzjlw7d", "shareCode": "ljeJRJ8i", "subType": "SCdgJFGu", "tags": ["87LLY7wq", "PTF9BeVr", "yOjm3Um4"], "type": "oQkhk783"}' \
    > test.out 2>&1
eval_tap $? 105 'AdminUpdateOfficialContentV2' test.out

#- 106 AdminCopyContent
./ng net.accelbyte.sdk.cli.Main ugc adminCopyContent \
    --channelId 'qQsvHqk1' \
    --contentId 'QCUYgkUh' \
    --namespace "$AB_NAMESPACE" \
    --body '{"customAttributes": {"tL02H32C": {}, "rS2duKE8": {}, "F96KuCOG": {}}, "name": "WCbRFb06", "subType": "TFhNbjUJ", "tags": ["univT3lr", "j7yCPRNu", "NPSSVPAi"], "targetChannelId": "oQWeCF6V", "type": "1xaB6fJt"}' \
    > test.out 2>&1
eval_tap $? 106 'AdminCopyContent' test.out

#- 107 AdminUpdateOfficialContentFileLocation
./ng net.accelbyte.sdk.cli.Main ugc adminUpdateOfficialContentFileLocation \
    --channelId 'bkooDLLz' \
    --contentId 'R9BJ9gOm' \
    --namespace "$AB_NAMESPACE" \
    --body '{"fileExtension": "qx2x2fEf", "fileLocation": "H5lVn1vc"}' \
    > test.out 2>&1
eval_tap $? 107 'AdminUpdateOfficialContentFileLocation' test.out

#- 108 AdminGenerateOfficialContentUploadURLV2
./ng net.accelbyte.sdk.cli.Main ugc adminGenerateOfficialContentUploadURLV2 \
    --channelId 'mEiIi81G' \
    --contentId 't653TCzE' \
    --namespace "$AB_NAMESPACE" \
    --body '{"contentType": "Wu2lq9gs", "fileExtension": "YaEh6fPq"}' \
    > test.out 2>&1
eval_tap $? 108 'AdminGenerateOfficialContentUploadURLV2' test.out

#- 109 AdminGetConfigs
./ng net.accelbyte.sdk.cli.Main ugc adminGetConfigs \
    --namespace "$AB_NAMESPACE" \
    --limit '72' \
    --offset '9' \
    > test.out 2>&1
eval_tap $? 109 'AdminGetConfigs' test.out

#- 110 AdminUpdateConfig
./ng net.accelbyte.sdk.cli.Main ugc adminUpdateConfig \
    --key '6aeXaEHp' \
    --namespace "$AB_NAMESPACE" \
    --body '{"value": "VoH6Be3j"}' \
    > test.out 2>&1
eval_tap $? 110 'AdminUpdateConfig' test.out

#- 111 AdminListContentV2
./ng net.accelbyte.sdk.cli.Main ugc adminListContentV2 \
    --namespace "$AB_NAMESPACE" \
    --isOfficial  \
    --limit '7' \
    --name 'YpLPp97b' \
    --offset '53' \
    --sortBy 'rTO9DIGI' \
    --subType '1Q7ZL3zd' \
    --tags 'kAhOGFQo,nJHDGZHC,IXsVMWLU' \
    --type 'XcIyna31' \
    > test.out 2>&1
eval_tap $? 111 'AdminListContentV2' test.out

#- 112 AdminBulkGetContentByIDsV2
./ng net.accelbyte.sdk.cli.Main ugc adminBulkGetContentByIDsV2 \
    --namespace "$AB_NAMESPACE" \
    --body '{"contentIds": ["0KeKmq14", "xds2ZC8L", "1zjp4ECs"]}' \
    > test.out 2>&1
eval_tap $? 112 'AdminBulkGetContentByIDsV2' test.out

#- 113 AdminGetContentBulkByShareCodesV2
./ng net.accelbyte.sdk.cli.Main ugc adminGetContentBulkByShareCodesV2 \
    --namespace "$AB_NAMESPACE" \
    --body '{"shareCodes": ["WJUwRDPo", "Yaj2vkUO", "8uZywtEp"]}' \
    > test.out 2>&1
eval_tap $? 113 'AdminGetContentBulkByShareCodesV2' test.out

#- 114 AdminGetContentByShareCodeV2
./ng net.accelbyte.sdk.cli.Main ugc adminGetContentByShareCodeV2 \
    --namespace "$AB_NAMESPACE" \
    --shareCode 'K9Ygtq1e' \
    > test.out 2>&1
eval_tap $? 114 'AdminGetContentByShareCodeV2' test.out

#- 115 AdminGetContentByContentIDV2
./ng net.accelbyte.sdk.cli.Main ugc adminGetContentByContentIDV2 \
    --contentId 'yAZhdDrh' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 115 'AdminGetContentByContentIDV2' test.out

#- 116 RollbackContentVersionV2
./ng net.accelbyte.sdk.cli.Main ugc rollbackContentVersionV2 \
    --contentId '4TybKX1H' \
    --namespace "$AB_NAMESPACE" \
    --versionId 'pv7FuJtj' \
    > test.out 2>&1
eval_tap $? 116 'RollbackContentVersionV2' test.out

#- 117 AdminUpdateScreenshotsV2
./ng net.accelbyte.sdk.cli.Main ugc adminUpdateScreenshotsV2 \
    --contentId 'PMxThnCz' \
    --namespace "$AB_NAMESPACE" \
    --body '{"screenshots": [{"description": "GERvfrFt", "screenshotId": "aeWPg4dr"}, {"description": "kGD9yFiZ", "screenshotId": "Ld35qgJx"}, {"description": "suQUVYyf", "screenshotId": "0SvuPULa"}]}' \
    > test.out 2>&1
eval_tap $? 117 'AdminUpdateScreenshotsV2' test.out

#- 118 AdminUploadContentScreenshotV2
./ng net.accelbyte.sdk.cli.Main ugc adminUploadContentScreenshotV2 \
    --contentId 'tx8wwZJE' \
    --namespace "$AB_NAMESPACE" \
    --body '{"screenshots": [{"contentType": "1rWDSa5v", "description": "Yj7bb8Gx", "fileExtension": "jpg"}, {"contentType": "oIyWZh8a", "description": "0Fgqqy56", "fileExtension": "jfif"}, {"contentType": "SGYIuhNJ", "description": "n3WkVnOL", "fileExtension": "png"}]}' \
    > test.out 2>&1
eval_tap $? 118 'AdminUploadContentScreenshotV2' test.out

#- 119 AdminDeleteContentScreenshotV2
./ng net.accelbyte.sdk.cli.Main ugc adminDeleteContentScreenshotV2 \
    --contentId 'sIow4DkA' \
    --namespace "$AB_NAMESPACE" \
    --screenshotId '8M1aD5Za' \
    > test.out 2>&1
eval_tap $? 119 'AdminDeleteContentScreenshotV2' test.out

#- 120 ListContentVersionsV2
./ng net.accelbyte.sdk.cli.Main ugc listContentVersionsV2 \
    --contentId 'WivpVcSh' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 120 'ListContentVersionsV2' test.out

#- 121 AdminGetOfficialGroupContentsV2
./ng net.accelbyte.sdk.cli.Main ugc adminGetOfficialGroupContentsV2 \
    --groupId 'KMshj9hb' \
    --namespace "$AB_NAMESPACE" \
    --limit '96' \
    --offset '97' \
    > test.out 2>&1
eval_tap $? 121 'AdminGetOfficialGroupContentsV2' test.out

#- 122 AdminListStagingContents
./ng net.accelbyte.sdk.cli.Main ugc adminListStagingContents \
    --namespace "$AB_NAMESPACE" \
    --limit '7' \
    --offset '63' \
    --sortBy 'bkbJj7JD' \
    --status 'V7HORfW5' \
    > test.out 2>&1
eval_tap $? 122 'AdminListStagingContents' test.out

#- 123 AdminGetStagingContentByID
./ng net.accelbyte.sdk.cli.Main ugc adminGetStagingContentByID \
    --contentId '6l7H9Xpy' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 123 'AdminGetStagingContentByID' test.out

#- 124 AdminApproveStagingContent
./ng net.accelbyte.sdk.cli.Main ugc adminApproveStagingContent \
    --contentId 'tBuhFnX9' \
    --namespace "$AB_NAMESPACE" \
    --body '{"approved": false, "note": "NwyAC5gl"}' \
    > test.out 2>&1
eval_tap $? 124 'AdminApproveStagingContent' test.out

#- 125 AdminUpdateContentByShareCodeV2
./ng net.accelbyte.sdk.cli.Main ugc adminUpdateContentByShareCodeV2 \
    --channelId 'lMVcFtuH' \
    --namespace "$AB_NAMESPACE" \
    --shareCode '2A4dtqsR' \
    --userId 'S56hWt7A' \
    --body '{"customAttributes": {"e1jGJfqw": {}, "laX4F2xo": {}, "diusFpVw": {}}, "name": "HXUq3iif", "shareCode": "4kEWUkDo", "subType": "FEBdKQwP", "tags": ["M6rCE9lJ", "5X5yW21R", "UdXtjKqZ"], "type": "SzNePpQt"}' \
    > test.out 2>&1
eval_tap $? 125 'AdminUpdateContentByShareCodeV2' test.out

#- 126 AdminDeleteContentByShareCodeV2
./ng net.accelbyte.sdk.cli.Main ugc adminDeleteContentByShareCodeV2 \
    --channelId '3JkurAWl' \
    --namespace "$AB_NAMESPACE" \
    --shareCode '8NsuBfj5' \
    --userId 'v4CDY2Sc' \
    > test.out 2>&1
eval_tap $? 126 'AdminDeleteContentByShareCodeV2' test.out

#- 127 AdminDeleteUserContentV2
./ng net.accelbyte.sdk.cli.Main ugc adminDeleteUserContentV2 \
    --channelId 'vTXST0N5' \
    --contentId 'yqC2DO3Y' \
    --namespace "$AB_NAMESPACE" \
    --userId '2lslKncD' \
    > test.out 2>&1
eval_tap $? 127 'AdminDeleteUserContentV2' test.out

#- 128 AdminUpdateUserContentV2
./ng net.accelbyte.sdk.cli.Main ugc adminUpdateUserContentV2 \
    --channelId 'bszqIgWQ' \
    --contentId '5WRywmHd' \
    --namespace "$AB_NAMESPACE" \
    --userId 'ElITD2bm' \
    --body '{"customAttributes": {"aKxJPFpD": {}, "D1GBllQn": {}, "omg9lTnB": {}}, "name": "RsZXkHyU", "shareCode": "3ajeKPtM", "subType": "RZXspfRI", "tags": ["zyCwqo23", "oHbycLgx", "Y0DKNhP4"], "type": "F1qPxklA"}' \
    > test.out 2>&1
eval_tap $? 128 'AdminUpdateUserContentV2' test.out

#- 129 AdminUpdateUserContentFileLocation
./ng net.accelbyte.sdk.cli.Main ugc adminUpdateUserContentFileLocation \
    --channelId 'Mz5R2Zdv' \
    --contentId '5gIWCjdr' \
    --namespace "$AB_NAMESPACE" \
    --userId 'utoUmhVA' \
    --body '{"fileExtension": "sVDa7AWI", "fileLocation": "zAv7qeab"}' \
    > test.out 2>&1
eval_tap $? 129 'AdminUpdateUserContentFileLocation' test.out

#- 130 AdminGenerateUserContentUploadURLV2
./ng net.accelbyte.sdk.cli.Main ugc adminGenerateUserContentUploadURLV2 \
    --channelId '1dwzmLDy' \
    --contentId 'MrsZeiJ4' \
    --namespace "$AB_NAMESPACE" \
    --userId '6tX7rLRU' \
    --body '{"contentType": "s0hdTtzt", "fileExtension": "e7eoSC59"}' \
    > test.out 2>&1
eval_tap $? 130 'AdminGenerateUserContentUploadURLV2' test.out

#- 131 AdminGetContentByUserIDV2
./ng net.accelbyte.sdk.cli.Main ugc adminGetContentByUserIDV2 \
    --namespace "$AB_NAMESPACE" \
    --userId 'mrV2sPT7' \
    --limit '77' \
    --offset '4' \
    --sortBy 'Fe8mS9z8' \
    > test.out 2>&1
eval_tap $? 131 'AdminGetContentByUserIDV2' test.out

#- 132 AdminUpdateContentHideStatusV2
./ng net.accelbyte.sdk.cli.Main ugc adminUpdateContentHideStatusV2 \
    --contentId 'ST2srbQJ' \
    --namespace "$AB_NAMESPACE" \
    --userId 'eMPtjuRs' \
    --body '{"isHidden": false}' \
    > test.out 2>&1
eval_tap $? 132 'AdminUpdateContentHideStatusV2' test.out

#- 133 AdminGetUserGroupContentsV2
./ng net.accelbyte.sdk.cli.Main ugc adminGetUserGroupContentsV2 \
    --groupId 'q4IMMxqc' \
    --namespace "$AB_NAMESPACE" \
    --userId 'X1TA5fHh' \
    --limit '28' \
    --offset '11' \
    > test.out 2>&1
eval_tap $? 133 'AdminGetUserGroupContentsV2' test.out

#- 134 AdminListUserStagingContents
./ng net.accelbyte.sdk.cli.Main ugc adminListUserStagingContents \
    --namespace "$AB_NAMESPACE" \
    --userId 'vLIQt8P0' \
    --limit '80' \
    --offset '5' \
    --sortBy 'FCn9Smlo' \
    --status 'YDfRZnoI' \
    > test.out 2>&1
eval_tap $? 134 'AdminListUserStagingContents' test.out

#- 135 PublicGetContentByChannelIDV2
./ng net.accelbyte.sdk.cli.Main ugc publicGetContentByChannelIDV2 \
    --channelId 'xyyUc0y8' \
    --namespace "$AB_NAMESPACE" \
    --limit '21' \
    --name '2hgKSwUA' \
    --offset '70' \
    --sortBy 'mLj3VuDf' \
    > test.out 2>&1
eval_tap $? 135 'PublicGetContentByChannelIDV2' test.out

#- 136 PublicListContentV2
./ng net.accelbyte.sdk.cli.Main ugc publicListContentV2 \
    --namespace "$AB_NAMESPACE" \
    --isOfficial  \
    --limit '100' \
    --name 'tULMyRmJ' \
    --offset '75' \
    --sortBy 'sCLXu3jJ' \
    --subType 'lAMg46or' \
    --tags '0xBbdrD2,jv9LLq9m,jkcMjbsH' \
    --type 'guwDBVex' \
    > test.out 2>&1
eval_tap $? 136 'PublicListContentV2' test.out

#- 137 PublicBulkGetContentByIDV2
./ng net.accelbyte.sdk.cli.Main ugc publicBulkGetContentByIDV2 \
    --namespace "$AB_NAMESPACE" \
    --body '{"contentIds": ["b32EGZsj", "9eE3dJwB", "7mfQNUYO"]}' \
    > test.out 2>&1
eval_tap $? 137 'PublicBulkGetContentByIDV2' test.out

#- 138 PublicGetContentBulkByShareCodesV2
./ng net.accelbyte.sdk.cli.Main ugc publicGetContentBulkByShareCodesV2 \
    --namespace "$AB_NAMESPACE" \
    --body '{"shareCodes": ["gS2d9ZJq", "Tc0GtQtk", "rMM4ISep"]}' \
    > test.out 2>&1
eval_tap $? 138 'PublicGetContentBulkByShareCodesV2' test.out

#- 139 PublicGetContentByShareCodeV2
./ng net.accelbyte.sdk.cli.Main ugc publicGetContentByShareCodeV2 \
    --namespace "$AB_NAMESPACE" \
    --shareCode 'UUD8H1BQ' \
    > test.out 2>&1
eval_tap $? 139 'PublicGetContentByShareCodeV2' test.out

#- 140 PublicGetContentByIDV2
./ng net.accelbyte.sdk.cli.Main ugc publicGetContentByIDV2 \
    --contentId 'fJuxg2J9' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 140 'PublicGetContentByIDV2' test.out

#- 141 PublicAddDownloadCountV2
./ng net.accelbyte.sdk.cli.Main ugc publicAddDownloadCountV2 \
    --contentId 'PnLdikvk' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 141 'PublicAddDownloadCountV2' test.out

#- 142 PublicListContentDownloaderV2
./ng net.accelbyte.sdk.cli.Main ugc publicListContentDownloaderV2 \
    --contentId 'Gj1BNxyR' \
    --namespace "$AB_NAMESPACE" \
    --limit '21' \
    --offset '28' \
    --sortBy 'duvBRUHt' \
    --userId 'UXI14lQU' \
    > test.out 2>&1
eval_tap $? 142 'PublicListContentDownloaderV2' test.out

#- 143 PublicListContentLikeV2
./ng net.accelbyte.sdk.cli.Main ugc publicListContentLikeV2 \
    --contentId 'EpW2jH9w' \
    --namespace "$AB_NAMESPACE" \
    --limit '100' \
    --offset '13' \
    --sortBy 'w8MGuG8O' \
    > test.out 2>&1
eval_tap $? 143 'PublicListContentLikeV2' test.out

#- 144 UpdateContentLikeStatusV2
./ng net.accelbyte.sdk.cli.Main ugc updateContentLikeStatusV2 \
    --contentId '1TFVQGpQ' \
    --namespace "$AB_NAMESPACE" \
    --body '{"likeStatus": false}' \
    > test.out 2>&1
eval_tap $? 144 'UpdateContentLikeStatusV2' test.out

#- 145 PublicCreateContentV2
./ng net.accelbyte.sdk.cli.Main ugc publicCreateContentV2 \
    --channelId 'b7je8kIY' \
    --namespace "$AB_NAMESPACE" \
    --userId '7D5walsm' \
    --body '{"contentType": "ET6PMD0f", "customAttributes": {"EjiMTZVo": {}, "bBHlpLX5": {}, "wh7fCPc4": {}}, "fileExtension": "4bcdSCWY", "name": "ICvYoDra", "subType": "8dazRjzu", "tags": ["HFVSa8O7", "jl6R0syg", "JqP2PHws"], "type": "UCcgWB3P"}' \
    > test.out 2>&1
eval_tap $? 145 'PublicCreateContentV2' test.out

#- 146 PublicUpdateContentByShareCodeV2
./ng net.accelbyte.sdk.cli.Main ugc publicUpdateContentByShareCodeV2 \
    --channelId 'tJUaOORi' \
    --namespace "$AB_NAMESPACE" \
    --shareCode 'NgcKn9Wo' \
    --userId 'R8QojPPw' \
    --body '{"customAttributes": {"fpIeiow7": {}, "b3cwptDI": {}, "oqltxQ1S": {}}, "name": "9cTPlP69", "subType": "ukY2DtRJ", "tags": ["AyPnPyCm", "SxlmaHB4", "q1G0RKmw"], "type": "FGaemFpf"}' \
    > test.out 2>&1
eval_tap $? 146 'PublicUpdateContentByShareCodeV2' test.out

#- 147 PublicDeleteContentByShareCodeV2
./ng net.accelbyte.sdk.cli.Main ugc publicDeleteContentByShareCodeV2 \
    --channelId 'u1lJvuE3' \
    --namespace "$AB_NAMESPACE" \
    --shareCode 'P4N4zMZ6' \
    --userId 'hko1f4nw' \
    > test.out 2>&1
eval_tap $? 147 'PublicDeleteContentByShareCodeV2' test.out

#- 148 PublicDeleteContentV2
./ng net.accelbyte.sdk.cli.Main ugc publicDeleteContentV2 \
    --channelId 'nD95YU3E' \
    --contentId 'VrWOfxr7' \
    --namespace "$AB_NAMESPACE" \
    --userId 'g2V7Wxrc' \
    > test.out 2>&1
eval_tap $? 148 'PublicDeleteContentV2' test.out

#- 149 PublicUpdateContentV2
./ng net.accelbyte.sdk.cli.Main ugc publicUpdateContentV2 \
    --channelId 'nspXYmuU' \
    --contentId 'NHAizYQC' \
    --namespace "$AB_NAMESPACE" \
    --userId 'mvmT8L94' \
    --body '{"customAttributes": {"QQFFNYwF": {}, "verf2Pf0": {}, "Yl4Z6W1x": {}}, "name": "grG5P0SH", "subType": "uou4ZFFb", "tags": ["jKSRWJmE", "M5gkQ0sf", "SVnqhnEQ"], "type": "DMc4YOAA"}' \
    > test.out 2>&1
eval_tap $? 149 'PublicUpdateContentV2' test.out

#- 150 PublicUpdateContentFileLocation
./ng net.accelbyte.sdk.cli.Main ugc publicUpdateContentFileLocation \
    --channelId 'hMDZpwFk' \
    --contentId 'A5qP5565' \
    --namespace "$AB_NAMESPACE" \
    --userId 'xgBNguVY' \
    --body '{"fileExtension": "5XdrjtAG", "fileLocation": "BVMtZWRi"}' \
    > test.out 2>&1
eval_tap $? 150 'PublicUpdateContentFileLocation' test.out

#- 151 UpdateContentShareCodeV2
./ng net.accelbyte.sdk.cli.Main ugc updateContentShareCodeV2 \
    --channelId 'f3De2qkz' \
    --contentId 'JozYGp2u' \
    --namespace "$AB_NAMESPACE" \
    --userId 'PUFmTvRw' \
    --body '{"shareCode": "WU5gleEY"}' \
    > test.out 2>&1
eval_tap $? 151 'UpdateContentShareCodeV2' test.out

#- 152 PublicGenerateContentUploadURLV2
./ng net.accelbyte.sdk.cli.Main ugc publicGenerateContentUploadURLV2 \
    --channelId 'MWhJ2xRb' \
    --contentId 'ch3ZAZ4l' \
    --namespace "$AB_NAMESPACE" \
    --userId 'oWIVZxdw' \
    --body '{"contentType": "gOZTN3BE", "fileExtension": "RI6V6KN2"}' \
    > test.out 2>&1
eval_tap $? 152 'PublicGenerateContentUploadURLV2' test.out

#- 153 PublicGetContentByUserIDV2
./ng net.accelbyte.sdk.cli.Main ugc publicGetContentByUserIDV2 \
    --namespace "$AB_NAMESPACE" \
    --userId 'c01adjAC' \
    --limit '18' \
    --offset '30' \
    --sortBy '03wvflgI' \
    > test.out 2>&1
eval_tap $? 153 'PublicGetContentByUserIDV2' test.out

#- 154 UpdateScreenshotsV2
./ng net.accelbyte.sdk.cli.Main ugc updateScreenshotsV2 \
    --contentId 'GIG4f6zo' \
    --namespace "$AB_NAMESPACE" \
    --userId '64yN0X4Z' \
    --body '{"screenshots": [{"description": "bxHWq7Ns", "screenshotId": "xelFz8ne"}, {"description": "ebMdD6CD", "screenshotId": "UKwUsHyd"}, {"description": "zhtE1kLx", "screenshotId": "1DlzlIP5"}]}' \
    > test.out 2>&1
eval_tap $? 154 'UpdateScreenshotsV2' test.out

#- 155 UploadContentScreenshotV2
./ng net.accelbyte.sdk.cli.Main ugc uploadContentScreenshotV2 \
    --contentId 'pVvH97Lq' \
    --namespace "$AB_NAMESPACE" \
    --userId 'wiNx4gkJ' \
    --body '{"screenshots": [{"contentType": "wEHIjgyn", "description": "OC5tkj7g", "fileExtension": "pjp"}, {"contentType": "HWV5ZRMk", "description": "8QByioZD", "fileExtension": "pjp"}, {"contentType": "hqqSB4FW", "description": "LgN7Cs7e", "fileExtension": "jpg"}]}' \
    > test.out 2>&1
eval_tap $? 155 'UploadContentScreenshotV2' test.out

#- 156 DeleteContentScreenshotV2
./ng net.accelbyte.sdk.cli.Main ugc deleteContentScreenshotV2 \
    --contentId 'YGfilsIg' \
    --namespace "$AB_NAMESPACE" \
    --screenshotId 'okUiqAYY' \
    --userId 'p1bB9Hrb' \
    > test.out 2>&1
eval_tap $? 156 'DeleteContentScreenshotV2' test.out

#- 157 PublicGetGroupContentsV2
./ng net.accelbyte.sdk.cli.Main ugc publicGetGroupContentsV2 \
    --groupId '6A0W3D6z' \
    --namespace "$AB_NAMESPACE" \
    --userId 'c9AJMLuZ' \
    --limit '83' \
    --offset '54' \
    > test.out 2>&1
eval_tap $? 157 'PublicGetGroupContentsV2' test.out

#- 158 ListUserStagingContents
./ng net.accelbyte.sdk.cli.Main ugc listUserStagingContents \
    --namespace "$AB_NAMESPACE" \
    --userId 'HFvegBv5' \
    --limit '93' \
    --offset '8' \
    --sortBy 'iXZf8IBf' \
    --status 'Ub22rjLf' \
    > test.out 2>&1
eval_tap $? 158 'ListUserStagingContents' test.out

#- 159 GetUserStagingContentByID
./ng net.accelbyte.sdk.cli.Main ugc getUserStagingContentByID \
    --contentId '3ry5ka30' \
    --namespace "$AB_NAMESPACE" \
    --userId 'VzSQun7h' \
    > test.out 2>&1
eval_tap $? 159 'GetUserStagingContentByID' test.out

#- 160 UpdateStagingContent
./ng net.accelbyte.sdk.cli.Main ugc updateStagingContent \
    --contentId 'l2i4qHx9' \
    --namespace "$AB_NAMESPACE" \
    --userId 'nQxalkHX' \
    --body '{"fileExtension": "SrdHjQ2U", "fileLocation": "1JdqHi3u"}' \
    > test.out 2>&1
eval_tap $? 160 'UpdateStagingContent' test.out

#- 161 DeleteUserStagingContentByID
./ng net.accelbyte.sdk.cli.Main ugc deleteUserStagingContentByID \
    --contentId 'OKpDq7Ty' \
    --namespace "$AB_NAMESPACE" \
    --userId 'qRX5FPMu' \
    > test.out 2>&1
eval_tap $? 161 'DeleteUserStagingContentByID' test.out


rm -f "tmp.dat"

exit $EXIT_CODE