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
    --limit '57' \
    --offset '6' \
    --status 'PUBLISHED,DRAFT,RETIRED' \
    > test.out 2>&1
eval_tap $? 3 'QuerySeasons' test.out

#- 4 CreateSeason
./ng net.accelbyte.sdk.cli.Main seasonpass createSeason \
    --namespace "$AB_NAMESPACE" \
    --body '{"autoClaim": true, "defaultLanguage": "XBo8LjOZ", "defaultRequiredExp": 17, "draftStoreId": "IDHLWmiH", "end": "1986-05-30T00:00:00Z", "excessStrategy": {"currency": "QP0Xw3BX", "method": "CURRENCY", "percentPerExp": 60}, "images": [{"as": "Nwh3wpnx", "caption": "bOAKK95x", "height": 83, "imageUrl": "GGY7ukC0", "smallImageUrl": "AWx6yJLd", "width": 89}, {"as": "vXg20iPh", "caption": "GYXSf3DJ", "height": 67, "imageUrl": "wDkxL3vS", "smallImageUrl": "pstfAtNd", "width": 11}, {"as": "PMLKm4aE", "caption": "ivRWehAa", "height": 24, "imageUrl": "xZXpdpHN", "smallImageUrl": "oiuMpKOY", "width": 18}], "localizations": {"qZgrAzAB": {"description": "IDAXbpsz", "title": "T11l7pnU"}, "gBksSD1E": {"description": "AKELrDct", "title": "AcqNCDTc"}, "OeByGkUc": {"description": "G98OaINW", "title": "ABRr7h6w"}}, "name": "QVRO7OIO", "start": "1976-10-21T00:00:00Z", "tierItemId": "n6cX43MG"}' \
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
    --body '{"userIds": ["VnYpSAS3", "lBOOJrSj", "WPhjY2cT"]}' \
    > test.out 2>&1
eval_tap $? 6 'BulkGetUserSeasonProgression' test.out

#- 7 GetItemReferences
./ng net.accelbyte.sdk.cli.Main seasonpass getItemReferences \
    --namespace "$AB_NAMESPACE" \
    --itemId '3GURgCLL' \
    > test.out 2>&1
eval_tap $? 7 'GetItemReferences' test.out

#- 8 GetSeason
./ng net.accelbyte.sdk.cli.Main seasonpass getSeason \
    --namespace "$AB_NAMESPACE" \
    --seasonId '9jD0MtRz' \
    > test.out 2>&1
eval_tap $? 8 'GetSeason' test.out

#- 9 DeleteSeason
./ng net.accelbyte.sdk.cli.Main seasonpass deleteSeason \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'pYYM2DPT' \
    > test.out 2>&1
eval_tap $? 9 'DeleteSeason' test.out

#- 10 UpdateSeason
./ng net.accelbyte.sdk.cli.Main seasonpass updateSeason \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'KXEDP2jk' \
    --body '{"autoClaim": true, "defaultLanguage": "FXmqfuoy", "defaultRequiredExp": 50, "draftStoreId": "wGtYgWqU", "end": "1998-11-30T00:00:00Z", "excessStrategy": {"currency": "7vdf530J", "method": "CURRENCY", "percentPerExp": 69}, "images": [{"as": "Z4o8Or5B", "caption": "S2hKXq8m", "height": 40, "imageUrl": "5SzjzzrK", "smallImageUrl": "1qaw8vtt", "width": 13}, {"as": "66kFnkIu", "caption": "DL2av7WS", "height": 81, "imageUrl": "ICKJDBr7", "smallImageUrl": "whnxbGV9", "width": 1}, {"as": "skdXYiqw", "caption": "uCdlABqe", "height": 71, "imageUrl": "5QHF2FNJ", "smallImageUrl": "wmM5BpMp", "width": 40}], "localizations": {"LQdfLAbH": {"description": "TVKp7qEj", "title": "RJTaPvAW"}, "xSknUZsr": {"description": "vNDqbfAo", "title": "hlalem3a"}, "NWQZiB88": {"description": "sxOYrj1N", "title": "ZABZ9Vux"}}, "name": "a6NYS99d", "start": "1998-02-26T00:00:00Z", "tierItemId": "FSv048DB"}' \
    > test.out 2>&1
eval_tap $? 10 'UpdateSeason' test.out

#- 11 CloneSeason
./ng net.accelbyte.sdk.cli.Main seasonpass cloneSeason \
    --namespace "$AB_NAMESPACE" \
    --seasonId '49DPkd9d' \
    --body '{"end": "1996-08-10T00:00:00Z", "name": "WMVusshJ", "start": "1974-03-06T00:00:00Z"}' \
    > test.out 2>&1
eval_tap $? 11 'CloneSeason' test.out

#- 12 GetFullSeason
./ng net.accelbyte.sdk.cli.Main seasonpass getFullSeason \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'lH6bkXvw' \
    > test.out 2>&1
eval_tap $? 12 'GetFullSeason' test.out

#- 13 QueryPasses
./ng net.accelbyte.sdk.cli.Main seasonpass queryPasses \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'rGI0G90G' \
    > test.out 2>&1
eval_tap $? 13 'QueryPasses' test.out

#- 14 CreatePass
./ng net.accelbyte.sdk.cli.Main seasonpass createPass \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'Jc1yK2bN' \
    --body '{"autoEnroll": true, "code": "gw7b2Bf7", "displayOrder": 94, "images": [{"as": "Rj5XyA6d", "caption": "9svUoQmF", "height": 22, "imageUrl": "THR5ajDD", "smallImageUrl": "tmiSEMlr", "width": 98}, {"as": "PB2uLI4M", "caption": "VZwvht9H", "height": 88, "imageUrl": "gGXEgGol", "smallImageUrl": "98gbCU0O", "width": 33}, {"as": "jg9j0Wxj", "caption": "pK8xUoCi", "height": 35, "imageUrl": "78wtqB7O", "smallImageUrl": "lqztR02d", "width": 37}], "localizations": {"EzBkYxA3": {"description": "EjsVGoY0", "title": "nELS4eCl"}, "z6QWyiUU": {"description": "eMPNJ5NJ", "title": "zrusJTgp"}, "yCiqlB8b": {"description": "N83KNYzl", "title": "imt0c0Jv"}}, "passItemId": "5K8Nge8I"}' \
    > test.out 2>&1
eval_tap $? 14 'CreatePass' test.out

#- 15 GetPass
./ng net.accelbyte.sdk.cli.Main seasonpass getPass \
    --code 'sgBbFN4c' \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'a0o4QzBs' \
    > test.out 2>&1
eval_tap $? 15 'GetPass' test.out

#- 16 DeletePass
./ng net.accelbyte.sdk.cli.Main seasonpass deletePass \
    --code 'xziAjn5d' \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'bYyT1r02' \
    > test.out 2>&1
eval_tap $? 16 'DeletePass' test.out

#- 17 UpdatePass
./ng net.accelbyte.sdk.cli.Main seasonpass updatePass \
    --code 'mZkFQrOp' \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'ob99MhhW' \
    --body '{"autoEnroll": false, "displayOrder": 34, "images": [{"as": "gFYzOyI1", "caption": "HJBHaaiq", "height": 93, "imageUrl": "VYCZKEuS", "smallImageUrl": "RAdG1uZo", "width": 24}, {"as": "Gy7aeEKs", "caption": "Z44qf5PY", "height": 1, "imageUrl": "JT6TWuxT", "smallImageUrl": "AGagJ7vE", "width": 13}, {"as": "xMT2iicP", "caption": "AJ77MMN4", "height": 84, "imageUrl": "K9dgkWQU", "smallImageUrl": "2oS9Fg6B", "width": 57}], "localizations": {"A6JX3siX": {"description": "u6re2hI1", "title": "DxXSXFBg"}, "Av6PlUVg": {"description": "Cil7xBqr", "title": "5u1Qh1t6"}, "HiKnXqcY": {"description": "KFho58R9", "title": "8zQG9UfZ"}}, "passItemId": "4QD6A3bM"}' \
    > test.out 2>&1
eval_tap $? 17 'UpdatePass' test.out

#- 18 PublishSeason
./ng net.accelbyte.sdk.cli.Main seasonpass publishSeason \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'lOPsVivx' \
    > test.out 2>&1
eval_tap $? 18 'PublishSeason' test.out

#- 19 RetireSeason
./ng net.accelbyte.sdk.cli.Main seasonpass retireSeason \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'lavFQFMz' \
    --force  \
    > test.out 2>&1
eval_tap $? 19 'RetireSeason' test.out

#- 20 QueryRewards
./ng net.accelbyte.sdk.cli.Main seasonpass queryRewards \
    --namespace "$AB_NAMESPACE" \
    --seasonId '4AKXFl2X' \
    --q '0Nn8oPqO' \
    > test.out 2>&1
eval_tap $? 20 'QueryRewards' test.out

#- 21 CreateReward
./ng net.accelbyte.sdk.cli.Main seasonpass createReward \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'agnmCWYC' \
    --body '{"code": "cXmkbpnG", "currency": {"currencyCode": "zXA47NFQ", "namespace": "sMnDEubZ"}, "image": {"as": "lENgeDd4", "caption": "pF1aIZ9M", "height": 68, "imageUrl": "fO9WkYLQ", "smallImageUrl": "iLUhLFO8", "width": 20}, "itemId": "7xkMwUa8", "quantity": 14, "type": "CURRENCY"}' \
    > test.out 2>&1
eval_tap $? 21 'CreateReward' test.out

#- 22 GetReward
./ng net.accelbyte.sdk.cli.Main seasonpass getReward \
    --code 'g6lMt49G' \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'WYPLCVZ4' \
    > test.out 2>&1
eval_tap $? 22 'GetReward' test.out

#- 23 DeleteReward
./ng net.accelbyte.sdk.cli.Main seasonpass deleteReward \
    --code 'kEm0XTcE' \
    --namespace "$AB_NAMESPACE" \
    --seasonId '2LALsWNh' \
    > test.out 2>&1
eval_tap $? 23 'DeleteReward' test.out

#- 24 UpdateReward
./ng net.accelbyte.sdk.cli.Main seasonpass updateReward \
    --code 'icWgueoG' \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'avAyoAIx' \
    --body '{"currency": {"currencyCode": "McnNLdFm", "namespace": "avIyA9oC"}, "image": {"as": "ltwLNwIK", "caption": "MXrS5jwu", "height": 84, "imageUrl": "0ry6TgJD", "smallImageUrl": "dpmGcQgf", "width": 4}, "itemId": "19GJcNdM", "nullFields": ["8EHfSDcr", "mEoxsN3S", "tJxloemx"], "quantity": 10, "type": "CURRENCY"}' \
    > test.out 2>&1
eval_tap $? 24 'UpdateReward' test.out

#- 25 QueryTiers
./ng net.accelbyte.sdk.cli.Main seasonpass queryTiers \
    --namespace "$AB_NAMESPACE" \
    --seasonId '7MQtTcjW' \
    --limit '26' \
    --offset '35' \
    > test.out 2>&1
eval_tap $? 25 'QueryTiers' test.out

#- 26 CreateTier
./ng net.accelbyte.sdk.cli.Main seasonpass createTier \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'FGC3QfEI' \
    --body '{"index": 47, "quantity": 70, "tier": {"requiredExp": 30, "rewards": {"MUGF90xj": ["Gt8FwnEt", "6tNLFny1", "WXnwa1Bc"], "mnwSAyC4": ["hyjSrhyY", "zBUVXJhm", "mngiO8ir"], "iJXDcNTj": ["s7BiUxOs", "bqaG7dNS", "s8H8FobY"]}}}' \
    > test.out 2>&1
eval_tap $? 26 'CreateTier' test.out

#- 27 UpdateTier
./ng net.accelbyte.sdk.cli.Main seasonpass updateTier \
    --id '5OLUKPns' \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'sCLBsVCj' \
    --body '{"requiredExp": 10, "rewards": {"PXUen2rW": ["V0VVtNUQ", "F7SbPpV5", "vpBDP2F5"], "yabtwSUB": ["4ZaRqonb", "NqZYKTIn", "DIV4bUB5"], "nzdTOWLm": ["fMTvu2CN", "ckF4U8F7", "kmiffV4Z"]}}' \
    > test.out 2>&1
eval_tap $? 27 'UpdateTier' test.out

#- 28 DeleteTier
./ng net.accelbyte.sdk.cli.Main seasonpass deleteTier \
    --id 'f7gX2Njw' \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'SuMz1lDB' \
    > test.out 2>&1
eval_tap $? 28 'DeleteTier' test.out

#- 29 ReorderTier
./ng net.accelbyte.sdk.cli.Main seasonpass reorderTier \
    --id 'wbR2Dsfu' \
    --namespace "$AB_NAMESPACE" \
    --seasonId '1E6mSvvG' \
    --body '{"newIndex": 33}' \
    > test.out 2>&1
eval_tap $? 29 'ReorderTier' test.out

#- 30 UnpublishSeason
./ng net.accelbyte.sdk.cli.Main seasonpass unpublishSeason \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'i4ONqQIH' \
    --force  \
    > test.out 2>&1
eval_tap $? 30 'UnpublishSeason' test.out

#- 31 GetUserParticipatedSeasons
./ng net.accelbyte.sdk.cli.Main seasonpass getUserParticipatedSeasons \
    --namespace "$AB_NAMESPACE" \
    --userId 'uH7TpUxr' \
    --limit '5' \
    --offset '75' \
    > test.out 2>&1
eval_tap $? 31 'GetUserParticipatedSeasons' test.out

#- 32 GrantUserExp
./ng net.accelbyte.sdk.cli.Main seasonpass grantUserExp \
    --namespace "$AB_NAMESPACE" \
    --userId 'G9s4KPGx' \
    --body '{"exp": 7, "source": "SWEAT", "tags": ["dBTi5Q6y", "l3XavmoO", "OQousxly"]}' \
    > test.out 2>&1
eval_tap $? 32 'GrantUserExp' test.out

#- 33 GrantUserPass
./ng net.accelbyte.sdk.cli.Main seasonpass grantUserPass \
    --namespace "$AB_NAMESPACE" \
    --userId 'Yjzz61D1' \
    --body '{"passCode": "t1u9Y0PT", "passItemId": "y6AweOsO"}' \
    > test.out 2>&1
eval_tap $? 33 'GrantUserPass' test.out

#- 34 ExistsAnyPassByPassCodes
./ng net.accelbyte.sdk.cli.Main seasonpass existsAnyPassByPassCodes \
    --namespace "$AB_NAMESPACE" \
    --userId 'WJb8cByi' \
    --passCodes '5ctr7rKL,sPnJW6co,hDwwOqRd' \
    > test.out 2>&1
eval_tap $? 34 'ExistsAnyPassByPassCodes' test.out

#- 35 GetCurrentUserSeasonProgression
./ng net.accelbyte.sdk.cli.Main seasonpass getCurrentUserSeasonProgression \
    --namespace "$AB_NAMESPACE" \
    --userId 'ptwx88ID' \
    > test.out 2>&1
eval_tap $? 35 'GetCurrentUserSeasonProgression' test.out

#- 36 CheckSeasonPurchasable
./ng net.accelbyte.sdk.cli.Main seasonpass checkSeasonPurchasable \
    --namespace "$AB_NAMESPACE" \
    --userId 'eR89LM2f' \
    --body '{"passItemId": "etSSxQWJ", "tierItemCount": 89, "tierItemId": "aXmUCWAX"}' \
    > test.out 2>&1
eval_tap $? 36 'CheckSeasonPurchasable' test.out

#- 37 ResetUserSeason
./ng net.accelbyte.sdk.cli.Main seasonpass resetUserSeason \
    --namespace "$AB_NAMESPACE" \
    --userId 'kFeeYwQr' \
    > test.out 2>&1
eval_tap $? 37 'ResetUserSeason' test.out

#- 38 GrantUserTier
./ng net.accelbyte.sdk.cli.Main seasonpass grantUserTier \
    --namespace "$AB_NAMESPACE" \
    --userId 'WGTEI7dq' \
    --body '{"count": 46, "source": "PAID_FOR", "tags": ["Kaq9etdN", "bju0BtQ1", "qYoAnJWh"]}' \
    > test.out 2>&1
eval_tap $? 38 'GrantUserTier' test.out

#- 39 QueryUserExpGrantHistory
./ng net.accelbyte.sdk.cli.Main seasonpass queryUserExpGrantHistory \
    --namespace "$AB_NAMESPACE" \
    --userId '23zDN89p' \
    --from 'Zu3DdVIb' \
    --limit '93' \
    --offset '20' \
    --seasonId 'wl25MvKd' \
    --source 'SWEAT' \
    --tags 'kYqXGEVG,ikQRXDJa,62UwAxnQ' \
    --to 'Fnp5y6RW' \
    > test.out 2>&1
eval_tap $? 39 'QueryUserExpGrantHistory' test.out

#- 40 QueryUserExpGrantHistoryTag
./ng net.accelbyte.sdk.cli.Main seasonpass queryUserExpGrantHistoryTag \
    --namespace "$AB_NAMESPACE" \
    --userId 'Wgarj4nk' \
    --seasonId 'l65twIEv' \
    > test.out 2>&1
eval_tap $? 40 'QueryUserExpGrantHistoryTag' test.out

#- 41 GetUserSeason
./ng net.accelbyte.sdk.cli.Main seasonpass getUserSeason \
    --namespace "$AB_NAMESPACE" \
    --seasonId '6109bf9E' \
    --userId 'JssdaXlx' \
    > test.out 2>&1
eval_tap $? 41 'GetUserSeason' test.out

#- 42 PublicGetCurrentSeason
./ng net.accelbyte.sdk.cli.Main seasonpass publicGetCurrentSeason \
    --namespace "$AB_NAMESPACE" \
    --language 'D5uX1oav' \
    > test.out 2>&1
eval_tap $? 42 'PublicGetCurrentSeason' test.out

#- 43 PublicGetCurrentUserSeason
./ng net.accelbyte.sdk.cli.Main seasonpass publicGetCurrentUserSeason \
    --namespace "$AB_NAMESPACE" \
    --userId 'zuG5oLf5' \
    > test.out 2>&1
eval_tap $? 43 'PublicGetCurrentUserSeason' test.out

#- 44 PublicClaimUserReward
./ng net.accelbyte.sdk.cli.Main seasonpass publicClaimUserReward \
    --namespace "$AB_NAMESPACE" \
    --userId 'huiBY7FC' \
    --body '{"passCode": "ccsgx2Wy", "rewardCode": "LeotSQeP", "tierIndex": 36}' \
    > test.out 2>&1
eval_tap $? 44 'PublicClaimUserReward' test.out

#- 45 PublicBulkClaimUserRewards
./ng net.accelbyte.sdk.cli.Main seasonpass publicBulkClaimUserRewards \
    --namespace "$AB_NAMESPACE" \
    --userId 'QNcvNi5t' \
    > test.out 2>&1
eval_tap $? 45 'PublicBulkClaimUserRewards' test.out

#- 46 PublicGetUserSeason
./ng net.accelbyte.sdk.cli.Main seasonpass publicGetUserSeason \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'UUgzoZFE' \
    --userId 'fyWR2VFs' \
    > test.out 2>&1
eval_tap $? 46 'PublicGetUserSeason' test.out


rm -f "tmp.dat"

exit $EXIT_CODE