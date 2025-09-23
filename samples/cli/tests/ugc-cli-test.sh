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
    --limit '87' \
    --offset '38' \
    > test.out 2>&1
eval_tap $? 2 'SingleAdminGetChannel' test.out

#- 3 AdminCreateChannel
./ng net.accelbyte.sdk.cli.Main ugc adminCreateChannel \
    --namespace "$AB_NAMESPACE" \
    --body '{"id": "trNBAEea", "name": "nFxzNPXH"}' \
    > test.out 2>&1
eval_tap $? 3 'AdminCreateChannel' test.out

#- 4 SingleAdminUpdateChannel
./ng net.accelbyte.sdk.cli.Main ugc singleAdminUpdateChannel \
    --channelId 'xlr0Yr5H' \
    --namespace "$AB_NAMESPACE" \
    --body '{"name": "7dC67tYk"}' \
    > test.out 2>&1
eval_tap $? 4 'SingleAdminUpdateChannel' test.out

#- 5 SingleAdminDeleteChannel
./ng net.accelbyte.sdk.cli.Main ugc singleAdminDeleteChannel \
    --channelId '3jmcOsup' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 5 'SingleAdminDeleteChannel' test.out

#- 6 AdminUploadContentDirect
eval_tap 0 6 'AdminUploadContentDirect # SKIP deprecated' test.out

#- 7 AdminUploadContentS3
./ng net.accelbyte.sdk.cli.Main ugc adminUploadContentS3 \
    --channelId '11PyQJRQ' \
    --namespace "$AB_NAMESPACE" \
    --body '{"contentType": "2XZwDFFJ", "customAttributes": {"9DFr0a7k": {}, "Srs7YFHb": {}, "ITTtlDgR": {}}, "fileExtension": "XaZ99i0n", "name": "YtJHDbVc", "preview": "QQT0zalR", "previewMetadata": {"previewContentType": "1385Fvet", "previewFileExtension": "1sKD3grf"}, "shareCode": "diM3Y4xY", "subType": "EI6PQfFG", "tags": ["3l2exWMn", "UeakrKHj", "9E5tuwZM"], "type": "Ukj3kWUe"}' \
    > test.out 2>&1
eval_tap $? 7 'AdminUploadContentS3' test.out

#- 8 SingleAdminUpdateContentS3
./ng net.accelbyte.sdk.cli.Main ugc singleAdminUpdateContentS3 \
    --channelId 'F8Q5GSKj' \
    --contentId 'rvJpfHOA' \
    --namespace "$AB_NAMESPACE" \
    --body '{"contentType": "fRn0nICj", "customAttributes": {"ddYDteOc": {}, "00wLT14h": {}, "5WL1xfZO": {}}, "fileExtension": "DMm8m5nt", "name": "4hWTnGLu", "payload": "YEsPKq6v", "preview": "CoJV5Evn", "previewMetadata": {"previewContentType": "j4rPJcrK", "previewFileExtension": "C6NhhVNa"}, "shareCode": "43HDbgj4", "subType": "qp0TUw22", "tags": ["viF83mJR", "EU5NSqIy", "HOW7d99Y"], "type": "E12J81hI", "updateContentFile": true}' \
    > test.out 2>&1
eval_tap $? 8 'SingleAdminUpdateContentS3' test.out

#- 9 AdminSearchChannelSpecificContent
./ng net.accelbyte.sdk.cli.Main ugc adminSearchChannelSpecificContent \
    --channelId 'Pgv15Fa9' \
    --namespace "$AB_NAMESPACE" \
    --creator 'XMDzLzwv' \
    --ishidden 'Pot5BYAk' \
    --isofficial 'pRHJezn3' \
    --limit '54' \
    --name 'mrMZbx9T' \
    --offset '62' \
    --orderby 'XsrpGUt2' \
    --sortby 'r0dfmt1K' \
    --subtype 'o9D6OVSw' \
    --tags 'BvqSXuhi,gEC9mb12,VxaF0vsQ' \
    --type 'qwX4Ny7A' \
    --userId '55qw5kGA' \
    > test.out 2>&1
eval_tap $? 9 'AdminSearchChannelSpecificContent' test.out

#- 10 SingleAdminUpdateContentDirect
eval_tap 0 10 'SingleAdminUpdateContentDirect # SKIP deprecated' test.out

#- 11 SingleAdminDeleteContent
./ng net.accelbyte.sdk.cli.Main ugc singleAdminDeleteContent \
    --channelId 'mFovPsb5' \
    --contentId 'eZcpmFpV' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 11 'SingleAdminDeleteContent' test.out

#- 12 SingleAdminGetContent
./ng net.accelbyte.sdk.cli.Main ugc singleAdminGetContent \
    --namespace "$AB_NAMESPACE" \
    --limit '41' \
    --offset '35' \
    > test.out 2>&1
eval_tap $? 12 'SingleAdminGetContent' test.out

#- 13 AdminGetContentBulk
./ng net.accelbyte.sdk.cli.Main ugc adminGetContentBulk \
    --namespace "$AB_NAMESPACE" \
    --body '{"contentIds": ["Eko3HXDI", "NiOg1RRV", "Mx77n1u2"]}' \
    > test.out 2>&1
eval_tap $? 13 'AdminGetContentBulk' test.out

#- 14 AdminSearchContent
./ng net.accelbyte.sdk.cli.Main ugc adminSearchContent \
    --namespace "$AB_NAMESPACE" \
    --creator 'gNn7WbPa' \
    --ishidden 'B5NQdEMQ' \
    --isofficial '7tFD8UOA' \
    --limit '44' \
    --name 'l0wfISja' \
    --offset '8' \
    --orderby 'Jsl5W2Aq' \
    --sortby 'Q919Ra0l' \
    --subtype '2anaI0tn' \
    --tags 'knv5KCZH,6pnusIZO,2e6CXw8r' \
    --type 'vPWoeyih' \
    --userId 'x9BTLKXU' \
    > test.out 2>&1
eval_tap $? 14 'AdminSearchContent' test.out

#- 15 AdminGetContentBulkByShareCodes
./ng net.accelbyte.sdk.cli.Main ugc adminGetContentBulkByShareCodes \
    --namespace "$AB_NAMESPACE" \
    --body '{"shareCodes": ["sXZJYXIC", "A793HfGi", "5qS2fKPg"]}' \
    > test.out 2>&1
eval_tap $? 15 'AdminGetContentBulkByShareCodes' test.out

#- 16 AdminGetUserContentByShareCode
./ng net.accelbyte.sdk.cli.Main ugc adminGetUserContentByShareCode \
    --namespace "$AB_NAMESPACE" \
    --shareCode 'hMvPkqZO' \
    > test.out 2>&1
eval_tap $? 16 'AdminGetUserContentByShareCode' test.out

#- 17 AdminGetSpecificContent
./ng net.accelbyte.sdk.cli.Main ugc adminGetSpecificContent \
    --contentId 'yQLLxWgR' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 17 'AdminGetSpecificContent' test.out

#- 18 AdminDownloadContentPreview
./ng net.accelbyte.sdk.cli.Main ugc adminDownloadContentPreview \
    --contentId 'XRWYNFqY' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 18 'AdminDownloadContentPreview' test.out

#- 19 RollbackContentVersion
./ng net.accelbyte.sdk.cli.Main ugc rollbackContentVersion \
    --contentId 'JlmnCg0E' \
    --namespace "$AB_NAMESPACE" \
    --versionId 'DRlRnJpC' \
    > test.out 2>&1
eval_tap $? 19 'RollbackContentVersion' test.out

#- 20 AdminUpdateScreenshots
./ng net.accelbyte.sdk.cli.Main ugc adminUpdateScreenshots \
    --contentId 'uxsKvTFE' \
    --namespace "$AB_NAMESPACE" \
    --body '{"screenshots": [{"description": "hhEKxfm6", "screenshotId": "q6XyJurF"}, {"description": "34EA8bxL", "screenshotId": "PV5rDqFg"}, {"description": "70Y5FTd4", "screenshotId": "TTSeJRuF"}]}' \
    > test.out 2>&1
eval_tap $? 20 'AdminUpdateScreenshots' test.out

#- 21 AdminUploadContentScreenshot
./ng net.accelbyte.sdk.cli.Main ugc adminUploadContentScreenshot \
    --contentId 'buMQHbRv' \
    --namespace "$AB_NAMESPACE" \
    --body '{"screenshots": [{"contentType": "NzklA23F", "description": "0hiHQIY9", "fileExtension": "jpg"}, {"contentType": "omJmQ5C7", "description": "LkXEIomR", "fileExtension": "jpeg"}, {"contentType": "C7Cla9W6", "description": "CncUw7wQ", "fileExtension": "jpeg"}]}' \
    > test.out 2>&1
eval_tap $? 21 'AdminUploadContentScreenshot' test.out

#- 22 AdminDeleteContentScreenshot
./ng net.accelbyte.sdk.cli.Main ugc adminDeleteContentScreenshot \
    --contentId 'gfVRwa0V' \
    --namespace "$AB_NAMESPACE" \
    --screenshotId 'TadXpfQs' \
    > test.out 2>&1
eval_tap $? 22 'AdminDeleteContentScreenshot' test.out

#- 23 ListContentVersions
./ng net.accelbyte.sdk.cli.Main ugc listContentVersions \
    --contentId 'v1cKtQgz' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 23 'ListContentVersions' test.out

#- 24 SingleAdminGetAllGroups
./ng net.accelbyte.sdk.cli.Main ugc singleAdminGetAllGroups \
    --namespace "$AB_NAMESPACE" \
    --limit '11' \
    --offset '98' \
    > test.out 2>&1
eval_tap $? 24 'SingleAdminGetAllGroups' test.out

#- 25 AdminCreateGroup
./ng net.accelbyte.sdk.cli.Main ugc adminCreateGroup \
    --namespace "$AB_NAMESPACE" \
    --body '{"contents": ["YBZ5WIaG", "txXs0yUx", "nVRHyLV3"], "name": "eFcHEvCE"}' \
    > test.out 2>&1
eval_tap $? 25 'AdminCreateGroup' test.out

#- 26 SingleAdminGetGroup
./ng net.accelbyte.sdk.cli.Main ugc singleAdminGetGroup \
    --groupId 'WDj57hnM' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 26 'SingleAdminGetGroup' test.out

#- 27 SingleAdminUpdateGroup
./ng net.accelbyte.sdk.cli.Main ugc singleAdminUpdateGroup \
    --groupId 'xum2nXjU' \
    --namespace "$AB_NAMESPACE" \
    --body '{"contents": ["K8x8iTj3", "YwzPRsAf", "FhLt1FHr"], "name": "jn7TWMJ4"}' \
    > test.out 2>&1
eval_tap $? 27 'SingleAdminUpdateGroup' test.out

#- 28 SingleAdminDeleteGroup
./ng net.accelbyte.sdk.cli.Main ugc singleAdminDeleteGroup \
    --groupId 'G3yiay96' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 28 'SingleAdminDeleteGroup' test.out

#- 29 SingleAdminGetGroupContents
./ng net.accelbyte.sdk.cli.Main ugc singleAdminGetGroupContents \
    --groupId 'z1k6fwTU' \
    --namespace "$AB_NAMESPACE" \
    --limit '0' \
    --offset '16' \
    > test.out 2>&1
eval_tap $? 29 'SingleAdminGetGroupContents' test.out

#- 30 AdminGetTag
./ng net.accelbyte.sdk.cli.Main ugc adminGetTag \
    --namespace "$AB_NAMESPACE" \
    --limit '92' \
    --offset '19' \
    > test.out 2>&1
eval_tap $? 30 'AdminGetTag' test.out

#- 31 AdminCreateTag
./ng net.accelbyte.sdk.cli.Main ugc adminCreateTag \
    --namespace "$AB_NAMESPACE" \
    --body '{"tag": "TTLs9NPU"}' \
    > test.out 2>&1
eval_tap $? 31 'AdminCreateTag' test.out

#- 32 AdminUpdateTag
./ng net.accelbyte.sdk.cli.Main ugc adminUpdateTag \
    --namespace "$AB_NAMESPACE" \
    --tagId 'CFIjBiaM' \
    --body '{"tag": "AugBCEwk"}' \
    > test.out 2>&1
eval_tap $? 32 'AdminUpdateTag' test.out

#- 33 AdminDeleteTag
./ng net.accelbyte.sdk.cli.Main ugc adminDeleteTag \
    --namespace "$AB_NAMESPACE" \
    --tagId 'vLTHwusB' \
    > test.out 2>&1
eval_tap $? 33 'AdminDeleteTag' test.out

#- 34 AdminGetType
./ng net.accelbyte.sdk.cli.Main ugc adminGetType \
    --namespace "$AB_NAMESPACE" \
    --limit '53' \
    --offset '39' \
    > test.out 2>&1
eval_tap $? 34 'AdminGetType' test.out

#- 35 AdminCreateType
./ng net.accelbyte.sdk.cli.Main ugc adminCreateType \
    --namespace "$AB_NAMESPACE" \
    --body '{"subtype": ["NL4j7ZlT", "8aOIiUoY", "kLRBm0j4"], "type": "jW98Cn7P"}' \
    > test.out 2>&1
eval_tap $? 35 'AdminCreateType' test.out

#- 36 AdminUpdateType
./ng net.accelbyte.sdk.cli.Main ugc adminUpdateType \
    --namespace "$AB_NAMESPACE" \
    --typeId 'aaH32Ll5' \
    --body '{"subtype": ["v56ymrit", "w1rYTIit", "yCY5NC1l"], "type": "SIrxi360"}' \
    > test.out 2>&1
eval_tap $? 36 'AdminUpdateType' test.out

#- 37 AdminDeleteType
./ng net.accelbyte.sdk.cli.Main ugc adminDeleteType \
    --namespace "$AB_NAMESPACE" \
    --typeId '9efHlpEh' \
    > test.out 2>&1
eval_tap $? 37 'AdminDeleteType' test.out

#- 38 AdminGetChannel
./ng net.accelbyte.sdk.cli.Main ugc adminGetChannel \
    --namespace "$AB_NAMESPACE" \
    --userId 'hppthPmB' \
    --limit '48' \
    --name 'AHWivLcA' \
    --offset '23' \
    > test.out 2>&1
eval_tap $? 38 'AdminGetChannel' test.out

#- 39 AdminDeleteAllUserChannels
./ng net.accelbyte.sdk.cli.Main ugc adminDeleteAllUserChannels \
    --namespace "$AB_NAMESPACE" \
    --userId 'v0XY5Hvj' \
    > test.out 2>&1
eval_tap $? 39 'AdminDeleteAllUserChannels' test.out

#- 40 AdminUpdateChannel
./ng net.accelbyte.sdk.cli.Main ugc adminUpdateChannel \
    --channelId 'T8Sj0La1' \
    --namespace "$AB_NAMESPACE" \
    --userId 'FK0bqWaD' \
    --body '{"name": "6xXqpBXv"}' \
    > test.out 2>&1
eval_tap $? 40 'AdminUpdateChannel' test.out

#- 41 AdminDeleteChannel
./ng net.accelbyte.sdk.cli.Main ugc adminDeleteChannel \
    --channelId 'GNobpZie' \
    --namespace "$AB_NAMESPACE" \
    --userId 'zGbytG8x' \
    > test.out 2>&1
eval_tap $? 41 'AdminDeleteChannel' test.out

#- 42 AdminUpdateContentS3ByShareCode
./ng net.accelbyte.sdk.cli.Main ugc adminUpdateContentS3ByShareCode \
    --channelId 'GCb2BkkR' \
    --namespace "$AB_NAMESPACE" \
    --shareCode '1UpvwXVa' \
    --userId 'IJtqkRvL' \
    --body '{"contentType": "qPss3lkV", "customAttributes": {"CadCuN1h": {}, "07ksYAB6": {}, "94vzl02A": {}}, "fileExtension": "oUGqhosB", "name": "p8Wayhdv", "payload": "HXF3pDKh", "preview": "C6kFkWEN", "previewMetadata": {"previewContentType": "a0IaflLT", "previewFileExtension": "1g1X1GAn"}, "shareCode": "iSttRqFZ", "subType": "JabGkMPl", "tags": ["QEsMRZtI", "RgthxOCJ", "TKFSD7x5"], "type": "gVUa6cBT", "updateContentFile": false}' \
    > test.out 2>&1
eval_tap $? 42 'AdminUpdateContentS3ByShareCode' test.out

#- 43 AdminUpdateContentS3
./ng net.accelbyte.sdk.cli.Main ugc adminUpdateContentS3 \
    --channelId 'kqCptQ3n' \
    --contentId 'ENgaafq7' \
    --namespace "$AB_NAMESPACE" \
    --userId 'h2yR9VIv' \
    --body '{"contentType": "Q8ceLCYu", "customAttributes": {"CDSNCEqr": {}, "CBLV3gMN": {}, "rBoLk2Qg": {}}, "fileExtension": "QDfROuDb", "name": "9UX00zkJ", "payload": "QIzxTNsS", "preview": "FVwsgRjG", "previewMetadata": {"previewContentType": "7L4Vg0aS", "previewFileExtension": "ULlDNWKi"}, "shareCode": "KAqU1uux", "subType": "6YUDJLix", "tags": ["R1xNSw73", "PQ3bGBkN", "adKL2ZUW"], "type": "9CEN9wbO", "updateContentFile": false}' \
    > test.out 2>&1
eval_tap $? 43 'AdminUpdateContentS3' test.out

#- 44 DeleteContentByShareCode
./ng net.accelbyte.sdk.cli.Main ugc deleteContentByShareCode \
    --channelId 'oU0MWS5c' \
    --namespace "$AB_NAMESPACE" \
    --shareCode 'uKNqOHm3' \
    --userId 'g3hPjSfr' \
    > test.out 2>&1
eval_tap $? 44 'DeleteContentByShareCode' test.out

#- 45 AdminUpdateContentDirect
eval_tap 0 45 'AdminUpdateContentDirect # SKIP deprecated' test.out

#- 46 AdminDeleteContent
./ng net.accelbyte.sdk.cli.Main ugc adminDeleteContent \
    --channelId 'IxB8zrUt' \
    --contentId '0qUwsqDe' \
    --namespace "$AB_NAMESPACE" \
    --userId 'lePWdkQh' \
    > test.out 2>&1
eval_tap $? 46 'AdminDeleteContent' test.out

#- 47 AdminGetContent
./ng net.accelbyte.sdk.cli.Main ugc adminGetContent \
    --namespace "$AB_NAMESPACE" \
    --userId 'vOoyyFMV' \
    --limit '37' \
    --offset '9' \
    > test.out 2>&1
eval_tap $? 47 'AdminGetContent' test.out

#- 48 AdminDeleteAllUserContents
./ng net.accelbyte.sdk.cli.Main ugc adminDeleteAllUserContents \
    --namespace "$AB_NAMESPACE" \
    --userId 'bLaJHCMk' \
    > test.out 2>&1
eval_tap $? 48 'AdminDeleteAllUserContents' test.out

#- 49 AdminHideUserContent
./ng net.accelbyte.sdk.cli.Main ugc adminHideUserContent \
    --contentId 'Be7nnpii' \
    --namespace "$AB_NAMESPACE" \
    --userId 'ag4kgz74' \
    --body '{"isHidden": false}' \
    > test.out 2>&1
eval_tap $? 49 'AdminHideUserContent' test.out

#- 50 AdminGetAllGroups
./ng net.accelbyte.sdk.cli.Main ugc adminGetAllGroups \
    --namespace "$AB_NAMESPACE" \
    --userId 'McEbCd6Q' \
    --limit '20' \
    --offset '100' \
    > test.out 2>&1
eval_tap $? 50 'AdminGetAllGroups' test.out

#- 51 AdminDeleteAllUserGroup
./ng net.accelbyte.sdk.cli.Main ugc adminDeleteAllUserGroup \
    --namespace "$AB_NAMESPACE" \
    --userId 'cDy20mAn' \
    > test.out 2>&1
eval_tap $? 51 'AdminDeleteAllUserGroup' test.out

#- 52 AdminGetGroup
./ng net.accelbyte.sdk.cli.Main ugc adminGetGroup \
    --groupId 'ptJxkzyk' \
    --namespace "$AB_NAMESPACE" \
    --userId 'GI5H5eEh' \
    > test.out 2>&1
eval_tap $? 52 'AdminGetGroup' test.out

#- 53 AdminUpdateGroup
./ng net.accelbyte.sdk.cli.Main ugc adminUpdateGroup \
    --groupId 'ztN9VJbq' \
    --namespace "$AB_NAMESPACE" \
    --userId 'ABfNZKRZ' \
    --body '{"contents": ["0nbe9cMP", "MRQT2Jzw", "VzUXRxHg"], "name": "2sH7Wn9K"}' \
    > test.out 2>&1
eval_tap $? 53 'AdminUpdateGroup' test.out

#- 54 AdminDeleteGroup
./ng net.accelbyte.sdk.cli.Main ugc adminDeleteGroup \
    --groupId 'tpNBzGl5' \
    --namespace "$AB_NAMESPACE" \
    --userId 'QZTzI8z7' \
    > test.out 2>&1
eval_tap $? 54 'AdminDeleteGroup' test.out

#- 55 AdminGetGroupContents
./ng net.accelbyte.sdk.cli.Main ugc adminGetGroupContents \
    --groupId 'upZsRHAl' \
    --namespace "$AB_NAMESPACE" \
    --userId 'u5q0V7Tu' \
    --limit '61' \
    --offset '55' \
    > test.out 2>&1
eval_tap $? 55 'AdminGetGroupContents' test.out

#- 56 AdminDeleteAllUserStates
./ng net.accelbyte.sdk.cli.Main ugc adminDeleteAllUserStates \
    --namespace "$AB_NAMESPACE" \
    --userId 'tSdw1Th7' \
    > test.out 2>&1
eval_tap $? 56 'AdminDeleteAllUserStates' test.out

#- 57 SearchChannelSpecificContent
./ng net.accelbyte.sdk.cli.Main ugc searchChannelSpecificContent \
    --channelId 'eqhIJUyc' \
    --namespace "$AB_NAMESPACE" \
    --creator '8v0DJyJa' \
    --ishidden 'wk7xHcbF' \
    --isofficial 'fNpdqs60' \
    --limit '12' \
    --name 'JU2kGyiA' \
    --offset '15' \
    --orderby 'rfYq1C5Y' \
    --sortby 'QLEAcvue' \
    --subtype 'iGAUiYJf' \
    --tags 'YoLq1f6U,dfG6Q9qw,KhEojOuX' \
    --type 'YaHUNn3n' \
    --userId 'tTNGa6Ew' \
    > test.out 2>&1
eval_tap $? 57 'SearchChannelSpecificContent' test.out

#- 58 PublicSearchContent
./ng net.accelbyte.sdk.cli.Main ugc publicSearchContent \
    --namespace "$AB_NAMESPACE" \
    --creator 'vB7xIfLS' \
    --ishidden 'iUNOUaFi' \
    --isofficial 'XSIcoiqj' \
    --limit '53' \
    --name 'uTSa2ZcQ' \
    --offset '20' \
    --orderby 'u1aP15dM' \
    --sortby '9TYmPqZX' \
    --subtype 'XthaTKLW' \
    --tags 'L7JyjtbJ,P5d06QCV,BbL5lcac' \
    --type 'qkRe2ej5' \
    --userId 'VSuUnKhj' \
    > test.out 2>&1
eval_tap $? 58 'PublicSearchContent' test.out

#- 59 PublicGetContentBulk
./ng net.accelbyte.sdk.cli.Main ugc publicGetContentBulk \
    --namespace "$AB_NAMESPACE" \
    --body '{"contentIds": ["vFvrjniE", "61TMVQkE", "nd5NEM5n"]}' \
    > test.out 2>&1
eval_tap $? 59 'PublicGetContentBulk' test.out

#- 60 GetFollowedContent
./ng net.accelbyte.sdk.cli.Main ugc getFollowedContent \
    --namespace "$AB_NAMESPACE" \
    --limit '84' \
    --offset '79' \
    > test.out 2>&1
eval_tap $? 60 'GetFollowedContent' test.out

#- 61 GetLikedContent
./ng net.accelbyte.sdk.cli.Main ugc getLikedContent \
    --namespace "$AB_NAMESPACE" \
    --isofficial  \
    --limit '21' \
    --name '3ILzERvR' \
    --offset '61' \
    --orderby 'C8DE2kZ8' \
    --sortby 'lZtGKmfD' \
    --subtype 'mdljpBzf' \
    --tags '9tH04ksB,Eknb692B,WT1JdEen' \
    --type 'mVwqE6oW' \
    > test.out 2>&1
eval_tap $? 61 'GetLikedContent' test.out

#- 62 PublicGetContentBulkByShareCodes
./ng net.accelbyte.sdk.cli.Main ugc publicGetContentBulkByShareCodes \
    --namespace "$AB_NAMESPACE" \
    --body '{"shareCodes": ["fARLuS2I", "MW0hG8ep", "9dfQ71cP"]}' \
    > test.out 2>&1
eval_tap $? 62 'PublicGetContentBulkByShareCodes' test.out

#- 63 PublicDownloadContentByShareCode
./ng net.accelbyte.sdk.cli.Main ugc publicDownloadContentByShareCode \
    --namespace "$AB_NAMESPACE" \
    --shareCode 'KHNQ9CrW' \
    > test.out 2>&1
eval_tap $? 63 'PublicDownloadContentByShareCode' test.out

#- 64 PublicDownloadContentByContentID
./ng net.accelbyte.sdk.cli.Main ugc publicDownloadContentByContentID \
    --contentId 'rPOPrF0k' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 64 'PublicDownloadContentByContentID' test.out

#- 65 AddDownloadCount
./ng net.accelbyte.sdk.cli.Main ugc addDownloadCount \
    --contentId 'l0HaHBWP' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 65 'AddDownloadCount' test.out

#- 66 UpdateContentLikeStatus
./ng net.accelbyte.sdk.cli.Main ugc updateContentLikeStatus \
    --contentId 'JK2Ovatp' \
    --namespace "$AB_NAMESPACE" \
    --body '{"likeStatus": false}' \
    > test.out 2>&1
eval_tap $? 66 'UpdateContentLikeStatus' test.out

#- 67 PublicDownloadContentPreview
./ng net.accelbyte.sdk.cli.Main ugc publicDownloadContentPreview \
    --contentId 'EOKHDFKY' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 67 'PublicDownloadContentPreview' test.out

#- 68 GetTag
./ng net.accelbyte.sdk.cli.Main ugc getTag \
    --namespace "$AB_NAMESPACE" \
    --limit '9' \
    --offset '94' \
    > test.out 2>&1
eval_tap $? 68 'GetTag' test.out

#- 69 GetType
./ng net.accelbyte.sdk.cli.Main ugc getType \
    --namespace "$AB_NAMESPACE" \
    --limit '43' \
    --offset '30' \
    > test.out 2>&1
eval_tap $? 69 'GetType' test.out

#- 70 PublicSearchCreator
./ng net.accelbyte.sdk.cli.Main ugc publicSearchCreator \
    --namespace "$AB_NAMESPACE" \
    --limit '22' \
    --offset '74' \
    --orderby 'Qn27jYaz' \
    --sortby 'edGOIppx' \
    > test.out 2>&1
eval_tap $? 70 'PublicSearchCreator' test.out

#- 71 GetFollowedUsers
./ng net.accelbyte.sdk.cli.Main ugc getFollowedUsers \
    --namespace "$AB_NAMESPACE" \
    --limit '83' \
    --offset '4' \
    > test.out 2>&1
eval_tap $? 71 'GetFollowedUsers' test.out

#- 72 PublicGetCreator
./ng net.accelbyte.sdk.cli.Main ugc publicGetCreator \
    --namespace "$AB_NAMESPACE" \
    --userId 'emnaMuNr' \
    > test.out 2>&1
eval_tap $? 72 'PublicGetCreator' test.out

#- 73 GetChannels
./ng net.accelbyte.sdk.cli.Main ugc getChannels \
    --namespace "$AB_NAMESPACE" \
    --userId 's9n1ole2' \
    --limit '100' \
    --name 'i3WtukGO' \
    --offset '89' \
    > test.out 2>&1
eval_tap $? 73 'GetChannels' test.out

#- 74 PublicCreateChannel
./ng net.accelbyte.sdk.cli.Main ugc publicCreateChannel \
    --namespace "$AB_NAMESPACE" \
    --userId 'KCgBtSod' \
    --body '{"name": "uJtaBUYP"}' \
    > test.out 2>&1
eval_tap $? 74 'PublicCreateChannel' test.out

#- 75 DeleteAllUserChannel
./ng net.accelbyte.sdk.cli.Main ugc deleteAllUserChannel \
    --namespace "$AB_NAMESPACE" \
    --userId 'V4U1Kds0' \
    > test.out 2>&1
eval_tap $? 75 'DeleteAllUserChannel' test.out

#- 76 UpdateChannel
./ng net.accelbyte.sdk.cli.Main ugc updateChannel \
    --channelId 'gMwIIeY6' \
    --namespace "$AB_NAMESPACE" \
    --userId 'vYWeIgcl' \
    --body '{"name": "QEJ3jNaU"}' \
    > test.out 2>&1
eval_tap $? 76 'UpdateChannel' test.out

#- 77 DeleteChannel
./ng net.accelbyte.sdk.cli.Main ugc deleteChannel \
    --channelId 'z5cmfcRI' \
    --namespace "$AB_NAMESPACE" \
    --userId 'smhsHdYW' \
    > test.out 2>&1
eval_tap $? 77 'DeleteChannel' test.out

#- 78 CreateContentDirect
eval_tap 0 78 'CreateContentDirect # SKIP deprecated' test.out

#- 79 CreateContentS3
./ng net.accelbyte.sdk.cli.Main ugc createContentS3 \
    --channelId '9AVW14Th' \
    --namespace "$AB_NAMESPACE" \
    --userId 'mXoXpyZA' \
    --body '{"contentType": "4Aw4NC1P", "customAttributes": {"pYIppa9b": {}, "ToLobsCc": {}, "qKaS8GdD": {}}, "fileExtension": "CyGgsDNZ", "name": "HMLeecBH", "preview": "KG0DVWKo", "previewMetadata": {"previewContentType": "Nmc4RuUb", "previewFileExtension": "J76fF6x2"}, "subType": "gSKBcnKj", "tags": ["zArbV8Da", "quhcxqes", "ZrbfioFU"], "type": "flmLy9t5"}' \
    > test.out 2>&1
eval_tap $? 79 'CreateContentS3' test.out

#- 80 PublicUpdateContentByShareCode
./ng net.accelbyte.sdk.cli.Main ugc publicUpdateContentByShareCode \
    --channelId 'iIN6v36c' \
    --namespace "$AB_NAMESPACE" \
    --shareCode 'ZuWYJTjV' \
    --userId 'ti9gMNOK' \
    --body '{"contentType": "gcBrirr4", "customAttributes": {"bteYXiiI": {}, "kxrE16e0": {}, "v3MDAXj9": {}}, "fileExtension": "wha2vn64", "name": "QtRoolxh", "payload": "YKSi8qpY", "preview": "CXLR7BiV", "previewMetadata": {"previewContentType": "MRhp3JjK", "previewFileExtension": "uJuqKzXI"}, "subType": "5HVjgsOe", "tags": ["kBqBEX6M", "cggC4fGx", "BiCI2Zut"], "type": "3zYU7QBz", "updateContentFile": false}' \
    > test.out 2>&1
eval_tap $? 80 'PublicUpdateContentByShareCode' test.out

#- 81 UpdateContentS3
./ng net.accelbyte.sdk.cli.Main ugc updateContentS3 \
    --channelId 'OsUBXgXY' \
    --contentId '2ygeTwpl' \
    --namespace "$AB_NAMESPACE" \
    --userId 'KKduO5vK' \
    --body '{"contentType": "XRGUJp0c", "customAttributes": {"tB2rpaiQ": {}, "HTFFgVFv": {}, "S2feTHRv": {}}, "fileExtension": "TYLy96uL", "name": "FNj4NeEP", "payload": "OrUa2TsG", "preview": "NkO9dexG", "previewMetadata": {"previewContentType": "GgP2HqUI", "previewFileExtension": "mYcvRILu"}, "subType": "wbeo2Dpj", "tags": ["7Zvb9jQh", "OQb2Adeu", "SskUmehQ"], "type": "Ef9pRJVj", "updateContentFile": true}' \
    > test.out 2>&1
eval_tap $? 81 'UpdateContentS3' test.out

#- 82 PublicDeleteContentByShareCode
./ng net.accelbyte.sdk.cli.Main ugc publicDeleteContentByShareCode \
    --channelId 'O7Ei7Tbo' \
    --namespace "$AB_NAMESPACE" \
    --shareCode 'XMxlLemd' \
    --userId 'pthhz7jV' \
    > test.out 2>&1
eval_tap $? 82 'PublicDeleteContentByShareCode' test.out

#- 83 UpdateContentDirect
eval_tap 0 83 'UpdateContentDirect # SKIP deprecated' test.out

#- 84 DeleteContent
./ng net.accelbyte.sdk.cli.Main ugc deleteContent \
    --channelId '4CLKesJR' \
    --contentId 'eAyAHL2Q' \
    --namespace "$AB_NAMESPACE" \
    --userId 'OBlz4zib' \
    > test.out 2>&1
eval_tap $? 84 'DeleteContent' test.out

#- 85 UpdateContentShareCode
./ng net.accelbyte.sdk.cli.Main ugc updateContentShareCode \
    --channelId 'ykMlJAFl' \
    --contentId 'hyugF3ns' \
    --namespace "$AB_NAMESPACE" \
    --userId 'i2IRiTqr' \
    --body '{"shareCode": "DXu0sez2"}' \
    > test.out 2>&1
eval_tap $? 85 'UpdateContentShareCode' test.out

#- 86 PublicGetUserContent
./ng net.accelbyte.sdk.cli.Main ugc publicGetUserContent \
    --namespace "$AB_NAMESPACE" \
    --userId 'i4QPRoQd' \
    --limit '71' \
    --offset '33' \
    > test.out 2>&1
eval_tap $? 86 'PublicGetUserContent' test.out

#- 87 DeleteAllUserContents
./ng net.accelbyte.sdk.cli.Main ugc deleteAllUserContents \
    --namespace "$AB_NAMESPACE" \
    --userId 'zvHlFG0g' \
    > test.out 2>&1
eval_tap $? 87 'DeleteAllUserContents' test.out

#- 88 UpdateScreenshots
./ng net.accelbyte.sdk.cli.Main ugc updateScreenshots \
    --contentId 'dJhY2tSn' \
    --namespace "$AB_NAMESPACE" \
    --userId 'Fs4BHD6p' \
    --body '{"screenshots": [{"description": "Nf8RdRbZ", "screenshotId": "RigjHmK5"}, {"description": "zYYUMS7U", "screenshotId": "sviIlJYJ"}, {"description": "RaFjlbKb", "screenshotId": "6FKxxLY6"}]}' \
    > test.out 2>&1
eval_tap $? 88 'UpdateScreenshots' test.out

#- 89 UploadContentScreenshot
./ng net.accelbyte.sdk.cli.Main ugc uploadContentScreenshot \
    --contentId 'zZNTHgkz' \
    --namespace "$AB_NAMESPACE" \
    --userId 'usc7ONFR' \
    --body '{"screenshots": [{"contentType": "YiFc7r5I", "description": "Eq5RNTCQ", "fileExtension": "pjp"}, {"contentType": "sgsOYc8X", "description": "qkK4XVGT", "fileExtension": "bmp"}, {"contentType": "YDZBHuKQ", "description": "tF3vW6bT", "fileExtension": "jpeg"}]}' \
    > test.out 2>&1
eval_tap $? 89 'UploadContentScreenshot' test.out

#- 90 DeleteContentScreenshot
./ng net.accelbyte.sdk.cli.Main ugc deleteContentScreenshot \
    --contentId '0gvwG36w' \
    --namespace "$AB_NAMESPACE" \
    --screenshotId 'xTIgB6sO' \
    --userId 'jwrchUe2' \
    > test.out 2>&1
eval_tap $? 90 'DeleteContentScreenshot' test.out

#- 91 UpdateUserFollowStatus
./ng net.accelbyte.sdk.cli.Main ugc updateUserFollowStatus \
    --namespace "$AB_NAMESPACE" \
    --userId '8KaIHSWE' \
    --body '{"followStatus": true}' \
    > test.out 2>&1
eval_tap $? 91 'UpdateUserFollowStatus' test.out

#- 92 GetPublicFollowers
./ng net.accelbyte.sdk.cli.Main ugc getPublicFollowers \
    --namespace "$AB_NAMESPACE" \
    --userId '1P1hm0ww' \
    --limit '39' \
    --offset '98' \
    > test.out 2>&1
eval_tap $? 92 'GetPublicFollowers' test.out

#- 93 GetPublicFollowing
./ng net.accelbyte.sdk.cli.Main ugc getPublicFollowing \
    --namespace "$AB_NAMESPACE" \
    --userId 'gB2exMZn' \
    --limit '9' \
    --offset '1' \
    > test.out 2>&1
eval_tap $? 93 'GetPublicFollowing' test.out

#- 94 GetGroups
./ng net.accelbyte.sdk.cli.Main ugc getGroups \
    --namespace "$AB_NAMESPACE" \
    --userId 'LjmAoV0e' \
    --limit '59' \
    --offset '16' \
    > test.out 2>&1
eval_tap $? 94 'GetGroups' test.out

#- 95 CreateGroup
./ng net.accelbyte.sdk.cli.Main ugc createGroup \
    --namespace "$AB_NAMESPACE" \
    --userId 'TZos24PC' \
    --body '{"contents": ["qi5MhUJU", "JFvQDuL6", "QbCRA0w8"], "name": "kuBag9KO"}' \
    > test.out 2>&1
eval_tap $? 95 'CreateGroup' test.out

#- 96 DeleteAllUserGroup
./ng net.accelbyte.sdk.cli.Main ugc deleteAllUserGroup \
    --namespace "$AB_NAMESPACE" \
    --userId 'jSqdf8jc' \
    > test.out 2>&1
eval_tap $? 96 'DeleteAllUserGroup' test.out

#- 97 GetGroup
./ng net.accelbyte.sdk.cli.Main ugc getGroup \
    --groupId '9sMGDklu' \
    --namespace "$AB_NAMESPACE" \
    --userId 'ppy8V9Cm' \
    > test.out 2>&1
eval_tap $? 97 'GetGroup' test.out

#- 98 UpdateGroup
./ng net.accelbyte.sdk.cli.Main ugc updateGroup \
    --groupId 'pJ65nMm0' \
    --namespace "$AB_NAMESPACE" \
    --userId 'zopn8kOU' \
    --body '{"contents": ["RWkVGW8D", "ttoswVzZ", "ZkbM6LxT"], "name": "HOHvxI4x"}' \
    > test.out 2>&1
eval_tap $? 98 'UpdateGroup' test.out

#- 99 DeleteGroup
./ng net.accelbyte.sdk.cli.Main ugc deleteGroup \
    --groupId 'zQY88Mbz' \
    --namespace "$AB_NAMESPACE" \
    --userId '7dIEnSe4' \
    > test.out 2>&1
eval_tap $? 99 'DeleteGroup' test.out

#- 100 GetGroupContent
./ng net.accelbyte.sdk.cli.Main ugc getGroupContent \
    --groupId 'X34zNMd5' \
    --namespace "$AB_NAMESPACE" \
    --userId 'mZsnxQWY' \
    --limit '14' \
    --offset '62' \
    > test.out 2>&1
eval_tap $? 100 'GetGroupContent' test.out

#- 101 DeleteAllUserStates
./ng net.accelbyte.sdk.cli.Main ugc deleteAllUserStates \
    --namespace "$AB_NAMESPACE" \
    --userId 'xDB1DlPq' \
    > test.out 2>&1
eval_tap $? 101 'DeleteAllUserStates' test.out

#- 102 AdminGetContentByChannelIDV2
./ng net.accelbyte.sdk.cli.Main ugc adminGetContentByChannelIDV2 \
    --channelId 'AdZAoOtV' \
    --namespace "$AB_NAMESPACE" \
    --limit '21' \
    --name 'JnxXN960' \
    --offset '51' \
    --sortBy 'fRBacWRr' \
    > test.out 2>&1
eval_tap $? 102 'AdminGetContentByChannelIDV2' test.out

#- 103 AdminCreateContentV2
./ng net.accelbyte.sdk.cli.Main ugc adminCreateContentV2 \
    --channelId 'f66gQljg' \
    --namespace "$AB_NAMESPACE" \
    --body '{"contentType": "LjOGR1eG", "customAttributes": {"qeCzDI2E": {}, "797EyRlw": {}, "0r9F78YB": {}}, "fileExtension": "ZcErcp4l", "name": "JCXSwNPt", "shareCode": "VgDpkO5P", "subType": "PtOJ62QT", "tags": ["ql1b1XdT", "foh870Rl", "0G2lHSQL"], "type": "jBmQ8Xlq"}' \
    > test.out 2>&1
eval_tap $? 103 'AdminCreateContentV2' test.out

#- 104 AdminDeleteOfficialContentV2
./ng net.accelbyte.sdk.cli.Main ugc adminDeleteOfficialContentV2 \
    --channelId 'ym04esPM' \
    --contentId 'SEKhioBS' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 104 'AdminDeleteOfficialContentV2' test.out

#- 105 AdminUpdateOfficialContentV2
./ng net.accelbyte.sdk.cli.Main ugc adminUpdateOfficialContentV2 \
    --channelId 'sAqUXXR3' \
    --contentId 'm98NwOFz' \
    --namespace "$AB_NAMESPACE" \
    --body '{"customAttributes": {"Z5NUaNLn": {}, "76Dzvcde": {}, "V88xr2lE": {}}, "name": "2A7kHUuD", "shareCode": "5QmrdkDp", "subType": "EwaqkCEH", "tags": ["37ahQeD4", "3dhi4Wdy", "L7bteTMQ"], "type": "ke75uV9t"}' \
    > test.out 2>&1
eval_tap $? 105 'AdminUpdateOfficialContentV2' test.out

#- 106 AdminCopyContent
./ng net.accelbyte.sdk.cli.Main ugc adminCopyContent \
    --channelId 'D1zYDwJm' \
    --contentId 'UCe7dT7u' \
    --namespace "$AB_NAMESPACE" \
    --body '{"customAttributes": {"NUtxAagV": {}, "NBL7mV2p": {}, "8tS3avyn": {}}, "name": "HcX3M4Xn", "subType": "EQThlp6b", "tags": ["cqdvi9R7", "pia7o8r4", "jhEsiTGY"], "targetChannelId": "wJWqxlX0", "type": "pWHy5QG5"}' \
    > test.out 2>&1
eval_tap $? 106 'AdminCopyContent' test.out

#- 107 AdminUpdateOfficialContentFileLocation
./ng net.accelbyte.sdk.cli.Main ugc adminUpdateOfficialContentFileLocation \
    --channelId '2CDK0KEO' \
    --contentId 'XKZ8UUZf' \
    --namespace "$AB_NAMESPACE" \
    --body '{"fileExtension": "mgclyraB", "fileLocation": "SAh8mwxO"}' \
    > test.out 2>&1
eval_tap $? 107 'AdminUpdateOfficialContentFileLocation' test.out

#- 108 AdminGenerateOfficialContentUploadURLV2
./ng net.accelbyte.sdk.cli.Main ugc adminGenerateOfficialContentUploadURLV2 \
    --channelId 'a4Yw84nT' \
    --contentId 'ks3QLYMr' \
    --namespace "$AB_NAMESPACE" \
    --body '{"contentType": "raeVeelZ", "fileExtension": "h18VAHna"}' \
    > test.out 2>&1
eval_tap $? 108 'AdminGenerateOfficialContentUploadURLV2' test.out

#- 109 AdminGetConfigs
./ng net.accelbyte.sdk.cli.Main ugc adminGetConfigs \
    --namespace "$AB_NAMESPACE" \
    --limit '16' \
    --offset '64' \
    > test.out 2>&1
eval_tap $? 109 'AdminGetConfigs' test.out

#- 110 AdminUpdateConfig
./ng net.accelbyte.sdk.cli.Main ugc adminUpdateConfig \
    --key 'xVdnBMcm' \
    --namespace "$AB_NAMESPACE" \
    --body '{"value": "5aPi0RbN"}' \
    > test.out 2>&1
eval_tap $? 110 'AdminUpdateConfig' test.out

#- 111 AdminListContentV2
./ng net.accelbyte.sdk.cli.Main ugc adminListContentV2 \
    --namespace "$AB_NAMESPACE" \
    --isOfficial  \
    --limit '87' \
    --name 'g3hW6cjw' \
    --offset '7' \
    --sortBy 'JapOmAor' \
    --subType 'RektmYbl' \
    --tags '3r28Ki2U,85qElmwy,bZkK18c1' \
    --type '2XG3lV0L' \
    > test.out 2>&1
eval_tap $? 111 'AdminListContentV2' test.out

#- 112 AdminBulkGetContentByIDsV2
./ng net.accelbyte.sdk.cli.Main ugc adminBulkGetContentByIDsV2 \
    --namespace "$AB_NAMESPACE" \
    --body '{"contentIds": ["pK4Wfr6G", "5LbsJFUu", "dF0rL10x"]}' \
    > test.out 2>&1
eval_tap $? 112 'AdminBulkGetContentByIDsV2' test.out

#- 113 AdminGetContentBulkByShareCodesV2
./ng net.accelbyte.sdk.cli.Main ugc adminGetContentBulkByShareCodesV2 \
    --namespace "$AB_NAMESPACE" \
    --body '{"shareCodes": ["fXJzbrWB", "lQI2cpCN", "aSSYHdCH"]}' \
    > test.out 2>&1
eval_tap $? 113 'AdminGetContentBulkByShareCodesV2' test.out

#- 114 AdminGetContentByShareCodeV2
./ng net.accelbyte.sdk.cli.Main ugc adminGetContentByShareCodeV2 \
    --namespace "$AB_NAMESPACE" \
    --shareCode 'UZIe5Eqs' \
    > test.out 2>&1
eval_tap $? 114 'AdminGetContentByShareCodeV2' test.out

#- 115 AdminGetContentByContentIDV2
./ng net.accelbyte.sdk.cli.Main ugc adminGetContentByContentIDV2 \
    --contentId 'nTJyyef8' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 115 'AdminGetContentByContentIDV2' test.out

#- 116 RollbackContentVersionV2
./ng net.accelbyte.sdk.cli.Main ugc rollbackContentVersionV2 \
    --contentId 'KzlwT1QW' \
    --namespace "$AB_NAMESPACE" \
    --versionId 'uK9lFTWC' \
    > test.out 2>&1
eval_tap $? 116 'RollbackContentVersionV2' test.out

#- 117 AdminUpdateScreenshotsV2
./ng net.accelbyte.sdk.cli.Main ugc adminUpdateScreenshotsV2 \
    --contentId '4hTIvYVg' \
    --namespace "$AB_NAMESPACE" \
    --body '{"screenshots": [{"description": "ertEtNpe", "screenshotId": "NPY3qsEE"}, {"description": "FCMVbBu6", "screenshotId": "9SVEVhth"}, {"description": "aAay7T67", "screenshotId": "k05EqFDq"}]}' \
    > test.out 2>&1
eval_tap $? 117 'AdminUpdateScreenshotsV2' test.out

#- 118 AdminUploadContentScreenshotV2
./ng net.accelbyte.sdk.cli.Main ugc adminUploadContentScreenshotV2 \
    --contentId 'RHeNaPiw' \
    --namespace "$AB_NAMESPACE" \
    --body '{"screenshots": [{"contentType": "GRf9oimx", "description": "n6YjnWxo", "fileExtension": "pjp"}, {"contentType": "wI2qGYLo", "description": "iJWyjgdx", "fileExtension": "jpg"}, {"contentType": "pWjzB2L5", "description": "C45x7447", "fileExtension": "jfif"}]}' \
    > test.out 2>&1
eval_tap $? 118 'AdminUploadContentScreenshotV2' test.out

#- 119 AdminDeleteContentScreenshotV2
./ng net.accelbyte.sdk.cli.Main ugc adminDeleteContentScreenshotV2 \
    --contentId 'pisBmDMS' \
    --namespace "$AB_NAMESPACE" \
    --screenshotId '1W9heLRw' \
    > test.out 2>&1
eval_tap $? 119 'AdminDeleteContentScreenshotV2' test.out

#- 120 ListContentVersionsV2
./ng net.accelbyte.sdk.cli.Main ugc listContentVersionsV2 \
    --contentId 'gWLt9fIE' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 120 'ListContentVersionsV2' test.out

#- 121 AdminGetOfficialGroupContentsV2
./ng net.accelbyte.sdk.cli.Main ugc adminGetOfficialGroupContentsV2 \
    --groupId 'BzZVoWyG' \
    --namespace "$AB_NAMESPACE" \
    --limit '11' \
    --offset '40' \
    > test.out 2>&1
eval_tap $? 121 'AdminGetOfficialGroupContentsV2' test.out

#- 122 AdminListStagingContents
./ng net.accelbyte.sdk.cli.Main ugc adminListStagingContents \
    --namespace "$AB_NAMESPACE" \
    --limit '50' \
    --offset '85' \
    --sortBy 'hxYGpTG6' \
    --status 'CppAdHHk' \
    > test.out 2>&1
eval_tap $? 122 'AdminListStagingContents' test.out

#- 123 AdminGetStagingContentByID
./ng net.accelbyte.sdk.cli.Main ugc adminGetStagingContentByID \
    --contentId 'MgiFlEZv' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 123 'AdminGetStagingContentByID' test.out

#- 124 AdminApproveStagingContent
./ng net.accelbyte.sdk.cli.Main ugc adminApproveStagingContent \
    --contentId 'pM5Tr9wG' \
    --namespace "$AB_NAMESPACE" \
    --body '{"approved": false, "note": "UNW8u51k"}' \
    > test.out 2>&1
eval_tap $? 124 'AdminApproveStagingContent' test.out

#- 125 AdminUpdateContentByShareCodeV2
./ng net.accelbyte.sdk.cli.Main ugc adminUpdateContentByShareCodeV2 \
    --channelId 'XyPxKBUT' \
    --namespace "$AB_NAMESPACE" \
    --shareCode 'QZIYdL3c' \
    --userId 'hy3c77ba' \
    --body '{"customAttributes": {"SRueEKVo": {}, "nTiZm5v3": {}, "BK1dd6TI": {}}, "name": "sQnGGBpG", "shareCode": "rZToUEuX", "subType": "Q153tS4p", "tags": ["413WKEV3", "UFzuivFt", "k9hnaBjr"], "type": "nADIlDTT"}' \
    > test.out 2>&1
eval_tap $? 125 'AdminUpdateContentByShareCodeV2' test.out

#- 126 AdminDeleteContentByShareCodeV2
./ng net.accelbyte.sdk.cli.Main ugc adminDeleteContentByShareCodeV2 \
    --channelId 'sELtUkwD' \
    --namespace "$AB_NAMESPACE" \
    --shareCode 'TNroQu7S' \
    --userId 'oC5nV4d9' \
    > test.out 2>&1
eval_tap $? 126 'AdminDeleteContentByShareCodeV2' test.out

#- 127 AdminDeleteUserContentV2
./ng net.accelbyte.sdk.cli.Main ugc adminDeleteUserContentV2 \
    --channelId '4MwXbFRc' \
    --contentId 'RuRtmb46' \
    --namespace "$AB_NAMESPACE" \
    --userId 'SWEK3UN5' \
    > test.out 2>&1
eval_tap $? 127 'AdminDeleteUserContentV2' test.out

#- 128 AdminUpdateUserContentV2
./ng net.accelbyte.sdk.cli.Main ugc adminUpdateUserContentV2 \
    --channelId '6NQTKEK7' \
    --contentId '3z7GBo6X' \
    --namespace "$AB_NAMESPACE" \
    --userId 'qPpX06lW' \
    --body '{"customAttributes": {"gWBxN6zy": {}, "3hnhtbow": {}, "kRxmb0Tl": {}}, "name": "TLKHRhLP", "shareCode": "8fvpM3jk", "subType": "6xAwBDkL", "tags": ["fFBg16Xg", "vmO3vcMr", "6ewgQYBX"], "type": "LghgOtZa"}' \
    > test.out 2>&1
eval_tap $? 128 'AdminUpdateUserContentV2' test.out

#- 129 AdminUpdateUserContentFileLocation
./ng net.accelbyte.sdk.cli.Main ugc adminUpdateUserContentFileLocation \
    --channelId 'PTMfo2Lt' \
    --contentId 'GVd7yJfm' \
    --namespace "$AB_NAMESPACE" \
    --userId 'idWxyz9L' \
    --body '{"fileExtension": "KI6Ow7wg", "fileLocation": "3zovAORY"}' \
    > test.out 2>&1
eval_tap $? 129 'AdminUpdateUserContentFileLocation' test.out

#- 130 AdminGenerateUserContentUploadURLV2
./ng net.accelbyte.sdk.cli.Main ugc adminGenerateUserContentUploadURLV2 \
    --channelId 'bpabLGss' \
    --contentId 'aKnGUXGQ' \
    --namespace "$AB_NAMESPACE" \
    --userId '25PTUZq2' \
    --body '{"contentType": "jQ5hizzI", "fileExtension": "zVHIAyo4"}' \
    > test.out 2>&1
eval_tap $? 130 'AdminGenerateUserContentUploadURLV2' test.out

#- 131 AdminGetContentByUserIDV2
./ng net.accelbyte.sdk.cli.Main ugc adminGetContentByUserIDV2 \
    --namespace "$AB_NAMESPACE" \
    --userId 'iOxhgPoy' \
    --limit '82' \
    --offset '6' \
    --sortBy 'GQmDNlyg' \
    > test.out 2>&1
eval_tap $? 131 'AdminGetContentByUserIDV2' test.out

#- 132 AdminUpdateContentHideStatusV2
./ng net.accelbyte.sdk.cli.Main ugc adminUpdateContentHideStatusV2 \
    --contentId '1SKida3E' \
    --namespace "$AB_NAMESPACE" \
    --userId 'T5a6nX2L' \
    --body '{"isHidden": true}' \
    > test.out 2>&1
eval_tap $? 132 'AdminUpdateContentHideStatusV2' test.out

#- 133 AdminGetUserGroupContentsV2
./ng net.accelbyte.sdk.cli.Main ugc adminGetUserGroupContentsV2 \
    --groupId '1rMlkFhX' \
    --namespace "$AB_NAMESPACE" \
    --userId 'I5UziS7j' \
    --limit '42' \
    --offset '97' \
    > test.out 2>&1
eval_tap $? 133 'AdminGetUserGroupContentsV2' test.out

#- 134 AdminListUserStagingContents
./ng net.accelbyte.sdk.cli.Main ugc adminListUserStagingContents \
    --namespace "$AB_NAMESPACE" \
    --userId 'TexqlJEI' \
    --limit '87' \
    --offset '26' \
    --sortBy 'QFeOObPV' \
    --status '9Q8nPhRR' \
    > test.out 2>&1
eval_tap $? 134 'AdminListUserStagingContents' test.out

#- 135 PublicGetContentByChannelIDV2
./ng net.accelbyte.sdk.cli.Main ugc publicGetContentByChannelIDV2 \
    --channelId 'ote3qnq9' \
    --namespace "$AB_NAMESPACE" \
    --limit '47' \
    --name 'qfdknUz9' \
    --offset '43' \
    --sortBy 'NRF7uQmb' \
    > test.out 2>&1
eval_tap $? 135 'PublicGetContentByChannelIDV2' test.out

#- 136 PublicListContentV2
./ng net.accelbyte.sdk.cli.Main ugc publicListContentV2 \
    --namespace "$AB_NAMESPACE" \
    --isOfficial  \
    --limit '17' \
    --name 'vmSM8xdl' \
    --offset '89' \
    --sortBy 'TnsCeMD5' \
    --subType '9Nu5eTBx' \
    --tags 'tVfvYjfI,2Wx00j00,s1pDVOvv' \
    --type 'kZplzGig' \
    > test.out 2>&1
eval_tap $? 136 'PublicListContentV2' test.out

#- 137 PublicBulkGetContentByIDV2
./ng net.accelbyte.sdk.cli.Main ugc publicBulkGetContentByIDV2 \
    --namespace "$AB_NAMESPACE" \
    --body '{"contentIds": ["wNbXL4qJ", "P5A8Ll3t", "klzV71Sy"]}' \
    > test.out 2>&1
eval_tap $? 137 'PublicBulkGetContentByIDV2' test.out

#- 138 PublicGetContentBulkByShareCodesV2
./ng net.accelbyte.sdk.cli.Main ugc publicGetContentBulkByShareCodesV2 \
    --namespace "$AB_NAMESPACE" \
    --body '{"shareCodes": ["1eR0e6Gg", "UPbLaBIj", "3Rb5iW0q"]}' \
    > test.out 2>&1
eval_tap $? 138 'PublicGetContentBulkByShareCodesV2' test.out

#- 139 PublicGetContentByShareCodeV2
./ng net.accelbyte.sdk.cli.Main ugc publicGetContentByShareCodeV2 \
    --namespace "$AB_NAMESPACE" \
    --shareCode 'hTR3qnf8' \
    > test.out 2>&1
eval_tap $? 139 'PublicGetContentByShareCodeV2' test.out

#- 140 PublicGetContentByIDV2
./ng net.accelbyte.sdk.cli.Main ugc publicGetContentByIDV2 \
    --contentId 'BQHpLEXv' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 140 'PublicGetContentByIDV2' test.out

#- 141 PublicAddDownloadCountV2
./ng net.accelbyte.sdk.cli.Main ugc publicAddDownloadCountV2 \
    --contentId 'Ds3ctFPs' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 141 'PublicAddDownloadCountV2' test.out

#- 142 PublicListContentDownloaderV2
./ng net.accelbyte.sdk.cli.Main ugc publicListContentDownloaderV2 \
    --contentId 'Bd0NJsqb' \
    --namespace "$AB_NAMESPACE" \
    --limit '58' \
    --offset '32' \
    --sortBy 'WrebPfZT' \
    --userId 'A9kuEh1O' \
    > test.out 2>&1
eval_tap $? 142 'PublicListContentDownloaderV2' test.out

#- 143 PublicListContentLikeV2
./ng net.accelbyte.sdk.cli.Main ugc publicListContentLikeV2 \
    --contentId 'sStwwfsC' \
    --namespace "$AB_NAMESPACE" \
    --limit '49' \
    --offset '35' \
    --sortBy 'qie8wmSM' \
    > test.out 2>&1
eval_tap $? 143 'PublicListContentLikeV2' test.out

#- 144 UpdateContentLikeStatusV2
./ng net.accelbyte.sdk.cli.Main ugc updateContentLikeStatusV2 \
    --contentId 'FnastPRU' \
    --namespace "$AB_NAMESPACE" \
    --body '{"likeStatus": true}' \
    > test.out 2>&1
eval_tap $? 144 'UpdateContentLikeStatusV2' test.out

#- 145 PublicCreateContentV2
./ng net.accelbyte.sdk.cli.Main ugc publicCreateContentV2 \
    --channelId 'Ir4hXaM6' \
    --namespace "$AB_NAMESPACE" \
    --userId 'JNKMgJn2' \
    --body '{"contentType": "c4c6Qour", "customAttributes": {"jHEMdlD1": {}, "btZpTpLN": {}, "U9BqOSgR": {}}, "fileExtension": "8wHd3KNF", "name": "SELXAqfy", "subType": "Ks0nMQpW", "tags": ["lW6J5slk", "TNaaSYgy", "50sZnkdQ"], "type": "qhndVjhB"}' \
    > test.out 2>&1
eval_tap $? 145 'PublicCreateContentV2' test.out

#- 146 PublicUpdateContentByShareCodeV2
./ng net.accelbyte.sdk.cli.Main ugc publicUpdateContentByShareCodeV2 \
    --channelId '656yf2o8' \
    --namespace "$AB_NAMESPACE" \
    --shareCode 'vhOGxfkt' \
    --userId 'Vo8LXCXQ' \
    --body '{"customAttributes": {"bm37YAX0": {}, "xVfvormM": {}, "as3Dr1E5": {}}, "name": "6bwhuzxJ", "subType": "2Jh1M8kd", "tags": ["llRw6YAw", "E4NGXAWh", "gmBrvR05"], "type": "hHPM5wzY"}' \
    > test.out 2>&1
eval_tap $? 146 'PublicUpdateContentByShareCodeV2' test.out

#- 147 PublicDeleteContentByShareCodeV2
./ng net.accelbyte.sdk.cli.Main ugc publicDeleteContentByShareCodeV2 \
    --channelId 'd3XDRXqi' \
    --namespace "$AB_NAMESPACE" \
    --shareCode 'ltZZFzah' \
    --userId 'g18cPfPu' \
    > test.out 2>&1
eval_tap $? 147 'PublicDeleteContentByShareCodeV2' test.out

#- 148 PublicDeleteContentV2
./ng net.accelbyte.sdk.cli.Main ugc publicDeleteContentV2 \
    --channelId 'RJvqu8O0' \
    --contentId 'FLw161x9' \
    --namespace "$AB_NAMESPACE" \
    --userId 'TkzDmSth' \
    > test.out 2>&1
eval_tap $? 148 'PublicDeleteContentV2' test.out

#- 149 PublicUpdateContentV2
./ng net.accelbyte.sdk.cli.Main ugc publicUpdateContentV2 \
    --channelId 'HZkhZee1' \
    --contentId 'Ja04ki2R' \
    --namespace "$AB_NAMESPACE" \
    --userId 'PhElPtJX' \
    --body '{"customAttributes": {"KEhnV9F7": {}, "ETvmHII4": {}, "6yUmASml": {}}, "name": "wz0XuwG6", "subType": "k4uyGbKn", "tags": ["A5mVMnSr", "LqI52Tkv", "XiQWETEg"], "type": "4DkG46VI"}' \
    > test.out 2>&1
eval_tap $? 149 'PublicUpdateContentV2' test.out

#- 150 PublicUpdateContentFileLocation
./ng net.accelbyte.sdk.cli.Main ugc publicUpdateContentFileLocation \
    --channelId 'Ee606Q92' \
    --contentId 'GaVhfHm1' \
    --namespace "$AB_NAMESPACE" \
    --userId 'Q0nuzXoA' \
    --body '{"fileExtension": "MpEQ7jBU", "fileLocation": "0Qw9casr"}' \
    > test.out 2>&1
eval_tap $? 150 'PublicUpdateContentFileLocation' test.out

#- 151 UpdateContentShareCodeV2
./ng net.accelbyte.sdk.cli.Main ugc updateContentShareCodeV2 \
    --channelId 'eKiXradm' \
    --contentId 'agF8VWvN' \
    --namespace "$AB_NAMESPACE" \
    --userId 'q8ZqZzDR' \
    --body '{"shareCode": "o8ydD3TJ"}' \
    > test.out 2>&1
eval_tap $? 151 'UpdateContentShareCodeV2' test.out

#- 152 PublicGenerateContentUploadURLV2
./ng net.accelbyte.sdk.cli.Main ugc publicGenerateContentUploadURLV2 \
    --channelId 'bGBQ6qjY' \
    --contentId 'kADazcsE' \
    --namespace "$AB_NAMESPACE" \
    --userId 'P36UTTIX' \
    --body '{"contentType": "RFX6KRTt", "fileExtension": "wptzqdM8"}' \
    > test.out 2>&1
eval_tap $? 152 'PublicGenerateContentUploadURLV2' test.out

#- 153 PublicGetContentByUserIDV2
./ng net.accelbyte.sdk.cli.Main ugc publicGetContentByUserIDV2 \
    --namespace "$AB_NAMESPACE" \
    --userId 'jlataDhZ' \
    --limit '52' \
    --offset '12' \
    --sortBy 'MlBOZ9gs' \
    > test.out 2>&1
eval_tap $? 153 'PublicGetContentByUserIDV2' test.out

#- 154 UpdateScreenshotsV2
./ng net.accelbyte.sdk.cli.Main ugc updateScreenshotsV2 \
    --contentId 'YOAJXUXK' \
    --namespace "$AB_NAMESPACE" \
    --userId 'rVRHEJfS' \
    --body '{"screenshots": [{"description": "6zbOPHnv", "screenshotId": "SJzZ83M3"}, {"description": "zHifH7bV", "screenshotId": "1jV3e5zA"}, {"description": "j0IxhxCi", "screenshotId": "dNrzQIqK"}]}' \
    > test.out 2>&1
eval_tap $? 154 'UpdateScreenshotsV2' test.out

#- 155 UploadContentScreenshotV2
./ng net.accelbyte.sdk.cli.Main ugc uploadContentScreenshotV2 \
    --contentId '1Trnqoc1' \
    --namespace "$AB_NAMESPACE" \
    --userId 'mss7rhDo' \
    --body '{"screenshots": [{"contentType": "uAJ6L9OP", "description": "tUxtAr7N", "fileExtension": "jpeg"}, {"contentType": "tVJWsjRK", "description": "tIh9F28s", "fileExtension": "png"}, {"contentType": "4CNfC2Yo", "description": "mAu9EIgt", "fileExtension": "pjp"}]}' \
    > test.out 2>&1
eval_tap $? 155 'UploadContentScreenshotV2' test.out

#- 156 DeleteContentScreenshotV2
./ng net.accelbyte.sdk.cli.Main ugc deleteContentScreenshotV2 \
    --contentId 'yHEs9ZwH' \
    --namespace "$AB_NAMESPACE" \
    --screenshotId '1IH8hY1j' \
    --userId 'ZBZ1xuMX' \
    > test.out 2>&1
eval_tap $? 156 'DeleteContentScreenshotV2' test.out

#- 157 PublicGetGroupContentsV2
./ng net.accelbyte.sdk.cli.Main ugc publicGetGroupContentsV2 \
    --groupId 'HbY6Qifl' \
    --namespace "$AB_NAMESPACE" \
    --userId '1KlQ3HKV' \
    --limit '67' \
    --offset '34' \
    > test.out 2>&1
eval_tap $? 157 'PublicGetGroupContentsV2' test.out

#- 158 ListUserStagingContents
./ng net.accelbyte.sdk.cli.Main ugc listUserStagingContents \
    --namespace "$AB_NAMESPACE" \
    --userId 'XctVac40' \
    --limit '43' \
    --offset '2' \
    --sortBy 's9N2G38y' \
    --status '6IKEeiYx' \
    > test.out 2>&1
eval_tap $? 158 'ListUserStagingContents' test.out

#- 159 GetUserStagingContentByID
./ng net.accelbyte.sdk.cli.Main ugc getUserStagingContentByID \
    --contentId 'awaeodWt' \
    --namespace "$AB_NAMESPACE" \
    --userId 'BhUvVucI' \
    > test.out 2>&1
eval_tap $? 159 'GetUserStagingContentByID' test.out

#- 160 UpdateStagingContent
./ng net.accelbyte.sdk.cli.Main ugc updateStagingContent \
    --contentId '6n5mbyLY' \
    --namespace "$AB_NAMESPACE" \
    --userId 'wr9jhWpD' \
    --body '{"fileExtension": "opqAwrMb", "fileLocation": "elxtFfbI"}' \
    > test.out 2>&1
eval_tap $? 160 'UpdateStagingContent' test.out

#- 161 DeleteUserStagingContentByID
./ng net.accelbyte.sdk.cli.Main ugc deleteUserStagingContentByID \
    --contentId 'GVbv8A7i' \
    --namespace "$AB_NAMESPACE" \
    --userId 'Q9wuhqRW' \
    > test.out 2>&1
eval_tap $? 161 'DeleteUserStagingContentByID' test.out


rm -f "tmp.dat"

exit $EXIT_CODE