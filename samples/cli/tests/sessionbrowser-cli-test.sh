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
echo "1..21"

#- 1 Login
./ng net.accelbyte.sdk.cli.Main loginClient \
    > test.out 2>&1
eval_tap $? 1 'Login' test.out

if [ $EXIT_CODE -ne 0 ]; then
  echo "Bail out! Login failed."
  exit $EXIT_CODE
fi

touch "tmp.dat"

#- 2 AdminQuerySession
./ng net.accelbyte.sdk.cli.Main sessionbrowser adminQuerySession \
    --namespace "$AB_NAMESPACE" \
    --gameMode 'mMwMlyLy' \
    --gameVersion 'lz808hLk' \
    --joinable 'Qg5ONxe9' \
    --limit '29' \
    --matchExist 'spo6HLll' \
    --matchId '8dwo6bSg' \
    --offset '9' \
    --serverStatus 'hKTGu5Iq' \
    --userId '4ZsYGpPn' \
    --sessionType 'gvD1y8Tp' \
    > test.out 2>&1
eval_tap $? 2 'AdminQuerySession' test.out

#- 3 GetTotalActiveSession
./ng net.accelbyte.sdk.cli.Main sessionbrowser getTotalActiveSession \
    --namespace "$AB_NAMESPACE" \
    --sessionType 'jmIPUQhp' \
    > test.out 2>&1
eval_tap $? 3 'GetTotalActiveSession' test.out

#- 4 GetActiveCustomGameSessions
./ng net.accelbyte.sdk.cli.Main sessionbrowser getActiveCustomGameSessions \
    --namespace "$AB_NAMESPACE" \
    --limit '35' \
    --offset '84' \
    --serverRegion 'qHf6br6S' \
    --sessionId 'J3wAyRnB' \
    > test.out 2>&1
eval_tap $? 4 'GetActiveCustomGameSessions' test.out

#- 5 GetActiveMatchmakingGameSessions
./ng net.accelbyte.sdk.cli.Main sessionbrowser getActiveMatchmakingGameSessions \
    --namespace "$AB_NAMESPACE" \
    --limit '52' \
    --matchId 'cIqlXcf8' \
    --offset '21' \
    --serverRegion 'HlhSfaWh' \
    --sessionId 'bbjRsxnt' \
    > test.out 2>&1
eval_tap $? 5 'GetActiveMatchmakingGameSessions' test.out

#- 6 AdminGetSession
./ng net.accelbyte.sdk.cli.Main sessionbrowser adminGetSession \
    --namespace "$AB_NAMESPACE" \
    --sessionID 'LO4t2Ry0' \
    > test.out 2>&1
eval_tap $? 6 'AdminGetSession' test.out

#- 7 AdminDeleteSession
./ng net.accelbyte.sdk.cli.Main sessionbrowser adminDeleteSession \
    --namespace "$AB_NAMESPACE" \
    --sessionID 'vC76XsgL' \
    > test.out 2>&1
eval_tap $? 7 'AdminDeleteSession' test.out

#- 8 AdminSearchSessionsV2
./ng net.accelbyte.sdk.cli.Main sessionbrowser adminSearchSessionsV2 \
    --namespace "$AB_NAMESPACE" \
    --channel '3SBvmkCY' \
    --deleted  \
    --matchID 'VT5T5jv7' \
    --partyID 'MnvtOfxl' \
    --sessionType 'H2BUo6LX' \
    --status 'n2m9FF7p' \
    --userID '8aMsmrZo' \
    --limit '44' \
    --offset '86' \
    > test.out 2>&1
eval_tap $? 8 'AdminSearchSessionsV2' test.out

#- 9 GetSessionHistoryDetailed
./ng net.accelbyte.sdk.cli.Main sessionbrowser getSessionHistoryDetailed \
    --matchID 'IsgrRV08' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 9 'GetSessionHistoryDetailed' test.out

#- 10 UserQuerySession
./ng net.accelbyte.sdk.cli.Main sessionbrowser userQuerySession \
    --namespace "$AB_NAMESPACE" \
    --gameMode 'XpKVooWI' \
    --gameVersion 'OPU1Nd5y' \
    --joinable 'YmnyP4cF' \
    --limit '8' \
    --matchExist 'YE3h7tVQ' \
    --matchId 'EmO4UZiN' \
    --offset '16' \
    --serverStatus 'buEOfqEt' \
    --userId 'm9qs9NG2' \
    --sessionType 'OV7nKIbN' \
    > test.out 2>&1
eval_tap $? 10 'UserQuerySession' test.out

#- 11 CreateSession
./ng net.accelbyte.sdk.cli.Main sessionbrowser createSession \
    --namespace "$AB_NAMESPACE" \
    --body '{"game_session_setting": {"allow_join_in_progress": false, "current_internal_player": 35, "current_player": 80, "map_name": "HB8fzwgq", "max_internal_player": 9, "max_player": 34, "mode": "qQCl7aQ5", "num_bot": 61, "password": "S7topvUK", "settings": {"7QPefN7R": {}, "05lbHLoi": {}, "cYRgaeX2": {}}}, "game_version": "RRjz6e4V", "namespace": "W7Mpwg3u", "session_type": "zp0fhSTj", "username": "AED0oo0O"}' \
    > test.out 2>&1
eval_tap $? 11 'CreateSession' test.out

#- 12 GetSessionByUserIDs
./ng net.accelbyte.sdk.cli.Main sessionbrowser getSessionByUserIDs \
    --namespace "$AB_NAMESPACE" \
    --userIds 'sySfCNQl' \
    > test.out 2>&1
eval_tap $? 12 'GetSessionByUserIDs' test.out

#- 13 GetSession
./ng net.accelbyte.sdk.cli.Main sessionbrowser getSession \
    --namespace "$AB_NAMESPACE" \
    --sessionID 'ifpv5iCy' \
    > test.out 2>&1
eval_tap $? 13 'GetSession' test.out

#- 14 UpdateSession
./ng net.accelbyte.sdk.cli.Main sessionbrowser updateSession \
    --namespace "$AB_NAMESPACE" \
    --sessionID 'ccWoYeF5' \
    --body '{"game_max_player": 19}' \
    > test.out 2>&1
eval_tap $? 14 'UpdateSession' test.out

#- 15 DeleteSession
./ng net.accelbyte.sdk.cli.Main sessionbrowser deleteSession \
    --namespace "$AB_NAMESPACE" \
    --sessionID 'zc5Yw5E3' \
    > test.out 2>&1
eval_tap $? 15 'DeleteSession' test.out

#- 16 JoinSession
./ng net.accelbyte.sdk.cli.Main sessionbrowser joinSession \
    --namespace "$AB_NAMESPACE" \
    --sessionID 'aFeYyCyO' \
    --body '{"password": "QZooViav"}' \
    > test.out 2>&1
eval_tap $? 16 'JoinSession' test.out

#- 17 DeleteSessionLocalDS
./ng net.accelbyte.sdk.cli.Main sessionbrowser deleteSessionLocalDS \
    --namespace "$AB_NAMESPACE" \
    --sessionID 'kPd9byAQ' \
    > test.out 2>&1
eval_tap $? 17 'DeleteSessionLocalDS' test.out

#- 18 AddPlayerToSession
./ng net.accelbyte.sdk.cli.Main sessionbrowser addPlayerToSession \
    --namespace "$AB_NAMESPACE" \
    --sessionID '9IpBEcKs' \
    --body '{"as_spectator": false, "user_id": "awvWTEWY"}' \
    > test.out 2>&1
eval_tap $? 18 'AddPlayerToSession' test.out

#- 19 RemovePlayerFromSession
./ng net.accelbyte.sdk.cli.Main sessionbrowser removePlayerFromSession \
    --namespace "$AB_NAMESPACE" \
    --sessionID 'CpAg8Kkq' \
    --userID 'bty5WvvL' \
    > test.out 2>&1
eval_tap $? 19 'RemovePlayerFromSession' test.out

#- 20 UpdateSettings
./ng net.accelbyte.sdk.cli.Main sessionbrowser updateSettings \
    --namespace "$AB_NAMESPACE" \
    --sessionID 'SsFA4Cjq' \
    --body '{}' \
    > test.out 2>&1
eval_tap $? 20 'UpdateSettings' test.out

#- 21 GetRecentPlayer
./ng net.accelbyte.sdk.cli.Main sessionbrowser getRecentPlayer \
    --namespace "$AB_NAMESPACE" \
    --userID 'cLtcepLR' \
    > test.out 2>&1
eval_tap $? 21 'GetRecentPlayer' test.out


rm -f "tmp.dat"

exit $EXIT_CODE