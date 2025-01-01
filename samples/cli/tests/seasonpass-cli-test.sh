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
    --limit '51' \
    --offset '39' \
    --status 'PUBLISHED,RETIRED,RETIRED' \
    > test.out 2>&1
eval_tap $? 3 'QuerySeasons' test.out

#- 4 CreateSeason
./ng net.accelbyte.sdk.cli.Main seasonpass createSeason \
    --namespace "$AB_NAMESPACE" \
    --body '{"autoClaim": true, "defaultLanguage": "A2Dgbqrq", "defaultRequiredExp": 52, "draftStoreId": "brv1Bjv6", "end": "1989-05-08T00:00:00Z", "excessStrategy": {"currency": "rvbvwb6Z", "method": "NONE", "percentPerExp": 0}, "images": [{"as": "pWkbAQTF", "caption": "CF8eYs7D", "height": 54, "imageUrl": "uVGvFI72", "smallImageUrl": "tOxYRVbX", "width": 56}, {"as": "UY0VvPGF", "caption": "aWwLxWqj", "height": 53, "imageUrl": "tObKXS0p", "smallImageUrl": "UwuHhT4W", "width": 63}, {"as": "FbQZ1EtP", "caption": "nVBB6fdq", "height": 91, "imageUrl": "Zu5aOJeG", "smallImageUrl": "z1G1qujQ", "width": 81}], "localizations": {"NqrssQVI": {"description": "TWbOxS5U", "title": "yzH17n5B"}, "LCCMKXlw": {"description": "5VmpIRG0", "title": "DlpmEmgI"}, "q3QEO04R": {"description": "tTzaisdZ", "title": "b0Zmr6k2"}}, "name": "7I2OLfmU", "start": "1997-10-29T00:00:00Z", "tierItemId": "MEmuPOPn"}' \
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
    --body '{"userIds": ["S3veYcWd", "Pj0y9zPD", "YR3Gz3z1"]}' \
    > test.out 2>&1
eval_tap $? 6 'BulkGetUserSeasonProgression' test.out

#- 7 GetSeason
./ng net.accelbyte.sdk.cli.Main seasonpass getSeason \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'lKTorm5X' \
    > test.out 2>&1
eval_tap $? 7 'GetSeason' test.out

#- 8 DeleteSeason
./ng net.accelbyte.sdk.cli.Main seasonpass deleteSeason \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'GRrAXXsy' \
    > test.out 2>&1
eval_tap $? 8 'DeleteSeason' test.out

#- 9 UpdateSeason
./ng net.accelbyte.sdk.cli.Main seasonpass updateSeason \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'Y0vmgMbc' \
    --body '{"autoClaim": true, "defaultLanguage": "VzBrXDbe", "defaultRequiredExp": 72, "draftStoreId": "p7gD7FtO", "end": "1996-08-26T00:00:00Z", "excessStrategy": {"currency": "qu02erQc", "method": "CURRENCY", "percentPerExp": 4}, "images": [{"as": "VhVex50E", "caption": "rRGkp5d4", "height": 81, "imageUrl": "QmM4SDfM", "smallImageUrl": "K7ge0Pe3", "width": 95}, {"as": "rZgx8lDo", "caption": "79nQLQzN", "height": 58, "imageUrl": "RNVLv2v6", "smallImageUrl": "ShJgUxM1", "width": 84}, {"as": "VmCdSAZD", "caption": "woBUU683", "height": 43, "imageUrl": "K7cuA4a5", "smallImageUrl": "L0uroDNH", "width": 56}], "localizations": {"IrJyBABA": {"description": "qWpcrWH7", "title": "JmoHaO22"}, "XrKoLQYz": {"description": "m3nNdD9Q", "title": "dPEQoKPF"}, "sKkkgYZL": {"description": "qKTNyhXf", "title": "88kiQsY1"}}, "name": "QlV3I2KX", "start": "1992-10-04T00:00:00Z", "tierItemId": "KvCPkAzM"}' \
    > test.out 2>&1
eval_tap $? 9 'UpdateSeason' test.out

#- 10 CloneSeason
./ng net.accelbyte.sdk.cli.Main seasonpass cloneSeason \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'BtWyLC10' \
    --body '{"end": "1987-11-20T00:00:00Z", "name": "DBIMj3uX", "start": "1980-12-26T00:00:00Z"}' \
    > test.out 2>&1
eval_tap $? 10 'CloneSeason' test.out

#- 11 GetFullSeason
./ng net.accelbyte.sdk.cli.Main seasonpass getFullSeason \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'q5OE0Qlw' \
    > test.out 2>&1
eval_tap $? 11 'GetFullSeason' test.out

#- 12 QueryPasses
./ng net.accelbyte.sdk.cli.Main seasonpass queryPasses \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'tTOrCGyy' \
    > test.out 2>&1
eval_tap $? 12 'QueryPasses' test.out

#- 13 CreatePass
./ng net.accelbyte.sdk.cli.Main seasonpass createPass \
    --namespace "$AB_NAMESPACE" \
    --seasonId '06W5hleR' \
    --body '{"autoEnroll": true, "code": "1LETtMO9", "displayOrder": 87, "images": [{"as": "nst9L2Jx", "caption": "FU7VCn4y", "height": 54, "imageUrl": "Pekal1KT", "smallImageUrl": "Bkqaph3q", "width": 73}, {"as": "rDmRKdJ8", "caption": "xMO0Ybhk", "height": 30, "imageUrl": "Hd08Boxe", "smallImageUrl": "gHFIYObO", "width": 19}, {"as": "o5SoCtQz", "caption": "91UJybwA", "height": 30, "imageUrl": "fCeEXfUx", "smallImageUrl": "Ot8cx1w0", "width": 94}], "localizations": {"DFe8EudH": {"description": "OuWhItdW", "title": "n1Uwv1yF"}, "xs6G2Rwb": {"description": "SYCbSakM", "title": "EK1OMPQq"}, "bT4BHGzx": {"description": "czK63sjv", "title": "1VDs5Hpy"}}, "passItemId": "b8UUUUFl"}' \
    > test.out 2>&1
eval_tap $? 13 'CreatePass' test.out

#- 14 GetPass
./ng net.accelbyte.sdk.cli.Main seasonpass getPass \
    --code 'JM8QPQwT' \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'G5G0KuaH' \
    > test.out 2>&1
eval_tap $? 14 'GetPass' test.out

#- 15 DeletePass
./ng net.accelbyte.sdk.cli.Main seasonpass deletePass \
    --code 'iiruX5zQ' \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'lNEcO8BB' \
    > test.out 2>&1
eval_tap $? 15 'DeletePass' test.out

#- 16 UpdatePass
./ng net.accelbyte.sdk.cli.Main seasonpass updatePass \
    --code '1UapdsCN' \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'dHvakhQw' \
    --body '{"autoEnroll": true, "displayOrder": 59, "images": [{"as": "77MBPadl", "caption": "cEzNi4iZ", "height": 60, "imageUrl": "Qob9Rj0d", "smallImageUrl": "nQFCsPhf", "width": 87}, {"as": "rtlyfjN9", "caption": "ag1O3rHC", "height": 51, "imageUrl": "8IDm8ip2", "smallImageUrl": "TFG8W6Cu", "width": 78}, {"as": "Plrghv7y", "caption": "6TUWrwp9", "height": 21, "imageUrl": "JIFr0zl4", "smallImageUrl": "uHOwy63p", "width": 81}], "localizations": {"TiXyFz0Y": {"description": "SYG3NKj7", "title": "I5boW9mN"}, "PVbvORCR": {"description": "fQllLmmH", "title": "ITxudKtB"}, "VNORLyIH": {"description": "02cdLU77", "title": "hRWCphF3"}}, "passItemId": "LXjOgQdo"}' \
    > test.out 2>&1
eval_tap $? 16 'UpdatePass' test.out

#- 17 PublishSeason
./ng net.accelbyte.sdk.cli.Main seasonpass publishSeason \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'mwPf4KmN' \
    > test.out 2>&1
eval_tap $? 17 'PublishSeason' test.out

#- 18 RetireSeason
./ng net.accelbyte.sdk.cli.Main seasonpass retireSeason \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'MlA4GGXZ' \
    --force  \
    > test.out 2>&1
eval_tap $? 18 'RetireSeason' test.out

#- 19 QueryRewards
./ng net.accelbyte.sdk.cli.Main seasonpass queryRewards \
    --namespace "$AB_NAMESPACE" \
    --seasonId '8bX7VLJo' \
    --q 'jzFoamhB' \
    > test.out 2>&1
eval_tap $? 19 'QueryRewards' test.out

#- 20 CreateReward
./ng net.accelbyte.sdk.cli.Main seasonpass createReward \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'a1hlpFT4' \
    --body '{"code": "fVPD24mi", "currency": {"currencyCode": "su2kaIED", "namespace": "doNTSTfg"}, "image": {"as": "Zm6dU0tT", "caption": "Kx7uUkP5", "height": 24, "imageUrl": "aKZXMi4T", "smallImageUrl": "o1ZGSqqo", "width": 74}, "itemId": "PVXZnbka", "quantity": 87, "type": "CURRENCY"}' \
    > test.out 2>&1
eval_tap $? 20 'CreateReward' test.out

#- 21 GetReward
./ng net.accelbyte.sdk.cli.Main seasonpass getReward \
    --code 'vEuQYADe' \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'kv3KfH3i' \
    > test.out 2>&1
eval_tap $? 21 'GetReward' test.out

#- 22 DeleteReward
./ng net.accelbyte.sdk.cli.Main seasonpass deleteReward \
    --code 'vQM1zx8r' \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'Yw0OAg95' \
    > test.out 2>&1
eval_tap $? 22 'DeleteReward' test.out

#- 23 UpdateReward
./ng net.accelbyte.sdk.cli.Main seasonpass updateReward \
    --code 'ZjHwyDmE' \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'EjUOHMhB' \
    --body '{"currency": {"currencyCode": "mChPzeZ4", "namespace": "3yVuWtmL"}, "image": {"as": "cgvPtKQ1", "caption": "ccPIfQAv", "height": 43, "imageUrl": "iDzemt5w", "smallImageUrl": "YWOMPTOl", "width": 65}, "itemId": "RyPg75F2", "nullFields": ["4BlZAMOo", "gQ1naIHx", "M457fma8"], "quantity": 33, "type": "CURRENCY"}' \
    > test.out 2>&1
eval_tap $? 23 'UpdateReward' test.out

#- 24 QueryTiers
./ng net.accelbyte.sdk.cli.Main seasonpass queryTiers \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'ZuHiDjhI' \
    --limit '4' \
    --offset '14' \
    > test.out 2>&1
eval_tap $? 24 'QueryTiers' test.out

#- 25 CreateTier
./ng net.accelbyte.sdk.cli.Main seasonpass createTier \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'hSpmpGRX' \
    --body '{"index": 82, "quantity": 44, "tier": {"requiredExp": 19, "rewards": {"cEodMApY": ["MxoUMf45", "8B8Dp3Pu", "rv00z2Rv"], "f26zpR6u": ["Rf5nSq6Z", "2eov08ia", "ObtDVNBR"], "r8bklwDk": ["qyq7zaHa", "rfuA14PK", "P2OQGFlW"]}}}' \
    > test.out 2>&1
eval_tap $? 25 'CreateTier' test.out

#- 26 UpdateTier
./ng net.accelbyte.sdk.cli.Main seasonpass updateTier \
    --id 'UJ5Eg04i' \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'TUrbAsuP' \
    --body '{"requiredExp": 15, "rewards": {"uvUqjot7": ["21E1d9Pp", "skWGlkGQ", "sPeZzNc2"], "7FXSjvQ0": ["Z8KPvNkC", "u4ymPIgV", "NYvELmAy"], "tlA3LCrL": ["EAHuUZn1", "M57gT7AI", "k9lKvKsV"]}}' \
    > test.out 2>&1
eval_tap $? 26 'UpdateTier' test.out

#- 27 DeleteTier
./ng net.accelbyte.sdk.cli.Main seasonpass deleteTier \
    --id 'zxHCMstj' \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'GUJK6n5l' \
    > test.out 2>&1
eval_tap $? 27 'DeleteTier' test.out

#- 28 ReorderTier
./ng net.accelbyte.sdk.cli.Main seasonpass reorderTier \
    --id 'QyFxWB9C' \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'qb6raYTR' \
    --body '{"newIndex": 27}' \
    > test.out 2>&1
eval_tap $? 28 'ReorderTier' test.out

#- 29 UnpublishSeason
./ng net.accelbyte.sdk.cli.Main seasonpass unpublishSeason \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'aY0GQfj7' \
    --force  \
    > test.out 2>&1
eval_tap $? 29 'UnpublishSeason' test.out

#- 30 GetUserParticipatedSeasons
./ng net.accelbyte.sdk.cli.Main seasonpass getUserParticipatedSeasons \
    --namespace "$AB_NAMESPACE" \
    --userId 'EEPMY3Fc' \
    --limit '90' \
    --offset '65' \
    > test.out 2>&1
eval_tap $? 30 'GetUserParticipatedSeasons' test.out

#- 31 GrantUserExp
./ng net.accelbyte.sdk.cli.Main seasonpass grantUserExp \
    --namespace "$AB_NAMESPACE" \
    --userId 'ZHQWFwlp' \
    --body '{"exp": 73, "source": "SWEAT", "tags": ["RW2ZGLgG", "Ef6OLcrt", "IzLTcaqa"]}' \
    > test.out 2>&1
eval_tap $? 31 'GrantUserExp' test.out

#- 32 GrantUserPass
./ng net.accelbyte.sdk.cli.Main seasonpass grantUserPass \
    --namespace "$AB_NAMESPACE" \
    --userId 'bCpBwSch' \
    --body '{"passCode": "GsnmYYqD", "passItemId": "K8STVImx"}' \
    > test.out 2>&1
eval_tap $? 32 'GrantUserPass' test.out

#- 33 ExistsAnyPassByPassCodes
./ng net.accelbyte.sdk.cli.Main seasonpass existsAnyPassByPassCodes \
    --namespace "$AB_NAMESPACE" \
    --userId '3pLdAxI7' \
    --passCodes '9F8bViMP,ojVYI691,s3NU1cPm' \
    > test.out 2>&1
eval_tap $? 33 'ExistsAnyPassByPassCodes' test.out

#- 34 GetCurrentUserSeasonProgression
./ng net.accelbyte.sdk.cli.Main seasonpass getCurrentUserSeasonProgression \
    --namespace "$AB_NAMESPACE" \
    --userId 'rroyVKLZ' \
    > test.out 2>&1
eval_tap $? 34 'GetCurrentUserSeasonProgression' test.out

#- 35 CheckSeasonPurchasable
./ng net.accelbyte.sdk.cli.Main seasonpass checkSeasonPurchasable \
    --namespace "$AB_NAMESPACE" \
    --userId 'RKp4yBDU' \
    --body '{"passItemId": "zgJpZ1qc", "tierItemCount": 91, "tierItemId": "a4XYQq1A"}' \
    > test.out 2>&1
eval_tap $? 35 'CheckSeasonPurchasable' test.out

#- 36 ResetUserSeason
./ng net.accelbyte.sdk.cli.Main seasonpass resetUserSeason \
    --namespace "$AB_NAMESPACE" \
    --userId 'JVkotov4' \
    > test.out 2>&1
eval_tap $? 36 'ResetUserSeason' test.out

#- 37 GrantUserTier
./ng net.accelbyte.sdk.cli.Main seasonpass grantUserTier \
    --namespace "$AB_NAMESPACE" \
    --userId 'iKwEryLz' \
    --body '{"count": 5, "source": "PAID_FOR", "tags": ["clLl3eNx", "dn4i6Gx4", "muyne6Je"]}' \
    > test.out 2>&1
eval_tap $? 37 'GrantUserTier' test.out

#- 38 QueryUserExpGrantHistory
./ng net.accelbyte.sdk.cli.Main seasonpass queryUserExpGrantHistory \
    --namespace "$AB_NAMESPACE" \
    --userId 'rNeIM1JK' \
    --from 'kN8MRjM9' \
    --limit '6' \
    --offset '53' \
    --seasonId '0rk4RZet' \
    --source 'PAID_FOR' \
    --tags 'FG5ROIg5,fCO3ClKV,0nW47bDk' \
    --to 'rRmv865b' \
    > test.out 2>&1
eval_tap $? 38 'QueryUserExpGrantHistory' test.out

#- 39 QueryUserExpGrantHistoryTag
./ng net.accelbyte.sdk.cli.Main seasonpass queryUserExpGrantHistoryTag \
    --namespace "$AB_NAMESPACE" \
    --userId 'hX9wn0OW' \
    --seasonId 'uv9IPzP2' \
    > test.out 2>&1
eval_tap $? 39 'QueryUserExpGrantHistoryTag' test.out

#- 40 GetUserSeason
./ng net.accelbyte.sdk.cli.Main seasonpass getUserSeason \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'cc7aOBAT' \
    --userId 'yuzTZ4qA' \
    > test.out 2>&1
eval_tap $? 40 'GetUserSeason' test.out

#- 41 PublicGetCurrentSeason
./ng net.accelbyte.sdk.cli.Main seasonpass publicGetCurrentSeason \
    --namespace "$AB_NAMESPACE" \
    --language 'O2hIp69r' \
    > test.out 2>&1
eval_tap $? 41 'PublicGetCurrentSeason' test.out

#- 42 PublicGetCurrentUserSeason
./ng net.accelbyte.sdk.cli.Main seasonpass publicGetCurrentUserSeason \
    --namespace "$AB_NAMESPACE" \
    --userId 'FoQ1YoGO' \
    > test.out 2>&1
eval_tap $? 42 'PublicGetCurrentUserSeason' test.out

#- 43 PublicClaimUserReward
./ng net.accelbyte.sdk.cli.Main seasonpass publicClaimUserReward \
    --namespace "$AB_NAMESPACE" \
    --userId 'NP9jQlbo' \
    --body '{"passCode": "gHEjhUqV", "rewardCode": "QYhbiHIk", "tierIndex": 37}' \
    > test.out 2>&1
eval_tap $? 43 'PublicClaimUserReward' test.out

#- 44 PublicBulkClaimUserRewards
./ng net.accelbyte.sdk.cli.Main seasonpass publicBulkClaimUserRewards \
    --namespace "$AB_NAMESPACE" \
    --userId '9UXD9L4U' \
    > test.out 2>&1
eval_tap $? 44 'PublicBulkClaimUserRewards' test.out

#- 45 PublicGetUserSeason
./ng net.accelbyte.sdk.cli.Main seasonpass publicGetUserSeason \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'KlbxTjGb' \
    --userId 'GESGnNFq' \
    > test.out 2>&1
eval_tap $? 45 'PublicGetUserSeason' test.out


rm -f "tmp.dat"

exit $EXIT_CODE