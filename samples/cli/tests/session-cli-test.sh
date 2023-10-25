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
echo "1..70"

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
./ng net.accelbyte.sdk.cli.Main session getHealthcheckInfo \
    > test.out 2>&1
eval_tap $? 2 'GetHealthcheckInfo' test.out

#- 3 GetHealthcheckInfoV1
./ng net.accelbyte.sdk.cli.Main session getHealthcheckInfoV1 \
    > test.out 2>&1
eval_tap $? 3 'GetHealthcheckInfoV1' test.out

#- 4 AdminGetDSMCConfigurationDefault
./ng net.accelbyte.sdk.cli.Main session adminGetDSMCConfigurationDefault \
    > test.out 2>&1
eval_tap $? 4 'AdminGetDSMCConfigurationDefault' test.out

#- 5 AdminListEnvironmentVariables
./ng net.accelbyte.sdk.cli.Main session adminListEnvironmentVariables \
    > test.out 2>&1
eval_tap $? 5 'AdminListEnvironmentVariables' test.out

#- 6 AdminListGlobalConfiguration
./ng net.accelbyte.sdk.cli.Main session adminListGlobalConfiguration \
    > test.out 2>&1
eval_tap $? 6 'AdminListGlobalConfiguration' test.out

#- 7 AdminUpdateGlobalConfiguration
./ng net.accelbyte.sdk.cli.Main session adminUpdateGlobalConfiguration \
    --body '{"regionRetryMapping": {"K5ze4Egh": ["aogshUse", "PIGucMdA", "ynXSgN6g"], "R3xIaFX1": ["nkGlb0II", "vwedI2dc", "E5okn9xB"], "2dM7Jk5d": ["FxHwze8H", "2HRkaiA7", "har8SudR"]}, "regionURLMapping": ["OsvvhkUE", "AbSTccgy", "vtJ4NSgC"], "testGameMode": "JjbNiE5P", "testRegionURLMapping": ["USQKevUB", "qgY9Kezy", "KL4TQBTc"], "testTargetUserIDs": ["dvefhFAG", "5Bh5MTNJ", "44HXJ8d7"]}' \
    > test.out 2>&1
eval_tap $? 7 'AdminUpdateGlobalConfiguration' test.out

#- 8 AdminDeleteGlobalConfiguration
./ng net.accelbyte.sdk.cli.Main session adminDeleteGlobalConfiguration \
    > test.out 2>&1
eval_tap $? 8 'AdminDeleteGlobalConfiguration' test.out

#- 9 AdminGetConfigurationAlertV1
./ng net.accelbyte.sdk.cli.Main session adminGetConfigurationAlertV1 \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 9 'AdminGetConfigurationAlertV1' test.out

#- 10 AdminUpdateConfigurationAlertV1
./ng net.accelbyte.sdk.cli.Main session adminUpdateConfigurationAlertV1 \
    --namespace "$AB_NAMESPACE" \
    --body '{"durationDays": 59}' \
    > test.out 2>&1
eval_tap $? 10 'AdminUpdateConfigurationAlertV1' test.out

#- 11 AdminCreateConfigurationAlertV1
./ng net.accelbyte.sdk.cli.Main session adminCreateConfigurationAlertV1 \
    --namespace "$AB_NAMESPACE" \
    --body '{"durationDays": 76}' \
    > test.out 2>&1
eval_tap $? 11 'AdminCreateConfigurationAlertV1' test.out

#- 12 AdminDeleteConfigurationAlertV1
./ng net.accelbyte.sdk.cli.Main session adminDeleteConfigurationAlertV1 \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 12 'AdminDeleteConfigurationAlertV1' test.out

#- 13 AdminCreateConfigurationTemplateV1
./ng net.accelbyte.sdk.cli.Main session adminCreateConfigurationTemplateV1 \
    --namespace "$AB_NAMESPACE" \
    --body '{"NativeSessionSetting": {"PSNServiceLabel": 0, "PSNSupportedPlatforms": ["EmW0gqkR", "pnO4nnTP", "0HTs3v6r"], "SessionTitle": "JYVp0IeY", "ShouldSync": true, "XboxServiceConfigID": "6nIMLZTY", "XboxSessionTemplateName": "NC67gjMD", "localizedSessionName": {"x9xPfYMl": {}, "EeWpM34l": {}, "g4Q4XDVz": {}}}, "PSNBaseUrl": "d3mh2VAH", "autoJoin": true, "clientVersion": "6nEmC9yp", "deployment": "He6EkMdr", "dsSource": "th49GfE1", "fallbackClaimKeys": ["SimZK4to", "mKdh5Jru", "gmRXtkky"], "immutableStorage": true, "inactiveTimeout": 58, "inviteTimeout": 74, "joinability": "udP7O6DG", "maxActiveSessions": 4, "maxPlayers": 3, "minPlayers": 65, "name": "n6FZ86M6", "persistent": true, "preferredClaimKeys": ["StF4DXeO", "6fXFkyak", "PsGF0YUc"], "requestedRegions": ["AJI0N0T0", "lSxNXMwf", "vuvaeMOY"], "textChat": false, "tieTeamsSessionLifetime": true, "type": "AKdlTtO3"}' \
    > test.out 2>&1
eval_tap $? 13 'AdminCreateConfigurationTemplateV1' test.out

#- 14 AdminGetAllConfigurationTemplatesV1
./ng net.accelbyte.sdk.cli.Main session adminGetAllConfigurationTemplatesV1 \
    --namespace "$AB_NAMESPACE" \
    --limit '49' \
    --name 'rBCnUFs9' \
    --offset '9' \
    --order 'zvqvcdsb' \
    --orderBy 'L3YJ34DG' \
    > test.out 2>&1
eval_tap $? 14 'AdminGetAllConfigurationTemplatesV1' test.out

#- 15 AdminGetConfigurationTemplateV1
./ng net.accelbyte.sdk.cli.Main session adminGetConfigurationTemplateV1 \
    --name '6k8ZFzsB' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 15 'AdminGetConfigurationTemplateV1' test.out

#- 16 AdminUpdateConfigurationTemplateV1
./ng net.accelbyte.sdk.cli.Main session adminUpdateConfigurationTemplateV1 \
    --name 'HHuuQcdi' \
    --namespace "$AB_NAMESPACE" \
    --body '{"NativeSessionSetting": {"PSNServiceLabel": 77, "PSNSupportedPlatforms": ["djBidWRS", "CAVLv3e9", "vUNBlzCp"], "SessionTitle": "Rs3XJs1H", "ShouldSync": true, "XboxServiceConfigID": "FhWmwLGR", "XboxSessionTemplateName": "zBhTbpSn", "localizedSessionName": {"w34bu4Ig": {}, "WfhKyVtC": {}, "VsTsTxZa": {}}}, "PSNBaseUrl": "HoJE2pnm", "autoJoin": false, "clientVersion": "rQGsdpPZ", "deployment": "4BSi8LQ1", "dsSource": "AqUje5FZ", "fallbackClaimKeys": ["Mt2BRHrC", "OD2l6sjN", "gq2X2Kx4"], "immutableStorage": true, "inactiveTimeout": 20, "inviteTimeout": 7, "joinability": "T73fYzOF", "maxActiveSessions": 6, "maxPlayers": 66, "minPlayers": 81, "name": "UVSoMCR6", "persistent": true, "preferredClaimKeys": ["ZMObxM0P", "5NGyR2lA", "gKzzLvsJ"], "requestedRegions": ["iuZgrhqp", "V39MTFC7", "GsJQvRkd"], "textChat": false, "tieTeamsSessionLifetime": false, "type": "fbvfkyzF"}' \
    > test.out 2>&1
eval_tap $? 16 'AdminUpdateConfigurationTemplateV1' test.out

#- 17 AdminDeleteConfigurationTemplateV1
./ng net.accelbyte.sdk.cli.Main session adminDeleteConfigurationTemplateV1 \
    --name 'a82w0Zbz' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 17 'AdminDeleteConfigurationTemplateV1' test.out

#- 18 AdminGetDSMCConfiguration
./ng net.accelbyte.sdk.cli.Main session adminGetDSMCConfiguration \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 18 'AdminGetDSMCConfiguration' test.out

#- 19 AdminSyncDSMCConfiguration
./ng net.accelbyte.sdk.cli.Main session adminSyncDSMCConfiguration \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 19 'AdminSyncDSMCConfiguration' test.out

#- 20 AdminQueryGameSessions
./ng net.accelbyte.sdk.cli.Main session adminQueryGameSessions \
    --namespace "$AB_NAMESPACE" \
    --configurationName 'PMlqKgTW' \
    --dsPodName '8rSZwfgf' \
    --fromTime 'ATp5urNi' \
    --gameMode 'mE4Vf2Y6' \
    --isPersistent 'Lv1B7V7w' \
    --isSoftDeleted 'EXz3DLHa' \
    --joinability 'OHgeeBMy' \
    --limit '37' \
    --matchPool '0Roba53C' \
    --memberID 'ukd4MVL2' \
    --offset '48' \
    --order '5wJGqoQ6' \
    --orderBy 'I9nGDHcn' \
    --sessionID 'hh9SxqsI' \
    --status 'rEcXveRF' \
    --statusV2 'MFxSMwKL' \
    --toTime 'U1SG2d1l' \
    > test.out 2>&1
eval_tap $? 20 'AdminQueryGameSessions' test.out

#- 21 AdminQueryGameSessionsByAttributes
./ng net.accelbyte.sdk.cli.Main session adminQueryGameSessionsByAttributes \
    --namespace "$AB_NAMESPACE" \
    --body '{"6wqaWMgM": {}, "FM41CDoR": {}, "HiGVdVv5": {}}' \
    > test.out 2>&1
eval_tap $? 21 'AdminQueryGameSessionsByAttributes' test.out

#- 22 AdminDeleteBulkGameSessions
./ng net.accelbyte.sdk.cli.Main session adminDeleteBulkGameSessions \
    --namespace "$AB_NAMESPACE" \
    --body '{"ids": ["kzLB5gOO", "js1eGB7W", "3QqsmL1M"]}' \
    > test.out 2>&1
eval_tap $? 22 'AdminDeleteBulkGameSessions' test.out

#- 23 AdminUpdateGameSessionMember
./ng net.accelbyte.sdk.cli.Main session adminUpdateGameSessionMember \
    --memberId 'VzV5nK48' \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'lJWmpn3g' \
    --statusType 'CopCDXAf' \
    > test.out 2>&1
eval_tap $? 23 'AdminUpdateGameSessionMember' test.out

#- 24 AdminQueryParties
./ng net.accelbyte.sdk.cli.Main session adminQueryParties \
    --namespace "$AB_NAMESPACE" \
    --joinability 'cmODyCq6' \
    --key '29JS2iXE' \
    --leaderID 'uI8niQtw' \
    --limit '66' \
    --memberID 'SOJEEe4Y' \
    --memberStatus 'knwT4zPI' \
    --offset '49' \
    --order 'pApcFffl' \
    --orderBy 'eLfmPM57' \
    --partyID '0k44E9ea' \
    --value 'pkcSg51O' \
    > test.out 2>&1
eval_tap $? 24 'AdminQueryParties' test.out

#- 25 AdminGetPlatformCredentials
./ng net.accelbyte.sdk.cli.Main session adminGetPlatformCredentials \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 25 'AdminGetPlatformCredentials' test.out

#- 26 AdminUpdatePlatformCredentials
./ng net.accelbyte.sdk.cli.Main session adminUpdatePlatformCredentials \
    --namespace "$AB_NAMESPACE" \
    --body '{"psn": {"clientId": "XbGIzaFP", "clientSecret": "xIJXRD04", "scope": "cSXyDdLl"}}' \
    > test.out 2>&1
eval_tap $? 26 'AdminUpdatePlatformCredentials' test.out

#- 27 AdminDeletePlatformCredentials
./ng net.accelbyte.sdk.cli.Main session adminDeletePlatformCredentials \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 27 'AdminDeletePlatformCredentials' test.out

#- 28 AdminReadSessionStorage
./ng net.accelbyte.sdk.cli.Main session adminReadSessionStorage \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'JtQxZAnE' \
    > test.out 2>&1
eval_tap $? 28 'AdminReadSessionStorage' test.out

#- 29 AdminDeleteUserSessionStorage
./ng net.accelbyte.sdk.cli.Main session adminDeleteUserSessionStorage \
    --namespace "$AB_NAMESPACE" \
    --sessionId '142RoXu7' \
    > test.out 2>&1
eval_tap $? 29 'AdminDeleteUserSessionStorage' test.out

#- 30 AdminReadUserSessionStorage
./ng net.accelbyte.sdk.cli.Main session adminReadUserSessionStorage \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'UoQ4aRV7' \
    --userId 'Lg39lK29' \
    > test.out 2>&1
eval_tap $? 30 'AdminReadUserSessionStorage' test.out

#- 31 AdminQueryPlayerAttributes
./ng net.accelbyte.sdk.cli.Main session adminQueryPlayerAttributes \
    --namespace "$AB_NAMESPACE" \
    --users '9r92hT27' \
    > test.out 2>&1
eval_tap $? 31 'AdminQueryPlayerAttributes' test.out

#- 32 AdminGetPlayerAttributes
./ng net.accelbyte.sdk.cli.Main session adminGetPlayerAttributes \
    --namespace "$AB_NAMESPACE" \
    --userId 't6cY7WlY' \
    > test.out 2>&1
eval_tap $? 32 'AdminGetPlayerAttributes' test.out

#- 33 CreateGameSession
./ng net.accelbyte.sdk.cli.Main session createGameSession \
    --namespace "$AB_NAMESPACE" \
    --body '{"attributes": {"wvQsSKFm": {}, "QFOe5dl6": {}, "fKPNA78k": {}}, "autoJoin": false, "backfillTicketID": "AKaGyl1f", "clientVersion": "XwFtDCg4", "configurationName": "dIfsiZ01", "deployment": "lxOMlxFF", "dsSource": "x9E9JzeN", "fallbackClaimKeys": ["Urf9wght", "ki5FxnEI", "shomYbUh"], "inactiveTimeout": 39, "inviteTimeout": 42, "joinability": "YLcVdH5t", "matchPool": "6ZigCibd", "maxPlayers": 57, "minPlayers": 19, "preferredClaimKeys": ["44FvVS7N", "B7NGJtdM", "NTYdf7zw"], "requestedRegions": ["yt1R2PP4", "SGcjfVcj", "4YS5pLmL"], "serverName": "z05DHL7O", "teams": [{"UserIDs": ["mX5LqPXX", "nj5qe0wg", "vApg6sWH"], "parties": [{"partyID": "5wrmE2QM", "userIDs": ["xzrTdt9i", "FHbJdh3U", "ZKz3Snwi"]}, {"partyID": "WxUM5y5U", "userIDs": ["JAwN4wuU", "IqRHAmvA", "cdsJ1DB6"]}, {"partyID": "nBFa55BN", "userIDs": ["bQE4pN0A", "Cf4stdri", "btQEebJh"]}]}, {"UserIDs": ["CfgvqOU0", "IGWChIlr", "otYe6WU6"], "parties": [{"partyID": "L7RYDVo7", "userIDs": ["lvWr6LPx", "zbpmFkHv", "lqpssITr"]}, {"partyID": "YVH02Swh", "userIDs": ["iuukiEHx", "IpmtXy3T", "cs03fVGb"]}, {"partyID": "aI2GInos", "userIDs": ["o4lVIuUj", "zyarFK0s", "yeYioK1V"]}]}, {"UserIDs": ["rq8ZGJ26", "Ky8jCfyY", "7iUewI9n"], "parties": [{"partyID": "sfp9qeqZ", "userIDs": ["ZaRBTQLe", "pbvmaXbM", "li5DI2H6"]}, {"partyID": "XtwgblVg", "userIDs": ["BIpofR3r", "lO5PQ9vQ", "p6lKWGqJ"]}, {"partyID": "nwEuI5Fl", "userIDs": ["1qbviTnG", "ffSB4Bou", "gs5TO9yQ"]}]}], "textChat": false, "ticketIDs": ["SkMoCwsB", "Y8wZaWJb", "K7sFdjW9"], "tieTeamsSessionLifetime": false, "type": "Fs9RyW1L"}' \
    > test.out 2>&1
eval_tap $? 33 'CreateGameSession' test.out

#- 34 PublicQueryGameSessionsByAttributes
./ng net.accelbyte.sdk.cli.Main session publicQueryGameSessionsByAttributes \
    --namespace "$AB_NAMESPACE" \
    --body '{"y0DKlGjv": {}, "xvVNLVya": {}, "8jZxWzTl": {}}' \
    > test.out 2>&1
eval_tap $? 34 'PublicQueryGameSessionsByAttributes' test.out

#- 35 PublicSessionJoinCode
./ng net.accelbyte.sdk.cli.Main session publicSessionJoinCode \
    --namespace "$AB_NAMESPACE" \
    --body '{"code": "EM3zfqyL"}' \
    > test.out 2>&1
eval_tap $? 35 'PublicSessionJoinCode' test.out

#- 36 GetGameSessionByPodName
./ng net.accelbyte.sdk.cli.Main session getGameSessionByPodName \
    --namespace "$AB_NAMESPACE" \
    --podName 'knspyalp' \
    > test.out 2>&1
eval_tap $? 36 'GetGameSessionByPodName' test.out

#- 37 GetGameSession
./ng net.accelbyte.sdk.cli.Main session getGameSession \
    --namespace "$AB_NAMESPACE" \
    --sessionId '2cmDZXPI' \
    > test.out 2>&1
eval_tap $? 37 'GetGameSession' test.out

#- 38 UpdateGameSession
./ng net.accelbyte.sdk.cli.Main session updateGameSession \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'fgxziPy2' \
    --body '{"attributes": {"86UVRe0I": {}, "fz8e1f0s": {}, "KAT6DKRB": {}}, "backfillTicketID": "cPoxHl4m", "clientVersion": "uVoRl6Bf", "deployment": "lRL4N1Vi", "fallbackClaimKeys": ["fGCufe2P", "MLtEfp3B", "haNel6vE"], "inactiveTimeout": 36, "inviteTimeout": 39, "joinability": "Hghf98TV", "matchPool": "HJ0FpbJV", "maxPlayers": 89, "minPlayers": 75, "preferredClaimKeys": ["BjjRKMQp", "ZzMxXuxN", "3JVXnWU7"], "requestedRegions": ["MkJDqLWD", "PjRHAaXz", "ESRw7Kgc"], "teams": [{"UserIDs": ["Kw0RlDzl", "CWifLQ4H", "xYwJx9cU"], "parties": [{"partyID": "wWKdexES", "userIDs": ["tkRS5adA", "pXxNBCN3", "OOYquhth"]}, {"partyID": "BZ1KCsUE", "userIDs": ["eETVcsPD", "67nQ4fFZ", "uSQNWzh6"]}, {"partyID": "A7hN4sKI", "userIDs": ["q8tN3Nht", "dMdktTtJ", "2WCQ7Igt"]}]}, {"UserIDs": ["SW3mLFwZ", "UmPO69Qv", "AzuVWHFh"], "parties": [{"partyID": "3VA2WOeX", "userIDs": ["6VpQ3GAd", "QdIMHtAy", "6HWbcZKO"]}, {"partyID": "gFu6lptX", "userIDs": ["OjKv9BaG", "ktj0SQKO", "uzMchqos"]}, {"partyID": "P0EuxeXH", "userIDs": ["fQwtXjGS", "7QOv7UBD", "Yy6mttMi"]}]}, {"UserIDs": ["0JiFdj5l", "7JGavqMW", "oJwHUFU7"], "parties": [{"partyID": "plOx9Hb5", "userIDs": ["Cj17cOqf", "56CC8QxX", "VhfphKiD"]}, {"partyID": "1enGrTOV", "userIDs": ["UtQwiJHD", "8z3U1fTa", "jeOAoBMJ"]}, {"partyID": "kxOLsfsN", "userIDs": ["QDa6Pzqq", "u3D3vhNX", "MurOzPJf"]}]}], "ticketIDs": ["39cJXXUc", "YOVLirDO", "A83uJKmF"], "tieTeamsSessionLifetime": true, "type": "8C22GkYy", "version": 41}' \
    > test.out 2>&1
eval_tap $? 38 'UpdateGameSession' test.out

#- 39 DeleteGameSession
./ng net.accelbyte.sdk.cli.Main session deleteGameSession \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'J7gZt81P' \
    > test.out 2>&1
eval_tap $? 39 'DeleteGameSession' test.out

#- 40 PatchUpdateGameSession
./ng net.accelbyte.sdk.cli.Main session patchUpdateGameSession \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'jiOIJ83Y' \
    --body '{"attributes": {"yvDzjPiP": {}, "9f2GxSLJ": {}, "QNBNeoXS": {}}, "backfillTicketID": "WR97pKiu", "clientVersion": "VYZC8jBo", "deployment": "7Ds8q6SP", "fallbackClaimKeys": ["V7RWvN6k", "tfBNHb1R", "pu35AGvD"], "inactiveTimeout": 72, "inviteTimeout": 99, "joinability": "NfODdAFs", "matchPool": "T5ZXfxe8", "maxPlayers": 27, "minPlayers": 38, "preferredClaimKeys": ["EeQtepOm", "pVhJUhii", "5ZHPwxbw"], "requestedRegions": ["tqUgQm9O", "vpkWiooL", "g02MI3QP"], "teams": [{"UserIDs": ["LdZtj20K", "H0zLsS3D", "0CtjtUZY"], "parties": [{"partyID": "xe0DW5HP", "userIDs": ["dQYU28sY", "p2hQKy5h", "QL0dwSBy"]}, {"partyID": "6SszzzBE", "userIDs": ["CZ1QNf18", "kvWj4oLH", "xvLnyySG"]}, {"partyID": "x0IWTic3", "userIDs": ["Bk5HO5VQ", "JmRMjMkU", "JXWNIzwx"]}]}, {"UserIDs": ["DRO42cCi", "j3lkjLXZ", "LsCh9yax"], "parties": [{"partyID": "aoyFuUQq", "userIDs": ["5qMKihZp", "yPoDk8Pl", "8JugoX26"]}, {"partyID": "xpD2JH4F", "userIDs": ["S6PYvKEL", "sJzBENyd", "QbjEEqVb"]}, {"partyID": "k2mIFgbK", "userIDs": ["HtN4BOI9", "YTcsb2aQ", "5MEjaQYH"]}]}, {"UserIDs": ["UXPXa4VV", "tiV0CcqD", "y9d1UEDn"], "parties": [{"partyID": "tl5TzT68", "userIDs": ["jJgcUBaB", "c4nuieLx", "5SzeTMub"]}, {"partyID": "tCaQPB78", "userIDs": ["Mh6Bft5Q", "VvdTQ72E", "jUSO3AJl"]}, {"partyID": "O5rsZNsr", "userIDs": ["Jr0TXuPD", "JFGNOuGs", "BmN7waVo"]}]}], "ticketIDs": ["FyTpRtMM", "panCX5PJ", "6v6m1SEV"], "tieTeamsSessionLifetime": false, "type": "80PRU7Dk", "version": 4}' \
    > test.out 2>&1
eval_tap $? 40 'PatchUpdateGameSession' test.out

#- 41 UpdateGameSessionBackfillTicketID
./ng net.accelbyte.sdk.cli.Main session updateGameSessionBackfillTicketID \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'ws7lEKaF' \
    --body '{"backfillTicketID": "7qhFwn3r"}' \
    > test.out 2>&1
eval_tap $? 41 'UpdateGameSessionBackfillTicketID' test.out

#- 42 GameSessionGenerateCode
./ng net.accelbyte.sdk.cli.Main session gameSessionGenerateCode \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'yUAA4EWn' \
    > test.out 2>&1
eval_tap $? 42 'GameSessionGenerateCode' test.out

#- 43 PublicRevokeGameSessionCode
./ng net.accelbyte.sdk.cli.Main session publicRevokeGameSessionCode \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'KCN6x9aE' \
    > test.out 2>&1
eval_tap $? 43 'PublicRevokeGameSessionCode' test.out

#- 44 PublicGameSessionInvite
./ng net.accelbyte.sdk.cli.Main session publicGameSessionInvite \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'fyuYIm74' \
    --body '{"platformID": "trDCrSEg", "userID": "CIc96B4Z"}' \
    > test.out 2>&1
eval_tap $? 44 'PublicGameSessionInvite' test.out

#- 45 JoinGameSession
./ng net.accelbyte.sdk.cli.Main session joinGameSession \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'TfG5fdB5' \
    > test.out 2>&1
eval_tap $? 45 'JoinGameSession' test.out

#- 46 PublicPromoteGameSessionLeader
./ng net.accelbyte.sdk.cli.Main session publicPromoteGameSessionLeader \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'ieI29uCy' \
    --body '{"leaderID": "eTw4oC5i"}' \
    > test.out 2>&1
eval_tap $? 46 'PublicPromoteGameSessionLeader' test.out

#- 47 LeaveGameSession
./ng net.accelbyte.sdk.cli.Main session leaveGameSession \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'C13Owxm1' \
    > test.out 2>&1
eval_tap $? 47 'LeaveGameSession' test.out

#- 48 PublicGameSessionReject
./ng net.accelbyte.sdk.cli.Main session publicGameSessionReject \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'oX3oHfud' \
    > test.out 2>&1
eval_tap $? 48 'PublicGameSessionReject' test.out

#- 49 AppendTeamGameSession
./ng net.accelbyte.sdk.cli.Main session appendTeamGameSession \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'kO2PBgjF' \
    --body '{"additionalMembers": [{"partyID": "V1EnTHuN", "userIDs": ["J2Y4r7Ua", "g4i1wKWi", "RNDF5qmo"]}, {"partyID": "yJXwPOKC", "userIDs": ["gEDatXUw", "vf8LWK6Z", "cVTVVjlh"]}, {"partyID": "nMWSkGkS", "userIDs": ["C8PLu9BM", "E2lBDq2s", "sLHu5iIX"]}], "proposedTeams": [{"UserIDs": ["AVEephOw", "v374kKLY", "MrSXE4D7"], "parties": [{"partyID": "7yYcW9xm", "userIDs": ["K4JooxO6", "OrYuQ12j", "gqjmhWL6"]}, {"partyID": "o9ZT1ceT", "userIDs": ["L6ju5Yol", "HKDWQqwT", "duL9sgoM"]}, {"partyID": "qKCcNGdN", "userIDs": ["w9ZAP0wI", "cYGx3Vl5", "e8eG0BKY"]}]}, {"UserIDs": ["AvDLRji0", "aFDc13FV", "7PthBzXy"], "parties": [{"partyID": "6ZRHaAhH", "userIDs": ["5H3euM9r", "qVJIw6D6", "Op26qZkw"]}, {"partyID": "xObRp5u8", "userIDs": ["HNlG3HPj", "tPnPOhOV", "CzHGrCFI"]}, {"partyID": "xnIIfXg4", "userIDs": ["5EYMjFeS", "1PzQKFD8", "7H0YGhOS"]}]}, {"UserIDs": ["Vfr91lt1", "y4QxYjib", "KhtW598o"], "parties": [{"partyID": "HBqHRYhS", "userIDs": ["LY3sbQbG", "9J3hfCOC", "NMPStBFy"]}, {"partyID": "ZTDaw8ai", "userIDs": ["FmPXVSDw", "dppQyhrL", "gkLbDCvY"]}, {"partyID": "yQhOc5ns", "userIDs": ["8odz4Vee", "fiF959U1", "oT1UIN3t"]}]}], "version": 14}' \
    > test.out 2>&1
eval_tap $? 49 'AppendTeamGameSession' test.out

#- 50 PublicPartyJoinCode
./ng net.accelbyte.sdk.cli.Main session publicPartyJoinCode \
    --namespace "$AB_NAMESPACE" \
    --body '{"code": "wAvFddhL"}' \
    > test.out 2>&1
eval_tap $? 50 'PublicPartyJoinCode' test.out

#- 51 PublicGetParty
./ng net.accelbyte.sdk.cli.Main session publicGetParty \
    --namespace "$AB_NAMESPACE" \
    --partyId '7GxrDUPn' \
    > test.out 2>&1
eval_tap $? 51 'PublicGetParty' test.out

#- 52 PublicUpdateParty
./ng net.accelbyte.sdk.cli.Main session publicUpdateParty \
    --namespace "$AB_NAMESPACE" \
    --partyId 'B0NXuWKL' \
    --body '{"attributes": {"ssW28C9Z": {}, "vE9my6N0": {}, "FCGJKu21": {}}, "inactiveTimeout": 3, "inviteTimeout": 5, "joinability": "srx6J5Zy", "maxPlayers": 100, "minPlayers": 3, "type": "u31b67EN", "version": 37}' \
    > test.out 2>&1
eval_tap $? 52 'PublicUpdateParty' test.out

#- 53 PublicPatchUpdateParty
./ng net.accelbyte.sdk.cli.Main session publicPatchUpdateParty \
    --namespace "$AB_NAMESPACE" \
    --partyId 'W5ntOSwR' \
    --body '{"attributes": {"PKoDdksL": {}, "Zw2rJv8m": {}, "Bd3LBNER": {}}, "inactiveTimeout": 24, "inviteTimeout": 77, "joinability": "m7s1m5Yv", "maxPlayers": 44, "minPlayers": 67, "type": "RpBOUf46", "version": 68}' \
    > test.out 2>&1
eval_tap $? 53 'PublicPatchUpdateParty' test.out

#- 54 PublicGeneratePartyCode
./ng net.accelbyte.sdk.cli.Main session publicGeneratePartyCode \
    --namespace "$AB_NAMESPACE" \
    --partyId 'ZxAS2F2o' \
    > test.out 2>&1
eval_tap $? 54 'PublicGeneratePartyCode' test.out

#- 55 PublicRevokePartyCode
./ng net.accelbyte.sdk.cli.Main session publicRevokePartyCode \
    --namespace "$AB_NAMESPACE" \
    --partyId 'UV880Xhs' \
    > test.out 2>&1
eval_tap $? 55 'PublicRevokePartyCode' test.out

#- 56 PublicPartyInvite
./ng net.accelbyte.sdk.cli.Main session publicPartyInvite \
    --namespace "$AB_NAMESPACE" \
    --partyId 'D6kQO7pm' \
    --body '{"platformID": "br1akNV4", "userID": "jdK8g3wl"}' \
    > test.out 2>&1
eval_tap $? 56 'PublicPartyInvite' test.out

#- 57 PublicPromotePartyLeader
./ng net.accelbyte.sdk.cli.Main session publicPromotePartyLeader \
    --namespace "$AB_NAMESPACE" \
    --partyId 'yYLVN99l' \
    --body '{"leaderID": "WQP5DrK7"}' \
    > test.out 2>&1
eval_tap $? 57 'PublicPromotePartyLeader' test.out

#- 58 PublicPartyJoin
./ng net.accelbyte.sdk.cli.Main session publicPartyJoin \
    --namespace "$AB_NAMESPACE" \
    --partyId 'bSwqQ2ip' \
    > test.out 2>&1
eval_tap $? 58 'PublicPartyJoin' test.out

#- 59 PublicPartyLeave
./ng net.accelbyte.sdk.cli.Main session publicPartyLeave \
    --namespace "$AB_NAMESPACE" \
    --partyId 'WzjxZ9qq' \
    > test.out 2>&1
eval_tap $? 59 'PublicPartyLeave' test.out

#- 60 PublicPartyReject
./ng net.accelbyte.sdk.cli.Main session publicPartyReject \
    --namespace "$AB_NAMESPACE" \
    --partyId 'zLx5Uqr1' \
    > test.out 2>&1
eval_tap $? 60 'PublicPartyReject' test.out

#- 61 PublicPartyKick
./ng net.accelbyte.sdk.cli.Main session publicPartyKick \
    --namespace "$AB_NAMESPACE" \
    --partyId '3aAGz3ue' \
    --userId 'CYqZt8yT' \
    > test.out 2>&1
eval_tap $? 61 'PublicPartyKick' test.out

#- 62 PublicCreateParty
./ng net.accelbyte.sdk.cli.Main session publicCreateParty \
    --namespace "$AB_NAMESPACE" \
    --body '{"attributes": {"vUAO2WMD": {}, "2MKfH2Mx": {}, "qho4DTao": {}}, "configurationName": "YY1EnOPz", "inactiveTimeout": 70, "inviteTimeout": 13, "joinability": "tY0yzhhB", "maxPlayers": 12, "members": [{"ID": "4Ld5juaR", "PlatformID": "rrSlrnFS", "PlatformUserID": "8uPCHmkC"}, {"ID": "0SMLU7w6", "PlatformID": "GU9nNG6I", "PlatformUserID": "Q54lnucV"}, {"ID": "BEVJaAhR", "PlatformID": "AniyREp1", "PlatformUserID": "Q3bSu3gy"}], "minPlayers": 36, "textChat": true, "type": "RwIF0Kd2"}' \
    > test.out 2>&1
eval_tap $? 62 'PublicCreateParty' test.out

#- 63 PublicUpdateInsertSessionStorageLeader
./ng net.accelbyte.sdk.cli.Main session publicUpdateInsertSessionStorageLeader \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'Qas0uj0K' \
    --body '{"hvBGEfey": {}, "F31Dq7TH": {}, "sTJWbNPH": {}}' \
    > test.out 2>&1
eval_tap $? 63 'PublicUpdateInsertSessionStorageLeader' test.out

#- 64 PublicUpdateInsertSessionStorage
./ng net.accelbyte.sdk.cli.Main session publicUpdateInsertSessionStorage \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'Pt6xVKKd' \
    --userId 'n8SlCIAK' \
    --body '{"v92ptjBi": {}, "jJ2AdBAa": {}, "rHYUrYUx": {}}' \
    > test.out 2>&1
eval_tap $? 64 'PublicUpdateInsertSessionStorage' test.out

#- 65 PublicGetBulkPlayerCurrentPlatform
./ng net.accelbyte.sdk.cli.Main session publicGetBulkPlayerCurrentPlatform \
    --namespace "$AB_NAMESPACE" \
    --body '{"userIDs": ["c5ljiSZr", "KyI4iQ2d", "ObFW8ysz"]}' \
    > test.out 2>&1
eval_tap $? 65 'PublicGetBulkPlayerCurrentPlatform' test.out

#- 66 PublicGetPlayerAttributes
./ng net.accelbyte.sdk.cli.Main session publicGetPlayerAttributes \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 66 'PublicGetPlayerAttributes' test.out

#- 67 PublicStorePlayerAttributes
./ng net.accelbyte.sdk.cli.Main session publicStorePlayerAttributes \
    --namespace "$AB_NAMESPACE" \
    --body '{"crossplayEnabled": true, "currentPlatform": "gYwSuZwb", "data": {"75qLTIOd": {}, "QsRmq7Gp": {}, "PwQV5s1f": {}}, "platforms": [{"name": "71T4ufKc", "userID": "0HUhrFki"}, {"name": "5tywPf5M", "userID": "r2YILb9w"}, {"name": "NFZ7xOIJ", "userID": "WdwRtuQX"}], "roles": ["aggxmtR9", "pzcqaPEE", "Df81jO9b"]}' \
    > test.out 2>&1
eval_tap $? 67 'PublicStorePlayerAttributes' test.out

#- 68 PublicDeletePlayerAttributes
./ng net.accelbyte.sdk.cli.Main session publicDeletePlayerAttributes \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 68 'PublicDeletePlayerAttributes' test.out

#- 69 PublicQueryMyGameSessions
./ng net.accelbyte.sdk.cli.Main session publicQueryMyGameSessions \
    --namespace "$AB_NAMESPACE" \
    --order 'ltGmN8Hv' \
    --orderBy 'aodeackb' \
    --status 'Hy01f1e8' \
    > test.out 2>&1
eval_tap $? 69 'PublicQueryMyGameSessions' test.out

#- 70 PublicQueryMyParties
./ng net.accelbyte.sdk.cli.Main session publicQueryMyParties \
    --namespace "$AB_NAMESPACE" \
    --order '5YyzBx50' \
    --orderBy 'hWVOnbTS' \
    --status 'Q9ve8Xv0' \
    > test.out 2>&1
eval_tap $? 70 'PublicQueryMyParties' test.out


rm -f "tmp.dat"

exit $EXIT_CODE