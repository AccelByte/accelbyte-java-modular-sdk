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
    --limit '80' \
    --offset '72' \
    --status 'RETIRED,DRAFT,PUBLISHED' \
    > test.out 2>&1
eval_tap $? 3 'QuerySeasons' test.out

#- 4 CreateSeason
./ng net.accelbyte.sdk.cli.Main seasonpass createSeason \
    --namespace "$AB_NAMESPACE" \
    --body '{"autoClaim": true, "defaultLanguage": "Amq5dL0l", "defaultRequiredExp": 42, "draftStoreId": "91bFEzgF", "end": "1989-10-14T00:00:00Z", "excessStrategy": {"currency": "oI6Wc84L", "method": "CURRENCY", "percentPerExp": 98}, "images": [{"as": "nM6A9RVi", "caption": "z5B8Jpjt", "height": 0, "imageUrl": "oHyuYPrR", "smallImageUrl": "8UM6c4AR", "width": 45}, {"as": "s5m1Ssek", "caption": "fibznQCw", "height": 58, "imageUrl": "oGH8N540", "smallImageUrl": "loCg1QVN", "width": 69}, {"as": "CIh1ebJP", "caption": "GUnmg8o7", "height": 17, "imageUrl": "1ilY2BZv", "smallImageUrl": "dRns8HTw", "width": 5}], "localizations": {"MZg0nc0A": {"description": "PXoE7Pyk", "title": "fnIHsBL3"}, "6WscX0cV": {"description": "ZnDlyVi2", "title": "KIx9sfnA"}, "zV6Kez9Z": {"description": "pthZ9ZdJ", "title": "5dzRw81X"}}, "name": "2KPukM0A", "start": "1994-01-18T00:00:00Z", "tierItemId": "7FjBjehK"}' \
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
    --body '{"userIds": ["04POOSzD", "tO4G8kaZ", "C9Zet7ot"]}' \
    > test.out 2>&1
eval_tap $? 6 'BulkGetUserSeasonProgression' test.out

#- 7 GetSeason
./ng net.accelbyte.sdk.cli.Main seasonpass getSeason \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'lKrqwshM' \
    > test.out 2>&1
eval_tap $? 7 'GetSeason' test.out

#- 8 DeleteSeason
./ng net.accelbyte.sdk.cli.Main seasonpass deleteSeason \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'Rw03hFau' \
    > test.out 2>&1
eval_tap $? 8 'DeleteSeason' test.out

#- 9 UpdateSeason
./ng net.accelbyte.sdk.cli.Main seasonpass updateSeason \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'bx5VzEvU' \
    --body '{"autoClaim": true, "defaultLanguage": "p0cGNjGC", "defaultRequiredExp": 50, "draftStoreId": "RkzWBcFE", "end": "1989-10-02T00:00:00Z", "excessStrategy": {"currency": "ugx0Pjwz", "method": "NONE", "percentPerExp": 58}, "images": [{"as": "INMLwaWZ", "caption": "ohyK2lCI", "height": 73, "imageUrl": "d0s28f7g", "smallImageUrl": "EaOP9417", "width": 23}, {"as": "H6JEhZJ0", "caption": "Tck4zYRt", "height": 15, "imageUrl": "7fCLXCol", "smallImageUrl": "hhPH5Uym", "width": 45}, {"as": "ffyIm3iT", "caption": "75pHXNe0", "height": 84, "imageUrl": "ismiZYK8", "smallImageUrl": "FpdREiGD", "width": 4}], "localizations": {"UmJM5PGP": {"description": "HOjLiCg4", "title": "NDwX0qBO"}, "HcMcfydF": {"description": "D51sQcaE", "title": "t9d8zRFf"}, "CfUrzUTA": {"description": "5eppukSD", "title": "xwLRhAg8"}}, "name": "0LgbdmxJ", "start": "1981-12-23T00:00:00Z", "tierItemId": "SdEKquRT"}' \
    > test.out 2>&1
eval_tap $? 9 'UpdateSeason' test.out

#- 10 CloneSeason
./ng net.accelbyte.sdk.cli.Main seasonpass cloneSeason \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'uJ94whJx' \
    --body '{"end": "1991-08-17T00:00:00Z", "name": "AebRXrRH", "start": "1982-01-27T00:00:00Z"}' \
    > test.out 2>&1
eval_tap $? 10 'CloneSeason' test.out

#- 11 GetFullSeason
./ng net.accelbyte.sdk.cli.Main seasonpass getFullSeason \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'CTYcCYYX' \
    > test.out 2>&1
eval_tap $? 11 'GetFullSeason' test.out

#- 12 QueryPasses
./ng net.accelbyte.sdk.cli.Main seasonpass queryPasses \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'fP4MANAq' \
    > test.out 2>&1
eval_tap $? 12 'QueryPasses' test.out

#- 13 CreatePass
./ng net.accelbyte.sdk.cli.Main seasonpass createPass \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'Unjaxvki' \
    --body '{"autoEnroll": false, "code": "RX7TijEA", "displayOrder": 73, "images": [{"as": "iRixRJlB", "caption": "YX0fvaNJ", "height": 0, "imageUrl": "wBuPV415", "smallImageUrl": "icgvWA4s", "width": 64}, {"as": "BzsEqDdm", "caption": "q3ayYNx8", "height": 92, "imageUrl": "xOtlt9To", "smallImageUrl": "JIvmsYRS", "width": 9}, {"as": "wJ48eA4n", "caption": "K2Bj1Lwl", "height": 27, "imageUrl": "IuTaSUyY", "smallImageUrl": "9NnZx7AF", "width": 53}], "localizations": {"C8Nw65xP": {"description": "YWJwBQRk", "title": "YgxHTaur"}, "nbRqcYu1": {"description": "ZacJUjkk", "title": "lKAp8hSP"}, "SqSET6bO": {"description": "QaIxWoqh", "title": "op53YJG6"}}, "passItemId": "K5BfQR1Q"}' \
    > test.out 2>&1
eval_tap $? 13 'CreatePass' test.out

#- 14 GetPass
./ng net.accelbyte.sdk.cli.Main seasonpass getPass \
    --code 'ipWoAeJb' \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'iCDRXc9i' \
    > test.out 2>&1
eval_tap $? 14 'GetPass' test.out

#- 15 DeletePass
./ng net.accelbyte.sdk.cli.Main seasonpass deletePass \
    --code 'sEFbMkp1' \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'kvdR5zzI' \
    > test.out 2>&1
eval_tap $? 15 'DeletePass' test.out

#- 16 UpdatePass
./ng net.accelbyte.sdk.cli.Main seasonpass updatePass \
    --code 'z7Ogo7vQ' \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'm00avHZD' \
    --body '{"autoEnroll": true, "displayOrder": 64, "images": [{"as": "dOMngIqx", "caption": "33VCFyOZ", "height": 73, "imageUrl": "CGA8pyS6", "smallImageUrl": "ywbnSyaC", "width": 44}, {"as": "4ojdKNlI", "caption": "XtjBzJJJ", "height": 31, "imageUrl": "EulHwaqR", "smallImageUrl": "hmI0ek29", "width": 16}, {"as": "dkQye7HG", "caption": "Xu3vfDsG", "height": 89, "imageUrl": "Cwk4F07o", "smallImageUrl": "3mreX4xW", "width": 68}], "localizations": {"q6wrp7RV": {"description": "Z6T8CjBx", "title": "KsWYCkGc"}, "Kv1j2CQP": {"description": "767v2gUD", "title": "ZtcNaxz2"}, "E7h8FN82": {"description": "LQ4FEtfo", "title": "fST4iZlj"}}, "passItemId": "UDx1pBB8"}' \
    > test.out 2>&1
eval_tap $? 16 'UpdatePass' test.out

#- 17 PublishSeason
./ng net.accelbyte.sdk.cli.Main seasonpass publishSeason \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'P6LYmCHZ' \
    > test.out 2>&1
eval_tap $? 17 'PublishSeason' test.out

#- 18 RetireSeason
./ng net.accelbyte.sdk.cli.Main seasonpass retireSeason \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'qSDqd3x9' \
    --force  \
    > test.out 2>&1
eval_tap $? 18 'RetireSeason' test.out

#- 19 QueryRewards
./ng net.accelbyte.sdk.cli.Main seasonpass queryRewards \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'iAOGUIQ2' \
    --q 'HousIsn7' \
    > test.out 2>&1
eval_tap $? 19 'QueryRewards' test.out

#- 20 CreateReward
./ng net.accelbyte.sdk.cli.Main seasonpass createReward \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'oJQQ5z57' \
    --body '{"code": "nZKMxwmG", "currency": {"currencyCode": "V1rtUGGY", "namespace": "KsuUFvVr"}, "image": {"as": "sWFJbNS5", "caption": "xRTGHLWC", "height": 31, "imageUrl": "AsyuCvPb", "smallImageUrl": "X37CIiwe", "width": 36}, "itemId": "hZONdkAg", "quantity": 82, "type": "CURRENCY"}' \
    > test.out 2>&1
eval_tap $? 20 'CreateReward' test.out

#- 21 GetReward
./ng net.accelbyte.sdk.cli.Main seasonpass getReward \
    --code '3D6CV26k' \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'F4EbD6XF' \
    > test.out 2>&1
eval_tap $? 21 'GetReward' test.out

#- 22 DeleteReward
./ng net.accelbyte.sdk.cli.Main seasonpass deleteReward \
    --code '1v2IogGC' \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'vBQPrWFj' \
    > test.out 2>&1
eval_tap $? 22 'DeleteReward' test.out

#- 23 UpdateReward
./ng net.accelbyte.sdk.cli.Main seasonpass updateReward \
    --code 'dMIA9p5X' \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'cDs8wlw4' \
    --body '{"currency": {"currencyCode": "VdPkLQxK", "namespace": "sIe1pgQM"}, "image": {"as": "kkHcqhK6", "caption": "rpXQdXdL", "height": 7, "imageUrl": "uISyt6Do", "smallImageUrl": "HbPmwmQ7", "width": 51}, "itemId": "YLpcsrk4", "nullFields": ["WnDvTrI2", "TmhqxGId", "cWWmQq85"], "quantity": 91, "type": "ITEM"}' \
    > test.out 2>&1
eval_tap $? 23 'UpdateReward' test.out

#- 24 QueryTiers
./ng net.accelbyte.sdk.cli.Main seasonpass queryTiers \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'Jdn7LfEC' \
    --limit '31' \
    --offset '27' \
    > test.out 2>&1
eval_tap $? 24 'QueryTiers' test.out

#- 25 CreateTier
./ng net.accelbyte.sdk.cli.Main seasonpass createTier \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'QDJEtwU9' \
    --body '{"index": 91, "quantity": 21, "tier": {"requiredExp": 42, "rewards": {"RmFDFcaY": ["V717Pmty", "HsAABb0w", "L14uEMfx"], "Egk46UNo": ["1s8IDgl3", "ybWpKspa", "nU2AyuE5"], "9sk8axdl": ["qgIxQJyc", "IH5aPqrh", "PUEVUowP"]}}}' \
    > test.out 2>&1
eval_tap $? 25 'CreateTier' test.out

#- 26 UpdateTier
./ng net.accelbyte.sdk.cli.Main seasonpass updateTier \
    --id 'LpHztIgi' \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'd5sXJyIG' \
    --body '{"requiredExp": 75, "rewards": {"U6UxuNZa": ["Fnm5wmrX", "vT5Lk9ZJ", "4HGTMkwV"], "Q6faQnis": ["ixhMp4Lb", "pSPl5ZTX", "mVA03E3J"], "tAmHWZeX": ["7oU3Q5Zo", "CAsvLvut", "taUk6MNu"]}}' \
    > test.out 2>&1
eval_tap $? 26 'UpdateTier' test.out

#- 27 DeleteTier
./ng net.accelbyte.sdk.cli.Main seasonpass deleteTier \
    --id '51UUz6T6' \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'TbOtXk1b' \
    > test.out 2>&1
eval_tap $? 27 'DeleteTier' test.out

#- 28 ReorderTier
./ng net.accelbyte.sdk.cli.Main seasonpass reorderTier \
    --id 'b1tZLlsA' \
    --namespace "$AB_NAMESPACE" \
    --seasonId '8VZFbvNC' \
    --body '{"newIndex": 31}' \
    > test.out 2>&1
eval_tap $? 28 'ReorderTier' test.out

#- 29 UnpublishSeason
./ng net.accelbyte.sdk.cli.Main seasonpass unpublishSeason \
    --namespace "$AB_NAMESPACE" \
    --seasonId '2iiQ9Q66' \
    --force  \
    > test.out 2>&1
eval_tap $? 29 'UnpublishSeason' test.out

#- 30 GetUserParticipatedSeasons
./ng net.accelbyte.sdk.cli.Main seasonpass getUserParticipatedSeasons \
    --namespace "$AB_NAMESPACE" \
    --userId 'RKN39ylK' \
    --limit '4' \
    --offset '20' \
    > test.out 2>&1
eval_tap $? 30 'GetUserParticipatedSeasons' test.out

#- 31 GrantUserExp
./ng net.accelbyte.sdk.cli.Main seasonpass grantUserExp \
    --namespace "$AB_NAMESPACE" \
    --userId 'mtcBdYuv' \
    --body '{"exp": 2, "source": "PAID_FOR", "tags": ["J6MR41wA", "F64Q29Bm", "nB7CQlUw"]}' \
    > test.out 2>&1
eval_tap $? 31 'GrantUserExp' test.out

#- 32 GrantUserPass
./ng net.accelbyte.sdk.cli.Main seasonpass grantUserPass \
    --namespace "$AB_NAMESPACE" \
    --userId 'IAFy1Mkm' \
    --body '{"passCode": "hRFPLNxE", "passItemId": "tqGhYZfC"}' \
    > test.out 2>&1
eval_tap $? 32 'GrantUserPass' test.out

#- 33 ExistsAnyPassByPassCodes
./ng net.accelbyte.sdk.cli.Main seasonpass existsAnyPassByPassCodes \
    --namespace "$AB_NAMESPACE" \
    --userId '1crqR27X' \
    --passCodes '4srgdqpF,efA31i17,ETlEu3Ov' \
    > test.out 2>&1
eval_tap $? 33 'ExistsAnyPassByPassCodes' test.out

#- 34 GetCurrentUserSeasonProgression
./ng net.accelbyte.sdk.cli.Main seasonpass getCurrentUserSeasonProgression \
    --namespace "$AB_NAMESPACE" \
    --userId 'dRVD7GgM' \
    > test.out 2>&1
eval_tap $? 34 'GetCurrentUserSeasonProgression' test.out

#- 35 CheckSeasonPurchasable
./ng net.accelbyte.sdk.cli.Main seasonpass checkSeasonPurchasable \
    --namespace "$AB_NAMESPACE" \
    --userId 'x4jZyQNT' \
    --body '{"passItemId": "mHtXyn4Q", "tierItemCount": 67, "tierItemId": "QCCovoFc"}' \
    > test.out 2>&1
eval_tap $? 35 'CheckSeasonPurchasable' test.out

#- 36 ResetUserSeason
./ng net.accelbyte.sdk.cli.Main seasonpass resetUserSeason \
    --namespace "$AB_NAMESPACE" \
    --userId 'rtijJ985' \
    > test.out 2>&1
eval_tap $? 36 'ResetUserSeason' test.out

#- 37 GrantUserTier
./ng net.accelbyte.sdk.cli.Main seasonpass grantUserTier \
    --namespace "$AB_NAMESPACE" \
    --userId '8GianVww' \
    --body '{"count": 22, "source": "SWEAT", "tags": ["Nhgm8MkF", "f7vYkzVW", "TI7yFKbT"]}' \
    > test.out 2>&1
eval_tap $? 37 'GrantUserTier' test.out

#- 38 QueryUserExpGrantHistory
./ng net.accelbyte.sdk.cli.Main seasonpass queryUserExpGrantHistory \
    --namespace "$AB_NAMESPACE" \
    --userId 'vzrg1MYM' \
    --from 'YQjQVKF5' \
    --limit '82' \
    --offset '5' \
    --seasonId 'xrtVybma' \
    --source 'SWEAT' \
    --tags 'euGrqzC9,tX4PwjD6,K6c2Y5TS' \
    --to 'hCAL5sKz' \
    > test.out 2>&1
eval_tap $? 38 'QueryUserExpGrantHistory' test.out

#- 39 QueryUserExpGrantHistoryTag
./ng net.accelbyte.sdk.cli.Main seasonpass queryUserExpGrantHistoryTag \
    --namespace "$AB_NAMESPACE" \
    --userId 'mpgAxxS1' \
    --seasonId '0GwFcVmP' \
    > test.out 2>&1
eval_tap $? 39 'QueryUserExpGrantHistoryTag' test.out

#- 40 GetUserSeason
./ng net.accelbyte.sdk.cli.Main seasonpass getUserSeason \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'QXMX5Xhk' \
    --userId 'r8PKddZF' \
    > test.out 2>&1
eval_tap $? 40 'GetUserSeason' test.out

#- 41 PublicGetCurrentSeason
./ng net.accelbyte.sdk.cli.Main seasonpass publicGetCurrentSeason \
    --namespace "$AB_NAMESPACE" \
    --language '6BFTh84L' \
    > test.out 2>&1
eval_tap $? 41 'PublicGetCurrentSeason' test.out

#- 42 PublicGetCurrentUserSeason
./ng net.accelbyte.sdk.cli.Main seasonpass publicGetCurrentUserSeason \
    --namespace "$AB_NAMESPACE" \
    --userId 'v7yqU2dS' \
    > test.out 2>&1
eval_tap $? 42 'PublicGetCurrentUserSeason' test.out

#- 43 PublicClaimUserReward
./ng net.accelbyte.sdk.cli.Main seasonpass publicClaimUserReward \
    --namespace "$AB_NAMESPACE" \
    --userId 'yWMdB1EL' \
    --body '{"passCode": "YAyPkq26", "rewardCode": "71B56fQy", "tierIndex": 21}' \
    > test.out 2>&1
eval_tap $? 43 'PublicClaimUserReward' test.out

#- 44 PublicBulkClaimUserRewards
./ng net.accelbyte.sdk.cli.Main seasonpass publicBulkClaimUserRewards \
    --namespace "$AB_NAMESPACE" \
    --userId 'jfie1nWn' \
    > test.out 2>&1
eval_tap $? 44 'PublicBulkClaimUserRewards' test.out

#- 45 PublicGetUserSeason
./ng net.accelbyte.sdk.cli.Main seasonpass publicGetUserSeason \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'bkjNZbqW' \
    --userId 'd3micv7M' \
    > test.out 2>&1
eval_tap $? 45 'PublicGetUserSeason' test.out


rm -f "tmp.dat"

exit $EXIT_CODE