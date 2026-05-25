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
    --limit '72' \
    --offset '64' \
    --status 'PUBLISHED,DRAFT,PUBLISHED' \
    > test.out 2>&1
eval_tap $? 3 'QuerySeasons' test.out

#- 4 CreateSeason
./ng net.accelbyte.sdk.cli.Main seasonpass createSeason \
    --namespace "$AB_NAMESPACE" \
    --body '{"autoClaim": false, "defaultLanguage": "YYc5NPpl", "defaultRequiredExp": 32, "draftStoreId": "bGDpHyQQ", "end": "1973-03-06T00:00:00Z", "excessStrategy": {"currency": "jeUJXVzQ", "method": "NONE", "percentPerExp": 67}, "images": [{"as": "DKRXVg3D", "caption": "GyXzXx9k", "height": 13, "imageUrl": "1gHSoVPU", "smallImageUrl": "nsjAXh1a", "width": 59}, {"as": "YB8nqAUr", "caption": "8ebJgDvy", "height": 93, "imageUrl": "GQEs0ZN7", "smallImageUrl": "1oiAiX86", "width": 28}, {"as": "2BOlfJxf", "caption": "ltbdKGBH", "height": 39, "imageUrl": "067olAfW", "smallImageUrl": "9mjkUBMR", "width": 53}], "localizations": {"kHv0toKJ": {"description": "ipp7QnuE", "title": "sDnTyRww"}, "6MUmUtbX": {"description": "P2B1UONq", "title": "k1raWWb7"}, "LiruEF9D": {"description": "8ywca8zT", "title": "RTI4BIRs"}}, "name": "SnKiRVuR", "start": "1980-11-15T00:00:00Z", "tierItemId": "0ZVJ2V0Y"}' \
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
    --body '{"userIds": ["0fh3fk3U", "m6m2PYfS", "hjcBlCEO"]}' \
    > test.out 2>&1
eval_tap $? 6 'BulkGetUserSeasonProgression' test.out

#- 7 GetItemReferences
./ng net.accelbyte.sdk.cli.Main seasonpass getItemReferences \
    --namespace "$AB_NAMESPACE" \
    --itemId 'DFhbo8rx' \
    > test.out 2>&1
eval_tap $? 7 'GetItemReferences' test.out

#- 8 GetSeason
./ng net.accelbyte.sdk.cli.Main seasonpass getSeason \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'BBxWHxcQ' \
    > test.out 2>&1
eval_tap $? 8 'GetSeason' test.out

#- 9 DeleteSeason
./ng net.accelbyte.sdk.cli.Main seasonpass deleteSeason \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'WahtCXtv' \
    > test.out 2>&1
eval_tap $? 9 'DeleteSeason' test.out

#- 10 UpdateSeason
./ng net.accelbyte.sdk.cli.Main seasonpass updateSeason \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'gWf8sKIU' \
    --body '{"autoClaim": true, "defaultLanguage": "mYANF4Oe", "defaultRequiredExp": 0, "draftStoreId": "KPXJavq9", "end": "1988-01-10T00:00:00Z", "excessStrategy": {"currency": "2D54aGqt", "method": "CURRENCY", "percentPerExp": 27}, "images": [{"as": "f1oZ7Lpb", "caption": "Id06vNWU", "height": 23, "imageUrl": "N22kRnCS", "smallImageUrl": "cogGEkxU", "width": 21}, {"as": "gLn1ZZvl", "caption": "kqF7GIz4", "height": 39, "imageUrl": "sahSSSGQ", "smallImageUrl": "GZ7eauI7", "width": 92}, {"as": "jQqij7eh", "caption": "y9VBkKw4", "height": 74, "imageUrl": "Ehf3qiro", "smallImageUrl": "dRHfTC4o", "width": 6}], "localizations": {"nyYp6dfe": {"description": "RPXGC0Ig", "title": "y0hy1HiZ"}, "KTQJUE1p": {"description": "6M8vksqN", "title": "bTWRMWgO"}, "gf6g1wTx": {"description": "bPwGUpH7", "title": "8essckE6"}}, "name": "UgveYl52", "start": "1979-12-14T00:00:00Z", "tierItemId": "Mpz6vAym"}' \
    > test.out 2>&1
eval_tap $? 10 'UpdateSeason' test.out

#- 11 CloneSeason
./ng net.accelbyte.sdk.cli.Main seasonpass cloneSeason \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'LCwEgbdK' \
    --body '{"end": "1972-10-11T00:00:00Z", "name": "Bz578NUl", "start": "1995-10-05T00:00:00Z"}' \
    > test.out 2>&1
eval_tap $? 11 'CloneSeason' test.out

#- 12 GetFullSeason
./ng net.accelbyte.sdk.cli.Main seasonpass getFullSeason \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'fm2kOk7G' \
    > test.out 2>&1
eval_tap $? 12 'GetFullSeason' test.out

#- 13 QueryPasses
./ng net.accelbyte.sdk.cli.Main seasonpass queryPasses \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'Nr5wAekT' \
    > test.out 2>&1
eval_tap $? 13 'QueryPasses' test.out

#- 14 CreatePass
./ng net.accelbyte.sdk.cli.Main seasonpass createPass \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'Y4FgzC8a' \
    --body '{"autoEnroll": false, "code": "sbNptK5c", "displayOrder": 1, "images": [{"as": "2rg8mjzg", "caption": "YvpO9uUg", "height": 23, "imageUrl": "S4nMxHgV", "smallImageUrl": "NleRke5q", "width": 100}, {"as": "whN8vOq0", "caption": "hIwS6Tys", "height": 40, "imageUrl": "pnRU861g", "smallImageUrl": "8Vs4lsmD", "width": 41}, {"as": "CAD3ZlaS", "caption": "zb1opE8v", "height": 74, "imageUrl": "WnhCOxkV", "smallImageUrl": "2l5eeqI1", "width": 36}], "localizations": {"wXPNTvQq": {"description": "WUi8rWPL", "title": "DSPZP1zo"}, "DuW6LcIK": {"description": "emaWKauw", "title": "2zZVfoaA"}, "nPfmWmGb": {"description": "6jAHJ8op", "title": "URnKplmD"}}, "passItemId": "6FP9j4LZ"}' \
    > test.out 2>&1
eval_tap $? 14 'CreatePass' test.out

#- 15 GetPass
./ng net.accelbyte.sdk.cli.Main seasonpass getPass \
    --code 'O6QmgNdU' \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'igimbQlm' \
    > test.out 2>&1
eval_tap $? 15 'GetPass' test.out

#- 16 DeletePass
./ng net.accelbyte.sdk.cli.Main seasonpass deletePass \
    --code 'DwTdnAcP' \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'kLYu70J1' \
    > test.out 2>&1
eval_tap $? 16 'DeletePass' test.out

#- 17 UpdatePass
./ng net.accelbyte.sdk.cli.Main seasonpass updatePass \
    --code 'VP9zLq1b' \
    --namespace "$AB_NAMESPACE" \
    --seasonId '8CUeHBJB' \
    --body '{"autoEnroll": false, "displayOrder": 58, "images": [{"as": "lNntDDQ4", "caption": "dmKHgp6B", "height": 2, "imageUrl": "5vWTiQbe", "smallImageUrl": "7zha1iYD", "width": 81}, {"as": "qCZEnmQx", "caption": "t5btsVMb", "height": 43, "imageUrl": "WopyiLuh", "smallImageUrl": "dQKNtstZ", "width": 20}, {"as": "50OKoIhY", "caption": "Hc0pzRK3", "height": 49, "imageUrl": "AgzcY7gH", "smallImageUrl": "HQvDiNA5", "width": 43}], "localizations": {"PDZbRKUs": {"description": "UCoIF1Qw", "title": "DoUtIocX"}, "oZonz7av": {"description": "B9x2XQRD", "title": "FrQAzEO0"}, "uZA5QPSS": {"description": "dlXQyMTp", "title": "5Uz66mJj"}}, "passItemId": "bun45D5J"}' \
    > test.out 2>&1
eval_tap $? 17 'UpdatePass' test.out

#- 18 PublishSeason
./ng net.accelbyte.sdk.cli.Main seasonpass publishSeason \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'JCHbnKts' \
    > test.out 2>&1
eval_tap $? 18 'PublishSeason' test.out

#- 19 RetireSeason
./ng net.accelbyte.sdk.cli.Main seasonpass retireSeason \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'IbCK5Spk' \
    --force  \
    > test.out 2>&1
eval_tap $? 19 'RetireSeason' test.out

#- 20 QueryRewards
./ng net.accelbyte.sdk.cli.Main seasonpass queryRewards \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'CZnJEagi' \
    --q 'v5wicwwU' \
    > test.out 2>&1
eval_tap $? 20 'QueryRewards' test.out

#- 21 CreateReward
./ng net.accelbyte.sdk.cli.Main seasonpass createReward \
    --namespace "$AB_NAMESPACE" \
    --seasonId '6xHfXD87' \
    --body '{"code": "sAAYg3VS", "currency": {"currencyCode": "hSpPSlCe", "namespace": "jVZPEXGG"}, "image": {"as": "wCYZGFhJ", "caption": "YC7epgEI", "height": 87, "imageUrl": "tcliNbRY", "smallImageUrl": "HmAmcudS", "width": 72}, "itemId": "mCzmCh3G", "quantity": 44, "type": "CURRENCY"}' \
    > test.out 2>&1
eval_tap $? 21 'CreateReward' test.out

#- 22 GetReward
./ng net.accelbyte.sdk.cli.Main seasonpass getReward \
    --code 'qir0B3fo' \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'K3no0XV0' \
    > test.out 2>&1
eval_tap $? 22 'GetReward' test.out

#- 23 DeleteReward
./ng net.accelbyte.sdk.cli.Main seasonpass deleteReward \
    --code 'UKMjsPjv' \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'duKpqD2T' \
    > test.out 2>&1
eval_tap $? 23 'DeleteReward' test.out

#- 24 UpdateReward
./ng net.accelbyte.sdk.cli.Main seasonpass updateReward \
    --code 'EquPMNBz' \
    --namespace "$AB_NAMESPACE" \
    --seasonId '9z4IH1Mk' \
    --body '{"currency": {"currencyCode": "yuAKgJlN", "namespace": "KWLWCVq1"}, "image": {"as": "3F3thDvV", "caption": "x9cZKtM1", "height": 91, "imageUrl": "K8JFc65J", "smallImageUrl": "sl5sFwIp", "width": 56}, "itemId": "UsEEiBNo", "nullFields": ["y0mDcaKq", "84srxT4o", "OK9oNJVx"], "quantity": 71, "type": "ITEM"}' \
    > test.out 2>&1
eval_tap $? 24 'UpdateReward' test.out

#- 25 QueryTiers
./ng net.accelbyte.sdk.cli.Main seasonpass queryTiers \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'NXJq1HUR' \
    --limit '75' \
    --offset '39' \
    > test.out 2>&1
eval_tap $? 25 'QueryTiers' test.out

#- 26 CreateTier
./ng net.accelbyte.sdk.cli.Main seasonpass createTier \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'CwH4Yolx' \
    --body '{"index": 13, "quantity": 68, "tier": {"requiredExp": 73, "rewards": {"g1k4UcNw": ["qP0dQUFZ", "vfl3UL8C", "sWQvgubJ"], "YjiS6334": ["cywoxcBG", "nwB6nuX4", "2GAAmN3n"], "S56M2mhZ": ["5TdTEDGk", "6RYF4R2u", "SqywOWLP"]}}}' \
    > test.out 2>&1
eval_tap $? 26 'CreateTier' test.out

#- 27 UpdateTier
./ng net.accelbyte.sdk.cli.Main seasonpass updateTier \
    --id '1imJ5Bbq' \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'hxvzRcLv' \
    --body '{"requiredExp": 44, "rewards": {"Gz0ColXC": ["kqgUrSgk", "KOzgmILx", "28PNJpJD"], "uft0tXBs": ["taraRtoJ", "I6gmMiH0", "TgLmy66i"], "kMv8pf9a": ["oPtzzR1U", "oi3yx0iY", "bysakzep"]}}' \
    > test.out 2>&1
eval_tap $? 27 'UpdateTier' test.out

#- 28 DeleteTier
./ng net.accelbyte.sdk.cli.Main seasonpass deleteTier \
    --id 'hJI3dLC8' \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'XnqujEj7' \
    > test.out 2>&1
eval_tap $? 28 'DeleteTier' test.out

#- 29 ReorderTier
./ng net.accelbyte.sdk.cli.Main seasonpass reorderTier \
    --id 'tJqQGVIp' \
    --namespace "$AB_NAMESPACE" \
    --seasonId '3P0pLHs9' \
    --body '{"newIndex": 99}' \
    > test.out 2>&1
eval_tap $? 29 'ReorderTier' test.out

#- 30 UnpublishSeason
./ng net.accelbyte.sdk.cli.Main seasonpass unpublishSeason \
    --namespace "$AB_NAMESPACE" \
    --seasonId '1a8iX620' \
    --force  \
    > test.out 2>&1
eval_tap $? 30 'UnpublishSeason' test.out

#- 31 GetUserParticipatedSeasons
./ng net.accelbyte.sdk.cli.Main seasonpass getUserParticipatedSeasons \
    --namespace "$AB_NAMESPACE" \
    --userId 'Et6t2Zjr' \
    --limit '65' \
    --offset '34' \
    > test.out 2>&1
eval_tap $? 31 'GetUserParticipatedSeasons' test.out

#- 32 GrantUserExp
./ng net.accelbyte.sdk.cli.Main seasonpass grantUserExp \
    --namespace "$AB_NAMESPACE" \
    --userId 'TUHVsi58' \
    --body '{"exp": 33, "source": "PAID_FOR", "tags": ["Mbkscim8", "z8bySvxQ", "6nOO4YTf"]}' \
    > test.out 2>&1
eval_tap $? 32 'GrantUserExp' test.out

#- 33 GrantUserPass
./ng net.accelbyte.sdk.cli.Main seasonpass grantUserPass \
    --namespace "$AB_NAMESPACE" \
    --userId 'SjM9MyuW' \
    --body '{"passCode": "3wM9C719", "passItemId": "gvhqG76N"}' \
    > test.out 2>&1
eval_tap $? 33 'GrantUserPass' test.out

#- 34 ExistsAnyPassByPassCodes
./ng net.accelbyte.sdk.cli.Main seasonpass existsAnyPassByPassCodes \
    --namespace "$AB_NAMESPACE" \
    --userId '1uCAuInn' \
    --passCodes 'Y4tD5UCa,qNfWbHbI,5qY64vhH' \
    > test.out 2>&1
eval_tap $? 34 'ExistsAnyPassByPassCodes' test.out

#- 35 GetCurrentUserSeasonProgression
./ng net.accelbyte.sdk.cli.Main seasonpass getCurrentUserSeasonProgression \
    --namespace "$AB_NAMESPACE" \
    --userId '127vjnht' \
    > test.out 2>&1
eval_tap $? 35 'GetCurrentUserSeasonProgression' test.out

#- 36 CheckSeasonPurchasable
./ng net.accelbyte.sdk.cli.Main seasonpass checkSeasonPurchasable \
    --namespace "$AB_NAMESPACE" \
    --userId 'S76sKcwI' \
    --body '{"passItemId": "Hvy8SAfS", "tierItemCount": 57, "tierItemId": "H0h8MoGe"}' \
    > test.out 2>&1
eval_tap $? 36 'CheckSeasonPurchasable' test.out

#- 37 ResetUserSeason
./ng net.accelbyte.sdk.cli.Main seasonpass resetUserSeason \
    --namespace "$AB_NAMESPACE" \
    --userId '3FaFPHFf' \
    > test.out 2>&1
eval_tap $? 37 'ResetUserSeason' test.out

#- 38 GrantUserTier
./ng net.accelbyte.sdk.cli.Main seasonpass grantUserTier \
    --namespace "$AB_NAMESPACE" \
    --userId 'jEGm8ZKw' \
    --body '{"count": 16, "source": "SWEAT", "tags": ["Z0JgWtpv", "bOrvNijR", "AfhZxvax"]}' \
    > test.out 2>&1
eval_tap $? 38 'GrantUserTier' test.out

#- 39 QueryUserExpGrantHistory
./ng net.accelbyte.sdk.cli.Main seasonpass queryUserExpGrantHistory \
    --namespace "$AB_NAMESPACE" \
    --userId 'eATy807u' \
    --from 'PqPfCE67' \
    --limit '73' \
    --offset '89' \
    --seasonId 'XEWOJNZG' \
    --source 'SWEAT' \
    --tags 'WVgjIHAP,bZjith8P,kTl332zb' \
    --to 'CfMNWVHW' \
    > test.out 2>&1
eval_tap $? 39 'QueryUserExpGrantHistory' test.out

#- 40 QueryUserExpGrantHistoryTag
./ng net.accelbyte.sdk.cli.Main seasonpass queryUserExpGrantHistoryTag \
    --namespace "$AB_NAMESPACE" \
    --userId 'Ka4b1s6z' \
    --seasonId '1pAkaLfc' \
    > test.out 2>&1
eval_tap $? 40 'QueryUserExpGrantHistoryTag' test.out

#- 41 GetUserSeason
./ng net.accelbyte.sdk.cli.Main seasonpass getUserSeason \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'C0rHqgMl' \
    --userId 'DEyClDdh' \
    > test.out 2>&1
eval_tap $? 41 'GetUserSeason' test.out

#- 42 PublicGetCurrentSeason
./ng net.accelbyte.sdk.cli.Main seasonpass publicGetCurrentSeason \
    --namespace "$AB_NAMESPACE" \
    --language 'UIYHQFrn' \
    > test.out 2>&1
eval_tap $? 42 'PublicGetCurrentSeason' test.out

#- 43 PublicGetCurrentUserSeason
./ng net.accelbyte.sdk.cli.Main seasonpass publicGetCurrentUserSeason \
    --namespace "$AB_NAMESPACE" \
    --userId 'wHPsRpAk' \
    > test.out 2>&1
eval_tap $? 43 'PublicGetCurrentUserSeason' test.out

#- 44 PublicClaimUserReward
./ng net.accelbyte.sdk.cli.Main seasonpass publicClaimUserReward \
    --namespace "$AB_NAMESPACE" \
    --userId 'Ex6fCN80' \
    --body '{"passCode": "NxkACLIK", "rewardCode": "xLmnwgjn", "tierIndex": 1}' \
    > test.out 2>&1
eval_tap $? 44 'PublicClaimUserReward' test.out

#- 45 PublicBulkClaimUserRewards
./ng net.accelbyte.sdk.cli.Main seasonpass publicBulkClaimUserRewards \
    --namespace "$AB_NAMESPACE" \
    --userId 'vAk78tJW' \
    > test.out 2>&1
eval_tap $? 45 'PublicBulkClaimUserRewards' test.out

#- 46 PublicGetUserSeason
./ng net.accelbyte.sdk.cli.Main seasonpass publicGetUserSeason \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'bQ7j36wU' \
    --userId 'UOY6DLd3' \
    > test.out 2>&1
eval_tap $? 46 'PublicGetUserSeason' test.out


rm -f "tmp.dat"

exit $EXIT_CODE