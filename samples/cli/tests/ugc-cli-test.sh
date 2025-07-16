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
    --limit '46' \
    --offset '43' \
    > test.out 2>&1
eval_tap $? 2 'SingleAdminGetChannel' test.out

#- 3 AdminCreateChannel
./ng net.accelbyte.sdk.cli.Main ugc adminCreateChannel \
    --namespace "$AB_NAMESPACE" \
    --body '{"id": "1hGKnNd3", "name": "n6kaji8G"}' \
    > test.out 2>&1
eval_tap $? 3 'AdminCreateChannel' test.out

#- 4 SingleAdminUpdateChannel
./ng net.accelbyte.sdk.cli.Main ugc singleAdminUpdateChannel \
    --channelId 'HzfftkRi' \
    --namespace "$AB_NAMESPACE" \
    --body '{"name": "EQqodT6B"}' \
    > test.out 2>&1
eval_tap $? 4 'SingleAdminUpdateChannel' test.out

#- 5 SingleAdminDeleteChannel
./ng net.accelbyte.sdk.cli.Main ugc singleAdminDeleteChannel \
    --channelId 'oPUXYOml' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 5 'SingleAdminDeleteChannel' test.out

#- 6 AdminUploadContentDirect
eval_tap 0 6 'AdminUploadContentDirect # SKIP deprecated' test.out

#- 7 AdminUploadContentS3
./ng net.accelbyte.sdk.cli.Main ugc adminUploadContentS3 \
    --channelId 'SUhjjyyv' \
    --namespace "$AB_NAMESPACE" \
    --body '{"contentType": "KY8W0A5j", "customAttributes": {"zV0vtsne": {}, "VccVWT4v": {}, "JOBm7DcD": {}}, "fileExtension": "3C3sxEHM", "name": "u44xCMrB", "preview": "L6jx6eLB", "previewMetadata": {"previewContentType": "idch03vY", "previewFileExtension": "dxjaKkJl"}, "shareCode": "fOQgf3JG", "subType": "B44RPicB", "tags": ["Me9SLHmp", "f7wIJOQd", "wdTOihtx"], "type": "Npsknq6D"}' \
    > test.out 2>&1
eval_tap $? 7 'AdminUploadContentS3' test.out

#- 8 SingleAdminUpdateContentS3
./ng net.accelbyte.sdk.cli.Main ugc singleAdminUpdateContentS3 \
    --channelId 'EvGHNZZY' \
    --contentId 'Iv8n4lUT' \
    --namespace "$AB_NAMESPACE" \
    --body '{"contentType": "pcmYsJat", "customAttributes": {"RAJbMGQF": {}, "cAECboj4": {}, "N5BWetaf": {}}, "fileExtension": "D81pKxDA", "name": "WGAnPE6k", "payload": "3gxoEG89", "preview": "P9otDU1h", "previewMetadata": {"previewContentType": "kOBJX5cj", "previewFileExtension": "6gqnorQW"}, "shareCode": "jruzRP5a", "subType": "RQnlcdPE", "tags": ["ydpHfKjE", "MaeFtL6D", "shEkaTww"], "type": "1LTGW2KA", "updateContentFile": false}' \
    > test.out 2>&1
eval_tap $? 8 'SingleAdminUpdateContentS3' test.out

#- 9 AdminSearchChannelSpecificContent
./ng net.accelbyte.sdk.cli.Main ugc adminSearchChannelSpecificContent \
    --channelId 'IU2d3gvH' \
    --namespace "$AB_NAMESPACE" \
    --creator 'd3i9vhWB' \
    --ishidden 'koM2ok0X' \
    --isofficial 'fKkiW8Mf' \
    --limit '8' \
    --name 'l9DHoT9v' \
    --offset '63' \
    --orderby 'sNbESrzJ' \
    --sortby 'udBXK58M' \
    --subtype '9P4QAy2b' \
    --tags '0MVmoVKq,njXJE9tx,MP8cQbtt' \
    --type 'Yr9gbhnK' \
    --userId 'YaUExux4' \
    > test.out 2>&1
eval_tap $? 9 'AdminSearchChannelSpecificContent' test.out

#- 10 SingleAdminUpdateContentDirect
eval_tap 0 10 'SingleAdminUpdateContentDirect # SKIP deprecated' test.out

#- 11 SingleAdminDeleteContent
./ng net.accelbyte.sdk.cli.Main ugc singleAdminDeleteContent \
    --channelId 'FrZqFjDt' \
    --contentId '5IksV6yD' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 11 'SingleAdminDeleteContent' test.out

#- 12 SingleAdminGetContent
./ng net.accelbyte.sdk.cli.Main ugc singleAdminGetContent \
    --namespace "$AB_NAMESPACE" \
    --limit '40' \
    --offset '4' \
    > test.out 2>&1
eval_tap $? 12 'SingleAdminGetContent' test.out

#- 13 AdminGetContentBulk
./ng net.accelbyte.sdk.cli.Main ugc adminGetContentBulk \
    --namespace "$AB_NAMESPACE" \
    --body '{"contentIds": ["Fe0m2Zd0", "GhC84Utj", "0yjpTgpb"]}' \
    > test.out 2>&1
eval_tap $? 13 'AdminGetContentBulk' test.out

#- 14 AdminSearchContent
./ng net.accelbyte.sdk.cli.Main ugc adminSearchContent \
    --namespace "$AB_NAMESPACE" \
    --creator 'OkOZN1yK' \
    --ishidden 'tqkSNOPE' \
    --isofficial 'MNf6A250' \
    --limit '45' \
    --name 'VU9ZhDTS' \
    --offset '90' \
    --orderby 'JZlZ43Ez' \
    --sortby 'CIMiRRP2' \
    --subtype 'LahLliMJ' \
    --tags 'OSzHmN3Z,FwoUgQrI,hjzoJxVA' \
    --type '1BHjv6RU' \
    --userId 'zTkk7m66' \
    > test.out 2>&1
eval_tap $? 14 'AdminSearchContent' test.out

#- 15 AdminGetContentBulkByShareCodes
./ng net.accelbyte.sdk.cli.Main ugc adminGetContentBulkByShareCodes \
    --namespace "$AB_NAMESPACE" \
    --body '{"shareCodes": ["N3o2q02j", "M4XbUWUr", "TcVf03Zz"]}' \
    > test.out 2>&1
eval_tap $? 15 'AdminGetContentBulkByShareCodes' test.out

#- 16 AdminGetUserContentByShareCode
./ng net.accelbyte.sdk.cli.Main ugc adminGetUserContentByShareCode \
    --namespace "$AB_NAMESPACE" \
    --shareCode 'kO1vxGhY' \
    > test.out 2>&1
eval_tap $? 16 'AdminGetUserContentByShareCode' test.out

#- 17 AdminGetSpecificContent
./ng net.accelbyte.sdk.cli.Main ugc adminGetSpecificContent \
    --contentId 'nQ6eyQDj' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 17 'AdminGetSpecificContent' test.out

#- 18 AdminDownloadContentPreview
./ng net.accelbyte.sdk.cli.Main ugc adminDownloadContentPreview \
    --contentId 'kFFrJigi' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 18 'AdminDownloadContentPreview' test.out

#- 19 RollbackContentVersion
./ng net.accelbyte.sdk.cli.Main ugc rollbackContentVersion \
    --contentId '2kCc3xBz' \
    --namespace "$AB_NAMESPACE" \
    --versionId 'Hd4ywCTO' \
    > test.out 2>&1
eval_tap $? 19 'RollbackContentVersion' test.out

#- 20 AdminUpdateScreenshots
./ng net.accelbyte.sdk.cli.Main ugc adminUpdateScreenshots \
    --contentId '590yNxzv' \
    --namespace "$AB_NAMESPACE" \
    --body '{"screenshots": [{"description": "YK8uCrin", "screenshotId": "GFlWXeGj"}, {"description": "j7ytZCCm", "screenshotId": "ZnIqTDaT"}, {"description": "hgGe2Ue7", "screenshotId": "h8PHLbho"}]}' \
    > test.out 2>&1
eval_tap $? 20 'AdminUpdateScreenshots' test.out

#- 21 AdminUploadContentScreenshot
./ng net.accelbyte.sdk.cli.Main ugc adminUploadContentScreenshot \
    --contentId 'sXwYQpnr' \
    --namespace "$AB_NAMESPACE" \
    --body '{"screenshots": [{"contentType": "aqVEp2OL", "description": "W3Ek8T5D", "fileExtension": "bmp"}, {"contentType": "Tmz641md", "description": "D83EXubT", "fileExtension": "png"}, {"contentType": "aL8ZV1gl", "description": "HRhSInFX", "fileExtension": "bmp"}]}' \
    > test.out 2>&1
eval_tap $? 21 'AdminUploadContentScreenshot' test.out

#- 22 AdminDeleteContentScreenshot
./ng net.accelbyte.sdk.cli.Main ugc adminDeleteContentScreenshot \
    --contentId 'YC8YvvHc' \
    --namespace "$AB_NAMESPACE" \
    --screenshotId 'RY68xLwm' \
    > test.out 2>&1
eval_tap $? 22 'AdminDeleteContentScreenshot' test.out

#- 23 ListContentVersions
./ng net.accelbyte.sdk.cli.Main ugc listContentVersions \
    --contentId 'EFmxNK0F' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 23 'ListContentVersions' test.out

#- 24 SingleAdminGetAllGroups
./ng net.accelbyte.sdk.cli.Main ugc singleAdminGetAllGroups \
    --namespace "$AB_NAMESPACE" \
    --limit '20' \
    --offset '49' \
    > test.out 2>&1
eval_tap $? 24 'SingleAdminGetAllGroups' test.out

#- 25 AdminCreateGroup
./ng net.accelbyte.sdk.cli.Main ugc adminCreateGroup \
    --namespace "$AB_NAMESPACE" \
    --body '{"contents": ["eFVhdxtb", "jm1PNveX", "OnCQ6yFE"], "name": "UyrAIEZt"}' \
    > test.out 2>&1
eval_tap $? 25 'AdminCreateGroup' test.out

#- 26 SingleAdminGetGroup
./ng net.accelbyte.sdk.cli.Main ugc singleAdminGetGroup \
    --groupId 'QMzuoH7V' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 26 'SingleAdminGetGroup' test.out

#- 27 SingleAdminUpdateGroup
./ng net.accelbyte.sdk.cli.Main ugc singleAdminUpdateGroup \
    --groupId 'Kq44DWxQ' \
    --namespace "$AB_NAMESPACE" \
    --body '{"contents": ["xfrENBAG", "6e5aR6e8", "0FZZ4JCg"], "name": "7TwJLTs2"}' \
    > test.out 2>&1
eval_tap $? 27 'SingleAdminUpdateGroup' test.out

#- 28 SingleAdminDeleteGroup
./ng net.accelbyte.sdk.cli.Main ugc singleAdminDeleteGroup \
    --groupId 'imtXcwdQ' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 28 'SingleAdminDeleteGroup' test.out

#- 29 SingleAdminGetGroupContents
./ng net.accelbyte.sdk.cli.Main ugc singleAdminGetGroupContents \
    --groupId 'irXbinfW' \
    --namespace "$AB_NAMESPACE" \
    --limit '91' \
    --offset '34' \
    > test.out 2>&1
eval_tap $? 29 'SingleAdminGetGroupContents' test.out

#- 30 AdminGetTag
./ng net.accelbyte.sdk.cli.Main ugc adminGetTag \
    --namespace "$AB_NAMESPACE" \
    --limit '23' \
    --offset '72' \
    > test.out 2>&1
eval_tap $? 30 'AdminGetTag' test.out

#- 31 AdminCreateTag
./ng net.accelbyte.sdk.cli.Main ugc adminCreateTag \
    --namespace "$AB_NAMESPACE" \
    --body '{"tag": "poNGeFdn"}' \
    > test.out 2>&1
eval_tap $? 31 'AdminCreateTag' test.out

#- 32 AdminUpdateTag
./ng net.accelbyte.sdk.cli.Main ugc adminUpdateTag \
    --namespace "$AB_NAMESPACE" \
    --tagId 'HgiX8C3S' \
    --body '{"tag": "0HmXISjW"}' \
    > test.out 2>&1
eval_tap $? 32 'AdminUpdateTag' test.out

#- 33 AdminDeleteTag
./ng net.accelbyte.sdk.cli.Main ugc adminDeleteTag \
    --namespace "$AB_NAMESPACE" \
    --tagId 'IJP5XmIS' \
    > test.out 2>&1
eval_tap $? 33 'AdminDeleteTag' test.out

#- 34 AdminGetType
./ng net.accelbyte.sdk.cli.Main ugc adminGetType \
    --namespace "$AB_NAMESPACE" \
    --limit '17' \
    --offset '43' \
    > test.out 2>&1
eval_tap $? 34 'AdminGetType' test.out

#- 35 AdminCreateType
./ng net.accelbyte.sdk.cli.Main ugc adminCreateType \
    --namespace "$AB_NAMESPACE" \
    --body '{"subtype": ["y9Rz7RiG", "UCbfB1XM", "XfYKzo6B"], "type": "JHaGDv4x"}' \
    > test.out 2>&1
eval_tap $? 35 'AdminCreateType' test.out

#- 36 AdminUpdateType
./ng net.accelbyte.sdk.cli.Main ugc adminUpdateType \
    --namespace "$AB_NAMESPACE" \
    --typeId 'qrWzeMl6' \
    --body '{"subtype": ["tWL87o5g", "nCos9jTs", "YgSKlTDT"], "type": "IuJEQ2V7"}' \
    > test.out 2>&1
eval_tap $? 36 'AdminUpdateType' test.out

#- 37 AdminDeleteType
./ng net.accelbyte.sdk.cli.Main ugc adminDeleteType \
    --namespace "$AB_NAMESPACE" \
    --typeId 'GnYlZLg8' \
    > test.out 2>&1
eval_tap $? 37 'AdminDeleteType' test.out

#- 38 AdminGetChannel
./ng net.accelbyte.sdk.cli.Main ugc adminGetChannel \
    --namespace "$AB_NAMESPACE" \
    --userId '5X4jom4Q' \
    --limit '100' \
    --name 'bErkwsBi' \
    --offset '66' \
    > test.out 2>&1
eval_tap $? 38 'AdminGetChannel' test.out

#- 39 AdminDeleteAllUserChannels
./ng net.accelbyte.sdk.cli.Main ugc adminDeleteAllUserChannels \
    --namespace "$AB_NAMESPACE" \
    --userId '8Jxs06E6' \
    > test.out 2>&1
eval_tap $? 39 'AdminDeleteAllUserChannels' test.out

#- 40 AdminUpdateChannel
./ng net.accelbyte.sdk.cli.Main ugc adminUpdateChannel \
    --channelId '579R0DeO' \
    --namespace "$AB_NAMESPACE" \
    --userId 'WDdN4Gqq' \
    --body '{"name": "F9hSZYLV"}' \
    > test.out 2>&1
eval_tap $? 40 'AdminUpdateChannel' test.out

#- 41 AdminDeleteChannel
./ng net.accelbyte.sdk.cli.Main ugc adminDeleteChannel \
    --channelId 'rV35rDxe' \
    --namespace "$AB_NAMESPACE" \
    --userId 'yiEZM2Sj' \
    > test.out 2>&1
eval_tap $? 41 'AdminDeleteChannel' test.out

#- 42 AdminUpdateContentS3ByShareCode
./ng net.accelbyte.sdk.cli.Main ugc adminUpdateContentS3ByShareCode \
    --channelId 'OF79uCbX' \
    --namespace "$AB_NAMESPACE" \
    --shareCode 'EOw80mee' \
    --userId 'IQpYFyc7' \
    --body '{"contentType": "897K7NbK", "customAttributes": {"MosWYLMH": {}, "JaTsdBPL": {}, "I84Tx5vi": {}}, "fileExtension": "a6GpTqQD", "name": "aFpnZmhw", "payload": "9YNQ9MLC", "preview": "XALLUg8Q", "previewMetadata": {"previewContentType": "hamyRF3M", "previewFileExtension": "L3V9uSac"}, "shareCode": "hdMWgxSC", "subType": "qA1HbFLT", "tags": ["k6or8oeb", "IEJU8UxP", "TExIeJYs"], "type": "2Gq6eRvQ", "updateContentFile": false}' \
    > test.out 2>&1
eval_tap $? 42 'AdminUpdateContentS3ByShareCode' test.out

#- 43 AdminUpdateContentS3
./ng net.accelbyte.sdk.cli.Main ugc adminUpdateContentS3 \
    --channelId '6MSwT3W3' \
    --contentId 'SU41kyCm' \
    --namespace "$AB_NAMESPACE" \
    --userId '5pz5ABAb' \
    --body '{"contentType": "plBDPDxL", "customAttributes": {"nPEmnqlw": {}, "xEtG5kjk": {}, "LMV3yJgh": {}}, "fileExtension": "rxIAHMkG", "name": "yK4tytHa", "payload": "jLFZhrjb", "preview": "m1OwPh7F", "previewMetadata": {"previewContentType": "4kMKNHjy", "previewFileExtension": "arjp78sa"}, "shareCode": "z05M9qLH", "subType": "WjTF9lJc", "tags": ["BYZluHMD", "7xSvqVHq", "6RJQNiWR"], "type": "ge32ziiv", "updateContentFile": false}' \
    > test.out 2>&1
eval_tap $? 43 'AdminUpdateContentS3' test.out

#- 44 DeleteContentByShareCode
./ng net.accelbyte.sdk.cli.Main ugc deleteContentByShareCode \
    --channelId 'O67UiALh' \
    --namespace "$AB_NAMESPACE" \
    --shareCode 'aA9lj4Ie' \
    --userId 'qskniOVj' \
    > test.out 2>&1
eval_tap $? 44 'DeleteContentByShareCode' test.out

#- 45 AdminUpdateContentDirect
eval_tap 0 45 'AdminUpdateContentDirect # SKIP deprecated' test.out

#- 46 AdminDeleteContent
./ng net.accelbyte.sdk.cli.Main ugc adminDeleteContent \
    --channelId '79XQpSUB' \
    --contentId 'wbtG6Eam' \
    --namespace "$AB_NAMESPACE" \
    --userId 'nnv563x2' \
    > test.out 2>&1
eval_tap $? 46 'AdminDeleteContent' test.out

#- 47 AdminGetContent
./ng net.accelbyte.sdk.cli.Main ugc adminGetContent \
    --namespace "$AB_NAMESPACE" \
    --userId 'fN4Y9p5T' \
    --limit '40' \
    --offset '21' \
    > test.out 2>&1
eval_tap $? 47 'AdminGetContent' test.out

#- 48 AdminDeleteAllUserContents
./ng net.accelbyte.sdk.cli.Main ugc adminDeleteAllUserContents \
    --namespace "$AB_NAMESPACE" \
    --userId 'XnGCWi6B' \
    > test.out 2>&1
eval_tap $? 48 'AdminDeleteAllUserContents' test.out

#- 49 AdminHideUserContent
./ng net.accelbyte.sdk.cli.Main ugc adminHideUserContent \
    --contentId '8AZbdJs4' \
    --namespace "$AB_NAMESPACE" \
    --userId '0tHUJ3iN' \
    --body '{"isHidden": true}' \
    > test.out 2>&1
eval_tap $? 49 'AdminHideUserContent' test.out

#- 50 AdminGetAllGroups
./ng net.accelbyte.sdk.cli.Main ugc adminGetAllGroups \
    --namespace "$AB_NAMESPACE" \
    --userId 'ZKFQB6SO' \
    --limit '70' \
    --offset '68' \
    > test.out 2>&1
eval_tap $? 50 'AdminGetAllGroups' test.out

#- 51 AdminDeleteAllUserGroup
./ng net.accelbyte.sdk.cli.Main ugc adminDeleteAllUserGroup \
    --namespace "$AB_NAMESPACE" \
    --userId 'DVaznvNw' \
    > test.out 2>&1
eval_tap $? 51 'AdminDeleteAllUserGroup' test.out

#- 52 AdminGetGroup
./ng net.accelbyte.sdk.cli.Main ugc adminGetGroup \
    --groupId 'lShSYHuw' \
    --namespace "$AB_NAMESPACE" \
    --userId 'yKtjONKq' \
    > test.out 2>&1
eval_tap $? 52 'AdminGetGroup' test.out

#- 53 AdminUpdateGroup
./ng net.accelbyte.sdk.cli.Main ugc adminUpdateGroup \
    --groupId 'cLXNy6qi' \
    --namespace "$AB_NAMESPACE" \
    --userId 'dzLUKh62' \
    --body '{"contents": ["igJQxSV3", "bvgGCl3F", "BeEM0Dii"], "name": "Ckj33dHN"}' \
    > test.out 2>&1
eval_tap $? 53 'AdminUpdateGroup' test.out

#- 54 AdminDeleteGroup
./ng net.accelbyte.sdk.cli.Main ugc adminDeleteGroup \
    --groupId 'XTDiLoA2' \
    --namespace "$AB_NAMESPACE" \
    --userId 'rnYZJfSa' \
    > test.out 2>&1
eval_tap $? 54 'AdminDeleteGroup' test.out

#- 55 AdminGetGroupContents
./ng net.accelbyte.sdk.cli.Main ugc adminGetGroupContents \
    --groupId 'zTWvyRWH' \
    --namespace "$AB_NAMESPACE" \
    --userId '82jpRXDA' \
    --limit '92' \
    --offset '62' \
    > test.out 2>&1
eval_tap $? 55 'AdminGetGroupContents' test.out

#- 56 AdminDeleteAllUserStates
./ng net.accelbyte.sdk.cli.Main ugc adminDeleteAllUserStates \
    --namespace "$AB_NAMESPACE" \
    --userId '0YqU4Iea' \
    > test.out 2>&1
eval_tap $? 56 'AdminDeleteAllUserStates' test.out

#- 57 SearchChannelSpecificContent
./ng net.accelbyte.sdk.cli.Main ugc searchChannelSpecificContent \
    --channelId 'dD9uWr8Q' \
    --namespace "$AB_NAMESPACE" \
    --creator 'QRzvpMhq' \
    --ishidden 'ZOsfbl71' \
    --isofficial 'VgyzLCpG' \
    --limit '89' \
    --name '6uuUkgPt' \
    --offset '52' \
    --orderby '80Re5MIK' \
    --sortby 'McNPK3fB' \
    --subtype 'fz0Q6g1P' \
    --tags 'QMln0lEJ,uqcDkYSO,Uoix15CB' \
    --type 'rcbqNLZO' \
    --userId 'AJKiRPX0' \
    > test.out 2>&1
eval_tap $? 57 'SearchChannelSpecificContent' test.out

#- 58 PublicSearchContent
./ng net.accelbyte.sdk.cli.Main ugc publicSearchContent \
    --namespace "$AB_NAMESPACE" \
    --creator 'bjcMY946' \
    --ishidden 'cBhodHeV' \
    --isofficial 'e3YGUUFe' \
    --limit '72' \
    --name '5ocTTxhe' \
    --offset '93' \
    --orderby 'Tz2RacGu' \
    --sortby 'cl8eoNGj' \
    --subtype '1Q4yCsNO' \
    --tags 'tO4nj7Ce,Y97oBrtL,SavtWRz2' \
    --type 'Zp1OI9xU' \
    --userId 'd2Ozh1ui' \
    > test.out 2>&1
eval_tap $? 58 'PublicSearchContent' test.out

#- 59 PublicGetContentBulk
./ng net.accelbyte.sdk.cli.Main ugc publicGetContentBulk \
    --namespace "$AB_NAMESPACE" \
    --body '{"contentIds": ["lvoOFrYu", "NZdfNpv0", "DSm9jVeo"]}' \
    > test.out 2>&1
eval_tap $? 59 'PublicGetContentBulk' test.out

#- 60 GetFollowedContent
./ng net.accelbyte.sdk.cli.Main ugc getFollowedContent \
    --namespace "$AB_NAMESPACE" \
    --limit '14' \
    --offset '4' \
    > test.out 2>&1
eval_tap $? 60 'GetFollowedContent' test.out

#- 61 GetLikedContent
./ng net.accelbyte.sdk.cli.Main ugc getLikedContent \
    --namespace "$AB_NAMESPACE" \
    --isofficial  \
    --limit '87' \
    --name 'NUnUMJ2m' \
    --offset '90' \
    --orderby '87Gd7agB' \
    --sortby 'RXJ9pAzZ' \
    --subtype 'woZ54sUh' \
    --tags '1l5iU7Iy,ys8VOI84,mDtV4xeP' \
    --type 'iYkkXiqC' \
    > test.out 2>&1
eval_tap $? 61 'GetLikedContent' test.out

#- 62 PublicGetContentBulkByShareCodes
./ng net.accelbyte.sdk.cli.Main ugc publicGetContentBulkByShareCodes \
    --namespace "$AB_NAMESPACE" \
    --body '{"shareCodes": ["RupBkvlO", "TbV1LmIg", "nSS7aQGz"]}' \
    > test.out 2>&1
eval_tap $? 62 'PublicGetContentBulkByShareCodes' test.out

#- 63 PublicDownloadContentByShareCode
./ng net.accelbyte.sdk.cli.Main ugc publicDownloadContentByShareCode \
    --namespace "$AB_NAMESPACE" \
    --shareCode 'ZXOKxRy0' \
    > test.out 2>&1
eval_tap $? 63 'PublicDownloadContentByShareCode' test.out

#- 64 PublicDownloadContentByContentID
./ng net.accelbyte.sdk.cli.Main ugc publicDownloadContentByContentID \
    --contentId 'wR153TvX' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 64 'PublicDownloadContentByContentID' test.out

#- 65 AddDownloadCount
./ng net.accelbyte.sdk.cli.Main ugc addDownloadCount \
    --contentId 'ZNs59Zam' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 65 'AddDownloadCount' test.out

#- 66 UpdateContentLikeStatus
./ng net.accelbyte.sdk.cli.Main ugc updateContentLikeStatus \
    --contentId '4qIjbs4L' \
    --namespace "$AB_NAMESPACE" \
    --body '{"likeStatus": true}' \
    > test.out 2>&1
eval_tap $? 66 'UpdateContentLikeStatus' test.out

#- 67 PublicDownloadContentPreview
./ng net.accelbyte.sdk.cli.Main ugc publicDownloadContentPreview \
    --contentId 'BPZ5mxIU' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 67 'PublicDownloadContentPreview' test.out

#- 68 GetTag
./ng net.accelbyte.sdk.cli.Main ugc getTag \
    --namespace "$AB_NAMESPACE" \
    --limit '11' \
    --offset '91' \
    > test.out 2>&1
eval_tap $? 68 'GetTag' test.out

#- 69 GetType
./ng net.accelbyte.sdk.cli.Main ugc getType \
    --namespace "$AB_NAMESPACE" \
    --limit '56' \
    --offset '36' \
    > test.out 2>&1
eval_tap $? 69 'GetType' test.out

#- 70 PublicSearchCreator
./ng net.accelbyte.sdk.cli.Main ugc publicSearchCreator \
    --namespace "$AB_NAMESPACE" \
    --limit '19' \
    --offset '82' \
    --orderby 'WAKVG2gs' \
    --sortby 'i46TgrpL' \
    > test.out 2>&1
eval_tap $? 70 'PublicSearchCreator' test.out

#- 71 GetFollowedUsers
./ng net.accelbyte.sdk.cli.Main ugc getFollowedUsers \
    --namespace "$AB_NAMESPACE" \
    --limit '46' \
    --offset '55' \
    > test.out 2>&1
eval_tap $? 71 'GetFollowedUsers' test.out

#- 72 PublicGetCreator
./ng net.accelbyte.sdk.cli.Main ugc publicGetCreator \
    --namespace "$AB_NAMESPACE" \
    --userId 'pthkHMmg' \
    > test.out 2>&1
eval_tap $? 72 'PublicGetCreator' test.out

#- 73 GetChannels
./ng net.accelbyte.sdk.cli.Main ugc getChannels \
    --namespace "$AB_NAMESPACE" \
    --userId 'S1tG7Ps5' \
    --limit '6' \
    --name 'sEL86zAN' \
    --offset '32' \
    > test.out 2>&1
eval_tap $? 73 'GetChannels' test.out

#- 74 PublicCreateChannel
./ng net.accelbyte.sdk.cli.Main ugc publicCreateChannel \
    --namespace "$AB_NAMESPACE" \
    --userId 'igtI7sgm' \
    --body '{"name": "qz3aqzbI"}' \
    > test.out 2>&1
eval_tap $? 74 'PublicCreateChannel' test.out

#- 75 DeleteAllUserChannel
./ng net.accelbyte.sdk.cli.Main ugc deleteAllUserChannel \
    --namespace "$AB_NAMESPACE" \
    --userId 'n4i72x3R' \
    > test.out 2>&1
eval_tap $? 75 'DeleteAllUserChannel' test.out

#- 76 UpdateChannel
./ng net.accelbyte.sdk.cli.Main ugc updateChannel \
    --channelId 'J6BzjuPl' \
    --namespace "$AB_NAMESPACE" \
    --userId 'wfQTwCci' \
    --body '{"name": "rCvPNkXO"}' \
    > test.out 2>&1
eval_tap $? 76 'UpdateChannel' test.out

#- 77 DeleteChannel
./ng net.accelbyte.sdk.cli.Main ugc deleteChannel \
    --channelId 'sOX0MX3e' \
    --namespace "$AB_NAMESPACE" \
    --userId 'nrVUrxRk' \
    > test.out 2>&1
eval_tap $? 77 'DeleteChannel' test.out

#- 78 CreateContentDirect
eval_tap 0 78 'CreateContentDirect # SKIP deprecated' test.out

#- 79 CreateContentS3
./ng net.accelbyte.sdk.cli.Main ugc createContentS3 \
    --channelId 'NLQ7RK6e' \
    --namespace "$AB_NAMESPACE" \
    --userId 'wGXpvxo1' \
    --body '{"contentType": "1dMG3MbS", "customAttributes": {"rFQiCY7z": {}, "fl38QAKY": {}, "Eykau6qy": {}}, "fileExtension": "kJY0Xjtk", "name": "fW5Di1OL", "preview": "y00JAZpi", "previewMetadata": {"previewContentType": "By9qNPGH", "previewFileExtension": "PQMlKCbP"}, "subType": "PTIeKB3C", "tags": ["RHmetc3t", "eYUuUIkE", "W9xSAVyl"], "type": "PtGe4o4k"}' \
    > test.out 2>&1
eval_tap $? 79 'CreateContentS3' test.out

#- 80 PublicUpdateContentByShareCode
./ng net.accelbyte.sdk.cli.Main ugc publicUpdateContentByShareCode \
    --channelId 'CKxC0CR9' \
    --namespace "$AB_NAMESPACE" \
    --shareCode 'IhypTiPr' \
    --userId 'qOfZRvqS' \
    --body '{"contentType": "ypS965I2", "customAttributes": {"sfUfbObc": {}, "eNeuitgX": {}, "V9tmtoKh": {}}, "fileExtension": "TDElVijG", "name": "puhJ4SN6", "payload": "euJrTb2d", "preview": "dFyGoFmH", "previewMetadata": {"previewContentType": "XO9VTry5", "previewFileExtension": "yeWoL6tx"}, "subType": "30ODTOzZ", "tags": ["iInzjVrq", "CFswJUeH", "51wNysUC"], "type": "IRontdT7", "updateContentFile": false}' \
    > test.out 2>&1
eval_tap $? 80 'PublicUpdateContentByShareCode' test.out

#- 81 UpdateContentS3
./ng net.accelbyte.sdk.cli.Main ugc updateContentS3 \
    --channelId '8MmBhjAD' \
    --contentId 't90xyduX' \
    --namespace "$AB_NAMESPACE" \
    --userId 'LZcmbGbB' \
    --body '{"contentType": "A493mXHV", "customAttributes": {"7LPf1rIf": {}, "Txz0pW92": {}, "DoUDmrIJ": {}}, "fileExtension": "7VCxtFBR", "name": "y9pBeBmC", "payload": "7YXReftN", "preview": "rif91KyD", "previewMetadata": {"previewContentType": "RHIlmeB6", "previewFileExtension": "phrgBdDE"}, "subType": "eysJyhyf", "tags": ["knATRZtb", "ELTDAxjw", "mhs0pPbW"], "type": "3GR4Lk75", "updateContentFile": false}' \
    > test.out 2>&1
eval_tap $? 81 'UpdateContentS3' test.out

#- 82 PublicDeleteContentByShareCode
./ng net.accelbyte.sdk.cli.Main ugc publicDeleteContentByShareCode \
    --channelId 'DwGBGNxX' \
    --namespace "$AB_NAMESPACE" \
    --shareCode 'nE1ga34C' \
    --userId '7HJW4353' \
    > test.out 2>&1
eval_tap $? 82 'PublicDeleteContentByShareCode' test.out

#- 83 UpdateContentDirect
eval_tap 0 83 'UpdateContentDirect # SKIP deprecated' test.out

#- 84 DeleteContent
./ng net.accelbyte.sdk.cli.Main ugc deleteContent \
    --channelId 'zom6zkNK' \
    --contentId 'mQ5qXF3R' \
    --namespace "$AB_NAMESPACE" \
    --userId 'ooqhmRvw' \
    > test.out 2>&1
eval_tap $? 84 'DeleteContent' test.out

#- 85 UpdateContentShareCode
./ng net.accelbyte.sdk.cli.Main ugc updateContentShareCode \
    --channelId 'InUqPZLG' \
    --contentId 'TYMT7H35' \
    --namespace "$AB_NAMESPACE" \
    --userId 'DsbpV60m' \
    --body '{"shareCode": "Rg82AIXI"}' \
    > test.out 2>&1
eval_tap $? 85 'UpdateContentShareCode' test.out

#- 86 PublicGetUserContent
./ng net.accelbyte.sdk.cli.Main ugc publicGetUserContent \
    --namespace "$AB_NAMESPACE" \
    --userId 'jB8JgRix' \
    --limit '6' \
    --offset '75' \
    > test.out 2>&1
eval_tap $? 86 'PublicGetUserContent' test.out

#- 87 DeleteAllUserContents
./ng net.accelbyte.sdk.cli.Main ugc deleteAllUserContents \
    --namespace "$AB_NAMESPACE" \
    --userId 'AzGCCrQo' \
    > test.out 2>&1
eval_tap $? 87 'DeleteAllUserContents' test.out

#- 88 UpdateScreenshots
./ng net.accelbyte.sdk.cli.Main ugc updateScreenshots \
    --contentId 'xUaOrQYJ' \
    --namespace "$AB_NAMESPACE" \
    --userId 'qqFaf0RR' \
    --body '{"screenshots": [{"description": "axRMKSkM", "screenshotId": "cQlKoDLO"}, {"description": "kuDp9SsR", "screenshotId": "AY5PAQns"}, {"description": "iK1Zm7Lb", "screenshotId": "vFuwgosL"}]}' \
    > test.out 2>&1
eval_tap $? 88 'UpdateScreenshots' test.out

#- 89 UploadContentScreenshot
./ng net.accelbyte.sdk.cli.Main ugc uploadContentScreenshot \
    --contentId 'pgtfwa67' \
    --namespace "$AB_NAMESPACE" \
    --userId 'q9J2py2u' \
    --body '{"screenshots": [{"contentType": "3a45zw7m", "description": "6HVZpl1U", "fileExtension": "jfif"}, {"contentType": "VhdiuBEA", "description": "hZml1cER", "fileExtension": "jpg"}, {"contentType": "nWzXJTFB", "description": "X1IOoliU", "fileExtension": "jpeg"}]}' \
    > test.out 2>&1
eval_tap $? 89 'UploadContentScreenshot' test.out

#- 90 DeleteContentScreenshot
./ng net.accelbyte.sdk.cli.Main ugc deleteContentScreenshot \
    --contentId 'Tfy1nqs5' \
    --namespace "$AB_NAMESPACE" \
    --screenshotId 'jA0MwP80' \
    --userId 'gxmmSEOi' \
    > test.out 2>&1
eval_tap $? 90 'DeleteContentScreenshot' test.out

#- 91 UpdateUserFollowStatus
./ng net.accelbyte.sdk.cli.Main ugc updateUserFollowStatus \
    --namespace "$AB_NAMESPACE" \
    --userId 'LwixasLX' \
    --body '{"followStatus": true}' \
    > test.out 2>&1
eval_tap $? 91 'UpdateUserFollowStatus' test.out

#- 92 GetPublicFollowers
./ng net.accelbyte.sdk.cli.Main ugc getPublicFollowers \
    --namespace "$AB_NAMESPACE" \
    --userId 'YtIo0u0l' \
    --limit '55' \
    --offset '65' \
    > test.out 2>&1
eval_tap $? 92 'GetPublicFollowers' test.out

#- 93 GetPublicFollowing
./ng net.accelbyte.sdk.cli.Main ugc getPublicFollowing \
    --namespace "$AB_NAMESPACE" \
    --userId 'V4d5s90p' \
    --limit '81' \
    --offset '86' \
    > test.out 2>&1
eval_tap $? 93 'GetPublicFollowing' test.out

#- 94 GetGroups
./ng net.accelbyte.sdk.cli.Main ugc getGroups \
    --namespace "$AB_NAMESPACE" \
    --userId '2WLxo90F' \
    --limit '60' \
    --offset '31' \
    > test.out 2>&1
eval_tap $? 94 'GetGroups' test.out

#- 95 CreateGroup
./ng net.accelbyte.sdk.cli.Main ugc createGroup \
    --namespace "$AB_NAMESPACE" \
    --userId '8R7kbAjT' \
    --body '{"contents": ["qP90Y09d", "0tuoSuWH", "yrXTEmLP"], "name": "XfiJL6Ov"}' \
    > test.out 2>&1
eval_tap $? 95 'CreateGroup' test.out

#- 96 DeleteAllUserGroup
./ng net.accelbyte.sdk.cli.Main ugc deleteAllUserGroup \
    --namespace "$AB_NAMESPACE" \
    --userId 'YjmRgeMY' \
    > test.out 2>&1
eval_tap $? 96 'DeleteAllUserGroup' test.out

#- 97 GetGroup
./ng net.accelbyte.sdk.cli.Main ugc getGroup \
    --groupId 'NUKu1oI2' \
    --namespace "$AB_NAMESPACE" \
    --userId '6HhYj8Av' \
    > test.out 2>&1
eval_tap $? 97 'GetGroup' test.out

#- 98 UpdateGroup
./ng net.accelbyte.sdk.cli.Main ugc updateGroup \
    --groupId 'cwmVf4Un' \
    --namespace "$AB_NAMESPACE" \
    --userId 'zCXM4TY8' \
    --body '{"contents": ["YYSkHLMc", "HvSunKy2", "tn9zjOvs"], "name": "20rXkf4D"}' \
    > test.out 2>&1
eval_tap $? 98 'UpdateGroup' test.out

#- 99 DeleteGroup
./ng net.accelbyte.sdk.cli.Main ugc deleteGroup \
    --groupId 'rs8u4eQY' \
    --namespace "$AB_NAMESPACE" \
    --userId 'e9W1KH5N' \
    > test.out 2>&1
eval_tap $? 99 'DeleteGroup' test.out

#- 100 GetGroupContent
./ng net.accelbyte.sdk.cli.Main ugc getGroupContent \
    --groupId 'pvraUHDs' \
    --namespace "$AB_NAMESPACE" \
    --userId 'E45ysAUm' \
    --limit '2' \
    --offset '28' \
    > test.out 2>&1
eval_tap $? 100 'GetGroupContent' test.out

#- 101 DeleteAllUserStates
./ng net.accelbyte.sdk.cli.Main ugc deleteAllUserStates \
    --namespace "$AB_NAMESPACE" \
    --userId 'VLmzgp3n' \
    > test.out 2>&1
eval_tap $? 101 'DeleteAllUserStates' test.out

#- 102 AdminGetContentByChannelIDV2
./ng net.accelbyte.sdk.cli.Main ugc adminGetContentByChannelIDV2 \
    --channelId 'yi1l7IBB' \
    --namespace "$AB_NAMESPACE" \
    --limit '20' \
    --name 'zjqhZv6k' \
    --offset '68' \
    --sortBy 'u75crPtO' \
    > test.out 2>&1
eval_tap $? 102 'AdminGetContentByChannelIDV2' test.out

#- 103 AdminCreateContentV2
./ng net.accelbyte.sdk.cli.Main ugc adminCreateContentV2 \
    --channelId '83EBr6O0' \
    --namespace "$AB_NAMESPACE" \
    --body '{"contentType": "2mjaeVmu", "customAttributes": {"57QHLLr8": {}, "TagKfsMT": {}, "dwT86jz7": {}}, "fileExtension": "K9JSeoBv", "name": "DAWmwD4a", "shareCode": "UTgSMhGJ", "subType": "C5ETZCWm", "tags": ["8Oq75S3S", "HwDUJTHe", "YcWHcqXW"], "type": "kGXlkYGk"}' \
    > test.out 2>&1
eval_tap $? 103 'AdminCreateContentV2' test.out

#- 104 AdminDeleteOfficialContentV2
./ng net.accelbyte.sdk.cli.Main ugc adminDeleteOfficialContentV2 \
    --channelId 'iSlsVaHb' \
    --contentId '70LMZi5H' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 104 'AdminDeleteOfficialContentV2' test.out

#- 105 AdminUpdateOfficialContentV2
./ng net.accelbyte.sdk.cli.Main ugc adminUpdateOfficialContentV2 \
    --channelId 'pxtS1wAa' \
    --contentId '6haHpvID' \
    --namespace "$AB_NAMESPACE" \
    --body '{"customAttributes": {"yXMQxP2u": {}, "h8ep47YF": {}, "U2OXSj30": {}}, "name": "Sm50AJQb", "shareCode": "4L9pi1JY", "subType": "rRwK1xz1", "tags": ["YhlUxQP8", "ekfY3hxs", "pQaYq2t3"], "type": "MwrNDmqe"}' \
    > test.out 2>&1
eval_tap $? 105 'AdminUpdateOfficialContentV2' test.out

#- 106 AdminCopyContent
./ng net.accelbyte.sdk.cli.Main ugc adminCopyContent \
    --channelId 'GBqAhpN5' \
    --contentId 'NkujZCjM' \
    --namespace "$AB_NAMESPACE" \
    --body '{"customAttributes": {"ProwShOv": {}, "eivnupDa": {}, "3DnGN93O": {}}, "name": "Cp23W58W", "subType": "td0Txv6X", "tags": ["NVX0lnxH", "gscOH3Ri", "FegsEIaa"], "targetChannelId": "ZtVi3e30", "type": "EbX4ZtWu"}' \
    > test.out 2>&1
eval_tap $? 106 'AdminCopyContent' test.out

#- 107 AdminUpdateOfficialContentFileLocation
./ng net.accelbyte.sdk.cli.Main ugc adminUpdateOfficialContentFileLocation \
    --channelId 'dCVQoZMm' \
    --contentId 'rbRZseCP' \
    --namespace "$AB_NAMESPACE" \
    --body '{"fileExtension": "OeyRWpfK", "fileLocation": "iGMigPWQ"}' \
    > test.out 2>&1
eval_tap $? 107 'AdminUpdateOfficialContentFileLocation' test.out

#- 108 AdminGenerateOfficialContentUploadURLV2
./ng net.accelbyte.sdk.cli.Main ugc adminGenerateOfficialContentUploadURLV2 \
    --channelId 'BJGoJ3ac' \
    --contentId '6pEWabcc' \
    --namespace "$AB_NAMESPACE" \
    --body '{"contentType": "QL6jjsD8", "fileExtension": "l3BFsCz7"}' \
    > test.out 2>&1
eval_tap $? 108 'AdminGenerateOfficialContentUploadURLV2' test.out

#- 109 AdminGetConfigs
./ng net.accelbyte.sdk.cli.Main ugc adminGetConfigs \
    --namespace "$AB_NAMESPACE" \
    --limit '18' \
    --offset '64' \
    > test.out 2>&1
eval_tap $? 109 'AdminGetConfigs' test.out

#- 110 AdminUpdateConfig
./ng net.accelbyte.sdk.cli.Main ugc adminUpdateConfig \
    --key '7qulhkmz' \
    --namespace "$AB_NAMESPACE" \
    --body '{"value": "bv9c5mrC"}' \
    > test.out 2>&1
eval_tap $? 110 'AdminUpdateConfig' test.out

#- 111 AdminListContentV2
./ng net.accelbyte.sdk.cli.Main ugc adminListContentV2 \
    --namespace "$AB_NAMESPACE" \
    --isOfficial  \
    --limit '17' \
    --name 'S4GhHZt3' \
    --offset '75' \
    --sortBy 'WZKdMYUt' \
    --subType '4rc49PsC' \
    --tags 'gIeIjzyc,8HTAb7YZ,jFopqRXc' \
    --type 'l1mHonhH' \
    > test.out 2>&1
eval_tap $? 111 'AdminListContentV2' test.out

#- 112 AdminBulkGetContentByIDsV2
./ng net.accelbyte.sdk.cli.Main ugc adminBulkGetContentByIDsV2 \
    --namespace "$AB_NAMESPACE" \
    --body '{"contentIds": ["QmFcMroj", "WTkueSvk", "46TG9rlH"]}' \
    > test.out 2>&1
eval_tap $? 112 'AdminBulkGetContentByIDsV2' test.out

#- 113 AdminGetContentBulkByShareCodesV2
./ng net.accelbyte.sdk.cli.Main ugc adminGetContentBulkByShareCodesV2 \
    --namespace "$AB_NAMESPACE" \
    --body '{"shareCodes": ["CHMXxsB1", "qUTiOSjz", "r4V852Mv"]}' \
    > test.out 2>&1
eval_tap $? 113 'AdminGetContentBulkByShareCodesV2' test.out

#- 114 AdminGetContentByShareCodeV2
./ng net.accelbyte.sdk.cli.Main ugc adminGetContentByShareCodeV2 \
    --namespace "$AB_NAMESPACE" \
    --shareCode 'fp4ecHYg' \
    > test.out 2>&1
eval_tap $? 114 'AdminGetContentByShareCodeV2' test.out

#- 115 AdminGetContentByContentIDV2
./ng net.accelbyte.sdk.cli.Main ugc adminGetContentByContentIDV2 \
    --contentId 'uSpaiETS' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 115 'AdminGetContentByContentIDV2' test.out

#- 116 RollbackContentVersionV2
./ng net.accelbyte.sdk.cli.Main ugc rollbackContentVersionV2 \
    --contentId 'ej82fbyB' \
    --namespace "$AB_NAMESPACE" \
    --versionId 'LrM1cHw7' \
    > test.out 2>&1
eval_tap $? 116 'RollbackContentVersionV2' test.out

#- 117 AdminUpdateScreenshotsV2
./ng net.accelbyte.sdk.cli.Main ugc adminUpdateScreenshotsV2 \
    --contentId 'qypmZuyA' \
    --namespace "$AB_NAMESPACE" \
    --body '{"screenshots": [{"description": "5pURLKQF", "screenshotId": "ftT5k1Tz"}, {"description": "RW8WbWFm", "screenshotId": "allC6lDY"}, {"description": "FxlCeDpd", "screenshotId": "VrMXh6M7"}]}' \
    > test.out 2>&1
eval_tap $? 117 'AdminUpdateScreenshotsV2' test.out

#- 118 AdminUploadContentScreenshotV2
./ng net.accelbyte.sdk.cli.Main ugc adminUploadContentScreenshotV2 \
    --contentId 'buXKltmK' \
    --namespace "$AB_NAMESPACE" \
    --body '{"screenshots": [{"contentType": "KZbdeUOz", "description": "TFSERNIT", "fileExtension": "png"}, {"contentType": "WS8SQMPG", "description": "nhFyROA5", "fileExtension": "jfif"}, {"contentType": "51l1zoR8", "description": "RObHSIKO", "fileExtension": "bmp"}]}' \
    > test.out 2>&1
eval_tap $? 118 'AdminUploadContentScreenshotV2' test.out

#- 119 AdminDeleteContentScreenshotV2
./ng net.accelbyte.sdk.cli.Main ugc adminDeleteContentScreenshotV2 \
    --contentId 'yAGqSMb9' \
    --namespace "$AB_NAMESPACE" \
    --screenshotId 'w0iDPOKX' \
    > test.out 2>&1
eval_tap $? 119 'AdminDeleteContentScreenshotV2' test.out

#- 120 ListContentVersionsV2
./ng net.accelbyte.sdk.cli.Main ugc listContentVersionsV2 \
    --contentId 'D0qP4ASp' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 120 'ListContentVersionsV2' test.out

#- 121 AdminGetOfficialGroupContentsV2
./ng net.accelbyte.sdk.cli.Main ugc adminGetOfficialGroupContentsV2 \
    --groupId 'dZxWdKsV' \
    --namespace "$AB_NAMESPACE" \
    --limit '67' \
    --offset '47' \
    > test.out 2>&1
eval_tap $? 121 'AdminGetOfficialGroupContentsV2' test.out

#- 122 AdminListStagingContents
./ng net.accelbyte.sdk.cli.Main ugc adminListStagingContents \
    --namespace "$AB_NAMESPACE" \
    --limit '33' \
    --offset '73' \
    --sortBy 'YbbCSaDi' \
    --status 'EiqMVbCo' \
    > test.out 2>&1
eval_tap $? 122 'AdminListStagingContents' test.out

#- 123 AdminGetStagingContentByID
./ng net.accelbyte.sdk.cli.Main ugc adminGetStagingContentByID \
    --contentId 'VNBO8Dql' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 123 'AdminGetStagingContentByID' test.out

#- 124 AdminApproveStagingContent
./ng net.accelbyte.sdk.cli.Main ugc adminApproveStagingContent \
    --contentId 'q1taZaog' \
    --namespace "$AB_NAMESPACE" \
    --body '{"approved": true, "note": "DZGTlGE9"}' \
    > test.out 2>&1
eval_tap $? 124 'AdminApproveStagingContent' test.out

#- 125 AdminUpdateContentByShareCodeV2
./ng net.accelbyte.sdk.cli.Main ugc adminUpdateContentByShareCodeV2 \
    --channelId 'Udzrxhqt' \
    --namespace "$AB_NAMESPACE" \
    --shareCode '22KaHLdf' \
    --userId 'CjQ41V53' \
    --body '{"customAttributes": {"K5DPEVrm": {}, "fHf4yiiw": {}, "0R8GKV7P": {}}, "name": "nt0VM01u", "shareCode": "WHKIOTFz", "subType": "qoDm5zeA", "tags": ["6F5uBLaK", "zFt8cDuY", "RMK2IP0G"], "type": "eb5Uy0RC"}' \
    > test.out 2>&1
eval_tap $? 125 'AdminUpdateContentByShareCodeV2' test.out

#- 126 AdminDeleteContentByShareCodeV2
./ng net.accelbyte.sdk.cli.Main ugc adminDeleteContentByShareCodeV2 \
    --channelId 'mCEJtK2s' \
    --namespace "$AB_NAMESPACE" \
    --shareCode 'QQ87AfRJ' \
    --userId 'tbmOppat' \
    > test.out 2>&1
eval_tap $? 126 'AdminDeleteContentByShareCodeV2' test.out

#- 127 AdminDeleteUserContentV2
./ng net.accelbyte.sdk.cli.Main ugc adminDeleteUserContentV2 \
    --channelId '808CbAWW' \
    --contentId 'XN0cyDIY' \
    --namespace "$AB_NAMESPACE" \
    --userId 'wwKLaEIb' \
    > test.out 2>&1
eval_tap $? 127 'AdminDeleteUserContentV2' test.out

#- 128 AdminUpdateUserContentV2
./ng net.accelbyte.sdk.cli.Main ugc adminUpdateUserContentV2 \
    --channelId 'O4UQP8uK' \
    --contentId 'ZPiXJqMn' \
    --namespace "$AB_NAMESPACE" \
    --userId 'O3vWXsvJ' \
    --body '{"customAttributes": {"sj8Pip1R": {}, "bwVJl6Zz": {}, "LUXhcpW9": {}}, "name": "cVu9BUf6", "shareCode": "43scVOtV", "subType": "TYTyRIV8", "tags": ["5RHJdbkp", "j9GrMXeJ", "5PDtj5kX"], "type": "ppkpWgyH"}' \
    > test.out 2>&1
eval_tap $? 128 'AdminUpdateUserContentV2' test.out

#- 129 AdminUpdateUserContentFileLocation
./ng net.accelbyte.sdk.cli.Main ugc adminUpdateUserContentFileLocation \
    --channelId 'ml2KZQu8' \
    --contentId '8IU5cMYe' \
    --namespace "$AB_NAMESPACE" \
    --userId 'l4EMT8M2' \
    --body '{"fileExtension": "VHyWIYVG", "fileLocation": "fABciPXY"}' \
    > test.out 2>&1
eval_tap $? 129 'AdminUpdateUserContentFileLocation' test.out

#- 130 AdminGenerateUserContentUploadURLV2
./ng net.accelbyte.sdk.cli.Main ugc adminGenerateUserContentUploadURLV2 \
    --channelId 'z8O19L5c' \
    --contentId 'vLtiZ9tN' \
    --namespace "$AB_NAMESPACE" \
    --userId 'cgeh5eD0' \
    --body '{"contentType": "C9QmLnGQ", "fileExtension": "EOTuVZ3l"}' \
    > test.out 2>&1
eval_tap $? 130 'AdminGenerateUserContentUploadURLV2' test.out

#- 131 AdminGetContentByUserIDV2
./ng net.accelbyte.sdk.cli.Main ugc adminGetContentByUserIDV2 \
    --namespace "$AB_NAMESPACE" \
    --userId 'ITFjI7KX' \
    --limit '29' \
    --offset '18' \
    --sortBy '2mcds23a' \
    > test.out 2>&1
eval_tap $? 131 'AdminGetContentByUserIDV2' test.out

#- 132 AdminUpdateContentHideStatusV2
./ng net.accelbyte.sdk.cli.Main ugc adminUpdateContentHideStatusV2 \
    --contentId 'W7rm88cq' \
    --namespace "$AB_NAMESPACE" \
    --userId 'd5cCoDDS' \
    --body '{"isHidden": true}' \
    > test.out 2>&1
eval_tap $? 132 'AdminUpdateContentHideStatusV2' test.out

#- 133 AdminGetUserGroupContentsV2
./ng net.accelbyte.sdk.cli.Main ugc adminGetUserGroupContentsV2 \
    --groupId 'NFogdHaw' \
    --namespace "$AB_NAMESPACE" \
    --userId '9bhTatF9' \
    --limit '63' \
    --offset '97' \
    > test.out 2>&1
eval_tap $? 133 'AdminGetUserGroupContentsV2' test.out

#- 134 AdminListUserStagingContents
./ng net.accelbyte.sdk.cli.Main ugc adminListUserStagingContents \
    --namespace "$AB_NAMESPACE" \
    --userId 'Oz4ynPPN' \
    --limit '84' \
    --offset '29' \
    --sortBy '0BEqowk8' \
    --status 'tYPEU9cY' \
    > test.out 2>&1
eval_tap $? 134 'AdminListUserStagingContents' test.out

#- 135 PublicGetContentByChannelIDV2
./ng net.accelbyte.sdk.cli.Main ugc publicGetContentByChannelIDV2 \
    --channelId 'drwl8o9z' \
    --namespace "$AB_NAMESPACE" \
    --limit '24' \
    --name 'aWMUovd2' \
    --offset '55' \
    --sortBy 'M4XdSlFz' \
    > test.out 2>&1
eval_tap $? 135 'PublicGetContentByChannelIDV2' test.out

#- 136 PublicListContentV2
./ng net.accelbyte.sdk.cli.Main ugc publicListContentV2 \
    --namespace "$AB_NAMESPACE" \
    --isOfficial  \
    --limit '79' \
    --name 'zy0DExpM' \
    --offset '18' \
    --sortBy '48WVKDvA' \
    --subType 's4QEMEYk' \
    --tags 'ESgb0kr3,gA9thhze,VgLlz027' \
    --type 'obQdXuN1' \
    > test.out 2>&1
eval_tap $? 136 'PublicListContentV2' test.out

#- 137 PublicBulkGetContentByIDV2
./ng net.accelbyte.sdk.cli.Main ugc publicBulkGetContentByIDV2 \
    --namespace "$AB_NAMESPACE" \
    --body '{"contentIds": ["vtWQWuSm", "lQ3F4lMt", "7UTnme3p"]}' \
    > test.out 2>&1
eval_tap $? 137 'PublicBulkGetContentByIDV2' test.out

#- 138 PublicGetContentBulkByShareCodesV2
./ng net.accelbyte.sdk.cli.Main ugc publicGetContentBulkByShareCodesV2 \
    --namespace "$AB_NAMESPACE" \
    --body '{"shareCodes": ["9Z3cU95u", "M5yXIYom", "P5DfVK0f"]}' \
    > test.out 2>&1
eval_tap $? 138 'PublicGetContentBulkByShareCodesV2' test.out

#- 139 PublicGetContentByShareCodeV2
./ng net.accelbyte.sdk.cli.Main ugc publicGetContentByShareCodeV2 \
    --namespace "$AB_NAMESPACE" \
    --shareCode 'eU5HN42L' \
    > test.out 2>&1
eval_tap $? 139 'PublicGetContentByShareCodeV2' test.out

#- 140 PublicGetContentByIDV2
./ng net.accelbyte.sdk.cli.Main ugc publicGetContentByIDV2 \
    --contentId 'XxSt3Mo7' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 140 'PublicGetContentByIDV2' test.out

#- 141 PublicAddDownloadCountV2
./ng net.accelbyte.sdk.cli.Main ugc publicAddDownloadCountV2 \
    --contentId 'GMKRhMX9' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 141 'PublicAddDownloadCountV2' test.out

#- 142 PublicListContentDownloaderV2
./ng net.accelbyte.sdk.cli.Main ugc publicListContentDownloaderV2 \
    --contentId '6p5Am1C4' \
    --namespace "$AB_NAMESPACE" \
    --limit '71' \
    --offset '4' \
    --sortBy 'N14N11ca' \
    --userId 'BNUQXFCT' \
    > test.out 2>&1
eval_tap $? 142 'PublicListContentDownloaderV2' test.out

#- 143 PublicListContentLikeV2
./ng net.accelbyte.sdk.cli.Main ugc publicListContentLikeV2 \
    --contentId 'nMmdPJvp' \
    --namespace "$AB_NAMESPACE" \
    --limit '14' \
    --offset '49' \
    --sortBy 'DIpZkFPx' \
    > test.out 2>&1
eval_tap $? 143 'PublicListContentLikeV2' test.out

#- 144 UpdateContentLikeStatusV2
./ng net.accelbyte.sdk.cli.Main ugc updateContentLikeStatusV2 \
    --contentId 'WcEURydF' \
    --namespace "$AB_NAMESPACE" \
    --body '{"likeStatus": true}' \
    > test.out 2>&1
eval_tap $? 144 'UpdateContentLikeStatusV2' test.out

#- 145 PublicCreateContentV2
./ng net.accelbyte.sdk.cli.Main ugc publicCreateContentV2 \
    --channelId 'RxvF6LFe' \
    --namespace "$AB_NAMESPACE" \
    --userId 'jrmJ78Aj' \
    --body '{"contentType": "ITfEn518", "customAttributes": {"GSbr2tt7": {}, "mqA4kTQu": {}, "R5jJxxrr": {}}, "fileExtension": "LFYizQO5", "name": "HZ7jvimz", "subType": "HN7ZIExQ", "tags": ["G8GXHdZD", "9qA8lQql", "WmHTiDTn"], "type": "nBCXV6I0"}' \
    > test.out 2>&1
eval_tap $? 145 'PublicCreateContentV2' test.out

#- 146 PublicUpdateContentByShareCodeV2
./ng net.accelbyte.sdk.cli.Main ugc publicUpdateContentByShareCodeV2 \
    --channelId 'IcT6lnUo' \
    --namespace "$AB_NAMESPACE" \
    --shareCode 'PnuhkxDn' \
    --userId 'NhZLP8K5' \
    --body '{"customAttributes": {"HOZLrL2m": {}, "PrhkF0F5": {}, "oCFpPizL": {}}, "name": "2FRPUFXW", "subType": "gWpiizFD", "tags": ["0WjGQyON", "xZHz2CDw", "GtsmCvu6"], "type": "zrSUFIFN"}' \
    > test.out 2>&1
eval_tap $? 146 'PublicUpdateContentByShareCodeV2' test.out

#- 147 PublicDeleteContentByShareCodeV2
./ng net.accelbyte.sdk.cli.Main ugc publicDeleteContentByShareCodeV2 \
    --channelId 'tiCtByQv' \
    --namespace "$AB_NAMESPACE" \
    --shareCode 'uwfmFzRw' \
    --userId 'C8TvkyFm' \
    > test.out 2>&1
eval_tap $? 147 'PublicDeleteContentByShareCodeV2' test.out

#- 148 PublicDeleteContentV2
./ng net.accelbyte.sdk.cli.Main ugc publicDeleteContentV2 \
    --channelId 'Udf4l8ZV' \
    --contentId 'iZHOY9Fs' \
    --namespace "$AB_NAMESPACE" \
    --userId 'bhujLztH' \
    > test.out 2>&1
eval_tap $? 148 'PublicDeleteContentV2' test.out

#- 149 PublicUpdateContentV2
./ng net.accelbyte.sdk.cli.Main ugc publicUpdateContentV2 \
    --channelId 'yTpU9yYY' \
    --contentId 'sJG1eaiS' \
    --namespace "$AB_NAMESPACE" \
    --userId 'auJNXGtt' \
    --body '{"customAttributes": {"xPp8zxWl": {}, "VdUhMTxF": {}, "NMrjrL1h": {}}, "name": "U1T8rHk5", "subType": "yGK6trV1", "tags": ["velTJZ74", "O2JXEOZj", "6aemv3xq"], "type": "wGeu2Ea1"}' \
    > test.out 2>&1
eval_tap $? 149 'PublicUpdateContentV2' test.out

#- 150 PublicUpdateContentFileLocation
./ng net.accelbyte.sdk.cli.Main ugc publicUpdateContentFileLocation \
    --channelId '1nBwAJLk' \
    --contentId 'XxVAEINt' \
    --namespace "$AB_NAMESPACE" \
    --userId 'WCzM2YHf' \
    --body '{"fileExtension": "w76gDWuv", "fileLocation": "PWiplRol"}' \
    > test.out 2>&1
eval_tap $? 150 'PublicUpdateContentFileLocation' test.out

#- 151 UpdateContentShareCodeV2
./ng net.accelbyte.sdk.cli.Main ugc updateContentShareCodeV2 \
    --channelId '6TSW6xhv' \
    --contentId 'rp0C34me' \
    --namespace "$AB_NAMESPACE" \
    --userId '5yxPUxQ4' \
    --body '{"shareCode": "7F6PLtQs"}' \
    > test.out 2>&1
eval_tap $? 151 'UpdateContentShareCodeV2' test.out

#- 152 PublicGenerateContentUploadURLV2
./ng net.accelbyte.sdk.cli.Main ugc publicGenerateContentUploadURLV2 \
    --channelId 'L2Z7QPND' \
    --contentId '5mkGkpcF' \
    --namespace "$AB_NAMESPACE" \
    --userId 'zPWufEt0' \
    --body '{"contentType": "4nqLfxqh", "fileExtension": "dpqqNUuk"}' \
    > test.out 2>&1
eval_tap $? 152 'PublicGenerateContentUploadURLV2' test.out

#- 153 PublicGetContentByUserIDV2
./ng net.accelbyte.sdk.cli.Main ugc publicGetContentByUserIDV2 \
    --namespace "$AB_NAMESPACE" \
    --userId 'O2j716eE' \
    --limit '52' \
    --offset '13' \
    --sortBy 'DNb0mPQy' \
    > test.out 2>&1
eval_tap $? 153 'PublicGetContentByUserIDV2' test.out

#- 154 UpdateScreenshotsV2
./ng net.accelbyte.sdk.cli.Main ugc updateScreenshotsV2 \
    --contentId 'zEL6xOGb' \
    --namespace "$AB_NAMESPACE" \
    --userId '1TP9txdP' \
    --body '{"screenshots": [{"description": "RJUMTShu", "screenshotId": "Csc04eid"}, {"description": "hbgO6SmR", "screenshotId": "X4MFOIZS"}, {"description": "XNlnbwVk", "screenshotId": "0oyILdwo"}]}' \
    > test.out 2>&1
eval_tap $? 154 'UpdateScreenshotsV2' test.out

#- 155 UploadContentScreenshotV2
./ng net.accelbyte.sdk.cli.Main ugc uploadContentScreenshotV2 \
    --contentId '43PCaOQI' \
    --namespace "$AB_NAMESPACE" \
    --userId 'x160TXsh' \
    --body '{"screenshots": [{"contentType": "moG2Jmhf", "description": "YzDmSr1F", "fileExtension": "jpeg"}, {"contentType": "lCLoozrc", "description": "PkHBbyIa", "fileExtension": "jpeg"}, {"contentType": "jQXD1BS3", "description": "hROHrZML", "fileExtension": "png"}]}' \
    > test.out 2>&1
eval_tap $? 155 'UploadContentScreenshotV2' test.out

#- 156 DeleteContentScreenshotV2
./ng net.accelbyte.sdk.cli.Main ugc deleteContentScreenshotV2 \
    --contentId 'U0BBNMPE' \
    --namespace "$AB_NAMESPACE" \
    --screenshotId 'nkuPJt94' \
    --userId '6P45OA7E' \
    > test.out 2>&1
eval_tap $? 156 'DeleteContentScreenshotV2' test.out

#- 157 PublicGetGroupContentsV2
./ng net.accelbyte.sdk.cli.Main ugc publicGetGroupContentsV2 \
    --groupId 'Q6WVehVY' \
    --namespace "$AB_NAMESPACE" \
    --userId 'rQxbHNeR' \
    --limit '100' \
    --offset '77' \
    > test.out 2>&1
eval_tap $? 157 'PublicGetGroupContentsV2' test.out

#- 158 ListUserStagingContents
./ng net.accelbyte.sdk.cli.Main ugc listUserStagingContents \
    --namespace "$AB_NAMESPACE" \
    --userId 'MqWTInk3' \
    --limit '94' \
    --offset '77' \
    --sortBy '3s8DVsTL' \
    --status 'OYGKWEzs' \
    > test.out 2>&1
eval_tap $? 158 'ListUserStagingContents' test.out

#- 159 GetUserStagingContentByID
./ng net.accelbyte.sdk.cli.Main ugc getUserStagingContentByID \
    --contentId 'hYbUC4Xm' \
    --namespace "$AB_NAMESPACE" \
    --userId 'e7N6dB0t' \
    > test.out 2>&1
eval_tap $? 159 'GetUserStagingContentByID' test.out

#- 160 UpdateStagingContent
./ng net.accelbyte.sdk.cli.Main ugc updateStagingContent \
    --contentId 'uK8rMLJ8' \
    --namespace "$AB_NAMESPACE" \
    --userId 'ppCmaNcX' \
    --body '{"fileExtension": "Th7UEEqg", "fileLocation": "945HBrsD"}' \
    > test.out 2>&1
eval_tap $? 160 'UpdateStagingContent' test.out

#- 161 DeleteUserStagingContentByID
./ng net.accelbyte.sdk.cli.Main ugc deleteUserStagingContentByID \
    --contentId 'cL5PXMeK' \
    --namespace "$AB_NAMESPACE" \
    --userId 'eGrZNDNG' \
    > test.out 2>&1
eval_tap $? 161 'DeleteUserStagingContentByID' test.out


rm -f "tmp.dat"

exit $EXIT_CODE