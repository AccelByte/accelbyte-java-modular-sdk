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
echo "1..94"

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
    --body '{"logLevel": "panic"}' \
    > test.out 2>&1
eval_tap $? 5 'AdminPatchUpdateLogConfig' test.out

#- 6 AdminGetDSMCConfigurationDefault
eval_tap 0 6 'AdminGetDSMCConfigurationDefault # SKIP deprecated' test.out

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
    --body '{"metricExcludedNamespaces": ["oKGtvOK1", "8yOnX0A2", "nFQitx38"], "regionRetryMapping": {"pVEmANmJ": ["AIUDGrcD", "IwfJLLgm", "wJYETo4s"], "cXXactID": ["yM438LAS", "dM0AWNYY", "4OsTRFrL"], "NArDq8Vx": ["cK7rqb2V", "mODQsLy4", "cpozMrBB"]}, "regionURLMapping": ["bpon39vM", "eUAwTvkT", "jI16K2OO"], "testGameMode": "GHT7WZqg", "testRegionURLMapping": ["xPauaQaG", "1jEIjXGd", "hKXn7Ndn"], "testTargetUserIDs": ["hjhld6sh", "u3Bab6vv", "Baj8R8yr"]}' \
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
    --body '{"durationDays": 9}' \
    > test.out 2>&1
eval_tap $? 12 'AdminUpdateConfigurationAlertV1' test.out

#- 13 AdminCreateConfigurationAlertV1
./ng net.accelbyte.sdk.cli.Main session adminCreateConfigurationAlertV1 \
    --namespace "$AB_NAMESPACE" \
    --body '{"durationDays": 100}' \
    > test.out 2>&1
eval_tap $? 13 'AdminCreateConfigurationAlertV1' test.out

#- 14 AdminDeleteConfigurationAlertV1
./ng net.accelbyte.sdk.cli.Main session adminDeleteConfigurationAlertV1 \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 14 'AdminDeleteConfigurationAlertV1' test.out

#- 15 AdminUploadXBoxCertificate
eval_tap 0 15 'AdminUploadXBoxCertificate # SKIP deprecated' test.out

#- 16 AdminCreateConfigurationTemplateV1
./ng net.accelbyte.sdk.cli.Main session adminCreateConfigurationTemplateV1 \
    --namespace "$AB_NAMESPACE" \
    --body '{"NativeSessionSetting": {"PSNDisableSystemUIMenu": ["KICK", "UPDATE_JOINABLE_USER_TYPE", "UPDATE_JOINABLE_USER_TYPE"], "PSNServiceLabel": 86, "PSNSupportedPlatforms": ["Lu18qDJK", "K8kBdkjA", "8uV6rsuV"], "SessionTitle": "tvD8YfJY", "ShouldSync": false, "XboxAllowCrossPlatform": false, "XboxSandboxID": "bBTLQvDF", "XboxServiceConfigID": "IfLzquXG", "XboxSessionTemplateName": "AXFYYads", "XboxTitleID": "q2UYOZ7x", "localizedSessionName": {"aVrLf1SJ": {}, "1SDhUYte": {}, "1b7E7B1v": {}}}, "PSNBaseUrl": "3fH9px9F", "amsClaimTimeoutMinutes": 12, "appName": "LsjVsexM", "asyncProcessDSRequest": {"async": true, "timeout": 29}, "attributes": {"In9LSwsg": {}, "oLoHGx4K": {}, "N9QqpR9a": {}}, "autoJoin": true, "autoLeaveSession": true, "clientVersion": "yNXeTNk3", "customURLGRPC": "dNvTn7bu", "deployment": "SooVqvk5", "disableCodeGeneration": false, "disableResendInvite": false, "dsManualSetReady": false, "dsSource": "9R3NCwgm", "enableSecret": false, "fallbackClaimKeys": ["l0A8r4aG", "YtSclful", "5mTGTGJq"], "grpcSessionConfig": {"appName": "8riCiV8n", "customURL": "WiOHE0T6", "functionFlag": 86}, "immutableStorage": false, "inactiveTimeout": 57, "inviteTimeout": 67, "joinability": "FRIENDS_OF_MEMBERS", "leaderElectionGracePeriod": 38, "manualRejoin": false, "maxActiveSessions": 83, "maxPlayers": 80, "minPlayers": 2, "name": "OMi90nTR", "partyCodeLength": 89, "persistent": false, "preferredClaimKeys": ["qCRxV6dh", "pe8kYOq3", "Ehv2zMNJ"], "requestedRegions": ["nwMBI9Pd", "uoTlOP3n", "96byMTph"], "textChat": true, "textChatMode": "NONE", "tieTeamsSessionLifetime": false, "ttlHours": 55, "type": "NONE"}' \
    > test.out 2>&1
eval_tap $? 16 'AdminCreateConfigurationTemplateV1' test.out

#- 17 AdminGetAllConfigurationTemplatesV1
./ng net.accelbyte.sdk.cli.Main session adminGetAllConfigurationTemplatesV1 \
    --namespace "$AB_NAMESPACE" \
    --limit '17' \
    --name 'ZLUWTlxp' \
    --offset '67' \
    --order 'h2PIKCEr' \
    --orderBy 'A8IONuJd' \
    > test.out 2>&1
eval_tap $? 17 'AdminGetAllConfigurationTemplatesV1' test.out

#- 18 AdminGetConfigurationTemplateV1
./ng net.accelbyte.sdk.cli.Main session adminGetConfigurationTemplateV1 \
    --name 'hoHmPZvn' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 18 'AdminGetConfigurationTemplateV1' test.out

#- 19 AdminUpdateConfigurationTemplateV1
./ng net.accelbyte.sdk.cli.Main session adminUpdateConfigurationTemplateV1 \
    --name 'NjhURmDZ' \
    --namespace "$AB_NAMESPACE" \
    --body '{"NativeSessionSetting": {"PSNDisableSystemUIMenu": ["KICK", "UPDATE_INVITABLE_USER_TYPE", "UPDATE_INVITABLE_USER_TYPE"], "PSNServiceLabel": 53, "PSNSupportedPlatforms": ["pEtR7Tyx", "mjqlxiNg", "OxaeXbml"], "SessionTitle": "0jGktqRB", "ShouldSync": true, "XboxAllowCrossPlatform": true, "XboxSandboxID": "dnvg7YdU", "XboxServiceConfigID": "gTQJ7f1s", "XboxSessionTemplateName": "VjAcU5dO", "XboxTitleID": "l3GGe22X", "localizedSessionName": {"dXtr33hZ": {}, "h10bMuoV": {}, "eLW6v0UD": {}}}, "PSNBaseUrl": "wNnvl8V2", "amsClaimTimeoutMinutes": 26, "appName": "Y77KD8M9", "asyncProcessDSRequest": {"async": true, "timeout": 40}, "attributes": {"QXcL0sW2": {}, "oP2q6vAb": {}, "e0yYKsV6": {}}, "autoJoin": true, "autoLeaveSession": true, "clientVersion": "F4P6y2wA", "customURLGRPC": "5KDa1rYA", "deployment": "Ar7cq7K6", "disableCodeGeneration": false, "disableResendInvite": true, "dsManualSetReady": false, "dsSource": "0p7Lkat9", "enableSecret": false, "fallbackClaimKeys": ["s5EFabLR", "OU381OtB", "j0EOSOZq"], "grpcSessionConfig": {"appName": "DwJaXua1", "customURL": "DRd1FXcv", "functionFlag": 38}, "immutableStorage": false, "inactiveTimeout": 22, "inviteTimeout": 24, "joinability": "FRIENDS_OF_FRIENDS", "leaderElectionGracePeriod": 23, "manualRejoin": false, "maxActiveSessions": 45, "maxPlayers": 20, "minPlayers": 83, "name": "pASy4q87", "partyCodeLength": 70, "persistent": false, "preferredClaimKeys": ["f6PyNfqA", "E4nh5a1S", "lp4xgwNC"], "requestedRegions": ["cVV594cN", "jZkA9YhL", "jVMvlhk1"], "textChat": false, "textChatMode": "NONE", "tieTeamsSessionLifetime": true, "ttlHours": 34, "type": "NONE"}' \
    > test.out 2>&1
eval_tap $? 19 'AdminUpdateConfigurationTemplateV1' test.out

#- 20 AdminDeleteConfigurationTemplateV1
./ng net.accelbyte.sdk.cli.Main session adminDeleteConfigurationTemplateV1 \
    --name 'Kqf9rHK3' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 20 'AdminDeleteConfigurationTemplateV1' test.out

#- 21 AdminGetMemberActiveSession
./ng net.accelbyte.sdk.cli.Main session adminGetMemberActiveSession \
    --name '9zqe2nHA' \
    --namespace "$AB_NAMESPACE" \
    --userId 'PlUWx1AV' \
    > test.out 2>&1
eval_tap $? 21 'AdminGetMemberActiveSession' test.out

#- 22 AdminReconcileMaxActiveSession
./ng net.accelbyte.sdk.cli.Main session adminReconcileMaxActiveSession \
    --name 'm73d0xuV' \
    --namespace "$AB_NAMESPACE" \
    --body '{"userID": "m1B6XhmZ"}' \
    > test.out 2>&1
eval_tap $? 22 'AdminReconcileMaxActiveSession' test.out

#- 23 AdminGetDSMCConfiguration
eval_tap 0 23 'AdminGetDSMCConfiguration # SKIP deprecated' test.out

#- 24 AdminSyncDSMCConfiguration
eval_tap 0 24 'AdminSyncDSMCConfiguration # SKIP deprecated' test.out

#- 25 AdminQueryGameSessions
./ng net.accelbyte.sdk.cli.Main session adminQueryGameSessions \
    --namespace "$AB_NAMESPACE" \
    --configurationName '2miMKf2O' \
    --dsPodName 'zrvSXiMl' \
    --fromTime 'bbBUYFAR' \
    --gameMode 'LZONywX4' \
    --isPersistent 'pbM4qcsX' \
    --isSoftDeleted '9LJxOPUY' \
    --joinability 'CLOSED' \
    --limit '98' \
    --matchPool 'YMYCYEVq' \
    --memberID '491gZZew' \
    --offset '73' \
    --order 'ZNNSvWp0' \
    --orderBy 'SFFAvucV' \
    --sessionID 'YA37ROnF' \
    --status 'REQUESTED' \
    --statusV2 'ENDED' \
    --toTime 'OcL3ToM4' \
    > test.out 2>&1
eval_tap $? 25 'AdminQueryGameSessions' test.out

#- 26 AdminQueryGameSessionsByAttributes
./ng net.accelbyte.sdk.cli.Main session adminQueryGameSessionsByAttributes \
    --namespace "$AB_NAMESPACE" \
    --body '{"fkx1T4XG": {}, "0H8tiRuI": {}, "QA7pISsv": {}}' \
    > test.out 2>&1
eval_tap $? 26 'AdminQueryGameSessionsByAttributes' test.out

#- 27 AdminDeleteBulkGameSessions
./ng net.accelbyte.sdk.cli.Main session adminDeleteBulkGameSessions \
    --namespace "$AB_NAMESPACE" \
    --body '{"ids": ["zmrYTk75", "J3OPsLQd", "oYMB7HIo"]}' \
    > test.out 2>&1
eval_tap $? 27 'AdminDeleteBulkGameSessions' test.out

#- 28 AdminSetDSReady
./ng net.accelbyte.sdk.cli.Main session adminSetDSReady \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'vubnWr4T' \
    --body '{"ready": false}' \
    > test.out 2>&1
eval_tap $? 28 'AdminSetDSReady' test.out

#- 29 AdminUpdateDSInformation
./ng net.accelbyte.sdk.cli.Main session adminUpdateDSInformation \
    --namespace "$AB_NAMESPACE" \
    --sessionId '8yp5fhLg' \
    --body '{"createdRegion": "eeSk9tLQ", "deployment": "4DorVhCF", "description": "sCvyFpC5", "ip": "tSnUrODc", "port": 56, "region": "je8XHhwP", "serverId": "UhWWoqz3", "source": "iN2n8NmF", "status": "SWL26xnu"}' \
    > test.out 2>&1
eval_tap $? 29 'AdminUpdateDSInformation' test.out

#- 30 AdminKickGameSessionMember
./ng net.accelbyte.sdk.cli.Main session adminKickGameSessionMember \
    --memberId '88TiTV4W' \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'mgsMfwiU' \
    > test.out 2>&1
eval_tap $? 30 'AdminKickGameSessionMember' test.out

#- 31 AdminUpdateGameSessionMember
./ng net.accelbyte.sdk.cli.Main session adminUpdateGameSessionMember \
    --memberId 'PyteU1Ie' \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'MvlPFQEY' \
    --statusType '0Wv1IJAS' \
    > test.out 2>&1
eval_tap $? 31 'AdminUpdateGameSessionMember' test.out

#- 32 AdminGetListNativeSession
./ng net.accelbyte.sdk.cli.Main session adminGetListNativeSession \
    --namespace "$AB_NAMESPACE" \
    --limit '65' \
    --offset '78' \
    --order 'xIvF1LmK' \
    > test.out 2>&1
eval_tap $? 32 'AdminGetListNativeSession' test.out

#- 33 AdminQueryParties
./ng net.accelbyte.sdk.cli.Main session adminQueryParties \
    --namespace "$AB_NAMESPACE" \
    --configurationName 'ylm37b4j' \
    --fromTime '7WjD1b56' \
    --isSoftDeleted 'HiCuWtAn' \
    --joinability 'CLOSED' \
    --key 'qpNoxBtN' \
    --leaderID 'uO7J6zFF' \
    --limit '27' \
    --memberID 'EMjfUIaQ' \
    --memberStatus 'JOINED' \
    --offset '69' \
    --order '0twpMwMF' \
    --orderBy 'Odzv6vuA' \
    --partyID 'uFVOvFS2' \
    --toTime '95K7kh7W' \
    --value 'VcWmrpUz' \
    > test.out 2>&1
eval_tap $? 33 'AdminQueryParties' test.out

#- 34 AdminDeleteBulkParties
./ng net.accelbyte.sdk.cli.Main session adminDeleteBulkParties \
    --namespace "$AB_NAMESPACE" \
    --body '{"ids": ["nnzSX1vu", "9cgWan2T", "2ZdB77G9"]}' \
    > test.out 2>&1
eval_tap $? 34 'AdminDeleteBulkParties' test.out

#- 35 AdminReadPartySessionStorage
./ng net.accelbyte.sdk.cli.Main session adminReadPartySessionStorage \
    --namespace "$AB_NAMESPACE" \
    --partyId 'y3s6edYA' \
    > test.out 2>&1
eval_tap $? 35 'AdminReadPartySessionStorage' test.out

#- 36 AdminGetPlatformCredentials
./ng net.accelbyte.sdk.cli.Main session adminGetPlatformCredentials \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 36 'AdminGetPlatformCredentials' test.out

#- 37 AdminUpdatePlatformCredentials
./ng net.accelbyte.sdk.cli.Main session adminUpdatePlatformCredentials \
    --namespace "$AB_NAMESPACE" \
    --body '{"psn": {"clientId": "tycWjTYD", "clientSecret": "AkXvikbT", "scope": "Z73wyPmf"}}' \
    > test.out 2>&1
eval_tap $? 37 'AdminUpdatePlatformCredentials' test.out

#- 38 AdminDeletePlatformCredentials
./ng net.accelbyte.sdk.cli.Main session adminDeletePlatformCredentials \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 38 'AdminDeletePlatformCredentials' test.out

#- 39 AdminDeletePlatformCredentialsByPlatformId
./ng net.accelbyte.sdk.cli.Main session adminDeletePlatformCredentialsByPlatformId \
    --namespace "$AB_NAMESPACE" \
    --platformId 'XBOX' \
    > test.out 2>&1
eval_tap $? 39 'AdminDeletePlatformCredentialsByPlatformId' test.out

#- 40 AdminSyncPlatformCredentials
./ng net.accelbyte.sdk.cli.Main session adminSyncPlatformCredentials \
    --namespace "$AB_NAMESPACE" \
    --platformId 'XBOX' \
    > test.out 2>&1
eval_tap $? 40 'AdminSyncPlatformCredentials' test.out

#- 41 AdminGetRecentPlayer
./ng net.accelbyte.sdk.cli.Main session adminGetRecentPlayer \
    --namespace "$AB_NAMESPACE" \
    --limit '9' \
    --userId 'RPNBLXZE' \
    > test.out 2>&1
eval_tap $? 41 'AdminGetRecentPlayer' test.out

#- 42 AdminGetRecentTeamPlayer
./ng net.accelbyte.sdk.cli.Main session adminGetRecentTeamPlayer \
    --namespace "$AB_NAMESPACE" \
    --limit '48' \
    --userId 'fsEWTCHY' \
    > test.out 2>&1
eval_tap $? 42 'AdminGetRecentTeamPlayer' test.out

#- 43 AdminReadSessionStorage
./ng net.accelbyte.sdk.cli.Main session adminReadSessionStorage \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'tBwtpW6h' \
    > test.out 2>&1
eval_tap $? 43 'AdminReadSessionStorage' test.out

#- 44 AdminDeleteUserSessionStorage
./ng net.accelbyte.sdk.cli.Main session adminDeleteUserSessionStorage \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'IQdi9nhH' \
    > test.out 2>&1
eval_tap $? 44 'AdminDeleteUserSessionStorage' test.out

#- 45 AdminReadUserSessionStorage
./ng net.accelbyte.sdk.cli.Main session adminReadUserSessionStorage \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'wRGaAKMj' \
    --userId 'pg8lEbWU' \
    > test.out 2>&1
eval_tap $? 45 'AdminReadUserSessionStorage' test.out

#- 46 AdminQueryPlayerAttributes
./ng net.accelbyte.sdk.cli.Main session adminQueryPlayerAttributes \
    --namespace "$AB_NAMESPACE" \
    --users 'jIkCOi8V' \
    > test.out 2>&1
eval_tap $? 46 'AdminQueryPlayerAttributes' test.out

#- 47 AdminGetPlayerAttributes
./ng net.accelbyte.sdk.cli.Main session adminGetPlayerAttributes \
    --namespace "$AB_NAMESPACE" \
    --userId 'YQYJgxk9' \
    > test.out 2>&1
eval_tap $? 47 'AdminGetPlayerAttributes' test.out

#- 48 AdminSyncNativeSession
./ng net.accelbyte.sdk.cli.Main session adminSyncNativeSession \
    --namespace "$AB_NAMESPACE" \
    --userId 'NZUppsqf' \
    > test.out 2>&1
eval_tap $? 48 'AdminSyncNativeSession' test.out

#- 49 CreateGameSession
./ng net.accelbyte.sdk.cli.Main session createGameSession \
    --namespace "$AB_NAMESPACE" \
    --resolveMaxActiveSession  \
    --body '{"appName": "jYaRdFur", "attributes": {"Dy01rg9X": {}, "sXl3X88p": {}, "aDrrdRS8": {}}, "autoJoin": true, "backfillTicketID": "yKRr5jAW", "clientVersion": "h04Ycf8P", "configurationName": "34UxGi0k", "customURLGRPC": "H3lO5rQu", "deployment": "E0Ijt3PX", "dsSource": "0sReyBmG", "fallbackClaimKeys": ["S6f0PBCx", "ptpgsGfu", "CDziq7rV"], "inactiveTimeout": 55, "inviteTimeout": 58, "joinability": "OPEN", "matchPool": "iB1VrwgC", "maxPlayers": 29, "minPlayers": 34, "preferredClaimKeys": ["MoyfwzUm", "H1KHwNwf", "jQ72AcRA"], "requestedRegions": ["xOR7qk53", "xkjSmCu7", "7dXPpA77"], "serverName": "zVMTP38W", "storage": {"leader": {"Z0QLTBgM": {}, "cHaX4zAF": {}, "S5S7JBkg": {}}}, "teams": [{"parties": [{"partyID": "0sOv9Ulh", "userIDs": ["LOxvnhIB", "idtKW3ZG", "UT67uQEv"]}, {"partyID": "fmdCyLpV", "userIDs": ["gwsLIDnH", "nOaOr93y", "iT5Jc3W7"]}, {"partyID": "UCWN67a1", "userIDs": ["mo9fpGQY", "tBVJ89Dv", "EXnZqQcT"]}], "teamID": "tX1r58k1", "userIDs": ["JEhVEoax", "XJGdQn8v", "4eQqdtFH"]}, {"parties": [{"partyID": "GBFURwPF", "userIDs": ["84Ctxn49", "0kBO4f3b", "LJNwAtYd"]}, {"partyID": "nZ475iUk", "userIDs": ["WZCsVP3y", "vtu2x9IA", "nBBGzC77"]}, {"partyID": "RArkTzwv", "userIDs": ["8Aq5YuF6", "09BLxU2q", "EOIAhc2C"]}], "teamID": "9M4Aqj0q", "userIDs": ["r7weNv0K", "dXBw3SS3", "QLwLX5e3"]}, {"parties": [{"partyID": "njgESmzM", "userIDs": ["Wsfnthnn", "DpAlwuYi", "BGjoGAJ6"]}, {"partyID": "BTnt3zLk", "userIDs": ["Mo6PPuvB", "6jmCpimL", "c5y3WohZ"]}, {"partyID": "uQ243eHF", "userIDs": ["LB7T9rAB", "dFWxI1Hx", "oAHRstfR"]}], "teamID": "MC6agq5H", "userIDs": ["nwc31uHg", "n8SrfgsH", "3OcAXC20"]}], "textChat": true, "textChatMode": "GAME", "ticketIDs": ["vRR7CJpn", "gr74mOgB", "SPzUOrsZ"], "tieTeamsSessionLifetime": true, "type": "DS"}' \
    > test.out 2>&1
eval_tap $? 49 'CreateGameSession' test.out

#- 50 PublicQueryGameSessionsByAttributes
./ng net.accelbyte.sdk.cli.Main session publicQueryGameSessionsByAttributes \
    --namespace "$AB_NAMESPACE" \
    --body '{"SR5wx0Tw": {}, "NAuA0oiT": {}, "w2OP0g3o": {}}' \
    > test.out 2>&1
eval_tap $? 50 'PublicQueryGameSessionsByAttributes' test.out

#- 51 PublicSessionJoinCode
./ng net.accelbyte.sdk.cli.Main session publicSessionJoinCode \
    --namespace "$AB_NAMESPACE" \
    --body '{"code": "uuAANpxz"}' \
    > test.out 2>&1
eval_tap $? 51 'PublicSessionJoinCode' test.out

#- 52 GetGameSessionByPodName
./ng net.accelbyte.sdk.cli.Main session getGameSessionByPodName \
    --namespace "$AB_NAMESPACE" \
    --podName 'eInHE8Gh' \
    > test.out 2>&1
eval_tap $? 52 'GetGameSessionByPodName' test.out

#- 53 GetGameSession
./ng net.accelbyte.sdk.cli.Main session getGameSession \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'Yn6uXzcW' \
    > test.out 2>&1
eval_tap $? 53 'GetGameSession' test.out

#- 54 UpdateGameSession
./ng net.accelbyte.sdk.cli.Main session updateGameSession \
    --namespace "$AB_NAMESPACE" \
    --sessionId '5D1AKH4e' \
    --body '{"attributes": {"KWRlS3Zz": {}, "OGZt4xCw": {}, "s1md6IPU": {}}, "backfillTicketID": "MZpTPriJ", "clientVersion": "363fijFp", "deployment": "H7LUJnho", "fallbackClaimKeys": ["SAWFpfgm", "C5kSnyXs", "yUi6vlMA"], "inactiveTimeout": 99, "inviteTimeout": 73, "joinability": "FRIENDS_OF_MEMBERS", "matchPool": "rFi16pIJ", "maxPlayers": 49, "minPlayers": 17, "preferredClaimKeys": ["HeYZscWk", "ON52REDW", "ZcKuC4ch"], "requestedRegions": ["PtlhjCI4", "koPa3Yr1", "BXfXpTQH"], "teams": [{"parties": [{"partyID": "f02FMsGF", "userIDs": ["R5vRYpkD", "5MjR595M", "rvrOnqIE"]}, {"partyID": "Ezo0G6o4", "userIDs": ["9NzWGAqr", "7gzeRTbE", "o7kIyRGn"]}, {"partyID": "ueIzPbkt", "userIDs": ["srrsyMwh", "8mcPvOJz", "TR4bUzUL"]}], "teamID": "fXRHGqp2", "userIDs": ["RbZeX8vQ", "BR26A12U", "g8JnF9Nv"]}, {"parties": [{"partyID": "0mhg7Q9f", "userIDs": ["D8i8Mtph", "LAIlQgww", "arAfX8GQ"]}, {"partyID": "GDa4WBKn", "userIDs": ["y6syu4BW", "xq5oSA8k", "Ro695mCf"]}, {"partyID": "bBg4apyZ", "userIDs": ["U7NYOVpz", "L3nbm8Cb", "cFtHH6LT"]}], "teamID": "EwGoXm8Y", "userIDs": ["ZKcFJkFw", "cf8i5O4w", "pQl9pWAm"]}, {"parties": [{"partyID": "iYjvTvc8", "userIDs": ["03iENhG4", "dkhwSHvo", "ubs8DvYj"]}, {"partyID": "E1nOzc1K", "userIDs": ["QWDJ7fOc", "AXNwF6uE", "yPr0r4Z8"]}, {"partyID": "fVy2llcL", "userIDs": ["1PnMTviI", "yA7ghFSu", "eEPeqtTh"]}], "teamID": "F5pQba9G", "userIDs": ["mZ2fmpc1", "a9OIxwJR", "zqLSglNB"]}], "ticketIDs": ["NaYcIEda", "bLSB7QNP", "qSRy9Ma0"], "tieTeamsSessionLifetime": true, "type": "DS", "version": 10}' \
    > test.out 2>&1
eval_tap $? 54 'UpdateGameSession' test.out

#- 55 DeleteGameSession
./ng net.accelbyte.sdk.cli.Main session deleteGameSession \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'mX5lYsBF' \
    > test.out 2>&1
eval_tap $? 55 'DeleteGameSession' test.out

#- 56 PatchUpdateGameSession
./ng net.accelbyte.sdk.cli.Main session patchUpdateGameSession \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'uSzy0NEt' \
    --body '{"attributes": {"FZhxlae4": {}, "Rpaaobf7": {}, "mUZXbLUX": {}}, "backfillTicketID": "oWYIr19D", "clientVersion": "HVbzUWDv", "deployment": "swhQE23e", "fallbackClaimKeys": ["eAoeGDNA", "w8gKFzXK", "OIvSmwIt"], "inactiveTimeout": 72, "inviteTimeout": 49, "joinability": "FRIENDS_OF_LEADER", "matchPool": "TMFTqZGT", "maxPlayers": 49, "minPlayers": 28, "preferredClaimKeys": ["9DPTqD6V", "9JueQanH", "NyuQBW1x"], "requestedRegions": ["q9z7zDiN", "2jS0S0zW", "JALzruzU"], "teams": [{"parties": [{"partyID": "zyB5DmDL", "userIDs": ["MZsf0YF6", "9FbtbY4J", "Xar0WIk1"]}, {"partyID": "0sRvP029", "userIDs": ["e3dfhtpN", "PCpcx8Nc", "OQVAbK1Z"]}, {"partyID": "aGbEEQdv", "userIDs": ["aMuT1524", "C1Jc1eTc", "orKTzvLw"]}], "teamID": "zSLz2J4r", "userIDs": ["r6vL3ce3", "8sCXeXoY", "bqJHWGpR"]}, {"parties": [{"partyID": "WdjkxSDu", "userIDs": ["YFNbVYdk", "C93xx66E", "gETieB8L"]}, {"partyID": "kUqCOUY6", "userIDs": ["dztAC5Ng", "NpoP8ZBl", "44GEegGH"]}, {"partyID": "ZbN9NMGi", "userIDs": ["qxBATPmI", "J2joCS5R", "JfqQK1uF"]}], "teamID": "VmUxzXMQ", "userIDs": ["sgV2FqlR", "RCvaGgoA", "bzDHthdi"]}, {"parties": [{"partyID": "7GV97LgF", "userIDs": ["NNy5Q4Hh", "i5B4GDrI", "tMK9NfPt"]}, {"partyID": "y9gv3TzD", "userIDs": ["sTx5l0YY", "AWtrzYtR", "y6X3vd4i"]}, {"partyID": "2El7uOva", "userIDs": ["05ERem6N", "Z8TLzIxZ", "uuoFlMHJ"]}], "teamID": "iNwj56u2", "userIDs": ["FKcfl5Jz", "DK4j7djM", "LKx0Uzfe"]}], "ticketIDs": ["3nNCXrrf", "pWSDP6E5", "eZ8FloZn"], "tieTeamsSessionLifetime": true, "type": "DS", "version": 95}' \
    > test.out 2>&1
eval_tap $? 56 'PatchUpdateGameSession' test.out

#- 57 UpdateGameSessionBackfillTicketID
./ng net.accelbyte.sdk.cli.Main session updateGameSessionBackfillTicketID \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'edKBFz0p' \
    --body '{"backfillTicketID": "ODGZDDHs"}' \
    > test.out 2>&1
eval_tap $? 57 'UpdateGameSessionBackfillTicketID' test.out

#- 58 GameSessionGenerateCode
./ng net.accelbyte.sdk.cli.Main session gameSessionGenerateCode \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'xWIzuQx7' \
    > test.out 2>&1
eval_tap $? 58 'GameSessionGenerateCode' test.out

#- 59 PublicRevokeGameSessionCode
./ng net.accelbyte.sdk.cli.Main session publicRevokeGameSessionCode \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'uLwdbShV' \
    > test.out 2>&1
eval_tap $? 59 'PublicRevokeGameSessionCode' test.out

#- 60 PublicGameSessionInvite
./ng net.accelbyte.sdk.cli.Main session publicGameSessionInvite \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'iYB5j7QV' \
    --body '{"metadata": {"xiONPvZ8": "1AKTo7Bd", "moDC5dQp": "GQDNrjBA", "dU9rTZtQ": "VQR5hlJL"}, "platformID": "To9aeEwz", "userID": "pJ9Uh2ET"}' \
    > test.out 2>&1
eval_tap $? 60 'PublicGameSessionInvite' test.out

#- 61 JoinGameSession
./ng net.accelbyte.sdk.cli.Main session joinGameSession \
    --namespace "$AB_NAMESPACE" \
    --sessionId '3NRK2jeY' \
    > test.out 2>&1
eval_tap $? 61 'JoinGameSession' test.out

#- 62 PublicPromoteGameSessionLeader
./ng net.accelbyte.sdk.cli.Main session publicPromoteGameSessionLeader \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'hNODzRW8' \
    --body '{"leaderID": "uiOXD9Z9"}' \
    > test.out 2>&1
eval_tap $? 62 'PublicPromoteGameSessionLeader' test.out

#- 63 LeaveGameSession
./ng net.accelbyte.sdk.cli.Main session leaveGameSession \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'Eek8anwE' \
    > test.out 2>&1
eval_tap $? 63 'LeaveGameSession' test.out

#- 64 PublicKickGameSessionMember
./ng net.accelbyte.sdk.cli.Main session publicKickGameSessionMember \
    --memberId '9xvSqww8' \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'ZmePN3uB' \
    > test.out 2>&1
eval_tap $? 64 'PublicKickGameSessionMember' test.out

#- 65 PublicGameSessionReject
./ng net.accelbyte.sdk.cli.Main session publicGameSessionReject \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'HAmRBYip' \
    > test.out 2>&1
eval_tap $? 65 'PublicGameSessionReject' test.out

#- 66 GetSessionServerSecret
./ng net.accelbyte.sdk.cli.Main session getSessionServerSecret \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'JGtlTLK0' \
    > test.out 2>&1
eval_tap $? 66 'GetSessionServerSecret' test.out

#- 67 AppendTeamGameSession
eval_tap 0 67 'AppendTeamGameSession # SKIP deprecated' test.out

#- 68 PublicGameSessionCancel
./ng net.accelbyte.sdk.cli.Main session publicGameSessionCancel \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'GXp3l6eX' \
    --userId 'rzDJZnul' \
    > test.out 2>&1
eval_tap $? 68 'PublicGameSessionCancel' test.out

#- 69 PublicPartyJoinCode
./ng net.accelbyte.sdk.cli.Main session publicPartyJoinCode \
    --namespace "$AB_NAMESPACE" \
    --body '{"code": "3FJRJC7S"}' \
    > test.out 2>&1
eval_tap $? 69 'PublicPartyJoinCode' test.out

#- 70 PublicGetParty
./ng net.accelbyte.sdk.cli.Main session publicGetParty \
    --namespace "$AB_NAMESPACE" \
    --partyId 'Dh6w4snK' \
    > test.out 2>&1
eval_tap $? 70 'PublicGetParty' test.out

#- 71 PublicUpdateParty
./ng net.accelbyte.sdk.cli.Main session publicUpdateParty \
    --namespace "$AB_NAMESPACE" \
    --partyId 'SGA0SHoh' \
    --body '{"attributes": {"tPZU0tra": {}, "tI8a52vF": {}, "MsVbIAlt": {}}, "inactiveTimeout": 64, "inviteTimeout": 10, "joinability": "FRIENDS_OF_LEADER", "maxPlayers": 43, "minPlayers": 16, "type": "DS", "version": 50}' \
    > test.out 2>&1
eval_tap $? 71 'PublicUpdateParty' test.out

#- 72 PublicPatchUpdateParty
./ng net.accelbyte.sdk.cli.Main session publicPatchUpdateParty \
    --namespace "$AB_NAMESPACE" \
    --partyId 'Yq2cvFHv' \
    --body '{"attributes": {"HElyWevF": {}, "9wNqU5sY": {}, "1gKAwsfF": {}}, "inactiveTimeout": 38, "inviteTimeout": 99, "joinability": "CLOSED", "maxPlayers": 95, "minPlayers": 43, "type": "P2P", "version": 24}' \
    > test.out 2>&1
eval_tap $? 72 'PublicPatchUpdateParty' test.out

#- 73 PublicGeneratePartyCode
./ng net.accelbyte.sdk.cli.Main session publicGeneratePartyCode \
    --namespace "$AB_NAMESPACE" \
    --partyId 'stZDDEWm' \
    > test.out 2>&1
eval_tap $? 73 'PublicGeneratePartyCode' test.out

#- 74 PublicRevokePartyCode
./ng net.accelbyte.sdk.cli.Main session publicRevokePartyCode \
    --namespace "$AB_NAMESPACE" \
    --partyId 'CUZ6MKLg' \
    > test.out 2>&1
eval_tap $? 74 'PublicRevokePartyCode' test.out

#- 75 PublicPartyInvite
./ng net.accelbyte.sdk.cli.Main session publicPartyInvite \
    --namespace "$AB_NAMESPACE" \
    --partyId 'YL4A0Y6n' \
    --body '{"metadata": {"9f3VFXpr": "8H0zpocZ", "PlHD51qZ": "T8v28Xvx", "90Aagxst": "9BqJtPJ9"}, "platformID": "OxMYuEID", "userID": "K2Fs9ILi"}' \
    > test.out 2>&1
eval_tap $? 75 'PublicPartyInvite' test.out

#- 76 PublicPromotePartyLeader
./ng net.accelbyte.sdk.cli.Main session publicPromotePartyLeader \
    --namespace "$AB_NAMESPACE" \
    --partyId 'anqxL4cy' \
    --body '{"leaderID": "As7UVfO9"}' \
    > test.out 2>&1
eval_tap $? 76 'PublicPromotePartyLeader' test.out

#- 77 PublicReadPartySessionStorage
./ng net.accelbyte.sdk.cli.Main session publicReadPartySessionStorage \
    --namespace "$AB_NAMESPACE" \
    --partyId 'HMVzef6S' \
    > test.out 2>&1
eval_tap $? 77 'PublicReadPartySessionStorage' test.out

#- 78 PublicUpdateInsertPartySessionStorageReserved
./ng net.accelbyte.sdk.cli.Main session publicUpdateInsertPartySessionStorageReserved \
    --namespace "$AB_NAMESPACE" \
    --partyId 'r4SyyCki' \
    --userId '7qjOyNHb' \
    --body '{"59BAO5ZL": {}, "7eTg2U9M": {}, "Ofx3VAwL": {}}' \
    > test.out 2>&1
eval_tap $? 78 'PublicUpdateInsertPartySessionStorageReserved' test.out

#- 79 PublicPartyJoin
./ng net.accelbyte.sdk.cli.Main session publicPartyJoin \
    --namespace "$AB_NAMESPACE" \
    --partyId 'MJ0S1gff' \
    > test.out 2>&1
eval_tap $? 79 'PublicPartyJoin' test.out

#- 80 PublicPartyLeave
./ng net.accelbyte.sdk.cli.Main session publicPartyLeave \
    --namespace "$AB_NAMESPACE" \
    --partyId '95qOEqWq' \
    > test.out 2>&1
eval_tap $? 80 'PublicPartyLeave' test.out

#- 81 PublicPartyReject
./ng net.accelbyte.sdk.cli.Main session publicPartyReject \
    --namespace "$AB_NAMESPACE" \
    --partyId 'rZ7qfAzp' \
    > test.out 2>&1
eval_tap $? 81 'PublicPartyReject' test.out

#- 82 PublicPartyCancel
./ng net.accelbyte.sdk.cli.Main session publicPartyCancel \
    --namespace "$AB_NAMESPACE" \
    --partyId 'rksfQTFl' \
    --userId '4GFGkXZ7' \
    > test.out 2>&1
eval_tap $? 82 'PublicPartyCancel' test.out

#- 83 PublicPartyKick
./ng net.accelbyte.sdk.cli.Main session publicPartyKick \
    --namespace "$AB_NAMESPACE" \
    --partyId 'nLEAWkU3' \
    --userId 'CPJPdDXz' \
    > test.out 2>&1
eval_tap $? 83 'PublicPartyKick' test.out

#- 84 PublicCreateParty
./ng net.accelbyte.sdk.cli.Main session publicCreateParty \
    --namespace "$AB_NAMESPACE" \
    --body '{"attributes": {"H3e0GESO": {}, "Wvej7fMr": {}, "LcR0rXOW": {}}, "configurationName": "nArkkLtT", "inactiveTimeout": 40, "inviteTimeout": 63, "joinability": "INVITE_ONLY", "maxPlayers": 34, "members": [{"ID": "cs4N83w1", "PlatformID": "G48ZBDV0", "PlatformUserID": "yRupviFd"}, {"ID": "bLV9WvvX", "PlatformID": "162zelF1", "PlatformUserID": "dUPCotdn"}, {"ID": "VqQR1J8y", "PlatformID": "BiDPapnb", "PlatformUserID": "QIjklcWv"}], "minPlayers": 0, "textChat": true, "type": "DS"}' \
    > test.out 2>&1
eval_tap $? 84 'PublicCreateParty' test.out

#- 85 PublicGetRecentPlayer
./ng net.accelbyte.sdk.cli.Main session publicGetRecentPlayer \
    --namespace "$AB_NAMESPACE" \
    --limit '87' \
    > test.out 2>&1
eval_tap $? 85 'PublicGetRecentPlayer' test.out

#- 86 PublicGetRecentTeamPlayer
./ng net.accelbyte.sdk.cli.Main session publicGetRecentTeamPlayer \
    --namespace "$AB_NAMESPACE" \
    --limit '92' \
    > test.out 2>&1
eval_tap $? 86 'PublicGetRecentTeamPlayer' test.out

#- 87 PublicUpdateInsertSessionStorageLeader
./ng net.accelbyte.sdk.cli.Main session publicUpdateInsertSessionStorageLeader \
    --namespace "$AB_NAMESPACE" \
    --sessionId '42FOIbDD' \
    --body '{"UO51pS21": {}, "tFFs583V": {}, "c3VSzZqU": {}}' \
    > test.out 2>&1
eval_tap $? 87 'PublicUpdateInsertSessionStorageLeader' test.out

#- 88 PublicUpdateInsertSessionStorage
./ng net.accelbyte.sdk.cli.Main session publicUpdateInsertSessionStorage \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'jxnXPqY1' \
    --userId 'OkTpZ7sK' \
    --body '{"Uy8v4QpE": {}, "16k9MxXc": {}, "0LFAEc1v": {}}' \
    > test.out 2>&1
eval_tap $? 88 'PublicUpdateInsertSessionStorage' test.out

#- 89 PublicGetBulkPlayerCurrentPlatform
./ng net.accelbyte.sdk.cli.Main session publicGetBulkPlayerCurrentPlatform \
    --namespace "$AB_NAMESPACE" \
    --body '{"userIDs": ["CCMFKMje", "AH2ep9Pq", "trMoSj17"]}' \
    > test.out 2>&1
eval_tap $? 89 'PublicGetBulkPlayerCurrentPlatform' test.out

#- 90 PublicGetPlayerAttributes
./ng net.accelbyte.sdk.cli.Main session publicGetPlayerAttributes \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 90 'PublicGetPlayerAttributes' test.out

#- 91 PublicStorePlayerAttributes
./ng net.accelbyte.sdk.cli.Main session publicStorePlayerAttributes \
    --namespace "$AB_NAMESPACE" \
    --body '{"crossplayEnabled": true, "currentPlatform": "DAo1eECh", "data": {"848PC8OQ": {}, "vu5ZfYrL": {}, "BFAIvmwn": {}}, "platforms": [{"name": "sKhP5ngj", "userID": "0zUN9Tc7"}, {"name": "XQEk3Ket", "userID": "Zi3BSqHe"}, {"name": "icUTGtCx", "userID": "xDDAShIe"}], "roles": ["4z7pH5J2", "cDbuS8ym", "FPZSspHf"], "simultaneousPlatform": "jZjBDBSJ"}' \
    > test.out 2>&1
eval_tap $? 91 'PublicStorePlayerAttributes' test.out

#- 92 PublicDeletePlayerAttributes
./ng net.accelbyte.sdk.cli.Main session publicDeletePlayerAttributes \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 92 'PublicDeletePlayerAttributes' test.out

#- 93 PublicQueryMyGameSessions
./ng net.accelbyte.sdk.cli.Main session publicQueryMyGameSessions \
    --namespace "$AB_NAMESPACE" \
    --order 'G1RuyQUg' \
    --orderBy 'jt8eje78' \
    --status 'ZtjWWsiU' \
    > test.out 2>&1
eval_tap $? 93 'PublicQueryMyGameSessions' test.out

#- 94 PublicQueryMyParties
./ng net.accelbyte.sdk.cli.Main session publicQueryMyParties \
    --namespace "$AB_NAMESPACE" \
    --order '1pCKHY85' \
    --orderBy 'Qc0HCASW' \
    --status '16CGZOpI' \
    > test.out 2>&1
eval_tap $? 94 'PublicQueryMyParties' test.out


rm -f "tmp.dat"

exit $EXIT_CODE