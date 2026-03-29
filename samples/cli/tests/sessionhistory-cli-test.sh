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
    --body '{"action": "MIHMEhAf", "activeAllianceRule": {"max_number": 96, "min_number": 49, "player_max_number": 5, "player_min_number": 48}, "activeMatchingRule": [{"attribute": "L0D1zZQC", "criteria": "30XztGGe", "reference": 0.3897370039791397}, {"attribute": "Xt2qoMJE", "criteria": "qCzUnEVj", "reference": 0.0580676420639491}, {"attribute": "i6gqiSvK", "criteria": "l64xmKmq", "reference": 0.5866649854136341}], "function": "HbXojvCo", "gameMode": "Dtnx36Wg", "isBackfillMatch": true, "isRuleSetFlexed": true, "iteration": 19, "matchID": "BFmkyQyY", "namespace": "p4bAMJ0Y", "remainingPlayersPerTicket": [39, 26, 8], "remainingTickets": 98, "sessionTickID": "5y0m5LtI", "tickID": 100, "ticketID": "OBCqsgs0", "timeToMatchSec": 0.9015020386279279, "timestamp": "1977-10-30T00:00:00Z", "unbackfillReason": "ApuWL37k", "unmatchReason": "IRHVg06D"}' \
    > test.out 2>&1
eval_tap $? 2 'CreateXrayTicketObservability' test.out

#- 3 CreateXrayBulkTicketObservability
./ng net.accelbyte.sdk.cli.Main sessionhistory createXrayBulkTicketObservability \
    --namespace "$AB_NAMESPACE" \
    --body '{"ticketObservabilities": [{"action": "7CMnUsrX", "activeAllianceRule": {"max_number": 51, "min_number": 79, "player_max_number": 97, "player_min_number": 84}, "activeMatchingRule": [{"attribute": "bMa0GlMr", "criteria": "Rqg8q32g", "reference": 0.18195132247962698}, {"attribute": "hCvz6Ty9", "criteria": "LfCCOElI", "reference": 0.23229820429479164}, {"attribute": "1mxpW1em", "criteria": "ZkdRjvwK", "reference": 0.683611622797551}], "function": "Z2NTGPVb", "gameMode": "ARoMZqlo", "isBackfillMatch": true, "isRuleSetFlexed": true, "iteration": 50, "matchID": "Od8V7Vey", "namespace": "83e4W2RX", "remainingPlayersPerTicket": [67, 71, 40], "remainingTickets": 66, "sessionTickID": "6qa3Bfne", "tickID": 12, "ticketID": "Cgsconqr", "timeToMatchSec": 0.0025497667233992383, "timestamp": "1994-08-19T00:00:00Z", "unbackfillReason": "7TdQzMvV", "unmatchReason": "9M5i3HRz"}, {"action": "JKr8qgo1", "activeAllianceRule": {"max_number": 46, "min_number": 81, "player_max_number": 41, "player_min_number": 35}, "activeMatchingRule": [{"attribute": "38WDhJ8r", "criteria": "S4igPPKR", "reference": 0.39010027770137945}, {"attribute": "Oy0f3t1B", "criteria": "O86AcULl", "reference": 0.2639989336384775}, {"attribute": "TMhfP3HR", "criteria": "oFG6V7k8", "reference": 0.09986293866692542}], "function": "HYkpewgA", "gameMode": "HrtAWL2e", "isBackfillMatch": true, "isRuleSetFlexed": false, "iteration": 85, "matchID": "SeF2ovs9", "namespace": "E2lEb7wN", "remainingPlayersPerTicket": [82, 17, 23], "remainingTickets": 22, "sessionTickID": "MigYlDeI", "tickID": 81, "ticketID": "PoXKuL0x", "timeToMatchSec": 0.44430238371460506, "timestamp": "1995-07-26T00:00:00Z", "unbackfillReason": "xCKVSLiO", "unmatchReason": "2yqHVH68"}, {"action": "QkDKNxQt", "activeAllianceRule": {"max_number": 16, "min_number": 24, "player_max_number": 51, "player_min_number": 67}, "activeMatchingRule": [{"attribute": "FkPDJvXF", "criteria": "LBlLAM9E", "reference": 0.19855563843000879}, {"attribute": "PljBPmF2", "criteria": "rM4nXxxb", "reference": 0.6395018280218701}, {"attribute": "ss0FHmvS", "criteria": "N2ffvCPQ", "reference": 0.20155980976737897}], "function": "l9HWrQfF", "gameMode": "tTQtr9Rl", "isBackfillMatch": false, "isRuleSetFlexed": false, "iteration": 3, "matchID": "fOkN50b6", "namespace": "MMTb9KI1", "remainingPlayersPerTicket": [56, 22, 44], "remainingTickets": 26, "sessionTickID": "59n8ddEW", "tickID": 29, "ticketID": "g4A6F4Ap", "timeToMatchSec": 0.8445544643936206, "timestamp": "1986-03-28T00:00:00Z", "unbackfillReason": "spi5hqwp", "unmatchReason": "4NaFZvIt"}]}' \
    > test.out 2>&1
eval_tap $? 3 'CreateXrayBulkTicketObservability' test.out


rm -f "tmp.dat"

exit $EXIT_CODE