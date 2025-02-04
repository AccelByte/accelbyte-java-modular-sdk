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
echo "1..38"

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
    --keyword 'jntjO6gh' \
    --limit '24' \
    --offset '58' \
    --sortBy 'createdAt:asc' \
    --status 'TIED' \
    --tags 'ZtJgWUHO,z0v7qYmD,3phkGpZ1' \
    > test.out 2>&1
eval_tap $? 2 'AdminGetChallenges' test.out

#- 3 AdminCreateChallenge
./ng net.accelbyte.sdk.cli.Main challenge adminCreateChallenge \
    --namespace "$AB_NAMESPACE" \
    --body '{"activeGoalsPerRotation": 12, "assignmentRule": "RANDOMIZED", "code": "kJPA1ipD", "description": "tqLC4axh", "endAfter": 55, "endDate": "1991-09-14T00:00:00Z", "goalsVisibility": "PERIODONLY", "name": "bjwRx0Pi", "randomizedPerRotation": true, "repeatAfter": 70, "resetConfig": {"resetDate": 66, "resetDay": 86, "resetTime": "pbiOXq2W"}, "rotation": "NONE", "startDate": "1986-07-06T00:00:00Z", "tags": ["eqPkYS1J", "9bq0tGE9", "083T59Mw"]}' \
    > test.out 2>&1
eval_tap $? 3 'AdminCreateChallenge' test.out

#- 4 AdminGetActiveChallenges
./ng net.accelbyte.sdk.cli.Main challenge adminGetActiveChallenges \
    --namespace "$AB_NAMESPACE" \
    --userId 'XmEq8kY6' \
    --limit '25' \
    --offset '1' \
    > test.out 2>&1
eval_tap $? 4 'AdminGetActiveChallenges' test.out

#- 5 AdminGetChallenge
./ng net.accelbyte.sdk.cli.Main challenge adminGetChallenge \
    --challengeCode 'ZYZUL6KR' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 5 'AdminGetChallenge' test.out

#- 6 AdminUpdateChallenge
./ng net.accelbyte.sdk.cli.Main challenge adminUpdateChallenge \
    --challengeCode 'RsvP3zyX' \
    --namespace "$AB_NAMESPACE" \
    --body '{"activeGoalsPerRotation": 53, "assignmentRule": "UNSCHEDULED", "description": "SbhxQvHX", "endAfter": 50, "endDate": "1982-04-13T00:00:00Z", "goalsVisibility": "PERIODONLY", "name": "pEgs5BYG", "randomizedPerRotation": true, "repeatAfter": 71, "resetConfig": {"resetDate": 25, "resetDay": 94, "resetTime": "azFpX54Q"}, "rotation": "WEEKLY", "startDate": "1983-05-04T00:00:00Z", "tags": ["1SFvloaS", "7XpJiDeK", "1SBjfFsa"]}' \
    > test.out 2>&1
eval_tap $? 6 'AdminUpdateChallenge' test.out

#- 7 AdminDeleteChallenge
./ng net.accelbyte.sdk.cli.Main challenge adminDeleteChallenge \
    --challengeCode 'KL2chRkp' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 7 'AdminDeleteChallenge' test.out

#- 8 AdminGetGoals
./ng net.accelbyte.sdk.cli.Main challenge adminGetGoals \
    --challengeCode 'dBEPFddx' \
    --namespace "$AB_NAMESPACE" \
    --limit '35' \
    --offset '22' \
    --sortBy 'createdAt' \
    > test.out 2>&1
eval_tap $? 8 'AdminGetGoals' test.out

#- 9 AdminCreateGoal
./ng net.accelbyte.sdk.cli.Main challenge adminCreateGoal \
    --challengeCode 'McgoJC0K' \
    --namespace "$AB_NAMESPACE" \
    --body '{"code": "IzSUvGgS", "description": "Y8CVTYYb", "isActive": false, "name": "gemMjlKP", "requirementGroups": [{"operator": "AND", "predicates": [{"matcher": "LESS_THAN_EQUAL", "parameterName": "voNvsh77", "parameterType": "USERACCOUNT", "statCycleId": "r9UmZXaC", "targetValue": 0.32364296635821543}, {"matcher": "GREATER_THAN_EQUAL", "parameterName": "jeMGm9QO", "parameterType": "ACHIEVEMENT", "statCycleId": "r9jsE1AV", "targetValue": 0.2912581961127424}, {"matcher": "LESS_THAN_EQUAL", "parameterName": "6o1rpr07", "parameterType": "STATISTIC", "statCycleId": "rXonfwUg", "targetValue": 0.5088907349962701}]}, {"operator": "AND", "predicates": [{"matcher": "EQUAL", "parameterName": "G19f0B20", "parameterType": "ENTITLEMENT", "statCycleId": "vLA8gULK", "targetValue": 0.21167061332329584}, {"matcher": "EQUAL", "parameterName": "49HPvxYo", "parameterType": "ENTITLEMENT", "statCycleId": "YyNVo7zP", "targetValue": 0.6485269154567392}, {"matcher": "GREATER_THAN", "parameterName": "tEkzNyxr", "parameterType": "USERACCOUNT", "statCycleId": "Y63Sr4uV", "targetValue": 0.19655897947457757}]}, {"operator": "AND", "predicates": [{"matcher": "GREATER_THAN_EQUAL", "parameterName": "xRCBYzw0", "parameterType": "STATISTIC_CYCLE", "statCycleId": "IQJ02AqA", "targetValue": 0.2399773053739448}, {"matcher": "EQUAL", "parameterName": "u19nbdjL", "parameterType": "ENTITLEMENT", "statCycleId": "uL1ayGsf", "targetValue": 0.10513174200888975}, {"matcher": "GREATER_THAN_EQUAL", "parameterName": "Oi2IxUFF", "parameterType": "ACHIEVEMENT", "statCycleId": "1PWbtcvH", "targetValue": 0.9377631535763495}]}], "rewards": [{"itemId": "gqKsFziD", "itemName": "gA9e8uM3", "qty": 0.48284057817061243, "type": "STATISTIC"}, {"itemId": "XSAuaYsJ", "itemName": "T1FxXFYU", "qty": 0.33858374177624706, "type": "STATISTIC"}, {"itemId": "wbqNCAt9", "itemName": "QNPBUslW", "qty": 0.4181276785306768, "type": "ENTITLEMENT"}], "schedule": {"endTime": "1992-11-28T00:00:00Z", "order": 67, "startTime": "1991-06-21T00:00:00Z"}, "tags": ["ExOHMj9S", "iiU2nPh3", "iatiOj2h"]}' \
    > test.out 2>&1
eval_tap $? 9 'AdminCreateGoal' test.out

#- 10 AdminGetGoal
./ng net.accelbyte.sdk.cli.Main challenge adminGetGoal \
    --challengeCode '8628CoPA' \
    --code 'MRCIDvlM' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 10 'AdminGetGoal' test.out

#- 11 AdminUpdateGoals
./ng net.accelbyte.sdk.cli.Main challenge adminUpdateGoals \
    --challengeCode 'pLW8juAl' \
    --code 'zlFDzkC2' \
    --namespace "$AB_NAMESPACE" \
    --body '{"description": "F0a5Icrh", "isActive": false, "name": "VsfmiB1B", "requirementGroups": [{"operator": "AND", "predicates": [{"matcher": "EQUAL", "parameterName": "hl96omq3", "parameterType": "ENTITLEMENT", "statCycleId": "Wi1ZLhxg", "targetValue": 0.024200829965001835}, {"matcher": "LESS_THAN_EQUAL", "parameterName": "SCJljzwC", "parameterType": "ENTITLEMENT", "statCycleId": "XVaaOfUK", "targetValue": 0.595823376801367}, {"matcher": "LESS_THAN", "parameterName": "yMOLbY0H", "parameterType": "ACHIEVEMENT", "statCycleId": "go595ITW", "targetValue": 0.5511502226304777}]}, {"operator": "AND", "predicates": [{"matcher": "LESS_THAN_EQUAL", "parameterName": "ztMY9mrf", "parameterType": "STATISTIC_CYCLE", "statCycleId": "dFL5VKOC", "targetValue": 0.22741205232032213}, {"matcher": "LESS_THAN_EQUAL", "parameterName": "Uu5BQzCZ", "parameterType": "ACHIEVEMENT", "statCycleId": "pGY9W7FQ", "targetValue": 0.5462712288635504}, {"matcher": "EQUAL", "parameterName": "HwuAAuxP", "parameterType": "STATISTIC_CYCLE", "statCycleId": "G4zt0dhY", "targetValue": 0.08173483919958824}]}, {"operator": "AND", "predicates": [{"matcher": "LESS_THAN_EQUAL", "parameterName": "s65P2JHV", "parameterType": "STATISTIC_CYCLE", "statCycleId": "nc3dDxRY", "targetValue": 0.47326719204387446}, {"matcher": "LESS_THAN_EQUAL", "parameterName": "ViOpV1W4", "parameterType": "STATISTIC_CYCLE", "statCycleId": "nodUshAD", "targetValue": 0.9579039896554541}, {"matcher": "GREATER_THAN", "parameterName": "3WTWWo07", "parameterType": "STATISTIC", "statCycleId": "oIUYHUqt", "targetValue": 0.9571718563789194}]}], "rewards": [{"itemId": "aVxbDYrR", "itemName": "bzmCEBAa", "qty": 0.3447930518565595, "type": "ENTITLEMENT"}, {"itemId": "D8brYVo5", "itemName": "oLu0sXxE", "qty": 0.24958613058407864, "type": "ENTITLEMENT"}, {"itemId": "JS0W8olE", "itemName": "GMIIri1z", "qty": 0.0006758556095394219, "type": "ENTITLEMENT"}], "schedule": {"endTime": "1971-03-03T00:00:00Z", "order": 40, "startTime": "1971-05-20T00:00:00Z"}, "tags": ["dpTJITA5", "ubPrYHVQ", "tE9NrTc7"]}' \
    > test.out 2>&1
eval_tap $? 11 'AdminUpdateGoals' test.out

#- 12 AdminDeleteGoal
./ng net.accelbyte.sdk.cli.Main challenge adminDeleteGoal \
    --challengeCode 'CoN6lyrN' \
    --code '28nNiNOA' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 12 'AdminDeleteGoal' test.out

#- 13 AdminListSchedulesByGoal
./ng net.accelbyte.sdk.cli.Main challenge adminListSchedulesByGoal \
    --challengeCode 'szaeEX67' \
    --code 'D5ED2aBw' \
    --namespace "$AB_NAMESPACE" \
    --limit '77' \
    --offset '58' \
    --userId '8oCEYvTj' \
    > test.out 2>&1
eval_tap $? 13 'AdminListSchedulesByGoal' test.out

#- 14 AdminGetPeriods
./ng net.accelbyte.sdk.cli.Main challenge adminGetPeriods \
    --challengeCode '8ohRQYGc' \
    --namespace "$AB_NAMESPACE" \
    --limit '72' \
    --offset '65' \
    > test.out 2>&1
eval_tap $? 14 'AdminGetPeriods' test.out

#- 15 AdminRandomizeChallenge
./ng net.accelbyte.sdk.cli.Main challenge adminRandomizeChallenge \
    --challengeCode 'A95KjA7m' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 15 'AdminRandomizeChallenge' test.out

#- 16 AdminListSchedules
./ng net.accelbyte.sdk.cli.Main challenge adminListSchedules \
    --challengeCode 'fSIsELZA' \
    --namespace "$AB_NAMESPACE" \
    --dateTime '1992-07-03T00:00:00Z' \
    --limit '22' \
    --offset '2' \
    --userId 'gY9F1gQd' \
    > test.out 2>&1
eval_tap $? 16 'AdminListSchedules' test.out

#- 17 AdminDeleteTiedChallenge
./ng net.accelbyte.sdk.cli.Main challenge adminDeleteTiedChallenge \
    --challengeCode 'FtIR02Ne' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 17 'AdminDeleteTiedChallenge' test.out

#- 18 AdminUpdateTiedChallengeSchedule
./ng net.accelbyte.sdk.cli.Main challenge adminUpdateTiedChallengeSchedule \
    --challengeCode 'hOmGsm4D' \
    --namespace "$AB_NAMESPACE" \
    --body '{"action": "ACCELERATE", "endDate": "1988-06-20T00:00:00Z"}' \
    > test.out 2>&1
eval_tap $? 18 'AdminUpdateTiedChallengeSchedule' test.out

#- 19 AdminGetAssignmentPlugin
./ng net.accelbyte.sdk.cli.Main challenge adminGetAssignmentPlugin \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 19 'AdminGetAssignmentPlugin' test.out

#- 20 AdminUpdateAssignmentPlugin
./ng net.accelbyte.sdk.cli.Main challenge adminUpdateAssignmentPlugin \
    --namespace "$AB_NAMESPACE" \
    --body '{"appName": "zdmO52VC", "extendType": "CUSTOM", "grpcServerAddress": "fPBYXPgu"}' \
    > test.out 2>&1
eval_tap $? 20 'AdminUpdateAssignmentPlugin' test.out

#- 21 AdminCreateAssignmentPlugin
./ng net.accelbyte.sdk.cli.Main challenge adminCreateAssignmentPlugin \
    --namespace "$AB_NAMESPACE" \
    --body '{"appName": "5IyBrn9A", "extendType": "CUSTOM", "grpcServerAddress": "60Soc8yg"}' \
    > test.out 2>&1
eval_tap $? 21 'AdminCreateAssignmentPlugin' test.out

#- 22 AdminDeleteAssignmentPlugin
./ng net.accelbyte.sdk.cli.Main challenge adminDeleteAssignmentPlugin \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 22 'AdminDeleteAssignmentPlugin' test.out

#- 23 AdminEvaluateProgress
./ng net.accelbyte.sdk.cli.Main challenge adminEvaluateProgress \
    --namespace "$AB_NAMESPACE" \
    --body '{"userIds": ["WF8F6Jbg", "ID286FJD", "9tACahEA"]}' \
    > test.out 2>&1
eval_tap $? 23 'AdminEvaluateProgress' test.out

#- 24 AdminClaimUsersRewards
./ng net.accelbyte.sdk.cli.Main challenge adminClaimUsersRewards \
    --namespace "$AB_NAMESPACE" \
    --body '[{"rewardIds": ["RCKwvZFV", "d0sZKpt0", "86cIDb0L"], "userId": "w9NcHv1w"}, {"rewardIds": ["WWTPo6Nq", "EHOkMevP", "s70IWBCA"], "userId": "1dfK4gVF"}, {"rewardIds": ["70RHLM93", "wFynRgnO", "qPnRlX6G"], "userId": "5KBm8qvC"}]' \
    > test.out 2>&1
eval_tap $? 24 'AdminClaimUsersRewards' test.out

#- 25 AdminClaimUserRewardsByGoalCode
./ng net.accelbyte.sdk.cli.Main challenge adminClaimUserRewardsByGoalCode \
    --challengeCode 'CsyaMxPi' \
    --namespace "$AB_NAMESPACE" \
    --userId 'NmEwaHte' \
    --body '{"goalCode": "zwGZSt6A"}' \
    > test.out 2>&1
eval_tap $? 25 'AdminClaimUserRewardsByGoalCode' test.out

#- 26 AdminGetUserProgression
./ng net.accelbyte.sdk.cli.Main challenge adminGetUserProgression \
    --challengeCode 'CXdwlT55' \
    --namespace "$AB_NAMESPACE" \
    --userId 'uEMhrwXf' \
    --dateTime '1974-12-16T00:00:00Z' \
    --goalCode '0NjIFsSg' \
    --limit '51' \
    --offset '93' \
    --tags 'MWFxnmIL,zH9vX2pO,B2U5ARiV' \
    > test.out 2>&1
eval_tap $? 26 'AdminGetUserProgression' test.out

#- 27 AdminGetUserRewards
./ng net.accelbyte.sdk.cli.Main challenge adminGetUserRewards \
    --namespace "$AB_NAMESPACE" \
    --userId 'tUt3bK2J' \
    --challengeCode 'Rns2fiSJ' \
    --goalProgressionId 'JSijLica' \
    --limit '24' \
    --offset '47' \
    --sortBy 'updatedAt:desc' \
    --status 'CLAIMED' \
    > test.out 2>&1
eval_tap $? 27 'AdminGetUserRewards' test.out

#- 28 AdminClaimUserRewards
./ng net.accelbyte.sdk.cli.Main challenge adminClaimUserRewards \
    --namespace "$AB_NAMESPACE" \
    --userId 'KCzZyTH6' \
    --body '{"rewardIDs": ["7IBw2OkS", "9maJLSNV", "INJFg7gC"]}' \
    > test.out 2>&1
eval_tap $? 28 'AdminClaimUserRewards' test.out

#- 29 GetChallenges
./ng net.accelbyte.sdk.cli.Main challenge getChallenges \
    --namespace "$AB_NAMESPACE" \
    --keyword 'KqmvNtgw' \
    --limit '12' \
    --offset '37' \
    --sortBy 'createdAt' \
    --status 'INIT' \
    --tags 'n4KlLxbr,wzlIHamx,fsN1Fwmc' \
    > test.out 2>&1
eval_tap $? 29 'GetChallenges' test.out

#- 30 PublicGetScheduledGoals
./ng net.accelbyte.sdk.cli.Main challenge publicGetScheduledGoals \
    --challengeCode 'N4myIeTK' \
    --namespace "$AB_NAMESPACE" \
    --limit '6' \
    --offset '94' \
    --tags 'd5LHPDWp,aU6YLiD2,YxYFCPNL' \
    > test.out 2>&1
eval_tap $? 30 'PublicGetScheduledGoals' test.out

#- 31 PublicListSchedulesByGoal
./ng net.accelbyte.sdk.cli.Main challenge publicListSchedulesByGoal \
    --challengeCode 'LG0s6aik' \
    --code 'NRhis9NV' \
    --namespace "$AB_NAMESPACE" \
    --limit '53' \
    --offset '22' \
    > test.out 2>&1
eval_tap $? 31 'PublicListSchedulesByGoal' test.out

#- 32 PublicListSchedules
./ng net.accelbyte.sdk.cli.Main challenge publicListSchedules \
    --challengeCode 'RF0czU8i' \
    --namespace "$AB_NAMESPACE" \
    --dateTime '1972-12-21T00:00:00Z' \
    --limit '35' \
    --offset '37' \
    > test.out 2>&1
eval_tap $? 32 'PublicListSchedules' test.out

#- 33 PublicClaimUserRewardsByGoalCode
./ng net.accelbyte.sdk.cli.Main challenge publicClaimUserRewardsByGoalCode \
    --challengeCode 'plCPpjVK' \
    --namespace "$AB_NAMESPACE" \
    --body '{"goalCode": "mmcpcGTk"}' \
    > test.out 2>&1
eval_tap $? 33 'PublicClaimUserRewardsByGoalCode' test.out

#- 34 EvaluateMyProgress
./ng net.accelbyte.sdk.cli.Main challenge evaluateMyProgress \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 34 'EvaluateMyProgress' test.out

#- 35 PublicGetUserProgression
./ng net.accelbyte.sdk.cli.Main challenge publicGetUserProgression \
    --challengeCode '2EVQeC0R' \
    --namespace "$AB_NAMESPACE" \
    --dateTime '1979-11-12T00:00:00Z' \
    --goalCode '1aowrhxr' \
    --limit '26' \
    --offset '28' \
    --tags 'iueDP9n5,AUG4pUhZ,sxgVyWvy' \
    > test.out 2>&1
eval_tap $? 35 'PublicGetUserProgression' test.out

#- 36 PublicGetPastUserProgression
./ng net.accelbyte.sdk.cli.Main challenge publicGetPastUserProgression \
    --challengeCode 'SOhyblah' \
    --index '87' \
    --namespace "$AB_NAMESPACE" \
    --goalCode 'cEgq3EDC' \
    --limit '62' \
    --offset '86' \
    --tags 'PaON1dIA,cuS14l6M,JOA9yIst' \
    > test.out 2>&1
eval_tap $? 36 'PublicGetPastUserProgression' test.out

#- 37 PublicGetUserRewards
./ng net.accelbyte.sdk.cli.Main challenge publicGetUserRewards \
    --namespace "$AB_NAMESPACE" \
    --challengeCode 'fssXnw3S' \
    --goalProgressionId 'zSYbawei' \
    --limit '9' \
    --offset '24' \
    --sortBy 'createdAt:desc' \
    --status 'CLAIMED' \
    > test.out 2>&1
eval_tap $? 37 'PublicGetUserRewards' test.out

#- 38 PublicClaimUserRewards
./ng net.accelbyte.sdk.cli.Main challenge publicClaimUserRewards \
    --namespace "$AB_NAMESPACE" \
    --body '{"rewardIDs": ["R5ReNVpd", "9pCcq9S4", "UBOCEf7O"]}' \
    > test.out 2>&1
eval_tap $? 38 'PublicClaimUserRewards' test.out


rm -f "tmp.dat"

exit $EXIT_CODE