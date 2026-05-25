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
echo "1..39"

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
    --keyword '5GCudch5' \
    --limit '35' \
    --offset '26' \
    --sortBy 'createdAt:desc' \
    --status 'INIT' \
    --tags 'bT0yCjov,oU3wEJwm,nYFJ9fcZ' \
    > test.out 2>&1
eval_tap $? 2 'AdminGetChallenges' test.out

#- 3 AdminCreateChallenge
./ng net.accelbyte.sdk.cli.Main challenge adminCreateChallenge \
    --namespace "$AB_NAMESPACE" \
    --body '{"activeGoalsPerRotation": 16, "assignmentRule": "CUSTOM", "code": "c3hFcXpL", "description": "TU1jbJ4b", "endAfter": 7, "endDate": "1982-01-06T00:00:00Z", "goalsVisibility": "PERIODONLY", "name": "dbUWdCla", "randomizedPerRotation": true, "repeatAfter": 28, "resetConfig": {"resetDate": 59, "resetDay": 74, "resetTime": "p3afaLpY"}, "rotation": "NONE", "startDate": "1997-04-07T00:00:00Z", "tags": ["dbH9Usc3", "maOxtO5H", "sJT31dEa"]}' \
    > test.out 2>&1
eval_tap $? 3 'AdminCreateChallenge' test.out

#- 4 AdminGetItemReferences
./ng net.accelbyte.sdk.cli.Main challenge adminGetItemReferences \
    --namespace "$AB_NAMESPACE" \
    --itemId 'DpIRS3M5' \
    > test.out 2>&1
eval_tap $? 4 'AdminGetItemReferences' test.out

#- 5 AdminGetActiveChallenges
./ng net.accelbyte.sdk.cli.Main challenge adminGetActiveChallenges \
    --namespace "$AB_NAMESPACE" \
    --userId '5LkBfZ0B' \
    --limit '99' \
    --offset '22' \
    > test.out 2>&1
eval_tap $? 5 'AdminGetActiveChallenges' test.out

#- 6 AdminGetChallenge
./ng net.accelbyte.sdk.cli.Main challenge adminGetChallenge \
    --challengeCode '2X9AAdz8' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 6 'AdminGetChallenge' test.out

#- 7 AdminUpdateChallenge
./ng net.accelbyte.sdk.cli.Main challenge adminUpdateChallenge \
    --challengeCode 'EnzybWXV' \
    --namespace "$AB_NAMESPACE" \
    --body '{"activeGoalsPerRotation": 59, "assignmentRule": "FIXED", "description": "aLCA30l3", "endAfter": 33, "endDate": "1993-02-23T00:00:00Z", "goalsVisibility": "PERIODONLY", "name": "pUquHoMM", "randomizedPerRotation": false, "repeatAfter": 17, "resetConfig": {"resetDate": 21, "resetDay": 86, "resetTime": "stOSxgP6"}, "rotation": "NONE", "startDate": "1983-11-01T00:00:00Z", "tags": ["MU4CuGGK", "EzY16RVY", "d0V97mqQ"]}' \
    > test.out 2>&1
eval_tap $? 7 'AdminUpdateChallenge' test.out

#- 8 AdminDeleteChallenge
./ng net.accelbyte.sdk.cli.Main challenge adminDeleteChallenge \
    --challengeCode '1yCVF01z' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 8 'AdminDeleteChallenge' test.out

#- 9 AdminGetGoals
./ng net.accelbyte.sdk.cli.Main challenge adminGetGoals \
    --challengeCode 'hLvONLjd' \
    --namespace "$AB_NAMESPACE" \
    --limit '40' \
    --offset '30' \
    --sortBy 'createdAt:desc' \
    --tags 'yQKLkK8C,IipG1Kva,Y8YfL4pX' \
    > test.out 2>&1
eval_tap $? 9 'AdminGetGoals' test.out

#- 10 AdminCreateGoal
./ng net.accelbyte.sdk.cli.Main challenge adminCreateGoal \
    --challengeCode 'S2LuMr4r' \
    --namespace "$AB_NAMESPACE" \
    --body '{"code": "meXYxavk", "description": "44Z3SBgg", "isActive": false, "name": "EdgLWLFV", "requirementGroups": [{"operator": "AND", "predicates": [{"id": "N3LcG3uI", "matcher": "GREATER_THAN_EQUAL", "parameterName": "c9RFujyz", "parameterType": "USERACCOUNT", "statCycleId": "7l97T6o8", "targetValue": 0.5343977766008148}, {"id": "qNzgEuTx", "matcher": "LESS_THAN_EQUAL", "parameterName": "pNzV6x6D", "parameterType": "STATISTIC", "statCycleId": "wtyiiDJy", "targetValue": 0.383238319808767}, {"id": "KlNJhXEU", "matcher": "LESS_THAN_EQUAL", "parameterName": "Q3cMUHVi", "parameterType": "ENTITLEMENT", "statCycleId": "Xw1CGoIB", "targetValue": 0.8130655031325937}]}, {"operator": "AND", "predicates": [{"id": "hDJA2Cuo", "matcher": "LESS_THAN", "parameterName": "iHH1m320", "parameterType": "USERACCOUNT", "statCycleId": "CjVxjBmU", "targetValue": 0.6940133506886985}, {"id": "UmlZXJTg", "matcher": "LESS_THAN", "parameterName": "zhFojhlb", "parameterType": "USERACCOUNT", "statCycleId": "fwMywlKT", "targetValue": 0.8571695255411907}, {"id": "x4NSJ9EN", "matcher": "GREATER_THAN", "parameterName": "m6Vu4wv6", "parameterType": "ACHIEVEMENT", "statCycleId": "q8v8Hdds", "targetValue": 0.9142086910154298}]}, {"operator": "AND", "predicates": [{"id": "5u0vDoFU", "matcher": "GREATER_THAN_EQUAL", "parameterName": "TSVL7mo3", "parameterType": "ACHIEVEMENT", "statCycleId": "Sso1IT8n", "targetValue": 0.06487702112199745}, {"id": "RRCV1A3P", "matcher": "GREATER_THAN", "parameterName": "pRWCJ9gu", "parameterType": "STATISTIC", "statCycleId": "thWS5KCZ", "targetValue": 0.44760451444936067}, {"id": "fMYJht52", "matcher": "GREATER_THAN_EQUAL", "parameterName": "T5VNS1sP", "parameterType": "STATISTIC_CYCLE", "statCycleId": "kbHFMiE0", "targetValue": 0.3847509477431479}]}], "rewards": [{"itemId": "gjzkxGn3", "itemName": "EEyalI9h", "qty": 0.371060113133144, "type": "STATISTIC"}, {"itemId": "QVP8HQEA", "itemName": "Oi05x5TR", "qty": 0.2728582030620059, "type": "ENTITLEMENT"}, {"itemId": "8IvqTtbe", "itemName": "zWzHjc2q", "qty": 0.8541911121046554, "type": "ENTITLEMENT"}], "schedule": {"endTime": "1980-12-13T00:00:00Z", "order": 30, "startTime": "1971-10-02T00:00:00Z"}, "tags": ["LJUxUGfc", "O6VBGdAM", "unrMx2No"]}' \
    > test.out 2>&1
eval_tap $? 10 'AdminCreateGoal' test.out

#- 11 AdminGetGoal
./ng net.accelbyte.sdk.cli.Main challenge adminGetGoal \
    --challengeCode 'KJ4fmdnQ' \
    --code 'js0bD6Zh' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 11 'AdminGetGoal' test.out

#- 12 AdminUpdateGoals
./ng net.accelbyte.sdk.cli.Main challenge adminUpdateGoals \
    --challengeCode 'qVr7hxae' \
    --code 'C2oURvkb' \
    --namespace "$AB_NAMESPACE" \
    --body '{"description": "RKwwro7G", "isActive": false, "name": "jiih1IEf", "requirementGroups": [{"operator": "AND", "predicates": [{"id": "t0QJcYOS", "matcher": "LESS_THAN_EQUAL", "parameterName": "twPYkBfr", "parameterType": "ACHIEVEMENT", "statCycleId": "061gj4PC", "targetValue": 0.1900639999237087}, {"id": "082QicOz", "matcher": "LESS_THAN_EQUAL", "parameterName": "jNspPn7v", "parameterType": "ACHIEVEMENT", "statCycleId": "yCZCnyZf", "targetValue": 0.7103906168631547}, {"id": "L5DBxzJI", "matcher": "LESS_THAN", "parameterName": "t6kI9WzF", "parameterType": "STATISTIC", "statCycleId": "o7RL1Jcu", "targetValue": 0.1619632284791973}]}, {"operator": "AND", "predicates": [{"id": "bEy4DBw7", "matcher": "EQUAL", "parameterName": "YRnA7Xl0", "parameterType": "STATISTIC_CYCLE", "statCycleId": "Ck9KraVZ", "targetValue": 0.12265284344260308}, {"id": "z1NVdhVm", "matcher": "GREATER_THAN", "parameterName": "Xdvx3O8d", "parameterType": "ENTITLEMENT", "statCycleId": "ZWvuT2F3", "targetValue": 0.6719961520204034}, {"id": "GQaVLxd5", "matcher": "LESS_THAN_EQUAL", "parameterName": "l8pbgk82", "parameterType": "STATISTIC", "statCycleId": "d0dL2yD6", "targetValue": 0.5781556046380977}]}, {"operator": "AND", "predicates": [{"id": "6JvgTR8w", "matcher": "LESS_THAN", "parameterName": "CYWtRuQy", "parameterType": "ENTITLEMENT", "statCycleId": "iCFoNm6j", "targetValue": 0.6555160239472648}, {"id": "KKzelVTC", "matcher": "GREATER_THAN_EQUAL", "parameterName": "7FX9CXN1", "parameterType": "ACHIEVEMENT", "statCycleId": "x4YFVqmy", "targetValue": 0.9718310050523611}, {"id": "VCrUIaIi", "matcher": "LESS_THAN", "parameterName": "rlJcB0fJ", "parameterType": "ACHIEVEMENT", "statCycleId": "0iD2070i", "targetValue": 0.21280171651426938}]}], "rewards": [{"itemId": "mCzyAWmy", "itemName": "8Ux4GwwD", "qty": 0.9981094900900714, "type": "ENTITLEMENT"}, {"itemId": "zk4jGkhT", "itemName": "rAINYkfY", "qty": 0.9297789870187676, "type": "STATISTIC"}, {"itemId": "ZangSolh", "itemName": "266kH5Ic", "qty": 0.5647617344700864, "type": "STATISTIC"}], "schedule": {"endTime": "1991-10-24T00:00:00Z", "order": 82, "startTime": "1973-05-29T00:00:00Z"}, "tags": ["dJjvaloC", "cQmcMbfR", "2yTinBVH"]}' \
    > test.out 2>&1
eval_tap $? 12 'AdminUpdateGoals' test.out

#- 13 AdminDeleteGoal
./ng net.accelbyte.sdk.cli.Main challenge adminDeleteGoal \
    --challengeCode '7d2ArJ9n' \
    --code 'mQHERja5' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 13 'AdminDeleteGoal' test.out

#- 14 AdminListSchedulesByGoal
./ng net.accelbyte.sdk.cli.Main challenge adminListSchedulesByGoal \
    --challengeCode '5mmpvW3b' \
    --code 'LSblpjTH' \
    --namespace "$AB_NAMESPACE" \
    --limit '78' \
    --offset '4' \
    --userId 'hEaNoUIo' \
    > test.out 2>&1
eval_tap $? 14 'AdminListSchedulesByGoal' test.out

#- 15 AdminGetPeriods
./ng net.accelbyte.sdk.cli.Main challenge adminGetPeriods \
    --challengeCode 'FesOwCk4' \
    --namespace "$AB_NAMESPACE" \
    --limit '54' \
    --offset '56' \
    > test.out 2>&1
eval_tap $? 15 'AdminGetPeriods' test.out

#- 16 AdminRandomizeChallenge
./ng net.accelbyte.sdk.cli.Main challenge adminRandomizeChallenge \
    --challengeCode '2Ih42rG0' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 16 'AdminRandomizeChallenge' test.out

#- 17 AdminListSchedules
./ng net.accelbyte.sdk.cli.Main challenge adminListSchedules \
    --challengeCode 'tthqRxlj' \
    --namespace "$AB_NAMESPACE" \
    --dateTime '1985-04-23T00:00:00Z' \
    --limit '73' \
    --offset '26' \
    --userId 'p1hDrew6' \
    > test.out 2>&1
eval_tap $? 17 'AdminListSchedules' test.out

#- 18 AdminDeleteTiedChallenge
./ng net.accelbyte.sdk.cli.Main challenge adminDeleteTiedChallenge \
    --challengeCode 'B19t8WQY' \
    --namespace "$AB_NAMESPACE" \
    --safeDelete 'v0fMM3Zl' \
    > test.out 2>&1
eval_tap $? 18 'AdminDeleteTiedChallenge' test.out

#- 19 AdminUpdateTiedChallengeSchedule
./ng net.accelbyte.sdk.cli.Main challenge adminUpdateTiedChallengeSchedule \
    --challengeCode 'r271sxjz' \
    --namespace "$AB_NAMESPACE" \
    --body '{"action": "STOP", "endDate": "1976-04-13T00:00:00Z"}' \
    > test.out 2>&1
eval_tap $? 19 'AdminUpdateTiedChallengeSchedule' test.out

#- 20 AdminGetAssignmentPlugin
./ng net.accelbyte.sdk.cli.Main challenge adminGetAssignmentPlugin \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 20 'AdminGetAssignmentPlugin' test.out

#- 21 AdminUpdateAssignmentPlugin
./ng net.accelbyte.sdk.cli.Main challenge adminUpdateAssignmentPlugin \
    --namespace "$AB_NAMESPACE" \
    --body '{"appName": "EGYREAnL", "extendType": "CUSTOM", "grpcServerAddress": "rJwJprOS"}' \
    > test.out 2>&1
eval_tap $? 21 'AdminUpdateAssignmentPlugin' test.out

#- 22 AdminCreateAssignmentPlugin
./ng net.accelbyte.sdk.cli.Main challenge adminCreateAssignmentPlugin \
    --namespace "$AB_NAMESPACE" \
    --body '{"appName": "PwPr34N5", "extendType": "CUSTOM", "grpcServerAddress": "hhZcssPN"}' \
    > test.out 2>&1
eval_tap $? 22 'AdminCreateAssignmentPlugin' test.out

#- 23 AdminDeleteAssignmentPlugin
./ng net.accelbyte.sdk.cli.Main challenge adminDeleteAssignmentPlugin \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 23 'AdminDeleteAssignmentPlugin' test.out

#- 24 AdminEvaluateProgress
./ng net.accelbyte.sdk.cli.Main challenge adminEvaluateProgress \
    --namespace "$AB_NAMESPACE" \
    --challengeCode '7nj8n3gW,vHO6cbEi,E7MDK8YP' \
    --includeOneTimeEvent 'RNmHBi5b' \
    --body '{"userIds": ["bq1mDDTx", "P0ySWWAR", "P2csvugQ"]}' \
    > test.out 2>&1
eval_tap $? 24 'AdminEvaluateProgress' test.out

#- 25 AdminClaimUsersRewards
./ng net.accelbyte.sdk.cli.Main challenge adminClaimUsersRewards \
    --namespace "$AB_NAMESPACE" \
    --body '[{"rewardIds": ["VdSAgWum", "eHlizr2D", "VPtlhqBV"], "userId": "6TUzWocP"}, {"rewardIds": ["bPILHOl5", "zIHcQ291", "Pt2g5AGM"], "userId": "hbD71uaU"}, {"rewardIds": ["I8IKxSPx", "JumgEeGd", "L8xF6EHp"], "userId": "NEzFV6xF"}]' \
    > test.out 2>&1
eval_tap $? 25 'AdminClaimUsersRewards' test.out

#- 26 AdminClaimUserRewardsByGoalCode
./ng net.accelbyte.sdk.cli.Main challenge adminClaimUserRewardsByGoalCode \
    --challengeCode 'F6CU90KX' \
    --namespace "$AB_NAMESPACE" \
    --userId 'W4bAEY5A' \
    --body '{"goalCode": "2uhSQjLS"}' \
    > test.out 2>&1
eval_tap $? 26 'AdminClaimUserRewardsByGoalCode' test.out

#- 27 AdminGetUserProgression
./ng net.accelbyte.sdk.cli.Main challenge adminGetUserProgression \
    --challengeCode 'pNB6a5WM' \
    --namespace "$AB_NAMESPACE" \
    --userId '71InFn77' \
    --dateTime '1998-09-22T00:00:00Z' \
    --goalCode '2uLXTu6B' \
    --limit '89' \
    --offset '57' \
    --tags 'S4qaHOZO,051EdG6V,q3G9yPZb' \
    > test.out 2>&1
eval_tap $? 27 'AdminGetUserProgression' test.out

#- 28 AdminGetUserRewards
./ng net.accelbyte.sdk.cli.Main challenge adminGetUserRewards \
    --namespace "$AB_NAMESPACE" \
    --userId 'FHXa8Mo2' \
    --challengeCode 'ZytEkvWR' \
    --goalProgressionId 'qsRegpdW' \
    --limit '91' \
    --offset '50' \
    --sortBy 'updatedAt:asc' \
    --status 'CLAIMED' \
    > test.out 2>&1
eval_tap $? 28 'AdminGetUserRewards' test.out

#- 29 AdminClaimUserRewards
./ng net.accelbyte.sdk.cli.Main challenge adminClaimUserRewards \
    --namespace "$AB_NAMESPACE" \
    --userId '23L8Ywvk' \
    --body '{"rewardIDs": ["psTwlfLm", "GAy64t67", "gtDBkFiM"]}' \
    > test.out 2>&1
eval_tap $? 29 'AdminClaimUserRewards' test.out

#- 30 GetChallenges
./ng net.accelbyte.sdk.cli.Main challenge getChallenges \
    --namespace "$AB_NAMESPACE" \
    --keyword 'aaY845jy' \
    --limit '92' \
    --offset '37' \
    --sortBy 'createdAt' \
    --status 'RETIRED' \
    --tags 'moV3nVMk,M5G7wJQR,MIKcLEsI' \
    > test.out 2>&1
eval_tap $? 30 'GetChallenges' test.out

#- 31 PublicGetScheduledGoals
./ng net.accelbyte.sdk.cli.Main challenge publicGetScheduledGoals \
    --challengeCode '9SXc9ERm' \
    --namespace "$AB_NAMESPACE" \
    --limit '10' \
    --offset '53' \
    --sortBy 'createdAt:desc' \
    --tags '8f8Dggiq,9BHsBceb,WHSAcRby' \
    > test.out 2>&1
eval_tap $? 31 'PublicGetScheduledGoals' test.out

#- 32 PublicListSchedulesByGoal
./ng net.accelbyte.sdk.cli.Main challenge publicListSchedulesByGoal \
    --challengeCode 'hbE05hrA' \
    --code 'kB7rzZea' \
    --namespace "$AB_NAMESPACE" \
    --limit '39' \
    --offset '87' \
    > test.out 2>&1
eval_tap $? 32 'PublicListSchedulesByGoal' test.out

#- 33 PublicListSchedules
./ng net.accelbyte.sdk.cli.Main challenge publicListSchedules \
    --challengeCode 'NXRdc7Ii' \
    --namespace "$AB_NAMESPACE" \
    --dateTime '1973-07-05T00:00:00Z' \
    --limit '0' \
    --offset '93' \
    > test.out 2>&1
eval_tap $? 33 'PublicListSchedules' test.out

#- 34 PublicClaimUserRewardsByGoalCode
./ng net.accelbyte.sdk.cli.Main challenge publicClaimUserRewardsByGoalCode \
    --challengeCode '5SAyTwkQ' \
    --namespace "$AB_NAMESPACE" \
    --body '{"goalCode": "naOFttpg"}' \
    > test.out 2>&1
eval_tap $? 34 'PublicClaimUserRewardsByGoalCode' test.out

#- 35 EvaluateMyProgress
./ng net.accelbyte.sdk.cli.Main challenge evaluateMyProgress \
    --namespace "$AB_NAMESPACE" \
    --challengeCode 'gvGQRHeZ,z9js2uvR,kWgxhNVf' \
    --includeOneTimeEvent 'ncFltXrk' \
    > test.out 2>&1
eval_tap $? 35 'EvaluateMyProgress' test.out

#- 36 PublicGetUserProgression
./ng net.accelbyte.sdk.cli.Main challenge publicGetUserProgression \
    --challengeCode 'OGvNvusw' \
    --namespace "$AB_NAMESPACE" \
    --dateTime '1976-04-02T00:00:00Z' \
    --goalCode 'OGQDL4xn' \
    --limit '53' \
    --offset '17' \
    --tags 'ttvnUXRH,ogTwvTBq,ROiirJCU' \
    > test.out 2>&1
eval_tap $? 36 'PublicGetUserProgression' test.out

#- 37 PublicGetPastUserProgression
./ng net.accelbyte.sdk.cli.Main challenge publicGetPastUserProgression \
    --challengeCode 'fffnWIKY' \
    --index '94' \
    --namespace "$AB_NAMESPACE" \
    --goalCode 'EqWpjLOz' \
    --limit '11' \
    --offset '45' \
    --tags 'W8T2q38c,uxV9YhcZ,xCwMcThB' \
    > test.out 2>&1
eval_tap $? 37 'PublicGetPastUserProgression' test.out

#- 38 PublicGetUserRewards
./ng net.accelbyte.sdk.cli.Main challenge publicGetUserRewards \
    --namespace "$AB_NAMESPACE" \
    --challengeCode 'QVwAySuV' \
    --goalProgressionId 'tlk2QXio' \
    --limit '67' \
    --offset '89' \
    --sortBy 'createdAt:asc' \
    --status 'UNCLAIMED' \
    > test.out 2>&1
eval_tap $? 38 'PublicGetUserRewards' test.out

#- 39 PublicClaimUserRewards
./ng net.accelbyte.sdk.cli.Main challenge publicClaimUserRewards \
    --namespace "$AB_NAMESPACE" \
    --body '{"rewardIDs": ["X4HECJKl", "UOhj6VJm", "k4CM0E6c"]}' \
    > test.out 2>&1
eval_tap $? 39 'PublicClaimUserRewards' test.out


rm -f "tmp.dat"

exit $EXIT_CODE