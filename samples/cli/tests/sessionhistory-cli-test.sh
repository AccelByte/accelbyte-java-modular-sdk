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
    --body '{"action": "jveY6G3R", "activeAllianceRule": {"max_number": 16, "min_number": 6, "player_max_number": 67, "player_min_number": 48}, "activeMatchingRule": [{"attribute": "amhjLros", "criteria": "sVAuNIJa", "reference": 0.526907886596126}, {"attribute": "dzvQvGrO", "criteria": "RjMtQRPw", "reference": 0.34446137925129583}, {"attribute": "vnOVLY8U", "criteria": "36StYUZb", "reference": 0.09734865086987043}], "function": "aoxxtli8", "gameMode": "QRoOSDy6", "isBackfillMatch": true, "isRuleSetFlexed": false, "iteration": 93, "matchID": "QAUVsWy5", "namespace": "AlYK8A4Y", "remainingPlayersPerTicket": [31, 81, 3], "remainingTickets": 16, "sessionTickID": "3wQF3d19", "tickID": 21, "ticketID": "Nr9bKvDF", "timeToMatchSec": 0.40016947594759045, "timestamp": "1985-02-06T00:00:00Z", "unbackfillReason": "B3IwRiuT", "unmatchReason": "kUd2543W"}' \
    > test.out 2>&1
eval_tap $? 2 'CreateXrayTicketObservability' test.out

#- 3 CreateXrayBulkTicketObservability
./ng net.accelbyte.sdk.cli.Main sessionhistory createXrayBulkTicketObservability \
    --namespace "$AB_NAMESPACE" \
    --body '{"ticketObservabilities": [{"action": "kXYW2NTu", "activeAllianceRule": {"max_number": 90, "min_number": 10, "player_max_number": 18, "player_min_number": 71}, "activeMatchingRule": [{"attribute": "sPomF2xQ", "criteria": "POXb0DhN", "reference": 0.26224221672954473}, {"attribute": "Xh7FBg0P", "criteria": "IP3vx1U2", "reference": 0.22160143287034306}, {"attribute": "sZZcNyOW", "criteria": "ri07MABM", "reference": 0.6287879434972652}], "function": "WKYZ3YGf", "gameMode": "FRW9QbrQ", "isBackfillMatch": true, "isRuleSetFlexed": false, "iteration": 49, "matchID": "ttZZSUsa", "namespace": "WF66DWRa", "remainingPlayersPerTicket": [54, 56, 43], "remainingTickets": 7, "sessionTickID": "SdwyVqy3", "tickID": 55, "ticketID": "wcKNmM1i", "timeToMatchSec": 0.8406000934602944, "timestamp": "1983-12-18T00:00:00Z", "unbackfillReason": "TtqjtgKJ", "unmatchReason": "QJZhDKM3"}, {"action": "Rw6swk67", "activeAllianceRule": {"max_number": 75, "min_number": 66, "player_max_number": 5, "player_min_number": 6}, "activeMatchingRule": [{"attribute": "VUMHKsDg", "criteria": "39yU7pj9", "reference": 0.07201326960872179}, {"attribute": "HTgYHCPe", "criteria": "76mZSWj3", "reference": 0.6465298458079634}, {"attribute": "BI1wERqA", "criteria": "tLisR70S", "reference": 0.5387682948414043}], "function": "vB37leS2", "gameMode": "5klxz3Jx", "isBackfillMatch": false, "isRuleSetFlexed": false, "iteration": 49, "matchID": "Wzh3Mp2U", "namespace": "v223dAF7", "remainingPlayersPerTicket": [80, 24, 30], "remainingTickets": 79, "sessionTickID": "jAT90o3T", "tickID": 30, "ticketID": "JPqYJ1dw", "timeToMatchSec": 0.38157622193558205, "timestamp": "1989-03-07T00:00:00Z", "unbackfillReason": "WbR5VZlF", "unmatchReason": "D9W2pVSl"}, {"action": "x7xIQt8F", "activeAllianceRule": {"max_number": 50, "min_number": 1, "player_max_number": 18, "player_min_number": 72}, "activeMatchingRule": [{"attribute": "NfOrHhv9", "criteria": "aaoOJ9Aa", "reference": 0.5853947087231836}, {"attribute": "TSRKifGk", "criteria": "3o6trkvv", "reference": 0.37208400055741986}, {"attribute": "gH1ByTuX", "criteria": "Knd72js1", "reference": 0.8488125111239792}], "function": "kT5v2fLw", "gameMode": "Q9cmD9Qf", "isBackfillMatch": true, "isRuleSetFlexed": false, "iteration": 63, "matchID": "46YYutnS", "namespace": "1m5kUsUG", "remainingPlayersPerTicket": [28, 36, 87], "remainingTickets": 14, "sessionTickID": "wpjKud9O", "tickID": 86, "ticketID": "tLpuFsBD", "timeToMatchSec": 0.6677863858340262, "timestamp": "1992-05-25T00:00:00Z", "unbackfillReason": "NczHdMc9", "unmatchReason": "i2v5rP6C"}]}' \
    > test.out 2>&1
eval_tap $? 3 'CreateXrayBulkTicketObservability' test.out


rm -f "tmp.dat"

exit $EXIT_CODE