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
    --limit '34' \
    --offset '93' \
    --status 'DRAFT,DRAFT,PUBLISHED' \
    > test.out 2>&1
eval_tap $? 3 'QuerySeasons' test.out

#- 4 CreateSeason
./ng net.accelbyte.sdk.cli.Main seasonpass createSeason \
    --namespace "$AB_NAMESPACE" \
    --body '{"autoClaim": false, "defaultLanguage": "476ZBiyq", "defaultRequiredExp": 49, "draftStoreId": "aMDCmLEt", "end": "1971-11-03T00:00:00Z", "excessStrategy": {"currency": "ikwyn15t", "method": "NONE", "percentPerExp": 48}, "images": [{"as": "Fc4CwSpU", "caption": "pbK5aAAM", "height": 97, "imageUrl": "YjZKOqB0", "smallImageUrl": "U4AZm6nF", "width": 10}, {"as": "kX7B7sjr", "caption": "jXutDA7i", "height": 79, "imageUrl": "sQekBlmU", "smallImageUrl": "a2L3DIJB", "width": 41}, {"as": "FwmRKd4w", "caption": "fQf4VqnX", "height": 25, "imageUrl": "kxDvyLeR", "smallImageUrl": "hDUjL5p8", "width": 17}], "localizations": {"aXsl6XLA": {"description": "VzaQ9WUd", "title": "9BluNO5j"}, "Lib34NHB": {"description": "BVQliF15", "title": "fjbcj2qG"}, "4DL3ZNr6": {"description": "2ohhtBSL", "title": "7XEuGICb"}}, "name": "DSTRvgRt", "start": "1981-09-06T00:00:00Z", "tierItemId": "yZ6h6yGG"}' \
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
    --body '{"userIds": ["pOJAepuh", "ClNMcSSz", "25lqI2wF"]}' \
    > test.out 2>&1
eval_tap $? 6 'BulkGetUserSeasonProgression' test.out

#- 7 GetItemReferences
./ng net.accelbyte.sdk.cli.Main seasonpass getItemReferences \
    --namespace "$AB_NAMESPACE" \
    --itemId 'nqsoY44C' \
    > test.out 2>&1
eval_tap $? 7 'GetItemReferences' test.out

#- 8 GetSeason
./ng net.accelbyte.sdk.cli.Main seasonpass getSeason \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'oIE0QgzI' \
    > test.out 2>&1
eval_tap $? 8 'GetSeason' test.out

#- 9 DeleteSeason
./ng net.accelbyte.sdk.cli.Main seasonpass deleteSeason \
    --namespace "$AB_NAMESPACE" \
    --seasonId '7O0JIhEG' \
    > test.out 2>&1
eval_tap $? 9 'DeleteSeason' test.out

#- 10 UpdateSeason
./ng net.accelbyte.sdk.cli.Main seasonpass updateSeason \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'nioZmy0X' \
    --body '{"autoClaim": true, "defaultLanguage": "REMwxpWb", "defaultRequiredExp": 86, "draftStoreId": "le7H4UUr", "end": "1979-03-21T00:00:00Z", "excessStrategy": {"currency": "p9hGq9cl", "method": "CURRENCY", "percentPerExp": 48}, "images": [{"as": "TVZI49DO", "caption": "UG7wzs8L", "height": 100, "imageUrl": "lraPdEwU", "smallImageUrl": "eXoOxwOF", "width": 51}, {"as": "AlYswwM1", "caption": "K7JTUHUF", "height": 37, "imageUrl": "2IdRekhq", "smallImageUrl": "cBM8m1rv", "width": 4}, {"as": "dvlR65WS", "caption": "8S0ZwJ5S", "height": 30, "imageUrl": "4TdlmeKI", "smallImageUrl": "yNJO7te3", "width": 68}], "localizations": {"m8XkhY6b": {"description": "vtPDvutE", "title": "dTKThQHW"}, "aq5yvcLv": {"description": "Lim1asNp", "title": "h2UDYeyd"}, "IXP0uixP": {"description": "YXIumNwU", "title": "qKj2E1oW"}}, "name": "VomZQuH8", "start": "1973-01-24T00:00:00Z", "tierItemId": "t7PxBtZo"}' \
    > test.out 2>&1
eval_tap $? 10 'UpdateSeason' test.out

#- 11 CloneSeason
./ng net.accelbyte.sdk.cli.Main seasonpass cloneSeason \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'oLGmFNN3' \
    --body '{"end": "1975-03-22T00:00:00Z", "name": "5RcLRxQQ", "start": "1983-02-03T00:00:00Z"}' \
    > test.out 2>&1
eval_tap $? 11 'CloneSeason' test.out

#- 12 GetFullSeason
./ng net.accelbyte.sdk.cli.Main seasonpass getFullSeason \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'ar1nwrTX' \
    > test.out 2>&1
eval_tap $? 12 'GetFullSeason' test.out

#- 13 QueryPasses
./ng net.accelbyte.sdk.cli.Main seasonpass queryPasses \
    --namespace "$AB_NAMESPACE" \
    --seasonId '9hDClwAe' \
    > test.out 2>&1
eval_tap $? 13 'QueryPasses' test.out

#- 14 CreatePass
./ng net.accelbyte.sdk.cli.Main seasonpass createPass \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'lE0MwTXB' \
    --body '{"autoEnroll": true, "code": "fNpAyOER", "displayOrder": 1, "images": [{"as": "DTEIw9zx", "caption": "Ek8UwQsC", "height": 81, "imageUrl": "ZVEkdXp4", "smallImageUrl": "1zZHDhHU", "width": 45}, {"as": "7duwvNvP", "caption": "fzNtqUjk", "height": 14, "imageUrl": "dntNYe0o", "smallImageUrl": "PLYtTAKU", "width": 40}, {"as": "h3UZaLuM", "caption": "X0Xifhw3", "height": 3, "imageUrl": "uhREbodu", "smallImageUrl": "CSJV0PyA", "width": 54}], "localizations": {"s6z7RUzm": {"description": "Rq2G71tu", "title": "b2mIxfz1"}, "WvZAOnEK": {"description": "knzhDJmm", "title": "V8bbdXO2"}, "wWZ6Oae9": {"description": "MPUjjalI", "title": "ysicLKIv"}}, "passItemId": "Ob9xxLtq"}' \
    > test.out 2>&1
eval_tap $? 14 'CreatePass' test.out

#- 15 GetPass
./ng net.accelbyte.sdk.cli.Main seasonpass getPass \
    --code 'cnxf4fej' \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'Tyw4jODZ' \
    > test.out 2>&1
eval_tap $? 15 'GetPass' test.out

#- 16 DeletePass
./ng net.accelbyte.sdk.cli.Main seasonpass deletePass \
    --code 'bRNeaRRM' \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'tQovfBrC' \
    > test.out 2>&1
eval_tap $? 16 'DeletePass' test.out

#- 17 UpdatePass
./ng net.accelbyte.sdk.cli.Main seasonpass updatePass \
    --code 'kLRX3lFt' \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'QJHJE3U6' \
    --body '{"autoEnroll": false, "displayOrder": 64, "images": [{"as": "anKchUEq", "caption": "l0Hd7RSd", "height": 7, "imageUrl": "Ip0hIBK4", "smallImageUrl": "KTUq0fqy", "width": 7}, {"as": "WjwsWqXd", "caption": "1b1QG4HI", "height": 26, "imageUrl": "1UPaZnKL", "smallImageUrl": "dsxpgNNB", "width": 61}, {"as": "7NqIyGPa", "caption": "qO34ElFD", "height": 18, "imageUrl": "SKaoVZU5", "smallImageUrl": "Jr6HorMX", "width": 18}], "localizations": {"2AhnTetC": {"description": "RdTVz8io", "title": "ynktdyh6"}, "xiVvBbJl": {"description": "PsAToGkR", "title": "WZbRKMP7"}, "6Xd57pLI": {"description": "hWrRo6G6", "title": "ncJYKuaA"}}, "passItemId": "6EHw4RDH"}' \
    > test.out 2>&1
eval_tap $? 17 'UpdatePass' test.out

#- 18 PublishSeason
./ng net.accelbyte.sdk.cli.Main seasonpass publishSeason \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'qFdtJuXA' \
    > test.out 2>&1
eval_tap $? 18 'PublishSeason' test.out

#- 19 RetireSeason
./ng net.accelbyte.sdk.cli.Main seasonpass retireSeason \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'ZVVQlqxE' \
    --force  \
    > test.out 2>&1
eval_tap $? 19 'RetireSeason' test.out

#- 20 QueryRewards
./ng net.accelbyte.sdk.cli.Main seasonpass queryRewards \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'jORodMIA' \
    --q 'JX5ivKNx' \
    > test.out 2>&1
eval_tap $? 20 'QueryRewards' test.out

#- 21 CreateReward
./ng net.accelbyte.sdk.cli.Main seasonpass createReward \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'quq9srLV' \
    --body '{"code": "NWhSRBeJ", "currency": {"currencyCode": "JX85wqfO", "namespace": "bkjIqfEo"}, "image": {"as": "7ImkQbYt", "caption": "RwVKY6Sn", "height": 93, "imageUrl": "DIbN7cIp", "smallImageUrl": "bKA5FpVG", "width": 81}, "itemId": "QPN7WD63", "quantity": 1, "type": "ITEM"}' \
    > test.out 2>&1
eval_tap $? 21 'CreateReward' test.out

#- 22 GetReward
./ng net.accelbyte.sdk.cli.Main seasonpass getReward \
    --code 'vMuGJxLV' \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'Vhw9sL4v' \
    > test.out 2>&1
eval_tap $? 22 'GetReward' test.out

#- 23 DeleteReward
./ng net.accelbyte.sdk.cli.Main seasonpass deleteReward \
    --code 'Fq8qsWss' \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'IHlpJSEv' \
    > test.out 2>&1
eval_tap $? 23 'DeleteReward' test.out

#- 24 UpdateReward
./ng net.accelbyte.sdk.cli.Main seasonpass updateReward \
    --code 'o1dnrVaJ' \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'RBOqgGXp' \
    --body '{"currency": {"currencyCode": "agZ8oegZ", "namespace": "ekzLX3ZM"}, "image": {"as": "08Ap1Anq", "caption": "JIDpu8Po", "height": 23, "imageUrl": "kurz44SH", "smallImageUrl": "ZiCU04Kx", "width": 26}, "itemId": "uDXNkP5B", "nullFields": ["h1C1j5VA", "xpMXtBem", "HBzLT3cQ"], "quantity": 89, "type": "CURRENCY"}' \
    > test.out 2>&1
eval_tap $? 24 'UpdateReward' test.out

#- 25 QueryTiers
./ng net.accelbyte.sdk.cli.Main seasonpass queryTiers \
    --namespace "$AB_NAMESPACE" \
    --seasonId '1VPiIFnG' \
    --limit '8' \
    --offset '35' \
    > test.out 2>&1
eval_tap $? 25 'QueryTiers' test.out

#- 26 CreateTier
./ng net.accelbyte.sdk.cli.Main seasonpass createTier \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'Mps58VzU' \
    --body '{"index": 5, "quantity": 30, "tier": {"requiredExp": 55, "rewards": {"GV0Sho05": ["LPwUwe5U", "RLT6SUBV", "z5uKs0Jg"], "tqKIUbnZ": ["LFvVKN2F", "t6IwFZeD", "6LXxJYS1"], "7TJ3RbND": ["TPXMZIvO", "LInYaFDr", "W26jcAHR"]}}}' \
    > test.out 2>&1
eval_tap $? 26 'CreateTier' test.out

#- 27 UpdateTier
./ng net.accelbyte.sdk.cli.Main seasonpass updateTier \
    --id '8clWae86' \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'c65C98YI' \
    --body '{"requiredExp": 32, "rewards": {"MBP4OhNF": ["pImrvNIz", "u5DmFwZN", "550huqAU"], "DQZGKQPm": ["fV75ABkD", "TUgc7PnV", "TfweVQKJ"], "8E1wJpxr": ["8DunL0sW", "PJUKDvj3", "RRxgZAdT"]}}' \
    > test.out 2>&1
eval_tap $? 27 'UpdateTier' test.out

#- 28 DeleteTier
./ng net.accelbyte.sdk.cli.Main seasonpass deleteTier \
    --id 'fQ38WhDs' \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'EnZ8G8W9' \
    > test.out 2>&1
eval_tap $? 28 'DeleteTier' test.out

#- 29 ReorderTier
./ng net.accelbyte.sdk.cli.Main seasonpass reorderTier \
    --id 'dMtTgXk4' \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'E58E9iJb' \
    --body '{"newIndex": 68}' \
    > test.out 2>&1
eval_tap $? 29 'ReorderTier' test.out

#- 30 UnpublishSeason
./ng net.accelbyte.sdk.cli.Main seasonpass unpublishSeason \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'MuV262lW' \
    --force  \
    > test.out 2>&1
eval_tap $? 30 'UnpublishSeason' test.out

#- 31 GetUserParticipatedSeasons
./ng net.accelbyte.sdk.cli.Main seasonpass getUserParticipatedSeasons \
    --namespace "$AB_NAMESPACE" \
    --userId 'sdhjBBdP' \
    --limit '72' \
    --offset '38' \
    > test.out 2>&1
eval_tap $? 31 'GetUserParticipatedSeasons' test.out

#- 32 GrantUserExp
./ng net.accelbyte.sdk.cli.Main seasonpass grantUserExp \
    --namespace "$AB_NAMESPACE" \
    --userId 'VAN8pBMe' \
    --body '{"exp": 37, "source": "SWEAT", "tags": ["qVWRq02u", "qC6OLLCV", "OgupVTxg"]}' \
    > test.out 2>&1
eval_tap $? 32 'GrantUserExp' test.out

#- 33 GrantUserPass
./ng net.accelbyte.sdk.cli.Main seasonpass grantUserPass \
    --namespace "$AB_NAMESPACE" \
    --userId 'Xztmshd0' \
    --body '{"passCode": "HgdJ0SlZ", "passItemId": "3EBnYUaT"}' \
    > test.out 2>&1
eval_tap $? 33 'GrantUserPass' test.out

#- 34 ExistsAnyPassByPassCodes
./ng net.accelbyte.sdk.cli.Main seasonpass existsAnyPassByPassCodes \
    --namespace "$AB_NAMESPACE" \
    --userId 'G34DltIm' \
    --passCodes 'khdf8iSp,oHHb26f6,vtdwhPqS' \
    > test.out 2>&1
eval_tap $? 34 'ExistsAnyPassByPassCodes' test.out

#- 35 GetCurrentUserSeasonProgression
./ng net.accelbyte.sdk.cli.Main seasonpass getCurrentUserSeasonProgression \
    --namespace "$AB_NAMESPACE" \
    --userId '3YJdGfFb' \
    > test.out 2>&1
eval_tap $? 35 'GetCurrentUserSeasonProgression' test.out

#- 36 CheckSeasonPurchasable
./ng net.accelbyte.sdk.cli.Main seasonpass checkSeasonPurchasable \
    --namespace "$AB_NAMESPACE" \
    --userId 'wfqucYlp' \
    --body '{"passItemId": "RvGY2zB8", "tierItemCount": 3, "tierItemId": "n9urjYMR"}' \
    > test.out 2>&1
eval_tap $? 36 'CheckSeasonPurchasable' test.out

#- 37 ResetUserSeason
./ng net.accelbyte.sdk.cli.Main seasonpass resetUserSeason \
    --namespace "$AB_NAMESPACE" \
    --userId '4TwP2IU7' \
    > test.out 2>&1
eval_tap $? 37 'ResetUserSeason' test.out

#- 38 GrantUserTier
./ng net.accelbyte.sdk.cli.Main seasonpass grantUserTier \
    --namespace "$AB_NAMESPACE" \
    --userId 'IIzkoMDd' \
    --body '{"count": 32, "source": "SWEAT", "tags": ["YKRjJL7j", "NATEiVlO", "ESjTsajR"]}' \
    > test.out 2>&1
eval_tap $? 38 'GrantUserTier' test.out

#- 39 QueryUserExpGrantHistory
./ng net.accelbyte.sdk.cli.Main seasonpass queryUserExpGrantHistory \
    --namespace "$AB_NAMESPACE" \
    --userId 'ot7UNdCX' \
    --from 'KXiWezwB' \
    --limit '37' \
    --offset '92' \
    --seasonId 'BhEJmEag' \
    --source 'PAID_FOR' \
    --tags 'cROV4kGB,Sf3eK07R,M6ZmFwDZ' \
    --to 'ZUcPYaNu' \
    > test.out 2>&1
eval_tap $? 39 'QueryUserExpGrantHistory' test.out

#- 40 QueryUserExpGrantHistoryTag
./ng net.accelbyte.sdk.cli.Main seasonpass queryUserExpGrantHistoryTag \
    --namespace "$AB_NAMESPACE" \
    --userId 'IR2d4gas' \
    --seasonId 'nc6KQCyc' \
    > test.out 2>&1
eval_tap $? 40 'QueryUserExpGrantHistoryTag' test.out

#- 41 GetUserSeason
./ng net.accelbyte.sdk.cli.Main seasonpass getUserSeason \
    --namespace "$AB_NAMESPACE" \
    --seasonId '4lLpATJZ' \
    --userId 'UsoPXeOx' \
    > test.out 2>&1
eval_tap $? 41 'GetUserSeason' test.out

#- 42 PublicGetCurrentSeason
./ng net.accelbyte.sdk.cli.Main seasonpass publicGetCurrentSeason \
    --namespace "$AB_NAMESPACE" \
    --language 'bhuX25Fu' \
    > test.out 2>&1
eval_tap $? 42 'PublicGetCurrentSeason' test.out

#- 43 PublicGetCurrentUserSeason
./ng net.accelbyte.sdk.cli.Main seasonpass publicGetCurrentUserSeason \
    --namespace "$AB_NAMESPACE" \
    --userId 'AgDMJnE6' \
    > test.out 2>&1
eval_tap $? 43 'PublicGetCurrentUserSeason' test.out

#- 44 PublicClaimUserReward
./ng net.accelbyte.sdk.cli.Main seasonpass publicClaimUserReward \
    --namespace "$AB_NAMESPACE" \
    --userId 'onMjeWSy' \
    --body '{"passCode": "yqQzARzZ", "rewardCode": "y6bN7fvW", "tierIndex": 77}' \
    > test.out 2>&1
eval_tap $? 44 'PublicClaimUserReward' test.out

#- 45 PublicBulkClaimUserRewards
./ng net.accelbyte.sdk.cli.Main seasonpass publicBulkClaimUserRewards \
    --namespace "$AB_NAMESPACE" \
    --userId 'sxKzMxhX' \
    > test.out 2>&1
eval_tap $? 45 'PublicBulkClaimUserRewards' test.out

#- 46 PublicGetUserSeason
./ng net.accelbyte.sdk.cli.Main seasonpass publicGetUserSeason \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'SlPksH4O' \
    --userId 'YXRoVsQx' \
    > test.out 2>&1
eval_tap $? 46 'PublicGetUserSeason' test.out


rm -f "tmp.dat"

exit $EXIT_CODE