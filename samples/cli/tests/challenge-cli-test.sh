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
    --keyword 'GyBOVByt' \
    --limit '45' \
    --offset '76' \
    --sortBy 'createdAt:desc' \
    --status 'RETIRED' \
    --tags 'DOc7AMMf,lXOn38g4,Gl82t0Ta' \
    > test.out 2>&1
eval_tap $? 2 'AdminGetChallenges' test.out

#- 3 AdminCreateChallenge
./ng net.accelbyte.sdk.cli.Main challenge adminCreateChallenge \
    --namespace "$AB_NAMESPACE" \
    --body '{"activeGoalsPerRotation": 92, "assignmentRule": "FIXED", "code": "xfWclPsZ", "description": "Xx6Fnuom", "endAfter": 90, "endDate": "1993-07-03T00:00:00Z", "goalsVisibility": "SHOWALL", "name": "jTdR4zrJ", "randomizedPerRotation": false, "repeatAfter": 92, "resetConfig": {"resetDate": 91, "resetDay": 43, "resetTime": "lMObdVCm"}, "rotation": "NONE", "startDate": "1993-07-07T00:00:00Z", "tags": ["REwWrcKW", "979TFaYl", "6aQu2tc0"]}' \
    > test.out 2>&1
eval_tap $? 3 'AdminCreateChallenge' test.out

#- 4 AdminGetItemReferences
./ng net.accelbyte.sdk.cli.Main challenge adminGetItemReferences \
    --namespace "$AB_NAMESPACE" \
    --itemId 'J158mimD' \
    > test.out 2>&1
eval_tap $? 4 'AdminGetItemReferences' test.out

#- 5 AdminGetActiveChallenges
./ng net.accelbyte.sdk.cli.Main challenge adminGetActiveChallenges \
    --namespace "$AB_NAMESPACE" \
    --userId 'GNLUvaFo' \
    --limit '48' \
    --offset '44' \
    > test.out 2>&1
eval_tap $? 5 'AdminGetActiveChallenges' test.out

#- 6 AdminGetChallenge
./ng net.accelbyte.sdk.cli.Main challenge adminGetChallenge \
    --challengeCode 'UlWLLDkz' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 6 'AdminGetChallenge' test.out

#- 7 AdminUpdateChallenge
./ng net.accelbyte.sdk.cli.Main challenge adminUpdateChallenge \
    --challengeCode 'QZ1RzH5h' \
    --namespace "$AB_NAMESPACE" \
    --body '{"activeGoalsPerRotation": 37, "assignmentRule": "RANDOMIZED", "description": "ralVDbfp", "endAfter": 62, "endDate": "1988-12-20T00:00:00Z", "goalsVisibility": "SHOWALL", "name": "0oJrd5vo", "randomizedPerRotation": false, "repeatAfter": 17, "resetConfig": {"resetDate": 40, "resetDay": 78, "resetTime": "h7xLRZHi"}, "rotation": "NONE", "startDate": "1986-12-17T00:00:00Z", "tags": ["vHyWLGl4", "BqYrJ3Ks", "Jz2gvMXC"]}' \
    > test.out 2>&1
eval_tap $? 7 'AdminUpdateChallenge' test.out

#- 8 AdminDeleteChallenge
./ng net.accelbyte.sdk.cli.Main challenge adminDeleteChallenge \
    --challengeCode '3surM9Vj' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 8 'AdminDeleteChallenge' test.out

#- 9 AdminGetGoals
./ng net.accelbyte.sdk.cli.Main challenge adminGetGoals \
    --challengeCode 'xwjKs4DH' \
    --namespace "$AB_NAMESPACE" \
    --limit '38' \
    --offset '61' \
    --sortBy 'createdAt:desc' \
    --tags 'QFFoghGH,Gw5hFsEr,RPjBxve0' \
    > test.out 2>&1
eval_tap $? 9 'AdminGetGoals' test.out

#- 10 AdminCreateGoal
./ng net.accelbyte.sdk.cli.Main challenge adminCreateGoal \
    --challengeCode 'zSqVgXp5' \
    --namespace "$AB_NAMESPACE" \
    --body '{"code": "FZ5V391d", "description": "d8zReFMF", "isActive": true, "name": "M3Vd5top", "requirementGroups": [{"operator": "AND", "predicates": [{"matcher": "LESS_THAN", "parameterName": "0ymv0pDI", "parameterType": "STATISTIC_CYCLE", "statCycleId": "LTqG4D6f", "targetValue": 0.7473775374986754}, {"matcher": "GREATER_THAN", "parameterName": "nXpdCc24", "parameterType": "ENTITLEMENT", "statCycleId": "u8BUXIiK", "targetValue": 0.9235005867705632}, {"matcher": "LESS_THAN", "parameterName": "nQ3myNfR", "parameterType": "ACHIEVEMENT", "statCycleId": "LrVvazTB", "targetValue": 0.8197703845096127}]}, {"operator": "AND", "predicates": [{"matcher": "LESS_THAN", "parameterName": "xYBNfJUZ", "parameterType": "ACHIEVEMENT", "statCycleId": "YaCBDBQq", "targetValue": 0.7575133097915355}, {"matcher": "GREATER_THAN", "parameterName": "9lHXYZzB", "parameterType": "STATISTIC", "statCycleId": "UUzC3Sr6", "targetValue": 0.42545854106610337}, {"matcher": "LESS_THAN", "parameterName": "OkpLV9gY", "parameterType": "STATISTIC_CYCLE", "statCycleId": "xtkS6sxt", "targetValue": 0.030234981710554498}]}, {"operator": "AND", "predicates": [{"matcher": "LESS_THAN", "parameterName": "fTb85Rqx", "parameterType": "ENTITLEMENT", "statCycleId": "3msB9glF", "targetValue": 0.32923585223609175}, {"matcher": "LESS_THAN", "parameterName": "Oq80c1mw", "parameterType": "ACHIEVEMENT", "statCycleId": "R3Um4nw3", "targetValue": 0.106828407315395}, {"matcher": "LESS_THAN_EQUAL", "parameterName": "Oj9HY7rN", "parameterType": "STATISTIC_CYCLE", "statCycleId": "pujPiXxz", "targetValue": 0.8193250622629974}]}], "rewards": [{"itemId": "F9Xdm0WE", "itemName": "tqW8ozSH", "qty": 0.3714913385113219, "type": "STATISTIC"}, {"itemId": "9pUyuooo", "itemName": "onsfnD3P", "qty": 0.75925824504268, "type": "ENTITLEMENT"}, {"itemId": "T3qAy75x", "itemName": "6QyrhJBy", "qty": 0.6796799394788314, "type": "ENTITLEMENT"}], "schedule": {"endTime": "1991-10-23T00:00:00Z", "order": 45, "startTime": "1983-02-28T00:00:00Z"}, "tags": ["qMsLvyzB", "aJN4L5PF", "55RnAkUP"]}' \
    > test.out 2>&1
eval_tap $? 10 'AdminCreateGoal' test.out

#- 11 AdminGetGoal
./ng net.accelbyte.sdk.cli.Main challenge adminGetGoal \
    --challengeCode 'NhfQwcF3' \
    --code 'X3kLiPys' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 11 'AdminGetGoal' test.out

#- 12 AdminUpdateGoals
./ng net.accelbyte.sdk.cli.Main challenge adminUpdateGoals \
    --challengeCode 'Bj9PdUd7' \
    --code 'tkQbrCrH' \
    --namespace "$AB_NAMESPACE" \
    --body '{"description": "bi62nWk4", "isActive": false, "name": "1xClC8Km", "requirementGroups": [{"operator": "AND", "predicates": [{"matcher": "LESS_THAN", "parameterName": "mafmXVQQ", "parameterType": "ACHIEVEMENT", "statCycleId": "CxHmJXyo", "targetValue": 0.7092485204633691}, {"matcher": "GREATER_THAN", "parameterName": "VWDpZ1wn", "parameterType": "STATISTIC_CYCLE", "statCycleId": "I7lWu8GV", "targetValue": 0.8482592393437272}, {"matcher": "GREATER_THAN", "parameterName": "oNHGiXH8", "parameterType": "ENTITLEMENT", "statCycleId": "YVTihkOy", "targetValue": 0.57632553904462}]}, {"operator": "AND", "predicates": [{"matcher": "GREATER_THAN_EQUAL", "parameterName": "5q8iljfh", "parameterType": "STATISTIC", "statCycleId": "anTp38Le", "targetValue": 0.852236457103826}, {"matcher": "GREATER_THAN_EQUAL", "parameterName": "mDzbYZFM", "parameterType": "ENTITLEMENT", "statCycleId": "viGolDjY", "targetValue": 0.5689691945888129}, {"matcher": "LESS_THAN", "parameterName": "Dug4rMiH", "parameterType": "USERACCOUNT", "statCycleId": "eCluWnJd", "targetValue": 0.22806459252311728}]}, {"operator": "AND", "predicates": [{"matcher": "GREATER_THAN", "parameterName": "TBGv7Jo5", "parameterType": "STATISTIC", "statCycleId": "ZBSQxYz8", "targetValue": 0.6796571563427504}, {"matcher": "LESS_THAN", "parameterName": "kXpRwfCt", "parameterType": "ACHIEVEMENT", "statCycleId": "qovbUORp", "targetValue": 0.5922653464205132}, {"matcher": "GREATER_THAN_EQUAL", "parameterName": "foIPhZ5v", "parameterType": "USERACCOUNT", "statCycleId": "GGEBB6Qg", "targetValue": 0.9386770863655433}]}], "rewards": [{"itemId": "OdvM0n1p", "itemName": "ZRvrQm5r", "qty": 0.9853671607962532, "type": "ENTITLEMENT"}, {"itemId": "ZGk06V0C", "itemName": "7kJy9Hq4", "qty": 0.5687911093252372, "type": "STATISTIC"}, {"itemId": "k8wb1YzP", "itemName": "gsoVJGo7", "qty": 0.32972520572347863, "type": "ENTITLEMENT"}], "schedule": {"endTime": "1982-01-09T00:00:00Z", "order": 71, "startTime": "1977-07-30T00:00:00Z"}, "tags": ["2bj7Zt7r", "6wFKjI4b", "MViT7uew"]}' \
    > test.out 2>&1
eval_tap $? 12 'AdminUpdateGoals' test.out

#- 13 AdminDeleteGoal
./ng net.accelbyte.sdk.cli.Main challenge adminDeleteGoal \
    --challengeCode '3PXvP3m5' \
    --code 'NnHwuon0' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 13 'AdminDeleteGoal' test.out

#- 14 AdminListSchedulesByGoal
./ng net.accelbyte.sdk.cli.Main challenge adminListSchedulesByGoal \
    --challengeCode 'mNudltwA' \
    --code 'dcBCgfeo' \
    --namespace "$AB_NAMESPACE" \
    --limit '46' \
    --offset '70' \
    --userId 'Hf7m2LAS' \
    > test.out 2>&1
eval_tap $? 14 'AdminListSchedulesByGoal' test.out

#- 15 AdminGetPeriods
./ng net.accelbyte.sdk.cli.Main challenge adminGetPeriods \
    --challengeCode 'Eonkrw7S' \
    --namespace "$AB_NAMESPACE" \
    --limit '55' \
    --offset '74' \
    > test.out 2>&1
eval_tap $? 15 'AdminGetPeriods' test.out

#- 16 AdminRandomizeChallenge
./ng net.accelbyte.sdk.cli.Main challenge adminRandomizeChallenge \
    --challengeCode '6hmiRzKg' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 16 'AdminRandomizeChallenge' test.out

#- 17 AdminListSchedules
./ng net.accelbyte.sdk.cli.Main challenge adminListSchedules \
    --challengeCode 'rxqEE8QF' \
    --namespace "$AB_NAMESPACE" \
    --dateTime '1983-10-04T00:00:00Z' \
    --limit '86' \
    --offset '81' \
    --userId 'VGABc3gu' \
    > test.out 2>&1
eval_tap $? 17 'AdminListSchedules' test.out

#- 18 AdminDeleteTiedChallenge
./ng net.accelbyte.sdk.cli.Main challenge adminDeleteTiedChallenge \
    --challengeCode 'pZ7Ee77M' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 18 'AdminDeleteTiedChallenge' test.out

#- 19 AdminUpdateTiedChallengeSchedule
./ng net.accelbyte.sdk.cli.Main challenge adminUpdateTiedChallengeSchedule \
    --challengeCode 'xqN91FYF' \
    --namespace "$AB_NAMESPACE" \
    --body '{"action": "ACCELERATE", "endDate": "1993-05-21T00:00:00Z"}' \
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
    --body '{"appName": "D5ACmWBL", "extendType": "CUSTOM", "grpcServerAddress": "vTf7hHXU"}' \
    > test.out 2>&1
eval_tap $? 21 'AdminUpdateAssignmentPlugin' test.out

#- 22 AdminCreateAssignmentPlugin
./ng net.accelbyte.sdk.cli.Main challenge adminCreateAssignmentPlugin \
    --namespace "$AB_NAMESPACE" \
    --body '{"appName": "Lmr4Wi36", "extendType": "APP", "grpcServerAddress": "mJ5ScAyS"}' \
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
    --challengeCode 'Ttz2RpJv,FRpsbTdf,Pcs8yCCZ' \
    --body '{"userIds": ["wM6ijuKS", "r7E4BaeI", "jGhakhA6"]}' \
    > test.out 2>&1
eval_tap $? 24 'AdminEvaluateProgress' test.out

#- 25 AdminClaimUsersRewards
./ng net.accelbyte.sdk.cli.Main challenge adminClaimUsersRewards \
    --namespace "$AB_NAMESPACE" \
    --body '[{"rewardIds": ["aLbwGlCb", "Q1XJpJ6l", "u2NqzWq7"], "userId": "gmi8pBQj"}, {"rewardIds": ["1l4ZLEZ7", "g6mXttrh", "d0d729Xq"], "userId": "9NeLasyQ"}, {"rewardIds": ["MI9xRnSW", "kefqmVVO", "RX9WRw7a"], "userId": "zwJhjNdx"}]' \
    > test.out 2>&1
eval_tap $? 25 'AdminClaimUsersRewards' test.out

#- 26 AdminClaimUserRewardsByGoalCode
./ng net.accelbyte.sdk.cli.Main challenge adminClaimUserRewardsByGoalCode \
    --challengeCode 'DxBPBhcO' \
    --namespace "$AB_NAMESPACE" \
    --userId 'BKcm4eEu' \
    --body '{"goalCode": "cNnMO1x4"}' \
    > test.out 2>&1
eval_tap $? 26 'AdminClaimUserRewardsByGoalCode' test.out

#- 27 AdminGetUserProgression
./ng net.accelbyte.sdk.cli.Main challenge adminGetUserProgression \
    --challengeCode 'NSHUcEiT' \
    --namespace "$AB_NAMESPACE" \
    --userId 'vx0vbYE3' \
    --dateTime '1991-05-13T00:00:00Z' \
    --goalCode 'AS0pni24' \
    --limit '85' \
    --offset '17' \
    --tags 'HBHD6ZDr,NrB31ArW,TTiGh12v' \
    > test.out 2>&1
eval_tap $? 27 'AdminGetUserProgression' test.out

#- 28 AdminGetUserRewards
./ng net.accelbyte.sdk.cli.Main challenge adminGetUserRewards \
    --namespace "$AB_NAMESPACE" \
    --userId 'aD63LmkU' \
    --challengeCode 'TnkgpPVv' \
    --goalProgressionId 'GKcLjemt' \
    --limit '83' \
    --offset '36' \
    --sortBy 'createdAt' \
    --status 'CLAIMED' \
    > test.out 2>&1
eval_tap $? 28 'AdminGetUserRewards' test.out

#- 29 AdminClaimUserRewards
./ng net.accelbyte.sdk.cli.Main challenge adminClaimUserRewards \
    --namespace "$AB_NAMESPACE" \
    --userId 'Ptx4K9vK' \
    --body '{"rewardIDs": ["6Adb2OD8", "NNJuNRfI", "6J2R9UMb"]}' \
    > test.out 2>&1
eval_tap $? 29 'AdminClaimUserRewards' test.out

#- 30 GetChallenges
./ng net.accelbyte.sdk.cli.Main challenge getChallenges \
    --namespace "$AB_NAMESPACE" \
    --keyword 'NjQ3MB93' \
    --limit '61' \
    --offset '15' \
    --sortBy 'updatedAt:desc' \
    --status 'TIED' \
    --tags 'H1lJBuCx,Nnw7JuYf,Sn4amQju' \
    > test.out 2>&1
eval_tap $? 30 'GetChallenges' test.out

#- 31 PublicGetScheduledGoals
./ng net.accelbyte.sdk.cli.Main challenge publicGetScheduledGoals \
    --challengeCode 'RV8geA5v' \
    --namespace "$AB_NAMESPACE" \
    --limit '82' \
    --offset '1' \
    --sortBy 'createdAt:asc' \
    --tags 'BPTe7Re2,hhg92naE,uytZRzZL' \
    > test.out 2>&1
eval_tap $? 31 'PublicGetScheduledGoals' test.out

#- 32 PublicListSchedulesByGoal
./ng net.accelbyte.sdk.cli.Main challenge publicListSchedulesByGoal \
    --challengeCode 'WMoBJRYj' \
    --code '09utvI0v' \
    --namespace "$AB_NAMESPACE" \
    --limit '84' \
    --offset '55' \
    > test.out 2>&1
eval_tap $? 32 'PublicListSchedulesByGoal' test.out

#- 33 PublicListSchedules
./ng net.accelbyte.sdk.cli.Main challenge publicListSchedules \
    --challengeCode 'YZGdXHoy' \
    --namespace "$AB_NAMESPACE" \
    --dateTime '1986-10-22T00:00:00Z' \
    --limit '37' \
    --offset '70' \
    > test.out 2>&1
eval_tap $? 33 'PublicListSchedules' test.out

#- 34 PublicClaimUserRewardsByGoalCode
./ng net.accelbyte.sdk.cli.Main challenge publicClaimUserRewardsByGoalCode \
    --challengeCode 'KZdpYMQW' \
    --namespace "$AB_NAMESPACE" \
    --body '{"goalCode": "IkH3Czme"}' \
    > test.out 2>&1
eval_tap $? 34 'PublicClaimUserRewardsByGoalCode' test.out

#- 35 EvaluateMyProgress
./ng net.accelbyte.sdk.cli.Main challenge evaluateMyProgress \
    --namespace "$AB_NAMESPACE" \
    --challengeCode 'YMFyNQX8,BYf7l5Ku,c6DUfYpV' \
    > test.out 2>&1
eval_tap $? 35 'EvaluateMyProgress' test.out

#- 36 PublicGetUserProgression
./ng net.accelbyte.sdk.cli.Main challenge publicGetUserProgression \
    --challengeCode 'kZR4oF1T' \
    --namespace "$AB_NAMESPACE" \
    --dateTime '1998-12-27T00:00:00Z' \
    --goalCode 'tQ6842Mm' \
    --limit '97' \
    --offset '91' \
    --tags 'BKYQQQkn,I2HfUszw,BVtfZHQz' \
    > test.out 2>&1
eval_tap $? 36 'PublicGetUserProgression' test.out

#- 37 PublicGetPastUserProgression
./ng net.accelbyte.sdk.cli.Main challenge publicGetPastUserProgression \
    --challengeCode 'k3Xho8XD' \
    --index '28' \
    --namespace "$AB_NAMESPACE" \
    --goalCode 'Epl97ti6' \
    --limit '71' \
    --offset '16' \
    --tags 'txzDG5oL,qhMjZsGN,Rirhgtu4' \
    > test.out 2>&1
eval_tap $? 37 'PublicGetPastUserProgression' test.out

#- 38 PublicGetUserRewards
./ng net.accelbyte.sdk.cli.Main challenge publicGetUserRewards \
    --namespace "$AB_NAMESPACE" \
    --challengeCode 'vEkZVB3m' \
    --goalProgressionId 'pzLJmSDL' \
    --limit '58' \
    --offset '30' \
    --sortBy 'createdAt' \
    --status 'CLAIMED' \
    > test.out 2>&1
eval_tap $? 38 'PublicGetUserRewards' test.out

#- 39 PublicClaimUserRewards
./ng net.accelbyte.sdk.cli.Main challenge publicClaimUserRewards \
    --namespace "$AB_NAMESPACE" \
    --body '{"rewardIDs": ["QRBBu4Oa", "mWz05rqy", "f2ovenl6"]}' \
    > test.out 2>&1
eval_tap $? 39 'PublicClaimUserRewards' test.out


rm -f "tmp.dat"

exit $EXIT_CODE