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
    --body '{"action": "bvXjKfsa", "activeAllianceRule": {"max_number": 92, "min_number": 57, "player_max_number": 53, "player_min_number": 70}, "activeMatchingRule": [{"attribute": "KX7QaisW", "criteria": "ee7CfULs", "reference": 0.7103587468494664}, {"attribute": "JJ4bbMtW", "criteria": "kGvKa5j7", "reference": 0.4855810528094282}, {"attribute": "6kcG0hQt", "criteria": "s8EHtQFx", "reference": 0.4707049442456446}], "function": "xMx3c0tJ", "gameMode": "VmRhepEw", "isBackfillMatch": false, "isRuleSetFlexed": false, "iteration": 21, "matchID": "e3qdCdwc", "namespace": "lAnkUIU2", "remainingPlayersPerTicket": [29, 7, 22], "remainingTickets": 5, "sessionTickID": "YGLKlwBq", "tickID": 11, "ticketID": "aiyuWeEb", "timeToMatchSec": 0.9753017678392469, "timestamp": "1997-03-06T00:00:00Z", "unbackfillReason": "0VeRagy4", "unmatchReason": "oGkzyIpg"}' \
    > test.out 2>&1
eval_tap $? 2 'CreateXrayTicketObservability' test.out

#- 3 CreateXrayBulkTicketObservability
./ng net.accelbyte.sdk.cli.Main sessionhistory createXrayBulkTicketObservability \
    --namespace "$AB_NAMESPACE" \
    --body '{"ticketObservabilities": [{"action": "T544UPwu", "activeAllianceRule": {"max_number": 36, "min_number": 59, "player_max_number": 100, "player_min_number": 15}, "activeMatchingRule": [{"attribute": "74wA6qN2", "criteria": "tnjwjJqf", "reference": 0.9578354382595695}, {"attribute": "sEFIlMUt", "criteria": "mhFtmOoK", "reference": 0.696671392605569}, {"attribute": "SuraVu6x", "criteria": "8uS2SwmN", "reference": 0.9521540887961122}], "function": "0rBNU0Nq", "gameMode": "ripc4vBc", "isBackfillMatch": true, "isRuleSetFlexed": true, "iteration": 19, "matchID": "nUc3ODYK", "namespace": "9CJMOExS", "remainingPlayersPerTicket": [17, 80, 80], "remainingTickets": 44, "sessionTickID": "8uxxGoWQ", "tickID": 36, "ticketID": "RCyl0pyN", "timeToMatchSec": 0.7109120458210959, "timestamp": "1976-09-01T00:00:00Z", "unbackfillReason": "YewjFunT", "unmatchReason": "k7DOJgby"}, {"action": "nhDjCNqc", "activeAllianceRule": {"max_number": 45, "min_number": 47, "player_max_number": 70, "player_min_number": 18}, "activeMatchingRule": [{"attribute": "oTZbzS5L", "criteria": "j96n5V0U", "reference": 0.9533571999069201}, {"attribute": "irv4n5xr", "criteria": "27kzJLJB", "reference": 0.32682001675210304}, {"attribute": "m8G3X9vn", "criteria": "NfENyXhW", "reference": 0.8416582470978746}], "function": "MLyUpEQJ", "gameMode": "tkHLCj8t", "isBackfillMatch": false, "isRuleSetFlexed": true, "iteration": 57, "matchID": "Bp9tKXWg", "namespace": "ztnzEzAc", "remainingPlayersPerTicket": [24, 47, 9], "remainingTickets": 23, "sessionTickID": "E7q3UcC0", "tickID": 87, "ticketID": "UNcxG4BI", "timeToMatchSec": 0.512468822673205, "timestamp": "1985-10-21T00:00:00Z", "unbackfillReason": "borN6vTA", "unmatchReason": "JPo0S798"}, {"action": "eIrsG54Y", "activeAllianceRule": {"max_number": 37, "min_number": 35, "player_max_number": 5, "player_min_number": 19}, "activeMatchingRule": [{"attribute": "kCKzPZSI", "criteria": "gWMlllIm", "reference": 0.07154870703662974}, {"attribute": "99jOx9kQ", "criteria": "nkrVn8WF", "reference": 0.7182168631544298}, {"attribute": "RpEue7tm", "criteria": "L6UvO9YQ", "reference": 0.11131069125326654}], "function": "rGQXANL3", "gameMode": "WQlJV19x", "isBackfillMatch": true, "isRuleSetFlexed": true, "iteration": 13, "matchID": "Un0agong", "namespace": "Y9ppCiHT", "remainingPlayersPerTicket": [50, 67, 38], "remainingTickets": 48, "sessionTickID": "9r3v5l5n", "tickID": 86, "ticketID": "dr8NlAMx", "timeToMatchSec": 0.1478548880185141, "timestamp": "1996-10-23T00:00:00Z", "unbackfillReason": "B3CFh7x0", "unmatchReason": "QRLPYskK"}]}' \
    > test.out 2>&1
eval_tap $? 3 'CreateXrayBulkTicketObservability' test.out


rm -f "tmp.dat"

exit $EXIT_CODE