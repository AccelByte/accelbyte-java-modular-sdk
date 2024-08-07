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
    --limit '27' \
    --offset '46' \
    --status 'DRAFT,DRAFT,DRAFT' \
    > test.out 2>&1
eval_tap $? 3 'QuerySeasons' test.out

#- 4 CreateSeason
./ng net.accelbyte.sdk.cli.Main seasonpass createSeason \
    --namespace "$AB_NAMESPACE" \
    --body '{"autoClaim": false, "defaultLanguage": "pAaww2PI", "defaultRequiredExp": 29, "draftStoreId": "GmJnhlaM", "end": "1982-09-17T00:00:00Z", "excessStrategy": {"currency": "Ap3Wvcpg", "method": "NONE", "percentPerExp": 21}, "images": [{"as": "XWxrpv3K", "caption": "5yYZPITo", "height": 11, "imageUrl": "DJhGrPv5", "smallImageUrl": "D4uK8y2h", "width": 85}, {"as": "PM3HFce5", "caption": "fRg7qN3B", "height": 41, "imageUrl": "cDE1wjq6", "smallImageUrl": "NSJDtI6J", "width": 80}, {"as": "e5Jyzn4O", "caption": "XXnbtrxJ", "height": 69, "imageUrl": "9fT6fVwr", "smallImageUrl": "ByZ0DyvJ", "width": 35}], "localizations": {"82iCCQob": {"description": "hA9PMXOz", "title": "ULZ3C7nI"}, "hYE0P6oq": {"description": "YAZwLnSc", "title": "bujl7st7"}, "5QlPjSz9": {"description": "sMxG2qDq", "title": "vHdvgayA"}}, "name": "xVsasxMJ", "start": "1996-10-21T00:00:00Z", "tierItemId": "TB0tkEEr"}' \
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
    --body '{"userIds": ["6vRAaYdL", "qETIVUkn", "znZCEbfQ"]}' \
    > test.out 2>&1
eval_tap $? 6 'BulkGetUserSeasonProgression' test.out

#- 7 GetSeason
./ng net.accelbyte.sdk.cli.Main seasonpass getSeason \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'ZN5PBXAH' \
    > test.out 2>&1
eval_tap $? 7 'GetSeason' test.out

#- 8 DeleteSeason
./ng net.accelbyte.sdk.cli.Main seasonpass deleteSeason \
    --namespace "$AB_NAMESPACE" \
    --seasonId '7dNB4zkU' \
    > test.out 2>&1
eval_tap $? 8 'DeleteSeason' test.out

#- 9 UpdateSeason
./ng net.accelbyte.sdk.cli.Main seasonpass updateSeason \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'ItOUTCKj' \
    --body '{"autoClaim": true, "defaultLanguage": "ygSKMrRC", "defaultRequiredExp": 81, "draftStoreId": "vz3KLSPc", "end": "1988-09-16T00:00:00Z", "excessStrategy": {"currency": "WvcNlFGa", "method": "NONE", "percentPerExp": 77}, "images": [{"as": "rNBJ28cu", "caption": "GjuQBQVe", "height": 30, "imageUrl": "KDb9xWqP", "smallImageUrl": "SpZgY8Kj", "width": 35}, {"as": "IN0E5rq3", "caption": "HQRViaqy", "height": 57, "imageUrl": "ZrZrGy4o", "smallImageUrl": "l2Y0ceGn", "width": 44}, {"as": "lONrNbar", "caption": "UWQTKG7f", "height": 95, "imageUrl": "Fw4xOaMB", "smallImageUrl": "3nqoh4WS", "width": 8}], "localizations": {"UpY39ENV": {"description": "dBD6VXCV", "title": "2hVaggll"}, "d3LH2C0v": {"description": "g33WQjQA", "title": "D2UotOG1"}, "aV7th6Xt": {"description": "oUloiRrB", "title": "QkufFH2c"}}, "name": "CcHdIhZM", "start": "1978-10-12T00:00:00Z", "tierItemId": "VoC9tdTP"}' \
    > test.out 2>&1
eval_tap $? 9 'UpdateSeason' test.out

#- 10 CloneSeason
./ng net.accelbyte.sdk.cli.Main seasonpass cloneSeason \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'VqN79fuK' \
    --body '{"end": "1975-06-17T00:00:00Z", "name": "Nh2VgwuG", "start": "1994-07-07T00:00:00Z"}' \
    > test.out 2>&1
eval_tap $? 10 'CloneSeason' test.out

#- 11 GetFullSeason
./ng net.accelbyte.sdk.cli.Main seasonpass getFullSeason \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'prJeXLUQ' \
    > test.out 2>&1
eval_tap $? 11 'GetFullSeason' test.out

#- 12 QueryPasses
./ng net.accelbyte.sdk.cli.Main seasonpass queryPasses \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'H0uZvbIm' \
    > test.out 2>&1
eval_tap $? 12 'QueryPasses' test.out

#- 13 CreatePass
./ng net.accelbyte.sdk.cli.Main seasonpass createPass \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'Xld0PWdp' \
    --body '{"autoEnroll": false, "code": "jFWUuNEc", "displayOrder": 2, "images": [{"as": "V84e4evl", "caption": "algUJLUN", "height": 47, "imageUrl": "12UCUzED", "smallImageUrl": "A1k55aIu", "width": 0}, {"as": "VwcRyo66", "caption": "Rfz8M1hv", "height": 36, "imageUrl": "K2E9nybJ", "smallImageUrl": "wor1JL2k", "width": 89}, {"as": "oPwOoiO2", "caption": "vO1ND3dt", "height": 88, "imageUrl": "ATvb3fTt", "smallImageUrl": "GPQl6svx", "width": 19}], "localizations": {"LMucjjOA": {"description": "poik34Na", "title": "5UmdQUAc"}, "0oDO5I8D": {"description": "KYW7Tg6w", "title": "z6H6mqFF"}, "RrIWDLm0": {"description": "rwlJGS9m", "title": "sJaR85ry"}}, "passItemId": "DZNRoeLn"}' \
    > test.out 2>&1
eval_tap $? 13 'CreatePass' test.out

#- 14 GetPass
./ng net.accelbyte.sdk.cli.Main seasonpass getPass \
    --code 'Nb7zDXMM' \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'ULvEJRQe' \
    > test.out 2>&1
eval_tap $? 14 'GetPass' test.out

#- 15 DeletePass
./ng net.accelbyte.sdk.cli.Main seasonpass deletePass \
    --code 'yl6eYOjw' \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'OpQcNrA8' \
    > test.out 2>&1
eval_tap $? 15 'DeletePass' test.out

#- 16 UpdatePass
./ng net.accelbyte.sdk.cli.Main seasonpass updatePass \
    --code 'HPCMs09K' \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'SDVYDDAw' \
    --body '{"autoEnroll": false, "displayOrder": 28, "images": [{"as": "9ySl0pr1", "caption": "3Kugn2Fu", "height": 30, "imageUrl": "kj1EgKLI", "smallImageUrl": "PKPgL2Lf", "width": 65}, {"as": "LL3jl7X4", "caption": "Dx6xmdVo", "height": 81, "imageUrl": "ktmCWnXX", "smallImageUrl": "ylce6QeM", "width": 56}, {"as": "uCQ9Up7C", "caption": "jibbj9k4", "height": 94, "imageUrl": "ruTzlOeu", "smallImageUrl": "OSS1dYIs", "width": 73}], "localizations": {"VB9wtRO4": {"description": "ElYPRPgq", "title": "hBv3Shw3"}, "FIpNTOQO": {"description": "dqoEiAYz", "title": "CO870ffJ"}, "KQJ9oQMD": {"description": "KXXgJ6OE", "title": "Gv5UKLUM"}}, "passItemId": "eZNiQOif"}' \
    > test.out 2>&1
eval_tap $? 16 'UpdatePass' test.out

#- 17 PublishSeason
./ng net.accelbyte.sdk.cli.Main seasonpass publishSeason \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'Ad14UcXz' \
    > test.out 2>&1
eval_tap $? 17 'PublishSeason' test.out

#- 18 RetireSeason
./ng net.accelbyte.sdk.cli.Main seasonpass retireSeason \
    --namespace "$AB_NAMESPACE" \
    --seasonId '7W3RmNL5' \
    --force  \
    > test.out 2>&1
eval_tap $? 18 'RetireSeason' test.out

#- 19 QueryRewards
./ng net.accelbyte.sdk.cli.Main seasonpass queryRewards \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'DCV7kShF' \
    --q 'khdbkfpU' \
    > test.out 2>&1
eval_tap $? 19 'QueryRewards' test.out

#- 20 CreateReward
./ng net.accelbyte.sdk.cli.Main seasonpass createReward \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'i7D8UV10' \
    --body '{"code": "qDCCF9ye", "currency": {"currencyCode": "086gA7b5", "namespace": "wNGYK4P0"}, "image": {"as": "F2ghLNbu", "caption": "KJFiPPAt", "height": 66, "imageUrl": "7qjWdqCM", "smallImageUrl": "IXVYoRFG", "width": 51}, "itemId": "E5wLtISg", "quantity": 38, "type": "ITEM"}' \
    > test.out 2>&1
eval_tap $? 20 'CreateReward' test.out

#- 21 GetReward
./ng net.accelbyte.sdk.cli.Main seasonpass getReward \
    --code 'OrkkkbhZ' \
    --namespace "$AB_NAMESPACE" \
    --seasonId '4L5hTsER' \
    > test.out 2>&1
eval_tap $? 21 'GetReward' test.out

#- 22 DeleteReward
./ng net.accelbyte.sdk.cli.Main seasonpass deleteReward \
    --code '3BiyI6JZ' \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'TBJBrhuZ' \
    > test.out 2>&1
eval_tap $? 22 'DeleteReward' test.out

#- 23 UpdateReward
./ng net.accelbyte.sdk.cli.Main seasonpass updateReward \
    --code 'AUAMgZhl' \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'KQTNBfhk' \
    --body '{"currency": {"currencyCode": "zBddFcte", "namespace": "hZ0tPIrG"}, "image": {"as": "benSS8F2", "caption": "roRvSRnq", "height": 88, "imageUrl": "66774cPQ", "smallImageUrl": "KmvZ2toi", "width": 59}, "itemId": "AA7rzNL3", "nullFields": ["kOamwY4e", "4bpjCg7m", "pj8OOd49"], "quantity": 84, "type": "ITEM"}' \
    > test.out 2>&1
eval_tap $? 23 'UpdateReward' test.out

#- 24 QueryTiers
./ng net.accelbyte.sdk.cli.Main seasonpass queryTiers \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'M3N1dTdx' \
    --limit '80' \
    --offset '51' \
    > test.out 2>&1
eval_tap $? 24 'QueryTiers' test.out

#- 25 CreateTier
./ng net.accelbyte.sdk.cli.Main seasonpass createTier \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'GXCsBpRS' \
    --body '{"index": 95, "quantity": 9, "tier": {"requiredExp": 85, "rewards": {"lH4HvMY3": ["pBxvEtwK", "QUgww8re", "dF3xjERa"], "iSbchrKF": ["wW1TKG4n", "xrwVMiF1", "kzY4dVQL"], "JAwZ9oGD": ["gDpjSOCK", "KdekjAHD", "GWwpMjhS"]}}}' \
    > test.out 2>&1
eval_tap $? 25 'CreateTier' test.out

#- 26 UpdateTier
./ng net.accelbyte.sdk.cli.Main seasonpass updateTier \
    --id 'sqDqofkI' \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'a25bo52w' \
    --body '{"requiredExp": 44, "rewards": {"Rkg0EvGE": ["lwqKqLmU", "yTqjYAZ3", "RyJ46KeP"], "gKCCjuSn": ["9opZsFZc", "7Oid6y6U", "gqF5IeT9"], "R6AKgHez": ["Oxh2BhRJ", "ELwdgukf", "4ATqD9TF"]}}' \
    > test.out 2>&1
eval_tap $? 26 'UpdateTier' test.out

#- 27 DeleteTier
./ng net.accelbyte.sdk.cli.Main seasonpass deleteTier \
    --id '9YrASZhG' \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'A2j0VLud' \
    > test.out 2>&1
eval_tap $? 27 'DeleteTier' test.out

#- 28 ReorderTier
./ng net.accelbyte.sdk.cli.Main seasonpass reorderTier \
    --id 'ZmR45Zif' \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'vilkXN1X' \
    --body '{"newIndex": 61}' \
    > test.out 2>&1
eval_tap $? 28 'ReorderTier' test.out

#- 29 UnpublishSeason
./ng net.accelbyte.sdk.cli.Main seasonpass unpublishSeason \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'WHLexPQI' \
    --force  \
    > test.out 2>&1
eval_tap $? 29 'UnpublishSeason' test.out

#- 30 GetUserParticipatedSeasons
./ng net.accelbyte.sdk.cli.Main seasonpass getUserParticipatedSeasons \
    --namespace "$AB_NAMESPACE" \
    --userId 'P4UFzOt4' \
    --limit '8' \
    --offset '11' \
    > test.out 2>&1
eval_tap $? 30 'GetUserParticipatedSeasons' test.out

#- 31 GrantUserExp
./ng net.accelbyte.sdk.cli.Main seasonpass grantUserExp \
    --namespace "$AB_NAMESPACE" \
    --userId '13yEWeXC' \
    --body '{"exp": 38, "source": "PAID_FOR", "tags": ["GI54RfPi", "LDYgvoA7", "NumrXMtI"]}' \
    > test.out 2>&1
eval_tap $? 31 'GrantUserExp' test.out

#- 32 GrantUserPass
./ng net.accelbyte.sdk.cli.Main seasonpass grantUserPass \
    --namespace "$AB_NAMESPACE" \
    --userId 'ogcFDTpX' \
    --body '{"passCode": "KKdilHcL", "passItemId": "uzdGwU75"}' \
    > test.out 2>&1
eval_tap $? 32 'GrantUserPass' test.out

#- 33 ExistsAnyPassByPassCodes
./ng net.accelbyte.sdk.cli.Main seasonpass existsAnyPassByPassCodes \
    --namespace "$AB_NAMESPACE" \
    --userId 'JPANmyOd' \
    --passCodes 'XFJQqkY6,VgmB68AT,mAanlC8C' \
    > test.out 2>&1
eval_tap $? 33 'ExistsAnyPassByPassCodes' test.out

#- 34 GetCurrentUserSeasonProgression
./ng net.accelbyte.sdk.cli.Main seasonpass getCurrentUserSeasonProgression \
    --namespace "$AB_NAMESPACE" \
    --userId 'VuYJfWdd' \
    > test.out 2>&1
eval_tap $? 34 'GetCurrentUserSeasonProgression' test.out

#- 35 CheckSeasonPurchasable
./ng net.accelbyte.sdk.cli.Main seasonpass checkSeasonPurchasable \
    --namespace "$AB_NAMESPACE" \
    --userId 'dlobUxP8' \
    --body '{"passItemId": "3ntbjawI", "tierItemCount": 39, "tierItemId": "eGzXhbw0"}' \
    > test.out 2>&1
eval_tap $? 35 'CheckSeasonPurchasable' test.out

#- 36 ResetUserSeason
./ng net.accelbyte.sdk.cli.Main seasonpass resetUserSeason \
    --namespace "$AB_NAMESPACE" \
    --userId 'CWIE1GVP' \
    > test.out 2>&1
eval_tap $? 36 'ResetUserSeason' test.out

#- 37 GrantUserTier
./ng net.accelbyte.sdk.cli.Main seasonpass grantUserTier \
    --namespace "$AB_NAMESPACE" \
    --userId 'yQVzHRvx' \
    --body '{"count": 70, "source": "PAID_FOR", "tags": ["QykUJt5V", "opKUP2C8", "EIAZR6hh"]}' \
    > test.out 2>&1
eval_tap $? 37 'GrantUserTier' test.out

#- 38 QueryUserExpGrantHistory
./ng net.accelbyte.sdk.cli.Main seasonpass queryUserExpGrantHistory \
    --namespace "$AB_NAMESPACE" \
    --userId 'fDjBwDpe' \
    --from 'BbYFYGhZ' \
    --limit '95' \
    --offset '9' \
    --seasonId '8Q6Tf2XD' \
    --source 'PAID_FOR' \
    --tags '1eC2oh5a,ZhKoE6UL,Fa8yxOrB' \
    --to 'vycbE56A' \
    > test.out 2>&1
eval_tap $? 38 'QueryUserExpGrantHistory' test.out

#- 39 QueryUserExpGrantHistoryTag
./ng net.accelbyte.sdk.cli.Main seasonpass queryUserExpGrantHistoryTag \
    --namespace "$AB_NAMESPACE" \
    --userId 'oj7b5DXP' \
    --seasonId 'j7FC7fwa' \
    > test.out 2>&1
eval_tap $? 39 'QueryUserExpGrantHistoryTag' test.out

#- 40 GetUserSeason
./ng net.accelbyte.sdk.cli.Main seasonpass getUserSeason \
    --namespace "$AB_NAMESPACE" \
    --seasonId '10rzYtCC' \
    --userId 'MJoEIpMn' \
    > test.out 2>&1
eval_tap $? 40 'GetUserSeason' test.out

#- 41 PublicGetCurrentSeason
./ng net.accelbyte.sdk.cli.Main seasonpass publicGetCurrentSeason \
    --namespace "$AB_NAMESPACE" \
    --language 'cjMd8qcg' \
    > test.out 2>&1
eval_tap $? 41 'PublicGetCurrentSeason' test.out

#- 42 PublicGetCurrentUserSeason
./ng net.accelbyte.sdk.cli.Main seasonpass publicGetCurrentUserSeason \
    --namespace "$AB_NAMESPACE" \
    --userId 'Sg43AhIZ' \
    > test.out 2>&1
eval_tap $? 42 'PublicGetCurrentUserSeason' test.out

#- 43 PublicClaimUserReward
./ng net.accelbyte.sdk.cli.Main seasonpass publicClaimUserReward \
    --namespace "$AB_NAMESPACE" \
    --userId 'hvN30t7s' \
    --body '{"passCode": "7kryzxkl", "rewardCode": "yuP8xtVc", "tierIndex": 17}' \
    > test.out 2>&1
eval_tap $? 43 'PublicClaimUserReward' test.out

#- 44 PublicBulkClaimUserRewards
./ng net.accelbyte.sdk.cli.Main seasonpass publicBulkClaimUserRewards \
    --namespace "$AB_NAMESPACE" \
    --userId 'bAR6NQNG' \
    > test.out 2>&1
eval_tap $? 44 'PublicBulkClaimUserRewards' test.out

#- 45 PublicGetUserSeason
./ng net.accelbyte.sdk.cli.Main seasonpass publicGetUserSeason \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'w4u5O7Yn' \
    --userId 'aBDhIEJA' \
    > test.out 2>&1
eval_tap $? 45 'PublicGetUserSeason' test.out


rm -f "tmp.dat"

exit $EXIT_CODE