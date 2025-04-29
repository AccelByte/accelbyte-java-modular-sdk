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
    --body '{"logLevel": "info"}' \
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
    --body '{"crossPlatformNoCurrentPlatform": false, "extraPlatforms": ["Mk8NKEwE", "gnhRpHUS", "nM1zlCAO"], "matchAnyCommon": true, "platformGroup": {"yFM9XVV4": ["anodKBTT", "mivBTNVy", "mmgDdiyS"], "zEnXspqx": ["rqPsGK9b", "QijeEgxg", "qJlaBz3g"], "lyv7sRQj": ["vC53Npbh", "o6qFPrLr", "tNanDGAy"]}}' \
    > test.out 2>&1
eval_tap $? 8 'AdminPatchConfigV1' test.out

#- 9 EnvironmentVariableList
./ng net.accelbyte.sdk.cli.Main match2 environmentVariableList \
    > test.out 2>&1
eval_tap $? 9 'EnvironmentVariableList' test.out

#- 10 AdminQueryBackfill
./ng net.accelbyte.sdk.cli.Main match2 adminQueryBackfill \
    --namespace "$AB_NAMESPACE" \
    --fromTime '1993-04-22T00:00:00Z' \
    --isActive  \
    --limit '81' \
    --matchPool 'XAC40oAt' \
    --offset '36' \
    --playerID 'OhaVF5gP' \
    --region 'Es6WX9YE' \
    --sessionID 'Vj5DaEsG' \
    --toTime '1999-09-08T00:00:00Z' \
    > test.out 2>&1
eval_tap $? 10 'AdminQueryBackfill' test.out

#- 11 CreateBackfill
./ng net.accelbyte.sdk.cli.Main match2 createBackfill \
    --namespace "$AB_NAMESPACE" \
    --body '{"matchPool": "nFLEO3aB", "sessionId": "QsLH5MFC"}' \
    > test.out 2>&1
eval_tap $? 11 'CreateBackfill' test.out

#- 12 GetBackfillProposal
./ng net.accelbyte.sdk.cli.Main match2 getBackfillProposal \
    --namespace "$AB_NAMESPACE" \
    --sessionID 'QUPtc8WH' \
    > test.out 2>&1
eval_tap $? 12 'GetBackfillProposal' test.out

#- 13 GetBackfill
./ng net.accelbyte.sdk.cli.Main match2 getBackfill \
    --backfillID 'a17ARXeK' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 13 'GetBackfill' test.out

#- 14 DeleteBackfill
./ng net.accelbyte.sdk.cli.Main match2 deleteBackfill \
    --backfillID 'gyBlNvLs' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 14 'DeleteBackfill' test.out

#- 15 AcceptBackfill
./ng net.accelbyte.sdk.cli.Main match2 acceptBackfill \
    --backfillID 'xrsEPAb1' \
    --namespace "$AB_NAMESPACE" \
    --body '{"acceptedTicketIds": ["KouKfodI", "J0O8Z97s", "vU1Ecpt4"], "proposalId": "CyKsL3qx", "stop": false}' \
    > test.out 2>&1
eval_tap $? 15 'AcceptBackfill' test.out

#- 16 RejectBackfill
./ng net.accelbyte.sdk.cli.Main match2 rejectBackfill \
    --backfillID 'txYk8LQw' \
    --namespace "$AB_NAMESPACE" \
    --body '{"proposalId": "E2UDuxqF", "stop": false}' \
    > test.out 2>&1
eval_tap $? 16 'RejectBackfill' test.out

#- 17 MatchFunctionList
./ng net.accelbyte.sdk.cli.Main match2 matchFunctionList \
    --namespace "$AB_NAMESPACE" \
    --limit '72' \
    --offset '68' \
    > test.out 2>&1
eval_tap $? 17 'MatchFunctionList' test.out

#- 18 CreateMatchFunction
./ng net.accelbyte.sdk.cli.Main match2 createMatchFunction \
    --namespace "$AB_NAMESPACE" \
    --body '{"match_function": "rNdB03fY", "serviceAppName": "YMZ9Gijo", "url": "DlUhcnFV"}' \
    > test.out 2>&1
eval_tap $? 18 'CreateMatchFunction' test.out

#- 19 MatchFunctionGet
./ng net.accelbyte.sdk.cli.Main match2 matchFunctionGet \
    --name 'NssjOMSp' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 19 'MatchFunctionGet' test.out

#- 20 UpdateMatchFunction
./ng net.accelbyte.sdk.cli.Main match2 updateMatchFunction \
    --name '1MQhDZdK' \
    --namespace "$AB_NAMESPACE" \
    --body '{"match_function": "24QwMeAh", "serviceAppName": "tZhyhqhE", "url": "DXXQfBtf"}' \
    > test.out 2>&1
eval_tap $? 20 'UpdateMatchFunction' test.out

#- 21 DeleteMatchFunction
./ng net.accelbyte.sdk.cli.Main match2 deleteMatchFunction \
    --name 'KRgZk6kb' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 21 'DeleteMatchFunction' test.out

#- 22 MatchPoolList
./ng net.accelbyte.sdk.cli.Main match2 matchPoolList \
    --namespace "$AB_NAMESPACE" \
    --limit '97' \
    --name 'RfruuwAV' \
    --offset '14' \
    > test.out 2>&1
eval_tap $? 22 'MatchPoolList' test.out

#- 23 CreateMatchPool
./ng net.accelbyte.sdk.cli.Main match2 createMatchPool \
    --namespace "$AB_NAMESPACE" \
    --body '{"auto_accept_backfill_proposal": true, "backfill_proposal_expiration_seconds": 31, "backfill_ticket_expiration_seconds": 18, "best_latency_calculation_method": "s8IXcKa8", "crossplay_disabled": true, "match_function": "zJO9V6vH", "match_function_override": {"backfill_matches": "mdphmZNW", "enrichment": ["IfHjV6Ka", "KXJ7tKsY", "iAjYvr34"], "make_matches": "VMJNmFai", "stat_codes": ["V78h7xqm", "zkyVYy0Z", "pAawL1Hl"], "validation": ["c43dbXaQ", "FOhHQcQw", "SdsFuFeA"]}, "name": "2wSFMQMW", "platform_group_enabled": false, "rule_set": "C8MKjD68", "session_template": "hHeQOHSA", "ticket_expiration_seconds": 72}' \
    > test.out 2>&1
eval_tap $? 23 'CreateMatchPool' test.out

#- 24 MatchPoolDetails
./ng net.accelbyte.sdk.cli.Main match2 matchPoolDetails \
    --namespace "$AB_NAMESPACE" \
    --pool 'U388Ibjk' \
    > test.out 2>&1
eval_tap $? 24 'MatchPoolDetails' test.out

#- 25 UpdateMatchPool
./ng net.accelbyte.sdk.cli.Main match2 updateMatchPool \
    --namespace "$AB_NAMESPACE" \
    --pool '3fsyr4Mq' \
    --body '{"auto_accept_backfill_proposal": true, "backfill_proposal_expiration_seconds": 76, "backfill_ticket_expiration_seconds": 90, "best_latency_calculation_method": "NfQ4lov4", "crossplay_disabled": false, "match_function": "rQqnA1Hx", "match_function_override": {"backfill_matches": "gvdeFGZu", "enrichment": ["MMNt9mtE", "iqYzS7GZ", "zFPkrM4J"], "make_matches": "dTSoPyOq", "stat_codes": ["OBrcAIMU", "RtWUU9m8", "6wogt0ib"], "validation": ["Toi6e1ot", "PnwmbgfV", "fHxW3ZVp"]}, "platform_group_enabled": false, "rule_set": "aHdIMvIT", "session_template": "EZ64Wq2x", "ticket_expiration_seconds": 20}' \
    > test.out 2>&1
eval_tap $? 25 'UpdateMatchPool' test.out

#- 26 DeleteMatchPool
./ng net.accelbyte.sdk.cli.Main match2 deleteMatchPool \
    --namespace "$AB_NAMESPACE" \
    --pool 'onAJKycM' \
    > test.out 2>&1
eval_tap $? 26 'DeleteMatchPool' test.out

#- 27 MatchPoolMetric
./ng net.accelbyte.sdk.cli.Main match2 matchPoolMetric \
    --namespace "$AB_NAMESPACE" \
    --pool 'tOKvC2dp' \
    > test.out 2>&1
eval_tap $? 27 'MatchPoolMetric' test.out

#- 28 PostMatchErrorMetric
./ng net.accelbyte.sdk.cli.Main match2 postMatchErrorMetric \
    --namespace "$AB_NAMESPACE" \
    --pool '23YlD22F' \
    --body '{"type": "getExternalDS"}' \
    > test.out 2>&1
eval_tap $? 28 'PostMatchErrorMetric' test.out

#- 29 GetPlayerMetric
./ng net.accelbyte.sdk.cli.Main match2 getPlayerMetric \
    --namespace "$AB_NAMESPACE" \
    --pool 'WBsb9PZ6' \
    > test.out 2>&1
eval_tap $? 29 'GetPlayerMetric' test.out

#- 30 AdminGetMatchPoolTickets
./ng net.accelbyte.sdk.cli.Main match2 adminGetMatchPoolTickets \
    --namespace "$AB_NAMESPACE" \
    --pool 'OIUXEDEw' \
    --limit '28' \
    --offset '47' \
    > test.out 2>&1
eval_tap $? 30 'AdminGetMatchPoolTickets' test.out

#- 31 CreateMatchTicket
./ng net.accelbyte.sdk.cli.Main match2 createMatchTicket \
    --namespace "$AB_NAMESPACE" \
    --body '{"attributes": {"bDJfEFq1": {}, "DOPc6lQp": {}, "zLW8vM3w": {}}, "excludedSessions": ["1bbo7q0Q", "5L2Uhf7i", "mFWfZFuZ"], "latencies": {"e9U71M3N": 86, "FUj8k9u0": 27, "lODzQwUH": 9}, "matchPool": "AVNB2SJG", "sessionID": "gApoMje4", "storage": {"z3A8GrzF": {}, "T3JdH0Xv": {}, "afpY3AP2": {}}}' \
    > test.out 2>&1
eval_tap $? 31 'CreateMatchTicket' test.out

#- 32 GetMyMatchTickets
./ng net.accelbyte.sdk.cli.Main match2 getMyMatchTickets \
    --namespace "$AB_NAMESPACE" \
    --limit '35' \
    --matchPool 'InxXG7Pv' \
    --offset '56' \
    > test.out 2>&1
eval_tap $? 32 'GetMyMatchTickets' test.out

#- 33 MatchTicketDetails
./ng net.accelbyte.sdk.cli.Main match2 matchTicketDetails \
    --namespace "$AB_NAMESPACE" \
    --ticketid 'itLZ1k0o' \
    > test.out 2>&1
eval_tap $? 33 'MatchTicketDetails' test.out

#- 34 DeleteMatchTicket
./ng net.accelbyte.sdk.cli.Main match2 deleteMatchTicket \
    --namespace "$AB_NAMESPACE" \
    --ticketid 'DxCEcZdJ' \
    > test.out 2>&1
eval_tap $? 34 'DeleteMatchTicket' test.out

#- 35 RuleSetList
./ng net.accelbyte.sdk.cli.Main match2 ruleSetList \
    --namespace "$AB_NAMESPACE" \
    --limit '32' \
    --name 'uzxUhwDo' \
    --offset '69' \
    > test.out 2>&1
eval_tap $? 35 'RuleSetList' test.out

#- 36 CreateRuleSet
./ng net.accelbyte.sdk.cli.Main match2 createRuleSet \
    --namespace "$AB_NAMESPACE" \
    --body '{"data": {"tA6NDND8": {}, "QkWA0zjk": {}, "h8bjguHX": {}}, "enable_custom_match_function": true, "name": "2AGEaiLb"}' \
    > test.out 2>&1
eval_tap $? 36 'CreateRuleSet' test.out

#- 37 RuleSetDetails
./ng net.accelbyte.sdk.cli.Main match2 ruleSetDetails \
    --namespace "$AB_NAMESPACE" \
    --ruleset 'YUnSTDBD' \
    > test.out 2>&1
eval_tap $? 37 'RuleSetDetails' test.out

#- 38 UpdateRuleSet
./ng net.accelbyte.sdk.cli.Main match2 updateRuleSet \
    --namespace "$AB_NAMESPACE" \
    --ruleset 'lRTJM9gO' \
    --body '{"data": {"TmajIYbI": {}, "a4PrmJ2M": {}, "rb9W7Bwm": {}}, "enable_custom_match_function": false, "name": "pugciiNA"}' \
    > test.out 2>&1
eval_tap $? 38 'UpdateRuleSet' test.out

#- 39 DeleteRuleSet
./ng net.accelbyte.sdk.cli.Main match2 deleteRuleSet \
    --namespace "$AB_NAMESPACE" \
    --ruleset 'Qk00X6xT' \
    > test.out 2>&1
eval_tap $? 39 'DeleteRuleSet' test.out

#- 40 PublicGetPlayerMetric
./ng net.accelbyte.sdk.cli.Main match2 publicGetPlayerMetric \
    --namespace "$AB_NAMESPACE" \
    --pool '4NskLImX' \
    > test.out 2>&1
eval_tap $? 40 'PublicGetPlayerMetric' test.out

#- 41 VersionCheckHandler
./ng net.accelbyte.sdk.cli.Main match2 versionCheckHandler \
    > test.out 2>&1
eval_tap $? 41 'VersionCheckHandler' test.out


rm -f "tmp.dat"

exit $EXIT_CODE