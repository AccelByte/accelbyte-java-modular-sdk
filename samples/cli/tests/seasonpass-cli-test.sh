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
    --limit '48' \
    --offset '31' \
    --status 'PUBLISHED,RETIRED,RETIRED' \
    > test.out 2>&1
eval_tap $? 3 'QuerySeasons' test.out

#- 4 CreateSeason
./ng net.accelbyte.sdk.cli.Main seasonpass createSeason \
    --namespace "$AB_NAMESPACE" \
    --body '{"autoClaim": false, "defaultLanguage": "JNzcNfFA", "defaultRequiredExp": 50, "draftStoreId": "q8kdBJ6m", "end": "1989-05-14T00:00:00Z", "excessStrategy": {"currency": "CgubOeCS", "method": "CURRENCY", "percentPerExp": 96}, "images": [{"as": "l0acVknc", "caption": "fJnlWs9o", "height": 7, "imageUrl": "WdddpaT6", "smallImageUrl": "s7tATUGM", "width": 96}, {"as": "CPBimu8z", "caption": "276YJwjQ", "height": 49, "imageUrl": "iGDgKFGr", "smallImageUrl": "U4g2tUZV", "width": 2}, {"as": "DUTnXyEA", "caption": "ssUdc6dv", "height": 73, "imageUrl": "UkrPsPhF", "smallImageUrl": "8FaFagp7", "width": 57}], "localizations": {"iU5IqBFS": {"description": "4JwB0UAw", "title": "o9yhmR6A"}, "KW8eojQf": {"description": "f0sAPikq", "title": "AmgfWJZd"}, "vTHsG0qr": {"description": "VAyGClRh", "title": "9rZh62uM"}}, "name": "5fGX2cex", "start": "1998-10-13T00:00:00Z", "tierItemId": "RELumUHf"}' \
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
    --body '{"userIds": ["bJhjXj9G", "S3gZ4tWJ", "pUlu3d0V"]}' \
    > test.out 2>&1
eval_tap $? 6 'BulkGetUserSeasonProgression' test.out

#- 7 GetSeason
./ng net.accelbyte.sdk.cli.Main seasonpass getSeason \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'e9A8v2nm' \
    > test.out 2>&1
eval_tap $? 7 'GetSeason' test.out

#- 8 DeleteSeason
./ng net.accelbyte.sdk.cli.Main seasonpass deleteSeason \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'n2Dr2Se3' \
    > test.out 2>&1
eval_tap $? 8 'DeleteSeason' test.out

#- 9 UpdateSeason
./ng net.accelbyte.sdk.cli.Main seasonpass updateSeason \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'z7o3vwKd' \
    --body '{"autoClaim": true, "defaultLanguage": "sbZATuA0", "defaultRequiredExp": 47, "draftStoreId": "YLwmp9KU", "end": "1980-01-16T00:00:00Z", "excessStrategy": {"currency": "tNAPfQ53", "method": "NONE", "percentPerExp": 89}, "images": [{"as": "bddxELC1", "caption": "gDoKeoAx", "height": 70, "imageUrl": "zBXa8xBq", "smallImageUrl": "An2CFZAg", "width": 24}, {"as": "XsD8LT5H", "caption": "r0PHCiD6", "height": 64, "imageUrl": "hOLRZ74p", "smallImageUrl": "pqDWFPpF", "width": 11}, {"as": "hw4znSMZ", "caption": "p4tNpAgQ", "height": 44, "imageUrl": "cGJ8EiUZ", "smallImageUrl": "PrcVvTFG", "width": 100}], "localizations": {"i3J8E7kX": {"description": "tSgTGS4s", "title": "SiVnfSi9"}, "An1NTtdu": {"description": "QTaBJW0I", "title": "oHoJUbDV"}, "IjEOWLr0": {"description": "K3UpinaV", "title": "gdV3A4y1"}}, "name": "i2FDlavi", "start": "1987-09-18T00:00:00Z", "tierItemId": "3XpjTqIG"}' \
    > test.out 2>&1
eval_tap $? 9 'UpdateSeason' test.out

#- 10 CloneSeason
./ng net.accelbyte.sdk.cli.Main seasonpass cloneSeason \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'ebV6x5On' \
    --body '{"end": "1972-02-07T00:00:00Z", "name": "BoU06Mks", "start": "1976-07-04T00:00:00Z"}' \
    > test.out 2>&1
eval_tap $? 10 'CloneSeason' test.out

#- 11 GetFullSeason
./ng net.accelbyte.sdk.cli.Main seasonpass getFullSeason \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'b2rFCyHM' \
    > test.out 2>&1
eval_tap $? 11 'GetFullSeason' test.out

#- 12 QueryPasses
./ng net.accelbyte.sdk.cli.Main seasonpass queryPasses \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'PL8xfWJt' \
    > test.out 2>&1
eval_tap $? 12 'QueryPasses' test.out

#- 13 CreatePass
./ng net.accelbyte.sdk.cli.Main seasonpass createPass \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'Gfx9hue6' \
    --body '{"autoEnroll": false, "code": "HXBXxB38", "displayOrder": 78, "images": [{"as": "ZdtOWtH9", "caption": "4Ny2bZsU", "height": 7, "imageUrl": "rUfq80Ff", "smallImageUrl": "IW4F5Ano", "width": 59}, {"as": "AT4asaRt", "caption": "VnbZFaUa", "height": 27, "imageUrl": "9ZoK2PHZ", "smallImageUrl": "P5QrjvMP", "width": 90}, {"as": "qsLsLTGx", "caption": "y4XDZpLO", "height": 31, "imageUrl": "FAunJ9r7", "smallImageUrl": "7vbFFnQF", "width": 86}], "localizations": {"yrKrW0wK": {"description": "1fstHdbm", "title": "SK6T9k79"}, "fJxyUdHx": {"description": "GbfgLSVG", "title": "BClmIaVW"}, "eeaPjSYa": {"description": "XMVrOVIZ", "title": "mL8dNd8v"}}, "passItemId": "LthkFwgz"}' \
    > test.out 2>&1
eval_tap $? 13 'CreatePass' test.out

#- 14 GetPass
./ng net.accelbyte.sdk.cli.Main seasonpass getPass \
    --code 'b03428Sd' \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'M9JnZosg' \
    > test.out 2>&1
eval_tap $? 14 'GetPass' test.out

#- 15 DeletePass
./ng net.accelbyte.sdk.cli.Main seasonpass deletePass \
    --code 'PXMEsSwR' \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'aId9SxKE' \
    > test.out 2>&1
eval_tap $? 15 'DeletePass' test.out

#- 16 UpdatePass
./ng net.accelbyte.sdk.cli.Main seasonpass updatePass \
    --code 'aCeYcX3E' \
    --namespace "$AB_NAMESPACE" \
    --seasonId '7I3LubWO' \
    --body '{"autoEnroll": true, "displayOrder": 46, "images": [{"as": "k7qhk6Lu", "caption": "0eEWxkBB", "height": 0, "imageUrl": "sScyTvKw", "smallImageUrl": "2CaMzj6Z", "width": 99}, {"as": "LI3MMjd1", "caption": "zlI8aQGL", "height": 73, "imageUrl": "2qk6Mim3", "smallImageUrl": "BzHVcsKR", "width": 70}, {"as": "qQ9LI2vK", "caption": "CD85qi2w", "height": 76, "imageUrl": "KuJTQxfT", "smallImageUrl": "FrTcsbba", "width": 25}], "localizations": {"rF3g21Dx": {"description": "hZcpQbFo", "title": "7OD6ocTZ"}, "ePd1wlsR": {"description": "fgY9rRMz", "title": "d4j7hhYs"}, "TFXhxoLx": {"description": "0qbS2yKc", "title": "5HfOb6JG"}}, "passItemId": "if6ZKmll"}' \
    > test.out 2>&1
eval_tap $? 16 'UpdatePass' test.out

#- 17 PublishSeason
./ng net.accelbyte.sdk.cli.Main seasonpass publishSeason \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'nwsaKDy8' \
    > test.out 2>&1
eval_tap $? 17 'PublishSeason' test.out

#- 18 RetireSeason
./ng net.accelbyte.sdk.cli.Main seasonpass retireSeason \
    --namespace "$AB_NAMESPACE" \
    --seasonId '8D63dvSI' \
    --force  \
    > test.out 2>&1
eval_tap $? 18 'RetireSeason' test.out

#- 19 QueryRewards
./ng net.accelbyte.sdk.cli.Main seasonpass queryRewards \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'PyXndnER' \
    --q 'KQpsCZxl' \
    > test.out 2>&1
eval_tap $? 19 'QueryRewards' test.out

#- 20 CreateReward
./ng net.accelbyte.sdk.cli.Main seasonpass createReward \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'jZOz5fh5' \
    --body '{"code": "0SVwkb1j", "currency": {"currencyCode": "gYlNORwi", "namespace": "mkQuDl2f"}, "image": {"as": "fYTkrW0o", "caption": "S6npAogU", "height": 63, "imageUrl": "HSV7EPFq", "smallImageUrl": "XRzixkLM", "width": 70}, "itemId": "ykJCtVwQ", "quantity": 77, "type": "CURRENCY"}' \
    > test.out 2>&1
eval_tap $? 20 'CreateReward' test.out

#- 21 GetReward
./ng net.accelbyte.sdk.cli.Main seasonpass getReward \
    --code 'eS8wT65o' \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'x3j93w6z' \
    > test.out 2>&1
eval_tap $? 21 'GetReward' test.out

#- 22 DeleteReward
./ng net.accelbyte.sdk.cli.Main seasonpass deleteReward \
    --code 'WQlnxzMF' \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'd8j5B4XD' \
    > test.out 2>&1
eval_tap $? 22 'DeleteReward' test.out

#- 23 UpdateReward
./ng net.accelbyte.sdk.cli.Main seasonpass updateReward \
    --code '3J1NVvyL' \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'zoxYZf87' \
    --body '{"currency": {"currencyCode": "ggOoRCpl", "namespace": "uhmdS935"}, "image": {"as": "Lzf11bU4", "caption": "3LbTBQlo", "height": 0, "imageUrl": "CNftvHkD", "smallImageUrl": "rdKmvR8a", "width": 35}, "itemId": "JqzNj2EC", "nullFields": ["DafbOmbq", "wmFlrBrm", "XJQuc56m"], "quantity": 23, "type": "CURRENCY"}' \
    > test.out 2>&1
eval_tap $? 23 'UpdateReward' test.out

#- 24 QueryTiers
./ng net.accelbyte.sdk.cli.Main seasonpass queryTiers \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'RkRQ0xIE' \
    --limit '30' \
    --offset '8' \
    > test.out 2>&1
eval_tap $? 24 'QueryTiers' test.out

#- 25 CreateTier
./ng net.accelbyte.sdk.cli.Main seasonpass createTier \
    --namespace "$AB_NAMESPACE" \
    --seasonId '1rlXOVwh' \
    --body '{"index": 82, "quantity": 43, "tier": {"requiredExp": 22, "rewards": {"PUXmCKLn": ["5e0eL17j", "4ahqb3d9", "x4u5hJFO"], "23EhEAgf": ["Mhz8W9e0", "DtwSfdMQ", "3vxEbrpQ"], "DG8PJAI2": ["lGa46uPi", "KpdyBNqE", "BKEbAhxG"]}}}' \
    > test.out 2>&1
eval_tap $? 25 'CreateTier' test.out

#- 26 UpdateTier
./ng net.accelbyte.sdk.cli.Main seasonpass updateTier \
    --id '5v2xU7hU' \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'vmDaXJIv' \
    --body '{"requiredExp": 32, "rewards": {"n82pR1ua": ["YcpxGBHI", "dWZOiAeT", "fKGWWlVh"], "9v9i66zq": ["41ueqhnP", "FOXuw9cm", "uxPk0QOt"], "uJehIuAf": ["sZy0yLth", "AWdTyToW", "0kZzu4uW"]}}' \
    > test.out 2>&1
eval_tap $? 26 'UpdateTier' test.out

#- 27 DeleteTier
./ng net.accelbyte.sdk.cli.Main seasonpass deleteTier \
    --id '975HTENu' \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'PWNJ82PR' \
    > test.out 2>&1
eval_tap $? 27 'DeleteTier' test.out

#- 28 ReorderTier
./ng net.accelbyte.sdk.cli.Main seasonpass reorderTier \
    --id 'I3HKQrY9' \
    --namespace "$AB_NAMESPACE" \
    --seasonId '7EVLXbMK' \
    --body '{"newIndex": 8}' \
    > test.out 2>&1
eval_tap $? 28 'ReorderTier' test.out

#- 29 UnpublishSeason
./ng net.accelbyte.sdk.cli.Main seasonpass unpublishSeason \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'JdkWq8xn' \
    --force  \
    > test.out 2>&1
eval_tap $? 29 'UnpublishSeason' test.out

#- 30 GetUserParticipatedSeasons
./ng net.accelbyte.sdk.cli.Main seasonpass getUserParticipatedSeasons \
    --namespace "$AB_NAMESPACE" \
    --userId 'HUb2JJlz' \
    --limit '18' \
    --offset '94' \
    > test.out 2>&1
eval_tap $? 30 'GetUserParticipatedSeasons' test.out

#- 31 GrantUserExp
./ng net.accelbyte.sdk.cli.Main seasonpass grantUserExp \
    --namespace "$AB_NAMESPACE" \
    --userId 'J1lu5sJr' \
    --body '{"exp": 2, "source": "PAID_FOR", "tags": ["EEmdmFwm", "hR02s6jz", "IwzmPMxV"]}' \
    > test.out 2>&1
eval_tap $? 31 'GrantUserExp' test.out

#- 32 GrantUserPass
./ng net.accelbyte.sdk.cli.Main seasonpass grantUserPass \
    --namespace "$AB_NAMESPACE" \
    --userId 'n4P7rbrY' \
    --body '{"passCode": "BvTMbMVa", "passItemId": "SZTDjftr"}' \
    > test.out 2>&1
eval_tap $? 32 'GrantUserPass' test.out

#- 33 ExistsAnyPassByPassCodes
./ng net.accelbyte.sdk.cli.Main seasonpass existsAnyPassByPassCodes \
    --namespace "$AB_NAMESPACE" \
    --userId 'K8YSEI6d' \
    --passCodes 'lNl7jTtu,4Pt94lIp,CfT0DFBv' \
    > test.out 2>&1
eval_tap $? 33 'ExistsAnyPassByPassCodes' test.out

#- 34 GetCurrentUserSeasonProgression
./ng net.accelbyte.sdk.cli.Main seasonpass getCurrentUserSeasonProgression \
    --namespace "$AB_NAMESPACE" \
    --userId '5yvJzo4B' \
    > test.out 2>&1
eval_tap $? 34 'GetCurrentUserSeasonProgression' test.out

#- 35 CheckSeasonPurchasable
./ng net.accelbyte.sdk.cli.Main seasonpass checkSeasonPurchasable \
    --namespace "$AB_NAMESPACE" \
    --userId 'NCGUDycB' \
    --body '{"passItemId": "o3HCw0wu", "tierItemCount": 4, "tierItemId": "uupFvBhh"}' \
    > test.out 2>&1
eval_tap $? 35 'CheckSeasonPurchasable' test.out

#- 36 ResetUserSeason
./ng net.accelbyte.sdk.cli.Main seasonpass resetUserSeason \
    --namespace "$AB_NAMESPACE" \
    --userId 'wjcsb8K4' \
    > test.out 2>&1
eval_tap $? 36 'ResetUserSeason' test.out

#- 37 GrantUserTier
./ng net.accelbyte.sdk.cli.Main seasonpass grantUserTier \
    --namespace "$AB_NAMESPACE" \
    --userId '8zbGoSdQ' \
    --body '{"count": 75, "source": "SWEAT", "tags": ["jnsP7FUn", "cPPnXDEh", "bKw920hg"]}' \
    > test.out 2>&1
eval_tap $? 37 'GrantUserTier' test.out

#- 38 QueryUserExpGrantHistory
./ng net.accelbyte.sdk.cli.Main seasonpass queryUserExpGrantHistory \
    --namespace "$AB_NAMESPACE" \
    --userId 'gUNHSrYD' \
    --from '9XgAl9BJ' \
    --limit '98' \
    --offset '17' \
    --seasonId 'WZXc3cwb' \
    --source 'SWEAT' \
    --tags 'oBtSKz5B,aC0qGHDB,2WURsnXh' \
    --to 'eaJKvxFL' \
    > test.out 2>&1
eval_tap $? 38 'QueryUserExpGrantHistory' test.out

#- 39 QueryUserExpGrantHistoryTag
./ng net.accelbyte.sdk.cli.Main seasonpass queryUserExpGrantHistoryTag \
    --namespace "$AB_NAMESPACE" \
    --userId 'eUMSXXog' \
    --seasonId 'FFr7hKRF' \
    > test.out 2>&1
eval_tap $? 39 'QueryUserExpGrantHistoryTag' test.out

#- 40 GetUserSeason
./ng net.accelbyte.sdk.cli.Main seasonpass getUserSeason \
    --namespace "$AB_NAMESPACE" \
    --seasonId '1Nzqem5o' \
    --userId '9H3oIiim' \
    > test.out 2>&1
eval_tap $? 40 'GetUserSeason' test.out

#- 41 PublicGetCurrentSeason
./ng net.accelbyte.sdk.cli.Main seasonpass publicGetCurrentSeason \
    --namespace "$AB_NAMESPACE" \
    --language 'ahXH85e4' \
    > test.out 2>&1
eval_tap $? 41 'PublicGetCurrentSeason' test.out

#- 42 PublicGetCurrentUserSeason
./ng net.accelbyte.sdk.cli.Main seasonpass publicGetCurrentUserSeason \
    --namespace "$AB_NAMESPACE" \
    --userId 'MEuVb4ru' \
    > test.out 2>&1
eval_tap $? 42 'PublicGetCurrentUserSeason' test.out

#- 43 PublicClaimUserReward
./ng net.accelbyte.sdk.cli.Main seasonpass publicClaimUserReward \
    --namespace "$AB_NAMESPACE" \
    --userId 'zjPS4yQO' \
    --body '{"passCode": "aVq0pqtN", "rewardCode": "66ruxLGx", "tierIndex": 61}' \
    > test.out 2>&1
eval_tap $? 43 'PublicClaimUserReward' test.out

#- 44 PublicBulkClaimUserRewards
./ng net.accelbyte.sdk.cli.Main seasonpass publicBulkClaimUserRewards \
    --namespace "$AB_NAMESPACE" \
    --userId 'HgijH5G1' \
    > test.out 2>&1
eval_tap $? 44 'PublicBulkClaimUserRewards' test.out

#- 45 PublicGetUserSeason
./ng net.accelbyte.sdk.cli.Main seasonpass publicGetUserSeason \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'grpuuf08' \
    --userId 'l2HP64sK' \
    > test.out 2>&1
eval_tap $? 45 'PublicGetUserSeason' test.out


rm -f "tmp.dat"

exit $EXIT_CODE