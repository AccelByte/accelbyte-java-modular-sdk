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
    --limit '14' \
    --offset '51' \
    --status 'RETIRED,DRAFT,RETIRED' \
    > test.out 2>&1
eval_tap $? 3 'QuerySeasons' test.out

#- 4 CreateSeason
./ng net.accelbyte.sdk.cli.Main seasonpass createSeason \
    --namespace "$AB_NAMESPACE" \
    --body '{"autoClaim": false, "defaultLanguage": "D9K3zFRD", "defaultRequiredExp": 36, "draftStoreId": "og3eBhJP", "end": "1974-05-05T00:00:00Z", "excessStrategy": {"currency": "9u9bMgru", "method": "NONE", "percentPerExp": 5}, "images": [{"as": "AtHBYoZ5", "caption": "gfJSMWLG", "height": 35, "imageUrl": "TOl5UYC5", "smallImageUrl": "lV20j9Ws", "width": 80}, {"as": "CSjY4Sk7", "caption": "BzVSj9Qp", "height": 59, "imageUrl": "NtDEiOeE", "smallImageUrl": "nF4YiAaO", "width": 94}, {"as": "uPHUroAE", "caption": "HSRbDByx", "height": 70, "imageUrl": "d1otznKh", "smallImageUrl": "4WpMhbZU", "width": 36}], "localizations": {"15e4BOgi": {"description": "EtOoWeRZ", "title": "PTUH881Y"}, "eOM2BtXc": {"description": "Vw2rp2Dw", "title": "2B4qLxC0"}, "QdtZLLTt": {"description": "34gM4VXp", "title": "vReGBd9y"}}, "name": "yc3YYRVo", "start": "1974-12-05T00:00:00Z", "tierItemId": "ZLOUfNfm"}' \
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
    --body '{"userIds": ["kNE1zPz3", "65LPT7UU", "2kNdsbrB"]}' \
    > test.out 2>&1
eval_tap $? 6 'BulkGetUserSeasonProgression' test.out

#- 7 GetSeason
./ng net.accelbyte.sdk.cli.Main seasonpass getSeason \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'hSmVWsVI' \
    > test.out 2>&1
eval_tap $? 7 'GetSeason' test.out

#- 8 DeleteSeason
./ng net.accelbyte.sdk.cli.Main seasonpass deleteSeason \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'DqqkPIrT' \
    > test.out 2>&1
eval_tap $? 8 'DeleteSeason' test.out

#- 9 UpdateSeason
./ng net.accelbyte.sdk.cli.Main seasonpass updateSeason \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'ZwS1fcox' \
    --body '{"autoClaim": true, "defaultLanguage": "HM41i9iY", "defaultRequiredExp": 87, "draftStoreId": "ASxWgPRA", "end": "1972-03-29T00:00:00Z", "excessStrategy": {"currency": "EgLAeDS6", "method": "CURRENCY", "percentPerExp": 31}, "images": [{"as": "WUN5JpIK", "caption": "tObDc2v2", "height": 99, "imageUrl": "nZL0F2Rc", "smallImageUrl": "SZC7oSLW", "width": 94}, {"as": "vh0u6XE9", "caption": "H9v7R7f4", "height": 21, "imageUrl": "kXTG2crS", "smallImageUrl": "ve28GjWG", "width": 4}, {"as": "dU5yu7H8", "caption": "nDZ6YLh8", "height": 99, "imageUrl": "iJxH92sj", "smallImageUrl": "AWYovLvb", "width": 2}], "localizations": {"R2sQ9nHP": {"description": "rXkPZIit", "title": "0Zjrim1y"}, "6Htyqoc2": {"description": "hrVElsQ1", "title": "qkDym03x"}, "mg0jqPJM": {"description": "UlQYZHXV", "title": "jnxw1p6I"}}, "name": "7uqSb73V", "start": "1975-12-19T00:00:00Z", "tierItemId": "B8XvBWfR"}' \
    > test.out 2>&1
eval_tap $? 9 'UpdateSeason' test.out

#- 10 CloneSeason
./ng net.accelbyte.sdk.cli.Main seasonpass cloneSeason \
    --namespace "$AB_NAMESPACE" \
    --seasonId '0Sj8qf9z' \
    --body '{"end": "1995-10-16T00:00:00Z", "name": "obytwerR", "start": "1982-05-09T00:00:00Z"}' \
    > test.out 2>&1
eval_tap $? 10 'CloneSeason' test.out

#- 11 GetFullSeason
./ng net.accelbyte.sdk.cli.Main seasonpass getFullSeason \
    --namespace "$AB_NAMESPACE" \
    --seasonId '4k1Em18X' \
    > test.out 2>&1
eval_tap $? 11 'GetFullSeason' test.out

#- 12 QueryPasses
./ng net.accelbyte.sdk.cli.Main seasonpass queryPasses \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'Ibb4sLqp' \
    > test.out 2>&1
eval_tap $? 12 'QueryPasses' test.out

#- 13 CreatePass
./ng net.accelbyte.sdk.cli.Main seasonpass createPass \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'ucNFAYt9' \
    --body '{"autoEnroll": false, "code": "Op5EQDj3", "displayOrder": 0, "images": [{"as": "fE9w167O", "caption": "HNcfCPvD", "height": 29, "imageUrl": "XSI4GzEV", "smallImageUrl": "klGG1DSc", "width": 38}, {"as": "rHgXMsAu", "caption": "71PcxvjE", "height": 87, "imageUrl": "IRPwKvvS", "smallImageUrl": "bOG8rnkR", "width": 9}, {"as": "cYzqN7Z6", "caption": "x2vMNWoQ", "height": 64, "imageUrl": "CB58Zl7k", "smallImageUrl": "blQUAIeN", "width": 15}], "localizations": {"2chM5lJn": {"description": "Vy9eTgAt", "title": "7f5FeRfT"}, "bXgzwOcX": {"description": "KAI5ZxgK", "title": "epNd9rro"}, "3gOoH0yG": {"description": "dNwIn4tp", "title": "2lxLS4CR"}}, "passItemId": "geyDgen9"}' \
    > test.out 2>&1
eval_tap $? 13 'CreatePass' test.out

#- 14 GetPass
./ng net.accelbyte.sdk.cli.Main seasonpass getPass \
    --code '7Krex4ON' \
    --namespace "$AB_NAMESPACE" \
    --seasonId '0pWa2Uso' \
    > test.out 2>&1
eval_tap $? 14 'GetPass' test.out

#- 15 DeletePass
./ng net.accelbyte.sdk.cli.Main seasonpass deletePass \
    --code 'TSvV65FV' \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'EyB79SSz' \
    > test.out 2>&1
eval_tap $? 15 'DeletePass' test.out

#- 16 UpdatePass
./ng net.accelbyte.sdk.cli.Main seasonpass updatePass \
    --code 'o0EYJX4J' \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'xpE44sf0' \
    --body '{"autoEnroll": false, "displayOrder": 34, "images": [{"as": "591Ajcsy", "caption": "0cXGHYZg", "height": 75, "imageUrl": "axVnm9f5", "smallImageUrl": "vMHND4UM", "width": 72}, {"as": "X9PTO3H8", "caption": "6t92SEwp", "height": 67, "imageUrl": "eW3wH1RJ", "smallImageUrl": "5cTp62Px", "width": 7}, {"as": "ybMv4OeU", "caption": "jdh85WUK", "height": 50, "imageUrl": "qKSre0R3", "smallImageUrl": "u5pz45Wo", "width": 71}], "localizations": {"UY36FDoS": {"description": "LKNAB0KP", "title": "F4NHc0OW"}, "wpl2gdZP": {"description": "t7j6wPPO", "title": "5h3hQcHH"}, "Zfo27M4x": {"description": "5BQAypxh", "title": "05F3ktFY"}}, "passItemId": "szKs2ttC"}' \
    > test.out 2>&1
eval_tap $? 16 'UpdatePass' test.out

#- 17 PublishSeason
./ng net.accelbyte.sdk.cli.Main seasonpass publishSeason \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'CcrdY73X' \
    > test.out 2>&1
eval_tap $? 17 'PublishSeason' test.out

#- 18 RetireSeason
./ng net.accelbyte.sdk.cli.Main seasonpass retireSeason \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'fzbgUFZ1' \
    --force  \
    > test.out 2>&1
eval_tap $? 18 'RetireSeason' test.out

#- 19 QueryRewards
./ng net.accelbyte.sdk.cli.Main seasonpass queryRewards \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'nk8GzKgG' \
    --q 'oHmX3ikb' \
    > test.out 2>&1
eval_tap $? 19 'QueryRewards' test.out

#- 20 CreateReward
./ng net.accelbyte.sdk.cli.Main seasonpass createReward \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'avRicHng' \
    --body '{"code": "Su80A3JE", "currency": {"currencyCode": "QdtcziRc", "namespace": "I2PBPA7E"}, "image": {"as": "uNCvlD2S", "caption": "OhbAk1Lj", "height": 82, "imageUrl": "ok4AZGcj", "smallImageUrl": "RXz3qOez", "width": 69}, "itemId": "vNuS5Qig", "quantity": 7, "type": "CURRENCY"}' \
    > test.out 2>&1
eval_tap $? 20 'CreateReward' test.out

#- 21 GetReward
./ng net.accelbyte.sdk.cli.Main seasonpass getReward \
    --code 'D5WJ76Q1' \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'vmQixomu' \
    > test.out 2>&1
eval_tap $? 21 'GetReward' test.out

#- 22 DeleteReward
./ng net.accelbyte.sdk.cli.Main seasonpass deleteReward \
    --code 'Cu0foTBE' \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'adR1n6EZ' \
    > test.out 2>&1
eval_tap $? 22 'DeleteReward' test.out

#- 23 UpdateReward
./ng net.accelbyte.sdk.cli.Main seasonpass updateReward \
    --code 'RwxtaWFw' \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'lbC9rVov' \
    --body '{"currency": {"currencyCode": "9BB2xxTm", "namespace": "ZMjCidcS"}, "image": {"as": "FBsZDqPK", "caption": "xigSUQiB", "height": 1, "imageUrl": "eMLc3z4A", "smallImageUrl": "UtHXMkeZ", "width": 97}, "itemId": "qn5DPhy0", "nullFields": ["2jkWqexj", "BdOtuC8K", "IX4IFclu"], "quantity": 67, "type": "CURRENCY"}' \
    > test.out 2>&1
eval_tap $? 23 'UpdateReward' test.out

#- 24 QueryTiers
./ng net.accelbyte.sdk.cli.Main seasonpass queryTiers \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'cd2AiwFw' \
    --limit '77' \
    --offset '1' \
    > test.out 2>&1
eval_tap $? 24 'QueryTiers' test.out

#- 25 CreateTier
./ng net.accelbyte.sdk.cli.Main seasonpass createTier \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'CKHDZO7D' \
    --body '{"index": 67, "quantity": 82, "tier": {"requiredExp": 46, "rewards": {"Fpl9DOMj": ["0ixvKwns", "qmh8tJEf", "V5UZxDku"], "7fJITRDI": ["U4pDoLeO", "oVuN7kdk", "ocMhdPCp"], "UQ25OAwv": ["2YA8LFG8", "eTvMXXq5", "3RcqTVsY"]}}}' \
    > test.out 2>&1
eval_tap $? 25 'CreateTier' test.out

#- 26 UpdateTier
./ng net.accelbyte.sdk.cli.Main seasonpass updateTier \
    --id 'WtSgBZMr' \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'I6iSXd5F' \
    --body '{"requiredExp": 36, "rewards": {"6dWt6atA": ["N0XZTS3E", "7Ae8wUpP", "Uyqgi1vt"], "hYInLpPv": ["TEehB05b", "hEw7jsL2", "0MQr3VNF"], "MVU7DMzz": ["juxMGUg6", "rKClvLD7", "a79FPQuo"]}}' \
    > test.out 2>&1
eval_tap $? 26 'UpdateTier' test.out

#- 27 DeleteTier
./ng net.accelbyte.sdk.cli.Main seasonpass deleteTier \
    --id '2XT5VyEn' \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'kfWyMn9a' \
    > test.out 2>&1
eval_tap $? 27 'DeleteTier' test.out

#- 28 ReorderTier
./ng net.accelbyte.sdk.cli.Main seasonpass reorderTier \
    --id '8XaOKQUx' \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'WQPWrtge' \
    --body '{"newIndex": 99}' \
    > test.out 2>&1
eval_tap $? 28 'ReorderTier' test.out

#- 29 UnpublishSeason
./ng net.accelbyte.sdk.cli.Main seasonpass unpublishSeason \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'OD2nmkeB' \
    --force  \
    > test.out 2>&1
eval_tap $? 29 'UnpublishSeason' test.out

#- 30 GetUserParticipatedSeasons
./ng net.accelbyte.sdk.cli.Main seasonpass getUserParticipatedSeasons \
    --namespace "$AB_NAMESPACE" \
    --userId 'atFOPK1m' \
    --limit '75' \
    --offset '36' \
    > test.out 2>&1
eval_tap $? 30 'GetUserParticipatedSeasons' test.out

#- 31 GrantUserExp
./ng net.accelbyte.sdk.cli.Main seasonpass grantUserExp \
    --namespace "$AB_NAMESPACE" \
    --userId 'scu23KV6' \
    --body '{"exp": 84, "source": "SWEAT", "tags": ["aLbG8r0g", "TxU5L410", "7mJkMfVH"]}' \
    > test.out 2>&1
eval_tap $? 31 'GrantUserExp' test.out

#- 32 GrantUserPass
./ng net.accelbyte.sdk.cli.Main seasonpass grantUserPass \
    --namespace "$AB_NAMESPACE" \
    --userId '9MOx8WxC' \
    --body '{"passCode": "L2CcwxOi", "passItemId": "KCQp3gzj"}' \
    > test.out 2>&1
eval_tap $? 32 'GrantUserPass' test.out

#- 33 ExistsAnyPassByPassCodes
./ng net.accelbyte.sdk.cli.Main seasonpass existsAnyPassByPassCodes \
    --namespace "$AB_NAMESPACE" \
    --userId 'RJlCGK5f' \
    --passCodes 'Fiu0fEam,mEwCP9e9,CCaZXz3G' \
    > test.out 2>&1
eval_tap $? 33 'ExistsAnyPassByPassCodes' test.out

#- 34 GetCurrentUserSeasonProgression
./ng net.accelbyte.sdk.cli.Main seasonpass getCurrentUserSeasonProgression \
    --namespace "$AB_NAMESPACE" \
    --userId '63Nni2KZ' \
    > test.out 2>&1
eval_tap $? 34 'GetCurrentUserSeasonProgression' test.out

#- 35 CheckSeasonPurchasable
./ng net.accelbyte.sdk.cli.Main seasonpass checkSeasonPurchasable \
    --namespace "$AB_NAMESPACE" \
    --userId 'zu6eJJXN' \
    --body '{"passItemId": "Y8RAfpXn", "tierItemCount": 77, "tierItemId": "YBaV3tdf"}' \
    > test.out 2>&1
eval_tap $? 35 'CheckSeasonPurchasable' test.out

#- 36 ResetUserSeason
./ng net.accelbyte.sdk.cli.Main seasonpass resetUserSeason \
    --namespace "$AB_NAMESPACE" \
    --userId 'dG44n59n' \
    > test.out 2>&1
eval_tap $? 36 'ResetUserSeason' test.out

#- 37 GrantUserTier
./ng net.accelbyte.sdk.cli.Main seasonpass grantUserTier \
    --namespace "$AB_NAMESPACE" \
    --userId '2U7cODiZ' \
    --body '{"count": 74, "source": "PAID_FOR", "tags": ["4lPW2hFI", "r28QCR9L", "C7uXhRTm"]}' \
    > test.out 2>&1
eval_tap $? 37 'GrantUserTier' test.out

#- 38 QueryUserExpGrantHistory
./ng net.accelbyte.sdk.cli.Main seasonpass queryUserExpGrantHistory \
    --namespace "$AB_NAMESPACE" \
    --userId 'Nxko7oDr' \
    --from 'EQ0ly4ow' \
    --limit '60' \
    --offset '32' \
    --seasonId 'Shh3v5jH' \
    --source 'SWEAT' \
    --tags 'kEO6ASxK,BqQcxn1T,fEZgs27v' \
    --to 'Ms4Uq1Vb' \
    > test.out 2>&1
eval_tap $? 38 'QueryUserExpGrantHistory' test.out

#- 39 QueryUserExpGrantHistoryTag
./ng net.accelbyte.sdk.cli.Main seasonpass queryUserExpGrantHistoryTag \
    --namespace "$AB_NAMESPACE" \
    --userId 'B8PVofT5' \
    --seasonId 'gBS0TYTf' \
    > test.out 2>&1
eval_tap $? 39 'QueryUserExpGrantHistoryTag' test.out

#- 40 GetUserSeason
./ng net.accelbyte.sdk.cli.Main seasonpass getUserSeason \
    --namespace "$AB_NAMESPACE" \
    --seasonId '0977aDR9' \
    --userId 'o56WVouG' \
    > test.out 2>&1
eval_tap $? 40 'GetUserSeason' test.out

#- 41 PublicGetCurrentSeason
./ng net.accelbyte.sdk.cli.Main seasonpass publicGetCurrentSeason \
    --namespace "$AB_NAMESPACE" \
    --language 'zdLjz1Aj' \
    > test.out 2>&1
eval_tap $? 41 'PublicGetCurrentSeason' test.out

#- 42 PublicGetCurrentUserSeason
./ng net.accelbyte.sdk.cli.Main seasonpass publicGetCurrentUserSeason \
    --namespace "$AB_NAMESPACE" \
    --userId 'vhE5gQoQ' \
    > test.out 2>&1
eval_tap $? 42 'PublicGetCurrentUserSeason' test.out

#- 43 PublicClaimUserReward
./ng net.accelbyte.sdk.cli.Main seasonpass publicClaimUserReward \
    --namespace "$AB_NAMESPACE" \
    --userId 'Yx8cDZUK' \
    --body '{"passCode": "uR1IG5IY", "rewardCode": "CUurjd9f", "tierIndex": 57}' \
    > test.out 2>&1
eval_tap $? 43 'PublicClaimUserReward' test.out

#- 44 PublicBulkClaimUserRewards
./ng net.accelbyte.sdk.cli.Main seasonpass publicBulkClaimUserRewards \
    --namespace "$AB_NAMESPACE" \
    --userId 'TCCCirax' \
    > test.out 2>&1
eval_tap $? 44 'PublicBulkClaimUserRewards' test.out

#- 45 PublicGetUserSeason
./ng net.accelbyte.sdk.cli.Main seasonpass publicGetUserSeason \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'bWUR7rQ8' \
    --userId 'ElDtB9Ec' \
    > test.out 2>&1
eval_tap $? 45 'PublicGetUserSeason' test.out


rm -f "tmp.dat"

exit $EXIT_CODE