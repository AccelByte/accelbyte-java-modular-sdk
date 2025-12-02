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
    --body '{"action": "wUfE4QiI", "activeAllianceRule": {"max_number": 1, "min_number": 70, "player_max_number": 6, "player_min_number": 46}, "activeMatchingRule": [{"attribute": "sTMpsVqP", "criteria": "n7uuLt9G", "reference": 0.9256411148020008}, {"attribute": "LrOD5yDt", "criteria": "KGjgZLXU", "reference": 0.06708798157314311}, {"attribute": "6lpjjizy", "criteria": "NWEr5cNp", "reference": 0.252930824532685}], "function": "gvwrjHat", "gameMode": "oFnulyAF", "isBackfillMatch": false, "isRuleSetFlexed": false, "iteration": 87, "matchID": "He4MHdyM", "namespace": "p8r4JhGW", "remainingPlayersPerTicket": [15, 99, 42], "remainingTickets": 70, "sessionTickID": "kuu4QkpL", "tickID": 89, "ticketID": "grcPr2Ai", "timeToMatchSec": 0.06794987875745973, "timestamp": "1995-10-26T00:00:00Z", "unbackfillReason": "23RwGgrQ", "unmatchReason": "3OrKqXlQ"}' \
    > test.out 2>&1
eval_tap $? 2 'CreateXrayTicketObservability' test.out

#- 3 CreateXrayBulkTicketObservability
./ng net.accelbyte.sdk.cli.Main sessionhistory createXrayBulkTicketObservability \
    --namespace "$AB_NAMESPACE" \
    --body '{"ticketObservabilities": [{"action": "EAonm5gb", "activeAllianceRule": {"max_number": 40, "min_number": 50, "player_max_number": 9, "player_min_number": 10}, "activeMatchingRule": [{"attribute": "NhTkO20y", "criteria": "ynTXEhkD", "reference": 0.8166213968979474}, {"attribute": "oS9TmmZ6", "criteria": "8ySa6qdl", "reference": 0.7831088488626659}, {"attribute": "nE3SLEmH", "criteria": "m7eqI3hv", "reference": 0.44775506292989653}], "function": "eQHSpXZ7", "gameMode": "l5O04YDK", "isBackfillMatch": true, "isRuleSetFlexed": false, "iteration": 73, "matchID": "eW8y4Xod", "namespace": "7nTT7G1M", "remainingPlayersPerTicket": [4, 28, 99], "remainingTickets": 18, "sessionTickID": "htL8dfmA", "tickID": 32, "ticketID": "scHr8d5o", "timeToMatchSec": 0.6757039753238474, "timestamp": "1992-09-29T00:00:00Z", "unbackfillReason": "rcMM0Drh", "unmatchReason": "SbzBig3O"}, {"action": "sCB2zp5l", "activeAllianceRule": {"max_number": 92, "min_number": 61, "player_max_number": 46, "player_min_number": 19}, "activeMatchingRule": [{"attribute": "LEAelSh7", "criteria": "NPjcqake", "reference": 0.2644128619858842}, {"attribute": "KuwV1V0D", "criteria": "SwuWcogg", "reference": 0.2908535935527512}, {"attribute": "nIv8UMue", "criteria": "76j94ly2", "reference": 0.16856013562324035}], "function": "9YVuTB9p", "gameMode": "rWcRb7Tb", "isBackfillMatch": true, "isRuleSetFlexed": true, "iteration": 65, "matchID": "xILARFz8", "namespace": "za6oHJwN", "remainingPlayersPerTicket": [52, 24, 80], "remainingTickets": 94, "sessionTickID": "hUgDISbl", "tickID": 0, "ticketID": "iGj4WdP4", "timeToMatchSec": 0.1703233133807479, "timestamp": "1988-04-29T00:00:00Z", "unbackfillReason": "VnnpOoxx", "unmatchReason": "8E4W21yT"}, {"action": "PXzwDgMK", "activeAllianceRule": {"max_number": 81, "min_number": 48, "player_max_number": 20, "player_min_number": 92}, "activeMatchingRule": [{"attribute": "YDUVVqTq", "criteria": "0SK1NruC", "reference": 0.476423981528837}, {"attribute": "WBZknUeK", "criteria": "oDViFwdC", "reference": 0.23019984645320413}, {"attribute": "Te67t8ej", "criteria": "Hvb8pigH", "reference": 0.017310828079226015}], "function": "69BWdnPC", "gameMode": "dFceL9fI", "isBackfillMatch": false, "isRuleSetFlexed": false, "iteration": 50, "matchID": "g22bTjgr", "namespace": "SYBz3XqP", "remainingPlayersPerTicket": [80, 83, 18], "remainingTickets": 77, "sessionTickID": "WOvWbHYE", "tickID": 35, "ticketID": "rEngMbbS", "timeToMatchSec": 0.5363110697611491, "timestamp": "1992-02-05T00:00:00Z", "unbackfillReason": "0S6M42Qn", "unmatchReason": "DUienrwJ"}]}' \
    > test.out 2>&1
eval_tap $? 3 'CreateXrayBulkTicketObservability' test.out


rm -f "tmp.dat"

exit $EXIT_CODE