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
    --limit '65' \
    --offset '48' \
    --sortBy '5M3ayDuO' \
    --status 'RETIRED' \
    > test.out 2>&1
eval_tap $? 2 'AdminGetChallenges' test.out

#- 3 AdminCreateChallenge
./ng net.accelbyte.sdk.cli.Main challenge adminCreateChallenge \
    --namespace "$AB_NAMESPACE" \
    --body '{"activeGoalsPerRotation": 13, "assignmentRule": "FIXED", "code": "nzwR44AZ", "description": "etpyyW4I", "endAfter": 12, "endDate": "1972-07-10T00:00:00Z", "goalsVisibility": "PERIODONLY", "name": "oNmRpp80", "repeatAfter": 94, "rotation": "MONTHLY", "startDate": "1977-01-25T00:00:00Z"}' \
    > test.out 2>&1
eval_tap $? 3 'AdminCreateChallenge' test.out

#- 4 AdminGetChallenge
./ng net.accelbyte.sdk.cli.Main challenge adminGetChallenge \
    --challengeCode 'vSQIeOp1' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 4 'AdminGetChallenge' test.out

#- 5 AdminUpdateChallenge
./ng net.accelbyte.sdk.cli.Main challenge adminUpdateChallenge \
    --challengeCode 'QaaMAjuB' \
    --namespace "$AB_NAMESPACE" \
    --body '{"activeGoalsPerRotation": 34, "assignmentRule": "RANDOMIZED", "description": "1cz8JxqV", "endAfter": 16, "endDate": "1986-11-23T00:00:00Z", "goalsVisibility": "PERIODONLY", "name": "kpnnT8ZQ", "repeatAfter": 22, "rotation": "MONTHLY", "startDate": "1981-05-19T00:00:00Z"}' \
    > test.out 2>&1
eval_tap $? 5 'AdminUpdateChallenge' test.out

#- 6 AdminDeleteChallenge
./ng net.accelbyte.sdk.cli.Main challenge adminDeleteChallenge \
    --challengeCode 'GTzTRYnU' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 6 'AdminDeleteChallenge' test.out

#- 7 AdminGetGoals
./ng net.accelbyte.sdk.cli.Main challenge adminGetGoals \
    --challengeCode 'eioMps1r' \
    --namespace "$AB_NAMESPACE" \
    --limit '15' \
    --offset '98' \
    --sortBy 'jHlfRu2d' \
    > test.out 2>&1
eval_tap $? 7 'AdminGetGoals' test.out

#- 8 AdminCreateGoal
./ng net.accelbyte.sdk.cli.Main challenge adminCreateGoal \
    --challengeCode 'sgKU2dA7' \
    --namespace "$AB_NAMESPACE" \
    --body '{"code": "WBnWYkP0", "description": "spiNWWfw", "isActive": false, "name": "tvD21pCq", "requirementGroups": [{"operator": "AND", "predicates": [{"matcher": "GREATER_THAN", "parameterName": "W8BkrMkz", "parameterType": "STATISTIC", "targetValue": 0.21050208074736632}, {"matcher": "EQUAL", "parameterName": "hs2fKN7e", "parameterType": "ACHIEVEMENT", "targetValue": 0.4271981030188544}, {"matcher": "GREATER_THAN_EQUAL", "parameterName": "M22kaM9N", "parameterType": "ACHIEVEMENT", "targetValue": 0.4003499603140487}]}, {"operator": "AND", "predicates": [{"matcher": "GREATER_THAN_EQUAL", "parameterName": "7CAuLEXr", "parameterType": "ACHIEVEMENT", "targetValue": 0.5626111296852611}, {"matcher": "EQUAL", "parameterName": "E8h2wkEA", "parameterType": "USERACCOUNT", "targetValue": 0.408443178891301}, {"matcher": "GREATER_THAN", "parameterName": "l7BAsSzX", "parameterType": "USERACCOUNT", "targetValue": 0.8865258061368175}]}, {"operator": "AND", "predicates": [{"matcher": "GREATER_THAN_EQUAL", "parameterName": "GBrze91H", "parameterType": "USERACCOUNT", "targetValue": 0.21192949027226093}, {"matcher": "EQUAL", "parameterName": "lKRIvJj7", "parameterType": "ACHIEVEMENT", "targetValue": 0.3102568756447601}, {"matcher": "GREATER_THAN", "parameterName": "shbTJDtd", "parameterType": "STATISTIC", "targetValue": 0.8272372115950613}]}], "rewards": [{"itemId": "8pBlIsEj", "itemName": "Pt5omDNC", "qty": 0.5352794923106262, "type": "ENTITLEMENT"}, {"itemId": "g3zOgUuh", "itemName": "GvTZsJEc", "qty": 0.874374894620782, "type": "STATISTIC"}, {"itemId": "GovorvlL", "itemName": "YUDzk4pS", "qty": 0.8864721009777903, "type": "ENTITLEMENT"}], "schedule": {"endTime": "1989-05-27T00:00:00Z", "order": 34, "startTime": "1985-02-03T00:00:00Z"}, "tags": ["L1s5FlSx", "3Pgh2R5y", "CaJBybZj"]}' \
    > test.out 2>&1
eval_tap $? 8 'AdminCreateGoal' test.out

#- 9 AdminGetGoal
./ng net.accelbyte.sdk.cli.Main challenge adminGetGoal \
    --challengeCode '0D8jxgDI' \
    --code 'IY67IEnA' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 9 'AdminGetGoal' test.out

#- 10 AdminUpdateGoals
./ng net.accelbyte.sdk.cli.Main challenge adminUpdateGoals \
    --challengeCode 'ykC5PbwE' \
    --code 'gUicDAQp' \
    --namespace "$AB_NAMESPACE" \
    --body '{"description": "Xv9aBELf", "isActive": false, "name": "hEkivL09", "requirementGroups": [{"operator": "AND", "predicates": [{"matcher": "GREATER_THAN_EQUAL", "parameterName": "6CtDPE5M", "parameterType": "USERACCOUNT", "targetValue": 0.6706034140810486}, {"matcher": "LESS_THAN", "parameterName": "8ZkzYzPD", "parameterType": "USERACCOUNT", "targetValue": 0.9277407102199196}, {"matcher": "LESS_THAN", "parameterName": "RXL8SunA", "parameterType": "STATISTIC", "targetValue": 0.531677565409203}]}, {"operator": "AND", "predicates": [{"matcher": "EQUAL", "parameterName": "sGT5qztF", "parameterType": "STATISTIC", "targetValue": 0.39644843428746623}, {"matcher": "LESS_THAN_EQUAL", "parameterName": "D33dWpKe", "parameterType": "ACHIEVEMENT", "targetValue": 0.3066063259393801}, {"matcher": "EQUAL", "parameterName": "ydOlCd2e", "parameterType": "STATISTIC", "targetValue": 0.35293126358380245}]}, {"operator": "AND", "predicates": [{"matcher": "EQUAL", "parameterName": "yd5lf46P", "parameterType": "USERACCOUNT", "targetValue": 0.0011293928639389827}, {"matcher": "LESS_THAN_EQUAL", "parameterName": "fHnJ7sAM", "parameterType": "ACHIEVEMENT", "targetValue": 0.14330934108454718}, {"matcher": "LESS_THAN_EQUAL", "parameterName": "JVB5uSUV", "parameterType": "STATISTIC", "targetValue": 0.7227121339581886}]}], "rewards": [{"itemId": "UkLbOkhx", "itemName": "QBSdAqrF", "qty": 0.21619011006695554, "type": "ENTITLEMENT"}, {"itemId": "E4zaXMe7", "itemName": "i7NExfsg", "qty": 0.32893635206826266, "type": "STATISTIC"}, {"itemId": "OsQ0SFzE", "itemName": "JDVOGe2s", "qty": 0.47885866111047604, "type": "ENTITLEMENT"}], "schedule": {"endTime": "1985-03-25T00:00:00Z", "order": 78, "startTime": "1982-09-20T00:00:00Z"}, "tags": ["8kOCS8gJ", "OGBApweo", "uToyHQiq"]}' \
    > test.out 2>&1
eval_tap $? 10 'AdminUpdateGoals' test.out

#- 11 AdminDeleteGoal
./ng net.accelbyte.sdk.cli.Main challenge adminDeleteGoal \
    --challengeCode '6KCuWxPf' \
    --code 'ursGYe1V' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 11 'AdminDeleteGoal' test.out

#- 12 AdminGetPeriods
./ng net.accelbyte.sdk.cli.Main challenge adminGetPeriods \
    --challengeCode '7l3FTc6V' \
    --namespace "$AB_NAMESPACE" \
    --limit '13' \
    --offset '24' \
    > test.out 2>&1
eval_tap $? 12 'AdminGetPeriods' test.out

#- 13 AdminRandomizeChallenge
./ng net.accelbyte.sdk.cli.Main challenge adminRandomizeChallenge \
    --challengeCode 'YbwW2S3v' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 13 'AdminRandomizeChallenge' test.out

#- 14 AdminDeleteTiedChallenge
./ng net.accelbyte.sdk.cli.Main challenge adminDeleteTiedChallenge \
    --challengeCode 'VHhyqWHA' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 14 'AdminDeleteTiedChallenge' test.out

#- 15 AdminEvaluateProgress
./ng net.accelbyte.sdk.cli.Main challenge adminEvaluateProgress \
    --namespace "$AB_NAMESPACE" \
    --body '{"userIds": ["sQsVxpJf", "KwwWh7PO", "ECWkBvrf"]}' \
    > test.out 2>&1
eval_tap $? 15 'AdminEvaluateProgress' test.out

#- 16 AdminGetUserRewards
./ng net.accelbyte.sdk.cli.Main challenge adminGetUserRewards \
    --namespace "$AB_NAMESPACE" \
    --userId 'e8C8JGrv' \
    --limit '86' \
    --offset '92' \
    --sortBy '9L2ah1hN' \
    --status 'UNCLAIMED' \
    > test.out 2>&1
eval_tap $? 16 'AdminGetUserRewards' test.out

#- 17 GetChallenges
./ng net.accelbyte.sdk.cli.Main challenge getChallenges \
    --namespace "$AB_NAMESPACE" \
    --limit '30' \
    --offset '43' \
    --sortBy 'RbVELDvA' \
    --status 'INIT' \
    > test.out 2>&1
eval_tap $? 17 'GetChallenges' test.out

#- 18 PublicGetScheduledGoals
./ng net.accelbyte.sdk.cli.Main challenge publicGetScheduledGoals \
    --challengeCode 'WuDvnNuU' \
    --namespace "$AB_NAMESPACE" \
    --limit '31' \
    --offset '44' \
    --tags 'gbOyxKEh,7SqJOElx,kycIizRQ' \
    > test.out 2>&1
eval_tap $? 18 'PublicGetScheduledGoals' test.out

#- 19 EvaluateMyProgress
./ng net.accelbyte.sdk.cli.Main challenge evaluateMyProgress \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 19 'EvaluateMyProgress' test.out

#- 20 PublicGetUserProgression
./ng net.accelbyte.sdk.cli.Main challenge publicGetUserProgression \
    --challengeCode 'ulCtCIok' \
    --namespace "$AB_NAMESPACE" \
    --goalCode 'wxy0kfG3' \
    --limit '8' \
    --offset '19' \
    --tags 'tuA1j7ah,72MHyDVj,C1V3ZDgA' \
    > test.out 2>&1
eval_tap $? 20 'PublicGetUserProgression' test.out

#- 21 PublicGetUserRewards
./ng net.accelbyte.sdk.cli.Main challenge publicGetUserRewards \
    --namespace "$AB_NAMESPACE" \
    --limit '78' \
    --offset '5' \
    --sortBy 'zOHosb4k' \
    --status 'UNCLAIMED' \
    > test.out 2>&1
eval_tap $? 21 'PublicGetUserRewards' test.out

#- 22 PublicClaimUserRewards
./ng net.accelbyte.sdk.cli.Main challenge publicClaimUserRewards \
    --namespace "$AB_NAMESPACE" \
    --body '{"rewardIDs": ["w830hEfP", "HHrYY05o", "46WEA4nf"]}' \
    > test.out 2>&1
eval_tap $? 22 'PublicClaimUserRewards' test.out


rm -f "tmp.dat"

exit $EXIT_CODE