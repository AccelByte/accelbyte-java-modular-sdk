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
    --limit '81' \
    --offset '94' \
    --status 'DRAFT,PUBLISHED,DRAFT' \
    > test.out 2>&1
eval_tap $? 3 'QuerySeasons' test.out

#- 4 CreateSeason
./ng net.accelbyte.sdk.cli.Main seasonpass createSeason \
    --namespace "$AB_NAMESPACE" \
    --body '{"autoClaim": false, "defaultLanguage": "lhbAv9rY", "defaultRequiredExp": 47, "draftStoreId": "4kDHhwuA", "end": "1997-08-08T00:00:00Z", "excessStrategy": {"currency": "yn9cfFzW", "method": "NONE", "percentPerExp": 65}, "images": [{"as": "NApFp9Au", "caption": "YzujpKOw", "height": 34, "imageUrl": "5AkBd5mz", "smallImageUrl": "z3IFgDAD", "width": 28}, {"as": "GP5UL2vX", "caption": "1jSkxqNj", "height": 91, "imageUrl": "F4esnbCK", "smallImageUrl": "SLPJoe6B", "width": 97}, {"as": "AE8yitVq", "caption": "toA1pfns", "height": 59, "imageUrl": "8ffXYllM", "smallImageUrl": "44PFgKqq", "width": 43}], "localizations": {"Jr0r3if9": {"description": "BRv8pCs5", "title": "jQ1KRhHF"}, "pwqnF4Py": {"description": "NyFYlqpW", "title": "AaPBndaZ"}, "jj24d42G": {"description": "dgBbSFT5", "title": "jSLzoROy"}}, "name": "grfyfURT", "start": "1986-03-16T00:00:00Z", "tierItemId": "u9LWb4HN"}' \
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
    --body '{"userIds": ["lKnoNiWL", "iqJMbNmC", "3WUwHRPp"]}' \
    > test.out 2>&1
eval_tap $? 6 'BulkGetUserSeasonProgression' test.out

#- 7 GetItemReferences
./ng net.accelbyte.sdk.cli.Main seasonpass getItemReferences \
    --namespace "$AB_NAMESPACE" \
    --itemId 'nSRTM89V' \
    > test.out 2>&1
eval_tap $? 7 'GetItemReferences' test.out

#- 8 GetSeason
./ng net.accelbyte.sdk.cli.Main seasonpass getSeason \
    --namespace "$AB_NAMESPACE" \
    --seasonId '7Y7OKpVI' \
    > test.out 2>&1
eval_tap $? 8 'GetSeason' test.out

#- 9 DeleteSeason
./ng net.accelbyte.sdk.cli.Main seasonpass deleteSeason \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'qtZovxqs' \
    > test.out 2>&1
eval_tap $? 9 'DeleteSeason' test.out

#- 10 UpdateSeason
./ng net.accelbyte.sdk.cli.Main seasonpass updateSeason \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'k7gPOPWV' \
    --body '{"autoClaim": false, "defaultLanguage": "a8faejL1", "defaultRequiredExp": 21, "draftStoreId": "kornbPh8", "end": "1976-11-23T00:00:00Z", "excessStrategy": {"currency": "5LS5fgbH", "method": "CURRENCY", "percentPerExp": 85}, "images": [{"as": "lMx8MSI7", "caption": "iIVyfqCU", "height": 27, "imageUrl": "VHCrA5Nd", "smallImageUrl": "QeMoyq7f", "width": 75}, {"as": "to5y3gIh", "caption": "KsYZv2mA", "height": 4, "imageUrl": "qwxCLi9f", "smallImageUrl": "iSaodCnL", "width": 71}, {"as": "RsOpYFuh", "caption": "W1yHmYfl", "height": 14, "imageUrl": "1WqdHxBw", "smallImageUrl": "FBYHDztn", "width": 46}], "localizations": {"1AvrShEG": {"description": "BkpedN4e", "title": "JvwyNGbo"}, "NcZY4FCT": {"description": "cVnUGnSw", "title": "Z5OW9L9p"}, "DACMPaFC": {"description": "PtLmGaJ9", "title": "BBxVCGml"}}, "name": "wRMU1pxs", "start": "1985-04-02T00:00:00Z", "tierItemId": "sby4SHI1"}' \
    > test.out 2>&1
eval_tap $? 10 'UpdateSeason' test.out

#- 11 CloneSeason
./ng net.accelbyte.sdk.cli.Main seasonpass cloneSeason \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'qmfNQ3Ax' \
    --body '{"end": "1985-10-21T00:00:00Z", "name": "hRAsdwXv", "start": "1983-08-29T00:00:00Z"}' \
    > test.out 2>&1
eval_tap $? 11 'CloneSeason' test.out

#- 12 GetFullSeason
./ng net.accelbyte.sdk.cli.Main seasonpass getFullSeason \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'VkjPVmJV' \
    > test.out 2>&1
eval_tap $? 12 'GetFullSeason' test.out

#- 13 QueryPasses
./ng net.accelbyte.sdk.cli.Main seasonpass queryPasses \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'YZfeChin' \
    > test.out 2>&1
eval_tap $? 13 'QueryPasses' test.out

#- 14 CreatePass
./ng net.accelbyte.sdk.cli.Main seasonpass createPass \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'HOpQRj3A' \
    --body '{"autoEnroll": false, "code": "vYJdy6fT", "displayOrder": 43, "images": [{"as": "UenIY60b", "caption": "rdLOMRfH", "height": 32, "imageUrl": "fHQctwT1", "smallImageUrl": "2NCVGp2k", "width": 7}, {"as": "XXdTHEBu", "caption": "LafcqA3w", "height": 73, "imageUrl": "jEfRxd2O", "smallImageUrl": "Q9GSkC3T", "width": 50}, {"as": "0vylk2mm", "caption": "YhOPuQpw", "height": 80, "imageUrl": "n0gJ3Iyi", "smallImageUrl": "r2WzhBiI", "width": 92}], "localizations": {"8NHyAMck": {"description": "VZ6HA8yD", "title": "lEln4VuK"}, "FnjD9csl": {"description": "PsZj9x9r", "title": "dqxbp7sG"}, "7hSC2qzu": {"description": "b50Cl3d6", "title": "CGLvEUQP"}}, "passItemId": "3UT0v3vb"}' \
    > test.out 2>&1
eval_tap $? 14 'CreatePass' test.out

#- 15 GetPass
./ng net.accelbyte.sdk.cli.Main seasonpass getPass \
    --code 'XOAXMIJj' \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'tVvupk1G' \
    > test.out 2>&1
eval_tap $? 15 'GetPass' test.out

#- 16 DeletePass
./ng net.accelbyte.sdk.cli.Main seasonpass deletePass \
    --code 'XGaCyFIC' \
    --namespace "$AB_NAMESPACE" \
    --seasonId '0ljxpQR1' \
    > test.out 2>&1
eval_tap $? 16 'DeletePass' test.out

#- 17 UpdatePass
./ng net.accelbyte.sdk.cli.Main seasonpass updatePass \
    --code 'WaUZcH1M' \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'patxWJzX' \
    --body '{"autoEnroll": false, "displayOrder": 49, "images": [{"as": "uq0pdCiN", "caption": "5F7oCy0M", "height": 71, "imageUrl": "N9CYZ9qk", "smallImageUrl": "6yBYpxQ7", "width": 58}, {"as": "IrqJtcyf", "caption": "kWlaxGtZ", "height": 73, "imageUrl": "lhrwZ9Ri", "smallImageUrl": "mnkr4PCy", "width": 75}, {"as": "rsdc0hz9", "caption": "Cgzu9MaZ", "height": 58, "imageUrl": "sJDROXB0", "smallImageUrl": "02Lip6ha", "width": 0}], "localizations": {"eEaDrZK9": {"description": "I06bXgVn", "title": "ij218KSh"}, "TmUYOz6x": {"description": "ifud5t3G", "title": "h9lsOek8"}, "3aiaCaqz": {"description": "WVtEkRQy", "title": "MXq7kqEO"}}, "passItemId": "IBmuIaMS"}' \
    > test.out 2>&1
eval_tap $? 17 'UpdatePass' test.out

#- 18 PublishSeason
./ng net.accelbyte.sdk.cli.Main seasonpass publishSeason \
    --namespace "$AB_NAMESPACE" \
    --seasonId '0L2MhEeR' \
    > test.out 2>&1
eval_tap $? 18 'PublishSeason' test.out

#- 19 RetireSeason
./ng net.accelbyte.sdk.cli.Main seasonpass retireSeason \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'f82VlRVn' \
    --force  \
    > test.out 2>&1
eval_tap $? 19 'RetireSeason' test.out

#- 20 QueryRewards
./ng net.accelbyte.sdk.cli.Main seasonpass queryRewards \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'lErPWfeD' \
    --q 'V9E0V0iW' \
    > test.out 2>&1
eval_tap $? 20 'QueryRewards' test.out

#- 21 CreateReward
./ng net.accelbyte.sdk.cli.Main seasonpass createReward \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'HZg01FY6' \
    --body '{"code": "FnIsUAfi", "currency": {"currencyCode": "wu4M2RYS", "namespace": "OIaNUwPO"}, "image": {"as": "6aWd5FSk", "caption": "zU74Lxva", "height": 23, "imageUrl": "VaiRqM8J", "smallImageUrl": "lNBfyJcA", "width": 98}, "itemId": "iELqGVIm", "quantity": 15, "type": "CURRENCY"}' \
    > test.out 2>&1
eval_tap $? 21 'CreateReward' test.out

#- 22 GetReward
./ng net.accelbyte.sdk.cli.Main seasonpass getReward \
    --code 'gpNK0tnb' \
    --namespace "$AB_NAMESPACE" \
    --seasonId '6fU7taoV' \
    > test.out 2>&1
eval_tap $? 22 'GetReward' test.out

#- 23 DeleteReward
./ng net.accelbyte.sdk.cli.Main seasonpass deleteReward \
    --code 'Jr78RpMG' \
    --namespace "$AB_NAMESPACE" \
    --seasonId '71H4GwHc' \
    > test.out 2>&1
eval_tap $? 23 'DeleteReward' test.out

#- 24 UpdateReward
./ng net.accelbyte.sdk.cli.Main seasonpass updateReward \
    --code 'ZrhyBapR' \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'SjOlFupi' \
    --body '{"currency": {"currencyCode": "InET9QqY", "namespace": "hqsOUVeJ"}, "image": {"as": "EUkrH9Is", "caption": "Y57m89El", "height": 82, "imageUrl": "Y1tLX7iQ", "smallImageUrl": "KZbyNyDv", "width": 16}, "itemId": "xxruz2Du", "nullFields": ["PARYyfEY", "mo3lFVXn", "PuW7LISA"], "quantity": 74, "type": "CURRENCY"}' \
    > test.out 2>&1
eval_tap $? 24 'UpdateReward' test.out

#- 25 QueryTiers
./ng net.accelbyte.sdk.cli.Main seasonpass queryTiers \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'IHRcndnF' \
    --limit '100' \
    --offset '57' \
    > test.out 2>&1
eval_tap $? 25 'QueryTiers' test.out

#- 26 CreateTier
./ng net.accelbyte.sdk.cli.Main seasonpass createTier \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'fSOaaHcr' \
    --body '{"index": 79, "quantity": 22, "tier": {"requiredExp": 92, "rewards": {"VgqagBD2": ["VEDZ05EH", "XsOfBA1W", "d9Wjc2wd"], "xV5Vwa0h": ["ZpNLMays", "rOOLIjiq", "sNw93SUR"], "LMR9KBUy": ["FupifFs5", "WhudXMIL", "CzQTiGaK"]}}}' \
    > test.out 2>&1
eval_tap $? 26 'CreateTier' test.out

#- 27 UpdateTier
./ng net.accelbyte.sdk.cli.Main seasonpass updateTier \
    --id 'fBvjXORO' \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'OPAqSaJ5' \
    --body '{"requiredExp": 76, "rewards": {"ncOhwh6E": ["OhrKpH6S", "ufl4kLXH", "l856mXz4"], "YAglfjb4": ["XAhd8np4", "nLGWqlJn", "yeVjZHjd"], "sUy4AuLM": ["doooBn6A", "eIsyddyI", "UlLYWfoV"]}}' \
    > test.out 2>&1
eval_tap $? 27 'UpdateTier' test.out

#- 28 DeleteTier
./ng net.accelbyte.sdk.cli.Main seasonpass deleteTier \
    --id 'cKfPu52f' \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'NShj9wWF' \
    > test.out 2>&1
eval_tap $? 28 'DeleteTier' test.out

#- 29 ReorderTier
./ng net.accelbyte.sdk.cli.Main seasonpass reorderTier \
    --id 'EXPIvPuX' \
    --namespace "$AB_NAMESPACE" \
    --seasonId '52ptdObY' \
    --body '{"newIndex": 15}' \
    > test.out 2>&1
eval_tap $? 29 'ReorderTier' test.out

#- 30 UnpublishSeason
./ng net.accelbyte.sdk.cli.Main seasonpass unpublishSeason \
    --namespace "$AB_NAMESPACE" \
    --seasonId '6KERlF7d' \
    --force  \
    > test.out 2>&1
eval_tap $? 30 'UnpublishSeason' test.out

#- 31 GetUserParticipatedSeasons
./ng net.accelbyte.sdk.cli.Main seasonpass getUserParticipatedSeasons \
    --namespace "$AB_NAMESPACE" \
    --userId 'eLFkgJ70' \
    --limit '31' \
    --offset '18' \
    > test.out 2>&1
eval_tap $? 31 'GetUserParticipatedSeasons' test.out

#- 32 GrantUserExp
./ng net.accelbyte.sdk.cli.Main seasonpass grantUserExp \
    --namespace "$AB_NAMESPACE" \
    --userId '04PdS2eS' \
    --body '{"exp": 2, "source": "SWEAT", "tags": ["VbtGYsEh", "y7ZmRulf", "uyiZu5d6"]}' \
    > test.out 2>&1
eval_tap $? 32 'GrantUserExp' test.out

#- 33 GrantUserPass
./ng net.accelbyte.sdk.cli.Main seasonpass grantUserPass \
    --namespace "$AB_NAMESPACE" \
    --userId 'e0A0iON3' \
    --body '{"passCode": "8mtI8pXA", "passItemId": "rWM9DNrA"}' \
    > test.out 2>&1
eval_tap $? 33 'GrantUserPass' test.out

#- 34 ExistsAnyPassByPassCodes
./ng net.accelbyte.sdk.cli.Main seasonpass existsAnyPassByPassCodes \
    --namespace "$AB_NAMESPACE" \
    --userId 'mLugWwOr' \
    --passCodes 'Hr3oNPBT,3V1Pkg9F,xYez1z3L' \
    > test.out 2>&1
eval_tap $? 34 'ExistsAnyPassByPassCodes' test.out

#- 35 GetCurrentUserSeasonProgression
./ng net.accelbyte.sdk.cli.Main seasonpass getCurrentUserSeasonProgression \
    --namespace "$AB_NAMESPACE" \
    --userId 'PHZDftmI' \
    > test.out 2>&1
eval_tap $? 35 'GetCurrentUserSeasonProgression' test.out

#- 36 CheckSeasonPurchasable
./ng net.accelbyte.sdk.cli.Main seasonpass checkSeasonPurchasable \
    --namespace "$AB_NAMESPACE" \
    --userId 'NVCYFSvZ' \
    --body '{"passItemId": "plu80hQR", "tierItemCount": 93, "tierItemId": "xg4lCBHT"}' \
    > test.out 2>&1
eval_tap $? 36 'CheckSeasonPurchasable' test.out

#- 37 ResetUserSeason
./ng net.accelbyte.sdk.cli.Main seasonpass resetUserSeason \
    --namespace "$AB_NAMESPACE" \
    --userId 'a5V6goEU' \
    > test.out 2>&1
eval_tap $? 37 'ResetUserSeason' test.out

#- 38 GrantUserTier
./ng net.accelbyte.sdk.cli.Main seasonpass grantUserTier \
    --namespace "$AB_NAMESPACE" \
    --userId 'b6TNaQDZ' \
    --body '{"count": 83, "source": "SWEAT", "tags": ["dYh4DlbH", "74j6h0r8", "AX7LNdgY"]}' \
    > test.out 2>&1
eval_tap $? 38 'GrantUserTier' test.out

#- 39 QueryUserExpGrantHistory
./ng net.accelbyte.sdk.cli.Main seasonpass queryUserExpGrantHistory \
    --namespace "$AB_NAMESPACE" \
    --userId '2SAbXvY6' \
    --from 'Q85zNSdb' \
    --limit '12' \
    --offset '98' \
    --seasonId 'xxByqFGv' \
    --source 'PAID_FOR' \
    --tags 'd0PFant3,Vv2gvzJU,VqEgxY38' \
    --to 'upcm4bQM' \
    > test.out 2>&1
eval_tap $? 39 'QueryUserExpGrantHistory' test.out

#- 40 QueryUserExpGrantHistoryTag
./ng net.accelbyte.sdk.cli.Main seasonpass queryUserExpGrantHistoryTag \
    --namespace "$AB_NAMESPACE" \
    --userId 'haqZVGEB' \
    --seasonId 'vrFRDJHI' \
    > test.out 2>&1
eval_tap $? 40 'QueryUserExpGrantHistoryTag' test.out

#- 41 GetUserSeason
./ng net.accelbyte.sdk.cli.Main seasonpass getUserSeason \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'i64I18XB' \
    --userId '35JNr5zU' \
    > test.out 2>&1
eval_tap $? 41 'GetUserSeason' test.out

#- 42 PublicGetCurrentSeason
./ng net.accelbyte.sdk.cli.Main seasonpass publicGetCurrentSeason \
    --namespace "$AB_NAMESPACE" \
    --language 'oKegd0hy' \
    > test.out 2>&1
eval_tap $? 42 'PublicGetCurrentSeason' test.out

#- 43 PublicGetCurrentUserSeason
./ng net.accelbyte.sdk.cli.Main seasonpass publicGetCurrentUserSeason \
    --namespace "$AB_NAMESPACE" \
    --userId '6mUsB426' \
    > test.out 2>&1
eval_tap $? 43 'PublicGetCurrentUserSeason' test.out

#- 44 PublicClaimUserReward
./ng net.accelbyte.sdk.cli.Main seasonpass publicClaimUserReward \
    --namespace "$AB_NAMESPACE" \
    --userId 'ICgdQHuT' \
    --body '{"passCode": "ikXexBHI", "rewardCode": "0X4E4BAs", "tierIndex": 85}' \
    > test.out 2>&1
eval_tap $? 44 'PublicClaimUserReward' test.out

#- 45 PublicBulkClaimUserRewards
./ng net.accelbyte.sdk.cli.Main seasonpass publicBulkClaimUserRewards \
    --namespace "$AB_NAMESPACE" \
    --userId 'PI2nxOCx' \
    > test.out 2>&1
eval_tap $? 45 'PublicBulkClaimUserRewards' test.out

#- 46 PublicGetUserSeason
./ng net.accelbyte.sdk.cli.Main seasonpass publicGetUserSeason \
    --namespace "$AB_NAMESPACE" \
    --seasonId '04Kn3vLM' \
    --userId 'j0aMHMPk' \
    > test.out 2>&1
eval_tap $? 46 'PublicGetUserSeason' test.out


rm -f "tmp.dat"

exit $EXIT_CODE