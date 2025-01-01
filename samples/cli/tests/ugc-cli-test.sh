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
    --limit '39' \
    --offset '46' \
    > test.out 2>&1
eval_tap $? 2 'SingleAdminGetChannel' test.out

#- 3 AdminCreateChannel
./ng net.accelbyte.sdk.cli.Main ugc adminCreateChannel \
    --namespace "$AB_NAMESPACE" \
    --body '{"id": "hipCgpLo", "name": "mQvQE2qW"}' \
    > test.out 2>&1
eval_tap $? 3 'AdminCreateChannel' test.out

#- 4 SingleAdminUpdateChannel
./ng net.accelbyte.sdk.cli.Main ugc singleAdminUpdateChannel \
    --channelId 'bgNtZm6f' \
    --namespace "$AB_NAMESPACE" \
    --body '{"name": "I9Kz2PdP"}' \
    > test.out 2>&1
eval_tap $? 4 'SingleAdminUpdateChannel' test.out

#- 5 SingleAdminDeleteChannel
./ng net.accelbyte.sdk.cli.Main ugc singleAdminDeleteChannel \
    --channelId 'mDBsOxji' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 5 'SingleAdminDeleteChannel' test.out

#- 6 AdminUploadContentDirect
eval_tap 0 6 'AdminUploadContentDirect # SKIP deprecated' test.out

#- 7 AdminUploadContentS3
./ng net.accelbyte.sdk.cli.Main ugc adminUploadContentS3 \
    --channelId '6uTccbv6' \
    --namespace "$AB_NAMESPACE" \
    --body '{"contentType": "yqQF7kgm", "customAttributes": {"rpqXAC72": {}, "2dz2MlEe": {}, "HrzMWiJz": {}}, "fileExtension": "QxWUVqjP", "name": "GXe4ppgZ", "preview": "Wn7wHfMU", "previewMetadata": {"previewContentType": "KTrkoMGe", "previewFileExtension": "YZP8OKsZ"}, "shareCode": "o2kmGn4j", "subType": "RCXUdDQJ", "tags": ["1QKXybNa", "H1rnyE2j", "iGoanIqn"], "type": "b3DgFaU3"}' \
    > test.out 2>&1
eval_tap $? 7 'AdminUploadContentS3' test.out

#- 8 SingleAdminUpdateContentS3
./ng net.accelbyte.sdk.cli.Main ugc singleAdminUpdateContentS3 \
    --channelId 'l7c74RD5' \
    --contentId 'bMK32Ei2' \
    --namespace "$AB_NAMESPACE" \
    --body '{"contentType": "jOtWMvHD", "customAttributes": {"UuAUV5rV": {}, "rffijq9Z": {}, "gx99BSVb": {}}, "fileExtension": "Hcs4BXfX", "name": "bSktOUqB", "payload": "hUOkSCFl", "preview": "uweuOA9H", "previewMetadata": {"previewContentType": "fT2TRFXX", "previewFileExtension": "29pUiIYj"}, "shareCode": "JDdV0cuW", "subType": "3MDvmoz3", "tags": ["qZPqDWbZ", "KbxTjKIM", "dccTj6b4"], "type": "fOPctc2z", "updateContentFile": false}' \
    > test.out 2>&1
eval_tap $? 8 'SingleAdminUpdateContentS3' test.out

#- 9 AdminSearchChannelSpecificContent
./ng net.accelbyte.sdk.cli.Main ugc adminSearchChannelSpecificContent \
    --channelId 'rWaMFtnL' \
    --namespace "$AB_NAMESPACE" \
    --creator 'ZtiF3Dyk' \
    --ishidden 'zyYHyn3i' \
    --isofficial 'mQmG6OP6' \
    --limit '44' \
    --name 'BZUeiiXF' \
    --offset '97' \
    --orderby '6tmYR2sb' \
    --sortby 'lit7tzcB' \
    --subtype '7NRUzQVh' \
    --tags '7hOm5m7t,2M3wVLiB,WyA58hzB' \
    --type 'W5FbMIjT' \
    --userId 'HDM0OEO6' \
    > test.out 2>&1
eval_tap $? 9 'AdminSearchChannelSpecificContent' test.out

#- 10 SingleAdminUpdateContentDirect
eval_tap 0 10 'SingleAdminUpdateContentDirect # SKIP deprecated' test.out

#- 11 SingleAdminDeleteContent
./ng net.accelbyte.sdk.cli.Main ugc singleAdminDeleteContent \
    --channelId '3v0u47Ec' \
    --contentId 'XxujsY0U' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 11 'SingleAdminDeleteContent' test.out

#- 12 SingleAdminGetContent
./ng net.accelbyte.sdk.cli.Main ugc singleAdminGetContent \
    --namespace "$AB_NAMESPACE" \
    --limit '58' \
    --offset '13' \
    > test.out 2>&1
eval_tap $? 12 'SingleAdminGetContent' test.out

#- 13 AdminGetContentBulk
./ng net.accelbyte.sdk.cli.Main ugc adminGetContentBulk \
    --namespace "$AB_NAMESPACE" \
    --body '{"contentIds": ["WizfYkHV", "PjLxiCQ7", "OYRbLGpV"]}' \
    > test.out 2>&1
eval_tap $? 13 'AdminGetContentBulk' test.out

#- 14 AdminSearchContent
./ng net.accelbyte.sdk.cli.Main ugc adminSearchContent \
    --namespace "$AB_NAMESPACE" \
    --creator 'g3Q6bxWu' \
    --ishidden 'PUAA3ILo' \
    --isofficial 'fjM1slNu' \
    --limit '51' \
    --name '3y0pSBhy' \
    --offset '35' \
    --orderby 'XRxyEYDb' \
    --sortby '35puyPst' \
    --subtype 'SC2DoIgH' \
    --tags 'wFkuXlKQ,rGSqQyaA,iBFCK7oc' \
    --type 'SdB2bRVY' \
    --userId 'oMv52L61' \
    > test.out 2>&1
eval_tap $? 14 'AdminSearchContent' test.out

#- 15 AdminGetContentBulkByShareCodes
./ng net.accelbyte.sdk.cli.Main ugc adminGetContentBulkByShareCodes \
    --namespace "$AB_NAMESPACE" \
    --body '{"shareCodes": ["Kn2b5TQC", "djqkQ1oL", "g5qQ6OAt"]}' \
    > test.out 2>&1
eval_tap $? 15 'AdminGetContentBulkByShareCodes' test.out

#- 16 AdminGetUserContentByShareCode
./ng net.accelbyte.sdk.cli.Main ugc adminGetUserContentByShareCode \
    --namespace "$AB_NAMESPACE" \
    --shareCode 'hOT3U2fR' \
    > test.out 2>&1
eval_tap $? 16 'AdminGetUserContentByShareCode' test.out

#- 17 AdminGetSpecificContent
./ng net.accelbyte.sdk.cli.Main ugc adminGetSpecificContent \
    --contentId 'yZywe3kq' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 17 'AdminGetSpecificContent' test.out

#- 18 AdminDownloadContentPreview
./ng net.accelbyte.sdk.cli.Main ugc adminDownloadContentPreview \
    --contentId '5YqmwPjd' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 18 'AdminDownloadContentPreview' test.out

#- 19 RollbackContentVersion
./ng net.accelbyte.sdk.cli.Main ugc rollbackContentVersion \
    --contentId 'NYsJgXFT' \
    --namespace "$AB_NAMESPACE" \
    --versionId '1tHjxmSp' \
    > test.out 2>&1
eval_tap $? 19 'RollbackContentVersion' test.out

#- 20 AdminUpdateScreenshots
./ng net.accelbyte.sdk.cli.Main ugc adminUpdateScreenshots \
    --contentId 'y6KxntXl' \
    --namespace "$AB_NAMESPACE" \
    --body '{"screenshots": [{"description": "BAx0VhQG", "screenshotId": "jtvFzlan"}, {"description": "tLZPevgr", "screenshotId": "5ypx4W9L"}, {"description": "FCOtK9YS", "screenshotId": "9mfUr7xi"}]}' \
    > test.out 2>&1
eval_tap $? 20 'AdminUpdateScreenshots' test.out

#- 21 AdminUploadContentScreenshot
./ng net.accelbyte.sdk.cli.Main ugc adminUploadContentScreenshot \
    --contentId 'GlWyLhJH' \
    --namespace "$AB_NAMESPACE" \
    --body '{"screenshots": [{"contentType": "jypqrtMg", "description": "tbVeYnY8", "fileExtension": "jfif"}, {"contentType": "yvVXHqBC", "description": "2OX2QbHx", "fileExtension": "bmp"}, {"contentType": "xZILsMIu", "description": "gRi4BXsn", "fileExtension": "jpeg"}]}' \
    > test.out 2>&1
eval_tap $? 21 'AdminUploadContentScreenshot' test.out

#- 22 AdminDeleteContentScreenshot
./ng net.accelbyte.sdk.cli.Main ugc adminDeleteContentScreenshot \
    --contentId 'GX3yZ9j1' \
    --namespace "$AB_NAMESPACE" \
    --screenshotId '4so9pgdT' \
    > test.out 2>&1
eval_tap $? 22 'AdminDeleteContentScreenshot' test.out

#- 23 ListContentVersions
./ng net.accelbyte.sdk.cli.Main ugc listContentVersions \
    --contentId 'CRJcxfGS' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 23 'ListContentVersions' test.out

#- 24 SingleAdminGetAllGroups
./ng net.accelbyte.sdk.cli.Main ugc singleAdminGetAllGroups \
    --namespace "$AB_NAMESPACE" \
    --limit '6' \
    --offset '52' \
    > test.out 2>&1
eval_tap $? 24 'SingleAdminGetAllGroups' test.out

#- 25 AdminCreateGroup
./ng net.accelbyte.sdk.cli.Main ugc adminCreateGroup \
    --namespace "$AB_NAMESPACE" \
    --body '{"contents": ["EcN75Dqf", "MWm085Qz", "NDs3fjTT"], "name": "UlnEMkuy"}' \
    > test.out 2>&1
eval_tap $? 25 'AdminCreateGroup' test.out

#- 26 SingleAdminGetGroup
./ng net.accelbyte.sdk.cli.Main ugc singleAdminGetGroup \
    --groupId 'USR9ZWYh' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 26 'SingleAdminGetGroup' test.out

#- 27 SingleAdminUpdateGroup
./ng net.accelbyte.sdk.cli.Main ugc singleAdminUpdateGroup \
    --groupId 'D8oWQTAy' \
    --namespace "$AB_NAMESPACE" \
    --body '{"contents": ["IeTG43a7", "K0kpc0YW", "kCUccCYV"], "name": "q6Y3ZUF7"}' \
    > test.out 2>&1
eval_tap $? 27 'SingleAdminUpdateGroup' test.out

#- 28 SingleAdminDeleteGroup
./ng net.accelbyte.sdk.cli.Main ugc singleAdminDeleteGroup \
    --groupId 'uoN6YHSg' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 28 'SingleAdminDeleteGroup' test.out

#- 29 SingleAdminGetGroupContents
./ng net.accelbyte.sdk.cli.Main ugc singleAdminGetGroupContents \
    --groupId 'QggD3lpY' \
    --namespace "$AB_NAMESPACE" \
    --limit '83' \
    --offset '2' \
    > test.out 2>&1
eval_tap $? 29 'SingleAdminGetGroupContents' test.out

#- 30 AdminGetTag
./ng net.accelbyte.sdk.cli.Main ugc adminGetTag \
    --namespace "$AB_NAMESPACE" \
    --limit '78' \
    --offset '21' \
    > test.out 2>&1
eval_tap $? 30 'AdminGetTag' test.out

#- 31 AdminCreateTag
./ng net.accelbyte.sdk.cli.Main ugc adminCreateTag \
    --namespace "$AB_NAMESPACE" \
    --body '{"tag": "mWtigbEL"}' \
    > test.out 2>&1
eval_tap $? 31 'AdminCreateTag' test.out

#- 32 AdminUpdateTag
./ng net.accelbyte.sdk.cli.Main ugc adminUpdateTag \
    --namespace "$AB_NAMESPACE" \
    --tagId 'B1KrKgQm' \
    --body '{"tag": "suRqkavg"}' \
    > test.out 2>&1
eval_tap $? 32 'AdminUpdateTag' test.out

#- 33 AdminDeleteTag
./ng net.accelbyte.sdk.cli.Main ugc adminDeleteTag \
    --namespace "$AB_NAMESPACE" \
    --tagId 'Fg9mB54Y' \
    > test.out 2>&1
eval_tap $? 33 'AdminDeleteTag' test.out

#- 34 AdminGetType
./ng net.accelbyte.sdk.cli.Main ugc adminGetType \
    --namespace "$AB_NAMESPACE" \
    --limit '56' \
    --offset '73' \
    > test.out 2>&1
eval_tap $? 34 'AdminGetType' test.out

#- 35 AdminCreateType
./ng net.accelbyte.sdk.cli.Main ugc adminCreateType \
    --namespace "$AB_NAMESPACE" \
    --body '{"subtype": ["3a2QI0zt", "fvRHm6LG", "MFQd2TVR"], "type": "jiSC6lTN"}' \
    > test.out 2>&1
eval_tap $? 35 'AdminCreateType' test.out

#- 36 AdminUpdateType
./ng net.accelbyte.sdk.cli.Main ugc adminUpdateType \
    --namespace "$AB_NAMESPACE" \
    --typeId 'MLAVTHDC' \
    --body '{"subtype": ["XtHT24XE", "GUJqZmaB", "UAiDeMUT"], "type": "TAohlbLO"}' \
    > test.out 2>&1
eval_tap $? 36 'AdminUpdateType' test.out

#- 37 AdminDeleteType
./ng net.accelbyte.sdk.cli.Main ugc adminDeleteType \
    --namespace "$AB_NAMESPACE" \
    --typeId 'aIykvRH7' \
    > test.out 2>&1
eval_tap $? 37 'AdminDeleteType' test.out

#- 38 AdminGetChannel
./ng net.accelbyte.sdk.cli.Main ugc adminGetChannel \
    --namespace "$AB_NAMESPACE" \
    --userId 'qohBdSOs' \
    --limit '34' \
    --name 'SkojhG2o' \
    --offset '95' \
    > test.out 2>&1
eval_tap $? 38 'AdminGetChannel' test.out

#- 39 AdminDeleteAllUserChannels
./ng net.accelbyte.sdk.cli.Main ugc adminDeleteAllUserChannels \
    --namespace "$AB_NAMESPACE" \
    --userId '3VL3VnIU' \
    > test.out 2>&1
eval_tap $? 39 'AdminDeleteAllUserChannels' test.out

#- 40 AdminUpdateChannel
./ng net.accelbyte.sdk.cli.Main ugc adminUpdateChannel \
    --channelId 'LqfqElp8' \
    --namespace "$AB_NAMESPACE" \
    --userId 'M6jtQ8n5' \
    --body '{"name": "Gq7zEmzw"}' \
    > test.out 2>&1
eval_tap $? 40 'AdminUpdateChannel' test.out

#- 41 AdminDeleteChannel
./ng net.accelbyte.sdk.cli.Main ugc adminDeleteChannel \
    --channelId '7WueBPPA' \
    --namespace "$AB_NAMESPACE" \
    --userId 'VWh5RjAZ' \
    > test.out 2>&1
eval_tap $? 41 'AdminDeleteChannel' test.out

#- 42 AdminUpdateContentS3ByShareCode
./ng net.accelbyte.sdk.cli.Main ugc adminUpdateContentS3ByShareCode \
    --channelId 'MWLjj1Qe' \
    --namespace "$AB_NAMESPACE" \
    --shareCode 'kgUBtvHf' \
    --userId 'OcBpFKDf' \
    --body '{"contentType": "aRPibKOc", "customAttributes": {"3khFOK9Q": {}, "eykMa3mW": {}, "1DAEAfnR": {}}, "fileExtension": "qoq61aea", "name": "4qYUVHTx", "payload": "NJZDG9QA", "preview": "sXPbJ1oS", "previewMetadata": {"previewContentType": "PpiTH5PO", "previewFileExtension": "CGj1Zwcs"}, "shareCode": "QIVW55Z3", "subType": "abjodQMB", "tags": ["6qup3G5I", "uTXblUeT", "dOt22JFp"], "type": "KGcEAQvc", "updateContentFile": true}' \
    > test.out 2>&1
eval_tap $? 42 'AdminUpdateContentS3ByShareCode' test.out

#- 43 AdminUpdateContentS3
./ng net.accelbyte.sdk.cli.Main ugc adminUpdateContentS3 \
    --channelId 'A7B4EyEQ' \
    --contentId 'fGUHg340' \
    --namespace "$AB_NAMESPACE" \
    --userId 'p3JEtGHu' \
    --body '{"contentType": "anEqJbdb", "customAttributes": {"pnoVPv16": {}, "VVRQoAUh": {}, "NySl1Rgs": {}}, "fileExtension": "4MeOwXIi", "name": "Iai0ivvd", "payload": "AEa8aNGo", "preview": "39tkYehh", "previewMetadata": {"previewContentType": "35YR5pu6", "previewFileExtension": "st2HHh67"}, "shareCode": "BPtWrjNU", "subType": "9Ktl9YIi", "tags": ["0Y1JhKdl", "KSh3LsMq", "1AF6T3vR"], "type": "4iNHRU5s", "updateContentFile": false}' \
    > test.out 2>&1
eval_tap $? 43 'AdminUpdateContentS3' test.out

#- 44 DeleteContentByShareCode
./ng net.accelbyte.sdk.cli.Main ugc deleteContentByShareCode \
    --channelId 'm7OUkUnB' \
    --namespace "$AB_NAMESPACE" \
    --shareCode 'eawPjtnk' \
    --userId 'RW1X3HUO' \
    > test.out 2>&1
eval_tap $? 44 'DeleteContentByShareCode' test.out

#- 45 AdminUpdateContentDirect
eval_tap 0 45 'AdminUpdateContentDirect # SKIP deprecated' test.out

#- 46 AdminDeleteContent
./ng net.accelbyte.sdk.cli.Main ugc adminDeleteContent \
    --channelId 'kpMUOG9F' \
    --contentId 'RIXU5ghC' \
    --namespace "$AB_NAMESPACE" \
    --userId '5y8xNq3Z' \
    > test.out 2>&1
eval_tap $? 46 'AdminDeleteContent' test.out

#- 47 AdminGetContent
./ng net.accelbyte.sdk.cli.Main ugc adminGetContent \
    --namespace "$AB_NAMESPACE" \
    --userId 'pkaEohQM' \
    --limit '37' \
    --offset '93' \
    > test.out 2>&1
eval_tap $? 47 'AdminGetContent' test.out

#- 48 AdminDeleteAllUserContents
./ng net.accelbyte.sdk.cli.Main ugc adminDeleteAllUserContents \
    --namespace "$AB_NAMESPACE" \
    --userId 'CLfQsfy1' \
    > test.out 2>&1
eval_tap $? 48 'AdminDeleteAllUserContents' test.out

#- 49 AdminHideUserContent
./ng net.accelbyte.sdk.cli.Main ugc adminHideUserContent \
    --contentId '3Vm73EQ3' \
    --namespace "$AB_NAMESPACE" \
    --userId 'Olc9t0cD' \
    --body '{"isHidden": true}' \
    > test.out 2>&1
eval_tap $? 49 'AdminHideUserContent' test.out

#- 50 AdminGetAllGroups
./ng net.accelbyte.sdk.cli.Main ugc adminGetAllGroups \
    --namespace "$AB_NAMESPACE" \
    --userId 'j00bbO9B' \
    --limit '48' \
    --offset '21' \
    > test.out 2>&1
eval_tap $? 50 'AdminGetAllGroups' test.out

#- 51 AdminDeleteAllUserGroup
./ng net.accelbyte.sdk.cli.Main ugc adminDeleteAllUserGroup \
    --namespace "$AB_NAMESPACE" \
    --userId 'GN91O8kK' \
    > test.out 2>&1
eval_tap $? 51 'AdminDeleteAllUserGroup' test.out

#- 52 AdminGetGroup
./ng net.accelbyte.sdk.cli.Main ugc adminGetGroup \
    --groupId '3NWyKsyy' \
    --namespace "$AB_NAMESPACE" \
    --userId 'pWC4pVe1' \
    > test.out 2>&1
eval_tap $? 52 'AdminGetGroup' test.out

#- 53 AdminUpdateGroup
./ng net.accelbyte.sdk.cli.Main ugc adminUpdateGroup \
    --groupId 'yl1xLJHa' \
    --namespace "$AB_NAMESPACE" \
    --userId 'i46fYfY7' \
    --body '{"contents": ["3fmyJt8f", "xjZQjsNk", "yKHjjoS6"], "name": "3sUJBGRU"}' \
    > test.out 2>&1
eval_tap $? 53 'AdminUpdateGroup' test.out

#- 54 AdminDeleteGroup
./ng net.accelbyte.sdk.cli.Main ugc adminDeleteGroup \
    --groupId '8c70NzwO' \
    --namespace "$AB_NAMESPACE" \
    --userId 'cZ0eo3Uz' \
    > test.out 2>&1
eval_tap $? 54 'AdminDeleteGroup' test.out

#- 55 AdminGetGroupContents
./ng net.accelbyte.sdk.cli.Main ugc adminGetGroupContents \
    --groupId 'Xd2qzMXH' \
    --namespace "$AB_NAMESPACE" \
    --userId 'CX37kVkV' \
    --limit '95' \
    --offset '32' \
    > test.out 2>&1
eval_tap $? 55 'AdminGetGroupContents' test.out

#- 56 AdminDeleteAllUserStates
./ng net.accelbyte.sdk.cli.Main ugc adminDeleteAllUserStates \
    --namespace "$AB_NAMESPACE" \
    --userId 'MjLFasPE' \
    > test.out 2>&1
eval_tap $? 56 'AdminDeleteAllUserStates' test.out

#- 57 SearchChannelSpecificContent
./ng net.accelbyte.sdk.cli.Main ugc searchChannelSpecificContent \
    --channelId 'aKnUDrjx' \
    --namespace "$AB_NAMESPACE" \
    --creator 'jpHWQSJb' \
    --ishidden '6rvnWLdX' \
    --isofficial 'QlWgUfe4' \
    --limit '18' \
    --name 'dY4uR0dB' \
    --offset '3' \
    --orderby 'MDVVfgaw' \
    --sortby 'afYvzEm6' \
    --subtype '8W6UAM41' \
    --tags '6wYikEov,80GBMVx6,xLjYHL9y' \
    --type 'H6sDgzgr' \
    --userId 'soom7TNw' \
    > test.out 2>&1
eval_tap $? 57 'SearchChannelSpecificContent' test.out

#- 58 PublicSearchContent
./ng net.accelbyte.sdk.cli.Main ugc publicSearchContent \
    --namespace "$AB_NAMESPACE" \
    --creator 'oM4HoDqD' \
    --ishidden 'jFF9wRTD' \
    --isofficial 'Oxk25P8v' \
    --limit '88' \
    --name 'vR3Fpl4Z' \
    --offset '23' \
    --orderby '0pjEZiCG' \
    --sortby 'MkZ2mi0W' \
    --subtype 'LZLzfhOx' \
    --tags 'NVkoQgj1,sQ65fjhq,CgZOJLsa' \
    --type 'KUZE0Ncb' \
    --userId '9trsUsKJ' \
    > test.out 2>&1
eval_tap $? 58 'PublicSearchContent' test.out

#- 59 PublicGetContentBulk
./ng net.accelbyte.sdk.cli.Main ugc publicGetContentBulk \
    --namespace "$AB_NAMESPACE" \
    --body '{"contentIds": ["BKfcqJWj", "wX5bv4kt", "qP6fkodR"]}' \
    > test.out 2>&1
eval_tap $? 59 'PublicGetContentBulk' test.out

#- 60 GetFollowedContent
./ng net.accelbyte.sdk.cli.Main ugc getFollowedContent \
    --namespace "$AB_NAMESPACE" \
    --limit '77' \
    --offset '54' \
    > test.out 2>&1
eval_tap $? 60 'GetFollowedContent' test.out

#- 61 GetLikedContent
./ng net.accelbyte.sdk.cli.Main ugc getLikedContent \
    --namespace "$AB_NAMESPACE" \
    --isofficial  \
    --limit '69' \
    --name 'drG0MuWd' \
    --offset '87' \
    --orderby 'oXFEzALM' \
    --sortby 'gtMlXwPk' \
    --subtype '80X8G4lv' \
    --tags 'B7A7Mo5I,wlfFkXHN,gcaszKNC' \
    --type 'smSma9I6' \
    > test.out 2>&1
eval_tap $? 61 'GetLikedContent' test.out

#- 62 PublicGetContentBulkByShareCodes
./ng net.accelbyte.sdk.cli.Main ugc publicGetContentBulkByShareCodes \
    --namespace "$AB_NAMESPACE" \
    --body '{"shareCodes": ["M64AvER9", "H5zFiZ8p", "nzsByEvn"]}' \
    > test.out 2>&1
eval_tap $? 62 'PublicGetContentBulkByShareCodes' test.out

#- 63 PublicDownloadContentByShareCode
./ng net.accelbyte.sdk.cli.Main ugc publicDownloadContentByShareCode \
    --namespace "$AB_NAMESPACE" \
    --shareCode 'm4QqWAsY' \
    > test.out 2>&1
eval_tap $? 63 'PublicDownloadContentByShareCode' test.out

#- 64 PublicDownloadContentByContentID
./ng net.accelbyte.sdk.cli.Main ugc publicDownloadContentByContentID \
    --contentId 'yJ2zbCuH' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 64 'PublicDownloadContentByContentID' test.out

#- 65 AddDownloadCount
./ng net.accelbyte.sdk.cli.Main ugc addDownloadCount \
    --contentId 'HUfDnatc' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 65 'AddDownloadCount' test.out

#- 66 UpdateContentLikeStatus
./ng net.accelbyte.sdk.cli.Main ugc updateContentLikeStatus \
    --contentId 'XjMvgfcY' \
    --namespace "$AB_NAMESPACE" \
    --body '{"likeStatus": true}' \
    > test.out 2>&1
eval_tap $? 66 'UpdateContentLikeStatus' test.out

#- 67 PublicDownloadContentPreview
./ng net.accelbyte.sdk.cli.Main ugc publicDownloadContentPreview \
    --contentId 'LKBdgC1U' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 67 'PublicDownloadContentPreview' test.out

#- 68 GetTag
./ng net.accelbyte.sdk.cli.Main ugc getTag \
    --namespace "$AB_NAMESPACE" \
    --limit '100' \
    --offset '7' \
    > test.out 2>&1
eval_tap $? 68 'GetTag' test.out

#- 69 GetType
./ng net.accelbyte.sdk.cli.Main ugc getType \
    --namespace "$AB_NAMESPACE" \
    --limit '91' \
    --offset '9' \
    > test.out 2>&1
eval_tap $? 69 'GetType' test.out

#- 70 PublicSearchCreator
./ng net.accelbyte.sdk.cli.Main ugc publicSearchCreator \
    --namespace "$AB_NAMESPACE" \
    --limit '63' \
    --offset '83' \
    --orderby '41ypgPUy' \
    --sortby 'aMxShOOo' \
    > test.out 2>&1
eval_tap $? 70 'PublicSearchCreator' test.out

#- 71 GetFollowedUsers
./ng net.accelbyte.sdk.cli.Main ugc getFollowedUsers \
    --namespace "$AB_NAMESPACE" \
    --limit '43' \
    --offset '8' \
    > test.out 2>&1
eval_tap $? 71 'GetFollowedUsers' test.out

#- 72 PublicGetCreator
./ng net.accelbyte.sdk.cli.Main ugc publicGetCreator \
    --namespace "$AB_NAMESPACE" \
    --userId 'XlGUnJoe' \
    > test.out 2>&1
eval_tap $? 72 'PublicGetCreator' test.out

#- 73 GetChannels
./ng net.accelbyte.sdk.cli.Main ugc getChannels \
    --namespace "$AB_NAMESPACE" \
    --userId 'P5EGhKY0' \
    --limit '71' \
    --name 's0FMTQfu' \
    --offset '23' \
    > test.out 2>&1
eval_tap $? 73 'GetChannels' test.out

#- 74 PublicCreateChannel
./ng net.accelbyte.sdk.cli.Main ugc publicCreateChannel \
    --namespace "$AB_NAMESPACE" \
    --userId '4Cy2No4u' \
    --body '{"name": "vONZuubI"}' \
    > test.out 2>&1
eval_tap $? 74 'PublicCreateChannel' test.out

#- 75 DeleteAllUserChannel
./ng net.accelbyte.sdk.cli.Main ugc deleteAllUserChannel \
    --namespace "$AB_NAMESPACE" \
    --userId '6syh3VV3' \
    > test.out 2>&1
eval_tap $? 75 'DeleteAllUserChannel' test.out

#- 76 UpdateChannel
./ng net.accelbyte.sdk.cli.Main ugc updateChannel \
    --channelId 'vBKE41wt' \
    --namespace "$AB_NAMESPACE" \
    --userId 'xzw1R75R' \
    --body '{"name": "I9SZk5bR"}' \
    > test.out 2>&1
eval_tap $? 76 'UpdateChannel' test.out

#- 77 DeleteChannel
./ng net.accelbyte.sdk.cli.Main ugc deleteChannel \
    --channelId 'KaILK3zM' \
    --namespace "$AB_NAMESPACE" \
    --userId 'Im5HQ3GT' \
    > test.out 2>&1
eval_tap $? 77 'DeleteChannel' test.out

#- 78 CreateContentDirect
eval_tap 0 78 'CreateContentDirect # SKIP deprecated' test.out

#- 79 CreateContentS3
./ng net.accelbyte.sdk.cli.Main ugc createContentS3 \
    --channelId 'hQj3jtRr' \
    --namespace "$AB_NAMESPACE" \
    --userId 'UVC6yFVd' \
    --body '{"contentType": "ESLBk6EX", "customAttributes": {"IPtFXuvL": {}, "fPRb2WHo": {}, "1YncKZ5P": {}}, "fileExtension": "cTccaUVX", "name": "tlhFitol", "preview": "wqca0ZJ7", "previewMetadata": {"previewContentType": "Tex7NlX2", "previewFileExtension": "x6DsZ82c"}, "subType": "pegtzIP4", "tags": ["mBZkejQ7", "nRfchhzY", "3TxDzT8p"], "type": "NZoG7DYU"}' \
    > test.out 2>&1
eval_tap $? 79 'CreateContentS3' test.out

#- 80 PublicUpdateContentByShareCode
./ng net.accelbyte.sdk.cli.Main ugc publicUpdateContentByShareCode \
    --channelId '9xU3KzDw' \
    --namespace "$AB_NAMESPACE" \
    --shareCode 'hXTqWTrp' \
    --userId 'zTAnCsMt' \
    --body '{"contentType": "tN9KMC21", "customAttributes": {"v22AsSeX": {}, "BlxnHGsj": {}, "eXKFWeok": {}}, "fileExtension": "3504k8ya", "name": "5zbEE2Vn", "payload": "6D2r8ou0", "preview": "FeFjF4V1", "previewMetadata": {"previewContentType": "WZpBf24l", "previewFileExtension": "bdsUQIVV"}, "subType": "oUAzxKVw", "tags": ["W5iS5sAb", "8Zb5emcW", "xvTAU703"], "type": "zYWZpztC", "updateContentFile": false}' \
    > test.out 2>&1
eval_tap $? 80 'PublicUpdateContentByShareCode' test.out

#- 81 UpdateContentS3
./ng net.accelbyte.sdk.cli.Main ugc updateContentS3 \
    --channelId 'QPw37UyZ' \
    --contentId 'Cv8llvBh' \
    --namespace "$AB_NAMESPACE" \
    --userId 'lfsedFKI' \
    --body '{"contentType": "OYn6VMYE", "customAttributes": {"uv0M6ouN": {}, "dDvPhkAh": {}, "ltPL7uaS": {}}, "fileExtension": "IKn3Nzwb", "name": "WxheD9TR", "payload": "9WKXhLox", "preview": "TGH8pAmj", "previewMetadata": {"previewContentType": "eC4FTxGX", "previewFileExtension": "Q3cUxjRj"}, "subType": "dMjGASjs", "tags": ["3UOqMqA8", "ZXCXw7CM", "7pn3drR8"], "type": "9JVexxoA", "updateContentFile": false}' \
    > test.out 2>&1
eval_tap $? 81 'UpdateContentS3' test.out

#- 82 PublicDeleteContentByShareCode
./ng net.accelbyte.sdk.cli.Main ugc publicDeleteContentByShareCode \
    --channelId 'maHXuwP7' \
    --namespace "$AB_NAMESPACE" \
    --shareCode 'PSKeQY7N' \
    --userId 'SpMobd77' \
    > test.out 2>&1
eval_tap $? 82 'PublicDeleteContentByShareCode' test.out

#- 83 UpdateContentDirect
eval_tap 0 83 'UpdateContentDirect # SKIP deprecated' test.out

#- 84 DeleteContent
./ng net.accelbyte.sdk.cli.Main ugc deleteContent \
    --channelId 'cbMDdFIj' \
    --contentId 'GlIYthT8' \
    --namespace "$AB_NAMESPACE" \
    --userId 'oMu7eiFn' \
    > test.out 2>&1
eval_tap $? 84 'DeleteContent' test.out

#- 85 UpdateContentShareCode
./ng net.accelbyte.sdk.cli.Main ugc updateContentShareCode \
    --channelId 'm3OdtDl9' \
    --contentId 'gbPVJ0nN' \
    --namespace "$AB_NAMESPACE" \
    --userId 'ud0DI7YD' \
    --body '{"shareCode": "IqAV1mu1"}' \
    > test.out 2>&1
eval_tap $? 85 'UpdateContentShareCode' test.out

#- 86 PublicGetUserContent
./ng net.accelbyte.sdk.cli.Main ugc publicGetUserContent \
    --namespace "$AB_NAMESPACE" \
    --userId 'EP8r6000' \
    --limit '36' \
    --offset '46' \
    > test.out 2>&1
eval_tap $? 86 'PublicGetUserContent' test.out

#- 87 DeleteAllUserContents
./ng net.accelbyte.sdk.cli.Main ugc deleteAllUserContents \
    --namespace "$AB_NAMESPACE" \
    --userId 'kp0NI73n' \
    > test.out 2>&1
eval_tap $? 87 'DeleteAllUserContents' test.out

#- 88 UpdateScreenshots
./ng net.accelbyte.sdk.cli.Main ugc updateScreenshots \
    --contentId '5p0ufJem' \
    --namespace "$AB_NAMESPACE" \
    --userId 'kJWnK80i' \
    --body '{"screenshots": [{"description": "av4e9zWd", "screenshotId": "1ciYuHwC"}, {"description": "AzF3OKcC", "screenshotId": "2obaeVa3"}, {"description": "BoAEIwMG", "screenshotId": "HukbiKZm"}]}' \
    > test.out 2>&1
eval_tap $? 88 'UpdateScreenshots' test.out

#- 89 UploadContentScreenshot
./ng net.accelbyte.sdk.cli.Main ugc uploadContentScreenshot \
    --contentId 'AQ7eYuJj' \
    --namespace "$AB_NAMESPACE" \
    --userId 'lfpoI9yq' \
    --body '{"screenshots": [{"contentType": "MH8rXPvP", "description": "w7vGeGU7", "fileExtension": "jfif"}, {"contentType": "BaXmjUAF", "description": "zhSB9pD5", "fileExtension": "jpg"}, {"contentType": "S9ayKpim", "description": "ZgXyxc27", "fileExtension": "bmp"}]}' \
    > test.out 2>&1
eval_tap $? 89 'UploadContentScreenshot' test.out

#- 90 DeleteContentScreenshot
./ng net.accelbyte.sdk.cli.Main ugc deleteContentScreenshot \
    --contentId 'lJNXpiAJ' \
    --namespace "$AB_NAMESPACE" \
    --screenshotId 'P5W8VvgA' \
    --userId 'zgX0qFY7' \
    > test.out 2>&1
eval_tap $? 90 'DeleteContentScreenshot' test.out

#- 91 UpdateUserFollowStatus
./ng net.accelbyte.sdk.cli.Main ugc updateUserFollowStatus \
    --namespace "$AB_NAMESPACE" \
    --userId 'VuYDBVmC' \
    --body '{"followStatus": true}' \
    > test.out 2>&1
eval_tap $? 91 'UpdateUserFollowStatus' test.out

#- 92 GetPublicFollowers
./ng net.accelbyte.sdk.cli.Main ugc getPublicFollowers \
    --namespace "$AB_NAMESPACE" \
    --userId '9BeBU3FU' \
    --limit '27' \
    --offset '39' \
    > test.out 2>&1
eval_tap $? 92 'GetPublicFollowers' test.out

#- 93 GetPublicFollowing
./ng net.accelbyte.sdk.cli.Main ugc getPublicFollowing \
    --namespace "$AB_NAMESPACE" \
    --userId 'JaBUn4x3' \
    --limit '47' \
    --offset '1' \
    > test.out 2>&1
eval_tap $? 93 'GetPublicFollowing' test.out

#- 94 GetGroups
./ng net.accelbyte.sdk.cli.Main ugc getGroups \
    --namespace "$AB_NAMESPACE" \
    --userId 'ltwgm81c' \
    --limit '76' \
    --offset '16' \
    > test.out 2>&1
eval_tap $? 94 'GetGroups' test.out

#- 95 CreateGroup
./ng net.accelbyte.sdk.cli.Main ugc createGroup \
    --namespace "$AB_NAMESPACE" \
    --userId 'IcuqzRBt' \
    --body '{"contents": ["nsspPub1", "sHPQGALx", "ClIv9lJ2"], "name": "jI9kQwoe"}' \
    > test.out 2>&1
eval_tap $? 95 'CreateGroup' test.out

#- 96 DeleteAllUserGroup
./ng net.accelbyte.sdk.cli.Main ugc deleteAllUserGroup \
    --namespace "$AB_NAMESPACE" \
    --userId 'F1EmY2o0' \
    > test.out 2>&1
eval_tap $? 96 'DeleteAllUserGroup' test.out

#- 97 GetGroup
./ng net.accelbyte.sdk.cli.Main ugc getGroup \
    --groupId 'hKEABYHl' \
    --namespace "$AB_NAMESPACE" \
    --userId 'b44SOYmb' \
    > test.out 2>&1
eval_tap $? 97 'GetGroup' test.out

#- 98 UpdateGroup
./ng net.accelbyte.sdk.cli.Main ugc updateGroup \
    --groupId 'pOjtxIs5' \
    --namespace "$AB_NAMESPACE" \
    --userId '4vw0doPZ' \
    --body '{"contents": ["ltfx91P2", "04uA25vb", "zegZTlJJ"], "name": "bAppecsz"}' \
    > test.out 2>&1
eval_tap $? 98 'UpdateGroup' test.out

#- 99 DeleteGroup
./ng net.accelbyte.sdk.cli.Main ugc deleteGroup \
    --groupId 'SJJ0qh8c' \
    --namespace "$AB_NAMESPACE" \
    --userId 'yfmubibU' \
    > test.out 2>&1
eval_tap $? 99 'DeleteGroup' test.out

#- 100 GetGroupContent
./ng net.accelbyte.sdk.cli.Main ugc getGroupContent \
    --groupId 'S80QjDT0' \
    --namespace "$AB_NAMESPACE" \
    --userId 'Jy8MKJ1s' \
    --limit '92' \
    --offset '72' \
    > test.out 2>&1
eval_tap $? 100 'GetGroupContent' test.out

#- 101 DeleteAllUserStates
./ng net.accelbyte.sdk.cli.Main ugc deleteAllUserStates \
    --namespace "$AB_NAMESPACE" \
    --userId 'e5ONSC1K' \
    > test.out 2>&1
eval_tap $? 101 'DeleteAllUserStates' test.out

#- 102 AdminGetContentByChannelIDV2
./ng net.accelbyte.sdk.cli.Main ugc adminGetContentByChannelIDV2 \
    --channelId 'qp4VfO1P' \
    --namespace "$AB_NAMESPACE" \
    --limit '53' \
    --name '4ZCFVO0E' \
    --offset '48' \
    --sortBy 'Ff6i6d5I' \
    > test.out 2>&1
eval_tap $? 102 'AdminGetContentByChannelIDV2' test.out

#- 103 AdminCreateContentV2
./ng net.accelbyte.sdk.cli.Main ugc adminCreateContentV2 \
    --channelId 'xfmcMIxG' \
    --namespace "$AB_NAMESPACE" \
    --body '{"contentType": "EJhixxlK", "customAttributes": {"sPfK8ps8": {}, "Jb96e5g5": {}, "RtfeLVGb": {}}, "fileExtension": "HyhRjQfS", "name": "qf57OLGX", "shareCode": "3yFufVhm", "subType": "Aib6IAx8", "tags": ["6cwPgzL1", "vyfOMQzn", "geMnJ4WF"], "type": "D2ih5qdS"}' \
    > test.out 2>&1
eval_tap $? 103 'AdminCreateContentV2' test.out

#- 104 AdminDeleteOfficialContentV2
./ng net.accelbyte.sdk.cli.Main ugc adminDeleteOfficialContentV2 \
    --channelId 'BjFroxxf' \
    --contentId 'QwSap8qf' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 104 'AdminDeleteOfficialContentV2' test.out

#- 105 AdminUpdateOfficialContentV2
./ng net.accelbyte.sdk.cli.Main ugc adminUpdateOfficialContentV2 \
    --channelId 'L4ggxhcL' \
    --contentId 'RZ1ieVys' \
    --namespace "$AB_NAMESPACE" \
    --body '{"customAttributes": {"1rIsQ7dW": {}, "dv2AXCN5": {}, "C0edQSwm": {}}, "name": "pjTRhwIs", "shareCode": "9JSsXVT1", "subType": "jU60Fzmf", "tags": ["y5cot61v", "LjigwPcL", "puZezHhZ"], "type": "CgIlVgJV"}' \
    > test.out 2>&1
eval_tap $? 105 'AdminUpdateOfficialContentV2' test.out

#- 106 AdminCopyContent
./ng net.accelbyte.sdk.cli.Main ugc adminCopyContent \
    --channelId '3eZawQxa' \
    --contentId 'Npppp0Of' \
    --namespace "$AB_NAMESPACE" \
    --body '{"customAttributes": {"zsM2gZJC": {}, "9QlePN7W": {}, "VEOCIFfK": {}}, "name": "DZUkjp0G", "subType": "EbkSVz2m", "tags": ["LRzZ8p85", "YDo3NMVu", "7KjdYQg2"], "targetChannelId": "7gkVcH68", "type": "GUtsXSF1"}' \
    > test.out 2>&1
eval_tap $? 106 'AdminCopyContent' test.out

#- 107 AdminUpdateOfficialContentFileLocation
./ng net.accelbyte.sdk.cli.Main ugc adminUpdateOfficialContentFileLocation \
    --channelId 'Cs1NcNIZ' \
    --contentId 'HymcaEgf' \
    --namespace "$AB_NAMESPACE" \
    --body '{"fileExtension": "gJVeMK36", "fileLocation": "m8tHRvMw"}' \
    > test.out 2>&1
eval_tap $? 107 'AdminUpdateOfficialContentFileLocation' test.out

#- 108 AdminGenerateOfficialContentUploadURLV2
./ng net.accelbyte.sdk.cli.Main ugc adminGenerateOfficialContentUploadURLV2 \
    --channelId 'noLilatZ' \
    --contentId 'h0YD81r9' \
    --namespace "$AB_NAMESPACE" \
    --body '{"contentType": "BHhsJ74n", "fileExtension": "hbvBa8vt"}' \
    > test.out 2>&1
eval_tap $? 108 'AdminGenerateOfficialContentUploadURLV2' test.out

#- 109 AdminGetConfigs
./ng net.accelbyte.sdk.cli.Main ugc adminGetConfigs \
    --namespace "$AB_NAMESPACE" \
    --limit '35' \
    --offset '33' \
    > test.out 2>&1
eval_tap $? 109 'AdminGetConfigs' test.out

#- 110 AdminUpdateConfig
./ng net.accelbyte.sdk.cli.Main ugc adminUpdateConfig \
    --key 'tA8VquFs' \
    --namespace "$AB_NAMESPACE" \
    --body '{"value": "ynWr94An"}' \
    > test.out 2>&1
eval_tap $? 110 'AdminUpdateConfig' test.out

#- 111 AdminListContentV2
./ng net.accelbyte.sdk.cli.Main ugc adminListContentV2 \
    --namespace "$AB_NAMESPACE" \
    --isOfficial  \
    --limit '56' \
    --name '384GzCq4' \
    --offset '68' \
    --sortBy 'nPZWrsS0' \
    --subType 'eR10jRDw' \
    --tags '4ql4F3sW,s8PW0ujX,ilpFMGvT' \
    --type 'osZFkFmI' \
    > test.out 2>&1
eval_tap $? 111 'AdminListContentV2' test.out

#- 112 AdminBulkGetContentByIDsV2
./ng net.accelbyte.sdk.cli.Main ugc adminBulkGetContentByIDsV2 \
    --namespace "$AB_NAMESPACE" \
    --body '{"contentIds": ["gf2kjs8i", "rRRmPFFq", "gVwx2jsD"]}' \
    > test.out 2>&1
eval_tap $? 112 'AdminBulkGetContentByIDsV2' test.out

#- 113 AdminGetContentBulkByShareCodesV2
./ng net.accelbyte.sdk.cli.Main ugc adminGetContentBulkByShareCodesV2 \
    --namespace "$AB_NAMESPACE" \
    --body '{"shareCodes": ["GOmd4ArM", "OYxZoHGN", "JHIsFZSD"]}' \
    > test.out 2>&1
eval_tap $? 113 'AdminGetContentBulkByShareCodesV2' test.out

#- 114 AdminGetContentByShareCodeV2
./ng net.accelbyte.sdk.cli.Main ugc adminGetContentByShareCodeV2 \
    --namespace "$AB_NAMESPACE" \
    --shareCode 'UTyCK2lm' \
    > test.out 2>&1
eval_tap $? 114 'AdminGetContentByShareCodeV2' test.out

#- 115 AdminGetContentByContentIDV2
./ng net.accelbyte.sdk.cli.Main ugc adminGetContentByContentIDV2 \
    --contentId 'vXExMMcc' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 115 'AdminGetContentByContentIDV2' test.out

#- 116 RollbackContentVersionV2
./ng net.accelbyte.sdk.cli.Main ugc rollbackContentVersionV2 \
    --contentId 'tn7Xhwy2' \
    --namespace "$AB_NAMESPACE" \
    --versionId 'gHbRtUXq' \
    > test.out 2>&1
eval_tap $? 116 'RollbackContentVersionV2' test.out

#- 117 AdminUpdateScreenshotsV2
./ng net.accelbyte.sdk.cli.Main ugc adminUpdateScreenshotsV2 \
    --contentId 'F8MyJfHU' \
    --namespace "$AB_NAMESPACE" \
    --body '{"screenshots": [{"description": "EvZAdoFf", "screenshotId": "AwW5hFa3"}, {"description": "hD1PnAE8", "screenshotId": "iLFwV009"}, {"description": "Rd8peTE2", "screenshotId": "rkNMBDy2"}]}' \
    > test.out 2>&1
eval_tap $? 117 'AdminUpdateScreenshotsV2' test.out

#- 118 AdminUploadContentScreenshotV2
./ng net.accelbyte.sdk.cli.Main ugc adminUploadContentScreenshotV2 \
    --contentId 'oTj7rl8a' \
    --namespace "$AB_NAMESPACE" \
    --body '{"screenshots": [{"contentType": "K3kcqkb7", "description": "PNaFJh99", "fileExtension": "jfif"}, {"contentType": "2Yluglso", "description": "1oQIXwiD", "fileExtension": "jpeg"}, {"contentType": "IeeSLoCa", "description": "HQyGdBb1", "fileExtension": "pjp"}]}' \
    > test.out 2>&1
eval_tap $? 118 'AdminUploadContentScreenshotV2' test.out

#- 119 AdminDeleteContentScreenshotV2
./ng net.accelbyte.sdk.cli.Main ugc adminDeleteContentScreenshotV2 \
    --contentId 'Qpj83mAV' \
    --namespace "$AB_NAMESPACE" \
    --screenshotId 'VWTZPHoK' \
    > test.out 2>&1
eval_tap $? 119 'AdminDeleteContentScreenshotV2' test.out

#- 120 ListContentVersionsV2
./ng net.accelbyte.sdk.cli.Main ugc listContentVersionsV2 \
    --contentId 'S8ga3ckg' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 120 'ListContentVersionsV2' test.out

#- 121 AdminGetOfficialGroupContentsV2
./ng net.accelbyte.sdk.cli.Main ugc adminGetOfficialGroupContentsV2 \
    --groupId 'sED1tgUV' \
    --namespace "$AB_NAMESPACE" \
    --limit '88' \
    --offset '5' \
    > test.out 2>&1
eval_tap $? 121 'AdminGetOfficialGroupContentsV2' test.out

#- 122 AdminListStagingContents
./ng net.accelbyte.sdk.cli.Main ugc adminListStagingContents \
    --namespace "$AB_NAMESPACE" \
    --limit '12' \
    --offset '10' \
    --sortBy 'IuiL6mrM' \
    --status 'LiubOwTZ' \
    > test.out 2>&1
eval_tap $? 122 'AdminListStagingContents' test.out

#- 123 AdminGetStagingContentByID
./ng net.accelbyte.sdk.cli.Main ugc adminGetStagingContentByID \
    --contentId 'OQgQHef5' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 123 'AdminGetStagingContentByID' test.out

#- 124 AdminApproveStagingContent
./ng net.accelbyte.sdk.cli.Main ugc adminApproveStagingContent \
    --contentId 'DwqmynNw' \
    --namespace "$AB_NAMESPACE" \
    --body '{"approved": false, "note": "6TJGPuAs"}' \
    > test.out 2>&1
eval_tap $? 124 'AdminApproveStagingContent' test.out

#- 125 AdminUpdateContentByShareCodeV2
./ng net.accelbyte.sdk.cli.Main ugc adminUpdateContentByShareCodeV2 \
    --channelId 'fT1znLVH' \
    --namespace "$AB_NAMESPACE" \
    --shareCode 'jYETA3wS' \
    --userId '34m8iMgi' \
    --body '{"customAttributes": {"RGpnGX58": {}, "JxJb2IZG": {}, "7zxiB3Sx": {}}, "name": "xDCmpsv3", "shareCode": "SHhcS6CD", "subType": "MDNhcxs3", "tags": ["JtdScDzV", "L45sb5cD", "2CsVMnCK"], "type": "5AxrTXJ7"}' \
    > test.out 2>&1
eval_tap $? 125 'AdminUpdateContentByShareCodeV2' test.out

#- 126 AdminDeleteContentByShareCodeV2
./ng net.accelbyte.sdk.cli.Main ugc adminDeleteContentByShareCodeV2 \
    --channelId 'niP2YpU3' \
    --namespace "$AB_NAMESPACE" \
    --shareCode 'Rbqd1bdJ' \
    --userId 'Vk0civnx' \
    > test.out 2>&1
eval_tap $? 126 'AdminDeleteContentByShareCodeV2' test.out

#- 127 AdminDeleteUserContentV2
./ng net.accelbyte.sdk.cli.Main ugc adminDeleteUserContentV2 \
    --channelId 'IfRS3R3i' \
    --contentId 'DaPp0iFC' \
    --namespace "$AB_NAMESPACE" \
    --userId 'bnXkhKQW' \
    > test.out 2>&1
eval_tap $? 127 'AdminDeleteUserContentV2' test.out

#- 128 AdminUpdateUserContentV2
./ng net.accelbyte.sdk.cli.Main ugc adminUpdateUserContentV2 \
    --channelId 'aHmdYQ09' \
    --contentId 'hYkigFMb' \
    --namespace "$AB_NAMESPACE" \
    --userId 'o697c8GC' \
    --body '{"customAttributes": {"IoeBxe18": {}, "2BiFlH6t": {}, "p8PbdYBU": {}}, "name": "Q4xvzChc", "shareCode": "Gr7BSRZg", "subType": "A6tkV4vd", "tags": ["hwwmgL4k", "EMJzEIEj", "V0zsqYBC"], "type": "dsqu6snz"}' \
    > test.out 2>&1
eval_tap $? 128 'AdminUpdateUserContentV2' test.out

#- 129 AdminUpdateUserContentFileLocation
./ng net.accelbyte.sdk.cli.Main ugc adminUpdateUserContentFileLocation \
    --channelId '9jbLrbW3' \
    --contentId 'CC67WkvT' \
    --namespace "$AB_NAMESPACE" \
    --userId 'w2hhgVJo' \
    --body '{"fileExtension": "aUWNiWcI", "fileLocation": "7OKFFtCh"}' \
    > test.out 2>&1
eval_tap $? 129 'AdminUpdateUserContentFileLocation' test.out

#- 130 AdminGenerateUserContentUploadURLV2
./ng net.accelbyte.sdk.cli.Main ugc adminGenerateUserContentUploadURLV2 \
    --channelId 'XmoPwPrq' \
    --contentId 'D8thWz0L' \
    --namespace "$AB_NAMESPACE" \
    --userId 'SKEvNxnH' \
    --body '{"contentType": "wO7xWee5", "fileExtension": "KXsoOGiq"}' \
    > test.out 2>&1
eval_tap $? 130 'AdminGenerateUserContentUploadURLV2' test.out

#- 131 AdminGetContentByUserIDV2
./ng net.accelbyte.sdk.cli.Main ugc adminGetContentByUserIDV2 \
    --namespace "$AB_NAMESPACE" \
    --userId '3xJb7ypF' \
    --limit '52' \
    --offset '79' \
    --sortBy '1Zq6qCIm' \
    > test.out 2>&1
eval_tap $? 131 'AdminGetContentByUserIDV2' test.out

#- 132 AdminUpdateContentHideStatusV2
./ng net.accelbyte.sdk.cli.Main ugc adminUpdateContentHideStatusV2 \
    --contentId 'eLaNnb5N' \
    --namespace "$AB_NAMESPACE" \
    --userId 'eAQhdPP3' \
    --body '{"isHidden": false}' \
    > test.out 2>&1
eval_tap $? 132 'AdminUpdateContentHideStatusV2' test.out

#- 133 AdminGetUserGroupContentsV2
./ng net.accelbyte.sdk.cli.Main ugc adminGetUserGroupContentsV2 \
    --groupId '2Vg8VvMB' \
    --namespace "$AB_NAMESPACE" \
    --userId 'Jo3T8DsM' \
    --limit '12' \
    --offset '53' \
    > test.out 2>&1
eval_tap $? 133 'AdminGetUserGroupContentsV2' test.out

#- 134 AdminListUserStagingContents
./ng net.accelbyte.sdk.cli.Main ugc adminListUserStagingContents \
    --namespace "$AB_NAMESPACE" \
    --userId 'aJKOIQQU' \
    --limit '17' \
    --offset '23' \
    --sortBy 'RsPAv0F2' \
    --status 'WCndpu3R' \
    > test.out 2>&1
eval_tap $? 134 'AdminListUserStagingContents' test.out

#- 135 PublicGetContentByChannelIDV2
./ng net.accelbyte.sdk.cli.Main ugc publicGetContentByChannelIDV2 \
    --channelId '7Xce82c1' \
    --namespace "$AB_NAMESPACE" \
    --limit '0' \
    --name 'pTo5DKvx' \
    --offset '75' \
    --sortBy 'kY7YZ5eV' \
    > test.out 2>&1
eval_tap $? 135 'PublicGetContentByChannelIDV2' test.out

#- 136 PublicListContentV2
./ng net.accelbyte.sdk.cli.Main ugc publicListContentV2 \
    --namespace "$AB_NAMESPACE" \
    --isOfficial  \
    --limit '19' \
    --name 'r99ItiuX' \
    --offset '91' \
    --sortBy 'U01CxRCM' \
    --subType 'hP0EIIcX' \
    --tags 'qov8v6My,EoAiEcvf,tIebj8EC' \
    --type 'XkxjtWEo' \
    > test.out 2>&1
eval_tap $? 136 'PublicListContentV2' test.out

#- 137 PublicBulkGetContentByIDV2
./ng net.accelbyte.sdk.cli.Main ugc publicBulkGetContentByIDV2 \
    --namespace "$AB_NAMESPACE" \
    --body '{"contentIds": ["G7BNRMSv", "IK94eCle", "A6ibrE0D"]}' \
    > test.out 2>&1
eval_tap $? 137 'PublicBulkGetContentByIDV2' test.out

#- 138 PublicGetContentBulkByShareCodesV2
./ng net.accelbyte.sdk.cli.Main ugc publicGetContentBulkByShareCodesV2 \
    --namespace "$AB_NAMESPACE" \
    --body '{"shareCodes": ["0jbHO5NR", "2XfhAFAo", "ftF1EtOE"]}' \
    > test.out 2>&1
eval_tap $? 138 'PublicGetContentBulkByShareCodesV2' test.out

#- 139 PublicGetContentByShareCodeV2
./ng net.accelbyte.sdk.cli.Main ugc publicGetContentByShareCodeV2 \
    --namespace "$AB_NAMESPACE" \
    --shareCode 'KNpIfoEV' \
    > test.out 2>&1
eval_tap $? 139 'PublicGetContentByShareCodeV2' test.out

#- 140 PublicGetContentByIDV2
./ng net.accelbyte.sdk.cli.Main ugc publicGetContentByIDV2 \
    --contentId 'AxpjUBHH' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 140 'PublicGetContentByIDV2' test.out

#- 141 PublicAddDownloadCountV2
./ng net.accelbyte.sdk.cli.Main ugc publicAddDownloadCountV2 \
    --contentId 'Oia6g2MI' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 141 'PublicAddDownloadCountV2' test.out

#- 142 PublicListContentDownloaderV2
./ng net.accelbyte.sdk.cli.Main ugc publicListContentDownloaderV2 \
    --contentId '2ySEntW7' \
    --namespace "$AB_NAMESPACE" \
    --limit '77' \
    --offset '31' \
    --sortBy 'F5XD4rKL' \
    --userId 'cdE6EvBg' \
    > test.out 2>&1
eval_tap $? 142 'PublicListContentDownloaderV2' test.out

#- 143 PublicListContentLikeV2
./ng net.accelbyte.sdk.cli.Main ugc publicListContentLikeV2 \
    --contentId '7bQKKQQA' \
    --namespace "$AB_NAMESPACE" \
    --limit '69' \
    --offset '58' \
    --sortBy 'LnZq2bDN' \
    > test.out 2>&1
eval_tap $? 143 'PublicListContentLikeV2' test.out

#- 144 UpdateContentLikeStatusV2
./ng net.accelbyte.sdk.cli.Main ugc updateContentLikeStatusV2 \
    --contentId 'IRyUz82c' \
    --namespace "$AB_NAMESPACE" \
    --body '{"likeStatus": true}' \
    > test.out 2>&1
eval_tap $? 144 'UpdateContentLikeStatusV2' test.out

#- 145 PublicCreateContentV2
./ng net.accelbyte.sdk.cli.Main ugc publicCreateContentV2 \
    --channelId 'YXEkY5Fb' \
    --namespace "$AB_NAMESPACE" \
    --userId 'cHDOMr2p' \
    --body '{"contentType": "bdkcprWL", "customAttributes": {"Ho2rjRhP": {}, "jqzfANn2": {}, "o6WogwZR": {}}, "fileExtension": "yKUUykUT", "name": "WUmspqQS", "subType": "LYidLsjv", "tags": ["LSUNEpD3", "J1m3gs3V", "GnAPj1OJ"], "type": "oi7VPSix"}' \
    > test.out 2>&1
eval_tap $? 145 'PublicCreateContentV2' test.out

#- 146 PublicUpdateContentByShareCodeV2
./ng net.accelbyte.sdk.cli.Main ugc publicUpdateContentByShareCodeV2 \
    --channelId 'qBhk8gi2' \
    --namespace "$AB_NAMESPACE" \
    --shareCode 'F0N59kzO' \
    --userId 'WWBTEf0V' \
    --body '{"customAttributes": {"NabrEbLr": {}, "f3WeC75S": {}, "X1DZovEF": {}}, "name": "WWU4Disj", "subType": "qKt5leJX", "tags": ["7JSXhvnH", "GyLSsBlc", "cj8YzYRa"], "type": "LMFyK1Hg"}' \
    > test.out 2>&1
eval_tap $? 146 'PublicUpdateContentByShareCodeV2' test.out

#- 147 PublicDeleteContentByShareCodeV2
./ng net.accelbyte.sdk.cli.Main ugc publicDeleteContentByShareCodeV2 \
    --channelId 'IgsXTfKo' \
    --namespace "$AB_NAMESPACE" \
    --shareCode 'b67mYYo4' \
    --userId 'f7kP2Lnp' \
    > test.out 2>&1
eval_tap $? 147 'PublicDeleteContentByShareCodeV2' test.out

#- 148 PublicDeleteContentV2
./ng net.accelbyte.sdk.cli.Main ugc publicDeleteContentV2 \
    --channelId 'b8bUfJoc' \
    --contentId 'gNajsKJk' \
    --namespace "$AB_NAMESPACE" \
    --userId 'bZVxgKM1' \
    > test.out 2>&1
eval_tap $? 148 'PublicDeleteContentV2' test.out

#- 149 PublicUpdateContentV2
./ng net.accelbyte.sdk.cli.Main ugc publicUpdateContentV2 \
    --channelId 'XIlA4Wt0' \
    --contentId 'hmW322O3' \
    --namespace "$AB_NAMESPACE" \
    --userId 'MBq0HQGW' \
    --body '{"customAttributes": {"Vsv6vHYj": {}, "p5AZA7mN": {}, "Dl0FP7An": {}}, "name": "RTi1gSZS", "subType": "LTNfscLD", "tags": ["IKGVqjVy", "XjlWaK7S", "uLIcSONT"], "type": "cUn9fi4v"}' \
    > test.out 2>&1
eval_tap $? 149 'PublicUpdateContentV2' test.out

#- 150 PublicUpdateContentFileLocation
./ng net.accelbyte.sdk.cli.Main ugc publicUpdateContentFileLocation \
    --channelId 'Rw7hJY8y' \
    --contentId 'WuR8WxvD' \
    --namespace "$AB_NAMESPACE" \
    --userId 'e0T0K7Z5' \
    --body '{"fileExtension": "23XKSQWB", "fileLocation": "xE8DBzcx"}' \
    > test.out 2>&1
eval_tap $? 150 'PublicUpdateContentFileLocation' test.out

#- 151 UpdateContentShareCodeV2
./ng net.accelbyte.sdk.cli.Main ugc updateContentShareCodeV2 \
    --channelId 'HBEvL168' \
    --contentId 'e7jBk4M7' \
    --namespace "$AB_NAMESPACE" \
    --userId 'aYy8Ofgx' \
    --body '{"shareCode": "eohqdFHS"}' \
    > test.out 2>&1
eval_tap $? 151 'UpdateContentShareCodeV2' test.out

#- 152 PublicGenerateContentUploadURLV2
./ng net.accelbyte.sdk.cli.Main ugc publicGenerateContentUploadURLV2 \
    --channelId 'HsBTRTF4' \
    --contentId 'KioeXfJb' \
    --namespace "$AB_NAMESPACE" \
    --userId 'GJXLXS5N' \
    --body '{"contentType": "Z64TGiJC", "fileExtension": "O9znb3QX"}' \
    > test.out 2>&1
eval_tap $? 152 'PublicGenerateContentUploadURLV2' test.out

#- 153 PublicGetContentByUserIDV2
./ng net.accelbyte.sdk.cli.Main ugc publicGetContentByUserIDV2 \
    --namespace "$AB_NAMESPACE" \
    --userId 'Cz1jxEok' \
    --limit '5' \
    --offset '10' \
    --sortBy 'U8Ud8I3z' \
    > test.out 2>&1
eval_tap $? 153 'PublicGetContentByUserIDV2' test.out

#- 154 UpdateScreenshotsV2
./ng net.accelbyte.sdk.cli.Main ugc updateScreenshotsV2 \
    --contentId 'bgY0oyZt' \
    --namespace "$AB_NAMESPACE" \
    --userId 'jsUZDRGX' \
    --body '{"screenshots": [{"description": "5Wk2HGa5", "screenshotId": "SKo0HrNW"}, {"description": "CAz74UkF", "screenshotId": "IP3bdtpx"}, {"description": "yOjODlq5", "screenshotId": "tX9B3WHr"}]}' \
    > test.out 2>&1
eval_tap $? 154 'UpdateScreenshotsV2' test.out

#- 155 UploadContentScreenshotV2
./ng net.accelbyte.sdk.cli.Main ugc uploadContentScreenshotV2 \
    --contentId 'QIqj2jwY' \
    --namespace "$AB_NAMESPACE" \
    --userId 'aHqt2ILi' \
    --body '{"screenshots": [{"contentType": "bKhRHTHf", "description": "70Nwcv5b", "fileExtension": "jpg"}, {"contentType": "JHxoimS3", "description": "sXiHvSzq", "fileExtension": "bmp"}, {"contentType": "bnfhQTqc", "description": "Bm5lckK3", "fileExtension": "bmp"}]}' \
    > test.out 2>&1
eval_tap $? 155 'UploadContentScreenshotV2' test.out

#- 156 DeleteContentScreenshotV2
./ng net.accelbyte.sdk.cli.Main ugc deleteContentScreenshotV2 \
    --contentId 'Dvu3bVMq' \
    --namespace "$AB_NAMESPACE" \
    --screenshotId '21S3wJQ2' \
    --userId 'AajItTQi' \
    > test.out 2>&1
eval_tap $? 156 'DeleteContentScreenshotV2' test.out

#- 157 PublicGetGroupContentsV2
./ng net.accelbyte.sdk.cli.Main ugc publicGetGroupContentsV2 \
    --groupId 'L1TBoRBP' \
    --namespace "$AB_NAMESPACE" \
    --userId 'DiXt5M0P' \
    --limit '47' \
    --offset '69' \
    > test.out 2>&1
eval_tap $? 157 'PublicGetGroupContentsV2' test.out

#- 158 ListUserStagingContents
./ng net.accelbyte.sdk.cli.Main ugc listUserStagingContents \
    --namespace "$AB_NAMESPACE" \
    --userId '6XqLneYY' \
    --limit '17' \
    --offset '69' \
    --sortBy '6r2AA6in' \
    --status 'ImTrlCRz' \
    > test.out 2>&1
eval_tap $? 158 'ListUserStagingContents' test.out

#- 159 GetUserStagingContentByID
./ng net.accelbyte.sdk.cli.Main ugc getUserStagingContentByID \
    --contentId 'T4gW1FWw' \
    --namespace "$AB_NAMESPACE" \
    --userId 'fe75tKk4' \
    > test.out 2>&1
eval_tap $? 159 'GetUserStagingContentByID' test.out

#- 160 UpdateStagingContent
./ng net.accelbyte.sdk.cli.Main ugc updateStagingContent \
    --contentId 'ostIdz38' \
    --namespace "$AB_NAMESPACE" \
    --userId 'YITqidla' \
    --body '{"fileExtension": "6d0370O6", "fileLocation": "KpuCuCP8"}' \
    > test.out 2>&1
eval_tap $? 160 'UpdateStagingContent' test.out

#- 161 DeleteUserStagingContentByID
./ng net.accelbyte.sdk.cli.Main ugc deleteUserStagingContentByID \
    --contentId 'ydMsqS4r' \
    --namespace "$AB_NAMESPACE" \
    --userId 'AHjGOVBi' \
    > test.out 2>&1
eval_tap $? 161 'DeleteUserStagingContentByID' test.out


rm -f "tmp.dat"

exit $EXIT_CODE