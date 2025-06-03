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
echo "1..64"

#- 1 Login
./ng net.accelbyte.sdk.cli.Main loginClient \
    > test.out 2>&1
eval_tap $? 1 'Login' test.out

if [ $EXIT_CODE -ne 0 ]; then
  echo "Bail out! Login failed."
  exit $EXIT_CODE
fi

touch "tmp.dat"

#- 2 GetLeaderboardConfigurationsAdminV1
./ng net.accelbyte.sdk.cli.Main leaderboard getLeaderboardConfigurationsAdminV1 \
    --namespace "$AB_NAMESPACE" \
    --isArchived  \
    --isDeleted  \
    --limit '60' \
    --offset '69' \
    > test.out 2>&1
eval_tap $? 2 'GetLeaderboardConfigurationsAdminV1' test.out

#- 3 CreateLeaderboardConfigurationAdminV1
./ng net.accelbyte.sdk.cli.Main leaderboard createLeaderboardConfigurationAdminV1 \
    --namespace "$AB_NAMESPACE" \
    --body '{"daily": {"resetTime": "ImvVjD1p"}, "descending": true, "iconURL": "MHhzbAyX", "leaderboardCode": "ERQAfGKr", "monthly": {"resetDate": 85, "resetTime": "mQTwdflm"}, "name": "8EdUyMbS", "seasonPeriod": 42, "startTime": "fUQ1Ormr", "statCode": "htpd01zr", "weekly": {"resetDay": 80, "resetTime": "l9trHh6j"}}' \
    > test.out 2>&1
eval_tap $? 3 'CreateLeaderboardConfigurationAdminV1' test.out

#- 4 AdminGetArchivedLeaderboardRankingDataV1Handler
./ng net.accelbyte.sdk.cli.Main leaderboard adminGetArchivedLeaderboardRankingDataV1Handler \
    --namespace "$AB_NAMESPACE" \
    --slug 'y0O0dDiz' \
    --leaderboardCodes 'MsqPf1Pn' \
    > test.out 2>&1
eval_tap $? 4 'AdminGetArchivedLeaderboardRankingDataV1Handler' test.out

#- 5 CreateArchivedLeaderboardRankingDataV1Handler
./ng net.accelbyte.sdk.cli.Main leaderboard createArchivedLeaderboardRankingDataV1Handler \
    --namespace "$AB_NAMESPACE" \
    --body '{"leaderboardCodes": ["X6pZulI9", "7scddeqP", "UtmofnVa"], "limit": 84, "slug": "ZxDFSYpg"}' \
    > test.out 2>&1
eval_tap $? 5 'CreateArchivedLeaderboardRankingDataV1Handler' test.out

#- 6 DeleteBulkLeaderboardConfigurationAdminV1
./ng net.accelbyte.sdk.cli.Main leaderboard deleteBulkLeaderboardConfigurationAdminV1 \
    --namespace "$AB_NAMESPACE" \
    --body '{"leaderboardCodes": ["oSizaoJw", "PcgMRI23", "mskLwxZC"]}' \
    > test.out 2>&1
eval_tap $? 6 'DeleteBulkLeaderboardConfigurationAdminV1' test.out

#- 7 GetLeaderboardConfigurationAdminV1
./ng net.accelbyte.sdk.cli.Main leaderboard getLeaderboardConfigurationAdminV1 \
    --leaderboardCode 'PHSHh7iV' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 7 'GetLeaderboardConfigurationAdminV1' test.out

#- 8 UpdateLeaderboardConfigurationAdminV1
./ng net.accelbyte.sdk.cli.Main leaderboard updateLeaderboardConfigurationAdminV1 \
    --leaderboardCode 'UCr4sWOZ' \
    --namespace "$AB_NAMESPACE" \
    --body '{"daily": {"resetTime": "ZalMZwIA"}, "descending": false, "iconURL": "yzjmBEic", "monthly": {"resetDate": 95, "resetTime": "58EJ527p"}, "name": "XzTzUXHq", "seasonPeriod": 57, "startTime": "Zevt2nzu", "statCode": "6PWSIIqo", "weekly": {"resetDay": 49, "resetTime": "ToopdxeB"}}' \
    > test.out 2>&1
eval_tap $? 8 'UpdateLeaderboardConfigurationAdminV1' test.out

#- 9 DeleteLeaderboardConfigurationAdminV1
./ng net.accelbyte.sdk.cli.Main leaderboard deleteLeaderboardConfigurationAdminV1 \
    --leaderboardCode '2FTxHJoH' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 9 'DeleteLeaderboardConfigurationAdminV1' test.out

#- 10 GetAllTimeLeaderboardRankingAdminV1
./ng net.accelbyte.sdk.cli.Main leaderboard getAllTimeLeaderboardRankingAdminV1 \
    --leaderboardCode '3jHkRytO' \
    --namespace "$AB_NAMESPACE" \
    --limit '8' \
    --offset '49' \
    > test.out 2>&1
eval_tap $? 10 'GetAllTimeLeaderboardRankingAdminV1' test.out

#- 11 HardDeleteLeaderboardAdminV1
./ng net.accelbyte.sdk.cli.Main leaderboard hardDeleteLeaderboardAdminV1 \
    --leaderboardCode 'i43cN6QW' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 11 'HardDeleteLeaderboardAdminV1' test.out

#- 12 GetCurrentMonthLeaderboardRankingAdminV1
./ng net.accelbyte.sdk.cli.Main leaderboard getCurrentMonthLeaderboardRankingAdminV1 \
    --leaderboardCode 'jdZjg93f' \
    --namespace "$AB_NAMESPACE" \
    --limit '5' \
    --offset '100' \
    --previousVersion '3' \
    > test.out 2>&1
eval_tap $? 12 'GetCurrentMonthLeaderboardRankingAdminV1' test.out

#- 13 DeleteUserRankingByLeaderboardCodeAdminV1
./ng net.accelbyte.sdk.cli.Main leaderboard deleteUserRankingByLeaderboardCodeAdminV1 \
    --leaderboardCode 'aWWPn7qC' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 13 'DeleteUserRankingByLeaderboardCodeAdminV1' test.out

#- 14 GetCurrentSeasonLeaderboardRankingAdminV1
./ng net.accelbyte.sdk.cli.Main leaderboard getCurrentSeasonLeaderboardRankingAdminV1 \
    --leaderboardCode 'vxXPeggl' \
    --namespace "$AB_NAMESPACE" \
    --limit '9' \
    --offset '63' \
    --previousVersion '23' \
    > test.out 2>&1
eval_tap $? 14 'GetCurrentSeasonLeaderboardRankingAdminV1' test.out

#- 15 GetTodayLeaderboardRankingAdminV1
./ng net.accelbyte.sdk.cli.Main leaderboard getTodayLeaderboardRankingAdminV1 \
    --leaderboardCode 'fJg3a42Z' \
    --namespace "$AB_NAMESPACE" \
    --limit '32' \
    --offset '74' \
    --previousVersion '82' \
    > test.out 2>&1
eval_tap $? 15 'GetTodayLeaderboardRankingAdminV1' test.out

#- 16 GetUserRankingAdminV1
./ng net.accelbyte.sdk.cli.Main leaderboard getUserRankingAdminV1 \
    --leaderboardCode 'pWWOGBeT' \
    --namespace "$AB_NAMESPACE" \
    --userId 'SO3ncnCD' \
    --previousVersion '27' \
    > test.out 2>&1
eval_tap $? 16 'GetUserRankingAdminV1' test.out

#- 17 UpdateUserPointAdminV1
./ng net.accelbyte.sdk.cli.Main leaderboard updateUserPointAdminV1 \
    --leaderboardCode 'XMnRyrTs' \
    --namespace "$AB_NAMESPACE" \
    --userId 'aBQgnb9P' \
    --body '{"inc": 0.9160127798916405, "latestValue": 0.40411432556366367}' \
    > test.out 2>&1
eval_tap $? 17 'UpdateUserPointAdminV1' test.out

#- 18 DeleteUserRankingAdminV1
./ng net.accelbyte.sdk.cli.Main leaderboard deleteUserRankingAdminV1 \
    --leaderboardCode 'wBU8xuzJ' \
    --namespace "$AB_NAMESPACE" \
    --userId 'ULfkNpYB' \
    > test.out 2>&1
eval_tap $? 18 'DeleteUserRankingAdminV1' test.out

#- 19 GetCurrentWeekLeaderboardRankingAdminV1
./ng net.accelbyte.sdk.cli.Main leaderboard getCurrentWeekLeaderboardRankingAdminV1 \
    --leaderboardCode 'qFRebuVQ' \
    --namespace "$AB_NAMESPACE" \
    --limit '38' \
    --offset '55' \
    --previousVersion '23' \
    > test.out 2>&1
eval_tap $? 19 'GetCurrentWeekLeaderboardRankingAdminV1' test.out

#- 20 DeleteUserRankingsAdminV1
./ng net.accelbyte.sdk.cli.Main leaderboard deleteUserRankingsAdminV1 \
    --namespace "$AB_NAMESPACE" \
    --userId 'Y1kKuS8m' \
    --leaderboardCode '2mdXqwa2,XXIDI73l,HDenOqTt' \
    > test.out 2>&1
eval_tap $? 20 'DeleteUserRankingsAdminV1' test.out

#- 21 AdminAnonymizeUserLeaderboardAdminV1
./ng net.accelbyte.sdk.cli.Main leaderboard adminAnonymizeUserLeaderboardAdminV1 \
    --namespace "$AB_NAMESPACE" \
    --userId '7VV7jV5k' \
    > test.out 2>&1
eval_tap $? 21 'AdminAnonymizeUserLeaderboardAdminV1' test.out

#- 22 GetUserLeaderboardRankingsAdminV1
./ng net.accelbyte.sdk.cli.Main leaderboard getUserLeaderboardRankingsAdminV1 \
    --namespace "$AB_NAMESPACE" \
    --userId 'hfnLKtGR' \
    --limit '68' \
    --offset '45' \
    --previousVersion '99' \
    > test.out 2>&1
eval_tap $? 22 'GetUserLeaderboardRankingsAdminV1' test.out

#- 23 GetLeaderboardConfigurationsPublicV1
./ng net.accelbyte.sdk.cli.Main leaderboard getLeaderboardConfigurationsPublicV1 \
    --namespace "$AB_NAMESPACE" \
    --isArchived  \
    --isDeleted  \
    --limit '89' \
    --offset '42' \
    > test.out 2>&1
eval_tap $? 23 'GetLeaderboardConfigurationsPublicV1' test.out

#- 24 CreateLeaderboardConfigurationPublicV1
./ng net.accelbyte.sdk.cli.Main leaderboard createLeaderboardConfigurationPublicV1 \
    --namespace "$AB_NAMESPACE" \
    --body '{"daily": {"resetTime": "2oMUEFzg"}, "descending": false, "iconURL": "aNK6sidF", "leaderboardCode": "3RgZAx0B", "monthly": {"resetDate": 23, "resetTime": "Igi8TcTo"}, "name": "ResSuTJZ", "seasonPeriod": 13, "startTime": "EBcUCt9P", "statCode": "d4Yh1Igj", "weekly": {"resetDay": 65, "resetTime": "Sa4GhpZn"}}' \
    > test.out 2>&1
eval_tap $? 24 'CreateLeaderboardConfigurationPublicV1' test.out

#- 25 GetAllTimeLeaderboardRankingPublicV1
./ng net.accelbyte.sdk.cli.Main leaderboard getAllTimeLeaderboardRankingPublicV1 \
    --leaderboardCode 'KgT824oX' \
    --namespace "$AB_NAMESPACE" \
    --limit '44' \
    --offset '5' \
    > test.out 2>&1
eval_tap $? 25 'GetAllTimeLeaderboardRankingPublicV1' test.out

#- 26 GetArchivedLeaderboardRankingDataV1Handler
./ng net.accelbyte.sdk.cli.Main leaderboard getArchivedLeaderboardRankingDataV1Handler \
    --leaderboardCode 'OxlRBD7e' \
    --namespace "$AB_NAMESPACE" \
    --slug 'e5RJnAGA' \
    --leaderboardCodes 'Ph3Xvt3h' \
    > test.out 2>&1
eval_tap $? 26 'GetArchivedLeaderboardRankingDataV1Handler' test.out

#- 27 GetCurrentMonthLeaderboardRankingPublicV1
./ng net.accelbyte.sdk.cli.Main leaderboard getCurrentMonthLeaderboardRankingPublicV1 \
    --leaderboardCode 'F0i2lMgk' \
    --namespace "$AB_NAMESPACE" \
    --limit '3' \
    --offset '85' \
    --previousVersion '10' \
    > test.out 2>&1
eval_tap $? 27 'GetCurrentMonthLeaderboardRankingPublicV1' test.out

#- 28 GetCurrentSeasonLeaderboardRankingPublicV1
./ng net.accelbyte.sdk.cli.Main leaderboard getCurrentSeasonLeaderboardRankingPublicV1 \
    --leaderboardCode 'NoicCiAi' \
    --namespace "$AB_NAMESPACE" \
    --limit '78' \
    --offset '96' \
    --previousVersion '66' \
    > test.out 2>&1
eval_tap $? 28 'GetCurrentSeasonLeaderboardRankingPublicV1' test.out

#- 29 GetTodayLeaderboardRankingPublicV1
./ng net.accelbyte.sdk.cli.Main leaderboard getTodayLeaderboardRankingPublicV1 \
    --leaderboardCode 'mNAc9PdW' \
    --namespace "$AB_NAMESPACE" \
    --limit '50' \
    --offset '70' \
    --previousVersion '41' \
    > test.out 2>&1
eval_tap $? 29 'GetTodayLeaderboardRankingPublicV1' test.out

#- 30 GetUserRankingPublicV1
./ng net.accelbyte.sdk.cli.Main leaderboard getUserRankingPublicV1 \
    --leaderboardCode 'qIiHJfgX' \
    --namespace "$AB_NAMESPACE" \
    --userId 'mn2ummk2' \
    --previousVersion '79' \
    > test.out 2>&1
eval_tap $? 30 'GetUserRankingPublicV1' test.out

#- 31 DeleteUserRankingPublicV1
./ng net.accelbyte.sdk.cli.Main leaderboard deleteUserRankingPublicV1 \
    --leaderboardCode 'bQMQrQRg' \
    --namespace "$AB_NAMESPACE" \
    --userId 'PuU1TLYg' \
    > test.out 2>&1
eval_tap $? 31 'DeleteUserRankingPublicV1' test.out

#- 32 GetCurrentWeekLeaderboardRankingPublicV1
./ng net.accelbyte.sdk.cli.Main leaderboard getCurrentWeekLeaderboardRankingPublicV1 \
    --leaderboardCode 'd7pMzDVl' \
    --namespace "$AB_NAMESPACE" \
    --limit '82' \
    --offset '74' \
    --previousVersion '79' \
    > test.out 2>&1
eval_tap $? 32 'GetCurrentWeekLeaderboardRankingPublicV1' test.out

#- 33 GetHiddenUsersV2
./ng net.accelbyte.sdk.cli.Main leaderboard getHiddenUsersV2 \
    --leaderboardCode 'dmLkuBna' \
    --namespace "$AB_NAMESPACE" \
    --limit '46' \
    --offset '87' \
    > test.out 2>&1
eval_tap $? 33 'GetHiddenUsersV2' test.out

#- 34 GetUserVisibilityStatusV2
./ng net.accelbyte.sdk.cli.Main leaderboard getUserVisibilityStatusV2 \
    --leaderboardCode 'j1MRQILm' \
    --namespace "$AB_NAMESPACE" \
    --userId 'inHE20Ip' \
    > test.out 2>&1
eval_tap $? 34 'GetUserVisibilityStatusV2' test.out

#- 35 SetUserLeaderboardVisibilityStatusV2
./ng net.accelbyte.sdk.cli.Main leaderboard setUserLeaderboardVisibilityStatusV2 \
    --leaderboardCode 'UxRKG4w0' \
    --namespace "$AB_NAMESPACE" \
    --userId 'yc0yn9C5' \
    --body '{"visibility": true}' \
    > test.out 2>&1
eval_tap $? 35 'SetUserLeaderboardVisibilityStatusV2' test.out

#- 36 SetUserVisibilityStatusV2
./ng net.accelbyte.sdk.cli.Main leaderboard setUserVisibilityStatusV2 \
    --namespace "$AB_NAMESPACE" \
    --userId '5ZtWEiCx' \
    --body '{"visibility": true}' \
    > test.out 2>&1
eval_tap $? 36 'SetUserVisibilityStatusV2' test.out

#- 37 GetLeaderboardConfigurationsPublicV2
./ng net.accelbyte.sdk.cli.Main leaderboard getLeaderboardConfigurationsPublicV2 \
    --namespace "$AB_NAMESPACE" \
    --limit '31' \
    --offset '15' \
    > test.out 2>&1
eval_tap $? 37 'GetLeaderboardConfigurationsPublicV2' test.out

#- 38 GetAllTimeLeaderboardRankingPublicV2
./ng net.accelbyte.sdk.cli.Main leaderboard getAllTimeLeaderboardRankingPublicV2 \
    --leaderboardCode 'IRxoKJtL' \
    --namespace "$AB_NAMESPACE" \
    --limit '55' \
    --offset '35' \
    > test.out 2>&1
eval_tap $? 38 'GetAllTimeLeaderboardRankingPublicV2' test.out

#- 39 GetLeaderboardConfigurationsAdminV3
./ng net.accelbyte.sdk.cli.Main leaderboard getLeaderboardConfigurationsAdminV3 \
    --namespace "$AB_NAMESPACE" \
    --isDeleted  \
    --limit '98' \
    --offset '94' \
    > test.out 2>&1
eval_tap $? 39 'GetLeaderboardConfigurationsAdminV3' test.out

#- 40 CreateLeaderboardConfigurationAdminV3
./ng net.accelbyte.sdk.cli.Main leaderboard createLeaderboardConfigurationAdminV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"allTime": false, "cycleIds": ["qytGnjYu", "tjSMsagD", "U6YArFA2"], "descending": false, "description": "4u0sR1GY", "iconURL": "DoaRF215", "leaderboardCode": "LcuBHM80", "name": "WTBnCOZd", "statCode": "P9eVebJb"}' \
    > test.out 2>&1
eval_tap $? 40 'CreateLeaderboardConfigurationAdminV3' test.out

#- 41 DeleteBulkLeaderboardConfigurationAdminV3
./ng net.accelbyte.sdk.cli.Main leaderboard deleteBulkLeaderboardConfigurationAdminV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"leaderboardCodes": ["iR1QebRv", "rqRrK0r9", "R9ATbAQo"]}' \
    > test.out 2>&1
eval_tap $? 41 'DeleteBulkLeaderboardConfigurationAdminV3' test.out

#- 42 GetLeaderboardConfigurationAdminV3
./ng net.accelbyte.sdk.cli.Main leaderboard getLeaderboardConfigurationAdminV3 \
    --leaderboardCode '8YblAnKl' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 42 'GetLeaderboardConfigurationAdminV3' test.out

#- 43 UpdateLeaderboardConfigurationAdminV3
./ng net.accelbyte.sdk.cli.Main leaderboard updateLeaderboardConfigurationAdminV3 \
    --leaderboardCode 'GF4on2w4' \
    --namespace "$AB_NAMESPACE" \
    --body '{"allTime": false, "cycleIds": ["JbOb2Gjh", "luIcm9hj", "mYfgIiwu"], "descending": true, "description": "PGTlVaOb", "iconURL": "JU3sHjeq", "name": "SW9poprP"}' \
    > test.out 2>&1
eval_tap $? 43 'UpdateLeaderboardConfigurationAdminV3' test.out

#- 44 DeleteLeaderboardConfigurationAdminV3
./ng net.accelbyte.sdk.cli.Main leaderboard deleteLeaderboardConfigurationAdminV3 \
    --leaderboardCode 'iyIKtcka' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 44 'DeleteLeaderboardConfigurationAdminV3' test.out

#- 45 GetAllTimeLeaderboardRankingAdminV3
./ng net.accelbyte.sdk.cli.Main leaderboard getAllTimeLeaderboardRankingAdminV3 \
    --leaderboardCode 'bBZHX9f3' \
    --namespace "$AB_NAMESPACE" \
    --limit '92' \
    --offset '39' \
    > test.out 2>&1
eval_tap $? 45 'GetAllTimeLeaderboardRankingAdminV3' test.out

#- 46 GetCurrentCycleLeaderboardRankingAdminV3
./ng net.accelbyte.sdk.cli.Main leaderboard getCurrentCycleLeaderboardRankingAdminV3 \
    --cycleId 'OcDehEoK' \
    --leaderboardCode '0e7zLfWy' \
    --namespace "$AB_NAMESPACE" \
    --limit '64' \
    --offset '35' \
    --previousVersion '13' \
    > test.out 2>&1
eval_tap $? 46 'GetCurrentCycleLeaderboardRankingAdminV3' test.out

#- 47 DeleteAllUserRankingByCycleIdAdminV3
./ng net.accelbyte.sdk.cli.Main leaderboard deleteAllUserRankingByCycleIdAdminV3 \
    --cycleId '5XvxEcGp' \
    --leaderboardCode 'hXOo4KRs' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 47 'DeleteAllUserRankingByCycleIdAdminV3' test.out

#- 48 DeleteUserRankingByCycleIdAdminV3
./ng net.accelbyte.sdk.cli.Main leaderboard deleteUserRankingByCycleIdAdminV3 \
    --cycleId 'EDO8qQfs' \
    --leaderboardCode 'LxT1dIba' \
    --namespace "$AB_NAMESPACE" \
    --userId 'zrR6jH3p' \
    > test.out 2>&1
eval_tap $? 48 'DeleteUserRankingByCycleIdAdminV3' test.out

#- 49 HardDeleteLeaderboardAdminV3
./ng net.accelbyte.sdk.cli.Main leaderboard hardDeleteLeaderboardAdminV3 \
    --leaderboardCode '6YC0Y1c8' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 49 'HardDeleteLeaderboardAdminV3' test.out

#- 50 DeleteUserRankingByLeaderboardCodeAdminV3
./ng net.accelbyte.sdk.cli.Main leaderboard deleteUserRankingByLeaderboardCodeAdminV3 \
    --leaderboardCode 'rCLpoUSG' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 50 'DeleteUserRankingByLeaderboardCodeAdminV3' test.out

#- 51 GetHiddenUsersV3
./ng net.accelbyte.sdk.cli.Main leaderboard getHiddenUsersV3 \
    --leaderboardCode 'oGcZQPhR' \
    --namespace "$AB_NAMESPACE" \
    --limit '32' \
    --offset '78' \
    > test.out 2>&1
eval_tap $? 51 'GetHiddenUsersV3' test.out

#- 52 GetUserRankingAdminV3
./ng net.accelbyte.sdk.cli.Main leaderboard getUserRankingAdminV3 \
    --leaderboardCode 'NBFvuy6K' \
    --namespace "$AB_NAMESPACE" \
    --userId 'z0y34eK9' \
    --previousVersion '59' \
    > test.out 2>&1
eval_tap $? 52 'GetUserRankingAdminV3' test.out

#- 53 DeleteUserRankingAdminV3
./ng net.accelbyte.sdk.cli.Main leaderboard deleteUserRankingAdminV3 \
    --leaderboardCode 'sxfd1USh' \
    --namespace "$AB_NAMESPACE" \
    --userId 'emMFPhXe' \
    > test.out 2>&1
eval_tap $? 53 'DeleteUserRankingAdminV3' test.out

#- 54 GetUserVisibilityStatusV3
./ng net.accelbyte.sdk.cli.Main leaderboard getUserVisibilityStatusV3 \
    --leaderboardCode '1kYxCunC' \
    --namespace "$AB_NAMESPACE" \
    --userId 'El5rCu05' \
    > test.out 2>&1
eval_tap $? 54 'GetUserVisibilityStatusV3' test.out

#- 55 SetUserLeaderboardVisibilityV3
./ng net.accelbyte.sdk.cli.Main leaderboard setUserLeaderboardVisibilityV3 \
    --leaderboardCode 'KL1Sk6h6' \
    --namespace "$AB_NAMESPACE" \
    --userId 'QV2iIKIz' \
    --body '{"visibility": false}' \
    > test.out 2>&1
eval_tap $? 55 'SetUserLeaderboardVisibilityV3' test.out

#- 56 DeleteUserRankingsAdminV3
./ng net.accelbyte.sdk.cli.Main leaderboard deleteUserRankingsAdminV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'XRyu2DWU' \
    --leaderboardCode '6XMC5UGs,M64CDWwd,OKLqZeen' \
    > test.out 2>&1
eval_tap $? 56 'DeleteUserRankingsAdminV3' test.out

#- 57 GetUserLeaderboardRankingsAdminV3
./ng net.accelbyte.sdk.cli.Main leaderboard getUserLeaderboardRankingsAdminV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'JeJlxYqY' \
    --limit '21' \
    --offset '40' \
    --previousVersion '14' \
    > test.out 2>&1
eval_tap $? 57 'GetUserLeaderboardRankingsAdminV3' test.out

#- 58 SetUserVisibilityV3
./ng net.accelbyte.sdk.cli.Main leaderboard setUserVisibilityV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'tWz4xukU' \
    --body '{"visibility": false}' \
    > test.out 2>&1
eval_tap $? 58 'SetUserVisibilityV3' test.out

#- 59 GetLeaderboardConfigurationsPublicV3
./ng net.accelbyte.sdk.cli.Main leaderboard getLeaderboardConfigurationsPublicV3 \
    --namespace "$AB_NAMESPACE" \
    --isDeleted  \
    --limit '50' \
    --offset '62' \
    > test.out 2>&1
eval_tap $? 59 'GetLeaderboardConfigurationsPublicV3' test.out

#- 60 GetLeaderboardConfigurationPublicV3
./ng net.accelbyte.sdk.cli.Main leaderboard getLeaderboardConfigurationPublicV3 \
    --leaderboardCode 'Uoei7iAl' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 60 'GetLeaderboardConfigurationPublicV3' test.out

#- 61 GetAllTimeLeaderboardRankingPublicV3
./ng net.accelbyte.sdk.cli.Main leaderboard getAllTimeLeaderboardRankingPublicV3 \
    --leaderboardCode 'v5Dy8I7M' \
    --namespace "$AB_NAMESPACE" \
    --limit '1' \
    --offset '81' \
    > test.out 2>&1
eval_tap $? 61 'GetAllTimeLeaderboardRankingPublicV3' test.out

#- 62 GetCurrentCycleLeaderboardRankingPublicV3
./ng net.accelbyte.sdk.cli.Main leaderboard getCurrentCycleLeaderboardRankingPublicV3 \
    --cycleId 'AmXy7ARu' \
    --leaderboardCode 'j7UP9DtO' \
    --namespace "$AB_NAMESPACE" \
    --limit '45' \
    --offset '85' \
    --previousVersion '13' \
    > test.out 2>&1
eval_tap $? 62 'GetCurrentCycleLeaderboardRankingPublicV3' test.out

#- 63 BulkGetUsersRankingPublicV3
./ng net.accelbyte.sdk.cli.Main leaderboard bulkGetUsersRankingPublicV3 \
    --leaderboardCode 'PFNav5Xg' \
    --namespace "$AB_NAMESPACE" \
    --previousVersion '68' \
    --body '{"userIds": ["P84dQRU8", "36SGhuTU", "aIDQGd5K"]}' \
    > test.out 2>&1
eval_tap $? 63 'BulkGetUsersRankingPublicV3' test.out

#- 64 GetUserRankingPublicV3
./ng net.accelbyte.sdk.cli.Main leaderboard getUserRankingPublicV3 \
    --leaderboardCode 'PQcwX9se' \
    --namespace "$AB_NAMESPACE" \
    --userId 'eIVAIJt8' \
    --previousVersion '17' \
    > test.out 2>&1
eval_tap $? 64 'GetUserRankingPublicV3' test.out


rm -f "tmp.dat"

exit $EXIT_CODE