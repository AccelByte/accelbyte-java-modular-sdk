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
    --limit '8' \
    --offset '23' \
    > test.out 2>&1
eval_tap $? 2 'SingleAdminGetChannel' test.out

#- 3 AdminCreateChannel
./ng net.accelbyte.sdk.cli.Main ugc adminCreateChannel \
    --namespace "$AB_NAMESPACE" \
    --body '{"id": "84e9KPaO", "name": "h2lbWi4w"}' \
    > test.out 2>&1
eval_tap $? 3 'AdminCreateChannel' test.out

#- 4 SingleAdminUpdateChannel
./ng net.accelbyte.sdk.cli.Main ugc singleAdminUpdateChannel \
    --channelId 'H8AhOPvL' \
    --namespace "$AB_NAMESPACE" \
    --body '{"name": "vqIQk0GD"}' \
    > test.out 2>&1
eval_tap $? 4 'SingleAdminUpdateChannel' test.out

#- 5 SingleAdminDeleteChannel
./ng net.accelbyte.sdk.cli.Main ugc singleAdminDeleteChannel \
    --channelId 'Mxt5bFUs' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 5 'SingleAdminDeleteChannel' test.out

#- 6 AdminUploadContentDirect
eval_tap 0 6 'AdminUploadContentDirect # SKIP deprecated' test.out

#- 7 AdminUploadContentS3
./ng net.accelbyte.sdk.cli.Main ugc adminUploadContentS3 \
    --channelId 'rsLUyKnz' \
    --namespace "$AB_NAMESPACE" \
    --body '{"contentType": "NjMvG1hN", "customAttributes": {"rNJy4KmU": {}, "o7KaRlE0": {}, "FVVe6mbp": {}}, "fileExtension": "c7q3SEVI", "name": "NSCKWBUp", "preview": "2hozVEXk", "previewMetadata": {"previewContentType": "hMDRjrC2", "previewFileExtension": "BHksAOie"}, "shareCode": "NfZhYefw", "subType": "PF0sNQUg", "tags": ["bPK4ufgu", "WiWi50Ak", "tpN808uR"], "type": "6REGVLxI"}' \
    > test.out 2>&1
eval_tap $? 7 'AdminUploadContentS3' test.out

#- 8 SingleAdminUpdateContentS3
./ng net.accelbyte.sdk.cli.Main ugc singleAdminUpdateContentS3 \
    --channelId 'TaA1XGin' \
    --contentId 'jVHT1Qp9' \
    --namespace "$AB_NAMESPACE" \
    --body '{"contentType": "ITIdyDWU", "customAttributes": {"cD9tIfr3": {}, "s7AJ8xdt": {}, "WD5a2enQ": {}}, "fileExtension": "sosD7pHO", "name": "cmXxmx1Q", "payload": "MMvbUKjV", "preview": "JDMXa8iO", "previewMetadata": {"previewContentType": "4FfBG4v6", "previewFileExtension": "0XwVOkmQ"}, "shareCode": "xHwJvUIC", "subType": "V3ZT2P9f", "tags": ["JSiaHcbO", "tx7Y84k9", "nXrfwBvb"], "type": "roNYfjZW", "updateContentFile": true}' \
    > test.out 2>&1
eval_tap $? 8 'SingleAdminUpdateContentS3' test.out

#- 9 AdminSearchChannelSpecificContent
./ng net.accelbyte.sdk.cli.Main ugc adminSearchChannelSpecificContent \
    --channelId 'vhuRAjFe' \
    --namespace "$AB_NAMESPACE" \
    --creator 'pEJQs2Qx' \
    --ishidden '6Y5Qdhwm' \
    --isofficial 'ntNk8OXr' \
    --limit '48' \
    --name 'MNs36AIk' \
    --offset '9' \
    --orderby '5v3D3bIr' \
    --sortby 'Co6yIqIT' \
    --subtype 'xhfYEHxY' \
    --tags 'jWr33Z72,xn4odThO,6Ky1oRe1' \
    --type 'p8VZ5GaL' \
    --userId 'yaoMkx9I' \
    > test.out 2>&1
eval_tap $? 9 'AdminSearchChannelSpecificContent' test.out

#- 10 SingleAdminUpdateContentDirect
eval_tap 0 10 'SingleAdminUpdateContentDirect # SKIP deprecated' test.out

#- 11 SingleAdminDeleteContent
./ng net.accelbyte.sdk.cli.Main ugc singleAdminDeleteContent \
    --channelId 'rhvxr1N9' \
    --contentId 'Pb9Dob8A' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 11 'SingleAdminDeleteContent' test.out

#- 12 SingleAdminGetContent
./ng net.accelbyte.sdk.cli.Main ugc singleAdminGetContent \
    --namespace "$AB_NAMESPACE" \
    --limit '85' \
    --offset '39' \
    > test.out 2>&1
eval_tap $? 12 'SingleAdminGetContent' test.out

#- 13 AdminGetContentBulk
./ng net.accelbyte.sdk.cli.Main ugc adminGetContentBulk \
    --namespace "$AB_NAMESPACE" \
    --body '{"contentIds": ["QZckTyE2", "8aJaJnjY", "DvgnGjil"]}' \
    > test.out 2>&1
eval_tap $? 13 'AdminGetContentBulk' test.out

#- 14 AdminSearchContent
./ng net.accelbyte.sdk.cli.Main ugc adminSearchContent \
    --namespace "$AB_NAMESPACE" \
    --creator 'DrPc5iS4' \
    --ishidden 'uEfSAtPn' \
    --isofficial 'OQTIHMKZ' \
    --limit '65' \
    --name 'q4yquOIX' \
    --offset '69' \
    --orderby 't0kLt16A' \
    --sortby 'Jk2m5kCj' \
    --subtype 'aIPXBebj' \
    --tags 'Cwj0nhB5,nTGn9iFd,7GJIbZO8' \
    --type '3S3b1uJf' \
    --userId 'AJknJweX' \
    > test.out 2>&1
eval_tap $? 14 'AdminSearchContent' test.out

#- 15 AdminGetContentBulkByShareCodes
./ng net.accelbyte.sdk.cli.Main ugc adminGetContentBulkByShareCodes \
    --namespace "$AB_NAMESPACE" \
    --body '{"shareCodes": ["pOUYDf6x", "EABvrTmh", "kPa8GnyM"]}' \
    > test.out 2>&1
eval_tap $? 15 'AdminGetContentBulkByShareCodes' test.out

#- 16 AdminGetUserContentByShareCode
./ng net.accelbyte.sdk.cli.Main ugc adminGetUserContentByShareCode \
    --namespace "$AB_NAMESPACE" \
    --shareCode 'CCKfo1n5' \
    > test.out 2>&1
eval_tap $? 16 'AdminGetUserContentByShareCode' test.out

#- 17 AdminGetSpecificContent
./ng net.accelbyte.sdk.cli.Main ugc adminGetSpecificContent \
    --contentId 'uF2bqGGg' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 17 'AdminGetSpecificContent' test.out

#- 18 AdminDownloadContentPreview
./ng net.accelbyte.sdk.cli.Main ugc adminDownloadContentPreview \
    --contentId 'IEplbSx3' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 18 'AdminDownloadContentPreview' test.out

#- 19 RollbackContentVersion
./ng net.accelbyte.sdk.cli.Main ugc rollbackContentVersion \
    --contentId 'kEP6b8Js' \
    --namespace "$AB_NAMESPACE" \
    --versionId 'XNTJZ5bs' \
    > test.out 2>&1
eval_tap $? 19 'RollbackContentVersion' test.out

#- 20 AdminUpdateScreenshots
./ng net.accelbyte.sdk.cli.Main ugc adminUpdateScreenshots \
    --contentId '3Aq3hVRo' \
    --namespace "$AB_NAMESPACE" \
    --body '{"screenshots": [{"description": "bgbXqSMp", "screenshotId": "ZTjiyDU5"}, {"description": "uHtO73xf", "screenshotId": "q29tHJ9d"}, {"description": "y9KI69bQ", "screenshotId": "U7EvgmIy"}]}' \
    > test.out 2>&1
eval_tap $? 20 'AdminUpdateScreenshots' test.out

#- 21 AdminUploadContentScreenshot
./ng net.accelbyte.sdk.cli.Main ugc adminUploadContentScreenshot \
    --contentId 'RzWrdR77' \
    --namespace "$AB_NAMESPACE" \
    --body '{"screenshots": [{"contentType": "W7mtmOSv", "description": "MoTVxhSG", "fileExtension": "jpg"}, {"contentType": "vTID5mZp", "description": "M31QoSvV", "fileExtension": "jpeg"}, {"contentType": "dh5zl8YC", "description": "8Tn8HecA", "fileExtension": "jfif"}]}' \
    > test.out 2>&1
eval_tap $? 21 'AdminUploadContentScreenshot' test.out

#- 22 AdminDeleteContentScreenshot
./ng net.accelbyte.sdk.cli.Main ugc adminDeleteContentScreenshot \
    --contentId 'qtzLB4rp' \
    --namespace "$AB_NAMESPACE" \
    --screenshotId 'n4WcHzKE' \
    > test.out 2>&1
eval_tap $? 22 'AdminDeleteContentScreenshot' test.out

#- 23 ListContentVersions
./ng net.accelbyte.sdk.cli.Main ugc listContentVersions \
    --contentId 'Tvw9XWQY' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 23 'ListContentVersions' test.out

#- 24 SingleAdminGetAllGroups
./ng net.accelbyte.sdk.cli.Main ugc singleAdminGetAllGroups \
    --namespace "$AB_NAMESPACE" \
    --limit '78' \
    --offset '84' \
    > test.out 2>&1
eval_tap $? 24 'SingleAdminGetAllGroups' test.out

#- 25 AdminCreateGroup
./ng net.accelbyte.sdk.cli.Main ugc adminCreateGroup \
    --namespace "$AB_NAMESPACE" \
    --body '{"contents": ["2ai5S8fK", "qGpvkPAF", "pyjdQh3U"], "name": "aY6bz6HL"}' \
    > test.out 2>&1
eval_tap $? 25 'AdminCreateGroup' test.out

#- 26 SingleAdminGetGroup
./ng net.accelbyte.sdk.cli.Main ugc singleAdminGetGroup \
    --groupId 'qXH0r2QW' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 26 'SingleAdminGetGroup' test.out

#- 27 SingleAdminUpdateGroup
./ng net.accelbyte.sdk.cli.Main ugc singleAdminUpdateGroup \
    --groupId '1iFsNUvm' \
    --namespace "$AB_NAMESPACE" \
    --body '{"contents": ["I2vnmvms", "BsOis5vN", "zfcFBb2x"], "name": "0KzBxUIE"}' \
    > test.out 2>&1
eval_tap $? 27 'SingleAdminUpdateGroup' test.out

#- 28 SingleAdminDeleteGroup
./ng net.accelbyte.sdk.cli.Main ugc singleAdminDeleteGroup \
    --groupId 'GI5kOJkB' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 28 'SingleAdminDeleteGroup' test.out

#- 29 SingleAdminGetGroupContents
./ng net.accelbyte.sdk.cli.Main ugc singleAdminGetGroupContents \
    --groupId 'ypO0JiW6' \
    --namespace "$AB_NAMESPACE" \
    --limit '54' \
    --offset '23' \
    > test.out 2>&1
eval_tap $? 29 'SingleAdminGetGroupContents' test.out

#- 30 AdminGetTag
./ng net.accelbyte.sdk.cli.Main ugc adminGetTag \
    --namespace "$AB_NAMESPACE" \
    --limit '14' \
    --offset '14' \
    > test.out 2>&1
eval_tap $? 30 'AdminGetTag' test.out

#- 31 AdminCreateTag
./ng net.accelbyte.sdk.cli.Main ugc adminCreateTag \
    --namespace "$AB_NAMESPACE" \
    --body '{"tag": "qhmbZ2Ev"}' \
    > test.out 2>&1
eval_tap $? 31 'AdminCreateTag' test.out

#- 32 AdminUpdateTag
./ng net.accelbyte.sdk.cli.Main ugc adminUpdateTag \
    --namespace "$AB_NAMESPACE" \
    --tagId 'nxztZw7w' \
    --body '{"tag": "cffgiYjb"}' \
    > test.out 2>&1
eval_tap $? 32 'AdminUpdateTag' test.out

#- 33 AdminDeleteTag
./ng net.accelbyte.sdk.cli.Main ugc adminDeleteTag \
    --namespace "$AB_NAMESPACE" \
    --tagId 'xieI2IIl' \
    > test.out 2>&1
eval_tap $? 33 'AdminDeleteTag' test.out

#- 34 AdminGetType
./ng net.accelbyte.sdk.cli.Main ugc adminGetType \
    --namespace "$AB_NAMESPACE" \
    --limit '54' \
    --offset '6' \
    > test.out 2>&1
eval_tap $? 34 'AdminGetType' test.out

#- 35 AdminCreateType
./ng net.accelbyte.sdk.cli.Main ugc adminCreateType \
    --namespace "$AB_NAMESPACE" \
    --body '{"subtype": ["9cfpVD7v", "uPZs6fru", "kDKkGLTv"], "type": "9JkuWJvD"}' \
    > test.out 2>&1
eval_tap $? 35 'AdminCreateType' test.out

#- 36 AdminUpdateType
./ng net.accelbyte.sdk.cli.Main ugc adminUpdateType \
    --namespace "$AB_NAMESPACE" \
    --typeId 'x1Wq06XO' \
    --body '{"subtype": ["rBxTltdT", "yLekIkMa", "8l6Ybz9E"], "type": "pHBBsERk"}' \
    > test.out 2>&1
eval_tap $? 36 'AdminUpdateType' test.out

#- 37 AdminDeleteType
./ng net.accelbyte.sdk.cli.Main ugc adminDeleteType \
    --namespace "$AB_NAMESPACE" \
    --typeId 'KaamoqQ0' \
    > test.out 2>&1
eval_tap $? 37 'AdminDeleteType' test.out

#- 38 AdminGetChannel
./ng net.accelbyte.sdk.cli.Main ugc adminGetChannel \
    --namespace "$AB_NAMESPACE" \
    --userId '1TtPd0PD' \
    --limit '71' \
    --name '3bqlQKcG' \
    --offset '70' \
    > test.out 2>&1
eval_tap $? 38 'AdminGetChannel' test.out

#- 39 AdminDeleteAllUserChannels
./ng net.accelbyte.sdk.cli.Main ugc adminDeleteAllUserChannels \
    --namespace "$AB_NAMESPACE" \
    --userId 'e04uaRio' \
    > test.out 2>&1
eval_tap $? 39 'AdminDeleteAllUserChannels' test.out

#- 40 AdminUpdateChannel
./ng net.accelbyte.sdk.cli.Main ugc adminUpdateChannel \
    --channelId '1GV49rn0' \
    --namespace "$AB_NAMESPACE" \
    --userId 'EFbXXiwm' \
    --body '{"name": "LiVMFSO2"}' \
    > test.out 2>&1
eval_tap $? 40 'AdminUpdateChannel' test.out

#- 41 AdminDeleteChannel
./ng net.accelbyte.sdk.cli.Main ugc adminDeleteChannel \
    --channelId 'TqQrUFAJ' \
    --namespace "$AB_NAMESPACE" \
    --userId 'POEeu4nf' \
    > test.out 2>&1
eval_tap $? 41 'AdminDeleteChannel' test.out

#- 42 AdminUpdateContentS3ByShareCode
./ng net.accelbyte.sdk.cli.Main ugc adminUpdateContentS3ByShareCode \
    --channelId 'zx3ssUBK' \
    --namespace "$AB_NAMESPACE" \
    --shareCode 'ZREIzNvj' \
    --userId 'KeZ3dWxL' \
    --body '{"contentType": "i4sIpjip", "customAttributes": {"7r1Qms9x": {}, "jqMSYIxT": {}, "7WH4sRlg": {}}, "fileExtension": "GuSrd4nj", "name": "KXkz1Mvy", "payload": "f9D6wgAR", "preview": "21pPzhDY", "previewMetadata": {"previewContentType": "CvvZl3DI", "previewFileExtension": "S0zHsdjD"}, "shareCode": "jXBmqEE7", "subType": "Sh1fT1q2", "tags": ["OZGYO5gC", "E6jvcyN8", "pGY9vNKX"], "type": "bHL4Xc9k", "updateContentFile": false}' \
    > test.out 2>&1
eval_tap $? 42 'AdminUpdateContentS3ByShareCode' test.out

#- 43 AdminUpdateContentS3
./ng net.accelbyte.sdk.cli.Main ugc adminUpdateContentS3 \
    --channelId 'GTXHOYG9' \
    --contentId 'GncEQFzC' \
    --namespace "$AB_NAMESPACE" \
    --userId 'R3s8ccs3' \
    --body '{"contentType": "QgRSruOp", "customAttributes": {"vgamtI90": {}, "hh67NeFJ": {}, "YkcHKurs": {}}, "fileExtension": "hKW9oowD", "name": "xS6GItxk", "payload": "d9aupcdQ", "preview": "RtUvCdOe", "previewMetadata": {"previewContentType": "JImsIxGY", "previewFileExtension": "9XrEzJel"}, "shareCode": "zShtEsg7", "subType": "KztiWe1f", "tags": ["cJ0eDmuK", "YhSjrlIi", "ah28Xy0Z"], "type": "zkXBs3M1", "updateContentFile": true}' \
    > test.out 2>&1
eval_tap $? 43 'AdminUpdateContentS3' test.out

#- 44 DeleteContentByShareCode
./ng net.accelbyte.sdk.cli.Main ugc deleteContentByShareCode \
    --channelId 'VB2FKwEI' \
    --namespace "$AB_NAMESPACE" \
    --shareCode 'U1ipwBAE' \
    --userId 'oW1j6Fho' \
    > test.out 2>&1
eval_tap $? 44 'DeleteContentByShareCode' test.out

#- 45 AdminUpdateContentDirect
eval_tap 0 45 'AdminUpdateContentDirect # SKIP deprecated' test.out

#- 46 AdminDeleteContent
./ng net.accelbyte.sdk.cli.Main ugc adminDeleteContent \
    --channelId 'PCKOZode' \
    --contentId 'ED1gXkWQ' \
    --namespace "$AB_NAMESPACE" \
    --userId 'nqcTKF23' \
    > test.out 2>&1
eval_tap $? 46 'AdminDeleteContent' test.out

#- 47 AdminGetContent
./ng net.accelbyte.sdk.cli.Main ugc adminGetContent \
    --namespace "$AB_NAMESPACE" \
    --userId 'QAlsID3e' \
    --limit '41' \
    --offset '14' \
    > test.out 2>&1
eval_tap $? 47 'AdminGetContent' test.out

#- 48 AdminDeleteAllUserContents
./ng net.accelbyte.sdk.cli.Main ugc adminDeleteAllUserContents \
    --namespace "$AB_NAMESPACE" \
    --userId 'l1C9IR0H' \
    > test.out 2>&1
eval_tap $? 48 'AdminDeleteAllUserContents' test.out

#- 49 AdminHideUserContent
./ng net.accelbyte.sdk.cli.Main ugc adminHideUserContent \
    --contentId 'ArDMOFab' \
    --namespace "$AB_NAMESPACE" \
    --userId 'pHhlaTPj' \
    --body '{"isHidden": true}' \
    > test.out 2>&1
eval_tap $? 49 'AdminHideUserContent' test.out

#- 50 AdminGetAllGroups
./ng net.accelbyte.sdk.cli.Main ugc adminGetAllGroups \
    --namespace "$AB_NAMESPACE" \
    --userId 'dhHz30sz' \
    --limit '65' \
    --offset '6' \
    > test.out 2>&1
eval_tap $? 50 'AdminGetAllGroups' test.out

#- 51 AdminDeleteAllUserGroup
./ng net.accelbyte.sdk.cli.Main ugc adminDeleteAllUserGroup \
    --namespace "$AB_NAMESPACE" \
    --userId 'BUsNmhWQ' \
    > test.out 2>&1
eval_tap $? 51 'AdminDeleteAllUserGroup' test.out

#- 52 AdminGetGroup
./ng net.accelbyte.sdk.cli.Main ugc adminGetGroup \
    --groupId 'xNY4svIe' \
    --namespace "$AB_NAMESPACE" \
    --userId 'F9qpzNkG' \
    > test.out 2>&1
eval_tap $? 52 'AdminGetGroup' test.out

#- 53 AdminUpdateGroup
./ng net.accelbyte.sdk.cli.Main ugc adminUpdateGroup \
    --groupId '9GI4KZJc' \
    --namespace "$AB_NAMESPACE" \
    --userId 'apgNeNG6' \
    --body '{"contents": ["EbGUOIOR", "hBNXtXGp", "4ow1YDH8"], "name": "f5oDmr3Z"}' \
    > test.out 2>&1
eval_tap $? 53 'AdminUpdateGroup' test.out

#- 54 AdminDeleteGroup
./ng net.accelbyte.sdk.cli.Main ugc adminDeleteGroup \
    --groupId 'KXbDaqXQ' \
    --namespace "$AB_NAMESPACE" \
    --userId 'dzg97pP0' \
    > test.out 2>&1
eval_tap $? 54 'AdminDeleteGroup' test.out

#- 55 AdminGetGroupContents
./ng net.accelbyte.sdk.cli.Main ugc adminGetGroupContents \
    --groupId '67A8MYBU' \
    --namespace "$AB_NAMESPACE" \
    --userId 'oyKizxpf' \
    --limit '10' \
    --offset '47' \
    > test.out 2>&1
eval_tap $? 55 'AdminGetGroupContents' test.out

#- 56 AdminDeleteAllUserStates
./ng net.accelbyte.sdk.cli.Main ugc adminDeleteAllUserStates \
    --namespace "$AB_NAMESPACE" \
    --userId 'jbWUhfUA' \
    > test.out 2>&1
eval_tap $? 56 'AdminDeleteAllUserStates' test.out

#- 57 SearchChannelSpecificContent
./ng net.accelbyte.sdk.cli.Main ugc searchChannelSpecificContent \
    --channelId 'ojyvmu6Q' \
    --namespace "$AB_NAMESPACE" \
    --creator 'u2VsF5PB' \
    --ishidden 'maENjMSq' \
    --isofficial '12Vf047k' \
    --limit '86' \
    --name 'aKmUMfBm' \
    --offset '57' \
    --orderby '4QlD4XSZ' \
    --sortby '2ujediGU' \
    --subtype 'g63oj9qp' \
    --tags 'oK9DZ8fN,8DtorKgs,Sk5DxHQZ' \
    --type 'o5GsE7Ro' \
    --userId 'FJmtqd28' \
    > test.out 2>&1
eval_tap $? 57 'SearchChannelSpecificContent' test.out

#- 58 PublicSearchContent
./ng net.accelbyte.sdk.cli.Main ugc publicSearchContent \
    --namespace "$AB_NAMESPACE" \
    --creator '9kvieEEs' \
    --ishidden 'K6vEGKJU' \
    --isofficial 'Kk6bjfGF' \
    --limit '32' \
    --name 'zJE2aUMa' \
    --offset '3' \
    --orderby 'zFz96YHq' \
    --sortby 'PVte9krg' \
    --subtype 'TBvU5qvz' \
    --tags '8q5TZJ9u,Q4aIkOry,9K8ueM7R' \
    --type 'WdU9Htzl' \
    --userId 'MS8aRqfI' \
    > test.out 2>&1
eval_tap $? 58 'PublicSearchContent' test.out

#- 59 PublicGetContentBulk
./ng net.accelbyte.sdk.cli.Main ugc publicGetContentBulk \
    --namespace "$AB_NAMESPACE" \
    --body '{"contentIds": ["8m4km7MY", "T52GxUlr", "Cplvoiuk"]}' \
    > test.out 2>&1
eval_tap $? 59 'PublicGetContentBulk' test.out

#- 60 GetFollowedContent
./ng net.accelbyte.sdk.cli.Main ugc getFollowedContent \
    --namespace "$AB_NAMESPACE" \
    --limit '98' \
    --offset '34' \
    > test.out 2>&1
eval_tap $? 60 'GetFollowedContent' test.out

#- 61 GetLikedContent
./ng net.accelbyte.sdk.cli.Main ugc getLikedContent \
    --namespace "$AB_NAMESPACE" \
    --isofficial  \
    --limit '44' \
    --name 'uPp73FK6' \
    --offset '38' \
    --orderby '0fvc1EMJ' \
    --sortby 'ga0Ma7rC' \
    --subtype 'gbtNwPq2' \
    --tags 'tCiiyxaZ,zOmS3mZE,Z95IyF43' \
    --type 'WMgU7mri' \
    > test.out 2>&1
eval_tap $? 61 'GetLikedContent' test.out

#- 62 PublicGetContentBulkByShareCodes
./ng net.accelbyte.sdk.cli.Main ugc publicGetContentBulkByShareCodes \
    --namespace "$AB_NAMESPACE" \
    --body '{"shareCodes": ["gKtghhXf", "0fSAjaEh", "AnEoIviM"]}' \
    > test.out 2>&1
eval_tap $? 62 'PublicGetContentBulkByShareCodes' test.out

#- 63 PublicDownloadContentByShareCode
./ng net.accelbyte.sdk.cli.Main ugc publicDownloadContentByShareCode \
    --namespace "$AB_NAMESPACE" \
    --shareCode 'yqdwRTF9' \
    > test.out 2>&1
eval_tap $? 63 'PublicDownloadContentByShareCode' test.out

#- 64 PublicDownloadContentByContentID
./ng net.accelbyte.sdk.cli.Main ugc publicDownloadContentByContentID \
    --contentId 'WDaDgRhD' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 64 'PublicDownloadContentByContentID' test.out

#- 65 AddDownloadCount
./ng net.accelbyte.sdk.cli.Main ugc addDownloadCount \
    --contentId 'qEXZldpY' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 65 'AddDownloadCount' test.out

#- 66 UpdateContentLikeStatus
./ng net.accelbyte.sdk.cli.Main ugc updateContentLikeStatus \
    --contentId 'FJtShoPL' \
    --namespace "$AB_NAMESPACE" \
    --body '{"likeStatus": true}' \
    > test.out 2>&1
eval_tap $? 66 'UpdateContentLikeStatus' test.out

#- 67 PublicDownloadContentPreview
./ng net.accelbyte.sdk.cli.Main ugc publicDownloadContentPreview \
    --contentId '8VDFqS0F' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 67 'PublicDownloadContentPreview' test.out

#- 68 GetTag
./ng net.accelbyte.sdk.cli.Main ugc getTag \
    --namespace "$AB_NAMESPACE" \
    --limit '89' \
    --offset '71' \
    > test.out 2>&1
eval_tap $? 68 'GetTag' test.out

#- 69 GetType
./ng net.accelbyte.sdk.cli.Main ugc getType \
    --namespace "$AB_NAMESPACE" \
    --limit '77' \
    --offset '22' \
    > test.out 2>&1
eval_tap $? 69 'GetType' test.out

#- 70 PublicSearchCreator
./ng net.accelbyte.sdk.cli.Main ugc publicSearchCreator \
    --namespace "$AB_NAMESPACE" \
    --limit '41' \
    --offset '34' \
    --orderby 'W13JS3sF' \
    --sortby '7HPxw8KG' \
    > test.out 2>&1
eval_tap $? 70 'PublicSearchCreator' test.out

#- 71 GetFollowedUsers
./ng net.accelbyte.sdk.cli.Main ugc getFollowedUsers \
    --namespace "$AB_NAMESPACE" \
    --limit '80' \
    --offset '62' \
    > test.out 2>&1
eval_tap $? 71 'GetFollowedUsers' test.out

#- 72 PublicGetCreator
./ng net.accelbyte.sdk.cli.Main ugc publicGetCreator \
    --namespace "$AB_NAMESPACE" \
    --userId 'K6SEVEi2' \
    > test.out 2>&1
eval_tap $? 72 'PublicGetCreator' test.out

#- 73 GetChannels
./ng net.accelbyte.sdk.cli.Main ugc getChannels \
    --namespace "$AB_NAMESPACE" \
    --userId 'cBg22TNw' \
    --limit '51' \
    --name 'bjmLYZIi' \
    --offset '23' \
    > test.out 2>&1
eval_tap $? 73 'GetChannels' test.out

#- 74 PublicCreateChannel
./ng net.accelbyte.sdk.cli.Main ugc publicCreateChannel \
    --namespace "$AB_NAMESPACE" \
    --userId 'fSX1dVrn' \
    --body '{"name": "813lzVGU"}' \
    > test.out 2>&1
eval_tap $? 74 'PublicCreateChannel' test.out

#- 75 DeleteAllUserChannel
./ng net.accelbyte.sdk.cli.Main ugc deleteAllUserChannel \
    --namespace "$AB_NAMESPACE" \
    --userId '6JSZOLrk' \
    > test.out 2>&1
eval_tap $? 75 'DeleteAllUserChannel' test.out

#- 76 UpdateChannel
./ng net.accelbyte.sdk.cli.Main ugc updateChannel \
    --channelId 'nCDld3jZ' \
    --namespace "$AB_NAMESPACE" \
    --userId 'aPpCUuRs' \
    --body '{"name": "8iIuDEJI"}' \
    > test.out 2>&1
eval_tap $? 76 'UpdateChannel' test.out

#- 77 DeleteChannel
./ng net.accelbyte.sdk.cli.Main ugc deleteChannel \
    --channelId 'GW1nCm2L' \
    --namespace "$AB_NAMESPACE" \
    --userId 'DaoXsD6P' \
    > test.out 2>&1
eval_tap $? 77 'DeleteChannel' test.out

#- 78 CreateContentDirect
eval_tap 0 78 'CreateContentDirect # SKIP deprecated' test.out

#- 79 CreateContentS3
./ng net.accelbyte.sdk.cli.Main ugc createContentS3 \
    --channelId 'BCP9fIup' \
    --namespace "$AB_NAMESPACE" \
    --userId 'zKigu6WR' \
    --body '{"contentType": "l5kziGIj", "customAttributes": {"XIXUQZkv": {}, "Yw8rvyB8": {}, "ONGDd8Xu": {}}, "fileExtension": "iXgFagJE", "name": "jFNvMRkU", "preview": "bGofyeG9", "previewMetadata": {"previewContentType": "Cx7I51jg", "previewFileExtension": "7NWrz8G2"}, "subType": "R9O7s53C", "tags": ["V12HFY44", "w9UIuzGD", "JpwmKnda"], "type": "C85b2iyb"}' \
    > test.out 2>&1
eval_tap $? 79 'CreateContentS3' test.out

#- 80 PublicUpdateContentByShareCode
./ng net.accelbyte.sdk.cli.Main ugc publicUpdateContentByShareCode \
    --channelId 'Alxm0jlD' \
    --namespace "$AB_NAMESPACE" \
    --shareCode 'KG3YhgSp' \
    --userId 'WyZvb5QN' \
    --body '{"contentType": "AJaRkwNB", "customAttributes": {"gPWzVkkf": {}, "tpLFzZew": {}, "qlv0CMQ0": {}}, "fileExtension": "RHgkheTZ", "name": "FwEadJg4", "payload": "Umk61xSf", "preview": "phFqjQuL", "previewMetadata": {"previewContentType": "SKJTY0Sf", "previewFileExtension": "d7vPnXva"}, "subType": "PR8wXL3L", "tags": ["zN4ddCOl", "8BRgSzIj", "jikckiuA"], "type": "6d5RB83s", "updateContentFile": false}' \
    > test.out 2>&1
eval_tap $? 80 'PublicUpdateContentByShareCode' test.out

#- 81 UpdateContentS3
./ng net.accelbyte.sdk.cli.Main ugc updateContentS3 \
    --channelId 'PbugIW95' \
    --contentId 'JfbPTvJQ' \
    --namespace "$AB_NAMESPACE" \
    --userId 'Iklj44XC' \
    --body '{"contentType": "5uBoAjKQ", "customAttributes": {"tbEt68wM": {}, "AAeqQed8": {}, "WtMwOThR": {}}, "fileExtension": "FMJdo6VI", "name": "aBzch9kP", "payload": "MBbDfmZE", "preview": "G9InHs7j", "previewMetadata": {"previewContentType": "RQ4JHlsp", "previewFileExtension": "u21ThtjA"}, "subType": "fQlvTp8x", "tags": ["pL5IPt48", "ACKtx55a", "Basc02th"], "type": "xThLMqNs", "updateContentFile": true}' \
    > test.out 2>&1
eval_tap $? 81 'UpdateContentS3' test.out

#- 82 PublicDeleteContentByShareCode
./ng net.accelbyte.sdk.cli.Main ugc publicDeleteContentByShareCode \
    --channelId 'eZzK5mpI' \
    --namespace "$AB_NAMESPACE" \
    --shareCode 'MgyQdiQI' \
    --userId 'bzBGA34W' \
    > test.out 2>&1
eval_tap $? 82 'PublicDeleteContentByShareCode' test.out

#- 83 UpdateContentDirect
eval_tap 0 83 'UpdateContentDirect # SKIP deprecated' test.out

#- 84 DeleteContent
./ng net.accelbyte.sdk.cli.Main ugc deleteContent \
    --channelId '2JyAxXyy' \
    --contentId '4H9sTm39' \
    --namespace "$AB_NAMESPACE" \
    --userId 'psMXDWxg' \
    > test.out 2>&1
eval_tap $? 84 'DeleteContent' test.out

#- 85 UpdateContentShareCode
./ng net.accelbyte.sdk.cli.Main ugc updateContentShareCode \
    --channelId 'DFuk3qPw' \
    --contentId 'hDHqhVj9' \
    --namespace "$AB_NAMESPACE" \
    --userId 'XUiYGMAw' \
    --body '{"shareCode": "HlKwHSWB"}' \
    > test.out 2>&1
eval_tap $? 85 'UpdateContentShareCode' test.out

#- 86 PublicGetUserContent
./ng net.accelbyte.sdk.cli.Main ugc publicGetUserContent \
    --namespace "$AB_NAMESPACE" \
    --userId 'CpQjhdvz' \
    --limit '60' \
    --offset '78' \
    > test.out 2>&1
eval_tap $? 86 'PublicGetUserContent' test.out

#- 87 DeleteAllUserContents
./ng net.accelbyte.sdk.cli.Main ugc deleteAllUserContents \
    --namespace "$AB_NAMESPACE" \
    --userId 'UnxVC8QI' \
    > test.out 2>&1
eval_tap $? 87 'DeleteAllUserContents' test.out

#- 88 UpdateScreenshots
./ng net.accelbyte.sdk.cli.Main ugc updateScreenshots \
    --contentId '0yEjDNjI' \
    --namespace "$AB_NAMESPACE" \
    --userId '9lBthnCi' \
    --body '{"screenshots": [{"description": "7HiVeDLC", "screenshotId": "eHO0iR9A"}, {"description": "iMlszIYG", "screenshotId": "JZvOgUaM"}, {"description": "61tjW3WM", "screenshotId": "3HpCYaMr"}]}' \
    > test.out 2>&1
eval_tap $? 88 'UpdateScreenshots' test.out

#- 89 UploadContentScreenshot
./ng net.accelbyte.sdk.cli.Main ugc uploadContentScreenshot \
    --contentId 'MuJOputD' \
    --namespace "$AB_NAMESPACE" \
    --userId 'u1SVQXKl' \
    --body '{"screenshots": [{"contentType": "aNJkEFfd", "description": "pSeCDLdW", "fileExtension": "jpeg"}, {"contentType": "rSuFJm7Q", "description": "ECKW0fA0", "fileExtension": "jfif"}, {"contentType": "hlK8TFwA", "description": "wxyS52wB", "fileExtension": "bmp"}]}' \
    > test.out 2>&1
eval_tap $? 89 'UploadContentScreenshot' test.out

#- 90 DeleteContentScreenshot
./ng net.accelbyte.sdk.cli.Main ugc deleteContentScreenshot \
    --contentId 'oySVDezC' \
    --namespace "$AB_NAMESPACE" \
    --screenshotId 'doepQaXQ' \
    --userId 'n4W650iS' \
    > test.out 2>&1
eval_tap $? 90 'DeleteContentScreenshot' test.out

#- 91 UpdateUserFollowStatus
./ng net.accelbyte.sdk.cli.Main ugc updateUserFollowStatus \
    --namespace "$AB_NAMESPACE" \
    --userId 'jQoLVfO6' \
    --body '{"followStatus": false}' \
    > test.out 2>&1
eval_tap $? 91 'UpdateUserFollowStatus' test.out

#- 92 GetPublicFollowers
./ng net.accelbyte.sdk.cli.Main ugc getPublicFollowers \
    --namespace "$AB_NAMESPACE" \
    --userId 'WMXpH37p' \
    --limit '39' \
    --offset '79' \
    > test.out 2>&1
eval_tap $? 92 'GetPublicFollowers' test.out

#- 93 GetPublicFollowing
./ng net.accelbyte.sdk.cli.Main ugc getPublicFollowing \
    --namespace "$AB_NAMESPACE" \
    --userId 'vHYiwHpW' \
    --limit '84' \
    --offset '77' \
    > test.out 2>&1
eval_tap $? 93 'GetPublicFollowing' test.out

#- 94 GetGroups
./ng net.accelbyte.sdk.cli.Main ugc getGroups \
    --namespace "$AB_NAMESPACE" \
    --userId 'L39UNyQK' \
    --limit '89' \
    --offset '91' \
    > test.out 2>&1
eval_tap $? 94 'GetGroups' test.out

#- 95 CreateGroup
./ng net.accelbyte.sdk.cli.Main ugc createGroup \
    --namespace "$AB_NAMESPACE" \
    --userId 'CavwKayH' \
    --body '{"contents": ["FKTtueNa", "cevR0HVG", "qG6oCtZx"], "name": "hFFFlsDZ"}' \
    > test.out 2>&1
eval_tap $? 95 'CreateGroup' test.out

#- 96 DeleteAllUserGroup
./ng net.accelbyte.sdk.cli.Main ugc deleteAllUserGroup \
    --namespace "$AB_NAMESPACE" \
    --userId 'kbLM6riQ' \
    > test.out 2>&1
eval_tap $? 96 'DeleteAllUserGroup' test.out

#- 97 GetGroup
./ng net.accelbyte.sdk.cli.Main ugc getGroup \
    --groupId 'nn4MWSSS' \
    --namespace "$AB_NAMESPACE" \
    --userId 'xxpyaICC' \
    > test.out 2>&1
eval_tap $? 97 'GetGroup' test.out

#- 98 UpdateGroup
./ng net.accelbyte.sdk.cli.Main ugc updateGroup \
    --groupId 'EfR90WOM' \
    --namespace "$AB_NAMESPACE" \
    --userId 'fWzyCpkG' \
    --body '{"contents": ["ESX41Ak9", "16ZqwXil", "QX7A7q1L"], "name": "YCwQdXv3"}' \
    > test.out 2>&1
eval_tap $? 98 'UpdateGroup' test.out

#- 99 DeleteGroup
./ng net.accelbyte.sdk.cli.Main ugc deleteGroup \
    --groupId 'NzsqULqP' \
    --namespace "$AB_NAMESPACE" \
    --userId 'KCHlPlSy' \
    > test.out 2>&1
eval_tap $? 99 'DeleteGroup' test.out

#- 100 GetGroupContent
./ng net.accelbyte.sdk.cli.Main ugc getGroupContent \
    --groupId 'srkKjxId' \
    --namespace "$AB_NAMESPACE" \
    --userId 'MlMDVQwm' \
    --limit '91' \
    --offset '58' \
    > test.out 2>&1
eval_tap $? 100 'GetGroupContent' test.out

#- 101 DeleteAllUserStates
./ng net.accelbyte.sdk.cli.Main ugc deleteAllUserStates \
    --namespace "$AB_NAMESPACE" \
    --userId 'qu2X7K3a' \
    > test.out 2>&1
eval_tap $? 101 'DeleteAllUserStates' test.out

#- 102 AdminGetContentByChannelIDV2
./ng net.accelbyte.sdk.cli.Main ugc adminGetContentByChannelIDV2 \
    --channelId 'IzYKQ5XQ' \
    --namespace "$AB_NAMESPACE" \
    --limit '80' \
    --name 'Dq56sASV' \
    --offset '81' \
    --sortBy '18LLJ13H' \
    > test.out 2>&1
eval_tap $? 102 'AdminGetContentByChannelIDV2' test.out

#- 103 AdminCreateContentV2
./ng net.accelbyte.sdk.cli.Main ugc adminCreateContentV2 \
    --channelId '3IMrepQ9' \
    --namespace "$AB_NAMESPACE" \
    --body '{"contentType": "w6M8iiHY", "customAttributes": {"icekxUr7": {}, "3x4PduoP": {}, "mmJTBPpe": {}}, "fileExtension": "tttLovAO", "name": "gmqFDsij", "shareCode": "G8obRn7M", "subType": "HnXelrKB", "tags": ["Xag4JTkD", "cv7iADcw", "TQiqM5Bf"], "type": "vTkfyY5a"}' \
    > test.out 2>&1
eval_tap $? 103 'AdminCreateContentV2' test.out

#- 104 AdminDeleteOfficialContentV2
./ng net.accelbyte.sdk.cli.Main ugc adminDeleteOfficialContentV2 \
    --channelId 'PG7rPaQk' \
    --contentId 'RsQ3ytRz' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 104 'AdminDeleteOfficialContentV2' test.out

#- 105 AdminUpdateOfficialContentV2
./ng net.accelbyte.sdk.cli.Main ugc adminUpdateOfficialContentV2 \
    --channelId 'yF9qMPhU' \
    --contentId 'e6aoX8ye' \
    --namespace "$AB_NAMESPACE" \
    --body '{"customAttributes": {"noFrjeL3": {}, "hFjQtJmS": {}, "b8ye3VKI": {}}, "name": "uT9gQEQT", "shareCode": "23gUMasL", "subType": "nmi9WSWA", "tags": ["tLyD9lsw", "GQJUfTh4", "IjpIN8VD"], "type": "SIPWtuyq"}' \
    > test.out 2>&1
eval_tap $? 105 'AdminUpdateOfficialContentV2' test.out

#- 106 AdminCopyContent
./ng net.accelbyte.sdk.cli.Main ugc adminCopyContent \
    --channelId 'SN0qvD8R' \
    --contentId 'VRWHx0vP' \
    --namespace "$AB_NAMESPACE" \
    --body '{"customAttributes": {"7cYg9VM5": {}, "q4ZI9wx9": {}, "Tr7GBtCc": {}}, "name": "cY9y4R5f", "subType": "dLAMb9VH", "tags": ["XBCRT3ah", "zks5ZSKL", "cG2VJ9Xp"], "targetChannelId": "6E6lXg4Q", "type": "xd4S5PZJ"}' \
    > test.out 2>&1
eval_tap $? 106 'AdminCopyContent' test.out

#- 107 AdminUpdateOfficialContentFileLocation
./ng net.accelbyte.sdk.cli.Main ugc adminUpdateOfficialContentFileLocation \
    --channelId 'JTjidnon' \
    --contentId 'kfuMsLos' \
    --namespace "$AB_NAMESPACE" \
    --body '{"fileExtension": "hG0UUC07", "fileLocation": "BjmeRCNG"}' \
    > test.out 2>&1
eval_tap $? 107 'AdminUpdateOfficialContentFileLocation' test.out

#- 108 AdminGenerateOfficialContentUploadURLV2
./ng net.accelbyte.sdk.cli.Main ugc adminGenerateOfficialContentUploadURLV2 \
    --channelId 'IXnOUAaq' \
    --contentId 'PPUNakH7' \
    --namespace "$AB_NAMESPACE" \
    --body '{"contentType": "6LPbre1R", "fileExtension": "ypuTMedn"}' \
    > test.out 2>&1
eval_tap $? 108 'AdminGenerateOfficialContentUploadURLV2' test.out

#- 109 AdminGetConfigs
./ng net.accelbyte.sdk.cli.Main ugc adminGetConfigs \
    --namespace "$AB_NAMESPACE" \
    --limit '2' \
    --offset '59' \
    > test.out 2>&1
eval_tap $? 109 'AdminGetConfigs' test.out

#- 110 AdminUpdateConfig
./ng net.accelbyte.sdk.cli.Main ugc adminUpdateConfig \
    --key 'g1Bn4Ou3' \
    --namespace "$AB_NAMESPACE" \
    --body '{"value": "ZkcLzsCI"}' \
    > test.out 2>&1
eval_tap $? 110 'AdminUpdateConfig' test.out

#- 111 AdminListContentV2
./ng net.accelbyte.sdk.cli.Main ugc adminListContentV2 \
    --namespace "$AB_NAMESPACE" \
    --isOfficial  \
    --limit '67' \
    --name 'kmza48Cn' \
    --offset '99' \
    --sortBy '28ZQu563' \
    --subType '5qMsF6mR' \
    --tags 'kLHIzlMh,CEECOZVv,ErPPfNjn' \
    --type 'FJeKzamm' \
    > test.out 2>&1
eval_tap $? 111 'AdminListContentV2' test.out

#- 112 AdminBulkGetContentByIDsV2
./ng net.accelbyte.sdk.cli.Main ugc adminBulkGetContentByIDsV2 \
    --namespace "$AB_NAMESPACE" \
    --body '{"contentIds": ["3BuLkzU7", "YDCOH5R1", "2U55RFOA"]}' \
    > test.out 2>&1
eval_tap $? 112 'AdminBulkGetContentByIDsV2' test.out

#- 113 AdminGetContentBulkByShareCodesV2
./ng net.accelbyte.sdk.cli.Main ugc adminGetContentBulkByShareCodesV2 \
    --namespace "$AB_NAMESPACE" \
    --body '{"shareCodes": ["ukaBMyzz", "o4yWn9QK", "a7bo65JS"]}' \
    > test.out 2>&1
eval_tap $? 113 'AdminGetContentBulkByShareCodesV2' test.out

#- 114 AdminGetContentByShareCodeV2
./ng net.accelbyte.sdk.cli.Main ugc adminGetContentByShareCodeV2 \
    --namespace "$AB_NAMESPACE" \
    --shareCode 'pXgtw6Vx' \
    > test.out 2>&1
eval_tap $? 114 'AdminGetContentByShareCodeV2' test.out

#- 115 AdminGetContentByContentIDV2
./ng net.accelbyte.sdk.cli.Main ugc adminGetContentByContentIDV2 \
    --contentId '8QSknW8Y' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 115 'AdminGetContentByContentIDV2' test.out

#- 116 RollbackContentVersionV2
./ng net.accelbyte.sdk.cli.Main ugc rollbackContentVersionV2 \
    --contentId 'F0hvwM46' \
    --namespace "$AB_NAMESPACE" \
    --versionId 'Ehn4pI1F' \
    > test.out 2>&1
eval_tap $? 116 'RollbackContentVersionV2' test.out

#- 117 AdminUpdateScreenshotsV2
./ng net.accelbyte.sdk.cli.Main ugc adminUpdateScreenshotsV2 \
    --contentId 'sXIZuzyS' \
    --namespace "$AB_NAMESPACE" \
    --body '{"screenshots": [{"description": "6h5ylCmS", "screenshotId": "17OTqqIX"}, {"description": "jU9TvR96", "screenshotId": "oPQH2Xb2"}, {"description": "KQ90YTr9", "screenshotId": "wBrAJGSy"}]}' \
    > test.out 2>&1
eval_tap $? 117 'AdminUpdateScreenshotsV2' test.out

#- 118 AdminUploadContentScreenshotV2
./ng net.accelbyte.sdk.cli.Main ugc adminUploadContentScreenshotV2 \
    --contentId 'LV8hkAjY' \
    --namespace "$AB_NAMESPACE" \
    --body '{"screenshots": [{"contentType": "u0Q3vvtt", "description": "rhDByijj", "fileExtension": "pjp"}, {"contentType": "BevjouEB", "description": "Mmm1OnNi", "fileExtension": "jpg"}, {"contentType": "jldMuhTt", "description": "CCLFvatP", "fileExtension": "bmp"}]}' \
    > test.out 2>&1
eval_tap $? 118 'AdminUploadContentScreenshotV2' test.out

#- 119 AdminDeleteContentScreenshotV2
./ng net.accelbyte.sdk.cli.Main ugc adminDeleteContentScreenshotV2 \
    --contentId 'lK8frhwT' \
    --namespace "$AB_NAMESPACE" \
    --screenshotId 'L4O2ggub' \
    > test.out 2>&1
eval_tap $? 119 'AdminDeleteContentScreenshotV2' test.out

#- 120 ListContentVersionsV2
./ng net.accelbyte.sdk.cli.Main ugc listContentVersionsV2 \
    --contentId 'NiSxjtGi' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 120 'ListContentVersionsV2' test.out

#- 121 AdminGetOfficialGroupContentsV2
./ng net.accelbyte.sdk.cli.Main ugc adminGetOfficialGroupContentsV2 \
    --groupId 'nbm7fJKa' \
    --namespace "$AB_NAMESPACE" \
    --limit '22' \
    --offset '15' \
    > test.out 2>&1
eval_tap $? 121 'AdminGetOfficialGroupContentsV2' test.out

#- 122 AdminListStagingContents
./ng net.accelbyte.sdk.cli.Main ugc adminListStagingContents \
    --namespace "$AB_NAMESPACE" \
    --limit '52' \
    --offset '65' \
    --sortBy 'TaGuLEXa' \
    --status '18kDx3QU' \
    > test.out 2>&1
eval_tap $? 122 'AdminListStagingContents' test.out

#- 123 AdminGetStagingContentByID
./ng net.accelbyte.sdk.cli.Main ugc adminGetStagingContentByID \
    --contentId 'KCBEXPvk' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 123 'AdminGetStagingContentByID' test.out

#- 124 AdminApproveStagingContent
./ng net.accelbyte.sdk.cli.Main ugc adminApproveStagingContent \
    --contentId 'LpL6Md9z' \
    --namespace "$AB_NAMESPACE" \
    --body '{"approved": false, "note": "UMBVvwTt"}' \
    > test.out 2>&1
eval_tap $? 124 'AdminApproveStagingContent' test.out

#- 125 AdminUpdateContentByShareCodeV2
./ng net.accelbyte.sdk.cli.Main ugc adminUpdateContentByShareCodeV2 \
    --channelId '55WOVeoK' \
    --namespace "$AB_NAMESPACE" \
    --shareCode 'FcQ3gxGT' \
    --userId 'A0Kl991E' \
    --body '{"customAttributes": {"lkNThQcz": {}, "O01melrr": {}, "2vxfZWBt": {}}, "name": "SJDy3kfH", "shareCode": "c2ExwPfd", "subType": "ssWd10r6", "tags": ["LtBB71UF", "PCCnjReO", "SHaK4ikc"], "type": "m8cC9wRA"}' \
    > test.out 2>&1
eval_tap $? 125 'AdminUpdateContentByShareCodeV2' test.out

#- 126 AdminDeleteContentByShareCodeV2
./ng net.accelbyte.sdk.cli.Main ugc adminDeleteContentByShareCodeV2 \
    --channelId 'mXti1cRn' \
    --namespace "$AB_NAMESPACE" \
    --shareCode 'BwPApk6X' \
    --userId 'DsDCmqNN' \
    > test.out 2>&1
eval_tap $? 126 'AdminDeleteContentByShareCodeV2' test.out

#- 127 AdminDeleteUserContentV2
./ng net.accelbyte.sdk.cli.Main ugc adminDeleteUserContentV2 \
    --channelId 'e7iSruC1' \
    --contentId 'BxqSheow' \
    --namespace "$AB_NAMESPACE" \
    --userId 'JumsS1zZ' \
    > test.out 2>&1
eval_tap $? 127 'AdminDeleteUserContentV2' test.out

#- 128 AdminUpdateUserContentV2
./ng net.accelbyte.sdk.cli.Main ugc adminUpdateUserContentV2 \
    --channelId 'nnjjF1sD' \
    --contentId '5viDzizG' \
    --namespace "$AB_NAMESPACE" \
    --userId 'eqnWNpar' \
    --body '{"customAttributes": {"EYy0LH3u": {}, "UKNBBiN6": {}, "42Zy6EWp": {}}, "name": "UJQYmjWd", "shareCode": "Gc30MDvN", "subType": "BkXKtSVs", "tags": ["LGQ92cYT", "DPZLAm9e", "5OciwHpL"], "type": "XfIcmnLy"}' \
    > test.out 2>&1
eval_tap $? 128 'AdminUpdateUserContentV2' test.out

#- 129 AdminUpdateUserContentFileLocation
./ng net.accelbyte.sdk.cli.Main ugc adminUpdateUserContentFileLocation \
    --channelId 'nPZhRlMi' \
    --contentId 'IJaFeVj1' \
    --namespace "$AB_NAMESPACE" \
    --userId 'nb7Un69I' \
    --body '{"fileExtension": "wd4l6byO", "fileLocation": "K3DXKn9S"}' \
    > test.out 2>&1
eval_tap $? 129 'AdminUpdateUserContentFileLocation' test.out

#- 130 AdminGenerateUserContentUploadURLV2
./ng net.accelbyte.sdk.cli.Main ugc adminGenerateUserContentUploadURLV2 \
    --channelId 'XLOQZ3NX' \
    --contentId 'PlPtVlcv' \
    --namespace "$AB_NAMESPACE" \
    --userId 'PKccBs8Z' \
    --body '{"contentType": "exbwPbPJ", "fileExtension": "uQsRw5L4"}' \
    > test.out 2>&1
eval_tap $? 130 'AdminGenerateUserContentUploadURLV2' test.out

#- 131 AdminGetContentByUserIDV2
./ng net.accelbyte.sdk.cli.Main ugc adminGetContentByUserIDV2 \
    --namespace "$AB_NAMESPACE" \
    --userId '2zlChBFV' \
    --limit '71' \
    --offset '14' \
    --sortBy 'E7cXWoIF' \
    > test.out 2>&1
eval_tap $? 131 'AdminGetContentByUserIDV2' test.out

#- 132 AdminUpdateContentHideStatusV2
./ng net.accelbyte.sdk.cli.Main ugc adminUpdateContentHideStatusV2 \
    --contentId 'n9mUI6GZ' \
    --namespace "$AB_NAMESPACE" \
    --userId 'LLwgwGnT' \
    --body '{"isHidden": false}' \
    > test.out 2>&1
eval_tap $? 132 'AdminUpdateContentHideStatusV2' test.out

#- 133 AdminGetUserGroupContentsV2
./ng net.accelbyte.sdk.cli.Main ugc adminGetUserGroupContentsV2 \
    --groupId 'KqRksxn7' \
    --namespace "$AB_NAMESPACE" \
    --userId 'uTiMGRZ3' \
    --limit '95' \
    --offset '28' \
    > test.out 2>&1
eval_tap $? 133 'AdminGetUserGroupContentsV2' test.out

#- 134 AdminListUserStagingContents
./ng net.accelbyte.sdk.cli.Main ugc adminListUserStagingContents \
    --namespace "$AB_NAMESPACE" \
    --userId 'NANiDduK' \
    --limit '96' \
    --offset '46' \
    --sortBy 'N4zz4QQZ' \
    --status 'pv97tyMh' \
    > test.out 2>&1
eval_tap $? 134 'AdminListUserStagingContents' test.out

#- 135 PublicGetContentByChannelIDV2
./ng net.accelbyte.sdk.cli.Main ugc publicGetContentByChannelIDV2 \
    --channelId 'PUGuRIdC' \
    --namespace "$AB_NAMESPACE" \
    --limit '3' \
    --name '0NzQK5B1' \
    --offset '59' \
    --sortBy 'KCS2QtiF' \
    > test.out 2>&1
eval_tap $? 135 'PublicGetContentByChannelIDV2' test.out

#- 136 PublicListContentV2
./ng net.accelbyte.sdk.cli.Main ugc publicListContentV2 \
    --namespace "$AB_NAMESPACE" \
    --isOfficial  \
    --limit '50' \
    --name 'wxlhxHxF' \
    --offset '95' \
    --sortBy 'iuNba0Fw' \
    --subType 'RVvUQ0qa' \
    --tags '18ARsD42,ziMgUvaV,19bIKKKJ' \
    --type 'k4lLUTvo' \
    > test.out 2>&1
eval_tap $? 136 'PublicListContentV2' test.out

#- 137 PublicBulkGetContentByIDV2
./ng net.accelbyte.sdk.cli.Main ugc publicBulkGetContentByIDV2 \
    --namespace "$AB_NAMESPACE" \
    --body '{"contentIds": ["91A5cYmT", "p3KiKxhm", "LbEd3Ixl"]}' \
    > test.out 2>&1
eval_tap $? 137 'PublicBulkGetContentByIDV2' test.out

#- 138 PublicGetContentBulkByShareCodesV2
./ng net.accelbyte.sdk.cli.Main ugc publicGetContentBulkByShareCodesV2 \
    --namespace "$AB_NAMESPACE" \
    --body '{"shareCodes": ["rCJfHldf", "UyAROQB1", "nrbO4I47"]}' \
    > test.out 2>&1
eval_tap $? 138 'PublicGetContentBulkByShareCodesV2' test.out

#- 139 PublicGetContentByShareCodeV2
./ng net.accelbyte.sdk.cli.Main ugc publicGetContentByShareCodeV2 \
    --namespace "$AB_NAMESPACE" \
    --shareCode 'EljE1RFO' \
    > test.out 2>&1
eval_tap $? 139 'PublicGetContentByShareCodeV2' test.out

#- 140 PublicGetContentByIDV2
./ng net.accelbyte.sdk.cli.Main ugc publicGetContentByIDV2 \
    --contentId '1XbQ2jsI' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 140 'PublicGetContentByIDV2' test.out

#- 141 PublicAddDownloadCountV2
./ng net.accelbyte.sdk.cli.Main ugc publicAddDownloadCountV2 \
    --contentId 'MePkb4RZ' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 141 'PublicAddDownloadCountV2' test.out

#- 142 PublicListContentDownloaderV2
./ng net.accelbyte.sdk.cli.Main ugc publicListContentDownloaderV2 \
    --contentId 'qeQYCE6D' \
    --namespace "$AB_NAMESPACE" \
    --limit '66' \
    --offset '57' \
    --sortBy 'jqQKrfXR' \
    --userId 'uolNwSQ0' \
    > test.out 2>&1
eval_tap $? 142 'PublicListContentDownloaderV2' test.out

#- 143 PublicListContentLikeV2
./ng net.accelbyte.sdk.cli.Main ugc publicListContentLikeV2 \
    --contentId 'bmGyzwN9' \
    --namespace "$AB_NAMESPACE" \
    --limit '3' \
    --offset '6' \
    --sortBy 'hTrGhgmh' \
    > test.out 2>&1
eval_tap $? 143 'PublicListContentLikeV2' test.out

#- 144 UpdateContentLikeStatusV2
./ng net.accelbyte.sdk.cli.Main ugc updateContentLikeStatusV2 \
    --contentId 'JUrzitS4' \
    --namespace "$AB_NAMESPACE" \
    --body '{"likeStatus": false}' \
    > test.out 2>&1
eval_tap $? 144 'UpdateContentLikeStatusV2' test.out

#- 145 PublicCreateContentV2
./ng net.accelbyte.sdk.cli.Main ugc publicCreateContentV2 \
    --channelId 'DlTI9Mip' \
    --namespace "$AB_NAMESPACE" \
    --userId 'weItRVlc' \
    --body '{"contentType": "3sN7QnjH", "customAttributes": {"gdKlPV8s": {}, "seqnjVCk": {}, "w4D3zyOs": {}}, "fileExtension": "hnO9GZqD", "name": "2HeJaQlq", "subType": "m4cVmlU8", "tags": ["GEEc7s11", "1K9Ef8cC", "9n1d2L1U"], "type": "FP550oWD"}' \
    > test.out 2>&1
eval_tap $? 145 'PublicCreateContentV2' test.out

#- 146 PublicUpdateContentByShareCodeV2
./ng net.accelbyte.sdk.cli.Main ugc publicUpdateContentByShareCodeV2 \
    --channelId 'Z9aCPJoF' \
    --namespace "$AB_NAMESPACE" \
    --shareCode 'Ox0b80cu' \
    --userId 'anqmUS4u' \
    --body '{"customAttributes": {"p9yT1wvz": {}, "7bojQz3I": {}, "E0OfMT9A": {}}, "name": "8hbbPUh3", "subType": "uzE96e4M", "tags": ["206di28n", "McfouFY9", "JIimC8f3"], "type": "6XrisvTa"}' \
    > test.out 2>&1
eval_tap $? 146 'PublicUpdateContentByShareCodeV2' test.out

#- 147 PublicDeleteContentByShareCodeV2
./ng net.accelbyte.sdk.cli.Main ugc publicDeleteContentByShareCodeV2 \
    --channelId 'eLrQqczo' \
    --namespace "$AB_NAMESPACE" \
    --shareCode 'mqiSEhqn' \
    --userId 'QFtxJzm8' \
    > test.out 2>&1
eval_tap $? 147 'PublicDeleteContentByShareCodeV2' test.out

#- 148 PublicDeleteContentV2
./ng net.accelbyte.sdk.cli.Main ugc publicDeleteContentV2 \
    --channelId 'JbBXXjtQ' \
    --contentId 'cuNJJywv' \
    --namespace "$AB_NAMESPACE" \
    --userId 'HDaMz4ZQ' \
    > test.out 2>&1
eval_tap $? 148 'PublicDeleteContentV2' test.out

#- 149 PublicUpdateContentV2
./ng net.accelbyte.sdk.cli.Main ugc publicUpdateContentV2 \
    --channelId 'wGQebgsZ' \
    --contentId 'kNbDCG7R' \
    --namespace "$AB_NAMESPACE" \
    --userId 'v08rVW9S' \
    --body '{"customAttributes": {"Fb9HHQZE": {}, "p8LSZgEF": {}, "V8w30zvF": {}}, "name": "wYejaHdj", "subType": "Dta7cEsj", "tags": ["5cT3J2vX", "Chk6ARbZ", "e3U0ihTN"], "type": "a38Dt1Jq"}' \
    > test.out 2>&1
eval_tap $? 149 'PublicUpdateContentV2' test.out

#- 150 PublicUpdateContentFileLocation
./ng net.accelbyte.sdk.cli.Main ugc publicUpdateContentFileLocation \
    --channelId 'p4xEXOU3' \
    --contentId 'PdvJNALY' \
    --namespace "$AB_NAMESPACE" \
    --userId 'rcdtnxTW' \
    --body '{"fileExtension": "bGtn0gLr", "fileLocation": "yw0E8CcK"}' \
    > test.out 2>&1
eval_tap $? 150 'PublicUpdateContentFileLocation' test.out

#- 151 UpdateContentShareCodeV2
./ng net.accelbyte.sdk.cli.Main ugc updateContentShareCodeV2 \
    --channelId 'ZugJjCm4' \
    --contentId 'V4PAhzza' \
    --namespace "$AB_NAMESPACE" \
    --userId 'FyciYqRf' \
    --body '{"shareCode": "z9pBz4Rn"}' \
    > test.out 2>&1
eval_tap $? 151 'UpdateContentShareCodeV2' test.out

#- 152 PublicGenerateContentUploadURLV2
./ng net.accelbyte.sdk.cli.Main ugc publicGenerateContentUploadURLV2 \
    --channelId 'J9Ohgs9B' \
    --contentId 'XKUOqpxE' \
    --namespace "$AB_NAMESPACE" \
    --userId 'TnLXl7xK' \
    --body '{"contentType": "r19lZIA5", "fileExtension": "dTAaKXB9"}' \
    > test.out 2>&1
eval_tap $? 152 'PublicGenerateContentUploadURLV2' test.out

#- 153 PublicGetContentByUserIDV2
./ng net.accelbyte.sdk.cli.Main ugc publicGetContentByUserIDV2 \
    --namespace "$AB_NAMESPACE" \
    --userId 'TsDVtClB' \
    --limit '44' \
    --offset '31' \
    --sortBy 'dmahjVB6' \
    > test.out 2>&1
eval_tap $? 153 'PublicGetContentByUserIDV2' test.out

#- 154 UpdateScreenshotsV2
./ng net.accelbyte.sdk.cli.Main ugc updateScreenshotsV2 \
    --contentId 'ZO9W2L0P' \
    --namespace "$AB_NAMESPACE" \
    --userId 'dNtpJclA' \
    --body '{"screenshots": [{"description": "WKHgqs6f", "screenshotId": "9Yhu6Tqu"}, {"description": "RzVUHeNa", "screenshotId": "q6Qzk72y"}, {"description": "kYIfcQSe", "screenshotId": "vLgjnDUr"}]}' \
    > test.out 2>&1
eval_tap $? 154 'UpdateScreenshotsV2' test.out

#- 155 UploadContentScreenshotV2
./ng net.accelbyte.sdk.cli.Main ugc uploadContentScreenshotV2 \
    --contentId 'EgltmS9b' \
    --namespace "$AB_NAMESPACE" \
    --userId 'VewDzIHh' \
    --body '{"screenshots": [{"contentType": "cGADLG1X", "description": "umak9U4R", "fileExtension": "pjp"}, {"contentType": "QghY6BZX", "description": "R2qQeFbS", "fileExtension": "jpg"}, {"contentType": "CrsB2yFn", "description": "as2QIlOD", "fileExtension": "jpeg"}]}' \
    > test.out 2>&1
eval_tap $? 155 'UploadContentScreenshotV2' test.out

#- 156 DeleteContentScreenshotV2
./ng net.accelbyte.sdk.cli.Main ugc deleteContentScreenshotV2 \
    --contentId '1di8XntT' \
    --namespace "$AB_NAMESPACE" \
    --screenshotId 'nS2TIUI5' \
    --userId 'fz8U5Z8I' \
    > test.out 2>&1
eval_tap $? 156 'DeleteContentScreenshotV2' test.out

#- 157 PublicGetGroupContentsV2
./ng net.accelbyte.sdk.cli.Main ugc publicGetGroupContentsV2 \
    --groupId 'BgTfu2Rh' \
    --namespace "$AB_NAMESPACE" \
    --userId 'Fm2vr0DP' \
    --limit '30' \
    --offset '85' \
    > test.out 2>&1
eval_tap $? 157 'PublicGetGroupContentsV2' test.out

#- 158 ListUserStagingContents
./ng net.accelbyte.sdk.cli.Main ugc listUserStagingContents \
    --namespace "$AB_NAMESPACE" \
    --userId 'KDit8YbI' \
    --limit '90' \
    --offset '7' \
    --sortBy 'AjqZcgeQ' \
    --status 'uZbEACte' \
    > test.out 2>&1
eval_tap $? 158 'ListUserStagingContents' test.out

#- 159 GetUserStagingContentByID
./ng net.accelbyte.sdk.cli.Main ugc getUserStagingContentByID \
    --contentId '1Rjg1u5t' \
    --namespace "$AB_NAMESPACE" \
    --userId 'nFl5e7Qo' \
    > test.out 2>&1
eval_tap $? 159 'GetUserStagingContentByID' test.out

#- 160 UpdateStagingContent
./ng net.accelbyte.sdk.cli.Main ugc updateStagingContent \
    --contentId 'iQtwvWQA' \
    --namespace "$AB_NAMESPACE" \
    --userId 'rh1S0aDf' \
    --body '{"fileExtension": "fWv4koOr", "fileLocation": "4HVnf6zM"}' \
    > test.out 2>&1
eval_tap $? 160 'UpdateStagingContent' test.out

#- 161 DeleteUserStagingContentByID
./ng net.accelbyte.sdk.cli.Main ugc deleteUserStagingContentByID \
    --contentId 'XtLSnO7S' \
    --namespace "$AB_NAMESPACE" \
    --userId 'PJVpTXIm' \
    > test.out 2>&1
eval_tap $? 161 'DeleteUserStagingContentByID' test.out


rm -f "tmp.dat"

exit $EXIT_CODE