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
    --limit '17' \
    --offset '27' \
    > test.out 2>&1
eval_tap $? 2 'SingleAdminGetChannel' test.out

#- 3 AdminCreateChannel
./ng net.accelbyte.sdk.cli.Main ugc adminCreateChannel \
    --namespace "$AB_NAMESPACE" \
    --body '{"id": "yurscZhX", "name": "DucnKOIx"}' \
    > test.out 2>&1
eval_tap $? 3 'AdminCreateChannel' test.out

#- 4 SingleAdminUpdateChannel
./ng net.accelbyte.sdk.cli.Main ugc singleAdminUpdateChannel \
    --channelId 's03p3Jjf' \
    --namespace "$AB_NAMESPACE" \
    --body '{"name": "lzu4Hc28"}' \
    > test.out 2>&1
eval_tap $? 4 'SingleAdminUpdateChannel' test.out

#- 5 SingleAdminDeleteChannel
./ng net.accelbyte.sdk.cli.Main ugc singleAdminDeleteChannel \
    --channelId 'RhnIR8XL' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 5 'SingleAdminDeleteChannel' test.out

#- 6 AdminUploadContentDirect
eval_tap 0 6 'AdminUploadContentDirect # SKIP deprecated' test.out

#- 7 AdminUploadContentS3
./ng net.accelbyte.sdk.cli.Main ugc adminUploadContentS3 \
    --channelId 'aHZchW3n' \
    --namespace "$AB_NAMESPACE" \
    --body '{"contentType": "bfiQDqAl", "customAttributes": {"umr5Bx1U": {}, "Xdmqootb": {}, "8nKOQvxa": {}}, "fileExtension": "fpR0Ne4A", "name": "RZQYaJwr", "preview": "y3EFNuHI", "previewMetadata": {"previewContentType": "yKN5VLKD", "previewFileExtension": "pMaK2ObL"}, "shareCode": "ydEZSpa6", "subType": "hFOmKFAS", "tags": ["0o33oeZQ", "SP1knGp3", "A9czCVhZ"], "type": "lm3Y7xzH"}' \
    > test.out 2>&1
eval_tap $? 7 'AdminUploadContentS3' test.out

#- 8 SingleAdminUpdateContentS3
./ng net.accelbyte.sdk.cli.Main ugc singleAdminUpdateContentS3 \
    --channelId 'yQx96e3h' \
    --contentId 'm5Sz3TYP' \
    --namespace "$AB_NAMESPACE" \
    --body '{"contentType": "hNu5I5ey", "customAttributes": {"MHAzBeoR": {}, "Dy6SFHDJ": {}, "OwzlKIH2": {}}, "fileExtension": "Alp8PPNi", "name": "VvsLLB1i", "payload": "LluSVOhk", "preview": "nKmhNJ0N", "previewMetadata": {"previewContentType": "3pPF58VF", "previewFileExtension": "EtzT7PEf"}, "shareCode": "il4rCLkd", "subType": "vE07zsta", "tags": ["bk4Bn0DP", "jxrjV2MQ", "faKHGjRo"], "type": "Q8bg6Y8x", "updateContentFile": false}' \
    > test.out 2>&1
eval_tap $? 8 'SingleAdminUpdateContentS3' test.out

#- 9 AdminSearchChannelSpecificContent
./ng net.accelbyte.sdk.cli.Main ugc adminSearchChannelSpecificContent \
    --channelId 'vlCa0QFG' \
    --namespace "$AB_NAMESPACE" \
    --creator 'fkI8rfpn' \
    --ishidden 'Uhjl4xjy' \
    --isofficial 'a9gwwQ3y' \
    --limit '4' \
    --name 'oJ1N6IGH' \
    --offset '20' \
    --orderby 'q6kIAIOz' \
    --sortby 'HdZdRt09' \
    --subtype 'jJRfknn2' \
    --tags 'MKUHQdAb,iaheJfrV,DJb27BgL' \
    --type '8pDqb0o6' \
    --userId 'TQnsyRwT' \
    > test.out 2>&1
eval_tap $? 9 'AdminSearchChannelSpecificContent' test.out

#- 10 SingleAdminUpdateContentDirect
eval_tap 0 10 'SingleAdminUpdateContentDirect # SKIP deprecated' test.out

#- 11 SingleAdminDeleteContent
./ng net.accelbyte.sdk.cli.Main ugc singleAdminDeleteContent \
    --channelId 'hSXm1spy' \
    --contentId '6jDsXkFA' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 11 'SingleAdminDeleteContent' test.out

#- 12 SingleAdminGetContent
./ng net.accelbyte.sdk.cli.Main ugc singleAdminGetContent \
    --namespace "$AB_NAMESPACE" \
    --limit '10' \
    --offset '85' \
    > test.out 2>&1
eval_tap $? 12 'SingleAdminGetContent' test.out

#- 13 AdminGetContentBulk
./ng net.accelbyte.sdk.cli.Main ugc adminGetContentBulk \
    --namespace "$AB_NAMESPACE" \
    --body '{"contentIds": ["y2Uq6Yfm", "JttySONK", "SmsZUFeK"]}' \
    > test.out 2>&1
eval_tap $? 13 'AdminGetContentBulk' test.out

#- 14 AdminSearchContent
./ng net.accelbyte.sdk.cli.Main ugc adminSearchContent \
    --namespace "$AB_NAMESPACE" \
    --creator 'DwQMlOec' \
    --ishidden '7OnDMpqU' \
    --isofficial 'LLeNgm9f' \
    --limit '8' \
    --name 'vTy6gY0s' \
    --offset '32' \
    --orderby 'Eyh0yEpZ' \
    --sortby 'qzk5mxVM' \
    --subtype 'zDmzfegg' \
    --tags 'u5R7l2zP,jLLje6RN,SkUgyZky' \
    --type 'LuiE2yBE' \
    --userId '5dcHBqBA' \
    > test.out 2>&1
eval_tap $? 14 'AdminSearchContent' test.out

#- 15 AdminGetContentBulkByShareCodes
./ng net.accelbyte.sdk.cli.Main ugc adminGetContentBulkByShareCodes \
    --namespace "$AB_NAMESPACE" \
    --body '{"shareCodes": ["9nDQY1RW", "6RBuafnJ", "3ueRY0I9"]}' \
    > test.out 2>&1
eval_tap $? 15 'AdminGetContentBulkByShareCodes' test.out

#- 16 AdminGetUserContentByShareCode
./ng net.accelbyte.sdk.cli.Main ugc adminGetUserContentByShareCode \
    --namespace "$AB_NAMESPACE" \
    --shareCode 'AjZlpGny' \
    > test.out 2>&1
eval_tap $? 16 'AdminGetUserContentByShareCode' test.out

#- 17 AdminGetSpecificContent
./ng net.accelbyte.sdk.cli.Main ugc adminGetSpecificContent \
    --contentId 'pl82G1Su' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 17 'AdminGetSpecificContent' test.out

#- 18 AdminDownloadContentPreview
./ng net.accelbyte.sdk.cli.Main ugc adminDownloadContentPreview \
    --contentId 'i5bgrtdD' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 18 'AdminDownloadContentPreview' test.out

#- 19 RollbackContentVersion
./ng net.accelbyte.sdk.cli.Main ugc rollbackContentVersion \
    --contentId 'mbFlt1QG' \
    --namespace "$AB_NAMESPACE" \
    --versionId 'NrFd2zCW' \
    > test.out 2>&1
eval_tap $? 19 'RollbackContentVersion' test.out

#- 20 AdminUpdateScreenshots
./ng net.accelbyte.sdk.cli.Main ugc adminUpdateScreenshots \
    --contentId 'gt4r0nMT' \
    --namespace "$AB_NAMESPACE" \
    --body '{"screenshots": [{"description": "LaBUiztR", "screenshotId": "fzka0y1M"}, {"description": "eECap3AH", "screenshotId": "4VYBRo2B"}, {"description": "s1Q9X5GP", "screenshotId": "FVPmyfk5"}]}' \
    > test.out 2>&1
eval_tap $? 20 'AdminUpdateScreenshots' test.out

#- 21 AdminUploadContentScreenshot
./ng net.accelbyte.sdk.cli.Main ugc adminUploadContentScreenshot \
    --contentId '65mpjzJW' \
    --namespace "$AB_NAMESPACE" \
    --body '{"screenshots": [{"contentType": "sYaHV582", "description": "k3gjctlc", "fileExtension": "png"}, {"contentType": "knaGudby", "description": "3jTsXAUR", "fileExtension": "bmp"}, {"contentType": "nVHisawk", "description": "053m1XyF", "fileExtension": "bmp"}]}' \
    > test.out 2>&1
eval_tap $? 21 'AdminUploadContentScreenshot' test.out

#- 22 AdminDeleteContentScreenshot
./ng net.accelbyte.sdk.cli.Main ugc adminDeleteContentScreenshot \
    --contentId 'YlSjENQ0' \
    --namespace "$AB_NAMESPACE" \
    --screenshotId 'p8EymaLZ' \
    > test.out 2>&1
eval_tap $? 22 'AdminDeleteContentScreenshot' test.out

#- 23 ListContentVersions
./ng net.accelbyte.sdk.cli.Main ugc listContentVersions \
    --contentId '025cG3rr' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 23 'ListContentVersions' test.out

#- 24 SingleAdminGetAllGroups
./ng net.accelbyte.sdk.cli.Main ugc singleAdminGetAllGroups \
    --namespace "$AB_NAMESPACE" \
    --limit '21' \
    --offset '55' \
    > test.out 2>&1
eval_tap $? 24 'SingleAdminGetAllGroups' test.out

#- 25 AdminCreateGroup
./ng net.accelbyte.sdk.cli.Main ugc adminCreateGroup \
    --namespace "$AB_NAMESPACE" \
    --body '{"contents": ["1iycC3jP", "y45yp8Uj", "I8wlxqDb"], "name": "wskyyqDs"}' \
    > test.out 2>&1
eval_tap $? 25 'AdminCreateGroup' test.out

#- 26 SingleAdminGetGroup
./ng net.accelbyte.sdk.cli.Main ugc singleAdminGetGroup \
    --groupId 'vsx0JsTg' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 26 'SingleAdminGetGroup' test.out

#- 27 SingleAdminUpdateGroup
./ng net.accelbyte.sdk.cli.Main ugc singleAdminUpdateGroup \
    --groupId 'x9pEzOnZ' \
    --namespace "$AB_NAMESPACE" \
    --body '{"contents": ["BQY07HqC", "7c653YIx", "f38Sfl2u"], "name": "wkQh8uXc"}' \
    > test.out 2>&1
eval_tap $? 27 'SingleAdminUpdateGroup' test.out

#- 28 SingleAdminDeleteGroup
./ng net.accelbyte.sdk.cli.Main ugc singleAdminDeleteGroup \
    --groupId 'xAlk3wh5' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 28 'SingleAdminDeleteGroup' test.out

#- 29 SingleAdminGetGroupContents
./ng net.accelbyte.sdk.cli.Main ugc singleAdminGetGroupContents \
    --groupId 'Zqjbt3dj' \
    --namespace "$AB_NAMESPACE" \
    --limit '54' \
    --offset '13' \
    > test.out 2>&1
eval_tap $? 29 'SingleAdminGetGroupContents' test.out

#- 30 AdminGetTag
./ng net.accelbyte.sdk.cli.Main ugc adminGetTag \
    --namespace "$AB_NAMESPACE" \
    --limit '93' \
    --offset '76' \
    > test.out 2>&1
eval_tap $? 30 'AdminGetTag' test.out

#- 31 AdminCreateTag
./ng net.accelbyte.sdk.cli.Main ugc adminCreateTag \
    --namespace "$AB_NAMESPACE" \
    --body '{"tag": "DVosTxCl"}' \
    > test.out 2>&1
eval_tap $? 31 'AdminCreateTag' test.out

#- 32 AdminUpdateTag
./ng net.accelbyte.sdk.cli.Main ugc adminUpdateTag \
    --namespace "$AB_NAMESPACE" \
    --tagId '1mvVH4Gd' \
    --body '{"tag": "s74nKZRH"}' \
    > test.out 2>&1
eval_tap $? 32 'AdminUpdateTag' test.out

#- 33 AdminDeleteTag
./ng net.accelbyte.sdk.cli.Main ugc adminDeleteTag \
    --namespace "$AB_NAMESPACE" \
    --tagId 'JKCc7xYB' \
    > test.out 2>&1
eval_tap $? 33 'AdminDeleteTag' test.out

#- 34 AdminGetType
./ng net.accelbyte.sdk.cli.Main ugc adminGetType \
    --namespace "$AB_NAMESPACE" \
    --limit '29' \
    --offset '37' \
    > test.out 2>&1
eval_tap $? 34 'AdminGetType' test.out

#- 35 AdminCreateType
./ng net.accelbyte.sdk.cli.Main ugc adminCreateType \
    --namespace "$AB_NAMESPACE" \
    --body '{"subtype": ["NTHjMdYV", "BEsuNMy6", "nX0rLfTN"], "type": "x2nW8iXE"}' \
    > test.out 2>&1
eval_tap $? 35 'AdminCreateType' test.out

#- 36 AdminUpdateType
./ng net.accelbyte.sdk.cli.Main ugc adminUpdateType \
    --namespace "$AB_NAMESPACE" \
    --typeId 'Cu4M0daJ' \
    --body '{"subtype": ["WI8z11PI", "OCyXylAM", "2p1WTKVT"], "type": "wr5Sia8j"}' \
    > test.out 2>&1
eval_tap $? 36 'AdminUpdateType' test.out

#- 37 AdminDeleteType
./ng net.accelbyte.sdk.cli.Main ugc adminDeleteType \
    --namespace "$AB_NAMESPACE" \
    --typeId 'jlHCZGNr' \
    > test.out 2>&1
eval_tap $? 37 'AdminDeleteType' test.out

#- 38 AdminGetChannel
./ng net.accelbyte.sdk.cli.Main ugc adminGetChannel \
    --namespace "$AB_NAMESPACE" \
    --userId 'MAnlnseA' \
    --limit '90' \
    --name 'J5pxapwO' \
    --offset '18' \
    > test.out 2>&1
eval_tap $? 38 'AdminGetChannel' test.out

#- 39 AdminDeleteAllUserChannels
./ng net.accelbyte.sdk.cli.Main ugc adminDeleteAllUserChannels \
    --namespace "$AB_NAMESPACE" \
    --userId 'D2LDpS6E' \
    > test.out 2>&1
eval_tap $? 39 'AdminDeleteAllUserChannels' test.out

#- 40 AdminUpdateChannel
./ng net.accelbyte.sdk.cli.Main ugc adminUpdateChannel \
    --channelId 'C3sdCyLa' \
    --namespace "$AB_NAMESPACE" \
    --userId 'HCGnNikm' \
    --body '{"name": "wVQ00dNe"}' \
    > test.out 2>&1
eval_tap $? 40 'AdminUpdateChannel' test.out

#- 41 AdminDeleteChannel
./ng net.accelbyte.sdk.cli.Main ugc adminDeleteChannel \
    --channelId 'NRQbv1Ac' \
    --namespace "$AB_NAMESPACE" \
    --userId 'g8cXinBJ' \
    > test.out 2>&1
eval_tap $? 41 'AdminDeleteChannel' test.out

#- 42 AdminUpdateContentS3ByShareCode
./ng net.accelbyte.sdk.cli.Main ugc adminUpdateContentS3ByShareCode \
    --channelId 'oKaUPOfp' \
    --namespace "$AB_NAMESPACE" \
    --shareCode '27x7IMPV' \
    --userId '9rgvGv2A' \
    --body '{"contentType": "szb8iJ5p", "customAttributes": {"Gc9kcmRa": {}, "9k9wvAV5": {}, "Rq4CZwQh": {}}, "fileExtension": "jSebZlgY", "name": "RJ4YvPJG", "payload": "zuOrwHxX", "preview": "zeyVcCmQ", "previewMetadata": {"previewContentType": "kajefmsi", "previewFileExtension": "He2nXmDN"}, "shareCode": "5vbgHAHS", "subType": "nRJfmg17", "tags": ["iIG1342V", "WaNjnITt", "XkMg85eB"], "type": "h7IEXnWj", "updateContentFile": false}' \
    > test.out 2>&1
eval_tap $? 42 'AdminUpdateContentS3ByShareCode' test.out

#- 43 AdminUpdateContentS3
./ng net.accelbyte.sdk.cli.Main ugc adminUpdateContentS3 \
    --channelId 'hSCXIl72' \
    --contentId '6MZYgyre' \
    --namespace "$AB_NAMESPACE" \
    --userId 'hCwD3lrn' \
    --body '{"contentType": "gWjxHji0", "customAttributes": {"4EYIjnd3": {}, "xES90vBH": {}, "eHkFoBXM": {}}, "fileExtension": "pasJdqxt", "name": "Yfv1Dfvg", "payload": "NydNvavz", "preview": "8opmK4qp", "previewMetadata": {"previewContentType": "SjWA1d5Z", "previewFileExtension": "3YlDSBWI"}, "shareCode": "k7a6ObjQ", "subType": "JojsPiTx", "tags": ["BwlFj8OM", "h3bRgxOe", "U4DtPpzz"], "type": "lcYgdOo6", "updateContentFile": false}' \
    > test.out 2>&1
eval_tap $? 43 'AdminUpdateContentS3' test.out

#- 44 DeleteContentByShareCode
./ng net.accelbyte.sdk.cli.Main ugc deleteContentByShareCode \
    --channelId 'U4ccxhrv' \
    --namespace "$AB_NAMESPACE" \
    --shareCode 'COHBoMUc' \
    --userId 'cc5zfEWg' \
    > test.out 2>&1
eval_tap $? 44 'DeleteContentByShareCode' test.out

#- 45 AdminUpdateContentDirect
eval_tap 0 45 'AdminUpdateContentDirect # SKIP deprecated' test.out

#- 46 AdminDeleteContent
./ng net.accelbyte.sdk.cli.Main ugc adminDeleteContent \
    --channelId 'csB5tMFn' \
    --contentId 'IZ3VREM3' \
    --namespace "$AB_NAMESPACE" \
    --userId '6u072C9W' \
    > test.out 2>&1
eval_tap $? 46 'AdminDeleteContent' test.out

#- 47 AdminGetContent
./ng net.accelbyte.sdk.cli.Main ugc adminGetContent \
    --namespace "$AB_NAMESPACE" \
    --userId 'SlUl0Bc4' \
    --limit '17' \
    --offset '25' \
    > test.out 2>&1
eval_tap $? 47 'AdminGetContent' test.out

#- 48 AdminDeleteAllUserContents
./ng net.accelbyte.sdk.cli.Main ugc adminDeleteAllUserContents \
    --namespace "$AB_NAMESPACE" \
    --userId '5lC9kuAi' \
    > test.out 2>&1
eval_tap $? 48 'AdminDeleteAllUserContents' test.out

#- 49 AdminHideUserContent
./ng net.accelbyte.sdk.cli.Main ugc adminHideUserContent \
    --contentId 'A0MzSA8Q' \
    --namespace "$AB_NAMESPACE" \
    --userId '8D0zPInd' \
    --body '{"isHidden": false}' \
    > test.out 2>&1
eval_tap $? 49 'AdminHideUserContent' test.out

#- 50 AdminGetAllGroups
./ng net.accelbyte.sdk.cli.Main ugc adminGetAllGroups \
    --namespace "$AB_NAMESPACE" \
    --userId 'rEPOmZd2' \
    --limit '50' \
    --offset '6' \
    > test.out 2>&1
eval_tap $? 50 'AdminGetAllGroups' test.out

#- 51 AdminDeleteAllUserGroup
./ng net.accelbyte.sdk.cli.Main ugc adminDeleteAllUserGroup \
    --namespace "$AB_NAMESPACE" \
    --userId 'n5MTdK31' \
    > test.out 2>&1
eval_tap $? 51 'AdminDeleteAllUserGroup' test.out

#- 52 AdminGetGroup
./ng net.accelbyte.sdk.cli.Main ugc adminGetGroup \
    --groupId 'O9fPghTH' \
    --namespace "$AB_NAMESPACE" \
    --userId '9V6eU0IC' \
    > test.out 2>&1
eval_tap $? 52 'AdminGetGroup' test.out

#- 53 AdminUpdateGroup
./ng net.accelbyte.sdk.cli.Main ugc adminUpdateGroup \
    --groupId 'OaGlp0zR' \
    --namespace "$AB_NAMESPACE" \
    --userId 'IGgAzGJ2' \
    --body '{"contents": ["ykhYtlWY", "dprBxukT", "ZaoPm5lW"], "name": "m46xbqEh"}' \
    > test.out 2>&1
eval_tap $? 53 'AdminUpdateGroup' test.out

#- 54 AdminDeleteGroup
./ng net.accelbyte.sdk.cli.Main ugc adminDeleteGroup \
    --groupId 'DtgCdGKU' \
    --namespace "$AB_NAMESPACE" \
    --userId 'gReXBmFK' \
    > test.out 2>&1
eval_tap $? 54 'AdminDeleteGroup' test.out

#- 55 AdminGetGroupContents
./ng net.accelbyte.sdk.cli.Main ugc adminGetGroupContents \
    --groupId '1GA0dqFp' \
    --namespace "$AB_NAMESPACE" \
    --userId 'sHM9QzsM' \
    --limit '8' \
    --offset '74' \
    > test.out 2>&1
eval_tap $? 55 'AdminGetGroupContents' test.out

#- 56 AdminDeleteAllUserStates
./ng net.accelbyte.sdk.cli.Main ugc adminDeleteAllUserStates \
    --namespace "$AB_NAMESPACE" \
    --userId 'sxCfCYnY' \
    > test.out 2>&1
eval_tap $? 56 'AdminDeleteAllUserStates' test.out

#- 57 SearchChannelSpecificContent
./ng net.accelbyte.sdk.cli.Main ugc searchChannelSpecificContent \
    --channelId 'm7Pny1oT' \
    --namespace "$AB_NAMESPACE" \
    --creator 'zB8ArRi2' \
    --ishidden 'C16SiWv6' \
    --isofficial 'nWAIOfNh' \
    --limit '88' \
    --name '477d6fu6' \
    --offset '5' \
    --orderby 'ceGq2ox2' \
    --sortby 'rOJDt3cW' \
    --subtype 'bWNmC1RJ' \
    --tags 'bzA8Ddgu,QNAJa5bC,gfi60Nsd' \
    --type 'G037OdCn' \
    --userId 'jgclZe0l' \
    > test.out 2>&1
eval_tap $? 57 'SearchChannelSpecificContent' test.out

#- 58 PublicSearchContent
./ng net.accelbyte.sdk.cli.Main ugc publicSearchContent \
    --namespace "$AB_NAMESPACE" \
    --creator 'AcWrCfvF' \
    --ishidden '5fCi1PR9' \
    --isofficial '9nR4nCDN' \
    --limit '30' \
    --name '5YMHusxV' \
    --offset '38' \
    --orderby 'kIxrvcsi' \
    --sortby 'ObLBo5tc' \
    --subtype 'gp3RTugE' \
    --tags 'NHXszLM1,EHWZ1kvJ,YT0OYLf7' \
    --type 'bpp4pvrZ' \
    --userId '2SvEgqh9' \
    > test.out 2>&1
eval_tap $? 58 'PublicSearchContent' test.out

#- 59 PublicGetContentBulk
./ng net.accelbyte.sdk.cli.Main ugc publicGetContentBulk \
    --namespace "$AB_NAMESPACE" \
    --body '{"contentIds": ["jmbcLUN9", "mQBldVRR", "Bm3ZwNLY"]}' \
    > test.out 2>&1
eval_tap $? 59 'PublicGetContentBulk' test.out

#- 60 GetFollowedContent
./ng net.accelbyte.sdk.cli.Main ugc getFollowedContent \
    --namespace "$AB_NAMESPACE" \
    --limit '92' \
    --offset '41' \
    > test.out 2>&1
eval_tap $? 60 'GetFollowedContent' test.out

#- 61 GetLikedContent
./ng net.accelbyte.sdk.cli.Main ugc getLikedContent \
    --namespace "$AB_NAMESPACE" \
    --isofficial  \
    --limit '9' \
    --name '00YvAzVm' \
    --offset '74' \
    --orderby 'tVcJ25Dx' \
    --sortby 'y28ya58L' \
    --subtype 'TzfhN97W' \
    --tags 'q4b398r3,90vdAv5w,wTZ0vQwM' \
    --type 'xR05sb4t' \
    > test.out 2>&1
eval_tap $? 61 'GetLikedContent' test.out

#- 62 PublicGetContentBulkByShareCodes
./ng net.accelbyte.sdk.cli.Main ugc publicGetContentBulkByShareCodes \
    --namespace "$AB_NAMESPACE" \
    --body '{"shareCodes": ["5bW5Ql03", "rPGpn8GA", "WZ00fpJf"]}' \
    > test.out 2>&1
eval_tap $? 62 'PublicGetContentBulkByShareCodes' test.out

#- 63 PublicDownloadContentByShareCode
./ng net.accelbyte.sdk.cli.Main ugc publicDownloadContentByShareCode \
    --namespace "$AB_NAMESPACE" \
    --shareCode 'jaOswRYa' \
    > test.out 2>&1
eval_tap $? 63 'PublicDownloadContentByShareCode' test.out

#- 64 PublicDownloadContentByContentID
./ng net.accelbyte.sdk.cli.Main ugc publicDownloadContentByContentID \
    --contentId 'cUsaYc4A' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 64 'PublicDownloadContentByContentID' test.out

#- 65 AddDownloadCount
./ng net.accelbyte.sdk.cli.Main ugc addDownloadCount \
    --contentId '7wbclBPa' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 65 'AddDownloadCount' test.out

#- 66 UpdateContentLikeStatus
./ng net.accelbyte.sdk.cli.Main ugc updateContentLikeStatus \
    --contentId 'Wws3d9xq' \
    --namespace "$AB_NAMESPACE" \
    --body '{"likeStatus": true}' \
    > test.out 2>&1
eval_tap $? 66 'UpdateContentLikeStatus' test.out

#- 67 PublicDownloadContentPreview
./ng net.accelbyte.sdk.cli.Main ugc publicDownloadContentPreview \
    --contentId 'Tlupw3Co' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 67 'PublicDownloadContentPreview' test.out

#- 68 GetTag
./ng net.accelbyte.sdk.cli.Main ugc getTag \
    --namespace "$AB_NAMESPACE" \
    --limit '26' \
    --offset '58' \
    > test.out 2>&1
eval_tap $? 68 'GetTag' test.out

#- 69 GetType
./ng net.accelbyte.sdk.cli.Main ugc getType \
    --namespace "$AB_NAMESPACE" \
    --limit '10' \
    --offset '61' \
    > test.out 2>&1
eval_tap $? 69 'GetType' test.out

#- 70 PublicSearchCreator
./ng net.accelbyte.sdk.cli.Main ugc publicSearchCreator \
    --namespace "$AB_NAMESPACE" \
    --limit '2' \
    --offset '1' \
    --orderby 'nPBZ4SBB' \
    --sortby 'tLJdfPQI' \
    > test.out 2>&1
eval_tap $? 70 'PublicSearchCreator' test.out

#- 71 GetFollowedUsers
./ng net.accelbyte.sdk.cli.Main ugc getFollowedUsers \
    --namespace "$AB_NAMESPACE" \
    --limit '64' \
    --offset '11' \
    > test.out 2>&1
eval_tap $? 71 'GetFollowedUsers' test.out

#- 72 PublicGetCreator
./ng net.accelbyte.sdk.cli.Main ugc publicGetCreator \
    --namespace "$AB_NAMESPACE" \
    --userId 'bIjbIs77' \
    > test.out 2>&1
eval_tap $? 72 'PublicGetCreator' test.out

#- 73 GetChannels
./ng net.accelbyte.sdk.cli.Main ugc getChannels \
    --namespace "$AB_NAMESPACE" \
    --userId 'XMZiZwRC' \
    --limit '22' \
    --name 'tAJ1vonA' \
    --offset '66' \
    > test.out 2>&1
eval_tap $? 73 'GetChannels' test.out

#- 74 PublicCreateChannel
./ng net.accelbyte.sdk.cli.Main ugc publicCreateChannel \
    --namespace "$AB_NAMESPACE" \
    --userId 'pWKCY2ey' \
    --body '{"name": "WVHB2U5d"}' \
    > test.out 2>&1
eval_tap $? 74 'PublicCreateChannel' test.out

#- 75 DeleteAllUserChannel
./ng net.accelbyte.sdk.cli.Main ugc deleteAllUserChannel \
    --namespace "$AB_NAMESPACE" \
    --userId '9BhYV37f' \
    > test.out 2>&1
eval_tap $? 75 'DeleteAllUserChannel' test.out

#- 76 UpdateChannel
./ng net.accelbyte.sdk.cli.Main ugc updateChannel \
    --channelId '3bTUHep8' \
    --namespace "$AB_NAMESPACE" \
    --userId 'z3SmXLE6' \
    --body '{"name": "UeCYBGWF"}' \
    > test.out 2>&1
eval_tap $? 76 'UpdateChannel' test.out

#- 77 DeleteChannel
./ng net.accelbyte.sdk.cli.Main ugc deleteChannel \
    --channelId 'W4kkX9HS' \
    --namespace "$AB_NAMESPACE" \
    --userId 'WqMeFQwM' \
    > test.out 2>&1
eval_tap $? 77 'DeleteChannel' test.out

#- 78 CreateContentDirect
eval_tap 0 78 'CreateContentDirect # SKIP deprecated' test.out

#- 79 CreateContentS3
./ng net.accelbyte.sdk.cli.Main ugc createContentS3 \
    --channelId 'Tl86Ob0t' \
    --namespace "$AB_NAMESPACE" \
    --userId 'sS4e5OvG' \
    --body '{"contentType": "qQp7j3Rl", "customAttributes": {"odHKeLNi": {}, "89GXEv4P": {}, "YuiKlXuE": {}}, "fileExtension": "vqZKOHt2", "name": "KV4JFexW", "preview": "A7d5VzKf", "previewMetadata": {"previewContentType": "mKmZZCwy", "previewFileExtension": "viKssq1F"}, "subType": "14iKVd3f", "tags": ["TnwDausl", "y6sY7ekg", "MvCJ4RJo"], "type": "QYJH8XsL"}' \
    > test.out 2>&1
eval_tap $? 79 'CreateContentS3' test.out

#- 80 PublicUpdateContentByShareCode
./ng net.accelbyte.sdk.cli.Main ugc publicUpdateContentByShareCode \
    --channelId 'aNy5hNhV' \
    --namespace "$AB_NAMESPACE" \
    --shareCode 'Ud0NclTW' \
    --userId 'VK0BSZQN' \
    --body '{"contentType": "2phJXIoj", "customAttributes": {"YSfcoIiE": {}, "9WIRGcEP": {}, "kUEwUBEm": {}}, "fileExtension": "542Hb2aY", "name": "B7ennsUQ", "payload": "2mFxSGy3", "preview": "5mnEiOpM", "previewMetadata": {"previewContentType": "HBaUAtmF", "previewFileExtension": "2C9Pkg9l"}, "subType": "SS8xvMbt", "tags": ["M6Qvt06T", "Q9PHtnsD", "H2ZEjNmh"], "type": "H1KGbIHp", "updateContentFile": true}' \
    > test.out 2>&1
eval_tap $? 80 'PublicUpdateContentByShareCode' test.out

#- 81 UpdateContentS3
./ng net.accelbyte.sdk.cli.Main ugc updateContentS3 \
    --channelId 'thtM5pR7' \
    --contentId '3gQZpoJB' \
    --namespace "$AB_NAMESPACE" \
    --userId 'GUEw1VOg' \
    --body '{"contentType": "frVt7RUk", "customAttributes": {"Wv1MTb8m": {}, "2Dg1K2nD": {}, "gV7sZcMn": {}}, "fileExtension": "6yFUIKUj", "name": "euv1nKJf", "payload": "uJVmyeeJ", "preview": "mBtthYs6", "previewMetadata": {"previewContentType": "J63UxMxM", "previewFileExtension": "LcNrhu2o"}, "subType": "8NVtmc0D", "tags": ["fI5anMjg", "NCv1KTcy", "91wCHmTl"], "type": "XZmM0AML", "updateContentFile": true}' \
    > test.out 2>&1
eval_tap $? 81 'UpdateContentS3' test.out

#- 82 PublicDeleteContentByShareCode
./ng net.accelbyte.sdk.cli.Main ugc publicDeleteContentByShareCode \
    --channelId 'HgkSb64E' \
    --namespace "$AB_NAMESPACE" \
    --shareCode 'ouRU3DCk' \
    --userId 'm352TTNp' \
    > test.out 2>&1
eval_tap $? 82 'PublicDeleteContentByShareCode' test.out

#- 83 UpdateContentDirect
eval_tap 0 83 'UpdateContentDirect # SKIP deprecated' test.out

#- 84 DeleteContent
./ng net.accelbyte.sdk.cli.Main ugc deleteContent \
    --channelId 'uVJ9OWrq' \
    --contentId '2lKrt4NF' \
    --namespace "$AB_NAMESPACE" \
    --userId 'chWBE5uC' \
    > test.out 2>&1
eval_tap $? 84 'DeleteContent' test.out

#- 85 UpdateContentShareCode
./ng net.accelbyte.sdk.cli.Main ugc updateContentShareCode \
    --channelId 'vSKilmOL' \
    --contentId 'wBFwkYds' \
    --namespace "$AB_NAMESPACE" \
    --userId 'vqQIZJ60' \
    --body '{"shareCode": "Rf1p7sCp"}' \
    > test.out 2>&1
eval_tap $? 85 'UpdateContentShareCode' test.out

#- 86 PublicGetUserContent
./ng net.accelbyte.sdk.cli.Main ugc publicGetUserContent \
    --namespace "$AB_NAMESPACE" \
    --userId 'dvNebOmW' \
    --limit '54' \
    --offset '64' \
    > test.out 2>&1
eval_tap $? 86 'PublicGetUserContent' test.out

#- 87 DeleteAllUserContents
./ng net.accelbyte.sdk.cli.Main ugc deleteAllUserContents \
    --namespace "$AB_NAMESPACE" \
    --userId 'NAw9VidO' \
    > test.out 2>&1
eval_tap $? 87 'DeleteAllUserContents' test.out

#- 88 UpdateScreenshots
./ng net.accelbyte.sdk.cli.Main ugc updateScreenshots \
    --contentId 'Wu4FAJrU' \
    --namespace "$AB_NAMESPACE" \
    --userId 'ymE93E92' \
    --body '{"screenshots": [{"description": "exLg5tmh", "screenshotId": "GPmcAKOh"}, {"description": "AH92gxVJ", "screenshotId": "PfOg6DqD"}, {"description": "ZydtkOxh", "screenshotId": "0rM9yWlU"}]}' \
    > test.out 2>&1
eval_tap $? 88 'UpdateScreenshots' test.out

#- 89 UploadContentScreenshot
./ng net.accelbyte.sdk.cli.Main ugc uploadContentScreenshot \
    --contentId 'BvwPdOCe' \
    --namespace "$AB_NAMESPACE" \
    --userId 'XnTxEOMJ' \
    --body '{"screenshots": [{"contentType": "5qzOFTxD", "description": "hyx4oLoC", "fileExtension": "jfif"}, {"contentType": "mGYLlmDd", "description": "GgXlpbT2", "fileExtension": "jpg"}, {"contentType": "JlXl0fIg", "description": "MFW3t1Yr", "fileExtension": "jfif"}]}' \
    > test.out 2>&1
eval_tap $? 89 'UploadContentScreenshot' test.out

#- 90 DeleteContentScreenshot
./ng net.accelbyte.sdk.cli.Main ugc deleteContentScreenshot \
    --contentId 'DKIP1KPz' \
    --namespace "$AB_NAMESPACE" \
    --screenshotId 'ZWDcVs1M' \
    --userId 'hqfrnify' \
    > test.out 2>&1
eval_tap $? 90 'DeleteContentScreenshot' test.out

#- 91 UpdateUserFollowStatus
./ng net.accelbyte.sdk.cli.Main ugc updateUserFollowStatus \
    --namespace "$AB_NAMESPACE" \
    --userId 'iHcFoUxO' \
    --body '{"followStatus": true}' \
    > test.out 2>&1
eval_tap $? 91 'UpdateUserFollowStatus' test.out

#- 92 GetPublicFollowers
./ng net.accelbyte.sdk.cli.Main ugc getPublicFollowers \
    --namespace "$AB_NAMESPACE" \
    --userId 'RqPfcL0Y' \
    --limit '37' \
    --offset '70' \
    > test.out 2>&1
eval_tap $? 92 'GetPublicFollowers' test.out

#- 93 GetPublicFollowing
./ng net.accelbyte.sdk.cli.Main ugc getPublicFollowing \
    --namespace "$AB_NAMESPACE" \
    --userId 'BtChWZ1n' \
    --limit '19' \
    --offset '85' \
    > test.out 2>&1
eval_tap $? 93 'GetPublicFollowing' test.out

#- 94 GetGroups
./ng net.accelbyte.sdk.cli.Main ugc getGroups \
    --namespace "$AB_NAMESPACE" \
    --userId 'Uvs81VYs' \
    --limit '50' \
    --offset '25' \
    > test.out 2>&1
eval_tap $? 94 'GetGroups' test.out

#- 95 CreateGroup
./ng net.accelbyte.sdk.cli.Main ugc createGroup \
    --namespace "$AB_NAMESPACE" \
    --userId 'H3qJpZtB' \
    --body '{"contents": ["A5MSvNDz", "Ro4tBPo6", "iBHgVhQ1"], "name": "wdKFHy8r"}' \
    > test.out 2>&1
eval_tap $? 95 'CreateGroup' test.out

#- 96 DeleteAllUserGroup
./ng net.accelbyte.sdk.cli.Main ugc deleteAllUserGroup \
    --namespace "$AB_NAMESPACE" \
    --userId 'B2e9uAfX' \
    > test.out 2>&1
eval_tap $? 96 'DeleteAllUserGroup' test.out

#- 97 GetGroup
./ng net.accelbyte.sdk.cli.Main ugc getGroup \
    --groupId 'nqGFLOfR' \
    --namespace "$AB_NAMESPACE" \
    --userId '0fsCooNO' \
    > test.out 2>&1
eval_tap $? 97 'GetGroup' test.out

#- 98 UpdateGroup
./ng net.accelbyte.sdk.cli.Main ugc updateGroup \
    --groupId 'CS3lpZvx' \
    --namespace "$AB_NAMESPACE" \
    --userId 'NnESe44r' \
    --body '{"contents": ["xxx4yQUz", "cl3VzWkH", "BICb6UtZ"], "name": "hQwV8HGw"}' \
    > test.out 2>&1
eval_tap $? 98 'UpdateGroup' test.out

#- 99 DeleteGroup
./ng net.accelbyte.sdk.cli.Main ugc deleteGroup \
    --groupId 'fR9Ssv56' \
    --namespace "$AB_NAMESPACE" \
    --userId '1K5nYZw9' \
    > test.out 2>&1
eval_tap $? 99 'DeleteGroup' test.out

#- 100 GetGroupContent
./ng net.accelbyte.sdk.cli.Main ugc getGroupContent \
    --groupId 'GFSAlbAb' \
    --namespace "$AB_NAMESPACE" \
    --userId 'JwkYTDzU' \
    --limit '54' \
    --offset '76' \
    > test.out 2>&1
eval_tap $? 100 'GetGroupContent' test.out

#- 101 DeleteAllUserStates
./ng net.accelbyte.sdk.cli.Main ugc deleteAllUserStates \
    --namespace "$AB_NAMESPACE" \
    --userId 'B2TGWIt4' \
    > test.out 2>&1
eval_tap $? 101 'DeleteAllUserStates' test.out

#- 102 AdminGetContentByChannelIDV2
./ng net.accelbyte.sdk.cli.Main ugc adminGetContentByChannelIDV2 \
    --channelId 'VFJLQIn5' \
    --namespace "$AB_NAMESPACE" \
    --limit '39' \
    --name 'vEQ70Wmh' \
    --offset '47' \
    --sortBy 'VhjO0FHA' \
    > test.out 2>&1
eval_tap $? 102 'AdminGetContentByChannelIDV2' test.out

#- 103 AdminCreateContentV2
./ng net.accelbyte.sdk.cli.Main ugc adminCreateContentV2 \
    --channelId 'WuvSiIDI' \
    --namespace "$AB_NAMESPACE" \
    --body '{"contentType": "TpwUXhAd", "customAttributes": {"dyB6MgsK": {}, "xQkKfmiI": {}, "sQ9JNU76": {}}, "fileExtension": "Sal77Lv7", "name": "U88Oy43D", "shareCode": "sfRgAyk4", "subType": "krgkXDEt", "tags": ["d1Y2a360", "L9Xp3xTH", "KnVP5fMr"], "type": "OKkm8itB"}' \
    > test.out 2>&1
eval_tap $? 103 'AdminCreateContentV2' test.out

#- 104 AdminDeleteOfficialContentV2
./ng net.accelbyte.sdk.cli.Main ugc adminDeleteOfficialContentV2 \
    --channelId 'qHKLneuM' \
    --contentId 'ebMxtGlq' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 104 'AdminDeleteOfficialContentV2' test.out

#- 105 AdminUpdateOfficialContentV2
./ng net.accelbyte.sdk.cli.Main ugc adminUpdateOfficialContentV2 \
    --channelId 'NKIxNQDG' \
    --contentId 'Icau4zpC' \
    --namespace "$AB_NAMESPACE" \
    --body '{"customAttributes": {"W5n68HDS": {}, "baUd9FuX": {}, "28AoG4Qe": {}}, "name": "SOueqnqi", "shareCode": "TNVtMZoH", "subType": "6ZnJFyMD", "tags": ["Lkq2tjle", "BR147qjg", "JmesXFa0"], "type": "7egOBUUm"}' \
    > test.out 2>&1
eval_tap $? 105 'AdminUpdateOfficialContentV2' test.out

#- 106 AdminUpdateOfficialContentFileLocation
./ng net.accelbyte.sdk.cli.Main ugc adminUpdateOfficialContentFileLocation \
    --channelId 'DfTc0ga9' \
    --contentId 'fpBKiaSq' \
    --namespace "$AB_NAMESPACE" \
    --body '{"fileExtension": "qgWUr8nR", "fileLocation": "jN58SA2V"}' \
    > test.out 2>&1
eval_tap $? 106 'AdminUpdateOfficialContentFileLocation' test.out

#- 107 AdminGenerateOfficialContentUploadURLV2
./ng net.accelbyte.sdk.cli.Main ugc adminGenerateOfficialContentUploadURLV2 \
    --channelId 'dvUWRUdG' \
    --contentId 'xT0dOCzg' \
    --namespace "$AB_NAMESPACE" \
    --body '{"contentType": "i7UzUbBN", "fileExtension": "A7Ah1uij"}' \
    > test.out 2>&1
eval_tap $? 107 'AdminGenerateOfficialContentUploadURLV2' test.out

#- 108 AdminGetConfigs
./ng net.accelbyte.sdk.cli.Main ugc adminGetConfigs \
    --namespace "$AB_NAMESPACE" \
    --limit '84' \
    --offset '38' \
    > test.out 2>&1
eval_tap $? 108 'AdminGetConfigs' test.out

#- 109 AdminUpdateConfig
./ng net.accelbyte.sdk.cli.Main ugc adminUpdateConfig \
    --key 'qzAuJbDp' \
    --namespace "$AB_NAMESPACE" \
    --body '{"value": "fFz8IKfw"}' \
    > test.out 2>&1
eval_tap $? 109 'AdminUpdateConfig' test.out

#- 110 AdminListContentV2
./ng net.accelbyte.sdk.cli.Main ugc adminListContentV2 \
    --namespace "$AB_NAMESPACE" \
    --isOfficial  \
    --limit '8' \
    --name '5IbEqQPs' \
    --offset '26' \
    --sortBy 'mKROXNl7' \
    --subType 'rTu8WBmx' \
    --tags 'khVTqLlG,XuDsAukJ,nOGTvdA9' \
    --type '3E7HZFfz' \
    > test.out 2>&1
eval_tap $? 110 'AdminListContentV2' test.out

#- 111 AdminBulkGetContentByIDsV2
./ng net.accelbyte.sdk.cli.Main ugc adminBulkGetContentByIDsV2 \
    --namespace "$AB_NAMESPACE" \
    --body '{"contentIds": ["A9KUYhBJ", "eTX5vum8", "fAuAwAKS"]}' \
    > test.out 2>&1
eval_tap $? 111 'AdminBulkGetContentByIDsV2' test.out

#- 112 AdminGetContentBulkByShareCodesV2
./ng net.accelbyte.sdk.cli.Main ugc adminGetContentBulkByShareCodesV2 \
    --namespace "$AB_NAMESPACE" \
    --body '{"shareCodes": ["TvawUi0f", "iNx0pBHZ", "IIHZhzIR"]}' \
    > test.out 2>&1
eval_tap $? 112 'AdminGetContentBulkByShareCodesV2' test.out

#- 113 AdminGetContentByShareCodeV2
./ng net.accelbyte.sdk.cli.Main ugc adminGetContentByShareCodeV2 \
    --namespace "$AB_NAMESPACE" \
    --shareCode 'R4AwT2dl' \
    > test.out 2>&1
eval_tap $? 113 'AdminGetContentByShareCodeV2' test.out

#- 114 AdminGetContentByContentIDV2
./ng net.accelbyte.sdk.cli.Main ugc adminGetContentByContentIDV2 \
    --contentId 'tSUG6ozF' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 114 'AdminGetContentByContentIDV2' test.out

#- 115 RollbackContentVersionV2
./ng net.accelbyte.sdk.cli.Main ugc rollbackContentVersionV2 \
    --contentId 'zaqx7qsA' \
    --namespace "$AB_NAMESPACE" \
    --versionId '5CcsVspF' \
    > test.out 2>&1
eval_tap $? 115 'RollbackContentVersionV2' test.out

#- 116 AdminUpdateScreenshotsV2
./ng net.accelbyte.sdk.cli.Main ugc adminUpdateScreenshotsV2 \
    --contentId 'RDrI1na6' \
    --namespace "$AB_NAMESPACE" \
    --body '{"screenshots": [{"description": "cipAc7bO", "screenshotId": "bw2ZR3cq"}, {"description": "OshFLqpv", "screenshotId": "WqyHFybR"}, {"description": "Pic1G4SU", "screenshotId": "ZTDtqTTW"}]}' \
    > test.out 2>&1
eval_tap $? 116 'AdminUpdateScreenshotsV2' test.out

#- 117 AdminUploadContentScreenshotV2
./ng net.accelbyte.sdk.cli.Main ugc adminUploadContentScreenshotV2 \
    --contentId 'oKryPW5w' \
    --namespace "$AB_NAMESPACE" \
    --body '{"screenshots": [{"contentType": "d5xyNTum", "description": "AtRri9pn", "fileExtension": "jpeg"}, {"contentType": "FWmKCtsS", "description": "gjvKgp6I", "fileExtension": "jpeg"}, {"contentType": "bRHJEYWa", "description": "YUtgev9T", "fileExtension": "pjp"}]}' \
    > test.out 2>&1
eval_tap $? 117 'AdminUploadContentScreenshotV2' test.out

#- 118 AdminDeleteContentScreenshotV2
./ng net.accelbyte.sdk.cli.Main ugc adminDeleteContentScreenshotV2 \
    --contentId 'sdTs6g5P' \
    --namespace "$AB_NAMESPACE" \
    --screenshotId 'a2CD310q' \
    > test.out 2>&1
eval_tap $? 118 'AdminDeleteContentScreenshotV2' test.out

#- 119 ListContentVersionsV2
./ng net.accelbyte.sdk.cli.Main ugc listContentVersionsV2 \
    --contentId 'b7xveq9S' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 119 'ListContentVersionsV2' test.out

#- 120 AdminGetOfficialGroupContentsV2
./ng net.accelbyte.sdk.cli.Main ugc adminGetOfficialGroupContentsV2 \
    --groupId 'iv3hmvnF' \
    --namespace "$AB_NAMESPACE" \
    --limit '17' \
    --offset '81' \
    > test.out 2>&1
eval_tap $? 120 'AdminGetOfficialGroupContentsV2' test.out

#- 121 AdminListStagingContents
./ng net.accelbyte.sdk.cli.Main ugc adminListStagingContents \
    --namespace "$AB_NAMESPACE" \
    --limit '53' \
    --offset '21' \
    --sortBy 'LptOe3C7' \
    --status 'YcDC9wV9' \
    > test.out 2>&1
eval_tap $? 121 'AdminListStagingContents' test.out

#- 122 AdminGetStagingContentByID
./ng net.accelbyte.sdk.cli.Main ugc adminGetStagingContentByID \
    --contentId '5tnlbrtJ' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 122 'AdminGetStagingContentByID' test.out

#- 123 AdminApproveStagingContent
./ng net.accelbyte.sdk.cli.Main ugc adminApproveStagingContent \
    --contentId 'yplb7IP0' \
    --namespace "$AB_NAMESPACE" \
    --body '{"approved": true, "note": "2nCDdKLU"}' \
    > test.out 2>&1
eval_tap $? 123 'AdminApproveStagingContent' test.out

#- 124 AdminUpdateContentByShareCodeV2
./ng net.accelbyte.sdk.cli.Main ugc adminUpdateContentByShareCodeV2 \
    --channelId 'UstxHLSx' \
    --namespace "$AB_NAMESPACE" \
    --shareCode 'zET96Hbp' \
    --userId 'uaNDFFXd' \
    --body '{"customAttributes": {"JywXZ8dW": {}, "uvpXNsIU": {}, "hX6lqeav": {}}, "name": "J5P1HqHJ", "shareCode": "I6KMt71C", "subType": "Spt4SSdp", "tags": ["MY37nroI", "gs62qAJT", "ANu1LTcB"], "type": "Gc4aQHWp"}' \
    > test.out 2>&1
eval_tap $? 124 'AdminUpdateContentByShareCodeV2' test.out

#- 125 AdminDeleteContentByShareCodeV2
./ng net.accelbyte.sdk.cli.Main ugc adminDeleteContentByShareCodeV2 \
    --channelId 'IA8q91aK' \
    --namespace "$AB_NAMESPACE" \
    --shareCode 'glLoQQwh' \
    --userId 'J0MwEMgl' \
    > test.out 2>&1
eval_tap $? 125 'AdminDeleteContentByShareCodeV2' test.out

#- 126 AdminDeleteUserContentV2
./ng net.accelbyte.sdk.cli.Main ugc adminDeleteUserContentV2 \
    --channelId 'bZKPky4C' \
    --contentId 'b8QDxq1X' \
    --namespace "$AB_NAMESPACE" \
    --userId '633dgv9K' \
    > test.out 2>&1
eval_tap $? 126 'AdminDeleteUserContentV2' test.out

#- 127 AdminUpdateUserContentV2
./ng net.accelbyte.sdk.cli.Main ugc adminUpdateUserContentV2 \
    --channelId 'KwXySyTs' \
    --contentId 'n1O2xdSN' \
    --namespace "$AB_NAMESPACE" \
    --userId 'bss3ND8o' \
    --body '{"customAttributes": {"9GIqgOxO": {}, "9o1sy6Ua": {}, "jthbKrLp": {}}, "name": "5kWP88Gz", "shareCode": "jabsjaZl", "subType": "KqsIaHXI", "tags": ["KK5CExkH", "29qunFaJ", "VbO7BcLB"], "type": "omeBtTHd"}' \
    > test.out 2>&1
eval_tap $? 127 'AdminUpdateUserContentV2' test.out

#- 128 AdminUpdateUserContentFileLocation
./ng net.accelbyte.sdk.cli.Main ugc adminUpdateUserContentFileLocation \
    --channelId 'oFHeR18t' \
    --contentId 'xqWft3dG' \
    --namespace "$AB_NAMESPACE" \
    --userId 'nqmg0H2z' \
    --body '{"fileExtension": "atChkKMd", "fileLocation": "8Akkpt7C"}' \
    > test.out 2>&1
eval_tap $? 128 'AdminUpdateUserContentFileLocation' test.out

#- 129 AdminGenerateUserContentUploadURLV2
./ng net.accelbyte.sdk.cli.Main ugc adminGenerateUserContentUploadURLV2 \
    --channelId 'oWBkLmfJ' \
    --contentId 'Z88sBbga' \
    --namespace "$AB_NAMESPACE" \
    --userId 'iW3imrfZ' \
    --body '{"contentType": "eNEBwBRx", "fileExtension": "FwMGwklu"}' \
    > test.out 2>&1
eval_tap $? 129 'AdminGenerateUserContentUploadURLV2' test.out

#- 130 AdminGetContentByUserIDV2
./ng net.accelbyte.sdk.cli.Main ugc adminGetContentByUserIDV2 \
    --namespace "$AB_NAMESPACE" \
    --userId 'ceBOKFdB' \
    --limit '63' \
    --offset '7' \
    --sortBy 'lPCFYyge' \
    > test.out 2>&1
eval_tap $? 130 'AdminGetContentByUserIDV2' test.out

#- 131 AdminUpdateContentHideStatusV2
./ng net.accelbyte.sdk.cli.Main ugc adminUpdateContentHideStatusV2 \
    --contentId 'gnMiQ47x' \
    --namespace "$AB_NAMESPACE" \
    --userId '0CPvf2BX' \
    --body '{"isHidden": true}' \
    > test.out 2>&1
eval_tap $? 131 'AdminUpdateContentHideStatusV2' test.out

#- 132 AdminGetUserGroupContentsV2
./ng net.accelbyte.sdk.cli.Main ugc adminGetUserGroupContentsV2 \
    --groupId 'nWb3vtth' \
    --namespace "$AB_NAMESPACE" \
    --userId 'shOEplOl' \
    --limit '44' \
    --offset '39' \
    > test.out 2>&1
eval_tap $? 132 'AdminGetUserGroupContentsV2' test.out

#- 133 AdminListUserStagingContents
./ng net.accelbyte.sdk.cli.Main ugc adminListUserStagingContents \
    --namespace "$AB_NAMESPACE" \
    --userId 'QjXF9G3t' \
    --limit '75' \
    --offset '34' \
    --sortBy 'ANjqzGTw' \
    --status 'fMErdtRE' \
    > test.out 2>&1
eval_tap $? 133 'AdminListUserStagingContents' test.out

#- 134 PublicGetContentByChannelIDV2
./ng net.accelbyte.sdk.cli.Main ugc publicGetContentByChannelIDV2 \
    --channelId 'RvejRS1c' \
    --namespace "$AB_NAMESPACE" \
    --limit '25' \
    --name '4N3jTwxX' \
    --offset '66' \
    --sortBy 'BCy7GXKM' \
    > test.out 2>&1
eval_tap $? 134 'PublicGetContentByChannelIDV2' test.out

#- 135 PublicListContentV2
./ng net.accelbyte.sdk.cli.Main ugc publicListContentV2 \
    --namespace "$AB_NAMESPACE" \
    --isOfficial  \
    --limit '93' \
    --name 'AVP3gJI0' \
    --offset '81' \
    --sortBy 'gzapkWY7' \
    --subType 'Q3FFId0W' \
    --tags 'KoTPDSk0,QSDJZq7j,Q7vDudH7' \
    --type 'jvDzGGUt' \
    > test.out 2>&1
eval_tap $? 135 'PublicListContentV2' test.out

#- 136 PublicBulkGetContentByIDV2
./ng net.accelbyte.sdk.cli.Main ugc publicBulkGetContentByIDV2 \
    --namespace "$AB_NAMESPACE" \
    --body '{"contentIds": ["1Dsm9KlL", "XmZhZVYE", "9Yc3tdWL"]}' \
    > test.out 2>&1
eval_tap $? 136 'PublicBulkGetContentByIDV2' test.out

#- 137 PublicGetContentBulkByShareCodesV2
./ng net.accelbyte.sdk.cli.Main ugc publicGetContentBulkByShareCodesV2 \
    --namespace "$AB_NAMESPACE" \
    --body '{"shareCodes": ["vFGbvA0n", "zxz8rUVu", "dR9Z5jnx"]}' \
    > test.out 2>&1
eval_tap $? 137 'PublicGetContentBulkByShareCodesV2' test.out

#- 138 PublicGetContentByShareCodeV2
./ng net.accelbyte.sdk.cli.Main ugc publicGetContentByShareCodeV2 \
    --namespace "$AB_NAMESPACE" \
    --shareCode 'yVBYJaWn' \
    > test.out 2>&1
eval_tap $? 138 'PublicGetContentByShareCodeV2' test.out

#- 139 PublicGetContentByIDV2
./ng net.accelbyte.sdk.cli.Main ugc publicGetContentByIDV2 \
    --contentId 't8c0kp7K' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 139 'PublicGetContentByIDV2' test.out

#- 140 PublicAddDownloadCountV2
./ng net.accelbyte.sdk.cli.Main ugc publicAddDownloadCountV2 \
    --contentId 'Fh3Fq0uu' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 140 'PublicAddDownloadCountV2' test.out

#- 141 PublicListContentDownloaderV2
./ng net.accelbyte.sdk.cli.Main ugc publicListContentDownloaderV2 \
    --contentId 'RK37JrTc' \
    --namespace "$AB_NAMESPACE" \
    --limit '75' \
    --offset '24' \
    --sortBy 'DHYflkln' \
    --userId 'tVgBI3hN' \
    > test.out 2>&1
eval_tap $? 141 'PublicListContentDownloaderV2' test.out

#- 142 PublicListContentLikeV2
./ng net.accelbyte.sdk.cli.Main ugc publicListContentLikeV2 \
    --contentId 'U6l1qFO1' \
    --namespace "$AB_NAMESPACE" \
    --limit '17' \
    --offset '73' \
    --sortBy '8G0wXYxM' \
    > test.out 2>&1
eval_tap $? 142 'PublicListContentLikeV2' test.out

#- 143 UpdateContentLikeStatusV2
./ng net.accelbyte.sdk.cli.Main ugc updateContentLikeStatusV2 \
    --contentId 'RhrPSRUP' \
    --namespace "$AB_NAMESPACE" \
    --body '{"likeStatus": false}' \
    > test.out 2>&1
eval_tap $? 143 'UpdateContentLikeStatusV2' test.out

#- 144 PublicCreateContentV2
./ng net.accelbyte.sdk.cli.Main ugc publicCreateContentV2 \
    --channelId 'NasXDeWl' \
    --namespace "$AB_NAMESPACE" \
    --userId 'p6B7JY44' \
    --body '{"contentType": "n32Qu0dd", "customAttributes": {"QUlZpReG": {}, "FoP9TA7T": {}, "RpKAml45": {}}, "fileExtension": "RMDywwKc", "name": "2jXRYLdQ", "subType": "8arRmYXM", "tags": ["OW8QSedr", "H8lcsCSf", "W9aLDw7K"], "type": "czCCb7YV"}' \
    > test.out 2>&1
eval_tap $? 144 'PublicCreateContentV2' test.out

#- 145 PublicUpdateContentByShareCodeV2
./ng net.accelbyte.sdk.cli.Main ugc publicUpdateContentByShareCodeV2 \
    --channelId '0OroYoKm' \
    --namespace "$AB_NAMESPACE" \
    --shareCode 'rIrBvAE0' \
    --userId 'ROKDc4Fm' \
    --body '{"customAttributes": {"LDVVg2oK": {}, "HakUmmaA": {}, "myevMYqI": {}}, "name": "fdCw9Pgw", "subType": "g0yK6ckq", "tags": ["m6yMWOQl", "vcgThP1y", "rox666Ld"], "type": "wIzUBaui"}' \
    > test.out 2>&1
eval_tap $? 145 'PublicUpdateContentByShareCodeV2' test.out

#- 146 PublicDeleteContentByShareCodeV2
./ng net.accelbyte.sdk.cli.Main ugc publicDeleteContentByShareCodeV2 \
    --channelId '1IZkTqAS' \
    --namespace "$AB_NAMESPACE" \
    --shareCode 'K87CeS7F' \
    --userId 'Tmae0gZh' \
    > test.out 2>&1
eval_tap $? 146 'PublicDeleteContentByShareCodeV2' test.out

#- 147 PublicDeleteContentV2
./ng net.accelbyte.sdk.cli.Main ugc publicDeleteContentV2 \
    --channelId 'qPnEtHFH' \
    --contentId 'SlcMg4YE' \
    --namespace "$AB_NAMESPACE" \
    --userId 'KLZBZ1Hi' \
    > test.out 2>&1
eval_tap $? 147 'PublicDeleteContentV2' test.out

#- 148 PublicUpdateContentV2
./ng net.accelbyte.sdk.cli.Main ugc publicUpdateContentV2 \
    --channelId '5xRDi0YF' \
    --contentId '96rmVU5k' \
    --namespace "$AB_NAMESPACE" \
    --userId 'izVDRiOV' \
    --body '{"customAttributes": {"CJntIJSh": {}, "rCUXRWy8": {}, "ARxd3Qfh": {}}, "name": "leCMAX1i", "subType": "oGPi2g9x", "tags": ["0x77gQ4B", "nQoxu3d9", "02hrlOJZ"], "type": "8gYhRm8r"}' \
    > test.out 2>&1
eval_tap $? 148 'PublicUpdateContentV2' test.out

#- 149 PublicUpdateContentFileLocation
./ng net.accelbyte.sdk.cli.Main ugc publicUpdateContentFileLocation \
    --channelId 'erbIIvNd' \
    --contentId 'Lr8o0dwZ' \
    --namespace "$AB_NAMESPACE" \
    --userId 'hzHvjoEJ' \
    --body '{"fileExtension": "bkMuF2jS", "fileLocation": "O98RUlSl"}' \
    > test.out 2>&1
eval_tap $? 149 'PublicUpdateContentFileLocation' test.out

#- 150 UpdateContentShareCodeV2
./ng net.accelbyte.sdk.cli.Main ugc updateContentShareCodeV2 \
    --channelId 'dRwANypW' \
    --contentId 'CELeunvg' \
    --namespace "$AB_NAMESPACE" \
    --userId 'x22whSqB' \
    --body '{"shareCode": "DdMV0jY2"}' \
    > test.out 2>&1
eval_tap $? 150 'UpdateContentShareCodeV2' test.out

#- 151 PublicGenerateContentUploadURLV2
./ng net.accelbyte.sdk.cli.Main ugc publicGenerateContentUploadURLV2 \
    --channelId 'MK2qr8IT' \
    --contentId 'eP77xtUs' \
    --namespace "$AB_NAMESPACE" \
    --userId 'suxqe2QT' \
    --body '{"contentType": "3Xd7ic94", "fileExtension": "xNoBE5ke"}' \
    > test.out 2>&1
eval_tap $? 151 'PublicGenerateContentUploadURLV2' test.out

#- 152 PublicGetContentByUserIDV2
./ng net.accelbyte.sdk.cli.Main ugc publicGetContentByUserIDV2 \
    --namespace "$AB_NAMESPACE" \
    --userId 'BGfCFqba' \
    --limit '72' \
    --offset '73' \
    --sortBy 'C1LefyKs' \
    > test.out 2>&1
eval_tap $? 152 'PublicGetContentByUserIDV2' test.out

#- 153 UpdateScreenshotsV2
./ng net.accelbyte.sdk.cli.Main ugc updateScreenshotsV2 \
    --contentId 'm6kDhanx' \
    --namespace "$AB_NAMESPACE" \
    --userId 'fldGUGeJ' \
    --body '{"screenshots": [{"description": "zyjCSO0c", "screenshotId": "VoRQvtrt"}, {"description": "8BArXZRC", "screenshotId": "u9mcUtxH"}, {"description": "mxjhYOu4", "screenshotId": "3QaJdiXJ"}]}' \
    > test.out 2>&1
eval_tap $? 153 'UpdateScreenshotsV2' test.out

#- 154 UploadContentScreenshotV2
./ng net.accelbyte.sdk.cli.Main ugc uploadContentScreenshotV2 \
    --contentId 'pkW6ztf9' \
    --namespace "$AB_NAMESPACE" \
    --userId 'rjrwrpRj' \
    --body '{"screenshots": [{"contentType": "eDoC0yJX", "description": "KSW6QYZp", "fileExtension": "bmp"}, {"contentType": "ZiFjUAa4", "description": "C2P8TUZO", "fileExtension": "jpg"}, {"contentType": "FDb0j88a", "description": "QVJ41yT9", "fileExtension": "jpeg"}]}' \
    > test.out 2>&1
eval_tap $? 154 'UploadContentScreenshotV2' test.out

#- 155 DeleteContentScreenshotV2
./ng net.accelbyte.sdk.cli.Main ugc deleteContentScreenshotV2 \
    --contentId 'n0UFDY1Z' \
    --namespace "$AB_NAMESPACE" \
    --screenshotId '2edaTlb0' \
    --userId 'Bp3ca1z6' \
    > test.out 2>&1
eval_tap $? 155 'DeleteContentScreenshotV2' test.out

#- 156 PublicGetGroupContentsV2
./ng net.accelbyte.sdk.cli.Main ugc publicGetGroupContentsV2 \
    --groupId 'QEQHDECE' \
    --namespace "$AB_NAMESPACE" \
    --userId 'clsKH7zM' \
    --limit '38' \
    --offset '43' \
    > test.out 2>&1
eval_tap $? 156 'PublicGetGroupContentsV2' test.out

#- 157 ListUserStagingContents
./ng net.accelbyte.sdk.cli.Main ugc listUserStagingContents \
    --namespace "$AB_NAMESPACE" \
    --userId 'KnpQCd8V' \
    --limit '87' \
    --offset '86' \
    --sortBy 'o5M9pYUT' \
    --status 'K7a2c0kr' \
    > test.out 2>&1
eval_tap $? 157 'ListUserStagingContents' test.out

#- 158 GetUserStagingContentByID
./ng net.accelbyte.sdk.cli.Main ugc getUserStagingContentByID \
    --contentId 'KJeolLMD' \
    --namespace "$AB_NAMESPACE" \
    --userId 'HqFft3zj' \
    > test.out 2>&1
eval_tap $? 158 'GetUserStagingContentByID' test.out

#- 159 UpdateStagingContent
./ng net.accelbyte.sdk.cli.Main ugc updateStagingContent \
    --contentId 'jgU1dNR5' \
    --namespace "$AB_NAMESPACE" \
    --userId 'w5vOz8f3' \
    --body '{"fileExtension": "xQdcSkV5", "fileLocation": "PJSfzjCJ"}' \
    > test.out 2>&1
eval_tap $? 159 'UpdateStagingContent' test.out

#- 160 DeleteUserStagingContentByID
./ng net.accelbyte.sdk.cli.Main ugc deleteUserStagingContentByID \
    --contentId '2QW4Dq6j' \
    --namespace "$AB_NAMESPACE" \
    --userId 'XW5uO1kO' \
    > test.out 2>&1
eval_tap $? 160 'DeleteUserStagingContentByID' test.out


rm -f "tmp.dat"

exit $EXIT_CODE