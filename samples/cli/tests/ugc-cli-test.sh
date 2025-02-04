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
    --limit '77' \
    --offset '37' \
    > test.out 2>&1
eval_tap $? 2 'SingleAdminGetChannel' test.out

#- 3 AdminCreateChannel
./ng net.accelbyte.sdk.cli.Main ugc adminCreateChannel \
    --namespace "$AB_NAMESPACE" \
    --body '{"id": "BaztkpE1", "name": "QQwdnNBF"}' \
    > test.out 2>&1
eval_tap $? 3 'AdminCreateChannel' test.out

#- 4 SingleAdminUpdateChannel
./ng net.accelbyte.sdk.cli.Main ugc singleAdminUpdateChannel \
    --channelId 'tqQFrPEY' \
    --namespace "$AB_NAMESPACE" \
    --body '{"name": "C75cvhE0"}' \
    > test.out 2>&1
eval_tap $? 4 'SingleAdminUpdateChannel' test.out

#- 5 SingleAdminDeleteChannel
./ng net.accelbyte.sdk.cli.Main ugc singleAdminDeleteChannel \
    --channelId 'CdamZC8u' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 5 'SingleAdminDeleteChannel' test.out

#- 6 AdminUploadContentDirect
eval_tap 0 6 'AdminUploadContentDirect # SKIP deprecated' test.out

#- 7 AdminUploadContentS3
./ng net.accelbyte.sdk.cli.Main ugc adminUploadContentS3 \
    --channelId 'ADXG3geh' \
    --namespace "$AB_NAMESPACE" \
    --body '{"contentType": "FafYl1iq", "customAttributes": {"8wtS82z5": {}, "jhhVomB7": {}, "lFeHvQhb": {}}, "fileExtension": "yLrgB5mC", "name": "Vfmdc7Ux", "preview": "0JWJw9bS", "previewMetadata": {"previewContentType": "UvyhXyNu", "previewFileExtension": "yPlkGjiI"}, "shareCode": "JU0KIsFD", "subType": "HzO9unao", "tags": ["aB9Vg1vB", "U1uIh7vH", "zHI2AnVb"], "type": "OCir4nl1"}' \
    > test.out 2>&1
eval_tap $? 7 'AdminUploadContentS3' test.out

#- 8 SingleAdminUpdateContentS3
./ng net.accelbyte.sdk.cli.Main ugc singleAdminUpdateContentS3 \
    --channelId 'C59zcyje' \
    --contentId 'z6ruuUIG' \
    --namespace "$AB_NAMESPACE" \
    --body '{"contentType": "zVbaxsyA", "customAttributes": {"pL1s9CZz": {}, "qhfPL8aO": {}, "6HebWSig": {}}, "fileExtension": "jYUwZpLM", "name": "cS4tnbsa", "payload": "Rt6RJWYj", "preview": "3tCm8HFz", "previewMetadata": {"previewContentType": "fq03uUzo", "previewFileExtension": "wJdITkEx"}, "shareCode": "oM7BzM8s", "subType": "2YsuipZG", "tags": ["iocnapFf", "ubWSFaQY", "FMCj4DyY"], "type": "n8pGSyIi", "updateContentFile": false}' \
    > test.out 2>&1
eval_tap $? 8 'SingleAdminUpdateContentS3' test.out

#- 9 AdminSearchChannelSpecificContent
./ng net.accelbyte.sdk.cli.Main ugc adminSearchChannelSpecificContent \
    --channelId 'LGipYJxk' \
    --namespace "$AB_NAMESPACE" \
    --creator 'zW2Ob62K' \
    --ishidden 'MQ24TS5J' \
    --isofficial 'HhvgTmsp' \
    --limit '4' \
    --name '2TCKDYgd' \
    --offset '11' \
    --orderby 'Q7DGBYF3' \
    --sortby 'FMrkOYbB' \
    --subtype 'miWJgKRy' \
    --tags 'pH7poS8x,Ly66liKe,qQTVoChO' \
    --type 'ekRAdLrN' \
    --userId 'fegvjy3v' \
    > test.out 2>&1
eval_tap $? 9 'AdminSearchChannelSpecificContent' test.out

#- 10 SingleAdminUpdateContentDirect
eval_tap 0 10 'SingleAdminUpdateContentDirect # SKIP deprecated' test.out

#- 11 SingleAdminDeleteContent
./ng net.accelbyte.sdk.cli.Main ugc singleAdminDeleteContent \
    --channelId 'MN4NpXEf' \
    --contentId '5Uhm3UGU' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 11 'SingleAdminDeleteContent' test.out

#- 12 SingleAdminGetContent
./ng net.accelbyte.sdk.cli.Main ugc singleAdminGetContent \
    --namespace "$AB_NAMESPACE" \
    --limit '9' \
    --offset '47' \
    > test.out 2>&1
eval_tap $? 12 'SingleAdminGetContent' test.out

#- 13 AdminGetContentBulk
./ng net.accelbyte.sdk.cli.Main ugc adminGetContentBulk \
    --namespace "$AB_NAMESPACE" \
    --body '{"contentIds": ["IzrCGt72", "iPDh1fz9", "66EGbapn"]}' \
    > test.out 2>&1
eval_tap $? 13 'AdminGetContentBulk' test.out

#- 14 AdminSearchContent
./ng net.accelbyte.sdk.cli.Main ugc adminSearchContent \
    --namespace "$AB_NAMESPACE" \
    --creator 'Ju7XH6th' \
    --ishidden 'tEK6nRi5' \
    --isofficial '17V4LF5t' \
    --limit '31' \
    --name '7rITBbBZ' \
    --offset '31' \
    --orderby 'nVlxAmT2' \
    --sortby 'eesffF5v' \
    --subtype 'aBRC8AmJ' \
    --tags 'pa9swK4P,OOJTbpnU,wgMfY7iM' \
    --type 'iGdgroHN' \
    --userId 'WaqLpyYA' \
    > test.out 2>&1
eval_tap $? 14 'AdminSearchContent' test.out

#- 15 AdminGetContentBulkByShareCodes
./ng net.accelbyte.sdk.cli.Main ugc adminGetContentBulkByShareCodes \
    --namespace "$AB_NAMESPACE" \
    --body '{"shareCodes": ["bXPFkvZT", "77qQU1d6", "yS0DnpRz"]}' \
    > test.out 2>&1
eval_tap $? 15 'AdminGetContentBulkByShareCodes' test.out

#- 16 AdminGetUserContentByShareCode
./ng net.accelbyte.sdk.cli.Main ugc adminGetUserContentByShareCode \
    --namespace "$AB_NAMESPACE" \
    --shareCode 'ejyAZJOv' \
    > test.out 2>&1
eval_tap $? 16 'AdminGetUserContentByShareCode' test.out

#- 17 AdminGetSpecificContent
./ng net.accelbyte.sdk.cli.Main ugc adminGetSpecificContent \
    --contentId 'aLxL5Rol' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 17 'AdminGetSpecificContent' test.out

#- 18 AdminDownloadContentPreview
./ng net.accelbyte.sdk.cli.Main ugc adminDownloadContentPreview \
    --contentId 'kPNTad1S' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 18 'AdminDownloadContentPreview' test.out

#- 19 RollbackContentVersion
./ng net.accelbyte.sdk.cli.Main ugc rollbackContentVersion \
    --contentId 'xIIw70xJ' \
    --namespace "$AB_NAMESPACE" \
    --versionId 'ipOmmfrt' \
    > test.out 2>&1
eval_tap $? 19 'RollbackContentVersion' test.out

#- 20 AdminUpdateScreenshots
./ng net.accelbyte.sdk.cli.Main ugc adminUpdateScreenshots \
    --contentId 'l0IziocL' \
    --namespace "$AB_NAMESPACE" \
    --body '{"screenshots": [{"description": "gl7rxKcY", "screenshotId": "yG6Yvnn0"}, {"description": "tThLhzxp", "screenshotId": "NHInTTjl"}, {"description": "0NsPPzkO", "screenshotId": "8xJToSke"}]}' \
    > test.out 2>&1
eval_tap $? 20 'AdminUpdateScreenshots' test.out

#- 21 AdminUploadContentScreenshot
./ng net.accelbyte.sdk.cli.Main ugc adminUploadContentScreenshot \
    --contentId 'rThe6YfW' \
    --namespace "$AB_NAMESPACE" \
    --body '{"screenshots": [{"contentType": "f1nVihBf", "description": "ko7OI1Li", "fileExtension": "jfif"}, {"contentType": "Oqb82X3o", "description": "PPZOCQWp", "fileExtension": "bmp"}, {"contentType": "LUhLT3Bs", "description": "pFuKtONV", "fileExtension": "jfif"}]}' \
    > test.out 2>&1
eval_tap $? 21 'AdminUploadContentScreenshot' test.out

#- 22 AdminDeleteContentScreenshot
./ng net.accelbyte.sdk.cli.Main ugc adminDeleteContentScreenshot \
    --contentId 'lGBoPYX4' \
    --namespace "$AB_NAMESPACE" \
    --screenshotId 'IW9aqqLM' \
    > test.out 2>&1
eval_tap $? 22 'AdminDeleteContentScreenshot' test.out

#- 23 ListContentVersions
./ng net.accelbyte.sdk.cli.Main ugc listContentVersions \
    --contentId '6hlFjTiD' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 23 'ListContentVersions' test.out

#- 24 SingleAdminGetAllGroups
./ng net.accelbyte.sdk.cli.Main ugc singleAdminGetAllGroups \
    --namespace "$AB_NAMESPACE" \
    --limit '36' \
    --offset '31' \
    > test.out 2>&1
eval_tap $? 24 'SingleAdminGetAllGroups' test.out

#- 25 AdminCreateGroup
./ng net.accelbyte.sdk.cli.Main ugc adminCreateGroup \
    --namespace "$AB_NAMESPACE" \
    --body '{"contents": ["LGFzMPov", "LTdVWIXC", "yZSiROSy"], "name": "k7savxkk"}' \
    > test.out 2>&1
eval_tap $? 25 'AdminCreateGroup' test.out

#- 26 SingleAdminGetGroup
./ng net.accelbyte.sdk.cli.Main ugc singleAdminGetGroup \
    --groupId 'h3blAFVQ' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 26 'SingleAdminGetGroup' test.out

#- 27 SingleAdminUpdateGroup
./ng net.accelbyte.sdk.cli.Main ugc singleAdminUpdateGroup \
    --groupId '5JbwmxPK' \
    --namespace "$AB_NAMESPACE" \
    --body '{"contents": ["2R2oxJBu", "Hp0LaMYP", "hNAnXYV0"], "name": "wjbxhdbz"}' \
    > test.out 2>&1
eval_tap $? 27 'SingleAdminUpdateGroup' test.out

#- 28 SingleAdminDeleteGroup
./ng net.accelbyte.sdk.cli.Main ugc singleAdminDeleteGroup \
    --groupId 'AdGBQ6gJ' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 28 'SingleAdminDeleteGroup' test.out

#- 29 SingleAdminGetGroupContents
./ng net.accelbyte.sdk.cli.Main ugc singleAdminGetGroupContents \
    --groupId 'raYphuY0' \
    --namespace "$AB_NAMESPACE" \
    --limit '34' \
    --offset '2' \
    > test.out 2>&1
eval_tap $? 29 'SingleAdminGetGroupContents' test.out

#- 30 AdminGetTag
./ng net.accelbyte.sdk.cli.Main ugc adminGetTag \
    --namespace "$AB_NAMESPACE" \
    --limit '52' \
    --offset '7' \
    > test.out 2>&1
eval_tap $? 30 'AdminGetTag' test.out

#- 31 AdminCreateTag
./ng net.accelbyte.sdk.cli.Main ugc adminCreateTag \
    --namespace "$AB_NAMESPACE" \
    --body '{"tag": "SB9ekYff"}' \
    > test.out 2>&1
eval_tap $? 31 'AdminCreateTag' test.out

#- 32 AdminUpdateTag
./ng net.accelbyte.sdk.cli.Main ugc adminUpdateTag \
    --namespace "$AB_NAMESPACE" \
    --tagId 'vbTK3rcj' \
    --body '{"tag": "nnA0SAIK"}' \
    > test.out 2>&1
eval_tap $? 32 'AdminUpdateTag' test.out

#- 33 AdminDeleteTag
./ng net.accelbyte.sdk.cli.Main ugc adminDeleteTag \
    --namespace "$AB_NAMESPACE" \
    --tagId 'NR9sYevN' \
    > test.out 2>&1
eval_tap $? 33 'AdminDeleteTag' test.out

#- 34 AdminGetType
./ng net.accelbyte.sdk.cli.Main ugc adminGetType \
    --namespace "$AB_NAMESPACE" \
    --limit '10' \
    --offset '53' \
    > test.out 2>&1
eval_tap $? 34 'AdminGetType' test.out

#- 35 AdminCreateType
./ng net.accelbyte.sdk.cli.Main ugc adminCreateType \
    --namespace "$AB_NAMESPACE" \
    --body '{"subtype": ["eaN3sCaV", "1zP7C7xS", "tVEPKCiV"], "type": "8W0kh0eF"}' \
    > test.out 2>&1
eval_tap $? 35 'AdminCreateType' test.out

#- 36 AdminUpdateType
./ng net.accelbyte.sdk.cli.Main ugc adminUpdateType \
    --namespace "$AB_NAMESPACE" \
    --typeId 'TNxQJcvG' \
    --body '{"subtype": ["KojQAptD", "IT6GY6SS", "RnAprBGn"], "type": "KDlZyy89"}' \
    > test.out 2>&1
eval_tap $? 36 'AdminUpdateType' test.out

#- 37 AdminDeleteType
./ng net.accelbyte.sdk.cli.Main ugc adminDeleteType \
    --namespace "$AB_NAMESPACE" \
    --typeId 'HzLm05Yp' \
    > test.out 2>&1
eval_tap $? 37 'AdminDeleteType' test.out

#- 38 AdminGetChannel
./ng net.accelbyte.sdk.cli.Main ugc adminGetChannel \
    --namespace "$AB_NAMESPACE" \
    --userId '6nkNq7sb' \
    --limit '94' \
    --name '1Dxv8ohT' \
    --offset '38' \
    > test.out 2>&1
eval_tap $? 38 'AdminGetChannel' test.out

#- 39 AdminDeleteAllUserChannels
./ng net.accelbyte.sdk.cli.Main ugc adminDeleteAllUserChannels \
    --namespace "$AB_NAMESPACE" \
    --userId '3VgBbmRo' \
    > test.out 2>&1
eval_tap $? 39 'AdminDeleteAllUserChannels' test.out

#- 40 AdminUpdateChannel
./ng net.accelbyte.sdk.cli.Main ugc adminUpdateChannel \
    --channelId 'mqTLPiKY' \
    --namespace "$AB_NAMESPACE" \
    --userId 'Pjyqbr7X' \
    --body '{"name": "etly48y8"}' \
    > test.out 2>&1
eval_tap $? 40 'AdminUpdateChannel' test.out

#- 41 AdminDeleteChannel
./ng net.accelbyte.sdk.cli.Main ugc adminDeleteChannel \
    --channelId 'xj1aNHQw' \
    --namespace "$AB_NAMESPACE" \
    --userId 'qDbPQ2uM' \
    > test.out 2>&1
eval_tap $? 41 'AdminDeleteChannel' test.out

#- 42 AdminUpdateContentS3ByShareCode
./ng net.accelbyte.sdk.cli.Main ugc adminUpdateContentS3ByShareCode \
    --channelId '1uSjX7Be' \
    --namespace "$AB_NAMESPACE" \
    --shareCode 'fb6yqAfL' \
    --userId 'C9Vvj3x8' \
    --body '{"contentType": "xCJ6jaGE", "customAttributes": {"4pb5kNBi": {}, "uRtrVQIP": {}, "zcPwyV88": {}}, "fileExtension": "q8a00oG4", "name": "jeV8NjMH", "payload": "gFTDdGU6", "preview": "tT1uY37e", "previewMetadata": {"previewContentType": "M4QWitK6", "previewFileExtension": "UA5Uq1QB"}, "shareCode": "ZxIOG3VF", "subType": "JydJJuKO", "tags": ["wBAm5vyq", "OFa8mCjI", "7ndCiOIi"], "type": "63xOlGRB", "updateContentFile": true}' \
    > test.out 2>&1
eval_tap $? 42 'AdminUpdateContentS3ByShareCode' test.out

#- 43 AdminUpdateContentS3
./ng net.accelbyte.sdk.cli.Main ugc adminUpdateContentS3 \
    --channelId 'fLAHeN9C' \
    --contentId 'xAhGrfdr' \
    --namespace "$AB_NAMESPACE" \
    --userId 'XlB0nhj1' \
    --body '{"contentType": "MDi20r08", "customAttributes": {"O6azdLDM": {}, "WzmS1qQe": {}, "TecG7wH8": {}}, "fileExtension": "VcyA11Ji", "name": "2BXAECzC", "payload": "oOdXBHeZ", "preview": "B9KGtl1L", "previewMetadata": {"previewContentType": "g6DtDeVs", "previewFileExtension": "hFZtL4uh"}, "shareCode": "ouOISGAb", "subType": "q9MnNI7g", "tags": ["VUAEfHpI", "rRk1CRh7", "3bVi8CW2"], "type": "6XE0o5f2", "updateContentFile": true}' \
    > test.out 2>&1
eval_tap $? 43 'AdminUpdateContentS3' test.out

#- 44 DeleteContentByShareCode
./ng net.accelbyte.sdk.cli.Main ugc deleteContentByShareCode \
    --channelId 'Z6nK0edn' \
    --namespace "$AB_NAMESPACE" \
    --shareCode '3VevjY1a' \
    --userId 'on3aRl4C' \
    > test.out 2>&1
eval_tap $? 44 'DeleteContentByShareCode' test.out

#- 45 AdminUpdateContentDirect
eval_tap 0 45 'AdminUpdateContentDirect # SKIP deprecated' test.out

#- 46 AdminDeleteContent
./ng net.accelbyte.sdk.cli.Main ugc adminDeleteContent \
    --channelId '6iYXEUMi' \
    --contentId 'j47Uh1tl' \
    --namespace "$AB_NAMESPACE" \
    --userId 'PX7CzTiC' \
    > test.out 2>&1
eval_tap $? 46 'AdminDeleteContent' test.out

#- 47 AdminGetContent
./ng net.accelbyte.sdk.cli.Main ugc adminGetContent \
    --namespace "$AB_NAMESPACE" \
    --userId 'oZaedxke' \
    --limit '79' \
    --offset '95' \
    > test.out 2>&1
eval_tap $? 47 'AdminGetContent' test.out

#- 48 AdminDeleteAllUserContents
./ng net.accelbyte.sdk.cli.Main ugc adminDeleteAllUserContents \
    --namespace "$AB_NAMESPACE" \
    --userId 'D2IhoVdn' \
    > test.out 2>&1
eval_tap $? 48 'AdminDeleteAllUserContents' test.out

#- 49 AdminHideUserContent
./ng net.accelbyte.sdk.cli.Main ugc adminHideUserContent \
    --contentId 'YAr5bQdu' \
    --namespace "$AB_NAMESPACE" \
    --userId '7s2HMfvz' \
    --body '{"isHidden": true}' \
    > test.out 2>&1
eval_tap $? 49 'AdminHideUserContent' test.out

#- 50 AdminGetAllGroups
./ng net.accelbyte.sdk.cli.Main ugc adminGetAllGroups \
    --namespace "$AB_NAMESPACE" \
    --userId 'TI4Y9pgr' \
    --limit '77' \
    --offset '98' \
    > test.out 2>&1
eval_tap $? 50 'AdminGetAllGroups' test.out

#- 51 AdminDeleteAllUserGroup
./ng net.accelbyte.sdk.cli.Main ugc adminDeleteAllUserGroup \
    --namespace "$AB_NAMESPACE" \
    --userId 'xsj0D3Ul' \
    > test.out 2>&1
eval_tap $? 51 'AdminDeleteAllUserGroup' test.out

#- 52 AdminGetGroup
./ng net.accelbyte.sdk.cli.Main ugc adminGetGroup \
    --groupId 'CNhf7o3e' \
    --namespace "$AB_NAMESPACE" \
    --userId 'KM9RqhmY' \
    > test.out 2>&1
eval_tap $? 52 'AdminGetGroup' test.out

#- 53 AdminUpdateGroup
./ng net.accelbyte.sdk.cli.Main ugc adminUpdateGroup \
    --groupId 'evzbKUwS' \
    --namespace "$AB_NAMESPACE" \
    --userId '2v1LhUDR' \
    --body '{"contents": ["DNX11gnj", "Nt9XWj2u", "0qSFCHYL"], "name": "McXU201T"}' \
    > test.out 2>&1
eval_tap $? 53 'AdminUpdateGroup' test.out

#- 54 AdminDeleteGroup
./ng net.accelbyte.sdk.cli.Main ugc adminDeleteGroup \
    --groupId 'lQmhJibT' \
    --namespace "$AB_NAMESPACE" \
    --userId 'G70V9QhL' \
    > test.out 2>&1
eval_tap $? 54 'AdminDeleteGroup' test.out

#- 55 AdminGetGroupContents
./ng net.accelbyte.sdk.cli.Main ugc adminGetGroupContents \
    --groupId 'lWfIHS7X' \
    --namespace "$AB_NAMESPACE" \
    --userId 'QbYEcU0X' \
    --limit '86' \
    --offset '81' \
    > test.out 2>&1
eval_tap $? 55 'AdminGetGroupContents' test.out

#- 56 AdminDeleteAllUserStates
./ng net.accelbyte.sdk.cli.Main ugc adminDeleteAllUserStates \
    --namespace "$AB_NAMESPACE" \
    --userId 'IxoM9Cqg' \
    > test.out 2>&1
eval_tap $? 56 'AdminDeleteAllUserStates' test.out

#- 57 SearchChannelSpecificContent
./ng net.accelbyte.sdk.cli.Main ugc searchChannelSpecificContent \
    --channelId 'H578YFQx' \
    --namespace "$AB_NAMESPACE" \
    --creator 'B45AUjdj' \
    --ishidden 'wPP20hCl' \
    --isofficial '1NMJfwH2' \
    --limit '45' \
    --name 'V5mFqBWl' \
    --offset '2' \
    --orderby 'rKotaB3M' \
    --sortby 'bM3wVZeu' \
    --subtype '0hYvGVL6' \
    --tags 'EaQDIXXl,9CaN4BeG,PfQ7fzX9' \
    --type 'gj7X9p2R' \
    --userId 'ZFmAfXUK' \
    > test.out 2>&1
eval_tap $? 57 'SearchChannelSpecificContent' test.out

#- 58 PublicSearchContent
./ng net.accelbyte.sdk.cli.Main ugc publicSearchContent \
    --namespace "$AB_NAMESPACE" \
    --creator 'EEf84et4' \
    --ishidden 'N2PwodXX' \
    --isofficial '2AkeQPGy' \
    --limit '20' \
    --name 'SO3btini' \
    --offset '100' \
    --orderby 'p22ZINRQ' \
    --sortby 'VQji7I8v' \
    --subtype '7uif6ivF' \
    --tags 'WlhK7Uqb,lcxGwVYJ,nyVvRKp5' \
    --type '7bOGnHI4' \
    --userId 'dmcH99zZ' \
    > test.out 2>&1
eval_tap $? 58 'PublicSearchContent' test.out

#- 59 PublicGetContentBulk
./ng net.accelbyte.sdk.cli.Main ugc publicGetContentBulk \
    --namespace "$AB_NAMESPACE" \
    --body '{"contentIds": ["Vc5sKXEC", "V03tfBw5", "ipBPeHUs"]}' \
    > test.out 2>&1
eval_tap $? 59 'PublicGetContentBulk' test.out

#- 60 GetFollowedContent
./ng net.accelbyte.sdk.cli.Main ugc getFollowedContent \
    --namespace "$AB_NAMESPACE" \
    --limit '68' \
    --offset '9' \
    > test.out 2>&1
eval_tap $? 60 'GetFollowedContent' test.out

#- 61 GetLikedContent
./ng net.accelbyte.sdk.cli.Main ugc getLikedContent \
    --namespace "$AB_NAMESPACE" \
    --isofficial  \
    --limit '78' \
    --name 'JMEtiEuL' \
    --offset '61' \
    --orderby 'aVcviuMT' \
    --sortby 'p7itvDSO' \
    --subtype 'P7UEqSXl' \
    --tags 'kqpl19RX,Yd0VvCH1,wbflzbtZ' \
    --type '5xt5n8H9' \
    > test.out 2>&1
eval_tap $? 61 'GetLikedContent' test.out

#- 62 PublicGetContentBulkByShareCodes
./ng net.accelbyte.sdk.cli.Main ugc publicGetContentBulkByShareCodes \
    --namespace "$AB_NAMESPACE" \
    --body '{"shareCodes": ["3FzWwS5U", "jSw90H3C", "AvxoT7pt"]}' \
    > test.out 2>&1
eval_tap $? 62 'PublicGetContentBulkByShareCodes' test.out

#- 63 PublicDownloadContentByShareCode
./ng net.accelbyte.sdk.cli.Main ugc publicDownloadContentByShareCode \
    --namespace "$AB_NAMESPACE" \
    --shareCode '3PkKN7xZ' \
    > test.out 2>&1
eval_tap $? 63 'PublicDownloadContentByShareCode' test.out

#- 64 PublicDownloadContentByContentID
./ng net.accelbyte.sdk.cli.Main ugc publicDownloadContentByContentID \
    --contentId 'J5UpdEQi' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 64 'PublicDownloadContentByContentID' test.out

#- 65 AddDownloadCount
./ng net.accelbyte.sdk.cli.Main ugc addDownloadCount \
    --contentId '9A18omD8' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 65 'AddDownloadCount' test.out

#- 66 UpdateContentLikeStatus
./ng net.accelbyte.sdk.cli.Main ugc updateContentLikeStatus \
    --contentId 'G6WCXnUd' \
    --namespace "$AB_NAMESPACE" \
    --body '{"likeStatus": false}' \
    > test.out 2>&1
eval_tap $? 66 'UpdateContentLikeStatus' test.out

#- 67 PublicDownloadContentPreview
./ng net.accelbyte.sdk.cli.Main ugc publicDownloadContentPreview \
    --contentId 'D5Wvq06W' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 67 'PublicDownloadContentPreview' test.out

#- 68 GetTag
./ng net.accelbyte.sdk.cli.Main ugc getTag \
    --namespace "$AB_NAMESPACE" \
    --limit '18' \
    --offset '14' \
    > test.out 2>&1
eval_tap $? 68 'GetTag' test.out

#- 69 GetType
./ng net.accelbyte.sdk.cli.Main ugc getType \
    --namespace "$AB_NAMESPACE" \
    --limit '11' \
    --offset '47' \
    > test.out 2>&1
eval_tap $? 69 'GetType' test.out

#- 70 PublicSearchCreator
./ng net.accelbyte.sdk.cli.Main ugc publicSearchCreator \
    --namespace "$AB_NAMESPACE" \
    --limit '8' \
    --offset '15' \
    --orderby 'xzpq8qQr' \
    --sortby 'd0u3T474' \
    > test.out 2>&1
eval_tap $? 70 'PublicSearchCreator' test.out

#- 71 GetFollowedUsers
./ng net.accelbyte.sdk.cli.Main ugc getFollowedUsers \
    --namespace "$AB_NAMESPACE" \
    --limit '38' \
    --offset '83' \
    > test.out 2>&1
eval_tap $? 71 'GetFollowedUsers' test.out

#- 72 PublicGetCreator
./ng net.accelbyte.sdk.cli.Main ugc publicGetCreator \
    --namespace "$AB_NAMESPACE" \
    --userId 'ZMPBNeSO' \
    > test.out 2>&1
eval_tap $? 72 'PublicGetCreator' test.out

#- 73 GetChannels
./ng net.accelbyte.sdk.cli.Main ugc getChannels \
    --namespace "$AB_NAMESPACE" \
    --userId 'kWhInKPP' \
    --limit '29' \
    --name 'RrCZ9FGa' \
    --offset '27' \
    > test.out 2>&1
eval_tap $? 73 'GetChannels' test.out

#- 74 PublicCreateChannel
./ng net.accelbyte.sdk.cli.Main ugc publicCreateChannel \
    --namespace "$AB_NAMESPACE" \
    --userId 'KU1j02Lt' \
    --body '{"name": "o1kPCHNu"}' \
    > test.out 2>&1
eval_tap $? 74 'PublicCreateChannel' test.out

#- 75 DeleteAllUserChannel
./ng net.accelbyte.sdk.cli.Main ugc deleteAllUserChannel \
    --namespace "$AB_NAMESPACE" \
    --userId 'Z09SkmEt' \
    > test.out 2>&1
eval_tap $? 75 'DeleteAllUserChannel' test.out

#- 76 UpdateChannel
./ng net.accelbyte.sdk.cli.Main ugc updateChannel \
    --channelId 'wixZoV1y' \
    --namespace "$AB_NAMESPACE" \
    --userId 'A0xbKTiC' \
    --body '{"name": "Pc2tsMVy"}' \
    > test.out 2>&1
eval_tap $? 76 'UpdateChannel' test.out

#- 77 DeleteChannel
./ng net.accelbyte.sdk.cli.Main ugc deleteChannel \
    --channelId 'QAYVkrdV' \
    --namespace "$AB_NAMESPACE" \
    --userId 'm7Zoh0Jf' \
    > test.out 2>&1
eval_tap $? 77 'DeleteChannel' test.out

#- 78 CreateContentDirect
eval_tap 0 78 'CreateContentDirect # SKIP deprecated' test.out

#- 79 CreateContentS3
./ng net.accelbyte.sdk.cli.Main ugc createContentS3 \
    --channelId 'PBXIbvzo' \
    --namespace "$AB_NAMESPACE" \
    --userId 'PVxq2WpN' \
    --body '{"contentType": "k9hdnhqz", "customAttributes": {"n54o3anG": {}, "jo9gAB7v": {}, "2mwNTRdS": {}}, "fileExtension": "4kPmuzbB", "name": "UQAaopeI", "preview": "iEyUf2e2", "previewMetadata": {"previewContentType": "4YpV6M4I", "previewFileExtension": "xlMv3zhd"}, "subType": "o0FGYsHG", "tags": ["yIfj1jIX", "rFJtcqMp", "1QSPuBEC"], "type": "zou22d10"}' \
    > test.out 2>&1
eval_tap $? 79 'CreateContentS3' test.out

#- 80 PublicUpdateContentByShareCode
./ng net.accelbyte.sdk.cli.Main ugc publicUpdateContentByShareCode \
    --channelId '7tvZB9Q8' \
    --namespace "$AB_NAMESPACE" \
    --shareCode 'O4HGsatH' \
    --userId 'aBy2aNPY' \
    --body '{"contentType": "EopTYudR", "customAttributes": {"s1sNv5BL": {}, "vyjSSH7q": {}, "zHYNSh1z": {}}, "fileExtension": "RmGAmP9m", "name": "DxgpJIJe", "payload": "4HP8bzEB", "preview": "fQFmdn4A", "previewMetadata": {"previewContentType": "UzNVf1Uf", "previewFileExtension": "no0puZCU"}, "subType": "EdrDJmal", "tags": ["o9TAuWx4", "NzxePYHP", "Bi7VDOv5"], "type": "tBwS93md", "updateContentFile": true}' \
    > test.out 2>&1
eval_tap $? 80 'PublicUpdateContentByShareCode' test.out

#- 81 UpdateContentS3
./ng net.accelbyte.sdk.cli.Main ugc updateContentS3 \
    --channelId 'UyuMjyps' \
    --contentId '7imguAZn' \
    --namespace "$AB_NAMESPACE" \
    --userId 'FL0gLIyQ' \
    --body '{"contentType": "9W2QOSIx", "customAttributes": {"POP0MrJs": {}, "BcJOaWnw": {}, "zTsFmkb1": {}}, "fileExtension": "BMlGy2Kt", "name": "BJuWS4dG", "payload": "vkwPkZAF", "preview": "sqpDIaVk", "previewMetadata": {"previewContentType": "xQhoPGO6", "previewFileExtension": "2yOQXYd9"}, "subType": "p31wcKZL", "tags": ["Ue4vJYzR", "zo0Muixz", "1QUkhIpF"], "type": "w0QXteIo", "updateContentFile": true}' \
    > test.out 2>&1
eval_tap $? 81 'UpdateContentS3' test.out

#- 82 PublicDeleteContentByShareCode
./ng net.accelbyte.sdk.cli.Main ugc publicDeleteContentByShareCode \
    --channelId 'JypBLLB6' \
    --namespace "$AB_NAMESPACE" \
    --shareCode '3KGfkC5W' \
    --userId 'XSD6wryP' \
    > test.out 2>&1
eval_tap $? 82 'PublicDeleteContentByShareCode' test.out

#- 83 UpdateContentDirect
eval_tap 0 83 'UpdateContentDirect # SKIP deprecated' test.out

#- 84 DeleteContent
./ng net.accelbyte.sdk.cli.Main ugc deleteContent \
    --channelId 'w20OHQkZ' \
    --contentId 'MhGaMgBu' \
    --namespace "$AB_NAMESPACE" \
    --userId 'wl70JX4a' \
    > test.out 2>&1
eval_tap $? 84 'DeleteContent' test.out

#- 85 UpdateContentShareCode
./ng net.accelbyte.sdk.cli.Main ugc updateContentShareCode \
    --channelId 's3qQ47uF' \
    --contentId 'TV6Xeqxs' \
    --namespace "$AB_NAMESPACE" \
    --userId 'TFlY8Ges' \
    --body '{"shareCode": "d74lqRkz"}' \
    > test.out 2>&1
eval_tap $? 85 'UpdateContentShareCode' test.out

#- 86 PublicGetUserContent
./ng net.accelbyte.sdk.cli.Main ugc publicGetUserContent \
    --namespace "$AB_NAMESPACE" \
    --userId 'BF4l7IVx' \
    --limit '0' \
    --offset '89' \
    > test.out 2>&1
eval_tap $? 86 'PublicGetUserContent' test.out

#- 87 DeleteAllUserContents
./ng net.accelbyte.sdk.cli.Main ugc deleteAllUserContents \
    --namespace "$AB_NAMESPACE" \
    --userId 'SaAr7UFv' \
    > test.out 2>&1
eval_tap $? 87 'DeleteAllUserContents' test.out

#- 88 UpdateScreenshots
./ng net.accelbyte.sdk.cli.Main ugc updateScreenshots \
    --contentId 'EnVZtyYW' \
    --namespace "$AB_NAMESPACE" \
    --userId 'QKmIi5Um' \
    --body '{"screenshots": [{"description": "0K4u7s1x", "screenshotId": "5kl6nzL7"}, {"description": "OXd8QmOS", "screenshotId": "Bbcvnlzt"}, {"description": "cQoH7YHX", "screenshotId": "7W3lltle"}]}' \
    > test.out 2>&1
eval_tap $? 88 'UpdateScreenshots' test.out

#- 89 UploadContentScreenshot
./ng net.accelbyte.sdk.cli.Main ugc uploadContentScreenshot \
    --contentId '4dvIEThS' \
    --namespace "$AB_NAMESPACE" \
    --userId 'QPGfsZTu' \
    --body '{"screenshots": [{"contentType": "Dnh8fJlI", "description": "kmCpdLKn", "fileExtension": "png"}, {"contentType": "LKQ8kFd3", "description": "SiHWLoAO", "fileExtension": "jpg"}, {"contentType": "aF4lHF5D", "description": "AhYcwZkX", "fileExtension": "bmp"}]}' \
    > test.out 2>&1
eval_tap $? 89 'UploadContentScreenshot' test.out

#- 90 DeleteContentScreenshot
./ng net.accelbyte.sdk.cli.Main ugc deleteContentScreenshot \
    --contentId 'kKJI35ri' \
    --namespace "$AB_NAMESPACE" \
    --screenshotId 'zoILpdkr' \
    --userId 'IjK6w3Dr' \
    > test.out 2>&1
eval_tap $? 90 'DeleteContentScreenshot' test.out

#- 91 UpdateUserFollowStatus
./ng net.accelbyte.sdk.cli.Main ugc updateUserFollowStatus \
    --namespace "$AB_NAMESPACE" \
    --userId 'DsYUoSq9' \
    --body '{"followStatus": true}' \
    > test.out 2>&1
eval_tap $? 91 'UpdateUserFollowStatus' test.out

#- 92 GetPublicFollowers
./ng net.accelbyte.sdk.cli.Main ugc getPublicFollowers \
    --namespace "$AB_NAMESPACE" \
    --userId 'GgyJjVgJ' \
    --limit '12' \
    --offset '96' \
    > test.out 2>&1
eval_tap $? 92 'GetPublicFollowers' test.out

#- 93 GetPublicFollowing
./ng net.accelbyte.sdk.cli.Main ugc getPublicFollowing \
    --namespace "$AB_NAMESPACE" \
    --userId 'SBtlOTRl' \
    --limit '63' \
    --offset '82' \
    > test.out 2>&1
eval_tap $? 93 'GetPublicFollowing' test.out

#- 94 GetGroups
./ng net.accelbyte.sdk.cli.Main ugc getGroups \
    --namespace "$AB_NAMESPACE" \
    --userId 'ag4foqJZ' \
    --limit '70' \
    --offset '88' \
    > test.out 2>&1
eval_tap $? 94 'GetGroups' test.out

#- 95 CreateGroup
./ng net.accelbyte.sdk.cli.Main ugc createGroup \
    --namespace "$AB_NAMESPACE" \
    --userId 'C6sJWpeH' \
    --body '{"contents": ["LjUkb1bn", "S4ninb9J", "iN5gRc4H"], "name": "tdawaorr"}' \
    > test.out 2>&1
eval_tap $? 95 'CreateGroup' test.out

#- 96 DeleteAllUserGroup
./ng net.accelbyte.sdk.cli.Main ugc deleteAllUserGroup \
    --namespace "$AB_NAMESPACE" \
    --userId 'XWSkG4m7' \
    > test.out 2>&1
eval_tap $? 96 'DeleteAllUserGroup' test.out

#- 97 GetGroup
./ng net.accelbyte.sdk.cli.Main ugc getGroup \
    --groupId 'xJyxOREC' \
    --namespace "$AB_NAMESPACE" \
    --userId 'arDZoYLA' \
    > test.out 2>&1
eval_tap $? 97 'GetGroup' test.out

#- 98 UpdateGroup
./ng net.accelbyte.sdk.cli.Main ugc updateGroup \
    --groupId 'qnA2s8hJ' \
    --namespace "$AB_NAMESPACE" \
    --userId 'eK3UVmyJ' \
    --body '{"contents": ["HWQy6TYF", "MjJzN4Ct", "ATDID8X8"], "name": "WBmPBJ99"}' \
    > test.out 2>&1
eval_tap $? 98 'UpdateGroup' test.out

#- 99 DeleteGroup
./ng net.accelbyte.sdk.cli.Main ugc deleteGroup \
    --groupId 'dsfg9a7S' \
    --namespace "$AB_NAMESPACE" \
    --userId '23TNgbtm' \
    > test.out 2>&1
eval_tap $? 99 'DeleteGroup' test.out

#- 100 GetGroupContent
./ng net.accelbyte.sdk.cli.Main ugc getGroupContent \
    --groupId 'j8P4y2Ea' \
    --namespace "$AB_NAMESPACE" \
    --userId '4fBNzYy2' \
    --limit '48' \
    --offset '16' \
    > test.out 2>&1
eval_tap $? 100 'GetGroupContent' test.out

#- 101 DeleteAllUserStates
./ng net.accelbyte.sdk.cli.Main ugc deleteAllUserStates \
    --namespace "$AB_NAMESPACE" \
    --userId 'jpVI30K8' \
    > test.out 2>&1
eval_tap $? 101 'DeleteAllUserStates' test.out

#- 102 AdminGetContentByChannelIDV2
./ng net.accelbyte.sdk.cli.Main ugc adminGetContentByChannelIDV2 \
    --channelId 'lV52Yt92' \
    --namespace "$AB_NAMESPACE" \
    --limit '28' \
    --name 'N7WP4tov' \
    --offset '57' \
    --sortBy 'SnRt0CkM' \
    > test.out 2>&1
eval_tap $? 102 'AdminGetContentByChannelIDV2' test.out

#- 103 AdminCreateContentV2
./ng net.accelbyte.sdk.cli.Main ugc adminCreateContentV2 \
    --channelId 'yRDNV7kl' \
    --namespace "$AB_NAMESPACE" \
    --body '{"contentType": "5hMZ6HYi", "customAttributes": {"Ct9FYfWl": {}, "AGkNXIpp": {}, "VO7rjWSj": {}}, "fileExtension": "1tWTtr5O", "name": "rijWq5k4", "shareCode": "SMQVAaZ5", "subType": "Tvrp9T4C", "tags": ["1FN5zDcE", "ROA2EDlh", "l5BbrQdR"], "type": "pDLbviXb"}' \
    > test.out 2>&1
eval_tap $? 103 'AdminCreateContentV2' test.out

#- 104 AdminDeleteOfficialContentV2
./ng net.accelbyte.sdk.cli.Main ugc adminDeleteOfficialContentV2 \
    --channelId 'EQWyofjI' \
    --contentId 'kz4CNwJA' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 104 'AdminDeleteOfficialContentV2' test.out

#- 105 AdminUpdateOfficialContentV2
./ng net.accelbyte.sdk.cli.Main ugc adminUpdateOfficialContentV2 \
    --channelId 'pzPBjsKG' \
    --contentId 'AEya8lM5' \
    --namespace "$AB_NAMESPACE" \
    --body '{"customAttributes": {"Iwwahksb": {}, "x3JzbPUT": {}, "wksAYcIu": {}}, "name": "O4z5Hz7N", "shareCode": "DGj53LAU", "subType": "T02QR2o7", "tags": ["Voicr0ah", "y6KkyIH2", "j82FcxNi"], "type": "AV9E2ry9"}' \
    > test.out 2>&1
eval_tap $? 105 'AdminUpdateOfficialContentV2' test.out

#- 106 AdminCopyContent
./ng net.accelbyte.sdk.cli.Main ugc adminCopyContent \
    --channelId '91iN14Nx' \
    --contentId 'Bmxg1Lhi' \
    --namespace "$AB_NAMESPACE" \
    --body '{"customAttributes": {"5hFAT3Mm": {}, "FzlKUDVa": {}, "n2sqe3Al": {}}, "name": "W5NOtS4s", "subType": "ckyD4g5F", "tags": ["xCRO07Du", "UAdmwdSf", "DiI1bKCk"], "targetChannelId": "i8MVR3FY", "type": "ROmNa3uF"}' \
    > test.out 2>&1
eval_tap $? 106 'AdminCopyContent' test.out

#- 107 AdminUpdateOfficialContentFileLocation
./ng net.accelbyte.sdk.cli.Main ugc adminUpdateOfficialContentFileLocation \
    --channelId 'ugvNJKtw' \
    --contentId 'OoIbLsGS' \
    --namespace "$AB_NAMESPACE" \
    --body '{"fileExtension": "ihyJgL5R", "fileLocation": "j5SrE35G"}' \
    > test.out 2>&1
eval_tap $? 107 'AdminUpdateOfficialContentFileLocation' test.out

#- 108 AdminGenerateOfficialContentUploadURLV2
./ng net.accelbyte.sdk.cli.Main ugc adminGenerateOfficialContentUploadURLV2 \
    --channelId 'CTKn8GGw' \
    --contentId 'Wxw4PydV' \
    --namespace "$AB_NAMESPACE" \
    --body '{"contentType": "0li00pGa", "fileExtension": "fcqj4oqq"}' \
    > test.out 2>&1
eval_tap $? 108 'AdminGenerateOfficialContentUploadURLV2' test.out

#- 109 AdminGetConfigs
./ng net.accelbyte.sdk.cli.Main ugc adminGetConfigs \
    --namespace "$AB_NAMESPACE" \
    --limit '61' \
    --offset '92' \
    > test.out 2>&1
eval_tap $? 109 'AdminGetConfigs' test.out

#- 110 AdminUpdateConfig
./ng net.accelbyte.sdk.cli.Main ugc adminUpdateConfig \
    --key 'GQyQTKZ0' \
    --namespace "$AB_NAMESPACE" \
    --body '{"value": "DMfFRgrV"}' \
    > test.out 2>&1
eval_tap $? 110 'AdminUpdateConfig' test.out

#- 111 AdminListContentV2
./ng net.accelbyte.sdk.cli.Main ugc adminListContentV2 \
    --namespace "$AB_NAMESPACE" \
    --isOfficial  \
    --limit '47' \
    --name 'CRINKoui' \
    --offset '52' \
    --sortBy 'ZoGd5sOg' \
    --subType 'ri6iXHjQ' \
    --tags 'QZ1NDVhp,7ba08Aqd,tB8zIZir' \
    --type 'LKEyeezp' \
    > test.out 2>&1
eval_tap $? 111 'AdminListContentV2' test.out

#- 112 AdminBulkGetContentByIDsV2
./ng net.accelbyte.sdk.cli.Main ugc adminBulkGetContentByIDsV2 \
    --namespace "$AB_NAMESPACE" \
    --body '{"contentIds": ["7H67UHhZ", "NW1SEzAH", "6b5fXNwf"]}' \
    > test.out 2>&1
eval_tap $? 112 'AdminBulkGetContentByIDsV2' test.out

#- 113 AdminGetContentBulkByShareCodesV2
./ng net.accelbyte.sdk.cli.Main ugc adminGetContentBulkByShareCodesV2 \
    --namespace "$AB_NAMESPACE" \
    --body '{"shareCodes": ["oQxnJSnk", "XHzG2R9K", "dA7ubgth"]}' \
    > test.out 2>&1
eval_tap $? 113 'AdminGetContentBulkByShareCodesV2' test.out

#- 114 AdminGetContentByShareCodeV2
./ng net.accelbyte.sdk.cli.Main ugc adminGetContentByShareCodeV2 \
    --namespace "$AB_NAMESPACE" \
    --shareCode 'TwAIfNoX' \
    > test.out 2>&1
eval_tap $? 114 'AdminGetContentByShareCodeV2' test.out

#- 115 AdminGetContentByContentIDV2
./ng net.accelbyte.sdk.cli.Main ugc adminGetContentByContentIDV2 \
    --contentId 'deiyk4hc' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 115 'AdminGetContentByContentIDV2' test.out

#- 116 RollbackContentVersionV2
./ng net.accelbyte.sdk.cli.Main ugc rollbackContentVersionV2 \
    --contentId 'jAwxpaOj' \
    --namespace "$AB_NAMESPACE" \
    --versionId 'arVXca01' \
    > test.out 2>&1
eval_tap $? 116 'RollbackContentVersionV2' test.out

#- 117 AdminUpdateScreenshotsV2
./ng net.accelbyte.sdk.cli.Main ugc adminUpdateScreenshotsV2 \
    --contentId 'tyMZHsit' \
    --namespace "$AB_NAMESPACE" \
    --body '{"screenshots": [{"description": "MfTd64RZ", "screenshotId": "qvCb865A"}, {"description": "nZoN3uq8", "screenshotId": "uXeMAhc7"}, {"description": "b6ZyPszc", "screenshotId": "sPkDgWhy"}]}' \
    > test.out 2>&1
eval_tap $? 117 'AdminUpdateScreenshotsV2' test.out

#- 118 AdminUploadContentScreenshotV2
./ng net.accelbyte.sdk.cli.Main ugc adminUploadContentScreenshotV2 \
    --contentId 'JdHlbwS1' \
    --namespace "$AB_NAMESPACE" \
    --body '{"screenshots": [{"contentType": "mOg8ipNg", "description": "QpH94Clk", "fileExtension": "png"}, {"contentType": "vj0CNzL3", "description": "sLYbWDOa", "fileExtension": "jpg"}, {"contentType": "FP8rVQWf", "description": "4FWvkZBf", "fileExtension": "jpg"}]}' \
    > test.out 2>&1
eval_tap $? 118 'AdminUploadContentScreenshotV2' test.out

#- 119 AdminDeleteContentScreenshotV2
./ng net.accelbyte.sdk.cli.Main ugc adminDeleteContentScreenshotV2 \
    --contentId 'AvpVWT9J' \
    --namespace "$AB_NAMESPACE" \
    --screenshotId 'o9wqCEyF' \
    > test.out 2>&1
eval_tap $? 119 'AdminDeleteContentScreenshotV2' test.out

#- 120 ListContentVersionsV2
./ng net.accelbyte.sdk.cli.Main ugc listContentVersionsV2 \
    --contentId 'Z4YJhzZD' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 120 'ListContentVersionsV2' test.out

#- 121 AdminGetOfficialGroupContentsV2
./ng net.accelbyte.sdk.cli.Main ugc adminGetOfficialGroupContentsV2 \
    --groupId 'K7ANGHuX' \
    --namespace "$AB_NAMESPACE" \
    --limit '88' \
    --offset '100' \
    > test.out 2>&1
eval_tap $? 121 'AdminGetOfficialGroupContentsV2' test.out

#- 122 AdminListStagingContents
./ng net.accelbyte.sdk.cli.Main ugc adminListStagingContents \
    --namespace "$AB_NAMESPACE" \
    --limit '91' \
    --offset '45' \
    --sortBy 'gGcszRn7' \
    --status 'DeI3NqNC' \
    > test.out 2>&1
eval_tap $? 122 'AdminListStagingContents' test.out

#- 123 AdminGetStagingContentByID
./ng net.accelbyte.sdk.cli.Main ugc adminGetStagingContentByID \
    --contentId 'OSnSq412' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 123 'AdminGetStagingContentByID' test.out

#- 124 AdminApproveStagingContent
./ng net.accelbyte.sdk.cli.Main ugc adminApproveStagingContent \
    --contentId 'hIaOwkxS' \
    --namespace "$AB_NAMESPACE" \
    --body '{"approved": false, "note": "36UJNeSN"}' \
    > test.out 2>&1
eval_tap $? 124 'AdminApproveStagingContent' test.out

#- 125 AdminUpdateContentByShareCodeV2
./ng net.accelbyte.sdk.cli.Main ugc adminUpdateContentByShareCodeV2 \
    --channelId '7x0wfCQC' \
    --namespace "$AB_NAMESPACE" \
    --shareCode 'Vrt0xQcT' \
    --userId 'xAbVaH8x' \
    --body '{"customAttributes": {"9UdKLDcI": {}, "b86kGy8o": {}, "IHUnOtMG": {}}, "name": "h3ayvKXh", "shareCode": "b2FgRsGr", "subType": "Ki6p7mbY", "tags": ["UBtZ1zaa", "VdcfiRQF", "aDE0cTNJ"], "type": "GRAhhuYD"}' \
    > test.out 2>&1
eval_tap $? 125 'AdminUpdateContentByShareCodeV2' test.out

#- 126 AdminDeleteContentByShareCodeV2
./ng net.accelbyte.sdk.cli.Main ugc adminDeleteContentByShareCodeV2 \
    --channelId 'PUDGz6px' \
    --namespace "$AB_NAMESPACE" \
    --shareCode 'b4AB8JOA' \
    --userId 'ymbR49fF' \
    > test.out 2>&1
eval_tap $? 126 'AdminDeleteContentByShareCodeV2' test.out

#- 127 AdminDeleteUserContentV2
./ng net.accelbyte.sdk.cli.Main ugc adminDeleteUserContentV2 \
    --channelId '6i4DgdfT' \
    --contentId 'udukNSmn' \
    --namespace "$AB_NAMESPACE" \
    --userId 'iw09PNs4' \
    > test.out 2>&1
eval_tap $? 127 'AdminDeleteUserContentV2' test.out

#- 128 AdminUpdateUserContentV2
./ng net.accelbyte.sdk.cli.Main ugc adminUpdateUserContentV2 \
    --channelId 'w4QUfEP0' \
    --contentId 'xrJzZR31' \
    --namespace "$AB_NAMESPACE" \
    --userId 'R8fLumrC' \
    --body '{"customAttributes": {"4lU5DJhy": {}, "N1WgrRGP": {}, "17xy7IdL": {}}, "name": "OwXO1YBm", "shareCode": "twPRD5NW", "subType": "UydpVF2U", "tags": ["UF0xDH6m", "w58UaJRr", "jeOUZIRC"], "type": "ZbjJDIGa"}' \
    > test.out 2>&1
eval_tap $? 128 'AdminUpdateUserContentV2' test.out

#- 129 AdminUpdateUserContentFileLocation
./ng net.accelbyte.sdk.cli.Main ugc adminUpdateUserContentFileLocation \
    --channelId 'RWsZTbXs' \
    --contentId 'oLjQ1tR4' \
    --namespace "$AB_NAMESPACE" \
    --userId '0zuIZaqT' \
    --body '{"fileExtension": "S1fbNPQI", "fileLocation": "K5U6JaXO"}' \
    > test.out 2>&1
eval_tap $? 129 'AdminUpdateUserContentFileLocation' test.out

#- 130 AdminGenerateUserContentUploadURLV2
./ng net.accelbyte.sdk.cli.Main ugc adminGenerateUserContentUploadURLV2 \
    --channelId '18Z9HpwH' \
    --contentId 'ciWFbiaM' \
    --namespace "$AB_NAMESPACE" \
    --userId '1pHyUex3' \
    --body '{"contentType": "oLjpk6Ea", "fileExtension": "5j5XB3at"}' \
    > test.out 2>&1
eval_tap $? 130 'AdminGenerateUserContentUploadURLV2' test.out

#- 131 AdminGetContentByUserIDV2
./ng net.accelbyte.sdk.cli.Main ugc adminGetContentByUserIDV2 \
    --namespace "$AB_NAMESPACE" \
    --userId 'oxLIJzvG' \
    --limit '98' \
    --offset '9' \
    --sortBy 'RcfJMGUv' \
    > test.out 2>&1
eval_tap $? 131 'AdminGetContentByUserIDV2' test.out

#- 132 AdminUpdateContentHideStatusV2
./ng net.accelbyte.sdk.cli.Main ugc adminUpdateContentHideStatusV2 \
    --contentId 'biwL1nRs' \
    --namespace "$AB_NAMESPACE" \
    --userId 'JHeh7evo' \
    --body '{"isHidden": true}' \
    > test.out 2>&1
eval_tap $? 132 'AdminUpdateContentHideStatusV2' test.out

#- 133 AdminGetUserGroupContentsV2
./ng net.accelbyte.sdk.cli.Main ugc adminGetUserGroupContentsV2 \
    --groupId 'HbTJpr4I' \
    --namespace "$AB_NAMESPACE" \
    --userId 'aTLraJjL' \
    --limit '43' \
    --offset '57' \
    > test.out 2>&1
eval_tap $? 133 'AdminGetUserGroupContentsV2' test.out

#- 134 AdminListUserStagingContents
./ng net.accelbyte.sdk.cli.Main ugc adminListUserStagingContents \
    --namespace "$AB_NAMESPACE" \
    --userId 'cyl37f7i' \
    --limit '98' \
    --offset '10' \
    --sortBy 'B5538gYL' \
    --status 'KYmuSSOk' \
    > test.out 2>&1
eval_tap $? 134 'AdminListUserStagingContents' test.out

#- 135 PublicGetContentByChannelIDV2
./ng net.accelbyte.sdk.cli.Main ugc publicGetContentByChannelIDV2 \
    --channelId 'M6vnWH8P' \
    --namespace "$AB_NAMESPACE" \
    --limit '24' \
    --name '4bnZ9jMI' \
    --offset '72' \
    --sortBy 'y7v2YaDt' \
    > test.out 2>&1
eval_tap $? 135 'PublicGetContentByChannelIDV2' test.out

#- 136 PublicListContentV2
./ng net.accelbyte.sdk.cli.Main ugc publicListContentV2 \
    --namespace "$AB_NAMESPACE" \
    --isOfficial  \
    --limit '26' \
    --name 'uCP24cVI' \
    --offset '71' \
    --sortBy 'O9sLrOLz' \
    --subType 'veCSProo' \
    --tags '3Jm8KQKR,dQBcog8p,PdoE57s3' \
    --type 'pQV66eDJ' \
    > test.out 2>&1
eval_tap $? 136 'PublicListContentV2' test.out

#- 137 PublicBulkGetContentByIDV2
./ng net.accelbyte.sdk.cli.Main ugc publicBulkGetContentByIDV2 \
    --namespace "$AB_NAMESPACE" \
    --body '{"contentIds": ["Q6THRiJY", "iohjPN8n", "iYltB6ZA"]}' \
    > test.out 2>&1
eval_tap $? 137 'PublicBulkGetContentByIDV2' test.out

#- 138 PublicGetContentBulkByShareCodesV2
./ng net.accelbyte.sdk.cli.Main ugc publicGetContentBulkByShareCodesV2 \
    --namespace "$AB_NAMESPACE" \
    --body '{"shareCodes": ["mE6RxCDu", "Ajgsu0hV", "qCF3G4Vz"]}' \
    > test.out 2>&1
eval_tap $? 138 'PublicGetContentBulkByShareCodesV2' test.out

#- 139 PublicGetContentByShareCodeV2
./ng net.accelbyte.sdk.cli.Main ugc publicGetContentByShareCodeV2 \
    --namespace "$AB_NAMESPACE" \
    --shareCode 'LpoxcK0l' \
    > test.out 2>&1
eval_tap $? 139 'PublicGetContentByShareCodeV2' test.out

#- 140 PublicGetContentByIDV2
./ng net.accelbyte.sdk.cli.Main ugc publicGetContentByIDV2 \
    --contentId 'nHyoj4sh' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 140 'PublicGetContentByIDV2' test.out

#- 141 PublicAddDownloadCountV2
./ng net.accelbyte.sdk.cli.Main ugc publicAddDownloadCountV2 \
    --contentId 'eTyzkJvo' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 141 'PublicAddDownloadCountV2' test.out

#- 142 PublicListContentDownloaderV2
./ng net.accelbyte.sdk.cli.Main ugc publicListContentDownloaderV2 \
    --contentId 'D6ZBrJDw' \
    --namespace "$AB_NAMESPACE" \
    --limit '19' \
    --offset '33' \
    --sortBy 'owc7PkdJ' \
    --userId 'A6TCTKYz' \
    > test.out 2>&1
eval_tap $? 142 'PublicListContentDownloaderV2' test.out

#- 143 PublicListContentLikeV2
./ng net.accelbyte.sdk.cli.Main ugc publicListContentLikeV2 \
    --contentId 'z4H8ArWB' \
    --namespace "$AB_NAMESPACE" \
    --limit '25' \
    --offset '53' \
    --sortBy 'ekSTcLoB' \
    > test.out 2>&1
eval_tap $? 143 'PublicListContentLikeV2' test.out

#- 144 UpdateContentLikeStatusV2
./ng net.accelbyte.sdk.cli.Main ugc updateContentLikeStatusV2 \
    --contentId 'YoTaq9Ly' \
    --namespace "$AB_NAMESPACE" \
    --body '{"likeStatus": false}' \
    > test.out 2>&1
eval_tap $? 144 'UpdateContentLikeStatusV2' test.out

#- 145 PublicCreateContentV2
./ng net.accelbyte.sdk.cli.Main ugc publicCreateContentV2 \
    --channelId 'yfbYrbfb' \
    --namespace "$AB_NAMESPACE" \
    --userId 'MjkMC5sY' \
    --body '{"contentType": "FqcXBsfc", "customAttributes": {"O3WnDV4B": {}, "5KB6qPLF": {}, "aMoRzB7g": {}}, "fileExtension": "RQaZBYq1", "name": "jfftWR1a", "subType": "RS6XTazU", "tags": ["BRIcq5MG", "ZwxEalQW", "ga7SYSEO"], "type": "cegB2RXw"}' \
    > test.out 2>&1
eval_tap $? 145 'PublicCreateContentV2' test.out

#- 146 PublicUpdateContentByShareCodeV2
./ng net.accelbyte.sdk.cli.Main ugc publicUpdateContentByShareCodeV2 \
    --channelId 'MQaXUeai' \
    --namespace "$AB_NAMESPACE" \
    --shareCode 'fZ7MazVM' \
    --userId 'FGEHkPpq' \
    --body '{"customAttributes": {"OQFUeIGi": {}, "HbuiNZOh": {}, "LDy5Rl7V": {}}, "name": "PG6MJn66", "subType": "Rs6N6Udv", "tags": ["9OuOeM2P", "yMxom58Y", "KwKDdY70"], "type": "WQvr9RxL"}' \
    > test.out 2>&1
eval_tap $? 146 'PublicUpdateContentByShareCodeV2' test.out

#- 147 PublicDeleteContentByShareCodeV2
./ng net.accelbyte.sdk.cli.Main ugc publicDeleteContentByShareCodeV2 \
    --channelId 'WGcxvtEt' \
    --namespace "$AB_NAMESPACE" \
    --shareCode 'FPpo4M6s' \
    --userId 'tBrvzpOQ' \
    > test.out 2>&1
eval_tap $? 147 'PublicDeleteContentByShareCodeV2' test.out

#- 148 PublicDeleteContentV2
./ng net.accelbyte.sdk.cli.Main ugc publicDeleteContentV2 \
    --channelId 'WulyaxKJ' \
    --contentId 'gMwSOYp6' \
    --namespace "$AB_NAMESPACE" \
    --userId 'uv9aeQX8' \
    > test.out 2>&1
eval_tap $? 148 'PublicDeleteContentV2' test.out

#- 149 PublicUpdateContentV2
./ng net.accelbyte.sdk.cli.Main ugc publicUpdateContentV2 \
    --channelId '5CPwk7pG' \
    --contentId 'F0yZhvtW' \
    --namespace "$AB_NAMESPACE" \
    --userId 'p0nc7HTw' \
    --body '{"customAttributes": {"YiiFyToz": {}, "IoYK2QAQ": {}, "7ifd4cVZ": {}}, "name": "Pe0gxvSq", "subType": "OaCUtrV2", "tags": ["ldp3z22P", "1T2mpMhJ", "e68Az8xH"], "type": "Ofuwae6i"}' \
    > test.out 2>&1
eval_tap $? 149 'PublicUpdateContentV2' test.out

#- 150 PublicUpdateContentFileLocation
./ng net.accelbyte.sdk.cli.Main ugc publicUpdateContentFileLocation \
    --channelId '6YiwLG15' \
    --contentId 'b114zJe5' \
    --namespace "$AB_NAMESPACE" \
    --userId 'X2WLMJsK' \
    --body '{"fileExtension": "Ri3WVIza", "fileLocation": "Qz9xOirb"}' \
    > test.out 2>&1
eval_tap $? 150 'PublicUpdateContentFileLocation' test.out

#- 151 UpdateContentShareCodeV2
./ng net.accelbyte.sdk.cli.Main ugc updateContentShareCodeV2 \
    --channelId '9nOiGAWN' \
    --contentId 'aPN1naxF' \
    --namespace "$AB_NAMESPACE" \
    --userId 'wvjVULcK' \
    --body '{"shareCode": "qx6edDJP"}' \
    > test.out 2>&1
eval_tap $? 151 'UpdateContentShareCodeV2' test.out

#- 152 PublicGenerateContentUploadURLV2
./ng net.accelbyte.sdk.cli.Main ugc publicGenerateContentUploadURLV2 \
    --channelId 'aUB4rpwB' \
    --contentId '4CPwb7tm' \
    --namespace "$AB_NAMESPACE" \
    --userId 'IraLvvJv' \
    --body '{"contentType": "rNqDHBZ2", "fileExtension": "ltPu850h"}' \
    > test.out 2>&1
eval_tap $? 152 'PublicGenerateContentUploadURLV2' test.out

#- 153 PublicGetContentByUserIDV2
./ng net.accelbyte.sdk.cli.Main ugc publicGetContentByUserIDV2 \
    --namespace "$AB_NAMESPACE" \
    --userId 'FwAFjqhY' \
    --limit '20' \
    --offset '78' \
    --sortBy 'kmC8e6WQ' \
    > test.out 2>&1
eval_tap $? 153 'PublicGetContentByUserIDV2' test.out

#- 154 UpdateScreenshotsV2
./ng net.accelbyte.sdk.cli.Main ugc updateScreenshotsV2 \
    --contentId 'Ou07oNm5' \
    --namespace "$AB_NAMESPACE" \
    --userId 'VhqCYU6A' \
    --body '{"screenshots": [{"description": "EtztW2CX", "screenshotId": "kCJ6h1P7"}, {"description": "11cYPtcm", "screenshotId": "SRmridbx"}, {"description": "1ybRcZ4S", "screenshotId": "oaSDbkos"}]}' \
    > test.out 2>&1
eval_tap $? 154 'UpdateScreenshotsV2' test.out

#- 155 UploadContentScreenshotV2
./ng net.accelbyte.sdk.cli.Main ugc uploadContentScreenshotV2 \
    --contentId '0RgqfaiF' \
    --namespace "$AB_NAMESPACE" \
    --userId 'GDWEq7W0' \
    --body '{"screenshots": [{"contentType": "gbqC7cHj", "description": "Ex6b8iTE", "fileExtension": "png"}, {"contentType": "TFYlsI0O", "description": "SJeWXYV5", "fileExtension": "bmp"}, {"contentType": "bOXmzsbt", "description": "BC8ol2KW", "fileExtension": "bmp"}]}' \
    > test.out 2>&1
eval_tap $? 155 'UploadContentScreenshotV2' test.out

#- 156 DeleteContentScreenshotV2
./ng net.accelbyte.sdk.cli.Main ugc deleteContentScreenshotV2 \
    --contentId 'XGRSncWy' \
    --namespace "$AB_NAMESPACE" \
    --screenshotId '2lPlSVEv' \
    --userId '115UkhKo' \
    > test.out 2>&1
eval_tap $? 156 'DeleteContentScreenshotV2' test.out

#- 157 PublicGetGroupContentsV2
./ng net.accelbyte.sdk.cli.Main ugc publicGetGroupContentsV2 \
    --groupId 'cuTR8D8m' \
    --namespace "$AB_NAMESPACE" \
    --userId 'NgpK5Kkf' \
    --limit '52' \
    --offset '55' \
    > test.out 2>&1
eval_tap $? 157 'PublicGetGroupContentsV2' test.out

#- 158 ListUserStagingContents
./ng net.accelbyte.sdk.cli.Main ugc listUserStagingContents \
    --namespace "$AB_NAMESPACE" \
    --userId 'FAsYNTEk' \
    --limit '9' \
    --offset '15' \
    --sortBy 'UcER01ji' \
    --status 'Cgqo0x1g' \
    > test.out 2>&1
eval_tap $? 158 'ListUserStagingContents' test.out

#- 159 GetUserStagingContentByID
./ng net.accelbyte.sdk.cli.Main ugc getUserStagingContentByID \
    --contentId 'wxgJYP2a' \
    --namespace "$AB_NAMESPACE" \
    --userId 'YENlZ2iK' \
    > test.out 2>&1
eval_tap $? 159 'GetUserStagingContentByID' test.out

#- 160 UpdateStagingContent
./ng net.accelbyte.sdk.cli.Main ugc updateStagingContent \
    --contentId '2TXea8Jj' \
    --namespace "$AB_NAMESPACE" \
    --userId 'CzDzyy53' \
    --body '{"fileExtension": "GUdAx0Ou", "fileLocation": "hJfr7g7u"}' \
    > test.out 2>&1
eval_tap $? 160 'UpdateStagingContent' test.out

#- 161 DeleteUserStagingContentByID
./ng net.accelbyte.sdk.cli.Main ugc deleteUserStagingContentByID \
    --contentId 'eeu2xv1r' \
    --namespace "$AB_NAMESPACE" \
    --userId 'i6UUBik3' \
    > test.out 2>&1
eval_tap $? 161 'DeleteUserStagingContentByID' test.out


rm -f "tmp.dat"

exit $EXIT_CODE