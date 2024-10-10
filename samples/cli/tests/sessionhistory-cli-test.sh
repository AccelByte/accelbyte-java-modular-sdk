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
    --body '{"logLevel": "debug"}' \
    > test.out 2>&1
eval_tap $? 5 'AdminPatchUpdateLogConfig' test.out

#- 6 AdminQueryGameSessionDetail
./ng net.accelbyte.sdk.cli.Main sessionhistory adminQueryGameSessionDetail \
    --namespace "$AB_NAMESPACE" \
    --endDate 'p47DOoBs' \
    --gameSessionID 'K858v4gj' \
    --limit '95' \
    --offset '64' \
    --order '5wktqhq2' \
    --orderBy '5PTpzSko' \
    --startDate 'Ez0EfFXf' \
    --userID '8DT7xduV' \
    > test.out 2>&1
eval_tap $? 6 'AdminQueryGameSessionDetail' test.out

#- 7 GetGameSessionDetail
./ng net.accelbyte.sdk.cli.Main sessionhistory getGameSessionDetail \
    --namespace "$AB_NAMESPACE" \
    --sessionId '3zJQxoMR' \
    > test.out 2>&1
eval_tap $? 7 'GetGameSessionDetail' test.out

#- 8 AdminQueryMatchmakingDetail
./ng net.accelbyte.sdk.cli.Main sessionhistory adminQueryMatchmakingDetail \
    --namespace "$AB_NAMESPACE" \
    --gameSessionID '3Hy78RxR' \
    --limit '27' \
    --offset '39' \
    --order 'I7GPrt2q' \
    --orderBy 'xoa0Rd7G' \
    --ticketID 'GgCPFPnc' \
    --userID '7H9IWHf1' \
    > test.out 2>&1
eval_tap $? 8 'AdminQueryMatchmakingDetail' test.out

#- 9 AdminGetMatchmakingDetailBySessionID
./ng net.accelbyte.sdk.cli.Main sessionhistory adminGetMatchmakingDetailBySessionID \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'L6lpiEiI' \
    > test.out 2>&1
eval_tap $? 9 'AdminGetMatchmakingDetailBySessionID' test.out

#- 10 AdminGetMatchmakingDetailByTicketID
./ng net.accelbyte.sdk.cli.Main sessionhistory adminGetMatchmakingDetailByTicketID \
    --namespace "$AB_NAMESPACE" \
    --ticketId 'QBTLRSp0' \
    > test.out 2>&1
eval_tap $? 10 'AdminGetMatchmakingDetailByTicketID' test.out

#- 11 AdminQueryPartyDetail
./ng net.accelbyte.sdk.cli.Main sessionhistory adminQueryPartyDetail \
    --namespace "$AB_NAMESPACE" \
    --limit '85' \
    --offset '89' \
    --order '7KlD70KG' \
    --orderBy 'LIXcIMdF' \
    --partyID 'NibRDpgL' \
    --userID 'eiYOL65P' \
    > test.out 2>&1
eval_tap $? 11 'AdminQueryPartyDetail' test.out

#- 12 GetPartyDetail
./ng net.accelbyte.sdk.cli.Main sessionhistory getPartyDetail \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'sr53uMan' \
    > test.out 2>&1
eval_tap $? 12 'GetPartyDetail' test.out

#- 13 AdminQueryTicketDetail
./ng net.accelbyte.sdk.cli.Main sessionhistory adminQueryTicketDetail \
    --namespace "$AB_NAMESPACE" \
    --endDate 'eqUaEQa1' \
    --gameMode 'bF35Arlc' \
    --limit '53' \
    --offset '69' \
    --order 'K4i3GIDo' \
    --partyID 'WljNv1vn' \
    --region 'fvYDnWpO' \
    --startDate 'wvPf7e5i' \
    --userIDs '1ryZFYQU' \
    > test.out 2>&1
eval_tap $? 13 'AdminQueryTicketDetail' test.out

#- 14 AdminTicketDetailGetByTicketID
./ng net.accelbyte.sdk.cli.Main sessionhistory adminTicketDetailGetByTicketID \
    --namespace "$AB_NAMESPACE" \
    --ticketId 'popbjpyF' \
    > test.out 2>&1
eval_tap $? 14 'AdminTicketDetailGetByTicketID' test.out

#- 15 PublicQueryGameSessionMe
./ng net.accelbyte.sdk.cli.Main sessionhistory publicQueryGameSessionMe \
    --namespace "$AB_NAMESPACE" \
    --limit '43' \
    --offset '100' \
    --order 'uPZITZKp' \
    > test.out 2>&1
eval_tap $? 15 'PublicQueryGameSessionMe' test.out

#- 16 QueryXrayMatchPool
./ng net.accelbyte.sdk.cli.Main sessionhistory queryXrayMatchPool \
    --namespace "$AB_NAMESPACE" \
    --poolName 'cNnfqvRG,S4Zqd6yr,jrUOZG82' \
    --endDate 'hNZ6Vx4U' \
    --startDate 'IMSJsekS' \
    > test.out 2>&1
eval_tap $? 16 'QueryXrayMatchPool' test.out

#- 17 QueryDetailTickMatchPool
./ng net.accelbyte.sdk.cli.Main sessionhistory queryDetailTickMatchPool \
    --namespace "$AB_NAMESPACE" \
    --podName 'zZ4sZgHM' \
    --poolName 'hISMKpRY' \
    --all  \
    --limit '75' \
    --offset '7' \
    --endDate 'IG6EANyu' \
    --startDate 'xoBy5TZs' \
    > test.out 2>&1
eval_tap $? 17 'QueryDetailTickMatchPool' test.out

#- 18 QueryDetailTickMatchPoolMatches
./ng net.accelbyte.sdk.cli.Main sessionhistory queryDetailTickMatchPoolMatches \
    --namespace "$AB_NAMESPACE" \
    --podName 'nSGlTITv' \
    --poolName 'yFHT4dNm' \
    --tickId 'zwtkzdrJ' \
    > test.out 2>&1
eval_tap $? 18 'QueryDetailTickMatchPoolMatches' test.out

#- 19 QueryDetailTickMatchPoolTicket
./ng net.accelbyte.sdk.cli.Main sessionhistory queryDetailTickMatchPoolTicket \
    --namespace "$AB_NAMESPACE" \
    --podName '5L5x0pKx' \
    --poolName 'ujqXp1lG' \
    --tickId 'QXLoRz4a' \
    > test.out 2>&1
eval_tap $? 19 'QueryDetailTickMatchPoolTicket' test.out

#- 20 QueryMatchHistories
./ng net.accelbyte.sdk.cli.Main sessionhistory queryMatchHistories \
    --matchId 'iSACZDRE' \
    --namespace "$AB_NAMESPACE" \
    --limit '90' \
    --offset '84' \
    > test.out 2>&1
eval_tap $? 20 'QueryMatchHistories' test.out

#- 21 QueryMatchTicketHistories
./ng net.accelbyte.sdk.cli.Main sessionhistory queryMatchTicketHistories \
    --matchId '7taI7OZO' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 21 'QueryMatchTicketHistories' test.out

#- 22 QueryXrayMatch
./ng net.accelbyte.sdk.cli.Main sessionhistory queryXrayMatch \
    --matchId 'aGDO81JJ' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 22 'QueryXrayMatch' test.out

#- 23 QueryAcquiringDS
./ng net.accelbyte.sdk.cli.Main sessionhistory queryAcquiringDS \
    --namespace "$AB_NAMESPACE" \
    --matchPool 'qcVBC62s,cbdluUio,uHmvou5p' \
    --endDate 'Ad1RpmBb' \
    --startDate 'ifzbPPqV' \
    > test.out 2>&1
eval_tap $? 23 'QueryAcquiringDS' test.out

#- 24 QueryAcquiringDSWaitTimeAvg
./ng net.accelbyte.sdk.cli.Main sessionhistory queryAcquiringDSWaitTimeAvg \
    --namespace "$AB_NAMESPACE" \
    --matchPool '7u8wSVnj,BkphCKC9,hJLrgJL3' \
    --endDate 'PAipsrAj' \
    --startDate 'ZtrKkbLH' \
    > test.out 2>&1
eval_tap $? 24 'QueryAcquiringDSWaitTimeAvg' test.out

#- 25 QueryMatchLengthDurationpAvg
./ng net.accelbyte.sdk.cli.Main sessionhistory queryMatchLengthDurationpAvg \
    --namespace "$AB_NAMESPACE" \
    --matchPool 'I63KYQME,NxYx2wJM,Qtzq8TE6' \
    --endDate '9odnrW9x' \
    --startDate '3rc2jtao' \
    > test.out 2>&1
eval_tap $? 25 'QueryMatchLengthDurationpAvg' test.out

#- 26 QueryMatchLengthDurationp99
./ng net.accelbyte.sdk.cli.Main sessionhistory queryMatchLengthDurationp99 \
    --namespace "$AB_NAMESPACE" \
    --matchPool 'SmuyqVRA,QMBC9DjA,hY39jUpR' \
    --endDate 'PDprxF1n' \
    --startDate 'B9RaBYKf' \
    > test.out 2>&1
eval_tap $? 26 'QueryMatchLengthDurationp99' test.out

#- 27 QueryTotalActiveSession
./ng net.accelbyte.sdk.cli.Main sessionhistory queryTotalActiveSession \
    --namespace "$AB_NAMESPACE" \
    --matchPool '0Jv7uJam,fFhfD6w5,YyWs43Zh' \
    --region 'dUgY98kg' \
    --endDate 'O10XrHWQ' \
    --startDate 'IEPKEDw1' \
    > test.out 2>&1
eval_tap $? 27 'QueryTotalActiveSession' test.out

#- 28 QueryTotalMatchmakingMatch
./ng net.accelbyte.sdk.cli.Main sessionhistory queryTotalMatchmakingMatch \
    --namespace "$AB_NAMESPACE" \
    --matchPool 'fQGtmtF3,po6K5QXb,o4Yf33UR' \
    --endDate 'U5eRawbl' \
    --startDate 'CEZiyF7U' \
    > test.out 2>&1
eval_tap $? 28 'QueryTotalMatchmakingMatch' test.out

#- 29 QueryTotalPlayerPersession
./ng net.accelbyte.sdk.cli.Main sessionhistory queryTotalPlayerPersession \
    --namespace "$AB_NAMESPACE" \
    --matchPool 'okUiHOoV,OrAs1JLo,ZQkWDAsD' \
    --endDate 'nyDKjceq' \
    --startDate '7YKSqiwK' \
    > test.out 2>&1
eval_tap $? 29 'QueryTotalPlayerPersession' test.out

#- 30 QueryTotalMatchmakingCanceled
./ng net.accelbyte.sdk.cli.Main sessionhistory queryTotalMatchmakingCanceled \
    --namespace "$AB_NAMESPACE" \
    --matchPool 'XDBbY5mq,ZITNvdqk,i2I6C8b0' \
    --endDate '9BXJpjtm' \
    --startDate 'Q3De2vvZ' \
    > test.out 2>&1
eval_tap $? 30 'QueryTotalMatchmakingCanceled' test.out

#- 31 QueryTotalMatchmakingCreated
./ng net.accelbyte.sdk.cli.Main sessionhistory queryTotalMatchmakingCreated \
    --namespace "$AB_NAMESPACE" \
    --matchPool 'yr3C80Su,T1fTBh0F,DrqnNiqf' \
    --endDate 'Blw6LLNk' \
    --startDate 'N5ywkoSl' \
    > test.out 2>&1
eval_tap $? 31 'QueryTotalMatchmakingCreated' test.out

#- 32 QueryTotalMatchmakingExpired
./ng net.accelbyte.sdk.cli.Main sessionhistory queryTotalMatchmakingExpired \
    --namespace "$AB_NAMESPACE" \
    --matchPool 'WKftGfnd,8KLgP4Fh,QZlchKET' \
    --endDate 'LEbqo2Hp' \
    --startDate 'RD57lT2G' \
    > test.out 2>&1
eval_tap $? 32 'QueryTotalMatchmakingExpired' test.out

#- 33 QueryTotalMatchmakingMatchTicket
./ng net.accelbyte.sdk.cli.Main sessionhistory queryTotalMatchmakingMatchTicket \
    --namespace "$AB_NAMESPACE" \
    --matchPool 'pbLPMEtU,bSR0Iwru,dQJtsCLN' \
    --endDate 'pLkLXG5x' \
    --startDate 'hwp4YnfU' \
    > test.out 2>&1
eval_tap $? 33 'QueryTotalMatchmakingMatchTicket' test.out

#- 34 CreateXrayTicketObservability
./ng net.accelbyte.sdk.cli.Main sessionhistory createXrayTicketObservability \
    --namespace "$AB_NAMESPACE" \
    --body '{"action": "t7zXRAC6", "activeAllianceRule": {"max_number": 12, "min_number": 76, "player_max_number": 9, "player_min_number": 22}, "activeMatchingRule": [{"attribute": "u1vLuSwq", "criteria": "BxoUErDB", "reference": 0.8796179998670769}, {"attribute": "oBj10Bai", "criteria": "m29s6H1Z", "reference": 0.3436885954320362}, {"attribute": "EgVQuu7H", "criteria": "wbAR3YsU", "reference": 0.7641236961431718}], "function": "sxsqmAQd", "gameMode": "Xy9SnjIw", "isBackfillMatch": true, "isRuleSetFlexed": true, "iteration": 24, "matchID": "YJjFSFuO", "namespace": "RyLCR5zw", "remainingPlayersPerTicket": [88, 57, 63], "remainingTickets": 73, "sessionTickID": "DuYycceu", "tickID": 17, "ticketID": "pHxOrLJ0", "timeToMatchSec": 0.0019201398041147621, "timestamp": "1971-04-04T00:00:00Z", "unbackfillReason": "hi8c1siH", "unmatchReason": "yrhN8xJ6"}' \
    > test.out 2>&1
eval_tap $? 34 'CreateXrayTicketObservability' test.out

#- 35 CreateXrayBulkTicketObservability
./ng net.accelbyte.sdk.cli.Main sessionhistory createXrayBulkTicketObservability \
    --namespace "$AB_NAMESPACE" \
    --body '{"ticketObservabilities": [{"action": "qWNAsrrt", "activeAllianceRule": {"max_number": 20, "min_number": 79, "player_max_number": 7, "player_min_number": 48}, "activeMatchingRule": [{"attribute": "ltwK7SvZ", "criteria": "m4ao5FyI", "reference": 0.6236301436864181}, {"attribute": "tlUApBlZ", "criteria": "9AypYzQQ", "reference": 0.30069621724822415}, {"attribute": "KakLhTU3", "criteria": "yEDaL0AY", "reference": 0.908780843117542}], "function": "u3yBmAUM", "gameMode": "60nuXLlT", "isBackfillMatch": false, "isRuleSetFlexed": true, "iteration": 23, "matchID": "T9nYLACI", "namespace": "72Dz9J3x", "remainingPlayersPerTicket": [13, 84, 21], "remainingTickets": 51, "sessionTickID": "gpFx2XJI", "tickID": 83, "ticketID": "VwUIzujz", "timeToMatchSec": 0.18551908770857461, "timestamp": "1988-03-14T00:00:00Z", "unbackfillReason": "s8WM4Pdt", "unmatchReason": "pN2sRKMi"}, {"action": "stBDtzED", "activeAllianceRule": {"max_number": 20, "min_number": 29, "player_max_number": 34, "player_min_number": 47}, "activeMatchingRule": [{"attribute": "216SY25C", "criteria": "uhUeRw8J", "reference": 0.3756964534030952}, {"attribute": "B99YwQgt", "criteria": "1bInQx8j", "reference": 0.7960408998120226}, {"attribute": "VvJO2J6p", "criteria": "HiJVFN9k", "reference": 0.7885608913642653}], "function": "K2iYcsXI", "gameMode": "4RmDn2RQ", "isBackfillMatch": false, "isRuleSetFlexed": true, "iteration": 32, "matchID": "2e3yR4gJ", "namespace": "ixQ5W6lC", "remainingPlayersPerTicket": [19, 48, 16], "remainingTickets": 37, "sessionTickID": "B3TJe7Kf", "tickID": 89, "ticketID": "6x2u1XyX", "timeToMatchSec": 0.8156621504296551, "timestamp": "1977-05-02T00:00:00Z", "unbackfillReason": "0Mgb6AJo", "unmatchReason": "cXSe83E9"}, {"action": "eywc7Cbn", "activeAllianceRule": {"max_number": 57, "min_number": 20, "player_max_number": 94, "player_min_number": 87}, "activeMatchingRule": [{"attribute": "LJRjL0dS", "criteria": "rDv6cstH", "reference": 0.20977064954130809}, {"attribute": "UcRvc4Kv", "criteria": "PUEv4A2j", "reference": 0.21114840022505232}, {"attribute": "QqDF5NWc", "criteria": "gH8hvzVo", "reference": 0.4263493863966673}], "function": "dtQS6wz1", "gameMode": "ZltrOKJ8", "isBackfillMatch": true, "isRuleSetFlexed": false, "iteration": 84, "matchID": "rBaOWcDF", "namespace": "LTGwecPH", "remainingPlayersPerTicket": [83, 61, 35], "remainingTickets": 46, "sessionTickID": "MiKozZC5", "tickID": 72, "ticketID": "ytDG7Abk", "timeToMatchSec": 0.8295696900617104, "timestamp": "1999-06-14T00:00:00Z", "unbackfillReason": "GGAjve3v", "unmatchReason": "a5gRoK45"}]}' \
    > test.out 2>&1
eval_tap $? 35 'CreateXrayBulkTicketObservability' test.out

#- 36 QueryXrayTimelineByTicketID
./ng net.accelbyte.sdk.cli.Main sessionhistory queryXrayTimelineByTicketID \
    --namespace "$AB_NAMESPACE" \
    --ticketId 'r6ha8mQH' \
    --limit '51' \
    --offset '63' \
    --endDate 'EGheekjj' \
    --startDate 'KfrSO9hD' \
    > test.out 2>&1
eval_tap $? 36 'QueryXrayTimelineByTicketID' test.out

#- 37 QueryXrayTimelineByUserID
./ng net.accelbyte.sdk.cli.Main sessionhistory queryXrayTimelineByUserID \
    --namespace "$AB_NAMESPACE" \
    --userId 'L8U2MJ4Q' \
    --limit '27' \
    --offset '27' \
    --endDate 'B2JxLLQJ' \
    --startDate 's4G3q9w0' \
    > test.out 2>&1
eval_tap $? 37 'QueryXrayTimelineByUserID' test.out


rm -f "tmp.dat"

exit $EXIT_CODE