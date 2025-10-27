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
    --keyword 'VGnTailt' \
    --limit '82' \
    --offset '3' \
    --sortBy 'updatedAt:desc' \
    --status 'RETIRED' \
    --tags '5hI2ct19,Du2TVMz1,uAUWqYLz' \
    > test.out 2>&1
eval_tap $? 2 'AdminGetChallenges' test.out

#- 3 AdminCreateChallenge
./ng net.accelbyte.sdk.cli.Main challenge adminCreateChallenge \
    --namespace "$AB_NAMESPACE" \
    --body '{"activeGoalsPerRotation": 81, "assignmentRule": "FIXED", "code": "FnfawV0x", "description": "nGPqRIqY", "endAfter": 92, "endDate": "1978-04-15T00:00:00Z", "goalsVisibility": "SHOWALL", "name": "qYmOO7oj", "randomizedPerRotation": true, "repeatAfter": 11, "resetConfig": {"resetDate": 93, "resetDay": 17, "resetTime": "p70jreIx"}, "rotation": "WEEKLY", "startDate": "1993-10-03T00:00:00Z", "tags": ["gx8xoWon", "Gc1QDbFO", "FXJD6jTd"]}' \
    > test.out 2>&1
eval_tap $? 3 'AdminCreateChallenge' test.out

#- 4 AdminGetItemReferences
./ng net.accelbyte.sdk.cli.Main challenge adminGetItemReferences \
    --namespace "$AB_NAMESPACE" \
    --itemId 'ZasEfc4c' \
    > test.out 2>&1
eval_tap $? 4 'AdminGetItemReferences' test.out

#- 5 AdminGetActiveChallenges
./ng net.accelbyte.sdk.cli.Main challenge adminGetActiveChallenges \
    --namespace "$AB_NAMESPACE" \
    --userId 'bjROHXAr' \
    --limit '68' \
    --offset '9' \
    > test.out 2>&1
eval_tap $? 5 'AdminGetActiveChallenges' test.out

#- 6 AdminGetChallenge
./ng net.accelbyte.sdk.cli.Main challenge adminGetChallenge \
    --challengeCode 'DBUWHCJF' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 6 'AdminGetChallenge' test.out

#- 7 AdminUpdateChallenge
./ng net.accelbyte.sdk.cli.Main challenge adminUpdateChallenge \
    --challengeCode 'i5hLlVHC' \
    --namespace "$AB_NAMESPACE" \
    --body '{"activeGoalsPerRotation": 30, "assignmentRule": "RANDOMIZED", "description": "lUeUHr31", "endAfter": 35, "endDate": "1978-09-24T00:00:00Z", "goalsVisibility": "PERIODONLY", "name": "YfjWkNJx", "randomizedPerRotation": false, "repeatAfter": 37, "resetConfig": {"resetDate": 84, "resetDay": 53, "resetTime": "0hArgIDH"}, "rotation": "MONTHLY", "startDate": "1994-05-07T00:00:00Z", "tags": ["N5FfPzUt", "T2eWUnWY", "6zXO8nvx"]}' \
    > test.out 2>&1
eval_tap $? 7 'AdminUpdateChallenge' test.out

#- 8 AdminDeleteChallenge
./ng net.accelbyte.sdk.cli.Main challenge adminDeleteChallenge \
    --challengeCode 'bwfnNQzh' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 8 'AdminDeleteChallenge' test.out

#- 9 AdminGetGoals
./ng net.accelbyte.sdk.cli.Main challenge adminGetGoals \
    --challengeCode 'wePgs1VD' \
    --namespace "$AB_NAMESPACE" \
    --limit '80' \
    --offset '12' \
    --sortBy 'updatedAt:desc' \
    --tags 'KelQpQHO,NQl3SR1d,ZWKXjFyx' \
    > test.out 2>&1
eval_tap $? 9 'AdminGetGoals' test.out

#- 10 AdminCreateGoal
./ng net.accelbyte.sdk.cli.Main challenge adminCreateGoal \
    --challengeCode 'ZO40V0XP' \
    --namespace "$AB_NAMESPACE" \
    --body '{"code": "AuZ2mPPX", "description": "aYZa5Ppc", "isActive": false, "name": "87OZoyV1", "requirementGroups": [{"operator": "AND", "predicates": [{"matcher": "LESS_THAN", "parameterName": "nR8yQXRc", "parameterType": "STATISTIC", "statCycleId": "QeJDDYKQ", "targetValue": 0.14758940964465217}, {"matcher": "LESS_THAN_EQUAL", "parameterName": "7xz7rSIV", "parameterType": "STATISTIC_CYCLE", "statCycleId": "EatWhqc1", "targetValue": 0.6309619072682698}, {"matcher": "GREATER_THAN", "parameterName": "EoSdD9mE", "parameterType": "ENTITLEMENT", "statCycleId": "oue6W1S6", "targetValue": 0.04932187097706786}]}, {"operator": "AND", "predicates": [{"matcher": "LESS_THAN_EQUAL", "parameterName": "Y9zoNJD5", "parameterType": "USERACCOUNT", "statCycleId": "tavkkihg", "targetValue": 0.5885718589997383}, {"matcher": "LESS_THAN", "parameterName": "9GlSe7b1", "parameterType": "ACHIEVEMENT", "statCycleId": "lsqJYeCd", "targetValue": 0.3954619103179289}, {"matcher": "LESS_THAN", "parameterName": "AfsFydGl", "parameterType": "STATISTIC", "statCycleId": "MWcpJC0p", "targetValue": 0.41537982969944687}]}, {"operator": "AND", "predicates": [{"matcher": "EQUAL", "parameterName": "61AVACFR", "parameterType": "USERACCOUNT", "statCycleId": "ReF1Bety", "targetValue": 0.17448283013985588}, {"matcher": "EQUAL", "parameterName": "q4UZtZTW", "parameterType": "USERACCOUNT", "statCycleId": "PwokP79l", "targetValue": 0.8619456975170618}, {"matcher": "LESS_THAN_EQUAL", "parameterName": "vR4DRlIw", "parameterType": "ENTITLEMENT", "statCycleId": "IIt4s0Gb", "targetValue": 0.29467038283707814}]}], "rewards": [{"itemId": "Y56LZxKp", "itemName": "7bkCF5pJ", "qty": 0.2006664629827184, "type": "ENTITLEMENT"}, {"itemId": "1rLKVfrn", "itemName": "sHyvqMX3", "qty": 0.5444264703846737, "type": "ENTITLEMENT"}, {"itemId": "z7uiNbMZ", "itemName": "Ty46wQOW", "qty": 0.903304013046058, "type": "ENTITLEMENT"}], "schedule": {"endTime": "1997-05-15T00:00:00Z", "order": 33, "startTime": "1976-09-15T00:00:00Z"}, "tags": ["rqW1x7vf", "Hp7vw4Mk", "DXARfJRS"]}' \
    > test.out 2>&1
eval_tap $? 10 'AdminCreateGoal' test.out

#- 11 AdminGetGoal
./ng net.accelbyte.sdk.cli.Main challenge adminGetGoal \
    --challengeCode 'uPSy7ZvP' \
    --code 'YjJwNQaU' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 11 'AdminGetGoal' test.out

#- 12 AdminUpdateGoals
./ng net.accelbyte.sdk.cli.Main challenge adminUpdateGoals \
    --challengeCode 'JaWSjhmk' \
    --code 'ntvjTMAw' \
    --namespace "$AB_NAMESPACE" \
    --body '{"description": "N64vM4h1", "isActive": true, "name": "Xgq6t4H7", "requirementGroups": [{"operator": "AND", "predicates": [{"matcher": "EQUAL", "parameterName": "nyOW242k", "parameterType": "STATISTIC", "statCycleId": "SU81BM0z", "targetValue": 0.5157121290755406}, {"matcher": "EQUAL", "parameterName": "AnbwGfNE", "parameterType": "ENTITLEMENT", "statCycleId": "eEYcxuvo", "targetValue": 0.3517081384664623}, {"matcher": "GREATER_THAN_EQUAL", "parameterName": "EPlprpvg", "parameterType": "STATISTIC", "statCycleId": "jZWhxIyt", "targetValue": 0.46773977288915747}]}, {"operator": "AND", "predicates": [{"matcher": "LESS_THAN", "parameterName": "Fcr3GEsA", "parameterType": "STATISTIC", "statCycleId": "I6Rq3iIK", "targetValue": 0.7230899031716435}, {"matcher": "LESS_THAN_EQUAL", "parameterName": "SAiimgo4", "parameterType": "ACHIEVEMENT", "statCycleId": "Haws8XPU", "targetValue": 0.8101116012635196}, {"matcher": "GREATER_THAN_EQUAL", "parameterName": "xZGjU28M", "parameterType": "USERACCOUNT", "statCycleId": "fvWft07v", "targetValue": 0.33408518780514807}]}, {"operator": "AND", "predicates": [{"matcher": "GREATER_THAN_EQUAL", "parameterName": "pM2UgYx3", "parameterType": "STATISTIC", "statCycleId": "47hjIwdc", "targetValue": 0.4891071568516182}, {"matcher": "LESS_THAN", "parameterName": "8cD2bT60", "parameterType": "STATISTIC", "statCycleId": "lYGKJg47", "targetValue": 0.8957930761958611}, {"matcher": "GREATER_THAN_EQUAL", "parameterName": "kehV1zZB", "parameterType": "ENTITLEMENT", "statCycleId": "pJlvA79L", "targetValue": 0.42273896526845334}]}], "rewards": [{"itemId": "4v0y0SgF", "itemName": "Kw7fC8xG", "qty": 0.5828982856012526, "type": "STATISTIC"}, {"itemId": "ByGneCbn", "itemName": "IKBMHqDi", "qty": 0.8477162433086246, "type": "ENTITLEMENT"}, {"itemId": "0kp35ay9", "itemName": "M4yQWFea", "qty": 0.25995788893086746, "type": "STATISTIC"}], "schedule": {"endTime": "1978-09-18T00:00:00Z", "order": 47, "startTime": "1975-09-05T00:00:00Z"}, "tags": ["uDOg2TnH", "X70FTCAV", "vnYuDgf6"]}' \
    > test.out 2>&1
eval_tap $? 12 'AdminUpdateGoals' test.out

#- 13 AdminDeleteGoal
./ng net.accelbyte.sdk.cli.Main challenge adminDeleteGoal \
    --challengeCode 'ozRrycyI' \
    --code 'woX2O5J7' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 13 'AdminDeleteGoal' test.out

#- 14 AdminListSchedulesByGoal
./ng net.accelbyte.sdk.cli.Main challenge adminListSchedulesByGoal \
    --challengeCode 'Bw3cGiwk' \
    --code 'wwqtg4Ew' \
    --namespace "$AB_NAMESPACE" \
    --limit '77' \
    --offset '64' \
    --userId 'geAiMMWZ' \
    > test.out 2>&1
eval_tap $? 14 'AdminListSchedulesByGoal' test.out

#- 15 AdminGetPeriods
./ng net.accelbyte.sdk.cli.Main challenge adminGetPeriods \
    --challengeCode 'h0UUCjRB' \
    --namespace "$AB_NAMESPACE" \
    --limit '5' \
    --offset '60' \
    > test.out 2>&1
eval_tap $? 15 'AdminGetPeriods' test.out

#- 16 AdminRandomizeChallenge
./ng net.accelbyte.sdk.cli.Main challenge adminRandomizeChallenge \
    --challengeCode 'KmObO2tJ' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 16 'AdminRandomizeChallenge' test.out

#- 17 AdminListSchedules
./ng net.accelbyte.sdk.cli.Main challenge adminListSchedules \
    --challengeCode 'i9ZRxR5C' \
    --namespace "$AB_NAMESPACE" \
    --dateTime '1989-03-05T00:00:00Z' \
    --limit '8' \
    --offset '33' \
    --userId 'MAq1nByK' \
    > test.out 2>&1
eval_tap $? 17 'AdminListSchedules' test.out

#- 18 AdminDeleteTiedChallenge
./ng net.accelbyte.sdk.cli.Main challenge adminDeleteTiedChallenge \
    --challengeCode 'O1XWYlC2' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 18 'AdminDeleteTiedChallenge' test.out

#- 19 AdminUpdateTiedChallengeSchedule
./ng net.accelbyte.sdk.cli.Main challenge adminUpdateTiedChallengeSchedule \
    --challengeCode 'UPTley5S' \
    --namespace "$AB_NAMESPACE" \
    --body '{"action": "ACCELERATE", "endDate": "1996-02-05T00:00:00Z"}' \
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
    --body '{"appName": "0UH9JKNj", "extendType": "CUSTOM", "grpcServerAddress": "E8cAwZZd"}' \
    > test.out 2>&1
eval_tap $? 21 'AdminUpdateAssignmentPlugin' test.out

#- 22 AdminCreateAssignmentPlugin
./ng net.accelbyte.sdk.cli.Main challenge adminCreateAssignmentPlugin \
    --namespace "$AB_NAMESPACE" \
    --body '{"appName": "JI9jBdDE", "extendType": "CUSTOM", "grpcServerAddress": "HketuuKO"}' \
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
    --challengeCode 'ht86sbtR,Tq7YNlnX,fbW0RTp5' \
    --body '{"userIds": ["7osDX39D", "uMosv6Fz", "QTgx9IvL"]}' \
    > test.out 2>&1
eval_tap $? 24 'AdminEvaluateProgress' test.out

#- 25 AdminClaimUsersRewards
./ng net.accelbyte.sdk.cli.Main challenge adminClaimUsersRewards \
    --namespace "$AB_NAMESPACE" \
    --body '[{"rewardIds": ["tfUtIQQq", "6vEyssjc", "KWNxumxd"], "userId": "UUQ8h788"}, {"rewardIds": ["ciuFVsBN", "vuhUnbYX", "3qeVkqIR"], "userId": "ZqR2fmvX"}, {"rewardIds": ["yJKoGtwP", "aHJdEuBI", "gTWpiRDF"], "userId": "GvG0yo9N"}]' \
    > test.out 2>&1
eval_tap $? 25 'AdminClaimUsersRewards' test.out

#- 26 AdminClaimUserRewardsByGoalCode
./ng net.accelbyte.sdk.cli.Main challenge adminClaimUserRewardsByGoalCode \
    --challengeCode 'pfigI13E' \
    --namespace "$AB_NAMESPACE" \
    --userId 'QgE6APwC' \
    --body '{"goalCode": "iMywri2Q"}' \
    > test.out 2>&1
eval_tap $? 26 'AdminClaimUserRewardsByGoalCode' test.out

#- 27 AdminGetUserProgression
./ng net.accelbyte.sdk.cli.Main challenge adminGetUserProgression \
    --challengeCode '7MvJTMNQ' \
    --namespace "$AB_NAMESPACE" \
    --userId 'ZOul8jRx' \
    --dateTime '1979-06-25T00:00:00Z' \
    --goalCode 'G6qnoaiL' \
    --limit '44' \
    --offset '76' \
    --tags 'GkBls9Bs,Rt0wzR9h,Hu1c7tJL' \
    > test.out 2>&1
eval_tap $? 27 'AdminGetUserProgression' test.out

#- 28 AdminGetUserRewards
./ng net.accelbyte.sdk.cli.Main challenge adminGetUserRewards \
    --namespace "$AB_NAMESPACE" \
    --userId 'M0sjZIpW' \
    --challengeCode 'pZeWeZeT' \
    --goalProgressionId 'd5aeSIW9' \
    --limit '6' \
    --offset '96' \
    --sortBy 'createdAt' \
    --status 'CLAIMED' \
    > test.out 2>&1
eval_tap $? 28 'AdminGetUserRewards' test.out

#- 29 AdminClaimUserRewards
./ng net.accelbyte.sdk.cli.Main challenge adminClaimUserRewards \
    --namespace "$AB_NAMESPACE" \
    --userId 'ztO9mP21' \
    --body '{"rewardIDs": ["aTEt6Dql", "gTAoDbXZ", "0sXcIXZ9"]}' \
    > test.out 2>&1
eval_tap $? 29 'AdminClaimUserRewards' test.out

#- 30 GetChallenges
./ng net.accelbyte.sdk.cli.Main challenge getChallenges \
    --namespace "$AB_NAMESPACE" \
    --keyword '2vdYBKCc' \
    --limit '6' \
    --offset '74' \
    --sortBy 'updatedAt:asc' \
    --status 'INIT' \
    --tags 'nGYShrNI,zndX7way,ThgQX4Ek' \
    > test.out 2>&1
eval_tap $? 30 'GetChallenges' test.out

#- 31 PublicGetScheduledGoals
./ng net.accelbyte.sdk.cli.Main challenge publicGetScheduledGoals \
    --challengeCode '1LwBeAJ9' \
    --namespace "$AB_NAMESPACE" \
    --limit '48' \
    --offset '30' \
    --sortBy 'updatedAt' \
    --tags 'd0yElmXN,50v2Td4O,XcMhm87x' \
    > test.out 2>&1
eval_tap $? 31 'PublicGetScheduledGoals' test.out

#- 32 PublicListSchedulesByGoal
./ng net.accelbyte.sdk.cli.Main challenge publicListSchedulesByGoal \
    --challengeCode 'l4JqPur1' \
    --code '2JDRItPt' \
    --namespace "$AB_NAMESPACE" \
    --limit '11' \
    --offset '5' \
    > test.out 2>&1
eval_tap $? 32 'PublicListSchedulesByGoal' test.out

#- 33 PublicListSchedules
./ng net.accelbyte.sdk.cli.Main challenge publicListSchedules \
    --challengeCode 'l0BbcpqX' \
    --namespace "$AB_NAMESPACE" \
    --dateTime '1994-04-01T00:00:00Z' \
    --limit '24' \
    --offset '92' \
    > test.out 2>&1
eval_tap $? 33 'PublicListSchedules' test.out

#- 34 PublicClaimUserRewardsByGoalCode
./ng net.accelbyte.sdk.cli.Main challenge publicClaimUserRewardsByGoalCode \
    --challengeCode 'qX968QOM' \
    --namespace "$AB_NAMESPACE" \
    --body '{"goalCode": "3PK1lcyi"}' \
    > test.out 2>&1
eval_tap $? 34 'PublicClaimUserRewardsByGoalCode' test.out

#- 35 EvaluateMyProgress
./ng net.accelbyte.sdk.cli.Main challenge evaluateMyProgress \
    --namespace "$AB_NAMESPACE" \
    --challengeCode 'ysHKZv62,zlPbTaoK,ipTvx0Ao' \
    > test.out 2>&1
eval_tap $? 35 'EvaluateMyProgress' test.out

#- 36 PublicGetUserProgression
./ng net.accelbyte.sdk.cli.Main challenge publicGetUserProgression \
    --challengeCode 'lFlrvI2r' \
    --namespace "$AB_NAMESPACE" \
    --dateTime '1981-12-17T00:00:00Z' \
    --goalCode 'rKu6tTEJ' \
    --limit '79' \
    --offset '41' \
    --tags 'Z6VELEtP,KRJHI9dM,bACHJh8q' \
    > test.out 2>&1
eval_tap $? 36 'PublicGetUserProgression' test.out

#- 37 PublicGetPastUserProgression
./ng net.accelbyte.sdk.cli.Main challenge publicGetPastUserProgression \
    --challengeCode '4nt53AaO' \
    --index '28' \
    --namespace "$AB_NAMESPACE" \
    --goalCode 'tdIeoq5S' \
    --limit '27' \
    --offset '23' \
    --tags '5eyPCiBN,ZVj9kkkT,IDsQzLjW' \
    > test.out 2>&1
eval_tap $? 37 'PublicGetPastUserProgression' test.out

#- 38 PublicGetUserRewards
./ng net.accelbyte.sdk.cli.Main challenge publicGetUserRewards \
    --namespace "$AB_NAMESPACE" \
    --challengeCode 'SWqZMC7O' \
    --goalProgressionId 'cCsYAQxD' \
    --limit '86' \
    --offset '75' \
    --sortBy 'updatedAt:desc' \
    --status 'CLAIMED' \
    > test.out 2>&1
eval_tap $? 38 'PublicGetUserRewards' test.out

#- 39 PublicClaimUserRewards
./ng net.accelbyte.sdk.cli.Main challenge publicClaimUserRewards \
    --namespace "$AB_NAMESPACE" \
    --body '{"rewardIDs": ["g0hp6D0y", "3LLTNXPa", "JGITWLAD"]}' \
    > test.out 2>&1
eval_tap $? 39 'PublicClaimUserRewards' test.out


rm -f "tmp.dat"

exit $EXIT_CODE