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
echo "1..34"

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
    --limit '65' \
    --offset '64' \
    --sortBy '7OSepD7a' \
    --status 'TIED' \
    > test.out 2>&1
eval_tap $? 2 'AdminGetChallenges' test.out

#- 3 AdminCreateChallenge
./ng net.accelbyte.sdk.cli.Main challenge adminCreateChallenge \
    --namespace "$AB_NAMESPACE" \
    --body '{"activeGoalsPerRotation": 10, "assignmentRule": "UNSCHEDULED", "code": "kvn4k4Q1", "description": "t5UBqaox", "endAfter": 12, "endDate": "1985-11-02T00:00:00Z", "goalsVisibility": "SHOWALL", "name": "2dBSgWar", "randomizedPerRotation": false, "repeatAfter": 83, "resetConfig": {"resetDate": 46, "resetDay": 51, "resetTime": "FLcVzY0V"}, "rotation": "MONTHLY", "startDate": "1997-07-05T00:00:00Z"}' \
    > test.out 2>&1
eval_tap $? 3 'AdminCreateChallenge' test.out

#- 4 AdminGetActiveChallenges
./ng net.accelbyte.sdk.cli.Main challenge adminGetActiveChallenges \
    --namespace "$AB_NAMESPACE" \
    --userId 'TCN5J8jW' \
    --limit '48' \
    --offset '3' \
    > test.out 2>&1
eval_tap $? 4 'AdminGetActiveChallenges' test.out

#- 5 AdminGetChallenge
./ng net.accelbyte.sdk.cli.Main challenge adminGetChallenge \
    --challengeCode 'mt6qtRdJ' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 5 'AdminGetChallenge' test.out

#- 6 AdminUpdateChallenge
./ng net.accelbyte.sdk.cli.Main challenge adminUpdateChallenge \
    --challengeCode 'RNmOcBjo' \
    --namespace "$AB_NAMESPACE" \
    --body '{"activeGoalsPerRotation": 48, "assignmentRule": "FIXED", "description": "L1LOQdNR", "endAfter": 42, "endDate": "1988-01-09T00:00:00Z", "goalsVisibility": "PERIODONLY", "name": "8Tx1Th0m", "randomizedPerRotation": true, "repeatAfter": 32, "resetConfig": {"resetDate": 35, "resetDay": 95, "resetTime": "q8CA0Mdl"}, "rotation": "MONTHLY", "startDate": "1982-11-03T00:00:00Z"}' \
    > test.out 2>&1
eval_tap $? 6 'AdminUpdateChallenge' test.out

#- 7 AdminDeleteChallenge
./ng net.accelbyte.sdk.cli.Main challenge adminDeleteChallenge \
    --challengeCode 'COfGXxyK' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 7 'AdminDeleteChallenge' test.out

#- 8 AdminGetGoals
./ng net.accelbyte.sdk.cli.Main challenge adminGetGoals \
    --challengeCode 'ThOdEM7T' \
    --namespace "$AB_NAMESPACE" \
    --limit '33' \
    --offset '99' \
    --sortBy 'jTwRnpeq' \
    > test.out 2>&1
eval_tap $? 8 'AdminGetGoals' test.out

#- 9 AdminCreateGoal
./ng net.accelbyte.sdk.cli.Main challenge adminCreateGoal \
    --challengeCode 'oJ6xzc6P' \
    --namespace "$AB_NAMESPACE" \
    --body '{"code": "04Yo0oqv", "description": "4Ki3vthI", "isActive": false, "name": "HVHXwdb6", "requirementGroups": [{"operator": "AND", "predicates": [{"matcher": "GREATER_THAN", "parameterName": "IKiAKzYJ", "parameterType": "USERACCOUNT", "statCycleId": "XVSxkRKX", "targetValue": 0.221339291380785}, {"matcher": "LESS_THAN", "parameterName": "9p6Hz9mh", "parameterType": "STATISTIC_CYCLE", "statCycleId": "GX0PQtSP", "targetValue": 0.8577408814914744}, {"matcher": "GREATER_THAN_EQUAL", "parameterName": "M2MeDM4Y", "parameterType": "ENTITLEMENT", "statCycleId": "sNLYoayP", "targetValue": 0.33404151036065177}]}, {"operator": "AND", "predicates": [{"matcher": "GREATER_THAN_EQUAL", "parameterName": "BqpzDs58", "parameterType": "ACHIEVEMENT", "statCycleId": "fNVxgkP7", "targetValue": 0.9496062880385328}, {"matcher": "GREATER_THAN_EQUAL", "parameterName": "kHLq5fk7", "parameterType": "ENTITLEMENT", "statCycleId": "OgFTWeSg", "targetValue": 0.2417566435006544}, {"matcher": "GREATER_THAN_EQUAL", "parameterName": "2Yc0ttDU", "parameterType": "STATISTIC_CYCLE", "statCycleId": "OsvWyCzM", "targetValue": 0.7767132116191134}]}, {"operator": "AND", "predicates": [{"matcher": "GREATER_THAN_EQUAL", "parameterName": "y9nj6old", "parameterType": "STATISTIC_CYCLE", "statCycleId": "JWjpkDWg", "targetValue": 0.6335618149331855}, {"matcher": "LESS_THAN", "parameterName": "BQhSfGFQ", "parameterType": "STATISTIC_CYCLE", "statCycleId": "j0V7Pine", "targetValue": 0.5915610800218162}, {"matcher": "LESS_THAN_EQUAL", "parameterName": "xp16HEXr", "parameterType": "USERACCOUNT", "statCycleId": "iht7odLw", "targetValue": 0.02436130189557384}]}], "rewards": [{"itemId": "ZsSPa3H4", "itemName": "Zj7Bd35l", "qty": 0.6689109505627269, "type": "ENTITLEMENT"}, {"itemId": "RdbVgbSW", "itemName": "K8S9oVPf", "qty": 0.13083737627576875, "type": "ENTITLEMENT"}, {"itemId": "tQTtqKWb", "itemName": "DrpKjVRG", "qty": 0.5241589049139282, "type": "STATISTIC"}], "schedule": {"endTime": "1972-10-09T00:00:00Z", "order": 38, "startTime": "1978-03-12T00:00:00Z"}, "tags": ["9JJzIIDh", "3bRpNHBj", "1WB50iRh"]}' \
    > test.out 2>&1
eval_tap $? 9 'AdminCreateGoal' test.out

#- 10 AdminGetGoal
./ng net.accelbyte.sdk.cli.Main challenge adminGetGoal \
    --challengeCode 'y2QMASA3' \
    --code 'hkPbgotB' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 10 'AdminGetGoal' test.out

#- 11 AdminUpdateGoals
./ng net.accelbyte.sdk.cli.Main challenge adminUpdateGoals \
    --challengeCode 'qLilIlOK' \
    --code 'iJgvj9Lb' \
    --namespace "$AB_NAMESPACE" \
    --body '{"description": "GVgIyJnp", "isActive": false, "name": "Mb5aoNAC", "requirementGroups": [{"operator": "AND", "predicates": [{"matcher": "GREATER_THAN", "parameterName": "0n3b0sWY", "parameterType": "STATISTIC_CYCLE", "statCycleId": "Rn4e1HbI", "targetValue": 0.8960719952962327}, {"matcher": "GREATER_THAN", "parameterName": "bn5zPpEK", "parameterType": "ENTITLEMENT", "statCycleId": "qvPHs7pO", "targetValue": 0.3151738485219021}, {"matcher": "GREATER_THAN_EQUAL", "parameterName": "Uiz8HSCw", "parameterType": "STATISTIC", "statCycleId": "8TCpC6vz", "targetValue": 0.9505750964254779}]}, {"operator": "AND", "predicates": [{"matcher": "GREATER_THAN_EQUAL", "parameterName": "Nwmb5HTv", "parameterType": "STATISTIC", "statCycleId": "yZocpTYK", "targetValue": 0.7772270133780578}, {"matcher": "EQUAL", "parameterName": "M7bZFobQ", "parameterType": "STATISTIC_CYCLE", "statCycleId": "4duVLVBU", "targetValue": 0.9734779493427058}, {"matcher": "LESS_THAN_EQUAL", "parameterName": "JFmKLNcx", "parameterType": "STATISTIC", "statCycleId": "YB8b3D0M", "targetValue": 0.050076185666909856}]}, {"operator": "AND", "predicates": [{"matcher": "LESS_THAN_EQUAL", "parameterName": "3howqgSg", "parameterType": "USERACCOUNT", "statCycleId": "OuNsSLmz", "targetValue": 0.36205706140563587}, {"matcher": "GREATER_THAN_EQUAL", "parameterName": "FnE3Oi6c", "parameterType": "ENTITLEMENT", "statCycleId": "03OclIaJ", "targetValue": 0.9240907060490147}, {"matcher": "EQUAL", "parameterName": "bRb4ZfUJ", "parameterType": "ENTITLEMENT", "statCycleId": "2FH7BajT", "targetValue": 0.9275652841097544}]}], "rewards": [{"itemId": "30qwl9NA", "itemName": "xov7RI31", "qty": 0.9677577726602845, "type": "ENTITLEMENT"}, {"itemId": "OTNlm1T9", "itemName": "VNj7nR9i", "qty": 0.675257832602648, "type": "ENTITLEMENT"}, {"itemId": "WXLKB0Hi", "itemName": "owP3uOn6", "qty": 0.29965894859661146, "type": "STATISTIC"}], "schedule": {"endTime": "1995-01-15T00:00:00Z", "order": 99, "startTime": "1983-04-01T00:00:00Z"}, "tags": ["X5Py75X6", "d5AD1FDU", "RWLIAtex"]}' \
    > test.out 2>&1
eval_tap $? 11 'AdminUpdateGoals' test.out

#- 12 AdminDeleteGoal
./ng net.accelbyte.sdk.cli.Main challenge adminDeleteGoal \
    --challengeCode 'STXTgBXI' \
    --code 'aMsW3Sox' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 12 'AdminDeleteGoal' test.out

#- 13 AdminGetPeriods
./ng net.accelbyte.sdk.cli.Main challenge adminGetPeriods \
    --challengeCode 'vCWKfgg0' \
    --namespace "$AB_NAMESPACE" \
    --limit '69' \
    --offset '54' \
    > test.out 2>&1
eval_tap $? 13 'AdminGetPeriods' test.out

#- 14 AdminRandomizeChallenge
./ng net.accelbyte.sdk.cli.Main challenge adminRandomizeChallenge \
    --challengeCode '7vWzUpFF' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 14 'AdminRandomizeChallenge' test.out

#- 15 AdminDeleteTiedChallenge
./ng net.accelbyte.sdk.cli.Main challenge adminDeleteTiedChallenge \
    --challengeCode '90e1wVi2' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 15 'AdminDeleteTiedChallenge' test.out

#- 16 AdminUpdateTiedChallengeSchedule
./ng net.accelbyte.sdk.cli.Main challenge adminUpdateTiedChallengeSchedule \
    --challengeCode '47qbnMlt' \
    --namespace "$AB_NAMESPACE" \
    --body '{"action": "STOP", "endDate": "1987-05-23T00:00:00Z"}' \
    > test.out 2>&1
eval_tap $? 16 'AdminUpdateTiedChallengeSchedule' test.out

#- 17 AdminGetAssignmentPlugin
./ng net.accelbyte.sdk.cli.Main challenge adminGetAssignmentPlugin \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 17 'AdminGetAssignmentPlugin' test.out

#- 18 AdminUpdateAssignmentPlugin
./ng net.accelbyte.sdk.cli.Main challenge adminUpdateAssignmentPlugin \
    --namespace "$AB_NAMESPACE" \
    --body '{"appName": "w6Glhol0", "extendType": "CUSTOM", "grpcServerAddress": "grofJCJo"}' \
    > test.out 2>&1
eval_tap $? 18 'AdminUpdateAssignmentPlugin' test.out

#- 19 AdminCreateAssignmentPlugin
./ng net.accelbyte.sdk.cli.Main challenge adminCreateAssignmentPlugin \
    --namespace "$AB_NAMESPACE" \
    --body '{"appName": "EswlPS1t", "extendType": "CUSTOM", "grpcServerAddress": "SrxoHh38"}' \
    > test.out 2>&1
eval_tap $? 19 'AdminCreateAssignmentPlugin' test.out

#- 20 AdminDeleteAssignmentPlugin
./ng net.accelbyte.sdk.cli.Main challenge adminDeleteAssignmentPlugin \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 20 'AdminDeleteAssignmentPlugin' test.out

#- 21 AdminEvaluateProgress
./ng net.accelbyte.sdk.cli.Main challenge adminEvaluateProgress \
    --namespace "$AB_NAMESPACE" \
    --body '{"userIds": ["EnpT4LNN", "vTYmZBan", "pYWU3Yhl"]}' \
    > test.out 2>&1
eval_tap $? 21 'AdminEvaluateProgress' test.out

#- 22 AdminClaimUsersRewards
./ng net.accelbyte.sdk.cli.Main challenge adminClaimUsersRewards \
    --namespace "$AB_NAMESPACE" \
    --body '[{"rewardIds": ["dHEKopwT", "AqXKt8uH", "qtKuGJwE"], "userId": "7gtC63OG"}, {"rewardIds": ["UYr6vlPx", "IxJjgHdi", "dnNcSgip"], "userId": "3TtLZAQs"}, {"rewardIds": ["etPs3jay", "8G5TWAwg", "6tYdxxBO"], "userId": "Gy7P81N9"}]' \
    > test.out 2>&1
eval_tap $? 22 'AdminClaimUsersRewards' test.out

#- 23 AdminClaimUserRewardsByGoalCode
./ng net.accelbyte.sdk.cli.Main challenge adminClaimUserRewardsByGoalCode \
    --challengeCode 'cbFmpL9t' \
    --namespace "$AB_NAMESPACE" \
    --userId 'FTxRBrKT' \
    --body '{"goalCode": "2qwMC6pC"}' \
    > test.out 2>&1
eval_tap $? 23 'AdminClaimUserRewardsByGoalCode' test.out

#- 24 AdminGetUserProgression
./ng net.accelbyte.sdk.cli.Main challenge adminGetUserProgression \
    --challengeCode 'Fanby2tA' \
    --namespace "$AB_NAMESPACE" \
    --userId 'L0kjV7wk' \
    --dateTime '1974-04-11T00:00:00Z' \
    --goalCode '2ZgY5zFy' \
    --limit '10' \
    --offset '71' \
    --tags 'wSwUEZWZ,BvpKnain,qw1CBA3Q' \
    > test.out 2>&1
eval_tap $? 24 'AdminGetUserProgression' test.out

#- 25 AdminGetUserRewards
./ng net.accelbyte.sdk.cli.Main challenge adminGetUserRewards \
    --namespace "$AB_NAMESPACE" \
    --userId '4LDVlneW' \
    --limit '84' \
    --offset '11' \
    --sortBy 'T6yUptUB' \
    --status 'UNCLAIMED' \
    > test.out 2>&1
eval_tap $? 25 'AdminGetUserRewards' test.out

#- 26 AdminClaimUserRewards
./ng net.accelbyte.sdk.cli.Main challenge adminClaimUserRewards \
    --namespace "$AB_NAMESPACE" \
    --userId 'D3xyiiSX' \
    --body '{"rewardIDs": ["QXYYPw9q", "Vj7NOVbN", "HOS5Pegy"]}' \
    > test.out 2>&1
eval_tap $? 26 'AdminClaimUserRewards' test.out

#- 27 GetChallenges
./ng net.accelbyte.sdk.cli.Main challenge getChallenges \
    --namespace "$AB_NAMESPACE" \
    --limit '9' \
    --offset '46' \
    --sortBy 'cPtySrnJ' \
    --status 'RETIRED' \
    > test.out 2>&1
eval_tap $? 27 'GetChallenges' test.out

#- 28 PublicGetScheduledGoals
./ng net.accelbyte.sdk.cli.Main challenge publicGetScheduledGoals \
    --challengeCode 'XZHtSBVE' \
    --namespace "$AB_NAMESPACE" \
    --limit '10' \
    --offset '43' \
    --tags 'sV2yzPiU,ztpmcSQQ,GiUKRSMd' \
    > test.out 2>&1
eval_tap $? 28 'PublicGetScheduledGoals' test.out

#- 29 PublicClaimUserRewardsByGoalCode
./ng net.accelbyte.sdk.cli.Main challenge publicClaimUserRewardsByGoalCode \
    --challengeCode 'NFgMQRMC' \
    --namespace "$AB_NAMESPACE" \
    --body '{"goalCode": "hHlF5ila"}' \
    > test.out 2>&1
eval_tap $? 29 'PublicClaimUserRewardsByGoalCode' test.out

#- 30 EvaluateMyProgress
./ng net.accelbyte.sdk.cli.Main challenge evaluateMyProgress \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 30 'EvaluateMyProgress' test.out

#- 31 PublicGetUserProgression
./ng net.accelbyte.sdk.cli.Main challenge publicGetUserProgression \
    --challengeCode 'CFJWxo5g' \
    --namespace "$AB_NAMESPACE" \
    --dateTime '1976-07-19T00:00:00Z' \
    --goalCode 'GzjNIcJM' \
    --limit '32' \
    --offset '48' \
    --tags 'b1GRMbTx,qTLaIz3Y,VQoLPspA' \
    > test.out 2>&1
eval_tap $? 31 'PublicGetUserProgression' test.out

#- 32 PublicGetPastUserProgression
./ng net.accelbyte.sdk.cli.Main challenge publicGetPastUserProgression \
    --challengeCode 'gdTsoPMF' \
    --index '64' \
    --namespace "$AB_NAMESPACE" \
    --goalCode 'vpLfYVwl' \
    --limit '21' \
    --offset '21' \
    --tags 'ckxki68Z,YBRSq1hy,UigvpTi2' \
    > test.out 2>&1
eval_tap $? 32 'PublicGetPastUserProgression' test.out

#- 33 PublicGetUserRewards
./ng net.accelbyte.sdk.cli.Main challenge publicGetUserRewards \
    --namespace "$AB_NAMESPACE" \
    --limit '60' \
    --offset '19' \
    --sortBy 'aRM9j0IK' \
    --status 'UNCLAIMED' \
    > test.out 2>&1
eval_tap $? 33 'PublicGetUserRewards' test.out

#- 34 PublicClaimUserRewards
./ng net.accelbyte.sdk.cli.Main challenge publicClaimUserRewards \
    --namespace "$AB_NAMESPACE" \
    --body '{"rewardIDs": ["46UUV7y5", "mwpEvrIC", "r2gPAN1T"]}' \
    > test.out 2>&1
eval_tap $? 34 'PublicClaimUserRewards' test.out


rm -f "tmp.dat"

exit $EXIT_CODE