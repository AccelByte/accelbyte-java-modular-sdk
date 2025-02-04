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
    --limit '98' \
    --offset '84' \
    --status 'DRAFT,RETIRED,PUBLISHED' \
    > test.out 2>&1
eval_tap $? 3 'QuerySeasons' test.out

#- 4 CreateSeason
./ng net.accelbyte.sdk.cli.Main seasonpass createSeason \
    --namespace "$AB_NAMESPACE" \
    --body '{"autoClaim": false, "defaultLanguage": "p87CnggJ", "defaultRequiredExp": 22, "draftStoreId": "CNLphd3o", "end": "1985-05-31T00:00:00Z", "excessStrategy": {"currency": "YxGoaivF", "method": "CURRENCY", "percentPerExp": 70}, "images": [{"as": "fzorUUqO", "caption": "KoQmWdsL", "height": 76, "imageUrl": "MsdT4hkq", "smallImageUrl": "XV43WGtb", "width": 73}, {"as": "vN6XhHbU", "caption": "3Yguv1QM", "height": 29, "imageUrl": "VY5BkU0j", "smallImageUrl": "X0znmezO", "width": 89}, {"as": "yu0iW7Dl", "caption": "WsGw1Nxg", "height": 85, "imageUrl": "6LVMw8ha", "smallImageUrl": "br2UGBrW", "width": 59}], "localizations": {"zp1kM2pN": {"description": "9JQbJ5L8", "title": "s0C5YVpQ"}, "O6NnRagV": {"description": "p7BJfnN7", "title": "IWzFGxDz"}, "rXgoCgZa": {"description": "jH49sDwW", "title": "WCkYpjNo"}}, "name": "aXD5Wd4h", "start": "1999-10-19T00:00:00Z", "tierItemId": "oShX368c"}' \
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
    --body '{"userIds": ["Tf0Jx6CM", "C4esN0XS", "l7EKvoLZ"]}' \
    > test.out 2>&1
eval_tap $? 6 'BulkGetUserSeasonProgression' test.out

#- 7 GetSeason
./ng net.accelbyte.sdk.cli.Main seasonpass getSeason \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'e9K5o2WH' \
    > test.out 2>&1
eval_tap $? 7 'GetSeason' test.out

#- 8 DeleteSeason
./ng net.accelbyte.sdk.cli.Main seasonpass deleteSeason \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'ifzwE2Q8' \
    > test.out 2>&1
eval_tap $? 8 'DeleteSeason' test.out

#- 9 UpdateSeason
./ng net.accelbyte.sdk.cli.Main seasonpass updateSeason \
    --namespace "$AB_NAMESPACE" \
    --seasonId '4BpBrrO1' \
    --body '{"autoClaim": true, "defaultLanguage": "Tk0fjjYv", "defaultRequiredExp": 37, "draftStoreId": "olsZjjNe", "end": "1988-11-23T00:00:00Z", "excessStrategy": {"currency": "bCHyNSdo", "method": "NONE", "percentPerExp": 31}, "images": [{"as": "BxiXITy1", "caption": "FwmZtsfL", "height": 46, "imageUrl": "54jUXU3R", "smallImageUrl": "k2kp9990", "width": 20}, {"as": "koydn62B", "caption": "zuhOrB9k", "height": 64, "imageUrl": "FVYs4anF", "smallImageUrl": "D3VOHKgp", "width": 59}, {"as": "7INRWb5d", "caption": "6b3YXyst", "height": 80, "imageUrl": "V1R86rfq", "smallImageUrl": "SjP8XfqM", "width": 34}], "localizations": {"2Hkf5tbV": {"description": "VboEESEM", "title": "aMsEyqUn"}, "99XVPxYD": {"description": "sReE3pBb", "title": "3ForslT7"}, "RK8MyWWI": {"description": "jpmgfnPs", "title": "nLSv94zt"}}, "name": "1PIrLXpT", "start": "1973-08-19T00:00:00Z", "tierItemId": "VyCE57LE"}' \
    > test.out 2>&1
eval_tap $? 9 'UpdateSeason' test.out

#- 10 CloneSeason
./ng net.accelbyte.sdk.cli.Main seasonpass cloneSeason \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'liFSZMMn' \
    --body '{"end": "1994-07-31T00:00:00Z", "name": "hzh9OPlT", "start": "1987-07-14T00:00:00Z"}' \
    > test.out 2>&1
eval_tap $? 10 'CloneSeason' test.out

#- 11 GetFullSeason
./ng net.accelbyte.sdk.cli.Main seasonpass getFullSeason \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'FoqdeFzf' \
    > test.out 2>&1
eval_tap $? 11 'GetFullSeason' test.out

#- 12 QueryPasses
./ng net.accelbyte.sdk.cli.Main seasonpass queryPasses \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'CGdeg6mg' \
    > test.out 2>&1
eval_tap $? 12 'QueryPasses' test.out

#- 13 CreatePass
./ng net.accelbyte.sdk.cli.Main seasonpass createPass \
    --namespace "$AB_NAMESPACE" \
    --seasonId '6tcOcS5r' \
    --body '{"autoEnroll": true, "code": "r2Ub9AeI", "displayOrder": 90, "images": [{"as": "HmgkSYWJ", "caption": "mll2nVya", "height": 57, "imageUrl": "QsOd9ZuI", "smallImageUrl": "w1qqWJDg", "width": 34}, {"as": "zfZIWWjT", "caption": "G0DzCatf", "height": 86, "imageUrl": "EPk4d1cv", "smallImageUrl": "oxwMQfTp", "width": 97}, {"as": "tiFBRtv3", "caption": "bJD9vOcQ", "height": 33, "imageUrl": "qbTUaaUn", "smallImageUrl": "MJdbwxCR", "width": 77}], "localizations": {"NLgFA4VG": {"description": "1Q6SpBpW", "title": "nSfAFv8o"}, "A0RweabN": {"description": "sQAuJihi", "title": "2vo8tByw"}, "RdHoF5gy": {"description": "jA5k2eWt", "title": "7TjHdCeX"}}, "passItemId": "BGyZoja2"}' \
    > test.out 2>&1
eval_tap $? 13 'CreatePass' test.out

#- 14 GetPass
./ng net.accelbyte.sdk.cli.Main seasonpass getPass \
    --code '7hSM94sl' \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'cfqW5jTz' \
    > test.out 2>&1
eval_tap $? 14 'GetPass' test.out

#- 15 DeletePass
./ng net.accelbyte.sdk.cli.Main seasonpass deletePass \
    --code 'poLRUX2j' \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'pqPQTN2E' \
    > test.out 2>&1
eval_tap $? 15 'DeletePass' test.out

#- 16 UpdatePass
./ng net.accelbyte.sdk.cli.Main seasonpass updatePass \
    --code 'hocB22NA' \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'uSlKhvrw' \
    --body '{"autoEnroll": true, "displayOrder": 91, "images": [{"as": "axqz8mGG", "caption": "2UfUaZZ4", "height": 31, "imageUrl": "FTdpyVv3", "smallImageUrl": "isAG5Cpz", "width": 16}, {"as": "JJEh8CK0", "caption": "Z1kWHZNd", "height": 66, "imageUrl": "7CzRQffp", "smallImageUrl": "NyBjE5dB", "width": 90}, {"as": "N9QSBOZE", "caption": "78vOKfna", "height": 28, "imageUrl": "IOPGgG1s", "smallImageUrl": "DQOgoV19", "width": 62}], "localizations": {"JxIlvpdl": {"description": "TKAzGSaf", "title": "lE2pqIRM"}, "1A7inXXe": {"description": "kzx6YKn7", "title": "thjvQXZx"}, "l4aDXy4R": {"description": "AxA8JhEi", "title": "OW7uD5zf"}}, "passItemId": "DqorSsxN"}' \
    > test.out 2>&1
eval_tap $? 16 'UpdatePass' test.out

#- 17 PublishSeason
./ng net.accelbyte.sdk.cli.Main seasonpass publishSeason \
    --namespace "$AB_NAMESPACE" \
    --seasonId 't7jn72wj' \
    > test.out 2>&1
eval_tap $? 17 'PublishSeason' test.out

#- 18 RetireSeason
./ng net.accelbyte.sdk.cli.Main seasonpass retireSeason \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'uRVuIO47' \
    --force  \
    > test.out 2>&1
eval_tap $? 18 'RetireSeason' test.out

#- 19 QueryRewards
./ng net.accelbyte.sdk.cli.Main seasonpass queryRewards \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'MeQHQaTf' \
    --q 'HO3JnIdN' \
    > test.out 2>&1
eval_tap $? 19 'QueryRewards' test.out

#- 20 CreateReward
./ng net.accelbyte.sdk.cli.Main seasonpass createReward \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'f4paZteU' \
    --body '{"code": "GqZtfIMV", "currency": {"currencyCode": "LXhSbmH9", "namespace": "poxiSbO2"}, "image": {"as": "BZRKdF17", "caption": "U0p2iFD0", "height": 13, "imageUrl": "zDuCguoN", "smallImageUrl": "1OCPLOfs", "width": 14}, "itemId": "q3RcTVvo", "quantity": 57, "type": "CURRENCY"}' \
    > test.out 2>&1
eval_tap $? 20 'CreateReward' test.out

#- 21 GetReward
./ng net.accelbyte.sdk.cli.Main seasonpass getReward \
    --code 'MRhI2vFR' \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'V6wDMd8Q' \
    > test.out 2>&1
eval_tap $? 21 'GetReward' test.out

#- 22 DeleteReward
./ng net.accelbyte.sdk.cli.Main seasonpass deleteReward \
    --code 'iBZWp84A' \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'CuGlCqQM' \
    > test.out 2>&1
eval_tap $? 22 'DeleteReward' test.out

#- 23 UpdateReward
./ng net.accelbyte.sdk.cli.Main seasonpass updateReward \
    --code 'ZcTysqaV' \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'EaTtyyox' \
    --body '{"currency": {"currencyCode": "jYUwRoNC", "namespace": "ueKBkHlk"}, "image": {"as": "lzJDdVd8", "caption": "91pZvNcw", "height": 50, "imageUrl": "abyYoaCZ", "smallImageUrl": "BPsWfzqH", "width": 62}, "itemId": "6tgVhrTb", "nullFields": ["2j1w3H0X", "M541Uz5B", "YXF2lDdU"], "quantity": 60, "type": "ITEM"}' \
    > test.out 2>&1
eval_tap $? 23 'UpdateReward' test.out

#- 24 QueryTiers
./ng net.accelbyte.sdk.cli.Main seasonpass queryTiers \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'prJfPkIf' \
    --limit '20' \
    --offset '87' \
    > test.out 2>&1
eval_tap $? 24 'QueryTiers' test.out

#- 25 CreateTier
./ng net.accelbyte.sdk.cli.Main seasonpass createTier \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'lj233oiZ' \
    --body '{"index": 82, "quantity": 53, "tier": {"requiredExp": 60, "rewards": {"mezBPAVc": ["UYXTOajB", "I0urHTaq", "hS9GhGcP"], "TPDE9cXe": ["XFWrDtUd", "jS4Xa8vz", "XKAFId6v"], "zpSyFJzA": ["jvUZhcdu", "jwx9gJDC", "R1MRW8bb"]}}}' \
    > test.out 2>&1
eval_tap $? 25 'CreateTier' test.out

#- 26 UpdateTier
./ng net.accelbyte.sdk.cli.Main seasonpass updateTier \
    --id 'CosM6GYx' \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'DoBZzvLd' \
    --body '{"requiredExp": 46, "rewards": {"tXfLvcIg": ["Zf5IhgWO", "hqmM791e", "cxQTyU1a"], "3NFGCRdR": ["lp6mjaC8", "bYXTgxlP", "mPR5UxDk"], "7An4j71o": ["LQL5UPEL", "6LK32Pb5", "yj4JZOdv"]}}' \
    > test.out 2>&1
eval_tap $? 26 'UpdateTier' test.out

#- 27 DeleteTier
./ng net.accelbyte.sdk.cli.Main seasonpass deleteTier \
    --id '9WvHESef' \
    --namespace "$AB_NAMESPACE" \
    --seasonId '4hc8UEfA' \
    > test.out 2>&1
eval_tap $? 27 'DeleteTier' test.out

#- 28 ReorderTier
./ng net.accelbyte.sdk.cli.Main seasonpass reorderTier \
    --id '7dEQEFQu' \
    --namespace "$AB_NAMESPACE" \
    --seasonId '2KZM0yws' \
    --body '{"newIndex": 60}' \
    > test.out 2>&1
eval_tap $? 28 'ReorderTier' test.out

#- 29 UnpublishSeason
./ng net.accelbyte.sdk.cli.Main seasonpass unpublishSeason \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'hiMe5pQB' \
    --force  \
    > test.out 2>&1
eval_tap $? 29 'UnpublishSeason' test.out

#- 30 GetUserParticipatedSeasons
./ng net.accelbyte.sdk.cli.Main seasonpass getUserParticipatedSeasons \
    --namespace "$AB_NAMESPACE" \
    --userId 'Zs6OQmE5' \
    --limit '70' \
    --offset '33' \
    > test.out 2>&1
eval_tap $? 30 'GetUserParticipatedSeasons' test.out

#- 31 GrantUserExp
./ng net.accelbyte.sdk.cli.Main seasonpass grantUserExp \
    --namespace "$AB_NAMESPACE" \
    --userId 'SKnYl8mH' \
    --body '{"exp": 28, "source": "PAID_FOR", "tags": ["FAQqqOcE", "g7aqHwPV", "sigegTCU"]}' \
    > test.out 2>&1
eval_tap $? 31 'GrantUserExp' test.out

#- 32 GrantUserPass
./ng net.accelbyte.sdk.cli.Main seasonpass grantUserPass \
    --namespace "$AB_NAMESPACE" \
    --userId 'y24JjER0' \
    --body '{"passCode": "JnQJ0R0I", "passItemId": "jxn99akD"}' \
    > test.out 2>&1
eval_tap $? 32 'GrantUserPass' test.out

#- 33 ExistsAnyPassByPassCodes
./ng net.accelbyte.sdk.cli.Main seasonpass existsAnyPassByPassCodes \
    --namespace "$AB_NAMESPACE" \
    --userId 'E3uQhu0s' \
    --passCodes 'fYVn3vKK,k0FcGocn,2MrOFF0A' \
    > test.out 2>&1
eval_tap $? 33 'ExistsAnyPassByPassCodes' test.out

#- 34 GetCurrentUserSeasonProgression
./ng net.accelbyte.sdk.cli.Main seasonpass getCurrentUserSeasonProgression \
    --namespace "$AB_NAMESPACE" \
    --userId 'xYVfrZES' \
    > test.out 2>&1
eval_tap $? 34 'GetCurrentUserSeasonProgression' test.out

#- 35 CheckSeasonPurchasable
./ng net.accelbyte.sdk.cli.Main seasonpass checkSeasonPurchasable \
    --namespace "$AB_NAMESPACE" \
    --userId 'HeJO4eaj' \
    --body '{"passItemId": "tf9iAj6q", "tierItemCount": 28, "tierItemId": "eeQdIHbC"}' \
    > test.out 2>&1
eval_tap $? 35 'CheckSeasonPurchasable' test.out

#- 36 ResetUserSeason
./ng net.accelbyte.sdk.cli.Main seasonpass resetUserSeason \
    --namespace "$AB_NAMESPACE" \
    --userId 'Tlnf4P3N' \
    > test.out 2>&1
eval_tap $? 36 'ResetUserSeason' test.out

#- 37 GrantUserTier
./ng net.accelbyte.sdk.cli.Main seasonpass grantUserTier \
    --namespace "$AB_NAMESPACE" \
    --userId 'KlMlm21I' \
    --body '{"count": 21, "source": "PAID_FOR", "tags": ["LNk7E6ej", "EwIAxAbW", "lSfJdSpS"]}' \
    > test.out 2>&1
eval_tap $? 37 'GrantUserTier' test.out

#- 38 QueryUserExpGrantHistory
./ng net.accelbyte.sdk.cli.Main seasonpass queryUserExpGrantHistory \
    --namespace "$AB_NAMESPACE" \
    --userId 'oXKzZNlB' \
    --from 'VT522PTQ' \
    --limit '6' \
    --offset '55' \
    --seasonId 'bQ03EpEt' \
    --source 'SWEAT' \
    --tags 'oh2EvMWR,zI4iZTKR,Y2VDiDpp' \
    --to 'yfLhTdPc' \
    > test.out 2>&1
eval_tap $? 38 'QueryUserExpGrantHistory' test.out

#- 39 QueryUserExpGrantHistoryTag
./ng net.accelbyte.sdk.cli.Main seasonpass queryUserExpGrantHistoryTag \
    --namespace "$AB_NAMESPACE" \
    --userId 'CS9TgyJ0' \
    --seasonId 'CLzhbyDD' \
    > test.out 2>&1
eval_tap $? 39 'QueryUserExpGrantHistoryTag' test.out

#- 40 GetUserSeason
./ng net.accelbyte.sdk.cli.Main seasonpass getUserSeason \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'Iq2j6yG1' \
    --userId '9OI1W1NF' \
    > test.out 2>&1
eval_tap $? 40 'GetUserSeason' test.out

#- 41 PublicGetCurrentSeason
./ng net.accelbyte.sdk.cli.Main seasonpass publicGetCurrentSeason \
    --namespace "$AB_NAMESPACE" \
    --language 'S8OlepzA' \
    > test.out 2>&1
eval_tap $? 41 'PublicGetCurrentSeason' test.out

#- 42 PublicGetCurrentUserSeason
./ng net.accelbyte.sdk.cli.Main seasonpass publicGetCurrentUserSeason \
    --namespace "$AB_NAMESPACE" \
    --userId 'Lk4h3Wox' \
    > test.out 2>&1
eval_tap $? 42 'PublicGetCurrentUserSeason' test.out

#- 43 PublicClaimUserReward
./ng net.accelbyte.sdk.cli.Main seasonpass publicClaimUserReward \
    --namespace "$AB_NAMESPACE" \
    --userId 'q2TJPolq' \
    --body '{"passCode": "4HMm9rJL", "rewardCode": "tqgYKu8s", "tierIndex": 13}' \
    > test.out 2>&1
eval_tap $? 43 'PublicClaimUserReward' test.out

#- 44 PublicBulkClaimUserRewards
./ng net.accelbyte.sdk.cli.Main seasonpass publicBulkClaimUserRewards \
    --namespace "$AB_NAMESPACE" \
    --userId 'dbqAPNWK' \
    > test.out 2>&1
eval_tap $? 44 'PublicBulkClaimUserRewards' test.out

#- 45 PublicGetUserSeason
./ng net.accelbyte.sdk.cli.Main seasonpass publicGetUserSeason \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'A9SNt5Q1' \
    --userId 'wXmeuARC' \
    > test.out 2>&1
eval_tap $? 45 'PublicGetUserSeason' test.out


rm -f "tmp.dat"

exit $EXIT_CODE