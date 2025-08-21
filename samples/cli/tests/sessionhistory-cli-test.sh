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
    --body '{"action": "yn4zZm0E", "activeAllianceRule": {"max_number": 28, "min_number": 61, "player_max_number": 31, "player_min_number": 17}, "activeMatchingRule": [{"attribute": "h2RCAs57", "criteria": "Kwyili1y", "reference": 0.3662498935473816}, {"attribute": "yxzjI84E", "criteria": "52Yse59r", "reference": 0.3997802659949349}, {"attribute": "WeOGNN44", "criteria": "raozu5z4", "reference": 0.06694217791761825}], "function": "HG08cJoH", "gameMode": "YQlx3GFE", "isBackfillMatch": true, "isRuleSetFlexed": true, "iteration": 90, "matchID": "DI8mwfhk", "namespace": "Hb6eET9Z", "remainingPlayersPerTicket": [59, 96, 59], "remainingTickets": 44, "sessionTickID": "3eTXPXDf", "tickID": 33, "ticketID": "GsV6uxBw", "timeToMatchSec": 0.5819976803501318, "timestamp": "1983-11-16T00:00:00Z", "unbackfillReason": "NsAObkWI", "unmatchReason": "IWZ5SDoU"}' \
    > test.out 2>&1
eval_tap $? 2 'CreateXrayTicketObservability' test.out

#- 3 CreateXrayBulkTicketObservability
./ng net.accelbyte.sdk.cli.Main sessionhistory createXrayBulkTicketObservability \
    --namespace "$AB_NAMESPACE" \
    --body '{"ticketObservabilities": [{"action": "8nxiGtlP", "activeAllianceRule": {"max_number": 92, "min_number": 5, "player_max_number": 51, "player_min_number": 5}, "activeMatchingRule": [{"attribute": "NGtbu8zu", "criteria": "AiMWKYDq", "reference": 0.5044109199847714}, {"attribute": "uUk4v9jP", "criteria": "xEasC0KV", "reference": 0.7749609034254343}, {"attribute": "yGlqzQmE", "criteria": "SHDiJLbU", "reference": 0.06912626506646613}], "function": "MBvgO58E", "gameMode": "QqXaJTQg", "isBackfillMatch": true, "isRuleSetFlexed": false, "iteration": 80, "matchID": "PIBrEAUO", "namespace": "bEhG9fux", "remainingPlayersPerTicket": [40, 42, 44], "remainingTickets": 90, "sessionTickID": "QQErputW", "tickID": 78, "ticketID": "k2Bu6MtL", "timeToMatchSec": 0.8070208929120665, "timestamp": "1993-04-02T00:00:00Z", "unbackfillReason": "MPCFjJct", "unmatchReason": "ZBcyMKlA"}, {"action": "nlaoTbiQ", "activeAllianceRule": {"max_number": 96, "min_number": 84, "player_max_number": 49, "player_min_number": 81}, "activeMatchingRule": [{"attribute": "ltDipDfV", "criteria": "wVRWVJWB", "reference": 0.19028236925242847}, {"attribute": "p2GKzIvT", "criteria": "tgT2QtNh", "reference": 0.16823523354682146}, {"attribute": "uKVf5hSS", "criteria": "7UKnb27p", "reference": 0.5926049921624875}], "function": "xEyixAIz", "gameMode": "2CELm2yl", "isBackfillMatch": false, "isRuleSetFlexed": true, "iteration": 45, "matchID": "RuAtOuM1", "namespace": "408UMwpQ", "remainingPlayersPerTicket": [61, 74, 23], "remainingTickets": 36, "sessionTickID": "bB9fhRo4", "tickID": 47, "ticketID": "0weHQeoJ", "timeToMatchSec": 0.6774914442011565, "timestamp": "1980-04-21T00:00:00Z", "unbackfillReason": "umIEgHVN", "unmatchReason": "grYEojIx"}, {"action": "IzDMwhL2", "activeAllianceRule": {"max_number": 89, "min_number": 100, "player_max_number": 52, "player_min_number": 92}, "activeMatchingRule": [{"attribute": "6inRyGjO", "criteria": "2f1MDh7g", "reference": 0.8803485269741496}, {"attribute": "4sVuxeP1", "criteria": "6GOzj8Jr", "reference": 0.0611609504943178}, {"attribute": "KpxEb4d6", "criteria": "CqJO53rM", "reference": 0.9089159211030982}], "function": "pscctekh", "gameMode": "oFsgm7w9", "isBackfillMatch": true, "isRuleSetFlexed": false, "iteration": 47, "matchID": "zIKsyqR7", "namespace": "bLPgF9jh", "remainingPlayersPerTicket": [84, 34, 91], "remainingTickets": 16, "sessionTickID": "BH1BCxMy", "tickID": 56, "ticketID": "F5Ip1xre", "timeToMatchSec": 0.3988127869291276, "timestamp": "1995-12-12T00:00:00Z", "unbackfillReason": "UdlRXsgp", "unmatchReason": "wXw0ZyPY"}]}' \
    > test.out 2>&1
eval_tap $? 3 'CreateXrayBulkTicketObservability' test.out


rm -f "tmp.dat"

exit $EXIT_CODE