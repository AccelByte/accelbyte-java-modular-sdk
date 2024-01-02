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
    --limit '79' \
    --offset '69' \
    > test.out 2>&1
eval_tap $? 2 'SingleAdminGetChannel' test.out

#- 3 AdminCreateChannel
./ng net.accelbyte.sdk.cli.Main ugc adminCreateChannel \
    --namespace "$AB_NAMESPACE" \
    --body '{"id": "G31FCJVb", "name": "TXJ8GOXL"}' \
    > test.out 2>&1
eval_tap $? 3 'AdminCreateChannel' test.out

#- 4 SingleAdminUpdateChannel
./ng net.accelbyte.sdk.cli.Main ugc singleAdminUpdateChannel \
    --channelId 'fVQlBb79' \
    --namespace "$AB_NAMESPACE" \
    --body '{"name": "kHc2LPVL"}' \
    > test.out 2>&1
eval_tap $? 4 'SingleAdminUpdateChannel' test.out

#- 5 SingleAdminDeleteChannel
./ng net.accelbyte.sdk.cli.Main ugc singleAdminDeleteChannel \
    --channelId '7MrXJDy7' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 5 'SingleAdminDeleteChannel' test.out

#- 6 AdminUploadContentDirect
eval_tap 0 6 'AdminUploadContentDirect # SKIP deprecated' test.out

#- 7 AdminUploadContentS3
./ng net.accelbyte.sdk.cli.Main ugc adminUploadContentS3 \
    --channelId '4cT8n3fc' \
    --namespace "$AB_NAMESPACE" \
    --body '{"contentType": "adufvMtF", "customAttributes": {"IUcZqvFZ": {}, "E6RAOL0B": {}, "zVC8HOf1": {}}, "fileExtension": "5p2Fnn1A", "name": "clHPDE7A", "preview": "HsLBTrsb", "previewMetadata": {"previewContentType": "mnfB3J2Z", "previewFileExtension": "qXyuhIBb"}, "shareCode": "6Ute0Oz3", "subType": "zgAm8Ox6", "tags": ["KZNo4Zg8", "L3Z1X07j", "yBN50wjr"], "type": "N9V3DqJy"}' \
    > test.out 2>&1
eval_tap $? 7 'AdminUploadContentS3' test.out

#- 8 SingleAdminUpdateContentS3
./ng net.accelbyte.sdk.cli.Main ugc singleAdminUpdateContentS3 \
    --channelId 'Ab2kBLAq' \
    --contentId 'ODQKYryW' \
    --namespace "$AB_NAMESPACE" \
    --body '{"contentType": "rDW9GFsP", "customAttributes": {"N6GFd6dl": {}, "BvOMcCFR": {}, "1rXcsBVL": {}}, "fileExtension": "7xy8GF3L", "name": "UDm17S9M", "payload": "w6hdNYAZ", "preview": "dBk7XgTV", "previewMetadata": {"previewContentType": "TanaZNGf", "previewFileExtension": "HMPNyIrs"}, "shareCode": "rDptcZiA", "subType": "GDC0D2D1", "tags": ["J5O5hztk", "JhR6dRH3", "XngQHgkp"], "type": "1ieKqn21", "updateContentFile": false}' \
    > test.out 2>&1
eval_tap $? 8 'SingleAdminUpdateContentS3' test.out

#- 9 AdminSearchChannelSpecificContent
./ng net.accelbyte.sdk.cli.Main ugc adminSearchChannelSpecificContent \
    --channelId '6rFBdaCR' \
    --namespace "$AB_NAMESPACE" \
    --creator 'gmur0FWv' \
    --ishidden 'Zge51ToE' \
    --isofficial '6RaD9q7e' \
    --limit '42' \
    --name '5BviFzdD' \
    --offset '67' \
    --orderby 'QaJGuXve' \
    --sortby 'BgVjwulA' \
    --subtype 'qf0664ao' \
    --tags '1t5luOEK,f19bEr3v,ZPGa4B1b' \
    --type 'cr31VH51' \
    --userId 'M62MNXqY' \
    > test.out 2>&1
eval_tap $? 9 'AdminSearchChannelSpecificContent' test.out

#- 10 SingleAdminUpdateContentDirect
eval_tap 0 10 'SingleAdminUpdateContentDirect # SKIP deprecated' test.out

#- 11 SingleAdminDeleteContent
./ng net.accelbyte.sdk.cli.Main ugc singleAdminDeleteContent \
    --channelId 'r3h8sccB' \
    --contentId 'bRlusjBQ' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 11 'SingleAdminDeleteContent' test.out

#- 12 SingleAdminGetContent
./ng net.accelbyte.sdk.cli.Main ugc singleAdminGetContent \
    --namespace "$AB_NAMESPACE" \
    --limit '62' \
    --offset '36' \
    > test.out 2>&1
eval_tap $? 12 'SingleAdminGetContent' test.out

#- 13 AdminGetContentBulk
./ng net.accelbyte.sdk.cli.Main ugc adminGetContentBulk \
    --namespace "$AB_NAMESPACE" \
    --body '{"contentIds": ["YAowkLfJ", "otMPoMo3", "0Sc5olBV"]}' \
    > test.out 2>&1
eval_tap $? 13 'AdminGetContentBulk' test.out

#- 14 AdminSearchContent
./ng net.accelbyte.sdk.cli.Main ugc adminSearchContent \
    --namespace "$AB_NAMESPACE" \
    --creator '8q87WXa2' \
    --ishidden 'FV24meVM' \
    --isofficial '0nG00F9M' \
    --limit '57' \
    --name 'RAI4xvur' \
    --offset '77' \
    --orderby 'vQDWvKWB' \
    --sortby 'BUpWsjDz' \
    --subtype 'SAPeAvPL' \
    --tags 'KT4csxOE,VlSpJDkv,xHi386TY' \
    --type 'gUnEEiIT' \
    --userId 'funoUCnS' \
    > test.out 2>&1
eval_tap $? 14 'AdminSearchContent' test.out

#- 15 AdminGetContentBulkByShareCodes
./ng net.accelbyte.sdk.cli.Main ugc adminGetContentBulkByShareCodes \
    --namespace "$AB_NAMESPACE" \
    --body '{"shareCodes": ["YhrPXEmE", "TN3BYOzK", "Oltz6cZI"]}' \
    > test.out 2>&1
eval_tap $? 15 'AdminGetContentBulkByShareCodes' test.out

#- 16 AdminGetUserContentByShareCode
./ng net.accelbyte.sdk.cli.Main ugc adminGetUserContentByShareCode \
    --namespace "$AB_NAMESPACE" \
    --shareCode 'J5mRbiKz' \
    > test.out 2>&1
eval_tap $? 16 'AdminGetUserContentByShareCode' test.out

#- 17 AdminGetSpecificContent
./ng net.accelbyte.sdk.cli.Main ugc adminGetSpecificContent \
    --contentId 'SiGmB2Jy' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 17 'AdminGetSpecificContent' test.out

#- 18 AdminDownloadContentPreview
./ng net.accelbyte.sdk.cli.Main ugc adminDownloadContentPreview \
    --contentId 'JvYWgv6Y' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 18 'AdminDownloadContentPreview' test.out

#- 19 RollbackContentVersion
./ng net.accelbyte.sdk.cli.Main ugc rollbackContentVersion \
    --contentId 'dhRLIJP1' \
    --namespace "$AB_NAMESPACE" \
    --versionId '7Tc6da8K' \
    > test.out 2>&1
eval_tap $? 19 'RollbackContentVersion' test.out

#- 20 AdminUpdateScreenshots
./ng net.accelbyte.sdk.cli.Main ugc adminUpdateScreenshots \
    --contentId 'QLIdFicx' \
    --namespace "$AB_NAMESPACE" \
    --body '{"screenshots": [{"description": "crckJRPO", "screenshotId": "1jQtdW3A"}, {"description": "siKUAunT", "screenshotId": "O2BaVcUI"}, {"description": "feMK4ZZz", "screenshotId": "ayxQRuQq"}]}' \
    > test.out 2>&1
eval_tap $? 20 'AdminUpdateScreenshots' test.out

#- 21 AdminUploadContentScreenshot
./ng net.accelbyte.sdk.cli.Main ugc adminUploadContentScreenshot \
    --contentId 'MWd6qwN8' \
    --namespace "$AB_NAMESPACE" \
    --body '{"screenshots": [{"contentType": "1SUvmk6g", "description": "ElOfKAWf", "fileExtension": "png"}, {"contentType": "4xzP0mau", "description": "GDwF0O8y", "fileExtension": "jpg"}, {"contentType": "tZ9Wrl4n", "description": "oUxGZVNe", "fileExtension": "jpeg"}]}' \
    > test.out 2>&1
eval_tap $? 21 'AdminUploadContentScreenshot' test.out

#- 22 AdminDeleteContentScreenshot
./ng net.accelbyte.sdk.cli.Main ugc adminDeleteContentScreenshot \
    --contentId 'tkU66mfH' \
    --namespace "$AB_NAMESPACE" \
    --screenshotId 'iTsvMnk2' \
    > test.out 2>&1
eval_tap $? 22 'AdminDeleteContentScreenshot' test.out

#- 23 ListContentVersions
./ng net.accelbyte.sdk.cli.Main ugc listContentVersions \
    --contentId 'ajy31gNn' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 23 'ListContentVersions' test.out

#- 24 SingleAdminGetAllGroups
./ng net.accelbyte.sdk.cli.Main ugc singleAdminGetAllGroups \
    --namespace "$AB_NAMESPACE" \
    --limit '58' \
    --offset '67' \
    > test.out 2>&1
eval_tap $? 24 'SingleAdminGetAllGroups' test.out

#- 25 AdminCreateGroup
./ng net.accelbyte.sdk.cli.Main ugc adminCreateGroup \
    --namespace "$AB_NAMESPACE" \
    --body '{"contents": ["qLOEiMzG", "kdc1BRI4", "Lf52IH7t"], "name": "huWsfCKV"}' \
    > test.out 2>&1
eval_tap $? 25 'AdminCreateGroup' test.out

#- 26 SingleAdminGetGroup
./ng net.accelbyte.sdk.cli.Main ugc singleAdminGetGroup \
    --groupId 'u8PFg9uw' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 26 'SingleAdminGetGroup' test.out

#- 27 SingleAdminUpdateGroup
./ng net.accelbyte.sdk.cli.Main ugc singleAdminUpdateGroup \
    --groupId 'qbsBfCsJ' \
    --namespace "$AB_NAMESPACE" \
    --body '{"contents": ["nbpP2MsN", "DbpArB2T", "3IVkpewL"], "name": "2n8whhEI"}' \
    > test.out 2>&1
eval_tap $? 27 'SingleAdminUpdateGroup' test.out

#- 28 SingleAdminDeleteGroup
./ng net.accelbyte.sdk.cli.Main ugc singleAdminDeleteGroup \
    --groupId 'C8pDPxUP' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 28 'SingleAdminDeleteGroup' test.out

#- 29 SingleAdminGetGroupContents
./ng net.accelbyte.sdk.cli.Main ugc singleAdminGetGroupContents \
    --groupId 'mPICyFOA' \
    --namespace "$AB_NAMESPACE" \
    --limit '15' \
    --offset '66' \
    > test.out 2>&1
eval_tap $? 29 'SingleAdminGetGroupContents' test.out

#- 30 AdminGetTag
./ng net.accelbyte.sdk.cli.Main ugc adminGetTag \
    --namespace "$AB_NAMESPACE" \
    --limit '52' \
    --offset '97' \
    > test.out 2>&1
eval_tap $? 30 'AdminGetTag' test.out

#- 31 AdminCreateTag
./ng net.accelbyte.sdk.cli.Main ugc adminCreateTag \
    --namespace "$AB_NAMESPACE" \
    --body '{"tag": "rswlVm7O"}' \
    > test.out 2>&1
eval_tap $? 31 'AdminCreateTag' test.out

#- 32 AdminUpdateTag
./ng net.accelbyte.sdk.cli.Main ugc adminUpdateTag \
    --namespace "$AB_NAMESPACE" \
    --tagId 'CQRiXxSU' \
    --body '{"tag": "k7jdQJCB"}' \
    > test.out 2>&1
eval_tap $? 32 'AdminUpdateTag' test.out

#- 33 AdminDeleteTag
./ng net.accelbyte.sdk.cli.Main ugc adminDeleteTag \
    --namespace "$AB_NAMESPACE" \
    --tagId 'zLCuEl0P' \
    > test.out 2>&1
eval_tap $? 33 'AdminDeleteTag' test.out

#- 34 AdminGetType
./ng net.accelbyte.sdk.cli.Main ugc adminGetType \
    --namespace "$AB_NAMESPACE" \
    --limit '58' \
    --offset '91' \
    > test.out 2>&1
eval_tap $? 34 'AdminGetType' test.out

#- 35 AdminCreateType
./ng net.accelbyte.sdk.cli.Main ugc adminCreateType \
    --namespace "$AB_NAMESPACE" \
    --body '{"subtype": ["0TTcidAT", "l46A89qM", "UmCwNMQr"], "type": "iYUtqvT9"}' \
    > test.out 2>&1
eval_tap $? 35 'AdminCreateType' test.out

#- 36 AdminUpdateType
./ng net.accelbyte.sdk.cli.Main ugc adminUpdateType \
    --namespace "$AB_NAMESPACE" \
    --typeId 'Pil2i6ZW' \
    --body '{"subtype": ["kLTfQpuf", "VwBSUVoq", "zvH4t70T"], "type": "5doFnkH3"}' \
    > test.out 2>&1
eval_tap $? 36 'AdminUpdateType' test.out

#- 37 AdminDeleteType
./ng net.accelbyte.sdk.cli.Main ugc adminDeleteType \
    --namespace "$AB_NAMESPACE" \
    --typeId '5zwD0QzX' \
    > test.out 2>&1
eval_tap $? 37 'AdminDeleteType' test.out

#- 38 AdminGetChannel
./ng net.accelbyte.sdk.cli.Main ugc adminGetChannel \
    --namespace "$AB_NAMESPACE" \
    --userId 'Oz4xWsI8' \
    --limit '28' \
    --name 'O1flkPix' \
    --offset '87' \
    > test.out 2>&1
eval_tap $? 38 'AdminGetChannel' test.out

#- 39 AdminDeleteAllUserChannels
./ng net.accelbyte.sdk.cli.Main ugc adminDeleteAllUserChannels \
    --namespace "$AB_NAMESPACE" \
    --userId '5Ievv3aa' \
    > test.out 2>&1
eval_tap $? 39 'AdminDeleteAllUserChannels' test.out

#- 40 AdminUpdateChannel
./ng net.accelbyte.sdk.cli.Main ugc adminUpdateChannel \
    --channelId 'ryOKorqa' \
    --namespace "$AB_NAMESPACE" \
    --userId 'rsQgWzoW' \
    --body '{"name": "uyOF7S3q"}' \
    > test.out 2>&1
eval_tap $? 40 'AdminUpdateChannel' test.out

#- 41 AdminDeleteChannel
./ng net.accelbyte.sdk.cli.Main ugc adminDeleteChannel \
    --channelId 'RdIhv3FS' \
    --namespace "$AB_NAMESPACE" \
    --userId 'BncSoOxO' \
    > test.out 2>&1
eval_tap $? 41 'AdminDeleteChannel' test.out

#- 42 AdminUpdateContentS3ByShareCode
./ng net.accelbyte.sdk.cli.Main ugc adminUpdateContentS3ByShareCode \
    --channelId 'dDqzx2ge' \
    --namespace "$AB_NAMESPACE" \
    --shareCode 'GmMDtwpy' \
    --userId 'rP2njLB7' \
    --body '{"contentType": "GrgJP7fW", "customAttributes": {"oTIWOwGj": {}, "B2KA8BW7": {}, "1swIERMb": {}}, "fileExtension": "c8JiTmHz", "name": "iMucAMej", "payload": "JYeJG4KG", "preview": "nzfCKykA", "previewMetadata": {"previewContentType": "dJVbf8Bi", "previewFileExtension": "V8TPD3mZ"}, "shareCode": "2jK4bhaO", "subType": "litzb2T8", "tags": ["iEGpv7by", "0Rp8tshE", "fO7uKTky"], "type": "pmzzcQ8H", "updateContentFile": false}' \
    > test.out 2>&1
eval_tap $? 42 'AdminUpdateContentS3ByShareCode' test.out

#- 43 AdminUpdateContentS3
./ng net.accelbyte.sdk.cli.Main ugc adminUpdateContentS3 \
    --channelId '930qzcUu' \
    --contentId 'XdqIMXM7' \
    --namespace "$AB_NAMESPACE" \
    --userId 'v2iqAKy3' \
    --body '{"contentType": "ZbvcGQaV", "customAttributes": {"n8k1KKEm": {}, "22wK5aRG": {}, "gVDDJi9m": {}}, "fileExtension": "RJtr6Qvm", "name": "P9wpiO7q", "payload": "MZOGZsQf", "preview": "qf9MA3Es", "previewMetadata": {"previewContentType": "fOVsZZME", "previewFileExtension": "528zN7yn"}, "shareCode": "cLgEMpou", "subType": "73m4YIQU", "tags": ["BqrxAVfD", "KkUpTaNd", "pZau01DL"], "type": "MO6efVQP", "updateContentFile": true}' \
    > test.out 2>&1
eval_tap $? 43 'AdminUpdateContentS3' test.out

#- 44 DeleteContentByShareCode
./ng net.accelbyte.sdk.cli.Main ugc deleteContentByShareCode \
    --channelId 'nlkZYa59' \
    --namespace "$AB_NAMESPACE" \
    --shareCode 'blt3aBBY' \
    --userId 'IbmKI23U' \
    > test.out 2>&1
eval_tap $? 44 'DeleteContentByShareCode' test.out

#- 45 AdminUpdateContentDirect
eval_tap 0 45 'AdminUpdateContentDirect # SKIP deprecated' test.out

#- 46 AdminDeleteContent
./ng net.accelbyte.sdk.cli.Main ugc adminDeleteContent \
    --channelId 'NEu1bOR2' \
    --contentId 'DsUIoQ1D' \
    --namespace "$AB_NAMESPACE" \
    --userId 'trQK3kva' \
    > test.out 2>&1
eval_tap $? 46 'AdminDeleteContent' test.out

#- 47 AdminGetContent
./ng net.accelbyte.sdk.cli.Main ugc adminGetContent \
    --namespace "$AB_NAMESPACE" \
    --userId 'UYmtU2PJ' \
    --limit '10' \
    --offset '65' \
    > test.out 2>&1
eval_tap $? 47 'AdminGetContent' test.out

#- 48 AdminDeleteAllUserContents
./ng net.accelbyte.sdk.cli.Main ugc adminDeleteAllUserContents \
    --namespace "$AB_NAMESPACE" \
    --userId 'tfDG50Ts' \
    > test.out 2>&1
eval_tap $? 48 'AdminDeleteAllUserContents' test.out

#- 49 AdminHideUserContent
./ng net.accelbyte.sdk.cli.Main ugc adminHideUserContent \
    --contentId 'NzYPtGtR' \
    --namespace "$AB_NAMESPACE" \
    --userId 'aDwMlVxB' \
    --body '{"isHidden": false}' \
    > test.out 2>&1
eval_tap $? 49 'AdminHideUserContent' test.out

#- 50 AdminGetAllGroups
./ng net.accelbyte.sdk.cli.Main ugc adminGetAllGroups \
    --namespace "$AB_NAMESPACE" \
    --userId '52leHqXy' \
    --limit '62' \
    --offset '52' \
    > test.out 2>&1
eval_tap $? 50 'AdminGetAllGroups' test.out

#- 51 AdminDeleteAllUserGroup
./ng net.accelbyte.sdk.cli.Main ugc adminDeleteAllUserGroup \
    --namespace "$AB_NAMESPACE" \
    --userId '7cwb20Hc' \
    > test.out 2>&1
eval_tap $? 51 'AdminDeleteAllUserGroup' test.out

#- 52 AdminGetGroup
./ng net.accelbyte.sdk.cli.Main ugc adminGetGroup \
    --groupId '2Nfw6EjO' \
    --namespace "$AB_NAMESPACE" \
    --userId 'CLLj3rrr' \
    > test.out 2>&1
eval_tap $? 52 'AdminGetGroup' test.out

#- 53 AdminUpdateGroup
./ng net.accelbyte.sdk.cli.Main ugc adminUpdateGroup \
    --groupId 'TMuvTwzb' \
    --namespace "$AB_NAMESPACE" \
    --userId 'kR9Mrsd7' \
    --body '{"contents": ["jmddkZYU", "zz6efq9j", "WcmrtjBr"], "name": "l1oXUjLq"}' \
    > test.out 2>&1
eval_tap $? 53 'AdminUpdateGroup' test.out

#- 54 AdminDeleteGroup
./ng net.accelbyte.sdk.cli.Main ugc adminDeleteGroup \
    --groupId 'qMLgJkel' \
    --namespace "$AB_NAMESPACE" \
    --userId 'ylWeBM4s' \
    > test.out 2>&1
eval_tap $? 54 'AdminDeleteGroup' test.out

#- 55 AdminGetGroupContents
./ng net.accelbyte.sdk.cli.Main ugc adminGetGroupContents \
    --groupId 'd3o7D4eB' \
    --namespace "$AB_NAMESPACE" \
    --userId 'uTRNDj63' \
    --limit '39' \
    --offset '54' \
    > test.out 2>&1
eval_tap $? 55 'AdminGetGroupContents' test.out

#- 56 AdminDeleteAllUserStates
./ng net.accelbyte.sdk.cli.Main ugc adminDeleteAllUserStates \
    --namespace "$AB_NAMESPACE" \
    --userId 'tUEgnV1w' \
    > test.out 2>&1
eval_tap $? 56 'AdminDeleteAllUserStates' test.out

#- 57 SearchChannelSpecificContent
./ng net.accelbyte.sdk.cli.Main ugc searchChannelSpecificContent \
    --channelId 'pr5HBTYJ' \
    --namespace "$AB_NAMESPACE" \
    --creator 'nWCCXTCc' \
    --ishidden 'xI7EhVOR' \
    --isofficial '5NzjbJCM' \
    --limit '50' \
    --name 'AMo8yqG3' \
    --offset '81' \
    --orderby 'oiqH07xO' \
    --sortby 'ydELJBwD' \
    --subtype 'qGlzjryt' \
    --tags '2cWD31BY,eNfXjL5f,aXLMCdpz' \
    --type 'Gj7KvZax' \
    --userId 'HvHvj6D3' \
    > test.out 2>&1
eval_tap $? 57 'SearchChannelSpecificContent' test.out

#- 58 PublicSearchContent
./ng net.accelbyte.sdk.cli.Main ugc publicSearchContent \
    --namespace "$AB_NAMESPACE" \
    --creator 'NChwnNsC' \
    --ishidden 'gVavVyOs' \
    --isofficial 'EIC5shhv' \
    --limit '56' \
    --name '2Fwe6oz6' \
    --offset '84' \
    --orderby 'cV9ts6hD' \
    --sortby '3YpryjB6' \
    --subtype 'RQQP1BKE' \
    --tags 'RjoHToBT,nE0X50fx,297OOM7x' \
    --type 'aHeSbT6V' \
    --userId 'WbOflnke' \
    > test.out 2>&1
eval_tap $? 58 'PublicSearchContent' test.out

#- 59 PublicGetContentBulk
./ng net.accelbyte.sdk.cli.Main ugc publicGetContentBulk \
    --namespace "$AB_NAMESPACE" \
    --body '{"contentIds": ["ptLPLLgl", "seQKuDQS", "H8VlVbWc"]}' \
    > test.out 2>&1
eval_tap $? 59 'PublicGetContentBulk' test.out

#- 60 GetFollowedContent
./ng net.accelbyte.sdk.cli.Main ugc getFollowedContent \
    --namespace "$AB_NAMESPACE" \
    --limit '85' \
    --offset '31' \
    > test.out 2>&1
eval_tap $? 60 'GetFollowedContent' test.out

#- 61 GetLikedContent
./ng net.accelbyte.sdk.cli.Main ugc getLikedContent \
    --namespace "$AB_NAMESPACE" \
    --isofficial  \
    --limit '11' \
    --name '6Ujrw4t0' \
    --offset '8' \
    --orderby '7S1UxMZd' \
    --sortby 'Ht8ntmAA' \
    --subtype 'BN6Sw1EO' \
    --tags '3mhZmsnd,dm8bc96U,QpajLyzo' \
    --type 'ldZToo32' \
    > test.out 2>&1
eval_tap $? 61 'GetLikedContent' test.out

#- 62 PublicGetContentBulkByShareCodes
./ng net.accelbyte.sdk.cli.Main ugc publicGetContentBulkByShareCodes \
    --namespace "$AB_NAMESPACE" \
    --body '{"shareCodes": ["hFFnGP6p", "yoIkxdqI", "CMX3XVa1"]}' \
    > test.out 2>&1
eval_tap $? 62 'PublicGetContentBulkByShareCodes' test.out

#- 63 PublicDownloadContentByShareCode
./ng net.accelbyte.sdk.cli.Main ugc publicDownloadContentByShareCode \
    --namespace "$AB_NAMESPACE" \
    --shareCode '5bnFlYEp' \
    > test.out 2>&1
eval_tap $? 63 'PublicDownloadContentByShareCode' test.out

#- 64 PublicDownloadContentByContentID
./ng net.accelbyte.sdk.cli.Main ugc publicDownloadContentByContentID \
    --contentId 'fTsAL3uB' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 64 'PublicDownloadContentByContentID' test.out

#- 65 AddDownloadCount
./ng net.accelbyte.sdk.cli.Main ugc addDownloadCount \
    --contentId 'zPpmQIUM' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 65 'AddDownloadCount' test.out

#- 66 UpdateContentLikeStatus
./ng net.accelbyte.sdk.cli.Main ugc updateContentLikeStatus \
    --contentId 'SbEflgLJ' \
    --namespace "$AB_NAMESPACE" \
    --body '{"likeStatus": false}' \
    > test.out 2>&1
eval_tap $? 66 'UpdateContentLikeStatus' test.out

#- 67 PublicDownloadContentPreview
./ng net.accelbyte.sdk.cli.Main ugc publicDownloadContentPreview \
    --contentId 'UZiY4gWD' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 67 'PublicDownloadContentPreview' test.out

#- 68 GetTag
./ng net.accelbyte.sdk.cli.Main ugc getTag \
    --namespace "$AB_NAMESPACE" \
    --limit '33' \
    --offset '59' \
    > test.out 2>&1
eval_tap $? 68 'GetTag' test.out

#- 69 GetType
./ng net.accelbyte.sdk.cli.Main ugc getType \
    --namespace "$AB_NAMESPACE" \
    --limit '93' \
    --offset '23' \
    > test.out 2>&1
eval_tap $? 69 'GetType' test.out

#- 70 PublicSearchCreator
./ng net.accelbyte.sdk.cli.Main ugc publicSearchCreator \
    --namespace "$AB_NAMESPACE" \
    --limit '84' \
    --offset '32' \
    --orderby 'T6DfpHDZ' \
    --sortby '3xsuT4vj' \
    > test.out 2>&1
eval_tap $? 70 'PublicSearchCreator' test.out

#- 71 GetFollowedUsers
./ng net.accelbyte.sdk.cli.Main ugc getFollowedUsers \
    --namespace "$AB_NAMESPACE" \
    --limit '14' \
    --offset '10' \
    > test.out 2>&1
eval_tap $? 71 'GetFollowedUsers' test.out

#- 72 PublicGetCreator
./ng net.accelbyte.sdk.cli.Main ugc publicGetCreator \
    --namespace "$AB_NAMESPACE" \
    --userId 'wwxvIVQ1' \
    > test.out 2>&1
eval_tap $? 72 'PublicGetCreator' test.out

#- 73 GetChannels
./ng net.accelbyte.sdk.cli.Main ugc getChannels \
    --namespace "$AB_NAMESPACE" \
    --userId 'V0z3fygf' \
    --limit '62' \
    --name 'VD86KrnL' \
    --offset '17' \
    > test.out 2>&1
eval_tap $? 73 'GetChannels' test.out

#- 74 PublicCreateChannel
./ng net.accelbyte.sdk.cli.Main ugc publicCreateChannel \
    --namespace "$AB_NAMESPACE" \
    --userId 'aBFtULGQ' \
    --body '{"name": "5my2m5I9"}' \
    > test.out 2>&1
eval_tap $? 74 'PublicCreateChannel' test.out

#- 75 DeleteAllUserChannel
./ng net.accelbyte.sdk.cli.Main ugc deleteAllUserChannel \
    --namespace "$AB_NAMESPACE" \
    --userId '8dVdZSFR' \
    > test.out 2>&1
eval_tap $? 75 'DeleteAllUserChannel' test.out

#- 76 UpdateChannel
./ng net.accelbyte.sdk.cli.Main ugc updateChannel \
    --channelId 'pPWkNeAB' \
    --namespace "$AB_NAMESPACE" \
    --userId 'yzN9ljtl' \
    --body '{"name": "vmVVV9sv"}' \
    > test.out 2>&1
eval_tap $? 76 'UpdateChannel' test.out

#- 77 DeleteChannel
./ng net.accelbyte.sdk.cli.Main ugc deleteChannel \
    --channelId 'WXM1kXkw' \
    --namespace "$AB_NAMESPACE" \
    --userId 'hBa03ho5' \
    > test.out 2>&1
eval_tap $? 77 'DeleteChannel' test.out

#- 78 CreateContentDirect
eval_tap 0 78 'CreateContentDirect # SKIP deprecated' test.out

#- 79 CreateContentS3
./ng net.accelbyte.sdk.cli.Main ugc createContentS3 \
    --channelId 'OUv4QKY8' \
    --namespace "$AB_NAMESPACE" \
    --userId 'm9SjQRxR' \
    --body '{"contentType": "wSx0qE1W", "customAttributes": {"l3s1Q0gj": {}, "nhCl721Q": {}, "JcCJsKai": {}}, "fileExtension": "XrSDOE69", "name": "OdPpSlRU", "preview": "tCDl3uzh", "previewMetadata": {"previewContentType": "peFK48jY", "previewFileExtension": "ZVZzgIcF"}, "subType": "jT6Nejdg", "tags": ["S9xCTRgY", "PJ9TEXii", "63IZFLo5"], "type": "fCLpg5qW"}' \
    > test.out 2>&1
eval_tap $? 79 'CreateContentS3' test.out

#- 80 PublicUpdateContentByShareCode
./ng net.accelbyte.sdk.cli.Main ugc publicUpdateContentByShareCode \
    --channelId 'frHuYJWg' \
    --namespace "$AB_NAMESPACE" \
    --shareCode '65u37ere' \
    --userId 'vntaqtxq' \
    --body '{"contentType": "6hhnCKZD", "customAttributes": {"G0ItsWpx": {}, "bxLWRbbB": {}, "IEGtvy0A": {}}, "fileExtension": "VRprJsBG", "name": "O7b7JTZ6", "payload": "xtQXrQFh", "preview": "DmIZ5xTc", "previewMetadata": {"previewContentType": "mYfFR68a", "previewFileExtension": "ybqSHT78"}, "subType": "ZJ06X8Ea", "tags": ["nwueYJVZ", "6VBHD5Fn", "OOeJ4QNS"], "type": "ZK9zB1kl", "updateContentFile": false}' \
    > test.out 2>&1
eval_tap $? 80 'PublicUpdateContentByShareCode' test.out

#- 81 UpdateContentS3
./ng net.accelbyte.sdk.cli.Main ugc updateContentS3 \
    --channelId 'VCiRIM31' \
    --contentId 'XshzKGqa' \
    --namespace "$AB_NAMESPACE" \
    --userId 'tnEQQLbh' \
    --body '{"contentType": "hNXwU7BY", "customAttributes": {"tadG83Vt": {}, "ZnjYPzJl": {}, "fERNGKRE": {}}, "fileExtension": "LSpURmmU", "name": "2tsrAMPI", "payload": "ruSRcrGz", "preview": "LbJ6qGW7", "previewMetadata": {"previewContentType": "gia4fCso", "previewFileExtension": "olrBrPNX"}, "subType": "9z1h9Rjw", "tags": ["g20GRrhF", "seI3PaJO", "5KEMUd7M"], "type": "Id0EiHD0", "updateContentFile": true}' \
    > test.out 2>&1
eval_tap $? 81 'UpdateContentS3' test.out

#- 82 PublicDeleteContentByShareCode
./ng net.accelbyte.sdk.cli.Main ugc publicDeleteContentByShareCode \
    --channelId 'zoACWZK4' \
    --namespace "$AB_NAMESPACE" \
    --shareCode 'RLpH4d4N' \
    --userId 'eP2izH7G' \
    > test.out 2>&1
eval_tap $? 82 'PublicDeleteContentByShareCode' test.out

#- 83 UpdateContentDirect
eval_tap 0 83 'UpdateContentDirect # SKIP deprecated' test.out

#- 84 DeleteContent
./ng net.accelbyte.sdk.cli.Main ugc deleteContent \
    --channelId 'NUdCp1Rg' \
    --contentId 'z2oOjElI' \
    --namespace "$AB_NAMESPACE" \
    --userId 'KsLkYSgt' \
    > test.out 2>&1
eval_tap $? 84 'DeleteContent' test.out

#- 85 UpdateContentShareCode
./ng net.accelbyte.sdk.cli.Main ugc updateContentShareCode \
    --channelId 'yNJty33g' \
    --contentId 'hB8kDSBi' \
    --namespace "$AB_NAMESPACE" \
    --userId 'FPiuPPZ7' \
    --body '{"shareCode": "SyslnxWI"}' \
    > test.out 2>&1
eval_tap $? 85 'UpdateContentShareCode' test.out

#- 86 PublicGetUserContent
./ng net.accelbyte.sdk.cli.Main ugc publicGetUserContent \
    --namespace "$AB_NAMESPACE" \
    --userId 'AyByzC7V' \
    --limit '83' \
    --offset '86' \
    > test.out 2>&1
eval_tap $? 86 'PublicGetUserContent' test.out

#- 87 DeleteAllUserContents
./ng net.accelbyte.sdk.cli.Main ugc deleteAllUserContents \
    --namespace "$AB_NAMESPACE" \
    --userId 'FqwVeZCV' \
    > test.out 2>&1
eval_tap $? 87 'DeleteAllUserContents' test.out

#- 88 UpdateScreenshots
./ng net.accelbyte.sdk.cli.Main ugc updateScreenshots \
    --contentId 'nuWLWSPk' \
    --namespace "$AB_NAMESPACE" \
    --userId 'qtrB2ND6' \
    --body '{"screenshots": [{"description": "c19nRyLw", "screenshotId": "Wi1GvJrp"}, {"description": "uKmfzwYA", "screenshotId": "IKhGn1Ey"}, {"description": "vtoHGCCi", "screenshotId": "9phBHhQZ"}]}' \
    > test.out 2>&1
eval_tap $? 88 'UpdateScreenshots' test.out

#- 89 UploadContentScreenshot
./ng net.accelbyte.sdk.cli.Main ugc uploadContentScreenshot \
    --contentId 'yPqwwVFL' \
    --namespace "$AB_NAMESPACE" \
    --userId 'IoQe3kl0' \
    --body '{"screenshots": [{"contentType": "mvTcRNf2", "description": "kQGeHvqX", "fileExtension": "jpeg"}, {"contentType": "OuFnOzqU", "description": "F4Hqm8E4", "fileExtension": "bmp"}, {"contentType": "niRw0rfD", "description": "tbY4Pefs", "fileExtension": "bmp"}]}' \
    > test.out 2>&1
eval_tap $? 89 'UploadContentScreenshot' test.out

#- 90 DeleteContentScreenshot
./ng net.accelbyte.sdk.cli.Main ugc deleteContentScreenshot \
    --contentId '3Lm3YOf3' \
    --namespace "$AB_NAMESPACE" \
    --screenshotId 'MC9Z9v6V' \
    --userId 'yEa6SdUE' \
    > test.out 2>&1
eval_tap $? 90 'DeleteContentScreenshot' test.out

#- 91 UpdateUserFollowStatus
./ng net.accelbyte.sdk.cli.Main ugc updateUserFollowStatus \
    --namespace "$AB_NAMESPACE" \
    --userId 'izNE1rgD' \
    --body '{"followStatus": false}' \
    > test.out 2>&1
eval_tap $? 91 'UpdateUserFollowStatus' test.out

#- 92 GetPublicFollowers
./ng net.accelbyte.sdk.cli.Main ugc getPublicFollowers \
    --namespace "$AB_NAMESPACE" \
    --userId '56ucNltb' \
    --limit '78' \
    --offset '22' \
    > test.out 2>&1
eval_tap $? 92 'GetPublicFollowers' test.out

#- 93 GetPublicFollowing
./ng net.accelbyte.sdk.cli.Main ugc getPublicFollowing \
    --namespace "$AB_NAMESPACE" \
    --userId 'moNXqLXc' \
    --limit '56' \
    --offset '47' \
    > test.out 2>&1
eval_tap $? 93 'GetPublicFollowing' test.out

#- 94 GetGroups
./ng net.accelbyte.sdk.cli.Main ugc getGroups \
    --namespace "$AB_NAMESPACE" \
    --userId 'grPzkkBd' \
    --limit '85' \
    --offset '83' \
    > test.out 2>&1
eval_tap $? 94 'GetGroups' test.out

#- 95 CreateGroup
./ng net.accelbyte.sdk.cli.Main ugc createGroup \
    --namespace "$AB_NAMESPACE" \
    --userId 'Qy9havaE' \
    --body '{"contents": ["GH9a5PsU", "wMRTq9Qt", "a7SD90Lj"], "name": "WGJViott"}' \
    > test.out 2>&1
eval_tap $? 95 'CreateGroup' test.out

#- 96 DeleteAllUserGroup
./ng net.accelbyte.sdk.cli.Main ugc deleteAllUserGroup \
    --namespace "$AB_NAMESPACE" \
    --userId '0CjGRI5x' \
    > test.out 2>&1
eval_tap $? 96 'DeleteAllUserGroup' test.out

#- 97 GetGroup
./ng net.accelbyte.sdk.cli.Main ugc getGroup \
    --groupId 'PHvLLyQ2' \
    --namespace "$AB_NAMESPACE" \
    --userId 'WLCdHWgn' \
    > test.out 2>&1
eval_tap $? 97 'GetGroup' test.out

#- 98 UpdateGroup
./ng net.accelbyte.sdk.cli.Main ugc updateGroup \
    --groupId 'RSnzIY01' \
    --namespace "$AB_NAMESPACE" \
    --userId 'GpZTJ8A2' \
    --body '{"contents": ["CtGvFq2W", "S7l3ZrDr", "JDmG8da0"], "name": "AOOJGObo"}' \
    > test.out 2>&1
eval_tap $? 98 'UpdateGroup' test.out

#- 99 DeleteGroup
./ng net.accelbyte.sdk.cli.Main ugc deleteGroup \
    --groupId 'lGsQbMRE' \
    --namespace "$AB_NAMESPACE" \
    --userId 'Gf4uu0Wj' \
    > test.out 2>&1
eval_tap $? 99 'DeleteGroup' test.out

#- 100 GetGroupContent
./ng net.accelbyte.sdk.cli.Main ugc getGroupContent \
    --groupId '8yysd2Zn' \
    --namespace "$AB_NAMESPACE" \
    --userId 'LkmoQtRY' \
    --limit '33' \
    --offset '41' \
    > test.out 2>&1
eval_tap $? 100 'GetGroupContent' test.out

#- 101 DeleteAllUserStates
./ng net.accelbyte.sdk.cli.Main ugc deleteAllUserStates \
    --namespace "$AB_NAMESPACE" \
    --userId '5CpQHBLS' \
    > test.out 2>&1
eval_tap $? 101 'DeleteAllUserStates' test.out

#- 102 AdminGetContentByChannelIDV2
./ng net.accelbyte.sdk.cli.Main ugc adminGetContentByChannelIDV2 \
    --channelId 'ktPBThFP' \
    --namespace "$AB_NAMESPACE" \
    --limit '32' \
    --name 'ChbchiT5' \
    --offset '24' \
    --sortBy 'laPXwLmZ' \
    > test.out 2>&1
eval_tap $? 102 'AdminGetContentByChannelIDV2' test.out

#- 103 AdminCreateContentV2
./ng net.accelbyte.sdk.cli.Main ugc adminCreateContentV2 \
    --channelId 'WAyYek9c' \
    --namespace "$AB_NAMESPACE" \
    --body '{"contentType": "q8WAjrZw", "customAttributes": {"5px8xHGm": {}, "NwskvMTc": {}, "xmSnoWH4": {}}, "fileExtension": "mhdruHU2", "name": "HjAXobUF", "shareCode": "gKs3m45G", "subType": "KC7E6Ehj", "tags": ["aQhdD858", "HOUz3gof", "QxIKGyMn"], "type": "phizSvpU"}' \
    > test.out 2>&1
eval_tap $? 103 'AdminCreateContentV2' test.out

#- 104 AdminDeleteOfficialContentV2
./ng net.accelbyte.sdk.cli.Main ugc adminDeleteOfficialContentV2 \
    --channelId 'ZFTMIrfK' \
    --contentId 'qcfSXU8H' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 104 'AdminDeleteOfficialContentV2' test.out

#- 105 AdminUpdateOfficialContentV2
./ng net.accelbyte.sdk.cli.Main ugc adminUpdateOfficialContentV2 \
    --channelId 'gQLm5CWD' \
    --contentId 'pJwXmC5p' \
    --namespace "$AB_NAMESPACE" \
    --body '{"customAttributes": {"1S0qMyRT": {}, "zObVnzre": {}, "o2qTATBm": {}}, "name": "3bxcQwSy", "shareCode": "t2eRYjiz", "subType": "UIkgusGJ", "tags": ["KppW6NQT", "yRjaNQqD", "FbFHWQNh"], "type": "ZuzWhMqt"}' \
    > test.out 2>&1
eval_tap $? 105 'AdminUpdateOfficialContentV2' test.out

#- 106 AdminUpdateOfficialContentFileLocation
./ng net.accelbyte.sdk.cli.Main ugc adminUpdateOfficialContentFileLocation \
    --channelId '5mwg5PE9' \
    --contentId 'quVlTLgN' \
    --namespace "$AB_NAMESPACE" \
    --body '{"fileExtension": "Bdw82RR2", "fileLocation": "vT0Aud3J"}' \
    > test.out 2>&1
eval_tap $? 106 'AdminUpdateOfficialContentFileLocation' test.out

#- 107 AdminGenerateOfficialContentUploadURLV2
./ng net.accelbyte.sdk.cli.Main ugc adminGenerateOfficialContentUploadURLV2 \
    --channelId 'vbXSLLoY' \
    --contentId 'xKy1QcFG' \
    --namespace "$AB_NAMESPACE" \
    --body '{"contentType": "aBbjJ93S", "fileExtension": "RhsQVj0Y"}' \
    > test.out 2>&1
eval_tap $? 107 'AdminGenerateOfficialContentUploadURLV2' test.out

#- 108 AdminGetConfigs
./ng net.accelbyte.sdk.cli.Main ugc adminGetConfigs \
    --namespace "$AB_NAMESPACE" \
    --limit '91' \
    --offset '8' \
    > test.out 2>&1
eval_tap $? 108 'AdminGetConfigs' test.out

#- 109 AdminUpdateConfig
./ng net.accelbyte.sdk.cli.Main ugc adminUpdateConfig \
    --key 'vutD1wky' \
    --namespace "$AB_NAMESPACE" \
    --body '{"value": "oEvSmS4n"}' \
    > test.out 2>&1
eval_tap $? 109 'AdminUpdateConfig' test.out

#- 110 AdminListContentV2
./ng net.accelbyte.sdk.cli.Main ugc adminListContentV2 \
    --namespace "$AB_NAMESPACE" \
    --isOfficial  \
    --limit '85' \
    --name '2Xo1LeK3' \
    --offset '17' \
    --sortBy 'SMzdBHrs' \
    --subType '0Hk4yCbu' \
    --tags 'n3ikaAPZ,oOfqshFy,BDGK42F8' \
    --type '0UcsavP6' \
    > test.out 2>&1
eval_tap $? 110 'AdminListContentV2' test.out

#- 111 AdminBulkGetContentByIDsV2
./ng net.accelbyte.sdk.cli.Main ugc adminBulkGetContentByIDsV2 \
    --namespace "$AB_NAMESPACE" \
    --body '{"contentIds": ["4jFAim4I", "jxl6kSQw", "Nqn8mQCX"]}' \
    > test.out 2>&1
eval_tap $? 111 'AdminBulkGetContentByIDsV2' test.out

#- 112 AdminGetContentBulkByShareCodesV2
./ng net.accelbyte.sdk.cli.Main ugc adminGetContentBulkByShareCodesV2 \
    --namespace "$AB_NAMESPACE" \
    --body '{"shareCodes": ["3yi34U0w", "zd9GDo6M", "0INrmm62"]}' \
    > test.out 2>&1
eval_tap $? 112 'AdminGetContentBulkByShareCodesV2' test.out

#- 113 AdminGetContentByShareCodeV2
./ng net.accelbyte.sdk.cli.Main ugc adminGetContentByShareCodeV2 \
    --namespace "$AB_NAMESPACE" \
    --shareCode 'wywQCwun' \
    > test.out 2>&1
eval_tap $? 113 'AdminGetContentByShareCodeV2' test.out

#- 114 AdminGetContentByContentIDV2
./ng net.accelbyte.sdk.cli.Main ugc adminGetContentByContentIDV2 \
    --contentId '3zy69qHj' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 114 'AdminGetContentByContentIDV2' test.out

#- 115 RollbackContentVersionV2
./ng net.accelbyte.sdk.cli.Main ugc rollbackContentVersionV2 \
    --contentId 'ERgoenWx' \
    --namespace "$AB_NAMESPACE" \
    --versionId 'oSWCD3Ia' \
    > test.out 2>&1
eval_tap $? 115 'RollbackContentVersionV2' test.out

#- 116 AdminUpdateScreenshotsV2
./ng net.accelbyte.sdk.cli.Main ugc adminUpdateScreenshotsV2 \
    --contentId 'bvhqEYgA' \
    --namespace "$AB_NAMESPACE" \
    --body '{"screenshots": [{"description": "EF6pcKCV", "screenshotId": "aa6AcCdY"}, {"description": "AoE1OLiR", "screenshotId": "CTI6m1oP"}, {"description": "admscTjO", "screenshotId": "JZ6MuHKY"}]}' \
    > test.out 2>&1
eval_tap $? 116 'AdminUpdateScreenshotsV2' test.out

#- 117 AdminUploadContentScreenshotV2
./ng net.accelbyte.sdk.cli.Main ugc adminUploadContentScreenshotV2 \
    --contentId 'y5E9juA3' \
    --namespace "$AB_NAMESPACE" \
    --body '{"screenshots": [{"contentType": "QLmhzXZt", "description": "4gnK2EZT", "fileExtension": "jfif"}, {"contentType": "5Z5tcP8H", "description": "4Jd1ueJw", "fileExtension": "png"}, {"contentType": "KHcnp4xn", "description": "O1zThhwP", "fileExtension": "png"}]}' \
    > test.out 2>&1
eval_tap $? 117 'AdminUploadContentScreenshotV2' test.out

#- 118 AdminDeleteContentScreenshotV2
./ng net.accelbyte.sdk.cli.Main ugc adminDeleteContentScreenshotV2 \
    --contentId 'EkMIkgi0' \
    --namespace "$AB_NAMESPACE" \
    --screenshotId 'HTYVhqk1' \
    > test.out 2>&1
eval_tap $? 118 'AdminDeleteContentScreenshotV2' test.out

#- 119 ListContentVersionsV2
./ng net.accelbyte.sdk.cli.Main ugc listContentVersionsV2 \
    --contentId 'mbCDnecw' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 119 'ListContentVersionsV2' test.out

#- 120 AdminGetOfficialGroupContentsV2
./ng net.accelbyte.sdk.cli.Main ugc adminGetOfficialGroupContentsV2 \
    --groupId 's6SIPKkc' \
    --namespace "$AB_NAMESPACE" \
    --limit '29' \
    --offset '90' \
    > test.out 2>&1
eval_tap $? 120 'AdminGetOfficialGroupContentsV2' test.out

#- 121 AdminListStagingContents
./ng net.accelbyte.sdk.cli.Main ugc adminListStagingContents \
    --namespace "$AB_NAMESPACE" \
    --limit '71' \
    --offset '2' \
    --sortBy 'WaToMX8C' \
    --status 'GqWXW21p' \
    > test.out 2>&1
eval_tap $? 121 'AdminListStagingContents' test.out

#- 122 AdminGetStagingContentByID
./ng net.accelbyte.sdk.cli.Main ugc adminGetStagingContentByID \
    --contentId 'XCNMubqk' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 122 'AdminGetStagingContentByID' test.out

#- 123 AdminApproveStagingContent
./ng net.accelbyte.sdk.cli.Main ugc adminApproveStagingContent \
    --contentId 'p3pCXI6X' \
    --namespace "$AB_NAMESPACE" \
    --body '{"approved": false, "note": "n8miboZW"}' \
    > test.out 2>&1
eval_tap $? 123 'AdminApproveStagingContent' test.out

#- 124 AdminUpdateContentByShareCodeV2
./ng net.accelbyte.sdk.cli.Main ugc adminUpdateContentByShareCodeV2 \
    --channelId 'ilk2EpU1' \
    --namespace "$AB_NAMESPACE" \
    --shareCode 'tWwfofPS' \
    --userId 'z8csHb2B' \
    --body '{"customAttributes": {"gzSMQAAc": {}, "9W848UKm": {}, "tciOGgcc": {}}, "name": "5wXXvGhn", "shareCode": "oGRnnucK", "subType": "RKaxubU7", "tags": ["NqSOViHD", "SyDubpKN", "fr3Kzkhf"], "type": "x9y3ymNB"}' \
    > test.out 2>&1
eval_tap $? 124 'AdminUpdateContentByShareCodeV2' test.out

#- 125 AdminDeleteContentByShareCodeV2
./ng net.accelbyte.sdk.cli.Main ugc adminDeleteContentByShareCodeV2 \
    --channelId 'KO2ngqGP' \
    --namespace "$AB_NAMESPACE" \
    --shareCode 'hW2TJhzj' \
    --userId 'kvYmyzYF' \
    > test.out 2>&1
eval_tap $? 125 'AdminDeleteContentByShareCodeV2' test.out

#- 126 AdminDeleteUserContentV2
./ng net.accelbyte.sdk.cli.Main ugc adminDeleteUserContentV2 \
    --channelId 'uSFvlCfV' \
    --contentId 'P6Fznw1w' \
    --namespace "$AB_NAMESPACE" \
    --userId 'whoGjQrq' \
    > test.out 2>&1
eval_tap $? 126 'AdminDeleteUserContentV2' test.out

#- 127 AdminUpdateUserContentV2
./ng net.accelbyte.sdk.cli.Main ugc adminUpdateUserContentV2 \
    --channelId '85a1s689' \
    --contentId 'cTkjfB1E' \
    --namespace "$AB_NAMESPACE" \
    --userId 'adCXwopV' \
    --body '{"customAttributes": {"QjtGjD98": {}, "W2JpCmTO": {}, "BCjIyMCp": {}}, "name": "cC1N2b3H", "shareCode": "mdYEq74n", "subType": "1kytK09V", "tags": ["F8gDNWb0", "GOajJbC7", "O0S3cApG"], "type": "ACBkX0pe"}' \
    > test.out 2>&1
eval_tap $? 127 'AdminUpdateUserContentV2' test.out

#- 128 AdminUpdateUserContentFileLocation
./ng net.accelbyte.sdk.cli.Main ugc adminUpdateUserContentFileLocation \
    --channelId 'pXtsRuBp' \
    --contentId 'NxRZlM5b' \
    --namespace "$AB_NAMESPACE" \
    --userId 'U5G6envL' \
    --body '{"fileExtension": "f6qliQzd", "fileLocation": "3S8gox5G"}' \
    > test.out 2>&1
eval_tap $? 128 'AdminUpdateUserContentFileLocation' test.out

#- 129 AdminGenerateUserContentUploadURLV2
./ng net.accelbyte.sdk.cli.Main ugc adminGenerateUserContentUploadURLV2 \
    --channelId 'in8723H5' \
    --contentId 'gEoBqkl3' \
    --namespace "$AB_NAMESPACE" \
    --userId 'bNbuO6cM' \
    --body '{"contentType": "lNIf8DP6", "fileExtension": "wawsl9XI"}' \
    > test.out 2>&1
eval_tap $? 129 'AdminGenerateUserContentUploadURLV2' test.out

#- 130 AdminGetContentByUserIDV2
./ng net.accelbyte.sdk.cli.Main ugc adminGetContentByUserIDV2 \
    --namespace "$AB_NAMESPACE" \
    --userId 'ELgtwK1C' \
    --limit '64' \
    --offset '19' \
    --sortBy 'gywEFiBd' \
    > test.out 2>&1
eval_tap $? 130 'AdminGetContentByUserIDV2' test.out

#- 131 AdminUpdateContentHideStatusV2
./ng net.accelbyte.sdk.cli.Main ugc adminUpdateContentHideStatusV2 \
    --contentId 'jAy86ngM' \
    --namespace "$AB_NAMESPACE" \
    --userId 'cfA0fpxO' \
    --body '{"isHidden": false}' \
    > test.out 2>&1
eval_tap $? 131 'AdminUpdateContentHideStatusV2' test.out

#- 132 AdminGetUserGroupContentsV2
./ng net.accelbyte.sdk.cli.Main ugc adminGetUserGroupContentsV2 \
    --groupId 'eai4ZFfK' \
    --namespace "$AB_NAMESPACE" \
    --userId 'vhjRCebr' \
    --limit '4' \
    --offset '15' \
    > test.out 2>&1
eval_tap $? 132 'AdminGetUserGroupContentsV2' test.out

#- 133 AdminListUserStagingContents
./ng net.accelbyte.sdk.cli.Main ugc adminListUserStagingContents \
    --namespace "$AB_NAMESPACE" \
    --userId 'nWY7OfWU' \
    --limit '24' \
    --offset '96' \
    --sortBy '4B9JbZGE' \
    --status 'BRmA4DgM' \
    > test.out 2>&1
eval_tap $? 133 'AdminListUserStagingContents' test.out

#- 134 PublicGetContentByChannelIDV2
./ng net.accelbyte.sdk.cli.Main ugc publicGetContentByChannelIDV2 \
    --channelId 'E0SmSUW5' \
    --namespace "$AB_NAMESPACE" \
    --limit '98' \
    --name 'mqLm57sB' \
    --offset '42' \
    --sortBy '4bLrHM6s' \
    > test.out 2>&1
eval_tap $? 134 'PublicGetContentByChannelIDV2' test.out

#- 135 PublicListContentV2
./ng net.accelbyte.sdk.cli.Main ugc publicListContentV2 \
    --namespace "$AB_NAMESPACE" \
    --isOfficial  \
    --limit '16' \
    --name '16G6Q8tI' \
    --offset '51' \
    --sortBy 'HQaKIGmt' \
    --subType 'tTBsYayj' \
    --tags 'btrWaSUg,Uj0FhMq6,qMdKm76f' \
    --type 'rfLJWhm7' \
    > test.out 2>&1
eval_tap $? 135 'PublicListContentV2' test.out

#- 136 PublicBulkGetContentByIDV2
./ng net.accelbyte.sdk.cli.Main ugc publicBulkGetContentByIDV2 \
    --namespace "$AB_NAMESPACE" \
    --body '{"contentIds": ["0hUhWUCW", "DAg3L3fL", "tl3RpuLF"]}' \
    > test.out 2>&1
eval_tap $? 136 'PublicBulkGetContentByIDV2' test.out

#- 137 PublicGetContentBulkByShareCodesV2
./ng net.accelbyte.sdk.cli.Main ugc publicGetContentBulkByShareCodesV2 \
    --namespace "$AB_NAMESPACE" \
    --body '{"shareCodes": ["ZUH03rgV", "akwSecUa", "XNBOZ5id"]}' \
    > test.out 2>&1
eval_tap $? 137 'PublicGetContentBulkByShareCodesV2' test.out

#- 138 PublicGetContentByShareCodeV2
./ng net.accelbyte.sdk.cli.Main ugc publicGetContentByShareCodeV2 \
    --namespace "$AB_NAMESPACE" \
    --shareCode 'yK3rfa1e' \
    > test.out 2>&1
eval_tap $? 138 'PublicGetContentByShareCodeV2' test.out

#- 139 PublicGetContentByIDV2
./ng net.accelbyte.sdk.cli.Main ugc publicGetContentByIDV2 \
    --contentId 'okZawBpP' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 139 'PublicGetContentByIDV2' test.out

#- 140 PublicAddDownloadCountV2
./ng net.accelbyte.sdk.cli.Main ugc publicAddDownloadCountV2 \
    --contentId 'nSsvt8sj' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 140 'PublicAddDownloadCountV2' test.out

#- 141 PublicListContentDownloaderV2
./ng net.accelbyte.sdk.cli.Main ugc publicListContentDownloaderV2 \
    --contentId 'Y3BKqlDK' \
    --namespace "$AB_NAMESPACE" \
    --limit '40' \
    --offset '60' \
    --sortBy 'vS7ltANy' \
    --userId 'HO44ksic' \
    > test.out 2>&1
eval_tap $? 141 'PublicListContentDownloaderV2' test.out

#- 142 PublicListContentLikeV2
./ng net.accelbyte.sdk.cli.Main ugc publicListContentLikeV2 \
    --contentId 'sTIxiYR8' \
    --namespace "$AB_NAMESPACE" \
    --limit '93' \
    --offset '57' \
    --sortBy 'qjHDlJW7' \
    > test.out 2>&1
eval_tap $? 142 'PublicListContentLikeV2' test.out

#- 143 UpdateContentLikeStatusV2
./ng net.accelbyte.sdk.cli.Main ugc updateContentLikeStatusV2 \
    --contentId 'pOVnOFqL' \
    --namespace "$AB_NAMESPACE" \
    --body '{"likeStatus": false}' \
    > test.out 2>&1
eval_tap $? 143 'UpdateContentLikeStatusV2' test.out

#- 144 PublicCreateContentV2
./ng net.accelbyte.sdk.cli.Main ugc publicCreateContentV2 \
    --channelId 'oCXy1daT' \
    --namespace "$AB_NAMESPACE" \
    --userId 'QhypsNqB' \
    --body '{"contentType": "nFxUS2if", "customAttributes": {"hWoXjEWp": {}, "m4qAS9fu": {}, "G9yu4CXT": {}}, "fileExtension": "0EH0JBXR", "name": "y6PNANLL", "subType": "L2vWzERv", "tags": ["1FGm21mv", "n6g5QraT", "3naaDHIo"], "type": "DkzZOtAZ"}' \
    > test.out 2>&1
eval_tap $? 144 'PublicCreateContentV2' test.out

#- 145 PublicUpdateContentByShareCodeV2
./ng net.accelbyte.sdk.cli.Main ugc publicUpdateContentByShareCodeV2 \
    --channelId 'nIPHOs0x' \
    --namespace "$AB_NAMESPACE" \
    --shareCode 'cTEjWlid' \
    --userId 'DeVliakQ' \
    --body '{"customAttributes": {"PUh1UfCE": {}, "KmmBZujW": {}, "qKOJsXpp": {}}, "name": "AVCkC32A", "subType": "H7himT4m", "tags": ["NkymUFw4", "NO3cPbIt", "gO48o4aQ"], "type": "UiM0gLwk"}' \
    > test.out 2>&1
eval_tap $? 145 'PublicUpdateContentByShareCodeV2' test.out

#- 146 PublicDeleteContentByShareCodeV2
./ng net.accelbyte.sdk.cli.Main ugc publicDeleteContentByShareCodeV2 \
    --channelId 'se8TSCiq' \
    --namespace "$AB_NAMESPACE" \
    --shareCode 'q4zOXrEK' \
    --userId 'AaNwIqgP' \
    > test.out 2>&1
eval_tap $? 146 'PublicDeleteContentByShareCodeV2' test.out

#- 147 PublicDeleteContentV2
./ng net.accelbyte.sdk.cli.Main ugc publicDeleteContentV2 \
    --channelId 'Ts390Psk' \
    --contentId 'YJloOiYH' \
    --namespace "$AB_NAMESPACE" \
    --userId 'WqhAGaxq' \
    > test.out 2>&1
eval_tap $? 147 'PublicDeleteContentV2' test.out

#- 148 PublicUpdateContentV2
./ng net.accelbyte.sdk.cli.Main ugc publicUpdateContentV2 \
    --channelId 'bL7QvDDO' \
    --contentId 'CaX6ujGB' \
    --namespace "$AB_NAMESPACE" \
    --userId '7mlCR0Go' \
    --body '{"customAttributes": {"vaTS082q": {}, "7IO1UvFP": {}, "fnqurkEI": {}}, "name": "63oiy3yn", "subType": "0Li5KS7L", "tags": ["hJLTfI3q", "eajXLr4v", "WV7J71YZ"], "type": "fH1AdBbz"}' \
    > test.out 2>&1
eval_tap $? 148 'PublicUpdateContentV2' test.out

#- 149 PublicUpdateContentFileLocation
./ng net.accelbyte.sdk.cli.Main ugc publicUpdateContentFileLocation \
    --channelId '3SqEHpTJ' \
    --contentId 'rnc6aMd6' \
    --namespace "$AB_NAMESPACE" \
    --userId 'Zf1GZaNi' \
    --body '{"fileExtension": "q0IqVP88", "fileLocation": "V8RAo4ph"}' \
    > test.out 2>&1
eval_tap $? 149 'PublicUpdateContentFileLocation' test.out

#- 150 UpdateContentShareCodeV2
./ng net.accelbyte.sdk.cli.Main ugc updateContentShareCodeV2 \
    --channelId 'Nai9yIfH' \
    --contentId 'npACMfmT' \
    --namespace "$AB_NAMESPACE" \
    --userId 'WXKlsM4z' \
    --body '{"shareCode": "oFK3loqb"}' \
    > test.out 2>&1
eval_tap $? 150 'UpdateContentShareCodeV2' test.out

#- 151 PublicGenerateContentUploadURLV2
./ng net.accelbyte.sdk.cli.Main ugc publicGenerateContentUploadURLV2 \
    --channelId '18CxRnfM' \
    --contentId 'eTSboeAy' \
    --namespace "$AB_NAMESPACE" \
    --userId 'mqVPSs0J' \
    --body '{"contentType": "IbSzwwlv", "fileExtension": "8XlCXgmd"}' \
    > test.out 2>&1
eval_tap $? 151 'PublicGenerateContentUploadURLV2' test.out

#- 152 PublicGetContentByUserIDV2
./ng net.accelbyte.sdk.cli.Main ugc publicGetContentByUserIDV2 \
    --namespace "$AB_NAMESPACE" \
    --userId 'o69mMVsA' \
    --limit '25' \
    --offset '60' \
    --sortBy 'AiblqZXo' \
    > test.out 2>&1
eval_tap $? 152 'PublicGetContentByUserIDV2' test.out

#- 153 UpdateScreenshotsV2
./ng net.accelbyte.sdk.cli.Main ugc updateScreenshotsV2 \
    --contentId 'Yc5npIoQ' \
    --namespace "$AB_NAMESPACE" \
    --userId '4HpCN1Hx' \
    --body '{"screenshots": [{"description": "uoNWHe4K", "screenshotId": "UmDOnR8V"}, {"description": "n7FQL1pu", "screenshotId": "Deorj8YF"}, {"description": "3Ysy920L", "screenshotId": "eL2PP9eI"}]}' \
    > test.out 2>&1
eval_tap $? 153 'UpdateScreenshotsV2' test.out

#- 154 UploadContentScreenshotV2
./ng net.accelbyte.sdk.cli.Main ugc uploadContentScreenshotV2 \
    --contentId 'hJUPTFIG' \
    --namespace "$AB_NAMESPACE" \
    --userId 'lN1YhoV5' \
    --body '{"screenshots": [{"contentType": "E4kFmumI", "description": "L5y7xLhI", "fileExtension": "jfif"}, {"contentType": "UCra5ZeJ", "description": "Aol0zZ2w", "fileExtension": "jfif"}, {"contentType": "zflZZzF3", "description": "VZgnY96C", "fileExtension": "jfif"}]}' \
    > test.out 2>&1
eval_tap $? 154 'UploadContentScreenshotV2' test.out

#- 155 DeleteContentScreenshotV2
./ng net.accelbyte.sdk.cli.Main ugc deleteContentScreenshotV2 \
    --contentId 'R8nSZYsB' \
    --namespace "$AB_NAMESPACE" \
    --screenshotId 'iYuEXmwP' \
    --userId 'rGQX44XM' \
    > test.out 2>&1
eval_tap $? 155 'DeleteContentScreenshotV2' test.out

#- 156 PublicGetGroupContentsV2
./ng net.accelbyte.sdk.cli.Main ugc publicGetGroupContentsV2 \
    --groupId 'nfpvelne' \
    --namespace "$AB_NAMESPACE" \
    --userId 'TtDSv94M' \
    --limit '0' \
    --offset '42' \
    > test.out 2>&1
eval_tap $? 156 'PublicGetGroupContentsV2' test.out

#- 157 ListUserStagingContents
./ng net.accelbyte.sdk.cli.Main ugc listUserStagingContents \
    --namespace "$AB_NAMESPACE" \
    --userId '5PRWIJRA' \
    --limit '51' \
    --offset '95' \
    --sortBy 'AcIutebJ' \
    --status 'MGzUUWKR' \
    > test.out 2>&1
eval_tap $? 157 'ListUserStagingContents' test.out

#- 158 GetUserStagingContentByID
./ng net.accelbyte.sdk.cli.Main ugc getUserStagingContentByID \
    --contentId 'Zu0qmTAe' \
    --namespace "$AB_NAMESPACE" \
    --userId '8bRI5mBp' \
    > test.out 2>&1
eval_tap $? 158 'GetUserStagingContentByID' test.out

#- 159 UpdateStagingContent
./ng net.accelbyte.sdk.cli.Main ugc updateStagingContent \
    --contentId 'mab2UbFp' \
    --namespace "$AB_NAMESPACE" \
    --userId 'nr7JvQS7' \
    --body '{"fileExtension": "P4N9QtCI", "fileLocation": "HYSn8InW"}' \
    > test.out 2>&1
eval_tap $? 159 'UpdateStagingContent' test.out

#- 160 DeleteUserStagingContentByID
./ng net.accelbyte.sdk.cli.Main ugc deleteUserStagingContentByID \
    --contentId 'lHuxlsYr' \
    --namespace "$AB_NAMESPACE" \
    --userId 'HJafCP8k' \
    > test.out 2>&1
eval_tap $? 160 'DeleteUserStagingContentByID' test.out


rm -f "tmp.dat"

exit $EXIT_CODE