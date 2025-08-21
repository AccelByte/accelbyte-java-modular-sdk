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
    --limit '73' \
    --offset '87' \
    > test.out 2>&1
eval_tap $? 2 'SingleAdminGetChannel' test.out

#- 3 AdminCreateChannel
./ng net.accelbyte.sdk.cli.Main ugc adminCreateChannel \
    --namespace "$AB_NAMESPACE" \
    --body '{"id": "0Z1lKBTA", "name": "CgkWMLmO"}' \
    > test.out 2>&1
eval_tap $? 3 'AdminCreateChannel' test.out

#- 4 SingleAdminUpdateChannel
./ng net.accelbyte.sdk.cli.Main ugc singleAdminUpdateChannel \
    --channelId 'qY00tOhN' \
    --namespace "$AB_NAMESPACE" \
    --body '{"name": "rNmRIztd"}' \
    > test.out 2>&1
eval_tap $? 4 'SingleAdminUpdateChannel' test.out

#- 5 SingleAdminDeleteChannel
./ng net.accelbyte.sdk.cli.Main ugc singleAdminDeleteChannel \
    --channelId 'j8NqLCO2' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 5 'SingleAdminDeleteChannel' test.out

#- 6 AdminUploadContentDirect
eval_tap 0 6 'AdminUploadContentDirect # SKIP deprecated' test.out

#- 7 AdminUploadContentS3
./ng net.accelbyte.sdk.cli.Main ugc adminUploadContentS3 \
    --channelId 'Ir8eUibn' \
    --namespace "$AB_NAMESPACE" \
    --body '{"contentType": "bV7yuASB", "customAttributes": {"xszcW3oe": {}, "9NH9Yh2X": {}, "6hK385T8": {}}, "fileExtension": "Nhbfa7cl", "name": "Z8EyaAc5", "preview": "WaoNEu5a", "previewMetadata": {"previewContentType": "vbqbBZgL", "previewFileExtension": "0Rniz7qR"}, "shareCode": "7MZoPUDc", "subType": "Zy4zxGjO", "tags": ["6rxRoj0u", "00U8lqOW", "V8m30CBa"], "type": "AAhNvKwa"}' \
    > test.out 2>&1
eval_tap $? 7 'AdminUploadContentS3' test.out

#- 8 SingleAdminUpdateContentS3
./ng net.accelbyte.sdk.cli.Main ugc singleAdminUpdateContentS3 \
    --channelId 'NLVeCbZY' \
    --contentId 'ahRdTAqL' \
    --namespace "$AB_NAMESPACE" \
    --body '{"contentType": "trBPag9n", "customAttributes": {"DrdQAoBt": {}, "0B8T3DFa": {}, "9JRP6QFM": {}}, "fileExtension": "6rq4bnCF", "name": "Ex7raurT", "payload": "B9rOWlhI", "preview": "xJnq7md5", "previewMetadata": {"previewContentType": "RKGvnEkR", "previewFileExtension": "zKFg0UrV"}, "shareCode": "0GGFYqXA", "subType": "BYBMJ79i", "tags": ["D0T256hU", "REYEPymo", "kaWBsym1"], "type": "Ed4oOh7T", "updateContentFile": false}' \
    > test.out 2>&1
eval_tap $? 8 'SingleAdminUpdateContentS3' test.out

#- 9 AdminSearchChannelSpecificContent
./ng net.accelbyte.sdk.cli.Main ugc adminSearchChannelSpecificContent \
    --channelId 'h5jQrteZ' \
    --namespace "$AB_NAMESPACE" \
    --creator 'SRVvUYyG' \
    --ishidden '7VKKajjm' \
    --isofficial '2LfmIJuU' \
    --limit '89' \
    --name 'NC7ps05u' \
    --offset '19' \
    --orderby 'McbVqvrl' \
    --sortby 'rXTW8SYN' \
    --subtype 'dc6ZX8uy' \
    --tags 'boLSwsqW,jeGmJabq,1aCeGszU' \
    --type 'jnJ23had' \
    --userId '98ZCCrJ1' \
    > test.out 2>&1
eval_tap $? 9 'AdminSearchChannelSpecificContent' test.out

#- 10 SingleAdminUpdateContentDirect
eval_tap 0 10 'SingleAdminUpdateContentDirect # SKIP deprecated' test.out

#- 11 SingleAdminDeleteContent
./ng net.accelbyte.sdk.cli.Main ugc singleAdminDeleteContent \
    --channelId 'Y188OjsT' \
    --contentId '1zYgUQ2U' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 11 'SingleAdminDeleteContent' test.out

#- 12 SingleAdminGetContent
./ng net.accelbyte.sdk.cli.Main ugc singleAdminGetContent \
    --namespace "$AB_NAMESPACE" \
    --limit '28' \
    --offset '61' \
    > test.out 2>&1
eval_tap $? 12 'SingleAdminGetContent' test.out

#- 13 AdminGetContentBulk
./ng net.accelbyte.sdk.cli.Main ugc adminGetContentBulk \
    --namespace "$AB_NAMESPACE" \
    --body '{"contentIds": ["KGBSeoVG", "TfxvGKt1", "3iQWq5Sa"]}' \
    > test.out 2>&1
eval_tap $? 13 'AdminGetContentBulk' test.out

#- 14 AdminSearchContent
./ng net.accelbyte.sdk.cli.Main ugc adminSearchContent \
    --namespace "$AB_NAMESPACE" \
    --creator 'EeBKvX7R' \
    --ishidden 'dmZsxhXz' \
    --isofficial 'oUy7C55O' \
    --limit '35' \
    --name 'aSqkm2UG' \
    --offset '98' \
    --orderby 'BhTiJbXb' \
    --sortby 'iQ3j5UlV' \
    --subtype 'vYrmELyM' \
    --tags 'mtaenN15,qi6ANCJ5,QQfvv1lC' \
    --type 'e0NLmVzX' \
    --userId 'vKliHI1w' \
    > test.out 2>&1
eval_tap $? 14 'AdminSearchContent' test.out

#- 15 AdminGetContentBulkByShareCodes
./ng net.accelbyte.sdk.cli.Main ugc adminGetContentBulkByShareCodes \
    --namespace "$AB_NAMESPACE" \
    --body '{"shareCodes": ["zcUkwaFE", "ekSUI1Xb", "QogpJZdh"]}' \
    > test.out 2>&1
eval_tap $? 15 'AdminGetContentBulkByShareCodes' test.out

#- 16 AdminGetUserContentByShareCode
./ng net.accelbyte.sdk.cli.Main ugc adminGetUserContentByShareCode \
    --namespace "$AB_NAMESPACE" \
    --shareCode 'Jdhgz8c2' \
    > test.out 2>&1
eval_tap $? 16 'AdminGetUserContentByShareCode' test.out

#- 17 AdminGetSpecificContent
./ng net.accelbyte.sdk.cli.Main ugc adminGetSpecificContent \
    --contentId 'c9usQeYO' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 17 'AdminGetSpecificContent' test.out

#- 18 AdminDownloadContentPreview
./ng net.accelbyte.sdk.cli.Main ugc adminDownloadContentPreview \
    --contentId 'p4fx7xH4' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 18 'AdminDownloadContentPreview' test.out

#- 19 RollbackContentVersion
./ng net.accelbyte.sdk.cli.Main ugc rollbackContentVersion \
    --contentId '1KCMtyNY' \
    --namespace "$AB_NAMESPACE" \
    --versionId 'LIvKWTSp' \
    > test.out 2>&1
eval_tap $? 19 'RollbackContentVersion' test.out

#- 20 AdminUpdateScreenshots
./ng net.accelbyte.sdk.cli.Main ugc adminUpdateScreenshots \
    --contentId 'Oxyf62YO' \
    --namespace "$AB_NAMESPACE" \
    --body '{"screenshots": [{"description": "Uku3onjF", "screenshotId": "SfZmLlIk"}, {"description": "2YgoTgS7", "screenshotId": "SHIPp1ZC"}, {"description": "19V2VuOo", "screenshotId": "DK3FcDe4"}]}' \
    > test.out 2>&1
eval_tap $? 20 'AdminUpdateScreenshots' test.out

#- 21 AdminUploadContentScreenshot
./ng net.accelbyte.sdk.cli.Main ugc adminUploadContentScreenshot \
    --contentId 'pbghvb7q' \
    --namespace "$AB_NAMESPACE" \
    --body '{"screenshots": [{"contentType": "2L09mWHe", "description": "jt6zEGPA", "fileExtension": "bmp"}, {"contentType": "r41trP8I", "description": "zYPRgVZ1", "fileExtension": "jpeg"}, {"contentType": "9aTGRPkS", "description": "zazADpra", "fileExtension": "bmp"}]}' \
    > test.out 2>&1
eval_tap $? 21 'AdminUploadContentScreenshot' test.out

#- 22 AdminDeleteContentScreenshot
./ng net.accelbyte.sdk.cli.Main ugc adminDeleteContentScreenshot \
    --contentId '3zGlJZPp' \
    --namespace "$AB_NAMESPACE" \
    --screenshotId 'hM92ZvBb' \
    > test.out 2>&1
eval_tap $? 22 'AdminDeleteContentScreenshot' test.out

#- 23 ListContentVersions
./ng net.accelbyte.sdk.cli.Main ugc listContentVersions \
    --contentId '2SllfXrt' \
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
    --body '{"contents": ["sKCNKyCM", "v4p2fBI3", "GyYTCBPP"], "name": "tBzcEORa"}' \
    > test.out 2>&1
eval_tap $? 25 'AdminCreateGroup' test.out

#- 26 SingleAdminGetGroup
./ng net.accelbyte.sdk.cli.Main ugc singleAdminGetGroup \
    --groupId 'oTfdPjJL' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 26 'SingleAdminGetGroup' test.out

#- 27 SingleAdminUpdateGroup
./ng net.accelbyte.sdk.cli.Main ugc singleAdminUpdateGroup \
    --groupId 'xeObPAbc' \
    --namespace "$AB_NAMESPACE" \
    --body '{"contents": ["tchyg7o6", "3rNEDwwy", "bgvvQzVa"], "name": "TRGLMvSN"}' \
    > test.out 2>&1
eval_tap $? 27 'SingleAdminUpdateGroup' test.out

#- 28 SingleAdminDeleteGroup
./ng net.accelbyte.sdk.cli.Main ugc singleAdminDeleteGroup \
    --groupId 'eUHUVSyK' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 28 'SingleAdminDeleteGroup' test.out

#- 29 SingleAdminGetGroupContents
./ng net.accelbyte.sdk.cli.Main ugc singleAdminGetGroupContents \
    --groupId 'Y0njNUk7' \
    --namespace "$AB_NAMESPACE" \
    --limit '95' \
    --offset '23' \
    > test.out 2>&1
eval_tap $? 29 'SingleAdminGetGroupContents' test.out

#- 30 AdminGetTag
./ng net.accelbyte.sdk.cli.Main ugc adminGetTag \
    --namespace "$AB_NAMESPACE" \
    --limit '42' \
    --offset '20' \
    > test.out 2>&1
eval_tap $? 30 'AdminGetTag' test.out

#- 31 AdminCreateTag
./ng net.accelbyte.sdk.cli.Main ugc adminCreateTag \
    --namespace "$AB_NAMESPACE" \
    --body '{"tag": "u8mLw8QF"}' \
    > test.out 2>&1
eval_tap $? 31 'AdminCreateTag' test.out

#- 32 AdminUpdateTag
./ng net.accelbyte.sdk.cli.Main ugc adminUpdateTag \
    --namespace "$AB_NAMESPACE" \
    --tagId 'hShoVCkp' \
    --body '{"tag": "oNIMHScL"}' \
    > test.out 2>&1
eval_tap $? 32 'AdminUpdateTag' test.out

#- 33 AdminDeleteTag
./ng net.accelbyte.sdk.cli.Main ugc adminDeleteTag \
    --namespace "$AB_NAMESPACE" \
    --tagId 'AgeNnDWp' \
    > test.out 2>&1
eval_tap $? 33 'AdminDeleteTag' test.out

#- 34 AdminGetType
./ng net.accelbyte.sdk.cli.Main ugc adminGetType \
    --namespace "$AB_NAMESPACE" \
    --limit '19' \
    --offset '29' \
    > test.out 2>&1
eval_tap $? 34 'AdminGetType' test.out

#- 35 AdminCreateType
./ng net.accelbyte.sdk.cli.Main ugc adminCreateType \
    --namespace "$AB_NAMESPACE" \
    --body '{"subtype": ["UGHJ8VWM", "8tp15DbB", "dZW5H3bg"], "type": "Eo7r6E4S"}' \
    > test.out 2>&1
eval_tap $? 35 'AdminCreateType' test.out

#- 36 AdminUpdateType
./ng net.accelbyte.sdk.cli.Main ugc adminUpdateType \
    --namespace "$AB_NAMESPACE" \
    --typeId '2GdLxvh6' \
    --body '{"subtype": ["KBX1XK9K", "ZimOpl0H", "B2RC8wiS"], "type": "dysugWjt"}' \
    > test.out 2>&1
eval_tap $? 36 'AdminUpdateType' test.out

#- 37 AdminDeleteType
./ng net.accelbyte.sdk.cli.Main ugc adminDeleteType \
    --namespace "$AB_NAMESPACE" \
    --typeId 'Uy0gblJP' \
    > test.out 2>&1
eval_tap $? 37 'AdminDeleteType' test.out

#- 38 AdminGetChannel
./ng net.accelbyte.sdk.cli.Main ugc adminGetChannel \
    --namespace "$AB_NAMESPACE" \
    --userId 'JTvZMSOc' \
    --limit '56' \
    --name 'J2peCqz7' \
    --offset '79' \
    > test.out 2>&1
eval_tap $? 38 'AdminGetChannel' test.out

#- 39 AdminDeleteAllUserChannels
./ng net.accelbyte.sdk.cli.Main ugc adminDeleteAllUserChannels \
    --namespace "$AB_NAMESPACE" \
    --userId 'AID8Lz9P' \
    > test.out 2>&1
eval_tap $? 39 'AdminDeleteAllUserChannels' test.out

#- 40 AdminUpdateChannel
./ng net.accelbyte.sdk.cli.Main ugc adminUpdateChannel \
    --channelId 'TF6Q9KuQ' \
    --namespace "$AB_NAMESPACE" \
    --userId '50NJY4Jj' \
    --body '{"name": "vSCoa9kF"}' \
    > test.out 2>&1
eval_tap $? 40 'AdminUpdateChannel' test.out

#- 41 AdminDeleteChannel
./ng net.accelbyte.sdk.cli.Main ugc adminDeleteChannel \
    --channelId 'I7ud20rI' \
    --namespace "$AB_NAMESPACE" \
    --userId 'tEB0mAFF' \
    > test.out 2>&1
eval_tap $? 41 'AdminDeleteChannel' test.out

#- 42 AdminUpdateContentS3ByShareCode
./ng net.accelbyte.sdk.cli.Main ugc adminUpdateContentS3ByShareCode \
    --channelId 'k2rmz5mn' \
    --namespace "$AB_NAMESPACE" \
    --shareCode '955OI4Ux' \
    --userId 'h8FxZ5cP' \
    --body '{"contentType": "VBS8eReC", "customAttributes": {"8elIbCPC": {}, "3Pw8WuLg": {}, "o2GRnQ0N": {}}, "fileExtension": "IMWmsTC8", "name": "CmdI7anK", "payload": "wm2cnpnh", "preview": "3zlsXBYb", "previewMetadata": {"previewContentType": "Iq7DC6gd", "previewFileExtension": "zIOJAiJ5"}, "shareCode": "u2MdZMlX", "subType": "0Ja69tG3", "tags": ["ivdqPFlY", "fXrvcBWz", "jmxzowpb"], "type": "qixG6dee", "updateContentFile": true}' \
    > test.out 2>&1
eval_tap $? 42 'AdminUpdateContentS3ByShareCode' test.out

#- 43 AdminUpdateContentS3
./ng net.accelbyte.sdk.cli.Main ugc adminUpdateContentS3 \
    --channelId 'DQrm54TQ' \
    --contentId 'A3MMxtFG' \
    --namespace "$AB_NAMESPACE" \
    --userId '2OsYHhGX' \
    --body '{"contentType": "EfWEU4gX", "customAttributes": {"Gv8V5WIb": {}, "s4l0k9qg": {}, "5sJLDMi6": {}}, "fileExtension": "8lHnFTbP", "name": "rRPr18IA", "payload": "pm6gXTx6", "preview": "ZZJ4zkXy", "previewMetadata": {"previewContentType": "XpgUMDOM", "previewFileExtension": "KHGgoCd2"}, "shareCode": "dhHWV2cM", "subType": "9WqwCwmx", "tags": ["o0KA98mq", "z0vGMMZ4", "VE5wo5ol"], "type": "ixm28Mrf", "updateContentFile": true}' \
    > test.out 2>&1
eval_tap $? 43 'AdminUpdateContentS3' test.out

#- 44 DeleteContentByShareCode
./ng net.accelbyte.sdk.cli.Main ugc deleteContentByShareCode \
    --channelId 'dMF7kBqV' \
    --namespace "$AB_NAMESPACE" \
    --shareCode '9lynwyiY' \
    --userId 'H7hKAREG' \
    > test.out 2>&1
eval_tap $? 44 'DeleteContentByShareCode' test.out

#- 45 AdminUpdateContentDirect
eval_tap 0 45 'AdminUpdateContentDirect # SKIP deprecated' test.out

#- 46 AdminDeleteContent
./ng net.accelbyte.sdk.cli.Main ugc adminDeleteContent \
    --channelId 'IYLSgNVd' \
    --contentId 'YVAMi56W' \
    --namespace "$AB_NAMESPACE" \
    --userId 'E8qzobn0' \
    > test.out 2>&1
eval_tap $? 46 'AdminDeleteContent' test.out

#- 47 AdminGetContent
./ng net.accelbyte.sdk.cli.Main ugc adminGetContent \
    --namespace "$AB_NAMESPACE" \
    --userId 'Z9Ck8XDg' \
    --limit '70' \
    --offset '62' \
    > test.out 2>&1
eval_tap $? 47 'AdminGetContent' test.out

#- 48 AdminDeleteAllUserContents
./ng net.accelbyte.sdk.cli.Main ugc adminDeleteAllUserContents \
    --namespace "$AB_NAMESPACE" \
    --userId '9GB1IJ5d' \
    > test.out 2>&1
eval_tap $? 48 'AdminDeleteAllUserContents' test.out

#- 49 AdminHideUserContent
./ng net.accelbyte.sdk.cli.Main ugc adminHideUserContent \
    --contentId 'qZV1QsMf' \
    --namespace "$AB_NAMESPACE" \
    --userId 'iBNFbmlw' \
    --body '{"isHidden": true}' \
    > test.out 2>&1
eval_tap $? 49 'AdminHideUserContent' test.out

#- 50 AdminGetAllGroups
./ng net.accelbyte.sdk.cli.Main ugc adminGetAllGroups \
    --namespace "$AB_NAMESPACE" \
    --userId 'lsJKWmaC' \
    --limit '54' \
    --offset '76' \
    > test.out 2>&1
eval_tap $? 50 'AdminGetAllGroups' test.out

#- 51 AdminDeleteAllUserGroup
./ng net.accelbyte.sdk.cli.Main ugc adminDeleteAllUserGroup \
    --namespace "$AB_NAMESPACE" \
    --userId 'jNDfVywi' \
    > test.out 2>&1
eval_tap $? 51 'AdminDeleteAllUserGroup' test.out

#- 52 AdminGetGroup
./ng net.accelbyte.sdk.cli.Main ugc adminGetGroup \
    --groupId '5Cdh9iKc' \
    --namespace "$AB_NAMESPACE" \
    --userId 'b6G4ZcbS' \
    > test.out 2>&1
eval_tap $? 52 'AdminGetGroup' test.out

#- 53 AdminUpdateGroup
./ng net.accelbyte.sdk.cli.Main ugc adminUpdateGroup \
    --groupId 'Jc96Bs4J' \
    --namespace "$AB_NAMESPACE" \
    --userId 'sadtFO0R' \
    --body '{"contents": ["5gcnsOcF", "eNqSWKt3", "cjhrWyT8"], "name": "uggb3E8k"}' \
    > test.out 2>&1
eval_tap $? 53 'AdminUpdateGroup' test.out

#- 54 AdminDeleteGroup
./ng net.accelbyte.sdk.cli.Main ugc adminDeleteGroup \
    --groupId 'v5bL7l43' \
    --namespace "$AB_NAMESPACE" \
    --userId 'PTvqSgGZ' \
    > test.out 2>&1
eval_tap $? 54 'AdminDeleteGroup' test.out

#- 55 AdminGetGroupContents
./ng net.accelbyte.sdk.cli.Main ugc adminGetGroupContents \
    --groupId 'nrMEVVam' \
    --namespace "$AB_NAMESPACE" \
    --userId '9eU4iI5O' \
    --limit '26' \
    --offset '62' \
    > test.out 2>&1
eval_tap $? 55 'AdminGetGroupContents' test.out

#- 56 AdminDeleteAllUserStates
./ng net.accelbyte.sdk.cli.Main ugc adminDeleteAllUserStates \
    --namespace "$AB_NAMESPACE" \
    --userId 'qd4oJCRi' \
    > test.out 2>&1
eval_tap $? 56 'AdminDeleteAllUserStates' test.out

#- 57 SearchChannelSpecificContent
./ng net.accelbyte.sdk.cli.Main ugc searchChannelSpecificContent \
    --channelId 'EC5vUlqc' \
    --namespace "$AB_NAMESPACE" \
    --creator 'QlrhQgEd' \
    --ishidden '5Wt3ieqf' \
    --isofficial 'CwFfaUMg' \
    --limit '100' \
    --name 'jBNQQOFD' \
    --offset '40' \
    --orderby 'HkHJJ5Wz' \
    --sortby '6AL2My4W' \
    --subtype 'rAwfLggc' \
    --tags 'iSBNyTLa,BwBNSvhn,NKG4WW63' \
    --type 'wM3ZjdXr' \
    --userId 'p22hF5B6' \
    > test.out 2>&1
eval_tap $? 57 'SearchChannelSpecificContent' test.out

#- 58 PublicSearchContent
./ng net.accelbyte.sdk.cli.Main ugc publicSearchContent \
    --namespace "$AB_NAMESPACE" \
    --creator 'PA3TBZn0' \
    --ishidden 'sVp8nzOh' \
    --isofficial '8KlH9tXb' \
    --limit '17' \
    --name 'Ig8342aV' \
    --offset '95' \
    --orderby 'cYGTLGpH' \
    --sortby '4ox44s8D' \
    --subtype 'WavYEneO' \
    --tags 'sCLIjqkb,BpSQOGEa,5G7aojsp' \
    --type 'B6Oy8IZU' \
    --userId 'QaZIUUnr' \
    > test.out 2>&1
eval_tap $? 58 'PublicSearchContent' test.out

#- 59 PublicGetContentBulk
./ng net.accelbyte.sdk.cli.Main ugc publicGetContentBulk \
    --namespace "$AB_NAMESPACE" \
    --body '{"contentIds": ["2kk0kWr2", "nBUPRiTu", "RXKhLZfu"]}' \
    > test.out 2>&1
eval_tap $? 59 'PublicGetContentBulk' test.out

#- 60 GetFollowedContent
./ng net.accelbyte.sdk.cli.Main ugc getFollowedContent \
    --namespace "$AB_NAMESPACE" \
    --limit '13' \
    --offset '79' \
    > test.out 2>&1
eval_tap $? 60 'GetFollowedContent' test.out

#- 61 GetLikedContent
./ng net.accelbyte.sdk.cli.Main ugc getLikedContent \
    --namespace "$AB_NAMESPACE" \
    --isofficial  \
    --limit '75' \
    --name 'jXxd7BU6' \
    --offset '73' \
    --orderby 'oJPpPWNR' \
    --sortby 'dwJahvfk' \
    --subtype '6WJl9cqn' \
    --tags 'V6PqCFPn,dMqkBMYP,P3NJzE1e' \
    --type 'oN9apCvU' \
    > test.out 2>&1
eval_tap $? 61 'GetLikedContent' test.out

#- 62 PublicGetContentBulkByShareCodes
./ng net.accelbyte.sdk.cli.Main ugc publicGetContentBulkByShareCodes \
    --namespace "$AB_NAMESPACE" \
    --body '{"shareCodes": ["2LdALtfv", "PeX0g80b", "cF22xmsa"]}' \
    > test.out 2>&1
eval_tap $? 62 'PublicGetContentBulkByShareCodes' test.out

#- 63 PublicDownloadContentByShareCode
./ng net.accelbyte.sdk.cli.Main ugc publicDownloadContentByShareCode \
    --namespace "$AB_NAMESPACE" \
    --shareCode 'uQgbPwY7' \
    > test.out 2>&1
eval_tap $? 63 'PublicDownloadContentByShareCode' test.out

#- 64 PublicDownloadContentByContentID
./ng net.accelbyte.sdk.cli.Main ugc publicDownloadContentByContentID \
    --contentId 'bieL0QaP' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 64 'PublicDownloadContentByContentID' test.out

#- 65 AddDownloadCount
./ng net.accelbyte.sdk.cli.Main ugc addDownloadCount \
    --contentId 'L9AOhXfS' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 65 'AddDownloadCount' test.out

#- 66 UpdateContentLikeStatus
./ng net.accelbyte.sdk.cli.Main ugc updateContentLikeStatus \
    --contentId 'qL1MBkAT' \
    --namespace "$AB_NAMESPACE" \
    --body '{"likeStatus": true}' \
    > test.out 2>&1
eval_tap $? 66 'UpdateContentLikeStatus' test.out

#- 67 PublicDownloadContentPreview
./ng net.accelbyte.sdk.cli.Main ugc publicDownloadContentPreview \
    --contentId 'rcuC6nDf' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 67 'PublicDownloadContentPreview' test.out

#- 68 GetTag
./ng net.accelbyte.sdk.cli.Main ugc getTag \
    --namespace "$AB_NAMESPACE" \
    --limit '99' \
    --offset '58' \
    > test.out 2>&1
eval_tap $? 68 'GetTag' test.out

#- 69 GetType
./ng net.accelbyte.sdk.cli.Main ugc getType \
    --namespace "$AB_NAMESPACE" \
    --limit '96' \
    --offset '48' \
    > test.out 2>&1
eval_tap $? 69 'GetType' test.out

#- 70 PublicSearchCreator
./ng net.accelbyte.sdk.cli.Main ugc publicSearchCreator \
    --namespace "$AB_NAMESPACE" \
    --limit '98' \
    --offset '97' \
    --orderby 'HRS2PRKf' \
    --sortby '3qyTQ9Tq' \
    > test.out 2>&1
eval_tap $? 70 'PublicSearchCreator' test.out

#- 71 GetFollowedUsers
./ng net.accelbyte.sdk.cli.Main ugc getFollowedUsers \
    --namespace "$AB_NAMESPACE" \
    --limit '6' \
    --offset '2' \
    > test.out 2>&1
eval_tap $? 71 'GetFollowedUsers' test.out

#- 72 PublicGetCreator
./ng net.accelbyte.sdk.cli.Main ugc publicGetCreator \
    --namespace "$AB_NAMESPACE" \
    --userId '5PER9Vph' \
    > test.out 2>&1
eval_tap $? 72 'PublicGetCreator' test.out

#- 73 GetChannels
./ng net.accelbyte.sdk.cli.Main ugc getChannels \
    --namespace "$AB_NAMESPACE" \
    --userId 'CI4vWjst' \
    --limit '54' \
    --name 'vANvkyji' \
    --offset '69' \
    > test.out 2>&1
eval_tap $? 73 'GetChannels' test.out

#- 74 PublicCreateChannel
./ng net.accelbyte.sdk.cli.Main ugc publicCreateChannel \
    --namespace "$AB_NAMESPACE" \
    --userId 'XYjNFPZU' \
    --body '{"name": "FNUrq9Je"}' \
    > test.out 2>&1
eval_tap $? 74 'PublicCreateChannel' test.out

#- 75 DeleteAllUserChannel
./ng net.accelbyte.sdk.cli.Main ugc deleteAllUserChannel \
    --namespace "$AB_NAMESPACE" \
    --userId '3yhEui2J' \
    > test.out 2>&1
eval_tap $? 75 'DeleteAllUserChannel' test.out

#- 76 UpdateChannel
./ng net.accelbyte.sdk.cli.Main ugc updateChannel \
    --channelId 'keZJfBPi' \
    --namespace "$AB_NAMESPACE" \
    --userId 'OvpiR4Xf' \
    --body '{"name": "lHRmxrgt"}' \
    > test.out 2>&1
eval_tap $? 76 'UpdateChannel' test.out

#- 77 DeleteChannel
./ng net.accelbyte.sdk.cli.Main ugc deleteChannel \
    --channelId 'bPoRQgAq' \
    --namespace "$AB_NAMESPACE" \
    --userId 'vlDV4XDb' \
    > test.out 2>&1
eval_tap $? 77 'DeleteChannel' test.out

#- 78 CreateContentDirect
eval_tap 0 78 'CreateContentDirect # SKIP deprecated' test.out

#- 79 CreateContentS3
./ng net.accelbyte.sdk.cli.Main ugc createContentS3 \
    --channelId 'w1myjMeR' \
    --namespace "$AB_NAMESPACE" \
    --userId 'UgbHk5i7' \
    --body '{"contentType": "J0BqQT6k", "customAttributes": {"Rj7cs3bk": {}, "W6L8eb9h": {}, "gZgHJyNm": {}}, "fileExtension": "0PTnflOI", "name": "BQut6DpE", "preview": "dwz8MSWC", "previewMetadata": {"previewContentType": "VWQf9Nme", "previewFileExtension": "NUA0f9ww"}, "subType": "CnlZNS3b", "tags": ["88gRZs6M", "h6TcuJN8", "1654wTFt"], "type": "ZcAs3JmD"}' \
    > test.out 2>&1
eval_tap $? 79 'CreateContentS3' test.out

#- 80 PublicUpdateContentByShareCode
./ng net.accelbyte.sdk.cli.Main ugc publicUpdateContentByShareCode \
    --channelId 'q67GfQww' \
    --namespace "$AB_NAMESPACE" \
    --shareCode 'iGAEs7J3' \
    --userId 'B6WO0htW' \
    --body '{"contentType": "Ydozup7m", "customAttributes": {"vGmJVFkC": {}, "QDgv3Ab4": {}, "vV55aM0z": {}}, "fileExtension": "06a7tDs9", "name": "z6uc3dqT", "payload": "mdwRgDvR", "preview": "ezp3HSp0", "previewMetadata": {"previewContentType": "gfI7cvyD", "previewFileExtension": "mZglyGJe"}, "subType": "FtiagKMS", "tags": ["lx32fjpA", "e5Yoolhw", "p3TNGaCT"], "type": "iTDWnKCs", "updateContentFile": true}' \
    > test.out 2>&1
eval_tap $? 80 'PublicUpdateContentByShareCode' test.out

#- 81 UpdateContentS3
./ng net.accelbyte.sdk.cli.Main ugc updateContentS3 \
    --channelId 'KL3VcM6c' \
    --contentId 'KlgEi0EF' \
    --namespace "$AB_NAMESPACE" \
    --userId 'LKZT2web' \
    --body '{"contentType": "FF2TRS2k", "customAttributes": {"FYjPqsmy": {}, "0iU2IuRV": {}, "ojNFyGkd": {}}, "fileExtension": "HvtUmz3x", "name": "NpRsTjjT", "payload": "tG7TxM5j", "preview": "bAsLzS7l", "previewMetadata": {"previewContentType": "xXibu4Z4", "previewFileExtension": "u2zTQsm1"}, "subType": "kzYfxS8N", "tags": ["f0zY21Ke", "g4KCmzo7", "erVIKGjU"], "type": "O4UnAOHM", "updateContentFile": false}' \
    > test.out 2>&1
eval_tap $? 81 'UpdateContentS3' test.out

#- 82 PublicDeleteContentByShareCode
./ng net.accelbyte.sdk.cli.Main ugc publicDeleteContentByShareCode \
    --channelId 'pdiKDY7I' \
    --namespace "$AB_NAMESPACE" \
    --shareCode 'MNmyJAJV' \
    --userId 'IvRYMiSY' \
    > test.out 2>&1
eval_tap $? 82 'PublicDeleteContentByShareCode' test.out

#- 83 UpdateContentDirect
eval_tap 0 83 'UpdateContentDirect # SKIP deprecated' test.out

#- 84 DeleteContent
./ng net.accelbyte.sdk.cli.Main ugc deleteContent \
    --channelId '4lrxhrx2' \
    --contentId 'yatXY02n' \
    --namespace "$AB_NAMESPACE" \
    --userId '7FcFwuBN' \
    > test.out 2>&1
eval_tap $? 84 'DeleteContent' test.out

#- 85 UpdateContentShareCode
./ng net.accelbyte.sdk.cli.Main ugc updateContentShareCode \
    --channelId 'GeU5pn9E' \
    --contentId 'XrWoMC43' \
    --namespace "$AB_NAMESPACE" \
    --userId 'sZW767ei' \
    --body '{"shareCode": "LZ6bzbkR"}' \
    > test.out 2>&1
eval_tap $? 85 'UpdateContentShareCode' test.out

#- 86 PublicGetUserContent
./ng net.accelbyte.sdk.cli.Main ugc publicGetUserContent \
    --namespace "$AB_NAMESPACE" \
    --userId 'Sm52bDUh' \
    --limit '7' \
    --offset '55' \
    > test.out 2>&1
eval_tap $? 86 'PublicGetUserContent' test.out

#- 87 DeleteAllUserContents
./ng net.accelbyte.sdk.cli.Main ugc deleteAllUserContents \
    --namespace "$AB_NAMESPACE" \
    --userId 'anGgFUao' \
    > test.out 2>&1
eval_tap $? 87 'DeleteAllUserContents' test.out

#- 88 UpdateScreenshots
./ng net.accelbyte.sdk.cli.Main ugc updateScreenshots \
    --contentId 'oz0SualM' \
    --namespace "$AB_NAMESPACE" \
    --userId 'Y3dlF3bW' \
    --body '{"screenshots": [{"description": "uygOwN53", "screenshotId": "pMdrOvjX"}, {"description": "02X135X8", "screenshotId": "efh1tHqn"}, {"description": "ADVDMYRG", "screenshotId": "3wCgupX1"}]}' \
    > test.out 2>&1
eval_tap $? 88 'UpdateScreenshots' test.out

#- 89 UploadContentScreenshot
./ng net.accelbyte.sdk.cli.Main ugc uploadContentScreenshot \
    --contentId 'rqyBAp0C' \
    --namespace "$AB_NAMESPACE" \
    --userId 'Wa44BZ5q' \
    --body '{"screenshots": [{"contentType": "xuFc3sOl", "description": "Xp4NKRUM", "fileExtension": "bmp"}, {"contentType": "0zUBkiCf", "description": "vRLRkLKz", "fileExtension": "jfif"}, {"contentType": "yuXdeXPa", "description": "TLCAIgyP", "fileExtension": "jfif"}]}' \
    > test.out 2>&1
eval_tap $? 89 'UploadContentScreenshot' test.out

#- 90 DeleteContentScreenshot
./ng net.accelbyte.sdk.cli.Main ugc deleteContentScreenshot \
    --contentId 'WAdIylSY' \
    --namespace "$AB_NAMESPACE" \
    --screenshotId 'yOghKJ6n' \
    --userId 'mldLaEWG' \
    > test.out 2>&1
eval_tap $? 90 'DeleteContentScreenshot' test.out

#- 91 UpdateUserFollowStatus
./ng net.accelbyte.sdk.cli.Main ugc updateUserFollowStatus \
    --namespace "$AB_NAMESPACE" \
    --userId '2Zeh5Cdi' \
    --body '{"followStatus": true}' \
    > test.out 2>&1
eval_tap $? 91 'UpdateUserFollowStatus' test.out

#- 92 GetPublicFollowers
./ng net.accelbyte.sdk.cli.Main ugc getPublicFollowers \
    --namespace "$AB_NAMESPACE" \
    --userId 'Eo3tUplC' \
    --limit '89' \
    --offset '45' \
    > test.out 2>&1
eval_tap $? 92 'GetPublicFollowers' test.out

#- 93 GetPublicFollowing
./ng net.accelbyte.sdk.cli.Main ugc getPublicFollowing \
    --namespace "$AB_NAMESPACE" \
    --userId 'WrclNoUC' \
    --limit '19' \
    --offset '21' \
    > test.out 2>&1
eval_tap $? 93 'GetPublicFollowing' test.out

#- 94 GetGroups
./ng net.accelbyte.sdk.cli.Main ugc getGroups \
    --namespace "$AB_NAMESPACE" \
    --userId 'Li2ynU0B' \
    --limit '71' \
    --offset '29' \
    > test.out 2>&1
eval_tap $? 94 'GetGroups' test.out

#- 95 CreateGroup
./ng net.accelbyte.sdk.cli.Main ugc createGroup \
    --namespace "$AB_NAMESPACE" \
    --userId 'akORLHcK' \
    --body '{"contents": ["7nj3gOMJ", "1aorHHJl", "kHzF3MiL"], "name": "LFwBWNPE"}' \
    > test.out 2>&1
eval_tap $? 95 'CreateGroup' test.out

#- 96 DeleteAllUserGroup
./ng net.accelbyte.sdk.cli.Main ugc deleteAllUserGroup \
    --namespace "$AB_NAMESPACE" \
    --userId 'FY5SBwyP' \
    > test.out 2>&1
eval_tap $? 96 'DeleteAllUserGroup' test.out

#- 97 GetGroup
./ng net.accelbyte.sdk.cli.Main ugc getGroup \
    --groupId 'fCeb06dH' \
    --namespace "$AB_NAMESPACE" \
    --userId 'BUjCaP4U' \
    > test.out 2>&1
eval_tap $? 97 'GetGroup' test.out

#- 98 UpdateGroup
./ng net.accelbyte.sdk.cli.Main ugc updateGroup \
    --groupId '6cWaisAV' \
    --namespace "$AB_NAMESPACE" \
    --userId 'vh2CmdBF' \
    --body '{"contents": ["S5iTfcse", "mZyhkwVK", "55JrCHPh"], "name": "2HcPNHsu"}' \
    > test.out 2>&1
eval_tap $? 98 'UpdateGroup' test.out

#- 99 DeleteGroup
./ng net.accelbyte.sdk.cli.Main ugc deleteGroup \
    --groupId '60AaX0Tm' \
    --namespace "$AB_NAMESPACE" \
    --userId 'wKBQTSkE' \
    > test.out 2>&1
eval_tap $? 99 'DeleteGroup' test.out

#- 100 GetGroupContent
./ng net.accelbyte.sdk.cli.Main ugc getGroupContent \
    --groupId 'oEKlqWcQ' \
    --namespace "$AB_NAMESPACE" \
    --userId 'tbMa985K' \
    --limit '68' \
    --offset '32' \
    > test.out 2>&1
eval_tap $? 100 'GetGroupContent' test.out

#- 101 DeleteAllUserStates
./ng net.accelbyte.sdk.cli.Main ugc deleteAllUserStates \
    --namespace "$AB_NAMESPACE" \
    --userId 'CLJZ9tnt' \
    > test.out 2>&1
eval_tap $? 101 'DeleteAllUserStates' test.out

#- 102 AdminGetContentByChannelIDV2
./ng net.accelbyte.sdk.cli.Main ugc adminGetContentByChannelIDV2 \
    --channelId 'i5CEMiHv' \
    --namespace "$AB_NAMESPACE" \
    --limit '37' \
    --name 'BVtC4ykX' \
    --offset '12' \
    --sortBy 'a7HrL4KY' \
    > test.out 2>&1
eval_tap $? 102 'AdminGetContentByChannelIDV2' test.out

#- 103 AdminCreateContentV2
./ng net.accelbyte.sdk.cli.Main ugc adminCreateContentV2 \
    --channelId 'DhDtbtBD' \
    --namespace "$AB_NAMESPACE" \
    --body '{"contentType": "0f4JRcYY", "customAttributes": {"yd1HZu4K": {}, "CUwPatS0": {}, "N8WdVJ8l": {}}, "fileExtension": "0gbqitER", "name": "Cxz8A37m", "shareCode": "DHNH5kVC", "subType": "tVyrSDGn", "tags": ["nZTbuZee", "7T6anTd8", "FTGzbjPf"], "type": "53bDU33Z"}' \
    > test.out 2>&1
eval_tap $? 103 'AdminCreateContentV2' test.out

#- 104 AdminDeleteOfficialContentV2
./ng net.accelbyte.sdk.cli.Main ugc adminDeleteOfficialContentV2 \
    --channelId 'v3Mhutqf' \
    --contentId 'bR9xyLFc' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 104 'AdminDeleteOfficialContentV2' test.out

#- 105 AdminUpdateOfficialContentV2
./ng net.accelbyte.sdk.cli.Main ugc adminUpdateOfficialContentV2 \
    --channelId '6ODG0yKi' \
    --contentId '2P9rJT4a' \
    --namespace "$AB_NAMESPACE" \
    --body '{"customAttributes": {"neW9BeuX": {}, "hkdcKBd8": {}, "puL5fRQP": {}}, "name": "bEfW1ekd", "shareCode": "dHZJfEOv", "subType": "40VLlkBo", "tags": ["PeTvNzi8", "H3ZtBLUa", "SivxZAZT"], "type": "jWMbWZP1"}' \
    > test.out 2>&1
eval_tap $? 105 'AdminUpdateOfficialContentV2' test.out

#- 106 AdminCopyContent
./ng net.accelbyte.sdk.cli.Main ugc adminCopyContent \
    --channelId 'UGVXgeHa' \
    --contentId 'E0oVoDYB' \
    --namespace "$AB_NAMESPACE" \
    --body '{"customAttributes": {"r9HIiOH2": {}, "yPt66z2j": {}, "7z0JixjY": {}}, "name": "eAoOwemy", "subType": "weeNrKjw", "tags": ["gEhBtDht", "3cLLRO9W", "DXfxuvk1"], "targetChannelId": "3wFIP0YC", "type": "9o0QkBCT"}' \
    > test.out 2>&1
eval_tap $? 106 'AdminCopyContent' test.out

#- 107 AdminUpdateOfficialContentFileLocation
./ng net.accelbyte.sdk.cli.Main ugc adminUpdateOfficialContentFileLocation \
    --channelId 'Up8qIrOZ' \
    --contentId '9XUA8Pms' \
    --namespace "$AB_NAMESPACE" \
    --body '{"fileExtension": "uM77p2qR", "fileLocation": "WnJbqQy5"}' \
    > test.out 2>&1
eval_tap $? 107 'AdminUpdateOfficialContentFileLocation' test.out

#- 108 AdminGenerateOfficialContentUploadURLV2
./ng net.accelbyte.sdk.cli.Main ugc adminGenerateOfficialContentUploadURLV2 \
    --channelId '2hCS13dQ' \
    --contentId '8gpQFbd8' \
    --namespace "$AB_NAMESPACE" \
    --body '{"contentType": "wS5LnY8u", "fileExtension": "5Q6ZzcNk"}' \
    > test.out 2>&1
eval_tap $? 108 'AdminGenerateOfficialContentUploadURLV2' test.out

#- 109 AdminGetConfigs
./ng net.accelbyte.sdk.cli.Main ugc adminGetConfigs \
    --namespace "$AB_NAMESPACE" \
    --limit '95' \
    --offset '54' \
    > test.out 2>&1
eval_tap $? 109 'AdminGetConfigs' test.out

#- 110 AdminUpdateConfig
./ng net.accelbyte.sdk.cli.Main ugc adminUpdateConfig \
    --key 'N8FYauop' \
    --namespace "$AB_NAMESPACE" \
    --body '{"value": "wM2KX2kj"}' \
    > test.out 2>&1
eval_tap $? 110 'AdminUpdateConfig' test.out

#- 111 AdminListContentV2
./ng net.accelbyte.sdk.cli.Main ugc adminListContentV2 \
    --namespace "$AB_NAMESPACE" \
    --isOfficial  \
    --limit '66' \
    --name 'Mu1QZ6Ng' \
    --offset '96' \
    --sortBy 'voZdakOa' \
    --subType 'fsqycUzy' \
    --tags '83wUO3gZ,GoKWbouQ,N4u0SzBs' \
    --type 'dyO3ZLkJ' \
    > test.out 2>&1
eval_tap $? 111 'AdminListContentV2' test.out

#- 112 AdminBulkGetContentByIDsV2
./ng net.accelbyte.sdk.cli.Main ugc adminBulkGetContentByIDsV2 \
    --namespace "$AB_NAMESPACE" \
    --body '{"contentIds": ["wG9oOtuL", "onexY4Uh", "yCteR2X4"]}' \
    > test.out 2>&1
eval_tap $? 112 'AdminBulkGetContentByIDsV2' test.out

#- 113 AdminGetContentBulkByShareCodesV2
./ng net.accelbyte.sdk.cli.Main ugc adminGetContentBulkByShareCodesV2 \
    --namespace "$AB_NAMESPACE" \
    --body '{"shareCodes": ["3YO7k98Y", "t0iL3qf0", "rrH3XkMY"]}' \
    > test.out 2>&1
eval_tap $? 113 'AdminGetContentBulkByShareCodesV2' test.out

#- 114 AdminGetContentByShareCodeV2
./ng net.accelbyte.sdk.cli.Main ugc adminGetContentByShareCodeV2 \
    --namespace "$AB_NAMESPACE" \
    --shareCode 'tN3XKjPv' \
    > test.out 2>&1
eval_tap $? 114 'AdminGetContentByShareCodeV2' test.out

#- 115 AdminGetContentByContentIDV2
./ng net.accelbyte.sdk.cli.Main ugc adminGetContentByContentIDV2 \
    --contentId 'kfKBJpPz' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 115 'AdminGetContentByContentIDV2' test.out

#- 116 RollbackContentVersionV2
./ng net.accelbyte.sdk.cli.Main ugc rollbackContentVersionV2 \
    --contentId 'uCn1XTMQ' \
    --namespace "$AB_NAMESPACE" \
    --versionId 'FwD3olGa' \
    > test.out 2>&1
eval_tap $? 116 'RollbackContentVersionV2' test.out

#- 117 AdminUpdateScreenshotsV2
./ng net.accelbyte.sdk.cli.Main ugc adminUpdateScreenshotsV2 \
    --contentId 'UFoo6JV1' \
    --namespace "$AB_NAMESPACE" \
    --body '{"screenshots": [{"description": "piUguLar", "screenshotId": "sGZmn1MI"}, {"description": "rMpjIrre", "screenshotId": "ZKp1voj5"}, {"description": "BzE7SUee", "screenshotId": "yzhRbyDX"}]}' \
    > test.out 2>&1
eval_tap $? 117 'AdminUpdateScreenshotsV2' test.out

#- 118 AdminUploadContentScreenshotV2
./ng net.accelbyte.sdk.cli.Main ugc adminUploadContentScreenshotV2 \
    --contentId 'YanjHG7y' \
    --namespace "$AB_NAMESPACE" \
    --body '{"screenshots": [{"contentType": "45ax4sgf", "description": "A6YDzvt0", "fileExtension": "jfif"}, {"contentType": "7ZKPQWxu", "description": "qKDPKbDd", "fileExtension": "png"}, {"contentType": "OFxu3M75", "description": "ystIi0Ad", "fileExtension": "pjp"}]}' \
    > test.out 2>&1
eval_tap $? 118 'AdminUploadContentScreenshotV2' test.out

#- 119 AdminDeleteContentScreenshotV2
./ng net.accelbyte.sdk.cli.Main ugc adminDeleteContentScreenshotV2 \
    --contentId 'bGodoCbJ' \
    --namespace "$AB_NAMESPACE" \
    --screenshotId 'IUF89hZU' \
    > test.out 2>&1
eval_tap $? 119 'AdminDeleteContentScreenshotV2' test.out

#- 120 ListContentVersionsV2
./ng net.accelbyte.sdk.cli.Main ugc listContentVersionsV2 \
    --contentId 'XLGOPDIO' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 120 'ListContentVersionsV2' test.out

#- 121 AdminGetOfficialGroupContentsV2
./ng net.accelbyte.sdk.cli.Main ugc adminGetOfficialGroupContentsV2 \
    --groupId 'LPgcr0j4' \
    --namespace "$AB_NAMESPACE" \
    --limit '36' \
    --offset '30' \
    > test.out 2>&1
eval_tap $? 121 'AdminGetOfficialGroupContentsV2' test.out

#- 122 AdminListStagingContents
./ng net.accelbyte.sdk.cli.Main ugc adminListStagingContents \
    --namespace "$AB_NAMESPACE" \
    --limit '81' \
    --offset '45' \
    --sortBy 'hudkFFtx' \
    --status 'MZ7DFdsx' \
    > test.out 2>&1
eval_tap $? 122 'AdminListStagingContents' test.out

#- 123 AdminGetStagingContentByID
./ng net.accelbyte.sdk.cli.Main ugc adminGetStagingContentByID \
    --contentId 'XpiDGrV4' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 123 'AdminGetStagingContentByID' test.out

#- 124 AdminApproveStagingContent
./ng net.accelbyte.sdk.cli.Main ugc adminApproveStagingContent \
    --contentId 'lUCjsaqE' \
    --namespace "$AB_NAMESPACE" \
    --body '{"approved": false, "note": "Ve4KZr9l"}' \
    > test.out 2>&1
eval_tap $? 124 'AdminApproveStagingContent' test.out

#- 125 AdminUpdateContentByShareCodeV2
./ng net.accelbyte.sdk.cli.Main ugc adminUpdateContentByShareCodeV2 \
    --channelId '8GEJvUKD' \
    --namespace "$AB_NAMESPACE" \
    --shareCode 'kz0e5D8z' \
    --userId 'rXh6oxOH' \
    --body '{"customAttributes": {"A5VmhN1p": {}, "vIMcMtbz": {}, "zoBdgVsp": {}}, "name": "OHpu8XrO", "shareCode": "2hq2xwrx", "subType": "2s931C7g", "tags": ["UvrFhFsv", "hA2JE3A6", "hSFokhU0"], "type": "7l6urOkR"}' \
    > test.out 2>&1
eval_tap $? 125 'AdminUpdateContentByShareCodeV2' test.out

#- 126 AdminDeleteContentByShareCodeV2
./ng net.accelbyte.sdk.cli.Main ugc adminDeleteContentByShareCodeV2 \
    --channelId 'G3E6i5zh' \
    --namespace "$AB_NAMESPACE" \
    --shareCode 'FHJKWnAg' \
    --userId 'NUgisQnU' \
    > test.out 2>&1
eval_tap $? 126 'AdminDeleteContentByShareCodeV2' test.out

#- 127 AdminDeleteUserContentV2
./ng net.accelbyte.sdk.cli.Main ugc adminDeleteUserContentV2 \
    --channelId 'BGAgi6X2' \
    --contentId 'ev2sEVU0' \
    --namespace "$AB_NAMESPACE" \
    --userId 'VzE8B1CR' \
    > test.out 2>&1
eval_tap $? 127 'AdminDeleteUserContentV2' test.out

#- 128 AdminUpdateUserContentV2
./ng net.accelbyte.sdk.cli.Main ugc adminUpdateUserContentV2 \
    --channelId 's3jmPFqx' \
    --contentId 'yYoUkzFZ' \
    --namespace "$AB_NAMESPACE" \
    --userId 'zmDxkLLb' \
    --body '{"customAttributes": {"aVlfxofh": {}, "5XPqoXVf": {}, "slKYhYkW": {}}, "name": "p5wjAAXd", "shareCode": "ya3wQTM1", "subType": "w2S99XUb", "tags": ["dJAxAIMG", "ScszkmJb", "AkV0cUXk"], "type": "Muz6mVkP"}' \
    > test.out 2>&1
eval_tap $? 128 'AdminUpdateUserContentV2' test.out

#- 129 AdminUpdateUserContentFileLocation
./ng net.accelbyte.sdk.cli.Main ugc adminUpdateUserContentFileLocation \
    --channelId 'ZAWtzHEY' \
    --contentId 'KkCtEsnh' \
    --namespace "$AB_NAMESPACE" \
    --userId 'P6BSGN15' \
    --body '{"fileExtension": "pXU8Frsr", "fileLocation": "cXUUfPTF"}' \
    > test.out 2>&1
eval_tap $? 129 'AdminUpdateUserContentFileLocation' test.out

#- 130 AdminGenerateUserContentUploadURLV2
./ng net.accelbyte.sdk.cli.Main ugc adminGenerateUserContentUploadURLV2 \
    --channelId 'YMk1PezI' \
    --contentId 'ee0FyZwv' \
    --namespace "$AB_NAMESPACE" \
    --userId 'D8iXB9bN' \
    --body '{"contentType": "lxqq44wL", "fileExtension": "2XgnlTKF"}' \
    > test.out 2>&1
eval_tap $? 130 'AdminGenerateUserContentUploadURLV2' test.out

#- 131 AdminGetContentByUserIDV2
./ng net.accelbyte.sdk.cli.Main ugc adminGetContentByUserIDV2 \
    --namespace "$AB_NAMESPACE" \
    --userId 'UTns8PO7' \
    --limit '35' \
    --offset '85' \
    --sortBy 'ZLvygr4A' \
    > test.out 2>&1
eval_tap $? 131 'AdminGetContentByUserIDV2' test.out

#- 132 AdminUpdateContentHideStatusV2
./ng net.accelbyte.sdk.cli.Main ugc adminUpdateContentHideStatusV2 \
    --contentId 'H45a5Fyx' \
    --namespace "$AB_NAMESPACE" \
    --userId 'RGrOM0mo' \
    --body '{"isHidden": true}' \
    > test.out 2>&1
eval_tap $? 132 'AdminUpdateContentHideStatusV2' test.out

#- 133 AdminGetUserGroupContentsV2
./ng net.accelbyte.sdk.cli.Main ugc adminGetUserGroupContentsV2 \
    --groupId 'Ga5rPaM7' \
    --namespace "$AB_NAMESPACE" \
    --userId '9ZT13RXv' \
    --limit '0' \
    --offset '25' \
    > test.out 2>&1
eval_tap $? 133 'AdminGetUserGroupContentsV2' test.out

#- 134 AdminListUserStagingContents
./ng net.accelbyte.sdk.cli.Main ugc adminListUserStagingContents \
    --namespace "$AB_NAMESPACE" \
    --userId 'wVzKbxMV' \
    --limit '81' \
    --offset '37' \
    --sortBy 'fYQdm48u' \
    --status 'dhxJ4lWo' \
    > test.out 2>&1
eval_tap $? 134 'AdminListUserStagingContents' test.out

#- 135 PublicGetContentByChannelIDV2
./ng net.accelbyte.sdk.cli.Main ugc publicGetContentByChannelIDV2 \
    --channelId 'IRZCTRKw' \
    --namespace "$AB_NAMESPACE" \
    --limit '62' \
    --name 'RPYgI5uy' \
    --offset '18' \
    --sortBy '4sYXjBao' \
    > test.out 2>&1
eval_tap $? 135 'PublicGetContentByChannelIDV2' test.out

#- 136 PublicListContentV2
./ng net.accelbyte.sdk.cli.Main ugc publicListContentV2 \
    --namespace "$AB_NAMESPACE" \
    --isOfficial  \
    --limit '98' \
    --name 'PTXKnaX7' \
    --offset '55' \
    --sortBy 'hwIqSbuN' \
    --subType 'QUItU1Kq' \
    --tags 'EazN0KtR,82pLv9HQ,KaVZileA' \
    --type 'M667Y0Kb' \
    > test.out 2>&1
eval_tap $? 136 'PublicListContentV2' test.out

#- 137 PublicBulkGetContentByIDV2
./ng net.accelbyte.sdk.cli.Main ugc publicBulkGetContentByIDV2 \
    --namespace "$AB_NAMESPACE" \
    --body '{"contentIds": ["nXM1xC80", "mOoZlOfz", "xm9qnuXo"]}' \
    > test.out 2>&1
eval_tap $? 137 'PublicBulkGetContentByIDV2' test.out

#- 138 PublicGetContentBulkByShareCodesV2
./ng net.accelbyte.sdk.cli.Main ugc publicGetContentBulkByShareCodesV2 \
    --namespace "$AB_NAMESPACE" \
    --body '{"shareCodes": ["GMMJH6eC", "ojBu48dR", "5thCZw97"]}' \
    > test.out 2>&1
eval_tap $? 138 'PublicGetContentBulkByShareCodesV2' test.out

#- 139 PublicGetContentByShareCodeV2
./ng net.accelbyte.sdk.cli.Main ugc publicGetContentByShareCodeV2 \
    --namespace "$AB_NAMESPACE" \
    --shareCode 'U2mjnloC' \
    > test.out 2>&1
eval_tap $? 139 'PublicGetContentByShareCodeV2' test.out

#- 140 PublicGetContentByIDV2
./ng net.accelbyte.sdk.cli.Main ugc publicGetContentByIDV2 \
    --contentId '6iTJOPno' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 140 'PublicGetContentByIDV2' test.out

#- 141 PublicAddDownloadCountV2
./ng net.accelbyte.sdk.cli.Main ugc publicAddDownloadCountV2 \
    --contentId 'Q4hyVIGA' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 141 'PublicAddDownloadCountV2' test.out

#- 142 PublicListContentDownloaderV2
./ng net.accelbyte.sdk.cli.Main ugc publicListContentDownloaderV2 \
    --contentId '0CFDU0wQ' \
    --namespace "$AB_NAMESPACE" \
    --limit '33' \
    --offset '94' \
    --sortBy '4tXJz5Pv' \
    --userId 'hSKtEP2n' \
    > test.out 2>&1
eval_tap $? 142 'PublicListContentDownloaderV2' test.out

#- 143 PublicListContentLikeV2
./ng net.accelbyte.sdk.cli.Main ugc publicListContentLikeV2 \
    --contentId 'T219T4zG' \
    --namespace "$AB_NAMESPACE" \
    --limit '63' \
    --offset '75' \
    --sortBy 'MRmvNs8d' \
    > test.out 2>&1
eval_tap $? 143 'PublicListContentLikeV2' test.out

#- 144 UpdateContentLikeStatusV2
./ng net.accelbyte.sdk.cli.Main ugc updateContentLikeStatusV2 \
    --contentId 'iuK1Eheq' \
    --namespace "$AB_NAMESPACE" \
    --body '{"likeStatus": true}' \
    > test.out 2>&1
eval_tap $? 144 'UpdateContentLikeStatusV2' test.out

#- 145 PublicCreateContentV2
./ng net.accelbyte.sdk.cli.Main ugc publicCreateContentV2 \
    --channelId '71WbE2W7' \
    --namespace "$AB_NAMESPACE" \
    --userId '5ju6mjKf' \
    --body '{"contentType": "3N6z8kdx", "customAttributes": {"13p3Rjj4": {}, "EAMlaUSg": {}, "X1DdeKSC": {}}, "fileExtension": "9x2FSMPp", "name": "efQV1mOn", "subType": "JO8PkAK2", "tags": ["XYO7mTdn", "d458bLLe", "e2DHlLz0"], "type": "vvjI68iU"}' \
    > test.out 2>&1
eval_tap $? 145 'PublicCreateContentV2' test.out

#- 146 PublicUpdateContentByShareCodeV2
./ng net.accelbyte.sdk.cli.Main ugc publicUpdateContentByShareCodeV2 \
    --channelId 'KlclDNgi' \
    --namespace "$AB_NAMESPACE" \
    --shareCode 'hmrMsuGD' \
    --userId 'LeQ8zvRN' \
    --body '{"customAttributes": {"Qbi3uPOL": {}, "LmU4kITe": {}, "ceDEsVrJ": {}}, "name": "h8N5PpNA", "subType": "Unf58LhX", "tags": ["T9nihgCi", "AiH7TG8V", "I3cBTKgA"], "type": "ZzuwxVMm"}' \
    > test.out 2>&1
eval_tap $? 146 'PublicUpdateContentByShareCodeV2' test.out

#- 147 PublicDeleteContentByShareCodeV2
./ng net.accelbyte.sdk.cli.Main ugc publicDeleteContentByShareCodeV2 \
    --channelId 'YzhkTph0' \
    --namespace "$AB_NAMESPACE" \
    --shareCode 'JjQF42XL' \
    --userId 'jCuQJiK7' \
    > test.out 2>&1
eval_tap $? 147 'PublicDeleteContentByShareCodeV2' test.out

#- 148 PublicDeleteContentV2
./ng net.accelbyte.sdk.cli.Main ugc publicDeleteContentV2 \
    --channelId 'tZUqZFCq' \
    --contentId 'baopgOsW' \
    --namespace "$AB_NAMESPACE" \
    --userId 'zus40Irg' \
    > test.out 2>&1
eval_tap $? 148 'PublicDeleteContentV2' test.out

#- 149 PublicUpdateContentV2
./ng net.accelbyte.sdk.cli.Main ugc publicUpdateContentV2 \
    --channelId 'bBOLUrxJ' \
    --contentId '1RQzbc8V' \
    --namespace "$AB_NAMESPACE" \
    --userId 'wlesT2KX' \
    --body '{"customAttributes": {"RucTNgKF": {}, "Oz44LQs8": {}, "mrBJiVeT": {}}, "name": "bDTizhJj", "subType": "FvZKQJQ8", "tags": ["sP4YEzBH", "vg9PbwMT", "MzKmw2Tj"], "type": "S0hhMDuV"}' \
    > test.out 2>&1
eval_tap $? 149 'PublicUpdateContentV2' test.out

#- 150 PublicUpdateContentFileLocation
./ng net.accelbyte.sdk.cli.Main ugc publicUpdateContentFileLocation \
    --channelId '1p60BFKY' \
    --contentId 'ro9Aff3R' \
    --namespace "$AB_NAMESPACE" \
    --userId 'u4Py44cT' \
    --body '{"fileExtension": "MwnvVAW9", "fileLocation": "HdMffzoI"}' \
    > test.out 2>&1
eval_tap $? 150 'PublicUpdateContentFileLocation' test.out

#- 151 UpdateContentShareCodeV2
./ng net.accelbyte.sdk.cli.Main ugc updateContentShareCodeV2 \
    --channelId 'rEHeBQSM' \
    --contentId 'EMWZqPsW' \
    --namespace "$AB_NAMESPACE" \
    --userId 'pcbYbLGB' \
    --body '{"shareCode": "jYUrUcAd"}' \
    > test.out 2>&1
eval_tap $? 151 'UpdateContentShareCodeV2' test.out

#- 152 PublicGenerateContentUploadURLV2
./ng net.accelbyte.sdk.cli.Main ugc publicGenerateContentUploadURLV2 \
    --channelId 'DtcdHZ2W' \
    --contentId 'II6Rgyu6' \
    --namespace "$AB_NAMESPACE" \
    --userId 'EhW6raA5' \
    --body '{"contentType": "Lrb3Gq8L", "fileExtension": "x5tO5dGv"}' \
    > test.out 2>&1
eval_tap $? 152 'PublicGenerateContentUploadURLV2' test.out

#- 153 PublicGetContentByUserIDV2
./ng net.accelbyte.sdk.cli.Main ugc publicGetContentByUserIDV2 \
    --namespace "$AB_NAMESPACE" \
    --userId 'BDQTAi5r' \
    --limit '92' \
    --offset '16' \
    --sortBy 'oEzn2UBt' \
    > test.out 2>&1
eval_tap $? 153 'PublicGetContentByUserIDV2' test.out

#- 154 UpdateScreenshotsV2
./ng net.accelbyte.sdk.cli.Main ugc updateScreenshotsV2 \
    --contentId 'aNqAVXmh' \
    --namespace "$AB_NAMESPACE" \
    --userId 'V5HIUtSC' \
    --body '{"screenshots": [{"description": "rDQL1NV9", "screenshotId": "cTHKdBEx"}, {"description": "T10Q7RAt", "screenshotId": "XKY90iYs"}, {"description": "afruonkt", "screenshotId": "OTWjnf34"}]}' \
    > test.out 2>&1
eval_tap $? 154 'UpdateScreenshotsV2' test.out

#- 155 UploadContentScreenshotV2
./ng net.accelbyte.sdk.cli.Main ugc uploadContentScreenshotV2 \
    --contentId 'EyyyRLEB' \
    --namespace "$AB_NAMESPACE" \
    --userId 'DUTABBM6' \
    --body '{"screenshots": [{"contentType": "yP7fK4pT", "description": "MCXBPHQk", "fileExtension": "pjp"}, {"contentType": "Ygt8P3zn", "description": "J5OUGMp2", "fileExtension": "bmp"}, {"contentType": "FYQifd4x", "description": "9YMGLHn9", "fileExtension": "bmp"}]}' \
    > test.out 2>&1
eval_tap $? 155 'UploadContentScreenshotV2' test.out

#- 156 DeleteContentScreenshotV2
./ng net.accelbyte.sdk.cli.Main ugc deleteContentScreenshotV2 \
    --contentId 'ms5IZebs' \
    --namespace "$AB_NAMESPACE" \
    --screenshotId 'OS6EePlF' \
    --userId 'c9pC7Stg' \
    > test.out 2>&1
eval_tap $? 156 'DeleteContentScreenshotV2' test.out

#- 157 PublicGetGroupContentsV2
./ng net.accelbyte.sdk.cli.Main ugc publicGetGroupContentsV2 \
    --groupId 'gsBbWaqd' \
    --namespace "$AB_NAMESPACE" \
    --userId 'aGpd57ZO' \
    --limit '77' \
    --offset '90' \
    > test.out 2>&1
eval_tap $? 157 'PublicGetGroupContentsV2' test.out

#- 158 ListUserStagingContents
./ng net.accelbyte.sdk.cli.Main ugc listUserStagingContents \
    --namespace "$AB_NAMESPACE" \
    --userId 'xaPCRmaK' \
    --limit '25' \
    --offset '41' \
    --sortBy 'CamTirlW' \
    --status 'C2q7N16o' \
    > test.out 2>&1
eval_tap $? 158 'ListUserStagingContents' test.out

#- 159 GetUserStagingContentByID
./ng net.accelbyte.sdk.cli.Main ugc getUserStagingContentByID \
    --contentId 'cAu6ZLXB' \
    --namespace "$AB_NAMESPACE" \
    --userId 'myuFN3Ob' \
    > test.out 2>&1
eval_tap $? 159 'GetUserStagingContentByID' test.out

#- 160 UpdateStagingContent
./ng net.accelbyte.sdk.cli.Main ugc updateStagingContent \
    --contentId 'A9KFfLjE' \
    --namespace "$AB_NAMESPACE" \
    --userId 'K0EnDIcO' \
    --body '{"fileExtension": "eScOjgi4", "fileLocation": "YNG31bKQ"}' \
    > test.out 2>&1
eval_tap $? 160 'UpdateStagingContent' test.out

#- 161 DeleteUserStagingContentByID
./ng net.accelbyte.sdk.cli.Main ugc deleteUserStagingContentByID \
    --contentId 'LHOjgCSo' \
    --namespace "$AB_NAMESPACE" \
    --userId '1CBnd7uV' \
    > test.out 2>&1
eval_tap $? 161 'DeleteUserStagingContentByID' test.out


rm -f "tmp.dat"

exit $EXIT_CODE