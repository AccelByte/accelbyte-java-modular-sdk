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
    --limit '13' \
    --offset '64' \
    > test.out 2>&1
eval_tap $? 2 'GetLeaderboardConfigurationsAdminV1' test.out

#- 3 CreateLeaderboardConfigurationAdminV1
./ng net.accelbyte.sdk.cli.Main leaderboard createLeaderboardConfigurationAdminV1 \
    --namespace "$AB_NAMESPACE" \
    --body '{"daily": {"resetTime": "2HxT67Gb"}, "descending": false, "iconURL": "vJlD5JZ7", "leaderboardCode": "usuxBLC8", "monthly": {"resetDate": 79, "resetTime": "UtNsO8zU"}, "name": "bi9BvnxI", "seasonPeriod": 67, "startTime": "DXpVKVrh", "statCode": "AiDfvtPR", "weekly": {"resetDay": 68, "resetTime": "rUUZaAGY"}}' \
    > test.out 2>&1
eval_tap $? 3 'CreateLeaderboardConfigurationAdminV1' test.out

#- 4 AdminGetArchivedLeaderboardRankingDataV1Handler
./ng net.accelbyte.sdk.cli.Main leaderboard adminGetArchivedLeaderboardRankingDataV1Handler \
    --namespace "$AB_NAMESPACE" \
    --slug 'dYUsCTOK' \
    --leaderboardCodes 'WW3xr27w' \
    > test.out 2>&1
eval_tap $? 4 'AdminGetArchivedLeaderboardRankingDataV1Handler' test.out

#- 5 CreateArchivedLeaderboardRankingDataV1Handler
./ng net.accelbyte.sdk.cli.Main leaderboard createArchivedLeaderboardRankingDataV1Handler \
    --namespace "$AB_NAMESPACE" \
    --body '{"leaderboardCodes": ["JtPJ5yfV", "VxebJY33", "9GsLI9HZ"], "limit": 68, "slug": "k7SK6Zf8"}' \
    > test.out 2>&1
eval_tap $? 5 'CreateArchivedLeaderboardRankingDataV1Handler' test.out

#- 6 DeleteBulkLeaderboardConfigurationAdminV1
./ng net.accelbyte.sdk.cli.Main leaderboard deleteBulkLeaderboardConfigurationAdminV1 \
    --namespace "$AB_NAMESPACE" \
    --body '{"leaderboardCodes": ["BfQxAzOk", "gpLKxzpf", "KZ1pmR8N"]}' \
    > test.out 2>&1
eval_tap $? 6 'DeleteBulkLeaderboardConfigurationAdminV1' test.out

#- 7 GetLeaderboardConfigurationAdminV1
./ng net.accelbyte.sdk.cli.Main leaderboard getLeaderboardConfigurationAdminV1 \
    --leaderboardCode 'KcV7sxzQ' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 7 'GetLeaderboardConfigurationAdminV1' test.out

#- 8 UpdateLeaderboardConfigurationAdminV1
./ng net.accelbyte.sdk.cli.Main leaderboard updateLeaderboardConfigurationAdminV1 \
    --leaderboardCode 'sGc8AbHg' \
    --namespace "$AB_NAMESPACE" \
    --body '{"daily": {"resetTime": "1aac2fRP"}, "descending": false, "iconURL": "ztvCbVkT", "monthly": {"resetDate": 76, "resetTime": "gkHBf2XW"}, "name": "WhpNpcXN", "seasonPeriod": 68, "startTime": "e56KjjzL", "statCode": "OQcvvjiC", "weekly": {"resetDay": 15, "resetTime": "qhgkNa4O"}}' \
    > test.out 2>&1
eval_tap $? 8 'UpdateLeaderboardConfigurationAdminV1' test.out

#- 9 DeleteLeaderboardConfigurationAdminV1
./ng net.accelbyte.sdk.cli.Main leaderboard deleteLeaderboardConfigurationAdminV1 \
    --leaderboardCode 'uwDH8pc0' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 9 'DeleteLeaderboardConfigurationAdminV1' test.out

#- 10 GetAllTimeLeaderboardRankingAdminV1
./ng net.accelbyte.sdk.cli.Main leaderboard getAllTimeLeaderboardRankingAdminV1 \
    --leaderboardCode 'IYWnXcte' \
    --namespace "$AB_NAMESPACE" \
    --limit '56' \
    --offset '83' \
    > test.out 2>&1
eval_tap $? 10 'GetAllTimeLeaderboardRankingAdminV1' test.out

#- 11 HardDeleteLeaderboardAdminV1
./ng net.accelbyte.sdk.cli.Main leaderboard hardDeleteLeaderboardAdminV1 \
    --leaderboardCode 'Pzp39lrh' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 11 'HardDeleteLeaderboardAdminV1' test.out

#- 12 GetCurrentMonthLeaderboardRankingAdminV1
./ng net.accelbyte.sdk.cli.Main leaderboard getCurrentMonthLeaderboardRankingAdminV1 \
    --leaderboardCode '8Q7KR85g' \
    --namespace "$AB_NAMESPACE" \
    --limit '99' \
    --offset '82' \
    --previousVersion '74' \
    > test.out 2>&1
eval_tap $? 12 'GetCurrentMonthLeaderboardRankingAdminV1' test.out

#- 13 DeleteUserRankingByLeaderboardCodeAdminV1
./ng net.accelbyte.sdk.cli.Main leaderboard deleteUserRankingByLeaderboardCodeAdminV1 \
    --leaderboardCode '6dVkOtcO' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 13 'DeleteUserRankingByLeaderboardCodeAdminV1' test.out

#- 14 GetCurrentSeasonLeaderboardRankingAdminV1
./ng net.accelbyte.sdk.cli.Main leaderboard getCurrentSeasonLeaderboardRankingAdminV1 \
    --leaderboardCode 'n4GXynnF' \
    --namespace "$AB_NAMESPACE" \
    --limit '35' \
    --offset '14' \
    --previousVersion '12' \
    > test.out 2>&1
eval_tap $? 14 'GetCurrentSeasonLeaderboardRankingAdminV1' test.out

#- 15 GetTodayLeaderboardRankingAdminV1
./ng net.accelbyte.sdk.cli.Main leaderboard getTodayLeaderboardRankingAdminV1 \
    --leaderboardCode 'xuu4UY6w' \
    --namespace "$AB_NAMESPACE" \
    --limit '72' \
    --offset '19' \
    --previousVersion '42' \
    > test.out 2>&1
eval_tap $? 15 'GetTodayLeaderboardRankingAdminV1' test.out

#- 16 GetUserRankingAdminV1
./ng net.accelbyte.sdk.cli.Main leaderboard getUserRankingAdminV1 \
    --leaderboardCode '3IpW5Jz9' \
    --namespace "$AB_NAMESPACE" \
    --userId '1YdiMYX0' \
    --previousVersion '47' \
    > test.out 2>&1
eval_tap $? 16 'GetUserRankingAdminV1' test.out

#- 17 UpdateUserPointAdminV1
./ng net.accelbyte.sdk.cli.Main leaderboard updateUserPointAdminV1 \
    --leaderboardCode '2pWwV3JJ' \
    --namespace "$AB_NAMESPACE" \
    --userId 'MrLRoWKM' \
    --body '{"inc": 0.6057230060176355, "latestValue": 0.8292718291797032}' \
    > test.out 2>&1
eval_tap $? 17 'UpdateUserPointAdminV1' test.out

#- 18 DeleteUserRankingAdminV1
./ng net.accelbyte.sdk.cli.Main leaderboard deleteUserRankingAdminV1 \
    --leaderboardCode 'dsjG0fLE' \
    --namespace "$AB_NAMESPACE" \
    --userId 'ggfnFipm' \
    > test.out 2>&1
eval_tap $? 18 'DeleteUserRankingAdminV1' test.out

#- 19 GetCurrentWeekLeaderboardRankingAdminV1
./ng net.accelbyte.sdk.cli.Main leaderboard getCurrentWeekLeaderboardRankingAdminV1 \
    --leaderboardCode 'i0d3WtEx' \
    --namespace "$AB_NAMESPACE" \
    --limit '69' \
    --offset '11' \
    --previousVersion '88' \
    > test.out 2>&1
eval_tap $? 19 'GetCurrentWeekLeaderboardRankingAdminV1' test.out

#- 20 DeleteUserRankingsAdminV1
./ng net.accelbyte.sdk.cli.Main leaderboard deleteUserRankingsAdminV1 \
    --namespace "$AB_NAMESPACE" \
    --userId '3d3CtnCP' \
    --leaderboardCode 'EIn1uF8k,VGkEAJ6Z,fbOhaYjx' \
    > test.out 2>&1
eval_tap $? 20 'DeleteUserRankingsAdminV1' test.out

#- 21 AdminAnonymizeUserLeaderboardAdminV1
./ng net.accelbyte.sdk.cli.Main leaderboard adminAnonymizeUserLeaderboardAdminV1 \
    --namespace "$AB_NAMESPACE" \
    --userId 'p5KTRwXW' \
    > test.out 2>&1
eval_tap $? 21 'AdminAnonymizeUserLeaderboardAdminV1' test.out

#- 22 GetUserLeaderboardRankingsAdminV1
./ng net.accelbyte.sdk.cli.Main leaderboard getUserLeaderboardRankingsAdminV1 \
    --namespace "$AB_NAMESPACE" \
    --userId '8WWoGmYs' \
    --limit '50' \
    --offset '10' \
    --previousVersion '17' \
    > test.out 2>&1
eval_tap $? 22 'GetUserLeaderboardRankingsAdminV1' test.out

#- 23 GetLeaderboardConfigurationsPublicV1
./ng net.accelbyte.sdk.cli.Main leaderboard getLeaderboardConfigurationsPublicV1 \
    --namespace "$AB_NAMESPACE" \
    --isArchived  \
    --isDeleted  \
    --limit '98' \
    --offset '15' \
    > test.out 2>&1
eval_tap $? 23 'GetLeaderboardConfigurationsPublicV1' test.out

#- 24 CreateLeaderboardConfigurationPublicV1
./ng net.accelbyte.sdk.cli.Main leaderboard createLeaderboardConfigurationPublicV1 \
    --namespace "$AB_NAMESPACE" \
    --body '{"daily": {"resetTime": "pSWIpnEl"}, "descending": true, "iconURL": "pYoGND1V", "leaderboardCode": "rfTPme4a", "monthly": {"resetDate": 34, "resetTime": "DpFqgEZ6"}, "name": "yipjm4BY", "seasonPeriod": 99, "startTime": "W43EkvqW", "statCode": "QNE9DLlb", "weekly": {"resetDay": 68, "resetTime": "UVTwO9Sc"}}' \
    > test.out 2>&1
eval_tap $? 24 'CreateLeaderboardConfigurationPublicV1' test.out

#- 25 GetAllTimeLeaderboardRankingPublicV1
./ng net.accelbyte.sdk.cli.Main leaderboard getAllTimeLeaderboardRankingPublicV1 \
    --leaderboardCode 'cVF4iDI2' \
    --namespace "$AB_NAMESPACE" \
    --limit '81' \
    --offset '26' \
    > test.out 2>&1
eval_tap $? 25 'GetAllTimeLeaderboardRankingPublicV1' test.out

#- 26 GetArchivedLeaderboardRankingDataV1Handler
./ng net.accelbyte.sdk.cli.Main leaderboard getArchivedLeaderboardRankingDataV1Handler \
    --leaderboardCode 'kvuw5KuT' \
    --namespace "$AB_NAMESPACE" \
    --slug 'bAtDVGFX' \
    --leaderboardCodes 'dZyIKWzq' \
    > test.out 2>&1
eval_tap $? 26 'GetArchivedLeaderboardRankingDataV1Handler' test.out

#- 27 GetCurrentMonthLeaderboardRankingPublicV1
./ng net.accelbyte.sdk.cli.Main leaderboard getCurrentMonthLeaderboardRankingPublicV1 \
    --leaderboardCode 'WkKc8FsY' \
    --namespace "$AB_NAMESPACE" \
    --limit '4' \
    --offset '93' \
    --previousVersion '72' \
    > test.out 2>&1
eval_tap $? 27 'GetCurrentMonthLeaderboardRankingPublicV1' test.out

#- 28 GetCurrentSeasonLeaderboardRankingPublicV1
./ng net.accelbyte.sdk.cli.Main leaderboard getCurrentSeasonLeaderboardRankingPublicV1 \
    --leaderboardCode 'pfon18P4' \
    --namespace "$AB_NAMESPACE" \
    --limit '55' \
    --offset '31' \
    --previousVersion '47' \
    > test.out 2>&1
eval_tap $? 28 'GetCurrentSeasonLeaderboardRankingPublicV1' test.out

#- 29 GetTodayLeaderboardRankingPublicV1
./ng net.accelbyte.sdk.cli.Main leaderboard getTodayLeaderboardRankingPublicV1 \
    --leaderboardCode 'vsUzMiSa' \
    --namespace "$AB_NAMESPACE" \
    --limit '16' \
    --offset '9' \
    --previousVersion '68' \
    > test.out 2>&1
eval_tap $? 29 'GetTodayLeaderboardRankingPublicV1' test.out

#- 30 GetUserRankingPublicV1
./ng net.accelbyte.sdk.cli.Main leaderboard getUserRankingPublicV1 \
    --leaderboardCode 'dI5YN9VJ' \
    --namespace "$AB_NAMESPACE" \
    --userId 'sSwXcflF' \
    --previousVersion '62' \
    > test.out 2>&1
eval_tap $? 30 'GetUserRankingPublicV1' test.out

#- 31 DeleteUserRankingPublicV1
./ng net.accelbyte.sdk.cli.Main leaderboard deleteUserRankingPublicV1 \
    --leaderboardCode 'an4lzvbb' \
    --namespace "$AB_NAMESPACE" \
    --userId 'xfnqndYJ' \
    > test.out 2>&1
eval_tap $? 31 'DeleteUserRankingPublicV1' test.out

#- 32 GetCurrentWeekLeaderboardRankingPublicV1
./ng net.accelbyte.sdk.cli.Main leaderboard getCurrentWeekLeaderboardRankingPublicV1 \
    --leaderboardCode 'ZnzXo97Q' \
    --namespace "$AB_NAMESPACE" \
    --limit '77' \
    --offset '17' \
    --previousVersion '20' \
    > test.out 2>&1
eval_tap $? 32 'GetCurrentWeekLeaderboardRankingPublicV1' test.out

#- 33 GetHiddenUsersV2
./ng net.accelbyte.sdk.cli.Main leaderboard getHiddenUsersV2 \
    --leaderboardCode 'Je6E86os' \
    --namespace "$AB_NAMESPACE" \
    --limit '17' \
    --offset '47' \
    > test.out 2>&1
eval_tap $? 33 'GetHiddenUsersV2' test.out

#- 34 GetUserVisibilityStatusV2
./ng net.accelbyte.sdk.cli.Main leaderboard getUserVisibilityStatusV2 \
    --leaderboardCode 'w6Y7HPnT' \
    --namespace "$AB_NAMESPACE" \
    --userId 'clwz5Cfb' \
    > test.out 2>&1
eval_tap $? 34 'GetUserVisibilityStatusV2' test.out

#- 35 SetUserLeaderboardVisibilityStatusV2
./ng net.accelbyte.sdk.cli.Main leaderboard setUserLeaderboardVisibilityStatusV2 \
    --leaderboardCode 'dK6BiG6f' \
    --namespace "$AB_NAMESPACE" \
    --userId 'D13vLwSf' \
    --body '{"visibility": true}' \
    > test.out 2>&1
eval_tap $? 35 'SetUserLeaderboardVisibilityStatusV2' test.out

#- 36 SetUserVisibilityStatusV2
./ng net.accelbyte.sdk.cli.Main leaderboard setUserVisibilityStatusV2 \
    --namespace "$AB_NAMESPACE" \
    --userId 'DMC3EMjf' \
    --body '{"visibility": true}' \
    > test.out 2>&1
eval_tap $? 36 'SetUserVisibilityStatusV2' test.out

#- 37 GetLeaderboardConfigurationsPublicV2
./ng net.accelbyte.sdk.cli.Main leaderboard getLeaderboardConfigurationsPublicV2 \
    --namespace "$AB_NAMESPACE" \
    --limit '2' \
    --offset '44' \
    > test.out 2>&1
eval_tap $? 37 'GetLeaderboardConfigurationsPublicV2' test.out

#- 38 GetAllTimeLeaderboardRankingPublicV2
./ng net.accelbyte.sdk.cli.Main leaderboard getAllTimeLeaderboardRankingPublicV2 \
    --leaderboardCode 'ABexAdFA' \
    --namespace "$AB_NAMESPACE" \
    --limit '57' \
    --offset '12' \
    > test.out 2>&1
eval_tap $? 38 'GetAllTimeLeaderboardRankingPublicV2' test.out

#- 39 GetLeaderboardConfigurationsAdminV3
./ng net.accelbyte.sdk.cli.Main leaderboard getLeaderboardConfigurationsAdminV3 \
    --namespace "$AB_NAMESPACE" \
    --isDeleted  \
    --limit '44' \
    --offset '19' \
    > test.out 2>&1
eval_tap $? 39 'GetLeaderboardConfigurationsAdminV3' test.out

#- 40 CreateLeaderboardConfigurationAdminV3
./ng net.accelbyte.sdk.cli.Main leaderboard createLeaderboardConfigurationAdminV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"allTime": false, "cycleIds": ["vM2QUe84", "GiWgSrCv", "9s5ui73F"], "descending": false, "description": "FoSK5NQ6", "iconURL": "SljQLnHf", "leaderboardCode": "rB7HNVee", "name": "FwqMiEIn", "statCode": "QkExIYfg"}' \
    > test.out 2>&1
eval_tap $? 40 'CreateLeaderboardConfigurationAdminV3' test.out

#- 41 DeleteBulkLeaderboardConfigurationAdminV3
./ng net.accelbyte.sdk.cli.Main leaderboard deleteBulkLeaderboardConfigurationAdminV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"leaderboardCodes": ["cKILW7p7", "TyVYqG9y", "SefmpQQv"]}' \
    > test.out 2>&1
eval_tap $? 41 'DeleteBulkLeaderboardConfigurationAdminV3' test.out

#- 42 GetLeaderboardConfigurationAdminV3
./ng net.accelbyte.sdk.cli.Main leaderboard getLeaderboardConfigurationAdminV3 \
    --leaderboardCode 'XCdLUzgw' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 42 'GetLeaderboardConfigurationAdminV3' test.out

#- 43 UpdateLeaderboardConfigurationAdminV3
./ng net.accelbyte.sdk.cli.Main leaderboard updateLeaderboardConfigurationAdminV3 \
    --leaderboardCode 'f65BUs7E' \
    --namespace "$AB_NAMESPACE" \
    --body '{"allTime": false, "cycleIds": ["BzvVNHDf", "bGY6QylH", "z7cSmvtm"], "descending": true, "description": "9bBik7cf", "iconURL": "I23gW0Ph", "name": "Frbo74XD"}' \
    > test.out 2>&1
eval_tap $? 43 'UpdateLeaderboardConfigurationAdminV3' test.out

#- 44 DeleteLeaderboardConfigurationAdminV3
./ng net.accelbyte.sdk.cli.Main leaderboard deleteLeaderboardConfigurationAdminV3 \
    --leaderboardCode '1Btt7d3b' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 44 'DeleteLeaderboardConfigurationAdminV3' test.out

#- 45 GetAllTimeLeaderboardRankingAdminV3
./ng net.accelbyte.sdk.cli.Main leaderboard getAllTimeLeaderboardRankingAdminV3 \
    --leaderboardCode 'u8a5FhTY' \
    --namespace "$AB_NAMESPACE" \
    --limit '37' \
    --offset '23' \
    > test.out 2>&1
eval_tap $? 45 'GetAllTimeLeaderboardRankingAdminV3' test.out

#- 46 GetCurrentCycleLeaderboardRankingAdminV3
./ng net.accelbyte.sdk.cli.Main leaderboard getCurrentCycleLeaderboardRankingAdminV3 \
    --cycleId 'm4gF0CKJ' \
    --leaderboardCode 'Th74kclW' \
    --namespace "$AB_NAMESPACE" \
    --limit '77' \
    --offset '82' \
    --previousVersion '53' \
    > test.out 2>&1
eval_tap $? 46 'GetCurrentCycleLeaderboardRankingAdminV3' test.out

#- 47 DeleteAllUserRankingByCycleIdAdminV3
./ng net.accelbyte.sdk.cli.Main leaderboard deleteAllUserRankingByCycleIdAdminV3 \
    --cycleId 'fZV2CMad' \
    --leaderboardCode '7MbzoQ0b' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 47 'DeleteAllUserRankingByCycleIdAdminV3' test.out

#- 48 DeleteUserRankingByCycleIdAdminV3
./ng net.accelbyte.sdk.cli.Main leaderboard deleteUserRankingByCycleIdAdminV3 \
    --cycleId 'iPa0689S' \
    --leaderboardCode 'HZbYXr0s' \
    --namespace "$AB_NAMESPACE" \
    --userId 'jRfKZpuH' \
    > test.out 2>&1
eval_tap $? 48 'DeleteUserRankingByCycleIdAdminV3' test.out

#- 49 HardDeleteLeaderboardAdminV3
./ng net.accelbyte.sdk.cli.Main leaderboard hardDeleteLeaderboardAdminV3 \
    --leaderboardCode '5nhaPQ2b' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 49 'HardDeleteLeaderboardAdminV3' test.out

#- 50 DeleteUserRankingByLeaderboardCodeAdminV3
./ng net.accelbyte.sdk.cli.Main leaderboard deleteUserRankingByLeaderboardCodeAdminV3 \
    --leaderboardCode 'bSPEuFil' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 50 'DeleteUserRankingByLeaderboardCodeAdminV3' test.out

#- 51 GetHiddenUsersV3
./ng net.accelbyte.sdk.cli.Main leaderboard getHiddenUsersV3 \
    --leaderboardCode '7ZY2ZQ2K' \
    --namespace "$AB_NAMESPACE" \
    --limit '20' \
    --offset '37' \
    > test.out 2>&1
eval_tap $? 51 'GetHiddenUsersV3' test.out

#- 52 GetUserRankingAdminV3
./ng net.accelbyte.sdk.cli.Main leaderboard getUserRankingAdminV3 \
    --leaderboardCode 'wKdOOU36' \
    --namespace "$AB_NAMESPACE" \
    --userId '24XB1ydl' \
    --previousVersion '29' \
    > test.out 2>&1
eval_tap $? 52 'GetUserRankingAdminV3' test.out

#- 53 DeleteUserRankingAdminV3
./ng net.accelbyte.sdk.cli.Main leaderboard deleteUserRankingAdminV3 \
    --leaderboardCode '3BJ7knWI' \
    --namespace "$AB_NAMESPACE" \
    --userId 'Ip9jI8SL' \
    > test.out 2>&1
eval_tap $? 53 'DeleteUserRankingAdminV3' test.out

#- 54 GetUserVisibilityStatusV3
./ng net.accelbyte.sdk.cli.Main leaderboard getUserVisibilityStatusV3 \
    --leaderboardCode 'TmCgCSBg' \
    --namespace "$AB_NAMESPACE" \
    --userId 'ukaSubFM' \
    > test.out 2>&1
eval_tap $? 54 'GetUserVisibilityStatusV3' test.out

#- 55 SetUserLeaderboardVisibilityV3
./ng net.accelbyte.sdk.cli.Main leaderboard setUserLeaderboardVisibilityV3 \
    --leaderboardCode '09jdcLMB' \
    --namespace "$AB_NAMESPACE" \
    --userId 'j3bQ8S1O' \
    --body '{"visibility": false}' \
    > test.out 2>&1
eval_tap $? 55 'SetUserLeaderboardVisibilityV3' test.out

#- 56 DeleteUserRankingsAdminV3
./ng net.accelbyte.sdk.cli.Main leaderboard deleteUserRankingsAdminV3 \
    --namespace "$AB_NAMESPACE" \
    --userId '1zgThSuV' \
    --leaderboardCode 'Y1nM5T5E,TDNKPuzp,h90xEnxq' \
    > test.out 2>&1
eval_tap $? 56 'DeleteUserRankingsAdminV3' test.out

#- 57 GetUserLeaderboardRankingsAdminV3
./ng net.accelbyte.sdk.cli.Main leaderboard getUserLeaderboardRankingsAdminV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'R1dT3FJl' \
    --limit '40' \
    --offset '97' \
    --previousVersion '78' \
    > test.out 2>&1
eval_tap $? 57 'GetUserLeaderboardRankingsAdminV3' test.out

#- 58 SetUserVisibilityV3
./ng net.accelbyte.sdk.cli.Main leaderboard setUserVisibilityV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'VmBvAPnE' \
    --body '{"visibility": true}' \
    > test.out 2>&1
eval_tap $? 58 'SetUserVisibilityV3' test.out

#- 59 GetLeaderboardConfigurationsPublicV3
./ng net.accelbyte.sdk.cli.Main leaderboard getLeaderboardConfigurationsPublicV3 \
    --namespace "$AB_NAMESPACE" \
    --isDeleted  \
    --limit '36' \
    --offset '78' \
    > test.out 2>&1
eval_tap $? 59 'GetLeaderboardConfigurationsPublicV3' test.out

#- 60 GetLeaderboardConfigurationPublicV3
./ng net.accelbyte.sdk.cli.Main leaderboard getLeaderboardConfigurationPublicV3 \
    --leaderboardCode 'X6jy63bY' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 60 'GetLeaderboardConfigurationPublicV3' test.out

#- 61 GetAllTimeLeaderboardRankingPublicV3
./ng net.accelbyte.sdk.cli.Main leaderboard getAllTimeLeaderboardRankingPublicV3 \
    --leaderboardCode 'aPVxuBQq' \
    --namespace "$AB_NAMESPACE" \
    --limit '15' \
    --offset '49' \
    > test.out 2>&1
eval_tap $? 61 'GetAllTimeLeaderboardRankingPublicV3' test.out

#- 62 GetCurrentCycleLeaderboardRankingPublicV3
./ng net.accelbyte.sdk.cli.Main leaderboard getCurrentCycleLeaderboardRankingPublicV3 \
    --cycleId 'SyfeQ2v3' \
    --leaderboardCode 'lTefH84I' \
    --namespace "$AB_NAMESPACE" \
    --limit '27' \
    --offset '91' \
    --previousVersion '58' \
    > test.out 2>&1
eval_tap $? 62 'GetCurrentCycleLeaderboardRankingPublicV3' test.out

#- 63 BulkGetUsersRankingPublicV3
./ng net.accelbyte.sdk.cli.Main leaderboard bulkGetUsersRankingPublicV3 \
    --leaderboardCode 'xOP0vxO0' \
    --namespace "$AB_NAMESPACE" \
    --previousVersion '16' \
    --body '{"userIds": ["ZCO1yUVs", "nuMpociq", "shX2u6xJ"]}' \
    > test.out 2>&1
eval_tap $? 63 'BulkGetUsersRankingPublicV3' test.out

#- 64 GetUserRankingPublicV3
./ng net.accelbyte.sdk.cli.Main leaderboard getUserRankingPublicV3 \
    --leaderboardCode 'Rip7AJ4y' \
    --namespace "$AB_NAMESPACE" \
    --userId '52PZLgoH' \
    --previousVersion '77' \
    > test.out 2>&1
eval_tap $? 64 'GetUserRankingPublicV3' test.out


rm -f "tmp.dat"

exit $EXIT_CODE