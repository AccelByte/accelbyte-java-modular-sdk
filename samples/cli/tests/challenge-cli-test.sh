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
echo "1..29"

#- 1 Login
./ng net.accelbyte.sdk.cli.Main loginClient \
    > test.out 2>&1
eval_tap $? 1 'Login' test.out

if [ $EXIT_CODE -ne 0 ]; then
  echo "Bail out! Login failed."
  exit $EXIT_CODE
fi

touch "tmp.dat"

#- 2 AdminGetChallenges
./ng net.accelbyte.sdk.cli.Main challenge adminGetChallenges \
    --namespace "$AB_NAMESPACE" \
    --limit '13' \
    --offset '57' \
    --sortBy 'XfmYM591' \
    --status 'INIT' \
    > test.out 2>&1
eval_tap $? 2 'AdminGetChallenges' test.out

#- 3 AdminCreateChallenge
./ng net.accelbyte.sdk.cli.Main challenge adminCreateChallenge \
    --namespace "$AB_NAMESPACE" \
    --body '{"activeGoalsPerRotation": 43, "assignmentRule": "RANDOMIZED", "code": "mdXUsFA8", "description": "01pk6MER", "endAfter": 15, "endDate": "1996-05-03T00:00:00Z", "goalsVisibility": "PERIODONLY", "name": "zoSUhQd2", "randomizedPerRotation": true, "repeatAfter": 47, "resetConfig": {"resetDate": 3, "resetDay": 41, "resetTime": "xq4zfh1Y"}, "rotation": "DAILY", "startDate": "1974-03-11T00:00:00Z"}' \
    > test.out 2>&1
eval_tap $? 3 'AdminCreateChallenge' test.out

#- 4 AdminGetChallenge
./ng net.accelbyte.sdk.cli.Main challenge adminGetChallenge \
    --challengeCode 'Ugya1BoU' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 4 'AdminGetChallenge' test.out

#- 5 AdminUpdateChallenge
./ng net.accelbyte.sdk.cli.Main challenge adminUpdateChallenge \
    --challengeCode 'yg9XoZFW' \
    --namespace "$AB_NAMESPACE" \
    --body '{"activeGoalsPerRotation": 64, "assignmentRule": "RANDOMIZED", "description": "kBWfAjWx", "endAfter": 77, "endDate": "1994-02-20T00:00:00Z", "goalsVisibility": "PERIODONLY", "name": "uIFaU7Wy", "randomizedPerRotation": true, "repeatAfter": 38, "resetConfig": {"resetDate": 75, "resetDay": 37, "resetTime": "8nNpMOQ6"}, "rotation": "WEEKLY", "startDate": "1978-04-22T00:00:00Z"}' \
    > test.out 2>&1
eval_tap $? 5 'AdminUpdateChallenge' test.out

#- 6 AdminDeleteChallenge
./ng net.accelbyte.sdk.cli.Main challenge adminDeleteChallenge \
    --challengeCode 'VFK5FiKK' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 6 'AdminDeleteChallenge' test.out

#- 7 AdminGetGoals
./ng net.accelbyte.sdk.cli.Main challenge adminGetGoals \
    --challengeCode 'ee1nGGD9' \
    --namespace "$AB_NAMESPACE" \
    --limit '64' \
    --offset '90' \
    --sortBy 'LeR6WsKT' \
    > test.out 2>&1
eval_tap $? 7 'AdminGetGoals' test.out

#- 8 AdminCreateGoal
./ng net.accelbyte.sdk.cli.Main challenge adminCreateGoal \
    --challengeCode 'iPe3EDZ9' \
    --namespace "$AB_NAMESPACE" \
    --body '{"code": "eGCmgBmx", "description": "NeDFD3Av", "isActive": true, "name": "3zSb82Mj", "requirementGroups": [{"operator": "AND", "predicates": [{"matcher": "LESS_THAN_EQUAL", "parameterName": "R9kuF96B", "parameterType": "STATISTIC_CYCLE", "statCycleId": "ll4YvHrS", "targetValue": 0.6227083537432403}, {"matcher": "GREATER_THAN_EQUAL", "parameterName": "zAnJXZoF", "parameterType": "ENTITLEMENT", "statCycleId": "at01xWao", "targetValue": 0.2820590939472183}, {"matcher": "GREATER_THAN_EQUAL", "parameterName": "eQYfDCL7", "parameterType": "STATISTIC", "statCycleId": "I87ovprX", "targetValue": 0.25447755335761213}]}, {"operator": "AND", "predicates": [{"matcher": "GREATER_THAN_EQUAL", "parameterName": "FA0pwy1q", "parameterType": "ENTITLEMENT", "statCycleId": "QDW88KUQ", "targetValue": 0.9201363020820487}, {"matcher": "GREATER_THAN", "parameterName": "AYCNMJS7", "parameterType": "ACHIEVEMENT", "statCycleId": "rtWbb3mh", "targetValue": 0.9211031147084046}, {"matcher": "EQUAL", "parameterName": "clFWPKX8", "parameterType": "STATISTIC_CYCLE", "statCycleId": "7rhawVxD", "targetValue": 0.6253186737238703}]}, {"operator": "AND", "predicates": [{"matcher": "GREATER_THAN", "parameterName": "hK7xLI2b", "parameterType": "ACHIEVEMENT", "statCycleId": "dyc4AgKV", "targetValue": 0.9404854602843928}, {"matcher": "EQUAL", "parameterName": "u0u0YKkr", "parameterType": "STATISTIC_CYCLE", "statCycleId": "WAMgpXGH", "targetValue": 0.8724948605832687}, {"matcher": "GREATER_THAN", "parameterName": "5Xu0AsPB", "parameterType": "STATISTIC_CYCLE", "statCycleId": "LoT1D5KO", "targetValue": 0.33803416878068127}]}], "rewards": [{"itemId": "cIZMTtIM", "itemName": "RCesoB2x", "qty": 0.11253758382319567, "type": "STATISTIC"}, {"itemId": "AlCrEfeb", "itemName": "jjoFcCXN", "qty": 0.5492006314330191, "type": "STATISTIC"}, {"itemId": "YmE12U9p", "itemName": "EvJ7CvvS", "qty": 0.7842720699902714, "type": "ENTITLEMENT"}], "schedule": {"endTime": "1978-06-07T00:00:00Z", "order": 63, "startTime": "1988-12-28T00:00:00Z"}, "tags": ["zdxrD36Y", "VnFwFPkW", "7Jf6Pbuw"]}' \
    > test.out 2>&1
eval_tap $? 8 'AdminCreateGoal' test.out

#- 9 AdminGetGoal
./ng net.accelbyte.sdk.cli.Main challenge adminGetGoal \
    --challengeCode 'kocz4QM3' \
    --code 'sEjxcK8i' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 9 'AdminGetGoal' test.out

#- 10 AdminUpdateGoals
./ng net.accelbyte.sdk.cli.Main challenge adminUpdateGoals \
    --challengeCode 'ESEJV6GF' \
    --code 'BUwl9wBr' \
    --namespace "$AB_NAMESPACE" \
    --body '{"description": "DpNfG9ik", "isActive": true, "name": "uoBgWpaj", "requirementGroups": [{"operator": "AND", "predicates": [{"matcher": "GREATER_THAN", "parameterName": "rBWi3DuM", "parameterType": "STATISTIC_CYCLE", "statCycleId": "4NZmnhOZ", "targetValue": 0.21588607000444493}, {"matcher": "EQUAL", "parameterName": "uvZZc3RO", "parameterType": "ENTITLEMENT", "statCycleId": "3fUqiMBu", "targetValue": 0.5115789013737788}, {"matcher": "GREATER_THAN", "parameterName": "NV5DcU0I", "parameterType": "STATISTIC", "statCycleId": "JznoR2gk", "targetValue": 0.8084756369141807}]}, {"operator": "AND", "predicates": [{"matcher": "GREATER_THAN_EQUAL", "parameterName": "5tW5GY0g", "parameterType": "STATISTIC_CYCLE", "statCycleId": "8CzTgVnx", "targetValue": 0.14673054997123547}, {"matcher": "GREATER_THAN", "parameterName": "wjW6AZmk", "parameterType": "STATISTIC", "statCycleId": "c63FCmuQ", "targetValue": 0.5056497374279657}, {"matcher": "LESS_THAN_EQUAL", "parameterName": "D4YANb4C", "parameterType": "STATISTIC", "statCycleId": "OWTXqq2A", "targetValue": 0.9329585812140073}]}, {"operator": "AND", "predicates": [{"matcher": "EQUAL", "parameterName": "lzgIU40d", "parameterType": "ENTITLEMENT", "statCycleId": "FpAvAbrI", "targetValue": 0.7611241027347414}, {"matcher": "EQUAL", "parameterName": "irgkbldB", "parameterType": "ENTITLEMENT", "statCycleId": "da5EMmKy", "targetValue": 0.6534630009310242}, {"matcher": "GREATER_THAN", "parameterName": "KRGAbzkL", "parameterType": "STATISTIC", "statCycleId": "iep5hPPc", "targetValue": 0.787043760407308}]}], "rewards": [{"itemId": "NRT7wH3R", "itemName": "RcTzKcU2", "qty": 0.11458085327235346, "type": "ENTITLEMENT"}, {"itemId": "xvhGo1uo", "itemName": "cVC0nRC4", "qty": 0.08569233091822415, "type": "STATISTIC"}, {"itemId": "SKZyg1Ry", "itemName": "qhG2mPnM", "qty": 0.8903872438078321, "type": "STATISTIC"}], "schedule": {"endTime": "1971-08-16T00:00:00Z", "order": 64, "startTime": "1991-12-09T00:00:00Z"}, "tags": ["lRh02xoh", "yAR3jsRi", "kFwOa8lq"]}' \
    > test.out 2>&1
eval_tap $? 10 'AdminUpdateGoals' test.out

#- 11 AdminDeleteGoal
./ng net.accelbyte.sdk.cli.Main challenge adminDeleteGoal \
    --challengeCode 'HmOu42Ui' \
    --code 'gdRKR25u' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 11 'AdminDeleteGoal' test.out

#- 12 AdminGetPeriods
./ng net.accelbyte.sdk.cli.Main challenge adminGetPeriods \
    --challengeCode 'P0NVl49o' \
    --namespace "$AB_NAMESPACE" \
    --limit '75' \
    --offset '9' \
    > test.out 2>&1
eval_tap $? 12 'AdminGetPeriods' test.out

#- 13 AdminRandomizeChallenge
./ng net.accelbyte.sdk.cli.Main challenge adminRandomizeChallenge \
    --challengeCode 'hQYU1uKv' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 13 'AdminRandomizeChallenge' test.out

#- 14 AdminDeleteTiedChallenge
./ng net.accelbyte.sdk.cli.Main challenge adminDeleteTiedChallenge \
    --challengeCode 'wuYD94yL' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 14 'AdminDeleteTiedChallenge' test.out

#- 15 AdminGetAssignmentPlugin
./ng net.accelbyte.sdk.cli.Main challenge adminGetAssignmentPlugin \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 15 'AdminGetAssignmentPlugin' test.out

#- 16 AdminUpdateAssignmentPlugin
./ng net.accelbyte.sdk.cli.Main challenge adminUpdateAssignmentPlugin \
    --namespace "$AB_NAMESPACE" \
    --body '{"appName": "pz5CyUbI", "extendType": "APP", "grpcServerAddress": "PATyLx0a"}' \
    > test.out 2>&1
eval_tap $? 16 'AdminUpdateAssignmentPlugin' test.out

#- 17 AdminCreateAssignmentPlugin
./ng net.accelbyte.sdk.cli.Main challenge adminCreateAssignmentPlugin \
    --namespace "$AB_NAMESPACE" \
    --body '{"appName": "MCwbJWLi", "extendType": "CUSTOM", "grpcServerAddress": "T4TvCnY5"}' \
    > test.out 2>&1
eval_tap $? 17 'AdminCreateAssignmentPlugin' test.out

#- 18 AdminDeleteAssignmentPlugin
./ng net.accelbyte.sdk.cli.Main challenge adminDeleteAssignmentPlugin \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 18 'AdminDeleteAssignmentPlugin' test.out

#- 19 AdminEvaluateProgress
./ng net.accelbyte.sdk.cli.Main challenge adminEvaluateProgress \
    --namespace "$AB_NAMESPACE" \
    --body '{"userIds": ["hJ4dCeAg", "TsrLIRj8", "kGYK55Ns"]}' \
    > test.out 2>&1
eval_tap $? 19 'AdminEvaluateProgress' test.out

#- 20 AdminClaimUsersRewards
./ng net.accelbyte.sdk.cli.Main challenge adminClaimUsersRewards \
    --namespace "$AB_NAMESPACE" \
    --body '[{"rewardIds": ["seeSn05E", "zGFwSCJU", "ANnZInH7"], "userId": "2B56gokU"}, {"rewardIds": ["KrWhxy2R", "SRi7CWMe", "fz56THbV"], "userId": "wwvyThNn"}, {"rewardIds": ["UvfU9DtF", "WR1aEkOs", "klRIeUW7"], "userId": "MTLxHzyU"}]' \
    > test.out 2>&1
eval_tap $? 20 'AdminClaimUsersRewards' test.out

#- 21 AdminGetUserRewards
./ng net.accelbyte.sdk.cli.Main challenge adminGetUserRewards \
    --namespace "$AB_NAMESPACE" \
    --userId '8YAwyMmU' \
    --limit '21' \
    --offset '95' \
    --sortBy 'n76927Pk' \
    --status 'UNCLAIMED' \
    > test.out 2>&1
eval_tap $? 21 'AdminGetUserRewards' test.out

#- 22 AdminClaimUserRewards
./ng net.accelbyte.sdk.cli.Main challenge adminClaimUserRewards \
    --namespace "$AB_NAMESPACE" \
    --userId 'kUQLR6Md' \
    --body '{"rewardIDs": ["ez2pDAZc", "nyJi5jKL", "ZMvBrkre"]}' \
    > test.out 2>&1
eval_tap $? 22 'AdminClaimUserRewards' test.out

#- 23 GetChallenges
./ng net.accelbyte.sdk.cli.Main challenge getChallenges \
    --namespace "$AB_NAMESPACE" \
    --limit '10' \
    --offset '38' \
    --sortBy 'SzcwR9Jv' \
    --status 'RETIRED' \
    > test.out 2>&1
eval_tap $? 23 'GetChallenges' test.out

#- 24 PublicGetScheduledGoals
./ng net.accelbyte.sdk.cli.Main challenge publicGetScheduledGoals \
    --challengeCode 'YtJtyDsP' \
    --namespace "$AB_NAMESPACE" \
    --limit '70' \
    --offset '10' \
    --tags 'e1zJMhcM,u7gQSotC,zYOWdEZb' \
    > test.out 2>&1
eval_tap $? 24 'PublicGetScheduledGoals' test.out

#- 25 EvaluateMyProgress
./ng net.accelbyte.sdk.cli.Main challenge evaluateMyProgress \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 25 'EvaluateMyProgress' test.out

#- 26 PublicGetUserProgression
./ng net.accelbyte.sdk.cli.Main challenge publicGetUserProgression \
    --challengeCode 'LvZWrHvQ' \
    --namespace "$AB_NAMESPACE" \
    --dateTime '1973-10-09T00:00:00Z' \
    --goalCode 'aMCAdDZn' \
    --limit '66' \
    --offset '0' \
    --tags 'Hn6g95ZV,kPI8ZK7y,rUc4cvGO' \
    > test.out 2>&1
eval_tap $? 26 'PublicGetUserProgression' test.out

#- 27 PublicGetPastUserProgression
./ng net.accelbyte.sdk.cli.Main challenge publicGetPastUserProgression \
    --challengeCode 'Olm7cYsH' \
    --index '42' \
    --namespace "$AB_NAMESPACE" \
    --goalCode 'FNHZxTzG' \
    --limit '46' \
    --offset '0' \
    --tags 'yYu1fdH4,GhJKzvJi,ZYWH18CF' \
    > test.out 2>&1
eval_tap $? 27 'PublicGetPastUserProgression' test.out

#- 28 PublicGetUserRewards
./ng net.accelbyte.sdk.cli.Main challenge publicGetUserRewards \
    --namespace "$AB_NAMESPACE" \
    --limit '96' \
    --offset '26' \
    --sortBy 'T0kQiLAH' \
    --status 'CLAIMED' \
    > test.out 2>&1
eval_tap $? 28 'PublicGetUserRewards' test.out

#- 29 PublicClaimUserRewards
./ng net.accelbyte.sdk.cli.Main challenge publicClaimUserRewards \
    --namespace "$AB_NAMESPACE" \
    --body '{"rewardIDs": ["iL1XUcov", "fUFD2nDt", "HWkURnQo"]}' \
    > test.out 2>&1
eval_tap $? 29 'PublicClaimUserRewards' test.out


rm -f "tmp.dat"

exit $EXIT_CODE