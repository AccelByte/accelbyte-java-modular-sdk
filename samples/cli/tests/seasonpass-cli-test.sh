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
echo "1..45"

#- 1 Login
./ng net.accelbyte.sdk.cli.Main loginClient \
    > test.out 2>&1
eval_tap $? 1 'Login' test.out

if [ $EXIT_CODE -ne 0 ]; then
  echo "Bail out! Login failed."
  exit $EXIT_CODE
fi

touch "tmp.dat"

#- 2 ExportSeason
./ng net.accelbyte.sdk.cli.Main seasonpass exportSeason \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 2 'ExportSeason' test.out

#- 3 QuerySeasons
./ng net.accelbyte.sdk.cli.Main seasonpass querySeasons \
    --namespace "$AB_NAMESPACE" \
    --limit '30' \
    --offset '10' \
    --status 'RETIRED,PUBLISHED,DRAFT' \
    > test.out 2>&1
eval_tap $? 3 'QuerySeasons' test.out

#- 4 CreateSeason
./ng net.accelbyte.sdk.cli.Main seasonpass createSeason \
    --namespace "$AB_NAMESPACE" \
    --body '{"autoClaim": true, "defaultLanguage": "CyIlfPNz", "defaultRequiredExp": 43, "draftStoreId": "afP66nqq", "end": "1975-11-19T00:00:00Z", "excessStrategy": {"currency": "lRPB0Ad7", "method": "NONE", "percentPerExp": 13}, "images": [{"as": "gK57peQ4", "caption": "QF9yXQZP", "height": 2, "imageUrl": "1TeB0dGH", "smallImageUrl": "zpgVoKU0", "width": 25}, {"as": "2o3hyiHf", "caption": "JbexrpZr", "height": 44, "imageUrl": "NZjqmqwh", "smallImageUrl": "4tAVOzxg", "width": 14}, {"as": "Kia3WYWW", "caption": "qD9CZFxG", "height": 12, "imageUrl": "6ZnuTJnd", "smallImageUrl": "ASfLJW5k", "width": 30}], "localizations": {"HG6Yuv75": {"description": "hf2OlxD2", "title": "WitsYncV"}, "thPs7OwA": {"description": "cCg72Ete", "title": "1TMTyHos"}, "HsGORU0S": {"description": "bZM0TuHL", "title": "5JmT7wKg"}}, "name": "3wyMEY47", "start": "1977-01-29T00:00:00Z", "tierItemId": "kWGAAsRC"}' \
    > test.out 2>&1
eval_tap $? 4 'CreateSeason' test.out

#- 5 GetCurrentSeason
./ng net.accelbyte.sdk.cli.Main seasonpass getCurrentSeason \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 5 'GetCurrentSeason' test.out

#- 6 BulkGetUserSeasonProgression
./ng net.accelbyte.sdk.cli.Main seasonpass bulkGetUserSeasonProgression \
    --namespace "$AB_NAMESPACE" \
    --body '{"userIds": ["WM1N84Gl", "CRC6zQ75", "EhWOFrKT"]}' \
    > test.out 2>&1
eval_tap $? 6 'BulkGetUserSeasonProgression' test.out

#- 7 GetSeason
./ng net.accelbyte.sdk.cli.Main seasonpass getSeason \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'SeOkDJHr' \
    > test.out 2>&1
eval_tap $? 7 'GetSeason' test.out

#- 8 DeleteSeason
./ng net.accelbyte.sdk.cli.Main seasonpass deleteSeason \
    --namespace "$AB_NAMESPACE" \
    --seasonId '6GNPZeYL' \
    > test.out 2>&1
eval_tap $? 8 'DeleteSeason' test.out

#- 9 UpdateSeason
./ng net.accelbyte.sdk.cli.Main seasonpass updateSeason \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'V5zVr67y' \
    --body '{"autoClaim": true, "defaultLanguage": "AfGUtszl", "defaultRequiredExp": 77, "draftStoreId": "A6VjXGpI", "end": "1971-02-26T00:00:00Z", "excessStrategy": {"currency": "jmSAs0ct", "method": "CURRENCY", "percentPerExp": 89}, "images": [{"as": "6sTXCp7M", "caption": "M0sc7dvw", "height": 95, "imageUrl": "RrPSe762", "smallImageUrl": "Sl3rqPOv", "width": 21}, {"as": "5XnhkimN", "caption": "3vnHWYwA", "height": 69, "imageUrl": "gQBUUNpv", "smallImageUrl": "uiPgwPF9", "width": 18}, {"as": "epPrHq6E", "caption": "3Mb5JUHT", "height": 97, "imageUrl": "WQFFfMCZ", "smallImageUrl": "6Txc2ijg", "width": 63}], "localizations": {"csA0Illk": {"description": "aCGQpLLQ", "title": "ADkVV48e"}, "qZtAqn3x": {"description": "SOEmfFoS", "title": "EVya7c2n"}, "uejQfspp": {"description": "PvIlSSLS", "title": "omMgHJsw"}}, "name": "ariulwK3", "start": "1995-05-28T00:00:00Z", "tierItemId": "28i0xHbA"}' \
    > test.out 2>&1
eval_tap $? 9 'UpdateSeason' test.out

#- 10 CloneSeason
./ng net.accelbyte.sdk.cli.Main seasonpass cloneSeason \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'AkiU5hnU' \
    --body '{"end": "1976-10-10T00:00:00Z", "name": "YZF6WH8D", "start": "1974-04-10T00:00:00Z"}' \
    > test.out 2>&1
eval_tap $? 10 'CloneSeason' test.out

#- 11 GetFullSeason
./ng net.accelbyte.sdk.cli.Main seasonpass getFullSeason \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'ftwEU5fE' \
    > test.out 2>&1
eval_tap $? 11 'GetFullSeason' test.out

#- 12 QueryPasses
./ng net.accelbyte.sdk.cli.Main seasonpass queryPasses \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'XR8HH6kP' \
    > test.out 2>&1
eval_tap $? 12 'QueryPasses' test.out

#- 13 CreatePass
./ng net.accelbyte.sdk.cli.Main seasonpass createPass \
    --namespace "$AB_NAMESPACE" \
    --seasonId '4uF4JvvK' \
    --body '{"autoEnroll": true, "code": "kWrQvWEr", "displayOrder": 59, "images": [{"as": "qBN6YLKg", "caption": "Hx6o8vMM", "height": 70, "imageUrl": "ILJwHT0x", "smallImageUrl": "hK23Hv9R", "width": 3}, {"as": "lyqg6zdj", "caption": "7XJP58pq", "height": 8, "imageUrl": "cF4BHcuh", "smallImageUrl": "IgikeTen", "width": 10}, {"as": "MiXC8Lfs", "caption": "60vqJngC", "height": 11, "imageUrl": "08ZXqIyP", "smallImageUrl": "lu93FidX", "width": 5}], "localizations": {"pDgCtzHH": {"description": "wTQkfVbB", "title": "YNlxftEx"}, "tmGExyDl": {"description": "dPgAM0h7", "title": "EeYVxd5G"}, "PKFMyg64": {"description": "818vaJiY", "title": "iX02lJMf"}}, "passItemId": "KaptbrzS"}' \
    > test.out 2>&1
eval_tap $? 13 'CreatePass' test.out

#- 14 GetPass
./ng net.accelbyte.sdk.cli.Main seasonpass getPass \
    --code 'zhX1EDPz' \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'elGivXt6' \
    > test.out 2>&1
eval_tap $? 14 'GetPass' test.out

#- 15 DeletePass
./ng net.accelbyte.sdk.cli.Main seasonpass deletePass \
    --code 'aBzDvIQL' \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'EDJ3SOej' \
    > test.out 2>&1
eval_tap $? 15 'DeletePass' test.out

#- 16 UpdatePass
./ng net.accelbyte.sdk.cli.Main seasonpass updatePass \
    --code 'A1h6u1Aw' \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'QGWvIivV' \
    --body '{"autoEnroll": true, "displayOrder": 7, "images": [{"as": "S3nLmqqY", "caption": "kGFC5ZDc", "height": 65, "imageUrl": "6nh8g17w", "smallImageUrl": "abiPBFmV", "width": 9}, {"as": "cMQV1YRC", "caption": "SJ5odcFP", "height": 61, "imageUrl": "73jwOAXb", "smallImageUrl": "waRyyrjF", "width": 12}, {"as": "rI7xw1nX", "caption": "T6rwB8Gq", "height": 81, "imageUrl": "J587Bv4N", "smallImageUrl": "jLZmZyja", "width": 38}], "localizations": {"IEli5h2D": {"description": "HsIL5fG1", "title": "81RciEhz"}, "kVgaIJwB": {"description": "MyTxpqax", "title": "9Q2JnxmG"}, "4PaViBAr": {"description": "naGD6kI1", "title": "fjYQb9Xn"}}, "passItemId": "NxNNdWpE"}' \
    > test.out 2>&1
eval_tap $? 16 'UpdatePass' test.out

#- 17 PublishSeason
./ng net.accelbyte.sdk.cli.Main seasonpass publishSeason \
    --namespace "$AB_NAMESPACE" \
    --seasonId '9zoo68Gl' \
    > test.out 2>&1
eval_tap $? 17 'PublishSeason' test.out

#- 18 RetireSeason
./ng net.accelbyte.sdk.cli.Main seasonpass retireSeason \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'uJHscwpc' \
    --force  \
    > test.out 2>&1
eval_tap $? 18 'RetireSeason' test.out

#- 19 QueryRewards
./ng net.accelbyte.sdk.cli.Main seasonpass queryRewards \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'Kp8UdhJ6' \
    --q 'fyfAe6Zm' \
    > test.out 2>&1
eval_tap $? 19 'QueryRewards' test.out

#- 20 CreateReward
./ng net.accelbyte.sdk.cli.Main seasonpass createReward \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'h0D59nKw' \
    --body '{"code": "oIOtiKhA", "currency": {"currencyCode": "nYfakv4w", "namespace": "luSBe7tB"}, "image": {"as": "55h2jIFB", "caption": "PDXJpmEg", "height": 94, "imageUrl": "mHtDfDfY", "smallImageUrl": "bf3mj5WT", "width": 9}, "itemId": "OJcjzXEU", "quantity": 4, "type": "ITEM"}' \
    > test.out 2>&1
eval_tap $? 20 'CreateReward' test.out

#- 21 GetReward
./ng net.accelbyte.sdk.cli.Main seasonpass getReward \
    --code 'OONFJaN2' \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'tjzQbeVK' \
    > test.out 2>&1
eval_tap $? 21 'GetReward' test.out

#- 22 DeleteReward
./ng net.accelbyte.sdk.cli.Main seasonpass deleteReward \
    --code 'DbYWbOsu' \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'pBRbCxFr' \
    > test.out 2>&1
eval_tap $? 22 'DeleteReward' test.out

#- 23 UpdateReward
./ng net.accelbyte.sdk.cli.Main seasonpass updateReward \
    --code 'ijg3nXLe' \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'QFGDrV4R' \
    --body '{"currency": {"currencyCode": "V6oNlCiW", "namespace": "SInwQ28w"}, "image": {"as": "q9OmRyvF", "caption": "1SuS9Zbn", "height": 69, "imageUrl": "bx3ALgsY", "smallImageUrl": "SFUUYgKn", "width": 27}, "itemId": "xxznw2mH", "nullFields": ["ll48fk7D", "xH0TRCb6", "X69jqO6g"], "quantity": 68, "type": "CURRENCY"}' \
    > test.out 2>&1
eval_tap $? 23 'UpdateReward' test.out

#- 24 QueryTiers
./ng net.accelbyte.sdk.cli.Main seasonpass queryTiers \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'ZhuppBgJ' \
    --limit '97' \
    --offset '50' \
    > test.out 2>&1
eval_tap $? 24 'QueryTiers' test.out

#- 25 CreateTier
./ng net.accelbyte.sdk.cli.Main seasonpass createTier \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'mDgqcovT' \
    --body '{"index": 4, "quantity": 81, "tier": {"requiredExp": 52, "rewards": {"c7BvMS7b": ["Kb2RR26q", "wwg5qdRt", "lbbwr2Nz"], "LzijlQbZ": ["5K8hIBu7", "F5TtKfPN", "d9gyAZ5r"], "oFlFyDKI": ["oD2jHuVs", "u6gjrFLb", "dGzxXXCd"]}}}' \
    > test.out 2>&1
eval_tap $? 25 'CreateTier' test.out

#- 26 UpdateTier
./ng net.accelbyte.sdk.cli.Main seasonpass updateTier \
    --id 'Ck4R65OG' \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'VtFaHGZB' \
    --body '{"requiredExp": 15, "rewards": {"xYEi3vyN": ["dIKxH4Hy", "2CBsZNQW", "OCYvIQST"], "xynYeQMK": ["Yotxuo7X", "wUUg1zGk", "OH0NEeYe"], "1Lse1r9t": ["oGyyIbBk", "6Ksg588p", "7U96dWFb"]}}' \
    > test.out 2>&1
eval_tap $? 26 'UpdateTier' test.out

#- 27 DeleteTier
./ng net.accelbyte.sdk.cli.Main seasonpass deleteTier \
    --id 'xe5pHxKd' \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'GTBDcJjV' \
    > test.out 2>&1
eval_tap $? 27 'DeleteTier' test.out

#- 28 ReorderTier
./ng net.accelbyte.sdk.cli.Main seasonpass reorderTier \
    --id 'HbmTAJJb' \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'yO8rZay7' \
    --body '{"newIndex": 67}' \
    > test.out 2>&1
eval_tap $? 28 'ReorderTier' test.out

#- 29 UnpublishSeason
./ng net.accelbyte.sdk.cli.Main seasonpass unpublishSeason \
    --namespace "$AB_NAMESPACE" \
    --seasonId '7lvusnxY' \
    --force  \
    > test.out 2>&1
eval_tap $? 29 'UnpublishSeason' test.out

#- 30 GetUserParticipatedSeasons
./ng net.accelbyte.sdk.cli.Main seasonpass getUserParticipatedSeasons \
    --namespace "$AB_NAMESPACE" \
    --userId 'zv0bhyDP' \
    --limit '27' \
    --offset '35' \
    > test.out 2>&1
eval_tap $? 30 'GetUserParticipatedSeasons' test.out

#- 31 GrantUserExp
./ng net.accelbyte.sdk.cli.Main seasonpass grantUserExp \
    --namespace "$AB_NAMESPACE" \
    --userId 'TNbPndu6' \
    --body '{"exp": 54, "source": "PAID_FOR", "tags": ["IJqs5Gry", "Z5xf9LJN", "Wjhkq2C8"]}' \
    > test.out 2>&1
eval_tap $? 31 'GrantUserExp' test.out

#- 32 GrantUserPass
./ng net.accelbyte.sdk.cli.Main seasonpass grantUserPass \
    --namespace "$AB_NAMESPACE" \
    --userId 'M4nQX5D6' \
    --body '{"passCode": "4VfoyUZ6", "passItemId": "hkzAdklI"}' \
    > test.out 2>&1
eval_tap $? 32 'GrantUserPass' test.out

#- 33 ExistsAnyPassByPassCodes
./ng net.accelbyte.sdk.cli.Main seasonpass existsAnyPassByPassCodes \
    --namespace "$AB_NAMESPACE" \
    --userId 'ULRc3uRK' \
    --passCodes 'CTPaaJmM,OUy5LYu5,KAde3xGM' \
    > test.out 2>&1
eval_tap $? 33 'ExistsAnyPassByPassCodes' test.out

#- 34 GetCurrentUserSeasonProgression
./ng net.accelbyte.sdk.cli.Main seasonpass getCurrentUserSeasonProgression \
    --namespace "$AB_NAMESPACE" \
    --userId 'D0DNglwz' \
    > test.out 2>&1
eval_tap $? 34 'GetCurrentUserSeasonProgression' test.out

#- 35 CheckSeasonPurchasable
./ng net.accelbyte.sdk.cli.Main seasonpass checkSeasonPurchasable \
    --namespace "$AB_NAMESPACE" \
    --userId '8U8hUtDq' \
    --body '{"passItemId": "Mz6dXyoh", "tierItemCount": 88, "tierItemId": "4Rj5aShW"}' \
    > test.out 2>&1
eval_tap $? 35 'CheckSeasonPurchasable' test.out

#- 36 ResetUserSeason
./ng net.accelbyte.sdk.cli.Main seasonpass resetUserSeason \
    --namespace "$AB_NAMESPACE" \
    --userId 'oKH2eW0l' \
    > test.out 2>&1
eval_tap $? 36 'ResetUserSeason' test.out

#- 37 GrantUserTier
./ng net.accelbyte.sdk.cli.Main seasonpass grantUserTier \
    --namespace "$AB_NAMESPACE" \
    --userId '8H46nDDK' \
    --body '{"count": 72, "source": "SWEAT", "tags": ["ubpCWFHD", "poT2h2wu", "iIGNTuuc"]}' \
    > test.out 2>&1
eval_tap $? 37 'GrantUserTier' test.out

#- 38 QueryUserExpGrantHistory
./ng net.accelbyte.sdk.cli.Main seasonpass queryUserExpGrantHistory \
    --namespace "$AB_NAMESPACE" \
    --userId 'fEmXJO6D' \
    --from 'I8ZowubD' \
    --limit '64' \
    --offset '61' \
    --seasonId 'u5ORgis4' \
    --source 'SWEAT' \
    --tags 'fzQjGwuB,PIQtmYxq,HIYSeKfP' \
    --to '3sUjsORp' \
    > test.out 2>&1
eval_tap $? 38 'QueryUserExpGrantHistory' test.out

#- 39 QueryUserExpGrantHistoryTag
./ng net.accelbyte.sdk.cli.Main seasonpass queryUserExpGrantHistoryTag \
    --namespace "$AB_NAMESPACE" \
    --userId 'uECjfRZw' \
    --seasonId 'nJoPcpIy' \
    > test.out 2>&1
eval_tap $? 39 'QueryUserExpGrantHistoryTag' test.out

#- 40 GetUserSeason
./ng net.accelbyte.sdk.cli.Main seasonpass getUserSeason \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'SNwcl91Z' \
    --userId 'bQ7ncZUV' \
    > test.out 2>&1
eval_tap $? 40 'GetUserSeason' test.out

#- 41 PublicGetCurrentSeason
./ng net.accelbyte.sdk.cli.Main seasonpass publicGetCurrentSeason \
    --namespace "$AB_NAMESPACE" \
    --language 'p0QmieqY' \
    > test.out 2>&1
eval_tap $? 41 'PublicGetCurrentSeason' test.out

#- 42 PublicGetCurrentUserSeason
./ng net.accelbyte.sdk.cli.Main seasonpass publicGetCurrentUserSeason \
    --namespace "$AB_NAMESPACE" \
    --userId 'IiY5FRTR' \
    > test.out 2>&1
eval_tap $? 42 'PublicGetCurrentUserSeason' test.out

#- 43 PublicClaimUserReward
./ng net.accelbyte.sdk.cli.Main seasonpass publicClaimUserReward \
    --namespace "$AB_NAMESPACE" \
    --userId 'S2fIaoAl' \
    --body '{"passCode": "tiZC7h5j", "rewardCode": "pySD6X5f", "tierIndex": 15}' \
    > test.out 2>&1
eval_tap $? 43 'PublicClaimUserReward' test.out

#- 44 PublicBulkClaimUserRewards
./ng net.accelbyte.sdk.cli.Main seasonpass publicBulkClaimUserRewards \
    --namespace "$AB_NAMESPACE" \
    --userId 'aBVG46GP' \
    > test.out 2>&1
eval_tap $? 44 'PublicBulkClaimUserRewards' test.out

#- 45 PublicGetUserSeason
./ng net.accelbyte.sdk.cli.Main seasonpass publicGetUserSeason \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'SQ860xwR' \
    --userId 'vPsevIJE' \
    > test.out 2>&1
eval_tap $? 45 'PublicGetUserSeason' test.out


rm -f "tmp.dat"

exit $EXIT_CODE