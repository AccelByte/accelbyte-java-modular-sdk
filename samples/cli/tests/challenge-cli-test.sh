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
echo "1..21"

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
    --limit '90' \
    --offset '52' \
    --sortBy '9c5HEP8A' \
    --status 'INIT' \
    > test.out 2>&1
eval_tap $? 2 'AdminGetChallenges' test.out

#- 3 AdminCreateChallenge
./ng net.accelbyte.sdk.cli.Main challenge adminCreateChallenge \
    --namespace "$AB_NAMESPACE" \
    --body '{"activeGoalsPerRotation": 6, "assignmentRule": "FIXED", "code": "RnpohAWX", "description": "ZLqIqJYm", "endDate": "1986-12-12T00:00:00Z", "goalsVisibility": "SHOWALL", "name": "aH4w0fqu", "rotation": "NONE", "startDate": "1983-09-07T00:00:00Z"}' \
    > test.out 2>&1
eval_tap $? 3 'AdminCreateChallenge' test.out

#- 4 AdminGetChallenge
./ng net.accelbyte.sdk.cli.Main challenge adminGetChallenge \
    --challengeCode 'YsRJdD2z' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 4 'AdminGetChallenge' test.out

#- 5 AdminUpdateChallenge
./ng net.accelbyte.sdk.cli.Main challenge adminUpdateChallenge \
    --challengeCode 'TvgNcVKQ' \
    --namespace "$AB_NAMESPACE" \
    --body '{"activeGoalsPerRotation": 1, "assignmentRule": "RANDOMIZED", "description": "VJOJJUSX", "endDate": "1989-11-20T00:00:00Z", "goalsVisibility": "PERIODONLY", "name": "6Iitv1JK", "rotation": "WEEKLY", "startDate": "1979-10-24T00:00:00Z"}' \
    > test.out 2>&1
eval_tap $? 5 'AdminUpdateChallenge' test.out

#- 6 AdminDeleteChallenge
./ng net.accelbyte.sdk.cli.Main challenge adminDeleteChallenge \
    --challengeCode 'bhsn6I0M' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 6 'AdminDeleteChallenge' test.out

#- 7 AdminGetGoals
./ng net.accelbyte.sdk.cli.Main challenge adminGetGoals \
    --challengeCode '0E2mW7AW' \
    --namespace "$AB_NAMESPACE" \
    --limit '20' \
    --offset '40' \
    --sortBy '2BMUk7vT' \
    > test.out 2>&1
eval_tap $? 7 'AdminGetGoals' test.out

#- 8 AdminCreateGoal
./ng net.accelbyte.sdk.cli.Main challenge adminCreateGoal \
    --challengeCode 'MwsgRRNG' \
    --namespace "$AB_NAMESPACE" \
    --body '{"code": "qQNaH5qT", "description": "7FYGWyod", "isActive": true, "name": "NqIiGjYG", "requirementGroups": [{"operator": "AND", "predicates": [{"matcher": "GREATER_THAN", "parameterName": "l0pA9rUP", "parameterType": "ACHIEVEMENT", "targetValue": 0.7534737453019403}, {"matcher": "GREATER_THAN_EQUAL", "parameterName": "JioqbTwa", "parameterType": "USERACCOUNT", "targetValue": 0.9344963124341109}, {"matcher": "GREATER_THAN", "parameterName": "zA0U6pVM", "parameterType": "USERACCOUNT", "targetValue": 0.8690887444301623}]}, {"operator": "AND", "predicates": [{"matcher": "EQUAL", "parameterName": "x1oX1We6", "parameterType": "STATISTIC", "targetValue": 0.263856648420265}, {"matcher": "LESS_THAN_EQUAL", "parameterName": "Pc4wPpLO", "parameterType": "STATISTIC", "targetValue": 0.6536782890105397}, {"matcher": "GREATER_THAN", "parameterName": "xOdtwD8v", "parameterType": "USERACCOUNT", "targetValue": 0.9869977426581215}]}, {"operator": "AND", "predicates": [{"matcher": "LESS_THAN_EQUAL", "parameterName": "0gc3STjj", "parameterType": "STATISTIC", "targetValue": 0.48827628136089507}, {"matcher": "LESS_THAN_EQUAL", "parameterName": "ijxKn9wh", "parameterType": "STATISTIC", "targetValue": 0.09300435331169499}, {"matcher": "GREATER_THAN_EQUAL", "parameterName": "ZnKOQJnk", "parameterType": "ACHIEVEMENT", "targetValue": 0.03902276149956807}]}], "rewards": [{"itemId": "kzBqFVmS", "itemName": "6P3k58F4", "qty": 0.3245119445439334, "type": "ENTITLEMENT"}, {"itemId": "RSZwyQSF", "itemName": "UHxqyT6d", "qty": 0.7606114143813497, "type": "STATISTIC"}, {"itemId": "PeM0U4rO", "itemName": "hrY57gBD", "qty": 0.06107040222583715, "type": "STATISTIC"}], "schedule": {"endTime": "1994-01-31T00:00:00Z", "order": 81, "startTime": "1997-05-08T00:00:00Z"}, "tags": ["VIlsnafq", "gEQogS9i", "w5uAXsZx"]}' \
    > test.out 2>&1
eval_tap $? 8 'AdminCreateGoal' test.out

#- 9 AdminGetGoal
./ng net.accelbyte.sdk.cli.Main challenge adminGetGoal \
    --challengeCode '2lGDVD8I' \
    --code 'gO3TyNSg' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 9 'AdminGetGoal' test.out

#- 10 AdminUpdateGoals
./ng net.accelbyte.sdk.cli.Main challenge adminUpdateGoals \
    --challengeCode 'PfxJsjlg' \
    --code 'TpsbFfC4' \
    --namespace "$AB_NAMESPACE" \
    --body '{"description": "dTc5zHlI", "isActive": true, "name": "nDXjbjWU", "requirementGroups": [{"operator": "AND", "predicates": [{"matcher": "GREATER_THAN_EQUAL", "parameterName": "DIyLyaw2", "parameterType": "USERACCOUNT", "targetValue": 0.17508690203990795}, {"matcher": "GREATER_THAN", "parameterName": "Bxny40xI", "parameterType": "ACHIEVEMENT", "targetValue": 0.9155875383751826}, {"matcher": "LESS_THAN", "parameterName": "73QHMxWO", "parameterType": "USERACCOUNT", "targetValue": 0.9342360134169286}]}, {"operator": "AND", "predicates": [{"matcher": "LESS_THAN", "parameterName": "KTsazlPA", "parameterType": "USERACCOUNT", "targetValue": 0.4773912150458762}, {"matcher": "GREATER_THAN", "parameterName": "U3LwXFIh", "parameterType": "ACHIEVEMENT", "targetValue": 0.6391899574589777}, {"matcher": "GREATER_THAN_EQUAL", "parameterName": "UGRd34uq", "parameterType": "STATISTIC", "targetValue": 0.9946098319430654}]}, {"operator": "AND", "predicates": [{"matcher": "GREATER_THAN_EQUAL", "parameterName": "pZHUpz7O", "parameterType": "STATISTIC", "targetValue": 0.8032916725361354}, {"matcher": "GREATER_THAN", "parameterName": "DJmAkbNw", "parameterType": "STATISTIC", "targetValue": 0.7195443347537952}, {"matcher": "LESS_THAN", "parameterName": "Gn7qtVNS", "parameterType": "USERACCOUNT", "targetValue": 0.8544453671219978}]}], "rewards": [{"itemId": "iFbnhRtS", "itemName": "jizZsBhT", "qty": 0.6222170937029566, "type": "ENTITLEMENT"}, {"itemId": "CYnuqSZG", "itemName": "LQA1rSRp", "qty": 0.9235169571163785, "type": "ENTITLEMENT"}, {"itemId": "6FrIWPY0", "itemName": "hOwIosRO", "qty": 0.2748787633459838, "type": "STATISTIC"}], "schedule": {"endTime": "1985-01-16T00:00:00Z", "order": 15, "startTime": "1997-12-09T00:00:00Z"}, "tags": ["DVYDfqCn", "HsYYyEmB", "BljikETt"]}' \
    > test.out 2>&1
eval_tap $? 10 'AdminUpdateGoals' test.out

#- 11 AdminDeleteGoal
./ng net.accelbyte.sdk.cli.Main challenge adminDeleteGoal \
    --challengeCode 'kOjFYNyQ' \
    --code 'hawdhew1' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 11 'AdminDeleteGoal' test.out

#- 12 AdminGetPeriods
./ng net.accelbyte.sdk.cli.Main challenge adminGetPeriods \
    --challengeCode 'DrZVxM0t' \
    --namespace "$AB_NAMESPACE" \
    --limit '48' \
    --offset '21' \
    > test.out 2>&1
eval_tap $? 12 'AdminGetPeriods' test.out

#- 13 AdminRandomizeChallenge
./ng net.accelbyte.sdk.cli.Main challenge adminRandomizeChallenge \
    --challengeCode 'WfkLSMf7' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 13 'AdminRandomizeChallenge' test.out

#- 14 AdminEvaluateProgress
./ng net.accelbyte.sdk.cli.Main challenge adminEvaluateProgress \
    --namespace "$AB_NAMESPACE" \
    --body '{"userIds": ["9PMrbUs8", "gCpMS9iY", "OFQDXraC"]}' \
    > test.out 2>&1
eval_tap $? 14 'AdminEvaluateProgress' test.out

#- 15 AdminGetUserRewards
./ng net.accelbyte.sdk.cli.Main challenge adminGetUserRewards \
    --namespace "$AB_NAMESPACE" \
    --userId 'jrB4UpuW' \
    --limit '61' \
    --offset '62' \
    --sortBy '01PUYG0r' \
    --status 'UNCLAIMED' \
    > test.out 2>&1
eval_tap $? 15 'AdminGetUserRewards' test.out

#- 16 GetChallenges
./ng net.accelbyte.sdk.cli.Main challenge getChallenges \
    --namespace "$AB_NAMESPACE" \
    --limit '57' \
    --offset '48' \
    --sortBy 'AS8BpXRW' \
    --status 'INIT' \
    > test.out 2>&1
eval_tap $? 16 'GetChallenges' test.out

#- 17 PublicGetScheduledGoals
./ng net.accelbyte.sdk.cli.Main challenge publicGetScheduledGoals \
    --challengeCode 'IXHmH9CL' \
    --namespace "$AB_NAMESPACE" \
    --limit '71' \
    --offset '84' \
    --tags 'irRg06ck,bIG7Syp5,j6ZNt2k8' \
    > test.out 2>&1
eval_tap $? 17 'PublicGetScheduledGoals' test.out

#- 18 EvaluateMyProgress
./ng net.accelbyte.sdk.cli.Main challenge evaluateMyProgress \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 18 'EvaluateMyProgress' test.out

#- 19 PublicGetUserProgression
./ng net.accelbyte.sdk.cli.Main challenge publicGetUserProgression \
    --challengeCode 'PfHnrrDk' \
    --namespace "$AB_NAMESPACE" \
    --goalCode 'uaimvqCs' \
    > test.out 2>&1
eval_tap $? 19 'PublicGetUserProgression' test.out

#- 20 PublicGetUserRewards
./ng net.accelbyte.sdk.cli.Main challenge publicGetUserRewards \
    --namespace "$AB_NAMESPACE" \
    --limit '80' \
    --offset '83' \
    --sortBy 'J7P72c6p' \
    --status 'CLAIMED' \
    > test.out 2>&1
eval_tap $? 20 'PublicGetUserRewards' test.out

#- 21 PublicClaimUserRewards
./ng net.accelbyte.sdk.cli.Main challenge publicClaimUserRewards \
    --namespace "$AB_NAMESPACE" \
    --body '{"rewardIDs": ["pjrYpuW3", "imUMDeFE", "vPBV3mw0"]}' \
    > test.out 2>&1
eval_tap $? 21 'PublicClaimUserRewards' test.out


rm -f "tmp.dat"

exit $EXIT_CODE