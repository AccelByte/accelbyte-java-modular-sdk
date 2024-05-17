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
    --limit '20' \
    --offset '19' \
    --status 'RETIRED,DRAFT,PUBLISHED' \
    > test.out 2>&1
eval_tap $? 3 'QuerySeasons' test.out

#- 4 CreateSeason
./ng net.accelbyte.sdk.cli.Main seasonpass createSeason \
    --namespace "$AB_NAMESPACE" \
    --body '{"autoClaim": false, "defaultLanguage": "I3BQTEFw", "defaultRequiredExp": 81, "draftStoreId": "VhEHMXHA", "end": "1988-09-29T00:00:00Z", "excessStrategy": {"currency": "tf7v5A5T", "method": "CURRENCY", "percentPerExp": 89}, "images": [{"as": "ksdk2JDJ", "caption": "INNUXI8f", "height": 77, "imageUrl": "hCRGDUw6", "smallImageUrl": "xDhGOUhC", "width": 15}, {"as": "JAVkCSIz", "caption": "nW5E6KWL", "height": 44, "imageUrl": "zije8zD0", "smallImageUrl": "6bHCiPpK", "width": 91}, {"as": "XMoeaMbR", "caption": "v10INSz3", "height": 73, "imageUrl": "vNoYohhF", "smallImageUrl": "e1wZGs5H", "width": 77}], "localizations": {"nFNLMZSz": {"description": "U1tKxAeZ", "title": "xCXqPcqx"}, "KSDOWqIC": {"description": "HD73Rww3", "title": "SeBiIJzU"}, "1Wp1WM4y": {"description": "pSZc9i7R", "title": "lVQXJKJn"}}, "name": "FzWcRRHY", "start": "1980-08-30T00:00:00Z", "tierItemId": "ufs7md2v"}' \
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
    --body '{"userIds": ["XnGtmzvv", "EVj6RcrR", "swqxBknh"]}' \
    > test.out 2>&1
eval_tap $? 6 'BulkGetUserSeasonProgression' test.out

#- 7 GetSeason
./ng net.accelbyte.sdk.cli.Main seasonpass getSeason \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'vYcOqPsg' \
    > test.out 2>&1
eval_tap $? 7 'GetSeason' test.out

#- 8 DeleteSeason
./ng net.accelbyte.sdk.cli.Main seasonpass deleteSeason \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'uMSra6WX' \
    > test.out 2>&1
eval_tap $? 8 'DeleteSeason' test.out

#- 9 UpdateSeason
./ng net.accelbyte.sdk.cli.Main seasonpass updateSeason \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'JvRnQguE' \
    --body '{"autoClaim": false, "defaultLanguage": "tbkXq3P6", "defaultRequiredExp": 23, "draftStoreId": "bxDBpxz5", "end": "1985-01-28T00:00:00Z", "excessStrategy": {"currency": "bNxAMOXF", "method": "CURRENCY", "percentPerExp": 55}, "images": [{"as": "OYpsio9J", "caption": "IrfFkO6Q", "height": 23, "imageUrl": "wlq9iQiA", "smallImageUrl": "cxfDTab1", "width": 81}, {"as": "rk3RohsW", "caption": "UpJ8X30w", "height": 3, "imageUrl": "YWBqZ5bf", "smallImageUrl": "Z4ziVso1", "width": 73}, {"as": "ZYjWFZAm", "caption": "dbFnTGMG", "height": 2, "imageUrl": "H35wU8Mm", "smallImageUrl": "zJMjpqrT", "width": 84}], "localizations": {"ywHBUrni": {"description": "uuofDL2k", "title": "hCGxopVR"}, "SWVKm7Wo": {"description": "Irm2fIms", "title": "Q8B5foaO"}, "TRQureeU": {"description": "8FYOYk5i", "title": "j5hChyOq"}}, "name": "6ki0Cnpx", "start": "1999-07-15T00:00:00Z", "tierItemId": "4bHdZZbH"}' \
    > test.out 2>&1
eval_tap $? 9 'UpdateSeason' test.out

#- 10 CloneSeason
./ng net.accelbyte.sdk.cli.Main seasonpass cloneSeason \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'FK3UoEzF' \
    --body '{"end": "1993-11-22T00:00:00Z", "name": "nyfz2gMW", "start": "1975-09-08T00:00:00Z"}' \
    > test.out 2>&1
eval_tap $? 10 'CloneSeason' test.out

#- 11 GetFullSeason
./ng net.accelbyte.sdk.cli.Main seasonpass getFullSeason \
    --namespace "$AB_NAMESPACE" \
    --seasonId '2fAAoALd' \
    > test.out 2>&1
eval_tap $? 11 'GetFullSeason' test.out

#- 12 QueryPasses
./ng net.accelbyte.sdk.cli.Main seasonpass queryPasses \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'Dx2xE49H' \
    > test.out 2>&1
eval_tap $? 12 'QueryPasses' test.out

#- 13 CreatePass
./ng net.accelbyte.sdk.cli.Main seasonpass createPass \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'gzv9RC8c' \
    --body '{"autoEnroll": true, "code": "OnhBWKs3", "displayOrder": 96, "images": [{"as": "EDe9EuLn", "caption": "ovS3rMsZ", "height": 53, "imageUrl": "BsMy8J4u", "smallImageUrl": "6nXwC3ev", "width": 81}, {"as": "NCWowWOM", "caption": "WC61REyN", "height": 23, "imageUrl": "XoBPDoS1", "smallImageUrl": "4oQZQizi", "width": 49}, {"as": "FksbzSry", "caption": "boPTLuSK", "height": 31, "imageUrl": "Z7bFv5X4", "smallImageUrl": "enBFqDwD", "width": 74}], "localizations": {"d79RGpu9": {"description": "S11S4exR", "title": "UOHDTJWP"}, "BdwCGBpc": {"description": "c7OYcR5M", "title": "H4XdyfnO"}, "cJ0hZHdC": {"description": "hPdhSejF", "title": "DwFZkEr1"}}, "passItemId": "iNwQii6y"}' \
    > test.out 2>&1
eval_tap $? 13 'CreatePass' test.out

#- 14 GetPass
./ng net.accelbyte.sdk.cli.Main seasonpass getPass \
    --code 'iZjUlZmD' \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'LMKcGGNG' \
    > test.out 2>&1
eval_tap $? 14 'GetPass' test.out

#- 15 DeletePass
./ng net.accelbyte.sdk.cli.Main seasonpass deletePass \
    --code '8XgTG4ni' \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'HE0tgVnu' \
    > test.out 2>&1
eval_tap $? 15 'DeletePass' test.out

#- 16 UpdatePass
./ng net.accelbyte.sdk.cli.Main seasonpass updatePass \
    --code 'unK4tlvN' \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'HheNa49C' \
    --body '{"autoEnroll": false, "displayOrder": 80, "images": [{"as": "vbfm4NVV", "caption": "GH3FJAbV", "height": 27, "imageUrl": "RTCDQytb", "smallImageUrl": "YCxAgNaZ", "width": 5}, {"as": "dKSF6J6i", "caption": "3WGAyoBb", "height": 5, "imageUrl": "EjWJxSZt", "smallImageUrl": "MgyUo6er", "width": 75}, {"as": "S1QR1eKK", "caption": "nfZxk6zo", "height": 40, "imageUrl": "ADzHSFNX", "smallImageUrl": "gI3h87zR", "width": 82}], "localizations": {"FRiQa561": {"description": "QNScOuc0", "title": "DB4oy2VU"}, "HshznQGn": {"description": "bwZtwcpH", "title": "cIjHD7wx"}, "StQm09Mz": {"description": "4ddRcPlB", "title": "lUCBYEYS"}}, "passItemId": "kcSy8ccf"}' \
    > test.out 2>&1
eval_tap $? 16 'UpdatePass' test.out

#- 17 PublishSeason
./ng net.accelbyte.sdk.cli.Main seasonpass publishSeason \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'xxmgVVob' \
    > test.out 2>&1
eval_tap $? 17 'PublishSeason' test.out

#- 18 RetireSeason
./ng net.accelbyte.sdk.cli.Main seasonpass retireSeason \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'FTEIGP8e' \
    --force  \
    > test.out 2>&1
eval_tap $? 18 'RetireSeason' test.out

#- 19 QueryRewards
./ng net.accelbyte.sdk.cli.Main seasonpass queryRewards \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'RFJ6b18j' \
    --q 'zubLinyv' \
    > test.out 2>&1
eval_tap $? 19 'QueryRewards' test.out

#- 20 CreateReward
./ng net.accelbyte.sdk.cli.Main seasonpass createReward \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'pIFkboqw' \
    --body '{"code": "s7mywUXy", "currency": {"currencyCode": "vTgVnw00", "namespace": "lihQjhLt"}, "image": {"as": "B9i2ZpFp", "caption": "NJe2hFR3", "height": 91, "imageUrl": "dbVY15Gb", "smallImageUrl": "nYf236FK", "width": 51}, "itemId": "7IyxvW2t", "quantity": 55, "type": "ITEM"}' \
    > test.out 2>&1
eval_tap $? 20 'CreateReward' test.out

#- 21 GetReward
./ng net.accelbyte.sdk.cli.Main seasonpass getReward \
    --code 'nociKzDv' \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'KiUURren' \
    > test.out 2>&1
eval_tap $? 21 'GetReward' test.out

#- 22 DeleteReward
./ng net.accelbyte.sdk.cli.Main seasonpass deleteReward \
    --code 'pWNYGXMr' \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'ixeN6Iz2' \
    > test.out 2>&1
eval_tap $? 22 'DeleteReward' test.out

#- 23 UpdateReward
./ng net.accelbyte.sdk.cli.Main seasonpass updateReward \
    --code 'DTwJIH8Y' \
    --namespace "$AB_NAMESPACE" \
    --seasonId '6H7LUAsM' \
    --body '{"currency": {"currencyCode": "XrxaIuA8", "namespace": "3FIbjGzW"}, "image": {"as": "LCtKntzt", "caption": "QP589sOR", "height": 76, "imageUrl": "IPVCDfSe", "smallImageUrl": "87lbDTNy", "width": 62}, "itemId": "Kyopuk09", "nullFields": ["xAucjpC0", "KzxgzDm0", "QjbLlQcg"], "quantity": 20, "type": "CURRENCY"}' \
    > test.out 2>&1
eval_tap $? 23 'UpdateReward' test.out

#- 24 QueryTiers
./ng net.accelbyte.sdk.cli.Main seasonpass queryTiers \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'hXeDo28O' \
    --limit '48' \
    --offset '54' \
    > test.out 2>&1
eval_tap $? 24 'QueryTiers' test.out

#- 25 CreateTier
./ng net.accelbyte.sdk.cli.Main seasonpass createTier \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'MiOqaSYM' \
    --body '{"index": 30, "quantity": 17, "tier": {"requiredExp": 64, "rewards": {"iPxEUURI": ["ZGcezirb", "ZQVJIxQw", "J2jcrN4j"], "WgnsoYEB": ["5jp6hPLr", "IwQ8RFas", "gwetcPOB"], "XyJPsYpt": ["38nd5giy", "ablhWlyZ", "UixYTVSH"]}}}' \
    > test.out 2>&1
eval_tap $? 25 'CreateTier' test.out

#- 26 UpdateTier
./ng net.accelbyte.sdk.cli.Main seasonpass updateTier \
    --id 'ultveQuu' \
    --namespace "$AB_NAMESPACE" \
    --seasonId '6teyVWgo' \
    --body '{"requiredExp": 38, "rewards": {"jvM3wowC": ["jo8znd2H", "H71JzB9o", "icQcJFPP"], "67yvLQtw": ["T90NePhq", "HifPBCwk", "Ty18xb8q"], "DvfAQEFX": ["nTSJTsq5", "iXaPU7YF", "9TjfMSBi"]}}' \
    > test.out 2>&1
eval_tap $? 26 'UpdateTier' test.out

#- 27 DeleteTier
./ng net.accelbyte.sdk.cli.Main seasonpass deleteTier \
    --id 'rqcqreCw' \
    --namespace "$AB_NAMESPACE" \
    --seasonId '5oJUy6pf' \
    > test.out 2>&1
eval_tap $? 27 'DeleteTier' test.out

#- 28 ReorderTier
./ng net.accelbyte.sdk.cli.Main seasonpass reorderTier \
    --id 'whSDn0Y3' \
    --namespace "$AB_NAMESPACE" \
    --seasonId '3xVbtvfR' \
    --body '{"newIndex": 6}' \
    > test.out 2>&1
eval_tap $? 28 'ReorderTier' test.out

#- 29 UnpublishSeason
./ng net.accelbyte.sdk.cli.Main seasonpass unpublishSeason \
    --namespace "$AB_NAMESPACE" \
    --seasonId '4HdZGlyo' \
    --force  \
    > test.out 2>&1
eval_tap $? 29 'UnpublishSeason' test.out

#- 30 GetUserParticipatedSeasons
./ng net.accelbyte.sdk.cli.Main seasonpass getUserParticipatedSeasons \
    --namespace "$AB_NAMESPACE" \
    --userId '7WU7u0rv' \
    --limit '0' \
    --offset '16' \
    > test.out 2>&1
eval_tap $? 30 'GetUserParticipatedSeasons' test.out

#- 31 GrantUserExp
./ng net.accelbyte.sdk.cli.Main seasonpass grantUserExp \
    --namespace "$AB_NAMESPACE" \
    --userId 'Xago6LTo' \
    --body '{"exp": 93, "source": "PAID_FOR", "tags": ["2vZ8Vl3C", "Jt9ZWCoO", "fkfuvafS"]}' \
    > test.out 2>&1
eval_tap $? 31 'GrantUserExp' test.out

#- 32 GrantUserPass
./ng net.accelbyte.sdk.cli.Main seasonpass grantUserPass \
    --namespace "$AB_NAMESPACE" \
    --userId 'LNDpStWR' \
    --body '{"passCode": "siHeNxOG", "passItemId": "dYKeRReM"}' \
    > test.out 2>&1
eval_tap $? 32 'GrantUserPass' test.out

#- 33 ExistsAnyPassByPassCodes
./ng net.accelbyte.sdk.cli.Main seasonpass existsAnyPassByPassCodes \
    --namespace "$AB_NAMESPACE" \
    --userId 'fcHwCZH9' \
    --passCodes 'vU85el1g,IEh9ppYc,Hk51nc6B' \
    > test.out 2>&1
eval_tap $? 33 'ExistsAnyPassByPassCodes' test.out

#- 34 GetCurrentUserSeasonProgression
./ng net.accelbyte.sdk.cli.Main seasonpass getCurrentUserSeasonProgression \
    --namespace "$AB_NAMESPACE" \
    --userId '7MIdhYJ0' \
    > test.out 2>&1
eval_tap $? 34 'GetCurrentUserSeasonProgression' test.out

#- 35 CheckSeasonPurchasable
./ng net.accelbyte.sdk.cli.Main seasonpass checkSeasonPurchasable \
    --namespace "$AB_NAMESPACE" \
    --userId '7AYE6X0G' \
    --body '{"passItemId": "Wbrf8vP2", "tierItemCount": 24, "tierItemId": "qZ5D5J85"}' \
    > test.out 2>&1
eval_tap $? 35 'CheckSeasonPurchasable' test.out

#- 36 ResetUserSeason
./ng net.accelbyte.sdk.cli.Main seasonpass resetUserSeason \
    --namespace "$AB_NAMESPACE" \
    --userId '3GX6vxxf' \
    > test.out 2>&1
eval_tap $? 36 'ResetUserSeason' test.out

#- 37 GrantUserTier
./ng net.accelbyte.sdk.cli.Main seasonpass grantUserTier \
    --namespace "$AB_NAMESPACE" \
    --userId '7jO2799b' \
    --body '{"count": 92, "source": "SWEAT", "tags": ["zrcF5G5B", "WPAzagUR", "3J98BONb"]}' \
    > test.out 2>&1
eval_tap $? 37 'GrantUserTier' test.out

#- 38 QueryUserExpGrantHistory
./ng net.accelbyte.sdk.cli.Main seasonpass queryUserExpGrantHistory \
    --namespace "$AB_NAMESPACE" \
    --userId 'rIGOkRgD' \
    --from 'eqjcYm3y' \
    --limit '11' \
    --offset '58' \
    --seasonId 'eUMaIqw6' \
    --source 'PAID_FOR' \
    --tags '9FFKEVFv,KFh4ObbS,2FpiGE7F' \
    --to 'v3dkdrpk' \
    > test.out 2>&1
eval_tap $? 38 'QueryUserExpGrantHistory' test.out

#- 39 QueryUserExpGrantHistoryTag
./ng net.accelbyte.sdk.cli.Main seasonpass queryUserExpGrantHistoryTag \
    --namespace "$AB_NAMESPACE" \
    --userId 'nMqIb5pw' \
    --seasonId '3wZ6tmAi' \
    > test.out 2>&1
eval_tap $? 39 'QueryUserExpGrantHistoryTag' test.out

#- 40 GetUserSeason
./ng net.accelbyte.sdk.cli.Main seasonpass getUserSeason \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'sGyMXCCR' \
    --userId 'MGVIaFLd' \
    > test.out 2>&1
eval_tap $? 40 'GetUserSeason' test.out

#- 41 PublicGetCurrentSeason
./ng net.accelbyte.sdk.cli.Main seasonpass publicGetCurrentSeason \
    --namespace "$AB_NAMESPACE" \
    --language '2Ou0R2vm' \
    > test.out 2>&1
eval_tap $? 41 'PublicGetCurrentSeason' test.out

#- 42 PublicGetCurrentUserSeason
./ng net.accelbyte.sdk.cli.Main seasonpass publicGetCurrentUserSeason \
    --namespace "$AB_NAMESPACE" \
    --userId 'tqNnGmdX' \
    > test.out 2>&1
eval_tap $? 42 'PublicGetCurrentUserSeason' test.out

#- 43 PublicClaimUserReward
./ng net.accelbyte.sdk.cli.Main seasonpass publicClaimUserReward \
    --namespace "$AB_NAMESPACE" \
    --userId 'AtqqmN5p' \
    --body '{"passCode": "1OHrsNFw", "rewardCode": "07L7aeP9", "tierIndex": 67}' \
    > test.out 2>&1
eval_tap $? 43 'PublicClaimUserReward' test.out

#- 44 PublicBulkClaimUserRewards
./ng net.accelbyte.sdk.cli.Main seasonpass publicBulkClaimUserRewards \
    --namespace "$AB_NAMESPACE" \
    --userId 'YQjv4PBp' \
    > test.out 2>&1
eval_tap $? 44 'PublicBulkClaimUserRewards' test.out

#- 45 PublicGetUserSeason
./ng net.accelbyte.sdk.cli.Main seasonpass publicGetUserSeason \
    --namespace "$AB_NAMESPACE" \
    --seasonId '9P7fbDcx' \
    --userId 'j8Z14bhk' \
    > test.out 2>&1
eval_tap $? 45 'PublicGetUserSeason' test.out


rm -f "tmp.dat"

exit $EXIT_CODE