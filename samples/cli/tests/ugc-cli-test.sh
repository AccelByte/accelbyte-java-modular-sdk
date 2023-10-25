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
echo "1..97"

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
    --offset '63' \
    > test.out 2>&1
eval_tap $? 2 'SingleAdminGetChannel' test.out

#- 3 AdminCreateChannel
./ng net.accelbyte.sdk.cli.Main ugc adminCreateChannel \
    --namespace "$AB_NAMESPACE" \
    --body '{"id": "1PLyvIYj", "name": "jyBH1GPg"}' \
    > test.out 2>&1
eval_tap $? 3 'AdminCreateChannel' test.out

#- 4 SingleAdminUpdateChannel
./ng net.accelbyte.sdk.cli.Main ugc singleAdminUpdateChannel \
    --channelId 'Qcw2dsC6' \
    --namespace "$AB_NAMESPACE" \
    --body '{"name": "RqBKiXar"}' \
    > test.out 2>&1
eval_tap $? 4 'SingleAdminUpdateChannel' test.out

#- 5 SingleAdminDeleteChannel
./ng net.accelbyte.sdk.cli.Main ugc singleAdminDeleteChannel \
    --channelId 'NhkK6qEv' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 5 'SingleAdminDeleteChannel' test.out

#- 6 AdminUploadContentDirect
eval_tap 0 6 'AdminUploadContentDirect # SKIP deprecated' test.out

#- 7 AdminUploadContentS3
./ng net.accelbyte.sdk.cli.Main ugc adminUploadContentS3 \
    --channelId 'enVvqLep' \
    --namespace "$AB_NAMESPACE" \
    --body '{"contentType": "xmymG2c0", "customAttributes": {"l60GxZYp": {}, "i43lVjz9": {}, "haBSmZFb": {}}, "fileExtension": "vGW8UihI", "name": "9TJSgsdO", "preview": "MT3xE2kE", "previewMetadata": {"previewContentType": "RpaJX7CZ", "previewFileExtension": "BkWJrkZO"}, "shareCode": "ZxhTR7fW", "subType": "eUZ78nel", "tags": ["F9zBi3Oi", "Bf9dAgAv", "c2PeMKqq"], "type": "RduKCYmG"}' \
    > test.out 2>&1
eval_tap $? 7 'AdminUploadContentS3' test.out

#- 8 SingleAdminUpdateContentS3
./ng net.accelbyte.sdk.cli.Main ugc singleAdminUpdateContentS3 \
    --channelId 'QiUMyauN' \
    --contentId 'sPJaJLQJ' \
    --namespace "$AB_NAMESPACE" \
    --body '{"contentType": "UQhfLIdg", "customAttributes": {"ONp6XCi2": {}, "d72ZhRrP": {}, "2JrLFOIJ": {}}, "fileExtension": "2wuLmPrd", "name": "aTvL2CGC", "payload": "1Wm0QDFs", "preview": "iwMOUEuI", "previewMetadata": {"previewContentType": "nfobVWth", "previewFileExtension": "q9Rm7uvS"}, "shareCode": "4V3iOnRg", "subType": "xkCfXG5x", "tags": ["MkHgIrgq", "zHNkr8IJ", "hfIRVVml"], "type": "AtOXZqu3", "updateContentFile": true}' \
    > test.out 2>&1
eval_tap $? 8 'SingleAdminUpdateContentS3' test.out

#- 9 AdminSearchChannelSpecificContent
./ng net.accelbyte.sdk.cli.Main ugc adminSearchChannelSpecificContent \
    --channelId 'qvLjhEmr' \
    --namespace "$AB_NAMESPACE" \
    --creator 'pSCxC277' \
    --ishidden 'JGdRFElU' \
    --isofficial 'UYAcAqhf' \
    --limit '7' \
    --name 'Zyy62Vo6' \
    --offset '66' \
    --orderby 'GugPayqi' \
    --sortby 'UA3fxFjg' \
    --subtype 'jcB0xy6Q' \
    --tags 'rXBaulnr,Efqh5SCG,DkYNrIgf' \
    --type 'NtWfzLHV' \
    --userId 'tUABoOUw' \
    > test.out 2>&1
eval_tap $? 9 'AdminSearchChannelSpecificContent' test.out

#- 10 SingleAdminUpdateContentDirect
eval_tap 0 10 'SingleAdminUpdateContentDirect # SKIP deprecated' test.out

#- 11 SingleAdminDeleteContent
./ng net.accelbyte.sdk.cli.Main ugc singleAdminDeleteContent \
    --channelId 'BRk7PM0G' \
    --contentId 'sbzDW7hF' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 11 'SingleAdminDeleteContent' test.out

#- 12 SingleAdminGetContent
./ng net.accelbyte.sdk.cli.Main ugc singleAdminGetContent \
    --namespace "$AB_NAMESPACE" \
    --limit '2' \
    --offset '93' \
    > test.out 2>&1
eval_tap $? 12 'SingleAdminGetContent' test.out

#- 13 AdminGetContentBulk
./ng net.accelbyte.sdk.cli.Main ugc adminGetContentBulk \
    --namespace "$AB_NAMESPACE" \
    --body '{"contentIds": ["IvhQsJNQ", "bWfoI0bp", "luCLvvet"]}' \
    > test.out 2>&1
eval_tap $? 13 'AdminGetContentBulk' test.out

#- 14 AdminSearchContent
./ng net.accelbyte.sdk.cli.Main ugc adminSearchContent \
    --namespace "$AB_NAMESPACE" \
    --creator 'QCzu9R89' \
    --ishidden 'Xj59EMCE' \
    --isofficial 'gioOVEOn' \
    --limit '24' \
    --name 'ru3UCB8p' \
    --offset '39' \
    --orderby 'ZALxaoLl' \
    --sortby 'sltR4KHv' \
    --subtype 'tCiDA7Pl' \
    --tags '82cIkxe1,tS5c1wg2,VGYSnGRb' \
    --type 'u1CkZJs9' \
    --userId 'f9NW77aL' \
    > test.out 2>&1
eval_tap $? 14 'AdminSearchContent' test.out

#- 15 AdminGetContentBulkByShareCodes
./ng net.accelbyte.sdk.cli.Main ugc adminGetContentBulkByShareCodes \
    --namespace "$AB_NAMESPACE" \
    --body '{"shareCodes": ["sYaWfYQ7", "BgswJm5N", "m2AaZxVb"]}' \
    > test.out 2>&1
eval_tap $? 15 'AdminGetContentBulkByShareCodes' test.out

#- 16 AdminGetUserContentByShareCode
./ng net.accelbyte.sdk.cli.Main ugc adminGetUserContentByShareCode \
    --namespace "$AB_NAMESPACE" \
    --shareCode 'JiUosK1G' \
    > test.out 2>&1
eval_tap $? 16 'AdminGetUserContentByShareCode' test.out

#- 17 AdminGetSpecificContent
./ng net.accelbyte.sdk.cli.Main ugc adminGetSpecificContent \
    --contentId 'tDJY0fYc' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 17 'AdminGetSpecificContent' test.out

#- 18 AdminDownloadContentPreview
./ng net.accelbyte.sdk.cli.Main ugc adminDownloadContentPreview \
    --contentId 'xFb1yBRP' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 18 'AdminDownloadContentPreview' test.out

#- 19 RollbackContentVersion
./ng net.accelbyte.sdk.cli.Main ugc rollbackContentVersion \
    --contentId 'AAV0ZhOQ' \
    --namespace "$AB_NAMESPACE" \
    --versionId 'X83JT8Pc' \
    > test.out 2>&1
eval_tap $? 19 'RollbackContentVersion' test.out

#- 20 AdminUpdateScreenshots
./ng net.accelbyte.sdk.cli.Main ugc adminUpdateScreenshots \
    --contentId 'pxSSmhnd' \
    --namespace "$AB_NAMESPACE" \
    --body '{"screenshots": [{"description": "vLWWj6tK", "screenshotId": "aSvn6f40"}, {"description": "Z1lDqhsY", "screenshotId": "aY9Q0qIo"}, {"description": "2et7NdYn", "screenshotId": "QJQfmcze"}]}' \
    > test.out 2>&1
eval_tap $? 20 'AdminUpdateScreenshots' test.out

#- 21 AdminUploadContentScreenshot
./ng net.accelbyte.sdk.cli.Main ugc adminUploadContentScreenshot \
    --contentId 'y2wpiQIV' \
    --namespace "$AB_NAMESPACE" \
    --body '{"screenshots": [{"contentType": "zUlGjgZf", "description": "xWMPgOBG", "fileExtension": "pjp"}, {"contentType": "n6QHsehp", "description": "NrCbiOlU", "fileExtension": "pjp"}, {"contentType": "uZmAvdJk", "description": "UFW1wZii", "fileExtension": "jfif"}]}' \
    > test.out 2>&1
eval_tap $? 21 'AdminUploadContentScreenshot' test.out

#- 22 AdminDeleteContentScreenshot
./ng net.accelbyte.sdk.cli.Main ugc adminDeleteContentScreenshot \
    --contentId 'QFkXcGta' \
    --namespace "$AB_NAMESPACE" \
    --screenshotId 'FcMG0pNm' \
    > test.out 2>&1
eval_tap $? 22 'AdminDeleteContentScreenshot' test.out

#- 23 ListContentVersions
./ng net.accelbyte.sdk.cli.Main ugc listContentVersions \
    --contentId 'zWLTWcPO' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 23 'ListContentVersions' test.out

#- 24 SingleAdminGetAllGroups
./ng net.accelbyte.sdk.cli.Main ugc singleAdminGetAllGroups \
    --namespace "$AB_NAMESPACE" \
    --limit '56' \
    --offset '12' \
    > test.out 2>&1
eval_tap $? 24 'SingleAdminGetAllGroups' test.out

#- 25 AdminCreateGroup
./ng net.accelbyte.sdk.cli.Main ugc adminCreateGroup \
    --namespace "$AB_NAMESPACE" \
    --body '{"contents": ["9QHRJ15x", "HJUK01gR", "cFVGsswV"], "name": "EBiD9qhk"}' \
    > test.out 2>&1
eval_tap $? 25 'AdminCreateGroup' test.out

#- 26 SingleAdminGetGroup
./ng net.accelbyte.sdk.cli.Main ugc singleAdminGetGroup \
    --groupId 'iRP4QXLh' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 26 'SingleAdminGetGroup' test.out

#- 27 SingleAdminUpdateGroup
./ng net.accelbyte.sdk.cli.Main ugc singleAdminUpdateGroup \
    --groupId '74sIeIrT' \
    --namespace "$AB_NAMESPACE" \
    --body '{"contents": ["oX65RX85", "FluQY1RE", "KFG5l44w"], "name": "Piu4nBKs"}' \
    > test.out 2>&1
eval_tap $? 27 'SingleAdminUpdateGroup' test.out

#- 28 SingleAdminDeleteGroup
./ng net.accelbyte.sdk.cli.Main ugc singleAdminDeleteGroup \
    --groupId 'yP9fDA9h' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 28 'SingleAdminDeleteGroup' test.out

#- 29 SingleAdminGetGroupContents
./ng net.accelbyte.sdk.cli.Main ugc singleAdminGetGroupContents \
    --groupId 'ZyQTAYdn' \
    --namespace "$AB_NAMESPACE" \
    --limit '14' \
    --offset '3' \
    > test.out 2>&1
eval_tap $? 29 'SingleAdminGetGroupContents' test.out

#- 30 AdminGetTag
./ng net.accelbyte.sdk.cli.Main ugc adminGetTag \
    --namespace "$AB_NAMESPACE" \
    --limit '39' \
    --offset '23' \
    > test.out 2>&1
eval_tap $? 30 'AdminGetTag' test.out

#- 31 AdminCreateTag
./ng net.accelbyte.sdk.cli.Main ugc adminCreateTag \
    --namespace "$AB_NAMESPACE" \
    --body '{"tag": "VjA8if6U"}' \
    > test.out 2>&1
eval_tap $? 31 'AdminCreateTag' test.out

#- 32 AdminUpdateTag
./ng net.accelbyte.sdk.cli.Main ugc adminUpdateTag \
    --namespace "$AB_NAMESPACE" \
    --tagId 'iustJxcN' \
    --body '{"tag": "0ZCllABa"}' \
    > test.out 2>&1
eval_tap $? 32 'AdminUpdateTag' test.out

#- 33 AdminDeleteTag
./ng net.accelbyte.sdk.cli.Main ugc adminDeleteTag \
    --namespace "$AB_NAMESPACE" \
    --tagId 'bxJQH6BW' \
    > test.out 2>&1
eval_tap $? 33 'AdminDeleteTag' test.out

#- 34 AdminGetType
./ng net.accelbyte.sdk.cli.Main ugc adminGetType \
    --namespace "$AB_NAMESPACE" \
    --limit '96' \
    --offset '39' \
    > test.out 2>&1
eval_tap $? 34 'AdminGetType' test.out

#- 35 AdminCreateType
./ng net.accelbyte.sdk.cli.Main ugc adminCreateType \
    --namespace "$AB_NAMESPACE" \
    --body '{"subtype": ["qYHp0Unp", "FfkH09fk", "kHOPpao1"], "type": "tSJYNyy0"}' \
    > test.out 2>&1
eval_tap $? 35 'AdminCreateType' test.out

#- 36 AdminUpdateType
./ng net.accelbyte.sdk.cli.Main ugc adminUpdateType \
    --namespace "$AB_NAMESPACE" \
    --typeId 'CDX2v5ty' \
    --body '{"subtype": ["Q7fuUvug", "BZ416bqQ", "5hqqLajc"], "type": "jOB2m51d"}' \
    > test.out 2>&1
eval_tap $? 36 'AdminUpdateType' test.out

#- 37 AdminDeleteType
./ng net.accelbyte.sdk.cli.Main ugc adminDeleteType \
    --namespace "$AB_NAMESPACE" \
    --typeId '5k6hbjzR' \
    > test.out 2>&1
eval_tap $? 37 'AdminDeleteType' test.out

#- 38 AdminGetChannel
./ng net.accelbyte.sdk.cli.Main ugc adminGetChannel \
    --namespace "$AB_NAMESPACE" \
    --userId 'y2AgRaPS' \
    --limit '32' \
    --name 'jSiyWz65' \
    --offset '93' \
    > test.out 2>&1
eval_tap $? 38 'AdminGetChannel' test.out

#- 39 AdminDeleteAllUserChannels
./ng net.accelbyte.sdk.cli.Main ugc adminDeleteAllUserChannels \
    --namespace "$AB_NAMESPACE" \
    --userId 'EUCndrLy' \
    > test.out 2>&1
eval_tap $? 39 'AdminDeleteAllUserChannels' test.out

#- 40 AdminUpdateChannel
./ng net.accelbyte.sdk.cli.Main ugc adminUpdateChannel \
    --channelId 'aehRkcVt' \
    --namespace "$AB_NAMESPACE" \
    --userId 'D9SF1MhX' \
    --body '{"name": "nm1u3E7j"}' \
    > test.out 2>&1
eval_tap $? 40 'AdminUpdateChannel' test.out

#- 41 AdminDeleteChannel
./ng net.accelbyte.sdk.cli.Main ugc adminDeleteChannel \
    --channelId 'NsNsbVYm' \
    --namespace "$AB_NAMESPACE" \
    --userId 'QaromywA' \
    > test.out 2>&1
eval_tap $? 41 'AdminDeleteChannel' test.out

#- 42 AdminUpdateContentS3ByShareCode
./ng net.accelbyte.sdk.cli.Main ugc adminUpdateContentS3ByShareCode \
    --channelId 'N4GjP9v3' \
    --namespace "$AB_NAMESPACE" \
    --shareCode 'Y5ELSlnS' \
    --userId '89GOrACW' \
    --body '{"contentType": "JgJtEcPG", "customAttributes": {"4fQ449K6": {}, "oa2G77cG": {}, "qSEQlnVk": {}}, "fileExtension": "2Udv8uan", "name": "UyMkWoUF", "payload": "2d0B3lSy", "preview": "GdZpXlUp", "previewMetadata": {"previewContentType": "7qr84w4Z", "previewFileExtension": "gn2z3jzc"}, "shareCode": "DkdjidjY", "subType": "oBzT5FGL", "tags": ["GhKbw3I2", "jNueUXqE", "zniWJmTY"], "type": "VYhDZNdr", "updateContentFile": false}' \
    > test.out 2>&1
eval_tap $? 42 'AdminUpdateContentS3ByShareCode' test.out

#- 43 AdminUpdateContentS3
./ng net.accelbyte.sdk.cli.Main ugc adminUpdateContentS3 \
    --channelId '6vHl0vl8' \
    --contentId 'icBA1vFS' \
    --namespace "$AB_NAMESPACE" \
    --userId 'nveeFroL' \
    --body '{"contentType": "pEsvbeGe", "customAttributes": {"pGCB2LUy": {}, "qCK5UIpS": {}, "w5ig0ZZy": {}}, "fileExtension": "ktN3DnK4", "name": "uKWldUrS", "payload": "kxik1kqO", "preview": "4Iianisv", "previewMetadata": {"previewContentType": "Uy5Uk3Lp", "previewFileExtension": "xtJNQ1rM"}, "shareCode": "EzKNrCuc", "subType": "vurlrS4D", "tags": ["Auomc64N", "issjMp5K", "YcBJJuLG"], "type": "fW4MCWvO", "updateContentFile": false}' \
    > test.out 2>&1
eval_tap $? 43 'AdminUpdateContentS3' test.out

#- 44 DeleteContentByShareCode
./ng net.accelbyte.sdk.cli.Main ugc deleteContentByShareCode \
    --channelId '5sCkriWE' \
    --namespace "$AB_NAMESPACE" \
    --shareCode 'nkwGw21j' \
    --userId 'VB2RUZDV' \
    > test.out 2>&1
eval_tap $? 44 'DeleteContentByShareCode' test.out

#- 45 AdminUpdateContentDirect
eval_tap 0 45 'AdminUpdateContentDirect # SKIP deprecated' test.out

#- 46 AdminDeleteContent
./ng net.accelbyte.sdk.cli.Main ugc adminDeleteContent \
    --channelId 'n9HTY2kd' \
    --contentId 'Uvuskxhp' \
    --namespace "$AB_NAMESPACE" \
    --userId 'dWrxDg0J' \
    > test.out 2>&1
eval_tap $? 46 'AdminDeleteContent' test.out

#- 47 AdminGetContent
./ng net.accelbyte.sdk.cli.Main ugc adminGetContent \
    --namespace "$AB_NAMESPACE" \
    --userId '3bu37yjI' \
    --limit '91' \
    --offset '85' \
    > test.out 2>&1
eval_tap $? 47 'AdminGetContent' test.out

#- 48 AdminDeleteAllUserContents
./ng net.accelbyte.sdk.cli.Main ugc adminDeleteAllUserContents \
    --namespace "$AB_NAMESPACE" \
    --userId 'a3bdrVmm' \
    > test.out 2>&1
eval_tap $? 48 'AdminDeleteAllUserContents' test.out

#- 49 AdminHideUserContent
./ng net.accelbyte.sdk.cli.Main ugc adminHideUserContent \
    --contentId 'Q4vOEzcs' \
    --namespace "$AB_NAMESPACE" \
    --userId 'UgWTOQ5s' \
    --body '{"isHidden": false}' \
    > test.out 2>&1
eval_tap $? 49 'AdminHideUserContent' test.out

#- 50 AdminGetAllGroups
./ng net.accelbyte.sdk.cli.Main ugc adminGetAllGroups \
    --namespace "$AB_NAMESPACE" \
    --userId 'enhLhu1e' \
    --limit '64' \
    --offset '37' \
    > test.out 2>&1
eval_tap $? 50 'AdminGetAllGroups' test.out

#- 51 AdminDeleteAllUserGroup
./ng net.accelbyte.sdk.cli.Main ugc adminDeleteAllUserGroup \
    --namespace "$AB_NAMESPACE" \
    --userId 'TqsNEkJE' \
    > test.out 2>&1
eval_tap $? 51 'AdminDeleteAllUserGroup' test.out

#- 52 AdminGetGroup
./ng net.accelbyte.sdk.cli.Main ugc adminGetGroup \
    --groupId 'jVTnA1zu' \
    --namespace "$AB_NAMESPACE" \
    --userId '8jDHgVIW' \
    > test.out 2>&1
eval_tap $? 52 'AdminGetGroup' test.out

#- 53 AdminUpdateGroup
./ng net.accelbyte.sdk.cli.Main ugc adminUpdateGroup \
    --groupId 'zqd1WMWu' \
    --namespace "$AB_NAMESPACE" \
    --userId 'ZJUm8YJu' \
    --body '{"contents": ["g4pTERG1", "HMDETMBo", "D8Tch39j"], "name": "9PEAdYlo"}' \
    > test.out 2>&1
eval_tap $? 53 'AdminUpdateGroup' test.out

#- 54 AdminDeleteGroup
./ng net.accelbyte.sdk.cli.Main ugc adminDeleteGroup \
    --groupId 'wCb5vdeV' \
    --namespace "$AB_NAMESPACE" \
    --userId 'P4NX5oeH' \
    > test.out 2>&1
eval_tap $? 54 'AdminDeleteGroup' test.out

#- 55 AdminGetGroupContents
./ng net.accelbyte.sdk.cli.Main ugc adminGetGroupContents \
    --groupId '6ZiHJ0QF' \
    --namespace "$AB_NAMESPACE" \
    --userId 'PcGql7ki' \
    --limit '17' \
    --offset '68' \
    > test.out 2>&1
eval_tap $? 55 'AdminGetGroupContents' test.out

#- 56 AdminDeleteAllUserStates
./ng net.accelbyte.sdk.cli.Main ugc adminDeleteAllUserStates \
    --namespace "$AB_NAMESPACE" \
    --userId 'q9KvYQPv' \
    > test.out 2>&1
eval_tap $? 56 'AdminDeleteAllUserStates' test.out

#- 57 SearchChannelSpecificContent
./ng net.accelbyte.sdk.cli.Main ugc searchChannelSpecificContent \
    --channelId 'bbQ0ptLf' \
    --namespace "$AB_NAMESPACE" \
    --creator 'v2YANj5q' \
    --ishidden 'uUNprBRs' \
    --isofficial 'P3KuXpXe' \
    --limit '74' \
    --name 'qFJjdQec' \
    --offset '58' \
    --orderby 'vIRGWaEQ' \
    --sortby '2vXw7qm8' \
    --subtype 'Vk8cxId5' \
    --tags 'j9Nnuo8F,xBrPl915,vAd45GTz' \
    --type 'CrS7K5ny' \
    --userId 'tzqTLC9j' \
    > test.out 2>&1
eval_tap $? 57 'SearchChannelSpecificContent' test.out

#- 58 PublicSearchContent
./ng net.accelbyte.sdk.cli.Main ugc publicSearchContent \
    --namespace "$AB_NAMESPACE" \
    --creator 'V0eKkUmM' \
    --ishidden 'ZAYTu3su' \
    --isofficial '2XNIL6K4' \
    --limit '32' \
    --name 'Wf3YjhSV' \
    --offset '45' \
    --orderby 'GkkkkKVa' \
    --sortby 'h7Q5mRoE' \
    --subtype '1nz75MlY' \
    --tags '6I7eNwk1,drjdRlsn,8uMZpKCw' \
    --type 'JZrBEyKg' \
    --userId 'iyMRQ2xK' \
    > test.out 2>&1
eval_tap $? 58 'PublicSearchContent' test.out

#- 59 PublicGetContentBulk
./ng net.accelbyte.sdk.cli.Main ugc publicGetContentBulk \
    --namespace "$AB_NAMESPACE" \
    --body '{"contentIds": ["oEF7gCCB", "01a7fE3D", "Qj1TSs75"]}' \
    > test.out 2>&1
eval_tap $? 59 'PublicGetContentBulk' test.out

#- 60 GetFollowedContent
./ng net.accelbyte.sdk.cli.Main ugc getFollowedContent \
    --namespace "$AB_NAMESPACE" \
    --limit '44' \
    --offset '95' \
    > test.out 2>&1
eval_tap $? 60 'GetFollowedContent' test.out

#- 61 GetLikedContent
./ng net.accelbyte.sdk.cli.Main ugc getLikedContent \
    --namespace "$AB_NAMESPACE" \
    --isofficial  \
    --limit '37' \
    --name '8bozYj61' \
    --offset '43' \
    --orderby 'bpAtXSgt' \
    --sortby 'uxkhB42u' \
    --subtype 'iIQdH8w4' \
    --tags '6PfIIOJ6,jjiPv4Gs,J8khmfKD' \
    --type 'j4Ku5sPz' \
    > test.out 2>&1
eval_tap $? 61 'GetLikedContent' test.out

#- 62 PublicDownloadContentByShareCode
./ng net.accelbyte.sdk.cli.Main ugc publicDownloadContentByShareCode \
    --namespace "$AB_NAMESPACE" \
    --shareCode 'HQnvghI2' \
    > test.out 2>&1
eval_tap $? 62 'PublicDownloadContentByShareCode' test.out

#- 63 PublicDownloadContentByContentID
./ng net.accelbyte.sdk.cli.Main ugc publicDownloadContentByContentID \
    --contentId 'm3rnlUvd' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 63 'PublicDownloadContentByContentID' test.out

#- 64 AddDownloadCount
./ng net.accelbyte.sdk.cli.Main ugc addDownloadCount \
    --contentId 'iLgKHWy1' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 64 'AddDownloadCount' test.out

#- 65 UpdateContentLikeStatus
./ng net.accelbyte.sdk.cli.Main ugc updateContentLikeStatus \
    --contentId 'eX0xA1JQ' \
    --namespace "$AB_NAMESPACE" \
    --body '{"likeStatus": true}' \
    > test.out 2>&1
eval_tap $? 65 'UpdateContentLikeStatus' test.out

#- 66 PublicDownloadContentPreview
./ng net.accelbyte.sdk.cli.Main ugc publicDownloadContentPreview \
    --contentId 'Smjuqlrj' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 66 'PublicDownloadContentPreview' test.out

#- 67 GetTag
./ng net.accelbyte.sdk.cli.Main ugc getTag \
    --namespace "$AB_NAMESPACE" \
    --limit '26' \
    --offset '73' \
    > test.out 2>&1
eval_tap $? 67 'GetTag' test.out

#- 68 GetType
./ng net.accelbyte.sdk.cli.Main ugc getType \
    --namespace "$AB_NAMESPACE" \
    --limit '40' \
    --offset '39' \
    > test.out 2>&1
eval_tap $? 68 'GetType' test.out

#- 69 PublicSearchCreator
./ng net.accelbyte.sdk.cli.Main ugc publicSearchCreator \
    --namespace "$AB_NAMESPACE" \
    --limit '90' \
    --offset '94' \
    --orderby 'C0lsZu0z' \
    --sortby 'LE6P2jiH' \
    > test.out 2>&1
eval_tap $? 69 'PublicSearchCreator' test.out

#- 70 GetFollowedUsers
./ng net.accelbyte.sdk.cli.Main ugc getFollowedUsers \
    --namespace "$AB_NAMESPACE" \
    --limit '40' \
    --offset '2' \
    > test.out 2>&1
eval_tap $? 70 'GetFollowedUsers' test.out

#- 71 PublicGetCreator
./ng net.accelbyte.sdk.cli.Main ugc publicGetCreator \
    --namespace "$AB_NAMESPACE" \
    --userId 'qOD9BmwW' \
    > test.out 2>&1
eval_tap $? 71 'PublicGetCreator' test.out

#- 72 GetChannels
./ng net.accelbyte.sdk.cli.Main ugc getChannels \
    --namespace "$AB_NAMESPACE" \
    --userId 'w4qgjQxg' \
    --limit '35' \
    --name 'zHJw3Hpj' \
    --offset '77' \
    > test.out 2>&1
eval_tap $? 72 'GetChannels' test.out

#- 73 PublicCreateChannel
./ng net.accelbyte.sdk.cli.Main ugc publicCreateChannel \
    --namespace "$AB_NAMESPACE" \
    --userId 'Naj7GM9w' \
    --body '{"name": "vpvkErP1"}' \
    > test.out 2>&1
eval_tap $? 73 'PublicCreateChannel' test.out

#- 74 DeleteAllUserChannel
./ng net.accelbyte.sdk.cli.Main ugc deleteAllUserChannel \
    --namespace "$AB_NAMESPACE" \
    --userId 'tqn6ytAc' \
    > test.out 2>&1
eval_tap $? 74 'DeleteAllUserChannel' test.out

#- 75 UpdateChannel
./ng net.accelbyte.sdk.cli.Main ugc updateChannel \
    --channelId 'pfReqN3P' \
    --namespace "$AB_NAMESPACE" \
    --userId 'nkUME8kU' \
    --body '{"name": "lSnCHwQv"}' \
    > test.out 2>&1
eval_tap $? 75 'UpdateChannel' test.out

#- 76 DeleteChannel
./ng net.accelbyte.sdk.cli.Main ugc deleteChannel \
    --channelId 'sct4LEKU' \
    --namespace "$AB_NAMESPACE" \
    --userId 'M9RYPQas' \
    > test.out 2>&1
eval_tap $? 76 'DeleteChannel' test.out

#- 77 CreateContentDirect
eval_tap 0 77 'CreateContentDirect # SKIP deprecated' test.out

#- 78 CreateContentS3
./ng net.accelbyte.sdk.cli.Main ugc createContentS3 \
    --channelId 'h86iIZh5' \
    --namespace "$AB_NAMESPACE" \
    --userId 'OtNuqukU' \
    --body '{"contentType": "7Md5UAjx", "customAttributes": {"UTPY3KcX": {}, "txR0RzhY": {}, "3wpWag9F": {}}, "fileExtension": "fr8Sc6kA", "name": "9gET5tVL", "preview": "Rv48hVFO", "previewMetadata": {"previewContentType": "hSa8LLOd", "previewFileExtension": "UCBd0hRD"}, "subType": "cy7euv80", "tags": ["baei9uWT", "au3iQbIO", "18Vt2nsP"], "type": "I7APi3sE"}' \
    > test.out 2>&1
eval_tap $? 78 'CreateContentS3' test.out

#- 79 UpdateContentS3
./ng net.accelbyte.sdk.cli.Main ugc updateContentS3 \
    --channelId '2CeYvyQc' \
    --contentId 'UmuAtWvd' \
    --namespace "$AB_NAMESPACE" \
    --userId 'DxugcCUi' \
    --body '{"contentType": "doYgtj38", "customAttributes": {"W7FPZISf": {}, "mAOMrcvX": {}, "Vz2pEErr": {}}, "fileExtension": "AlXiuoHq", "name": "OONcKLTC", "payload": "HZ4kL60Z", "preview": "rVJ1uuxk", "previewMetadata": {"previewContentType": "TEd52ICi", "previewFileExtension": "ssvDFqzN"}, "subType": "7raauvyK", "tags": ["edZBJ4Il", "cwUSCDMW", "RmKQzxzb"], "type": "7AGNUwQJ", "updateContentFile": true}' \
    > test.out 2>&1
eval_tap $? 79 'UpdateContentS3' test.out

#- 80 UpdateContentDirect
eval_tap 0 80 'UpdateContentDirect # SKIP deprecated' test.out

#- 81 DeleteContent
./ng net.accelbyte.sdk.cli.Main ugc deleteContent \
    --channelId 'wXrWeNFH' \
    --contentId 'tQA8w9M7' \
    --namespace "$AB_NAMESPACE" \
    --userId 'A8v9bzpR' \
    > test.out 2>&1
eval_tap $? 81 'DeleteContent' test.out

#- 82 PublicGetUserContent
./ng net.accelbyte.sdk.cli.Main ugc publicGetUserContent \
    --namespace "$AB_NAMESPACE" \
    --userId 'p70SWbHY' \
    --limit '59' \
    --offset '46' \
    > test.out 2>&1
eval_tap $? 82 'PublicGetUserContent' test.out

#- 83 DeleteAllUserContents
./ng net.accelbyte.sdk.cli.Main ugc deleteAllUserContents \
    --namespace "$AB_NAMESPACE" \
    --userId 'QuoLAzah' \
    > test.out 2>&1
eval_tap $? 83 'DeleteAllUserContents' test.out

#- 84 UpdateScreenshots
./ng net.accelbyte.sdk.cli.Main ugc updateScreenshots \
    --contentId 'TTUiMv7g' \
    --namespace "$AB_NAMESPACE" \
    --userId 'HT7KXBZn' \
    --body '{"screenshots": [{"description": "GQoZmgW3", "screenshotId": "8geAZRrM"}, {"description": "RoqZxR8V", "screenshotId": "T0tmeuW6"}, {"description": "UJmEc7F3", "screenshotId": "BEQ13Wed"}]}' \
    > test.out 2>&1
eval_tap $? 84 'UpdateScreenshots' test.out

#- 85 UploadContentScreenshot
./ng net.accelbyte.sdk.cli.Main ugc uploadContentScreenshot \
    --contentId 'VFLSWIdi' \
    --namespace "$AB_NAMESPACE" \
    --userId 'sfoamZYg' \
    --body '{"screenshots": [{"contentType": "spo8OMUX", "description": "xeXIiSRT", "fileExtension": "bmp"}, {"contentType": "A4MuMi6X", "description": "BFOHvOjX", "fileExtension": "jfif"}, {"contentType": "JFpSV6cM", "description": "Yg4wAzas", "fileExtension": "jpg"}]}' \
    > test.out 2>&1
eval_tap $? 85 'UploadContentScreenshot' test.out

#- 86 DeleteContentScreenshot
./ng net.accelbyte.sdk.cli.Main ugc deleteContentScreenshot \
    --contentId 'QW5MUS52' \
    --namespace "$AB_NAMESPACE" \
    --screenshotId 'fIT7iRox' \
    --userId '2RuXvdjd' \
    > test.out 2>&1
eval_tap $? 86 'DeleteContentScreenshot' test.out

#- 87 UpdateUserFollowStatus
./ng net.accelbyte.sdk.cli.Main ugc updateUserFollowStatus \
    --namespace "$AB_NAMESPACE" \
    --userId '94caaF8z' \
    --body '{"followStatus": false}' \
    > test.out 2>&1
eval_tap $? 87 'UpdateUserFollowStatus' test.out

#- 88 GetPublicFollowers
./ng net.accelbyte.sdk.cli.Main ugc getPublicFollowers \
    --namespace "$AB_NAMESPACE" \
    --userId 'c8tZLZG8' \
    --limit '37' \
    --offset '13' \
    > test.out 2>&1
eval_tap $? 88 'GetPublicFollowers' test.out

#- 89 GetPublicFollowing
./ng net.accelbyte.sdk.cli.Main ugc getPublicFollowing \
    --namespace "$AB_NAMESPACE" \
    --userId 'YiwmjFfp' \
    --limit '10' \
    --offset '62' \
    > test.out 2>&1
eval_tap $? 89 'GetPublicFollowing' test.out

#- 90 GetGroups
./ng net.accelbyte.sdk.cli.Main ugc getGroups \
    --namespace "$AB_NAMESPACE" \
    --userId 'tjOR2IsD' \
    --limit '41' \
    --offset '45' \
    > test.out 2>&1
eval_tap $? 90 'GetGroups' test.out

#- 91 CreateGroup
./ng net.accelbyte.sdk.cli.Main ugc createGroup \
    --namespace "$AB_NAMESPACE" \
    --userId 'tIjZ1j3f' \
    --body '{"contents": ["33A1K86t", "aAi1CRQ2", "cSBmdA9K"], "name": "CmIYIbZV"}' \
    > test.out 2>&1
eval_tap $? 91 'CreateGroup' test.out

#- 92 DeleteAllUserGroup
./ng net.accelbyte.sdk.cli.Main ugc deleteAllUserGroup \
    --namespace "$AB_NAMESPACE" \
    --userId 'i8MPliqr' \
    > test.out 2>&1
eval_tap $? 92 'DeleteAllUserGroup' test.out

#- 93 GetGroup
./ng net.accelbyte.sdk.cli.Main ugc getGroup \
    --groupId '0zrGEnXH' \
    --namespace "$AB_NAMESPACE" \
    --userId 'N7rOgFob' \
    > test.out 2>&1
eval_tap $? 93 'GetGroup' test.out

#- 94 UpdateGroup
./ng net.accelbyte.sdk.cli.Main ugc updateGroup \
    --groupId 'MIveKTIO' \
    --namespace "$AB_NAMESPACE" \
    --userId '4ZeQlU7i' \
    --body '{"contents": ["SDKpF7jA", "mWrtOu6Q", "UJAXIBUv"], "name": "POlkzM8h"}' \
    > test.out 2>&1
eval_tap $? 94 'UpdateGroup' test.out

#- 95 DeleteGroup
./ng net.accelbyte.sdk.cli.Main ugc deleteGroup \
    --groupId 'EfqPJN03' \
    --namespace "$AB_NAMESPACE" \
    --userId 'RZ3xZnez' \
    > test.out 2>&1
eval_tap $? 95 'DeleteGroup' test.out

#- 96 GetGroupContent
./ng net.accelbyte.sdk.cli.Main ugc getGroupContent \
    --groupId 'WHTVVWiJ' \
    --namespace "$AB_NAMESPACE" \
    --userId 'dZTybDgF' \
    --limit '74' \
    --offset '80' \
    > test.out 2>&1
eval_tap $? 96 'GetGroupContent' test.out

#- 97 DeleteAllUserStates
./ng net.accelbyte.sdk.cli.Main ugc deleteAllUserStates \
    --namespace "$AB_NAMESPACE" \
    --userId 'CscaRhEW' \
    > test.out 2>&1
eval_tap $? 97 'DeleteAllUserStates' test.out


rm -f "tmp.dat"

exit $EXIT_CODE