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
    --limit '28' \
    --offset '15' \
    > test.out 2>&1
eval_tap $? 2 'SingleAdminGetChannel' test.out

#- 3 AdminCreateChannel
./ng net.accelbyte.sdk.cli.Main ugc adminCreateChannel \
    --namespace "$AB_NAMESPACE" \
    --body '{"id": "dqYI4qhD", "name": "efsKpi70"}' \
    > test.out 2>&1
eval_tap $? 3 'AdminCreateChannel' test.out

#- 4 SingleAdminUpdateChannel
./ng net.accelbyte.sdk.cli.Main ugc singleAdminUpdateChannel \
    --channelId 'VTKYKmPi' \
    --namespace "$AB_NAMESPACE" \
    --body '{"name": "WvcN0BR7"}' \
    > test.out 2>&1
eval_tap $? 4 'SingleAdminUpdateChannel' test.out

#- 5 SingleAdminDeleteChannel
./ng net.accelbyte.sdk.cli.Main ugc singleAdminDeleteChannel \
    --channelId 'cY5Ezpvw' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 5 'SingleAdminDeleteChannel' test.out

#- 6 AdminUploadContentDirect
eval_tap 0 6 'AdminUploadContentDirect # SKIP deprecated' test.out

#- 7 AdminUploadContentS3
./ng net.accelbyte.sdk.cli.Main ugc adminUploadContentS3 \
    --channelId 'Lv6FuYGp' \
    --namespace "$AB_NAMESPACE" \
    --body '{"contentType": "DD3jHbjP", "customAttributes": {"Bf9tKNpM": {}, "4BbVYCtG": {}, "LYvomqa6": {}}, "fileExtension": "cB4X7EUz", "name": "FchAh3vn", "preview": "j1bmFOiW", "previewMetadata": {"previewContentType": "zin3xL6W", "previewFileExtension": "HkCUwhrV"}, "shareCode": "jUaxVgVR", "subType": "fyyqLUSw", "tags": ["JWHZ10YC", "zUaRMIfG", "lba0UF9V"], "type": "23rzXNtB"}' \
    > test.out 2>&1
eval_tap $? 7 'AdminUploadContentS3' test.out

#- 8 SingleAdminUpdateContentS3
./ng net.accelbyte.sdk.cli.Main ugc singleAdminUpdateContentS3 \
    --channelId 'TY4wDDbN' \
    --contentId '5HJPYKvV' \
    --namespace "$AB_NAMESPACE" \
    --body '{"contentType": "LNXOUyOQ", "customAttributes": {"NUFQdblL": {}, "oVkAsyWn": {}, "B3mTlKmz": {}}, "fileExtension": "cLfzW9hl", "name": "57LQbmOE", "payload": "pGGz4DyP", "preview": "09Rm4nFt", "previewMetadata": {"previewContentType": "CEXgypvJ", "previewFileExtension": "8w45L8Xq"}, "shareCode": "BbzU6gxX", "subType": "CxubjsMS", "tags": ["8hU9zZOX", "yv4n1gCg", "F84cUxjw"], "type": "BBn85GhQ", "updateContentFile": true}' \
    > test.out 2>&1
eval_tap $? 8 'SingleAdminUpdateContentS3' test.out

#- 9 AdminSearchChannelSpecificContent
./ng net.accelbyte.sdk.cli.Main ugc adminSearchChannelSpecificContent \
    --channelId 'no1dCmMu' \
    --namespace "$AB_NAMESPACE" \
    --creator 'rNjKxJwZ' \
    --ishidden 'hmd5wQjs' \
    --isofficial 'RlDGuYoN' \
    --limit '77' \
    --name 'fXEth8o6' \
    --offset '87' \
    --orderby 'wMtD8Cd6' \
    --sortby 'gawhSb8i' \
    --subtype '7wB7phND' \
    --tags 'dmQXqccr,qd1OxKSF,yKVlmvZx' \
    --type 'HZocO0Z1' \
    --userId 'uMSDvSB7' \
    > test.out 2>&1
eval_tap $? 9 'AdminSearchChannelSpecificContent' test.out

#- 10 SingleAdminUpdateContentDirect
eval_tap 0 10 'SingleAdminUpdateContentDirect # SKIP deprecated' test.out

#- 11 SingleAdminDeleteContent
./ng net.accelbyte.sdk.cli.Main ugc singleAdminDeleteContent \
    --channelId 'kXmblYhN' \
    --contentId 'fkUr625c' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 11 'SingleAdminDeleteContent' test.out

#- 12 SingleAdminGetContent
./ng net.accelbyte.sdk.cli.Main ugc singleAdminGetContent \
    --namespace "$AB_NAMESPACE" \
    --limit '29' \
    --offset '35' \
    > test.out 2>&1
eval_tap $? 12 'SingleAdminGetContent' test.out

#- 13 AdminGetContentBulk
./ng net.accelbyte.sdk.cli.Main ugc adminGetContentBulk \
    --namespace "$AB_NAMESPACE" \
    --body '{"contentIds": ["bFFJc2SY", "qOmoPzTZ", "91Km1M9Y"]}' \
    > test.out 2>&1
eval_tap $? 13 'AdminGetContentBulk' test.out

#- 14 AdminSearchContent
./ng net.accelbyte.sdk.cli.Main ugc adminSearchContent \
    --namespace "$AB_NAMESPACE" \
    --creator 'g8GhMzwz' \
    --ishidden 'wSRSnw5V' \
    --isofficial 'QBTsnGzV' \
    --limit '75' \
    --name 'rRhkK9gq' \
    --offset '61' \
    --orderby 'zqMY5hJ9' \
    --sortby 'AX0dng2j' \
    --subtype 'KfY6YhFN' \
    --tags 'kK5HEGwl,C6oNsHt3,WEfo0Qiz' \
    --type 'OzsGVfGs' \
    --userId 'HOgqxx4Q' \
    > test.out 2>&1
eval_tap $? 14 'AdminSearchContent' test.out

#- 15 AdminGetContentBulkByShareCodes
./ng net.accelbyte.sdk.cli.Main ugc adminGetContentBulkByShareCodes \
    --namespace "$AB_NAMESPACE" \
    --body '{"shareCodes": ["FZrQQewn", "MMCFJZX3", "OsftD4Xv"]}' \
    > test.out 2>&1
eval_tap $? 15 'AdminGetContentBulkByShareCodes' test.out

#- 16 AdminGetUserContentByShareCode
./ng net.accelbyte.sdk.cli.Main ugc adminGetUserContentByShareCode \
    --namespace "$AB_NAMESPACE" \
    --shareCode 'IVDttkT3' \
    > test.out 2>&1
eval_tap $? 16 'AdminGetUserContentByShareCode' test.out

#- 17 AdminGetSpecificContent
./ng net.accelbyte.sdk.cli.Main ugc adminGetSpecificContent \
    --contentId 'h0H9QPX3' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 17 'AdminGetSpecificContent' test.out

#- 18 AdminDownloadContentPreview
./ng net.accelbyte.sdk.cli.Main ugc adminDownloadContentPreview \
    --contentId 'HmX045Bd' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 18 'AdminDownloadContentPreview' test.out

#- 19 RollbackContentVersion
./ng net.accelbyte.sdk.cli.Main ugc rollbackContentVersion \
    --contentId 'dQfLI7WK' \
    --namespace "$AB_NAMESPACE" \
    --versionId 'OKUNSLiy' \
    > test.out 2>&1
eval_tap $? 19 'RollbackContentVersion' test.out

#- 20 AdminUpdateScreenshots
./ng net.accelbyte.sdk.cli.Main ugc adminUpdateScreenshots \
    --contentId 'pMQQy2Ep' \
    --namespace "$AB_NAMESPACE" \
    --body '{"screenshots": [{"description": "HwFbOGD4", "screenshotId": "KSJJogkj"}, {"description": "Oncjf3O6", "screenshotId": "YgLBrGfN"}, {"description": "li7sQnGc", "screenshotId": "KaybEtxW"}]}' \
    > test.out 2>&1
eval_tap $? 20 'AdminUpdateScreenshots' test.out

#- 21 AdminUploadContentScreenshot
./ng net.accelbyte.sdk.cli.Main ugc adminUploadContentScreenshot \
    --contentId 'fPONvc08' \
    --namespace "$AB_NAMESPACE" \
    --body '{"screenshots": [{"contentType": "yUzD60ZR", "description": "9EbSkMuM", "fileExtension": "jfif"}, {"contentType": "O75Z1F6Y", "description": "E8FGq6BA", "fileExtension": "pjp"}, {"contentType": "dCO441ij", "description": "kAJepgOn", "fileExtension": "jfif"}]}' \
    > test.out 2>&1
eval_tap $? 21 'AdminUploadContentScreenshot' test.out

#- 22 AdminDeleteContentScreenshot
./ng net.accelbyte.sdk.cli.Main ugc adminDeleteContentScreenshot \
    --contentId '0V4CF7xE' \
    --namespace "$AB_NAMESPACE" \
    --screenshotId 'IsfDThII' \
    > test.out 2>&1
eval_tap $? 22 'AdminDeleteContentScreenshot' test.out

#- 23 ListContentVersions
./ng net.accelbyte.sdk.cli.Main ugc listContentVersions \
    --contentId 'twVZPuIO' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 23 'ListContentVersions' test.out

#- 24 SingleAdminGetAllGroups
./ng net.accelbyte.sdk.cli.Main ugc singleAdminGetAllGroups \
    --namespace "$AB_NAMESPACE" \
    --limit '17' \
    --offset '86' \
    > test.out 2>&1
eval_tap $? 24 'SingleAdminGetAllGroups' test.out

#- 25 AdminCreateGroup
./ng net.accelbyte.sdk.cli.Main ugc adminCreateGroup \
    --namespace "$AB_NAMESPACE" \
    --body '{"contents": ["4V3ghQO2", "C3zmzFxR", "8JgKNAAU"], "name": "MOEVpC8G"}' \
    > test.out 2>&1
eval_tap $? 25 'AdminCreateGroup' test.out

#- 26 SingleAdminGetGroup
./ng net.accelbyte.sdk.cli.Main ugc singleAdminGetGroup \
    --groupId 'fFliWZVr' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 26 'SingleAdminGetGroup' test.out

#- 27 SingleAdminUpdateGroup
./ng net.accelbyte.sdk.cli.Main ugc singleAdminUpdateGroup \
    --groupId 'lQvv4Ihk' \
    --namespace "$AB_NAMESPACE" \
    --body '{"contents": ["wPdKVz2b", "DZcLhbGX", "grIszgcn"], "name": "pNXsDi9F"}' \
    > test.out 2>&1
eval_tap $? 27 'SingleAdminUpdateGroup' test.out

#- 28 SingleAdminDeleteGroup
./ng net.accelbyte.sdk.cli.Main ugc singleAdminDeleteGroup \
    --groupId '1WvlroAh' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 28 'SingleAdminDeleteGroup' test.out

#- 29 SingleAdminGetGroupContents
./ng net.accelbyte.sdk.cli.Main ugc singleAdminGetGroupContents \
    --groupId '3U79uWa5' \
    --namespace "$AB_NAMESPACE" \
    --limit '34' \
    --offset '17' \
    > test.out 2>&1
eval_tap $? 29 'SingleAdminGetGroupContents' test.out

#- 30 AdminGetTag
./ng net.accelbyte.sdk.cli.Main ugc adminGetTag \
    --namespace "$AB_NAMESPACE" \
    --limit '99' \
    --offset '6' \
    > test.out 2>&1
eval_tap $? 30 'AdminGetTag' test.out

#- 31 AdminCreateTag
./ng net.accelbyte.sdk.cli.Main ugc adminCreateTag \
    --namespace "$AB_NAMESPACE" \
    --body '{"tag": "mv1ngeGB"}' \
    > test.out 2>&1
eval_tap $? 31 'AdminCreateTag' test.out

#- 32 AdminUpdateTag
./ng net.accelbyte.sdk.cli.Main ugc adminUpdateTag \
    --namespace "$AB_NAMESPACE" \
    --tagId 'IzcPXV84' \
    --body '{"tag": "0FPnimhd"}' \
    > test.out 2>&1
eval_tap $? 32 'AdminUpdateTag' test.out

#- 33 AdminDeleteTag
./ng net.accelbyte.sdk.cli.Main ugc adminDeleteTag \
    --namespace "$AB_NAMESPACE" \
    --tagId '6V6PTHbQ' \
    > test.out 2>&1
eval_tap $? 33 'AdminDeleteTag' test.out

#- 34 AdminGetType
./ng net.accelbyte.sdk.cli.Main ugc adminGetType \
    --namespace "$AB_NAMESPACE" \
    --limit '32' \
    --offset '77' \
    > test.out 2>&1
eval_tap $? 34 'AdminGetType' test.out

#- 35 AdminCreateType
./ng net.accelbyte.sdk.cli.Main ugc adminCreateType \
    --namespace "$AB_NAMESPACE" \
    --body '{"subtype": ["9ObsLeHa", "gGSuVzaa", "rrJSJetU"], "type": "XTy5kiFt"}' \
    > test.out 2>&1
eval_tap $? 35 'AdminCreateType' test.out

#- 36 AdminUpdateType
./ng net.accelbyte.sdk.cli.Main ugc adminUpdateType \
    --namespace "$AB_NAMESPACE" \
    --typeId 'xQ1wq2e2' \
    --body '{"subtype": ["9sQS45tl", "cCp3cRT4", "1TMRJ8Mz"], "type": "6RoG3zqk"}' \
    > test.out 2>&1
eval_tap $? 36 'AdminUpdateType' test.out

#- 37 AdminDeleteType
./ng net.accelbyte.sdk.cli.Main ugc adminDeleteType \
    --namespace "$AB_NAMESPACE" \
    --typeId 'JxHIHCVN' \
    > test.out 2>&1
eval_tap $? 37 'AdminDeleteType' test.out

#- 38 AdminGetChannel
./ng net.accelbyte.sdk.cli.Main ugc adminGetChannel \
    --namespace "$AB_NAMESPACE" \
    --userId '5PKLYPVM' \
    --limit '91' \
    --name 'rdoA5qbK' \
    --offset '80' \
    > test.out 2>&1
eval_tap $? 38 'AdminGetChannel' test.out

#- 39 AdminDeleteAllUserChannels
./ng net.accelbyte.sdk.cli.Main ugc adminDeleteAllUserChannels \
    --namespace "$AB_NAMESPACE" \
    --userId 'oIsFxH6z' \
    > test.out 2>&1
eval_tap $? 39 'AdminDeleteAllUserChannels' test.out

#- 40 AdminUpdateChannel
./ng net.accelbyte.sdk.cli.Main ugc adminUpdateChannel \
    --channelId 'V5S9i4oD' \
    --namespace "$AB_NAMESPACE" \
    --userId 'wnStFQx4' \
    --body '{"name": "6SfkG65U"}' \
    > test.out 2>&1
eval_tap $? 40 'AdminUpdateChannel' test.out

#- 41 AdminDeleteChannel
./ng net.accelbyte.sdk.cli.Main ugc adminDeleteChannel \
    --channelId '7JFesuvf' \
    --namespace "$AB_NAMESPACE" \
    --userId 'Z1tPPyFq' \
    > test.out 2>&1
eval_tap $? 41 'AdminDeleteChannel' test.out

#- 42 AdminUpdateContentS3ByShareCode
./ng net.accelbyte.sdk.cli.Main ugc adminUpdateContentS3ByShareCode \
    --channelId 'GGngO6CR' \
    --namespace "$AB_NAMESPACE" \
    --shareCode 'BY8Bmswc' \
    --userId 'MOAuWCMw' \
    --body '{"contentType": "boJqBvoj", "customAttributes": {"DacS8BSK": {}, "dRynKEcN": {}, "MYussRud": {}}, "fileExtension": "R8uyHbYT", "name": "Aoa5poyp", "payload": "T31h9yNY", "preview": "ikels99l", "previewMetadata": {"previewContentType": "yWIrmDAr", "previewFileExtension": "g7M6kYKN"}, "shareCode": "7yz2jZyn", "subType": "BUuSZJ62", "tags": ["fRnnyiJV", "oKrjSAZn", "9EjX4wGQ"], "type": "ShZFqRWV", "updateContentFile": true}' \
    > test.out 2>&1
eval_tap $? 42 'AdminUpdateContentS3ByShareCode' test.out

#- 43 AdminUpdateContentS3
./ng net.accelbyte.sdk.cli.Main ugc adminUpdateContentS3 \
    --channelId 'NaVx1b7w' \
    --contentId 'LlF8yUPb' \
    --namespace "$AB_NAMESPACE" \
    --userId 'wiaWjvXL' \
    --body '{"contentType": "aMEwZfFF", "customAttributes": {"HyDw2hMw": {}, "UDsXiocn": {}, "lujEOeW1": {}}, "fileExtension": "8i37fG9T", "name": "74075eJx", "payload": "VOZvEro8", "preview": "O7BiEXnj", "previewMetadata": {"previewContentType": "zWUjKyvz", "previewFileExtension": "GVahP6AS"}, "shareCode": "ogG3hK61", "subType": "cedDDfBR", "tags": ["Q1su01wG", "zljrvJLB", "o9nPHd9T"], "type": "07Rv8VOB", "updateContentFile": false}' \
    > test.out 2>&1
eval_tap $? 43 'AdminUpdateContentS3' test.out

#- 44 DeleteContentByShareCode
./ng net.accelbyte.sdk.cli.Main ugc deleteContentByShareCode \
    --channelId 'hfVEkncO' \
    --namespace "$AB_NAMESPACE" \
    --shareCode 'i3oLPmSq' \
    --userId 'zLGtNQJn' \
    > test.out 2>&1
eval_tap $? 44 'DeleteContentByShareCode' test.out

#- 45 AdminUpdateContentDirect
eval_tap 0 45 'AdminUpdateContentDirect # SKIP deprecated' test.out

#- 46 AdminDeleteContent
./ng net.accelbyte.sdk.cli.Main ugc adminDeleteContent \
    --channelId 'NcXHSuyg' \
    --contentId 'BC3lOxKk' \
    --namespace "$AB_NAMESPACE" \
    --userId 'zKBGGK7u' \
    > test.out 2>&1
eval_tap $? 46 'AdminDeleteContent' test.out

#- 47 AdminGetContent
./ng net.accelbyte.sdk.cli.Main ugc adminGetContent \
    --namespace "$AB_NAMESPACE" \
    --userId 'LFML3kXJ' \
    --limit '39' \
    --offset '92' \
    > test.out 2>&1
eval_tap $? 47 'AdminGetContent' test.out

#- 48 AdminDeleteAllUserContents
./ng net.accelbyte.sdk.cli.Main ugc adminDeleteAllUserContents \
    --namespace "$AB_NAMESPACE" \
    --userId 'nY2CdG4l' \
    > test.out 2>&1
eval_tap $? 48 'AdminDeleteAllUserContents' test.out

#- 49 AdminHideUserContent
./ng net.accelbyte.sdk.cli.Main ugc adminHideUserContent \
    --contentId 'l4cdPKn3' \
    --namespace "$AB_NAMESPACE" \
    --userId 'UG22Ew40' \
    --body '{"isHidden": true}' \
    > test.out 2>&1
eval_tap $? 49 'AdminHideUserContent' test.out

#- 50 AdminGetAllGroups
./ng net.accelbyte.sdk.cli.Main ugc adminGetAllGroups \
    --namespace "$AB_NAMESPACE" \
    --userId 'gvWTq6Bw' \
    --limit '11' \
    --offset '89' \
    > test.out 2>&1
eval_tap $? 50 'AdminGetAllGroups' test.out

#- 51 AdminDeleteAllUserGroup
./ng net.accelbyte.sdk.cli.Main ugc adminDeleteAllUserGroup \
    --namespace "$AB_NAMESPACE" \
    --userId '1l7GPdSb' \
    > test.out 2>&1
eval_tap $? 51 'AdminDeleteAllUserGroup' test.out

#- 52 AdminGetGroup
./ng net.accelbyte.sdk.cli.Main ugc adminGetGroup \
    --groupId 'p1PcHUWo' \
    --namespace "$AB_NAMESPACE" \
    --userId 'EQ6jTt0l' \
    > test.out 2>&1
eval_tap $? 52 'AdminGetGroup' test.out

#- 53 AdminUpdateGroup
./ng net.accelbyte.sdk.cli.Main ugc adminUpdateGroup \
    --groupId 'KzEI39Qy' \
    --namespace "$AB_NAMESPACE" \
    --userId 'CbsHpFVO' \
    --body '{"contents": ["cWTgKTKT", "QeqHqSEg", "94X5BROZ"], "name": "I9T6XM2d"}' \
    > test.out 2>&1
eval_tap $? 53 'AdminUpdateGroup' test.out

#- 54 AdminDeleteGroup
./ng net.accelbyte.sdk.cli.Main ugc adminDeleteGroup \
    --groupId 'q5LCVQUa' \
    --namespace "$AB_NAMESPACE" \
    --userId 'K8kXWSnp' \
    > test.out 2>&1
eval_tap $? 54 'AdminDeleteGroup' test.out

#- 55 AdminGetGroupContents
./ng net.accelbyte.sdk.cli.Main ugc adminGetGroupContents \
    --groupId 'CeYSR5A3' \
    --namespace "$AB_NAMESPACE" \
    --userId 'GpYT34PL' \
    --limit '63' \
    --offset '74' \
    > test.out 2>&1
eval_tap $? 55 'AdminGetGroupContents' test.out

#- 56 AdminDeleteAllUserStates
./ng net.accelbyte.sdk.cli.Main ugc adminDeleteAllUserStates \
    --namespace "$AB_NAMESPACE" \
    --userId 'h5ByFWPs' \
    > test.out 2>&1
eval_tap $? 56 'AdminDeleteAllUserStates' test.out

#- 57 SearchChannelSpecificContent
./ng net.accelbyte.sdk.cli.Main ugc searchChannelSpecificContent \
    --channelId 'mNcG9it2' \
    --namespace "$AB_NAMESPACE" \
    --creator 'yxzcBJm3' \
    --ishidden 'POycTFGQ' \
    --isofficial 'n4sOXYQD' \
    --limit '68' \
    --name 'cPpOuPXn' \
    --offset '95' \
    --orderby 'KtMUddVk' \
    --sortby 'o0ZA7b6C' \
    --subtype 'T65fe1L8' \
    --tags 'ir8T4uQT,kBCX839n,OtDRmcnv' \
    --type 'tVx3CL3v' \
    --userId 'imRkvVKd' \
    > test.out 2>&1
eval_tap $? 57 'SearchChannelSpecificContent' test.out

#- 58 PublicSearchContent
./ng net.accelbyte.sdk.cli.Main ugc publicSearchContent \
    --namespace "$AB_NAMESPACE" \
    --creator '81tol5hP' \
    --ishidden 'jGxdyVlZ' \
    --isofficial 'qgq2Kj4X' \
    --limit '36' \
    --name 'TjtubeYZ' \
    --offset '98' \
    --orderby 'ZTfXJkFF' \
    --sortby 'zeDHhig6' \
    --subtype 'MUNVKp3u' \
    --tags 'lENHD3po,xEIO5K81,S6Riy3r1' \
    --type 'PQDZz4Hu' \
    --userId 'ZE9E5pS5' \
    > test.out 2>&1
eval_tap $? 58 'PublicSearchContent' test.out

#- 59 PublicGetContentBulk
./ng net.accelbyte.sdk.cli.Main ugc publicGetContentBulk \
    --namespace "$AB_NAMESPACE" \
    --body '{"contentIds": ["W2e7F3Jq", "n14SGQmy", "KuRjphnw"]}' \
    > test.out 2>&1
eval_tap $? 59 'PublicGetContentBulk' test.out

#- 60 GetFollowedContent
./ng net.accelbyte.sdk.cli.Main ugc getFollowedContent \
    --namespace "$AB_NAMESPACE" \
    --limit '29' \
    --offset '84' \
    > test.out 2>&1
eval_tap $? 60 'GetFollowedContent' test.out

#- 61 GetLikedContent
./ng net.accelbyte.sdk.cli.Main ugc getLikedContent \
    --namespace "$AB_NAMESPACE" \
    --isofficial  \
    --limit '71' \
    --name 'UAd0hMo5' \
    --offset '57' \
    --orderby 'M0GuCbrp' \
    --sortby 'Mc9a6XGK' \
    --subtype 'tsl8jju9' \
    --tags 'x8IgSov4,EZwUZ7xG,mvBjrrTd' \
    --type '9q3lb6yy' \
    > test.out 2>&1
eval_tap $? 61 'GetLikedContent' test.out

#- 62 PublicGetContentBulkByShareCodes
./ng net.accelbyte.sdk.cli.Main ugc publicGetContentBulkByShareCodes \
    --namespace "$AB_NAMESPACE" \
    --body '{"shareCodes": ["r090KvI0", "7HRJ037X", "LDLNdozg"]}' \
    > test.out 2>&1
eval_tap $? 62 'PublicGetContentBulkByShareCodes' test.out

#- 63 PublicDownloadContentByShareCode
./ng net.accelbyte.sdk.cli.Main ugc publicDownloadContentByShareCode \
    --namespace "$AB_NAMESPACE" \
    --shareCode 'YjCSr924' \
    > test.out 2>&1
eval_tap $? 63 'PublicDownloadContentByShareCode' test.out

#- 64 PublicDownloadContentByContentID
./ng net.accelbyte.sdk.cli.Main ugc publicDownloadContentByContentID \
    --contentId 'ohtomUvr' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 64 'PublicDownloadContentByContentID' test.out

#- 65 AddDownloadCount
./ng net.accelbyte.sdk.cli.Main ugc addDownloadCount \
    --contentId 'BX3OqdTS' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 65 'AddDownloadCount' test.out

#- 66 UpdateContentLikeStatus
./ng net.accelbyte.sdk.cli.Main ugc updateContentLikeStatus \
    --contentId 'cVEjRTDQ' \
    --namespace "$AB_NAMESPACE" \
    --body '{"likeStatus": false}' \
    > test.out 2>&1
eval_tap $? 66 'UpdateContentLikeStatus' test.out

#- 67 PublicDownloadContentPreview
./ng net.accelbyte.sdk.cli.Main ugc publicDownloadContentPreview \
    --contentId 'ytgl8NV3' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 67 'PublicDownloadContentPreview' test.out

#- 68 GetTag
./ng net.accelbyte.sdk.cli.Main ugc getTag \
    --namespace "$AB_NAMESPACE" \
    --limit '64' \
    --offset '88' \
    > test.out 2>&1
eval_tap $? 68 'GetTag' test.out

#- 69 GetType
./ng net.accelbyte.sdk.cli.Main ugc getType \
    --namespace "$AB_NAMESPACE" \
    --limit '93' \
    --offset '84' \
    > test.out 2>&1
eval_tap $? 69 'GetType' test.out

#- 70 PublicSearchCreator
./ng net.accelbyte.sdk.cli.Main ugc publicSearchCreator \
    --namespace "$AB_NAMESPACE" \
    --limit '25' \
    --offset '77' \
    --orderby 'IpoihDYX' \
    --sortby 'jPEVCTaz' \
    > test.out 2>&1
eval_tap $? 70 'PublicSearchCreator' test.out

#- 71 GetFollowedUsers
./ng net.accelbyte.sdk.cli.Main ugc getFollowedUsers \
    --namespace "$AB_NAMESPACE" \
    --limit '33' \
    --offset '27' \
    > test.out 2>&1
eval_tap $? 71 'GetFollowedUsers' test.out

#- 72 PublicGetCreator
./ng net.accelbyte.sdk.cli.Main ugc publicGetCreator \
    --namespace "$AB_NAMESPACE" \
    --userId 'JB07rPZQ' \
    > test.out 2>&1
eval_tap $? 72 'PublicGetCreator' test.out

#- 73 GetChannels
./ng net.accelbyte.sdk.cli.Main ugc getChannels \
    --namespace "$AB_NAMESPACE" \
    --userId 'QWIJx5YY' \
    --limit '10' \
    --name 'HjzLAtgx' \
    --offset '85' \
    > test.out 2>&1
eval_tap $? 73 'GetChannels' test.out

#- 74 PublicCreateChannel
./ng net.accelbyte.sdk.cli.Main ugc publicCreateChannel \
    --namespace "$AB_NAMESPACE" \
    --userId '0TNQvZEN' \
    --body '{"name": "RfOLseDr"}' \
    > test.out 2>&1
eval_tap $? 74 'PublicCreateChannel' test.out

#- 75 DeleteAllUserChannel
./ng net.accelbyte.sdk.cli.Main ugc deleteAllUserChannel \
    --namespace "$AB_NAMESPACE" \
    --userId '93TbGoz6' \
    > test.out 2>&1
eval_tap $? 75 'DeleteAllUserChannel' test.out

#- 76 UpdateChannel
./ng net.accelbyte.sdk.cli.Main ugc updateChannel \
    --channelId 'w47uSNBH' \
    --namespace "$AB_NAMESPACE" \
    --userId '0Re7XJgK' \
    --body '{"name": "RFeLpqRP"}' \
    > test.out 2>&1
eval_tap $? 76 'UpdateChannel' test.out

#- 77 DeleteChannel
./ng net.accelbyte.sdk.cli.Main ugc deleteChannel \
    --channelId 'KBoKVBoT' \
    --namespace "$AB_NAMESPACE" \
    --userId '7W2ALnUU' \
    > test.out 2>&1
eval_tap $? 77 'DeleteChannel' test.out

#- 78 CreateContentDirect
eval_tap 0 78 'CreateContentDirect # SKIP deprecated' test.out

#- 79 CreateContentS3
./ng net.accelbyte.sdk.cli.Main ugc createContentS3 \
    --channelId 'IKlauG02' \
    --namespace "$AB_NAMESPACE" \
    --userId 'xEZO8yo3' \
    --body '{"contentType": "qbjarjOC", "customAttributes": {"VTkkebz8": {}, "IDFb6GhO": {}, "jOQr4zx5": {}}, "fileExtension": "UFwMH6dJ", "name": "2mVl9MmT", "preview": "Q3KqJJAg", "previewMetadata": {"previewContentType": "uYp1m10f", "previewFileExtension": "4JFJH4fD"}, "subType": "QvVht4Aw", "tags": ["ghX6tTdF", "Pj77qW7J", "N1QfUMlB"], "type": "1IRGE4r4"}' \
    > test.out 2>&1
eval_tap $? 79 'CreateContentS3' test.out

#- 80 PublicUpdateContentByShareCode
./ng net.accelbyte.sdk.cli.Main ugc publicUpdateContentByShareCode \
    --channelId 'TXI1PYWc' \
    --namespace "$AB_NAMESPACE" \
    --shareCode 'RhCHtDZS' \
    --userId 'LLviH1hh' \
    --body '{"contentType": "exfeg2bS", "customAttributes": {"GVGYUiKe": {}, "YkMIOWBo": {}, "ICbP6v3l": {}}, "fileExtension": "yU3OlfWi", "name": "pVEIF9wi", "payload": "ZTk8y9SF", "preview": "bLu43DUY", "previewMetadata": {"previewContentType": "mi3MR4bV", "previewFileExtension": "txpJN3Zf"}, "subType": "cjragCon", "tags": ["JnEjqpkN", "e7ZY71j3", "VwgDbRwH"], "type": "RuAcVpr5", "updateContentFile": true}' \
    > test.out 2>&1
eval_tap $? 80 'PublicUpdateContentByShareCode' test.out

#- 81 UpdateContentS3
./ng net.accelbyte.sdk.cli.Main ugc updateContentS3 \
    --channelId '5ACtu4z0' \
    --contentId 'MBSAq5MG' \
    --namespace "$AB_NAMESPACE" \
    --userId 'ykQhbgiw' \
    --body '{"contentType": "2aWtbfDJ", "customAttributes": {"EPPLJjSs": {}, "BNFInGZn": {}, "khJKNEgd": {}}, "fileExtension": "QeA13fSQ", "name": "nZjjRii9", "payload": "xylF2khW", "preview": "uI0VKSg0", "previewMetadata": {"previewContentType": "4flQUUqZ", "previewFileExtension": "f1hcZSjv"}, "subType": "xTx79NB7", "tags": ["lbho8c57", "qdvDMDGZ", "3XDR8Sb2"], "type": "3MQE9c35", "updateContentFile": false}' \
    > test.out 2>&1
eval_tap $? 81 'UpdateContentS3' test.out

#- 82 PublicDeleteContentByShareCode
./ng net.accelbyte.sdk.cli.Main ugc publicDeleteContentByShareCode \
    --channelId 'RG8TJMfv' \
    --namespace "$AB_NAMESPACE" \
    --shareCode 'hT0z5H70' \
    --userId '0sTUQmFT' \
    > test.out 2>&1
eval_tap $? 82 'PublicDeleteContentByShareCode' test.out

#- 83 UpdateContentDirect
eval_tap 0 83 'UpdateContentDirect # SKIP deprecated' test.out

#- 84 DeleteContent
./ng net.accelbyte.sdk.cli.Main ugc deleteContent \
    --channelId 'A2fuKV1u' \
    --contentId 'Z1kOugp0' \
    --namespace "$AB_NAMESPACE" \
    --userId 'Ss18TgTK' \
    > test.out 2>&1
eval_tap $? 84 'DeleteContent' test.out

#- 85 UpdateContentShareCode
./ng net.accelbyte.sdk.cli.Main ugc updateContentShareCode \
    --channelId 'iwj5mv8K' \
    --contentId 'FpqOmHkM' \
    --namespace "$AB_NAMESPACE" \
    --userId 'OW7sm56k' \
    --body '{"shareCode": "xFehzghl"}' \
    > test.out 2>&1
eval_tap $? 85 'UpdateContentShareCode' test.out

#- 86 PublicGetUserContent
./ng net.accelbyte.sdk.cli.Main ugc publicGetUserContent \
    --namespace "$AB_NAMESPACE" \
    --userId 'WxCB9grX' \
    --limit '33' \
    --offset '98' \
    > test.out 2>&1
eval_tap $? 86 'PublicGetUserContent' test.out

#- 87 DeleteAllUserContents
./ng net.accelbyte.sdk.cli.Main ugc deleteAllUserContents \
    --namespace "$AB_NAMESPACE" \
    --userId '5bkyTP3H' \
    > test.out 2>&1
eval_tap $? 87 'DeleteAllUserContents' test.out

#- 88 UpdateScreenshots
./ng net.accelbyte.sdk.cli.Main ugc updateScreenshots \
    --contentId 'PPHejNUw' \
    --namespace "$AB_NAMESPACE" \
    --userId 'cpCtiZh8' \
    --body '{"screenshots": [{"description": "TaCPp9Fz", "screenshotId": "QCj3vI9o"}, {"description": "QMV4H2Kp", "screenshotId": "HdiFKN3f"}, {"description": "1AsxxtNR", "screenshotId": "SS72w7Du"}]}' \
    > test.out 2>&1
eval_tap $? 88 'UpdateScreenshots' test.out

#- 89 UploadContentScreenshot
./ng net.accelbyte.sdk.cli.Main ugc uploadContentScreenshot \
    --contentId 'WpcMruYM' \
    --namespace "$AB_NAMESPACE" \
    --userId 'bzuFzFRP' \
    --body '{"screenshots": [{"contentType": "7fLZvCfj", "description": "q91fs7Qc", "fileExtension": "png"}, {"contentType": "DnpnXIIa", "description": "3k4aBomW", "fileExtension": "bmp"}, {"contentType": "CBl538d5", "description": "Zmgl8RqR", "fileExtension": "pjp"}]}' \
    > test.out 2>&1
eval_tap $? 89 'UploadContentScreenshot' test.out

#- 90 DeleteContentScreenshot
./ng net.accelbyte.sdk.cli.Main ugc deleteContentScreenshot \
    --contentId '3XnyIRvx' \
    --namespace "$AB_NAMESPACE" \
    --screenshotId 'lXvSlDeO' \
    --userId 'VyzwxcFG' \
    > test.out 2>&1
eval_tap $? 90 'DeleteContentScreenshot' test.out

#- 91 UpdateUserFollowStatus
./ng net.accelbyte.sdk.cli.Main ugc updateUserFollowStatus \
    --namespace "$AB_NAMESPACE" \
    --userId '2gOUGDgD' \
    --body '{"followStatus": true}' \
    > test.out 2>&1
eval_tap $? 91 'UpdateUserFollowStatus' test.out

#- 92 GetPublicFollowers
./ng net.accelbyte.sdk.cli.Main ugc getPublicFollowers \
    --namespace "$AB_NAMESPACE" \
    --userId 'oWkAleEO' \
    --limit '56' \
    --offset '75' \
    > test.out 2>&1
eval_tap $? 92 'GetPublicFollowers' test.out

#- 93 GetPublicFollowing
./ng net.accelbyte.sdk.cli.Main ugc getPublicFollowing \
    --namespace "$AB_NAMESPACE" \
    --userId 'rwNtaawp' \
    --limit '93' \
    --offset '53' \
    > test.out 2>&1
eval_tap $? 93 'GetPublicFollowing' test.out

#- 94 GetGroups
./ng net.accelbyte.sdk.cli.Main ugc getGroups \
    --namespace "$AB_NAMESPACE" \
    --userId 'rUyIRfJH' \
    --limit '51' \
    --offset '15' \
    > test.out 2>&1
eval_tap $? 94 'GetGroups' test.out

#- 95 CreateGroup
./ng net.accelbyte.sdk.cli.Main ugc createGroup \
    --namespace "$AB_NAMESPACE" \
    --userId 'bEn0UnD6' \
    --body '{"contents": ["4rD8f9Ig", "yyKLenGK", "e1pTn0j0"], "name": "qKJqfP7O"}' \
    > test.out 2>&1
eval_tap $? 95 'CreateGroup' test.out

#- 96 DeleteAllUserGroup
./ng net.accelbyte.sdk.cli.Main ugc deleteAllUserGroup \
    --namespace "$AB_NAMESPACE" \
    --userId '1ZEHEqVB' \
    > test.out 2>&1
eval_tap $? 96 'DeleteAllUserGroup' test.out

#- 97 GetGroup
./ng net.accelbyte.sdk.cli.Main ugc getGroup \
    --groupId 'Jh1WbQ9O' \
    --namespace "$AB_NAMESPACE" \
    --userId 'UN7aTveR' \
    > test.out 2>&1
eval_tap $? 97 'GetGroup' test.out

#- 98 UpdateGroup
./ng net.accelbyte.sdk.cli.Main ugc updateGroup \
    --groupId '1AwHVniI' \
    --namespace "$AB_NAMESPACE" \
    --userId 'Me7TKtCS' \
    --body '{"contents": ["obaGPAO1", "s7R6M12y", "DKuCPY0E"], "name": "7DIIpnH9"}' \
    > test.out 2>&1
eval_tap $? 98 'UpdateGroup' test.out

#- 99 DeleteGroup
./ng net.accelbyte.sdk.cli.Main ugc deleteGroup \
    --groupId 'PtmiECM3' \
    --namespace "$AB_NAMESPACE" \
    --userId 'bAFuRq5z' \
    > test.out 2>&1
eval_tap $? 99 'DeleteGroup' test.out

#- 100 GetGroupContent
./ng net.accelbyte.sdk.cli.Main ugc getGroupContent \
    --groupId 'Sw1uTJki' \
    --namespace "$AB_NAMESPACE" \
    --userId 'f3YU0tpW' \
    --limit '100' \
    --offset '59' \
    > test.out 2>&1
eval_tap $? 100 'GetGroupContent' test.out

#- 101 DeleteAllUserStates
./ng net.accelbyte.sdk.cli.Main ugc deleteAllUserStates \
    --namespace "$AB_NAMESPACE" \
    --userId '9RFNGcD9' \
    > test.out 2>&1
eval_tap $? 101 'DeleteAllUserStates' test.out

#- 102 AdminGetContentByChannelIDV2
./ng net.accelbyte.sdk.cli.Main ugc adminGetContentByChannelIDV2 \
    --channelId 'Z0jAinhK' \
    --namespace "$AB_NAMESPACE" \
    --limit '88' \
    --name '1FRgLgAR' \
    --offset '82' \
    --sortBy 'NKyMXXI7' \
    > test.out 2>&1
eval_tap $? 102 'AdminGetContentByChannelIDV2' test.out

#- 103 AdminCreateContentV2
./ng net.accelbyte.sdk.cli.Main ugc adminCreateContentV2 \
    --channelId '0aJTGnLb' \
    --namespace "$AB_NAMESPACE" \
    --body '{"contentType": "DETnB1U4", "customAttributes": {"EpgjXdlf": {}, "ZRYpGUfN": {}, "93FCbSwH": {}}, "fileExtension": "LK7RCnBY", "name": "oxCQQyYP", "shareCode": "vm90UTcO", "subType": "d2axjKbD", "tags": ["s3NQfhPB", "fJudabSJ", "h7HseUNJ"], "type": "Je31wqXk"}' \
    > test.out 2>&1
eval_tap $? 103 'AdminCreateContentV2' test.out

#- 104 AdminDeleteOfficialContentV2
./ng net.accelbyte.sdk.cli.Main ugc adminDeleteOfficialContentV2 \
    --channelId 'BaqUy55R' \
    --contentId 'Sj50lkh3' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 104 'AdminDeleteOfficialContentV2' test.out

#- 105 AdminUpdateOfficialContentV2
./ng net.accelbyte.sdk.cli.Main ugc adminUpdateOfficialContentV2 \
    --channelId '0CFAfRBA' \
    --contentId 'b3tcjNp0' \
    --namespace "$AB_NAMESPACE" \
    --body '{"customAttributes": {"XDbn1yfG": {}, "GYAAWQFJ": {}, "mWbNLpr4": {}}, "name": "BZgpqBwn", "shareCode": "sLxI3i2u", "subType": "t8Cw5PtE", "tags": ["4uRRmP7J", "U0b6v2Sg", "r80rtlTe"], "type": "sLzp7kRo"}' \
    > test.out 2>&1
eval_tap $? 105 'AdminUpdateOfficialContentV2' test.out

#- 106 AdminUpdateOfficialContentFileLocation
./ng net.accelbyte.sdk.cli.Main ugc adminUpdateOfficialContentFileLocation \
    --channelId 'HLYARpbR' \
    --contentId 'OvNVb4l5' \
    --namespace "$AB_NAMESPACE" \
    --body '{"fileExtension": "OfiH3zMW", "fileLocation": "q4J2iO6C"}' \
    > test.out 2>&1
eval_tap $? 106 'AdminUpdateOfficialContentFileLocation' test.out

#- 107 AdminGenerateOfficialContentUploadURLV2
./ng net.accelbyte.sdk.cli.Main ugc adminGenerateOfficialContentUploadURLV2 \
    --channelId 'h4KtNV8j' \
    --contentId 'OJlVvlKV' \
    --namespace "$AB_NAMESPACE" \
    --body '{"contentType": "2MZLG2Il", "fileExtension": "W3GZ4ZPT"}' \
    > test.out 2>&1
eval_tap $? 107 'AdminGenerateOfficialContentUploadURLV2' test.out

#- 108 AdminGetConfigs
./ng net.accelbyte.sdk.cli.Main ugc adminGetConfigs \
    --namespace "$AB_NAMESPACE" \
    --limit '74' \
    --offset '100' \
    > test.out 2>&1
eval_tap $? 108 'AdminGetConfigs' test.out

#- 109 AdminUpdateConfig
./ng net.accelbyte.sdk.cli.Main ugc adminUpdateConfig \
    --key '7uy86aST' \
    --namespace "$AB_NAMESPACE" \
    --body '{"value": "BUAMR2Sj"}' \
    > test.out 2>&1
eval_tap $? 109 'AdminUpdateConfig' test.out

#- 110 AdminListContentV2
./ng net.accelbyte.sdk.cli.Main ugc adminListContentV2 \
    --namespace "$AB_NAMESPACE" \
    --isOfficial  \
    --limit '5' \
    --name 'nfsoCBep' \
    --offset '11' \
    --sortBy 'AlQ2higu' \
    --subType 'EvkuMytC' \
    --tags 'TK0RRymZ,VrU1QJbp,CUnybwy2' \
    --type 'uwVQpd0U' \
    > test.out 2>&1
eval_tap $? 110 'AdminListContentV2' test.out

#- 111 AdminBulkGetContentByIDsV2
./ng net.accelbyte.sdk.cli.Main ugc adminBulkGetContentByIDsV2 \
    --namespace "$AB_NAMESPACE" \
    --body '{"contentIds": ["a0DwDINb", "BKOVohtq", "orFEGAh5"]}' \
    > test.out 2>&1
eval_tap $? 111 'AdminBulkGetContentByIDsV2' test.out

#- 112 AdminGetContentBulkByShareCodesV2
./ng net.accelbyte.sdk.cli.Main ugc adminGetContentBulkByShareCodesV2 \
    --namespace "$AB_NAMESPACE" \
    --body '{"shareCodes": ["UDckp7js", "fC2KdRDi", "jSHbOrfk"]}' \
    > test.out 2>&1
eval_tap $? 112 'AdminGetContentBulkByShareCodesV2' test.out

#- 113 AdminGetContentByShareCodeV2
./ng net.accelbyte.sdk.cli.Main ugc adminGetContentByShareCodeV2 \
    --namespace "$AB_NAMESPACE" \
    --shareCode '9meZnndi' \
    > test.out 2>&1
eval_tap $? 113 'AdminGetContentByShareCodeV2' test.out

#- 114 AdminGetContentByContentIDV2
./ng net.accelbyte.sdk.cli.Main ugc adminGetContentByContentIDV2 \
    --contentId 'LRioZky1' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 114 'AdminGetContentByContentIDV2' test.out

#- 115 RollbackContentVersionV2
./ng net.accelbyte.sdk.cli.Main ugc rollbackContentVersionV2 \
    --contentId 'RcTZzHou' \
    --namespace "$AB_NAMESPACE" \
    --versionId 'jbcMAqlA' \
    > test.out 2>&1
eval_tap $? 115 'RollbackContentVersionV2' test.out

#- 116 AdminUpdateScreenshotsV2
./ng net.accelbyte.sdk.cli.Main ugc adminUpdateScreenshotsV2 \
    --contentId 'kGlICCG8' \
    --namespace "$AB_NAMESPACE" \
    --body '{"screenshots": [{"description": "eh346VfI", "screenshotId": "LwfVLsNW"}, {"description": "2KSMxowF", "screenshotId": "WXN7pI4Q"}, {"description": "q5ZZPblV", "screenshotId": "q1CXT9m3"}]}' \
    > test.out 2>&1
eval_tap $? 116 'AdminUpdateScreenshotsV2' test.out

#- 117 AdminUploadContentScreenshotV2
./ng net.accelbyte.sdk.cli.Main ugc adminUploadContentScreenshotV2 \
    --contentId 'KBTGwP1D' \
    --namespace "$AB_NAMESPACE" \
    --body '{"screenshots": [{"contentType": "Hbyh8Jt1", "description": "AUdL0d8i", "fileExtension": "pjp"}, {"contentType": "TrFiezhK", "description": "O5zR2hiR", "fileExtension": "pjp"}, {"contentType": "vIpqZ1jO", "description": "dzV5qzZB", "fileExtension": "pjp"}]}' \
    > test.out 2>&1
eval_tap $? 117 'AdminUploadContentScreenshotV2' test.out

#- 118 AdminDeleteContentScreenshotV2
./ng net.accelbyte.sdk.cli.Main ugc adminDeleteContentScreenshotV2 \
    --contentId '7hllqsKV' \
    --namespace "$AB_NAMESPACE" \
    --screenshotId '4mJE4okD' \
    > test.out 2>&1
eval_tap $? 118 'AdminDeleteContentScreenshotV2' test.out

#- 119 ListContentVersionsV2
./ng net.accelbyte.sdk.cli.Main ugc listContentVersionsV2 \
    --contentId 'WX2NTp6g' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 119 'ListContentVersionsV2' test.out

#- 120 AdminGetOfficialGroupContentsV2
./ng net.accelbyte.sdk.cli.Main ugc adminGetOfficialGroupContentsV2 \
    --groupId 'TZHgkCFt' \
    --namespace "$AB_NAMESPACE" \
    --limit '10' \
    --offset '12' \
    > test.out 2>&1
eval_tap $? 120 'AdminGetOfficialGroupContentsV2' test.out

#- 121 AdminListStagingContents
./ng net.accelbyte.sdk.cli.Main ugc adminListStagingContents \
    --namespace "$AB_NAMESPACE" \
    --limit '54' \
    --offset '84' \
    --sortBy 'iozkFFKy' \
    --status 'rzwVj1Yb' \
    > test.out 2>&1
eval_tap $? 121 'AdminListStagingContents' test.out

#- 122 AdminGetStagingContentByID
./ng net.accelbyte.sdk.cli.Main ugc adminGetStagingContentByID \
    --contentId 'D8Ab2iQI' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 122 'AdminGetStagingContentByID' test.out

#- 123 AdminApproveStagingContent
./ng net.accelbyte.sdk.cli.Main ugc adminApproveStagingContent \
    --contentId 'X1nFc6au' \
    --namespace "$AB_NAMESPACE" \
    --body '{"approved": true, "note": "iLV8K5Jc"}' \
    > test.out 2>&1
eval_tap $? 123 'AdminApproveStagingContent' test.out

#- 124 AdminUpdateContentByShareCodeV2
./ng net.accelbyte.sdk.cli.Main ugc adminUpdateContentByShareCodeV2 \
    --channelId 'QR7mlhe1' \
    --namespace "$AB_NAMESPACE" \
    --shareCode 'v10Cqsll' \
    --userId 'dYesiL4c' \
    --body '{"customAttributes": {"NjrjDnFK": {}, "V9vR9pVK": {}, "W1mi0LC6": {}}, "name": "Bake8W0K", "shareCode": "MppWGrS1", "subType": "l1pZ7yms", "tags": ["pPlUM53x", "hB87EsoA", "K11CupGN"], "type": "KCDqUmgg"}' \
    > test.out 2>&1
eval_tap $? 124 'AdminUpdateContentByShareCodeV2' test.out

#- 125 AdminDeleteContentByShareCodeV2
./ng net.accelbyte.sdk.cli.Main ugc adminDeleteContentByShareCodeV2 \
    --channelId 'MmUgWriJ' \
    --namespace "$AB_NAMESPACE" \
    --shareCode 'qspMmZ1R' \
    --userId 'rw0wcpMq' \
    > test.out 2>&1
eval_tap $? 125 'AdminDeleteContentByShareCodeV2' test.out

#- 126 AdminDeleteUserContentV2
./ng net.accelbyte.sdk.cli.Main ugc adminDeleteUserContentV2 \
    --channelId 'swvuj0nz' \
    --contentId 'hlsKHGVz' \
    --namespace "$AB_NAMESPACE" \
    --userId 'PG3KSfES' \
    > test.out 2>&1
eval_tap $? 126 'AdminDeleteUserContentV2' test.out

#- 127 AdminUpdateUserContentV2
./ng net.accelbyte.sdk.cli.Main ugc adminUpdateUserContentV2 \
    --channelId 'JIGQea79' \
    --contentId 'SrVJ5tLK' \
    --namespace "$AB_NAMESPACE" \
    --userId 'eg20Kkew' \
    --body '{"customAttributes": {"zO1RIWpC": {}, "rJ5Kg0Cx": {}, "Q3soTCtT": {}}, "name": "W4ztK0WU", "shareCode": "gbObRUWg", "subType": "ZIV9jShr", "tags": ["tmonvLcs", "9YopmZVn", "c388qi5U"], "type": "t3Y1l6q0"}' \
    > test.out 2>&1
eval_tap $? 127 'AdminUpdateUserContentV2' test.out

#- 128 AdminUpdateUserContentFileLocation
./ng net.accelbyte.sdk.cli.Main ugc adminUpdateUserContentFileLocation \
    --channelId 'Qppq0hUL' \
    --contentId 'RUO5vzis' \
    --namespace "$AB_NAMESPACE" \
    --userId 'hkaowxFm' \
    --body '{"fileExtension": "6kCatYsM", "fileLocation": "cq0iKMV2"}' \
    > test.out 2>&1
eval_tap $? 128 'AdminUpdateUserContentFileLocation' test.out

#- 129 AdminGenerateUserContentUploadURLV2
./ng net.accelbyte.sdk.cli.Main ugc adminGenerateUserContentUploadURLV2 \
    --channelId '9VnT4TN8' \
    --contentId 'AuC91n0Z' \
    --namespace "$AB_NAMESPACE" \
    --userId 'C1zfYiGj' \
    --body '{"contentType": "QGyqKP1q", "fileExtension": "svWsrT3Z"}' \
    > test.out 2>&1
eval_tap $? 129 'AdminGenerateUserContentUploadURLV2' test.out

#- 130 AdminGetContentByUserIDV2
./ng net.accelbyte.sdk.cli.Main ugc adminGetContentByUserIDV2 \
    --namespace "$AB_NAMESPACE" \
    --userId 'twflF5Al' \
    --limit '81' \
    --offset '67' \
    --sortBy 'M4AzZcae' \
    > test.out 2>&1
eval_tap $? 130 'AdminGetContentByUserIDV2' test.out

#- 131 AdminUpdateContentHideStatusV2
./ng net.accelbyte.sdk.cli.Main ugc adminUpdateContentHideStatusV2 \
    --contentId 'MCx68f92' \
    --namespace "$AB_NAMESPACE" \
    --userId 'ZoqX6Bc1' \
    --body '{"isHidden": true}' \
    > test.out 2>&1
eval_tap $? 131 'AdminUpdateContentHideStatusV2' test.out

#- 132 AdminGetUserGroupContentsV2
./ng net.accelbyte.sdk.cli.Main ugc adminGetUserGroupContentsV2 \
    --groupId '1UA8L83A' \
    --namespace "$AB_NAMESPACE" \
    --userId 'Ac219W9o' \
    --limit '38' \
    --offset '8' \
    > test.out 2>&1
eval_tap $? 132 'AdminGetUserGroupContentsV2' test.out

#- 133 AdminListUserStagingContents
./ng net.accelbyte.sdk.cli.Main ugc adminListUserStagingContents \
    --namespace "$AB_NAMESPACE" \
    --userId 'JpQuTVMT' \
    --limit '30' \
    --offset '57' \
    --sortBy 'VSzz3B0x' \
    --status 'cmYEx3Wu' \
    > test.out 2>&1
eval_tap $? 133 'AdminListUserStagingContents' test.out

#- 134 PublicGetContentByChannelIDV2
./ng net.accelbyte.sdk.cli.Main ugc publicGetContentByChannelIDV2 \
    --channelId 'vJwpddFC' \
    --namespace "$AB_NAMESPACE" \
    --limit '9' \
    --name 'XPaKdGNX' \
    --offset '63' \
    --sortBy 'vNW45w3h' \
    > test.out 2>&1
eval_tap $? 134 'PublicGetContentByChannelIDV2' test.out

#- 135 PublicListContentV2
./ng net.accelbyte.sdk.cli.Main ugc publicListContentV2 \
    --namespace "$AB_NAMESPACE" \
    --isOfficial  \
    --limit '41' \
    --name 'nFQTF1yN' \
    --offset '67' \
    --sortBy '7DAoo5ID' \
    --subType 'ujg69sSx' \
    --tags 'WhJB1HEV,Ml7D9gId,l0Upwm5L' \
    --type 'WJ0QD8ny' \
    > test.out 2>&1
eval_tap $? 135 'PublicListContentV2' test.out

#- 136 PublicBulkGetContentByIDV2
./ng net.accelbyte.sdk.cli.Main ugc publicBulkGetContentByIDV2 \
    --namespace "$AB_NAMESPACE" \
    --body '{"contentIds": ["OUim5zKJ", "gUDjgJ25", "OObTNKR0"]}' \
    > test.out 2>&1
eval_tap $? 136 'PublicBulkGetContentByIDV2' test.out

#- 137 PublicGetContentBulkByShareCodesV2
./ng net.accelbyte.sdk.cli.Main ugc publicGetContentBulkByShareCodesV2 \
    --namespace "$AB_NAMESPACE" \
    --body '{"shareCodes": ["dolxDXty", "v1g1rvqG", "P4XMYdnb"]}' \
    > test.out 2>&1
eval_tap $? 137 'PublicGetContentBulkByShareCodesV2' test.out

#- 138 PublicGetContentByShareCodeV2
./ng net.accelbyte.sdk.cli.Main ugc publicGetContentByShareCodeV2 \
    --namespace "$AB_NAMESPACE" \
    --shareCode '2sVHBChr' \
    > test.out 2>&1
eval_tap $? 138 'PublicGetContentByShareCodeV2' test.out

#- 139 PublicGetContentByIDV2
./ng net.accelbyte.sdk.cli.Main ugc publicGetContentByIDV2 \
    --contentId 'vXgWExry' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 139 'PublicGetContentByIDV2' test.out

#- 140 PublicAddDownloadCountV2
./ng net.accelbyte.sdk.cli.Main ugc publicAddDownloadCountV2 \
    --contentId 'cBbU9irX' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 140 'PublicAddDownloadCountV2' test.out

#- 141 PublicListContentDownloaderV2
./ng net.accelbyte.sdk.cli.Main ugc publicListContentDownloaderV2 \
    --contentId 'mlq7a2GV' \
    --namespace "$AB_NAMESPACE" \
    --limit '71' \
    --offset '38' \
    --sortBy '8I75WfO5' \
    --userId 'gQZNrLf2' \
    > test.out 2>&1
eval_tap $? 141 'PublicListContentDownloaderV2' test.out

#- 142 PublicListContentLikeV2
./ng net.accelbyte.sdk.cli.Main ugc publicListContentLikeV2 \
    --contentId 'c7Xdlylk' \
    --namespace "$AB_NAMESPACE" \
    --limit '69' \
    --offset '10' \
    --sortBy 'FxmcgCDr' \
    > test.out 2>&1
eval_tap $? 142 'PublicListContentLikeV2' test.out

#- 143 UpdateContentLikeStatusV2
./ng net.accelbyte.sdk.cli.Main ugc updateContentLikeStatusV2 \
    --contentId '5qNqmjOO' \
    --namespace "$AB_NAMESPACE" \
    --body '{"likeStatus": true}' \
    > test.out 2>&1
eval_tap $? 143 'UpdateContentLikeStatusV2' test.out

#- 144 PublicCreateContentV2
./ng net.accelbyte.sdk.cli.Main ugc publicCreateContentV2 \
    --channelId 'Jw3nWPcI' \
    --namespace "$AB_NAMESPACE" \
    --userId 'eThibP8Z' \
    --body '{"contentType": "LVYgsyHV", "customAttributes": {"V2Z4RfUA": {}, "JkEMQvDh": {}, "WWBaMc8Z": {}}, "fileExtension": "rUJ4LHk0", "name": "q1tX0MR8", "subType": "uaXqLwOi", "tags": ["BEcRek4M", "qeGKxRYO", "0Iap4ZnO"], "type": "UmTGZLgX"}' \
    > test.out 2>&1
eval_tap $? 144 'PublicCreateContentV2' test.out

#- 145 PublicUpdateContentByShareCodeV2
./ng net.accelbyte.sdk.cli.Main ugc publicUpdateContentByShareCodeV2 \
    --channelId 'jGSHGwDU' \
    --namespace "$AB_NAMESPACE" \
    --shareCode 'hBwmilBF' \
    --userId '53tybGSX' \
    --body '{"customAttributes": {"iNTSZ0Yg": {}, "iIoVqRwN": {}, "pkgugqWF": {}}, "name": "0yewWuyK", "subType": "0BRMp7VI", "tags": ["SIoDqv97", "b3QB3Ize", "PnSfd556"], "type": "FdJMlMzc"}' \
    > test.out 2>&1
eval_tap $? 145 'PublicUpdateContentByShareCodeV2' test.out

#- 146 PublicDeleteContentByShareCodeV2
./ng net.accelbyte.sdk.cli.Main ugc publicDeleteContentByShareCodeV2 \
    --channelId 'vv3p1KoX' \
    --namespace "$AB_NAMESPACE" \
    --shareCode 'VVRlpIDY' \
    --userId 'iAuoLb58' \
    > test.out 2>&1
eval_tap $? 146 'PublicDeleteContentByShareCodeV2' test.out

#- 147 PublicDeleteContentV2
./ng net.accelbyte.sdk.cli.Main ugc publicDeleteContentV2 \
    --channelId 'uLpX3ZZW' \
    --contentId 'wVnWUt3H' \
    --namespace "$AB_NAMESPACE" \
    --userId 'ZxoAxUd6' \
    > test.out 2>&1
eval_tap $? 147 'PublicDeleteContentV2' test.out

#- 148 PublicUpdateContentV2
./ng net.accelbyte.sdk.cli.Main ugc publicUpdateContentV2 \
    --channelId 'X4I8eVlT' \
    --contentId 'nCYE2FAM' \
    --namespace "$AB_NAMESPACE" \
    --userId '5YWVBzaM' \
    --body '{"customAttributes": {"ZbLpkhFm": {}, "cjZBjSHP": {}, "gaCa2Bvz": {}}, "name": "fF1CawA6", "subType": "4BPe83vY", "tags": ["fh5R7TlT", "MLC9oRyH", "XA8oBrW4"], "type": "lz9j5VeT"}' \
    > test.out 2>&1
eval_tap $? 148 'PublicUpdateContentV2' test.out

#- 149 PublicUpdateContentFileLocation
./ng net.accelbyte.sdk.cli.Main ugc publicUpdateContentFileLocation \
    --channelId 'Uw1NToRQ' \
    --contentId 'XQowqvAZ' \
    --namespace "$AB_NAMESPACE" \
    --userId 'lfemRSGu' \
    --body '{"fileExtension": "FxC97kGb", "fileLocation": "Jzjl6gbK"}' \
    > test.out 2>&1
eval_tap $? 149 'PublicUpdateContentFileLocation' test.out

#- 150 UpdateContentShareCodeV2
./ng net.accelbyte.sdk.cli.Main ugc updateContentShareCodeV2 \
    --channelId 'XaallKLy' \
    --contentId 'tbGaHKOY' \
    --namespace "$AB_NAMESPACE" \
    --userId '0pynqG5P' \
    --body '{"shareCode": "ONSoJAsS"}' \
    > test.out 2>&1
eval_tap $? 150 'UpdateContentShareCodeV2' test.out

#- 151 PublicGenerateContentUploadURLV2
./ng net.accelbyte.sdk.cli.Main ugc publicGenerateContentUploadURLV2 \
    --channelId 'sZGWwPV5' \
    --contentId 'dlViVjLd' \
    --namespace "$AB_NAMESPACE" \
    --userId '1FAUIzyK' \
    --body '{"contentType": "jZj5TKxb", "fileExtension": "9YbooJ8F"}' \
    > test.out 2>&1
eval_tap $? 151 'PublicGenerateContentUploadURLV2' test.out

#- 152 PublicGetContentByUserIDV2
./ng net.accelbyte.sdk.cli.Main ugc publicGetContentByUserIDV2 \
    --namespace "$AB_NAMESPACE" \
    --userId 'yHkUICo4' \
    --limit '97' \
    --offset '92' \
    --sortBy 'Te9AIM14' \
    > test.out 2>&1
eval_tap $? 152 'PublicGetContentByUserIDV2' test.out

#- 153 UpdateScreenshotsV2
./ng net.accelbyte.sdk.cli.Main ugc updateScreenshotsV2 \
    --contentId 'TeruXbJS' \
    --namespace "$AB_NAMESPACE" \
    --userId 'tRxJrqlA' \
    --body '{"screenshots": [{"description": "voVG89ff", "screenshotId": "6n4Hux2k"}, {"description": "bQ4TjfNo", "screenshotId": "AD0rBSb5"}, {"description": "rh7c0XZR", "screenshotId": "tonacWUs"}]}' \
    > test.out 2>&1
eval_tap $? 153 'UpdateScreenshotsV2' test.out

#- 154 UploadContentScreenshotV2
./ng net.accelbyte.sdk.cli.Main ugc uploadContentScreenshotV2 \
    --contentId 'V3mFKXLU' \
    --namespace "$AB_NAMESPACE" \
    --userId 'c1adRBD8' \
    --body '{"screenshots": [{"contentType": "R519vdFO", "description": "1gHZusv8", "fileExtension": "pjp"}, {"contentType": "JkYUY4ES", "description": "3H8R8MwM", "fileExtension": "jfif"}, {"contentType": "n7z9MozU", "description": "prewephr", "fileExtension": "png"}]}' \
    > test.out 2>&1
eval_tap $? 154 'UploadContentScreenshotV2' test.out

#- 155 DeleteContentScreenshotV2
./ng net.accelbyte.sdk.cli.Main ugc deleteContentScreenshotV2 \
    --contentId 'J36gk7ph' \
    --namespace "$AB_NAMESPACE" \
    --screenshotId 'POsTt2fW' \
    --userId 'kYVhzZZY' \
    > test.out 2>&1
eval_tap $? 155 'DeleteContentScreenshotV2' test.out

#- 156 PublicGetGroupContentsV2
./ng net.accelbyte.sdk.cli.Main ugc publicGetGroupContentsV2 \
    --groupId 'I7F3RPjF' \
    --namespace "$AB_NAMESPACE" \
    --userId '4rYs2urh' \
    --limit '60' \
    --offset '24' \
    > test.out 2>&1
eval_tap $? 156 'PublicGetGroupContentsV2' test.out

#- 157 ListUserStagingContents
./ng net.accelbyte.sdk.cli.Main ugc listUserStagingContents \
    --namespace "$AB_NAMESPACE" \
    --userId 'p5D7OUkl' \
    --limit '70' \
    --offset '74' \
    --sortBy 'phha29Aa' \
    --status 'nuizUlMv' \
    > test.out 2>&1
eval_tap $? 157 'ListUserStagingContents' test.out

#- 158 GetUserStagingContentByID
./ng net.accelbyte.sdk.cli.Main ugc getUserStagingContentByID \
    --contentId 'g3PPfPvA' \
    --namespace "$AB_NAMESPACE" \
    --userId 'tgjdYi2K' \
    > test.out 2>&1
eval_tap $? 158 'GetUserStagingContentByID' test.out

#- 159 UpdateStagingContent
./ng net.accelbyte.sdk.cli.Main ugc updateStagingContent \
    --contentId 'THrnuIF4' \
    --namespace "$AB_NAMESPACE" \
    --userId 'uqlXPP7R' \
    --body '{"fileExtension": "45z7v39g", "fileLocation": "bBCa6gYG"}' \
    > test.out 2>&1
eval_tap $? 159 'UpdateStagingContent' test.out

#- 160 DeleteUserStagingContentByID
./ng net.accelbyte.sdk.cli.Main ugc deleteUserStagingContentByID \
    --contentId 'MB8s19r9' \
    --namespace "$AB_NAMESPACE" \
    --userId '4mNlcDbP' \
    > test.out 2>&1
eval_tap $? 160 'DeleteUserStagingContentByID' test.out


rm -f "tmp.dat"

exit $EXIT_CODE