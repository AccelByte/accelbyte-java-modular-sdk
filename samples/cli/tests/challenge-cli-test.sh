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
    --keyword '0xErLDZI' \
    --limit '41' \
    --offset '72' \
    --sortBy 'createdAt' \
    --status 'TIED' \
    --tags 'FWjx4ai4,wlsE65q6,3MnvJlqA' \
    > test.out 2>&1
eval_tap $? 2 'AdminGetChallenges' test.out

#- 3 AdminCreateChallenge
./ng net.accelbyte.sdk.cli.Main challenge adminCreateChallenge \
    --namespace "$AB_NAMESPACE" \
    --body '{"activeGoalsPerRotation": 96, "assignmentRule": "FIXED", "code": "PyHauTGN", "description": "mPD5iMJx", "endAfter": 35, "endDate": "1995-10-26T00:00:00Z", "goalsVisibility": "SHOWALL", "name": "mhVlybsh", "randomizedPerRotation": true, "repeatAfter": 8, "resetConfig": {"resetDate": 64, "resetDay": 5, "resetTime": "7aWvtsdM"}, "rotation": "NONE", "startDate": "1982-02-28T00:00:00Z", "tags": ["6qxYRErF", "POskOOrC", "PPF9xSLW"]}' \
    > test.out 2>&1
eval_tap $? 3 'AdminCreateChallenge' test.out

#- 4 AdminGetItemReferences
./ng net.accelbyte.sdk.cli.Main challenge adminGetItemReferences \
    --namespace "$AB_NAMESPACE" \
    --itemId 'xKDSQkEt' \
    > test.out 2>&1
eval_tap $? 4 'AdminGetItemReferences' test.out

#- 5 AdminGetActiveChallenges
./ng net.accelbyte.sdk.cli.Main challenge adminGetActiveChallenges \
    --namespace "$AB_NAMESPACE" \
    --userId '2xpIs4Y5' \
    --limit '2' \
    --offset '30' \
    > test.out 2>&1
eval_tap $? 5 'AdminGetActiveChallenges' test.out

#- 6 AdminGetChallenge
./ng net.accelbyte.sdk.cli.Main challenge adminGetChallenge \
    --challengeCode 'DOC4H6jt' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 6 'AdminGetChallenge' test.out

#- 7 AdminUpdateChallenge
./ng net.accelbyte.sdk.cli.Main challenge adminUpdateChallenge \
    --challengeCode 'HqSuv8Im' \
    --namespace "$AB_NAMESPACE" \
    --body '{"activeGoalsPerRotation": 77, "assignmentRule": "RANDOMIZED", "description": "zX5JTt0X", "endAfter": 42, "endDate": "1977-03-16T00:00:00Z", "goalsVisibility": "PERIODONLY", "name": "DWf5GXSq", "randomizedPerRotation": false, "repeatAfter": 24, "resetConfig": {"resetDate": 95, "resetDay": 70, "resetTime": "FJfRZtSz"}, "rotation": "MONTHLY", "startDate": "1990-09-06T00:00:00Z", "tags": ["wrz3ajSw", "TyXzGt9L", "Tq6K8yvN"]}' \
    > test.out 2>&1
eval_tap $? 7 'AdminUpdateChallenge' test.out

#- 8 AdminDeleteChallenge
./ng net.accelbyte.sdk.cli.Main challenge adminDeleteChallenge \
    --challengeCode 'XUQgRD7q' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 8 'AdminDeleteChallenge' test.out

#- 9 AdminGetGoals
./ng net.accelbyte.sdk.cli.Main challenge adminGetGoals \
    --challengeCode 'iTD23AeA' \
    --namespace "$AB_NAMESPACE" \
    --limit '4' \
    --offset '98' \
    --sortBy 'createdAt:asc' \
    --tags 'zp5t3oT7,Ltc5r9Bf,cAQgTD2Q' \
    > test.out 2>&1
eval_tap $? 9 'AdminGetGoals' test.out

#- 10 AdminCreateGoal
./ng net.accelbyte.sdk.cli.Main challenge adminCreateGoal \
    --challengeCode '8SjaHsvI' \
    --namespace "$AB_NAMESPACE" \
    --body '{"code": "8BbZB1ON", "description": "cKN8byoh", "isActive": false, "name": "OiebD9Ak", "requirementGroups": [{"operator": "AND", "predicates": [{"id": "1LBoeIig", "matcher": "LESS_THAN", "parameterName": "5tTOt0RD", "parameterType": "STATISTIC", "statCycleId": "OGsIsJDA", "targetValue": 0.7279956765857801}, {"id": "vDvgj6id", "matcher": "GREATER_THAN", "parameterName": "MY7d1Gyt", "parameterType": "ACHIEVEMENT", "statCycleId": "jHA3DEgj", "targetValue": 0.40368721757784387}, {"id": "GyUYP9Ft", "matcher": "GREATER_THAN_EQUAL", "parameterName": "ZbTZmL6E", "parameterType": "ACHIEVEMENT", "statCycleId": "enyrgcsn", "targetValue": 0.2768920251372031}]}, {"operator": "AND", "predicates": [{"id": "dTiLG4NW", "matcher": "GREATER_THAN_EQUAL", "parameterName": "W9LwLllP", "parameterType": "ENTITLEMENT", "statCycleId": "pSEcRRwl", "targetValue": 0.763034889226243}, {"id": "YjXhdGTz", "matcher": "GREATER_THAN_EQUAL", "parameterName": "wsoI5aXh", "parameterType": "STATISTIC", "statCycleId": "vv7m51NO", "targetValue": 0.016396841162694464}, {"id": "ey3Z6EPP", "matcher": "LESS_THAN_EQUAL", "parameterName": "9DRbp9F1", "parameterType": "ENTITLEMENT", "statCycleId": "UYU5RLaY", "targetValue": 0.7475472393665314}]}, {"operator": "AND", "predicates": [{"id": "Yh3ah83d", "matcher": "LESS_THAN_EQUAL", "parameterName": "tvXDxABz", "parameterType": "STATISTIC_CYCLE", "statCycleId": "aUbjpggd", "targetValue": 0.7121063159156528}, {"id": "O7xKu5FK", "matcher": "LESS_THAN", "parameterName": "bU4IrnqB", "parameterType": "STATISTIC_CYCLE", "statCycleId": "kmw3X1mz", "targetValue": 0.9678378073288798}, {"id": "QAoPhk8b", "matcher": "GREATER_THAN", "parameterName": "lNg3nmdC", "parameterType": "STATISTIC_CYCLE", "statCycleId": "elrsxpxO", "targetValue": 0.7056999120346513}]}], "rewards": [{"itemId": "hKqS19Wy", "itemName": "9KeEFuLV", "qty": 0.5137724147191467, "type": "ENTITLEMENT"}, {"itemId": "ubaqmyji", "itemName": "6RntO3qa", "qty": 0.9191122791965275, "type": "ENTITLEMENT"}, {"itemId": "0YSM4RWH", "itemName": "e3eb5PQf", "qty": 0.4583928269115608, "type": "STATISTIC"}], "schedule": {"endTime": "1973-07-18T00:00:00Z", "order": 69, "startTime": "1974-11-09T00:00:00Z"}, "tags": ["eMfBFAlO", "4UcT5JMf", "gzmKr8mR"]}' \
    > test.out 2>&1
eval_tap $? 10 'AdminCreateGoal' test.out

#- 11 AdminGetGoal
./ng net.accelbyte.sdk.cli.Main challenge adminGetGoal \
    --challengeCode 'sVnfHrcc' \
    --code 'RPCcH81W' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 11 'AdminGetGoal' test.out

#- 12 AdminUpdateGoals
./ng net.accelbyte.sdk.cli.Main challenge adminUpdateGoals \
    --challengeCode 'xzgF4iLS' \
    --code 'bYy0Glhs' \
    --namespace "$AB_NAMESPACE" \
    --body '{"description": "oAHc12AF", "isActive": false, "name": "BJNZxcpl", "requirementGroups": [{"operator": "AND", "predicates": [{"id": "wr8vAOkq", "matcher": "LESS_THAN_EQUAL", "parameterName": "20Jb0qDs", "parameterType": "STATISTIC", "statCycleId": "eGdfkozB", "targetValue": 0.8545550299271105}, {"id": "kRukoJJu", "matcher": "LESS_THAN_EQUAL", "parameterName": "cv1Fhp3B", "parameterType": "STATISTIC_CYCLE", "statCycleId": "C20Zb2qk", "targetValue": 0.8814408174963335}, {"id": "QMrQQ1qF", "matcher": "GREATER_THAN", "parameterName": "olLyyfGf", "parameterType": "STATISTIC_CYCLE", "statCycleId": "tHMMa10A", "targetValue": 0.0185100238643634}]}, {"operator": "AND", "predicates": [{"id": "aedsbEGK", "matcher": "LESS_THAN", "parameterName": "cKApdlif", "parameterType": "STATISTIC", "statCycleId": "DT3mVcdE", "targetValue": 0.5532206516893736}, {"id": "IdsO6CKX", "matcher": "EQUAL", "parameterName": "YX3GmABH", "parameterType": "USERACCOUNT", "statCycleId": "k0a3Bc0L", "targetValue": 0.027893702601848314}, {"id": "VrnjVkVs", "matcher": "EQUAL", "parameterName": "9BXdBBNK", "parameterType": "STATISTIC", "statCycleId": "Xq8cbCvG", "targetValue": 0.8293492375845538}]}, {"operator": "AND", "predicates": [{"id": "HiG6iEoq", "matcher": "LESS_THAN", "parameterName": "sSuacmft", "parameterType": "STATISTIC_CYCLE", "statCycleId": "9dmHKk0Y", "targetValue": 0.18405834303554303}, {"id": "YFaayg9r", "matcher": "LESS_THAN", "parameterName": "oBDIemcn", "parameterType": "USERACCOUNT", "statCycleId": "ak71mkWB", "targetValue": 0.4580970335013662}, {"id": "3IreiU6K", "matcher": "GREATER_THAN_EQUAL", "parameterName": "PC7vL6qK", "parameterType": "USERACCOUNT", "statCycleId": "WV7RdpCO", "targetValue": 0.3371633035260051}]}], "rewards": [{"itemId": "kLrVZUUN", "itemName": "7DpZ0KTa", "qty": 0.07724419639582447, "type": "STATISTIC"}, {"itemId": "MPvUAsBl", "itemName": "lv73ADbL", "qty": 0.36324372505397495, "type": "STATISTIC"}, {"itemId": "lkqM2Wg7", "itemName": "eqFcZRcv", "qty": 0.9682100721847141, "type": "STATISTIC"}], "schedule": {"endTime": "1980-01-15T00:00:00Z", "order": 36, "startTime": "1995-05-17T00:00:00Z"}, "tags": ["OGbQ8HQY", "tw6KvIXD", "nJGxg4C4"]}' \
    > test.out 2>&1
eval_tap $? 12 'AdminUpdateGoals' test.out

#- 13 AdminDeleteGoal
./ng net.accelbyte.sdk.cli.Main challenge adminDeleteGoal \
    --challengeCode 'Z9mBrfhh' \
    --code 'yfPQufZn' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 13 'AdminDeleteGoal' test.out

#- 14 AdminListSchedulesByGoal
./ng net.accelbyte.sdk.cli.Main challenge adminListSchedulesByGoal \
    --challengeCode 'AOQATIEh' \
    --code '19FOaVDk' \
    --namespace "$AB_NAMESPACE" \
    --limit '23' \
    --offset '49' \
    --userId 'iwscPvZH' \
    > test.out 2>&1
eval_tap $? 14 'AdminListSchedulesByGoal' test.out

#- 15 AdminGetPeriods
./ng net.accelbyte.sdk.cli.Main challenge adminGetPeriods \
    --challengeCode 'kTXEecLm' \
    --namespace "$AB_NAMESPACE" \
    --limit '61' \
    --offset '38' \
    > test.out 2>&1
eval_tap $? 15 'AdminGetPeriods' test.out

#- 16 AdminRandomizeChallenge
./ng net.accelbyte.sdk.cli.Main challenge adminRandomizeChallenge \
    --challengeCode 'y5v0ZCEc' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 16 'AdminRandomizeChallenge' test.out

#- 17 AdminListSchedules
./ng net.accelbyte.sdk.cli.Main challenge adminListSchedules \
    --challengeCode 'F8OaSNbT' \
    --namespace "$AB_NAMESPACE" \
    --dateTime '1981-07-18T00:00:00Z' \
    --limit '20' \
    --offset '97' \
    --userId 'u1noSEve' \
    > test.out 2>&1
eval_tap $? 17 'AdminListSchedules' test.out

#- 18 AdminDeleteTiedChallenge
./ng net.accelbyte.sdk.cli.Main challenge adminDeleteTiedChallenge \
    --challengeCode 'B3m2JjrQ' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 18 'AdminDeleteTiedChallenge' test.out

#- 19 AdminUpdateTiedChallengeSchedule
./ng net.accelbyte.sdk.cli.Main challenge adminUpdateTiedChallengeSchedule \
    --challengeCode 'H09WbGh2' \
    --namespace "$AB_NAMESPACE" \
    --body '{"action": "ACCELERATE", "endDate": "1996-10-27T00:00:00Z"}' \
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
    --body '{"appName": "nuldogRD", "extendType": "CUSTOM", "grpcServerAddress": "H6XGbjcv"}' \
    > test.out 2>&1
eval_tap $? 21 'AdminUpdateAssignmentPlugin' test.out

#- 22 AdminCreateAssignmentPlugin
./ng net.accelbyte.sdk.cli.Main challenge adminCreateAssignmentPlugin \
    --namespace "$AB_NAMESPACE" \
    --body '{"appName": "dKDweS3X", "extendType": "CUSTOM", "grpcServerAddress": "V9cJXUFR"}' \
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
    --challengeCode 'AZbNbkZc,5DgaCwbT,5fHSjhp1' \
    --body '{"userIds": ["NIpPFKxh", "pDOCiuRL", "2W7AYCZr"]}' \
    > test.out 2>&1
eval_tap $? 24 'AdminEvaluateProgress' test.out

#- 25 AdminClaimUsersRewards
./ng net.accelbyte.sdk.cli.Main challenge adminClaimUsersRewards \
    --namespace "$AB_NAMESPACE" \
    --body '[{"rewardIds": ["AzN5p8Tn", "jWndYDJK", "ZsLEsp47"], "userId": "Jvsxkcoe"}, {"rewardIds": ["8f7CfN87", "JI2hS5j3", "cG5OxJ4m"], "userId": "BIWO8iO5"}, {"rewardIds": ["roRfCyBf", "QaeD499k", "J2c1hRtj"], "userId": "jnXLffu5"}]' \
    > test.out 2>&1
eval_tap $? 25 'AdminClaimUsersRewards' test.out

#- 26 AdminClaimUserRewardsByGoalCode
./ng net.accelbyte.sdk.cli.Main challenge adminClaimUserRewardsByGoalCode \
    --challengeCode 'ApjqUJ31' \
    --namespace "$AB_NAMESPACE" \
    --userId 'mi4zOabu' \
    --body '{"goalCode": "oY8cMSLO"}' \
    > test.out 2>&1
eval_tap $? 26 'AdminClaimUserRewardsByGoalCode' test.out

#- 27 AdminGetUserProgression
./ng net.accelbyte.sdk.cli.Main challenge adminGetUserProgression \
    --challengeCode 'tfusjWiU' \
    --namespace "$AB_NAMESPACE" \
    --userId 'uXzV8e7K' \
    --dateTime '1981-05-05T00:00:00Z' \
    --goalCode 'cAmO6Zpw' \
    --limit '39' \
    --offset '41' \
    --tags 'WNXh0cTD,zsc1m2nn,D0Aj4Qev' \
    > test.out 2>&1
eval_tap $? 27 'AdminGetUserProgression' test.out

#- 28 AdminGetUserRewards
./ng net.accelbyte.sdk.cli.Main challenge adminGetUserRewards \
    --namespace "$AB_NAMESPACE" \
    --userId 'MpyxS5Nd' \
    --challengeCode 'nMGAj2eM' \
    --goalProgressionId '2Lpc5tW2' \
    --limit '15' \
    --offset '9' \
    --sortBy 'updatedAt:asc' \
    --status 'CLAIMED' \
    > test.out 2>&1
eval_tap $? 28 'AdminGetUserRewards' test.out

#- 29 AdminClaimUserRewards
./ng net.accelbyte.sdk.cli.Main challenge adminClaimUserRewards \
    --namespace "$AB_NAMESPACE" \
    --userId '6NThI6fV' \
    --body '{"rewardIDs": ["t8b5jJOj", "mYuSeNe3", "UWTSJ3RC"]}' \
    > test.out 2>&1
eval_tap $? 29 'AdminClaimUserRewards' test.out

#- 30 GetChallenges
./ng net.accelbyte.sdk.cli.Main challenge getChallenges \
    --namespace "$AB_NAMESPACE" \
    --keyword 'BLXYe4zw' \
    --limit '22' \
    --offset '84' \
    --sortBy 'createdAt' \
    --status 'TIED' \
    --tags 'E1Mybk3P,IsKlMiUD,hJIgLS3o' \
    > test.out 2>&1
eval_tap $? 30 'GetChallenges' test.out

#- 31 PublicGetScheduledGoals
./ng net.accelbyte.sdk.cli.Main challenge publicGetScheduledGoals \
    --challengeCode 'XVHpm9S2' \
    --namespace "$AB_NAMESPACE" \
    --limit '88' \
    --offset '8' \
    --sortBy 'createdAt:desc' \
    --tags '8Plk1OWU,NejNERtJ,HxrQt6Ce' \
    > test.out 2>&1
eval_tap $? 31 'PublicGetScheduledGoals' test.out

#- 32 PublicListSchedulesByGoal
./ng net.accelbyte.sdk.cli.Main challenge publicListSchedulesByGoal \
    --challengeCode 'qAN3kQhh' \
    --code 'amB3xi5Q' \
    --namespace "$AB_NAMESPACE" \
    --limit '21' \
    --offset '10' \
    > test.out 2>&1
eval_tap $? 32 'PublicListSchedulesByGoal' test.out

#- 33 PublicListSchedules
./ng net.accelbyte.sdk.cli.Main challenge publicListSchedules \
    --challengeCode 'k0PTPfPm' \
    --namespace "$AB_NAMESPACE" \
    --dateTime '1988-09-04T00:00:00Z' \
    --limit '28' \
    --offset '100' \
    > test.out 2>&1
eval_tap $? 33 'PublicListSchedules' test.out

#- 34 PublicClaimUserRewardsByGoalCode
./ng net.accelbyte.sdk.cli.Main challenge publicClaimUserRewardsByGoalCode \
    --challengeCode 'tenJT1V4' \
    --namespace "$AB_NAMESPACE" \
    --body '{"goalCode": "PDrS4b31"}' \
    > test.out 2>&1
eval_tap $? 34 'PublicClaimUserRewardsByGoalCode' test.out

#- 35 EvaluateMyProgress
./ng net.accelbyte.sdk.cli.Main challenge evaluateMyProgress \
    --namespace "$AB_NAMESPACE" \
    --challengeCode 'kfNWkgOZ,HkIalair,Xwei8Afw' \
    > test.out 2>&1
eval_tap $? 35 'EvaluateMyProgress' test.out

#- 36 PublicGetUserProgression
./ng net.accelbyte.sdk.cli.Main challenge publicGetUserProgression \
    --challengeCode 'jQACSEKB' \
    --namespace "$AB_NAMESPACE" \
    --dateTime '1973-06-07T00:00:00Z' \
    --goalCode 'hLRyBb33' \
    --limit '96' \
    --offset '8' \
    --tags '3ppVVBbI,780M8mWM,EV8KEC3h' \
    > test.out 2>&1
eval_tap $? 36 'PublicGetUserProgression' test.out

#- 37 PublicGetPastUserProgression
./ng net.accelbyte.sdk.cli.Main challenge publicGetPastUserProgression \
    --challengeCode 'MogFXrn4' \
    --index '61' \
    --namespace "$AB_NAMESPACE" \
    --goalCode 'jGiJF6Si' \
    --limit '18' \
    --offset '55' \
    --tags 'GAIgYlHy,3qQYFOu9,b2ywYM8e' \
    > test.out 2>&1
eval_tap $? 37 'PublicGetPastUserProgression' test.out

#- 38 PublicGetUserRewards
./ng net.accelbyte.sdk.cli.Main challenge publicGetUserRewards \
    --namespace "$AB_NAMESPACE" \
    --challengeCode 'PvC6fSWf' \
    --goalProgressionId 'mVZqzrMw' \
    --limit '99' \
    --offset '10' \
    --sortBy 'createdAt:asc' \
    --status 'UNCLAIMED' \
    > test.out 2>&1
eval_tap $? 38 'PublicGetUserRewards' test.out

#- 39 PublicClaimUserRewards
./ng net.accelbyte.sdk.cli.Main challenge publicClaimUserRewards \
    --namespace "$AB_NAMESPACE" \
    --body '{"rewardIDs": ["zbIFmFCn", "4MjJCYa1", "Joz9W2M6"]}' \
    > test.out 2>&1
eval_tap $? 39 'PublicClaimUserRewards' test.out


rm -f "tmp.dat"

exit $EXIT_CODE