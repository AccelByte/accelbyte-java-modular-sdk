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
    --limit '60' \
    --offset '46' \
    --sortBy 'updatedAt' \
    --status 'INIT' \
    > test.out 2>&1
eval_tap $? 2 'AdminGetChallenges' test.out

#- 3 AdminCreateChallenge
./ng net.accelbyte.sdk.cli.Main challenge adminCreateChallenge \
    --namespace "$AB_NAMESPACE" \
    --body '{"activeGoalsPerRotation": 81, "assignmentRule": "FIXED", "code": "R0OSSgO3", "description": "7uaqWHDd", "endAfter": 41, "endDate": "1971-07-11T00:00:00Z", "goalsVisibility": "SHOWALL", "name": "kgIeRaL7", "randomizedPerRotation": false, "repeatAfter": 17, "resetConfig": {"resetDate": 54, "resetDay": 71, "resetTime": "SfRKNKWi"}, "rotation": "WEEKLY", "startDate": "1995-06-06T00:00:00Z"}' \
    > test.out 2>&1
eval_tap $? 3 'AdminCreateChallenge' test.out

#- 4 AdminGetActiveChallenges
./ng net.accelbyte.sdk.cli.Main challenge adminGetActiveChallenges \
    --namespace "$AB_NAMESPACE" \
    --userId '7VceeZRr' \
    --limit '97' \
    --offset '23' \
    > test.out 2>&1
eval_tap $? 4 'AdminGetActiveChallenges' test.out

#- 5 AdminGetChallenge
./ng net.accelbyte.sdk.cli.Main challenge adminGetChallenge \
    --challengeCode 'LDttNlGg' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 5 'AdminGetChallenge' test.out

#- 6 AdminUpdateChallenge
./ng net.accelbyte.sdk.cli.Main challenge adminUpdateChallenge \
    --challengeCode 'VcMLZsTH' \
    --namespace "$AB_NAMESPACE" \
    --body '{"activeGoalsPerRotation": 37, "assignmentRule": "UNSCHEDULED", "description": "SA3eqHoB", "endAfter": 34, "endDate": "1980-01-08T00:00:00Z", "goalsVisibility": "SHOWALL", "name": "Jm6VmJ8B", "randomizedPerRotation": false, "repeatAfter": 94, "resetConfig": {"resetDate": 49, "resetDay": 54, "resetTime": "AHCeX3Ho"}, "rotation": "WEEKLY", "startDate": "1971-06-11T00:00:00Z"}' \
    > test.out 2>&1
eval_tap $? 6 'AdminUpdateChallenge' test.out

#- 7 AdminDeleteChallenge
./ng net.accelbyte.sdk.cli.Main challenge adminDeleteChallenge \
    --challengeCode 'yPQhTwk8' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 7 'AdminDeleteChallenge' test.out

#- 8 AdminGetGoals
./ng net.accelbyte.sdk.cli.Main challenge adminGetGoals \
    --challengeCode 'pocgUOb7' \
    --namespace "$AB_NAMESPACE" \
    --limit '39' \
    --offset '96' \
    --sortBy 'updatedAt:asc' \
    > test.out 2>&1
eval_tap $? 8 'AdminGetGoals' test.out

#- 9 AdminCreateGoal
./ng net.accelbyte.sdk.cli.Main challenge adminCreateGoal \
    --challengeCode 'sO1M43WZ' \
    --namespace "$AB_NAMESPACE" \
    --body '{"code": "5Sx0be8V", "description": "101ogozB", "isActive": false, "name": "q0AdJUbH", "requirementGroups": [{"operator": "AND", "predicates": [{"matcher": "LESS_THAN", "parameterName": "NWaVijfe", "parameterType": "ACHIEVEMENT", "statCycleId": "VxGpdQn7", "targetValue": 0.8528230077809045}, {"matcher": "LESS_THAN", "parameterName": "Ufa1z3Hn", "parameterType": "USERACCOUNT", "statCycleId": "5mpqevCr", "targetValue": 0.5505364786382863}, {"matcher": "EQUAL", "parameterName": "KalzQhiu", "parameterType": "USERACCOUNT", "statCycleId": "ejdv5aDM", "targetValue": 0.3222331356938559}]}, {"operator": "AND", "predicates": [{"matcher": "GREATER_THAN_EQUAL", "parameterName": "95hq6uKS", "parameterType": "ENTITLEMENT", "statCycleId": "lsV4unNE", "targetValue": 0.9698094310919505}, {"matcher": "GREATER_THAN_EQUAL", "parameterName": "gIi74WCL", "parameterType": "STATISTIC", "statCycleId": "kdyaCRzD", "targetValue": 0.8277549612925444}, {"matcher": "LESS_THAN", "parameterName": "iF0NTCtv", "parameterType": "STATISTIC", "statCycleId": "KsNhhSLJ", "targetValue": 0.8458045221447795}]}, {"operator": "AND", "predicates": [{"matcher": "GREATER_THAN", "parameterName": "UuVYdyCF", "parameterType": "STATISTIC", "statCycleId": "90RFFTK5", "targetValue": 0.7801940226484612}, {"matcher": "EQUAL", "parameterName": "MP415JhU", "parameterType": "USERACCOUNT", "statCycleId": "Pch8JMtn", "targetValue": 0.4796043589320518}, {"matcher": "LESS_THAN_EQUAL", "parameterName": "FUazTDMx", "parameterType": "USERACCOUNT", "statCycleId": "o3BVmHTB", "targetValue": 0.8072877010138768}]}], "rewards": [{"itemId": "NTKr70Qs", "itemName": "1Lc3oysx", "qty": 0.05884997992747665, "type": "STATISTIC"}, {"itemId": "ptKIqMpf", "itemName": "l9DsBFbA", "qty": 0.7641871288871221, "type": "STATISTIC"}, {"itemId": "7CsTuXQF", "itemName": "fimWlok9", "qty": 0.5880064722069301, "type": "STATISTIC"}], "schedule": {"endTime": "1987-08-12T00:00:00Z", "order": 83, "startTime": "1990-09-01T00:00:00Z"}, "tags": ["vKPLmgu7", "vhWgJ8U0", "JfLVPf4w"]}' \
    > test.out 2>&1
eval_tap $? 9 'AdminCreateGoal' test.out

#- 10 AdminGetGoal
./ng net.accelbyte.sdk.cli.Main challenge adminGetGoal \
    --challengeCode 'gysTpw1X' \
    --code 'zIr9sjj0' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 10 'AdminGetGoal' test.out

#- 11 AdminUpdateGoals
./ng net.accelbyte.sdk.cli.Main challenge adminUpdateGoals \
    --challengeCode 'LwId1bqc' \
    --code 'JnBgDSym' \
    --namespace "$AB_NAMESPACE" \
    --body '{"description": "V8A0aeg8", "isActive": true, "name": "ExhQtJjg", "requirementGroups": [{"operator": "AND", "predicates": [{"matcher": "GREATER_THAN_EQUAL", "parameterName": "8g0lIsgu", "parameterType": "STATISTIC_CYCLE", "statCycleId": "VR1lqNLZ", "targetValue": 0.37581513432428604}, {"matcher": "LESS_THAN", "parameterName": "HgcIKSv3", "parameterType": "STATISTIC", "statCycleId": "mmzKvgzn", "targetValue": 0.8080119272679323}, {"matcher": "EQUAL", "parameterName": "S5ihrorX", "parameterType": "ENTITLEMENT", "statCycleId": "pTSCobxk", "targetValue": 0.32212673754550836}]}, {"operator": "AND", "predicates": [{"matcher": "LESS_THAN", "parameterName": "nhc7TP1K", "parameterType": "ENTITLEMENT", "statCycleId": "KoB40dTB", "targetValue": 0.16591485618750978}, {"matcher": "GREATER_THAN_EQUAL", "parameterName": "4SJR4hXx", "parameterType": "USERACCOUNT", "statCycleId": "Eat7wsA9", "targetValue": 0.6921808132385349}, {"matcher": "LESS_THAN_EQUAL", "parameterName": "77dQM4Hh", "parameterType": "ENTITLEMENT", "statCycleId": "gPDuM5K7", "targetValue": 0.7328213653995279}]}, {"operator": "AND", "predicates": [{"matcher": "LESS_THAN_EQUAL", "parameterName": "u9KNGxI4", "parameterType": "ACHIEVEMENT", "statCycleId": "UNZgI3ii", "targetValue": 0.8868665989123479}, {"matcher": "EQUAL", "parameterName": "73Yx5udn", "parameterType": "USERACCOUNT", "statCycleId": "uEQZcgof", "targetValue": 0.655440057616277}, {"matcher": "LESS_THAN_EQUAL", "parameterName": "UaxV1z0C", "parameterType": "STATISTIC_CYCLE", "statCycleId": "uBcS5Y5e", "targetValue": 0.371640451747953}]}], "rewards": [{"itemId": "Mb9RWIUN", "itemName": "whVZmkhi", "qty": 0.030839997696419985, "type": "STATISTIC"}, {"itemId": "67ueHewi", "itemName": "88xdL8wK", "qty": 0.9243644171509849, "type": "ENTITLEMENT"}, {"itemId": "lkE6EqaD", "itemName": "gZk0tsro", "qty": 0.9020734453441813, "type": "STATISTIC"}], "schedule": {"endTime": "1982-11-03T00:00:00Z", "order": 48, "startTime": "1977-08-07T00:00:00Z"}, "tags": ["PNYm9z1W", "D7XLVk2Q", "d9kBkKWU"]}' \
    > test.out 2>&1
eval_tap $? 11 'AdminUpdateGoals' test.out

#- 12 AdminDeleteGoal
./ng net.accelbyte.sdk.cli.Main challenge adminDeleteGoal \
    --challengeCode 'xf6EIdNP' \
    --code 'ZEKjyFLk' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 12 'AdminDeleteGoal' test.out

#- 13 AdminListSchedulesByGoal
./ng net.accelbyte.sdk.cli.Main challenge adminListSchedulesByGoal \
    --challengeCode 'f8HkmtXX' \
    --code 'HZ1a8AJF' \
    --namespace "$AB_NAMESPACE" \
    --limit '94' \
    --offset '63' \
    --userId 'hK49ztBa' \
    > test.out 2>&1
eval_tap $? 13 'AdminListSchedulesByGoal' test.out

#- 14 AdminGetPeriods
./ng net.accelbyte.sdk.cli.Main challenge adminGetPeriods \
    --challengeCode 'T9COZM85' \
    --namespace "$AB_NAMESPACE" \
    --limit '90' \
    --offset '17' \
    > test.out 2>&1
eval_tap $? 14 'AdminGetPeriods' test.out

#- 15 AdminRandomizeChallenge
./ng net.accelbyte.sdk.cli.Main challenge adminRandomizeChallenge \
    --challengeCode 'NHinjicj' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 15 'AdminRandomizeChallenge' test.out

#- 16 AdminListSchedules
./ng net.accelbyte.sdk.cli.Main challenge adminListSchedules \
    --challengeCode 'O9f3TcOk' \
    --namespace "$AB_NAMESPACE" \
    --dateTime '1996-05-21T00:00:00Z' \
    --limit '52' \
    --offset '1' \
    --userId 'QOpYPc4A' \
    > test.out 2>&1
eval_tap $? 16 'AdminListSchedules' test.out

#- 17 AdminDeleteTiedChallenge
./ng net.accelbyte.sdk.cli.Main challenge adminDeleteTiedChallenge \
    --challengeCode '1f67EERp' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 17 'AdminDeleteTiedChallenge' test.out

#- 18 AdminUpdateTiedChallengeSchedule
./ng net.accelbyte.sdk.cli.Main challenge adminUpdateTiedChallengeSchedule \
    --challengeCode 'l34wzG75' \
    --namespace "$AB_NAMESPACE" \
    --body '{"action": "STOP", "endDate": "1998-07-31T00:00:00Z"}' \
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
    --body '{"appName": "u9fclYx5", "extendType": "APP", "grpcServerAddress": "kSgwp8Ob"}' \
    > test.out 2>&1
eval_tap $? 20 'AdminUpdateAssignmentPlugin' test.out

#- 21 AdminCreateAssignmentPlugin
./ng net.accelbyte.sdk.cli.Main challenge adminCreateAssignmentPlugin \
    --namespace "$AB_NAMESPACE" \
    --body '{"appName": "7BmJ9o5u", "extendType": "APP", "grpcServerAddress": "4gDs0Wft"}' \
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
    --body '{"userIds": ["Kz8dn9ZG", "cgO05mor", "GnsXGFMd"]}' \
    > test.out 2>&1
eval_tap $? 23 'AdminEvaluateProgress' test.out

#- 24 AdminClaimUsersRewards
./ng net.accelbyte.sdk.cli.Main challenge adminClaimUsersRewards \
    --namespace "$AB_NAMESPACE" \
    --body '[{"rewardIds": ["IF1xWz0O", "HToBOZIC", "BluZiuIV"], "userId": "mmHewyqV"}, {"rewardIds": ["0RoeD9Ez", "eI7DTnsy", "i6PdkGqF"], "userId": "b2pWzaIp"}, {"rewardIds": ["tVYIC1EA", "sDe17w6r", "mBq8cXin"], "userId": "YQaGs72H"}]' \
    > test.out 2>&1
eval_tap $? 24 'AdminClaimUsersRewards' test.out

#- 25 AdminClaimUserRewardsByGoalCode
./ng net.accelbyte.sdk.cli.Main challenge adminClaimUserRewardsByGoalCode \
    --challengeCode 'L5X3B6Xq' \
    --namespace "$AB_NAMESPACE" \
    --userId 'Gc4j2eYB' \
    --body '{"goalCode": "wU49tvUQ"}' \
    > test.out 2>&1
eval_tap $? 25 'AdminClaimUserRewardsByGoalCode' test.out

#- 26 AdminGetUserProgression
./ng net.accelbyte.sdk.cli.Main challenge adminGetUserProgression \
    --challengeCode 'IV5rTUHA' \
    --namespace "$AB_NAMESPACE" \
    --userId 'LzBWYLWY' \
    --dateTime '1990-02-26T00:00:00Z' \
    --goalCode '1b4GhDFu' \
    --limit '17' \
    --offset '26' \
    --tags '20FKUaHr,HexYdOLM,XP2Qr1FS' \
    > test.out 2>&1
eval_tap $? 26 'AdminGetUserProgression' test.out

#- 27 AdminGetUserRewards
./ng net.accelbyte.sdk.cli.Main challenge adminGetUserRewards \
    --namespace "$AB_NAMESPACE" \
    --userId 'bNmskyXi' \
    --challengeCode 'RjonU9Vw' \
    --goalProgressionId 'BNmKDbO3' \
    --limit '80' \
    --offset '89' \
    --sortBy 'createdAt' \
    --status 'UNCLAIMED' \
    > test.out 2>&1
eval_tap $? 27 'AdminGetUserRewards' test.out

#- 28 AdminClaimUserRewards
./ng net.accelbyte.sdk.cli.Main challenge adminClaimUserRewards \
    --namespace "$AB_NAMESPACE" \
    --userId 'RgHZVx9b' \
    --body '{"rewardIDs": ["AdbnU0jO", "JiF9ET8K", "zsT3f1wQ"]}' \
    > test.out 2>&1
eval_tap $? 28 'AdminClaimUserRewards' test.out

#- 29 GetChallenges
./ng net.accelbyte.sdk.cli.Main challenge getChallenges \
    --namespace "$AB_NAMESPACE" \
    --limit '74' \
    --offset '28' \
    --sortBy 'createdAt:asc' \
    --status 'TIED' \
    > test.out 2>&1
eval_tap $? 29 'GetChallenges' test.out

#- 30 PublicGetScheduledGoals
./ng net.accelbyte.sdk.cli.Main challenge publicGetScheduledGoals \
    --challengeCode 'zZOqcWJx' \
    --namespace "$AB_NAMESPACE" \
    --limit '64' \
    --offset '51' \
    --tags 'ENIPamdS,7Yqdu4gJ,V5c25OMq' \
    > test.out 2>&1
eval_tap $? 30 'PublicGetScheduledGoals' test.out

#- 31 PublicListSchedulesByGoal
./ng net.accelbyte.sdk.cli.Main challenge publicListSchedulesByGoal \
    --challengeCode 'e4rkUz6z' \
    --code 'MdZCnAg4' \
    --namespace "$AB_NAMESPACE" \
    --limit '12' \
    --offset '80' \
    > test.out 2>&1
eval_tap $? 31 'PublicListSchedulesByGoal' test.out

#- 32 PublicListSchedules
./ng net.accelbyte.sdk.cli.Main challenge publicListSchedules \
    --challengeCode 'mthVkBWZ' \
    --namespace "$AB_NAMESPACE" \
    --dateTime '1994-10-09T00:00:00Z' \
    --limit '69' \
    --offset '21' \
    > test.out 2>&1
eval_tap $? 32 'PublicListSchedules' test.out

#- 33 PublicClaimUserRewardsByGoalCode
./ng net.accelbyte.sdk.cli.Main challenge publicClaimUserRewardsByGoalCode \
    --challengeCode 'fhXx0DPp' \
    --namespace "$AB_NAMESPACE" \
    --body '{"goalCode": "XU6qjdfv"}' \
    > test.out 2>&1
eval_tap $? 33 'PublicClaimUserRewardsByGoalCode' test.out

#- 34 EvaluateMyProgress
./ng net.accelbyte.sdk.cli.Main challenge evaluateMyProgress \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 34 'EvaluateMyProgress' test.out

#- 35 PublicGetUserProgression
./ng net.accelbyte.sdk.cli.Main challenge publicGetUserProgression \
    --challengeCode 'VTV38T8I' \
    --namespace "$AB_NAMESPACE" \
    --dateTime '1990-02-15T00:00:00Z' \
    --goalCode 'GSMrcYYh' \
    --limit '82' \
    --offset '96' \
    --tags 'OTLtUJLx,mtMaNK1s,luU5iguZ' \
    > test.out 2>&1
eval_tap $? 35 'PublicGetUserProgression' test.out

#- 36 PublicGetPastUserProgression
./ng net.accelbyte.sdk.cli.Main challenge publicGetPastUserProgression \
    --challengeCode '208KxPr9' \
    --index '27' \
    --namespace "$AB_NAMESPACE" \
    --goalCode 'YSoGGZ6M' \
    --limit '84' \
    --offset '29' \
    --tags 'sl1Ec0VG,ya5fUPiE,PRHWk0sE' \
    > test.out 2>&1
eval_tap $? 36 'PublicGetPastUserProgression' test.out

#- 37 PublicGetUserRewards
./ng net.accelbyte.sdk.cli.Main challenge publicGetUserRewards \
    --namespace "$AB_NAMESPACE" \
    --challengeCode 'DpDvWrYi' \
    --goalProgressionId 'Ju5z6Rw5' \
    --limit '83' \
    --offset '7' \
    --sortBy 'updatedAt:desc' \
    --status 'UNCLAIMED' \
    > test.out 2>&1
eval_tap $? 37 'PublicGetUserRewards' test.out

#- 38 PublicClaimUserRewards
./ng net.accelbyte.sdk.cli.Main challenge publicClaimUserRewards \
    --namespace "$AB_NAMESPACE" \
    --body '{"rewardIDs": ["i22jYU3s", "W5ujj5yU", "kz8Ehh8x"]}' \
    > test.out 2>&1
eval_tap $? 38 'PublicClaimUserRewards' test.out


rm -f "tmp.dat"

exit $EXIT_CODE