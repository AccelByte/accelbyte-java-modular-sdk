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
    --limit '30' \
    --offset '23' \
    --status 'PUBLISHED,DRAFT,PUBLISHED' \
    > test.out 2>&1
eval_tap $? 3 'QuerySeasons' test.out

#- 4 CreateSeason
./ng net.accelbyte.sdk.cli.Main seasonpass createSeason \
    --namespace "$AB_NAMESPACE" \
    --body '{"autoClaim": false, "defaultLanguage": "BbZTQV3n", "defaultRequiredExp": 37, "draftStoreId": "5theAlbJ", "end": "1982-04-13T00:00:00Z", "excessStrategy": {"currency": "Gu5lnz11", "method": "CURRENCY", "percentPerExp": 16}, "images": [{"as": "SbG9JRtb", "caption": "gPMUofyA", "height": 68, "imageUrl": "c8c3xFke", "smallImageUrl": "YKi5h3uE", "width": 9}, {"as": "MqGokllH", "caption": "pizFMmqM", "height": 65, "imageUrl": "RjUJZEMD", "smallImageUrl": "vqS8MB1M", "width": 77}, {"as": "OubRbL4M", "caption": "Hk6KHDyY", "height": 15, "imageUrl": "lSTm3Me7", "smallImageUrl": "OSTwrr47", "width": 23}], "localizations": {"JeCLbT9G": {"description": "zEoxYNR2", "title": "XVan8XRJ"}, "RnSZ08yY": {"description": "W1hIf9Aw", "title": "eBq4Od4P"}, "r2F01edj": {"description": "C2aKOP9B", "title": "0ThoG8az"}}, "name": "29wvSU7v", "start": "1972-06-28T00:00:00Z", "tierItemId": "hKxo0fTG"}' \
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
    --body '{"userIds": ["kxX9VOsc", "D8uDZNwt", "hvgUQywg"]}' \
    > test.out 2>&1
eval_tap $? 6 'BulkGetUserSeasonProgression' test.out

#- 7 GetItemReferences
./ng net.accelbyte.sdk.cli.Main seasonpass getItemReferences \
    --namespace "$AB_NAMESPACE" \
    --itemId '7HbcDFJY' \
    > test.out 2>&1
eval_tap $? 7 'GetItemReferences' test.out

#- 8 GetSeason
./ng net.accelbyte.sdk.cli.Main seasonpass getSeason \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'i4tqlZKO' \
    > test.out 2>&1
eval_tap $? 8 'GetSeason' test.out

#- 9 DeleteSeason
./ng net.accelbyte.sdk.cli.Main seasonpass deleteSeason \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'srsbsKIr' \
    > test.out 2>&1
eval_tap $? 9 'DeleteSeason' test.out

#- 10 UpdateSeason
./ng net.accelbyte.sdk.cli.Main seasonpass updateSeason \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'YWhNgrob' \
    --body '{"autoClaim": true, "defaultLanguage": "r8WqPuTJ", "defaultRequiredExp": 79, "draftStoreId": "XfyMxiQd", "end": "1973-09-05T00:00:00Z", "excessStrategy": {"currency": "LjIRGhMS", "method": "CURRENCY", "percentPerExp": 62}, "images": [{"as": "EzokggzG", "caption": "sJsL26mD", "height": 42, "imageUrl": "kns9Ujqw", "smallImageUrl": "7Y41Rc0r", "width": 87}, {"as": "ReB497Ft", "caption": "XBk1lZi1", "height": 96, "imageUrl": "0YdkfltT", "smallImageUrl": "0ClHODfy", "width": 58}, {"as": "IvlTlNzE", "caption": "tcdS0RXS", "height": 9, "imageUrl": "x1KuyNxS", "smallImageUrl": "0sLBLek3", "width": 38}], "localizations": {"A1xAJUys": {"description": "b8hV2Cpu", "title": "jakLHnXM"}, "6y3RM2vK": {"description": "1LBLIwmT", "title": "zfdt9Ck8"}, "CC37lUpK": {"description": "FKlxvp3w", "title": "fxoRqM2v"}}, "name": "PK2MDVOn", "start": "1986-08-23T00:00:00Z", "tierItemId": "iZwHZrJJ"}' \
    > test.out 2>&1
eval_tap $? 10 'UpdateSeason' test.out

#- 11 CloneSeason
./ng net.accelbyte.sdk.cli.Main seasonpass cloneSeason \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'eKlzx4re' \
    --body '{"end": "1994-02-18T00:00:00Z", "name": "NQa2ftR5", "start": "1975-03-24T00:00:00Z"}' \
    > test.out 2>&1
eval_tap $? 11 'CloneSeason' test.out

#- 12 GetFullSeason
./ng net.accelbyte.sdk.cli.Main seasonpass getFullSeason \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'ogqzwMr4' \
    > test.out 2>&1
eval_tap $? 12 'GetFullSeason' test.out

#- 13 QueryPasses
./ng net.accelbyte.sdk.cli.Main seasonpass queryPasses \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'bNWoEhl4' \
    > test.out 2>&1
eval_tap $? 13 'QueryPasses' test.out

#- 14 CreatePass
./ng net.accelbyte.sdk.cli.Main seasonpass createPass \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'xkunZvZR' \
    --body '{"autoEnroll": true, "code": "jHCOTiGo", "displayOrder": 99, "images": [{"as": "ytG8g3q6", "caption": "u1BWTFtS", "height": 52, "imageUrl": "KxXdHtYp", "smallImageUrl": "HT40eBkC", "width": 39}, {"as": "YwPBjTRJ", "caption": "j2eT1cqK", "height": 62, "imageUrl": "OEGL1Ztz", "smallImageUrl": "30Jysr5T", "width": 1}, {"as": "raLO8C8T", "caption": "us7pcKDz", "height": 20, "imageUrl": "JQKnBUlZ", "smallImageUrl": "U5uon7UW", "width": 86}], "localizations": {"SGrHG0up": {"description": "IDdyUMqN", "title": "Rndf5aY3"}, "CqqL0on1": {"description": "4HDXn1sE", "title": "nMd3RErz"}, "hLDMfdzI": {"description": "zmF12W2J", "title": "U6Rp1U28"}}, "passItemId": "k3DWM0uM"}' \
    > test.out 2>&1
eval_tap $? 14 'CreatePass' test.out

#- 15 GetPass
./ng net.accelbyte.sdk.cli.Main seasonpass getPass \
    --code 'O8IZfKuG' \
    --namespace "$AB_NAMESPACE" \
    --seasonId '6RWy7ZPF' \
    > test.out 2>&1
eval_tap $? 15 'GetPass' test.out

#- 16 DeletePass
./ng net.accelbyte.sdk.cli.Main seasonpass deletePass \
    --code 'YzVNfhKI' \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'WwQnrGYN' \
    > test.out 2>&1
eval_tap $? 16 'DeletePass' test.out

#- 17 UpdatePass
./ng net.accelbyte.sdk.cli.Main seasonpass updatePass \
    --code 'DnywUbgr' \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'cu1aZ0Qu' \
    --body '{"autoEnroll": false, "displayOrder": 31, "images": [{"as": "rVt75hvb", "caption": "xLwi8lU6", "height": 32, "imageUrl": "243iBGaz", "smallImageUrl": "YOZsQf2F", "width": 89}, {"as": "XeLUwSVI", "caption": "XVlsyWLs", "height": 4, "imageUrl": "Qiil8sNi", "smallImageUrl": "SrGLLBdV", "width": 61}, {"as": "zydkhZvO", "caption": "9ApAJwtg", "height": 83, "imageUrl": "0WMmGz0i", "smallImageUrl": "9A1lPOxa", "width": 50}], "localizations": {"lKnmmmp9": {"description": "VSjGQmi0", "title": "A3lmx6I4"}, "CxhddT1l": {"description": "94IdjUCY", "title": "WhXhCkJb"}, "ujVaypl4": {"description": "pQFpCbBf", "title": "XLdO1I4e"}}, "passItemId": "SuWTBOi6"}' \
    > test.out 2>&1
eval_tap $? 17 'UpdatePass' test.out

#- 18 PublishSeason
./ng net.accelbyte.sdk.cli.Main seasonpass publishSeason \
    --namespace "$AB_NAMESPACE" \
    --seasonId '9UnUBRDT' \
    > test.out 2>&1
eval_tap $? 18 'PublishSeason' test.out

#- 19 RetireSeason
./ng net.accelbyte.sdk.cli.Main seasonpass retireSeason \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'KvDBR9pg' \
    --force  \
    > test.out 2>&1
eval_tap $? 19 'RetireSeason' test.out

#- 20 QueryRewards
./ng net.accelbyte.sdk.cli.Main seasonpass queryRewards \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'AWQwQ6na' \
    --q 'FeVaY8Ni' \
    > test.out 2>&1
eval_tap $? 20 'QueryRewards' test.out

#- 21 CreateReward
./ng net.accelbyte.sdk.cli.Main seasonpass createReward \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'tGxb3xWP' \
    --body '{"code": "kgzA7AVy", "currency": {"currencyCode": "ziVMVpxa", "namespace": "WnB7HezC"}, "image": {"as": "MJUyM4g1", "caption": "YqsmYlTQ", "height": 72, "imageUrl": "5AG45h9P", "smallImageUrl": "OWjjAogU", "width": 32}, "itemId": "Neq8SL6s", "quantity": 71, "type": "ITEM"}' \
    > test.out 2>&1
eval_tap $? 21 'CreateReward' test.out

#- 22 GetReward
./ng net.accelbyte.sdk.cli.Main seasonpass getReward \
    --code 'FsmlkyxP' \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'n4LvQZOR' \
    > test.out 2>&1
eval_tap $? 22 'GetReward' test.out

#- 23 DeleteReward
./ng net.accelbyte.sdk.cli.Main seasonpass deleteReward \
    --code '41xGikFN' \
    --namespace "$AB_NAMESPACE" \
    --seasonId '77aEPSqU' \
    > test.out 2>&1
eval_tap $? 23 'DeleteReward' test.out

#- 24 UpdateReward
./ng net.accelbyte.sdk.cli.Main seasonpass updateReward \
    --code '5FpZPp1D' \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'yp3F991m' \
    --body '{"currency": {"currencyCode": "v2EZYy2K", "namespace": "zFw1LsWP"}, "image": {"as": "QFSw0AkB", "caption": "laaUvDzT", "height": 20, "imageUrl": "Zf2ONWmq", "smallImageUrl": "Y0J3Z8ei", "width": 93}, "itemId": "hX4IB2l7", "nullFields": ["qbRMQWc2", "2fV5VTb3", "fT3MFXME"], "quantity": 77, "type": "CURRENCY"}' \
    > test.out 2>&1
eval_tap $? 24 'UpdateReward' test.out

#- 25 QueryTiers
./ng net.accelbyte.sdk.cli.Main seasonpass queryTiers \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'VC5RRAgQ' \
    --limit '52' \
    --offset '16' \
    > test.out 2>&1
eval_tap $? 25 'QueryTiers' test.out

#- 26 CreateTier
./ng net.accelbyte.sdk.cli.Main seasonpass createTier \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'A35As6J9' \
    --body '{"index": 35, "quantity": 66, "tier": {"requiredExp": 85, "rewards": {"3DVJcyz4": ["F8EZNBYz", "pikvx6MJ", "hwXuPJsk"], "KRblCTPU": ["b0mh14pf", "4gf2JjDk", "0UeewfDX"], "ADhXh6GD": ["Jeouupik", "hQm7PcjV", "AdNTOmXz"]}}}' \
    > test.out 2>&1
eval_tap $? 26 'CreateTier' test.out

#- 27 UpdateTier
./ng net.accelbyte.sdk.cli.Main seasonpass updateTier \
    --id '4YAnZ26U' \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'XlcmZNpN' \
    --body '{"requiredExp": 44, "rewards": {"JchERcA6": ["IrXYfqOX", "5kGE538K", "YKtCtijT"], "a9QwGi5P": ["BLi4zwB0", "JIENA2CN", "zEEC6goM"], "dN07JaqI": ["aSz8oCKc", "jXuhySDt", "zCFZh5Zg"]}}' \
    > test.out 2>&1
eval_tap $? 27 'UpdateTier' test.out

#- 28 DeleteTier
./ng net.accelbyte.sdk.cli.Main seasonpass deleteTier \
    --id 'Os0ojvNP' \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'qEBk9Q3P' \
    > test.out 2>&1
eval_tap $? 28 'DeleteTier' test.out

#- 29 ReorderTier
./ng net.accelbyte.sdk.cli.Main seasonpass reorderTier \
    --id 'nIsp3zGt' \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'xfNxEoxj' \
    --body '{"newIndex": 41}' \
    > test.out 2>&1
eval_tap $? 29 'ReorderTier' test.out

#- 30 UnpublishSeason
./ng net.accelbyte.sdk.cli.Main seasonpass unpublishSeason \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'c3RV3Cbg' \
    --force  \
    > test.out 2>&1
eval_tap $? 30 'UnpublishSeason' test.out

#- 31 GetUserParticipatedSeasons
./ng net.accelbyte.sdk.cli.Main seasonpass getUserParticipatedSeasons \
    --namespace "$AB_NAMESPACE" \
    --userId 'drWVIWPi' \
    --limit '73' \
    --offset '68' \
    > test.out 2>&1
eval_tap $? 31 'GetUserParticipatedSeasons' test.out

#- 32 GrantUserExp
./ng net.accelbyte.sdk.cli.Main seasonpass grantUserExp \
    --namespace "$AB_NAMESPACE" \
    --userId 'Fc01WOXD' \
    --body '{"exp": 5, "source": "PAID_FOR", "tags": ["yyY9EBiV", "DVfYLt1d", "efpcCWKx"]}' \
    > test.out 2>&1
eval_tap $? 32 'GrantUserExp' test.out

#- 33 GrantUserPass
./ng net.accelbyte.sdk.cli.Main seasonpass grantUserPass \
    --namespace "$AB_NAMESPACE" \
    --userId 'neR5DfcI' \
    --body '{"passCode": "QpQfMJaJ", "passItemId": "WwPVVMnV"}' \
    > test.out 2>&1
eval_tap $? 33 'GrantUserPass' test.out

#- 34 ExistsAnyPassByPassCodes
./ng net.accelbyte.sdk.cli.Main seasonpass existsAnyPassByPassCodes \
    --namespace "$AB_NAMESPACE" \
    --userId 'BvbdmXIm' \
    --passCodes 'Sloo5SF1,RqcBjtBx,rflzcVpb' \
    > test.out 2>&1
eval_tap $? 34 'ExistsAnyPassByPassCodes' test.out

#- 35 GetCurrentUserSeasonProgression
./ng net.accelbyte.sdk.cli.Main seasonpass getCurrentUserSeasonProgression \
    --namespace "$AB_NAMESPACE" \
    --userId '9ca3xd43' \
    > test.out 2>&1
eval_tap $? 35 'GetCurrentUserSeasonProgression' test.out

#- 36 CheckSeasonPurchasable
./ng net.accelbyte.sdk.cli.Main seasonpass checkSeasonPurchasable \
    --namespace "$AB_NAMESPACE" \
    --userId 'vutuVyze' \
    --body '{"passItemId": "kh8VB1Es", "tierItemCount": 95, "tierItemId": "kSRPE2nF"}' \
    > test.out 2>&1
eval_tap $? 36 'CheckSeasonPurchasable' test.out

#- 37 ResetUserSeason
./ng net.accelbyte.sdk.cli.Main seasonpass resetUserSeason \
    --namespace "$AB_NAMESPACE" \
    --userId 'cxxPjiMr' \
    > test.out 2>&1
eval_tap $? 37 'ResetUserSeason' test.out

#- 38 GrantUserTier
./ng net.accelbyte.sdk.cli.Main seasonpass grantUserTier \
    --namespace "$AB_NAMESPACE" \
    --userId 'lLzbEz9I' \
    --body '{"count": 81, "source": "PAID_FOR", "tags": ["V3I1HKt8", "b2De8Epa", "9phVcRNR"]}' \
    > test.out 2>&1
eval_tap $? 38 'GrantUserTier' test.out

#- 39 QueryUserExpGrantHistory
./ng net.accelbyte.sdk.cli.Main seasonpass queryUserExpGrantHistory \
    --namespace "$AB_NAMESPACE" \
    --userId 'ui2N7wjf' \
    --from 'gE2fCxPB' \
    --limit '94' \
    --offset '26' \
    --seasonId 'yoib8ZQd' \
    --source 'SWEAT' \
    --tags 'oDUtiBvM,ZusRpezb,l1GecNny' \
    --to 'nouF5L0F' \
    > test.out 2>&1
eval_tap $? 39 'QueryUserExpGrantHistory' test.out

#- 40 QueryUserExpGrantHistoryTag
./ng net.accelbyte.sdk.cli.Main seasonpass queryUserExpGrantHistoryTag \
    --namespace "$AB_NAMESPACE" \
    --userId 'rYtW2LsP' \
    --seasonId 'aSjHNf8I' \
    > test.out 2>&1
eval_tap $? 40 'QueryUserExpGrantHistoryTag' test.out

#- 41 GetUserSeason
./ng net.accelbyte.sdk.cli.Main seasonpass getUserSeason \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'm9UnIfTK' \
    --userId '8TRrafzb' \
    > test.out 2>&1
eval_tap $? 41 'GetUserSeason' test.out

#- 42 PublicGetCurrentSeason
./ng net.accelbyte.sdk.cli.Main seasonpass publicGetCurrentSeason \
    --namespace "$AB_NAMESPACE" \
    --language 'dVj93nyT' \
    > test.out 2>&1
eval_tap $? 42 'PublicGetCurrentSeason' test.out

#- 43 PublicGetCurrentUserSeason
./ng net.accelbyte.sdk.cli.Main seasonpass publicGetCurrentUserSeason \
    --namespace "$AB_NAMESPACE" \
    --userId 'hu859kKs' \
    > test.out 2>&1
eval_tap $? 43 'PublicGetCurrentUserSeason' test.out

#- 44 PublicClaimUserReward
./ng net.accelbyte.sdk.cli.Main seasonpass publicClaimUserReward \
    --namespace "$AB_NAMESPACE" \
    --userId 'QtrPw5Vj' \
    --body '{"passCode": "0rQFoFgJ", "rewardCode": "l5WFn76t", "tierIndex": 75}' \
    > test.out 2>&1
eval_tap $? 44 'PublicClaimUserReward' test.out

#- 45 PublicBulkClaimUserRewards
./ng net.accelbyte.sdk.cli.Main seasonpass publicBulkClaimUserRewards \
    --namespace "$AB_NAMESPACE" \
    --userId '7z5N6CVO' \
    > test.out 2>&1
eval_tap $? 45 'PublicBulkClaimUserRewards' test.out

#- 46 PublicGetUserSeason
./ng net.accelbyte.sdk.cli.Main seasonpass publicGetUserSeason \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'TqkQoo7I' \
    --userId 'iPn3Piq3' \
    > test.out 2>&1
eval_tap $? 46 'PublicGetUserSeason' test.out


rm -f "tmp.dat"

exit $EXIT_CODE