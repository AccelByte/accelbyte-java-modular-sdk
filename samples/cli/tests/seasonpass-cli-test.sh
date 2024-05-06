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
    --limit '77' \
    --offset '22' \
    --status 'RETIRED,DRAFT,PUBLISHED' \
    > test.out 2>&1
eval_tap $? 3 'QuerySeasons' test.out

#- 4 CreateSeason
./ng net.accelbyte.sdk.cli.Main seasonpass createSeason \
    --namespace "$AB_NAMESPACE" \
    --body '{"autoClaim": false, "defaultLanguage": "Hu3VeRSL", "defaultRequiredExp": 61, "draftStoreId": "BCmrdykz", "end": "1991-09-09T00:00:00Z", "excessStrategy": {"currency": "5Yn1gmc9", "method": "CURRENCY", "percentPerExp": 12}, "images": [{"as": "CXqUE86r", "caption": "wYCVxfOq", "height": 70, "imageUrl": "WUD2X7e0", "smallImageUrl": "dO3zeWed", "width": 64}, {"as": "xWsQBxlY", "caption": "627HauSf", "height": 75, "imageUrl": "sT4nLNOL", "smallImageUrl": "54RKflZj", "width": 98}, {"as": "G6YkpsPt", "caption": "MksReHMC", "height": 67, "imageUrl": "tXDzFQas", "smallImageUrl": "gTtUeRG4", "width": 7}], "localizations": {"YzXbMWrz": {"description": "tlGMSI3p", "title": "sr1nzdc7"}, "lpYJNWyH": {"description": "i7BIWn7s", "title": "DB1mGtUF"}, "u0LuBW1a": {"description": "Rr6PjHmP", "title": "0YopfhYL"}}, "name": "4miceMk4", "start": "1980-08-25T00:00:00Z", "tierItemId": "e3MoKt1D"}' \
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
    --body '{"userIds": ["zq277DVX", "vqccq1BY", "cKyYgVXn"]}' \
    > test.out 2>&1
eval_tap $? 6 'BulkGetUserSeasonProgression' test.out

#- 7 GetSeason
./ng net.accelbyte.sdk.cli.Main seasonpass getSeason \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'rnp2ZNcx' \
    > test.out 2>&1
eval_tap $? 7 'GetSeason' test.out

#- 8 DeleteSeason
./ng net.accelbyte.sdk.cli.Main seasonpass deleteSeason \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'WClxugRF' \
    > test.out 2>&1
eval_tap $? 8 'DeleteSeason' test.out

#- 9 UpdateSeason
./ng net.accelbyte.sdk.cli.Main seasonpass updateSeason \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'QHReZDz3' \
    --body '{"autoClaim": false, "defaultLanguage": "YQSEZZAM", "defaultRequiredExp": 28, "draftStoreId": "JKlDARkB", "end": "1974-12-18T00:00:00Z", "excessStrategy": {"currency": "XIoIQ9Hq", "method": "NONE", "percentPerExp": 94}, "images": [{"as": "KGIdajVX", "caption": "3eSOZHXm", "height": 60, "imageUrl": "5GTaAyoI", "smallImageUrl": "vWG9nZOB", "width": 31}, {"as": "T7WsK53B", "caption": "0ufe106u", "height": 23, "imageUrl": "xgePe8XJ", "smallImageUrl": "Nl9dbRzw", "width": 4}, {"as": "W4Os5e7e", "caption": "DEXuPiTI", "height": 40, "imageUrl": "tMXwD5DG", "smallImageUrl": "unI5eu4K", "width": 76}], "localizations": {"LWaEGbez": {"description": "4JXITWLo", "title": "AThpEEx8"}, "e03fw0q5": {"description": "LXUMMtn1", "title": "0UuKnr90"}, "RLYe0l3T": {"description": "LQiPjnKo", "title": "v43qcrZK"}}, "name": "klEz0Nst", "start": "1973-08-07T00:00:00Z", "tierItemId": "lYZDZEPj"}' \
    > test.out 2>&1
eval_tap $? 9 'UpdateSeason' test.out

#- 10 CloneSeason
./ng net.accelbyte.sdk.cli.Main seasonpass cloneSeason \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'EJaPMgZp' \
    --body '{"end": "1981-08-30T00:00:00Z", "name": "ckwGCOB3", "start": "1991-01-19T00:00:00Z"}' \
    > test.out 2>&1
eval_tap $? 10 'CloneSeason' test.out

#- 11 GetFullSeason
./ng net.accelbyte.sdk.cli.Main seasonpass getFullSeason \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'p9SydSRZ' \
    > test.out 2>&1
eval_tap $? 11 'GetFullSeason' test.out

#- 12 QueryPasses
./ng net.accelbyte.sdk.cli.Main seasonpass queryPasses \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'PGmx8vfs' \
    > test.out 2>&1
eval_tap $? 12 'QueryPasses' test.out

#- 13 CreatePass
./ng net.accelbyte.sdk.cli.Main seasonpass createPass \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'nDPlrQ9f' \
    --body '{"autoEnroll": false, "code": "E9EQJP5X", "displayOrder": 99, "images": [{"as": "aLjo2AfP", "caption": "s7MWH71t", "height": 86, "imageUrl": "zbReqGnn", "smallImageUrl": "4dWBiSsr", "width": 3}, {"as": "wrNCrltP", "caption": "1tcGtqqe", "height": 71, "imageUrl": "n1Q8d3DI", "smallImageUrl": "BR4vBy7v", "width": 2}, {"as": "YIMzRwCm", "caption": "BYxem2J5", "height": 33, "imageUrl": "22HPsAM2", "smallImageUrl": "1h6RGyut", "width": 63}], "localizations": {"O0b0O2f4": {"description": "n7QJwIeu", "title": "HPW6fJmN"}, "AEIfT8Si": {"description": "5YoG1hoW", "title": "iex6iJ9P"}, "2RT7Bzbl": {"description": "oWAPYsb8", "title": "5Xbug5AM"}}, "passItemId": "d2h476B6"}' \
    > test.out 2>&1
eval_tap $? 13 'CreatePass' test.out

#- 14 GetPass
./ng net.accelbyte.sdk.cli.Main seasonpass getPass \
    --code 'fWF8oXX3' \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'qhppV5Yn' \
    > test.out 2>&1
eval_tap $? 14 'GetPass' test.out

#- 15 DeletePass
./ng net.accelbyte.sdk.cli.Main seasonpass deletePass \
    --code 'UL66bU5S' \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'IG3HButr' \
    > test.out 2>&1
eval_tap $? 15 'DeletePass' test.out

#- 16 UpdatePass
./ng net.accelbyte.sdk.cli.Main seasonpass updatePass \
    --code 'VpvoenTK' \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'FluEHc2o' \
    --body '{"autoEnroll": true, "displayOrder": 5, "images": [{"as": "AvPeddRL", "caption": "V1sPggoP", "height": 93, "imageUrl": "WnePSohG", "smallImageUrl": "gBuwRxLH", "width": 26}, {"as": "NwQeD5BF", "caption": "fZoeqkgQ", "height": 9, "imageUrl": "msHwsohe", "smallImageUrl": "km6qyM5A", "width": 81}, {"as": "NASAF5T7", "caption": "jmDYuh4k", "height": 37, "imageUrl": "Qg93IEhF", "smallImageUrl": "9kVjNUNc", "width": 30}], "localizations": {"x2mtPmhq": {"description": "KJswr8be", "title": "5z5Pjpvw"}, "NjGl3lK5": {"description": "V1EbJ8xh", "title": "Wm2jGoRk"}, "FfMf7233": {"description": "fQas4QB4", "title": "lvWTVEuE"}}, "passItemId": "xQiebUUW"}' \
    > test.out 2>&1
eval_tap $? 16 'UpdatePass' test.out

#- 17 PublishSeason
./ng net.accelbyte.sdk.cli.Main seasonpass publishSeason \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'pDX5D81Y' \
    > test.out 2>&1
eval_tap $? 17 'PublishSeason' test.out

#- 18 RetireSeason
./ng net.accelbyte.sdk.cli.Main seasonpass retireSeason \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'HsDBHSwz' \
    --force  \
    > test.out 2>&1
eval_tap $? 18 'RetireSeason' test.out

#- 19 QueryRewards
./ng net.accelbyte.sdk.cli.Main seasonpass queryRewards \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'TIdGM17l' \
    --q 'mVkUiX0d' \
    > test.out 2>&1
eval_tap $? 19 'QueryRewards' test.out

#- 20 CreateReward
./ng net.accelbyte.sdk.cli.Main seasonpass createReward \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'f181v5Qv' \
    --body '{"code": "L4SIjFK9", "currency": {"currencyCode": "BR9ET3as", "namespace": "GvpPlvFH"}, "image": {"as": "5tpGyOpi", "caption": "VHVJ21Yl", "height": 26, "imageUrl": "t1X3FoCL", "smallImageUrl": "saZbAnPd", "width": 10}, "itemId": "XJcLFXEw", "quantity": 2, "type": "CURRENCY"}' \
    > test.out 2>&1
eval_tap $? 20 'CreateReward' test.out

#- 21 GetReward
./ng net.accelbyte.sdk.cli.Main seasonpass getReward \
    --code 'GfciLW3F' \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'ivytaFFk' \
    > test.out 2>&1
eval_tap $? 21 'GetReward' test.out

#- 22 DeleteReward
./ng net.accelbyte.sdk.cli.Main seasonpass deleteReward \
    --code 'fJ0Z4UJA' \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'SstvTBxD' \
    > test.out 2>&1
eval_tap $? 22 'DeleteReward' test.out

#- 23 UpdateReward
./ng net.accelbyte.sdk.cli.Main seasonpass updateReward \
    --code '2TMp8SK0' \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'E9o5xDOP' \
    --body '{"currency": {"currencyCode": "s9ZDk7Ez", "namespace": "Ldr7SU3Z"}, "image": {"as": "9DxjGCwh", "caption": "LjIJj4Ao", "height": 86, "imageUrl": "bkcyTgkE", "smallImageUrl": "KkTqHGcZ", "width": 50}, "itemId": "Wf0YXPj4", "nullFields": ["pEgvx9Qx", "nrlzu8JW", "spHxVyXJ"], "quantity": 27, "type": "CURRENCY"}' \
    > test.out 2>&1
eval_tap $? 23 'UpdateReward' test.out

#- 24 QueryTiers
./ng net.accelbyte.sdk.cli.Main seasonpass queryTiers \
    --namespace "$AB_NAMESPACE" \
    --seasonId '2q6eSAG0' \
    --limit '63' \
    --offset '12' \
    > test.out 2>&1
eval_tap $? 24 'QueryTiers' test.out

#- 25 CreateTier
./ng net.accelbyte.sdk.cli.Main seasonpass createTier \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'ZAYSKE8n' \
    --body '{"index": 96, "quantity": 30, "tier": {"requiredExp": 54, "rewards": {"ct2yU1lM": ["nZiJYspD", "UhwPgbF8", "6BjylIpz"], "gnOCl7Nj": ["epmCtbdE", "EWhaAel5", "Q8vxROPG"], "E86vySTu": ["6iYQxDFN", "JA2S2FCj", "czbOpSpx"]}}}' \
    > test.out 2>&1
eval_tap $? 25 'CreateTier' test.out

#- 26 UpdateTier
./ng net.accelbyte.sdk.cli.Main seasonpass updateTier \
    --id 'vJzQYqn8' \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'GwDhZfXf' \
    --body '{"requiredExp": 83, "rewards": {"qQC2Oiau": ["4i9yqWSX", "UskRvshb", "wCWGNVVK"], "9gSHl2IS": ["XFBWsCci", "ZKf9OC4N", "Ui6xpYNT"], "Pqm4WmTB": ["ZN37J44O", "FMXLiIzh", "4iJQRICc"]}}' \
    > test.out 2>&1
eval_tap $? 26 'UpdateTier' test.out

#- 27 DeleteTier
./ng net.accelbyte.sdk.cli.Main seasonpass deleteTier \
    --id 'f1nh2PYM' \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'bywzcNl0' \
    > test.out 2>&1
eval_tap $? 27 'DeleteTier' test.out

#- 28 ReorderTier
./ng net.accelbyte.sdk.cli.Main seasonpass reorderTier \
    --id '8cjWsIPB' \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'D50cbTH9' \
    --body '{"newIndex": 7}' \
    > test.out 2>&1
eval_tap $? 28 'ReorderTier' test.out

#- 29 UnpublishSeason
./ng net.accelbyte.sdk.cli.Main seasonpass unpublishSeason \
    --namespace "$AB_NAMESPACE" \
    --seasonId '4CcLfkPl' \
    --force  \
    > test.out 2>&1
eval_tap $? 29 'UnpublishSeason' test.out

#- 30 GetUserParticipatedSeasons
./ng net.accelbyte.sdk.cli.Main seasonpass getUserParticipatedSeasons \
    --namespace "$AB_NAMESPACE" \
    --userId 'B7GlUCFD' \
    --limit '14' \
    --offset '79' \
    > test.out 2>&1
eval_tap $? 30 'GetUserParticipatedSeasons' test.out

#- 31 GrantUserExp
./ng net.accelbyte.sdk.cli.Main seasonpass grantUserExp \
    --namespace "$AB_NAMESPACE" \
    --userId 'OS0KrkTD' \
    --body '{"exp": 5, "source": "PAID_FOR", "tags": ["lQKkLDnk", "sQ2ru0S0", "xg969SXu"]}' \
    > test.out 2>&1
eval_tap $? 31 'GrantUserExp' test.out

#- 32 GrantUserPass
./ng net.accelbyte.sdk.cli.Main seasonpass grantUserPass \
    --namespace "$AB_NAMESPACE" \
    --userId '0Rj9rFD5' \
    --body '{"passCode": "7Be13hlf", "passItemId": "5AL0FB0d"}' \
    > test.out 2>&1
eval_tap $? 32 'GrantUserPass' test.out

#- 33 ExistsAnyPassByPassCodes
./ng net.accelbyte.sdk.cli.Main seasonpass existsAnyPassByPassCodes \
    --namespace "$AB_NAMESPACE" \
    --userId 'Jiwr0aJ8' \
    --passCodes 'H4Dl5Dnx,7lgRc6mz,nkhSbPIJ' \
    > test.out 2>&1
eval_tap $? 33 'ExistsAnyPassByPassCodes' test.out

#- 34 GetCurrentUserSeasonProgression
./ng net.accelbyte.sdk.cli.Main seasonpass getCurrentUserSeasonProgression \
    --namespace "$AB_NAMESPACE" \
    --userId '3acI5ni6' \
    > test.out 2>&1
eval_tap $? 34 'GetCurrentUserSeasonProgression' test.out

#- 35 CheckSeasonPurchasable
./ng net.accelbyte.sdk.cli.Main seasonpass checkSeasonPurchasable \
    --namespace "$AB_NAMESPACE" \
    --userId 'sx0nV6hi' \
    --body '{"passItemId": "V5xRcLE6", "tierItemCount": 27, "tierItemId": "g4HzVt1o"}' \
    > test.out 2>&1
eval_tap $? 35 'CheckSeasonPurchasable' test.out

#- 36 ResetUserSeason
./ng net.accelbyte.sdk.cli.Main seasonpass resetUserSeason \
    --namespace "$AB_NAMESPACE" \
    --userId 'phlbrjE6' \
    > test.out 2>&1
eval_tap $? 36 'ResetUserSeason' test.out

#- 37 GrantUserTier
./ng net.accelbyte.sdk.cli.Main seasonpass grantUserTier \
    --namespace "$AB_NAMESPACE" \
    --userId 'WuIRmvnS' \
    --body '{"count": 2, "source": "SWEAT", "tags": ["WYkVJOT5", "qHjSRiGB", "rpbSBtb7"]}' \
    > test.out 2>&1
eval_tap $? 37 'GrantUserTier' test.out

#- 38 QueryUserExpGrantHistory
./ng net.accelbyte.sdk.cli.Main seasonpass queryUserExpGrantHistory \
    --namespace "$AB_NAMESPACE" \
    --userId 'EhxCULFZ' \
    --from 'BMeG7ZYc' \
    --limit '40' \
    --offset '26' \
    --seasonId 'TKXnTlXy' \
    --source 'SWEAT' \
    --tags 'xiYfUJfq,ZqITou8p,8eJmWqDt' \
    --to 'GRJ4vN7r' \
    > test.out 2>&1
eval_tap $? 38 'QueryUserExpGrantHistory' test.out

#- 39 QueryUserExpGrantHistoryTag
./ng net.accelbyte.sdk.cli.Main seasonpass queryUserExpGrantHistoryTag \
    --namespace "$AB_NAMESPACE" \
    --userId '1Ima1Yag' \
    --seasonId '6CrYew8Y' \
    > test.out 2>&1
eval_tap $? 39 'QueryUserExpGrantHistoryTag' test.out

#- 40 GetUserSeason
./ng net.accelbyte.sdk.cli.Main seasonpass getUserSeason \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'gezmq18q' \
    --userId 'WXWfhAWm' \
    > test.out 2>&1
eval_tap $? 40 'GetUserSeason' test.out

#- 41 PublicGetCurrentSeason
./ng net.accelbyte.sdk.cli.Main seasonpass publicGetCurrentSeason \
    --namespace "$AB_NAMESPACE" \
    --language 'IChOt3xN' \
    > test.out 2>&1
eval_tap $? 41 'PublicGetCurrentSeason' test.out

#- 42 PublicGetCurrentUserSeason
./ng net.accelbyte.sdk.cli.Main seasonpass publicGetCurrentUserSeason \
    --namespace "$AB_NAMESPACE" \
    --userId 'aURyLLG1' \
    > test.out 2>&1
eval_tap $? 42 'PublicGetCurrentUserSeason' test.out

#- 43 PublicClaimUserReward
./ng net.accelbyte.sdk.cli.Main seasonpass publicClaimUserReward \
    --namespace "$AB_NAMESPACE" \
    --userId '8GBV7hUm' \
    --body '{"passCode": "Q3rkiyey", "rewardCode": "rrJYuKCE", "tierIndex": 58}' \
    > test.out 2>&1
eval_tap $? 43 'PublicClaimUserReward' test.out

#- 44 PublicBulkClaimUserRewards
./ng net.accelbyte.sdk.cli.Main seasonpass publicBulkClaimUserRewards \
    --namespace "$AB_NAMESPACE" \
    --userId 'o72rn6Ag' \
    > test.out 2>&1
eval_tap $? 44 'PublicBulkClaimUserRewards' test.out

#- 45 PublicGetUserSeason
./ng net.accelbyte.sdk.cli.Main seasonpass publicGetUserSeason \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'Y0OvZvn0' \
    --userId 'pPPSrQXD' \
    > test.out 2>&1
eval_tap $? 45 'PublicGetUserSeason' test.out


rm -f "tmp.dat"

exit $EXIT_CODE