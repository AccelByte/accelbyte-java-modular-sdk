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
    --limit '45' \
    --offset '26' \
    > test.out 2>&1
eval_tap $? 2 'SingleAdminGetChannel' test.out

#- 3 AdminCreateChannel
./ng net.accelbyte.sdk.cli.Main ugc adminCreateChannel \
    --namespace "$AB_NAMESPACE" \
    --body '{"id": "6c7zm60b", "name": "rQbGTTOB"}' \
    > test.out 2>&1
eval_tap $? 3 'AdminCreateChannel' test.out

#- 4 SingleAdminUpdateChannel
./ng net.accelbyte.sdk.cli.Main ugc singleAdminUpdateChannel \
    --channelId 'rkaNXwak' \
    --namespace "$AB_NAMESPACE" \
    --body '{"name": "aYBdE7Gs"}' \
    > test.out 2>&1
eval_tap $? 4 'SingleAdminUpdateChannel' test.out

#- 5 SingleAdminDeleteChannel
./ng net.accelbyte.sdk.cli.Main ugc singleAdminDeleteChannel \
    --channelId 'RzETrDkO' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 5 'SingleAdminDeleteChannel' test.out

#- 6 AdminUploadContentDirect
eval_tap 0 6 'AdminUploadContentDirect # SKIP deprecated' test.out

#- 7 AdminUploadContentS3
./ng net.accelbyte.sdk.cli.Main ugc adminUploadContentS3 \
    --channelId 'u5g6ndTH' \
    --namespace "$AB_NAMESPACE" \
    --body '{"contentType": "SKBJ85oy", "customAttributes": {"Ll10xWBc": {}, "FH2nfX2G": {}, "7JQ9GicH": {}}, "fileExtension": "65ZwgDiA", "name": "R0b4z5fm", "preview": "tXDprEyu", "previewMetadata": {"previewContentType": "7UkbIpdc", "previewFileExtension": "amgTNIxX"}, "shareCode": "0RHw8KF9", "subType": "XagzlEpK", "tags": ["o64AN5Q4", "ZcuCCnT1", "iYVfEVa1"], "type": "maOaYh3y"}' \
    > test.out 2>&1
eval_tap $? 7 'AdminUploadContentS3' test.out

#- 8 SingleAdminUpdateContentS3
./ng net.accelbyte.sdk.cli.Main ugc singleAdminUpdateContentS3 \
    --channelId 'O6ttNYNb' \
    --contentId 'EeZfecsj' \
    --namespace "$AB_NAMESPACE" \
    --body '{"contentType": "HMbZmHut", "customAttributes": {"BQpDIEmr": {}, "OPJguAJe": {}, "8l6XbgUr": {}}, "fileExtension": "dFCX2fp7", "name": "H813Ug9F", "payload": "d59S09Hy", "preview": "QqzflgQ7", "previewMetadata": {"previewContentType": "QMnVoZkm", "previewFileExtension": "RMjXxY7a"}, "shareCode": "dZPP3yEL", "subType": "SFPuXNdH", "tags": ["NzGE0wUY", "pY8wq9R6", "yRJxWPBB"], "type": "PYKjScBr", "updateContentFile": true}' \
    > test.out 2>&1
eval_tap $? 8 'SingleAdminUpdateContentS3' test.out

#- 9 AdminSearchChannelSpecificContent
./ng net.accelbyte.sdk.cli.Main ugc adminSearchChannelSpecificContent \
    --channelId 'ejUjhGyj' \
    --namespace "$AB_NAMESPACE" \
    --creator 'BrM4jZNw' \
    --ishidden 'OVpgyce2' \
    --isofficial 'k3F6jBNZ' \
    --limit '82' \
    --name 'wtcQir3J' \
    --offset '20' \
    --orderby '2k4fYwIU' \
    --sortby '7QPMTkma' \
    --subtype 'VlWPCUYn' \
    --tags '4NznLUtL,cq5yUX7W,Hq3kcmV7' \
    --type 'A5en6HUJ' \
    --userId '0CFNk3c8' \
    > test.out 2>&1
eval_tap $? 9 'AdminSearchChannelSpecificContent' test.out

#- 10 SingleAdminUpdateContentDirect
eval_tap 0 10 'SingleAdminUpdateContentDirect # SKIP deprecated' test.out

#- 11 SingleAdminDeleteContent
./ng net.accelbyte.sdk.cli.Main ugc singleAdminDeleteContent \
    --channelId 'SyNKur9N' \
    --contentId 'mEUd5IdI' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 11 'SingleAdminDeleteContent' test.out

#- 12 SingleAdminGetContent
./ng net.accelbyte.sdk.cli.Main ugc singleAdminGetContent \
    --namespace "$AB_NAMESPACE" \
    --limit '58' \
    --offset '5' \
    > test.out 2>&1
eval_tap $? 12 'SingleAdminGetContent' test.out

#- 13 AdminGetContentBulk
./ng net.accelbyte.sdk.cli.Main ugc adminGetContentBulk \
    --namespace "$AB_NAMESPACE" \
    --body '{"contentIds": ["ZAr8JZDt", "DnybSo7i", "DrHOC2c6"]}' \
    > test.out 2>&1
eval_tap $? 13 'AdminGetContentBulk' test.out

#- 14 AdminSearchContent
./ng net.accelbyte.sdk.cli.Main ugc adminSearchContent \
    --namespace "$AB_NAMESPACE" \
    --creator 'btHfIV4Y' \
    --ishidden 'tNFhFHzB' \
    --isofficial 'BkhjTNhv' \
    --limit '32' \
    --name 'Tw2sj6av' \
    --offset '52' \
    --orderby 'IOj14FUc' \
    --sortby 'wDpynTUZ' \
    --subtype 'I1C3pSO2' \
    --tags 'GNUpVqmS,umA9ULri,sUazd8EU' \
    --type 'Kf6GkHYW' \
    --userId 'tB3a4dY4' \
    > test.out 2>&1
eval_tap $? 14 'AdminSearchContent' test.out

#- 15 AdminGetContentBulkByShareCodes
./ng net.accelbyte.sdk.cli.Main ugc adminGetContentBulkByShareCodes \
    --namespace "$AB_NAMESPACE" \
    --body '{"shareCodes": ["UxaVXkt1", "RfWEADiR", "SaeRfWlw"]}' \
    > test.out 2>&1
eval_tap $? 15 'AdminGetContentBulkByShareCodes' test.out

#- 16 AdminGetUserContentByShareCode
./ng net.accelbyte.sdk.cli.Main ugc adminGetUserContentByShareCode \
    --namespace "$AB_NAMESPACE" \
    --shareCode 'SBLVf77a' \
    > test.out 2>&1
eval_tap $? 16 'AdminGetUserContentByShareCode' test.out

#- 17 AdminGetSpecificContent
./ng net.accelbyte.sdk.cli.Main ugc adminGetSpecificContent \
    --contentId '4R93mmbN' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 17 'AdminGetSpecificContent' test.out

#- 18 AdminDownloadContentPreview
./ng net.accelbyte.sdk.cli.Main ugc adminDownloadContentPreview \
    --contentId 'XyTkhoK3' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 18 'AdminDownloadContentPreview' test.out

#- 19 RollbackContentVersion
./ng net.accelbyte.sdk.cli.Main ugc rollbackContentVersion \
    --contentId 'WVWnk74G' \
    --namespace "$AB_NAMESPACE" \
    --versionId 'CA5FBd7E' \
    > test.out 2>&1
eval_tap $? 19 'RollbackContentVersion' test.out

#- 20 AdminUpdateScreenshots
./ng net.accelbyte.sdk.cli.Main ugc adminUpdateScreenshots \
    --contentId 'OJgAg7X0' \
    --namespace "$AB_NAMESPACE" \
    --body '{"screenshots": [{"description": "9PUI9fJG", "screenshotId": "MRQXP156"}, {"description": "HuO4DGOC", "screenshotId": "Ykj2Ziki"}, {"description": "xWAkBqHL", "screenshotId": "ZaHIzhOz"}]}' \
    > test.out 2>&1
eval_tap $? 20 'AdminUpdateScreenshots' test.out

#- 21 AdminUploadContentScreenshot
./ng net.accelbyte.sdk.cli.Main ugc adminUploadContentScreenshot \
    --contentId 'fVyqpwnF' \
    --namespace "$AB_NAMESPACE" \
    --body '{"screenshots": [{"contentType": "OKscc8Vt", "description": "mHjDc8gY", "fileExtension": "jpg"}, {"contentType": "A7BJ3c2d", "description": "3s4dKhj6", "fileExtension": "pjp"}, {"contentType": "WP4yplxQ", "description": "ryJaEr7e", "fileExtension": "jpg"}]}' \
    > test.out 2>&1
eval_tap $? 21 'AdminUploadContentScreenshot' test.out

#- 22 AdminDeleteContentScreenshot
./ng net.accelbyte.sdk.cli.Main ugc adminDeleteContentScreenshot \
    --contentId 'iXUNJ8x2' \
    --namespace "$AB_NAMESPACE" \
    --screenshotId 'L0YuX5pu' \
    > test.out 2>&1
eval_tap $? 22 'AdminDeleteContentScreenshot' test.out

#- 23 ListContentVersions
./ng net.accelbyte.sdk.cli.Main ugc listContentVersions \
    --contentId 'fvaHLiPT' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 23 'ListContentVersions' test.out

#- 24 SingleAdminGetAllGroups
./ng net.accelbyte.sdk.cli.Main ugc singleAdminGetAllGroups \
    --namespace "$AB_NAMESPACE" \
    --limit '23' \
    --offset '18' \
    > test.out 2>&1
eval_tap $? 24 'SingleAdminGetAllGroups' test.out

#- 25 AdminCreateGroup
./ng net.accelbyte.sdk.cli.Main ugc adminCreateGroup \
    --namespace "$AB_NAMESPACE" \
    --body '{"contents": ["zUOE73iv", "i2b2C5ax", "AKi31fQu"], "name": "WrVnYieg"}' \
    > test.out 2>&1
eval_tap $? 25 'AdminCreateGroup' test.out

#- 26 SingleAdminGetGroup
./ng net.accelbyte.sdk.cli.Main ugc singleAdminGetGroup \
    --groupId 'yY4rFYPM' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 26 'SingleAdminGetGroup' test.out

#- 27 SingleAdminUpdateGroup
./ng net.accelbyte.sdk.cli.Main ugc singleAdminUpdateGroup \
    --groupId 'skglwPNf' \
    --namespace "$AB_NAMESPACE" \
    --body '{"contents": ["gDk1SzP9", "bDrT4XOI", "kn9LL6Ts"], "name": "qZNlXSg3"}' \
    > test.out 2>&1
eval_tap $? 27 'SingleAdminUpdateGroup' test.out

#- 28 SingleAdminDeleteGroup
./ng net.accelbyte.sdk.cli.Main ugc singleAdminDeleteGroup \
    --groupId 'RMXK9tNx' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 28 'SingleAdminDeleteGroup' test.out

#- 29 SingleAdminGetGroupContents
./ng net.accelbyte.sdk.cli.Main ugc singleAdminGetGroupContents \
    --groupId 'Uynr4IY3' \
    --namespace "$AB_NAMESPACE" \
    --limit '67' \
    --offset '71' \
    > test.out 2>&1
eval_tap $? 29 'SingleAdminGetGroupContents' test.out

#- 30 AdminGetTag
./ng net.accelbyte.sdk.cli.Main ugc adminGetTag \
    --namespace "$AB_NAMESPACE" \
    --limit '70' \
    --offset '60' \
    > test.out 2>&1
eval_tap $? 30 'AdminGetTag' test.out

#- 31 AdminCreateTag
./ng net.accelbyte.sdk.cli.Main ugc adminCreateTag \
    --namespace "$AB_NAMESPACE" \
    --body '{"tag": "4kYJBcUj"}' \
    > test.out 2>&1
eval_tap $? 31 'AdminCreateTag' test.out

#- 32 AdminUpdateTag
./ng net.accelbyte.sdk.cli.Main ugc adminUpdateTag \
    --namespace "$AB_NAMESPACE" \
    --tagId 'oMSQ8pI9' \
    --body '{"tag": "juIWhvDX"}' \
    > test.out 2>&1
eval_tap $? 32 'AdminUpdateTag' test.out

#- 33 AdminDeleteTag
./ng net.accelbyte.sdk.cli.Main ugc adminDeleteTag \
    --namespace "$AB_NAMESPACE" \
    --tagId '0BDt6J64' \
    > test.out 2>&1
eval_tap $? 33 'AdminDeleteTag' test.out

#- 34 AdminGetType
./ng net.accelbyte.sdk.cli.Main ugc adminGetType \
    --namespace "$AB_NAMESPACE" \
    --limit '12' \
    --offset '73' \
    > test.out 2>&1
eval_tap $? 34 'AdminGetType' test.out

#- 35 AdminCreateType
./ng net.accelbyte.sdk.cli.Main ugc adminCreateType \
    --namespace "$AB_NAMESPACE" \
    --body '{"subtype": ["ZAVn9CMP", "E2o52kjm", "hgCChGic"], "type": "tAUoIRQW"}' \
    > test.out 2>&1
eval_tap $? 35 'AdminCreateType' test.out

#- 36 AdminUpdateType
./ng net.accelbyte.sdk.cli.Main ugc adminUpdateType \
    --namespace "$AB_NAMESPACE" \
    --typeId 'Skk37lXY' \
    --body '{"subtype": ["zZfB7pao", "1nrNqcmd", "tePBTBrA"], "type": "XF4ZRp5h"}' \
    > test.out 2>&1
eval_tap $? 36 'AdminUpdateType' test.out

#- 37 AdminDeleteType
./ng net.accelbyte.sdk.cli.Main ugc adminDeleteType \
    --namespace "$AB_NAMESPACE" \
    --typeId 'fjSeCtMa' \
    > test.out 2>&1
eval_tap $? 37 'AdminDeleteType' test.out

#- 38 AdminGetChannel
./ng net.accelbyte.sdk.cli.Main ugc adminGetChannel \
    --namespace "$AB_NAMESPACE" \
    --userId 'rQyu7VWY' \
    --limit '51' \
    --name 'sjKd13a5' \
    --offset '23' \
    > test.out 2>&1
eval_tap $? 38 'AdminGetChannel' test.out

#- 39 AdminDeleteAllUserChannels
./ng net.accelbyte.sdk.cli.Main ugc adminDeleteAllUserChannels \
    --namespace "$AB_NAMESPACE" \
    --userId 'VSoYd3Gn' \
    > test.out 2>&1
eval_tap $? 39 'AdminDeleteAllUserChannels' test.out

#- 40 AdminUpdateChannel
./ng net.accelbyte.sdk.cli.Main ugc adminUpdateChannel \
    --channelId 'FEeYD3Vd' \
    --namespace "$AB_NAMESPACE" \
    --userId 'rGeKaZ32' \
    --body '{"name": "qaKuDXvG"}' \
    > test.out 2>&1
eval_tap $? 40 'AdminUpdateChannel' test.out

#- 41 AdminDeleteChannel
./ng net.accelbyte.sdk.cli.Main ugc adminDeleteChannel \
    --channelId 'Xj4XfMLd' \
    --namespace "$AB_NAMESPACE" \
    --userId 'bcqPD6Xg' \
    > test.out 2>&1
eval_tap $? 41 'AdminDeleteChannel' test.out

#- 42 AdminUpdateContentS3ByShareCode
./ng net.accelbyte.sdk.cli.Main ugc adminUpdateContentS3ByShareCode \
    --channelId 'I0betGNl' \
    --namespace "$AB_NAMESPACE" \
    --shareCode 'F8dSQB70' \
    --userId 'XM00m6YD' \
    --body '{"contentType": "goNbmgdD", "customAttributes": {"XaCzFHTw": {}, "GHhKyfJ1": {}, "Wcp9mupB": {}}, "fileExtension": "UYuSM07T", "name": "4wnRXKuM", "payload": "W68hVkVa", "preview": "QPI5c3Zr", "previewMetadata": {"previewContentType": "AiWFLIUd", "previewFileExtension": "tBe7Kn77"}, "shareCode": "RG19Mknu", "subType": "ZVQRASVN", "tags": ["IzW2QdqU", "sLY0P2Y7", "1klJvKFT"], "type": "t7IeMqlX", "updateContentFile": false}' \
    > test.out 2>&1
eval_tap $? 42 'AdminUpdateContentS3ByShareCode' test.out

#- 43 AdminUpdateContentS3
./ng net.accelbyte.sdk.cli.Main ugc adminUpdateContentS3 \
    --channelId '1rmlt4Gc' \
    --contentId 'yT2D8TVC' \
    --namespace "$AB_NAMESPACE" \
    --userId 'oX9MFrZr' \
    --body '{"contentType": "5uGvi2pH", "customAttributes": {"qH0oU4Q4": {}, "PUGKZKLl": {}, "xAjDBLLK": {}}, "fileExtension": "4cybHGmH", "name": "m7Nubk3I", "payload": "iacCIvWB", "preview": "VIj8Djd5", "previewMetadata": {"previewContentType": "tdmmsI3L", "previewFileExtension": "rxtaSk5M"}, "shareCode": "YSbkaVSL", "subType": "HMlUStDu", "tags": ["KrxrqAYl", "dTSzEpQx", "aXV4HLVc"], "type": "uMafPqHg", "updateContentFile": false}' \
    > test.out 2>&1
eval_tap $? 43 'AdminUpdateContentS3' test.out

#- 44 DeleteContentByShareCode
./ng net.accelbyte.sdk.cli.Main ugc deleteContentByShareCode \
    --channelId 'V4Gh0R6i' \
    --namespace "$AB_NAMESPACE" \
    --shareCode 'V34QS7iE' \
    --userId 'Zpjjjbbj' \
    > test.out 2>&1
eval_tap $? 44 'DeleteContentByShareCode' test.out

#- 45 AdminUpdateContentDirect
eval_tap 0 45 'AdminUpdateContentDirect # SKIP deprecated' test.out

#- 46 AdminDeleteContent
./ng net.accelbyte.sdk.cli.Main ugc adminDeleteContent \
    --channelId 'yiXJD8Sa' \
    --contentId 'uZqALS01' \
    --namespace "$AB_NAMESPACE" \
    --userId 'HENZ357E' \
    > test.out 2>&1
eval_tap $? 46 'AdminDeleteContent' test.out

#- 47 AdminGetContent
./ng net.accelbyte.sdk.cli.Main ugc adminGetContent \
    --namespace "$AB_NAMESPACE" \
    --userId 'vHgdlkgZ' \
    --limit '1' \
    --offset '47' \
    > test.out 2>&1
eval_tap $? 47 'AdminGetContent' test.out

#- 48 AdminDeleteAllUserContents
./ng net.accelbyte.sdk.cli.Main ugc adminDeleteAllUserContents \
    --namespace "$AB_NAMESPACE" \
    --userId 'lEY5k10n' \
    > test.out 2>&1
eval_tap $? 48 'AdminDeleteAllUserContents' test.out

#- 49 AdminHideUserContent
./ng net.accelbyte.sdk.cli.Main ugc adminHideUserContent \
    --contentId 'Wk4oCCrj' \
    --namespace "$AB_NAMESPACE" \
    --userId 'COBl0T07' \
    --body '{"isHidden": true}' \
    > test.out 2>&1
eval_tap $? 49 'AdminHideUserContent' test.out

#- 50 AdminGetAllGroups
./ng net.accelbyte.sdk.cli.Main ugc adminGetAllGroups \
    --namespace "$AB_NAMESPACE" \
    --userId 'cELgWauf' \
    --limit '10' \
    --offset '8' \
    > test.out 2>&1
eval_tap $? 50 'AdminGetAllGroups' test.out

#- 51 AdminDeleteAllUserGroup
./ng net.accelbyte.sdk.cli.Main ugc adminDeleteAllUserGroup \
    --namespace "$AB_NAMESPACE" \
    --userId 'ig0oZBiv' \
    > test.out 2>&1
eval_tap $? 51 'AdminDeleteAllUserGroup' test.out

#- 52 AdminGetGroup
./ng net.accelbyte.sdk.cli.Main ugc adminGetGroup \
    --groupId 'wIYoyisw' \
    --namespace "$AB_NAMESPACE" \
    --userId 'zl6mGcsZ' \
    > test.out 2>&1
eval_tap $? 52 'AdminGetGroup' test.out

#- 53 AdminUpdateGroup
./ng net.accelbyte.sdk.cli.Main ugc adminUpdateGroup \
    --groupId 'XCqEdTfA' \
    --namespace "$AB_NAMESPACE" \
    --userId 'DJYDvNiv' \
    --body '{"contents": ["ReiLnUHa", "M5id7OyX", "JvHYl8SL"], "name": "DSjntsjs"}' \
    > test.out 2>&1
eval_tap $? 53 'AdminUpdateGroup' test.out

#- 54 AdminDeleteGroup
./ng net.accelbyte.sdk.cli.Main ugc adminDeleteGroup \
    --groupId 'Jh6vpwFI' \
    --namespace "$AB_NAMESPACE" \
    --userId 'P7v2tEDk' \
    > test.out 2>&1
eval_tap $? 54 'AdminDeleteGroup' test.out

#- 55 AdminGetGroupContents
./ng net.accelbyte.sdk.cli.Main ugc adminGetGroupContents \
    --groupId '4HpJN7ou' \
    --namespace "$AB_NAMESPACE" \
    --userId 'pNt6rfZw' \
    --limit '78' \
    --offset '16' \
    > test.out 2>&1
eval_tap $? 55 'AdminGetGroupContents' test.out

#- 56 AdminDeleteAllUserStates
./ng net.accelbyte.sdk.cli.Main ugc adminDeleteAllUserStates \
    --namespace "$AB_NAMESPACE" \
    --userId '1ARTCVZu' \
    > test.out 2>&1
eval_tap $? 56 'AdminDeleteAllUserStates' test.out

#- 57 SearchChannelSpecificContent
./ng net.accelbyte.sdk.cli.Main ugc searchChannelSpecificContent \
    --channelId 'hRINUYBK' \
    --namespace "$AB_NAMESPACE" \
    --creator 'wcB0sGBP' \
    --ishidden 'lR8IF8w4' \
    --isofficial 'S5asO2h7' \
    --limit '47' \
    --name 'e4X70jUh' \
    --offset '1' \
    --orderby 'XRSSRpeI' \
    --sortby 'J59xkWhU' \
    --subtype 'F2unYm4o' \
    --tags 'OoKXQ2ci,vJZdoTqu,vkqKaTtq' \
    --type 'fVVk882k' \
    --userId 'farjQthk' \
    > test.out 2>&1
eval_tap $? 57 'SearchChannelSpecificContent' test.out

#- 58 PublicSearchContent
./ng net.accelbyte.sdk.cli.Main ugc publicSearchContent \
    --namespace "$AB_NAMESPACE" \
    --creator 'TcY0gzmc' \
    --ishidden 'Ml1LgQGn' \
    --isofficial 'yRY7GgBC' \
    --limit '4' \
    --name 'WZ6ZjJ1O' \
    --offset '31' \
    --orderby 'oVDm7J4y' \
    --sortby 'aVUqJmH8' \
    --subtype 'dQRgrUXZ' \
    --tags 'mEsImJCZ,SusCVw7c,MPlVqSK0' \
    --type 'ABxcknWs' \
    --userId 'qO5SAH3I' \
    > test.out 2>&1
eval_tap $? 58 'PublicSearchContent' test.out

#- 59 PublicGetContentBulk
./ng net.accelbyte.sdk.cli.Main ugc publicGetContentBulk \
    --namespace "$AB_NAMESPACE" \
    --body '{"contentIds": ["W1koHos4", "pye2eovW", "jVJKKTfV"]}' \
    > test.out 2>&1
eval_tap $? 59 'PublicGetContentBulk' test.out

#- 60 GetFollowedContent
./ng net.accelbyte.sdk.cli.Main ugc getFollowedContent \
    --namespace "$AB_NAMESPACE" \
    --limit '12' \
    --offset '90' \
    > test.out 2>&1
eval_tap $? 60 'GetFollowedContent' test.out

#- 61 GetLikedContent
./ng net.accelbyte.sdk.cli.Main ugc getLikedContent \
    --namespace "$AB_NAMESPACE" \
    --isofficial  \
    --limit '80' \
    --name 'UfpuRMeJ' \
    --offset '61' \
    --orderby 'yRZM3rik' \
    --sortby '96PaRCYi' \
    --subtype 'ZV7MMbpw' \
    --tags 'mHamORLk,aezMFL2N,vdOCYZPm' \
    --type 'EA3bX7UW' \
    > test.out 2>&1
eval_tap $? 61 'GetLikedContent' test.out

#- 62 PublicGetContentBulkByShareCodes
./ng net.accelbyte.sdk.cli.Main ugc publicGetContentBulkByShareCodes \
    --namespace "$AB_NAMESPACE" \
    --body '{"shareCodes": ["HHF1O0eJ", "XmHYRP30", "9CfuXl4p"]}' \
    > test.out 2>&1
eval_tap $? 62 'PublicGetContentBulkByShareCodes' test.out

#- 63 PublicDownloadContentByShareCode
./ng net.accelbyte.sdk.cli.Main ugc publicDownloadContentByShareCode \
    --namespace "$AB_NAMESPACE" \
    --shareCode '1C5Zdxch' \
    > test.out 2>&1
eval_tap $? 63 'PublicDownloadContentByShareCode' test.out

#- 64 PublicDownloadContentByContentID
./ng net.accelbyte.sdk.cli.Main ugc publicDownloadContentByContentID \
    --contentId 'WjZMRf7e' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 64 'PublicDownloadContentByContentID' test.out

#- 65 AddDownloadCount
./ng net.accelbyte.sdk.cli.Main ugc addDownloadCount \
    --contentId 'ES6j20wg' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 65 'AddDownloadCount' test.out

#- 66 UpdateContentLikeStatus
./ng net.accelbyte.sdk.cli.Main ugc updateContentLikeStatus \
    --contentId 'K6FASQwQ' \
    --namespace "$AB_NAMESPACE" \
    --body '{"likeStatus": false}' \
    > test.out 2>&1
eval_tap $? 66 'UpdateContentLikeStatus' test.out

#- 67 PublicDownloadContentPreview
./ng net.accelbyte.sdk.cli.Main ugc publicDownloadContentPreview \
    --contentId 'JP2pf0N8' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 67 'PublicDownloadContentPreview' test.out

#- 68 GetTag
./ng net.accelbyte.sdk.cli.Main ugc getTag \
    --namespace "$AB_NAMESPACE" \
    --limit '73' \
    --offset '40' \
    > test.out 2>&1
eval_tap $? 68 'GetTag' test.out

#- 69 GetType
./ng net.accelbyte.sdk.cli.Main ugc getType \
    --namespace "$AB_NAMESPACE" \
    --limit '38' \
    --offset '55' \
    > test.out 2>&1
eval_tap $? 69 'GetType' test.out

#- 70 PublicSearchCreator
./ng net.accelbyte.sdk.cli.Main ugc publicSearchCreator \
    --namespace "$AB_NAMESPACE" \
    --limit '88' \
    --offset '5' \
    --orderby 'GONwEHwu' \
    --sortby 'qFZT3zPo' \
    > test.out 2>&1
eval_tap $? 70 'PublicSearchCreator' test.out

#- 71 GetFollowedUsers
./ng net.accelbyte.sdk.cli.Main ugc getFollowedUsers \
    --namespace "$AB_NAMESPACE" \
    --limit '59' \
    --offset '58' \
    > test.out 2>&1
eval_tap $? 71 'GetFollowedUsers' test.out

#- 72 PublicGetCreator
./ng net.accelbyte.sdk.cli.Main ugc publicGetCreator \
    --namespace "$AB_NAMESPACE" \
    --userId 'btCJvzt0' \
    > test.out 2>&1
eval_tap $? 72 'PublicGetCreator' test.out

#- 73 GetChannels
./ng net.accelbyte.sdk.cli.Main ugc getChannels \
    --namespace "$AB_NAMESPACE" \
    --userId 'OJyD0Mgk' \
    --limit '48' \
    --name 'ad7Hyf9K' \
    --offset '58' \
    > test.out 2>&1
eval_tap $? 73 'GetChannels' test.out

#- 74 PublicCreateChannel
./ng net.accelbyte.sdk.cli.Main ugc publicCreateChannel \
    --namespace "$AB_NAMESPACE" \
    --userId 'ZrvikBBR' \
    --body '{"name": "NmoocjhC"}' \
    > test.out 2>&1
eval_tap $? 74 'PublicCreateChannel' test.out

#- 75 DeleteAllUserChannel
./ng net.accelbyte.sdk.cli.Main ugc deleteAllUserChannel \
    --namespace "$AB_NAMESPACE" \
    --userId 'erIUXAGP' \
    > test.out 2>&1
eval_tap $? 75 'DeleteAllUserChannel' test.out

#- 76 UpdateChannel
./ng net.accelbyte.sdk.cli.Main ugc updateChannel \
    --channelId 'SMPjb758' \
    --namespace "$AB_NAMESPACE" \
    --userId 'RguyAdyB' \
    --body '{"name": "LfQNAfgI"}' \
    > test.out 2>&1
eval_tap $? 76 'UpdateChannel' test.out

#- 77 DeleteChannel
./ng net.accelbyte.sdk.cli.Main ugc deleteChannel \
    --channelId 'HPJykrfZ' \
    --namespace "$AB_NAMESPACE" \
    --userId '0h2C3smp' \
    > test.out 2>&1
eval_tap $? 77 'DeleteChannel' test.out

#- 78 CreateContentDirect
eval_tap 0 78 'CreateContentDirect # SKIP deprecated' test.out

#- 79 CreateContentS3
./ng net.accelbyte.sdk.cli.Main ugc createContentS3 \
    --channelId 'TvVJ4WDr' \
    --namespace "$AB_NAMESPACE" \
    --userId 'o3KiqWqb' \
    --body '{"contentType": "sVCa3jgH", "customAttributes": {"Jpz0GW8Z": {}, "dQLYbPy2": {}, "b03h3yAi": {}}, "fileExtension": "mGbNOdea", "name": "krHrIY9I", "preview": "QusEdpTH", "previewMetadata": {"previewContentType": "MHspLFaj", "previewFileExtension": "fkw2JKXY"}, "subType": "px6ARVlE", "tags": ["DLdJfnHC", "8A1niHlT", "lALUAbMh"], "type": "V7OLPQf4"}' \
    > test.out 2>&1
eval_tap $? 79 'CreateContentS3' test.out

#- 80 PublicUpdateContentByShareCode
./ng net.accelbyte.sdk.cli.Main ugc publicUpdateContentByShareCode \
    --channelId 'NkjpE1ar' \
    --namespace "$AB_NAMESPACE" \
    --shareCode 'Y6TbxQfS' \
    --userId 'bHILJ2jg' \
    --body '{"contentType": "6p1bui7p", "customAttributes": {"ESGooazX": {}, "GMwM7zxH": {}, "ywWGRRpt": {}}, "fileExtension": "P5gBryph", "name": "aFVHcHZc", "payload": "OsLkBskD", "preview": "9Spo1MAZ", "previewMetadata": {"previewContentType": "gqk29HR9", "previewFileExtension": "acuSv3kB"}, "subType": "Xl1SG7v9", "tags": ["zl6Nh8zN", "welWnoJ3", "GTog8HNp"], "type": "4mSqrli9", "updateContentFile": true}' \
    > test.out 2>&1
eval_tap $? 80 'PublicUpdateContentByShareCode' test.out

#- 81 UpdateContentS3
./ng net.accelbyte.sdk.cli.Main ugc updateContentS3 \
    --channelId '4AXj3Bb4' \
    --contentId 'jfIKHihR' \
    --namespace "$AB_NAMESPACE" \
    --userId 'rv2NEyfO' \
    --body '{"contentType": "zDL0NbiM", "customAttributes": {"9hYP7tne": {}, "05nXQGrz": {}, "VOE3psWI": {}}, "fileExtension": "J9z80wUk", "name": "2J5Ip5tL", "payload": "g3xM0kqe", "preview": "gtG7CDsb", "previewMetadata": {"previewContentType": "cJL8WU5z", "previewFileExtension": "l04DiP8I"}, "subType": "oiMY3BvV", "tags": ["HqNajQOk", "uhQB9jFK", "QiqDrmK9"], "type": "LaGE2WFf", "updateContentFile": true}' \
    > test.out 2>&1
eval_tap $? 81 'UpdateContentS3' test.out

#- 82 PublicDeleteContentByShareCode
./ng net.accelbyte.sdk.cli.Main ugc publicDeleteContentByShareCode \
    --channelId 'LgnXtsDx' \
    --namespace "$AB_NAMESPACE" \
    --shareCode 'x0zp4hmx' \
    --userId 'lfgq4n5i' \
    > test.out 2>&1
eval_tap $? 82 'PublicDeleteContentByShareCode' test.out

#- 83 UpdateContentDirect
eval_tap 0 83 'UpdateContentDirect # SKIP deprecated' test.out

#- 84 DeleteContent
./ng net.accelbyte.sdk.cli.Main ugc deleteContent \
    --channelId 'Sls59VRj' \
    --contentId 'P0r5dFMK' \
    --namespace "$AB_NAMESPACE" \
    --userId 'DtMKIx4l' \
    > test.out 2>&1
eval_tap $? 84 'DeleteContent' test.out

#- 85 UpdateContentShareCode
./ng net.accelbyte.sdk.cli.Main ugc updateContentShareCode \
    --channelId 'ca0pSiIR' \
    --contentId 'XqFtpA9N' \
    --namespace "$AB_NAMESPACE" \
    --userId 'WiXWdm9N' \
    --body '{"shareCode": "wYPLquku"}' \
    > test.out 2>&1
eval_tap $? 85 'UpdateContentShareCode' test.out

#- 86 PublicGetUserContent
./ng net.accelbyte.sdk.cli.Main ugc publicGetUserContent \
    --namespace "$AB_NAMESPACE" \
    --userId 'qpAEGDMj' \
    --limit '62' \
    --offset '44' \
    > test.out 2>&1
eval_tap $? 86 'PublicGetUserContent' test.out

#- 87 DeleteAllUserContents
./ng net.accelbyte.sdk.cli.Main ugc deleteAllUserContents \
    --namespace "$AB_NAMESPACE" \
    --userId '2s9YkK7x' \
    > test.out 2>&1
eval_tap $? 87 'DeleteAllUserContents' test.out

#- 88 UpdateScreenshots
./ng net.accelbyte.sdk.cli.Main ugc updateScreenshots \
    --contentId 'P9tvpkHq' \
    --namespace "$AB_NAMESPACE" \
    --userId 'y4HmZFrn' \
    --body '{"screenshots": [{"description": "amTrSdc2", "screenshotId": "afvc8CRf"}, {"description": "6LJC7OGE", "screenshotId": "Vbh8IpGH"}, {"description": "La8swtzW", "screenshotId": "LG7Yqgt2"}]}' \
    > test.out 2>&1
eval_tap $? 88 'UpdateScreenshots' test.out

#- 89 UploadContentScreenshot
./ng net.accelbyte.sdk.cli.Main ugc uploadContentScreenshot \
    --contentId 'O47UIIKI' \
    --namespace "$AB_NAMESPACE" \
    --userId 'wu2QuVho' \
    --body '{"screenshots": [{"contentType": "dD7N710Q", "description": "IGIvisiB", "fileExtension": "jpg"}, {"contentType": "U9bP1kjF", "description": "PYYnT7d0", "fileExtension": "jpg"}, {"contentType": "TjhmWHaO", "description": "rcUU4H0a", "fileExtension": "jpg"}]}' \
    > test.out 2>&1
eval_tap $? 89 'UploadContentScreenshot' test.out

#- 90 DeleteContentScreenshot
./ng net.accelbyte.sdk.cli.Main ugc deleteContentScreenshot \
    --contentId 'N0yMmjUR' \
    --namespace "$AB_NAMESPACE" \
    --screenshotId 'rgUzHaxg' \
    --userId 'p71CjFL7' \
    > test.out 2>&1
eval_tap $? 90 'DeleteContentScreenshot' test.out

#- 91 UpdateUserFollowStatus
./ng net.accelbyte.sdk.cli.Main ugc updateUserFollowStatus \
    --namespace "$AB_NAMESPACE" \
    --userId 'v3UPtsGj' \
    --body '{"followStatus": false}' \
    > test.out 2>&1
eval_tap $? 91 'UpdateUserFollowStatus' test.out

#- 92 GetPublicFollowers
./ng net.accelbyte.sdk.cli.Main ugc getPublicFollowers \
    --namespace "$AB_NAMESPACE" \
    --userId 'YvnhgIi5' \
    --limit '10' \
    --offset '34' \
    > test.out 2>&1
eval_tap $? 92 'GetPublicFollowers' test.out

#- 93 GetPublicFollowing
./ng net.accelbyte.sdk.cli.Main ugc getPublicFollowing \
    --namespace "$AB_NAMESPACE" \
    --userId 'lBIdzDRt' \
    --limit '83' \
    --offset '69' \
    > test.out 2>&1
eval_tap $? 93 'GetPublicFollowing' test.out

#- 94 GetGroups
./ng net.accelbyte.sdk.cli.Main ugc getGroups \
    --namespace "$AB_NAMESPACE" \
    --userId 'eaGOwyeq' \
    --limit '43' \
    --offset '79' \
    > test.out 2>&1
eval_tap $? 94 'GetGroups' test.out

#- 95 CreateGroup
./ng net.accelbyte.sdk.cli.Main ugc createGroup \
    --namespace "$AB_NAMESPACE" \
    --userId 'kGjzkWlQ' \
    --body '{"contents": ["3HdwsxjP", "rBe7GS2I", "ru51qfvv"], "name": "2IHjr6WP"}' \
    > test.out 2>&1
eval_tap $? 95 'CreateGroup' test.out

#- 96 DeleteAllUserGroup
./ng net.accelbyte.sdk.cli.Main ugc deleteAllUserGroup \
    --namespace "$AB_NAMESPACE" \
    --userId 'N9mHBB9P' \
    > test.out 2>&1
eval_tap $? 96 'DeleteAllUserGroup' test.out

#- 97 GetGroup
./ng net.accelbyte.sdk.cli.Main ugc getGroup \
    --groupId '8zmDR8Kl' \
    --namespace "$AB_NAMESPACE" \
    --userId 'eWZwPzDN' \
    > test.out 2>&1
eval_tap $? 97 'GetGroup' test.out

#- 98 UpdateGroup
./ng net.accelbyte.sdk.cli.Main ugc updateGroup \
    --groupId 'eeJNuO5H' \
    --namespace "$AB_NAMESPACE" \
    --userId 'BqS4SKwu' \
    --body '{"contents": ["SCH7sq5h", "55XAUmX4", "094uBjq2"], "name": "BaY2oV6b"}' \
    > test.out 2>&1
eval_tap $? 98 'UpdateGroup' test.out

#- 99 DeleteGroup
./ng net.accelbyte.sdk.cli.Main ugc deleteGroup \
    --groupId 'Xsx9wV2W' \
    --namespace "$AB_NAMESPACE" \
    --userId 'V5VFi9mW' \
    > test.out 2>&1
eval_tap $? 99 'DeleteGroup' test.out

#- 100 GetGroupContent
./ng net.accelbyte.sdk.cli.Main ugc getGroupContent \
    --groupId 'NHeTF91X' \
    --namespace "$AB_NAMESPACE" \
    --userId 'kvKYoPBY' \
    --limit '65' \
    --offset '57' \
    > test.out 2>&1
eval_tap $? 100 'GetGroupContent' test.out

#- 101 DeleteAllUserStates
./ng net.accelbyte.sdk.cli.Main ugc deleteAllUserStates \
    --namespace "$AB_NAMESPACE" \
    --userId 'KmlSRZOk' \
    > test.out 2>&1
eval_tap $? 101 'DeleteAllUserStates' test.out

#- 102 AdminGetContentByChannelIDV2
./ng net.accelbyte.sdk.cli.Main ugc adminGetContentByChannelIDV2 \
    --channelId '4GGbNXx3' \
    --namespace "$AB_NAMESPACE" \
    --limit '63' \
    --name 'cT7cRvEG' \
    --offset '54' \
    --sortBy 'mpjDpwgY' \
    > test.out 2>&1
eval_tap $? 102 'AdminGetContentByChannelIDV2' test.out

#- 103 AdminCreateContentV2
./ng net.accelbyte.sdk.cli.Main ugc adminCreateContentV2 \
    --channelId 'QIdfrpUD' \
    --namespace "$AB_NAMESPACE" \
    --body '{"contentType": "vIaogCP9", "customAttributes": {"lUFZwuNz": {}, "d7fDUgm2": {}, "T4JXZoOa": {}}, "fileExtension": "iV5P0jQe", "name": "lO7otXfO", "shareCode": "xkxC9ts4", "subType": "Jg8dS1P1", "tags": ["A41M7Fq5", "16Vy7lfS", "EdTTNJIX"], "type": "bbRd2t4U"}' \
    > test.out 2>&1
eval_tap $? 103 'AdminCreateContentV2' test.out

#- 104 AdminDeleteOfficialContentV2
./ng net.accelbyte.sdk.cli.Main ugc adminDeleteOfficialContentV2 \
    --channelId 'q4MS7KnV' \
    --contentId '6sNVtWR5' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 104 'AdminDeleteOfficialContentV2' test.out

#- 105 AdminUpdateOfficialContentV2
./ng net.accelbyte.sdk.cli.Main ugc adminUpdateOfficialContentV2 \
    --channelId 'MgI1ewEh' \
    --contentId 'Pw1u6vXB' \
    --namespace "$AB_NAMESPACE" \
    --body '{"customAttributes": {"tl0uYzs1": {}, "sCFBWzF7": {}, "Or8Fw18S": {}}, "name": "UvrayN3B", "shareCode": "h4M5rluV", "subType": "i3HpUvzf", "tags": ["q7DQDlfo", "4CuDWb6B", "ZzfthSlL"], "type": "oDR0rAHy"}' \
    > test.out 2>&1
eval_tap $? 105 'AdminUpdateOfficialContentV2' test.out

#- 106 AdminUpdateOfficialContentFileLocation
./ng net.accelbyte.sdk.cli.Main ugc adminUpdateOfficialContentFileLocation \
    --channelId 'czsf6hbW' \
    --contentId 'LWeT35kP' \
    --namespace "$AB_NAMESPACE" \
    --body '{"fileExtension": "PGGAhSJ1", "fileLocation": "kMPE81CZ"}' \
    > test.out 2>&1
eval_tap $? 106 'AdminUpdateOfficialContentFileLocation' test.out

#- 107 AdminGenerateOfficialContentUploadURLV2
./ng net.accelbyte.sdk.cli.Main ugc adminGenerateOfficialContentUploadURLV2 \
    --channelId 'BEasxXZM' \
    --contentId 'McrAAxYo' \
    --namespace "$AB_NAMESPACE" \
    --body '{"contentType": "w7MivG2S", "fileExtension": "rGZutmR7"}' \
    > test.out 2>&1
eval_tap $? 107 'AdminGenerateOfficialContentUploadURLV2' test.out

#- 108 AdminGetConfigs
./ng net.accelbyte.sdk.cli.Main ugc adminGetConfigs \
    --namespace "$AB_NAMESPACE" \
    --limit '80' \
    --offset '82' \
    > test.out 2>&1
eval_tap $? 108 'AdminGetConfigs' test.out

#- 109 AdminUpdateConfig
./ng net.accelbyte.sdk.cli.Main ugc adminUpdateConfig \
    --key '51yCrjUg' \
    --namespace "$AB_NAMESPACE" \
    --body '{"value": "tik60iyK"}' \
    > test.out 2>&1
eval_tap $? 109 'AdminUpdateConfig' test.out

#- 110 AdminListContentV2
./ng net.accelbyte.sdk.cli.Main ugc adminListContentV2 \
    --namespace "$AB_NAMESPACE" \
    --isOfficial  \
    --limit '21' \
    --name 'SzGcIZzR' \
    --offset '70' \
    --sortBy '9pc60euo' \
    --subType '5IjHX4D2' \
    --tags 'j7onDbqK,PpPfeFIr,HQagvj74' \
    --type '6WN6uKLG' \
    > test.out 2>&1
eval_tap $? 110 'AdminListContentV2' test.out

#- 111 AdminBulkGetContentByIDsV2
./ng net.accelbyte.sdk.cli.Main ugc adminBulkGetContentByIDsV2 \
    --namespace "$AB_NAMESPACE" \
    --body '{"contentIds": ["YGHMIaS1", "VpMciXHJ", "tZT7jk8b"]}' \
    > test.out 2>&1
eval_tap $? 111 'AdminBulkGetContentByIDsV2' test.out

#- 112 AdminGetContentBulkByShareCodesV2
./ng net.accelbyte.sdk.cli.Main ugc adminGetContentBulkByShareCodesV2 \
    --namespace "$AB_NAMESPACE" \
    --body '{"shareCodes": ["xwkhe2jC", "PNyHXgYS", "BDYTYwPp"]}' \
    > test.out 2>&1
eval_tap $? 112 'AdminGetContentBulkByShareCodesV2' test.out

#- 113 AdminGetContentByShareCodeV2
./ng net.accelbyte.sdk.cli.Main ugc adminGetContentByShareCodeV2 \
    --namespace "$AB_NAMESPACE" \
    --shareCode 'aREuFliG' \
    > test.out 2>&1
eval_tap $? 113 'AdminGetContentByShareCodeV2' test.out

#- 114 AdminGetContentByContentIDV2
./ng net.accelbyte.sdk.cli.Main ugc adminGetContentByContentIDV2 \
    --contentId '4H1UOvLX' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 114 'AdminGetContentByContentIDV2' test.out

#- 115 RollbackContentVersionV2
./ng net.accelbyte.sdk.cli.Main ugc rollbackContentVersionV2 \
    --contentId 'QUXYkcvb' \
    --namespace "$AB_NAMESPACE" \
    --versionId 'KixXpKyT' \
    > test.out 2>&1
eval_tap $? 115 'RollbackContentVersionV2' test.out

#- 116 AdminUpdateScreenshotsV2
./ng net.accelbyte.sdk.cli.Main ugc adminUpdateScreenshotsV2 \
    --contentId 'KuOhearo' \
    --namespace "$AB_NAMESPACE" \
    --body '{"screenshots": [{"description": "5JabBhkH", "screenshotId": "GPCXktcR"}, {"description": "6q9B4VYm", "screenshotId": "XcPPRNVY"}, {"description": "wxzMY30G", "screenshotId": "NcO27i40"}]}' \
    > test.out 2>&1
eval_tap $? 116 'AdminUpdateScreenshotsV2' test.out

#- 117 AdminUploadContentScreenshotV2
./ng net.accelbyte.sdk.cli.Main ugc adminUploadContentScreenshotV2 \
    --contentId 'HS3ZnIwq' \
    --namespace "$AB_NAMESPACE" \
    --body '{"screenshots": [{"contentType": "a36l2JmA", "description": "aCysb6Iu", "fileExtension": "jfif"}, {"contentType": "Wiv2zZ55", "description": "bzesxjqI", "fileExtension": "png"}, {"contentType": "VqvpKwSf", "description": "IDWqMeGR", "fileExtension": "jpeg"}]}' \
    > test.out 2>&1
eval_tap $? 117 'AdminUploadContentScreenshotV2' test.out

#- 118 AdminDeleteContentScreenshotV2
./ng net.accelbyte.sdk.cli.Main ugc adminDeleteContentScreenshotV2 \
    --contentId 'E1QNr6wF' \
    --namespace "$AB_NAMESPACE" \
    --screenshotId 'QjdE90NN' \
    > test.out 2>&1
eval_tap $? 118 'AdminDeleteContentScreenshotV2' test.out

#- 119 ListContentVersionsV2
./ng net.accelbyte.sdk.cli.Main ugc listContentVersionsV2 \
    --contentId 'FeZ8mInX' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 119 'ListContentVersionsV2' test.out

#- 120 AdminGetOfficialGroupContentsV2
./ng net.accelbyte.sdk.cli.Main ugc adminGetOfficialGroupContentsV2 \
    --groupId 'wbTafC1J' \
    --namespace "$AB_NAMESPACE" \
    --limit '10' \
    --offset '95' \
    > test.out 2>&1
eval_tap $? 120 'AdminGetOfficialGroupContentsV2' test.out

#- 121 AdminListStagingContents
./ng net.accelbyte.sdk.cli.Main ugc adminListStagingContents \
    --namespace "$AB_NAMESPACE" \
    --limit '85' \
    --offset '80' \
    --sortBy 'V2iWh7JB' \
    --status 'jpGMV5hF' \
    > test.out 2>&1
eval_tap $? 121 'AdminListStagingContents' test.out

#- 122 AdminGetStagingContentByID
./ng net.accelbyte.sdk.cli.Main ugc adminGetStagingContentByID \
    --contentId 'DSRsY39a' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 122 'AdminGetStagingContentByID' test.out

#- 123 AdminApproveStagingContent
./ng net.accelbyte.sdk.cli.Main ugc adminApproveStagingContent \
    --contentId 'ZxNVG0BH' \
    --namespace "$AB_NAMESPACE" \
    --body '{"approved": false, "note": "qZrHMZYa"}' \
    > test.out 2>&1
eval_tap $? 123 'AdminApproveStagingContent' test.out

#- 124 AdminUpdateContentByShareCodeV2
./ng net.accelbyte.sdk.cli.Main ugc adminUpdateContentByShareCodeV2 \
    --channelId 'uVnSxBCP' \
    --namespace "$AB_NAMESPACE" \
    --shareCode 'N6dkT7AL' \
    --userId 'VacPRg3S' \
    --body '{"customAttributes": {"47mp8x9r": {}, "4LBjN2rg": {}, "HPAhBtsf": {}}, "name": "hnWfkGCy", "shareCode": "XLF9LbYt", "subType": "Rm802cTe", "tags": ["193qsOEY", "8vJtQuNt", "PEz1YR6l"], "type": "bFdPTRZ7"}' \
    > test.out 2>&1
eval_tap $? 124 'AdminUpdateContentByShareCodeV2' test.out

#- 125 AdminDeleteContentByShareCodeV2
./ng net.accelbyte.sdk.cli.Main ugc adminDeleteContentByShareCodeV2 \
    --channelId 'ZG6P3Rb7' \
    --namespace "$AB_NAMESPACE" \
    --shareCode 'V4RUaztU' \
    --userId 'iwk0osM4' \
    > test.out 2>&1
eval_tap $? 125 'AdminDeleteContentByShareCodeV2' test.out

#- 126 AdminDeleteUserContentV2
./ng net.accelbyte.sdk.cli.Main ugc adminDeleteUserContentV2 \
    --channelId 'G6O4ZARS' \
    --contentId 'yne6oiUj' \
    --namespace "$AB_NAMESPACE" \
    --userId 'kku0NK3r' \
    > test.out 2>&1
eval_tap $? 126 'AdminDeleteUserContentV2' test.out

#- 127 AdminUpdateUserContentV2
./ng net.accelbyte.sdk.cli.Main ugc adminUpdateUserContentV2 \
    --channelId 'lXr7N3UC' \
    --contentId 'H4ukKRHD' \
    --namespace "$AB_NAMESPACE" \
    --userId '0y0IENnm' \
    --body '{"customAttributes": {"ta0Ec9Vb": {}, "8CGlPzNr": {}, "sFVMZEcb": {}}, "name": "oDCYZ7ZX", "shareCode": "SrwrHKf5", "subType": "0uhWJN2C", "tags": ["JFU1o8xt", "MYXSr3y8", "XJU6MYIO"], "type": "RYVkcJkg"}' \
    > test.out 2>&1
eval_tap $? 127 'AdminUpdateUserContentV2' test.out

#- 128 AdminUpdateUserContentFileLocation
./ng net.accelbyte.sdk.cli.Main ugc adminUpdateUserContentFileLocation \
    --channelId 'ngiJjrI9' \
    --contentId 'nApcScDp' \
    --namespace "$AB_NAMESPACE" \
    --userId 'wyi5GdMr' \
    --body '{"fileExtension": "OSP1pcBS", "fileLocation": "jESUNaMu"}' \
    > test.out 2>&1
eval_tap $? 128 'AdminUpdateUserContentFileLocation' test.out

#- 129 AdminGenerateUserContentUploadURLV2
./ng net.accelbyte.sdk.cli.Main ugc adminGenerateUserContentUploadURLV2 \
    --channelId 'LBY6ZKg0' \
    --contentId 'MWzEfvBu' \
    --namespace "$AB_NAMESPACE" \
    --userId 'hGAu5jEu' \
    --body '{"contentType": "u8EPJkNW", "fileExtension": "1YEchCF4"}' \
    > test.out 2>&1
eval_tap $? 129 'AdminGenerateUserContentUploadURLV2' test.out

#- 130 AdminGetContentByUserIDV2
./ng net.accelbyte.sdk.cli.Main ugc adminGetContentByUserIDV2 \
    --namespace "$AB_NAMESPACE" \
    --userId 'jxHiKUmr' \
    --limit '94' \
    --offset '2' \
    --sortBy 'wl7ZYvY3' \
    > test.out 2>&1
eval_tap $? 130 'AdminGetContentByUserIDV2' test.out

#- 131 AdminUpdateContentHideStatusV2
./ng net.accelbyte.sdk.cli.Main ugc adminUpdateContentHideStatusV2 \
    --contentId 'cIfMigty' \
    --namespace "$AB_NAMESPACE" \
    --userId '00t5bENv' \
    --body '{"isHidden": true}' \
    > test.out 2>&1
eval_tap $? 131 'AdminUpdateContentHideStatusV2' test.out

#- 132 AdminGetUserGroupContentsV2
./ng net.accelbyte.sdk.cli.Main ugc adminGetUserGroupContentsV2 \
    --groupId 'irnSTqwM' \
    --namespace "$AB_NAMESPACE" \
    --userId 'VyCCWp9D' \
    --limit '55' \
    --offset '33' \
    > test.out 2>&1
eval_tap $? 132 'AdminGetUserGroupContentsV2' test.out

#- 133 AdminListUserStagingContents
./ng net.accelbyte.sdk.cli.Main ugc adminListUserStagingContents \
    --namespace "$AB_NAMESPACE" \
    --userId 'Guh0o6Xx' \
    --limit '72' \
    --offset '90' \
    --sortBy 'mmwNszQP' \
    --status 'ZYnXMo2Z' \
    > test.out 2>&1
eval_tap $? 133 'AdminListUserStagingContents' test.out

#- 134 PublicGetContentByChannelIDV2
./ng net.accelbyte.sdk.cli.Main ugc publicGetContentByChannelIDV2 \
    --channelId 'dT5OxiJF' \
    --namespace "$AB_NAMESPACE" \
    --limit '42' \
    --name 'bSyHUaXG' \
    --offset '42' \
    --sortBy 'lwBQJe2i' \
    > test.out 2>&1
eval_tap $? 134 'PublicGetContentByChannelIDV2' test.out

#- 135 PublicListContentV2
./ng net.accelbyte.sdk.cli.Main ugc publicListContentV2 \
    --namespace "$AB_NAMESPACE" \
    --isOfficial  \
    --limit '74' \
    --name 'aFbdIdrJ' \
    --offset '67' \
    --sortBy '3wmsru82' \
    --subType '1hE3SFaC' \
    --tags 'RyWRzGI5,CLUAOVc7,D9CvmItX' \
    --type '1Y3zYHXR' \
    > test.out 2>&1
eval_tap $? 135 'PublicListContentV2' test.out

#- 136 PublicBulkGetContentByIDV2
./ng net.accelbyte.sdk.cli.Main ugc publicBulkGetContentByIDV2 \
    --namespace "$AB_NAMESPACE" \
    --body '{"contentIds": ["ioLlkSuD", "tc3ZQbbS", "NJqL77SA"]}' \
    > test.out 2>&1
eval_tap $? 136 'PublicBulkGetContentByIDV2' test.out

#- 137 PublicGetContentBulkByShareCodesV2
./ng net.accelbyte.sdk.cli.Main ugc publicGetContentBulkByShareCodesV2 \
    --namespace "$AB_NAMESPACE" \
    --body '{"shareCodes": ["1322DtCz", "NIjeRz7d", "X6NUmyM9"]}' \
    > test.out 2>&1
eval_tap $? 137 'PublicGetContentBulkByShareCodesV2' test.out

#- 138 PublicGetContentByShareCodeV2
./ng net.accelbyte.sdk.cli.Main ugc publicGetContentByShareCodeV2 \
    --namespace "$AB_NAMESPACE" \
    --shareCode 'tqwj1yD5' \
    > test.out 2>&1
eval_tap $? 138 'PublicGetContentByShareCodeV2' test.out

#- 139 PublicGetContentByIDV2
./ng net.accelbyte.sdk.cli.Main ugc publicGetContentByIDV2 \
    --contentId 'DOF6W3Xx' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 139 'PublicGetContentByIDV2' test.out

#- 140 PublicAddDownloadCountV2
./ng net.accelbyte.sdk.cli.Main ugc publicAddDownloadCountV2 \
    --contentId 'sWY1DuhF' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 140 'PublicAddDownloadCountV2' test.out

#- 141 PublicListContentDownloaderV2
./ng net.accelbyte.sdk.cli.Main ugc publicListContentDownloaderV2 \
    --contentId 'mk84ViOp' \
    --namespace "$AB_NAMESPACE" \
    --limit '29' \
    --offset '75' \
    --sortBy 'd2pFwNmV' \
    --userId 'NIz2sKZL' \
    > test.out 2>&1
eval_tap $? 141 'PublicListContentDownloaderV2' test.out

#- 142 PublicListContentLikeV2
./ng net.accelbyte.sdk.cli.Main ugc publicListContentLikeV2 \
    --contentId 'vmwwxdLq' \
    --namespace "$AB_NAMESPACE" \
    --limit '3' \
    --offset '99' \
    --sortBy '2MtZBr1p' \
    > test.out 2>&1
eval_tap $? 142 'PublicListContentLikeV2' test.out

#- 143 UpdateContentLikeStatusV2
./ng net.accelbyte.sdk.cli.Main ugc updateContentLikeStatusV2 \
    --contentId 'IpxvUYrp' \
    --namespace "$AB_NAMESPACE" \
    --body '{"likeStatus": false}' \
    > test.out 2>&1
eval_tap $? 143 'UpdateContentLikeStatusV2' test.out

#- 144 PublicCreateContentV2
./ng net.accelbyte.sdk.cli.Main ugc publicCreateContentV2 \
    --channelId 'Pf8SbmW5' \
    --namespace "$AB_NAMESPACE" \
    --userId 'zmz1xKDs' \
    --body '{"contentType": "jYqQt8ej", "customAttributes": {"RvE8qPb3": {}, "Ehe9c2ST": {}, "7lUSsBDT": {}}, "fileExtension": "LrXAPhlC", "name": "xCzXgkIo", "subType": "CVzII7GQ", "tags": ["y8TBDmqK", "A9a9eJsJ", "gNs5MJxL"], "type": "nLTWi6JZ"}' \
    > test.out 2>&1
eval_tap $? 144 'PublicCreateContentV2' test.out

#- 145 PublicUpdateContentByShareCodeV2
./ng net.accelbyte.sdk.cli.Main ugc publicUpdateContentByShareCodeV2 \
    --channelId 'QjuH8Jr0' \
    --namespace "$AB_NAMESPACE" \
    --shareCode 'agbTJ0Qj' \
    --userId '65IIr1Mq' \
    --body '{"customAttributes": {"SA8xnisZ": {}, "zgvKTrt5": {}, "DQy7c22l": {}}, "name": "NHsKfblW", "subType": "4Hd2egQw", "tags": ["kUzyuUmL", "92MhD3as", "XDzrjNe9"], "type": "FuS8vlSa"}' \
    > test.out 2>&1
eval_tap $? 145 'PublicUpdateContentByShareCodeV2' test.out

#- 146 PublicDeleteContentByShareCodeV2
./ng net.accelbyte.sdk.cli.Main ugc publicDeleteContentByShareCodeV2 \
    --channelId 'ORF3zLSl' \
    --namespace "$AB_NAMESPACE" \
    --shareCode '0qbYnZ80' \
    --userId 'SNTIqTVP' \
    > test.out 2>&1
eval_tap $? 146 'PublicDeleteContentByShareCodeV2' test.out

#- 147 PublicDeleteContentV2
./ng net.accelbyte.sdk.cli.Main ugc publicDeleteContentV2 \
    --channelId 'wNuVy6sP' \
    --contentId 'HwoJ8lMh' \
    --namespace "$AB_NAMESPACE" \
    --userId 'snlaCqXY' \
    > test.out 2>&1
eval_tap $? 147 'PublicDeleteContentV2' test.out

#- 148 PublicUpdateContentV2
./ng net.accelbyte.sdk.cli.Main ugc publicUpdateContentV2 \
    --channelId 'eVX7Vtm8' \
    --contentId 'ZwHUnSz0' \
    --namespace "$AB_NAMESPACE" \
    --userId 'yZNutwpw' \
    --body '{"customAttributes": {"H6i7Ozag": {}, "8SfdhuRQ": {}, "pwtGcU5C": {}}, "name": "ebfxzelQ", "subType": "866RV4dY", "tags": ["5CQdYpRq", "HNlyxKpZ", "YmcBkngr"], "type": "pcTVODI0"}' \
    > test.out 2>&1
eval_tap $? 148 'PublicUpdateContentV2' test.out

#- 149 PublicUpdateContentFileLocation
./ng net.accelbyte.sdk.cli.Main ugc publicUpdateContentFileLocation \
    --channelId 'YD5XflDY' \
    --contentId 'yvFut5VE' \
    --namespace "$AB_NAMESPACE" \
    --userId 'bWwlUAL7' \
    --body '{"fileExtension": "J5FtZjvY", "fileLocation": "B5SI3uGk"}' \
    > test.out 2>&1
eval_tap $? 149 'PublicUpdateContentFileLocation' test.out

#- 150 UpdateContentShareCodeV2
./ng net.accelbyte.sdk.cli.Main ugc updateContentShareCodeV2 \
    --channelId 'UFRJ3klm' \
    --contentId 'LbFe3vrz' \
    --namespace "$AB_NAMESPACE" \
    --userId '28KsSSU1' \
    --body '{"shareCode": "IqocjCpa"}' \
    > test.out 2>&1
eval_tap $? 150 'UpdateContentShareCodeV2' test.out

#- 151 PublicGenerateContentUploadURLV2
./ng net.accelbyte.sdk.cli.Main ugc publicGenerateContentUploadURLV2 \
    --channelId 'FQL1fWUl' \
    --contentId 'idSjShkK' \
    --namespace "$AB_NAMESPACE" \
    --userId '0RTJ4j1l' \
    --body '{"contentType": "UkMge2qM", "fileExtension": "QUfINkv9"}' \
    > test.out 2>&1
eval_tap $? 151 'PublicGenerateContentUploadURLV2' test.out

#- 152 PublicGetContentByUserIDV2
./ng net.accelbyte.sdk.cli.Main ugc publicGetContentByUserIDV2 \
    --namespace "$AB_NAMESPACE" \
    --userId 'KIBZ2tur' \
    --limit '35' \
    --offset '23' \
    --sortBy '9bVTkrYG' \
    > test.out 2>&1
eval_tap $? 152 'PublicGetContentByUserIDV2' test.out

#- 153 UpdateScreenshotsV2
./ng net.accelbyte.sdk.cli.Main ugc updateScreenshotsV2 \
    --contentId 'qOl7h7dy' \
    --namespace "$AB_NAMESPACE" \
    --userId '6qTCvNI0' \
    --body '{"screenshots": [{"description": "B2KlISAg", "screenshotId": "zMEu7Q8f"}, {"description": "woDlWKAB", "screenshotId": "mrwe8ceB"}, {"description": "WLviykAz", "screenshotId": "xsg89WYx"}]}' \
    > test.out 2>&1
eval_tap $? 153 'UpdateScreenshotsV2' test.out

#- 154 UploadContentScreenshotV2
./ng net.accelbyte.sdk.cli.Main ugc uploadContentScreenshotV2 \
    --contentId 'np1fNBSz' \
    --namespace "$AB_NAMESPACE" \
    --userId 'TNztNRiC' \
    --body '{"screenshots": [{"contentType": "hIsuvVhz", "description": "YQjrUKA8", "fileExtension": "jfif"}, {"contentType": "5JOjz3Jr", "description": "EoYYacx4", "fileExtension": "jpeg"}, {"contentType": "o10jRQ0p", "description": "JmY1LZkZ", "fileExtension": "jpg"}]}' \
    > test.out 2>&1
eval_tap $? 154 'UploadContentScreenshotV2' test.out

#- 155 DeleteContentScreenshotV2
./ng net.accelbyte.sdk.cli.Main ugc deleteContentScreenshotV2 \
    --contentId 'kL5a3Et2' \
    --namespace "$AB_NAMESPACE" \
    --screenshotId 'gCx6Icto' \
    --userId 'Dzvt2YcS' \
    > test.out 2>&1
eval_tap $? 155 'DeleteContentScreenshotV2' test.out

#- 156 PublicGetGroupContentsV2
./ng net.accelbyte.sdk.cli.Main ugc publicGetGroupContentsV2 \
    --groupId 'AWqg5fVe' \
    --namespace "$AB_NAMESPACE" \
    --userId 'G6NWi8Me' \
    --limit '43' \
    --offset '6' \
    > test.out 2>&1
eval_tap $? 156 'PublicGetGroupContentsV2' test.out

#- 157 ListUserStagingContents
./ng net.accelbyte.sdk.cli.Main ugc listUserStagingContents \
    --namespace "$AB_NAMESPACE" \
    --userId 'vrYdgQWf' \
    --limit '82' \
    --offset '88' \
    --sortBy 'a7tV87Gz' \
    --status 'nWtsj0Yf' \
    > test.out 2>&1
eval_tap $? 157 'ListUserStagingContents' test.out

#- 158 GetUserStagingContentByID
./ng net.accelbyte.sdk.cli.Main ugc getUserStagingContentByID \
    --contentId 'jxcuPyxC' \
    --namespace "$AB_NAMESPACE" \
    --userId 'mRI75nOw' \
    > test.out 2>&1
eval_tap $? 158 'GetUserStagingContentByID' test.out

#- 159 UpdateStagingContent
./ng net.accelbyte.sdk.cli.Main ugc updateStagingContent \
    --contentId 'TdMobVuO' \
    --namespace "$AB_NAMESPACE" \
    --userId 'F1tAUseY' \
    --body '{"fileExtension": "f4WaKzEp", "fileLocation": "RjFpFKiN"}' \
    > test.out 2>&1
eval_tap $? 159 'UpdateStagingContent' test.out

#- 160 DeleteUserStagingContentByID
./ng net.accelbyte.sdk.cli.Main ugc deleteUserStagingContentByID \
    --contentId 'ZnfyEP7n' \
    --namespace "$AB_NAMESPACE" \
    --userId 'zgJmgjGx' \
    > test.out 2>&1
eval_tap $? 160 'DeleteUserStagingContentByID' test.out


rm -f "tmp.dat"

exit $EXIT_CODE