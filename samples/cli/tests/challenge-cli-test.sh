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
    --keyword 'm6vM3Efo' \
    --limit '34' \
    --offset '35' \
    --sortBy 'createdAt:desc' \
    --status 'TIED' \
    --tags 'o15ZicLz,LuftdEk3,2aWlTT0a' \
    > test.out 2>&1
eval_tap $? 2 'AdminGetChallenges' test.out

#- 3 AdminCreateChallenge
./ng net.accelbyte.sdk.cli.Main challenge adminCreateChallenge \
    --namespace "$AB_NAMESPACE" \
    --body '{"activeGoalsPerRotation": 24, "assignmentRule": "CUSTOM", "code": "HqgCjdHZ", "description": "Rurz6ldI", "endAfter": 11, "endDate": "1994-09-05T00:00:00Z", "goalsVisibility": "PERIODONLY", "name": "ZBiuwfF5", "randomizedPerRotation": true, "repeatAfter": 0, "resetConfig": {"resetDate": 74, "resetDay": 6, "resetTime": "LzC7GTQs"}, "rotation": "MONTHLY", "startDate": "1982-12-03T00:00:00Z", "tags": ["V7bY1rXq", "iOhHOiMJ", "bsVufAd5"]}' \
    > test.out 2>&1
eval_tap $? 3 'AdminCreateChallenge' test.out

#- 4 AdminGetItemReferences
./ng net.accelbyte.sdk.cli.Main challenge adminGetItemReferences \
    --namespace "$AB_NAMESPACE" \
    --itemId 'WseDZ4EV' \
    > test.out 2>&1
eval_tap $? 4 'AdminGetItemReferences' test.out

#- 5 AdminGetActiveChallenges
./ng net.accelbyte.sdk.cli.Main challenge adminGetActiveChallenges \
    --namespace "$AB_NAMESPACE" \
    --userId 'B3Qe1Wz6' \
    --limit '63' \
    --offset '88' \
    > test.out 2>&1
eval_tap $? 5 'AdminGetActiveChallenges' test.out

#- 6 AdminGetChallenge
./ng net.accelbyte.sdk.cli.Main challenge adminGetChallenge \
    --challengeCode '2pKyLVhY' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 6 'AdminGetChallenge' test.out

#- 7 AdminUpdateChallenge
./ng net.accelbyte.sdk.cli.Main challenge adminUpdateChallenge \
    --challengeCode 'iscE748C' \
    --namespace "$AB_NAMESPACE" \
    --body '{"activeGoalsPerRotation": 54, "assignmentRule": "RANDOMIZED", "description": "xMegJzb6", "endAfter": 48, "endDate": "1992-07-04T00:00:00Z", "goalsVisibility": "SHOWALL", "name": "zclbAuIi", "randomizedPerRotation": true, "repeatAfter": 37, "resetConfig": {"resetDate": 32, "resetDay": 90, "resetTime": "IP6n2ZUr"}, "rotation": "WEEKLY", "startDate": "1987-06-07T00:00:00Z", "tags": ["wknos6Vj", "azHMaEDy", "TaCdApsY"]}' \
    > test.out 2>&1
eval_tap $? 7 'AdminUpdateChallenge' test.out

#- 8 AdminDeleteChallenge
./ng net.accelbyte.sdk.cli.Main challenge adminDeleteChallenge \
    --challengeCode 'rEwsZ78M' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 8 'AdminDeleteChallenge' test.out

#- 9 AdminGetGoals
./ng net.accelbyte.sdk.cli.Main challenge adminGetGoals \
    --challengeCode 'clDaFI92' \
    --namespace "$AB_NAMESPACE" \
    --limit '100' \
    --offset '31' \
    --sortBy 'createdAt:desc' \
    --tags 'U4GfDe02,DhGILZxM,QvDuCX57' \
    > test.out 2>&1
eval_tap $? 9 'AdminGetGoals' test.out

#- 10 AdminCreateGoal
./ng net.accelbyte.sdk.cli.Main challenge adminCreateGoal \
    --challengeCode 'SY5JdaP4' \
    --namespace "$AB_NAMESPACE" \
    --body '{"code": "P7Sp6gvg", "description": "Zytq9PbN", "isActive": true, "name": "jXNm88gR", "requirementGroups": [{"operator": "AND", "predicates": [{"matcher": "EQUAL", "parameterName": "Bq9HqSNQ", "parameterType": "USERACCOUNT", "statCycleId": "ZlFc1Bus", "targetValue": 0.6498791365421988}, {"matcher": "EQUAL", "parameterName": "d5ScHpsF", "parameterType": "USERACCOUNT", "statCycleId": "hDbNBSPr", "targetValue": 0.832721084592383}, {"matcher": "LESS_THAN_EQUAL", "parameterName": "d1GCeUeX", "parameterType": "STATISTIC", "statCycleId": "jQF84AX7", "targetValue": 0.04192781572673965}]}, {"operator": "AND", "predicates": [{"matcher": "GREATER_THAN", "parameterName": "ZScjYb3K", "parameterType": "STATISTIC_CYCLE", "statCycleId": "shgd1uD8", "targetValue": 0.014304159324487586}, {"matcher": "GREATER_THAN_EQUAL", "parameterName": "3ntLAdx4", "parameterType": "STATISTIC_CYCLE", "statCycleId": "cDDcOzEP", "targetValue": 0.9503259460063016}, {"matcher": "GREATER_THAN", "parameterName": "MnzLgbmd", "parameterType": "STATISTIC", "statCycleId": "csGjzGMF", "targetValue": 0.5421233284223419}]}, {"operator": "AND", "predicates": [{"matcher": "LESS_THAN_EQUAL", "parameterName": "gnUNFD16", "parameterType": "ENTITLEMENT", "statCycleId": "ECITro0v", "targetValue": 0.9204904811648402}, {"matcher": "EQUAL", "parameterName": "CIlGIB09", "parameterType": "STATISTIC_CYCLE", "statCycleId": "vNo1LyOJ", "targetValue": 0.32867574734882743}, {"matcher": "GREATER_THAN", "parameterName": "ybAcGM7n", "parameterType": "USERACCOUNT", "statCycleId": "Ym0iUUJV", "targetValue": 0.7222619351843478}]}], "rewards": [{"itemId": "JYsEjjAx", "itemName": "hZ8UmMpV", "qty": 0.5997957776782332, "type": "STATISTIC"}, {"itemId": "pyblop5H", "itemName": "8IBjfHTJ", "qty": 0.6964948043717741, "type": "ENTITLEMENT"}, {"itemId": "qfpMT9Ho", "itemName": "vIGyGdyO", "qty": 0.5072654885417842, "type": "ENTITLEMENT"}], "schedule": {"endTime": "1991-06-11T00:00:00Z", "order": 99, "startTime": "1989-07-21T00:00:00Z"}, "tags": ["KAT1oWcR", "OQUMiz00", "mrU8CueH"]}' \
    > test.out 2>&1
eval_tap $? 10 'AdminCreateGoal' test.out

#- 11 AdminGetGoal
./ng net.accelbyte.sdk.cli.Main challenge adminGetGoal \
    --challengeCode 'eLq8WsYK' \
    --code 'j1ATroMS' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 11 'AdminGetGoal' test.out

#- 12 AdminUpdateGoals
./ng net.accelbyte.sdk.cli.Main challenge adminUpdateGoals \
    --challengeCode 'gkK8mmAP' \
    --code 'ZItWZV9T' \
    --namespace "$AB_NAMESPACE" \
    --body '{"description": "Jcgj9RPh", "isActive": false, "name": "Wq2XQXQW", "requirementGroups": [{"operator": "AND", "predicates": [{"matcher": "LESS_THAN_EQUAL", "parameterName": "zOidqugr", "parameterType": "USERACCOUNT", "statCycleId": "5JDxVFmF", "targetValue": 0.9184647672007663}, {"matcher": "LESS_THAN", "parameterName": "DCj9Hnqz", "parameterType": "STATISTIC_CYCLE", "statCycleId": "irf53xjp", "targetValue": 0.33940425250010897}, {"matcher": "LESS_THAN_EQUAL", "parameterName": "gHuO1CbO", "parameterType": "STATISTIC", "statCycleId": "F65JlFHq", "targetValue": 0.6551498866256084}]}, {"operator": "AND", "predicates": [{"matcher": "LESS_THAN_EQUAL", "parameterName": "Z8uapQnj", "parameterType": "STATISTIC_CYCLE", "statCycleId": "DlR4Q7cp", "targetValue": 0.24500555484961128}, {"matcher": "EQUAL", "parameterName": "y85TalCN", "parameterType": "ACHIEVEMENT", "statCycleId": "wdyl4dK8", "targetValue": 0.8074258990780546}, {"matcher": "GREATER_THAN", "parameterName": "pG8WuQsv", "parameterType": "STATISTIC_CYCLE", "statCycleId": "V2OGQPRd", "targetValue": 0.8123179508338696}]}, {"operator": "AND", "predicates": [{"matcher": "EQUAL", "parameterName": "NAAkwprA", "parameterType": "USERACCOUNT", "statCycleId": "pK33aLr7", "targetValue": 0.972049709701312}, {"matcher": "GREATER_THAN_EQUAL", "parameterName": "gmwnTgfp", "parameterType": "STATISTIC_CYCLE", "statCycleId": "DfeARKO9", "targetValue": 0.36785490648983776}, {"matcher": "GREATER_THAN_EQUAL", "parameterName": "t3R3skbf", "parameterType": "ACHIEVEMENT", "statCycleId": "ALGvZ5ps", "targetValue": 0.447318436891429}]}], "rewards": [{"itemId": "GE0rnSnt", "itemName": "nSqrDxnM", "qty": 0.9852317839061958, "type": "STATISTIC"}, {"itemId": "TPVTyvEC", "itemName": "kJpIVSYk", "qty": 0.20629624223081477, "type": "ENTITLEMENT"}, {"itemId": "hVjAifcU", "itemName": "ZI2W46uY", "qty": 0.4307369721745169, "type": "ENTITLEMENT"}], "schedule": {"endTime": "1990-03-21T00:00:00Z", "order": 45, "startTime": "1990-06-23T00:00:00Z"}, "tags": ["BcQEYizo", "pZp7Uhlw", "h4lf20Ov"]}' \
    > test.out 2>&1
eval_tap $? 12 'AdminUpdateGoals' test.out

#- 13 AdminDeleteGoal
./ng net.accelbyte.sdk.cli.Main challenge adminDeleteGoal \
    --challengeCode 'hFqLN4C2' \
    --code 'zw1bOKk4' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 13 'AdminDeleteGoal' test.out

#- 14 AdminListSchedulesByGoal
./ng net.accelbyte.sdk.cli.Main challenge adminListSchedulesByGoal \
    --challengeCode 'wC59HUum' \
    --code 'xyb0FFbP' \
    --namespace "$AB_NAMESPACE" \
    --limit '98' \
    --offset '71' \
    --userId 'GL3ubFjO' \
    > test.out 2>&1
eval_tap $? 14 'AdminListSchedulesByGoal' test.out

#- 15 AdminGetPeriods
./ng net.accelbyte.sdk.cli.Main challenge adminGetPeriods \
    --challengeCode 'W07xtz0v' \
    --namespace "$AB_NAMESPACE" \
    --limit '51' \
    --offset '44' \
    > test.out 2>&1
eval_tap $? 15 'AdminGetPeriods' test.out

#- 16 AdminRandomizeChallenge
./ng net.accelbyte.sdk.cli.Main challenge adminRandomizeChallenge \
    --challengeCode 'XsyzVb2O' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 16 'AdminRandomizeChallenge' test.out

#- 17 AdminListSchedules
./ng net.accelbyte.sdk.cli.Main challenge adminListSchedules \
    --challengeCode 'J75U3lc7' \
    --namespace "$AB_NAMESPACE" \
    --dateTime '1975-03-18T00:00:00Z' \
    --limit '2' \
    --offset '22' \
    --userId 'qEPw6WAq' \
    > test.out 2>&1
eval_tap $? 17 'AdminListSchedules' test.out

#- 18 AdminDeleteTiedChallenge
./ng net.accelbyte.sdk.cli.Main challenge adminDeleteTiedChallenge \
    --challengeCode 'wrzZwWVm' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 18 'AdminDeleteTiedChallenge' test.out

#- 19 AdminUpdateTiedChallengeSchedule
./ng net.accelbyte.sdk.cli.Main challenge adminUpdateTiedChallengeSchedule \
    --challengeCode 'PwQhnEWz' \
    --namespace "$AB_NAMESPACE" \
    --body '{"action": "STOP", "endDate": "1998-04-10T00:00:00Z"}' \
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
    --body '{"appName": "YWbc5zuX", "extendType": "APP", "grpcServerAddress": "RLwLkVFG"}' \
    > test.out 2>&1
eval_tap $? 21 'AdminUpdateAssignmentPlugin' test.out

#- 22 AdminCreateAssignmentPlugin
./ng net.accelbyte.sdk.cli.Main challenge adminCreateAssignmentPlugin \
    --namespace "$AB_NAMESPACE" \
    --body '{"appName": "9DpDbkiK", "extendType": "CUSTOM", "grpcServerAddress": "FAU8mYOi"}' \
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
    --body '{"userIds": ["E60OXOjX", "69SpSvD0", "5rf0L1jF"]}' \
    > test.out 2>&1
eval_tap $? 24 'AdminEvaluateProgress' test.out

#- 25 AdminClaimUsersRewards
./ng net.accelbyte.sdk.cli.Main challenge adminClaimUsersRewards \
    --namespace "$AB_NAMESPACE" \
    --body '[{"rewardIds": ["2aKSJ2Me", "7OQ2ncpM", "OZuTuwQx"], "userId": "KHYTzkKE"}, {"rewardIds": ["RXbWnM9M", "zBxJJlWp", "G3OHoE0O"], "userId": "S65lzVlv"}, {"rewardIds": ["8UjnNiZt", "intGkQb5", "TOfy2vK0"], "userId": "pL6oESUy"}]' \
    > test.out 2>&1
eval_tap $? 25 'AdminClaimUsersRewards' test.out

#- 26 AdminClaimUserRewardsByGoalCode
./ng net.accelbyte.sdk.cli.Main challenge adminClaimUserRewardsByGoalCode \
    --challengeCode 'CDzWo3yN' \
    --namespace "$AB_NAMESPACE" \
    --userId 'IO5zOcuY' \
    --body '{"goalCode": "fHonVK77"}' \
    > test.out 2>&1
eval_tap $? 26 'AdminClaimUserRewardsByGoalCode' test.out

#- 27 AdminGetUserProgression
./ng net.accelbyte.sdk.cli.Main challenge adminGetUserProgression \
    --challengeCode 'TIBU8VkA' \
    --namespace "$AB_NAMESPACE" \
    --userId 'u4aXV0nn' \
    --dateTime '1975-05-22T00:00:00Z' \
    --goalCode 'U2VbcQ8d' \
    --limit '85' \
    --offset '61' \
    --tags 'NArg44uV,F6WRiaOf,ouy88cEq' \
    > test.out 2>&1
eval_tap $? 27 'AdminGetUserProgression' test.out

#- 28 AdminGetUserRewards
./ng net.accelbyte.sdk.cli.Main challenge adminGetUserRewards \
    --namespace "$AB_NAMESPACE" \
    --userId 'JooPtBct' \
    --challengeCode 'lEJ7ezZJ' \
    --goalProgressionId '6Dihr3oF' \
    --limit '9' \
    --offset '70' \
    --sortBy 'createdAt:desc' \
    --status 'CLAIMED' \
    > test.out 2>&1
eval_tap $? 28 'AdminGetUserRewards' test.out

#- 29 AdminClaimUserRewards
./ng net.accelbyte.sdk.cli.Main challenge adminClaimUserRewards \
    --namespace "$AB_NAMESPACE" \
    --userId 'T3iaf6YY' \
    --body '{"rewardIDs": ["KCZlXdaY", "vWXUKHiu", "Jx80JaIU"]}' \
    > test.out 2>&1
eval_tap $? 29 'AdminClaimUserRewards' test.out

#- 30 GetChallenges
./ng net.accelbyte.sdk.cli.Main challenge getChallenges \
    --namespace "$AB_NAMESPACE" \
    --keyword 'jaVbtTEd' \
    --limit '97' \
    --offset '92' \
    --sortBy 'createdAt:desc' \
    --status 'TIED' \
    --tags 'gFS7vJAb,68NbAchN,5U49aGko' \
    > test.out 2>&1
eval_tap $? 30 'GetChallenges' test.out

#- 31 PublicGetScheduledGoals
./ng net.accelbyte.sdk.cli.Main challenge publicGetScheduledGoals \
    --challengeCode '9IqStZmV' \
    --namespace "$AB_NAMESPACE" \
    --limit '40' \
    --offset '7' \
    --sortBy 'updatedAt:asc' \
    --tags 'JZ1peW6j,uZZgz9ke,DRfWjzXz' \
    > test.out 2>&1
eval_tap $? 31 'PublicGetScheduledGoals' test.out

#- 32 PublicListSchedulesByGoal
./ng net.accelbyte.sdk.cli.Main challenge publicListSchedulesByGoal \
    --challengeCode 'WniOFtcb' \
    --code 'EfU8tVtH' \
    --namespace "$AB_NAMESPACE" \
    --limit '94' \
    --offset '29' \
    > test.out 2>&1
eval_tap $? 32 'PublicListSchedulesByGoal' test.out

#- 33 PublicListSchedules
./ng net.accelbyte.sdk.cli.Main challenge publicListSchedules \
    --challengeCode 'IiTOz3tb' \
    --namespace "$AB_NAMESPACE" \
    --dateTime '1998-09-04T00:00:00Z' \
    --limit '29' \
    --offset '64' \
    > test.out 2>&1
eval_tap $? 33 'PublicListSchedules' test.out

#- 34 PublicClaimUserRewardsByGoalCode
./ng net.accelbyte.sdk.cli.Main challenge publicClaimUserRewardsByGoalCode \
    --challengeCode 'kf961Xz9' \
    --namespace "$AB_NAMESPACE" \
    --body '{"goalCode": "c5CZNpIH"}' \
    > test.out 2>&1
eval_tap $? 34 'PublicClaimUserRewardsByGoalCode' test.out

#- 35 EvaluateMyProgress
./ng net.accelbyte.sdk.cli.Main challenge evaluateMyProgress \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 35 'EvaluateMyProgress' test.out

#- 36 PublicGetUserProgression
./ng net.accelbyte.sdk.cli.Main challenge publicGetUserProgression \
    --challengeCode 'Ueetq7Cc' \
    --namespace "$AB_NAMESPACE" \
    --dateTime '1993-01-15T00:00:00Z' \
    --goalCode 'g8Kl8Mi4' \
    --limit '65' \
    --offset '20' \
    --tags 'O4SzqEQV,sBRRPQl0,MZuccaqq' \
    > test.out 2>&1
eval_tap $? 36 'PublicGetUserProgression' test.out

#- 37 PublicGetPastUserProgression
./ng net.accelbyte.sdk.cli.Main challenge publicGetPastUserProgression \
    --challengeCode '2YJQebdU' \
    --index '36' \
    --namespace "$AB_NAMESPACE" \
    --goalCode 'xrGRf6FG' \
    --limit '91' \
    --offset '3' \
    --tags 'ucUtsfFL,mywWSLCv,9AzPI8eA' \
    > test.out 2>&1
eval_tap $? 37 'PublicGetPastUserProgression' test.out

#- 38 PublicGetUserRewards
./ng net.accelbyte.sdk.cli.Main challenge publicGetUserRewards \
    --namespace "$AB_NAMESPACE" \
    --challengeCode 'ZpyNhAo2' \
    --goalProgressionId '4qDKgsFX' \
    --limit '30' \
    --offset '91' \
    --sortBy 'updatedAt:asc' \
    --status 'CLAIMED' \
    > test.out 2>&1
eval_tap $? 38 'PublicGetUserRewards' test.out

#- 39 PublicClaimUserRewards
./ng net.accelbyte.sdk.cli.Main challenge publicClaimUserRewards \
    --namespace "$AB_NAMESPACE" \
    --body '{"rewardIDs": ["WPl5k2Un", "LuNxM1cj", "0hVbyaaM"]}' \
    > test.out 2>&1
eval_tap $? 39 'PublicClaimUserRewards' test.out


rm -f "tmp.dat"

exit $EXIT_CODE