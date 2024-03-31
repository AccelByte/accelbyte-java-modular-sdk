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
echo "1..32"

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

#- 4 AdminQueryGameSessionDetail
./ng net.accelbyte.sdk.cli.Main sessionhistory adminQueryGameSessionDetail \
    --namespace "$AB_NAMESPACE" \
    --gameSessionID 'Q8XcRToF' \
    --limit '47' \
    --offset '16' \
    --order 'L0WuO8Cf' \
    --orderBy 'Yh6HaC0m' \
    --userID 'Z3i9sKpA' \
    > test.out 2>&1
eval_tap $? 4 'AdminQueryGameSessionDetail' test.out

#- 5 GetGameSessionDetail
./ng net.accelbyte.sdk.cli.Main sessionhistory getGameSessionDetail \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'oECah4Wy' \
    > test.out 2>&1
eval_tap $? 5 'GetGameSessionDetail' test.out

#- 6 AdminQueryMatchmakingDetail
./ng net.accelbyte.sdk.cli.Main sessionhistory adminQueryMatchmakingDetail \
    --namespace "$AB_NAMESPACE" \
    --gameSessionID 'k4R8Sa3K' \
    --limit '71' \
    --offset '11' \
    --order 'CaF9xBIF' \
    --orderBy 'NoPK7Z6r' \
    --ticketID 'TOflrd5x' \
    --userID 'X4ZByO4z' \
    > test.out 2>&1
eval_tap $? 6 'AdminQueryMatchmakingDetail' test.out

#- 7 AdminGetMatchmakingDetailBySessionID
./ng net.accelbyte.sdk.cli.Main sessionhistory adminGetMatchmakingDetailBySessionID \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'aMGG9jta' \
    > test.out 2>&1
eval_tap $? 7 'AdminGetMatchmakingDetailBySessionID' test.out

#- 8 AdminGetMatchmakingDetailByTicketID
./ng net.accelbyte.sdk.cli.Main sessionhistory adminGetMatchmakingDetailByTicketID \
    --namespace "$AB_NAMESPACE" \
    --ticketId 'gxioIbrC' \
    > test.out 2>&1
eval_tap $? 8 'AdminGetMatchmakingDetailByTicketID' test.out

#- 9 AdminQueryPartyDetail
./ng net.accelbyte.sdk.cli.Main sessionhistory adminQueryPartyDetail \
    --namespace "$AB_NAMESPACE" \
    --limit '42' \
    --offset '36' \
    --order 'c0hLpIhT' \
    --orderBy '6azDgfI0' \
    --partyID 'LTuuo6W1' \
    --userID 'e5FbWMmQ' \
    > test.out 2>&1
eval_tap $? 9 'AdminQueryPartyDetail' test.out

#- 10 GetPartyDetail
./ng net.accelbyte.sdk.cli.Main sessionhistory getPartyDetail \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'mFJzqHY6' \
    > test.out 2>&1
eval_tap $? 10 'GetPartyDetail' test.out

#- 11 AdminQueryTicketDetail
./ng net.accelbyte.sdk.cli.Main sessionhistory adminQueryTicketDetail \
    --namespace "$AB_NAMESPACE" \
    --endDate 'eMwMZQ9T' \
    --gameMode 'DM1geWHc' \
    --limit '22' \
    --offset '100' \
    --order 'X5FFySuH' \
    --partyID 'uIO1eePt' \
    --region '9W2OWrYu' \
    --startDate 'csP3hNIX' \
    --userIDs '9LvvmZoX' \
    > test.out 2>&1
eval_tap $? 11 'AdminQueryTicketDetail' test.out

#- 12 AdminTicketDetailGetByTicketID
./ng net.accelbyte.sdk.cli.Main sessionhistory adminTicketDetailGetByTicketID \
    --namespace "$AB_NAMESPACE" \
    --ticketId 'QaBUeJap' \
    > test.out 2>&1
eval_tap $? 12 'AdminTicketDetailGetByTicketID' test.out

#- 13 QueryXrayMatchPool
./ng net.accelbyte.sdk.cli.Main sessionhistory queryXrayMatchPool \
    --namespace "$AB_NAMESPACE" \
    --poolName 'mgZ9IvOR' \
    --endDate 'ZJwzztV0' \
    --startDate 'KiZyejy4' \
    > test.out 2>&1
eval_tap $? 13 'QueryXrayMatchPool' test.out

#- 14 QueryDetailTickMatchPool
./ng net.accelbyte.sdk.cli.Main sessionhistory queryDetailTickMatchPool \
    --namespace "$AB_NAMESPACE" \
    --podName '6EnnEa61' \
    --poolName 'HkSABqAC' \
    --all  \
    --limit '91' \
    --offset '87' \
    --endDate 'nFHmp7cs' \
    --startDate 'RPRCSWWw' \
    > test.out 2>&1
eval_tap $? 14 'QueryDetailTickMatchPool' test.out

#- 15 QueryDetailTickMatchPoolMatches
./ng net.accelbyte.sdk.cli.Main sessionhistory queryDetailTickMatchPoolMatches \
    --namespace "$AB_NAMESPACE" \
    --podName 'OLsdMfNk' \
    --poolName 'OOKYlD16' \
    --tickId 'dXYckpiA' \
    > test.out 2>&1
eval_tap $? 15 'QueryDetailTickMatchPoolMatches' test.out

#- 16 QueryDetailTickMatchPoolTicket
./ng net.accelbyte.sdk.cli.Main sessionhistory queryDetailTickMatchPoolTicket \
    --namespace "$AB_NAMESPACE" \
    --podName 'v8IWdlpr' \
    --poolName 'GAbeiUtJ' \
    --tickId '2IqHDdUB' \
    > test.out 2>&1
eval_tap $? 16 'QueryDetailTickMatchPoolTicket' test.out

#- 17 QueryMatchHistories
./ng net.accelbyte.sdk.cli.Main sessionhistory queryMatchHistories \
    --matchId '6ztH0AUa' \
    --namespace "$AB_NAMESPACE" \
    --limit '63' \
    --offset '91' \
    > test.out 2>&1
eval_tap $? 17 'QueryMatchHistories' test.out

#- 18 QueryMatchTicketHistories
./ng net.accelbyte.sdk.cli.Main sessionhistory queryMatchTicketHistories \
    --matchId 'oyewHyge' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 18 'QueryMatchTicketHistories' test.out

#- 19 QueryXrayMatch
./ng net.accelbyte.sdk.cli.Main sessionhistory queryXrayMatch \
    --matchId 'BVsN06Tw' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 19 'QueryXrayMatch' test.out

#- 20 QueryAcquiringDS
./ng net.accelbyte.sdk.cli.Main sessionhistory queryAcquiringDS \
    --namespace "$AB_NAMESPACE" \
    --endDate 'upvyoMzH' \
    --startDate 'KxANffbD' \
    > test.out 2>&1
eval_tap $? 20 'QueryAcquiringDS' test.out

#- 21 QueryAcquiringDSWaitTimeAvg
./ng net.accelbyte.sdk.cli.Main sessionhistory queryAcquiringDSWaitTimeAvg \
    --namespace "$AB_NAMESPACE" \
    --endDate '0MObAbsp' \
    --startDate 'IXeOqht6' \
    > test.out 2>&1
eval_tap $? 21 'QueryAcquiringDSWaitTimeAvg' test.out

#- 22 QueryMatchLengthDurationpAvg
./ng net.accelbyte.sdk.cli.Main sessionhistory queryMatchLengthDurationpAvg \
    --namespace "$AB_NAMESPACE" \
    --endDate 'Fmapdvuk' \
    --startDate 'OSmBoDDO' \
    > test.out 2>&1
eval_tap $? 22 'QueryMatchLengthDurationpAvg' test.out

#- 23 QueryMatchLengthDurationp99
./ng net.accelbyte.sdk.cli.Main sessionhistory queryMatchLengthDurationp99 \
    --namespace "$AB_NAMESPACE" \
    --endDate 'FMoxNzgG' \
    --startDate 'iExBRliq' \
    > test.out 2>&1
eval_tap $? 23 'QueryMatchLengthDurationp99' test.out

#- 24 QueryTotalActiveSession
./ng net.accelbyte.sdk.cli.Main sessionhistory queryTotalActiveSession \
    --namespace "$AB_NAMESPACE" \
    --region 'YjFRDFyr' \
    --endDate '5Az4Ou5C' \
    --startDate 'jZSH9QQh' \
    > test.out 2>&1
eval_tap $? 24 'QueryTotalActiveSession' test.out

#- 25 QueryTotalMatchmakingMatch
./ng net.accelbyte.sdk.cli.Main sessionhistory queryTotalMatchmakingMatch \
    --namespace "$AB_NAMESPACE" \
    --matchPool 'steTOb0s' \
    --endDate '1DqDZRaN' \
    --startDate 'J9LlTgj8' \
    > test.out 2>&1
eval_tap $? 25 'QueryTotalMatchmakingMatch' test.out

#- 26 QueryTotalPlayerPersession
./ng net.accelbyte.sdk.cli.Main sessionhistory queryTotalPlayerPersession \
    --namespace "$AB_NAMESPACE" \
    --endDate 'UYKRM8Yt' \
    --startDate 'ZnI6iYNP' \
    > test.out 2>&1
eval_tap $? 26 'QueryTotalPlayerPersession' test.out

#- 27 QueryTotalMatchmakingCanceled
./ng net.accelbyte.sdk.cli.Main sessionhistory queryTotalMatchmakingCanceled \
    --namespace "$AB_NAMESPACE" \
    --matchPool 'nVrmYsee' \
    --endDate 'TOZLKv4Y' \
    --startDate 'cLz9nkWU' \
    > test.out 2>&1
eval_tap $? 27 'QueryTotalMatchmakingCanceled' test.out

#- 28 QueryTotalMatchmakingCreated
./ng net.accelbyte.sdk.cli.Main sessionhistory queryTotalMatchmakingCreated \
    --namespace "$AB_NAMESPACE" \
    --matchPool '0atU6iJO' \
    --endDate '4wcTJFMx' \
    --startDate 'OLkdWLG2' \
    > test.out 2>&1
eval_tap $? 28 'QueryTotalMatchmakingCreated' test.out

#- 29 QueryTotalMatchmakingExpired
./ng net.accelbyte.sdk.cli.Main sessionhistory queryTotalMatchmakingExpired \
    --namespace "$AB_NAMESPACE" \
    --matchPool 'js3M4UNS' \
    --endDate 'FFpN8IYR' \
    --startDate 'dTs9Fal2' \
    > test.out 2>&1
eval_tap $? 29 'QueryTotalMatchmakingExpired' test.out

#- 30 QueryTotalMatchmakingMatchTicket
./ng net.accelbyte.sdk.cli.Main sessionhistory queryTotalMatchmakingMatchTicket \
    --namespace "$AB_NAMESPACE" \
    --matchPool 'V6TYoxJ9' \
    --endDate 'TVZT8QDb' \
    --startDate 'SDi3dPQK' \
    > test.out 2>&1
eval_tap $? 30 'QueryTotalMatchmakingMatchTicket' test.out

#- 31 QueryXrayTimelineByTicketID
./ng net.accelbyte.sdk.cli.Main sessionhistory queryXrayTimelineByTicketID \
    --namespace "$AB_NAMESPACE" \
    --ticketId 'q5uzGkOr' \
    --limit '42' \
    --offset '35' \
    --endDate 'a2GodzT9' \
    --startDate 'm6uiHM0L' \
    > test.out 2>&1
eval_tap $? 31 'QueryXrayTimelineByTicketID' test.out

#- 32 QueryXrayTimelineByUserID
./ng net.accelbyte.sdk.cli.Main sessionhistory queryXrayTimelineByUserID \
    --namespace "$AB_NAMESPACE" \
    --userId 'Zt7on3fO' \
    --limit '69' \
    --offset '33' \
    --endDate '9XsQuYYx' \
    --startDate 'ra3Dw1O2' \
    > test.out 2>&1
eval_tap $? 32 'QueryXrayTimelineByUserID' test.out


rm -f "tmp.dat"

exit $EXIT_CODE