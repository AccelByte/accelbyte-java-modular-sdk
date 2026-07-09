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
    --limit '52' \
    --offset '52' \
    --status 'DRAFT,DRAFT,PUBLISHED' \
    > test.out 2>&1
eval_tap $? 3 'QuerySeasons' test.out

#- 4 CreateSeason
./ng net.accelbyte.sdk.cli.Main seasonpass createSeason \
    --namespace "$AB_NAMESPACE" \
    --body '{"autoClaim": false, "defaultLanguage": "DQoavFK4", "defaultRequiredExp": 18, "draftStoreId": "rHTrRfqu", "end": "1979-03-14T00:00:00Z", "excessStrategy": {"currency": "ostyeTCO", "method": "NONE", "percentPerExp": 21}, "images": [{"as": "Folw00AL", "caption": "XKJB5tiM", "height": 78, "imageUrl": "L1ybECno", "smallImageUrl": "5D8FT0Cj", "width": 78}, {"as": "Lkc0Ww0e", "caption": "zyzcimeM", "height": 22, "imageUrl": "E0zJf199", "smallImageUrl": "JCajvrhU", "width": 26}, {"as": "Jl1lixkV", "caption": "1SzHHFdq", "height": 88, "imageUrl": "Nae7g0oJ", "smallImageUrl": "hQjxY8Cx", "width": 44}], "localizations": {"tmFBIpMi": {"description": "mjJRpHYF", "title": "VYu2W80e"}, "0E5HUEy4": {"description": "zwFgFNxV", "title": "udyu7ze9"}, "5M2ScncW": {"description": "oVyLV822", "title": "ZcZuaBx5"}}, "name": "fy1d9udE", "start": "1979-03-17T00:00:00Z", "tierItemId": "xlEW3Vvy"}' \
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
    --body '{"userIds": ["bB42G3nY", "mLFYs8tQ", "WjWjPtuz"]}' \
    > test.out 2>&1
eval_tap $? 6 'BulkGetUserSeasonProgression' test.out

#- 7 GetItemReferences
./ng net.accelbyte.sdk.cli.Main seasonpass getItemReferences \
    --namespace "$AB_NAMESPACE" \
    --itemId '7vlXfcdx' \
    > test.out 2>&1
eval_tap $? 7 'GetItemReferences' test.out

#- 8 GetSeason
./ng net.accelbyte.sdk.cli.Main seasonpass getSeason \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'UtVyWMpV' \
    > test.out 2>&1
eval_tap $? 8 'GetSeason' test.out

#- 9 DeleteSeason
./ng net.accelbyte.sdk.cli.Main seasonpass deleteSeason \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'UPscBph7' \
    > test.out 2>&1
eval_tap $? 9 'DeleteSeason' test.out

#- 10 UpdateSeason
./ng net.accelbyte.sdk.cli.Main seasonpass updateSeason \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'LabqzhDw' \
    --body '{"autoClaim": true, "defaultLanguage": "haXMxg1O", "defaultRequiredExp": 59, "draftStoreId": "Hrh1HX6M", "end": "1987-12-05T00:00:00Z", "excessStrategy": {"currency": "TNKtezyE", "method": "NONE", "percentPerExp": 45}, "images": [{"as": "1IZZXrP5", "caption": "IW8q2yOk", "height": 37, "imageUrl": "pfRF4LQ5", "smallImageUrl": "aNAwl4GO", "width": 99}, {"as": "F8smnH3B", "caption": "8BrP8v0V", "height": 8, "imageUrl": "b0WYxPx9", "smallImageUrl": "pO6xsfyz", "width": 34}, {"as": "0ssXjrbl", "caption": "u7X7WJTh", "height": 31, "imageUrl": "RwHJ3Rqp", "smallImageUrl": "9uBAKkyJ", "width": 40}], "localizations": {"thNLq6yi": {"description": "QMU7vod5", "title": "9IDSlTs2"}, "Y44xeHIm": {"description": "jjRyJgWD", "title": "1jVEDIei"}, "s3s20QSD": {"description": "d3Ig1gqR", "title": "KzTd2o0z"}}, "name": "135Zdupj", "start": "1990-12-11T00:00:00Z", "tierItemId": "IA5e2HfH"}' \
    > test.out 2>&1
eval_tap $? 10 'UpdateSeason' test.out

#- 11 CloneSeason
./ng net.accelbyte.sdk.cli.Main seasonpass cloneSeason \
    --namespace "$AB_NAMESPACE" \
    --seasonId '0CzmgkXS' \
    --body '{"end": "1972-06-23T00:00:00Z", "name": "PvIthcAT", "start": "1975-05-03T00:00:00Z"}' \
    > test.out 2>&1
eval_tap $? 11 'CloneSeason' test.out

#- 12 GetFullSeason
./ng net.accelbyte.sdk.cli.Main seasonpass getFullSeason \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'DQNAxFsy' \
    > test.out 2>&1
eval_tap $? 12 'GetFullSeason' test.out

#- 13 QueryPasses
./ng net.accelbyte.sdk.cli.Main seasonpass queryPasses \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'gMfzxDS7' \
    > test.out 2>&1
eval_tap $? 13 'QueryPasses' test.out

#- 14 CreatePass
./ng net.accelbyte.sdk.cli.Main seasonpass createPass \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'Azn7PoyP' \
    --body '{"autoEnroll": true, "code": "DX0Xk9RK", "displayOrder": 12, "images": [{"as": "AoACohQo", "caption": "6I3AKN7R", "height": 51, "imageUrl": "BmXIGkwo", "smallImageUrl": "qElQkkhI", "width": 80}, {"as": "HCFNJUaF", "caption": "1unqec0V", "height": 44, "imageUrl": "TAniiIsl", "smallImageUrl": "ZQhhgkoI", "width": 25}, {"as": "hcV570LW", "caption": "cUlqW4tu", "height": 91, "imageUrl": "DvBj7PSl", "smallImageUrl": "aXqxfddn", "width": 83}], "localizations": {"NAoqNRnV": {"description": "ulBrlXsH", "title": "uls8WWgb"}, "z4iGtRjA": {"description": "KHyPShAL", "title": "LaDSBku8"}, "CSeptMZX": {"description": "bMusNTFB", "title": "fYDSR4Kn"}}, "passItemId": "pyhvq8kY"}' \
    > test.out 2>&1
eval_tap $? 14 'CreatePass' test.out

#- 15 GetPass
./ng net.accelbyte.sdk.cli.Main seasonpass getPass \
    --code 'JiPrsruQ' \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'YzsYF5ID' \
    > test.out 2>&1
eval_tap $? 15 'GetPass' test.out

#- 16 DeletePass
./ng net.accelbyte.sdk.cli.Main seasonpass deletePass \
    --code 'uBW8xKsy' \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'LcpQgXBI' \
    > test.out 2>&1
eval_tap $? 16 'DeletePass' test.out

#- 17 UpdatePass
./ng net.accelbyte.sdk.cli.Main seasonpass updatePass \
    --code 'AxItZCXN' \
    --namespace "$AB_NAMESPACE" \
    --seasonId '8mdrLUpx' \
    --body '{"autoEnroll": false, "displayOrder": 29, "images": [{"as": "9FPOIe1N", "caption": "0iTWjAIp", "height": 67, "imageUrl": "dQcAWWSn", "smallImageUrl": "qvSifKod", "width": 53}, {"as": "tDxVNGvt", "caption": "zs2MtTfh", "height": 90, "imageUrl": "nv1REC8H", "smallImageUrl": "4wlVEaZ9", "width": 20}, {"as": "R8KHARId", "caption": "4R1KbXLp", "height": 23, "imageUrl": "tbW4KKDX", "smallImageUrl": "2KbODADV", "width": 67}], "localizations": {"qPqfaedu": {"description": "1NkuOuE0", "title": "1urdovQZ"}, "MSLlkbgm": {"description": "kpJXU3jn", "title": "KdULxlth"}, "8rX1DJZp": {"description": "FqirZW0L", "title": "Gy8mS9EU"}}, "passItemId": "wxCoSQ1q"}' \
    > test.out 2>&1
eval_tap $? 17 'UpdatePass' test.out

#- 18 PublishSeason
./ng net.accelbyte.sdk.cli.Main seasonpass publishSeason \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'QGA4dUEe' \
    > test.out 2>&1
eval_tap $? 18 'PublishSeason' test.out

#- 19 RetireSeason
./ng net.accelbyte.sdk.cli.Main seasonpass retireSeason \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'fqdR5MLF' \
    --force  \
    > test.out 2>&1
eval_tap $? 19 'RetireSeason' test.out

#- 20 QueryRewards
./ng net.accelbyte.sdk.cli.Main seasonpass queryRewards \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'CENRpSV9' \
    --q 'DHZbXjc6' \
    > test.out 2>&1
eval_tap $? 20 'QueryRewards' test.out

#- 21 CreateReward
./ng net.accelbyte.sdk.cli.Main seasonpass createReward \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'LP9NJIO3' \
    --body '{"code": "9bBQhlE8", "currency": {"currencyCode": "2bvjChEO", "namespace": "RXXwxGFB"}, "image": {"as": "MyOQQlob", "caption": "l8KCDsiM", "height": 21, "imageUrl": "abJJ2AwP", "smallImageUrl": "wtetpX2B", "width": 88}, "itemId": "jLq6PdQ1", "quantity": 36, "type": "CURRENCY"}' \
    > test.out 2>&1
eval_tap $? 21 'CreateReward' test.out

#- 22 GetReward
./ng net.accelbyte.sdk.cli.Main seasonpass getReward \
    --code 'SE6Zc5TD' \
    --namespace "$AB_NAMESPACE" \
    --seasonId '3m05KFHE' \
    > test.out 2>&1
eval_tap $? 22 'GetReward' test.out

#- 23 DeleteReward
./ng net.accelbyte.sdk.cli.Main seasonpass deleteReward \
    --code '4EydKcfL' \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'BIAXcAzf' \
    > test.out 2>&1
eval_tap $? 23 'DeleteReward' test.out

#- 24 UpdateReward
./ng net.accelbyte.sdk.cli.Main seasonpass updateReward \
    --code '5I58nMhR' \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'mgQkm02c' \
    --body '{"currency": {"currencyCode": "ErSNNUZB", "namespace": "lLvtieWP"}, "image": {"as": "uAHBxhwj", "caption": "VorZrZJl", "height": 66, "imageUrl": "TOdKCUaa", "smallImageUrl": "tLtRepsi", "width": 3}, "itemId": "fNs5zk0G", "nullFields": ["BidJKcPM", "ei3DYsik", "gAlx3ksh"], "quantity": 70, "type": "ITEM"}' \
    > test.out 2>&1
eval_tap $? 24 'UpdateReward' test.out

#- 25 QueryTiers
./ng net.accelbyte.sdk.cli.Main seasonpass queryTiers \
    --namespace "$AB_NAMESPACE" \
    --seasonId '30b7oe7r' \
    --limit '39' \
    --offset '73' \
    > test.out 2>&1
eval_tap $? 25 'QueryTiers' test.out

#- 26 CreateTier
./ng net.accelbyte.sdk.cli.Main seasonpass createTier \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'AEqERhtZ' \
    --body '{"index": 51, "quantity": 61, "tier": {"requiredExp": 94, "rewards": {"Te2PpQCX": ["I0Lz7YKc", "KciTNsVx", "yFZknxtm"], "sprKPxCf": ["OhaD6qYh", "xcsn6HRM", "Y25UpgRP"], "1UpJqscC": ["XWBGkJJl", "djr7cPWw", "mILchMhG"]}}}' \
    > test.out 2>&1
eval_tap $? 26 'CreateTier' test.out

#- 27 UpdateTier
./ng net.accelbyte.sdk.cli.Main seasonpass updateTier \
    --id 'SnlFE9Pz' \
    --namespace "$AB_NAMESPACE" \
    --seasonId 's08jZwCe' \
    --body '{"requiredExp": 61, "rewards": {"gkMIVeB0": ["vUPbYh4b", "CU5hxbug", "sKBsYDHa"], "Mzdt7WQm": ["83tbWtVT", "IO4jV7Ti", "U8f10Bzp"], "N8ZY5Mz2": ["WMkbyZXL", "PpocDsgd", "YYp0ohyF"]}}' \
    > test.out 2>&1
eval_tap $? 27 'UpdateTier' test.out

#- 28 DeleteTier
./ng net.accelbyte.sdk.cli.Main seasonpass deleteTier \
    --id 'ybkX3yVn' \
    --namespace "$AB_NAMESPACE" \
    --seasonId '0KicZCmP' \
    > test.out 2>&1
eval_tap $? 28 'DeleteTier' test.out

#- 29 ReorderTier
./ng net.accelbyte.sdk.cli.Main seasonpass reorderTier \
    --id 'bR5Egd1K' \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'qrkAO8bc' \
    --body '{"newIndex": 22}' \
    > test.out 2>&1
eval_tap $? 29 'ReorderTier' test.out

#- 30 UnpublishSeason
./ng net.accelbyte.sdk.cli.Main seasonpass unpublishSeason \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'tGBhIyfP' \
    --force  \
    > test.out 2>&1
eval_tap $? 30 'UnpublishSeason' test.out

#- 31 GetUserParticipatedSeasons
./ng net.accelbyte.sdk.cli.Main seasonpass getUserParticipatedSeasons \
    --namespace "$AB_NAMESPACE" \
    --userId 'Xb4xVI4i' \
    --limit '91' \
    --offset '37' \
    > test.out 2>&1
eval_tap $? 31 'GetUserParticipatedSeasons' test.out

#- 32 GrantUserExp
./ng net.accelbyte.sdk.cli.Main seasonpass grantUserExp \
    --namespace "$AB_NAMESPACE" \
    --userId 'UafZS3OL' \
    --body '{"exp": 22, "source": "PAID_FOR", "tags": ["AoPqbIPe", "C7m9KSXh", "Oqrarp1X"]}' \
    > test.out 2>&1
eval_tap $? 32 'GrantUserExp' test.out

#- 33 GrantUserPass
./ng net.accelbyte.sdk.cli.Main seasonpass grantUserPass \
    --namespace "$AB_NAMESPACE" \
    --userId 'dI0Kts7A' \
    --body '{"passCode": "sB47lJ7z", "passItemId": "ZSBATGTB"}' \
    > test.out 2>&1
eval_tap $? 33 'GrantUserPass' test.out

#- 34 ExistsAnyPassByPassCodes
./ng net.accelbyte.sdk.cli.Main seasonpass existsAnyPassByPassCodes \
    --namespace "$AB_NAMESPACE" \
    --userId 'An2jZpfy' \
    --passCodes 'w0Qgql39,FDAdxPjz,2cpvrLHa' \
    > test.out 2>&1
eval_tap $? 34 'ExistsAnyPassByPassCodes' test.out

#- 35 GetCurrentUserSeasonProgression
./ng net.accelbyte.sdk.cli.Main seasonpass getCurrentUserSeasonProgression \
    --namespace "$AB_NAMESPACE" \
    --userId 'W4cLxxwx' \
    > test.out 2>&1
eval_tap $? 35 'GetCurrentUserSeasonProgression' test.out

#- 36 CheckSeasonPurchasable
./ng net.accelbyte.sdk.cli.Main seasonpass checkSeasonPurchasable \
    --namespace "$AB_NAMESPACE" \
    --userId '4YtVo3Jt' \
    --body '{"passItemId": "eNtD7H2x", "tierItemCount": 6, "tierItemId": "YwTt2QuF"}' \
    > test.out 2>&1
eval_tap $? 36 'CheckSeasonPurchasable' test.out

#- 37 ResetUserSeason
./ng net.accelbyte.sdk.cli.Main seasonpass resetUserSeason \
    --namespace "$AB_NAMESPACE" \
    --userId 'V0CF3s3X' \
    > test.out 2>&1
eval_tap $? 37 'ResetUserSeason' test.out

#- 38 GrantUserTier
./ng net.accelbyte.sdk.cli.Main seasonpass grantUserTier \
    --namespace "$AB_NAMESPACE" \
    --userId 'Rz1Iy39e' \
    --body '{"count": 40, "source": "SWEAT", "tags": ["zsS58Sp7", "9XlCG2Uz", "JzxSSL77"]}' \
    > test.out 2>&1
eval_tap $? 38 'GrantUserTier' test.out

#- 39 QueryUserExpGrantHistory
./ng net.accelbyte.sdk.cli.Main seasonpass queryUserExpGrantHistory \
    --namespace "$AB_NAMESPACE" \
    --userId 'Zp9UsgLL' \
    --from 'orUPSCWw' \
    --limit '34' \
    --offset '51' \
    --seasonId 'TtIOpwTS' \
    --source 'SWEAT' \
    --tags 'fBroYhIr,Fb8lgeFe,mslMFAlP' \
    --to 'OKmocr9Y' \
    > test.out 2>&1
eval_tap $? 39 'QueryUserExpGrantHistory' test.out

#- 40 QueryUserExpGrantHistoryTag
./ng net.accelbyte.sdk.cli.Main seasonpass queryUserExpGrantHistoryTag \
    --namespace "$AB_NAMESPACE" \
    --userId '6xVDtfWS' \
    --seasonId 'liCqopvE' \
    > test.out 2>&1
eval_tap $? 40 'QueryUserExpGrantHistoryTag' test.out

#- 41 GetUserSeason
./ng net.accelbyte.sdk.cli.Main seasonpass getUserSeason \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'TKI1GFFP' \
    --userId 'YAE2PG53' \
    > test.out 2>&1
eval_tap $? 41 'GetUserSeason' test.out

#- 42 PublicGetCurrentSeason
./ng net.accelbyte.sdk.cli.Main seasonpass publicGetCurrentSeason \
    --namespace "$AB_NAMESPACE" \
    --language 'krgiEbGG' \
    > test.out 2>&1
eval_tap $? 42 'PublicGetCurrentSeason' test.out

#- 43 PublicGetCurrentUserSeason
./ng net.accelbyte.sdk.cli.Main seasonpass publicGetCurrentUserSeason \
    --namespace "$AB_NAMESPACE" \
    --userId 'R185VOxf' \
    > test.out 2>&1
eval_tap $? 43 'PublicGetCurrentUserSeason' test.out

#- 44 PublicClaimUserReward
./ng net.accelbyte.sdk.cli.Main seasonpass publicClaimUserReward \
    --namespace "$AB_NAMESPACE" \
    --userId 'pqXn0OQn' \
    --body '{"passCode": "3JS2DL68", "rewardCode": "arTLz7tf", "tierIndex": 49}' \
    > test.out 2>&1
eval_tap $? 44 'PublicClaimUserReward' test.out

#- 45 PublicBulkClaimUserRewards
./ng net.accelbyte.sdk.cli.Main seasonpass publicBulkClaimUserRewards \
    --namespace "$AB_NAMESPACE" \
    --userId 'lsGl7QZV' \
    > test.out 2>&1
eval_tap $? 45 'PublicBulkClaimUserRewards' test.out

#- 46 PublicGetUserSeason
./ng net.accelbyte.sdk.cli.Main seasonpass publicGetUserSeason \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'ynbpXJSN' \
    --userId 'pinF5Kya' \
    > test.out 2>&1
eval_tap $? 46 'PublicGetUserSeason' test.out


rm -f "tmp.dat"

exit $EXIT_CODE