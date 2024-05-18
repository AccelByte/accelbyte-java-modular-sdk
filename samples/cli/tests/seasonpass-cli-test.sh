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
    --limit '78' \
    --offset '31' \
    --status 'DRAFT,RETIRED,DRAFT' \
    > test.out 2>&1
eval_tap $? 3 'QuerySeasons' test.out

#- 4 CreateSeason
./ng net.accelbyte.sdk.cli.Main seasonpass createSeason \
    --namespace "$AB_NAMESPACE" \
    --body '{"autoClaim": false, "defaultLanguage": "ABJzCeMJ", "defaultRequiredExp": 87, "draftStoreId": "D0aUnXDR", "end": "1979-11-26T00:00:00Z", "excessStrategy": {"currency": "k6nZsJJ3", "method": "NONE", "percentPerExp": 17}, "images": [{"as": "K7aHk2db", "caption": "WDwhhpDn", "height": 90, "imageUrl": "cxJPsEYP", "smallImageUrl": "lgrPO2eQ", "width": 85}, {"as": "Du8386Sp", "caption": "vwTkfbpt", "height": 89, "imageUrl": "QPmUB80M", "smallImageUrl": "ve2aPQvd", "width": 30}, {"as": "I7a1Q54R", "caption": "RUNuHdnX", "height": 49, "imageUrl": "I8p7a3nb", "smallImageUrl": "QXVZmYh7", "width": 99}], "localizations": {"hgHi6si5": {"description": "fFD6Y3Lk", "title": "fxp1QsmF"}, "HfpwGXj0": {"description": "DZAgRB5k", "title": "QkJrMG75"}, "AFdG4fD7": {"description": "yk1aq8Ne", "title": "ImxsPdxI"}}, "name": "sPKipSH5", "start": "1977-02-21T00:00:00Z", "tierItemId": "3t3RSc24"}' \
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
    --body '{"userIds": ["tnosN4Sv", "0MvxOsWs", "mpxlcPgM"]}' \
    > test.out 2>&1
eval_tap $? 6 'BulkGetUserSeasonProgression' test.out

#- 7 GetSeason
./ng net.accelbyte.sdk.cli.Main seasonpass getSeason \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'eCzqc9zK' \
    > test.out 2>&1
eval_tap $? 7 'GetSeason' test.out

#- 8 DeleteSeason
./ng net.accelbyte.sdk.cli.Main seasonpass deleteSeason \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'bAuSMfsz' \
    > test.out 2>&1
eval_tap $? 8 'DeleteSeason' test.out

#- 9 UpdateSeason
./ng net.accelbyte.sdk.cli.Main seasonpass updateSeason \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'vaAvuwn4' \
    --body '{"autoClaim": false, "defaultLanguage": "MoZYiopJ", "defaultRequiredExp": 44, "draftStoreId": "Tqx7OgQb", "end": "1982-04-25T00:00:00Z", "excessStrategy": {"currency": "LLkXo4Iu", "method": "CURRENCY", "percentPerExp": 95}, "images": [{"as": "FD36c0hj", "caption": "kNqwrEtQ", "height": 15, "imageUrl": "HgaybL5A", "smallImageUrl": "vGUuJoFO", "width": 60}, {"as": "YmQYI7PO", "caption": "unpt167v", "height": 35, "imageUrl": "mrc10cgk", "smallImageUrl": "EqsguJPP", "width": 67}, {"as": "KQCRVkVe", "caption": "IJo7Cj1Y", "height": 29, "imageUrl": "6sLx6aKv", "smallImageUrl": "4cMacH2g", "width": 54}], "localizations": {"CE6Pexvm": {"description": "Pi4rFLAc", "title": "rfBoiEmD"}, "TsGIq2Yt": {"description": "ZJa1p5hR", "title": "RB7T50eq"}, "nnDfT9rJ": {"description": "QlueWJaf", "title": "lvlJymVc"}}, "name": "LUyfuGtG", "start": "1996-02-17T00:00:00Z", "tierItemId": "L2heE2ju"}' \
    > test.out 2>&1
eval_tap $? 9 'UpdateSeason' test.out

#- 10 CloneSeason
./ng net.accelbyte.sdk.cli.Main seasonpass cloneSeason \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'HCoDNR99' \
    --body '{"end": "1972-07-14T00:00:00Z", "name": "b6epnqbg", "start": "1984-07-04T00:00:00Z"}' \
    > test.out 2>&1
eval_tap $? 10 'CloneSeason' test.out

#- 11 GetFullSeason
./ng net.accelbyte.sdk.cli.Main seasonpass getFullSeason \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'E75h9bRl' \
    > test.out 2>&1
eval_tap $? 11 'GetFullSeason' test.out

#- 12 QueryPasses
./ng net.accelbyte.sdk.cli.Main seasonpass queryPasses \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'k2HCa9oB' \
    > test.out 2>&1
eval_tap $? 12 'QueryPasses' test.out

#- 13 CreatePass
./ng net.accelbyte.sdk.cli.Main seasonpass createPass \
    --namespace "$AB_NAMESPACE" \
    --seasonId '2GLAnoVF' \
    --body '{"autoEnroll": true, "code": "tiXIanpl", "displayOrder": 32, "images": [{"as": "SsQtZcvx", "caption": "tSH5EMmj", "height": 65, "imageUrl": "wNyUSGbd", "smallImageUrl": "34nRyXva", "width": 94}, {"as": "Gsiixpzr", "caption": "GXz336H7", "height": 14, "imageUrl": "QAAPTbGC", "smallImageUrl": "NnSohmal", "width": 91}, {"as": "ZpiX7Usd", "caption": "HHf5RP4V", "height": 75, "imageUrl": "x34TglpW", "smallImageUrl": "7pEGqDa0", "width": 70}], "localizations": {"92RvjoVg": {"description": "vekMDaO3", "title": "sJvluH0C"}, "2ZM45mC7": {"description": "zy5Orvcc", "title": "3hPSu31Q"}, "vl4iLjf9": {"description": "112xdYv4", "title": "VqWCBX4u"}}, "passItemId": "VFczKvAA"}' \
    > test.out 2>&1
eval_tap $? 13 'CreatePass' test.out

#- 14 GetPass
./ng net.accelbyte.sdk.cli.Main seasonpass getPass \
    --code 'bgQEQFCt' \
    --namespace "$AB_NAMESPACE" \
    --seasonId '2q4e629G' \
    > test.out 2>&1
eval_tap $? 14 'GetPass' test.out

#- 15 DeletePass
./ng net.accelbyte.sdk.cli.Main seasonpass deletePass \
    --code 'JVJrQkfH' \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'yDCOz2jO' \
    > test.out 2>&1
eval_tap $? 15 'DeletePass' test.out

#- 16 UpdatePass
./ng net.accelbyte.sdk.cli.Main seasonpass updatePass \
    --code 'PaUY81YT' \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'ySXM9MxO' \
    --body '{"autoEnroll": false, "displayOrder": 54, "images": [{"as": "JBGC4f9W", "caption": "MNpDRhid", "height": 17, "imageUrl": "BSxa1cQ9", "smallImageUrl": "C6GVFWA6", "width": 41}, {"as": "s2sHCKfH", "caption": "nVK2VP9Q", "height": 89, "imageUrl": "UlYlvkPy", "smallImageUrl": "dhmQiX7g", "width": 85}, {"as": "JpuqbSmY", "caption": "NfKqqtXY", "height": 66, "imageUrl": "q8X1Q2RC", "smallImageUrl": "EZt5bL7t", "width": 55}], "localizations": {"fp1vUIrl": {"description": "rcrrjegm", "title": "rNtWyns4"}, "4sl56Vyv": {"description": "0rLk069b", "title": "MwISnMS5"}, "O1VNTp3t": {"description": "xQbNZYYA", "title": "O8p6OxAD"}}, "passItemId": "Tz7vVPzD"}' \
    > test.out 2>&1
eval_tap $? 16 'UpdatePass' test.out

#- 17 PublishSeason
./ng net.accelbyte.sdk.cli.Main seasonpass publishSeason \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'nXPNw0Wq' \
    > test.out 2>&1
eval_tap $? 17 'PublishSeason' test.out

#- 18 RetireSeason
./ng net.accelbyte.sdk.cli.Main seasonpass retireSeason \
    --namespace "$AB_NAMESPACE" \
    --seasonId '3CPngPxa' \
    --force  \
    > test.out 2>&1
eval_tap $? 18 'RetireSeason' test.out

#- 19 QueryRewards
./ng net.accelbyte.sdk.cli.Main seasonpass queryRewards \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'zTN44POE' \
    --q '5owJX7CF' \
    > test.out 2>&1
eval_tap $? 19 'QueryRewards' test.out

#- 20 CreateReward
./ng net.accelbyte.sdk.cli.Main seasonpass createReward \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'jApFNlHm' \
    --body '{"code": "S6O2wlri", "currency": {"currencyCode": "UUuo2W7M", "namespace": "AY6pCiVy"}, "image": {"as": "L2SNYB2x", "caption": "LkHDOkzo", "height": 4, "imageUrl": "sZzKJKV2", "smallImageUrl": "YsgPCmwb", "width": 53}, "itemId": "tl0jf7iR", "quantity": 10, "type": "CURRENCY"}' \
    > test.out 2>&1
eval_tap $? 20 'CreateReward' test.out

#- 21 GetReward
./ng net.accelbyte.sdk.cli.Main seasonpass getReward \
    --code 'ynNPYEvx' \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'Yb5NEaMz' \
    > test.out 2>&1
eval_tap $? 21 'GetReward' test.out

#- 22 DeleteReward
./ng net.accelbyte.sdk.cli.Main seasonpass deleteReward \
    --code 'WX4P84NY' \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'VBN12B3X' \
    > test.out 2>&1
eval_tap $? 22 'DeleteReward' test.out

#- 23 UpdateReward
./ng net.accelbyte.sdk.cli.Main seasonpass updateReward \
    --code 'fnsBzLkp' \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'wdjGnXu1' \
    --body '{"currency": {"currencyCode": "FDVChLX2", "namespace": "uW7rl8a1"}, "image": {"as": "LtmVtwfC", "caption": "tNuKZKDY", "height": 98, "imageUrl": "kDMn3ZeD", "smallImageUrl": "Tq4FV99c", "width": 60}, "itemId": "5vxiflTv", "nullFields": ["gIL24jIM", "Cf9N1nHY", "onatXeHp"], "quantity": 98, "type": "ITEM"}' \
    > test.out 2>&1
eval_tap $? 23 'UpdateReward' test.out

#- 24 QueryTiers
./ng net.accelbyte.sdk.cli.Main seasonpass queryTiers \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'DrDnMDSQ' \
    --limit '37' \
    --offset '89' \
    > test.out 2>&1
eval_tap $? 24 'QueryTiers' test.out

#- 25 CreateTier
./ng net.accelbyte.sdk.cli.Main seasonpass createTier \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'L1h58lRf' \
    --body '{"index": 80, "quantity": 54, "tier": {"requiredExp": 41, "rewards": {"5ITx2Bcz": ["0L00Neow", "6xe5Tpns", "xEB4SAAx"], "1KY4K620": ["FBE5MFJE", "DSwrXoFz", "cqHgYEZ4"], "4afkSLvP": ["716kJKoA", "ftdESl1U", "UIYwtK6g"]}}}' \
    > test.out 2>&1
eval_tap $? 25 'CreateTier' test.out

#- 26 UpdateTier
./ng net.accelbyte.sdk.cli.Main seasonpass updateTier \
    --id 'VdPNUt4m' \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'MFGo9mNj' \
    --body '{"requiredExp": 51, "rewards": {"MomWGTpb": ["H1DAT9sj", "ZfV0XzyT", "u89WHtls"], "yFdD0ddh": ["rCkCRxQi", "3WkYw84W", "imDiA11I"], "k5tNciRw": ["Ea9aLD8W", "sQorKbgp", "YbFrJHGc"]}}' \
    > test.out 2>&1
eval_tap $? 26 'UpdateTier' test.out

#- 27 DeleteTier
./ng net.accelbyte.sdk.cli.Main seasonpass deleteTier \
    --id 'R4MDSpzH' \
    --namespace "$AB_NAMESPACE" \
    --seasonId '6Q7nD7tJ' \
    > test.out 2>&1
eval_tap $? 27 'DeleteTier' test.out

#- 28 ReorderTier
./ng net.accelbyte.sdk.cli.Main seasonpass reorderTier \
    --id 'GTcAjHqf' \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'TwZLWo5H' \
    --body '{"newIndex": 55}' \
    > test.out 2>&1
eval_tap $? 28 'ReorderTier' test.out

#- 29 UnpublishSeason
./ng net.accelbyte.sdk.cli.Main seasonpass unpublishSeason \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'ilqQ7wEm' \
    --force  \
    > test.out 2>&1
eval_tap $? 29 'UnpublishSeason' test.out

#- 30 GetUserParticipatedSeasons
./ng net.accelbyte.sdk.cli.Main seasonpass getUserParticipatedSeasons \
    --namespace "$AB_NAMESPACE" \
    --userId 'nQudIN7G' \
    --limit '30' \
    --offset '85' \
    > test.out 2>&1
eval_tap $? 30 'GetUserParticipatedSeasons' test.out

#- 31 GrantUserExp
./ng net.accelbyte.sdk.cli.Main seasonpass grantUserExp \
    --namespace "$AB_NAMESPACE" \
    --userId '9THLGah8' \
    --body '{"exp": 82, "source": "SWEAT", "tags": ["eeKnbRMb", "Wtqieqqh", "A4nySj9o"]}' \
    > test.out 2>&1
eval_tap $? 31 'GrantUserExp' test.out

#- 32 GrantUserPass
./ng net.accelbyte.sdk.cli.Main seasonpass grantUserPass \
    --namespace "$AB_NAMESPACE" \
    --userId 'pOQBQxoZ' \
    --body '{"passCode": "VruYIAuL", "passItemId": "OQznXADL"}' \
    > test.out 2>&1
eval_tap $? 32 'GrantUserPass' test.out

#- 33 ExistsAnyPassByPassCodes
./ng net.accelbyte.sdk.cli.Main seasonpass existsAnyPassByPassCodes \
    --namespace "$AB_NAMESPACE" \
    --userId 'IF4RWY3X' \
    --passCodes 'dIMPwDpj,vEElqWbV,ZEp1xgRP' \
    > test.out 2>&1
eval_tap $? 33 'ExistsAnyPassByPassCodes' test.out

#- 34 GetCurrentUserSeasonProgression
./ng net.accelbyte.sdk.cli.Main seasonpass getCurrentUserSeasonProgression \
    --namespace "$AB_NAMESPACE" \
    --userId 'zTbMeD35' \
    > test.out 2>&1
eval_tap $? 34 'GetCurrentUserSeasonProgression' test.out

#- 35 CheckSeasonPurchasable
./ng net.accelbyte.sdk.cli.Main seasonpass checkSeasonPurchasable \
    --namespace "$AB_NAMESPACE" \
    --userId 'd9E2P8hW' \
    --body '{"passItemId": "jUpPvv1F", "tierItemCount": 70, "tierItemId": "9s5Yxng6"}' \
    > test.out 2>&1
eval_tap $? 35 'CheckSeasonPurchasable' test.out

#- 36 ResetUserSeason
./ng net.accelbyte.sdk.cli.Main seasonpass resetUserSeason \
    --namespace "$AB_NAMESPACE" \
    --userId 'dxVeU5Y0' \
    > test.out 2>&1
eval_tap $? 36 'ResetUserSeason' test.out

#- 37 GrantUserTier
./ng net.accelbyte.sdk.cli.Main seasonpass grantUserTier \
    --namespace "$AB_NAMESPACE" \
    --userId 'NiCujqfS' \
    --body '{"count": 63, "source": "PAID_FOR", "tags": ["I48EEfkW", "qZl5iYBa", "LFXuihBA"]}' \
    > test.out 2>&1
eval_tap $? 37 'GrantUserTier' test.out

#- 38 QueryUserExpGrantHistory
./ng net.accelbyte.sdk.cli.Main seasonpass queryUserExpGrantHistory \
    --namespace "$AB_NAMESPACE" \
    --userId 'DEW10uvZ' \
    --from 'CBYsFvxZ' \
    --limit '89' \
    --offset '9' \
    --seasonId 'RsEIlJAM' \
    --source 'SWEAT' \
    --tags 'plD8twz1,9wjYjlXC,1MPMydYe' \
    --to 'MznkexPR' \
    > test.out 2>&1
eval_tap $? 38 'QueryUserExpGrantHistory' test.out

#- 39 QueryUserExpGrantHistoryTag
./ng net.accelbyte.sdk.cli.Main seasonpass queryUserExpGrantHistoryTag \
    --namespace "$AB_NAMESPACE" \
    --userId '7IwPppwc' \
    --seasonId 'gg76rjVa' \
    > test.out 2>&1
eval_tap $? 39 'QueryUserExpGrantHistoryTag' test.out

#- 40 GetUserSeason
./ng net.accelbyte.sdk.cli.Main seasonpass getUserSeason \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'GoSuci7I' \
    --userId '0AQkwBEm' \
    > test.out 2>&1
eval_tap $? 40 'GetUserSeason' test.out

#- 41 PublicGetCurrentSeason
./ng net.accelbyte.sdk.cli.Main seasonpass publicGetCurrentSeason \
    --namespace "$AB_NAMESPACE" \
    --language 'flqyLPUm' \
    > test.out 2>&1
eval_tap $? 41 'PublicGetCurrentSeason' test.out

#- 42 PublicGetCurrentUserSeason
./ng net.accelbyte.sdk.cli.Main seasonpass publicGetCurrentUserSeason \
    --namespace "$AB_NAMESPACE" \
    --userId 'syqY5qYl' \
    > test.out 2>&1
eval_tap $? 42 'PublicGetCurrentUserSeason' test.out

#- 43 PublicClaimUserReward
./ng net.accelbyte.sdk.cli.Main seasonpass publicClaimUserReward \
    --namespace "$AB_NAMESPACE" \
    --userId 'T9EOhAvG' \
    --body '{"passCode": "9vdiJSzT", "rewardCode": "pKroVsOd", "tierIndex": 26}' \
    > test.out 2>&1
eval_tap $? 43 'PublicClaimUserReward' test.out

#- 44 PublicBulkClaimUserRewards
./ng net.accelbyte.sdk.cli.Main seasonpass publicBulkClaimUserRewards \
    --namespace "$AB_NAMESPACE" \
    --userId 't8pWXpwp' \
    > test.out 2>&1
eval_tap $? 44 'PublicBulkClaimUserRewards' test.out

#- 45 PublicGetUserSeason
./ng net.accelbyte.sdk.cli.Main seasonpass publicGetUserSeason \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'fDFloyaw' \
    --userId 'Rk4OrBim' \
    > test.out 2>&1
eval_tap $? 45 'PublicGetUserSeason' test.out


rm -f "tmp.dat"

exit $EXIT_CODE