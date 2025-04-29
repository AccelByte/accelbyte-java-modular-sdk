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
    --body '{"SESSION_DELETION_GRACE_PERIOD": 86}' \
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
    --completedOnly 'cvTDbPpT' \
    --configurationName 'NEkEIhvA' \
    --dsPodName 'mNp69yDe' \
    --endDate 'X7NUhezs' \
    --gameSessionID 'SZes2OOC' \
    --isPersistent '3KxMcVPK' \
    --joinability 'Fpf2XHoF' \
    --limit '34' \
    --matchPool 'lJTEfea2' \
    --offset '41' \
    --order 'yFgNyMxa' \
    --orderBy 'Ndhh5bps' \
    --startDate '5ZUlV777' \
    --statusV2 'k64C8fPc' \
    --userID 'F4iqx2tl' \
    > test.out 2>&1
eval_tap $? 8 'AdminQueryGameSessionDetail' test.out

#- 9 GetGameSessionDetail
./ng net.accelbyte.sdk.cli.Main sessionhistory getGameSessionDetail \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'hiW0qWDj' \
    > test.out 2>&1
eval_tap $? 9 'GetGameSessionDetail' test.out

#- 10 AdminQueryMatchmakingDetail
./ng net.accelbyte.sdk.cli.Main sessionhistory adminQueryMatchmakingDetail \
    --namespace "$AB_NAMESPACE" \
    --gameSessionID 'jqLrFSvR' \
    --limit '70' \
    --offset '98' \
    --order '3LkYBjnx' \
    --orderBy 'XxlzfBis' \
    --ticketID 'E82kmHlq' \
    --userID 'q5CnThbv' \
    > test.out 2>&1
eval_tap $? 10 'AdminQueryMatchmakingDetail' test.out

#- 11 AdminGetMatchmakingDetailBySessionID
./ng net.accelbyte.sdk.cli.Main sessionhistory adminGetMatchmakingDetailBySessionID \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'CS4Y4Cpb' \
    > test.out 2>&1
eval_tap $? 11 'AdminGetMatchmakingDetailBySessionID' test.out

#- 12 AdminGetMatchmakingDetailByTicketID
./ng net.accelbyte.sdk.cli.Main sessionhistory adminGetMatchmakingDetailByTicketID \
    --namespace "$AB_NAMESPACE" \
    --ticketId '0QPwFUi1' \
    > test.out 2>&1
eval_tap $? 12 'AdminGetMatchmakingDetailByTicketID' test.out

#- 13 AdminQueryPartyDetail
./ng net.accelbyte.sdk.cli.Main sessionhistory adminQueryPartyDetail \
    --namespace "$AB_NAMESPACE" \
    --endDate '5rh7Os2Q' \
    --joinability 'eJXV3FOP' \
    --leaderID 'hmw8anHu' \
    --limit '65' \
    --offset '60' \
    --order 'dma5KWGm' \
    --orderBy 'tFzjrjPc' \
    --partyID 'RCoFjHeN' \
    --startDate 'yC9vB9Qs' \
    --userID 'hraLjZsn' \
    > test.out 2>&1
eval_tap $? 13 'AdminQueryPartyDetail' test.out

#- 14 GetPartyDetail
./ng net.accelbyte.sdk.cli.Main sessionhistory getPartyDetail \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'XGvxNiXr' \
    > test.out 2>&1
eval_tap $? 14 'GetPartyDetail' test.out

#- 15 AdminQueryTicketDetail
./ng net.accelbyte.sdk.cli.Main sessionhistory adminQueryTicketDetail \
    --namespace "$AB_NAMESPACE" \
    --endDate '0pBUPJqs' \
    --gameMode 'rHMfR70e' \
    --limit '96' \
    --offset '31' \
    --order 'ZMFPgex6' \
    --partyID 'KRAryjnz' \
    --region 'BUJhjJEr' \
    --startDate 'nybwgn9T' \
    --userIDs 'Vp3Il6ud' \
    > test.out 2>&1
eval_tap $? 15 'AdminQueryTicketDetail' test.out

#- 16 AdminTicketDetailGetByTicketID
./ng net.accelbyte.sdk.cli.Main sessionhistory adminTicketDetailGetByTicketID \
    --namespace "$AB_NAMESPACE" \
    --ticketId 'EnCVJYAy' \
    > test.out 2>&1
eval_tap $? 16 'AdminTicketDetailGetByTicketID' test.out

#- 17 PublicQueryGameSessionMe
./ng net.accelbyte.sdk.cli.Main sessionhistory publicQueryGameSessionMe \
    --namespace "$AB_NAMESPACE" \
    --limit '98' \
    --offset '21' \
    --order 'ofywP9NT' \
    > test.out 2>&1
eval_tap $? 17 'PublicQueryGameSessionMe' test.out

#- 18 QueryXrayMatchPool
./ng net.accelbyte.sdk.cli.Main sessionhistory queryXrayMatchPool \
    --namespace "$AB_NAMESPACE" \
    --poolName '6cy3PbJW,K2Q6EhYt,4Tc942zI' \
    --endDate '3tPIShkS' \
    --startDate '9Md6kTgZ' \
    > test.out 2>&1
eval_tap $? 18 'QueryXrayMatchPool' test.out

#- 19 QueryDetailTickMatchPool
./ng net.accelbyte.sdk.cli.Main sessionhistory queryDetailTickMatchPool \
    --namespace "$AB_NAMESPACE" \
    --podName 'RqcVMC26' \
    --poolName 'JUjIHzzF' \
    --all  \
    --limit '88' \
    --offset '19' \
    --endDate 'qtgGYocA' \
    --startDate '7hCBCE5W' \
    > test.out 2>&1
eval_tap $? 19 'QueryDetailTickMatchPool' test.out

#- 20 QueryDetailTickMatchPoolMatches
./ng net.accelbyte.sdk.cli.Main sessionhistory queryDetailTickMatchPoolMatches \
    --namespace "$AB_NAMESPACE" \
    --podName 'qZVIuIWZ' \
    --poolName 'JVJh29zz' \
    --tickId 'Ik5sOejH' \
    > test.out 2>&1
eval_tap $? 20 'QueryDetailTickMatchPoolMatches' test.out

#- 21 QueryDetailTickMatchPoolTicket
./ng net.accelbyte.sdk.cli.Main sessionhistory queryDetailTickMatchPoolTicket \
    --namespace "$AB_NAMESPACE" \
    --podName 'EI7K094u' \
    --poolName 'FGLACauq' \
    --tickId 'BKuDhvck' \
    > test.out 2>&1
eval_tap $? 21 'QueryDetailTickMatchPoolTicket' test.out

#- 22 QueryMatchHistories
./ng net.accelbyte.sdk.cli.Main sessionhistory queryMatchHistories \
    --matchId 'dBQKWgqf' \
    --namespace "$AB_NAMESPACE" \
    --limit '44' \
    --offset '50' \
    > test.out 2>&1
eval_tap $? 22 'QueryMatchHistories' test.out

#- 23 QueryMatchTicketHistories
./ng net.accelbyte.sdk.cli.Main sessionhistory queryMatchTicketHistories \
    --matchId 'CALph3v3' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 23 'QueryMatchTicketHistories' test.out

#- 24 QueryXrayMatch
./ng net.accelbyte.sdk.cli.Main sessionhistory queryXrayMatch \
    --matchId 'LyUeelww' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 24 'QueryXrayMatch' test.out

#- 25 QueryAcquiringDS
./ng net.accelbyte.sdk.cli.Main sessionhistory queryAcquiringDS \
    --namespace "$AB_NAMESPACE" \
    --matchPool 'JWzcc4sC,XqN4mHEL,0zacBapE' \
    --endDate 'Fer3m0qd' \
    --startDate 'Hu7w9bYj' \
    > test.out 2>&1
eval_tap $? 25 'QueryAcquiringDS' test.out

#- 26 QueryAcquiringDSWaitTimeAvg
./ng net.accelbyte.sdk.cli.Main sessionhistory queryAcquiringDSWaitTimeAvg \
    --namespace "$AB_NAMESPACE" \
    --matchPool 'FXvRGHbp,ARqhFRX9,zacBAwnJ' \
    --endDate 'pGtkROKE' \
    --startDate 'YtWJD9BP' \
    > test.out 2>&1
eval_tap $? 26 'QueryAcquiringDSWaitTimeAvg' test.out

#- 27 QueryMatchLengthDurationpAvg
./ng net.accelbyte.sdk.cli.Main sessionhistory queryMatchLengthDurationpAvg \
    --namespace "$AB_NAMESPACE" \
    --matchPool '1KH0GPlH,pgpDRBRv,Xf23hVcl' \
    --endDate 'iQP2Zm4T' \
    --startDate 'ucynVRGv' \
    > test.out 2>&1
eval_tap $? 27 'QueryMatchLengthDurationpAvg' test.out

#- 28 QueryMatchLengthDurationp99
./ng net.accelbyte.sdk.cli.Main sessionhistory queryMatchLengthDurationp99 \
    --namespace "$AB_NAMESPACE" \
    --matchPool 'HG09VnPG,KLOefMkT,PalCakR9' \
    --endDate 'tZJY70iw' \
    --startDate 'GoYPgR9P' \
    > test.out 2>&1
eval_tap $? 28 'QueryMatchLengthDurationp99' test.out

#- 29 QueryTotalActiveSession
./ng net.accelbyte.sdk.cli.Main sessionhistory queryTotalActiveSession \
    --namespace "$AB_NAMESPACE" \
    --matchPool 'AtUPUyZ6,xJxgyU3Z,LsT26RIg' \
    --region '6ZSDH8rp' \
    --endDate 'PYN80Hqk' \
    --startDate '3wkL7cI3' \
    > test.out 2>&1
eval_tap $? 29 'QueryTotalActiveSession' test.out

#- 30 QueryTotalMatchmakingMatch
./ng net.accelbyte.sdk.cli.Main sessionhistory queryTotalMatchmakingMatch \
    --namespace "$AB_NAMESPACE" \
    --matchPool '6dXp7VX6,YyVoqAP3,ca0rr591' \
    --endDate 'zM8WFpQ9' \
    --startDate '4p6zrlIY' \
    > test.out 2>&1
eval_tap $? 30 'QueryTotalMatchmakingMatch' test.out

#- 31 QueryTotalPlayerPersession
./ng net.accelbyte.sdk.cli.Main sessionhistory queryTotalPlayerPersession \
    --namespace "$AB_NAMESPACE" \
    --matchPool 'pvKrj9TG,RZezdvDA,JPlYANS9' \
    --endDate '5RcQg1j9' \
    --startDate '49m8gYb3' \
    > test.out 2>&1
eval_tap $? 31 'QueryTotalPlayerPersession' test.out

#- 32 QueryTotalMatchmakingCanceled
./ng net.accelbyte.sdk.cli.Main sessionhistory queryTotalMatchmakingCanceled \
    --namespace "$AB_NAMESPACE" \
    --matchPool 'aVIbWuQD,oq3Z4i6U,Aig0fVEu' \
    --endDate 'jsYB19Sr' \
    --startDate 'n3XnPXDc' \
    > test.out 2>&1
eval_tap $? 32 'QueryTotalMatchmakingCanceled' test.out

#- 33 QueryTotalMatchmakingCreated
./ng net.accelbyte.sdk.cli.Main sessionhistory queryTotalMatchmakingCreated \
    --namespace "$AB_NAMESPACE" \
    --matchPool 'mzYPpqU5,WmkuYA8c,qIxWBDzH' \
    --endDate 'coxenorv' \
    --startDate 'jInOCgTz' \
    > test.out 2>&1
eval_tap $? 33 'QueryTotalMatchmakingCreated' test.out

#- 34 QueryTotalMatchmakingExpired
./ng net.accelbyte.sdk.cli.Main sessionhistory queryTotalMatchmakingExpired \
    --namespace "$AB_NAMESPACE" \
    --matchPool 'D1pE9HWP,hgO7GkA5,A8AsORrk' \
    --endDate '6KSnmdIt' \
    --startDate '0S6P14pS' \
    > test.out 2>&1
eval_tap $? 34 'QueryTotalMatchmakingExpired' test.out

#- 35 QueryTotalMatchmakingMatchTicket
./ng net.accelbyte.sdk.cli.Main sessionhistory queryTotalMatchmakingMatchTicket \
    --namespace "$AB_NAMESPACE" \
    --matchPool 'UKPAWJoK,t0xVqxYD,i9JHrLYI' \
    --endDate 'mKEAaT6O' \
    --startDate 'Oquuxc29' \
    > test.out 2>&1
eval_tap $? 35 'QueryTotalMatchmakingMatchTicket' test.out

#- 36 CreateXrayTicketObservability
./ng net.accelbyte.sdk.cli.Main sessionhistory createXrayTicketObservability \
    --namespace "$AB_NAMESPACE" \
    --body '{"action": "mF11klPm", "activeAllianceRule": {"max_number": 48, "min_number": 5, "player_max_number": 97, "player_min_number": 28}, "activeMatchingRule": [{"attribute": "RiFU6KKk", "criteria": "D9cqQL0v", "reference": 0.21237830938589486}, {"attribute": "GkUUPUHi", "criteria": "YZpYKu9R", "reference": 0.8932052521625573}, {"attribute": "kn2JHXMw", "criteria": "WmxDqJAG", "reference": 0.1574356329292288}], "function": "36f48Awk", "gameMode": "a2e68LqX", "isBackfillMatch": true, "isRuleSetFlexed": false, "iteration": 53, "matchID": "DFBy2Iwy", "namespace": "nKwnFiTG", "remainingPlayersPerTicket": [51, 78, 85], "remainingTickets": 15, "sessionTickID": "P47U9rQ3", "tickID": 92, "ticketID": "3AUKkBmH", "timeToMatchSec": 0.6148692288766517, "timestamp": "1995-08-12T00:00:00Z", "unbackfillReason": "ilGcYiFe", "unmatchReason": "zbHbK0NF"}' \
    > test.out 2>&1
eval_tap $? 36 'CreateXrayTicketObservability' test.out

#- 37 CreateXrayBulkTicketObservability
./ng net.accelbyte.sdk.cli.Main sessionhistory createXrayBulkTicketObservability \
    --namespace "$AB_NAMESPACE" \
    --body '{"ticketObservabilities": [{"action": "abjhfzQ0", "activeAllianceRule": {"max_number": 98, "min_number": 72, "player_max_number": 94, "player_min_number": 12}, "activeMatchingRule": [{"attribute": "jO1cAc4J", "criteria": "p3FscMVX", "reference": 0.9987656446792978}, {"attribute": "8If2ObJB", "criteria": "4I7cl5rl", "reference": 0.4559102918074489}, {"attribute": "eVdxLyVI", "criteria": "dFRVaBcD", "reference": 0.9392179259152716}], "function": "tDjq1O0u", "gameMode": "e57Zk2Ri", "isBackfillMatch": true, "isRuleSetFlexed": false, "iteration": 24, "matchID": "Ndl73dam", "namespace": "vysQZ1Yu", "remainingPlayersPerTicket": [24, 25, 32], "remainingTickets": 19, "sessionTickID": "cYNa9Mw1", "tickID": 69, "ticketID": "lzMEf3QO", "timeToMatchSec": 0.07426253641391567, "timestamp": "1998-10-22T00:00:00Z", "unbackfillReason": "BiWxmxaS", "unmatchReason": "8jPZKUUL"}, {"action": "a13xYklq", "activeAllianceRule": {"max_number": 6, "min_number": 64, "player_max_number": 48, "player_min_number": 54}, "activeMatchingRule": [{"attribute": "NsxdFGxe", "criteria": "bsCGrZOl", "reference": 0.047588015717723975}, {"attribute": "kUfjSIQU", "criteria": "UgvtqVHe", "reference": 0.7110733896481884}, {"attribute": "UHC2N31O", "criteria": "C06cXuFT", "reference": 0.06125903379593245}], "function": "paScGj6f", "gameMode": "6BgDxxjY", "isBackfillMatch": true, "isRuleSetFlexed": true, "iteration": 32, "matchID": "W5n21nuN", "namespace": "1lMfTn0B", "remainingPlayersPerTicket": [63, 48, 50], "remainingTickets": 84, "sessionTickID": "ysfpQnTw", "tickID": 87, "ticketID": "p0FQQcoe", "timeToMatchSec": 0.20197206277318225, "timestamp": "1976-03-03T00:00:00Z", "unbackfillReason": "VWZPyneX", "unmatchReason": "Nm3SQ25T"}, {"action": "5gT72U7E", "activeAllianceRule": {"max_number": 97, "min_number": 11, "player_max_number": 59, "player_min_number": 50}, "activeMatchingRule": [{"attribute": "3PDCD9gg", "criteria": "1PfiAzzR", "reference": 0.7018079731514845}, {"attribute": "pDNsvGdv", "criteria": "j273I5hP", "reference": 0.9259333922033729}, {"attribute": "UPOvBPNV", "criteria": "bAkCw9Pu", "reference": 0.41953576360191946}], "function": "7Zqz1t3L", "gameMode": "0gESgXnd", "isBackfillMatch": false, "isRuleSetFlexed": true, "iteration": 79, "matchID": "V8f2JRWb", "namespace": "9kHa8QVw", "remainingPlayersPerTicket": [28, 72, 46], "remainingTickets": 92, "sessionTickID": "QMiMUgY2", "tickID": 32, "ticketID": "GC8Qqx7P", "timeToMatchSec": 0.48287496657384976, "timestamp": "1985-01-03T00:00:00Z", "unbackfillReason": "v25S0dY7", "unmatchReason": "DiKTZFyB"}]}' \
    > test.out 2>&1
eval_tap $? 37 'CreateXrayBulkTicketObservability' test.out

#- 38 QueryXrayTimelineByTicketID
./ng net.accelbyte.sdk.cli.Main sessionhistory queryXrayTimelineByTicketID \
    --namespace "$AB_NAMESPACE" \
    --ticketId 'QbKOzzCt' \
    --limit '92' \
    --offset '58' \
    --endDate 'wZheiat3' \
    --startDate 'iTBxppVp' \
    > test.out 2>&1
eval_tap $? 38 'QueryXrayTimelineByTicketID' test.out

#- 39 QueryXrayTimelineByUserID
./ng net.accelbyte.sdk.cli.Main sessionhistory queryXrayTimelineByUserID \
    --namespace "$AB_NAMESPACE" \
    --userId 'JrizVuns' \
    --limit '79' \
    --offset '52' \
    --order 'wvzJciRX' \
    --orderBy 'DJnpJ5VB' \
    --endDate 'PsQiEMci' \
    --startDate 'vK65VgaK' \
    > test.out 2>&1
eval_tap $? 39 'QueryXrayTimelineByUserID' test.out


rm -f "tmp.dat"

exit $EXIT_CODE