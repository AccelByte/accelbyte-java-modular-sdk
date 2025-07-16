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
    --body '{"metricExcludedNamespaces": ["nNog9FN3", "D68tvBEy", "5e23pYtp"], "regionRetryMapping": {"5m6YxuXn": ["EIapK8Wo", "fzqGmYrT", "SvlXjPyT"], "OIeZKEBh": ["6U8BUpXO", "gqTYmp7X", "MwVJp7O8"], "rLgN629h": ["GKMt8js6", "LtM1s8zH", "mQkHco0q"]}, "regionURLMapping": ["qgNlo4Wg", "V9BK9KMz", "kCLk7Kdm"], "testGameMode": "Y2i5sKpd", "testRegionURLMapping": ["bgqAXWSQ", "b6e4E2Tf", "mgE8VG9c"], "testTargetUserIDs": ["FdkE81qi", "AMTN9XPm", "E1cf78CZ"]}' \
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
    --body '{"durationDays": 21}' \
    > test.out 2>&1
eval_tap $? 12 'AdminUpdateConfigurationAlertV1' test.out

#- 13 AdminCreateConfigurationAlertV1
./ng net.accelbyte.sdk.cli.Main session adminCreateConfigurationAlertV1 \
    --namespace "$AB_NAMESPACE" \
    --body '{"durationDays": 78}' \
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
    --body '{"NativeSessionSetting": {"PSNDisableSystemUIMenu": ["UPDATE_INVITABLE_USER_TYPE", "KICK", "UPDATE_JOINABLE_USER_TYPE"], "PSNServiceLabel": 40, "PSNSupportedPlatforms": ["926w67Ss", "44nwq88E", "VA558wrX"], "SessionTitle": "RIzfsRkg", "ShouldSync": false, "XboxAllowCrossPlatform": false, "XboxSandboxID": "hfewvmuW", "XboxServiceConfigID": "WgBEpWAw", "XboxSessionTemplateName": "PPla0KYh", "XboxTitleID": "NUGb6OUA", "localizedSessionName": {"oNc31Rez": {}, "Kiiuh4fB": {}, "410tJ3hC": {}}}, "PSNBaseUrl": "IT9mf2Cv", "amsClaimTimeoutMinutes": 61, "appName": "WlyUhWbo", "asyncProcessDSRequest": {"async": true, "timeout": 22}, "attributes": {"EHD1uesa": {}, "hLuVyiLZ": {}, "TesoYy3T": {}}, "autoJoin": false, "autoLeaveSession": false, "clientVersion": "dB51fGSK", "customURLGRPC": "n7hpBbna", "deployment": "V4Ud6Z7a", "disableCodeGeneration": true, "disableResendInvite": false, "dsManualSetReady": false, "dsSource": "kjt4g5eh", "enableSecret": true, "fallbackClaimKeys": ["7n73Vgp6", "kfmhYQ3B", "fsqLf72k"], "grpcSessionConfig": {"appName": "GaEWjSZ6", "customURL": "seS7PkRp", "functionFlag": 9}, "immutableStorage": false, "inactiveTimeout": 62, "inviteTimeout": 99, "joinability": "INVITE_ONLY", "leaderElectionGracePeriod": 56, "manualRejoin": true, "maxActiveSessions": 60, "maxPlayers": 75, "minPlayers": 40, "name": "P3WtFVPB", "persistent": true, "preferredClaimKeys": ["xXkTQ3XL", "rCaUisGm", "1gpjUeAW"], "requestedRegions": ["SFi7o8IN", "lQtfQGUm", "53CsgmXB"], "textChat": true, "textChatMode": "NONE", "tieTeamsSessionLifetime": false, "ttlHours": 50, "type": "DS"}' \
    > test.out 2>&1
eval_tap $? 16 'AdminCreateConfigurationTemplateV1' test.out

#- 17 AdminGetAllConfigurationTemplatesV1
./ng net.accelbyte.sdk.cli.Main session adminGetAllConfigurationTemplatesV1 \
    --namespace "$AB_NAMESPACE" \
    --limit '19' \
    --name 'QZjBRdnQ' \
    --offset '100' \
    --order 'AOWaYbRR' \
    --orderBy 'rNjKP3H6' \
    > test.out 2>&1
eval_tap $? 17 'AdminGetAllConfigurationTemplatesV1' test.out

#- 18 AdminGetConfigurationTemplateV1
./ng net.accelbyte.sdk.cli.Main session adminGetConfigurationTemplateV1 \
    --name '43VKhGsW' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 18 'AdminGetConfigurationTemplateV1' test.out

#- 19 AdminUpdateConfigurationTemplateV1
./ng net.accelbyte.sdk.cli.Main session adminUpdateConfigurationTemplateV1 \
    --name 'Gdpt5tZ4' \
    --namespace "$AB_NAMESPACE" \
    --body '{"NativeSessionSetting": {"PSNDisableSystemUIMenu": ["UPDATE_INVITABLE_USER_TYPE", "UPDATE_JOINABLE_USER_TYPE", "UPDATE_INVITABLE_USER_TYPE"], "PSNServiceLabel": 37, "PSNSupportedPlatforms": ["Qnn0J5wN", "IPz4r0Ew", "Ya7TwerK"], "SessionTitle": "618Tki8q", "ShouldSync": true, "XboxAllowCrossPlatform": false, "XboxSandboxID": "H35FOdOq", "XboxServiceConfigID": "vvloUxaW", "XboxSessionTemplateName": "Ix35eTFA", "XboxTitleID": "Y9qludKU", "localizedSessionName": {"wNUoxalw": {}, "mx7wTE7A": {}, "C1jXqjPl": {}}}, "PSNBaseUrl": "4ZwbyFbM", "amsClaimTimeoutMinutes": 2, "appName": "GHcVFb6P", "asyncProcessDSRequest": {"async": false, "timeout": 83}, "attributes": {"sc2uGLCz": {}, "rdsN35cq": {}, "yrORh8gU": {}}, "autoJoin": false, "autoLeaveSession": false, "clientVersion": "hJjIYKoT", "customURLGRPC": "9jKuUsM5", "deployment": "14NTqUgr", "disableCodeGeneration": false, "disableResendInvite": false, "dsManualSetReady": true, "dsSource": "0pXkaO0w", "enableSecret": false, "fallbackClaimKeys": ["cDJ7ZGUT", "rnYfQN5k", "fYdfVDDn"], "grpcSessionConfig": {"appName": "Jl9zxRcn", "customURL": "8Jw9q98P", "functionFlag": 95}, "immutableStorage": false, "inactiveTimeout": 75, "inviteTimeout": 15, "joinability": "OPEN", "leaderElectionGracePeriod": 77, "manualRejoin": true, "maxActiveSessions": 68, "maxPlayers": 100, "minPlayers": 10, "name": "N3qkLElt", "persistent": false, "preferredClaimKeys": ["2V0WcfsN", "PZBbLd8M", "oB9zornW"], "requestedRegions": ["YUELQpEl", "HHNiRgXS", "MCoqTYbJ"], "textChat": false, "textChatMode": "TEAM", "tieTeamsSessionLifetime": true, "ttlHours": 65, "type": "P2P"}' \
    > test.out 2>&1
eval_tap $? 19 'AdminUpdateConfigurationTemplateV1' test.out

#- 20 AdminDeleteConfigurationTemplateV1
./ng net.accelbyte.sdk.cli.Main session adminDeleteConfigurationTemplateV1 \
    --name 'Z2qDNUsI' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 20 'AdminDeleteConfigurationTemplateV1' test.out

#- 21 AdminGetMemberActiveSession
./ng net.accelbyte.sdk.cli.Main session adminGetMemberActiveSession \
    --name '5YT0at8Y' \
    --namespace "$AB_NAMESPACE" \
    --userId 'XebmG2Aw' \
    > test.out 2>&1
eval_tap $? 21 'AdminGetMemberActiveSession' test.out

#- 22 AdminReconcileMaxActiveSession
./ng net.accelbyte.sdk.cli.Main session adminReconcileMaxActiveSession \
    --name 'xvx6niW1' \
    --namespace "$AB_NAMESPACE" \
    --body '{"userID": "K90oErcr"}' \
    > test.out 2>&1
eval_tap $? 22 'AdminReconcileMaxActiveSession' test.out

#- 23 AdminGetDSMCConfiguration
eval_tap 0 23 'AdminGetDSMCConfiguration # SKIP deprecated' test.out

#- 24 AdminSyncDSMCConfiguration
eval_tap 0 24 'AdminSyncDSMCConfiguration # SKIP deprecated' test.out

#- 25 AdminQueryGameSessions
./ng net.accelbyte.sdk.cli.Main session adminQueryGameSessions \
    --namespace "$AB_NAMESPACE" \
    --configurationName 'xu6SXdjb' \
    --dsPodName '6au1rQ64' \
    --fromTime 'kyILn4i0' \
    --gameMode 'dAXDBHiN' \
    --isPersistent '6u8dHPSm' \
    --isSoftDeleted 'lVvxxb13' \
    --joinability 'FRIENDS_OF_MEMBERS' \
    --limit '40' \
    --matchPool 'ZoUZJJIE' \
    --memberID 'QaVYQSOO' \
    --offset '31' \
    --order 'rqmbLERW' \
    --orderBy 'PaFnLJay' \
    --sessionID 'MM4tyJce' \
    --status 'FAILED_TO_REQUEST' \
    --statusV2 'DS_ERROR' \
    --toTime 'S0SSAelr' \
    > test.out 2>&1
eval_tap $? 25 'AdminQueryGameSessions' test.out

#- 26 AdminQueryGameSessionsByAttributes
./ng net.accelbyte.sdk.cli.Main session adminQueryGameSessionsByAttributes \
    --namespace "$AB_NAMESPACE" \
    --body '{"Hn0ry795": {}, "ybhFcTmD": {}, "G8nbpgdk": {}}' \
    > test.out 2>&1
eval_tap $? 26 'AdminQueryGameSessionsByAttributes' test.out

#- 27 AdminDeleteBulkGameSessions
./ng net.accelbyte.sdk.cli.Main session adminDeleteBulkGameSessions \
    --namespace "$AB_NAMESPACE" \
    --body '{"ids": ["VG3WsUAR", "E63stFt9", "GAWq9i4c"]}' \
    > test.out 2>&1
eval_tap $? 27 'AdminDeleteBulkGameSessions' test.out

#- 28 AdminSetDSReady
./ng net.accelbyte.sdk.cli.Main session adminSetDSReady \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'BBnIrihE' \
    --body '{"ready": false}' \
    > test.out 2>&1
eval_tap $? 28 'AdminSetDSReady' test.out

#- 29 AdminUpdateDSInformation
./ng net.accelbyte.sdk.cli.Main session adminUpdateDSInformation \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'ItxmPGg7' \
    --body '{"createdRegion": "kxDAkUij", "deployment": "UsNlRakc", "description": "MOAyuZgR", "ip": "t9WqnkPz", "port": 85, "region": "oUNPwS3k", "serverId": "YY0ZvFgY", "source": "2PAH9igF", "status": "H2mM2zqm"}' \
    > test.out 2>&1
eval_tap $? 29 'AdminUpdateDSInformation' test.out

#- 30 AdminKickGameSessionMember
./ng net.accelbyte.sdk.cli.Main session adminKickGameSessionMember \
    --memberId '2kOQ2HV8' \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'J0bM3znO' \
    > test.out 2>&1
eval_tap $? 30 'AdminKickGameSessionMember' test.out

#- 31 AdminUpdateGameSessionMember
./ng net.accelbyte.sdk.cli.Main session adminUpdateGameSessionMember \
    --memberId 'Lq39BIjZ' \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'NfznAQ6k' \
    --statusType 'rpuoTm7b' \
    > test.out 2>&1
eval_tap $? 31 'AdminUpdateGameSessionMember' test.out

#- 32 AdminGetListNativeSession
./ng net.accelbyte.sdk.cli.Main session adminGetListNativeSession \
    --namespace "$AB_NAMESPACE" \
    --limit '63' \
    --offset '22' \
    --order 'Z9dsGDQd' \
    > test.out 2>&1
eval_tap $? 32 'AdminGetListNativeSession' test.out

#- 33 AdminQueryParties
./ng net.accelbyte.sdk.cli.Main session adminQueryParties \
    --namespace "$AB_NAMESPACE" \
    --configurationName 'Vr5YqsVq' \
    --fromTime 'lxNYlNe7' \
    --isSoftDeleted 'Z0CF0PAh' \
    --joinability 'FRIENDS_OF_MEMBERS' \
    --key 'vAEcYAVb' \
    --leaderID '0zvBzvAy' \
    --limit '9' \
    --memberID 'FfDiw79Z' \
    --memberStatus 'CONNECTED' \
    --offset '11' \
    --order 'z868wByV' \
    --orderBy '0EREX7pt' \
    --partyID 'aJdx8zWb' \
    --toTime 'bbWJRCZQ' \
    --value 'aQhliLCE' \
    > test.out 2>&1
eval_tap $? 33 'AdminQueryParties' test.out

#- 34 AdminDeleteBulkParties
./ng net.accelbyte.sdk.cli.Main session adminDeleteBulkParties \
    --namespace "$AB_NAMESPACE" \
    --body '{"ids": ["VsIRS3Fz", "ocIwgemC", "ke3HLAFr"]}' \
    > test.out 2>&1
eval_tap $? 34 'AdminDeleteBulkParties' test.out

#- 35 AdminReadPartySessionStorage
./ng net.accelbyte.sdk.cli.Main session adminReadPartySessionStorage \
    --namespace "$AB_NAMESPACE" \
    --partyId 'LZLxrw7S' \
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
    --body '{"psn": {"clientId": "M9iVGFVP", "clientSecret": "iw867rJZ", "scope": "X9KzhrHO"}}' \
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
    --platformId 'PSN' \
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
    --limit '21' \
    --userId 'iRi51zKI' \
    > test.out 2>&1
eval_tap $? 41 'AdminGetRecentPlayer' test.out

#- 42 AdminGetRecentTeamPlayer
./ng net.accelbyte.sdk.cli.Main session adminGetRecentTeamPlayer \
    --namespace "$AB_NAMESPACE" \
    --limit '97' \
    --userId '0Nhqcq5n' \
    > test.out 2>&1
eval_tap $? 42 'AdminGetRecentTeamPlayer' test.out

#- 43 AdminReadSessionStorage
./ng net.accelbyte.sdk.cli.Main session adminReadSessionStorage \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'NVSFrqO0' \
    > test.out 2>&1
eval_tap $? 43 'AdminReadSessionStorage' test.out

#- 44 AdminDeleteUserSessionStorage
./ng net.accelbyte.sdk.cli.Main session adminDeleteUserSessionStorage \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'ZZVmlmF4' \
    > test.out 2>&1
eval_tap $? 44 'AdminDeleteUserSessionStorage' test.out

#- 45 AdminReadUserSessionStorage
./ng net.accelbyte.sdk.cli.Main session adminReadUserSessionStorage \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'sVfWlp6S' \
    --userId 'cY9tuHWH' \
    > test.out 2>&1
eval_tap $? 45 'AdminReadUserSessionStorage' test.out

#- 46 AdminQueryPlayerAttributes
./ng net.accelbyte.sdk.cli.Main session adminQueryPlayerAttributes \
    --namespace "$AB_NAMESPACE" \
    --users '89qQwLSP' \
    > test.out 2>&1
eval_tap $? 46 'AdminQueryPlayerAttributes' test.out

#- 47 AdminGetPlayerAttributes
./ng net.accelbyte.sdk.cli.Main session adminGetPlayerAttributes \
    --namespace "$AB_NAMESPACE" \
    --userId 'cmISk4FG' \
    > test.out 2>&1
eval_tap $? 47 'AdminGetPlayerAttributes' test.out

#- 48 AdminSyncNativeSession
./ng net.accelbyte.sdk.cli.Main session adminSyncNativeSession \
    --namespace "$AB_NAMESPACE" \
    --userId 'j3TVfbvi' \
    > test.out 2>&1
eval_tap $? 48 'AdminSyncNativeSession' test.out

#- 49 CreateGameSession
./ng net.accelbyte.sdk.cli.Main session createGameSession \
    --namespace "$AB_NAMESPACE" \
    --resolveMaxActiveSession  \
    --body '{"appName": "EMkZMGe0", "attributes": {"WkxHi6oB": {}, "zbryDNMS": {}, "jNcdQWaJ": {}}, "autoJoin": false, "backfillTicketID": "FW8Wd9OK", "clientVersion": "pr5XyzFk", "configurationName": "Di0cpJdX", "customURLGRPC": "Md1tBYpU", "deployment": "qcFjJD0S", "dsSource": "FZ6Yu6zL", "fallbackClaimKeys": ["XvZ5Vyqe", "GYps0RBM", "ylw5VvKb"], "inactiveTimeout": 79, "inviteTimeout": 6, "joinability": "FRIENDS_OF_MEMBERS", "matchPool": "YmlwzqIa", "maxPlayers": 62, "minPlayers": 80, "preferredClaimKeys": ["MRzz7rLq", "CIkeMpPu", "5Kfdt1ZA"], "requestedRegions": ["wcPmd4tp", "0VajGdfW", "81VKjgNy"], "serverName": "UTltA9Ap", "storage": {"leader": {"Yofiooj5": {}, "DdLbxez8": {}, "Xcz3v7zS": {}}}, "teams": [{"parties": [{"partyID": "SUjp1cDS", "userIDs": ["JiSvOYK8", "wFLxtdlc", "rrEDOizY"]}, {"partyID": "TNalGBCZ", "userIDs": ["hWsq8L65", "jE8QIEoM", "O3fY5HIr"]}, {"partyID": "gOOgIde2", "userIDs": ["oCGDJSFD", "gcqlYXIu", "UKsHqBsF"]}], "teamID": "kfyRqqqa", "userIDs": ["JGrLxbLC", "JNWpbpWf", "6bohT7yl"]}, {"parties": [{"partyID": "QpG12fj7", "userIDs": ["xHl7bkIv", "gRSkdO68", "e8lceG5K"]}, {"partyID": "OFAT2cJ9", "userIDs": ["mJCQf44G", "S3vTRP5v", "GOtVBndj"]}, {"partyID": "CGUHGhHD", "userIDs": ["uWhXokdz", "PTEjvkb4", "9vWZZ6nV"]}], "teamID": "ia2W1jkm", "userIDs": ["taJMFeof", "bC6lgiz2", "sNNtWgrg"]}, {"parties": [{"partyID": "Vr9XBeL7", "userIDs": ["WkSwBFKy", "8llUe78s", "owRlQ9M0"]}, {"partyID": "3N9p8uSN", "userIDs": ["1BUgaP5U", "LVSvQJT3", "v24XR0v4"]}, {"partyID": "badYXMX4", "userIDs": ["9vhSMj3o", "ywqETjOP", "BvQCexkj"]}], "teamID": "tgUuw5Zb", "userIDs": ["aL8H2Hzs", "lhOuUSVt", "7L4VsgQc"]}], "textChat": false, "textChatMode": "TEAM", "ticketIDs": ["9z5UajLw", "KrZqm0Yk", "trwzpfly"], "tieTeamsSessionLifetime": true, "type": "P2P"}' \
    > test.out 2>&1
eval_tap $? 49 'CreateGameSession' test.out

#- 50 PublicQueryGameSessionsByAttributes
./ng net.accelbyte.sdk.cli.Main session publicQueryGameSessionsByAttributes \
    --namespace "$AB_NAMESPACE" \
    --body '{"WDzTJFRk": {}, "bfCO4cQ1": {}, "nNECpWQM": {}}' \
    > test.out 2>&1
eval_tap $? 50 'PublicQueryGameSessionsByAttributes' test.out

#- 51 PublicSessionJoinCode
./ng net.accelbyte.sdk.cli.Main session publicSessionJoinCode \
    --namespace "$AB_NAMESPACE" \
    --body '{"code": "AubdrarT"}' \
    > test.out 2>&1
eval_tap $? 51 'PublicSessionJoinCode' test.out

#- 52 GetGameSessionByPodName
./ng net.accelbyte.sdk.cli.Main session getGameSessionByPodName \
    --namespace "$AB_NAMESPACE" \
    --podName 'sd0deSNX' \
    > test.out 2>&1
eval_tap $? 52 'GetGameSessionByPodName' test.out

#- 53 GetGameSession
./ng net.accelbyte.sdk.cli.Main session getGameSession \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'e3Hvu7B4' \
    > test.out 2>&1
eval_tap $? 53 'GetGameSession' test.out

#- 54 UpdateGameSession
./ng net.accelbyte.sdk.cli.Main session updateGameSession \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'tV3Y1K1z' \
    --body '{"attributes": {"Z19KO8wq": {}, "ii6XyePo": {}, "7W1q2K8l": {}}, "backfillTicketID": "ZRaqOx8A", "clientVersion": "ttyb4S6S", "deployment": "8KhWAZy7", "fallbackClaimKeys": ["Y6uYlH18", "5cJ0CuUL", "bhJLRfrX"], "inactiveTimeout": 90, "inviteTimeout": 60, "joinability": "INVITE_ONLY", "matchPool": "S9Lt6CGQ", "maxPlayers": 56, "minPlayers": 16, "preferredClaimKeys": ["fW6SjFeV", "gT3b2fEq", "er712JLX"], "requestedRegions": ["7p77qUKj", "fubS3mS8", "CrTyWJ8G"], "teams": [{"parties": [{"partyID": "G8y2TuKh", "userIDs": ["2YwqvbgO", "MMCrHxww", "PKrgt7DM"]}, {"partyID": "93KJnyc4", "userIDs": ["E6BBixCB", "xufjW6Fo", "caS2ecJN"]}, {"partyID": "i9S248uV", "userIDs": ["7o1OlerF", "SVI0QPWs", "eAZ9isVA"]}], "teamID": "sxqh0APb", "userIDs": ["GQrj3Kse", "iGFU9MeE", "0imZ78PI"]}, {"parties": [{"partyID": "HZuvBzcI", "userIDs": ["UxLaKBnz", "H98URHkr", "8c1KMVKm"]}, {"partyID": "2tkS6mgT", "userIDs": ["fwO2x1AR", "U3CMZ8GL", "8pvwpBJw"]}, {"partyID": "cFtDhDyz", "userIDs": ["IfWUdSlZ", "LqHCvOBA", "QyXlsDAu"]}], "teamID": "9SJBlKyV", "userIDs": ["D9bbfoKt", "hYWWhmTP", "mqjxrsvg"]}, {"parties": [{"partyID": "0VuKkiig", "userIDs": ["FuH5n7y0", "hjXCnAfw", "CyT6pMlz"]}, {"partyID": "wbtC1Mje", "userIDs": ["HikezJSm", "cekBYfT6", "vnEk247L"]}, {"partyID": "CzVMh8wT", "userIDs": ["A33gPkY8", "pwqoz1XC", "GUQWroDZ"]}], "teamID": "wPLSVe5h", "userIDs": ["rOwfY5I3", "Y5OfaWWX", "LLIn6Qy5"]}], "ticketIDs": ["rj751Qpi", "Kdo3ZSdv", "YgCjSUXS"], "tieTeamsSessionLifetime": false, "type": "NONE", "version": 74}' \
    > test.out 2>&1
eval_tap $? 54 'UpdateGameSession' test.out

#- 55 DeleteGameSession
./ng net.accelbyte.sdk.cli.Main session deleteGameSession \
    --namespace "$AB_NAMESPACE" \
    --sessionId '8pc4LoUk' \
    > test.out 2>&1
eval_tap $? 55 'DeleteGameSession' test.out

#- 56 PatchUpdateGameSession
./ng net.accelbyte.sdk.cli.Main session patchUpdateGameSession \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'UtHDRqZP' \
    --body '{"attributes": {"MUAHJ1pW": {}, "hOE3r3Mz": {}, "U02cDZlQ": {}}, "backfillTicketID": "3divrchL", "clientVersion": "0tflYcun", "deployment": "TzyGx7kL", "fallbackClaimKeys": ["4GlkMRw8", "uH37GBHm", "V2webyum"], "inactiveTimeout": 85, "inviteTimeout": 99, "joinability": "FRIENDS_OF_FRIENDS", "matchPool": "gYeU4dMj", "maxPlayers": 24, "minPlayers": 54, "preferredClaimKeys": ["KlMOEqdg", "XORkby1u", "t5apte8z"], "requestedRegions": ["ddieWdlu", "R3jwWUFu", "1uKXIt1s"], "teams": [{"parties": [{"partyID": "m26boCBX", "userIDs": ["r2gyxuNw", "feYrF5nR", "fwmZjggT"]}, {"partyID": "X6F7B5tP", "userIDs": ["Qo1m0yo0", "G0s1fF1S", "CqXiEKCO"]}, {"partyID": "6iGMSaM2", "userIDs": ["AC8HMk7f", "JBXxaO8z", "go5e5LaW"]}], "teamID": "4MjoCjkD", "userIDs": ["nUdV3GBa", "1LGFJDnL", "cxzjeUZf"]}, {"parties": [{"partyID": "s3H5iMBv", "userIDs": ["Uy2gHH9B", "c8etb2Wq", "DlqXXf50"]}, {"partyID": "jLoIjDPT", "userIDs": ["zIIgoy1f", "80sLxFDQ", "rhk1wXNT"]}, {"partyID": "RUL2RLBq", "userIDs": ["m9FN38kd", "P3lRAknc", "okWpFUrt"]}], "teamID": "SLDSXlBL", "userIDs": ["1wfNZRU9", "Fmswn1cd", "w2XyyQwW"]}, {"parties": [{"partyID": "2Uu3B1r6", "userIDs": ["XZ1K9ZKL", "vbGVY6Se", "TmDuPbVx"]}, {"partyID": "y7ixryZd", "userIDs": ["rFBHFf4l", "41LpM1JA", "cBZUJNWP"]}, {"partyID": "QNgkCu0f", "userIDs": ["ANWziHC9", "Wfq8J3jV", "DKSFCuRz"]}], "teamID": "6zXOAM6c", "userIDs": ["5tUd24EK", "Uv2JWZnq", "18kjOZPA"]}], "ticketIDs": ["W6KWg0JZ", "lMt2Kd1L", "OXd1ZluY"], "tieTeamsSessionLifetime": false, "type": "NONE", "version": 63}' \
    > test.out 2>&1
eval_tap $? 56 'PatchUpdateGameSession' test.out

#- 57 UpdateGameSessionBackfillTicketID
./ng net.accelbyte.sdk.cli.Main session updateGameSessionBackfillTicketID \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'HV8THMl0' \
    --body '{"backfillTicketID": "AlOBxMO7"}' \
    > test.out 2>&1
eval_tap $? 57 'UpdateGameSessionBackfillTicketID' test.out

#- 58 GameSessionGenerateCode
./ng net.accelbyte.sdk.cli.Main session gameSessionGenerateCode \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'OIUs291d' \
    > test.out 2>&1
eval_tap $? 58 'GameSessionGenerateCode' test.out

#- 59 PublicRevokeGameSessionCode
./ng net.accelbyte.sdk.cli.Main session publicRevokeGameSessionCode \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'l8ocOIfm' \
    > test.out 2>&1
eval_tap $? 59 'PublicRevokeGameSessionCode' test.out

#- 60 PublicGameSessionInvite
./ng net.accelbyte.sdk.cli.Main session publicGameSessionInvite \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'PeoQIgeZ' \
    --body '{"metadata": {"dJDWF27e": "ONBUUBpT", "isaY0uMj": "vG6FtOJn", "4GKWxLaB": "ueeXdN5g"}, "platformID": "Q26HORFj", "userID": "oKQeAus3"}' \
    > test.out 2>&1
eval_tap $? 60 'PublicGameSessionInvite' test.out

#- 61 JoinGameSession
./ng net.accelbyte.sdk.cli.Main session joinGameSession \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'szGNKkwg' \
    > test.out 2>&1
eval_tap $? 61 'JoinGameSession' test.out

#- 62 PublicPromoteGameSessionLeader
./ng net.accelbyte.sdk.cli.Main session publicPromoteGameSessionLeader \
    --namespace "$AB_NAMESPACE" \
    --sessionId '9J0XRtOi' \
    --body '{"leaderID": "XqVurpno"}' \
    > test.out 2>&1
eval_tap $? 62 'PublicPromoteGameSessionLeader' test.out

#- 63 LeaveGameSession
./ng net.accelbyte.sdk.cli.Main session leaveGameSession \
    --namespace "$AB_NAMESPACE" \
    --sessionId '4GlafGUl' \
    > test.out 2>&1
eval_tap $? 63 'LeaveGameSession' test.out

#- 64 PublicKickGameSessionMember
./ng net.accelbyte.sdk.cli.Main session publicKickGameSessionMember \
    --memberId 'hWoBlKbf' \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'HUZFsHgO' \
    > test.out 2>&1
eval_tap $? 64 'PublicKickGameSessionMember' test.out

#- 65 PublicGameSessionReject
./ng net.accelbyte.sdk.cli.Main session publicGameSessionReject \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'UTd90lf9' \
    > test.out 2>&1
eval_tap $? 65 'PublicGameSessionReject' test.out

#- 66 GetSessionServerSecret
./ng net.accelbyte.sdk.cli.Main session getSessionServerSecret \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'lIw0PEYn' \
    > test.out 2>&1
eval_tap $? 66 'GetSessionServerSecret' test.out

#- 67 AppendTeamGameSession
eval_tap 0 67 'AppendTeamGameSession # SKIP deprecated' test.out

#- 68 PublicGameSessionCancel
./ng net.accelbyte.sdk.cli.Main session publicGameSessionCancel \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'aabQaDZ6' \
    --userId 'FEJspF1I' \
    > test.out 2>&1
eval_tap $? 68 'PublicGameSessionCancel' test.out

#- 69 PublicPartyJoinCode
./ng net.accelbyte.sdk.cli.Main session publicPartyJoinCode \
    --namespace "$AB_NAMESPACE" \
    --body '{"code": "y9vwa646"}' \
    > test.out 2>&1
eval_tap $? 69 'PublicPartyJoinCode' test.out

#- 70 PublicGetParty
./ng net.accelbyte.sdk.cli.Main session publicGetParty \
    --namespace "$AB_NAMESPACE" \
    --partyId 'Tq3dr0xR' \
    > test.out 2>&1
eval_tap $? 70 'PublicGetParty' test.out

#- 71 PublicUpdateParty
./ng net.accelbyte.sdk.cli.Main session publicUpdateParty \
    --namespace "$AB_NAMESPACE" \
    --partyId 'klpaNWaL' \
    --body '{"attributes": {"bLWkL82Q": {}, "3DyQRw0x": {}, "H2q8iNL8": {}}, "inactiveTimeout": 80, "inviteTimeout": 26, "joinability": "OPEN", "maxPlayers": 45, "minPlayers": 21, "type": "DS", "version": 36}' \
    > test.out 2>&1
eval_tap $? 71 'PublicUpdateParty' test.out

#- 72 PublicPatchUpdateParty
./ng net.accelbyte.sdk.cli.Main session publicPatchUpdateParty \
    --namespace "$AB_NAMESPACE" \
    --partyId 'jMYVgo86' \
    --body '{"attributes": {"POsqGiqC": {}, "RkjnTXO7": {}, "bz3vhkAU": {}}, "inactiveTimeout": 41, "inviteTimeout": 50, "joinability": "FRIENDS_OF_LEADER", "maxPlayers": 93, "minPlayers": 53, "type": "DS", "version": 72}' \
    > test.out 2>&1
eval_tap $? 72 'PublicPatchUpdateParty' test.out

#- 73 PublicGeneratePartyCode
./ng net.accelbyte.sdk.cli.Main session publicGeneratePartyCode \
    --namespace "$AB_NAMESPACE" \
    --partyId '13qRDXwb' \
    > test.out 2>&1
eval_tap $? 73 'PublicGeneratePartyCode' test.out

#- 74 PublicRevokePartyCode
./ng net.accelbyte.sdk.cli.Main session publicRevokePartyCode \
    --namespace "$AB_NAMESPACE" \
    --partyId 'GHxFHPkP' \
    > test.out 2>&1
eval_tap $? 74 'PublicRevokePartyCode' test.out

#- 75 PublicPartyInvite
./ng net.accelbyte.sdk.cli.Main session publicPartyInvite \
    --namespace "$AB_NAMESPACE" \
    --partyId 'G2ap5TJ0' \
    --body '{"metadata": {"Aun9nLaX": "pL6xUj6K", "Zl8rRp8R": "9GQC4cDH", "CzeyAsXd": "PbPIi49A"}, "platformID": "OAhMdp9K", "userID": "GCIH9AVx"}' \
    > test.out 2>&1
eval_tap $? 75 'PublicPartyInvite' test.out

#- 76 PublicPromotePartyLeader
./ng net.accelbyte.sdk.cli.Main session publicPromotePartyLeader \
    --namespace "$AB_NAMESPACE" \
    --partyId '2Sn9NFBF' \
    --body '{"leaderID": "D5f4QRWS"}' \
    > test.out 2>&1
eval_tap $? 76 'PublicPromotePartyLeader' test.out

#- 77 PublicReadPartySessionStorage
./ng net.accelbyte.sdk.cli.Main session publicReadPartySessionStorage \
    --namespace "$AB_NAMESPACE" \
    --partyId 'rqftH7y9' \
    > test.out 2>&1
eval_tap $? 77 'PublicReadPartySessionStorage' test.out

#- 78 PublicUpdateInsertPartySessionStorageReserved
./ng net.accelbyte.sdk.cli.Main session publicUpdateInsertPartySessionStorageReserved \
    --namespace "$AB_NAMESPACE" \
    --partyId 'nvPeNJXQ' \
    --userId 'n0fkwdbP' \
    --body '{"tAHqq6s9": {}, "9qAzGzbe": {}, "LDahMg8y": {}}' \
    > test.out 2>&1
eval_tap $? 78 'PublicUpdateInsertPartySessionStorageReserved' test.out

#- 79 PublicPartyJoin
./ng net.accelbyte.sdk.cli.Main session publicPartyJoin \
    --namespace "$AB_NAMESPACE" \
    --partyId 'MfDJLrwG' \
    > test.out 2>&1
eval_tap $? 79 'PublicPartyJoin' test.out

#- 80 PublicPartyLeave
./ng net.accelbyte.sdk.cli.Main session publicPartyLeave \
    --namespace "$AB_NAMESPACE" \
    --partyId 'wMA3p2K1' \
    > test.out 2>&1
eval_tap $? 80 'PublicPartyLeave' test.out

#- 81 PublicPartyReject
./ng net.accelbyte.sdk.cli.Main session publicPartyReject \
    --namespace "$AB_NAMESPACE" \
    --partyId 'zHPLFz7Y' \
    > test.out 2>&1
eval_tap $? 81 'PublicPartyReject' test.out

#- 82 PublicPartyCancel
./ng net.accelbyte.sdk.cli.Main session publicPartyCancel \
    --namespace "$AB_NAMESPACE" \
    --partyId 'ACXfpEG2' \
    --userId '5fpOssZW' \
    > test.out 2>&1
eval_tap $? 82 'PublicPartyCancel' test.out

#- 83 PublicPartyKick
./ng net.accelbyte.sdk.cli.Main session publicPartyKick \
    --namespace "$AB_NAMESPACE" \
    --partyId 'Xn1B5PNh' \
    --userId 'DfExkPQB' \
    > test.out 2>&1
eval_tap $? 83 'PublicPartyKick' test.out

#- 84 PublicCreateParty
./ng net.accelbyte.sdk.cli.Main session publicCreateParty \
    --namespace "$AB_NAMESPACE" \
    --body '{"attributes": {"0VVqmPlr": {}, "G5XS2Zk4": {}, "3MZRdAHy": {}}, "configurationName": "1lIMtKME", "inactiveTimeout": 42, "inviteTimeout": 57, "joinability": "OPEN", "maxPlayers": 53, "members": [{"ID": "WpaWQFOg", "PlatformID": "Oe4oC0re", "PlatformUserID": "Jydxj7Kw"}, {"ID": "lNVzk9jB", "PlatformID": "YNNNbRtO", "PlatformUserID": "1qH7U4BR"}, {"ID": "tXNlodmR", "PlatformID": "qJu6knh3", "PlatformUserID": "QLf6kjgx"}], "minPlayers": 78, "textChat": true, "type": "P2P"}' \
    > test.out 2>&1
eval_tap $? 84 'PublicCreateParty' test.out

#- 85 PublicGetRecentPlayer
./ng net.accelbyte.sdk.cli.Main session publicGetRecentPlayer \
    --namespace "$AB_NAMESPACE" \
    --limit '91' \
    > test.out 2>&1
eval_tap $? 85 'PublicGetRecentPlayer' test.out

#- 86 PublicGetRecentTeamPlayer
./ng net.accelbyte.sdk.cli.Main session publicGetRecentTeamPlayer \
    --namespace "$AB_NAMESPACE" \
    --limit '11' \
    > test.out 2>&1
eval_tap $? 86 'PublicGetRecentTeamPlayer' test.out

#- 87 PublicUpdateInsertSessionStorageLeader
./ng net.accelbyte.sdk.cli.Main session publicUpdateInsertSessionStorageLeader \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'qFlwd7PN' \
    --body '{"qWzOSM5Y": {}, "pWymvbSQ": {}, "i1DyWYpu": {}}' \
    > test.out 2>&1
eval_tap $? 87 'PublicUpdateInsertSessionStorageLeader' test.out

#- 88 PublicUpdateInsertSessionStorage
./ng net.accelbyte.sdk.cli.Main session publicUpdateInsertSessionStorage \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'ER7igR1g' \
    --userId 'hEb2paSz' \
    --body '{"o5fLh3FF": {}, "X8PH1qWT": {}, "MyfO1pj1": {}}' \
    > test.out 2>&1
eval_tap $? 88 'PublicUpdateInsertSessionStorage' test.out

#- 89 PublicGetBulkPlayerCurrentPlatform
./ng net.accelbyte.sdk.cli.Main session publicGetBulkPlayerCurrentPlatform \
    --namespace "$AB_NAMESPACE" \
    --body '{"userIDs": ["ED6HbQIT", "WX7wGvvp", "8ABX9N7B"]}' \
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
    --body '{"crossplayEnabled": false, "currentPlatform": "ERochxk8", "data": {"mDbd4HoD": {}, "FtMVKWa4": {}, "sgjNtQAr": {}}, "platforms": [{"name": "t71YlvmT", "userID": "75z5CaKI"}, {"name": "i3phOGyL", "userID": "9qUAsSpk"}, {"name": "NMlacQ8t", "userID": "ogzYrxvY"}], "roles": ["kf9WpiWs", "h81T4CMA", "bm9cXSna"], "simultaneousPlatform": "bKhVEhQd"}' \
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
    --order 'CFUYghl6' \
    --orderBy 'Mx1rv5gu' \
    --status 'JaeDEY4J' \
    > test.out 2>&1
eval_tap $? 93 'PublicQueryMyGameSessions' test.out

#- 94 PublicQueryMyParties
./ng net.accelbyte.sdk.cli.Main session publicQueryMyParties \
    --namespace "$AB_NAMESPACE" \
    --order 'BUpG7sHC' \
    --orderBy 'ET8c84rj' \
    --status 'Z7NapeOf' \
    > test.out 2>&1
eval_tap $? 94 'PublicQueryMyParties' test.out


rm -f "tmp.dat"

exit $EXIT_CODE