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
    --body '{"logLevel": "info"}' \
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
    --body '{"metricExcludedNamespaces": ["An8y1QW3", "qhyXKgkW", "VeXCmzWO"], "regionRetryMapping": {"1012a46A": ["dGUl81uK", "PLzEVkMl", "rl8WfqFw"], "JBR5Oa03": ["x8YYpuv7", "Ah0EQMEA", "yeqzxRsz"], "YaNrbqrh": ["8Are6EhG", "uktMctye", "AvJNDRQ7"]}, "regionURLMapping": ["8CSKA3jF", "figIoKTl", "GeOTBafK"], "testGameMode": "yvEK1fDx", "testRegionURLMapping": ["BgUjhQSE", "jhqndyVK", "tsEGUDeF"], "testTargetUserIDs": ["XKrSs0rw", "6P3Sw4WJ", "9E2g3qdz"]}' \
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
    --body '{"durationDays": 80}' \
    > test.out 2>&1
eval_tap $? 12 'AdminUpdateConfigurationAlertV1' test.out

#- 13 AdminCreateConfigurationAlertV1
./ng net.accelbyte.sdk.cli.Main session adminCreateConfigurationAlertV1 \
    --namespace "$AB_NAMESPACE" \
    --body '{"durationDays": 94}' \
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
    --body '{"NativeSessionSetting": {"PSNDisableSystemUIMenu": ["KICK", "KICK", "PROMOTE_TO_LEADER"], "PSNServiceLabel": 99, "PSNSupportedPlatforms": ["l06JlaTP", "AcDAo1aT", "eTd1N6M5"], "SessionTitle": "qmYowdGK", "ShouldSync": false, "XboxAllowCrossPlatform": false, "XboxSandboxID": "2OGDtt1I", "XboxServiceConfigID": "O0VdW7UB", "XboxSessionTemplateName": "lNxqkWJ9", "XboxTitleID": "poarLaGq", "localizedSessionName": {"gYP01nGu": {}, "iJbwPzwT": {}, "Wzj231zZ": {}}}, "PSNBaseUrl": "SGa7BIdU", "amsClaimTimeoutMinutes": 68, "appName": "rDtvyOIl", "asyncProcessDSRequest": {"async": false, "timeout": 42}, "attributes": {"uwWC2gdK": {}, "QiBH91tz": {}, "9cX4qTRp": {}}, "autoJoin": false, "autoLeaveSession": true, "clientVersion": "2Aj1fbeP", "customURLGRPC": "cJvHXFrL", "deployment": "PqLLeoac", "disableCodeGeneration": false, "disableResendInvite": true, "dsManualSetReady": true, "dsSource": "cjk937ZE", "enableSecret": false, "fallbackClaimKeys": ["P5zEGYZh", "xeYoivud", "zyuoX5op"], "grpcSessionConfig": {"appName": "nD0iFRET", "customURL": "WUoNWDeo", "functionFlag": 69}, "immutableStorage": false, "inactiveTimeout": 47, "inviteTimeout": 30, "joinability": "13cWWOpn", "leaderElectionGracePeriod": 65, "manualRejoin": false, "maxActiveSessions": 53, "maxPlayers": 31, "minPlayers": 62, "name": "zv1gzsP6", "persistent": true, "preferredClaimKeys": ["IK6GIGIc", "UcAiddSM", "iR7xbRYi"], "requestedRegions": ["J4OYoOJN", "pQxIPm7g", "9oDa5mGx"], "textChat": true, "textChatMode": "TEAM", "tieTeamsSessionLifetime": false, "ttlHours": 73, "type": "yAVxAR2W"}' \
    > test.out 2>&1
eval_tap $? 16 'AdminCreateConfigurationTemplateV1' test.out

#- 17 AdminGetAllConfigurationTemplatesV1
./ng net.accelbyte.sdk.cli.Main session adminGetAllConfigurationTemplatesV1 \
    --namespace "$AB_NAMESPACE" \
    --limit '68' \
    --name 't1pUIoY6' \
    --offset '48' \
    --order 'DpyS95Jn' \
    --orderBy 'mupYkbio' \
    > test.out 2>&1
eval_tap $? 17 'AdminGetAllConfigurationTemplatesV1' test.out

#- 18 AdminGetConfigurationTemplateV1
./ng net.accelbyte.sdk.cli.Main session adminGetConfigurationTemplateV1 \
    --name '3rJv59FX' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 18 'AdminGetConfigurationTemplateV1' test.out

#- 19 AdminUpdateConfigurationTemplateV1
./ng net.accelbyte.sdk.cli.Main session adminUpdateConfigurationTemplateV1 \
    --name 'e2TAuG78' \
    --namespace "$AB_NAMESPACE" \
    --body '{"NativeSessionSetting": {"PSNDisableSystemUIMenu": ["KICK", "PROMOTE_TO_LEADER", "KICK"], "PSNServiceLabel": 56, "PSNSupportedPlatforms": ["v0mkRxCH", "Y1oLzgJ2", "ZTmGtMQl"], "SessionTitle": "omAWRn9R", "ShouldSync": true, "XboxAllowCrossPlatform": false, "XboxSandboxID": "eQ9lDoaA", "XboxServiceConfigID": "4nEQT3Qy", "XboxSessionTemplateName": "VeAPvwZ2", "XboxTitleID": "zu3f3ptJ", "localizedSessionName": {"4Pzplleq": {}, "gTFpWRio": {}, "yZllmOcY": {}}}, "PSNBaseUrl": "o18GlHrM", "amsClaimTimeoutMinutes": 82, "appName": "Lsh8hxrx", "asyncProcessDSRequest": {"async": false, "timeout": 18}, "attributes": {"Q2hdqqHv": {}, "1UpnvoYU": {}, "96LPuMkV": {}}, "autoJoin": true, "autoLeaveSession": true, "clientVersion": "ZX0JAgcg", "customURLGRPC": "6yFeHsiP", "deployment": "2v7EnFjj", "disableCodeGeneration": false, "disableResendInvite": true, "dsManualSetReady": false, "dsSource": "c2bEGGf8", "enableSecret": true, "fallbackClaimKeys": ["EVNmZXPc", "xeJi2GK2", "oCta41V1"], "grpcSessionConfig": {"appName": "Hi5dE0yl", "customURL": "f4sJn5xF", "functionFlag": 10}, "immutableStorage": false, "inactiveTimeout": 58, "inviteTimeout": 80, "joinability": "6icCLOLy", "leaderElectionGracePeriod": 35, "manualRejoin": true, "maxActiveSessions": 61, "maxPlayers": 18, "minPlayers": 69, "name": "qm2tb7mV", "persistent": false, "preferredClaimKeys": ["bh4JBaiq", "4RJNwX3c", "sBDAHVmD"], "requestedRegions": ["kbwTeEYx", "6zn2hR5v", "ZnrM4G0y"], "textChat": false, "textChatMode": "NONE", "tieTeamsSessionLifetime": false, "ttlHours": 37, "type": "khtsQgGU"}' \
    > test.out 2>&1
eval_tap $? 19 'AdminUpdateConfigurationTemplateV1' test.out

#- 20 AdminDeleteConfigurationTemplateV1
./ng net.accelbyte.sdk.cli.Main session adminDeleteConfigurationTemplateV1 \
    --name 'jyGHfowr' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 20 'AdminDeleteConfigurationTemplateV1' test.out

#- 21 AdminGetMemberActiveSession
./ng net.accelbyte.sdk.cli.Main session adminGetMemberActiveSession \
    --name 'ub4OhOuK' \
    --namespace "$AB_NAMESPACE" \
    --userId '5XZlXwhO' \
    > test.out 2>&1
eval_tap $? 21 'AdminGetMemberActiveSession' test.out

#- 22 AdminReconcileMaxActiveSession
./ng net.accelbyte.sdk.cli.Main session adminReconcileMaxActiveSession \
    --name 'NLrLFnIj' \
    --namespace "$AB_NAMESPACE" \
    --body '{"userID": "Z8otzuuF"}' \
    > test.out 2>&1
eval_tap $? 22 'AdminReconcileMaxActiveSession' test.out

#- 23 AdminGetDSMCConfiguration
eval_tap 0 23 'AdminGetDSMCConfiguration # SKIP deprecated' test.out

#- 24 AdminSyncDSMCConfiguration
eval_tap 0 24 'AdminSyncDSMCConfiguration # SKIP deprecated' test.out

#- 25 AdminQueryGameSessions
./ng net.accelbyte.sdk.cli.Main session adminQueryGameSessions \
    --namespace "$AB_NAMESPACE" \
    --configurationName 'VzeTLM3P' \
    --dsPodName 'Bh2E1xhB' \
    --fromTime 'T08X6t4e' \
    --gameMode '6yUDyKdx' \
    --isPersistent 'uR8YOdIS' \
    --isSoftDeleted 'M4oZ6L7o' \
    --joinability 'Hx5qOvBv' \
    --limit '2' \
    --matchPool 'chZx1i78' \
    --memberID 'Izlwh1Mf' \
    --offset '21' \
    --order 'aKzlRJYA' \
    --orderBy 'XCEHKoum' \
    --sessionID 'odnmVPgx' \
    --status '5TUXIxfz' \
    --statusV2 'tVj3kg19' \
    --toTime 'kW3qUyWm' \
    > test.out 2>&1
eval_tap $? 25 'AdminQueryGameSessions' test.out

#- 26 AdminQueryGameSessionsByAttributes
./ng net.accelbyte.sdk.cli.Main session adminQueryGameSessionsByAttributes \
    --namespace "$AB_NAMESPACE" \
    --body '{"qv5NzL8L": {}, "WGb9sPLw": {}, "rXIkAa25": {}}' \
    > test.out 2>&1
eval_tap $? 26 'AdminQueryGameSessionsByAttributes' test.out

#- 27 AdminDeleteBulkGameSessions
./ng net.accelbyte.sdk.cli.Main session adminDeleteBulkGameSessions \
    --namespace "$AB_NAMESPACE" \
    --body '{"ids": ["2i9cPSvw", "1aQwqkIx", "w5vTTDaF"]}' \
    > test.out 2>&1
eval_tap $? 27 'AdminDeleteBulkGameSessions' test.out

#- 28 AdminSetDSReady
./ng net.accelbyte.sdk.cli.Main session adminSetDSReady \
    --namespace "$AB_NAMESPACE" \
    --sessionId 's78wKo0B' \
    --body '{"ready": false}' \
    > test.out 2>&1
eval_tap $? 28 'AdminSetDSReady' test.out

#- 29 AdminUpdateDSInformation
./ng net.accelbyte.sdk.cli.Main session adminUpdateDSInformation \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'TTwpqQk4' \
    --body '{"createdRegion": "a8feYUU3", "deployment": "cmKW2IzD", "description": "F3CnqhLb", "ip": "2ZQcwvQl", "port": 43, "region": "LNVy3ECF", "serverId": "39Ehajrh", "source": "IEhKvG6F", "status": "qiopNZRQ"}' \
    > test.out 2>&1
eval_tap $? 29 'AdminUpdateDSInformation' test.out

#- 30 AdminKickGameSessionMember
./ng net.accelbyte.sdk.cli.Main session adminKickGameSessionMember \
    --memberId 'qOva4M5w' \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'kKSfsNbj' \
    > test.out 2>&1
eval_tap $? 30 'AdminKickGameSessionMember' test.out

#- 31 AdminUpdateGameSessionMember
./ng net.accelbyte.sdk.cli.Main session adminUpdateGameSessionMember \
    --memberId 'NuK6Gele' \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'I2NH1pLn' \
    --statusType '2p9XwYxk' \
    > test.out 2>&1
eval_tap $? 31 'AdminUpdateGameSessionMember' test.out

#- 32 AdminGetListNativeSession
./ng net.accelbyte.sdk.cli.Main session adminGetListNativeSession \
    --namespace "$AB_NAMESPACE" \
    --limit '59' \
    --offset '82' \
    --order 'zNipFAMs' \
    > test.out 2>&1
eval_tap $? 32 'AdminGetListNativeSession' test.out

#- 33 AdminQueryParties
./ng net.accelbyte.sdk.cli.Main session adminQueryParties \
    --namespace "$AB_NAMESPACE" \
    --fromTime 'QSrxg4KH' \
    --isSoftDeleted 'H1vE6iZg' \
    --joinability 'VtPqAroK' \
    --key 'NfucA6rG' \
    --leaderID 'Zg8fC2bi' \
    --limit '43' \
    --memberID 'Sl4ujyxR' \
    --memberStatus 'Om5PArUS' \
    --offset '35' \
    --order '7oGr3eNr' \
    --orderBy 'BRKhIAWt' \
    --partyID 'bXaPvjrF' \
    --toTime 'a0TEZqaA' \
    --value 'oq9H06rZ' \
    > test.out 2>&1
eval_tap $? 33 'AdminQueryParties' test.out

#- 34 AdminDeleteBulkParties
./ng net.accelbyte.sdk.cli.Main session adminDeleteBulkParties \
    --namespace "$AB_NAMESPACE" \
    --body '{"ids": ["ef7cUh4f", "5gVLuF5g", "7QjkNY9J"]}' \
    > test.out 2>&1
eval_tap $? 34 'AdminDeleteBulkParties' test.out

#- 35 AdminReadPartySessionStorage
./ng net.accelbyte.sdk.cli.Main session adminReadPartySessionStorage \
    --namespace "$AB_NAMESPACE" \
    --partyId 'omFiDwFB' \
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
    --body '{"psn": {"clientId": "1AtrfE9B", "clientSecret": "Magq3DF4", "scope": "X1DAphCY"}}' \
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
    --limit '44' \
    --userId 'fzGNG4L1' \
    > test.out 2>&1
eval_tap $? 41 'AdminGetRecentPlayer' test.out

#- 42 AdminGetRecentTeamPlayer
./ng net.accelbyte.sdk.cli.Main session adminGetRecentTeamPlayer \
    --namespace "$AB_NAMESPACE" \
    --limit '10' \
    --userId '9PQB1m0e' \
    > test.out 2>&1
eval_tap $? 42 'AdminGetRecentTeamPlayer' test.out

#- 43 AdminReadSessionStorage
./ng net.accelbyte.sdk.cli.Main session adminReadSessionStorage \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'rz8wkoSj' \
    > test.out 2>&1
eval_tap $? 43 'AdminReadSessionStorage' test.out

#- 44 AdminDeleteUserSessionStorage
./ng net.accelbyte.sdk.cli.Main session adminDeleteUserSessionStorage \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'y1Nev3UL' \
    > test.out 2>&1
eval_tap $? 44 'AdminDeleteUserSessionStorage' test.out

#- 45 AdminReadUserSessionStorage
./ng net.accelbyte.sdk.cli.Main session adminReadUserSessionStorage \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'bNTdRuNl' \
    --userId 'jmkv3jgm' \
    > test.out 2>&1
eval_tap $? 45 'AdminReadUserSessionStorage' test.out

#- 46 AdminQueryPlayerAttributes
./ng net.accelbyte.sdk.cli.Main session adminQueryPlayerAttributes \
    --namespace "$AB_NAMESPACE" \
    --users 'cFr0ac8T' \
    > test.out 2>&1
eval_tap $? 46 'AdminQueryPlayerAttributes' test.out

#- 47 AdminGetPlayerAttributes
./ng net.accelbyte.sdk.cli.Main session adminGetPlayerAttributes \
    --namespace "$AB_NAMESPACE" \
    --userId 'XlAHedqs' \
    > test.out 2>&1
eval_tap $? 47 'AdminGetPlayerAttributes' test.out

#- 48 AdminSyncNativeSession
./ng net.accelbyte.sdk.cli.Main session adminSyncNativeSession \
    --namespace "$AB_NAMESPACE" \
    --userId 'NuFcKuxf' \
    > test.out 2>&1
eval_tap $? 48 'AdminSyncNativeSession' test.out

#- 49 CreateGameSession
./ng net.accelbyte.sdk.cli.Main session createGameSession \
    --namespace "$AB_NAMESPACE" \
    --resolveMaxActiveSession  \
    --body '{"appName": "ZMch2Ee3", "attributes": {"CZaz4Ftm": {}, "xPmlQPI0": {}, "G1NdW1U2": {}}, "autoJoin": false, "backfillTicketID": "M3rmYjyQ", "clientVersion": "q9MIPFhL", "configurationName": "hei78PgM", "customURLGRPC": "WV2Fy3BH", "deployment": "QBKA6mdA", "dsSource": "OKsriEYo", "fallbackClaimKeys": ["ag5dYBuv", "UKzwaHie", "RN8RkwwV"], "inactiveTimeout": 66, "inviteTimeout": 65, "joinability": "cn1iQ5XW", "matchPool": "nTPLcJO0", "maxPlayers": 5, "minPlayers": 72, "preferredClaimKeys": ["q2gOg0ZY", "ImLBMpc4", "3TNGJhe0"], "requestedRegions": ["sp4iOF6l", "rl8bdnYc", "OCKl6tVj"], "serverName": "k5k4gndz", "storage": {"leader": {"cUuINWnj": {}, "jPa6xaSm": {}, "r8D8mEnk": {}}}, "teams": [{"parties": [{"partyID": "4coDVebw", "userIDs": ["qYDHmdx3", "7ay7xa1M", "Lxnxddia"]}, {"partyID": "80lIIA0D", "userIDs": ["5iVkoDfj", "nuHwUEOL", "AMq7zWvb"]}, {"partyID": "zbZVqFo8", "userIDs": ["5ojsFqPW", "ciFkziH9", "6Or6xEik"]}], "teamID": "ZxDW6jMC", "userIDs": ["OJkMw23c", "rq90aMXb", "MpXH6048"]}, {"parties": [{"partyID": "X6USf2V9", "userIDs": ["pSYYLoeA", "dHINfZgR", "3728JqaG"]}, {"partyID": "bWbDuX9o", "userIDs": ["KtNhBDK9", "pnZiJSwN", "3voPHaRL"]}, {"partyID": "PBLRO4cZ", "userIDs": ["kEfmGNTg", "PP1jitQs", "Q9xclswZ"]}], "teamID": "Xr8gG0o7", "userIDs": ["6q1MqCJP", "qOtBR4j2", "EfX4j6GX"]}, {"parties": [{"partyID": "zlMFlzGt", "userIDs": ["wf3qk65K", "ho6dk7Vi", "hsdGBcCH"]}, {"partyID": "b6lF0pmr", "userIDs": ["w71ZxDXe", "4KKhzGhW", "NrXBHaMC"]}, {"partyID": "YnSWITiq", "userIDs": ["Mw5JVeZ1", "VYzRd8DG", "4zD22ncs"]}], "teamID": "nGP09aFN", "userIDs": ["jgpaWI5p", "kZTb3iNB", "nJBUKnd0"]}], "textChat": true, "textChatMode": "GAME", "ticketIDs": ["vREqEsEn", "D2yJ7b7X", "ZW71PDlQ"], "tieTeamsSessionLifetime": true, "type": "3vsKxqgj"}' \
    > test.out 2>&1
eval_tap $? 49 'CreateGameSession' test.out

#- 50 PublicQueryGameSessionsByAttributes
./ng net.accelbyte.sdk.cli.Main session publicQueryGameSessionsByAttributes \
    --namespace "$AB_NAMESPACE" \
    --body '{"NRTrtFmk": {}, "lW15rErp": {}, "OSgj1Sse": {}}' \
    > test.out 2>&1
eval_tap $? 50 'PublicQueryGameSessionsByAttributes' test.out

#- 51 PublicSessionJoinCode
./ng net.accelbyte.sdk.cli.Main session publicSessionJoinCode \
    --namespace "$AB_NAMESPACE" \
    --body '{"code": "jnEwt2xq"}' \
    > test.out 2>&1
eval_tap $? 51 'PublicSessionJoinCode' test.out

#- 52 GetGameSessionByPodName
./ng net.accelbyte.sdk.cli.Main session getGameSessionByPodName \
    --namespace "$AB_NAMESPACE" \
    --podName 'Fxxf8T0w' \
    > test.out 2>&1
eval_tap $? 52 'GetGameSessionByPodName' test.out

#- 53 GetGameSession
./ng net.accelbyte.sdk.cli.Main session getGameSession \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'ubndXVMG' \
    > test.out 2>&1
eval_tap $? 53 'GetGameSession' test.out

#- 54 UpdateGameSession
./ng net.accelbyte.sdk.cli.Main session updateGameSession \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'fe8soOq5' \
    --body '{"attributes": {"JYwzlMhN": {}, "qEmOBjkt": {}, "OLqsZKKS": {}}, "backfillTicketID": "sYVMJkrE", "clientVersion": "UUgBMPxX", "deployment": "KYPftg0f", "fallbackClaimKeys": ["GcdRaWmE", "MaeNV0xG", "9j5EY37N"], "inactiveTimeout": 15, "inviteTimeout": 50, "joinability": "s49LVLIx", "matchPool": "scXenJyQ", "maxPlayers": 76, "minPlayers": 54, "preferredClaimKeys": ["K6w5MsrO", "WEfp9cVa", "soIiUqCL"], "requestedRegions": ["Se7ApooA", "Vq2kPX0N", "VAhZyuhL"], "teams": [{"parties": [{"partyID": "KIMbtJSW", "userIDs": ["zWajptni", "UMhcouvu", "l7CLvJjD"]}, {"partyID": "MWCGDFQn", "userIDs": ["t1EVOjxZ", "GUi8X5SK", "4ccDnYOO"]}, {"partyID": "EQdtIoSa", "userIDs": ["CzzR7QQU", "7tA9hs71", "AByY7izj"]}], "teamID": "h5MMx3PB", "userIDs": ["tPJdh1x0", "YJhiukPL", "cJ1ZB7gU"]}, {"parties": [{"partyID": "RS16pFYm", "userIDs": ["IbrRy2QR", "kJx48wPI", "FfG5SZkq"]}, {"partyID": "e7Mn8Wgk", "userIDs": ["1a6b2wtX", "BuLVkRiP", "MAQpqj1X"]}, {"partyID": "YgzwYaWd", "userIDs": ["lFFI6n66", "3EENHMyS", "7zoKmOgc"]}], "teamID": "aw2po5NX", "userIDs": ["1lBBK5or", "qTorfIss", "WXgVMJls"]}, {"parties": [{"partyID": "nj5hqlaD", "userIDs": ["az2zLiz7", "abBpX8m7", "xeyL01aM"]}, {"partyID": "UpvBpa7q", "userIDs": ["sARVQil4", "nQQehItJ", "ecBKtXyM"]}, {"partyID": "f2AWEQRR", "userIDs": ["SJ2qS6wI", "vV9rt1yV", "MrvpEAtc"]}], "teamID": "PY5GRMMw", "userIDs": ["8V3yAbhu", "fDNs6EAs", "bwbEOS0h"]}], "ticketIDs": ["6fHlJl9o", "ctMTAgyh", "aGd9MDgl"], "tieTeamsSessionLifetime": true, "type": "8qXTuFkp", "version": 69}' \
    > test.out 2>&1
eval_tap $? 54 'UpdateGameSession' test.out

#- 55 DeleteGameSession
./ng net.accelbyte.sdk.cli.Main session deleteGameSession \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'uVQY0p2e' \
    > test.out 2>&1
eval_tap $? 55 'DeleteGameSession' test.out

#- 56 PatchUpdateGameSession
./ng net.accelbyte.sdk.cli.Main session patchUpdateGameSession \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'eLUsDAW6' \
    --body '{"attributes": {"bWpS7dsi": {}, "MHSTcFD2": {}, "Ejed6Dk5": {}}, "backfillTicketID": "5IBd5SiN", "clientVersion": "ogd0mOZn", "deployment": "6gkDXEw9", "fallbackClaimKeys": ["T23ktHE3", "fEeuWJ42", "Ig1VHYBB"], "inactiveTimeout": 80, "inviteTimeout": 10, "joinability": "ROJsEhDr", "matchPool": "0gMLT0gB", "maxPlayers": 0, "minPlayers": 10, "preferredClaimKeys": ["XPyKVLNJ", "VysUDoBW", "riM8nwmt"], "requestedRegions": ["TRWt71zg", "RpOVDISr", "MU0ET55P"], "teams": [{"parties": [{"partyID": "1HMufWNl", "userIDs": ["6wKXgBCJ", "vYZ4NTrA", "bPCCKWvq"]}, {"partyID": "zzYIesxe", "userIDs": ["udh69K7L", "WjwXWzlH", "GqYy8LEa"]}, {"partyID": "6kH8ExWb", "userIDs": ["Y0mSou7l", "N2d9Qp4p", "WOawUQfI"]}], "teamID": "UwEgUstv", "userIDs": ["305heb2z", "17SNh1Hc", "ddlPY5Dx"]}, {"parties": [{"partyID": "vkREREXn", "userIDs": ["oamZ5A2a", "GHLLbqDA", "6NZFudEK"]}, {"partyID": "Hl7DrCVr", "userIDs": ["y3kmN7Me", "IRakNnrq", "Gz3Me8rC"]}, {"partyID": "2EG7NyzA", "userIDs": ["ViCFZ4s5", "aYTHrfWz", "wYkd6Rc0"]}], "teamID": "sfkwkdja", "userIDs": ["Vhu8tLPw", "2rB0x9jx", "WnqT5fzi"]}, {"parties": [{"partyID": "NE5GvyCn", "userIDs": ["VmRjyi9d", "M7h3zevB", "koXM6tzx"]}, {"partyID": "GQv3Nk6D", "userIDs": ["UGVweQNg", "EkG3P28D", "hjG26gMn"]}, {"partyID": "daSRkzNp", "userIDs": ["sjkAU7VW", "UuUvzTtb", "YjM6Bmar"]}], "teamID": "ohwm5FLI", "userIDs": ["VtG4zDXT", "NyUJW3g9", "KD5172n7"]}], "ticketIDs": ["eqFf4Wc6", "eTc73Oyk", "nS68Cfnk"], "tieTeamsSessionLifetime": true, "type": "UiFnQYFG", "version": 87}' \
    > test.out 2>&1
eval_tap $? 56 'PatchUpdateGameSession' test.out

#- 57 UpdateGameSessionBackfillTicketID
./ng net.accelbyte.sdk.cli.Main session updateGameSessionBackfillTicketID \
    --namespace "$AB_NAMESPACE" \
    --sessionId '8wz6PZL4' \
    --body '{"backfillTicketID": "JFjuCmbb"}' \
    > test.out 2>&1
eval_tap $? 57 'UpdateGameSessionBackfillTicketID' test.out

#- 58 GameSessionGenerateCode
./ng net.accelbyte.sdk.cli.Main session gameSessionGenerateCode \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'gUOQgXEM' \
    > test.out 2>&1
eval_tap $? 58 'GameSessionGenerateCode' test.out

#- 59 PublicRevokeGameSessionCode
./ng net.accelbyte.sdk.cli.Main session publicRevokeGameSessionCode \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'nb6MVU7T' \
    > test.out 2>&1
eval_tap $? 59 'PublicRevokeGameSessionCode' test.out

#- 60 PublicGameSessionInvite
./ng net.accelbyte.sdk.cli.Main session publicGameSessionInvite \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'jX6kSyM8' \
    --body '{"metadata": {"ujmlCD6H": "0EKHcKeN", "Pd2aQu14": "sHcCEzsb", "Ez7E2ntp": "SR16uaRB"}, "platformID": "OD2FTOB5", "userID": "6gcP4KSX"}' \
    > test.out 2>&1
eval_tap $? 60 'PublicGameSessionInvite' test.out

#- 61 JoinGameSession
./ng net.accelbyte.sdk.cli.Main session joinGameSession \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'Joir7ZEN' \
    > test.out 2>&1
eval_tap $? 61 'JoinGameSession' test.out

#- 62 PublicPromoteGameSessionLeader
./ng net.accelbyte.sdk.cli.Main session publicPromoteGameSessionLeader \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'eQOMxhPH' \
    --body '{"leaderID": "sgsnyuj0"}' \
    > test.out 2>&1
eval_tap $? 62 'PublicPromoteGameSessionLeader' test.out

#- 63 LeaveGameSession
./ng net.accelbyte.sdk.cli.Main session leaveGameSession \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'Jav7myq4' \
    > test.out 2>&1
eval_tap $? 63 'LeaveGameSession' test.out

#- 64 PublicKickGameSessionMember
./ng net.accelbyte.sdk.cli.Main session publicKickGameSessionMember \
    --memberId 'CMrMq6YQ' \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'wqCxkvHA' \
    > test.out 2>&1
eval_tap $? 64 'PublicKickGameSessionMember' test.out

#- 65 PublicGameSessionReject
./ng net.accelbyte.sdk.cli.Main session publicGameSessionReject \
    --namespace "$AB_NAMESPACE" \
    --sessionId '3GQdK9aN' \
    > test.out 2>&1
eval_tap $? 65 'PublicGameSessionReject' test.out

#- 66 GetSessionServerSecret
./ng net.accelbyte.sdk.cli.Main session getSessionServerSecret \
    --namespace "$AB_NAMESPACE" \
    --sessionId '3F64oZOx' \
    > test.out 2>&1
eval_tap $? 66 'GetSessionServerSecret' test.out

#- 67 AppendTeamGameSession
eval_tap 0 67 'AppendTeamGameSession # SKIP deprecated' test.out

#- 68 PublicGameSessionCancel
./ng net.accelbyte.sdk.cli.Main session publicGameSessionCancel \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'ioOeUqOa' \
    --userId 'x8jP8hBI' \
    > test.out 2>&1
eval_tap $? 68 'PublicGameSessionCancel' test.out

#- 69 PublicPartyJoinCode
./ng net.accelbyte.sdk.cli.Main session publicPartyJoinCode \
    --namespace "$AB_NAMESPACE" \
    --body '{"code": "gNe6PYU8"}' \
    > test.out 2>&1
eval_tap $? 69 'PublicPartyJoinCode' test.out

#- 70 PublicGetParty
./ng net.accelbyte.sdk.cli.Main session publicGetParty \
    --namespace "$AB_NAMESPACE" \
    --partyId 'IC4bcPj7' \
    > test.out 2>&1
eval_tap $? 70 'PublicGetParty' test.out

#- 71 PublicUpdateParty
./ng net.accelbyte.sdk.cli.Main session publicUpdateParty \
    --namespace "$AB_NAMESPACE" \
    --partyId 'AUQqaY4H' \
    --body '{"attributes": {"hQ3ZXfCG": {}, "xNEV2Vbm": {}, "lKv2jXbl": {}}, "inactiveTimeout": 50, "inviteTimeout": 72, "joinability": "xMekCThw", "maxPlayers": 18, "minPlayers": 75, "type": "fdJ9b5IJ", "version": 70}' \
    > test.out 2>&1
eval_tap $? 71 'PublicUpdateParty' test.out

#- 72 PublicPatchUpdateParty
./ng net.accelbyte.sdk.cli.Main session publicPatchUpdateParty \
    --namespace "$AB_NAMESPACE" \
    --partyId 'NPpPQ92h' \
    --body '{"attributes": {"AWyus53f": {}, "w5BSllEC": {}, "nbMG10KW": {}}, "inactiveTimeout": 29, "inviteTimeout": 71, "joinability": "hcP6bAXD", "maxPlayers": 85, "minPlayers": 70, "type": "0QHQHNMo", "version": 27}' \
    > test.out 2>&1
eval_tap $? 72 'PublicPatchUpdateParty' test.out

#- 73 PublicGeneratePartyCode
./ng net.accelbyte.sdk.cli.Main session publicGeneratePartyCode \
    --namespace "$AB_NAMESPACE" \
    --partyId 'YUxOOBos' \
    > test.out 2>&1
eval_tap $? 73 'PublicGeneratePartyCode' test.out

#- 74 PublicRevokePartyCode
./ng net.accelbyte.sdk.cli.Main session publicRevokePartyCode \
    --namespace "$AB_NAMESPACE" \
    --partyId 'Irdl3xge' \
    > test.out 2>&1
eval_tap $? 74 'PublicRevokePartyCode' test.out

#- 75 PublicPartyInvite
./ng net.accelbyte.sdk.cli.Main session publicPartyInvite \
    --namespace "$AB_NAMESPACE" \
    --partyId 'gHVUXR8p' \
    --body '{"metadata": {"QWS6YHgd": "7bjMQusK", "S0iPnISf": "VYIYT8OZ", "PiHXoqSQ": "1Si6kobt"}, "platformID": "npoWTZ2k", "userID": "LMfgtfH8"}' \
    > test.out 2>&1
eval_tap $? 75 'PublicPartyInvite' test.out

#- 76 PublicPromotePartyLeader
./ng net.accelbyte.sdk.cli.Main session publicPromotePartyLeader \
    --namespace "$AB_NAMESPACE" \
    --partyId 'dlQWJxac' \
    --body '{"leaderID": "t3WW08rB"}' \
    > test.out 2>&1
eval_tap $? 76 'PublicPromotePartyLeader' test.out

#- 77 PublicReadPartySessionStorage
./ng net.accelbyte.sdk.cli.Main session publicReadPartySessionStorage \
    --namespace "$AB_NAMESPACE" \
    --partyId 'DoL4kR05' \
    > test.out 2>&1
eval_tap $? 77 'PublicReadPartySessionStorage' test.out

#- 78 PublicUpdateInsertPartySessionStorageReserved
./ng net.accelbyte.sdk.cli.Main session publicUpdateInsertPartySessionStorageReserved \
    --namespace "$AB_NAMESPACE" \
    --partyId 'LLGc3ljE' \
    --userId 'M6hQ47mV' \
    --body '{"PQ4YHqfK": {}, "mb0fxkVs": {}, "krI50foM": {}}' \
    > test.out 2>&1
eval_tap $? 78 'PublicUpdateInsertPartySessionStorageReserved' test.out

#- 79 PublicPartyJoin
./ng net.accelbyte.sdk.cli.Main session publicPartyJoin \
    --namespace "$AB_NAMESPACE" \
    --partyId 'WN3dWU9M' \
    > test.out 2>&1
eval_tap $? 79 'PublicPartyJoin' test.out

#- 80 PublicPartyLeave
./ng net.accelbyte.sdk.cli.Main session publicPartyLeave \
    --namespace "$AB_NAMESPACE" \
    --partyId 'hXbO9FES' \
    > test.out 2>&1
eval_tap $? 80 'PublicPartyLeave' test.out

#- 81 PublicPartyReject
./ng net.accelbyte.sdk.cli.Main session publicPartyReject \
    --namespace "$AB_NAMESPACE" \
    --partyId 'IJpuGEyi' \
    > test.out 2>&1
eval_tap $? 81 'PublicPartyReject' test.out

#- 82 PublicPartyCancel
./ng net.accelbyte.sdk.cli.Main session publicPartyCancel \
    --namespace "$AB_NAMESPACE" \
    --partyId 'CZ9LrXMl' \
    --userId 'prKUfwGv' \
    > test.out 2>&1
eval_tap $? 82 'PublicPartyCancel' test.out

#- 83 PublicPartyKick
./ng net.accelbyte.sdk.cli.Main session publicPartyKick \
    --namespace "$AB_NAMESPACE" \
    --partyId '5dwCfMqP' \
    --userId 'ySyjwiGD' \
    > test.out 2>&1
eval_tap $? 83 'PublicPartyKick' test.out

#- 84 PublicCreateParty
./ng net.accelbyte.sdk.cli.Main session publicCreateParty \
    --namespace "$AB_NAMESPACE" \
    --body '{"attributes": {"ji8AqSvV": {}, "ujpAzv3J": {}, "IllsikJG": {}}, "configurationName": "XYjSUyux", "inactiveTimeout": 62, "inviteTimeout": 39, "joinability": "sEkjAp22", "maxPlayers": 27, "members": [{"ID": "SRRhTWTk", "PlatformID": "5t2C9KYA", "PlatformUserID": "QNBnn7Zj"}, {"ID": "OZIJDrIj", "PlatformID": "YE9eUZi0", "PlatformUserID": "4npwjOOL"}, {"ID": "g6l5aZp9", "PlatformID": "aHvwB5LP", "PlatformUserID": "SJFurszx"}], "minPlayers": 19, "textChat": false, "type": "7e8iTIdL"}' \
    > test.out 2>&1
eval_tap $? 84 'PublicCreateParty' test.out

#- 85 PublicGetRecentPlayer
./ng net.accelbyte.sdk.cli.Main session publicGetRecentPlayer \
    --namespace "$AB_NAMESPACE" \
    --limit '84' \
    > test.out 2>&1
eval_tap $? 85 'PublicGetRecentPlayer' test.out

#- 86 PublicGetRecentTeamPlayer
./ng net.accelbyte.sdk.cli.Main session publicGetRecentTeamPlayer \
    --namespace "$AB_NAMESPACE" \
    --limit '60' \
    > test.out 2>&1
eval_tap $? 86 'PublicGetRecentTeamPlayer' test.out

#- 87 PublicUpdateInsertSessionStorageLeader
./ng net.accelbyte.sdk.cli.Main session publicUpdateInsertSessionStorageLeader \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'UGaEpGOW' \
    --body '{"ISdU8TsT": {}, "DfrJtTAp": {}, "RxJkKfzB": {}}' \
    > test.out 2>&1
eval_tap $? 87 'PublicUpdateInsertSessionStorageLeader' test.out

#- 88 PublicUpdateInsertSessionStorage
./ng net.accelbyte.sdk.cli.Main session publicUpdateInsertSessionStorage \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'YyTxT4eM' \
    --userId 'AOMIW9E4' \
    --body '{"EEneHOvc": {}, "7ZEihk13": {}, "005oHCmx": {}}' \
    > test.out 2>&1
eval_tap $? 88 'PublicUpdateInsertSessionStorage' test.out

#- 89 PublicGetBulkPlayerCurrentPlatform
./ng net.accelbyte.sdk.cli.Main session publicGetBulkPlayerCurrentPlatform \
    --namespace "$AB_NAMESPACE" \
    --body '{"userIDs": ["hSnfwaie", "qvtAKhTo", "Ny97T6r4"]}' \
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
    --body '{"crossplayEnabled": true, "currentPlatform": "Sik9FeFS", "data": {"WOEmYSax": {}, "Q2WK61NS": {}, "DBVMJegz": {}}, "platforms": [{"name": "vHpKsHdW", "userID": "42HCyNtN"}, {"name": "Yh2GrgE2", "userID": "evEdFgdk"}, {"name": "TDmVlv9Y", "userID": "R4obT5mw"}], "roles": ["mrE8S0YY", "6qHa3qcC", "rvWe5Z4v"], "simultaneousPlatform": "uavJmLOQ"}' \
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
    --order 'EWg7dhwu' \
    --orderBy 'zSW8PF3U' \
    --status 'Cm3cn6vZ' \
    > test.out 2>&1
eval_tap $? 93 'PublicQueryMyGameSessions' test.out

#- 94 PublicQueryMyParties
./ng net.accelbyte.sdk.cli.Main session publicQueryMyParties \
    --namespace "$AB_NAMESPACE" \
    --order 'NcmbBtK1' \
    --orderBy 'WkEguiuw' \
    --status 'pAHcoJ2R' \
    > test.out 2>&1
eval_tap $? 94 'PublicQueryMyParties' test.out


rm -f "tmp.dat"

exit $EXIT_CODE