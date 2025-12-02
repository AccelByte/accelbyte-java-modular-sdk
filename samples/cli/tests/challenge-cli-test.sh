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
    --keyword 'TvE2ID4A' \
    --limit '97' \
    --offset '49' \
    --sortBy 'createdAt' \
    --status 'RETIRED' \
    --tags 'zH6Few8J,mt7GuxAM,aYb8maSw' \
    > test.out 2>&1
eval_tap $? 2 'AdminGetChallenges' test.out

#- 3 AdminCreateChallenge
./ng net.accelbyte.sdk.cli.Main challenge adminCreateChallenge \
    --namespace "$AB_NAMESPACE" \
    --body '{"activeGoalsPerRotation": 77, "assignmentRule": "FIXED", "code": "DIXRgUEC", "description": "E7zHUqIq", "endAfter": 82, "endDate": "1982-10-24T00:00:00Z", "goalsVisibility": "SHOWALL", "name": "FZd8ubHN", "randomizedPerRotation": true, "repeatAfter": 39, "resetConfig": {"resetDate": 84, "resetDay": 1, "resetTime": "MntEzOkR"}, "rotation": "MONTHLY", "startDate": "1987-04-07T00:00:00Z", "tags": ["jHLiHGYo", "anJoitau", "8uuYtHv5"]}' \
    > test.out 2>&1
eval_tap $? 3 'AdminCreateChallenge' test.out

#- 4 AdminGetItemReferences
./ng net.accelbyte.sdk.cli.Main challenge adminGetItemReferences \
    --namespace "$AB_NAMESPACE" \
    --itemId 'VCjsENnp' \
    > test.out 2>&1
eval_tap $? 4 'AdminGetItemReferences' test.out

#- 5 AdminGetActiveChallenges
./ng net.accelbyte.sdk.cli.Main challenge adminGetActiveChallenges \
    --namespace "$AB_NAMESPACE" \
    --userId 'OHptEioS' \
    --limit '44' \
    --offset '38' \
    > test.out 2>&1
eval_tap $? 5 'AdminGetActiveChallenges' test.out

#- 6 AdminGetChallenge
./ng net.accelbyte.sdk.cli.Main challenge adminGetChallenge \
    --challengeCode '3pqrMXRP' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 6 'AdminGetChallenge' test.out

#- 7 AdminUpdateChallenge
./ng net.accelbyte.sdk.cli.Main challenge adminUpdateChallenge \
    --challengeCode 'GN2Kq2WJ' \
    --namespace "$AB_NAMESPACE" \
    --body '{"activeGoalsPerRotation": 76, "assignmentRule": "FIXED", "description": "h9ircS5z", "endAfter": 27, "endDate": "1974-10-26T00:00:00Z", "goalsVisibility": "PERIODONLY", "name": "T0AZekwR", "randomizedPerRotation": true, "repeatAfter": 50, "resetConfig": {"resetDate": 32, "resetDay": 79, "resetTime": "xbq6IObF"}, "rotation": "MONTHLY", "startDate": "1996-08-03T00:00:00Z", "tags": ["XYQv0sbD", "WMDAX3KM", "Gmg5q3qW"]}' \
    > test.out 2>&1
eval_tap $? 7 'AdminUpdateChallenge' test.out

#- 8 AdminDeleteChallenge
./ng net.accelbyte.sdk.cli.Main challenge adminDeleteChallenge \
    --challengeCode 'jxqVwiYg' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 8 'AdminDeleteChallenge' test.out

#- 9 AdminGetGoals
./ng net.accelbyte.sdk.cli.Main challenge adminGetGoals \
    --challengeCode '76AlYDcV' \
    --namespace "$AB_NAMESPACE" \
    --limit '49' \
    --offset '47' \
    --sortBy 'updatedAt:asc' \
    --tags 'MmPYZMUW,v03ZMdbM,sCGOqp6v' \
    > test.out 2>&1
eval_tap $? 9 'AdminGetGoals' test.out

#- 10 AdminCreateGoal
./ng net.accelbyte.sdk.cli.Main challenge adminCreateGoal \
    --challengeCode 'ujI1Ae5v' \
    --namespace "$AB_NAMESPACE" \
    --body '{"code": "lxp3UGRg", "description": "f0eqGDy1", "isActive": true, "name": "H5rM1e3x", "requirementGroups": [{"operator": "AND", "predicates": [{"matcher": "GREATER_THAN", "parameterName": "ScD89Kh0", "parameterType": "USERACCOUNT", "statCycleId": "tKZSD6m1", "targetValue": 0.9367160440791931}, {"matcher": "LESS_THAN_EQUAL", "parameterName": "iRSLkq2B", "parameterType": "ENTITLEMENT", "statCycleId": "cSamCBHP", "targetValue": 0.8504246379479987}, {"matcher": "LESS_THAN_EQUAL", "parameterName": "7voJ6wEV", "parameterType": "STATISTIC_CYCLE", "statCycleId": "FPZBYtai", "targetValue": 0.46775394899655476}]}, {"operator": "AND", "predicates": [{"matcher": "LESS_THAN", "parameterName": "0x1nC7J1", "parameterType": "ENTITLEMENT", "statCycleId": "tn7D9o0g", "targetValue": 0.12555580576471592}, {"matcher": "GREATER_THAN", "parameterName": "y4bvblGO", "parameterType": "ENTITLEMENT", "statCycleId": "IRS9x1oO", "targetValue": 0.38607293761084693}, {"matcher": "LESS_THAN_EQUAL", "parameterName": "3AipE0Pv", "parameterType": "ACHIEVEMENT", "statCycleId": "uMfo5ibp", "targetValue": 0.5875515388101694}]}, {"operator": "AND", "predicates": [{"matcher": "GREATER_THAN", "parameterName": "q5ndJo3y", "parameterType": "USERACCOUNT", "statCycleId": "LAvb8Xz3", "targetValue": 0.9289939424125461}, {"matcher": "EQUAL", "parameterName": "49WqZKwe", "parameterType": "ENTITLEMENT", "statCycleId": "zGsFRUVe", "targetValue": 0.41156623074742127}, {"matcher": "GREATER_THAN", "parameterName": "YsBDwKbH", "parameterType": "ENTITLEMENT", "statCycleId": "r7Ozxvaa", "targetValue": 0.5667895065716478}]}], "rewards": [{"itemId": "2q0hfiwv", "itemName": "0ysib8CM", "qty": 0.5394090437054707, "type": "STATISTIC"}, {"itemId": "uBin4RDM", "itemName": "hpgsfNOx", "qty": 0.9658629014107369, "type": "ENTITLEMENT"}, {"itemId": "623vUJhk", "itemName": "17ldC8vS", "qty": 0.1860297181523265, "type": "STATISTIC"}], "schedule": {"endTime": "1996-06-06T00:00:00Z", "order": 2, "startTime": "1985-04-17T00:00:00Z"}, "tags": ["xl1AVmdn", "Hsqd7YQd", "D4EStShw"]}' \
    > test.out 2>&1
eval_tap $? 10 'AdminCreateGoal' test.out

#- 11 AdminGetGoal
./ng net.accelbyte.sdk.cli.Main challenge adminGetGoal \
    --challengeCode 'Ep9HcG1I' \
    --code 'tDEWcUZJ' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 11 'AdminGetGoal' test.out

#- 12 AdminUpdateGoals
./ng net.accelbyte.sdk.cli.Main challenge adminUpdateGoals \
    --challengeCode '6IFYGjeY' \
    --code '7FoSut0o' \
    --namespace "$AB_NAMESPACE" \
    --body '{"description": "DyNXFrP2", "isActive": false, "name": "zw9DVlk1", "requirementGroups": [{"operator": "AND", "predicates": [{"matcher": "GREATER_THAN", "parameterName": "4v4EuMOf", "parameterType": "USERACCOUNT", "statCycleId": "Ukyh92Vu", "targetValue": 0.7139216660649548}, {"matcher": "GREATER_THAN_EQUAL", "parameterName": "YSd1W4dK", "parameterType": "USERACCOUNT", "statCycleId": "c2nGzB28", "targetValue": 0.4518261251648885}, {"matcher": "LESS_THAN_EQUAL", "parameterName": "75j58EeT", "parameterType": "ENTITLEMENT", "statCycleId": "7tIN218T", "targetValue": 0.7443805866259358}]}, {"operator": "AND", "predicates": [{"matcher": "LESS_THAN_EQUAL", "parameterName": "o2kvCn8A", "parameterType": "USERACCOUNT", "statCycleId": "RAcFNJaB", "targetValue": 0.49437883562238527}, {"matcher": "LESS_THAN", "parameterName": "hSyy5oSP", "parameterType": "ENTITLEMENT", "statCycleId": "GBenuIhM", "targetValue": 0.7968849026743423}, {"matcher": "GREATER_THAN", "parameterName": "ESnRJH2D", "parameterType": "STATISTIC_CYCLE", "statCycleId": "cxP5Onlv", "targetValue": 0.7027657624202707}]}, {"operator": "AND", "predicates": [{"matcher": "LESS_THAN", "parameterName": "s9g0gFRj", "parameterType": "STATISTIC_CYCLE", "statCycleId": "AFoeNQfR", "targetValue": 0.8698724579941914}, {"matcher": "EQUAL", "parameterName": "CjRjOHWC", "parameterType": "ENTITLEMENT", "statCycleId": "OMTqFW76", "targetValue": 0.7794009582490726}, {"matcher": "LESS_THAN", "parameterName": "WPNUQ67I", "parameterType": "USERACCOUNT", "statCycleId": "pUDb4xAO", "targetValue": 0.7033596333828039}]}], "rewards": [{"itemId": "IwoqnHnh", "itemName": "iOlNL7In", "qty": 0.6806141115676728, "type": "ENTITLEMENT"}, {"itemId": "gjZiReKB", "itemName": "W4RovGrU", "qty": 0.7572783381796458, "type": "ENTITLEMENT"}, {"itemId": "2hN22yI0", "itemName": "vOGin6ei", "qty": 0.5187668946157773, "type": "ENTITLEMENT"}], "schedule": {"endTime": "1982-07-26T00:00:00Z", "order": 29, "startTime": "1971-01-28T00:00:00Z"}, "tags": ["WPlpn6gN", "qxWh5ZjF", "GYVafMlR"]}' \
    > test.out 2>&1
eval_tap $? 12 'AdminUpdateGoals' test.out

#- 13 AdminDeleteGoal
./ng net.accelbyte.sdk.cli.Main challenge adminDeleteGoal \
    --challengeCode 'o5vlGY6B' \
    --code 'Rhakj8St' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 13 'AdminDeleteGoal' test.out

#- 14 AdminListSchedulesByGoal
./ng net.accelbyte.sdk.cli.Main challenge adminListSchedulesByGoal \
    --challengeCode 'Kg5YQdcT' \
    --code '3MCJSJXU' \
    --namespace "$AB_NAMESPACE" \
    --limit '84' \
    --offset '46' \
    --userId '3O5CQJgz' \
    > test.out 2>&1
eval_tap $? 14 'AdminListSchedulesByGoal' test.out

#- 15 AdminGetPeriods
./ng net.accelbyte.sdk.cli.Main challenge adminGetPeriods \
    --challengeCode 'Z0f3lwrs' \
    --namespace "$AB_NAMESPACE" \
    --limit '19' \
    --offset '44' \
    > test.out 2>&1
eval_tap $? 15 'AdminGetPeriods' test.out

#- 16 AdminRandomizeChallenge
./ng net.accelbyte.sdk.cli.Main challenge adminRandomizeChallenge \
    --challengeCode 'irs9L9ux' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 16 'AdminRandomizeChallenge' test.out

#- 17 AdminListSchedules
./ng net.accelbyte.sdk.cli.Main challenge adminListSchedules \
    --challengeCode 'cJvD89jv' \
    --namespace "$AB_NAMESPACE" \
    --dateTime '1975-07-06T00:00:00Z' \
    --limit '78' \
    --offset '42' \
    --userId 'nMrwVU5q' \
    > test.out 2>&1
eval_tap $? 17 'AdminListSchedules' test.out

#- 18 AdminDeleteTiedChallenge
./ng net.accelbyte.sdk.cli.Main challenge adminDeleteTiedChallenge \
    --challengeCode '5YpKs1eL' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 18 'AdminDeleteTiedChallenge' test.out

#- 19 AdminUpdateTiedChallengeSchedule
./ng net.accelbyte.sdk.cli.Main challenge adminUpdateTiedChallengeSchedule \
    --challengeCode 'z7kOpy31' \
    --namespace "$AB_NAMESPACE" \
    --body '{"action": "ACCELERATE", "endDate": "1978-01-08T00:00:00Z"}' \
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
    --body '{"appName": "tNPHxl6F", "extendType": "CUSTOM", "grpcServerAddress": "qZ0cicQU"}' \
    > test.out 2>&1
eval_tap $? 21 'AdminUpdateAssignmentPlugin' test.out

#- 22 AdminCreateAssignmentPlugin
./ng net.accelbyte.sdk.cli.Main challenge adminCreateAssignmentPlugin \
    --namespace "$AB_NAMESPACE" \
    --body '{"appName": "hjivFV66", "extendType": "APP", "grpcServerAddress": "fyAdc2gj"}' \
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
    --challengeCode 'o12rLvyu,AoBRU0uH,BNdDZ3hR' \
    --body '{"userIds": ["jxmObMud", "h8WzHlYn", "qPoB8ZEq"]}' \
    > test.out 2>&1
eval_tap $? 24 'AdminEvaluateProgress' test.out

#- 25 AdminClaimUsersRewards
./ng net.accelbyte.sdk.cli.Main challenge adminClaimUsersRewards \
    --namespace "$AB_NAMESPACE" \
    --body '[{"rewardIds": ["HQosdQdJ", "rKKOjaeS", "8NiZDQAN"], "userId": "fFMWBElw"}, {"rewardIds": ["PITXaNYI", "vOSAXuI7", "UbOkgpGQ"], "userId": "aL4wMv1m"}, {"rewardIds": ["b5pq92Gj", "rFYUL3Ll", "mvhhYazi"], "userId": "gnjq7myl"}]' \
    > test.out 2>&1
eval_tap $? 25 'AdminClaimUsersRewards' test.out

#- 26 AdminClaimUserRewardsByGoalCode
./ng net.accelbyte.sdk.cli.Main challenge adminClaimUserRewardsByGoalCode \
    --challengeCode 'uzd29E8v' \
    --namespace "$AB_NAMESPACE" \
    --userId 'EpaxuOcp' \
    --body '{"goalCode": "OspJjy24"}' \
    > test.out 2>&1
eval_tap $? 26 'AdminClaimUserRewardsByGoalCode' test.out

#- 27 AdminGetUserProgression
./ng net.accelbyte.sdk.cli.Main challenge adminGetUserProgression \
    --challengeCode 'LeS1QYss' \
    --namespace "$AB_NAMESPACE" \
    --userId 'NB6vYeYi' \
    --dateTime '1985-05-23T00:00:00Z' \
    --goalCode 'jGNP2QaV' \
    --limit '3' \
    --offset '6' \
    --tags 'wV5Pka9s,r73ScyQK,NVv1hMGf' \
    > test.out 2>&1
eval_tap $? 27 'AdminGetUserProgression' test.out

#- 28 AdminGetUserRewards
./ng net.accelbyte.sdk.cli.Main challenge adminGetUserRewards \
    --namespace "$AB_NAMESPACE" \
    --userId 'wneVZ0sh' \
    --challengeCode 'RXryzIsO' \
    --goalProgressionId 'GRv0RHLd' \
    --limit '36' \
    --offset '99' \
    --sortBy 'createdAt' \
    --status 'CLAIMED' \
    > test.out 2>&1
eval_tap $? 28 'AdminGetUserRewards' test.out

#- 29 AdminClaimUserRewards
./ng net.accelbyte.sdk.cli.Main challenge adminClaimUserRewards \
    --namespace "$AB_NAMESPACE" \
    --userId 'ALgpRcld' \
    --body '{"rewardIDs": ["NAlEl5IW", "M8VaHZi5", "algQI7KK"]}' \
    > test.out 2>&1
eval_tap $? 29 'AdminClaimUserRewards' test.out

#- 30 GetChallenges
./ng net.accelbyte.sdk.cli.Main challenge getChallenges \
    --namespace "$AB_NAMESPACE" \
    --keyword 'NkwXqgWK' \
    --limit '19' \
    --offset '40' \
    --sortBy 'createdAt' \
    --status 'INIT' \
    --tags 'qWtlg0SA,sm8OGUAw,gzKXZzpz' \
    > test.out 2>&1
eval_tap $? 30 'GetChallenges' test.out

#- 31 PublicGetScheduledGoals
./ng net.accelbyte.sdk.cli.Main challenge publicGetScheduledGoals \
    --challengeCode 's21DCRoY' \
    --namespace "$AB_NAMESPACE" \
    --limit '47' \
    --offset '6' \
    --sortBy 'createdAt:desc' \
    --tags 'IivFFWu9,e1Rgx7Tw,l7vqAMGp' \
    > test.out 2>&1
eval_tap $? 31 'PublicGetScheduledGoals' test.out

#- 32 PublicListSchedulesByGoal
./ng net.accelbyte.sdk.cli.Main challenge publicListSchedulesByGoal \
    --challengeCode 'hCrZGGy5' \
    --code 'V9r1lmDG' \
    --namespace "$AB_NAMESPACE" \
    --limit '69' \
    --offset '77' \
    > test.out 2>&1
eval_tap $? 32 'PublicListSchedulesByGoal' test.out

#- 33 PublicListSchedules
./ng net.accelbyte.sdk.cli.Main challenge publicListSchedules \
    --challengeCode '4L0tUlJI' \
    --namespace "$AB_NAMESPACE" \
    --dateTime '1975-01-09T00:00:00Z' \
    --limit '98' \
    --offset '5' \
    > test.out 2>&1
eval_tap $? 33 'PublicListSchedules' test.out

#- 34 PublicClaimUserRewardsByGoalCode
./ng net.accelbyte.sdk.cli.Main challenge publicClaimUserRewardsByGoalCode \
    --challengeCode 'Br8dUb4o' \
    --namespace "$AB_NAMESPACE" \
    --body '{"goalCode": "EucCAcgy"}' \
    > test.out 2>&1
eval_tap $? 34 'PublicClaimUserRewardsByGoalCode' test.out

#- 35 EvaluateMyProgress
./ng net.accelbyte.sdk.cli.Main challenge evaluateMyProgress \
    --namespace "$AB_NAMESPACE" \
    --challengeCode '5JtN2CHa,QThrETZ1,XaN1pb9m' \
    > test.out 2>&1
eval_tap $? 35 'EvaluateMyProgress' test.out

#- 36 PublicGetUserProgression
./ng net.accelbyte.sdk.cli.Main challenge publicGetUserProgression \
    --challengeCode 'AySV7r4C' \
    --namespace "$AB_NAMESPACE" \
    --dateTime '1994-07-10T00:00:00Z' \
    --goalCode 'hDwQ7st1' \
    --limit '44' \
    --offset '92' \
    --tags 'wnkmKkQd,sC1kwnRa,GDLrjvlx' \
    > test.out 2>&1
eval_tap $? 36 'PublicGetUserProgression' test.out

#- 37 PublicGetPastUserProgression
./ng net.accelbyte.sdk.cli.Main challenge publicGetPastUserProgression \
    --challengeCode 'U7D21JE7' \
    --index '11' \
    --namespace "$AB_NAMESPACE" \
    --goalCode 'BaL8ajao' \
    --limit '63' \
    --offset '10' \
    --tags 'bxToBExd,oF5WpYRk,9PyzuJHh' \
    > test.out 2>&1
eval_tap $? 37 'PublicGetPastUserProgression' test.out

#- 38 PublicGetUserRewards
./ng net.accelbyte.sdk.cli.Main challenge publicGetUserRewards \
    --namespace "$AB_NAMESPACE" \
    --challengeCode 'U870ZmC2' \
    --goalProgressionId '6F6usWFM' \
    --limit '39' \
    --offset '55' \
    --sortBy 'createdAt:desc' \
    --status 'UNCLAIMED' \
    > test.out 2>&1
eval_tap $? 38 'PublicGetUserRewards' test.out

#- 39 PublicClaimUserRewards
./ng net.accelbyte.sdk.cli.Main challenge publicClaimUserRewards \
    --namespace "$AB_NAMESPACE" \
    --body '{"rewardIDs": ["GYffWiVl", "9t1GQI8T", "veBTnmAZ"]}' \
    > test.out 2>&1
eval_tap $? 39 'PublicClaimUserRewards' test.out


rm -f "tmp.dat"

exit $EXIT_CODE