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
    --body '{"SESSION_DELETION_GRACE_PERIOD": 82}' \
    > test.out 2>&1
eval_tap $? 5 'AdminPatchUpdateEnvConfig' test.out

#- 6 AdminGetLogConfig
./ng net.accelbyte.sdk.cli.Main sessionhistory adminGetLogConfig \
    > test.out 2>&1
eval_tap $? 6 'AdminGetLogConfig' test.out

#- 7 AdminPatchUpdateLogConfig
./ng net.accelbyte.sdk.cli.Main sessionhistory adminPatchUpdateLogConfig \
    --body '{"logLevel": "trace"}' \
    > test.out 2>&1
eval_tap $? 7 'AdminPatchUpdateLogConfig' test.out

#- 8 AdminQueryGameSessionDetail
./ng net.accelbyte.sdk.cli.Main sessionhistory adminQueryGameSessionDetail \
    --namespace "$AB_NAMESPACE" \
    --completedOnly 'crLn5PhV' \
    --configurationName 'IW6M3K6e' \
    --dsPodName 'bathu535' \
    --endDate 'ffBwwQVq' \
    --gameSessionID '5cpfGrv4' \
    --isPersistent 'LWCfQKPO' \
    --joinability 'X41wn6pS' \
    --limit '67' \
    --matchPool 'vyFBYlu9' \
    --offset '80' \
    --order 'XJap8LVp' \
    --orderBy '0RcVj4gL' \
    --startDate 'uBs7X8ML' \
    --statusV2 'BomEV4Ga' \
    --userID 'haFx6vZL' \
    > test.out 2>&1
eval_tap $? 8 'AdminQueryGameSessionDetail' test.out

#- 9 GetGameSessionDetail
./ng net.accelbyte.sdk.cli.Main sessionhistory getGameSessionDetail \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'Rl8mbnva' \
    > test.out 2>&1
eval_tap $? 9 'GetGameSessionDetail' test.out

#- 10 AdminQueryMatchmakingDetail
./ng net.accelbyte.sdk.cli.Main sessionhistory adminQueryMatchmakingDetail \
    --namespace "$AB_NAMESPACE" \
    --gameSessionID '7kykXmdL' \
    --limit '80' \
    --offset '99' \
    --order 'pVzESh6a' \
    --orderBy 'LRYKDONZ' \
    --ticketID '5Z5VTjco' \
    --userID 'uVbZUd0B' \
    > test.out 2>&1
eval_tap $? 10 'AdminQueryMatchmakingDetail' test.out

#- 11 AdminGetMatchmakingDetailBySessionID
./ng net.accelbyte.sdk.cli.Main sessionhistory adminGetMatchmakingDetailBySessionID \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'E3KimcJB' \
    > test.out 2>&1
eval_tap $? 11 'AdminGetMatchmakingDetailBySessionID' test.out

#- 12 AdminGetMatchmakingDetailByTicketID
./ng net.accelbyte.sdk.cli.Main sessionhistory adminGetMatchmakingDetailByTicketID \
    --namespace "$AB_NAMESPACE" \
    --ticketId '1QdrkIMR' \
    > test.out 2>&1
eval_tap $? 12 'AdminGetMatchmakingDetailByTicketID' test.out

#- 13 AdminQueryPartyDetail
./ng net.accelbyte.sdk.cli.Main sessionhistory adminQueryPartyDetail \
    --namespace "$AB_NAMESPACE" \
    --endDate 'a4q1I9IF' \
    --joinability 'Q5VC2iNw' \
    --leaderID 'cDLR1OIW' \
    --limit '42' \
    --offset '42' \
    --order 'zOq7yr4J' \
    --orderBy 'Poh2lT84' \
    --partyID '7Qp2ehII' \
    --startDate 'b450DBu6' \
    --userID 'GZ6Pecn8' \
    > test.out 2>&1
eval_tap $? 13 'AdminQueryPartyDetail' test.out

#- 14 GetPartyDetail
./ng net.accelbyte.sdk.cli.Main sessionhistory getPartyDetail \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'xMOcRZcp' \
    > test.out 2>&1
eval_tap $? 14 'GetPartyDetail' test.out

#- 15 AdminQueryTicketDetail
./ng net.accelbyte.sdk.cli.Main sessionhistory adminQueryTicketDetail \
    --namespace "$AB_NAMESPACE" \
    --endDate 'o8v1owjn' \
    --gameMode 'GLoF754O' \
    --limit '42' \
    --offset '46' \
    --order '6dWYbCD3' \
    --partyID '7nSru5O9' \
    --region 'RWttBfRQ' \
    --startDate 'on1zufup' \
    --userIDs 'UkBdzsbz' \
    > test.out 2>&1
eval_tap $? 15 'AdminQueryTicketDetail' test.out

#- 16 AdminTicketDetailGetByTicketID
./ng net.accelbyte.sdk.cli.Main sessionhistory adminTicketDetailGetByTicketID \
    --namespace "$AB_NAMESPACE" \
    --ticketId 'vqgPteaB' \
    > test.out 2>&1
eval_tap $? 16 'AdminTicketDetailGetByTicketID' test.out

#- 17 PublicQueryGameSessionMe
./ng net.accelbyte.sdk.cli.Main sessionhistory publicQueryGameSessionMe \
    --namespace "$AB_NAMESPACE" \
    --limit '76' \
    --offset '17' \
    --order 'Rm3E40US' \
    > test.out 2>&1
eval_tap $? 17 'PublicQueryGameSessionMe' test.out

#- 18 QueryXrayMatchPool
./ng net.accelbyte.sdk.cli.Main sessionhistory queryXrayMatchPool \
    --namespace "$AB_NAMESPACE" \
    --poolName 'zgAXZnIa,rQtOS4N5,X8vWRcBo' \
    --endDate 'Dq1tZLMr' \
    --startDate 'UCA33vEC' \
    > test.out 2>&1
eval_tap $? 18 'QueryXrayMatchPool' test.out

#- 19 QueryDetailTickMatchPool
./ng net.accelbyte.sdk.cli.Main sessionhistory queryDetailTickMatchPool \
    --namespace "$AB_NAMESPACE" \
    --podName 'HoNTnpno' \
    --poolName 'sNOndxcB' \
    --all  \
    --limit '25' \
    --offset '20' \
    --endDate 'f0AC4nZH' \
    --startDate '6WSrq0WW' \
    > test.out 2>&1
eval_tap $? 19 'QueryDetailTickMatchPool' test.out

#- 20 QueryDetailTickMatchPoolMatches
./ng net.accelbyte.sdk.cli.Main sessionhistory queryDetailTickMatchPoolMatches \
    --namespace "$AB_NAMESPACE" \
    --podName 'rFXJOYP5' \
    --poolName 'asnBe0Vr' \
    --tickId '9v5cAdeB' \
    > test.out 2>&1
eval_tap $? 20 'QueryDetailTickMatchPoolMatches' test.out

#- 21 QueryDetailTickMatchPoolTicket
./ng net.accelbyte.sdk.cli.Main sessionhistory queryDetailTickMatchPoolTicket \
    --namespace "$AB_NAMESPACE" \
    --podName 'r4DqjLFK' \
    --poolName 'ng2GP6TH' \
    --tickId 'ri1XnlI7' \
    > test.out 2>&1
eval_tap $? 21 'QueryDetailTickMatchPoolTicket' test.out

#- 22 QueryMatchHistories
./ng net.accelbyte.sdk.cli.Main sessionhistory queryMatchHistories \
    --matchId 'S3QUxpFm' \
    --namespace "$AB_NAMESPACE" \
    --limit '41' \
    --offset '77' \
    > test.out 2>&1
eval_tap $? 22 'QueryMatchHistories' test.out

#- 23 QueryMatchTicketHistories
./ng net.accelbyte.sdk.cli.Main sessionhistory queryMatchTicketHistories \
    --matchId 'keZetNTa' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 23 'QueryMatchTicketHistories' test.out

#- 24 QueryXrayMatch
./ng net.accelbyte.sdk.cli.Main sessionhistory queryXrayMatch \
    --matchId 'Oe9jisz7' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 24 'QueryXrayMatch' test.out

#- 25 QueryAcquiringDS
./ng net.accelbyte.sdk.cli.Main sessionhistory queryAcquiringDS \
    --namespace "$AB_NAMESPACE" \
    --matchPool 'M6oWhGUR,GfkYpizU,rnWk6Nv8' \
    --endDate '5aZeUpzw' \
    --startDate 'SveemD04' \
    > test.out 2>&1
eval_tap $? 25 'QueryAcquiringDS' test.out

#- 26 QueryAcquiringDSWaitTimeAvg
./ng net.accelbyte.sdk.cli.Main sessionhistory queryAcquiringDSWaitTimeAvg \
    --namespace "$AB_NAMESPACE" \
    --matchPool 'mhPeMcsR,Ey405WNt,bZy6hiwE' \
    --endDate 'A2SRpmDh' \
    --startDate '3EzQzWBD' \
    > test.out 2>&1
eval_tap $? 26 'QueryAcquiringDSWaitTimeAvg' test.out

#- 27 QueryMatchLengthDurationpAvg
./ng net.accelbyte.sdk.cli.Main sessionhistory queryMatchLengthDurationpAvg \
    --namespace "$AB_NAMESPACE" \
    --matchPool 'oenlAQEP,jqj2LzuZ,ddjgS83H' \
    --endDate 'BTby8hgW' \
    --startDate 'brDsifZZ' \
    > test.out 2>&1
eval_tap $? 27 'QueryMatchLengthDurationpAvg' test.out

#- 28 QueryMatchLengthDurationp99
./ng net.accelbyte.sdk.cli.Main sessionhistory queryMatchLengthDurationp99 \
    --namespace "$AB_NAMESPACE" \
    --matchPool '3F2cPRJV,P6KGyz1f,bx6artcE' \
    --endDate 'rIi8NwFZ' \
    --startDate 'IrLrPvnP' \
    > test.out 2>&1
eval_tap $? 28 'QueryMatchLengthDurationp99' test.out

#- 29 QueryTotalActiveSession
./ng net.accelbyte.sdk.cli.Main sessionhistory queryTotalActiveSession \
    --namespace "$AB_NAMESPACE" \
    --matchPool 'VgAC2gUe,a5yWZBac,v4pcUE0P' \
    --region 'Ur2rkKfR' \
    --endDate 'svy8jgJj' \
    --startDate 'RzEdh7Hk' \
    > test.out 2>&1
eval_tap $? 29 'QueryTotalActiveSession' test.out

#- 30 QueryTotalMatchmakingMatch
./ng net.accelbyte.sdk.cli.Main sessionhistory queryTotalMatchmakingMatch \
    --namespace "$AB_NAMESPACE" \
    --matchPool 'kgmyJ2Mc,Dtiw9LnE,u5kVLBmD' \
    --endDate 'rIYjw8DM' \
    --startDate 'OcIBykfS' \
    > test.out 2>&1
eval_tap $? 30 'QueryTotalMatchmakingMatch' test.out

#- 31 QueryTotalPlayerPersession
./ng net.accelbyte.sdk.cli.Main sessionhistory queryTotalPlayerPersession \
    --namespace "$AB_NAMESPACE" \
    --matchPool 'ZaHr9k0z,nCd06A2I,GB94IQuL' \
    --endDate '3cLT7gfU' \
    --startDate 'R08k9XBK' \
    > test.out 2>&1
eval_tap $? 31 'QueryTotalPlayerPersession' test.out

#- 32 QueryTotalMatchmakingCanceled
./ng net.accelbyte.sdk.cli.Main sessionhistory queryTotalMatchmakingCanceled \
    --namespace "$AB_NAMESPACE" \
    --matchPool 'jHlqKdGn,9qaimzx3,heOk5SgS' \
    --endDate 'CBTIG56p' \
    --startDate 'ZYxNX4sr' \
    > test.out 2>&1
eval_tap $? 32 'QueryTotalMatchmakingCanceled' test.out

#- 33 QueryTotalMatchmakingCreated
./ng net.accelbyte.sdk.cli.Main sessionhistory queryTotalMatchmakingCreated \
    --namespace "$AB_NAMESPACE" \
    --matchPool 'xjCUbzNT,KcrGqmOR,PEQ5UXQC' \
    --endDate 'DAPJOUan' \
    --startDate 'l0kjkDVX' \
    > test.out 2>&1
eval_tap $? 33 'QueryTotalMatchmakingCreated' test.out

#- 34 QueryTotalMatchmakingExpired
./ng net.accelbyte.sdk.cli.Main sessionhistory queryTotalMatchmakingExpired \
    --namespace "$AB_NAMESPACE" \
    --matchPool 'YzusZuGN,idcXWCwl,BeMmmtWG' \
    --endDate 'dHoswLfw' \
    --startDate 'l2Z1EcoY' \
    > test.out 2>&1
eval_tap $? 34 'QueryTotalMatchmakingExpired' test.out

#- 35 QueryTotalMatchmakingMatchTicket
./ng net.accelbyte.sdk.cli.Main sessionhistory queryTotalMatchmakingMatchTicket \
    --namespace "$AB_NAMESPACE" \
    --matchPool 'VMkUq37Y,aYsEZSQP,Bf33M4b8' \
    --endDate '1H3vBGSC' \
    --startDate 'xU4NjAr1' \
    > test.out 2>&1
eval_tap $? 35 'QueryTotalMatchmakingMatchTicket' test.out

#- 36 CreateXrayTicketObservability
./ng net.accelbyte.sdk.cli.Main sessionhistory createXrayTicketObservability \
    --namespace "$AB_NAMESPACE" \
    --body '{"action": "0mdoNfRH", "activeAllianceRule": {"max_number": 26, "min_number": 30, "player_max_number": 74, "player_min_number": 88}, "activeMatchingRule": [{"attribute": "T6e0ubT9", "criteria": "8H9MPf0l", "reference": 0.442318820209081}, {"attribute": "WCMmgxaF", "criteria": "EFi8rpPL", "reference": 0.385254842704023}, {"attribute": "YWRYHcM4", "criteria": "7lyLPsGz", "reference": 0.12318453366635251}], "function": "BIB6l3fr", "gameMode": "BBbJntZA", "isBackfillMatch": false, "isRuleSetFlexed": true, "iteration": 49, "matchID": "xtmstDLr", "namespace": "nx3lbqgz", "remainingPlayersPerTicket": [6, 39, 91], "remainingTickets": 94, "sessionTickID": "hiD3d1QS", "tickID": 36, "ticketID": "Oy9C6gpN", "timeToMatchSec": 0.37414108803392365, "timestamp": "1993-08-13T00:00:00Z", "unbackfillReason": "HMzT56uN", "unmatchReason": "ov10wnFr"}' \
    > test.out 2>&1
eval_tap $? 36 'CreateXrayTicketObservability' test.out

#- 37 CreateXrayBulkTicketObservability
./ng net.accelbyte.sdk.cli.Main sessionhistory createXrayBulkTicketObservability \
    --namespace "$AB_NAMESPACE" \
    --body '{"ticketObservabilities": [{"action": "efGYH4SE", "activeAllianceRule": {"max_number": 90, "min_number": 39, "player_max_number": 87, "player_min_number": 36}, "activeMatchingRule": [{"attribute": "9Dajc1wC", "criteria": "RUWeSfRw", "reference": 0.7202167255089783}, {"attribute": "rWnECnWJ", "criteria": "zfrYDnMr", "reference": 0.5124628892648604}, {"attribute": "vanDFWIe", "criteria": "MORZhG7U", "reference": 0.9542878196889805}], "function": "TjMrezPf", "gameMode": "ICs7uq8e", "isBackfillMatch": true, "isRuleSetFlexed": true, "iteration": 43, "matchID": "3eJ6ENFc", "namespace": "ayGmNpoX", "remainingPlayersPerTicket": [68, 42, 15], "remainingTickets": 61, "sessionTickID": "pViDBiQw", "tickID": 73, "ticketID": "KtfYDIC3", "timeToMatchSec": 0.14366068002227994, "timestamp": "1971-06-28T00:00:00Z", "unbackfillReason": "f0lnYUpH", "unmatchReason": "1f3mUvs0"}, {"action": "quGoZhOB", "activeAllianceRule": {"max_number": 44, "min_number": 27, "player_max_number": 39, "player_min_number": 54}, "activeMatchingRule": [{"attribute": "PDj4ePqO", "criteria": "YICBFi9a", "reference": 0.5972336323393246}, {"attribute": "NkMsOMYt", "criteria": "W4qbVW1T", "reference": 0.11743051818780958}, {"attribute": "4lcPsZTs", "criteria": "kaoBnqe0", "reference": 0.3467815625215265}], "function": "Xy5OTusF", "gameMode": "AqL5pc0Q", "isBackfillMatch": false, "isRuleSetFlexed": true, "iteration": 28, "matchID": "4snaTjWO", "namespace": "DUmAc24K", "remainingPlayersPerTicket": [42, 36, 9], "remainingTickets": 39, "sessionTickID": "H1TkTDVO", "tickID": 7, "ticketID": "M5M1okI5", "timeToMatchSec": 0.032973972096282056, "timestamp": "1982-11-10T00:00:00Z", "unbackfillReason": "3JFFVE6H", "unmatchReason": "ZgKi6Qc8"}, {"action": "4pkNCOva", "activeAllianceRule": {"max_number": 35, "min_number": 68, "player_max_number": 92, "player_min_number": 48}, "activeMatchingRule": [{"attribute": "ovFTapZW", "criteria": "CH7dhq8J", "reference": 0.9230720718440201}, {"attribute": "MzDaVyzV", "criteria": "75GMmzWi", "reference": 0.9852226050989723}, {"attribute": "mntZWh0S", "criteria": "b4cp9ho8", "reference": 0.5691312109650221}], "function": "9uSaqeAA", "gameMode": "67ZQfJt9", "isBackfillMatch": true, "isRuleSetFlexed": true, "iteration": 63, "matchID": "tlC7HqFp", "namespace": "llSa05KQ", "remainingPlayersPerTicket": [73, 48, 67], "remainingTickets": 25, "sessionTickID": "r6GSl8pR", "tickID": 87, "ticketID": "Z0mAUvnp", "timeToMatchSec": 0.5381932541720414, "timestamp": "1981-05-07T00:00:00Z", "unbackfillReason": "BCmRagwH", "unmatchReason": "GErfmCIQ"}]}' \
    > test.out 2>&1
eval_tap $? 37 'CreateXrayBulkTicketObservability' test.out

#- 38 QueryXrayTimelineByTicketID
./ng net.accelbyte.sdk.cli.Main sessionhistory queryXrayTimelineByTicketID \
    --namespace "$AB_NAMESPACE" \
    --ticketId 'nrJE0nG3' \
    --limit '7' \
    --offset '30' \
    --endDate 'nB1lKGGj' \
    --startDate '3QY8tZ53' \
    > test.out 2>&1
eval_tap $? 38 'QueryXrayTimelineByTicketID' test.out

#- 39 QueryXrayTimelineByUserID
./ng net.accelbyte.sdk.cli.Main sessionhistory queryXrayTimelineByUserID \
    --namespace "$AB_NAMESPACE" \
    --userId 'G7ey4a4X' \
    --limit '27' \
    --offset '69' \
    --endDate 'WAlFYSbj' \
    --startDate '4Z6MFDle' \
    > test.out 2>&1
eval_tap $? 39 'QueryXrayTimelineByUserID' test.out


rm -f "tmp.dat"

exit $EXIT_CODE