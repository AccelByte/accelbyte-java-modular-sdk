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
    --body '{"action": "ma639Bwz", "activeAllianceRule": {"max_number": 44, "min_number": 32, "player_max_number": 42, "player_min_number": 18}, "activeMatchingRule": [{"attribute": "VIn0STba", "criteria": "MuGyNkzG", "reference": 0.03723532959166442}, {"attribute": "I7WQlk1E", "criteria": "uJkRTHOi", "reference": 0.6291418848897438}, {"attribute": "0Qjubpof", "criteria": "hq5lGLHI", "reference": 0.9146072542285307}], "function": "GER02oen", "gameMode": "ILeKRtKP", "isBackfillMatch": true, "isRuleSetFlexed": true, "iteration": 79, "matchID": "MMFAHmFU", "namespace": "QYOz0bbN", "remainingPlayersPerTicket": [66, 3, 36], "remainingTickets": 3, "sessionTickID": "suVAp19O", "tickID": 44, "ticketID": "aoAv0hth", "timeToMatchSec": 0.5570324425161003, "timestamp": "1994-05-24T00:00:00Z", "unbackfillReason": "tYhOr9yZ", "unmatchReason": "dFukQCR0"}' \
    > test.out 2>&1
eval_tap $? 2 'CreateXrayTicketObservability' test.out

#- 3 CreateXrayBulkTicketObservability
./ng net.accelbyte.sdk.cli.Main sessionhistory createXrayBulkTicketObservability \
    --namespace "$AB_NAMESPACE" \
    --body '{"ticketObservabilities": [{"action": "DJCGftOO", "activeAllianceRule": {"max_number": 82, "min_number": 30, "player_max_number": 95, "player_min_number": 98}, "activeMatchingRule": [{"attribute": "JGnG9mbl", "criteria": "rvgwzCpK", "reference": 0.6671690507907587}, {"attribute": "f39ObDNF", "criteria": "Whlj9nSL", "reference": 0.7715416122409564}, {"attribute": "R1dbUlF7", "criteria": "UikEiU7z", "reference": 0.004292514965114624}], "function": "FZSkHeym", "gameMode": "PgjrB3nQ", "isBackfillMatch": false, "isRuleSetFlexed": true, "iteration": 68, "matchID": "hCmE7R94", "namespace": "ydzhUZP9", "remainingPlayersPerTicket": [100, 25, 35], "remainingTickets": 66, "sessionTickID": "cdDIXR8W", "tickID": 62, "ticketID": "QVbFHNFw", "timeToMatchSec": 0.5008033417997683, "timestamp": "1993-10-12T00:00:00Z", "unbackfillReason": "vJjXS5nK", "unmatchReason": "Q3ifGMe2"}, {"action": "U2KaqoCx", "activeAllianceRule": {"max_number": 28, "min_number": 12, "player_max_number": 11, "player_min_number": 78}, "activeMatchingRule": [{"attribute": "Xpo30TaG", "criteria": "cp0kwD92", "reference": 0.9489091714847758}, {"attribute": "odYBjiS9", "criteria": "T3L7X7bO", "reference": 0.44927160235938324}, {"attribute": "Fp1EbuF6", "criteria": "tagP8Gur", "reference": 0.6590348861627979}], "function": "BEXKZJxz", "gameMode": "0kT6d8Ak", "isBackfillMatch": true, "isRuleSetFlexed": true, "iteration": 24, "matchID": "tCvEFEHr", "namespace": "ICMRKv4y", "remainingPlayersPerTicket": [78, 77, 75], "remainingTickets": 40, "sessionTickID": "kHiWuXCX", "tickID": 67, "ticketID": "WC2kH2pi", "timeToMatchSec": 0.5810534610489153, "timestamp": "1998-03-31T00:00:00Z", "unbackfillReason": "wHFIqttN", "unmatchReason": "UxSLbB9K"}, {"action": "ZZAf9K3D", "activeAllianceRule": {"max_number": 71, "min_number": 92, "player_max_number": 34, "player_min_number": 67}, "activeMatchingRule": [{"attribute": "DV9blJq2", "criteria": "ggg4r1EL", "reference": 0.9431501084116605}, {"attribute": "HMpJ7T2Y", "criteria": "mhBPbcSM", "reference": 0.39898084469399797}, {"attribute": "Q0XriH3s", "criteria": "4efW3XI5", "reference": 0.2104836491022044}], "function": "sG06na9i", "gameMode": "PEZVnVDU", "isBackfillMatch": false, "isRuleSetFlexed": true, "iteration": 74, "matchID": "cK923Lx9", "namespace": "dfZujHj2", "remainingPlayersPerTicket": [52, 51, 67], "remainingTickets": 72, "sessionTickID": "k15jzLQI", "tickID": 3, "ticketID": "sQTl95tf", "timeToMatchSec": 0.6560902882433647, "timestamp": "1997-06-30T00:00:00Z", "unbackfillReason": "fTt3FutX", "unmatchReason": "TudF12Pw"}]}' \
    > test.out 2>&1
eval_tap $? 3 'CreateXrayBulkTicketObservability' test.out


rm -f "tmp.dat"

exit $EXIT_CODE