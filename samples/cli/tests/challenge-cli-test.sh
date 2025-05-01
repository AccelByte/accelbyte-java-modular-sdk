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
    --keyword 'ZB1utTnk' \
    --limit '88' \
    --offset '28' \
    --sortBy 'createdAt:asc' \
    --status 'INIT' \
    --tags 'VZ5b8QWP,giZmW9KW,lWkEHkYI' \
    > test.out 2>&1
eval_tap $? 2 'AdminGetChallenges' test.out

#- 3 AdminCreateChallenge
./ng net.accelbyte.sdk.cli.Main challenge adminCreateChallenge \
    --namespace "$AB_NAMESPACE" \
    --body '{"activeGoalsPerRotation": 40, "assignmentRule": "CUSTOM", "code": "NDzdGAp7", "description": "f5WFn8CQ", "endAfter": 76, "endDate": "1980-06-05T00:00:00Z", "goalsVisibility": "SHOWALL", "name": "w0yJcf4C", "randomizedPerRotation": false, "repeatAfter": 3, "resetConfig": {"resetDate": 93, "resetDay": 19, "resetTime": "wgmeD0OJ"}, "rotation": "MONTHLY", "startDate": "1977-07-30T00:00:00Z", "tags": ["vVlUGhDO", "mAm1ec0O", "MbVa3e7I"]}' \
    > test.out 2>&1
eval_tap $? 3 'AdminCreateChallenge' test.out

#- 4 AdminGetItemReferences
./ng net.accelbyte.sdk.cli.Main challenge adminGetItemReferences \
    --namespace "$AB_NAMESPACE" \
    --itemId 's7JrWjqh' \
    > test.out 2>&1
eval_tap $? 4 'AdminGetItemReferences' test.out

#- 5 AdminGetActiveChallenges
./ng net.accelbyte.sdk.cli.Main challenge adminGetActiveChallenges \
    --namespace "$AB_NAMESPACE" \
    --userId 'tnfj717W' \
    --limit '65' \
    --offset '83' \
    > test.out 2>&1
eval_tap $? 5 'AdminGetActiveChallenges' test.out

#- 6 AdminGetChallenge
./ng net.accelbyte.sdk.cli.Main challenge adminGetChallenge \
    --challengeCode 'HwGVJpvU' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 6 'AdminGetChallenge' test.out

#- 7 AdminUpdateChallenge
./ng net.accelbyte.sdk.cli.Main challenge adminUpdateChallenge \
    --challengeCode 'u6iyj6Fp' \
    --namespace "$AB_NAMESPACE" \
    --body '{"activeGoalsPerRotation": 33, "assignmentRule": "CUSTOM", "description": "ILPrgsEy", "endAfter": 80, "endDate": "1980-05-08T00:00:00Z", "goalsVisibility": "PERIODONLY", "name": "9bq0SEik", "randomizedPerRotation": true, "repeatAfter": 64, "resetConfig": {"resetDate": 22, "resetDay": 29, "resetTime": "ShRAleEm"}, "rotation": "NONE", "startDate": "1990-05-07T00:00:00Z", "tags": ["vvskenKk", "KeCuUg7O", "741Qiqmp"]}' \
    > test.out 2>&1
eval_tap $? 7 'AdminUpdateChallenge' test.out

#- 8 AdminDeleteChallenge
./ng net.accelbyte.sdk.cli.Main challenge adminDeleteChallenge \
    --challengeCode 'eh01ef6z' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 8 'AdminDeleteChallenge' test.out

#- 9 AdminGetGoals
./ng net.accelbyte.sdk.cli.Main challenge adminGetGoals \
    --challengeCode 'B2dSwzzp' \
    --namespace "$AB_NAMESPACE" \
    --limit '4' \
    --offset '65' \
    --sortBy 'updatedAt:desc' \
    --tags 'CMxCpHtM,BtjUBq1z,p18ZC40u' \
    > test.out 2>&1
eval_tap $? 9 'AdminGetGoals' test.out

#- 10 AdminCreateGoal
./ng net.accelbyte.sdk.cli.Main challenge adminCreateGoal \
    --challengeCode 'llXuPUeq' \
    --namespace "$AB_NAMESPACE" \
    --body '{"code": "0VzZGGfw", "description": "EK7BZnWK", "isActive": false, "name": "QgC0e0IK", "requirementGroups": [{"operator": "AND", "predicates": [{"matcher": "GREATER_THAN", "parameterName": "LU0SoxsU", "parameterType": "STATISTIC", "statCycleId": "rPe8UYeA", "targetValue": 0.7093187403655272}, {"matcher": "GREATER_THAN", "parameterName": "kJ3Iobwb", "parameterType": "STATISTIC", "statCycleId": "C7WQnreB", "targetValue": 0.227201640735613}, {"matcher": "GREATER_THAN", "parameterName": "TuFedBNN", "parameterType": "ENTITLEMENT", "statCycleId": "n0goJ9P7", "targetValue": 0.8413608275271265}]}, {"operator": "AND", "predicates": [{"matcher": "GREATER_THAN", "parameterName": "3nyXhxo8", "parameterType": "STATISTIC_CYCLE", "statCycleId": "hGWBRSCz", "targetValue": 0.42719394494444274}, {"matcher": "GREATER_THAN", "parameterName": "kW2eJLxA", "parameterType": "STATISTIC_CYCLE", "statCycleId": "QifCidEi", "targetValue": 0.011937713679319839}, {"matcher": "EQUAL", "parameterName": "Wan64e6E", "parameterType": "ACHIEVEMENT", "statCycleId": "boponUHX", "targetValue": 0.8754894607257324}]}, {"operator": "AND", "predicates": [{"matcher": "GREATER_THAN_EQUAL", "parameterName": "K57TVCTv", "parameterType": "USERACCOUNT", "statCycleId": "TLxM56IL", "targetValue": 0.6549049729539939}, {"matcher": "GREATER_THAN", "parameterName": "B27NXS2e", "parameterType": "STATISTIC_CYCLE", "statCycleId": "JsrFftTH", "targetValue": 0.09520679408167254}, {"matcher": "GREATER_THAN", "parameterName": "QAUZDd2x", "parameterType": "ACHIEVEMENT", "statCycleId": "gmAHpreY", "targetValue": 0.4948963271661303}]}], "rewards": [{"itemId": "ycEGToeh", "itemName": "CZmMF8S1", "qty": 0.046577657645922255, "type": "STATISTIC"}, {"itemId": "JogSyuWI", "itemName": "vIxE829O", "qty": 0.6756594654394098, "type": "ENTITLEMENT"}, {"itemId": "fhWDJ35Q", "itemName": "tBW8k9z5", "qty": 0.8849651428974057, "type": "ENTITLEMENT"}], "schedule": {"endTime": "1975-02-07T00:00:00Z", "order": 56, "startTime": "1987-07-18T00:00:00Z"}, "tags": ["WGZHXJob", "mYjUH9y5", "2Uvg91I9"]}' \
    > test.out 2>&1
eval_tap $? 10 'AdminCreateGoal' test.out

#- 11 AdminGetGoal
./ng net.accelbyte.sdk.cli.Main challenge adminGetGoal \
    --challengeCode 'A1TvffQJ' \
    --code 'fbHDphW9' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 11 'AdminGetGoal' test.out

#- 12 AdminUpdateGoals
./ng net.accelbyte.sdk.cli.Main challenge adminUpdateGoals \
    --challengeCode 'pszuiUu2' \
    --code 'S1R4icOg' \
    --namespace "$AB_NAMESPACE" \
    --body '{"description": "lXFf2bkz", "isActive": true, "name": "hLRu8LRe", "requirementGroups": [{"operator": "AND", "predicates": [{"matcher": "LESS_THAN", "parameterName": "iSsW9jpl", "parameterType": "ENTITLEMENT", "statCycleId": "OC5fIeBu", "targetValue": 0.5527926229023491}, {"matcher": "LESS_THAN_EQUAL", "parameterName": "ibIIJxun", "parameterType": "USERACCOUNT", "statCycleId": "krDJ1PMU", "targetValue": 0.2060998784801562}, {"matcher": "GREATER_THAN", "parameterName": "lh2fV5IC", "parameterType": "STATISTIC", "statCycleId": "gRDdjWRW", "targetValue": 0.9209236046855105}]}, {"operator": "AND", "predicates": [{"matcher": "GREATER_THAN", "parameterName": "hHjLDPGv", "parameterType": "ACHIEVEMENT", "statCycleId": "srntvcEs", "targetValue": 0.7487532939716799}, {"matcher": "LESS_THAN", "parameterName": "Vc1zDI3y", "parameterType": "ACHIEVEMENT", "statCycleId": "sThXpV5H", "targetValue": 0.3001900731780023}, {"matcher": "EQUAL", "parameterName": "A48hL8GB", "parameterType": "ACHIEVEMENT", "statCycleId": "5TvL408G", "targetValue": 0.8613828577218474}]}, {"operator": "AND", "predicates": [{"matcher": "LESS_THAN", "parameterName": "q6tiuwXa", "parameterType": "ACHIEVEMENT", "statCycleId": "1wIpIYZj", "targetValue": 0.39653437605424613}, {"matcher": "LESS_THAN", "parameterName": "as0n5hz4", "parameterType": "STATISTIC_CYCLE", "statCycleId": "v1xWBsEa", "targetValue": 0.9399888748638255}, {"matcher": "GREATER_THAN", "parameterName": "Jtp4bwlV", "parameterType": "ENTITLEMENT", "statCycleId": "v4SlHKH2", "targetValue": 0.39673429500925894}]}], "rewards": [{"itemId": "kGKhzsVL", "itemName": "ZefuahNm", "qty": 0.2180424510523964, "type": "STATISTIC"}, {"itemId": "yb5qWUqu", "itemName": "A3lmjP9e", "qty": 0.09317831704100132, "type": "ENTITLEMENT"}, {"itemId": "lWdFRd8c", "itemName": "aqzGkqu0", "qty": 0.14322305759514709, "type": "STATISTIC"}], "schedule": {"endTime": "1995-07-16T00:00:00Z", "order": 50, "startTime": "1992-04-11T00:00:00Z"}, "tags": ["E43oi74M", "SBAU5oKB", "Oy8e8D2v"]}' \
    > test.out 2>&1
eval_tap $? 12 'AdminUpdateGoals' test.out

#- 13 AdminDeleteGoal
./ng net.accelbyte.sdk.cli.Main challenge adminDeleteGoal \
    --challengeCode 'fMtZoOTt' \
    --code 'cdTWdAFY' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 13 'AdminDeleteGoal' test.out

#- 14 AdminListSchedulesByGoal
./ng net.accelbyte.sdk.cli.Main challenge adminListSchedulesByGoal \
    --challengeCode 'vcMwlF6o' \
    --code 'jI4CPCpP' \
    --namespace "$AB_NAMESPACE" \
    --limit '78' \
    --offset '26' \
    --userId 'BiKAGFuw' \
    > test.out 2>&1
eval_tap $? 14 'AdminListSchedulesByGoal' test.out

#- 15 AdminGetPeriods
./ng net.accelbyte.sdk.cli.Main challenge adminGetPeriods \
    --challengeCode '02NZjhw5' \
    --namespace "$AB_NAMESPACE" \
    --limit '92' \
    --offset '3' \
    > test.out 2>&1
eval_tap $? 15 'AdminGetPeriods' test.out

#- 16 AdminRandomizeChallenge
./ng net.accelbyte.sdk.cli.Main challenge adminRandomizeChallenge \
    --challengeCode 'ct2BbNaA' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 16 'AdminRandomizeChallenge' test.out

#- 17 AdminListSchedules
./ng net.accelbyte.sdk.cli.Main challenge adminListSchedules \
    --challengeCode 'vWKxTqe7' \
    --namespace "$AB_NAMESPACE" \
    --dateTime '1995-12-03T00:00:00Z' \
    --limit '25' \
    --offset '79' \
    --userId '5msNYbkk' \
    > test.out 2>&1
eval_tap $? 17 'AdminListSchedules' test.out

#- 18 AdminDeleteTiedChallenge
./ng net.accelbyte.sdk.cli.Main challenge adminDeleteTiedChallenge \
    --challengeCode 'DZ97aTE9' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 18 'AdminDeleteTiedChallenge' test.out

#- 19 AdminUpdateTiedChallengeSchedule
./ng net.accelbyte.sdk.cli.Main challenge adminUpdateTiedChallengeSchedule \
    --challengeCode 'EfeIeCdh' \
    --namespace "$AB_NAMESPACE" \
    --body '{"action": "STOP", "endDate": "1992-12-03T00:00:00Z"}' \
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
    --body '{"appName": "g9fJarQd", "extendType": "APP", "grpcServerAddress": "Nc59EdoC"}' \
    > test.out 2>&1
eval_tap $? 21 'AdminUpdateAssignmentPlugin' test.out

#- 22 AdminCreateAssignmentPlugin
./ng net.accelbyte.sdk.cli.Main challenge adminCreateAssignmentPlugin \
    --namespace "$AB_NAMESPACE" \
    --body '{"appName": "yC3WRkw4", "extendType": "CUSTOM", "grpcServerAddress": "ObIW15lr"}' \
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
    --body '{"userIds": ["aYKcJYNg", "GGIzCPzc", "J7D9aP1o"]}' \
    > test.out 2>&1
eval_tap $? 24 'AdminEvaluateProgress' test.out

#- 25 AdminClaimUsersRewards
./ng net.accelbyte.sdk.cli.Main challenge adminClaimUsersRewards \
    --namespace "$AB_NAMESPACE" \
    --body '[{"rewardIds": ["7J4xp9Av", "QB2X56gK", "xtn2OJlY"], "userId": "xNhydWyy"}, {"rewardIds": ["8sdWwDqH", "TWJq4MTz", "XmZ0DHAn"], "userId": "66krVKqL"}, {"rewardIds": ["9qGLVIBw", "u1eMM1cy", "pZryCWgU"], "userId": "YdAL1vfN"}]' \
    > test.out 2>&1
eval_tap $? 25 'AdminClaimUsersRewards' test.out

#- 26 AdminClaimUserRewardsByGoalCode
./ng net.accelbyte.sdk.cli.Main challenge adminClaimUserRewardsByGoalCode \
    --challengeCode 'ko7dPCu4' \
    --namespace "$AB_NAMESPACE" \
    --userId 'IaenjNIv' \
    --body '{"goalCode": "SVeIjOsA"}' \
    > test.out 2>&1
eval_tap $? 26 'AdminClaimUserRewardsByGoalCode' test.out

#- 27 AdminGetUserProgression
./ng net.accelbyte.sdk.cli.Main challenge adminGetUserProgression \
    --challengeCode 'GD4DBySw' \
    --namespace "$AB_NAMESPACE" \
    --userId 'cXcwcvuU' \
    --dateTime '1985-11-17T00:00:00Z' \
    --goalCode 'j2glgqmO' \
    --limit '78' \
    --offset '37' \
    --tags 'psYQYGxF,NeSCNvMq,OvHwYX16' \
    > test.out 2>&1
eval_tap $? 27 'AdminGetUserProgression' test.out

#- 28 AdminGetUserRewards
./ng net.accelbyte.sdk.cli.Main challenge adminGetUserRewards \
    --namespace "$AB_NAMESPACE" \
    --userId '5sPVV9V2' \
    --challengeCode 'HLWJDj4p' \
    --goalProgressionId 'u80CNEdP' \
    --limit '10' \
    --offset '7' \
    --sortBy 'updatedAt:desc' \
    --status 'CLAIMED' \
    > test.out 2>&1
eval_tap $? 28 'AdminGetUserRewards' test.out

#- 29 AdminClaimUserRewards
./ng net.accelbyte.sdk.cli.Main challenge adminClaimUserRewards \
    --namespace "$AB_NAMESPACE" \
    --userId 'PAgzFOTN' \
    --body '{"rewardIDs": ["nsZbSWgK", "kbd9BKPp", "f3c4ZgUK"]}' \
    > test.out 2>&1
eval_tap $? 29 'AdminClaimUserRewards' test.out

#- 30 GetChallenges
./ng net.accelbyte.sdk.cli.Main challenge getChallenges \
    --namespace "$AB_NAMESPACE" \
    --keyword 'WJ1iMqtL' \
    --limit '78' \
    --offset '17' \
    --sortBy 'updatedAt:asc' \
    --status 'TIED' \
    --tags 'Av09lEVw,Rr3uFr4v,cvGE4fY0' \
    > test.out 2>&1
eval_tap $? 30 'GetChallenges' test.out

#- 31 PublicGetScheduledGoals
./ng net.accelbyte.sdk.cli.Main challenge publicGetScheduledGoals \
    --challengeCode 'fcEMLni7' \
    --namespace "$AB_NAMESPACE" \
    --limit '41' \
    --offset '57' \
    --sortBy 'createdAt' \
    --tags '7bLiqgfv,xyHxQKvE,9pWZiOTM' \
    > test.out 2>&1
eval_tap $? 31 'PublicGetScheduledGoals' test.out

#- 32 PublicListSchedulesByGoal
./ng net.accelbyte.sdk.cli.Main challenge publicListSchedulesByGoal \
    --challengeCode '8Xzq4OfY' \
    --code 'dNUb07xV' \
    --namespace "$AB_NAMESPACE" \
    --limit '62' \
    --offset '83' \
    > test.out 2>&1
eval_tap $? 32 'PublicListSchedulesByGoal' test.out

#- 33 PublicListSchedules
./ng net.accelbyte.sdk.cli.Main challenge publicListSchedules \
    --challengeCode 'iNN3JI3c' \
    --namespace "$AB_NAMESPACE" \
    --dateTime '1973-12-12T00:00:00Z' \
    --limit '81' \
    --offset '95' \
    > test.out 2>&1
eval_tap $? 33 'PublicListSchedules' test.out

#- 34 PublicClaimUserRewardsByGoalCode
./ng net.accelbyte.sdk.cli.Main challenge publicClaimUserRewardsByGoalCode \
    --challengeCode 'rtWRiuzX' \
    --namespace "$AB_NAMESPACE" \
    --body '{"goalCode": "FInt1ZVb"}' \
    > test.out 2>&1
eval_tap $? 34 'PublicClaimUserRewardsByGoalCode' test.out

#- 35 EvaluateMyProgress
./ng net.accelbyte.sdk.cli.Main challenge evaluateMyProgress \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 35 'EvaluateMyProgress' test.out

#- 36 PublicGetUserProgression
./ng net.accelbyte.sdk.cli.Main challenge publicGetUserProgression \
    --challengeCode 'vztY3BvO' \
    --namespace "$AB_NAMESPACE" \
    --dateTime '1986-07-12T00:00:00Z' \
    --goalCode 'PVxPTgw8' \
    --limit '58' \
    --offset '84' \
    --tags 'EYORHDsr,5Jt8JGqi,fog4wdRP' \
    > test.out 2>&1
eval_tap $? 36 'PublicGetUserProgression' test.out

#- 37 PublicGetPastUserProgression
./ng net.accelbyte.sdk.cli.Main challenge publicGetPastUserProgression \
    --challengeCode 'dLw0K8ZE' \
    --index '64' \
    --namespace "$AB_NAMESPACE" \
    --goalCode 'AIruDnEJ' \
    --limit '27' \
    --offset '75' \
    --tags 'rKqYUddF,fb48lpuz,bxB0RnOH' \
    > test.out 2>&1
eval_tap $? 37 'PublicGetPastUserProgression' test.out

#- 38 PublicGetUserRewards
./ng net.accelbyte.sdk.cli.Main challenge publicGetUserRewards \
    --namespace "$AB_NAMESPACE" \
    --challengeCode '66jUl1GD' \
    --goalProgressionId '2lyRriAy' \
    --limit '2' \
    --offset '6' \
    --sortBy 'updatedAt:desc' \
    --status 'UNCLAIMED' \
    > test.out 2>&1
eval_tap $? 38 'PublicGetUserRewards' test.out

#- 39 PublicClaimUserRewards
./ng net.accelbyte.sdk.cli.Main challenge publicClaimUserRewards \
    --namespace "$AB_NAMESPACE" \
    --body '{"rewardIDs": ["t9WSuO1K", "IM0ytaFm", "Vk0rwSg7"]}' \
    > test.out 2>&1
eval_tap $? 39 'PublicClaimUserRewards' test.out


rm -f "tmp.dat"

exit $EXIT_CODE