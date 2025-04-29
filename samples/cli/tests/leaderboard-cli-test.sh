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
    --limit '98' \
    --offset '12' \
    > test.out 2>&1
eval_tap $? 2 'GetLeaderboardConfigurationsAdminV1' test.out

#- 3 CreateLeaderboardConfigurationAdminV1
./ng net.accelbyte.sdk.cli.Main leaderboard createLeaderboardConfigurationAdminV1 \
    --namespace "$AB_NAMESPACE" \
    --body '{"daily": {"resetTime": "oXKllUPc"}, "descending": true, "iconURL": "xFiGjDVH", "leaderboardCode": "1ns0LYRg", "monthly": {"resetDate": 92, "resetTime": "SuoYe2aC"}, "name": "Sm3DQSOR", "seasonPeriod": 19, "startTime": "lieEhGHB", "statCode": "tQ0OoriX", "weekly": {"resetDay": 23, "resetTime": "cBNo3fts"}}' \
    > test.out 2>&1
eval_tap $? 3 'CreateLeaderboardConfigurationAdminV1' test.out

#- 4 AdminGetArchivedLeaderboardRankingDataV1Handler
./ng net.accelbyte.sdk.cli.Main leaderboard adminGetArchivedLeaderboardRankingDataV1Handler \
    --namespace "$AB_NAMESPACE" \
    --slug 'CGO5LwsC' \
    --leaderboardCodes 'KcJqvRaf' \
    > test.out 2>&1
eval_tap $? 4 'AdminGetArchivedLeaderboardRankingDataV1Handler' test.out

#- 5 CreateArchivedLeaderboardRankingDataV1Handler
./ng net.accelbyte.sdk.cli.Main leaderboard createArchivedLeaderboardRankingDataV1Handler \
    --namespace "$AB_NAMESPACE" \
    --body '{"leaderboardCodes": ["6X5bBQGQ", "wr5CYrNT", "0sdANSzd"], "limit": 18, "slug": "HQgHaHn4"}' \
    > test.out 2>&1
eval_tap $? 5 'CreateArchivedLeaderboardRankingDataV1Handler' test.out

#- 6 DeleteBulkLeaderboardConfigurationAdminV1
./ng net.accelbyte.sdk.cli.Main leaderboard deleteBulkLeaderboardConfigurationAdminV1 \
    --namespace "$AB_NAMESPACE" \
    --body '{"leaderboardCodes": ["Uxulp3d3", "8INKLyue", "fUAaV2CD"]}' \
    > test.out 2>&1
eval_tap $? 6 'DeleteBulkLeaderboardConfigurationAdminV1' test.out

#- 7 GetLeaderboardConfigurationAdminV1
./ng net.accelbyte.sdk.cli.Main leaderboard getLeaderboardConfigurationAdminV1 \
    --leaderboardCode 'ZUVN1upA' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 7 'GetLeaderboardConfigurationAdminV1' test.out

#- 8 UpdateLeaderboardConfigurationAdminV1
./ng net.accelbyte.sdk.cli.Main leaderboard updateLeaderboardConfigurationAdminV1 \
    --leaderboardCode '2mxjcqMQ' \
    --namespace "$AB_NAMESPACE" \
    --body '{"daily": {"resetTime": "Y326LTmH"}, "descending": true, "iconURL": "oDFt964Y", "monthly": {"resetDate": 94, "resetTime": "DevZLDly"}, "name": "bUaxCsLk", "seasonPeriod": 18, "startTime": "hpcNwHAY", "statCode": "L8tGviUf", "weekly": {"resetDay": 10, "resetTime": "OBS8KvHa"}}' \
    > test.out 2>&1
eval_tap $? 8 'UpdateLeaderboardConfigurationAdminV1' test.out

#- 9 DeleteLeaderboardConfigurationAdminV1
./ng net.accelbyte.sdk.cli.Main leaderboard deleteLeaderboardConfigurationAdminV1 \
    --leaderboardCode 'bb3otsCU' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 9 'DeleteLeaderboardConfigurationAdminV1' test.out

#- 10 GetAllTimeLeaderboardRankingAdminV1
./ng net.accelbyte.sdk.cli.Main leaderboard getAllTimeLeaderboardRankingAdminV1 \
    --leaderboardCode 'J2yVniby' \
    --namespace "$AB_NAMESPACE" \
    --limit '19' \
    --offset '27' \
    > test.out 2>&1
eval_tap $? 10 'GetAllTimeLeaderboardRankingAdminV1' test.out

#- 11 HardDeleteLeaderboardAdminV1
./ng net.accelbyte.sdk.cli.Main leaderboard hardDeleteLeaderboardAdminV1 \
    --leaderboardCode '2L8nRlGM' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 11 'HardDeleteLeaderboardAdminV1' test.out

#- 12 GetCurrentMonthLeaderboardRankingAdminV1
./ng net.accelbyte.sdk.cli.Main leaderboard getCurrentMonthLeaderboardRankingAdminV1 \
    --leaderboardCode 'Tx8H48LN' \
    --namespace "$AB_NAMESPACE" \
    --limit '39' \
    --offset '54' \
    --previousVersion '52' \
    > test.out 2>&1
eval_tap $? 12 'GetCurrentMonthLeaderboardRankingAdminV1' test.out

#- 13 DeleteUserRankingByLeaderboardCodeAdminV1
./ng net.accelbyte.sdk.cli.Main leaderboard deleteUserRankingByLeaderboardCodeAdminV1 \
    --leaderboardCode 'wXd6udwi' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 13 'DeleteUserRankingByLeaderboardCodeAdminV1' test.out

#- 14 GetCurrentSeasonLeaderboardRankingAdminV1
./ng net.accelbyte.sdk.cli.Main leaderboard getCurrentSeasonLeaderboardRankingAdminV1 \
    --leaderboardCode '4FJ1YQym' \
    --namespace "$AB_NAMESPACE" \
    --limit '79' \
    --offset '64' \
    --previousVersion '6' \
    > test.out 2>&1
eval_tap $? 14 'GetCurrentSeasonLeaderboardRankingAdminV1' test.out

#- 15 GetTodayLeaderboardRankingAdminV1
./ng net.accelbyte.sdk.cli.Main leaderboard getTodayLeaderboardRankingAdminV1 \
    --leaderboardCode 'b2dPqUFv' \
    --namespace "$AB_NAMESPACE" \
    --limit '24' \
    --offset '36' \
    --previousVersion '30' \
    > test.out 2>&1
eval_tap $? 15 'GetTodayLeaderboardRankingAdminV1' test.out

#- 16 GetUserRankingAdminV1
./ng net.accelbyte.sdk.cli.Main leaderboard getUserRankingAdminV1 \
    --leaderboardCode 'EOkn6UXV' \
    --namespace "$AB_NAMESPACE" \
    --userId 'ifLJMtx5' \
    --previousVersion '64' \
    > test.out 2>&1
eval_tap $? 16 'GetUserRankingAdminV1' test.out

#- 17 UpdateUserPointAdminV1
./ng net.accelbyte.sdk.cli.Main leaderboard updateUserPointAdminV1 \
    --leaderboardCode 'vHjfrMgE' \
    --namespace "$AB_NAMESPACE" \
    --userId 'fA4hjxhy' \
    --body '{"inc": 0.8897049632376126, "latestValue": 0.7209135245063956}' \
    > test.out 2>&1
eval_tap $? 17 'UpdateUserPointAdminV1' test.out

#- 18 DeleteUserRankingAdminV1
./ng net.accelbyte.sdk.cli.Main leaderboard deleteUserRankingAdminV1 \
    --leaderboardCode 'xhL9ZE3V' \
    --namespace "$AB_NAMESPACE" \
    --userId 'HXmmpkuB' \
    > test.out 2>&1
eval_tap $? 18 'DeleteUserRankingAdminV1' test.out

#- 19 GetCurrentWeekLeaderboardRankingAdminV1
./ng net.accelbyte.sdk.cli.Main leaderboard getCurrentWeekLeaderboardRankingAdminV1 \
    --leaderboardCode '1YXiHX2r' \
    --namespace "$AB_NAMESPACE" \
    --limit '70' \
    --offset '87' \
    --previousVersion '93' \
    > test.out 2>&1
eval_tap $? 19 'GetCurrentWeekLeaderboardRankingAdminV1' test.out

#- 20 DeleteUserRankingsAdminV1
./ng net.accelbyte.sdk.cli.Main leaderboard deleteUserRankingsAdminV1 \
    --namespace "$AB_NAMESPACE" \
    --userId 'y9JUroxa' \
    --leaderboardCode 'WMcQI65M,GEp62mK5,3BrTIZrt' \
    > test.out 2>&1
eval_tap $? 20 'DeleteUserRankingsAdminV1' test.out

#- 21 AdminAnonymizeUserLeaderboardAdminV1
./ng net.accelbyte.sdk.cli.Main leaderboard adminAnonymizeUserLeaderboardAdminV1 \
    --namespace "$AB_NAMESPACE" \
    --userId 'jzdeHp7r' \
    > test.out 2>&1
eval_tap $? 21 'AdminAnonymizeUserLeaderboardAdminV1' test.out

#- 22 GetUserLeaderboardRankingsAdminV1
./ng net.accelbyte.sdk.cli.Main leaderboard getUserLeaderboardRankingsAdminV1 \
    --namespace "$AB_NAMESPACE" \
    --userId 'K8u9Gm11' \
    --limit '36' \
    --offset '81' \
    --previousVersion '90' \
    > test.out 2>&1
eval_tap $? 22 'GetUserLeaderboardRankingsAdminV1' test.out

#- 23 GetLeaderboardConfigurationsPublicV1
./ng net.accelbyte.sdk.cli.Main leaderboard getLeaderboardConfigurationsPublicV1 \
    --namespace "$AB_NAMESPACE" \
    --isArchived  \
    --isDeleted  \
    --limit '81' \
    --offset '96' \
    > test.out 2>&1
eval_tap $? 23 'GetLeaderboardConfigurationsPublicV1' test.out

#- 24 CreateLeaderboardConfigurationPublicV1
./ng net.accelbyte.sdk.cli.Main leaderboard createLeaderboardConfigurationPublicV1 \
    --namespace "$AB_NAMESPACE" \
    --body '{"daily": {"resetTime": "Sem08Qjy"}, "descending": true, "iconURL": "uj38thys", "leaderboardCode": "ZhaPEo44", "monthly": {"resetDate": 67, "resetTime": "EMDKmkBI"}, "name": "TkrCuV5b", "seasonPeriod": 95, "startTime": "WQfd6MDc", "statCode": "lUoVIqY3", "weekly": {"resetDay": 44, "resetTime": "q5EVoxsk"}}' \
    > test.out 2>&1
eval_tap $? 24 'CreateLeaderboardConfigurationPublicV1' test.out

#- 25 GetAllTimeLeaderboardRankingPublicV1
./ng net.accelbyte.sdk.cli.Main leaderboard getAllTimeLeaderboardRankingPublicV1 \
    --leaderboardCode 'OKO4j3ZG' \
    --namespace "$AB_NAMESPACE" \
    --limit '75' \
    --offset '41' \
    > test.out 2>&1
eval_tap $? 25 'GetAllTimeLeaderboardRankingPublicV1' test.out

#- 26 GetArchivedLeaderboardRankingDataV1Handler
./ng net.accelbyte.sdk.cli.Main leaderboard getArchivedLeaderboardRankingDataV1Handler \
    --leaderboardCode 'sDdZagVb' \
    --namespace "$AB_NAMESPACE" \
    --slug 'FFR8Y7mZ' \
    --leaderboardCodes 'w3LiOncU' \
    > test.out 2>&1
eval_tap $? 26 'GetArchivedLeaderboardRankingDataV1Handler' test.out

#- 27 GetCurrentMonthLeaderboardRankingPublicV1
./ng net.accelbyte.sdk.cli.Main leaderboard getCurrentMonthLeaderboardRankingPublicV1 \
    --leaderboardCode '18CmzgBy' \
    --namespace "$AB_NAMESPACE" \
    --limit '44' \
    --offset '22' \
    --previousVersion '100' \
    > test.out 2>&1
eval_tap $? 27 'GetCurrentMonthLeaderboardRankingPublicV1' test.out

#- 28 GetCurrentSeasonLeaderboardRankingPublicV1
./ng net.accelbyte.sdk.cli.Main leaderboard getCurrentSeasonLeaderboardRankingPublicV1 \
    --leaderboardCode 'jK249NYz' \
    --namespace "$AB_NAMESPACE" \
    --limit '52' \
    --offset '53' \
    --previousVersion '37' \
    > test.out 2>&1
eval_tap $? 28 'GetCurrentSeasonLeaderboardRankingPublicV1' test.out

#- 29 GetTodayLeaderboardRankingPublicV1
./ng net.accelbyte.sdk.cli.Main leaderboard getTodayLeaderboardRankingPublicV1 \
    --leaderboardCode 'MFvoRAPZ' \
    --namespace "$AB_NAMESPACE" \
    --limit '96' \
    --offset '11' \
    --previousVersion '99' \
    > test.out 2>&1
eval_tap $? 29 'GetTodayLeaderboardRankingPublicV1' test.out

#- 30 GetUserRankingPublicV1
./ng net.accelbyte.sdk.cli.Main leaderboard getUserRankingPublicV1 \
    --leaderboardCode 'Zx9ZBcHv' \
    --namespace "$AB_NAMESPACE" \
    --userId 'pFyY3pqy' \
    --previousVersion '37' \
    > test.out 2>&1
eval_tap $? 30 'GetUserRankingPublicV1' test.out

#- 31 DeleteUserRankingPublicV1
./ng net.accelbyte.sdk.cli.Main leaderboard deleteUserRankingPublicV1 \
    --leaderboardCode 'pMgVNzeq' \
    --namespace "$AB_NAMESPACE" \
    --userId 'XjvPViEn' \
    > test.out 2>&1
eval_tap $? 31 'DeleteUserRankingPublicV1' test.out

#- 32 GetCurrentWeekLeaderboardRankingPublicV1
./ng net.accelbyte.sdk.cli.Main leaderboard getCurrentWeekLeaderboardRankingPublicV1 \
    --leaderboardCode 'sU0Oo89c' \
    --namespace "$AB_NAMESPACE" \
    --limit '47' \
    --offset '63' \
    --previousVersion '13' \
    > test.out 2>&1
eval_tap $? 32 'GetCurrentWeekLeaderboardRankingPublicV1' test.out

#- 33 GetHiddenUsersV2
./ng net.accelbyte.sdk.cli.Main leaderboard getHiddenUsersV2 \
    --leaderboardCode '4il1JHig' \
    --namespace "$AB_NAMESPACE" \
    --limit '29' \
    --offset '61' \
    > test.out 2>&1
eval_tap $? 33 'GetHiddenUsersV2' test.out

#- 34 GetUserVisibilityStatusV2
./ng net.accelbyte.sdk.cli.Main leaderboard getUserVisibilityStatusV2 \
    --leaderboardCode 'qUHizX8w' \
    --namespace "$AB_NAMESPACE" \
    --userId 'GZaKOF5l' \
    > test.out 2>&1
eval_tap $? 34 'GetUserVisibilityStatusV2' test.out

#- 35 SetUserLeaderboardVisibilityStatusV2
./ng net.accelbyte.sdk.cli.Main leaderboard setUserLeaderboardVisibilityStatusV2 \
    --leaderboardCode 'yB0hOsUI' \
    --namespace "$AB_NAMESPACE" \
    --userId 'HXQ6jaaQ' \
    --body '{"visibility": false}' \
    > test.out 2>&1
eval_tap $? 35 'SetUserLeaderboardVisibilityStatusV2' test.out

#- 36 SetUserVisibilityStatusV2
./ng net.accelbyte.sdk.cli.Main leaderboard setUserVisibilityStatusV2 \
    --namespace "$AB_NAMESPACE" \
    --userId 'Drjsz2wN' \
    --body '{"visibility": false}' \
    > test.out 2>&1
eval_tap $? 36 'SetUserVisibilityStatusV2' test.out

#- 37 GetLeaderboardConfigurationsPublicV2
./ng net.accelbyte.sdk.cli.Main leaderboard getLeaderboardConfigurationsPublicV2 \
    --namespace "$AB_NAMESPACE" \
    --limit '62' \
    --offset '100' \
    > test.out 2>&1
eval_tap $? 37 'GetLeaderboardConfigurationsPublicV2' test.out

#- 38 GetAllTimeLeaderboardRankingPublicV2
./ng net.accelbyte.sdk.cli.Main leaderboard getAllTimeLeaderboardRankingPublicV2 \
    --leaderboardCode 'jlp3IzX2' \
    --namespace "$AB_NAMESPACE" \
    --limit '18' \
    --offset '55' \
    > test.out 2>&1
eval_tap $? 38 'GetAllTimeLeaderboardRankingPublicV2' test.out

#- 39 GetLeaderboardConfigurationsAdminV3
./ng net.accelbyte.sdk.cli.Main leaderboard getLeaderboardConfigurationsAdminV3 \
    --namespace "$AB_NAMESPACE" \
    --isDeleted  \
    --limit '32' \
    --offset '79' \
    > test.out 2>&1
eval_tap $? 39 'GetLeaderboardConfigurationsAdminV3' test.out

#- 40 CreateLeaderboardConfigurationAdminV3
./ng net.accelbyte.sdk.cli.Main leaderboard createLeaderboardConfigurationAdminV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"allTime": true, "cycleIds": ["NJo0tFUb", "bp3P7Ve5", "3lQYlaSn"], "descending": true, "description": "EfYnXPRb", "iconURL": "cYM67Z6e", "leaderboardCode": "Ihobj7cT", "name": "a75NjvuQ", "statCode": "srM47OHs"}' \
    > test.out 2>&1
eval_tap $? 40 'CreateLeaderboardConfigurationAdminV3' test.out

#- 41 DeleteBulkLeaderboardConfigurationAdminV3
./ng net.accelbyte.sdk.cli.Main leaderboard deleteBulkLeaderboardConfigurationAdminV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"leaderboardCodes": ["35XBxrIE", "rRrOfOYO", "MwmW0P5Y"]}' \
    > test.out 2>&1
eval_tap $? 41 'DeleteBulkLeaderboardConfigurationAdminV3' test.out

#- 42 GetLeaderboardConfigurationAdminV3
./ng net.accelbyte.sdk.cli.Main leaderboard getLeaderboardConfigurationAdminV3 \
    --leaderboardCode 'Mt8zUAbT' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 42 'GetLeaderboardConfigurationAdminV3' test.out

#- 43 UpdateLeaderboardConfigurationAdminV3
./ng net.accelbyte.sdk.cli.Main leaderboard updateLeaderboardConfigurationAdminV3 \
    --leaderboardCode '9rbIEgkA' \
    --namespace "$AB_NAMESPACE" \
    --body '{"allTime": true, "cycleIds": ["JqbxnJQE", "oo4AWBEo", "uk948vI6"], "descending": false, "description": "6JGqIeQs", "iconURL": "DnXuZD1s", "name": "PWog2cHo"}' \
    > test.out 2>&1
eval_tap $? 43 'UpdateLeaderboardConfigurationAdminV3' test.out

#- 44 DeleteLeaderboardConfigurationAdminV3
./ng net.accelbyte.sdk.cli.Main leaderboard deleteLeaderboardConfigurationAdminV3 \
    --leaderboardCode '9g2VKtU4' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 44 'DeleteLeaderboardConfigurationAdminV3' test.out

#- 45 GetAllTimeLeaderboardRankingAdminV3
./ng net.accelbyte.sdk.cli.Main leaderboard getAllTimeLeaderboardRankingAdminV3 \
    --leaderboardCode '9yWR2RkY' \
    --namespace "$AB_NAMESPACE" \
    --limit '47' \
    --offset '48' \
    > test.out 2>&1
eval_tap $? 45 'GetAllTimeLeaderboardRankingAdminV3' test.out

#- 46 GetCurrentCycleLeaderboardRankingAdminV3
./ng net.accelbyte.sdk.cli.Main leaderboard getCurrentCycleLeaderboardRankingAdminV3 \
    --cycleId 'sK5XOks7' \
    --leaderboardCode 'mnnNwYK4' \
    --namespace "$AB_NAMESPACE" \
    --limit '25' \
    --offset '3' \
    --previousVersion '30' \
    > test.out 2>&1
eval_tap $? 46 'GetCurrentCycleLeaderboardRankingAdminV3' test.out

#- 47 DeleteAllUserRankingByCycleIdAdminV3
./ng net.accelbyte.sdk.cli.Main leaderboard deleteAllUserRankingByCycleIdAdminV3 \
    --cycleId 'ZdtqjWCJ' \
    --leaderboardCode '6eJZhQF1' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 47 'DeleteAllUserRankingByCycleIdAdminV3' test.out

#- 48 DeleteUserRankingByCycleIdAdminV3
./ng net.accelbyte.sdk.cli.Main leaderboard deleteUserRankingByCycleIdAdminV3 \
    --cycleId 'MsaWAll6' \
    --leaderboardCode 'EGwevwZB' \
    --namespace "$AB_NAMESPACE" \
    --userId '6eKWh1Lj' \
    > test.out 2>&1
eval_tap $? 48 'DeleteUserRankingByCycleIdAdminV3' test.out

#- 49 HardDeleteLeaderboardAdminV3
./ng net.accelbyte.sdk.cli.Main leaderboard hardDeleteLeaderboardAdminV3 \
    --leaderboardCode 'YvubDYxG' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 49 'HardDeleteLeaderboardAdminV3' test.out

#- 50 DeleteUserRankingByLeaderboardCodeAdminV3
./ng net.accelbyte.sdk.cli.Main leaderboard deleteUserRankingByLeaderboardCodeAdminV3 \
    --leaderboardCode 'YUMfEOmt' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 50 'DeleteUserRankingByLeaderboardCodeAdminV3' test.out

#- 51 GetHiddenUsersV3
./ng net.accelbyte.sdk.cli.Main leaderboard getHiddenUsersV3 \
    --leaderboardCode 'aDmVEaVM' \
    --namespace "$AB_NAMESPACE" \
    --limit '6' \
    --offset '70' \
    > test.out 2>&1
eval_tap $? 51 'GetHiddenUsersV3' test.out

#- 52 GetUserRankingAdminV3
./ng net.accelbyte.sdk.cli.Main leaderboard getUserRankingAdminV3 \
    --leaderboardCode 'lbnnvagN' \
    --namespace "$AB_NAMESPACE" \
    --userId 'AWB2RAhd' \
    --previousVersion '0' \
    > test.out 2>&1
eval_tap $? 52 'GetUserRankingAdminV3' test.out

#- 53 DeleteUserRankingAdminV3
./ng net.accelbyte.sdk.cli.Main leaderboard deleteUserRankingAdminV3 \
    --leaderboardCode 'T8244njG' \
    --namespace "$AB_NAMESPACE" \
    --userId 'LUG5s9uW' \
    > test.out 2>&1
eval_tap $? 53 'DeleteUserRankingAdminV3' test.out

#- 54 GetUserVisibilityStatusV3
./ng net.accelbyte.sdk.cli.Main leaderboard getUserVisibilityStatusV3 \
    --leaderboardCode 'bS9Nio49' \
    --namespace "$AB_NAMESPACE" \
    --userId 'OmsCUGrR' \
    > test.out 2>&1
eval_tap $? 54 'GetUserVisibilityStatusV3' test.out

#- 55 SetUserLeaderboardVisibilityV3
./ng net.accelbyte.sdk.cli.Main leaderboard setUserLeaderboardVisibilityV3 \
    --leaderboardCode 'cv3LVkIK' \
    --namespace "$AB_NAMESPACE" \
    --userId 'a2frXdTD' \
    --body '{"visibility": false}' \
    > test.out 2>&1
eval_tap $? 55 'SetUserLeaderboardVisibilityV3' test.out

#- 56 DeleteUserRankingsAdminV3
./ng net.accelbyte.sdk.cli.Main leaderboard deleteUserRankingsAdminV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'JLj0E0sY' \
    --leaderboardCode 'LsZ8stwf,yB5OfV25,QDojgE7V' \
    > test.out 2>&1
eval_tap $? 56 'DeleteUserRankingsAdminV3' test.out

#- 57 GetUserLeaderboardRankingsAdminV3
./ng net.accelbyte.sdk.cli.Main leaderboard getUserLeaderboardRankingsAdminV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'U7Ownvl9' \
    --limit '98' \
    --offset '55' \
    --previousVersion '61' \
    > test.out 2>&1
eval_tap $? 57 'GetUserLeaderboardRankingsAdminV3' test.out

#- 58 SetUserVisibilityV3
./ng net.accelbyte.sdk.cli.Main leaderboard setUserVisibilityV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'El5GyPV4' \
    --body '{"visibility": false}' \
    > test.out 2>&1
eval_tap $? 58 'SetUserVisibilityV3' test.out

#- 59 GetLeaderboardConfigurationsPublicV3
./ng net.accelbyte.sdk.cli.Main leaderboard getLeaderboardConfigurationsPublicV3 \
    --namespace "$AB_NAMESPACE" \
    --isDeleted  \
    --limit '36' \
    --offset '6' \
    > test.out 2>&1
eval_tap $? 59 'GetLeaderboardConfigurationsPublicV3' test.out

#- 60 GetLeaderboardConfigurationPublicV3
./ng net.accelbyte.sdk.cli.Main leaderboard getLeaderboardConfigurationPublicV3 \
    --leaderboardCode 'Jtlco7Nc' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 60 'GetLeaderboardConfigurationPublicV3' test.out

#- 61 GetAllTimeLeaderboardRankingPublicV3
./ng net.accelbyte.sdk.cli.Main leaderboard getAllTimeLeaderboardRankingPublicV3 \
    --leaderboardCode 'oVGEEDuz' \
    --namespace "$AB_NAMESPACE" \
    --limit '82' \
    --offset '12' \
    > test.out 2>&1
eval_tap $? 61 'GetAllTimeLeaderboardRankingPublicV3' test.out

#- 62 GetCurrentCycleLeaderboardRankingPublicV3
./ng net.accelbyte.sdk.cli.Main leaderboard getCurrentCycleLeaderboardRankingPublicV3 \
    --cycleId 'OmPlXFtj' \
    --leaderboardCode 'wo1oShMp' \
    --namespace "$AB_NAMESPACE" \
    --limit '16' \
    --offset '50' \
    --previousVersion '87' \
    > test.out 2>&1
eval_tap $? 62 'GetCurrentCycleLeaderboardRankingPublicV3' test.out

#- 63 BulkGetUsersRankingPublicV3
./ng net.accelbyte.sdk.cli.Main leaderboard bulkGetUsersRankingPublicV3 \
    --leaderboardCode '0Fz0TObq' \
    --namespace "$AB_NAMESPACE" \
    --previousVersion '24' \
    --body '{"userIds": ["DC8I74WD", "YsGgw0su", "GDdnYCwy"]}' \
    > test.out 2>&1
eval_tap $? 63 'BulkGetUsersRankingPublicV3' test.out

#- 64 GetUserRankingPublicV3
./ng net.accelbyte.sdk.cli.Main leaderboard getUserRankingPublicV3 \
    --leaderboardCode 'TQtEXAvO' \
    --namespace "$AB_NAMESPACE" \
    --userId 'BjYeur6n' \
    --previousVersion '9' \
    > test.out 2>&1
eval_tap $? 64 'GetUserRankingPublicV3' test.out


rm -f "tmp.dat"

exit $EXIT_CODE