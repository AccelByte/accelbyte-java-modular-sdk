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
    --body '{"action": "LJfPm5VT", "activeAllianceRule": {"max_number": 14, "min_number": 26, "player_max_number": 69, "player_min_number": 98}, "activeMatchingRule": [{"attribute": "RlnwNunb", "criteria": "YAyeXHJs", "reference": 0.9027833509375801}, {"attribute": "2r3x5DrU", "criteria": "pkTzPB9k", "reference": 0.018174287489883034}, {"attribute": "HyRffs3z", "criteria": "z0fE3RCn", "reference": 0.35825150478796075}], "function": "rrAbCQM6", "gameMode": "OU8WZXqG", "isBackfillMatch": true, "isRuleSetFlexed": true, "iteration": 38, "matchID": "sQ2p6dxU", "namespace": "DJKlbxN6", "remainingPlayersPerTicket": [21, 42, 73], "remainingTickets": 99, "sessionTickID": "lxornCXA", "tickID": 61, "ticketID": "06Yk1nlv", "timeToMatchSec": 0.42297196011713545, "timestamp": "1996-12-15T00:00:00Z", "unbackfillReason": "ohfef7ta", "unmatchReason": "fRKBZ6h2"}' \
    > test.out 2>&1
eval_tap $? 2 'CreateXrayTicketObservability' test.out

#- 3 CreateXrayBulkTicketObservability
./ng net.accelbyte.sdk.cli.Main sessionhistory createXrayBulkTicketObservability \
    --namespace "$AB_NAMESPACE" \
    --body '{"ticketObservabilities": [{"action": "ngqslnog", "activeAllianceRule": {"max_number": 39, "min_number": 9, "player_max_number": 98, "player_min_number": 74}, "activeMatchingRule": [{"attribute": "cPk9eLfn", "criteria": "yZ6uEnLX", "reference": 0.6764634555163281}, {"attribute": "xSmdSq70", "criteria": "BzUkuFgQ", "reference": 0.3558242661263944}, {"attribute": "NnMW2Nk5", "criteria": "ovL1GOtr", "reference": 0.15837384853671144}], "function": "JZM9P8a9", "gameMode": "J88Z8gpi", "isBackfillMatch": true, "isRuleSetFlexed": false, "iteration": 9, "matchID": "oGm3p2qa", "namespace": "TckjtNR1", "remainingPlayersPerTicket": [1, 97, 95], "remainingTickets": 43, "sessionTickID": "B8Jzgt9S", "tickID": 29, "ticketID": "L9yX4PSg", "timeToMatchSec": 0.929894142734019, "timestamp": "1983-08-22T00:00:00Z", "unbackfillReason": "OvWBd6QN", "unmatchReason": "O9XZPYyn"}, {"action": "A9P9mQGh", "activeAllianceRule": {"max_number": 68, "min_number": 28, "player_max_number": 30, "player_min_number": 4}, "activeMatchingRule": [{"attribute": "M9v66Nfx", "criteria": "ArugfvA2", "reference": 0.3039242244688467}, {"attribute": "gD3mgmNa", "criteria": "irw631DN", "reference": 0.030016485279887095}, {"attribute": "qi3JnEf4", "criteria": "JAfE07au", "reference": 0.5528473932818886}], "function": "F8helaH0", "gameMode": "X0WvkqiQ", "isBackfillMatch": false, "isRuleSetFlexed": false, "iteration": 18, "matchID": "Q0EKWmxU", "namespace": "Zl3R2rTl", "remainingPlayersPerTicket": [1, 6, 25], "remainingTickets": 27, "sessionTickID": "0ctuwbN4", "tickID": 60, "ticketID": "PdY8BXpT", "timeToMatchSec": 0.6007006186165855, "timestamp": "1990-10-17T00:00:00Z", "unbackfillReason": "d07ShoUg", "unmatchReason": "cVtgWmTP"}, {"action": "yx9hwmYj", "activeAllianceRule": {"max_number": 51, "min_number": 80, "player_max_number": 14, "player_min_number": 19}, "activeMatchingRule": [{"attribute": "brGTKnqX", "criteria": "E7lTDK0l", "reference": 0.6747752745696285}, {"attribute": "W9TLa46D", "criteria": "6muudqs0", "reference": 0.9602807917922035}, {"attribute": "fqW9mYc7", "criteria": "msr5Qale", "reference": 0.39014918891160166}], "function": "TzUai2uA", "gameMode": "egC18PSJ", "isBackfillMatch": false, "isRuleSetFlexed": true, "iteration": 43, "matchID": "Ckbf5vqA", "namespace": "52Ly9Ig9", "remainingPlayersPerTicket": [59, 71, 73], "remainingTickets": 87, "sessionTickID": "XKOgIGwb", "tickID": 33, "ticketID": "isY3gcTs", "timeToMatchSec": 0.04291878544748007, "timestamp": "1980-07-28T00:00:00Z", "unbackfillReason": "9GagVqRo", "unmatchReason": "Xbh240ot"}]}' \
    > test.out 2>&1
eval_tap $? 3 'CreateXrayBulkTicketObservability' test.out


rm -f "tmp.dat"

exit $EXIT_CODE