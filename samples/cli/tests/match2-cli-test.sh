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
    --body '{"logLevel": "error"}' \
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
    --body '{"crossPlatformNoCurrentPlatform": true, "extraPlatforms": ["3s4H4j2W", "x9o66qbO", "TUuziOCX"], "matchAnyCommon": true, "platformGroup": {"XVDowbqM": ["s8Lh6d02", "ZF5B8qJ3", "5wdVo6d0"], "x6Pna0Nd": ["rSaRyot5", "HBRkHmFd", "3hxdE59e"], "4hoARmbs": ["co28ydQr", "9oR4xePI", "85JV5N49"]}}' \
    > test.out 2>&1
eval_tap $? 8 'AdminPatchConfigV1' test.out

#- 9 EnvironmentVariableList
./ng net.accelbyte.sdk.cli.Main match2 environmentVariableList \
    > test.out 2>&1
eval_tap $? 9 'EnvironmentVariableList' test.out

#- 10 CreateBackfill
./ng net.accelbyte.sdk.cli.Main match2 createBackfill \
    --namespace "$AB_NAMESPACE" \
    --body '{"matchPool": "BRd2U7ax", "sessionId": "KKbN5VnR"}' \
    > test.out 2>&1
eval_tap $? 10 'CreateBackfill' test.out

#- 11 GetBackfillProposal
./ng net.accelbyte.sdk.cli.Main match2 getBackfillProposal \
    --namespace "$AB_NAMESPACE" \
    --sessionID 'acdVKABY' \
    > test.out 2>&1
eval_tap $? 11 'GetBackfillProposal' test.out

#- 12 GetBackfill
./ng net.accelbyte.sdk.cli.Main match2 getBackfill \
    --backfillID 'b7U9QiLf' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 12 'GetBackfill' test.out

#- 13 DeleteBackfill
./ng net.accelbyte.sdk.cli.Main match2 deleteBackfill \
    --backfillID 'msqTAgqz' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 13 'DeleteBackfill' test.out

#- 14 AcceptBackfill
./ng net.accelbyte.sdk.cli.Main match2 acceptBackfill \
    --backfillID 'VbsZIfb5' \
    --namespace "$AB_NAMESPACE" \
    --body '{"acceptedTicketIds": ["6YEBq33o", "hD2v99FF", "xHWbAVmX"], "proposalId": "1OtKpgj6", "stop": true}' \
    > test.out 2>&1
eval_tap $? 14 'AcceptBackfill' test.out

#- 15 RejectBackfill
./ng net.accelbyte.sdk.cli.Main match2 rejectBackfill \
    --backfillID '8menfVYs' \
    --namespace "$AB_NAMESPACE" \
    --body '{"proposalId": "qWcaBKBc", "stop": false}' \
    > test.out 2>&1
eval_tap $? 15 'RejectBackfill' test.out

#- 16 MatchFunctionList
./ng net.accelbyte.sdk.cli.Main match2 matchFunctionList \
    --namespace "$AB_NAMESPACE" \
    --limit '15' \
    --offset '56' \
    > test.out 2>&1
eval_tap $? 16 'MatchFunctionList' test.out

#- 17 CreateMatchFunction
./ng net.accelbyte.sdk.cli.Main match2 createMatchFunction \
    --namespace "$AB_NAMESPACE" \
    --body '{"match_function": "7ApMzmIN", "serviceAppName": "L8u6v96R", "url": "8nTzunZQ"}' \
    > test.out 2>&1
eval_tap $? 17 'CreateMatchFunction' test.out

#- 18 UpdateMatchFunction
./ng net.accelbyte.sdk.cli.Main match2 updateMatchFunction \
    --name '7bI32Rnu' \
    --namespace "$AB_NAMESPACE" \
    --body '{"match_function": "jOhRoeHx", "serviceAppName": "pO6TfFxS", "url": "W98fFhnu"}' \
    > test.out 2>&1
eval_tap $? 18 'UpdateMatchFunction' test.out

#- 19 DeleteMatchFunction
./ng net.accelbyte.sdk.cli.Main match2 deleteMatchFunction \
    --name 'gagSWubp' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 19 'DeleteMatchFunction' test.out

#- 20 MatchPoolList
./ng net.accelbyte.sdk.cli.Main match2 matchPoolList \
    --namespace "$AB_NAMESPACE" \
    --limit '27' \
    --name 'WEVhn3pY' \
    --offset '74' \
    > test.out 2>&1
eval_tap $? 20 'MatchPoolList' test.out

#- 21 CreateMatchPool
./ng net.accelbyte.sdk.cli.Main match2 createMatchPool \
    --namespace "$AB_NAMESPACE" \
    --body '{"auto_accept_backfill_proposal": false, "backfill_proposal_expiration_seconds": 69, "backfill_ticket_expiration_seconds": 79, "best_latency_calculation_method": "NoJSMWkL", "crossplay_disabled": true, "match_function": "zARn94MG", "match_function_override": {"backfill_matches": "GaZthp0o", "enrichment": ["trUzhJr1", "Lt1wJsFN", "qagdUZpk"], "make_matches": "y2JpOx4n", "stat_codes": ["LUQvMDeb", "hd35IfaC", "culQxOj3"], "validation": ["F5d2CXjL", "iWdRbljm", "5DNWUBqI"]}, "name": "yPygJwsO", "platform_group_enabled": true, "rule_set": "bjPJ4HYA", "session_template": "6TJerUto", "ticket_expiration_seconds": 75}' \
    > test.out 2>&1
eval_tap $? 21 'CreateMatchPool' test.out

#- 22 MatchPoolDetails
./ng net.accelbyte.sdk.cli.Main match2 matchPoolDetails \
    --namespace "$AB_NAMESPACE" \
    --pool '9SGJCXe9' \
    > test.out 2>&1
eval_tap $? 22 'MatchPoolDetails' test.out

#- 23 UpdateMatchPool
./ng net.accelbyte.sdk.cli.Main match2 updateMatchPool \
    --namespace "$AB_NAMESPACE" \
    --pool '2zhsGtoX' \
    --body '{"auto_accept_backfill_proposal": true, "backfill_proposal_expiration_seconds": 34, "backfill_ticket_expiration_seconds": 33, "best_latency_calculation_method": "43A6jAsT", "crossplay_disabled": false, "match_function": "LFZbmBsX", "match_function_override": {"backfill_matches": "wBRuyrEp", "enrichment": ["x33WJSEV", "oFHqDNiM", "CSQ9QK2u"], "make_matches": "AvGib93u", "stat_codes": ["cPDbrSGG", "hPyiDzJz", "32gzvmFC"], "validation": ["ooyINQEv", "01axMmPU", "RTGxM6dZ"]}, "platform_group_enabled": false, "rule_set": "nhnjSsiS", "session_template": "f58JyS6T", "ticket_expiration_seconds": 6}' \
    > test.out 2>&1
eval_tap $? 23 'UpdateMatchPool' test.out

#- 24 DeleteMatchPool
./ng net.accelbyte.sdk.cli.Main match2 deleteMatchPool \
    --namespace "$AB_NAMESPACE" \
    --pool 'LH9gE7M8' \
    > test.out 2>&1
eval_tap $? 24 'DeleteMatchPool' test.out

#- 25 MatchPoolMetric
./ng net.accelbyte.sdk.cli.Main match2 matchPoolMetric \
    --namespace "$AB_NAMESPACE" \
    --pool '1WNBOBVQ' \
    > test.out 2>&1
eval_tap $? 25 'MatchPoolMetric' test.out

#- 26 PostMatchErrorMetric
./ng net.accelbyte.sdk.cli.Main match2 postMatchErrorMetric \
    --namespace "$AB_NAMESPACE" \
    --pool '6GgaC3OE' \
    --body '{"type": "getExternalDS"}' \
    > test.out 2>&1
eval_tap $? 26 'PostMatchErrorMetric' test.out

#- 27 GetPlayerMetric
./ng net.accelbyte.sdk.cli.Main match2 getPlayerMetric \
    --namespace "$AB_NAMESPACE" \
    --pool 'uP14CqOb' \
    > test.out 2>&1
eval_tap $? 27 'GetPlayerMetric' test.out

#- 28 AdminGetMatchPoolTickets
./ng net.accelbyte.sdk.cli.Main match2 adminGetMatchPoolTickets \
    --namespace "$AB_NAMESPACE" \
    --pool 'jnFg3o7Y' \
    --limit '36' \
    --offset '27' \
    > test.out 2>&1
eval_tap $? 28 'AdminGetMatchPoolTickets' test.out

#- 29 CreateMatchTicket
./ng net.accelbyte.sdk.cli.Main match2 createMatchTicket \
    --namespace "$AB_NAMESPACE" \
    --body '{"attributes": {"e3MD9DpU": {}, "1vjWwy8X": {}, "CkvWOt6U": {}}, "excludedSessions": ["75LhETN1", "3TJCoJtk", "s0ze9ghV"], "latencies": {"DkwcQj5v": 27, "ZdJDQI79": 7, "VPQsZIGn": 27}, "matchPool": "qEEJpRed", "sessionID": "FfWMYWN2", "storage": {"bvzV6CPk": {}, "6K5CzXTg": {}, "uBEexZfW": {}}}' \
    > test.out 2>&1
eval_tap $? 29 'CreateMatchTicket' test.out

#- 30 GetMyMatchTickets
./ng net.accelbyte.sdk.cli.Main match2 getMyMatchTickets \
    --namespace "$AB_NAMESPACE" \
    --limit '11' \
    --matchPool 'qw54ak1D' \
    --offset '29' \
    > test.out 2>&1
eval_tap $? 30 'GetMyMatchTickets' test.out

#- 31 MatchTicketDetails
./ng net.accelbyte.sdk.cli.Main match2 matchTicketDetails \
    --namespace "$AB_NAMESPACE" \
    --ticketid 'wiJf2qgp' \
    > test.out 2>&1
eval_tap $? 31 'MatchTicketDetails' test.out

#- 32 DeleteMatchTicket
./ng net.accelbyte.sdk.cli.Main match2 deleteMatchTicket \
    --namespace "$AB_NAMESPACE" \
    --ticketid 'Dfneb1nK' \
    > test.out 2>&1
eval_tap $? 32 'DeleteMatchTicket' test.out

#- 33 RuleSetList
./ng net.accelbyte.sdk.cli.Main match2 ruleSetList \
    --namespace "$AB_NAMESPACE" \
    --limit '32' \
    --name '29RQxO2i' \
    --offset '74' \
    > test.out 2>&1
eval_tap $? 33 'RuleSetList' test.out

#- 34 CreateRuleSet
./ng net.accelbyte.sdk.cli.Main match2 createRuleSet \
    --namespace "$AB_NAMESPACE" \
    --body '{"data": {"07TIEwgr": {}, "GorrpLOM": {}, "bcaEC7R9": {}}, "enable_custom_match_function": false, "name": "OeyJzMDl"}' \
    > test.out 2>&1
eval_tap $? 34 'CreateRuleSet' test.out

#- 35 RuleSetDetails
./ng net.accelbyte.sdk.cli.Main match2 ruleSetDetails \
    --namespace "$AB_NAMESPACE" \
    --ruleset '8KzQC09Y' \
    > test.out 2>&1
eval_tap $? 35 'RuleSetDetails' test.out

#- 36 UpdateRuleSet
./ng net.accelbyte.sdk.cli.Main match2 updateRuleSet \
    --namespace "$AB_NAMESPACE" \
    --ruleset 'zzwh0cOo' \
    --body '{"data": {"lhnWtvee": {}, "S5uFkJsH": {}, "2O08UUO6": {}}, "enable_custom_match_function": false, "name": "IFzmvxnH"}' \
    > test.out 2>&1
eval_tap $? 36 'UpdateRuleSet' test.out

#- 37 DeleteRuleSet
./ng net.accelbyte.sdk.cli.Main match2 deleteRuleSet \
    --namespace "$AB_NAMESPACE" \
    --ruleset 'vpVeb6DN' \
    > test.out 2>&1
eval_tap $? 37 'DeleteRuleSet' test.out

#- 38 PublicGetPlayerMetric
./ng net.accelbyte.sdk.cli.Main match2 publicGetPlayerMetric \
    --namespace "$AB_NAMESPACE" \
    --pool 'MksnR3et' \
    > test.out 2>&1
eval_tap $? 38 'PublicGetPlayerMetric' test.out

#- 39 VersionCheckHandler
./ng net.accelbyte.sdk.cli.Main match2 versionCheckHandler \
    > test.out 2>&1
eval_tap $? 39 'VersionCheckHandler' test.out


rm -f "tmp.dat"

exit $EXIT_CODE