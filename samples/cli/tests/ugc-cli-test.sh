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
    --limit '100' \
    --offset '19' \
    > test.out 2>&1
eval_tap $? 2 'SingleAdminGetChannel' test.out

#- 3 AdminCreateChannel
./ng net.accelbyte.sdk.cli.Main ugc adminCreateChannel \
    --namespace "$AB_NAMESPACE" \
    --body '{"id": "mAD98FHd", "name": "tZfpYWQr"}' \
    > test.out 2>&1
eval_tap $? 3 'AdminCreateChannel' test.out

#- 4 SingleAdminUpdateChannel
./ng net.accelbyte.sdk.cli.Main ugc singleAdminUpdateChannel \
    --channelId '1YPRx4bb' \
    --namespace "$AB_NAMESPACE" \
    --body '{"name": "dJf50W9M"}' \
    > test.out 2>&1
eval_tap $? 4 'SingleAdminUpdateChannel' test.out

#- 5 SingleAdminDeleteChannel
./ng net.accelbyte.sdk.cli.Main ugc singleAdminDeleteChannel \
    --channelId 'cyPACqlf' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 5 'SingleAdminDeleteChannel' test.out

#- 6 AdminUploadContentDirect
eval_tap 0 6 'AdminUploadContentDirect # SKIP deprecated' test.out

#- 7 AdminUploadContentS3
./ng net.accelbyte.sdk.cli.Main ugc adminUploadContentS3 \
    --channelId 'drQnpQ9n' \
    --namespace "$AB_NAMESPACE" \
    --body '{"contentType": "ADPL1haO", "customAttributes": {"RiLawcvU": {}, "pKVVPlC4": {}, "UmBrEqVh": {}}, "fileExtension": "Cs6oR0w3", "name": "hqmkkQTm", "preview": "L2yv5QdW", "previewMetadata": {"previewContentType": "BhpfbgIr", "previewFileExtension": "1AHNPWKp"}, "shareCode": "2STlZHz1", "subType": "aVJbr76a", "tags": ["xidmeMwa", "Fp8ayWDU", "cnGIpGXJ"], "type": "J6XqaBBT"}' \
    > test.out 2>&1
eval_tap $? 7 'AdminUploadContentS3' test.out

#- 8 SingleAdminUpdateContentS3
./ng net.accelbyte.sdk.cli.Main ugc singleAdminUpdateContentS3 \
    --channelId '49XkO1Id' \
    --contentId 'pZ0gldgI' \
    --namespace "$AB_NAMESPACE" \
    --body '{"contentType": "GOUdXtSm", "customAttributes": {"iYI7ZDb9": {}, "ppiVr6UU": {}, "J7RB92j3": {}}, "fileExtension": "n9zV2xBu", "name": "x9wf5q8f", "payload": "qwtp2Imi", "preview": "hLVdC3TZ", "previewMetadata": {"previewContentType": "WuBQe1pa", "previewFileExtension": "soCexRXx"}, "shareCode": "kO6CCdC3", "subType": "Mjp0kQgF", "tags": ["ItgPQApO", "M0t5IMYY", "6V7XpqYD"], "type": "8IwCy9Yb", "updateContentFile": false}' \
    > test.out 2>&1
eval_tap $? 8 'SingleAdminUpdateContentS3' test.out

#- 9 AdminSearchChannelSpecificContent
./ng net.accelbyte.sdk.cli.Main ugc adminSearchChannelSpecificContent \
    --channelId 'AtipnHjf' \
    --namespace "$AB_NAMESPACE" \
    --creator 'XRnDLqve' \
    --ishidden 'nVUfT9ir' \
    --isofficial 'Watz1lle' \
    --limit '44' \
    --name 'obAehAa6' \
    --offset '30' \
    --orderby 'VbnyjeDD' \
    --sortby 'ZOgPyLu0' \
    --subtype '4AH6CuSM' \
    --tags '0vmXKTKm,73aFwRor,SuNGSUcY' \
    --type 'RZQC4BJn' \
    --userId 'X0PvXahC' \
    > test.out 2>&1
eval_tap $? 9 'AdminSearchChannelSpecificContent' test.out

#- 10 SingleAdminUpdateContentDirect
eval_tap 0 10 'SingleAdminUpdateContentDirect # SKIP deprecated' test.out

#- 11 SingleAdminDeleteContent
./ng net.accelbyte.sdk.cli.Main ugc singleAdminDeleteContent \
    --channelId 'JtmbaHNd' \
    --contentId 'bFRZ8iUq' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 11 'SingleAdminDeleteContent' test.out

#- 12 SingleAdminGetContent
./ng net.accelbyte.sdk.cli.Main ugc singleAdminGetContent \
    --namespace "$AB_NAMESPACE" \
    --limit '7' \
    --offset '10' \
    > test.out 2>&1
eval_tap $? 12 'SingleAdminGetContent' test.out

#- 13 AdminGetContentBulk
./ng net.accelbyte.sdk.cli.Main ugc adminGetContentBulk \
    --namespace "$AB_NAMESPACE" \
    --body '{"contentIds": ["7ms8iuRb", "ZKnkz8ax", "6wrGr2vW"]}' \
    > test.out 2>&1
eval_tap $? 13 'AdminGetContentBulk' test.out

#- 14 AdminSearchContent
./ng net.accelbyte.sdk.cli.Main ugc adminSearchContent \
    --namespace "$AB_NAMESPACE" \
    --creator 'zz5lDfaX' \
    --ishidden 'qw6FG7zS' \
    --isofficial 'Zaa2RTar' \
    --limit '20' \
    --name 'tSL31FIp' \
    --offset '9' \
    --orderby 'jYhu3Cms' \
    --sortby 'HVyV6GmB' \
    --subtype 'g7PcVNg1' \
    --tags 'hwMtvf4O,sQIKIFOo,KU4JKySY' \
    --type 'oL1UNQhH' \
    --userId 'ZunqqNR4' \
    > test.out 2>&1
eval_tap $? 14 'AdminSearchContent' test.out

#- 15 AdminGetContentBulkByShareCodes
./ng net.accelbyte.sdk.cli.Main ugc adminGetContentBulkByShareCodes \
    --namespace "$AB_NAMESPACE" \
    --body '{"shareCodes": ["72KSZMBI", "4QeJuQLQ", "xCOmgLZT"]}' \
    > test.out 2>&1
eval_tap $? 15 'AdminGetContentBulkByShareCodes' test.out

#- 16 AdminGetUserContentByShareCode
./ng net.accelbyte.sdk.cli.Main ugc adminGetUserContentByShareCode \
    --namespace "$AB_NAMESPACE" \
    --shareCode 'qmeGPjx3' \
    > test.out 2>&1
eval_tap $? 16 'AdminGetUserContentByShareCode' test.out

#- 17 AdminGetSpecificContent
./ng net.accelbyte.sdk.cli.Main ugc adminGetSpecificContent \
    --contentId '5ynnWYcE' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 17 'AdminGetSpecificContent' test.out

#- 18 AdminDownloadContentPreview
./ng net.accelbyte.sdk.cli.Main ugc adminDownloadContentPreview \
    --contentId 'zytAPukx' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 18 'AdminDownloadContentPreview' test.out

#- 19 RollbackContentVersion
./ng net.accelbyte.sdk.cli.Main ugc rollbackContentVersion \
    --contentId 'bIkFgrdO' \
    --namespace "$AB_NAMESPACE" \
    --versionId 'BiTo3dM1' \
    > test.out 2>&1
eval_tap $? 19 'RollbackContentVersion' test.out

#- 20 AdminUpdateScreenshots
./ng net.accelbyte.sdk.cli.Main ugc adminUpdateScreenshots \
    --contentId 'UsXwiUYf' \
    --namespace "$AB_NAMESPACE" \
    --body '{"screenshots": [{"description": "Ku1Xs6u5", "screenshotId": "4UoXukQJ"}, {"description": "HMGKi4ka", "screenshotId": "9GHG2siW"}, {"description": "nSZu1ZzE", "screenshotId": "CZrktXDS"}]}' \
    > test.out 2>&1
eval_tap $? 20 'AdminUpdateScreenshots' test.out

#- 21 AdminUploadContentScreenshot
./ng net.accelbyte.sdk.cli.Main ugc adminUploadContentScreenshot \
    --contentId 'P5htB3ai' \
    --namespace "$AB_NAMESPACE" \
    --body '{"screenshots": [{"contentType": "QiC0ANdB", "description": "np9HifLm", "fileExtension": "jfif"}, {"contentType": "B1XDbowc", "description": "1V1GJ47k", "fileExtension": "png"}, {"contentType": "5h4zYnd2", "description": "dqZoCUVZ", "fileExtension": "jfif"}]}' \
    > test.out 2>&1
eval_tap $? 21 'AdminUploadContentScreenshot' test.out

#- 22 AdminDeleteContentScreenshot
./ng net.accelbyte.sdk.cli.Main ugc adminDeleteContentScreenshot \
    --contentId '26tvlkzc' \
    --namespace "$AB_NAMESPACE" \
    --screenshotId 'QM7vZv5c' \
    > test.out 2>&1
eval_tap $? 22 'AdminDeleteContentScreenshot' test.out

#- 23 ListContentVersions
./ng net.accelbyte.sdk.cli.Main ugc listContentVersions \
    --contentId 'MMbR0BrR' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 23 'ListContentVersions' test.out

#- 24 SingleAdminGetAllGroups
./ng net.accelbyte.sdk.cli.Main ugc singleAdminGetAllGroups \
    --namespace "$AB_NAMESPACE" \
    --limit '96' \
    --offset '6' \
    > test.out 2>&1
eval_tap $? 24 'SingleAdminGetAllGroups' test.out

#- 25 AdminCreateGroup
./ng net.accelbyte.sdk.cli.Main ugc adminCreateGroup \
    --namespace "$AB_NAMESPACE" \
    --body '{"contents": ["FZUCdhHH", "S7yqEePQ", "FaacaHLv"], "name": "MIzVBKcC"}' \
    > test.out 2>&1
eval_tap $? 25 'AdminCreateGroup' test.out

#- 26 SingleAdminGetGroup
./ng net.accelbyte.sdk.cli.Main ugc singleAdminGetGroup \
    --groupId 'SveF7ujA' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 26 'SingleAdminGetGroup' test.out

#- 27 SingleAdminUpdateGroup
./ng net.accelbyte.sdk.cli.Main ugc singleAdminUpdateGroup \
    --groupId 'ujALHdBE' \
    --namespace "$AB_NAMESPACE" \
    --body '{"contents": ["y5c3jXuL", "HlFIfETu", "jBxTksZo"], "name": "QKs0yZW7"}' \
    > test.out 2>&1
eval_tap $? 27 'SingleAdminUpdateGroup' test.out

#- 28 SingleAdminDeleteGroup
./ng net.accelbyte.sdk.cli.Main ugc singleAdminDeleteGroup \
    --groupId 'HjVB7zkc' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 28 'SingleAdminDeleteGroup' test.out

#- 29 SingleAdminGetGroupContents
./ng net.accelbyte.sdk.cli.Main ugc singleAdminGetGroupContents \
    --groupId '7ayuDYiU' \
    --namespace "$AB_NAMESPACE" \
    --limit '84' \
    --offset '17' \
    > test.out 2>&1
eval_tap $? 29 'SingleAdminGetGroupContents' test.out

#- 30 AdminGetTag
./ng net.accelbyte.sdk.cli.Main ugc adminGetTag \
    --namespace "$AB_NAMESPACE" \
    --limit '77' \
    --offset '77' \
    > test.out 2>&1
eval_tap $? 30 'AdminGetTag' test.out

#- 31 AdminCreateTag
./ng net.accelbyte.sdk.cli.Main ugc adminCreateTag \
    --namespace "$AB_NAMESPACE" \
    --body '{"tag": "vV5yXne8"}' \
    > test.out 2>&1
eval_tap $? 31 'AdminCreateTag' test.out

#- 32 AdminUpdateTag
./ng net.accelbyte.sdk.cli.Main ugc adminUpdateTag \
    --namespace "$AB_NAMESPACE" \
    --tagId 'kAnt56u8' \
    --body '{"tag": "jI1PAXFf"}' \
    > test.out 2>&1
eval_tap $? 32 'AdminUpdateTag' test.out

#- 33 AdminDeleteTag
./ng net.accelbyte.sdk.cli.Main ugc adminDeleteTag \
    --namespace "$AB_NAMESPACE" \
    --tagId 'H7p267ZF' \
    > test.out 2>&1
eval_tap $? 33 'AdminDeleteTag' test.out

#- 34 AdminGetType
./ng net.accelbyte.sdk.cli.Main ugc adminGetType \
    --namespace "$AB_NAMESPACE" \
    --limit '75' \
    --offset '41' \
    > test.out 2>&1
eval_tap $? 34 'AdminGetType' test.out

#- 35 AdminCreateType
./ng net.accelbyte.sdk.cli.Main ugc adminCreateType \
    --namespace "$AB_NAMESPACE" \
    --body '{"subtype": ["4JorIJ6j", "D1Fy7bDu", "xSsUGJkz"], "type": "SflzMCZ7"}' \
    > test.out 2>&1
eval_tap $? 35 'AdminCreateType' test.out

#- 36 AdminUpdateType
./ng net.accelbyte.sdk.cli.Main ugc adminUpdateType \
    --namespace "$AB_NAMESPACE" \
    --typeId 'yzBveJJ5' \
    --body '{"subtype": ["6sccns7L", "dlIEuR2S", "4rQlNQhG"], "type": "c5PAA333"}' \
    > test.out 2>&1
eval_tap $? 36 'AdminUpdateType' test.out

#- 37 AdminDeleteType
./ng net.accelbyte.sdk.cli.Main ugc adminDeleteType \
    --namespace "$AB_NAMESPACE" \
    --typeId 'MjlQgPXT' \
    > test.out 2>&1
eval_tap $? 37 'AdminDeleteType' test.out

#- 38 AdminGetChannel
./ng net.accelbyte.sdk.cli.Main ugc adminGetChannel \
    --namespace "$AB_NAMESPACE" \
    --userId 'GGGh1oLf' \
    --limit '93' \
    --name 'jDZlHIZE' \
    --offset '93' \
    > test.out 2>&1
eval_tap $? 38 'AdminGetChannel' test.out

#- 39 AdminDeleteAllUserChannels
./ng net.accelbyte.sdk.cli.Main ugc adminDeleteAllUserChannels \
    --namespace "$AB_NAMESPACE" \
    --userId 'EYj3TffV' \
    > test.out 2>&1
eval_tap $? 39 'AdminDeleteAllUserChannels' test.out

#- 40 AdminUpdateChannel
./ng net.accelbyte.sdk.cli.Main ugc adminUpdateChannel \
    --channelId 'fBU9o4t5' \
    --namespace "$AB_NAMESPACE" \
    --userId 'DXLqXHMq' \
    --body '{"name": "M0xTEMEe"}' \
    > test.out 2>&1
eval_tap $? 40 'AdminUpdateChannel' test.out

#- 41 AdminDeleteChannel
./ng net.accelbyte.sdk.cli.Main ugc adminDeleteChannel \
    --channelId 'hBZhwiwP' \
    --namespace "$AB_NAMESPACE" \
    --userId 'ynkWH9LG' \
    > test.out 2>&1
eval_tap $? 41 'AdminDeleteChannel' test.out

#- 42 AdminUpdateContentS3ByShareCode
./ng net.accelbyte.sdk.cli.Main ugc adminUpdateContentS3ByShareCode \
    --channelId 'UI8CC6IK' \
    --namespace "$AB_NAMESPACE" \
    --shareCode 'zkwOgamA' \
    --userId '5ybIZjt0' \
    --body '{"contentType": "L0rI2hEq", "customAttributes": {"zEJL1Hey": {}, "3Nyi2bx1": {}, "usKz8Ahv": {}}, "fileExtension": "H9oIzsok", "name": "6v3UAmTl", "payload": "glyOwrLr", "preview": "PbZKvXVF", "previewMetadata": {"previewContentType": "08nByMKx", "previewFileExtension": "Sr3w7xp6"}, "shareCode": "yoAjEk8U", "subType": "Pzt4ET8V", "tags": ["NDaVa2kY", "BNRPoW4X", "D2w4LoAb"], "type": "mJhLUDmJ", "updateContentFile": true}' \
    > test.out 2>&1
eval_tap $? 42 'AdminUpdateContentS3ByShareCode' test.out

#- 43 AdminUpdateContentS3
./ng net.accelbyte.sdk.cli.Main ugc adminUpdateContentS3 \
    --channelId 'zSRTr1Jn' \
    --contentId 'Sil3dmy8' \
    --namespace "$AB_NAMESPACE" \
    --userId '8hVvQfsK' \
    --body '{"contentType": "ERFp0Moz", "customAttributes": {"Aw1QBHDQ": {}, "OxVc9gey": {}, "JPa45udW": {}}, "fileExtension": "5Nks95ll", "name": "klbcc3fY", "payload": "dxrPgVH5", "preview": "g31mqgTb", "previewMetadata": {"previewContentType": "tpbUSL96", "previewFileExtension": "QWrJYTdc"}, "shareCode": "jGCvbYrZ", "subType": "VwdQXbP2", "tags": ["n8hsE0kb", "9vpGFNFI", "x3d9TstG"], "type": "G0R7btnN", "updateContentFile": false}' \
    > test.out 2>&1
eval_tap $? 43 'AdminUpdateContentS3' test.out

#- 44 DeleteContentByShareCode
./ng net.accelbyte.sdk.cli.Main ugc deleteContentByShareCode \
    --channelId 'ygxAU0Ge' \
    --namespace "$AB_NAMESPACE" \
    --shareCode 'Z4jVSjfC' \
    --userId '63xAgBSn' \
    > test.out 2>&1
eval_tap $? 44 'DeleteContentByShareCode' test.out

#- 45 AdminUpdateContentDirect
eval_tap 0 45 'AdminUpdateContentDirect # SKIP deprecated' test.out

#- 46 AdminDeleteContent
./ng net.accelbyte.sdk.cli.Main ugc adminDeleteContent \
    --channelId 'iuFXmfmE' \
    --contentId 'GkVhV9wX' \
    --namespace "$AB_NAMESPACE" \
    --userId 'Bj9it175' \
    > test.out 2>&1
eval_tap $? 46 'AdminDeleteContent' test.out

#- 47 AdminGetContent
./ng net.accelbyte.sdk.cli.Main ugc adminGetContent \
    --namespace "$AB_NAMESPACE" \
    --userId 'qX0LDyHz' \
    --limit '20' \
    --offset '84' \
    > test.out 2>&1
eval_tap $? 47 'AdminGetContent' test.out

#- 48 AdminDeleteAllUserContents
./ng net.accelbyte.sdk.cli.Main ugc adminDeleteAllUserContents \
    --namespace "$AB_NAMESPACE" \
    --userId 'xH2OPCXT' \
    > test.out 2>&1
eval_tap $? 48 'AdminDeleteAllUserContents' test.out

#- 49 AdminHideUserContent
./ng net.accelbyte.sdk.cli.Main ugc adminHideUserContent \
    --contentId 'IYStMdtc' \
    --namespace "$AB_NAMESPACE" \
    --userId 'd6K86YD1' \
    --body '{"isHidden": true}' \
    > test.out 2>&1
eval_tap $? 49 'AdminHideUserContent' test.out

#- 50 AdminGetAllGroups
./ng net.accelbyte.sdk.cli.Main ugc adminGetAllGroups \
    --namespace "$AB_NAMESPACE" \
    --userId '1skP6eMt' \
    --limit '32' \
    --offset '31' \
    > test.out 2>&1
eval_tap $? 50 'AdminGetAllGroups' test.out

#- 51 AdminDeleteAllUserGroup
./ng net.accelbyte.sdk.cli.Main ugc adminDeleteAllUserGroup \
    --namespace "$AB_NAMESPACE" \
    --userId '4gBbS8O6' \
    > test.out 2>&1
eval_tap $? 51 'AdminDeleteAllUserGroup' test.out

#- 52 AdminGetGroup
./ng net.accelbyte.sdk.cli.Main ugc adminGetGroup \
    --groupId 'LdvREG2L' \
    --namespace "$AB_NAMESPACE" \
    --userId 'fzq7a5ib' \
    > test.out 2>&1
eval_tap $? 52 'AdminGetGroup' test.out

#- 53 AdminUpdateGroup
./ng net.accelbyte.sdk.cli.Main ugc adminUpdateGroup \
    --groupId 'SSA1cPT0' \
    --namespace "$AB_NAMESPACE" \
    --userId 'RWE298dm' \
    --body '{"contents": ["rpfvhAiK", "XillAlOJ", "6G05ZAZ6"], "name": "wEXP7RVo"}' \
    > test.out 2>&1
eval_tap $? 53 'AdminUpdateGroup' test.out

#- 54 AdminDeleteGroup
./ng net.accelbyte.sdk.cli.Main ugc adminDeleteGroup \
    --groupId 'XlHpYSxy' \
    --namespace "$AB_NAMESPACE" \
    --userId 'Ufq3NCtx' \
    > test.out 2>&1
eval_tap $? 54 'AdminDeleteGroup' test.out

#- 55 AdminGetGroupContents
./ng net.accelbyte.sdk.cli.Main ugc adminGetGroupContents \
    --groupId 'NZ9RibKz' \
    --namespace "$AB_NAMESPACE" \
    --userId 'LhGw91SI' \
    --limit '83' \
    --offset '98' \
    > test.out 2>&1
eval_tap $? 55 'AdminGetGroupContents' test.out

#- 56 AdminDeleteAllUserStates
./ng net.accelbyte.sdk.cli.Main ugc adminDeleteAllUserStates \
    --namespace "$AB_NAMESPACE" \
    --userId 'otjhMBoW' \
    > test.out 2>&1
eval_tap $? 56 'AdminDeleteAllUserStates' test.out

#- 57 SearchChannelSpecificContent
./ng net.accelbyte.sdk.cli.Main ugc searchChannelSpecificContent \
    --channelId 'vJHWBwNg' \
    --namespace "$AB_NAMESPACE" \
    --creator 'Eckj0FAB' \
    --ishidden 'ZEUXhOUe' \
    --isofficial 'pO4pxR1g' \
    --limit '49' \
    --name 'GaEmVmin' \
    --offset '68' \
    --orderby '5Z4AyMWZ' \
    --sortby 'q0TeIpPM' \
    --subtype 'CgXxjDMV' \
    --tags 'uWkAjNHh,5ASyDb2t,Jhi2fOPZ' \
    --type '6BxRj9nw' \
    --userId 'raErW6jd' \
    > test.out 2>&1
eval_tap $? 57 'SearchChannelSpecificContent' test.out

#- 58 PublicSearchContent
./ng net.accelbyte.sdk.cli.Main ugc publicSearchContent \
    --namespace "$AB_NAMESPACE" \
    --creator 'iFdDrzbb' \
    --ishidden 'OTcgBeey' \
    --isofficial 'W6u5scQy' \
    --limit '62' \
    --name 'tzEpse8i' \
    --offset '30' \
    --orderby 'w7pWTvqA' \
    --sortby 'tqVwRPB9' \
    --subtype 'zAr5ze9i' \
    --tags 'umMUTPSn,3cGBOToF,g7GKtGxH' \
    --type 'WYUsoAFw' \
    --userId 'DFcicCz1' \
    > test.out 2>&1
eval_tap $? 58 'PublicSearchContent' test.out

#- 59 PublicGetContentBulk
./ng net.accelbyte.sdk.cli.Main ugc publicGetContentBulk \
    --namespace "$AB_NAMESPACE" \
    --body '{"contentIds": ["Nvu0hJ5G", "vZ804Je4", "xzpm54cN"]}' \
    > test.out 2>&1
eval_tap $? 59 'PublicGetContentBulk' test.out

#- 60 GetFollowedContent
./ng net.accelbyte.sdk.cli.Main ugc getFollowedContent \
    --namespace "$AB_NAMESPACE" \
    --limit '96' \
    --offset '69' \
    > test.out 2>&1
eval_tap $? 60 'GetFollowedContent' test.out

#- 61 GetLikedContent
./ng net.accelbyte.sdk.cli.Main ugc getLikedContent \
    --namespace "$AB_NAMESPACE" \
    --isofficial  \
    --limit '93' \
    --name 'wFtr6y4C' \
    --offset '88' \
    --orderby 'HyaK62ZO' \
    --sortby 'WohZFCqA' \
    --subtype 'eaSnZxgr' \
    --tags 'ctcR1xdh,GWUGrBaZ,Fu2RhEi5' \
    --type 'yFJ1AmKJ' \
    > test.out 2>&1
eval_tap $? 61 'GetLikedContent' test.out

#- 62 PublicGetContentBulkByShareCodes
./ng net.accelbyte.sdk.cli.Main ugc publicGetContentBulkByShareCodes \
    --namespace "$AB_NAMESPACE" \
    --body '{"shareCodes": ["KdiylVVR", "shYEqo3V", "HUC134Xv"]}' \
    > test.out 2>&1
eval_tap $? 62 'PublicGetContentBulkByShareCodes' test.out

#- 63 PublicDownloadContentByShareCode
./ng net.accelbyte.sdk.cli.Main ugc publicDownloadContentByShareCode \
    --namespace "$AB_NAMESPACE" \
    --shareCode 'E26NEeEd' \
    > test.out 2>&1
eval_tap $? 63 'PublicDownloadContentByShareCode' test.out

#- 64 PublicDownloadContentByContentID
./ng net.accelbyte.sdk.cli.Main ugc publicDownloadContentByContentID \
    --contentId 'ngxOYNLx' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 64 'PublicDownloadContentByContentID' test.out

#- 65 AddDownloadCount
./ng net.accelbyte.sdk.cli.Main ugc addDownloadCount \
    --contentId '4KnsdQjE' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 65 'AddDownloadCount' test.out

#- 66 UpdateContentLikeStatus
./ng net.accelbyte.sdk.cli.Main ugc updateContentLikeStatus \
    --contentId 'xaMWlDvN' \
    --namespace "$AB_NAMESPACE" \
    --body '{"likeStatus": false}' \
    > test.out 2>&1
eval_tap $? 66 'UpdateContentLikeStatus' test.out

#- 67 PublicDownloadContentPreview
./ng net.accelbyte.sdk.cli.Main ugc publicDownloadContentPreview \
    --contentId 'HY2MDSbi' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 67 'PublicDownloadContentPreview' test.out

#- 68 GetTag
./ng net.accelbyte.sdk.cli.Main ugc getTag \
    --namespace "$AB_NAMESPACE" \
    --limit '36' \
    --offset '67' \
    > test.out 2>&1
eval_tap $? 68 'GetTag' test.out

#- 69 GetType
./ng net.accelbyte.sdk.cli.Main ugc getType \
    --namespace "$AB_NAMESPACE" \
    --limit '81' \
    --offset '96' \
    > test.out 2>&1
eval_tap $? 69 'GetType' test.out

#- 70 PublicSearchCreator
./ng net.accelbyte.sdk.cli.Main ugc publicSearchCreator \
    --namespace "$AB_NAMESPACE" \
    --limit '89' \
    --offset '80' \
    --orderby 'dd7JJzhD' \
    --sortby 'lJN2uY5a' \
    > test.out 2>&1
eval_tap $? 70 'PublicSearchCreator' test.out

#- 71 GetFollowedUsers
./ng net.accelbyte.sdk.cli.Main ugc getFollowedUsers \
    --namespace "$AB_NAMESPACE" \
    --limit '36' \
    --offset '65' \
    > test.out 2>&1
eval_tap $? 71 'GetFollowedUsers' test.out

#- 72 PublicGetCreator
./ng net.accelbyte.sdk.cli.Main ugc publicGetCreator \
    --namespace "$AB_NAMESPACE" \
    --userId 'l8yEbLuC' \
    > test.out 2>&1
eval_tap $? 72 'PublicGetCreator' test.out

#- 73 GetChannels
./ng net.accelbyte.sdk.cli.Main ugc getChannels \
    --namespace "$AB_NAMESPACE" \
    --userId 'jcxWkQ7i' \
    --limit '33' \
    --name 'lyVKFHp4' \
    --offset '13' \
    > test.out 2>&1
eval_tap $? 73 'GetChannels' test.out

#- 74 PublicCreateChannel
./ng net.accelbyte.sdk.cli.Main ugc publicCreateChannel \
    --namespace "$AB_NAMESPACE" \
    --userId '2xB05c2Q' \
    --body '{"name": "SPOtMgK5"}' \
    > test.out 2>&1
eval_tap $? 74 'PublicCreateChannel' test.out

#- 75 DeleteAllUserChannel
./ng net.accelbyte.sdk.cli.Main ugc deleteAllUserChannel \
    --namespace "$AB_NAMESPACE" \
    --userId '4kWE4jNf' \
    > test.out 2>&1
eval_tap $? 75 'DeleteAllUserChannel' test.out

#- 76 UpdateChannel
./ng net.accelbyte.sdk.cli.Main ugc updateChannel \
    --channelId 'niYRnVSf' \
    --namespace "$AB_NAMESPACE" \
    --userId '6dCIXV0j' \
    --body '{"name": "vByC0E6a"}' \
    > test.out 2>&1
eval_tap $? 76 'UpdateChannel' test.out

#- 77 DeleteChannel
./ng net.accelbyte.sdk.cli.Main ugc deleteChannel \
    --channelId '5TfAre6T' \
    --namespace "$AB_NAMESPACE" \
    --userId 'hmWkobba' \
    > test.out 2>&1
eval_tap $? 77 'DeleteChannel' test.out

#- 78 CreateContentDirect
eval_tap 0 78 'CreateContentDirect # SKIP deprecated' test.out

#- 79 CreateContentS3
./ng net.accelbyte.sdk.cli.Main ugc createContentS3 \
    --channelId 'lWTylafL' \
    --namespace "$AB_NAMESPACE" \
    --userId 'lAtrCbLX' \
    --body '{"contentType": "q3wp3Vpp", "customAttributes": {"KYvW3SKc": {}, "O2xaFPGy": {}, "3nZUIAYh": {}}, "fileExtension": "d2dycP6l", "name": "LkIU6I5y", "preview": "TtdgqfhY", "previewMetadata": {"previewContentType": "QKVTHZMc", "previewFileExtension": "JVwl461E"}, "subType": "clElCSED", "tags": ["Hz8NZRbw", "tdYDdPld", "1K5IFlmu"], "type": "kKpTLwAo"}' \
    > test.out 2>&1
eval_tap $? 79 'CreateContentS3' test.out

#- 80 PublicUpdateContentByShareCode
./ng net.accelbyte.sdk.cli.Main ugc publicUpdateContentByShareCode \
    --channelId 'pVgxT5Zx' \
    --namespace "$AB_NAMESPACE" \
    --shareCode 'EfAtgrJl' \
    --userId '2cpg2PaF' \
    --body '{"contentType": "mqrQbCNF", "customAttributes": {"HPZyox1V": {}, "u5cW10kF": {}, "M3IXzHQm": {}}, "fileExtension": "ahcD14Rt", "name": "0c5fqJ6f", "payload": "x3WjD4SY", "preview": "3721ke5g", "previewMetadata": {"previewContentType": "AGEOIgDv", "previewFileExtension": "xfwIgMTb"}, "subType": "fnBPvSXF", "tags": ["kQAthJdK", "LDWRhBrz", "3Pm3JscI"], "type": "NdgrcbHX", "updateContentFile": true}' \
    > test.out 2>&1
eval_tap $? 80 'PublicUpdateContentByShareCode' test.out

#- 81 UpdateContentS3
./ng net.accelbyte.sdk.cli.Main ugc updateContentS3 \
    --channelId '9L7Q8CqL' \
    --contentId 'vnpSR5ar' \
    --namespace "$AB_NAMESPACE" \
    --userId 'fWuKyAxY' \
    --body '{"contentType": "K6DC5HQu", "customAttributes": {"bmzCUUGQ": {}, "09rVW6uC": {}, "LueC7QZa": {}}, "fileExtension": "E32kIeqC", "name": "O1k1OEUH", "payload": "wGnTpWei", "preview": "SHjT6wYW", "previewMetadata": {"previewContentType": "NY7Xh6OW", "previewFileExtension": "tzid8NC8"}, "subType": "9g4MVG7X", "tags": ["mxf6kmAI", "4yqbNPcY", "tH8mqg8S"], "type": "VcKnvvC4", "updateContentFile": false}' \
    > test.out 2>&1
eval_tap $? 81 'UpdateContentS3' test.out

#- 82 PublicDeleteContentByShareCode
./ng net.accelbyte.sdk.cli.Main ugc publicDeleteContentByShareCode \
    --channelId '6oI4M1ji' \
    --namespace "$AB_NAMESPACE" \
    --shareCode 'qBGVMVcp' \
    --userId 'RKJ8iUz6' \
    > test.out 2>&1
eval_tap $? 82 'PublicDeleteContentByShareCode' test.out

#- 83 UpdateContentDirect
eval_tap 0 83 'UpdateContentDirect # SKIP deprecated' test.out

#- 84 DeleteContent
./ng net.accelbyte.sdk.cli.Main ugc deleteContent \
    --channelId 'o9IIMC7q' \
    --contentId 'lf54t4i1' \
    --namespace "$AB_NAMESPACE" \
    --userId 'lYCXott3' \
    > test.out 2>&1
eval_tap $? 84 'DeleteContent' test.out

#- 85 UpdateContentShareCode
./ng net.accelbyte.sdk.cli.Main ugc updateContentShareCode \
    --channelId 'H0DIkbPx' \
    --contentId 'DQR51EDo' \
    --namespace "$AB_NAMESPACE" \
    --userId 'gnig5VGB' \
    --body '{"shareCode": "hDp9Hye7"}' \
    > test.out 2>&1
eval_tap $? 85 'UpdateContentShareCode' test.out

#- 86 PublicGetUserContent
./ng net.accelbyte.sdk.cli.Main ugc publicGetUserContent \
    --namespace "$AB_NAMESPACE" \
    --userId '5QuzkQmu' \
    --limit '40' \
    --offset '66' \
    > test.out 2>&1
eval_tap $? 86 'PublicGetUserContent' test.out

#- 87 DeleteAllUserContents
./ng net.accelbyte.sdk.cli.Main ugc deleteAllUserContents \
    --namespace "$AB_NAMESPACE" \
    --userId 'kWAIdxSE' \
    > test.out 2>&1
eval_tap $? 87 'DeleteAllUserContents' test.out

#- 88 UpdateScreenshots
./ng net.accelbyte.sdk.cli.Main ugc updateScreenshots \
    --contentId '4BJi80zB' \
    --namespace "$AB_NAMESPACE" \
    --userId 'y7DM0NRP' \
    --body '{"screenshots": [{"description": "sIW0PBpj", "screenshotId": "pDoIa9R6"}, {"description": "883rPQhb", "screenshotId": "PM5LWTgC"}, {"description": "3G6Zpt96", "screenshotId": "5QyNZOIk"}]}' \
    > test.out 2>&1
eval_tap $? 88 'UpdateScreenshots' test.out

#- 89 UploadContentScreenshot
./ng net.accelbyte.sdk.cli.Main ugc uploadContentScreenshot \
    --contentId 'PHm6UCCI' \
    --namespace "$AB_NAMESPACE" \
    --userId 'XB8IeKWY' \
    --body '{"screenshots": [{"contentType": "81iQyTVX", "description": "0IWZGr7f", "fileExtension": "jfif"}, {"contentType": "AS0MJueE", "description": "xbtYud5n", "fileExtension": "jpg"}, {"contentType": "9IvIW7GU", "description": "Zpy6UlLw", "fileExtension": "png"}]}' \
    > test.out 2>&1
eval_tap $? 89 'UploadContentScreenshot' test.out

#- 90 DeleteContentScreenshot
./ng net.accelbyte.sdk.cli.Main ugc deleteContentScreenshot \
    --contentId 'VnxboNbM' \
    --namespace "$AB_NAMESPACE" \
    --screenshotId 'zheGeuHf' \
    --userId 'iN1LH9hS' \
    > test.out 2>&1
eval_tap $? 90 'DeleteContentScreenshot' test.out

#- 91 UpdateUserFollowStatus
./ng net.accelbyte.sdk.cli.Main ugc updateUserFollowStatus \
    --namespace "$AB_NAMESPACE" \
    --userId 'AGAydO0l' \
    --body '{"followStatus": true}' \
    > test.out 2>&1
eval_tap $? 91 'UpdateUserFollowStatus' test.out

#- 92 GetPublicFollowers
./ng net.accelbyte.sdk.cli.Main ugc getPublicFollowers \
    --namespace "$AB_NAMESPACE" \
    --userId 'nljL3Xcf' \
    --limit '20' \
    --offset '55' \
    > test.out 2>&1
eval_tap $? 92 'GetPublicFollowers' test.out

#- 93 GetPublicFollowing
./ng net.accelbyte.sdk.cli.Main ugc getPublicFollowing \
    --namespace "$AB_NAMESPACE" \
    --userId '9IRQFIP6' \
    --limit '52' \
    --offset '90' \
    > test.out 2>&1
eval_tap $? 93 'GetPublicFollowing' test.out

#- 94 GetGroups
./ng net.accelbyte.sdk.cli.Main ugc getGroups \
    --namespace "$AB_NAMESPACE" \
    --userId 'tQqgfnB3' \
    --limit '20' \
    --offset '57' \
    > test.out 2>&1
eval_tap $? 94 'GetGroups' test.out

#- 95 CreateGroup
./ng net.accelbyte.sdk.cli.Main ugc createGroup \
    --namespace "$AB_NAMESPACE" \
    --userId 'kcHDuKvT' \
    --body '{"contents": ["bOubQCrb", "qNgluVAe", "d7wcKw4C"], "name": "mu2FC1dn"}' \
    > test.out 2>&1
eval_tap $? 95 'CreateGroup' test.out

#- 96 DeleteAllUserGroup
./ng net.accelbyte.sdk.cli.Main ugc deleteAllUserGroup \
    --namespace "$AB_NAMESPACE" \
    --userId 'Y22oiXNB' \
    > test.out 2>&1
eval_tap $? 96 'DeleteAllUserGroup' test.out

#- 97 GetGroup
./ng net.accelbyte.sdk.cli.Main ugc getGroup \
    --groupId 'MjyBGNH9' \
    --namespace "$AB_NAMESPACE" \
    --userId 'fanYsPID' \
    > test.out 2>&1
eval_tap $? 97 'GetGroup' test.out

#- 98 UpdateGroup
./ng net.accelbyte.sdk.cli.Main ugc updateGroup \
    --groupId 'urRtpvh1' \
    --namespace "$AB_NAMESPACE" \
    --userId 'MiyydOU8' \
    --body '{"contents": ["enezWLey", "gTY7fTF3", "0kOunqbq"], "name": "GGXAkfFO"}' \
    > test.out 2>&1
eval_tap $? 98 'UpdateGroup' test.out

#- 99 DeleteGroup
./ng net.accelbyte.sdk.cli.Main ugc deleteGroup \
    --groupId 'cpaIJncs' \
    --namespace "$AB_NAMESPACE" \
    --userId '9KmRcmf0' \
    > test.out 2>&1
eval_tap $? 99 'DeleteGroup' test.out

#- 100 GetGroupContent
./ng net.accelbyte.sdk.cli.Main ugc getGroupContent \
    --groupId 'ERlnmtDm' \
    --namespace "$AB_NAMESPACE" \
    --userId 'ObxjGmAI' \
    --limit '78' \
    --offset '23' \
    > test.out 2>&1
eval_tap $? 100 'GetGroupContent' test.out

#- 101 DeleteAllUserStates
./ng net.accelbyte.sdk.cli.Main ugc deleteAllUserStates \
    --namespace "$AB_NAMESPACE" \
    --userId 'YpZJFScG' \
    > test.out 2>&1
eval_tap $? 101 'DeleteAllUserStates' test.out

#- 102 AdminGetContentByChannelIDV2
./ng net.accelbyte.sdk.cli.Main ugc adminGetContentByChannelIDV2 \
    --channelId 'Z1E3FdY0' \
    --namespace "$AB_NAMESPACE" \
    --limit '99' \
    --name 'Sfo61Fmu' \
    --offset '71' \
    --sortBy 'GYwiV7T6' \
    > test.out 2>&1
eval_tap $? 102 'AdminGetContentByChannelIDV2' test.out

#- 103 AdminCreateContentV2
./ng net.accelbyte.sdk.cli.Main ugc adminCreateContentV2 \
    --channelId 'nDgBmkY0' \
    --namespace "$AB_NAMESPACE" \
    --body '{"contentType": "whATS17V", "customAttributes": {"p0InPQBE": {}, "dZpoVXlo": {}, "gVmbkDzU": {}}, "fileExtension": "UXdr6Oby", "name": "yRCyJnra", "shareCode": "Pd97DvvU", "subType": "cm3M3cZS", "tags": ["3TduN1wD", "bdlKhBxo", "3gCFfzlb"], "type": "rxH3BieL"}' \
    > test.out 2>&1
eval_tap $? 103 'AdminCreateContentV2' test.out

#- 104 AdminDeleteOfficialContentV2
./ng net.accelbyte.sdk.cli.Main ugc adminDeleteOfficialContentV2 \
    --channelId 'x90MyROX' \
    --contentId '3i8YJQvl' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 104 'AdminDeleteOfficialContentV2' test.out

#- 105 AdminUpdateOfficialContentV2
./ng net.accelbyte.sdk.cli.Main ugc adminUpdateOfficialContentV2 \
    --channelId 'sPzcJhmB' \
    --contentId 'W7UAOYJS' \
    --namespace "$AB_NAMESPACE" \
    --body '{"customAttributes": {"vsgV468Z": {}, "VfxlTRst": {}, "ZvUjhhHV": {}}, "name": "GThV0M1e", "shareCode": "eJaQHyBl", "subType": "RzISEEWE", "tags": ["a1EGf8q6", "bzDsxW9l", "IHr2P9c8"], "type": "m40I9js9"}' \
    > test.out 2>&1
eval_tap $? 105 'AdminUpdateOfficialContentV2' test.out

#- 106 AdminCopyContent
./ng net.accelbyte.sdk.cli.Main ugc adminCopyContent \
    --channelId 'd9I2ZOSI' \
    --contentId '312NNNdx' \
    --namespace "$AB_NAMESPACE" \
    --body '{"customAttributes": {"QE0BlLcB": {}, "O4Yp6cN7": {}, "dgvxsOCE": {}}, "name": "FYBHh1yD", "subType": "ry69Log5", "tags": ["u9AhhN4M", "X4z8XaBE", "XjPhsgnP"], "targetChannelId": "CubA36g2", "type": "vamzXspJ"}' \
    > test.out 2>&1
eval_tap $? 106 'AdminCopyContent' test.out

#- 107 AdminUpdateOfficialContentFileLocation
./ng net.accelbyte.sdk.cli.Main ugc adminUpdateOfficialContentFileLocation \
    --channelId 'UxY4QyRg' \
    --contentId 'Ka2kBD7h' \
    --namespace "$AB_NAMESPACE" \
    --body '{"fileExtension": "L4BqstYU", "fileLocation": "6zTDgpFJ"}' \
    > test.out 2>&1
eval_tap $? 107 'AdminUpdateOfficialContentFileLocation' test.out

#- 108 AdminGenerateOfficialContentUploadURLV2
./ng net.accelbyte.sdk.cli.Main ugc adminGenerateOfficialContentUploadURLV2 \
    --channelId '1p58wFuO' \
    --contentId 'A4VSgDf6' \
    --namespace "$AB_NAMESPACE" \
    --body '{"contentType": "4aww5dex", "fileExtension": "RJcNK5d4"}' \
    > test.out 2>&1
eval_tap $? 108 'AdminGenerateOfficialContentUploadURLV2' test.out

#- 109 AdminGetConfigs
./ng net.accelbyte.sdk.cli.Main ugc adminGetConfigs \
    --namespace "$AB_NAMESPACE" \
    --limit '76' \
    --offset '59' \
    > test.out 2>&1
eval_tap $? 109 'AdminGetConfigs' test.out

#- 110 AdminUpdateConfig
./ng net.accelbyte.sdk.cli.Main ugc adminUpdateConfig \
    --key '9h2zOvSf' \
    --namespace "$AB_NAMESPACE" \
    --body '{"value": "WcYWQYYv"}' \
    > test.out 2>&1
eval_tap $? 110 'AdminUpdateConfig' test.out

#- 111 AdminListContentV2
./ng net.accelbyte.sdk.cli.Main ugc adminListContentV2 \
    --namespace "$AB_NAMESPACE" \
    --isOfficial  \
    --limit '47' \
    --name 'WK21Ijiq' \
    --offset '69' \
    --sortBy 'rRTP6IbT' \
    --subType '44B6sYS1' \
    --tags 'pk2jZWPC,vYakVAKS,op20Sk4w' \
    --type 'aoCriykF' \
    > test.out 2>&1
eval_tap $? 111 'AdminListContentV2' test.out

#- 112 AdminBulkGetContentByIDsV2
./ng net.accelbyte.sdk.cli.Main ugc adminBulkGetContentByIDsV2 \
    --namespace "$AB_NAMESPACE" \
    --body '{"contentIds": ["PJNkRQpL", "IWtXr8uD", "xLF8L28N"]}' \
    > test.out 2>&1
eval_tap $? 112 'AdminBulkGetContentByIDsV2' test.out

#- 113 AdminGetContentBulkByShareCodesV2
./ng net.accelbyte.sdk.cli.Main ugc adminGetContentBulkByShareCodesV2 \
    --namespace "$AB_NAMESPACE" \
    --body '{"shareCodes": ["JYZmPcDP", "Vuxh1UY7", "PSJGyT15"]}' \
    > test.out 2>&1
eval_tap $? 113 'AdminGetContentBulkByShareCodesV2' test.out

#- 114 AdminGetContentByShareCodeV2
./ng net.accelbyte.sdk.cli.Main ugc adminGetContentByShareCodeV2 \
    --namespace "$AB_NAMESPACE" \
    --shareCode 'Qr8ARcc0' \
    > test.out 2>&1
eval_tap $? 114 'AdminGetContentByShareCodeV2' test.out

#- 115 AdminGetContentByContentIDV2
./ng net.accelbyte.sdk.cli.Main ugc adminGetContentByContentIDV2 \
    --contentId 'moNxSWNu' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 115 'AdminGetContentByContentIDV2' test.out

#- 116 RollbackContentVersionV2
./ng net.accelbyte.sdk.cli.Main ugc rollbackContentVersionV2 \
    --contentId '3sox05Yl' \
    --namespace "$AB_NAMESPACE" \
    --versionId 'CZDmso1l' \
    > test.out 2>&1
eval_tap $? 116 'RollbackContentVersionV2' test.out

#- 117 AdminUpdateScreenshotsV2
./ng net.accelbyte.sdk.cli.Main ugc adminUpdateScreenshotsV2 \
    --contentId 'Gh5zcpwu' \
    --namespace "$AB_NAMESPACE" \
    --body '{"screenshots": [{"description": "nInp5ZAT", "screenshotId": "Awbq60nW"}, {"description": "OIJi3x4O", "screenshotId": "Fz02RamE"}, {"description": "dEClIk91", "screenshotId": "hFZaESOO"}]}' \
    > test.out 2>&1
eval_tap $? 117 'AdminUpdateScreenshotsV2' test.out

#- 118 AdminUploadContentScreenshotV2
./ng net.accelbyte.sdk.cli.Main ugc adminUploadContentScreenshotV2 \
    --contentId '18lzmHYG' \
    --namespace "$AB_NAMESPACE" \
    --body '{"screenshots": [{"contentType": "3aOwSfTb", "description": "SAqUA9XB", "fileExtension": "png"}, {"contentType": "LZaWmeAf", "description": "wEoY5bfx", "fileExtension": "jfif"}, {"contentType": "3dxgjnPS", "description": "o6NA2yPQ", "fileExtension": "bmp"}]}' \
    > test.out 2>&1
eval_tap $? 118 'AdminUploadContentScreenshotV2' test.out

#- 119 AdminDeleteContentScreenshotV2
./ng net.accelbyte.sdk.cli.Main ugc adminDeleteContentScreenshotV2 \
    --contentId 'pKuym4ro' \
    --namespace "$AB_NAMESPACE" \
    --screenshotId 'YFcXpQCs' \
    > test.out 2>&1
eval_tap $? 119 'AdminDeleteContentScreenshotV2' test.out

#- 120 ListContentVersionsV2
./ng net.accelbyte.sdk.cli.Main ugc listContentVersionsV2 \
    --contentId 'VEbAC3qc' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 120 'ListContentVersionsV2' test.out

#- 121 AdminGetOfficialGroupContentsV2
./ng net.accelbyte.sdk.cli.Main ugc adminGetOfficialGroupContentsV2 \
    --groupId 'bPu6AGYR' \
    --namespace "$AB_NAMESPACE" \
    --limit '53' \
    --offset '24' \
    > test.out 2>&1
eval_tap $? 121 'AdminGetOfficialGroupContentsV2' test.out

#- 122 AdminListStagingContents
./ng net.accelbyte.sdk.cli.Main ugc adminListStagingContents \
    --namespace "$AB_NAMESPACE" \
    --limit '6' \
    --offset '55' \
    --sortBy 'p3D2tuix' \
    --status 'wvu5qca3' \
    > test.out 2>&1
eval_tap $? 122 'AdminListStagingContents' test.out

#- 123 AdminGetStagingContentByID
./ng net.accelbyte.sdk.cli.Main ugc adminGetStagingContentByID \
    --contentId 'vSGTplJX' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 123 'AdminGetStagingContentByID' test.out

#- 124 AdminApproveStagingContent
./ng net.accelbyte.sdk.cli.Main ugc adminApproveStagingContent \
    --contentId 'R1kBuL8l' \
    --namespace "$AB_NAMESPACE" \
    --body '{"approved": false, "note": "Ab7kswQC"}' \
    > test.out 2>&1
eval_tap $? 124 'AdminApproveStagingContent' test.out

#- 125 AdminUpdateContentByShareCodeV2
./ng net.accelbyte.sdk.cli.Main ugc adminUpdateContentByShareCodeV2 \
    --channelId 'mz4nVruW' \
    --namespace "$AB_NAMESPACE" \
    --shareCode 'VK0Xdnm6' \
    --userId 'DGYVXHyb' \
    --body '{"customAttributes": {"XWfiqibu": {}, "aSrlbywY": {}, "4Gb178R7": {}}, "name": "73aqmJtK", "shareCode": "5tkQLrJ1", "subType": "OVGywhin", "tags": ["JqJV6kTH", "2Uy8G3Nb", "C9LJelj4"], "type": "qxbtfYJa"}' \
    > test.out 2>&1
eval_tap $? 125 'AdminUpdateContentByShareCodeV2' test.out

#- 126 AdminDeleteContentByShareCodeV2
./ng net.accelbyte.sdk.cli.Main ugc adminDeleteContentByShareCodeV2 \
    --channelId 'c46fWe4X' \
    --namespace "$AB_NAMESPACE" \
    --shareCode 'zy37sDcs' \
    --userId 'eghTqejq' \
    > test.out 2>&1
eval_tap $? 126 'AdminDeleteContentByShareCodeV2' test.out

#- 127 AdminDeleteUserContentV2
./ng net.accelbyte.sdk.cli.Main ugc adminDeleteUserContentV2 \
    --channelId 'oQsjfJ4n' \
    --contentId 'UbC8g0o3' \
    --namespace "$AB_NAMESPACE" \
    --userId 'rSFTBBex' \
    > test.out 2>&1
eval_tap $? 127 'AdminDeleteUserContentV2' test.out

#- 128 AdminUpdateUserContentV2
./ng net.accelbyte.sdk.cli.Main ugc adminUpdateUserContentV2 \
    --channelId 'Jsl6ycXn' \
    --contentId '75dy2J4z' \
    --namespace "$AB_NAMESPACE" \
    --userId 'nBZtdFFZ' \
    --body '{"customAttributes": {"4V1iUExt": {}, "MLvJ3qIF": {}, "Am0a5SVJ": {}}, "name": "KPPMTuCp", "shareCode": "B0tmt3Cu", "subType": "JPa22LP4", "tags": ["5cJj1Thd", "Sz9Slygr", "lpppj91G"], "type": "blXLmotR"}' \
    > test.out 2>&1
eval_tap $? 128 'AdminUpdateUserContentV2' test.out

#- 129 AdminUpdateUserContentFileLocation
./ng net.accelbyte.sdk.cli.Main ugc adminUpdateUserContentFileLocation \
    --channelId 'jkABmA2Z' \
    --contentId 'bhGsdV2p' \
    --namespace "$AB_NAMESPACE" \
    --userId 'P7yDOL5H' \
    --body '{"fileExtension": "SPjZZpAW", "fileLocation": "iVkgKhIn"}' \
    > test.out 2>&1
eval_tap $? 129 'AdminUpdateUserContentFileLocation' test.out

#- 130 AdminGenerateUserContentUploadURLV2
./ng net.accelbyte.sdk.cli.Main ugc adminGenerateUserContentUploadURLV2 \
    --channelId 'nljkDXhM' \
    --contentId 'Pz9jmdig' \
    --namespace "$AB_NAMESPACE" \
    --userId '5ueyQkpB' \
    --body '{"contentType": "9NQl4wgi", "fileExtension": "IeyWkEl5"}' \
    > test.out 2>&1
eval_tap $? 130 'AdminGenerateUserContentUploadURLV2' test.out

#- 131 AdminGetContentByUserIDV2
./ng net.accelbyte.sdk.cli.Main ugc adminGetContentByUserIDV2 \
    --namespace "$AB_NAMESPACE" \
    --userId 'k5ARlmzL' \
    --limit '7' \
    --offset '70' \
    --sortBy '7kgT6AoA' \
    > test.out 2>&1
eval_tap $? 131 'AdminGetContentByUserIDV2' test.out

#- 132 AdminUpdateContentHideStatusV2
./ng net.accelbyte.sdk.cli.Main ugc adminUpdateContentHideStatusV2 \
    --contentId 'skqwiaPY' \
    --namespace "$AB_NAMESPACE" \
    --userId 'ptJmIzXF' \
    --body '{"isHidden": false}' \
    > test.out 2>&1
eval_tap $? 132 'AdminUpdateContentHideStatusV2' test.out

#- 133 AdminGetUserGroupContentsV2
./ng net.accelbyte.sdk.cli.Main ugc adminGetUserGroupContentsV2 \
    --groupId 'TmMhM2bt' \
    --namespace "$AB_NAMESPACE" \
    --userId 'ZIqEN5ZC' \
    --limit '98' \
    --offset '49' \
    > test.out 2>&1
eval_tap $? 133 'AdminGetUserGroupContentsV2' test.out

#- 134 AdminListUserStagingContents
./ng net.accelbyte.sdk.cli.Main ugc adminListUserStagingContents \
    --namespace "$AB_NAMESPACE" \
    --userId 'SOgLMrC0' \
    --limit '60' \
    --offset '85' \
    --sortBy 'XfAc3q8H' \
    --status 'k2B9E9LX' \
    > test.out 2>&1
eval_tap $? 134 'AdminListUserStagingContents' test.out

#- 135 PublicGetContentByChannelIDV2
./ng net.accelbyte.sdk.cli.Main ugc publicGetContentByChannelIDV2 \
    --channelId 'yp0rCA7A' \
    --namespace "$AB_NAMESPACE" \
    --limit '51' \
    --name 'qaTsw8Ni' \
    --offset '24' \
    --sortBy 'Euj4EFrN' \
    > test.out 2>&1
eval_tap $? 135 'PublicGetContentByChannelIDV2' test.out

#- 136 PublicListContentV2
./ng net.accelbyte.sdk.cli.Main ugc publicListContentV2 \
    --namespace "$AB_NAMESPACE" \
    --isOfficial  \
    --limit '61' \
    --name '4jBRoZVW' \
    --offset '47' \
    --sortBy 'Eu7OXQO7' \
    --subType 'EBYCdPRf' \
    --tags 'gf7myAZv,abadOqId,S3tcIji1' \
    --type 'JbC1ZgsE' \
    > test.out 2>&1
eval_tap $? 136 'PublicListContentV2' test.out

#- 137 PublicBulkGetContentByIDV2
./ng net.accelbyte.sdk.cli.Main ugc publicBulkGetContentByIDV2 \
    --namespace "$AB_NAMESPACE" \
    --body '{"contentIds": ["8eLjtfkg", "Dtpj1GMj", "nDp8gKK9"]}' \
    > test.out 2>&1
eval_tap $? 137 'PublicBulkGetContentByIDV2' test.out

#- 138 PublicGetContentBulkByShareCodesV2
./ng net.accelbyte.sdk.cli.Main ugc publicGetContentBulkByShareCodesV2 \
    --namespace "$AB_NAMESPACE" \
    --body '{"shareCodes": ["xr4Etixx", "QUkd8n2f", "ZMx3P8qX"]}' \
    > test.out 2>&1
eval_tap $? 138 'PublicGetContentBulkByShareCodesV2' test.out

#- 139 PublicGetContentByShareCodeV2
./ng net.accelbyte.sdk.cli.Main ugc publicGetContentByShareCodeV2 \
    --namespace "$AB_NAMESPACE" \
    --shareCode 'QgBCPtAG' \
    > test.out 2>&1
eval_tap $? 139 'PublicGetContentByShareCodeV2' test.out

#- 140 PublicGetContentByIDV2
./ng net.accelbyte.sdk.cli.Main ugc publicGetContentByIDV2 \
    --contentId 'nHNOQxdc' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 140 'PublicGetContentByIDV2' test.out

#- 141 PublicAddDownloadCountV2
./ng net.accelbyte.sdk.cli.Main ugc publicAddDownloadCountV2 \
    --contentId 'YhmjEGe6' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 141 'PublicAddDownloadCountV2' test.out

#- 142 PublicListContentDownloaderV2
./ng net.accelbyte.sdk.cli.Main ugc publicListContentDownloaderV2 \
    --contentId 'rkd32aBs' \
    --namespace "$AB_NAMESPACE" \
    --limit '10' \
    --offset '65' \
    --sortBy 'FkmMetfi' \
    --userId 'G2VlxHiL' \
    > test.out 2>&1
eval_tap $? 142 'PublicListContentDownloaderV2' test.out

#- 143 PublicListContentLikeV2
./ng net.accelbyte.sdk.cli.Main ugc publicListContentLikeV2 \
    --contentId 'sQTW0SFJ' \
    --namespace "$AB_NAMESPACE" \
    --limit '54' \
    --offset '42' \
    --sortBy 'Mtq6krsL' \
    > test.out 2>&1
eval_tap $? 143 'PublicListContentLikeV2' test.out

#- 144 UpdateContentLikeStatusV2
./ng net.accelbyte.sdk.cli.Main ugc updateContentLikeStatusV2 \
    --contentId 'UMSm3e8P' \
    --namespace "$AB_NAMESPACE" \
    --body '{"likeStatus": true}' \
    > test.out 2>&1
eval_tap $? 144 'UpdateContentLikeStatusV2' test.out

#- 145 PublicCreateContentV2
./ng net.accelbyte.sdk.cli.Main ugc publicCreateContentV2 \
    --channelId 'OEaIvpJf' \
    --namespace "$AB_NAMESPACE" \
    --userId '6OrhGC8U' \
    --body '{"contentType": "x6qWNjuo", "customAttributes": {"5ZmkEfJz": {}, "LYjGHDYx": {}, "TbCMIhRR": {}}, "fileExtension": "OoY9xCjB", "name": "acUBWmq3", "subType": "PD4VBMH6", "tags": ["qPXKlK18", "rmXtEeKj", "w0EuEC61"], "type": "Q08qZtxR"}' \
    > test.out 2>&1
eval_tap $? 145 'PublicCreateContentV2' test.out

#- 146 PublicUpdateContentByShareCodeV2
./ng net.accelbyte.sdk.cli.Main ugc publicUpdateContentByShareCodeV2 \
    --channelId 'BmqV8Pj0' \
    --namespace "$AB_NAMESPACE" \
    --shareCode 'CGi3WHkT' \
    --userId 'xuvfHKyN' \
    --body '{"customAttributes": {"HmcAVR2c": {}, "S2CCZ1MG": {}, "ER5Yx72h": {}}, "name": "fn6GnykH", "subType": "Bcos3wlY", "tags": ["w264Bmoh", "x6cdmUVL", "gTIvw6iV"], "type": "jYWLnfRS"}' \
    > test.out 2>&1
eval_tap $? 146 'PublicUpdateContentByShareCodeV2' test.out

#- 147 PublicDeleteContentByShareCodeV2
./ng net.accelbyte.sdk.cli.Main ugc publicDeleteContentByShareCodeV2 \
    --channelId 'Wtftb1aF' \
    --namespace "$AB_NAMESPACE" \
    --shareCode '2s5HO9P6' \
    --userId 'gGIDB93T' \
    > test.out 2>&1
eval_tap $? 147 'PublicDeleteContentByShareCodeV2' test.out

#- 148 PublicDeleteContentV2
./ng net.accelbyte.sdk.cli.Main ugc publicDeleteContentV2 \
    --channelId 'AQKUr4G9' \
    --contentId 'LbKtyrjR' \
    --namespace "$AB_NAMESPACE" \
    --userId 'imTZSXdR' \
    > test.out 2>&1
eval_tap $? 148 'PublicDeleteContentV2' test.out

#- 149 PublicUpdateContentV2
./ng net.accelbyte.sdk.cli.Main ugc publicUpdateContentV2 \
    --channelId 'erHt1XYZ' \
    --contentId 'Bjq0Q6B8' \
    --namespace "$AB_NAMESPACE" \
    --userId 'ZQu1f401' \
    --body '{"customAttributes": {"JH6uQU8w": {}, "jEmWaQkf": {}, "BpEwBpBH": {}}, "name": "c84uIdwa", "subType": "aeTz8eh5", "tags": ["3mbapq6T", "Uf13OVyM", "A1obAL03"], "type": "4ywzdgsu"}' \
    > test.out 2>&1
eval_tap $? 149 'PublicUpdateContentV2' test.out

#- 150 PublicUpdateContentFileLocation
./ng net.accelbyte.sdk.cli.Main ugc publicUpdateContentFileLocation \
    --channelId 'XklGDMLG' \
    --contentId '1fqw5wrh' \
    --namespace "$AB_NAMESPACE" \
    --userId 'JNxsL9MM' \
    --body '{"fileExtension": "6eUeUZJp", "fileLocation": "AJ9h7C59"}' \
    > test.out 2>&1
eval_tap $? 150 'PublicUpdateContentFileLocation' test.out

#- 151 UpdateContentShareCodeV2
./ng net.accelbyte.sdk.cli.Main ugc updateContentShareCodeV2 \
    --channelId 'Qgx1kPDa' \
    --contentId 'oDYoHU2I' \
    --namespace "$AB_NAMESPACE" \
    --userId 'RuGnqRaB' \
    --body '{"shareCode": "rMSi1Zd1"}' \
    > test.out 2>&1
eval_tap $? 151 'UpdateContentShareCodeV2' test.out

#- 152 PublicGenerateContentUploadURLV2
./ng net.accelbyte.sdk.cli.Main ugc publicGenerateContentUploadURLV2 \
    --channelId '0YoOPaa4' \
    --contentId 'foW17OJr' \
    --namespace "$AB_NAMESPACE" \
    --userId 'zzutoEun' \
    --body '{"contentType": "2VAD1f9G", "fileExtension": "OLqX4Dhl"}' \
    > test.out 2>&1
eval_tap $? 152 'PublicGenerateContentUploadURLV2' test.out

#- 153 PublicGetContentByUserIDV2
./ng net.accelbyte.sdk.cli.Main ugc publicGetContentByUserIDV2 \
    --namespace "$AB_NAMESPACE" \
    --userId 'R7bEMN0b' \
    --limit '77' \
    --offset '17' \
    --sortBy 'KrqdGlwJ' \
    > test.out 2>&1
eval_tap $? 153 'PublicGetContentByUserIDV2' test.out

#- 154 UpdateScreenshotsV2
./ng net.accelbyte.sdk.cli.Main ugc updateScreenshotsV2 \
    --contentId 'GZV3Qejd' \
    --namespace "$AB_NAMESPACE" \
    --userId 'R7y2RyvR' \
    --body '{"screenshots": [{"description": "Ulm9mdR4", "screenshotId": "DO1aJRDf"}, {"description": "P6Gz80Fr", "screenshotId": "iqzUOfmH"}, {"description": "I9ujGb21", "screenshotId": "8aLKT8J0"}]}' \
    > test.out 2>&1
eval_tap $? 154 'UpdateScreenshotsV2' test.out

#- 155 UploadContentScreenshotV2
./ng net.accelbyte.sdk.cli.Main ugc uploadContentScreenshotV2 \
    --contentId 'CLmho396' \
    --namespace "$AB_NAMESPACE" \
    --userId 'jpvx5Ye4' \
    --body '{"screenshots": [{"contentType": "WO3OVVB9", "description": "BKGDmh0b", "fileExtension": "jfif"}, {"contentType": "ijCeQCf9", "description": "rRAS83vb", "fileExtension": "pjp"}, {"contentType": "7GFhmVL7", "description": "V3PtSrwN", "fileExtension": "jfif"}]}' \
    > test.out 2>&1
eval_tap $? 155 'UploadContentScreenshotV2' test.out

#- 156 DeleteContentScreenshotV2
./ng net.accelbyte.sdk.cli.Main ugc deleteContentScreenshotV2 \
    --contentId 'suhHTNC6' \
    --namespace "$AB_NAMESPACE" \
    --screenshotId 'wKZ5rK1w' \
    --userId 'ZoZFPJ2Y' \
    > test.out 2>&1
eval_tap $? 156 'DeleteContentScreenshotV2' test.out

#- 157 PublicGetGroupContentsV2
./ng net.accelbyte.sdk.cli.Main ugc publicGetGroupContentsV2 \
    --groupId '4FFHbhpZ' \
    --namespace "$AB_NAMESPACE" \
    --userId 'YTqu5d3W' \
    --limit '0' \
    --offset '73' \
    > test.out 2>&1
eval_tap $? 157 'PublicGetGroupContentsV2' test.out

#- 158 ListUserStagingContents
./ng net.accelbyte.sdk.cli.Main ugc listUserStagingContents \
    --namespace "$AB_NAMESPACE" \
    --userId 'JBMlG0kY' \
    --limit '37' \
    --offset '95' \
    --sortBy '6e4qwoF7' \
    --status 's8atupnZ' \
    > test.out 2>&1
eval_tap $? 158 'ListUserStagingContents' test.out

#- 159 GetUserStagingContentByID
./ng net.accelbyte.sdk.cli.Main ugc getUserStagingContentByID \
    --contentId 'ojytHJix' \
    --namespace "$AB_NAMESPACE" \
    --userId 'Z7MOWLzH' \
    > test.out 2>&1
eval_tap $? 159 'GetUserStagingContentByID' test.out

#- 160 UpdateStagingContent
./ng net.accelbyte.sdk.cli.Main ugc updateStagingContent \
    --contentId 'C1I5bt0A' \
    --namespace "$AB_NAMESPACE" \
    --userId 'mQ9z0rvE' \
    --body '{"fileExtension": "TD8crdV4", "fileLocation": "fNQuFfiv"}' \
    > test.out 2>&1
eval_tap $? 160 'UpdateStagingContent' test.out

#- 161 DeleteUserStagingContentByID
./ng net.accelbyte.sdk.cli.Main ugc deleteUserStagingContentByID \
    --contentId 'igT1LBdI' \
    --namespace "$AB_NAMESPACE" \
    --userId '395icQ3P' \
    > test.out 2>&1
eval_tap $? 161 'DeleteUserStagingContentByID' test.out


rm -f "tmp.dat"

exit $EXIT_CODE