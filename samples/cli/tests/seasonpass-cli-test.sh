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
    --limit '32' \
    --offset '65' \
    --status 'DRAFT,RETIRED,DRAFT' \
    > test.out 2>&1
eval_tap $? 3 'QuerySeasons' test.out

#- 4 CreateSeason
./ng net.accelbyte.sdk.cli.Main seasonpass createSeason \
    --namespace "$AB_NAMESPACE" \
    --body '{"autoClaim": true, "defaultLanguage": "A9mRLBMF", "defaultRequiredExp": 78, "draftStoreId": "vlCvpqOO", "end": "1989-10-03T00:00:00Z", "excessStrategy": {"currency": "YZLlKrmb", "method": "NONE", "percentPerExp": 53}, "images": [{"as": "0ytHJXNC", "caption": "NbvPbUS8", "height": 12, "imageUrl": "vHh6qi5r", "smallImageUrl": "9SOMUHy1", "width": 39}, {"as": "yiEueZKo", "caption": "nBUj2x6g", "height": 35, "imageUrl": "cyiv4WIb", "smallImageUrl": "w7MUnSSJ", "width": 86}, {"as": "JassaVxC", "caption": "n7w2cP8F", "height": 66, "imageUrl": "fS7hlQM2", "smallImageUrl": "OCvjhPVm", "width": 45}], "localizations": {"ZjAjMwVB": {"description": "LL93aPqz", "title": "U4cmY5LW"}, "FRgM7MlF": {"description": "4oHGvl8d", "title": "K0xz2edL"}, "vqCpFvbz": {"description": "tsespgw4", "title": "sVwcbfly"}}, "name": "5TNMOeQA", "start": "1974-09-12T00:00:00Z", "tierItemId": "jJrYBUAh"}' \
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
    --body '{"userIds": ["xXObmyMK", "6MEt9QRD", "eQGdoH9L"]}' \
    > test.out 2>&1
eval_tap $? 6 'BulkGetUserSeasonProgression' test.out

#- 7 GetSeason
./ng net.accelbyte.sdk.cli.Main seasonpass getSeason \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'iuWUCfyT' \
    > test.out 2>&1
eval_tap $? 7 'GetSeason' test.out

#- 8 DeleteSeason
./ng net.accelbyte.sdk.cli.Main seasonpass deleteSeason \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'RkoGfRgs' \
    > test.out 2>&1
eval_tap $? 8 'DeleteSeason' test.out

#- 9 UpdateSeason
./ng net.accelbyte.sdk.cli.Main seasonpass updateSeason \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'FYvDfXC8' \
    --body '{"autoClaim": false, "defaultLanguage": "bEKztywB", "defaultRequiredExp": 49, "draftStoreId": "plm2q0Wc", "end": "1979-12-18T00:00:00Z", "excessStrategy": {"currency": "KTQrAZLT", "method": "CURRENCY", "percentPerExp": 35}, "images": [{"as": "2mDmCJfC", "caption": "smqYxjl2", "height": 99, "imageUrl": "8o3MECdt", "smallImageUrl": "rEUWqXTn", "width": 64}, {"as": "LqCtKSJD", "caption": "lvzFGjfp", "height": 13, "imageUrl": "tPzzghpX", "smallImageUrl": "gODTP5MK", "width": 75}, {"as": "kSN7Lv8F", "caption": "kEqqPUoy", "height": 43, "imageUrl": "BgsKceKe", "smallImageUrl": "f1N7tgdl", "width": 16}], "localizations": {"RaR7TdDV": {"description": "IPf1pmCA", "title": "Nm5HAlHP"}, "Iw4fMew7": {"description": "U1GvQUue", "title": "z7O4IwEl"}, "t4gYwtXc": {"description": "tgRqZMRZ", "title": "AFJNZJTl"}}, "name": "nrHWQJzE", "start": "1972-01-08T00:00:00Z", "tierItemId": "7BOiit5w"}' \
    > test.out 2>&1
eval_tap $? 9 'UpdateSeason' test.out

#- 10 CloneSeason
./ng net.accelbyte.sdk.cli.Main seasonpass cloneSeason \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'EhR7F8Sr' \
    --body '{"end": "1985-10-13T00:00:00Z", "name": "k62fiOaC", "start": "1976-08-08T00:00:00Z"}' \
    > test.out 2>&1
eval_tap $? 10 'CloneSeason' test.out

#- 11 GetFullSeason
./ng net.accelbyte.sdk.cli.Main seasonpass getFullSeason \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'ja0D5dhY' \
    > test.out 2>&1
eval_tap $? 11 'GetFullSeason' test.out

#- 12 QueryPasses
./ng net.accelbyte.sdk.cli.Main seasonpass queryPasses \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'R2yg36Hm' \
    > test.out 2>&1
eval_tap $? 12 'QueryPasses' test.out

#- 13 CreatePass
./ng net.accelbyte.sdk.cli.Main seasonpass createPass \
    --namespace "$AB_NAMESPACE" \
    --seasonId '1m5G2gtD' \
    --body '{"autoEnroll": false, "code": "1fh4VQZl", "displayOrder": 82, "images": [{"as": "35vL3ds3", "caption": "ZiAxOJcl", "height": 16, "imageUrl": "8iU7abcb", "smallImageUrl": "KvdfG9Pj", "width": 76}, {"as": "VheMfjlO", "caption": "aIWEwtZ6", "height": 96, "imageUrl": "iIZhP6g2", "smallImageUrl": "y5ecxstB", "width": 81}, {"as": "tEKinW0C", "caption": "OaxDEPuo", "height": 65, "imageUrl": "F8kgh5Hw", "smallImageUrl": "5b49JRDR", "width": 60}], "localizations": {"qYFPdKnX": {"description": "0Kv8PRtf", "title": "piqn5Nz1"}, "2KCgVT1b": {"description": "H28PCGNe", "title": "Jhdts88t"}, "3RWkt9nO": {"description": "p05QQa0h", "title": "grRzmO0T"}}, "passItemId": "h16ZgZ2g"}' \
    > test.out 2>&1
eval_tap $? 13 'CreatePass' test.out

#- 14 GetPass
./ng net.accelbyte.sdk.cli.Main seasonpass getPass \
    --code 'lFbhXS9H' \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'TMsbGf3M' \
    > test.out 2>&1
eval_tap $? 14 'GetPass' test.out

#- 15 DeletePass
./ng net.accelbyte.sdk.cli.Main seasonpass deletePass \
    --code 't5OqAEns' \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'bMjUzrNW' \
    > test.out 2>&1
eval_tap $? 15 'DeletePass' test.out

#- 16 UpdatePass
./ng net.accelbyte.sdk.cli.Main seasonpass updatePass \
    --code 'X0u2t7Nr' \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'OgQV3tKe' \
    --body '{"autoEnroll": false, "displayOrder": 47, "images": [{"as": "EUbsDjmg", "caption": "GvE0gXQN", "height": 25, "imageUrl": "ryBHLp7k", "smallImageUrl": "ize8paDs", "width": 0}, {"as": "WRZgUe1G", "caption": "IiFlw0GS", "height": 73, "imageUrl": "rcR4j9Ne", "smallImageUrl": "7BPpVJ7w", "width": 1}, {"as": "lvTvVgg6", "caption": "FGyw9twm", "height": 38, "imageUrl": "vDYSm9Yy", "smallImageUrl": "LUi3NGR2", "width": 65}], "localizations": {"QeBbdSlg": {"description": "Ka7ogQgj", "title": "3txL9KFT"}, "E5UVymut": {"description": "Z7aK0ung", "title": "tyVp2Utj"}, "LMWbMX1z": {"description": "Zmnk26YB", "title": "sbsEjpoj"}}, "passItemId": "dcRsWlNB"}' \
    > test.out 2>&1
eval_tap $? 16 'UpdatePass' test.out

#- 17 PublishSeason
./ng net.accelbyte.sdk.cli.Main seasonpass publishSeason \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'UisxGbdi' \
    > test.out 2>&1
eval_tap $? 17 'PublishSeason' test.out

#- 18 RetireSeason
./ng net.accelbyte.sdk.cli.Main seasonpass retireSeason \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'soEOzafI' \
    --force  \
    > test.out 2>&1
eval_tap $? 18 'RetireSeason' test.out

#- 19 QueryRewards
./ng net.accelbyte.sdk.cli.Main seasonpass queryRewards \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'pZXzIiQ5' \
    --q 'OJbCgXg5' \
    > test.out 2>&1
eval_tap $? 19 'QueryRewards' test.out

#- 20 CreateReward
./ng net.accelbyte.sdk.cli.Main seasonpass createReward \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'jiKjPIIK' \
    --body '{"code": "xwKSsZez", "currency": {"currencyCode": "t32xtq0A", "namespace": "7HGwZN0m"}, "image": {"as": "9Awqd1Zk", "caption": "V4nGgxAj", "height": 40, "imageUrl": "2eKhwUsk", "smallImageUrl": "DqfRI4As", "width": 71}, "itemId": "BAdoKnuH", "quantity": 82, "type": "ITEM"}' \
    > test.out 2>&1
eval_tap $? 20 'CreateReward' test.out

#- 21 GetReward
./ng net.accelbyte.sdk.cli.Main seasonpass getReward \
    --code 'UszQDkO7' \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'gigkxin5' \
    > test.out 2>&1
eval_tap $? 21 'GetReward' test.out

#- 22 DeleteReward
./ng net.accelbyte.sdk.cli.Main seasonpass deleteReward \
    --code 'S2IrAZjH' \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'wWrxzapo' \
    > test.out 2>&1
eval_tap $? 22 'DeleteReward' test.out

#- 23 UpdateReward
./ng net.accelbyte.sdk.cli.Main seasonpass updateReward \
    --code 'pozL6MKo' \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'BkyIgkz5' \
    --body '{"currency": {"currencyCode": "iWy9RwYd", "namespace": "cPwLoKmi"}, "image": {"as": "ojaKJeb7", "caption": "mq8JpQof", "height": 89, "imageUrl": "vPtfR0x7", "smallImageUrl": "UpGCTQMy", "width": 52}, "itemId": "BvYMnlkg", "nullFields": ["cx3WccjV", "CBxj87Q0", "Gum9P9wc"], "quantity": 64, "type": "ITEM"}' \
    > test.out 2>&1
eval_tap $? 23 'UpdateReward' test.out

#- 24 QueryTiers
./ng net.accelbyte.sdk.cli.Main seasonpass queryTiers \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'uz74ILKN' \
    --limit '59' \
    --offset '50' \
    > test.out 2>&1
eval_tap $? 24 'QueryTiers' test.out

#- 25 CreateTier
./ng net.accelbyte.sdk.cli.Main seasonpass createTier \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'WWKLwc9T' \
    --body '{"index": 64, "quantity": 88, "tier": {"requiredExp": 75, "rewards": {"zEj1ca8J": ["RZSmpJxn", "RDr6PLBc", "zIu22rYz"], "U4lYvdHj": ["h4HyHXI9", "OhD9sjU4", "83309fr3"], "hKGPc4JC": ["RBr0RSW8", "1nZDGgkK", "97Yp4Jic"]}}}' \
    > test.out 2>&1
eval_tap $? 25 'CreateTier' test.out

#- 26 UpdateTier
./ng net.accelbyte.sdk.cli.Main seasonpass updateTier \
    --id 'TMOOYRwk' \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'CRZVTv4h' \
    --body '{"requiredExp": 95, "rewards": {"EbA0Bf6r": ["mVxSWCyL", "NctEjpBe", "LKuK3GTu"], "da1GKRF1": ["dutsqt97", "Y2XK2DNi", "ngoYLnby"], "4zXNHHI8": ["3SxYoey2", "8R3RnQY3", "ile8G6dv"]}}' \
    > test.out 2>&1
eval_tap $? 26 'UpdateTier' test.out

#- 27 DeleteTier
./ng net.accelbyte.sdk.cli.Main seasonpass deleteTier \
    --id '95iDRBrO' \
    --namespace "$AB_NAMESPACE" \
    --seasonId '8S4r0yob' \
    > test.out 2>&1
eval_tap $? 27 'DeleteTier' test.out

#- 28 ReorderTier
./ng net.accelbyte.sdk.cli.Main seasonpass reorderTier \
    --id 'cmZ97WXX' \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'Bw9x2mh7' \
    --body '{"newIndex": 41}' \
    > test.out 2>&1
eval_tap $? 28 'ReorderTier' test.out

#- 29 UnpublishSeason
./ng net.accelbyte.sdk.cli.Main seasonpass unpublishSeason \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'g6Y3QsXd' \
    --force  \
    > test.out 2>&1
eval_tap $? 29 'UnpublishSeason' test.out

#- 30 GetUserParticipatedSeasons
./ng net.accelbyte.sdk.cli.Main seasonpass getUserParticipatedSeasons \
    --namespace "$AB_NAMESPACE" \
    --userId 'hm8LaU9P' \
    --limit '99' \
    --offset '45' \
    > test.out 2>&1
eval_tap $? 30 'GetUserParticipatedSeasons' test.out

#- 31 GrantUserExp
./ng net.accelbyte.sdk.cli.Main seasonpass grantUserExp \
    --namespace "$AB_NAMESPACE" \
    --userId '8lhBrWY7' \
    --body '{"exp": 17, "source": "PAID_FOR", "tags": ["zb7BzF0B", "M3kQ9TK6", "UIL8dCxo"]}' \
    > test.out 2>&1
eval_tap $? 31 'GrantUserExp' test.out

#- 32 GrantUserPass
./ng net.accelbyte.sdk.cli.Main seasonpass grantUserPass \
    --namespace "$AB_NAMESPACE" \
    --userId 'tBAlCBJP' \
    --body '{"passCode": "VR768Pby", "passItemId": "uAjCrySW"}' \
    > test.out 2>&1
eval_tap $? 32 'GrantUserPass' test.out

#- 33 ExistsAnyPassByPassCodes
./ng net.accelbyte.sdk.cli.Main seasonpass existsAnyPassByPassCodes \
    --namespace "$AB_NAMESPACE" \
    --userId 'HSsI4m9E' \
    --passCodes 'r0aPk3qp,d8K7xue5,2ywDkjhV' \
    > test.out 2>&1
eval_tap $? 33 'ExistsAnyPassByPassCodes' test.out

#- 34 GetCurrentUserSeasonProgression
./ng net.accelbyte.sdk.cli.Main seasonpass getCurrentUserSeasonProgression \
    --namespace "$AB_NAMESPACE" \
    --userId 'Jcv6sqJ5' \
    > test.out 2>&1
eval_tap $? 34 'GetCurrentUserSeasonProgression' test.out

#- 35 CheckSeasonPurchasable
./ng net.accelbyte.sdk.cli.Main seasonpass checkSeasonPurchasable \
    --namespace "$AB_NAMESPACE" \
    --userId 'zwjZOdd5' \
    --body '{"passItemId": "bm7HeMXx", "tierItemCount": 29, "tierItemId": "CWq1EZKW"}' \
    > test.out 2>&1
eval_tap $? 35 'CheckSeasonPurchasable' test.out

#- 36 ResetUserSeason
./ng net.accelbyte.sdk.cli.Main seasonpass resetUserSeason \
    --namespace "$AB_NAMESPACE" \
    --userId 'ZAjse1b8' \
    > test.out 2>&1
eval_tap $? 36 'ResetUserSeason' test.out

#- 37 GrantUserTier
./ng net.accelbyte.sdk.cli.Main seasonpass grantUserTier \
    --namespace "$AB_NAMESPACE" \
    --userId 'eVoOXks4' \
    --body '{"count": 88, "source": "SWEAT", "tags": ["wopmEYxD", "TX4vzUi3", "CdGoWwBz"]}' \
    > test.out 2>&1
eval_tap $? 37 'GrantUserTier' test.out

#- 38 QueryUserExpGrantHistory
./ng net.accelbyte.sdk.cli.Main seasonpass queryUserExpGrantHistory \
    --namespace "$AB_NAMESPACE" \
    --userId '03J4qakV' \
    --from 'jHbg10CA' \
    --limit '22' \
    --offset '50' \
    --seasonId 'AYtyoeJQ' \
    --source 'PAID_FOR' \
    --tags 'j1YVgj0N,Uv0bZSjo,EAJixTP6' \
    --to 'HZyFb9vf' \
    > test.out 2>&1
eval_tap $? 38 'QueryUserExpGrantHistory' test.out

#- 39 QueryUserExpGrantHistoryTag
./ng net.accelbyte.sdk.cli.Main seasonpass queryUserExpGrantHistoryTag \
    --namespace "$AB_NAMESPACE" \
    --userId 'ZX9byviL' \
    --seasonId 'nQ4hYXwo' \
    > test.out 2>&1
eval_tap $? 39 'QueryUserExpGrantHistoryTag' test.out

#- 40 GetUserSeason
./ng net.accelbyte.sdk.cli.Main seasonpass getUserSeason \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'wGqpA3yo' \
    --userId 'wXeMJNpw' \
    > test.out 2>&1
eval_tap $? 40 'GetUserSeason' test.out

#- 41 PublicGetCurrentSeason
./ng net.accelbyte.sdk.cli.Main seasonpass publicGetCurrentSeason \
    --namespace "$AB_NAMESPACE" \
    --language 'Jm9FYHk9' \
    > test.out 2>&1
eval_tap $? 41 'PublicGetCurrentSeason' test.out

#- 42 PublicGetCurrentUserSeason
./ng net.accelbyte.sdk.cli.Main seasonpass publicGetCurrentUserSeason \
    --namespace "$AB_NAMESPACE" \
    --userId '8RZmmF0P' \
    > test.out 2>&1
eval_tap $? 42 'PublicGetCurrentUserSeason' test.out

#- 43 PublicClaimUserReward
./ng net.accelbyte.sdk.cli.Main seasonpass publicClaimUserReward \
    --namespace "$AB_NAMESPACE" \
    --userId 'z1WV2xO4' \
    --body '{"passCode": "V2lqGVld", "rewardCode": "4PalqHn7", "tierIndex": 8}' \
    > test.out 2>&1
eval_tap $? 43 'PublicClaimUserReward' test.out

#- 44 PublicBulkClaimUserRewards
./ng net.accelbyte.sdk.cli.Main seasonpass publicBulkClaimUserRewards \
    --namespace "$AB_NAMESPACE" \
    --userId 'vrN9VISf' \
    > test.out 2>&1
eval_tap $? 44 'PublicBulkClaimUserRewards' test.out

#- 45 PublicGetUserSeason
./ng net.accelbyte.sdk.cli.Main seasonpass publicGetUserSeason \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'lo07xc8B' \
    --userId 'BEMUOdFo' \
    > test.out 2>&1
eval_tap $? 45 'PublicGetUserSeason' test.out


rm -f "tmp.dat"

exit $EXIT_CODE