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
    --keyword 'cyMQR6C7' \
    --limit '28' \
    --offset '43' \
    --sortBy 'updatedAt:desc' \
    --status 'RETIRED' \
    --tags 'RwGjdb2m,tToDOUbE,QUegPox5' \
    > test.out 2>&1
eval_tap $? 2 'AdminGetChallenges' test.out

#- 3 AdminCreateChallenge
./ng net.accelbyte.sdk.cli.Main challenge adminCreateChallenge \
    --namespace "$AB_NAMESPACE" \
    --body '{"activeGoalsPerRotation": 99, "assignmentRule": "FIXED", "code": "sBIm2HnQ", "description": "2MtJsm04", "endAfter": 16, "endDate": "1975-06-19T00:00:00Z", "goalsVisibility": "PERIODONLY", "name": "lhpQQQ8g", "randomizedPerRotation": true, "repeatAfter": 43, "resetConfig": {"resetDate": 66, "resetDay": 34, "resetTime": "Q7ZPZcJu"}, "rotation": "MONTHLY", "startDate": "1972-01-18T00:00:00Z", "tags": ["U7Gl3pVx", "lbWrZq3P", "A41I1RpC"]}' \
    > test.out 2>&1
eval_tap $? 3 'AdminCreateChallenge' test.out

#- 4 AdminGetItemReferences
./ng net.accelbyte.sdk.cli.Main challenge adminGetItemReferences \
    --namespace "$AB_NAMESPACE" \
    --itemId 'R5IGcj1Q' \
    > test.out 2>&1
eval_tap $? 4 'AdminGetItemReferences' test.out

#- 5 AdminGetActiveChallenges
./ng net.accelbyte.sdk.cli.Main challenge adminGetActiveChallenges \
    --namespace "$AB_NAMESPACE" \
    --userId 'CGBopAgW' \
    --limit '78' \
    --offset '59' \
    > test.out 2>&1
eval_tap $? 5 'AdminGetActiveChallenges' test.out

#- 6 AdminGetChallenge
./ng net.accelbyte.sdk.cli.Main challenge adminGetChallenge \
    --challengeCode 'owX7S84K' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 6 'AdminGetChallenge' test.out

#- 7 AdminUpdateChallenge
./ng net.accelbyte.sdk.cli.Main challenge adminUpdateChallenge \
    --challengeCode 'Ep6GSf6G' \
    --namespace "$AB_NAMESPACE" \
    --body '{"activeGoalsPerRotation": 51, "assignmentRule": "RANDOMIZED", "description": "fULCYxhT", "endAfter": 38, "endDate": "1976-01-28T00:00:00Z", "goalsVisibility": "PERIODONLY", "name": "ixb7mvts", "randomizedPerRotation": false, "repeatAfter": 52, "resetConfig": {"resetDate": 79, "resetDay": 98, "resetTime": "Y7gMnBkC"}, "rotation": "MONTHLY", "startDate": "1994-08-16T00:00:00Z", "tags": ["OAIqo9On", "89wiwrb0", "Y59ief2s"]}' \
    > test.out 2>&1
eval_tap $? 7 'AdminUpdateChallenge' test.out

#- 8 AdminDeleteChallenge
./ng net.accelbyte.sdk.cli.Main challenge adminDeleteChallenge \
    --challengeCode 'IhNi4QOu' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 8 'AdminDeleteChallenge' test.out

#- 9 AdminGetGoals
./ng net.accelbyte.sdk.cli.Main challenge adminGetGoals \
    --challengeCode 'xUbnnHZt' \
    --namespace "$AB_NAMESPACE" \
    --limit '4' \
    --offset '95' \
    --sortBy 'updatedAt:desc' \
    --tags 'YZe2ugNL,R3py2f5A,bqja0a9a' \
    > test.out 2>&1
eval_tap $? 9 'AdminGetGoals' test.out

#- 10 AdminCreateGoal
./ng net.accelbyte.sdk.cli.Main challenge adminCreateGoal \
    --challengeCode 'OQflYIHN' \
    --namespace "$AB_NAMESPACE" \
    --body '{"code": "J1kMa8Gj", "description": "IzoOxIB9", "isActive": true, "name": "fd8mboag", "requirementGroups": [{"operator": "AND", "predicates": [{"id": "52ayetzo", "matcher": "LESS_THAN_EQUAL", "parameterName": "9ZYA0Tft", "parameterType": "ACHIEVEMENT", "statCycleId": "unLTlMHN", "targetValue": 0.07178500099928087}, {"id": "wl4RyExH", "matcher": "GREATER_THAN_EQUAL", "parameterName": "DXyG8fvl", "parameterType": "USERACCOUNT", "statCycleId": "jJACA5Ml", "targetValue": 0.10818098455748804}, {"id": "8PivwdR0", "matcher": "LESS_THAN_EQUAL", "parameterName": "Snb3J6l8", "parameterType": "ACHIEVEMENT", "statCycleId": "sPj2ZZGE", "targetValue": 0.9100932717940858}]}, {"operator": "AND", "predicates": [{"id": "Qef0l7GA", "matcher": "LESS_THAN_EQUAL", "parameterName": "zLbzkrGk", "parameterType": "ACHIEVEMENT", "statCycleId": "Qa683ZU8", "targetValue": 0.7422752922912563}, {"id": "K4PKDGr5", "matcher": "GREATER_THAN", "parameterName": "kQ7LkS1A", "parameterType": "USERACCOUNT", "statCycleId": "Kk1KHvIx", "targetValue": 0.8071238073628197}, {"id": "EW6BrT1b", "matcher": "EQUAL", "parameterName": "wefWuhwz", "parameterType": "ENTITLEMENT", "statCycleId": "9XQUC0QT", "targetValue": 0.10571357859376596}]}, {"operator": "AND", "predicates": [{"id": "I8FGW2yJ", "matcher": "EQUAL", "parameterName": "HdmusbH9", "parameterType": "STATISTIC_CYCLE", "statCycleId": "AizODDbV", "targetValue": 0.37120969485386546}, {"id": "cJa7U1gL", "matcher": "GREATER_THAN_EQUAL", "parameterName": "II5zxees", "parameterType": "ENTITLEMENT", "statCycleId": "WuSieBjB", "targetValue": 0.5771458146621765}, {"id": "Zb2vSE0s", "matcher": "LESS_THAN", "parameterName": "pub8PHtZ", "parameterType": "STATISTIC", "statCycleId": "pTK32gHo", "targetValue": 0.18354225870066465}]}], "rewards": [{"itemId": "nxy7ac3x", "itemName": "D2Oxd3x7", "qty": 0.3450912786052016, "type": "ENTITLEMENT"}, {"itemId": "yavgrwkv", "itemName": "6vd02EaM", "qty": 0.4197227285961165, "type": "ENTITLEMENT"}, {"itemId": "Umdy76O4", "itemName": "A92QBuTC", "qty": 0.2564787517308975, "type": "STATISTIC"}], "schedule": {"endTime": "1988-12-16T00:00:00Z", "order": 94, "startTime": "1987-05-08T00:00:00Z"}, "tags": ["3XQ02KGa", "d0mgNMA1", "lT6OR3W9"]}' \
    > test.out 2>&1
eval_tap $? 10 'AdminCreateGoal' test.out

#- 11 AdminGetGoal
./ng net.accelbyte.sdk.cli.Main challenge adminGetGoal \
    --challengeCode 'RK1M2fXA' \
    --code 'ARVL6Gzi' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 11 'AdminGetGoal' test.out

#- 12 AdminUpdateGoals
./ng net.accelbyte.sdk.cli.Main challenge adminUpdateGoals \
    --challengeCode 'b5gWVyVh' \
    --code '1zH9zo20' \
    --namespace "$AB_NAMESPACE" \
    --body '{"description": "WT5kVxbS", "isActive": false, "name": "2lemzaCE", "requirementGroups": [{"operator": "AND", "predicates": [{"id": "n3JsW9cn", "matcher": "GREATER_THAN", "parameterName": "TUSCInhl", "parameterType": "ENTITLEMENT", "statCycleId": "bSU8n0zo", "targetValue": 0.6388117172006152}, {"id": "coLU58L0", "matcher": "LESS_THAN_EQUAL", "parameterName": "mlSJIpbk", "parameterType": "ACHIEVEMENT", "statCycleId": "MmiYCylw", "targetValue": 0.1946730179146684}, {"id": "GZhhAzf3", "matcher": "GREATER_THAN_EQUAL", "parameterName": "gJua1Y4B", "parameterType": "ACHIEVEMENT", "statCycleId": "d0VWg1s6", "targetValue": 0.09770627157501777}]}, {"operator": "AND", "predicates": [{"id": "wpIsR0wV", "matcher": "GREATER_THAN", "parameterName": "gpY35mwQ", "parameterType": "ENTITLEMENT", "statCycleId": "B41vKGAj", "targetValue": 0.9395286578408072}, {"id": "cfag3oBF", "matcher": "GREATER_THAN_EQUAL", "parameterName": "NQC1EA6e", "parameterType": "USERACCOUNT", "statCycleId": "r6aKweDP", "targetValue": 0.619964010722381}, {"id": "TiJ6hk0S", "matcher": "EQUAL", "parameterName": "bHG1QhL8", "parameterType": "STATISTIC", "statCycleId": "aQn4z7Bi", "targetValue": 0.810439208227203}]}, {"operator": "AND", "predicates": [{"id": "6HXfeNVS", "matcher": "LESS_THAN_EQUAL", "parameterName": "Zibc5ZEs", "parameterType": "STATISTIC", "statCycleId": "gH96Ba7p", "targetValue": 0.215570252509663}, {"id": "WHQzvATs", "matcher": "LESS_THAN_EQUAL", "parameterName": "pJnqcnv1", "parameterType": "ACHIEVEMENT", "statCycleId": "KGOVU6xR", "targetValue": 0.41114849304497947}, {"id": "NEbBWcb5", "matcher": "GREATER_THAN", "parameterName": "biB4fJMy", "parameterType": "STATISTIC_CYCLE", "statCycleId": "ovTS6rol", "targetValue": 0.26154880468408537}]}], "rewards": [{"itemId": "JC0hzQj5", "itemName": "GJzVduXY", "qty": 0.9290976175528824, "type": "ENTITLEMENT"}, {"itemId": "Y5wQJJl7", "itemName": "QP2uI8Jl", "qty": 0.8734241830087135, "type": "ENTITLEMENT"}, {"itemId": "qwtqcCAB", "itemName": "QhnJc9qQ", "qty": 0.20563116069469134, "type": "STATISTIC"}], "schedule": {"endTime": "1990-05-03T00:00:00Z", "order": 96, "startTime": "1975-03-17T00:00:00Z"}, "tags": ["Xzr1IdAY", "inBac3Eq", "lSNSRSrS"]}' \
    > test.out 2>&1
eval_tap $? 12 'AdminUpdateGoals' test.out

#- 13 AdminDeleteGoal
./ng net.accelbyte.sdk.cli.Main challenge adminDeleteGoal \
    --challengeCode 'Pu9x1vaA' \
    --code 'ggptAQT1' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 13 'AdminDeleteGoal' test.out

#- 14 AdminListSchedulesByGoal
./ng net.accelbyte.sdk.cli.Main challenge adminListSchedulesByGoal \
    --challengeCode '9JSFg9Hx' \
    --code 'x5arHQKv' \
    --namespace "$AB_NAMESPACE" \
    --limit '23' \
    --offset '10' \
    --userId '2Y42yzk2' \
    > test.out 2>&1
eval_tap $? 14 'AdminListSchedulesByGoal' test.out

#- 15 AdminGetPeriods
./ng net.accelbyte.sdk.cli.Main challenge adminGetPeriods \
    --challengeCode '9qiUcGB3' \
    --namespace "$AB_NAMESPACE" \
    --limit '57' \
    --offset '78' \
    > test.out 2>&1
eval_tap $? 15 'AdminGetPeriods' test.out

#- 16 AdminRandomizeChallenge
./ng net.accelbyte.sdk.cli.Main challenge adminRandomizeChallenge \
    --challengeCode '13crf3YE' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 16 'AdminRandomizeChallenge' test.out

#- 17 AdminListSchedules
./ng net.accelbyte.sdk.cli.Main challenge adminListSchedules \
    --challengeCode 'sZCjiLhW' \
    --namespace "$AB_NAMESPACE" \
    --dateTime '1998-04-13T00:00:00Z' \
    --limit '100' \
    --offset '83' \
    --userId 'InceLT0R' \
    > test.out 2>&1
eval_tap $? 17 'AdminListSchedules' test.out

#- 18 AdminDeleteTiedChallenge
./ng net.accelbyte.sdk.cli.Main challenge adminDeleteTiedChallenge \
    --challengeCode '22xHJguo' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 18 'AdminDeleteTiedChallenge' test.out

#- 19 AdminUpdateTiedChallengeSchedule
./ng net.accelbyte.sdk.cli.Main challenge adminUpdateTiedChallengeSchedule \
    --challengeCode 'TETSBBR8' \
    --namespace "$AB_NAMESPACE" \
    --body '{"action": "ACCELERATE", "endDate": "1976-08-21T00:00:00Z"}' \
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
    --body '{"appName": "OcqBJrcS", "extendType": "CUSTOM", "grpcServerAddress": "7YXsbg7X"}' \
    > test.out 2>&1
eval_tap $? 21 'AdminUpdateAssignmentPlugin' test.out

#- 22 AdminCreateAssignmentPlugin
./ng net.accelbyte.sdk.cli.Main challenge adminCreateAssignmentPlugin \
    --namespace "$AB_NAMESPACE" \
    --body '{"appName": "GP3YgSf7", "extendType": "APP", "grpcServerAddress": "Z5TFYqt8"}' \
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
    --challengeCode 'ZVhh5rxa,rARf79jy,n9lHXzhC' \
    --includeOneTimeEvent 'nKAtACHZ' \
    --body '{"userIds": ["oBQQdcqE", "X91HctSV", "aiwBjgEC"]}' \
    > test.out 2>&1
eval_tap $? 24 'AdminEvaluateProgress' test.out

#- 25 AdminClaimUsersRewards
./ng net.accelbyte.sdk.cli.Main challenge adminClaimUsersRewards \
    --namespace "$AB_NAMESPACE" \
    --body '[{"rewardIds": ["ztectEAl", "Rp5cD2T4", "KpNDIaZo"], "userId": "c0isYJ5V"}, {"rewardIds": ["aDe0JPpC", "KriKuNMY", "PR2bBMYd"], "userId": "s4CnU2DH"}, {"rewardIds": ["0YdLDTBC", "v4XEkhut", "u22hCYNL"], "userId": "GRAvRBgJ"}]' \
    > test.out 2>&1
eval_tap $? 25 'AdminClaimUsersRewards' test.out

#- 26 AdminClaimUserRewardsByGoalCode
./ng net.accelbyte.sdk.cli.Main challenge adminClaimUserRewardsByGoalCode \
    --challengeCode '4WLryrby' \
    --namespace "$AB_NAMESPACE" \
    --userId 'Ta9PmXOm' \
    --body '{"goalCode": "j8mu1Jku"}' \
    > test.out 2>&1
eval_tap $? 26 'AdminClaimUserRewardsByGoalCode' test.out

#- 27 AdminGetUserProgression
./ng net.accelbyte.sdk.cli.Main challenge adminGetUserProgression \
    --challengeCode 'qDQE18b5' \
    --namespace "$AB_NAMESPACE" \
    --userId 'WiYdLmAl' \
    --dateTime '1980-08-20T00:00:00Z' \
    --goalCode '03N4wMYr' \
    --limit '77' \
    --offset '43' \
    --tags 'hbCz9zwz,TwER954S,OHlr8X9w' \
    > test.out 2>&1
eval_tap $? 27 'AdminGetUserProgression' test.out

#- 28 AdminGetUserRewards
./ng net.accelbyte.sdk.cli.Main challenge adminGetUserRewards \
    --namespace "$AB_NAMESPACE" \
    --userId 'Nb3Idkjr' \
    --challengeCode '7AKyguj6' \
    --goalProgressionId '3ZgsIHUq' \
    --limit '39' \
    --offset '69' \
    --sortBy 'updatedAt:desc' \
    --status 'CLAIMED' \
    > test.out 2>&1
eval_tap $? 28 'AdminGetUserRewards' test.out

#- 29 AdminClaimUserRewards
./ng net.accelbyte.sdk.cli.Main challenge adminClaimUserRewards \
    --namespace "$AB_NAMESPACE" \
    --userId 'qGfdES2X' \
    --body '{"rewardIDs": ["gQMPD0C4", "E8p5aEJ6", "xRyzKpqD"]}' \
    > test.out 2>&1
eval_tap $? 29 'AdminClaimUserRewards' test.out

#- 30 GetChallenges
./ng net.accelbyte.sdk.cli.Main challenge getChallenges \
    --namespace "$AB_NAMESPACE" \
    --keyword 'wRk2RCtP' \
    --limit '0' \
    --offset '12' \
    --sortBy 'updatedAt:asc' \
    --status 'INIT' \
    --tags 'Vg30ZSSK,pJNtKrb5,lWKg1Llk' \
    > test.out 2>&1
eval_tap $? 30 'GetChallenges' test.out

#- 31 PublicGetScheduledGoals
./ng net.accelbyte.sdk.cli.Main challenge publicGetScheduledGoals \
    --challengeCode 'EZ37Kb7v' \
    --namespace "$AB_NAMESPACE" \
    --limit '51' \
    --offset '27' \
    --sortBy 'updatedAt' \
    --tags 'k0BtjJxQ,Vd1zO8pQ,iWEUNThv' \
    > test.out 2>&1
eval_tap $? 31 'PublicGetScheduledGoals' test.out

#- 32 PublicListSchedulesByGoal
./ng net.accelbyte.sdk.cli.Main challenge publicListSchedulesByGoal \
    --challengeCode 'bqgbzVly' \
    --code 'KPTeLvj0' \
    --namespace "$AB_NAMESPACE" \
    --limit '88' \
    --offset '49' \
    > test.out 2>&1
eval_tap $? 32 'PublicListSchedulesByGoal' test.out

#- 33 PublicListSchedules
./ng net.accelbyte.sdk.cli.Main challenge publicListSchedules \
    --challengeCode 'UAAo7OjM' \
    --namespace "$AB_NAMESPACE" \
    --dateTime '1990-05-10T00:00:00Z' \
    --limit '18' \
    --offset '23' \
    > test.out 2>&1
eval_tap $? 33 'PublicListSchedules' test.out

#- 34 PublicClaimUserRewardsByGoalCode
./ng net.accelbyte.sdk.cli.Main challenge publicClaimUserRewardsByGoalCode \
    --challengeCode 'oq58dh1E' \
    --namespace "$AB_NAMESPACE" \
    --body '{"goalCode": "MohGI81t"}' \
    > test.out 2>&1
eval_tap $? 34 'PublicClaimUserRewardsByGoalCode' test.out

#- 35 EvaluateMyProgress
./ng net.accelbyte.sdk.cli.Main challenge evaluateMyProgress \
    --namespace "$AB_NAMESPACE" \
    --challengeCode 'Qj1I5vkT,pja3rk1u,L6dUQSV0' \
    --includeOneTimeEvent 'TJqzHRBp' \
    > test.out 2>&1
eval_tap $? 35 'EvaluateMyProgress' test.out

#- 36 PublicGetUserProgression
./ng net.accelbyte.sdk.cli.Main challenge publicGetUserProgression \
    --challengeCode '4I15HbTW' \
    --namespace "$AB_NAMESPACE" \
    --dateTime '1984-01-13T00:00:00Z' \
    --goalCode 'rlAvVM7E' \
    --limit '83' \
    --offset '42' \
    --tags 'ObBWFAUo,nkptAqal,zyN7Z2ck' \
    > test.out 2>&1
eval_tap $? 36 'PublicGetUserProgression' test.out

#- 37 PublicGetPastUserProgression
./ng net.accelbyte.sdk.cli.Main challenge publicGetPastUserProgression \
    --challengeCode 'Twz0L2av' \
    --index '94' \
    --namespace "$AB_NAMESPACE" \
    --goalCode 'Q2CbAoO8' \
    --limit '47' \
    --offset '84' \
    --tags 'iRHefwBu,AN7ngxWk,PXYOkDjL' \
    > test.out 2>&1
eval_tap $? 37 'PublicGetPastUserProgression' test.out

#- 38 PublicGetUserRewards
./ng net.accelbyte.sdk.cli.Main challenge publicGetUserRewards \
    --namespace "$AB_NAMESPACE" \
    --challengeCode 'tbDdUIfY' \
    --goalProgressionId '28sZpcW0' \
    --limit '80' \
    --offset '56' \
    --sortBy 'createdAt:desc' \
    --status 'UNCLAIMED' \
    > test.out 2>&1
eval_tap $? 38 'PublicGetUserRewards' test.out

#- 39 PublicClaimUserRewards
./ng net.accelbyte.sdk.cli.Main challenge publicClaimUserRewards \
    --namespace "$AB_NAMESPACE" \
    --body '{"rewardIDs": ["g5CkkkXZ", "6aG209Fm", "brDRb7kP"]}' \
    > test.out 2>&1
eval_tap $? 39 'PublicClaimUserRewards' test.out


rm -f "tmp.dat"

exit $EXIT_CODE