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
    --limit '16' \
    --offset '32' \
    > test.out 2>&1
eval_tap $? 2 'SingleAdminGetChannel' test.out

#- 3 AdminCreateChannel
./ng net.accelbyte.sdk.cli.Main ugc adminCreateChannel \
    --namespace "$AB_NAMESPACE" \
    --body '{"id": "t9cdj4fn", "name": "COllMxTo"}' \
    > test.out 2>&1
eval_tap $? 3 'AdminCreateChannel' test.out

#- 4 SingleAdminUpdateChannel
./ng net.accelbyte.sdk.cli.Main ugc singleAdminUpdateChannel \
    --channelId 'ucdIZ0ku' \
    --namespace "$AB_NAMESPACE" \
    --body '{"name": "d1ZbH3kn"}' \
    > test.out 2>&1
eval_tap $? 4 'SingleAdminUpdateChannel' test.out

#- 5 SingleAdminDeleteChannel
./ng net.accelbyte.sdk.cli.Main ugc singleAdminDeleteChannel \
    --channelId 'qwAnM6Aj' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 5 'SingleAdminDeleteChannel' test.out

#- 6 AdminUploadContentDirect
eval_tap 0 6 'AdminUploadContentDirect # SKIP deprecated' test.out

#- 7 AdminUploadContentS3
./ng net.accelbyte.sdk.cli.Main ugc adminUploadContentS3 \
    --channelId 'GlX0azwz' \
    --namespace "$AB_NAMESPACE" \
    --body '{"contentType": "exXlzJa3", "customAttributes": {"3ASKlTSE": {}, "TPk1pWW7": {}, "MUEsJIrM": {}}, "fileExtension": "hdWL7XYE", "name": "ugib5wls", "preview": "4FYLgZTk", "previewMetadata": {"previewContentType": "ohor20BY", "previewFileExtension": "uXNlX6YX"}, "shareCode": "1dY3xixz", "subType": "apD45ASX", "tags": ["p7nhLXRJ", "doMv3YYo", "tW8hymxQ"], "type": "lKIfIMoB"}' \
    > test.out 2>&1
eval_tap $? 7 'AdminUploadContentS3' test.out

#- 8 SingleAdminUpdateContentS3
./ng net.accelbyte.sdk.cli.Main ugc singleAdminUpdateContentS3 \
    --channelId 'bfUJHdS4' \
    --contentId 'BhWheqe4' \
    --namespace "$AB_NAMESPACE" \
    --body '{"contentType": "oeqrGRwB", "customAttributes": {"3wjjIFQx": {}, "XKloi3K0": {}, "N4hUh2CS": {}}, "fileExtension": "IPxZgQbc", "name": "LUo5E8hf", "payload": "SySDOCtU", "preview": "a3Fkcq7C", "previewMetadata": {"previewContentType": "epQlbgBH", "previewFileExtension": "bwjVDTTb"}, "shareCode": "qEjr1Phf", "subType": "ITtNF75c", "tags": ["6g2CbaAo", "b5GYbIN4", "IYUl83ZL"], "type": "8WCUZVIp", "updateContentFile": true}' \
    > test.out 2>&1
eval_tap $? 8 'SingleAdminUpdateContentS3' test.out

#- 9 AdminSearchChannelSpecificContent
./ng net.accelbyte.sdk.cli.Main ugc adminSearchChannelSpecificContent \
    --channelId 'VctP0e52' \
    --namespace "$AB_NAMESPACE" \
    --creator '0xPU60JU' \
    --ishidden 'X4Cm6Min' \
    --isofficial 'ZXIoEVjA' \
    --limit '16' \
    --name 'pW7AD7zY' \
    --offset '90' \
    --orderby 'RU7auK3q' \
    --sortby 'NmAwf0s8' \
    --subtype '6QOS4GA2' \
    --tags 'CT5KPSiQ,u86xAKfj,eryPu37X' \
    --type 'g2lNaCHK' \
    --userId 'yIbc8yX5' \
    > test.out 2>&1
eval_tap $? 9 'AdminSearchChannelSpecificContent' test.out

#- 10 SingleAdminUpdateContentDirect
eval_tap 0 10 'SingleAdminUpdateContentDirect # SKIP deprecated' test.out

#- 11 SingleAdminDeleteContent
./ng net.accelbyte.sdk.cli.Main ugc singleAdminDeleteContent \
    --channelId 'gOfraHa1' \
    --contentId 'rlppp0Li' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 11 'SingleAdminDeleteContent' test.out

#- 12 SingleAdminGetContent
./ng net.accelbyte.sdk.cli.Main ugc singleAdminGetContent \
    --namespace "$AB_NAMESPACE" \
    --limit '38' \
    --offset '77' \
    > test.out 2>&1
eval_tap $? 12 'SingleAdminGetContent' test.out

#- 13 AdminGetContentBulk
./ng net.accelbyte.sdk.cli.Main ugc adminGetContentBulk \
    --namespace "$AB_NAMESPACE" \
    --body '{"contentIds": ["XvBdYUc8", "EvxKymKs", "BrVabo6H"]}' \
    > test.out 2>&1
eval_tap $? 13 'AdminGetContentBulk' test.out

#- 14 AdminSearchContent
./ng net.accelbyte.sdk.cli.Main ugc adminSearchContent \
    --namespace "$AB_NAMESPACE" \
    --creator 'MDanugCD' \
    --ishidden 'TlxgPIMM' \
    --isofficial 'h6xqfPrZ' \
    --limit '83' \
    --name 'uhviBxCK' \
    --offset '5' \
    --orderby 'IMbIt09H' \
    --sortby '2ExAEcV5' \
    --subtype 'm0gjhghT' \
    --tags 'kbXY6CVM,GZClO22w,gnzHHxHb' \
    --type 'vvhBTaqK' \
    --userId '2L9aRLAc' \
    > test.out 2>&1
eval_tap $? 14 'AdminSearchContent' test.out

#- 15 AdminGetContentBulkByShareCodes
./ng net.accelbyte.sdk.cli.Main ugc adminGetContentBulkByShareCodes \
    --namespace "$AB_NAMESPACE" \
    --body '{"shareCodes": ["jRurtJ2L", "QwR3ihNy", "F37ZzmJb"]}' \
    > test.out 2>&1
eval_tap $? 15 'AdminGetContentBulkByShareCodes' test.out

#- 16 AdminGetUserContentByShareCode
./ng net.accelbyte.sdk.cli.Main ugc adminGetUserContentByShareCode \
    --namespace "$AB_NAMESPACE" \
    --shareCode 'PiEH5bvj' \
    > test.out 2>&1
eval_tap $? 16 'AdminGetUserContentByShareCode' test.out

#- 17 AdminGetSpecificContent
./ng net.accelbyte.sdk.cli.Main ugc adminGetSpecificContent \
    --contentId 'QsZ9kJEG' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 17 'AdminGetSpecificContent' test.out

#- 18 AdminDownloadContentPreview
./ng net.accelbyte.sdk.cli.Main ugc adminDownloadContentPreview \
    --contentId 'Bj7ZsMjI' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 18 'AdminDownloadContentPreview' test.out

#- 19 RollbackContentVersion
./ng net.accelbyte.sdk.cli.Main ugc rollbackContentVersion \
    --contentId 'fKR4HS9e' \
    --namespace "$AB_NAMESPACE" \
    --versionId '99PwcHrt' \
    > test.out 2>&1
eval_tap $? 19 'RollbackContentVersion' test.out

#- 20 AdminUpdateScreenshots
./ng net.accelbyte.sdk.cli.Main ugc adminUpdateScreenshots \
    --contentId 'E1bZDXOL' \
    --namespace "$AB_NAMESPACE" \
    --body '{"screenshots": [{"description": "tLNezZMa", "screenshotId": "vrAI2q65"}, {"description": "gYztnWue", "screenshotId": "fy9ANgwh"}, {"description": "6LWcaxC8", "screenshotId": "93JQ7xhj"}]}' \
    > test.out 2>&1
eval_tap $? 20 'AdminUpdateScreenshots' test.out

#- 21 AdminUploadContentScreenshot
./ng net.accelbyte.sdk.cli.Main ugc adminUploadContentScreenshot \
    --contentId '4Srgu1fI' \
    --namespace "$AB_NAMESPACE" \
    --body '{"screenshots": [{"contentType": "qSGN6VZy", "description": "FCkAVQch", "fileExtension": "png"}, {"contentType": "mlcfiawt", "description": "rzm38m16", "fileExtension": "pjp"}, {"contentType": "XjZI6LjX", "description": "CLlWD61j", "fileExtension": "pjp"}]}' \
    > test.out 2>&1
eval_tap $? 21 'AdminUploadContentScreenshot' test.out

#- 22 AdminDeleteContentScreenshot
./ng net.accelbyte.sdk.cli.Main ugc adminDeleteContentScreenshot \
    --contentId 'vbKmhoh9' \
    --namespace "$AB_NAMESPACE" \
    --screenshotId 'pMXwcaHU' \
    > test.out 2>&1
eval_tap $? 22 'AdminDeleteContentScreenshot' test.out

#- 23 ListContentVersions
./ng net.accelbyte.sdk.cli.Main ugc listContentVersions \
    --contentId 'ILNhP72U' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 23 'ListContentVersions' test.out

#- 24 SingleAdminGetAllGroups
./ng net.accelbyte.sdk.cli.Main ugc singleAdminGetAllGroups \
    --namespace "$AB_NAMESPACE" \
    --limit '67' \
    --offset '19' \
    > test.out 2>&1
eval_tap $? 24 'SingleAdminGetAllGroups' test.out

#- 25 AdminCreateGroup
./ng net.accelbyte.sdk.cli.Main ugc adminCreateGroup \
    --namespace "$AB_NAMESPACE" \
    --body '{"contents": ["hBmYB8LA", "bVdcbf9v", "SzTESRHJ"], "name": "yqNJIxzF"}' \
    > test.out 2>&1
eval_tap $? 25 'AdminCreateGroup' test.out

#- 26 SingleAdminGetGroup
./ng net.accelbyte.sdk.cli.Main ugc singleAdminGetGroup \
    --groupId 'rClPYvxO' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 26 'SingleAdminGetGroup' test.out

#- 27 SingleAdminUpdateGroup
./ng net.accelbyte.sdk.cli.Main ugc singleAdminUpdateGroup \
    --groupId 'lt2tSc3T' \
    --namespace "$AB_NAMESPACE" \
    --body '{"contents": ["aad5PDaX", "wf8DljbA", "cY8Y4VEG"], "name": "ePkRs7Xu"}' \
    > test.out 2>&1
eval_tap $? 27 'SingleAdminUpdateGroup' test.out

#- 28 SingleAdminDeleteGroup
./ng net.accelbyte.sdk.cli.Main ugc singleAdminDeleteGroup \
    --groupId 'ZBiMvolj' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 28 'SingleAdminDeleteGroup' test.out

#- 29 SingleAdminGetGroupContents
./ng net.accelbyte.sdk.cli.Main ugc singleAdminGetGroupContents \
    --groupId 'cAN5nAjC' \
    --namespace "$AB_NAMESPACE" \
    --limit '79' \
    --offset '35' \
    > test.out 2>&1
eval_tap $? 29 'SingleAdminGetGroupContents' test.out

#- 30 AdminGetTag
./ng net.accelbyte.sdk.cli.Main ugc adminGetTag \
    --namespace "$AB_NAMESPACE" \
    --limit '78' \
    --offset '27' \
    > test.out 2>&1
eval_tap $? 30 'AdminGetTag' test.out

#- 31 AdminCreateTag
./ng net.accelbyte.sdk.cli.Main ugc adminCreateTag \
    --namespace "$AB_NAMESPACE" \
    --body '{"tag": "BP7UUG2d"}' \
    > test.out 2>&1
eval_tap $? 31 'AdminCreateTag' test.out

#- 32 AdminUpdateTag
./ng net.accelbyte.sdk.cli.Main ugc adminUpdateTag \
    --namespace "$AB_NAMESPACE" \
    --tagId 'z1lzUzq2' \
    --body '{"tag": "lNm5yldw"}' \
    > test.out 2>&1
eval_tap $? 32 'AdminUpdateTag' test.out

#- 33 AdminDeleteTag
./ng net.accelbyte.sdk.cli.Main ugc adminDeleteTag \
    --namespace "$AB_NAMESPACE" \
    --tagId '5fvzx5B4' \
    > test.out 2>&1
eval_tap $? 33 'AdminDeleteTag' test.out

#- 34 AdminGetType
./ng net.accelbyte.sdk.cli.Main ugc adminGetType \
    --namespace "$AB_NAMESPACE" \
    --limit '45' \
    --offset '41' \
    > test.out 2>&1
eval_tap $? 34 'AdminGetType' test.out

#- 35 AdminCreateType
./ng net.accelbyte.sdk.cli.Main ugc adminCreateType \
    --namespace "$AB_NAMESPACE" \
    --body '{"subtype": ["Ny6gc9TF", "rtKKphvV", "5JxO6uUc"], "type": "8cFiXSn0"}' \
    > test.out 2>&1
eval_tap $? 35 'AdminCreateType' test.out

#- 36 AdminUpdateType
./ng net.accelbyte.sdk.cli.Main ugc adminUpdateType \
    --namespace "$AB_NAMESPACE" \
    --typeId 'kHcMPEix' \
    --body '{"subtype": ["q2NRBrep", "cAkbo1dF", "ozoFoWP0"], "type": "PmZRURkv"}' \
    > test.out 2>&1
eval_tap $? 36 'AdminUpdateType' test.out

#- 37 AdminDeleteType
./ng net.accelbyte.sdk.cli.Main ugc adminDeleteType \
    --namespace "$AB_NAMESPACE" \
    --typeId '01burX08' \
    > test.out 2>&1
eval_tap $? 37 'AdminDeleteType' test.out

#- 38 AdminGetChannel
./ng net.accelbyte.sdk.cli.Main ugc adminGetChannel \
    --namespace "$AB_NAMESPACE" \
    --userId 'gHekiJTN' \
    --limit '46' \
    --name 'AT587X7r' \
    --offset '46' \
    > test.out 2>&1
eval_tap $? 38 'AdminGetChannel' test.out

#- 39 AdminDeleteAllUserChannels
./ng net.accelbyte.sdk.cli.Main ugc adminDeleteAllUserChannels \
    --namespace "$AB_NAMESPACE" \
    --userId 'HjPuNZwL' \
    > test.out 2>&1
eval_tap $? 39 'AdminDeleteAllUserChannels' test.out

#- 40 AdminUpdateChannel
./ng net.accelbyte.sdk.cli.Main ugc adminUpdateChannel \
    --channelId 'pSuacSFi' \
    --namespace "$AB_NAMESPACE" \
    --userId 'fGREMu9Z' \
    --body '{"name": "OIrx5qtE"}' \
    > test.out 2>&1
eval_tap $? 40 'AdminUpdateChannel' test.out

#- 41 AdminDeleteChannel
./ng net.accelbyte.sdk.cli.Main ugc adminDeleteChannel \
    --channelId 'SlpGD5Y5' \
    --namespace "$AB_NAMESPACE" \
    --userId 'z19kc0DO' \
    > test.out 2>&1
eval_tap $? 41 'AdminDeleteChannel' test.out

#- 42 AdminUpdateContentS3ByShareCode
./ng net.accelbyte.sdk.cli.Main ugc adminUpdateContentS3ByShareCode \
    --channelId 'IWCjZlMp' \
    --namespace "$AB_NAMESPACE" \
    --shareCode 'ojDMpFwB' \
    --userId 'AGiDJ3u2' \
    --body '{"contentType": "MkHAT45l", "customAttributes": {"IswBm9yI": {}, "3zxQPNPr": {}, "KN6bLGyN": {}}, "fileExtension": "Y2AbWQbC", "name": "OBq8HawJ", "payload": "vX3FOWJF", "preview": "Dvo88GBB", "previewMetadata": {"previewContentType": "JS0JnTqY", "previewFileExtension": "wxYy2G8q"}, "shareCode": "IPC5zwvr", "subType": "Eb2kTvlp", "tags": ["QzjBAst2", "dYMvI80I", "XQLwTgVm"], "type": "kJBE0Pc4", "updateContentFile": false}' \
    > test.out 2>&1
eval_tap $? 42 'AdminUpdateContentS3ByShareCode' test.out

#- 43 AdminUpdateContentS3
./ng net.accelbyte.sdk.cli.Main ugc adminUpdateContentS3 \
    --channelId 'y3HYL0Fd' \
    --contentId 'ysaAhyYe' \
    --namespace "$AB_NAMESPACE" \
    --userId 'AUOyzrOl' \
    --body '{"contentType": "PS5izpMy", "customAttributes": {"r6SR7S0p": {}, "Z5DnrfvH": {}, "KyuO1npb": {}}, "fileExtension": "7QdSUzIE", "name": "Bxyvw7Fv", "payload": "PTfGkB9y", "preview": "1IL8ZtJp", "previewMetadata": {"previewContentType": "B2PqduN1", "previewFileExtension": "2xXl85GZ"}, "shareCode": "ji85KQA6", "subType": "4PeHH9ys", "tags": ["QoXoq2JQ", "vdka1heD", "i8boy1cq"], "type": "qXLQdntJ", "updateContentFile": true}' \
    > test.out 2>&1
eval_tap $? 43 'AdminUpdateContentS3' test.out

#- 44 DeleteContentByShareCode
./ng net.accelbyte.sdk.cli.Main ugc deleteContentByShareCode \
    --channelId '8AkdFiss' \
    --namespace "$AB_NAMESPACE" \
    --shareCode 'jgkblcJn' \
    --userId 'wsixGruK' \
    > test.out 2>&1
eval_tap $? 44 'DeleteContentByShareCode' test.out

#- 45 AdminUpdateContentDirect
eval_tap 0 45 'AdminUpdateContentDirect # SKIP deprecated' test.out

#- 46 AdminDeleteContent
./ng net.accelbyte.sdk.cli.Main ugc adminDeleteContent \
    --channelId 'wC9yf5KR' \
    --contentId 'jzFJO49E' \
    --namespace "$AB_NAMESPACE" \
    --userId 'tFiVHce4' \
    > test.out 2>&1
eval_tap $? 46 'AdminDeleteContent' test.out

#- 47 AdminGetContent
./ng net.accelbyte.sdk.cli.Main ugc adminGetContent \
    --namespace "$AB_NAMESPACE" \
    --userId 'MvWwbaAQ' \
    --limit '5' \
    --offset '71' \
    > test.out 2>&1
eval_tap $? 47 'AdminGetContent' test.out

#- 48 AdminDeleteAllUserContents
./ng net.accelbyte.sdk.cli.Main ugc adminDeleteAllUserContents \
    --namespace "$AB_NAMESPACE" \
    --userId 'qPTNeqCY' \
    > test.out 2>&1
eval_tap $? 48 'AdminDeleteAllUserContents' test.out

#- 49 AdminHideUserContent
./ng net.accelbyte.sdk.cli.Main ugc adminHideUserContent \
    --contentId 'xYijF4Aw' \
    --namespace "$AB_NAMESPACE" \
    --userId 'LMPnpXse' \
    --body '{"isHidden": true}' \
    > test.out 2>&1
eval_tap $? 49 'AdminHideUserContent' test.out

#- 50 AdminGetAllGroups
./ng net.accelbyte.sdk.cli.Main ugc adminGetAllGroups \
    --namespace "$AB_NAMESPACE" \
    --userId 'KXk4DEj4' \
    --limit '72' \
    --offset '44' \
    > test.out 2>&1
eval_tap $? 50 'AdminGetAllGroups' test.out

#- 51 AdminDeleteAllUserGroup
./ng net.accelbyte.sdk.cli.Main ugc adminDeleteAllUserGroup \
    --namespace "$AB_NAMESPACE" \
    --userId 'D2i21HKW' \
    > test.out 2>&1
eval_tap $? 51 'AdminDeleteAllUserGroup' test.out

#- 52 AdminGetGroup
./ng net.accelbyte.sdk.cli.Main ugc adminGetGroup \
    --groupId 'zJ9NzGcI' \
    --namespace "$AB_NAMESPACE" \
    --userId 'C0SdfqTy' \
    > test.out 2>&1
eval_tap $? 52 'AdminGetGroup' test.out

#- 53 AdminUpdateGroup
./ng net.accelbyte.sdk.cli.Main ugc adminUpdateGroup \
    --groupId '9uDp1ZJu' \
    --namespace "$AB_NAMESPACE" \
    --userId 'wcelfI5u' \
    --body '{"contents": ["4eUwW7Xd", "Nd8E81DT", "21yRFj0q"], "name": "itONIVKJ"}' \
    > test.out 2>&1
eval_tap $? 53 'AdminUpdateGroup' test.out

#- 54 AdminDeleteGroup
./ng net.accelbyte.sdk.cli.Main ugc adminDeleteGroup \
    --groupId 'agwE5Soy' \
    --namespace "$AB_NAMESPACE" \
    --userId 'VIynn2nt' \
    > test.out 2>&1
eval_tap $? 54 'AdminDeleteGroup' test.out

#- 55 AdminGetGroupContents
./ng net.accelbyte.sdk.cli.Main ugc adminGetGroupContents \
    --groupId 'w6mQn2vq' \
    --namespace "$AB_NAMESPACE" \
    --userId '2am4UmE1' \
    --limit '74' \
    --offset '51' \
    > test.out 2>&1
eval_tap $? 55 'AdminGetGroupContents' test.out

#- 56 AdminDeleteAllUserStates
./ng net.accelbyte.sdk.cli.Main ugc adminDeleteAllUserStates \
    --namespace "$AB_NAMESPACE" \
    --userId 'MiEVvwvs' \
    > test.out 2>&1
eval_tap $? 56 'AdminDeleteAllUserStates' test.out

#- 57 SearchChannelSpecificContent
./ng net.accelbyte.sdk.cli.Main ugc searchChannelSpecificContent \
    --channelId 'M6uC9kyj' \
    --namespace "$AB_NAMESPACE" \
    --creator '2ZcmC1Tr' \
    --ishidden 'vfx5BaA9' \
    --isofficial 'ONdckcph' \
    --limit '43' \
    --name 'uFLyhnga' \
    --offset '35' \
    --orderby '7zyZ3H7E' \
    --sortby 'gmlO6gbA' \
    --subtype 'W46tC3CJ' \
    --tags 'owE4nPLH,H0jcNkRr,YeH8KT61' \
    --type 'C1sm30Wq' \
    --userId 'p2dIvh6p' \
    > test.out 2>&1
eval_tap $? 57 'SearchChannelSpecificContent' test.out

#- 58 PublicSearchContent
./ng net.accelbyte.sdk.cli.Main ugc publicSearchContent \
    --namespace "$AB_NAMESPACE" \
    --creator '6cEZHJ3M' \
    --ishidden 'mdB1IKYL' \
    --isofficial 'X8HLtMPR' \
    --limit '80' \
    --name 'FZMjpF7C' \
    --offset '9' \
    --orderby 'cvu83y4p' \
    --sortby 'dzPsMw97' \
    --subtype 'moGMOFK2' \
    --tags 'G0D74Csc,dSF5rF4F,op6V8sYo' \
    --type 'yphXgGiU' \
    --userId 'NBRM7pTK' \
    > test.out 2>&1
eval_tap $? 58 'PublicSearchContent' test.out

#- 59 PublicGetContentBulk
./ng net.accelbyte.sdk.cli.Main ugc publicGetContentBulk \
    --namespace "$AB_NAMESPACE" \
    --body '{"contentIds": ["X8EexhXW", "TTHdpWS1", "NZyfU9kT"]}' \
    > test.out 2>&1
eval_tap $? 59 'PublicGetContentBulk' test.out

#- 60 GetFollowedContent
./ng net.accelbyte.sdk.cli.Main ugc getFollowedContent \
    --namespace "$AB_NAMESPACE" \
    --limit '34' \
    --offset '74' \
    > test.out 2>&1
eval_tap $? 60 'GetFollowedContent' test.out

#- 61 GetLikedContent
./ng net.accelbyte.sdk.cli.Main ugc getLikedContent \
    --namespace "$AB_NAMESPACE" \
    --isofficial  \
    --limit '79' \
    --name 'RSInZXpe' \
    --offset '91' \
    --orderby 'pMgKYdB9' \
    --sortby 'LwbA5JAd' \
    --subtype 'Vw8Vr3YP' \
    --tags 'SSD75Zsg,WYo9iF9F,h8QUsnrw' \
    --type 'rLnq7f47' \
    > test.out 2>&1
eval_tap $? 61 'GetLikedContent' test.out

#- 62 PublicGetContentBulkByShareCodes
./ng net.accelbyte.sdk.cli.Main ugc publicGetContentBulkByShareCodes \
    --namespace "$AB_NAMESPACE" \
    --body '{"shareCodes": ["5JSBNjbL", "e4wCrEnr", "Obh3rMyp"]}' \
    > test.out 2>&1
eval_tap $? 62 'PublicGetContentBulkByShareCodes' test.out

#- 63 PublicDownloadContentByShareCode
./ng net.accelbyte.sdk.cli.Main ugc publicDownloadContentByShareCode \
    --namespace "$AB_NAMESPACE" \
    --shareCode 'DybF9iRd' \
    > test.out 2>&1
eval_tap $? 63 'PublicDownloadContentByShareCode' test.out

#- 64 PublicDownloadContentByContentID
./ng net.accelbyte.sdk.cli.Main ugc publicDownloadContentByContentID \
    --contentId '1KIlSJnV' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 64 'PublicDownloadContentByContentID' test.out

#- 65 AddDownloadCount
./ng net.accelbyte.sdk.cli.Main ugc addDownloadCount \
    --contentId 'uj4MEy1B' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 65 'AddDownloadCount' test.out

#- 66 UpdateContentLikeStatus
./ng net.accelbyte.sdk.cli.Main ugc updateContentLikeStatus \
    --contentId 'hAJRHy7O' \
    --namespace "$AB_NAMESPACE" \
    --body '{"likeStatus": false}' \
    > test.out 2>&1
eval_tap $? 66 'UpdateContentLikeStatus' test.out

#- 67 PublicDownloadContentPreview
./ng net.accelbyte.sdk.cli.Main ugc publicDownloadContentPreview \
    --contentId 'p925fstB' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 67 'PublicDownloadContentPreview' test.out

#- 68 GetTag
./ng net.accelbyte.sdk.cli.Main ugc getTag \
    --namespace "$AB_NAMESPACE" \
    --limit '22' \
    --offset '43' \
    > test.out 2>&1
eval_tap $? 68 'GetTag' test.out

#- 69 GetType
./ng net.accelbyte.sdk.cli.Main ugc getType \
    --namespace "$AB_NAMESPACE" \
    --limit '20' \
    --offset '91' \
    > test.out 2>&1
eval_tap $? 69 'GetType' test.out

#- 70 PublicSearchCreator
./ng net.accelbyte.sdk.cli.Main ugc publicSearchCreator \
    --namespace "$AB_NAMESPACE" \
    --limit '69' \
    --offset '88' \
    --orderby 'h7jViZwq' \
    --sortby '8Iq14Hpu' \
    > test.out 2>&1
eval_tap $? 70 'PublicSearchCreator' test.out

#- 71 GetFollowedUsers
./ng net.accelbyte.sdk.cli.Main ugc getFollowedUsers \
    --namespace "$AB_NAMESPACE" \
    --limit '48' \
    --offset '41' \
    > test.out 2>&1
eval_tap $? 71 'GetFollowedUsers' test.out

#- 72 PublicGetCreator
./ng net.accelbyte.sdk.cli.Main ugc publicGetCreator \
    --namespace "$AB_NAMESPACE" \
    --userId 'EY3Z5kd5' \
    > test.out 2>&1
eval_tap $? 72 'PublicGetCreator' test.out

#- 73 GetChannels
./ng net.accelbyte.sdk.cli.Main ugc getChannels \
    --namespace "$AB_NAMESPACE" \
    --userId 'k9HqNUvD' \
    --limit '72' \
    --name 'iMiV3fe7' \
    --offset '85' \
    > test.out 2>&1
eval_tap $? 73 'GetChannels' test.out

#- 74 PublicCreateChannel
./ng net.accelbyte.sdk.cli.Main ugc publicCreateChannel \
    --namespace "$AB_NAMESPACE" \
    --userId 'UKMMnXxa' \
    --body '{"name": "PPLJBTCb"}' \
    > test.out 2>&1
eval_tap $? 74 'PublicCreateChannel' test.out

#- 75 DeleteAllUserChannel
./ng net.accelbyte.sdk.cli.Main ugc deleteAllUserChannel \
    --namespace "$AB_NAMESPACE" \
    --userId '8xmYzGjP' \
    > test.out 2>&1
eval_tap $? 75 'DeleteAllUserChannel' test.out

#- 76 UpdateChannel
./ng net.accelbyte.sdk.cli.Main ugc updateChannel \
    --channelId 'hKD2CJju' \
    --namespace "$AB_NAMESPACE" \
    --userId 'ycogoEBg' \
    --body '{"name": "v0zG35qv"}' \
    > test.out 2>&1
eval_tap $? 76 'UpdateChannel' test.out

#- 77 DeleteChannel
./ng net.accelbyte.sdk.cli.Main ugc deleteChannel \
    --channelId 'AXoaP1dG' \
    --namespace "$AB_NAMESPACE" \
    --userId 'DFkmQXIl' \
    > test.out 2>&1
eval_tap $? 77 'DeleteChannel' test.out

#- 78 CreateContentDirect
eval_tap 0 78 'CreateContentDirect # SKIP deprecated' test.out

#- 79 CreateContentS3
./ng net.accelbyte.sdk.cli.Main ugc createContentS3 \
    --channelId '1b6jtiBl' \
    --namespace "$AB_NAMESPACE" \
    --userId 'msNn7JpQ' \
    --body '{"contentType": "Nxm9jyG3", "customAttributes": {"ZI0N7a0V": {}, "d2XhoZXv": {}, "nBfSoLLd": {}}, "fileExtension": "pz7xK4Ai", "name": "SmeAnHeV", "preview": "qRnLz8Ki", "previewMetadata": {"previewContentType": "ibjLip1h", "previewFileExtension": "O72d9r15"}, "subType": "5hLKBJVr", "tags": ["jBzOT4CI", "xjiCTkqB", "O6neUAeV"], "type": "a0qO5sK9"}' \
    > test.out 2>&1
eval_tap $? 79 'CreateContentS3' test.out

#- 80 PublicUpdateContentByShareCode
./ng net.accelbyte.sdk.cli.Main ugc publicUpdateContentByShareCode \
    --channelId 'wx3EdeRx' \
    --namespace "$AB_NAMESPACE" \
    --shareCode 'DIWkHmd9' \
    --userId 'KT0UTuWr' \
    --body '{"contentType": "bUquYZvA", "customAttributes": {"bnPbc96B": {}, "UZgc5oA2": {}, "k9QB7ajo": {}}, "fileExtension": "bJOTNqgs", "name": "eWLowX21", "payload": "te2nC2Pj", "preview": "6UIp4gf9", "previewMetadata": {"previewContentType": "L1xXYzf5", "previewFileExtension": "OFZWpu23"}, "subType": "oZnHRF9I", "tags": ["W6379kai", "nsYKpvAQ", "CXECvkpr"], "type": "nUi9yFuk", "updateContentFile": true}' \
    > test.out 2>&1
eval_tap $? 80 'PublicUpdateContentByShareCode' test.out

#- 81 UpdateContentS3
./ng net.accelbyte.sdk.cli.Main ugc updateContentS3 \
    --channelId 'jBtJeqyz' \
    --contentId 'rXZ9rSfr' \
    --namespace "$AB_NAMESPACE" \
    --userId 'hxAaC8Fq' \
    --body '{"contentType": "2iHC57zu", "customAttributes": {"FlxsgyGB": {}, "g2VLzdtg": {}, "MyOTp5dx": {}}, "fileExtension": "i6XE2sfK", "name": "nJzUpuuZ", "payload": "5GDDeDDg", "preview": "CnjLxy0R", "previewMetadata": {"previewContentType": "11q6YZh1", "previewFileExtension": "t1S4Oj7T"}, "subType": "zElhnHWT", "tags": ["gRb8SIoD", "m724WGvi", "ZVk29Gfw"], "type": "RxKFgz5r", "updateContentFile": true}' \
    > test.out 2>&1
eval_tap $? 81 'UpdateContentS3' test.out

#- 82 PublicDeleteContentByShareCode
./ng net.accelbyte.sdk.cli.Main ugc publicDeleteContentByShareCode \
    --channelId 'lfw889Kl' \
    --namespace "$AB_NAMESPACE" \
    --shareCode '14cOYrb9' \
    --userId 'CQtzILhJ' \
    > test.out 2>&1
eval_tap $? 82 'PublicDeleteContentByShareCode' test.out

#- 83 UpdateContentDirect
eval_tap 0 83 'UpdateContentDirect # SKIP deprecated' test.out

#- 84 DeleteContent
./ng net.accelbyte.sdk.cli.Main ugc deleteContent \
    --channelId '9jyYh8hP' \
    --contentId 'klU7qTXf' \
    --namespace "$AB_NAMESPACE" \
    --userId 'Un0q4KJA' \
    > test.out 2>&1
eval_tap $? 84 'DeleteContent' test.out

#- 85 UpdateContentShareCode
./ng net.accelbyte.sdk.cli.Main ugc updateContentShareCode \
    --channelId 'v4HTkDgx' \
    --contentId 'Hus0PSpK' \
    --namespace "$AB_NAMESPACE" \
    --userId 'SNJHWA2v' \
    --body '{"shareCode": "mex2iCYt"}' \
    > test.out 2>&1
eval_tap $? 85 'UpdateContentShareCode' test.out

#- 86 PublicGetUserContent
./ng net.accelbyte.sdk.cli.Main ugc publicGetUserContent \
    --namespace "$AB_NAMESPACE" \
    --userId 'kMttSOYt' \
    --limit '20' \
    --offset '87' \
    > test.out 2>&1
eval_tap $? 86 'PublicGetUserContent' test.out

#- 87 DeleteAllUserContents
./ng net.accelbyte.sdk.cli.Main ugc deleteAllUserContents \
    --namespace "$AB_NAMESPACE" \
    --userId 'Z4i8b1Cj' \
    > test.out 2>&1
eval_tap $? 87 'DeleteAllUserContents' test.out

#- 88 UpdateScreenshots
./ng net.accelbyte.sdk.cli.Main ugc updateScreenshots \
    --contentId 'e0mUmfct' \
    --namespace "$AB_NAMESPACE" \
    --userId 'WdOSdch2' \
    --body '{"screenshots": [{"description": "bg3xCs48", "screenshotId": "uOUWVatI"}, {"description": "NRAvF1J0", "screenshotId": "BWLTPuEA"}, {"description": "QafYqEkn", "screenshotId": "VHXUuGwa"}]}' \
    > test.out 2>&1
eval_tap $? 88 'UpdateScreenshots' test.out

#- 89 UploadContentScreenshot
./ng net.accelbyte.sdk.cli.Main ugc uploadContentScreenshot \
    --contentId 'HfzzVbCG' \
    --namespace "$AB_NAMESPACE" \
    --userId 'zGndd8jY' \
    --body '{"screenshots": [{"contentType": "emQWfB1H", "description": "RgydhXkG", "fileExtension": "png"}, {"contentType": "4ek0WvUP", "description": "9vmpsEwS", "fileExtension": "jpeg"}, {"contentType": "23g2cdht", "description": "qaCGSBd8", "fileExtension": "jpg"}]}' \
    > test.out 2>&1
eval_tap $? 89 'UploadContentScreenshot' test.out

#- 90 DeleteContentScreenshot
./ng net.accelbyte.sdk.cli.Main ugc deleteContentScreenshot \
    --contentId 'MtpEtcHn' \
    --namespace "$AB_NAMESPACE" \
    --screenshotId 'p6c9oar5' \
    --userId '9tIrJkwP' \
    > test.out 2>&1
eval_tap $? 90 'DeleteContentScreenshot' test.out

#- 91 UpdateUserFollowStatus
./ng net.accelbyte.sdk.cli.Main ugc updateUserFollowStatus \
    --namespace "$AB_NAMESPACE" \
    --userId 'vZH24uGs' \
    --body '{"followStatus": true}' \
    > test.out 2>&1
eval_tap $? 91 'UpdateUserFollowStatus' test.out

#- 92 GetPublicFollowers
./ng net.accelbyte.sdk.cli.Main ugc getPublicFollowers \
    --namespace "$AB_NAMESPACE" \
    --userId 'F754tpsM' \
    --limit '20' \
    --offset '50' \
    > test.out 2>&1
eval_tap $? 92 'GetPublicFollowers' test.out

#- 93 GetPublicFollowing
./ng net.accelbyte.sdk.cli.Main ugc getPublicFollowing \
    --namespace "$AB_NAMESPACE" \
    --userId 'kGrOCpMe' \
    --limit '34' \
    --offset '20' \
    > test.out 2>&1
eval_tap $? 93 'GetPublicFollowing' test.out

#- 94 GetGroups
./ng net.accelbyte.sdk.cli.Main ugc getGroups \
    --namespace "$AB_NAMESPACE" \
    --userId 'aeInfi4J' \
    --limit '63' \
    --offset '55' \
    > test.out 2>&1
eval_tap $? 94 'GetGroups' test.out

#- 95 CreateGroup
./ng net.accelbyte.sdk.cli.Main ugc createGroup \
    --namespace "$AB_NAMESPACE" \
    --userId 'u6mWONDD' \
    --body '{"contents": ["945ySpNB", "ivF7tckc", "cJSi0xuk"], "name": "QNnmYWBR"}' \
    > test.out 2>&1
eval_tap $? 95 'CreateGroup' test.out

#- 96 DeleteAllUserGroup
./ng net.accelbyte.sdk.cli.Main ugc deleteAllUserGroup \
    --namespace "$AB_NAMESPACE" \
    --userId 'czS2PmgM' \
    > test.out 2>&1
eval_tap $? 96 'DeleteAllUserGroup' test.out

#- 97 GetGroup
./ng net.accelbyte.sdk.cli.Main ugc getGroup \
    --groupId 'yfDecrvj' \
    --namespace "$AB_NAMESPACE" \
    --userId '3ygOXRB9' \
    > test.out 2>&1
eval_tap $? 97 'GetGroup' test.out

#- 98 UpdateGroup
./ng net.accelbyte.sdk.cli.Main ugc updateGroup \
    --groupId 'qGlp78B5' \
    --namespace "$AB_NAMESPACE" \
    --userId 'nnxV2lMZ' \
    --body '{"contents": ["psHLZdJJ", "BeZF1t1M", "B55cOZxH"], "name": "p3HWVMdD"}' \
    > test.out 2>&1
eval_tap $? 98 'UpdateGroup' test.out

#- 99 DeleteGroup
./ng net.accelbyte.sdk.cli.Main ugc deleteGroup \
    --groupId 'pxoyz5eQ' \
    --namespace "$AB_NAMESPACE" \
    --userId 'mDIJ3gcf' \
    > test.out 2>&1
eval_tap $? 99 'DeleteGroup' test.out

#- 100 GetGroupContent
./ng net.accelbyte.sdk.cli.Main ugc getGroupContent \
    --groupId 'uXqYvhl8' \
    --namespace "$AB_NAMESPACE" \
    --userId 'BGoXB8gf' \
    --limit '1' \
    --offset '85' \
    > test.out 2>&1
eval_tap $? 100 'GetGroupContent' test.out

#- 101 DeleteAllUserStates
./ng net.accelbyte.sdk.cli.Main ugc deleteAllUserStates \
    --namespace "$AB_NAMESPACE" \
    --userId 'gLT2yZEO' \
    > test.out 2>&1
eval_tap $? 101 'DeleteAllUserStates' test.out

#- 102 AdminGetContentByChannelIDV2
./ng net.accelbyte.sdk.cli.Main ugc adminGetContentByChannelIDV2 \
    --channelId 'RCzjMUcP' \
    --namespace "$AB_NAMESPACE" \
    --limit '38' \
    --name 'wHV6nIdS' \
    --offset '5' \
    --sortBy '8JEr5Gvh' \
    > test.out 2>&1
eval_tap $? 102 'AdminGetContentByChannelIDV2' test.out

#- 103 AdminCreateContentV2
./ng net.accelbyte.sdk.cli.Main ugc adminCreateContentV2 \
    --channelId 'gOcYBSpU' \
    --namespace "$AB_NAMESPACE" \
    --body '{"contentType": "vR0b7gDw", "customAttributes": {"F7vPuXcI": {}, "nAmVKaq5": {}, "QGagGj9e": {}}, "fileExtension": "z4xUH3Q3", "name": "aXCvcTuY", "shareCode": "DZFEJfHd", "subType": "5wXvbZ35", "tags": ["lGH4Y0E1", "Fi8BFDjg", "IaTMgeWg"], "type": "e0GAnv9v"}' \
    > test.out 2>&1
eval_tap $? 103 'AdminCreateContentV2' test.out

#- 104 AdminDeleteOfficialContentV2
./ng net.accelbyte.sdk.cli.Main ugc adminDeleteOfficialContentV2 \
    --channelId 'G32zd1QQ' \
    --contentId '8Obncu1o' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 104 'AdminDeleteOfficialContentV2' test.out

#- 105 AdminUpdateOfficialContentV2
./ng net.accelbyte.sdk.cli.Main ugc adminUpdateOfficialContentV2 \
    --channelId 'MzbIfbd3' \
    --contentId 'ptLucUQE' \
    --namespace "$AB_NAMESPACE" \
    --body '{"customAttributes": {"1ofHF1gk": {}, "QhyX5CSa": {}, "xmTpyqFj": {}}, "name": "Gtp7LCVn", "shareCode": "zc5P86lF", "subType": "IlA4Kyjk", "tags": ["MWdpCt4y", "AqgbpGhe", "05PF7Chn"], "type": "jBnamC7p"}' \
    > test.out 2>&1
eval_tap $? 105 'AdminUpdateOfficialContentV2' test.out

#- 106 AdminCopyContent
./ng net.accelbyte.sdk.cli.Main ugc adminCopyContent \
    --channelId 'quoizYTr' \
    --contentId '8Q0PsVGz' \
    --namespace "$AB_NAMESPACE" \
    --body '{"customAttributes": {"yV2ofyRI": {}, "mdt6zwKT": {}, "4oesHDQP": {}}, "name": "11I4NqQF", "subType": "Ks73ZVkF", "tags": ["hagOvGTj", "b6elF9Oc", "I39lmTRj"], "targetChannelId": "hj1CCXVq", "type": "rKmL38Y2"}' \
    > test.out 2>&1
eval_tap $? 106 'AdminCopyContent' test.out

#- 107 AdminUpdateOfficialContentFileLocation
./ng net.accelbyte.sdk.cli.Main ugc adminUpdateOfficialContentFileLocation \
    --channelId 'uJM7qwr3' \
    --contentId 'LT8pcqtM' \
    --namespace "$AB_NAMESPACE" \
    --body '{"fileExtension": "hB3jA1kl", "fileLocation": "qeqPpYFV"}' \
    > test.out 2>&1
eval_tap $? 107 'AdminUpdateOfficialContentFileLocation' test.out

#- 108 AdminGenerateOfficialContentUploadURLV2
./ng net.accelbyte.sdk.cli.Main ugc adminGenerateOfficialContentUploadURLV2 \
    --channelId '0hgIJJz0' \
    --contentId 'coAo90qm' \
    --namespace "$AB_NAMESPACE" \
    --body '{"contentType": "f5orbXLv", "fileExtension": "zhzi7vNH"}' \
    > test.out 2>&1
eval_tap $? 108 'AdminGenerateOfficialContentUploadURLV2' test.out

#- 109 AdminGetConfigs
./ng net.accelbyte.sdk.cli.Main ugc adminGetConfigs \
    --namespace "$AB_NAMESPACE" \
    --limit '96' \
    --offset '65' \
    > test.out 2>&1
eval_tap $? 109 'AdminGetConfigs' test.out

#- 110 AdminUpdateConfig
./ng net.accelbyte.sdk.cli.Main ugc adminUpdateConfig \
    --key 'u6WYkgwx' \
    --namespace "$AB_NAMESPACE" \
    --body '{"value": "3pkMrXKt"}' \
    > test.out 2>&1
eval_tap $? 110 'AdminUpdateConfig' test.out

#- 111 AdminListContentV2
./ng net.accelbyte.sdk.cli.Main ugc adminListContentV2 \
    --namespace "$AB_NAMESPACE" \
    --isOfficial  \
    --limit '84' \
    --name 'DSb7C9iQ' \
    --offset '58' \
    --sortBy '5glOSSm3' \
    --subType 'yuSIbbUo' \
    --tags '3LMUL9du,FBDYl2lI,phAxDCq3' \
    --type '9hnVuM8W' \
    > test.out 2>&1
eval_tap $? 111 'AdminListContentV2' test.out

#- 112 AdminBulkGetContentByIDsV2
./ng net.accelbyte.sdk.cli.Main ugc adminBulkGetContentByIDsV2 \
    --namespace "$AB_NAMESPACE" \
    --body '{"contentIds": ["SRMPExwU", "4E8Rknn8", "M07wKUM0"]}' \
    > test.out 2>&1
eval_tap $? 112 'AdminBulkGetContentByIDsV2' test.out

#- 113 AdminGetContentBulkByShareCodesV2
./ng net.accelbyte.sdk.cli.Main ugc adminGetContentBulkByShareCodesV2 \
    --namespace "$AB_NAMESPACE" \
    --body '{"shareCodes": ["A0TXNNAc", "jY1LuwoV", "XgryGkX4"]}' \
    > test.out 2>&1
eval_tap $? 113 'AdminGetContentBulkByShareCodesV2' test.out

#- 114 AdminGetContentByShareCodeV2
./ng net.accelbyte.sdk.cli.Main ugc adminGetContentByShareCodeV2 \
    --namespace "$AB_NAMESPACE" \
    --shareCode 'RkB4rOVZ' \
    > test.out 2>&1
eval_tap $? 114 'AdminGetContentByShareCodeV2' test.out

#- 115 AdminGetContentByContentIDV2
./ng net.accelbyte.sdk.cli.Main ugc adminGetContentByContentIDV2 \
    --contentId 'zzW1pB3y' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 115 'AdminGetContentByContentIDV2' test.out

#- 116 RollbackContentVersionV2
./ng net.accelbyte.sdk.cli.Main ugc rollbackContentVersionV2 \
    --contentId 'HUHOe0xe' \
    --namespace "$AB_NAMESPACE" \
    --versionId 'GMLn0flF' \
    > test.out 2>&1
eval_tap $? 116 'RollbackContentVersionV2' test.out

#- 117 AdminUpdateScreenshotsV2
./ng net.accelbyte.sdk.cli.Main ugc adminUpdateScreenshotsV2 \
    --contentId 'aVrXhrzd' \
    --namespace "$AB_NAMESPACE" \
    --body '{"screenshots": [{"description": "gLjkjFq9", "screenshotId": "MZ0bQVOC"}, {"description": "X1Odokut", "screenshotId": "61wjbckz"}, {"description": "hNtBBBaL", "screenshotId": "goVClHMD"}]}' \
    > test.out 2>&1
eval_tap $? 117 'AdminUpdateScreenshotsV2' test.out

#- 118 AdminUploadContentScreenshotV2
./ng net.accelbyte.sdk.cli.Main ugc adminUploadContentScreenshotV2 \
    --contentId '8M6UXuBX' \
    --namespace "$AB_NAMESPACE" \
    --body '{"screenshots": [{"contentType": "fb4UTaZQ", "description": "YbGpK9Mh", "fileExtension": "jfif"}, {"contentType": "Hr7l8Oef", "description": "L9ilaW6e", "fileExtension": "jpeg"}, {"contentType": "Zb4aMD2v", "description": "eYK4v8Y3", "fileExtension": "png"}]}' \
    > test.out 2>&1
eval_tap $? 118 'AdminUploadContentScreenshotV2' test.out

#- 119 AdminDeleteContentScreenshotV2
./ng net.accelbyte.sdk.cli.Main ugc adminDeleteContentScreenshotV2 \
    --contentId 'pJuaMMf2' \
    --namespace "$AB_NAMESPACE" \
    --screenshotId 'it0MutXG' \
    > test.out 2>&1
eval_tap $? 119 'AdminDeleteContentScreenshotV2' test.out

#- 120 ListContentVersionsV2
./ng net.accelbyte.sdk.cli.Main ugc listContentVersionsV2 \
    --contentId 'CmOdmqHi' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 120 'ListContentVersionsV2' test.out

#- 121 AdminGetOfficialGroupContentsV2
./ng net.accelbyte.sdk.cli.Main ugc adminGetOfficialGroupContentsV2 \
    --groupId 'TUKtCC9u' \
    --namespace "$AB_NAMESPACE" \
    --limit '48' \
    --offset '81' \
    > test.out 2>&1
eval_tap $? 121 'AdminGetOfficialGroupContentsV2' test.out

#- 122 AdminListStagingContents
./ng net.accelbyte.sdk.cli.Main ugc adminListStagingContents \
    --namespace "$AB_NAMESPACE" \
    --limit '16' \
    --offset '91' \
    --sortBy 'jJv0SItg' \
    --status 'p5WwIaRn' \
    > test.out 2>&1
eval_tap $? 122 'AdminListStagingContents' test.out

#- 123 AdminGetStagingContentByID
./ng net.accelbyte.sdk.cli.Main ugc adminGetStagingContentByID \
    --contentId 'SCmEXvm7' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 123 'AdminGetStagingContentByID' test.out

#- 124 AdminApproveStagingContent
./ng net.accelbyte.sdk.cli.Main ugc adminApproveStagingContent \
    --contentId '8BWq8Uxk' \
    --namespace "$AB_NAMESPACE" \
    --body '{"approved": false, "note": "gVsVZC8Q"}' \
    > test.out 2>&1
eval_tap $? 124 'AdminApproveStagingContent' test.out

#- 125 AdminUpdateContentByShareCodeV2
./ng net.accelbyte.sdk.cli.Main ugc adminUpdateContentByShareCodeV2 \
    --channelId '9Knc7TLw' \
    --namespace "$AB_NAMESPACE" \
    --shareCode 'jj60WJ0w' \
    --userId 'XT2gMpHT' \
    --body '{"customAttributes": {"fhdlVp1k": {}, "mC9ELRHn": {}, "QLcqgetv": {}}, "name": "npioIZfN", "shareCode": "oajAlOMb", "subType": "VFVt1c9i", "tags": ["1np8ViHR", "WlWcdnbP", "aoeUdrfW"], "type": "D6ZnFRk1"}' \
    > test.out 2>&1
eval_tap $? 125 'AdminUpdateContentByShareCodeV2' test.out

#- 126 AdminDeleteContentByShareCodeV2
./ng net.accelbyte.sdk.cli.Main ugc adminDeleteContentByShareCodeV2 \
    --channelId 'bM3kJOQB' \
    --namespace "$AB_NAMESPACE" \
    --shareCode 'qMnWsLmQ' \
    --userId '6IOt4htP' \
    > test.out 2>&1
eval_tap $? 126 'AdminDeleteContentByShareCodeV2' test.out

#- 127 AdminDeleteUserContentV2
./ng net.accelbyte.sdk.cli.Main ugc adminDeleteUserContentV2 \
    --channelId 'Ou6M7ng5' \
    --contentId 'sESrwjXT' \
    --namespace "$AB_NAMESPACE" \
    --userId 'B7LDhbSD' \
    > test.out 2>&1
eval_tap $? 127 'AdminDeleteUserContentV2' test.out

#- 128 AdminUpdateUserContentV2
./ng net.accelbyte.sdk.cli.Main ugc adminUpdateUserContentV2 \
    --channelId 'G94sU76N' \
    --contentId 'ZNyaZz0k' \
    --namespace "$AB_NAMESPACE" \
    --userId 'oSvQl2Ob' \
    --body '{"customAttributes": {"Bn99G7wr": {}, "wMPPVPQh": {}, "4MNL2xac": {}}, "name": "FvuGpfKD", "shareCode": "VnpsuesC", "subType": "liPaQxa1", "tags": ["2zGSX0dl", "V3OTSWJ2", "ivx0m218"], "type": "rrA61h77"}' \
    > test.out 2>&1
eval_tap $? 128 'AdminUpdateUserContentV2' test.out

#- 129 AdminUpdateUserContentFileLocation
./ng net.accelbyte.sdk.cli.Main ugc adminUpdateUserContentFileLocation \
    --channelId 'dzg0Rj07' \
    --contentId 'SbRsD2Dr' \
    --namespace "$AB_NAMESPACE" \
    --userId 'b9VE0iyk' \
    --body '{"fileExtension": "VK85zz6f", "fileLocation": "c1FvXRb4"}' \
    > test.out 2>&1
eval_tap $? 129 'AdminUpdateUserContentFileLocation' test.out

#- 130 AdminGenerateUserContentUploadURLV2
./ng net.accelbyte.sdk.cli.Main ugc adminGenerateUserContentUploadURLV2 \
    --channelId 'mMaZkFMu' \
    --contentId 'HF2ARBzK' \
    --namespace "$AB_NAMESPACE" \
    --userId '49kIv9vc' \
    --body '{"contentType": "LiOJHC4c", "fileExtension": "6VMPQfD7"}' \
    > test.out 2>&1
eval_tap $? 130 'AdminGenerateUserContentUploadURLV2' test.out

#- 131 AdminGetContentByUserIDV2
./ng net.accelbyte.sdk.cli.Main ugc adminGetContentByUserIDV2 \
    --namespace "$AB_NAMESPACE" \
    --userId '6tg2UTij' \
    --limit '55' \
    --offset '73' \
    --sortBy 'HmvdTayi' \
    > test.out 2>&1
eval_tap $? 131 'AdminGetContentByUserIDV2' test.out

#- 132 AdminUpdateContentHideStatusV2
./ng net.accelbyte.sdk.cli.Main ugc adminUpdateContentHideStatusV2 \
    --contentId '8rrJMAmE' \
    --namespace "$AB_NAMESPACE" \
    --userId 'fE32lLwv' \
    --body '{"isHidden": true}' \
    > test.out 2>&1
eval_tap $? 132 'AdminUpdateContentHideStatusV2' test.out

#- 133 AdminGetUserGroupContentsV2
./ng net.accelbyte.sdk.cli.Main ugc adminGetUserGroupContentsV2 \
    --groupId '3vrLKRgG' \
    --namespace "$AB_NAMESPACE" \
    --userId '7DcHPMc6' \
    --limit '42' \
    --offset '92' \
    > test.out 2>&1
eval_tap $? 133 'AdminGetUserGroupContentsV2' test.out

#- 134 AdminListUserStagingContents
./ng net.accelbyte.sdk.cli.Main ugc adminListUserStagingContents \
    --namespace "$AB_NAMESPACE" \
    --userId 'BZDaKcOG' \
    --limit '29' \
    --offset '10' \
    --sortBy '5dhSogLb' \
    --status 'OY92w1AO' \
    > test.out 2>&1
eval_tap $? 134 'AdminListUserStagingContents' test.out

#- 135 PublicGetContentByChannelIDV2
./ng net.accelbyte.sdk.cli.Main ugc publicGetContentByChannelIDV2 \
    --channelId 'Ede8Q1gS' \
    --namespace "$AB_NAMESPACE" \
    --limit '26' \
    --name 'exHIDOB4' \
    --offset '66' \
    --sortBy 'BPdG25IY' \
    > test.out 2>&1
eval_tap $? 135 'PublicGetContentByChannelIDV2' test.out

#- 136 PublicListContentV2
./ng net.accelbyte.sdk.cli.Main ugc publicListContentV2 \
    --namespace "$AB_NAMESPACE" \
    --isOfficial  \
    --limit '4' \
    --name 'bc6zOlRm' \
    --offset '95' \
    --sortBy 'XlBm3mNB' \
    --subType '3OFvFIaX' \
    --tags 'bCyj6d5c,WMyMrZAX,hCEwbsef' \
    --type 'AdrK4Iuu' \
    > test.out 2>&1
eval_tap $? 136 'PublicListContentV2' test.out

#- 137 PublicBulkGetContentByIDV2
./ng net.accelbyte.sdk.cli.Main ugc publicBulkGetContentByIDV2 \
    --namespace "$AB_NAMESPACE" \
    --body '{"contentIds": ["JKCFZ0CH", "4jRRxkaZ", "ZdSpvZsm"]}' \
    > test.out 2>&1
eval_tap $? 137 'PublicBulkGetContentByIDV2' test.out

#- 138 PublicGetContentBulkByShareCodesV2
./ng net.accelbyte.sdk.cli.Main ugc publicGetContentBulkByShareCodesV2 \
    --namespace "$AB_NAMESPACE" \
    --body '{"shareCodes": ["MyZxCB4y", "O7YxHK6b", "olCglFb4"]}' \
    > test.out 2>&1
eval_tap $? 138 'PublicGetContentBulkByShareCodesV2' test.out

#- 139 PublicGetContentByShareCodeV2
./ng net.accelbyte.sdk.cli.Main ugc publicGetContentByShareCodeV2 \
    --namespace "$AB_NAMESPACE" \
    --shareCode 'EbyforeU' \
    > test.out 2>&1
eval_tap $? 139 'PublicGetContentByShareCodeV2' test.out

#- 140 PublicGetContentByIDV2
./ng net.accelbyte.sdk.cli.Main ugc publicGetContentByIDV2 \
    --contentId 'Q6rOSJML' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 140 'PublicGetContentByIDV2' test.out

#- 141 PublicAddDownloadCountV2
./ng net.accelbyte.sdk.cli.Main ugc publicAddDownloadCountV2 \
    --contentId 'FtT58Eal' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 141 'PublicAddDownloadCountV2' test.out

#- 142 PublicListContentDownloaderV2
./ng net.accelbyte.sdk.cli.Main ugc publicListContentDownloaderV2 \
    --contentId 'rtoDygIf' \
    --namespace "$AB_NAMESPACE" \
    --limit '44' \
    --offset '39' \
    --sortBy 'j2dOj0Nh' \
    --userId 'IYd5R5Ev' \
    > test.out 2>&1
eval_tap $? 142 'PublicListContentDownloaderV2' test.out

#- 143 PublicListContentLikeV2
./ng net.accelbyte.sdk.cli.Main ugc publicListContentLikeV2 \
    --contentId 'U0HlRAcM' \
    --namespace "$AB_NAMESPACE" \
    --limit '57' \
    --offset '73' \
    --sortBy 'rQqp4Z62' \
    > test.out 2>&1
eval_tap $? 143 'PublicListContentLikeV2' test.out

#- 144 UpdateContentLikeStatusV2
./ng net.accelbyte.sdk.cli.Main ugc updateContentLikeStatusV2 \
    --contentId 'g5NX4C3W' \
    --namespace "$AB_NAMESPACE" \
    --body '{"likeStatus": true}' \
    > test.out 2>&1
eval_tap $? 144 'UpdateContentLikeStatusV2' test.out

#- 145 PublicCreateContentV2
./ng net.accelbyte.sdk.cli.Main ugc publicCreateContentV2 \
    --channelId '252oNjAH' \
    --namespace "$AB_NAMESPACE" \
    --userId 'BjLxgTlZ' \
    --body '{"contentType": "rg4LsVFo", "customAttributes": {"cQO4UFoA": {}, "6nwcPn41": {}, "kuqzeDd6": {}}, "fileExtension": "UnuaXMBI", "name": "fcbDxm7O", "subType": "Yr4E6swd", "tags": ["WHkEDTv7", "NFUualma", "QgaKzcYb"], "type": "Tx4DhViJ"}' \
    > test.out 2>&1
eval_tap $? 145 'PublicCreateContentV2' test.out

#- 146 PublicUpdateContentByShareCodeV2
./ng net.accelbyte.sdk.cli.Main ugc publicUpdateContentByShareCodeV2 \
    --channelId 'OJFqB74g' \
    --namespace "$AB_NAMESPACE" \
    --shareCode 'CtaTRmVB' \
    --userId 'JVeoPZsl' \
    --body '{"customAttributes": {"ezrvMtkW": {}, "6aayBw3g": {}, "oO8XMudY": {}}, "name": "m7M0It9y", "subType": "V0HEqz75", "tags": ["hf6h35M5", "S4DqW3R7", "66IZBGoG"], "type": "JP8ZRyrs"}' \
    > test.out 2>&1
eval_tap $? 146 'PublicUpdateContentByShareCodeV2' test.out

#- 147 PublicDeleteContentByShareCodeV2
./ng net.accelbyte.sdk.cli.Main ugc publicDeleteContentByShareCodeV2 \
    --channelId '6OhBdSgH' \
    --namespace "$AB_NAMESPACE" \
    --shareCode 'Ogl7a3R5' \
    --userId 'wUjIUFCi' \
    > test.out 2>&1
eval_tap $? 147 'PublicDeleteContentByShareCodeV2' test.out

#- 148 PublicDeleteContentV2
./ng net.accelbyte.sdk.cli.Main ugc publicDeleteContentV2 \
    --channelId 'V1M5iCnN' \
    --contentId 'A9f4UKCB' \
    --namespace "$AB_NAMESPACE" \
    --userId '2V28A7SC' \
    > test.out 2>&1
eval_tap $? 148 'PublicDeleteContentV2' test.out

#- 149 PublicUpdateContentV2
./ng net.accelbyte.sdk.cli.Main ugc publicUpdateContentV2 \
    --channelId 'wh2RRdmC' \
    --contentId 'JmNPwUNK' \
    --namespace "$AB_NAMESPACE" \
    --userId 'Hs3YwWnp' \
    --body '{"customAttributes": {"EZscmtt9": {}, "CxjpaJqz": {}, "xAyKiiw4": {}}, "name": "KxGh9KKQ", "subType": "UaqBSAlo", "tags": ["l4UZAQQ6", "eLPI6Yj7", "SPzrFDDc"], "type": "8S8eKcGM"}' \
    > test.out 2>&1
eval_tap $? 149 'PublicUpdateContentV2' test.out

#- 150 PublicUpdateContentFileLocation
./ng net.accelbyte.sdk.cli.Main ugc publicUpdateContentFileLocation \
    --channelId 'qZaSCNp1' \
    --contentId 'DnBCrdtp' \
    --namespace "$AB_NAMESPACE" \
    --userId 'j9YH9JNC' \
    --body '{"fileExtension": "SsvIEcWw", "fileLocation": "zwg1oZFj"}' \
    > test.out 2>&1
eval_tap $? 150 'PublicUpdateContentFileLocation' test.out

#- 151 UpdateContentShareCodeV2
./ng net.accelbyte.sdk.cli.Main ugc updateContentShareCodeV2 \
    --channelId 'ysnrafEL' \
    --contentId 'vPbGUcHN' \
    --namespace "$AB_NAMESPACE" \
    --userId 'eIFQf04a' \
    --body '{"shareCode": "B1sVOeLl"}' \
    > test.out 2>&1
eval_tap $? 151 'UpdateContentShareCodeV2' test.out

#- 152 PublicGenerateContentUploadURLV2
./ng net.accelbyte.sdk.cli.Main ugc publicGenerateContentUploadURLV2 \
    --channelId 'bF6mVJ3c' \
    --contentId 'hyBDB9Y6' \
    --namespace "$AB_NAMESPACE" \
    --userId '8dYjyZs7' \
    --body '{"contentType": "HTrNnUzk", "fileExtension": "alhp8O1j"}' \
    > test.out 2>&1
eval_tap $? 152 'PublicGenerateContentUploadURLV2' test.out

#- 153 PublicGetContentByUserIDV2
./ng net.accelbyte.sdk.cli.Main ugc publicGetContentByUserIDV2 \
    --namespace "$AB_NAMESPACE" \
    --userId 'JmlfeJAV' \
    --limit '1' \
    --offset '84' \
    --sortBy 'TTW1Aadk' \
    > test.out 2>&1
eval_tap $? 153 'PublicGetContentByUserIDV2' test.out

#- 154 UpdateScreenshotsV2
./ng net.accelbyte.sdk.cli.Main ugc updateScreenshotsV2 \
    --contentId 'xhelpXhd' \
    --namespace "$AB_NAMESPACE" \
    --userId 'q8bnqTer' \
    --body '{"screenshots": [{"description": "J12TRyl1", "screenshotId": "msu0gxhd"}, {"description": "1xVd6ZWB", "screenshotId": "NbJRxDbb"}, {"description": "NXRmGBmW", "screenshotId": "oSwGqc7y"}]}' \
    > test.out 2>&1
eval_tap $? 154 'UpdateScreenshotsV2' test.out

#- 155 UploadContentScreenshotV2
./ng net.accelbyte.sdk.cli.Main ugc uploadContentScreenshotV2 \
    --contentId 't5U6So55' \
    --namespace "$AB_NAMESPACE" \
    --userId 'pwfIY6Ae' \
    --body '{"screenshots": [{"contentType": "rjVzUoqa", "description": "5FVdYEHb", "fileExtension": "jfif"}, {"contentType": "H9gzBBI9", "description": "jrMHDo3F", "fileExtension": "jfif"}, {"contentType": "7mLAynAs", "description": "yemwMDMs", "fileExtension": "jfif"}]}' \
    > test.out 2>&1
eval_tap $? 155 'UploadContentScreenshotV2' test.out

#- 156 DeleteContentScreenshotV2
./ng net.accelbyte.sdk.cli.Main ugc deleteContentScreenshotV2 \
    --contentId 'FnVtRqhZ' \
    --namespace "$AB_NAMESPACE" \
    --screenshotId 'F8szY7l6' \
    --userId 'Dg4vWS6U' \
    > test.out 2>&1
eval_tap $? 156 'DeleteContentScreenshotV2' test.out

#- 157 PublicGetGroupContentsV2
./ng net.accelbyte.sdk.cli.Main ugc publicGetGroupContentsV2 \
    --groupId '4m6iKWmM' \
    --namespace "$AB_NAMESPACE" \
    --userId '4bV5Iwhi' \
    --limit '50' \
    --offset '43' \
    > test.out 2>&1
eval_tap $? 157 'PublicGetGroupContentsV2' test.out

#- 158 ListUserStagingContents
./ng net.accelbyte.sdk.cli.Main ugc listUserStagingContents \
    --namespace "$AB_NAMESPACE" \
    --userId '9rYpfzeG' \
    --limit '68' \
    --offset '27' \
    --sortBy 'm5K6kx5W' \
    --status 'ump5yqLW' \
    > test.out 2>&1
eval_tap $? 158 'ListUserStagingContents' test.out

#- 159 GetUserStagingContentByID
./ng net.accelbyte.sdk.cli.Main ugc getUserStagingContentByID \
    --contentId 'iUmqulL7' \
    --namespace "$AB_NAMESPACE" \
    --userId 'tuElsdm4' \
    > test.out 2>&1
eval_tap $? 159 'GetUserStagingContentByID' test.out

#- 160 UpdateStagingContent
./ng net.accelbyte.sdk.cli.Main ugc updateStagingContent \
    --contentId '7NjxJmG2' \
    --namespace "$AB_NAMESPACE" \
    --userId '1rTM6Hrm' \
    --body '{"fileExtension": "yk0RLzzP", "fileLocation": "zC8T58I6"}' \
    > test.out 2>&1
eval_tap $? 160 'UpdateStagingContent' test.out

#- 161 DeleteUserStagingContentByID
./ng net.accelbyte.sdk.cli.Main ugc deleteUserStagingContentByID \
    --contentId 'lJkFvnuX' \
    --namespace "$AB_NAMESPACE" \
    --userId 'xtd2J1mD' \
    > test.out 2>&1
eval_tap $? 161 'DeleteUserStagingContentByID' test.out


rm -f "tmp.dat"

exit $EXIT_CODE