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
echo "1..62"

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
    --limit '88' \
    --offset '55' \
    > test.out 2>&1
eval_tap $? 2 'GetLeaderboardConfigurationsAdminV1' test.out

#- 3 CreateLeaderboardConfigurationAdminV1
./ng net.accelbyte.sdk.cli.Main leaderboard createLeaderboardConfigurationAdminV1 \
    --namespace "$AB_NAMESPACE" \
    --body '{"daily": {"resetTime": "YIZ8Kw97"}, "descending": false, "iconURL": "TaEPJ53d", "leaderboardCode": "2qxP6oI5", "monthly": {"resetDate": 93, "resetTime": "CSkMLSdL"}, "name": "E4RaVS5B", "seasonPeriod": 64, "startTime": "DkC9QTBi", "statCode": "DWNF4jNE", "weekly": {"resetDay": 43, "resetTime": "pNlDKb5M"}}' \
    > test.out 2>&1
eval_tap $? 3 'CreateLeaderboardConfigurationAdminV1' test.out

#- 4 AdminGetArchivedLeaderboardRankingDataV1Handler
./ng net.accelbyte.sdk.cli.Main leaderboard adminGetArchivedLeaderboardRankingDataV1Handler \
    --namespace "$AB_NAMESPACE" \
    --slug 'fnCopU8y' \
    --leaderboardCodes 'NhWIylWl' \
    > test.out 2>&1
eval_tap $? 4 'AdminGetArchivedLeaderboardRankingDataV1Handler' test.out

#- 5 CreateArchivedLeaderboardRankingDataV1Handler
./ng net.accelbyte.sdk.cli.Main leaderboard createArchivedLeaderboardRankingDataV1Handler \
    --namespace "$AB_NAMESPACE" \
    --body '{"leaderboardCodes": ["KVYThkLd", "mWRvp44A", "HfehBaJF"], "limit": 28, "slug": "LsV4OUX6"}' \
    > test.out 2>&1
eval_tap $? 5 'CreateArchivedLeaderboardRankingDataV1Handler' test.out

#- 6 DeleteBulkLeaderboardConfigurationAdminV1
./ng net.accelbyte.sdk.cli.Main leaderboard deleteBulkLeaderboardConfigurationAdminV1 \
    --namespace "$AB_NAMESPACE" \
    --body '{"leaderboardCodes": ["2LNRKVhq", "0NAU7mpc", "uxh8IC8O"]}' \
    > test.out 2>&1
eval_tap $? 6 'DeleteBulkLeaderboardConfigurationAdminV1' test.out

#- 7 GetLeaderboardConfigurationAdminV1
./ng net.accelbyte.sdk.cli.Main leaderboard getLeaderboardConfigurationAdminV1 \
    --leaderboardCode 'SSJAltmc' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 7 'GetLeaderboardConfigurationAdminV1' test.out

#- 8 UpdateLeaderboardConfigurationAdminV1
./ng net.accelbyte.sdk.cli.Main leaderboard updateLeaderboardConfigurationAdminV1 \
    --leaderboardCode 'mGjbdSxg' \
    --namespace "$AB_NAMESPACE" \
    --body '{"daily": {"resetTime": "NR4qwqpn"}, "descending": true, "iconURL": "BJeEi06p", "monthly": {"resetDate": 59, "resetTime": "zPUYL5Sm"}, "name": "gtKyi7ZR", "seasonPeriod": 78, "startTime": "WSHLCljJ", "statCode": "tcIhU6Vn", "weekly": {"resetDay": 59, "resetTime": "ZSW9fNFa"}}' \
    > test.out 2>&1
eval_tap $? 8 'UpdateLeaderboardConfigurationAdminV1' test.out

#- 9 DeleteLeaderboardConfigurationAdminV1
./ng net.accelbyte.sdk.cli.Main leaderboard deleteLeaderboardConfigurationAdminV1 \
    --leaderboardCode 'FmxKDniz' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 9 'DeleteLeaderboardConfigurationAdminV1' test.out

#- 10 GetAllTimeLeaderboardRankingAdminV1
./ng net.accelbyte.sdk.cli.Main leaderboard getAllTimeLeaderboardRankingAdminV1 \
    --leaderboardCode 'oMHnhzZX' \
    --namespace "$AB_NAMESPACE" \
    --limit '8' \
    --offset '18' \
    > test.out 2>&1
eval_tap $? 10 'GetAllTimeLeaderboardRankingAdminV1' test.out

#- 11 HardDeleteLeaderboardAdminV1
./ng net.accelbyte.sdk.cli.Main leaderboard hardDeleteLeaderboardAdminV1 \
    --leaderboardCode 'GRUEgg93' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 11 'HardDeleteLeaderboardAdminV1' test.out

#- 12 GetCurrentMonthLeaderboardRankingAdminV1
./ng net.accelbyte.sdk.cli.Main leaderboard getCurrentMonthLeaderboardRankingAdminV1 \
    --leaderboardCode 'e8q7u06o' \
    --namespace "$AB_NAMESPACE" \
    --limit '30' \
    --offset '78' \
    --previousVersion '71' \
    > test.out 2>&1
eval_tap $? 12 'GetCurrentMonthLeaderboardRankingAdminV1' test.out

#- 13 DeleteUserRankingByLeaderboardCodeAdminV1
./ng net.accelbyte.sdk.cli.Main leaderboard deleteUserRankingByLeaderboardCodeAdminV1 \
    --leaderboardCode 'ci3eubpE' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 13 'DeleteUserRankingByLeaderboardCodeAdminV1' test.out

#- 14 GetCurrentSeasonLeaderboardRankingAdminV1
./ng net.accelbyte.sdk.cli.Main leaderboard getCurrentSeasonLeaderboardRankingAdminV1 \
    --leaderboardCode 'j7sdfS8P' \
    --namespace "$AB_NAMESPACE" \
    --limit '87' \
    --offset '4' \
    --previousVersion '15' \
    > test.out 2>&1
eval_tap $? 14 'GetCurrentSeasonLeaderboardRankingAdminV1' test.out

#- 15 GetTodayLeaderboardRankingAdminV1
./ng net.accelbyte.sdk.cli.Main leaderboard getTodayLeaderboardRankingAdminV1 \
    --leaderboardCode 'Pyn3Mn4r' \
    --namespace "$AB_NAMESPACE" \
    --limit '62' \
    --offset '44' \
    --previousVersion '20' \
    > test.out 2>&1
eval_tap $? 15 'GetTodayLeaderboardRankingAdminV1' test.out

#- 16 GetUserRankingAdminV1
./ng net.accelbyte.sdk.cli.Main leaderboard getUserRankingAdminV1 \
    --leaderboardCode 'gjxaB9pC' \
    --namespace "$AB_NAMESPACE" \
    --userId 'KUcsib3J' \
    --previousVersion '2' \
    > test.out 2>&1
eval_tap $? 16 'GetUserRankingAdminV1' test.out

#- 17 UpdateUserPointAdminV1
./ng net.accelbyte.sdk.cli.Main leaderboard updateUserPointAdminV1 \
    --leaderboardCode 'Tgofilrl' \
    --namespace "$AB_NAMESPACE" \
    --userId '9xljqpBI' \
    --body '{"inc": 0.3032822487187504, "latestValue": 0.03771620691348054}' \
    > test.out 2>&1
eval_tap $? 17 'UpdateUserPointAdminV1' test.out

#- 18 DeleteUserRankingAdminV1
./ng net.accelbyte.sdk.cli.Main leaderboard deleteUserRankingAdminV1 \
    --leaderboardCode 'ec4fs96M' \
    --namespace "$AB_NAMESPACE" \
    --userId 'RqRIoWfQ' \
    > test.out 2>&1
eval_tap $? 18 'DeleteUserRankingAdminV1' test.out

#- 19 GetCurrentWeekLeaderboardRankingAdminV1
./ng net.accelbyte.sdk.cli.Main leaderboard getCurrentWeekLeaderboardRankingAdminV1 \
    --leaderboardCode 'tswMJjLM' \
    --namespace "$AB_NAMESPACE" \
    --limit '85' \
    --offset '11' \
    --previousVersion '59' \
    > test.out 2>&1
eval_tap $? 19 'GetCurrentWeekLeaderboardRankingAdminV1' test.out

#- 20 DeleteUserRankingsAdminV1
./ng net.accelbyte.sdk.cli.Main leaderboard deleteUserRankingsAdminV1 \
    --namespace "$AB_NAMESPACE" \
    --userId 'LGHqFwZF' \
    --leaderboardCode 'JVYYHYXe,ZHGiFGKh,BSFq1wJv' \
    > test.out 2>&1
eval_tap $? 20 'DeleteUserRankingsAdminV1' test.out

#- 21 AdminAnonymizeUserLeaderboardAdminV1
./ng net.accelbyte.sdk.cli.Main leaderboard adminAnonymizeUserLeaderboardAdminV1 \
    --namespace "$AB_NAMESPACE" \
    --userId '6riwZAJb' \
    > test.out 2>&1
eval_tap $? 21 'AdminAnonymizeUserLeaderboardAdminV1' test.out

#- 22 GetUserLeaderboardRankingsAdminV1
./ng net.accelbyte.sdk.cli.Main leaderboard getUserLeaderboardRankingsAdminV1 \
    --namespace "$AB_NAMESPACE" \
    --userId '9mppwt3q' \
    --limit '86' \
    --offset '68' \
    --previousVersion '90' \
    > test.out 2>&1
eval_tap $? 22 'GetUserLeaderboardRankingsAdminV1' test.out

#- 23 GetLeaderboardConfigurationsPublicV1
./ng net.accelbyte.sdk.cli.Main leaderboard getLeaderboardConfigurationsPublicV1 \
    --namespace "$AB_NAMESPACE" \
    --isArchived  \
    --isDeleted  \
    --limit '13' \
    --offset '34' \
    > test.out 2>&1
eval_tap $? 23 'GetLeaderboardConfigurationsPublicV1' test.out

#- 24 CreateLeaderboardConfigurationPublicV1
./ng net.accelbyte.sdk.cli.Main leaderboard createLeaderboardConfigurationPublicV1 \
    --namespace "$AB_NAMESPACE" \
    --body '{"daily": {"resetTime": "P0jldDEf"}, "descending": true, "iconURL": "BVXyWjxV", "leaderboardCode": "VcugTbtc", "monthly": {"resetDate": 83, "resetTime": "AJsR2Yww"}, "name": "razKeQBG", "seasonPeriod": 4, "startTime": "198CWGQt", "statCode": "60lPC6op", "weekly": {"resetDay": 75, "resetTime": "ibjHTIjW"}}' \
    > test.out 2>&1
eval_tap $? 24 'CreateLeaderboardConfigurationPublicV1' test.out

#- 25 GetAllTimeLeaderboardRankingPublicV1
./ng net.accelbyte.sdk.cli.Main leaderboard getAllTimeLeaderboardRankingPublicV1 \
    --leaderboardCode '1NC80XLu' \
    --namespace "$AB_NAMESPACE" \
    --limit '52' \
    --offset '21' \
    > test.out 2>&1
eval_tap $? 25 'GetAllTimeLeaderboardRankingPublicV1' test.out

#- 26 GetArchivedLeaderboardRankingDataV1Handler
./ng net.accelbyte.sdk.cli.Main leaderboard getArchivedLeaderboardRankingDataV1Handler \
    --leaderboardCode 'BaBOQm9G' \
    --namespace "$AB_NAMESPACE" \
    --slug 'OdtZRtpR' \
    --leaderboardCodes '3B13x1eX' \
    > test.out 2>&1
eval_tap $? 26 'GetArchivedLeaderboardRankingDataV1Handler' test.out

#- 27 GetCurrentMonthLeaderboardRankingPublicV1
./ng net.accelbyte.sdk.cli.Main leaderboard getCurrentMonthLeaderboardRankingPublicV1 \
    --leaderboardCode 'p9hkf2Ac' \
    --namespace "$AB_NAMESPACE" \
    --limit '45' \
    --offset '50' \
    --previousVersion '61' \
    > test.out 2>&1
eval_tap $? 27 'GetCurrentMonthLeaderboardRankingPublicV1' test.out

#- 28 GetCurrentSeasonLeaderboardRankingPublicV1
./ng net.accelbyte.sdk.cli.Main leaderboard getCurrentSeasonLeaderboardRankingPublicV1 \
    --leaderboardCode 'zS6mnk5A' \
    --namespace "$AB_NAMESPACE" \
    --limit '27' \
    --offset '93' \
    --previousVersion '15' \
    > test.out 2>&1
eval_tap $? 28 'GetCurrentSeasonLeaderboardRankingPublicV1' test.out

#- 29 GetTodayLeaderboardRankingPublicV1
./ng net.accelbyte.sdk.cli.Main leaderboard getTodayLeaderboardRankingPublicV1 \
    --leaderboardCode 'sHDjmruu' \
    --namespace "$AB_NAMESPACE" \
    --limit '74' \
    --offset '97' \
    --previousVersion '84' \
    > test.out 2>&1
eval_tap $? 29 'GetTodayLeaderboardRankingPublicV1' test.out

#- 30 GetUserRankingPublicV1
./ng net.accelbyte.sdk.cli.Main leaderboard getUserRankingPublicV1 \
    --leaderboardCode '8g4mWDjX' \
    --namespace "$AB_NAMESPACE" \
    --userId 'IkQsGw0b' \
    --previousVersion '47' \
    > test.out 2>&1
eval_tap $? 30 'GetUserRankingPublicV1' test.out

#- 31 DeleteUserRankingPublicV1
./ng net.accelbyte.sdk.cli.Main leaderboard deleteUserRankingPublicV1 \
    --leaderboardCode 'eYbI4TAO' \
    --namespace "$AB_NAMESPACE" \
    --userId '9CW5Cna2' \
    > test.out 2>&1
eval_tap $? 31 'DeleteUserRankingPublicV1' test.out

#- 32 GetCurrentWeekLeaderboardRankingPublicV1
./ng net.accelbyte.sdk.cli.Main leaderboard getCurrentWeekLeaderboardRankingPublicV1 \
    --leaderboardCode '2M2duSE2' \
    --namespace "$AB_NAMESPACE" \
    --limit '89' \
    --offset '62' \
    --previousVersion '7' \
    > test.out 2>&1
eval_tap $? 32 'GetCurrentWeekLeaderboardRankingPublicV1' test.out

#- 33 GetHiddenUsersV2
./ng net.accelbyte.sdk.cli.Main leaderboard getHiddenUsersV2 \
    --leaderboardCode 'vjZcEIyS' \
    --namespace "$AB_NAMESPACE" \
    --limit '31' \
    --offset '46' \
    > test.out 2>&1
eval_tap $? 33 'GetHiddenUsersV2' test.out

#- 34 GetUserVisibilityStatusV2
./ng net.accelbyte.sdk.cli.Main leaderboard getUserVisibilityStatusV2 \
    --leaderboardCode 'SGwElM7I' \
    --namespace "$AB_NAMESPACE" \
    --userId 'Xrk85tBk' \
    > test.out 2>&1
eval_tap $? 34 'GetUserVisibilityStatusV2' test.out

#- 35 SetUserLeaderboardVisibilityStatusV2
./ng net.accelbyte.sdk.cli.Main leaderboard setUserLeaderboardVisibilityStatusV2 \
    --leaderboardCode 'TbCG7jQJ' \
    --namespace "$AB_NAMESPACE" \
    --userId 'aolAhlTx' \
    --body '{"visibility": false}' \
    > test.out 2>&1
eval_tap $? 35 'SetUserLeaderboardVisibilityStatusV2' test.out

#- 36 SetUserVisibilityStatusV2
./ng net.accelbyte.sdk.cli.Main leaderboard setUserVisibilityStatusV2 \
    --namespace "$AB_NAMESPACE" \
    --userId 'A9Zk8dam' \
    --body '{"visibility": true}' \
    > test.out 2>&1
eval_tap $? 36 'SetUserVisibilityStatusV2' test.out

#- 37 GetLeaderboardConfigurationsPublicV2
./ng net.accelbyte.sdk.cli.Main leaderboard getLeaderboardConfigurationsPublicV2 \
    --namespace "$AB_NAMESPACE" \
    --limit '100' \
    --offset '36' \
    > test.out 2>&1
eval_tap $? 37 'GetLeaderboardConfigurationsPublicV2' test.out

#- 38 GetAllTimeLeaderboardRankingPublicV2
./ng net.accelbyte.sdk.cli.Main leaderboard getAllTimeLeaderboardRankingPublicV2 \
    --leaderboardCode 'dvjEToBy' \
    --namespace "$AB_NAMESPACE" \
    --limit '48' \
    --offset '14' \
    > test.out 2>&1
eval_tap $? 38 'GetAllTimeLeaderboardRankingPublicV2' test.out

#- 39 GetLeaderboardConfigurationsAdminV3
./ng net.accelbyte.sdk.cli.Main leaderboard getLeaderboardConfigurationsAdminV3 \
    --namespace "$AB_NAMESPACE" \
    --isDeleted  \
    --limit '42' \
    --offset '36' \
    > test.out 2>&1
eval_tap $? 39 'GetLeaderboardConfigurationsAdminV3' test.out

#- 40 CreateLeaderboardConfigurationAdminV3
./ng net.accelbyte.sdk.cli.Main leaderboard createLeaderboardConfigurationAdminV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"allTime": false, "cycleIds": ["eQELZ1QH", "xWzGPcRy", "zJn2f97A"], "descending": true, "description": "cOUdHCRL", "iconURL": "fe3tDTFN", "leaderboardCode": "ibV9oEnx", "name": "h2Qgexk1", "statCode": "eFRgFCxG"}' \
    > test.out 2>&1
eval_tap $? 40 'CreateLeaderboardConfigurationAdminV3' test.out

#- 41 DeleteBulkLeaderboardConfigurationAdminV3
./ng net.accelbyte.sdk.cli.Main leaderboard deleteBulkLeaderboardConfigurationAdminV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"leaderboardCodes": ["Mjao1HEf", "vcWZsKw3", "6G4qV50X"]}' \
    > test.out 2>&1
eval_tap $? 41 'DeleteBulkLeaderboardConfigurationAdminV3' test.out

#- 42 GetLeaderboardConfigurationAdminV3
./ng net.accelbyte.sdk.cli.Main leaderboard getLeaderboardConfigurationAdminV3 \
    --leaderboardCode 'nkrCvwpS' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 42 'GetLeaderboardConfigurationAdminV3' test.out

#- 43 UpdateLeaderboardConfigurationAdminV3
./ng net.accelbyte.sdk.cli.Main leaderboard updateLeaderboardConfigurationAdminV3 \
    --leaderboardCode 'Xwwp4FgC' \
    --namespace "$AB_NAMESPACE" \
    --body '{"allTime": true, "cycleIds": ["0fKlE0Ce", "Q2pOPxTc", "rcjBu2rM"], "descending": false, "description": "SvhHH6fv", "iconURL": "o2uNyL0Y", "name": "raoyZtUb"}' \
    > test.out 2>&1
eval_tap $? 43 'UpdateLeaderboardConfigurationAdminV3' test.out

#- 44 DeleteLeaderboardConfigurationAdminV3
./ng net.accelbyte.sdk.cli.Main leaderboard deleteLeaderboardConfigurationAdminV3 \
    --leaderboardCode 'tTgrWlmZ' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 44 'DeleteLeaderboardConfigurationAdminV3' test.out

#- 45 GetAllTimeLeaderboardRankingAdminV3
./ng net.accelbyte.sdk.cli.Main leaderboard getAllTimeLeaderboardRankingAdminV3 \
    --leaderboardCode 'PMiFvUa7' \
    --namespace "$AB_NAMESPACE" \
    --limit '41' \
    --offset '1' \
    > test.out 2>&1
eval_tap $? 45 'GetAllTimeLeaderboardRankingAdminV3' test.out

#- 46 GetCurrentCycleLeaderboardRankingAdminV3
./ng net.accelbyte.sdk.cli.Main leaderboard getCurrentCycleLeaderboardRankingAdminV3 \
    --cycleId '3JPqY943' \
    --leaderboardCode 'TcWucl4j' \
    --namespace "$AB_NAMESPACE" \
    --limit '74' \
    --offset '82' \
    > test.out 2>&1
eval_tap $? 46 'GetCurrentCycleLeaderboardRankingAdminV3' test.out

#- 47 HardDeleteLeaderboardAdminV3
./ng net.accelbyte.sdk.cli.Main leaderboard hardDeleteLeaderboardAdminV3 \
    --leaderboardCode '6dn2dnet' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 47 'HardDeleteLeaderboardAdminV3' test.out

#- 48 DeleteUserRankingByLeaderboardCodeAdminV3
./ng net.accelbyte.sdk.cli.Main leaderboard deleteUserRankingByLeaderboardCodeAdminV3 \
    --leaderboardCode 'nGcK8sJm' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 48 'DeleteUserRankingByLeaderboardCodeAdminV3' test.out

#- 49 GetHiddenUsersV3
./ng net.accelbyte.sdk.cli.Main leaderboard getHiddenUsersV3 \
    --leaderboardCode '23JPU9AF' \
    --namespace "$AB_NAMESPACE" \
    --limit '50' \
    --offset '93' \
    > test.out 2>&1
eval_tap $? 49 'GetHiddenUsersV3' test.out

#- 50 GetUserRankingAdminV3
./ng net.accelbyte.sdk.cli.Main leaderboard getUserRankingAdminV3 \
    --leaderboardCode 'IS7V0J0v' \
    --namespace "$AB_NAMESPACE" \
    --userId 'QkAEBiD7' \
    > test.out 2>&1
eval_tap $? 50 'GetUserRankingAdminV3' test.out

#- 51 DeleteUserRankingAdminV3
./ng net.accelbyte.sdk.cli.Main leaderboard deleteUserRankingAdminV3 \
    --leaderboardCode '8oZxSjrg' \
    --namespace "$AB_NAMESPACE" \
    --userId 'LBzJAe4z' \
    > test.out 2>&1
eval_tap $? 51 'DeleteUserRankingAdminV3' test.out

#- 52 GetUserVisibilityStatusV3
./ng net.accelbyte.sdk.cli.Main leaderboard getUserVisibilityStatusV3 \
    --leaderboardCode '6gkTsEJi' \
    --namespace "$AB_NAMESPACE" \
    --userId 'xV3F0VsI' \
    > test.out 2>&1
eval_tap $? 52 'GetUserVisibilityStatusV3' test.out

#- 53 SetUserLeaderboardVisibilityV3
./ng net.accelbyte.sdk.cli.Main leaderboard setUserLeaderboardVisibilityV3 \
    --leaderboardCode 'cwjSAfU5' \
    --namespace "$AB_NAMESPACE" \
    --userId 'xlnTgOn9' \
    --body '{"visibility": false}' \
    > test.out 2>&1
eval_tap $? 53 'SetUserLeaderboardVisibilityV3' test.out

#- 54 DeleteUserRankingsAdminV3
./ng net.accelbyte.sdk.cli.Main leaderboard deleteUserRankingsAdminV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'UlTRwLXz' \
    --leaderboardCode 'mGzsc6Xj,nH8LMDYl,YtYKGlTg' \
    > test.out 2>&1
eval_tap $? 54 'DeleteUserRankingsAdminV3' test.out

#- 55 GetUserLeaderboardRankingsAdminV3
./ng net.accelbyte.sdk.cli.Main leaderboard getUserLeaderboardRankingsAdminV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'wrLH8Tgn' \
    --limit '34' \
    --offset '42' \
    > test.out 2>&1
eval_tap $? 55 'GetUserLeaderboardRankingsAdminV3' test.out

#- 56 SetUserVisibilityV3
./ng net.accelbyte.sdk.cli.Main leaderboard setUserVisibilityV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'QTHrqyGW' \
    --body '{"visibility": false}' \
    > test.out 2>&1
eval_tap $? 56 'SetUserVisibilityV3' test.out

#- 57 GetLeaderboardConfigurationsPublicV3
./ng net.accelbyte.sdk.cli.Main leaderboard getLeaderboardConfigurationsPublicV3 \
    --namespace "$AB_NAMESPACE" \
    --isDeleted  \
    --limit '81' \
    --offset '96' \
    > test.out 2>&1
eval_tap $? 57 'GetLeaderboardConfigurationsPublicV3' test.out

#- 58 GetLeaderboardConfigurationPublicV3
./ng net.accelbyte.sdk.cli.Main leaderboard getLeaderboardConfigurationPublicV3 \
    --leaderboardCode 'F5F0XnvH' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 58 'GetLeaderboardConfigurationPublicV3' test.out

#- 59 GetAllTimeLeaderboardRankingPublicV3
./ng net.accelbyte.sdk.cli.Main leaderboard getAllTimeLeaderboardRankingPublicV3 \
    --leaderboardCode '9JtPByrU' \
    --namespace "$AB_NAMESPACE" \
    --limit '86' \
    --offset '88' \
    > test.out 2>&1
eval_tap $? 59 'GetAllTimeLeaderboardRankingPublicV3' test.out

#- 60 GetCurrentCycleLeaderboardRankingPublicV3
./ng net.accelbyte.sdk.cli.Main leaderboard getCurrentCycleLeaderboardRankingPublicV3 \
    --cycleId 'snCUZ2hw' \
    --leaderboardCode 'MIUBs2ZQ' \
    --namespace "$AB_NAMESPACE" \
    --limit '24' \
    --offset '10' \
    > test.out 2>&1
eval_tap $? 60 'GetCurrentCycleLeaderboardRankingPublicV3' test.out

#- 61 BulkGetUsersRankingPublicV3
./ng net.accelbyte.sdk.cli.Main leaderboard bulkGetUsersRankingPublicV3 \
    --leaderboardCode 'buO6LDdr' \
    --namespace "$AB_NAMESPACE" \
    --body '{"userIds": ["EyW7u70g", "DyRWd1OD", "FcaKper1"]}' \
    > test.out 2>&1
eval_tap $? 61 'BulkGetUsersRankingPublicV3' test.out

#- 62 GetUserRankingPublicV3
./ng net.accelbyte.sdk.cli.Main leaderboard getUserRankingPublicV3 \
    --leaderboardCode 'LqivPNCB' \
    --namespace "$AB_NAMESPACE" \
    --userId 'QZG319y5' \
    > test.out 2>&1
eval_tap $? 62 'GetUserRankingPublicV3' test.out


rm -f "tmp.dat"

exit $EXIT_CODE