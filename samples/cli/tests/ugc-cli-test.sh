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
    --limit '64' \
    --offset '51' \
    > test.out 2>&1
eval_tap $? 2 'SingleAdminGetChannel' test.out

#- 3 AdminCreateChannel
./ng net.accelbyte.sdk.cli.Main ugc adminCreateChannel \
    --namespace "$AB_NAMESPACE" \
    --body '{"id": "bGDoqVwI", "name": "yHqTTozC"}' \
    > test.out 2>&1
eval_tap $? 3 'AdminCreateChannel' test.out

#- 4 SingleAdminUpdateChannel
./ng net.accelbyte.sdk.cli.Main ugc singleAdminUpdateChannel \
    --channelId 'G5n8xA9P' \
    --namespace "$AB_NAMESPACE" \
    --body '{"name": "PKcltOCP"}' \
    > test.out 2>&1
eval_tap $? 4 'SingleAdminUpdateChannel' test.out

#- 5 SingleAdminDeleteChannel
./ng net.accelbyte.sdk.cli.Main ugc singleAdminDeleteChannel \
    --channelId 'wFT12x0h' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 5 'SingleAdminDeleteChannel' test.out

#- 6 AdminUploadContentDirect
eval_tap 0 6 'AdminUploadContentDirect # SKIP deprecated' test.out

#- 7 AdminUploadContentS3
./ng net.accelbyte.sdk.cli.Main ugc adminUploadContentS3 \
    --channelId 'MiPPXTrC' \
    --namespace "$AB_NAMESPACE" \
    --body '{"contentType": "md99gvlC", "customAttributes": {"P2Lhd2Xl": {}, "cnTZKnIK": {}, "9N0L4uLk": {}}, "fileExtension": "N5xGl2Cr", "name": "ysfRosfa", "preview": "GAOZbils", "previewMetadata": {"previewContentType": "NBd9zYYs", "previewFileExtension": "pWXtXIeT"}, "shareCode": "wPZUUE6S", "subType": "pFk9B8gA", "tags": ["Y9LEximT", "vPEpWPHf", "Ipb5ktfv"], "type": "fP834yKp"}' \
    > test.out 2>&1
eval_tap $? 7 'AdminUploadContentS3' test.out

#- 8 SingleAdminUpdateContentS3
./ng net.accelbyte.sdk.cli.Main ugc singleAdminUpdateContentS3 \
    --channelId 'b6mSPJeF' \
    --contentId 'KsSpT5Un' \
    --namespace "$AB_NAMESPACE" \
    --body '{"contentType": "ZTkCE7fE", "customAttributes": {"kd3J2fM4": {}, "Zr7cPpK1": {}, "2SxSUoS5": {}}, "fileExtension": "ck9TuIzd", "name": "4Et0HwnI", "payload": "iq2AiLnk", "preview": "j6XgZO24", "previewMetadata": {"previewContentType": "7dUr7kOp", "previewFileExtension": "tKS8Ioxk"}, "shareCode": "lFmBfdWN", "subType": "dH7m6Uu3", "tags": ["pJNXOG9h", "NMaUr2nB", "21Po4xJW"], "type": "8gEmJ8eo", "updateContentFile": true}' \
    > test.out 2>&1
eval_tap $? 8 'SingleAdminUpdateContentS3' test.out

#- 9 AdminSearchChannelSpecificContent
./ng net.accelbyte.sdk.cli.Main ugc adminSearchChannelSpecificContent \
    --channelId 'TeYda9ug' \
    --namespace "$AB_NAMESPACE" \
    --creator '2oWffsxI' \
    --ishidden '3Ozb5dAU' \
    --isofficial 'MDQ6MJLF' \
    --limit '39' \
    --name '3TAaTm8E' \
    --offset '3' \
    --orderby 'yHLyclxX' \
    --sortby 'OAnrj8it' \
    --subtype 'Aml96mUY' \
    --tags 'DZivWH2J,bBgYkteB,pZDupAoM' \
    --type 'Qr2XVOP6' \
    --userId 'fXZnRqvh' \
    > test.out 2>&1
eval_tap $? 9 'AdminSearchChannelSpecificContent' test.out

#- 10 SingleAdminUpdateContentDirect
eval_tap 0 10 'SingleAdminUpdateContentDirect # SKIP deprecated' test.out

#- 11 SingleAdminDeleteContent
./ng net.accelbyte.sdk.cli.Main ugc singleAdminDeleteContent \
    --channelId 'M6CTR4gd' \
    --contentId 'OukmorpF' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 11 'SingleAdminDeleteContent' test.out

#- 12 SingleAdminGetContent
./ng net.accelbyte.sdk.cli.Main ugc singleAdminGetContent \
    --namespace "$AB_NAMESPACE" \
    --limit '30' \
    --offset '52' \
    > test.out 2>&1
eval_tap $? 12 'SingleAdminGetContent' test.out

#- 13 AdminGetContentBulk
./ng net.accelbyte.sdk.cli.Main ugc adminGetContentBulk \
    --namespace "$AB_NAMESPACE" \
    --body '{"contentIds": ["HoVNNhxj", "XxfWbNhn", "Fk8bRyn5"]}' \
    > test.out 2>&1
eval_tap $? 13 'AdminGetContentBulk' test.out

#- 14 AdminSearchContent
./ng net.accelbyte.sdk.cli.Main ugc adminSearchContent \
    --namespace "$AB_NAMESPACE" \
    --creator '4sqvhcB7' \
    --ishidden '85QDDxFr' \
    --isofficial 'XkQ2cQ2h' \
    --limit '10' \
    --name 'GRyKQf1g' \
    --offset '3' \
    --orderby 'oG3zr1Ei' \
    --sortby 'I50MNgY9' \
    --subtype 'b1whutYF' \
    --tags 'Kk6Hy4jU,WY9DBeTA,Udm8Iklk' \
    --type '9nX9Dkm4' \
    --userId 'KI1jbSnU' \
    > test.out 2>&1
eval_tap $? 14 'AdminSearchContent' test.out

#- 15 AdminGetContentBulkByShareCodes
./ng net.accelbyte.sdk.cli.Main ugc adminGetContentBulkByShareCodes \
    --namespace "$AB_NAMESPACE" \
    --body '{"shareCodes": ["W0t1HmGx", "TWJTnCts", "Xpms5grj"]}' \
    > test.out 2>&1
eval_tap $? 15 'AdminGetContentBulkByShareCodes' test.out

#- 16 AdminGetUserContentByShareCode
./ng net.accelbyte.sdk.cli.Main ugc adminGetUserContentByShareCode \
    --namespace "$AB_NAMESPACE" \
    --shareCode 'HyDHkHIa' \
    > test.out 2>&1
eval_tap $? 16 'AdminGetUserContentByShareCode' test.out

#- 17 AdminGetSpecificContent
./ng net.accelbyte.sdk.cli.Main ugc adminGetSpecificContent \
    --contentId 'ph7u0wu1' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 17 'AdminGetSpecificContent' test.out

#- 18 AdminDownloadContentPreview
./ng net.accelbyte.sdk.cli.Main ugc adminDownloadContentPreview \
    --contentId 'dq9tf09b' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 18 'AdminDownloadContentPreview' test.out

#- 19 RollbackContentVersion
./ng net.accelbyte.sdk.cli.Main ugc rollbackContentVersion \
    --contentId 'DqJ9ifzO' \
    --namespace "$AB_NAMESPACE" \
    --versionId 'v3GBd9Qs' \
    > test.out 2>&1
eval_tap $? 19 'RollbackContentVersion' test.out

#- 20 AdminUpdateScreenshots
./ng net.accelbyte.sdk.cli.Main ugc adminUpdateScreenshots \
    --contentId '7semwtV2' \
    --namespace "$AB_NAMESPACE" \
    --body '{"screenshots": [{"description": "meX1K8w1", "screenshotId": "XGrkhGO4"}, {"description": "sscnrPaz", "screenshotId": "5ZFPZdUQ"}, {"description": "zetP67nP", "screenshotId": "cl0j67Gx"}]}' \
    > test.out 2>&1
eval_tap $? 20 'AdminUpdateScreenshots' test.out

#- 21 AdminUploadContentScreenshot
./ng net.accelbyte.sdk.cli.Main ugc adminUploadContentScreenshot \
    --contentId 'jTgvpsF3' \
    --namespace "$AB_NAMESPACE" \
    --body '{"screenshots": [{"contentType": "O1XmFZKD", "description": "CE2XT1St", "fileExtension": "png"}, {"contentType": "NqhmTlaH", "description": "bPXmOuaM", "fileExtension": "pjp"}, {"contentType": "wED2Ma4P", "description": "Ug4VQRLo", "fileExtension": "jfif"}]}' \
    > test.out 2>&1
eval_tap $? 21 'AdminUploadContentScreenshot' test.out

#- 22 AdminDeleteContentScreenshot
./ng net.accelbyte.sdk.cli.Main ugc adminDeleteContentScreenshot \
    --contentId 'XPt5IxPN' \
    --namespace "$AB_NAMESPACE" \
    --screenshotId '0gJoQdii' \
    > test.out 2>&1
eval_tap $? 22 'AdminDeleteContentScreenshot' test.out

#- 23 ListContentVersions
./ng net.accelbyte.sdk.cli.Main ugc listContentVersions \
    --contentId 'ghW5EbUS' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 23 'ListContentVersions' test.out

#- 24 SingleAdminGetAllGroups
./ng net.accelbyte.sdk.cli.Main ugc singleAdminGetAllGroups \
    --namespace "$AB_NAMESPACE" \
    --limit '86' \
    --offset '52' \
    > test.out 2>&1
eval_tap $? 24 'SingleAdminGetAllGroups' test.out

#- 25 AdminCreateGroup
./ng net.accelbyte.sdk.cli.Main ugc adminCreateGroup \
    --namespace "$AB_NAMESPACE" \
    --body '{"contents": ["mAcyAHB2", "2To3aRRN", "wOGTLt7P"], "name": "KhhOzdpL"}' \
    > test.out 2>&1
eval_tap $? 25 'AdminCreateGroup' test.out

#- 26 SingleAdminGetGroup
./ng net.accelbyte.sdk.cli.Main ugc singleAdminGetGroup \
    --groupId '49Jvdd48' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 26 'SingleAdminGetGroup' test.out

#- 27 SingleAdminUpdateGroup
./ng net.accelbyte.sdk.cli.Main ugc singleAdminUpdateGroup \
    --groupId 'HBa3RQvw' \
    --namespace "$AB_NAMESPACE" \
    --body '{"contents": ["GvBAhFLG", "Of3rbo9H", "wc5tVsd4"], "name": "4ziO71Am"}' \
    > test.out 2>&1
eval_tap $? 27 'SingleAdminUpdateGroup' test.out

#- 28 SingleAdminDeleteGroup
./ng net.accelbyte.sdk.cli.Main ugc singleAdminDeleteGroup \
    --groupId 'uSqvcNOX' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 28 'SingleAdminDeleteGroup' test.out

#- 29 SingleAdminGetGroupContents
./ng net.accelbyte.sdk.cli.Main ugc singleAdminGetGroupContents \
    --groupId 'iYIjvdXB' \
    --namespace "$AB_NAMESPACE" \
    --limit '58' \
    --offset '9' \
    > test.out 2>&1
eval_tap $? 29 'SingleAdminGetGroupContents' test.out

#- 30 AdminGetTag
./ng net.accelbyte.sdk.cli.Main ugc adminGetTag \
    --namespace "$AB_NAMESPACE" \
    --limit '49' \
    --offset '26' \
    > test.out 2>&1
eval_tap $? 30 'AdminGetTag' test.out

#- 31 AdminCreateTag
./ng net.accelbyte.sdk.cli.Main ugc adminCreateTag \
    --namespace "$AB_NAMESPACE" \
    --body '{"tag": "YB4FIAJn"}' \
    > test.out 2>&1
eval_tap $? 31 'AdminCreateTag' test.out

#- 32 AdminUpdateTag
./ng net.accelbyte.sdk.cli.Main ugc adminUpdateTag \
    --namespace "$AB_NAMESPACE" \
    --tagId 'xw2djIgf' \
    --body '{"tag": "qyz6t86S"}' \
    > test.out 2>&1
eval_tap $? 32 'AdminUpdateTag' test.out

#- 33 AdminDeleteTag
./ng net.accelbyte.sdk.cli.Main ugc adminDeleteTag \
    --namespace "$AB_NAMESPACE" \
    --tagId 'Rz33ZY5L' \
    > test.out 2>&1
eval_tap $? 33 'AdminDeleteTag' test.out

#- 34 AdminGetType
./ng net.accelbyte.sdk.cli.Main ugc adminGetType \
    --namespace "$AB_NAMESPACE" \
    --limit '43' \
    --offset '41' \
    > test.out 2>&1
eval_tap $? 34 'AdminGetType' test.out

#- 35 AdminCreateType
./ng net.accelbyte.sdk.cli.Main ugc adminCreateType \
    --namespace "$AB_NAMESPACE" \
    --body '{"subtype": ["r99YRo31", "6tm8Snzj", "BhgJNrl5"], "type": "XwBWPZYi"}' \
    > test.out 2>&1
eval_tap $? 35 'AdminCreateType' test.out

#- 36 AdminUpdateType
./ng net.accelbyte.sdk.cli.Main ugc adminUpdateType \
    --namespace "$AB_NAMESPACE" \
    --typeId 'ICL3sRtG' \
    --body '{"subtype": ["yxXHiDNi", "Y6netl7d", "tbJuwm8o"], "type": "RfHKxt3G"}' \
    > test.out 2>&1
eval_tap $? 36 'AdminUpdateType' test.out

#- 37 AdminDeleteType
./ng net.accelbyte.sdk.cli.Main ugc adminDeleteType \
    --namespace "$AB_NAMESPACE" \
    --typeId 'QvQoWGDE' \
    > test.out 2>&1
eval_tap $? 37 'AdminDeleteType' test.out

#- 38 AdminGetChannel
./ng net.accelbyte.sdk.cli.Main ugc adminGetChannel \
    --namespace "$AB_NAMESPACE" \
    --userId 'ev2Msp0d' \
    --limit '59' \
    --name 'LBuFtj2D' \
    --offset '57' \
    > test.out 2>&1
eval_tap $? 38 'AdminGetChannel' test.out

#- 39 AdminDeleteAllUserChannels
./ng net.accelbyte.sdk.cli.Main ugc adminDeleteAllUserChannels \
    --namespace "$AB_NAMESPACE" \
    --userId 'Bu4kU7Qw' \
    > test.out 2>&1
eval_tap $? 39 'AdminDeleteAllUserChannels' test.out

#- 40 AdminUpdateChannel
./ng net.accelbyte.sdk.cli.Main ugc adminUpdateChannel \
    --channelId 'PcFMGhAs' \
    --namespace "$AB_NAMESPACE" \
    --userId '2ogDNauV' \
    --body '{"name": "SGpavjTO"}' \
    > test.out 2>&1
eval_tap $? 40 'AdminUpdateChannel' test.out

#- 41 AdminDeleteChannel
./ng net.accelbyte.sdk.cli.Main ugc adminDeleteChannel \
    --channelId 'b0bbpEbf' \
    --namespace "$AB_NAMESPACE" \
    --userId 'kLGZ6oQe' \
    > test.out 2>&1
eval_tap $? 41 'AdminDeleteChannel' test.out

#- 42 AdminUpdateContentS3ByShareCode
./ng net.accelbyte.sdk.cli.Main ugc adminUpdateContentS3ByShareCode \
    --channelId 'U0fsVRlq' \
    --namespace "$AB_NAMESPACE" \
    --shareCode 'zbyYm5nW' \
    --userId 'Ew1dWxvR' \
    --body '{"contentType": "2E4ovUPD", "customAttributes": {"QwVmV7pO": {}, "VZS86ZGE": {}, "LcbFXeCL": {}}, "fileExtension": "LUzZYlcW", "name": "J9cdt5bC", "payload": "qm87RgC4", "preview": "b9suGBFh", "previewMetadata": {"previewContentType": "4mH4DFUK", "previewFileExtension": "PhncxFRY"}, "shareCode": "GSEPhq8K", "subType": "oGZOMIOf", "tags": ["MWcBcLAJ", "kDaaCeVw", "xTQQBc5Z"], "type": "aqiUYQbH", "updateContentFile": true}' \
    > test.out 2>&1
eval_tap $? 42 'AdminUpdateContentS3ByShareCode' test.out

#- 43 AdminUpdateContentS3
./ng net.accelbyte.sdk.cli.Main ugc adminUpdateContentS3 \
    --channelId '77t9yDAD' \
    --contentId 'A6wvfFC6' \
    --namespace "$AB_NAMESPACE" \
    --userId 'VgAcraxi' \
    --body '{"contentType": "WrGJwgFf", "customAttributes": {"SJnevuzK": {}, "wCYQ9Qr7": {}, "HkfhcsqN": {}}, "fileExtension": "H7a93z7d", "name": "P6Era4JD", "payload": "Qu6pFnwZ", "preview": "k6B6Bp3B", "previewMetadata": {"previewContentType": "f9mW4ned", "previewFileExtension": "kaOTPyab"}, "shareCode": "k1YmOcjn", "subType": "P04FOXXv", "tags": ["74exxDtX", "VMx367yM", "GofaiVDH"], "type": "tAH2WheL", "updateContentFile": false}' \
    > test.out 2>&1
eval_tap $? 43 'AdminUpdateContentS3' test.out

#- 44 DeleteContentByShareCode
./ng net.accelbyte.sdk.cli.Main ugc deleteContentByShareCode \
    --channelId 'gok2OODV' \
    --namespace "$AB_NAMESPACE" \
    --shareCode 'IE5D9Wsa' \
    --userId '8Tkl1Kxa' \
    > test.out 2>&1
eval_tap $? 44 'DeleteContentByShareCode' test.out

#- 45 AdminUpdateContentDirect
eval_tap 0 45 'AdminUpdateContentDirect # SKIP deprecated' test.out

#- 46 AdminDeleteContent
./ng net.accelbyte.sdk.cli.Main ugc adminDeleteContent \
    --channelId 'R6ONy0w0' \
    --contentId 'NKsuVHIz' \
    --namespace "$AB_NAMESPACE" \
    --userId 'GQqxJcID' \
    > test.out 2>&1
eval_tap $? 46 'AdminDeleteContent' test.out

#- 47 AdminGetContent
./ng net.accelbyte.sdk.cli.Main ugc adminGetContent \
    --namespace "$AB_NAMESPACE" \
    --userId 'KTaH2b1O' \
    --limit '31' \
    --offset '11' \
    > test.out 2>&1
eval_tap $? 47 'AdminGetContent' test.out

#- 48 AdminDeleteAllUserContents
./ng net.accelbyte.sdk.cli.Main ugc adminDeleteAllUserContents \
    --namespace "$AB_NAMESPACE" \
    --userId 'cCdPqJCQ' \
    > test.out 2>&1
eval_tap $? 48 'AdminDeleteAllUserContents' test.out

#- 49 AdminHideUserContent
./ng net.accelbyte.sdk.cli.Main ugc adminHideUserContent \
    --contentId '5r7a6WC3' \
    --namespace "$AB_NAMESPACE" \
    --userId 'SnpbfjMt' \
    --body '{"isHidden": true}' \
    > test.out 2>&1
eval_tap $? 49 'AdminHideUserContent' test.out

#- 50 AdminGetAllGroups
./ng net.accelbyte.sdk.cli.Main ugc adminGetAllGroups \
    --namespace "$AB_NAMESPACE" \
    --userId 'amN12w6I' \
    --limit '48' \
    --offset '17' \
    > test.out 2>&1
eval_tap $? 50 'AdminGetAllGroups' test.out

#- 51 AdminDeleteAllUserGroup
./ng net.accelbyte.sdk.cli.Main ugc adminDeleteAllUserGroup \
    --namespace "$AB_NAMESPACE" \
    --userId 'Ji5OuABH' \
    > test.out 2>&1
eval_tap $? 51 'AdminDeleteAllUserGroup' test.out

#- 52 AdminGetGroup
./ng net.accelbyte.sdk.cli.Main ugc adminGetGroup \
    --groupId 'mkrhj8zI' \
    --namespace "$AB_NAMESPACE" \
    --userId '4AuZ8uso' \
    > test.out 2>&1
eval_tap $? 52 'AdminGetGroup' test.out

#- 53 AdminUpdateGroup
./ng net.accelbyte.sdk.cli.Main ugc adminUpdateGroup \
    --groupId 'oJ4m5Moy' \
    --namespace "$AB_NAMESPACE" \
    --userId 'kbUZYsyd' \
    --body '{"contents": ["1Q44LNjm", "8KZ3ZBUe", "mLzmOxSK"], "name": "t88GVA7B"}' \
    > test.out 2>&1
eval_tap $? 53 'AdminUpdateGroup' test.out

#- 54 AdminDeleteGroup
./ng net.accelbyte.sdk.cli.Main ugc adminDeleteGroup \
    --groupId '8tSY8yq0' \
    --namespace "$AB_NAMESPACE" \
    --userId 'I0x8bNPP' \
    > test.out 2>&1
eval_tap $? 54 'AdminDeleteGroup' test.out

#- 55 AdminGetGroupContents
./ng net.accelbyte.sdk.cli.Main ugc adminGetGroupContents \
    --groupId 'KN0hQx48' \
    --namespace "$AB_NAMESPACE" \
    --userId 'IWGBEmk2' \
    --limit '55' \
    --offset '53' \
    > test.out 2>&1
eval_tap $? 55 'AdminGetGroupContents' test.out

#- 56 AdminDeleteAllUserStates
./ng net.accelbyte.sdk.cli.Main ugc adminDeleteAllUserStates \
    --namespace "$AB_NAMESPACE" \
    --userId '3zCYgwqn' \
    > test.out 2>&1
eval_tap $? 56 'AdminDeleteAllUserStates' test.out

#- 57 SearchChannelSpecificContent
./ng net.accelbyte.sdk.cli.Main ugc searchChannelSpecificContent \
    --channelId 'O1CUT7Pk' \
    --namespace "$AB_NAMESPACE" \
    --creator 'qPf9s44P' \
    --ishidden 'nbt1EBHX' \
    --isofficial 'HgosWVOj' \
    --limit '47' \
    --name 'NzwdCVxQ' \
    --offset '26' \
    --orderby 'SKsiH4Zu' \
    --sortby 'j01U7pq7' \
    --subtype 'zhyzdjtu' \
    --tags 'sg6xBgbG,YZhSpwVe,F07u4DxH' \
    --type 'swLsBJb1' \
    --userId 'nEL6cXfz' \
    > test.out 2>&1
eval_tap $? 57 'SearchChannelSpecificContent' test.out

#- 58 PublicSearchContent
./ng net.accelbyte.sdk.cli.Main ugc publicSearchContent \
    --namespace "$AB_NAMESPACE" \
    --creator 'tbVXx11A' \
    --ishidden 'otDdRPN9' \
    --isofficial 'Mz15Rbps' \
    --limit '90' \
    --name '3zaZ03eI' \
    --offset '79' \
    --orderby 'ibdP6F57' \
    --sortby 'eN2CaO3Z' \
    --subtype 'JQXnnL6I' \
    --tags 'rr20z53C,jPwlbqjV,sCkDYzs8' \
    --type 'mvwW7sTe' \
    --userId 'rV3AIINF' \
    > test.out 2>&1
eval_tap $? 58 'PublicSearchContent' test.out

#- 59 PublicGetContentBulk
./ng net.accelbyte.sdk.cli.Main ugc publicGetContentBulk \
    --namespace "$AB_NAMESPACE" \
    --body '{"contentIds": ["yseVxEKq", "Cvdk2dXX", "v3uMDn5f"]}' \
    > test.out 2>&1
eval_tap $? 59 'PublicGetContentBulk' test.out

#- 60 GetFollowedContent
./ng net.accelbyte.sdk.cli.Main ugc getFollowedContent \
    --namespace "$AB_NAMESPACE" \
    --limit '52' \
    --offset '90' \
    > test.out 2>&1
eval_tap $? 60 'GetFollowedContent' test.out

#- 61 GetLikedContent
./ng net.accelbyte.sdk.cli.Main ugc getLikedContent \
    --namespace "$AB_NAMESPACE" \
    --isofficial  \
    --limit '86' \
    --name 'n03FcXy4' \
    --offset '86' \
    --orderby 'DVLkYrZX' \
    --sortby 'd1m8QaRa' \
    --subtype '5Eg7xVZK' \
    --tags 'dYz0usJs,l01RnBHS,8MEm0Yrt' \
    --type 'CAOhyqAx' \
    > test.out 2>&1
eval_tap $? 61 'GetLikedContent' test.out

#- 62 PublicGetContentBulkByShareCodes
./ng net.accelbyte.sdk.cli.Main ugc publicGetContentBulkByShareCodes \
    --namespace "$AB_NAMESPACE" \
    --body '{"shareCodes": ["Bo3Xs53Z", "Oi9hyXEK", "NnIFwrXN"]}' \
    > test.out 2>&1
eval_tap $? 62 'PublicGetContentBulkByShareCodes' test.out

#- 63 PublicDownloadContentByShareCode
./ng net.accelbyte.sdk.cli.Main ugc publicDownloadContentByShareCode \
    --namespace "$AB_NAMESPACE" \
    --shareCode 'IW7VHR28' \
    > test.out 2>&1
eval_tap $? 63 'PublicDownloadContentByShareCode' test.out

#- 64 PublicDownloadContentByContentID
./ng net.accelbyte.sdk.cli.Main ugc publicDownloadContentByContentID \
    --contentId 'HIZLGI3p' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 64 'PublicDownloadContentByContentID' test.out

#- 65 AddDownloadCount
./ng net.accelbyte.sdk.cli.Main ugc addDownloadCount \
    --contentId 'Gn8BB3HI' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 65 'AddDownloadCount' test.out

#- 66 UpdateContentLikeStatus
./ng net.accelbyte.sdk.cli.Main ugc updateContentLikeStatus \
    --contentId '0IkRt3lu' \
    --namespace "$AB_NAMESPACE" \
    --body '{"likeStatus": false}' \
    > test.out 2>&1
eval_tap $? 66 'UpdateContentLikeStatus' test.out

#- 67 PublicDownloadContentPreview
./ng net.accelbyte.sdk.cli.Main ugc publicDownloadContentPreview \
    --contentId 'ad10028N' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 67 'PublicDownloadContentPreview' test.out

#- 68 GetTag
./ng net.accelbyte.sdk.cli.Main ugc getTag \
    --namespace "$AB_NAMESPACE" \
    --limit '50' \
    --offset '85' \
    > test.out 2>&1
eval_tap $? 68 'GetTag' test.out

#- 69 GetType
./ng net.accelbyte.sdk.cli.Main ugc getType \
    --namespace "$AB_NAMESPACE" \
    --limit '9' \
    --offset '9' \
    > test.out 2>&1
eval_tap $? 69 'GetType' test.out

#- 70 PublicSearchCreator
./ng net.accelbyte.sdk.cli.Main ugc publicSearchCreator \
    --namespace "$AB_NAMESPACE" \
    --limit '71' \
    --offset '34' \
    --orderby 'QrTSIpbn' \
    --sortby '2OyXHUC7' \
    > test.out 2>&1
eval_tap $? 70 'PublicSearchCreator' test.out

#- 71 GetFollowedUsers
./ng net.accelbyte.sdk.cli.Main ugc getFollowedUsers \
    --namespace "$AB_NAMESPACE" \
    --limit '83' \
    --offset '20' \
    > test.out 2>&1
eval_tap $? 71 'GetFollowedUsers' test.out

#- 72 PublicGetCreator
./ng net.accelbyte.sdk.cli.Main ugc publicGetCreator \
    --namespace "$AB_NAMESPACE" \
    --userId '5KD9Qwgo' \
    > test.out 2>&1
eval_tap $? 72 'PublicGetCreator' test.out

#- 73 GetChannels
./ng net.accelbyte.sdk.cli.Main ugc getChannels \
    --namespace "$AB_NAMESPACE" \
    --userId '9LnvO1Ki' \
    --limit '48' \
    --name 'rHv0RZ0M' \
    --offset '20' \
    > test.out 2>&1
eval_tap $? 73 'GetChannels' test.out

#- 74 PublicCreateChannel
./ng net.accelbyte.sdk.cli.Main ugc publicCreateChannel \
    --namespace "$AB_NAMESPACE" \
    --userId '7CAACwUZ' \
    --body '{"name": "IMHgZkwE"}' \
    > test.out 2>&1
eval_tap $? 74 'PublicCreateChannel' test.out

#- 75 DeleteAllUserChannel
./ng net.accelbyte.sdk.cli.Main ugc deleteAllUserChannel \
    --namespace "$AB_NAMESPACE" \
    --userId 'SyT5FhKB' \
    > test.out 2>&1
eval_tap $? 75 'DeleteAllUserChannel' test.out

#- 76 UpdateChannel
./ng net.accelbyte.sdk.cli.Main ugc updateChannel \
    --channelId '12qMyguz' \
    --namespace "$AB_NAMESPACE" \
    --userId 'mreZok1Q' \
    --body '{"name": "E09WylWs"}' \
    > test.out 2>&1
eval_tap $? 76 'UpdateChannel' test.out

#- 77 DeleteChannel
./ng net.accelbyte.sdk.cli.Main ugc deleteChannel \
    --channelId 'wQw9glNf' \
    --namespace "$AB_NAMESPACE" \
    --userId 'nNRKF09V' \
    > test.out 2>&1
eval_tap $? 77 'DeleteChannel' test.out

#- 78 CreateContentDirect
eval_tap 0 78 'CreateContentDirect # SKIP deprecated' test.out

#- 79 CreateContentS3
./ng net.accelbyte.sdk.cli.Main ugc createContentS3 \
    --channelId '8IOFvW0B' \
    --namespace "$AB_NAMESPACE" \
    --userId 'edJDUUJJ' \
    --body '{"contentType": "FFKMiXeN", "customAttributes": {"CjLBS9Va": {}, "RkrJmttm": {}, "1trT6Qjf": {}}, "fileExtension": "eih6tkjG", "name": "4q4jfPLU", "preview": "rXbYgHIA", "previewMetadata": {"previewContentType": "iSn2yGvI", "previewFileExtension": "OOHIuxl6"}, "subType": "XIjFvd5A", "tags": ["lAOvV6Y7", "RONH7sGy", "BlHBVLDH"], "type": "nlE2ydWc"}' \
    > test.out 2>&1
eval_tap $? 79 'CreateContentS3' test.out

#- 80 PublicUpdateContentByShareCode
./ng net.accelbyte.sdk.cli.Main ugc publicUpdateContentByShareCode \
    --channelId 'xs1VILQu' \
    --namespace "$AB_NAMESPACE" \
    --shareCode 'cuVbrfRK' \
    --userId 'kwuibDfl' \
    --body '{"contentType": "tAPunDbW", "customAttributes": {"IbYthm0e": {}, "yUey2rw1": {}, "86U6dOuX": {}}, "fileExtension": "GZyLgZFd", "name": "slubA7mJ", "payload": "6sAJjdxf", "preview": "dM1v5LLy", "previewMetadata": {"previewContentType": "GW80yZvd", "previewFileExtension": "DGNxCcMt"}, "subType": "zkgK0MRG", "tags": ["WKxRnIWk", "QaQC7mZu", "EbfHMFw8"], "type": "109xTnuK", "updateContentFile": false}' \
    > test.out 2>&1
eval_tap $? 80 'PublicUpdateContentByShareCode' test.out

#- 81 UpdateContentS3
./ng net.accelbyte.sdk.cli.Main ugc updateContentS3 \
    --channelId 'LE7H4Ltt' \
    --contentId 'JMB3Vr7A' \
    --namespace "$AB_NAMESPACE" \
    --userId 'h0zhGHik' \
    --body '{"contentType": "Q7rapSHo", "customAttributes": {"NCM5IEAp": {}, "DMoLPN5v": {}, "z5VMyiYk": {}}, "fileExtension": "hktIvL1d", "name": "LxRhwB0V", "payload": "vQyyCKQ3", "preview": "c5HxWOmh", "previewMetadata": {"previewContentType": "NxsjkkV9", "previewFileExtension": "7BWQqIk0"}, "subType": "dbuyfJ8L", "tags": ["ceIjRN3p", "fw35YUYw", "4T9pWnWY"], "type": "ksakxkVi", "updateContentFile": true}' \
    > test.out 2>&1
eval_tap $? 81 'UpdateContentS3' test.out

#- 82 PublicDeleteContentByShareCode
./ng net.accelbyte.sdk.cli.Main ugc publicDeleteContentByShareCode \
    --channelId 'rNadFwQc' \
    --namespace "$AB_NAMESPACE" \
    --shareCode '2yuheCNj' \
    --userId 'A0TQdX4H' \
    > test.out 2>&1
eval_tap $? 82 'PublicDeleteContentByShareCode' test.out

#- 83 UpdateContentDirect
eval_tap 0 83 'UpdateContentDirect # SKIP deprecated' test.out

#- 84 DeleteContent
./ng net.accelbyte.sdk.cli.Main ugc deleteContent \
    --channelId 'MW2zd4PE' \
    --contentId 'IBrikgyc' \
    --namespace "$AB_NAMESPACE" \
    --userId 'dVcTzJE9' \
    > test.out 2>&1
eval_tap $? 84 'DeleteContent' test.out

#- 85 UpdateContentShareCode
./ng net.accelbyte.sdk.cli.Main ugc updateContentShareCode \
    --channelId 'PlxPreP7' \
    --contentId 'OtSy3dvq' \
    --namespace "$AB_NAMESPACE" \
    --userId 'iH7eVXud' \
    --body '{"shareCode": "rJSX9cBU"}' \
    > test.out 2>&1
eval_tap $? 85 'UpdateContentShareCode' test.out

#- 86 PublicGetUserContent
./ng net.accelbyte.sdk.cli.Main ugc publicGetUserContent \
    --namespace "$AB_NAMESPACE" \
    --userId 'y2qIuMkx' \
    --limit '71' \
    --offset '57' \
    > test.out 2>&1
eval_tap $? 86 'PublicGetUserContent' test.out

#- 87 DeleteAllUserContents
./ng net.accelbyte.sdk.cli.Main ugc deleteAllUserContents \
    --namespace "$AB_NAMESPACE" \
    --userId 'BLsYKS1c' \
    > test.out 2>&1
eval_tap $? 87 'DeleteAllUserContents' test.out

#- 88 UpdateScreenshots
./ng net.accelbyte.sdk.cli.Main ugc updateScreenshots \
    --contentId 'potggWCy' \
    --namespace "$AB_NAMESPACE" \
    --userId 'RLubmLUF' \
    --body '{"screenshots": [{"description": "gK80MkAw", "screenshotId": "cCmhWD0s"}, {"description": "nPXfxrhf", "screenshotId": "6vCytqFm"}, {"description": "kjAsZaSO", "screenshotId": "3r4SGJS5"}]}' \
    > test.out 2>&1
eval_tap $? 88 'UpdateScreenshots' test.out

#- 89 UploadContentScreenshot
./ng net.accelbyte.sdk.cli.Main ugc uploadContentScreenshot \
    --contentId '4gIo4ymN' \
    --namespace "$AB_NAMESPACE" \
    --userId 'EcU6ghZB' \
    --body '{"screenshots": [{"contentType": "1eNWsRLz", "description": "0U2VpYuW", "fileExtension": "jpeg"}, {"contentType": "sDJIisMx", "description": "nLALys42", "fileExtension": "jpeg"}, {"contentType": "ZriK2WYO", "description": "eZPCdkr3", "fileExtension": "bmp"}]}' \
    > test.out 2>&1
eval_tap $? 89 'UploadContentScreenshot' test.out

#- 90 DeleteContentScreenshot
./ng net.accelbyte.sdk.cli.Main ugc deleteContentScreenshot \
    --contentId 'i7FD0klu' \
    --namespace "$AB_NAMESPACE" \
    --screenshotId 'Vnr4wyKI' \
    --userId 'kngbvy5M' \
    > test.out 2>&1
eval_tap $? 90 'DeleteContentScreenshot' test.out

#- 91 UpdateUserFollowStatus
./ng net.accelbyte.sdk.cli.Main ugc updateUserFollowStatus \
    --namespace "$AB_NAMESPACE" \
    --userId 'tPL6Nktp' \
    --body '{"followStatus": false}' \
    > test.out 2>&1
eval_tap $? 91 'UpdateUserFollowStatus' test.out

#- 92 GetPublicFollowers
./ng net.accelbyte.sdk.cli.Main ugc getPublicFollowers \
    --namespace "$AB_NAMESPACE" \
    --userId 'kAt6GHSP' \
    --limit '1' \
    --offset '6' \
    > test.out 2>&1
eval_tap $? 92 'GetPublicFollowers' test.out

#- 93 GetPublicFollowing
./ng net.accelbyte.sdk.cli.Main ugc getPublicFollowing \
    --namespace "$AB_NAMESPACE" \
    --userId 'VDySO0lk' \
    --limit '21' \
    --offset '23' \
    > test.out 2>&1
eval_tap $? 93 'GetPublicFollowing' test.out

#- 94 GetGroups
./ng net.accelbyte.sdk.cli.Main ugc getGroups \
    --namespace "$AB_NAMESPACE" \
    --userId 'BNGMJZRF' \
    --limit '95' \
    --offset '8' \
    > test.out 2>&1
eval_tap $? 94 'GetGroups' test.out

#- 95 CreateGroup
./ng net.accelbyte.sdk.cli.Main ugc createGroup \
    --namespace "$AB_NAMESPACE" \
    --userId 'XdHVq72M' \
    --body '{"contents": ["B4S7DHbn", "RldnpPys", "FGJTjivX"], "name": "H2WkiD7x"}' \
    > test.out 2>&1
eval_tap $? 95 'CreateGroup' test.out

#- 96 DeleteAllUserGroup
./ng net.accelbyte.sdk.cli.Main ugc deleteAllUserGroup \
    --namespace "$AB_NAMESPACE" \
    --userId '9UuqVyqq' \
    > test.out 2>&1
eval_tap $? 96 'DeleteAllUserGroup' test.out

#- 97 GetGroup
./ng net.accelbyte.sdk.cli.Main ugc getGroup \
    --groupId 'CmmT8K74' \
    --namespace "$AB_NAMESPACE" \
    --userId 'CuL3MguW' \
    > test.out 2>&1
eval_tap $? 97 'GetGroup' test.out

#- 98 UpdateGroup
./ng net.accelbyte.sdk.cli.Main ugc updateGroup \
    --groupId 'mhSFcO1z' \
    --namespace "$AB_NAMESPACE" \
    --userId 'Q2QL3FXN' \
    --body '{"contents": ["1T7kYFjW", "1L7YrZWc", "o1GaTSKQ"], "name": "qRdS0eMj"}' \
    > test.out 2>&1
eval_tap $? 98 'UpdateGroup' test.out

#- 99 DeleteGroup
./ng net.accelbyte.sdk.cli.Main ugc deleteGroup \
    --groupId 'ynUDIY8c' \
    --namespace "$AB_NAMESPACE" \
    --userId 'kTp3a227' \
    > test.out 2>&1
eval_tap $? 99 'DeleteGroup' test.out

#- 100 GetGroupContent
./ng net.accelbyte.sdk.cli.Main ugc getGroupContent \
    --groupId 'piJjnTAn' \
    --namespace "$AB_NAMESPACE" \
    --userId 'NgWpFK4k' \
    --limit '68' \
    --offset '47' \
    > test.out 2>&1
eval_tap $? 100 'GetGroupContent' test.out

#- 101 DeleteAllUserStates
./ng net.accelbyte.sdk.cli.Main ugc deleteAllUserStates \
    --namespace "$AB_NAMESPACE" \
    --userId '4Mu0YHYa' \
    > test.out 2>&1
eval_tap $? 101 'DeleteAllUserStates' test.out

#- 102 AdminGetContentByChannelIDV2
./ng net.accelbyte.sdk.cli.Main ugc adminGetContentByChannelIDV2 \
    --channelId 'KIm3ehkp' \
    --namespace "$AB_NAMESPACE" \
    --limit '6' \
    --name 'qtM9i3xx' \
    --offset '38' \
    --sortBy 'Br8MbFae' \
    > test.out 2>&1
eval_tap $? 102 'AdminGetContentByChannelIDV2' test.out

#- 103 AdminCreateContentV2
./ng net.accelbyte.sdk.cli.Main ugc adminCreateContentV2 \
    --channelId '598bqaEl' \
    --namespace "$AB_NAMESPACE" \
    --body '{"contentType": "h98BPsIy", "customAttributes": {"VgXhQnj3": {}, "cPSBVQYF": {}, "5ekBfiFQ": {}}, "fileExtension": "kt4F592e", "name": "7oeZK7bQ", "shareCode": "SFcSQJAb", "subType": "Kob5BpAl", "tags": ["pWKfMmbH", "pDpDJA7Z", "Q7jwHyGN"], "type": "qBQmUGn4"}' \
    > test.out 2>&1
eval_tap $? 103 'AdminCreateContentV2' test.out

#- 104 AdminDeleteOfficialContentV2
./ng net.accelbyte.sdk.cli.Main ugc adminDeleteOfficialContentV2 \
    --channelId '09B5CwoK' \
    --contentId 'jjFNdTy7' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 104 'AdminDeleteOfficialContentV2' test.out

#- 105 AdminUpdateOfficialContentV2
./ng net.accelbyte.sdk.cli.Main ugc adminUpdateOfficialContentV2 \
    --channelId 'LR4uHrzG' \
    --contentId 'ghSutzU5' \
    --namespace "$AB_NAMESPACE" \
    --body '{"customAttributes": {"3oPIAOjQ": {}, "KYML2XHN": {}, "9vVHJv5U": {}}, "name": "yff0tsAm", "shareCode": "DkEtMPt9", "subType": "tiYz7hGt", "tags": ["aeTm5dud", "m1eQn6by", "y4OIQ2qe"], "type": "RmiLRU2v"}' \
    > test.out 2>&1
eval_tap $? 105 'AdminUpdateOfficialContentV2' test.out

#- 106 AdminCopyContent
./ng net.accelbyte.sdk.cli.Main ugc adminCopyContent \
    --channelId '7DtfzcHx' \
    --contentId 'uIKLWQAV' \
    --namespace "$AB_NAMESPACE" \
    --body '{"customAttributes": {"Pgxrbl89": {}, "Nwc2yFwm": {}, "40QwCu9P": {}}, "name": "AN4l8CkZ", "subType": "BX4MalAE", "tags": ["2QLaeVH6", "QN5vca8y", "KP2Cn80S"], "targetChannelId": "pTPC7KbD", "type": "ahopp37R"}' \
    > test.out 2>&1
eval_tap $? 106 'AdminCopyContent' test.out

#- 107 AdminUpdateOfficialContentFileLocation
./ng net.accelbyte.sdk.cli.Main ugc adminUpdateOfficialContentFileLocation \
    --channelId 'KLnLbu38' \
    --contentId 'nqrRl8Zi' \
    --namespace "$AB_NAMESPACE" \
    --body '{"fileExtension": "zPYaazbk", "fileLocation": "odwi3QgR"}' \
    > test.out 2>&1
eval_tap $? 107 'AdminUpdateOfficialContentFileLocation' test.out

#- 108 AdminGenerateOfficialContentUploadURLV2
./ng net.accelbyte.sdk.cli.Main ugc adminGenerateOfficialContentUploadURLV2 \
    --channelId 'tPBiEyJv' \
    --contentId 'Q7dO9iQy' \
    --namespace "$AB_NAMESPACE" \
    --body '{"contentType": "PH7kGoWH", "fileExtension": "X1DreUkp"}' \
    > test.out 2>&1
eval_tap $? 108 'AdminGenerateOfficialContentUploadURLV2' test.out

#- 109 AdminGetConfigs
./ng net.accelbyte.sdk.cli.Main ugc adminGetConfigs \
    --namespace "$AB_NAMESPACE" \
    --limit '55' \
    --offset '23' \
    > test.out 2>&1
eval_tap $? 109 'AdminGetConfigs' test.out

#- 110 AdminUpdateConfig
./ng net.accelbyte.sdk.cli.Main ugc adminUpdateConfig \
    --key 'FJlsdKOb' \
    --namespace "$AB_NAMESPACE" \
    --body '{"value": "NvlbOIoR"}' \
    > test.out 2>&1
eval_tap $? 110 'AdminUpdateConfig' test.out

#- 111 AdminListContentV2
./ng net.accelbyte.sdk.cli.Main ugc adminListContentV2 \
    --namespace "$AB_NAMESPACE" \
    --isOfficial  \
    --limit '99' \
    --name 'bH1HZ2LX' \
    --offset '49' \
    --sortBy 'EYlFansX' \
    --subType '4i7vg4jv' \
    --tags 'fgyxui8K,uqIogAqJ,VJBRVU8L' \
    --type '62eslrwo' \
    > test.out 2>&1
eval_tap $? 111 'AdminListContentV2' test.out

#- 112 AdminBulkGetContentByIDsV2
./ng net.accelbyte.sdk.cli.Main ugc adminBulkGetContentByIDsV2 \
    --namespace "$AB_NAMESPACE" \
    --body '{"contentIds": ["873OrulT", "0Arvtjfp", "UyNMz7vg"]}' \
    > test.out 2>&1
eval_tap $? 112 'AdminBulkGetContentByIDsV2' test.out

#- 113 AdminGetContentBulkByShareCodesV2
./ng net.accelbyte.sdk.cli.Main ugc adminGetContentBulkByShareCodesV2 \
    --namespace "$AB_NAMESPACE" \
    --body '{"shareCodes": ["gDajUjeO", "jzfOM6sO", "eoiVNGzB"]}' \
    > test.out 2>&1
eval_tap $? 113 'AdminGetContentBulkByShareCodesV2' test.out

#- 114 AdminGetContentByShareCodeV2
./ng net.accelbyte.sdk.cli.Main ugc adminGetContentByShareCodeV2 \
    --namespace "$AB_NAMESPACE" \
    --shareCode 'kgeF5hsU' \
    > test.out 2>&1
eval_tap $? 114 'AdminGetContentByShareCodeV2' test.out

#- 115 AdminGetContentByContentIDV2
./ng net.accelbyte.sdk.cli.Main ugc adminGetContentByContentIDV2 \
    --contentId '3iAIgVc0' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 115 'AdminGetContentByContentIDV2' test.out

#- 116 RollbackContentVersionV2
./ng net.accelbyte.sdk.cli.Main ugc rollbackContentVersionV2 \
    --contentId 'W3HdHLMr' \
    --namespace "$AB_NAMESPACE" \
    --versionId 'MVeLriiS' \
    > test.out 2>&1
eval_tap $? 116 'RollbackContentVersionV2' test.out

#- 117 AdminUpdateScreenshotsV2
./ng net.accelbyte.sdk.cli.Main ugc adminUpdateScreenshotsV2 \
    --contentId 'E08Vi5CT' \
    --namespace "$AB_NAMESPACE" \
    --body '{"screenshots": [{"description": "vPP9eau8", "screenshotId": "9Wm9KHrP"}, {"description": "1JffhQfA", "screenshotId": "e4hE1FVO"}, {"description": "YOaeJAeC", "screenshotId": "kp9UanCt"}]}' \
    > test.out 2>&1
eval_tap $? 117 'AdminUpdateScreenshotsV2' test.out

#- 118 AdminUploadContentScreenshotV2
./ng net.accelbyte.sdk.cli.Main ugc adminUploadContentScreenshotV2 \
    --contentId 'pt8xKH3f' \
    --namespace "$AB_NAMESPACE" \
    --body '{"screenshots": [{"contentType": "NOmPna9L", "description": "F3oyH52p", "fileExtension": "pjp"}, {"contentType": "MuPint9D", "description": "ONfKAKFm", "fileExtension": "png"}, {"contentType": "m7pCh20g", "description": "FULPz3FA", "fileExtension": "jfif"}]}' \
    > test.out 2>&1
eval_tap $? 118 'AdminUploadContentScreenshotV2' test.out

#- 119 AdminDeleteContentScreenshotV2
./ng net.accelbyte.sdk.cli.Main ugc adminDeleteContentScreenshotV2 \
    --contentId 'BWVFHdkk' \
    --namespace "$AB_NAMESPACE" \
    --screenshotId 'vraTujyP' \
    > test.out 2>&1
eval_tap $? 119 'AdminDeleteContentScreenshotV2' test.out

#- 120 ListContentVersionsV2
./ng net.accelbyte.sdk.cli.Main ugc listContentVersionsV2 \
    --contentId 'Fg28qRlj' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 120 'ListContentVersionsV2' test.out

#- 121 AdminGetOfficialGroupContentsV2
./ng net.accelbyte.sdk.cli.Main ugc adminGetOfficialGroupContentsV2 \
    --groupId '7xi4Phpt' \
    --namespace "$AB_NAMESPACE" \
    --limit '63' \
    --offset '82' \
    > test.out 2>&1
eval_tap $? 121 'AdminGetOfficialGroupContentsV2' test.out

#- 122 AdminListStagingContents
./ng net.accelbyte.sdk.cli.Main ugc adminListStagingContents \
    --namespace "$AB_NAMESPACE" \
    --limit '41' \
    --offset '16' \
    --sortBy 'BBwzufjb' \
    --status 'yjGvNxM7' \
    > test.out 2>&1
eval_tap $? 122 'AdminListStagingContents' test.out

#- 123 AdminGetStagingContentByID
./ng net.accelbyte.sdk.cli.Main ugc adminGetStagingContentByID \
    --contentId 'u2JhZoBj' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 123 'AdminGetStagingContentByID' test.out

#- 124 AdminApproveStagingContent
./ng net.accelbyte.sdk.cli.Main ugc adminApproveStagingContent \
    --contentId 'jP6IoaVQ' \
    --namespace "$AB_NAMESPACE" \
    --body '{"approved": false, "note": "YaclPVJe"}' \
    > test.out 2>&1
eval_tap $? 124 'AdminApproveStagingContent' test.out

#- 125 AdminUpdateContentByShareCodeV2
./ng net.accelbyte.sdk.cli.Main ugc adminUpdateContentByShareCodeV2 \
    --channelId 'xHW6T89t' \
    --namespace "$AB_NAMESPACE" \
    --shareCode 'IiC4L8Zj' \
    --userId '1ydDR9de' \
    --body '{"customAttributes": {"eRQ58TWC": {}, "i1OgFINr": {}, "v6DdZKhI": {}}, "name": "wbZUsQUv", "shareCode": "ABbQMq6l", "subType": "J6SKJGWe", "tags": ["xrkPVAUL", "laPf9ADs", "H7YbuVPx"], "type": "xUpRLAvX"}' \
    > test.out 2>&1
eval_tap $? 125 'AdminUpdateContentByShareCodeV2' test.out

#- 126 AdminDeleteContentByShareCodeV2
./ng net.accelbyte.sdk.cli.Main ugc adminDeleteContentByShareCodeV2 \
    --channelId 'oV0HmH7G' \
    --namespace "$AB_NAMESPACE" \
    --shareCode 'aiDG5mvf' \
    --userId 'nda1mZn9' \
    > test.out 2>&1
eval_tap $? 126 'AdminDeleteContentByShareCodeV2' test.out

#- 127 AdminDeleteUserContentV2
./ng net.accelbyte.sdk.cli.Main ugc adminDeleteUserContentV2 \
    --channelId 'kL18mLLc' \
    --contentId 'ONvIdPhk' \
    --namespace "$AB_NAMESPACE" \
    --userId 'rE49MdjL' \
    > test.out 2>&1
eval_tap $? 127 'AdminDeleteUserContentV2' test.out

#- 128 AdminUpdateUserContentV2
./ng net.accelbyte.sdk.cli.Main ugc adminUpdateUserContentV2 \
    --channelId '9wv05fqt' \
    --contentId 'Bl8tnOOZ' \
    --namespace "$AB_NAMESPACE" \
    --userId 'yS2LgPhQ' \
    --body '{"customAttributes": {"TUf0NrPR": {}, "4lYsbJye": {}, "49o3svZL": {}}, "name": "JO7UKKoV", "shareCode": "xtEMm6vf", "subType": "lxuwCpOR", "tags": ["sChI6Yya", "RPynKgA6", "hWZs0qkX"], "type": "T1A9RWxW"}' \
    > test.out 2>&1
eval_tap $? 128 'AdminUpdateUserContentV2' test.out

#- 129 AdminUpdateUserContentFileLocation
./ng net.accelbyte.sdk.cli.Main ugc adminUpdateUserContentFileLocation \
    --channelId 'lJrNUMwS' \
    --contentId 'dfu9hWZf' \
    --namespace "$AB_NAMESPACE" \
    --userId 'KuWWjnA3' \
    --body '{"fileExtension": "qUOikni7", "fileLocation": "SZjcCFdQ"}' \
    > test.out 2>&1
eval_tap $? 129 'AdminUpdateUserContentFileLocation' test.out

#- 130 AdminGenerateUserContentUploadURLV2
./ng net.accelbyte.sdk.cli.Main ugc adminGenerateUserContentUploadURLV2 \
    --channelId 'bt2G2wQr' \
    --contentId 'iZzLHB2E' \
    --namespace "$AB_NAMESPACE" \
    --userId 'tDO4sUrO' \
    --body '{"contentType": "ejFWmQKr", "fileExtension": "OnTAMJ0X"}' \
    > test.out 2>&1
eval_tap $? 130 'AdminGenerateUserContentUploadURLV2' test.out

#- 131 AdminGetContentByUserIDV2
./ng net.accelbyte.sdk.cli.Main ugc adminGetContentByUserIDV2 \
    --namespace "$AB_NAMESPACE" \
    --userId 'RRiu1b8s' \
    --limit '52' \
    --offset '33' \
    --sortBy 'Cw7sdeZL' \
    > test.out 2>&1
eval_tap $? 131 'AdminGetContentByUserIDV2' test.out

#- 132 AdminUpdateContentHideStatusV2
./ng net.accelbyte.sdk.cli.Main ugc adminUpdateContentHideStatusV2 \
    --contentId 'AB2HKV3x' \
    --namespace "$AB_NAMESPACE" \
    --userId '9lQD9dyq' \
    --body '{"isHidden": true}' \
    > test.out 2>&1
eval_tap $? 132 'AdminUpdateContentHideStatusV2' test.out

#- 133 AdminGetUserGroupContentsV2
./ng net.accelbyte.sdk.cli.Main ugc adminGetUserGroupContentsV2 \
    --groupId '2VDCSUTz' \
    --namespace "$AB_NAMESPACE" \
    --userId 'r7UYTtNe' \
    --limit '60' \
    --offset '23' \
    > test.out 2>&1
eval_tap $? 133 'AdminGetUserGroupContentsV2' test.out

#- 134 AdminListUserStagingContents
./ng net.accelbyte.sdk.cli.Main ugc adminListUserStagingContents \
    --namespace "$AB_NAMESPACE" \
    --userId 'nBwZeMcL' \
    --limit '79' \
    --offset '8' \
    --sortBy 'TfQzyKz4' \
    --status 'W7VE790o' \
    > test.out 2>&1
eval_tap $? 134 'AdminListUserStagingContents' test.out

#- 135 PublicGetContentByChannelIDV2
./ng net.accelbyte.sdk.cli.Main ugc publicGetContentByChannelIDV2 \
    --channelId 'RmhbNuor' \
    --namespace "$AB_NAMESPACE" \
    --limit '22' \
    --name 'lDQ7nUCC' \
    --offset '76' \
    --sortBy 'v4Ix6dIo' \
    > test.out 2>&1
eval_tap $? 135 'PublicGetContentByChannelIDV2' test.out

#- 136 PublicListContentV2
./ng net.accelbyte.sdk.cli.Main ugc publicListContentV2 \
    --namespace "$AB_NAMESPACE" \
    --isOfficial  \
    --limit '22' \
    --name 'mbn8a66f' \
    --offset '60' \
    --sortBy '7WyYEas3' \
    --subType 'hwsI5NPX' \
    --tags 'Ujwldjm2,Pj922P1R,WZMsnOZS' \
    --type 'lXuplCDs' \
    > test.out 2>&1
eval_tap $? 136 'PublicListContentV2' test.out

#- 137 PublicBulkGetContentByIDV2
./ng net.accelbyte.sdk.cli.Main ugc publicBulkGetContentByIDV2 \
    --namespace "$AB_NAMESPACE" \
    --body '{"contentIds": ["PaZ5Le0a", "jhtbeqHn", "xezzrRsZ"]}' \
    > test.out 2>&1
eval_tap $? 137 'PublicBulkGetContentByIDV2' test.out

#- 138 PublicGetContentBulkByShareCodesV2
./ng net.accelbyte.sdk.cli.Main ugc publicGetContentBulkByShareCodesV2 \
    --namespace "$AB_NAMESPACE" \
    --body '{"shareCodes": ["QkZFyc7j", "mHSECCrP", "0BK8vHuu"]}' \
    > test.out 2>&1
eval_tap $? 138 'PublicGetContentBulkByShareCodesV2' test.out

#- 139 PublicGetContentByShareCodeV2
./ng net.accelbyte.sdk.cli.Main ugc publicGetContentByShareCodeV2 \
    --namespace "$AB_NAMESPACE" \
    --shareCode 'RyWPqYC6' \
    > test.out 2>&1
eval_tap $? 139 'PublicGetContentByShareCodeV2' test.out

#- 140 PublicGetContentByIDV2
./ng net.accelbyte.sdk.cli.Main ugc publicGetContentByIDV2 \
    --contentId 'l9dtiDeT' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 140 'PublicGetContentByIDV2' test.out

#- 141 PublicAddDownloadCountV2
./ng net.accelbyte.sdk.cli.Main ugc publicAddDownloadCountV2 \
    --contentId 'DKxyPEr5' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 141 'PublicAddDownloadCountV2' test.out

#- 142 PublicListContentDownloaderV2
./ng net.accelbyte.sdk.cli.Main ugc publicListContentDownloaderV2 \
    --contentId 'jOsk9yXF' \
    --namespace "$AB_NAMESPACE" \
    --limit '99' \
    --offset '11' \
    --sortBy 'KOPbOBnC' \
    --userId 'ZTD8XDyo' \
    > test.out 2>&1
eval_tap $? 142 'PublicListContentDownloaderV2' test.out

#- 143 PublicListContentLikeV2
./ng net.accelbyte.sdk.cli.Main ugc publicListContentLikeV2 \
    --contentId 'LVvnBtk1' \
    --namespace "$AB_NAMESPACE" \
    --limit '9' \
    --offset '59' \
    --sortBy 'pUaUrbM0' \
    > test.out 2>&1
eval_tap $? 143 'PublicListContentLikeV2' test.out

#- 144 UpdateContentLikeStatusV2
./ng net.accelbyte.sdk.cli.Main ugc updateContentLikeStatusV2 \
    --contentId 'k7Gv7ZoJ' \
    --namespace "$AB_NAMESPACE" \
    --body '{"likeStatus": false}' \
    > test.out 2>&1
eval_tap $? 144 'UpdateContentLikeStatusV2' test.out

#- 145 PublicCreateContentV2
./ng net.accelbyte.sdk.cli.Main ugc publicCreateContentV2 \
    --channelId '95hMcq9M' \
    --namespace "$AB_NAMESPACE" \
    --userId '8aSQc4Zd' \
    --body '{"contentType": "0BCVRNB2", "customAttributes": {"NhOgIgJH": {}, "yxQ1xcHg": {}, "cBztsoq1": {}}, "fileExtension": "r9fmkmul", "name": "8uJtP9Kx", "subType": "uKuHOXvP", "tags": ["CeDs5BZy", "9P8Le7zj", "0IM58OSo"], "type": "61Ktm91I"}' \
    > test.out 2>&1
eval_tap $? 145 'PublicCreateContentV2' test.out

#- 146 PublicUpdateContentByShareCodeV2
./ng net.accelbyte.sdk.cli.Main ugc publicUpdateContentByShareCodeV2 \
    --channelId '4VrxVF0G' \
    --namespace "$AB_NAMESPACE" \
    --shareCode 'vaBfMz38' \
    --userId '1LWPUI41' \
    --body '{"customAttributes": {"NoH9yGsq": {}, "v2sm44JF": {}, "eXiFfmVD": {}}, "name": "xO4SRP8t", "subType": "AknDi1Lr", "tags": ["RWTMsNSQ", "nHo3arTR", "0yESMdQD"], "type": "VO9rdn8o"}' \
    > test.out 2>&1
eval_tap $? 146 'PublicUpdateContentByShareCodeV2' test.out

#- 147 PublicDeleteContentByShareCodeV2
./ng net.accelbyte.sdk.cli.Main ugc publicDeleteContentByShareCodeV2 \
    --channelId 'yIfifr7x' \
    --namespace "$AB_NAMESPACE" \
    --shareCode 'XYVjFiTH' \
    --userId 'mg7zeck8' \
    > test.out 2>&1
eval_tap $? 147 'PublicDeleteContentByShareCodeV2' test.out

#- 148 PublicDeleteContentV2
./ng net.accelbyte.sdk.cli.Main ugc publicDeleteContentV2 \
    --channelId 'hCUbsBZf' \
    --contentId 'CoiCFTlw' \
    --namespace "$AB_NAMESPACE" \
    --userId '6RElENuy' \
    > test.out 2>&1
eval_tap $? 148 'PublicDeleteContentV2' test.out

#- 149 PublicUpdateContentV2
./ng net.accelbyte.sdk.cli.Main ugc publicUpdateContentV2 \
    --channelId 'EbFurwF0' \
    --contentId 'M7VAEatK' \
    --namespace "$AB_NAMESPACE" \
    --userId 'LTTGKq54' \
    --body '{"customAttributes": {"NagmCeGk": {}, "4fk3dfW3": {}, "I4AqCzJQ": {}}, "name": "1pWDcULY", "subType": "3hhOMtiA", "tags": ["uvpZoFEO", "LDfzOJIu", "46lqtrdE"], "type": "cPn0asmz"}' \
    > test.out 2>&1
eval_tap $? 149 'PublicUpdateContentV2' test.out

#- 150 PublicUpdateContentFileLocation
./ng net.accelbyte.sdk.cli.Main ugc publicUpdateContentFileLocation \
    --channelId 'HO7gT5Nr' \
    --contentId 'sng0SUfz' \
    --namespace "$AB_NAMESPACE" \
    --userId 'O0V6Ckgd' \
    --body '{"fileExtension": "OAYk1JKg", "fileLocation": "sRzgeU90"}' \
    > test.out 2>&1
eval_tap $? 150 'PublicUpdateContentFileLocation' test.out

#- 151 UpdateContentShareCodeV2
./ng net.accelbyte.sdk.cli.Main ugc updateContentShareCodeV2 \
    --channelId 'QDST9gtc' \
    --contentId 'Lxn80ets' \
    --namespace "$AB_NAMESPACE" \
    --userId 'RZ5dzuHC' \
    --body '{"shareCode": "CXMiIJwH"}' \
    > test.out 2>&1
eval_tap $? 151 'UpdateContentShareCodeV2' test.out

#- 152 PublicGenerateContentUploadURLV2
./ng net.accelbyte.sdk.cli.Main ugc publicGenerateContentUploadURLV2 \
    --channelId 'kD8TWWbs' \
    --contentId 'MKSHh5zh' \
    --namespace "$AB_NAMESPACE" \
    --userId 'lCrsbghy' \
    --body '{"contentType": "OFKrHgTy", "fileExtension": "e0ZA56RU"}' \
    > test.out 2>&1
eval_tap $? 152 'PublicGenerateContentUploadURLV2' test.out

#- 153 PublicGetContentByUserIDV2
./ng net.accelbyte.sdk.cli.Main ugc publicGetContentByUserIDV2 \
    --namespace "$AB_NAMESPACE" \
    --userId 'NYHh0p8E' \
    --limit '21' \
    --offset '48' \
    --sortBy 'p8Rd2v1S' \
    > test.out 2>&1
eval_tap $? 153 'PublicGetContentByUserIDV2' test.out

#- 154 UpdateScreenshotsV2
./ng net.accelbyte.sdk.cli.Main ugc updateScreenshotsV2 \
    --contentId 'M0PU9adK' \
    --namespace "$AB_NAMESPACE" \
    --userId 'bYVsti3I' \
    --body '{"screenshots": [{"description": "eeK1WH90", "screenshotId": "lNXROqNr"}, {"description": "dtNUm4Ry", "screenshotId": "BTrBvDJf"}, {"description": "amrxq7Ec", "screenshotId": "uDjAEGNc"}]}' \
    > test.out 2>&1
eval_tap $? 154 'UpdateScreenshotsV2' test.out

#- 155 UploadContentScreenshotV2
./ng net.accelbyte.sdk.cli.Main ugc uploadContentScreenshotV2 \
    --contentId 'I72pSqVn' \
    --namespace "$AB_NAMESPACE" \
    --userId '5n64xLz0' \
    --body '{"screenshots": [{"contentType": "TfoamnS3", "description": "STOnHKMY", "fileExtension": "jpeg"}, {"contentType": "Bo9XKdEV", "description": "TaZNY85x", "fileExtension": "jpg"}, {"contentType": "r0171SlD", "description": "gYaYchzb", "fileExtension": "pjp"}]}' \
    > test.out 2>&1
eval_tap $? 155 'UploadContentScreenshotV2' test.out

#- 156 DeleteContentScreenshotV2
./ng net.accelbyte.sdk.cli.Main ugc deleteContentScreenshotV2 \
    --contentId '3sSD6CFw' \
    --namespace "$AB_NAMESPACE" \
    --screenshotId 'PaxyHJbO' \
    --userId 'esehRCVi' \
    > test.out 2>&1
eval_tap $? 156 'DeleteContentScreenshotV2' test.out

#- 157 PublicGetGroupContentsV2
./ng net.accelbyte.sdk.cli.Main ugc publicGetGroupContentsV2 \
    --groupId 'P53peOjz' \
    --namespace "$AB_NAMESPACE" \
    --userId '1k1gN9Pm' \
    --limit '60' \
    --offset '92' \
    > test.out 2>&1
eval_tap $? 157 'PublicGetGroupContentsV2' test.out

#- 158 ListUserStagingContents
./ng net.accelbyte.sdk.cli.Main ugc listUserStagingContents \
    --namespace "$AB_NAMESPACE" \
    --userId 'wPTmKcdq' \
    --limit '6' \
    --offset '56' \
    --sortBy 'WK1uKFxu' \
    --status 'bE6r5hQg' \
    > test.out 2>&1
eval_tap $? 158 'ListUserStagingContents' test.out

#- 159 GetUserStagingContentByID
./ng net.accelbyte.sdk.cli.Main ugc getUserStagingContentByID \
    --contentId 'cWkTLeL0' \
    --namespace "$AB_NAMESPACE" \
    --userId 'O0dJg3Cf' \
    > test.out 2>&1
eval_tap $? 159 'GetUserStagingContentByID' test.out

#- 160 UpdateStagingContent
./ng net.accelbyte.sdk.cli.Main ugc updateStagingContent \
    --contentId 'kVaLubKU' \
    --namespace "$AB_NAMESPACE" \
    --userId 'X41BtZpS' \
    --body '{"fileExtension": "iYiGMtbb", "fileLocation": "ShNZ4A7t"}' \
    > test.out 2>&1
eval_tap $? 160 'UpdateStagingContent' test.out

#- 161 DeleteUserStagingContentByID
./ng net.accelbyte.sdk.cli.Main ugc deleteUserStagingContentByID \
    --contentId 'MgJqwqZ3' \
    --namespace "$AB_NAMESPACE" \
    --userId 'ZtYgCkjj' \
    > test.out 2>&1
eval_tap $? 161 'DeleteUserStagingContentByID' test.out


rm -f "tmp.dat"

exit $EXIT_CODE