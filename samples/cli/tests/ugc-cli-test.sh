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
    --limit '24' \
    --offset '60' \
    > test.out 2>&1
eval_tap $? 2 'SingleAdminGetChannel' test.out

#- 3 AdminCreateChannel
./ng net.accelbyte.sdk.cli.Main ugc adminCreateChannel \
    --namespace "$AB_NAMESPACE" \
    --body '{"id": "aUTOOOg3", "name": "dQ2GRTsJ"}' \
    > test.out 2>&1
eval_tap $? 3 'AdminCreateChannel' test.out

#- 4 SingleAdminUpdateChannel
./ng net.accelbyte.sdk.cli.Main ugc singleAdminUpdateChannel \
    --channelId '6SlpNX26' \
    --namespace "$AB_NAMESPACE" \
    --body '{"name": "Lw7mtcL8"}' \
    > test.out 2>&1
eval_tap $? 4 'SingleAdminUpdateChannel' test.out

#- 5 SingleAdminDeleteChannel
./ng net.accelbyte.sdk.cli.Main ugc singleAdminDeleteChannel \
    --channelId 'YljOPC65' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 5 'SingleAdminDeleteChannel' test.out

#- 6 AdminUploadContentDirect
eval_tap 0 6 'AdminUploadContentDirect # SKIP deprecated' test.out

#- 7 AdminUploadContentS3
./ng net.accelbyte.sdk.cli.Main ugc adminUploadContentS3 \
    --channelId 'Da4TjweJ' \
    --namespace "$AB_NAMESPACE" \
    --body '{"contentType": "pKUq2B1O", "customAttributes": {"PQZnklcW": {}, "RRjfD1iI": {}, "rKIpmsnG": {}}, "fileExtension": "pU4koUBT", "name": "XDEhkkiK", "preview": "bmiAEXTi", "previewMetadata": {"previewContentType": "CXzvkwwh", "previewFileExtension": "vGS2vKor"}, "shareCode": "B9WnepKc", "subType": "jRbd53A5", "tags": ["9VuswfSd", "4g55F7yB", "rybeHDiG"], "type": "ccdFQ4Yb"}' \
    > test.out 2>&1
eval_tap $? 7 'AdminUploadContentS3' test.out

#- 8 SingleAdminUpdateContentS3
./ng net.accelbyte.sdk.cli.Main ugc singleAdminUpdateContentS3 \
    --channelId 'uUrqyaOA' \
    --contentId '22PXuuIl' \
    --namespace "$AB_NAMESPACE" \
    --body '{"contentType": "vhWb7Q7h", "customAttributes": {"DiQTARge": {}, "G1COk9AM": {}, "60KMI7fP": {}}, "fileExtension": "9uMWCMv7", "name": "VsgaSx1s", "payload": "TAip6px2", "preview": "eRcfOBgB", "previewMetadata": {"previewContentType": "KSPNRnz1", "previewFileExtension": "r5e5lsqi"}, "shareCode": "yx5vQpcO", "subType": "IS7a4FV3", "tags": ["8c4FNPP3", "0kTSz9yx", "ACkrCYHG"], "type": "cfjmejo9", "updateContentFile": false}' \
    > test.out 2>&1
eval_tap $? 8 'SingleAdminUpdateContentS3' test.out

#- 9 AdminSearchChannelSpecificContent
./ng net.accelbyte.sdk.cli.Main ugc adminSearchChannelSpecificContent \
    --channelId 'PJyd6VTz' \
    --namespace "$AB_NAMESPACE" \
    --creator 'jivyhvUk' \
    --ishidden 'XUmBUwtH' \
    --isofficial 'e00LZDZg' \
    --limit '58' \
    --name 'ijltnBGt' \
    --offset '97' \
    --orderby '9OlslX1L' \
    --sortby 'kCOVb1bP' \
    --subtype 'iMdFG35M' \
    --tags '5mBU3sQp,wfrHX4TH,5gwD6mA3' \
    --type 'nZcnSZ30' \
    --userId 'bpG7psD6' \
    > test.out 2>&1
eval_tap $? 9 'AdminSearchChannelSpecificContent' test.out

#- 10 SingleAdminUpdateContentDirect
eval_tap 0 10 'SingleAdminUpdateContentDirect # SKIP deprecated' test.out

#- 11 SingleAdminDeleteContent
./ng net.accelbyte.sdk.cli.Main ugc singleAdminDeleteContent \
    --channelId 'H6qNBDvj' \
    --contentId 'eZkYLr5m' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 11 'SingleAdminDeleteContent' test.out

#- 12 SingleAdminGetContent
./ng net.accelbyte.sdk.cli.Main ugc singleAdminGetContent \
    --namespace "$AB_NAMESPACE" \
    --limit '96' \
    --offset '66' \
    > test.out 2>&1
eval_tap $? 12 'SingleAdminGetContent' test.out

#- 13 AdminGetContentBulk
./ng net.accelbyte.sdk.cli.Main ugc adminGetContentBulk \
    --namespace "$AB_NAMESPACE" \
    --body '{"contentIds": ["Z7vpvqee", "fMSMaXcX", "ztFOK8fG"]}' \
    > test.out 2>&1
eval_tap $? 13 'AdminGetContentBulk' test.out

#- 14 AdminSearchContent
./ng net.accelbyte.sdk.cli.Main ugc adminSearchContent \
    --namespace "$AB_NAMESPACE" \
    --creator 'mvzMdP3y' \
    --ishidden '6y4coCQG' \
    --isofficial 'hhQ4cGPy' \
    --limit '58' \
    --name '2DeV4AL6' \
    --offset '74' \
    --orderby 'fru7iS3m' \
    --sortby 'kpM6Dc1p' \
    --subtype 'PHS4be9p' \
    --tags 'S6RKnVhh,WHpxva5A,TbJVhVNc' \
    --type 'zZZycoms' \
    --userId 'h3igeGN0' \
    > test.out 2>&1
eval_tap $? 14 'AdminSearchContent' test.out

#- 15 AdminGetContentBulkByShareCodes
./ng net.accelbyte.sdk.cli.Main ugc adminGetContentBulkByShareCodes \
    --namespace "$AB_NAMESPACE" \
    --body '{"shareCodes": ["RaSfpVuR", "GJkep2lw", "zwk0NW1I"]}' \
    > test.out 2>&1
eval_tap $? 15 'AdminGetContentBulkByShareCodes' test.out

#- 16 AdminGetUserContentByShareCode
./ng net.accelbyte.sdk.cli.Main ugc adminGetUserContentByShareCode \
    --namespace "$AB_NAMESPACE" \
    --shareCode 'qtMpx8wq' \
    > test.out 2>&1
eval_tap $? 16 'AdminGetUserContentByShareCode' test.out

#- 17 AdminGetSpecificContent
./ng net.accelbyte.sdk.cli.Main ugc adminGetSpecificContent \
    --contentId 'l39KCF4V' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 17 'AdminGetSpecificContent' test.out

#- 18 AdminDownloadContentPreview
./ng net.accelbyte.sdk.cli.Main ugc adminDownloadContentPreview \
    --contentId 'GJjtfigv' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 18 'AdminDownloadContentPreview' test.out

#- 19 RollbackContentVersion
./ng net.accelbyte.sdk.cli.Main ugc rollbackContentVersion \
    --contentId 'p0D5hIV1' \
    --namespace "$AB_NAMESPACE" \
    --versionId 'Fj88Cfmd' \
    > test.out 2>&1
eval_tap $? 19 'RollbackContentVersion' test.out

#- 20 AdminUpdateScreenshots
./ng net.accelbyte.sdk.cli.Main ugc adminUpdateScreenshots \
    --contentId 'ujsKEh48' \
    --namespace "$AB_NAMESPACE" \
    --body '{"screenshots": [{"description": "nSvA2YL0", "screenshotId": "YoXZQwBN"}, {"description": "lsyT3dag", "screenshotId": "qdvQ36JF"}, {"description": "oSqHBLgo", "screenshotId": "iXEroqo9"}]}' \
    > test.out 2>&1
eval_tap $? 20 'AdminUpdateScreenshots' test.out

#- 21 AdminUploadContentScreenshot
./ng net.accelbyte.sdk.cli.Main ugc adminUploadContentScreenshot \
    --contentId 'wsErZ6fF' \
    --namespace "$AB_NAMESPACE" \
    --body '{"screenshots": [{"contentType": "J65GpeOF", "description": "GUUanKBc", "fileExtension": "jfif"}, {"contentType": "F6jtj1MU", "description": "PN7bXQBZ", "fileExtension": "jpg"}, {"contentType": "3CZXzJdJ", "description": "kh0sJ3vP", "fileExtension": "jfif"}]}' \
    > test.out 2>&1
eval_tap $? 21 'AdminUploadContentScreenshot' test.out

#- 22 AdminDeleteContentScreenshot
./ng net.accelbyte.sdk.cli.Main ugc adminDeleteContentScreenshot \
    --contentId 'DN7sbrcB' \
    --namespace "$AB_NAMESPACE" \
    --screenshotId 'cldzUhXI' \
    > test.out 2>&1
eval_tap $? 22 'AdminDeleteContentScreenshot' test.out

#- 23 ListContentVersions
./ng net.accelbyte.sdk.cli.Main ugc listContentVersions \
    --contentId 'owUKUDtw' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 23 'ListContentVersions' test.out

#- 24 SingleAdminGetAllGroups
./ng net.accelbyte.sdk.cli.Main ugc singleAdminGetAllGroups \
    --namespace "$AB_NAMESPACE" \
    --limit '24' \
    --offset '94' \
    > test.out 2>&1
eval_tap $? 24 'SingleAdminGetAllGroups' test.out

#- 25 AdminCreateGroup
./ng net.accelbyte.sdk.cli.Main ugc adminCreateGroup \
    --namespace "$AB_NAMESPACE" \
    --body '{"contents": ["u1SI10zA", "A62vI91j", "nYBUvL1t"], "name": "CNYGXoKJ"}' \
    > test.out 2>&1
eval_tap $? 25 'AdminCreateGroup' test.out

#- 26 SingleAdminGetGroup
./ng net.accelbyte.sdk.cli.Main ugc singleAdminGetGroup \
    --groupId 'ti1z69Uz' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 26 'SingleAdminGetGroup' test.out

#- 27 SingleAdminUpdateGroup
./ng net.accelbyte.sdk.cli.Main ugc singleAdminUpdateGroup \
    --groupId 'z22hTHT9' \
    --namespace "$AB_NAMESPACE" \
    --body '{"contents": ["16qQJkFn", "poCQFPlE", "gJAwV1IQ"], "name": "ltmrYwpv"}' \
    > test.out 2>&1
eval_tap $? 27 'SingleAdminUpdateGroup' test.out

#- 28 SingleAdminDeleteGroup
./ng net.accelbyte.sdk.cli.Main ugc singleAdminDeleteGroup \
    --groupId 'wGXxQ9DC' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 28 'SingleAdminDeleteGroup' test.out

#- 29 SingleAdminGetGroupContents
./ng net.accelbyte.sdk.cli.Main ugc singleAdminGetGroupContents \
    --groupId 'Q2z1X5KI' \
    --namespace "$AB_NAMESPACE" \
    --limit '86' \
    --offset '33' \
    > test.out 2>&1
eval_tap $? 29 'SingleAdminGetGroupContents' test.out

#- 30 AdminGetTag
./ng net.accelbyte.sdk.cli.Main ugc adminGetTag \
    --namespace "$AB_NAMESPACE" \
    --limit '3' \
    --offset '100' \
    > test.out 2>&1
eval_tap $? 30 'AdminGetTag' test.out

#- 31 AdminCreateTag
./ng net.accelbyte.sdk.cli.Main ugc adminCreateTag \
    --namespace "$AB_NAMESPACE" \
    --body '{"tag": "P3YuyyAK"}' \
    > test.out 2>&1
eval_tap $? 31 'AdminCreateTag' test.out

#- 32 AdminUpdateTag
./ng net.accelbyte.sdk.cli.Main ugc adminUpdateTag \
    --namespace "$AB_NAMESPACE" \
    --tagId 'I50qSstE' \
    --body '{"tag": "EDQfR7FG"}' \
    > test.out 2>&1
eval_tap $? 32 'AdminUpdateTag' test.out

#- 33 AdminDeleteTag
./ng net.accelbyte.sdk.cli.Main ugc adminDeleteTag \
    --namespace "$AB_NAMESPACE" \
    --tagId 'HoTMW8K8' \
    > test.out 2>&1
eval_tap $? 33 'AdminDeleteTag' test.out

#- 34 AdminGetType
./ng net.accelbyte.sdk.cli.Main ugc adminGetType \
    --namespace "$AB_NAMESPACE" \
    --limit '86' \
    --offset '77' \
    > test.out 2>&1
eval_tap $? 34 'AdminGetType' test.out

#- 35 AdminCreateType
./ng net.accelbyte.sdk.cli.Main ugc adminCreateType \
    --namespace "$AB_NAMESPACE" \
    --body '{"subtype": ["LCc9Peny", "j6kzgQcg", "AInF2ciW"], "type": "gMUSXczx"}' \
    > test.out 2>&1
eval_tap $? 35 'AdminCreateType' test.out

#- 36 AdminUpdateType
./ng net.accelbyte.sdk.cli.Main ugc adminUpdateType \
    --namespace "$AB_NAMESPACE" \
    --typeId 'Nc3XPcwy' \
    --body '{"subtype": ["zW4vy4fh", "GiAZxiuR", "4m6ohlWf"], "type": "76AvIsLt"}' \
    > test.out 2>&1
eval_tap $? 36 'AdminUpdateType' test.out

#- 37 AdminDeleteType
./ng net.accelbyte.sdk.cli.Main ugc adminDeleteType \
    --namespace "$AB_NAMESPACE" \
    --typeId 'f9Sl6S88' \
    > test.out 2>&1
eval_tap $? 37 'AdminDeleteType' test.out

#- 38 AdminGetChannel
./ng net.accelbyte.sdk.cli.Main ugc adminGetChannel \
    --namespace "$AB_NAMESPACE" \
    --userId 'uXD9cpBZ' \
    --limit '44' \
    --name '8zHVDLJD' \
    --offset '47' \
    > test.out 2>&1
eval_tap $? 38 'AdminGetChannel' test.out

#- 39 AdminDeleteAllUserChannels
./ng net.accelbyte.sdk.cli.Main ugc adminDeleteAllUserChannels \
    --namespace "$AB_NAMESPACE" \
    --userId 'Fv6SAZgY' \
    > test.out 2>&1
eval_tap $? 39 'AdminDeleteAllUserChannels' test.out

#- 40 AdminUpdateChannel
./ng net.accelbyte.sdk.cli.Main ugc adminUpdateChannel \
    --channelId 'Y31d7LzQ' \
    --namespace "$AB_NAMESPACE" \
    --userId 'WGljxgUD' \
    --body '{"name": "JuOxYkKu"}' \
    > test.out 2>&1
eval_tap $? 40 'AdminUpdateChannel' test.out

#- 41 AdminDeleteChannel
./ng net.accelbyte.sdk.cli.Main ugc adminDeleteChannel \
    --channelId 'A3K3ENiN' \
    --namespace "$AB_NAMESPACE" \
    --userId 'sNaZI2TP' \
    > test.out 2>&1
eval_tap $? 41 'AdminDeleteChannel' test.out

#- 42 AdminUpdateContentS3ByShareCode
./ng net.accelbyte.sdk.cli.Main ugc adminUpdateContentS3ByShareCode \
    --channelId '4OFQtlT6' \
    --namespace "$AB_NAMESPACE" \
    --shareCode 'qkFPSF7L' \
    --userId 'f3z0WOO2' \
    --body '{"contentType": "XTHxB2Xl", "customAttributes": {"SZJQvPnW": {}, "iOyHMNmR": {}, "i0vV4CcR": {}}, "fileExtension": "XaxK2Jul", "name": "nWlPyyej", "payload": "nanNOElk", "preview": "rDgpxtlv", "previewMetadata": {"previewContentType": "lp7pMLDs", "previewFileExtension": "zfLHNVFk"}, "shareCode": "pyhq27vI", "subType": "uzHLeP71", "tags": ["geh4DKac", "7N2sTduR", "Vqj6ZUmZ"], "type": "oTTUEuKc", "updateContentFile": false}' \
    > test.out 2>&1
eval_tap $? 42 'AdminUpdateContentS3ByShareCode' test.out

#- 43 AdminUpdateContentS3
./ng net.accelbyte.sdk.cli.Main ugc adminUpdateContentS3 \
    --channelId 'fUrwuVGk' \
    --contentId '64WQBMSD' \
    --namespace "$AB_NAMESPACE" \
    --userId 'aYJcU9Lf' \
    --body '{"contentType": "wXsGKGBP", "customAttributes": {"QHACzbYT": {}, "FZFCFx95": {}, "v43Ukzn1": {}}, "fileExtension": "jHH0LBb6", "name": "RPPbxpbL", "payload": "Q9pfRlnt", "preview": "6rrWIwdi", "previewMetadata": {"previewContentType": "ylQ3vobG", "previewFileExtension": "VXULNhxK"}, "shareCode": "eAOM9Zh2", "subType": "sRE3pqWs", "tags": ["6AAdDpra", "euJmxSrF", "oEA1fAgJ"], "type": "pcARYPay", "updateContentFile": false}' \
    > test.out 2>&1
eval_tap $? 43 'AdminUpdateContentS3' test.out

#- 44 DeleteContentByShareCode
./ng net.accelbyte.sdk.cli.Main ugc deleteContentByShareCode \
    --channelId 'vn3CLQ1e' \
    --namespace "$AB_NAMESPACE" \
    --shareCode 'yx1dxcye' \
    --userId 'Crfl4T0r' \
    > test.out 2>&1
eval_tap $? 44 'DeleteContentByShareCode' test.out

#- 45 AdminUpdateContentDirect
eval_tap 0 45 'AdminUpdateContentDirect # SKIP deprecated' test.out

#- 46 AdminDeleteContent
./ng net.accelbyte.sdk.cli.Main ugc adminDeleteContent \
    --channelId 'bK9BaKGh' \
    --contentId 'tVmrd1PN' \
    --namespace "$AB_NAMESPACE" \
    --userId 'vMxMgv1C' \
    > test.out 2>&1
eval_tap $? 46 'AdminDeleteContent' test.out

#- 47 AdminGetContent
./ng net.accelbyte.sdk.cli.Main ugc adminGetContent \
    --namespace "$AB_NAMESPACE" \
    --userId 'RyTO88AS' \
    --limit '59' \
    --offset '21' \
    > test.out 2>&1
eval_tap $? 47 'AdminGetContent' test.out

#- 48 AdminDeleteAllUserContents
./ng net.accelbyte.sdk.cli.Main ugc adminDeleteAllUserContents \
    --namespace "$AB_NAMESPACE" \
    --userId '16PBkEGl' \
    > test.out 2>&1
eval_tap $? 48 'AdminDeleteAllUserContents' test.out

#- 49 AdminHideUserContent
./ng net.accelbyte.sdk.cli.Main ugc adminHideUserContent \
    --contentId 'on7QAy3b' \
    --namespace "$AB_NAMESPACE" \
    --userId 'k6ACj5tv' \
    --body '{"isHidden": false}' \
    > test.out 2>&1
eval_tap $? 49 'AdminHideUserContent' test.out

#- 50 AdminGetAllGroups
./ng net.accelbyte.sdk.cli.Main ugc adminGetAllGroups \
    --namespace "$AB_NAMESPACE" \
    --userId 'JqsFrSJZ' \
    --limit '51' \
    --offset '38' \
    > test.out 2>&1
eval_tap $? 50 'AdminGetAllGroups' test.out

#- 51 AdminDeleteAllUserGroup
./ng net.accelbyte.sdk.cli.Main ugc adminDeleteAllUserGroup \
    --namespace "$AB_NAMESPACE" \
    --userId 'NtHFdGSK' \
    > test.out 2>&1
eval_tap $? 51 'AdminDeleteAllUserGroup' test.out

#- 52 AdminGetGroup
./ng net.accelbyte.sdk.cli.Main ugc adminGetGroup \
    --groupId 'LYfJzUFi' \
    --namespace "$AB_NAMESPACE" \
    --userId '8AJSYqZc' \
    > test.out 2>&1
eval_tap $? 52 'AdminGetGroup' test.out

#- 53 AdminUpdateGroup
./ng net.accelbyte.sdk.cli.Main ugc adminUpdateGroup \
    --groupId 'EgoezSom' \
    --namespace "$AB_NAMESPACE" \
    --userId 'TKxFnYlg' \
    --body '{"contents": ["RoxLOZ7G", "3WPSoVDz", "Vs4CspxY"], "name": "pEk1Peyq"}' \
    > test.out 2>&1
eval_tap $? 53 'AdminUpdateGroup' test.out

#- 54 AdminDeleteGroup
./ng net.accelbyte.sdk.cli.Main ugc adminDeleteGroup \
    --groupId 'n6zpl8QO' \
    --namespace "$AB_NAMESPACE" \
    --userId 'MVw8NfML' \
    > test.out 2>&1
eval_tap $? 54 'AdminDeleteGroup' test.out

#- 55 AdminGetGroupContents
./ng net.accelbyte.sdk.cli.Main ugc adminGetGroupContents \
    --groupId 'GZ2ljcGG' \
    --namespace "$AB_NAMESPACE" \
    --userId 'jezIuMnW' \
    --limit '57' \
    --offset '20' \
    > test.out 2>&1
eval_tap $? 55 'AdminGetGroupContents' test.out

#- 56 AdminDeleteAllUserStates
./ng net.accelbyte.sdk.cli.Main ugc adminDeleteAllUserStates \
    --namespace "$AB_NAMESPACE" \
    --userId 'vnpDmIU2' \
    > test.out 2>&1
eval_tap $? 56 'AdminDeleteAllUserStates' test.out

#- 57 SearchChannelSpecificContent
./ng net.accelbyte.sdk.cli.Main ugc searchChannelSpecificContent \
    --channelId '0TpAHAqC' \
    --namespace "$AB_NAMESPACE" \
    --creator 'Lj0QPDAi' \
    --ishidden 'iNtX1nIh' \
    --isofficial 'vSq5aYIV' \
    --limit '88' \
    --name 'eqmuGkzr' \
    --offset '79' \
    --orderby 'JmuIKJQN' \
    --sortby 'xgM8h2pc' \
    --subtype '7qndXwOW' \
    --tags 'jii0pCwQ,EoXx44IS,WRudte8T' \
    --type 'mxDcuNi2' \
    --userId 'UXRSHN1E' \
    > test.out 2>&1
eval_tap $? 57 'SearchChannelSpecificContent' test.out

#- 58 PublicSearchContent
./ng net.accelbyte.sdk.cli.Main ugc publicSearchContent \
    --namespace "$AB_NAMESPACE" \
    --creator 'CvHv5lNj' \
    --ishidden 'OjfwvEjv' \
    --isofficial 'qBlLqdGD' \
    --limit '96' \
    --name 'ctPoycKm' \
    --offset '95' \
    --orderby 'aVkiFTXL' \
    --sortby 'rQ97lYDn' \
    --subtype 'qWLE9G4U' \
    --tags '7HC7AlIN,7ggZvwDk,0K0oUQ0i' \
    --type 'XFNVLzWr' \
    --userId 'Rj2NCwuL' \
    > test.out 2>&1
eval_tap $? 58 'PublicSearchContent' test.out

#- 59 PublicGetContentBulk
./ng net.accelbyte.sdk.cli.Main ugc publicGetContentBulk \
    --namespace "$AB_NAMESPACE" \
    --body '{"contentIds": ["BkZ51us5", "c8YzM0Mr", "8IckqIg4"]}' \
    > test.out 2>&1
eval_tap $? 59 'PublicGetContentBulk' test.out

#- 60 GetFollowedContent
./ng net.accelbyte.sdk.cli.Main ugc getFollowedContent \
    --namespace "$AB_NAMESPACE" \
    --limit '88' \
    --offset '97' \
    > test.out 2>&1
eval_tap $? 60 'GetFollowedContent' test.out

#- 61 GetLikedContent
./ng net.accelbyte.sdk.cli.Main ugc getLikedContent \
    --namespace "$AB_NAMESPACE" \
    --isofficial  \
    --limit '99' \
    --name '6WvyHRes' \
    --offset '5' \
    --orderby 'aaVggQvb' \
    --sortby 'JenQFDHi' \
    --subtype 'kDr1vKUI' \
    --tags 'uaUKtr6J,uhWHejRR,kvKn7Efr' \
    --type 'jQDYkZ0j' \
    > test.out 2>&1
eval_tap $? 61 'GetLikedContent' test.out

#- 62 PublicGetContentBulkByShareCodes
./ng net.accelbyte.sdk.cli.Main ugc publicGetContentBulkByShareCodes \
    --namespace "$AB_NAMESPACE" \
    --body '{"shareCodes": ["sEXlTO3x", "rxsv4Hbl", "PjMmb8bQ"]}' \
    > test.out 2>&1
eval_tap $? 62 'PublicGetContentBulkByShareCodes' test.out

#- 63 PublicDownloadContentByShareCode
./ng net.accelbyte.sdk.cli.Main ugc publicDownloadContentByShareCode \
    --namespace "$AB_NAMESPACE" \
    --shareCode 'XGin5kCw' \
    > test.out 2>&1
eval_tap $? 63 'PublicDownloadContentByShareCode' test.out

#- 64 PublicDownloadContentByContentID
./ng net.accelbyte.sdk.cli.Main ugc publicDownloadContentByContentID \
    --contentId 'KE5ESjyJ' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 64 'PublicDownloadContentByContentID' test.out

#- 65 AddDownloadCount
./ng net.accelbyte.sdk.cli.Main ugc addDownloadCount \
    --contentId '7mVGD5ha' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 65 'AddDownloadCount' test.out

#- 66 UpdateContentLikeStatus
./ng net.accelbyte.sdk.cli.Main ugc updateContentLikeStatus \
    --contentId 'B531NvBI' \
    --namespace "$AB_NAMESPACE" \
    --body '{"likeStatus": false}' \
    > test.out 2>&1
eval_tap $? 66 'UpdateContentLikeStatus' test.out

#- 67 PublicDownloadContentPreview
./ng net.accelbyte.sdk.cli.Main ugc publicDownloadContentPreview \
    --contentId 'GbhanCmf' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 67 'PublicDownloadContentPreview' test.out

#- 68 GetTag
./ng net.accelbyte.sdk.cli.Main ugc getTag \
    --namespace "$AB_NAMESPACE" \
    --limit '53' \
    --offset '58' \
    > test.out 2>&1
eval_tap $? 68 'GetTag' test.out

#- 69 GetType
./ng net.accelbyte.sdk.cli.Main ugc getType \
    --namespace "$AB_NAMESPACE" \
    --limit '3' \
    --offset '10' \
    > test.out 2>&1
eval_tap $? 69 'GetType' test.out

#- 70 PublicSearchCreator
./ng net.accelbyte.sdk.cli.Main ugc publicSearchCreator \
    --namespace "$AB_NAMESPACE" \
    --limit '74' \
    --offset '37' \
    --orderby 'XBdTkToO' \
    --sortby '8UssnC4i' \
    > test.out 2>&1
eval_tap $? 70 'PublicSearchCreator' test.out

#- 71 GetFollowedUsers
./ng net.accelbyte.sdk.cli.Main ugc getFollowedUsers \
    --namespace "$AB_NAMESPACE" \
    --limit '27' \
    --offset '58' \
    > test.out 2>&1
eval_tap $? 71 'GetFollowedUsers' test.out

#- 72 PublicGetCreator
./ng net.accelbyte.sdk.cli.Main ugc publicGetCreator \
    --namespace "$AB_NAMESPACE" \
    --userId 'PLqINKAi' \
    > test.out 2>&1
eval_tap $? 72 'PublicGetCreator' test.out

#- 73 GetChannels
./ng net.accelbyte.sdk.cli.Main ugc getChannels \
    --namespace "$AB_NAMESPACE" \
    --userId 'W5P1zwlC' \
    --limit '6' \
    --name 'pJomzHxp' \
    --offset '21' \
    > test.out 2>&1
eval_tap $? 73 'GetChannels' test.out

#- 74 PublicCreateChannel
./ng net.accelbyte.sdk.cli.Main ugc publicCreateChannel \
    --namespace "$AB_NAMESPACE" \
    --userId 'CnT1GdMv' \
    --body '{"name": "IauoTybN"}' \
    > test.out 2>&1
eval_tap $? 74 'PublicCreateChannel' test.out

#- 75 DeleteAllUserChannel
./ng net.accelbyte.sdk.cli.Main ugc deleteAllUserChannel \
    --namespace "$AB_NAMESPACE" \
    --userId '2FTZrXaz' \
    > test.out 2>&1
eval_tap $? 75 'DeleteAllUserChannel' test.out

#- 76 UpdateChannel
./ng net.accelbyte.sdk.cli.Main ugc updateChannel \
    --channelId 'h06k8ncU' \
    --namespace "$AB_NAMESPACE" \
    --userId 'b9NUmOej' \
    --body '{"name": "dlhrtsT3"}' \
    > test.out 2>&1
eval_tap $? 76 'UpdateChannel' test.out

#- 77 DeleteChannel
./ng net.accelbyte.sdk.cli.Main ugc deleteChannel \
    --channelId 'Ek0aL6o2' \
    --namespace "$AB_NAMESPACE" \
    --userId 'ZiVdX6Lb' \
    > test.out 2>&1
eval_tap $? 77 'DeleteChannel' test.out

#- 78 CreateContentDirect
eval_tap 0 78 'CreateContentDirect # SKIP deprecated' test.out

#- 79 CreateContentS3
./ng net.accelbyte.sdk.cli.Main ugc createContentS3 \
    --channelId 'uky4FOxF' \
    --namespace "$AB_NAMESPACE" \
    --userId 'TC4l7MIx' \
    --body '{"contentType": "rIpEt6lp", "customAttributes": {"keD4Qbgk": {}, "tJ8koIZG": {}, "BdvcfTfx": {}}, "fileExtension": "upaOYlAn", "name": "eJPtiwFn", "preview": "MZm2pAf3", "previewMetadata": {"previewContentType": "goxiqstX", "previewFileExtension": "x4AvkZvU"}, "subType": "VLegVxrt", "tags": ["tnQBhd9G", "xnLl6XcH", "UkuVFBUg"], "type": "XZHKyv1W"}' \
    > test.out 2>&1
eval_tap $? 79 'CreateContentS3' test.out

#- 80 PublicUpdateContentByShareCode
./ng net.accelbyte.sdk.cli.Main ugc publicUpdateContentByShareCode \
    --channelId 'RaaUXHgc' \
    --namespace "$AB_NAMESPACE" \
    --shareCode 'SYEk5xno' \
    --userId 'i3EZvPbe' \
    --body '{"contentType": "hGTEyGGL", "customAttributes": {"EipQYimI": {}, "3JcpNe5H": {}, "pepc3NQn": {}}, "fileExtension": "xu3glb5h", "name": "gEEyt0Pe", "payload": "WgrjznTg", "preview": "kM7hz2mg", "previewMetadata": {"previewContentType": "WS2RUPrm", "previewFileExtension": "KBv1FvGE"}, "subType": "oFBd1PJH", "tags": ["6T8EiBkP", "me7OhwJc", "CSkpi5XG"], "type": "CJ15EJVw", "updateContentFile": true}' \
    > test.out 2>&1
eval_tap $? 80 'PublicUpdateContentByShareCode' test.out

#- 81 UpdateContentS3
./ng net.accelbyte.sdk.cli.Main ugc updateContentS3 \
    --channelId 'mpuxdOBc' \
    --contentId 'ytcYhlY7' \
    --namespace "$AB_NAMESPACE" \
    --userId '2FHzdV4J' \
    --body '{"contentType": "JuWMFfFZ", "customAttributes": {"gzcBlkDM": {}, "Te1OuoXF": {}, "oNjSsTB7": {}}, "fileExtension": "eod5HdTt", "name": "BvIqkNit", "payload": "pazAeGTu", "preview": "St6275n3", "previewMetadata": {"previewContentType": "cgOLLaUw", "previewFileExtension": "jTGzXF1T"}, "subType": "5LIJ2unE", "tags": ["EOs5UF28", "6lGvvr43", "grFpiH6o"], "type": "hehTJHqA", "updateContentFile": true}' \
    > test.out 2>&1
eval_tap $? 81 'UpdateContentS3' test.out

#- 82 PublicDeleteContentByShareCode
./ng net.accelbyte.sdk.cli.Main ugc publicDeleteContentByShareCode \
    --channelId 'lTmEZKGG' \
    --namespace "$AB_NAMESPACE" \
    --shareCode 'TySxRlwO' \
    --userId 'MdimERxF' \
    > test.out 2>&1
eval_tap $? 82 'PublicDeleteContentByShareCode' test.out

#- 83 UpdateContentDirect
eval_tap 0 83 'UpdateContentDirect # SKIP deprecated' test.out

#- 84 DeleteContent
./ng net.accelbyte.sdk.cli.Main ugc deleteContent \
    --channelId 'ParaDHzQ' \
    --contentId '7nvevnCY' \
    --namespace "$AB_NAMESPACE" \
    --userId '9g6gRQy7' \
    > test.out 2>&1
eval_tap $? 84 'DeleteContent' test.out

#- 85 UpdateContentShareCode
./ng net.accelbyte.sdk.cli.Main ugc updateContentShareCode \
    --channelId 'Ly5KS6eO' \
    --contentId 'KLzN54Ki' \
    --namespace "$AB_NAMESPACE" \
    --userId 'C1h5XvMA' \
    --body '{"shareCode": "8AGWxxaw"}' \
    > test.out 2>&1
eval_tap $? 85 'UpdateContentShareCode' test.out

#- 86 PublicGetUserContent
./ng net.accelbyte.sdk.cli.Main ugc publicGetUserContent \
    --namespace "$AB_NAMESPACE" \
    --userId 'gjSpIk1w' \
    --limit '23' \
    --offset '75' \
    > test.out 2>&1
eval_tap $? 86 'PublicGetUserContent' test.out

#- 87 DeleteAllUserContents
./ng net.accelbyte.sdk.cli.Main ugc deleteAllUserContents \
    --namespace "$AB_NAMESPACE" \
    --userId 'D744HP9w' \
    > test.out 2>&1
eval_tap $? 87 'DeleteAllUserContents' test.out

#- 88 UpdateScreenshots
./ng net.accelbyte.sdk.cli.Main ugc updateScreenshots \
    --contentId 'LZAF1PXg' \
    --namespace "$AB_NAMESPACE" \
    --userId 'I7xlroHh' \
    --body '{"screenshots": [{"description": "MOCCloEr", "screenshotId": "wOU3Hp0y"}, {"description": "m6q4WQrd", "screenshotId": "SPO06Jm5"}, {"description": "7upgRryO", "screenshotId": "0nKVN8AA"}]}' \
    > test.out 2>&1
eval_tap $? 88 'UpdateScreenshots' test.out

#- 89 UploadContentScreenshot
./ng net.accelbyte.sdk.cli.Main ugc uploadContentScreenshot \
    --contentId 'Bp8ASF2X' \
    --namespace "$AB_NAMESPACE" \
    --userId '6EYzDE6k' \
    --body '{"screenshots": [{"contentType": "du2ffmTA", "description": "WBwsTYrF", "fileExtension": "pjp"}, {"contentType": "oeeo93qQ", "description": "EuEXyB7d", "fileExtension": "jfif"}, {"contentType": "tzWDuHYF", "description": "QRPudAUy", "fileExtension": "png"}]}' \
    > test.out 2>&1
eval_tap $? 89 'UploadContentScreenshot' test.out

#- 90 DeleteContentScreenshot
./ng net.accelbyte.sdk.cli.Main ugc deleteContentScreenshot \
    --contentId 'pK3Ix9Jf' \
    --namespace "$AB_NAMESPACE" \
    --screenshotId '7s5Om4gm' \
    --userId 'JVFirM5W' \
    > test.out 2>&1
eval_tap $? 90 'DeleteContentScreenshot' test.out

#- 91 UpdateUserFollowStatus
./ng net.accelbyte.sdk.cli.Main ugc updateUserFollowStatus \
    --namespace "$AB_NAMESPACE" \
    --userId 'Dp5XtkAE' \
    --body '{"followStatus": false}' \
    > test.out 2>&1
eval_tap $? 91 'UpdateUserFollowStatus' test.out

#- 92 GetPublicFollowers
./ng net.accelbyte.sdk.cli.Main ugc getPublicFollowers \
    --namespace "$AB_NAMESPACE" \
    --userId 'v2GN9fyQ' \
    --limit '87' \
    --offset '61' \
    > test.out 2>&1
eval_tap $? 92 'GetPublicFollowers' test.out

#- 93 GetPublicFollowing
./ng net.accelbyte.sdk.cli.Main ugc getPublicFollowing \
    --namespace "$AB_NAMESPACE" \
    --userId 'zhy55Dpd' \
    --limit '77' \
    --offset '29' \
    > test.out 2>&1
eval_tap $? 93 'GetPublicFollowing' test.out

#- 94 GetGroups
./ng net.accelbyte.sdk.cli.Main ugc getGroups \
    --namespace "$AB_NAMESPACE" \
    --userId 'IFNBvahd' \
    --limit '5' \
    --offset '39' \
    > test.out 2>&1
eval_tap $? 94 'GetGroups' test.out

#- 95 CreateGroup
./ng net.accelbyte.sdk.cli.Main ugc createGroup \
    --namespace "$AB_NAMESPACE" \
    --userId 'xvF6ObcA' \
    --body '{"contents": ["FolcszeU", "Si3n9dPR", "yuFCT0Ot"], "name": "3DMY4F0R"}' \
    > test.out 2>&1
eval_tap $? 95 'CreateGroup' test.out

#- 96 DeleteAllUserGroup
./ng net.accelbyte.sdk.cli.Main ugc deleteAllUserGroup \
    --namespace "$AB_NAMESPACE" \
    --userId 'biOHU4GA' \
    > test.out 2>&1
eval_tap $? 96 'DeleteAllUserGroup' test.out

#- 97 GetGroup
./ng net.accelbyte.sdk.cli.Main ugc getGroup \
    --groupId 'HH2HEr3M' \
    --namespace "$AB_NAMESPACE" \
    --userId 'KwgshcC6' \
    > test.out 2>&1
eval_tap $? 97 'GetGroup' test.out

#- 98 UpdateGroup
./ng net.accelbyte.sdk.cli.Main ugc updateGroup \
    --groupId '7DLlbCoa' \
    --namespace "$AB_NAMESPACE" \
    --userId 'NZUIEH70' \
    --body '{"contents": ["m6gpMD6G", "gCdMuv0B", "wvGAdyMq"], "name": "iaDbrHAY"}' \
    > test.out 2>&1
eval_tap $? 98 'UpdateGroup' test.out

#- 99 DeleteGroup
./ng net.accelbyte.sdk.cli.Main ugc deleteGroup \
    --groupId 'fMhLZf59' \
    --namespace "$AB_NAMESPACE" \
    --userId 'IgKEEdZx' \
    > test.out 2>&1
eval_tap $? 99 'DeleteGroup' test.out

#- 100 GetGroupContent
./ng net.accelbyte.sdk.cli.Main ugc getGroupContent \
    --groupId 'TSZS9iME' \
    --namespace "$AB_NAMESPACE" \
    --userId 'DfXBs7DA' \
    --limit '16' \
    --offset '45' \
    > test.out 2>&1
eval_tap $? 100 'GetGroupContent' test.out

#- 101 DeleteAllUserStates
./ng net.accelbyte.sdk.cli.Main ugc deleteAllUserStates \
    --namespace "$AB_NAMESPACE" \
    --userId 'bDuK9aGh' \
    > test.out 2>&1
eval_tap $? 101 'DeleteAllUserStates' test.out

#- 102 AdminGetContentByChannelIDV2
./ng net.accelbyte.sdk.cli.Main ugc adminGetContentByChannelIDV2 \
    --channelId '2Jx3vZ42' \
    --namespace "$AB_NAMESPACE" \
    --limit '47' \
    --name 'U53JmV9s' \
    --offset '68' \
    --sortBy '25F0N8vL' \
    > test.out 2>&1
eval_tap $? 102 'AdminGetContentByChannelIDV2' test.out

#- 103 AdminCreateContentV2
./ng net.accelbyte.sdk.cli.Main ugc adminCreateContentV2 \
    --channelId '94DH0EO6' \
    --namespace "$AB_NAMESPACE" \
    --body '{"contentType": "JZN1ClbM", "customAttributes": {"XOvPgVs0": {}, "aSDFnuFL": {}, "Ku4jGA4w": {}}, "fileExtension": "LmodSunS", "name": "J38x6VyN", "shareCode": "nIiM0RYZ", "subType": "yyiS0jXd", "tags": ["2Tj3sq2M", "UYfGlj5L", "3QcHB1uP"], "type": "MCDuUkCp"}' \
    > test.out 2>&1
eval_tap $? 103 'AdminCreateContentV2' test.out

#- 104 AdminDeleteOfficialContentV2
./ng net.accelbyte.sdk.cli.Main ugc adminDeleteOfficialContentV2 \
    --channelId 'ZLQeFfey' \
    --contentId 'bbSAbuiz' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 104 'AdminDeleteOfficialContentV2' test.out

#- 105 AdminUpdateOfficialContentV2
./ng net.accelbyte.sdk.cli.Main ugc adminUpdateOfficialContentV2 \
    --channelId 'dCrrVmZ1' \
    --contentId '0KrisJ5L' \
    --namespace "$AB_NAMESPACE" \
    --body '{"customAttributes": {"nDumLjY6": {}, "az8ON5P3": {}, "FQ74vax4": {}}, "name": "tsfoF42j", "shareCode": "bxcavstj", "subType": "ew9dQpYO", "tags": ["Oi3q6DkQ", "UL9mHV6N", "vrvsSU4K"], "type": "cwUDSR0S"}' \
    > test.out 2>&1
eval_tap $? 105 'AdminUpdateOfficialContentV2' test.out

#- 106 AdminCopyContent
./ng net.accelbyte.sdk.cli.Main ugc adminCopyContent \
    --channelId 'FlxYqsKc' \
    --contentId 'GzwdmpFV' \
    --namespace "$AB_NAMESPACE" \
    --body '{"customAttributes": {"QdXDyGCX": {}, "IWcuySsE": {}, "QE0rTbpn": {}}, "name": "JVvIAcC6", "subType": "PrAYmLgq", "tags": ["c2ki55Cs", "pauTgPWN", "t9YjFj75"], "targetChannelId": "icp9BDIL", "type": "nkq5kW7n"}' \
    > test.out 2>&1
eval_tap $? 106 'AdminCopyContent' test.out

#- 107 AdminUpdateOfficialContentFileLocation
./ng net.accelbyte.sdk.cli.Main ugc adminUpdateOfficialContentFileLocation \
    --channelId 'uT3ZK4ZF' \
    --contentId 'NSGVB34t' \
    --namespace "$AB_NAMESPACE" \
    --body '{"fileExtension": "H1Vn0BxT", "fileLocation": "vdVGWnRy"}' \
    > test.out 2>&1
eval_tap $? 107 'AdminUpdateOfficialContentFileLocation' test.out

#- 108 AdminGenerateOfficialContentUploadURLV2
./ng net.accelbyte.sdk.cli.Main ugc adminGenerateOfficialContentUploadURLV2 \
    --channelId 'Y1bVbr7f' \
    --contentId 'a9OX5z7p' \
    --namespace "$AB_NAMESPACE" \
    --body '{"contentType": "CcL6KFYP", "fileExtension": "ucdrTlgJ"}' \
    > test.out 2>&1
eval_tap $? 108 'AdminGenerateOfficialContentUploadURLV2' test.out

#- 109 AdminGetConfigs
./ng net.accelbyte.sdk.cli.Main ugc adminGetConfigs \
    --namespace "$AB_NAMESPACE" \
    --limit '7' \
    --offset '65' \
    > test.out 2>&1
eval_tap $? 109 'AdminGetConfigs' test.out

#- 110 AdminUpdateConfig
./ng net.accelbyte.sdk.cli.Main ugc adminUpdateConfig \
    --key 'sYl5cst0' \
    --namespace "$AB_NAMESPACE" \
    --body '{"value": "nuXz1jg2"}' \
    > test.out 2>&1
eval_tap $? 110 'AdminUpdateConfig' test.out

#- 111 AdminListContentV2
./ng net.accelbyte.sdk.cli.Main ugc adminListContentV2 \
    --namespace "$AB_NAMESPACE" \
    --isOfficial  \
    --limit '27' \
    --name 'M9OoMARg' \
    --offset '73' \
    --sortBy 'Rnxy79cU' \
    --subType 'Fjjvrsvz' \
    --tags 'A0qaTw4h,7ueYKsaH,RK5Q4fOy' \
    --type 'tEBUDE3L' \
    > test.out 2>&1
eval_tap $? 111 'AdminListContentV2' test.out

#- 112 AdminBulkGetContentByIDsV2
./ng net.accelbyte.sdk.cli.Main ugc adminBulkGetContentByIDsV2 \
    --namespace "$AB_NAMESPACE" \
    --body '{"contentIds": ["pLpKzJA1", "5io60e45", "pJgdJN5h"]}' \
    > test.out 2>&1
eval_tap $? 112 'AdminBulkGetContentByIDsV2' test.out

#- 113 AdminGetContentBulkByShareCodesV2
./ng net.accelbyte.sdk.cli.Main ugc adminGetContentBulkByShareCodesV2 \
    --namespace "$AB_NAMESPACE" \
    --body '{"shareCodes": ["w3FRPxQz", "JAHCnYm9", "HBRq0nTV"]}' \
    > test.out 2>&1
eval_tap $? 113 'AdminGetContentBulkByShareCodesV2' test.out

#- 114 AdminGetContentByShareCodeV2
./ng net.accelbyte.sdk.cli.Main ugc adminGetContentByShareCodeV2 \
    --namespace "$AB_NAMESPACE" \
    --shareCode 'pq2gfRJ3' \
    > test.out 2>&1
eval_tap $? 114 'AdminGetContentByShareCodeV2' test.out

#- 115 AdminGetContentByContentIDV2
./ng net.accelbyte.sdk.cli.Main ugc adminGetContentByContentIDV2 \
    --contentId 'g4qMU24l' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 115 'AdminGetContentByContentIDV2' test.out

#- 116 RollbackContentVersionV2
./ng net.accelbyte.sdk.cli.Main ugc rollbackContentVersionV2 \
    --contentId 'O6MV0Mzq' \
    --namespace "$AB_NAMESPACE" \
    --versionId 'mcXzBoZL' \
    > test.out 2>&1
eval_tap $? 116 'RollbackContentVersionV2' test.out

#- 117 AdminUpdateScreenshotsV2
./ng net.accelbyte.sdk.cli.Main ugc adminUpdateScreenshotsV2 \
    --contentId 'ldai0G11' \
    --namespace "$AB_NAMESPACE" \
    --body '{"screenshots": [{"description": "lV1NeBy6", "screenshotId": "sFQJBRoe"}, {"description": "R95ax1vO", "screenshotId": "tNzZ6YAW"}, {"description": "cbGdDhdI", "screenshotId": "Ns8NSgFL"}]}' \
    > test.out 2>&1
eval_tap $? 117 'AdminUpdateScreenshotsV2' test.out

#- 118 AdminUploadContentScreenshotV2
./ng net.accelbyte.sdk.cli.Main ugc adminUploadContentScreenshotV2 \
    --contentId '4r7kGG7x' \
    --namespace "$AB_NAMESPACE" \
    --body '{"screenshots": [{"contentType": "tEUYO8x7", "description": "JXS6p5kH", "fileExtension": "bmp"}, {"contentType": "sUjtLlWf", "description": "X7nG1zR0", "fileExtension": "pjp"}, {"contentType": "brgJZe5Q", "description": "WW9B3Oqq", "fileExtension": "jpeg"}]}' \
    > test.out 2>&1
eval_tap $? 118 'AdminUploadContentScreenshotV2' test.out

#- 119 AdminDeleteContentScreenshotV2
./ng net.accelbyte.sdk.cli.Main ugc adminDeleteContentScreenshotV2 \
    --contentId 'WIctZ4a3' \
    --namespace "$AB_NAMESPACE" \
    --screenshotId 'yBtizKyD' \
    > test.out 2>&1
eval_tap $? 119 'AdminDeleteContentScreenshotV2' test.out

#- 120 ListContentVersionsV2
./ng net.accelbyte.sdk.cli.Main ugc listContentVersionsV2 \
    --contentId 'QqM8yDYB' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 120 'ListContentVersionsV2' test.out

#- 121 AdminGetOfficialGroupContentsV2
./ng net.accelbyte.sdk.cli.Main ugc adminGetOfficialGroupContentsV2 \
    --groupId 'O9gjz0tx' \
    --namespace "$AB_NAMESPACE" \
    --limit '32' \
    --offset '59' \
    > test.out 2>&1
eval_tap $? 121 'AdminGetOfficialGroupContentsV2' test.out

#- 122 AdminListStagingContents
./ng net.accelbyte.sdk.cli.Main ugc adminListStagingContents \
    --namespace "$AB_NAMESPACE" \
    --limit '30' \
    --offset '27' \
    --sortBy 'oTqtLrJM' \
    --status 'WWRKPatw' \
    > test.out 2>&1
eval_tap $? 122 'AdminListStagingContents' test.out

#- 123 AdminGetStagingContentByID
./ng net.accelbyte.sdk.cli.Main ugc adminGetStagingContentByID \
    --contentId 'Hw3pyVpY' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 123 'AdminGetStagingContentByID' test.out

#- 124 AdminApproveStagingContent
./ng net.accelbyte.sdk.cli.Main ugc adminApproveStagingContent \
    --contentId '4WY6O1EQ' \
    --namespace "$AB_NAMESPACE" \
    --body '{"approved": true, "note": "Ar4UweoC"}' \
    > test.out 2>&1
eval_tap $? 124 'AdminApproveStagingContent' test.out

#- 125 AdminUpdateContentByShareCodeV2
./ng net.accelbyte.sdk.cli.Main ugc adminUpdateContentByShareCodeV2 \
    --channelId 'JBka5qCq' \
    --namespace "$AB_NAMESPACE" \
    --shareCode '3bS2133l' \
    --userId 'c1C7zRsE' \
    --body '{"customAttributes": {"Nd2FbSVL": {}, "BVWTEzmx": {}, "To21nP0h": {}}, "name": "ajDkds6P", "shareCode": "YJIDpdiW", "subType": "ewjhR7yb", "tags": ["fJoSSJUM", "QxPjZP7x", "MN27RVFs"], "type": "RQxzE0KO"}' \
    > test.out 2>&1
eval_tap $? 125 'AdminUpdateContentByShareCodeV2' test.out

#- 126 AdminDeleteContentByShareCodeV2
./ng net.accelbyte.sdk.cli.Main ugc adminDeleteContentByShareCodeV2 \
    --channelId '3uFNhjun' \
    --namespace "$AB_NAMESPACE" \
    --shareCode '797nNiZl' \
    --userId '3EDrkEOy' \
    > test.out 2>&1
eval_tap $? 126 'AdminDeleteContentByShareCodeV2' test.out

#- 127 AdminDeleteUserContentV2
./ng net.accelbyte.sdk.cli.Main ugc adminDeleteUserContentV2 \
    --channelId '7GBkm2TF' \
    --contentId '6IDfxgfm' \
    --namespace "$AB_NAMESPACE" \
    --userId '5DGJc13m' \
    > test.out 2>&1
eval_tap $? 127 'AdminDeleteUserContentV2' test.out

#- 128 AdminUpdateUserContentV2
./ng net.accelbyte.sdk.cli.Main ugc adminUpdateUserContentV2 \
    --channelId 'FIn0HAt5' \
    --contentId '5lmTcnnU' \
    --namespace "$AB_NAMESPACE" \
    --userId 'rqGCqDxP' \
    --body '{"customAttributes": {"hOkQiqm9": {}, "sWqzB0Xz": {}, "cFdct7u3": {}}, "name": "RKsHd6Ss", "shareCode": "6hhKQDqO", "subType": "0FH0wj6A", "tags": ["Lafas7TQ", "GZKQP4m7", "txfzQ07J"], "type": "buV5lbCn"}' \
    > test.out 2>&1
eval_tap $? 128 'AdminUpdateUserContentV2' test.out

#- 129 AdminUpdateUserContentFileLocation
./ng net.accelbyte.sdk.cli.Main ugc adminUpdateUserContentFileLocation \
    --channelId 'hZN33SP6' \
    --contentId 'IwG4FKu0' \
    --namespace "$AB_NAMESPACE" \
    --userId 'ZG7nAccI' \
    --body '{"fileExtension": "s76R1Anv", "fileLocation": "jc0iNNKN"}' \
    > test.out 2>&1
eval_tap $? 129 'AdminUpdateUserContentFileLocation' test.out

#- 130 AdminGenerateUserContentUploadURLV2
./ng net.accelbyte.sdk.cli.Main ugc adminGenerateUserContentUploadURLV2 \
    --channelId '5CtEQzHC' \
    --contentId 'BWGJpMb1' \
    --namespace "$AB_NAMESPACE" \
    --userId 'zLhj0GWs' \
    --body '{"contentType": "tNgzl4eQ", "fileExtension": "W4K8Wlwo"}' \
    > test.out 2>&1
eval_tap $? 130 'AdminGenerateUserContentUploadURLV2' test.out

#- 131 AdminGetContentByUserIDV2
./ng net.accelbyte.sdk.cli.Main ugc adminGetContentByUserIDV2 \
    --namespace "$AB_NAMESPACE" \
    --userId '5ORhKP8O' \
    --limit '17' \
    --offset '25' \
    --sortBy 'tRiuJac4' \
    > test.out 2>&1
eval_tap $? 131 'AdminGetContentByUserIDV2' test.out

#- 132 AdminUpdateContentHideStatusV2
./ng net.accelbyte.sdk.cli.Main ugc adminUpdateContentHideStatusV2 \
    --contentId 'O51YHxF3' \
    --namespace "$AB_NAMESPACE" \
    --userId 'QotNGYUo' \
    --body '{"isHidden": false}' \
    > test.out 2>&1
eval_tap $? 132 'AdminUpdateContentHideStatusV2' test.out

#- 133 AdminGetUserGroupContentsV2
./ng net.accelbyte.sdk.cli.Main ugc adminGetUserGroupContentsV2 \
    --groupId 'ATJEBpLx' \
    --namespace "$AB_NAMESPACE" \
    --userId '3COPdAYG' \
    --limit '99' \
    --offset '19' \
    > test.out 2>&1
eval_tap $? 133 'AdminGetUserGroupContentsV2' test.out

#- 134 AdminListUserStagingContents
./ng net.accelbyte.sdk.cli.Main ugc adminListUserStagingContents \
    --namespace "$AB_NAMESPACE" \
    --userId '5TVaDStq' \
    --limit '4' \
    --offset '86' \
    --sortBy 'Fb83xbhU' \
    --status 'STdMFPcc' \
    > test.out 2>&1
eval_tap $? 134 'AdminListUserStagingContents' test.out

#- 135 PublicGetContentByChannelIDV2
./ng net.accelbyte.sdk.cli.Main ugc publicGetContentByChannelIDV2 \
    --channelId 'nN8eOgnt' \
    --namespace "$AB_NAMESPACE" \
    --limit '47' \
    --name 'moFqAhj2' \
    --offset '89' \
    --sortBy 'GdH6ua8R' \
    > test.out 2>&1
eval_tap $? 135 'PublicGetContentByChannelIDV2' test.out

#- 136 PublicListContentV2
./ng net.accelbyte.sdk.cli.Main ugc publicListContentV2 \
    --namespace "$AB_NAMESPACE" \
    --isOfficial  \
    --limit '76' \
    --name 'OQLGSjS2' \
    --offset '83' \
    --sortBy 'wyH1lBWK' \
    --subType 'WpMnKQP6' \
    --tags 'lR5W6T07,u4JJuKjq,EE3KhIFB' \
    --type 'VXfSKfJV' \
    > test.out 2>&1
eval_tap $? 136 'PublicListContentV2' test.out

#- 137 PublicBulkGetContentByIDV2
./ng net.accelbyte.sdk.cli.Main ugc publicBulkGetContentByIDV2 \
    --namespace "$AB_NAMESPACE" \
    --body '{"contentIds": ["xTGNewtv", "ms6DMm9G", "mw0zbDRc"]}' \
    > test.out 2>&1
eval_tap $? 137 'PublicBulkGetContentByIDV2' test.out

#- 138 PublicGetContentBulkByShareCodesV2
./ng net.accelbyte.sdk.cli.Main ugc publicGetContentBulkByShareCodesV2 \
    --namespace "$AB_NAMESPACE" \
    --body '{"shareCodes": ["LsHGSLtT", "PSiFcsYF", "phkgkNNL"]}' \
    > test.out 2>&1
eval_tap $? 138 'PublicGetContentBulkByShareCodesV2' test.out

#- 139 PublicGetContentByShareCodeV2
./ng net.accelbyte.sdk.cli.Main ugc publicGetContentByShareCodeV2 \
    --namespace "$AB_NAMESPACE" \
    --shareCode 'yv32qps7' \
    > test.out 2>&1
eval_tap $? 139 'PublicGetContentByShareCodeV2' test.out

#- 140 PublicGetContentByIDV2
./ng net.accelbyte.sdk.cli.Main ugc publicGetContentByIDV2 \
    --contentId 'GKp52gyy' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 140 'PublicGetContentByIDV2' test.out

#- 141 PublicAddDownloadCountV2
./ng net.accelbyte.sdk.cli.Main ugc publicAddDownloadCountV2 \
    --contentId 'MHB9JTQ4' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 141 'PublicAddDownloadCountV2' test.out

#- 142 PublicListContentDownloaderV2
./ng net.accelbyte.sdk.cli.Main ugc publicListContentDownloaderV2 \
    --contentId 'FwszT1jD' \
    --namespace "$AB_NAMESPACE" \
    --limit '54' \
    --offset '73' \
    --sortBy 'gE8OpoJY' \
    --userId 'oWVSvdfK' \
    > test.out 2>&1
eval_tap $? 142 'PublicListContentDownloaderV2' test.out

#- 143 PublicListContentLikeV2
./ng net.accelbyte.sdk.cli.Main ugc publicListContentLikeV2 \
    --contentId 'pMOrpX11' \
    --namespace "$AB_NAMESPACE" \
    --limit '93' \
    --offset '91' \
    --sortBy 'YawaI8tr' \
    > test.out 2>&1
eval_tap $? 143 'PublicListContentLikeV2' test.out

#- 144 UpdateContentLikeStatusV2
./ng net.accelbyte.sdk.cli.Main ugc updateContentLikeStatusV2 \
    --contentId 'VSLHz2No' \
    --namespace "$AB_NAMESPACE" \
    --body '{"likeStatus": false}' \
    > test.out 2>&1
eval_tap $? 144 'UpdateContentLikeStatusV2' test.out

#- 145 PublicCreateContentV2
./ng net.accelbyte.sdk.cli.Main ugc publicCreateContentV2 \
    --channelId 'zGLLymAm' \
    --namespace "$AB_NAMESPACE" \
    --userId 'eX4jqhgy' \
    --body '{"contentType": "a7QOC1oD", "customAttributes": {"o50a7BLA": {}, "B2FN8rll": {}, "sx8gvCTN": {}}, "fileExtension": "aGk850lz", "name": "sdfAMzmI", "subType": "yMt5DT8G", "tags": ["mG9RvJWn", "3oTMztP8", "HHO6BjZb"], "type": "VD9cq8Ae"}' \
    > test.out 2>&1
eval_tap $? 145 'PublicCreateContentV2' test.out

#- 146 PublicUpdateContentByShareCodeV2
./ng net.accelbyte.sdk.cli.Main ugc publicUpdateContentByShareCodeV2 \
    --channelId 'yoVw3maw' \
    --namespace "$AB_NAMESPACE" \
    --shareCode 'U1lEmzRT' \
    --userId 'DV5x0hZx' \
    --body '{"customAttributes": {"N9NdmfsS": {}, "gGgpr67z": {}, "DWIqRRY2": {}}, "name": "ZPpQTq4B", "subType": "bSGP8EPy", "tags": ["uMHFiYa2", "zgHhxoQU", "iblyMXlF"], "type": "9dFsRxVi"}' \
    > test.out 2>&1
eval_tap $? 146 'PublicUpdateContentByShareCodeV2' test.out

#- 147 PublicDeleteContentByShareCodeV2
./ng net.accelbyte.sdk.cli.Main ugc publicDeleteContentByShareCodeV2 \
    --channelId 'yHaWLNf2' \
    --namespace "$AB_NAMESPACE" \
    --shareCode 'b88HY95x' \
    --userId 'WmdS2Y5l' \
    > test.out 2>&1
eval_tap $? 147 'PublicDeleteContentByShareCodeV2' test.out

#- 148 PublicDeleteContentV2
./ng net.accelbyte.sdk.cli.Main ugc publicDeleteContentV2 \
    --channelId 'uX9SiE2g' \
    --contentId 'MwD3kZzi' \
    --namespace "$AB_NAMESPACE" \
    --userId 'i4PvIbFh' \
    > test.out 2>&1
eval_tap $? 148 'PublicDeleteContentV2' test.out

#- 149 PublicUpdateContentV2
./ng net.accelbyte.sdk.cli.Main ugc publicUpdateContentV2 \
    --channelId 'M6VaXoQ7' \
    --contentId 'WS3J5XXO' \
    --namespace "$AB_NAMESPACE" \
    --userId 'p2kYkO8b' \
    --body '{"customAttributes": {"57jycJ9c": {}, "Pl4UD4cU": {}, "g6rZgNcO": {}}, "name": "RslcL9QJ", "subType": "BaMLPxHy", "tags": ["2naYjaxt", "03sjlOmb", "y9tKyjJ6"], "type": "W0K2rxCF"}' \
    > test.out 2>&1
eval_tap $? 149 'PublicUpdateContentV2' test.out

#- 150 PublicUpdateContentFileLocation
./ng net.accelbyte.sdk.cli.Main ugc publicUpdateContentFileLocation \
    --channelId 'WobCaCjW' \
    --contentId 'kjA0BMGI' \
    --namespace "$AB_NAMESPACE" \
    --userId 'oYFEytaI' \
    --body '{"fileExtension": "XOmOY24X", "fileLocation": "stkEcM69"}' \
    > test.out 2>&1
eval_tap $? 150 'PublicUpdateContentFileLocation' test.out

#- 151 UpdateContentShareCodeV2
./ng net.accelbyte.sdk.cli.Main ugc updateContentShareCodeV2 \
    --channelId 'iWYJ6qwI' \
    --contentId 'X1oTa6NE' \
    --namespace "$AB_NAMESPACE" \
    --userId 'V5gBwty4' \
    --body '{"shareCode": "N17jdYGg"}' \
    > test.out 2>&1
eval_tap $? 151 'UpdateContentShareCodeV2' test.out

#- 152 PublicGenerateContentUploadURLV2
./ng net.accelbyte.sdk.cli.Main ugc publicGenerateContentUploadURLV2 \
    --channelId 'A2uZERUj' \
    --contentId 'jyQqawg6' \
    --namespace "$AB_NAMESPACE" \
    --userId 'Q3eSh4tU' \
    --body '{"contentType": "MgOd0c0P", "fileExtension": "5z5yrHxK"}' \
    > test.out 2>&1
eval_tap $? 152 'PublicGenerateContentUploadURLV2' test.out

#- 153 PublicGetContentByUserIDV2
./ng net.accelbyte.sdk.cli.Main ugc publicGetContentByUserIDV2 \
    --namespace "$AB_NAMESPACE" \
    --userId 'awutYo7E' \
    --limit '56' \
    --offset '52' \
    --sortBy 'srWyQ7fS' \
    > test.out 2>&1
eval_tap $? 153 'PublicGetContentByUserIDV2' test.out

#- 154 UpdateScreenshotsV2
./ng net.accelbyte.sdk.cli.Main ugc updateScreenshotsV2 \
    --contentId 'NrgYkUqA' \
    --namespace "$AB_NAMESPACE" \
    --userId 'cmZXolxr' \
    --body '{"screenshots": [{"description": "j5uDwIhm", "screenshotId": "OHS67jKA"}, {"description": "Uc77Alzu", "screenshotId": "oUzOGJfU"}, {"description": "I3HK8vXk", "screenshotId": "fVVIeTOU"}]}' \
    > test.out 2>&1
eval_tap $? 154 'UpdateScreenshotsV2' test.out

#- 155 UploadContentScreenshotV2
./ng net.accelbyte.sdk.cli.Main ugc uploadContentScreenshotV2 \
    --contentId 'c5l2svzq' \
    --namespace "$AB_NAMESPACE" \
    --userId 'rqL50sJp' \
    --body '{"screenshots": [{"contentType": "P3SWWLGC", "description": "LT5g0ZkO", "fileExtension": "png"}, {"contentType": "lYJl0sr8", "description": "eP0SJpll", "fileExtension": "pjp"}, {"contentType": "Eyh3nvan", "description": "KPeV7L5p", "fileExtension": "jpeg"}]}' \
    > test.out 2>&1
eval_tap $? 155 'UploadContentScreenshotV2' test.out

#- 156 DeleteContentScreenshotV2
./ng net.accelbyte.sdk.cli.Main ugc deleteContentScreenshotV2 \
    --contentId 'LJB5zbay' \
    --namespace "$AB_NAMESPACE" \
    --screenshotId 'o6ZvFCTd' \
    --userId 'pWP6XQ4B' \
    > test.out 2>&1
eval_tap $? 156 'DeleteContentScreenshotV2' test.out

#- 157 PublicGetGroupContentsV2
./ng net.accelbyte.sdk.cli.Main ugc publicGetGroupContentsV2 \
    --groupId 'BceW6bZx' \
    --namespace "$AB_NAMESPACE" \
    --userId 'hCTOnwML' \
    --limit '18' \
    --offset '90' \
    > test.out 2>&1
eval_tap $? 157 'PublicGetGroupContentsV2' test.out

#- 158 ListUserStagingContents
./ng net.accelbyte.sdk.cli.Main ugc listUserStagingContents \
    --namespace "$AB_NAMESPACE" \
    --userId 'iR1ulFXh' \
    --limit '64' \
    --offset '14' \
    --sortBy 'hH0j1OQi' \
    --status '58Yf1D0o' \
    > test.out 2>&1
eval_tap $? 158 'ListUserStagingContents' test.out

#- 159 GetUserStagingContentByID
./ng net.accelbyte.sdk.cli.Main ugc getUserStagingContentByID \
    --contentId 'sNh56A6k' \
    --namespace "$AB_NAMESPACE" \
    --userId 'z5coLz85' \
    > test.out 2>&1
eval_tap $? 159 'GetUserStagingContentByID' test.out

#- 160 UpdateStagingContent
./ng net.accelbyte.sdk.cli.Main ugc updateStagingContent \
    --contentId 'JgRyqF8i' \
    --namespace "$AB_NAMESPACE" \
    --userId 'mvZltakv' \
    --body '{"fileExtension": "v1Tp4qdR", "fileLocation": "1vSTPFiJ"}' \
    > test.out 2>&1
eval_tap $? 160 'UpdateStagingContent' test.out

#- 161 DeleteUserStagingContentByID
./ng net.accelbyte.sdk.cli.Main ugc deleteUserStagingContentByID \
    --contentId 'aVgkSrhG' \
    --namespace "$AB_NAMESPACE" \
    --userId 'y3rk6uxC' \
    > test.out 2>&1
eval_tap $? 161 'DeleteUserStagingContentByID' test.out


rm -f "tmp.dat"

exit $EXIT_CODE