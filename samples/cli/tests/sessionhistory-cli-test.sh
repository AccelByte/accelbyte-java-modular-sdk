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
    --endDate '5Tv8xpxo' \
    --gameSessionID 'XhplVGuI' \
    --limit '82' \
    --offset '63' \
    --order 'Wd7Pz0OS' \
    --orderBy 'OSMxQr7L' \
    --startDate 'bpSAuxzF' \
    --userID 'DuhaYa3P' \
    > test.out 2>&1
eval_tap $? 6 'AdminQueryGameSessionDetail' test.out

#- 7 GetGameSessionDetail
./ng net.accelbyte.sdk.cli.Main sessionhistory getGameSessionDetail \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'MvEWXQCh' \
    > test.out 2>&1
eval_tap $? 7 'GetGameSessionDetail' test.out

#- 8 AdminQueryMatchmakingDetail
./ng net.accelbyte.sdk.cli.Main sessionhistory adminQueryMatchmakingDetail \
    --namespace "$AB_NAMESPACE" \
    --gameSessionID '8LAke3Vh' \
    --limit '66' \
    --offset '8' \
    --order '7XptzRUE' \
    --orderBy 'a4nNrvBW' \
    --ticketID 'GcYpaIim' \
    --userID 'O6sfES4W' \
    > test.out 2>&1
eval_tap $? 8 'AdminQueryMatchmakingDetail' test.out

#- 9 AdminGetMatchmakingDetailBySessionID
./ng net.accelbyte.sdk.cli.Main sessionhistory adminGetMatchmakingDetailBySessionID \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'XwHrNrn2' \
    > test.out 2>&1
eval_tap $? 9 'AdminGetMatchmakingDetailBySessionID' test.out

#- 10 AdminGetMatchmakingDetailByTicketID
./ng net.accelbyte.sdk.cli.Main sessionhistory adminGetMatchmakingDetailByTicketID \
    --namespace "$AB_NAMESPACE" \
    --ticketId 'AJ7wULBt' \
    > test.out 2>&1
eval_tap $? 10 'AdminGetMatchmakingDetailByTicketID' test.out

#- 11 AdminQueryPartyDetail
./ng net.accelbyte.sdk.cli.Main sessionhistory adminQueryPartyDetail \
    --namespace "$AB_NAMESPACE" \
    --limit '82' \
    --offset '87' \
    --order '3vunlEsh' \
    --orderBy 'ofSLpoy7' \
    --partyID 'a0GWiKFu' \
    --userID 'nxGw4xIC' \
    > test.out 2>&1
eval_tap $? 11 'AdminQueryPartyDetail' test.out

#- 12 GetPartyDetail
./ng net.accelbyte.sdk.cli.Main sessionhistory getPartyDetail \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'Y3mkr3Qf' \
    > test.out 2>&1
eval_tap $? 12 'GetPartyDetail' test.out

#- 13 AdminQueryTicketDetail
./ng net.accelbyte.sdk.cli.Main sessionhistory adminQueryTicketDetail \
    --namespace "$AB_NAMESPACE" \
    --endDate 'ouRxw8R5' \
    --gameMode 'ybypssYI' \
    --limit '41' \
    --offset '93' \
    --order 'DAAyPWnq' \
    --partyID 'S7kDvMQe' \
    --region 'XUWUgecW' \
    --startDate 'mc6Ng8fA' \
    --userIDs 'DWtVCMAb' \
    > test.out 2>&1
eval_tap $? 13 'AdminQueryTicketDetail' test.out

#- 14 AdminTicketDetailGetByTicketID
./ng net.accelbyte.sdk.cli.Main sessionhistory adminTicketDetailGetByTicketID \
    --namespace "$AB_NAMESPACE" \
    --ticketId 'SPdMFGSi' \
    > test.out 2>&1
eval_tap $? 14 'AdminTicketDetailGetByTicketID' test.out

#- 15 PublicQueryGameSessionMe
./ng net.accelbyte.sdk.cli.Main sessionhistory publicQueryGameSessionMe \
    --namespace "$AB_NAMESPACE" \
    --limit '60' \
    --offset '10' \
    --order 'gjtWFNxK' \
    > test.out 2>&1
eval_tap $? 15 'PublicQueryGameSessionMe' test.out

#- 16 QueryXrayMatchPool
./ng net.accelbyte.sdk.cli.Main sessionhistory queryXrayMatchPool \
    --namespace "$AB_NAMESPACE" \
    --poolName 'Y4nQJxIA,cqx5FYSH,llxY48Cq' \
    --endDate 'jh2inUrQ' \
    --startDate 'PcICnSon' \
    > test.out 2>&1
eval_tap $? 16 'QueryXrayMatchPool' test.out

#- 17 QueryDetailTickMatchPool
./ng net.accelbyte.sdk.cli.Main sessionhistory queryDetailTickMatchPool \
    --namespace "$AB_NAMESPACE" \
    --podName 'MJsoR7Kn' \
    --poolName 'NEHjnmzi' \
    --all  \
    --limit '100' \
    --offset '80' \
    --endDate 'DGUnBXiF' \
    --startDate 'Eigz4Bf4' \
    > test.out 2>&1
eval_tap $? 17 'QueryDetailTickMatchPool' test.out

#- 18 QueryDetailTickMatchPoolMatches
./ng net.accelbyte.sdk.cli.Main sessionhistory queryDetailTickMatchPoolMatches \
    --namespace "$AB_NAMESPACE" \
    --podName '9OQr7Jfz' \
    --poolName 'dmdc1Ccd' \
    --tickId '6ytBmD2H' \
    > test.out 2>&1
eval_tap $? 18 'QueryDetailTickMatchPoolMatches' test.out

#- 19 QueryDetailTickMatchPoolTicket
./ng net.accelbyte.sdk.cli.Main sessionhistory queryDetailTickMatchPoolTicket \
    --namespace "$AB_NAMESPACE" \
    --podName 'st3DeRz9' \
    --poolName 'N6qZjnke' \
    --tickId 'Yf4t7he2' \
    > test.out 2>&1
eval_tap $? 19 'QueryDetailTickMatchPoolTicket' test.out

#- 20 QueryMatchHistories
./ng net.accelbyte.sdk.cli.Main sessionhistory queryMatchHistories \
    --matchId 'LkOUFYYt' \
    --namespace "$AB_NAMESPACE" \
    --limit '63' \
    --offset '98' \
    > test.out 2>&1
eval_tap $? 20 'QueryMatchHistories' test.out

#- 21 QueryMatchTicketHistories
./ng net.accelbyte.sdk.cli.Main sessionhistory queryMatchTicketHistories \
    --matchId 'f069hvuu' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 21 'QueryMatchTicketHistories' test.out

#- 22 QueryXrayMatch
./ng net.accelbyte.sdk.cli.Main sessionhistory queryXrayMatch \
    --matchId 'Wemfqd3j' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 22 'QueryXrayMatch' test.out

#- 23 QueryAcquiringDS
./ng net.accelbyte.sdk.cli.Main sessionhistory queryAcquiringDS \
    --namespace "$AB_NAMESPACE" \
    --matchPool 'btrBbFUd,bz6hvCIo,5EbtmtoA' \
    --endDate 'oO1X4zjv' \
    --startDate 'qmtMDW3d' \
    > test.out 2>&1
eval_tap $? 23 'QueryAcquiringDS' test.out

#- 24 QueryAcquiringDSWaitTimeAvg
./ng net.accelbyte.sdk.cli.Main sessionhistory queryAcquiringDSWaitTimeAvg \
    --namespace "$AB_NAMESPACE" \
    --matchPool 'YskYzngm,FPIvs3Mk,hgevHTEY' \
    --endDate 'XDWE2ANl' \
    --startDate 'dsaFfA5T' \
    > test.out 2>&1
eval_tap $? 24 'QueryAcquiringDSWaitTimeAvg' test.out

#- 25 QueryMatchLengthDurationpAvg
./ng net.accelbyte.sdk.cli.Main sessionhistory queryMatchLengthDurationpAvg \
    --namespace "$AB_NAMESPACE" \
    --matchPool 'mY0rDbdM,envlnTN1,UP7gp5EV' \
    --endDate 'H2TJdgaV' \
    --startDate '0fh3vnAH' \
    > test.out 2>&1
eval_tap $? 25 'QueryMatchLengthDurationpAvg' test.out

#- 26 QueryMatchLengthDurationp99
./ng net.accelbyte.sdk.cli.Main sessionhistory queryMatchLengthDurationp99 \
    --namespace "$AB_NAMESPACE" \
    --matchPool 'ZsGAbLdS,1okKI6A3,ffLDZVSs' \
    --endDate 'MmICidLS' \
    --startDate 'bsgyjxff' \
    > test.out 2>&1
eval_tap $? 26 'QueryMatchLengthDurationp99' test.out

#- 27 QueryTotalActiveSession
./ng net.accelbyte.sdk.cli.Main sessionhistory queryTotalActiveSession \
    --namespace "$AB_NAMESPACE" \
    --matchPool '1MsZdhMo,PKWYXu7Q,2KPhmtng' \
    --region 'gtylZWzy' \
    --endDate 'YipDk327' \
    --startDate 'HjxUAgZi' \
    > test.out 2>&1
eval_tap $? 27 'QueryTotalActiveSession' test.out

#- 28 QueryTotalMatchmakingMatch
./ng net.accelbyte.sdk.cli.Main sessionhistory queryTotalMatchmakingMatch \
    --namespace "$AB_NAMESPACE" \
    --matchPool '9QXEGCug,QKKPnoLL,KAPfUYWB' \
    --endDate 'ARxYSpWo' \
    --startDate 'T9cZbxmY' \
    > test.out 2>&1
eval_tap $? 28 'QueryTotalMatchmakingMatch' test.out

#- 29 QueryTotalPlayerPersession
./ng net.accelbyte.sdk.cli.Main sessionhistory queryTotalPlayerPersession \
    --namespace "$AB_NAMESPACE" \
    --matchPool 'YS7R3Hu6,8NX8Qk2h,MyyQNxb4' \
    --endDate 'Q0JT623g' \
    --startDate 'gR7L0T0r' \
    > test.out 2>&1
eval_tap $? 29 'QueryTotalPlayerPersession' test.out

#- 30 QueryTotalMatchmakingCanceled
./ng net.accelbyte.sdk.cli.Main sessionhistory queryTotalMatchmakingCanceled \
    --namespace "$AB_NAMESPACE" \
    --matchPool 'QINa3PV4,8p9rXC58,yS3eF7Wd' \
    --endDate 'OkrfQNB6' \
    --startDate 'ltusXejn' \
    > test.out 2>&1
eval_tap $? 30 'QueryTotalMatchmakingCanceled' test.out

#- 31 QueryTotalMatchmakingCreated
./ng net.accelbyte.sdk.cli.Main sessionhistory queryTotalMatchmakingCreated \
    --namespace "$AB_NAMESPACE" \
    --matchPool 'JT2PAJLd,e8Wu2IUi,XvjyfupA' \
    --endDate 'EaA7XuBR' \
    --startDate 'l6wHyZ36' \
    > test.out 2>&1
eval_tap $? 31 'QueryTotalMatchmakingCreated' test.out

#- 32 QueryTotalMatchmakingExpired
./ng net.accelbyte.sdk.cli.Main sessionhistory queryTotalMatchmakingExpired \
    --namespace "$AB_NAMESPACE" \
    --matchPool 'cQJ5VbBz,qlejfAuY,zvC1t3OP' \
    --endDate 'fhmaXYMv' \
    --startDate 'OwVxuO5x' \
    > test.out 2>&1
eval_tap $? 32 'QueryTotalMatchmakingExpired' test.out

#- 33 QueryTotalMatchmakingMatchTicket
./ng net.accelbyte.sdk.cli.Main sessionhistory queryTotalMatchmakingMatchTicket \
    --namespace "$AB_NAMESPACE" \
    --matchPool 'v9KosKlD,RFwC7ZPh,e21t4GDl' \
    --endDate '6myKyP8F' \
    --startDate 'XqY6Yevs' \
    > test.out 2>&1
eval_tap $? 33 'QueryTotalMatchmakingMatchTicket' test.out

#- 34 CreateXrayTicketObservability
./ng net.accelbyte.sdk.cli.Main sessionhistory createXrayTicketObservability \
    --namespace "$AB_NAMESPACE" \
    --body '{"action": "sbilMdOS", "activeAllianceRule": {"max_number": 88, "min_number": 68, "player_max_number": 55, "player_min_number": 66}, "activeMatchingRule": [{"attribute": "pA379QtN", "criteria": "fPMGWaFO", "reference": 0.7085474608052785}, {"attribute": "wvfMtO1D", "criteria": "ifVh1mK5", "reference": 0.7825687865415227}, {"attribute": "q3RDaORS", "criteria": "HEZyre7X", "reference": 0.5420453338221429}], "function": "aVDwhpSG", "gameMode": "Ii2XRNKf", "isBackfillMatch": true, "isRuleSetFlexed": true, "iteration": 29, "matchID": "m6PT6qhv", "namespace": "C8rGv6rR", "remainingPlayersPerTicket": [62, 58, 34], "remainingTickets": 35, "sessionTickID": "EK9mEKiH", "tickID": 20, "ticketID": "AI8OCvch", "timeToMatchSec": 0.232734657151484, "timestamp": "1975-10-15T00:00:00Z", "unbackfillReason": "6R0Y2DbG", "unmatchReason": "m6Gcp1gA"}' \
    > test.out 2>&1
eval_tap $? 34 'CreateXrayTicketObservability' test.out

#- 35 CreateXrayBulkTicketObservability
./ng net.accelbyte.sdk.cli.Main sessionhistory createXrayBulkTicketObservability \
    --namespace "$AB_NAMESPACE" \
    --body '{"ticketObservabilities": [{"action": "gR0eMnZb", "activeAllianceRule": {"max_number": 39, "min_number": 73, "player_max_number": 9, "player_min_number": 28}, "activeMatchingRule": [{"attribute": "5KaA4SQb", "criteria": "8bcugHwc", "reference": 0.45410388240852895}, {"attribute": "Hbaa1rWM", "criteria": "udKEiXRT", "reference": 0.5500117770275348}, {"attribute": "fWGBWKDj", "criteria": "PzJlAYYv", "reference": 0.14024945226885777}], "function": "ZDCNKINB", "gameMode": "pZcv2WtT", "isBackfillMatch": true, "isRuleSetFlexed": false, "iteration": 84, "matchID": "8EgaM76q", "namespace": "HaTIBHSh", "remainingPlayersPerTicket": [44, 96, 51], "remainingTickets": 82, "sessionTickID": "MRzlSszh", "tickID": 13, "ticketID": "MsuzqBLG", "timeToMatchSec": 0.8448367877300647, "timestamp": "1972-05-11T00:00:00Z", "unbackfillReason": "GHpnxZil", "unmatchReason": "uvI4gXAC"}, {"action": "4NJQNBOk", "activeAllianceRule": {"max_number": 17, "min_number": 1, "player_max_number": 4, "player_min_number": 1}, "activeMatchingRule": [{"attribute": "bZOF6A3F", "criteria": "uSbxDDOE", "reference": 0.40170202390850995}, {"attribute": "gGR1F3El", "criteria": "aD98j5wg", "reference": 0.4253742590933819}, {"attribute": "Iv4K4lQC", "criteria": "vMFtZFtl", "reference": 0.6949967511974335}], "function": "L13GXkH3", "gameMode": "0JQdYdYb", "isBackfillMatch": false, "isRuleSetFlexed": false, "iteration": 5, "matchID": "tCSVp8If", "namespace": "DdKcQ504", "remainingPlayersPerTicket": [89, 19, 58], "remainingTickets": 27, "sessionTickID": "vhKHcocN", "tickID": 19, "ticketID": "zepj8wby", "timeToMatchSec": 0.4904827740591652, "timestamp": "1976-08-29T00:00:00Z", "unbackfillReason": "R8PTYHQg", "unmatchReason": "03l58OQ0"}, {"action": "B9Y27gtG", "activeAllianceRule": {"max_number": 68, "min_number": 21, "player_max_number": 19, "player_min_number": 42}, "activeMatchingRule": [{"attribute": "E92sjBon", "criteria": "vy93kzTI", "reference": 0.029918025892822553}, {"attribute": "a7ht3ujH", "criteria": "2hbAP2uL", "reference": 0.8837517798133636}, {"attribute": "8D303uu4", "criteria": "LfdhEhAV", "reference": 0.7006091514970597}], "function": "M2BNGnqp", "gameMode": "HHHOQWWV", "isBackfillMatch": false, "isRuleSetFlexed": true, "iteration": 79, "matchID": "ntVlkncY", "namespace": "Qxi53sOJ", "remainingPlayersPerTicket": [8, 1, 79], "remainingTickets": 100, "sessionTickID": "75IUdhHI", "tickID": 76, "ticketID": "d2TqEuT2", "timeToMatchSec": 0.22005202427252368, "timestamp": "1975-04-19T00:00:00Z", "unbackfillReason": "UP8OU3lK", "unmatchReason": "pyx900OC"}]}' \
    > test.out 2>&1
eval_tap $? 35 'CreateXrayBulkTicketObservability' test.out

#- 36 QueryXrayTimelineByTicketID
./ng net.accelbyte.sdk.cli.Main sessionhistory queryXrayTimelineByTicketID \
    --namespace "$AB_NAMESPACE" \
    --ticketId 'w1Hh1nix' \
    --limit '41' \
    --offset '77' \
    --endDate 'k5mCnyTd' \
    --startDate 'YqHQWSXk' \
    > test.out 2>&1
eval_tap $? 36 'QueryXrayTimelineByTicketID' test.out

#- 37 QueryXrayTimelineByUserID
./ng net.accelbyte.sdk.cli.Main sessionhistory queryXrayTimelineByUserID \
    --namespace "$AB_NAMESPACE" \
    --userId 'eckzax2g' \
    --limit '65' \
    --offset '80' \
    --endDate 'YrzAFZB0' \
    --startDate 'WtGkuYOF' \
    > test.out 2>&1
eval_tap $? 37 'QueryXrayTimelineByUserID' test.out


rm -f "tmp.dat"

exit $EXIT_CODE