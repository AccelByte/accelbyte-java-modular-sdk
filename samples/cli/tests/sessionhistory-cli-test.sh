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
    --body '{"logLevel": "panic"}' \
    > test.out 2>&1
eval_tap $? 5 'AdminPatchUpdateLogConfig' test.out

#- 6 AdminQueryGameSessionDetail
./ng net.accelbyte.sdk.cli.Main sessionhistory adminQueryGameSessionDetail \
    --namespace "$AB_NAMESPACE" \
    --endDate 'LEfUOiww' \
    --gameSessionID 'smgQvmSu' \
    --limit '49' \
    --offset '90' \
    --order 'H5dSnphw' \
    --orderBy 'QIPhavQJ' \
    --startDate '8wKcvXTI' \
    --userID '25rYWU5p' \
    > test.out 2>&1
eval_tap $? 6 'AdminQueryGameSessionDetail' test.out

#- 7 GetGameSessionDetail
./ng net.accelbyte.sdk.cli.Main sessionhistory getGameSessionDetail \
    --namespace "$AB_NAMESPACE" \
    --sessionId '4wzatHHO' \
    > test.out 2>&1
eval_tap $? 7 'GetGameSessionDetail' test.out

#- 8 AdminQueryMatchmakingDetail
./ng net.accelbyte.sdk.cli.Main sessionhistory adminQueryMatchmakingDetail \
    --namespace "$AB_NAMESPACE" \
    --gameSessionID 'g0V4mUa0' \
    --limit '36' \
    --offset '88' \
    --order 'UBlUuQ36' \
    --orderBy 'lWApAu3N' \
    --ticketID 'PaAEICSY' \
    --userID 'olOAJmro' \
    > test.out 2>&1
eval_tap $? 8 'AdminQueryMatchmakingDetail' test.out

#- 9 AdminGetMatchmakingDetailBySessionID
./ng net.accelbyte.sdk.cli.Main sessionhistory adminGetMatchmakingDetailBySessionID \
    --namespace "$AB_NAMESPACE" \
    --sessionId '4dtQjXcC' \
    > test.out 2>&1
eval_tap $? 9 'AdminGetMatchmakingDetailBySessionID' test.out

#- 10 AdminGetMatchmakingDetailByTicketID
./ng net.accelbyte.sdk.cli.Main sessionhistory adminGetMatchmakingDetailByTicketID \
    --namespace "$AB_NAMESPACE" \
    --ticketId 'v94C40qO' \
    > test.out 2>&1
eval_tap $? 10 'AdminGetMatchmakingDetailByTicketID' test.out

#- 11 AdminQueryPartyDetail
./ng net.accelbyte.sdk.cli.Main sessionhistory adminQueryPartyDetail \
    --namespace "$AB_NAMESPACE" \
    --limit '82' \
    --offset '10' \
    --order 'DdbPkbyz' \
    --orderBy 'URbRYDcq' \
    --partyID '1agK1Okh' \
    --userID 'wfRlp33q' \
    > test.out 2>&1
eval_tap $? 11 'AdminQueryPartyDetail' test.out

#- 12 GetPartyDetail
./ng net.accelbyte.sdk.cli.Main sessionhistory getPartyDetail \
    --namespace "$AB_NAMESPACE" \
    --sessionId '4zM8Sx7u' \
    > test.out 2>&1
eval_tap $? 12 'GetPartyDetail' test.out

#- 13 AdminQueryTicketDetail
./ng net.accelbyte.sdk.cli.Main sessionhistory adminQueryTicketDetail \
    --namespace "$AB_NAMESPACE" \
    --endDate 'fGuHXXCe' \
    --gameMode 'upRLorT3' \
    --limit '23' \
    --offset '14' \
    --order 'zm1ZIjYr' \
    --partyID '6VrEsA7P' \
    --region 'aMa0D9Y4' \
    --startDate 'SIQz15Zg' \
    --userIDs 'AaBU8Smf' \
    > test.out 2>&1
eval_tap $? 13 'AdminQueryTicketDetail' test.out

#- 14 AdminTicketDetailGetByTicketID
./ng net.accelbyte.sdk.cli.Main sessionhistory adminTicketDetailGetByTicketID \
    --namespace "$AB_NAMESPACE" \
    --ticketId '65yCQ66i' \
    > test.out 2>&1
eval_tap $? 14 'AdminTicketDetailGetByTicketID' test.out

#- 15 PublicQueryGameSessionMe
./ng net.accelbyte.sdk.cli.Main sessionhistory publicQueryGameSessionMe \
    --namespace "$AB_NAMESPACE" \
    --limit '18' \
    --offset '19' \
    --order 'Cwbdf8gR' \
    > test.out 2>&1
eval_tap $? 15 'PublicQueryGameSessionMe' test.out

#- 16 QueryXrayMatchPool
./ng net.accelbyte.sdk.cli.Main sessionhistory queryXrayMatchPool \
    --namespace "$AB_NAMESPACE" \
    --poolName 'd4Ot3P7a,JegLZlla,KfD9RQnj' \
    --endDate 'ykmxosbz' \
    --startDate 'tjKV1Bbf' \
    > test.out 2>&1
eval_tap $? 16 'QueryXrayMatchPool' test.out

#- 17 QueryDetailTickMatchPool
./ng net.accelbyte.sdk.cli.Main sessionhistory queryDetailTickMatchPool \
    --namespace "$AB_NAMESPACE" \
    --podName 'trFfwOa3' \
    --poolName 'zV5nLpZn' \
    --all  \
    --limit '73' \
    --offset '29' \
    --endDate '5IIeuD3Q' \
    --startDate 'yBBLB2kV' \
    > test.out 2>&1
eval_tap $? 17 'QueryDetailTickMatchPool' test.out

#- 18 QueryDetailTickMatchPoolMatches
./ng net.accelbyte.sdk.cli.Main sessionhistory queryDetailTickMatchPoolMatches \
    --namespace "$AB_NAMESPACE" \
    --podName '5kz5GRgs' \
    --poolName 'c9jWDUAF' \
    --tickId 'EC4gTZgI' \
    > test.out 2>&1
eval_tap $? 18 'QueryDetailTickMatchPoolMatches' test.out

#- 19 QueryDetailTickMatchPoolTicket
./ng net.accelbyte.sdk.cli.Main sessionhistory queryDetailTickMatchPoolTicket \
    --namespace "$AB_NAMESPACE" \
    --podName 'HGmkK0nQ' \
    --poolName 'Xo4meH8I' \
    --tickId '1eE5VcEJ' \
    > test.out 2>&1
eval_tap $? 19 'QueryDetailTickMatchPoolTicket' test.out

#- 20 QueryMatchHistories
./ng net.accelbyte.sdk.cli.Main sessionhistory queryMatchHistories \
    --matchId 'q7bHh7HZ' \
    --namespace "$AB_NAMESPACE" \
    --limit '90' \
    --offset '29' \
    > test.out 2>&1
eval_tap $? 20 'QueryMatchHistories' test.out

#- 21 QueryMatchTicketHistories
./ng net.accelbyte.sdk.cli.Main sessionhistory queryMatchTicketHistories \
    --matchId 'YAzmxDVf' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 21 'QueryMatchTicketHistories' test.out

#- 22 QueryXrayMatch
./ng net.accelbyte.sdk.cli.Main sessionhistory queryXrayMatch \
    --matchId '6jNGzXV2' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 22 'QueryXrayMatch' test.out

#- 23 QueryAcquiringDS
./ng net.accelbyte.sdk.cli.Main sessionhistory queryAcquiringDS \
    --namespace "$AB_NAMESPACE" \
    --matchPool 'xlHwk38O,xmwiZB8g,iolFCoDf' \
    --endDate '5PXRYZGl' \
    --startDate 'mXmqcWfw' \
    > test.out 2>&1
eval_tap $? 23 'QueryAcquiringDS' test.out

#- 24 QueryAcquiringDSWaitTimeAvg
./ng net.accelbyte.sdk.cli.Main sessionhistory queryAcquiringDSWaitTimeAvg \
    --namespace "$AB_NAMESPACE" \
    --matchPool '1kqWOXMz,WUYWYbLc,FgYLKeCO' \
    --endDate 'WtwNhSwl' \
    --startDate 'DGBLRxwz' \
    > test.out 2>&1
eval_tap $? 24 'QueryAcquiringDSWaitTimeAvg' test.out

#- 25 QueryMatchLengthDurationpAvg
./ng net.accelbyte.sdk.cli.Main sessionhistory queryMatchLengthDurationpAvg \
    --namespace "$AB_NAMESPACE" \
    --matchPool '86B2cmmt,Nwnbfddt,EOy8LzMB' \
    --endDate 'vIeJ7DSz' \
    --startDate '9lhfge5j' \
    > test.out 2>&1
eval_tap $? 25 'QueryMatchLengthDurationpAvg' test.out

#- 26 QueryMatchLengthDurationp99
./ng net.accelbyte.sdk.cli.Main sessionhistory queryMatchLengthDurationp99 \
    --namespace "$AB_NAMESPACE" \
    --matchPool 'rcKKniGF,q7YvBP3z,6LaTpKKp' \
    --endDate 'YXsK6i6f' \
    --startDate '92pt3jV8' \
    > test.out 2>&1
eval_tap $? 26 'QueryMatchLengthDurationp99' test.out

#- 27 QueryTotalActiveSession
./ng net.accelbyte.sdk.cli.Main sessionhistory queryTotalActiveSession \
    --namespace "$AB_NAMESPACE" \
    --matchPool 'F6jDo6Kd,DNpXqlXS,bgZVfNqV' \
    --region 'WiqJP0jp' \
    --endDate 'aEg73XWm' \
    --startDate '9apUETUq' \
    > test.out 2>&1
eval_tap $? 27 'QueryTotalActiveSession' test.out

#- 28 QueryTotalMatchmakingMatch
./ng net.accelbyte.sdk.cli.Main sessionhistory queryTotalMatchmakingMatch \
    --namespace "$AB_NAMESPACE" \
    --matchPool 'eI7APWOx,aMsmesqp,LRE7Sh40' \
    --endDate 'LkXT7BMt' \
    --startDate 'nhH7ub1s' \
    > test.out 2>&1
eval_tap $? 28 'QueryTotalMatchmakingMatch' test.out

#- 29 QueryTotalPlayerPersession
./ng net.accelbyte.sdk.cli.Main sessionhistory queryTotalPlayerPersession \
    --namespace "$AB_NAMESPACE" \
    --matchPool '2L6fKe1M,fDFMOU3U,K5zJzyiM' \
    --endDate '9GgYivTv' \
    --startDate 'p4TQFoqu' \
    > test.out 2>&1
eval_tap $? 29 'QueryTotalPlayerPersession' test.out

#- 30 QueryTotalMatchmakingCanceled
./ng net.accelbyte.sdk.cli.Main sessionhistory queryTotalMatchmakingCanceled \
    --namespace "$AB_NAMESPACE" \
    --matchPool 'vLvU9TSx,Rp4oERYk,aCZ7n2ny' \
    --endDate 'k4S5R5Ca' \
    --startDate 'Sro4X1Tp' \
    > test.out 2>&1
eval_tap $? 30 'QueryTotalMatchmakingCanceled' test.out

#- 31 QueryTotalMatchmakingCreated
./ng net.accelbyte.sdk.cli.Main sessionhistory queryTotalMatchmakingCreated \
    --namespace "$AB_NAMESPACE" \
    --matchPool 'Mze5GH7L,Gotv6ITa,nPhG3lKG' \
    --endDate 'OO0sdYlq' \
    --startDate 'KCDK3oub' \
    > test.out 2>&1
eval_tap $? 31 'QueryTotalMatchmakingCreated' test.out

#- 32 QueryTotalMatchmakingExpired
./ng net.accelbyte.sdk.cli.Main sessionhistory queryTotalMatchmakingExpired \
    --namespace "$AB_NAMESPACE" \
    --matchPool 'ZfvsqHR0,ZSl4bmJu,aBKB9leg' \
    --endDate 'eWNOZJY4' \
    --startDate 'QinOZKFw' \
    > test.out 2>&1
eval_tap $? 32 'QueryTotalMatchmakingExpired' test.out

#- 33 QueryTotalMatchmakingMatchTicket
./ng net.accelbyte.sdk.cli.Main sessionhistory queryTotalMatchmakingMatchTicket \
    --namespace "$AB_NAMESPACE" \
    --matchPool 'BYjW8px4,fb077bgX,w5I3xdpK' \
    --endDate 'hLMdZauq' \
    --startDate 'tMgo8Cbr' \
    > test.out 2>&1
eval_tap $? 33 'QueryTotalMatchmakingMatchTicket' test.out

#- 34 CreateXrayTicketObservability
./ng net.accelbyte.sdk.cli.Main sessionhistory createXrayTicketObservability \
    --namespace "$AB_NAMESPACE" \
    --body '{"action": "mvNuQwSa", "activeAllianceRule": {"max_number": 69, "min_number": 71, "player_max_number": 96, "player_min_number": 22}, "activeMatchingRule": [{"attribute": "w0sz2XGf", "criteria": "mJGmRXh9", "reference": 0.9598594804451581}, {"attribute": "QWnIpere", "criteria": "RKAf0yOh", "reference": 0.5037034117281133}, {"attribute": "fPDwyKa1", "criteria": "drJckbWG", "reference": 0.6150807190917252}], "function": "ZGa6CsPu", "gameMode": "bnh7e622", "isBackfillMatch": true, "isRuleSetFlexed": false, "iteration": 21, "matchID": "yMoByO4U", "namespace": "p4GndZKP", "partyID": "u6QX8ENR", "remainingPlayersPerTicket": [11, 28, 66], "remainingTickets": 83, "sessionTickID": "hINoV52o", "tickID": 72, "timeToMatchSec": 0.6379632317270982, "timestamp": "1988-10-10T00:00:00Z", "unbackfillReason": "5MXvXz1o", "unmatchReason": "mFsC6D3e"}' \
    > test.out 2>&1
eval_tap $? 34 'CreateXrayTicketObservability' test.out

#- 35 CreateXrayBulkTicketObservability
./ng net.accelbyte.sdk.cli.Main sessionhistory createXrayBulkTicketObservability \
    --namespace "$AB_NAMESPACE" \
    --body '{"ticketObservabilities": [{"action": "zMciskTQ", "activeAllianceRule": {"max_number": 62, "min_number": 38, "player_max_number": 68, "player_min_number": 24}, "activeMatchingRule": [{"attribute": "6pAb0upy", "criteria": "MBt2Ojft", "reference": 0.27949451412760673}, {"attribute": "5bZLQWet", "criteria": "xQ81QwIW", "reference": 0.5162313765962339}, {"attribute": "prXRVQlb", "criteria": "FQbeR8Wa", "reference": 0.48647995685031753}], "function": "TBV31GDt", "gameMode": "6XKXCnJC", "isBackfillMatch": false, "isRuleSetFlexed": true, "iteration": 8, "matchID": "HIQieHmH", "namespace": "AY13KNKM", "partyID": "PHNSXbg3", "remainingPlayersPerTicket": [96, 98, 77], "remainingTickets": 17, "sessionTickID": "xCCFnEo3", "tickID": 8, "timeToMatchSec": 0.3923437696861123, "timestamp": "1997-08-05T00:00:00Z", "unbackfillReason": "QFBSgseS", "unmatchReason": "GCvVdZjH"}, {"action": "Lz5o2me1", "activeAllianceRule": {"max_number": 7, "min_number": 71, "player_max_number": 69, "player_min_number": 91}, "activeMatchingRule": [{"attribute": "t1OZWp6F", "criteria": "d9ByXzWn", "reference": 0.5221430836370029}, {"attribute": "l0cVIH26", "criteria": "7i6FFA2W", "reference": 0.2609244884081895}, {"attribute": "IpjLKTPG", "criteria": "WEc6O9f4", "reference": 0.9449520080128115}], "function": "fEuZVNfh", "gameMode": "TcS6S8iX", "isBackfillMatch": true, "isRuleSetFlexed": true, "iteration": 34, "matchID": "CnVnCnYP", "namespace": "21qzunTC", "partyID": "xSKKvg3Y", "remainingPlayersPerTicket": [71, 8, 92], "remainingTickets": 66, "sessionTickID": "2VEAJ71K", "tickID": 50, "timeToMatchSec": 0.5229512874720292, "timestamp": "1975-11-21T00:00:00Z", "unbackfillReason": "QUvCx0pU", "unmatchReason": "m4H93DpX"}, {"action": "yOcnSRpM", "activeAllianceRule": {"max_number": 78, "min_number": 84, "player_max_number": 94, "player_min_number": 33}, "activeMatchingRule": [{"attribute": "r72rT50T", "criteria": "VDKRq5YX", "reference": 0.9222912578748788}, {"attribute": "ic4FvcJY", "criteria": "dJTN4Xkw", "reference": 0.8868188783552355}, {"attribute": "4NERnEoS", "criteria": "u0mkFZuh", "reference": 0.33239821434030903}], "function": "w4RGQmmB", "gameMode": "daHcd38X", "isBackfillMatch": true, "isRuleSetFlexed": false, "iteration": 14, "matchID": "oIp801CU", "namespace": "4Nucmsr4", "partyID": "AL6Zaid6", "remainingPlayersPerTicket": [1, 91, 95], "remainingTickets": 40, "sessionTickID": "4F8VVBpN", "tickID": 30, "timeToMatchSec": 0.47105715455818886, "timestamp": "1989-01-31T00:00:00Z", "unbackfillReason": "hv784Oyg", "unmatchReason": "XjaIvOFZ"}]}' \
    > test.out 2>&1
eval_tap $? 35 'CreateXrayBulkTicketObservability' test.out

#- 36 QueryXrayTimelineByTicketID
./ng net.accelbyte.sdk.cli.Main sessionhistory queryXrayTimelineByTicketID \
    --namespace "$AB_NAMESPACE" \
    --ticketId 'xEwL8NKz' \
    --limit '34' \
    --offset '4' \
    --endDate '8ij9YxnW' \
    --startDate 'z12Qoelt' \
    > test.out 2>&1
eval_tap $? 36 'QueryXrayTimelineByTicketID' test.out

#- 37 QueryXrayTimelineByUserID
./ng net.accelbyte.sdk.cli.Main sessionhistory queryXrayTimelineByUserID \
    --namespace "$AB_NAMESPACE" \
    --userId 'fH08gytg' \
    --limit '93' \
    --offset '96' \
    --endDate 'VU1Or6Me' \
    --startDate 'NA1O4EWz' \
    > test.out 2>&1
eval_tap $? 37 'QueryXrayTimelineByUserID' test.out


rm -f "tmp.dat"

exit $EXIT_CODE