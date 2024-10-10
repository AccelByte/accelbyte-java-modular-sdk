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
echo "1..38"

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
    --body '{"logLevel": "warning"}' \
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
    --body '{"crossPlatformNoCurrentPlatform": true, "extraPlatforms": ["u1t1Jl3b", "qgcz3DEm", "Yr9vV8lX"], "matchAnyCommon": true, "platformGroup": {"XD9gaHZw": ["gy2k4CzY", "GMduHkKO", "dTqv1wOM"], "Hh7XLHyo": ["TrfQ7Gpk", "4L7BNfur", "GOL7BNtC"], "t63zxdPq": ["uJ0IB2MG", "y8ri75dd", "DOzaRdDU"]}}' \
    > test.out 2>&1
eval_tap $? 8 'AdminPatchConfigV1' test.out

#- 9 EnvironmentVariableList
./ng net.accelbyte.sdk.cli.Main match2 environmentVariableList \
    > test.out 2>&1
eval_tap $? 9 'EnvironmentVariableList' test.out

#- 10 CreateBackfill
./ng net.accelbyte.sdk.cli.Main match2 createBackfill \
    --namespace "$AB_NAMESPACE" \
    --body '{"matchPool": "e5EXSAwP", "sessionId": "c3Se0NUI"}' \
    > test.out 2>&1
eval_tap $? 10 'CreateBackfill' test.out

#- 11 GetBackfillProposal
./ng net.accelbyte.sdk.cli.Main match2 getBackfillProposal \
    --namespace "$AB_NAMESPACE" \
    --sessionID 'pq5uPFH8' \
    > test.out 2>&1
eval_tap $? 11 'GetBackfillProposal' test.out

#- 12 GetBackfill
./ng net.accelbyte.sdk.cli.Main match2 getBackfill \
    --backfillID 'nUyarbQo' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 12 'GetBackfill' test.out

#- 13 DeleteBackfill
./ng net.accelbyte.sdk.cli.Main match2 deleteBackfill \
    --backfillID '4ziamxSb' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 13 'DeleteBackfill' test.out

#- 14 AcceptBackfill
./ng net.accelbyte.sdk.cli.Main match2 acceptBackfill \
    --backfillID 'UMMrAV5B' \
    --namespace "$AB_NAMESPACE" \
    --body '{"acceptedTicketIds": ["QXfE4QEw", "ag12xb7t", "b72vp1UZ"], "proposalId": "eM351DEa", "stop": false}' \
    > test.out 2>&1
eval_tap $? 14 'AcceptBackfill' test.out

#- 15 RejectBackfill
./ng net.accelbyte.sdk.cli.Main match2 rejectBackfill \
    --backfillID 'Rtk9PYxK' \
    --namespace "$AB_NAMESPACE" \
    --body '{"proposalId": "WtgQYK5y", "stop": false}' \
    > test.out 2>&1
eval_tap $? 15 'RejectBackfill' test.out

#- 16 MatchFunctionList
./ng net.accelbyte.sdk.cli.Main match2 matchFunctionList \
    --namespace "$AB_NAMESPACE" \
    --limit '94' \
    --offset '70' \
    > test.out 2>&1
eval_tap $? 16 'MatchFunctionList' test.out

#- 17 CreateMatchFunction
./ng net.accelbyte.sdk.cli.Main match2 createMatchFunction \
    --namespace "$AB_NAMESPACE" \
    --body '{"match_function": "sTswzHGy", "serviceAppName": "7VIKu8nJ", "url": "ZhXe9O8J"}' \
    > test.out 2>&1
eval_tap $? 17 'CreateMatchFunction' test.out

#- 18 UpdateMatchFunction
./ng net.accelbyte.sdk.cli.Main match2 updateMatchFunction \
    --name 'TJJ8S5Uc' \
    --namespace "$AB_NAMESPACE" \
    --body '{"match_function": "FmMgcrFr", "serviceAppName": "7Ixa2VSQ", "url": "c44mvQvC"}' \
    > test.out 2>&1
eval_tap $? 18 'UpdateMatchFunction' test.out

#- 19 DeleteMatchFunction
./ng net.accelbyte.sdk.cli.Main match2 deleteMatchFunction \
    --name 'L73Y6cQk' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 19 'DeleteMatchFunction' test.out

#- 20 MatchPoolList
./ng net.accelbyte.sdk.cli.Main match2 matchPoolList \
    --namespace "$AB_NAMESPACE" \
    --limit '71' \
    --name 'orFCRuw2' \
    --offset '41' \
    > test.out 2>&1
eval_tap $? 20 'MatchPoolList' test.out

#- 21 CreateMatchPool
./ng net.accelbyte.sdk.cli.Main match2 createMatchPool \
    --namespace "$AB_NAMESPACE" \
    --body '{"auto_accept_backfill_proposal": false, "backfill_proposal_expiration_seconds": 2, "backfill_ticket_expiration_seconds": 77, "best_latency_calculation_method": "YDPoIAcw", "crossplay_disabled": false, "match_function": "OmnUziLN", "match_function_override": {"backfill_matches": "bh7rcsNc", "enrichment": ["4i532T6S", "q9vXoxcH", "AAMvpZLv"], "make_matches": "ji1EOt2T", "stat_codes": ["n3JtfZlR", "zr1q3Xyd", "tHwz7SMp"], "validation": ["zety1bVm", "GeYrlGEh", "aCT7qJDJ"]}, "name": "puMXJPVj", "platform_group_enabled": true, "rule_set": "IYClgLei", "session_template": "HxEhbta3", "ticket_expiration_seconds": 21}' \
    > test.out 2>&1
eval_tap $? 21 'CreateMatchPool' test.out

#- 22 MatchPoolDetails
./ng net.accelbyte.sdk.cli.Main match2 matchPoolDetails \
    --namespace "$AB_NAMESPACE" \
    --pool 'IuJKRNPJ' \
    > test.out 2>&1
eval_tap $? 22 'MatchPoolDetails' test.out

#- 23 UpdateMatchPool
./ng net.accelbyte.sdk.cli.Main match2 updateMatchPool \
    --namespace "$AB_NAMESPACE" \
    --pool 'T6iWtzgd' \
    --body '{"auto_accept_backfill_proposal": true, "backfill_proposal_expiration_seconds": 59, "backfill_ticket_expiration_seconds": 13, "best_latency_calculation_method": "PqZeH0ZL", "crossplay_disabled": false, "match_function": "jUfj9Ta2", "match_function_override": {"backfill_matches": "eMFTBaxE", "enrichment": ["psrvto2o", "yB4ZDu4d", "4SovRcjY"], "make_matches": "XIKMjNjl", "stat_codes": ["j9nr1nkw", "GguifZbJ", "2EOHAhuw"], "validation": ["CrXHeXUD", "Xq3fzdZx", "kPhCGhdh"]}, "platform_group_enabled": false, "rule_set": "SkMr7Fhl", "session_template": "OufspN0j", "ticket_expiration_seconds": 59}' \
    > test.out 2>&1
eval_tap $? 23 'UpdateMatchPool' test.out

#- 24 DeleteMatchPool
./ng net.accelbyte.sdk.cli.Main match2 deleteMatchPool \
    --namespace "$AB_NAMESPACE" \
    --pool 'NVEZXUKm' \
    > test.out 2>&1
eval_tap $? 24 'DeleteMatchPool' test.out

#- 25 MatchPoolMetric
./ng net.accelbyte.sdk.cli.Main match2 matchPoolMetric \
    --namespace "$AB_NAMESPACE" \
    --pool 'SAnEhKir' \
    > test.out 2>&1
eval_tap $? 25 'MatchPoolMetric' test.out

#- 26 GetPlayerMetric
./ng net.accelbyte.sdk.cli.Main match2 getPlayerMetric \
    --namespace "$AB_NAMESPACE" \
    --pool 'cPVrIpwC' \
    > test.out 2>&1
eval_tap $? 26 'GetPlayerMetric' test.out

#- 27 AdminGetMatchPoolTickets
./ng net.accelbyte.sdk.cli.Main match2 adminGetMatchPoolTickets \
    --namespace "$AB_NAMESPACE" \
    --pool 'LfRbbS76' \
    --limit '59' \
    --offset '65' \
    > test.out 2>&1
eval_tap $? 27 'AdminGetMatchPoolTickets' test.out

#- 28 CreateMatchTicket
./ng net.accelbyte.sdk.cli.Main match2 createMatchTicket \
    --namespace "$AB_NAMESPACE" \
    --body '{"attributes": {"Q8EPs7m1": {}, "ydU0PNfY": {}, "mWK6LwkR": {}}, "excludedSessions": ["OR7QDw42", "hjadUuUe", "HzFOCH5s"], "latencies": {"NL235J2H": 41, "QqKhGsjW": 30, "FdmMKdJC": 17}, "matchPool": "UL43mDsH", "sessionID": "ajAG5d7U", "storage": {"d07WPgQr": {}, "jvIenEsk": {}, "B4BxnmbN": {}}}' \
    > test.out 2>&1
eval_tap $? 28 'CreateMatchTicket' test.out

#- 29 GetMyMatchTickets
./ng net.accelbyte.sdk.cli.Main match2 getMyMatchTickets \
    --namespace "$AB_NAMESPACE" \
    --limit '51' \
    --matchPool 'giCeocpd' \
    --offset '34' \
    > test.out 2>&1
eval_tap $? 29 'GetMyMatchTickets' test.out

#- 30 MatchTicketDetails
./ng net.accelbyte.sdk.cli.Main match2 matchTicketDetails \
    --namespace "$AB_NAMESPACE" \
    --ticketid 'UfIpCpBA' \
    > test.out 2>&1
eval_tap $? 30 'MatchTicketDetails' test.out

#- 31 DeleteMatchTicket
./ng net.accelbyte.sdk.cli.Main match2 deleteMatchTicket \
    --namespace "$AB_NAMESPACE" \
    --ticketid 'r5TKRGra' \
    > test.out 2>&1
eval_tap $? 31 'DeleteMatchTicket' test.out

#- 32 RuleSetList
./ng net.accelbyte.sdk.cli.Main match2 ruleSetList \
    --namespace "$AB_NAMESPACE" \
    --limit '5' \
    --name 'D8w44UhF' \
    --offset '29' \
    > test.out 2>&1
eval_tap $? 32 'RuleSetList' test.out

#- 33 CreateRuleSet
./ng net.accelbyte.sdk.cli.Main match2 createRuleSet \
    --namespace "$AB_NAMESPACE" \
    --body '{"data": {"ccbc4HmG": {}, "7RhtFzfV": {}, "5FdBbPdS": {}}, "enable_custom_match_function": false, "name": "p6hnhAzu"}' \
    > test.out 2>&1
eval_tap $? 33 'CreateRuleSet' test.out

#- 34 RuleSetDetails
./ng net.accelbyte.sdk.cli.Main match2 ruleSetDetails \
    --namespace "$AB_NAMESPACE" \
    --ruleset 'pPlWguXv' \
    > test.out 2>&1
eval_tap $? 34 'RuleSetDetails' test.out

#- 35 UpdateRuleSet
./ng net.accelbyte.sdk.cli.Main match2 updateRuleSet \
    --namespace "$AB_NAMESPACE" \
    --ruleset 'VxSylS5j' \
    --body '{"data": {"leal0Fkx": {}, "4G1NxoAZ": {}, "zI4joIVN": {}}, "enable_custom_match_function": false, "name": "UFA2PmeW"}' \
    > test.out 2>&1
eval_tap $? 35 'UpdateRuleSet' test.out

#- 36 DeleteRuleSet
./ng net.accelbyte.sdk.cli.Main match2 deleteRuleSet \
    --namespace "$AB_NAMESPACE" \
    --ruleset '26UMYrqG' \
    > test.out 2>&1
eval_tap $? 36 'DeleteRuleSet' test.out

#- 37 PublicGetPlayerMetric
./ng net.accelbyte.sdk.cli.Main match2 publicGetPlayerMetric \
    --namespace "$AB_NAMESPACE" \
    --pool 'N9BVE7C0' \
    > test.out 2>&1
eval_tap $? 37 'PublicGetPlayerMetric' test.out

#- 38 VersionCheckHandler
./ng net.accelbyte.sdk.cli.Main match2 versionCheckHandler \
    > test.out 2>&1
eval_tap $? 38 'VersionCheckHandler' test.out


rm -f "tmp.dat"

exit $EXIT_CODE