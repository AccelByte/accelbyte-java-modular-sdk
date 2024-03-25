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
    --limit '89' \
    --offset '0' \
    --sortBy '9mlDkOw0' \
    --status 'RETIRED' \
    > test.out 2>&1
eval_tap $? 2 'AdminGetChallenges' test.out

#- 3 AdminCreateChallenge
./ng net.accelbyte.sdk.cli.Main challenge adminCreateChallenge \
    --namespace "$AB_NAMESPACE" \
    --body '{"activeGoalsPerRotation": 3, "assignmentRule": "UNSCHEDULED", "code": "a42wHYiH", "description": "cxcHcGrl", "endAfter": 25, "endDate": "1989-03-30T00:00:00Z", "goalsVisibility": "SHOWALL", "name": "7eg6ORKc", "rotation": "MONTHLY", "startDate": "1974-05-07T00:00:00Z"}' \
    > test.out 2>&1
eval_tap $? 3 'AdminCreateChallenge' test.out

#- 4 AdminGetChallenge
./ng net.accelbyte.sdk.cli.Main challenge adminGetChallenge \
    --challengeCode '9fcp6dJr' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 4 'AdminGetChallenge' test.out

#- 5 AdminUpdateChallenge
./ng net.accelbyte.sdk.cli.Main challenge adminUpdateChallenge \
    --challengeCode 'uln6sIzK' \
    --namespace "$AB_NAMESPACE" \
    --body '{"activeGoalsPerRotation": 47, "assignmentRule": "FIXED", "description": "NXnidlPo", "endAfter": 71, "endDate": "1979-03-24T00:00:00Z", "goalsVisibility": "SHOWALL", "name": "w29HSTBO", "rotation": "MONTHLY", "startDate": "1991-03-13T00:00:00Z"}' \
    > test.out 2>&1
eval_tap $? 5 'AdminUpdateChallenge' test.out

#- 6 AdminDeleteChallenge
./ng net.accelbyte.sdk.cli.Main challenge adminDeleteChallenge \
    --challengeCode 'fcX3vqnX' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 6 'AdminDeleteChallenge' test.out

#- 7 AdminGetGoals
./ng net.accelbyte.sdk.cli.Main challenge adminGetGoals \
    --challengeCode 'Fp1qyZxZ' \
    --namespace "$AB_NAMESPACE" \
    --limit '45' \
    --offset '14' \
    --sortBy '26sN237m' \
    > test.out 2>&1
eval_tap $? 7 'AdminGetGoals' test.out

#- 8 AdminCreateGoal
./ng net.accelbyte.sdk.cli.Main challenge adminCreateGoal \
    --challengeCode 'hKAlB2of' \
    --namespace "$AB_NAMESPACE" \
    --body '{"code": "gwFj5Pi1", "description": "zO5g4guS", "isActive": true, "name": "kdBCE80e", "requirementGroups": [{"operator": "AND", "predicates": [{"matcher": "EQUAL", "parameterName": "xkPWm03w", "parameterType": "ACHIEVEMENT", "targetValue": 0.1814201509590858}, {"matcher": "EQUAL", "parameterName": "tXi2LnZi", "parameterType": "STATISTIC", "targetValue": 0.5100371289393849}, {"matcher": "EQUAL", "parameterName": "Vp0Sfuca", "parameterType": "ACHIEVEMENT", "targetValue": 0.8580015237849065}]}, {"operator": "AND", "predicates": [{"matcher": "GREATER_THAN", "parameterName": "GDyBu8HF", "parameterType": "ACHIEVEMENT", "targetValue": 0.43311008280610774}, {"matcher": "EQUAL", "parameterName": "jlWSEuck", "parameterType": "ACHIEVEMENT", "targetValue": 0.5102496890171347}, {"matcher": "LESS_THAN_EQUAL", "parameterName": "pQeKCbui", "parameterType": "USERACCOUNT", "targetValue": 0.6715587338666774}]}, {"operator": "AND", "predicates": [{"matcher": "LESS_THAN", "parameterName": "wLUEA5gf", "parameterType": "USERACCOUNT", "targetValue": 0.2809300343496163}, {"matcher": "LESS_THAN_EQUAL", "parameterName": "FLPFDfmC", "parameterType": "ACHIEVEMENT", "targetValue": 0.8685906499957253}, {"matcher": "GREATER_THAN_EQUAL", "parameterName": "k0WOPvPI", "parameterType": "USERACCOUNT", "targetValue": 0.9443014415145179}]}], "rewards": [{"itemId": "7t2IQAFi", "itemName": "LMsEpGEf", "qty": 0.15107321318097888, "type": "ENTITLEMENT"}, {"itemId": "7Gk9ave6", "itemName": "EtM4XoL5", "qty": 0.6919266398932395, "type": "STATISTIC"}, {"itemId": "tbw5sgeN", "itemName": "ULRbHj6E", "qty": 0.7077331643840047, "type": "STATISTIC"}], "schedule": {"endTime": "1983-07-18T00:00:00Z", "order": 62, "startTime": "1977-05-30T00:00:00Z"}, "tags": ["DUkCddpf", "JFy1POD2", "14WcCWGm"]}' \
    > test.out 2>&1
eval_tap $? 8 'AdminCreateGoal' test.out

#- 9 AdminGetGoal
./ng net.accelbyte.sdk.cli.Main challenge adminGetGoal \
    --challengeCode 'uzhJsBZI' \
    --code 'ldKOkkIU' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 9 'AdminGetGoal' test.out

#- 10 AdminUpdateGoals
./ng net.accelbyte.sdk.cli.Main challenge adminUpdateGoals \
    --challengeCode 'BL4ps5eP' \
    --code 'dcYRNX8d' \
    --namespace "$AB_NAMESPACE" \
    --body '{"description": "3nqrXyMn", "isActive": false, "name": "IAjAxeRB", "requirementGroups": [{"operator": "AND", "predicates": [{"matcher": "GREATER_THAN", "parameterName": "UiWHPBL0", "parameterType": "ACHIEVEMENT", "targetValue": 0.06342637498564563}, {"matcher": "GREATER_THAN", "parameterName": "G69FTJ00", "parameterType": "USERACCOUNT", "targetValue": 0.47522474775162016}, {"matcher": "LESS_THAN_EQUAL", "parameterName": "cJKVCcol", "parameterType": "USERACCOUNT", "targetValue": 0.2298105475891481}]}, {"operator": "AND", "predicates": [{"matcher": "LESS_THAN", "parameterName": "L4TPtnzh", "parameterType": "ACHIEVEMENT", "targetValue": 0.627645179169257}, {"matcher": "GREATER_THAN_EQUAL", "parameterName": "tKXee2T4", "parameterType": "USERACCOUNT", "targetValue": 0.6351566499564737}, {"matcher": "LESS_THAN_EQUAL", "parameterName": "EDZAp3bu", "parameterType": "USERACCOUNT", "targetValue": 0.31131469251300725}]}, {"operator": "AND", "predicates": [{"matcher": "GREATER_THAN_EQUAL", "parameterName": "n8tQ7Mvs", "parameterType": "STATISTIC", "targetValue": 0.7152167876088159}, {"matcher": "LESS_THAN", "parameterName": "DYQmgHff", "parameterType": "ACHIEVEMENT", "targetValue": 0.44959304874962625}, {"matcher": "GREATER_THAN_EQUAL", "parameterName": "sgCaT7Fa", "parameterType": "ACHIEVEMENT", "targetValue": 0.20118506976521433}]}], "rewards": [{"itemId": "8hNUC1C2", "itemName": "i0D1MRGJ", "qty": 0.46862993480137194, "type": "ENTITLEMENT"}, {"itemId": "mqt8Ufbo", "itemName": "ysWTOdWJ", "qty": 0.7831778098828288, "type": "ENTITLEMENT"}, {"itemId": "iHPfPcUn", "itemName": "TXLjlkzG", "qty": 0.959366034143112, "type": "STATISTIC"}], "schedule": {"endTime": "1972-11-27T00:00:00Z", "order": 70, "startTime": "1997-04-03T00:00:00Z"}, "tags": ["t2W28W3t", "J4GBuJSt", "6E3s84bW"]}' \
    > test.out 2>&1
eval_tap $? 10 'AdminUpdateGoals' test.out

#- 11 AdminDeleteGoal
./ng net.accelbyte.sdk.cli.Main challenge adminDeleteGoal \
    --challengeCode 'kA25zOuE' \
    --code '8VTboHmG' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 11 'AdminDeleteGoal' test.out

#- 12 AdminGetPeriods
./ng net.accelbyte.sdk.cli.Main challenge adminGetPeriods \
    --challengeCode 'nCQXqhUS' \
    --namespace "$AB_NAMESPACE" \
    --limit '2' \
    --offset '71' \
    > test.out 2>&1
eval_tap $? 12 'AdminGetPeriods' test.out

#- 13 AdminRandomizeChallenge
./ng net.accelbyte.sdk.cli.Main challenge adminRandomizeChallenge \
    --challengeCode 'S5Z1ZIjC' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 13 'AdminRandomizeChallenge' test.out

#- 14 AdminDeleteTiedChallenge
./ng net.accelbyte.sdk.cli.Main challenge adminDeleteTiedChallenge \
    --challengeCode '1NKtHIz3' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 14 'AdminDeleteTiedChallenge' test.out

#- 15 AdminEvaluateProgress
./ng net.accelbyte.sdk.cli.Main challenge adminEvaluateProgress \
    --namespace "$AB_NAMESPACE" \
    --body '{"userIds": ["YsXCDqc4", "APzqzemS", "eqScgmD9"]}' \
    > test.out 2>&1
eval_tap $? 15 'AdminEvaluateProgress' test.out

#- 16 AdminGetUserRewards
./ng net.accelbyte.sdk.cli.Main challenge adminGetUserRewards \
    --namespace "$AB_NAMESPACE" \
    --userId 'ArQMfKes' \
    --limit '94' \
    --offset '24' \
    --sortBy 'Fxe3VY06' \
    --status 'CLAIMED' \
    > test.out 2>&1
eval_tap $? 16 'AdminGetUserRewards' test.out

#- 17 GetChallenges
./ng net.accelbyte.sdk.cli.Main challenge getChallenges \
    --namespace "$AB_NAMESPACE" \
    --limit '44' \
    --offset '54' \
    --sortBy 'Hm19rM7Z' \
    --status 'TIED' \
    > test.out 2>&1
eval_tap $? 17 'GetChallenges' test.out

#- 18 PublicGetScheduledGoals
./ng net.accelbyte.sdk.cli.Main challenge publicGetScheduledGoals \
    --challengeCode 'zOF03EhH' \
    --namespace "$AB_NAMESPACE" \
    --limit '51' \
    --offset '57' \
    --tags 'wzkbbotg,viwblIWs,hXud7nx9' \
    > test.out 2>&1
eval_tap $? 18 'PublicGetScheduledGoals' test.out

#- 19 EvaluateMyProgress
./ng net.accelbyte.sdk.cli.Main challenge evaluateMyProgress \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 19 'EvaluateMyProgress' test.out

#- 20 PublicGetUserProgression
./ng net.accelbyte.sdk.cli.Main challenge publicGetUserProgression \
    --challengeCode 'LoqtmmW9' \
    --namespace "$AB_NAMESPACE" \
    --goalCode 'tmNPlfJj' \
    > test.out 2>&1
eval_tap $? 20 'PublicGetUserProgression' test.out

#- 21 PublicGetUserRewards
./ng net.accelbyte.sdk.cli.Main challenge publicGetUserRewards \
    --namespace "$AB_NAMESPACE" \
    --limit '48' \
    --offset '55' \
    --sortBy 'cgbIsyzB' \
    --status 'CLAIMED' \
    > test.out 2>&1
eval_tap $? 21 'PublicGetUserRewards' test.out

#- 22 PublicClaimUserRewards
./ng net.accelbyte.sdk.cli.Main challenge publicClaimUserRewards \
    --namespace "$AB_NAMESPACE" \
    --body '{"rewardIDs": ["avDAP3Lr", "qh8QeEPd", "90MIJYGS"]}' \
    > test.out 2>&1
eval_tap $? 22 'PublicClaimUserRewards' test.out


rm -f "tmp.dat"

exit $EXIT_CODE