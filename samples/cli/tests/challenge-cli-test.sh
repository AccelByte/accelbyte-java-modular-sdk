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
    --limit '11' \
    --offset '94' \
    --sortBy 'd7sFlCdW' \
    --status 'RETIRED' \
    > test.out 2>&1
eval_tap $? 2 'AdminGetChallenges' test.out

#- 3 AdminCreateChallenge
./ng net.accelbyte.sdk.cli.Main challenge adminCreateChallenge \
    --namespace "$AB_NAMESPACE" \
    --body '{"activeGoalsPerRotation": 25, "assignmentRule": "RANDOMIZED", "code": "1ru7EqyE", "description": "072kmRrz", "endAfter": 64, "endDate": "1992-03-29T00:00:00Z", "goalsVisibility": "SHOWALL", "name": "xTZY6PYy", "repeatAfter": 79, "rotation": "WEEKLY", "startDate": "1997-07-16T00:00:00Z"}' \
    > test.out 2>&1
eval_tap $? 3 'AdminCreateChallenge' test.out

#- 4 AdminGetChallenge
./ng net.accelbyte.sdk.cli.Main challenge adminGetChallenge \
    --challengeCode 'o70Mw1Iu' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 4 'AdminGetChallenge' test.out

#- 5 AdminUpdateChallenge
./ng net.accelbyte.sdk.cli.Main challenge adminUpdateChallenge \
    --challengeCode 'Hmuv4NkJ' \
    --namespace "$AB_NAMESPACE" \
    --body '{"activeGoalsPerRotation": 55, "assignmentRule": "UNSCHEDULED", "description": "Q1b1V3Hj", "endAfter": 16, "endDate": "1974-03-19T00:00:00Z", "goalsVisibility": "PERIODONLY", "name": "EDY79keE", "repeatAfter": 43, "rotation": "DAILY", "startDate": "1990-06-14T00:00:00Z"}' \
    > test.out 2>&1
eval_tap $? 5 'AdminUpdateChallenge' test.out

#- 6 AdminDeleteChallenge
./ng net.accelbyte.sdk.cli.Main challenge adminDeleteChallenge \
    --challengeCode 'NJlj5073' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 6 'AdminDeleteChallenge' test.out

#- 7 AdminGetGoals
./ng net.accelbyte.sdk.cli.Main challenge adminGetGoals \
    --challengeCode 'JDdBC6uJ' \
    --namespace "$AB_NAMESPACE" \
    --limit '54' \
    --offset '7' \
    --sortBy 'rSKxwbmR' \
    > test.out 2>&1
eval_tap $? 7 'AdminGetGoals' test.out

#- 8 AdminCreateGoal
./ng net.accelbyte.sdk.cli.Main challenge adminCreateGoal \
    --challengeCode '4dK5BYjT' \
    --namespace "$AB_NAMESPACE" \
    --body '{"code": "JuaA3caF", "description": "ieOSkWa7", "isActive": true, "name": "dSce4fYL", "requirementGroups": [{"operator": "AND", "predicates": [{"matcher": "GREATER_THAN", "parameterName": "hSuNvU2w", "parameterType": "STATISTIC", "targetValue": 0.8609141560178001}, {"matcher": "LESS_THAN_EQUAL", "parameterName": "twX6MjlU", "parameterType": "USERACCOUNT", "targetValue": 0.9853705999955625}, {"matcher": "LESS_THAN", "parameterName": "QrPNh271", "parameterType": "ACHIEVEMENT", "targetValue": 0.014081206357302145}]}, {"operator": "AND", "predicates": [{"matcher": "LESS_THAN", "parameterName": "fIKZTd8K", "parameterType": "USERACCOUNT", "targetValue": 0.28517996920779687}, {"matcher": "GREATER_THAN_EQUAL", "parameterName": "bOEXsDA1", "parameterType": "USERACCOUNT", "targetValue": 0.8278785463049698}, {"matcher": "GREATER_THAN", "parameterName": "E7BDBsig", "parameterType": "STATISTIC", "targetValue": 0.3967557866266732}]}, {"operator": "AND", "predicates": [{"matcher": "LESS_THAN", "parameterName": "X6QEZLNj", "parameterType": "STATISTIC", "targetValue": 0.4352334219378058}, {"matcher": "GREATER_THAN_EQUAL", "parameterName": "8sK6j6iz", "parameterType": "USERACCOUNT", "targetValue": 0.20838496062515477}, {"matcher": "GREATER_THAN", "parameterName": "amExsSFd", "parameterType": "USERACCOUNT", "targetValue": 0.8181301469896366}]}], "rewards": [{"itemId": "m717tcE6", "itemName": "U0jIrQsK", "qty": 0.9079991459744585, "type": "ENTITLEMENT"}, {"itemId": "4c53a3BG", "itemName": "9hXCcBae", "qty": 0.5970438454469017, "type": "STATISTIC"}, {"itemId": "JxDH0mD4", "itemName": "UgHobXee", "qty": 0.2693030132927897, "type": "ENTITLEMENT"}], "schedule": {"endTime": "1977-09-11T00:00:00Z", "order": 52, "startTime": "1984-08-03T00:00:00Z"}, "tags": ["TIbJYHSu", "98pIGkNA", "rgTgy8Rp"]}' \
    > test.out 2>&1
eval_tap $? 8 'AdminCreateGoal' test.out

#- 9 AdminGetGoal
./ng net.accelbyte.sdk.cli.Main challenge adminGetGoal \
    --challengeCode 'qcliV8mU' \
    --code 'hfLMpjpE' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 9 'AdminGetGoal' test.out

#- 10 AdminUpdateGoals
./ng net.accelbyte.sdk.cli.Main challenge adminUpdateGoals \
    --challengeCode 'JLfl5DoG' \
    --code 'qnZhbPgz' \
    --namespace "$AB_NAMESPACE" \
    --body '{"description": "LmSRKoyp", "isActive": true, "name": "dNZbCjZD", "requirementGroups": [{"operator": "AND", "predicates": [{"matcher": "LESS_THAN_EQUAL", "parameterName": "4NHrdzpX", "parameterType": "STATISTIC", "targetValue": 0.2996691417713063}, {"matcher": "GREATER_THAN", "parameterName": "0CPNNxPF", "parameterType": "USERACCOUNT", "targetValue": 0.18823025546461747}, {"matcher": "LESS_THAN_EQUAL", "parameterName": "NJ2t0h8C", "parameterType": "USERACCOUNT", "targetValue": 0.29232066153688174}]}, {"operator": "AND", "predicates": [{"matcher": "EQUAL", "parameterName": "5t0vyyR1", "parameterType": "USERACCOUNT", "targetValue": 0.2539561979058029}, {"matcher": "GREATER_THAN", "parameterName": "D2mHZXqY", "parameterType": "USERACCOUNT", "targetValue": 0.9293961866642296}, {"matcher": "EQUAL", "parameterName": "DOWAcEfQ", "parameterType": "STATISTIC", "targetValue": 0.01522061199589253}]}, {"operator": "AND", "predicates": [{"matcher": "GREATER_THAN_EQUAL", "parameterName": "0QxW5dkW", "parameterType": "STATISTIC", "targetValue": 0.20785871281862256}, {"matcher": "LESS_THAN_EQUAL", "parameterName": "mRsnwRNy", "parameterType": "USERACCOUNT", "targetValue": 0.29903917218823917}, {"matcher": "LESS_THAN", "parameterName": "brgqZLq5", "parameterType": "STATISTIC", "targetValue": 0.7962676285431396}]}], "rewards": [{"itemId": "aAp9sv5w", "itemName": "Zx6AbJKq", "qty": 0.7197563743483694, "type": "ENTITLEMENT"}, {"itemId": "FRhPn8HV", "itemName": "0u8QnCHA", "qty": 0.4412892483844565, "type": "ENTITLEMENT"}, {"itemId": "dNCe4ic3", "itemName": "CEx9E63X", "qty": 0.8704079729320542, "type": "ENTITLEMENT"}], "schedule": {"endTime": "1997-01-07T00:00:00Z", "order": 40, "startTime": "1975-01-01T00:00:00Z"}, "tags": ["W0n3QuRg", "3xogyPKm", "gK17dx34"]}' \
    > test.out 2>&1
eval_tap $? 10 'AdminUpdateGoals' test.out

#- 11 AdminDeleteGoal
./ng net.accelbyte.sdk.cli.Main challenge adminDeleteGoal \
    --challengeCode 'HPsNy7bV' \
    --code 'JyaTdpFH' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 11 'AdminDeleteGoal' test.out

#- 12 AdminGetPeriods
./ng net.accelbyte.sdk.cli.Main challenge adminGetPeriods \
    --challengeCode '0hsRohSC' \
    --namespace "$AB_NAMESPACE" \
    --limit '78' \
    --offset '10' \
    > test.out 2>&1
eval_tap $? 12 'AdminGetPeriods' test.out

#- 13 AdminRandomizeChallenge
./ng net.accelbyte.sdk.cli.Main challenge adminRandomizeChallenge \
    --challengeCode 'Q946RxTM' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 13 'AdminRandomizeChallenge' test.out

#- 14 AdminDeleteTiedChallenge
./ng net.accelbyte.sdk.cli.Main challenge adminDeleteTiedChallenge \
    --challengeCode 'UruSRurs' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 14 'AdminDeleteTiedChallenge' test.out

#- 15 AdminEvaluateProgress
./ng net.accelbyte.sdk.cli.Main challenge adminEvaluateProgress \
    --namespace "$AB_NAMESPACE" \
    --body '{"userIds": ["AkiJbw1S", "nZTQg89z", "RTQhO25Q"]}' \
    > test.out 2>&1
eval_tap $? 15 'AdminEvaluateProgress' test.out

#- 16 AdminGetUserRewards
./ng net.accelbyte.sdk.cli.Main challenge adminGetUserRewards \
    --namespace "$AB_NAMESPACE" \
    --userId 'NtKymQ2F' \
    --limit '36' \
    --offset '60' \
    --sortBy 'Ym6VLQuK' \
    --status 'CLAIMED' \
    > test.out 2>&1
eval_tap $? 16 'AdminGetUserRewards' test.out

#- 17 GetChallenges
./ng net.accelbyte.sdk.cli.Main challenge getChallenges \
    --namespace "$AB_NAMESPACE" \
    --limit '34' \
    --offset '56' \
    --sortBy 'wJtUVOgJ' \
    --status 'RETIRED' \
    > test.out 2>&1
eval_tap $? 17 'GetChallenges' test.out

#- 18 PublicGetScheduledGoals
./ng net.accelbyte.sdk.cli.Main challenge publicGetScheduledGoals \
    --challengeCode '1w7F2Yrx' \
    --namespace "$AB_NAMESPACE" \
    --limit '0' \
    --offset '78' \
    --tags 'hYnPMAeG,5JtsHsSb,53WhC8tu' \
    > test.out 2>&1
eval_tap $? 18 'PublicGetScheduledGoals' test.out

#- 19 EvaluateMyProgress
./ng net.accelbyte.sdk.cli.Main challenge evaluateMyProgress \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 19 'EvaluateMyProgress' test.out

#- 20 PublicGetUserProgression
./ng net.accelbyte.sdk.cli.Main challenge publicGetUserProgression \
    --challengeCode 'ZWw4Un3n' \
    --namespace "$AB_NAMESPACE" \
    --goalCode 'XGJkJsrU' \
    --limit '63' \
    --offset '98' \
    --tags 'jkS3S3Ka,GOg5cY6w,8zi9Td1f' \
    > test.out 2>&1
eval_tap $? 20 'PublicGetUserProgression' test.out

#- 21 PublicGetUserRewards
./ng net.accelbyte.sdk.cli.Main challenge publicGetUserRewards \
    --namespace "$AB_NAMESPACE" \
    --limit '81' \
    --offset '86' \
    --sortBy 'NJ8HhZTC' \
    --status 'UNCLAIMED' \
    > test.out 2>&1
eval_tap $? 21 'PublicGetUserRewards' test.out

#- 22 PublicClaimUserRewards
./ng net.accelbyte.sdk.cli.Main challenge publicClaimUserRewards \
    --namespace "$AB_NAMESPACE" \
    --body '{"rewardIDs": ["bHGlw7Mg", "apgpyakM", "LWkN4Sge"]}' \
    > test.out 2>&1
eval_tap $? 22 'PublicClaimUserRewards' test.out


rm -f "tmp.dat"

exit $EXIT_CODE