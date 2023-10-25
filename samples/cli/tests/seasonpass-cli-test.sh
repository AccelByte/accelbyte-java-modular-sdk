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
    --limit '74' \
    --offset '65' \
    --status 'PUBLISHED,PUBLISHED,DRAFT' \
    > test.out 2>&1
eval_tap $? 3 'QuerySeasons' test.out

#- 4 CreateSeason
./ng net.accelbyte.sdk.cli.Main seasonpass createSeason \
    --namespace "$AB_NAMESPACE" \
    --body '{"autoClaim": true, "defaultLanguage": "3xgh5hLb", "defaultRequiredExp": 81, "draftStoreId": "GhoF9rtf", "end": "1994-07-11T00:00:00Z", "excessStrategy": {"currency": "QHit7MhG", "method": "NONE", "percentPerExp": 92}, "images": [{"as": "KxcdAh1Q", "caption": "1Vp1oTDy", "height": 78, "imageUrl": "qhEkx1S5", "smallImageUrl": "XD9y9urb", "width": 90}, {"as": "DEjENJR0", "caption": "72GV94Oi", "height": 71, "imageUrl": "Iu97Dbz7", "smallImageUrl": "xm9kkjII", "width": 91}, {"as": "bSKLBKrS", "caption": "FdArmZ3A", "height": 20, "imageUrl": "8WLh1MLB", "smallImageUrl": "OZ0tt9hW", "width": 29}], "localizations": {"eJw6caGZ": {"description": "bebno4vX", "title": "S11YwElQ"}, "EEOsmcJR": {"description": "t2DKio6q", "title": "9jvHm3gy"}, "iRuo95iC": {"description": "WzJTo9qu", "title": "CTstwhPw"}}, "name": "UR7fFdcn", "start": "1985-06-13T00:00:00Z", "tierItemId": "HHGy276i"}' \
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
    --body '{"userIds": ["PbHVouER", "lGHPYBu0", "P2WEoZ6y"]}' \
    > test.out 2>&1
eval_tap $? 6 'BulkGetUserSeasonProgression' test.out

#- 7 GetSeason
./ng net.accelbyte.sdk.cli.Main seasonpass getSeason \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'Zk7xactD' \
    > test.out 2>&1
eval_tap $? 7 'GetSeason' test.out

#- 8 DeleteSeason
./ng net.accelbyte.sdk.cli.Main seasonpass deleteSeason \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'iomhFXW4' \
    > test.out 2>&1
eval_tap $? 8 'DeleteSeason' test.out

#- 9 UpdateSeason
./ng net.accelbyte.sdk.cli.Main seasonpass updateSeason \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'TtxTc9ou' \
    --body '{"autoClaim": true, "defaultLanguage": "DIckkSba", "defaultRequiredExp": 65, "draftStoreId": "y5ReOq9S", "end": "1983-08-25T00:00:00Z", "excessStrategy": {"currency": "EjkxKQZp", "method": "CURRENCY", "percentPerExp": 42}, "images": [{"as": "AIZF6zm1", "caption": "TyYyTOuD", "height": 34, "imageUrl": "U5QDyU0Q", "smallImageUrl": "dY9OeOUN", "width": 65}, {"as": "VOhVaHtS", "caption": "fBdgAcZN", "height": 66, "imageUrl": "TZWZxDsb", "smallImageUrl": "USZDxnLU", "width": 32}, {"as": "9VOUnN61", "caption": "xUJ8CsoL", "height": 25, "imageUrl": "lrIUwusO", "smallImageUrl": "TUUJHGZw", "width": 47}], "localizations": {"8dVGAhPK": {"description": "5a1urUUA", "title": "jQqCPqNC"}, "QRBUAbST": {"description": "mqkDr0Q7", "title": "xz4klLI2"}, "dR5gcFb0": {"description": "sFdqW8U6", "title": "S3rMfngf"}}, "name": "e1LWFg6j", "start": "1998-02-03T00:00:00Z", "tierItemId": "Bsd3HJUF"}' \
    > test.out 2>&1
eval_tap $? 9 'UpdateSeason' test.out

#- 10 CloneSeason
./ng net.accelbyte.sdk.cli.Main seasonpass cloneSeason \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'PjEthKJN' \
    --body '{"end": "1987-10-29T00:00:00Z", "name": "uBLONvDO", "start": "1973-09-21T00:00:00Z"}' \
    > test.out 2>&1
eval_tap $? 10 'CloneSeason' test.out

#- 11 GetFullSeason
./ng net.accelbyte.sdk.cli.Main seasonpass getFullSeason \
    --namespace "$AB_NAMESPACE" \
    --seasonId '27LGOqS4' \
    > test.out 2>&1
eval_tap $? 11 'GetFullSeason' test.out

#- 12 QueryPasses
./ng net.accelbyte.sdk.cli.Main seasonpass queryPasses \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'qVUI1PbZ' \
    > test.out 2>&1
eval_tap $? 12 'QueryPasses' test.out

#- 13 CreatePass
./ng net.accelbyte.sdk.cli.Main seasonpass createPass \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'gywzGcW2' \
    --body '{"autoEnroll": false, "code": "pGcnTSoX", "displayOrder": 65, "images": [{"as": "IH5Tq824", "caption": "4HMfdNzm", "height": 94, "imageUrl": "3JdPSl3G", "smallImageUrl": "6txHF5Ik", "width": 62}, {"as": "KqPzNflu", "caption": "T9W9FJj1", "height": 54, "imageUrl": "s5dB3o4X", "smallImageUrl": "atAntMca", "width": 78}, {"as": "pQaAaFLy", "caption": "FqA7nBuL", "height": 65, "imageUrl": "sBrPzB4t", "smallImageUrl": "MdnOyn3q", "width": 52}], "localizations": {"ArwnnpcU": {"description": "aBzVZd4O", "title": "0fGt6l3a"}, "p7BIg5bi": {"description": "63FsAFkS", "title": "vWdb0zmb"}, "3JLoJEIr": {"description": "ZC6vHpTi", "title": "DjD0N7Fp"}}, "passItemId": "oby195Eh"}' \
    > test.out 2>&1
eval_tap $? 13 'CreatePass' test.out

#- 14 GetPass
./ng net.accelbyte.sdk.cli.Main seasonpass getPass \
    --code 'C6EEQ8De' \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'YtQWPXd3' \
    > test.out 2>&1
eval_tap $? 14 'GetPass' test.out

#- 15 DeletePass
./ng net.accelbyte.sdk.cli.Main seasonpass deletePass \
    --code 'X4L2Ttaa' \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'XJRSrdbE' \
    > test.out 2>&1
eval_tap $? 15 'DeletePass' test.out

#- 16 UpdatePass
./ng net.accelbyte.sdk.cli.Main seasonpass updatePass \
    --code 'VIuVzHmM' \
    --namespace "$AB_NAMESPACE" \
    --seasonId '5RcGroNF' \
    --body '{"autoEnroll": false, "displayOrder": 16, "images": [{"as": "IM58U2hX", "caption": "D2lBC2p1", "height": 5, "imageUrl": "G9z9mzqZ", "smallImageUrl": "9K3e0BwM", "width": 46}, {"as": "iHQA2fmb", "caption": "wM8y4etP", "height": 43, "imageUrl": "4aRqd0o5", "smallImageUrl": "bgBHCNwr", "width": 20}, {"as": "S2lqkclo", "caption": "JSe1L7iM", "height": 76, "imageUrl": "b2UsYA88", "smallImageUrl": "fvDUVcb2", "width": 90}], "localizations": {"EwrcDYSp": {"description": "TdmP8PmE", "title": "5Ewm3AD4"}, "gH4d6bIS": {"description": "PLjcyGlu", "title": "5Satm574"}, "hyemX6vl": {"description": "BUuj9t1z", "title": "WrHVtrv7"}}, "passItemId": "x3X0Aso3"}' \
    > test.out 2>&1
eval_tap $? 16 'UpdatePass' test.out

#- 17 PublishSeason
./ng net.accelbyte.sdk.cli.Main seasonpass publishSeason \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'GZgYfuNh' \
    > test.out 2>&1
eval_tap $? 17 'PublishSeason' test.out

#- 18 RetireSeason
./ng net.accelbyte.sdk.cli.Main seasonpass retireSeason \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'MTCnztOI' \
    --force  \
    > test.out 2>&1
eval_tap $? 18 'RetireSeason' test.out

#- 19 QueryRewards
./ng net.accelbyte.sdk.cli.Main seasonpass queryRewards \
    --namespace "$AB_NAMESPACE" \
    --seasonId '9X1SQd71' \
    --q 'mlXJQ0yM' \
    > test.out 2>&1
eval_tap $? 19 'QueryRewards' test.out

#- 20 CreateReward
./ng net.accelbyte.sdk.cli.Main seasonpass createReward \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'hQm0kyG0' \
    --body '{"code": "WPVy2Mws", "currency": {"currencyCode": "GBpqbqhn", "namespace": "qaVeTZnt"}, "image": {"as": "l1dJN8A1", "caption": "AFOxEV2r", "height": 98, "imageUrl": "dAGsdj7J", "smallImageUrl": "i6j5jW3I", "width": 83}, "itemId": "11xcRrhL", "quantity": 7, "type": "CURRENCY"}' \
    > test.out 2>&1
eval_tap $? 20 'CreateReward' test.out

#- 21 GetReward
./ng net.accelbyte.sdk.cli.Main seasonpass getReward \
    --code 'IvpNxzvp' \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'hCsVUV1F' \
    > test.out 2>&1
eval_tap $? 21 'GetReward' test.out

#- 22 DeleteReward
./ng net.accelbyte.sdk.cli.Main seasonpass deleteReward \
    --code 'd6iITRFX' \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'rxEMCYhU' \
    > test.out 2>&1
eval_tap $? 22 'DeleteReward' test.out

#- 23 UpdateReward
./ng net.accelbyte.sdk.cli.Main seasonpass updateReward \
    --code 'ZsWakFGK' \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'WmmNWeHp' \
    --body '{"currency": {"currencyCode": "rcT79Xxv", "namespace": "gdTppprU"}, "image": {"as": "i3eCc7Qy", "caption": "vbYpFEq3", "height": 68, "imageUrl": "OiMlwckr", "smallImageUrl": "M8H9fjyY", "width": 23}, "itemId": "nLTMh7h6", "nullFields": ["NLSgKEMD", "haKQqhA8", "4NWMHMSN"], "quantity": 81, "type": "CURRENCY"}' \
    > test.out 2>&1
eval_tap $? 23 'UpdateReward' test.out

#- 24 QueryTiers
./ng net.accelbyte.sdk.cli.Main seasonpass queryTiers \
    --namespace "$AB_NAMESPACE" \
    --seasonId '1fxzbLn3' \
    --limit '27' \
    --offset '97' \
    > test.out 2>&1
eval_tap $? 24 'QueryTiers' test.out

#- 25 CreateTier
./ng net.accelbyte.sdk.cli.Main seasonpass createTier \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'K5VfoUmQ' \
    --body '{"index": 41, "quantity": 73, "tier": {"requiredExp": 55, "rewards": {"IvbM0Lh8": ["XmrI2UZz", "P6ZuhCSq", "09PEkdlR"], "6vJefHkz": ["2s3UOnKA", "6ACTzFqg", "GyPRVe3L"], "oAHP9OAN": ["SX3xNQKZ", "CYuIShSv", "6lXqfihX"]}}}' \
    > test.out 2>&1
eval_tap $? 25 'CreateTier' test.out

#- 26 UpdateTier
./ng net.accelbyte.sdk.cli.Main seasonpass updateTier \
    --id 'esODM5Vu' \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'aLjzSKem' \
    --body '{"requiredExp": 85, "rewards": {"UIIh1tOK": ["EvtLUoGI", "qe0wynoS", "N5BGhdys"], "ACYXaL66": ["lWuS2LjO", "2XvUghAG", "GGoi922o"], "j3LQUro9": ["ZoRn9wfz", "5t1ACeQ1", "gLFvgATl"]}}' \
    > test.out 2>&1
eval_tap $? 26 'UpdateTier' test.out

#- 27 DeleteTier
./ng net.accelbyte.sdk.cli.Main seasonpass deleteTier \
    --id 'nlGxyksZ' \
    --namespace "$AB_NAMESPACE" \
    --seasonId '1phS9odR' \
    > test.out 2>&1
eval_tap $? 27 'DeleteTier' test.out

#- 28 ReorderTier
./ng net.accelbyte.sdk.cli.Main seasonpass reorderTier \
    --id 'csThKB8R' \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'nXSkMIuO' \
    --body '{"newIndex": 32}' \
    > test.out 2>&1
eval_tap $? 28 'ReorderTier' test.out

#- 29 UnpublishSeason
./ng net.accelbyte.sdk.cli.Main seasonpass unpublishSeason \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'jiXUrZXF' \
    --force  \
    > test.out 2>&1
eval_tap $? 29 'UnpublishSeason' test.out

#- 30 GetUserParticipatedSeasons
./ng net.accelbyte.sdk.cli.Main seasonpass getUserParticipatedSeasons \
    --namespace "$AB_NAMESPACE" \
    --userId 'DbPR8X5G' \
    --limit '40' \
    --offset '11' \
    > test.out 2>&1
eval_tap $? 30 'GetUserParticipatedSeasons' test.out

#- 31 GrantUserExp
./ng net.accelbyte.sdk.cli.Main seasonpass grantUserExp \
    --namespace "$AB_NAMESPACE" \
    --userId 'FuTq34PY' \
    --body '{"exp": 27, "source": "PAID_FOR", "tags": ["yQTgi6pM", "skEWF48c", "7uanW5Mj"]}' \
    > test.out 2>&1
eval_tap $? 31 'GrantUserExp' test.out

#- 32 GrantUserPass
./ng net.accelbyte.sdk.cli.Main seasonpass grantUserPass \
    --namespace "$AB_NAMESPACE" \
    --userId 'EnNs7VYF' \
    --body '{"passCode": "eZoTDU64", "passItemId": "vH5nJltF"}' \
    > test.out 2>&1
eval_tap $? 32 'GrantUserPass' test.out

#- 33 ExistsAnyPassByPassCodes
./ng net.accelbyte.sdk.cli.Main seasonpass existsAnyPassByPassCodes \
    --namespace "$AB_NAMESPACE" \
    --userId 'STB6Dlpq' \
    --passCodes 'AMvsI2Qp,mXtOBe2c,H951yNB1' \
    > test.out 2>&1
eval_tap $? 33 'ExistsAnyPassByPassCodes' test.out

#- 34 GetCurrentUserSeasonProgression
./ng net.accelbyte.sdk.cli.Main seasonpass getCurrentUserSeasonProgression \
    --namespace "$AB_NAMESPACE" \
    --userId 'QbKiU7kN' \
    > test.out 2>&1
eval_tap $? 34 'GetCurrentUserSeasonProgression' test.out

#- 35 CheckSeasonPurchasable
./ng net.accelbyte.sdk.cli.Main seasonpass checkSeasonPurchasable \
    --namespace "$AB_NAMESPACE" \
    --userId 'fAOmjQk9' \
    --body '{"passItemId": "XFumpIBD", "tierItemCount": 79, "tierItemId": "Ft4g5Jcu"}' \
    > test.out 2>&1
eval_tap $? 35 'CheckSeasonPurchasable' test.out

#- 36 ResetUserSeason
./ng net.accelbyte.sdk.cli.Main seasonpass resetUserSeason \
    --namespace "$AB_NAMESPACE" \
    --userId 'DacdQr3t' \
    > test.out 2>&1
eval_tap $? 36 'ResetUserSeason' test.out

#- 37 GrantUserTier
./ng net.accelbyte.sdk.cli.Main seasonpass grantUserTier \
    --namespace "$AB_NAMESPACE" \
    --userId 'oZ15k9NS' \
    --body '{"count": 7, "source": "SWEAT", "tags": ["aL83Xp5O", "9xSiwuz0", "9KWv9O3j"]}' \
    > test.out 2>&1
eval_tap $? 37 'GrantUserTier' test.out

#- 38 QueryUserExpGrantHistory
./ng net.accelbyte.sdk.cli.Main seasonpass queryUserExpGrantHistory \
    --namespace "$AB_NAMESPACE" \
    --userId 'Xvng9b40' \
    --from '07yxSdTW' \
    --limit '19' \
    --offset '98' \
    --seasonId 'oh6N1LB5' \
    --source 'PAID_FOR' \
    --tags 'O9lKLlOk,2lSUQins,gBXIHk7e' \
    --to '4qOk4Lme' \
    > test.out 2>&1
eval_tap $? 38 'QueryUserExpGrantHistory' test.out

#- 39 QueryUserExpGrantHistoryTag
./ng net.accelbyte.sdk.cli.Main seasonpass queryUserExpGrantHistoryTag \
    --namespace "$AB_NAMESPACE" \
    --userId 'l9pdXCoN' \
    --seasonId 'oisuPxhV' \
    > test.out 2>&1
eval_tap $? 39 'QueryUserExpGrantHistoryTag' test.out

#- 40 GetUserSeason
./ng net.accelbyte.sdk.cli.Main seasonpass getUserSeason \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'sWXzfzhD' \
    --userId 'MpG2Ae90' \
    > test.out 2>&1
eval_tap $? 40 'GetUserSeason' test.out

#- 41 PublicGetCurrentSeason
./ng net.accelbyte.sdk.cli.Main seasonpass publicGetCurrentSeason \
    --namespace "$AB_NAMESPACE" \
    --language 'BfqZ7MLf' \
    > test.out 2>&1
eval_tap $? 41 'PublicGetCurrentSeason' test.out

#- 42 PublicGetCurrentUserSeason
./ng net.accelbyte.sdk.cli.Main seasonpass publicGetCurrentUserSeason \
    --namespace "$AB_NAMESPACE" \
    --userId 'qoq2KFAR' \
    > test.out 2>&1
eval_tap $? 42 'PublicGetCurrentUserSeason' test.out

#- 43 PublicClaimUserReward
./ng net.accelbyte.sdk.cli.Main seasonpass publicClaimUserReward \
    --namespace "$AB_NAMESPACE" \
    --userId '6SpdGq3X' \
    --body '{"passCode": "iewM5vcs", "rewardCode": "j6CxDt7G", "tierIndex": 8}' \
    > test.out 2>&1
eval_tap $? 43 'PublicClaimUserReward' test.out

#- 44 PublicBulkClaimUserRewards
./ng net.accelbyte.sdk.cli.Main seasonpass publicBulkClaimUserRewards \
    --namespace "$AB_NAMESPACE" \
    --userId 'dTpENXdj' \
    > test.out 2>&1
eval_tap $? 44 'PublicBulkClaimUserRewards' test.out

#- 45 PublicGetUserSeason
./ng net.accelbyte.sdk.cli.Main seasonpass publicGetUserSeason \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'K4LPJVri' \
    --userId 'ihWzjAjt' \
    > test.out 2>&1
eval_tap $? 45 'PublicGetUserSeason' test.out


rm -f "tmp.dat"

exit $EXIT_CODE