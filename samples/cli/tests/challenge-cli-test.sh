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
    --keyword 'Rf0JOIM9' \
    --limit '18' \
    --offset '83' \
    --sortBy 'updatedAt' \
    --status 'TIED' \
    --tags 'sudl0xLQ,REFD6plj,q45exztM' \
    > test.out 2>&1
eval_tap $? 2 'AdminGetChallenges' test.out

#- 3 AdminCreateChallenge
./ng net.accelbyte.sdk.cli.Main challenge adminCreateChallenge \
    --namespace "$AB_NAMESPACE" \
    --body '{"activeGoalsPerRotation": 3, "assignmentRule": "RANDOMIZED", "code": "g6lcfiea", "description": "Bm3CgDZl", "endAfter": 33, "endDate": "1991-04-03T00:00:00Z", "goalsVisibility": "SHOWALL", "name": "66SYfAnc", "randomizedPerRotation": false, "repeatAfter": 95, "resetConfig": {"resetDate": 31, "resetDay": 3, "resetTime": "L9pfZLDn"}, "rotation": "NONE", "startDate": "1999-05-29T00:00:00Z", "tags": ["lR61Yu3d", "eSqW7lf2", "yw1W41xe"]}' \
    > test.out 2>&1
eval_tap $? 3 'AdminCreateChallenge' test.out

#- 4 AdminGetItemReferences
./ng net.accelbyte.sdk.cli.Main challenge adminGetItemReferences \
    --namespace "$AB_NAMESPACE" \
    --itemId 'ksqHpHTK' \
    > test.out 2>&1
eval_tap $? 4 'AdminGetItemReferences' test.out

#- 5 AdminGetActiveChallenges
./ng net.accelbyte.sdk.cli.Main challenge adminGetActiveChallenges \
    --namespace "$AB_NAMESPACE" \
    --userId '7N6Agcit' \
    --limit '32' \
    --offset '60' \
    > test.out 2>&1
eval_tap $? 5 'AdminGetActiveChallenges' test.out

#- 6 AdminGetChallenge
./ng net.accelbyte.sdk.cli.Main challenge adminGetChallenge \
    --challengeCode 'tUrtgWFC' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 6 'AdminGetChallenge' test.out

#- 7 AdminUpdateChallenge
./ng net.accelbyte.sdk.cli.Main challenge adminUpdateChallenge \
    --challengeCode 'rZBCel89' \
    --namespace "$AB_NAMESPACE" \
    --body '{"activeGoalsPerRotation": 16, "assignmentRule": "CUSTOM", "description": "AspAKrMU", "endAfter": 26, "endDate": "1990-08-18T00:00:00Z", "goalsVisibility": "PERIODONLY", "name": "zEeCIPiY", "randomizedPerRotation": false, "repeatAfter": 35, "resetConfig": {"resetDate": 76, "resetDay": 79, "resetTime": "KtB5CQui"}, "rotation": "MONTHLY", "startDate": "1988-08-28T00:00:00Z", "tags": ["XfW9Ohh1", "u9zVqABl", "TwNSNq1g"]}' \
    > test.out 2>&1
eval_tap $? 7 'AdminUpdateChallenge' test.out

#- 8 AdminDeleteChallenge
./ng net.accelbyte.sdk.cli.Main challenge adminDeleteChallenge \
    --challengeCode 'bsWUbrCL' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 8 'AdminDeleteChallenge' test.out

#- 9 AdminGetGoals
./ng net.accelbyte.sdk.cli.Main challenge adminGetGoals \
    --challengeCode 'YrU4acTY' \
    --namespace "$AB_NAMESPACE" \
    --limit '27' \
    --offset '29' \
    --sortBy 'updatedAt:asc' \
    --tags 'x3Sy4cBh,ThzJFQSB,tB9u1QAg' \
    > test.out 2>&1
eval_tap $? 9 'AdminGetGoals' test.out

#- 10 AdminCreateGoal
./ng net.accelbyte.sdk.cli.Main challenge adminCreateGoal \
    --challengeCode '75xdPYGV' \
    --namespace "$AB_NAMESPACE" \
    --body '{"code": "KlgSA16z", "description": "uWdFYzrW", "isActive": false, "name": "elKp78Vz", "requirementGroups": [{"operator": "AND", "predicates": [{"matcher": "LESS_THAN_EQUAL", "parameterName": "dNsGc7JU", "parameterType": "USERACCOUNT", "statCycleId": "pR4yGlIZ", "targetValue": 0.19573855264730788}, {"matcher": "GREATER_THAN", "parameterName": "eaOv3rNj", "parameterType": "USERACCOUNT", "statCycleId": "4rJekrhs", "targetValue": 0.5366810365150192}, {"matcher": "LESS_THAN_EQUAL", "parameterName": "AXQxVJUW", "parameterType": "STATISTIC_CYCLE", "statCycleId": "N2ACJjFQ", "targetValue": 0.26115624429859574}]}, {"operator": "AND", "predicates": [{"matcher": "GREATER_THAN_EQUAL", "parameterName": "XtcHsoCC", "parameterType": "ACHIEVEMENT", "statCycleId": "Nvu4vovr", "targetValue": 0.5028822326822039}, {"matcher": "GREATER_THAN_EQUAL", "parameterName": "4BqVHQ1N", "parameterType": "ENTITLEMENT", "statCycleId": "DuvcEC5z", "targetValue": 0.4065525467357991}, {"matcher": "LESS_THAN", "parameterName": "ZzB8HsUp", "parameterType": "USERACCOUNT", "statCycleId": "NKZmHZtm", "targetValue": 0.7838461250778359}]}, {"operator": "AND", "predicates": [{"matcher": "LESS_THAN", "parameterName": "6wzS2DHA", "parameterType": "STATISTIC", "statCycleId": "qagTEbg0", "targetValue": 0.9128363012036168}, {"matcher": "LESS_THAN_EQUAL", "parameterName": "dU2lMxA4", "parameterType": "USERACCOUNT", "statCycleId": "aBbIXLJQ", "targetValue": 0.024391730468612205}, {"matcher": "GREATER_THAN_EQUAL", "parameterName": "OYO2nahc", "parameterType": "ENTITLEMENT", "statCycleId": "NWy6lNrh", "targetValue": 0.4108112846033447}]}], "rewards": [{"itemId": "giP2Llw8", "itemName": "E3TpM9BH", "qty": 0.7647843377439147, "type": "STATISTIC"}, {"itemId": "B5dQti6f", "itemName": "FDfgIc55", "qty": 0.7952749102635678, "type": "STATISTIC"}, {"itemId": "YvJXYzFY", "itemName": "zHLlr9W8", "qty": 0.18280152004444483, "type": "ENTITLEMENT"}], "schedule": {"endTime": "1993-06-29T00:00:00Z", "order": 92, "startTime": "1972-02-29T00:00:00Z"}, "tags": ["PIYqpDMh", "ZX6QY6vj", "jiWOHISC"]}' \
    > test.out 2>&1
eval_tap $? 10 'AdminCreateGoal' test.out

#- 11 AdminGetGoal
./ng net.accelbyte.sdk.cli.Main challenge adminGetGoal \
    --challengeCode 'LzkkzBlQ' \
    --code '4a8TfAtd' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 11 'AdminGetGoal' test.out

#- 12 AdminUpdateGoals
./ng net.accelbyte.sdk.cli.Main challenge adminUpdateGoals \
    --challengeCode 'O9k7TSs1' \
    --code 'F0zbb7iX' \
    --namespace "$AB_NAMESPACE" \
    --body '{"description": "Iia8AUYo", "isActive": true, "name": "rSV8rk1Q", "requirementGroups": [{"operator": "AND", "predicates": [{"matcher": "LESS_THAN", "parameterName": "rHd6ryOd", "parameterType": "ACHIEVEMENT", "statCycleId": "ncYGkqKt", "targetValue": 0.004920571371989757}, {"matcher": "GREATER_THAN", "parameterName": "w1KGz1dI", "parameterType": "STATISTIC", "statCycleId": "oLeGnMMx", "targetValue": 0.17849411462027331}, {"matcher": "LESS_THAN", "parameterName": "muj4P6VH", "parameterType": "STATISTIC", "statCycleId": "JIE2oO3N", "targetValue": 0.7565547894318336}]}, {"operator": "AND", "predicates": [{"matcher": "EQUAL", "parameterName": "ZNiPsM2J", "parameterType": "STATISTIC", "statCycleId": "pKwHjg3M", "targetValue": 0.6647491908073013}, {"matcher": "LESS_THAN_EQUAL", "parameterName": "38tqmznM", "parameterType": "USERACCOUNT", "statCycleId": "JeduDGij", "targetValue": 0.9830759551823073}, {"matcher": "LESS_THAN", "parameterName": "z3m3X6Zl", "parameterType": "STATISTIC_CYCLE", "statCycleId": "5JmitRS0", "targetValue": 0.6197965811841339}]}, {"operator": "AND", "predicates": [{"matcher": "LESS_THAN_EQUAL", "parameterName": "QzY2LKL3", "parameterType": "ENTITLEMENT", "statCycleId": "CcVuCmvS", "targetValue": 0.9880593582142668}, {"matcher": "LESS_THAN_EQUAL", "parameterName": "lcn6c51Q", "parameterType": "ACHIEVEMENT", "statCycleId": "zFcPF5cj", "targetValue": 0.40508782200075144}, {"matcher": "LESS_THAN", "parameterName": "CHB8JOME", "parameterType": "ENTITLEMENT", "statCycleId": "pW7ua55t", "targetValue": 0.8380695188759095}]}], "rewards": [{"itemId": "9tjzDgu1", "itemName": "4tTvp7UV", "qty": 0.37084531586307357, "type": "STATISTIC"}, {"itemId": "rP4R7l9o", "itemName": "nE8AvEet", "qty": 0.6534900743063696, "type": "STATISTIC"}, {"itemId": "26QH7J2E", "itemName": "0kMHHvMS", "qty": 0.3735140674130204, "type": "STATISTIC"}], "schedule": {"endTime": "1988-05-20T00:00:00Z", "order": 49, "startTime": "1978-06-23T00:00:00Z"}, "tags": ["FVzW18Tc", "5mJbJznU", "JBiOo9Si"]}' \
    > test.out 2>&1
eval_tap $? 12 'AdminUpdateGoals' test.out

#- 13 AdminDeleteGoal
./ng net.accelbyte.sdk.cli.Main challenge adminDeleteGoal \
    --challengeCode 'K1sgQJxf' \
    --code 'H8myRgWX' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 13 'AdminDeleteGoal' test.out

#- 14 AdminListSchedulesByGoal
./ng net.accelbyte.sdk.cli.Main challenge adminListSchedulesByGoal \
    --challengeCode 'HIukLpvp' \
    --code 'YZ6fkitv' \
    --namespace "$AB_NAMESPACE" \
    --limit '43' \
    --offset '95' \
    --userId 'Uno4n7V0' \
    > test.out 2>&1
eval_tap $? 14 'AdminListSchedulesByGoal' test.out

#- 15 AdminGetPeriods
./ng net.accelbyte.sdk.cli.Main challenge adminGetPeriods \
    --challengeCode 'idokvbCq' \
    --namespace "$AB_NAMESPACE" \
    --limit '16' \
    --offset '23' \
    > test.out 2>&1
eval_tap $? 15 'AdminGetPeriods' test.out

#- 16 AdminRandomizeChallenge
./ng net.accelbyte.sdk.cli.Main challenge adminRandomizeChallenge \
    --challengeCode 'tTdaLWjY' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 16 'AdminRandomizeChallenge' test.out

#- 17 AdminListSchedules
./ng net.accelbyte.sdk.cli.Main challenge adminListSchedules \
    --challengeCode 'O1QV1OmZ' \
    --namespace "$AB_NAMESPACE" \
    --dateTime '1986-06-19T00:00:00Z' \
    --limit '70' \
    --offset '7' \
    --userId 'TZGchbsU' \
    > test.out 2>&1
eval_tap $? 17 'AdminListSchedules' test.out

#- 18 AdminDeleteTiedChallenge
./ng net.accelbyte.sdk.cli.Main challenge adminDeleteTiedChallenge \
    --challengeCode 'kZ3gwrSr' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 18 'AdminDeleteTiedChallenge' test.out

#- 19 AdminUpdateTiedChallengeSchedule
./ng net.accelbyte.sdk.cli.Main challenge adminUpdateTiedChallengeSchedule \
    --challengeCode 'jHhydPL3' \
    --namespace "$AB_NAMESPACE" \
    --body '{"action": "STOP", "endDate": "1999-12-18T00:00:00Z"}' \
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
    --body '{"appName": "EFIWyszU", "extendType": "APP", "grpcServerAddress": "El7a3nqR"}' \
    > test.out 2>&1
eval_tap $? 21 'AdminUpdateAssignmentPlugin' test.out

#- 22 AdminCreateAssignmentPlugin
./ng net.accelbyte.sdk.cli.Main challenge adminCreateAssignmentPlugin \
    --namespace "$AB_NAMESPACE" \
    --body '{"appName": "4ICndVOU", "extendType": "CUSTOM", "grpcServerAddress": "lq2i5Cdb"}' \
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
    --body '{"userIds": ["JHrilfyP", "Eze6kvH7", "DFjjMbdU"]}' \
    > test.out 2>&1
eval_tap $? 24 'AdminEvaluateProgress' test.out

#- 25 AdminClaimUsersRewards
./ng net.accelbyte.sdk.cli.Main challenge adminClaimUsersRewards \
    --namespace "$AB_NAMESPACE" \
    --body '[{"rewardIds": ["qL37U1K5", "nV8BxwHT", "l2xuU5hC"], "userId": "gBi9BtJ9"}, {"rewardIds": ["XQsKqS2p", "09mer5ZA", "mTmogQWr"], "userId": "pr6cdUyN"}, {"rewardIds": ["M0JsaA5K", "28R9rhmA", "SAVT1hbs"], "userId": "lCiB4NW3"}]' \
    > test.out 2>&1
eval_tap $? 25 'AdminClaimUsersRewards' test.out

#- 26 AdminClaimUserRewardsByGoalCode
./ng net.accelbyte.sdk.cli.Main challenge adminClaimUserRewardsByGoalCode \
    --challengeCode 'RYASnvPH' \
    --namespace "$AB_NAMESPACE" \
    --userId 'NemDF5oL' \
    --body '{"goalCode": "7QpAY2d1"}' \
    > test.out 2>&1
eval_tap $? 26 'AdminClaimUserRewardsByGoalCode' test.out

#- 27 AdminGetUserProgression
./ng net.accelbyte.sdk.cli.Main challenge adminGetUserProgression \
    --challengeCode '1J1p0gS8' \
    --namespace "$AB_NAMESPACE" \
    --userId 'dUvQKMfU' \
    --dateTime '1978-02-23T00:00:00Z' \
    --goalCode 'CpoE4a1i' \
    --limit '37' \
    --offset '91' \
    --tags '0BuwO8Id,ONeZKkdE,T00Z8zXR' \
    > test.out 2>&1
eval_tap $? 27 'AdminGetUserProgression' test.out

#- 28 AdminGetUserRewards
./ng net.accelbyte.sdk.cli.Main challenge adminGetUserRewards \
    --namespace "$AB_NAMESPACE" \
    --userId 'FR0QHoG2' \
    --challengeCode '3lS6vL5W' \
    --goalProgressionId '4uDp4Hf1' \
    --limit '68' \
    --offset '16' \
    --sortBy 'updatedAt:asc' \
    --status 'UNCLAIMED' \
    > test.out 2>&1
eval_tap $? 28 'AdminGetUserRewards' test.out

#- 29 AdminClaimUserRewards
./ng net.accelbyte.sdk.cli.Main challenge adminClaimUserRewards \
    --namespace "$AB_NAMESPACE" \
    --userId 'ylNk77Gv' \
    --body '{"rewardIDs": ["E4rodwkg", "zrdzWVoz", "MJMiEdak"]}' \
    > test.out 2>&1
eval_tap $? 29 'AdminClaimUserRewards' test.out

#- 30 GetChallenges
./ng net.accelbyte.sdk.cli.Main challenge getChallenges \
    --namespace "$AB_NAMESPACE" \
    --keyword 'oUdPzfto' \
    --limit '80' \
    --offset '38' \
    --sortBy 'updatedAt:desc' \
    --status 'TIED' \
    --tags 'gY9GzpCQ,nv0n6cCu,zuszSwKq' \
    > test.out 2>&1
eval_tap $? 30 'GetChallenges' test.out

#- 31 PublicGetScheduledGoals
./ng net.accelbyte.sdk.cli.Main challenge publicGetScheduledGoals \
    --challengeCode '2Ugjt9Bf' \
    --namespace "$AB_NAMESPACE" \
    --limit '2' \
    --offset '29' \
    --sortBy 'createdAt:desc' \
    --tags 'qvxrbP55,rtevwJwL,77disXTu' \
    > test.out 2>&1
eval_tap $? 31 'PublicGetScheduledGoals' test.out

#- 32 PublicListSchedulesByGoal
./ng net.accelbyte.sdk.cli.Main challenge publicListSchedulesByGoal \
    --challengeCode 'kUA8z3qO' \
    --code '9DV7yvbJ' \
    --namespace "$AB_NAMESPACE" \
    --limit '15' \
    --offset '38' \
    > test.out 2>&1
eval_tap $? 32 'PublicListSchedulesByGoal' test.out

#- 33 PublicListSchedules
./ng net.accelbyte.sdk.cli.Main challenge publicListSchedules \
    --challengeCode 'EE1GdziT' \
    --namespace "$AB_NAMESPACE" \
    --dateTime '1979-12-25T00:00:00Z' \
    --limit '66' \
    --offset '62' \
    > test.out 2>&1
eval_tap $? 33 'PublicListSchedules' test.out

#- 34 PublicClaimUserRewardsByGoalCode
./ng net.accelbyte.sdk.cli.Main challenge publicClaimUserRewardsByGoalCode \
    --challengeCode 'h4JhM4GH' \
    --namespace "$AB_NAMESPACE" \
    --body '{"goalCode": "WRya89Wy"}' \
    > test.out 2>&1
eval_tap $? 34 'PublicClaimUserRewardsByGoalCode' test.out

#- 35 EvaluateMyProgress
./ng net.accelbyte.sdk.cli.Main challenge evaluateMyProgress \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 35 'EvaluateMyProgress' test.out

#- 36 PublicGetUserProgression
./ng net.accelbyte.sdk.cli.Main challenge publicGetUserProgression \
    --challengeCode '1urM0xKk' \
    --namespace "$AB_NAMESPACE" \
    --dateTime '1975-12-20T00:00:00Z' \
    --goalCode 'hq9TY2L4' \
    --limit '65' \
    --offset '70' \
    --tags 'BLtHq1Ov,zGfGetiu,qrk6yj9T' \
    > test.out 2>&1
eval_tap $? 36 'PublicGetUserProgression' test.out

#- 37 PublicGetPastUserProgression
./ng net.accelbyte.sdk.cli.Main challenge publicGetPastUserProgression \
    --challengeCode 'GLl46NUn' \
    --index '50' \
    --namespace "$AB_NAMESPACE" \
    --goalCode 'lJUuiVW3' \
    --limit '23' \
    --offset '32' \
    --tags 'RKP7FmIa,WxBc0t59,AXZyCaiM' \
    > test.out 2>&1
eval_tap $? 37 'PublicGetPastUserProgression' test.out

#- 38 PublicGetUserRewards
./ng net.accelbyte.sdk.cli.Main challenge publicGetUserRewards \
    --namespace "$AB_NAMESPACE" \
    --challengeCode 'rmZvCqNO' \
    --goalProgressionId 'rBQzGJIA' \
    --limit '22' \
    --offset '23' \
    --sortBy 'updatedAt:desc' \
    --status 'CLAIMED' \
    > test.out 2>&1
eval_tap $? 38 'PublicGetUserRewards' test.out

#- 39 PublicClaimUserRewards
./ng net.accelbyte.sdk.cli.Main challenge publicClaimUserRewards \
    --namespace "$AB_NAMESPACE" \
    --body '{"rewardIDs": ["E4iSQy1g", "Tw5UGnlp", "fMlMswyt"]}' \
    > test.out 2>&1
eval_tap $? 39 'PublicClaimUserRewards' test.out


rm -f "tmp.dat"

exit $EXIT_CODE