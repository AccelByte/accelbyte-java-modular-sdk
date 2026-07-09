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
echo "1..41"

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
    --keyword 'aWTgCUA9' \
    --limit '88' \
    --offset '97' \
    --sortBy 'createdAt' \
    --status 'TIED' \
    --tags '59EDqhlW,QuKA6KSv,3D6c7iL1' \
    > test.out 2>&1
eval_tap $? 2 'AdminGetChallenges' test.out

#- 3 AdminCreateChallenge
./ng net.accelbyte.sdk.cli.Main challenge adminCreateChallenge \
    --namespace "$AB_NAMESPACE" \
    --body '{"activeGoalsPerRotation": 69, "assignmentRule": "FIXED", "code": "H9qR6Ygt", "description": "hRY3CCBz", "endAfter": 33, "endDate": "1993-10-27T00:00:00Z", "goalsVisibility": "SHOWALL", "name": "kPkThxpq", "randomizedPerRotation": false, "repeatAfter": 83, "resetConfig": {"resetDate": 27, "resetDay": 34, "resetTime": "agPbrR8n"}, "rotation": "NONE", "startDate": "1996-06-23T00:00:00Z", "tags": ["bKMCgYYQ", "HKXjeA44", "McE5yUBu"]}' \
    > test.out 2>&1
eval_tap $? 3 'AdminCreateChallenge' test.out

#- 4 AdminGetItemReferences
./ng net.accelbyte.sdk.cli.Main challenge adminGetItemReferences \
    --namespace "$AB_NAMESPACE" \
    --itemId 'zEZmjdKN' \
    > test.out 2>&1
eval_tap $? 4 'AdminGetItemReferences' test.out

#- 5 AdminGetActiveChallenges
./ng net.accelbyte.sdk.cli.Main challenge adminGetActiveChallenges \
    --namespace "$AB_NAMESPACE" \
    --userId 'pNv4G3TV' \
    --limit '31' \
    --offset '38' \
    > test.out 2>&1
eval_tap $? 5 'AdminGetActiveChallenges' test.out

#- 6 AdminGetChallenge
./ng net.accelbyte.sdk.cli.Main challenge adminGetChallenge \
    --challengeCode 'aiTAB0Hy' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 6 'AdminGetChallenge' test.out

#- 7 AdminUpdateChallenge
./ng net.accelbyte.sdk.cli.Main challenge adminUpdateChallenge \
    --challengeCode '31XTsiXh' \
    --namespace "$AB_NAMESPACE" \
    --body '{"activeGoalsPerRotation": 6, "assignmentRule": "FIXED", "description": "dblKUik6", "endAfter": 13, "endDate": "1989-01-29T00:00:00Z", "goalsVisibility": "SHOWALL", "name": "brnZh1xW", "randomizedPerRotation": false, "repeatAfter": 23, "resetConfig": {"resetDate": 5, "resetDay": 48, "resetTime": "ivNzCVbv"}, "rotation": "WEEKLY", "startDate": "1978-07-14T00:00:00Z", "tags": ["uo5k1HCz", "geOHlull", "ABl8JhTm"]}' \
    > test.out 2>&1
eval_tap $? 7 'AdminUpdateChallenge' test.out

#- 8 AdminDeleteChallenge
./ng net.accelbyte.sdk.cli.Main challenge adminDeleteChallenge \
    --challengeCode '8CdcxGaZ' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 8 'AdminDeleteChallenge' test.out

#- 9 AdminGetGoals
./ng net.accelbyte.sdk.cli.Main challenge adminGetGoals \
    --challengeCode 'HAOHU9l1' \
    --namespace "$AB_NAMESPACE" \
    --limit '100' \
    --offset '59' \
    --sortBy 'updatedAt' \
    --tags 'JlUHr4XF,8IzJZbKf,Y52ztzZ7' \
    > test.out 2>&1
eval_tap $? 9 'AdminGetGoals' test.out

#- 10 AdminCreateGoal
./ng net.accelbyte.sdk.cli.Main challenge adminCreateGoal \
    --challengeCode 'ws0RZRAI' \
    --namespace "$AB_NAMESPACE" \
    --body '{"code": "8M6elwxR", "description": "NBVBpu1O", "isActive": false, "name": "AYxTiKtW", "requirementGroups": [{"operator": "AND", "predicates": [{"id": "3Qmz3zhR", "matcher": "GREATER_THAN_EQUAL", "parameterName": "DNlphSGc", "parameterType": "ACHIEVEMENT", "statCycleId": "rtdh9iKM", "targetValue": 0.6654715124322206}, {"id": "nyLUyV5D", "matcher": "GREATER_THAN_EQUAL", "parameterName": "icPYoal9", "parameterType": "USERACCOUNT", "statCycleId": "A8xATzwu", "targetValue": 0.44213829988007247}, {"id": "fDf45u2I", "matcher": "LESS_THAN_EQUAL", "parameterName": "asBvA7L3", "parameterType": "ACHIEVEMENT", "statCycleId": "guc2novh", "targetValue": 0.7433391719883555}]}, {"operator": "AND", "predicates": [{"id": "oxFuklGK", "matcher": "EQUAL", "parameterName": "Jt42ttqr", "parameterType": "USERACCOUNT", "statCycleId": "TnrABauj", "targetValue": 0.7261757505591223}, {"id": "5ZXLVwsJ", "matcher": "LESS_THAN", "parameterName": "nq7BvMMk", "parameterType": "USERACCOUNT", "statCycleId": "JxkZOu5p", "targetValue": 0.0129441810358627}, {"id": "l0tpRdQ8", "matcher": "GREATER_THAN", "parameterName": "6VuI39aF", "parameterType": "USERACCOUNT", "statCycleId": "L2FQYoG7", "targetValue": 0.8393604718913692}]}, {"operator": "AND", "predicates": [{"id": "U18Qit3T", "matcher": "GREATER_THAN", "parameterName": "QxyjR6sq", "parameterType": "STATISTIC", "statCycleId": "0buCDf3a", "targetValue": 0.092749978335257}, {"id": "pxkdljyh", "matcher": "GREATER_THAN_EQUAL", "parameterName": "TioCZDj7", "parameterType": "ENTITLEMENT", "statCycleId": "veIJXztF", "targetValue": 0.6501266093684653}, {"id": "TUsgHfJb", "matcher": "LESS_THAN", "parameterName": "HrABG1Aa", "parameterType": "STATISTIC", "statCycleId": "Sx2761JH", "targetValue": 0.5507582226204469}]}], "rewards": [{"itemId": "HhULWZde", "itemName": "BoVA5H6J", "qty": 0.2328574131157014, "type": "ENTITLEMENT"}, {"itemId": "QR7EuYFD", "itemName": "fniIc5eh", "qty": 0.9166453453926326, "type": "ENTITLEMENT"}, {"itemId": "36FbQPHi", "itemName": "NSWmG3HI", "qty": 0.7363582669369282, "type": "ENTITLEMENT"}], "schedule": {"endTime": "1988-10-04T00:00:00Z", "order": 88, "startTime": "1984-09-18T00:00:00Z"}, "tags": ["jT1P0MyN", "ShEutgVs", "95mKstQs"]}' \
    > test.out 2>&1
eval_tap $? 10 'AdminCreateGoal' test.out

#- 11 AdminGetGoal
./ng net.accelbyte.sdk.cli.Main challenge adminGetGoal \
    --challengeCode 'XCysgCL5' \
    --code 'hoKwZwxW' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 11 'AdminGetGoal' test.out

#- 12 AdminUpdateGoals
./ng net.accelbyte.sdk.cli.Main challenge adminUpdateGoals \
    --challengeCode 'STGNghK1' \
    --code 'R8FWi6uh' \
    --namespace "$AB_NAMESPACE" \
    --body '{"description": "1GjT0uot", "isActive": false, "name": "VFUOb5dG", "requirementGroups": [{"operator": "AND", "predicates": [{"id": "7YtrUIgC", "matcher": "GREATER_THAN", "parameterName": "zIBg2wDe", "parameterType": "ENTITLEMENT", "statCycleId": "8yne0pNI", "targetValue": 0.7742756500640797}, {"id": "AYl7cmnu", "matcher": "GREATER_THAN", "parameterName": "bAu4gt1V", "parameterType": "USERACCOUNT", "statCycleId": "qgIHeOD0", "targetValue": 0.16181314946136127}, {"id": "FvvpYPsq", "matcher": "EQUAL", "parameterName": "l5oP5yqb", "parameterType": "STATISTIC", "statCycleId": "zr2Ht9hl", "targetValue": 0.5757530646662778}]}, {"operator": "AND", "predicates": [{"id": "OMMcK1Ft", "matcher": "EQUAL", "parameterName": "GFObjJxv", "parameterType": "STATISTIC_CYCLE", "statCycleId": "KA7oMPqb", "targetValue": 0.6596311312614628}, {"id": "ay3XvKeL", "matcher": "EQUAL", "parameterName": "F0vQVXJK", "parameterType": "ENTITLEMENT", "statCycleId": "PW5DB9UN", "targetValue": 0.7438938340425539}, {"id": "2KcsbHXD", "matcher": "LESS_THAN", "parameterName": "IlpnvvaS", "parameterType": "STATISTIC", "statCycleId": "3Rqvpqgt", "targetValue": 0.23141521324512826}]}, {"operator": "AND", "predicates": [{"id": "apbmj64J", "matcher": "GREATER_THAN_EQUAL", "parameterName": "8fyrHLkJ", "parameterType": "ACHIEVEMENT", "statCycleId": "c4J868wE", "targetValue": 0.45732040725362777}, {"id": "F4Kf5l1t", "matcher": "LESS_THAN_EQUAL", "parameterName": "uCDFZ15e", "parameterType": "USERACCOUNT", "statCycleId": "LJuXXiaY", "targetValue": 0.40470798363911853}, {"id": "NsmFdgJ4", "matcher": "LESS_THAN", "parameterName": "BjL36wEv", "parameterType": "ACHIEVEMENT", "statCycleId": "Dd4K8dZ5", "targetValue": 0.6706924698619433}]}], "rewards": [{"itemId": "G49C6xSt", "itemName": "1RgAoiJI", "qty": 0.7445796088741805, "type": "STATISTIC"}, {"itemId": "1EaUoIB0", "itemName": "8gVblAbH", "qty": 0.2201443766877158, "type": "STATISTIC"}, {"itemId": "OqnOOvj3", "itemName": "3JgFuDia", "qty": 0.17621798492176122, "type": "STATISTIC"}], "schedule": {"endTime": "1999-11-01T00:00:00Z", "order": 94, "startTime": "1976-06-18T00:00:00Z"}, "tags": ["oGatHLRf", "LPvKeaQ2", "HnuGohNN"]}' \
    > test.out 2>&1
eval_tap $? 12 'AdminUpdateGoals' test.out

#- 13 AdminDeleteGoal
./ng net.accelbyte.sdk.cli.Main challenge adminDeleteGoal \
    --challengeCode 'SW67YYHO' \
    --code 'zWWsQ5vf' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 13 'AdminDeleteGoal' test.out

#- 14 AdminListSchedulesByGoal
./ng net.accelbyte.sdk.cli.Main challenge adminListSchedulesByGoal \
    --challengeCode 'HzuD9P06' \
    --code 'Ls9pTSCs' \
    --namespace "$AB_NAMESPACE" \
    --limit '43' \
    --offset '13' \
    --userId 'xgj1ZY3J' \
    > test.out 2>&1
eval_tap $? 14 'AdminListSchedulesByGoal' test.out

#- 15 AdminMoveGoalToSlot
./ng net.accelbyte.sdk.cli.Main challenge adminMoveGoalToSlot \
    --challengeCode '7OFfHt7q' \
    --code 'jLPptgX7' \
    --namespace "$AB_NAMESPACE" \
    --body '{"slotIndex": 90}' \
    > test.out 2>&1
eval_tap $? 15 'AdminMoveGoalToSlot' test.out

#- 16 AdminGetPeriods
./ng net.accelbyte.sdk.cli.Main challenge adminGetPeriods \
    --challengeCode 'YN0Ml8AC' \
    --namespace "$AB_NAMESPACE" \
    --limit '70' \
    --offset '52' \
    > test.out 2>&1
eval_tap $? 16 'AdminGetPeriods' test.out

#- 17 AdminRandomizeChallenge
./ng net.accelbyte.sdk.cli.Main challenge adminRandomizeChallenge \
    --challengeCode 'S9B1fryj' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 17 'AdminRandomizeChallenge' test.out

#- 18 AdminListSchedules
./ng net.accelbyte.sdk.cli.Main challenge adminListSchedules \
    --challengeCode '9S7kGrXW' \
    --namespace "$AB_NAMESPACE" \
    --dateTime '1983-07-17T00:00:00Z' \
    --limit '41' \
    --offset '56' \
    --userId '2GFuzgSe' \
    > test.out 2>&1
eval_tap $? 18 'AdminListSchedules' test.out

#- 19 AdminGetChallengeSlots
./ng net.accelbyte.sdk.cli.Main challenge adminGetChallengeSlots \
    --challengeCode 'FSMlNFqc' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 19 'AdminGetChallengeSlots' test.out

#- 20 AdminDeleteTiedChallenge
./ng net.accelbyte.sdk.cli.Main challenge adminDeleteTiedChallenge \
    --challengeCode 'CV53nWHt' \
    --namespace "$AB_NAMESPACE" \
    --safeDelete 'B9ANHxFo' \
    > test.out 2>&1
eval_tap $? 20 'AdminDeleteTiedChallenge' test.out

#- 21 AdminUpdateTiedChallengeSchedule
./ng net.accelbyte.sdk.cli.Main challenge adminUpdateTiedChallengeSchedule \
    --challengeCode 'v6ztiXgT' \
    --namespace "$AB_NAMESPACE" \
    --body '{"action": "STOP", "endDate": "1971-10-30T00:00:00Z"}' \
    > test.out 2>&1
eval_tap $? 21 'AdminUpdateTiedChallengeSchedule' test.out

#- 22 AdminGetAssignmentPlugin
./ng net.accelbyte.sdk.cli.Main challenge adminGetAssignmentPlugin \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 22 'AdminGetAssignmentPlugin' test.out

#- 23 AdminUpdateAssignmentPlugin
./ng net.accelbyte.sdk.cli.Main challenge adminUpdateAssignmentPlugin \
    --namespace "$AB_NAMESPACE" \
    --body '{"appName": "docLy1cH", "extendType": "APP", "grpcServerAddress": "vZk3LLCq"}' \
    > test.out 2>&1
eval_tap $? 23 'AdminUpdateAssignmentPlugin' test.out

#- 24 AdminCreateAssignmentPlugin
./ng net.accelbyte.sdk.cli.Main challenge adminCreateAssignmentPlugin \
    --namespace "$AB_NAMESPACE" \
    --body '{"appName": "AsN8uK7w", "extendType": "CUSTOM", "grpcServerAddress": "ZdAdrSs4"}' \
    > test.out 2>&1
eval_tap $? 24 'AdminCreateAssignmentPlugin' test.out

#- 25 AdminDeleteAssignmentPlugin
./ng net.accelbyte.sdk.cli.Main challenge adminDeleteAssignmentPlugin \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 25 'AdminDeleteAssignmentPlugin' test.out

#- 26 AdminEvaluateProgress
./ng net.accelbyte.sdk.cli.Main challenge adminEvaluateProgress \
    --namespace "$AB_NAMESPACE" \
    --challengeCode 'g5zzBgdW,13irAYQF,92J7xDVK' \
    --includeOneTimeEvent 'hlSTldN0' \
    --body '{"userIds": ["O8I3zGur", "2GUoKU2y", "MUD6VClr"]}' \
    > test.out 2>&1
eval_tap $? 26 'AdminEvaluateProgress' test.out

#- 27 AdminClaimUsersRewards
./ng net.accelbyte.sdk.cli.Main challenge adminClaimUsersRewards \
    --namespace "$AB_NAMESPACE" \
    --body '[{"rewardIds": ["765zn7Ko", "usEgi0tq", "v1E0iO59"], "userId": "XwOnP8qr"}, {"rewardIds": ["hxUbMvSH", "fpN2OcrP", "M2ermRw9"], "userId": "U6c001sA"}, {"rewardIds": ["iNsfPmfN", "eVeHL3Ka", "RFCkivK4"], "userId": "N9hcO5zK"}]' \
    > test.out 2>&1
eval_tap $? 27 'AdminClaimUsersRewards' test.out

#- 28 AdminClaimUserRewardsByGoalCode
./ng net.accelbyte.sdk.cli.Main challenge adminClaimUserRewardsByGoalCode \
    --challengeCode 'FvoEmh5o' \
    --namespace "$AB_NAMESPACE" \
    --userId 'urdU2zay' \
    --body '{"goalCode": "ykLACvqn"}' \
    > test.out 2>&1
eval_tap $? 28 'AdminClaimUserRewardsByGoalCode' test.out

#- 29 AdminGetUserProgression
./ng net.accelbyte.sdk.cli.Main challenge adminGetUserProgression \
    --challengeCode 'Y2NAcu3i' \
    --namespace "$AB_NAMESPACE" \
    --userId 'XzxSY4uY' \
    --dateTime '1981-04-24T00:00:00Z' \
    --goalCode 'FQjyY929' \
    --limit '58' \
    --offset '49' \
    --tags '0snq1Ywo,A7MXkaF8,9OhhQ0DY' \
    > test.out 2>&1
eval_tap $? 29 'AdminGetUserProgression' test.out

#- 30 AdminGetUserRewards
./ng net.accelbyte.sdk.cli.Main challenge adminGetUserRewards \
    --namespace "$AB_NAMESPACE" \
    --userId 'RDhjI3CI' \
    --challengeCode 'DWPn5NOJ' \
    --goalProgressionId 'EzUwfwNm' \
    --limit '24' \
    --offset '60' \
    --sortBy 'updatedAt:asc' \
    --status 'UNCLAIMED' \
    > test.out 2>&1
eval_tap $? 30 'AdminGetUserRewards' test.out

#- 31 AdminClaimUserRewards
./ng net.accelbyte.sdk.cli.Main challenge adminClaimUserRewards \
    --namespace "$AB_NAMESPACE" \
    --userId 'XuzzTKgo' \
    --body '{"rewardIDs": ["W2zjTvT2", "t3kBWEdQ", "OhLon5Fk"]}' \
    > test.out 2>&1
eval_tap $? 31 'AdminClaimUserRewards' test.out

#- 32 PublicGetChallenges
./ng net.accelbyte.sdk.cli.Main challenge publicGetChallenges \
    --namespace "$AB_NAMESPACE" \
    --keyword 'UjRDXjxI' \
    --limit '39' \
    --offset '50' \
    --sortBy 'name:asc' \
    --status 'TIED' \
    --tags 'D2tayQQu,O7QF0HUT,naB3O6x4' \
    > test.out 2>&1
eval_tap $? 32 'PublicGetChallenges' test.out

#- 33 PublicGetScheduledGoals
./ng net.accelbyte.sdk.cli.Main challenge publicGetScheduledGoals \
    --challengeCode 'zImwPXrh' \
    --namespace "$AB_NAMESPACE" \
    --limit '53' \
    --offset '48' \
    --sortBy 'createdAt:desc' \
    --tags 'clrZIOL4,hfuoqMS3,o5ggguJG' \
    > test.out 2>&1
eval_tap $? 33 'PublicGetScheduledGoals' test.out

#- 34 PublicListSchedulesByGoal
./ng net.accelbyte.sdk.cli.Main challenge publicListSchedulesByGoal \
    --challengeCode 'aZ8whXUb' \
    --code 'jSb8ejeD' \
    --namespace "$AB_NAMESPACE" \
    --limit '30' \
    --offset '13' \
    > test.out 2>&1
eval_tap $? 34 'PublicListSchedulesByGoal' test.out

#- 35 PublicListSchedules
./ng net.accelbyte.sdk.cli.Main challenge publicListSchedules \
    --challengeCode 'eox1QxQ1' \
    --namespace "$AB_NAMESPACE" \
    --dateTime '1997-09-27T00:00:00Z' \
    --limit '64' \
    --offset '15' \
    > test.out 2>&1
eval_tap $? 35 'PublicListSchedules' test.out

#- 36 PublicClaimUserRewardsByGoalCode
./ng net.accelbyte.sdk.cli.Main challenge publicClaimUserRewardsByGoalCode \
    --challengeCode 'YOqXFSv9' \
    --namespace "$AB_NAMESPACE" \
    --body '{"goalCode": "FatOHtR4"}' \
    > test.out 2>&1
eval_tap $? 36 'PublicClaimUserRewardsByGoalCode' test.out

#- 37 PublicEvaluateMyProgress
./ng net.accelbyte.sdk.cli.Main challenge publicEvaluateMyProgress \
    --namespace "$AB_NAMESPACE" \
    --challengeCode 'Fui03ntz,5HMMCrOJ,s5GOn8Di' \
    --includeOneTimeEvent 'v6gSR69o' \
    > test.out 2>&1
eval_tap $? 37 'PublicEvaluateMyProgress' test.out

#- 38 PublicGetUserProgression
./ng net.accelbyte.sdk.cli.Main challenge publicGetUserProgression \
    --challengeCode 'BNicwuzP' \
    --namespace "$AB_NAMESPACE" \
    --dateTime '1987-09-08T00:00:00Z' \
    --goalCode 'FX3XjOoS' \
    --limit '4' \
    --offset '87' \
    --tags 'uogVgs9T,6z55iwIS,rrGUwKUm' \
    > test.out 2>&1
eval_tap $? 38 'PublicGetUserProgression' test.out

#- 39 PublicGetPastUserProgression
./ng net.accelbyte.sdk.cli.Main challenge publicGetPastUserProgression \
    --challengeCode 'lCnAixJX' \
    --index '92' \
    --namespace "$AB_NAMESPACE" \
    --goalCode 'AIGUT5tA' \
    --limit '51' \
    --offset '3' \
    --tags 'xFUNpIYp,nFExbDPX,rLu1qFaI' \
    > test.out 2>&1
eval_tap $? 39 'PublicGetPastUserProgression' test.out

#- 40 PublicGetUserRewards
./ng net.accelbyte.sdk.cli.Main challenge publicGetUserRewards \
    --namespace "$AB_NAMESPACE" \
    --challengeCode 'SQUIcBtn' \
    --goalProgressionId 'vEMdPNbl' \
    --limit '95' \
    --offset '22' \
    --sortBy 'updatedAt:asc' \
    --status 'UNCLAIMED' \
    > test.out 2>&1
eval_tap $? 40 'PublicGetUserRewards' test.out

#- 41 PublicClaimUserRewards
./ng net.accelbyte.sdk.cli.Main challenge publicClaimUserRewards \
    --namespace "$AB_NAMESPACE" \
    --body '{"rewardIDs": ["fEKwgUG8", "KglyAB5G", "M0nvWMTs"]}' \
    > test.out 2>&1
eval_tap $? 41 'PublicClaimUserRewards' test.out


rm -f "tmp.dat"

exit $EXIT_CODE