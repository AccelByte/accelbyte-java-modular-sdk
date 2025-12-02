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
    --limit '90' \
    --offset '24' \
    > test.out 2>&1
eval_tap $? 2 'SingleAdminGetChannel' test.out

#- 3 AdminCreateChannel
./ng net.accelbyte.sdk.cli.Main ugc adminCreateChannel \
    --namespace "$AB_NAMESPACE" \
    --body '{"id": "ahvXVHHb", "name": "Anc8MeMb"}' \
    > test.out 2>&1
eval_tap $? 3 'AdminCreateChannel' test.out

#- 4 SingleAdminUpdateChannel
./ng net.accelbyte.sdk.cli.Main ugc singleAdminUpdateChannel \
    --channelId 'hpqgjJMj' \
    --namespace "$AB_NAMESPACE" \
    --body '{"name": "41IU8Xds"}' \
    > test.out 2>&1
eval_tap $? 4 'SingleAdminUpdateChannel' test.out

#- 5 SingleAdminDeleteChannel
./ng net.accelbyte.sdk.cli.Main ugc singleAdminDeleteChannel \
    --channelId '1s1yRzoo' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 5 'SingleAdminDeleteChannel' test.out

#- 6 AdminUploadContentDirect
eval_tap 0 6 'AdminUploadContentDirect # SKIP deprecated' test.out

#- 7 AdminUploadContentS3
./ng net.accelbyte.sdk.cli.Main ugc adminUploadContentS3 \
    --channelId 'i5Ya40Qd' \
    --namespace "$AB_NAMESPACE" \
    --body '{"contentType": "Dk0curQT", "customAttributes": {"IVQgNQvV": {}, "AXNaIVNK": {}, "E1klo2Wn": {}}, "fileExtension": "gIg8N467", "name": "RX2PQr96", "preview": "tbJlx0fW", "previewMetadata": {"previewContentType": "kppseIUg", "previewFileExtension": "OHsqgM9X"}, "shareCode": "rQN7imE3", "subType": "vyBIVv5W", "tags": ["MmoFyMyl", "Ie8qUJQS", "ukh8uThZ"], "type": "nfC32ZoZ"}' \
    > test.out 2>&1
eval_tap $? 7 'AdminUploadContentS3' test.out

#- 8 SingleAdminUpdateContentS3
./ng net.accelbyte.sdk.cli.Main ugc singleAdminUpdateContentS3 \
    --channelId 'QYxnDwLg' \
    --contentId 'SirsF3XS' \
    --namespace "$AB_NAMESPACE" \
    --body '{"contentType": "hAKXiUU7", "customAttributes": {"f1ByskxK": {}, "DkRNTVKx": {}, "GYbk5pX6": {}}, "fileExtension": "JaCQQ56z", "name": "PwLn3vE4", "payload": "BZmBvecm", "preview": "YpnNbdhH", "previewMetadata": {"previewContentType": "teuovHuQ", "previewFileExtension": "cQybTxb0"}, "shareCode": "kWCTcLQJ", "subType": "ZQtl5Wjo", "tags": ["ppuOWHgT", "Ty7OTKYI", "WzY0f5M8"], "type": "bg3r5BPB", "updateContentFile": true}' \
    > test.out 2>&1
eval_tap $? 8 'SingleAdminUpdateContentS3' test.out

#- 9 AdminSearchChannelSpecificContent
./ng net.accelbyte.sdk.cli.Main ugc adminSearchChannelSpecificContent \
    --channelId 'tDwErJ0J' \
    --namespace "$AB_NAMESPACE" \
    --creator '3mCAxyGa' \
    --ishidden 'Ha0n0dl6' \
    --isofficial 'NGIT7ktm' \
    --limit '42' \
    --name 'oklcaHdJ' \
    --offset '99' \
    --orderby '0m3Tlv1C' \
    --sortby 'wjLPFzUf' \
    --subtype '0bKnUN99' \
    --tags 'rIjgFtVB,OeVQdVJZ,LdSRItdh' \
    --type 'zsa968eE' \
    --userId '4wi9hv8i' \
    > test.out 2>&1
eval_tap $? 9 'AdminSearchChannelSpecificContent' test.out

#- 10 SingleAdminUpdateContentDirect
eval_tap 0 10 'SingleAdminUpdateContentDirect # SKIP deprecated' test.out

#- 11 SingleAdminDeleteContent
./ng net.accelbyte.sdk.cli.Main ugc singleAdminDeleteContent \
    --channelId 'AvSUOrJ6' \
    --contentId 'gQspMG81' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 11 'SingleAdminDeleteContent' test.out

#- 12 SingleAdminGetContent
./ng net.accelbyte.sdk.cli.Main ugc singleAdminGetContent \
    --namespace "$AB_NAMESPACE" \
    --limit '38' \
    --offset '57' \
    > test.out 2>&1
eval_tap $? 12 'SingleAdminGetContent' test.out

#- 13 AdminGetContentBulk
./ng net.accelbyte.sdk.cli.Main ugc adminGetContentBulk \
    --namespace "$AB_NAMESPACE" \
    --body '{"contentIds": ["LBwWad8L", "u7Hs48pK", "fa4vb3Hl"]}' \
    > test.out 2>&1
eval_tap $? 13 'AdminGetContentBulk' test.out

#- 14 AdminSearchContent
./ng net.accelbyte.sdk.cli.Main ugc adminSearchContent \
    --namespace "$AB_NAMESPACE" \
    --creator 'PU5YFFyE' \
    --ishidden '1HD47Lpn' \
    --isofficial 'tnotBjlW' \
    --limit '51' \
    --name 'KyPL3B8b' \
    --offset '19' \
    --orderby 'oKfEZ5yS' \
    --sortby 'TXHCvBmQ' \
    --subtype 'FkB04aOD' \
    --tags 'w3hWm3Is,NSOqJloU,OkRY9ZnG' \
    --type '9GFP2BYH' \
    --userId 'rlU8DK43' \
    > test.out 2>&1
eval_tap $? 14 'AdminSearchContent' test.out

#- 15 AdminGetContentBulkByShareCodes
./ng net.accelbyte.sdk.cli.Main ugc adminGetContentBulkByShareCodes \
    --namespace "$AB_NAMESPACE" \
    --body '{"shareCodes": ["9pa6nqN2", "rO7Stbah", "XNwdO2UL"]}' \
    > test.out 2>&1
eval_tap $? 15 'AdminGetContentBulkByShareCodes' test.out

#- 16 AdminGetUserContentByShareCode
./ng net.accelbyte.sdk.cli.Main ugc adminGetUserContentByShareCode \
    --namespace "$AB_NAMESPACE" \
    --shareCode 'eaQun3UJ' \
    > test.out 2>&1
eval_tap $? 16 'AdminGetUserContentByShareCode' test.out

#- 17 AdminGetSpecificContent
./ng net.accelbyte.sdk.cli.Main ugc adminGetSpecificContent \
    --contentId 'G4flfUQQ' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 17 'AdminGetSpecificContent' test.out

#- 18 AdminDownloadContentPreview
./ng net.accelbyte.sdk.cli.Main ugc adminDownloadContentPreview \
    --contentId '7g8ZKtzl' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 18 'AdminDownloadContentPreview' test.out

#- 19 RollbackContentVersion
./ng net.accelbyte.sdk.cli.Main ugc rollbackContentVersion \
    --contentId 'gJLLvlSY' \
    --namespace "$AB_NAMESPACE" \
    --versionId 'BiOYARrT' \
    > test.out 2>&1
eval_tap $? 19 'RollbackContentVersion' test.out

#- 20 AdminUpdateScreenshots
./ng net.accelbyte.sdk.cli.Main ugc adminUpdateScreenshots \
    --contentId 'Tqa8V8oq' \
    --namespace "$AB_NAMESPACE" \
    --body '{"screenshots": [{"description": "4YLjXB85", "screenshotId": "XU0NBZx7"}, {"description": "z6SvRbP4", "screenshotId": "kyx5sZHJ"}, {"description": "4Mthw1Il", "screenshotId": "vMmqYntb"}]}' \
    > test.out 2>&1
eval_tap $? 20 'AdminUpdateScreenshots' test.out

#- 21 AdminUploadContentScreenshot
./ng net.accelbyte.sdk.cli.Main ugc adminUploadContentScreenshot \
    --contentId 'BgrLoOde' \
    --namespace "$AB_NAMESPACE" \
    --body '{"screenshots": [{"contentType": "CWXwyCpa", "description": "S1iidTUS", "fileExtension": "pjp"}, {"contentType": "Lk6oMxT6", "description": "Ip5k7dJW", "fileExtension": "jfif"}, {"contentType": "3sc5RCbP", "description": "Kuc1SzY6", "fileExtension": "jpeg"}]}' \
    > test.out 2>&1
eval_tap $? 21 'AdminUploadContentScreenshot' test.out

#- 22 AdminDeleteContentScreenshot
./ng net.accelbyte.sdk.cli.Main ugc adminDeleteContentScreenshot \
    --contentId 'X3Q18XRE' \
    --namespace "$AB_NAMESPACE" \
    --screenshotId 'qNCyWtHp' \
    > test.out 2>&1
eval_tap $? 22 'AdminDeleteContentScreenshot' test.out

#- 23 ListContentVersions
./ng net.accelbyte.sdk.cli.Main ugc listContentVersions \
    --contentId 'yJxk5Ujx' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 23 'ListContentVersions' test.out

#- 24 SingleAdminGetAllGroups
./ng net.accelbyte.sdk.cli.Main ugc singleAdminGetAllGroups \
    --namespace "$AB_NAMESPACE" \
    --limit '64' \
    --offset '45' \
    > test.out 2>&1
eval_tap $? 24 'SingleAdminGetAllGroups' test.out

#- 25 AdminCreateGroup
./ng net.accelbyte.sdk.cli.Main ugc adminCreateGroup \
    --namespace "$AB_NAMESPACE" \
    --body '{"contents": ["A6YBV6ns", "jaVm01ti", "FwX8jLre"], "name": "0QaU8rt3"}' \
    > test.out 2>&1
eval_tap $? 25 'AdminCreateGroup' test.out

#- 26 SingleAdminGetGroup
./ng net.accelbyte.sdk.cli.Main ugc singleAdminGetGroup \
    --groupId 'aiCepiyl' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 26 'SingleAdminGetGroup' test.out

#- 27 SingleAdminUpdateGroup
./ng net.accelbyte.sdk.cli.Main ugc singleAdminUpdateGroup \
    --groupId 'QReqrs0f' \
    --namespace "$AB_NAMESPACE" \
    --body '{"contents": ["9OuOJLZt", "0MaEaoJj", "D1xce9JZ"], "name": "XLmXcjav"}' \
    > test.out 2>&1
eval_tap $? 27 'SingleAdminUpdateGroup' test.out

#- 28 SingleAdminDeleteGroup
./ng net.accelbyte.sdk.cli.Main ugc singleAdminDeleteGroup \
    --groupId 'CA2lCG8t' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 28 'SingleAdminDeleteGroup' test.out

#- 29 SingleAdminGetGroupContents
./ng net.accelbyte.sdk.cli.Main ugc singleAdminGetGroupContents \
    --groupId 'tyfe2Gxi' \
    --namespace "$AB_NAMESPACE" \
    --limit '13' \
    --offset '23' \
    > test.out 2>&1
eval_tap $? 29 'SingleAdminGetGroupContents' test.out

#- 30 AdminGetTag
./ng net.accelbyte.sdk.cli.Main ugc adminGetTag \
    --namespace "$AB_NAMESPACE" \
    --limit '92' \
    --offset '38' \
    > test.out 2>&1
eval_tap $? 30 'AdminGetTag' test.out

#- 31 AdminCreateTag
./ng net.accelbyte.sdk.cli.Main ugc adminCreateTag \
    --namespace "$AB_NAMESPACE" \
    --body '{"tag": "5dJDOUEi"}' \
    > test.out 2>&1
eval_tap $? 31 'AdminCreateTag' test.out

#- 32 AdminUpdateTag
./ng net.accelbyte.sdk.cli.Main ugc adminUpdateTag \
    --namespace "$AB_NAMESPACE" \
    --tagId 'x1bGiaWC' \
    --body '{"tag": "P1zUnMu4"}' \
    > test.out 2>&1
eval_tap $? 32 'AdminUpdateTag' test.out

#- 33 AdminDeleteTag
./ng net.accelbyte.sdk.cli.Main ugc adminDeleteTag \
    --namespace "$AB_NAMESPACE" \
    --tagId '9ckk6Ulw' \
    > test.out 2>&1
eval_tap $? 33 'AdminDeleteTag' test.out

#- 34 AdminGetType
./ng net.accelbyte.sdk.cli.Main ugc adminGetType \
    --namespace "$AB_NAMESPACE" \
    --limit '72' \
    --offset '70' \
    > test.out 2>&1
eval_tap $? 34 'AdminGetType' test.out

#- 35 AdminCreateType
./ng net.accelbyte.sdk.cli.Main ugc adminCreateType \
    --namespace "$AB_NAMESPACE" \
    --body '{"subtype": ["q33lfGeY", "UwDISBrq", "fenaNmLv"], "type": "xWWxwLeG"}' \
    > test.out 2>&1
eval_tap $? 35 'AdminCreateType' test.out

#- 36 AdminUpdateType
./ng net.accelbyte.sdk.cli.Main ugc adminUpdateType \
    --namespace "$AB_NAMESPACE" \
    --typeId 'rqIzV9f6' \
    --body '{"subtype": ["KGxGixc8", "QbGfduQe", "djFCQbDT"], "type": "NiSDrkq7"}' \
    > test.out 2>&1
eval_tap $? 36 'AdminUpdateType' test.out

#- 37 AdminDeleteType
./ng net.accelbyte.sdk.cli.Main ugc adminDeleteType \
    --namespace "$AB_NAMESPACE" \
    --typeId '9fsIWeNv' \
    > test.out 2>&1
eval_tap $? 37 'AdminDeleteType' test.out

#- 38 AdminGetChannel
./ng net.accelbyte.sdk.cli.Main ugc adminGetChannel \
    --namespace "$AB_NAMESPACE" \
    --userId '1pVCTAaG' \
    --limit '94' \
    --name 'hrmhcy5b' \
    --offset '32' \
    > test.out 2>&1
eval_tap $? 38 'AdminGetChannel' test.out

#- 39 AdminDeleteAllUserChannels
./ng net.accelbyte.sdk.cli.Main ugc adminDeleteAllUserChannels \
    --namespace "$AB_NAMESPACE" \
    --userId 'OKwiQQyI' \
    > test.out 2>&1
eval_tap $? 39 'AdminDeleteAllUserChannels' test.out

#- 40 AdminUpdateChannel
./ng net.accelbyte.sdk.cli.Main ugc adminUpdateChannel \
    --channelId 'Ndwx14RH' \
    --namespace "$AB_NAMESPACE" \
    --userId 'tCHcxiTL' \
    --body '{"name": "ABrFRfR2"}' \
    > test.out 2>&1
eval_tap $? 40 'AdminUpdateChannel' test.out

#- 41 AdminDeleteChannel
./ng net.accelbyte.sdk.cli.Main ugc adminDeleteChannel \
    --channelId 'ZKP9emBs' \
    --namespace "$AB_NAMESPACE" \
    --userId 'EgFLOHfd' \
    > test.out 2>&1
eval_tap $? 41 'AdminDeleteChannel' test.out

#- 42 AdminUpdateContentS3ByShareCode
./ng net.accelbyte.sdk.cli.Main ugc adminUpdateContentS3ByShareCode \
    --channelId 'Pf0Fa8Y2' \
    --namespace "$AB_NAMESPACE" \
    --shareCode 'sTlD1ERO' \
    --userId 'amZXTuho' \
    --body '{"contentType": "1JUepSGR", "customAttributes": {"7l1qmMUf": {}, "YuC4qkwo": {}, "RDahoXjI": {}}, "fileExtension": "TMXCEx4x", "name": "Hu6wHOdb", "payload": "G611t9hb", "preview": "ii0cqLSS", "previewMetadata": {"previewContentType": "ezdJrNQh", "previewFileExtension": "bks8tjxY"}, "shareCode": "ZGYtB4Pc", "subType": "qAg6IuEj", "tags": ["5BoaNZXk", "m2oIoRMh", "abHcLEjF"], "type": "Wm2NtWmo", "updateContentFile": false}' \
    > test.out 2>&1
eval_tap $? 42 'AdminUpdateContentS3ByShareCode' test.out

#- 43 AdminUpdateContentS3
./ng net.accelbyte.sdk.cli.Main ugc adminUpdateContentS3 \
    --channelId '5J1tdpxg' \
    --contentId 'rZMmzcJy' \
    --namespace "$AB_NAMESPACE" \
    --userId 'DrVsOnbY' \
    --body '{"contentType": "5PmCvDWg", "customAttributes": {"M6EWWuOh": {}, "fyZJ3C5e": {}, "8mMjxwAy": {}}, "fileExtension": "FdjslzRa", "name": "O8orXl86", "payload": "HYK2kykl", "preview": "q3FcskSw", "previewMetadata": {"previewContentType": "cS88EDgw", "previewFileExtension": "qGgG7Ic1"}, "shareCode": "VILZpJfD", "subType": "mFknmRuj", "tags": ["QuYeWdnu", "9IsFsJ8O", "hW6JsLrv"], "type": "gJGFYQ8e", "updateContentFile": false}' \
    > test.out 2>&1
eval_tap $? 43 'AdminUpdateContentS3' test.out

#- 44 DeleteContentByShareCode
./ng net.accelbyte.sdk.cli.Main ugc deleteContentByShareCode \
    --channelId 'RbbwrgsP' \
    --namespace "$AB_NAMESPACE" \
    --shareCode 'VSR1QIu9' \
    --userId '9G5AV4wH' \
    > test.out 2>&1
eval_tap $? 44 'DeleteContentByShareCode' test.out

#- 45 AdminUpdateContentDirect
eval_tap 0 45 'AdminUpdateContentDirect # SKIP deprecated' test.out

#- 46 AdminDeleteContent
./ng net.accelbyte.sdk.cli.Main ugc adminDeleteContent \
    --channelId '74yyJuGF' \
    --contentId 'Svd0aNt3' \
    --namespace "$AB_NAMESPACE" \
    --userId 'j4WqIZdg' \
    > test.out 2>&1
eval_tap $? 46 'AdminDeleteContent' test.out

#- 47 AdminGetContent
./ng net.accelbyte.sdk.cli.Main ugc adminGetContent \
    --namespace "$AB_NAMESPACE" \
    --userId 'oGm5nmk2' \
    --limit '99' \
    --offset '72' \
    > test.out 2>&1
eval_tap $? 47 'AdminGetContent' test.out

#- 48 AdminDeleteAllUserContents
./ng net.accelbyte.sdk.cli.Main ugc adminDeleteAllUserContents \
    --namespace "$AB_NAMESPACE" \
    --userId 'TswiPmhi' \
    > test.out 2>&1
eval_tap $? 48 'AdminDeleteAllUserContents' test.out

#- 49 AdminHideUserContent
./ng net.accelbyte.sdk.cli.Main ugc adminHideUserContent \
    --contentId 'ABTH6LoQ' \
    --namespace "$AB_NAMESPACE" \
    --userId 'DJId1Fz0' \
    --body '{"isHidden": false}' \
    > test.out 2>&1
eval_tap $? 49 'AdminHideUserContent' test.out

#- 50 AdminGetAllGroups
./ng net.accelbyte.sdk.cli.Main ugc adminGetAllGroups \
    --namespace "$AB_NAMESPACE" \
    --userId 'suStvt8i' \
    --limit '10' \
    --offset '29' \
    > test.out 2>&1
eval_tap $? 50 'AdminGetAllGroups' test.out

#- 51 AdminDeleteAllUserGroup
./ng net.accelbyte.sdk.cli.Main ugc adminDeleteAllUserGroup \
    --namespace "$AB_NAMESPACE" \
    --userId '44M56uLU' \
    > test.out 2>&1
eval_tap $? 51 'AdminDeleteAllUserGroup' test.out

#- 52 AdminGetGroup
./ng net.accelbyte.sdk.cli.Main ugc adminGetGroup \
    --groupId 'bnuEOKbM' \
    --namespace "$AB_NAMESPACE" \
    --userId 'IhDMPXV0' \
    > test.out 2>&1
eval_tap $? 52 'AdminGetGroup' test.out

#- 53 AdminUpdateGroup
./ng net.accelbyte.sdk.cli.Main ugc adminUpdateGroup \
    --groupId 'CYx4eAqw' \
    --namespace "$AB_NAMESPACE" \
    --userId 'cm3DzeMU' \
    --body '{"contents": ["I3xMRk0l", "L29G0G8D", "WkYbhv9A"], "name": "WJ5I1XgL"}' \
    > test.out 2>&1
eval_tap $? 53 'AdminUpdateGroup' test.out

#- 54 AdminDeleteGroup
./ng net.accelbyte.sdk.cli.Main ugc adminDeleteGroup \
    --groupId '2icRrTfx' \
    --namespace "$AB_NAMESPACE" \
    --userId '7zEVC4Pz' \
    > test.out 2>&1
eval_tap $? 54 'AdminDeleteGroup' test.out

#- 55 AdminGetGroupContents
./ng net.accelbyte.sdk.cli.Main ugc adminGetGroupContents \
    --groupId 'FAVGgSWq' \
    --namespace "$AB_NAMESPACE" \
    --userId 'bxYSTOt7' \
    --limit '35' \
    --offset '24' \
    > test.out 2>&1
eval_tap $? 55 'AdminGetGroupContents' test.out

#- 56 AdminDeleteAllUserStates
./ng net.accelbyte.sdk.cli.Main ugc adminDeleteAllUserStates \
    --namespace "$AB_NAMESPACE" \
    --userId '0e3cc67u' \
    > test.out 2>&1
eval_tap $? 56 'AdminDeleteAllUserStates' test.out

#- 57 SearchChannelSpecificContent
./ng net.accelbyte.sdk.cli.Main ugc searchChannelSpecificContent \
    --channelId 'X3RLLUD8' \
    --namespace "$AB_NAMESPACE" \
    --creator 'VrLs6ATK' \
    --ishidden 'SVhmjtaD' \
    --isofficial 'XBI4BdBW' \
    --limit '33' \
    --name '8TAAVxQ2' \
    --offset '24' \
    --orderby 'hE6kgLiq' \
    --sortby 'Z1ACsMee' \
    --subtype 'eVdasJCj' \
    --tags 'dVReIzFG,ZaZsHozp,l6gPkrVx' \
    --type 'dh2F5Rp1' \
    --userId 'gKm6rJuC' \
    > test.out 2>&1
eval_tap $? 57 'SearchChannelSpecificContent' test.out

#- 58 PublicSearchContent
./ng net.accelbyte.sdk.cli.Main ugc publicSearchContent \
    --namespace "$AB_NAMESPACE" \
    --creator 'X877tKwr' \
    --ishidden '8KpjmqmO' \
    --isofficial 'xYDlEmvw' \
    --limit '84' \
    --name 'MNzMCSbU' \
    --offset '92' \
    --orderby 'T8gZPSbw' \
    --sortby 'D6uLF9kc' \
    --subtype '92fYq6oW' \
    --tags 'eWDcDSWL,D2IX9ffI,rjthZHbQ' \
    --type 'fWSUyvsZ' \
    --userId 'HeWuHWLq' \
    > test.out 2>&1
eval_tap $? 58 'PublicSearchContent' test.out

#- 59 PublicGetContentBulk
./ng net.accelbyte.sdk.cli.Main ugc publicGetContentBulk \
    --namespace "$AB_NAMESPACE" \
    --body '{"contentIds": ["KGTvbPa8", "kqt8TuWa", "RFT87dRS"]}' \
    > test.out 2>&1
eval_tap $? 59 'PublicGetContentBulk' test.out

#- 60 GetFollowedContent
./ng net.accelbyte.sdk.cli.Main ugc getFollowedContent \
    --namespace "$AB_NAMESPACE" \
    --limit '0' \
    --offset '66' \
    > test.out 2>&1
eval_tap $? 60 'GetFollowedContent' test.out

#- 61 GetLikedContent
./ng net.accelbyte.sdk.cli.Main ugc getLikedContent \
    --namespace "$AB_NAMESPACE" \
    --isofficial  \
    --limit '32' \
    --name 'KlUk8Myf' \
    --offset '99' \
    --orderby 'zO4sEIdg' \
    --sortby 'KvhRBitD' \
    --subtype 'VLEu2jEC' \
    --tags 'P4grWWYt,xW0hHO2e,gRejSZJH' \
    --type '4FFgsWeX' \
    > test.out 2>&1
eval_tap $? 61 'GetLikedContent' test.out

#- 62 PublicGetContentBulkByShareCodes
./ng net.accelbyte.sdk.cli.Main ugc publicGetContentBulkByShareCodes \
    --namespace "$AB_NAMESPACE" \
    --body '{"shareCodes": ["zLCTsOdj", "slciv4zd", "fxrlxOw4"]}' \
    > test.out 2>&1
eval_tap $? 62 'PublicGetContentBulkByShareCodes' test.out

#- 63 PublicDownloadContentByShareCode
./ng net.accelbyte.sdk.cli.Main ugc publicDownloadContentByShareCode \
    --namespace "$AB_NAMESPACE" \
    --shareCode 'n32yZ1k1' \
    > test.out 2>&1
eval_tap $? 63 'PublicDownloadContentByShareCode' test.out

#- 64 PublicDownloadContentByContentID
./ng net.accelbyte.sdk.cli.Main ugc publicDownloadContentByContentID \
    --contentId 'SydyuQ89' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 64 'PublicDownloadContentByContentID' test.out

#- 65 AddDownloadCount
./ng net.accelbyte.sdk.cli.Main ugc addDownloadCount \
    --contentId 'NQOkxGZY' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 65 'AddDownloadCount' test.out

#- 66 UpdateContentLikeStatus
./ng net.accelbyte.sdk.cli.Main ugc updateContentLikeStatus \
    --contentId 'uintSXRL' \
    --namespace "$AB_NAMESPACE" \
    --body '{"likeStatus": true}' \
    > test.out 2>&1
eval_tap $? 66 'UpdateContentLikeStatus' test.out

#- 67 PublicDownloadContentPreview
./ng net.accelbyte.sdk.cli.Main ugc publicDownloadContentPreview \
    --contentId 'P3KYw2Bs' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 67 'PublicDownloadContentPreview' test.out

#- 68 GetTag
./ng net.accelbyte.sdk.cli.Main ugc getTag \
    --namespace "$AB_NAMESPACE" \
    --limit '44' \
    --offset '5' \
    > test.out 2>&1
eval_tap $? 68 'GetTag' test.out

#- 69 GetType
./ng net.accelbyte.sdk.cli.Main ugc getType \
    --namespace "$AB_NAMESPACE" \
    --limit '59' \
    --offset '56' \
    > test.out 2>&1
eval_tap $? 69 'GetType' test.out

#- 70 PublicSearchCreator
./ng net.accelbyte.sdk.cli.Main ugc publicSearchCreator \
    --namespace "$AB_NAMESPACE" \
    --limit '84' \
    --offset '20' \
    --orderby 'zTcHvHl4' \
    --sortby 'XlLHdOPi' \
    > test.out 2>&1
eval_tap $? 70 'PublicSearchCreator' test.out

#- 71 GetFollowedUsers
./ng net.accelbyte.sdk.cli.Main ugc getFollowedUsers \
    --namespace "$AB_NAMESPACE" \
    --limit '35' \
    --offset '16' \
    > test.out 2>&1
eval_tap $? 71 'GetFollowedUsers' test.out

#- 72 PublicGetCreator
./ng net.accelbyte.sdk.cli.Main ugc publicGetCreator \
    --namespace "$AB_NAMESPACE" \
    --userId 'w2GgEaie' \
    > test.out 2>&1
eval_tap $? 72 'PublicGetCreator' test.out

#- 73 GetChannels
./ng net.accelbyte.sdk.cli.Main ugc getChannels \
    --namespace "$AB_NAMESPACE" \
    --userId 'ko9gkIfn' \
    --limit '12' \
    --name '1N6LPTfb' \
    --offset '96' \
    > test.out 2>&1
eval_tap $? 73 'GetChannels' test.out

#- 74 PublicCreateChannel
./ng net.accelbyte.sdk.cli.Main ugc publicCreateChannel \
    --namespace "$AB_NAMESPACE" \
    --userId 'Ioaaqj5B' \
    --body '{"name": "pbXlXPKT"}' \
    > test.out 2>&1
eval_tap $? 74 'PublicCreateChannel' test.out

#- 75 DeleteAllUserChannel
./ng net.accelbyte.sdk.cli.Main ugc deleteAllUserChannel \
    --namespace "$AB_NAMESPACE" \
    --userId 'kQPjemko' \
    > test.out 2>&1
eval_tap $? 75 'DeleteAllUserChannel' test.out

#- 76 UpdateChannel
./ng net.accelbyte.sdk.cli.Main ugc updateChannel \
    --channelId 'VYUHbHNc' \
    --namespace "$AB_NAMESPACE" \
    --userId 'BGoGw3y2' \
    --body '{"name": "ozoxStgG"}' \
    > test.out 2>&1
eval_tap $? 76 'UpdateChannel' test.out

#- 77 DeleteChannel
./ng net.accelbyte.sdk.cli.Main ugc deleteChannel \
    --channelId '10MKDe6j' \
    --namespace "$AB_NAMESPACE" \
    --userId 'TQMmB3gj' \
    > test.out 2>&1
eval_tap $? 77 'DeleteChannel' test.out

#- 78 CreateContentDirect
eval_tap 0 78 'CreateContentDirect # SKIP deprecated' test.out

#- 79 CreateContentS3
./ng net.accelbyte.sdk.cli.Main ugc createContentS3 \
    --channelId 'PYKWeNxW' \
    --namespace "$AB_NAMESPACE" \
    --userId 'RweSFDfZ' \
    --body '{"contentType": "vl8IIHlg", "customAttributes": {"fOSeeO5p": {}, "TMegGTOv": {}, "eA8d9aud": {}}, "fileExtension": "OzP5SSMd", "name": "rmqSh2ED", "preview": "76d4ziM9", "previewMetadata": {"previewContentType": "Z6uDTGpS", "previewFileExtension": "ObE6s6w9"}, "subType": "C6eyjIGf", "tags": ["ge3W87WF", "eLYyERos", "UNlFSvlK"], "type": "pQtLQ1OI"}' \
    > test.out 2>&1
eval_tap $? 79 'CreateContentS3' test.out

#- 80 PublicUpdateContentByShareCode
./ng net.accelbyte.sdk.cli.Main ugc publicUpdateContentByShareCode \
    --channelId 'YIYDW5th' \
    --namespace "$AB_NAMESPACE" \
    --shareCode '1oglLrXu' \
    --userId 'nanmuK8Q' \
    --body '{"contentType": "qcgq6Dvo", "customAttributes": {"TGrL4WKt": {}, "3DAQHZEf": {}, "Ego87nzW": {}}, "fileExtension": "p48MqgfE", "name": "kwkaK6TA", "payload": "hL89wmxa", "preview": "fxzNKXNE", "previewMetadata": {"previewContentType": "xQju7ZdU", "previewFileExtension": "NxhkFoIv"}, "subType": "E7Z4O7Oz", "tags": ["uoQVaQ7z", "ebOA8v8n", "RHl11wpj"], "type": "4OgRLDGF", "updateContentFile": true}' \
    > test.out 2>&1
eval_tap $? 80 'PublicUpdateContentByShareCode' test.out

#- 81 UpdateContentS3
./ng net.accelbyte.sdk.cli.Main ugc updateContentS3 \
    --channelId 'y6pMA8nz' \
    --contentId 'GaaSJP33' \
    --namespace "$AB_NAMESPACE" \
    --userId 'AcdcGNoU' \
    --body '{"contentType": "iMIRivNo", "customAttributes": {"zJ7pzT1Q": {}, "uT7SDfy6": {}, "8DeQw4Op": {}}, "fileExtension": "0WZ9xCMj", "name": "mnKD3Hf4", "payload": "PVhvneRL", "preview": "qLDMK1oT", "previewMetadata": {"previewContentType": "Zi0MA2Kn", "previewFileExtension": "xdaAYvn9"}, "subType": "RS98dvUu", "tags": ["JqsTtsyH", "GB7EZfzL", "2X33v9h4"], "type": "o0YQKoAW", "updateContentFile": true}' \
    > test.out 2>&1
eval_tap $? 81 'UpdateContentS3' test.out

#- 82 PublicDeleteContentByShareCode
./ng net.accelbyte.sdk.cli.Main ugc publicDeleteContentByShareCode \
    --channelId 'CaiV8sXO' \
    --namespace "$AB_NAMESPACE" \
    --shareCode '6kTkznEq' \
    --userId 'l46DY0AU' \
    > test.out 2>&1
eval_tap $? 82 'PublicDeleteContentByShareCode' test.out

#- 83 UpdateContentDirect
eval_tap 0 83 'UpdateContentDirect # SKIP deprecated' test.out

#- 84 DeleteContent
./ng net.accelbyte.sdk.cli.Main ugc deleteContent \
    --channelId 'PrWoIZZv' \
    --contentId 'Gs83n4PR' \
    --namespace "$AB_NAMESPACE" \
    --userId 'cNetT6xI' \
    > test.out 2>&1
eval_tap $? 84 'DeleteContent' test.out

#- 85 UpdateContentShareCode
./ng net.accelbyte.sdk.cli.Main ugc updateContentShareCode \
    --channelId 'QTZVea4P' \
    --contentId '7mEspLn7' \
    --namespace "$AB_NAMESPACE" \
    --userId 'fhixJUMv' \
    --body '{"shareCode": "6DlIUiED"}' \
    > test.out 2>&1
eval_tap $? 85 'UpdateContentShareCode' test.out

#- 86 PublicGetUserContent
./ng net.accelbyte.sdk.cli.Main ugc publicGetUserContent \
    --namespace "$AB_NAMESPACE" \
    --userId 'UaxiN3fP' \
    --limit '81' \
    --offset '53' \
    > test.out 2>&1
eval_tap $? 86 'PublicGetUserContent' test.out

#- 87 DeleteAllUserContents
./ng net.accelbyte.sdk.cli.Main ugc deleteAllUserContents \
    --namespace "$AB_NAMESPACE" \
    --userId 'b3948pNP' \
    > test.out 2>&1
eval_tap $? 87 'DeleteAllUserContents' test.out

#- 88 UpdateScreenshots
./ng net.accelbyte.sdk.cli.Main ugc updateScreenshots \
    --contentId 'FJEPgZX2' \
    --namespace "$AB_NAMESPACE" \
    --userId 'z9KOQN0S' \
    --body '{"screenshots": [{"description": "YanfQ9Ub", "screenshotId": "AfIEAiqc"}, {"description": "1oqDWMMo", "screenshotId": "T9J55ftT"}, {"description": "audPkjXe", "screenshotId": "KasWOXFJ"}]}' \
    > test.out 2>&1
eval_tap $? 88 'UpdateScreenshots' test.out

#- 89 UploadContentScreenshot
./ng net.accelbyte.sdk.cli.Main ugc uploadContentScreenshot \
    --contentId '4PfqZ2dm' \
    --namespace "$AB_NAMESPACE" \
    --userId 'T9bEpBF5' \
    --body '{"screenshots": [{"contentType": "7b2EDdRJ", "description": "Vk6bDGMc", "fileExtension": "png"}, {"contentType": "2cfg06p6", "description": "JAQFISb8", "fileExtension": "pjp"}, {"contentType": "cc9PRpyR", "description": "4I5wU0dq", "fileExtension": "bmp"}]}' \
    > test.out 2>&1
eval_tap $? 89 'UploadContentScreenshot' test.out

#- 90 DeleteContentScreenshot
./ng net.accelbyte.sdk.cli.Main ugc deleteContentScreenshot \
    --contentId 'JtHT4Lee' \
    --namespace "$AB_NAMESPACE" \
    --screenshotId 'lkTfzuNJ' \
    --userId 'Ap2wCnio' \
    > test.out 2>&1
eval_tap $? 90 'DeleteContentScreenshot' test.out

#- 91 UpdateUserFollowStatus
./ng net.accelbyte.sdk.cli.Main ugc updateUserFollowStatus \
    --namespace "$AB_NAMESPACE" \
    --userId 'JN08ppAH' \
    --body '{"followStatus": true}' \
    > test.out 2>&1
eval_tap $? 91 'UpdateUserFollowStatus' test.out

#- 92 GetPublicFollowers
./ng net.accelbyte.sdk.cli.Main ugc getPublicFollowers \
    --namespace "$AB_NAMESPACE" \
    --userId 'enZQ50TJ' \
    --limit '64' \
    --offset '58' \
    > test.out 2>&1
eval_tap $? 92 'GetPublicFollowers' test.out

#- 93 GetPublicFollowing
./ng net.accelbyte.sdk.cli.Main ugc getPublicFollowing \
    --namespace "$AB_NAMESPACE" \
    --userId 'CS0mYiOp' \
    --limit '1' \
    --offset '44' \
    > test.out 2>&1
eval_tap $? 93 'GetPublicFollowing' test.out

#- 94 GetGroups
./ng net.accelbyte.sdk.cli.Main ugc getGroups \
    --namespace "$AB_NAMESPACE" \
    --userId 'xEYf8WNX' \
    --limit '90' \
    --offset '4' \
    > test.out 2>&1
eval_tap $? 94 'GetGroups' test.out

#- 95 CreateGroup
./ng net.accelbyte.sdk.cli.Main ugc createGroup \
    --namespace "$AB_NAMESPACE" \
    --userId 'ir6Yomhc' \
    --body '{"contents": ["maqRJysG", "Qkmq13DP", "EDRegoq3"], "name": "46hRadA7"}' \
    > test.out 2>&1
eval_tap $? 95 'CreateGroup' test.out

#- 96 DeleteAllUserGroup
./ng net.accelbyte.sdk.cli.Main ugc deleteAllUserGroup \
    --namespace "$AB_NAMESPACE" \
    --userId 'WNROJMhP' \
    > test.out 2>&1
eval_tap $? 96 'DeleteAllUserGroup' test.out

#- 97 GetGroup
./ng net.accelbyte.sdk.cli.Main ugc getGroup \
    --groupId 'XB3f2b3p' \
    --namespace "$AB_NAMESPACE" \
    --userId 'Qhfks7gK' \
    > test.out 2>&1
eval_tap $? 97 'GetGroup' test.out

#- 98 UpdateGroup
./ng net.accelbyte.sdk.cli.Main ugc updateGroup \
    --groupId 'm4X4vTGQ' \
    --namespace "$AB_NAMESPACE" \
    --userId 'Tl1fzzAI' \
    --body '{"contents": ["NNzS3LVO", "6NZR2Zr7", "aWRe1K2H"], "name": "ev9LYcEI"}' \
    > test.out 2>&1
eval_tap $? 98 'UpdateGroup' test.out

#- 99 DeleteGroup
./ng net.accelbyte.sdk.cli.Main ugc deleteGroup \
    --groupId 'bgHwxaAW' \
    --namespace "$AB_NAMESPACE" \
    --userId '6CM5OJ7v' \
    > test.out 2>&1
eval_tap $? 99 'DeleteGroup' test.out

#- 100 GetGroupContent
./ng net.accelbyte.sdk.cli.Main ugc getGroupContent \
    --groupId 't6WqSPqv' \
    --namespace "$AB_NAMESPACE" \
    --userId 'IUQT1lg8' \
    --limit '81' \
    --offset '64' \
    > test.out 2>&1
eval_tap $? 100 'GetGroupContent' test.out

#- 101 DeleteAllUserStates
./ng net.accelbyte.sdk.cli.Main ugc deleteAllUserStates \
    --namespace "$AB_NAMESPACE" \
    --userId 'sSoJcdo7' \
    > test.out 2>&1
eval_tap $? 101 'DeleteAllUserStates' test.out

#- 102 AdminGetContentByChannelIDV2
./ng net.accelbyte.sdk.cli.Main ugc adminGetContentByChannelIDV2 \
    --channelId 'EEDomD7L' \
    --namespace "$AB_NAMESPACE" \
    --limit '94' \
    --name 'jXGll3Y3' \
    --offset '12' \
    --sortBy 'MisP4lBr' \
    > test.out 2>&1
eval_tap $? 102 'AdminGetContentByChannelIDV2' test.out

#- 103 AdminCreateContentV2
./ng net.accelbyte.sdk.cli.Main ugc adminCreateContentV2 \
    --channelId 'YWrfODtO' \
    --namespace "$AB_NAMESPACE" \
    --body '{"contentType": "ET9lpP4U", "customAttributes": {"wbn9thls": {}, "BkcI3HMN": {}, "Zep5JkTU": {}}, "fileExtension": "xXKwuZjv", "name": "xLRZjgyg", "shareCode": "INtBbVjL", "subType": "f7t9DaiN", "tags": ["jw0l1JON", "FjBqzB4N", "Mjt8EN6e"], "type": "BV5gadhK"}' \
    > test.out 2>&1
eval_tap $? 103 'AdminCreateContentV2' test.out

#- 104 AdminDeleteOfficialContentV2
./ng net.accelbyte.sdk.cli.Main ugc adminDeleteOfficialContentV2 \
    --channelId 'eApeKvP2' \
    --contentId 'wwUAK5pi' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 104 'AdminDeleteOfficialContentV2' test.out

#- 105 AdminUpdateOfficialContentV2
./ng net.accelbyte.sdk.cli.Main ugc adminUpdateOfficialContentV2 \
    --channelId 'eyrYwnFD' \
    --contentId 'wvBaGEAQ' \
    --namespace "$AB_NAMESPACE" \
    --body '{"customAttributes": {"P528n890": {}, "gzP3qMJu": {}, "rRviDqdZ": {}}, "name": "aIOFskKu", "shareCode": "NSZrAVWH", "subType": "8pmzlKK4", "tags": ["t8EXP5nD", "jongm72A", "8Z1X8oCC"], "type": "vgxB7GR9"}' \
    > test.out 2>&1
eval_tap $? 105 'AdminUpdateOfficialContentV2' test.out

#- 106 AdminCopyContent
./ng net.accelbyte.sdk.cli.Main ugc adminCopyContent \
    --channelId 'rMR5sqKR' \
    --contentId 'qfFjLUsR' \
    --namespace "$AB_NAMESPACE" \
    --body '{"customAttributes": {"QM7MonMV": {}, "ODfvFSU9": {}, "7cHoJGnq": {}}, "name": "BDFbJkM7", "subType": "WrPCsJKI", "tags": ["Q4GvjOgF", "uLjhV3gp", "hPvseoue"], "targetChannelId": "OStwtt0h", "type": "Z5D2w4XA"}' \
    > test.out 2>&1
eval_tap $? 106 'AdminCopyContent' test.out

#- 107 AdminUpdateOfficialContentFileLocation
./ng net.accelbyte.sdk.cli.Main ugc adminUpdateOfficialContentFileLocation \
    --channelId 'f6DPPP4D' \
    --contentId '1xmCanKz' \
    --namespace "$AB_NAMESPACE" \
    --body '{"fileExtension": "46JlQR56", "fileLocation": "5VZ2Vgmt"}' \
    > test.out 2>&1
eval_tap $? 107 'AdminUpdateOfficialContentFileLocation' test.out

#- 108 AdminGenerateOfficialContentUploadURLV2
./ng net.accelbyte.sdk.cli.Main ugc adminGenerateOfficialContentUploadURLV2 \
    --channelId 'jLN0DrSm' \
    --contentId 'zM4vbjUc' \
    --namespace "$AB_NAMESPACE" \
    --body '{"contentType": "jFbrRoY0", "fileExtension": "7sFk4AZY"}' \
    > test.out 2>&1
eval_tap $? 108 'AdminGenerateOfficialContentUploadURLV2' test.out

#- 109 AdminGetConfigs
./ng net.accelbyte.sdk.cli.Main ugc adminGetConfigs \
    --namespace "$AB_NAMESPACE" \
    --limit '61' \
    --offset '66' \
    > test.out 2>&1
eval_tap $? 109 'AdminGetConfigs' test.out

#- 110 AdminUpdateConfig
./ng net.accelbyte.sdk.cli.Main ugc adminUpdateConfig \
    --key 'EgQfC6tb' \
    --namespace "$AB_NAMESPACE" \
    --body '{"value": "BsWCo8fM"}' \
    > test.out 2>&1
eval_tap $? 110 'AdminUpdateConfig' test.out

#- 111 AdminListContentV2
./ng net.accelbyte.sdk.cli.Main ugc adminListContentV2 \
    --namespace "$AB_NAMESPACE" \
    --isOfficial  \
    --limit '78' \
    --name 'J9bfYcCe' \
    --offset '21' \
    --sortBy 'TjKMiwe6' \
    --subType 'RU2G9N4w' \
    --tags 'ngqZuQod,a9HRZSir,j82CS7Ah' \
    --type '9xq6I3WL' \
    > test.out 2>&1
eval_tap $? 111 'AdminListContentV2' test.out

#- 112 AdminBulkGetContentByIDsV2
./ng net.accelbyte.sdk.cli.Main ugc adminBulkGetContentByIDsV2 \
    --namespace "$AB_NAMESPACE" \
    --body '{"contentIds": ["vBsZkeXq", "v3eUpbWD", "fhWKq7s7"]}' \
    > test.out 2>&1
eval_tap $? 112 'AdminBulkGetContentByIDsV2' test.out

#- 113 AdminGetContentBulkByShareCodesV2
./ng net.accelbyte.sdk.cli.Main ugc adminGetContentBulkByShareCodesV2 \
    --namespace "$AB_NAMESPACE" \
    --body '{"shareCodes": ["kMBHwFW9", "AWv72Kdn", "iITgiQ2I"]}' \
    > test.out 2>&1
eval_tap $? 113 'AdminGetContentBulkByShareCodesV2' test.out

#- 114 AdminGetContentByShareCodeV2
./ng net.accelbyte.sdk.cli.Main ugc adminGetContentByShareCodeV2 \
    --namespace "$AB_NAMESPACE" \
    --shareCode '4cgvQcY7' \
    > test.out 2>&1
eval_tap $? 114 'AdminGetContentByShareCodeV2' test.out

#- 115 AdminGetContentByContentIDV2
./ng net.accelbyte.sdk.cli.Main ugc adminGetContentByContentIDV2 \
    --contentId 'mOE6QAFp' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 115 'AdminGetContentByContentIDV2' test.out

#- 116 RollbackContentVersionV2
./ng net.accelbyte.sdk.cli.Main ugc rollbackContentVersionV2 \
    --contentId 'PqzCWpWI' \
    --namespace "$AB_NAMESPACE" \
    --versionId 'nz3B3vc7' \
    > test.out 2>&1
eval_tap $? 116 'RollbackContentVersionV2' test.out

#- 117 AdminUpdateScreenshotsV2
./ng net.accelbyte.sdk.cli.Main ugc adminUpdateScreenshotsV2 \
    --contentId 'h0gtEjF5' \
    --namespace "$AB_NAMESPACE" \
    --body '{"screenshots": [{"description": "Ooev3fit", "screenshotId": "VPkQMUpN"}, {"description": "2OXUbWBK", "screenshotId": "TXHXAq6N"}, {"description": "cSgy8TuJ", "screenshotId": "zGtwtgXp"}]}' \
    > test.out 2>&1
eval_tap $? 117 'AdminUpdateScreenshotsV2' test.out

#- 118 AdminUploadContentScreenshotV2
./ng net.accelbyte.sdk.cli.Main ugc adminUploadContentScreenshotV2 \
    --contentId 'EgzrpNlH' \
    --namespace "$AB_NAMESPACE" \
    --body '{"screenshots": [{"contentType": "j6ET8oYT", "description": "w1M96JFn", "fileExtension": "jfif"}, {"contentType": "GmhgCzAC", "description": "oOloAN2m", "fileExtension": "png"}, {"contentType": "1naiHYNL", "description": "FIwqT63i", "fileExtension": "png"}]}' \
    > test.out 2>&1
eval_tap $? 118 'AdminUploadContentScreenshotV2' test.out

#- 119 AdminDeleteContentScreenshotV2
./ng net.accelbyte.sdk.cli.Main ugc adminDeleteContentScreenshotV2 \
    --contentId 'n8TCcH8n' \
    --namespace "$AB_NAMESPACE" \
    --screenshotId 'goinsb50' \
    > test.out 2>&1
eval_tap $? 119 'AdminDeleteContentScreenshotV2' test.out

#- 120 ListContentVersionsV2
./ng net.accelbyte.sdk.cli.Main ugc listContentVersionsV2 \
    --contentId 'JCpLq5qf' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 120 'ListContentVersionsV2' test.out

#- 121 AdminGetOfficialGroupContentsV2
./ng net.accelbyte.sdk.cli.Main ugc adminGetOfficialGroupContentsV2 \
    --groupId '88ZnJjrF' \
    --namespace "$AB_NAMESPACE" \
    --limit '89' \
    --offset '28' \
    > test.out 2>&1
eval_tap $? 121 'AdminGetOfficialGroupContentsV2' test.out

#- 122 AdminListStagingContents
./ng net.accelbyte.sdk.cli.Main ugc adminListStagingContents \
    --namespace "$AB_NAMESPACE" \
    --limit '54' \
    --offset '86' \
    --sortBy 'RDDzrEaW' \
    --status '8Kzd5TIj' \
    > test.out 2>&1
eval_tap $? 122 'AdminListStagingContents' test.out

#- 123 AdminGetStagingContentByID
./ng net.accelbyte.sdk.cli.Main ugc adminGetStagingContentByID \
    --contentId 'NjSpqCvT' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 123 'AdminGetStagingContentByID' test.out

#- 124 AdminApproveStagingContent
./ng net.accelbyte.sdk.cli.Main ugc adminApproveStagingContent \
    --contentId 'zwiM50vo' \
    --namespace "$AB_NAMESPACE" \
    --body '{"approved": false, "note": "bIjBq2Tk"}' \
    > test.out 2>&1
eval_tap $? 124 'AdminApproveStagingContent' test.out

#- 125 AdminUpdateContentByShareCodeV2
./ng net.accelbyte.sdk.cli.Main ugc adminUpdateContentByShareCodeV2 \
    --channelId 'nCRacgNg' \
    --namespace "$AB_NAMESPACE" \
    --shareCode '99Z7xIdP' \
    --userId 'YZmpbZ4D' \
    --body '{"customAttributes": {"TNrO4XKn": {}, "sjxMs6kF": {}, "sR3AicK7": {}}, "name": "dmGQL1jH", "shareCode": "2Jl8GxOJ", "subType": "oxvMw40g", "tags": ["uKTeGg1U", "DIlj18Fb", "sdJK7ieo"], "type": "CtTssP93"}' \
    > test.out 2>&1
eval_tap $? 125 'AdminUpdateContentByShareCodeV2' test.out

#- 126 AdminDeleteContentByShareCodeV2
./ng net.accelbyte.sdk.cli.Main ugc adminDeleteContentByShareCodeV2 \
    --channelId 'JOfCowzG' \
    --namespace "$AB_NAMESPACE" \
    --shareCode '1iLGSl6A' \
    --userId 'RwKt1WJ5' \
    > test.out 2>&1
eval_tap $? 126 'AdminDeleteContentByShareCodeV2' test.out

#- 127 AdminDeleteUserContentV2
./ng net.accelbyte.sdk.cli.Main ugc adminDeleteUserContentV2 \
    --channelId 'Qyo0ZC2w' \
    --contentId 'hFUOk33s' \
    --namespace "$AB_NAMESPACE" \
    --userId 'OIZMc61e' \
    > test.out 2>&1
eval_tap $? 127 'AdminDeleteUserContentV2' test.out

#- 128 AdminUpdateUserContentV2
./ng net.accelbyte.sdk.cli.Main ugc adminUpdateUserContentV2 \
    --channelId 'l2SnYtpI' \
    --contentId 'vSdvIkfe' \
    --namespace "$AB_NAMESPACE" \
    --userId 'ODU31xY0' \
    --body '{"customAttributes": {"12HqSJmH": {}, "621S0OaQ": {}, "7by9WTMf": {}}, "name": "sAH4QhMU", "shareCode": "kZ1wdfLI", "subType": "vVotPK3r", "tags": ["gTD6BbhO", "8bg0DJym", "8n7RoVcJ"], "type": "KP2ZQ77G"}' \
    > test.out 2>&1
eval_tap $? 128 'AdminUpdateUserContentV2' test.out

#- 129 AdminUpdateUserContentFileLocation
./ng net.accelbyte.sdk.cli.Main ugc adminUpdateUserContentFileLocation \
    --channelId 'o4f4njCq' \
    --contentId 'ikR0p9j5' \
    --namespace "$AB_NAMESPACE" \
    --userId 'a0Xp4r91' \
    --body '{"fileExtension": "ehWU9jBx", "fileLocation": "BlMxhXgF"}' \
    > test.out 2>&1
eval_tap $? 129 'AdminUpdateUserContentFileLocation' test.out

#- 130 AdminGenerateUserContentUploadURLV2
./ng net.accelbyte.sdk.cli.Main ugc adminGenerateUserContentUploadURLV2 \
    --channelId 'ZuuVlXXr' \
    --contentId 'CaPhr2eY' \
    --namespace "$AB_NAMESPACE" \
    --userId 'pFOEwmIT' \
    --body '{"contentType": "fecqRdXQ", "fileExtension": "ZrFWrNaL"}' \
    > test.out 2>&1
eval_tap $? 130 'AdminGenerateUserContentUploadURLV2' test.out

#- 131 AdminGetContentByUserIDV2
./ng net.accelbyte.sdk.cli.Main ugc adminGetContentByUserIDV2 \
    --namespace "$AB_NAMESPACE" \
    --userId 'VMvXr8Q2' \
    --limit '32' \
    --offset '67' \
    --sortBy 'jWQtvZck' \
    > test.out 2>&1
eval_tap $? 131 'AdminGetContentByUserIDV2' test.out

#- 132 AdminUpdateContentHideStatusV2
./ng net.accelbyte.sdk.cli.Main ugc adminUpdateContentHideStatusV2 \
    --contentId '5KPAPrQk' \
    --namespace "$AB_NAMESPACE" \
    --userId 'zM6sWJer' \
    --body '{"isHidden": false}' \
    > test.out 2>&1
eval_tap $? 132 'AdminUpdateContentHideStatusV2' test.out

#- 133 AdminGetUserGroupContentsV2
./ng net.accelbyte.sdk.cli.Main ugc adminGetUserGroupContentsV2 \
    --groupId 'eFd4bUJv' \
    --namespace "$AB_NAMESPACE" \
    --userId 'rvDIwMmF' \
    --limit '87' \
    --offset '20' \
    > test.out 2>&1
eval_tap $? 133 'AdminGetUserGroupContentsV2' test.out

#- 134 AdminListUserStagingContents
./ng net.accelbyte.sdk.cli.Main ugc adminListUserStagingContents \
    --namespace "$AB_NAMESPACE" \
    --userId 'NudQknVw' \
    --limit '61' \
    --offset '4' \
    --sortBy '8CN2Rsra' \
    --status 'REp1TTJG' \
    > test.out 2>&1
eval_tap $? 134 'AdminListUserStagingContents' test.out

#- 135 PublicGetContentByChannelIDV2
./ng net.accelbyte.sdk.cli.Main ugc publicGetContentByChannelIDV2 \
    --channelId 'Ao86H6Ai' \
    --namespace "$AB_NAMESPACE" \
    --limit '36' \
    --name 'IfNKHjNE' \
    --offset '61' \
    --sortBy 'vAvkNqFY' \
    > test.out 2>&1
eval_tap $? 135 'PublicGetContentByChannelIDV2' test.out

#- 136 PublicListContentV2
./ng net.accelbyte.sdk.cli.Main ugc publicListContentV2 \
    --namespace "$AB_NAMESPACE" \
    --isOfficial  \
    --limit '44' \
    --name 'HehV0T5l' \
    --offset '100' \
    --sortBy 'PvtAlZTz' \
    --subType '1B881i5Z' \
    --tags 'seRLuVNK,DevujDxk,wxol35OU' \
    --type 'hHOuff89' \
    > test.out 2>&1
eval_tap $? 136 'PublicListContentV2' test.out

#- 137 PublicBulkGetContentByIDV2
./ng net.accelbyte.sdk.cli.Main ugc publicBulkGetContentByIDV2 \
    --namespace "$AB_NAMESPACE" \
    --body '{"contentIds": ["c9rbCBDD", "xHM3UISP", "btEZncRr"]}' \
    > test.out 2>&1
eval_tap $? 137 'PublicBulkGetContentByIDV2' test.out

#- 138 PublicGetContentBulkByShareCodesV2
./ng net.accelbyte.sdk.cli.Main ugc publicGetContentBulkByShareCodesV2 \
    --namespace "$AB_NAMESPACE" \
    --body '{"shareCodes": ["0zcJgFAz", "pc5Ghx3a", "trMhzt68"]}' \
    > test.out 2>&1
eval_tap $? 138 'PublicGetContentBulkByShareCodesV2' test.out

#- 139 PublicGetContentByShareCodeV2
./ng net.accelbyte.sdk.cli.Main ugc publicGetContentByShareCodeV2 \
    --namespace "$AB_NAMESPACE" \
    --shareCode 'hT9epTwN' \
    > test.out 2>&1
eval_tap $? 139 'PublicGetContentByShareCodeV2' test.out

#- 140 PublicGetContentByIDV2
./ng net.accelbyte.sdk.cli.Main ugc publicGetContentByIDV2 \
    --contentId '8BpGH7vx' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 140 'PublicGetContentByIDV2' test.out

#- 141 PublicAddDownloadCountV2
./ng net.accelbyte.sdk.cli.Main ugc publicAddDownloadCountV2 \
    --contentId 'Hi7YRd8Y' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 141 'PublicAddDownloadCountV2' test.out

#- 142 PublicListContentDownloaderV2
./ng net.accelbyte.sdk.cli.Main ugc publicListContentDownloaderV2 \
    --contentId 'jsVLm4Qb' \
    --namespace "$AB_NAMESPACE" \
    --limit '70' \
    --offset '31' \
    --sortBy 'pUwkEAsf' \
    --userId 'KoM9ky85' \
    > test.out 2>&1
eval_tap $? 142 'PublicListContentDownloaderV2' test.out

#- 143 PublicListContentLikeV2
./ng net.accelbyte.sdk.cli.Main ugc publicListContentLikeV2 \
    --contentId 'Z9SyRyVH' \
    --namespace "$AB_NAMESPACE" \
    --limit '66' \
    --offset '24' \
    --sortBy 'v9tHMdqO' \
    > test.out 2>&1
eval_tap $? 143 'PublicListContentLikeV2' test.out

#- 144 UpdateContentLikeStatusV2
./ng net.accelbyte.sdk.cli.Main ugc updateContentLikeStatusV2 \
    --contentId 'UCvZpVYo' \
    --namespace "$AB_NAMESPACE" \
    --body '{"likeStatus": false}' \
    > test.out 2>&1
eval_tap $? 144 'UpdateContentLikeStatusV2' test.out

#- 145 PublicCreateContentV2
./ng net.accelbyte.sdk.cli.Main ugc publicCreateContentV2 \
    --channelId 'p6J9yLrR' \
    --namespace "$AB_NAMESPACE" \
    --userId 'Jxp9tzOs' \
    --body '{"contentType": "ltGIKhdG", "customAttributes": {"isHSFoLI": {}, "zB2kE8bS": {}, "whwQMTFy": {}}, "fileExtension": "4SxhP2ff", "name": "qdwLUJsL", "subType": "hOkhSafq", "tags": ["r4oTmxqB", "FwhckywA", "1BfRg716"], "type": "Kz7wY4iq"}' \
    > test.out 2>&1
eval_tap $? 145 'PublicCreateContentV2' test.out

#- 146 PublicUpdateContentByShareCodeV2
./ng net.accelbyte.sdk.cli.Main ugc publicUpdateContentByShareCodeV2 \
    --channelId 'ieeZSFXd' \
    --namespace "$AB_NAMESPACE" \
    --shareCode 'dOuxxQV8' \
    --userId 'zhFJFs6j' \
    --body '{"customAttributes": {"Usoh0O8J": {}, "zN24WwmJ": {}, "1npPfmzp": {}}, "name": "Zx77PfvN", "subType": "BegqmtM0", "tags": ["JJY4FIo5", "7QWHvf37", "5JxNRuYV"], "type": "cGrXZQQa"}' \
    > test.out 2>&1
eval_tap $? 146 'PublicUpdateContentByShareCodeV2' test.out

#- 147 PublicDeleteContentByShareCodeV2
./ng net.accelbyte.sdk.cli.Main ugc publicDeleteContentByShareCodeV2 \
    --channelId '41j3jZLn' \
    --namespace "$AB_NAMESPACE" \
    --shareCode 'UkZDGCcJ' \
    --userId 'ycfdyUX0' \
    > test.out 2>&1
eval_tap $? 147 'PublicDeleteContentByShareCodeV2' test.out

#- 148 PublicDeleteContentV2
./ng net.accelbyte.sdk.cli.Main ugc publicDeleteContentV2 \
    --channelId 'PGzkDoq0' \
    --contentId 'vcN6JaAd' \
    --namespace "$AB_NAMESPACE" \
    --userId 'cJ3V2XwV' \
    > test.out 2>&1
eval_tap $? 148 'PublicDeleteContentV2' test.out

#- 149 PublicUpdateContentV2
./ng net.accelbyte.sdk.cli.Main ugc publicUpdateContentV2 \
    --channelId 'qfJ2mHgX' \
    --contentId 'JM6L12Xw' \
    --namespace "$AB_NAMESPACE" \
    --userId '0jiq3pAL' \
    --body '{"customAttributes": {"Ut4hzYbj": {}, "HBMch6JB": {}, "Iberlkrp": {}}, "name": "oFjjzUUg", "subType": "hPcZUXe9", "tags": ["qRywcn71", "RWouNe9Q", "5RCBKft0"], "type": "kKolaobS"}' \
    > test.out 2>&1
eval_tap $? 149 'PublicUpdateContentV2' test.out

#- 150 PublicUpdateContentFileLocation
./ng net.accelbyte.sdk.cli.Main ugc publicUpdateContentFileLocation \
    --channelId 'TDnCT7mG' \
    --contentId 'j8S6MiCU' \
    --namespace "$AB_NAMESPACE" \
    --userId '3RhwshhW' \
    --body '{"fileExtension": "KrAcgp3c", "fileLocation": "lAFSCeFK"}' \
    > test.out 2>&1
eval_tap $? 150 'PublicUpdateContentFileLocation' test.out

#- 151 UpdateContentShareCodeV2
./ng net.accelbyte.sdk.cli.Main ugc updateContentShareCodeV2 \
    --channelId 'HHgydZEZ' \
    --contentId '87WwZjPu' \
    --namespace "$AB_NAMESPACE" \
    --userId 'OC9RvEUi' \
    --body '{"shareCode": "rDwWkKRU"}' \
    > test.out 2>&1
eval_tap $? 151 'UpdateContentShareCodeV2' test.out

#- 152 PublicGenerateContentUploadURLV2
./ng net.accelbyte.sdk.cli.Main ugc publicGenerateContentUploadURLV2 \
    --channelId 'byeXkb7q' \
    --contentId 'jfTpO2wD' \
    --namespace "$AB_NAMESPACE" \
    --userId 'NapzZsLx' \
    --body '{"contentType": "pJSuolB9", "fileExtension": "yToXROxz"}' \
    > test.out 2>&1
eval_tap $? 152 'PublicGenerateContentUploadURLV2' test.out

#- 153 PublicGetContentByUserIDV2
./ng net.accelbyte.sdk.cli.Main ugc publicGetContentByUserIDV2 \
    --namespace "$AB_NAMESPACE" \
    --userId 'Grrfi0du' \
    --limit '13' \
    --offset '3' \
    --sortBy 'WUgO85Gc' \
    > test.out 2>&1
eval_tap $? 153 'PublicGetContentByUserIDV2' test.out

#- 154 UpdateScreenshotsV2
./ng net.accelbyte.sdk.cli.Main ugc updateScreenshotsV2 \
    --contentId 'Vi2QXf4U' \
    --namespace "$AB_NAMESPACE" \
    --userId 'ekJKsCUr' \
    --body '{"screenshots": [{"description": "elWE4j8S", "screenshotId": "LJfJmp30"}, {"description": "eRo1tACG", "screenshotId": "3zQEJHlT"}, {"description": "ZnHKoImH", "screenshotId": "AiMiK8w2"}]}' \
    > test.out 2>&1
eval_tap $? 154 'UpdateScreenshotsV2' test.out

#- 155 UploadContentScreenshotV2
./ng net.accelbyte.sdk.cli.Main ugc uploadContentScreenshotV2 \
    --contentId '8TCQyHSk' \
    --namespace "$AB_NAMESPACE" \
    --userId '3nugAyop' \
    --body '{"screenshots": [{"contentType": "6wncNr4d", "description": "eVigQpJ2", "fileExtension": "png"}, {"contentType": "MYpkvREE", "description": "if7vkYQj", "fileExtension": "jpg"}, {"contentType": "uqMPDPko", "description": "PmZAfHzt", "fileExtension": "pjp"}]}' \
    > test.out 2>&1
eval_tap $? 155 'UploadContentScreenshotV2' test.out

#- 156 DeleteContentScreenshotV2
./ng net.accelbyte.sdk.cli.Main ugc deleteContentScreenshotV2 \
    --contentId 'lxP1Q2ZM' \
    --namespace "$AB_NAMESPACE" \
    --screenshotId 'ArVM9cMZ' \
    --userId 'QGta11xX' \
    > test.out 2>&1
eval_tap $? 156 'DeleteContentScreenshotV2' test.out

#- 157 PublicGetGroupContentsV2
./ng net.accelbyte.sdk.cli.Main ugc publicGetGroupContentsV2 \
    --groupId '3SohbPwf' \
    --namespace "$AB_NAMESPACE" \
    --userId 'nEh1MAFF' \
    --limit '25' \
    --offset '13' \
    > test.out 2>&1
eval_tap $? 157 'PublicGetGroupContentsV2' test.out

#- 158 ListUserStagingContents
./ng net.accelbyte.sdk.cli.Main ugc listUserStagingContents \
    --namespace "$AB_NAMESPACE" \
    --userId 'd2dsBbTz' \
    --limit '4' \
    --offset '10' \
    --sortBy 'F9yODuCy' \
    --status 'cRYYn6I0' \
    > test.out 2>&1
eval_tap $? 158 'ListUserStagingContents' test.out

#- 159 GetUserStagingContentByID
./ng net.accelbyte.sdk.cli.Main ugc getUserStagingContentByID \
    --contentId 'YCwzQxtb' \
    --namespace "$AB_NAMESPACE" \
    --userId 'QPHu1Y89' \
    > test.out 2>&1
eval_tap $? 159 'GetUserStagingContentByID' test.out

#- 160 UpdateStagingContent
./ng net.accelbyte.sdk.cli.Main ugc updateStagingContent \
    --contentId 'wMQIIv62' \
    --namespace "$AB_NAMESPACE" \
    --userId 'X5ngp2pp' \
    --body '{"fileExtension": "6uxxgxOi", "fileLocation": "Yh0dgjpV"}' \
    > test.out 2>&1
eval_tap $? 160 'UpdateStagingContent' test.out

#- 161 DeleteUserStagingContentByID
./ng net.accelbyte.sdk.cli.Main ugc deleteUserStagingContentByID \
    --contentId 'avTScNyC' \
    --namespace "$AB_NAMESPACE" \
    --userId 'CDWhKDNW' \
    > test.out 2>&1
eval_tap $? 161 'DeleteUserStagingContentByID' test.out


rm -f "tmp.dat"

exit $EXIT_CODE