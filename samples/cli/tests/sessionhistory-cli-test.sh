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
    --body '{"action": "wMRE5WJx", "activeAllianceRule": {"max_number": 60, "min_number": 97, "player_max_number": 34, "player_min_number": 47}, "activeMatchingRule": [{"attribute": "HJEuWzQp", "criteria": "mJdvWi2H", "reference": 0.09053523695112886}, {"attribute": "0AXvBWIH", "criteria": "EBOmsVDv", "reference": 0.14946733691114733}, {"attribute": "dDA9Ko99", "criteria": "yxPvull3", "reference": 0.0853188653361332}], "function": "hRIdtFYC", "gameMode": "uyl2oWk1", "isBackfillMatch": false, "isRuleSetFlexed": false, "iteration": 43, "matchID": "uPu5GcNo", "namespace": "Qep47ko0", "remainingPlayersPerTicket": [10, 23, 91], "remainingTickets": 72, "sessionTickID": "8Ah1vtfM", "tickID": 14, "ticketID": "PznC3EUF", "timeToMatchSec": 0.24528256065208653, "timestamp": "1978-09-03T00:00:00Z", "unbackfillReason": "hGeliUD9", "unmatchReason": "XwSBSYhF"}' \
    > test.out 2>&1
eval_tap $? 2 'CreateXrayTicketObservability' test.out

#- 3 CreateXrayBulkTicketObservability
./ng net.accelbyte.sdk.cli.Main sessionhistory createXrayBulkTicketObservability \
    --namespace "$AB_NAMESPACE" \
    --body '{"ticketObservabilities": [{"action": "PuhMVlMI", "activeAllianceRule": {"max_number": 74, "min_number": 27, "player_max_number": 43, "player_min_number": 88}, "activeMatchingRule": [{"attribute": "2y1KDYF3", "criteria": "DVNxAgDc", "reference": 0.33021986502146483}, {"attribute": "qPwxS5Uh", "criteria": "stdYZvtN", "reference": 0.8611994944189542}, {"attribute": "T1n7WNX8", "criteria": "hw00U11w", "reference": 0.18180676507505644}], "function": "fP76Oq6D", "gameMode": "1BNEhla4", "isBackfillMatch": false, "isRuleSetFlexed": false, "iteration": 65, "matchID": "1ZIuSyyD", "namespace": "NP2NVG8o", "remainingPlayersPerTicket": [45, 27, 41], "remainingTickets": 39, "sessionTickID": "KUr1St28", "tickID": 81, "ticketID": "9XxFXNkh", "timeToMatchSec": 0.24683203450489932, "timestamp": "1981-08-12T00:00:00Z", "unbackfillReason": "2ttjFhKJ", "unmatchReason": "B6ofaMES"}, {"action": "OjWGqDIb", "activeAllianceRule": {"max_number": 68, "min_number": 17, "player_max_number": 68, "player_min_number": 38}, "activeMatchingRule": [{"attribute": "b5mUuVbp", "criteria": "uQvDwinu", "reference": 0.5089020089162162}, {"attribute": "kz3v23F0", "criteria": "WhHYBX7w", "reference": 0.9422964354560095}, {"attribute": "QwhEIuyp", "criteria": "wvPZ1hZe", "reference": 0.12760784804645986}], "function": "WLVkOPuD", "gameMode": "dcpoQvQa", "isBackfillMatch": true, "isRuleSetFlexed": true, "iteration": 73, "matchID": "Lmlfode4", "namespace": "xDQdK5p4", "remainingPlayersPerTicket": [37, 92, 41], "remainingTickets": 66, "sessionTickID": "I5pCESFR", "tickID": 57, "ticketID": "bkPbLZ1B", "timeToMatchSec": 0.20715135146591368, "timestamp": "1979-05-03T00:00:00Z", "unbackfillReason": "gV8Hk7XJ", "unmatchReason": "HI6Hl77l"}, {"action": "8V6B5EfU", "activeAllianceRule": {"max_number": 20, "min_number": 92, "player_max_number": 0, "player_min_number": 59}, "activeMatchingRule": [{"attribute": "Tj0mimtJ", "criteria": "nuLM8Y5N", "reference": 0.2136459633290385}, {"attribute": "lCJXHB1Q", "criteria": "IbhBPixY", "reference": 0.4253371977954794}, {"attribute": "9HR1Mt5t", "criteria": "sva3nmvv", "reference": 0.9389443404967567}], "function": "vVy8WYLI", "gameMode": "ekOAzLli", "isBackfillMatch": true, "isRuleSetFlexed": true, "iteration": 14, "matchID": "OCYO1TEp", "namespace": "tIpNIoxd", "remainingPlayersPerTicket": [37, 46, 85], "remainingTickets": 19, "sessionTickID": "UzKrSS36", "tickID": 29, "ticketID": "WtZHICH8", "timeToMatchSec": 0.9853442246107592, "timestamp": "1999-05-22T00:00:00Z", "unbackfillReason": "bCxXNXQU", "unmatchReason": "WBJHNV3x"}]}' \
    > test.out 2>&1
eval_tap $? 3 'CreateXrayBulkTicketObservability' test.out


rm -f "tmp.dat"

exit $EXIT_CODE