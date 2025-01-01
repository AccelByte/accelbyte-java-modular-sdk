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
echo "1..37"

#- 1 Login
./ng net.accelbyte.sdk.cli.Main loginClient \
    > test.out 2>&1
eval_tap $? 1 'Login' test.out

if [ $EXIT_CODE -ne 0 ]; then
  echo "Bail out! Login failed."
  exit $EXIT_CODE
fi

touch "tmp.dat"

#- 2 GetHealthcheckInfo
./ng net.accelbyte.sdk.cli.Main sessionhistory getHealthcheckInfo \
    > test.out 2>&1
eval_tap $? 2 'GetHealthcheckInfo' test.out

#- 3 GetHealthcheckInfoV1
./ng net.accelbyte.sdk.cli.Main sessionhistory getHealthcheckInfoV1 \
    > test.out 2>&1
eval_tap $? 3 'GetHealthcheckInfoV1' test.out

#- 4 AdminGetLogConfig
./ng net.accelbyte.sdk.cli.Main sessionhistory adminGetLogConfig \
    > test.out 2>&1
eval_tap $? 4 'AdminGetLogConfig' test.out

#- 5 AdminPatchUpdateLogConfig
./ng net.accelbyte.sdk.cli.Main sessionhistory adminPatchUpdateLogConfig \
    --body '{"logLevel": "fatal"}' \
    > test.out 2>&1
eval_tap $? 5 'AdminPatchUpdateLogConfig' test.out

#- 6 AdminQueryGameSessionDetail
./ng net.accelbyte.sdk.cli.Main sessionhistory adminQueryGameSessionDetail \
    --namespace "$AB_NAMESPACE" \
    --endDate 'XJ7lU8Am' \
    --gameSessionID 'wHXOw8Mk' \
    --limit '13' \
    --offset '80' \
    --order 'E5g7WktE' \
    --orderBy 'ebejteBS' \
    --startDate 'PwBeheEE' \
    --userID '73upHvAj' \
    > test.out 2>&1
eval_tap $? 6 'AdminQueryGameSessionDetail' test.out

#- 7 GetGameSessionDetail
./ng net.accelbyte.sdk.cli.Main sessionhistory getGameSessionDetail \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'IP7XN0uu' \
    > test.out 2>&1
eval_tap $? 7 'GetGameSessionDetail' test.out

#- 8 AdminQueryMatchmakingDetail
./ng net.accelbyte.sdk.cli.Main sessionhistory adminQueryMatchmakingDetail \
    --namespace "$AB_NAMESPACE" \
    --gameSessionID 'bOAYrj3l' \
    --limit '60' \
    --offset '63' \
    --order 'SKinyUou' \
    --orderBy 'B9hKPwdx' \
    --ticketID '7yrO8njU' \
    --userID 'wzxRi4tw' \
    > test.out 2>&1
eval_tap $? 8 'AdminQueryMatchmakingDetail' test.out

#- 9 AdminGetMatchmakingDetailBySessionID
./ng net.accelbyte.sdk.cli.Main sessionhistory adminGetMatchmakingDetailBySessionID \
    --namespace "$AB_NAMESPACE" \
    --sessionId '3Q7NnU1y' \
    > test.out 2>&1
eval_tap $? 9 'AdminGetMatchmakingDetailBySessionID' test.out

#- 10 AdminGetMatchmakingDetailByTicketID
./ng net.accelbyte.sdk.cli.Main sessionhistory adminGetMatchmakingDetailByTicketID \
    --namespace "$AB_NAMESPACE" \
    --ticketId 'GcpON7Sx' \
    > test.out 2>&1
eval_tap $? 10 'AdminGetMatchmakingDetailByTicketID' test.out

#- 11 AdminQueryPartyDetail
./ng net.accelbyte.sdk.cli.Main sessionhistory adminQueryPartyDetail \
    --namespace "$AB_NAMESPACE" \
    --limit '5' \
    --offset '63' \
    --order 'AofADyBE' \
    --orderBy 'LIPVTrbS' \
    --partyID 'UfuYnh4b' \
    --userID 'LIZFVtLI' \
    > test.out 2>&1
eval_tap $? 11 'AdminQueryPartyDetail' test.out

#- 12 GetPartyDetail
./ng net.accelbyte.sdk.cli.Main sessionhistory getPartyDetail \
    --namespace "$AB_NAMESPACE" \
    --sessionId '1oX0kdO8' \
    > test.out 2>&1
eval_tap $? 12 'GetPartyDetail' test.out

#- 13 AdminQueryTicketDetail
./ng net.accelbyte.sdk.cli.Main sessionhistory adminQueryTicketDetail \
    --namespace "$AB_NAMESPACE" \
    --endDate '1bOpjwwo' \
    --gameMode 'GuVaVcTm' \
    --limit '91' \
    --offset '92' \
    --order 'jlgr8kIV' \
    --partyID '8B0iWbLe' \
    --region 's8y8t0MZ' \
    --startDate 'RaeHZhZg' \
    --userIDs 'JkAZGsmm' \
    > test.out 2>&1
eval_tap $? 13 'AdminQueryTicketDetail' test.out

#- 14 AdminTicketDetailGetByTicketID
./ng net.accelbyte.sdk.cli.Main sessionhistory adminTicketDetailGetByTicketID \
    --namespace "$AB_NAMESPACE" \
    --ticketId 'wp7301Kp' \
    > test.out 2>&1
eval_tap $? 14 'AdminTicketDetailGetByTicketID' test.out

#- 15 PublicQueryGameSessionMe
./ng net.accelbyte.sdk.cli.Main sessionhistory publicQueryGameSessionMe \
    --namespace "$AB_NAMESPACE" \
    --limit '8' \
    --offset '50' \
    --order 'z6y4R3YG' \
    > test.out 2>&1
eval_tap $? 15 'PublicQueryGameSessionMe' test.out

#- 16 QueryXrayMatchPool
./ng net.accelbyte.sdk.cli.Main sessionhistory queryXrayMatchPool \
    --namespace "$AB_NAMESPACE" \
    --poolName 'QfDbnznL,vCl4XUK3,FgNjqDUt' \
    --endDate 's2r0dFsX' \
    --startDate 'aBzKFIOr' \
    > test.out 2>&1
eval_tap $? 16 'QueryXrayMatchPool' test.out

#- 17 QueryDetailTickMatchPool
./ng net.accelbyte.sdk.cli.Main sessionhistory queryDetailTickMatchPool \
    --namespace "$AB_NAMESPACE" \
    --podName 'eV83GUIc' \
    --poolName 'otuoOGFA' \
    --all  \
    --limit '47' \
    --offset '76' \
    --endDate 'Ie9WSNHx' \
    --startDate 'EPLV0Ew3' \
    > test.out 2>&1
eval_tap $? 17 'QueryDetailTickMatchPool' test.out

#- 18 QueryDetailTickMatchPoolMatches
./ng net.accelbyte.sdk.cli.Main sessionhistory queryDetailTickMatchPoolMatches \
    --namespace "$AB_NAMESPACE" \
    --podName 'cq9poSEo' \
    --poolName 'EFaq3wo3' \
    --tickId 'ADCUjg4P' \
    > test.out 2>&1
eval_tap $? 18 'QueryDetailTickMatchPoolMatches' test.out

#- 19 QueryDetailTickMatchPoolTicket
./ng net.accelbyte.sdk.cli.Main sessionhistory queryDetailTickMatchPoolTicket \
    --namespace "$AB_NAMESPACE" \
    --podName 'D99dAGps' \
    --poolName 'MZLmT6DB' \
    --tickId 'CdwpwPF4' \
    > test.out 2>&1
eval_tap $? 19 'QueryDetailTickMatchPoolTicket' test.out

#- 20 QueryMatchHistories
./ng net.accelbyte.sdk.cli.Main sessionhistory queryMatchHistories \
    --matchId 'XjuDq4Tn' \
    --namespace "$AB_NAMESPACE" \
    --limit '51' \
    --offset '27' \
    > test.out 2>&1
eval_tap $? 20 'QueryMatchHistories' test.out

#- 21 QueryMatchTicketHistories
./ng net.accelbyte.sdk.cli.Main sessionhistory queryMatchTicketHistories \
    --matchId 'cupijQlK' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 21 'QueryMatchTicketHistories' test.out

#- 22 QueryXrayMatch
./ng net.accelbyte.sdk.cli.Main sessionhistory queryXrayMatch \
    --matchId 'E21fn6rL' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 22 'QueryXrayMatch' test.out

#- 23 QueryAcquiringDS
./ng net.accelbyte.sdk.cli.Main sessionhistory queryAcquiringDS \
    --namespace "$AB_NAMESPACE" \
    --matchPool 'i0J90ue8,3b7z0K09,J8Z64bpI' \
    --endDate 'h3GgLIkY' \
    --startDate 'dOjXEDfr' \
    > test.out 2>&1
eval_tap $? 23 'QueryAcquiringDS' test.out

#- 24 QueryAcquiringDSWaitTimeAvg
./ng net.accelbyte.sdk.cli.Main sessionhistory queryAcquiringDSWaitTimeAvg \
    --namespace "$AB_NAMESPACE" \
    --matchPool 'qBb0e6W7,Fql1Ptpr,Y3t69OZv' \
    --endDate 'VT3u7j0d' \
    --startDate '7DuwxQTq' \
    > test.out 2>&1
eval_tap $? 24 'QueryAcquiringDSWaitTimeAvg' test.out

#- 25 QueryMatchLengthDurationpAvg
./ng net.accelbyte.sdk.cli.Main sessionhistory queryMatchLengthDurationpAvg \
    --namespace "$AB_NAMESPACE" \
    --matchPool 'JGXMo32K,D1z8Od2x,6tzgwlli' \
    --endDate 'u3xiZJra' \
    --startDate 'OyXmXnMc' \
    > test.out 2>&1
eval_tap $? 25 'QueryMatchLengthDurationpAvg' test.out

#- 26 QueryMatchLengthDurationp99
./ng net.accelbyte.sdk.cli.Main sessionhistory queryMatchLengthDurationp99 \
    --namespace "$AB_NAMESPACE" \
    --matchPool '3cW9heHB,Vp9oVMGc,rUJGidyn' \
    --endDate 'PFdFy6vs' \
    --startDate 'IcC4eoHH' \
    > test.out 2>&1
eval_tap $? 26 'QueryMatchLengthDurationp99' test.out

#- 27 QueryTotalActiveSession
./ng net.accelbyte.sdk.cli.Main sessionhistory queryTotalActiveSession \
    --namespace "$AB_NAMESPACE" \
    --matchPool 'CIyrrFT2,HjDxD6QH,3V6KoZDQ' \
    --region 'Rcn7PgJO' \
    --endDate 'ptvRJUeU' \
    --startDate 'RE4uBpgH' \
    > test.out 2>&1
eval_tap $? 27 'QueryTotalActiveSession' test.out

#- 28 QueryTotalMatchmakingMatch
./ng net.accelbyte.sdk.cli.Main sessionhistory queryTotalMatchmakingMatch \
    --namespace "$AB_NAMESPACE" \
    --matchPool 'zIUtWUOa,MolYYQ5J,HPzJ2xHK' \
    --endDate 'R8WS4I9P' \
    --startDate 'ByyhWFal' \
    > test.out 2>&1
eval_tap $? 28 'QueryTotalMatchmakingMatch' test.out

#- 29 QueryTotalPlayerPersession
./ng net.accelbyte.sdk.cli.Main sessionhistory queryTotalPlayerPersession \
    --namespace "$AB_NAMESPACE" \
    --matchPool 'PrTxEpIf,j7KOxfCm,D1aYEvmd' \
    --endDate 'h4g3eDhM' \
    --startDate 'jwwUg7Iq' \
    > test.out 2>&1
eval_tap $? 29 'QueryTotalPlayerPersession' test.out

#- 30 QueryTotalMatchmakingCanceled
./ng net.accelbyte.sdk.cli.Main sessionhistory queryTotalMatchmakingCanceled \
    --namespace "$AB_NAMESPACE" \
    --matchPool 'QW8VbTja,k6Y6q7Is,vfjicOdB' \
    --endDate 'Pzm02veU' \
    --startDate 'ARgQVLlP' \
    > test.out 2>&1
eval_tap $? 30 'QueryTotalMatchmakingCanceled' test.out

#- 31 QueryTotalMatchmakingCreated
./ng net.accelbyte.sdk.cli.Main sessionhistory queryTotalMatchmakingCreated \
    --namespace "$AB_NAMESPACE" \
    --matchPool 'OlVhXHrn,UXDWokDv,UVHBOxld' \
    --endDate 'gk6XNTlJ' \
    --startDate 'tjQyE1RJ' \
    > test.out 2>&1
eval_tap $? 31 'QueryTotalMatchmakingCreated' test.out

#- 32 QueryTotalMatchmakingExpired
./ng net.accelbyte.sdk.cli.Main sessionhistory queryTotalMatchmakingExpired \
    --namespace "$AB_NAMESPACE" \
    --matchPool 'uAqqAkuO,Ojcux1Id,fSrFudYV' \
    --endDate 'vBYjRnDh' \
    --startDate 'JjfCTGo7' \
    > test.out 2>&1
eval_tap $? 32 'QueryTotalMatchmakingExpired' test.out

#- 33 QueryTotalMatchmakingMatchTicket
./ng net.accelbyte.sdk.cli.Main sessionhistory queryTotalMatchmakingMatchTicket \
    --namespace "$AB_NAMESPACE" \
    --matchPool 'CouEGYzR,fUScE2Gz,L8I09lO2' \
    --endDate 'LQFFEG5Z' \
    --startDate 'tzExje5v' \
    > test.out 2>&1
eval_tap $? 33 'QueryTotalMatchmakingMatchTicket' test.out

#- 34 CreateXrayTicketObservability
./ng net.accelbyte.sdk.cli.Main sessionhistory createXrayTicketObservability \
    --namespace "$AB_NAMESPACE" \
    --body '{"action": "BT2ZK8HF", "activeAllianceRule": {"max_number": 0, "min_number": 68, "player_max_number": 0, "player_min_number": 36}, "activeMatchingRule": [{"attribute": "s2UZq1RI", "criteria": "AVIPSDQO", "reference": 0.2989764909930709}, {"attribute": "NKXqsggY", "criteria": "EC3Aogw1", "reference": 0.883244553678009}, {"attribute": "E34SqY4z", "criteria": "DOzGP34c", "reference": 0.9404405104151953}], "function": "RPdCaMUy", "gameMode": "AEo0UM8q", "isBackfillMatch": false, "isRuleSetFlexed": false, "iteration": 18, "matchID": "Xt30Gigs", "namespace": "EaRtIgkK", "remainingPlayersPerTicket": [15, 99, 87], "remainingTickets": 86, "sessionTickID": "3AtzkldM", "tickID": 25, "ticketID": "VRj4yHQ0", "timeToMatchSec": 0.6879369111720282, "timestamp": "1974-11-16T00:00:00Z", "unbackfillReason": "QUiGdk1R", "unmatchReason": "fcHU1nvC"}' \
    > test.out 2>&1
eval_tap $? 34 'CreateXrayTicketObservability' test.out

#- 35 CreateXrayBulkTicketObservability
./ng net.accelbyte.sdk.cli.Main sessionhistory createXrayBulkTicketObservability \
    --namespace "$AB_NAMESPACE" \
    --body '{"ticketObservabilities": [{"action": "BzmCrmyw", "activeAllianceRule": {"max_number": 85, "min_number": 46, "player_max_number": 99, "player_min_number": 19}, "activeMatchingRule": [{"attribute": "8NvXcc8O", "criteria": "yEwbjeKL", "reference": 0.33870248068398456}, {"attribute": "H2n9LVT8", "criteria": "mobGdqIk", "reference": 0.46890268423806636}, {"attribute": "y2iYkdho", "criteria": "VW4YGUWC", "reference": 0.99855954153073}], "function": "mg54IvZp", "gameMode": "2wtSzCft", "isBackfillMatch": false, "isRuleSetFlexed": true, "iteration": 68, "matchID": "99z2wBIT", "namespace": "jDv377EN", "remainingPlayersPerTicket": [7, 61, 69], "remainingTickets": 33, "sessionTickID": "BnXWo7US", "tickID": 48, "ticketID": "8X0r2URf", "timeToMatchSec": 0.7204447618267483, "timestamp": "1980-08-16T00:00:00Z", "unbackfillReason": "sYHUYSqA", "unmatchReason": "yQZWvi6b"}, {"action": "9DELtw3x", "activeAllianceRule": {"max_number": 6, "min_number": 52, "player_max_number": 25, "player_min_number": 18}, "activeMatchingRule": [{"attribute": "OyjSmsIc", "criteria": "7KRTI6SI", "reference": 0.7973317832746846}, {"attribute": "tfwQenX7", "criteria": "ai0JdH2z", "reference": 0.6273563584058038}, {"attribute": "wJ9mlSgK", "criteria": "Kxpe7IxQ", "reference": 0.9527664899752025}], "function": "0nWzmUIQ", "gameMode": "g25jK2nB", "isBackfillMatch": false, "isRuleSetFlexed": false, "iteration": 91, "matchID": "P3ci9pvs", "namespace": "2yuUFeia", "remainingPlayersPerTicket": [18, 82, 99], "remainingTickets": 31, "sessionTickID": "6cN1JAuY", "tickID": 25, "ticketID": "ljCyovJ9", "timeToMatchSec": 0.6950241976763553, "timestamp": "1990-04-19T00:00:00Z", "unbackfillReason": "9k1VP7mi", "unmatchReason": "MHJlHfPL"}, {"action": "Z0zP7dTV", "activeAllianceRule": {"max_number": 31, "min_number": 32, "player_max_number": 75, "player_min_number": 70}, "activeMatchingRule": [{"attribute": "k3Mm7Au3", "criteria": "Z7vLG0X1", "reference": 0.8142948215963486}, {"attribute": "xKBGYjy5", "criteria": "P0jYh1Lb", "reference": 0.1922951733813132}, {"attribute": "ZCvXNapD", "criteria": "BlkCVjHc", "reference": 0.6616400833046829}], "function": "fVpCuR1y", "gameMode": "jDXegNF0", "isBackfillMatch": true, "isRuleSetFlexed": false, "iteration": 97, "matchID": "SOV9GtCQ", "namespace": "Grm5sITZ", "remainingPlayersPerTicket": [20, 40, 29], "remainingTickets": 70, "sessionTickID": "boJZxEll", "tickID": 38, "ticketID": "eLqgL28v", "timeToMatchSec": 0.018348081339499056, "timestamp": "1996-03-14T00:00:00Z", "unbackfillReason": "cPrI0f9y", "unmatchReason": "bAFK0Nj7"}]}' \
    > test.out 2>&1
eval_tap $? 35 'CreateXrayBulkTicketObservability' test.out

#- 36 QueryXrayTimelineByTicketID
./ng net.accelbyte.sdk.cli.Main sessionhistory queryXrayTimelineByTicketID \
    --namespace "$AB_NAMESPACE" \
    --ticketId 'qSjviHMP' \
    --limit '52' \
    --offset '40' \
    --endDate 'wtObhS6I' \
    --startDate 'ihSCDmfF' \
    > test.out 2>&1
eval_tap $? 36 'QueryXrayTimelineByTicketID' test.out

#- 37 QueryXrayTimelineByUserID
./ng net.accelbyte.sdk.cli.Main sessionhistory queryXrayTimelineByUserID \
    --namespace "$AB_NAMESPACE" \
    --userId '0J14xHFl' \
    --limit '23' \
    --offset '14' \
    --endDate 'YuW0nChH' \
    --startDate 'tmwE78wH' \
    > test.out 2>&1
eval_tap $? 37 'QueryXrayTimelineByUserID' test.out


rm -f "tmp.dat"

exit $EXIT_CODE