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

#- 2 GetHealthcheckInfo
./ng net.accelbyte.sdk.cli.Main match2 getHealthcheckInfo \
    > test.out 2>&1
eval_tap $? 2 'GetHealthcheckInfo' test.out

#- 3 GetHealthcheckInfoV1
./ng net.accelbyte.sdk.cli.Main match2 getHealthcheckInfoV1 \
    > test.out 2>&1
eval_tap $? 3 'GetHealthcheckInfoV1' test.out

#- 4 AdminGetLogConfig
./ng net.accelbyte.sdk.cli.Main match2 adminGetLogConfig \
    > test.out 2>&1
eval_tap $? 4 'AdminGetLogConfig' test.out

#- 5 AdminPatchUpdateLogConfig
./ng net.accelbyte.sdk.cli.Main match2 adminPatchUpdateLogConfig \
    --body '{"logLevel": "panic"}' \
    > test.out 2>&1
eval_tap $? 5 'AdminPatchUpdateLogConfig' test.out

#- 6 AdminGetAllConfigV1
./ng net.accelbyte.sdk.cli.Main match2 adminGetAllConfigV1 \
    > test.out 2>&1
eval_tap $? 6 'AdminGetAllConfigV1' test.out

#- 7 AdminGetConfigV1
./ng net.accelbyte.sdk.cli.Main match2 adminGetConfigV1 \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 7 'AdminGetConfigV1' test.out

#- 8 AdminPatchConfigV1
./ng net.accelbyte.sdk.cli.Main match2 adminPatchConfigV1 \
    --namespace "$AB_NAMESPACE" \
    --body '{"crossPlatformNoCurrentPlatform": true, "extraPlatforms": ["h5V0Bt5Y", "ZdZVMaEM", "OPocyPbl"], "matchAnyCommon": true, "platformGroup": {"lK1nAMX3": ["l99V3Y8u", "10Utvi5f", "ll6smzUI"], "1z1D6GUq": ["fbK8vTeO", "lSk6bXMt", "mhxH30z7"], "bE2pOJhe": ["sIRWcZl3", "YVrAlG3M", "Na9knFNu"]}}' \
    > test.out 2>&1
eval_tap $? 8 'AdminPatchConfigV1' test.out

#- 9 EnvironmentVariableList
./ng net.accelbyte.sdk.cli.Main match2 environmentVariableList \
    > test.out 2>&1
eval_tap $? 9 'EnvironmentVariableList' test.out

#- 10 AdminQueryBackfill
./ng net.accelbyte.sdk.cli.Main match2 adminQueryBackfill \
    --namespace "$AB_NAMESPACE" \
    --fromTime '1999-12-06T00:00:00Z' \
    --isActive  \
    --limit '76' \
    --matchPool 'WwSWOirS' \
    --offset '61' \
    --playerID 'MW902L5M' \
    --region 'wnCUxj5r' \
    --sessionID 'yL3tEYGb' \
    --toTime '1994-06-11T00:00:00Z' \
    > test.out 2>&1
eval_tap $? 10 'AdminQueryBackfill' test.out

#- 11 CreateBackfill
./ng net.accelbyte.sdk.cli.Main match2 createBackfill \
    --namespace "$AB_NAMESPACE" \
    --body '{"matchPool": "uAOm1gAR", "sessionId": "rXVF6zNf"}' \
    > test.out 2>&1
eval_tap $? 11 'CreateBackfill' test.out

#- 12 GetBackfillProposal
./ng net.accelbyte.sdk.cli.Main match2 getBackfillProposal \
    --namespace "$AB_NAMESPACE" \
    --sessionID 'D5MrHq1Y' \
    > test.out 2>&1
eval_tap $? 12 'GetBackfillProposal' test.out

#- 13 GetBackfill
./ng net.accelbyte.sdk.cli.Main match2 getBackfill \
    --backfillID 'LlqlnklI' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 13 'GetBackfill' test.out

#- 14 DeleteBackfill
./ng net.accelbyte.sdk.cli.Main match2 deleteBackfill \
    --backfillID '8g6GJTLm' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 14 'DeleteBackfill' test.out

#- 15 AcceptBackfill
./ng net.accelbyte.sdk.cli.Main match2 acceptBackfill \
    --backfillID '0dpPfTZL' \
    --namespace "$AB_NAMESPACE" \
    --body '{"acceptedTicketIds": ["ffqGu9ru", "sP5nGI8w", "sWjBL0hK"], "proposalId": "vPvbErVi", "stop": true}' \
    > test.out 2>&1
eval_tap $? 15 'AcceptBackfill' test.out

#- 16 RejectBackfill
./ng net.accelbyte.sdk.cli.Main match2 rejectBackfill \
    --backfillID 'ZQ22kbQ2' \
    --namespace "$AB_NAMESPACE" \
    --body '{"proposalId": "wlBuUGgq", "stop": true}' \
    > test.out 2>&1
eval_tap $? 16 'RejectBackfill' test.out

#- 17 MatchFunctionList
./ng net.accelbyte.sdk.cli.Main match2 matchFunctionList \
    --namespace "$AB_NAMESPACE" \
    --limit '58' \
    --offset '9' \
    > test.out 2>&1
eval_tap $? 17 'MatchFunctionList' test.out

#- 18 CreateMatchFunction
./ng net.accelbyte.sdk.cli.Main match2 createMatchFunction \
    --namespace "$AB_NAMESPACE" \
    --body '{"match_function": "2XwMoOwD", "serviceAppName": "pgIHLazV", "url": "V0xXpCWo"}' \
    > test.out 2>&1
eval_tap $? 18 'CreateMatchFunction' test.out

#- 19 MatchFunctionGet
./ng net.accelbyte.sdk.cli.Main match2 matchFunctionGet \
    --name '60xZHQ9O' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 19 'MatchFunctionGet' test.out

#- 20 UpdateMatchFunction
./ng net.accelbyte.sdk.cli.Main match2 updateMatchFunction \
    --name 'GeFrFStl' \
    --namespace "$AB_NAMESPACE" \
    --body '{"match_function": "6HhYeA4K", "serviceAppName": "Z1LKBQZ6", "url": "6fliTU1l"}' \
    > test.out 2>&1
eval_tap $? 20 'UpdateMatchFunction' test.out

#- 21 DeleteMatchFunction
./ng net.accelbyte.sdk.cli.Main match2 deleteMatchFunction \
    --name '0VBVk4Bd' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 21 'DeleteMatchFunction' test.out

#- 22 MatchPoolList
./ng net.accelbyte.sdk.cli.Main match2 matchPoolList \
    --namespace "$AB_NAMESPACE" \
    --limit '87' \
    --name 'CwFfjeVt' \
    --offset '6' \
    > test.out 2>&1
eval_tap $? 22 'MatchPoolList' test.out

#- 23 CreateMatchPool
./ng net.accelbyte.sdk.cli.Main match2 createMatchPool \
    --namespace "$AB_NAMESPACE" \
    --body '{"auto_accept_backfill_proposal": true, "backfill_proposal_expiration_seconds": 46, "backfill_ticket_expiration_seconds": 77, "best_latency_calculation_method": "2vxUGYGE", "crossplay_disabled": false, "match_function": "hHePuORm", "match_function_override": {"backfill_matches": "0jFKA2DV", "enrichment": ["qMKamWxP", "B4ct1O4L", "FEkywbGf"], "make_matches": "FdXWcdRc", "stat_codes": ["p0ANLYSq", "NAkKqBfX", "1q2WaKsb"], "validation": ["IXS05mgY", "2yk5BcTX", "ylRWoyLo"]}, "name": "dysKbWh4", "platform_group_enabled": false, "rule_set": "GN9M1eA8", "session_template": "Dc50iqzk", "ticket_expiration_seconds": 96}' \
    > test.out 2>&1
eval_tap $? 23 'CreateMatchPool' test.out

#- 24 MatchPoolDetails
./ng net.accelbyte.sdk.cli.Main match2 matchPoolDetails \
    --namespace "$AB_NAMESPACE" \
    --pool 'DbV3PpZb' \
    > test.out 2>&1
eval_tap $? 24 'MatchPoolDetails' test.out

#- 25 UpdateMatchPool
./ng net.accelbyte.sdk.cli.Main match2 updateMatchPool \
    --namespace "$AB_NAMESPACE" \
    --pool 'xQYYvnSy' \
    --body '{"auto_accept_backfill_proposal": false, "backfill_proposal_expiration_seconds": 62, "backfill_ticket_expiration_seconds": 31, "best_latency_calculation_method": "ypj7MY1r", "crossplay_disabled": true, "match_function": "HmiYRfAX", "match_function_override": {"backfill_matches": "7jF2mauH", "enrichment": ["yrjEmpqH", "5HUtazMT", "1isQV9oc"], "make_matches": "TtwgtZD0", "stat_codes": ["2AYdZkqf", "pZTU9Lnu", "7FMK4xy9"], "validation": ["QletALQc", "xkhm1SLs", "y990Bjvz"]}, "platform_group_enabled": false, "rule_set": "2874vcx1", "session_template": "LEXu3e4p", "ticket_expiration_seconds": 94}' \
    > test.out 2>&1
eval_tap $? 25 'UpdateMatchPool' test.out

#- 26 DeleteMatchPool
./ng net.accelbyte.sdk.cli.Main match2 deleteMatchPool \
    --namespace "$AB_NAMESPACE" \
    --pool 'b5CYykTi' \
    > test.out 2>&1
eval_tap $? 26 'DeleteMatchPool' test.out

#- 27 MatchPoolMetric
./ng net.accelbyte.sdk.cli.Main match2 matchPoolMetric \
    --namespace "$AB_NAMESPACE" \
    --pool 'uvK6w3Df' \
    > test.out 2>&1
eval_tap $? 27 'MatchPoolMetric' test.out

#- 28 PostMatchErrorMetric
./ng net.accelbyte.sdk.cli.Main match2 postMatchErrorMetric \
    --namespace "$AB_NAMESPACE" \
    --pool 'AauZmROd' \
    --body '{"type": "getExternalDS"}' \
    > test.out 2>&1
eval_tap $? 28 'PostMatchErrorMetric' test.out

#- 29 GetPlayerMetric
./ng net.accelbyte.sdk.cli.Main match2 getPlayerMetric \
    --namespace "$AB_NAMESPACE" \
    --pool 'p9xqwwOu' \
    > test.out 2>&1
eval_tap $? 29 'GetPlayerMetric' test.out

#- 30 AdminGetMatchPoolTickets
./ng net.accelbyte.sdk.cli.Main match2 adminGetMatchPoolTickets \
    --namespace "$AB_NAMESPACE" \
    --pool 'D7KARcb3' \
    --limit '12' \
    --offset '0' \
    > test.out 2>&1
eval_tap $? 30 'AdminGetMatchPoolTickets' test.out

#- 31 CreateMatchTicket
./ng net.accelbyte.sdk.cli.Main match2 createMatchTicket \
    --namespace "$AB_NAMESPACE" \
    --body '{"attributes": {"OYWA8epP": {}, "saW8FYnH": {}, "xN2d4Lt5": {}}, "excludedSessions": ["eCfnkNmT", "zJBBbwVC", "GW2uGT4H"], "latencies": {"frJhR6Wo": 9, "OJoprb4m": 22, "lmdgWKb1": 64}, "matchPool": "vwWmE4aI", "sessionID": "bJUOOSfc", "storage": {"Horz7QJU": {}, "4p4sTHXI": {}, "yASNq6WL": {}}}' \
    > test.out 2>&1
eval_tap $? 31 'CreateMatchTicket' test.out

#- 32 GetMyMatchTickets
./ng net.accelbyte.sdk.cli.Main match2 getMyMatchTickets \
    --namespace "$AB_NAMESPACE" \
    --limit '82' \
    --matchPool 'B11wJEDw' \
    --offset '64' \
    > test.out 2>&1
eval_tap $? 32 'GetMyMatchTickets' test.out

#- 33 MatchTicketDetails
./ng net.accelbyte.sdk.cli.Main match2 matchTicketDetails \
    --namespace "$AB_NAMESPACE" \
    --ticketid 'ryJ6JCn3' \
    > test.out 2>&1
eval_tap $? 33 'MatchTicketDetails' test.out

#- 34 DeleteMatchTicket
./ng net.accelbyte.sdk.cli.Main match2 deleteMatchTicket \
    --namespace "$AB_NAMESPACE" \
    --ticketid 'iwVPDbKC' \
    > test.out 2>&1
eval_tap $? 34 'DeleteMatchTicket' test.out

#- 35 RuleSetList
./ng net.accelbyte.sdk.cli.Main match2 ruleSetList \
    --namespace "$AB_NAMESPACE" \
    --limit '38' \
    --name 'hiYou9IK' \
    --offset '84' \
    > test.out 2>&1
eval_tap $? 35 'RuleSetList' test.out

#- 36 CreateRuleSet
./ng net.accelbyte.sdk.cli.Main match2 createRuleSet \
    --namespace "$AB_NAMESPACE" \
    --body '{"data": {"co9CYRFO": {}, "7W8iIksI": {}, "1aJRqfGH": {}}, "enable_custom_match_function": false, "name": "KRLBr2Tn"}' \
    > test.out 2>&1
eval_tap $? 36 'CreateRuleSet' test.out

#- 37 RuleSetDetails
./ng net.accelbyte.sdk.cli.Main match2 ruleSetDetails \
    --namespace "$AB_NAMESPACE" \
    --ruleset 'Ntj1GgxB' \
    > test.out 2>&1
eval_tap $? 37 'RuleSetDetails' test.out

#- 38 UpdateRuleSet
./ng net.accelbyte.sdk.cli.Main match2 updateRuleSet \
    --namespace "$AB_NAMESPACE" \
    --ruleset 'DM4ksD2W' \
    --body '{"data": {"dZMSARTl": {}, "uezjUTFP": {}, "1Eqy1ASG": {}}, "enable_custom_match_function": false, "name": "utvKi7yq"}' \
    > test.out 2>&1
eval_tap $? 38 'UpdateRuleSet' test.out

#- 39 DeleteRuleSet
./ng net.accelbyte.sdk.cli.Main match2 deleteRuleSet \
    --namespace "$AB_NAMESPACE" \
    --ruleset 'sb2AXL8Y' \
    > test.out 2>&1
eval_tap $? 39 'DeleteRuleSet' test.out

#- 40 PublicGetPlayerMetric
./ng net.accelbyte.sdk.cli.Main match2 publicGetPlayerMetric \
    --namespace "$AB_NAMESPACE" \
    --pool 'jSd9Rl1F' \
    > test.out 2>&1
eval_tap $? 40 'PublicGetPlayerMetric' test.out

#- 41 VersionCheckHandler
./ng net.accelbyte.sdk.cli.Main match2 versionCheckHandler \
    > test.out 2>&1
eval_tap $? 41 'VersionCheckHandler' test.out


rm -f "tmp.dat"

exit $EXIT_CODE