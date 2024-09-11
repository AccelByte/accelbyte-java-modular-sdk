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
    --limit '72' \
    --offset '58' \
    > test.out 2>&1
eval_tap $? 2 'SingleAdminGetChannel' test.out

#- 3 AdminCreateChannel
./ng net.accelbyte.sdk.cli.Main ugc adminCreateChannel \
    --namespace "$AB_NAMESPACE" \
    --body '{"id": "9lafyWuZ", "name": "nkiP7T3Q"}' \
    > test.out 2>&1
eval_tap $? 3 'AdminCreateChannel' test.out

#- 4 SingleAdminUpdateChannel
./ng net.accelbyte.sdk.cli.Main ugc singleAdminUpdateChannel \
    --channelId '2Ft9NDfz' \
    --namespace "$AB_NAMESPACE" \
    --body '{"name": "OEAhL8wp"}' \
    > test.out 2>&1
eval_tap $? 4 'SingleAdminUpdateChannel' test.out

#- 5 SingleAdminDeleteChannel
./ng net.accelbyte.sdk.cli.Main ugc singleAdminDeleteChannel \
    --channelId 'UPOHoxua' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 5 'SingleAdminDeleteChannel' test.out

#- 6 AdminUploadContentDirect
eval_tap 0 6 'AdminUploadContentDirect # SKIP deprecated' test.out

#- 7 AdminUploadContentS3
./ng net.accelbyte.sdk.cli.Main ugc adminUploadContentS3 \
    --channelId 'KVxRNc93' \
    --namespace "$AB_NAMESPACE" \
    --body '{"contentType": "JkeDkjNR", "customAttributes": {"TXlR7FIJ": {}, "L6Hw4bKP": {}, "aYFUxHVJ": {}}, "fileExtension": "uS14YGDs", "name": "hGhtQLIF", "preview": "Chu9dZNG", "previewMetadata": {"previewContentType": "vj0yEbbV", "previewFileExtension": "X37tKFsl"}, "shareCode": "GLP86dXO", "subType": "O4ZehEt5", "tags": ["aHO2tQUJ", "m5RaDLbm", "6ODSlHLw"], "type": "aeYFAZjl"}' \
    > test.out 2>&1
eval_tap $? 7 'AdminUploadContentS3' test.out

#- 8 SingleAdminUpdateContentS3
./ng net.accelbyte.sdk.cli.Main ugc singleAdminUpdateContentS3 \
    --channelId '8wCAex2q' \
    --contentId 'bTlpIPq0' \
    --namespace "$AB_NAMESPACE" \
    --body '{"contentType": "uXLzVX7g", "customAttributes": {"QqkRYTeV": {}, "Yvt2Fa69": {}, "a7aixIjx": {}}, "fileExtension": "nzw9FEjL", "name": "z0QvpE7n", "payload": "1cYAyAca", "preview": "01GWjVrV", "previewMetadata": {"previewContentType": "qBuWHxXZ", "previewFileExtension": "50xMH9pH"}, "shareCode": "loRIbDba", "subType": "5BwaiBOZ", "tags": ["9yngHx5i", "bwoLXbhj", "hq5ANTFH"], "type": "HxQpJy0i", "updateContentFile": false}' \
    > test.out 2>&1
eval_tap $? 8 'SingleAdminUpdateContentS3' test.out

#- 9 AdminSearchChannelSpecificContent
./ng net.accelbyte.sdk.cli.Main ugc adminSearchChannelSpecificContent \
    --channelId 'uxWTRrsm' \
    --namespace "$AB_NAMESPACE" \
    --creator '7flWKiHG' \
    --ishidden 'vkLMYCtb' \
    --isofficial 'kpPIRsAI' \
    --limit '38' \
    --name 'HmF2FJEl' \
    --offset '83' \
    --orderby 'O70bH6xh' \
    --sortby 'goKMuWRF' \
    --subtype 'SkRRpmW7' \
    --tags 'Bo0WpsUX,tCru9yYw,OTdyVClh' \
    --type 'szwgU0Ez' \
    --userId 'CJzY55Cw' \
    > test.out 2>&1
eval_tap $? 9 'AdminSearchChannelSpecificContent' test.out

#- 10 SingleAdminUpdateContentDirect
eval_tap 0 10 'SingleAdminUpdateContentDirect # SKIP deprecated' test.out

#- 11 SingleAdminDeleteContent
./ng net.accelbyte.sdk.cli.Main ugc singleAdminDeleteContent \
    --channelId '2rmtosch' \
    --contentId 'T82rr84i' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 11 'SingleAdminDeleteContent' test.out

#- 12 SingleAdminGetContent
./ng net.accelbyte.sdk.cli.Main ugc singleAdminGetContent \
    --namespace "$AB_NAMESPACE" \
    --limit '28' \
    --offset '68' \
    > test.out 2>&1
eval_tap $? 12 'SingleAdminGetContent' test.out

#- 13 AdminGetContentBulk
./ng net.accelbyte.sdk.cli.Main ugc adminGetContentBulk \
    --namespace "$AB_NAMESPACE" \
    --body '{"contentIds": ["SCo9oMbF", "jS35N7Rl", "Gsv5B9t8"]}' \
    > test.out 2>&1
eval_tap $? 13 'AdminGetContentBulk' test.out

#- 14 AdminSearchContent
./ng net.accelbyte.sdk.cli.Main ugc adminSearchContent \
    --namespace "$AB_NAMESPACE" \
    --creator '0qwbWbSh' \
    --ishidden 'fCDbmahA' \
    --isofficial 'n8OK3YTf' \
    --limit '78' \
    --name '8xeiQ50P' \
    --offset '46' \
    --orderby 'm9c3WESf' \
    --sortby 'OthllpqD' \
    --subtype 'xS3EuqsK' \
    --tags 'u1OvCzyt,KV3bIkjq,x7sdR0xq' \
    --type '4RbYHxZM' \
    --userId 'q9EjAo2g' \
    > test.out 2>&1
eval_tap $? 14 'AdminSearchContent' test.out

#- 15 AdminGetContentBulkByShareCodes
./ng net.accelbyte.sdk.cli.Main ugc adminGetContentBulkByShareCodes \
    --namespace "$AB_NAMESPACE" \
    --body '{"shareCodes": ["2AmNMroa", "txgjm7uk", "Ka8JpqN0"]}' \
    > test.out 2>&1
eval_tap $? 15 'AdminGetContentBulkByShareCodes' test.out

#- 16 AdminGetUserContentByShareCode
./ng net.accelbyte.sdk.cli.Main ugc adminGetUserContentByShareCode \
    --namespace "$AB_NAMESPACE" \
    --shareCode 'hOWl4fEL' \
    > test.out 2>&1
eval_tap $? 16 'AdminGetUserContentByShareCode' test.out

#- 17 AdminGetSpecificContent
./ng net.accelbyte.sdk.cli.Main ugc adminGetSpecificContent \
    --contentId 'IGnHlVHH' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 17 'AdminGetSpecificContent' test.out

#- 18 AdminDownloadContentPreview
./ng net.accelbyte.sdk.cli.Main ugc adminDownloadContentPreview \
    --contentId 'BuAp0M4g' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 18 'AdminDownloadContentPreview' test.out

#- 19 RollbackContentVersion
./ng net.accelbyte.sdk.cli.Main ugc rollbackContentVersion \
    --contentId 'UNVFdZwS' \
    --namespace "$AB_NAMESPACE" \
    --versionId 'G03uZstR' \
    > test.out 2>&1
eval_tap $? 19 'RollbackContentVersion' test.out

#- 20 AdminUpdateScreenshots
./ng net.accelbyte.sdk.cli.Main ugc adminUpdateScreenshots \
    --contentId 'Dk4l0A3n' \
    --namespace "$AB_NAMESPACE" \
    --body '{"screenshots": [{"description": "IFK4xD0z", "screenshotId": "BhpzfeKS"}, {"description": "zlb6HSmC", "screenshotId": "YAkZNTF2"}, {"description": "adjzblGM", "screenshotId": "HPPcMPs6"}]}' \
    > test.out 2>&1
eval_tap $? 20 'AdminUpdateScreenshots' test.out

#- 21 AdminUploadContentScreenshot
./ng net.accelbyte.sdk.cli.Main ugc adminUploadContentScreenshot \
    --contentId '6eJtqKLV' \
    --namespace "$AB_NAMESPACE" \
    --body '{"screenshots": [{"contentType": "B8x3ejt9", "description": "KWKWCGWx", "fileExtension": "jfif"}, {"contentType": "zMRWYU4J", "description": "EKnt8OEF", "fileExtension": "jpg"}, {"contentType": "5wXKxQH1", "description": "p0WxWT3L", "fileExtension": "jfif"}]}' \
    > test.out 2>&1
eval_tap $? 21 'AdminUploadContentScreenshot' test.out

#- 22 AdminDeleteContentScreenshot
./ng net.accelbyte.sdk.cli.Main ugc adminDeleteContentScreenshot \
    --contentId 'MRDKiLfO' \
    --namespace "$AB_NAMESPACE" \
    --screenshotId '0unZ8bKy' \
    > test.out 2>&1
eval_tap $? 22 'AdminDeleteContentScreenshot' test.out

#- 23 ListContentVersions
./ng net.accelbyte.sdk.cli.Main ugc listContentVersions \
    --contentId 'rdx6xAqI' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 23 'ListContentVersions' test.out

#- 24 SingleAdminGetAllGroups
./ng net.accelbyte.sdk.cli.Main ugc singleAdminGetAllGroups \
    --namespace "$AB_NAMESPACE" \
    --limit '40' \
    --offset '53' \
    > test.out 2>&1
eval_tap $? 24 'SingleAdminGetAllGroups' test.out

#- 25 AdminCreateGroup
./ng net.accelbyte.sdk.cli.Main ugc adminCreateGroup \
    --namespace "$AB_NAMESPACE" \
    --body '{"contents": ["RoXDmdJC", "VkuyWfiH", "3kQ9Ljgb"], "name": "lD5DkmYc"}' \
    > test.out 2>&1
eval_tap $? 25 'AdminCreateGroup' test.out

#- 26 SingleAdminGetGroup
./ng net.accelbyte.sdk.cli.Main ugc singleAdminGetGroup \
    --groupId 'S169cTar' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 26 'SingleAdminGetGroup' test.out

#- 27 SingleAdminUpdateGroup
./ng net.accelbyte.sdk.cli.Main ugc singleAdminUpdateGroup \
    --groupId 'JbSbwDa8' \
    --namespace "$AB_NAMESPACE" \
    --body '{"contents": ["E28CVN8D", "bRnnmG6G", "JZHGVxq8"], "name": "gFSVuigx"}' \
    > test.out 2>&1
eval_tap $? 27 'SingleAdminUpdateGroup' test.out

#- 28 SingleAdminDeleteGroup
./ng net.accelbyte.sdk.cli.Main ugc singleAdminDeleteGroup \
    --groupId 'FCWtbjMn' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 28 'SingleAdminDeleteGroup' test.out

#- 29 SingleAdminGetGroupContents
./ng net.accelbyte.sdk.cli.Main ugc singleAdminGetGroupContents \
    --groupId 'KTSQYooq' \
    --namespace "$AB_NAMESPACE" \
    --limit '73' \
    --offset '0' \
    > test.out 2>&1
eval_tap $? 29 'SingleAdminGetGroupContents' test.out

#- 30 AdminGetTag
./ng net.accelbyte.sdk.cli.Main ugc adminGetTag \
    --namespace "$AB_NAMESPACE" \
    --limit '34' \
    --offset '11' \
    > test.out 2>&1
eval_tap $? 30 'AdminGetTag' test.out

#- 31 AdminCreateTag
./ng net.accelbyte.sdk.cli.Main ugc adminCreateTag \
    --namespace "$AB_NAMESPACE" \
    --body '{"tag": "lFDzW9Z4"}' \
    > test.out 2>&1
eval_tap $? 31 'AdminCreateTag' test.out

#- 32 AdminUpdateTag
./ng net.accelbyte.sdk.cli.Main ugc adminUpdateTag \
    --namespace "$AB_NAMESPACE" \
    --tagId 'NCiJeYe6' \
    --body '{"tag": "hPeoPiaS"}' \
    > test.out 2>&1
eval_tap $? 32 'AdminUpdateTag' test.out

#- 33 AdminDeleteTag
./ng net.accelbyte.sdk.cli.Main ugc adminDeleteTag \
    --namespace "$AB_NAMESPACE" \
    --tagId 'Ix8Vbb4K' \
    > test.out 2>&1
eval_tap $? 33 'AdminDeleteTag' test.out

#- 34 AdminGetType
./ng net.accelbyte.sdk.cli.Main ugc adminGetType \
    --namespace "$AB_NAMESPACE" \
    --limit '90' \
    --offset '28' \
    > test.out 2>&1
eval_tap $? 34 'AdminGetType' test.out

#- 35 AdminCreateType
./ng net.accelbyte.sdk.cli.Main ugc adminCreateType \
    --namespace "$AB_NAMESPACE" \
    --body '{"subtype": ["m2UrxR17", "18l7qw6L", "2dgyQQrg"], "type": "RNZElQbY"}' \
    > test.out 2>&1
eval_tap $? 35 'AdminCreateType' test.out

#- 36 AdminUpdateType
./ng net.accelbyte.sdk.cli.Main ugc adminUpdateType \
    --namespace "$AB_NAMESPACE" \
    --typeId 'UfjkFYr5' \
    --body '{"subtype": ["L6QXX5S8", "8L8fE7fG", "37YqT4Ok"], "type": "Go9PuUWi"}' \
    > test.out 2>&1
eval_tap $? 36 'AdminUpdateType' test.out

#- 37 AdminDeleteType
./ng net.accelbyte.sdk.cli.Main ugc adminDeleteType \
    --namespace "$AB_NAMESPACE" \
    --typeId 'jNiRlJnk' \
    > test.out 2>&1
eval_tap $? 37 'AdminDeleteType' test.out

#- 38 AdminGetChannel
./ng net.accelbyte.sdk.cli.Main ugc adminGetChannel \
    --namespace "$AB_NAMESPACE" \
    --userId 'XZQ2f5Jj' \
    --limit '26' \
    --name 'Kv0hpasy' \
    --offset '88' \
    > test.out 2>&1
eval_tap $? 38 'AdminGetChannel' test.out

#- 39 AdminDeleteAllUserChannels
./ng net.accelbyte.sdk.cli.Main ugc adminDeleteAllUserChannels \
    --namespace "$AB_NAMESPACE" \
    --userId 'ODDVoSgi' \
    > test.out 2>&1
eval_tap $? 39 'AdminDeleteAllUserChannels' test.out

#- 40 AdminUpdateChannel
./ng net.accelbyte.sdk.cli.Main ugc adminUpdateChannel \
    --channelId 'A7uaj6mf' \
    --namespace "$AB_NAMESPACE" \
    --userId 'YUNu0w4F' \
    --body '{"name": "5oTeQeMy"}' \
    > test.out 2>&1
eval_tap $? 40 'AdminUpdateChannel' test.out

#- 41 AdminDeleteChannel
./ng net.accelbyte.sdk.cli.Main ugc adminDeleteChannel \
    --channelId 'XvviF3qP' \
    --namespace "$AB_NAMESPACE" \
    --userId 'JQZSEkuD' \
    > test.out 2>&1
eval_tap $? 41 'AdminDeleteChannel' test.out

#- 42 AdminUpdateContentS3ByShareCode
./ng net.accelbyte.sdk.cli.Main ugc adminUpdateContentS3ByShareCode \
    --channelId 's4vhoh4W' \
    --namespace "$AB_NAMESPACE" \
    --shareCode 'T8REgfPG' \
    --userId 'WfNPsZw5' \
    --body '{"contentType": "OChxOcoC", "customAttributes": {"PLQ1EscS": {}, "dvf1K4vJ": {}, "0OfwOPhK": {}}, "fileExtension": "VbXCRia7", "name": "gJbyy5ND", "payload": "OzkbuNBz", "preview": "zaVIH9fO", "previewMetadata": {"previewContentType": "m7KSDqLZ", "previewFileExtension": "C8eoMoq9"}, "shareCode": "HUMJfy9n", "subType": "6lQ9t9N5", "tags": ["K9QZXwhX", "IjLY5Igb", "DRWOGAuj"], "type": "8q3pcPRm", "updateContentFile": true}' \
    > test.out 2>&1
eval_tap $? 42 'AdminUpdateContentS3ByShareCode' test.out

#- 43 AdminUpdateContentS3
./ng net.accelbyte.sdk.cli.Main ugc adminUpdateContentS3 \
    --channelId 'TcFyFgSJ' \
    --contentId 'myp5HzPj' \
    --namespace "$AB_NAMESPACE" \
    --userId 'VLHcGMsc' \
    --body '{"contentType": "PdOgL72V", "customAttributes": {"Nd8RsXkn": {}, "8mujy09s": {}, "9RZLToKe": {}}, "fileExtension": "MVao0X5w", "name": "YgBr3Dqs", "payload": "YRT3ehWg", "preview": "ftoD9hVZ", "previewMetadata": {"previewContentType": "Fqc8pQ3T", "previewFileExtension": "AyLTFYJE"}, "shareCode": "AQFMXZxo", "subType": "H1Y5J5rw", "tags": ["LuN5Mfuo", "XbhDTgdq", "UWxkY83E"], "type": "nvfTBTm9", "updateContentFile": true}' \
    > test.out 2>&1
eval_tap $? 43 'AdminUpdateContentS3' test.out

#- 44 DeleteContentByShareCode
./ng net.accelbyte.sdk.cli.Main ugc deleteContentByShareCode \
    --channelId 'GrfwME1s' \
    --namespace "$AB_NAMESPACE" \
    --shareCode 'okYlp39G' \
    --userId '7fNUbPMx' \
    > test.out 2>&1
eval_tap $? 44 'DeleteContentByShareCode' test.out

#- 45 AdminUpdateContentDirect
eval_tap 0 45 'AdminUpdateContentDirect # SKIP deprecated' test.out

#- 46 AdminDeleteContent
./ng net.accelbyte.sdk.cli.Main ugc adminDeleteContent \
    --channelId 'jIMc02xy' \
    --contentId 'tn8wGwve' \
    --namespace "$AB_NAMESPACE" \
    --userId 'Q12jt7Su' \
    > test.out 2>&1
eval_tap $? 46 'AdminDeleteContent' test.out

#- 47 AdminGetContent
./ng net.accelbyte.sdk.cli.Main ugc adminGetContent \
    --namespace "$AB_NAMESPACE" \
    --userId 'yudKcxKv' \
    --limit '6' \
    --offset '58' \
    > test.out 2>&1
eval_tap $? 47 'AdminGetContent' test.out

#- 48 AdminDeleteAllUserContents
./ng net.accelbyte.sdk.cli.Main ugc adminDeleteAllUserContents \
    --namespace "$AB_NAMESPACE" \
    --userId 'tU9hyfGc' \
    > test.out 2>&1
eval_tap $? 48 'AdminDeleteAllUserContents' test.out

#- 49 AdminHideUserContent
./ng net.accelbyte.sdk.cli.Main ugc adminHideUserContent \
    --contentId 'UkeuFFv7' \
    --namespace "$AB_NAMESPACE" \
    --userId 'VEmffnVc' \
    --body '{"isHidden": true}' \
    > test.out 2>&1
eval_tap $? 49 'AdminHideUserContent' test.out

#- 50 AdminGetAllGroups
./ng net.accelbyte.sdk.cli.Main ugc adminGetAllGroups \
    --namespace "$AB_NAMESPACE" \
    --userId 'OJY0TFqe' \
    --limit '59' \
    --offset '59' \
    > test.out 2>&1
eval_tap $? 50 'AdminGetAllGroups' test.out

#- 51 AdminDeleteAllUserGroup
./ng net.accelbyte.sdk.cli.Main ugc adminDeleteAllUserGroup \
    --namespace "$AB_NAMESPACE" \
    --userId 'kv6bHYJR' \
    > test.out 2>&1
eval_tap $? 51 'AdminDeleteAllUserGroup' test.out

#- 52 AdminGetGroup
./ng net.accelbyte.sdk.cli.Main ugc adminGetGroup \
    --groupId 'qLAyqBf6' \
    --namespace "$AB_NAMESPACE" \
    --userId 'jkHmc6VN' \
    > test.out 2>&1
eval_tap $? 52 'AdminGetGroup' test.out

#- 53 AdminUpdateGroup
./ng net.accelbyte.sdk.cli.Main ugc adminUpdateGroup \
    --groupId '0NxptMVF' \
    --namespace "$AB_NAMESPACE" \
    --userId '939StuO2' \
    --body '{"contents": ["YrrqoBaI", "T84CDFiP", "L3j6vehs"], "name": "lahpr14M"}' \
    > test.out 2>&1
eval_tap $? 53 'AdminUpdateGroup' test.out

#- 54 AdminDeleteGroup
./ng net.accelbyte.sdk.cli.Main ugc adminDeleteGroup \
    --groupId 'QGZrZK80' \
    --namespace "$AB_NAMESPACE" \
    --userId 'yKHj5qy8' \
    > test.out 2>&1
eval_tap $? 54 'AdminDeleteGroup' test.out

#- 55 AdminGetGroupContents
./ng net.accelbyte.sdk.cli.Main ugc adminGetGroupContents \
    --groupId '9IC7WOz7' \
    --namespace "$AB_NAMESPACE" \
    --userId 'rQRlvL4d' \
    --limit '54' \
    --offset '41' \
    > test.out 2>&1
eval_tap $? 55 'AdminGetGroupContents' test.out

#- 56 AdminDeleteAllUserStates
./ng net.accelbyte.sdk.cli.Main ugc adminDeleteAllUserStates \
    --namespace "$AB_NAMESPACE" \
    --userId 'YR47wEsu' \
    > test.out 2>&1
eval_tap $? 56 'AdminDeleteAllUserStates' test.out

#- 57 SearchChannelSpecificContent
./ng net.accelbyte.sdk.cli.Main ugc searchChannelSpecificContent \
    --channelId 'irek1JvW' \
    --namespace "$AB_NAMESPACE" \
    --creator 'N1jmIDbP' \
    --ishidden 'V46xFt3b' \
    --isofficial 'zMWhHJNM' \
    --limit '32' \
    --name 'Usiktah2' \
    --offset '43' \
    --orderby 'hlPRuRN6' \
    --sortby 'q0SEVQYi' \
    --subtype '3bE5mTTc' \
    --tags '1RglJZ4C,uAfpwY11,Vk69yku2' \
    --type 'nXvJRD5l' \
    --userId '1i8RqUeP' \
    > test.out 2>&1
eval_tap $? 57 'SearchChannelSpecificContent' test.out

#- 58 PublicSearchContent
./ng net.accelbyte.sdk.cli.Main ugc publicSearchContent \
    --namespace "$AB_NAMESPACE" \
    --creator 'vJIUpGkl' \
    --ishidden 'fxf33VlZ' \
    --isofficial 'ytWzIZI6' \
    --limit '80' \
    --name 'KiYlXsga' \
    --offset '49' \
    --orderby '58kIMrLe' \
    --sortby 'lvXH98BM' \
    --subtype 'FMn65GnI' \
    --tags 'fWgqaQvH,rqlvCn8P,eFaF3S5X' \
    --type 'WkotnvLg' \
    --userId 'JOY2vth2' \
    > test.out 2>&1
eval_tap $? 58 'PublicSearchContent' test.out

#- 59 PublicGetContentBulk
./ng net.accelbyte.sdk.cli.Main ugc publicGetContentBulk \
    --namespace "$AB_NAMESPACE" \
    --body '{"contentIds": ["kkiLAQhe", "SFhxGkQ4", "fZKoVSYB"]}' \
    > test.out 2>&1
eval_tap $? 59 'PublicGetContentBulk' test.out

#- 60 GetFollowedContent
./ng net.accelbyte.sdk.cli.Main ugc getFollowedContent \
    --namespace "$AB_NAMESPACE" \
    --limit '92' \
    --offset '96' \
    > test.out 2>&1
eval_tap $? 60 'GetFollowedContent' test.out

#- 61 GetLikedContent
./ng net.accelbyte.sdk.cli.Main ugc getLikedContent \
    --namespace "$AB_NAMESPACE" \
    --isofficial  \
    --limit '67' \
    --name 'thvdg2Nh' \
    --offset '31' \
    --orderby 'xd8VJ9XB' \
    --sortby 'PHT0uM5O' \
    --subtype '1tLm40sj' \
    --tags 'seUXjp77,PD4VUaXE,16K6qKDJ' \
    --type '6OIzDM4a' \
    > test.out 2>&1
eval_tap $? 61 'GetLikedContent' test.out

#- 62 PublicGetContentBulkByShareCodes
./ng net.accelbyte.sdk.cli.Main ugc publicGetContentBulkByShareCodes \
    --namespace "$AB_NAMESPACE" \
    --body '{"shareCodes": ["v5S0Grs8", "KOGxxMjI", "CeZJYQDe"]}' \
    > test.out 2>&1
eval_tap $? 62 'PublicGetContentBulkByShareCodes' test.out

#- 63 PublicDownloadContentByShareCode
./ng net.accelbyte.sdk.cli.Main ugc publicDownloadContentByShareCode \
    --namespace "$AB_NAMESPACE" \
    --shareCode 'UkvcTx45' \
    > test.out 2>&1
eval_tap $? 63 'PublicDownloadContentByShareCode' test.out

#- 64 PublicDownloadContentByContentID
./ng net.accelbyte.sdk.cli.Main ugc publicDownloadContentByContentID \
    --contentId 'ypIxeXVj' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 64 'PublicDownloadContentByContentID' test.out

#- 65 AddDownloadCount
./ng net.accelbyte.sdk.cli.Main ugc addDownloadCount \
    --contentId 'ljIvhBMr' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 65 'AddDownloadCount' test.out

#- 66 UpdateContentLikeStatus
./ng net.accelbyte.sdk.cli.Main ugc updateContentLikeStatus \
    --contentId 'wfNiKTQn' \
    --namespace "$AB_NAMESPACE" \
    --body '{"likeStatus": false}' \
    > test.out 2>&1
eval_tap $? 66 'UpdateContentLikeStatus' test.out

#- 67 PublicDownloadContentPreview
./ng net.accelbyte.sdk.cli.Main ugc publicDownloadContentPreview \
    --contentId 'dgZsOjWQ' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 67 'PublicDownloadContentPreview' test.out

#- 68 GetTag
./ng net.accelbyte.sdk.cli.Main ugc getTag \
    --namespace "$AB_NAMESPACE" \
    --limit '13' \
    --offset '64' \
    > test.out 2>&1
eval_tap $? 68 'GetTag' test.out

#- 69 GetType
./ng net.accelbyte.sdk.cli.Main ugc getType \
    --namespace "$AB_NAMESPACE" \
    --limit '89' \
    --offset '91' \
    > test.out 2>&1
eval_tap $? 69 'GetType' test.out

#- 70 PublicSearchCreator
./ng net.accelbyte.sdk.cli.Main ugc publicSearchCreator \
    --namespace "$AB_NAMESPACE" \
    --limit '55' \
    --offset '37' \
    --orderby '0sdULrsQ' \
    --sortby 'aQkiqtzK' \
    > test.out 2>&1
eval_tap $? 70 'PublicSearchCreator' test.out

#- 71 GetFollowedUsers
./ng net.accelbyte.sdk.cli.Main ugc getFollowedUsers \
    --namespace "$AB_NAMESPACE" \
    --limit '17' \
    --offset '72' \
    > test.out 2>&1
eval_tap $? 71 'GetFollowedUsers' test.out

#- 72 PublicGetCreator
./ng net.accelbyte.sdk.cli.Main ugc publicGetCreator \
    --namespace "$AB_NAMESPACE" \
    --userId 'NNnLV3y4' \
    > test.out 2>&1
eval_tap $? 72 'PublicGetCreator' test.out

#- 73 GetChannels
./ng net.accelbyte.sdk.cli.Main ugc getChannels \
    --namespace "$AB_NAMESPACE" \
    --userId 'vTXS99sY' \
    --limit '67' \
    --name 'S4kNspOH' \
    --offset '74' \
    > test.out 2>&1
eval_tap $? 73 'GetChannels' test.out

#- 74 PublicCreateChannel
./ng net.accelbyte.sdk.cli.Main ugc publicCreateChannel \
    --namespace "$AB_NAMESPACE" \
    --userId 'RQoi58mC' \
    --body '{"name": "EfrI3kcs"}' \
    > test.out 2>&1
eval_tap $? 74 'PublicCreateChannel' test.out

#- 75 DeleteAllUserChannel
./ng net.accelbyte.sdk.cli.Main ugc deleteAllUserChannel \
    --namespace "$AB_NAMESPACE" \
    --userId 'sbKbWWmR' \
    > test.out 2>&1
eval_tap $? 75 'DeleteAllUserChannel' test.out

#- 76 UpdateChannel
./ng net.accelbyte.sdk.cli.Main ugc updateChannel \
    --channelId 'IGgRPReK' \
    --namespace "$AB_NAMESPACE" \
    --userId 'ss5jTM0M' \
    --body '{"name": "MVwCUMwh"}' \
    > test.out 2>&1
eval_tap $? 76 'UpdateChannel' test.out

#- 77 DeleteChannel
./ng net.accelbyte.sdk.cli.Main ugc deleteChannel \
    --channelId 'F5CJ7p5t' \
    --namespace "$AB_NAMESPACE" \
    --userId 'uJLb69c3' \
    > test.out 2>&1
eval_tap $? 77 'DeleteChannel' test.out

#- 78 CreateContentDirect
eval_tap 0 78 'CreateContentDirect # SKIP deprecated' test.out

#- 79 CreateContentS3
./ng net.accelbyte.sdk.cli.Main ugc createContentS3 \
    --channelId 'eKYFL5xb' \
    --namespace "$AB_NAMESPACE" \
    --userId '61P3R0TL' \
    --body '{"contentType": "8TZ7iVmT", "customAttributes": {"4AQpsDhR": {}, "T3ZOrkbx": {}, "rCS61xi1": {}}, "fileExtension": "Gida7zfV", "name": "1wzrWM5a", "preview": "oaejZPv6", "previewMetadata": {"previewContentType": "VYfab4EJ", "previewFileExtension": "orzoqheE"}, "subType": "cZM6Cbev", "tags": ["8Y300Oxq", "TVzCUKYb", "ftlunOJc"], "type": "n3zbWxbb"}' \
    > test.out 2>&1
eval_tap $? 79 'CreateContentS3' test.out

#- 80 PublicUpdateContentByShareCode
./ng net.accelbyte.sdk.cli.Main ugc publicUpdateContentByShareCode \
    --channelId '3Xmi0pja' \
    --namespace "$AB_NAMESPACE" \
    --shareCode 'Gr96jTju' \
    --userId 'Uc8KKwCh' \
    --body '{"contentType": "vjhdHIAh", "customAttributes": {"nlRdpdpc": {}, "kS3qjW46": {}, "GkMAhba0": {}}, "fileExtension": "gJ13CtrN", "name": "40lF9G8H", "payload": "a8iSUPJj", "preview": "9hBjpfsH", "previewMetadata": {"previewContentType": "zTahaSNt", "previewFileExtension": "0xpDhZ6H"}, "subType": "sK3Ls7P3", "tags": ["RjOoH0Kd", "zogXmem3", "EkAGU3Nt"], "type": "MQC7Cfjf", "updateContentFile": false}' \
    > test.out 2>&1
eval_tap $? 80 'PublicUpdateContentByShareCode' test.out

#- 81 UpdateContentS3
./ng net.accelbyte.sdk.cli.Main ugc updateContentS3 \
    --channelId 'tmmabuV4' \
    --contentId 'N58W2Q4N' \
    --namespace "$AB_NAMESPACE" \
    --userId 'SmOhx6VS' \
    --body '{"contentType": "FhkMLvVk", "customAttributes": {"ZJs8asB2": {}, "BHdr4QY7": {}, "akwJJ2VB": {}}, "fileExtension": "LBkfc8pn", "name": "x0XqG83O", "payload": "VLzJlLeJ", "preview": "0qVBIQP8", "previewMetadata": {"previewContentType": "zrlKbkQG", "previewFileExtension": "IkYkMBBG"}, "subType": "dNK5WTZa", "tags": ["nuGL6VRZ", "k9GywcxN", "OqqqDix0"], "type": "kgOr5rVq", "updateContentFile": false}' \
    > test.out 2>&1
eval_tap $? 81 'UpdateContentS3' test.out

#- 82 PublicDeleteContentByShareCode
./ng net.accelbyte.sdk.cli.Main ugc publicDeleteContentByShareCode \
    --channelId 'q3W9CaXs' \
    --namespace "$AB_NAMESPACE" \
    --shareCode 'nbTT04ZC' \
    --userId 'c4tnMGSD' \
    > test.out 2>&1
eval_tap $? 82 'PublicDeleteContentByShareCode' test.out

#- 83 UpdateContentDirect
eval_tap 0 83 'UpdateContentDirect # SKIP deprecated' test.out

#- 84 DeleteContent
./ng net.accelbyte.sdk.cli.Main ugc deleteContent \
    --channelId 'uTKvzC72' \
    --contentId '40U6MXfB' \
    --namespace "$AB_NAMESPACE" \
    --userId 'v9VYHnYf' \
    > test.out 2>&1
eval_tap $? 84 'DeleteContent' test.out

#- 85 UpdateContentShareCode
./ng net.accelbyte.sdk.cli.Main ugc updateContentShareCode \
    --channelId '25eapyW4' \
    --contentId '14mJbshB' \
    --namespace "$AB_NAMESPACE" \
    --userId 'T42ppesw' \
    --body '{"shareCode": "KT5HHDou"}' \
    > test.out 2>&1
eval_tap $? 85 'UpdateContentShareCode' test.out

#- 86 PublicGetUserContent
./ng net.accelbyte.sdk.cli.Main ugc publicGetUserContent \
    --namespace "$AB_NAMESPACE" \
    --userId 'G7jLosqM' \
    --limit '3' \
    --offset '75' \
    > test.out 2>&1
eval_tap $? 86 'PublicGetUserContent' test.out

#- 87 DeleteAllUserContents
./ng net.accelbyte.sdk.cli.Main ugc deleteAllUserContents \
    --namespace "$AB_NAMESPACE" \
    --userId 'ZBTH1nF6' \
    > test.out 2>&1
eval_tap $? 87 'DeleteAllUserContents' test.out

#- 88 UpdateScreenshots
./ng net.accelbyte.sdk.cli.Main ugc updateScreenshots \
    --contentId '64jgfGTV' \
    --namespace "$AB_NAMESPACE" \
    --userId 'z4b6rEcC' \
    --body '{"screenshots": [{"description": "Jhle4pdM", "screenshotId": "FXjRErEV"}, {"description": "wZeUrmCg", "screenshotId": "CsHlR9sy"}, {"description": "YfITEwGO", "screenshotId": "Q6JrtPb6"}]}' \
    > test.out 2>&1
eval_tap $? 88 'UpdateScreenshots' test.out

#- 89 UploadContentScreenshot
./ng net.accelbyte.sdk.cli.Main ugc uploadContentScreenshot \
    --contentId 'A5Ho3aM1' \
    --namespace "$AB_NAMESPACE" \
    --userId '1VHet611' \
    --body '{"screenshots": [{"contentType": "sO3dKJc8", "description": "btutJSmh", "fileExtension": "bmp"}, {"contentType": "DgOnAIcP", "description": "thMavYGS", "fileExtension": "bmp"}, {"contentType": "ha2LAM8G", "description": "yNEK8Qn5", "fileExtension": "jpg"}]}' \
    > test.out 2>&1
eval_tap $? 89 'UploadContentScreenshot' test.out

#- 90 DeleteContentScreenshot
./ng net.accelbyte.sdk.cli.Main ugc deleteContentScreenshot \
    --contentId 'os4UXXOb' \
    --namespace "$AB_NAMESPACE" \
    --screenshotId '5qvve5AB' \
    --userId 'MqgaAUT2' \
    > test.out 2>&1
eval_tap $? 90 'DeleteContentScreenshot' test.out

#- 91 UpdateUserFollowStatus
./ng net.accelbyte.sdk.cli.Main ugc updateUserFollowStatus \
    --namespace "$AB_NAMESPACE" \
    --userId 'BaLRgJ0L' \
    --body '{"followStatus": false}' \
    > test.out 2>&1
eval_tap $? 91 'UpdateUserFollowStatus' test.out

#- 92 GetPublicFollowers
./ng net.accelbyte.sdk.cli.Main ugc getPublicFollowers \
    --namespace "$AB_NAMESPACE" \
    --userId 'cCdLkNtS' \
    --limit '81' \
    --offset '43' \
    > test.out 2>&1
eval_tap $? 92 'GetPublicFollowers' test.out

#- 93 GetPublicFollowing
./ng net.accelbyte.sdk.cli.Main ugc getPublicFollowing \
    --namespace "$AB_NAMESPACE" \
    --userId 'WtebpAjR' \
    --limit '99' \
    --offset '62' \
    > test.out 2>&1
eval_tap $? 93 'GetPublicFollowing' test.out

#- 94 GetGroups
./ng net.accelbyte.sdk.cli.Main ugc getGroups \
    --namespace "$AB_NAMESPACE" \
    --userId '3wZSfGfk' \
    --limit '6' \
    --offset '88' \
    > test.out 2>&1
eval_tap $? 94 'GetGroups' test.out

#- 95 CreateGroup
./ng net.accelbyte.sdk.cli.Main ugc createGroup \
    --namespace "$AB_NAMESPACE" \
    --userId '4lyUcUCI' \
    --body '{"contents": ["f82mHQbF", "fgND8PUh", "XImrts0J"], "name": "N2sYe3my"}' \
    > test.out 2>&1
eval_tap $? 95 'CreateGroup' test.out

#- 96 DeleteAllUserGroup
./ng net.accelbyte.sdk.cli.Main ugc deleteAllUserGroup \
    --namespace "$AB_NAMESPACE" \
    --userId 'iYu9deCb' \
    > test.out 2>&1
eval_tap $? 96 'DeleteAllUserGroup' test.out

#- 97 GetGroup
./ng net.accelbyte.sdk.cli.Main ugc getGroup \
    --groupId '2OCPBQot' \
    --namespace "$AB_NAMESPACE" \
    --userId 'TkQ3kkxq' \
    > test.out 2>&1
eval_tap $? 97 'GetGroup' test.out

#- 98 UpdateGroup
./ng net.accelbyte.sdk.cli.Main ugc updateGroup \
    --groupId '40X9EObt' \
    --namespace "$AB_NAMESPACE" \
    --userId 'P8OjqzZt' \
    --body '{"contents": ["V5VqDvS7", "D4OCl6tG", "W2v9Zt9h"], "name": "qd4nMGpH"}' \
    > test.out 2>&1
eval_tap $? 98 'UpdateGroup' test.out

#- 99 DeleteGroup
./ng net.accelbyte.sdk.cli.Main ugc deleteGroup \
    --groupId 'WdOyT3RK' \
    --namespace "$AB_NAMESPACE" \
    --userId '8vqJFlVN' \
    > test.out 2>&1
eval_tap $? 99 'DeleteGroup' test.out

#- 100 GetGroupContent
./ng net.accelbyte.sdk.cli.Main ugc getGroupContent \
    --groupId 'Gtf0gCKh' \
    --namespace "$AB_NAMESPACE" \
    --userId 'yuNNmaUR' \
    --limit '12' \
    --offset '16' \
    > test.out 2>&1
eval_tap $? 100 'GetGroupContent' test.out

#- 101 DeleteAllUserStates
./ng net.accelbyte.sdk.cli.Main ugc deleteAllUserStates \
    --namespace "$AB_NAMESPACE" \
    --userId 'l5m5ayQ2' \
    > test.out 2>&1
eval_tap $? 101 'DeleteAllUserStates' test.out

#- 102 AdminGetContentByChannelIDV2
./ng net.accelbyte.sdk.cli.Main ugc adminGetContentByChannelIDV2 \
    --channelId 'CaSB2Wdp' \
    --namespace "$AB_NAMESPACE" \
    --limit '23' \
    --name 'buOKrSc1' \
    --offset '55' \
    --sortBy '9swUtMNj' \
    > test.out 2>&1
eval_tap $? 102 'AdminGetContentByChannelIDV2' test.out

#- 103 AdminCreateContentV2
./ng net.accelbyte.sdk.cli.Main ugc adminCreateContentV2 \
    --channelId 'Jq2v4mWl' \
    --namespace "$AB_NAMESPACE" \
    --body '{"contentType": "p4hHblOX", "customAttributes": {"bvDJtFS2": {}, "4rzHYpzU": {}, "go2d3OuV": {}}, "fileExtension": "iv2Sl29Q", "name": "6h2NnizN", "shareCode": "CLYEosUL", "subType": "y0HzD9df", "tags": ["IlVCRoIU", "C4rv2aYI", "GU1lE5Qd"], "type": "UuwMg6YG"}' \
    > test.out 2>&1
eval_tap $? 103 'AdminCreateContentV2' test.out

#- 104 AdminDeleteOfficialContentV2
./ng net.accelbyte.sdk.cli.Main ugc adminDeleteOfficialContentV2 \
    --channelId '1gIiTaxi' \
    --contentId 'Hxxtae0V' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 104 'AdminDeleteOfficialContentV2' test.out

#- 105 AdminUpdateOfficialContentV2
./ng net.accelbyte.sdk.cli.Main ugc adminUpdateOfficialContentV2 \
    --channelId 'wAsBFYpa' \
    --contentId 'dXytMlxe' \
    --namespace "$AB_NAMESPACE" \
    --body '{"customAttributes": {"ve5hyOD7": {}, "vAHx1fva": {}, "1uXngokz": {}}, "name": "SRUNvj6u", "shareCode": "CompgqpQ", "subType": "DCz3prha", "tags": ["eho47ZQy", "Ma104njK", "txxC5Cpk"], "type": "rjH5jmxM"}' \
    > test.out 2>&1
eval_tap $? 105 'AdminUpdateOfficialContentV2' test.out

#- 106 AdminCopyContent
./ng net.accelbyte.sdk.cli.Main ugc adminCopyContent \
    --channelId 'M1oJZMKz' \
    --contentId 'WK7ihDvv' \
    --namespace "$AB_NAMESPACE" \
    --body '{"customAttributes": {"Sms4lhhI": {}, "4bgvBjjR": {}, "5vclEL0S": {}}, "name": "quXGcwDE", "subType": "CKDPxzOK", "tags": ["IQJyDKuu", "CdQBvtfn", "xeVlsOyN"], "targetChannelId": "P1PP06rT", "type": "sZeLA7Yi"}' \
    > test.out 2>&1
eval_tap $? 106 'AdminCopyContent' test.out

#- 107 AdminUpdateOfficialContentFileLocation
./ng net.accelbyte.sdk.cli.Main ugc adminUpdateOfficialContentFileLocation \
    --channelId '4p72QjSc' \
    --contentId 'XPnitlf1' \
    --namespace "$AB_NAMESPACE" \
    --body '{"fileExtension": "C6kLxRJq", "fileLocation": "1p7cZeDR"}' \
    > test.out 2>&1
eval_tap $? 107 'AdminUpdateOfficialContentFileLocation' test.out

#- 108 AdminGenerateOfficialContentUploadURLV2
./ng net.accelbyte.sdk.cli.Main ugc adminGenerateOfficialContentUploadURLV2 \
    --channelId 'pfP2eup6' \
    --contentId '3NEd8DJC' \
    --namespace "$AB_NAMESPACE" \
    --body '{"contentType": "5qUm0qXl", "fileExtension": "uLPR0GH6"}' \
    > test.out 2>&1
eval_tap $? 108 'AdminGenerateOfficialContentUploadURLV2' test.out

#- 109 AdminGetConfigs
./ng net.accelbyte.sdk.cli.Main ugc adminGetConfigs \
    --namespace "$AB_NAMESPACE" \
    --limit '85' \
    --offset '34' \
    > test.out 2>&1
eval_tap $? 109 'AdminGetConfigs' test.out

#- 110 AdminUpdateConfig
./ng net.accelbyte.sdk.cli.Main ugc adminUpdateConfig \
    --key 'flRcF9a1' \
    --namespace "$AB_NAMESPACE" \
    --body '{"value": "SbfCMY31"}' \
    > test.out 2>&1
eval_tap $? 110 'AdminUpdateConfig' test.out

#- 111 AdminListContentV2
./ng net.accelbyte.sdk.cli.Main ugc adminListContentV2 \
    --namespace "$AB_NAMESPACE" \
    --isOfficial  \
    --limit '41' \
    --name 'LgPXSKvb' \
    --offset '2' \
    --sortBy 'QE19yhJ2' \
    --subType 'w8GBeqLK' \
    --tags '9tY25wSh,Ppy7Nr2T,c3ftSzBK' \
    --type 'qZKCW39o' \
    > test.out 2>&1
eval_tap $? 111 'AdminListContentV2' test.out

#- 112 AdminBulkGetContentByIDsV2
./ng net.accelbyte.sdk.cli.Main ugc adminBulkGetContentByIDsV2 \
    --namespace "$AB_NAMESPACE" \
    --body '{"contentIds": ["d8pA2jLk", "tuR5e7Zn", "xU8FYi6k"]}' \
    > test.out 2>&1
eval_tap $? 112 'AdminBulkGetContentByIDsV2' test.out

#- 113 AdminGetContentBulkByShareCodesV2
./ng net.accelbyte.sdk.cli.Main ugc adminGetContentBulkByShareCodesV2 \
    --namespace "$AB_NAMESPACE" \
    --body '{"shareCodes": ["oqb4QiMo", "XoZkEE1k", "ws1hscmZ"]}' \
    > test.out 2>&1
eval_tap $? 113 'AdminGetContentBulkByShareCodesV2' test.out

#- 114 AdminGetContentByShareCodeV2
./ng net.accelbyte.sdk.cli.Main ugc adminGetContentByShareCodeV2 \
    --namespace "$AB_NAMESPACE" \
    --shareCode 'kAw8grkR' \
    > test.out 2>&1
eval_tap $? 114 'AdminGetContentByShareCodeV2' test.out

#- 115 AdminGetContentByContentIDV2
./ng net.accelbyte.sdk.cli.Main ugc adminGetContentByContentIDV2 \
    --contentId 'gEvZrPhG' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 115 'AdminGetContentByContentIDV2' test.out

#- 116 RollbackContentVersionV2
./ng net.accelbyte.sdk.cli.Main ugc rollbackContentVersionV2 \
    --contentId '73Hu4JNT' \
    --namespace "$AB_NAMESPACE" \
    --versionId 'nVDSObV0' \
    > test.out 2>&1
eval_tap $? 116 'RollbackContentVersionV2' test.out

#- 117 AdminUpdateScreenshotsV2
./ng net.accelbyte.sdk.cli.Main ugc adminUpdateScreenshotsV2 \
    --contentId 'ifTuvWmw' \
    --namespace "$AB_NAMESPACE" \
    --body '{"screenshots": [{"description": "41BYMUaJ", "screenshotId": "OtoUmlqA"}, {"description": "A3U8fmqY", "screenshotId": "HSzIQ8lO"}, {"description": "fGi4J66V", "screenshotId": "3vCfUCyx"}]}' \
    > test.out 2>&1
eval_tap $? 117 'AdminUpdateScreenshotsV2' test.out

#- 118 AdminUploadContentScreenshotV2
./ng net.accelbyte.sdk.cli.Main ugc adminUploadContentScreenshotV2 \
    --contentId 'YN6Kb0W9' \
    --namespace "$AB_NAMESPACE" \
    --body '{"screenshots": [{"contentType": "lsOPDXw4", "description": "Ytw7cApN", "fileExtension": "jpg"}, {"contentType": "zXnPhjiU", "description": "LYH7Fjj5", "fileExtension": "bmp"}, {"contentType": "f62IL6Sh", "description": "rFqJEWjT", "fileExtension": "jpeg"}]}' \
    > test.out 2>&1
eval_tap $? 118 'AdminUploadContentScreenshotV2' test.out

#- 119 AdminDeleteContentScreenshotV2
./ng net.accelbyte.sdk.cli.Main ugc adminDeleteContentScreenshotV2 \
    --contentId 'Aunlx3be' \
    --namespace "$AB_NAMESPACE" \
    --screenshotId 'Fuy08mE2' \
    > test.out 2>&1
eval_tap $? 119 'AdminDeleteContentScreenshotV2' test.out

#- 120 ListContentVersionsV2
./ng net.accelbyte.sdk.cli.Main ugc listContentVersionsV2 \
    --contentId 'ZfSZOUu9' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 120 'ListContentVersionsV2' test.out

#- 121 AdminGetOfficialGroupContentsV2
./ng net.accelbyte.sdk.cli.Main ugc adminGetOfficialGroupContentsV2 \
    --groupId 'pRWshIix' \
    --namespace "$AB_NAMESPACE" \
    --limit '46' \
    --offset '4' \
    > test.out 2>&1
eval_tap $? 121 'AdminGetOfficialGroupContentsV2' test.out

#- 122 AdminListStagingContents
./ng net.accelbyte.sdk.cli.Main ugc adminListStagingContents \
    --namespace "$AB_NAMESPACE" \
    --limit '59' \
    --offset '84' \
    --sortBy 'ErWTzLxu' \
    --status 'fc0u9qc3' \
    > test.out 2>&1
eval_tap $? 122 'AdminListStagingContents' test.out

#- 123 AdminGetStagingContentByID
./ng net.accelbyte.sdk.cli.Main ugc adminGetStagingContentByID \
    --contentId 't0A9T0fw' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 123 'AdminGetStagingContentByID' test.out

#- 124 AdminApproveStagingContent
./ng net.accelbyte.sdk.cli.Main ugc adminApproveStagingContent \
    --contentId 'SPVFlEdr' \
    --namespace "$AB_NAMESPACE" \
    --body '{"approved": false, "note": "8ejAikBA"}' \
    > test.out 2>&1
eval_tap $? 124 'AdminApproveStagingContent' test.out

#- 125 AdminUpdateContentByShareCodeV2
./ng net.accelbyte.sdk.cli.Main ugc adminUpdateContentByShareCodeV2 \
    --channelId 'LqoAguqk' \
    --namespace "$AB_NAMESPACE" \
    --shareCode 'S71ARX0s' \
    --userId 'AgoMWMhT' \
    --body '{"customAttributes": {"Dul61Syo": {}, "QcJZlXVL": {}, "xl4Pg42Y": {}}, "name": "OHWv42EJ", "shareCode": "xwmSjvOD", "subType": "CDDVpMU2", "tags": ["Rk5nL4Jc", "htpICnqM", "7iTaP72F"], "type": "B4Pv5kpk"}' \
    > test.out 2>&1
eval_tap $? 125 'AdminUpdateContentByShareCodeV2' test.out

#- 126 AdminDeleteContentByShareCodeV2
./ng net.accelbyte.sdk.cli.Main ugc adminDeleteContentByShareCodeV2 \
    --channelId 'QBXRcmi4' \
    --namespace "$AB_NAMESPACE" \
    --shareCode '1oAsyfos' \
    --userId 'biXvhEDv' \
    > test.out 2>&1
eval_tap $? 126 'AdminDeleteContentByShareCodeV2' test.out

#- 127 AdminDeleteUserContentV2
./ng net.accelbyte.sdk.cli.Main ugc adminDeleteUserContentV2 \
    --channelId 'ahTPDFWr' \
    --contentId 'ghM3WTer' \
    --namespace "$AB_NAMESPACE" \
    --userId 'liTcGMs8' \
    > test.out 2>&1
eval_tap $? 127 'AdminDeleteUserContentV2' test.out

#- 128 AdminUpdateUserContentV2
./ng net.accelbyte.sdk.cli.Main ugc adminUpdateUserContentV2 \
    --channelId 'VWcv2mbE' \
    --contentId 'OUiK7tXP' \
    --namespace "$AB_NAMESPACE" \
    --userId 'IEt2UeON' \
    --body '{"customAttributes": {"FbuLeTiN": {}, "O9tNe1YM": {}, "NlV3Q44C": {}}, "name": "NjssPQJK", "shareCode": "Mhuka773", "subType": "X4svEiOT", "tags": ["Xw3OhN08", "q7MY6Mqt", "u1dTB9Az"], "type": "I1ERUmnZ"}' \
    > test.out 2>&1
eval_tap $? 128 'AdminUpdateUserContentV2' test.out

#- 129 AdminUpdateUserContentFileLocation
./ng net.accelbyte.sdk.cli.Main ugc adminUpdateUserContentFileLocation \
    --channelId 'y7kzm2nN' \
    --contentId '0bUksBvX' \
    --namespace "$AB_NAMESPACE" \
    --userId '5r644fW6' \
    --body '{"fileExtension": "sWV1rtYn", "fileLocation": "lPzLUkjh"}' \
    > test.out 2>&1
eval_tap $? 129 'AdminUpdateUserContentFileLocation' test.out

#- 130 AdminGenerateUserContentUploadURLV2
./ng net.accelbyte.sdk.cli.Main ugc adminGenerateUserContentUploadURLV2 \
    --channelId 'dCSbnupQ' \
    --contentId 'mc5PpCps' \
    --namespace "$AB_NAMESPACE" \
    --userId 'CTBOtfxb' \
    --body '{"contentType": "BUQXMwnZ", "fileExtension": "gTxIUzcK"}' \
    > test.out 2>&1
eval_tap $? 130 'AdminGenerateUserContentUploadURLV2' test.out

#- 131 AdminGetContentByUserIDV2
./ng net.accelbyte.sdk.cli.Main ugc adminGetContentByUserIDV2 \
    --namespace "$AB_NAMESPACE" \
    --userId 'Adpo5Z6q' \
    --limit '17' \
    --offset '27' \
    --sortBy 'TSWnRuDB' \
    > test.out 2>&1
eval_tap $? 131 'AdminGetContentByUserIDV2' test.out

#- 132 AdminUpdateContentHideStatusV2
./ng net.accelbyte.sdk.cli.Main ugc adminUpdateContentHideStatusV2 \
    --contentId 'N07Q0pBd' \
    --namespace "$AB_NAMESPACE" \
    --userId 'nW7zHJ5k' \
    --body '{"isHidden": false}' \
    > test.out 2>&1
eval_tap $? 132 'AdminUpdateContentHideStatusV2' test.out

#- 133 AdminGetUserGroupContentsV2
./ng net.accelbyte.sdk.cli.Main ugc adminGetUserGroupContentsV2 \
    --groupId 'hOj1n2um' \
    --namespace "$AB_NAMESPACE" \
    --userId '6phs65Xc' \
    --limit '67' \
    --offset '95' \
    > test.out 2>&1
eval_tap $? 133 'AdminGetUserGroupContentsV2' test.out

#- 134 AdminListUserStagingContents
./ng net.accelbyte.sdk.cli.Main ugc adminListUserStagingContents \
    --namespace "$AB_NAMESPACE" \
    --userId 'dsLU6xU9' \
    --limit '7' \
    --offset '46' \
    --sortBy 'DyMzcp5t' \
    --status 'KhgnJRVn' \
    > test.out 2>&1
eval_tap $? 134 'AdminListUserStagingContents' test.out

#- 135 PublicGetContentByChannelIDV2
./ng net.accelbyte.sdk.cli.Main ugc publicGetContentByChannelIDV2 \
    --channelId 'HJZQ3gBL' \
    --namespace "$AB_NAMESPACE" \
    --limit '48' \
    --name 'xJWaercv' \
    --offset '19' \
    --sortBy 'z9X7zgVw' \
    > test.out 2>&1
eval_tap $? 135 'PublicGetContentByChannelIDV2' test.out

#- 136 PublicListContentV2
./ng net.accelbyte.sdk.cli.Main ugc publicListContentV2 \
    --namespace "$AB_NAMESPACE" \
    --isOfficial  \
    --limit '83' \
    --name 'FvMz0PjM' \
    --offset '25' \
    --sortBy 'JD36mOj5' \
    --subType 'ABMyQqAY' \
    --tags 'PIOtYUbE,BKLoxfV8,42pPP3xV' \
    --type '7Nl1hjDw' \
    > test.out 2>&1
eval_tap $? 136 'PublicListContentV2' test.out

#- 137 PublicBulkGetContentByIDV2
./ng net.accelbyte.sdk.cli.Main ugc publicBulkGetContentByIDV2 \
    --namespace "$AB_NAMESPACE" \
    --body '{"contentIds": ["H9ZNGioI", "4kSL7tJh", "UCqgrxEG"]}' \
    > test.out 2>&1
eval_tap $? 137 'PublicBulkGetContentByIDV2' test.out

#- 138 PublicGetContentBulkByShareCodesV2
./ng net.accelbyte.sdk.cli.Main ugc publicGetContentBulkByShareCodesV2 \
    --namespace "$AB_NAMESPACE" \
    --body '{"shareCodes": ["ka7nEhZC", "SgrQvaRo", "arocYMuQ"]}' \
    > test.out 2>&1
eval_tap $? 138 'PublicGetContentBulkByShareCodesV2' test.out

#- 139 PublicGetContentByShareCodeV2
./ng net.accelbyte.sdk.cli.Main ugc publicGetContentByShareCodeV2 \
    --namespace "$AB_NAMESPACE" \
    --shareCode 'bylNP5nH' \
    > test.out 2>&1
eval_tap $? 139 'PublicGetContentByShareCodeV2' test.out

#- 140 PublicGetContentByIDV2
./ng net.accelbyte.sdk.cli.Main ugc publicGetContentByIDV2 \
    --contentId '8vSdpk0Q' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 140 'PublicGetContentByIDV2' test.out

#- 141 PublicAddDownloadCountV2
./ng net.accelbyte.sdk.cli.Main ugc publicAddDownloadCountV2 \
    --contentId 'UcJoP0sG' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 141 'PublicAddDownloadCountV2' test.out

#- 142 PublicListContentDownloaderV2
./ng net.accelbyte.sdk.cli.Main ugc publicListContentDownloaderV2 \
    --contentId 'DcvKI856' \
    --namespace "$AB_NAMESPACE" \
    --limit '92' \
    --offset '73' \
    --sortBy 's2G7qflO' \
    --userId 'F8hEyFN2' \
    > test.out 2>&1
eval_tap $? 142 'PublicListContentDownloaderV2' test.out

#- 143 PublicListContentLikeV2
./ng net.accelbyte.sdk.cli.Main ugc publicListContentLikeV2 \
    --contentId 'qzZXtDTy' \
    --namespace "$AB_NAMESPACE" \
    --limit '48' \
    --offset '5' \
    --sortBy 'qXKrBUPz' \
    > test.out 2>&1
eval_tap $? 143 'PublicListContentLikeV2' test.out

#- 144 UpdateContentLikeStatusV2
./ng net.accelbyte.sdk.cli.Main ugc updateContentLikeStatusV2 \
    --contentId 'H3WkzXXX' \
    --namespace "$AB_NAMESPACE" \
    --body '{"likeStatus": false}' \
    > test.out 2>&1
eval_tap $? 144 'UpdateContentLikeStatusV2' test.out

#- 145 PublicCreateContentV2
./ng net.accelbyte.sdk.cli.Main ugc publicCreateContentV2 \
    --channelId 'CpnKHnT1' \
    --namespace "$AB_NAMESPACE" \
    --userId 'SoKMT0LW' \
    --body '{"contentType": "MKozzcwk", "customAttributes": {"iXG5yAWd": {}, "Ge2OEvgC": {}, "QwPck3UZ": {}}, "fileExtension": "3KETJkOf", "name": "n4QGVGZA", "subType": "I1Yr2dIP", "tags": ["ORBxXSGk", "aAnEHLJm", "jO7cvXCt"], "type": "3lbYDfeY"}' \
    > test.out 2>&1
eval_tap $? 145 'PublicCreateContentV2' test.out

#- 146 PublicUpdateContentByShareCodeV2
./ng net.accelbyte.sdk.cli.Main ugc publicUpdateContentByShareCodeV2 \
    --channelId 'M59RfMnn' \
    --namespace "$AB_NAMESPACE" \
    --shareCode '7PVxdYem' \
    --userId 'pkJ9JCdR' \
    --body '{"customAttributes": {"LrSMfGFu": {}, "V1A2WAAn": {}, "VJrHIUqh": {}}, "name": "un506upL", "subType": "YFrWv9kj", "tags": ["fU8zXkyK", "5gAvHrFn", "Eg8js0oV"], "type": "W1EcvbaO"}' \
    > test.out 2>&1
eval_tap $? 146 'PublicUpdateContentByShareCodeV2' test.out

#- 147 PublicDeleteContentByShareCodeV2
./ng net.accelbyte.sdk.cli.Main ugc publicDeleteContentByShareCodeV2 \
    --channelId 'ZCm2M5Vg' \
    --namespace "$AB_NAMESPACE" \
    --shareCode 'nPbch1aF' \
    --userId 'eMtjASkN' \
    > test.out 2>&1
eval_tap $? 147 'PublicDeleteContentByShareCodeV2' test.out

#- 148 PublicDeleteContentV2
./ng net.accelbyte.sdk.cli.Main ugc publicDeleteContentV2 \
    --channelId 'bUBs8NVA' \
    --contentId '2sHikJfI' \
    --namespace "$AB_NAMESPACE" \
    --userId 'oOd8ZbfX' \
    > test.out 2>&1
eval_tap $? 148 'PublicDeleteContentV2' test.out

#- 149 PublicUpdateContentV2
./ng net.accelbyte.sdk.cli.Main ugc publicUpdateContentV2 \
    --channelId 'upynRhr1' \
    --contentId 'A1DpXpIe' \
    --namespace "$AB_NAMESPACE" \
    --userId 'tMztXuT6' \
    --body '{"customAttributes": {"ovygXJIX": {}, "D6ZT3Gsx": {}, "zT8d7SJB": {}}, "name": "84pvYVKh", "subType": "YIFK4KsJ", "tags": ["hjAVTtkQ", "DCbLPVC8", "fOWT9oxY"], "type": "4zAVJvQL"}' \
    > test.out 2>&1
eval_tap $? 149 'PublicUpdateContentV2' test.out

#- 150 PublicUpdateContentFileLocation
./ng net.accelbyte.sdk.cli.Main ugc publicUpdateContentFileLocation \
    --channelId 'p4fUTPuu' \
    --contentId 'HDYRtKCu' \
    --namespace "$AB_NAMESPACE" \
    --userId 'ar23rEXv' \
    --body '{"fileExtension": "q3sYL5MD", "fileLocation": "Belql280"}' \
    > test.out 2>&1
eval_tap $? 150 'PublicUpdateContentFileLocation' test.out

#- 151 UpdateContentShareCodeV2
./ng net.accelbyte.sdk.cli.Main ugc updateContentShareCodeV2 \
    --channelId '2cSTWWmr' \
    --contentId 'U2TxfZjU' \
    --namespace "$AB_NAMESPACE" \
    --userId '3EaV3lCz' \
    --body '{"shareCode": "I6z5uSrI"}' \
    > test.out 2>&1
eval_tap $? 151 'UpdateContentShareCodeV2' test.out

#- 152 PublicGenerateContentUploadURLV2
./ng net.accelbyte.sdk.cli.Main ugc publicGenerateContentUploadURLV2 \
    --channelId 'PrJpRZU6' \
    --contentId 'DFekFjG1' \
    --namespace "$AB_NAMESPACE" \
    --userId 'I2L9QCiz' \
    --body '{"contentType": "xyVBnzsg", "fileExtension": "a6raQsvu"}' \
    > test.out 2>&1
eval_tap $? 152 'PublicGenerateContentUploadURLV2' test.out

#- 153 PublicGetContentByUserIDV2
./ng net.accelbyte.sdk.cli.Main ugc publicGetContentByUserIDV2 \
    --namespace "$AB_NAMESPACE" \
    --userId 'XI5sSopo' \
    --limit '18' \
    --offset '9' \
    --sortBy 'xDZBlgQP' \
    > test.out 2>&1
eval_tap $? 153 'PublicGetContentByUserIDV2' test.out

#- 154 UpdateScreenshotsV2
./ng net.accelbyte.sdk.cli.Main ugc updateScreenshotsV2 \
    --contentId '0b9BvVZg' \
    --namespace "$AB_NAMESPACE" \
    --userId 'fprmxyE0' \
    --body '{"screenshots": [{"description": "lo6BvXZk", "screenshotId": "YWKtOM0o"}, {"description": "1eTjx7SU", "screenshotId": "DZwpdIPs"}, {"description": "IRVf7sze", "screenshotId": "GmBniWEI"}]}' \
    > test.out 2>&1
eval_tap $? 154 'UpdateScreenshotsV2' test.out

#- 155 UploadContentScreenshotV2
./ng net.accelbyte.sdk.cli.Main ugc uploadContentScreenshotV2 \
    --contentId 'L7ZPStLb' \
    --namespace "$AB_NAMESPACE" \
    --userId 'A8ZT84DK' \
    --body '{"screenshots": [{"contentType": "SrHZZzHr", "description": "GVDOmNdN", "fileExtension": "bmp"}, {"contentType": "HTB8eoSp", "description": "cPDeD09m", "fileExtension": "bmp"}, {"contentType": "3fQaRle0", "description": "x7BCXDIw", "fileExtension": "jpg"}]}' \
    > test.out 2>&1
eval_tap $? 155 'UploadContentScreenshotV2' test.out

#- 156 DeleteContentScreenshotV2
./ng net.accelbyte.sdk.cli.Main ugc deleteContentScreenshotV2 \
    --contentId 'EUiI2oGv' \
    --namespace "$AB_NAMESPACE" \
    --screenshotId 'c5uOMGIu' \
    --userId 'ofe47QdQ' \
    > test.out 2>&1
eval_tap $? 156 'DeleteContentScreenshotV2' test.out

#- 157 PublicGetGroupContentsV2
./ng net.accelbyte.sdk.cli.Main ugc publicGetGroupContentsV2 \
    --groupId 'chY81hzs' \
    --namespace "$AB_NAMESPACE" \
    --userId 'HWy1Bj2s' \
    --limit '82' \
    --offset '68' \
    > test.out 2>&1
eval_tap $? 157 'PublicGetGroupContentsV2' test.out

#- 158 ListUserStagingContents
./ng net.accelbyte.sdk.cli.Main ugc listUserStagingContents \
    --namespace "$AB_NAMESPACE" \
    --userId '3BALCsDE' \
    --limit '70' \
    --offset '28' \
    --sortBy 'CUEt3rvp' \
    --status 'n9JUeXhA' \
    > test.out 2>&1
eval_tap $? 158 'ListUserStagingContents' test.out

#- 159 GetUserStagingContentByID
./ng net.accelbyte.sdk.cli.Main ugc getUserStagingContentByID \
    --contentId 'mqTruudp' \
    --namespace "$AB_NAMESPACE" \
    --userId '88rBrSvd' \
    > test.out 2>&1
eval_tap $? 159 'GetUserStagingContentByID' test.out

#- 160 UpdateStagingContent
./ng net.accelbyte.sdk.cli.Main ugc updateStagingContent \
    --contentId 'Cq5FFUe6' \
    --namespace "$AB_NAMESPACE" \
    --userId 'JqHs6RLB' \
    --body '{"fileExtension": "pmNy5p6O", "fileLocation": "73WedwrE"}' \
    > test.out 2>&1
eval_tap $? 160 'UpdateStagingContent' test.out

#- 161 DeleteUserStagingContentByID
./ng net.accelbyte.sdk.cli.Main ugc deleteUserStagingContentByID \
    --contentId 'ob8BiVhz' \
    --namespace "$AB_NAMESPACE" \
    --userId 'x9mSFoKA' \
    > test.out 2>&1
eval_tap $? 161 'DeleteUserStagingContentByID' test.out


rm -f "tmp.dat"

exit $EXIT_CODE