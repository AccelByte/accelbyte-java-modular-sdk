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
    --limit '93' \
    --offset '69' \
    --status 'PUBLISHED,PUBLISHED,DRAFT' \
    > test.out 2>&1
eval_tap $? 3 'QuerySeasons' test.out

#- 4 CreateSeason
./ng net.accelbyte.sdk.cli.Main seasonpass createSeason \
    --namespace "$AB_NAMESPACE" \
    --body '{"autoClaim": false, "defaultLanguage": "fbZe4glC", "defaultRequiredExp": 36, "draftStoreId": "aPGfV7Rc", "end": "1989-07-22T00:00:00Z", "excessStrategy": {"currency": "gm79xNFj", "method": "CURRENCY", "percentPerExp": 31}, "images": [{"as": "4i9P29IC", "caption": "u0ZDw1JH", "height": 30, "imageUrl": "3bNeVlgD", "smallImageUrl": "B3lNKF4D", "width": 42}, {"as": "58QVq77L", "caption": "l70esgAR", "height": 83, "imageUrl": "TVGqofcj", "smallImageUrl": "5yfjJ4tp", "width": 28}, {"as": "Di4zKaLH", "caption": "pIK6srjz", "height": 83, "imageUrl": "EfKJzzy5", "smallImageUrl": "JTdieFyZ", "width": 17}], "localizations": {"WshQzRoW": {"description": "s7NWamxX", "title": "r0egHdmX"}, "TG5qtTP1": {"description": "s5aQGMdY", "title": "Bg3rmawr"}, "QWtGDYVM": {"description": "Ocr6HNJa", "title": "Xv4SxfUx"}}, "name": "8IuakzjD", "start": "1978-02-02T00:00:00Z", "tierItemId": "jiSqdOt9"}' \
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
    --body '{"userIds": ["ZSu6KHtF", "9CrqbLnJ", "JacnN39T"]}' \
    > test.out 2>&1
eval_tap $? 6 'BulkGetUserSeasonProgression' test.out

#- 7 GetSeason
./ng net.accelbyte.sdk.cli.Main seasonpass getSeason \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'U4jz88px' \
    > test.out 2>&1
eval_tap $? 7 'GetSeason' test.out

#- 8 DeleteSeason
./ng net.accelbyte.sdk.cli.Main seasonpass deleteSeason \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'UZk1gxWp' \
    > test.out 2>&1
eval_tap $? 8 'DeleteSeason' test.out

#- 9 UpdateSeason
./ng net.accelbyte.sdk.cli.Main seasonpass updateSeason \
    --namespace "$AB_NAMESPACE" \
    --seasonId '3TaOHHYY' \
    --body '{"autoClaim": false, "defaultLanguage": "S3bELQRj", "defaultRequiredExp": 82, "draftStoreId": "opHdXoVw", "end": "1985-12-27T00:00:00Z", "excessStrategy": {"currency": "sSxWPtRo", "method": "CURRENCY", "percentPerExp": 57}, "images": [{"as": "SW5GY1U2", "caption": "6cTi8CEw", "height": 60, "imageUrl": "BIUraqF8", "smallImageUrl": "WT5cY7Sn", "width": 48}, {"as": "J81mjKZY", "caption": "bD1IMH0Q", "height": 6, "imageUrl": "HDvrK7hf", "smallImageUrl": "wnzlGs7w", "width": 6}, {"as": "rBy8OFE4", "caption": "8dQQwo7i", "height": 85, "imageUrl": "m6tfWmSc", "smallImageUrl": "tAy1LIJ8", "width": 94}], "localizations": {"zTIemGHR": {"description": "67EJmlrl", "title": "JpDd7D7M"}, "2NYHdtaX": {"description": "WG5RHIFv", "title": "eFeL59R7"}, "QzpMCMZY": {"description": "E9EzX6qD", "title": "lnmfncqi"}}, "name": "wV6F6HUP", "start": "1982-08-03T00:00:00Z", "tierItemId": "thNEKY6S"}' \
    > test.out 2>&1
eval_tap $? 9 'UpdateSeason' test.out

#- 10 CloneSeason
./ng net.accelbyte.sdk.cli.Main seasonpass cloneSeason \
    --namespace "$AB_NAMESPACE" \
    --seasonId '8xnWdV2y' \
    --body '{"end": "1990-01-10T00:00:00Z", "name": "uZNHhWXR", "start": "1987-12-05T00:00:00Z"}' \
    > test.out 2>&1
eval_tap $? 10 'CloneSeason' test.out

#- 11 GetFullSeason
./ng net.accelbyte.sdk.cli.Main seasonpass getFullSeason \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'uiuIfDJd' \
    > test.out 2>&1
eval_tap $? 11 'GetFullSeason' test.out

#- 12 QueryPasses
./ng net.accelbyte.sdk.cli.Main seasonpass queryPasses \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'z7EksfwP' \
    > test.out 2>&1
eval_tap $? 12 'QueryPasses' test.out

#- 13 CreatePass
./ng net.accelbyte.sdk.cli.Main seasonpass createPass \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'J6YeNf4L' \
    --body '{"autoEnroll": true, "code": "FmOsRbFn", "displayOrder": 30, "images": [{"as": "rFEKJv41", "caption": "KFiZRoE9", "height": 23, "imageUrl": "tpOEebiY", "smallImageUrl": "9kAlItRG", "width": 55}, {"as": "1W69b5wZ", "caption": "zySf0M2I", "height": 23, "imageUrl": "sMd1PrbA", "smallImageUrl": "X5siLUEB", "width": 64}, {"as": "t40D2Z4A", "caption": "ksAR1AX6", "height": 29, "imageUrl": "1Zylz3BT", "smallImageUrl": "oqS4OPFe", "width": 36}], "localizations": {"SiN1tXZx": {"description": "CfeE8Gi5", "title": "3siJToEY"}, "PVznRCtH": {"description": "Z0oyrpcH", "title": "vCi1Y3Em"}, "maBfTcWA": {"description": "7oxHW617", "title": "PgSaPLP8"}}, "passItemId": "1zB7lYD6"}' \
    > test.out 2>&1
eval_tap $? 13 'CreatePass' test.out

#- 14 GetPass
./ng net.accelbyte.sdk.cli.Main seasonpass getPass \
    --code '1MQWSuNi' \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'r8fxiZBB' \
    > test.out 2>&1
eval_tap $? 14 'GetPass' test.out

#- 15 DeletePass
./ng net.accelbyte.sdk.cli.Main seasonpass deletePass \
    --code 'F5UMnXNx' \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'AHsWvceG' \
    > test.out 2>&1
eval_tap $? 15 'DeletePass' test.out

#- 16 UpdatePass
./ng net.accelbyte.sdk.cli.Main seasonpass updatePass \
    --code 'zuYj5E1p' \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'c1U294zS' \
    --body '{"autoEnroll": true, "displayOrder": 12, "images": [{"as": "pxQ4NdCv", "caption": "dggVxXWA", "height": 75, "imageUrl": "SM3aaIyK", "smallImageUrl": "K5pD2kh7", "width": 73}, {"as": "Rf3FNSJz", "caption": "pXSmVnu1", "height": 64, "imageUrl": "NM5kw51a", "smallImageUrl": "aJlo7shy", "width": 27}, {"as": "k8Q6eDxr", "caption": "kfOCJpRk", "height": 90, "imageUrl": "5hjsDWYd", "smallImageUrl": "uybDI28z", "width": 78}], "localizations": {"qVVhy9O2": {"description": "IFARof6M", "title": "xLmHqDs2"}, "R7U8SUh7": {"description": "zCM5q2hF", "title": "vPdWam6N"}, "ywqGla6S": {"description": "ELnYvNBU", "title": "rq9BACjv"}}, "passItemId": "hzu9i4mC"}' \
    > test.out 2>&1
eval_tap $? 16 'UpdatePass' test.out

#- 17 PublishSeason
./ng net.accelbyte.sdk.cli.Main seasonpass publishSeason \
    --namespace "$AB_NAMESPACE" \
    --seasonId '9r3KGbvE' \
    > test.out 2>&1
eval_tap $? 17 'PublishSeason' test.out

#- 18 RetireSeason
./ng net.accelbyte.sdk.cli.Main seasonpass retireSeason \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'l9PCLACB' \
    --force  \
    > test.out 2>&1
eval_tap $? 18 'RetireSeason' test.out

#- 19 QueryRewards
./ng net.accelbyte.sdk.cli.Main seasonpass queryRewards \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'UK5YdBmw' \
    --q 'jYBmnZQD' \
    > test.out 2>&1
eval_tap $? 19 'QueryRewards' test.out

#- 20 CreateReward
./ng net.accelbyte.sdk.cli.Main seasonpass createReward \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'mhfKSi4H' \
    --body '{"code": "U2oi8xU0", "currency": {"currencyCode": "WyDTaY8P", "namespace": "UNMQvcM5"}, "image": {"as": "CjKZgiW1", "caption": "mv4uZDdq", "height": 8, "imageUrl": "tChMyTys", "smallImageUrl": "10H5Qe9a", "width": 12}, "itemId": "ms7XXt5X", "quantity": 31, "type": "ITEM"}' \
    > test.out 2>&1
eval_tap $? 20 'CreateReward' test.out

#- 21 GetReward
./ng net.accelbyte.sdk.cli.Main seasonpass getReward \
    --code '6QnRQDOJ' \
    --namespace "$AB_NAMESPACE" \
    --seasonId '2Q3KEX0t' \
    > test.out 2>&1
eval_tap $? 21 'GetReward' test.out

#- 22 DeleteReward
./ng net.accelbyte.sdk.cli.Main seasonpass deleteReward \
    --code 'x6YfHpmf' \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'mgOCzMxv' \
    > test.out 2>&1
eval_tap $? 22 'DeleteReward' test.out

#- 23 UpdateReward
./ng net.accelbyte.sdk.cli.Main seasonpass updateReward \
    --code 'lcoaCjxS' \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'VkDh65j9' \
    --body '{"currency": {"currencyCode": "5bdoNXhG", "namespace": "VG65Iwwc"}, "image": {"as": "OcRH17AP", "caption": "Z05qGsrN", "height": 44, "imageUrl": "MFIeZnsF", "smallImageUrl": "RndKA998", "width": 60}, "itemId": "glydnTAh", "nullFields": ["7BEGM5M5", "StS3xKGa", "TyIbFZMl"], "quantity": 85, "type": "ITEM"}' \
    > test.out 2>&1
eval_tap $? 23 'UpdateReward' test.out

#- 24 QueryTiers
./ng net.accelbyte.sdk.cli.Main seasonpass queryTiers \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'JosccQoI' \
    --limit '22' \
    --offset '22' \
    > test.out 2>&1
eval_tap $? 24 'QueryTiers' test.out

#- 25 CreateTier
./ng net.accelbyte.sdk.cli.Main seasonpass createTier \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'Hh5fEbCe' \
    --body '{"index": 94, "quantity": 79, "tier": {"requiredExp": 7, "rewards": {"yYfmRthZ": ["RFzyvFkv", "tvfeNEjy", "HiSguXtz"], "tBlbboXJ": ["f6HwLPH6", "Ss7mtZNV", "aygXxs2C"], "0mAe8GqP": ["Wdw54lJU", "cgyPqsnY", "FikvApXx"]}}}' \
    > test.out 2>&1
eval_tap $? 25 'CreateTier' test.out

#- 26 UpdateTier
./ng net.accelbyte.sdk.cli.Main seasonpass updateTier \
    --id 'HiAHThkW' \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'JtwtCjmk' \
    --body '{"requiredExp": 75, "rewards": {"Tj2JT94R": ["wnmn0s9L", "1KJsMlQ7", "drnmFL4G"], "1l4gDDuu": ["RVs0JmD2", "oATpXKMm", "7oTpgC7b"], "sXbIUeNw": ["ShWHtF42", "voKY7FRp", "7lmYH1QF"]}}' \
    > test.out 2>&1
eval_tap $? 26 'UpdateTier' test.out

#- 27 DeleteTier
./ng net.accelbyte.sdk.cli.Main seasonpass deleteTier \
    --id 'LKeRIPiA' \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'cdUPTPY5' \
    > test.out 2>&1
eval_tap $? 27 'DeleteTier' test.out

#- 28 ReorderTier
./ng net.accelbyte.sdk.cli.Main seasonpass reorderTier \
    --id '61n0hUNH' \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'oWO5YaMN' \
    --body '{"newIndex": 27}' \
    > test.out 2>&1
eval_tap $? 28 'ReorderTier' test.out

#- 29 UnpublishSeason
./ng net.accelbyte.sdk.cli.Main seasonpass unpublishSeason \
    --namespace "$AB_NAMESPACE" \
    --seasonId '8kAwZyzA' \
    --force  \
    > test.out 2>&1
eval_tap $? 29 'UnpublishSeason' test.out

#- 30 GetUserParticipatedSeasons
./ng net.accelbyte.sdk.cli.Main seasonpass getUserParticipatedSeasons \
    --namespace "$AB_NAMESPACE" \
    --userId 'pYtPiVQ5' \
    --limit '83' \
    --offset '31' \
    > test.out 2>&1
eval_tap $? 30 'GetUserParticipatedSeasons' test.out

#- 31 GrantUserExp
./ng net.accelbyte.sdk.cli.Main seasonpass grantUserExp \
    --namespace "$AB_NAMESPACE" \
    --userId 'sUjRAAdf' \
    --body '{"exp": 12, "source": "SWEAT", "tags": ["DbMbCHb6", "59wz4gFp", "seIlljBz"]}' \
    > test.out 2>&1
eval_tap $? 31 'GrantUserExp' test.out

#- 32 GrantUserPass
./ng net.accelbyte.sdk.cli.Main seasonpass grantUserPass \
    --namespace "$AB_NAMESPACE" \
    --userId 'KHjnCLfm' \
    --body '{"passCode": "DOnGD3Jk", "passItemId": "pdbIL0mB"}' \
    > test.out 2>&1
eval_tap $? 32 'GrantUserPass' test.out

#- 33 ExistsAnyPassByPassCodes
./ng net.accelbyte.sdk.cli.Main seasonpass existsAnyPassByPassCodes \
    --namespace "$AB_NAMESPACE" \
    --userId '4Taagx6L' \
    --passCodes 'g4a1k0nS,2LCvgN8C,uSOoEV1o' \
    > test.out 2>&1
eval_tap $? 33 'ExistsAnyPassByPassCodes' test.out

#- 34 GetCurrentUserSeasonProgression
./ng net.accelbyte.sdk.cli.Main seasonpass getCurrentUserSeasonProgression \
    --namespace "$AB_NAMESPACE" \
    --userId 'S7BFMFHP' \
    > test.out 2>&1
eval_tap $? 34 'GetCurrentUserSeasonProgression' test.out

#- 35 CheckSeasonPurchasable
./ng net.accelbyte.sdk.cli.Main seasonpass checkSeasonPurchasable \
    --namespace "$AB_NAMESPACE" \
    --userId 'WQwGj3kp' \
    --body '{"passItemId": "te1dklDc", "tierItemCount": 41, "tierItemId": "3PNGjswP"}' \
    > test.out 2>&1
eval_tap $? 35 'CheckSeasonPurchasable' test.out

#- 36 ResetUserSeason
./ng net.accelbyte.sdk.cli.Main seasonpass resetUserSeason \
    --namespace "$AB_NAMESPACE" \
    --userId 'elQDpwUz' \
    > test.out 2>&1
eval_tap $? 36 'ResetUserSeason' test.out

#- 37 GrantUserTier
./ng net.accelbyte.sdk.cli.Main seasonpass grantUserTier \
    --namespace "$AB_NAMESPACE" \
    --userId 'WuMQDhHQ' \
    --body '{"count": 8, "source": "PAID_FOR", "tags": ["j5UFWHiL", "IIuqfrFm", "DoVNkuVg"]}' \
    > test.out 2>&1
eval_tap $? 37 'GrantUserTier' test.out

#- 38 QueryUserExpGrantHistory
./ng net.accelbyte.sdk.cli.Main seasonpass queryUserExpGrantHistory \
    --namespace "$AB_NAMESPACE" \
    --userId 'QOCx3xOy' \
    --from 'lAsWetG6' \
    --limit '79' \
    --offset '93' \
    --seasonId 'ckDE8DMT' \
    --source 'SWEAT' \
    --tags 'LMT5ELDU,2cRWIMV7,AXEOjE3V' \
    --to 'xUEQyPQD' \
    > test.out 2>&1
eval_tap $? 38 'QueryUserExpGrantHistory' test.out

#- 39 QueryUserExpGrantHistoryTag
./ng net.accelbyte.sdk.cli.Main seasonpass queryUserExpGrantHistoryTag \
    --namespace "$AB_NAMESPACE" \
    --userId 'J552fVvl' \
    --seasonId 'dX1GFwDr' \
    > test.out 2>&1
eval_tap $? 39 'QueryUserExpGrantHistoryTag' test.out

#- 40 GetUserSeason
./ng net.accelbyte.sdk.cli.Main seasonpass getUserSeason \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'wCXwvlRB' \
    --userId 'M59ptDEu' \
    > test.out 2>&1
eval_tap $? 40 'GetUserSeason' test.out

#- 41 PublicGetCurrentSeason
./ng net.accelbyte.sdk.cli.Main seasonpass publicGetCurrentSeason \
    --namespace "$AB_NAMESPACE" \
    --language 'b4vvAzwX' \
    > test.out 2>&1
eval_tap $? 41 'PublicGetCurrentSeason' test.out

#- 42 PublicGetCurrentUserSeason
./ng net.accelbyte.sdk.cli.Main seasonpass publicGetCurrentUserSeason \
    --namespace "$AB_NAMESPACE" \
    --userId 'CHRW7oqL' \
    > test.out 2>&1
eval_tap $? 42 'PublicGetCurrentUserSeason' test.out

#- 43 PublicClaimUserReward
./ng net.accelbyte.sdk.cli.Main seasonpass publicClaimUserReward \
    --namespace "$AB_NAMESPACE" \
    --userId 'CGpj06hb' \
    --body '{"passCode": "bhvHyjGD", "rewardCode": "PRKZ06ci", "tierIndex": 96}' \
    > test.out 2>&1
eval_tap $? 43 'PublicClaimUserReward' test.out

#- 44 PublicBulkClaimUserRewards
./ng net.accelbyte.sdk.cli.Main seasonpass publicBulkClaimUserRewards \
    --namespace "$AB_NAMESPACE" \
    --userId 'P3j2bDS3' \
    > test.out 2>&1
eval_tap $? 44 'PublicBulkClaimUserRewards' test.out

#- 45 PublicGetUserSeason
./ng net.accelbyte.sdk.cli.Main seasonpass publicGetUserSeason \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'obR864gh' \
    --userId 'DeKnbp5a' \
    > test.out 2>&1
eval_tap $? 45 'PublicGetUserSeason' test.out


rm -f "tmp.dat"

exit $EXIT_CODE