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
    --limit '23' \
    --offset '48' \
    --status 'RETIRED,RETIRED,PUBLISHED' \
    > test.out 2>&1
eval_tap $? 3 'QuerySeasons' test.out

#- 4 CreateSeason
./ng net.accelbyte.sdk.cli.Main seasonpass createSeason \
    --namespace "$AB_NAMESPACE" \
    --body '{"autoClaim": true, "defaultLanguage": "UlCoMdEk", "defaultRequiredExp": 54, "draftStoreId": "FWarivFm", "end": "1975-02-13T00:00:00Z", "excessStrategy": {"currency": "GGjeOVcP", "method": "CURRENCY", "percentPerExp": 69}, "images": [{"as": "amhzjKrJ", "caption": "VXySzzKc", "height": 6, "imageUrl": "ufwGe1mS", "smallImageUrl": "JKdP4TcP", "width": 52}, {"as": "O1mi8uyn", "caption": "SgmGitLU", "height": 83, "imageUrl": "YyPv9uV1", "smallImageUrl": "x6ZA2bEo", "width": 54}, {"as": "DXOxwwKH", "caption": "2Q1KNX8B", "height": 13, "imageUrl": "XO9xzqCa", "smallImageUrl": "EpTdSVTW", "width": 13}], "localizations": {"4EZ2P9xp": {"description": "8gFd1Z4C", "title": "IufnOwr9"}, "wl5vjY39": {"description": "aeVi8anb", "title": "kwWskZNt"}, "6uShCiqD": {"description": "n2Ewbcqc", "title": "LBR13su9"}}, "name": "NZPGuHBI", "start": "1994-04-14T00:00:00Z", "tierItemId": "KumoW3VZ"}' \
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
    --body '{"userIds": ["FOUbtkOV", "YqEYCHrg", "pKQyI0nL"]}' \
    > test.out 2>&1
eval_tap $? 6 'BulkGetUserSeasonProgression' test.out

#- 7 GetSeason
./ng net.accelbyte.sdk.cli.Main seasonpass getSeason \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'HHP9NK43' \
    > test.out 2>&1
eval_tap $? 7 'GetSeason' test.out

#- 8 DeleteSeason
./ng net.accelbyte.sdk.cli.Main seasonpass deleteSeason \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'wGwa27m0' \
    > test.out 2>&1
eval_tap $? 8 'DeleteSeason' test.out

#- 9 UpdateSeason
./ng net.accelbyte.sdk.cli.Main seasonpass updateSeason \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'RdPkjM0S' \
    --body '{"autoClaim": false, "defaultLanguage": "I1ikd8ic", "defaultRequiredExp": 62, "draftStoreId": "ZF5fubhj", "end": "1994-11-14T00:00:00Z", "excessStrategy": {"currency": "NnzlS4YC", "method": "CURRENCY", "percentPerExp": 4}, "images": [{"as": "wcHwVWZx", "caption": "jkzwfnht", "height": 33, "imageUrl": "rgpr8c1c", "smallImageUrl": "56bEY68t", "width": 73}, {"as": "RRVHKCDj", "caption": "6DVOodCk", "height": 99, "imageUrl": "RkxZeEzT", "smallImageUrl": "WVDChn9D", "width": 42}, {"as": "dEt8YEdK", "caption": "4g6ANyV9", "height": 95, "imageUrl": "ETlhn7uY", "smallImageUrl": "ruFjLs53", "width": 84}], "localizations": {"eLS3Plo7": {"description": "UgJx4CFr", "title": "euy8LhM2"}, "6MFVRg3Q": {"description": "XGfTnWmA", "title": "JIxXDfz9"}, "Kj1XzlIQ": {"description": "RvADsl75", "title": "aSnBvW4i"}}, "name": "qxuOJ9e4", "start": "1989-07-17T00:00:00Z", "tierItemId": "jmgdU0wr"}' \
    > test.out 2>&1
eval_tap $? 9 'UpdateSeason' test.out

#- 10 CloneSeason
./ng net.accelbyte.sdk.cli.Main seasonpass cloneSeason \
    --namespace "$AB_NAMESPACE" \
    --seasonId '5W5UMRgR' \
    --body '{"end": "1999-02-27T00:00:00Z", "name": "b9YmUydB", "start": "1987-04-22T00:00:00Z"}' \
    > test.out 2>&1
eval_tap $? 10 'CloneSeason' test.out

#- 11 GetFullSeason
./ng net.accelbyte.sdk.cli.Main seasonpass getFullSeason \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'HNRn87B9' \
    > test.out 2>&1
eval_tap $? 11 'GetFullSeason' test.out

#- 12 QueryPasses
./ng net.accelbyte.sdk.cli.Main seasonpass queryPasses \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'uVc20xMU' \
    > test.out 2>&1
eval_tap $? 12 'QueryPasses' test.out

#- 13 CreatePass
./ng net.accelbyte.sdk.cli.Main seasonpass createPass \
    --namespace "$AB_NAMESPACE" \
    --seasonId '3MaXLMFc' \
    --body '{"autoEnroll": true, "code": "h7eWdRkE", "displayOrder": 90, "images": [{"as": "4B446muW", "caption": "mLWARlpL", "height": 55, "imageUrl": "WnntMGYY", "smallImageUrl": "88fGW8Z2", "width": 57}, {"as": "uvOOywEJ", "caption": "s5Cb8fe0", "height": 76, "imageUrl": "ULC3bdbQ", "smallImageUrl": "5gKiFfLe", "width": 48}, {"as": "5RIFBSqd", "caption": "ceB2OezH", "height": 18, "imageUrl": "uxSGNNIq", "smallImageUrl": "5k0HG0Zi", "width": 89}], "localizations": {"4rqz9wSq": {"description": "lIu3cWGd", "title": "ZOHtUEeU"}, "XTXg26js": {"description": "yYN2KCkv", "title": "G8mkbFCt"}, "LQ7ZXYCM": {"description": "uqbbn5ae", "title": "kGO4UrE8"}}, "passItemId": "t7hQRxVY"}' \
    > test.out 2>&1
eval_tap $? 13 'CreatePass' test.out

#- 14 GetPass
./ng net.accelbyte.sdk.cli.Main seasonpass getPass \
    --code 'TpEJHq6S' \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'mRf6uQ24' \
    > test.out 2>&1
eval_tap $? 14 'GetPass' test.out

#- 15 DeletePass
./ng net.accelbyte.sdk.cli.Main seasonpass deletePass \
    --code 'DG2HA44m' \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'IRK5uAEm' \
    > test.out 2>&1
eval_tap $? 15 'DeletePass' test.out

#- 16 UpdatePass
./ng net.accelbyte.sdk.cli.Main seasonpass updatePass \
    --code 'wjAhmq5W' \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'VeQYyBCW' \
    --body '{"autoEnroll": true, "displayOrder": 22, "images": [{"as": "tLiEMJbV", "caption": "izE1OdCB", "height": 38, "imageUrl": "3mFxLD4n", "smallImageUrl": "edfgReVQ", "width": 61}, {"as": "JyagvFn1", "caption": "s16aiPnH", "height": 50, "imageUrl": "xfBe777Q", "smallImageUrl": "ZAkArKHc", "width": 66}, {"as": "vu98UeRS", "caption": "SBk2p6GP", "height": 1, "imageUrl": "31lTdwUK", "smallImageUrl": "rIrFT8Hj", "width": 12}], "localizations": {"TN1bgaMR": {"description": "Kd5QXpSZ", "title": "Q4Gfr8n8"}, "TCmXRnKW": {"description": "Wd4geAZ7", "title": "su7t2cLZ"}, "GPQyFlZF": {"description": "BRJroXiK", "title": "mbql99vs"}}, "passItemId": "GQe92SNu"}' \
    > test.out 2>&1
eval_tap $? 16 'UpdatePass' test.out

#- 17 PublishSeason
./ng net.accelbyte.sdk.cli.Main seasonpass publishSeason \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'MbCRuh06' \
    > test.out 2>&1
eval_tap $? 17 'PublishSeason' test.out

#- 18 RetireSeason
./ng net.accelbyte.sdk.cli.Main seasonpass retireSeason \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'gFD7muCb' \
    --force  \
    > test.out 2>&1
eval_tap $? 18 'RetireSeason' test.out

#- 19 QueryRewards
./ng net.accelbyte.sdk.cli.Main seasonpass queryRewards \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'pOYjajZ6' \
    --q 'qhAQDrpk' \
    > test.out 2>&1
eval_tap $? 19 'QueryRewards' test.out

#- 20 CreateReward
./ng net.accelbyte.sdk.cli.Main seasonpass createReward \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'OSgO5Tmq' \
    --body '{"code": "2ZuYC2Kq", "currency": {"currencyCode": "OuV5AB6n", "namespace": "zhG8jRZ1"}, "image": {"as": "Nrh1fEp8", "caption": "zv2w3Sf6", "height": 88, "imageUrl": "K1jm7XrP", "smallImageUrl": "TMkc0vkd", "width": 61}, "itemId": "TxNE15r1", "quantity": 65, "type": "ITEM"}' \
    > test.out 2>&1
eval_tap $? 20 'CreateReward' test.out

#- 21 GetReward
./ng net.accelbyte.sdk.cli.Main seasonpass getReward \
    --code 'Mim7shA2' \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'c3NSmJab' \
    > test.out 2>&1
eval_tap $? 21 'GetReward' test.out

#- 22 DeleteReward
./ng net.accelbyte.sdk.cli.Main seasonpass deleteReward \
    --code 'jZQcBXSS' \
    --namespace "$AB_NAMESPACE" \
    --seasonId '9OBaEgDN' \
    > test.out 2>&1
eval_tap $? 22 'DeleteReward' test.out

#- 23 UpdateReward
./ng net.accelbyte.sdk.cli.Main seasonpass updateReward \
    --code '6y2hCdwg' \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'yX2jakqj' \
    --body '{"currency": {"currencyCode": "2AmvOQjD", "namespace": "Wb2nD9Ge"}, "image": {"as": "g4wiKcKa", "caption": "DDIEqOD1", "height": 96, "imageUrl": "B6aN3Kh0", "smallImageUrl": "ru2yLdTj", "width": 68}, "itemId": "Hu6dgURM", "nullFields": ["7KKiUcZy", "BfJlMyy4", "AMdUjXyo"], "quantity": 57, "type": "CURRENCY"}' \
    > test.out 2>&1
eval_tap $? 23 'UpdateReward' test.out

#- 24 QueryTiers
./ng net.accelbyte.sdk.cli.Main seasonpass queryTiers \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'F1hyZJAc' \
    --limit '47' \
    --offset '81' \
    > test.out 2>&1
eval_tap $? 24 'QueryTiers' test.out

#- 25 CreateTier
./ng net.accelbyte.sdk.cli.Main seasonpass createTier \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'YJGkv5vQ' \
    --body '{"index": 39, "quantity": 14, "tier": {"requiredExp": 63, "rewards": {"hXBpTWsw": ["rNT3uoA3", "PLUaseQg", "uGWbnuoS"], "03P9VmJp": ["APqZfKyt", "TJYE0FoV", "tX9PhiEn"], "mYz3DxWF": ["mjLsewRL", "TbTdQbey", "lGmRSdW9"]}}}' \
    > test.out 2>&1
eval_tap $? 25 'CreateTier' test.out

#- 26 UpdateTier
./ng net.accelbyte.sdk.cli.Main seasonpass updateTier \
    --id '7LLcL9Jg' \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'vVIz19HZ' \
    --body '{"requiredExp": 64, "rewards": {"VxzfUscf": ["yYbFFS5y", "E4q22i7a", "H1ePA9nn"], "NreaclkD": ["5DpPpAvu", "UeCKqpio", "IZJKuiGL"], "QVqVjN0K": ["5duvmGss", "0a2fN8Tv", "sK2RToIE"]}}' \
    > test.out 2>&1
eval_tap $? 26 'UpdateTier' test.out

#- 27 DeleteTier
./ng net.accelbyte.sdk.cli.Main seasonpass deleteTier \
    --id '6zawe4bb' \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'sOajhHd5' \
    > test.out 2>&1
eval_tap $? 27 'DeleteTier' test.out

#- 28 ReorderTier
./ng net.accelbyte.sdk.cli.Main seasonpass reorderTier \
    --id 'FjCD8SF2' \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'EDEd7NmO' \
    --body '{"newIndex": 58}' \
    > test.out 2>&1
eval_tap $? 28 'ReorderTier' test.out

#- 29 UnpublishSeason
./ng net.accelbyte.sdk.cli.Main seasonpass unpublishSeason \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'O3r6bBtk' \
    --force  \
    > test.out 2>&1
eval_tap $? 29 'UnpublishSeason' test.out

#- 30 GetUserParticipatedSeasons
./ng net.accelbyte.sdk.cli.Main seasonpass getUserParticipatedSeasons \
    --namespace "$AB_NAMESPACE" \
    --userId 'U3UWI17e' \
    --limit '13' \
    --offset '52' \
    > test.out 2>&1
eval_tap $? 30 'GetUserParticipatedSeasons' test.out

#- 31 GrantUserExp
./ng net.accelbyte.sdk.cli.Main seasonpass grantUserExp \
    --namespace "$AB_NAMESPACE" \
    --userId 'N22A4whF' \
    --body '{"exp": 67, "source": "PAID_FOR", "tags": ["Mw8fZvey", "QTfdx1pL", "ZbU09pdr"]}' \
    > test.out 2>&1
eval_tap $? 31 'GrantUserExp' test.out

#- 32 GrantUserPass
./ng net.accelbyte.sdk.cli.Main seasonpass grantUserPass \
    --namespace "$AB_NAMESPACE" \
    --userId 'KQ089FzW' \
    --body '{"passCode": "8caSW2YX", "passItemId": "a5oOgkEG"}' \
    > test.out 2>&1
eval_tap $? 32 'GrantUserPass' test.out

#- 33 ExistsAnyPassByPassCodes
./ng net.accelbyte.sdk.cli.Main seasonpass existsAnyPassByPassCodes \
    --namespace "$AB_NAMESPACE" \
    --userId 'drSDPF4k' \
    --passCodes 'e2vKQXhW,oaoaocUn,fKftxs0t' \
    > test.out 2>&1
eval_tap $? 33 'ExistsAnyPassByPassCodes' test.out

#- 34 GetCurrentUserSeasonProgression
./ng net.accelbyte.sdk.cli.Main seasonpass getCurrentUserSeasonProgression \
    --namespace "$AB_NAMESPACE" \
    --userId 'tE29VqJf' \
    > test.out 2>&1
eval_tap $? 34 'GetCurrentUserSeasonProgression' test.out

#- 35 CheckSeasonPurchasable
./ng net.accelbyte.sdk.cli.Main seasonpass checkSeasonPurchasable \
    --namespace "$AB_NAMESPACE" \
    --userId 'GHTH9fD0' \
    --body '{"passItemId": "xkOBe3fc", "tierItemCount": 64, "tierItemId": "km0RJUsb"}' \
    > test.out 2>&1
eval_tap $? 35 'CheckSeasonPurchasable' test.out

#- 36 ResetUserSeason
./ng net.accelbyte.sdk.cli.Main seasonpass resetUserSeason \
    --namespace "$AB_NAMESPACE" \
    --userId 'SHdt55lm' \
    > test.out 2>&1
eval_tap $? 36 'ResetUserSeason' test.out

#- 37 GrantUserTier
./ng net.accelbyte.sdk.cli.Main seasonpass grantUserTier \
    --namespace "$AB_NAMESPACE" \
    --userId 'u9QXKod7' \
    --body '{"count": 52, "source": "SWEAT", "tags": ["dvRBnHvz", "UJy48oQS", "plJ5oGQX"]}' \
    > test.out 2>&1
eval_tap $? 37 'GrantUserTier' test.out

#- 38 QueryUserExpGrantHistory
./ng net.accelbyte.sdk.cli.Main seasonpass queryUserExpGrantHistory \
    --namespace "$AB_NAMESPACE" \
    --userId 'mJeImlcA' \
    --from 'NIMgjre4' \
    --limit '95' \
    --offset '51' \
    --seasonId 'pQbcMwCj' \
    --source 'SWEAT' \
    --tags '5s4Zvdhg,6Lt6oZEZ,LZhosTZk' \
    --to 'pLKmBLft' \
    > test.out 2>&1
eval_tap $? 38 'QueryUserExpGrantHistory' test.out

#- 39 QueryUserExpGrantHistoryTag
./ng net.accelbyte.sdk.cli.Main seasonpass queryUserExpGrantHistoryTag \
    --namespace "$AB_NAMESPACE" \
    --userId 'mkTHqOC9' \
    --seasonId '3H2g5vZQ' \
    > test.out 2>&1
eval_tap $? 39 'QueryUserExpGrantHistoryTag' test.out

#- 40 GetUserSeason
./ng net.accelbyte.sdk.cli.Main seasonpass getUserSeason \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'QxqRM9ug' \
    --userId 'OBNFl4ki' \
    > test.out 2>&1
eval_tap $? 40 'GetUserSeason' test.out

#- 41 PublicGetCurrentSeason
./ng net.accelbyte.sdk.cli.Main seasonpass publicGetCurrentSeason \
    --namespace "$AB_NAMESPACE" \
    --language 'jp1YTSxj' \
    > test.out 2>&1
eval_tap $? 41 'PublicGetCurrentSeason' test.out

#- 42 PublicGetCurrentUserSeason
./ng net.accelbyte.sdk.cli.Main seasonpass publicGetCurrentUserSeason \
    --namespace "$AB_NAMESPACE" \
    --userId 'kx9YgRTs' \
    > test.out 2>&1
eval_tap $? 42 'PublicGetCurrentUserSeason' test.out

#- 43 PublicClaimUserReward
./ng net.accelbyte.sdk.cli.Main seasonpass publicClaimUserReward \
    --namespace "$AB_NAMESPACE" \
    --userId 'brBip6JX' \
    --body '{"passCode": "cxii0zDx", "rewardCode": "cJyxX3Xh", "tierIndex": 50}' \
    > test.out 2>&1
eval_tap $? 43 'PublicClaimUserReward' test.out

#- 44 PublicBulkClaimUserRewards
./ng net.accelbyte.sdk.cli.Main seasonpass publicBulkClaimUserRewards \
    --namespace "$AB_NAMESPACE" \
    --userId 'T3p4gzvH' \
    > test.out 2>&1
eval_tap $? 44 'PublicBulkClaimUserRewards' test.out

#- 45 PublicGetUserSeason
./ng net.accelbyte.sdk.cli.Main seasonpass publicGetUserSeason \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'lyJelBse' \
    --userId 'OQLdfjAP' \
    > test.out 2>&1
eval_tap $? 45 'PublicGetUserSeason' test.out


rm -f "tmp.dat"

exit $EXIT_CODE