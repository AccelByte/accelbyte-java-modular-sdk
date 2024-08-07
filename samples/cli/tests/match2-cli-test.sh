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
echo "1..37"

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
    --body '{"logLevel": "trace"}' \
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
    --body '{"extraPlatforms": ["UXtfSNED", "RG8PRkiv", "TlBlyRwN"], "platformGroup": {"fzzAazz3": ["4KDtwxCd", "Q1ubsPxM", "RD01mUQw"], "6ijHZhOF": ["Bts1VeDC", "UgVOznGp", "6ck4NLYR"], "Jo1Mg3Cj": ["jktxgxRu", "YQ6u6oZ6", "POfHxhqJ"]}}' \
    > test.out 2>&1
eval_tap $? 8 'AdminPatchConfigV1' test.out

#- 9 EnvironmentVariableList
./ng net.accelbyte.sdk.cli.Main match2 environmentVariableList \
    > test.out 2>&1
eval_tap $? 9 'EnvironmentVariableList' test.out

#- 10 CreateBackfill
./ng net.accelbyte.sdk.cli.Main match2 createBackfill \
    --namespace "$AB_NAMESPACE" \
    --body '{"matchPool": "7Xr8jWTm", "sessionId": "WkbKNcvW"}' \
    > test.out 2>&1
eval_tap $? 10 'CreateBackfill' test.out

#- 11 GetBackfillProposal
./ng net.accelbyte.sdk.cli.Main match2 getBackfillProposal \
    --namespace "$AB_NAMESPACE" \
    --sessionID 'QISNY7rv' \
    > test.out 2>&1
eval_tap $? 11 'GetBackfillProposal' test.out

#- 12 GetBackfill
./ng net.accelbyte.sdk.cli.Main match2 getBackfill \
    --backfillID 'Uiqi6leX' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 12 'GetBackfill' test.out

#- 13 DeleteBackfill
./ng net.accelbyte.sdk.cli.Main match2 deleteBackfill \
    --backfillID '1D15stHC' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 13 'DeleteBackfill' test.out

#- 14 AcceptBackfill
./ng net.accelbyte.sdk.cli.Main match2 acceptBackfill \
    --backfillID '5DVwgpPZ' \
    --namespace "$AB_NAMESPACE" \
    --body '{"proposalId": "2Cyh93xH", "stop": true}' \
    > test.out 2>&1
eval_tap $? 14 'AcceptBackfill' test.out

#- 15 RejectBackfill
./ng net.accelbyte.sdk.cli.Main match2 rejectBackfill \
    --backfillID 'ju0jfEoV' \
    --namespace "$AB_NAMESPACE" \
    --body '{"proposalId": "fWUcD0Xg", "stop": true}' \
    > test.out 2>&1
eval_tap $? 15 'RejectBackfill' test.out

#- 16 MatchFunctionList
./ng net.accelbyte.sdk.cli.Main match2 matchFunctionList \
    --namespace "$AB_NAMESPACE" \
    --limit '99' \
    --offset '1' \
    > test.out 2>&1
eval_tap $? 16 'MatchFunctionList' test.out

#- 17 CreateMatchFunction
./ng net.accelbyte.sdk.cli.Main match2 createMatchFunction \
    --namespace "$AB_NAMESPACE" \
    --body '{"match_function": "wRUADgMp", "serviceAppName": "iwuMZGqX", "url": "9NFpsMPt"}' \
    > test.out 2>&1
eval_tap $? 17 'CreateMatchFunction' test.out

#- 18 UpdateMatchFunction
./ng net.accelbyte.sdk.cli.Main match2 updateMatchFunction \
    --name '84u4nXcK' \
    --namespace "$AB_NAMESPACE" \
    --body '{"match_function": "6vbJOtog", "serviceAppName": "O7FfbnZm", "url": "BiLeQvfs"}' \
    > test.out 2>&1
eval_tap $? 18 'UpdateMatchFunction' test.out

#- 19 DeleteMatchFunction
./ng net.accelbyte.sdk.cli.Main match2 deleteMatchFunction \
    --name 'oP328qUs' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 19 'DeleteMatchFunction' test.out

#- 20 MatchPoolList
./ng net.accelbyte.sdk.cli.Main match2 matchPoolList \
    --namespace "$AB_NAMESPACE" \
    --limit '20' \
    --name 'e1wbJbdE' \
    --offset '68' \
    > test.out 2>&1
eval_tap $? 20 'MatchPoolList' test.out

#- 21 CreateMatchPool
./ng net.accelbyte.sdk.cli.Main match2 createMatchPool \
    --namespace "$AB_NAMESPACE" \
    --body '{"auto_accept_backfill_proposal": false, "backfill_proposal_expiration_seconds": 64, "backfill_ticket_expiration_seconds": 75, "crossplay_disabled": false, "match_function": "Cei2OF8e", "match_function_override": {"backfill_matches": "6S3a84tN", "enrichment": ["8pEWfcfE", "4SXD6DFK", "kCuTShhf"], "make_matches": "ljBpdk8L", "stat_codes": ["NwxgIzki", "tB5b4qer", "xxllRP6z"], "validation": ["qBluzpYx", "W818coRk", "CSaPYctc"]}, "name": "HTxX9iRs", "platform_group_enabled": false, "rule_set": "s6QHxotF", "session_template": "9SDbv2i4", "ticket_expiration_seconds": 95}' \
    > test.out 2>&1
eval_tap $? 21 'CreateMatchPool' test.out

#- 22 MatchPoolDetails
./ng net.accelbyte.sdk.cli.Main match2 matchPoolDetails \
    --namespace "$AB_NAMESPACE" \
    --pool 'tLzmp2Sy' \
    > test.out 2>&1
eval_tap $? 22 'MatchPoolDetails' test.out

#- 23 UpdateMatchPool
./ng net.accelbyte.sdk.cli.Main match2 updateMatchPool \
    --namespace "$AB_NAMESPACE" \
    --pool 'Pk9pfr7g' \
    --body '{"auto_accept_backfill_proposal": true, "backfill_proposal_expiration_seconds": 18, "backfill_ticket_expiration_seconds": 16, "crossplay_disabled": false, "match_function": "DHKiUUaA", "match_function_override": {"backfill_matches": "mvzbvdBt", "enrichment": ["MymnXHLA", "SRu9c3xf", "vWq5L0vJ"], "make_matches": "Mihl7ecC", "stat_codes": ["Tj9QwsOL", "er4WMXzr", "QWMkg0nK"], "validation": ["As0fUuIj", "t7l4MwDx", "chkAXgF4"]}, "platform_group_enabled": false, "rule_set": "cZPDDpCG", "session_template": "j2mg4nW4", "ticket_expiration_seconds": 73}' \
    > test.out 2>&1
eval_tap $? 23 'UpdateMatchPool' test.out

#- 24 DeleteMatchPool
./ng net.accelbyte.sdk.cli.Main match2 deleteMatchPool \
    --namespace "$AB_NAMESPACE" \
    --pool 'jn06uhju' \
    > test.out 2>&1
eval_tap $? 24 'DeleteMatchPool' test.out

#- 25 MatchPoolMetric
./ng net.accelbyte.sdk.cli.Main match2 matchPoolMetric \
    --namespace "$AB_NAMESPACE" \
    --pool 'Y3gt5g4s' \
    > test.out 2>&1
eval_tap $? 25 'MatchPoolMetric' test.out

#- 26 GetPlayerMetric
./ng net.accelbyte.sdk.cli.Main match2 getPlayerMetric \
    --namespace "$AB_NAMESPACE" \
    --pool 'KIYNxpmk' \
    > test.out 2>&1
eval_tap $? 26 'GetPlayerMetric' test.out

#- 27 AdminGetMatchPoolTickets
./ng net.accelbyte.sdk.cli.Main match2 adminGetMatchPoolTickets \
    --namespace "$AB_NAMESPACE" \
    --pool 'eUaXwNgx' \
    --limit '24' \
    --offset '21' \
    > test.out 2>&1
eval_tap $? 27 'AdminGetMatchPoolTickets' test.out

#- 28 CreateMatchTicket
./ng net.accelbyte.sdk.cli.Main match2 createMatchTicket \
    --namespace "$AB_NAMESPACE" \
    --body '{"attributes": {"eJC1de0H": {}, "53vTL6Xh": {}, "rjpkkhFF": {}}, "latencies": {"RxicIMZn": 55, "DhUEPMNj": 38, "S438GEpv": 12}, "matchPool": "yVgTCjQy", "sessionID": "c4aZe54L", "storage": {"XNa48UR1": {}, "R10pIZjL": {}, "n9A9on9x": {}}}' \
    > test.out 2>&1
eval_tap $? 28 'CreateMatchTicket' test.out

#- 29 GetMyMatchTickets
./ng net.accelbyte.sdk.cli.Main match2 getMyMatchTickets \
    --namespace "$AB_NAMESPACE" \
    --limit '70' \
    --matchPool 'NPOB7sie' \
    --offset '4' \
    > test.out 2>&1
eval_tap $? 29 'GetMyMatchTickets' test.out

#- 30 MatchTicketDetails
./ng net.accelbyte.sdk.cli.Main match2 matchTicketDetails \
    --namespace "$AB_NAMESPACE" \
    --ticketid 'MgqTHj1t' \
    > test.out 2>&1
eval_tap $? 30 'MatchTicketDetails' test.out

#- 31 DeleteMatchTicket
./ng net.accelbyte.sdk.cli.Main match2 deleteMatchTicket \
    --namespace "$AB_NAMESPACE" \
    --ticketid 'dmMUOJnH' \
    > test.out 2>&1
eval_tap $? 31 'DeleteMatchTicket' test.out

#- 32 RuleSetList
./ng net.accelbyte.sdk.cli.Main match2 ruleSetList \
    --namespace "$AB_NAMESPACE" \
    --limit '37' \
    --name 'ejoJgsqq' \
    --offset '29' \
    > test.out 2>&1
eval_tap $? 32 'RuleSetList' test.out

#- 33 CreateRuleSet
./ng net.accelbyte.sdk.cli.Main match2 createRuleSet \
    --namespace "$AB_NAMESPACE" \
    --body '{"data": {"ENsyBuBA": {}, "LCqliHb1": {}, "cFZXnn2S": {}}, "enable_custom_match_function": true, "name": "0GTuqEjk"}' \
    > test.out 2>&1
eval_tap $? 33 'CreateRuleSet' test.out

#- 34 RuleSetDetails
./ng net.accelbyte.sdk.cli.Main match2 ruleSetDetails \
    --namespace "$AB_NAMESPACE" \
    --ruleset 'rBJwqqYP' \
    > test.out 2>&1
eval_tap $? 34 'RuleSetDetails' test.out

#- 35 UpdateRuleSet
./ng net.accelbyte.sdk.cli.Main match2 updateRuleSet \
    --namespace "$AB_NAMESPACE" \
    --ruleset '8H6Cua0I' \
    --body '{"data": {"HzWBEqVz": {}, "NaT1fJwf": {}, "WbEPbYHO": {}}, "enable_custom_match_function": false, "name": "aszmZsKv"}' \
    > test.out 2>&1
eval_tap $? 35 'UpdateRuleSet' test.out

#- 36 DeleteRuleSet
./ng net.accelbyte.sdk.cli.Main match2 deleteRuleSet \
    --namespace "$AB_NAMESPACE" \
    --ruleset 'n4dPXaNA' \
    > test.out 2>&1
eval_tap $? 36 'DeleteRuleSet' test.out

#- 37 VersionCheckHandler
./ng net.accelbyte.sdk.cli.Main match2 versionCheckHandler \
    > test.out 2>&1
eval_tap $? 37 'VersionCheckHandler' test.out


rm -f "tmp.dat"

exit $EXIT_CODE