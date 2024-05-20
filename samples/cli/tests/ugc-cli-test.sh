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
    --limit '85' \
    --offset '48' \
    > test.out 2>&1
eval_tap $? 2 'SingleAdminGetChannel' test.out

#- 3 AdminCreateChannel
./ng net.accelbyte.sdk.cli.Main ugc adminCreateChannel \
    --namespace "$AB_NAMESPACE" \
    --body '{"id": "63dIJkC5", "name": "kiGnBdU8"}' \
    > test.out 2>&1
eval_tap $? 3 'AdminCreateChannel' test.out

#- 4 SingleAdminUpdateChannel
./ng net.accelbyte.sdk.cli.Main ugc singleAdminUpdateChannel \
    --channelId 'MnLJpHw2' \
    --namespace "$AB_NAMESPACE" \
    --body '{"name": "FFnBzdlo"}' \
    > test.out 2>&1
eval_tap $? 4 'SingleAdminUpdateChannel' test.out

#- 5 SingleAdminDeleteChannel
./ng net.accelbyte.sdk.cli.Main ugc singleAdminDeleteChannel \
    --channelId 'zmxIl1Eu' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 5 'SingleAdminDeleteChannel' test.out

#- 6 AdminUploadContentDirect
eval_tap 0 6 'AdminUploadContentDirect # SKIP deprecated' test.out

#- 7 AdminUploadContentS3
./ng net.accelbyte.sdk.cli.Main ugc adminUploadContentS3 \
    --channelId 'ftLbywkP' \
    --namespace "$AB_NAMESPACE" \
    --body '{"contentType": "CHZgQWJO", "customAttributes": {"HkepwgLg": {}, "JwBGJVqT": {}, "GUNljkzT": {}}, "fileExtension": "iBSZQHRB", "name": "hzHbTh10", "preview": "rPDUMSpq", "previewMetadata": {"previewContentType": "5x2BDpz5", "previewFileExtension": "lOuUpM3v"}, "shareCode": "2dX2UwgV", "subType": "VBzAkbGQ", "tags": ["4OXmiDJf", "Y81nI4fe", "6OawXqPF"], "type": "hhT0WjF3"}' \
    > test.out 2>&1
eval_tap $? 7 'AdminUploadContentS3' test.out

#- 8 SingleAdminUpdateContentS3
./ng net.accelbyte.sdk.cli.Main ugc singleAdminUpdateContentS3 \
    --channelId 'Ex8K7Y7z' \
    --contentId 'ertQ3hBu' \
    --namespace "$AB_NAMESPACE" \
    --body '{"contentType": "bzSCYbOw", "customAttributes": {"318xKHhE": {}, "0xA9j350": {}, "GpGgva7a": {}}, "fileExtension": "pbkbjbaN", "name": "3prHr5VL", "payload": "TmI6r8ok", "preview": "gmXdFcuq", "previewMetadata": {"previewContentType": "0qGnXY1Z", "previewFileExtension": "XcMtJbx4"}, "shareCode": "3PN5Gdcf", "subType": "GqQ4r9Ib", "tags": ["BoPXpFZd", "lDnQoaT0", "2P8xeSNw"], "type": "K6jxGGNN", "updateContentFile": false}' \
    > test.out 2>&1
eval_tap $? 8 'SingleAdminUpdateContentS3' test.out

#- 9 AdminSearchChannelSpecificContent
./ng net.accelbyte.sdk.cli.Main ugc adminSearchChannelSpecificContent \
    --channelId 'RRxZZcH4' \
    --namespace "$AB_NAMESPACE" \
    --creator 's0sAIxUR' \
    --ishidden 'Uf51c9nU' \
    --isofficial 'JiznyYyR' \
    --limit '85' \
    --name 'jwaDkjHg' \
    --offset '96' \
    --orderby 'QI0X0fHF' \
    --sortby 'iLI0SfXx' \
    --subtype 'JbZRZIIa' \
    --tags 'U1njeTGf,3OpPRw51,5vFOeaBq' \
    --type 'KtU4mI1D' \
    --userId '2va2o9mQ' \
    > test.out 2>&1
eval_tap $? 9 'AdminSearchChannelSpecificContent' test.out

#- 10 SingleAdminUpdateContentDirect
eval_tap 0 10 'SingleAdminUpdateContentDirect # SKIP deprecated' test.out

#- 11 SingleAdminDeleteContent
./ng net.accelbyte.sdk.cli.Main ugc singleAdminDeleteContent \
    --channelId 'VSp7wQcM' \
    --contentId '3ZLHULMt' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 11 'SingleAdminDeleteContent' test.out

#- 12 SingleAdminGetContent
./ng net.accelbyte.sdk.cli.Main ugc singleAdminGetContent \
    --namespace "$AB_NAMESPACE" \
    --limit '78' \
    --offset '76' \
    > test.out 2>&1
eval_tap $? 12 'SingleAdminGetContent' test.out

#- 13 AdminGetContentBulk
./ng net.accelbyte.sdk.cli.Main ugc adminGetContentBulk \
    --namespace "$AB_NAMESPACE" \
    --body '{"contentIds": ["KPTdLCBM", "HsLKBKAf", "M4eK5JjB"]}' \
    > test.out 2>&1
eval_tap $? 13 'AdminGetContentBulk' test.out

#- 14 AdminSearchContent
./ng net.accelbyte.sdk.cli.Main ugc adminSearchContent \
    --namespace "$AB_NAMESPACE" \
    --creator 'IGhQ0ROY' \
    --ishidden 'ioIaods3' \
    --isofficial 'sUfbNO9P' \
    --limit '81' \
    --name 'qAObDEyi' \
    --offset '37' \
    --orderby 'fb5o6vm3' \
    --sortby 'djNtX2q6' \
    --subtype 'FdA82rS3' \
    --tags 'WKH9VmF0,WrEq8T0E,mNJshPsQ' \
    --type 'PxVrZG6I' \
    --userId 'uzdjnnqY' \
    > test.out 2>&1
eval_tap $? 14 'AdminSearchContent' test.out

#- 15 AdminGetContentBulkByShareCodes
./ng net.accelbyte.sdk.cli.Main ugc adminGetContentBulkByShareCodes \
    --namespace "$AB_NAMESPACE" \
    --body '{"shareCodes": ["1S8raGzm", "zPHRo5Gl", "BcQhOpqk"]}' \
    > test.out 2>&1
eval_tap $? 15 'AdminGetContentBulkByShareCodes' test.out

#- 16 AdminGetUserContentByShareCode
./ng net.accelbyte.sdk.cli.Main ugc adminGetUserContentByShareCode \
    --namespace "$AB_NAMESPACE" \
    --shareCode 'cdtNwgYN' \
    > test.out 2>&1
eval_tap $? 16 'AdminGetUserContentByShareCode' test.out

#- 17 AdminGetSpecificContent
./ng net.accelbyte.sdk.cli.Main ugc adminGetSpecificContent \
    --contentId 'maIQFtUH' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 17 'AdminGetSpecificContent' test.out

#- 18 AdminDownloadContentPreview
./ng net.accelbyte.sdk.cli.Main ugc adminDownloadContentPreview \
    --contentId 'kZQsOPhR' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 18 'AdminDownloadContentPreview' test.out

#- 19 RollbackContentVersion
./ng net.accelbyte.sdk.cli.Main ugc rollbackContentVersion \
    --contentId 'KXyBxlAg' \
    --namespace "$AB_NAMESPACE" \
    --versionId '2etHQvjk' \
    > test.out 2>&1
eval_tap $? 19 'RollbackContentVersion' test.out

#- 20 AdminUpdateScreenshots
./ng net.accelbyte.sdk.cli.Main ugc adminUpdateScreenshots \
    --contentId 'NnlrAlzs' \
    --namespace "$AB_NAMESPACE" \
    --body '{"screenshots": [{"description": "y2ZthIOf", "screenshotId": "sfc1dVlB"}, {"description": "81WoY6A7", "screenshotId": "u0gWvgKJ"}, {"description": "9WuuwfQs", "screenshotId": "PYzzglyu"}]}' \
    > test.out 2>&1
eval_tap $? 20 'AdminUpdateScreenshots' test.out

#- 21 AdminUploadContentScreenshot
./ng net.accelbyte.sdk.cli.Main ugc adminUploadContentScreenshot \
    --contentId 'G6vHg59r' \
    --namespace "$AB_NAMESPACE" \
    --body '{"screenshots": [{"contentType": "BYRJeq2p", "description": "PcQfIHNY", "fileExtension": "bmp"}, {"contentType": "dNRCEyQz", "description": "vV6C2R3R", "fileExtension": "bmp"}, {"contentType": "TSXKvasW", "description": "pxVFDpLx", "fileExtension": "jpg"}]}' \
    > test.out 2>&1
eval_tap $? 21 'AdminUploadContentScreenshot' test.out

#- 22 AdminDeleteContentScreenshot
./ng net.accelbyte.sdk.cli.Main ugc adminDeleteContentScreenshot \
    --contentId 'QSsExST5' \
    --namespace "$AB_NAMESPACE" \
    --screenshotId 'c8bhyWMG' \
    > test.out 2>&1
eval_tap $? 22 'AdminDeleteContentScreenshot' test.out

#- 23 ListContentVersions
./ng net.accelbyte.sdk.cli.Main ugc listContentVersions \
    --contentId 'wCbB5nvs' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 23 'ListContentVersions' test.out

#- 24 SingleAdminGetAllGroups
./ng net.accelbyte.sdk.cli.Main ugc singleAdminGetAllGroups \
    --namespace "$AB_NAMESPACE" \
    --limit '88' \
    --offset '2' \
    > test.out 2>&1
eval_tap $? 24 'SingleAdminGetAllGroups' test.out

#- 25 AdminCreateGroup
./ng net.accelbyte.sdk.cli.Main ugc adminCreateGroup \
    --namespace "$AB_NAMESPACE" \
    --body '{"contents": ["9FWozqbD", "jiokuFxP", "MRJpttqt"], "name": "FtsWQmbZ"}' \
    > test.out 2>&1
eval_tap $? 25 'AdminCreateGroup' test.out

#- 26 SingleAdminGetGroup
./ng net.accelbyte.sdk.cli.Main ugc singleAdminGetGroup \
    --groupId 'VrFnd90z' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 26 'SingleAdminGetGroup' test.out

#- 27 SingleAdminUpdateGroup
./ng net.accelbyte.sdk.cli.Main ugc singleAdminUpdateGroup \
    --groupId 'bKN97mID' \
    --namespace "$AB_NAMESPACE" \
    --body '{"contents": ["hOrTmrYA", "jfjzsPCa", "sT1VCdqT"], "name": "fBRpTtnc"}' \
    > test.out 2>&1
eval_tap $? 27 'SingleAdminUpdateGroup' test.out

#- 28 SingleAdminDeleteGroup
./ng net.accelbyte.sdk.cli.Main ugc singleAdminDeleteGroup \
    --groupId 'sotHlTr8' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 28 'SingleAdminDeleteGroup' test.out

#- 29 SingleAdminGetGroupContents
./ng net.accelbyte.sdk.cli.Main ugc singleAdminGetGroupContents \
    --groupId 'CKfLiYax' \
    --namespace "$AB_NAMESPACE" \
    --limit '9' \
    --offset '11' \
    > test.out 2>&1
eval_tap $? 29 'SingleAdminGetGroupContents' test.out

#- 30 AdminGetTag
./ng net.accelbyte.sdk.cli.Main ugc adminGetTag \
    --namespace "$AB_NAMESPACE" \
    --limit '17' \
    --offset '37' \
    > test.out 2>&1
eval_tap $? 30 'AdminGetTag' test.out

#- 31 AdminCreateTag
./ng net.accelbyte.sdk.cli.Main ugc adminCreateTag \
    --namespace "$AB_NAMESPACE" \
    --body '{"tag": "Yn3TZ8r2"}' \
    > test.out 2>&1
eval_tap $? 31 'AdminCreateTag' test.out

#- 32 AdminUpdateTag
./ng net.accelbyte.sdk.cli.Main ugc adminUpdateTag \
    --namespace "$AB_NAMESPACE" \
    --tagId '4DYNvPXW' \
    --body '{"tag": "OPvmKOC1"}' \
    > test.out 2>&1
eval_tap $? 32 'AdminUpdateTag' test.out

#- 33 AdminDeleteTag
./ng net.accelbyte.sdk.cli.Main ugc adminDeleteTag \
    --namespace "$AB_NAMESPACE" \
    --tagId 'FaksxYum' \
    > test.out 2>&1
eval_tap $? 33 'AdminDeleteTag' test.out

#- 34 AdminGetType
./ng net.accelbyte.sdk.cli.Main ugc adminGetType \
    --namespace "$AB_NAMESPACE" \
    --limit '24' \
    --offset '66' \
    > test.out 2>&1
eval_tap $? 34 'AdminGetType' test.out

#- 35 AdminCreateType
./ng net.accelbyte.sdk.cli.Main ugc adminCreateType \
    --namespace "$AB_NAMESPACE" \
    --body '{"subtype": ["LoDlRZRR", "k8Avrh6M", "45ONYWZm"], "type": "5uzUYve2"}' \
    > test.out 2>&1
eval_tap $? 35 'AdminCreateType' test.out

#- 36 AdminUpdateType
./ng net.accelbyte.sdk.cli.Main ugc adminUpdateType \
    --namespace "$AB_NAMESPACE" \
    --typeId 'rxNfaabX' \
    --body '{"subtype": ["E0WZdYJb", "dZ2xFY35", "YbIFhoHq"], "type": "befK8CFR"}' \
    > test.out 2>&1
eval_tap $? 36 'AdminUpdateType' test.out

#- 37 AdminDeleteType
./ng net.accelbyte.sdk.cli.Main ugc adminDeleteType \
    --namespace "$AB_NAMESPACE" \
    --typeId '1Zp0OFnE' \
    > test.out 2>&1
eval_tap $? 37 'AdminDeleteType' test.out

#- 38 AdminGetChannel
./ng net.accelbyte.sdk.cli.Main ugc adminGetChannel \
    --namespace "$AB_NAMESPACE" \
    --userId 'sezKb2K2' \
    --limit '31' \
    --name 'CaQV5F81' \
    --offset '14' \
    > test.out 2>&1
eval_tap $? 38 'AdminGetChannel' test.out

#- 39 AdminDeleteAllUserChannels
./ng net.accelbyte.sdk.cli.Main ugc adminDeleteAllUserChannels \
    --namespace "$AB_NAMESPACE" \
    --userId 'ke1rvB5w' \
    > test.out 2>&1
eval_tap $? 39 'AdminDeleteAllUserChannels' test.out

#- 40 AdminUpdateChannel
./ng net.accelbyte.sdk.cli.Main ugc adminUpdateChannel \
    --channelId 'BxFjU6AS' \
    --namespace "$AB_NAMESPACE" \
    --userId 'EWSwhoVW' \
    --body '{"name": "Vd0bTWcy"}' \
    > test.out 2>&1
eval_tap $? 40 'AdminUpdateChannel' test.out

#- 41 AdminDeleteChannel
./ng net.accelbyte.sdk.cli.Main ugc adminDeleteChannel \
    --channelId '5RWb0L9B' \
    --namespace "$AB_NAMESPACE" \
    --userId 'AOjfzpds' \
    > test.out 2>&1
eval_tap $? 41 'AdminDeleteChannel' test.out

#- 42 AdminUpdateContentS3ByShareCode
./ng net.accelbyte.sdk.cli.Main ugc adminUpdateContentS3ByShareCode \
    --channelId 'pfOqCG6w' \
    --namespace "$AB_NAMESPACE" \
    --shareCode '0MRKhSwa' \
    --userId 'Jm6M8OkL' \
    --body '{"contentType": "pIUqImmw", "customAttributes": {"9pWAujJD": {}, "N5lcB9QK": {}, "KpgNhhlU": {}}, "fileExtension": "8USqbwDt", "name": "dbteJYnI", "payload": "okWfnD7Y", "preview": "iv5SYaZI", "previewMetadata": {"previewContentType": "HGD1tCIE", "previewFileExtension": "skguc6DA"}, "shareCode": "2JZqCGID", "subType": "PLxuEoTv", "tags": ["WJo8NFrw", "SoDi20lw", "0rDTZfv7"], "type": "UCZbQYxv", "updateContentFile": false}' \
    > test.out 2>&1
eval_tap $? 42 'AdminUpdateContentS3ByShareCode' test.out

#- 43 AdminUpdateContentS3
./ng net.accelbyte.sdk.cli.Main ugc adminUpdateContentS3 \
    --channelId 'KtQ5Wrg0' \
    --contentId 'BVatRUow' \
    --namespace "$AB_NAMESPACE" \
    --userId 'zr2nHR3n' \
    --body '{"contentType": "mXMjiDIM", "customAttributes": {"aJsr8Bbq": {}, "9ssbQAxR": {}, "shfW60RX": {}}, "fileExtension": "UgDHxut0", "name": "ZTxqWC7B", "payload": "cRDNCP9s", "preview": "f6UGq6yI", "previewMetadata": {"previewContentType": "n2jz6OuV", "previewFileExtension": "zbxVrgNj"}, "shareCode": "6rcChQLi", "subType": "x32o4j3X", "tags": ["FwWkSzos", "Zsku6sQi", "3qF8pFYI"], "type": "D1N9OCci", "updateContentFile": true}' \
    > test.out 2>&1
eval_tap $? 43 'AdminUpdateContentS3' test.out

#- 44 DeleteContentByShareCode
./ng net.accelbyte.sdk.cli.Main ugc deleteContentByShareCode \
    --channelId '4In6pWHH' \
    --namespace "$AB_NAMESPACE" \
    --shareCode 'bf9bygsY' \
    --userId 'WdAMTTMv' \
    > test.out 2>&1
eval_tap $? 44 'DeleteContentByShareCode' test.out

#- 45 AdminUpdateContentDirect
eval_tap 0 45 'AdminUpdateContentDirect # SKIP deprecated' test.out

#- 46 AdminDeleteContent
./ng net.accelbyte.sdk.cli.Main ugc adminDeleteContent \
    --channelId '1WlVPOjv' \
    --contentId 'tzwI2pXS' \
    --namespace "$AB_NAMESPACE" \
    --userId '1nPYqUu7' \
    > test.out 2>&1
eval_tap $? 46 'AdminDeleteContent' test.out

#- 47 AdminGetContent
./ng net.accelbyte.sdk.cli.Main ugc adminGetContent \
    --namespace "$AB_NAMESPACE" \
    --userId 'HVQoCqw8' \
    --limit '71' \
    --offset '21' \
    > test.out 2>&1
eval_tap $? 47 'AdminGetContent' test.out

#- 48 AdminDeleteAllUserContents
./ng net.accelbyte.sdk.cli.Main ugc adminDeleteAllUserContents \
    --namespace "$AB_NAMESPACE" \
    --userId 'Ogae8uxM' \
    > test.out 2>&1
eval_tap $? 48 'AdminDeleteAllUserContents' test.out

#- 49 AdminHideUserContent
./ng net.accelbyte.sdk.cli.Main ugc adminHideUserContent \
    --contentId 'lpKsXRdt' \
    --namespace "$AB_NAMESPACE" \
    --userId 'MKlE2XvY' \
    --body '{"isHidden": true}' \
    > test.out 2>&1
eval_tap $? 49 'AdminHideUserContent' test.out

#- 50 AdminGetAllGroups
./ng net.accelbyte.sdk.cli.Main ugc adminGetAllGroups \
    --namespace "$AB_NAMESPACE" \
    --userId 'MUHckyRf' \
    --limit '96' \
    --offset '81' \
    > test.out 2>&1
eval_tap $? 50 'AdminGetAllGroups' test.out

#- 51 AdminDeleteAllUserGroup
./ng net.accelbyte.sdk.cli.Main ugc adminDeleteAllUserGroup \
    --namespace "$AB_NAMESPACE" \
    --userId 'zx6534qB' \
    > test.out 2>&1
eval_tap $? 51 'AdminDeleteAllUserGroup' test.out

#- 52 AdminGetGroup
./ng net.accelbyte.sdk.cli.Main ugc adminGetGroup \
    --groupId 'u0J562H2' \
    --namespace "$AB_NAMESPACE" \
    --userId '4YmozRRp' \
    > test.out 2>&1
eval_tap $? 52 'AdminGetGroup' test.out

#- 53 AdminUpdateGroup
./ng net.accelbyte.sdk.cli.Main ugc adminUpdateGroup \
    --groupId 'nBl1QonZ' \
    --namespace "$AB_NAMESPACE" \
    --userId '5UwJ6m96' \
    --body '{"contents": ["rIbzFAGh", "q4JRMHaa", "KMMj422m"], "name": "PKAajFtV"}' \
    > test.out 2>&1
eval_tap $? 53 'AdminUpdateGroup' test.out

#- 54 AdminDeleteGroup
./ng net.accelbyte.sdk.cli.Main ugc adminDeleteGroup \
    --groupId 'D5XC4Mdj' \
    --namespace "$AB_NAMESPACE" \
    --userId 'WyNBahNh' \
    > test.out 2>&1
eval_tap $? 54 'AdminDeleteGroup' test.out

#- 55 AdminGetGroupContents
./ng net.accelbyte.sdk.cli.Main ugc adminGetGroupContents \
    --groupId 'XeDuTxQO' \
    --namespace "$AB_NAMESPACE" \
    --userId 'XW9gCtpA' \
    --limit '69' \
    --offset '57' \
    > test.out 2>&1
eval_tap $? 55 'AdminGetGroupContents' test.out

#- 56 AdminDeleteAllUserStates
./ng net.accelbyte.sdk.cli.Main ugc adminDeleteAllUserStates \
    --namespace "$AB_NAMESPACE" \
    --userId 'RnVcAbMX' \
    > test.out 2>&1
eval_tap $? 56 'AdminDeleteAllUserStates' test.out

#- 57 SearchChannelSpecificContent
./ng net.accelbyte.sdk.cli.Main ugc searchChannelSpecificContent \
    --channelId 'lFi7bYWE' \
    --namespace "$AB_NAMESPACE" \
    --creator 'bFVwrm3K' \
    --ishidden '5aSIKXEO' \
    --isofficial '1OsNalES' \
    --limit '36' \
    --name 'Zp8gRgIR' \
    --offset '22' \
    --orderby 'd9LP66kn' \
    --sortby 'gvNBaem4' \
    --subtype 'pZp512Hy' \
    --tags 'GbtwbasA,b3DuqgwP,i5cxvbMo' \
    --type '5SHPcsW2' \
    --userId 'rO5FYlGE' \
    > test.out 2>&1
eval_tap $? 57 'SearchChannelSpecificContent' test.out

#- 58 PublicSearchContent
./ng net.accelbyte.sdk.cli.Main ugc publicSearchContent \
    --namespace "$AB_NAMESPACE" \
    --creator 'g0hAgvl4' \
    --ishidden 'da8LptOF' \
    --isofficial 'v1hOnPa7' \
    --limit '50' \
    --name 'gjWgARKf' \
    --offset '17' \
    --orderby 'nhXxFA18' \
    --sortby 'fzf3EWeT' \
    --subtype 'xcrwpHlI' \
    --tags 'kdcj0fqD,fdu44STY,3N7Hu6ar' \
    --type 'SsQhvgsc' \
    --userId 'c1iHkdRY' \
    > test.out 2>&1
eval_tap $? 58 'PublicSearchContent' test.out

#- 59 PublicGetContentBulk
./ng net.accelbyte.sdk.cli.Main ugc publicGetContentBulk \
    --namespace "$AB_NAMESPACE" \
    --body '{"contentIds": ["tE6c5tdj", "Byp3zdkm", "HiXJrYWJ"]}' \
    > test.out 2>&1
eval_tap $? 59 'PublicGetContentBulk' test.out

#- 60 GetFollowedContent
./ng net.accelbyte.sdk.cli.Main ugc getFollowedContent \
    --namespace "$AB_NAMESPACE" \
    --limit '16' \
    --offset '58' \
    > test.out 2>&1
eval_tap $? 60 'GetFollowedContent' test.out

#- 61 GetLikedContent
./ng net.accelbyte.sdk.cli.Main ugc getLikedContent \
    --namespace "$AB_NAMESPACE" \
    --isofficial  \
    --limit '94' \
    --name 'OWGPXPIG' \
    --offset '26' \
    --orderby 'w1BVcl8Z' \
    --sortby 'YikG8Kkx' \
    --subtype 'bGHWFbxV' \
    --tags 'b4gtV9XI,VlDrGN3e,gzemlwPK' \
    --type 'x8fIZTJx' \
    > test.out 2>&1
eval_tap $? 61 'GetLikedContent' test.out

#- 62 PublicGetContentBulkByShareCodes
./ng net.accelbyte.sdk.cli.Main ugc publicGetContentBulkByShareCodes \
    --namespace "$AB_NAMESPACE" \
    --body '{"shareCodes": ["pnKrnIai", "INy8Zq0L", "nlVk2drx"]}' \
    > test.out 2>&1
eval_tap $? 62 'PublicGetContentBulkByShareCodes' test.out

#- 63 PublicDownloadContentByShareCode
./ng net.accelbyte.sdk.cli.Main ugc publicDownloadContentByShareCode \
    --namespace "$AB_NAMESPACE" \
    --shareCode 'FqUO3G93' \
    > test.out 2>&1
eval_tap $? 63 'PublicDownloadContentByShareCode' test.out

#- 64 PublicDownloadContentByContentID
./ng net.accelbyte.sdk.cli.Main ugc publicDownloadContentByContentID \
    --contentId '55gCWAuM' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 64 'PublicDownloadContentByContentID' test.out

#- 65 AddDownloadCount
./ng net.accelbyte.sdk.cli.Main ugc addDownloadCount \
    --contentId 'dl5Xz2in' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 65 'AddDownloadCount' test.out

#- 66 UpdateContentLikeStatus
./ng net.accelbyte.sdk.cli.Main ugc updateContentLikeStatus \
    --contentId 'WAJKucmA' \
    --namespace "$AB_NAMESPACE" \
    --body '{"likeStatus": true}' \
    > test.out 2>&1
eval_tap $? 66 'UpdateContentLikeStatus' test.out

#- 67 PublicDownloadContentPreview
./ng net.accelbyte.sdk.cli.Main ugc publicDownloadContentPreview \
    --contentId 'VAb4Xt8w' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 67 'PublicDownloadContentPreview' test.out

#- 68 GetTag
./ng net.accelbyte.sdk.cli.Main ugc getTag \
    --namespace "$AB_NAMESPACE" \
    --limit '35' \
    --offset '85' \
    > test.out 2>&1
eval_tap $? 68 'GetTag' test.out

#- 69 GetType
./ng net.accelbyte.sdk.cli.Main ugc getType \
    --namespace "$AB_NAMESPACE" \
    --limit '99' \
    --offset '34' \
    > test.out 2>&1
eval_tap $? 69 'GetType' test.out

#- 70 PublicSearchCreator
./ng net.accelbyte.sdk.cli.Main ugc publicSearchCreator \
    --namespace "$AB_NAMESPACE" \
    --limit '10' \
    --offset '95' \
    --orderby 'y5xOaIj6' \
    --sortby 'fIF9lBBo' \
    > test.out 2>&1
eval_tap $? 70 'PublicSearchCreator' test.out

#- 71 GetFollowedUsers
./ng net.accelbyte.sdk.cli.Main ugc getFollowedUsers \
    --namespace "$AB_NAMESPACE" \
    --limit '14' \
    --offset '61' \
    > test.out 2>&1
eval_tap $? 71 'GetFollowedUsers' test.out

#- 72 PublicGetCreator
./ng net.accelbyte.sdk.cli.Main ugc publicGetCreator \
    --namespace "$AB_NAMESPACE" \
    --userId 'SZdPun7I' \
    > test.out 2>&1
eval_tap $? 72 'PublicGetCreator' test.out

#- 73 GetChannels
./ng net.accelbyte.sdk.cli.Main ugc getChannels \
    --namespace "$AB_NAMESPACE" \
    --userId 'VKxBq6eC' \
    --limit '45' \
    --name 'yxvrXP4d' \
    --offset '19' \
    > test.out 2>&1
eval_tap $? 73 'GetChannels' test.out

#- 74 PublicCreateChannel
./ng net.accelbyte.sdk.cli.Main ugc publicCreateChannel \
    --namespace "$AB_NAMESPACE" \
    --userId 'bWBXSwId' \
    --body '{"name": "lCHb5RZx"}' \
    > test.out 2>&1
eval_tap $? 74 'PublicCreateChannel' test.out

#- 75 DeleteAllUserChannel
./ng net.accelbyte.sdk.cli.Main ugc deleteAllUserChannel \
    --namespace "$AB_NAMESPACE" \
    --userId 'AR74B2Rm' \
    > test.out 2>&1
eval_tap $? 75 'DeleteAllUserChannel' test.out

#- 76 UpdateChannel
./ng net.accelbyte.sdk.cli.Main ugc updateChannel \
    --channelId 'hr6cmLNU' \
    --namespace "$AB_NAMESPACE" \
    --userId 'OvKDBzfV' \
    --body '{"name": "VDOFRdnv"}' \
    > test.out 2>&1
eval_tap $? 76 'UpdateChannel' test.out

#- 77 DeleteChannel
./ng net.accelbyte.sdk.cli.Main ugc deleteChannel \
    --channelId 'LhTMHjzj' \
    --namespace "$AB_NAMESPACE" \
    --userId 'd4Qi3W5m' \
    > test.out 2>&1
eval_tap $? 77 'DeleteChannel' test.out

#- 78 CreateContentDirect
eval_tap 0 78 'CreateContentDirect # SKIP deprecated' test.out

#- 79 CreateContentS3
./ng net.accelbyte.sdk.cli.Main ugc createContentS3 \
    --channelId 'bvQ2vXNa' \
    --namespace "$AB_NAMESPACE" \
    --userId 'uvosgVph' \
    --body '{"contentType": "h4YoT3G9", "customAttributes": {"xBdc7VRQ": {}, "xLjjmsvT": {}, "qgF8RGeY": {}}, "fileExtension": "zwwpHWIU", "name": "0Vw0Pszw", "preview": "i6SIdWSV", "previewMetadata": {"previewContentType": "QyFvkyU0", "previewFileExtension": "I7EjLIOQ"}, "subType": "3terhJjM", "tags": ["QfBxBpYC", "iZ1xd5Ux", "APxr4emb"], "type": "YVwC3FCF"}' \
    > test.out 2>&1
eval_tap $? 79 'CreateContentS3' test.out

#- 80 PublicUpdateContentByShareCode
./ng net.accelbyte.sdk.cli.Main ugc publicUpdateContentByShareCode \
    --channelId 'Z4Uo3ogJ' \
    --namespace "$AB_NAMESPACE" \
    --shareCode '2epq108k' \
    --userId 'keBKDcN7' \
    --body '{"contentType": "Ei20DO9z", "customAttributes": {"ZL3ug6TW": {}, "DLssb0gT": {}, "FJviUJC0": {}}, "fileExtension": "xPIy825P", "name": "sKtpFKwm", "payload": "Ytc0HeaO", "preview": "islCdfSL", "previewMetadata": {"previewContentType": "4LeRsxk2", "previewFileExtension": "EN1j6ebX"}, "subType": "rcCUavF7", "tags": ["zwQ0tT1q", "ps2vNueA", "wGi9xK8P"], "type": "BAeQ8dVy", "updateContentFile": false}' \
    > test.out 2>&1
eval_tap $? 80 'PublicUpdateContentByShareCode' test.out

#- 81 UpdateContentS3
./ng net.accelbyte.sdk.cli.Main ugc updateContentS3 \
    --channelId 'gy8j9Z1G' \
    --contentId 'qLfoSmHn' \
    --namespace "$AB_NAMESPACE" \
    --userId 'Y9fpZLY1' \
    --body '{"contentType": "qc5kHzEs", "customAttributes": {"KYUQDU2B": {}, "ardyJD1U": {}, "OPie37Rh": {}}, "fileExtension": "GMn6l75R", "name": "XlFLxb4a", "payload": "8T9Ub21n", "preview": "yS5z7Rpc", "previewMetadata": {"previewContentType": "J4V2dgcz", "previewFileExtension": "0vFeSNbJ"}, "subType": "cqWO07ul", "tags": ["h42UQy8J", "jSCvwSVy", "GqI3KTlG"], "type": "o2etjKbf", "updateContentFile": false}' \
    > test.out 2>&1
eval_tap $? 81 'UpdateContentS3' test.out

#- 82 PublicDeleteContentByShareCode
./ng net.accelbyte.sdk.cli.Main ugc publicDeleteContentByShareCode \
    --channelId 'osT4SRlN' \
    --namespace "$AB_NAMESPACE" \
    --shareCode 'Lvx7mRox' \
    --userId 'hJD4dSFC' \
    > test.out 2>&1
eval_tap $? 82 'PublicDeleteContentByShareCode' test.out

#- 83 UpdateContentDirect
eval_tap 0 83 'UpdateContentDirect # SKIP deprecated' test.out

#- 84 DeleteContent
./ng net.accelbyte.sdk.cli.Main ugc deleteContent \
    --channelId 'SJctHkF8' \
    --contentId 'j238UCmP' \
    --namespace "$AB_NAMESPACE" \
    --userId 'amQJr33M' \
    > test.out 2>&1
eval_tap $? 84 'DeleteContent' test.out

#- 85 UpdateContentShareCode
./ng net.accelbyte.sdk.cli.Main ugc updateContentShareCode \
    --channelId 'heR3Ddip' \
    --contentId 'wtcOkmx0' \
    --namespace "$AB_NAMESPACE" \
    --userId 'yL8hATRx' \
    --body '{"shareCode": "3ynlAN1h"}' \
    > test.out 2>&1
eval_tap $? 85 'UpdateContentShareCode' test.out

#- 86 PublicGetUserContent
./ng net.accelbyte.sdk.cli.Main ugc publicGetUserContent \
    --namespace "$AB_NAMESPACE" \
    --userId '4ZjVZRwr' \
    --limit '96' \
    --offset '65' \
    > test.out 2>&1
eval_tap $? 86 'PublicGetUserContent' test.out

#- 87 DeleteAllUserContents
./ng net.accelbyte.sdk.cli.Main ugc deleteAllUserContents \
    --namespace "$AB_NAMESPACE" \
    --userId 'KLgk4tso' \
    > test.out 2>&1
eval_tap $? 87 'DeleteAllUserContents' test.out

#- 88 UpdateScreenshots
./ng net.accelbyte.sdk.cli.Main ugc updateScreenshots \
    --contentId 'OzarwyHD' \
    --namespace "$AB_NAMESPACE" \
    --userId 'P371pekX' \
    --body '{"screenshots": [{"description": "KiwsS6wc", "screenshotId": "7l6TOrSz"}, {"description": "XdCEZiVK", "screenshotId": "uE0EFDRj"}, {"description": "VrNfomre", "screenshotId": "72PrmrFq"}]}' \
    > test.out 2>&1
eval_tap $? 88 'UpdateScreenshots' test.out

#- 89 UploadContentScreenshot
./ng net.accelbyte.sdk.cli.Main ugc uploadContentScreenshot \
    --contentId 'a0319XbK' \
    --namespace "$AB_NAMESPACE" \
    --userId 'wlKeyhb4' \
    --body '{"screenshots": [{"contentType": "KhRg2iWZ", "description": "nYEtF2H5", "fileExtension": "png"}, {"contentType": "Vuz1Y6xI", "description": "ijW18N3E", "fileExtension": "png"}, {"contentType": "CIT48WF7", "description": "yr9xp0IV", "fileExtension": "jfif"}]}' \
    > test.out 2>&1
eval_tap $? 89 'UploadContentScreenshot' test.out

#- 90 DeleteContentScreenshot
./ng net.accelbyte.sdk.cli.Main ugc deleteContentScreenshot \
    --contentId 'BRWqjw2m' \
    --namespace "$AB_NAMESPACE" \
    --screenshotId '0T9xcJKn' \
    --userId 'ls2lw5hs' \
    > test.out 2>&1
eval_tap $? 90 'DeleteContentScreenshot' test.out

#- 91 UpdateUserFollowStatus
./ng net.accelbyte.sdk.cli.Main ugc updateUserFollowStatus \
    --namespace "$AB_NAMESPACE" \
    --userId 'jwD03okl' \
    --body '{"followStatus": true}' \
    > test.out 2>&1
eval_tap $? 91 'UpdateUserFollowStatus' test.out

#- 92 GetPublicFollowers
./ng net.accelbyte.sdk.cli.Main ugc getPublicFollowers \
    --namespace "$AB_NAMESPACE" \
    --userId 'QKgPY5F1' \
    --limit '1' \
    --offset '10' \
    > test.out 2>&1
eval_tap $? 92 'GetPublicFollowers' test.out

#- 93 GetPublicFollowing
./ng net.accelbyte.sdk.cli.Main ugc getPublicFollowing \
    --namespace "$AB_NAMESPACE" \
    --userId '6HHMSKP8' \
    --limit '68' \
    --offset '17' \
    > test.out 2>&1
eval_tap $? 93 'GetPublicFollowing' test.out

#- 94 GetGroups
./ng net.accelbyte.sdk.cli.Main ugc getGroups \
    --namespace "$AB_NAMESPACE" \
    --userId 'l8a9ibL1' \
    --limit '54' \
    --offset '19' \
    > test.out 2>&1
eval_tap $? 94 'GetGroups' test.out

#- 95 CreateGroup
./ng net.accelbyte.sdk.cli.Main ugc createGroup \
    --namespace "$AB_NAMESPACE" \
    --userId 'YiQnj6hG' \
    --body '{"contents": ["b61s3fVv", "9QRx45fc", "PZzxRy9c"], "name": "NV2do1V0"}' \
    > test.out 2>&1
eval_tap $? 95 'CreateGroup' test.out

#- 96 DeleteAllUserGroup
./ng net.accelbyte.sdk.cli.Main ugc deleteAllUserGroup \
    --namespace "$AB_NAMESPACE" \
    --userId 'A8NuQaJu' \
    > test.out 2>&1
eval_tap $? 96 'DeleteAllUserGroup' test.out

#- 97 GetGroup
./ng net.accelbyte.sdk.cli.Main ugc getGroup \
    --groupId 'WxkMIB8s' \
    --namespace "$AB_NAMESPACE" \
    --userId 'T6DaVUf3' \
    > test.out 2>&1
eval_tap $? 97 'GetGroup' test.out

#- 98 UpdateGroup
./ng net.accelbyte.sdk.cli.Main ugc updateGroup \
    --groupId 'tJ6FOdS3' \
    --namespace "$AB_NAMESPACE" \
    --userId 'APXSCqf5' \
    --body '{"contents": ["BkvutV5T", "XxCS62g8", "OvPuMA67"], "name": "o06sn2CO"}' \
    > test.out 2>&1
eval_tap $? 98 'UpdateGroup' test.out

#- 99 DeleteGroup
./ng net.accelbyte.sdk.cli.Main ugc deleteGroup \
    --groupId 'PU6EBfAh' \
    --namespace "$AB_NAMESPACE" \
    --userId 'EMkD28Gh' \
    > test.out 2>&1
eval_tap $? 99 'DeleteGroup' test.out

#- 100 GetGroupContent
./ng net.accelbyte.sdk.cli.Main ugc getGroupContent \
    --groupId '6Qx6uXWO' \
    --namespace "$AB_NAMESPACE" \
    --userId 'HJFpLHRy' \
    --limit '69' \
    --offset '4' \
    > test.out 2>&1
eval_tap $? 100 'GetGroupContent' test.out

#- 101 DeleteAllUserStates
./ng net.accelbyte.sdk.cli.Main ugc deleteAllUserStates \
    --namespace "$AB_NAMESPACE" \
    --userId 'rXmmJntU' \
    > test.out 2>&1
eval_tap $? 101 'DeleteAllUserStates' test.out

#- 102 AdminGetContentByChannelIDV2
./ng net.accelbyte.sdk.cli.Main ugc adminGetContentByChannelIDV2 \
    --channelId 'gXoo2HFA' \
    --namespace "$AB_NAMESPACE" \
    --limit '74' \
    --name 'vyKC3v1V' \
    --offset '86' \
    --sortBy 'np8cO2Wv' \
    > test.out 2>&1
eval_tap $? 102 'AdminGetContentByChannelIDV2' test.out

#- 103 AdminCreateContentV2
./ng net.accelbyte.sdk.cli.Main ugc adminCreateContentV2 \
    --channelId 'XmZRBL2t' \
    --namespace "$AB_NAMESPACE" \
    --body '{"contentType": "RvO95pvo", "customAttributes": {"QOSbuVit": {}, "K38TqNPH": {}, "E0fnWWiq": {}}, "fileExtension": "pigwnVfH", "name": "JYmNR8SJ", "shareCode": "ndgRCmqP", "subType": "ehI9iCWf", "tags": ["ekTwAejr", "c1JGqtNf", "SNHM2yQW"], "type": "7LB9I5tG"}' \
    > test.out 2>&1
eval_tap $? 103 'AdminCreateContentV2' test.out

#- 104 AdminDeleteOfficialContentV2
./ng net.accelbyte.sdk.cli.Main ugc adminDeleteOfficialContentV2 \
    --channelId 'FP2QTQDF' \
    --contentId 'R8PbPsCP' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 104 'AdminDeleteOfficialContentV2' test.out

#- 105 AdminUpdateOfficialContentV2
./ng net.accelbyte.sdk.cli.Main ugc adminUpdateOfficialContentV2 \
    --channelId 'GTaznkl2' \
    --contentId 'GmYjIYjJ' \
    --namespace "$AB_NAMESPACE" \
    --body '{"customAttributes": {"ux99j9Th": {}, "UVDpf17B": {}, "ovox88Fx": {}}, "name": "38qYEAQd", "shareCode": "qaTYLhvT", "subType": "rZj9xSJQ", "tags": ["BfZorD5f", "8BT8W2nq", "5Sip07pA"], "type": "JHqDSGCS"}' \
    > test.out 2>&1
eval_tap $? 105 'AdminUpdateOfficialContentV2' test.out

#- 106 AdminUpdateOfficialContentFileLocation
./ng net.accelbyte.sdk.cli.Main ugc adminUpdateOfficialContentFileLocation \
    --channelId 'hukOH5lg' \
    --contentId '99az38ps' \
    --namespace "$AB_NAMESPACE" \
    --body '{"fileExtension": "JI1CwAyA", "fileLocation": "ttyQWn9W"}' \
    > test.out 2>&1
eval_tap $? 106 'AdminUpdateOfficialContentFileLocation' test.out

#- 107 AdminGenerateOfficialContentUploadURLV2
./ng net.accelbyte.sdk.cli.Main ugc adminGenerateOfficialContentUploadURLV2 \
    --channelId 'QRQfpp3K' \
    --contentId 'nuGnaKpe' \
    --namespace "$AB_NAMESPACE" \
    --body '{"contentType": "P6QlO8Ov", "fileExtension": "dPxTOuqv"}' \
    > test.out 2>&1
eval_tap $? 107 'AdminGenerateOfficialContentUploadURLV2' test.out

#- 108 AdminGetConfigs
./ng net.accelbyte.sdk.cli.Main ugc adminGetConfigs \
    --namespace "$AB_NAMESPACE" \
    --limit '64' \
    --offset '11' \
    > test.out 2>&1
eval_tap $? 108 'AdminGetConfigs' test.out

#- 109 AdminUpdateConfig
./ng net.accelbyte.sdk.cli.Main ugc adminUpdateConfig \
    --key 'apJXKmbm' \
    --namespace "$AB_NAMESPACE" \
    --body '{"value": "FJETj72U"}' \
    > test.out 2>&1
eval_tap $? 109 'AdminUpdateConfig' test.out

#- 110 AdminListContentV2
./ng net.accelbyte.sdk.cli.Main ugc adminListContentV2 \
    --namespace "$AB_NAMESPACE" \
    --isOfficial  \
    --limit '45' \
    --name 'wrfDkcZi' \
    --offset '22' \
    --sortBy 'AGxUh9Xm' \
    --subType 'eIXJ5JqT' \
    --tags 'jlMbKtag,UFGp2buX,0eyaEmUo' \
    --type 'gkli4wlT' \
    > test.out 2>&1
eval_tap $? 110 'AdminListContentV2' test.out

#- 111 AdminBulkGetContentByIDsV2
./ng net.accelbyte.sdk.cli.Main ugc adminBulkGetContentByIDsV2 \
    --namespace "$AB_NAMESPACE" \
    --body '{"contentIds": ["vGIFZHuh", "Td3QKDYR", "0uVelIDk"]}' \
    > test.out 2>&1
eval_tap $? 111 'AdminBulkGetContentByIDsV2' test.out

#- 112 AdminGetContentBulkByShareCodesV2
./ng net.accelbyte.sdk.cli.Main ugc adminGetContentBulkByShareCodesV2 \
    --namespace "$AB_NAMESPACE" \
    --body '{"shareCodes": ["04irqxYs", "E9LMODRZ", "FAcB8X2I"]}' \
    > test.out 2>&1
eval_tap $? 112 'AdminGetContentBulkByShareCodesV2' test.out

#- 113 AdminGetContentByShareCodeV2
./ng net.accelbyte.sdk.cli.Main ugc adminGetContentByShareCodeV2 \
    --namespace "$AB_NAMESPACE" \
    --shareCode 'dMojLih1' \
    > test.out 2>&1
eval_tap $? 113 'AdminGetContentByShareCodeV2' test.out

#- 114 AdminGetContentByContentIDV2
./ng net.accelbyte.sdk.cli.Main ugc adminGetContentByContentIDV2 \
    --contentId 'p0htoaiB' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 114 'AdminGetContentByContentIDV2' test.out

#- 115 RollbackContentVersionV2
./ng net.accelbyte.sdk.cli.Main ugc rollbackContentVersionV2 \
    --contentId '255Gl3Ov' \
    --namespace "$AB_NAMESPACE" \
    --versionId 'Ceq7FCW8' \
    > test.out 2>&1
eval_tap $? 115 'RollbackContentVersionV2' test.out

#- 116 AdminUpdateScreenshotsV2
./ng net.accelbyte.sdk.cli.Main ugc adminUpdateScreenshotsV2 \
    --contentId 'tAm7lFxo' \
    --namespace "$AB_NAMESPACE" \
    --body '{"screenshots": [{"description": "5EZf2m0L", "screenshotId": "YYag0V57"}, {"description": "zV2Dgsie", "screenshotId": "8aVMTkU7"}, {"description": "uJhQz3i1", "screenshotId": "dbCaRa06"}]}' \
    > test.out 2>&1
eval_tap $? 116 'AdminUpdateScreenshotsV2' test.out

#- 117 AdminUploadContentScreenshotV2
./ng net.accelbyte.sdk.cli.Main ugc adminUploadContentScreenshotV2 \
    --contentId '8iGNlH2K' \
    --namespace "$AB_NAMESPACE" \
    --body '{"screenshots": [{"contentType": "No4GjadV", "description": "i1o7YXnT", "fileExtension": "bmp"}, {"contentType": "SjHHO0Gd", "description": "4Habq2O3", "fileExtension": "png"}, {"contentType": "AbxNIGtZ", "description": "8yZfH7Zd", "fileExtension": "png"}]}' \
    > test.out 2>&1
eval_tap $? 117 'AdminUploadContentScreenshotV2' test.out

#- 118 AdminDeleteContentScreenshotV2
./ng net.accelbyte.sdk.cli.Main ugc adminDeleteContentScreenshotV2 \
    --contentId 'Lfl3xat0' \
    --namespace "$AB_NAMESPACE" \
    --screenshotId 'u2wShLi4' \
    > test.out 2>&1
eval_tap $? 118 'AdminDeleteContentScreenshotV2' test.out

#- 119 ListContentVersionsV2
./ng net.accelbyte.sdk.cli.Main ugc listContentVersionsV2 \
    --contentId 'q2Qk3wMU' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 119 'ListContentVersionsV2' test.out

#- 120 AdminGetOfficialGroupContentsV2
./ng net.accelbyte.sdk.cli.Main ugc adminGetOfficialGroupContentsV2 \
    --groupId 'XPq978rc' \
    --namespace "$AB_NAMESPACE" \
    --limit '34' \
    --offset '67' \
    > test.out 2>&1
eval_tap $? 120 'AdminGetOfficialGroupContentsV2' test.out

#- 121 AdminListStagingContents
./ng net.accelbyte.sdk.cli.Main ugc adminListStagingContents \
    --namespace "$AB_NAMESPACE" \
    --limit '44' \
    --offset '6' \
    --sortBy 'D26TV4mZ' \
    --status 'SOuPk9hf' \
    > test.out 2>&1
eval_tap $? 121 'AdminListStagingContents' test.out

#- 122 AdminGetStagingContentByID
./ng net.accelbyte.sdk.cli.Main ugc adminGetStagingContentByID \
    --contentId 'etRT86DE' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 122 'AdminGetStagingContentByID' test.out

#- 123 AdminApproveStagingContent
./ng net.accelbyte.sdk.cli.Main ugc adminApproveStagingContent \
    --contentId 'icgAQHCv' \
    --namespace "$AB_NAMESPACE" \
    --body '{"approved": false, "note": "bXaTfCsj"}' \
    > test.out 2>&1
eval_tap $? 123 'AdminApproveStagingContent' test.out

#- 124 AdminUpdateContentByShareCodeV2
./ng net.accelbyte.sdk.cli.Main ugc adminUpdateContentByShareCodeV2 \
    --channelId 'yEGlQqPn' \
    --namespace "$AB_NAMESPACE" \
    --shareCode 'iGOYRHGm' \
    --userId 'rbWBpxeS' \
    --body '{"customAttributes": {"EPwnpXOt": {}, "IrGrvW12": {}, "ekMJbU4u": {}}, "name": "5ZJvuUnH", "shareCode": "8zN4janS", "subType": "clzqwqna", "tags": ["05jhFd2M", "P52WX0Zd", "ROTKhIaD"], "type": "GnO9SwcF"}' \
    > test.out 2>&1
eval_tap $? 124 'AdminUpdateContentByShareCodeV2' test.out

#- 125 AdminDeleteContentByShareCodeV2
./ng net.accelbyte.sdk.cli.Main ugc adminDeleteContentByShareCodeV2 \
    --channelId '2ZBZesqw' \
    --namespace "$AB_NAMESPACE" \
    --shareCode 'LyAa4vC8' \
    --userId 'njkUztF9' \
    > test.out 2>&1
eval_tap $? 125 'AdminDeleteContentByShareCodeV2' test.out

#- 126 AdminDeleteUserContentV2
./ng net.accelbyte.sdk.cli.Main ugc adminDeleteUserContentV2 \
    --channelId 'meARr7So' \
    --contentId 'X9EP40NK' \
    --namespace "$AB_NAMESPACE" \
    --userId 'xJQSIS8l' \
    > test.out 2>&1
eval_tap $? 126 'AdminDeleteUserContentV2' test.out

#- 127 AdminUpdateUserContentV2
./ng net.accelbyte.sdk.cli.Main ugc adminUpdateUserContentV2 \
    --channelId 'b8EWaKmd' \
    --contentId 'eTcyp6DF' \
    --namespace "$AB_NAMESPACE" \
    --userId 'mcRSrKRR' \
    --body '{"customAttributes": {"OP6ssBC0": {}, "N98cilsZ": {}, "JwwKeVOH": {}}, "name": "2YQvH09g", "shareCode": "zqYKgj1X", "subType": "zBd5G2rf", "tags": ["Z9pMpHs9", "YP9SuT3h", "DtT9vlXa"], "type": "SzyLEmba"}' \
    > test.out 2>&1
eval_tap $? 127 'AdminUpdateUserContentV2' test.out

#- 128 AdminUpdateUserContentFileLocation
./ng net.accelbyte.sdk.cli.Main ugc adminUpdateUserContentFileLocation \
    --channelId '5JvROu4d' \
    --contentId 'x3b9e4PL' \
    --namespace "$AB_NAMESPACE" \
    --userId '5mo15Tu4' \
    --body '{"fileExtension": "IFJEsOMN", "fileLocation": "r0najw0J"}' \
    > test.out 2>&1
eval_tap $? 128 'AdminUpdateUserContentFileLocation' test.out

#- 129 AdminGenerateUserContentUploadURLV2
./ng net.accelbyte.sdk.cli.Main ugc adminGenerateUserContentUploadURLV2 \
    --channelId 'n2zsqfHv' \
    --contentId 'C7r8blub' \
    --namespace "$AB_NAMESPACE" \
    --userId 'zvLBwTNr' \
    --body '{"contentType": "PgFt2Ljd", "fileExtension": "qCbLcR7o"}' \
    > test.out 2>&1
eval_tap $? 129 'AdminGenerateUserContentUploadURLV2' test.out

#- 130 AdminGetContentByUserIDV2
./ng net.accelbyte.sdk.cli.Main ugc adminGetContentByUserIDV2 \
    --namespace "$AB_NAMESPACE" \
    --userId 'gSjA4QRi' \
    --limit '38' \
    --offset '46' \
    --sortBy 'dWIKvlEB' \
    > test.out 2>&1
eval_tap $? 130 'AdminGetContentByUserIDV2' test.out

#- 131 AdminUpdateContentHideStatusV2
./ng net.accelbyte.sdk.cli.Main ugc adminUpdateContentHideStatusV2 \
    --contentId '1CJhPAz5' \
    --namespace "$AB_NAMESPACE" \
    --userId 'CYEAi3iD' \
    --body '{"isHidden": false}' \
    > test.out 2>&1
eval_tap $? 131 'AdminUpdateContentHideStatusV2' test.out

#- 132 AdminGetUserGroupContentsV2
./ng net.accelbyte.sdk.cli.Main ugc adminGetUserGroupContentsV2 \
    --groupId 'F9iV3fFm' \
    --namespace "$AB_NAMESPACE" \
    --userId 'SNueQSsE' \
    --limit '46' \
    --offset '96' \
    > test.out 2>&1
eval_tap $? 132 'AdminGetUserGroupContentsV2' test.out

#- 133 AdminListUserStagingContents
./ng net.accelbyte.sdk.cli.Main ugc adminListUserStagingContents \
    --namespace "$AB_NAMESPACE" \
    --userId 'P7KA7RTm' \
    --limit '36' \
    --offset '42' \
    --sortBy 'S9oMPawq' \
    --status 'pO3tNaXH' \
    > test.out 2>&1
eval_tap $? 133 'AdminListUserStagingContents' test.out

#- 134 PublicGetContentByChannelIDV2
./ng net.accelbyte.sdk.cli.Main ugc publicGetContentByChannelIDV2 \
    --channelId 'BYH4AEGl' \
    --namespace "$AB_NAMESPACE" \
    --limit '94' \
    --name 'CKPaqwzk' \
    --offset '21' \
    --sortBy 'YIi22nqt' \
    > test.out 2>&1
eval_tap $? 134 'PublicGetContentByChannelIDV2' test.out

#- 135 PublicListContentV2
./ng net.accelbyte.sdk.cli.Main ugc publicListContentV2 \
    --namespace "$AB_NAMESPACE" \
    --isOfficial  \
    --limit '81' \
    --name 'jax1ZEp6' \
    --offset '76' \
    --sortBy 'ihWZpA6b' \
    --subType 'KjUvHMUI' \
    --tags 'nwniza6a,yAzgWpqO,1SqVpAfq' \
    --type 'ty1QEFyo' \
    > test.out 2>&1
eval_tap $? 135 'PublicListContentV2' test.out

#- 136 PublicBulkGetContentByIDV2
./ng net.accelbyte.sdk.cli.Main ugc publicBulkGetContentByIDV2 \
    --namespace "$AB_NAMESPACE" \
    --body '{"contentIds": ["eY1c27bS", "t4pZXfTH", "KWZux99w"]}' \
    > test.out 2>&1
eval_tap $? 136 'PublicBulkGetContentByIDV2' test.out

#- 137 PublicGetContentBulkByShareCodesV2
./ng net.accelbyte.sdk.cli.Main ugc publicGetContentBulkByShareCodesV2 \
    --namespace "$AB_NAMESPACE" \
    --body '{"shareCodes": ["YQAooS6R", "QTGWkuby", "s8XnkChr"]}' \
    > test.out 2>&1
eval_tap $? 137 'PublicGetContentBulkByShareCodesV2' test.out

#- 138 PublicGetContentByShareCodeV2
./ng net.accelbyte.sdk.cli.Main ugc publicGetContentByShareCodeV2 \
    --namespace "$AB_NAMESPACE" \
    --shareCode 'L9katmk3' \
    > test.out 2>&1
eval_tap $? 138 'PublicGetContentByShareCodeV2' test.out

#- 139 PublicGetContentByIDV2
./ng net.accelbyte.sdk.cli.Main ugc publicGetContentByIDV2 \
    --contentId 'gwTrhrhT' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 139 'PublicGetContentByIDV2' test.out

#- 140 PublicAddDownloadCountV2
./ng net.accelbyte.sdk.cli.Main ugc publicAddDownloadCountV2 \
    --contentId 'rXGu0lnF' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 140 'PublicAddDownloadCountV2' test.out

#- 141 PublicListContentDownloaderV2
./ng net.accelbyte.sdk.cli.Main ugc publicListContentDownloaderV2 \
    --contentId 'qx7QKck2' \
    --namespace "$AB_NAMESPACE" \
    --limit '67' \
    --offset '31' \
    --sortBy 'RV0LqxcB' \
    --userId 'ECkomlsU' \
    > test.out 2>&1
eval_tap $? 141 'PublicListContentDownloaderV2' test.out

#- 142 PublicListContentLikeV2
./ng net.accelbyte.sdk.cli.Main ugc publicListContentLikeV2 \
    --contentId 'pzLQO746' \
    --namespace "$AB_NAMESPACE" \
    --limit '0' \
    --offset '23' \
    --sortBy '01ZjzCmz' \
    > test.out 2>&1
eval_tap $? 142 'PublicListContentLikeV2' test.out

#- 143 UpdateContentLikeStatusV2
./ng net.accelbyte.sdk.cli.Main ugc updateContentLikeStatusV2 \
    --contentId 'MFxB0wLs' \
    --namespace "$AB_NAMESPACE" \
    --body '{"likeStatus": false}' \
    > test.out 2>&1
eval_tap $? 143 'UpdateContentLikeStatusV2' test.out

#- 144 PublicCreateContentV2
./ng net.accelbyte.sdk.cli.Main ugc publicCreateContentV2 \
    --channelId 'rQg2xBxi' \
    --namespace "$AB_NAMESPACE" \
    --userId 'xgJGV26b' \
    --body '{"contentType": "mduoGK8K", "customAttributes": {"zuC1HUdr": {}, "elaPRayr": {}, "RYy8cq2y": {}}, "fileExtension": "mOB2LSYb", "name": "WXv96bsT", "subType": "3vEqQGpC", "tags": ["LxD0yTLn", "dtb8VT00", "nHhpFlt3"], "type": "zMDy5NG2"}' \
    > test.out 2>&1
eval_tap $? 144 'PublicCreateContentV2' test.out

#- 145 PublicUpdateContentByShareCodeV2
./ng net.accelbyte.sdk.cli.Main ugc publicUpdateContentByShareCodeV2 \
    --channelId 'oJGtkbRL' \
    --namespace "$AB_NAMESPACE" \
    --shareCode '1DfHr8UF' \
    --userId 'RP0EA0vs' \
    --body '{"customAttributes": {"9Jgp5lL6": {}, "bRsAiIaz": {}, "dHA1UFI6": {}}, "name": "GpXjo4x7", "subType": "4lPTUjZF", "tags": ["qyVBfSOm", "xZNnDyAg", "ve6rG5sx"], "type": "PB3rLRLj"}' \
    > test.out 2>&1
eval_tap $? 145 'PublicUpdateContentByShareCodeV2' test.out

#- 146 PublicDeleteContentByShareCodeV2
./ng net.accelbyte.sdk.cli.Main ugc publicDeleteContentByShareCodeV2 \
    --channelId 'mpmFAvTH' \
    --namespace "$AB_NAMESPACE" \
    --shareCode 'cV4AMtcn' \
    --userId 'DzIwA0JS' \
    > test.out 2>&1
eval_tap $? 146 'PublicDeleteContentByShareCodeV2' test.out

#- 147 PublicDeleteContentV2
./ng net.accelbyte.sdk.cli.Main ugc publicDeleteContentV2 \
    --channelId 'dA4nTcYi' \
    --contentId 'weysTQpu' \
    --namespace "$AB_NAMESPACE" \
    --userId 'cnlT5xt9' \
    > test.out 2>&1
eval_tap $? 147 'PublicDeleteContentV2' test.out

#- 148 PublicUpdateContentV2
./ng net.accelbyte.sdk.cli.Main ugc publicUpdateContentV2 \
    --channelId 'Nd9zav7Z' \
    --contentId 'JXXc7Gp5' \
    --namespace "$AB_NAMESPACE" \
    --userId 'YYNU7opE' \
    --body '{"customAttributes": {"Uz08IG3G": {}, "fwWWPLmM": {}, "HAEj2O43": {}}, "name": "sD7P6SgC", "subType": "oJdqnkIs", "tags": ["pjTTighj", "d2qe2C3t", "x29aQ01a"], "type": "Z3wE0mmg"}' \
    > test.out 2>&1
eval_tap $? 148 'PublicUpdateContentV2' test.out

#- 149 PublicUpdateContentFileLocation
./ng net.accelbyte.sdk.cli.Main ugc publicUpdateContentFileLocation \
    --channelId 'pNd1Mi62' \
    --contentId 'FKzcUhzR' \
    --namespace "$AB_NAMESPACE" \
    --userId 'Ih1DIk8x' \
    --body '{"fileExtension": "DP46UepF", "fileLocation": "1JqLNhb8"}' \
    > test.out 2>&1
eval_tap $? 149 'PublicUpdateContentFileLocation' test.out

#- 150 UpdateContentShareCodeV2
./ng net.accelbyte.sdk.cli.Main ugc updateContentShareCodeV2 \
    --channelId 'S6hml1Cf' \
    --contentId 'vn3WO0Mi' \
    --namespace "$AB_NAMESPACE" \
    --userId 'WwxsLIgP' \
    --body '{"shareCode": "sUcz6Qgo"}' \
    > test.out 2>&1
eval_tap $? 150 'UpdateContentShareCodeV2' test.out

#- 151 PublicGenerateContentUploadURLV2
./ng net.accelbyte.sdk.cli.Main ugc publicGenerateContentUploadURLV2 \
    --channelId 'oPox8cIY' \
    --contentId 'fH0nl5Yp' \
    --namespace "$AB_NAMESPACE" \
    --userId 'H0n9duX8' \
    --body '{"contentType": "t3EYgfO6", "fileExtension": "7hKUfzKs"}' \
    > test.out 2>&1
eval_tap $? 151 'PublicGenerateContentUploadURLV2' test.out

#- 152 PublicGetContentByUserIDV2
./ng net.accelbyte.sdk.cli.Main ugc publicGetContentByUserIDV2 \
    --namespace "$AB_NAMESPACE" \
    --userId 'sjdQYCXm' \
    --limit '63' \
    --offset '66' \
    --sortBy 'luUxU07h' \
    > test.out 2>&1
eval_tap $? 152 'PublicGetContentByUserIDV2' test.out

#- 153 UpdateScreenshotsV2
./ng net.accelbyte.sdk.cli.Main ugc updateScreenshotsV2 \
    --contentId '1aYKzRJk' \
    --namespace "$AB_NAMESPACE" \
    --userId 'MZLbu9n2' \
    --body '{"screenshots": [{"description": "r290fUat", "screenshotId": "NGEOX4ri"}, {"description": "nEB2gNYG", "screenshotId": "EVGBjCh9"}, {"description": "4V41uBb3", "screenshotId": "9BmZdSoB"}]}' \
    > test.out 2>&1
eval_tap $? 153 'UpdateScreenshotsV2' test.out

#- 154 UploadContentScreenshotV2
./ng net.accelbyte.sdk.cli.Main ugc uploadContentScreenshotV2 \
    --contentId 'tQ6BeEDA' \
    --namespace "$AB_NAMESPACE" \
    --userId 'k6dSXY3e' \
    --body '{"screenshots": [{"contentType": "BLttaxgj", "description": "Vzycudxk", "fileExtension": "bmp"}, {"contentType": "OW5JrIBV", "description": "9zuTIW0n", "fileExtension": "jpg"}, {"contentType": "Uwej8Gzp", "description": "Az1I0kft", "fileExtension": "pjp"}]}' \
    > test.out 2>&1
eval_tap $? 154 'UploadContentScreenshotV2' test.out

#- 155 DeleteContentScreenshotV2
./ng net.accelbyte.sdk.cli.Main ugc deleteContentScreenshotV2 \
    --contentId 'dIN7BYl1' \
    --namespace "$AB_NAMESPACE" \
    --screenshotId 'sSuYbol4' \
    --userId 's878zUtv' \
    > test.out 2>&1
eval_tap $? 155 'DeleteContentScreenshotV2' test.out

#- 156 PublicGetGroupContentsV2
./ng net.accelbyte.sdk.cli.Main ugc publicGetGroupContentsV2 \
    --groupId 'QOWtvFpu' \
    --namespace "$AB_NAMESPACE" \
    --userId 'zGLmPrv0' \
    --limit '84' \
    --offset '92' \
    > test.out 2>&1
eval_tap $? 156 'PublicGetGroupContentsV2' test.out

#- 157 ListUserStagingContents
./ng net.accelbyte.sdk.cli.Main ugc listUserStagingContents \
    --namespace "$AB_NAMESPACE" \
    --userId 'CUrVqeQG' \
    --limit '89' \
    --offset '14' \
    --sortBy '3IuUMHJ5' \
    --status 'Jmmcuum8' \
    > test.out 2>&1
eval_tap $? 157 'ListUserStagingContents' test.out

#- 158 GetUserStagingContentByID
./ng net.accelbyte.sdk.cli.Main ugc getUserStagingContentByID \
    --contentId 'HnydZPyU' \
    --namespace "$AB_NAMESPACE" \
    --userId 'Rlda2cdh' \
    > test.out 2>&1
eval_tap $? 158 'GetUserStagingContentByID' test.out

#- 159 UpdateStagingContent
./ng net.accelbyte.sdk.cli.Main ugc updateStagingContent \
    --contentId 'PBgt2tu2' \
    --namespace "$AB_NAMESPACE" \
    --userId 'wuxuUWqk' \
    --body '{"fileExtension": "WasUDTsI", "fileLocation": "47YKbd64"}' \
    > test.out 2>&1
eval_tap $? 159 'UpdateStagingContent' test.out

#- 160 DeleteUserStagingContentByID
./ng net.accelbyte.sdk.cli.Main ugc deleteUserStagingContentByID \
    --contentId '5P6xZTbA' \
    --namespace "$AB_NAMESPACE" \
    --userId '0U9JlZlH' \
    > test.out 2>&1
eval_tap $? 160 'DeleteUserStagingContentByID' test.out


rm -f "tmp.dat"

exit $EXIT_CODE