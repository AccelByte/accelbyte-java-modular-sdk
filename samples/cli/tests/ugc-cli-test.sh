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
    --limit '0' \
    --offset '66' \
    > test.out 2>&1
eval_tap $? 2 'SingleAdminGetChannel' test.out

#- 3 AdminCreateChannel
./ng net.accelbyte.sdk.cli.Main ugc adminCreateChannel \
    --namespace "$AB_NAMESPACE" \
    --body '{"id": "yN2KGc66", "name": "ZcGpBL6x"}' \
    > test.out 2>&1
eval_tap $? 3 'AdminCreateChannel' test.out

#- 4 SingleAdminUpdateChannel
./ng net.accelbyte.sdk.cli.Main ugc singleAdminUpdateChannel \
    --channelId 'WQwrnofr' \
    --namespace "$AB_NAMESPACE" \
    --body '{"name": "fA9ZakWp"}' \
    > test.out 2>&1
eval_tap $? 4 'SingleAdminUpdateChannel' test.out

#- 5 SingleAdminDeleteChannel
./ng net.accelbyte.sdk.cli.Main ugc singleAdminDeleteChannel \
    --channelId 'TuwxJWWo' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 5 'SingleAdminDeleteChannel' test.out

#- 6 AdminUploadContentDirect
eval_tap 0 6 'AdminUploadContentDirect # SKIP deprecated' test.out

#- 7 AdminUploadContentS3
./ng net.accelbyte.sdk.cli.Main ugc adminUploadContentS3 \
    --channelId 'XLLOdOIj' \
    --namespace "$AB_NAMESPACE" \
    --body '{"contentType": "TodwyWeR", "customAttributes": {"gQXdlX14": {}, "G3r3PKfW": {}, "1XdJjo5I": {}}, "fileExtension": "3dYlNtWM", "name": "Qs43yEL2", "preview": "B0aQcKCM", "previewMetadata": {"previewContentType": "Qf2gKTmc", "previewFileExtension": "pDXUq9LW"}, "shareCode": "T58hSbZn", "subType": "nNOec0Z0", "tags": ["J4muBcBa", "hhR7vVNe", "TrlLjKNB"], "type": "Pk4DAeYH"}' \
    > test.out 2>&1
eval_tap $? 7 'AdminUploadContentS3' test.out

#- 8 SingleAdminUpdateContentS3
./ng net.accelbyte.sdk.cli.Main ugc singleAdminUpdateContentS3 \
    --channelId 'WAs4j8s0' \
    --contentId 'QNfw892J' \
    --namespace "$AB_NAMESPACE" \
    --body '{"contentType": "aNQEFzkV", "customAttributes": {"c4K2IVQM": {}, "F43kXGeV": {}, "rUaxTLJQ": {}}, "fileExtension": "PiY0c6lh", "name": "EA6Ozfmd", "payload": "8j95gKGX", "preview": "66wJovJR", "previewMetadata": {"previewContentType": "VM7B8OhW", "previewFileExtension": "jsUOYru1"}, "shareCode": "h4UwolRl", "subType": "tJSo0Yb9", "tags": ["gTAVAnqV", "LwaLwBgS", "RBb9Ej6W"], "type": "W9Kmv9tz", "updateContentFile": true}' \
    > test.out 2>&1
eval_tap $? 8 'SingleAdminUpdateContentS3' test.out

#- 9 AdminSearchChannelSpecificContent
./ng net.accelbyte.sdk.cli.Main ugc adminSearchChannelSpecificContent \
    --channelId 'hqssyxkD' \
    --namespace "$AB_NAMESPACE" \
    --creator '1zD4FdxN' \
    --ishidden 'SRFf9vy1' \
    --isofficial 'Wy2jtdjj' \
    --limit '87' \
    --name 'lDOwwIPG' \
    --offset '8' \
    --orderby 'GEL9lBv8' \
    --sortby 'LIhAicRD' \
    --subtype 'tLDOoNCb' \
    --tags 'HCg1lPUL,uSVUlXtA,svsZCEo5' \
    --type 'ghgd7Usn' \
    --userId 'BQ0eL80T' \
    > test.out 2>&1
eval_tap $? 9 'AdminSearchChannelSpecificContent' test.out

#- 10 SingleAdminUpdateContentDirect
eval_tap 0 10 'SingleAdminUpdateContentDirect # SKIP deprecated' test.out

#- 11 SingleAdminDeleteContent
./ng net.accelbyte.sdk.cli.Main ugc singleAdminDeleteContent \
    --channelId 'fK1yPeYs' \
    --contentId 'zTESVkJg' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 11 'SingleAdminDeleteContent' test.out

#- 12 SingleAdminGetContent
./ng net.accelbyte.sdk.cli.Main ugc singleAdminGetContent \
    --namespace "$AB_NAMESPACE" \
    --limit '80' \
    --offset '43' \
    > test.out 2>&1
eval_tap $? 12 'SingleAdminGetContent' test.out

#- 13 AdminGetContentBulk
./ng net.accelbyte.sdk.cli.Main ugc adminGetContentBulk \
    --namespace "$AB_NAMESPACE" \
    --body '{"contentIds": ["2qSPW6Io", "lb9BHP2n", "B12U1eJf"]}' \
    > test.out 2>&1
eval_tap $? 13 'AdminGetContentBulk' test.out

#- 14 AdminSearchContent
./ng net.accelbyte.sdk.cli.Main ugc adminSearchContent \
    --namespace "$AB_NAMESPACE" \
    --creator 'JRmvQyBu' \
    --ishidden 'SsBh0PNV' \
    --isofficial 'rz2MuVew' \
    --limit '57' \
    --name 'lQBA7jYu' \
    --offset '88' \
    --orderby 'KfGATaBW' \
    --sortby 'I1YAX8vg' \
    --subtype '9F25I2n1' \
    --tags '1Qu3PiNL,KU3XkFlO,7NewujpE' \
    --type 'CUrb4Gus' \
    --userId '3eX5BtoG' \
    > test.out 2>&1
eval_tap $? 14 'AdminSearchContent' test.out

#- 15 AdminGetContentBulkByShareCodes
./ng net.accelbyte.sdk.cli.Main ugc adminGetContentBulkByShareCodes \
    --namespace "$AB_NAMESPACE" \
    --body '{"shareCodes": ["1slJJSxf", "rtjHPCvi", "ruhQtbv6"]}' \
    > test.out 2>&1
eval_tap $? 15 'AdminGetContentBulkByShareCodes' test.out

#- 16 AdminGetUserContentByShareCode
./ng net.accelbyte.sdk.cli.Main ugc adminGetUserContentByShareCode \
    --namespace "$AB_NAMESPACE" \
    --shareCode 'AlvXxw9A' \
    > test.out 2>&1
eval_tap $? 16 'AdminGetUserContentByShareCode' test.out

#- 17 AdminGetSpecificContent
./ng net.accelbyte.sdk.cli.Main ugc adminGetSpecificContent \
    --contentId 'po4dBJGC' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 17 'AdminGetSpecificContent' test.out

#- 18 AdminDownloadContentPreview
./ng net.accelbyte.sdk.cli.Main ugc adminDownloadContentPreview \
    --contentId '4gvVnPsi' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 18 'AdminDownloadContentPreview' test.out

#- 19 RollbackContentVersion
./ng net.accelbyte.sdk.cli.Main ugc rollbackContentVersion \
    --contentId 'S6VVX40g' \
    --namespace "$AB_NAMESPACE" \
    --versionId 'ZBqBowCg' \
    > test.out 2>&1
eval_tap $? 19 'RollbackContentVersion' test.out

#- 20 AdminUpdateScreenshots
./ng net.accelbyte.sdk.cli.Main ugc adminUpdateScreenshots \
    --contentId '9Wnc6sCN' \
    --namespace "$AB_NAMESPACE" \
    --body '{"screenshots": [{"description": "h34gtvOb", "screenshotId": "82osZZQq"}, {"description": "jaKLumxk", "screenshotId": "EmdwRN2B"}, {"description": "HFaZHa9z", "screenshotId": "UzJ53Olk"}]}' \
    > test.out 2>&1
eval_tap $? 20 'AdminUpdateScreenshots' test.out

#- 21 AdminUploadContentScreenshot
./ng net.accelbyte.sdk.cli.Main ugc adminUploadContentScreenshot \
    --contentId '7EDKTkpG' \
    --namespace "$AB_NAMESPACE" \
    --body '{"screenshots": [{"contentType": "Qn9R2qJS", "description": "67fcb3K1", "fileExtension": "pjp"}, {"contentType": "Pg137wnR", "description": "2tQ74ygT", "fileExtension": "jpeg"}, {"contentType": "xzQi7zkY", "description": "kjnfSJvu", "fileExtension": "bmp"}]}' \
    > test.out 2>&1
eval_tap $? 21 'AdminUploadContentScreenshot' test.out

#- 22 AdminDeleteContentScreenshot
./ng net.accelbyte.sdk.cli.Main ugc adminDeleteContentScreenshot \
    --contentId 'STfhJQJz' \
    --namespace "$AB_NAMESPACE" \
    --screenshotId '5yJYgGBM' \
    > test.out 2>&1
eval_tap $? 22 'AdminDeleteContentScreenshot' test.out

#- 23 ListContentVersions
./ng net.accelbyte.sdk.cli.Main ugc listContentVersions \
    --contentId '9Y63Z7VO' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 23 'ListContentVersions' test.out

#- 24 SingleAdminGetAllGroups
./ng net.accelbyte.sdk.cli.Main ugc singleAdminGetAllGroups \
    --namespace "$AB_NAMESPACE" \
    --limit '80' \
    --offset '97' \
    > test.out 2>&1
eval_tap $? 24 'SingleAdminGetAllGroups' test.out

#- 25 AdminCreateGroup
./ng net.accelbyte.sdk.cli.Main ugc adminCreateGroup \
    --namespace "$AB_NAMESPACE" \
    --body '{"contents": ["LTs2x6nb", "ZyvkSQSB", "3KVnmuxO"], "name": "Pah7iF3G"}' \
    > test.out 2>&1
eval_tap $? 25 'AdminCreateGroup' test.out

#- 26 SingleAdminGetGroup
./ng net.accelbyte.sdk.cli.Main ugc singleAdminGetGroup \
    --groupId 'JLtAd4kQ' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 26 'SingleAdminGetGroup' test.out

#- 27 SingleAdminUpdateGroup
./ng net.accelbyte.sdk.cli.Main ugc singleAdminUpdateGroup \
    --groupId '0dloFa57' \
    --namespace "$AB_NAMESPACE" \
    --body '{"contents": ["mF3kKDBq", "oujn2fSN", "wjEILDKI"], "name": "mRItHFig"}' \
    > test.out 2>&1
eval_tap $? 27 'SingleAdminUpdateGroup' test.out

#- 28 SingleAdminDeleteGroup
./ng net.accelbyte.sdk.cli.Main ugc singleAdminDeleteGroup \
    --groupId 'nOmcKCS6' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 28 'SingleAdminDeleteGroup' test.out

#- 29 SingleAdminGetGroupContents
./ng net.accelbyte.sdk.cli.Main ugc singleAdminGetGroupContents \
    --groupId 'ElrqtdVL' \
    --namespace "$AB_NAMESPACE" \
    --limit '40' \
    --offset '7' \
    > test.out 2>&1
eval_tap $? 29 'SingleAdminGetGroupContents' test.out

#- 30 AdminGetTag
./ng net.accelbyte.sdk.cli.Main ugc adminGetTag \
    --namespace "$AB_NAMESPACE" \
    --limit '62' \
    --offset '40' \
    > test.out 2>&1
eval_tap $? 30 'AdminGetTag' test.out

#- 31 AdminCreateTag
./ng net.accelbyte.sdk.cli.Main ugc adminCreateTag \
    --namespace "$AB_NAMESPACE" \
    --body '{"tag": "2ykFYMcq"}' \
    > test.out 2>&1
eval_tap $? 31 'AdminCreateTag' test.out

#- 32 AdminUpdateTag
./ng net.accelbyte.sdk.cli.Main ugc adminUpdateTag \
    --namespace "$AB_NAMESPACE" \
    --tagId 'JTxArrfF' \
    --body '{"tag": "rCu9qhbE"}' \
    > test.out 2>&1
eval_tap $? 32 'AdminUpdateTag' test.out

#- 33 AdminDeleteTag
./ng net.accelbyte.sdk.cli.Main ugc adminDeleteTag \
    --namespace "$AB_NAMESPACE" \
    --tagId 'YvdaM42v' \
    > test.out 2>&1
eval_tap $? 33 'AdminDeleteTag' test.out

#- 34 AdminGetType
./ng net.accelbyte.sdk.cli.Main ugc adminGetType \
    --namespace "$AB_NAMESPACE" \
    --limit '78' \
    --offset '28' \
    > test.out 2>&1
eval_tap $? 34 'AdminGetType' test.out

#- 35 AdminCreateType
./ng net.accelbyte.sdk.cli.Main ugc adminCreateType \
    --namespace "$AB_NAMESPACE" \
    --body '{"subtype": ["G2jWbiZQ", "FovNoGo5", "lqfspmJz"], "type": "yj3wamb4"}' \
    > test.out 2>&1
eval_tap $? 35 'AdminCreateType' test.out

#- 36 AdminUpdateType
./ng net.accelbyte.sdk.cli.Main ugc adminUpdateType \
    --namespace "$AB_NAMESPACE" \
    --typeId '8NBfA1XZ' \
    --body '{"subtype": ["m2wFRmVe", "Th71MgT5", "KwJfYGUv"], "type": "s3V1IWlA"}' \
    > test.out 2>&1
eval_tap $? 36 'AdminUpdateType' test.out

#- 37 AdminDeleteType
./ng net.accelbyte.sdk.cli.Main ugc adminDeleteType \
    --namespace "$AB_NAMESPACE" \
    --typeId 'LmRzLa0T' \
    > test.out 2>&1
eval_tap $? 37 'AdminDeleteType' test.out

#- 38 AdminGetChannel
./ng net.accelbyte.sdk.cli.Main ugc adminGetChannel \
    --namespace "$AB_NAMESPACE" \
    --userId 'k1bISmoa' \
    --limit '4' \
    --name 'fuKxfvNq' \
    --offset '26' \
    > test.out 2>&1
eval_tap $? 38 'AdminGetChannel' test.out

#- 39 AdminDeleteAllUserChannels
./ng net.accelbyte.sdk.cli.Main ugc adminDeleteAllUserChannels \
    --namespace "$AB_NAMESPACE" \
    --userId 'TLWCRcly' \
    > test.out 2>&1
eval_tap $? 39 'AdminDeleteAllUserChannels' test.out

#- 40 AdminUpdateChannel
./ng net.accelbyte.sdk.cli.Main ugc adminUpdateChannel \
    --channelId 'etCNcqBp' \
    --namespace "$AB_NAMESPACE" \
    --userId 'ZBeaFKw5' \
    --body '{"name": "lG5GF1l8"}' \
    > test.out 2>&1
eval_tap $? 40 'AdminUpdateChannel' test.out

#- 41 AdminDeleteChannel
./ng net.accelbyte.sdk.cli.Main ugc adminDeleteChannel \
    --channelId 'txJ06T3c' \
    --namespace "$AB_NAMESPACE" \
    --userId 'NRKIY093' \
    > test.out 2>&1
eval_tap $? 41 'AdminDeleteChannel' test.out

#- 42 AdminUpdateContentS3ByShareCode
./ng net.accelbyte.sdk.cli.Main ugc adminUpdateContentS3ByShareCode \
    --channelId 'SkI5D0Gh' \
    --namespace "$AB_NAMESPACE" \
    --shareCode 'DQwLoX7O' \
    --userId 'L7Wr62N8' \
    --body '{"contentType": "5zV6VGrv", "customAttributes": {"pXub5KfN": {}, "ISayCXwO": {}, "xy29jKDZ": {}}, "fileExtension": "2uwyhYbw", "name": "zHLbSDb4", "payload": "UxkiJTD1", "preview": "oHV76aNe", "previewMetadata": {"previewContentType": "hNrlB5iz", "previewFileExtension": "rjmkOotG"}, "shareCode": "sUmuin9D", "subType": "9m8kgvyQ", "tags": ["ZqulcXSq", "JcOIDsD6", "oNYEcD7c"], "type": "B1GOciwe", "updateContentFile": true}' \
    > test.out 2>&1
eval_tap $? 42 'AdminUpdateContentS3ByShareCode' test.out

#- 43 AdminUpdateContentS3
./ng net.accelbyte.sdk.cli.Main ugc adminUpdateContentS3 \
    --channelId 'bdDY1NvG' \
    --contentId '6cSwsfmz' \
    --namespace "$AB_NAMESPACE" \
    --userId 'F8RNwxsg' \
    --body '{"contentType": "oKYNgsT4", "customAttributes": {"qyzNCw3A": {}, "im88o0O9": {}, "ORxtFmID": {}}, "fileExtension": "IfJsN02k", "name": "FLrINpqc", "payload": "VSxhXSMl", "preview": "uom5G9Cq", "previewMetadata": {"previewContentType": "j5WqplCe", "previewFileExtension": "Z6b2N1gK"}, "shareCode": "VRGOKbNE", "subType": "0A9Odvg5", "tags": ["riZgVTIB", "NynwEOVC", "OHCqxCvx"], "type": "AjYN3XSZ", "updateContentFile": true}' \
    > test.out 2>&1
eval_tap $? 43 'AdminUpdateContentS3' test.out

#- 44 DeleteContentByShareCode
./ng net.accelbyte.sdk.cli.Main ugc deleteContentByShareCode \
    --channelId 'vOn8lweP' \
    --namespace "$AB_NAMESPACE" \
    --shareCode 'bSzQTETq' \
    --userId 'KiH6I4D5' \
    > test.out 2>&1
eval_tap $? 44 'DeleteContentByShareCode' test.out

#- 45 AdminUpdateContentDirect
eval_tap 0 45 'AdminUpdateContentDirect # SKIP deprecated' test.out

#- 46 AdminDeleteContent
./ng net.accelbyte.sdk.cli.Main ugc adminDeleteContent \
    --channelId 'uAGPSpEz' \
    --contentId 'nrBjxIOx' \
    --namespace "$AB_NAMESPACE" \
    --userId '99NDDP0G' \
    > test.out 2>&1
eval_tap $? 46 'AdminDeleteContent' test.out

#- 47 AdminGetContent
./ng net.accelbyte.sdk.cli.Main ugc adminGetContent \
    --namespace "$AB_NAMESPACE" \
    --userId 'kDYXf1sD' \
    --limit '94' \
    --offset '100' \
    > test.out 2>&1
eval_tap $? 47 'AdminGetContent' test.out

#- 48 AdminDeleteAllUserContents
./ng net.accelbyte.sdk.cli.Main ugc adminDeleteAllUserContents \
    --namespace "$AB_NAMESPACE" \
    --userId '3zD4RV7w' \
    > test.out 2>&1
eval_tap $? 48 'AdminDeleteAllUserContents' test.out

#- 49 AdminHideUserContent
./ng net.accelbyte.sdk.cli.Main ugc adminHideUserContent \
    --contentId 'QZFz6kjL' \
    --namespace "$AB_NAMESPACE" \
    --userId 'YM2LENjl' \
    --body '{"isHidden": false}' \
    > test.out 2>&1
eval_tap $? 49 'AdminHideUserContent' test.out

#- 50 AdminGetAllGroups
./ng net.accelbyte.sdk.cli.Main ugc adminGetAllGroups \
    --namespace "$AB_NAMESPACE" \
    --userId 'RVJyiv2O' \
    --limit '100' \
    --offset '58' \
    > test.out 2>&1
eval_tap $? 50 'AdminGetAllGroups' test.out

#- 51 AdminDeleteAllUserGroup
./ng net.accelbyte.sdk.cli.Main ugc adminDeleteAllUserGroup \
    --namespace "$AB_NAMESPACE" \
    --userId '42OPuwXi' \
    > test.out 2>&1
eval_tap $? 51 'AdminDeleteAllUserGroup' test.out

#- 52 AdminGetGroup
./ng net.accelbyte.sdk.cli.Main ugc adminGetGroup \
    --groupId 'dPBZtExz' \
    --namespace "$AB_NAMESPACE" \
    --userId '2Wa7oetr' \
    > test.out 2>&1
eval_tap $? 52 'AdminGetGroup' test.out

#- 53 AdminUpdateGroup
./ng net.accelbyte.sdk.cli.Main ugc adminUpdateGroup \
    --groupId '7WaGmAmf' \
    --namespace "$AB_NAMESPACE" \
    --userId '980Ebmsv' \
    --body '{"contents": ["GLn7W2y3", "Ux7f2K1x", "8F42OiHa"], "name": "gg9flTOn"}' \
    > test.out 2>&1
eval_tap $? 53 'AdminUpdateGroup' test.out

#- 54 AdminDeleteGroup
./ng net.accelbyte.sdk.cli.Main ugc adminDeleteGroup \
    --groupId 'hgcymtGB' \
    --namespace "$AB_NAMESPACE" \
    --userId 'F5zMBWqU' \
    > test.out 2>&1
eval_tap $? 54 'AdminDeleteGroup' test.out

#- 55 AdminGetGroupContents
./ng net.accelbyte.sdk.cli.Main ugc adminGetGroupContents \
    --groupId '122O56v3' \
    --namespace "$AB_NAMESPACE" \
    --userId 'g4hf4cVZ' \
    --limit '47' \
    --offset '99' \
    > test.out 2>&1
eval_tap $? 55 'AdminGetGroupContents' test.out

#- 56 AdminDeleteAllUserStates
./ng net.accelbyte.sdk.cli.Main ugc adminDeleteAllUserStates \
    --namespace "$AB_NAMESPACE" \
    --userId 'NX9ZYNqo' \
    > test.out 2>&1
eval_tap $? 56 'AdminDeleteAllUserStates' test.out

#- 57 SearchChannelSpecificContent
./ng net.accelbyte.sdk.cli.Main ugc searchChannelSpecificContent \
    --channelId 'rXHJWc9V' \
    --namespace "$AB_NAMESPACE" \
    --creator '9dr8F0uU' \
    --ishidden '9zSBcD9b' \
    --isofficial 'yOxGLGl5' \
    --limit '97' \
    --name 'd7mrJMHi' \
    --offset '24' \
    --orderby 'oScpIl6F' \
    --sortby 'y1tEWBFk' \
    --subtype '6FQxs2mY' \
    --tags 'oTP3mhcV,SU0gPLoT,8sq2covM' \
    --type 'ay7nJqZL' \
    --userId 'c4XEAX4z' \
    > test.out 2>&1
eval_tap $? 57 'SearchChannelSpecificContent' test.out

#- 58 PublicSearchContent
./ng net.accelbyte.sdk.cli.Main ugc publicSearchContent \
    --namespace "$AB_NAMESPACE" \
    --creator 'cewd9lDu' \
    --ishidden 'blrUpHNb' \
    --isofficial 'NPBbJHlw' \
    --limit '43' \
    --name '58W7PsKu' \
    --offset '74' \
    --orderby 'y9b9am6T' \
    --sortby 'Ldw6EKC4' \
    --subtype '3SnbHRZF' \
    --tags 'FNl24jPR,eh6hTl3U,pOGJW06J' \
    --type 'uQvfxuj1' \
    --userId '9fcxxDKV' \
    > test.out 2>&1
eval_tap $? 58 'PublicSearchContent' test.out

#- 59 PublicGetContentBulk
./ng net.accelbyte.sdk.cli.Main ugc publicGetContentBulk \
    --namespace "$AB_NAMESPACE" \
    --body '{"contentIds": ["11HnITGm", "zJMea0pI", "zAPtKyVF"]}' \
    > test.out 2>&1
eval_tap $? 59 'PublicGetContentBulk' test.out

#- 60 GetFollowedContent
./ng net.accelbyte.sdk.cli.Main ugc getFollowedContent \
    --namespace "$AB_NAMESPACE" \
    --limit '18' \
    --offset '15' \
    > test.out 2>&1
eval_tap $? 60 'GetFollowedContent' test.out

#- 61 GetLikedContent
./ng net.accelbyte.sdk.cli.Main ugc getLikedContent \
    --namespace "$AB_NAMESPACE" \
    --isofficial  \
    --limit '13' \
    --name 'SUsx7e36' \
    --offset '57' \
    --orderby 'KLNoNynT' \
    --sortby 'rOssiQjO' \
    --subtype 'WsqHlrK3' \
    --tags 'Zk0RiWmP,Wx5T7DZt,pwjVbIaG' \
    --type 'wdhCRY87' \
    > test.out 2>&1
eval_tap $? 61 'GetLikedContent' test.out

#- 62 PublicGetContentBulkByShareCodes
./ng net.accelbyte.sdk.cli.Main ugc publicGetContentBulkByShareCodes \
    --namespace "$AB_NAMESPACE" \
    --body '{"shareCodes": ["XIBGmTDT", "jxZKjGzc", "jyjnZUzo"]}' \
    > test.out 2>&1
eval_tap $? 62 'PublicGetContentBulkByShareCodes' test.out

#- 63 PublicDownloadContentByShareCode
./ng net.accelbyte.sdk.cli.Main ugc publicDownloadContentByShareCode \
    --namespace "$AB_NAMESPACE" \
    --shareCode 'zMoeK5bu' \
    > test.out 2>&1
eval_tap $? 63 'PublicDownloadContentByShareCode' test.out

#- 64 PublicDownloadContentByContentID
./ng net.accelbyte.sdk.cli.Main ugc publicDownloadContentByContentID \
    --contentId 'rORsuvUG' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 64 'PublicDownloadContentByContentID' test.out

#- 65 AddDownloadCount
./ng net.accelbyte.sdk.cli.Main ugc addDownloadCount \
    --contentId 'FqHsTg2I' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 65 'AddDownloadCount' test.out

#- 66 UpdateContentLikeStatus
./ng net.accelbyte.sdk.cli.Main ugc updateContentLikeStatus \
    --contentId 'tUpP8Fd0' \
    --namespace "$AB_NAMESPACE" \
    --body '{"likeStatus": true}' \
    > test.out 2>&1
eval_tap $? 66 'UpdateContentLikeStatus' test.out

#- 67 PublicDownloadContentPreview
./ng net.accelbyte.sdk.cli.Main ugc publicDownloadContentPreview \
    --contentId 'yKcPPvGI' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 67 'PublicDownloadContentPreview' test.out

#- 68 GetTag
./ng net.accelbyte.sdk.cli.Main ugc getTag \
    --namespace "$AB_NAMESPACE" \
    --limit '95' \
    --offset '65' \
    > test.out 2>&1
eval_tap $? 68 'GetTag' test.out

#- 69 GetType
./ng net.accelbyte.sdk.cli.Main ugc getType \
    --namespace "$AB_NAMESPACE" \
    --limit '85' \
    --offset '45' \
    > test.out 2>&1
eval_tap $? 69 'GetType' test.out

#- 70 PublicSearchCreator
./ng net.accelbyte.sdk.cli.Main ugc publicSearchCreator \
    --namespace "$AB_NAMESPACE" \
    --limit '94' \
    --offset '58' \
    --orderby 'Zm7FLFnU' \
    --sortby 'a6xBMZ9I' \
    > test.out 2>&1
eval_tap $? 70 'PublicSearchCreator' test.out

#- 71 GetFollowedUsers
./ng net.accelbyte.sdk.cli.Main ugc getFollowedUsers \
    --namespace "$AB_NAMESPACE" \
    --limit '50' \
    --offset '91' \
    > test.out 2>&1
eval_tap $? 71 'GetFollowedUsers' test.out

#- 72 PublicGetCreator
./ng net.accelbyte.sdk.cli.Main ugc publicGetCreator \
    --namespace "$AB_NAMESPACE" \
    --userId 'kbYTYgVz' \
    > test.out 2>&1
eval_tap $? 72 'PublicGetCreator' test.out

#- 73 GetChannels
./ng net.accelbyte.sdk.cli.Main ugc getChannels \
    --namespace "$AB_NAMESPACE" \
    --userId 'asO5LcGl' \
    --limit '50' \
    --name 'eVFBAQOD' \
    --offset '51' \
    > test.out 2>&1
eval_tap $? 73 'GetChannels' test.out

#- 74 PublicCreateChannel
./ng net.accelbyte.sdk.cli.Main ugc publicCreateChannel \
    --namespace "$AB_NAMESPACE" \
    --userId 'ILTX4oYw' \
    --body '{"name": "3uzsBG1k"}' \
    > test.out 2>&1
eval_tap $? 74 'PublicCreateChannel' test.out

#- 75 DeleteAllUserChannel
./ng net.accelbyte.sdk.cli.Main ugc deleteAllUserChannel \
    --namespace "$AB_NAMESPACE" \
    --userId 'XfNQrf1g' \
    > test.out 2>&1
eval_tap $? 75 'DeleteAllUserChannel' test.out

#- 76 UpdateChannel
./ng net.accelbyte.sdk.cli.Main ugc updateChannel \
    --channelId '9kyeGsAM' \
    --namespace "$AB_NAMESPACE" \
    --userId 'wz1CVjkO' \
    --body '{"name": "gRRPmwwS"}' \
    > test.out 2>&1
eval_tap $? 76 'UpdateChannel' test.out

#- 77 DeleteChannel
./ng net.accelbyte.sdk.cli.Main ugc deleteChannel \
    --channelId 'ma0wmbNt' \
    --namespace "$AB_NAMESPACE" \
    --userId 'IEVfqryT' \
    > test.out 2>&1
eval_tap $? 77 'DeleteChannel' test.out

#- 78 CreateContentDirect
eval_tap 0 78 'CreateContentDirect # SKIP deprecated' test.out

#- 79 CreateContentS3
./ng net.accelbyte.sdk.cli.Main ugc createContentS3 \
    --channelId 'df1lHdJO' \
    --namespace "$AB_NAMESPACE" \
    --userId 'UBT5VgVx' \
    --body '{"contentType": "5nReOsD5", "customAttributes": {"QA0vnolQ": {}, "4zHMvUY8": {}, "jfKDcrI5": {}}, "fileExtension": "hu3faOcp", "name": "SAHU4LYP", "preview": "7FwC0FpA", "previewMetadata": {"previewContentType": "B9vicq0h", "previewFileExtension": "fXpFJwk8"}, "subType": "EWaIJxgv", "tags": ["oRUBGMUn", "SJFK1eVu", "Mq2hFv28"], "type": "b22wVhcm"}' \
    > test.out 2>&1
eval_tap $? 79 'CreateContentS3' test.out

#- 80 PublicUpdateContentByShareCode
./ng net.accelbyte.sdk.cli.Main ugc publicUpdateContentByShareCode \
    --channelId 'iEPyjK1P' \
    --namespace "$AB_NAMESPACE" \
    --shareCode 'LQqHh2Eg' \
    --userId 'JTOwBvqr' \
    --body '{"contentType": "AAchl9KX", "customAttributes": {"p8GkRWr1": {}, "5LBFsLiE": {}, "8JMdhBAY": {}}, "fileExtension": "f6TF7FdP", "name": "8sfGEJlr", "payload": "gTwUBU2D", "preview": "MPKlG5ql", "previewMetadata": {"previewContentType": "FBhDDCoc", "previewFileExtension": "ZDXAW5xL"}, "subType": "JAvKVbbD", "tags": ["xH27z1HF", "BCkMTLCX", "oecXSNfC"], "type": "AVv9bbvi", "updateContentFile": false}' \
    > test.out 2>&1
eval_tap $? 80 'PublicUpdateContentByShareCode' test.out

#- 81 UpdateContentS3
./ng net.accelbyte.sdk.cli.Main ugc updateContentS3 \
    --channelId 'bY3DPECd' \
    --contentId 'CrVonEh4' \
    --namespace "$AB_NAMESPACE" \
    --userId '75y0CO0z' \
    --body '{"contentType": "sWz8WzoC", "customAttributes": {"LPIE4oqd": {}, "99vWBsHu": {}, "HC4rxz4E": {}}, "fileExtension": "rlrjWIQl", "name": "lKUU2eRP", "payload": "dZ0TLDF4", "preview": "XgFzxuwC", "previewMetadata": {"previewContentType": "SP4jB75k", "previewFileExtension": "x2MFyooX"}, "subType": "OJB7Sijc", "tags": ["THkjr4ox", "8uXlIyTI", "xfIl9bQH"], "type": "Fyxuy6gr", "updateContentFile": true}' \
    > test.out 2>&1
eval_tap $? 81 'UpdateContentS3' test.out

#- 82 PublicDeleteContentByShareCode
./ng net.accelbyte.sdk.cli.Main ugc publicDeleteContentByShareCode \
    --channelId '1Xv6eOAH' \
    --namespace "$AB_NAMESPACE" \
    --shareCode 'hapP6J6J' \
    --userId 'CRLK7z9o' \
    > test.out 2>&1
eval_tap $? 82 'PublicDeleteContentByShareCode' test.out

#- 83 UpdateContentDirect
eval_tap 0 83 'UpdateContentDirect # SKIP deprecated' test.out

#- 84 DeleteContent
./ng net.accelbyte.sdk.cli.Main ugc deleteContent \
    --channelId 'PKJY8taK' \
    --contentId 'IgFd4pfD' \
    --namespace "$AB_NAMESPACE" \
    --userId 'Dd0LXxPr' \
    > test.out 2>&1
eval_tap $? 84 'DeleteContent' test.out

#- 85 UpdateContentShareCode
./ng net.accelbyte.sdk.cli.Main ugc updateContentShareCode \
    --channelId 'Su5l26wv' \
    --contentId 'S46y5lp8' \
    --namespace "$AB_NAMESPACE" \
    --userId '7VfuU94y' \
    --body '{"shareCode": "52pUGPd6"}' \
    > test.out 2>&1
eval_tap $? 85 'UpdateContentShareCode' test.out

#- 86 PublicGetUserContent
./ng net.accelbyte.sdk.cli.Main ugc publicGetUserContent \
    --namespace "$AB_NAMESPACE" \
    --userId 'Ff1sXxyM' \
    --limit '88' \
    --offset '32' \
    > test.out 2>&1
eval_tap $? 86 'PublicGetUserContent' test.out

#- 87 DeleteAllUserContents
./ng net.accelbyte.sdk.cli.Main ugc deleteAllUserContents \
    --namespace "$AB_NAMESPACE" \
    --userId 'ppbYNp39' \
    > test.out 2>&1
eval_tap $? 87 'DeleteAllUserContents' test.out

#- 88 UpdateScreenshots
./ng net.accelbyte.sdk.cli.Main ugc updateScreenshots \
    --contentId '1LUDZzgd' \
    --namespace "$AB_NAMESPACE" \
    --userId '6i8fWRQJ' \
    --body '{"screenshots": [{"description": "bK3mDME5", "screenshotId": "X5ogpZyz"}, {"description": "syJgCXJg", "screenshotId": "9jN4uzfI"}, {"description": "cDmpSOER", "screenshotId": "OMom6A8H"}]}' \
    > test.out 2>&1
eval_tap $? 88 'UpdateScreenshots' test.out

#- 89 UploadContentScreenshot
./ng net.accelbyte.sdk.cli.Main ugc uploadContentScreenshot \
    --contentId 'fJLAmSnj' \
    --namespace "$AB_NAMESPACE" \
    --userId 'oQC1L3ea' \
    --body '{"screenshots": [{"contentType": "U9eqDvnR", "description": "MZ6Az1Fn", "fileExtension": "jpeg"}, {"contentType": "JaKYCIbd", "description": "75WO3sR0", "fileExtension": "pjp"}, {"contentType": "8OC9SOJ8", "description": "n1r0SVRa", "fileExtension": "jfif"}]}' \
    > test.out 2>&1
eval_tap $? 89 'UploadContentScreenshot' test.out

#- 90 DeleteContentScreenshot
./ng net.accelbyte.sdk.cli.Main ugc deleteContentScreenshot \
    --contentId 'tDJ7t7rl' \
    --namespace "$AB_NAMESPACE" \
    --screenshotId 'pQHctG8T' \
    --userId 'Vz7NlQaO' \
    > test.out 2>&1
eval_tap $? 90 'DeleteContentScreenshot' test.out

#- 91 UpdateUserFollowStatus
./ng net.accelbyte.sdk.cli.Main ugc updateUserFollowStatus \
    --namespace "$AB_NAMESPACE" \
    --userId 'PJqR5TQ7' \
    --body '{"followStatus": false}' \
    > test.out 2>&1
eval_tap $? 91 'UpdateUserFollowStatus' test.out

#- 92 GetPublicFollowers
./ng net.accelbyte.sdk.cli.Main ugc getPublicFollowers \
    --namespace "$AB_NAMESPACE" \
    --userId 'Tea9gdME' \
    --limit '98' \
    --offset '44' \
    > test.out 2>&1
eval_tap $? 92 'GetPublicFollowers' test.out

#- 93 GetPublicFollowing
./ng net.accelbyte.sdk.cli.Main ugc getPublicFollowing \
    --namespace "$AB_NAMESPACE" \
    --userId 'QpzeBs8D' \
    --limit '94' \
    --offset '48' \
    > test.out 2>&1
eval_tap $? 93 'GetPublicFollowing' test.out

#- 94 GetGroups
./ng net.accelbyte.sdk.cli.Main ugc getGroups \
    --namespace "$AB_NAMESPACE" \
    --userId 'J4sk7yj4' \
    --limit '67' \
    --offset '89' \
    > test.out 2>&1
eval_tap $? 94 'GetGroups' test.out

#- 95 CreateGroup
./ng net.accelbyte.sdk.cli.Main ugc createGroup \
    --namespace "$AB_NAMESPACE" \
    --userId 'pcmbXu7D' \
    --body '{"contents": ["AuvGWJbk", "bBPrW1r5", "lqB8HC73"], "name": "BYmF82HB"}' \
    > test.out 2>&1
eval_tap $? 95 'CreateGroup' test.out

#- 96 DeleteAllUserGroup
./ng net.accelbyte.sdk.cli.Main ugc deleteAllUserGroup \
    --namespace "$AB_NAMESPACE" \
    --userId 'vpYHPa27' \
    > test.out 2>&1
eval_tap $? 96 'DeleteAllUserGroup' test.out

#- 97 GetGroup
./ng net.accelbyte.sdk.cli.Main ugc getGroup \
    --groupId 'GZJmH77s' \
    --namespace "$AB_NAMESPACE" \
    --userId 'Q3rCHJST' \
    > test.out 2>&1
eval_tap $? 97 'GetGroup' test.out

#- 98 UpdateGroup
./ng net.accelbyte.sdk.cli.Main ugc updateGroup \
    --groupId 'DTT34gJt' \
    --namespace "$AB_NAMESPACE" \
    --userId 'afhWXueL' \
    --body '{"contents": ["VcyaQzyr", "i3NNhdgZ", "KmE3Q5je"], "name": "Fl2fKKsb"}' \
    > test.out 2>&1
eval_tap $? 98 'UpdateGroup' test.out

#- 99 DeleteGroup
./ng net.accelbyte.sdk.cli.Main ugc deleteGroup \
    --groupId 'QQ3EXyDT' \
    --namespace "$AB_NAMESPACE" \
    --userId 'luoZ5HSM' \
    > test.out 2>&1
eval_tap $? 99 'DeleteGroup' test.out

#- 100 GetGroupContent
./ng net.accelbyte.sdk.cli.Main ugc getGroupContent \
    --groupId 'qDuH9tiK' \
    --namespace "$AB_NAMESPACE" \
    --userId 'naEyutdg' \
    --limit '67' \
    --offset '94' \
    > test.out 2>&1
eval_tap $? 100 'GetGroupContent' test.out

#- 101 DeleteAllUserStates
./ng net.accelbyte.sdk.cli.Main ugc deleteAllUserStates \
    --namespace "$AB_NAMESPACE" \
    --userId 'nM4hAukF' \
    > test.out 2>&1
eval_tap $? 101 'DeleteAllUserStates' test.out

#- 102 AdminGetContentByChannelIDV2
./ng net.accelbyte.sdk.cli.Main ugc adminGetContentByChannelIDV2 \
    --channelId 'qhCQkNex' \
    --namespace "$AB_NAMESPACE" \
    --limit '97' \
    --name 'kF9WxNZu' \
    --offset '22' \
    --sortBy 'pJtHHiG2' \
    > test.out 2>&1
eval_tap $? 102 'AdminGetContentByChannelIDV2' test.out

#- 103 AdminCreateContentV2
./ng net.accelbyte.sdk.cli.Main ugc adminCreateContentV2 \
    --channelId 'KrWYsFdO' \
    --namespace "$AB_NAMESPACE" \
    --body '{"contentType": "sSGhtSB6", "customAttributes": {"Updm9SJp": {}, "Coi3kxMX": {}, "1QsOecka": {}}, "fileExtension": "GBv1GYEJ", "name": "b2EeXssy", "shareCode": "OiXVlDsO", "subType": "HfJCChu4", "tags": ["p5o6h5ra", "8atZdANr", "H0YEFBKP"], "type": "vM73ZAXA"}' \
    > test.out 2>&1
eval_tap $? 103 'AdminCreateContentV2' test.out

#- 104 AdminDeleteOfficialContentV2
./ng net.accelbyte.sdk.cli.Main ugc adminDeleteOfficialContentV2 \
    --channelId '00HXEfyp' \
    --contentId 'LH9XUUy3' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 104 'AdminDeleteOfficialContentV2' test.out

#- 105 AdminUpdateOfficialContentV2
./ng net.accelbyte.sdk.cli.Main ugc adminUpdateOfficialContentV2 \
    --channelId 'dwAaHi6I' \
    --contentId 'RdywfAHn' \
    --namespace "$AB_NAMESPACE" \
    --body '{"customAttributes": {"RSFbB66m": {}, "o411O0ml": {}, "2dpkAolE": {}}, "name": "lVwZi76Q", "shareCode": "EQTk88Yy", "subType": "fCWJlOSY", "tags": ["RVv8BAJG", "3Z53ZGiW", "W8quT31Y"], "type": "mLHoRi64"}' \
    > test.out 2>&1
eval_tap $? 105 'AdminUpdateOfficialContentV2' test.out

#- 106 AdminUpdateOfficialContentFileLocation
./ng net.accelbyte.sdk.cli.Main ugc adminUpdateOfficialContentFileLocation \
    --channelId 'x7qGK9wN' \
    --contentId 'Eu7h7uCM' \
    --namespace "$AB_NAMESPACE" \
    --body '{"fileExtension": "Y7NVdBpE", "fileLocation": "wmdPz6Eg"}' \
    > test.out 2>&1
eval_tap $? 106 'AdminUpdateOfficialContentFileLocation' test.out

#- 107 AdminGenerateOfficialContentUploadURLV2
./ng net.accelbyte.sdk.cli.Main ugc adminGenerateOfficialContentUploadURLV2 \
    --channelId 'BFuOfEyF' \
    --contentId '8D5e3Kze' \
    --namespace "$AB_NAMESPACE" \
    --body '{"contentType": "IxUYCA9F", "fileExtension": "1hAMDzkY"}' \
    > test.out 2>&1
eval_tap $? 107 'AdminGenerateOfficialContentUploadURLV2' test.out

#- 108 AdminGetConfigs
./ng net.accelbyte.sdk.cli.Main ugc adminGetConfigs \
    --namespace "$AB_NAMESPACE" \
    --limit '99' \
    --offset '70' \
    > test.out 2>&1
eval_tap $? 108 'AdminGetConfigs' test.out

#- 109 AdminUpdateConfig
./ng net.accelbyte.sdk.cli.Main ugc adminUpdateConfig \
    --key 'TI383s1y' \
    --namespace "$AB_NAMESPACE" \
    --body '{"value": "4gDsFuSz"}' \
    > test.out 2>&1
eval_tap $? 109 'AdminUpdateConfig' test.out

#- 110 AdminListContentV2
./ng net.accelbyte.sdk.cli.Main ugc adminListContentV2 \
    --namespace "$AB_NAMESPACE" \
    --isOfficial  \
    --limit '85' \
    --name 'ZR2P9N34' \
    --offset '39' \
    --sortBy '82kHzVHA' \
    --subType 'tGeemvcp' \
    --tags 'zSLfGupW,QWhvECLW,uep4peAj' \
    --type 'uqQknwz7' \
    > test.out 2>&1
eval_tap $? 110 'AdminListContentV2' test.out

#- 111 AdminBulkGetContentByIDsV2
./ng net.accelbyte.sdk.cli.Main ugc adminBulkGetContentByIDsV2 \
    --namespace "$AB_NAMESPACE" \
    --body '{"contentIds": ["KTF9MS22", "uQdkm8FT", "UGE7TNmE"]}' \
    > test.out 2>&1
eval_tap $? 111 'AdminBulkGetContentByIDsV2' test.out

#- 112 AdminGetContentBulkByShareCodesV2
./ng net.accelbyte.sdk.cli.Main ugc adminGetContentBulkByShareCodesV2 \
    --namespace "$AB_NAMESPACE" \
    --body '{"shareCodes": ["5A4vXFxp", "01ldxUJh", "H944qsZG"]}' \
    > test.out 2>&1
eval_tap $? 112 'AdminGetContentBulkByShareCodesV2' test.out

#- 113 AdminGetContentByShareCodeV2
./ng net.accelbyte.sdk.cli.Main ugc adminGetContentByShareCodeV2 \
    --namespace "$AB_NAMESPACE" \
    --shareCode 'QBUrqD7Q' \
    > test.out 2>&1
eval_tap $? 113 'AdminGetContentByShareCodeV2' test.out

#- 114 AdminGetContentByContentIDV2
./ng net.accelbyte.sdk.cli.Main ugc adminGetContentByContentIDV2 \
    --contentId 'gnFvlh1B' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 114 'AdminGetContentByContentIDV2' test.out

#- 115 RollbackContentVersionV2
./ng net.accelbyte.sdk.cli.Main ugc rollbackContentVersionV2 \
    --contentId 'DQDUlck0' \
    --namespace "$AB_NAMESPACE" \
    --versionId 'PebONyXO' \
    > test.out 2>&1
eval_tap $? 115 'RollbackContentVersionV2' test.out

#- 116 AdminUpdateScreenshotsV2
./ng net.accelbyte.sdk.cli.Main ugc adminUpdateScreenshotsV2 \
    --contentId 'G4FOL9K2' \
    --namespace "$AB_NAMESPACE" \
    --body '{"screenshots": [{"description": "hbPYbFt0", "screenshotId": "PfA4tJff"}, {"description": "HXmUjpJl", "screenshotId": "YrotPYwT"}, {"description": "AhJNYhmV", "screenshotId": "82VqbLQ5"}]}' \
    > test.out 2>&1
eval_tap $? 116 'AdminUpdateScreenshotsV2' test.out

#- 117 AdminUploadContentScreenshotV2
./ng net.accelbyte.sdk.cli.Main ugc adminUploadContentScreenshotV2 \
    --contentId 'E298Kbnc' \
    --namespace "$AB_NAMESPACE" \
    --body '{"screenshots": [{"contentType": "iUglxIzW", "description": "MGEecePS", "fileExtension": "png"}, {"contentType": "HA7P1tMa", "description": "vsVNt2ti", "fileExtension": "pjp"}, {"contentType": "IRvBqcwj", "description": "ZdzDUAeT", "fileExtension": "png"}]}' \
    > test.out 2>&1
eval_tap $? 117 'AdminUploadContentScreenshotV2' test.out

#- 118 AdminDeleteContentScreenshotV2
./ng net.accelbyte.sdk.cli.Main ugc adminDeleteContentScreenshotV2 \
    --contentId 'hKZLSMwy' \
    --namespace "$AB_NAMESPACE" \
    --screenshotId 'u8vYpqlr' \
    > test.out 2>&1
eval_tap $? 118 'AdminDeleteContentScreenshotV2' test.out

#- 119 ListContentVersionsV2
./ng net.accelbyte.sdk.cli.Main ugc listContentVersionsV2 \
    --contentId 'qpsO2xLz' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 119 'ListContentVersionsV2' test.out

#- 120 AdminGetOfficialGroupContentsV2
./ng net.accelbyte.sdk.cli.Main ugc adminGetOfficialGroupContentsV2 \
    --groupId 'ja7tz32Y' \
    --namespace "$AB_NAMESPACE" \
    --limit '12' \
    --offset '89' \
    > test.out 2>&1
eval_tap $? 120 'AdminGetOfficialGroupContentsV2' test.out

#- 121 AdminListStagingContents
./ng net.accelbyte.sdk.cli.Main ugc adminListStagingContents \
    --namespace "$AB_NAMESPACE" \
    --limit '96' \
    --offset '69' \
    --sortBy '5Uwjglab' \
    --status '0CICsLbh' \
    > test.out 2>&1
eval_tap $? 121 'AdminListStagingContents' test.out

#- 122 AdminGetStagingContentByID
./ng net.accelbyte.sdk.cli.Main ugc adminGetStagingContentByID \
    --contentId 'xrNOg6k1' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 122 'AdminGetStagingContentByID' test.out

#- 123 AdminApproveStagingContent
./ng net.accelbyte.sdk.cli.Main ugc adminApproveStagingContent \
    --contentId 'h2ysXW3g' \
    --namespace "$AB_NAMESPACE" \
    --body '{"approved": true, "note": "df2XZ1jF"}' \
    > test.out 2>&1
eval_tap $? 123 'AdminApproveStagingContent' test.out

#- 124 AdminUpdateContentByShareCodeV2
./ng net.accelbyte.sdk.cli.Main ugc adminUpdateContentByShareCodeV2 \
    --channelId 'mfG9qudv' \
    --namespace "$AB_NAMESPACE" \
    --shareCode 'vfcIu6sS' \
    --userId 'ki6cZjQw' \
    --body '{"customAttributes": {"b6PxRAwJ": {}, "Un4ls6DO": {}, "r2TfrhPX": {}}, "name": "iMMX0VUt", "shareCode": "XWWf4RCz", "subType": "VIXAavhi", "tags": ["eoav4hqL", "t5InLWGz", "WsjdSV6s"], "type": "VWgnbiqY"}' \
    > test.out 2>&1
eval_tap $? 124 'AdminUpdateContentByShareCodeV2' test.out

#- 125 AdminDeleteContentByShareCodeV2
./ng net.accelbyte.sdk.cli.Main ugc adminDeleteContentByShareCodeV2 \
    --channelId '92XRIC0L' \
    --namespace "$AB_NAMESPACE" \
    --shareCode 'wmliEjgY' \
    --userId '3u2TG9qJ' \
    > test.out 2>&1
eval_tap $? 125 'AdminDeleteContentByShareCodeV2' test.out

#- 126 AdminDeleteUserContentV2
./ng net.accelbyte.sdk.cli.Main ugc adminDeleteUserContentV2 \
    --channelId 'b3D5WaUR' \
    --contentId 'cBCy2NHm' \
    --namespace "$AB_NAMESPACE" \
    --userId 'amgh7stF' \
    > test.out 2>&1
eval_tap $? 126 'AdminDeleteUserContentV2' test.out

#- 127 AdminUpdateUserContentV2
./ng net.accelbyte.sdk.cli.Main ugc adminUpdateUserContentV2 \
    --channelId '5o69mSln' \
    --contentId 'Bv2MOf2v' \
    --namespace "$AB_NAMESPACE" \
    --userId 'epjOEOp4' \
    --body '{"customAttributes": {"fmNwAUK8": {}, "02jnqGg7": {}, "BO2M7vJH": {}}, "name": "Wwdu1AdB", "shareCode": "mPFELDbL", "subType": "6ysG31dr", "tags": ["zBbtmhIw", "636fRaNm", "5NLyUPMo"], "type": "7ehUN9Sp"}' \
    > test.out 2>&1
eval_tap $? 127 'AdminUpdateUserContentV2' test.out

#- 128 AdminUpdateUserContentFileLocation
./ng net.accelbyte.sdk.cli.Main ugc adminUpdateUserContentFileLocation \
    --channelId 'Pz0K8XGT' \
    --contentId 'c8KUzRS7' \
    --namespace "$AB_NAMESPACE" \
    --userId '3Pm5KjZk' \
    --body '{"fileExtension": "Cn9fDwvt", "fileLocation": "OTIwCUuC"}' \
    > test.out 2>&1
eval_tap $? 128 'AdminUpdateUserContentFileLocation' test.out

#- 129 AdminGenerateUserContentUploadURLV2
./ng net.accelbyte.sdk.cli.Main ugc adminGenerateUserContentUploadURLV2 \
    --channelId 'zIz7kqwf' \
    --contentId 'IJAPgNri' \
    --namespace "$AB_NAMESPACE" \
    --userId 'WO21ZU3T' \
    --body '{"contentType": "wmsjXrJT", "fileExtension": "hYaIN3Xi"}' \
    > test.out 2>&1
eval_tap $? 129 'AdminGenerateUserContentUploadURLV2' test.out

#- 130 AdminGetContentByUserIDV2
./ng net.accelbyte.sdk.cli.Main ugc adminGetContentByUserIDV2 \
    --namespace "$AB_NAMESPACE" \
    --userId 'G2bsekZe' \
    --limit '47' \
    --offset '49' \
    --sortBy '2AkMsWnO' \
    > test.out 2>&1
eval_tap $? 130 'AdminGetContentByUserIDV2' test.out

#- 131 AdminUpdateContentHideStatusV2
./ng net.accelbyte.sdk.cli.Main ugc adminUpdateContentHideStatusV2 \
    --contentId 'tX9GlJCv' \
    --namespace "$AB_NAMESPACE" \
    --userId 'wAPm3zt6' \
    --body '{"isHidden": true}' \
    > test.out 2>&1
eval_tap $? 131 'AdminUpdateContentHideStatusV2' test.out

#- 132 AdminGetUserGroupContentsV2
./ng net.accelbyte.sdk.cli.Main ugc adminGetUserGroupContentsV2 \
    --groupId 'guYLycbT' \
    --namespace "$AB_NAMESPACE" \
    --userId 'onqiQ4Ft' \
    --limit '68' \
    --offset '63' \
    > test.out 2>&1
eval_tap $? 132 'AdminGetUserGroupContentsV2' test.out

#- 133 AdminListUserStagingContents
./ng net.accelbyte.sdk.cli.Main ugc adminListUserStagingContents \
    --namespace "$AB_NAMESPACE" \
    --userId 'AucoPmd0' \
    --limit '76' \
    --offset '71' \
    --sortBy 'OBAdzbef' \
    --status 'DlElCVv7' \
    > test.out 2>&1
eval_tap $? 133 'AdminListUserStagingContents' test.out

#- 134 PublicGetContentByChannelIDV2
./ng net.accelbyte.sdk.cli.Main ugc publicGetContentByChannelIDV2 \
    --channelId 'k9zTj2CR' \
    --namespace "$AB_NAMESPACE" \
    --limit '83' \
    --name '8smQSl9J' \
    --offset '66' \
    --sortBy 'tj7VX6Rp' \
    > test.out 2>&1
eval_tap $? 134 'PublicGetContentByChannelIDV2' test.out

#- 135 PublicListContentV2
./ng net.accelbyte.sdk.cli.Main ugc publicListContentV2 \
    --namespace "$AB_NAMESPACE" \
    --isOfficial  \
    --limit '5' \
    --name 'R3kUnbpU' \
    --offset '32' \
    --sortBy 'Qr4XuLWK' \
    --subType 'R3UQJCaQ' \
    --tags 'yPnuDIyT,oVQCv3sh,lXSeTkfk' \
    --type 'djRbSAHz' \
    > test.out 2>&1
eval_tap $? 135 'PublicListContentV2' test.out

#- 136 PublicBulkGetContentByIDV2
./ng net.accelbyte.sdk.cli.Main ugc publicBulkGetContentByIDV2 \
    --namespace "$AB_NAMESPACE" \
    --body '{"contentIds": ["hlZaHPmc", "akjdF32s", "jS1IimVU"]}' \
    > test.out 2>&1
eval_tap $? 136 'PublicBulkGetContentByIDV2' test.out

#- 137 PublicGetContentBulkByShareCodesV2
./ng net.accelbyte.sdk.cli.Main ugc publicGetContentBulkByShareCodesV2 \
    --namespace "$AB_NAMESPACE" \
    --body '{"shareCodes": ["7SR3OF4M", "HbIw6ICx", "fAXsPoKd"]}' \
    > test.out 2>&1
eval_tap $? 137 'PublicGetContentBulkByShareCodesV2' test.out

#- 138 PublicGetContentByShareCodeV2
./ng net.accelbyte.sdk.cli.Main ugc publicGetContentByShareCodeV2 \
    --namespace "$AB_NAMESPACE" \
    --shareCode 'OEVbuKuD' \
    > test.out 2>&1
eval_tap $? 138 'PublicGetContentByShareCodeV2' test.out

#- 139 PublicGetContentByIDV2
./ng net.accelbyte.sdk.cli.Main ugc publicGetContentByIDV2 \
    --contentId 'wOFuFHTl' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 139 'PublicGetContentByIDV2' test.out

#- 140 PublicAddDownloadCountV2
./ng net.accelbyte.sdk.cli.Main ugc publicAddDownloadCountV2 \
    --contentId 'vLPOHgEb' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 140 'PublicAddDownloadCountV2' test.out

#- 141 PublicListContentDownloaderV2
./ng net.accelbyte.sdk.cli.Main ugc publicListContentDownloaderV2 \
    --contentId 'S9zEAYsD' \
    --namespace "$AB_NAMESPACE" \
    --limit '80' \
    --offset '49' \
    --sortBy 'aTRis2Pb' \
    --userId 'dFVZ3KT9' \
    > test.out 2>&1
eval_tap $? 141 'PublicListContentDownloaderV2' test.out

#- 142 PublicListContentLikeV2
./ng net.accelbyte.sdk.cli.Main ugc publicListContentLikeV2 \
    --contentId 'rGzmsplN' \
    --namespace "$AB_NAMESPACE" \
    --limit '82' \
    --offset '52' \
    --sortBy 'F66MC9x1' \
    > test.out 2>&1
eval_tap $? 142 'PublicListContentLikeV2' test.out

#- 143 UpdateContentLikeStatusV2
./ng net.accelbyte.sdk.cli.Main ugc updateContentLikeStatusV2 \
    --contentId 'EzSOOGvM' \
    --namespace "$AB_NAMESPACE" \
    --body '{"likeStatus": true}' \
    > test.out 2>&1
eval_tap $? 143 'UpdateContentLikeStatusV2' test.out

#- 144 PublicCreateContentV2
./ng net.accelbyte.sdk.cli.Main ugc publicCreateContentV2 \
    --channelId 't5r1kqaG' \
    --namespace "$AB_NAMESPACE" \
    --userId 'KVaTDkt2' \
    --body '{"contentType": "Knmpv2Sx", "customAttributes": {"gwnGftua": {}, "NB0Qwhaq": {}, "T125kjfx": {}}, "fileExtension": "t4YM7zNC", "name": "OkVgfHxH", "subType": "UHCFITqc", "tags": ["NC8aADxt", "RGYH9cbO", "5jZrZEis"], "type": "aE7p2gXk"}' \
    > test.out 2>&1
eval_tap $? 144 'PublicCreateContentV2' test.out

#- 145 PublicUpdateContentByShareCodeV2
./ng net.accelbyte.sdk.cli.Main ugc publicUpdateContentByShareCodeV2 \
    --channelId 'SrY0YVYt' \
    --namespace "$AB_NAMESPACE" \
    --shareCode 'tIISJBqW' \
    --userId 'P9sihavZ' \
    --body '{"customAttributes": {"4jeljNsU": {}, "fqpIsSZJ": {}, "otKFnyDo": {}}, "name": "p35D4v8C", "subType": "HHzOUihW", "tags": ["1cluiLTV", "MNTp7Uiy", "Qubhg9bb"], "type": "AzcUAccO"}' \
    > test.out 2>&1
eval_tap $? 145 'PublicUpdateContentByShareCodeV2' test.out

#- 146 PublicDeleteContentByShareCodeV2
./ng net.accelbyte.sdk.cli.Main ugc publicDeleteContentByShareCodeV2 \
    --channelId '3rvxdFmL' \
    --namespace "$AB_NAMESPACE" \
    --shareCode 'lGagMCsl' \
    --userId 'WSC2S5bk' \
    > test.out 2>&1
eval_tap $? 146 'PublicDeleteContentByShareCodeV2' test.out

#- 147 PublicDeleteContentV2
./ng net.accelbyte.sdk.cli.Main ugc publicDeleteContentV2 \
    --channelId '625ihqfG' \
    --contentId '4uvgvqDY' \
    --namespace "$AB_NAMESPACE" \
    --userId 'GxT0GKBf' \
    > test.out 2>&1
eval_tap $? 147 'PublicDeleteContentV2' test.out

#- 148 PublicUpdateContentV2
./ng net.accelbyte.sdk.cli.Main ugc publicUpdateContentV2 \
    --channelId 'c2clIOpm' \
    --contentId 'SynOTwxk' \
    --namespace "$AB_NAMESPACE" \
    --userId 'Gb78dZ0x' \
    --body '{"customAttributes": {"ML39RsVr": {}, "TfMbpkBj": {}, "deAJyy4p": {}}, "name": "EqqWwvVz", "subType": "dTbJXXDg", "tags": ["r8k1DTYp", "NpqwSwNk", "AjTmoPEK"], "type": "ws7JRaMj"}' \
    > test.out 2>&1
eval_tap $? 148 'PublicUpdateContentV2' test.out

#- 149 PublicUpdateContentFileLocation
./ng net.accelbyte.sdk.cli.Main ugc publicUpdateContentFileLocation \
    --channelId 'tjF9uTPX' \
    --contentId '3RdnvfbV' \
    --namespace "$AB_NAMESPACE" \
    --userId 'Taabs8VI' \
    --body '{"fileExtension": "mvvJI3dO", "fileLocation": "6zW3PehX"}' \
    > test.out 2>&1
eval_tap $? 149 'PublicUpdateContentFileLocation' test.out

#- 150 UpdateContentShareCodeV2
./ng net.accelbyte.sdk.cli.Main ugc updateContentShareCodeV2 \
    --channelId '50hFZJFF' \
    --contentId 'TA6H4smp' \
    --namespace "$AB_NAMESPACE" \
    --userId 'DfE9Gq4S' \
    --body '{"shareCode": "5kU2e0nA"}' \
    > test.out 2>&1
eval_tap $? 150 'UpdateContentShareCodeV2' test.out

#- 151 PublicGenerateContentUploadURLV2
./ng net.accelbyte.sdk.cli.Main ugc publicGenerateContentUploadURLV2 \
    --channelId 'eutKaPA9' \
    --contentId 'SBdLhkLx' \
    --namespace "$AB_NAMESPACE" \
    --userId '6pjkjwsQ' \
    --body '{"contentType": "rpid0NwN", "fileExtension": "NgLkmSEX"}' \
    > test.out 2>&1
eval_tap $? 151 'PublicGenerateContentUploadURLV2' test.out

#- 152 PublicGetContentByUserIDV2
./ng net.accelbyte.sdk.cli.Main ugc publicGetContentByUserIDV2 \
    --namespace "$AB_NAMESPACE" \
    --userId 'NqFNCbCn' \
    --limit '12' \
    --offset '45' \
    --sortBy '0MlA1Ox7' \
    > test.out 2>&1
eval_tap $? 152 'PublicGetContentByUserIDV2' test.out

#- 153 UpdateScreenshotsV2
./ng net.accelbyte.sdk.cli.Main ugc updateScreenshotsV2 \
    --contentId 'VxrsE1Oz' \
    --namespace "$AB_NAMESPACE" \
    --userId 'yAPS1kIw' \
    --body '{"screenshots": [{"description": "0CAR7Vzk", "screenshotId": "4tNClHfw"}, {"description": "ljYDuSck", "screenshotId": "6lvDY5LQ"}, {"description": "89Ew02qy", "screenshotId": "aY4rZTFq"}]}' \
    > test.out 2>&1
eval_tap $? 153 'UpdateScreenshotsV2' test.out

#- 154 UploadContentScreenshotV2
./ng net.accelbyte.sdk.cli.Main ugc uploadContentScreenshotV2 \
    --contentId 'V6KU5Dex' \
    --namespace "$AB_NAMESPACE" \
    --userId 'wxmyfvhw' \
    --body '{"screenshots": [{"contentType": "YmfvqmO5", "description": "jcZh7KOw", "fileExtension": "bmp"}, {"contentType": "GVOFNRdQ", "description": "maIj9EsS", "fileExtension": "png"}, {"contentType": "i4IDc8mL", "description": "5OMqpk7V", "fileExtension": "jfif"}]}' \
    > test.out 2>&1
eval_tap $? 154 'UploadContentScreenshotV2' test.out

#- 155 DeleteContentScreenshotV2
./ng net.accelbyte.sdk.cli.Main ugc deleteContentScreenshotV2 \
    --contentId 'M3pbsJwZ' \
    --namespace "$AB_NAMESPACE" \
    --screenshotId 'dlpgqsNS' \
    --userId 'tLFqdzfC' \
    > test.out 2>&1
eval_tap $? 155 'DeleteContentScreenshotV2' test.out

#- 156 PublicGetGroupContentsV2
./ng net.accelbyte.sdk.cli.Main ugc publicGetGroupContentsV2 \
    --groupId 'rWbJp5Ul' \
    --namespace "$AB_NAMESPACE" \
    --userId '18OAkmsl' \
    --limit '89' \
    --offset '34' \
    > test.out 2>&1
eval_tap $? 156 'PublicGetGroupContentsV2' test.out

#- 157 ListUserStagingContents
./ng net.accelbyte.sdk.cli.Main ugc listUserStagingContents \
    --namespace "$AB_NAMESPACE" \
    --userId 'yjvjpdzs' \
    --limit '73' \
    --offset '73' \
    --sortBy 'wkGTPVNi' \
    --status 'TbQe5cr1' \
    > test.out 2>&1
eval_tap $? 157 'ListUserStagingContents' test.out

#- 158 GetUserStagingContentByID
./ng net.accelbyte.sdk.cli.Main ugc getUserStagingContentByID \
    --contentId '7O52xF8r' \
    --namespace "$AB_NAMESPACE" \
    --userId 'NQxTvB1m' \
    > test.out 2>&1
eval_tap $? 158 'GetUserStagingContentByID' test.out

#- 159 UpdateStagingContent
./ng net.accelbyte.sdk.cli.Main ugc updateStagingContent \
    --contentId 'l3CMGevL' \
    --namespace "$AB_NAMESPACE" \
    --userId '1D2wLmIw' \
    --body '{"fileExtension": "RLZbBv90", "fileLocation": "APP7wIIo"}' \
    > test.out 2>&1
eval_tap $? 159 'UpdateStagingContent' test.out

#- 160 DeleteUserStagingContentByID
./ng net.accelbyte.sdk.cli.Main ugc deleteUserStagingContentByID \
    --contentId 'V7BmcHVs' \
    --namespace "$AB_NAMESPACE" \
    --userId '3joGfOka' \
    > test.out 2>&1
eval_tap $? 160 'DeleteUserStagingContentByID' test.out


rm -f "tmp.dat"

exit $EXIT_CODE