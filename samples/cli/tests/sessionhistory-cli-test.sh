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
echo "1..39"

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

#- 4 AdminGetEnvConfig
./ng net.accelbyte.sdk.cli.Main sessionhistory adminGetEnvConfig \
    > test.out 2>&1
eval_tap $? 4 'AdminGetEnvConfig' test.out

#- 5 AdminPatchUpdateEnvConfig
./ng net.accelbyte.sdk.cli.Main sessionhistory adminPatchUpdateEnvConfig \
    --body '{"SESSION_DELETION_GRACE_PERIOD": 45}' \
    > test.out 2>&1
eval_tap $? 5 'AdminPatchUpdateEnvConfig' test.out

#- 6 AdminGetLogConfig
./ng net.accelbyte.sdk.cli.Main sessionhistory adminGetLogConfig \
    > test.out 2>&1
eval_tap $? 6 'AdminGetLogConfig' test.out

#- 7 AdminPatchUpdateLogConfig
./ng net.accelbyte.sdk.cli.Main sessionhistory adminPatchUpdateLogConfig \
    --body '{"logLevel": "debug"}' \
    > test.out 2>&1
eval_tap $? 7 'AdminPatchUpdateLogConfig' test.out

#- 8 AdminQueryGameSessionDetail
./ng net.accelbyte.sdk.cli.Main sessionhistory adminQueryGameSessionDetail \
    --namespace "$AB_NAMESPACE" \
    --completedOnly 'HjQTot5s' \
    --configurationName 'y6iN6T27' \
    --dsPodName '0ytrBsR4' \
    --endDate 'MOaQqCNP' \
    --gameSessionID 'y4yprTbt' \
    --isPersistent 'ZQ1vXa7b' \
    --joinability 'mm89UNdv' \
    --limit '88' \
    --matchPool 'TQyO3wWI' \
    --offset '79' \
    --order 'RDutZ9F3' \
    --orderBy 'm4vR2ebm' \
    --startDate 's9R9FVMs' \
    --statusV2 'kMd1yFYH' \
    --userID '1AKslJQg' \
    > test.out 2>&1
eval_tap $? 8 'AdminQueryGameSessionDetail' test.out

#- 9 GetGameSessionDetail
./ng net.accelbyte.sdk.cli.Main sessionhistory getGameSessionDetail \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'UXsZar0U' \
    > test.out 2>&1
eval_tap $? 9 'GetGameSessionDetail' test.out

#- 10 AdminQueryMatchmakingDetail
./ng net.accelbyte.sdk.cli.Main sessionhistory adminQueryMatchmakingDetail \
    --namespace "$AB_NAMESPACE" \
    --gameSessionID 'olqD63nT' \
    --limit '38' \
    --offset '23' \
    --order '6iM0c0dX' \
    --orderBy 'Gt6zgjun' \
    --ticketID 'NnzoPYtx' \
    --userID 'QhpNQ1Jd' \
    > test.out 2>&1
eval_tap $? 10 'AdminQueryMatchmakingDetail' test.out

#- 11 AdminGetMatchmakingDetailBySessionID
./ng net.accelbyte.sdk.cli.Main sessionhistory adminGetMatchmakingDetailBySessionID \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'n6qkK76P' \
    > test.out 2>&1
eval_tap $? 11 'AdminGetMatchmakingDetailBySessionID' test.out

#- 12 AdminGetMatchmakingDetailByTicketID
./ng net.accelbyte.sdk.cli.Main sessionhistory adminGetMatchmakingDetailByTicketID \
    --namespace "$AB_NAMESPACE" \
    --ticketId 'd7ZevNRR' \
    > test.out 2>&1
eval_tap $? 12 'AdminGetMatchmakingDetailByTicketID' test.out

#- 13 AdminQueryPartyDetail
./ng net.accelbyte.sdk.cli.Main sessionhistory adminQueryPartyDetail \
    --namespace "$AB_NAMESPACE" \
    --endDate 'JE2tGohW' \
    --joinability 'QmCzmfr5' \
    --leaderID 'OZ0ni54C' \
    --limit '45' \
    --offset '31' \
    --order 'AY903O4j' \
    --orderBy '0Wr4vMTc' \
    --partyID 'kh9EIxBs' \
    --startDate 'EMFzre0k' \
    --userID 'Q7TViOUA' \
    > test.out 2>&1
eval_tap $? 13 'AdminQueryPartyDetail' test.out

#- 14 GetPartyDetail
./ng net.accelbyte.sdk.cli.Main sessionhistory getPartyDetail \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'ifLlrEoa' \
    > test.out 2>&1
eval_tap $? 14 'GetPartyDetail' test.out

#- 15 AdminQueryTicketDetail
./ng net.accelbyte.sdk.cli.Main sessionhistory adminQueryTicketDetail \
    --namespace "$AB_NAMESPACE" \
    --endDate '5cCGRedH' \
    --gameMode 'q4NDiryl' \
    --limit '31' \
    --offset '64' \
    --order 'hlV6Li19' \
    --partyID 'e94UCCMx' \
    --region 'WDQ59DiX' \
    --startDate 'mlGONc03' \
    --userIDs 'VwizHVLr' \
    > test.out 2>&1
eval_tap $? 15 'AdminQueryTicketDetail' test.out

#- 16 AdminTicketDetailGetByTicketID
./ng net.accelbyte.sdk.cli.Main sessionhistory adminTicketDetailGetByTicketID \
    --namespace "$AB_NAMESPACE" \
    --ticketId 'po9rXdJi' \
    > test.out 2>&1
eval_tap $? 16 'AdminTicketDetailGetByTicketID' test.out

#- 17 PublicQueryGameSessionMe
./ng net.accelbyte.sdk.cli.Main sessionhistory publicQueryGameSessionMe \
    --namespace "$AB_NAMESPACE" \
    --limit '33' \
    --offset '61' \
    --order 'hAEKHel9' \
    > test.out 2>&1
eval_tap $? 17 'PublicQueryGameSessionMe' test.out

#- 18 QueryXrayMatchPool
./ng net.accelbyte.sdk.cli.Main sessionhistory queryXrayMatchPool \
    --namespace "$AB_NAMESPACE" \
    --poolName '5h6eVIFE,NJtlM7kV,kQEdoXAE' \
    --endDate 'hsM7J2yF' \
    --startDate 'PHmUmY2O' \
    > test.out 2>&1
eval_tap $? 18 'QueryXrayMatchPool' test.out

#- 19 QueryDetailTickMatchPool
./ng net.accelbyte.sdk.cli.Main sessionhistory queryDetailTickMatchPool \
    --namespace "$AB_NAMESPACE" \
    --podName '1hgD3gWS' \
    --poolName 'vj6lnthj' \
    --all  \
    --limit '11' \
    --offset '68' \
    --endDate 'V48lb5vZ' \
    --startDate 'qrOvtMJG' \
    > test.out 2>&1
eval_tap $? 19 'QueryDetailTickMatchPool' test.out

#- 20 QueryDetailTickMatchPoolMatches
./ng net.accelbyte.sdk.cli.Main sessionhistory queryDetailTickMatchPoolMatches \
    --namespace "$AB_NAMESPACE" \
    --podName 'yZpYGrXt' \
    --poolName 'aM97Xu6n' \
    --tickId 'RW84loh6' \
    > test.out 2>&1
eval_tap $? 20 'QueryDetailTickMatchPoolMatches' test.out

#- 21 QueryDetailTickMatchPoolTicket
./ng net.accelbyte.sdk.cli.Main sessionhistory queryDetailTickMatchPoolTicket \
    --namespace "$AB_NAMESPACE" \
    --podName 'ijtSpqNf' \
    --poolName 'awyNh4c9' \
    --tickId 'qYBc3xru' \
    > test.out 2>&1
eval_tap $? 21 'QueryDetailTickMatchPoolTicket' test.out

#- 22 QueryMatchHistories
./ng net.accelbyte.sdk.cli.Main sessionhistory queryMatchHistories \
    --matchId 'hMfq5eiR' \
    --namespace "$AB_NAMESPACE" \
    --limit '10' \
    --offset '15' \
    > test.out 2>&1
eval_tap $? 22 'QueryMatchHistories' test.out

#- 23 QueryMatchTicketHistories
./ng net.accelbyte.sdk.cli.Main sessionhistory queryMatchTicketHistories \
    --matchId 'QyM5pU4W' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 23 'QueryMatchTicketHistories' test.out

#- 24 QueryXrayMatch
./ng net.accelbyte.sdk.cli.Main sessionhistory queryXrayMatch \
    --matchId 'pgA0puMW' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 24 'QueryXrayMatch' test.out

#- 25 QueryAcquiringDS
./ng net.accelbyte.sdk.cli.Main sessionhistory queryAcquiringDS \
    --namespace "$AB_NAMESPACE" \
    --matchPool 'EEVCWchY,8kk0b9mf,5UoqDKzj' \
    --endDate 'CPsap2jz' \
    --startDate 'lJKyKXtR' \
    > test.out 2>&1
eval_tap $? 25 'QueryAcquiringDS' test.out

#- 26 QueryAcquiringDSWaitTimeAvg
./ng net.accelbyte.sdk.cli.Main sessionhistory queryAcquiringDSWaitTimeAvg \
    --namespace "$AB_NAMESPACE" \
    --matchPool 'HDuref38,SQrAXZBb,fO2AGJgh' \
    --endDate '9x6dCbMj' \
    --startDate 'uxNv0nlX' \
    > test.out 2>&1
eval_tap $? 26 'QueryAcquiringDSWaitTimeAvg' test.out

#- 27 QueryMatchLengthDurationpAvg
./ng net.accelbyte.sdk.cli.Main sessionhistory queryMatchLengthDurationpAvg \
    --namespace "$AB_NAMESPACE" \
    --matchPool 'DJeAQk31,s07gMqMC,cTmZmDMs' \
    --endDate 'vDf2QWoT' \
    --startDate 'ph1GWJFS' \
    > test.out 2>&1
eval_tap $? 27 'QueryMatchLengthDurationpAvg' test.out

#- 28 QueryMatchLengthDurationp99
./ng net.accelbyte.sdk.cli.Main sessionhistory queryMatchLengthDurationp99 \
    --namespace "$AB_NAMESPACE" \
    --matchPool 'eFT5TKq0,sWBIhqgb,SgtXvyDf' \
    --endDate '1srqkfND' \
    --startDate 'yVkTEnY9' \
    > test.out 2>&1
eval_tap $? 28 'QueryMatchLengthDurationp99' test.out

#- 29 QueryTotalActiveSession
./ng net.accelbyte.sdk.cli.Main sessionhistory queryTotalActiveSession \
    --namespace "$AB_NAMESPACE" \
    --matchPool 'HqfIDzCw,5pYwQz3y,krmzPwMX' \
    --region 'IHpA3Vaf' \
    --endDate 'savJYarC' \
    --startDate 'GAArnujF' \
    > test.out 2>&1
eval_tap $? 29 'QueryTotalActiveSession' test.out

#- 30 QueryTotalMatchmakingMatch
./ng net.accelbyte.sdk.cli.Main sessionhistory queryTotalMatchmakingMatch \
    --namespace "$AB_NAMESPACE" \
    --matchPool '7jtbVFK9,7LHZMUdS,8VbHpZFi' \
    --endDate '9RjVmNNH' \
    --startDate '9vBf6pMW' \
    > test.out 2>&1
eval_tap $? 30 'QueryTotalMatchmakingMatch' test.out

#- 31 QueryTotalPlayerPersession
./ng net.accelbyte.sdk.cli.Main sessionhistory queryTotalPlayerPersession \
    --namespace "$AB_NAMESPACE" \
    --matchPool 'Q0Llc7f1,twNFmbXU,2bYhu9Tj' \
    --endDate '7Oxqe9bW' \
    --startDate 'DmXeDEIk' \
    > test.out 2>&1
eval_tap $? 31 'QueryTotalPlayerPersession' test.out

#- 32 QueryTotalMatchmakingCanceled
./ng net.accelbyte.sdk.cli.Main sessionhistory queryTotalMatchmakingCanceled \
    --namespace "$AB_NAMESPACE" \
    --matchPool 'YhaEMofA,BYMsFPfD,m584mXuc' \
    --endDate 'bLPgX1uy' \
    --startDate 'zMACGldp' \
    > test.out 2>&1
eval_tap $? 32 'QueryTotalMatchmakingCanceled' test.out

#- 33 QueryTotalMatchmakingCreated
./ng net.accelbyte.sdk.cli.Main sessionhistory queryTotalMatchmakingCreated \
    --namespace "$AB_NAMESPACE" \
    --matchPool '3JBp2Jrp,bFENkErj,A69vbMuX' \
    --endDate '1S0tR9ea' \
    --startDate 'K832Ijml' \
    > test.out 2>&1
eval_tap $? 33 'QueryTotalMatchmakingCreated' test.out

#- 34 QueryTotalMatchmakingExpired
./ng net.accelbyte.sdk.cli.Main sessionhistory queryTotalMatchmakingExpired \
    --namespace "$AB_NAMESPACE" \
    --matchPool 'nxbmK13N,scPtXbxN,FuSC3Mdy' \
    --endDate 'FrkEBZSB' \
    --startDate 'wJXdEPtB' \
    > test.out 2>&1
eval_tap $? 34 'QueryTotalMatchmakingExpired' test.out

#- 35 QueryTotalMatchmakingMatchTicket
./ng net.accelbyte.sdk.cli.Main sessionhistory queryTotalMatchmakingMatchTicket \
    --namespace "$AB_NAMESPACE" \
    --matchPool '8MVmQ7X1,bzP2gblf,X0JwLewl' \
    --endDate '5YUCBoGk' \
    --startDate 'p7gxFnzL' \
    > test.out 2>&1
eval_tap $? 35 'QueryTotalMatchmakingMatchTicket' test.out

#- 36 CreateXrayTicketObservability
./ng net.accelbyte.sdk.cli.Main sessionhistory createXrayTicketObservability \
    --namespace "$AB_NAMESPACE" \
    --body '{"action": "fXYCr8BG", "activeAllianceRule": {"max_number": 91, "min_number": 56, "player_max_number": 10, "player_min_number": 81}, "activeMatchingRule": [{"attribute": "nnXr5hKE", "criteria": "zcb3NQbf", "reference": 0.7731154954157684}, {"attribute": "7gXDHCGn", "criteria": "Uoq72cEz", "reference": 0.7656333315748781}, {"attribute": "vki3Yqds", "criteria": "ZdLi4f11", "reference": 0.13282271481960173}], "function": "GxlUPpvO", "gameMode": "vMWfM2ql", "isBackfillMatch": false, "isRuleSetFlexed": true, "iteration": 80, "matchID": "Qz4pomrs", "namespace": "BSGxFS4D", "remainingPlayersPerTicket": [77, 29, 65], "remainingTickets": 5, "sessionTickID": "rqPPD6nW", "tickID": 59, "ticketID": "O680kFp0", "timeToMatchSec": 0.04472608894210228, "timestamp": "1983-05-28T00:00:00Z", "unbackfillReason": "lDkeGZvJ", "unmatchReason": "xDuLnBsX"}' \
    > test.out 2>&1
eval_tap $? 36 'CreateXrayTicketObservability' test.out

#- 37 CreateXrayBulkTicketObservability
./ng net.accelbyte.sdk.cli.Main sessionhistory createXrayBulkTicketObservability \
    --namespace "$AB_NAMESPACE" \
    --body '{"ticketObservabilities": [{"action": "HFxE3laF", "activeAllianceRule": {"max_number": 6, "min_number": 10, "player_max_number": 53, "player_min_number": 49}, "activeMatchingRule": [{"attribute": "5t93Bz5f", "criteria": "BzinUCzD", "reference": 0.8451475958652225}, {"attribute": "6KQA3bL9", "criteria": "CgaS2tlN", "reference": 0.13366125146955232}, {"attribute": "O1Z88avG", "criteria": "3D8lgPUa", "reference": 0.2018242699949515}], "function": "eMcZf9RN", "gameMode": "YtNRv95C", "isBackfillMatch": true, "isRuleSetFlexed": true, "iteration": 97, "matchID": "8yhCZJ53", "namespace": "w23o1liI", "remainingPlayersPerTicket": [30, 97, 38], "remainingTickets": 35, "sessionTickID": "Dg9faHqc", "tickID": 87, "ticketID": "RkLMm9eo", "timeToMatchSec": 0.3234843473106045, "timestamp": "1995-07-27T00:00:00Z", "unbackfillReason": "TFroB7CB", "unmatchReason": "GPIJpRx2"}, {"action": "kFbkIYT4", "activeAllianceRule": {"max_number": 94, "min_number": 49, "player_max_number": 18, "player_min_number": 4}, "activeMatchingRule": [{"attribute": "cY9XQogU", "criteria": "hy1MzGgB", "reference": 0.9099254064797689}, {"attribute": "56qcHEx0", "criteria": "ryyuZGbo", "reference": 0.7972876869506035}, {"attribute": "dV92EZ1e", "criteria": "KJvc4dfV", "reference": 0.9893059154323811}], "function": "AD3i7TFq", "gameMode": "eJHxvkOk", "isBackfillMatch": false, "isRuleSetFlexed": true, "iteration": 86, "matchID": "A2edUzDy", "namespace": "6o5xeO13", "remainingPlayersPerTicket": [40, 0, 47], "remainingTickets": 99, "sessionTickID": "Z7iNkJE9", "tickID": 17, "ticketID": "f8NdNbwp", "timeToMatchSec": 0.3049971672897297, "timestamp": "1984-10-20T00:00:00Z", "unbackfillReason": "q98rNcU6", "unmatchReason": "hJsh1thN"}, {"action": "7JTzJPLw", "activeAllianceRule": {"max_number": 61, "min_number": 20, "player_max_number": 58, "player_min_number": 53}, "activeMatchingRule": [{"attribute": "y4idy44t", "criteria": "ybjtJUhG", "reference": 0.5925362378832051}, {"attribute": "K0EdenLT", "criteria": "l8nXTf4b", "reference": 0.5814084159214924}, {"attribute": "AOT6PyZJ", "criteria": "imHfXdlv", "reference": 0.2153308926830887}], "function": "Z6YPWr99", "gameMode": "uQhXYyPs", "isBackfillMatch": false, "isRuleSetFlexed": true, "iteration": 88, "matchID": "4vdQXUKi", "namespace": "IdutOTDP", "remainingPlayersPerTicket": [52, 57, 93], "remainingTickets": 42, "sessionTickID": "8W0Ar9MC", "tickID": 98, "ticketID": "JsZsMzW0", "timeToMatchSec": 0.8295829541751236, "timestamp": "1980-09-06T00:00:00Z", "unbackfillReason": "ExBAMX5N", "unmatchReason": "Nybr0Toj"}]}' \
    > test.out 2>&1
eval_tap $? 37 'CreateXrayBulkTicketObservability' test.out

#- 38 QueryXrayTimelineByTicketID
./ng net.accelbyte.sdk.cli.Main sessionhistory queryXrayTimelineByTicketID \
    --namespace "$AB_NAMESPACE" \
    --ticketId 'fLpHt97u' \
    --limit '25' \
    --offset '49' \
    --endDate 'Czjz8R08' \
    --startDate 'Eio2Z0LH' \
    > test.out 2>&1
eval_tap $? 38 'QueryXrayTimelineByTicketID' test.out

#- 39 QueryXrayTimelineByUserID
./ng net.accelbyte.sdk.cli.Main sessionhistory queryXrayTimelineByUserID \
    --namespace "$AB_NAMESPACE" \
    --userId 'Yl4fXQmY' \
    --limit '19' \
    --offset '15' \
    --order 'QivYLOgn' \
    --orderBy 'hPNmy80j' \
    --endDate 'GEEuohM7' \
    --startDate 'A9KHSja6' \
    > test.out 2>&1
eval_tap $? 39 'QueryXrayTimelineByUserID' test.out


rm -f "tmp.dat"

exit $EXIT_CODE