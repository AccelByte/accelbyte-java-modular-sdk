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
echo "1..46"

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
    --limit '49' \
    --offset '19' \
    --status 'DRAFT,PUBLISHED,PUBLISHED' \
    > test.out 2>&1
eval_tap $? 3 'QuerySeasons' test.out

#- 4 CreateSeason
./ng net.accelbyte.sdk.cli.Main seasonpass createSeason \
    --namespace "$AB_NAMESPACE" \
    --body '{"autoClaim": false, "defaultLanguage": "HJC6hczk", "defaultRequiredExp": 62, "draftStoreId": "VYRqnBfm", "end": "1988-01-16T00:00:00Z", "excessStrategy": {"currency": "GULbHs56", "method": "CURRENCY", "percentPerExp": 92}, "images": [{"as": "XjVesBa0", "caption": "lHz3rbg0", "height": 64, "imageUrl": "ZdmZvYbz", "smallImageUrl": "FjkpMuGm", "width": 36}, {"as": "x09yjHwc", "caption": "Ji6X29rU", "height": 58, "imageUrl": "yNxp3XxK", "smallImageUrl": "I91VtlgK", "width": 3}, {"as": "AAczfkXx", "caption": "kqceZMu6", "height": 71, "imageUrl": "TiwV4veK", "smallImageUrl": "Gx3qWMiC", "width": 51}], "localizations": {"MbN7pY41": {"description": "ryBPkmSE", "title": "YgL62BOP"}, "IQ4ILZD4": {"description": "vWYkE5yl", "title": "XTMsUu0X"}, "OsZOj3st": {"description": "ojar8Oqe", "title": "qxkokth5"}}, "name": "ZwEI4IN9", "start": "1990-08-10T00:00:00Z", "tierItemId": "mmaTGGom"}' \
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
    --body '{"userIds": ["ojKYysDc", "TMV20I3H", "hDZqxIv0"]}' \
    > test.out 2>&1
eval_tap $? 6 'BulkGetUserSeasonProgression' test.out

#- 7 GetItemReferences
./ng net.accelbyte.sdk.cli.Main seasonpass getItemReferences \
    --namespace "$AB_NAMESPACE" \
    --itemId '0SncvAi4' \
    > test.out 2>&1
eval_tap $? 7 'GetItemReferences' test.out

#- 8 GetSeason
./ng net.accelbyte.sdk.cli.Main seasonpass getSeason \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'X8ShpHEw' \
    > test.out 2>&1
eval_tap $? 8 'GetSeason' test.out

#- 9 DeleteSeason
./ng net.accelbyte.sdk.cli.Main seasonpass deleteSeason \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'tegy3vch' \
    > test.out 2>&1
eval_tap $? 9 'DeleteSeason' test.out

#- 10 UpdateSeason
./ng net.accelbyte.sdk.cli.Main seasonpass updateSeason \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'jnK7XdGA' \
    --body '{"autoClaim": false, "defaultLanguage": "NONSS2Gd", "defaultRequiredExp": 43, "draftStoreId": "tTgFB1zF", "end": "1979-08-17T00:00:00Z", "excessStrategy": {"currency": "eSAkqLY9", "method": "CURRENCY", "percentPerExp": 81}, "images": [{"as": "iiNh011q", "caption": "wTjBYRgG", "height": 63, "imageUrl": "b5PFI321", "smallImageUrl": "HtadtrPD", "width": 45}, {"as": "PyWwkIHI", "caption": "ANRg48aj", "height": 100, "imageUrl": "BLuUR8J8", "smallImageUrl": "Y6EG33bc", "width": 84}, {"as": "rJJ82KzH", "caption": "i2SR2nlD", "height": 31, "imageUrl": "VVE09IIq", "smallImageUrl": "katLRKlC", "width": 33}], "localizations": {"yOQtANYJ": {"description": "lKPJi5Fp", "title": "PW7APDUG"}, "DyVIDa0C": {"description": "F8fjXzda", "title": "940q87N4"}, "lbDZaDvP": {"description": "8e771MN6", "title": "LHtAeU74"}}, "name": "pA4hwcPj", "start": "1990-11-26T00:00:00Z", "tierItemId": "RQZ0MU4c"}' \
    > test.out 2>&1
eval_tap $? 10 'UpdateSeason' test.out

#- 11 CloneSeason
./ng net.accelbyte.sdk.cli.Main seasonpass cloneSeason \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'WtxSWxAs' \
    --body '{"end": "1985-08-25T00:00:00Z", "name": "bjfAr9FU", "start": "1981-08-18T00:00:00Z"}' \
    > test.out 2>&1
eval_tap $? 11 'CloneSeason' test.out

#- 12 GetFullSeason
./ng net.accelbyte.sdk.cli.Main seasonpass getFullSeason \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'iYvWJae2' \
    > test.out 2>&1
eval_tap $? 12 'GetFullSeason' test.out

#- 13 QueryPasses
./ng net.accelbyte.sdk.cli.Main seasonpass queryPasses \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'Lks06J64' \
    > test.out 2>&1
eval_tap $? 13 'QueryPasses' test.out

#- 14 CreatePass
./ng net.accelbyte.sdk.cli.Main seasonpass createPass \
    --namespace "$AB_NAMESPACE" \
    --seasonId '4cjT9QCh' \
    --body '{"autoEnroll": false, "code": "sCpv1Kf0", "displayOrder": 31, "images": [{"as": "9HIIxyD3", "caption": "7s51OBjb", "height": 31, "imageUrl": "hJG8CddE", "smallImageUrl": "xoId0Cyo", "width": 82}, {"as": "auFaPMgm", "caption": "vRkus46f", "height": 20, "imageUrl": "AXDTweLR", "smallImageUrl": "uOaG7TUg", "width": 66}, {"as": "GhmXhTsR", "caption": "d4LE99zb", "height": 78, "imageUrl": "q2862rCo", "smallImageUrl": "mWFxYwqy", "width": 63}], "localizations": {"ooT2hCNz": {"description": "nkbzOLlz", "title": "JbJHIsyc"}, "ohDiBJI5": {"description": "LlfkpFCA", "title": "8JVfIst7"}, "p0abXMgz": {"description": "jYUCgbYE", "title": "B6JjCRG9"}}, "passItemId": "cVpduqzA"}' \
    > test.out 2>&1
eval_tap $? 14 'CreatePass' test.out

#- 15 GetPass
./ng net.accelbyte.sdk.cli.Main seasonpass getPass \
    --code 'gg2yZprJ' \
    --namespace "$AB_NAMESPACE" \
    --seasonId '51QJXp22' \
    > test.out 2>&1
eval_tap $? 15 'GetPass' test.out

#- 16 DeletePass
./ng net.accelbyte.sdk.cli.Main seasonpass deletePass \
    --code 't3Kye1j4' \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'GVl2MzUK' \
    > test.out 2>&1
eval_tap $? 16 'DeletePass' test.out

#- 17 UpdatePass
./ng net.accelbyte.sdk.cli.Main seasonpass updatePass \
    --code 'CpLiEdMU' \
    --namespace "$AB_NAMESPACE" \
    --seasonId 's4Mhu0Q7' \
    --body '{"autoEnroll": true, "displayOrder": 56, "images": [{"as": "MfB8ynZp", "caption": "ZPE4reda", "height": 10, "imageUrl": "8zTpGVAm", "smallImageUrl": "CZ4byk95", "width": 75}, {"as": "iARkFADD", "caption": "bfMLYwMB", "height": 89, "imageUrl": "yOSApGtd", "smallImageUrl": "zPnAxDjc", "width": 51}, {"as": "vOeRK4dD", "caption": "3BGpsh3p", "height": 75, "imageUrl": "AYGy9BOf", "smallImageUrl": "EB543V11", "width": 67}], "localizations": {"CKNtvPgO": {"description": "VQdmUNWU", "title": "snCB7Akj"}, "7CY2DlDO": {"description": "cMEqiyp0", "title": "VRzfyBrd"}, "rBmudNps": {"description": "PZjs5m3Z", "title": "xiYk6Skj"}}, "passItemId": "d1qbS5iy"}' \
    > test.out 2>&1
eval_tap $? 17 'UpdatePass' test.out

#- 18 PublishSeason
./ng net.accelbyte.sdk.cli.Main seasonpass publishSeason \
    --namespace "$AB_NAMESPACE" \
    --seasonId '6YikPEC0' \
    > test.out 2>&1
eval_tap $? 18 'PublishSeason' test.out

#- 19 RetireSeason
./ng net.accelbyte.sdk.cli.Main seasonpass retireSeason \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'gdgTWruX' \
    --force  \
    > test.out 2>&1
eval_tap $? 19 'RetireSeason' test.out

#- 20 QueryRewards
./ng net.accelbyte.sdk.cli.Main seasonpass queryRewards \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'bXRD9DaB' \
    --q 'gBkfoWpD' \
    > test.out 2>&1
eval_tap $? 20 'QueryRewards' test.out

#- 21 CreateReward
./ng net.accelbyte.sdk.cli.Main seasonpass createReward \
    --namespace "$AB_NAMESPACE" \
    --seasonId '8vk3rT6F' \
    --body '{"code": "VegpxXjk", "currency": {"currencyCode": "D7rG1oxO", "namespace": "0qdh2RRy"}, "image": {"as": "aMzVD3nq", "caption": "64x0Fz68", "height": 26, "imageUrl": "AsAa8yBb", "smallImageUrl": "5eo99gPW", "width": 54}, "itemId": "odnd7ZhK", "quantity": 95, "type": "CURRENCY"}' \
    > test.out 2>&1
eval_tap $? 21 'CreateReward' test.out

#- 22 GetReward
./ng net.accelbyte.sdk.cli.Main seasonpass getReward \
    --code 'oyYH5tFK' \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'XfGNRrTm' \
    > test.out 2>&1
eval_tap $? 22 'GetReward' test.out

#- 23 DeleteReward
./ng net.accelbyte.sdk.cli.Main seasonpass deleteReward \
    --code 'ehiEOljr' \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'PnHzmCji' \
    > test.out 2>&1
eval_tap $? 23 'DeleteReward' test.out

#- 24 UpdateReward
./ng net.accelbyte.sdk.cli.Main seasonpass updateReward \
    --code 'Sfzfmjbi' \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'DbPjmoQI' \
    --body '{"currency": {"currencyCode": "VyU62DIg", "namespace": "4p0Z2dg5"}, "image": {"as": "nMPO7s5a", "caption": "5PFL6dWI", "height": 87, "imageUrl": "g8f121KT", "smallImageUrl": "OIo89IdC", "width": 46}, "itemId": "jiTGLbRN", "nullFields": ["l6v4TZmx", "HIHQx0A3", "Btnsw9NW"], "quantity": 66, "type": "ITEM"}' \
    > test.out 2>&1
eval_tap $? 24 'UpdateReward' test.out

#- 25 QueryTiers
./ng net.accelbyte.sdk.cli.Main seasonpass queryTiers \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'BxJ6oDhr' \
    --limit '100' \
    --offset '20' \
    > test.out 2>&1
eval_tap $? 25 'QueryTiers' test.out

#- 26 CreateTier
./ng net.accelbyte.sdk.cli.Main seasonpass createTier \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'mIqrzmUC' \
    --body '{"index": 30, "quantity": 90, "tier": {"requiredExp": 34, "rewards": {"cioElcQe": ["TlpxmMnw", "KbOZ2YmU", "QDa0mTAe"], "r23Inylj": ["bY7GeSiL", "szeBft2j", "EJkykxmQ"], "OEUEWVHS": ["jYHw8RmG", "QcDbzRIk", "ZR0U5d31"]}}}' \
    > test.out 2>&1
eval_tap $? 26 'CreateTier' test.out

#- 27 UpdateTier
./ng net.accelbyte.sdk.cli.Main seasonpass updateTier \
    --id 'dQFVepvF' \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'KZYOxjJn' \
    --body '{"requiredExp": 8, "rewards": {"qdmcKU4n": ["3A8hseGi", "dC1mvgka", "9sF9wr3e"], "ktO2Bjrd": ["wYolsOaW", "nT3zrF3t", "rnobESRE"], "4EaW6lri": ["5oh7ZrKX", "cNuJD5r3", "q7q8MyLp"]}}' \
    > test.out 2>&1
eval_tap $? 27 'UpdateTier' test.out

#- 28 DeleteTier
./ng net.accelbyte.sdk.cli.Main seasonpass deleteTier \
    --id 'vUfhwtYg' \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'UKl39Dma' \
    > test.out 2>&1
eval_tap $? 28 'DeleteTier' test.out

#- 29 ReorderTier
./ng net.accelbyte.sdk.cli.Main seasonpass reorderTier \
    --id 'yCunqyv5' \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'i2pajR6N' \
    --body '{"newIndex": 19}' \
    > test.out 2>&1
eval_tap $? 29 'ReorderTier' test.out

#- 30 UnpublishSeason
./ng net.accelbyte.sdk.cli.Main seasonpass unpublishSeason \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'Qyk9J0oA' \
    --force  \
    > test.out 2>&1
eval_tap $? 30 'UnpublishSeason' test.out

#- 31 GetUserParticipatedSeasons
./ng net.accelbyte.sdk.cli.Main seasonpass getUserParticipatedSeasons \
    --namespace "$AB_NAMESPACE" \
    --userId 'saY7EyBw' \
    --limit '8' \
    --offset '77' \
    > test.out 2>&1
eval_tap $? 31 'GetUserParticipatedSeasons' test.out

#- 32 GrantUserExp
./ng net.accelbyte.sdk.cli.Main seasonpass grantUserExp \
    --namespace "$AB_NAMESPACE" \
    --userId 'YuicIrHb' \
    --body '{"exp": 12, "source": "PAID_FOR", "tags": ["VBjmfJP1", "QM2BZPRc", "GYE9786k"]}' \
    > test.out 2>&1
eval_tap $? 32 'GrantUserExp' test.out

#- 33 GrantUserPass
./ng net.accelbyte.sdk.cli.Main seasonpass grantUserPass \
    --namespace "$AB_NAMESPACE" \
    --userId 'FIis0Q2y' \
    --body '{"passCode": "lmnajYM7", "passItemId": "QEG6QLLy"}' \
    > test.out 2>&1
eval_tap $? 33 'GrantUserPass' test.out

#- 34 ExistsAnyPassByPassCodes
./ng net.accelbyte.sdk.cli.Main seasonpass existsAnyPassByPassCodes \
    --namespace "$AB_NAMESPACE" \
    --userId 'gAJrwaXv' \
    --passCodes 'Bi8Y9CHQ,z7S0qL8d,xonGcjzD' \
    > test.out 2>&1
eval_tap $? 34 'ExistsAnyPassByPassCodes' test.out

#- 35 GetCurrentUserSeasonProgression
./ng net.accelbyte.sdk.cli.Main seasonpass getCurrentUserSeasonProgression \
    --namespace "$AB_NAMESPACE" \
    --userId '5pGqorLO' \
    > test.out 2>&1
eval_tap $? 35 'GetCurrentUserSeasonProgression' test.out

#- 36 CheckSeasonPurchasable
./ng net.accelbyte.sdk.cli.Main seasonpass checkSeasonPurchasable \
    --namespace "$AB_NAMESPACE" \
    --userId 'JU06ywJe' \
    --body '{"passItemId": "OuMBFFbb", "tierItemCount": 78, "tierItemId": "ooTVImKN"}' \
    > test.out 2>&1
eval_tap $? 36 'CheckSeasonPurchasable' test.out

#- 37 ResetUserSeason
./ng net.accelbyte.sdk.cli.Main seasonpass resetUserSeason \
    --namespace "$AB_NAMESPACE" \
    --userId '5E2nLY4H' \
    > test.out 2>&1
eval_tap $? 37 'ResetUserSeason' test.out

#- 38 GrantUserTier
./ng net.accelbyte.sdk.cli.Main seasonpass grantUserTier \
    --namespace "$AB_NAMESPACE" \
    --userId 'nK3VX8B2' \
    --body '{"count": 78, "source": "SWEAT", "tags": ["pPwwL5Y7", "v3o9r3L0", "lKbrTvzV"]}' \
    > test.out 2>&1
eval_tap $? 38 'GrantUserTier' test.out

#- 39 QueryUserExpGrantHistory
./ng net.accelbyte.sdk.cli.Main seasonpass queryUserExpGrantHistory \
    --namespace "$AB_NAMESPACE" \
    --userId 'gTD2AUZq' \
    --from 'ZawOcQUK' \
    --limit '22' \
    --offset '87' \
    --seasonId 'j43U1zXN' \
    --source 'SWEAT' \
    --tags 'UfLBaySL,dNjiIux9,VtmomMC6' \
    --to '3UJePzIp' \
    > test.out 2>&1
eval_tap $? 39 'QueryUserExpGrantHistory' test.out

#- 40 QueryUserExpGrantHistoryTag
./ng net.accelbyte.sdk.cli.Main seasonpass queryUserExpGrantHistoryTag \
    --namespace "$AB_NAMESPACE" \
    --userId 'D5wlYmam' \
    --seasonId 'BpJCLL6v' \
    > test.out 2>&1
eval_tap $? 40 'QueryUserExpGrantHistoryTag' test.out

#- 41 GetUserSeason
./ng net.accelbyte.sdk.cli.Main seasonpass getUserSeason \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'MDILxLm8' \
    --userId 'fakciQlR' \
    > test.out 2>&1
eval_tap $? 41 'GetUserSeason' test.out

#- 42 PublicGetCurrentSeason
./ng net.accelbyte.sdk.cli.Main seasonpass publicGetCurrentSeason \
    --namespace "$AB_NAMESPACE" \
    --language 'Ab7tWtPR' \
    > test.out 2>&1
eval_tap $? 42 'PublicGetCurrentSeason' test.out

#- 43 PublicGetCurrentUserSeason
./ng net.accelbyte.sdk.cli.Main seasonpass publicGetCurrentUserSeason \
    --namespace "$AB_NAMESPACE" \
    --userId 'nNRVTp8D' \
    > test.out 2>&1
eval_tap $? 43 'PublicGetCurrentUserSeason' test.out

#- 44 PublicClaimUserReward
./ng net.accelbyte.sdk.cli.Main seasonpass publicClaimUserReward \
    --namespace "$AB_NAMESPACE" \
    --userId '9vVoNR90' \
    --body '{"passCode": "7pWUFCJl", "rewardCode": "wWMCLD2f", "tierIndex": 83}' \
    > test.out 2>&1
eval_tap $? 44 'PublicClaimUserReward' test.out

#- 45 PublicBulkClaimUserRewards
./ng net.accelbyte.sdk.cli.Main seasonpass publicBulkClaimUserRewards \
    --namespace "$AB_NAMESPACE" \
    --userId 'MFkcw0Gz' \
    > test.out 2>&1
eval_tap $? 45 'PublicBulkClaimUserRewards' test.out

#- 46 PublicGetUserSeason
./ng net.accelbyte.sdk.cli.Main seasonpass publicGetUserSeason \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'mRRayX9M' \
    --userId 'bWarQrzK' \
    > test.out 2>&1
eval_tap $? 46 'PublicGetUserSeason' test.out


rm -f "tmp.dat"

exit $EXIT_CODE