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
    --limit '36' \
    --offset '66' \
    > test.out 2>&1
eval_tap $? 2 'SingleAdminGetChannel' test.out

#- 3 AdminCreateChannel
./ng net.accelbyte.sdk.cli.Main ugc adminCreateChannel \
    --namespace "$AB_NAMESPACE" \
    --body '{"id": "xlHEulWw", "name": "ISmBj5yo"}' \
    > test.out 2>&1
eval_tap $? 3 'AdminCreateChannel' test.out

#- 4 SingleAdminUpdateChannel
./ng net.accelbyte.sdk.cli.Main ugc singleAdminUpdateChannel \
    --channelId 'SysIFHjn' \
    --namespace "$AB_NAMESPACE" \
    --body '{"name": "4NgyakY0"}' \
    > test.out 2>&1
eval_tap $? 4 'SingleAdminUpdateChannel' test.out

#- 5 SingleAdminDeleteChannel
./ng net.accelbyte.sdk.cli.Main ugc singleAdminDeleteChannel \
    --channelId 'i6k5CvBB' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 5 'SingleAdminDeleteChannel' test.out

#- 6 AdminUploadContentDirect
eval_tap 0 6 'AdminUploadContentDirect # SKIP deprecated' test.out

#- 7 AdminUploadContentS3
./ng net.accelbyte.sdk.cli.Main ugc adminUploadContentS3 \
    --channelId '7zpFSD15' \
    --namespace "$AB_NAMESPACE" \
    --body '{"contentType": "L2vI1IDD", "customAttributes": {"5IX1efBc": {}, "wueZyGp0": {}, "uf4qzpbF": {}}, "fileExtension": "xW1i44Vu", "name": "MXEJgxEz", "preview": "0wxC1UX0", "previewMetadata": {"previewContentType": "rUV5gYed", "previewFileExtension": "KiveO7GA"}, "shareCode": "yNYefC4v", "subType": "45v1JLVp", "tags": ["U5unfHip", "ownXxKjC", "Rp3mAykR"], "type": "a0rFeR5i"}' \
    > test.out 2>&1
eval_tap $? 7 'AdminUploadContentS3' test.out

#- 8 SingleAdminUpdateContentS3
./ng net.accelbyte.sdk.cli.Main ugc singleAdminUpdateContentS3 \
    --channelId 'f1x9gvGT' \
    --contentId '5WJOdUNp' \
    --namespace "$AB_NAMESPACE" \
    --body '{"contentType": "bjkphdtA", "customAttributes": {"NYJ7GnGI": {}, "k1Gd4ZIq": {}, "N05CvaDi": {}}, "fileExtension": "eWNhjfpF", "name": "wpT7vcAt", "payload": "4C9IE9id", "preview": "jPhDQyMv", "previewMetadata": {"previewContentType": "uCItKFoI", "previewFileExtension": "JugTMrln"}, "shareCode": "BWyOI6CN", "subType": "Dd8FG13y", "tags": ["h7a5LFcJ", "PfNYvvon", "3W1ur97S"], "type": "AIBjxBh3", "updateContentFile": true}' \
    > test.out 2>&1
eval_tap $? 8 'SingleAdminUpdateContentS3' test.out

#- 9 AdminSearchChannelSpecificContent
./ng net.accelbyte.sdk.cli.Main ugc adminSearchChannelSpecificContent \
    --channelId '7CrRvsPN' \
    --namespace "$AB_NAMESPACE" \
    --creator '2ltwB9Fg' \
    --ishidden 'wXTESQbI' \
    --isofficial 'y4lCkAR3' \
    --limit '80' \
    --name 'tydCavIY' \
    --offset '82' \
    --orderby 'wE1kgZRD' \
    --sortby 'vYODsR4B' \
    --subtype 'Pd8QhsUy' \
    --tags '2WitHTjJ,xvW3znf1,2FEVaCvN' \
    --type 'Gy4XX9BY' \
    --userId 'K579ojdH' \
    > test.out 2>&1
eval_tap $? 9 'AdminSearchChannelSpecificContent' test.out

#- 10 SingleAdminUpdateContentDirect
eval_tap 0 10 'SingleAdminUpdateContentDirect # SKIP deprecated' test.out

#- 11 SingleAdminDeleteContent
./ng net.accelbyte.sdk.cli.Main ugc singleAdminDeleteContent \
    --channelId 'rZAuceTb' \
    --contentId 'P7cqUPmE' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 11 'SingleAdminDeleteContent' test.out

#- 12 SingleAdminGetContent
./ng net.accelbyte.sdk.cli.Main ugc singleAdminGetContent \
    --namespace "$AB_NAMESPACE" \
    --limit '36' \
    --offset '83' \
    > test.out 2>&1
eval_tap $? 12 'SingleAdminGetContent' test.out

#- 13 AdminGetContentBulk
./ng net.accelbyte.sdk.cli.Main ugc adminGetContentBulk \
    --namespace "$AB_NAMESPACE" \
    --body '{"contentIds": ["MPWiLsW6", "3RQKthv6", "YjEicq6H"]}' \
    > test.out 2>&1
eval_tap $? 13 'AdminGetContentBulk' test.out

#- 14 AdminSearchContent
./ng net.accelbyte.sdk.cli.Main ugc adminSearchContent \
    --namespace "$AB_NAMESPACE" \
    --creator 'p08m25w4' \
    --ishidden 'qWfCuUIJ' \
    --isofficial 'EkY8Dt36' \
    --limit '22' \
    --name 'FQm6oMBw' \
    --offset '56' \
    --orderby 'dqCGMZuj' \
    --sortby '8p8qc4Xs' \
    --subtype 'R2yzmI7p' \
    --tags 'UdCwSbq4,9D68J0qV,a6WkbPkl' \
    --type 'A6cuwtlv' \
    --userId 'yrRMdpQB' \
    > test.out 2>&1
eval_tap $? 14 'AdminSearchContent' test.out

#- 15 AdminGetContentBulkByShareCodes
./ng net.accelbyte.sdk.cli.Main ugc adminGetContentBulkByShareCodes \
    --namespace "$AB_NAMESPACE" \
    --body '{"shareCodes": ["Vtu37bwW", "PYz3VyEn", "FIoJAPCS"]}' \
    > test.out 2>&1
eval_tap $? 15 'AdminGetContentBulkByShareCodes' test.out

#- 16 AdminGetUserContentByShareCode
./ng net.accelbyte.sdk.cli.Main ugc adminGetUserContentByShareCode \
    --namespace "$AB_NAMESPACE" \
    --shareCode 'tl8KvqT3' \
    > test.out 2>&1
eval_tap $? 16 'AdminGetUserContentByShareCode' test.out

#- 17 AdminGetSpecificContent
./ng net.accelbyte.sdk.cli.Main ugc adminGetSpecificContent \
    --contentId 'YDk5Qtas' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 17 'AdminGetSpecificContent' test.out

#- 18 AdminDownloadContentPreview
./ng net.accelbyte.sdk.cli.Main ugc adminDownloadContentPreview \
    --contentId 'OCFHY2KQ' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 18 'AdminDownloadContentPreview' test.out

#- 19 RollbackContentVersion
./ng net.accelbyte.sdk.cli.Main ugc rollbackContentVersion \
    --contentId 'GPPZiw3i' \
    --namespace "$AB_NAMESPACE" \
    --versionId 'YxWIOt0o' \
    > test.out 2>&1
eval_tap $? 19 'RollbackContentVersion' test.out

#- 20 AdminUpdateScreenshots
./ng net.accelbyte.sdk.cli.Main ugc adminUpdateScreenshots \
    --contentId 'blXebYkG' \
    --namespace "$AB_NAMESPACE" \
    --body '{"screenshots": [{"description": "rZdPQeB1", "screenshotId": "q8z2QvTw"}, {"description": "40NnDK4k", "screenshotId": "WZcyUghO"}, {"description": "wxgN9VUs", "screenshotId": "Wqv56Wnf"}]}' \
    > test.out 2>&1
eval_tap $? 20 'AdminUpdateScreenshots' test.out

#- 21 AdminUploadContentScreenshot
./ng net.accelbyte.sdk.cli.Main ugc adminUploadContentScreenshot \
    --contentId 'mX7K1sdZ' \
    --namespace "$AB_NAMESPACE" \
    --body '{"screenshots": [{"contentType": "LHFNsuyp", "description": "Fw6oIgt4", "fileExtension": "pjp"}, {"contentType": "BUJWdmWs", "description": "t2WEtD4K", "fileExtension": "png"}, {"contentType": "W6s6yMTe", "description": "xXIKXJMy", "fileExtension": "bmp"}]}' \
    > test.out 2>&1
eval_tap $? 21 'AdminUploadContentScreenshot' test.out

#- 22 AdminDeleteContentScreenshot
./ng net.accelbyte.sdk.cli.Main ugc adminDeleteContentScreenshot \
    --contentId 'XH2Ryg0A' \
    --namespace "$AB_NAMESPACE" \
    --screenshotId 'rKoBkOw3' \
    > test.out 2>&1
eval_tap $? 22 'AdminDeleteContentScreenshot' test.out

#- 23 ListContentVersions
./ng net.accelbyte.sdk.cli.Main ugc listContentVersions \
    --contentId 'VtouQWqq' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 23 'ListContentVersions' test.out

#- 24 SingleAdminGetAllGroups
./ng net.accelbyte.sdk.cli.Main ugc singleAdminGetAllGroups \
    --namespace "$AB_NAMESPACE" \
    --limit '68' \
    --offset '71' \
    > test.out 2>&1
eval_tap $? 24 'SingleAdminGetAllGroups' test.out

#- 25 AdminCreateGroup
./ng net.accelbyte.sdk.cli.Main ugc adminCreateGroup \
    --namespace "$AB_NAMESPACE" \
    --body '{"contents": ["unlrix4S", "6rrQvBd7", "E692bewO"], "name": "akWIvPx0"}' \
    > test.out 2>&1
eval_tap $? 25 'AdminCreateGroup' test.out

#- 26 SingleAdminGetGroup
./ng net.accelbyte.sdk.cli.Main ugc singleAdminGetGroup \
    --groupId '0DdjUVbD' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 26 'SingleAdminGetGroup' test.out

#- 27 SingleAdminUpdateGroup
./ng net.accelbyte.sdk.cli.Main ugc singleAdminUpdateGroup \
    --groupId 'BPHL5sZC' \
    --namespace "$AB_NAMESPACE" \
    --body '{"contents": ["tjTVTJQZ", "bYaAsa7M", "NOcSQPCv"], "name": "EOI8au0t"}' \
    > test.out 2>&1
eval_tap $? 27 'SingleAdminUpdateGroup' test.out

#- 28 SingleAdminDeleteGroup
./ng net.accelbyte.sdk.cli.Main ugc singleAdminDeleteGroup \
    --groupId 'nBZEtHhM' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 28 'SingleAdminDeleteGroup' test.out

#- 29 SingleAdminGetGroupContents
./ng net.accelbyte.sdk.cli.Main ugc singleAdminGetGroupContents \
    --groupId 'VJf5aP43' \
    --namespace "$AB_NAMESPACE" \
    --limit '24' \
    --offset '33' \
    > test.out 2>&1
eval_tap $? 29 'SingleAdminGetGroupContents' test.out

#- 30 AdminGetTag
./ng net.accelbyte.sdk.cli.Main ugc adminGetTag \
    --namespace "$AB_NAMESPACE" \
    --limit '61' \
    --offset '65' \
    > test.out 2>&1
eval_tap $? 30 'AdminGetTag' test.out

#- 31 AdminCreateTag
./ng net.accelbyte.sdk.cli.Main ugc adminCreateTag \
    --namespace "$AB_NAMESPACE" \
    --body '{"tag": "iDIq9Fjm"}' \
    > test.out 2>&1
eval_tap $? 31 'AdminCreateTag' test.out

#- 32 AdminUpdateTag
./ng net.accelbyte.sdk.cli.Main ugc adminUpdateTag \
    --namespace "$AB_NAMESPACE" \
    --tagId 'dH2uKBIw' \
    --body '{"tag": "OiHNQsdG"}' \
    > test.out 2>&1
eval_tap $? 32 'AdminUpdateTag' test.out

#- 33 AdminDeleteTag
./ng net.accelbyte.sdk.cli.Main ugc adminDeleteTag \
    --namespace "$AB_NAMESPACE" \
    --tagId 'QPK09bcK' \
    > test.out 2>&1
eval_tap $? 33 'AdminDeleteTag' test.out

#- 34 AdminGetType
./ng net.accelbyte.sdk.cli.Main ugc adminGetType \
    --namespace "$AB_NAMESPACE" \
    --limit '82' \
    --offset '6' \
    > test.out 2>&1
eval_tap $? 34 'AdminGetType' test.out

#- 35 AdminCreateType
./ng net.accelbyte.sdk.cli.Main ugc adminCreateType \
    --namespace "$AB_NAMESPACE" \
    --body '{"subtype": ["PqR9hnhq", "6FlVAdvt", "o4vCk4LI"], "type": "nMY5EUfa"}' \
    > test.out 2>&1
eval_tap $? 35 'AdminCreateType' test.out

#- 36 AdminUpdateType
./ng net.accelbyte.sdk.cli.Main ugc adminUpdateType \
    --namespace "$AB_NAMESPACE" \
    --typeId 'RR86TOCb' \
    --body '{"subtype": ["MQ4v9NB2", "kxhwP5dM", "pz1hea0U"], "type": "SHrkDmUc"}' \
    > test.out 2>&1
eval_tap $? 36 'AdminUpdateType' test.out

#- 37 AdminDeleteType
./ng net.accelbyte.sdk.cli.Main ugc adminDeleteType \
    --namespace "$AB_NAMESPACE" \
    --typeId 'TuTLrnp5' \
    > test.out 2>&1
eval_tap $? 37 'AdminDeleteType' test.out

#- 38 AdminGetChannel
./ng net.accelbyte.sdk.cli.Main ugc adminGetChannel \
    --namespace "$AB_NAMESPACE" \
    --userId '2NpxVXTL' \
    --limit '14' \
    --name 'TrE6T6kk' \
    --offset '39' \
    > test.out 2>&1
eval_tap $? 38 'AdminGetChannel' test.out

#- 39 AdminDeleteAllUserChannels
./ng net.accelbyte.sdk.cli.Main ugc adminDeleteAllUserChannels \
    --namespace "$AB_NAMESPACE" \
    --userId 'MZI1QsYx' \
    > test.out 2>&1
eval_tap $? 39 'AdminDeleteAllUserChannels' test.out

#- 40 AdminUpdateChannel
./ng net.accelbyte.sdk.cli.Main ugc adminUpdateChannel \
    --channelId 'iJubTpj9' \
    --namespace "$AB_NAMESPACE" \
    --userId 'IB2YNdbu' \
    --body '{"name": "KMgMiqFB"}' \
    > test.out 2>&1
eval_tap $? 40 'AdminUpdateChannel' test.out

#- 41 AdminDeleteChannel
./ng net.accelbyte.sdk.cli.Main ugc adminDeleteChannel \
    --channelId '2NOxptJV' \
    --namespace "$AB_NAMESPACE" \
    --userId 'yQMGAclR' \
    > test.out 2>&1
eval_tap $? 41 'AdminDeleteChannel' test.out

#- 42 AdminUpdateContentS3ByShareCode
./ng net.accelbyte.sdk.cli.Main ugc adminUpdateContentS3ByShareCode \
    --channelId 'p2jkGBZY' \
    --namespace "$AB_NAMESPACE" \
    --shareCode 'OTejiIAT' \
    --userId 'A9bMRyjD' \
    --body '{"contentType": "h2MsriQ4", "customAttributes": {"VdTDBBVT": {}, "Imle2kEX": {}, "mnud4m1i": {}}, "fileExtension": "WMf9Nrje", "name": "Gm50Adps", "payload": "1fRFhUtP", "preview": "vENaTOwI", "previewMetadata": {"previewContentType": "o0fZANQh", "previewFileExtension": "w0fK1EO0"}, "shareCode": "mA6bgyni", "subType": "rKk5Y64B", "tags": ["EMy1zTtv", "2PeEcf69", "INuS1g0L"], "type": "27FKnYxo", "updateContentFile": false}' \
    > test.out 2>&1
eval_tap $? 42 'AdminUpdateContentS3ByShareCode' test.out

#- 43 AdminUpdateContentS3
./ng net.accelbyte.sdk.cli.Main ugc adminUpdateContentS3 \
    --channelId 'bV5CoD23' \
    --contentId 'hvDoZ4Hp' \
    --namespace "$AB_NAMESPACE" \
    --userId 'lfI69kbK' \
    --body '{"contentType": "dpZVolrM", "customAttributes": {"KNncXSuA": {}, "ZLkqP0IE": {}, "cDROpO1L": {}}, "fileExtension": "mXHME4Tr", "name": "mYWmGHEi", "payload": "x9QVsNUf", "preview": "URcVG7r6", "previewMetadata": {"previewContentType": "NtRV2idn", "previewFileExtension": "LZNzsfAm"}, "shareCode": "gEtqJvsn", "subType": "UazAsIZV", "tags": ["axn9bC75", "Lwd5zC1B", "1sEvD8Mf"], "type": "BlntHFRB", "updateContentFile": true}' \
    > test.out 2>&1
eval_tap $? 43 'AdminUpdateContentS3' test.out

#- 44 DeleteContentByShareCode
./ng net.accelbyte.sdk.cli.Main ugc deleteContentByShareCode \
    --channelId 'ar6ChhDc' \
    --namespace "$AB_NAMESPACE" \
    --shareCode 'rX7mDTrU' \
    --userId 'dMqGRtuy' \
    > test.out 2>&1
eval_tap $? 44 'DeleteContentByShareCode' test.out

#- 45 AdminUpdateContentDirect
eval_tap 0 45 'AdminUpdateContentDirect # SKIP deprecated' test.out

#- 46 AdminDeleteContent
./ng net.accelbyte.sdk.cli.Main ugc adminDeleteContent \
    --channelId '21q8js6Q' \
    --contentId 'lcOUJfDr' \
    --namespace "$AB_NAMESPACE" \
    --userId 'wKfrRadA' \
    > test.out 2>&1
eval_tap $? 46 'AdminDeleteContent' test.out

#- 47 AdminGetContent
./ng net.accelbyte.sdk.cli.Main ugc adminGetContent \
    --namespace "$AB_NAMESPACE" \
    --userId 'etNuFQX8' \
    --limit '51' \
    --offset '59' \
    > test.out 2>&1
eval_tap $? 47 'AdminGetContent' test.out

#- 48 AdminDeleteAllUserContents
./ng net.accelbyte.sdk.cli.Main ugc adminDeleteAllUserContents \
    --namespace "$AB_NAMESPACE" \
    --userId '2xbiWDif' \
    > test.out 2>&1
eval_tap $? 48 'AdminDeleteAllUserContents' test.out

#- 49 AdminHideUserContent
./ng net.accelbyte.sdk.cli.Main ugc adminHideUserContent \
    --contentId '3PfJbX3F' \
    --namespace "$AB_NAMESPACE" \
    --userId 'r10vbUp1' \
    --body '{"isHidden": false}' \
    > test.out 2>&1
eval_tap $? 49 'AdminHideUserContent' test.out

#- 50 AdminGetAllGroups
./ng net.accelbyte.sdk.cli.Main ugc adminGetAllGroups \
    --namespace "$AB_NAMESPACE" \
    --userId 'hJAEBLFU' \
    --limit '35' \
    --offset '7' \
    > test.out 2>&1
eval_tap $? 50 'AdminGetAllGroups' test.out

#- 51 AdminDeleteAllUserGroup
./ng net.accelbyte.sdk.cli.Main ugc adminDeleteAllUserGroup \
    --namespace "$AB_NAMESPACE" \
    --userId 'xFVp6DTj' \
    > test.out 2>&1
eval_tap $? 51 'AdminDeleteAllUserGroup' test.out

#- 52 AdminGetGroup
./ng net.accelbyte.sdk.cli.Main ugc adminGetGroup \
    --groupId 'roPosVQS' \
    --namespace "$AB_NAMESPACE" \
    --userId 'q4sg6EyG' \
    > test.out 2>&1
eval_tap $? 52 'AdminGetGroup' test.out

#- 53 AdminUpdateGroup
./ng net.accelbyte.sdk.cli.Main ugc adminUpdateGroup \
    --groupId 'QfQx2ctA' \
    --namespace "$AB_NAMESPACE" \
    --userId 'ov5vS3Dq' \
    --body '{"contents": ["PDfnXLEN", "wyvWnbuL", "IMZPGcYv"], "name": "KaSU7ILN"}' \
    > test.out 2>&1
eval_tap $? 53 'AdminUpdateGroup' test.out

#- 54 AdminDeleteGroup
./ng net.accelbyte.sdk.cli.Main ugc adminDeleteGroup \
    --groupId 'zD8tJ16L' \
    --namespace "$AB_NAMESPACE" \
    --userId 'KiYJahVm' \
    > test.out 2>&1
eval_tap $? 54 'AdminDeleteGroup' test.out

#- 55 AdminGetGroupContents
./ng net.accelbyte.sdk.cli.Main ugc adminGetGroupContents \
    --groupId '2ZCStYh3' \
    --namespace "$AB_NAMESPACE" \
    --userId 'dTqZjwMC' \
    --limit '45' \
    --offset '92' \
    > test.out 2>&1
eval_tap $? 55 'AdminGetGroupContents' test.out

#- 56 AdminDeleteAllUserStates
./ng net.accelbyte.sdk.cli.Main ugc adminDeleteAllUserStates \
    --namespace "$AB_NAMESPACE" \
    --userId 'euMysIXo' \
    > test.out 2>&1
eval_tap $? 56 'AdminDeleteAllUserStates' test.out

#- 57 SearchChannelSpecificContent
./ng net.accelbyte.sdk.cli.Main ugc searchChannelSpecificContent \
    --channelId 'rhawipiV' \
    --namespace "$AB_NAMESPACE" \
    --creator 'hhSOhh92' \
    --ishidden 'pqwJBBnI' \
    --isofficial 'R6PLpMDo' \
    --limit '7' \
    --name 'c4cLqQyo' \
    --offset '87' \
    --orderby 'KO9YNC6I' \
    --sortby 'XasMw8tI' \
    --subtype '8YAVHjbM' \
    --tags 'jDaIbKXJ,Sq79hJ7c,F1NlGkNX' \
    --type 'W1zUPiNf' \
    --userId 'IT09bm7Y' \
    > test.out 2>&1
eval_tap $? 57 'SearchChannelSpecificContent' test.out

#- 58 PublicSearchContent
./ng net.accelbyte.sdk.cli.Main ugc publicSearchContent \
    --namespace "$AB_NAMESPACE" \
    --creator 'vVPhTkTx' \
    --ishidden '7FurKHc7' \
    --isofficial 'CZqUoxox' \
    --limit '53' \
    --name 'oChuHWVl' \
    --offset '26' \
    --orderby 'LXvmzRhz' \
    --sortby 'yDoIWHsu' \
    --subtype '7D3erUKd' \
    --tags 'tiGg20ht,PyHMnzEH,fmn9v8BC' \
    --type 'hHhN69r9' \
    --userId 'u6wIaKcs' \
    > test.out 2>&1
eval_tap $? 58 'PublicSearchContent' test.out

#- 59 PublicGetContentBulk
./ng net.accelbyte.sdk.cli.Main ugc publicGetContentBulk \
    --namespace "$AB_NAMESPACE" \
    --body '{"contentIds": ["Ex3r4CxH", "yPLN4raQ", "29ZlOJky"]}' \
    > test.out 2>&1
eval_tap $? 59 'PublicGetContentBulk' test.out

#- 60 GetFollowedContent
./ng net.accelbyte.sdk.cli.Main ugc getFollowedContent \
    --namespace "$AB_NAMESPACE" \
    --limit '22' \
    --offset '38' \
    > test.out 2>&1
eval_tap $? 60 'GetFollowedContent' test.out

#- 61 GetLikedContent
./ng net.accelbyte.sdk.cli.Main ugc getLikedContent \
    --namespace "$AB_NAMESPACE" \
    --isofficial  \
    --limit '77' \
    --name 'ePD4SsSF' \
    --offset '13' \
    --orderby 'IbzBnFLR' \
    --sortby '30CvqJg8' \
    --subtype 'pTVBYGgm' \
    --tags 'aPKycUCW,AZ5CYfkl,g2yBrGTW' \
    --type 'eb9ZUMyo' \
    > test.out 2>&1
eval_tap $? 61 'GetLikedContent' test.out

#- 62 PublicGetContentBulkByShareCodes
./ng net.accelbyte.sdk.cli.Main ugc publicGetContentBulkByShareCodes \
    --namespace "$AB_NAMESPACE" \
    --body '{"shareCodes": ["uZsklqQS", "B2DVsQbp", "zi7844bf"]}' \
    > test.out 2>&1
eval_tap $? 62 'PublicGetContentBulkByShareCodes' test.out

#- 63 PublicDownloadContentByShareCode
./ng net.accelbyte.sdk.cli.Main ugc publicDownloadContentByShareCode \
    --namespace "$AB_NAMESPACE" \
    --shareCode 'e5nkjndc' \
    > test.out 2>&1
eval_tap $? 63 'PublicDownloadContentByShareCode' test.out

#- 64 PublicDownloadContentByContentID
./ng net.accelbyte.sdk.cli.Main ugc publicDownloadContentByContentID \
    --contentId 'XBAgrvK9' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 64 'PublicDownloadContentByContentID' test.out

#- 65 AddDownloadCount
./ng net.accelbyte.sdk.cli.Main ugc addDownloadCount \
    --contentId '5hos3OML' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 65 'AddDownloadCount' test.out

#- 66 UpdateContentLikeStatus
./ng net.accelbyte.sdk.cli.Main ugc updateContentLikeStatus \
    --contentId 'OknL1kKj' \
    --namespace "$AB_NAMESPACE" \
    --body '{"likeStatus": true}' \
    > test.out 2>&1
eval_tap $? 66 'UpdateContentLikeStatus' test.out

#- 67 PublicDownloadContentPreview
./ng net.accelbyte.sdk.cli.Main ugc publicDownloadContentPreview \
    --contentId 'kCc2CLHs' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 67 'PublicDownloadContentPreview' test.out

#- 68 GetTag
./ng net.accelbyte.sdk.cli.Main ugc getTag \
    --namespace "$AB_NAMESPACE" \
    --limit '8' \
    --offset '14' \
    > test.out 2>&1
eval_tap $? 68 'GetTag' test.out

#- 69 GetType
./ng net.accelbyte.sdk.cli.Main ugc getType \
    --namespace "$AB_NAMESPACE" \
    --limit '88' \
    --offset '42' \
    > test.out 2>&1
eval_tap $? 69 'GetType' test.out

#- 70 PublicSearchCreator
./ng net.accelbyte.sdk.cli.Main ugc publicSearchCreator \
    --namespace "$AB_NAMESPACE" \
    --limit '38' \
    --offset '16' \
    --orderby 'q79WY1SE' \
    --sortby 'N1R8Kuy0' \
    > test.out 2>&1
eval_tap $? 70 'PublicSearchCreator' test.out

#- 71 GetFollowedUsers
./ng net.accelbyte.sdk.cli.Main ugc getFollowedUsers \
    --namespace "$AB_NAMESPACE" \
    --limit '71' \
    --offset '18' \
    > test.out 2>&1
eval_tap $? 71 'GetFollowedUsers' test.out

#- 72 PublicGetCreator
./ng net.accelbyte.sdk.cli.Main ugc publicGetCreator \
    --namespace "$AB_NAMESPACE" \
    --userId 'MUYJkTuy' \
    > test.out 2>&1
eval_tap $? 72 'PublicGetCreator' test.out

#- 73 GetChannels
./ng net.accelbyte.sdk.cli.Main ugc getChannels \
    --namespace "$AB_NAMESPACE" \
    --userId 'a4eNsc9i' \
    --limit '35' \
    --name 'wMypyBTU' \
    --offset '20' \
    > test.out 2>&1
eval_tap $? 73 'GetChannels' test.out

#- 74 PublicCreateChannel
./ng net.accelbyte.sdk.cli.Main ugc publicCreateChannel \
    --namespace "$AB_NAMESPACE" \
    --userId 'qxjl7Mvf' \
    --body '{"name": "F1gobVeH"}' \
    > test.out 2>&1
eval_tap $? 74 'PublicCreateChannel' test.out

#- 75 DeleteAllUserChannel
./ng net.accelbyte.sdk.cli.Main ugc deleteAllUserChannel \
    --namespace "$AB_NAMESPACE" \
    --userId 'h0Em9ID5' \
    > test.out 2>&1
eval_tap $? 75 'DeleteAllUserChannel' test.out

#- 76 UpdateChannel
./ng net.accelbyte.sdk.cli.Main ugc updateChannel \
    --channelId 'W8sfYC7e' \
    --namespace "$AB_NAMESPACE" \
    --userId 'LNr7FY5z' \
    --body '{"name": "zHCbgQBr"}' \
    > test.out 2>&1
eval_tap $? 76 'UpdateChannel' test.out

#- 77 DeleteChannel
./ng net.accelbyte.sdk.cli.Main ugc deleteChannel \
    --channelId 'HD9zcFG1' \
    --namespace "$AB_NAMESPACE" \
    --userId 'ljSl099r' \
    > test.out 2>&1
eval_tap $? 77 'DeleteChannel' test.out

#- 78 CreateContentDirect
eval_tap 0 78 'CreateContentDirect # SKIP deprecated' test.out

#- 79 CreateContentS3
./ng net.accelbyte.sdk.cli.Main ugc createContentS3 \
    --channelId 'p1J2GYlx' \
    --namespace "$AB_NAMESPACE" \
    --userId 'MxfikGgA' \
    --body '{"contentType": "FqarNQ3q", "customAttributes": {"F1l1pOd4": {}, "maFpqB7J": {}, "7Xfvy25f": {}}, "fileExtension": "q6k9HEmz", "name": "2kYCThri", "preview": "XGs24slp", "previewMetadata": {"previewContentType": "ImUdd1gS", "previewFileExtension": "uVRGPnuf"}, "subType": "TYVgQMU5", "tags": ["ZTWOTZp8", "0ffWWeSt", "iekQbDCk"], "type": "RNZTO0aK"}' \
    > test.out 2>&1
eval_tap $? 79 'CreateContentS3' test.out

#- 80 PublicUpdateContentByShareCode
./ng net.accelbyte.sdk.cli.Main ugc publicUpdateContentByShareCode \
    --channelId '7Aw48nha' \
    --namespace "$AB_NAMESPACE" \
    --shareCode 'ItuzakeQ' \
    --userId 'mvfMT2OO' \
    --body '{"contentType": "notICkJu", "customAttributes": {"vVnRv5Cn": {}, "EDwTMLrP": {}, "QMU3lqjm": {}}, "fileExtension": "Asqfijwz", "name": "YRNhTft3", "payload": "orp3FOXX", "preview": "8TjaknoO", "previewMetadata": {"previewContentType": "vUOqXxi1", "previewFileExtension": "s2fBFSiS"}, "subType": "wXfc0OLK", "tags": ["zP4IJdVt", "qptuuCM3", "1FyQGe1q"], "type": "H524HPoE", "updateContentFile": true}' \
    > test.out 2>&1
eval_tap $? 80 'PublicUpdateContentByShareCode' test.out

#- 81 UpdateContentS3
./ng net.accelbyte.sdk.cli.Main ugc updateContentS3 \
    --channelId 'DKHBpSLU' \
    --contentId 'il2PBfwu' \
    --namespace "$AB_NAMESPACE" \
    --userId 'zjcZRxBH' \
    --body '{"contentType": "gzu6xHlV", "customAttributes": {"4Sv5pkT2": {}, "SLLiJShx": {}, "HHvZtozx": {}}, "fileExtension": "d5n3WPOq", "name": "cAQRYoff", "payload": "blK1T63h", "preview": "fVnKcmr2", "previewMetadata": {"previewContentType": "A8JGxCFN", "previewFileExtension": "lPn0kRQp"}, "subType": "dxnx9HCe", "tags": ["qmZFQe5L", "FgqPxZb3", "ICAE9BQQ"], "type": "cSiTT4Cx", "updateContentFile": true}' \
    > test.out 2>&1
eval_tap $? 81 'UpdateContentS3' test.out

#- 82 PublicDeleteContentByShareCode
./ng net.accelbyte.sdk.cli.Main ugc publicDeleteContentByShareCode \
    --channelId 'uy0eKmPU' \
    --namespace "$AB_NAMESPACE" \
    --shareCode 'zjgkWgXE' \
    --userId '2fpboW6e' \
    > test.out 2>&1
eval_tap $? 82 'PublicDeleteContentByShareCode' test.out

#- 83 UpdateContentDirect
eval_tap 0 83 'UpdateContentDirect # SKIP deprecated' test.out

#- 84 DeleteContent
./ng net.accelbyte.sdk.cli.Main ugc deleteContent \
    --channelId 's3bpFrxN' \
    --contentId 'cOeDImQa' \
    --namespace "$AB_NAMESPACE" \
    --userId 'tJhzlNFH' \
    > test.out 2>&1
eval_tap $? 84 'DeleteContent' test.out

#- 85 UpdateContentShareCode
./ng net.accelbyte.sdk.cli.Main ugc updateContentShareCode \
    --channelId 'p7AvgNOd' \
    --contentId '1gXCbV6B' \
    --namespace "$AB_NAMESPACE" \
    --userId 'BIeuyVCh' \
    --body '{"shareCode": "zKI73q7z"}' \
    > test.out 2>&1
eval_tap $? 85 'UpdateContentShareCode' test.out

#- 86 PublicGetUserContent
./ng net.accelbyte.sdk.cli.Main ugc publicGetUserContent \
    --namespace "$AB_NAMESPACE" \
    --userId 'X3jQcseU' \
    --limit '36' \
    --offset '78' \
    > test.out 2>&1
eval_tap $? 86 'PublicGetUserContent' test.out

#- 87 DeleteAllUserContents
./ng net.accelbyte.sdk.cli.Main ugc deleteAllUserContents \
    --namespace "$AB_NAMESPACE" \
    --userId 'JjVdpyyR' \
    > test.out 2>&1
eval_tap $? 87 'DeleteAllUserContents' test.out

#- 88 UpdateScreenshots
./ng net.accelbyte.sdk.cli.Main ugc updateScreenshots \
    --contentId 'DlyFQtLb' \
    --namespace "$AB_NAMESPACE" \
    --userId 'avUX5881' \
    --body '{"screenshots": [{"description": "KJmgSBlZ", "screenshotId": "5wE3qM7Q"}, {"description": "mX2bviIL", "screenshotId": "W5E5XtvW"}, {"description": "QzdY3gKK", "screenshotId": "EWhvlsAU"}]}' \
    > test.out 2>&1
eval_tap $? 88 'UpdateScreenshots' test.out

#- 89 UploadContentScreenshot
./ng net.accelbyte.sdk.cli.Main ugc uploadContentScreenshot \
    --contentId 'Fo9cT14S' \
    --namespace "$AB_NAMESPACE" \
    --userId '5UOTuaU5' \
    --body '{"screenshots": [{"contentType": "fqHb8tIW", "description": "0wHpO0E9", "fileExtension": "pjp"}, {"contentType": "5FJcwfKo", "description": "OPaMY5cb", "fileExtension": "jfif"}, {"contentType": "p4GnfXPt", "description": "VZtopb5f", "fileExtension": "bmp"}]}' \
    > test.out 2>&1
eval_tap $? 89 'UploadContentScreenshot' test.out

#- 90 DeleteContentScreenshot
./ng net.accelbyte.sdk.cli.Main ugc deleteContentScreenshot \
    --contentId 'p84QHZyp' \
    --namespace "$AB_NAMESPACE" \
    --screenshotId '7B9ZFiI3' \
    --userId 'taoqMm4R' \
    > test.out 2>&1
eval_tap $? 90 'DeleteContentScreenshot' test.out

#- 91 UpdateUserFollowStatus
./ng net.accelbyte.sdk.cli.Main ugc updateUserFollowStatus \
    --namespace "$AB_NAMESPACE" \
    --userId 'hoJpQgaz' \
    --body '{"followStatus": true}' \
    > test.out 2>&1
eval_tap $? 91 'UpdateUserFollowStatus' test.out

#- 92 GetPublicFollowers
./ng net.accelbyte.sdk.cli.Main ugc getPublicFollowers \
    --namespace "$AB_NAMESPACE" \
    --userId 'nvXhLw1L' \
    --limit '48' \
    --offset '64' \
    > test.out 2>&1
eval_tap $? 92 'GetPublicFollowers' test.out

#- 93 GetPublicFollowing
./ng net.accelbyte.sdk.cli.Main ugc getPublicFollowing \
    --namespace "$AB_NAMESPACE" \
    --userId 'duFsCZcD' \
    --limit '68' \
    --offset '28' \
    > test.out 2>&1
eval_tap $? 93 'GetPublicFollowing' test.out

#- 94 GetGroups
./ng net.accelbyte.sdk.cli.Main ugc getGroups \
    --namespace "$AB_NAMESPACE" \
    --userId '6aKU0T3r' \
    --limit '39' \
    --offset '96' \
    > test.out 2>&1
eval_tap $? 94 'GetGroups' test.out

#- 95 CreateGroup
./ng net.accelbyte.sdk.cli.Main ugc createGroup \
    --namespace "$AB_NAMESPACE" \
    --userId '8hQHHT6M' \
    --body '{"contents": ["L4pyd0Xv", "QHemS4NB", "npim7cyD"], "name": "0EjRENUK"}' \
    > test.out 2>&1
eval_tap $? 95 'CreateGroup' test.out

#- 96 DeleteAllUserGroup
./ng net.accelbyte.sdk.cli.Main ugc deleteAllUserGroup \
    --namespace "$AB_NAMESPACE" \
    --userId 'kyihkzwE' \
    > test.out 2>&1
eval_tap $? 96 'DeleteAllUserGroup' test.out

#- 97 GetGroup
./ng net.accelbyte.sdk.cli.Main ugc getGroup \
    --groupId 'dHLcFd0W' \
    --namespace "$AB_NAMESPACE" \
    --userId 'xiPjXpRf' \
    > test.out 2>&1
eval_tap $? 97 'GetGroup' test.out

#- 98 UpdateGroup
./ng net.accelbyte.sdk.cli.Main ugc updateGroup \
    --groupId '1ytd0OVv' \
    --namespace "$AB_NAMESPACE" \
    --userId 'LWfDPUHG' \
    --body '{"contents": ["UFxuJeNu", "bvxA4WPR", "jSnUHqTm"], "name": "smcOKygB"}' \
    > test.out 2>&1
eval_tap $? 98 'UpdateGroup' test.out

#- 99 DeleteGroup
./ng net.accelbyte.sdk.cli.Main ugc deleteGroup \
    --groupId 'yysM6U4k' \
    --namespace "$AB_NAMESPACE" \
    --userId '5BHpHRnM' \
    > test.out 2>&1
eval_tap $? 99 'DeleteGroup' test.out

#- 100 GetGroupContent
./ng net.accelbyte.sdk.cli.Main ugc getGroupContent \
    --groupId 'qaDVJdFy' \
    --namespace "$AB_NAMESPACE" \
    --userId 'KwWqtTIP' \
    --limit '44' \
    --offset '66' \
    > test.out 2>&1
eval_tap $? 100 'GetGroupContent' test.out

#- 101 DeleteAllUserStates
./ng net.accelbyte.sdk.cli.Main ugc deleteAllUserStates \
    --namespace "$AB_NAMESPACE" \
    --userId '9iGoMK3d' \
    > test.out 2>&1
eval_tap $? 101 'DeleteAllUserStates' test.out

#- 102 AdminGetContentByChannelIDV2
./ng net.accelbyte.sdk.cli.Main ugc adminGetContentByChannelIDV2 \
    --channelId 'p0Zxetj4' \
    --namespace "$AB_NAMESPACE" \
    --limit '66' \
    --name 'srTxUxBZ' \
    --offset '3' \
    --sortBy 'fxnzc8Zt' \
    > test.out 2>&1
eval_tap $? 102 'AdminGetContentByChannelIDV2' test.out

#- 103 AdminCreateContentV2
./ng net.accelbyte.sdk.cli.Main ugc adminCreateContentV2 \
    --channelId 'jU6MrG9C' \
    --namespace "$AB_NAMESPACE" \
    --body '{"contentType": "qJI5hpMC", "customAttributes": {"YdSU1BB9": {}, "AzOZnWsA": {}, "qgGQi7TQ": {}}, "fileExtension": "M05ZhSCt", "name": "cPd94Pun", "shareCode": "SMtYX7gd", "subType": "ekRMZfrq", "tags": ["3rj6tMQO", "xhqICXWx", "EDgBEvYu"], "type": "MmLTwx8H"}' \
    > test.out 2>&1
eval_tap $? 103 'AdminCreateContentV2' test.out

#- 104 AdminDeleteOfficialContentV2
./ng net.accelbyte.sdk.cli.Main ugc adminDeleteOfficialContentV2 \
    --channelId '54Jb0Gxu' \
    --contentId 'BmrzfFy5' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 104 'AdminDeleteOfficialContentV2' test.out

#- 105 AdminUpdateOfficialContentV2
./ng net.accelbyte.sdk.cli.Main ugc adminUpdateOfficialContentV2 \
    --channelId 'Xg3RpnRf' \
    --contentId 'jVBFYcxH' \
    --namespace "$AB_NAMESPACE" \
    --body '{"customAttributes": {"S1gNVR9a": {}, "4QsPCjKy": {}, "MYqSCmyn": {}}, "name": "Pvo0dfV2", "shareCode": "bJxhoOij", "subType": "Na3AiyrV", "tags": ["HonA2PfQ", "mdMCEAjY", "tV87yeMC"], "type": "k4GfESc9"}' \
    > test.out 2>&1
eval_tap $? 105 'AdminUpdateOfficialContentV2' test.out

#- 106 AdminUpdateOfficialContentFileLocation
./ng net.accelbyte.sdk.cli.Main ugc adminUpdateOfficialContentFileLocation \
    --channelId 'CdOgIJk9' \
    --contentId '34A3BLYi' \
    --namespace "$AB_NAMESPACE" \
    --body '{"fileExtension": "hMLQlS7p", "fileLocation": "YBVWe5j2"}' \
    > test.out 2>&1
eval_tap $? 106 'AdminUpdateOfficialContentFileLocation' test.out

#- 107 AdminGenerateOfficialContentUploadURLV2
./ng net.accelbyte.sdk.cli.Main ugc adminGenerateOfficialContentUploadURLV2 \
    --channelId 'BHqpg2Fd' \
    --contentId '4ICIImbn' \
    --namespace "$AB_NAMESPACE" \
    --body '{"contentType": "0wdyjySF", "fileExtension": "OzkDOyVj"}' \
    > test.out 2>&1
eval_tap $? 107 'AdminGenerateOfficialContentUploadURLV2' test.out

#- 108 AdminGetConfigs
./ng net.accelbyte.sdk.cli.Main ugc adminGetConfigs \
    --namespace "$AB_NAMESPACE" \
    --limit '79' \
    --offset '22' \
    > test.out 2>&1
eval_tap $? 108 'AdminGetConfigs' test.out

#- 109 AdminUpdateConfig
./ng net.accelbyte.sdk.cli.Main ugc adminUpdateConfig \
    --key 'QBYFk7nz' \
    --namespace "$AB_NAMESPACE" \
    --body '{"value": "ctNt5n1S"}' \
    > test.out 2>&1
eval_tap $? 109 'AdminUpdateConfig' test.out

#- 110 AdminListContentV2
./ng net.accelbyte.sdk.cli.Main ugc adminListContentV2 \
    --namespace "$AB_NAMESPACE" \
    --isOfficial  \
    --limit '9' \
    --name '8PRAek2V' \
    --offset '6' \
    --sortBy '9OER49OQ' \
    --subType 'TEB3qjtT' \
    --tags 'TKb4dKaO,jo5aolMs,DrXSZSja' \
    --type '2EBwC41e' \
    > test.out 2>&1
eval_tap $? 110 'AdminListContentV2' test.out

#- 111 AdminBulkGetContentByIDsV2
./ng net.accelbyte.sdk.cli.Main ugc adminBulkGetContentByIDsV2 \
    --namespace "$AB_NAMESPACE" \
    --body '{"contentIds": ["LFLddxB6", "7Q7V9QvE", "7jO9bB6s"]}' \
    > test.out 2>&1
eval_tap $? 111 'AdminBulkGetContentByIDsV2' test.out

#- 112 AdminGetContentBulkByShareCodesV2
./ng net.accelbyte.sdk.cli.Main ugc adminGetContentBulkByShareCodesV2 \
    --namespace "$AB_NAMESPACE" \
    --body '{"shareCodes": ["vxU1dZJo", "Gem0ntrP", "rMNm20CL"]}' \
    > test.out 2>&1
eval_tap $? 112 'AdminGetContentBulkByShareCodesV2' test.out

#- 113 AdminGetContentByShareCodeV2
./ng net.accelbyte.sdk.cli.Main ugc adminGetContentByShareCodeV2 \
    --namespace "$AB_NAMESPACE" \
    --shareCode 'Oa6zfyha' \
    > test.out 2>&1
eval_tap $? 113 'AdminGetContentByShareCodeV2' test.out

#- 114 AdminGetContentByContentIDV2
./ng net.accelbyte.sdk.cli.Main ugc adminGetContentByContentIDV2 \
    --contentId 'u8LEbluK' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 114 'AdminGetContentByContentIDV2' test.out

#- 115 RollbackContentVersionV2
./ng net.accelbyte.sdk.cli.Main ugc rollbackContentVersionV2 \
    --contentId 'FW6iV3kl' \
    --namespace "$AB_NAMESPACE" \
    --versionId 'naR9FC5L' \
    > test.out 2>&1
eval_tap $? 115 'RollbackContentVersionV2' test.out

#- 116 AdminUpdateScreenshotsV2
./ng net.accelbyte.sdk.cli.Main ugc adminUpdateScreenshotsV2 \
    --contentId 'YX3OzbN3' \
    --namespace "$AB_NAMESPACE" \
    --body '{"screenshots": [{"description": "EsX3CqF8", "screenshotId": "GOrwPg2b"}, {"description": "qWwb0R26", "screenshotId": "5xQPEyNF"}, {"description": "MPy56Vgv", "screenshotId": "5Lnn3Lo0"}]}' \
    > test.out 2>&1
eval_tap $? 116 'AdminUpdateScreenshotsV2' test.out

#- 117 AdminUploadContentScreenshotV2
./ng net.accelbyte.sdk.cli.Main ugc adminUploadContentScreenshotV2 \
    --contentId 'oX2XbU6y' \
    --namespace "$AB_NAMESPACE" \
    --body '{"screenshots": [{"contentType": "Yw8Bg1GF", "description": "05S0VEuM", "fileExtension": "jfif"}, {"contentType": "YXfboshN", "description": "EQMVZA1C", "fileExtension": "jfif"}, {"contentType": "icCeXqrV", "description": "EknHQVbx", "fileExtension": "jpeg"}]}' \
    > test.out 2>&1
eval_tap $? 117 'AdminUploadContentScreenshotV2' test.out

#- 118 AdminDeleteContentScreenshotV2
./ng net.accelbyte.sdk.cli.Main ugc adminDeleteContentScreenshotV2 \
    --contentId '8VKowntP' \
    --namespace "$AB_NAMESPACE" \
    --screenshotId 'YDOsjRh1' \
    > test.out 2>&1
eval_tap $? 118 'AdminDeleteContentScreenshotV2' test.out

#- 119 ListContentVersionsV2
./ng net.accelbyte.sdk.cli.Main ugc listContentVersionsV2 \
    --contentId 'kQBfPbXk' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 119 'ListContentVersionsV2' test.out

#- 120 AdminGetOfficialGroupContentsV2
./ng net.accelbyte.sdk.cli.Main ugc adminGetOfficialGroupContentsV2 \
    --groupId 'N6Vi8y8O' \
    --namespace "$AB_NAMESPACE" \
    --limit '66' \
    --offset '15' \
    > test.out 2>&1
eval_tap $? 120 'AdminGetOfficialGroupContentsV2' test.out

#- 121 AdminListStagingContents
./ng net.accelbyte.sdk.cli.Main ugc adminListStagingContents \
    --namespace "$AB_NAMESPACE" \
    --limit '10' \
    --offset '17' \
    --sortBy 'IpOEp5ln' \
    --status 'th40zAp6' \
    > test.out 2>&1
eval_tap $? 121 'AdminListStagingContents' test.out

#- 122 AdminGetStagingContentByID
./ng net.accelbyte.sdk.cli.Main ugc adminGetStagingContentByID \
    --contentId 'rcjFhOtA' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 122 'AdminGetStagingContentByID' test.out

#- 123 AdminApproveStagingContent
./ng net.accelbyte.sdk.cli.Main ugc adminApproveStagingContent \
    --contentId 'delYpp9b' \
    --namespace "$AB_NAMESPACE" \
    --body '{"approved": false, "note": "wlT7iOxj"}' \
    > test.out 2>&1
eval_tap $? 123 'AdminApproveStagingContent' test.out

#- 124 AdminUpdateContentByShareCodeV2
./ng net.accelbyte.sdk.cli.Main ugc adminUpdateContentByShareCodeV2 \
    --channelId 'BwkCBUtP' \
    --namespace "$AB_NAMESPACE" \
    --shareCode 'gmmhxbL8' \
    --userId 'gJzZj0tg' \
    --body '{"customAttributes": {"fvRirj8c": {}, "YL6DzQRC": {}, "WBc58Gqy": {}}, "name": "fgytu9NR", "shareCode": "kYHKEblt", "subType": "vzkYquWf", "tags": ["qpKwJorv", "myyIuklJ", "lzYjacLD"], "type": "KuJXyYyp"}' \
    > test.out 2>&1
eval_tap $? 124 'AdminUpdateContentByShareCodeV2' test.out

#- 125 AdminDeleteContentByShareCodeV2
./ng net.accelbyte.sdk.cli.Main ugc adminDeleteContentByShareCodeV2 \
    --channelId 'rsO1EKZj' \
    --namespace "$AB_NAMESPACE" \
    --shareCode 'DrAUgtTo' \
    --userId 'dk9bNHuw' \
    > test.out 2>&1
eval_tap $? 125 'AdminDeleteContentByShareCodeV2' test.out

#- 126 AdminDeleteUserContentV2
./ng net.accelbyte.sdk.cli.Main ugc adminDeleteUserContentV2 \
    --channelId 'pEZDQK86' \
    --contentId '3bon50LS' \
    --namespace "$AB_NAMESPACE" \
    --userId 'O0gwdoGd' \
    > test.out 2>&1
eval_tap $? 126 'AdminDeleteUserContentV2' test.out

#- 127 AdminUpdateUserContentV2
./ng net.accelbyte.sdk.cli.Main ugc adminUpdateUserContentV2 \
    --channelId 'khvl6S2R' \
    --contentId 'G2zZryRJ' \
    --namespace "$AB_NAMESPACE" \
    --userId 'BbRtOWa5' \
    --body '{"customAttributes": {"jPnId6l7": {}, "qHMijR8q": {}, "j2isFSII": {}}, "name": "gYDdx8XW", "shareCode": "VCJk0f7r", "subType": "o1D8UAMX", "tags": ["fXDszhGF", "gI1spuQH", "7XlOxhlq"], "type": "bLU2ygDo"}' \
    > test.out 2>&1
eval_tap $? 127 'AdminUpdateUserContentV2' test.out

#- 128 AdminUpdateUserContentFileLocation
./ng net.accelbyte.sdk.cli.Main ugc adminUpdateUserContentFileLocation \
    --channelId '5gUywXLS' \
    --contentId 'lmYb4nmH' \
    --namespace "$AB_NAMESPACE" \
    --userId '57uaPZMH' \
    --body '{"fileExtension": "wf2p5AB5", "fileLocation": "iGReBbCr"}' \
    > test.out 2>&1
eval_tap $? 128 'AdminUpdateUserContentFileLocation' test.out

#- 129 AdminGenerateUserContentUploadURLV2
./ng net.accelbyte.sdk.cli.Main ugc adminGenerateUserContentUploadURLV2 \
    --channelId 'fcbRFmHe' \
    --contentId 'r1apcBwH' \
    --namespace "$AB_NAMESPACE" \
    --userId '1LL4D5dW' \
    --body '{"contentType": "AkTioLEM", "fileExtension": "aLKHeEhU"}' \
    > test.out 2>&1
eval_tap $? 129 'AdminGenerateUserContentUploadURLV2' test.out

#- 130 AdminGetContentByUserIDV2
./ng net.accelbyte.sdk.cli.Main ugc adminGetContentByUserIDV2 \
    --namespace "$AB_NAMESPACE" \
    --userId 'LpYLXTkm' \
    --limit '20' \
    --offset '0' \
    --sortBy 'n8XufpLa' \
    > test.out 2>&1
eval_tap $? 130 'AdminGetContentByUserIDV2' test.out

#- 131 AdminUpdateContentHideStatusV2
./ng net.accelbyte.sdk.cli.Main ugc adminUpdateContentHideStatusV2 \
    --contentId 'w4zjJazB' \
    --namespace "$AB_NAMESPACE" \
    --userId '0125cheh' \
    --body '{"isHidden": true}' \
    > test.out 2>&1
eval_tap $? 131 'AdminUpdateContentHideStatusV2' test.out

#- 132 AdminGetUserGroupContentsV2
./ng net.accelbyte.sdk.cli.Main ugc adminGetUserGroupContentsV2 \
    --groupId 'za6JAqef' \
    --namespace "$AB_NAMESPACE" \
    --userId 'AQQNNzEn' \
    --limit '28' \
    --offset '99' \
    > test.out 2>&1
eval_tap $? 132 'AdminGetUserGroupContentsV2' test.out

#- 133 AdminListUserStagingContents
./ng net.accelbyte.sdk.cli.Main ugc adminListUserStagingContents \
    --namespace "$AB_NAMESPACE" \
    --userId 'vBK4dxoe' \
    --limit '29' \
    --offset '72' \
    --sortBy 'uzaU2fZs' \
    --status 'AKGAfwq6' \
    > test.out 2>&1
eval_tap $? 133 'AdminListUserStagingContents' test.out

#- 134 PublicGetContentByChannelIDV2
./ng net.accelbyte.sdk.cli.Main ugc publicGetContentByChannelIDV2 \
    --channelId 'BdplhuNP' \
    --namespace "$AB_NAMESPACE" \
    --limit '62' \
    --name 'NXkvtnkQ' \
    --offset '52' \
    --sortBy 'A2C3h2WR' \
    > test.out 2>&1
eval_tap $? 134 'PublicGetContentByChannelIDV2' test.out

#- 135 PublicListContentV2
./ng net.accelbyte.sdk.cli.Main ugc publicListContentV2 \
    --namespace "$AB_NAMESPACE" \
    --isOfficial  \
    --limit '95' \
    --name 'btkxm1f6' \
    --offset '18' \
    --sortBy 'PUzvgQBW' \
    --subType 'TXLuEtcf' \
    --tags 'wYuuTeL4,LfTXeqbQ,WJ2xc4Kl' \
    --type 'FhdzSWE4' \
    > test.out 2>&1
eval_tap $? 135 'PublicListContentV2' test.out

#- 136 PublicBulkGetContentByIDV2
./ng net.accelbyte.sdk.cli.Main ugc publicBulkGetContentByIDV2 \
    --namespace "$AB_NAMESPACE" \
    --body '{"contentIds": ["7OLYSy8Y", "P9I9vuIh", "pNnCf14O"]}' \
    > test.out 2>&1
eval_tap $? 136 'PublicBulkGetContentByIDV2' test.out

#- 137 PublicGetContentBulkByShareCodesV2
./ng net.accelbyte.sdk.cli.Main ugc publicGetContentBulkByShareCodesV2 \
    --namespace "$AB_NAMESPACE" \
    --body '{"shareCodes": ["M5gejrfG", "otDqJl98", "IpZcClVd"]}' \
    > test.out 2>&1
eval_tap $? 137 'PublicGetContentBulkByShareCodesV2' test.out

#- 138 PublicGetContentByShareCodeV2
./ng net.accelbyte.sdk.cli.Main ugc publicGetContentByShareCodeV2 \
    --namespace "$AB_NAMESPACE" \
    --shareCode 'hPI5xwfz' \
    > test.out 2>&1
eval_tap $? 138 'PublicGetContentByShareCodeV2' test.out

#- 139 PublicGetContentByIDV2
./ng net.accelbyte.sdk.cli.Main ugc publicGetContentByIDV2 \
    --contentId 'kdosavZZ' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 139 'PublicGetContentByIDV2' test.out

#- 140 PublicAddDownloadCountV2
./ng net.accelbyte.sdk.cli.Main ugc publicAddDownloadCountV2 \
    --contentId 'NNbRPlCY' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 140 'PublicAddDownloadCountV2' test.out

#- 141 PublicListContentDownloaderV2
./ng net.accelbyte.sdk.cli.Main ugc publicListContentDownloaderV2 \
    --contentId 'xCOhvFnM' \
    --namespace "$AB_NAMESPACE" \
    --limit '55' \
    --offset '42' \
    --sortBy '6ZwGq44a' \
    --userId 'K3ughHAZ' \
    > test.out 2>&1
eval_tap $? 141 'PublicListContentDownloaderV2' test.out

#- 142 PublicListContentLikeV2
./ng net.accelbyte.sdk.cli.Main ugc publicListContentLikeV2 \
    --contentId 'unUEz2GI' \
    --namespace "$AB_NAMESPACE" \
    --limit '65' \
    --offset '1' \
    --sortBy 'G3qHHu2d' \
    > test.out 2>&1
eval_tap $? 142 'PublicListContentLikeV2' test.out

#- 143 UpdateContentLikeStatusV2
./ng net.accelbyte.sdk.cli.Main ugc updateContentLikeStatusV2 \
    --contentId 'ZC6TWsTa' \
    --namespace "$AB_NAMESPACE" \
    --body '{"likeStatus": false}' \
    > test.out 2>&1
eval_tap $? 143 'UpdateContentLikeStatusV2' test.out

#- 144 PublicCreateContentV2
./ng net.accelbyte.sdk.cli.Main ugc publicCreateContentV2 \
    --channelId 'GRTB8yJ5' \
    --namespace "$AB_NAMESPACE" \
    --userId 'EWxX21Ki' \
    --body '{"contentType": "GProIHaV", "customAttributes": {"2X5KdKxi": {}, "KNOHAmnm": {}, "5SHh3bjW": {}}, "fileExtension": "1cwbwt8A", "name": "vnoSscAD", "subType": "qA348eGd", "tags": ["wyG3P838", "8C2Rpaos", "Rz9sW98U"], "type": "eWiaWkbj"}' \
    > test.out 2>&1
eval_tap $? 144 'PublicCreateContentV2' test.out

#- 145 PublicUpdateContentByShareCodeV2
./ng net.accelbyte.sdk.cli.Main ugc publicUpdateContentByShareCodeV2 \
    --channelId 'NQFVbDIE' \
    --namespace "$AB_NAMESPACE" \
    --shareCode '7g10I8RY' \
    --userId 'v0ASBoi5' \
    --body '{"customAttributes": {"VKGj3fNo": {}, "Kir7cU7K": {}, "5WgeXzaA": {}}, "name": "fjRzVCcG", "subType": "u0lL98tt", "tags": ["064IpvGB", "BYTMQ2dp", "qgrTktpW"], "type": "nybEbKx3"}' \
    > test.out 2>&1
eval_tap $? 145 'PublicUpdateContentByShareCodeV2' test.out

#- 146 PublicDeleteContentByShareCodeV2
./ng net.accelbyte.sdk.cli.Main ugc publicDeleteContentByShareCodeV2 \
    --channelId 'KJsg7jFU' \
    --namespace "$AB_NAMESPACE" \
    --shareCode '7koxj6Jl' \
    --userId 'CkpBU5UC' \
    > test.out 2>&1
eval_tap $? 146 'PublicDeleteContentByShareCodeV2' test.out

#- 147 PublicDeleteContentV2
./ng net.accelbyte.sdk.cli.Main ugc publicDeleteContentV2 \
    --channelId 'gqBwEdGC' \
    --contentId '7vBGbx6w' \
    --namespace "$AB_NAMESPACE" \
    --userId 'qN63cPiR' \
    > test.out 2>&1
eval_tap $? 147 'PublicDeleteContentV2' test.out

#- 148 PublicUpdateContentV2
./ng net.accelbyte.sdk.cli.Main ugc publicUpdateContentV2 \
    --channelId 'F9R58LWR' \
    --contentId 'nCYhWB7i' \
    --namespace "$AB_NAMESPACE" \
    --userId 'qzfIUhYK' \
    --body '{"customAttributes": {"xMLVl3iW": {}, "rAvyRYQA": {}, "tZqjvRgM": {}}, "name": "fXemW5w0", "subType": "H53ybLg1", "tags": ["8mHnQoex", "AGMuJFP5", "fW1DBQ31"], "type": "s4jrTFb6"}' \
    > test.out 2>&1
eval_tap $? 148 'PublicUpdateContentV2' test.out

#- 149 PublicUpdateContentFileLocation
./ng net.accelbyte.sdk.cli.Main ugc publicUpdateContentFileLocation \
    --channelId '4Gs6XPRI' \
    --contentId 'tsJ3CdVj' \
    --namespace "$AB_NAMESPACE" \
    --userId 'LcQIzaEx' \
    --body '{"fileExtension": "YKkq8NHU", "fileLocation": "BZjYFptE"}' \
    > test.out 2>&1
eval_tap $? 149 'PublicUpdateContentFileLocation' test.out

#- 150 UpdateContentShareCodeV2
./ng net.accelbyte.sdk.cli.Main ugc updateContentShareCodeV2 \
    --channelId '86Ej07xL' \
    --contentId 'ZSdjxz11' \
    --namespace "$AB_NAMESPACE" \
    --userId 'Xb2VBMw8' \
    --body '{"shareCode": "5CcWAdCs"}' \
    > test.out 2>&1
eval_tap $? 150 'UpdateContentShareCodeV2' test.out

#- 151 PublicGenerateContentUploadURLV2
./ng net.accelbyte.sdk.cli.Main ugc publicGenerateContentUploadURLV2 \
    --channelId 'l7RTN9CJ' \
    --contentId 'gaZZYF2B' \
    --namespace "$AB_NAMESPACE" \
    --userId 'IRfiYTS3' \
    --body '{"contentType": "3tFj8HTt", "fileExtension": "J6srWrBD"}' \
    > test.out 2>&1
eval_tap $? 151 'PublicGenerateContentUploadURLV2' test.out

#- 152 PublicGetContentByUserIDV2
./ng net.accelbyte.sdk.cli.Main ugc publicGetContentByUserIDV2 \
    --namespace "$AB_NAMESPACE" \
    --userId 'M1ai323T' \
    --limit '1' \
    --offset '60' \
    --sortBy 'zY93G5PZ' \
    > test.out 2>&1
eval_tap $? 152 'PublicGetContentByUserIDV2' test.out

#- 153 UpdateScreenshotsV2
./ng net.accelbyte.sdk.cli.Main ugc updateScreenshotsV2 \
    --contentId '7BRkL3Ag' \
    --namespace "$AB_NAMESPACE" \
    --userId 'rR4FnwP1' \
    --body '{"screenshots": [{"description": "IZmkTF1D", "screenshotId": "LzYmB9K7"}, {"description": "RbfkCgUS", "screenshotId": "2y0QI7cY"}, {"description": "YQIjguum", "screenshotId": "5qC5wt2L"}]}' \
    > test.out 2>&1
eval_tap $? 153 'UpdateScreenshotsV2' test.out

#- 154 UploadContentScreenshotV2
./ng net.accelbyte.sdk.cli.Main ugc uploadContentScreenshotV2 \
    --contentId 'BGhTmLG9' \
    --namespace "$AB_NAMESPACE" \
    --userId 'f26XnQMr' \
    --body '{"screenshots": [{"contentType": "rXrt8sD9", "description": "b3YdT6E0", "fileExtension": "pjp"}, {"contentType": "PbTGXrPh", "description": "fQvN3sQ9", "fileExtension": "jpeg"}, {"contentType": "Y66QtpEA", "description": "yqXwglvG", "fileExtension": "jpeg"}]}' \
    > test.out 2>&1
eval_tap $? 154 'UploadContentScreenshotV2' test.out

#- 155 DeleteContentScreenshotV2
./ng net.accelbyte.sdk.cli.Main ugc deleteContentScreenshotV2 \
    --contentId 'hcd5Ulx9' \
    --namespace "$AB_NAMESPACE" \
    --screenshotId 'DrJIR5RQ' \
    --userId 'rkM8Xork' \
    > test.out 2>&1
eval_tap $? 155 'DeleteContentScreenshotV2' test.out

#- 156 PublicGetGroupContentsV2
./ng net.accelbyte.sdk.cli.Main ugc publicGetGroupContentsV2 \
    --groupId '9udtMhE0' \
    --namespace "$AB_NAMESPACE" \
    --userId 'oTkRBQEx' \
    --limit '54' \
    --offset '29' \
    > test.out 2>&1
eval_tap $? 156 'PublicGetGroupContentsV2' test.out

#- 157 ListUserStagingContents
./ng net.accelbyte.sdk.cli.Main ugc listUserStagingContents \
    --namespace "$AB_NAMESPACE" \
    --userId 'jnbFRlKV' \
    --limit '78' \
    --offset '77' \
    --sortBy 'dub7Isx0' \
    --status 'Rvssaa7O' \
    > test.out 2>&1
eval_tap $? 157 'ListUserStagingContents' test.out

#- 158 GetUserStagingContentByID
./ng net.accelbyte.sdk.cli.Main ugc getUserStagingContentByID \
    --contentId 'mtYh4CyB' \
    --namespace "$AB_NAMESPACE" \
    --userId 'zUDbaVPh' \
    > test.out 2>&1
eval_tap $? 158 'GetUserStagingContentByID' test.out

#- 159 UpdateStagingContent
./ng net.accelbyte.sdk.cli.Main ugc updateStagingContent \
    --contentId '2sYaRh49' \
    --namespace "$AB_NAMESPACE" \
    --userId '8HMJDgUJ' \
    --body '{"fileExtension": "0DvXPbse", "fileLocation": "ZR8Wc7Aj"}' \
    > test.out 2>&1
eval_tap $? 159 'UpdateStagingContent' test.out

#- 160 DeleteUserStagingContentByID
./ng net.accelbyte.sdk.cli.Main ugc deleteUserStagingContentByID \
    --contentId 'gKjnCbtf' \
    --namespace "$AB_NAMESPACE" \
    --userId 'W6Rcz9tJ' \
    > test.out 2>&1
eval_tap $? 160 'DeleteUserStagingContentByID' test.out


rm -f "tmp.dat"

exit $EXIT_CODE