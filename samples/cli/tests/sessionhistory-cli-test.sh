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
    --body '{"logLevel": "info"}' \
    > test.out 2>&1
eval_tap $? 5 'AdminPatchUpdateLogConfig' test.out

#- 6 AdminQueryGameSessionDetail
./ng net.accelbyte.sdk.cli.Main sessionhistory adminQueryGameSessionDetail \
    --namespace "$AB_NAMESPACE" \
    --endDate 'Pull8mqa' \
    --gameSessionID 'TEPBixl4' \
    --limit '51' \
    --offset '76' \
    --order '9oDQBYkg' \
    --orderBy 'RsumWUn8' \
    --startDate 'F5wfLxCj' \
    --userID 'lIactkyn' \
    > test.out 2>&1
eval_tap $? 6 'AdminQueryGameSessionDetail' test.out

#- 7 GetGameSessionDetail
./ng net.accelbyte.sdk.cli.Main sessionhistory getGameSessionDetail \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'PNAqbb47' \
    > test.out 2>&1
eval_tap $? 7 'GetGameSessionDetail' test.out

#- 8 AdminQueryMatchmakingDetail
./ng net.accelbyte.sdk.cli.Main sessionhistory adminQueryMatchmakingDetail \
    --namespace "$AB_NAMESPACE" \
    --gameSessionID 'tYrbmJt8' \
    --limit '69' \
    --offset '90' \
    --order 'z5fvDfXH' \
    --orderBy 'FqnM54gn' \
    --ticketID 'Ld5RcTEw' \
    --userID '3enXovhO' \
    > test.out 2>&1
eval_tap $? 8 'AdminQueryMatchmakingDetail' test.out

#- 9 AdminGetMatchmakingDetailBySessionID
./ng net.accelbyte.sdk.cli.Main sessionhistory adminGetMatchmakingDetailBySessionID \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'OjsEOmN2' \
    > test.out 2>&1
eval_tap $? 9 'AdminGetMatchmakingDetailBySessionID' test.out

#- 10 AdminGetMatchmakingDetailByTicketID
./ng net.accelbyte.sdk.cli.Main sessionhistory adminGetMatchmakingDetailByTicketID \
    --namespace "$AB_NAMESPACE" \
    --ticketId 'qzByqmsr' \
    > test.out 2>&1
eval_tap $? 10 'AdminGetMatchmakingDetailByTicketID' test.out

#- 11 AdminQueryPartyDetail
./ng net.accelbyte.sdk.cli.Main sessionhistory adminQueryPartyDetail \
    --namespace "$AB_NAMESPACE" \
    --limit '58' \
    --offset '48' \
    --order 'HJxyO6k9' \
    --orderBy 'THd2ctr3' \
    --partyID 'ed8Mllg0' \
    --userID 'h8oXXKT9' \
    > test.out 2>&1
eval_tap $? 11 'AdminQueryPartyDetail' test.out

#- 12 GetPartyDetail
./ng net.accelbyte.sdk.cli.Main sessionhistory getPartyDetail \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'NHUSdBM4' \
    > test.out 2>&1
eval_tap $? 12 'GetPartyDetail' test.out

#- 13 AdminQueryTicketDetail
./ng net.accelbyte.sdk.cli.Main sessionhistory adminQueryTicketDetail \
    --namespace "$AB_NAMESPACE" \
    --endDate 'qTVpgppA' \
    --gameMode 'Z4tLiRmo' \
    --limit '71' \
    --offset '13' \
    --order 'UFBMXi1f' \
    --partyID 'PSlF2FFz' \
    --region 'tvp2KR5B' \
    --startDate 'tYCpT9dg' \
    --userIDs 'BfavNRaY' \
    > test.out 2>&1
eval_tap $? 13 'AdminQueryTicketDetail' test.out

#- 14 AdminTicketDetailGetByTicketID
./ng net.accelbyte.sdk.cli.Main sessionhistory adminTicketDetailGetByTicketID \
    --namespace "$AB_NAMESPACE" \
    --ticketId 'LFzEDF50' \
    > test.out 2>&1
eval_tap $? 14 'AdminTicketDetailGetByTicketID' test.out

#- 15 PublicQueryGameSessionMe
./ng net.accelbyte.sdk.cli.Main sessionhistory publicQueryGameSessionMe \
    --namespace "$AB_NAMESPACE" \
    --limit '93' \
    --offset '90' \
    --order 'jowGvxgV' \
    > test.out 2>&1
eval_tap $? 15 'PublicQueryGameSessionMe' test.out

#- 16 QueryXrayMatchPool
./ng net.accelbyte.sdk.cli.Main sessionhistory queryXrayMatchPool \
    --namespace "$AB_NAMESPACE" \
    --poolName 'Fkzilu3x,ap5N47ik,xlirMnMW' \
    --endDate '8xzS4Hhb' \
    --startDate 'napKTDlB' \
    > test.out 2>&1
eval_tap $? 16 'QueryXrayMatchPool' test.out

#- 17 QueryDetailTickMatchPool
./ng net.accelbyte.sdk.cli.Main sessionhistory queryDetailTickMatchPool \
    --namespace "$AB_NAMESPACE" \
    --podName 'gql8CfRU' \
    --poolName 'R8da1CQW' \
    --all  \
    --limit '37' \
    --offset '48' \
    --endDate 'MfSW8B7j' \
    --startDate 'I6GmIssR' \
    > test.out 2>&1
eval_tap $? 17 'QueryDetailTickMatchPool' test.out

#- 18 QueryDetailTickMatchPoolMatches
./ng net.accelbyte.sdk.cli.Main sessionhistory queryDetailTickMatchPoolMatches \
    --namespace "$AB_NAMESPACE" \
    --podName 'dxvL1JEP' \
    --poolName 'DtqTeXR3' \
    --tickId '2KQTyrkx' \
    > test.out 2>&1
eval_tap $? 18 'QueryDetailTickMatchPoolMatches' test.out

#- 19 QueryDetailTickMatchPoolTicket
./ng net.accelbyte.sdk.cli.Main sessionhistory queryDetailTickMatchPoolTicket \
    --namespace "$AB_NAMESPACE" \
    --podName 'waTdXw5Z' \
    --poolName 'OPV5ctg9' \
    --tickId '3W51AAAj' \
    > test.out 2>&1
eval_tap $? 19 'QueryDetailTickMatchPoolTicket' test.out

#- 20 QueryMatchHistories
./ng net.accelbyte.sdk.cli.Main sessionhistory queryMatchHistories \
    --matchId 'eI6rjLN5' \
    --namespace "$AB_NAMESPACE" \
    --limit '67' \
    --offset '52' \
    > test.out 2>&1
eval_tap $? 20 'QueryMatchHistories' test.out

#- 21 QueryMatchTicketHistories
./ng net.accelbyte.sdk.cli.Main sessionhistory queryMatchTicketHistories \
    --matchId 'kraUAiMl' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 21 'QueryMatchTicketHistories' test.out

#- 22 QueryXrayMatch
./ng net.accelbyte.sdk.cli.Main sessionhistory queryXrayMatch \
    --matchId 'qkIrYyFl' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 22 'QueryXrayMatch' test.out

#- 23 QueryAcquiringDS
./ng net.accelbyte.sdk.cli.Main sessionhistory queryAcquiringDS \
    --namespace "$AB_NAMESPACE" \
    --matchPool 'fn2mrVS8,VjryOe1i,oiWBcrDY' \
    --endDate '9iD1h206' \
    --startDate 'IjVrGlG7' \
    > test.out 2>&1
eval_tap $? 23 'QueryAcquiringDS' test.out

#- 24 QueryAcquiringDSWaitTimeAvg
./ng net.accelbyte.sdk.cli.Main sessionhistory queryAcquiringDSWaitTimeAvg \
    --namespace "$AB_NAMESPACE" \
    --matchPool 'VyVkxWlb,Z9XP57c7,NDH631DC' \
    --endDate '6HvadqTa' \
    --startDate 'OMk9rIkC' \
    > test.out 2>&1
eval_tap $? 24 'QueryAcquiringDSWaitTimeAvg' test.out

#- 25 QueryMatchLengthDurationpAvg
./ng net.accelbyte.sdk.cli.Main sessionhistory queryMatchLengthDurationpAvg \
    --namespace "$AB_NAMESPACE" \
    --matchPool 'L8kOpsZG,uys7i7ru,nMRGj9R0' \
    --endDate 'AIfz6bi7' \
    --startDate 'jcSJjB6g' \
    > test.out 2>&1
eval_tap $? 25 'QueryMatchLengthDurationpAvg' test.out

#- 26 QueryMatchLengthDurationp99
./ng net.accelbyte.sdk.cli.Main sessionhistory queryMatchLengthDurationp99 \
    --namespace "$AB_NAMESPACE" \
    --matchPool 'uC61KumD,BDRDkdBX,Kj6680Tv' \
    --endDate 'AXI9ckMf' \
    --startDate 'OPpmdkrQ' \
    > test.out 2>&1
eval_tap $? 26 'QueryMatchLengthDurationp99' test.out

#- 27 QueryTotalActiveSession
./ng net.accelbyte.sdk.cli.Main sessionhistory queryTotalActiveSession \
    --namespace "$AB_NAMESPACE" \
    --matchPool '2VfmcuIF,Ci084wXC,ognxjYIa' \
    --region 'S2xt4j01' \
    --endDate '7i0bfVSW' \
    --startDate 'PdW14oI5' \
    > test.out 2>&1
eval_tap $? 27 'QueryTotalActiveSession' test.out

#- 28 QueryTotalMatchmakingMatch
./ng net.accelbyte.sdk.cli.Main sessionhistory queryTotalMatchmakingMatch \
    --namespace "$AB_NAMESPACE" \
    --matchPool 'zr6gyxS1,K0kqHwbL,imio2JrC' \
    --endDate 'kYUeM146' \
    --startDate '5UroTG7j' \
    > test.out 2>&1
eval_tap $? 28 'QueryTotalMatchmakingMatch' test.out

#- 29 QueryTotalPlayerPersession
./ng net.accelbyte.sdk.cli.Main sessionhistory queryTotalPlayerPersession \
    --namespace "$AB_NAMESPACE" \
    --matchPool 'aJDGF10A,qCadteDX,AsJ1Rleh' \
    --endDate '6Te6fmt7' \
    --startDate 'f0qyACQO' \
    > test.out 2>&1
eval_tap $? 29 'QueryTotalPlayerPersession' test.out

#- 30 QueryTotalMatchmakingCanceled
./ng net.accelbyte.sdk.cli.Main sessionhistory queryTotalMatchmakingCanceled \
    --namespace "$AB_NAMESPACE" \
    --matchPool 'IeGFrkqq,lORcnwL3,x1iE9SIi' \
    --endDate 'cjzobEUB' \
    --startDate 'SMPW5Hbg' \
    > test.out 2>&1
eval_tap $? 30 'QueryTotalMatchmakingCanceled' test.out

#- 31 QueryTotalMatchmakingCreated
./ng net.accelbyte.sdk.cli.Main sessionhistory queryTotalMatchmakingCreated \
    --namespace "$AB_NAMESPACE" \
    --matchPool 'aawu0bYn,kS85r9cK,155LBVLB' \
    --endDate 'JmOdKeUl' \
    --startDate 'sNw6KvIX' \
    > test.out 2>&1
eval_tap $? 31 'QueryTotalMatchmakingCreated' test.out

#- 32 QueryTotalMatchmakingExpired
./ng net.accelbyte.sdk.cli.Main sessionhistory queryTotalMatchmakingExpired \
    --namespace "$AB_NAMESPACE" \
    --matchPool '3L1Ovmsd,VugCmxBw,247wxXzp' \
    --endDate 'w7n22t8s' \
    --startDate 'iN0aHZ55' \
    > test.out 2>&1
eval_tap $? 32 'QueryTotalMatchmakingExpired' test.out

#- 33 QueryTotalMatchmakingMatchTicket
./ng net.accelbyte.sdk.cli.Main sessionhistory queryTotalMatchmakingMatchTicket \
    --namespace "$AB_NAMESPACE" \
    --matchPool 'jiWvm3gT,BAkk3TTL,TnEOPq7i' \
    --endDate 'fEvSqI9K' \
    --startDate 'hoHaqef7' \
    > test.out 2>&1
eval_tap $? 33 'QueryTotalMatchmakingMatchTicket' test.out

#- 34 CreateXrayTicketObservability
./ng net.accelbyte.sdk.cli.Main sessionhistory createXrayTicketObservability \
    --namespace "$AB_NAMESPACE" \
    --body '{"action": "cVmLqWg9", "activeAllianceRule": {"max_number": 38, "min_number": 45, "player_max_number": 1, "player_min_number": 87}, "activeMatchingRule": [{"attribute": "RxOKszV9", "criteria": "rdBGkvFs", "reference": 0.257721367530203}, {"attribute": "QIU2lWwK", "criteria": "DETcyPPg", "reference": 0.35411535693713025}, {"attribute": "xW7QRWmp", "criteria": "BMhQrAS1", "reference": 0.26451949607421477}], "function": "ufz40Ewd", "gameMode": "ze19Bb90", "isBackfillMatch": false, "isRuleSetFlexed": true, "iteration": 99, "matchID": "Vg5RXKXS", "namespace": "gxWEDtez", "remainingPlayersPerTicket": [74, 96, 0], "remainingTickets": 0, "sessionTickID": "0qfjrLkJ", "tickID": 55, "ticketID": "OPcq4ul3", "timeToMatchSec": 0.5928899183468805, "timestamp": "1984-06-29T00:00:00Z", "unbackfillReason": "yzJdRTEo", "unmatchReason": "MnrCtnRN"}' \
    > test.out 2>&1
eval_tap $? 34 'CreateXrayTicketObservability' test.out

#- 35 CreateXrayBulkTicketObservability
./ng net.accelbyte.sdk.cli.Main sessionhistory createXrayBulkTicketObservability \
    --namespace "$AB_NAMESPACE" \
    --body '{"ticketObservabilities": [{"action": "jum2ZvFu", "activeAllianceRule": {"max_number": 7, "min_number": 47, "player_max_number": 0, "player_min_number": 59}, "activeMatchingRule": [{"attribute": "bd6VUO6o", "criteria": "NSWmwWbv", "reference": 0.842169235214188}, {"attribute": "5wc5s02B", "criteria": "zEYLaxe9", "reference": 0.6064119789729393}, {"attribute": "gib9STS9", "criteria": "RDl8awpB", "reference": 0.17531472736038156}], "function": "WMoAJulY", "gameMode": "NnHMpBXr", "isBackfillMatch": false, "isRuleSetFlexed": true, "iteration": 95, "matchID": "HetV546J", "namespace": "9gEQ2Mao", "remainingPlayersPerTicket": [71, 23, 73], "remainingTickets": 46, "sessionTickID": "IIzIpMUL", "tickID": 31, "ticketID": "MgG9O2lO", "timeToMatchSec": 0.3571970192449403, "timestamp": "1996-05-30T00:00:00Z", "unbackfillReason": "2bfdb6CN", "unmatchReason": "OXgYXcXO"}, {"action": "XDPorKLR", "activeAllianceRule": {"max_number": 98, "min_number": 78, "player_max_number": 24, "player_min_number": 18}, "activeMatchingRule": [{"attribute": "joqO05FL", "criteria": "bpdOLCUb", "reference": 0.5675210651613852}, {"attribute": "bOQl3y12", "criteria": "Yun95al3", "reference": 0.6972416738018842}, {"attribute": "z8VI1Tko", "criteria": "9wV4MPHH", "reference": 0.55244048867584}], "function": "IHpGhyC1", "gameMode": "u4bHgW1G", "isBackfillMatch": true, "isRuleSetFlexed": false, "iteration": 42, "matchID": "v20Fu2Oz", "namespace": "Mio85JZm", "remainingPlayersPerTicket": [48, 31, 74], "remainingTickets": 69, "sessionTickID": "YPcENDYo", "tickID": 8, "ticketID": "qBsgP3O6", "timeToMatchSec": 0.6019895387734865, "timestamp": "1977-03-11T00:00:00Z", "unbackfillReason": "AYftekPh", "unmatchReason": "i5kexr2D"}, {"action": "YlS1KyJL", "activeAllianceRule": {"max_number": 55, "min_number": 58, "player_max_number": 78, "player_min_number": 40}, "activeMatchingRule": [{"attribute": "cgBi5EW0", "criteria": "afkaEfII", "reference": 0.6666913193447382}, {"attribute": "iXK5fEay", "criteria": "MYP3EDOO", "reference": 0.6940486421851159}, {"attribute": "fWN4WCev", "criteria": "vF5NvNNo", "reference": 0.24837716085963846}], "function": "QnchbO74", "gameMode": "gNBL5xVZ", "isBackfillMatch": false, "isRuleSetFlexed": false, "iteration": 62, "matchID": "yAEAbhRg", "namespace": "ZSInMW5I", "remainingPlayersPerTicket": [82, 75, 20], "remainingTickets": 2, "sessionTickID": "1gNBzNVZ", "tickID": 69, "ticketID": "wrg2B8vp", "timeToMatchSec": 0.1265288045741203, "timestamp": "1992-10-22T00:00:00Z", "unbackfillReason": "crkIAjKN", "unmatchReason": "qDyaHKXo"}]}' \
    > test.out 2>&1
eval_tap $? 35 'CreateXrayBulkTicketObservability' test.out

#- 36 QueryXrayTimelineByTicketID
./ng net.accelbyte.sdk.cli.Main sessionhistory queryXrayTimelineByTicketID \
    --namespace "$AB_NAMESPACE" \
    --ticketId 'wr85xxs0' \
    --limit '7' \
    --offset '29' \
    --endDate 'R0DsXNMb' \
    --startDate 'IySUd4hr' \
    > test.out 2>&1
eval_tap $? 36 'QueryXrayTimelineByTicketID' test.out

#- 37 QueryXrayTimelineByUserID
./ng net.accelbyte.sdk.cli.Main sessionhistory queryXrayTimelineByUserID \
    --namespace "$AB_NAMESPACE" \
    --userId 'Kj0qwxR6' \
    --limit '38' \
    --offset '91' \
    --endDate 'G7cqCLHW' \
    --startDate 'PGNL9KdS' \
    > test.out 2>&1
eval_tap $? 37 'QueryXrayTimelineByUserID' test.out


rm -f "tmp.dat"

exit $EXIT_CODE