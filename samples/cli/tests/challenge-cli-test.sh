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
echo "1..25"

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
    --limit '11' \
    --offset '37' \
    --sortBy 'oewMz9Vm' \
    --status 'INIT' \
    > test.out 2>&1
eval_tap $? 2 'AdminGetChallenges' test.out

#- 3 AdminCreateChallenge
./ng net.accelbyte.sdk.cli.Main challenge adminCreateChallenge \
    --namespace "$AB_NAMESPACE" \
    --body '{"activeGoalsPerRotation": 50, "assignmentRule": "FIXED", "code": "FnxKr9gR", "description": "2wlC5od1", "endAfter": 43, "endDate": "1973-08-13T00:00:00Z", "goalsVisibility": "PERIODONLY", "name": "cDSuwXEP", "randomizedPerRotation": true, "repeatAfter": 46, "resetConfig": {"resetDate": 3, "resetDay": 8, "resetTime": "mvGc3XJ6"}, "rotation": "NONE", "startDate": "1986-08-03T00:00:00Z"}' \
    > test.out 2>&1
eval_tap $? 3 'AdminCreateChallenge' test.out

#- 4 AdminGetChallenge
./ng net.accelbyte.sdk.cli.Main challenge adminGetChallenge \
    --challengeCode 'JKtxzZQ2' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 4 'AdminGetChallenge' test.out

#- 5 AdminUpdateChallenge
./ng net.accelbyte.sdk.cli.Main challenge adminUpdateChallenge \
    --challengeCode 'O48YBunl' \
    --namespace "$AB_NAMESPACE" \
    --body '{"activeGoalsPerRotation": 27, "assignmentRule": "RANDOMIZED", "description": "Y0ntNOCc", "endAfter": 31, "endDate": "1983-08-26T00:00:00Z", "goalsVisibility": "SHOWALL", "name": "bpQD5yDc", "randomizedPerRotation": true, "repeatAfter": 40, "resetConfig": {"resetDate": 23, "resetDay": 34, "resetTime": "dv5MJDFm"}, "rotation": "DAILY", "startDate": "1987-07-29T00:00:00Z"}' \
    > test.out 2>&1
eval_tap $? 5 'AdminUpdateChallenge' test.out

#- 6 AdminDeleteChallenge
./ng net.accelbyte.sdk.cli.Main challenge adminDeleteChallenge \
    --challengeCode 'WY7aEUyu' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 6 'AdminDeleteChallenge' test.out

#- 7 AdminGetGoals
./ng net.accelbyte.sdk.cli.Main challenge adminGetGoals \
    --challengeCode 'tl21JWUD' \
    --namespace "$AB_NAMESPACE" \
    --limit '47' \
    --offset '97' \
    --sortBy 'qEFglhPB' \
    > test.out 2>&1
eval_tap $? 7 'AdminGetGoals' test.out

#- 8 AdminCreateGoal
./ng net.accelbyte.sdk.cli.Main challenge adminCreateGoal \
    --challengeCode 'iVQHx0jg' \
    --namespace "$AB_NAMESPACE" \
    --body '{"code": "hdc47SgL", "description": "lYci4I7h", "isActive": true, "name": "OKsPAfBz", "requirementGroups": [{"operator": "AND", "predicates": [{"matcher": "GREATER_THAN", "parameterName": "aeFFwTDQ", "parameterType": "STATISTIC", "statCycleId": "Tc8BuRNg", "targetValue": 0.2855450482108375}, {"matcher": "GREATER_THAN", "parameterName": "x7hVPo5U", "parameterType": "ENTITLEMENT", "statCycleId": "SFFPkmcy", "targetValue": 0.036023466797724724}, {"matcher": "EQUAL", "parameterName": "bDX8dp36", "parameterType": "USERACCOUNT", "statCycleId": "EnCQ6xng", "targetValue": 0.8488374778159152}]}, {"operator": "AND", "predicates": [{"matcher": "EQUAL", "parameterName": "7RvHrAFL", "parameterType": "USERACCOUNT", "statCycleId": "Yo2f9xiW", "targetValue": 0.16203879532647214}, {"matcher": "EQUAL", "parameterName": "QcNdeBnv", "parameterType": "USERACCOUNT", "statCycleId": "owHHCzQG", "targetValue": 0.22641302448421974}, {"matcher": "GREATER_THAN_EQUAL", "parameterName": "fgdxVJgG", "parameterType": "STATISTIC_CYCLE", "statCycleId": "dvYZk2wV", "targetValue": 0.23558493825062543}]}, {"operator": "AND", "predicates": [{"matcher": "LESS_THAN", "parameterName": "nlERb05F", "parameterType": "USERACCOUNT", "statCycleId": "H9rPnMdJ", "targetValue": 0.19886188425665985}, {"matcher": "LESS_THAN_EQUAL", "parameterName": "HCOQlnl4", "parameterType": "STATISTIC", "statCycleId": "5goRmSJ6", "targetValue": 0.42458007478741}, {"matcher": "GREATER_THAN_EQUAL", "parameterName": "mWGFJt9H", "parameterType": "ENTITLEMENT", "statCycleId": "uf3zahUJ", "targetValue": 0.08119150039354939}]}], "rewards": [{"itemId": "KTpz9jV3", "itemName": "BNWLtpml", "qty": 0.22353362426928314, "type": "ENTITLEMENT"}, {"itemId": "yBPxF5sR", "itemName": "PIpoX5xb", "qty": 0.3011685933833801, "type": "STATISTIC"}, {"itemId": "LgyTvNzu", "itemName": "Tke2S0Nz", "qty": 0.07904390086288382, "type": "STATISTIC"}], "schedule": {"endTime": "1974-05-18T00:00:00Z", "order": 96, "startTime": "1979-03-30T00:00:00Z"}, "tags": ["PscIASMr", "aGWzp8rX", "bUjt3BNJ"]}' \
    > test.out 2>&1
eval_tap $? 8 'AdminCreateGoal' test.out

#- 9 AdminGetGoal
./ng net.accelbyte.sdk.cli.Main challenge adminGetGoal \
    --challengeCode 'GQOTxNxN' \
    --code 'HOHVV3qI' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 9 'AdminGetGoal' test.out

#- 10 AdminUpdateGoals
./ng net.accelbyte.sdk.cli.Main challenge adminUpdateGoals \
    --challengeCode 'EnBmQa0T' \
    --code 'E7UHG4CD' \
    --namespace "$AB_NAMESPACE" \
    --body '{"description": "rBSK8Y9w", "isActive": true, "name": "5zNm0sjk", "requirementGroups": [{"operator": "AND", "predicates": [{"matcher": "GREATER_THAN_EQUAL", "parameterName": "TstFVrVH", "parameterType": "STATISTIC", "statCycleId": "5KHFz5D2", "targetValue": 0.15950547198184672}, {"matcher": "EQUAL", "parameterName": "FwvoIReB", "parameterType": "USERACCOUNT", "statCycleId": "ed6KSWNv", "targetValue": 0.6892629163027906}, {"matcher": "LESS_THAN_EQUAL", "parameterName": "xlRWFuxq", "parameterType": "USERACCOUNT", "statCycleId": "EeogZ9SI", "targetValue": 0.05224589036180416}]}, {"operator": "AND", "predicates": [{"matcher": "LESS_THAN", "parameterName": "hAoLh9qG", "parameterType": "STATISTIC", "statCycleId": "rchaZUee", "targetValue": 0.7040997596293485}, {"matcher": "GREATER_THAN_EQUAL", "parameterName": "zUs3Zqo0", "parameterType": "ACHIEVEMENT", "statCycleId": "4r6eRj32", "targetValue": 0.372986254284954}, {"matcher": "LESS_THAN", "parameterName": "5ZYFFRMN", "parameterType": "USERACCOUNT", "statCycleId": "crxbyaNh", "targetValue": 0.18547802684983505}]}, {"operator": "AND", "predicates": [{"matcher": "LESS_THAN_EQUAL", "parameterName": "9xCfvFGW", "parameterType": "USERACCOUNT", "statCycleId": "dIG0wWQM", "targetValue": 0.6667369882986136}, {"matcher": "GREATER_THAN", "parameterName": "CYqH5MSf", "parameterType": "USERACCOUNT", "statCycleId": "ip7zglaZ", "targetValue": 0.8765157604138429}, {"matcher": "LESS_THAN_EQUAL", "parameterName": "IV5TyHJG", "parameterType": "STATISTIC_CYCLE", "statCycleId": "RwyXy8zn", "targetValue": 0.35222553626035213}]}], "rewards": [{"itemId": "RzOcpeOc", "itemName": "rAVFwSEN", "qty": 0.3238834044028571, "type": "STATISTIC"}, {"itemId": "1kVITg0b", "itemName": "b6dxiqgq", "qty": 0.4390715211701851, "type": "STATISTIC"}, {"itemId": "6UNWm55C", "itemName": "yApP86Sr", "qty": 0.2588315281179563, "type": "ENTITLEMENT"}], "schedule": {"endTime": "1973-12-24T00:00:00Z", "order": 86, "startTime": "1980-12-21T00:00:00Z"}, "tags": ["iR9dZ1Ds", "R299A6XO", "lOucKB5C"]}' \
    > test.out 2>&1
eval_tap $? 10 'AdminUpdateGoals' test.out

#- 11 AdminDeleteGoal
./ng net.accelbyte.sdk.cli.Main challenge adminDeleteGoal \
    --challengeCode 'bjCuRUZv' \
    --code 'P7n3p06j' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 11 'AdminDeleteGoal' test.out

#- 12 AdminGetPeriods
./ng net.accelbyte.sdk.cli.Main challenge adminGetPeriods \
    --challengeCode 'T4MUlA8H' \
    --namespace "$AB_NAMESPACE" \
    --limit '77' \
    --offset '82' \
    > test.out 2>&1
eval_tap $? 12 'AdminGetPeriods' test.out

#- 13 AdminRandomizeChallenge
./ng net.accelbyte.sdk.cli.Main challenge adminRandomizeChallenge \
    --challengeCode 'Ciy07rkr' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 13 'AdminRandomizeChallenge' test.out

#- 14 AdminDeleteTiedChallenge
./ng net.accelbyte.sdk.cli.Main challenge adminDeleteTiedChallenge \
    --challengeCode 'Xs5CIiEZ' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 14 'AdminDeleteTiedChallenge' test.out

#- 15 AdminEvaluateProgress
./ng net.accelbyte.sdk.cli.Main challenge adminEvaluateProgress \
    --namespace "$AB_NAMESPACE" \
    --body '{"userIds": ["GThiRZjt", "jOE66j3C", "KiqHRNDW"]}' \
    > test.out 2>&1
eval_tap $? 15 'AdminEvaluateProgress' test.out

#- 16 AdminClaimUsersRewards
./ng net.accelbyte.sdk.cli.Main challenge adminClaimUsersRewards \
    --namespace "$AB_NAMESPACE" \
    --body '[{"rewardIds": ["cs5akLGV", "FQOXFHoF", "yOMW3L08"], "userId": "Aqr0NNel"}, {"rewardIds": ["mYLgdFA3", "kQqa3LCf", "OPeH8BWX"], "userId": "cEmwgWgm"}, {"rewardIds": ["puDI174Q", "ZlUTn3HV", "TRXYKybZ"], "userId": "fmZjpLAJ"}]' \
    > test.out 2>&1
eval_tap $? 16 'AdminClaimUsersRewards' test.out

#- 17 AdminGetUserRewards
./ng net.accelbyte.sdk.cli.Main challenge adminGetUserRewards \
    --namespace "$AB_NAMESPACE" \
    --userId 'vFgOUAc2' \
    --limit '62' \
    --offset '57' \
    --sortBy 'QjGoH7Pr' \
    --status 'UNCLAIMED' \
    > test.out 2>&1
eval_tap $? 17 'AdminGetUserRewards' test.out

#- 18 AdminClaimUserRewards
./ng net.accelbyte.sdk.cli.Main challenge adminClaimUserRewards \
    --namespace "$AB_NAMESPACE" \
    --userId '9VCyJn8l' \
    --body '{"rewardIDs": ["0oKRhmYd", "aRWLfQ9i", "sF3zDyXV"]}' \
    > test.out 2>&1
eval_tap $? 18 'AdminClaimUserRewards' test.out

#- 19 GetChallenges
./ng net.accelbyte.sdk.cli.Main challenge getChallenges \
    --namespace "$AB_NAMESPACE" \
    --limit '95' \
    --offset '20' \
    --sortBy 'JitZqspC' \
    --status 'RETIRED' \
    > test.out 2>&1
eval_tap $? 19 'GetChallenges' test.out

#- 20 PublicGetScheduledGoals
./ng net.accelbyte.sdk.cli.Main challenge publicGetScheduledGoals \
    --challengeCode '5kgl6p1r' \
    --namespace "$AB_NAMESPACE" \
    --limit '8' \
    --offset '20' \
    --tags '2FJIm6Nl,Z2HCtY07,oLNOQ6Sa' \
    > test.out 2>&1
eval_tap $? 20 'PublicGetScheduledGoals' test.out

#- 21 EvaluateMyProgress
./ng net.accelbyte.sdk.cli.Main challenge evaluateMyProgress \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 21 'EvaluateMyProgress' test.out

#- 22 PublicGetUserProgression
./ng net.accelbyte.sdk.cli.Main challenge publicGetUserProgression \
    --challengeCode 'sxZUyC1Q' \
    --namespace "$AB_NAMESPACE" \
    --dateTime '1981-06-15T00:00:00Z' \
    --goalCode 'qXHHbT9l' \
    --limit '52' \
    --offset '6' \
    --tags '4hddcwOt,PTuxb3AT,fxgVQ9mx' \
    > test.out 2>&1
eval_tap $? 22 'PublicGetUserProgression' test.out

#- 23 PublicGetPastUserProgression
./ng net.accelbyte.sdk.cli.Main challenge publicGetPastUserProgression \
    --challengeCode 'rli6oFUm' \
    --index '93' \
    --namespace "$AB_NAMESPACE" \
    --goalCode 'yAdkpzDw' \
    --limit '15' \
    --offset '51' \
    --tags 'y8H89CZI,Mw6NVMn9,tx2FJo0T' \
    > test.out 2>&1
eval_tap $? 23 'PublicGetPastUserProgression' test.out

#- 24 PublicGetUserRewards
./ng net.accelbyte.sdk.cli.Main challenge publicGetUserRewards \
    --namespace "$AB_NAMESPACE" \
    --limit '23' \
    --offset '99' \
    --sortBy 't2Cxcgn5' \
    --status 'UNCLAIMED' \
    > test.out 2>&1
eval_tap $? 24 'PublicGetUserRewards' test.out

#- 25 PublicClaimUserRewards
./ng net.accelbyte.sdk.cli.Main challenge publicClaimUserRewards \
    --namespace "$AB_NAMESPACE" \
    --body '{"rewardIDs": ["3T1O1aBT", "NjBa3MMJ", "0OUd7I9q"]}' \
    > test.out 2>&1
eval_tap $? 25 'PublicClaimUserRewards' test.out


rm -f "tmp.dat"

exit $EXIT_CODE