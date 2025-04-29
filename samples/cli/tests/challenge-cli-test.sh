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
    --keyword 'KfKWRrtJ' \
    --limit '55' \
    --offset '69' \
    --sortBy 'updatedAt:desc' \
    --status 'TIED' \
    --tags 'gXzTKnTD,UYvLEUbF,p738ftBx' \
    > test.out 2>&1
eval_tap $? 2 'AdminGetChallenges' test.out

#- 3 AdminCreateChallenge
./ng net.accelbyte.sdk.cli.Main challenge adminCreateChallenge \
    --namespace "$AB_NAMESPACE" \
    --body '{"activeGoalsPerRotation": 90, "assignmentRule": "CUSTOM", "code": "IMeI6ziU", "description": "xZEvuf91", "endAfter": 30, "endDate": "1974-03-10T00:00:00Z", "goalsVisibility": "SHOWALL", "name": "bbkPOt33", "randomizedPerRotation": true, "repeatAfter": 8, "resetConfig": {"resetDate": 57, "resetDay": 94, "resetTime": "iCPHfBJJ"}, "rotation": "WEEKLY", "startDate": "1991-04-26T00:00:00Z", "tags": ["a9FQQfph", "K7odyXV2", "lGZvlk42"]}' \
    > test.out 2>&1
eval_tap $? 3 'AdminCreateChallenge' test.out

#- 4 AdminGetItemReferences
./ng net.accelbyte.sdk.cli.Main challenge adminGetItemReferences \
    --namespace "$AB_NAMESPACE" \
    --itemId 'ZsGYqOFG' \
    > test.out 2>&1
eval_tap $? 4 'AdminGetItemReferences' test.out

#- 5 AdminGetActiveChallenges
./ng net.accelbyte.sdk.cli.Main challenge adminGetActiveChallenges \
    --namespace "$AB_NAMESPACE" \
    --userId '6yA5vIa5' \
    --limit '48' \
    --offset '9' \
    > test.out 2>&1
eval_tap $? 5 'AdminGetActiveChallenges' test.out

#- 6 AdminGetChallenge
./ng net.accelbyte.sdk.cli.Main challenge adminGetChallenge \
    --challengeCode 'SMzUnDVE' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 6 'AdminGetChallenge' test.out

#- 7 AdminUpdateChallenge
./ng net.accelbyte.sdk.cli.Main challenge adminUpdateChallenge \
    --challengeCode 'Qfug2e4l' \
    --namespace "$AB_NAMESPACE" \
    --body '{"activeGoalsPerRotation": 30, "assignmentRule": "CUSTOM", "description": "a76T8Bok", "endAfter": 72, "endDate": "1990-03-24T00:00:00Z", "goalsVisibility": "SHOWALL", "name": "9a9x0tZg", "randomizedPerRotation": false, "repeatAfter": 25, "resetConfig": {"resetDate": 53, "resetDay": 55, "resetTime": "FYFrRbkL"}, "rotation": "NONE", "startDate": "1996-06-22T00:00:00Z", "tags": ["2AZxlMWN", "miLkzvPM", "q6OZ4Zu5"]}' \
    > test.out 2>&1
eval_tap $? 7 'AdminUpdateChallenge' test.out

#- 8 AdminDeleteChallenge
./ng net.accelbyte.sdk.cli.Main challenge adminDeleteChallenge \
    --challengeCode 'S7ToBpdP' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 8 'AdminDeleteChallenge' test.out

#- 9 AdminGetGoals
./ng net.accelbyte.sdk.cli.Main challenge adminGetGoals \
    --challengeCode 'NRtY2UQL' \
    --namespace "$AB_NAMESPACE" \
    --limit '26' \
    --offset '13' \
    --sortBy 'createdAt:asc' \
    --tags '6mnzDxNL,iKZ75wdc,2WTpjtuz' \
    > test.out 2>&1
eval_tap $? 9 'AdminGetGoals' test.out

#- 10 AdminCreateGoal
./ng net.accelbyte.sdk.cli.Main challenge adminCreateGoal \
    --challengeCode 'lfiyoOKf' \
    --namespace "$AB_NAMESPACE" \
    --body '{"code": "Y2Xgf4og", "description": "bsX7I08d", "isActive": false, "name": "0wT4xFGy", "requirementGroups": [{"operator": "AND", "predicates": [{"matcher": "LESS_THAN_EQUAL", "parameterName": "u3xFdymB", "parameterType": "STATISTIC_CYCLE", "statCycleId": "1J6fCXQf", "targetValue": 0.326784855820062}, {"matcher": "LESS_THAN_EQUAL", "parameterName": "OUD2d7gU", "parameterType": "USERACCOUNT", "statCycleId": "kKjpVKmC", "targetValue": 0.18921145249374227}, {"matcher": "EQUAL", "parameterName": "x95TWaEY", "parameterType": "STATISTIC", "statCycleId": "NKONVS3P", "targetValue": 0.4216654250348365}]}, {"operator": "AND", "predicates": [{"matcher": "EQUAL", "parameterName": "5rJNtFYP", "parameterType": "USERACCOUNT", "statCycleId": "wk3vDZfl", "targetValue": 0.6612359816087768}, {"matcher": "GREATER_THAN_EQUAL", "parameterName": "THREPeOa", "parameterType": "ACHIEVEMENT", "statCycleId": "tjcQuI0I", "targetValue": 0.16972534630320024}, {"matcher": "LESS_THAN_EQUAL", "parameterName": "mTkLuFjq", "parameterType": "ENTITLEMENT", "statCycleId": "OpPyzvzd", "targetValue": 0.41527244042446165}]}, {"operator": "AND", "predicates": [{"matcher": "LESS_THAN_EQUAL", "parameterName": "uugOPykr", "parameterType": "STATISTIC", "statCycleId": "iro6O0Iz", "targetValue": 0.3454533248916314}, {"matcher": "GREATER_THAN_EQUAL", "parameterName": "d1QIaRUI", "parameterType": "ACHIEVEMENT", "statCycleId": "Qir5yntb", "targetValue": 0.6219381137201695}, {"matcher": "EQUAL", "parameterName": "W5aUlkiL", "parameterType": "ENTITLEMENT", "statCycleId": "KdtkXFfw", "targetValue": 0.9518154599857626}]}], "rewards": [{"itemId": "MCEOHyZI", "itemName": "yDbJ6IWb", "qty": 0.46477108015776236, "type": "ENTITLEMENT"}, {"itemId": "cjPncWUG", "itemName": "CxjlSQLp", "qty": 0.6134527205183247, "type": "STATISTIC"}, {"itemId": "pKFS5EAs", "itemName": "gmCpkauG", "qty": 0.42953573153116, "type": "ENTITLEMENT"}], "schedule": {"endTime": "1978-09-01T00:00:00Z", "order": 97, "startTime": "1997-05-16T00:00:00Z"}, "tags": ["b55BhL78", "hTDCguEM", "1z4XHsRL"]}' \
    > test.out 2>&1
eval_tap $? 10 'AdminCreateGoal' test.out

#- 11 AdminGetGoal
./ng net.accelbyte.sdk.cli.Main challenge adminGetGoal \
    --challengeCode 'W7PvaPnb' \
    --code 'MPclEzHE' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 11 'AdminGetGoal' test.out

#- 12 AdminUpdateGoals
./ng net.accelbyte.sdk.cli.Main challenge adminUpdateGoals \
    --challengeCode 'CjYc3rRg' \
    --code 'YWaFKeby' \
    --namespace "$AB_NAMESPACE" \
    --body '{"description": "PBEeSqdQ", "isActive": false, "name": "U1ws7W75", "requirementGroups": [{"operator": "AND", "predicates": [{"matcher": "LESS_THAN", "parameterName": "mdAHdROX", "parameterType": "USERACCOUNT", "statCycleId": "tHzN2Zlm", "targetValue": 0.9045997750875674}, {"matcher": "GREATER_THAN_EQUAL", "parameterName": "smQOdYVD", "parameterType": "ACHIEVEMENT", "statCycleId": "nGTB2Rju", "targetValue": 0.5622863647250727}, {"matcher": "LESS_THAN_EQUAL", "parameterName": "GiaDUfda", "parameterType": "ACHIEVEMENT", "statCycleId": "Hhz2Bg9S", "targetValue": 0.23910846355549775}]}, {"operator": "AND", "predicates": [{"matcher": "GREATER_THAN_EQUAL", "parameterName": "JqDeZIZA", "parameterType": "STATISTIC_CYCLE", "statCycleId": "V84kExGo", "targetValue": 0.8251571734769966}, {"matcher": "LESS_THAN", "parameterName": "TVw1FSKK", "parameterType": "ACHIEVEMENT", "statCycleId": "PkJbn0SR", "targetValue": 0.16410498819788377}, {"matcher": "EQUAL", "parameterName": "2sAs9EVv", "parameterType": "STATISTIC", "statCycleId": "Fxy70w9l", "targetValue": 0.36117558149636586}]}, {"operator": "AND", "predicates": [{"matcher": "LESS_THAN_EQUAL", "parameterName": "OYvQrZF1", "parameterType": "ENTITLEMENT", "statCycleId": "0NrHW6Zv", "targetValue": 0.4902236376081385}, {"matcher": "LESS_THAN", "parameterName": "98LstxLK", "parameterType": "ACHIEVEMENT", "statCycleId": "QFvkOr9k", "targetValue": 0.7737677684210272}, {"matcher": "GREATER_THAN_EQUAL", "parameterName": "X5CS45wq", "parameterType": "USERACCOUNT", "statCycleId": "3ScRuPHv", "targetValue": 0.2019339245414804}]}], "rewards": [{"itemId": "6nPrwW0D", "itemName": "upe3DvOr", "qty": 0.7152583610464962, "type": "ENTITLEMENT"}, {"itemId": "5tJ76RRZ", "itemName": "ZfBRNTgW", "qty": 0.24961938782047366, "type": "ENTITLEMENT"}, {"itemId": "vTPOFnm4", "itemName": "CgsxgvM0", "qty": 0.3787809156116385, "type": "ENTITLEMENT"}], "schedule": {"endTime": "1994-09-13T00:00:00Z", "order": 87, "startTime": "1983-11-10T00:00:00Z"}, "tags": ["n4Jn1TcN", "HJFg3lId", "psfc6ulT"]}' \
    > test.out 2>&1
eval_tap $? 12 'AdminUpdateGoals' test.out

#- 13 AdminDeleteGoal
./ng net.accelbyte.sdk.cli.Main challenge adminDeleteGoal \
    --challengeCode 'wuoOJ5td' \
    --code 'UOd9BvwO' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 13 'AdminDeleteGoal' test.out

#- 14 AdminListSchedulesByGoal
./ng net.accelbyte.sdk.cli.Main challenge adminListSchedulesByGoal \
    --challengeCode '3PY6DWTi' \
    --code 'NwkLoajg' \
    --namespace "$AB_NAMESPACE" \
    --limit '63' \
    --offset '33' \
    --userId 'XyjkkUAm' \
    > test.out 2>&1
eval_tap $? 14 'AdminListSchedulesByGoal' test.out

#- 15 AdminGetPeriods
./ng net.accelbyte.sdk.cli.Main challenge adminGetPeriods \
    --challengeCode 'LhVsGcXM' \
    --namespace "$AB_NAMESPACE" \
    --limit '98' \
    --offset '67' \
    > test.out 2>&1
eval_tap $? 15 'AdminGetPeriods' test.out

#- 16 AdminRandomizeChallenge
./ng net.accelbyte.sdk.cli.Main challenge adminRandomizeChallenge \
    --challengeCode 'APROAvHH' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 16 'AdminRandomizeChallenge' test.out

#- 17 AdminListSchedules
./ng net.accelbyte.sdk.cli.Main challenge adminListSchedules \
    --challengeCode '8khtE0PW' \
    --namespace "$AB_NAMESPACE" \
    --dateTime '1986-01-10T00:00:00Z' \
    --limit '46' \
    --offset '32' \
    --userId 'jevrqG3j' \
    > test.out 2>&1
eval_tap $? 17 'AdminListSchedules' test.out

#- 18 AdminDeleteTiedChallenge
./ng net.accelbyte.sdk.cli.Main challenge adminDeleteTiedChallenge \
    --challengeCode 'DAQMnkcd' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 18 'AdminDeleteTiedChallenge' test.out

#- 19 AdminUpdateTiedChallengeSchedule
./ng net.accelbyte.sdk.cli.Main challenge adminUpdateTiedChallengeSchedule \
    --challengeCode '6exMTBDD' \
    --namespace "$AB_NAMESPACE" \
    --body '{"action": "ACCELERATE", "endDate": "1982-02-22T00:00:00Z"}' \
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
    --body '{"appName": "gqJkXyS0", "extendType": "CUSTOM", "grpcServerAddress": "CqWK6sUR"}' \
    > test.out 2>&1
eval_tap $? 21 'AdminUpdateAssignmentPlugin' test.out

#- 22 AdminCreateAssignmentPlugin
./ng net.accelbyte.sdk.cli.Main challenge adminCreateAssignmentPlugin \
    --namespace "$AB_NAMESPACE" \
    --body '{"appName": "7W7xE7bq", "extendType": "CUSTOM", "grpcServerAddress": "0tLpokn8"}' \
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
    --body '{"userIds": ["lFHZPsEq", "FPX7JjkU", "j9Idc7sJ"]}' \
    > test.out 2>&1
eval_tap $? 24 'AdminEvaluateProgress' test.out

#- 25 AdminClaimUsersRewards
./ng net.accelbyte.sdk.cli.Main challenge adminClaimUsersRewards \
    --namespace "$AB_NAMESPACE" \
    --body '[{"rewardIds": ["FCuRRsaw", "LyohKFpJ", "rvlUyBkz"], "userId": "LlxdenEd"}, {"rewardIds": ["dVr1PB3t", "iyPnF16b", "UlxUGTLT"], "userId": "72ykcTqu"}, {"rewardIds": ["wxeANfTh", "th4cO7wG", "chvRl4aC"], "userId": "egikSOxy"}]' \
    > test.out 2>&1
eval_tap $? 25 'AdminClaimUsersRewards' test.out

#- 26 AdminClaimUserRewardsByGoalCode
./ng net.accelbyte.sdk.cli.Main challenge adminClaimUserRewardsByGoalCode \
    --challengeCode 'CElskNiD' \
    --namespace "$AB_NAMESPACE" \
    --userId 'eME8tfYj' \
    --body '{"goalCode": "2YPbj5tO"}' \
    > test.out 2>&1
eval_tap $? 26 'AdminClaimUserRewardsByGoalCode' test.out

#- 27 AdminGetUserProgression
./ng net.accelbyte.sdk.cli.Main challenge adminGetUserProgression \
    --challengeCode 'Jt3wNZZ7' \
    --namespace "$AB_NAMESPACE" \
    --userId 'FoFpYUzp' \
    --dateTime '1996-12-14T00:00:00Z' \
    --goalCode 'OQ2ZWOh7' \
    --limit '35' \
    --offset '6' \
    --tags 'nYm9EQo0,VPKzIPO0,MXCvw2nJ' \
    > test.out 2>&1
eval_tap $? 27 'AdminGetUserProgression' test.out

#- 28 AdminGetUserRewards
./ng net.accelbyte.sdk.cli.Main challenge adminGetUserRewards \
    --namespace "$AB_NAMESPACE" \
    --userId 'eycojE1S' \
    --challengeCode 'MMtoANBT' \
    --goalProgressionId '8jmMLVRh' \
    --limit '39' \
    --offset '20' \
    --sortBy 'createdAt:asc' \
    --status 'CLAIMED' \
    > test.out 2>&1
eval_tap $? 28 'AdminGetUserRewards' test.out

#- 29 AdminClaimUserRewards
./ng net.accelbyte.sdk.cli.Main challenge adminClaimUserRewards \
    --namespace "$AB_NAMESPACE" \
    --userId 'RSTRTfMt' \
    --body '{"rewardIDs": ["k1TxaoW5", "livgGmsy", "bqUEhJ7Y"]}' \
    > test.out 2>&1
eval_tap $? 29 'AdminClaimUserRewards' test.out

#- 30 GetChallenges
./ng net.accelbyte.sdk.cli.Main challenge getChallenges \
    --namespace "$AB_NAMESPACE" \
    --keyword '4REKykgG' \
    --limit '50' \
    --offset '10' \
    --sortBy 'createdAt:desc' \
    --status 'TIED' \
    --tags '2j1s58Fm,Qv2J3OA6,I8FJjxWI' \
    > test.out 2>&1
eval_tap $? 30 'GetChallenges' test.out

#- 31 PublicGetScheduledGoals
./ng net.accelbyte.sdk.cli.Main challenge publicGetScheduledGoals \
    --challengeCode 'ROF94Q3b' \
    --namespace "$AB_NAMESPACE" \
    --limit '1' \
    --offset '39' \
    --sortBy 'createdAt:asc' \
    --tags '28U4mldp,yAilgFtl,tvdd5Uvi' \
    > test.out 2>&1
eval_tap $? 31 'PublicGetScheduledGoals' test.out

#- 32 PublicListSchedulesByGoal
./ng net.accelbyte.sdk.cli.Main challenge publicListSchedulesByGoal \
    --challengeCode '8IpKFMU7' \
    --code 'pbpaf8fY' \
    --namespace "$AB_NAMESPACE" \
    --limit '94' \
    --offset '84' \
    > test.out 2>&1
eval_tap $? 32 'PublicListSchedulesByGoal' test.out

#- 33 PublicListSchedules
./ng net.accelbyte.sdk.cli.Main challenge publicListSchedules \
    --challengeCode 'KNcHejpn' \
    --namespace "$AB_NAMESPACE" \
    --dateTime '1989-05-28T00:00:00Z' \
    --limit '83' \
    --offset '22' \
    > test.out 2>&1
eval_tap $? 33 'PublicListSchedules' test.out

#- 34 PublicClaimUserRewardsByGoalCode
./ng net.accelbyte.sdk.cli.Main challenge publicClaimUserRewardsByGoalCode \
    --challengeCode 'PcrCPgt5' \
    --namespace "$AB_NAMESPACE" \
    --body '{"goalCode": "Dy0KoMxf"}' \
    > test.out 2>&1
eval_tap $? 34 'PublicClaimUserRewardsByGoalCode' test.out

#- 35 EvaluateMyProgress
./ng net.accelbyte.sdk.cli.Main challenge evaluateMyProgress \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 35 'EvaluateMyProgress' test.out

#- 36 PublicGetUserProgression
./ng net.accelbyte.sdk.cli.Main challenge publicGetUserProgression \
    --challengeCode 'YyyyEfnN' \
    --namespace "$AB_NAMESPACE" \
    --dateTime '1998-09-07T00:00:00Z' \
    --goalCode 'mhA7ot6q' \
    --limit '78' \
    --offset '73' \
    --tags 'yJ6vGa7d,BCpfLgpM,b4FTDBuD' \
    > test.out 2>&1
eval_tap $? 36 'PublicGetUserProgression' test.out

#- 37 PublicGetPastUserProgression
./ng net.accelbyte.sdk.cli.Main challenge publicGetPastUserProgression \
    --challengeCode 'aWqhqCLe' \
    --index '93' \
    --namespace "$AB_NAMESPACE" \
    --goalCode '17KIwJ8Y' \
    --limit '62' \
    --offset '54' \
    --tags 'ZFVwUnlW,WJbGWF7U,g80Lme4c' \
    > test.out 2>&1
eval_tap $? 37 'PublicGetPastUserProgression' test.out

#- 38 PublicGetUserRewards
./ng net.accelbyte.sdk.cli.Main challenge publicGetUserRewards \
    --namespace "$AB_NAMESPACE" \
    --challengeCode '4Rl6naOh' \
    --goalProgressionId 'L9nu0peI' \
    --limit '7' \
    --offset '21' \
    --sortBy 'createdAt' \
    --status 'CLAIMED' \
    > test.out 2>&1
eval_tap $? 38 'PublicGetUserRewards' test.out

#- 39 PublicClaimUserRewards
./ng net.accelbyte.sdk.cli.Main challenge publicClaimUserRewards \
    --namespace "$AB_NAMESPACE" \
    --body '{"rewardIDs": ["liBYGPQI", "e7H2uAJV", "kb9TUp8T"]}' \
    > test.out 2>&1
eval_tap $? 39 'PublicClaimUserRewards' test.out


rm -f "tmp.dat"

exit $EXIT_CODE