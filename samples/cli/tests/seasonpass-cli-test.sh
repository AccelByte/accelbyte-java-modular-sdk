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
    --limit '23' \
    --offset '3' \
    --status 'PUBLISHED,RETIRED,RETIRED' \
    > test.out 2>&1
eval_tap $? 3 'QuerySeasons' test.out

#- 4 CreateSeason
./ng net.accelbyte.sdk.cli.Main seasonpass createSeason \
    --namespace "$AB_NAMESPACE" \
    --body '{"autoClaim": false, "defaultLanguage": "Oa1sw9gD", "defaultRequiredExp": 46, "draftStoreId": "Or9via0C", "end": "1982-08-25T00:00:00Z", "excessStrategy": {"currency": "gtt2XH0Q", "method": "NONE", "percentPerExp": 69}, "images": [{"as": "lp3NCxwY", "caption": "zm94bcWd", "height": 23, "imageUrl": "LYm05Rhf", "smallImageUrl": "kxCgwlkz", "width": 78}, {"as": "K0ktR7xQ", "caption": "tieIYwI0", "height": 18, "imageUrl": "B8IwhXmI", "smallImageUrl": "lpdUmqXH", "width": 67}, {"as": "wgF6wBF8", "caption": "zKsivlgI", "height": 35, "imageUrl": "4b5tT42c", "smallImageUrl": "7cNJImBa", "width": 45}], "localizations": {"I41zkGkG": {"description": "CCBw2EHv", "title": "BK2oTg5R"}, "WgZ0h2IP": {"description": "WgfcQ7Wv", "title": "p9sshbaB"}, "YlCIjd8y": {"description": "yVudnDsK", "title": "QRBQPwrJ"}}, "name": "QBPvDERd", "start": "1991-08-12T00:00:00Z", "tierItemId": "nPCSBLrw"}' \
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
    --body '{"userIds": ["MP9EgzmL", "0s9gJgGX", "5pAnG5TK"]}' \
    > test.out 2>&1
eval_tap $? 6 'BulkGetUserSeasonProgression' test.out

#- 7 GetItemReferences
./ng net.accelbyte.sdk.cli.Main seasonpass getItemReferences \
    --namespace "$AB_NAMESPACE" \
    --itemId 'W35lWEDp' \
    > test.out 2>&1
eval_tap $? 7 'GetItemReferences' test.out

#- 8 GetSeason
./ng net.accelbyte.sdk.cli.Main seasonpass getSeason \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'SYOZQ6Gs' \
    > test.out 2>&1
eval_tap $? 8 'GetSeason' test.out

#- 9 DeleteSeason
./ng net.accelbyte.sdk.cli.Main seasonpass deleteSeason \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'q2t1K91Y' \
    > test.out 2>&1
eval_tap $? 9 'DeleteSeason' test.out

#- 10 UpdateSeason
./ng net.accelbyte.sdk.cli.Main seasonpass updateSeason \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'cPK0sCSu' \
    --body '{"autoClaim": false, "defaultLanguage": "k0c6K0L9", "defaultRequiredExp": 50, "draftStoreId": "swZFHykF", "end": "1987-08-15T00:00:00Z", "excessStrategy": {"currency": "tNWQ7ioU", "method": "NONE", "percentPerExp": 95}, "images": [{"as": "X41PKBf4", "caption": "ckZEkLuw", "height": 13, "imageUrl": "xqk0k8on", "smallImageUrl": "BhoeTuB9", "width": 95}, {"as": "7t81TYR2", "caption": "SPghwjLs", "height": 66, "imageUrl": "XRtHgbuX", "smallImageUrl": "70ehGdPg", "width": 18}, {"as": "eoJ4uphf", "caption": "eHTLGEuN", "height": 56, "imageUrl": "uoPRwzGM", "smallImageUrl": "VUL8Lpd7", "width": 18}], "localizations": {"HRbZoKnr": {"description": "WzhvrQuZ", "title": "PMUn43vs"}, "OQx17iPD": {"description": "oG21GxoU", "title": "xcdFMDMe"}, "Cyf6xVOI": {"description": "WFg1aStO", "title": "oSeWNzCT"}}, "name": "N8MDmO6q", "start": "1978-07-27T00:00:00Z", "tierItemId": "DznZxQ0z"}' \
    > test.out 2>&1
eval_tap $? 10 'UpdateSeason' test.out

#- 11 CloneSeason
./ng net.accelbyte.sdk.cli.Main seasonpass cloneSeason \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'mZqQpGas' \
    --body '{"end": "1979-10-09T00:00:00Z", "name": "VRA7QEcZ", "start": "1988-12-05T00:00:00Z"}' \
    > test.out 2>&1
eval_tap $? 11 'CloneSeason' test.out

#- 12 GetFullSeason
./ng net.accelbyte.sdk.cli.Main seasonpass getFullSeason \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'GtxkthLr' \
    > test.out 2>&1
eval_tap $? 12 'GetFullSeason' test.out

#- 13 QueryPasses
./ng net.accelbyte.sdk.cli.Main seasonpass queryPasses \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'Azwsl9pH' \
    > test.out 2>&1
eval_tap $? 13 'QueryPasses' test.out

#- 14 CreatePass
./ng net.accelbyte.sdk.cli.Main seasonpass createPass \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'KvKnEigI' \
    --body '{"autoEnroll": true, "code": "4aq2boYX", "displayOrder": 20, "images": [{"as": "TomVN2qX", "caption": "6egBK5su", "height": 86, "imageUrl": "rlgD0SuD", "smallImageUrl": "TMa3YfBY", "width": 36}, {"as": "Y80UE08e", "caption": "5dlhy9yl", "height": 12, "imageUrl": "NA2id5q8", "smallImageUrl": "YRIt4mMH", "width": 79}, {"as": "Vtn7CT9U", "caption": "ZKPLsNr4", "height": 77, "imageUrl": "ln3vD18G", "smallImageUrl": "cP49XRqM", "width": 58}], "localizations": {"zMJLW6PO": {"description": "lbUDTXvM", "title": "sJQgs3cm"}, "6yPRGUet": {"description": "ntO0BEqo", "title": "Mv80JlX5"}, "sYSVzUlp": {"description": "c61Cervz", "title": "sfO269PJ"}}, "passItemId": "aXGWwPFZ"}' \
    > test.out 2>&1
eval_tap $? 14 'CreatePass' test.out

#- 15 GetPass
./ng net.accelbyte.sdk.cli.Main seasonpass getPass \
    --code 'atHnkMk3' \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'yNN5D6tq' \
    > test.out 2>&1
eval_tap $? 15 'GetPass' test.out

#- 16 DeletePass
./ng net.accelbyte.sdk.cli.Main seasonpass deletePass \
    --code 'vIueIb8o' \
    --namespace "$AB_NAMESPACE" \
    --seasonId '1QT4SQWj' \
    > test.out 2>&1
eval_tap $? 16 'DeletePass' test.out

#- 17 UpdatePass
./ng net.accelbyte.sdk.cli.Main seasonpass updatePass \
    --code 'C9tIbNeF' \
    --namespace "$AB_NAMESPACE" \
    --seasonId '2itmasyb' \
    --body '{"autoEnroll": false, "displayOrder": 7, "images": [{"as": "TD7AFPH6", "caption": "y72c7m0Y", "height": 90, "imageUrl": "uskHdASd", "smallImageUrl": "25Xxje4q", "width": 51}, {"as": "SU5zznLm", "caption": "t6ptK5yh", "height": 47, "imageUrl": "Hb2gOPPI", "smallImageUrl": "AQFNYRUA", "width": 31}, {"as": "3MZX9QKG", "caption": "0mgPy6Rk", "height": 99, "imageUrl": "4Jv44uki", "smallImageUrl": "3mZROAbf", "width": 80}], "localizations": {"2iGt5Dax": {"description": "F2ZMEgWj", "title": "WOiw0sdi"}, "cmvK3oJh": {"description": "mHZcGoJ4", "title": "TmrLK821"}, "LIxSREDK": {"description": "tiY0mCmC", "title": "szVVCpXL"}}, "passItemId": "vEEtUNA7"}' \
    > test.out 2>&1
eval_tap $? 17 'UpdatePass' test.out

#- 18 PublishSeason
./ng net.accelbyte.sdk.cli.Main seasonpass publishSeason \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'eKRUQwXv' \
    > test.out 2>&1
eval_tap $? 18 'PublishSeason' test.out

#- 19 RetireSeason
./ng net.accelbyte.sdk.cli.Main seasonpass retireSeason \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'UckwBlLO' \
    --force  \
    > test.out 2>&1
eval_tap $? 19 'RetireSeason' test.out

#- 20 QueryRewards
./ng net.accelbyte.sdk.cli.Main seasonpass queryRewards \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'Ue9Ey6iX' \
    --q 'kzxNm0aP' \
    > test.out 2>&1
eval_tap $? 20 'QueryRewards' test.out

#- 21 CreateReward
./ng net.accelbyte.sdk.cli.Main seasonpass createReward \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'YBS0XFTc' \
    --body '{"code": "MSdQ0zLK", "currency": {"currencyCode": "RoJOCWsN", "namespace": "boHZrtII"}, "image": {"as": "zt0f6mcZ", "caption": "i9pLGl8o", "height": 89, "imageUrl": "8852QII1", "smallImageUrl": "rNd0dYlC", "width": 35}, "itemId": "TxwnyxuQ", "quantity": 33, "type": "CURRENCY"}' \
    > test.out 2>&1
eval_tap $? 21 'CreateReward' test.out

#- 22 GetReward
./ng net.accelbyte.sdk.cli.Main seasonpass getReward \
    --code 'gi9hHQZI' \
    --namespace "$AB_NAMESPACE" \
    --seasonId '3ODpnfsJ' \
    > test.out 2>&1
eval_tap $? 22 'GetReward' test.out

#- 23 DeleteReward
./ng net.accelbyte.sdk.cli.Main seasonpass deleteReward \
    --code 'kiSNLsa0' \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'OVNc5w6G' \
    > test.out 2>&1
eval_tap $? 23 'DeleteReward' test.out

#- 24 UpdateReward
./ng net.accelbyte.sdk.cli.Main seasonpass updateReward \
    --code 'WLxPGCo0' \
    --namespace "$AB_NAMESPACE" \
    --seasonId '1Zaz4GeP' \
    --body '{"currency": {"currencyCode": "SQvmG02r", "namespace": "RbFN8i5H"}, "image": {"as": "2XiC7LMH", "caption": "8YwBieeu", "height": 22, "imageUrl": "mwG2jPn1", "smallImageUrl": "WCHieB8Y", "width": 44}, "itemId": "Yiw46THR", "nullFields": ["hwd4Mv3y", "nh9dWJqy", "uzvPEUEF"], "quantity": 38, "type": "CURRENCY"}' \
    > test.out 2>&1
eval_tap $? 24 'UpdateReward' test.out

#- 25 QueryTiers
./ng net.accelbyte.sdk.cli.Main seasonpass queryTiers \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'Z6NfVoPX' \
    --limit '31' \
    --offset '52' \
    > test.out 2>&1
eval_tap $? 25 'QueryTiers' test.out

#- 26 CreateTier
./ng net.accelbyte.sdk.cli.Main seasonpass createTier \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'K7Z6QQky' \
    --body '{"index": 79, "quantity": 30, "tier": {"requiredExp": 11, "rewards": {"09wPzcO6": ["50naFXeT", "cnp80R4G", "k3KarVYB"], "KuwHhWFK": ["WYu1sDaX", "K2kEkkAI", "HkDvJPbl"], "yjQSFUid": ["zHqiApof", "ENNjGLc2", "BHLC2kF9"]}}}' \
    > test.out 2>&1
eval_tap $? 26 'CreateTier' test.out

#- 27 UpdateTier
./ng net.accelbyte.sdk.cli.Main seasonpass updateTier \
    --id 'xwNafUqv' \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'QRiGyktf' \
    --body '{"requiredExp": 41, "rewards": {"TH2MYn4d": ["SxgGfCxg", "w8SRiT7V", "g0NqfGPP"], "SAdefN4q": ["AvMEA0pR", "KbLQP4Up", "ywJOQw4Y"], "GbIa7BY7": ["6OtfHlaw", "bRBythnK", "M9O6LSPS"]}}' \
    > test.out 2>&1
eval_tap $? 27 'UpdateTier' test.out

#- 28 DeleteTier
./ng net.accelbyte.sdk.cli.Main seasonpass deleteTier \
    --id 'ttuvSGIA' \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'lwhaQDqw' \
    > test.out 2>&1
eval_tap $? 28 'DeleteTier' test.out

#- 29 ReorderTier
./ng net.accelbyte.sdk.cli.Main seasonpass reorderTier \
    --id 'wjpl9Fbs' \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'ozWxj8or' \
    --body '{"newIndex": 96}' \
    > test.out 2>&1
eval_tap $? 29 'ReorderTier' test.out

#- 30 UnpublishSeason
./ng net.accelbyte.sdk.cli.Main seasonpass unpublishSeason \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'dKmEVxgf' \
    --force  \
    > test.out 2>&1
eval_tap $? 30 'UnpublishSeason' test.out

#- 31 GetUserParticipatedSeasons
./ng net.accelbyte.sdk.cli.Main seasonpass getUserParticipatedSeasons \
    --namespace "$AB_NAMESPACE" \
    --userId '8nt3VT1a' \
    --limit '69' \
    --offset '4' \
    > test.out 2>&1
eval_tap $? 31 'GetUserParticipatedSeasons' test.out

#- 32 GrantUserExp
./ng net.accelbyte.sdk.cli.Main seasonpass grantUserExp \
    --namespace "$AB_NAMESPACE" \
    --userId 'g0iKGsIf' \
    --body '{"exp": 30, "source": "PAID_FOR", "tags": ["nHNG7Jhg", "RmEAbdEG", "pDAl03h1"]}' \
    > test.out 2>&1
eval_tap $? 32 'GrantUserExp' test.out

#- 33 GrantUserPass
./ng net.accelbyte.sdk.cli.Main seasonpass grantUserPass \
    --namespace "$AB_NAMESPACE" \
    --userId 'ozOPSmh9' \
    --body '{"passCode": "EtQQEKsA", "passItemId": "4hHWcngQ"}' \
    > test.out 2>&1
eval_tap $? 33 'GrantUserPass' test.out

#- 34 ExistsAnyPassByPassCodes
./ng net.accelbyte.sdk.cli.Main seasonpass existsAnyPassByPassCodes \
    --namespace "$AB_NAMESPACE" \
    --userId 'stundDA6' \
    --passCodes 's7D1KEvR,JZmXwNjd,MXWCIhlo' \
    > test.out 2>&1
eval_tap $? 34 'ExistsAnyPassByPassCodes' test.out

#- 35 GetCurrentUserSeasonProgression
./ng net.accelbyte.sdk.cli.Main seasonpass getCurrentUserSeasonProgression \
    --namespace "$AB_NAMESPACE" \
    --userId '8XOEBYdw' \
    > test.out 2>&1
eval_tap $? 35 'GetCurrentUserSeasonProgression' test.out

#- 36 CheckSeasonPurchasable
./ng net.accelbyte.sdk.cli.Main seasonpass checkSeasonPurchasable \
    --namespace "$AB_NAMESPACE" \
    --userId 'kXQd5r1T' \
    --body '{"passItemId": "JjlGsNdb", "tierItemCount": 77, "tierItemId": "54kpyTy4"}' \
    > test.out 2>&1
eval_tap $? 36 'CheckSeasonPurchasable' test.out

#- 37 ResetUserSeason
./ng net.accelbyte.sdk.cli.Main seasonpass resetUserSeason \
    --namespace "$AB_NAMESPACE" \
    --userId 'UOkmeHQG' \
    > test.out 2>&1
eval_tap $? 37 'ResetUserSeason' test.out

#- 38 GrantUserTier
./ng net.accelbyte.sdk.cli.Main seasonpass grantUserTier \
    --namespace "$AB_NAMESPACE" \
    --userId 'HWfo8gk6' \
    --body '{"count": 19, "source": "SWEAT", "tags": ["nBuKX3Pp", "YjOyTiJC", "Q7VItx4h"]}' \
    > test.out 2>&1
eval_tap $? 38 'GrantUserTier' test.out

#- 39 QueryUserExpGrantHistory
./ng net.accelbyte.sdk.cli.Main seasonpass queryUserExpGrantHistory \
    --namespace "$AB_NAMESPACE" \
    --userId 'hy7n3UY5' \
    --from 'm3EwZffc' \
    --limit '52' \
    --offset '4' \
    --seasonId 'TwstnJfG' \
    --source 'PAID_FOR' \
    --tags 'zxcgVcGr,w2ttRcZF,14YB9d1D' \
    --to 'a4wWNecW' \
    > test.out 2>&1
eval_tap $? 39 'QueryUserExpGrantHistory' test.out

#- 40 QueryUserExpGrantHistoryTag
./ng net.accelbyte.sdk.cli.Main seasonpass queryUserExpGrantHistoryTag \
    --namespace "$AB_NAMESPACE" \
    --userId '7eW1S7zz' \
    --seasonId 'rkesypAv' \
    > test.out 2>&1
eval_tap $? 40 'QueryUserExpGrantHistoryTag' test.out

#- 41 GetUserSeason
./ng net.accelbyte.sdk.cli.Main seasonpass getUserSeason \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'YoGwAQUw' \
    --userId 'lef1orel' \
    > test.out 2>&1
eval_tap $? 41 'GetUserSeason' test.out

#- 42 PublicGetCurrentSeason
./ng net.accelbyte.sdk.cli.Main seasonpass publicGetCurrentSeason \
    --namespace "$AB_NAMESPACE" \
    --language '9bVcYScq' \
    > test.out 2>&1
eval_tap $? 42 'PublicGetCurrentSeason' test.out

#- 43 PublicGetCurrentUserSeason
./ng net.accelbyte.sdk.cli.Main seasonpass publicGetCurrentUserSeason \
    --namespace "$AB_NAMESPACE" \
    --userId 'm177pSCg' \
    > test.out 2>&1
eval_tap $? 43 'PublicGetCurrentUserSeason' test.out

#- 44 PublicClaimUserReward
./ng net.accelbyte.sdk.cli.Main seasonpass publicClaimUserReward \
    --namespace "$AB_NAMESPACE" \
    --userId 'E75MiPsb' \
    --body '{"passCode": "LtAFjCQy", "rewardCode": "1OSF564U", "tierIndex": 41}' \
    > test.out 2>&1
eval_tap $? 44 'PublicClaimUserReward' test.out

#- 45 PublicBulkClaimUserRewards
./ng net.accelbyte.sdk.cli.Main seasonpass publicBulkClaimUserRewards \
    --namespace "$AB_NAMESPACE" \
    --userId 'pjmkF7V3' \
    > test.out 2>&1
eval_tap $? 45 'PublicBulkClaimUserRewards' test.out

#- 46 PublicGetUserSeason
./ng net.accelbyte.sdk.cli.Main seasonpass publicGetUserSeason \
    --namespace "$AB_NAMESPACE" \
    --seasonId '6Z2cXMeC' \
    --userId 'AbIhGWFA' \
    > test.out 2>&1
eval_tap $? 46 'PublicGetUserSeason' test.out


rm -f "tmp.dat"

exit $EXIT_CODE