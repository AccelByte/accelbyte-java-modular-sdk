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
    --limit '56' \
    --offset '58' \
    --status 'RETIRED,DRAFT,RETIRED' \
    > test.out 2>&1
eval_tap $? 3 'QuerySeasons' test.out

#- 4 CreateSeason
./ng net.accelbyte.sdk.cli.Main seasonpass createSeason \
    --namespace "$AB_NAMESPACE" \
    --body '{"autoClaim": false, "defaultLanguage": "Ly5Qq0EH", "defaultRequiredExp": 23, "draftStoreId": "r4baKADU", "end": "1973-05-19T00:00:00Z", "excessStrategy": {"currency": "sPOmbh45", "method": "NONE", "percentPerExp": 21}, "images": [{"as": "8DTsPpWM", "caption": "wGhxblCo", "height": 4, "imageUrl": "PAXjg8kc", "smallImageUrl": "8Ebm81Bf", "width": 12}, {"as": "dg9yrDxn", "caption": "orLfVbBm", "height": 42, "imageUrl": "OALttaPD", "smallImageUrl": "cAVsh1YG", "width": 35}, {"as": "EpXDl67I", "caption": "GPdJgQ2f", "height": 28, "imageUrl": "FHMh4WOC", "smallImageUrl": "Lb0ouMKC", "width": 4}], "localizations": {"N2CaXs0k": {"description": "ZdGHzJ8w", "title": "pZTgBFL9"}, "Ou4aRtZQ": {"description": "j787iJWw", "title": "MyD4gE2P"}, "ZRd93BqD": {"description": "19ZsU9VJ", "title": "FTdPxnPQ"}}, "name": "OFy5h8HC", "start": "1984-05-26T00:00:00Z", "tierItemId": "g3YBhzBj"}' \
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
    --body '{"userIds": ["LRW2stoq", "06IAbHns", "SpLf0l4f"]}' \
    > test.out 2>&1
eval_tap $? 6 'BulkGetUserSeasonProgression' test.out

#- 7 GetItemReferences
./ng net.accelbyte.sdk.cli.Main seasonpass getItemReferences \
    --namespace "$AB_NAMESPACE" \
    --itemId 'MhVEuR4x' \
    > test.out 2>&1
eval_tap $? 7 'GetItemReferences' test.out

#- 8 GetSeason
./ng net.accelbyte.sdk.cli.Main seasonpass getSeason \
    --namespace "$AB_NAMESPACE" \
    --seasonId '2zCwGzXp' \
    > test.out 2>&1
eval_tap $? 8 'GetSeason' test.out

#- 9 DeleteSeason
./ng net.accelbyte.sdk.cli.Main seasonpass deleteSeason \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'lE3Eyyrc' \
    > test.out 2>&1
eval_tap $? 9 'DeleteSeason' test.out

#- 10 UpdateSeason
./ng net.accelbyte.sdk.cli.Main seasonpass updateSeason \
    --namespace "$AB_NAMESPACE" \
    --seasonId '37OSTZwH' \
    --body '{"autoClaim": true, "defaultLanguage": "0fyHfVfp", "defaultRequiredExp": 55, "draftStoreId": "TU8m4FXO", "end": "1980-04-30T00:00:00Z", "excessStrategy": {"currency": "cmSIECT1", "method": "NONE", "percentPerExp": 67}, "images": [{"as": "l7dtbLqD", "caption": "wJi2t0xW", "height": 83, "imageUrl": "YBOhqpRN", "smallImageUrl": "dXtv9F8H", "width": 71}, {"as": "5scqDobM", "caption": "Sohmdzpd", "height": 47, "imageUrl": "U0FArER6", "smallImageUrl": "sGzpMfCP", "width": 81}, {"as": "54yoTNEu", "caption": "G6EwdaQ1", "height": 62, "imageUrl": "RuSIxdsY", "smallImageUrl": "Avb1VqrG", "width": 41}], "localizations": {"ibH7IF9L": {"description": "i49dxema", "title": "npzyGik2"}, "5ZFnWJGq": {"description": "rledf8oU", "title": "mMOhxPC2"}, "ej7QWzu5": {"description": "ViQH66jw", "title": "wT6hl8qL"}}, "name": "PcMLGRQh", "start": "1976-07-15T00:00:00Z", "tierItemId": "SD8lwuY1"}' \
    > test.out 2>&1
eval_tap $? 10 'UpdateSeason' test.out

#- 11 CloneSeason
./ng net.accelbyte.sdk.cli.Main seasonpass cloneSeason \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'UEcf2yLt' \
    --body '{"end": "1978-04-23T00:00:00Z", "name": "3rdY9t3A", "start": "1999-11-11T00:00:00Z"}' \
    > test.out 2>&1
eval_tap $? 11 'CloneSeason' test.out

#- 12 GetFullSeason
./ng net.accelbyte.sdk.cli.Main seasonpass getFullSeason \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'J0Q52JfH' \
    > test.out 2>&1
eval_tap $? 12 'GetFullSeason' test.out

#- 13 QueryPasses
./ng net.accelbyte.sdk.cli.Main seasonpass queryPasses \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'c3Py7hGi' \
    > test.out 2>&1
eval_tap $? 13 'QueryPasses' test.out

#- 14 CreatePass
./ng net.accelbyte.sdk.cli.Main seasonpass createPass \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'mlfDQd8Z' \
    --body '{"autoEnroll": true, "code": "e1qAkeVz", "displayOrder": 46, "images": [{"as": "h3N8zHvP", "caption": "KZM6Nsja", "height": 22, "imageUrl": "Juo5tBFs", "smallImageUrl": "KUIEgKPp", "width": 98}, {"as": "6T1EKi8Y", "caption": "7mmR56Ax", "height": 82, "imageUrl": "f3YeNmVx", "smallImageUrl": "z1ns8k1J", "width": 60}, {"as": "BjYMR52O", "caption": "FpKBosh4", "height": 4, "imageUrl": "1G8tyKsK", "smallImageUrl": "Hu61zQYM", "width": 15}], "localizations": {"xST9cUAm": {"description": "eY6HzosB", "title": "BGPShnlE"}, "PMHgcsmu": {"description": "SYonH6gi", "title": "R6qWXSBr"}, "J2J68Uk3": {"description": "1YhaWr3U", "title": "387Bjs17"}}, "passItemId": "0Vp0OWyk"}' \
    > test.out 2>&1
eval_tap $? 14 'CreatePass' test.out

#- 15 GetPass
./ng net.accelbyte.sdk.cli.Main seasonpass getPass \
    --code 'KTtqxZyK' \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'XPhtdZ7S' \
    > test.out 2>&1
eval_tap $? 15 'GetPass' test.out

#- 16 DeletePass
./ng net.accelbyte.sdk.cli.Main seasonpass deletePass \
    --code '5IocLUxk' \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'GxX8gN2f' \
    > test.out 2>&1
eval_tap $? 16 'DeletePass' test.out

#- 17 UpdatePass
./ng net.accelbyte.sdk.cli.Main seasonpass updatePass \
    --code 'ZroodytK' \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'SOUZG44J' \
    --body '{"autoEnroll": true, "displayOrder": 74, "images": [{"as": "fkMWNiz5", "caption": "JdTLfLEa", "height": 38, "imageUrl": "3NAdfaXn", "smallImageUrl": "06BQNyAG", "width": 75}, {"as": "Ita7LV5I", "caption": "dbGi6mew", "height": 41, "imageUrl": "0JhgO7F9", "smallImageUrl": "WO3MMOWM", "width": 26}, {"as": "KEqn5x6P", "caption": "FJsxaQZ2", "height": 40, "imageUrl": "YFM5xwtx", "smallImageUrl": "zQ2FTzfH", "width": 98}], "localizations": {"njIvX1ds": {"description": "40mPzCTA", "title": "JXzpicpW"}, "x4f54hvy": {"description": "39b85I0Z", "title": "j8YzPILr"}, "m4N0Q8bF": {"description": "2VYzXlMR", "title": "btcrSDwK"}}, "passItemId": "0DcTf9lb"}' \
    > test.out 2>&1
eval_tap $? 17 'UpdatePass' test.out

#- 18 PublishSeason
./ng net.accelbyte.sdk.cli.Main seasonpass publishSeason \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'N7qiki56' \
    > test.out 2>&1
eval_tap $? 18 'PublishSeason' test.out

#- 19 RetireSeason
./ng net.accelbyte.sdk.cli.Main seasonpass retireSeason \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'bs7rgALt' \
    --force  \
    > test.out 2>&1
eval_tap $? 19 'RetireSeason' test.out

#- 20 QueryRewards
./ng net.accelbyte.sdk.cli.Main seasonpass queryRewards \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'nwQLq6cA' \
    --q 'tghB1tFJ' \
    > test.out 2>&1
eval_tap $? 20 'QueryRewards' test.out

#- 21 CreateReward
./ng net.accelbyte.sdk.cli.Main seasonpass createReward \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'jsq5GtSj' \
    --body '{"code": "bxPgWaBj", "currency": {"currencyCode": "tRZwZsJi", "namespace": "GFP29OQb"}, "image": {"as": "g91xABfy", "caption": "cuEqoPJF", "height": 52, "imageUrl": "APm7gGP5", "smallImageUrl": "ooNhj0eq", "width": 46}, "itemId": "3Xd49UIw", "quantity": 77, "type": "ITEM"}' \
    > test.out 2>&1
eval_tap $? 21 'CreateReward' test.out

#- 22 GetReward
./ng net.accelbyte.sdk.cli.Main seasonpass getReward \
    --code 'c0RI1CFN' \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'rRUDeI7p' \
    > test.out 2>&1
eval_tap $? 22 'GetReward' test.out

#- 23 DeleteReward
./ng net.accelbyte.sdk.cli.Main seasonpass deleteReward \
    --code 'Z0zkDzW1' \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'UBdagN0s' \
    > test.out 2>&1
eval_tap $? 23 'DeleteReward' test.out

#- 24 UpdateReward
./ng net.accelbyte.sdk.cli.Main seasonpass updateReward \
    --code 'a7YCuipa' \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'LXGc73aA' \
    --body '{"currency": {"currencyCode": "gLAhANyR", "namespace": "0aPUjXD0"}, "image": {"as": "W4Dz5I7r", "caption": "5ASl2uRi", "height": 13, "imageUrl": "lcU0FJhA", "smallImageUrl": "SYTQhtYe", "width": 29}, "itemId": "o3wAw3Nv", "nullFields": ["acZdBaeh", "rMucKWEw", "S3FmUmko"], "quantity": 7, "type": "ITEM"}' \
    > test.out 2>&1
eval_tap $? 24 'UpdateReward' test.out

#- 25 QueryTiers
./ng net.accelbyte.sdk.cli.Main seasonpass queryTiers \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'AKgOY0iU' \
    --limit '28' \
    --offset '2' \
    > test.out 2>&1
eval_tap $? 25 'QueryTiers' test.out

#- 26 CreateTier
./ng net.accelbyte.sdk.cli.Main seasonpass createTier \
    --namespace "$AB_NAMESPACE" \
    --seasonId '3rKZd6m7' \
    --body '{"index": 17, "quantity": 86, "tier": {"requiredExp": 44, "rewards": {"UPvDDWfI": ["4EUw0rbC", "IPKUZxKi", "V4qWUDwr"], "eJw880Qt": ["NmHIfF2b", "bdzV3CAY", "w1IGBgcr"], "3kaTIukI": ["wDTWkcVV", "G0WhTX72", "kxagPkz6"]}}}' \
    > test.out 2>&1
eval_tap $? 26 'CreateTier' test.out

#- 27 UpdateTier
./ng net.accelbyte.sdk.cli.Main seasonpass updateTier \
    --id '73I2CcLc' \
    --namespace "$AB_NAMESPACE" \
    --seasonId '0AkaYXLi' \
    --body '{"requiredExp": 27, "rewards": {"KUqvnVAh": ["KcwS8Fuc", "lWEjpCH9", "gtLZGGu3"], "nkdiW7nZ": ["psLUSZNy", "z48mLbPt", "OTsY72id"], "skvMVgqw": ["xrqhfpf7", "CUMwOVpV", "GIbDsMvs"]}}' \
    > test.out 2>&1
eval_tap $? 27 'UpdateTier' test.out

#- 28 DeleteTier
./ng net.accelbyte.sdk.cli.Main seasonpass deleteTier \
    --id 'Q9C2QnSr' \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'He6lnY8w' \
    > test.out 2>&1
eval_tap $? 28 'DeleteTier' test.out

#- 29 ReorderTier
./ng net.accelbyte.sdk.cli.Main seasonpass reorderTier \
    --id 'GmSEbdFL' \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'RcYkrC9p' \
    --body '{"newIndex": 60}' \
    > test.out 2>&1
eval_tap $? 29 'ReorderTier' test.out

#- 30 UnpublishSeason
./ng net.accelbyte.sdk.cli.Main seasonpass unpublishSeason \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'njlR8AB5' \
    --force  \
    > test.out 2>&1
eval_tap $? 30 'UnpublishSeason' test.out

#- 31 GetUserParticipatedSeasons
./ng net.accelbyte.sdk.cli.Main seasonpass getUserParticipatedSeasons \
    --namespace "$AB_NAMESPACE" \
    --userId 'sVO39e4B' \
    --limit '62' \
    --offset '16' \
    > test.out 2>&1
eval_tap $? 31 'GetUserParticipatedSeasons' test.out

#- 32 GrantUserExp
./ng net.accelbyte.sdk.cli.Main seasonpass grantUserExp \
    --namespace "$AB_NAMESPACE" \
    --userId 'ZYHDvIFC' \
    --body '{"exp": 0, "source": "PAID_FOR", "tags": ["876pODRx", "FiudBZ58", "ccyQbWSQ"]}' \
    > test.out 2>&1
eval_tap $? 32 'GrantUserExp' test.out

#- 33 GrantUserPass
./ng net.accelbyte.sdk.cli.Main seasonpass grantUserPass \
    --namespace "$AB_NAMESPACE" \
    --userId 'RBnppbdD' \
    --body '{"passCode": "rbF5lxZf", "passItemId": "THp2hJht"}' \
    > test.out 2>&1
eval_tap $? 33 'GrantUserPass' test.out

#- 34 ExistsAnyPassByPassCodes
./ng net.accelbyte.sdk.cli.Main seasonpass existsAnyPassByPassCodes \
    --namespace "$AB_NAMESPACE" \
    --userId 'ZjPjifjn' \
    --passCodes 'LDHTS9p1,pblZLiG7,To334IhH' \
    > test.out 2>&1
eval_tap $? 34 'ExistsAnyPassByPassCodes' test.out

#- 35 GetCurrentUserSeasonProgression
./ng net.accelbyte.sdk.cli.Main seasonpass getCurrentUserSeasonProgression \
    --namespace "$AB_NAMESPACE" \
    --userId '1nmIA05G' \
    > test.out 2>&1
eval_tap $? 35 'GetCurrentUserSeasonProgression' test.out

#- 36 CheckSeasonPurchasable
./ng net.accelbyte.sdk.cli.Main seasonpass checkSeasonPurchasable \
    --namespace "$AB_NAMESPACE" \
    --userId 'NzDuQTGK' \
    --body '{"passItemId": "LvzuqXHs", "tierItemCount": 53, "tierItemId": "vde3EO4N"}' \
    > test.out 2>&1
eval_tap $? 36 'CheckSeasonPurchasable' test.out

#- 37 ResetUserSeason
./ng net.accelbyte.sdk.cli.Main seasonpass resetUserSeason \
    --namespace "$AB_NAMESPACE" \
    --userId 'FuAPDUaO' \
    > test.out 2>&1
eval_tap $? 37 'ResetUserSeason' test.out

#- 38 GrantUserTier
./ng net.accelbyte.sdk.cli.Main seasonpass grantUserTier \
    --namespace "$AB_NAMESPACE" \
    --userId '64VhRyI8' \
    --body '{"count": 70, "source": "PAID_FOR", "tags": ["77bvbGCA", "v9WQfkHh", "MQhvI2et"]}' \
    > test.out 2>&1
eval_tap $? 38 'GrantUserTier' test.out

#- 39 QueryUserExpGrantHistory
./ng net.accelbyte.sdk.cli.Main seasonpass queryUserExpGrantHistory \
    --namespace "$AB_NAMESPACE" \
    --userId 'SCrnmIVP' \
    --from 'oFYXoLMp' \
    --limit '46' \
    --offset '25' \
    --seasonId '89WvyC4L' \
    --source 'PAID_FOR' \
    --tags 'qBFswbwC,pV4KjoT0,WBIOOjFi' \
    --to '0hKqoPGh' \
    > test.out 2>&1
eval_tap $? 39 'QueryUserExpGrantHistory' test.out

#- 40 QueryUserExpGrantHistoryTag
./ng net.accelbyte.sdk.cli.Main seasonpass queryUserExpGrantHistoryTag \
    --namespace "$AB_NAMESPACE" \
    --userId 'VcGnizMU' \
    --seasonId 'zWupzxKd' \
    > test.out 2>&1
eval_tap $? 40 'QueryUserExpGrantHistoryTag' test.out

#- 41 GetUserSeason
./ng net.accelbyte.sdk.cli.Main seasonpass getUserSeason \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'RoIDA3zY' \
    --userId 'fUT2zW87' \
    > test.out 2>&1
eval_tap $? 41 'GetUserSeason' test.out

#- 42 PublicGetCurrentSeason
./ng net.accelbyte.sdk.cli.Main seasonpass publicGetCurrentSeason \
    --namespace "$AB_NAMESPACE" \
    --language '0Htqsa6I' \
    > test.out 2>&1
eval_tap $? 42 'PublicGetCurrentSeason' test.out

#- 43 PublicGetCurrentUserSeason
./ng net.accelbyte.sdk.cli.Main seasonpass publicGetCurrentUserSeason \
    --namespace "$AB_NAMESPACE" \
    --userId 'lrMB202r' \
    > test.out 2>&1
eval_tap $? 43 'PublicGetCurrentUserSeason' test.out

#- 44 PublicClaimUserReward
./ng net.accelbyte.sdk.cli.Main seasonpass publicClaimUserReward \
    --namespace "$AB_NAMESPACE" \
    --userId 'aKtSQ50X' \
    --body '{"passCode": "SeTrudBi", "rewardCode": "smUvjzZu", "tierIndex": 46}' \
    > test.out 2>&1
eval_tap $? 44 'PublicClaimUserReward' test.out

#- 45 PublicBulkClaimUserRewards
./ng net.accelbyte.sdk.cli.Main seasonpass publicBulkClaimUserRewards \
    --namespace "$AB_NAMESPACE" \
    --userId 'XRY57GyQ' \
    > test.out 2>&1
eval_tap $? 45 'PublicBulkClaimUserRewards' test.out

#- 46 PublicGetUserSeason
./ng net.accelbyte.sdk.cli.Main seasonpass publicGetUserSeason \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'n1k4zVuO' \
    --userId '5Wa0GWbn' \
    > test.out 2>&1
eval_tap $? 46 'PublicGetUserSeason' test.out


rm -f "tmp.dat"

exit $EXIT_CODE