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
    --body '{"action": "aBPIyXJT", "activeAllianceRule": {"max_number": 24, "min_number": 97, "player_max_number": 60, "player_min_number": 91}, "activeMatchingRule": [{"attribute": "JIQB4zkC", "criteria": "q9CymCXE", "reference": 0.7926095387497157}, {"attribute": "lpJbJ4Lz", "criteria": "mxrhbEV9", "reference": 0.022788235909420362}, {"attribute": "Dr5YSFC7", "criteria": "SkyV8GgR", "reference": 0.8602310844589749}], "function": "kUg04te6", "gameMode": "vz8oTKNe", "isBackfillMatch": true, "isRuleSetFlexed": true, "iteration": 77, "matchID": "EAqJ9Rda", "namespace": "hRuPfXbI", "remainingPlayersPerTicket": [78, 26, 74], "remainingTickets": 49, "sessionTickID": "HSjXh3f8", "tickID": 54, "ticketID": "5RhG9bJd", "timeToMatchSec": 0.050332220902839175, "timestamp": "1972-06-28T00:00:00Z", "unbackfillReason": "pI3ocirF", "unmatchReason": "s1Up187y"}' \
    > test.out 2>&1
eval_tap $? 2 'CreateXrayTicketObservability' test.out

#- 3 CreateXrayBulkTicketObservability
./ng net.accelbyte.sdk.cli.Main sessionhistory createXrayBulkTicketObservability \
    --namespace "$AB_NAMESPACE" \
    --body '{"ticketObservabilities": [{"action": "indsAHfj", "activeAllianceRule": {"max_number": 4, "min_number": 44, "player_max_number": 48, "player_min_number": 100}, "activeMatchingRule": [{"attribute": "k4gbS9x1", "criteria": "VgZIfO6m", "reference": 0.37166726188219135}, {"attribute": "PyAtpfAV", "criteria": "b0mENXYm", "reference": 0.7923779540233121}, {"attribute": "1ioWAP0c", "criteria": "xqQd7tTs", "reference": 0.2326049979667988}], "function": "LPTsNbvM", "gameMode": "Wwv4T7CD", "isBackfillMatch": true, "isRuleSetFlexed": true, "iteration": 5, "matchID": "ilnbfRgF", "namespace": "SHRgG6X5", "remainingPlayersPerTicket": [2, 72, 86], "remainingTickets": 40, "sessionTickID": "GDKkQ8Qr", "tickID": 88, "ticketID": "DCFKMQaZ", "timeToMatchSec": 0.028240527960050388, "timestamp": "1988-11-18T00:00:00Z", "unbackfillReason": "dW701G7P", "unmatchReason": "mdcE3Gkt"}, {"action": "FaNXerRk", "activeAllianceRule": {"max_number": 100, "min_number": 78, "player_max_number": 93, "player_min_number": 23}, "activeMatchingRule": [{"attribute": "PXXoiLgY", "criteria": "gSTuruPT", "reference": 0.12426889265578633}, {"attribute": "IX6Kjjiv", "criteria": "AbJO2Inu", "reference": 0.70942725183526}, {"attribute": "kfH88kjJ", "criteria": "5Sd8KvJ3", "reference": 0.4176568984107887}], "function": "DdBnDRJC", "gameMode": "d5evA2Uf", "isBackfillMatch": false, "isRuleSetFlexed": false, "iteration": 81, "matchID": "Jg8RvLga", "namespace": "dF8Q4CwE", "remainingPlayersPerTicket": [81, 35, 66], "remainingTickets": 57, "sessionTickID": "CbIOuqu5", "tickID": 39, "ticketID": "kxfZs1Kj", "timeToMatchSec": 0.35743737073510373, "timestamp": "1977-02-17T00:00:00Z", "unbackfillReason": "UkKNtI2G", "unmatchReason": "QYYSEv0r"}, {"action": "GGMUbA2j", "activeAllianceRule": {"max_number": 45, "min_number": 23, "player_max_number": 34, "player_min_number": 81}, "activeMatchingRule": [{"attribute": "kxNb59Jh", "criteria": "eYFQESaX", "reference": 0.4876722575835587}, {"attribute": "Thv5e1up", "criteria": "D21i0nPL", "reference": 0.12340040104866112}, {"attribute": "URv1JkbL", "criteria": "Mu1GNQ2o", "reference": 0.8908161073355763}], "function": "s2QCB387", "gameMode": "rf9OBEQj", "isBackfillMatch": true, "isRuleSetFlexed": false, "iteration": 91, "matchID": "EA2ndOjW", "namespace": "XXRy9Zun", "remainingPlayersPerTicket": [39, 30, 65], "remainingTickets": 74, "sessionTickID": "ay7RKMQS", "tickID": 92, "ticketID": "eJVOS3yl", "timeToMatchSec": 0.5293814470128334, "timestamp": "1992-05-19T00:00:00Z", "unbackfillReason": "i67tcFth", "unmatchReason": "oK6gkXKA"}]}' \
    > test.out 2>&1
eval_tap $? 3 'CreateXrayBulkTicketObservability' test.out


rm -f "tmp.dat"

exit $EXIT_CODE