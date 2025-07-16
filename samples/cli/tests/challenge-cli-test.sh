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
    --keyword 'S2JzIjc8' \
    --limit '69' \
    --offset '20' \
    --sortBy 'updatedAt:asc' \
    --status 'TIED' \
    --tags 'yljuwyEW,i4SvfO1R,EgacdG7W' \
    > test.out 2>&1
eval_tap $? 2 'AdminGetChallenges' test.out

#- 3 AdminCreateChallenge
./ng net.accelbyte.sdk.cli.Main challenge adminCreateChallenge \
    --namespace "$AB_NAMESPACE" \
    --body '{"activeGoalsPerRotation": 88, "assignmentRule": "UNSCHEDULED", "code": "e3CulQk2", "description": "20vF13G8", "endAfter": 56, "endDate": "1987-01-02T00:00:00Z", "goalsVisibility": "SHOWALL", "name": "yVwOwFbB", "randomizedPerRotation": false, "repeatAfter": 57, "resetConfig": {"resetDate": 8, "resetDay": 67, "resetTime": "Y170wlzy"}, "rotation": "WEEKLY", "startDate": "1977-04-11T00:00:00Z", "tags": ["ZedS6X3t", "tv7jCFfC", "lICVnV7P"]}' \
    > test.out 2>&1
eval_tap $? 3 'AdminCreateChallenge' test.out

#- 4 AdminGetItemReferences
./ng net.accelbyte.sdk.cli.Main challenge adminGetItemReferences \
    --namespace "$AB_NAMESPACE" \
    --itemId '4RXpCq62' \
    > test.out 2>&1
eval_tap $? 4 'AdminGetItemReferences' test.out

#- 5 AdminGetActiveChallenges
./ng net.accelbyte.sdk.cli.Main challenge adminGetActiveChallenges \
    --namespace "$AB_NAMESPACE" \
    --userId '9pW3tG7g' \
    --limit '56' \
    --offset '93' \
    > test.out 2>&1
eval_tap $? 5 'AdminGetActiveChallenges' test.out

#- 6 AdminGetChallenge
./ng net.accelbyte.sdk.cli.Main challenge adminGetChallenge \
    --challengeCode 'oUd62Yn0' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 6 'AdminGetChallenge' test.out

#- 7 AdminUpdateChallenge
./ng net.accelbyte.sdk.cli.Main challenge adminUpdateChallenge \
    --challengeCode 'TpzI45uR' \
    --namespace "$AB_NAMESPACE" \
    --body '{"activeGoalsPerRotation": 25, "assignmentRule": "UNSCHEDULED", "description": "ymkyzLdS", "endAfter": 26, "endDate": "1992-05-06T00:00:00Z", "goalsVisibility": "SHOWALL", "name": "tlnWx00x", "randomizedPerRotation": true, "repeatAfter": 30, "resetConfig": {"resetDate": 41, "resetDay": 20, "resetTime": "ENpEEVvz"}, "rotation": "WEEKLY", "startDate": "1980-03-14T00:00:00Z", "tags": ["LolgMfw2", "b7NBr30H", "05VPV2Ro"]}' \
    > test.out 2>&1
eval_tap $? 7 'AdminUpdateChallenge' test.out

#- 8 AdminDeleteChallenge
./ng net.accelbyte.sdk.cli.Main challenge adminDeleteChallenge \
    --challengeCode 'c2N6fMP0' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 8 'AdminDeleteChallenge' test.out

#- 9 AdminGetGoals
./ng net.accelbyte.sdk.cli.Main challenge adminGetGoals \
    --challengeCode 'ElFRBNgP' \
    --namespace "$AB_NAMESPACE" \
    --limit '13' \
    --offset '36' \
    --sortBy 'createdAt:asc' \
    --tags '7WBzsklK,okD7OV2Y,R4RCHJXJ' \
    > test.out 2>&1
eval_tap $? 9 'AdminGetGoals' test.out

#- 10 AdminCreateGoal
./ng net.accelbyte.sdk.cli.Main challenge adminCreateGoal \
    --challengeCode 'yQFYEAvT' \
    --namespace "$AB_NAMESPACE" \
    --body '{"code": "p7PLrNEp", "description": "M3G0jhwq", "isActive": false, "name": "eY9dU0ke", "requirementGroups": [{"operator": "AND", "predicates": [{"matcher": "LESS_THAN", "parameterName": "Y76HOtxF", "parameterType": "STATISTIC_CYCLE", "statCycleId": "D8G8Ymoe", "targetValue": 0.14316837111549507}, {"matcher": "GREATER_THAN_EQUAL", "parameterName": "YPOEtzea", "parameterType": "USERACCOUNT", "statCycleId": "5Xd4SdR3", "targetValue": 0.9943572685507142}, {"matcher": "LESS_THAN", "parameterName": "b5yADS7b", "parameterType": "ACHIEVEMENT", "statCycleId": "IaWneIRL", "targetValue": 0.8105357783068516}]}, {"operator": "AND", "predicates": [{"matcher": "GREATER_THAN", "parameterName": "Uj6OmOw3", "parameterType": "ACHIEVEMENT", "statCycleId": "hwrFtETn", "targetValue": 0.8684474111261704}, {"matcher": "GREATER_THAN_EQUAL", "parameterName": "XcvULT0Z", "parameterType": "ACHIEVEMENT", "statCycleId": "xCJ77VzB", "targetValue": 0.2921005081163822}, {"matcher": "EQUAL", "parameterName": "VKNWLchX", "parameterType": "USERACCOUNT", "statCycleId": "fSe0u6dX", "targetValue": 0.4117441072079999}]}, {"operator": "AND", "predicates": [{"matcher": "GREATER_THAN_EQUAL", "parameterName": "98AeLeG3", "parameterType": "STATISTIC_CYCLE", "statCycleId": "43mz4fMs", "targetValue": 0.11406614849370156}, {"matcher": "LESS_THAN", "parameterName": "gHgVk8JS", "parameterType": "ACHIEVEMENT", "statCycleId": "r2aIo0gB", "targetValue": 0.2602332334699985}, {"matcher": "GREATER_THAN", "parameterName": "IdhvPhuq", "parameterType": "STATISTIC_CYCLE", "statCycleId": "GQptJWbZ", "targetValue": 0.04201727224726293}]}], "rewards": [{"itemId": "6Q5mVTB8", "itemName": "sNwqxDVp", "qty": 0.8815948706355131, "type": "ENTITLEMENT"}, {"itemId": "cTOWPmvh", "itemName": "MMKf0BDC", "qty": 0.9022701683390605, "type": "ENTITLEMENT"}, {"itemId": "vTdBLekP", "itemName": "pLz1XCIX", "qty": 0.4632812685803046, "type": "STATISTIC"}], "schedule": {"endTime": "1986-07-24T00:00:00Z", "order": 90, "startTime": "1985-09-19T00:00:00Z"}, "tags": ["aJqmey5l", "0ghZPZpo", "tN0q5tMa"]}' \
    > test.out 2>&1
eval_tap $? 10 'AdminCreateGoal' test.out

#- 11 AdminGetGoal
./ng net.accelbyte.sdk.cli.Main challenge adminGetGoal \
    --challengeCode 'KRauZ20K' \
    --code 'Ezt1Dfr2' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 11 'AdminGetGoal' test.out

#- 12 AdminUpdateGoals
./ng net.accelbyte.sdk.cli.Main challenge adminUpdateGoals \
    --challengeCode '28IggRCH' \
    --code 'LaQGxkLz' \
    --namespace "$AB_NAMESPACE" \
    --body '{"description": "0DWwUchd", "isActive": false, "name": "fKJpJ8F7", "requirementGroups": [{"operator": "AND", "predicates": [{"matcher": "LESS_THAN_EQUAL", "parameterName": "gshh0tbV", "parameterType": "USERACCOUNT", "statCycleId": "Mj3WHKqQ", "targetValue": 0.043722289361998845}, {"matcher": "GREATER_THAN_EQUAL", "parameterName": "jC3Hrxyd", "parameterType": "USERACCOUNT", "statCycleId": "p3UV89Nk", "targetValue": 0.46178663352151883}, {"matcher": "LESS_THAN_EQUAL", "parameterName": "4atpbBA2", "parameterType": "ENTITLEMENT", "statCycleId": "l74mf2LU", "targetValue": 0.32771484230521863}]}, {"operator": "AND", "predicates": [{"matcher": "LESS_THAN", "parameterName": "vPViHeYq", "parameterType": "ENTITLEMENT", "statCycleId": "f8URMOZU", "targetValue": 0.8581619212821183}, {"matcher": "EQUAL", "parameterName": "4z2DtWVM", "parameterType": "STATISTIC", "statCycleId": "LCQoVwEj", "targetValue": 0.4748032311547207}, {"matcher": "GREATER_THAN_EQUAL", "parameterName": "S58BcPyS", "parameterType": "STATISTIC", "statCycleId": "rYjfOu2h", "targetValue": 0.9697591972797062}]}, {"operator": "AND", "predicates": [{"matcher": "LESS_THAN_EQUAL", "parameterName": "7IocSngt", "parameterType": "ACHIEVEMENT", "statCycleId": "rE3AzXTG", "targetValue": 0.8707113788621591}, {"matcher": "LESS_THAN_EQUAL", "parameterName": "9JRWc6eC", "parameterType": "USERACCOUNT", "statCycleId": "gVWqOPyG", "targetValue": 0.6077028814698685}, {"matcher": "GREATER_THAN_EQUAL", "parameterName": "2Iszk57x", "parameterType": "STATISTIC", "statCycleId": "tijD3zgd", "targetValue": 0.6861188600669161}]}], "rewards": [{"itemId": "xpmylJLg", "itemName": "L6tO2HqN", "qty": 0.36294948915801784, "type": "ENTITLEMENT"}, {"itemId": "VXtz8ocP", "itemName": "ldSfJwu5", "qty": 0.48463182867348953, "type": "STATISTIC"}, {"itemId": "NzCAZQw6", "itemName": "opdgNRL0", "qty": 0.5000164890589245, "type": "STATISTIC"}], "schedule": {"endTime": "1988-12-26T00:00:00Z", "order": 55, "startTime": "1986-06-25T00:00:00Z"}, "tags": ["QuIEli5j", "vuAz1ygA", "fYSwyux3"]}' \
    > test.out 2>&1
eval_tap $? 12 'AdminUpdateGoals' test.out

#- 13 AdminDeleteGoal
./ng net.accelbyte.sdk.cli.Main challenge adminDeleteGoal \
    --challengeCode 'WEwBJTxd' \
    --code 'ruILg82o' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 13 'AdminDeleteGoal' test.out

#- 14 AdminListSchedulesByGoal
./ng net.accelbyte.sdk.cli.Main challenge adminListSchedulesByGoal \
    --challengeCode 'RQ7FZxlv' \
    --code 'IRjh4DpC' \
    --namespace "$AB_NAMESPACE" \
    --limit '100' \
    --offset '36' \
    --userId 'e2f2OmvZ' \
    > test.out 2>&1
eval_tap $? 14 'AdminListSchedulesByGoal' test.out

#- 15 AdminGetPeriods
./ng net.accelbyte.sdk.cli.Main challenge adminGetPeriods \
    --challengeCode 'y9SfYlrF' \
    --namespace "$AB_NAMESPACE" \
    --limit '65' \
    --offset '73' \
    > test.out 2>&1
eval_tap $? 15 'AdminGetPeriods' test.out

#- 16 AdminRandomizeChallenge
./ng net.accelbyte.sdk.cli.Main challenge adminRandomizeChallenge \
    --challengeCode 'i7Aohah1' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 16 'AdminRandomizeChallenge' test.out

#- 17 AdminListSchedules
./ng net.accelbyte.sdk.cli.Main challenge adminListSchedules \
    --challengeCode '1Hff8B1d' \
    --namespace "$AB_NAMESPACE" \
    --dateTime '1992-08-23T00:00:00Z' \
    --limit '31' \
    --offset '78' \
    --userId 'UIQohtgL' \
    > test.out 2>&1
eval_tap $? 17 'AdminListSchedules' test.out

#- 18 AdminDeleteTiedChallenge
./ng net.accelbyte.sdk.cli.Main challenge adminDeleteTiedChallenge \
    --challengeCode 'IshQzkwG' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 18 'AdminDeleteTiedChallenge' test.out

#- 19 AdminUpdateTiedChallengeSchedule
./ng net.accelbyte.sdk.cli.Main challenge adminUpdateTiedChallengeSchedule \
    --challengeCode 'hgJeHudU' \
    --namespace "$AB_NAMESPACE" \
    --body '{"action": "STOP", "endDate": "1987-01-18T00:00:00Z"}' \
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
    --body '{"appName": "HlgmtHgv", "extendType": "APP", "grpcServerAddress": "lY48OM80"}' \
    > test.out 2>&1
eval_tap $? 21 'AdminUpdateAssignmentPlugin' test.out

#- 22 AdminCreateAssignmentPlugin
./ng net.accelbyte.sdk.cli.Main challenge adminCreateAssignmentPlugin \
    --namespace "$AB_NAMESPACE" \
    --body '{"appName": "AggEKsEb", "extendType": "CUSTOM", "grpcServerAddress": "d4SZg8f8"}' \
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
    --body '{"userIds": ["rdjgdh8Z", "DhaZSTt7", "dpJ7Ebux"]}' \
    > test.out 2>&1
eval_tap $? 24 'AdminEvaluateProgress' test.out

#- 25 AdminClaimUsersRewards
./ng net.accelbyte.sdk.cli.Main challenge adminClaimUsersRewards \
    --namespace "$AB_NAMESPACE" \
    --body '[{"rewardIds": ["c3JBesj1", "YsdzJR72", "dcbGnJNR"], "userId": "L2Q5ppJn"}, {"rewardIds": ["pczxtCI0", "vGJRt8aC", "3NcxNF9a"], "userId": "AokNfE9A"}, {"rewardIds": ["mp8kJYPT", "3is4OlIb", "gqjZx5qd"], "userId": "YNfcAqau"}]' \
    > test.out 2>&1
eval_tap $? 25 'AdminClaimUsersRewards' test.out

#- 26 AdminClaimUserRewardsByGoalCode
./ng net.accelbyte.sdk.cli.Main challenge adminClaimUserRewardsByGoalCode \
    --challengeCode '9Ejrfn1s' \
    --namespace "$AB_NAMESPACE" \
    --userId 'wFM0jnAE' \
    --body '{"goalCode": "JkBnQ1sL"}' \
    > test.out 2>&1
eval_tap $? 26 'AdminClaimUserRewardsByGoalCode' test.out

#- 27 AdminGetUserProgression
./ng net.accelbyte.sdk.cli.Main challenge adminGetUserProgression \
    --challengeCode 'CvSTqxCU' \
    --namespace "$AB_NAMESPACE" \
    --userId 'MBiIHyAw' \
    --dateTime '1977-10-27T00:00:00Z' \
    --goalCode 'SXrUBRzV' \
    --limit '93' \
    --offset '31' \
    --tags 'NicXsRkg,vk5dyk37,OcdqRCqV' \
    > test.out 2>&1
eval_tap $? 27 'AdminGetUserProgression' test.out

#- 28 AdminGetUserRewards
./ng net.accelbyte.sdk.cli.Main challenge adminGetUserRewards \
    --namespace "$AB_NAMESPACE" \
    --userId 't0MkzDDb' \
    --challengeCode '637Usitx' \
    --goalProgressionId 'kiKQ51EX' \
    --limit '80' \
    --offset '55' \
    --sortBy 'updatedAt' \
    --status 'UNCLAIMED' \
    > test.out 2>&1
eval_tap $? 28 'AdminGetUserRewards' test.out

#- 29 AdminClaimUserRewards
./ng net.accelbyte.sdk.cli.Main challenge adminClaimUserRewards \
    --namespace "$AB_NAMESPACE" \
    --userId 'YeBaBwqu' \
    --body '{"rewardIDs": ["Imva9Uy1", "RGNoSLAh", "uhteA2jA"]}' \
    > test.out 2>&1
eval_tap $? 29 'AdminClaimUserRewards' test.out

#- 30 GetChallenges
./ng net.accelbyte.sdk.cli.Main challenge getChallenges \
    --namespace "$AB_NAMESPACE" \
    --keyword 'SP72i121' \
    --limit '59' \
    --offset '52' \
    --sortBy 'updatedAt:desc' \
    --status 'TIED' \
    --tags '5ZazVGxL,b37gwFY2,2TyxydCd' \
    > test.out 2>&1
eval_tap $? 30 'GetChallenges' test.out

#- 31 PublicGetScheduledGoals
./ng net.accelbyte.sdk.cli.Main challenge publicGetScheduledGoals \
    --challengeCode 'cr53Xjvi' \
    --namespace "$AB_NAMESPACE" \
    --limit '87' \
    --offset '69' \
    --sortBy 'createdAt:asc' \
    --tags 'nhINWL8g,kWg1zJtb,qOfT7ygr' \
    > test.out 2>&1
eval_tap $? 31 'PublicGetScheduledGoals' test.out

#- 32 PublicListSchedulesByGoal
./ng net.accelbyte.sdk.cli.Main challenge publicListSchedulesByGoal \
    --challengeCode 'fFPPJoty' \
    --code '4BFBL999' \
    --namespace "$AB_NAMESPACE" \
    --limit '21' \
    --offset '3' \
    > test.out 2>&1
eval_tap $? 32 'PublicListSchedulesByGoal' test.out

#- 33 PublicListSchedules
./ng net.accelbyte.sdk.cli.Main challenge publicListSchedules \
    --challengeCode 'AA212stN' \
    --namespace "$AB_NAMESPACE" \
    --dateTime '1996-08-17T00:00:00Z' \
    --limit '17' \
    --offset '10' \
    > test.out 2>&1
eval_tap $? 33 'PublicListSchedules' test.out

#- 34 PublicClaimUserRewardsByGoalCode
./ng net.accelbyte.sdk.cli.Main challenge publicClaimUserRewardsByGoalCode \
    --challengeCode 'Wh5CTDL7' \
    --namespace "$AB_NAMESPACE" \
    --body '{"goalCode": "QEgjJbKY"}' \
    > test.out 2>&1
eval_tap $? 34 'PublicClaimUserRewardsByGoalCode' test.out

#- 35 EvaluateMyProgress
./ng net.accelbyte.sdk.cli.Main challenge evaluateMyProgress \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 35 'EvaluateMyProgress' test.out

#- 36 PublicGetUserProgression
./ng net.accelbyte.sdk.cli.Main challenge publicGetUserProgression \
    --challengeCode 'MkE1Rd03' \
    --namespace "$AB_NAMESPACE" \
    --dateTime '1985-11-11T00:00:00Z' \
    --goalCode 'x3EaX8Jl' \
    --limit '96' \
    --offset '59' \
    --tags 'Ot9bB9vK,LpSVclsY,MGLDLsUU' \
    > test.out 2>&1
eval_tap $? 36 'PublicGetUserProgression' test.out

#- 37 PublicGetPastUserProgression
./ng net.accelbyte.sdk.cli.Main challenge publicGetPastUserProgression \
    --challengeCode '3QKY3cw4' \
    --index '12' \
    --namespace "$AB_NAMESPACE" \
    --goalCode 'gKDRQt6G' \
    --limit '69' \
    --offset '52' \
    --tags 'i6kHSFjK,t2rnZvP4,qnzmWc9L' \
    > test.out 2>&1
eval_tap $? 37 'PublicGetPastUserProgression' test.out

#- 38 PublicGetUserRewards
./ng net.accelbyte.sdk.cli.Main challenge publicGetUserRewards \
    --namespace "$AB_NAMESPACE" \
    --challengeCode 'WcWjAFpQ' \
    --goalProgressionId 'qzz8xwWZ' \
    --limit '72' \
    --offset '39' \
    --sortBy 'updatedAt' \
    --status 'CLAIMED' \
    > test.out 2>&1
eval_tap $? 38 'PublicGetUserRewards' test.out

#- 39 PublicClaimUserRewards
./ng net.accelbyte.sdk.cli.Main challenge publicClaimUserRewards \
    --namespace "$AB_NAMESPACE" \
    --body '{"rewardIDs": ["3eGwv2si", "rmYsWx5i", "HbLcTWhP"]}' \
    > test.out 2>&1
eval_tap $? 39 'PublicClaimUserRewards' test.out


rm -f "tmp.dat"

exit $EXIT_CODE