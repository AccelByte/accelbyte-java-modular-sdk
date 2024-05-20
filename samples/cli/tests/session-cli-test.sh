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
echo "1..82"

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

#- 4 AdminGetLogConfig
./ng net.accelbyte.sdk.cli.Main session adminGetLogConfig \
    > test.out 2>&1
eval_tap $? 4 'AdminGetLogConfig' test.out

#- 5 AdminPatchUpdateLogConfig
./ng net.accelbyte.sdk.cli.Main session adminPatchUpdateLogConfig \
    --body '{"logLevel": "info"}' \
    > test.out 2>&1
eval_tap $? 5 'AdminPatchUpdateLogConfig' test.out

#- 6 AdminGetDSMCConfigurationDefault
./ng net.accelbyte.sdk.cli.Main session adminGetDSMCConfigurationDefault \
    > test.out 2>&1
eval_tap $? 6 'AdminGetDSMCConfigurationDefault' test.out

#- 7 AdminListEnvironmentVariables
./ng net.accelbyte.sdk.cli.Main session adminListEnvironmentVariables \
    > test.out 2>&1
eval_tap $? 7 'AdminListEnvironmentVariables' test.out

#- 8 AdminListGlobalConfiguration
./ng net.accelbyte.sdk.cli.Main session adminListGlobalConfiguration \
    > test.out 2>&1
eval_tap $? 8 'AdminListGlobalConfiguration' test.out

#- 9 AdminUpdateGlobalConfiguration
./ng net.accelbyte.sdk.cli.Main session adminUpdateGlobalConfiguration \
    --body '{"regionRetryMapping": {"7KvLCCI4": ["qzRjhb0H", "mAvycZTj", "76McBX93"], "Fn7nJwaM": ["0oFRcjdm", "bRWLGvmy", "2zVr9xfC"], "soUIZB3F": ["RcE9brRF", "KZFNmXTE", "4ayKi1p8"]}, "regionURLMapping": ["sadCMUS1", "TQ7rEaWt", "hVLxyYW5"], "testGameMode": "REKNvVZ3", "testRegionURLMapping": ["VzHSc4Kx", "zwTogkmU", "9mlezfdn"], "testTargetUserIDs": ["AAeQCduu", "X4L2PJ82", "ECWrYaoF"]}' \
    > test.out 2>&1
eval_tap $? 9 'AdminUpdateGlobalConfiguration' test.out

#- 10 AdminDeleteGlobalConfiguration
./ng net.accelbyte.sdk.cli.Main session adminDeleteGlobalConfiguration \
    > test.out 2>&1
eval_tap $? 10 'AdminDeleteGlobalConfiguration' test.out

#- 11 AdminGetConfigurationAlertV1
./ng net.accelbyte.sdk.cli.Main session adminGetConfigurationAlertV1 \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 11 'AdminGetConfigurationAlertV1' test.out

#- 12 AdminUpdateConfigurationAlertV1
./ng net.accelbyte.sdk.cli.Main session adminUpdateConfigurationAlertV1 \
    --namespace "$AB_NAMESPACE" \
    --body '{"durationDays": 35}' \
    > test.out 2>&1
eval_tap $? 12 'AdminUpdateConfigurationAlertV1' test.out

#- 13 AdminCreateConfigurationAlertV1
./ng net.accelbyte.sdk.cli.Main session adminCreateConfigurationAlertV1 \
    --namespace "$AB_NAMESPACE" \
    --body '{"durationDays": 96}' \
    > test.out 2>&1
eval_tap $? 13 'AdminCreateConfigurationAlertV1' test.out

#- 14 AdminDeleteConfigurationAlertV1
./ng net.accelbyte.sdk.cli.Main session adminDeleteConfigurationAlertV1 \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 14 'AdminDeleteConfigurationAlertV1' test.out

#- 15 HandleUploadXboxPFXCertificate
./ng net.accelbyte.sdk.cli.Main session handleUploadXboxPFXCertificate \
    --namespace "$AB_NAMESPACE" \
    --description '2klkEbqm' \
    --certname 'pNW4lF2f' \
    --file 'tmp.dat' \
    --password 'dRVMr1sf' \
    > test.out 2>&1
eval_tap $? 15 'HandleUploadXboxPFXCertificate' test.out

#- 16 AdminCreateConfigurationTemplateV1
./ng net.accelbyte.sdk.cli.Main session adminCreateConfigurationTemplateV1 \
    --namespace "$AB_NAMESPACE" \
    --body '{"NativeSessionSetting": {"PSNServiceLabel": 7, "PSNSupportedPlatforms": ["W4KsCrNh", "gB3I7We4", "pg3XVK9J"], "SessionTitle": "2pSrE9F4", "ShouldSync": true, "XboxAllowCrossPlatform": false, "XboxSandboxID": "W2QHbYgF", "XboxServiceConfigID": "n1igXRFr", "XboxSessionTemplateName": "aYwLb0z4", "XboxTitleID": "dwxDMzkN", "localizedSessionName": {"JTl0EuVy": {}, "mNIcpJso": {}, "E1n0Ukbs": {}}}, "PSNBaseUrl": "gEkR6Zcp", "attributes": {"eKVJsu5B": {}, "DmuCHJZQ": {}, "eenlU9fN": {}}, "autoJoin": true, "autoLeaveSession": true, "clientVersion": "6mqx61lL", "deployment": "99Je157y", "disableCodeGeneration": true, "dsManualSetReady": false, "dsSource": "GgU5ESjP", "enableSecret": false, "fallbackClaimKeys": ["3iCXRQnI", "4kORMMLn", "UW2A8zr6"], "immutableStorage": false, "inactiveTimeout": 61, "inviteTimeout": 22, "joinability": "Mil5MHaw", "leaderElectionGracePeriod": 73, "manualRejoin": true, "maxActiveSessions": 12, "maxPlayers": 89, "minPlayers": 79, "name": "9vmRL3U0", "persistent": true, "preferredClaimKeys": ["Sx6ZjMS4", "VogF71gm", "LAGkY6l1"], "requestedRegions": ["TNheyTsZ", "OTH6MFkO", "LLR4jY54"], "textChat": false, "tieTeamsSessionLifetime": true, "type": "8x7yUMQs"}' \
    > test.out 2>&1
eval_tap $? 16 'AdminCreateConfigurationTemplateV1' test.out

#- 17 AdminGetAllConfigurationTemplatesV1
./ng net.accelbyte.sdk.cli.Main session adminGetAllConfigurationTemplatesV1 \
    --namespace "$AB_NAMESPACE" \
    --limit '40' \
    --name 'ctqLvreS' \
    --offset '93' \
    --order 'OzUpXotx' \
    --orderBy 'Xe3KtCkH' \
    > test.out 2>&1
eval_tap $? 17 'AdminGetAllConfigurationTemplatesV1' test.out

#- 18 AdminGetConfigurationTemplateV1
./ng net.accelbyte.sdk.cli.Main session adminGetConfigurationTemplateV1 \
    --name 'bxaNdJk9' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 18 'AdminGetConfigurationTemplateV1' test.out

#- 19 AdminUpdateConfigurationTemplateV1
./ng net.accelbyte.sdk.cli.Main session adminUpdateConfigurationTemplateV1 \
    --name 'GaxvWjC0' \
    --namespace "$AB_NAMESPACE" \
    --body '{"NativeSessionSetting": {"PSNServiceLabel": 79, "PSNSupportedPlatforms": ["gX2oROu4", "dIwBhvi5", "P0Auv8E9"], "SessionTitle": "YlL2aWb0", "ShouldSync": false, "XboxAllowCrossPlatform": false, "XboxSandboxID": "TUCmX9x1", "XboxServiceConfigID": "i7xnmeoI", "XboxSessionTemplateName": "rlp3fk5a", "XboxTitleID": "2qliEMQ7", "localizedSessionName": {"Yn9JB17A": {}, "UNmddNQq": {}, "tIWssSZ4": {}}}, "PSNBaseUrl": "XwNhH1dG", "attributes": {"xEAmjUNT": {}, "A5DpZra9": {}, "Rlmd2nBg": {}}, "autoJoin": false, "autoLeaveSession": true, "clientVersion": "GAPfDV5a", "deployment": "JiU3Rzwm", "disableCodeGeneration": false, "dsManualSetReady": true, "dsSource": "wxlMJzzw", "enableSecret": true, "fallbackClaimKeys": ["vfrETcQN", "nge7M86T", "Ki58YUcJ"], "immutableStorage": false, "inactiveTimeout": 100, "inviteTimeout": 54, "joinability": "oeLh0HOv", "leaderElectionGracePeriod": 66, "manualRejoin": true, "maxActiveSessions": 84, "maxPlayers": 47, "minPlayers": 90, "name": "sFPAhvc0", "persistent": true, "preferredClaimKeys": ["J2rPH6pY", "5guGs6p3", "QG4i6QVR"], "requestedRegions": ["jAw66LWE", "iNrarWxY", "RN1W6YXC"], "textChat": false, "tieTeamsSessionLifetime": false, "type": "oA2Ha8nd"}' \
    > test.out 2>&1
eval_tap $? 19 'AdminUpdateConfigurationTemplateV1' test.out

#- 20 AdminDeleteConfigurationTemplateV1
./ng net.accelbyte.sdk.cli.Main session adminDeleteConfigurationTemplateV1 \
    --name 'thsBWa0G' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 20 'AdminDeleteConfigurationTemplateV1' test.out

#- 21 AdminGetMemberActiveSession
./ng net.accelbyte.sdk.cli.Main session adminGetMemberActiveSession \
    --name 'TkwGQOAq' \
    --namespace "$AB_NAMESPACE" \
    --userId 'gvVm0IPa' \
    > test.out 2>&1
eval_tap $? 21 'AdminGetMemberActiveSession' test.out

#- 22 AdminReconcileMaxActiveSession
./ng net.accelbyte.sdk.cli.Main session adminReconcileMaxActiveSession \
    --name '2nO1MXtP' \
    --namespace "$AB_NAMESPACE" \
    --body '{"userID": "VhH6mXyZ"}' \
    > test.out 2>&1
eval_tap $? 22 'AdminReconcileMaxActiveSession' test.out

#- 23 AdminGetDSMCConfiguration
./ng net.accelbyte.sdk.cli.Main session adminGetDSMCConfiguration \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 23 'AdminGetDSMCConfiguration' test.out

#- 24 AdminSyncDSMCConfiguration
./ng net.accelbyte.sdk.cli.Main session adminSyncDSMCConfiguration \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 24 'AdminSyncDSMCConfiguration' test.out

#- 25 AdminQueryGameSessions
./ng net.accelbyte.sdk.cli.Main session adminQueryGameSessions \
    --namespace "$AB_NAMESPACE" \
    --configurationName 'AgVvJA9t' \
    --dsPodName 'NkkG2Zqx' \
    --fromTime '2oATXYVy' \
    --gameMode 'JJ8HpqUb' \
    --isPersistent 'xvVLRA0c' \
    --isSoftDeleted 'uq8C7FIv' \
    --joinability 'Hdxmhz0H' \
    --limit '94' \
    --matchPool 'fML1Npjj' \
    --memberID 'qCNa2sxd' \
    --offset '77' \
    --order '2VdMa4cI' \
    --orderBy 'hHGFsbbt' \
    --sessionID 'WfOAs00Z' \
    --status 'BrYh0qkI' \
    --statusV2 'KQlCj6EX' \
    --toTime 'Gmrte8yp' \
    > test.out 2>&1
eval_tap $? 25 'AdminQueryGameSessions' test.out

#- 26 AdminQueryGameSessionsByAttributes
./ng net.accelbyte.sdk.cli.Main session adminQueryGameSessionsByAttributes \
    --namespace "$AB_NAMESPACE" \
    --body '{"WOWZA2uh": {}, "8Oo1JmyN": {}, "g1JkUX8L": {}}' \
    > test.out 2>&1
eval_tap $? 26 'AdminQueryGameSessionsByAttributes' test.out

#- 27 AdminDeleteBulkGameSessions
./ng net.accelbyte.sdk.cli.Main session adminDeleteBulkGameSessions \
    --namespace "$AB_NAMESPACE" \
    --body '{"ids": ["ke6hW48C", "9D9blRmA", "7JRYAzYZ"]}' \
    > test.out 2>&1
eval_tap $? 27 'AdminDeleteBulkGameSessions' test.out

#- 28 AdminSetDSReady
./ng net.accelbyte.sdk.cli.Main session adminSetDSReady \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'FeodZGjW' \
    --body '{"ready": true}' \
    > test.out 2>&1
eval_tap $? 28 'AdminSetDSReady' test.out

#- 29 AdminUpdateGameSessionMember
./ng net.accelbyte.sdk.cli.Main session adminUpdateGameSessionMember \
    --memberId 'GzrHuqMc' \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'LrFc4QTS' \
    --statusType 'KAYrIy1t' \
    > test.out 2>&1
eval_tap $? 29 'AdminUpdateGameSessionMember' test.out

#- 30 AdminGetListNativeSession
./ng net.accelbyte.sdk.cli.Main session adminGetListNativeSession \
    --namespace "$AB_NAMESPACE" \
    --limit '55' \
    --offset '77' \
    --order 'UGHxuL3E' \
    > test.out 2>&1
eval_tap $? 30 'AdminGetListNativeSession' test.out

#- 31 AdminQueryParties
./ng net.accelbyte.sdk.cli.Main session adminQueryParties \
    --namespace "$AB_NAMESPACE" \
    --isSoftDeleted 'XrQi6TSe' \
    --joinability 'WHKh7fWt' \
    --key 'JM1BJRHH' \
    --leaderID '3i1xtlBm' \
    --limit '4' \
    --memberID 'mKZNkWEc' \
    --memberStatus 'WjHcSCuA' \
    --offset '2' \
    --order 'ib1Kmabt' \
    --orderBy 'RYE2Fxbg' \
    --partyID 'O4xPHGxX' \
    --value 'LmYMqAtu' \
    > test.out 2>&1
eval_tap $? 31 'AdminQueryParties' test.out

#- 32 AdminGetPlatformCredentials
./ng net.accelbyte.sdk.cli.Main session adminGetPlatformCredentials \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 32 'AdminGetPlatformCredentials' test.out

#- 33 AdminUpdatePlatformCredentials
./ng net.accelbyte.sdk.cli.Main session adminUpdatePlatformCredentials \
    --namespace "$AB_NAMESPACE" \
    --body '{"psn": {"clientId": "TYRj2uRv", "clientSecret": "3hMwkh48", "scope": "lIx3gc3C"}}' \
    > test.out 2>&1
eval_tap $? 33 'AdminUpdatePlatformCredentials' test.out

#- 34 AdminDeletePlatformCredentials
./ng net.accelbyte.sdk.cli.Main session adminDeletePlatformCredentials \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 34 'AdminDeletePlatformCredentials' test.out

#- 35 AdminGetRecentPlayer
./ng net.accelbyte.sdk.cli.Main session adminGetRecentPlayer \
    --namespace "$AB_NAMESPACE" \
    --limit '8' \
    --userId 'PT5wBWYu' \
    > test.out 2>&1
eval_tap $? 35 'AdminGetRecentPlayer' test.out

#- 36 AdminGetRecentTeamPlayer
./ng net.accelbyte.sdk.cli.Main session adminGetRecentTeamPlayer \
    --namespace "$AB_NAMESPACE" \
    --limit '97' \
    --userId 'l3BX6NKm' \
    > test.out 2>&1
eval_tap $? 36 'AdminGetRecentTeamPlayer' test.out

#- 37 AdminReadSessionStorage
./ng net.accelbyte.sdk.cli.Main session adminReadSessionStorage \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'eMRE8uii' \
    > test.out 2>&1
eval_tap $? 37 'AdminReadSessionStorage' test.out

#- 38 AdminDeleteUserSessionStorage
./ng net.accelbyte.sdk.cli.Main session adminDeleteUserSessionStorage \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'OvLbAMhj' \
    > test.out 2>&1
eval_tap $? 38 'AdminDeleteUserSessionStorage' test.out

#- 39 AdminReadUserSessionStorage
./ng net.accelbyte.sdk.cli.Main session adminReadUserSessionStorage \
    --namespace "$AB_NAMESPACE" \
    --sessionId '3z7z90eh' \
    --userId 'FRlDuAOr' \
    > test.out 2>&1
eval_tap $? 39 'AdminReadUserSessionStorage' test.out

#- 40 AdminQueryPlayerAttributes
./ng net.accelbyte.sdk.cli.Main session adminQueryPlayerAttributes \
    --namespace "$AB_NAMESPACE" \
    --users 'Ac54kPLV' \
    > test.out 2>&1
eval_tap $? 40 'AdminQueryPlayerAttributes' test.out

#- 41 AdminGetPlayerAttributes
./ng net.accelbyte.sdk.cli.Main session adminGetPlayerAttributes \
    --namespace "$AB_NAMESPACE" \
    --userId 'HcgMdX04' \
    > test.out 2>&1
eval_tap $? 41 'AdminGetPlayerAttributes' test.out

#- 42 CreateGameSession
./ng net.accelbyte.sdk.cli.Main session createGameSession \
    --namespace "$AB_NAMESPACE" \
    --body '{"attributes": {"nPjTlbfw": {}, "dTKH0NR5": {}, "8Lwb5TlA": {}}, "autoJoin": false, "backfillTicketID": "9zjScgB4", "clientVersion": "jf7g15Gd", "configurationName": "BWIj6yVe", "deployment": "VB6CIXx5", "dsSource": "1kTLjxOn", "fallbackClaimKeys": ["DZDURORN", "WhOWkx29", "H2JHGG3e"], "inactiveTimeout": 71, "inviteTimeout": 71, "joinability": "Uh6BWzPF", "matchPool": "CU7wOims", "maxPlayers": 94, "minPlayers": 74, "preferredClaimKeys": ["wxdTuLfr", "N577RFsD", "Gk2S0LVo"], "requestedRegions": ["ZVr3w72B", "Gux6sVvK", "vmw6zcpc"], "serverName": "mLXK5Jnl", "teams": [{"UserIDs": ["Zig8V758", "hCLnExhv", "14G7n2Uw"], "parties": [{"partyID": "tr3wsvbA", "userIDs": ["VHqRrNhT", "96Nh40yA", "bUGaXxl2"]}, {"partyID": "0jEvTcUx", "userIDs": ["F0kw7po4", "xefJKiuD", "U0GsPoWJ"]}, {"partyID": "g42XXt4J", "userIDs": ["hmpH77z5", "RXd7woJy", "0Yv6114i"]}]}, {"UserIDs": ["YW4HJ5lW", "ZAFH25iW", "F6SQJXjj"], "parties": [{"partyID": "CvQOnDLH", "userIDs": ["OKXt6XKB", "3I14KEp9", "QqluWLMm"]}, {"partyID": "AEFdJxR6", "userIDs": ["OcEQ1Sa2", "ZRuDL0py", "uldPqocj"]}, {"partyID": "Oe64aXCI", "userIDs": ["xYFxKBbD", "VKFJrj43", "ygZBTrw4"]}]}, {"UserIDs": ["YgPRq5eK", "HxAhU9mV", "vz7NXdB0"], "parties": [{"partyID": "BXMtYuBf", "userIDs": ["sTIAoX2S", "UTV4bw6S", "49HI6Um5"]}, {"partyID": "QGQwzSjb", "userIDs": ["fO45I8Me", "3uXEpk3W", "HfWGw69b"]}, {"partyID": "XszZ64OA", "userIDs": ["42RUBU7I", "hbdVFzwQ", "Hw0daAYO"]}]}], "textChat": false, "ticketIDs": ["cCdpqlSK", "0kZ3zBgP", "uewTzPtJ"], "tieTeamsSessionLifetime": false, "type": "ACPt7ask"}' \
    > test.out 2>&1
eval_tap $? 42 'CreateGameSession' test.out

#- 43 PublicQueryGameSessionsByAttributes
./ng net.accelbyte.sdk.cli.Main session publicQueryGameSessionsByAttributes \
    --namespace "$AB_NAMESPACE" \
    --body '{"cHVi6wOt": {}, "tcJEH6Q4": {}, "7P09fF4z": {}}' \
    > test.out 2>&1
eval_tap $? 43 'PublicQueryGameSessionsByAttributes' test.out

#- 44 PublicSessionJoinCode
./ng net.accelbyte.sdk.cli.Main session publicSessionJoinCode \
    --namespace "$AB_NAMESPACE" \
    --body '{"code": "8hrqA8lV"}' \
    > test.out 2>&1
eval_tap $? 44 'PublicSessionJoinCode' test.out

#- 45 GetGameSessionByPodName
./ng net.accelbyte.sdk.cli.Main session getGameSessionByPodName \
    --namespace "$AB_NAMESPACE" \
    --podName 'nR0OHWNK' \
    > test.out 2>&1
eval_tap $? 45 'GetGameSessionByPodName' test.out

#- 46 GetGameSession
./ng net.accelbyte.sdk.cli.Main session getGameSession \
    --namespace "$AB_NAMESPACE" \
    --sessionId '51TExJ5x' \
    > test.out 2>&1
eval_tap $? 46 'GetGameSession' test.out

#- 47 UpdateGameSession
./ng net.accelbyte.sdk.cli.Main session updateGameSession \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'qCaykuEX' \
    --body '{"attributes": {"kCQWGDK8": {}, "dUIaHP6D": {}, "hGP4BwWb": {}}, "backfillTicketID": "vOTO8NSs", "clientVersion": "fbNqoUiK", "deployment": "e5Ygu3Ad", "fallbackClaimKeys": ["bhZyDN70", "3NicD8Kf", "c9JSDvbc"], "inactiveTimeout": 98, "inviteTimeout": 54, "joinability": "LGore2AL", "matchPool": "zIzVohmG", "maxPlayers": 72, "minPlayers": 79, "preferredClaimKeys": ["OkulWcxB", "IN8T4NyI", "SJ2QQl3P"], "requestedRegions": ["GWdcwooV", "hmwRj4nP", "1zwr7MHr"], "teams": [{"UserIDs": ["k45kP3WF", "h9MUgQhy", "mf9Vxn3c"], "parties": [{"partyID": "YlzJPuGm", "userIDs": ["3zYNhLp2", "s0hsUzcd", "Qe21leea"]}, {"partyID": "RGJByIVb", "userIDs": ["Tca9n9Fj", "EVucV7VR", "Fvye0nS2"]}, {"partyID": "GvpT9Ifb", "userIDs": ["CJ8DIGw4", "dvE3lE8q", "OVcoFtpR"]}]}, {"UserIDs": ["7G8agDAb", "P0DTKiGn", "O1Qbw564"], "parties": [{"partyID": "yAigPb0U", "userIDs": ["GRdxGJ7S", "ALDaR1fw", "ujwJpgJw"]}, {"partyID": "VrxUGmJ5", "userIDs": ["Ww6DqXGa", "ozW97NeY", "hQ4MeNlR"]}, {"partyID": "9nToIY4X", "userIDs": ["KPuPe139", "eNr5Gmby", "M2OVKUfG"]}]}, {"UserIDs": ["MNC1IKBa", "pNFvL6yr", "LH7T7mAM"], "parties": [{"partyID": "3vQBX1St", "userIDs": ["kdnkstCB", "uXEGgz3w", "R6cRxxVH"]}, {"partyID": "5B8myQ7n", "userIDs": ["cJc3oawo", "9zYzJczW", "LpF0pxLT"]}, {"partyID": "cFHj8NXp", "userIDs": ["AOg8aylH", "Jo993Kw7", "d8d40EHH"]}]}], "ticketIDs": ["RQdeTOsV", "oog7YjJ6", "gdewXGhF"], "tieTeamsSessionLifetime": false, "type": "L7HQhIDP", "version": 21}' \
    > test.out 2>&1
eval_tap $? 47 'UpdateGameSession' test.out

#- 48 DeleteGameSession
./ng net.accelbyte.sdk.cli.Main session deleteGameSession \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'iSsQkahc' \
    > test.out 2>&1
eval_tap $? 48 'DeleteGameSession' test.out

#- 49 PatchUpdateGameSession
./ng net.accelbyte.sdk.cli.Main session patchUpdateGameSession \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'eu1jcmgP' \
    --body '{"attributes": {"1Hc6MJWf": {}, "zdy209F8": {}, "bI5fWxZG": {}}, "backfillTicketID": "3OT1pt8h", "clientVersion": "NrVWVxU0", "deployment": "Mu8ApxU7", "fallbackClaimKeys": ["AsdPxUYn", "JIqe0tZb", "mcKh2hvh"], "inactiveTimeout": 12, "inviteTimeout": 74, "joinability": "CeG4PIkL", "matchPool": "ta33yy3s", "maxPlayers": 72, "minPlayers": 17, "preferredClaimKeys": ["PSQO9lg9", "E26fa5m9", "jdqLBlZ2"], "requestedRegions": ["VQU00dLM", "NFWANmWn", "ivHTdSCD"], "teams": [{"UserIDs": ["dzIasdYQ", "HV5s3FEj", "af6B0PXl"], "parties": [{"partyID": "tti5QOKW", "userIDs": ["WTQUQ7R4", "7uG7hbW3", "B1dyAlO6"]}, {"partyID": "ZXJUOyl5", "userIDs": ["Mvcb6YLA", "rJ8mCMzQ", "4lYhnb5n"]}, {"partyID": "b8QiRyyS", "userIDs": ["iXAJM8ig", "u3Tgjo43", "VxRTPxfc"]}]}, {"UserIDs": ["GLTQi4JQ", "VjpW3iJq", "DQVJ33ED"], "parties": [{"partyID": "D4P5DTr3", "userIDs": ["KN8UxZDH", "an9e56ri", "gAoKm6W8"]}, {"partyID": "c1carZJd", "userIDs": ["4PDOgv5B", "REvPH5gX", "YBgbccPR"]}, {"partyID": "Cu8tCGpf", "userIDs": ["xwTDlEZw", "YwBVsHhS", "wNMmYEil"]}]}, {"UserIDs": ["6UtgzuPE", "WDRzBO4R", "mFN842X7"], "parties": [{"partyID": "96XqGgvM", "userIDs": ["DImJdIj5", "rO7U1oix", "uo4WGqYI"]}, {"partyID": "T9ENuEEL", "userIDs": ["KFdeAinG", "NujIVs5J", "QW7Tz2in"]}, {"partyID": "RJBUm0ao", "userIDs": ["E6hQIrTH", "6EZP1hnY", "EvuvZUoK"]}]}], "ticketIDs": ["UhyKxVEm", "Hwly3FDW", "956aL1gZ"], "tieTeamsSessionLifetime": false, "type": "EHKwk8Co", "version": 41}' \
    > test.out 2>&1
eval_tap $? 49 'PatchUpdateGameSession' test.out

#- 50 UpdateGameSessionBackfillTicketID
./ng net.accelbyte.sdk.cli.Main session updateGameSessionBackfillTicketID \
    --namespace "$AB_NAMESPACE" \
    --sessionId '0dfdnV6F' \
    --body '{"backfillTicketID": "O7wmeTSZ"}' \
    > test.out 2>&1
eval_tap $? 50 'UpdateGameSessionBackfillTicketID' test.out

#- 51 GameSessionGenerateCode
./ng net.accelbyte.sdk.cli.Main session gameSessionGenerateCode \
    --namespace "$AB_NAMESPACE" \
    --sessionId '0htt1ad4' \
    > test.out 2>&1
eval_tap $? 51 'GameSessionGenerateCode' test.out

#- 52 PublicRevokeGameSessionCode
./ng net.accelbyte.sdk.cli.Main session publicRevokeGameSessionCode \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'obLENcfp' \
    > test.out 2>&1
eval_tap $? 52 'PublicRevokeGameSessionCode' test.out

#- 53 PublicGameSessionInvite
./ng net.accelbyte.sdk.cli.Main session publicGameSessionInvite \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'EFAphLhT' \
    --body '{"platformID": "yx1OT6pC", "userID": "tYf86MQk"}' \
    > test.out 2>&1
eval_tap $? 53 'PublicGameSessionInvite' test.out

#- 54 JoinGameSession
./ng net.accelbyte.sdk.cli.Main session joinGameSession \
    --namespace "$AB_NAMESPACE" \
    --sessionId '7gXx1vCM' \
    > test.out 2>&1
eval_tap $? 54 'JoinGameSession' test.out

#- 55 PublicPromoteGameSessionLeader
./ng net.accelbyte.sdk.cli.Main session publicPromoteGameSessionLeader \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'Rl5EzlHd' \
    --body '{"leaderID": "DChqwrkN"}' \
    > test.out 2>&1
eval_tap $? 55 'PublicPromoteGameSessionLeader' test.out

#- 56 LeaveGameSession
./ng net.accelbyte.sdk.cli.Main session leaveGameSession \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'I0OQhA9D' \
    > test.out 2>&1
eval_tap $? 56 'LeaveGameSession' test.out

#- 57 PublicGameSessionReject
./ng net.accelbyte.sdk.cli.Main session publicGameSessionReject \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'b5TrNrLv' \
    > test.out 2>&1
eval_tap $? 57 'PublicGameSessionReject' test.out

#- 58 GetSessionServerSecret
./ng net.accelbyte.sdk.cli.Main session getSessionServerSecret \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'Jp6F1nkJ' \
    > test.out 2>&1
eval_tap $? 58 'GetSessionServerSecret' test.out

#- 59 AppendTeamGameSession
./ng net.accelbyte.sdk.cli.Main session appendTeamGameSession \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'WRSJD232' \
    --body '{"additionalMembers": [{"partyID": "9Rfn8BDh", "userIDs": ["Cv1cui6A", "jO3jdPQl", "9XWHtaYu"]}, {"partyID": "mAY8qGKY", "userIDs": ["1NcNFdQS", "PqFido2D", "Sxq5akzA"]}, {"partyID": "98mg89dO", "userIDs": ["ACDeKHH8", "aqvlxN63", "o4juKiI0"]}], "proposedTeams": [{"UserIDs": ["5cIgQcyy", "1JtFAsku", "Q6jhs2mR"], "parties": [{"partyID": "8vMYpzGf", "userIDs": ["IP4MjY5j", "FjRwoWLC", "62AZyApP"]}, {"partyID": "BQSiv3Gm", "userIDs": ["1nQuXPdo", "xZCqXtvX", "hSt9BzOo"]}, {"partyID": "CTJhJPn6", "userIDs": ["9jJPuVaw", "ZOr6rAXX", "QBDPYUcG"]}]}, {"UserIDs": ["tyE8Hj82", "CNuMYPys", "e66N9F3X"], "parties": [{"partyID": "luOwYGcx", "userIDs": ["871a28ac", "5fJgHd4d", "0l9ZhzLY"]}, {"partyID": "ZkaSUpbR", "userIDs": ["IfBTYBgE", "ONLRln98", "WshgqvWE"]}, {"partyID": "HPqT7vPA", "userIDs": ["N12iIb6r", "MEtqbsnM", "eZWQ2epc"]}]}, {"UserIDs": ["jT9YDpfx", "FMlAtsSA", "XwFqoPgN"], "parties": [{"partyID": "fa6BxSFM", "userIDs": ["Xu6AfMrY", "qxr7tg6M", "5hSk3oNU"]}, {"partyID": "4bv0RGad", "userIDs": ["ZY7MOiIz", "95f6BELr", "uV75mFQB"]}, {"partyID": "FMAtCR50", "userIDs": ["BLMJ0vEm", "T16xGVWx", "KgmsHLHF"]}]}], "version": 36}' \
    > test.out 2>&1
eval_tap $? 59 'AppendTeamGameSession' test.out

#- 60 PublicPartyJoinCode
./ng net.accelbyte.sdk.cli.Main session publicPartyJoinCode \
    --namespace "$AB_NAMESPACE" \
    --body '{"code": "qHQHfxti"}' \
    > test.out 2>&1
eval_tap $? 60 'PublicPartyJoinCode' test.out

#- 61 PublicGetParty
./ng net.accelbyte.sdk.cli.Main session publicGetParty \
    --namespace "$AB_NAMESPACE" \
    --partyId 'FvL0v7zL' \
    > test.out 2>&1
eval_tap $? 61 'PublicGetParty' test.out

#- 62 PublicUpdateParty
./ng net.accelbyte.sdk.cli.Main session publicUpdateParty \
    --namespace "$AB_NAMESPACE" \
    --partyId 'BWFVfYI7' \
    --body '{"attributes": {"31J2dJDA": {}, "UDXFjP5z": {}, "iY7AxHeD": {}}, "inactiveTimeout": 8, "inviteTimeout": 17, "joinability": "M2nQiNTb", "maxPlayers": 6, "minPlayers": 53, "type": "jF6fXE8v", "version": 20}' \
    > test.out 2>&1
eval_tap $? 62 'PublicUpdateParty' test.out

#- 63 PublicPatchUpdateParty
./ng net.accelbyte.sdk.cli.Main session publicPatchUpdateParty \
    --namespace "$AB_NAMESPACE" \
    --partyId 'M07yKixq' \
    --body '{"attributes": {"hc5tqGjT": {}, "XzjquojB": {}, "9gnmg0vD": {}}, "inactiveTimeout": 66, "inviteTimeout": 0, "joinability": "9hTf4PgA", "maxPlayers": 60, "minPlayers": 24, "type": "aalhtbX2", "version": 74}' \
    > test.out 2>&1
eval_tap $? 63 'PublicPatchUpdateParty' test.out

#- 64 PublicGeneratePartyCode
./ng net.accelbyte.sdk.cli.Main session publicGeneratePartyCode \
    --namespace "$AB_NAMESPACE" \
    --partyId 'Ilbllwh4' \
    > test.out 2>&1
eval_tap $? 64 'PublicGeneratePartyCode' test.out

#- 65 PublicRevokePartyCode
./ng net.accelbyte.sdk.cli.Main session publicRevokePartyCode \
    --namespace "$AB_NAMESPACE" \
    --partyId 'I5tBBmqQ' \
    > test.out 2>&1
eval_tap $? 65 'PublicRevokePartyCode' test.out

#- 66 PublicPartyInvite
./ng net.accelbyte.sdk.cli.Main session publicPartyInvite \
    --namespace "$AB_NAMESPACE" \
    --partyId 'QKwByjlW' \
    --body '{"platformID": "aiswxyQr", "userID": "tY4GVJzg"}' \
    > test.out 2>&1
eval_tap $? 66 'PublicPartyInvite' test.out

#- 67 PublicPromotePartyLeader
./ng net.accelbyte.sdk.cli.Main session publicPromotePartyLeader \
    --namespace "$AB_NAMESPACE" \
    --partyId 'lmH2h7fF' \
    --body '{"leaderID": "SWQn8iJh"}' \
    > test.out 2>&1
eval_tap $? 67 'PublicPromotePartyLeader' test.out

#- 68 PublicPartyJoin
./ng net.accelbyte.sdk.cli.Main session publicPartyJoin \
    --namespace "$AB_NAMESPACE" \
    --partyId '6W45JKBr' \
    > test.out 2>&1
eval_tap $? 68 'PublicPartyJoin' test.out

#- 69 PublicPartyLeave
./ng net.accelbyte.sdk.cli.Main session publicPartyLeave \
    --namespace "$AB_NAMESPACE" \
    --partyId 'Tw0ZdXGW' \
    > test.out 2>&1
eval_tap $? 69 'PublicPartyLeave' test.out

#- 70 PublicPartyReject
./ng net.accelbyte.sdk.cli.Main session publicPartyReject \
    --namespace "$AB_NAMESPACE" \
    --partyId 'KLnWvvG6' \
    > test.out 2>&1
eval_tap $? 70 'PublicPartyReject' test.out

#- 71 PublicPartyKick
./ng net.accelbyte.sdk.cli.Main session publicPartyKick \
    --namespace "$AB_NAMESPACE" \
    --partyId 'uEPIxaJx' \
    --userId 'tzYBqib8' \
    > test.out 2>&1
eval_tap $? 71 'PublicPartyKick' test.out

#- 72 PublicCreateParty
./ng net.accelbyte.sdk.cli.Main session publicCreateParty \
    --namespace "$AB_NAMESPACE" \
    --body '{"attributes": {"zdlfPoml": {}, "iGBjggWS": {}, "zTEVqSPI": {}}, "configurationName": "3yWzOOQ1", "inactiveTimeout": 81, "inviteTimeout": 87, "joinability": "zLUszVRM", "maxPlayers": 100, "members": [{"ID": "a6Dsy9Zf", "PlatformID": "3iLK5WDT", "PlatformUserID": "GIlhoPw2"}, {"ID": "I9WBm4Qm", "PlatformID": "54LQPcEd", "PlatformUserID": "mgr34esV"}, {"ID": "Rs8sXCR0", "PlatformID": "blrUPpti", "PlatformUserID": "ykToJ5CQ"}], "minPlayers": 75, "textChat": false, "type": "H9yHsK9w"}' \
    > test.out 2>&1
eval_tap $? 72 'PublicCreateParty' test.out

#- 73 PublicGetRecentPlayer
./ng net.accelbyte.sdk.cli.Main session publicGetRecentPlayer \
    --namespace "$AB_NAMESPACE" \
    --limit '78' \
    > test.out 2>&1
eval_tap $? 73 'PublicGetRecentPlayer' test.out

#- 74 PublicGetRecentTeamPlayer
./ng net.accelbyte.sdk.cli.Main session publicGetRecentTeamPlayer \
    --namespace "$AB_NAMESPACE" \
    --limit '100' \
    > test.out 2>&1
eval_tap $? 74 'PublicGetRecentTeamPlayer' test.out

#- 75 PublicUpdateInsertSessionStorageLeader
./ng net.accelbyte.sdk.cli.Main session publicUpdateInsertSessionStorageLeader \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'Fv7j4OKB' \
    --body '{"TkqxhmaQ": {}, "lbKRESVg": {}, "tprJ7trs": {}}' \
    > test.out 2>&1
eval_tap $? 75 'PublicUpdateInsertSessionStorageLeader' test.out

#- 76 PublicUpdateInsertSessionStorage
./ng net.accelbyte.sdk.cli.Main session publicUpdateInsertSessionStorage \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'wy9wzu3S' \
    --userId 'lDOTF5iC' \
    --body '{"gTjYi80B": {}, "EYQrTjkS": {}, "O6O5hdOu": {}}' \
    > test.out 2>&1
eval_tap $? 76 'PublicUpdateInsertSessionStorage' test.out

#- 77 PublicGetBulkPlayerCurrentPlatform
./ng net.accelbyte.sdk.cli.Main session publicGetBulkPlayerCurrentPlatform \
    --namespace "$AB_NAMESPACE" \
    --body '{"userIDs": ["cs2xhYPI", "jkvlbxhB", "yzpqLixs"]}' \
    > test.out 2>&1
eval_tap $? 77 'PublicGetBulkPlayerCurrentPlatform' test.out

#- 78 PublicGetPlayerAttributes
./ng net.accelbyte.sdk.cli.Main session publicGetPlayerAttributes \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 78 'PublicGetPlayerAttributes' test.out

#- 79 PublicStorePlayerAttributes
./ng net.accelbyte.sdk.cli.Main session publicStorePlayerAttributes \
    --namespace "$AB_NAMESPACE" \
    --body '{"crossplayEnabled": true, "currentPlatform": "d9geEmdE", "data": {"9sumS6NU": {}, "atHpEXXm": {}, "28P0rYyw": {}}, "platforms": [{"name": "2mOVerhz", "userID": "lKb7YzN7"}, {"name": "1ZNi3wLt", "userID": "qkaA7vXM"}, {"name": "AkYth7Mq", "userID": "mZ5M33dr"}], "roles": ["qjBgxr25", "9YQ7hmrz", "csVONrD2"], "simultaneousPlatform": "LxDP9gbe"}' \
    > test.out 2>&1
eval_tap $? 79 'PublicStorePlayerAttributes' test.out

#- 80 PublicDeletePlayerAttributes
./ng net.accelbyte.sdk.cli.Main session publicDeletePlayerAttributes \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 80 'PublicDeletePlayerAttributes' test.out

#- 81 PublicQueryMyGameSessions
./ng net.accelbyte.sdk.cli.Main session publicQueryMyGameSessions \
    --namespace "$AB_NAMESPACE" \
    --order 'uj7RHdCH' \
    --orderBy 'yXKN9QoD' \
    --status 'ofwDdPuJ' \
    > test.out 2>&1
eval_tap $? 81 'PublicQueryMyGameSessions' test.out

#- 82 PublicQueryMyParties
./ng net.accelbyte.sdk.cli.Main session publicQueryMyParties \
    --namespace "$AB_NAMESPACE" \
    --order 'GpiLMoj1' \
    --orderBy '6FEaX2y5' \
    --status 'vxkI1hGb' \
    > test.out 2>&1
eval_tap $? 82 'PublicQueryMyParties' test.out


rm -f "tmp.dat"

exit $EXIT_CODE