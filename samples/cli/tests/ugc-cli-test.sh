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
    --limit '37' \
    --offset '50' \
    > test.out 2>&1
eval_tap $? 2 'SingleAdminGetChannel' test.out

#- 3 AdminCreateChannel
./ng net.accelbyte.sdk.cli.Main ugc adminCreateChannel \
    --namespace "$AB_NAMESPACE" \
    --body '{"id": "7P8VGMyb", "name": "noAhAOgR"}' \
    > test.out 2>&1
eval_tap $? 3 'AdminCreateChannel' test.out

#- 4 SingleAdminUpdateChannel
./ng net.accelbyte.sdk.cli.Main ugc singleAdminUpdateChannel \
    --channelId 'A7JMESOL' \
    --namespace "$AB_NAMESPACE" \
    --body '{"name": "pEGGgtnb"}' \
    > test.out 2>&1
eval_tap $? 4 'SingleAdminUpdateChannel' test.out

#- 5 SingleAdminDeleteChannel
./ng net.accelbyte.sdk.cli.Main ugc singleAdminDeleteChannel \
    --channelId 'oGJhtH0K' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 5 'SingleAdminDeleteChannel' test.out

#- 6 AdminUploadContentDirect
eval_tap 0 6 'AdminUploadContentDirect # SKIP deprecated' test.out

#- 7 AdminUploadContentS3
./ng net.accelbyte.sdk.cli.Main ugc adminUploadContentS3 \
    --channelId 'MKe28D2f' \
    --namespace "$AB_NAMESPACE" \
    --body '{"contentType": "2YSh6BMA", "customAttributes": {"McdG5EjI": {}, "jdPJdFKz": {}, "s2GjZfbB": {}}, "fileExtension": "KgTHMb8R", "name": "IJ6mjNeo", "preview": "qZblG4cP", "previewMetadata": {"previewContentType": "K8sNodyH", "previewFileExtension": "RjfLEDoK"}, "shareCode": "yF42gkGC", "subType": "2S1ljJ0X", "tags": ["OWRB7f6C", "Sw3wTK5x", "ttSUnts3"], "type": "Vw1osEZN"}' \
    > test.out 2>&1
eval_tap $? 7 'AdminUploadContentS3' test.out

#- 8 SingleAdminUpdateContentS3
./ng net.accelbyte.sdk.cli.Main ugc singleAdminUpdateContentS3 \
    --channelId 'rcZPLk5x' \
    --contentId 'VgYUr54g' \
    --namespace "$AB_NAMESPACE" \
    --body '{"contentType": "f4j8eRvQ", "customAttributes": {"QxEWFBNY": {}, "9iwRlzUj": {}, "hTXV4tbp": {}}, "fileExtension": "5Lc5FbfE", "name": "xeQbyiKS", "payload": "vDKCcL5X", "preview": "YRUt2a2A", "previewMetadata": {"previewContentType": "7L4GkJXB", "previewFileExtension": "RCkNDwu9"}, "shareCode": "oqFwspGm", "subType": "r0ErTmmu", "tags": ["aHtrXWt4", "Jgpu24do", "kFBEWYW9"], "type": "6NtfM7H0", "updateContentFile": true}' \
    > test.out 2>&1
eval_tap $? 8 'SingleAdminUpdateContentS3' test.out

#- 9 AdminSearchChannelSpecificContent
./ng net.accelbyte.sdk.cli.Main ugc adminSearchChannelSpecificContent \
    --channelId 'F7WaL9zn' \
    --namespace "$AB_NAMESPACE" \
    --creator 'Nrl4TNBu' \
    --ishidden 'c4X91fAg' \
    --isofficial 'R6IpgfoS' \
    --limit '15' \
    --name 'S14t9Nyo' \
    --offset '10' \
    --orderby 'q3VyoP9x' \
    --sortby 'YPdLwOQM' \
    --subtype 'RcVwWiry' \
    --tags '1VMrkbGb,MOdH21Ho,XYTslZlt' \
    --type 'kzbyWWW0' \
    --userId 'wn5QzBCL' \
    > test.out 2>&1
eval_tap $? 9 'AdminSearchChannelSpecificContent' test.out

#- 10 SingleAdminUpdateContentDirect
eval_tap 0 10 'SingleAdminUpdateContentDirect # SKIP deprecated' test.out

#- 11 SingleAdminDeleteContent
./ng net.accelbyte.sdk.cli.Main ugc singleAdminDeleteContent \
    --channelId 'Ml3vWURj' \
    --contentId 'BE8onu61' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 11 'SingleAdminDeleteContent' test.out

#- 12 SingleAdminGetContent
./ng net.accelbyte.sdk.cli.Main ugc singleAdminGetContent \
    --namespace "$AB_NAMESPACE" \
    --limit '82' \
    --offset '50' \
    > test.out 2>&1
eval_tap $? 12 'SingleAdminGetContent' test.out

#- 13 AdminGetContentBulk
./ng net.accelbyte.sdk.cli.Main ugc adminGetContentBulk \
    --namespace "$AB_NAMESPACE" \
    --body '{"contentIds": ["MQpiW28o", "bvDQNXVi", "nICs2Q4O"]}' \
    > test.out 2>&1
eval_tap $? 13 'AdminGetContentBulk' test.out

#- 14 AdminSearchContent
./ng net.accelbyte.sdk.cli.Main ugc adminSearchContent \
    --namespace "$AB_NAMESPACE" \
    --creator 'cmFmXLtM' \
    --ishidden 'nl0jS3LE' \
    --isofficial 'kcJLjIn4' \
    --limit '34' \
    --name 'Glf7P74a' \
    --offset '69' \
    --orderby 'VBAq9aek' \
    --sortby 'z7k9kiKk' \
    --subtype 'zZcg7KY5' \
    --tags 'MV01E1NL,4v4u8ZU4,0qMgwn6j' \
    --type 'Nf1qwPll' \
    --userId 'g1iq11lV' \
    > test.out 2>&1
eval_tap $? 14 'AdminSearchContent' test.out

#- 15 AdminGetContentBulkByShareCodes
./ng net.accelbyte.sdk.cli.Main ugc adminGetContentBulkByShareCodes \
    --namespace "$AB_NAMESPACE" \
    --body '{"shareCodes": ["U1feVDA5", "eFESMCtv", "JCnYESRe"]}' \
    > test.out 2>&1
eval_tap $? 15 'AdminGetContentBulkByShareCodes' test.out

#- 16 AdminGetUserContentByShareCode
./ng net.accelbyte.sdk.cli.Main ugc adminGetUserContentByShareCode \
    --namespace "$AB_NAMESPACE" \
    --shareCode 'nVwY6bQO' \
    > test.out 2>&1
eval_tap $? 16 'AdminGetUserContentByShareCode' test.out

#- 17 AdminGetSpecificContent
./ng net.accelbyte.sdk.cli.Main ugc adminGetSpecificContent \
    --contentId 'y8wYALvh' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 17 'AdminGetSpecificContent' test.out

#- 18 AdminDownloadContentPreview
./ng net.accelbyte.sdk.cli.Main ugc adminDownloadContentPreview \
    --contentId 'QqNlKFx3' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 18 'AdminDownloadContentPreview' test.out

#- 19 RollbackContentVersion
./ng net.accelbyte.sdk.cli.Main ugc rollbackContentVersion \
    --contentId 'GmHsXCpH' \
    --namespace "$AB_NAMESPACE" \
    --versionId 'UtrH4r4y' \
    > test.out 2>&1
eval_tap $? 19 'RollbackContentVersion' test.out

#- 20 AdminUpdateScreenshots
./ng net.accelbyte.sdk.cli.Main ugc adminUpdateScreenshots \
    --contentId '33V63On8' \
    --namespace "$AB_NAMESPACE" \
    --body '{"screenshots": [{"description": "CVNHzbtD", "screenshotId": "w7rb0qi8"}, {"description": "U1hc7zP4", "screenshotId": "bIv7EoC2"}, {"description": "ECJrkADM", "screenshotId": "JLaCxzCp"}]}' \
    > test.out 2>&1
eval_tap $? 20 'AdminUpdateScreenshots' test.out

#- 21 AdminUploadContentScreenshot
./ng net.accelbyte.sdk.cli.Main ugc adminUploadContentScreenshot \
    --contentId '25VjKZuC' \
    --namespace "$AB_NAMESPACE" \
    --body '{"screenshots": [{"contentType": "SOlPWwA0", "description": "5NECE4TS", "fileExtension": "jfif"}, {"contentType": "8HAnk0Dy", "description": "6uJ5JNMf", "fileExtension": "bmp"}, {"contentType": "SdISJj7C", "description": "IxuCUBKJ", "fileExtension": "jpg"}]}' \
    > test.out 2>&1
eval_tap $? 21 'AdminUploadContentScreenshot' test.out

#- 22 AdminDeleteContentScreenshot
./ng net.accelbyte.sdk.cli.Main ugc adminDeleteContentScreenshot \
    --contentId 'FskT2Fqc' \
    --namespace "$AB_NAMESPACE" \
    --screenshotId 'hGPKKi67' \
    > test.out 2>&1
eval_tap $? 22 'AdminDeleteContentScreenshot' test.out

#- 23 ListContentVersions
./ng net.accelbyte.sdk.cli.Main ugc listContentVersions \
    --contentId 'Qx79KMUZ' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 23 'ListContentVersions' test.out

#- 24 SingleAdminGetAllGroups
./ng net.accelbyte.sdk.cli.Main ugc singleAdminGetAllGroups \
    --namespace "$AB_NAMESPACE" \
    --limit '75' \
    --offset '7' \
    > test.out 2>&1
eval_tap $? 24 'SingleAdminGetAllGroups' test.out

#- 25 AdminCreateGroup
./ng net.accelbyte.sdk.cli.Main ugc adminCreateGroup \
    --namespace "$AB_NAMESPACE" \
    --body '{"contents": ["WR3ZxeV9", "P1QmjI3X", "iB0gc5hP"], "name": "xocLyKI2"}' \
    > test.out 2>&1
eval_tap $? 25 'AdminCreateGroup' test.out

#- 26 SingleAdminGetGroup
./ng net.accelbyte.sdk.cli.Main ugc singleAdminGetGroup \
    --groupId 'lFXhs2ct' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 26 'SingleAdminGetGroup' test.out

#- 27 SingleAdminUpdateGroup
./ng net.accelbyte.sdk.cli.Main ugc singleAdminUpdateGroup \
    --groupId 'UnOS5WDH' \
    --namespace "$AB_NAMESPACE" \
    --body '{"contents": ["A8B7eQBV", "OmuEYxxc", "gZIntvsr"], "name": "Va01gX0p"}' \
    > test.out 2>&1
eval_tap $? 27 'SingleAdminUpdateGroup' test.out

#- 28 SingleAdminDeleteGroup
./ng net.accelbyte.sdk.cli.Main ugc singleAdminDeleteGroup \
    --groupId 'JQriXYHA' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 28 'SingleAdminDeleteGroup' test.out

#- 29 SingleAdminGetGroupContents
./ng net.accelbyte.sdk.cli.Main ugc singleAdminGetGroupContents \
    --groupId 'ICTzxTx0' \
    --namespace "$AB_NAMESPACE" \
    --limit '84' \
    --offset '61' \
    > test.out 2>&1
eval_tap $? 29 'SingleAdminGetGroupContents' test.out

#- 30 AdminGetTag
./ng net.accelbyte.sdk.cli.Main ugc adminGetTag \
    --namespace "$AB_NAMESPACE" \
    --limit '10' \
    --offset '71' \
    > test.out 2>&1
eval_tap $? 30 'AdminGetTag' test.out

#- 31 AdminCreateTag
./ng net.accelbyte.sdk.cli.Main ugc adminCreateTag \
    --namespace "$AB_NAMESPACE" \
    --body '{"tag": "mAiOsE61"}' \
    > test.out 2>&1
eval_tap $? 31 'AdminCreateTag' test.out

#- 32 AdminUpdateTag
./ng net.accelbyte.sdk.cli.Main ugc adminUpdateTag \
    --namespace "$AB_NAMESPACE" \
    --tagId 'ayX9u2c2' \
    --body '{"tag": "tlLZNU9H"}' \
    > test.out 2>&1
eval_tap $? 32 'AdminUpdateTag' test.out

#- 33 AdminDeleteTag
./ng net.accelbyte.sdk.cli.Main ugc adminDeleteTag \
    --namespace "$AB_NAMESPACE" \
    --tagId 'bKJ6COXJ' \
    > test.out 2>&1
eval_tap $? 33 'AdminDeleteTag' test.out

#- 34 AdminGetType
./ng net.accelbyte.sdk.cli.Main ugc adminGetType \
    --namespace "$AB_NAMESPACE" \
    --limit '65' \
    --offset '47' \
    > test.out 2>&1
eval_tap $? 34 'AdminGetType' test.out

#- 35 AdminCreateType
./ng net.accelbyte.sdk.cli.Main ugc adminCreateType \
    --namespace "$AB_NAMESPACE" \
    --body '{"subtype": ["9JZdXTp6", "AbKJaitr", "S8tXdMvN"], "type": "66zD1UpR"}' \
    > test.out 2>&1
eval_tap $? 35 'AdminCreateType' test.out

#- 36 AdminUpdateType
./ng net.accelbyte.sdk.cli.Main ugc adminUpdateType \
    --namespace "$AB_NAMESPACE" \
    --typeId '2RmTS6pa' \
    --body '{"subtype": ["rKoN6vYr", "PCLgv6Iw", "WXytLT2t"], "type": "nsaS1ioC"}' \
    > test.out 2>&1
eval_tap $? 36 'AdminUpdateType' test.out

#- 37 AdminDeleteType
./ng net.accelbyte.sdk.cli.Main ugc adminDeleteType \
    --namespace "$AB_NAMESPACE" \
    --typeId 'BsfQWsNY' \
    > test.out 2>&1
eval_tap $? 37 'AdminDeleteType' test.out

#- 38 AdminGetChannel
./ng net.accelbyte.sdk.cli.Main ugc adminGetChannel \
    --namespace "$AB_NAMESPACE" \
    --userId '7zM3vFwi' \
    --limit '60' \
    --name '3QcBa5Rb' \
    --offset '97' \
    > test.out 2>&1
eval_tap $? 38 'AdminGetChannel' test.out

#- 39 AdminDeleteAllUserChannels
./ng net.accelbyte.sdk.cli.Main ugc adminDeleteAllUserChannels \
    --namespace "$AB_NAMESPACE" \
    --userId 'c3pNC7QH' \
    > test.out 2>&1
eval_tap $? 39 'AdminDeleteAllUserChannels' test.out

#- 40 AdminUpdateChannel
./ng net.accelbyte.sdk.cli.Main ugc adminUpdateChannel \
    --channelId 'k5T3lTi2' \
    --namespace "$AB_NAMESPACE" \
    --userId 'f809wlYg' \
    --body '{"name": "iiZGtSPA"}' \
    > test.out 2>&1
eval_tap $? 40 'AdminUpdateChannel' test.out

#- 41 AdminDeleteChannel
./ng net.accelbyte.sdk.cli.Main ugc adminDeleteChannel \
    --channelId 'KXob1RJi' \
    --namespace "$AB_NAMESPACE" \
    --userId 'CznnJYgl' \
    > test.out 2>&1
eval_tap $? 41 'AdminDeleteChannel' test.out

#- 42 AdminUpdateContentS3ByShareCode
./ng net.accelbyte.sdk.cli.Main ugc adminUpdateContentS3ByShareCode \
    --channelId 'KsyzTnTS' \
    --namespace "$AB_NAMESPACE" \
    --shareCode '37N3g1dC' \
    --userId '37sZ4dGr' \
    --body '{"contentType": "st6kD3Tn", "customAttributes": {"1cROW3Xb": {}, "aNZxRQYR": {}, "cowOeI3W": {}}, "fileExtension": "px2a7I8U", "name": "qXfN5UuI", "payload": "2g1DlZIY", "preview": "rOstExRH", "previewMetadata": {"previewContentType": "WzHpkCR2", "previewFileExtension": "3uOIfc47"}, "shareCode": "z3KAWvlZ", "subType": "0KRn90ww", "tags": ["jpxq0O0C", "3Y5jKw1Y", "1dj4rxD9"], "type": "9rWSynrA", "updateContentFile": false}' \
    > test.out 2>&1
eval_tap $? 42 'AdminUpdateContentS3ByShareCode' test.out

#- 43 AdminUpdateContentS3
./ng net.accelbyte.sdk.cli.Main ugc adminUpdateContentS3 \
    --channelId 'mUJzrM0R' \
    --contentId 'wahtIpoY' \
    --namespace "$AB_NAMESPACE" \
    --userId 'JeSxrbeY' \
    --body '{"contentType": "zgABEuOB", "customAttributes": {"TkoOtTTF": {}, "7hnxNdMb": {}, "JWj5HS50": {}}, "fileExtension": "FIJdfiKc", "name": "7zIeIHAt", "payload": "Y6oqYTTE", "preview": "qBePiwxj", "previewMetadata": {"previewContentType": "5MaiKW5X", "previewFileExtension": "0hOEBN6Q"}, "shareCode": "avEX39nr", "subType": "uIXF4OZ2", "tags": ["807Kms7W", "FPwj0BCt", "tcbL5Z9q"], "type": "jNHPsrT8", "updateContentFile": false}' \
    > test.out 2>&1
eval_tap $? 43 'AdminUpdateContentS3' test.out

#- 44 DeleteContentByShareCode
./ng net.accelbyte.sdk.cli.Main ugc deleteContentByShareCode \
    --channelId 'werZC6DF' \
    --namespace "$AB_NAMESPACE" \
    --shareCode 'INgoRnO7' \
    --userId 'ng4rpMSd' \
    > test.out 2>&1
eval_tap $? 44 'DeleteContentByShareCode' test.out

#- 45 AdminUpdateContentDirect
eval_tap 0 45 'AdminUpdateContentDirect # SKIP deprecated' test.out

#- 46 AdminDeleteContent
./ng net.accelbyte.sdk.cli.Main ugc adminDeleteContent \
    --channelId '4WesfVT9' \
    --contentId 'woqRW1lJ' \
    --namespace "$AB_NAMESPACE" \
    --userId 'asXVDqIu' \
    > test.out 2>&1
eval_tap $? 46 'AdminDeleteContent' test.out

#- 47 AdminGetContent
./ng net.accelbyte.sdk.cli.Main ugc adminGetContent \
    --namespace "$AB_NAMESPACE" \
    --userId 'GL8h6YGZ' \
    --limit '18' \
    --offset '90' \
    > test.out 2>&1
eval_tap $? 47 'AdminGetContent' test.out

#- 48 AdminDeleteAllUserContents
./ng net.accelbyte.sdk.cli.Main ugc adminDeleteAllUserContents \
    --namespace "$AB_NAMESPACE" \
    --userId 'i2P55vwJ' \
    > test.out 2>&1
eval_tap $? 48 'AdminDeleteAllUserContents' test.out

#- 49 AdminHideUserContent
./ng net.accelbyte.sdk.cli.Main ugc adminHideUserContent \
    --contentId '5xNkyJ2A' \
    --namespace "$AB_NAMESPACE" \
    --userId 'kthpN588' \
    --body '{"isHidden": true}' \
    > test.out 2>&1
eval_tap $? 49 'AdminHideUserContent' test.out

#- 50 AdminGetAllGroups
./ng net.accelbyte.sdk.cli.Main ugc adminGetAllGroups \
    --namespace "$AB_NAMESPACE" \
    --userId '0ZSgw16o' \
    --limit '58' \
    --offset '31' \
    > test.out 2>&1
eval_tap $? 50 'AdminGetAllGroups' test.out

#- 51 AdminDeleteAllUserGroup
./ng net.accelbyte.sdk.cli.Main ugc adminDeleteAllUserGroup \
    --namespace "$AB_NAMESPACE" \
    --userId 'z3zMBdAV' \
    > test.out 2>&1
eval_tap $? 51 'AdminDeleteAllUserGroup' test.out

#- 52 AdminGetGroup
./ng net.accelbyte.sdk.cli.Main ugc adminGetGroup \
    --groupId 'v024NZeX' \
    --namespace "$AB_NAMESPACE" \
    --userId 'PIajPbfY' \
    > test.out 2>&1
eval_tap $? 52 'AdminGetGroup' test.out

#- 53 AdminUpdateGroup
./ng net.accelbyte.sdk.cli.Main ugc adminUpdateGroup \
    --groupId 'Wi6k1z7O' \
    --namespace "$AB_NAMESPACE" \
    --userId 'Py2nDmxD' \
    --body '{"contents": ["Dzw38QQA", "uk4A69qj", "oNXFY1ZQ"], "name": "tt3rj1pu"}' \
    > test.out 2>&1
eval_tap $? 53 'AdminUpdateGroup' test.out

#- 54 AdminDeleteGroup
./ng net.accelbyte.sdk.cli.Main ugc adminDeleteGroup \
    --groupId 'oKINnIUy' \
    --namespace "$AB_NAMESPACE" \
    --userId 'Y9X6oOfC' \
    > test.out 2>&1
eval_tap $? 54 'AdminDeleteGroup' test.out

#- 55 AdminGetGroupContents
./ng net.accelbyte.sdk.cli.Main ugc adminGetGroupContents \
    --groupId 'tJ8rYPIc' \
    --namespace "$AB_NAMESPACE" \
    --userId 'achiVy5L' \
    --limit '8' \
    --offset '90' \
    > test.out 2>&1
eval_tap $? 55 'AdminGetGroupContents' test.out

#- 56 AdminDeleteAllUserStates
./ng net.accelbyte.sdk.cli.Main ugc adminDeleteAllUserStates \
    --namespace "$AB_NAMESPACE" \
    --userId 'bNBMtXKr' \
    > test.out 2>&1
eval_tap $? 56 'AdminDeleteAllUserStates' test.out

#- 57 SearchChannelSpecificContent
./ng net.accelbyte.sdk.cli.Main ugc searchChannelSpecificContent \
    --channelId 'igmPLtnE' \
    --namespace "$AB_NAMESPACE" \
    --creator '3JDfkESg' \
    --ishidden '1phEmlBf' \
    --isofficial 'DF5IlXOx' \
    --limit '64' \
    --name 'WglOoFAN' \
    --offset '73' \
    --orderby 'FJAJHP6M' \
    --sortby 'dzDF5Tyr' \
    --subtype 'xx14hjSE' \
    --tags 'rXmlAgEQ,b3m5mLUl,hMTneq7p' \
    --type 'yRFT2PAC' \
    --userId 'xfu2FNoo' \
    > test.out 2>&1
eval_tap $? 57 'SearchChannelSpecificContent' test.out

#- 58 PublicSearchContent
./ng net.accelbyte.sdk.cli.Main ugc publicSearchContent \
    --namespace "$AB_NAMESPACE" \
    --creator 'Y9hsRelU' \
    --ishidden 'INO8N1pH' \
    --isofficial 'FtBnQ9ps' \
    --limit '89' \
    --name '93aBmnSh' \
    --offset '62' \
    --orderby 'vnSA8KZm' \
    --sortby 'riavhKkq' \
    --subtype 'wX6eoaYM' \
    --tags '3nH4SErc,SP2wVf7G,nCH2TsM9' \
    --type 'YpvimerX' \
    --userId 'M3XpSCv7' \
    > test.out 2>&1
eval_tap $? 58 'PublicSearchContent' test.out

#- 59 PublicGetContentBulk
./ng net.accelbyte.sdk.cli.Main ugc publicGetContentBulk \
    --namespace "$AB_NAMESPACE" \
    --body '{"contentIds": ["UiY9907h", "MI33igDW", "yjS5oGJr"]}' \
    > test.out 2>&1
eval_tap $? 59 'PublicGetContentBulk' test.out

#- 60 GetFollowedContent
./ng net.accelbyte.sdk.cli.Main ugc getFollowedContent \
    --namespace "$AB_NAMESPACE" \
    --limit '95' \
    --offset '81' \
    > test.out 2>&1
eval_tap $? 60 'GetFollowedContent' test.out

#- 61 GetLikedContent
./ng net.accelbyte.sdk.cli.Main ugc getLikedContent \
    --namespace "$AB_NAMESPACE" \
    --isofficial  \
    --limit '100' \
    --name 'VjUyaaQh' \
    --offset '87' \
    --orderby 'cWF46UYE' \
    --sortby 'A4qdyFGA' \
    --subtype '69QoaFL6' \
    --tags 'EeRQ5TQF,lyIjs8Gh,HHC6rJiQ' \
    --type 'nrM0D8BP' \
    > test.out 2>&1
eval_tap $? 61 'GetLikedContent' test.out

#- 62 PublicGetContentBulkByShareCodes
./ng net.accelbyte.sdk.cli.Main ugc publicGetContentBulkByShareCodes \
    --namespace "$AB_NAMESPACE" \
    --body '{"shareCodes": ["X5BoK3Gv", "fUWL4uYc", "B2aXtg6g"]}' \
    > test.out 2>&1
eval_tap $? 62 'PublicGetContentBulkByShareCodes' test.out

#- 63 PublicDownloadContentByShareCode
./ng net.accelbyte.sdk.cli.Main ugc publicDownloadContentByShareCode \
    --namespace "$AB_NAMESPACE" \
    --shareCode 'C2hrwGIP' \
    > test.out 2>&1
eval_tap $? 63 'PublicDownloadContentByShareCode' test.out

#- 64 PublicDownloadContentByContentID
./ng net.accelbyte.sdk.cli.Main ugc publicDownloadContentByContentID \
    --contentId 'oglLdBxq' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 64 'PublicDownloadContentByContentID' test.out

#- 65 AddDownloadCount
./ng net.accelbyte.sdk.cli.Main ugc addDownloadCount \
    --contentId 'DuwfSckQ' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 65 'AddDownloadCount' test.out

#- 66 UpdateContentLikeStatus
./ng net.accelbyte.sdk.cli.Main ugc updateContentLikeStatus \
    --contentId 'fpQPRr9h' \
    --namespace "$AB_NAMESPACE" \
    --body '{"likeStatus": false}' \
    > test.out 2>&1
eval_tap $? 66 'UpdateContentLikeStatus' test.out

#- 67 PublicDownloadContentPreview
./ng net.accelbyte.sdk.cli.Main ugc publicDownloadContentPreview \
    --contentId 'sRNyjmA5' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 67 'PublicDownloadContentPreview' test.out

#- 68 GetTag
./ng net.accelbyte.sdk.cli.Main ugc getTag \
    --namespace "$AB_NAMESPACE" \
    --limit '43' \
    --offset '63' \
    > test.out 2>&1
eval_tap $? 68 'GetTag' test.out

#- 69 GetType
./ng net.accelbyte.sdk.cli.Main ugc getType \
    --namespace "$AB_NAMESPACE" \
    --limit '40' \
    --offset '86' \
    > test.out 2>&1
eval_tap $? 69 'GetType' test.out

#- 70 PublicSearchCreator
./ng net.accelbyte.sdk.cli.Main ugc publicSearchCreator \
    --namespace "$AB_NAMESPACE" \
    --limit '67' \
    --offset '17' \
    --orderby '7hA06DyN' \
    --sortby 'LsbqnJTx' \
    > test.out 2>&1
eval_tap $? 70 'PublicSearchCreator' test.out

#- 71 GetFollowedUsers
./ng net.accelbyte.sdk.cli.Main ugc getFollowedUsers \
    --namespace "$AB_NAMESPACE" \
    --limit '85' \
    --offset '61' \
    > test.out 2>&1
eval_tap $? 71 'GetFollowedUsers' test.out

#- 72 PublicGetCreator
./ng net.accelbyte.sdk.cli.Main ugc publicGetCreator \
    --namespace "$AB_NAMESPACE" \
    --userId 'TQE4uskD' \
    > test.out 2>&1
eval_tap $? 72 'PublicGetCreator' test.out

#- 73 GetChannels
./ng net.accelbyte.sdk.cli.Main ugc getChannels \
    --namespace "$AB_NAMESPACE" \
    --userId 'qDh1MtNg' \
    --limit '24' \
    --name 'jT1htSdd' \
    --offset '39' \
    > test.out 2>&1
eval_tap $? 73 'GetChannels' test.out

#- 74 PublicCreateChannel
./ng net.accelbyte.sdk.cli.Main ugc publicCreateChannel \
    --namespace "$AB_NAMESPACE" \
    --userId 'rtMca5g1' \
    --body '{"name": "uIPWj2rK"}' \
    > test.out 2>&1
eval_tap $? 74 'PublicCreateChannel' test.out

#- 75 DeleteAllUserChannel
./ng net.accelbyte.sdk.cli.Main ugc deleteAllUserChannel \
    --namespace "$AB_NAMESPACE" \
    --userId 'omK9CsCQ' \
    > test.out 2>&1
eval_tap $? 75 'DeleteAllUserChannel' test.out

#- 76 UpdateChannel
./ng net.accelbyte.sdk.cli.Main ugc updateChannel \
    --channelId 'wjqv7Bdn' \
    --namespace "$AB_NAMESPACE" \
    --userId 'WkyDdWf6' \
    --body '{"name": "bLdl3jPO"}' \
    > test.out 2>&1
eval_tap $? 76 'UpdateChannel' test.out

#- 77 DeleteChannel
./ng net.accelbyte.sdk.cli.Main ugc deleteChannel \
    --channelId '6DNvyspC' \
    --namespace "$AB_NAMESPACE" \
    --userId 't4f9Ksg6' \
    > test.out 2>&1
eval_tap $? 77 'DeleteChannel' test.out

#- 78 CreateContentDirect
eval_tap 0 78 'CreateContentDirect # SKIP deprecated' test.out

#- 79 CreateContentS3
./ng net.accelbyte.sdk.cli.Main ugc createContentS3 \
    --channelId 'sa69WG3f' \
    --namespace "$AB_NAMESPACE" \
    --userId 'G2ha8n3E' \
    --body '{"contentType": "fJWXCDW2", "customAttributes": {"LqJALRb7": {}, "0ivLf9dN": {}, "20RSNJZf": {}}, "fileExtension": "2jfhofnB", "name": "4ocUVALS", "preview": "SZoTyMxB", "previewMetadata": {"previewContentType": "kiyZjYeK", "previewFileExtension": "FKzjal5i"}, "subType": "uZ6X4ele", "tags": ["SYeXjGjM", "8O3lmy7d", "BHrh6w9d"], "type": "LSO3KoYr"}' \
    > test.out 2>&1
eval_tap $? 79 'CreateContentS3' test.out

#- 80 PublicUpdateContentByShareCode
./ng net.accelbyte.sdk.cli.Main ugc publicUpdateContentByShareCode \
    --channelId 'GudEB6XD' \
    --namespace "$AB_NAMESPACE" \
    --shareCode 'ijk6PDCr' \
    --userId 'AqUGBhu4' \
    --body '{"contentType": "mi3gcD1F", "customAttributes": {"zDy6PoVx": {}, "WNcZsxG9": {}, "yVgXNkpP": {}}, "fileExtension": "wdAK5dOE", "name": "aGGYgMnP", "payload": "peV4DheJ", "preview": "i78d7seu", "previewMetadata": {"previewContentType": "Iwhyidfl", "previewFileExtension": "Kl4gaiyp"}, "subType": "G49u83Ie", "tags": ["f4I9bTbG", "GfL50k3H", "GGFg4VXA"], "type": "eCpGyzPW", "updateContentFile": false}' \
    > test.out 2>&1
eval_tap $? 80 'PublicUpdateContentByShareCode' test.out

#- 81 UpdateContentS3
./ng net.accelbyte.sdk.cli.Main ugc updateContentS3 \
    --channelId 'hKPLCKeF' \
    --contentId 'LPaQJsFN' \
    --namespace "$AB_NAMESPACE" \
    --userId 'eYsWgRzo' \
    --body '{"contentType": "qTB37dK0", "customAttributes": {"m2oIpQ6f": {}, "flsFTWvY": {}, "YEigQla7": {}}, "fileExtension": "G6ax6w1Y", "name": "Eodah0TP", "payload": "Y4BDlpGU", "preview": "2GfEh8Ot", "previewMetadata": {"previewContentType": "xWQ1XB7z", "previewFileExtension": "Qxxh82lz"}, "subType": "ymswVLJQ", "tags": ["ZfLeeL6f", "lyp453Mk", "IfQVJJA8"], "type": "nu53Fiot", "updateContentFile": true}' \
    > test.out 2>&1
eval_tap $? 81 'UpdateContentS3' test.out

#- 82 PublicDeleteContentByShareCode
./ng net.accelbyte.sdk.cli.Main ugc publicDeleteContentByShareCode \
    --channelId 'Ouq5PJyc' \
    --namespace "$AB_NAMESPACE" \
    --shareCode 'XuyOxjmc' \
    --userId 'ZNPQmNcF' \
    > test.out 2>&1
eval_tap $? 82 'PublicDeleteContentByShareCode' test.out

#- 83 UpdateContentDirect
eval_tap 0 83 'UpdateContentDirect # SKIP deprecated' test.out

#- 84 DeleteContent
./ng net.accelbyte.sdk.cli.Main ugc deleteContent \
    --channelId 'QQcy42hK' \
    --contentId 'noPSxPgv' \
    --namespace "$AB_NAMESPACE" \
    --userId 's7rTavNg' \
    > test.out 2>&1
eval_tap $? 84 'DeleteContent' test.out

#- 85 UpdateContentShareCode
./ng net.accelbyte.sdk.cli.Main ugc updateContentShareCode \
    --channelId 'VRGJugHU' \
    --contentId 'OUj6u8Bv' \
    --namespace "$AB_NAMESPACE" \
    --userId 'vZ3TOKG9' \
    --body '{"shareCode": "s3VTinCz"}' \
    > test.out 2>&1
eval_tap $? 85 'UpdateContentShareCode' test.out

#- 86 PublicGetUserContent
./ng net.accelbyte.sdk.cli.Main ugc publicGetUserContent \
    --namespace "$AB_NAMESPACE" \
    --userId 'nz1paAIq' \
    --limit '25' \
    --offset '2' \
    > test.out 2>&1
eval_tap $? 86 'PublicGetUserContent' test.out

#- 87 DeleteAllUserContents
./ng net.accelbyte.sdk.cli.Main ugc deleteAllUserContents \
    --namespace "$AB_NAMESPACE" \
    --userId '66gTG8UX' \
    > test.out 2>&1
eval_tap $? 87 'DeleteAllUserContents' test.out

#- 88 UpdateScreenshots
./ng net.accelbyte.sdk.cli.Main ugc updateScreenshots \
    --contentId 'OMvx1xM9' \
    --namespace "$AB_NAMESPACE" \
    --userId 'QnHS4QQb' \
    --body '{"screenshots": [{"description": "bkziesJ5", "screenshotId": "klLXNA3c"}, {"description": "9d81ElwE", "screenshotId": "jqjkrjb3"}, {"description": "rvGrXoMU", "screenshotId": "A49Bmrct"}]}' \
    > test.out 2>&1
eval_tap $? 88 'UpdateScreenshots' test.out

#- 89 UploadContentScreenshot
./ng net.accelbyte.sdk.cli.Main ugc uploadContentScreenshot \
    --contentId 'LasMnog3' \
    --namespace "$AB_NAMESPACE" \
    --userId 'fU1Eu8tr' \
    --body '{"screenshots": [{"contentType": "V5uyHCUI", "description": "qDRTfBwv", "fileExtension": "png"}, {"contentType": "ILtd3wSe", "description": "iBXtuNE6", "fileExtension": "jpeg"}, {"contentType": "zDhWjAdC", "description": "tVReXBvm", "fileExtension": "pjp"}]}' \
    > test.out 2>&1
eval_tap $? 89 'UploadContentScreenshot' test.out

#- 90 DeleteContentScreenshot
./ng net.accelbyte.sdk.cli.Main ugc deleteContentScreenshot \
    --contentId '7MxlizrE' \
    --namespace "$AB_NAMESPACE" \
    --screenshotId '8NQjfXci' \
    --userId 'S2qJuNgk' \
    > test.out 2>&1
eval_tap $? 90 'DeleteContentScreenshot' test.out

#- 91 UpdateUserFollowStatus
./ng net.accelbyte.sdk.cli.Main ugc updateUserFollowStatus \
    --namespace "$AB_NAMESPACE" \
    --userId 'ihn0ki9e' \
    --body '{"followStatus": false}' \
    > test.out 2>&1
eval_tap $? 91 'UpdateUserFollowStatus' test.out

#- 92 GetPublicFollowers
./ng net.accelbyte.sdk.cli.Main ugc getPublicFollowers \
    --namespace "$AB_NAMESPACE" \
    --userId 'pyh96voC' \
    --limit '2' \
    --offset '20' \
    > test.out 2>&1
eval_tap $? 92 'GetPublicFollowers' test.out

#- 93 GetPublicFollowing
./ng net.accelbyte.sdk.cli.Main ugc getPublicFollowing \
    --namespace "$AB_NAMESPACE" \
    --userId 'gckR2nrU' \
    --limit '19' \
    --offset '56' \
    > test.out 2>&1
eval_tap $? 93 'GetPublicFollowing' test.out

#- 94 GetGroups
./ng net.accelbyte.sdk.cli.Main ugc getGroups \
    --namespace "$AB_NAMESPACE" \
    --userId 'dsFcTmK8' \
    --limit '59' \
    --offset '28' \
    > test.out 2>&1
eval_tap $? 94 'GetGroups' test.out

#- 95 CreateGroup
./ng net.accelbyte.sdk.cli.Main ugc createGroup \
    --namespace "$AB_NAMESPACE" \
    --userId 'EDHUucal' \
    --body '{"contents": ["dCCuT766", "wLOG1uiP", "NvIhtpgn"], "name": "5xYomrwx"}' \
    > test.out 2>&1
eval_tap $? 95 'CreateGroup' test.out

#- 96 DeleteAllUserGroup
./ng net.accelbyte.sdk.cli.Main ugc deleteAllUserGroup \
    --namespace "$AB_NAMESPACE" \
    --userId '1jsjkFsT' \
    > test.out 2>&1
eval_tap $? 96 'DeleteAllUserGroup' test.out

#- 97 GetGroup
./ng net.accelbyte.sdk.cli.Main ugc getGroup \
    --groupId 'QI4pBFte' \
    --namespace "$AB_NAMESPACE" \
    --userId 'LHPaQycq' \
    > test.out 2>&1
eval_tap $? 97 'GetGroup' test.out

#- 98 UpdateGroup
./ng net.accelbyte.sdk.cli.Main ugc updateGroup \
    --groupId 'RFiW0COM' \
    --namespace "$AB_NAMESPACE" \
    --userId 'iDUdjGTd' \
    --body '{"contents": ["6LEQ5Ksb", "gwAeRkD7", "faJkQZKF"], "name": "B2tAfqkf"}' \
    > test.out 2>&1
eval_tap $? 98 'UpdateGroup' test.out

#- 99 DeleteGroup
./ng net.accelbyte.sdk.cli.Main ugc deleteGroup \
    --groupId 'JG1a4mfh' \
    --namespace "$AB_NAMESPACE" \
    --userId '38qhWqGQ' \
    > test.out 2>&1
eval_tap $? 99 'DeleteGroup' test.out

#- 100 GetGroupContent
./ng net.accelbyte.sdk.cli.Main ugc getGroupContent \
    --groupId '2FWjcZKs' \
    --namespace "$AB_NAMESPACE" \
    --userId '0rU3TO8c' \
    --limit '4' \
    --offset '26' \
    > test.out 2>&1
eval_tap $? 100 'GetGroupContent' test.out

#- 101 DeleteAllUserStates
./ng net.accelbyte.sdk.cli.Main ugc deleteAllUserStates \
    --namespace "$AB_NAMESPACE" \
    --userId 'JIS8IV0o' \
    > test.out 2>&1
eval_tap $? 101 'DeleteAllUserStates' test.out

#- 102 AdminGetContentByChannelIDV2
./ng net.accelbyte.sdk.cli.Main ugc adminGetContentByChannelIDV2 \
    --channelId 'TXNJaCAF' \
    --namespace "$AB_NAMESPACE" \
    --limit '34' \
    --name 'EgVsToO5' \
    --offset '3' \
    --sortBy 's8ihjjYE' \
    > test.out 2>&1
eval_tap $? 102 'AdminGetContentByChannelIDV2' test.out

#- 103 AdminCreateContentV2
./ng net.accelbyte.sdk.cli.Main ugc adminCreateContentV2 \
    --channelId 'vbrqnRjC' \
    --namespace "$AB_NAMESPACE" \
    --body '{"contentType": "FgjYjCvD", "customAttributes": {"8UXsETqI": {}, "IXqWYXzR": {}, "UAEdTGKl": {}}, "fileExtension": "JWCWQEsp", "name": "T3qqJNau", "shareCode": "gMeAkdrM", "subType": "lqCC8SaN", "tags": ["ATWwZufd", "scdxEilx", "0VElvaSp"], "type": "wnUzjgIW"}' \
    > test.out 2>&1
eval_tap $? 103 'AdminCreateContentV2' test.out

#- 104 AdminDeleteOfficialContentV2
./ng net.accelbyte.sdk.cli.Main ugc adminDeleteOfficialContentV2 \
    --channelId 'Z4PyEdF4' \
    --contentId 'ZS3yw24d' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 104 'AdminDeleteOfficialContentV2' test.out

#- 105 AdminUpdateOfficialContentV2
./ng net.accelbyte.sdk.cli.Main ugc adminUpdateOfficialContentV2 \
    --channelId 'M4rxFFKd' \
    --contentId 'nGPppg7N' \
    --namespace "$AB_NAMESPACE" \
    --body '{"customAttributes": {"oNV1JGpL": {}, "jYbgGQb6": {}, "YkBPNSER": {}}, "name": "iDyaGySN", "shareCode": "NN0MCYcC", "subType": "HbMX4gEx", "tags": ["H2js3Uuw", "cAbZ9Kz4", "cEoeDH6N"], "type": "PXqwm00l"}' \
    > test.out 2>&1
eval_tap $? 105 'AdminUpdateOfficialContentV2' test.out

#- 106 AdminCopyContent
./ng net.accelbyte.sdk.cli.Main ugc adminCopyContent \
    --channelId 'UIuUWb1S' \
    --contentId 'yUirJeuv' \
    --namespace "$AB_NAMESPACE" \
    --body '{"customAttributes": {"D9TFXxj6": {}, "80c9hXay": {}, "9Ohub19v": {}}, "name": "6BGoSVEz", "subType": "zdM312av", "tags": ["cLawALY0", "KcpT7rRO", "EnxtYilj"], "targetChannelId": "58McdW9e", "type": "a0S9Qswl"}' \
    > test.out 2>&1
eval_tap $? 106 'AdminCopyContent' test.out

#- 107 AdminUpdateOfficialContentFileLocation
./ng net.accelbyte.sdk.cli.Main ugc adminUpdateOfficialContentFileLocation \
    --channelId 'e4fgUzNG' \
    --contentId 'FUFWdjFt' \
    --namespace "$AB_NAMESPACE" \
    --body '{"fileExtension": "5vQrm3N5", "fileLocation": "jwyfp1Mx"}' \
    > test.out 2>&1
eval_tap $? 107 'AdminUpdateOfficialContentFileLocation' test.out

#- 108 AdminGenerateOfficialContentUploadURLV2
./ng net.accelbyte.sdk.cli.Main ugc adminGenerateOfficialContentUploadURLV2 \
    --channelId 'ZX6lBlz0' \
    --contentId '3jkjVqzm' \
    --namespace "$AB_NAMESPACE" \
    --body '{"contentType": "mfwFoU9q", "fileExtension": "iDSSIbRH"}' \
    > test.out 2>&1
eval_tap $? 108 'AdminGenerateOfficialContentUploadURLV2' test.out

#- 109 AdminGetConfigs
./ng net.accelbyte.sdk.cli.Main ugc adminGetConfigs \
    --namespace "$AB_NAMESPACE" \
    --limit '41' \
    --offset '64' \
    > test.out 2>&1
eval_tap $? 109 'AdminGetConfigs' test.out

#- 110 AdminUpdateConfig
./ng net.accelbyte.sdk.cli.Main ugc adminUpdateConfig \
    --key 'j5wJLUT9' \
    --namespace "$AB_NAMESPACE" \
    --body '{"value": "rv1dCQ1V"}' \
    > test.out 2>&1
eval_tap $? 110 'AdminUpdateConfig' test.out

#- 111 AdminListContentV2
./ng net.accelbyte.sdk.cli.Main ugc adminListContentV2 \
    --namespace "$AB_NAMESPACE" \
    --isOfficial  \
    --limit '65' \
    --name '4IMI8FoL' \
    --offset '35' \
    --sortBy 'IPNkY4Hg' \
    --subType 'BOL0ngR8' \
    --tags 'Q8w1nN2t,JdPiuILq,4mtbhtR6' \
    --type 'Q0fsmxy1' \
    > test.out 2>&1
eval_tap $? 111 'AdminListContentV2' test.out

#- 112 AdminBulkGetContentByIDsV2
./ng net.accelbyte.sdk.cli.Main ugc adminBulkGetContentByIDsV2 \
    --namespace "$AB_NAMESPACE" \
    --body '{"contentIds": ["ORe3DFUB", "M0IpKsR2", "CFVi6qTk"]}' \
    > test.out 2>&1
eval_tap $? 112 'AdminBulkGetContentByIDsV2' test.out

#- 113 AdminGetContentBulkByShareCodesV2
./ng net.accelbyte.sdk.cli.Main ugc adminGetContentBulkByShareCodesV2 \
    --namespace "$AB_NAMESPACE" \
    --body '{"shareCodes": ["wcpdMbZW", "koK24y7P", "rJtbRlzx"]}' \
    > test.out 2>&1
eval_tap $? 113 'AdminGetContentBulkByShareCodesV2' test.out

#- 114 AdminGetContentByShareCodeV2
./ng net.accelbyte.sdk.cli.Main ugc adminGetContentByShareCodeV2 \
    --namespace "$AB_NAMESPACE" \
    --shareCode 'urgX54kG' \
    > test.out 2>&1
eval_tap $? 114 'AdminGetContentByShareCodeV2' test.out

#- 115 AdminGetContentByContentIDV2
./ng net.accelbyte.sdk.cli.Main ugc adminGetContentByContentIDV2 \
    --contentId '54N6d3wz' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 115 'AdminGetContentByContentIDV2' test.out

#- 116 RollbackContentVersionV2
./ng net.accelbyte.sdk.cli.Main ugc rollbackContentVersionV2 \
    --contentId 'crrjyuqa' \
    --namespace "$AB_NAMESPACE" \
    --versionId '3vrzOO9f' \
    > test.out 2>&1
eval_tap $? 116 'RollbackContentVersionV2' test.out

#- 117 AdminUpdateScreenshotsV2
./ng net.accelbyte.sdk.cli.Main ugc adminUpdateScreenshotsV2 \
    --contentId 'jCKiFqKK' \
    --namespace "$AB_NAMESPACE" \
    --body '{"screenshots": [{"description": "1LjgB02X", "screenshotId": "blgxSJyG"}, {"description": "whIR7QpK", "screenshotId": "lSc0V5Gz"}, {"description": "L3yjoFxT", "screenshotId": "QTXXepoP"}]}' \
    > test.out 2>&1
eval_tap $? 117 'AdminUpdateScreenshotsV2' test.out

#- 118 AdminUploadContentScreenshotV2
./ng net.accelbyte.sdk.cli.Main ugc adminUploadContentScreenshotV2 \
    --contentId 'yHCW0OpL' \
    --namespace "$AB_NAMESPACE" \
    --body '{"screenshots": [{"contentType": "fvrKmiFo", "description": "wkqnjALA", "fileExtension": "jpg"}, {"contentType": "pM82fYqE", "description": "0XojzqEX", "fileExtension": "jfif"}, {"contentType": "p8cjVztQ", "description": "35SjbJbr", "fileExtension": "jpg"}]}' \
    > test.out 2>&1
eval_tap $? 118 'AdminUploadContentScreenshotV2' test.out

#- 119 AdminDeleteContentScreenshotV2
./ng net.accelbyte.sdk.cli.Main ugc adminDeleteContentScreenshotV2 \
    --contentId 'oFQJavuB' \
    --namespace "$AB_NAMESPACE" \
    --screenshotId 'aohsU0N1' \
    > test.out 2>&1
eval_tap $? 119 'AdminDeleteContentScreenshotV2' test.out

#- 120 ListContentVersionsV2
./ng net.accelbyte.sdk.cli.Main ugc listContentVersionsV2 \
    --contentId 'yxmad3Bi' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 120 'ListContentVersionsV2' test.out

#- 121 AdminGetOfficialGroupContentsV2
./ng net.accelbyte.sdk.cli.Main ugc adminGetOfficialGroupContentsV2 \
    --groupId 'CBjD0Czu' \
    --namespace "$AB_NAMESPACE" \
    --limit '89' \
    --offset '99' \
    > test.out 2>&1
eval_tap $? 121 'AdminGetOfficialGroupContentsV2' test.out

#- 122 AdminListStagingContents
./ng net.accelbyte.sdk.cli.Main ugc adminListStagingContents \
    --namespace "$AB_NAMESPACE" \
    --limit '26' \
    --offset '79' \
    --sortBy 'tjH9nar9' \
    --status 'YMJSH2n3' \
    > test.out 2>&1
eval_tap $? 122 'AdminListStagingContents' test.out

#- 123 AdminGetStagingContentByID
./ng net.accelbyte.sdk.cli.Main ugc adminGetStagingContentByID \
    --contentId 'EN08uTJv' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 123 'AdminGetStagingContentByID' test.out

#- 124 AdminApproveStagingContent
./ng net.accelbyte.sdk.cli.Main ugc adminApproveStagingContent \
    --contentId 'Pm0FvQf1' \
    --namespace "$AB_NAMESPACE" \
    --body '{"approved": true, "note": "78GyMpVQ"}' \
    > test.out 2>&1
eval_tap $? 124 'AdminApproveStagingContent' test.out

#- 125 AdminUpdateContentByShareCodeV2
./ng net.accelbyte.sdk.cli.Main ugc adminUpdateContentByShareCodeV2 \
    --channelId '4GKL1xbY' \
    --namespace "$AB_NAMESPACE" \
    --shareCode 'pa2vS7mF' \
    --userId 'Rzs3xLsY' \
    --body '{"customAttributes": {"vgfgQSRJ": {}, "7C314fqy": {}, "dCxBMlkM": {}}, "name": "alJbiJQJ", "shareCode": "ddKyGpq4", "subType": "9oQfhMrN", "tags": ["yJhEK8w1", "NErJnekO", "QeIDBMre"], "type": "74QgE0HR"}' \
    > test.out 2>&1
eval_tap $? 125 'AdminUpdateContentByShareCodeV2' test.out

#- 126 AdminDeleteContentByShareCodeV2
./ng net.accelbyte.sdk.cli.Main ugc adminDeleteContentByShareCodeV2 \
    --channelId 'OtzFoc5Z' \
    --namespace "$AB_NAMESPACE" \
    --shareCode 'shRxC4St' \
    --userId '2vgM1Yzv' \
    > test.out 2>&1
eval_tap $? 126 'AdminDeleteContentByShareCodeV2' test.out

#- 127 AdminDeleteUserContentV2
./ng net.accelbyte.sdk.cli.Main ugc adminDeleteUserContentV2 \
    --channelId 'hsPRvtzB' \
    --contentId 'Jw3Czmpr' \
    --namespace "$AB_NAMESPACE" \
    --userId 'SNP7pVJu' \
    > test.out 2>&1
eval_tap $? 127 'AdminDeleteUserContentV2' test.out

#- 128 AdminUpdateUserContentV2
./ng net.accelbyte.sdk.cli.Main ugc adminUpdateUserContentV2 \
    --channelId '8PTa4moY' \
    --contentId 'uyMZJEhT' \
    --namespace "$AB_NAMESPACE" \
    --userId 'u7srRz8k' \
    --body '{"customAttributes": {"46fkTUEB": {}, "QfGuKGPx": {}, "1uMocgwa": {}}, "name": "ZGeZdlmf", "shareCode": "D2lz1pbN", "subType": "UavlWVj3", "tags": ["eR5cD7Jc", "3MiaRwyv", "HpM8TN8O"], "type": "7y77Exw4"}' \
    > test.out 2>&1
eval_tap $? 128 'AdminUpdateUserContentV2' test.out

#- 129 AdminUpdateUserContentFileLocation
./ng net.accelbyte.sdk.cli.Main ugc adminUpdateUserContentFileLocation \
    --channelId 'qR4KE1vv' \
    --contentId 'bIiUZRHi' \
    --namespace "$AB_NAMESPACE" \
    --userId 'Oc4h9AeT' \
    --body '{"fileExtension": "eycSi9oR", "fileLocation": "z7Ao0DyC"}' \
    > test.out 2>&1
eval_tap $? 129 'AdminUpdateUserContentFileLocation' test.out

#- 130 AdminGenerateUserContentUploadURLV2
./ng net.accelbyte.sdk.cli.Main ugc adminGenerateUserContentUploadURLV2 \
    --channelId 'NrpqhUwE' \
    --contentId 'BCQkTThV' \
    --namespace "$AB_NAMESPACE" \
    --userId 'GaQgHwuy' \
    --body '{"contentType": "waV0l9CH", "fileExtension": "HjPjjJmc"}' \
    > test.out 2>&1
eval_tap $? 130 'AdminGenerateUserContentUploadURLV2' test.out

#- 131 AdminGetContentByUserIDV2
./ng net.accelbyte.sdk.cli.Main ugc adminGetContentByUserIDV2 \
    --namespace "$AB_NAMESPACE" \
    --userId '92bOysmP' \
    --limit '75' \
    --offset '17' \
    --sortBy 'W59fqHVz' \
    > test.out 2>&1
eval_tap $? 131 'AdminGetContentByUserIDV2' test.out

#- 132 AdminUpdateContentHideStatusV2
./ng net.accelbyte.sdk.cli.Main ugc adminUpdateContentHideStatusV2 \
    --contentId 'kUJR2QpR' \
    --namespace "$AB_NAMESPACE" \
    --userId 'f06FYlR7' \
    --body '{"isHidden": true}' \
    > test.out 2>&1
eval_tap $? 132 'AdminUpdateContentHideStatusV2' test.out

#- 133 AdminGetUserGroupContentsV2
./ng net.accelbyte.sdk.cli.Main ugc adminGetUserGroupContentsV2 \
    --groupId 'Yn3z4ieL' \
    --namespace "$AB_NAMESPACE" \
    --userId 'uKP0MXqy' \
    --limit '72' \
    --offset '98' \
    > test.out 2>&1
eval_tap $? 133 'AdminGetUserGroupContentsV2' test.out

#- 134 AdminListUserStagingContents
./ng net.accelbyte.sdk.cli.Main ugc adminListUserStagingContents \
    --namespace "$AB_NAMESPACE" \
    --userId 'bu86mYLY' \
    --limit '5' \
    --offset '64' \
    --sortBy 'd5GPnnhy' \
    --status 'RUpEuiJn' \
    > test.out 2>&1
eval_tap $? 134 'AdminListUserStagingContents' test.out

#- 135 PublicGetContentByChannelIDV2
./ng net.accelbyte.sdk.cli.Main ugc publicGetContentByChannelIDV2 \
    --channelId 'CUB0ibbK' \
    --namespace "$AB_NAMESPACE" \
    --limit '80' \
    --name 'I6m0X5rm' \
    --offset '24' \
    --sortBy 'YetrXG7r' \
    > test.out 2>&1
eval_tap $? 135 'PublicGetContentByChannelIDV2' test.out

#- 136 PublicListContentV2
./ng net.accelbyte.sdk.cli.Main ugc publicListContentV2 \
    --namespace "$AB_NAMESPACE" \
    --isOfficial  \
    --limit '37' \
    --name 'Jv02L1Ff' \
    --offset '6' \
    --sortBy 'OGA8vU3G' \
    --subType 'leoslJOu' \
    --tags '1NvJeMnR,irwwhpDM,teOVz6E1' \
    --type 'paQ3xUuq' \
    > test.out 2>&1
eval_tap $? 136 'PublicListContentV2' test.out

#- 137 PublicBulkGetContentByIDV2
./ng net.accelbyte.sdk.cli.Main ugc publicBulkGetContentByIDV2 \
    --namespace "$AB_NAMESPACE" \
    --body '{"contentIds": ["KLqetaW8", "5bRUV4h2", "0BvmEGPT"]}' \
    > test.out 2>&1
eval_tap $? 137 'PublicBulkGetContentByIDV2' test.out

#- 138 PublicGetContentBulkByShareCodesV2
./ng net.accelbyte.sdk.cli.Main ugc publicGetContentBulkByShareCodesV2 \
    --namespace "$AB_NAMESPACE" \
    --body '{"shareCodes": ["reo0qBGH", "EEk17oNQ", "b0IyfD5O"]}' \
    > test.out 2>&1
eval_tap $? 138 'PublicGetContentBulkByShareCodesV2' test.out

#- 139 PublicGetContentByShareCodeV2
./ng net.accelbyte.sdk.cli.Main ugc publicGetContentByShareCodeV2 \
    --namespace "$AB_NAMESPACE" \
    --shareCode 'xCijk9LM' \
    > test.out 2>&1
eval_tap $? 139 'PublicGetContentByShareCodeV2' test.out

#- 140 PublicGetContentByIDV2
./ng net.accelbyte.sdk.cli.Main ugc publicGetContentByIDV2 \
    --contentId '5WNVgDCq' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 140 'PublicGetContentByIDV2' test.out

#- 141 PublicAddDownloadCountV2
./ng net.accelbyte.sdk.cli.Main ugc publicAddDownloadCountV2 \
    --contentId 't44zGWD1' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 141 'PublicAddDownloadCountV2' test.out

#- 142 PublicListContentDownloaderV2
./ng net.accelbyte.sdk.cli.Main ugc publicListContentDownloaderV2 \
    --contentId 'ZJFfEkpS' \
    --namespace "$AB_NAMESPACE" \
    --limit '97' \
    --offset '53' \
    --sortBy 'Ho6GSTo2' \
    --userId '5WoiyDoo' \
    > test.out 2>&1
eval_tap $? 142 'PublicListContentDownloaderV2' test.out

#- 143 PublicListContentLikeV2
./ng net.accelbyte.sdk.cli.Main ugc publicListContentLikeV2 \
    --contentId 'xaIpcr5K' \
    --namespace "$AB_NAMESPACE" \
    --limit '79' \
    --offset '44' \
    --sortBy '8bGK2oiu' \
    > test.out 2>&1
eval_tap $? 143 'PublicListContentLikeV2' test.out

#- 144 UpdateContentLikeStatusV2
./ng net.accelbyte.sdk.cli.Main ugc updateContentLikeStatusV2 \
    --contentId 'HpliW6QM' \
    --namespace "$AB_NAMESPACE" \
    --body '{"likeStatus": false}' \
    > test.out 2>&1
eval_tap $? 144 'UpdateContentLikeStatusV2' test.out

#- 145 PublicCreateContentV2
./ng net.accelbyte.sdk.cli.Main ugc publicCreateContentV2 \
    --channelId 'ks5iZI0c' \
    --namespace "$AB_NAMESPACE" \
    --userId 'MGCldhpD' \
    --body '{"contentType": "xiIVPJtB", "customAttributes": {"jFI6SdkX": {}, "9aIzZJ0A": {}, "XauIw4ie": {}}, "fileExtension": "EPC0NhVe", "name": "ZfdTnTxJ", "subType": "2ELgyojq", "tags": ["skzkhxJy", "C8J4YtTz", "hjEcD8fm"], "type": "2hbnuLUx"}' \
    > test.out 2>&1
eval_tap $? 145 'PublicCreateContentV2' test.out

#- 146 PublicUpdateContentByShareCodeV2
./ng net.accelbyte.sdk.cli.Main ugc publicUpdateContentByShareCodeV2 \
    --channelId 'g1BAXZSv' \
    --namespace "$AB_NAMESPACE" \
    --shareCode 'ZsPgEFM9' \
    --userId 'z4o2oS9k' \
    --body '{"customAttributes": {"UDDVJ0Lw": {}, "okF6wfJ8": {}, "B6PkuE13": {}}, "name": "NyvqLunP", "subType": "iKKXHIAO", "tags": ["r5NO53vc", "uGN5wXRU", "t9d7wxVB"], "type": "ye0DK4TK"}' \
    > test.out 2>&1
eval_tap $? 146 'PublicUpdateContentByShareCodeV2' test.out

#- 147 PublicDeleteContentByShareCodeV2
./ng net.accelbyte.sdk.cli.Main ugc publicDeleteContentByShareCodeV2 \
    --channelId '6tbj4q78' \
    --namespace "$AB_NAMESPACE" \
    --shareCode 'gJCfPvcC' \
    --userId 'oeXaIHod' \
    > test.out 2>&1
eval_tap $? 147 'PublicDeleteContentByShareCodeV2' test.out

#- 148 PublicDeleteContentV2
./ng net.accelbyte.sdk.cli.Main ugc publicDeleteContentV2 \
    --channelId 'VRofnJYm' \
    --contentId 'dqtEYVyT' \
    --namespace "$AB_NAMESPACE" \
    --userId 'UdumOJeX' \
    > test.out 2>&1
eval_tap $? 148 'PublicDeleteContentV2' test.out

#- 149 PublicUpdateContentV2
./ng net.accelbyte.sdk.cli.Main ugc publicUpdateContentV2 \
    --channelId 'P1jm9Qjt' \
    --contentId 'a0YoQfJi' \
    --namespace "$AB_NAMESPACE" \
    --userId 'nlxJmSe1' \
    --body '{"customAttributes": {"mX4yfxuT": {}, "yt8zW5rq": {}, "4Okd3tmR": {}}, "name": "ApHdmvAR", "subType": "oVO8iKXi", "tags": ["uXWZLBAG", "jBhoGRmy", "cMrAt8hY"], "type": "WXH4Agpd"}' \
    > test.out 2>&1
eval_tap $? 149 'PublicUpdateContentV2' test.out

#- 150 PublicUpdateContentFileLocation
./ng net.accelbyte.sdk.cli.Main ugc publicUpdateContentFileLocation \
    --channelId 'mt8D0Sm7' \
    --contentId 'EG3fnxxU' \
    --namespace "$AB_NAMESPACE" \
    --userId '8JGxrkU3' \
    --body '{"fileExtension": "MmyxZLeg", "fileLocation": "4nf1KlAU"}' \
    > test.out 2>&1
eval_tap $? 150 'PublicUpdateContentFileLocation' test.out

#- 151 UpdateContentShareCodeV2
./ng net.accelbyte.sdk.cli.Main ugc updateContentShareCodeV2 \
    --channelId 'p5pQlF4o' \
    --contentId 'QoPqc18s' \
    --namespace "$AB_NAMESPACE" \
    --userId 'jo9qbU3y' \
    --body '{"shareCode": "9MMaIEY3"}' \
    > test.out 2>&1
eval_tap $? 151 'UpdateContentShareCodeV2' test.out

#- 152 PublicGenerateContentUploadURLV2
./ng net.accelbyte.sdk.cli.Main ugc publicGenerateContentUploadURLV2 \
    --channelId 'TPOB3hz5' \
    --contentId '2l4b4wRW' \
    --namespace "$AB_NAMESPACE" \
    --userId 'xicjWgfy' \
    --body '{"contentType": "C8Av4vf2", "fileExtension": "8zjSdvFa"}' \
    > test.out 2>&1
eval_tap $? 152 'PublicGenerateContentUploadURLV2' test.out

#- 153 PublicGetContentByUserIDV2
./ng net.accelbyte.sdk.cli.Main ugc publicGetContentByUserIDV2 \
    --namespace "$AB_NAMESPACE" \
    --userId 'R0jHOYr8' \
    --limit '8' \
    --offset '97' \
    --sortBy '7deX0oP5' \
    > test.out 2>&1
eval_tap $? 153 'PublicGetContentByUserIDV2' test.out

#- 154 UpdateScreenshotsV2
./ng net.accelbyte.sdk.cli.Main ugc updateScreenshotsV2 \
    --contentId '0Iglp6QS' \
    --namespace "$AB_NAMESPACE" \
    --userId 'AMMDo9i2' \
    --body '{"screenshots": [{"description": "dCMNJtmO", "screenshotId": "pIfgFykW"}, {"description": "KplJeV7D", "screenshotId": "CyGriIQI"}, {"description": "ZPj0cOaf", "screenshotId": "sALOgHwx"}]}' \
    > test.out 2>&1
eval_tap $? 154 'UpdateScreenshotsV2' test.out

#- 155 UploadContentScreenshotV2
./ng net.accelbyte.sdk.cli.Main ugc uploadContentScreenshotV2 \
    --contentId 'vmjnkssE' \
    --namespace "$AB_NAMESPACE" \
    --userId 'NvkJFImE' \
    --body '{"screenshots": [{"contentType": "EZBCi8zx", "description": "r4MiKLLd", "fileExtension": "jfif"}, {"contentType": "dZh9Dbz0", "description": "DbnmRXkO", "fileExtension": "jpeg"}, {"contentType": "SNAw2uw3", "description": "LvKdksHj", "fileExtension": "jfif"}]}' \
    > test.out 2>&1
eval_tap $? 155 'UploadContentScreenshotV2' test.out

#- 156 DeleteContentScreenshotV2
./ng net.accelbyte.sdk.cli.Main ugc deleteContentScreenshotV2 \
    --contentId 'NfNmnWnx' \
    --namespace "$AB_NAMESPACE" \
    --screenshotId 'LS273Xii' \
    --userId 'pxZM7cjq' \
    > test.out 2>&1
eval_tap $? 156 'DeleteContentScreenshotV2' test.out

#- 157 PublicGetGroupContentsV2
./ng net.accelbyte.sdk.cli.Main ugc publicGetGroupContentsV2 \
    --groupId 'gIUMofbl' \
    --namespace "$AB_NAMESPACE" \
    --userId 'En31RNd8' \
    --limit '11' \
    --offset '5' \
    > test.out 2>&1
eval_tap $? 157 'PublicGetGroupContentsV2' test.out

#- 158 ListUserStagingContents
./ng net.accelbyte.sdk.cli.Main ugc listUserStagingContents \
    --namespace "$AB_NAMESPACE" \
    --userId 'OXwr6bbw' \
    --limit '5' \
    --offset '7' \
    --sortBy 'yR6mewXK' \
    --status 'EhLkDiGA' \
    > test.out 2>&1
eval_tap $? 158 'ListUserStagingContents' test.out

#- 159 GetUserStagingContentByID
./ng net.accelbyte.sdk.cli.Main ugc getUserStagingContentByID \
    --contentId 'r2r8lsNF' \
    --namespace "$AB_NAMESPACE" \
    --userId 'LEnlJk68' \
    > test.out 2>&1
eval_tap $? 159 'GetUserStagingContentByID' test.out

#- 160 UpdateStagingContent
./ng net.accelbyte.sdk.cli.Main ugc updateStagingContent \
    --contentId 'DXw3EWfQ' \
    --namespace "$AB_NAMESPACE" \
    --userId 'WIyliP3O' \
    --body '{"fileExtension": "ciAGq9pw", "fileLocation": "8z73aIHa"}' \
    > test.out 2>&1
eval_tap $? 160 'UpdateStagingContent' test.out

#- 161 DeleteUserStagingContentByID
./ng net.accelbyte.sdk.cli.Main ugc deleteUserStagingContentByID \
    --contentId 'ymaWNUbC' \
    --namespace "$AB_NAMESPACE" \
    --userId 'M8z0DoRg' \
    > test.out 2>&1
eval_tap $? 161 'DeleteUserStagingContentByID' test.out


rm -f "tmp.dat"

exit $EXIT_CODE