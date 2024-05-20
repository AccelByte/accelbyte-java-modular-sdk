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
    --limit '49' \
    --offset '15' \
    --sortBy 'EF6hd1wV' \
    --status 'TIED' \
    > test.out 2>&1
eval_tap $? 2 'AdminGetChallenges' test.out

#- 3 AdminCreateChallenge
./ng net.accelbyte.sdk.cli.Main challenge adminCreateChallenge \
    --namespace "$AB_NAMESPACE" \
    --body '{"activeGoalsPerRotation": 42, "assignmentRule": "UNSCHEDULED", "code": "h58uc11b", "description": "j0KwLJat", "endAfter": 88, "endDate": "1979-06-26T00:00:00Z", "goalsVisibility": "SHOWALL", "name": "5Ut8kGaq", "repeatAfter": 35, "rotation": "WEEKLY", "startDate": "1981-04-07T00:00:00Z"}' \
    > test.out 2>&1
eval_tap $? 3 'AdminCreateChallenge' test.out

#- 4 AdminGetChallenge
./ng net.accelbyte.sdk.cli.Main challenge adminGetChallenge \
    --challengeCode 'uxQ1LuU0' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 4 'AdminGetChallenge' test.out

#- 5 AdminUpdateChallenge
./ng net.accelbyte.sdk.cli.Main challenge adminUpdateChallenge \
    --challengeCode 'OIF6fIsR' \
    --namespace "$AB_NAMESPACE" \
    --body '{"activeGoalsPerRotation": 72, "assignmentRule": "UNSCHEDULED", "description": "CPfDxpag", "endAfter": 77, "endDate": "1998-09-27T00:00:00Z", "goalsVisibility": "SHOWALL", "name": "X01ENybB", "repeatAfter": 19, "rotation": "DAILY", "startDate": "1975-03-17T00:00:00Z"}' \
    > test.out 2>&1
eval_tap $? 5 'AdminUpdateChallenge' test.out

#- 6 AdminDeleteChallenge
./ng net.accelbyte.sdk.cli.Main challenge adminDeleteChallenge \
    --challengeCode 'tJNHd4ko' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 6 'AdminDeleteChallenge' test.out

#- 7 AdminGetGoals
./ng net.accelbyte.sdk.cli.Main challenge adminGetGoals \
    --challengeCode 'Mc6tO8kO' \
    --namespace "$AB_NAMESPACE" \
    --limit '41' \
    --offset '3' \
    --sortBy 'JRwaOoZH' \
    > test.out 2>&1
eval_tap $? 7 'AdminGetGoals' test.out

#- 8 AdminCreateGoal
./ng net.accelbyte.sdk.cli.Main challenge adminCreateGoal \
    --challengeCode 'nCrujRCm' \
    --namespace "$AB_NAMESPACE" \
    --body '{"code": "Scwr5rGA", "description": "XnRUwf0Z", "isActive": false, "name": "biEMVHHA", "requirementGroups": [{"operator": "AND", "predicates": [{"matcher": "LESS_THAN", "parameterName": "SWlbvTtF", "parameterType": "STATISTIC", "statCycleId": "fI4veNVQ", "targetValue": 0.8672917140612048}, {"matcher": "EQUAL", "parameterName": "S02sKd0s", "parameterType": "STATISTIC", "statCycleId": "Hqpw7wgS", "targetValue": 0.632668729545146}, {"matcher": "EQUAL", "parameterName": "tDXrOpRz", "parameterType": "USERACCOUNT", "statCycleId": "G7ImmvRM", "targetValue": 0.036003193383828846}]}, {"operator": "AND", "predicates": [{"matcher": "GREATER_THAN_EQUAL", "parameterName": "ONoJpWxQ", "parameterType": "USERACCOUNT", "statCycleId": "vH5k5XoZ", "targetValue": 0.41120963510949426}, {"matcher": "LESS_THAN", "parameterName": "PAcFfgok", "parameterType": "STATISTIC_CYCLE", "statCycleId": "1eUDGMhq", "targetValue": 0.789503098881668}, {"matcher": "LESS_THAN", "parameterName": "UeCt0oXc", "parameterType": "ACHIEVEMENT", "statCycleId": "l3Quzs5h", "targetValue": 0.9000492976435284}]}, {"operator": "AND", "predicates": [{"matcher": "LESS_THAN", "parameterName": "Q378d5SI", "parameterType": "STATISTIC", "statCycleId": "n4IyIehB", "targetValue": 0.1587519620106972}, {"matcher": "LESS_THAN", "parameterName": "7bbSQKkl", "parameterType": "USERACCOUNT", "statCycleId": "zIYcbNlC", "targetValue": 0.9334083879873337}, {"matcher": "LESS_THAN_EQUAL", "parameterName": "A9xMiHsq", "parameterType": "USERACCOUNT", "statCycleId": "KRdsBwUc", "targetValue": 0.3622216505961169}]}], "rewards": [{"itemId": "QFxyGnoc", "itemName": "F74Eap5r", "qty": 0.8511120024336206, "type": "STATISTIC"}, {"itemId": "pTHlN5iF", "itemName": "cEjHocQ4", "qty": 0.8166490404542817, "type": "ENTITLEMENT"}, {"itemId": "bsrKfZ5e", "itemName": "2415P4Dd", "qty": 0.564800826899889, "type": "STATISTIC"}], "schedule": {"endTime": "1987-01-03T00:00:00Z", "order": 5, "startTime": "1992-07-06T00:00:00Z"}, "tags": ["n7NwPzpO", "H8PQbZHJ", "vlNyUh6f"]}' \
    > test.out 2>&1
eval_tap $? 8 'AdminCreateGoal' test.out

#- 9 AdminGetGoal
./ng net.accelbyte.sdk.cli.Main challenge adminGetGoal \
    --challengeCode 'IeWe6B9b' \
    --code 'YrXrFErp' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 9 'AdminGetGoal' test.out

#- 10 AdminUpdateGoals
./ng net.accelbyte.sdk.cli.Main challenge adminUpdateGoals \
    --challengeCode 'Un0USZOt' \
    --code 'xPXt8JKN' \
    --namespace "$AB_NAMESPACE" \
    --body '{"description": "IuHyIDKe", "isActive": true, "name": "S561fASi", "requirementGroups": [{"operator": "AND", "predicates": [{"matcher": "GREATER_THAN_EQUAL", "parameterName": "1zlRLWUE", "parameterType": "USERACCOUNT", "statCycleId": "K8FgEPYx", "targetValue": 0.5560294365911895}, {"matcher": "EQUAL", "parameterName": "saERtXHi", "parameterType": "STATISTIC_CYCLE", "statCycleId": "xNFOea4F", "targetValue": 0.9496388689009496}, {"matcher": "LESS_THAN", "parameterName": "lxTYHnZa", "parameterType": "STATISTIC_CYCLE", "statCycleId": "QdvH6smk", "targetValue": 0.3688199703889651}]}, {"operator": "AND", "predicates": [{"matcher": "GREATER_THAN", "parameterName": "rgi6pnWG", "parameterType": "STATISTIC_CYCLE", "statCycleId": "5sMgiq4k", "targetValue": 0.9454428393496617}, {"matcher": "GREATER_THAN", "parameterName": "j2QNfgjE", "parameterType": "ACHIEVEMENT", "statCycleId": "NRMd0tHp", "targetValue": 0.22795813693277323}, {"matcher": "GREATER_THAN", "parameterName": "4Jfy3TKn", "parameterType": "STATISTIC_CYCLE", "statCycleId": "iVmiAFnX", "targetValue": 0.6460378595438707}]}, {"operator": "AND", "predicates": [{"matcher": "EQUAL", "parameterName": "23bcxLl7", "parameterType": "STATISTIC", "statCycleId": "HRbtKbv7", "targetValue": 0.5361309810725696}, {"matcher": "LESS_THAN_EQUAL", "parameterName": "Y8SxxH8w", "parameterType": "ACHIEVEMENT", "statCycleId": "QCcZdufa", "targetValue": 0.7258588197075329}, {"matcher": "LESS_THAN_EQUAL", "parameterName": "mgVp18zD", "parameterType": "STATISTIC_CYCLE", "statCycleId": "3Uq39adl", "targetValue": 0.7288524344146393}]}], "rewards": [{"itemId": "WarRbcC4", "itemName": "VrA6X031", "qty": 0.14838097631516955, "type": "ENTITLEMENT"}, {"itemId": "Hl0qrDig", "itemName": "ComNHYaS", "qty": 0.36394411200516386, "type": "STATISTIC"}, {"itemId": "vBOMORF1", "itemName": "Bhl6jdKN", "qty": 0.43438469698964777, "type": "STATISTIC"}], "schedule": {"endTime": "1990-03-14T00:00:00Z", "order": 39, "startTime": "1996-08-18T00:00:00Z"}, "tags": ["dBSHhMCq", "yX2RPtkE", "6HkAYkxK"]}' \
    > test.out 2>&1
eval_tap $? 10 'AdminUpdateGoals' test.out

#- 11 AdminDeleteGoal
./ng net.accelbyte.sdk.cli.Main challenge adminDeleteGoal \
    --challengeCode '1hDMV0Cu' \
    --code 'BlTdDodk' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 11 'AdminDeleteGoal' test.out

#- 12 AdminGetPeriods
./ng net.accelbyte.sdk.cli.Main challenge adminGetPeriods \
    --challengeCode 'R3BSUyFH' \
    --namespace "$AB_NAMESPACE" \
    --limit '88' \
    --offset '65' \
    > test.out 2>&1
eval_tap $? 12 'AdminGetPeriods' test.out

#- 13 AdminRandomizeChallenge
./ng net.accelbyte.sdk.cli.Main challenge adminRandomizeChallenge \
    --challengeCode 'm46LDKba' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 13 'AdminRandomizeChallenge' test.out

#- 14 AdminDeleteTiedChallenge
./ng net.accelbyte.sdk.cli.Main challenge adminDeleteTiedChallenge \
    --challengeCode 'b7MmsKG4' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 14 'AdminDeleteTiedChallenge' test.out

#- 15 AdminEvaluateProgress
./ng net.accelbyte.sdk.cli.Main challenge adminEvaluateProgress \
    --namespace "$AB_NAMESPACE" \
    --body '{"userIds": ["PeCkrrFQ", "jrBAZaGb", "9npZpkrC"]}' \
    > test.out 2>&1
eval_tap $? 15 'AdminEvaluateProgress' test.out

#- 16 AdminGetUserRewards
./ng net.accelbyte.sdk.cli.Main challenge adminGetUserRewards \
    --namespace "$AB_NAMESPACE" \
    --userId 'za461cth' \
    --limit '14' \
    --offset '4' \
    --sortBy 'yCmG7P2x' \
    --status 'CLAIMED' \
    > test.out 2>&1
eval_tap $? 16 'AdminGetUserRewards' test.out

#- 17 GetChallenges
./ng net.accelbyte.sdk.cli.Main challenge getChallenges \
    --namespace "$AB_NAMESPACE" \
    --limit '36' \
    --offset '8' \
    --sortBy 'w5cQiFI6' \
    --status 'RETIRED' \
    > test.out 2>&1
eval_tap $? 17 'GetChallenges' test.out

#- 18 PublicGetScheduledGoals
./ng net.accelbyte.sdk.cli.Main challenge publicGetScheduledGoals \
    --challengeCode 'TQJDra6R' \
    --namespace "$AB_NAMESPACE" \
    --limit '21' \
    --offset '53' \
    --tags '96SUyvAD,MUGxzEh9,eCQgfTxE' \
    > test.out 2>&1
eval_tap $? 18 'PublicGetScheduledGoals' test.out

#- 19 EvaluateMyProgress
./ng net.accelbyte.sdk.cli.Main challenge evaluateMyProgress \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 19 'EvaluateMyProgress' test.out

#- 20 PublicGetUserProgression
./ng net.accelbyte.sdk.cli.Main challenge publicGetUserProgression \
    --challengeCode 'aQFPsLRF' \
    --namespace "$AB_NAMESPACE" \
    --goalCode 'ovkfoNYE' \
    --limit '66' \
    --offset '69' \
    --tags 'Y67eWcII,dz3ZcAnt,m6ntqqAB' \
    > test.out 2>&1
eval_tap $? 20 'PublicGetUserProgression' test.out

#- 21 PublicGetUserRewards
./ng net.accelbyte.sdk.cli.Main challenge publicGetUserRewards \
    --namespace "$AB_NAMESPACE" \
    --limit '100' \
    --offset '39' \
    --sortBy '9eBO2fqQ' \
    --status 'UNCLAIMED' \
    > test.out 2>&1
eval_tap $? 21 'PublicGetUserRewards' test.out

#- 22 PublicClaimUserRewards
./ng net.accelbyte.sdk.cli.Main challenge publicClaimUserRewards \
    --namespace "$AB_NAMESPACE" \
    --body '{"rewardIDs": ["INHXABxd", "cOWbfgjo", "qlHqjNX4"]}' \
    > test.out 2>&1
eval_tap $? 22 'PublicClaimUserRewards' test.out


rm -f "tmp.dat"

exit $EXIT_CODE