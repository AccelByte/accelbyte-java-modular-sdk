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
    --limit '7' \
    --offset '58' \
    --status 'RETIRED,DRAFT,PUBLISHED' \
    > test.out 2>&1
eval_tap $? 3 'QuerySeasons' test.out

#- 4 CreateSeason
./ng net.accelbyte.sdk.cli.Main seasonpass createSeason \
    --namespace "$AB_NAMESPACE" \
    --body '{"autoClaim": true, "defaultLanguage": "C2D6ec6Y", "defaultRequiredExp": 74, "draftStoreId": "yVhXA15r", "end": "1978-03-13T00:00:00Z", "excessStrategy": {"currency": "GfihMXyP", "method": "NONE", "percentPerExp": 13}, "images": [{"as": "cGyxQvEt", "caption": "V9ALeIOP", "height": 80, "imageUrl": "xbS82S0b", "smallImageUrl": "69MOlEL3", "width": 15}, {"as": "f6ksYklP", "caption": "CYVcHyhd", "height": 70, "imageUrl": "VFMVyA4k", "smallImageUrl": "3VTw4kji", "width": 99}, {"as": "iMTZekZE", "caption": "92Eow9OS", "height": 87, "imageUrl": "O0ZTwY3S", "smallImageUrl": "xxnBpVU5", "width": 28}], "localizations": {"27TVDyZC": {"description": "zYMtOv5p", "title": "Z2Scj7aI"}, "sNxjQ4ap": {"description": "dBPM1xai", "title": "JAzbJ3Lj"}, "ywQZcfXz": {"description": "DJpfwYbW", "title": "37ZEUfba"}}, "name": "SGGFCYSD", "start": "1973-05-06T00:00:00Z", "tierItemId": "RWxTAW9B"}' \
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
    --body '{"userIds": ["yMp5t6AQ", "MPVFQGZv", "leewiNDv"]}' \
    > test.out 2>&1
eval_tap $? 6 'BulkGetUserSeasonProgression' test.out

#- 7 GetItemReferences
./ng net.accelbyte.sdk.cli.Main seasonpass getItemReferences \
    --namespace "$AB_NAMESPACE" \
    --itemId 'J7au28rJ' \
    > test.out 2>&1
eval_tap $? 7 'GetItemReferences' test.out

#- 8 GetSeason
./ng net.accelbyte.sdk.cli.Main seasonpass getSeason \
    --namespace "$AB_NAMESPACE" \
    --seasonId 's0q2bWy7' \
    > test.out 2>&1
eval_tap $? 8 'GetSeason' test.out

#- 9 DeleteSeason
./ng net.accelbyte.sdk.cli.Main seasonpass deleteSeason \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'uQAZ9Xx3' \
    > test.out 2>&1
eval_tap $? 9 'DeleteSeason' test.out

#- 10 UpdateSeason
./ng net.accelbyte.sdk.cli.Main seasonpass updateSeason \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'yHvWZWYS' \
    --body '{"autoClaim": false, "defaultLanguage": "uGBzCxcB", "defaultRequiredExp": 60, "draftStoreId": "0rFh3Q8E", "end": "1987-12-12T00:00:00Z", "excessStrategy": {"currency": "wELWBCcv", "method": "CURRENCY", "percentPerExp": 19}, "images": [{"as": "RTQmco1S", "caption": "lI3a1KOx", "height": 35, "imageUrl": "Ay8LgUKR", "smallImageUrl": "l0clPrFD", "width": 41}, {"as": "BsVYulKl", "caption": "TSd5F0sL", "height": 46, "imageUrl": "vdKcNy2K", "smallImageUrl": "HGtVrsbQ", "width": 25}, {"as": "NHBjYqdR", "caption": "GxKYX6Uj", "height": 3, "imageUrl": "Lz9Its0t", "smallImageUrl": "1TeBPNBi", "width": 84}], "localizations": {"1rKhLvAR": {"description": "RNP6cpHs", "title": "v7XAB9Qy"}, "0jodsX1P": {"description": "IkRfSPpA", "title": "rHL2BjXP"}, "8ekjxcRs": {"description": "FmiBiTg6", "title": "UZbiwm4h"}}, "name": "BTJIuQTB", "start": "1983-10-04T00:00:00Z", "tierItemId": "0PRNjdJe"}' \
    > test.out 2>&1
eval_tap $? 10 'UpdateSeason' test.out

#- 11 CloneSeason
./ng net.accelbyte.sdk.cli.Main seasonpass cloneSeason \
    --namespace "$AB_NAMESPACE" \
    --seasonId '4z8p0QQ6' \
    --body '{"end": "1984-11-22T00:00:00Z", "name": "zRqKf9lG", "start": "1974-08-01T00:00:00Z"}' \
    > test.out 2>&1
eval_tap $? 11 'CloneSeason' test.out

#- 12 GetFullSeason
./ng net.accelbyte.sdk.cli.Main seasonpass getFullSeason \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'xc5Cgznz' \
    > test.out 2>&1
eval_tap $? 12 'GetFullSeason' test.out

#- 13 QueryPasses
./ng net.accelbyte.sdk.cli.Main seasonpass queryPasses \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'AFmhXoc9' \
    > test.out 2>&1
eval_tap $? 13 'QueryPasses' test.out

#- 14 CreatePass
./ng net.accelbyte.sdk.cli.Main seasonpass createPass \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'MvHToirQ' \
    --body '{"autoEnroll": false, "code": "r2s72aaN", "displayOrder": 0, "images": [{"as": "yqsmXkJq", "caption": "9v2fBMUp", "height": 17, "imageUrl": "LUtf0rTR", "smallImageUrl": "haysvkBD", "width": 76}, {"as": "ip1m3z3d", "caption": "HgIgiIsd", "height": 57, "imageUrl": "B93CZS4n", "smallImageUrl": "uHfZ5pzv", "width": 22}, {"as": "Z6IFFcyS", "caption": "BPvsQfv9", "height": 35, "imageUrl": "Y61jYYY8", "smallImageUrl": "Y0aY2K37", "width": 5}], "localizations": {"06H5bFDS": {"description": "BCJaVtDi", "title": "PQ2ScP6J"}, "fRumI1cT": {"description": "ZVStpBKg", "title": "8EB7BGj2"}, "ksg4ysCe": {"description": "Trh5YsAn", "title": "DrmExq1s"}}, "passItemId": "I3l8ZXY0"}' \
    > test.out 2>&1
eval_tap $? 14 'CreatePass' test.out

#- 15 GetPass
./ng net.accelbyte.sdk.cli.Main seasonpass getPass \
    --code 'Uh9o4m9K' \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'ovLR6VQs' \
    > test.out 2>&1
eval_tap $? 15 'GetPass' test.out

#- 16 DeletePass
./ng net.accelbyte.sdk.cli.Main seasonpass deletePass \
    --code '0LxLAVks' \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'DpRzZMQe' \
    > test.out 2>&1
eval_tap $? 16 'DeletePass' test.out

#- 17 UpdatePass
./ng net.accelbyte.sdk.cli.Main seasonpass updatePass \
    --code 'iSu9fiar' \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'xoNNb8mw' \
    --body '{"autoEnroll": true, "displayOrder": 37, "images": [{"as": "oU0XHihl", "caption": "iZRoqJtJ", "height": 77, "imageUrl": "KoX5l2kk", "smallImageUrl": "1q0da1Vf", "width": 62}, {"as": "luQja4wQ", "caption": "iS7oOnOL", "height": 52, "imageUrl": "8WHobxxL", "smallImageUrl": "mgHYftos", "width": 98}, {"as": "m1JKnnF6", "caption": "kYySnT3V", "height": 91, "imageUrl": "Sjf0e6ZZ", "smallImageUrl": "VgS2EHl1", "width": 2}], "localizations": {"HgeP3Loq": {"description": "IuNMegID", "title": "4bhflSiu"}, "EjPVwx6G": {"description": "7gukURGU", "title": "7VJqtXsi"}, "GxXrqf7B": {"description": "g6o92Sgt", "title": "78nLvbU9"}}, "passItemId": "eoF0Rsvl"}' \
    > test.out 2>&1
eval_tap $? 17 'UpdatePass' test.out

#- 18 PublishSeason
./ng net.accelbyte.sdk.cli.Main seasonpass publishSeason \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'NvWSJbIl' \
    > test.out 2>&1
eval_tap $? 18 'PublishSeason' test.out

#- 19 RetireSeason
./ng net.accelbyte.sdk.cli.Main seasonpass retireSeason \
    --namespace "$AB_NAMESPACE" \
    --seasonId '6lZZ8H2B' \
    --force  \
    > test.out 2>&1
eval_tap $? 19 'RetireSeason' test.out

#- 20 QueryRewards
./ng net.accelbyte.sdk.cli.Main seasonpass queryRewards \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'grmTtT6X' \
    --q 'l3f5F3PI' \
    > test.out 2>&1
eval_tap $? 20 'QueryRewards' test.out

#- 21 CreateReward
./ng net.accelbyte.sdk.cli.Main seasonpass createReward \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'tbNvHQ2t' \
    --body '{"code": "fSMrgwEm", "currency": {"currencyCode": "E4iBdJkm", "namespace": "nekDi6Ht"}, "image": {"as": "L4IVvGd1", "caption": "wX3mor2o", "height": 99, "imageUrl": "99lEydK1", "smallImageUrl": "K0TM8P5S", "width": 37}, "itemId": "yj4Yhcob", "quantity": 52, "type": "ITEM"}' \
    > test.out 2>&1
eval_tap $? 21 'CreateReward' test.out

#- 22 GetReward
./ng net.accelbyte.sdk.cli.Main seasonpass getReward \
    --code 'wpVbu46A' \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'jxXyl5dY' \
    > test.out 2>&1
eval_tap $? 22 'GetReward' test.out

#- 23 DeleteReward
./ng net.accelbyte.sdk.cli.Main seasonpass deleteReward \
    --code 'C2ny2P3q' \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'McU3VN7H' \
    > test.out 2>&1
eval_tap $? 23 'DeleteReward' test.out

#- 24 UpdateReward
./ng net.accelbyte.sdk.cli.Main seasonpass updateReward \
    --code 'Qnqo2ykY' \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'xDxnHbqd' \
    --body '{"currency": {"currencyCode": "Il6Dkd2z", "namespace": "qKZjgypd"}, "image": {"as": "2iC6ttxh", "caption": "yLtd5Q3v", "height": 5, "imageUrl": "fWv5Kao2", "smallImageUrl": "Civ3KN9J", "width": 4}, "itemId": "QdeCsz6l", "nullFields": ["5KJkihaa", "lWn80ERK", "Y3wAURXn"], "quantity": 93, "type": "ITEM"}' \
    > test.out 2>&1
eval_tap $? 24 'UpdateReward' test.out

#- 25 QueryTiers
./ng net.accelbyte.sdk.cli.Main seasonpass queryTiers \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'FWoOc4pb' \
    --limit '23' \
    --offset '3' \
    > test.out 2>&1
eval_tap $? 25 'QueryTiers' test.out

#- 26 CreateTier
./ng net.accelbyte.sdk.cli.Main seasonpass createTier \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'HaL3vC40' \
    --body '{"index": 31, "quantity": 18, "tier": {"requiredExp": 33, "rewards": {"aEJnTT1x": ["O04Ovrde", "HpBRWv6X", "ugpH5xY6"], "XJ6dUw96": ["ccDDJ3JT", "JjKtX2iE", "BVBjJ4hv"], "GdsvEdbD": ["jJxJ13Si", "9SkXcZvB", "PYi0dmAl"]}}}' \
    > test.out 2>&1
eval_tap $? 26 'CreateTier' test.out

#- 27 UpdateTier
./ng net.accelbyte.sdk.cli.Main seasonpass updateTier \
    --id '7UC50I4y' \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'PHug521l' \
    --body '{"requiredExp": 75, "rewards": {"yIgTUmMD": ["zNbrihIz", "XQSamWJ9", "j9ZlUEYB"], "Imm3WnDE": ["4FrmCua7", "dQ9cTr9r", "rnjxVKRV"], "ewpGXvey": ["okjPzaLW", "6ALazZol", "00CseKAk"]}}' \
    > test.out 2>&1
eval_tap $? 27 'UpdateTier' test.out

#- 28 DeleteTier
./ng net.accelbyte.sdk.cli.Main seasonpass deleteTier \
    --id '7DWq8LJp' \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'GSPOrHWA' \
    > test.out 2>&1
eval_tap $? 28 'DeleteTier' test.out

#- 29 ReorderTier
./ng net.accelbyte.sdk.cli.Main seasonpass reorderTier \
    --id 'lyWsANXe' \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'DSFmUpuj' \
    --body '{"newIndex": 53}' \
    > test.out 2>&1
eval_tap $? 29 'ReorderTier' test.out

#- 30 UnpublishSeason
./ng net.accelbyte.sdk.cli.Main seasonpass unpublishSeason \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'd5hZK3cT' \
    --force  \
    > test.out 2>&1
eval_tap $? 30 'UnpublishSeason' test.out

#- 31 GetUserParticipatedSeasons
./ng net.accelbyte.sdk.cli.Main seasonpass getUserParticipatedSeasons \
    --namespace "$AB_NAMESPACE" \
    --userId 'XedDnVDL' \
    --limit '22' \
    --offset '41' \
    > test.out 2>&1
eval_tap $? 31 'GetUserParticipatedSeasons' test.out

#- 32 GrantUserExp
./ng net.accelbyte.sdk.cli.Main seasonpass grantUserExp \
    --namespace "$AB_NAMESPACE" \
    --userId 'Evl5QaOp' \
    --body '{"exp": 9, "source": "SWEAT", "tags": ["xoZjDrwa", "HjEiCJdQ", "np7kKaDR"]}' \
    > test.out 2>&1
eval_tap $? 32 'GrantUserExp' test.out

#- 33 GrantUserPass
./ng net.accelbyte.sdk.cli.Main seasonpass grantUserPass \
    --namespace "$AB_NAMESPACE" \
    --userId 'YHNN3lrg' \
    --body '{"passCode": "HHwrFe3o", "passItemId": "VlbODhSm"}' \
    > test.out 2>&1
eval_tap $? 33 'GrantUserPass' test.out

#- 34 ExistsAnyPassByPassCodes
./ng net.accelbyte.sdk.cli.Main seasonpass existsAnyPassByPassCodes \
    --namespace "$AB_NAMESPACE" \
    --userId 'tRCn1KfH' \
    --passCodes '2JXvHvqM,vxJzrAau,ZId7Ch8z' \
    > test.out 2>&1
eval_tap $? 34 'ExistsAnyPassByPassCodes' test.out

#- 35 GetCurrentUserSeasonProgression
./ng net.accelbyte.sdk.cli.Main seasonpass getCurrentUserSeasonProgression \
    --namespace "$AB_NAMESPACE" \
    --userId 'UnBeQC8u' \
    > test.out 2>&1
eval_tap $? 35 'GetCurrentUserSeasonProgression' test.out

#- 36 CheckSeasonPurchasable
./ng net.accelbyte.sdk.cli.Main seasonpass checkSeasonPurchasable \
    --namespace "$AB_NAMESPACE" \
    --userId '38H4ugXL' \
    --body '{"passItemId": "cGB1pHNu", "tierItemCount": 77, "tierItemId": "yJxUR6hX"}' \
    > test.out 2>&1
eval_tap $? 36 'CheckSeasonPurchasable' test.out

#- 37 ResetUserSeason
./ng net.accelbyte.sdk.cli.Main seasonpass resetUserSeason \
    --namespace "$AB_NAMESPACE" \
    --userId 'k1JhWaQc' \
    > test.out 2>&1
eval_tap $? 37 'ResetUserSeason' test.out

#- 38 GrantUserTier
./ng net.accelbyte.sdk.cli.Main seasonpass grantUserTier \
    --namespace "$AB_NAMESPACE" \
    --userId 'Q1suVGY7' \
    --body '{"count": 85, "source": "PAID_FOR", "tags": ["FQMxMYSs", "WdXabr0f", "rsve6eQd"]}' \
    > test.out 2>&1
eval_tap $? 38 'GrantUserTier' test.out

#- 39 QueryUserExpGrantHistory
./ng net.accelbyte.sdk.cli.Main seasonpass queryUserExpGrantHistory \
    --namespace "$AB_NAMESPACE" \
    --userId 'LvIRnKPY' \
    --from 'j4dxNWnL' \
    --limit '12' \
    --offset '12' \
    --seasonId 't9uIBpC9' \
    --source 'SWEAT' \
    --tags 'JttJcdfc,KdkFYqHZ,2ClvPafA' \
    --to 'NLERdxO6' \
    > test.out 2>&1
eval_tap $? 39 'QueryUserExpGrantHistory' test.out

#- 40 QueryUserExpGrantHistoryTag
./ng net.accelbyte.sdk.cli.Main seasonpass queryUserExpGrantHistoryTag \
    --namespace "$AB_NAMESPACE" \
    --userId 'KFDcw0BF' \
    --seasonId 'aSDl6Ron' \
    > test.out 2>&1
eval_tap $? 40 'QueryUserExpGrantHistoryTag' test.out

#- 41 GetUserSeason
./ng net.accelbyte.sdk.cli.Main seasonpass getUserSeason \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'oYliPo2L' \
    --userId 'InGIKdI9' \
    > test.out 2>&1
eval_tap $? 41 'GetUserSeason' test.out

#- 42 PublicGetCurrentSeason
./ng net.accelbyte.sdk.cli.Main seasonpass publicGetCurrentSeason \
    --namespace "$AB_NAMESPACE" \
    --language '56t17OP9' \
    > test.out 2>&1
eval_tap $? 42 'PublicGetCurrentSeason' test.out

#- 43 PublicGetCurrentUserSeason
./ng net.accelbyte.sdk.cli.Main seasonpass publicGetCurrentUserSeason \
    --namespace "$AB_NAMESPACE" \
    --userId 'uUd25rBD' \
    > test.out 2>&1
eval_tap $? 43 'PublicGetCurrentUserSeason' test.out

#- 44 PublicClaimUserReward
./ng net.accelbyte.sdk.cli.Main seasonpass publicClaimUserReward \
    --namespace "$AB_NAMESPACE" \
    --userId 'eFlJXiFH' \
    --body '{"passCode": "rFQGCruK", "rewardCode": "slRqOqH0", "tierIndex": 14}' \
    > test.out 2>&1
eval_tap $? 44 'PublicClaimUserReward' test.out

#- 45 PublicBulkClaimUserRewards
./ng net.accelbyte.sdk.cli.Main seasonpass publicBulkClaimUserRewards \
    --namespace "$AB_NAMESPACE" \
    --userId 'lI0TXJCJ' \
    > test.out 2>&1
eval_tap $? 45 'PublicBulkClaimUserRewards' test.out

#- 46 PublicGetUserSeason
./ng net.accelbyte.sdk.cli.Main seasonpass publicGetUserSeason \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'DU7dHLSw' \
    --userId 'NsZKBMGD' \
    > test.out 2>&1
eval_tap $? 46 'PublicGetUserSeason' test.out


rm -f "tmp.dat"

exit $EXIT_CODE