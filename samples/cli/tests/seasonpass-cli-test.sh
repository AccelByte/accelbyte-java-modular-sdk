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
    --limit '64' \
    --offset '40' \
    --status 'DRAFT,DRAFT,PUBLISHED' \
    > test.out 2>&1
eval_tap $? 3 'QuerySeasons' test.out

#- 4 CreateSeason
./ng net.accelbyte.sdk.cli.Main seasonpass createSeason \
    --namespace "$AB_NAMESPACE" \
    --body '{"autoClaim": false, "defaultLanguage": "xkrVkwV2", "defaultRequiredExp": 66, "draftStoreId": "KqiGZIGe", "end": "1983-06-18T00:00:00Z", "excessStrategy": {"currency": "NswpRRbv", "method": "NONE", "percentPerExp": 12}, "images": [{"as": "kTZtCNcY", "caption": "Whx62dzL", "height": 50, "imageUrl": "becRa9Sq", "smallImageUrl": "tRhW1GXf", "width": 91}, {"as": "ww7K7XpT", "caption": "SceyuaJA", "height": 48, "imageUrl": "mjzVp2li", "smallImageUrl": "zODhgvOs", "width": 96}, {"as": "vIkQzuCl", "caption": "WA7H12cG", "height": 86, "imageUrl": "n2sEjbBq", "smallImageUrl": "fWOZk3Zi", "width": 3}], "localizations": {"5hTFU8TS": {"description": "ClLbVmSL", "title": "FechFkcS"}, "dZBRKFYv": {"description": "jNwYLZcO", "title": "6Bjqc95l"}, "R1skx99l": {"description": "s3kq7jJ7", "title": "ct9WG7Ly"}}, "name": "kYGdHmPs", "start": "1980-11-23T00:00:00Z", "tierItemId": "mGqKlRXH"}' \
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
    --body '{"userIds": ["SCvol4Db", "FOye0jIz", "g1LRH31g"]}' \
    > test.out 2>&1
eval_tap $? 6 'BulkGetUserSeasonProgression' test.out

#- 7 GetItemReferences
./ng net.accelbyte.sdk.cli.Main seasonpass getItemReferences \
    --namespace "$AB_NAMESPACE" \
    --itemId '5YMbh8oH' \
    > test.out 2>&1
eval_tap $? 7 'GetItemReferences' test.out

#- 8 GetSeason
./ng net.accelbyte.sdk.cli.Main seasonpass getSeason \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'mVtFwdys' \
    > test.out 2>&1
eval_tap $? 8 'GetSeason' test.out

#- 9 DeleteSeason
./ng net.accelbyte.sdk.cli.Main seasonpass deleteSeason \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'N5U42aRR' \
    > test.out 2>&1
eval_tap $? 9 'DeleteSeason' test.out

#- 10 UpdateSeason
./ng net.accelbyte.sdk.cli.Main seasonpass updateSeason \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'Hz5Hhcsp' \
    --body '{"autoClaim": true, "defaultLanguage": "GDMN0xoX", "defaultRequiredExp": 49, "draftStoreId": "3FJZATYF", "end": "1989-11-27T00:00:00Z", "excessStrategy": {"currency": "4BjyVR2N", "method": "CURRENCY", "percentPerExp": 59}, "images": [{"as": "Ow1yweB1", "caption": "ArbbW3AD", "height": 18, "imageUrl": "QH3HoNdx", "smallImageUrl": "uP4daktD", "width": 13}, {"as": "jVwiYsjJ", "caption": "5ZApQ4yC", "height": 11, "imageUrl": "IVkut3yd", "smallImageUrl": "Q87tO8It", "width": 45}, {"as": "YBOOoWj5", "caption": "ppt4uLEo", "height": 2, "imageUrl": "zbA9KVpT", "smallImageUrl": "6K4tvRV7", "width": 79}], "localizations": {"VnL0JcNm": {"description": "mJjM4Fee", "title": "FusV3du4"}, "kgCwouIa": {"description": "Mx39fwI4", "title": "fzxVu4vx"}, "v4fey70h": {"description": "B0QBIJN6", "title": "8u2T5omy"}}, "name": "gZ5M9LUs", "start": "1973-12-02T00:00:00Z", "tierItemId": "OWfQUlhj"}' \
    > test.out 2>&1
eval_tap $? 10 'UpdateSeason' test.out

#- 11 CloneSeason
./ng net.accelbyte.sdk.cli.Main seasonpass cloneSeason \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'InJicWGc' \
    --body '{"end": "1975-06-07T00:00:00Z", "name": "vWeOQx21", "start": "1979-01-22T00:00:00Z"}' \
    > test.out 2>&1
eval_tap $? 11 'CloneSeason' test.out

#- 12 GetFullSeason
./ng net.accelbyte.sdk.cli.Main seasonpass getFullSeason \
    --namespace "$AB_NAMESPACE" \
    --seasonId '1nV4SJTq' \
    > test.out 2>&1
eval_tap $? 12 'GetFullSeason' test.out

#- 13 QueryPasses
./ng net.accelbyte.sdk.cli.Main seasonpass queryPasses \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'BuotTIvR' \
    > test.out 2>&1
eval_tap $? 13 'QueryPasses' test.out

#- 14 CreatePass
./ng net.accelbyte.sdk.cli.Main seasonpass createPass \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'dh6fffiH' \
    --body '{"autoEnroll": false, "code": "PqcKhBV0", "displayOrder": 30, "images": [{"as": "pPAQTK9p", "caption": "SkEHInBy", "height": 48, "imageUrl": "AgLGU7rF", "smallImageUrl": "Brzadd65", "width": 1}, {"as": "cGzhvAiR", "caption": "HAozCYYJ", "height": 40, "imageUrl": "hYD8gVLA", "smallImageUrl": "ol54QExt", "width": 30}, {"as": "PXMCTA5N", "caption": "CKWXw8rm", "height": 58, "imageUrl": "PiKb9n9B", "smallImageUrl": "mNwUrEsj", "width": 77}], "localizations": {"ahHFH4C7": {"description": "6hoC773y", "title": "w3AxECu4"}, "74KaqikM": {"description": "igJN6Pyh", "title": "asMWflXR"}, "WgPRMWUj": {"description": "RQDFlVL1", "title": "XsELoF1L"}}, "passItemId": "E5HXZaYY"}' \
    > test.out 2>&1
eval_tap $? 14 'CreatePass' test.out

#- 15 GetPass
./ng net.accelbyte.sdk.cli.Main seasonpass getPass \
    --code 'qY6V8qE4' \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'kFQTZRM1' \
    > test.out 2>&1
eval_tap $? 15 'GetPass' test.out

#- 16 DeletePass
./ng net.accelbyte.sdk.cli.Main seasonpass deletePass \
    --code 'W1z727NL' \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'GHRIfHKb' \
    > test.out 2>&1
eval_tap $? 16 'DeletePass' test.out

#- 17 UpdatePass
./ng net.accelbyte.sdk.cli.Main seasonpass updatePass \
    --code 'yVzE7wii' \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'aoY7du0W' \
    --body '{"autoEnroll": true, "displayOrder": 15, "images": [{"as": "3ayifptk", "caption": "S782NLIn", "height": 21, "imageUrl": "w3z6QKaW", "smallImageUrl": "0sxMVcK7", "width": 22}, {"as": "Zp2ISNOi", "caption": "YzmbM2tD", "height": 97, "imageUrl": "kQWEimfR", "smallImageUrl": "gDwqRdkd", "width": 43}, {"as": "04aZjDct", "caption": "AVJcYhD1", "height": 50, "imageUrl": "k9FfNeWB", "smallImageUrl": "frq91lar", "width": 48}], "localizations": {"sqLsN3yw": {"description": "nm36fhY5", "title": "1K37YRTk"}, "XTLuKzBY": {"description": "dOBx4EZ0", "title": "pyriOPIF"}, "IYnUKeH8": {"description": "FPrIPHca", "title": "QPZ4iCK0"}}, "passItemId": "WRFCv6vd"}' \
    > test.out 2>&1
eval_tap $? 17 'UpdatePass' test.out

#- 18 PublishSeason
./ng net.accelbyte.sdk.cli.Main seasonpass publishSeason \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'zfGPnAFp' \
    > test.out 2>&1
eval_tap $? 18 'PublishSeason' test.out

#- 19 RetireSeason
./ng net.accelbyte.sdk.cli.Main seasonpass retireSeason \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'k1ZAuEKy' \
    --force  \
    > test.out 2>&1
eval_tap $? 19 'RetireSeason' test.out

#- 20 QueryRewards
./ng net.accelbyte.sdk.cli.Main seasonpass queryRewards \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'suRKWYPX' \
    --q 'N7OsZx0W' \
    > test.out 2>&1
eval_tap $? 20 'QueryRewards' test.out

#- 21 CreateReward
./ng net.accelbyte.sdk.cli.Main seasonpass createReward \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'q2sf0zhQ' \
    --body '{"code": "tq57KH3J", "currency": {"currencyCode": "kfQ9J1SV", "namespace": "NrtSbA4V"}, "image": {"as": "KSFrUaGD", "caption": "dXL43EWt", "height": 30, "imageUrl": "jCM4ez6T", "smallImageUrl": "8PiP4mXN", "width": 45}, "itemId": "L5KaW2qu", "quantity": 26, "type": "CURRENCY"}' \
    > test.out 2>&1
eval_tap $? 21 'CreateReward' test.out

#- 22 GetReward
./ng net.accelbyte.sdk.cli.Main seasonpass getReward \
    --code 'kQlSzWgs' \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'sN7jvZVG' \
    > test.out 2>&1
eval_tap $? 22 'GetReward' test.out

#- 23 DeleteReward
./ng net.accelbyte.sdk.cli.Main seasonpass deleteReward \
    --code '4ruTUoyF' \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'xH5Zxa5M' \
    > test.out 2>&1
eval_tap $? 23 'DeleteReward' test.out

#- 24 UpdateReward
./ng net.accelbyte.sdk.cli.Main seasonpass updateReward \
    --code '4r5kldsA' \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'gItd6tnE' \
    --body '{"currency": {"currencyCode": "lMRgyyv0", "namespace": "oacVvrQa"}, "image": {"as": "UKnF5scU", "caption": "IMSYAFku", "height": 26, "imageUrl": "p5HE1MSK", "smallImageUrl": "59upJNLw", "width": 69}, "itemId": "3XWISo8g", "nullFields": ["26kEoccM", "Tg3thxWM", "MOntoCWI"], "quantity": 64, "type": "ITEM"}' \
    > test.out 2>&1
eval_tap $? 24 'UpdateReward' test.out

#- 25 QueryTiers
./ng net.accelbyte.sdk.cli.Main seasonpass queryTiers \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'RrqopuOB' \
    --limit '12' \
    --offset '31' \
    > test.out 2>&1
eval_tap $? 25 'QueryTiers' test.out

#- 26 CreateTier
./ng net.accelbyte.sdk.cli.Main seasonpass createTier \
    --namespace "$AB_NAMESPACE" \
    --seasonId '1IRhKaxr' \
    --body '{"index": 65, "quantity": 79, "tier": {"requiredExp": 82, "rewards": {"884tkO4h": ["ut8RuddV", "kzKWSRYJ", "3nP45IT5"], "m7ej6WYc": ["p5oAUKEZ", "Wjkf8wkP", "X2F3Ehzs"], "1wzu7fJ3": ["Bq2emktZ", "RCr1I07G", "kC1rLG6h"]}}}' \
    > test.out 2>&1
eval_tap $? 26 'CreateTier' test.out

#- 27 UpdateTier
./ng net.accelbyte.sdk.cli.Main seasonpass updateTier \
    --id 'uww54UUX' \
    --namespace "$AB_NAMESPACE" \
    --seasonId '1mp7rwrL' \
    --body '{"requiredExp": 57, "rewards": {"TSmWNMBC": ["atsf21H7", "vfiEd9Kb", "N5pMjYTB"], "GcEfpyU6": ["lSbE6L4Y", "4f2Pvl7j", "SJ3vsRRL"], "Yy00trtn": ["AZ4I2PHE", "V92NKfFR", "xf3POCQ1"]}}' \
    > test.out 2>&1
eval_tap $? 27 'UpdateTier' test.out

#- 28 DeleteTier
./ng net.accelbyte.sdk.cli.Main seasonpass deleteTier \
    --id 'd1LbeTft' \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'seeFgrrv' \
    > test.out 2>&1
eval_tap $? 28 'DeleteTier' test.out

#- 29 ReorderTier
./ng net.accelbyte.sdk.cli.Main seasonpass reorderTier \
    --id 'Xg2YKilW' \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'NAAnXOxv' \
    --body '{"newIndex": 3}' \
    > test.out 2>&1
eval_tap $? 29 'ReorderTier' test.out

#- 30 UnpublishSeason
./ng net.accelbyte.sdk.cli.Main seasonpass unpublishSeason \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'Tahzj6s5' \
    --force  \
    > test.out 2>&1
eval_tap $? 30 'UnpublishSeason' test.out

#- 31 GetUserParticipatedSeasons
./ng net.accelbyte.sdk.cli.Main seasonpass getUserParticipatedSeasons \
    --namespace "$AB_NAMESPACE" \
    --userId 'AcvXySUL' \
    --limit '50' \
    --offset '71' \
    > test.out 2>&1
eval_tap $? 31 'GetUserParticipatedSeasons' test.out

#- 32 GrantUserExp
./ng net.accelbyte.sdk.cli.Main seasonpass grantUserExp \
    --namespace "$AB_NAMESPACE" \
    --userId 'RpKAakOP' \
    --body '{"exp": 95, "source": "SWEAT", "tags": ["6Y7cPVWy", "9GjWboT2", "YSSssa5A"]}' \
    > test.out 2>&1
eval_tap $? 32 'GrantUserExp' test.out

#- 33 GrantUserPass
./ng net.accelbyte.sdk.cli.Main seasonpass grantUserPass \
    --namespace "$AB_NAMESPACE" \
    --userId 'yknbQm2i' \
    --body '{"passCode": "cTrkKX3x", "passItemId": "q12jccxC"}' \
    > test.out 2>&1
eval_tap $? 33 'GrantUserPass' test.out

#- 34 ExistsAnyPassByPassCodes
./ng net.accelbyte.sdk.cli.Main seasonpass existsAnyPassByPassCodes \
    --namespace "$AB_NAMESPACE" \
    --userId 'vnOgwjYz' \
    --passCodes '7mjfCZlB,VumbYkcn,fhokwE6N' \
    > test.out 2>&1
eval_tap $? 34 'ExistsAnyPassByPassCodes' test.out

#- 35 GetCurrentUserSeasonProgression
./ng net.accelbyte.sdk.cli.Main seasonpass getCurrentUserSeasonProgression \
    --namespace "$AB_NAMESPACE" \
    --userId '3uUxhMZ9' \
    > test.out 2>&1
eval_tap $? 35 'GetCurrentUserSeasonProgression' test.out

#- 36 CheckSeasonPurchasable
./ng net.accelbyte.sdk.cli.Main seasonpass checkSeasonPurchasable \
    --namespace "$AB_NAMESPACE" \
    --userId 'AIaH4zNl' \
    --body '{"passItemId": "hlzP7zs4", "tierItemCount": 53, "tierItemId": "c5U8t3rT"}' \
    > test.out 2>&1
eval_tap $? 36 'CheckSeasonPurchasable' test.out

#- 37 ResetUserSeason
./ng net.accelbyte.sdk.cli.Main seasonpass resetUserSeason \
    --namespace "$AB_NAMESPACE" \
    --userId 'oT9gNHBE' \
    > test.out 2>&1
eval_tap $? 37 'ResetUserSeason' test.out

#- 38 GrantUserTier
./ng net.accelbyte.sdk.cli.Main seasonpass grantUserTier \
    --namespace "$AB_NAMESPACE" \
    --userId 'XEPswyUx' \
    --body '{"count": 97, "source": "PAID_FOR", "tags": ["OxqzeSvs", "Wd1lZNzd", "03N8af9V"]}' \
    > test.out 2>&1
eval_tap $? 38 'GrantUserTier' test.out

#- 39 QueryUserExpGrantHistory
./ng net.accelbyte.sdk.cli.Main seasonpass queryUserExpGrantHistory \
    --namespace "$AB_NAMESPACE" \
    --userId 'O3QiAJNO' \
    --from 'BVnhH8p3' \
    --limit '97' \
    --offset '89' \
    --seasonId '6YZd4oDC' \
    --source 'PAID_FOR' \
    --tags 'cVQKIt9G,Qz4zbGZb,PfPmCRcX' \
    --to 'ogkIR8c0' \
    > test.out 2>&1
eval_tap $? 39 'QueryUserExpGrantHistory' test.out

#- 40 QueryUserExpGrantHistoryTag
./ng net.accelbyte.sdk.cli.Main seasonpass queryUserExpGrantHistoryTag \
    --namespace "$AB_NAMESPACE" \
    --userId 'RyruUIgC' \
    --seasonId 'Tk8ZtbTF' \
    > test.out 2>&1
eval_tap $? 40 'QueryUserExpGrantHistoryTag' test.out

#- 41 GetUserSeason
./ng net.accelbyte.sdk.cli.Main seasonpass getUserSeason \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'wGekXvec' \
    --userId 'l5qIAXGV' \
    > test.out 2>&1
eval_tap $? 41 'GetUserSeason' test.out

#- 42 PublicGetCurrentSeason
./ng net.accelbyte.sdk.cli.Main seasonpass publicGetCurrentSeason \
    --namespace "$AB_NAMESPACE" \
    --language 'D9u0wfUB' \
    > test.out 2>&1
eval_tap $? 42 'PublicGetCurrentSeason' test.out

#- 43 PublicGetCurrentUserSeason
./ng net.accelbyte.sdk.cli.Main seasonpass publicGetCurrentUserSeason \
    --namespace "$AB_NAMESPACE" \
    --userId 'CeDaWGLe' \
    > test.out 2>&1
eval_tap $? 43 'PublicGetCurrentUserSeason' test.out

#- 44 PublicClaimUserReward
./ng net.accelbyte.sdk.cli.Main seasonpass publicClaimUserReward \
    --namespace "$AB_NAMESPACE" \
    --userId 'WuwTt3Um' \
    --body '{"passCode": "6wL03z1e", "rewardCode": "a1DvP2hA", "tierIndex": 7}' \
    > test.out 2>&1
eval_tap $? 44 'PublicClaimUserReward' test.out

#- 45 PublicBulkClaimUserRewards
./ng net.accelbyte.sdk.cli.Main seasonpass publicBulkClaimUserRewards \
    --namespace "$AB_NAMESPACE" \
    --userId 'eerWZT3W' \
    > test.out 2>&1
eval_tap $? 45 'PublicBulkClaimUserRewards' test.out

#- 46 PublicGetUserSeason
./ng net.accelbyte.sdk.cli.Main seasonpass publicGetUserSeason \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'kJYOcZYG' \
    --userId 'ud3vRBtU' \
    > test.out 2>&1
eval_tap $? 46 'PublicGetUserSeason' test.out


rm -f "tmp.dat"

exit $EXIT_CODE