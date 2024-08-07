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
echo "1..36"

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
    --body '{"logLevel": "trace"}' \
    > test.out 2>&1
eval_tap $? 5 'AdminPatchUpdateLogConfig' test.out

#- 6 AdminQueryGameSessionDetail
./ng net.accelbyte.sdk.cli.Main sessionhistory adminQueryGameSessionDetail \
    --namespace "$AB_NAMESPACE" \
    --endDate 'SIApe3V0' \
    --gameSessionID 'I9Fwb8cR' \
    --limit '68' \
    --offset '41' \
    --order 'ldJXl6g8' \
    --orderBy 'Oes0oEl5' \
    --startDate '2M76ZBMI' \
    --userID 'sTxK4gzj' \
    > test.out 2>&1
eval_tap $? 6 'AdminQueryGameSessionDetail' test.out

#- 7 GetGameSessionDetail
./ng net.accelbyte.sdk.cli.Main sessionhistory getGameSessionDetail \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'LpU1njMG' \
    > test.out 2>&1
eval_tap $? 7 'GetGameSessionDetail' test.out

#- 8 AdminQueryMatchmakingDetail
./ng net.accelbyte.sdk.cli.Main sessionhistory adminQueryMatchmakingDetail \
    --namespace "$AB_NAMESPACE" \
    --gameSessionID 'TwXpYB1J' \
    --limit '66' \
    --offset '78' \
    --order 'WxYOp849' \
    --orderBy 'STXhDRN3' \
    --ticketID 'uFJNAeDv' \
    --userID 'p5f0soT6' \
    > test.out 2>&1
eval_tap $? 8 'AdminQueryMatchmakingDetail' test.out

#- 9 AdminGetMatchmakingDetailBySessionID
./ng net.accelbyte.sdk.cli.Main sessionhistory adminGetMatchmakingDetailBySessionID \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'CybK5FzD' \
    > test.out 2>&1
eval_tap $? 9 'AdminGetMatchmakingDetailBySessionID' test.out

#- 10 AdminGetMatchmakingDetailByTicketID
./ng net.accelbyte.sdk.cli.Main sessionhistory adminGetMatchmakingDetailByTicketID \
    --namespace "$AB_NAMESPACE" \
    --ticketId 'H6gg7xSY' \
    > test.out 2>&1
eval_tap $? 10 'AdminGetMatchmakingDetailByTicketID' test.out

#- 11 AdminQueryPartyDetail
./ng net.accelbyte.sdk.cli.Main sessionhistory adminQueryPartyDetail \
    --namespace "$AB_NAMESPACE" \
    --limit '100' \
    --offset '63' \
    --order 'Prpxr9J9' \
    --orderBy 'fIcDoOqD' \
    --partyID '9SSeEJ0y' \
    --userID 'jsLyzkoz' \
    > test.out 2>&1
eval_tap $? 11 'AdminQueryPartyDetail' test.out

#- 12 GetPartyDetail
./ng net.accelbyte.sdk.cli.Main sessionhistory getPartyDetail \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'nJFdg29Y' \
    > test.out 2>&1
eval_tap $? 12 'GetPartyDetail' test.out

#- 13 AdminQueryTicketDetail
./ng net.accelbyte.sdk.cli.Main sessionhistory adminQueryTicketDetail \
    --namespace "$AB_NAMESPACE" \
    --endDate 'e8M0nOvS' \
    --gameMode 'Z97weSKT' \
    --limit '6' \
    --offset '44' \
    --order 'nnn7lYI8' \
    --partyID 'BGrSHYe4' \
    --region 'R5TAGMWc' \
    --startDate 'iXBWVfb8' \
    --userIDs 'fPVtqI8B' \
    > test.out 2>&1
eval_tap $? 13 'AdminQueryTicketDetail' test.out

#- 14 AdminTicketDetailGetByTicketID
./ng net.accelbyte.sdk.cli.Main sessionhistory adminTicketDetailGetByTicketID \
    --namespace "$AB_NAMESPACE" \
    --ticketId '07y9Limj' \
    > test.out 2>&1
eval_tap $? 14 'AdminTicketDetailGetByTicketID' test.out

#- 15 PublicQueryGameSessionMe
./ng net.accelbyte.sdk.cli.Main sessionhistory publicQueryGameSessionMe \
    --namespace "$AB_NAMESPACE" \
    --limit '36' \
    --offset '62' \
    --order 'ywJfT5Eb' \
    > test.out 2>&1
eval_tap $? 15 'PublicQueryGameSessionMe' test.out

#- 16 QueryXrayMatchPool
./ng net.accelbyte.sdk.cli.Main sessionhistory queryXrayMatchPool \
    --namespace "$AB_NAMESPACE" \
    --poolName 'DsUBWdDY' \
    --endDate 'tPqOdTGx' \
    --startDate 'VBCTfMlS' \
    > test.out 2>&1
eval_tap $? 16 'QueryXrayMatchPool' test.out

#- 17 QueryDetailTickMatchPool
./ng net.accelbyte.sdk.cli.Main sessionhistory queryDetailTickMatchPool \
    --namespace "$AB_NAMESPACE" \
    --podName 'OYhwnnlp' \
    --poolName 'C0xMmkvd' \
    --all  \
    --limit '77' \
    --offset '5' \
    --endDate 'vBHoDOJO' \
    --startDate 'qErBb8sP' \
    > test.out 2>&1
eval_tap $? 17 'QueryDetailTickMatchPool' test.out

#- 18 QueryDetailTickMatchPoolMatches
./ng net.accelbyte.sdk.cli.Main sessionhistory queryDetailTickMatchPoolMatches \
    --namespace "$AB_NAMESPACE" \
    --podName 'Rnu5Pt3b' \
    --poolName '39V1FJcK' \
    --tickId '6lqPSsh3' \
    > test.out 2>&1
eval_tap $? 18 'QueryDetailTickMatchPoolMatches' test.out

#- 19 QueryDetailTickMatchPoolTicket
./ng net.accelbyte.sdk.cli.Main sessionhistory queryDetailTickMatchPoolTicket \
    --namespace "$AB_NAMESPACE" \
    --podName 'UwMc4yqj' \
    --poolName 'p6reYZhV' \
    --tickId 'GJTyt3SO' \
    > test.out 2>&1
eval_tap $? 19 'QueryDetailTickMatchPoolTicket' test.out

#- 20 QueryMatchHistories
./ng net.accelbyte.sdk.cli.Main sessionhistory queryMatchHistories \
    --matchId 'gov5tdyV' \
    --namespace "$AB_NAMESPACE" \
    --limit '63' \
    --offset '35' \
    > test.out 2>&1
eval_tap $? 20 'QueryMatchHistories' test.out

#- 21 QueryMatchTicketHistories
./ng net.accelbyte.sdk.cli.Main sessionhistory queryMatchTicketHistories \
    --matchId '4hf34fsj' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 21 'QueryMatchTicketHistories' test.out

#- 22 QueryXrayMatch
./ng net.accelbyte.sdk.cli.Main sessionhistory queryXrayMatch \
    --matchId 'j0vVSyzy' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 22 'QueryXrayMatch' test.out

#- 23 QueryAcquiringDS
./ng net.accelbyte.sdk.cli.Main sessionhistory queryAcquiringDS \
    --namespace "$AB_NAMESPACE" \
    --endDate 'T1YBQhXh' \
    --startDate 'Skbao5Ws' \
    > test.out 2>&1
eval_tap $? 23 'QueryAcquiringDS' test.out

#- 24 QueryAcquiringDSWaitTimeAvg
./ng net.accelbyte.sdk.cli.Main sessionhistory queryAcquiringDSWaitTimeAvg \
    --namespace "$AB_NAMESPACE" \
    --endDate 'bV4XpHzz' \
    --startDate 'cdWl59bz' \
    > test.out 2>&1
eval_tap $? 24 'QueryAcquiringDSWaitTimeAvg' test.out

#- 25 QueryMatchLengthDurationpAvg
./ng net.accelbyte.sdk.cli.Main sessionhistory queryMatchLengthDurationpAvg \
    --namespace "$AB_NAMESPACE" \
    --endDate '1EN7qmlK' \
    --startDate 'HQQDh1vs' \
    > test.out 2>&1
eval_tap $? 25 'QueryMatchLengthDurationpAvg' test.out

#- 26 QueryMatchLengthDurationp99
./ng net.accelbyte.sdk.cli.Main sessionhistory queryMatchLengthDurationp99 \
    --namespace "$AB_NAMESPACE" \
    --endDate 'KeqhDxkj' \
    --startDate 'JKP16pkI' \
    > test.out 2>&1
eval_tap $? 26 'QueryMatchLengthDurationp99' test.out

#- 27 QueryTotalActiveSession
./ng net.accelbyte.sdk.cli.Main sessionhistory queryTotalActiveSession \
    --namespace "$AB_NAMESPACE" \
    --region 'Chl47Prw' \
    --endDate 'eTVWgTv7' \
    --startDate 'eM4hiwlM' \
    > test.out 2>&1
eval_tap $? 27 'QueryTotalActiveSession' test.out

#- 28 QueryTotalMatchmakingMatch
./ng net.accelbyte.sdk.cli.Main sessionhistory queryTotalMatchmakingMatch \
    --namespace "$AB_NAMESPACE" \
    --matchPool 'o19nkIf3' \
    --endDate 'CUmNUDbC' \
    --startDate 'o0Ncdw4o' \
    > test.out 2>&1
eval_tap $? 28 'QueryTotalMatchmakingMatch' test.out

#- 29 QueryTotalPlayerPersession
./ng net.accelbyte.sdk.cli.Main sessionhistory queryTotalPlayerPersession \
    --namespace "$AB_NAMESPACE" \
    --endDate 'zz3gkYbB' \
    --startDate 'Wzg9Jgne' \
    > test.out 2>&1
eval_tap $? 29 'QueryTotalPlayerPersession' test.out

#- 30 QueryTotalMatchmakingCanceled
./ng net.accelbyte.sdk.cli.Main sessionhistory queryTotalMatchmakingCanceled \
    --namespace "$AB_NAMESPACE" \
    --matchPool 'cCJcItKn' \
    --endDate 'XDPJ9rMo' \
    --startDate 'bXrauQ1R' \
    > test.out 2>&1
eval_tap $? 30 'QueryTotalMatchmakingCanceled' test.out

#- 31 QueryTotalMatchmakingCreated
./ng net.accelbyte.sdk.cli.Main sessionhistory queryTotalMatchmakingCreated \
    --namespace "$AB_NAMESPACE" \
    --matchPool 'ighDoiNY' \
    --endDate 'sOX3SewX' \
    --startDate 'DbPqYwhh' \
    > test.out 2>&1
eval_tap $? 31 'QueryTotalMatchmakingCreated' test.out

#- 32 QueryTotalMatchmakingExpired
./ng net.accelbyte.sdk.cli.Main sessionhistory queryTotalMatchmakingExpired \
    --namespace "$AB_NAMESPACE" \
    --matchPool 'A5SNuqIP' \
    --endDate '4KtoOv9Z' \
    --startDate 'AASyvGwn' \
    > test.out 2>&1
eval_tap $? 32 'QueryTotalMatchmakingExpired' test.out

#- 33 QueryTotalMatchmakingMatchTicket
./ng net.accelbyte.sdk.cli.Main sessionhistory queryTotalMatchmakingMatchTicket \
    --namespace "$AB_NAMESPACE" \
    --matchPool 'BWqeE3uA' \
    --endDate 'jqLgFfyn' \
    --startDate '7sq068J2' \
    > test.out 2>&1
eval_tap $? 33 'QueryTotalMatchmakingMatchTicket' test.out

#- 34 CreateXrayTicketObservability
./ng net.accelbyte.sdk.cli.Main sessionhistory createXrayTicketObservability \
    --namespace "$AB_NAMESPACE" \
    --body '{"action": "BnRY1zCQ", "activeAllianceRule": {"max_number": 42, "min_number": 19, "player_max_number": 91, "player_min_number": 36}, "activeMatchingRule": [{"attribute": "tq6VBWYS", "criteria": "JHm74Ycv", "reference": 0.32325576829628866}, {"attribute": "T5K3VjmU", "criteria": "5bXTD1YU", "reference": 0.04194884341330274}, {"attribute": "TqMxChdO", "criteria": "PkzNlTU9", "reference": 0.08100387166582124}], "function": "pV93IdFm", "gameMode": "j4w1dFlC", "isBackfillMatch": false, "isRuleSetFlexed": false, "iteration": 56, "matchID": "rJK8T7Ig", "namespace": "i8CZyFYD", "partyID": "QEIX4rEs", "remainingPlayersPerTicket": [97, 50, 71], "remainingTickets": 60, "sessionTickID": "Sm2hlQHQ", "tickID": 19, "timeToMatchSec": 0.11009866683963143, "timestamp": "1981-05-26T00:00:00Z", "unbackfillReason": "EVyMp42D", "unmatchReason": "sjp6vgFK"}' \
    > test.out 2>&1
eval_tap $? 34 'CreateXrayTicketObservability' test.out

#- 35 QueryXrayTimelineByTicketID
./ng net.accelbyte.sdk.cli.Main sessionhistory queryXrayTimelineByTicketID \
    --namespace "$AB_NAMESPACE" \
    --ticketId 'H99w2iny' \
    --limit '48' \
    --offset '4' \
    --endDate 'wV84u8hH' \
    --startDate 'wJOwO1iU' \
    > test.out 2>&1
eval_tap $? 35 'QueryXrayTimelineByTicketID' test.out

#- 36 QueryXrayTimelineByUserID
./ng net.accelbyte.sdk.cli.Main sessionhistory queryXrayTimelineByUserID \
    --namespace "$AB_NAMESPACE" \
    --userId 'bDRoso5z' \
    --limit '4' \
    --offset '56' \
    --endDate '2o54fRVP' \
    --startDate 'rBI4jMWO' \
    > test.out 2>&1
eval_tap $? 36 'QueryXrayTimelineByUserID' test.out


rm -f "tmp.dat"

exit $EXIT_CODE