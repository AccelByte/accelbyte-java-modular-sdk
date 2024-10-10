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
    --limit '91' \
    --offset '0' \
    --sortBy 'SZPU0xwD' \
    --status 'RETIRED' \
    > test.out 2>&1
eval_tap $? 2 'AdminGetChallenges' test.out

#- 3 AdminCreateChallenge
./ng net.accelbyte.sdk.cli.Main challenge adminCreateChallenge \
    --namespace "$AB_NAMESPACE" \
    --body '{"activeGoalsPerRotation": 79, "assignmentRule": "UNSCHEDULED", "code": "s9JzEbFq", "description": "5KSPD2dU", "endAfter": 78, "endDate": "1973-10-05T00:00:00Z", "goalsVisibility": "PERIODONLY", "name": "kdfVR7R2", "randomizedPerRotation": true, "repeatAfter": 60, "resetConfig": {"resetDate": 67, "resetDay": 61, "resetTime": "vRzvetlf"}, "rotation": "MONTHLY", "startDate": "1972-10-15T00:00:00Z"}' \
    > test.out 2>&1
eval_tap $? 3 'AdminCreateChallenge' test.out

#- 4 AdminGetActiveChallenges
./ng net.accelbyte.sdk.cli.Main challenge adminGetActiveChallenges \
    --namespace "$AB_NAMESPACE" \
    --userId 'U3B1AZUl' \
    --limit '64' \
    --offset '21' \
    > test.out 2>&1
eval_tap $? 4 'AdminGetActiveChallenges' test.out

#- 5 AdminGetChallenge
./ng net.accelbyte.sdk.cli.Main challenge adminGetChallenge \
    --challengeCode '5qAJiBuW' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 5 'AdminGetChallenge' test.out

#- 6 AdminUpdateChallenge
./ng net.accelbyte.sdk.cli.Main challenge adminUpdateChallenge \
    --challengeCode 'dIU3sz6Z' \
    --namespace "$AB_NAMESPACE" \
    --body '{"activeGoalsPerRotation": 80, "assignmentRule": "UNSCHEDULED", "description": "8aOh7vgm", "endAfter": 43, "endDate": "1975-08-11T00:00:00Z", "goalsVisibility": "SHOWALL", "name": "RRcTegtX", "randomizedPerRotation": false, "repeatAfter": 91, "resetConfig": {"resetDate": 26, "resetDay": 1, "resetTime": "GSUu8PJj"}, "rotation": "WEEKLY", "startDate": "1995-05-04T00:00:00Z"}' \
    > test.out 2>&1
eval_tap $? 6 'AdminUpdateChallenge' test.out

#- 7 AdminDeleteChallenge
./ng net.accelbyte.sdk.cli.Main challenge adminDeleteChallenge \
    --challengeCode 'r7dRreek' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 7 'AdminDeleteChallenge' test.out

#- 8 AdminGetGoals
./ng net.accelbyte.sdk.cli.Main challenge adminGetGoals \
    --challengeCode 'DJTBoEC3' \
    --namespace "$AB_NAMESPACE" \
    --limit '3' \
    --offset '93' \
    --sortBy 'X291n7zU' \
    > test.out 2>&1
eval_tap $? 8 'AdminGetGoals' test.out

#- 9 AdminCreateGoal
./ng net.accelbyte.sdk.cli.Main challenge adminCreateGoal \
    --challengeCode 'w3ElmUmY' \
    --namespace "$AB_NAMESPACE" \
    --body '{"code": "pDWkgfVj", "description": "9TSXcs0Y", "isActive": false, "name": "l4mKs7X2", "requirementGroups": [{"operator": "AND", "predicates": [{"matcher": "GREATER_THAN_EQUAL", "parameterName": "PK67w0EK", "parameterType": "STATISTIC", "statCycleId": "XqcBZx48", "targetValue": 0.6967897700102009}, {"matcher": "EQUAL", "parameterName": "gExBqq7w", "parameterType": "ENTITLEMENT", "statCycleId": "ABleapK5", "targetValue": 0.6090578714771208}, {"matcher": "EQUAL", "parameterName": "yMX6sxY0", "parameterType": "STATISTIC_CYCLE", "statCycleId": "c0gr93BV", "targetValue": 0.8622670971090799}]}, {"operator": "AND", "predicates": [{"matcher": "GREATER_THAN", "parameterName": "loKkVvR1", "parameterType": "STATISTIC", "statCycleId": "JDqi0fdv", "targetValue": 0.5638254147513483}, {"matcher": "LESS_THAN_EQUAL", "parameterName": "UumeDidq", "parameterType": "STATISTIC", "statCycleId": "czL22f06", "targetValue": 0.9440331649122362}, {"matcher": "EQUAL", "parameterName": "o8lSuwHH", "parameterType": "ENTITLEMENT", "statCycleId": "9WA5quNJ", "targetValue": 0.3137699518061138}]}, {"operator": "AND", "predicates": [{"matcher": "GREATER_THAN_EQUAL", "parameterName": "TZvzuKEu", "parameterType": "STATISTIC_CYCLE", "statCycleId": "KGacV1zX", "targetValue": 0.26473060885460054}, {"matcher": "LESS_THAN", "parameterName": "S3CK5xV0", "parameterType": "STATISTIC_CYCLE", "statCycleId": "pmH9Xkgr", "targetValue": 0.14421206110241425}, {"matcher": "LESS_THAN", "parameterName": "mRblAN0o", "parameterType": "USERACCOUNT", "statCycleId": "SdOVzua4", "targetValue": 0.76628980970487}]}], "rewards": [{"itemId": "e0C8OISh", "itemName": "HkkkKott", "qty": 0.7301300452561961, "type": "ENTITLEMENT"}, {"itemId": "vEt5wVHB", "itemName": "zoKquftF", "qty": 0.26357008602147447, "type": "ENTITLEMENT"}, {"itemId": "LluoR9EM", "itemName": "tEjrO94y", "qty": 0.16847642925760686, "type": "ENTITLEMENT"}], "schedule": {"endTime": "1989-07-16T00:00:00Z", "order": 6, "startTime": "1982-08-05T00:00:00Z"}, "tags": ["fPrlfoIL", "lknvtqAr", "GVsbc4zl"]}' \
    > test.out 2>&1
eval_tap $? 9 'AdminCreateGoal' test.out

#- 10 AdminGetGoal
./ng net.accelbyte.sdk.cli.Main challenge adminGetGoal \
    --challengeCode 'dZ1FchVL' \
    --code 'C9ZoNKFL' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 10 'AdminGetGoal' test.out

#- 11 AdminUpdateGoals
./ng net.accelbyte.sdk.cli.Main challenge adminUpdateGoals \
    --challengeCode 'UhEu25GI' \
    --code 'gpmZxCiP' \
    --namespace "$AB_NAMESPACE" \
    --body '{"description": "mu2QQCre", "isActive": false, "name": "FzMWtawP", "requirementGroups": [{"operator": "AND", "predicates": [{"matcher": "LESS_THAN_EQUAL", "parameterName": "FBeE0dwT", "parameterType": "USERACCOUNT", "statCycleId": "cR6w5GwA", "targetValue": 0.829898625569139}, {"matcher": "EQUAL", "parameterName": "ohj71kjb", "parameterType": "USERACCOUNT", "statCycleId": "C5wwkEwD", "targetValue": 0.14720554265193364}, {"matcher": "LESS_THAN", "parameterName": "5VWmfAdr", "parameterType": "ENTITLEMENT", "statCycleId": "2oZYoxxo", "targetValue": 0.23422346060089927}]}, {"operator": "AND", "predicates": [{"matcher": "GREATER_THAN", "parameterName": "EEvS42P2", "parameterType": "STATISTIC_CYCLE", "statCycleId": "MgEKv8bG", "targetValue": 0.24411759278224854}, {"matcher": "EQUAL", "parameterName": "q04HcBtY", "parameterType": "STATISTIC", "statCycleId": "mygHfLTD", "targetValue": 0.3954427935591457}, {"matcher": "LESS_THAN_EQUAL", "parameterName": "7n1Ixi02", "parameterType": "USERACCOUNT", "statCycleId": "qtZWdzwH", "targetValue": 0.6191223628439015}]}, {"operator": "AND", "predicates": [{"matcher": "GREATER_THAN_EQUAL", "parameterName": "H9CUx6WP", "parameterType": "USERACCOUNT", "statCycleId": "jt1wcevm", "targetValue": 0.567385084498423}, {"matcher": "GREATER_THAN", "parameterName": "oxHsqvmW", "parameterType": "ACHIEVEMENT", "statCycleId": "jKE8YHpq", "targetValue": 0.5532409909045046}, {"matcher": "EQUAL", "parameterName": "q4b1LL4y", "parameterType": "ENTITLEMENT", "statCycleId": "7qQ1deuM", "targetValue": 0.3248622385060378}]}], "rewards": [{"itemId": "jQ9xxvIL", "itemName": "hayIPJgX", "qty": 0.6378831422553141, "type": "ENTITLEMENT"}, {"itemId": "EHleHGPx", "itemName": "JnuiWyxs", "qty": 0.97444061344717, "type": "ENTITLEMENT"}, {"itemId": "ex0brYcD", "itemName": "gfjelWiI", "qty": 0.29075711031910056, "type": "ENTITLEMENT"}], "schedule": {"endTime": "1978-12-30T00:00:00Z", "order": 24, "startTime": "1981-06-25T00:00:00Z"}, "tags": ["NIgb4nY0", "qp4oQYmP", "G19hpJjE"]}' \
    > test.out 2>&1
eval_tap $? 11 'AdminUpdateGoals' test.out

#- 12 AdminDeleteGoal
./ng net.accelbyte.sdk.cli.Main challenge adminDeleteGoal \
    --challengeCode 'Iq21P5bM' \
    --code '5agAN90Q' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 12 'AdminDeleteGoal' test.out

#- 13 AdminGetPeriods
./ng net.accelbyte.sdk.cli.Main challenge adminGetPeriods \
    --challengeCode 'IrZK7tAY' \
    --namespace "$AB_NAMESPACE" \
    --limit '60' \
    --offset '98' \
    > test.out 2>&1
eval_tap $? 13 'AdminGetPeriods' test.out

#- 14 AdminRandomizeChallenge
./ng net.accelbyte.sdk.cli.Main challenge adminRandomizeChallenge \
    --challengeCode 'YDnUFk6Z' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 14 'AdminRandomizeChallenge' test.out

#- 15 AdminDeleteTiedChallenge
./ng net.accelbyte.sdk.cli.Main challenge adminDeleteTiedChallenge \
    --challengeCode 'cP4jjRvc' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 15 'AdminDeleteTiedChallenge' test.out

#- 16 AdminUpdateTiedChallengeSchedule
./ng net.accelbyte.sdk.cli.Main challenge adminUpdateTiedChallengeSchedule \
    --challengeCode 'DbCnxss7' \
    --namespace "$AB_NAMESPACE" \
    --body '{"action": "ACCELERATE", "endDate": "1993-09-15T00:00:00Z"}' \
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
    --body '{"appName": "mbpDp7iC", "extendType": "CUSTOM", "grpcServerAddress": "I1G2iUsZ"}' \
    > test.out 2>&1
eval_tap $? 18 'AdminUpdateAssignmentPlugin' test.out

#- 19 AdminCreateAssignmentPlugin
./ng net.accelbyte.sdk.cli.Main challenge adminCreateAssignmentPlugin \
    --namespace "$AB_NAMESPACE" \
    --body '{"appName": "oI1i8mOy", "extendType": "CUSTOM", "grpcServerAddress": "421eJqeg"}' \
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
    --body '{"userIds": ["IGMzApew", "ikiWXXs2", "M7lCxaWP"]}' \
    > test.out 2>&1
eval_tap $? 21 'AdminEvaluateProgress' test.out

#- 22 AdminClaimUsersRewards
./ng net.accelbyte.sdk.cli.Main challenge adminClaimUsersRewards \
    --namespace "$AB_NAMESPACE" \
    --body '[{"rewardIds": ["H9sTJtxM", "gghSasq7", "Cgvsqrtr"], "userId": "ISrUqpOW"}, {"rewardIds": ["UZPIOOHW", "p3I6vym0", "MqMu7tcE"], "userId": "Lm7rzRKh"}, {"rewardIds": ["4hnvzpxS", "S5ZZInIA", "xKrO2vzP"], "userId": "J17RKhap"}]' \
    > test.out 2>&1
eval_tap $? 22 'AdminClaimUsersRewards' test.out

#- 23 AdminClaimUserRewardsByGoalCode
./ng net.accelbyte.sdk.cli.Main challenge adminClaimUserRewardsByGoalCode \
    --challengeCode 'HPygzKfF' \
    --namespace "$AB_NAMESPACE" \
    --userId 'aE4FLYjd' \
    --body '{"goalCode": "E5GVnQlZ"}' \
    > test.out 2>&1
eval_tap $? 23 'AdminClaimUserRewardsByGoalCode' test.out

#- 24 AdminGetUserProgression
./ng net.accelbyte.sdk.cli.Main challenge adminGetUserProgression \
    --challengeCode 'yhNi0PZw' \
    --namespace "$AB_NAMESPACE" \
    --userId 'WWflqT9h' \
    --dateTime '1973-11-19T00:00:00Z' \
    --goalCode 'aPwE6LDn' \
    --limit '60' \
    --offset '52' \
    --tags 'zqMi9Q7f,F0wRB4BU,pMGOOQiD' \
    > test.out 2>&1
eval_tap $? 24 'AdminGetUserProgression' test.out

#- 25 AdminGetUserRewards
./ng net.accelbyte.sdk.cli.Main challenge adminGetUserRewards \
    --namespace "$AB_NAMESPACE" \
    --userId 'DfHCTsdI' \
    --limit '51' \
    --offset '11' \
    --sortBy 'lh1jBT4B' \
    --status 'UNCLAIMED' \
    > test.out 2>&1
eval_tap $? 25 'AdminGetUserRewards' test.out

#- 26 AdminClaimUserRewards
./ng net.accelbyte.sdk.cli.Main challenge adminClaimUserRewards \
    --namespace "$AB_NAMESPACE" \
    --userId '0Mk1GnR0' \
    --body '{"rewardIDs": ["cAIaK2E0", "US2bRJwi", "xTTf8Nwe"]}' \
    > test.out 2>&1
eval_tap $? 26 'AdminClaimUserRewards' test.out

#- 27 GetChallenges
./ng net.accelbyte.sdk.cli.Main challenge getChallenges \
    --namespace "$AB_NAMESPACE" \
    --limit '58' \
    --offset '92' \
    --sortBy 'xYCvmr0G' \
    --status 'INIT' \
    > test.out 2>&1
eval_tap $? 27 'GetChallenges' test.out

#- 28 PublicGetScheduledGoals
./ng net.accelbyte.sdk.cli.Main challenge publicGetScheduledGoals \
    --challengeCode '7Xic2TpZ' \
    --namespace "$AB_NAMESPACE" \
    --limit '73' \
    --offset '97' \
    --tags 'onHMwcy7,6NG5g2JX,pmCYjaTg' \
    > test.out 2>&1
eval_tap $? 28 'PublicGetScheduledGoals' test.out

#- 29 PublicClaimUserRewardsByGoalCode
./ng net.accelbyte.sdk.cli.Main challenge publicClaimUserRewardsByGoalCode \
    --challengeCode 'oMEKxR6t' \
    --namespace "$AB_NAMESPACE" \
    --body '{"goalCode": "5G9qhB4S"}' \
    > test.out 2>&1
eval_tap $? 29 'PublicClaimUserRewardsByGoalCode' test.out

#- 30 EvaluateMyProgress
./ng net.accelbyte.sdk.cli.Main challenge evaluateMyProgress \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 30 'EvaluateMyProgress' test.out

#- 31 PublicGetUserProgression
./ng net.accelbyte.sdk.cli.Main challenge publicGetUserProgression \
    --challengeCode '9Z90ZCo2' \
    --namespace "$AB_NAMESPACE" \
    --dateTime '1992-07-22T00:00:00Z' \
    --goalCode 'KuATNu0s' \
    --limit '46' \
    --offset '3' \
    --tags 'RCor0k3p,REAwB7rA,sGZc4C1d' \
    > test.out 2>&1
eval_tap $? 31 'PublicGetUserProgression' test.out

#- 32 PublicGetPastUserProgression
./ng net.accelbyte.sdk.cli.Main challenge publicGetPastUserProgression \
    --challengeCode 'GR9ck9cJ' \
    --index '84' \
    --namespace "$AB_NAMESPACE" \
    --goalCode '5ukvaekw' \
    --limit '50' \
    --offset '26' \
    --tags 'PFCohC2c,kLhWbCE2,Ty2Jjtrn' \
    > test.out 2>&1
eval_tap $? 32 'PublicGetPastUserProgression' test.out

#- 33 PublicGetUserRewards
./ng net.accelbyte.sdk.cli.Main challenge publicGetUserRewards \
    --namespace "$AB_NAMESPACE" \
    --limit '85' \
    --offset '60' \
    --sortBy 'TOr6VKG2' \
    --status 'UNCLAIMED' \
    > test.out 2>&1
eval_tap $? 33 'PublicGetUserRewards' test.out

#- 34 PublicClaimUserRewards
./ng net.accelbyte.sdk.cli.Main challenge publicClaimUserRewards \
    --namespace "$AB_NAMESPACE" \
    --body '{"rewardIDs": ["4GHlYWYV", "MYT0TPfP", "2SopLNpk"]}' \
    > test.out 2>&1
eval_tap $? 34 'PublicClaimUserRewards' test.out


rm -f "tmp.dat"

exit $EXIT_CODE