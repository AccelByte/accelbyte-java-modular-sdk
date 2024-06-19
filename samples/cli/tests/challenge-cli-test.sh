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
echo "1..24"

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
    --limit '63' \
    --offset '21' \
    --sortBy 'oUzm2hdG' \
    --status 'TIED' \
    > test.out 2>&1
eval_tap $? 2 'AdminGetChallenges' test.out

#- 3 AdminCreateChallenge
./ng net.accelbyte.sdk.cli.Main challenge adminCreateChallenge \
    --namespace "$AB_NAMESPACE" \
    --body '{"activeGoalsPerRotation": 52, "assignmentRule": "RANDOMIZED", "code": "j9TxbgwW", "description": "WobtIyqf", "endAfter": 81, "endDate": "1997-08-30T00:00:00Z", "goalsVisibility": "PERIODONLY", "name": "Y60sJAnI", "repeatAfter": 41, "resetConfig": {"resetDate": 94, "resetDay": 59, "resetTime": "WLd1PH4p"}, "rotation": "MONTHLY", "startDate": "1987-01-14T00:00:00Z"}' \
    > test.out 2>&1
eval_tap $? 3 'AdminCreateChallenge' test.out

#- 4 AdminGetChallenge
./ng net.accelbyte.sdk.cli.Main challenge adminGetChallenge \
    --challengeCode '7EPcZqSP' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 4 'AdminGetChallenge' test.out

#- 5 AdminUpdateChallenge
./ng net.accelbyte.sdk.cli.Main challenge adminUpdateChallenge \
    --challengeCode 'DPaJ7xO4' \
    --namespace "$AB_NAMESPACE" \
    --body '{"activeGoalsPerRotation": 36, "assignmentRule": "RANDOMIZED", "description": "Q7kRenMb", "endAfter": 64, "endDate": "1982-02-13T00:00:00Z", "goalsVisibility": "PERIODONLY", "name": "ifMT42sY", "repeatAfter": 69, "resetConfig": {"resetDate": 6, "resetDay": 46, "resetTime": "y7ZmlHxu"}, "rotation": "MONTHLY", "startDate": "1989-02-03T00:00:00Z"}' \
    > test.out 2>&1
eval_tap $? 5 'AdminUpdateChallenge' test.out

#- 6 AdminDeleteChallenge
./ng net.accelbyte.sdk.cli.Main challenge adminDeleteChallenge \
    --challengeCode 'FkK88Vrg' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 6 'AdminDeleteChallenge' test.out

#- 7 AdminGetGoals
./ng net.accelbyte.sdk.cli.Main challenge adminGetGoals \
    --challengeCode 'RGL4I2Ux' \
    --namespace "$AB_NAMESPACE" \
    --limit '93' \
    --offset '30' \
    --sortBy 'GZj4qZPq' \
    > test.out 2>&1
eval_tap $? 7 'AdminGetGoals' test.out

#- 8 AdminCreateGoal
./ng net.accelbyte.sdk.cli.Main challenge adminCreateGoal \
    --challengeCode '2VJy4XUO' \
    --namespace "$AB_NAMESPACE" \
    --body '{"code": "h1wBtVZ4", "description": "v3m2P6WH", "isActive": false, "name": "LnTW4hEB", "requirementGroups": [{"operator": "AND", "predicates": [{"matcher": "EQUAL", "parameterName": "I14EiVLV", "parameterType": "USERACCOUNT", "statCycleId": "Nr6EJyb3", "targetValue": 0.8466470941498943}, {"matcher": "EQUAL", "parameterName": "WLJb9bIy", "parameterType": "ENTITLEMENT", "statCycleId": "8vg8qkUk", "targetValue": 0.49921347016401674}, {"matcher": "LESS_THAN_EQUAL", "parameterName": "7LHHhyOg", "parameterType": "ENTITLEMENT", "statCycleId": "QRCyGIT1", "targetValue": 0.5171068954990146}]}, {"operator": "AND", "predicates": [{"matcher": "EQUAL", "parameterName": "ygm9yMP2", "parameterType": "USERACCOUNT", "statCycleId": "ZD5csF7i", "targetValue": 0.473417154989773}, {"matcher": "LESS_THAN", "parameterName": "78RHhQp5", "parameterType": "STATISTIC_CYCLE", "statCycleId": "861NRKFV", "targetValue": 0.6117489271256386}, {"matcher": "GREATER_THAN_EQUAL", "parameterName": "igEn7xBe", "parameterType": "ENTITLEMENT", "statCycleId": "AXWR5kNt", "targetValue": 0.8084729478906469}]}, {"operator": "AND", "predicates": [{"matcher": "LESS_THAN_EQUAL", "parameterName": "MJb6OB1i", "parameterType": "USERACCOUNT", "statCycleId": "BCV5IaU5", "targetValue": 0.21813310302326128}, {"matcher": "GREATER_THAN", "parameterName": "LlaV4RLX", "parameterType": "ENTITLEMENT", "statCycleId": "mDbBY45j", "targetValue": 0.08678229970493734}, {"matcher": "EQUAL", "parameterName": "ia4ujLY0", "parameterType": "ENTITLEMENT", "statCycleId": "1rKZ9hqA", "targetValue": 0.944266086731881}]}], "rewards": [{"itemId": "abk1xd5f", "itemName": "K1G2rw7p", "qty": 0.4019388275659229, "type": "ENTITLEMENT"}, {"itemId": "hNoRoVLw", "itemName": "xjJqWOyb", "qty": 0.18480839865918108, "type": "ENTITLEMENT"}, {"itemId": "zFuHQtWQ", "itemName": "qztuSPUG", "qty": 0.20637757531120526, "type": "STATISTIC"}], "schedule": {"endTime": "1982-12-06T00:00:00Z", "order": 13, "startTime": "1972-06-17T00:00:00Z"}, "tags": ["2DEM5knu", "jbDK3jWd", "eeBWiJVS"]}' \
    > test.out 2>&1
eval_tap $? 8 'AdminCreateGoal' test.out

#- 9 AdminGetGoal
./ng net.accelbyte.sdk.cli.Main challenge adminGetGoal \
    --challengeCode 'tN7ZaxlR' \
    --code 'vbpgkUg9' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 9 'AdminGetGoal' test.out

#- 10 AdminUpdateGoals
./ng net.accelbyte.sdk.cli.Main challenge adminUpdateGoals \
    --challengeCode 'xDtJCct9' \
    --code 'mRHscXj6' \
    --namespace "$AB_NAMESPACE" \
    --body '{"description": "sDUX2hOh", "isActive": true, "name": "6SE52X4u", "requirementGroups": [{"operator": "AND", "predicates": [{"matcher": "EQUAL", "parameterName": "8goqkOjO", "parameterType": "STATISTIC_CYCLE", "statCycleId": "637C23Nn", "targetValue": 0.8522240727680684}, {"matcher": "LESS_THAN", "parameterName": "ArZYLPiC", "parameterType": "STATISTIC", "statCycleId": "K8Hj8SLi", "targetValue": 0.30594764444416045}, {"matcher": "EQUAL", "parameterName": "eYx4HLA1", "parameterType": "STATISTIC_CYCLE", "statCycleId": "MTzfs1z0", "targetValue": 0.07838839033716927}]}, {"operator": "AND", "predicates": [{"matcher": "LESS_THAN", "parameterName": "uHLnUWv1", "parameterType": "USERACCOUNT", "statCycleId": "uPbFbJXR", "targetValue": 0.37418360173434806}, {"matcher": "GREATER_THAN", "parameterName": "Fh3sLRle", "parameterType": "ENTITLEMENT", "statCycleId": "izW9kHzs", "targetValue": 0.4543875434225637}, {"matcher": "GREATER_THAN", "parameterName": "FJROZ4Nh", "parameterType": "ENTITLEMENT", "statCycleId": "kmp0nxv2", "targetValue": 0.13644597519745327}]}, {"operator": "AND", "predicates": [{"matcher": "LESS_THAN", "parameterName": "CRWI25g7", "parameterType": "STATISTIC", "statCycleId": "KHFXUI1H", "targetValue": 0.32897601019292255}, {"matcher": "GREATER_THAN_EQUAL", "parameterName": "uZPqoAo0", "parameterType": "ENTITLEMENT", "statCycleId": "qWV5A9tH", "targetValue": 0.6271707720213694}, {"matcher": "GREATER_THAN_EQUAL", "parameterName": "DuT1WgZw", "parameterType": "ACHIEVEMENT", "statCycleId": "ZGQSP61I", "targetValue": 0.5423566758574004}]}], "rewards": [{"itemId": "rFJqFrRm", "itemName": "jKFipcdQ", "qty": 0.19206294870444862, "type": "STATISTIC"}, {"itemId": "mZFW8PbB", "itemName": "739zFUHf", "qty": 0.30853837087041636, "type": "STATISTIC"}, {"itemId": "qbNAIFXX", "itemName": "fPOAyXud", "qty": 0.0882131485477129, "type": "STATISTIC"}], "schedule": {"endTime": "1986-07-06T00:00:00Z", "order": 88, "startTime": "1976-08-22T00:00:00Z"}, "tags": ["IXwCfraU", "BA1ApjWS", "nD2hutg7"]}' \
    > test.out 2>&1
eval_tap $? 10 'AdminUpdateGoals' test.out

#- 11 AdminDeleteGoal
./ng net.accelbyte.sdk.cli.Main challenge adminDeleteGoal \
    --challengeCode 'PXwl7hNP' \
    --code 'WdKX7DWE' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 11 'AdminDeleteGoal' test.out

#- 12 AdminGetPeriods
./ng net.accelbyte.sdk.cli.Main challenge adminGetPeriods \
    --challengeCode 'xaQeUM00' \
    --namespace "$AB_NAMESPACE" \
    --limit '71' \
    --offset '49' \
    > test.out 2>&1
eval_tap $? 12 'AdminGetPeriods' test.out

#- 13 AdminRandomizeChallenge
./ng net.accelbyte.sdk.cli.Main challenge adminRandomizeChallenge \
    --challengeCode 'aLe9dYlI' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 13 'AdminRandomizeChallenge' test.out

#- 14 AdminDeleteTiedChallenge
./ng net.accelbyte.sdk.cli.Main challenge adminDeleteTiedChallenge \
    --challengeCode 'a0PYSKei' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 14 'AdminDeleteTiedChallenge' test.out

#- 15 AdminEvaluateProgress
./ng net.accelbyte.sdk.cli.Main challenge adminEvaluateProgress \
    --namespace "$AB_NAMESPACE" \
    --body '{"userIds": ["1wXikMC7", "VqVhC6Ry", "nQkeLagK"]}' \
    > test.out 2>&1
eval_tap $? 15 'AdminEvaluateProgress' test.out

#- 16 AdminClaimUsersRewards
./ng net.accelbyte.sdk.cli.Main challenge adminClaimUsersRewards \
    --namespace "$AB_NAMESPACE" \
    --body '[{"rewardIds": ["tkKM7tJL", "3zb4J7LP", "47btp93w"], "userId": "JenTAf0Q"}, {"rewardIds": ["b5fY4Uct", "mpYRxRrH", "4x69lblc"], "userId": "uUXpeqFK"}, {"rewardIds": ["AFB376vY", "xEXor8dJ", "XujmOSEh"], "userId": "ADRxQ5s1"}]' \
    > test.out 2>&1
eval_tap $? 16 'AdminClaimUsersRewards' test.out

#- 17 AdminGetUserRewards
./ng net.accelbyte.sdk.cli.Main challenge adminGetUserRewards \
    --namespace "$AB_NAMESPACE" \
    --userId '2Td46Mwz' \
    --limit '63' \
    --offset '60' \
    --sortBy 'dzhXkTNM' \
    --status 'UNCLAIMED' \
    > test.out 2>&1
eval_tap $? 17 'AdminGetUserRewards' test.out

#- 18 AdminClaimUserRewards
./ng net.accelbyte.sdk.cli.Main challenge adminClaimUserRewards \
    --namespace "$AB_NAMESPACE" \
    --userId 'ja5WQWHw' \
    --body '{"rewardIDs": ["dQrZLJ8E", "FhrIqoMF", "aiVwi0Ro"]}' \
    > test.out 2>&1
eval_tap $? 18 'AdminClaimUserRewards' test.out

#- 19 GetChallenges
./ng net.accelbyte.sdk.cli.Main challenge getChallenges \
    --namespace "$AB_NAMESPACE" \
    --limit '49' \
    --offset '69' \
    --sortBy 'iXhRLqeI' \
    --status 'RETIRED' \
    > test.out 2>&1
eval_tap $? 19 'GetChallenges' test.out

#- 20 PublicGetScheduledGoals
./ng net.accelbyte.sdk.cli.Main challenge publicGetScheduledGoals \
    --challengeCode 'sz5mhXT9' \
    --namespace "$AB_NAMESPACE" \
    --limit '51' \
    --offset '34' \
    --tags 'Qwt5qwez,6eYyg98r,PXSEKd1f' \
    > test.out 2>&1
eval_tap $? 20 'PublicGetScheduledGoals' test.out

#- 21 EvaluateMyProgress
./ng net.accelbyte.sdk.cli.Main challenge evaluateMyProgress \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 21 'EvaluateMyProgress' test.out

#- 22 PublicGetUserProgression
./ng net.accelbyte.sdk.cli.Main challenge publicGetUserProgression \
    --challengeCode 't3JiqBGI' \
    --namespace "$AB_NAMESPACE" \
    --goalCode '10E10nMS' \
    --limit '0' \
    --offset '34' \
    --tags 'SakRTGiA,P60dbETK,3LEuvvdA' \
    > test.out 2>&1
eval_tap $? 22 'PublicGetUserProgression' test.out

#- 23 PublicGetUserRewards
./ng net.accelbyte.sdk.cli.Main challenge publicGetUserRewards \
    --namespace "$AB_NAMESPACE" \
    --limit '72' \
    --offset '44' \
    --sortBy 'XpnOfLeV' \
    --status 'UNCLAIMED' \
    > test.out 2>&1
eval_tap $? 23 'PublicGetUserRewards' test.out

#- 24 PublicClaimUserRewards
./ng net.accelbyte.sdk.cli.Main challenge publicClaimUserRewards \
    --namespace "$AB_NAMESPACE" \
    --body '{"rewardIDs": ["tNLPqrZv", "Maxaozn6", "byFS4cem"]}' \
    > test.out 2>&1
eval_tap $? 24 'PublicClaimUserRewards' test.out


rm -f "tmp.dat"

exit $EXIT_CODE