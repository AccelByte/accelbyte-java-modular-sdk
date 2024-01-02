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
    --limit '86' \
    --offset '16' \
    --status 'DRAFT,DRAFT,PUBLISHED' \
    > test.out 2>&1
eval_tap $? 3 'QuerySeasons' test.out

#- 4 CreateSeason
./ng net.accelbyte.sdk.cli.Main seasonpass createSeason \
    --namespace "$AB_NAMESPACE" \
    --body '{"autoClaim": true, "defaultLanguage": "2xxPc5xe", "defaultRequiredExp": 57, "draftStoreId": "qMyaOJ29", "end": "1998-11-06T00:00:00Z", "excessStrategy": {"currency": "6FXnqzn2", "method": "CURRENCY", "percentPerExp": 2}, "images": [{"as": "5lQMzigk", "caption": "ParUyd9e", "height": 41, "imageUrl": "p3mYVjCK", "smallImageUrl": "pz1fbpve", "width": 83}, {"as": "z4P1sF0o", "caption": "mDNWzxQJ", "height": 34, "imageUrl": "CBzukOhH", "smallImageUrl": "3w9cugaH", "width": 21}, {"as": "Ld6Uh3Ox", "caption": "OFUOVOgw", "height": 35, "imageUrl": "YrOpCadr", "smallImageUrl": "QoEF72it", "width": 66}], "localizations": {"jEh3Z2F3": {"description": "hv1phG4a", "title": "NpedJSMb"}, "5ocXDRMA": {"description": "KPHKKMjd", "title": "vp8qDauA"}, "SHD2lvvZ": {"description": "yVl1mQeQ", "title": "p6kEqTG9"}}, "name": "45bPdAnn", "start": "1978-03-29T00:00:00Z", "tierItemId": "NHZCndrW"}' \
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
    --body '{"userIds": ["Ylwf6SfD", "0nxE5wBI", "l1AXKrYL"]}' \
    > test.out 2>&1
eval_tap $? 6 'BulkGetUserSeasonProgression' test.out

#- 7 GetSeason
./ng net.accelbyte.sdk.cli.Main seasonpass getSeason \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'vxm4fuU9' \
    > test.out 2>&1
eval_tap $? 7 'GetSeason' test.out

#- 8 DeleteSeason
./ng net.accelbyte.sdk.cli.Main seasonpass deleteSeason \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'zFnr9M94' \
    > test.out 2>&1
eval_tap $? 8 'DeleteSeason' test.out

#- 9 UpdateSeason
./ng net.accelbyte.sdk.cli.Main seasonpass updateSeason \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'zGtNJKRl' \
    --body '{"autoClaim": false, "defaultLanguage": "pXSFzizq", "defaultRequiredExp": 85, "draftStoreId": "yNIA6yDJ", "end": "1995-10-30T00:00:00Z", "excessStrategy": {"currency": "85ZUqShy", "method": "CURRENCY", "percentPerExp": 97}, "images": [{"as": "5XMpyqNX", "caption": "GXHdhJmW", "height": 65, "imageUrl": "kCqDZiRh", "smallImageUrl": "ysATE2XS", "width": 14}, {"as": "Mc3zfW4T", "caption": "20CuFFz7", "height": 94, "imageUrl": "NilRxfDU", "smallImageUrl": "5QMtOYCJ", "width": 84}, {"as": "dQO8SWO6", "caption": "6IWmfNqL", "height": 95, "imageUrl": "GB3xbNnv", "smallImageUrl": "oIRh4c1C", "width": 27}], "localizations": {"MoEVzoii": {"description": "7vwW0LQy", "title": "q8uP8FZR"}, "g8sYhmmI": {"description": "UYdO2EiW", "title": "DXeREXiN"}, "kbuxmW1s": {"description": "LnD7Vl8f", "title": "ZHljnB5D"}}, "name": "PDtfkqXu", "start": "1999-03-19T00:00:00Z", "tierItemId": "5ZjsFRam"}' \
    > test.out 2>&1
eval_tap $? 9 'UpdateSeason' test.out

#- 10 CloneSeason
./ng net.accelbyte.sdk.cli.Main seasonpass cloneSeason \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'r6TVwvGr' \
    --body '{"end": "1997-06-22T00:00:00Z", "name": "BuV1c9JL", "start": "1972-08-30T00:00:00Z"}' \
    > test.out 2>&1
eval_tap $? 10 'CloneSeason' test.out

#- 11 GetFullSeason
./ng net.accelbyte.sdk.cli.Main seasonpass getFullSeason \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'JtJXFMWT' \
    > test.out 2>&1
eval_tap $? 11 'GetFullSeason' test.out

#- 12 QueryPasses
./ng net.accelbyte.sdk.cli.Main seasonpass queryPasses \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'SlYUv8wT' \
    > test.out 2>&1
eval_tap $? 12 'QueryPasses' test.out

#- 13 CreatePass
./ng net.accelbyte.sdk.cli.Main seasonpass createPass \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'Eaqcy3At' \
    --body '{"autoEnroll": true, "code": "8fc1NOJc", "displayOrder": 91, "images": [{"as": "oHzhxHrr", "caption": "QUDRb4UL", "height": 29, "imageUrl": "Q0dmewRq", "smallImageUrl": "1Mbwjy2V", "width": 55}, {"as": "wwIfAFa4", "caption": "g1NmT0lS", "height": 91, "imageUrl": "fdcasmJb", "smallImageUrl": "FLxkgXzN", "width": 49}, {"as": "V6Jjs4pr", "caption": "fKeEg160", "height": 29, "imageUrl": "9IzNo21Y", "smallImageUrl": "86wnayXB", "width": 99}], "localizations": {"qufV3dqW": {"description": "UwC70pOm", "title": "wicmdhzk"}, "1zzyAcH7": {"description": "IeBAqZIL", "title": "7XEhndAf"}, "gFeti8ga": {"description": "wc6QB4bd", "title": "BX4rqJzs"}}, "passItemId": "gTD8Z7p3"}' \
    > test.out 2>&1
eval_tap $? 13 'CreatePass' test.out

#- 14 GetPass
./ng net.accelbyte.sdk.cli.Main seasonpass getPass \
    --code 'Ky33mhyC' \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'LmgJLWuI' \
    > test.out 2>&1
eval_tap $? 14 'GetPass' test.out

#- 15 DeletePass
./ng net.accelbyte.sdk.cli.Main seasonpass deletePass \
    --code 'GsLwdsnu' \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'rwVLNPRi' \
    > test.out 2>&1
eval_tap $? 15 'DeletePass' test.out

#- 16 UpdatePass
./ng net.accelbyte.sdk.cli.Main seasonpass updatePass \
    --code 'YW4Lo5lT' \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'HL4MBz7v' \
    --body '{"autoEnroll": false, "displayOrder": 10, "images": [{"as": "YvyyhSE0", "caption": "h5sXeZq4", "height": 87, "imageUrl": "z7MYnBAK", "smallImageUrl": "g11R24nn", "width": 27}, {"as": "HO3q1bXy", "caption": "Oa3wgSJG", "height": 22, "imageUrl": "HhatxUZW", "smallImageUrl": "2y8RR495", "width": 80}, {"as": "zNUfBrV7", "caption": "S0ooiaeB", "height": 86, "imageUrl": "XWHgZcGi", "smallImageUrl": "pjTqRjZy", "width": 26}], "localizations": {"8paBbp75": {"description": "VbdPJpIg", "title": "8DyqIstd"}, "K5BXGYIt": {"description": "kCDS2stu", "title": "LAIGRTZj"}, "OjuOmMTA": {"description": "JhlRWNz4", "title": "JzrgHk9w"}}, "passItemId": "5xI8B7Gx"}' \
    > test.out 2>&1
eval_tap $? 16 'UpdatePass' test.out

#- 17 PublishSeason
./ng net.accelbyte.sdk.cli.Main seasonpass publishSeason \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'ZHQ2j1du' \
    > test.out 2>&1
eval_tap $? 17 'PublishSeason' test.out

#- 18 RetireSeason
./ng net.accelbyte.sdk.cli.Main seasonpass retireSeason \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'Z0L5NE8l' \
    --force  \
    > test.out 2>&1
eval_tap $? 18 'RetireSeason' test.out

#- 19 QueryRewards
./ng net.accelbyte.sdk.cli.Main seasonpass queryRewards \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'pDuPmLal' \
    --q 'ShCJak6p' \
    > test.out 2>&1
eval_tap $? 19 'QueryRewards' test.out

#- 20 CreateReward
./ng net.accelbyte.sdk.cli.Main seasonpass createReward \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'OrQ4rzqq' \
    --body '{"code": "BiFuX4H4", "currency": {"currencyCode": "F1QRt3FU", "namespace": "be1J4Sai"}, "image": {"as": "zDTwzi32", "caption": "74p7KUh9", "height": 86, "imageUrl": "M51WENFD", "smallImageUrl": "eeUtpjGy", "width": 87}, "itemId": "I2HPp4pt", "quantity": 71, "type": "CURRENCY"}' \
    > test.out 2>&1
eval_tap $? 20 'CreateReward' test.out

#- 21 GetReward
./ng net.accelbyte.sdk.cli.Main seasonpass getReward \
    --code 'Eq1rq316' \
    --namespace "$AB_NAMESPACE" \
    --seasonId '3VOrBX7l' \
    > test.out 2>&1
eval_tap $? 21 'GetReward' test.out

#- 22 DeleteReward
./ng net.accelbyte.sdk.cli.Main seasonpass deleteReward \
    --code 'KKp6vuQG' \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'FQ00vs5I' \
    > test.out 2>&1
eval_tap $? 22 'DeleteReward' test.out

#- 23 UpdateReward
./ng net.accelbyte.sdk.cli.Main seasonpass updateReward \
    --code 'ovW0ZU6p' \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'YQNsR1ue' \
    --body '{"currency": {"currencyCode": "OmGBD4Kq", "namespace": "mcXWuiYR"}, "image": {"as": "vQBeBbEu", "caption": "L9oR0KsC", "height": 32, "imageUrl": "zGS8OF90", "smallImageUrl": "n54zqNeC", "width": 27}, "itemId": "Oqa1ExzS", "nullFields": ["dTTTSYXd", "s50QZFaX", "r7tcKlJu"], "quantity": 68, "type": "CURRENCY"}' \
    > test.out 2>&1
eval_tap $? 23 'UpdateReward' test.out

#- 24 QueryTiers
./ng net.accelbyte.sdk.cli.Main seasonpass queryTiers \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'JCC13v3e' \
    --limit '13' \
    --offset '44' \
    > test.out 2>&1
eval_tap $? 24 'QueryTiers' test.out

#- 25 CreateTier
./ng net.accelbyte.sdk.cli.Main seasonpass createTier \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'CNz2hclJ' \
    --body '{"index": 27, "quantity": 86, "tier": {"requiredExp": 14, "rewards": {"BONJ76dS": ["UvhRHI75", "1sNkl7vW", "T1lLEUtq"], "xWf3vpga": ["UHTizxIN", "edIvvd8G", "xoSaFM0G"], "bXcshbTU": ["z0QRR8m8", "sosTiubI", "qTMhF5fk"]}}}' \
    > test.out 2>&1
eval_tap $? 25 'CreateTier' test.out

#- 26 UpdateTier
./ng net.accelbyte.sdk.cli.Main seasonpass updateTier \
    --id 'ezp73dQv' \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'j44bjohE' \
    --body '{"requiredExp": 55, "rewards": {"nc5AiSeM": ["VvkxB4XD", "8uCWNwk1", "AyjHnfeq"], "GBwMBai4": ["bZ54b71v", "7vuWqIu8", "JQXFNky3"], "NUpPgSOv": ["ExTJSZiJ", "Bo39XC2r", "svC5Wx8a"]}}' \
    > test.out 2>&1
eval_tap $? 26 'UpdateTier' test.out

#- 27 DeleteTier
./ng net.accelbyte.sdk.cli.Main seasonpass deleteTier \
    --id '6BBOBMs2' \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'WuYQdZ7v' \
    > test.out 2>&1
eval_tap $? 27 'DeleteTier' test.out

#- 28 ReorderTier
./ng net.accelbyte.sdk.cli.Main seasonpass reorderTier \
    --id 'O8ZYEjbu' \
    --namespace "$AB_NAMESPACE" \
    --seasonId '8Ppm18fv' \
    --body '{"newIndex": 54}' \
    > test.out 2>&1
eval_tap $? 28 'ReorderTier' test.out

#- 29 UnpublishSeason
./ng net.accelbyte.sdk.cli.Main seasonpass unpublishSeason \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'NJf0ndue' \
    --force  \
    > test.out 2>&1
eval_tap $? 29 'UnpublishSeason' test.out

#- 30 GetUserParticipatedSeasons
./ng net.accelbyte.sdk.cli.Main seasonpass getUserParticipatedSeasons \
    --namespace "$AB_NAMESPACE" \
    --userId 'rATL7zf5' \
    --limit '46' \
    --offset '10' \
    > test.out 2>&1
eval_tap $? 30 'GetUserParticipatedSeasons' test.out

#- 31 GrantUserExp
./ng net.accelbyte.sdk.cli.Main seasonpass grantUserExp \
    --namespace "$AB_NAMESPACE" \
    --userId 'WToRvwJG' \
    --body '{"exp": 32, "source": "SWEAT", "tags": ["v1RPrYOj", "bQn2PUQs", "FOcsWGls"]}' \
    > test.out 2>&1
eval_tap $? 31 'GrantUserExp' test.out

#- 32 GrantUserPass
./ng net.accelbyte.sdk.cli.Main seasonpass grantUserPass \
    --namespace "$AB_NAMESPACE" \
    --userId '5nTtxGCI' \
    --body '{"passCode": "z4Gj30iI", "passItemId": "UOJiho2j"}' \
    > test.out 2>&1
eval_tap $? 32 'GrantUserPass' test.out

#- 33 ExistsAnyPassByPassCodes
./ng net.accelbyte.sdk.cli.Main seasonpass existsAnyPassByPassCodes \
    --namespace "$AB_NAMESPACE" \
    --userId 'X4Eo6vU6' \
    --passCodes 'nhgRRAry,3nQ6lmgk,IVydERAq' \
    > test.out 2>&1
eval_tap $? 33 'ExistsAnyPassByPassCodes' test.out

#- 34 GetCurrentUserSeasonProgression
./ng net.accelbyte.sdk.cli.Main seasonpass getCurrentUserSeasonProgression \
    --namespace "$AB_NAMESPACE" \
    --userId 'gAQNOuEU' \
    > test.out 2>&1
eval_tap $? 34 'GetCurrentUserSeasonProgression' test.out

#- 35 CheckSeasonPurchasable
./ng net.accelbyte.sdk.cli.Main seasonpass checkSeasonPurchasable \
    --namespace "$AB_NAMESPACE" \
    --userId 'a63RlI2V' \
    --body '{"passItemId": "TfUOlSsF", "tierItemCount": 40, "tierItemId": "Xky4b4LH"}' \
    > test.out 2>&1
eval_tap $? 35 'CheckSeasonPurchasable' test.out

#- 36 ResetUserSeason
./ng net.accelbyte.sdk.cli.Main seasonpass resetUserSeason \
    --namespace "$AB_NAMESPACE" \
    --userId 'kTfuJGAE' \
    > test.out 2>&1
eval_tap $? 36 'ResetUserSeason' test.out

#- 37 GrantUserTier
./ng net.accelbyte.sdk.cli.Main seasonpass grantUserTier \
    --namespace "$AB_NAMESPACE" \
    --userId '19wa8pmp' \
    --body '{"count": 90, "source": "SWEAT", "tags": ["XBoLR2A1", "1NUFfDxr", "lGImJIV4"]}' \
    > test.out 2>&1
eval_tap $? 37 'GrantUserTier' test.out

#- 38 QueryUserExpGrantHistory
./ng net.accelbyte.sdk.cli.Main seasonpass queryUserExpGrantHistory \
    --namespace "$AB_NAMESPACE" \
    --userId 'b1oPGT0Z' \
    --from 'IMVreYag' \
    --limit '14' \
    --offset '15' \
    --seasonId 'IRcU11sy' \
    --source 'SWEAT' \
    --tags 'pSSqcxoG,4Cdm7ib2,uz5FaBfq' \
    --to 'bTGbbl4v' \
    > test.out 2>&1
eval_tap $? 38 'QueryUserExpGrantHistory' test.out

#- 39 QueryUserExpGrantHistoryTag
./ng net.accelbyte.sdk.cli.Main seasonpass queryUserExpGrantHistoryTag \
    --namespace "$AB_NAMESPACE" \
    --userId 'XaSHKYsa' \
    --seasonId 'BoRzV8Od' \
    > test.out 2>&1
eval_tap $? 39 'QueryUserExpGrantHistoryTag' test.out

#- 40 GetUserSeason
./ng net.accelbyte.sdk.cli.Main seasonpass getUserSeason \
    --namespace "$AB_NAMESPACE" \
    --seasonId '2TDFUP0T' \
    --userId '0ERv6iqk' \
    > test.out 2>&1
eval_tap $? 40 'GetUserSeason' test.out

#- 41 PublicGetCurrentSeason
./ng net.accelbyte.sdk.cli.Main seasonpass publicGetCurrentSeason \
    --namespace "$AB_NAMESPACE" \
    --language 'oQT8mH0G' \
    > test.out 2>&1
eval_tap $? 41 'PublicGetCurrentSeason' test.out

#- 42 PublicGetCurrentUserSeason
./ng net.accelbyte.sdk.cli.Main seasonpass publicGetCurrentUserSeason \
    --namespace "$AB_NAMESPACE" \
    --userId 'JBVWURor' \
    > test.out 2>&1
eval_tap $? 42 'PublicGetCurrentUserSeason' test.out

#- 43 PublicClaimUserReward
./ng net.accelbyte.sdk.cli.Main seasonpass publicClaimUserReward \
    --namespace "$AB_NAMESPACE" \
    --userId 'wljV1aKA' \
    --body '{"passCode": "HS9vQ8d6", "rewardCode": "Ke1hZj0w", "tierIndex": 80}' \
    > test.out 2>&1
eval_tap $? 43 'PublicClaimUserReward' test.out

#- 44 PublicBulkClaimUserRewards
./ng net.accelbyte.sdk.cli.Main seasonpass publicBulkClaimUserRewards \
    --namespace "$AB_NAMESPACE" \
    --userId 'glDonIn3' \
    > test.out 2>&1
eval_tap $? 44 'PublicBulkClaimUserRewards' test.out

#- 45 PublicGetUserSeason
./ng net.accelbyte.sdk.cli.Main seasonpass publicGetUserSeason \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'veVxANYt' \
    --userId '8OPr9JHW' \
    > test.out 2>&1
eval_tap $? 45 'PublicGetUserSeason' test.out


rm -f "tmp.dat"

exit $EXIT_CODE