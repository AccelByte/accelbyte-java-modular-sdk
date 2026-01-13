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
echo "1..3"

#- 1 Login
./ng net.accelbyte.sdk.cli.Main loginClient \
    > test.out 2>&1
eval_tap $? 1 'Login' test.out

if [ $EXIT_CODE -ne 0 ]; then
  echo "Bail out! Login failed."
  exit $EXIT_CODE
fi

touch "tmp.dat"

#- 2 CreateXrayTicketObservability
./ng net.accelbyte.sdk.cli.Main sessionhistory createXrayTicketObservability \
    --namespace "$AB_NAMESPACE" \
    --body '{"action": "UZJBUT9K", "activeAllianceRule": {"max_number": 32, "min_number": 37, "player_max_number": 7, "player_min_number": 61}, "activeMatchingRule": [{"attribute": "4LUa8jAq", "criteria": "kJDBTCaS", "reference": 0.29795627763292654}, {"attribute": "UUU0JmhC", "criteria": "M2CViXSn", "reference": 0.6036061428292494}, {"attribute": "qfQuIetW", "criteria": "JQ0NL5M8", "reference": 0.324397229124876}], "function": "igPmmBY4", "gameMode": "8qIYwtXM", "isBackfillMatch": true, "isRuleSetFlexed": false, "iteration": 26, "matchID": "Tdb4yLzS", "namespace": "gA31Tu6P", "remainingPlayersPerTicket": [93, 65, 73], "remainingTickets": 42, "sessionTickID": "v3AzCxZk", "tickID": 9, "ticketID": "NKRdbVA1", "timeToMatchSec": 0.2291905614732137, "timestamp": "1975-04-14T00:00:00Z", "unbackfillReason": "5Corzgrd", "unmatchReason": "vnKe5cBL"}' \
    > test.out 2>&1
eval_tap $? 2 'CreateXrayTicketObservability' test.out

#- 3 CreateXrayBulkTicketObservability
./ng net.accelbyte.sdk.cli.Main sessionhistory createXrayBulkTicketObservability \
    --namespace "$AB_NAMESPACE" \
    --body '{"ticketObservabilities": [{"action": "kqTKkuPu", "activeAllianceRule": {"max_number": 10, "min_number": 54, "player_max_number": 43, "player_min_number": 77}, "activeMatchingRule": [{"attribute": "mAdrrZYU", "criteria": "nI395RaE", "reference": 0.03973445063734238}, {"attribute": "dZ0blf0H", "criteria": "mQHW4Cia", "reference": 0.7982997239652083}, {"attribute": "BE9IXr2f", "criteria": "CYjCMppi", "reference": 0.1812055428345608}], "function": "sksD0Jpp", "gameMode": "jBIz2vcM", "isBackfillMatch": false, "isRuleSetFlexed": true, "iteration": 69, "matchID": "82tROJ7i", "namespace": "zjVx0f3P", "remainingPlayersPerTicket": [76, 12, 42], "remainingTickets": 72, "sessionTickID": "01mcbkoA", "tickID": 39, "ticketID": "ONc42YOX", "timeToMatchSec": 0.13271081634074489, "timestamp": "1982-09-12T00:00:00Z", "unbackfillReason": "xIQr9nGK", "unmatchReason": "Rv1w1gYv"}, {"action": "8RoSIqKj", "activeAllianceRule": {"max_number": 77, "min_number": 28, "player_max_number": 68, "player_min_number": 3}, "activeMatchingRule": [{"attribute": "BtFx5CNc", "criteria": "WVYP62id", "reference": 0.11792212075997088}, {"attribute": "8E0xGvHT", "criteria": "bkVYWNfY", "reference": 0.090832628355768}, {"attribute": "Ul2uFTZg", "criteria": "tbeqJoBC", "reference": 0.13556308792463212}], "function": "RPKYmW5g", "gameMode": "YqXBakjf", "isBackfillMatch": true, "isRuleSetFlexed": true, "iteration": 74, "matchID": "br1i5oPe", "namespace": "7kzmhLyr", "remainingPlayersPerTicket": [96, 21, 39], "remainingTickets": 99, "sessionTickID": "fJ8zrbcU", "tickID": 48, "ticketID": "R96fhLVA", "timeToMatchSec": 0.9652377895354838, "timestamp": "1973-02-05T00:00:00Z", "unbackfillReason": "5PojHDqh", "unmatchReason": "RkUYaXnn"}, {"action": "d81TzeTR", "activeAllianceRule": {"max_number": 38, "min_number": 76, "player_max_number": 40, "player_min_number": 72}, "activeMatchingRule": [{"attribute": "Fr4XaWVu", "criteria": "Gg2e2MgQ", "reference": 0.5302861069787441}, {"attribute": "QHYs91F5", "criteria": "n8LDoiSK", "reference": 0.8269006079181886}, {"attribute": "lTmaabtw", "criteria": "u7rjWcnL", "reference": 0.5787927692165609}], "function": "FLEngnpu", "gameMode": "qvC6S0Al", "isBackfillMatch": true, "isRuleSetFlexed": false, "iteration": 55, "matchID": "EezooiRD", "namespace": "RViQFr5G", "remainingPlayersPerTicket": [41, 38, 11], "remainingTickets": 87, "sessionTickID": "otpisSzV", "tickID": 76, "ticketID": "114dWyn0", "timeToMatchSec": 0.9935981609075302, "timestamp": "1987-04-25T00:00:00Z", "unbackfillReason": "PQPo4DLs", "unmatchReason": "IviVycxH"}]}' \
    > test.out 2>&1
eval_tap $? 3 'CreateXrayBulkTicketObservability' test.out


rm -f "tmp.dat"

exit $EXIT_CODE