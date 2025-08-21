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
    --keyword 'MgbMsGzf' \
    --limit '81' \
    --offset '38' \
    --sortBy 'createdAt:desc' \
    --status 'TIED' \
    --tags 'N5QIug2n,2GHCdn6u,FGIaz68W' \
    > test.out 2>&1
eval_tap $? 2 'AdminGetChallenges' test.out

#- 3 AdminCreateChallenge
./ng net.accelbyte.sdk.cli.Main challenge adminCreateChallenge \
    --namespace "$AB_NAMESPACE" \
    --body '{"activeGoalsPerRotation": 5, "assignmentRule": "RANDOMIZED", "code": "o16bnnFQ", "description": "tzwFRz1i", "endAfter": 35, "endDate": "1999-07-15T00:00:00Z", "goalsVisibility": "PERIODONLY", "name": "Xf3tAHZc", "randomizedPerRotation": false, "repeatAfter": 81, "resetConfig": {"resetDate": 31, "resetDay": 94, "resetTime": "QBC4Q04z"}, "rotation": "MONTHLY", "startDate": "1988-07-27T00:00:00Z", "tags": ["9UWFa5Xj", "Yi3Kj1kK", "NFkhq9nY"]}' \
    > test.out 2>&1
eval_tap $? 3 'AdminCreateChallenge' test.out

#- 4 AdminGetItemReferences
./ng net.accelbyte.sdk.cli.Main challenge adminGetItemReferences \
    --namespace "$AB_NAMESPACE" \
    --itemId 'IuFapZkM' \
    > test.out 2>&1
eval_tap $? 4 'AdminGetItemReferences' test.out

#- 5 AdminGetActiveChallenges
./ng net.accelbyte.sdk.cli.Main challenge adminGetActiveChallenges \
    --namespace "$AB_NAMESPACE" \
    --userId 'ChLxZeiL' \
    --limit '77' \
    --offset '14' \
    > test.out 2>&1
eval_tap $? 5 'AdminGetActiveChallenges' test.out

#- 6 AdminGetChallenge
./ng net.accelbyte.sdk.cli.Main challenge adminGetChallenge \
    --challengeCode 'S7dO2HvN' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 6 'AdminGetChallenge' test.out

#- 7 AdminUpdateChallenge
./ng net.accelbyte.sdk.cli.Main challenge adminUpdateChallenge \
    --challengeCode 'rluJZpm2' \
    --namespace "$AB_NAMESPACE" \
    --body '{"activeGoalsPerRotation": 95, "assignmentRule": "CUSTOM", "description": "3o8QLJaN", "endAfter": 22, "endDate": "1991-01-12T00:00:00Z", "goalsVisibility": "PERIODONLY", "name": "qxUAVDk7", "randomizedPerRotation": true, "repeatAfter": 2, "resetConfig": {"resetDate": 88, "resetDay": 14, "resetTime": "MMJcF5M1"}, "rotation": "MONTHLY", "startDate": "1979-06-06T00:00:00Z", "tags": ["zhQcMuOL", "CSI3jnjV", "t7dwMEoF"]}' \
    > test.out 2>&1
eval_tap $? 7 'AdminUpdateChallenge' test.out

#- 8 AdminDeleteChallenge
./ng net.accelbyte.sdk.cli.Main challenge adminDeleteChallenge \
    --challengeCode '3Adg4KKB' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 8 'AdminDeleteChallenge' test.out

#- 9 AdminGetGoals
./ng net.accelbyte.sdk.cli.Main challenge adminGetGoals \
    --challengeCode '0uKI0IFm' \
    --namespace "$AB_NAMESPACE" \
    --limit '29' \
    --offset '90' \
    --sortBy 'updatedAt:desc' \
    --tags 'GjpNEpwt,rjGOnJcB,zkP0C5Lm' \
    > test.out 2>&1
eval_tap $? 9 'AdminGetGoals' test.out

#- 10 AdminCreateGoal
./ng net.accelbyte.sdk.cli.Main challenge adminCreateGoal \
    --challengeCode 'qgDz1B1O' \
    --namespace "$AB_NAMESPACE" \
    --body '{"code": "1utekkNv", "description": "YxujxxL5", "isActive": true, "name": "W1FEV0os", "requirementGroups": [{"operator": "AND", "predicates": [{"matcher": "EQUAL", "parameterName": "H9iqPiEH", "parameterType": "STATISTIC", "statCycleId": "lygZx3sU", "targetValue": 0.3358662485535412}, {"matcher": "EQUAL", "parameterName": "Azisulqn", "parameterType": "ACHIEVEMENT", "statCycleId": "HEKl4Vzm", "targetValue": 0.9878465777247349}, {"matcher": "GREATER_THAN", "parameterName": "Gl2GPcuI", "parameterType": "ENTITLEMENT", "statCycleId": "xbOfCKfq", "targetValue": 0.2590788686016293}]}, {"operator": "AND", "predicates": [{"matcher": "EQUAL", "parameterName": "DHKXr4sS", "parameterType": "ENTITLEMENT", "statCycleId": "teMaRvcM", "targetValue": 0.8314434407127583}, {"matcher": "EQUAL", "parameterName": "neOFBrXQ", "parameterType": "ACHIEVEMENT", "statCycleId": "t68IaJqD", "targetValue": 0.26353768650139686}, {"matcher": "LESS_THAN", "parameterName": "LRmLNoGN", "parameterType": "ENTITLEMENT", "statCycleId": "gqU2E1jP", "targetValue": 0.5460691520920465}]}, {"operator": "AND", "predicates": [{"matcher": "GREATER_THAN_EQUAL", "parameterName": "i9zWU5Xi", "parameterType": "STATISTIC_CYCLE", "statCycleId": "a16mcQ4d", "targetValue": 0.8514967318698689}, {"matcher": "LESS_THAN", "parameterName": "0Fr2webn", "parameterType": "USERACCOUNT", "statCycleId": "2MfcdwdU", "targetValue": 0.6542859304078025}, {"matcher": "EQUAL", "parameterName": "IRwU0Uja", "parameterType": "STATISTIC", "statCycleId": "BnstStdy", "targetValue": 0.24871817715834588}]}], "rewards": [{"itemId": "OkTMi7t7", "itemName": "J6SJfgT2", "qty": 0.9549925890789419, "type": "STATISTIC"}, {"itemId": "aLpxDaHz", "itemName": "LmyDjRG3", "qty": 0.9509444079136685, "type": "STATISTIC"}, {"itemId": "b8KVh54r", "itemName": "AcXheL5Z", "qty": 0.6715878231056872, "type": "ENTITLEMENT"}], "schedule": {"endTime": "1985-07-17T00:00:00Z", "order": 13, "startTime": "1986-04-06T00:00:00Z"}, "tags": ["UVA3VhRb", "RNJRHgdg", "H6NU6H5C"]}' \
    > test.out 2>&1
eval_tap $? 10 'AdminCreateGoal' test.out

#- 11 AdminGetGoal
./ng net.accelbyte.sdk.cli.Main challenge adminGetGoal \
    --challengeCode '6nwlA2NZ' \
    --code 'nx6FjICA' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 11 'AdminGetGoal' test.out

#- 12 AdminUpdateGoals
./ng net.accelbyte.sdk.cli.Main challenge adminUpdateGoals \
    --challengeCode 'dftyMX6s' \
    --code '7wgr4P9u' \
    --namespace "$AB_NAMESPACE" \
    --body '{"description": "2QDC44PY", "isActive": true, "name": "f2du8LNX", "requirementGroups": [{"operator": "AND", "predicates": [{"matcher": "LESS_THAN_EQUAL", "parameterName": "03ZLFo2U", "parameterType": "STATISTIC", "statCycleId": "c3y5KO68", "targetValue": 0.23962366083924336}, {"matcher": "EQUAL", "parameterName": "6UmKTCtK", "parameterType": "STATISTIC_CYCLE", "statCycleId": "v6RpMEfo", "targetValue": 0.30611111919420664}, {"matcher": "GREATER_THAN", "parameterName": "RjGvo1Yn", "parameterType": "USERACCOUNT", "statCycleId": "MEKcImRW", "targetValue": 0.24478254011107803}]}, {"operator": "AND", "predicates": [{"matcher": "GREATER_THAN_EQUAL", "parameterName": "yqOcCn5y", "parameterType": "STATISTIC_CYCLE", "statCycleId": "jkrYAKqf", "targetValue": 0.5330810622032216}, {"matcher": "EQUAL", "parameterName": "fQ8TNTUK", "parameterType": "USERACCOUNT", "statCycleId": "eQPcqIcd", "targetValue": 0.9647335076935821}, {"matcher": "EQUAL", "parameterName": "C3i22NzN", "parameterType": "USERACCOUNT", "statCycleId": "ntaqhJxV", "targetValue": 0.5392980440344609}]}, {"operator": "AND", "predicates": [{"matcher": "LESS_THAN_EQUAL", "parameterName": "KHB1qyc1", "parameterType": "USERACCOUNT", "statCycleId": "BjMj3ha6", "targetValue": 0.8563530280603169}, {"matcher": "LESS_THAN_EQUAL", "parameterName": "soi0htbs", "parameterType": "ENTITLEMENT", "statCycleId": "KBnwACnt", "targetValue": 0.3827505641398541}, {"matcher": "LESS_THAN", "parameterName": "xBsZw8Wi", "parameterType": "STATISTIC", "statCycleId": "OU3C2POL", "targetValue": 0.30037173457265676}]}], "rewards": [{"itemId": "lFvwgOSi", "itemName": "PhUWnggq", "qty": 0.5858249116282067, "type": "ENTITLEMENT"}, {"itemId": "T0tHJeVB", "itemName": "k2ohOwwd", "qty": 0.5776919871424268, "type": "ENTITLEMENT"}, {"itemId": "JbRQ0PfR", "itemName": "Bt4bTzn0", "qty": 0.138290365470628, "type": "ENTITLEMENT"}], "schedule": {"endTime": "1983-09-03T00:00:00Z", "order": 29, "startTime": "1972-08-14T00:00:00Z"}, "tags": ["CqgOfkXc", "7WShOdow", "yZDcwlno"]}' \
    > test.out 2>&1
eval_tap $? 12 'AdminUpdateGoals' test.out

#- 13 AdminDeleteGoal
./ng net.accelbyte.sdk.cli.Main challenge adminDeleteGoal \
    --challengeCode 'lyrdHteC' \
    --code 'rRVK2LlF' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 13 'AdminDeleteGoal' test.out

#- 14 AdminListSchedulesByGoal
./ng net.accelbyte.sdk.cli.Main challenge adminListSchedulesByGoal \
    --challengeCode 'ghRJmtMP' \
    --code 'orOTWzpd' \
    --namespace "$AB_NAMESPACE" \
    --limit '60' \
    --offset '57' \
    --userId 'XDsXy5jy' \
    > test.out 2>&1
eval_tap $? 14 'AdminListSchedulesByGoal' test.out

#- 15 AdminGetPeriods
./ng net.accelbyte.sdk.cli.Main challenge adminGetPeriods \
    --challengeCode 'ft8GQiGH' \
    --namespace "$AB_NAMESPACE" \
    --limit '42' \
    --offset '89' \
    > test.out 2>&1
eval_tap $? 15 'AdminGetPeriods' test.out

#- 16 AdminRandomizeChallenge
./ng net.accelbyte.sdk.cli.Main challenge adminRandomizeChallenge \
    --challengeCode 'SC72wHyw' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 16 'AdminRandomizeChallenge' test.out

#- 17 AdminListSchedules
./ng net.accelbyte.sdk.cli.Main challenge adminListSchedules \
    --challengeCode 'Bd8CgZoT' \
    --namespace "$AB_NAMESPACE" \
    --dateTime '1978-02-08T00:00:00Z' \
    --limit '6' \
    --offset '68' \
    --userId '4NlrqrfZ' \
    > test.out 2>&1
eval_tap $? 17 'AdminListSchedules' test.out

#- 18 AdminDeleteTiedChallenge
./ng net.accelbyte.sdk.cli.Main challenge adminDeleteTiedChallenge \
    --challengeCode '33h5ZgkY' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 18 'AdminDeleteTiedChallenge' test.out

#- 19 AdminUpdateTiedChallengeSchedule
./ng net.accelbyte.sdk.cli.Main challenge adminUpdateTiedChallengeSchedule \
    --challengeCode 'MDTS01wP' \
    --namespace "$AB_NAMESPACE" \
    --body '{"action": "STOP", "endDate": "1990-06-24T00:00:00Z"}' \
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
    --body '{"appName": "6EHWDUjX", "extendType": "APP", "grpcServerAddress": "cLDH6CXx"}' \
    > test.out 2>&1
eval_tap $? 21 'AdminUpdateAssignmentPlugin' test.out

#- 22 AdminCreateAssignmentPlugin
./ng net.accelbyte.sdk.cli.Main challenge adminCreateAssignmentPlugin \
    --namespace "$AB_NAMESPACE" \
    --body '{"appName": "Ci2jYiTg", "extendType": "CUSTOM", "grpcServerAddress": "riPkIfAF"}' \
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
    --body '{"userIds": ["h9mPX6H6", "0o0ilU5S", "ebOr7A4c"]}' \
    > test.out 2>&1
eval_tap $? 24 'AdminEvaluateProgress' test.out

#- 25 AdminClaimUsersRewards
./ng net.accelbyte.sdk.cli.Main challenge adminClaimUsersRewards \
    --namespace "$AB_NAMESPACE" \
    --body '[{"rewardIds": ["qqztqsjq", "S0gkcLXv", "TBHvfU3L"], "userId": "yy4KYTPq"}, {"rewardIds": ["ndvuzYZW", "yKTAYnCn", "bAgglXj7"], "userId": "OeziVPbn"}, {"rewardIds": ["MJ49HZnx", "xpOleTKl", "2wV3WjHR"], "userId": "WDr52Jod"}]' \
    > test.out 2>&1
eval_tap $? 25 'AdminClaimUsersRewards' test.out

#- 26 AdminClaimUserRewardsByGoalCode
./ng net.accelbyte.sdk.cli.Main challenge adminClaimUserRewardsByGoalCode \
    --challengeCode 'iJaOztfc' \
    --namespace "$AB_NAMESPACE" \
    --userId 'LUsMmUe1' \
    --body '{"goalCode": "qcN8d1oi"}' \
    > test.out 2>&1
eval_tap $? 26 'AdminClaimUserRewardsByGoalCode' test.out

#- 27 AdminGetUserProgression
./ng net.accelbyte.sdk.cli.Main challenge adminGetUserProgression \
    --challengeCode 'A1EyXdYs' \
    --namespace "$AB_NAMESPACE" \
    --userId 'TAngy28I' \
    --dateTime '1988-03-26T00:00:00Z' \
    --goalCode 'BP0Xh9gh' \
    --limit '12' \
    --offset '22' \
    --tags 'lWCSXFRK,ai1pBY3o,E4uSOok6' \
    > test.out 2>&1
eval_tap $? 27 'AdminGetUserProgression' test.out

#- 28 AdminGetUserRewards
./ng net.accelbyte.sdk.cli.Main challenge adminGetUserRewards \
    --namespace "$AB_NAMESPACE" \
    --userId 'Vh2UYEao' \
    --challengeCode 'Y4AqJnwy' \
    --goalProgressionId 'GLLyGpfW' \
    --limit '49' \
    --offset '94' \
    --sortBy 'createdAt:desc' \
    --status 'CLAIMED' \
    > test.out 2>&1
eval_tap $? 28 'AdminGetUserRewards' test.out

#- 29 AdminClaimUserRewards
./ng net.accelbyte.sdk.cli.Main challenge adminClaimUserRewards \
    --namespace "$AB_NAMESPACE" \
    --userId 'c3PJwDsr' \
    --body '{"rewardIDs": ["Ytw5aDk3", "c0h47z18", "HvMtR1hP"]}' \
    > test.out 2>&1
eval_tap $? 29 'AdminClaimUserRewards' test.out

#- 30 GetChallenges
./ng net.accelbyte.sdk.cli.Main challenge getChallenges \
    --namespace "$AB_NAMESPACE" \
    --keyword 'ZWDVaJvd' \
    --limit '27' \
    --offset '41' \
    --sortBy 'createdAt' \
    --status 'RETIRED' \
    --tags '4coU4Fum,KPAp85yg,5QorrDrl' \
    > test.out 2>&1
eval_tap $? 30 'GetChallenges' test.out

#- 31 PublicGetScheduledGoals
./ng net.accelbyte.sdk.cli.Main challenge publicGetScheduledGoals \
    --challengeCode 'YF4WKrwK' \
    --namespace "$AB_NAMESPACE" \
    --limit '25' \
    --offset '61' \
    --sortBy 'updatedAt' \
    --tags 'KBJiEUCt,KF3fgGrc,Mks5IbMM' \
    > test.out 2>&1
eval_tap $? 31 'PublicGetScheduledGoals' test.out

#- 32 PublicListSchedulesByGoal
./ng net.accelbyte.sdk.cli.Main challenge publicListSchedulesByGoal \
    --challengeCode 'OzT1rUKm' \
    --code 'BpDrM16A' \
    --namespace "$AB_NAMESPACE" \
    --limit '53' \
    --offset '26' \
    > test.out 2>&1
eval_tap $? 32 'PublicListSchedulesByGoal' test.out

#- 33 PublicListSchedules
./ng net.accelbyte.sdk.cli.Main challenge publicListSchedules \
    --challengeCode 'mvlfxXPl' \
    --namespace "$AB_NAMESPACE" \
    --dateTime '1996-07-31T00:00:00Z' \
    --limit '29' \
    --offset '80' \
    > test.out 2>&1
eval_tap $? 33 'PublicListSchedules' test.out

#- 34 PublicClaimUserRewardsByGoalCode
./ng net.accelbyte.sdk.cli.Main challenge publicClaimUserRewardsByGoalCode \
    --challengeCode 'TYuaY5q9' \
    --namespace "$AB_NAMESPACE" \
    --body '{"goalCode": "gN9iKpnJ"}' \
    > test.out 2>&1
eval_tap $? 34 'PublicClaimUserRewardsByGoalCode' test.out

#- 35 EvaluateMyProgress
./ng net.accelbyte.sdk.cli.Main challenge evaluateMyProgress \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 35 'EvaluateMyProgress' test.out

#- 36 PublicGetUserProgression
./ng net.accelbyte.sdk.cli.Main challenge publicGetUserProgression \
    --challengeCode '2m6COHGx' \
    --namespace "$AB_NAMESPACE" \
    --dateTime '1999-03-23T00:00:00Z' \
    --goalCode 'Midt5tXf' \
    --limit '35' \
    --offset '71' \
    --tags '0eRamKcq,fRCZIlGi,Xsru1M4q' \
    > test.out 2>&1
eval_tap $? 36 'PublicGetUserProgression' test.out

#- 37 PublicGetPastUserProgression
./ng net.accelbyte.sdk.cli.Main challenge publicGetPastUserProgression \
    --challengeCode '4HpdCCDs' \
    --index '54' \
    --namespace "$AB_NAMESPACE" \
    --goalCode 'YjeUvZnv' \
    --limit '83' \
    --offset '94' \
    --tags 'UkKqOSMJ,5yc9Uzen,th2lq8Eb' \
    > test.out 2>&1
eval_tap $? 37 'PublicGetPastUserProgression' test.out

#- 38 PublicGetUserRewards
./ng net.accelbyte.sdk.cli.Main challenge publicGetUserRewards \
    --namespace "$AB_NAMESPACE" \
    --challengeCode 'MvaAF7fd' \
    --goalProgressionId 'xCg7yU33' \
    --limit '90' \
    --offset '60' \
    --sortBy 'updatedAt' \
    --status 'CLAIMED' \
    > test.out 2>&1
eval_tap $? 38 'PublicGetUserRewards' test.out

#- 39 PublicClaimUserRewards
./ng net.accelbyte.sdk.cli.Main challenge publicClaimUserRewards \
    --namespace "$AB_NAMESPACE" \
    --body '{"rewardIDs": ["EythAUS6", "a0kPZx0y", "VNhwiqru"]}' \
    > test.out 2>&1
eval_tap $? 39 'PublicClaimUserRewards' test.out


rm -f "tmp.dat"

exit $EXIT_CODE