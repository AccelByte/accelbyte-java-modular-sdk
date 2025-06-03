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
    --limit '66' \
    --offset '28' \
    --status 'RETIRED,RETIRED,RETIRED' \
    > test.out 2>&1
eval_tap $? 3 'QuerySeasons' test.out

#- 4 CreateSeason
./ng net.accelbyte.sdk.cli.Main seasonpass createSeason \
    --namespace "$AB_NAMESPACE" \
    --body '{"autoClaim": false, "defaultLanguage": "xQFmWNlr", "defaultRequiredExp": 89, "draftStoreId": "TKCH01yE", "end": "1989-06-22T00:00:00Z", "excessStrategy": {"currency": "bZ3728iu", "method": "CURRENCY", "percentPerExp": 22}, "images": [{"as": "v60aqOtd", "caption": "am4SGWr2", "height": 51, "imageUrl": "Cg9tLuRv", "smallImageUrl": "OIMKa5PS", "width": 68}, {"as": "bpTZ9Ngc", "caption": "Jcaf9L7M", "height": 13, "imageUrl": "JJmhcl3P", "smallImageUrl": "UlWIDLfX", "width": 61}, {"as": "1YR52nL8", "caption": "aSHvAKTB", "height": 50, "imageUrl": "Dvg8VDjd", "smallImageUrl": "yTzrqrq4", "width": 44}], "localizations": {"8Vh01erQ": {"description": "ep12Rf9l", "title": "fQEBf1DG"}, "eJ2VjcVM": {"description": "qCWdvwhR", "title": "mNJ9GqxD"}, "CLXNYGFj": {"description": "R5Z8YVXb", "title": "TqHreUge"}}, "name": "DOUwRytv", "start": "1977-12-24T00:00:00Z", "tierItemId": "EsibWnFW"}' \
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
    --body '{"userIds": ["0XXJ0rXx", "3dEr6Cu3", "zcpYK94t"]}' \
    > test.out 2>&1
eval_tap $? 6 'BulkGetUserSeasonProgression' test.out

#- 7 GetItemReferences
./ng net.accelbyte.sdk.cli.Main seasonpass getItemReferences \
    --namespace "$AB_NAMESPACE" \
    --itemId 'pwQPwaZg' \
    > test.out 2>&1
eval_tap $? 7 'GetItemReferences' test.out

#- 8 GetSeason
./ng net.accelbyte.sdk.cli.Main seasonpass getSeason \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'JwpHvcSf' \
    > test.out 2>&1
eval_tap $? 8 'GetSeason' test.out

#- 9 DeleteSeason
./ng net.accelbyte.sdk.cli.Main seasonpass deleteSeason \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'n4zZfN8J' \
    > test.out 2>&1
eval_tap $? 9 'DeleteSeason' test.out

#- 10 UpdateSeason
./ng net.accelbyte.sdk.cli.Main seasonpass updateSeason \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'KuUglae7' \
    --body '{"autoClaim": false, "defaultLanguage": "cNLrxe2K", "defaultRequiredExp": 47, "draftStoreId": "eICHcZJb", "end": "1985-02-02T00:00:00Z", "excessStrategy": {"currency": "fnIwthiR", "method": "CURRENCY", "percentPerExp": 26}, "images": [{"as": "FGkA2r3N", "caption": "7q7JOjlA", "height": 76, "imageUrl": "XSWlc7pO", "smallImageUrl": "Wg4pvpw6", "width": 40}, {"as": "RDeiqZuU", "caption": "hhgkAJxe", "height": 69, "imageUrl": "dIpZplNo", "smallImageUrl": "0XVl28kU", "width": 45}, {"as": "WxVtXhvs", "caption": "omadx2TH", "height": 66, "imageUrl": "2PbEGTQi", "smallImageUrl": "AvYKy1Lx", "width": 33}], "localizations": {"a7Ss3mfL": {"description": "OIf2AYgf", "title": "xVkNidUG"}, "DFKY29gR": {"description": "fcJt3qWH", "title": "IQOVbABo"}, "Rf4h7nI1": {"description": "9RyNVr0f", "title": "wt5mAtDB"}}, "name": "03HZPxmR", "start": "1997-05-11T00:00:00Z", "tierItemId": "OOtlth7R"}' \
    > test.out 2>&1
eval_tap $? 10 'UpdateSeason' test.out

#- 11 CloneSeason
./ng net.accelbyte.sdk.cli.Main seasonpass cloneSeason \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'm7djdJLm' \
    --body '{"end": "1976-12-27T00:00:00Z", "name": "gEXJwZpk", "start": "1974-04-27T00:00:00Z"}' \
    > test.out 2>&1
eval_tap $? 11 'CloneSeason' test.out

#- 12 GetFullSeason
./ng net.accelbyte.sdk.cli.Main seasonpass getFullSeason \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'bhIhuN6z' \
    > test.out 2>&1
eval_tap $? 12 'GetFullSeason' test.out

#- 13 QueryPasses
./ng net.accelbyte.sdk.cli.Main seasonpass queryPasses \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'zN5A76kP' \
    > test.out 2>&1
eval_tap $? 13 'QueryPasses' test.out

#- 14 CreatePass
./ng net.accelbyte.sdk.cli.Main seasonpass createPass \
    --namespace "$AB_NAMESPACE" \
    --seasonId '4Q336tOZ' \
    --body '{"autoEnroll": false, "code": "fpVMm5DV", "displayOrder": 98, "images": [{"as": "lyWwHMRw", "caption": "AIf3Mqlm", "height": 13, "imageUrl": "Koht2SHO", "smallImageUrl": "WtP6c82W", "width": 56}, {"as": "VwPYpv8e", "caption": "ixPPQWVO", "height": 42, "imageUrl": "S9y13uVE", "smallImageUrl": "67cKc0NX", "width": 24}, {"as": "F4hZrsmY", "caption": "yAUkzbmU", "height": 94, "imageUrl": "5BDbWJYJ", "smallImageUrl": "jFY7cNkd", "width": 80}], "localizations": {"rEpN0F6s": {"description": "mqZ8gbGQ", "title": "i0oJQDSV"}, "KeOvMGcZ": {"description": "PtANgAOV", "title": "CwmxUvk5"}, "svnXYhmd": {"description": "o4pS2vVl", "title": "tewCglFX"}}, "passItemId": "4KGbYUdZ"}' \
    > test.out 2>&1
eval_tap $? 14 'CreatePass' test.out

#- 15 GetPass
./ng net.accelbyte.sdk.cli.Main seasonpass getPass \
    --code 'Zz7VPOBV' \
    --namespace "$AB_NAMESPACE" \
    --seasonId '3HF6Rcev' \
    > test.out 2>&1
eval_tap $? 15 'GetPass' test.out

#- 16 DeletePass
./ng net.accelbyte.sdk.cli.Main seasonpass deletePass \
    --code 'DZ79TMCS' \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'eSiuAV5W' \
    > test.out 2>&1
eval_tap $? 16 'DeletePass' test.out

#- 17 UpdatePass
./ng net.accelbyte.sdk.cli.Main seasonpass updatePass \
    --code 'Uy5j6aO1' \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'lU2vl8Pj' \
    --body '{"autoEnroll": false, "displayOrder": 91, "images": [{"as": "429XlWh4", "caption": "Yrj2sYqy", "height": 75, "imageUrl": "gGEm6gAx", "smallImageUrl": "xVK2BBrR", "width": 95}, {"as": "8AnAfrml", "caption": "EUoDbWyC", "height": 62, "imageUrl": "chMk8du5", "smallImageUrl": "cqaaWmhl", "width": 60}, {"as": "XFub3Ecr", "caption": "M6FpnKBo", "height": 63, "imageUrl": "aIdQ1pLM", "smallImageUrl": "t5CE2GWY", "width": 19}], "localizations": {"23k3leXb": {"description": "FZZvpNbj", "title": "NKwIDH0L"}, "isNYm0hb": {"description": "DWnBr3S3", "title": "binMHPWO"}, "RRv8vNXL": {"description": "WtDuhwYf", "title": "JSaj7TYq"}}, "passItemId": "GU4Vueid"}' \
    > test.out 2>&1
eval_tap $? 17 'UpdatePass' test.out

#- 18 PublishSeason
./ng net.accelbyte.sdk.cli.Main seasonpass publishSeason \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'JU0LkkEJ' \
    > test.out 2>&1
eval_tap $? 18 'PublishSeason' test.out

#- 19 RetireSeason
./ng net.accelbyte.sdk.cli.Main seasonpass retireSeason \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'O57nGIFG' \
    --force  \
    > test.out 2>&1
eval_tap $? 19 'RetireSeason' test.out

#- 20 QueryRewards
./ng net.accelbyte.sdk.cli.Main seasonpass queryRewards \
    --namespace "$AB_NAMESPACE" \
    --seasonId '3FIbAALB' \
    --q 'M0xPKbHp' \
    > test.out 2>&1
eval_tap $? 20 'QueryRewards' test.out

#- 21 CreateReward
./ng net.accelbyte.sdk.cli.Main seasonpass createReward \
    --namespace "$AB_NAMESPACE" \
    --seasonId '4InNbDWi' \
    --body '{"code": "4vyTFpRy", "currency": {"currencyCode": "QjUcLUf4", "namespace": "tTThOXqq"}, "image": {"as": "1XAmciVH", "caption": "2NT6fC3P", "height": 77, "imageUrl": "RVfTX5Du", "smallImageUrl": "3giz4uRy", "width": 1}, "itemId": "3pm5NRBV", "quantity": 29, "type": "CURRENCY"}' \
    > test.out 2>&1
eval_tap $? 21 'CreateReward' test.out

#- 22 GetReward
./ng net.accelbyte.sdk.cli.Main seasonpass getReward \
    --code 'KRR5Bn1u' \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'SjJzjOI1' \
    > test.out 2>&1
eval_tap $? 22 'GetReward' test.out

#- 23 DeleteReward
./ng net.accelbyte.sdk.cli.Main seasonpass deleteReward \
    --code '06ThrwUK' \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'CiJ23Wkv' \
    > test.out 2>&1
eval_tap $? 23 'DeleteReward' test.out

#- 24 UpdateReward
./ng net.accelbyte.sdk.cli.Main seasonpass updateReward \
    --code 'OfDUobj6' \
    --namespace "$AB_NAMESPACE" \
    --seasonId '3oJn3QHT' \
    --body '{"currency": {"currencyCode": "3RbjYcSN", "namespace": "HICOq8oG"}, "image": {"as": "HhO1CQM0", "caption": "QIvvRJm2", "height": 4, "imageUrl": "cyPeSrI3", "smallImageUrl": "sotI7jjL", "width": 47}, "itemId": "lIbVf3FU", "nullFields": ["T27WSNDP", "I736MZ51", "LtG05Rc7"], "quantity": 8, "type": "CURRENCY"}' \
    > test.out 2>&1
eval_tap $? 24 'UpdateReward' test.out

#- 25 QueryTiers
./ng net.accelbyte.sdk.cli.Main seasonpass queryTiers \
    --namespace "$AB_NAMESPACE" \
    --seasonId '46u51yVO' \
    --limit '33' \
    --offset '64' \
    > test.out 2>&1
eval_tap $? 25 'QueryTiers' test.out

#- 26 CreateTier
./ng net.accelbyte.sdk.cli.Main seasonpass createTier \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'Rl7U5zEI' \
    --body '{"index": 73, "quantity": 59, "tier": {"requiredExp": 75, "rewards": {"9PQj1dPF": ["M807SV5X", "YTTvSazH", "c8KyR0qi"], "UXcG97If": ["LEchSxXe", "aCUf1b8x", "5xPDvgUA"], "DxkMeGoB": ["T9fBWhkx", "f8fOMoFy", "v1ftNCny"]}}}' \
    > test.out 2>&1
eval_tap $? 26 'CreateTier' test.out

#- 27 UpdateTier
./ng net.accelbyte.sdk.cli.Main seasonpass updateTier \
    --id 'iqAq3HyG' \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'bxgYl2mL' \
    --body '{"requiredExp": 55, "rewards": {"t7WIjUFB": ["P2DCFyWO", "kCdN89k1", "cbhw32RF"], "S6eEmWtQ": ["E1NK2fWd", "cpps8OHY", "mdmZfRtk"], "bJlJM0xX": ["RcBjS5hT", "7f5jZCBq", "hHlJI9gz"]}}' \
    > test.out 2>&1
eval_tap $? 27 'UpdateTier' test.out

#- 28 DeleteTier
./ng net.accelbyte.sdk.cli.Main seasonpass deleteTier \
    --id 'Gly5ytBo' \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'mgdMWAOf' \
    > test.out 2>&1
eval_tap $? 28 'DeleteTier' test.out

#- 29 ReorderTier
./ng net.accelbyte.sdk.cli.Main seasonpass reorderTier \
    --id 'yM57LyVp' \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'ezWtiiYo' \
    --body '{"newIndex": 36}' \
    > test.out 2>&1
eval_tap $? 29 'ReorderTier' test.out

#- 30 UnpublishSeason
./ng net.accelbyte.sdk.cli.Main seasonpass unpublishSeason \
    --namespace "$AB_NAMESPACE" \
    --seasonId '2kjNNaEM' \
    --force  \
    > test.out 2>&1
eval_tap $? 30 'UnpublishSeason' test.out

#- 31 GetUserParticipatedSeasons
./ng net.accelbyte.sdk.cli.Main seasonpass getUserParticipatedSeasons \
    --namespace "$AB_NAMESPACE" \
    --userId 'zhXWQYYO' \
    --limit '64' \
    --offset '2' \
    > test.out 2>&1
eval_tap $? 31 'GetUserParticipatedSeasons' test.out

#- 32 GrantUserExp
./ng net.accelbyte.sdk.cli.Main seasonpass grantUserExp \
    --namespace "$AB_NAMESPACE" \
    --userId '16vOZIVD' \
    --body '{"exp": 19, "source": "PAID_FOR", "tags": ["bWGkeeRw", "2ZVbLZxt", "Db7zVc03"]}' \
    > test.out 2>&1
eval_tap $? 32 'GrantUserExp' test.out

#- 33 GrantUserPass
./ng net.accelbyte.sdk.cli.Main seasonpass grantUserPass \
    --namespace "$AB_NAMESPACE" \
    --userId 'pBD2ZrB4' \
    --body '{"passCode": "t2e0FsgK", "passItemId": "4UVqsvHh"}' \
    > test.out 2>&1
eval_tap $? 33 'GrantUserPass' test.out

#- 34 ExistsAnyPassByPassCodes
./ng net.accelbyte.sdk.cli.Main seasonpass existsAnyPassByPassCodes \
    --namespace "$AB_NAMESPACE" \
    --userId 'W5iC9uir' \
    --passCodes 'AwKUkMTF,HxEHPGfA,Fecux4pW' \
    > test.out 2>&1
eval_tap $? 34 'ExistsAnyPassByPassCodes' test.out

#- 35 GetCurrentUserSeasonProgression
./ng net.accelbyte.sdk.cli.Main seasonpass getCurrentUserSeasonProgression \
    --namespace "$AB_NAMESPACE" \
    --userId 'jkomSoLk' \
    > test.out 2>&1
eval_tap $? 35 'GetCurrentUserSeasonProgression' test.out

#- 36 CheckSeasonPurchasable
./ng net.accelbyte.sdk.cli.Main seasonpass checkSeasonPurchasable \
    --namespace "$AB_NAMESPACE" \
    --userId 'tKYmfUdy' \
    --body '{"passItemId": "JudfO9xm", "tierItemCount": 13, "tierItemId": "jJjRgk4C"}' \
    > test.out 2>&1
eval_tap $? 36 'CheckSeasonPurchasable' test.out

#- 37 ResetUserSeason
./ng net.accelbyte.sdk.cli.Main seasonpass resetUserSeason \
    --namespace "$AB_NAMESPACE" \
    --userId 'HTz7fnMN' \
    > test.out 2>&1
eval_tap $? 37 'ResetUserSeason' test.out

#- 38 GrantUserTier
./ng net.accelbyte.sdk.cli.Main seasonpass grantUserTier \
    --namespace "$AB_NAMESPACE" \
    --userId 'Audsng5C' \
    --body '{"count": 52, "source": "SWEAT", "tags": ["vkfNa0jT", "KUMJZkIu", "nCJUfyty"]}' \
    > test.out 2>&1
eval_tap $? 38 'GrantUserTier' test.out

#- 39 QueryUserExpGrantHistory
./ng net.accelbyte.sdk.cli.Main seasonpass queryUserExpGrantHistory \
    --namespace "$AB_NAMESPACE" \
    --userId 'TT7y6zeK' \
    --from 'RBMU5sQc' \
    --limit '77' \
    --offset '62' \
    --seasonId 'ydKXvWFU' \
    --source 'PAID_FOR' \
    --tags 'B7TxpQPH,D4LfAaCj,EAcbbw0F' \
    --to 'qBrZk8OP' \
    > test.out 2>&1
eval_tap $? 39 'QueryUserExpGrantHistory' test.out

#- 40 QueryUserExpGrantHistoryTag
./ng net.accelbyte.sdk.cli.Main seasonpass queryUserExpGrantHistoryTag \
    --namespace "$AB_NAMESPACE" \
    --userId '5V14FT5B' \
    --seasonId 'U4mVGPh0' \
    > test.out 2>&1
eval_tap $? 40 'QueryUserExpGrantHistoryTag' test.out

#- 41 GetUserSeason
./ng net.accelbyte.sdk.cli.Main seasonpass getUserSeason \
    --namespace "$AB_NAMESPACE" \
    --seasonId '0hUDenFP' \
    --userId 'sQ1mq5JB' \
    > test.out 2>&1
eval_tap $? 41 'GetUserSeason' test.out

#- 42 PublicGetCurrentSeason
./ng net.accelbyte.sdk.cli.Main seasonpass publicGetCurrentSeason \
    --namespace "$AB_NAMESPACE" \
    --language 'iDXN5OFZ' \
    > test.out 2>&1
eval_tap $? 42 'PublicGetCurrentSeason' test.out

#- 43 PublicGetCurrentUserSeason
./ng net.accelbyte.sdk.cli.Main seasonpass publicGetCurrentUserSeason \
    --namespace "$AB_NAMESPACE" \
    --userId 'PTp6FHVe' \
    > test.out 2>&1
eval_tap $? 43 'PublicGetCurrentUserSeason' test.out

#- 44 PublicClaimUserReward
./ng net.accelbyte.sdk.cli.Main seasonpass publicClaimUserReward \
    --namespace "$AB_NAMESPACE" \
    --userId 'TUfAcNq0' \
    --body '{"passCode": "oiXzPfyq", "rewardCode": "5HkCzGqU", "tierIndex": 47}' \
    > test.out 2>&1
eval_tap $? 44 'PublicClaimUserReward' test.out

#- 45 PublicBulkClaimUserRewards
./ng net.accelbyte.sdk.cli.Main seasonpass publicBulkClaimUserRewards \
    --namespace "$AB_NAMESPACE" \
    --userId '8EFKV3rX' \
    > test.out 2>&1
eval_tap $? 45 'PublicBulkClaimUserRewards' test.out

#- 46 PublicGetUserSeason
./ng net.accelbyte.sdk.cli.Main seasonpass publicGetUserSeason \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'WjYx3HYV' \
    --userId 'RpC3APi7' \
    > test.out 2>&1
eval_tap $? 46 'PublicGetUserSeason' test.out


rm -f "tmp.dat"

exit $EXIT_CODE