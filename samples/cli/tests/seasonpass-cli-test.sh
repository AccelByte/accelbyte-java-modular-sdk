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
    --limit '76' \
    --offset '54' \
    --status 'DRAFT,PUBLISHED,RETIRED' \
    > test.out 2>&1
eval_tap $? 3 'QuerySeasons' test.out

#- 4 CreateSeason
./ng net.accelbyte.sdk.cli.Main seasonpass createSeason \
    --namespace "$AB_NAMESPACE" \
    --body '{"autoClaim": false, "defaultLanguage": "QWsbYyDj", "defaultRequiredExp": 37, "draftStoreId": "Ke3l93pT", "end": "1974-02-02T00:00:00Z", "excessStrategy": {"currency": "Im4RQ4K8", "method": "CURRENCY", "percentPerExp": 49}, "images": [{"as": "E8QW2Rba", "caption": "yF2tt0U9", "height": 56, "imageUrl": "wKTVhcZi", "smallImageUrl": "fhqwR3nm", "width": 73}, {"as": "Natm4PAa", "caption": "in2FLZR4", "height": 49, "imageUrl": "57q2wJFq", "smallImageUrl": "9WbihiOx", "width": 20}, {"as": "8T2EgUQx", "caption": "ZdurhSAa", "height": 41, "imageUrl": "QvxNCoeV", "smallImageUrl": "GXdsmGKc", "width": 23}], "localizations": {"ctMCQOAZ": {"description": "sIeCSMFG", "title": "7CveRL8e"}, "NHx7YZIM": {"description": "v3BLDlZ7", "title": "5UU53jfk"}, "VMpPgriT": {"description": "0e3ltRz2", "title": "O7rmMEBM"}}, "name": "06J21aK5", "start": "1983-05-15T00:00:00Z", "tierItemId": "lWC5tpTU"}' \
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
    --body '{"userIds": ["jpLu2ldj", "MYOHmSye", "W1lEgNGe"]}' \
    > test.out 2>&1
eval_tap $? 6 'BulkGetUserSeasonProgression' test.out

#- 7 GetSeason
./ng net.accelbyte.sdk.cli.Main seasonpass getSeason \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'RNz9BAsB' \
    > test.out 2>&1
eval_tap $? 7 'GetSeason' test.out

#- 8 DeleteSeason
./ng net.accelbyte.sdk.cli.Main seasonpass deleteSeason \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'bFOBpSOR' \
    > test.out 2>&1
eval_tap $? 8 'DeleteSeason' test.out

#- 9 UpdateSeason
./ng net.accelbyte.sdk.cli.Main seasonpass updateSeason \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'f8j21Mil' \
    --body '{"autoClaim": true, "defaultLanguage": "eO6DrADj", "defaultRequiredExp": 59, "draftStoreId": "mGxdmc6v", "end": "1996-09-01T00:00:00Z", "excessStrategy": {"currency": "1GIdz0s2", "method": "CURRENCY", "percentPerExp": 91}, "images": [{"as": "480JRLb6", "caption": "OK8KOqiW", "height": 62, "imageUrl": "FAsXSp14", "smallImageUrl": "U6xVGU14", "width": 21}, {"as": "edkMXFKF", "caption": "cExGiW0a", "height": 78, "imageUrl": "Q0QHtOh4", "smallImageUrl": "oXU0lxVW", "width": 60}, {"as": "bslCwTol", "caption": "0XQoOHrQ", "height": 10, "imageUrl": "yRCX6UK3", "smallImageUrl": "kjGxNATj", "width": 6}], "localizations": {"mrPe1xhD": {"description": "nucnOAoJ", "title": "w0OCAwDT"}, "ZxCeQpWg": {"description": "VGO3wvE7", "title": "j8hNxDyh"}, "2NYxeM4v": {"description": "uGA8MjUo", "title": "hQlliCRG"}}, "name": "fOC49KAt", "start": "1985-05-02T00:00:00Z", "tierItemId": "5jFHsGmL"}' \
    > test.out 2>&1
eval_tap $? 9 'UpdateSeason' test.out

#- 10 CloneSeason
./ng net.accelbyte.sdk.cli.Main seasonpass cloneSeason \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'miNGYBYU' \
    --body '{"end": "1990-10-26T00:00:00Z", "name": "lL5qS8Ig", "start": "1972-02-09T00:00:00Z"}' \
    > test.out 2>&1
eval_tap $? 10 'CloneSeason' test.out

#- 11 GetFullSeason
./ng net.accelbyte.sdk.cli.Main seasonpass getFullSeason \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'uQ52Q2ae' \
    > test.out 2>&1
eval_tap $? 11 'GetFullSeason' test.out

#- 12 QueryPasses
./ng net.accelbyte.sdk.cli.Main seasonpass queryPasses \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'cAzkOfx4' \
    > test.out 2>&1
eval_tap $? 12 'QueryPasses' test.out

#- 13 CreatePass
./ng net.accelbyte.sdk.cli.Main seasonpass createPass \
    --namespace "$AB_NAMESPACE" \
    --seasonId '1UMBDluJ' \
    --body '{"autoEnroll": false, "code": "xIfaVAYj", "displayOrder": 14, "images": [{"as": "ctQ71bQQ", "caption": "PauP4K9K", "height": 86, "imageUrl": "edoBobY1", "smallImageUrl": "suI0llWk", "width": 0}, {"as": "VvLrjss3", "caption": "cPoyBghH", "height": 43, "imageUrl": "byZPsRZe", "smallImageUrl": "gTAlHwJ2", "width": 93}, {"as": "kfaz9o6O", "caption": "mvHgS83h", "height": 25, "imageUrl": "VYfQNgol", "smallImageUrl": "AkG4gEyf", "width": 93}], "localizations": {"jIo9nrMi": {"description": "elNTATdO", "title": "smq1Uqj2"}, "gVn5bYpt": {"description": "hQlhMOXO", "title": "iTh0nV3B"}, "3S8LgHBw": {"description": "vcJqMziw", "title": "89k0dHBJ"}}, "passItemId": "XmyhZhTW"}' \
    > test.out 2>&1
eval_tap $? 13 'CreatePass' test.out

#- 14 GetPass
./ng net.accelbyte.sdk.cli.Main seasonpass getPass \
    --code '68f856FS' \
    --namespace "$AB_NAMESPACE" \
    --seasonId '6PKP2L1Y' \
    > test.out 2>&1
eval_tap $? 14 'GetPass' test.out

#- 15 DeletePass
./ng net.accelbyte.sdk.cli.Main seasonpass deletePass \
    --code 'TCYbGCqU' \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'U855WT8o' \
    > test.out 2>&1
eval_tap $? 15 'DeletePass' test.out

#- 16 UpdatePass
./ng net.accelbyte.sdk.cli.Main seasonpass updatePass \
    --code 'bannmy6X' \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'ZBxXjKjQ' \
    --body '{"autoEnroll": true, "displayOrder": 45, "images": [{"as": "GPjKsW6F", "caption": "pLFILbKp", "height": 25, "imageUrl": "Il7uryKS", "smallImageUrl": "LwLjxFbo", "width": 47}, {"as": "7pBH58OY", "caption": "OPMdpcnd", "height": 13, "imageUrl": "B93JYhqW", "smallImageUrl": "1lTqAsD1", "width": 81}, {"as": "xPJ9SyAD", "caption": "UfvKwtmG", "height": 74, "imageUrl": "tdUg74HP", "smallImageUrl": "yvvxEWEO", "width": 90}], "localizations": {"dvRaalx6": {"description": "Wg0ZAFDx", "title": "BlDzJ8Ql"}, "VPX38bhN": {"description": "dNUZCC36", "title": "8syJUTph"}, "T3esevHz": {"description": "MBenB2tM", "title": "uUe4SqO7"}}, "passItemId": "OuVFr83f"}' \
    > test.out 2>&1
eval_tap $? 16 'UpdatePass' test.out

#- 17 PublishSeason
./ng net.accelbyte.sdk.cli.Main seasonpass publishSeason \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'cVxURtJk' \
    > test.out 2>&1
eval_tap $? 17 'PublishSeason' test.out

#- 18 RetireSeason
./ng net.accelbyte.sdk.cli.Main seasonpass retireSeason \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'tw9qUTqq' \
    --force  \
    > test.out 2>&1
eval_tap $? 18 'RetireSeason' test.out

#- 19 QueryRewards
./ng net.accelbyte.sdk.cli.Main seasonpass queryRewards \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'H9l8jnII' \
    --q 'UZ3D7soP' \
    > test.out 2>&1
eval_tap $? 19 'QueryRewards' test.out

#- 20 CreateReward
./ng net.accelbyte.sdk.cli.Main seasonpass createReward \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'CqmRSj0y' \
    --body '{"code": "9efag45H", "currency": {"currencyCode": "c4AnhhpG", "namespace": "YWj6RjT4"}, "image": {"as": "5e4AXLpk", "caption": "HHAt0Nch", "height": 75, "imageUrl": "YdrkWOK5", "smallImageUrl": "9WRNX5qH", "width": 17}, "itemId": "nbdAiwR8", "quantity": 84, "type": "CURRENCY"}' \
    > test.out 2>&1
eval_tap $? 20 'CreateReward' test.out

#- 21 GetReward
./ng net.accelbyte.sdk.cli.Main seasonpass getReward \
    --code 'UUozKGw6' \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'FitDfMmR' \
    > test.out 2>&1
eval_tap $? 21 'GetReward' test.out

#- 22 DeleteReward
./ng net.accelbyte.sdk.cli.Main seasonpass deleteReward \
    --code 'jcN3STEZ' \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'A8RfP6Yf' \
    > test.out 2>&1
eval_tap $? 22 'DeleteReward' test.out

#- 23 UpdateReward
./ng net.accelbyte.sdk.cli.Main seasonpass updateReward \
    --code '0Tbi3ZBI' \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'MfZRHpX1' \
    --body '{"currency": {"currencyCode": "BDNOklNR", "namespace": "3YYzx7s4"}, "image": {"as": "tPgGnb9g", "caption": "QQhmdiO1", "height": 2, "imageUrl": "x4uA0rPZ", "smallImageUrl": "dQuR0kgQ", "width": 50}, "itemId": "O8GOz2ZW", "nullFields": ["GkQesKJF", "aaDiFzyA", "qFKzELCo"], "quantity": 16, "type": "ITEM"}' \
    > test.out 2>&1
eval_tap $? 23 'UpdateReward' test.out

#- 24 QueryTiers
./ng net.accelbyte.sdk.cli.Main seasonpass queryTiers \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'qvYJ0NDh' \
    --limit '95' \
    --offset '94' \
    > test.out 2>&1
eval_tap $? 24 'QueryTiers' test.out

#- 25 CreateTier
./ng net.accelbyte.sdk.cli.Main seasonpass createTier \
    --namespace "$AB_NAMESPACE" \
    --seasonId '0aW0Q9nX' \
    --body '{"index": 25, "quantity": 24, "tier": {"requiredExp": 41, "rewards": {"HS8aoNNc": ["aLi2spfP", "Jk7lH1nB", "q7ahTiWC"], "S5Qh8hVp": ["3pYgoOti", "q5T6n6JF", "IrkXzZhF"], "xEmAMopc": ["GIq0Kr79", "4HK68w7r", "h0Z1kn7v"]}}}' \
    > test.out 2>&1
eval_tap $? 25 'CreateTier' test.out

#- 26 UpdateTier
./ng net.accelbyte.sdk.cli.Main seasonpass updateTier \
    --id '0kBKau7C' \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'P1Oj2eGL' \
    --body '{"requiredExp": 79, "rewards": {"oRDmVubP": ["2Adx900g", "jOibSknT", "pLOSNjdx"], "yKMlqn3h": ["NPGADzjF", "RsGtZ3gv", "XnSEUV17"], "o9tY8QpT": ["GzuAhL31", "CxCohXMK", "nlNXlHUZ"]}}' \
    > test.out 2>&1
eval_tap $? 26 'UpdateTier' test.out

#- 27 DeleteTier
./ng net.accelbyte.sdk.cli.Main seasonpass deleteTier \
    --id '8WBp3QZG' \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'UUvsfXgg' \
    > test.out 2>&1
eval_tap $? 27 'DeleteTier' test.out

#- 28 ReorderTier
./ng net.accelbyte.sdk.cli.Main seasonpass reorderTier \
    --id 'VRiSsIoF' \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'nORCcCeK' \
    --body '{"newIndex": 79}' \
    > test.out 2>&1
eval_tap $? 28 'ReorderTier' test.out

#- 29 UnpublishSeason
./ng net.accelbyte.sdk.cli.Main seasonpass unpublishSeason \
    --namespace "$AB_NAMESPACE" \
    --seasonId '106vB0JD' \
    --force  \
    > test.out 2>&1
eval_tap $? 29 'UnpublishSeason' test.out

#- 30 GetUserParticipatedSeasons
./ng net.accelbyte.sdk.cli.Main seasonpass getUserParticipatedSeasons \
    --namespace "$AB_NAMESPACE" \
    --userId '3D4IWOCv' \
    --limit '97' \
    --offset '52' \
    > test.out 2>&1
eval_tap $? 30 'GetUserParticipatedSeasons' test.out

#- 31 GrantUserExp
./ng net.accelbyte.sdk.cli.Main seasonpass grantUserExp \
    --namespace "$AB_NAMESPACE" \
    --userId 'cgClDWaO' \
    --body '{"exp": 87, "source": "PAID_FOR", "tags": ["Nj4xBWwJ", "K0oG6EHf", "pkktyOm6"]}' \
    > test.out 2>&1
eval_tap $? 31 'GrantUserExp' test.out

#- 32 GrantUserPass
./ng net.accelbyte.sdk.cli.Main seasonpass grantUserPass \
    --namespace "$AB_NAMESPACE" \
    --userId 'EajXNmIl' \
    --body '{"passCode": "Eg7xGq9h", "passItemId": "EAfe0lVw"}' \
    > test.out 2>&1
eval_tap $? 32 'GrantUserPass' test.out

#- 33 ExistsAnyPassByPassCodes
./ng net.accelbyte.sdk.cli.Main seasonpass existsAnyPassByPassCodes \
    --namespace "$AB_NAMESPACE" \
    --userId 'Wkx5OIHn' \
    --passCodes '9GTA15uH,58eeqZTe,2vE8QU5o' \
    > test.out 2>&1
eval_tap $? 33 'ExistsAnyPassByPassCodes' test.out

#- 34 GetCurrentUserSeasonProgression
./ng net.accelbyte.sdk.cli.Main seasonpass getCurrentUserSeasonProgression \
    --namespace "$AB_NAMESPACE" \
    --userId 'MzVEdjQO' \
    > test.out 2>&1
eval_tap $? 34 'GetCurrentUserSeasonProgression' test.out

#- 35 CheckSeasonPurchasable
./ng net.accelbyte.sdk.cli.Main seasonpass checkSeasonPurchasable \
    --namespace "$AB_NAMESPACE" \
    --userId '65FiV8DC' \
    --body '{"passItemId": "F106HGjt", "tierItemCount": 78, "tierItemId": "zi11ddXI"}' \
    > test.out 2>&1
eval_tap $? 35 'CheckSeasonPurchasable' test.out

#- 36 ResetUserSeason
./ng net.accelbyte.sdk.cli.Main seasonpass resetUserSeason \
    --namespace "$AB_NAMESPACE" \
    --userId '7snZQh8C' \
    > test.out 2>&1
eval_tap $? 36 'ResetUserSeason' test.out

#- 37 GrantUserTier
./ng net.accelbyte.sdk.cli.Main seasonpass grantUserTier \
    --namespace "$AB_NAMESPACE" \
    --userId 'iAD6Lc1S' \
    --body '{"count": 86, "source": "SWEAT", "tags": ["gvFlDya9", "6Oc3LmWy", "XBjYAfgS"]}' \
    > test.out 2>&1
eval_tap $? 37 'GrantUserTier' test.out

#- 38 QueryUserExpGrantHistory
./ng net.accelbyte.sdk.cli.Main seasonpass queryUserExpGrantHistory \
    --namespace "$AB_NAMESPACE" \
    --userId 'nj5w3gRw' \
    --from 'FuApt5S9' \
    --limit '6' \
    --offset '34' \
    --seasonId 'MQNbmpvc' \
    --source 'SWEAT' \
    --tags 'oJvW8r5U,j0VoQW5U,mCngDbAP' \
    --to 'tyFF4Xiz' \
    > test.out 2>&1
eval_tap $? 38 'QueryUserExpGrantHistory' test.out

#- 39 QueryUserExpGrantHistoryTag
./ng net.accelbyte.sdk.cli.Main seasonpass queryUserExpGrantHistoryTag \
    --namespace "$AB_NAMESPACE" \
    --userId 'DFNR7GOC' \
    --seasonId 'A4fM5Waq' \
    > test.out 2>&1
eval_tap $? 39 'QueryUserExpGrantHistoryTag' test.out

#- 40 GetUserSeason
./ng net.accelbyte.sdk.cli.Main seasonpass getUserSeason \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'uAcqObLg' \
    --userId 'R5YOnokB' \
    > test.out 2>&1
eval_tap $? 40 'GetUserSeason' test.out

#- 41 PublicGetCurrentSeason
./ng net.accelbyte.sdk.cli.Main seasonpass publicGetCurrentSeason \
    --namespace "$AB_NAMESPACE" \
    --language '9afxfFPO' \
    > test.out 2>&1
eval_tap $? 41 'PublicGetCurrentSeason' test.out

#- 42 PublicGetCurrentUserSeason
./ng net.accelbyte.sdk.cli.Main seasonpass publicGetCurrentUserSeason \
    --namespace "$AB_NAMESPACE" \
    --userId 'hlXZsWH2' \
    > test.out 2>&1
eval_tap $? 42 'PublicGetCurrentUserSeason' test.out

#- 43 PublicClaimUserReward
./ng net.accelbyte.sdk.cli.Main seasonpass publicClaimUserReward \
    --namespace "$AB_NAMESPACE" \
    --userId 'GSpUlHmA' \
    --body '{"passCode": "j0RKwbhP", "rewardCode": "CGyrqfCH", "tierIndex": 61}' \
    > test.out 2>&1
eval_tap $? 43 'PublicClaimUserReward' test.out

#- 44 PublicBulkClaimUserRewards
./ng net.accelbyte.sdk.cli.Main seasonpass publicBulkClaimUserRewards \
    --namespace "$AB_NAMESPACE" \
    --userId 'f5kUbWtl' \
    > test.out 2>&1
eval_tap $? 44 'PublicBulkClaimUserRewards' test.out

#- 45 PublicGetUserSeason
./ng net.accelbyte.sdk.cli.Main seasonpass publicGetUserSeason \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'qPlKRAjs' \
    --userId 'NNuae5K3' \
    > test.out 2>&1
eval_tap $? 45 'PublicGetUserSeason' test.out


rm -f "tmp.dat"

exit $EXIT_CODE