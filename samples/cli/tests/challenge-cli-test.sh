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
echo "1..22"

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
    --limit '45' \
    --offset '36' \
    --sortBy 'JDKsh3iO' \
    --status 'INIT' \
    > test.out 2>&1
eval_tap $? 2 'AdminGetChallenges' test.out

#- 3 AdminCreateChallenge
./ng net.accelbyte.sdk.cli.Main challenge adminCreateChallenge \
    --namespace "$AB_NAMESPACE" \
    --body '{"activeGoalsPerRotation": 5, "assignmentRule": "FIXED", "code": "q06UWLf8", "description": "A1VesaTm", "endAfter": 74, "endDate": "1973-11-08T00:00:00Z", "goalsVisibility": "SHOWALL", "name": "FfwlmomH", "repeatAfter": 89, "rotation": "DAILY", "startDate": "1994-01-09T00:00:00Z"}' \
    > test.out 2>&1
eval_tap $? 3 'AdminCreateChallenge' test.out

#- 4 AdminGetChallenge
./ng net.accelbyte.sdk.cli.Main challenge adminGetChallenge \
    --challengeCode '4jI6DC5y' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 4 'AdminGetChallenge' test.out

#- 5 AdminUpdateChallenge
./ng net.accelbyte.sdk.cli.Main challenge adminUpdateChallenge \
    --challengeCode 'xcScciIh' \
    --namespace "$AB_NAMESPACE" \
    --body '{"activeGoalsPerRotation": 46, "assignmentRule": "RANDOMIZED", "description": "mktYa0PP", "endAfter": 34, "endDate": "1986-08-14T00:00:00Z", "goalsVisibility": "PERIODONLY", "name": "IDVM9gqz", "repeatAfter": 57, "rotation": "DAILY", "startDate": "1989-04-08T00:00:00Z"}' \
    > test.out 2>&1
eval_tap $? 5 'AdminUpdateChallenge' test.out

#- 6 AdminDeleteChallenge
./ng net.accelbyte.sdk.cli.Main challenge adminDeleteChallenge \
    --challengeCode 'uhc8c9Xq' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 6 'AdminDeleteChallenge' test.out

#- 7 AdminGetGoals
./ng net.accelbyte.sdk.cli.Main challenge adminGetGoals \
    --challengeCode 'aEPeVbKI' \
    --namespace "$AB_NAMESPACE" \
    --limit '86' \
    --offset '48' \
    --sortBy 'Vss2Gobz' \
    > test.out 2>&1
eval_tap $? 7 'AdminGetGoals' test.out

#- 8 AdminCreateGoal
./ng net.accelbyte.sdk.cli.Main challenge adminCreateGoal \
    --challengeCode 'qXK4PJyP' \
    --namespace "$AB_NAMESPACE" \
    --body '{"code": "QrlDLchQ", "description": "AUQTMsfu", "isActive": true, "name": "ll1K4PHc", "requirementGroups": [{"operator": "AND", "predicates": [{"matcher": "GREATER_THAN_EQUAL", "parameterName": "CGHw0XcD", "parameterType": "USERACCOUNT", "targetValue": 0.3967214388184549}, {"matcher": "LESS_THAN", "parameterName": "bYv1Qx8x", "parameterType": "USERACCOUNT", "targetValue": 0.22898976540466687}, {"matcher": "EQUAL", "parameterName": "c5MlheDi", "parameterType": "USERACCOUNT", "targetValue": 0.6320536197193671}]}, {"operator": "AND", "predicates": [{"matcher": "LESS_THAN", "parameterName": "FzeZupyj", "parameterType": "STATISTIC", "targetValue": 0.8559324274152919}, {"matcher": "EQUAL", "parameterName": "ZyPmdT3v", "parameterType": "USERACCOUNT", "targetValue": 0.5768238723621614}, {"matcher": "GREATER_THAN_EQUAL", "parameterName": "RlXAAMSL", "parameterType": "ACHIEVEMENT", "targetValue": 0.6495187652652025}]}, {"operator": "AND", "predicates": [{"matcher": "LESS_THAN", "parameterName": "9npZ3dXp", "parameterType": "STATISTIC", "targetValue": 0.8762875479376622}, {"matcher": "LESS_THAN_EQUAL", "parameterName": "TBSVj7vh", "parameterType": "STATISTIC", "targetValue": 0.35780146627578835}, {"matcher": "LESS_THAN", "parameterName": "PCHAyZVE", "parameterType": "ACHIEVEMENT", "targetValue": 0.6959026990038891}]}], "rewards": [{"itemId": "8GuSk4y4", "itemName": "aIfb0PpE", "qty": 0.5320702275048609, "type": "ENTITLEMENT"}, {"itemId": "t9iz9Jnv", "itemName": "Sam8GxSY", "qty": 0.89029363280274, "type": "ENTITLEMENT"}, {"itemId": "tbJmLsy3", "itemName": "8v7WXobJ", "qty": 0.842612343576551, "type": "ENTITLEMENT"}], "schedule": {"endTime": "1995-09-04T00:00:00Z", "order": 51, "startTime": "1996-04-14T00:00:00Z"}, "tags": ["B0WEaAFc", "y9Pqcyq1", "NRwiWSQ8"]}' \
    > test.out 2>&1
eval_tap $? 8 'AdminCreateGoal' test.out

#- 9 AdminGetGoal
./ng net.accelbyte.sdk.cli.Main challenge adminGetGoal \
    --challengeCode '73chanhB' \
    --code 'n8JEcUZa' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 9 'AdminGetGoal' test.out

#- 10 AdminUpdateGoals
./ng net.accelbyte.sdk.cli.Main challenge adminUpdateGoals \
    --challengeCode 'BrJsGHD7' \
    --code 'FpzyliFd' \
    --namespace "$AB_NAMESPACE" \
    --body '{"description": "Is3GAGlg", "isActive": true, "name": "8Edk2Kha", "requirementGroups": [{"operator": "AND", "predicates": [{"matcher": "GREATER_THAN", "parameterName": "c2878ekQ", "parameterType": "ACHIEVEMENT", "targetValue": 0.9231314857480187}, {"matcher": "EQUAL", "parameterName": "G1ebpMOh", "parameterType": "ACHIEVEMENT", "targetValue": 0.33994147923580453}, {"matcher": "GREATER_THAN_EQUAL", "parameterName": "fdgm5WFR", "parameterType": "USERACCOUNT", "targetValue": 0.6729936493890805}]}, {"operator": "AND", "predicates": [{"matcher": "GREATER_THAN", "parameterName": "vbb8y0hg", "parameterType": "ACHIEVEMENT", "targetValue": 0.8750921862299461}, {"matcher": "GREATER_THAN", "parameterName": "iLEqWAmC", "parameterType": "STATISTIC", "targetValue": 0.5025170988881558}, {"matcher": "LESS_THAN_EQUAL", "parameterName": "xUoJWK3n", "parameterType": "USERACCOUNT", "targetValue": 0.3503339618134399}]}, {"operator": "AND", "predicates": [{"matcher": "EQUAL", "parameterName": "hfWzoJTe", "parameterType": "STATISTIC", "targetValue": 0.7932983257283602}, {"matcher": "EQUAL", "parameterName": "SPvCtLmZ", "parameterType": "USERACCOUNT", "targetValue": 0.32104923737687496}, {"matcher": "GREATER_THAN", "parameterName": "maPalI77", "parameterType": "ACHIEVEMENT", "targetValue": 0.0377871335143094}]}], "rewards": [{"itemId": "BUvcZyCK", "itemName": "qiMtkWx4", "qty": 0.5333791894392123, "type": "ENTITLEMENT"}, {"itemId": "Hy4m8PDg", "itemName": "3ji1wJrL", "qty": 0.44974907642550666, "type": "ENTITLEMENT"}, {"itemId": "s3UELXl6", "itemName": "cjotoGbD", "qty": 0.05269217297100526, "type": "STATISTIC"}], "schedule": {"endTime": "1986-07-31T00:00:00Z", "order": 81, "startTime": "1985-08-29T00:00:00Z"}, "tags": ["EYj25YI9", "6nmoVcam", "oojK4HAe"]}' \
    > test.out 2>&1
eval_tap $? 10 'AdminUpdateGoals' test.out

#- 11 AdminDeleteGoal
./ng net.accelbyte.sdk.cli.Main challenge adminDeleteGoal \
    --challengeCode '7mBgucNC' \
    --code 'q0UIunib' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 11 'AdminDeleteGoal' test.out

#- 12 AdminGetPeriods
./ng net.accelbyte.sdk.cli.Main challenge adminGetPeriods \
    --challengeCode 'vcebjXPY' \
    --namespace "$AB_NAMESPACE" \
    --limit '75' \
    --offset '92' \
    > test.out 2>&1
eval_tap $? 12 'AdminGetPeriods' test.out

#- 13 AdminRandomizeChallenge
./ng net.accelbyte.sdk.cli.Main challenge adminRandomizeChallenge \
    --challengeCode 'tG9wiHxa' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 13 'AdminRandomizeChallenge' test.out

#- 14 AdminDeleteTiedChallenge
./ng net.accelbyte.sdk.cli.Main challenge adminDeleteTiedChallenge \
    --challengeCode 'R5HUnDld' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 14 'AdminDeleteTiedChallenge' test.out

#- 15 AdminEvaluateProgress
./ng net.accelbyte.sdk.cli.Main challenge adminEvaluateProgress \
    --namespace "$AB_NAMESPACE" \
    --body '{"userIds": ["HcwcKz44", "ycWtcchw", "eD006qvS"]}' \
    > test.out 2>&1
eval_tap $? 15 'AdminEvaluateProgress' test.out

#- 16 AdminGetUserRewards
./ng net.accelbyte.sdk.cli.Main challenge adminGetUserRewards \
    --namespace "$AB_NAMESPACE" \
    --userId 'XB3pOFC0' \
    --limit '5' \
    --offset '46' \
    --sortBy 'jjMMfYRs' \
    --status 'UNCLAIMED' \
    > test.out 2>&1
eval_tap $? 16 'AdminGetUserRewards' test.out

#- 17 GetChallenges
./ng net.accelbyte.sdk.cli.Main challenge getChallenges \
    --namespace "$AB_NAMESPACE" \
    --limit '100' \
    --offset '61' \
    --sortBy 'MQpKoQxM' \
    --status 'TIED' \
    > test.out 2>&1
eval_tap $? 17 'GetChallenges' test.out

#- 18 PublicGetScheduledGoals
./ng net.accelbyte.sdk.cli.Main challenge publicGetScheduledGoals \
    --challengeCode 'UsYe77HI' \
    --namespace "$AB_NAMESPACE" \
    --limit '86' \
    --offset '32' \
    --tags 'xslST5TR,aVis7pWP,HPSWijR5' \
    > test.out 2>&1
eval_tap $? 18 'PublicGetScheduledGoals' test.out

#- 19 EvaluateMyProgress
./ng net.accelbyte.sdk.cli.Main challenge evaluateMyProgress \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 19 'EvaluateMyProgress' test.out

#- 20 PublicGetUserProgression
./ng net.accelbyte.sdk.cli.Main challenge publicGetUserProgression \
    --challengeCode 'kkeVBjzp' \
    --namespace "$AB_NAMESPACE" \
    --goalCode 'npTbSqJA' \
    --limit '5' \
    --offset '47' \
    --tags 'pXEDShOA,it4foqFO,rSIPDAU5' \
    > test.out 2>&1
eval_tap $? 20 'PublicGetUserProgression' test.out

#- 21 PublicGetUserRewards
./ng net.accelbyte.sdk.cli.Main challenge publicGetUserRewards \
    --namespace "$AB_NAMESPACE" \
    --limit '89' \
    --offset '75' \
    --sortBy 'B81R2Ks9' \
    --status 'CLAIMED' \
    > test.out 2>&1
eval_tap $? 21 'PublicGetUserRewards' test.out

#- 22 PublicClaimUserRewards
./ng net.accelbyte.sdk.cli.Main challenge publicClaimUserRewards \
    --namespace "$AB_NAMESPACE" \
    --body '{"rewardIDs": ["cw9jz7WD", "CwmCr2MS", "6gGZPJvM"]}' \
    > test.out 2>&1
eval_tap $? 22 'PublicClaimUserRewards' test.out


rm -f "tmp.dat"

exit $EXIT_CODE