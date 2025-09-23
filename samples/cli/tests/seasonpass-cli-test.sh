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
    --limit '55' \
    --offset '89' \
    --status 'RETIRED,PUBLISHED,DRAFT' \
    > test.out 2>&1
eval_tap $? 3 'QuerySeasons' test.out

#- 4 CreateSeason
./ng net.accelbyte.sdk.cli.Main seasonpass createSeason \
    --namespace "$AB_NAMESPACE" \
    --body '{"autoClaim": true, "defaultLanguage": "rNZtmucC", "defaultRequiredExp": 53, "draftStoreId": "50dJjMBc", "end": "1978-01-27T00:00:00Z", "excessStrategy": {"currency": "RQSUe9AT", "method": "CURRENCY", "percentPerExp": 45}, "images": [{"as": "9siKci5x", "caption": "m63uXh9O", "height": 78, "imageUrl": "uDhzMHsf", "smallImageUrl": "DTYScVUE", "width": 35}, {"as": "ho6cgw0Q", "caption": "FceqL7ob", "height": 82, "imageUrl": "0F5BKFpr", "smallImageUrl": "WSFbUub0", "width": 13}, {"as": "nDxH8e0n", "caption": "d9o3bUsP", "height": 25, "imageUrl": "3FAlt4su", "smallImageUrl": "dGIVT0xm", "width": 55}], "localizations": {"Tw2lQDGN": {"description": "iHTmQlJv", "title": "i6nLeL1w"}, "A7PcbLzh": {"description": "rxJOSzct", "title": "5FbHwH3U"}, "aMvR5s1E": {"description": "eqXjRtTD", "title": "MLNqe5qM"}}, "name": "qarmQy13", "start": "1973-03-07T00:00:00Z", "tierItemId": "C8wLiti0"}' \
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
    --body '{"userIds": ["HnoANeUa", "1MTCYNpW", "Ao85qWWf"]}' \
    > test.out 2>&1
eval_tap $? 6 'BulkGetUserSeasonProgression' test.out

#- 7 GetItemReferences
./ng net.accelbyte.sdk.cli.Main seasonpass getItemReferences \
    --namespace "$AB_NAMESPACE" \
    --itemId 'lVDkzu2z' \
    > test.out 2>&1
eval_tap $? 7 'GetItemReferences' test.out

#- 8 GetSeason
./ng net.accelbyte.sdk.cli.Main seasonpass getSeason \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'XTDUMBQF' \
    > test.out 2>&1
eval_tap $? 8 'GetSeason' test.out

#- 9 DeleteSeason
./ng net.accelbyte.sdk.cli.Main seasonpass deleteSeason \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'Wx0DHBBi' \
    > test.out 2>&1
eval_tap $? 9 'DeleteSeason' test.out

#- 10 UpdateSeason
./ng net.accelbyte.sdk.cli.Main seasonpass updateSeason \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'YWt053Rk' \
    --body '{"autoClaim": true, "defaultLanguage": "Ah3gyALF", "defaultRequiredExp": 95, "draftStoreId": "mMD7AETK", "end": "1981-09-09T00:00:00Z", "excessStrategy": {"currency": "agZVBJa5", "method": "CURRENCY", "percentPerExp": 14}, "images": [{"as": "Jcbcl3dr", "caption": "drvugCLw", "height": 1, "imageUrl": "XG90jyx7", "smallImageUrl": "TQ3UNGRL", "width": 38}, {"as": "Oc3sl80K", "caption": "CcNFumzm", "height": 85, "imageUrl": "4MihXEJD", "smallImageUrl": "gOyDEspz", "width": 51}, {"as": "ySsV66Be", "caption": "p5BQq2Fg", "height": 70, "imageUrl": "CrgBnaG9", "smallImageUrl": "vH1ECKzS", "width": 38}], "localizations": {"wBlNsaiJ": {"description": "QA1AGm2H", "title": "0uY2FtfE"}, "VIKHNJyK": {"description": "DrQfG4bd", "title": "tCOTxt8D"}, "NDcUnQmB": {"description": "I80G6EHJ", "title": "NFYMmVYM"}}, "name": "XS1skRTC", "start": "1991-01-03T00:00:00Z", "tierItemId": "gKQwmdaV"}' \
    > test.out 2>&1
eval_tap $? 10 'UpdateSeason' test.out

#- 11 CloneSeason
./ng net.accelbyte.sdk.cli.Main seasonpass cloneSeason \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'CtbWyefs' \
    --body '{"end": "1997-09-23T00:00:00Z", "name": "D9hRBzRO", "start": "1995-09-25T00:00:00Z"}' \
    > test.out 2>&1
eval_tap $? 11 'CloneSeason' test.out

#- 12 GetFullSeason
./ng net.accelbyte.sdk.cli.Main seasonpass getFullSeason \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'lnuShrQg' \
    > test.out 2>&1
eval_tap $? 12 'GetFullSeason' test.out

#- 13 QueryPasses
./ng net.accelbyte.sdk.cli.Main seasonpass queryPasses \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'od6cR0g9' \
    > test.out 2>&1
eval_tap $? 13 'QueryPasses' test.out

#- 14 CreatePass
./ng net.accelbyte.sdk.cli.Main seasonpass createPass \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'cOE1akho' \
    --body '{"autoEnroll": true, "code": "giR2y2i7", "displayOrder": 24, "images": [{"as": "AJTyya8I", "caption": "67oprCmv", "height": 60, "imageUrl": "vkuAdzG2", "smallImageUrl": "xVW7aXep", "width": 87}, {"as": "AWEBPZvY", "caption": "E8etbs97", "height": 39, "imageUrl": "slLEBarF", "smallImageUrl": "NKAlx2MK", "width": 83}, {"as": "9nJwAlDB", "caption": "TCmmTk2j", "height": 35, "imageUrl": "OSxwm2I9", "smallImageUrl": "8fofs848", "width": 51}], "localizations": {"4SsDMnXC": {"description": "d6zD2R9f", "title": "55qVJOSi"}, "i5RJb4Fg": {"description": "4VFLWrS9", "title": "RLRPTOmY"}, "muoQwXw1": {"description": "4GScqKgP", "title": "n2vEmSs1"}}, "passItemId": "E5HqzNQB"}' \
    > test.out 2>&1
eval_tap $? 14 'CreatePass' test.out

#- 15 GetPass
./ng net.accelbyte.sdk.cli.Main seasonpass getPass \
    --code '3Qe3NhNR' \
    --namespace "$AB_NAMESPACE" \
    --seasonId '1SUJNZOt' \
    > test.out 2>&1
eval_tap $? 15 'GetPass' test.out

#- 16 DeletePass
./ng net.accelbyte.sdk.cli.Main seasonpass deletePass \
    --code 'CL5IP5dh' \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'yzN0qr16' \
    > test.out 2>&1
eval_tap $? 16 'DeletePass' test.out

#- 17 UpdatePass
./ng net.accelbyte.sdk.cli.Main seasonpass updatePass \
    --code '8Qz0h3zG' \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'EVhkUSuU' \
    --body '{"autoEnroll": true, "displayOrder": 71, "images": [{"as": "6SyW3Ren", "caption": "1JWGYCVD", "height": 21, "imageUrl": "4d242H6D", "smallImageUrl": "pApvWT3E", "width": 20}, {"as": "etR95Mx7", "caption": "HFSUVuu3", "height": 34, "imageUrl": "1xyb6H9Z", "smallImageUrl": "GfLDYugF", "width": 12}, {"as": "M9fQYMyr", "caption": "YQ0FEhzL", "height": 49, "imageUrl": "gQIQ00Pe", "smallImageUrl": "a05Xgafr", "width": 19}], "localizations": {"1KTVzGgo": {"description": "geZe7nX5", "title": "mihGlgyg"}, "s8cnlnke": {"description": "aAPJR5lR", "title": "KdsKgcFF"}, "IDXxMFfK": {"description": "sOoKshI9", "title": "P1PTlWfJ"}}, "passItemId": "XFVmWNyd"}' \
    > test.out 2>&1
eval_tap $? 17 'UpdatePass' test.out

#- 18 PublishSeason
./ng net.accelbyte.sdk.cli.Main seasonpass publishSeason \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'UZc2HeYt' \
    > test.out 2>&1
eval_tap $? 18 'PublishSeason' test.out

#- 19 RetireSeason
./ng net.accelbyte.sdk.cli.Main seasonpass retireSeason \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'iPrZSPO5' \
    --force  \
    > test.out 2>&1
eval_tap $? 19 'RetireSeason' test.out

#- 20 QueryRewards
./ng net.accelbyte.sdk.cli.Main seasonpass queryRewards \
    --namespace "$AB_NAMESPACE" \
    --seasonId '3Kkjqtzo' \
    --q 'fUdlzuJ8' \
    > test.out 2>&1
eval_tap $? 20 'QueryRewards' test.out

#- 21 CreateReward
./ng net.accelbyte.sdk.cli.Main seasonpass createReward \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'SsjYDmEn' \
    --body '{"code": "BunbM7pA", "currency": {"currencyCode": "5t9xLmiK", "namespace": "p1VZ8hyR"}, "image": {"as": "ow4g1dPB", "caption": "WyvtrB5c", "height": 5, "imageUrl": "vR6K9DLq", "smallImageUrl": "MJSoTybF", "width": 12}, "itemId": "rz6TVEYm", "quantity": 48, "type": "CURRENCY"}' \
    > test.out 2>&1
eval_tap $? 21 'CreateReward' test.out

#- 22 GetReward
./ng net.accelbyte.sdk.cli.Main seasonpass getReward \
    --code 'KiqURLGJ' \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'ZcHmSEu6' \
    > test.out 2>&1
eval_tap $? 22 'GetReward' test.out

#- 23 DeleteReward
./ng net.accelbyte.sdk.cli.Main seasonpass deleteReward \
    --code 'RAum9wAn' \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'zZ42T6Q6' \
    > test.out 2>&1
eval_tap $? 23 'DeleteReward' test.out

#- 24 UpdateReward
./ng net.accelbyte.sdk.cli.Main seasonpass updateReward \
    --code 'LbcDa0ua' \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'ZXSeQajK' \
    --body '{"currency": {"currencyCode": "8ERDn1nF", "namespace": "E8Yh2imz"}, "image": {"as": "IFWSU7Lc", "caption": "BJZRodWc", "height": 7, "imageUrl": "KjpQpgZJ", "smallImageUrl": "vJicCsR0", "width": 8}, "itemId": "ejpPxOF7", "nullFields": ["QIz6WiSL", "kqOguGGp", "quleqc7v"], "quantity": 74, "type": "ITEM"}' \
    > test.out 2>&1
eval_tap $? 24 'UpdateReward' test.out

#- 25 QueryTiers
./ng net.accelbyte.sdk.cli.Main seasonpass queryTiers \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'ECA2gqFl' \
    --limit '0' \
    --offset '36' \
    > test.out 2>&1
eval_tap $? 25 'QueryTiers' test.out

#- 26 CreateTier
./ng net.accelbyte.sdk.cli.Main seasonpass createTier \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'vSWbTEQs' \
    --body '{"index": 39, "quantity": 40, "tier": {"requiredExp": 66, "rewards": {"K8CHhDl2": ["r1cxS9Ny", "cAsBaOGV", "NOChM96s"], "BdhAdH2M": ["kgKgBVkr", "NmYEYsNf", "PzIbWJUq"], "2W2JaKiq": ["mRl2zKT9", "Ge7Pn5xM", "9e1FNtKf"]}}}' \
    > test.out 2>&1
eval_tap $? 26 'CreateTier' test.out

#- 27 UpdateTier
./ng net.accelbyte.sdk.cli.Main seasonpass updateTier \
    --id 'HmGNfZFI' \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'aobRgv05' \
    --body '{"requiredExp": 36, "rewards": {"id4mdOdU": ["v91K6WM9", "NB1Z6V4d", "eAWtRJ89"], "ZhbRFGjU": ["8afdPvgA", "0CMBHLJ3", "5PH8z3rv"], "txr4arOO": ["5dP2a8uV", "kfWJckcL", "JAXILxll"]}}' \
    > test.out 2>&1
eval_tap $? 27 'UpdateTier' test.out

#- 28 DeleteTier
./ng net.accelbyte.sdk.cli.Main seasonpass deleteTier \
    --id 'zXely6ow' \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'UevxJVHM' \
    > test.out 2>&1
eval_tap $? 28 'DeleteTier' test.out

#- 29 ReorderTier
./ng net.accelbyte.sdk.cli.Main seasonpass reorderTier \
    --id 'hBJQ63nx' \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'Ic8Xn6Iq' \
    --body '{"newIndex": 64}' \
    > test.out 2>&1
eval_tap $? 29 'ReorderTier' test.out

#- 30 UnpublishSeason
./ng net.accelbyte.sdk.cli.Main seasonpass unpublishSeason \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'WaXbWDkY' \
    --force  \
    > test.out 2>&1
eval_tap $? 30 'UnpublishSeason' test.out

#- 31 GetUserParticipatedSeasons
./ng net.accelbyte.sdk.cli.Main seasonpass getUserParticipatedSeasons \
    --namespace "$AB_NAMESPACE" \
    --userId 'ioccOOeg' \
    --limit '92' \
    --offset '21' \
    > test.out 2>&1
eval_tap $? 31 'GetUserParticipatedSeasons' test.out

#- 32 GrantUserExp
./ng net.accelbyte.sdk.cli.Main seasonpass grantUserExp \
    --namespace "$AB_NAMESPACE" \
    --userId '1EavTksw' \
    --body '{"exp": 41, "source": "SWEAT", "tags": ["deiMQs8m", "Clwh10x1", "TbxeCiTO"]}' \
    > test.out 2>&1
eval_tap $? 32 'GrantUserExp' test.out

#- 33 GrantUserPass
./ng net.accelbyte.sdk.cli.Main seasonpass grantUserPass \
    --namespace "$AB_NAMESPACE" \
    --userId 'OFxVTFbi' \
    --body '{"passCode": "BdeQ6528", "passItemId": "X8pPFAj7"}' \
    > test.out 2>&1
eval_tap $? 33 'GrantUserPass' test.out

#- 34 ExistsAnyPassByPassCodes
./ng net.accelbyte.sdk.cli.Main seasonpass existsAnyPassByPassCodes \
    --namespace "$AB_NAMESPACE" \
    --userId 'OTmPSCFK' \
    --passCodes '7V5QK7cx,shx8Eqz0,4FSEvNmF' \
    > test.out 2>&1
eval_tap $? 34 'ExistsAnyPassByPassCodes' test.out

#- 35 GetCurrentUserSeasonProgression
./ng net.accelbyte.sdk.cli.Main seasonpass getCurrentUserSeasonProgression \
    --namespace "$AB_NAMESPACE" \
    --userId '6f64CHL8' \
    > test.out 2>&1
eval_tap $? 35 'GetCurrentUserSeasonProgression' test.out

#- 36 CheckSeasonPurchasable
./ng net.accelbyte.sdk.cli.Main seasonpass checkSeasonPurchasable \
    --namespace "$AB_NAMESPACE" \
    --userId 'zhLwDa1U' \
    --body '{"passItemId": "PQ2lxVXS", "tierItemCount": 35, "tierItemId": "zX8IrIbT"}' \
    > test.out 2>&1
eval_tap $? 36 'CheckSeasonPurchasable' test.out

#- 37 ResetUserSeason
./ng net.accelbyte.sdk.cli.Main seasonpass resetUserSeason \
    --namespace "$AB_NAMESPACE" \
    --userId 'hf5HQPen' \
    > test.out 2>&1
eval_tap $? 37 'ResetUserSeason' test.out

#- 38 GrantUserTier
./ng net.accelbyte.sdk.cli.Main seasonpass grantUserTier \
    --namespace "$AB_NAMESPACE" \
    --userId 'W45AjsZR' \
    --body '{"count": 52, "source": "SWEAT", "tags": ["kthHDSSQ", "MPrAWSjc", "3pUaXJV2"]}' \
    > test.out 2>&1
eval_tap $? 38 'GrantUserTier' test.out

#- 39 QueryUserExpGrantHistory
./ng net.accelbyte.sdk.cli.Main seasonpass queryUserExpGrantHistory \
    --namespace "$AB_NAMESPACE" \
    --userId '2o6P9nG2' \
    --from 'Nmf8tXQb' \
    --limit '53' \
    --offset '7' \
    --seasonId 'aJgSwwoh' \
    --source 'SWEAT' \
    --tags '6MWJU6Ik,2lHyjjDA,b8xxejAB' \
    --to 'HkWS4j6q' \
    > test.out 2>&1
eval_tap $? 39 'QueryUserExpGrantHistory' test.out

#- 40 QueryUserExpGrantHistoryTag
./ng net.accelbyte.sdk.cli.Main seasonpass queryUserExpGrantHistoryTag \
    --namespace "$AB_NAMESPACE" \
    --userId 'nWqHoIaz' \
    --seasonId 'trIWlFRm' \
    > test.out 2>&1
eval_tap $? 40 'QueryUserExpGrantHistoryTag' test.out

#- 41 GetUserSeason
./ng net.accelbyte.sdk.cli.Main seasonpass getUserSeason \
    --namespace "$AB_NAMESPACE" \
    --seasonId '872yYpZT' \
    --userId 'yuSLz74i' \
    > test.out 2>&1
eval_tap $? 41 'GetUserSeason' test.out

#- 42 PublicGetCurrentSeason
./ng net.accelbyte.sdk.cli.Main seasonpass publicGetCurrentSeason \
    --namespace "$AB_NAMESPACE" \
    --language 'ECov5wvz' \
    > test.out 2>&1
eval_tap $? 42 'PublicGetCurrentSeason' test.out

#- 43 PublicGetCurrentUserSeason
./ng net.accelbyte.sdk.cli.Main seasonpass publicGetCurrentUserSeason \
    --namespace "$AB_NAMESPACE" \
    --userId 'I8f1FjOC' \
    > test.out 2>&1
eval_tap $? 43 'PublicGetCurrentUserSeason' test.out

#- 44 PublicClaimUserReward
./ng net.accelbyte.sdk.cli.Main seasonpass publicClaimUserReward \
    --namespace "$AB_NAMESPACE" \
    --userId '9q5mcfnU' \
    --body '{"passCode": "tUdNK8ea", "rewardCode": "3RQdj9Lt", "tierIndex": 100}' \
    > test.out 2>&1
eval_tap $? 44 'PublicClaimUserReward' test.out

#- 45 PublicBulkClaimUserRewards
./ng net.accelbyte.sdk.cli.Main seasonpass publicBulkClaimUserRewards \
    --namespace "$AB_NAMESPACE" \
    --userId '3bIzahNb' \
    > test.out 2>&1
eval_tap $? 45 'PublicBulkClaimUserRewards' test.out

#- 46 PublicGetUserSeason
./ng net.accelbyte.sdk.cli.Main seasonpass publicGetUserSeason \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'RIuTAX6g' \
    --userId 'K78XFTzX' \
    > test.out 2>&1
eval_tap $? 46 'PublicGetUserSeason' test.out


rm -f "tmp.dat"

exit $EXIT_CODE