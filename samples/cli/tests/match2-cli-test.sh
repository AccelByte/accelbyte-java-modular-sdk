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
echo "1..32"

#- 1 Login
./ng net.accelbyte.sdk.cli.Main loginClient \
    > test.out 2>&1
eval_tap $? 1 'Login' test.out

if [ $EXIT_CODE -ne 0 ]; then
  echo "Bail out! Login failed."
  exit $EXIT_CODE
fi

touch "tmp.dat"

#- 2 GetHealthcheckInfo
./ng net.accelbyte.sdk.cli.Main match2 getHealthcheckInfo \
    > test.out 2>&1
eval_tap $? 2 'GetHealthcheckInfo' test.out

#- 3 GetHealthcheckInfoV1
./ng net.accelbyte.sdk.cli.Main match2 getHealthcheckInfoV1 \
    > test.out 2>&1
eval_tap $? 3 'GetHealthcheckInfoV1' test.out

#- 4 EnvironmentVariableList
./ng net.accelbyte.sdk.cli.Main match2 environmentVariableList \
    > test.out 2>&1
eval_tap $? 4 'EnvironmentVariableList' test.out

#- 5 CreateBackfill
./ng net.accelbyte.sdk.cli.Main match2 createBackfill \
    --namespace "$AB_NAMESPACE" \
    --body '{"matchPool": "MvPqGXuE", "sessionId": "zASNf63r"}' \
    > test.out 2>&1
eval_tap $? 5 'CreateBackfill' test.out

#- 6 GetBackfillProposal
./ng net.accelbyte.sdk.cli.Main match2 getBackfillProposal \
    --namespace "$AB_NAMESPACE" \
    --sessionID '0mgHInLQ' \
    > test.out 2>&1
eval_tap $? 6 'GetBackfillProposal' test.out

#- 7 GetBackfill
./ng net.accelbyte.sdk.cli.Main match2 getBackfill \
    --backfillID 'yLDgi8jL' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 7 'GetBackfill' test.out

#- 8 DeleteBackfill
./ng net.accelbyte.sdk.cli.Main match2 deleteBackfill \
    --backfillID 'gxc2DKkl' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 8 'DeleteBackfill' test.out

#- 9 AcceptBackfill
./ng net.accelbyte.sdk.cli.Main match2 acceptBackfill \
    --backfillID 'j4n6YPMt' \
    --namespace "$AB_NAMESPACE" \
    --body '{"proposalId": "K6DIT5ib", "stop": true}' \
    > test.out 2>&1
eval_tap $? 9 'AcceptBackfill' test.out

#- 10 RejectBackfill
./ng net.accelbyte.sdk.cli.Main match2 rejectBackfill \
    --backfillID 'xMU836Uu' \
    --namespace "$AB_NAMESPACE" \
    --body '{"proposalId": "q3JI4utL", "stop": true}' \
    > test.out 2>&1
eval_tap $? 10 'RejectBackfill' test.out

#- 11 MatchFunctionList
./ng net.accelbyte.sdk.cli.Main match2 matchFunctionList \
    --namespace "$AB_NAMESPACE" \
    --limit '17' \
    --offset '32' \
    > test.out 2>&1
eval_tap $? 11 'MatchFunctionList' test.out

#- 12 CreateMatchFunction
./ng net.accelbyte.sdk.cli.Main match2 createMatchFunction \
    --namespace "$AB_NAMESPACE" \
    --body '{"match_function": "yn4nLaVY", "serviceAppName": "OxCZmOhz", "url": "5aQIEQKO"}' \
    > test.out 2>&1
eval_tap $? 12 'CreateMatchFunction' test.out

#- 13 UpdateMatchFunction
./ng net.accelbyte.sdk.cli.Main match2 updateMatchFunction \
    --name '6QKcB66n' \
    --namespace "$AB_NAMESPACE" \
    --body '{"match_function": "1TYRrmR2", "serviceAppName": "xbJxQx9g", "url": "NhkNl9am"}' \
    > test.out 2>&1
eval_tap $? 13 'UpdateMatchFunction' test.out

#- 14 DeleteMatchFunction
./ng net.accelbyte.sdk.cli.Main match2 deleteMatchFunction \
    --name 'MHCy6VsV' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 14 'DeleteMatchFunction' test.out

#- 15 MatchPoolList
./ng net.accelbyte.sdk.cli.Main match2 matchPoolList \
    --namespace "$AB_NAMESPACE" \
    --limit '94' \
    --name 'ClhGdxBI' \
    --offset '74' \
    > test.out 2>&1
eval_tap $? 15 'MatchPoolList' test.out

#- 16 CreateMatchPool
./ng net.accelbyte.sdk.cli.Main match2 createMatchPool \
    --namespace "$AB_NAMESPACE" \
    --body '{"auto_accept_backfill_proposal": true, "backfill_proposal_expiration_seconds": 4, "backfill_ticket_expiration_seconds": 93, "match_function": "ALHTPcIm", "match_function_override": {"backfill_matches": "eqo3MOJi", "enrichment": ["Rqi0KVbD", "b0tETpX9", "7hGzbOKt"], "make_matches": "Ed58Ds1b", "stat_codes": ["iCIUO20Y", "eEHyBtCQ", "Ze5rITkU"], "validation": ["vo6ijaF2", "X0hNG482", "HXeab7LR"]}, "name": "SN06wnvU", "rule_set": "VTjiXADY", "session_template": "dgjR6Vru", "ticket_expiration_seconds": 58}' \
    > test.out 2>&1
eval_tap $? 16 'CreateMatchPool' test.out

#- 17 MatchPoolDetails
./ng net.accelbyte.sdk.cli.Main match2 matchPoolDetails \
    --namespace "$AB_NAMESPACE" \
    --pool 'WHd3apNf' \
    > test.out 2>&1
eval_tap $? 17 'MatchPoolDetails' test.out

#- 18 UpdateMatchPool
./ng net.accelbyte.sdk.cli.Main match2 updateMatchPool \
    --namespace "$AB_NAMESPACE" \
    --pool 'wHumjeJl' \
    --body '{"auto_accept_backfill_proposal": true, "backfill_proposal_expiration_seconds": 7, "backfill_ticket_expiration_seconds": 59, "match_function": "lYBrBz8x", "match_function_override": {"backfill_matches": "C6ZM9XUB", "enrichment": ["QV53gsGL", "Okqg601A", "rwh1hJ5X"], "make_matches": "MuzSjzLJ", "stat_codes": ["ORjCNdgk", "xXHVqZDj", "YaledrSW"], "validation": ["TWqQORfn", "BS3c0ccC", "8ruYanEY"]}, "rule_set": "7vDg3Fo9", "session_template": "bj1V9iOH", "ticket_expiration_seconds": 24}' \
    > test.out 2>&1
eval_tap $? 18 'UpdateMatchPool' test.out

#- 19 DeleteMatchPool
./ng net.accelbyte.sdk.cli.Main match2 deleteMatchPool \
    --namespace "$AB_NAMESPACE" \
    --pool 'G4FWh7QI' \
    > test.out 2>&1
eval_tap $? 19 'DeleteMatchPool' test.out

#- 20 MatchPoolMetric
./ng net.accelbyte.sdk.cli.Main match2 matchPoolMetric \
    --namespace "$AB_NAMESPACE" \
    --pool 'Iiw6mDmL' \
    > test.out 2>&1
eval_tap $? 20 'MatchPoolMetric' test.out

#- 21 GetPlayerMetric
./ng net.accelbyte.sdk.cli.Main match2 getPlayerMetric \
    --namespace "$AB_NAMESPACE" \
    --pool 'lr6YOM4G' \
    > test.out 2>&1
eval_tap $? 21 'GetPlayerMetric' test.out

#- 22 AdminGetMatchPoolTickets
./ng net.accelbyte.sdk.cli.Main match2 adminGetMatchPoolTickets \
    --namespace "$AB_NAMESPACE" \
    --pool '1ojl12fS' \
    --limit '86' \
    --offset '65' \
    > test.out 2>&1
eval_tap $? 22 'AdminGetMatchPoolTickets' test.out

#- 23 CreateMatchTicket
./ng net.accelbyte.sdk.cli.Main match2 createMatchTicket \
    --namespace "$AB_NAMESPACE" \
    --body '{"attributes": {"Q7f9Q7JH": {}, "7giZY7NC": {}, "DUGiiYa2": {}}, "latencies": {"FdVAEpZC": 76, "7P0Brk16": 52, "euaRwHZC": 78}, "matchPool": "4sAHPsEB", "sessionID": "SA4vxZcH"}' \
    > test.out 2>&1
eval_tap $? 23 'CreateMatchTicket' test.out

#- 24 GetMyMatchTickets
./ng net.accelbyte.sdk.cli.Main match2 getMyMatchTickets \
    --namespace "$AB_NAMESPACE" \
    --limit '89' \
    --matchPool 'HYLaTslP' \
    --offset '46' \
    > test.out 2>&1
eval_tap $? 24 'GetMyMatchTickets' test.out

#- 25 MatchTicketDetails
./ng net.accelbyte.sdk.cli.Main match2 matchTicketDetails \
    --namespace "$AB_NAMESPACE" \
    --ticketid 'h6ca5Dk5' \
    > test.out 2>&1
eval_tap $? 25 'MatchTicketDetails' test.out

#- 26 DeleteMatchTicket
./ng net.accelbyte.sdk.cli.Main match2 deleteMatchTicket \
    --namespace "$AB_NAMESPACE" \
    --ticketid 'r0gkp1Ci' \
    > test.out 2>&1
eval_tap $? 26 'DeleteMatchTicket' test.out

#- 27 RuleSetList
./ng net.accelbyte.sdk.cli.Main match2 ruleSetList \
    --namespace "$AB_NAMESPACE" \
    --limit '83' \
    --name 'zBztW3sl' \
    --offset '62' \
    > test.out 2>&1
eval_tap $? 27 'RuleSetList' test.out

#- 28 CreateRuleSet
./ng net.accelbyte.sdk.cli.Main match2 createRuleSet \
    --namespace "$AB_NAMESPACE" \
    --body '{"data": {"CFtMfMps": {}, "dF9n0EvI": {}, "QRKMAcrG": {}}, "enable_custom_match_function": false, "name": "6cQaxO8Y"}' \
    > test.out 2>&1
eval_tap $? 28 'CreateRuleSet' test.out

#- 29 RuleSetDetails
./ng net.accelbyte.sdk.cli.Main match2 ruleSetDetails \
    --namespace "$AB_NAMESPACE" \
    --ruleset 'pBPiVeRU' \
    > test.out 2>&1
eval_tap $? 29 'RuleSetDetails' test.out

#- 30 UpdateRuleSet
./ng net.accelbyte.sdk.cli.Main match2 updateRuleSet \
    --namespace "$AB_NAMESPACE" \
    --ruleset 'PdazzEgd' \
    --body '{"data": {"s23qylXQ": {}, "Fje82SW3": {}, "Jmfmvudq": {}}, "enable_custom_match_function": false, "name": "kTmf9D6h"}' \
    > test.out 2>&1
eval_tap $? 30 'UpdateRuleSet' test.out

#- 31 DeleteRuleSet
./ng net.accelbyte.sdk.cli.Main match2 deleteRuleSet \
    --namespace "$AB_NAMESPACE" \
    --ruleset '8iRQcz6z' \
    > test.out 2>&1
eval_tap $? 31 'DeleteRuleSet' test.out

#- 32 VersionCheckHandler
./ng net.accelbyte.sdk.cli.Main match2 versionCheckHandler \
    > test.out 2>&1
eval_tap $? 32 'VersionCheckHandler' test.out


rm -f "tmp.dat"

exit $EXIT_CODE