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
    --body '{"logLevel": "error"}' \
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
    --body '{"metricExcludedNamespaces": ["8t0TkrVB", "NWfeHSeS", "4P9g1D2m"], "regionRetryMapping": {"WisvRWOy": ["XaNGXiMN", "5xI4tYF3", "GVxGWmaW"], "ryqGDVXF": ["jEu11Dc8", "a5pWgv8o", "6YtjqUqX"], "oq40gdE4": ["AyoaJa1O", "bHgOWida", "l81M0rZg"]}, "regionURLMapping": ["7Efx18Mf", "8xMph75A", "6Borw4y6"], "testGameMode": "4NCh6fcu", "testRegionURLMapping": ["bd42R1Jr", "wlINNQdA", "bwkEvl8b"], "testTargetUserIDs": ["BaEMnrKb", "pe1DDLp4", "2vIlP9sD"]}' \
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
    --body '{"durationDays": 46}' \
    > test.out 2>&1
eval_tap $? 12 'AdminUpdateConfigurationAlertV1' test.out

#- 13 AdminCreateConfigurationAlertV1
./ng net.accelbyte.sdk.cli.Main session adminCreateConfigurationAlertV1 \
    --namespace "$AB_NAMESPACE" \
    --body '{"durationDays": 28}' \
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
    --body '{"NativeSessionSetting": {"PSNDisableSystemUIMenu": ["KICK", "UPDATE_INVITABLE_USER_TYPE", "KICK"], "PSNServiceLabel": 20, "PSNSupportedPlatforms": ["BnmFXKsD", "kFfGc7Me", "3ITS6LWr"], "SessionTitle": "4KusHAbj", "ShouldSync": true, "XboxAllowCrossPlatform": true, "XboxSandboxID": "qe8efUxU", "XboxServiceConfigID": "3Dmkoli6", "XboxSessionTemplateName": "DyIBas8O", "XboxTitleID": "mfHISiql", "localizedSessionName": {"aMsGQZdP": {}, "1nQmaZtT": {}, "vB7F0Aqe": {}}}, "PSNBaseUrl": "dUnFgmBO", "amsClaimTimeoutMinutes": 23, "appName": "5U0ArWe8", "asyncProcessDSRequest": {"async": false, "timeout": 94}, "attributes": {"f1dGXlHG": {}, "S7y9jEiE": {}, "wrbOKKJN": {}}, "autoJoin": true, "autoLeaveSession": true, "clientVersion": "pjnGGo0u", "customURLGRPC": "h7Ml0Tlq", "deployment": "WUJUHNfP", "disableCodeGeneration": true, "disableResendInvite": false, "dsManualSetReady": false, "dsSource": "Z9oXk6kS", "enableSecret": false, "fallbackClaimKeys": ["u4gEM8Ne", "z4TYmAZy", "wK89Fy7j"], "grpcSessionConfig": {"appName": "rqvMQeYT", "customURL": "y9G8Rrnk", "functionFlag": 40}, "immutableStorage": true, "inactiveTimeout": 30, "inviteTimeout": 58, "joinability": "CLOSED", "leaderElectionGracePeriod": 19, "manualRejoin": false, "maxActiveSessions": 66, "maxPlayers": 54, "minPlayers": 37, "name": "Sy1ZYOjC", "partyCodeGeneratorString": "R6QPhGVe", "partyCodeLength": 48, "persistent": true, "preferredClaimKeys": ["AXvPSkLI", "WeBlsNaX", "RZBDp9Fm"], "requestedRegions": ["3peJU8VS", "Qzc8o83r", "ljM4c79L"], "textChat": true, "textChatMode": "GAME", "tieTeamsSessionLifetime": true, "ttlHours": 94, "type": "NONE"}' \
    > test.out 2>&1
eval_tap $? 16 'AdminCreateConfigurationTemplateV1' test.out

#- 17 AdminGetAllConfigurationTemplatesV1
./ng net.accelbyte.sdk.cli.Main session adminGetAllConfigurationTemplatesV1 \
    --namespace "$AB_NAMESPACE" \
    --limit '44' \
    --name '38Ttuxu9' \
    --offset '43' \
    --order 'JZXdNv44' \
    --orderBy 'jquNGYsa' \
    > test.out 2>&1
eval_tap $? 17 'AdminGetAllConfigurationTemplatesV1' test.out

#- 18 AdminGetConfigurationTemplateV1
./ng net.accelbyte.sdk.cli.Main session adminGetConfigurationTemplateV1 \
    --name 'pFMNOKIB' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 18 'AdminGetConfigurationTemplateV1' test.out

#- 19 AdminUpdateConfigurationTemplateV1
./ng net.accelbyte.sdk.cli.Main session adminUpdateConfigurationTemplateV1 \
    --name '8SVGKbUB' \
    --namespace "$AB_NAMESPACE" \
    --body '{"NativeSessionSetting": {"PSNDisableSystemUIMenu": ["KICK", "UPDATE_INVITABLE_USER_TYPE", "UPDATE_INVITABLE_USER_TYPE"], "PSNServiceLabel": 32, "PSNSupportedPlatforms": ["LygNfrPw", "egbWGVCH", "vmk74riK"], "SessionTitle": "5bXtdhTH", "ShouldSync": false, "XboxAllowCrossPlatform": true, "XboxSandboxID": "tR8D0gAJ", "XboxServiceConfigID": "FVIRAJpL", "XboxSessionTemplateName": "rDESOM2e", "XboxTitleID": "xcVBJV6r", "localizedSessionName": {"kMuAFuaL": {}, "Opt5LYed": {}, "Yj4488Lq": {}}}, "PSNBaseUrl": "kL8Ev4yX", "amsClaimTimeoutMinutes": 85, "appName": "oWJ50aal", "asyncProcessDSRequest": {"async": true, "timeout": 84}, "attributes": {"DWdnKbnt": {}, "uBBBiR0A": {}, "B3LA43id": {}}, "autoJoin": true, "autoLeaveSession": true, "clientVersion": "ZtpxXELZ", "customURLGRPC": "K1BUyWZP", "deployment": "ExDDGjgw", "disableCodeGeneration": true, "disableResendInvite": false, "dsManualSetReady": false, "dsSource": "fsOyMQ2G", "enableSecret": false, "fallbackClaimKeys": ["0V35aqOn", "UeGbrzd2", "vBFx05gF"], "grpcSessionConfig": {"appName": "IhX1MluF", "customURL": "JP84Vq6K", "functionFlag": 87}, "immutableStorage": false, "inactiveTimeout": 6, "inviteTimeout": 63, "joinability": "INVITE_ONLY", "leaderElectionGracePeriod": 65, "manualRejoin": true, "maxActiveSessions": 62, "maxPlayers": 78, "minPlayers": 4, "name": "qX2J6paU", "partyCodeGeneratorString": "9ExU2Byw", "partyCodeLength": 33, "persistent": false, "preferredClaimKeys": ["9jKvFb8c", "45JbTjZH", "NacYW5xW"], "requestedRegions": ["E9NmoDgy", "tk0bqkEX", "3I6NBMQG"], "textChat": true, "textChatMode": "TEAM", "tieTeamsSessionLifetime": false, "ttlHours": 97, "type": "NONE"}' \
    > test.out 2>&1
eval_tap $? 19 'AdminUpdateConfigurationTemplateV1' test.out

#- 20 AdminDeleteConfigurationTemplateV1
./ng net.accelbyte.sdk.cli.Main session adminDeleteConfigurationTemplateV1 \
    --name 'CRpXevaW' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 20 'AdminDeleteConfigurationTemplateV1' test.out

#- 21 AdminGetMemberActiveSession
./ng net.accelbyte.sdk.cli.Main session adminGetMemberActiveSession \
    --name 'pJtORoeR' \
    --namespace "$AB_NAMESPACE" \
    --userId 'HuYXU1np' \
    > test.out 2>&1
eval_tap $? 21 'AdminGetMemberActiveSession' test.out

#- 22 AdminReconcileMaxActiveSession
./ng net.accelbyte.sdk.cli.Main session adminReconcileMaxActiveSession \
    --name 'eCYbHrze' \
    --namespace "$AB_NAMESPACE" \
    --body '{"userID": "0LryNh0Y"}' \
    > test.out 2>&1
eval_tap $? 22 'AdminReconcileMaxActiveSession' test.out

#- 23 AdminGetDSMCConfiguration
eval_tap 0 23 'AdminGetDSMCConfiguration # SKIP deprecated' test.out

#- 24 AdminSyncDSMCConfiguration
eval_tap 0 24 'AdminSyncDSMCConfiguration # SKIP deprecated' test.out

#- 25 AdminQueryGameSessions
./ng net.accelbyte.sdk.cli.Main session adminQueryGameSessions \
    --namespace "$AB_NAMESPACE" \
    --configurationName 'btLPKpNH' \
    --dsPodName 'BhdxJjfz' \
    --fromTime '2YX9B0Ol' \
    --gameMode 'xbQwTczh' \
    --isPersistent 'Bu4V7K06' \
    --isSoftDeleted 'y6cv3SE2' \
    --joinability 'FRIENDS_OF_FRIENDS' \
    --limit '35' \
    --matchPool '1FN8WrTo' \
    --memberID 'x0Gph7HQ' \
    --offset '48' \
    --order '4zdfd7db' \
    --orderBy 'FaKGeJ0R' \
    --sessionID 'XVEtOLLu' \
    --status 'PREPARING' \
    --statusV2 'FAILED_TO_REQUEST' \
    --toTime 'IJ1fFJRU' \
    > test.out 2>&1
eval_tap $? 25 'AdminQueryGameSessions' test.out

#- 26 AdminQueryGameSessionsByAttributes
./ng net.accelbyte.sdk.cli.Main session adminQueryGameSessionsByAttributes \
    --namespace "$AB_NAMESPACE" \
    --body '{"W9M2m3Eq": {}, "fufgAS9b": {}, "Oe7VpvfR": {}}' \
    > test.out 2>&1
eval_tap $? 26 'AdminQueryGameSessionsByAttributes' test.out

#- 27 AdminDeleteBulkGameSessions
./ng net.accelbyte.sdk.cli.Main session adminDeleteBulkGameSessions \
    --namespace "$AB_NAMESPACE" \
    --body '{"ids": ["7noF6ox3", "yhTamaTR", "vJ2lsC2b"]}' \
    > test.out 2>&1
eval_tap $? 27 'AdminDeleteBulkGameSessions' test.out

#- 28 AdminSetDSReady
./ng net.accelbyte.sdk.cli.Main session adminSetDSReady \
    --namespace "$AB_NAMESPACE" \
    --sessionId '4tdFgocT' \
    --body '{"ready": false}' \
    > test.out 2>&1
eval_tap $? 28 'AdminSetDSReady' test.out

#- 29 AdminUpdateDSInformation
./ng net.accelbyte.sdk.cli.Main session adminUpdateDSInformation \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'ANni1FGo' \
    --body '{"createdRegion": "SRRfBsB5", "deployment": "WQm6UfSG", "description": "6pB7AQiQ", "ip": "eOBokxVf", "port": 24, "region": "vD17okDH", "serverId": "m4kcZNFq", "source": "xcU3A7UM", "status": "LdJ3ipAg"}' \
    > test.out 2>&1
eval_tap $? 29 'AdminUpdateDSInformation' test.out

#- 30 AdminKickGameSessionMember
./ng net.accelbyte.sdk.cli.Main session adminKickGameSessionMember \
    --memberId 'q7YNixKZ' \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'TIC8tlHM' \
    > test.out 2>&1
eval_tap $? 30 'AdminKickGameSessionMember' test.out

#- 31 AdminUpdateGameSessionMember
./ng net.accelbyte.sdk.cli.Main session adminUpdateGameSessionMember \
    --memberId 'mjJbbnm6' \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'EsR1EUQB' \
    --statusType 'm0f6mgXk' \
    > test.out 2>&1
eval_tap $? 31 'AdminUpdateGameSessionMember' test.out

#- 32 AdminGetListNativeSession
./ng net.accelbyte.sdk.cli.Main session adminGetListNativeSession \
    --namespace "$AB_NAMESPACE" \
    --limit '62' \
    --offset '86' \
    --order 'PjiRQ7OF' \
    > test.out 2>&1
eval_tap $? 32 'AdminGetListNativeSession' test.out

#- 33 AdminQueryParties
./ng net.accelbyte.sdk.cli.Main session adminQueryParties \
    --namespace "$AB_NAMESPACE" \
    --configurationName 'BSdbryXb' \
    --fromTime 'RjYDIreu' \
    --isSoftDeleted 'oTQygA5n' \
    --joinability 'FRIENDS_OF_MEMBERS' \
    --key 'fP3PwQIA' \
    --leaderID 'W94MQwy7' \
    --limit '92' \
    --memberID 'Qw9qd9ri' \
    --memberStatus 'REJECTED' \
    --offset '38' \
    --order 'iqK5kYYi' \
    --orderBy '8VGTyEJX' \
    --partyID '7ZxnDtFV' \
    --toTime 'Sx2emzyg' \
    --value 'aAXrOJIf' \
    > test.out 2>&1
eval_tap $? 33 'AdminQueryParties' test.out

#- 34 AdminDeleteBulkParties
./ng net.accelbyte.sdk.cli.Main session adminDeleteBulkParties \
    --namespace "$AB_NAMESPACE" \
    --body '{"ids": ["hbjdILXx", "wWSNLo2D", "5oLomAmo"]}' \
    > test.out 2>&1
eval_tap $? 34 'AdminDeleteBulkParties' test.out

#- 35 AdminReadPartySessionStorage
./ng net.accelbyte.sdk.cli.Main session adminReadPartySessionStorage \
    --namespace "$AB_NAMESPACE" \
    --partyId 'mHI4Z7TJ' \
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
    --body '{"psn": {"clientId": "T7NciWnn", "clientSecret": "4xUKWP1i", "scope": "A05JhZzw"}}' \
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
    --userId 'KdIr9qvz' \
    > test.out 2>&1
eval_tap $? 41 'AdminGetRecentPlayer' test.out

#- 42 AdminGetRecentTeamPlayer
./ng net.accelbyte.sdk.cli.Main session adminGetRecentTeamPlayer \
    --namespace "$AB_NAMESPACE" \
    --limit '75' \
    --userId 'foNNf6BM' \
    > test.out 2>&1
eval_tap $? 42 'AdminGetRecentTeamPlayer' test.out

#- 43 AdminReadSessionStorage
./ng net.accelbyte.sdk.cli.Main session adminReadSessionStorage \
    --namespace "$AB_NAMESPACE" \
    --sessionId '1m2UEX4G' \
    > test.out 2>&1
eval_tap $? 43 'AdminReadSessionStorage' test.out

#- 44 AdminDeleteUserSessionStorage
./ng net.accelbyte.sdk.cli.Main session adminDeleteUserSessionStorage \
    --namespace "$AB_NAMESPACE" \
    --sessionId '2rzGjmH5' \
    > test.out 2>&1
eval_tap $? 44 'AdminDeleteUserSessionStorage' test.out

#- 45 AdminReadUserSessionStorage
./ng net.accelbyte.sdk.cli.Main session adminReadUserSessionStorage \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'aH3pciR3' \
    --userId 'pqVllvRM' \
    > test.out 2>&1
eval_tap $? 45 'AdminReadUserSessionStorage' test.out

#- 46 AdminQueryPlayerAttributes
./ng net.accelbyte.sdk.cli.Main session adminQueryPlayerAttributes \
    --namespace "$AB_NAMESPACE" \
    --users 'iaTGhPnj' \
    > test.out 2>&1
eval_tap $? 46 'AdminQueryPlayerAttributes' test.out

#- 47 AdminGetPlayerAttributes
./ng net.accelbyte.sdk.cli.Main session adminGetPlayerAttributes \
    --namespace "$AB_NAMESPACE" \
    --userId 'iY8a2dH4' \
    > test.out 2>&1
eval_tap $? 47 'AdminGetPlayerAttributes' test.out

#- 48 AdminSyncNativeSession
./ng net.accelbyte.sdk.cli.Main session adminSyncNativeSession \
    --namespace "$AB_NAMESPACE" \
    --userId 'MOd0ZKy2' \
    > test.out 2>&1
eval_tap $? 48 'AdminSyncNativeSession' test.out

#- 49 CreateGameSession
./ng net.accelbyte.sdk.cli.Main session createGameSession \
    --namespace "$AB_NAMESPACE" \
    --resolveMaxActiveSession  \
    --body '{"appName": "LaskNECf", "attributes": {"IST4urt3": {}, "wjWyXckA": {}, "fcnPU7NY": {}}, "autoJoin": true, "backfillTicketID": "NP0ynNCW", "clientVersion": "eVEhonI3", "configurationName": "MhQZGDtD", "customURLGRPC": "QEqOzCUW", "deployment": "h83vp041", "dsSource": "5axUtvTj", "fallbackClaimKeys": ["Occ1dNZ9", "hM2lXrQy", "9scCNKnG"], "inactiveTimeout": 50, "inviteTimeout": 2, "joinability": "INVITE_ONLY", "matchPool": "OJljUiOz", "maxPlayers": 75, "minPlayers": 53, "preferredClaimKeys": ["ws1w87je", "X9LzedHQ", "Qtsqe9Ih"], "requestedRegions": ["mXBwRp0y", "oNujtCnA", "LZjJ5BLM"], "serverName": "Ow0sIcl3", "storage": {"leader": {"qx63JgEP": {}, "rFOiwaHT": {}, "Xvi5ybRh": {}}}, "teams": [{"parties": [{"partyID": "FU3vkNuA", "userIDs": ["ycjBU6ET", "6iMdw2q6", "CGeVOYce"]}, {"partyID": "52Ihrsii", "userIDs": ["NiiWKvHs", "zRFD4Xr1", "sTR5Yrgo"]}, {"partyID": "8BKxX0vh", "userIDs": ["GY7RnGjF", "frwYhkxx", "St3zvONO"]}], "teamID": "2WduRCR0", "userIDs": ["CkKJ2fz5", "WXqGcT3c", "QLJ8cGXD"]}, {"parties": [{"partyID": "GzVIwkc8", "userIDs": ["ormXMECB", "kPXoa2Wt", "XHDLyxGN"]}, {"partyID": "FArSZZ93", "userIDs": ["Hy7iv43y", "vGVBlRgN", "MsUi8h2q"]}, {"partyID": "tXiJ77ju", "userIDs": ["I9pyQW67", "lr9MLvy2", "xAm0eDCe"]}], "teamID": "CAGMcfs5", "userIDs": ["ayXjLvRy", "WWvpdick", "0Pm8npo4"]}, {"parties": [{"partyID": "QuFDxggb", "userIDs": ["b890WIa0", "pShAPG0i", "LzrU6u4J"]}, {"partyID": "9Ztcqq3Q", "userIDs": ["QiT9mC2d", "9QTq1IKq", "YexzIkZQ"]}, {"partyID": "1j0RBGGW", "userIDs": ["HL5XvsM1", "u8vbxXRo", "3uHy5hJi"]}], "teamID": "bYiBMqNY", "userIDs": ["UDOQskBJ", "Ns0BB70D", "bVHI065t"]}], "textChat": false, "textChatMode": "TEAM", "ticketIDs": ["tQLJOI4v", "Xf4EQkn5", "tfDXG1dL"], "tieTeamsSessionLifetime": true, "type": "P2P"}' \
    > test.out 2>&1
eval_tap $? 49 'CreateGameSession' test.out

#- 50 PublicQueryGameSessionsByAttributes
./ng net.accelbyte.sdk.cli.Main session publicQueryGameSessionsByAttributes \
    --namespace "$AB_NAMESPACE" \
    --body '{"LSjCWPSh": {}, "VS4ulQoJ": {}, "9Kd8OOJV": {}}' \
    > test.out 2>&1
eval_tap $? 50 'PublicQueryGameSessionsByAttributes' test.out

#- 51 PublicSessionJoinCode
./ng net.accelbyte.sdk.cli.Main session publicSessionJoinCode \
    --namespace "$AB_NAMESPACE" \
    --body '{"code": "SNohHCan"}' \
    > test.out 2>&1
eval_tap $? 51 'PublicSessionJoinCode' test.out

#- 52 GetGameSessionByPodName
./ng net.accelbyte.sdk.cli.Main session getGameSessionByPodName \
    --namespace "$AB_NAMESPACE" \
    --podName 'CZ8M0k1M' \
    > test.out 2>&1
eval_tap $? 52 'GetGameSessionByPodName' test.out

#- 53 GetGameSession
./ng net.accelbyte.sdk.cli.Main session getGameSession \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'B25JWsWl' \
    > test.out 2>&1
eval_tap $? 53 'GetGameSession' test.out

#- 54 UpdateGameSession
./ng net.accelbyte.sdk.cli.Main session updateGameSession \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'IJpjvmme' \
    --body '{"attributes": {"R3nxCZd9": {}, "Ve9yJSRb": {}, "S31Yk8oE": {}}, "backfillTicketID": "SRXzuJ5Q", "clientVersion": "ZDkZrvlh", "deployment": "Kz2VzoXg", "fallbackClaimKeys": ["RNwkjIB2", "7DdrcFMv", "RRNvxj8j"], "inactiveTimeout": 27, "inviteTimeout": 13, "joinability": "FRIENDS_OF_MEMBERS", "matchPool": "jikCO5YC", "maxPlayers": 54, "minPlayers": 54, "preferredClaimKeys": ["Xr1nCZNJ", "qMv16Gr5", "zcUoUhnY"], "requestedRegions": ["d2D6ScXU", "58rDQrmh", "PG3YgoEt"], "teams": [{"parties": [{"partyID": "pGYnITw5", "userIDs": ["vZHPcPSD", "PiK3rrjM", "FXEb6CLe"]}, {"partyID": "hbTfNrhd", "userIDs": ["MXPdvzbF", "sFECYhGb", "ckaDk542"]}, {"partyID": "rUEVnkQ1", "userIDs": ["pmVxUvtL", "bWNHlyg6", "KJRTc6Cf"]}], "teamID": "AJtx9CoW", "userIDs": ["jdIxSow9", "QoGiepK2", "nW8iI9vj"]}, {"parties": [{"partyID": "lZ6wjAfk", "userIDs": ["6UWkxRsO", "RPIHONXG", "8OGG59Fj"]}, {"partyID": "NCIm8Cze", "userIDs": ["lW6zBBCW", "MDbnfgUZ", "5vkefIH5"]}, {"partyID": "gFYqXoC0", "userIDs": ["0qpwW5f0", "VP2m1eBF", "qfdPC9gi"]}], "teamID": "vM1VhdOu", "userIDs": ["fvJOlulU", "nrewuC8L", "Ka1CBJxr"]}, {"parties": [{"partyID": "1ThzbkSV", "userIDs": ["QxqUo6mj", "qT2OA5J4", "sGvvK2nR"]}, {"partyID": "02v9axv9", "userIDs": ["72t6A7GN", "WQiC46wR", "VYm3Kgpg"]}, {"partyID": "v3rygJ1F", "userIDs": ["3ASLoUYx", "RPyk1Cjs", "KZaWbXQq"]}], "teamID": "euUq7Hyi", "userIDs": ["c5J890Q6", "o76VKxZj", "tfwXLDpG"]}], "ticketIDs": ["xIttHPAi", "S8O6UHP7", "1W42jQAQ"], "tieTeamsSessionLifetime": true, "type": "P2P", "version": 76}' \
    > test.out 2>&1
eval_tap $? 54 'UpdateGameSession' test.out

#- 55 DeleteGameSession
./ng net.accelbyte.sdk.cli.Main session deleteGameSession \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'VNZnv9yQ' \
    > test.out 2>&1
eval_tap $? 55 'DeleteGameSession' test.out

#- 56 PatchUpdateGameSession
./ng net.accelbyte.sdk.cli.Main session patchUpdateGameSession \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'olma2wyj' \
    --body '{"attributes": {"KyvANhbF": {}, "UPX1f3d3": {}, "JHGtfRFd": {}}, "backfillTicketID": "NCbfcLvU", "clientVersion": "PNu0yzAb", "deployment": "Q08ZUdXn", "fallbackClaimKeys": ["G5HNLKhM", "EtG6f5xN", "zMRLlHMN"], "inactiveTimeout": 44, "inviteTimeout": 24, "joinability": "CLOSED", "matchPool": "Q1ul3uzO", "maxPlayers": 33, "minPlayers": 23, "preferredClaimKeys": ["FEC1hYWv", "gvIpMLAY", "S89yv8zq"], "requestedRegions": ["dTzzIJe4", "3ffsuyJs", "J0ttFqO4"], "teams": [{"parties": [{"partyID": "WgVeESVj", "userIDs": ["xXH0WC4o", "x55A1Uyr", "l1Gtwxsp"]}, {"partyID": "cxhmVXcl", "userIDs": ["Rj9rX1f8", "f0P35RIa", "3ih8i06i"]}, {"partyID": "Lu7kFmwY", "userIDs": ["X7a3x9yx", "85oHgaok", "vpsPCje6"]}], "teamID": "BithRPMb", "userIDs": ["9ipV4por", "O9A6P85o", "fYmc2OI3"]}, {"parties": [{"partyID": "WlSYz91Y", "userIDs": ["YowFuSra", "BF8r2adX", "ud7PwkSz"]}, {"partyID": "w40spw9w", "userIDs": ["pUoc4XVt", "QHpNMXrn", "Y7zrEDoy"]}, {"partyID": "tkTPzR0S", "userIDs": ["wPIQTRKP", "wclcj2CN", "oFJsO2ml"]}], "teamID": "7gAOpfdC", "userIDs": ["EnpUnVCU", "Jo983ft0", "owrh2qjx"]}, {"parties": [{"partyID": "AUBPV5qS", "userIDs": ["wAMDSWep", "iEEjsEy0", "ptdRtBv8"]}, {"partyID": "P2eAAgKH", "userIDs": ["najlgX0q", "qNg0nCxz", "cdU2grIf"]}, {"partyID": "3Whd2oIi", "userIDs": ["qWw88ett", "wsgJCUHr", "2QqIBG6R"]}], "teamID": "pPuOZA8x", "userIDs": ["OBhie49E", "w1O57LyM", "RRdtXRfb"]}], "ticketIDs": ["x1GqlsL6", "2zIKRXcK", "GdKiDuUc"], "tieTeamsSessionLifetime": false, "type": "NONE", "version": 27}' \
    > test.out 2>&1
eval_tap $? 56 'PatchUpdateGameSession' test.out

#- 57 UpdateGameSessionBackfillTicketID
./ng net.accelbyte.sdk.cli.Main session updateGameSessionBackfillTicketID \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'Rr1Gnqlp' \
    --body '{"backfillTicketID": "3tO4hnii"}' \
    > test.out 2>&1
eval_tap $? 57 'UpdateGameSessionBackfillTicketID' test.out

#- 58 GameSessionGenerateCode
./ng net.accelbyte.sdk.cli.Main session gameSessionGenerateCode \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'xQnsrFpe' \
    > test.out 2>&1
eval_tap $? 58 'GameSessionGenerateCode' test.out

#- 59 PublicRevokeGameSessionCode
./ng net.accelbyte.sdk.cli.Main session publicRevokeGameSessionCode \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'iHZxEK79' \
    > test.out 2>&1
eval_tap $? 59 'PublicRevokeGameSessionCode' test.out

#- 60 PublicGameSessionInvite
./ng net.accelbyte.sdk.cli.Main session publicGameSessionInvite \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'slyujMFH' \
    --body '{"metadata": {"Ahhe6kTJ": "iTWQqD0v", "zOVVkotz": "96Oc2TVv", "VLUW0Zo0": "YBwIkXm6"}, "platformID": "k1pv1v0S", "userID": "BEFXBFuK"}' \
    > test.out 2>&1
eval_tap $? 60 'PublicGameSessionInvite' test.out

#- 61 JoinGameSession
./ng net.accelbyte.sdk.cli.Main session joinGameSession \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'RQ3Qa4Yl' \
    > test.out 2>&1
eval_tap $? 61 'JoinGameSession' test.out

#- 62 PublicPromoteGameSessionLeader
./ng net.accelbyte.sdk.cli.Main session publicPromoteGameSessionLeader \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'qLTfOveW' \
    --body '{"leaderID": "j1N3gvuL"}' \
    > test.out 2>&1
eval_tap $? 62 'PublicPromoteGameSessionLeader' test.out

#- 63 LeaveGameSession
./ng net.accelbyte.sdk.cli.Main session leaveGameSession \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'z4nyCdmz' \
    > test.out 2>&1
eval_tap $? 63 'LeaveGameSession' test.out

#- 64 PublicKickGameSessionMember
./ng net.accelbyte.sdk.cli.Main session publicKickGameSessionMember \
    --memberId '1ktLMIQu' \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'hJrnHjjd' \
    > test.out 2>&1
eval_tap $? 64 'PublicKickGameSessionMember' test.out

#- 65 PublicGameSessionReject
./ng net.accelbyte.sdk.cli.Main session publicGameSessionReject \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'MAEbKe0w' \
    > test.out 2>&1
eval_tap $? 65 'PublicGameSessionReject' test.out

#- 66 GetSessionServerSecret
./ng net.accelbyte.sdk.cli.Main session getSessionServerSecret \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'CY1W41JO' \
    > test.out 2>&1
eval_tap $? 66 'GetSessionServerSecret' test.out

#- 67 AppendTeamGameSession
eval_tap 0 67 'AppendTeamGameSession # SKIP deprecated' test.out

#- 68 PublicGameSessionCancel
./ng net.accelbyte.sdk.cli.Main session publicGameSessionCancel \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'a2Qjrnlg' \
    --userId '2JCvb3LA' \
    > test.out 2>&1
eval_tap $? 68 'PublicGameSessionCancel' test.out

#- 69 PublicPartyJoinCode
./ng net.accelbyte.sdk.cli.Main session publicPartyJoinCode \
    --namespace "$AB_NAMESPACE" \
    --body '{"code": "xrzf97Ji"}' \
    > test.out 2>&1
eval_tap $? 69 'PublicPartyJoinCode' test.out

#- 70 PublicGetParty
./ng net.accelbyte.sdk.cli.Main session publicGetParty \
    --namespace "$AB_NAMESPACE" \
    --partyId 'eg0y5nni' \
    > test.out 2>&1
eval_tap $? 70 'PublicGetParty' test.out

#- 71 PublicUpdateParty
./ng net.accelbyte.sdk.cli.Main session publicUpdateParty \
    --namespace "$AB_NAMESPACE" \
    --partyId 'Opp8euXl' \
    --body '{"attributes": {"DSAhSLvF": {}, "nnDz3gWI": {}, "KtgdkeDn": {}}, "inactiveTimeout": 15, "inviteTimeout": 2, "joinability": "FRIENDS_OF_LEADER", "maxPlayers": 2, "minPlayers": 77, "type": "P2P", "version": 58}' \
    > test.out 2>&1
eval_tap $? 71 'PublicUpdateParty' test.out

#- 72 PublicPatchUpdateParty
./ng net.accelbyte.sdk.cli.Main session publicPatchUpdateParty \
    --namespace "$AB_NAMESPACE" \
    --partyId 'y2PAmd3Z' \
    --body '{"attributes": {"4Bm8wVmc": {}, "ctffTWiw": {}, "59AayLpp": {}}, "inactiveTimeout": 36, "inviteTimeout": 20, "joinability": "CLOSED", "maxPlayers": 69, "minPlayers": 55, "type": "NONE", "version": 14}' \
    > test.out 2>&1
eval_tap $? 72 'PublicPatchUpdateParty' test.out

#- 73 PublicGeneratePartyCode
./ng net.accelbyte.sdk.cli.Main session publicGeneratePartyCode \
    --namespace "$AB_NAMESPACE" \
    --partyId 'flNBf5eL' \
    > test.out 2>&1
eval_tap $? 73 'PublicGeneratePartyCode' test.out

#- 74 PublicRevokePartyCode
./ng net.accelbyte.sdk.cli.Main session publicRevokePartyCode \
    --namespace "$AB_NAMESPACE" \
    --partyId 'hd7WF0me' \
    > test.out 2>&1
eval_tap $? 74 'PublicRevokePartyCode' test.out

#- 75 PublicPartyInvite
./ng net.accelbyte.sdk.cli.Main session publicPartyInvite \
    --namespace "$AB_NAMESPACE" \
    --partyId 'IqgGLxc5' \
    --body '{"metadata": {"BvQ0JBu4": "7QIyh6a6", "Oy1OSa6x": "vC9Otlol", "C6dSBmPz": "mHiSe4tU"}, "platformID": "n3NgyuFP", "userID": "jjPU4yJi"}' \
    > test.out 2>&1
eval_tap $? 75 'PublicPartyInvite' test.out

#- 76 PublicPromotePartyLeader
./ng net.accelbyte.sdk.cli.Main session publicPromotePartyLeader \
    --namespace "$AB_NAMESPACE" \
    --partyId 'JciN4drZ' \
    --body '{"leaderID": "e9mrXEPf"}' \
    > test.out 2>&1
eval_tap $? 76 'PublicPromotePartyLeader' test.out

#- 77 PublicReadPartySessionStorage
./ng net.accelbyte.sdk.cli.Main session publicReadPartySessionStorage \
    --namespace "$AB_NAMESPACE" \
    --partyId 'YbdjVXyq' \
    > test.out 2>&1
eval_tap $? 77 'PublicReadPartySessionStorage' test.out

#- 78 PublicUpdateInsertPartySessionStorageReserved
./ng net.accelbyte.sdk.cli.Main session publicUpdateInsertPartySessionStorageReserved \
    --namespace "$AB_NAMESPACE" \
    --partyId 'kW0yHlQx' \
    --userId 'xj0aFAs2' \
    --body '{"u1WPooa6": {}, "promN4WU": {}, "eWSBFAtr": {}}' \
    > test.out 2>&1
eval_tap $? 78 'PublicUpdateInsertPartySessionStorageReserved' test.out

#- 79 PublicPartyJoin
./ng net.accelbyte.sdk.cli.Main session publicPartyJoin \
    --namespace "$AB_NAMESPACE" \
    --partyId 'foZ9csjp' \
    > test.out 2>&1
eval_tap $? 79 'PublicPartyJoin' test.out

#- 80 PublicPartyLeave
./ng net.accelbyte.sdk.cli.Main session publicPartyLeave \
    --namespace "$AB_NAMESPACE" \
    --partyId '4efdzVu0' \
    > test.out 2>&1
eval_tap $? 80 'PublicPartyLeave' test.out

#- 81 PublicPartyReject
./ng net.accelbyte.sdk.cli.Main session publicPartyReject \
    --namespace "$AB_NAMESPACE" \
    --partyId '4LTCJ5vW' \
    > test.out 2>&1
eval_tap $? 81 'PublicPartyReject' test.out

#- 82 PublicPartyCancel
./ng net.accelbyte.sdk.cli.Main session publicPartyCancel \
    --namespace "$AB_NAMESPACE" \
    --partyId 'HYtXoE5v' \
    --userId 'etZd0p2e' \
    > test.out 2>&1
eval_tap $? 82 'PublicPartyCancel' test.out

#- 83 PublicPartyKick
./ng net.accelbyte.sdk.cli.Main session publicPartyKick \
    --namespace "$AB_NAMESPACE" \
    --partyId 'GzMaXdAT' \
    --userId 'pGhe0FvP' \
    > test.out 2>&1
eval_tap $? 83 'PublicPartyKick' test.out

#- 84 PublicCreateParty
./ng net.accelbyte.sdk.cli.Main session publicCreateParty \
    --namespace "$AB_NAMESPACE" \
    --body '{"attributes": {"fM9kM6j1": {}, "zbSgYKWf": {}, "aqF6hBvJ": {}}, "configurationName": "EP4WzONg", "inactiveTimeout": 87, "inviteTimeout": 1, "joinability": "OPEN", "maxPlayers": 66, "members": [{"ID": "qF7vIS4o", "PlatformID": "xcHvO27i", "PlatformUserID": "NaXMUS6f"}, {"ID": "qxXIng2v", "PlatformID": "tAEpYEil", "PlatformUserID": "P1ZHrlzx"}, {"ID": "rIxCMixO", "PlatformID": "vI9LlkmC", "PlatformUserID": "rVhcTLpU"}], "minPlayers": 61, "textChat": true, "type": "DS"}' \
    > test.out 2>&1
eval_tap $? 84 'PublicCreateParty' test.out

#- 85 PublicGetRecentPlayer
./ng net.accelbyte.sdk.cli.Main session publicGetRecentPlayer \
    --namespace "$AB_NAMESPACE" \
    --limit '23' \
    > test.out 2>&1
eval_tap $? 85 'PublicGetRecentPlayer' test.out

#- 86 PublicGetRecentTeamPlayer
./ng net.accelbyte.sdk.cli.Main session publicGetRecentTeamPlayer \
    --namespace "$AB_NAMESPACE" \
    --limit '21' \
    > test.out 2>&1
eval_tap $? 86 'PublicGetRecentTeamPlayer' test.out

#- 87 PublicUpdateInsertSessionStorageLeader
./ng net.accelbyte.sdk.cli.Main session publicUpdateInsertSessionStorageLeader \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'H2kDyxEN' \
    --body '{"7yTxBUXy": {}, "h2vjbqGL": {}, "Gf6H1B8D": {}}' \
    > test.out 2>&1
eval_tap $? 87 'PublicUpdateInsertSessionStorageLeader' test.out

#- 88 PublicUpdateInsertSessionStorage
./ng net.accelbyte.sdk.cli.Main session publicUpdateInsertSessionStorage \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'cDD1SLUS' \
    --userId '5oAtNdIA' \
    --body '{"iS8pGEIb": {}, "1cSNVkMr": {}, "RvmRJ7x9": {}}' \
    > test.out 2>&1
eval_tap $? 88 'PublicUpdateInsertSessionStorage' test.out

#- 89 PublicGetBulkPlayerCurrentPlatform
./ng net.accelbyte.sdk.cli.Main session publicGetBulkPlayerCurrentPlatform \
    --namespace "$AB_NAMESPACE" \
    --body '{"userIDs": ["SNkHUDhe", "jBs3Qku6", "fFtXJQO6"]}' \
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
    --body '{"crossplayEnabled": false, "currentPlatform": "UtTHN4Tm", "data": {"cYSGEOO2": {}, "PgrR5CEv": {}, "Fu12Ikz5": {}}, "platforms": [{"name": "1BYyOKFD", "userID": "rQ3TTNkd"}, {"name": "SXq07kNn", "userID": "jKm2o0b1"}, {"name": "kaQsEwxM", "userID": "BgRv33GC"}], "roles": ["FJ161AZL", "LJbSbBLp", "CAubfKn6"], "simultaneousPlatform": "ShV7qKvc"}' \
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
    --order '3EnhU3Kn' \
    --orderBy 'F7JDnrKa' \
    --status 'y6PDpV66' \
    > test.out 2>&1
eval_tap $? 93 'PublicQueryMyGameSessions' test.out

#- 94 PublicQueryMyParties
./ng net.accelbyte.sdk.cli.Main session publicQueryMyParties \
    --namespace "$AB_NAMESPACE" \
    --order 'HzwSDFhd' \
    --orderBy '2mLowbWC' \
    --status 'xOWMThJR' \
    > test.out 2>&1
eval_tap $? 94 'PublicQueryMyParties' test.out


rm -f "tmp.dat"

exit $EXIT_CODE