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
echo "1..40"

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
    --body '{"logLevel": "debug"}' \
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
    --body '{"crossPlatformNoCurrentPlatform": true, "extraPlatforms": ["tZlGrXU7", "IGRNJCQ1", "hcYwO0Nz"], "matchAnyCommon": true, "platformGroup": {"Z1AVigwP": ["1BCYG00a", "xsxUVh01", "loY4roeg"], "ZfumI8k8": ["abZRlZ4P", "TVg683vl", "dCYIAR2V"], "KdDOxI9f": ["KdUdZvXO", "t1coFC7b", "QWx5Br7C"]}}' \
    > test.out 2>&1
eval_tap $? 8 'AdminPatchConfigV1' test.out

#- 9 EnvironmentVariableList
./ng net.accelbyte.sdk.cli.Main match2 environmentVariableList \
    > test.out 2>&1
eval_tap $? 9 'EnvironmentVariableList' test.out

#- 10 AdminQueryBackfill
./ng net.accelbyte.sdk.cli.Main match2 adminQueryBackfill \
    --namespace "$AB_NAMESPACE" \
    --fromTime '1980-08-22T00:00:00Z' \
    --isActive  \
    --limit '88' \
    --matchPool 'UVPgHep5' \
    --offset '13' \
    --playerID 'cklbWPDo' \
    --region '7dl5fdxD' \
    --sessionID 'g3KpAcLF' \
    --toTime '1982-01-10T00:00:00Z' \
    > test.out 2>&1
eval_tap $? 10 'AdminQueryBackfill' test.out

#- 11 CreateBackfill
./ng net.accelbyte.sdk.cli.Main match2 createBackfill \
    --namespace "$AB_NAMESPACE" \
    --body '{"matchPool": "eDbqBp7Q", "sessionId": "i6vYukeT"}' \
    > test.out 2>&1
eval_tap $? 11 'CreateBackfill' test.out

#- 12 GetBackfillProposal
./ng net.accelbyte.sdk.cli.Main match2 getBackfillProposal \
    --namespace "$AB_NAMESPACE" \
    --sessionID 'E4OsAU4t' \
    > test.out 2>&1
eval_tap $? 12 'GetBackfillProposal' test.out

#- 13 GetBackfill
./ng net.accelbyte.sdk.cli.Main match2 getBackfill \
    --backfillID 'uQ012dFT' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 13 'GetBackfill' test.out

#- 14 DeleteBackfill
./ng net.accelbyte.sdk.cli.Main match2 deleteBackfill \
    --backfillID 'Za5RSRP8' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 14 'DeleteBackfill' test.out

#- 15 AcceptBackfill
./ng net.accelbyte.sdk.cli.Main match2 acceptBackfill \
    --backfillID 'FRydwNhQ' \
    --namespace "$AB_NAMESPACE" \
    --body '{"acceptedTicketIds": ["AHiEvP9V", "JMXUjVTG", "4pHoUx0y"], "proposalId": "Vvqeg7KB", "stop": false}' \
    > test.out 2>&1
eval_tap $? 15 'AcceptBackfill' test.out

#- 16 RejectBackfill
./ng net.accelbyte.sdk.cli.Main match2 rejectBackfill \
    --backfillID 'uCOSxAJo' \
    --namespace "$AB_NAMESPACE" \
    --body '{"proposalId": "Kd7oYg0e", "stop": true}' \
    > test.out 2>&1
eval_tap $? 16 'RejectBackfill' test.out

#- 17 MatchFunctionList
./ng net.accelbyte.sdk.cli.Main match2 matchFunctionList \
    --namespace "$AB_NAMESPACE" \
    --limit '52' \
    --offset '88' \
    > test.out 2>&1
eval_tap $? 17 'MatchFunctionList' test.out

#- 18 CreateMatchFunction
./ng net.accelbyte.sdk.cli.Main match2 createMatchFunction \
    --namespace "$AB_NAMESPACE" \
    --body '{"match_function": "0FV3FBAz", "serviceAppName": "QW02nixg", "url": "L5d8Bxte"}' \
    > test.out 2>&1
eval_tap $? 18 'CreateMatchFunction' test.out

#- 19 UpdateMatchFunction
./ng net.accelbyte.sdk.cli.Main match2 updateMatchFunction \
    --name 'mAkEwDQZ' \
    --namespace "$AB_NAMESPACE" \
    --body '{"match_function": "KtBsb6nK", "serviceAppName": "v9WgNjs7", "url": "8wFNV76P"}' \
    > test.out 2>&1
eval_tap $? 19 'UpdateMatchFunction' test.out

#- 20 DeleteMatchFunction
./ng net.accelbyte.sdk.cli.Main match2 deleteMatchFunction \
    --name 'j06g9wH7' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 20 'DeleteMatchFunction' test.out

#- 21 MatchPoolList
./ng net.accelbyte.sdk.cli.Main match2 matchPoolList \
    --namespace "$AB_NAMESPACE" \
    --limit '1' \
    --name 'gkFmIosO' \
    --offset '71' \
    > test.out 2>&1
eval_tap $? 21 'MatchPoolList' test.out

#- 22 CreateMatchPool
./ng net.accelbyte.sdk.cli.Main match2 createMatchPool \
    --namespace "$AB_NAMESPACE" \
    --body '{"auto_accept_backfill_proposal": false, "backfill_proposal_expiration_seconds": 24, "backfill_ticket_expiration_seconds": 24, "best_latency_calculation_method": "mUZztCKg", "crossplay_disabled": true, "match_function": "G8rr3NI6", "match_function_override": {"backfill_matches": "8BTmgTEv", "enrichment": ["vhf1iNjW", "RzFgqUEJ", "dAKepXjH"], "make_matches": "bAc9OawC", "stat_codes": ["AOVIROZk", "fyFsNeOY", "bqjLryPt"], "validation": ["auX91uxl", "EIFic7Ba", "ojDJauBh"]}, "name": "SsyoVxYt", "platform_group_enabled": true, "rule_set": "yu3Pw5mB", "session_template": "Vl2BpuEL", "ticket_expiration_seconds": 19}' \
    > test.out 2>&1
eval_tap $? 22 'CreateMatchPool' test.out

#- 23 MatchPoolDetails
./ng net.accelbyte.sdk.cli.Main match2 matchPoolDetails \
    --namespace "$AB_NAMESPACE" \
    --pool 'sCvUYYly' \
    > test.out 2>&1
eval_tap $? 23 'MatchPoolDetails' test.out

#- 24 UpdateMatchPool
./ng net.accelbyte.sdk.cli.Main match2 updateMatchPool \
    --namespace "$AB_NAMESPACE" \
    --pool 'CHrMVuCQ' \
    --body '{"auto_accept_backfill_proposal": false, "backfill_proposal_expiration_seconds": 11, "backfill_ticket_expiration_seconds": 41, "best_latency_calculation_method": "HOSkL1vN", "crossplay_disabled": true, "match_function": "FLzqxg6X", "match_function_override": {"backfill_matches": "DDSL0CSw", "enrichment": ["WJ00VrCG", "jXG7BlJ3", "kjXlSVgi"], "make_matches": "Ml1pP3X1", "stat_codes": ["u9ZezQad", "zJFlWamW", "lnD97Lqr"], "validation": ["EQifePtx", "DCWPUQUN", "JqRKIaRD"]}, "platform_group_enabled": true, "rule_set": "xGAfM7l8", "session_template": "SsLzyJdW", "ticket_expiration_seconds": 42}' \
    > test.out 2>&1
eval_tap $? 24 'UpdateMatchPool' test.out

#- 25 DeleteMatchPool
./ng net.accelbyte.sdk.cli.Main match2 deleteMatchPool \
    --namespace "$AB_NAMESPACE" \
    --pool 'JtIgYpDP' \
    > test.out 2>&1
eval_tap $? 25 'DeleteMatchPool' test.out

#- 26 MatchPoolMetric
./ng net.accelbyte.sdk.cli.Main match2 matchPoolMetric \
    --namespace "$AB_NAMESPACE" \
    --pool '7R2ANT5b' \
    > test.out 2>&1
eval_tap $? 26 'MatchPoolMetric' test.out

#- 27 PostMatchErrorMetric
./ng net.accelbyte.sdk.cli.Main match2 postMatchErrorMetric \
    --namespace "$AB_NAMESPACE" \
    --pool 'M7k0bJcW' \
    --body '{"type": "connectDS"}' \
    > test.out 2>&1
eval_tap $? 27 'PostMatchErrorMetric' test.out

#- 28 GetPlayerMetric
./ng net.accelbyte.sdk.cli.Main match2 getPlayerMetric \
    --namespace "$AB_NAMESPACE" \
    --pool 'DX2rotaK' \
    > test.out 2>&1
eval_tap $? 28 'GetPlayerMetric' test.out

#- 29 AdminGetMatchPoolTickets
./ng net.accelbyte.sdk.cli.Main match2 adminGetMatchPoolTickets \
    --namespace "$AB_NAMESPACE" \
    --pool 'VaF4Rvgg' \
    --limit '69' \
    --offset '34' \
    > test.out 2>&1
eval_tap $? 29 'AdminGetMatchPoolTickets' test.out

#- 30 CreateMatchTicket
./ng net.accelbyte.sdk.cli.Main match2 createMatchTicket \
    --namespace "$AB_NAMESPACE" \
    --body '{"attributes": {"c8DLbcW0": {}, "LntJY6y4": {}, "vPA4Vx1F": {}}, "excludedSessions": ["1DBvbgZs", "Ds2EcX8q", "GcDh2cNd"], "latencies": {"LOfAQ8ba": 67, "jXMETErr": 59, "gHXDLVAa": 47}, "matchPool": "Lo0gznqC", "sessionID": "LtXVIhgi", "storage": {"TmHnimCr": {}, "PkVOZoGb": {}, "nmrEhNEe": {}}}' \
    > test.out 2>&1
eval_tap $? 30 'CreateMatchTicket' test.out

#- 31 GetMyMatchTickets
./ng net.accelbyte.sdk.cli.Main match2 getMyMatchTickets \
    --namespace "$AB_NAMESPACE" \
    --limit '38' \
    --matchPool 'tLNW19zY' \
    --offset '98' \
    > test.out 2>&1
eval_tap $? 31 'GetMyMatchTickets' test.out

#- 32 MatchTicketDetails
./ng net.accelbyte.sdk.cli.Main match2 matchTicketDetails \
    --namespace "$AB_NAMESPACE" \
    --ticketid 'Er6zygU2' \
    > test.out 2>&1
eval_tap $? 32 'MatchTicketDetails' test.out

#- 33 DeleteMatchTicket
./ng net.accelbyte.sdk.cli.Main match2 deleteMatchTicket \
    --namespace "$AB_NAMESPACE" \
    --ticketid 'ZuVfHW2t' \
    > test.out 2>&1
eval_tap $? 33 'DeleteMatchTicket' test.out

#- 34 RuleSetList
./ng net.accelbyte.sdk.cli.Main match2 ruleSetList \
    --namespace "$AB_NAMESPACE" \
    --limit '3' \
    --name 'DTzBWnmv' \
    --offset '37' \
    > test.out 2>&1
eval_tap $? 34 'RuleSetList' test.out

#- 35 CreateRuleSet
./ng net.accelbyte.sdk.cli.Main match2 createRuleSet \
    --namespace "$AB_NAMESPACE" \
    --body '{"data": {"O6q0oApt": {}, "dV59FLHU": {}, "KaAN1ACD": {}}, "enable_custom_match_function": false, "name": "hJM7m9qu"}' \
    > test.out 2>&1
eval_tap $? 35 'CreateRuleSet' test.out

#- 36 RuleSetDetails
./ng net.accelbyte.sdk.cli.Main match2 ruleSetDetails \
    --namespace "$AB_NAMESPACE" \
    --ruleset '91gIZgZE' \
    > test.out 2>&1
eval_tap $? 36 'RuleSetDetails' test.out

#- 37 UpdateRuleSet
./ng net.accelbyte.sdk.cli.Main match2 updateRuleSet \
    --namespace "$AB_NAMESPACE" \
    --ruleset 'NKddcTLT' \
    --body '{"data": {"oYqTtSMc": {}, "4Kk0LWc0": {}, "vEMZD5Y7": {}}, "enable_custom_match_function": true, "name": "2VwqDl7y"}' \
    > test.out 2>&1
eval_tap $? 37 'UpdateRuleSet' test.out

#- 38 DeleteRuleSet
./ng net.accelbyte.sdk.cli.Main match2 deleteRuleSet \
    --namespace "$AB_NAMESPACE" \
    --ruleset 'StSuy5n1' \
    > test.out 2>&1
eval_tap $? 38 'DeleteRuleSet' test.out

#- 39 PublicGetPlayerMetric
./ng net.accelbyte.sdk.cli.Main match2 publicGetPlayerMetric \
    --namespace "$AB_NAMESPACE" \
    --pool 'cv08S5jG' \
    > test.out 2>&1
eval_tap $? 39 'PublicGetPlayerMetric' test.out

#- 40 VersionCheckHandler
./ng net.accelbyte.sdk.cli.Main match2 versionCheckHandler \
    > test.out 2>&1
eval_tap $? 40 'VersionCheckHandler' test.out


rm -f "tmp.dat"

exit $EXIT_CODE