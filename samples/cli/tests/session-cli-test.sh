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
echo "1..95"

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
    --body '{"logLevel": "trace"}' \
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
    --body '{"metricExcludedNamespaces": ["zpfgr88B", "CUPUucne", "UdiAaMzu"], "regionRetryMapping": {"6eNwlkqa": ["z7QJToms", "xez81wOU", "Gh7NiciP"], "bRssxe2F": ["Jlw5bu4E", "Lh0avw15", "W8CMe32p"], "q8QSM2Ez": ["fRiJnppD", "IEjpnb7b", "vxhjcl4f"]}, "regionURLMapping": ["BXH734Um", "hufNheYG", "QeWfgE84"], "testGameMode": "eKACS1NG", "testRegionURLMapping": ["g2SJ6PtH", "PTqiOa38", "F8nwKwnn"], "testTargetUserIDs": ["er1IG1Wl", "kdzNJTjm", "Ijhayp9z"]}' \
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
    --body '{"durationDays": 19}' \
    > test.out 2>&1
eval_tap $? 12 'AdminUpdateConfigurationAlertV1' test.out

#- 13 AdminCreateConfigurationAlertV1
./ng net.accelbyte.sdk.cli.Main session adminCreateConfigurationAlertV1 \
    --namespace "$AB_NAMESPACE" \
    --body '{"durationDays": 76}' \
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
    --body '{"NativeSessionSetting": {"PSNDisableSystemUIMenu": ["KICK", "UPDATE_JOINABLE_USER_TYPE", "PROMOTE_TO_LEADER"], "PSNServiceLabel": 83, "PSNSupportedPlatforms": ["TG81P57B", "Zq0EgoHn", "dYpd4Sp4"], "SessionTitle": "aMrp8ATG", "ShouldSync": false, "XboxAllowCrossPlatform": true, "XboxSandboxID": "P6KR00kV", "XboxServiceConfigID": "6Hn1RDFQ", "XboxSessionTemplateName": "Pfcf9YbE", "XboxTitleID": "URlP570Z", "localizedSessionName": {"thMEPGFz": {}, "0fdbXdZH": {}, "KzEww0rd": {}}}, "PSNBaseUrl": "m696aFnD", "amsClaimTimeoutMinutes": 36, "appName": "bSPIzS7w", "asyncProcessDSRequest": {"async": true, "timeout": 86}, "attributes": {"z5S1ZyGc": {}, "Z9nakhyk": {}, "Ht4g8CMK": {}}, "autoJoin": true, "autoLeaveSession": false, "clientVersion": "9JJ722K9", "customURLGRPC": "OrmRVTdb", "deployment": "tj9AS3qu", "disableCodeGeneration": true, "disableResendInvite": false, "dsManualSetReady": true, "dsSource": "0k4nuLy2", "enableSecret": false, "fallbackClaimKeys": ["3FwfkPdf", "CZZ2SsLa", "8xxsey5d"], "grpcSessionConfig": {"appName": "i0R5T3H3", "customURL": "c5v46ORo", "functionFlag": 38}, "immutableStorage": false, "inactiveTimeout": 55, "inviteTimeout": 77, "joinability": "FRIENDS_OF_FRIENDS", "leaderElectionGracePeriod": 62, "manualRejoin": true, "maxActiveSessions": 39, "maxPlayers": 89, "minPlayers": 50, "name": "SVpOjAPI", "partyCodeGeneratorString": "yBRuckSu", "partyCodeLength": 17, "persistent": false, "preferredClaimKeys": ["2Bp1BAVR", "0YbrFsQl", "GDmspYRZ"], "requestedRegions": ["a65BvVdM", "mJPlpa0H", "GtQIc1AX"], "textChat": true, "textChatMode": "TEAM", "tieTeamsSessionLifetime": false, "ttlHours": 33, "type": "P2P"}' \
    > test.out 2>&1
eval_tap $? 16 'AdminCreateConfigurationTemplateV1' test.out

#- 17 AdminGetAllConfigurationTemplatesV1
./ng net.accelbyte.sdk.cli.Main session adminGetAllConfigurationTemplatesV1 \
    --namespace "$AB_NAMESPACE" \
    --limit '5' \
    --name 'mv9siwqK' \
    --offset '80' \
    --order 'an8Ci3zg' \
    --orderBy 'jur2qQDa' \
    > test.out 2>&1
eval_tap $? 17 'AdminGetAllConfigurationTemplatesV1' test.out

#- 18 AdminGetConfigurationTemplateV1
./ng net.accelbyte.sdk.cli.Main session adminGetConfigurationTemplateV1 \
    --name 'cisGg402' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 18 'AdminGetConfigurationTemplateV1' test.out

#- 19 AdminUpdateConfigurationTemplateV1
./ng net.accelbyte.sdk.cli.Main session adminUpdateConfigurationTemplateV1 \
    --name 'qf0p13S1' \
    --namespace "$AB_NAMESPACE" \
    --body '{"NativeSessionSetting": {"PSNDisableSystemUIMenu": ["KICK", "UPDATE_JOINABLE_USER_TYPE", "UPDATE_JOINABLE_USER_TYPE"], "PSNServiceLabel": 4, "PSNSupportedPlatforms": ["PHkafROf", "d90iYElj", "FZ9MFNTH"], "SessionTitle": "gLg2CD2R", "ShouldSync": false, "XboxAllowCrossPlatform": false, "XboxSandboxID": "rJkqYiyy", "XboxServiceConfigID": "TmtbJDFH", "XboxSessionTemplateName": "qeExiuoq", "XboxTitleID": "3sE9iJmH", "localizedSessionName": {"srBqTqQd": {}, "MutMEtRX": {}, "J6l3GHVL": {}}}, "PSNBaseUrl": "UVjSYoQw", "amsClaimTimeoutMinutes": 39, "appName": "OXqDuX0Y", "asyncProcessDSRequest": {"async": false, "timeout": 87}, "attributes": {"nDxIrZBg": {}, "8X5eY9HW": {}, "LFyyobZ5": {}}, "autoJoin": false, "autoLeaveSession": false, "clientVersion": "pBUF6Lap", "customURLGRPC": "niGXB0nX", "deployment": "z1UHGTi9", "disableCodeGeneration": false, "disableResendInvite": false, "dsManualSetReady": false, "dsSource": "qCxhIt3E", "enableSecret": false, "fallbackClaimKeys": ["O9iyXzmL", "eevpO3g5", "I0UUDZnr"], "grpcSessionConfig": {"appName": "Lyt3XhtS", "customURL": "L9E1tmDv", "functionFlag": 99}, "immutableStorage": false, "inactiveTimeout": 26, "inviteTimeout": 20, "joinability": "FRIENDS_OF_LEADER", "leaderElectionGracePeriod": 76, "manualRejoin": false, "maxActiveSessions": 45, "maxPlayers": 76, "minPlayers": 95, "name": "2ozVFpPd", "partyCodeGeneratorString": "4rY2Uapl", "partyCodeLength": 43, "persistent": false, "preferredClaimKeys": ["GSC4S0T3", "V2hPPTih", "8rpfBMze"], "requestedRegions": ["gKPpilf3", "Ii3bA42c", "Hrsd1ncb"], "textChat": false, "textChatMode": "TEAM", "tieTeamsSessionLifetime": false, "ttlHours": 1, "type": "DS"}' \
    > test.out 2>&1
eval_tap $? 19 'AdminUpdateConfigurationTemplateV1' test.out

#- 20 AdminDeleteConfigurationTemplateV1
./ng net.accelbyte.sdk.cli.Main session adminDeleteConfigurationTemplateV1 \
    --name 'o4gz6q7i' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 20 'AdminDeleteConfigurationTemplateV1' test.out

#- 21 AdminGetMemberActiveSession
./ng net.accelbyte.sdk.cli.Main session adminGetMemberActiveSession \
    --name 'wj3uGO5q' \
    --namespace "$AB_NAMESPACE" \
    --userId 'HJD74FCR' \
    > test.out 2>&1
eval_tap $? 21 'AdminGetMemberActiveSession' test.out

#- 22 AdminReconcileMaxActiveSession
./ng net.accelbyte.sdk.cli.Main session adminReconcileMaxActiveSession \
    --name 'tlzKARB7' \
    --namespace "$AB_NAMESPACE" \
    --body '{"userID": "5AjNqYpD"}' \
    > test.out 2>&1
eval_tap $? 22 'AdminReconcileMaxActiveSession' test.out

#- 23 AdminGetDSMCConfiguration
eval_tap 0 23 'AdminGetDSMCConfiguration # SKIP deprecated' test.out

#- 24 AdminSyncDSMCConfiguration
eval_tap 0 24 'AdminSyncDSMCConfiguration # SKIP deprecated' test.out

#- 25 AdminQueryGameSessions
./ng net.accelbyte.sdk.cli.Main session adminQueryGameSessions \
    --namespace "$AB_NAMESPACE" \
    --configurationName 'JUqUpErO' \
    --dsPodName 'RexzzWye' \
    --fromTime 'yv7Ehxmo' \
    --gameMode 'UFOEwsjt' \
    --isPersistent 'fmZkvJbz' \
    --isSoftDeleted 'IZIgPyJp' \
    --joinability 'FRIENDS_OF_MEMBERS' \
    --limit '15' \
    --matchPool 'WYPfFJeS' \
    --memberID '3tEU61io' \
    --offset '23' \
    --order 'ntw0eRl3' \
    --orderBy 'WBJ3DbKQ' \
    --sessionID 'CQAcJBA4' \
    --status 'DS_ERROR' \
    --statusV2 'DS_ERROR' \
    --toTime 'JJYrWrP7' \
    > test.out 2>&1
eval_tap $? 25 'AdminQueryGameSessions' test.out

#- 26 AdminQueryGameSessionsByAttributes
./ng net.accelbyte.sdk.cli.Main session adminQueryGameSessionsByAttributes \
    --namespace "$AB_NAMESPACE" \
    --body '{"7QTslIrO": {}, "pAzKpuDw": {}, "pXVeixTX": {}}' \
    > test.out 2>&1
eval_tap $? 26 'AdminQueryGameSessionsByAttributes' test.out

#- 27 AdminDeleteBulkGameSessions
./ng net.accelbyte.sdk.cli.Main session adminDeleteBulkGameSessions \
    --namespace "$AB_NAMESPACE" \
    --body '{"ids": ["WOvYIUbq", "dPk4R9Ft", "Wn0nBfjY"]}' \
    > test.out 2>&1
eval_tap $? 27 'AdminDeleteBulkGameSessions' test.out

#- 28 AdminSetDSReady
./ng net.accelbyte.sdk.cli.Main session adminSetDSReady \
    --namespace "$AB_NAMESPACE" \
    --sessionId '6OJzo9uh' \
    --body '{"ready": true}' \
    > test.out 2>&1
eval_tap $? 28 'AdminSetDSReady' test.out

#- 29 AdminUpdateDSInformation
./ng net.accelbyte.sdk.cli.Main session adminUpdateDSInformation \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'IytustO3' \
    --body '{"createdRegion": "PavkWd9r", "deployment": "zJqPgZvp", "description": "gXLMtm5h", "ip": "C7sYyyGE", "port": 79, "region": "D2SuS212", "serverId": "jws4iaon", "source": "BjGXGMPX", "status": "8Ql6Fusp"}' \
    > test.out 2>&1
eval_tap $? 29 'AdminUpdateDSInformation' test.out

#- 30 AdminKickGameSessionMember
./ng net.accelbyte.sdk.cli.Main session adminKickGameSessionMember \
    --memberId '4zCNts81' \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'ugIoRyvc' \
    > test.out 2>&1
eval_tap $? 30 'AdminKickGameSessionMember' test.out

#- 31 AdminUpdateGameSessionMember
./ng net.accelbyte.sdk.cli.Main session adminUpdateGameSessionMember \
    --memberId 'MuS4xBfD' \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'DWf5vk4h' \
    --statusType 'USP7hkwa' \
    > test.out 2>&1
eval_tap $? 31 'AdminUpdateGameSessionMember' test.out

#- 32 AdminGetListNativeSession
./ng net.accelbyte.sdk.cli.Main session adminGetListNativeSession \
    --namespace "$AB_NAMESPACE" \
    --limit '89' \
    --offset '56' \
    --order '8590rt5d' \
    > test.out 2>&1
eval_tap $? 32 'AdminGetListNativeSession' test.out

#- 33 AdminQueryParties
./ng net.accelbyte.sdk.cli.Main session adminQueryParties \
    --namespace "$AB_NAMESPACE" \
    --configurationName 'crGRpZxa' \
    --fromTime 'H4DaIb60' \
    --isSoftDeleted 'WUaBX564' \
    --joinability 'FRIENDS_OF_FRIENDS' \
    --key 'ZPCIUXbH' \
    --leaderID '2FNkwLNT' \
    --limit '30' \
    --memberID 'vnlRF7HD' \
    --memberStatus 'DROPPED' \
    --offset '21' \
    --order 'O4nVMakG' \
    --orderBy '76PzK6nm' \
    --partyID 'vrzAp5Bd' \
    --toTime 'PgumrDZy' \
    --value 'RBZU41Df' \
    > test.out 2>&1
eval_tap $? 33 'AdminQueryParties' test.out

#- 34 AdminDeleteBulkParties
./ng net.accelbyte.sdk.cli.Main session adminDeleteBulkParties \
    --namespace "$AB_NAMESPACE" \
    --body '{"ids": ["DeqakqiO", "kLqkr6Ms", "HPeAm8Km"]}' \
    > test.out 2>&1
eval_tap $? 34 'AdminDeleteBulkParties' test.out

#- 35 AdminReadPartySessionStorage
./ng net.accelbyte.sdk.cli.Main session adminReadPartySessionStorage \
    --namespace "$AB_NAMESPACE" \
    --partyId 'SASMl0qI' \
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
    --body '{"psn": {"clientId": "ne86aJiS", "clientSecret": "mG51cBKv", "scope": "6AhM1tQP"}}' \
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
    --limit '57' \
    --userId 'Iv6gKmEY' \
    > test.out 2>&1
eval_tap $? 41 'AdminGetRecentPlayer' test.out

#- 42 AdminGetRecentTeamPlayer
./ng net.accelbyte.sdk.cli.Main session adminGetRecentTeamPlayer \
    --namespace "$AB_NAMESPACE" \
    --limit '24' \
    --userId 'xDnwKRrX' \
    > test.out 2>&1
eval_tap $? 42 'AdminGetRecentTeamPlayer' test.out

#- 43 AdminReadSessionStorage
./ng net.accelbyte.sdk.cli.Main session adminReadSessionStorage \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'xndmRwlc' \
    > test.out 2>&1
eval_tap $? 43 'AdminReadSessionStorage' test.out

#- 44 AdminDeleteUserSessionStorage
./ng net.accelbyte.sdk.cli.Main session adminDeleteUserSessionStorage \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'BaOdEFvY' \
    > test.out 2>&1
eval_tap $? 44 'AdminDeleteUserSessionStorage' test.out

#- 45 AdminReadUserSessionStorage
./ng net.accelbyte.sdk.cli.Main session adminReadUserSessionStorage \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'QQ4zE6iJ' \
    --userId 'ggeciAbT' \
    > test.out 2>&1
eval_tap $? 45 'AdminReadUserSessionStorage' test.out

#- 46 AdminQueryPlayerAttributes
./ng net.accelbyte.sdk.cli.Main session adminQueryPlayerAttributes \
    --namespace "$AB_NAMESPACE" \
    --users '5wcU6Rm9' \
    > test.out 2>&1
eval_tap $? 46 'AdminQueryPlayerAttributes' test.out

#- 47 AdminGetPlayerAttributes
./ng net.accelbyte.sdk.cli.Main session adminGetPlayerAttributes \
    --namespace "$AB_NAMESPACE" \
    --userId 'BnovMb7p' \
    > test.out 2>&1
eval_tap $? 47 'AdminGetPlayerAttributes' test.out

#- 48 AdminSyncNativeSession
./ng net.accelbyte.sdk.cli.Main session adminSyncNativeSession \
    --namespace "$AB_NAMESPACE" \
    --userId 'NVUmt9jk' \
    > test.out 2>&1
eval_tap $? 48 'AdminSyncNativeSession' test.out

#- 49 CreateGameSession
./ng net.accelbyte.sdk.cli.Main session createGameSession \
    --namespace "$AB_NAMESPACE" \
    --resolveMaxActiveSession  \
    --body '{"appName": "lcD4pKeF", "attributes": {"jqJefN0e": {}, "J8FGPYnW": {}, "52wTRsHI": {}}, "autoJoin": false, "backfillTicketID": "oEinAAVK", "clientVersion": "UUpEljHQ", "configurationName": "8viM3YfC", "customURLGRPC": "c0sEwfAh", "deployment": "hpKW1PK7", "dsSource": "PwkwIJxB", "fallbackClaimKeys": ["3wp4vYsC", "ozDnaot5", "J6e8whTw"], "inactiveTimeout": 89, "inviteTimeout": 76, "joinability": "FRIENDS_OF_MEMBERS", "matchPool": "7cgy3KTv", "maxPlayers": 63, "minPlayers": 87, "preferredClaimKeys": ["uteFKoy9", "00LFH6IC", "1HFS48tm"], "requestedRegions": ["KlzfxUsN", "5SRTyUMS", "CqfnyILo"], "serverName": "NUPVFRv4", "storage": {"leader": {"RvY2xaCx": {}, "eXZ0JsVj": {}, "pXqj8gvi": {}}}, "teams": [{"parties": [{"partyID": "EUehdr87", "userIDs": ["GhzphsQE", "W5XjD7kL", "yC0qf5mo"]}, {"partyID": "BtpbGJp3", "userIDs": ["V4qDudeD", "WulGsEt0", "UknTs6mO"]}, {"partyID": "zFayRlgn", "userIDs": ["tBfgMXUX", "mimOpmzm", "ciStLIvo"]}], "teamID": "bYgmkFdR", "userIDs": ["KEMevlH2", "2ZKi1Gr4", "BmXTUxkz"]}, {"parties": [{"partyID": "9n7OWDxc", "userIDs": ["FAuvAhxr", "iBhZNspp", "5hGq4WQQ"]}, {"partyID": "tabHEAst", "userIDs": ["8tldUx8f", "Anuz4fFR", "20Hm04Yl"]}, {"partyID": "bVMKEfnh", "userIDs": ["EJUu7INH", "5uf0xg8F", "JOnRQbVw"]}], "teamID": "XKndwL7i", "userIDs": ["djf3WHyG", "DfW9HRaz", "dczUaLNW"]}, {"parties": [{"partyID": "cnyn9ocK", "userIDs": ["1iaOcxlt", "4OCH30Ze", "fpXP7ciJ"]}, {"partyID": "86DGbeCO", "userIDs": ["oTD1HOw6", "a8Cfkfyd", "oiXGs9Zm"]}, {"partyID": "f6UeJLS8", "userIDs": ["Q6a8s819", "mTiSBblU", "HXLTcNBb"]}], "teamID": "SWnXoz1T", "userIDs": ["Df3pLtXl", "3t6cdp18", "KqMLIvjE"]}], "textChat": true, "textChatMode": "TEAM", "ticketIDs": ["rtezI2rZ", "79GYENb3", "1Sqy2t8o"], "tieTeamsSessionLifetime": true, "type": "P2P"}' \
    > test.out 2>&1
eval_tap $? 49 'CreateGameSession' test.out

#- 50 PublicQueryGameSessionsByAttributes
./ng net.accelbyte.sdk.cli.Main session publicQueryGameSessionsByAttributes \
    --namespace "$AB_NAMESPACE" \
    --body '{"E0h4KjiV": {}, "NMdekeYf": {}, "goJREdXy": {}}' \
    > test.out 2>&1
eval_tap $? 50 'PublicQueryGameSessionsByAttributes' test.out

#- 51 PublicSessionJoinCode
./ng net.accelbyte.sdk.cli.Main session publicSessionJoinCode \
    --namespace "$AB_NAMESPACE" \
    --body '{"code": "mi9KP8sC"}' \
    > test.out 2>&1
eval_tap $? 51 'PublicSessionJoinCode' test.out

#- 52 GetGameSessionByPodName
./ng net.accelbyte.sdk.cli.Main session getGameSessionByPodName \
    --namespace "$AB_NAMESPACE" \
    --podName 'h9TWEmLD' \
    > test.out 2>&1
eval_tap $? 52 'GetGameSessionByPodName' test.out

#- 53 GetGameSession
./ng net.accelbyte.sdk.cli.Main session getGameSession \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'kJ0CQd9b' \
    > test.out 2>&1
eval_tap $? 53 'GetGameSession' test.out

#- 54 UpdateGameSession
./ng net.accelbyte.sdk.cli.Main session updateGameSession \
    --namespace "$AB_NAMESPACE" \
    --sessionId '8pYNU6FS' \
    --body '{"attributes": {"MmijFpUe": {}, "Fx22SvSa": {}, "UvvPzBpZ": {}}, "backfillTicketID": "EaxvFZ9k", "clientVersion": "VuV5Evgy", "deployment": "GvrVyd2c", "fallbackClaimKeys": ["ISLv959c", "uHhApGk6", "lxtbsc9f"], "inactiveTimeout": 92, "inviteTimeout": 0, "joinability": "INVITE_ONLY", "matchPool": "GwX41bU4", "maxPlayers": 30, "minPlayers": 14, "preferredClaimKeys": ["dYSSJWmZ", "od7IDFJb", "0tyDrJO7"], "requestedRegions": ["8gvnWtWE", "49ZkwIeU", "LIRAfMp5"], "teams": [{"parties": [{"partyID": "mia2iZWZ", "userIDs": ["vFotfpTV", "u4QAYF0o", "RGFyUwsY"]}, {"partyID": "GrLoFQ5M", "userIDs": ["CJb5SqC6", "lHiYRWFa", "TVQRjoMt"]}, {"partyID": "sEIr4DDf", "userIDs": ["YsxWZRIl", "6Azz6ZIb", "9Mp12pyQ"]}], "teamID": "DeIDfXWV", "userIDs": ["K6kQIY22", "RjynQoFo", "dRLu7rlA"]}, {"parties": [{"partyID": "3TIwdwHa", "userIDs": ["L7cfT2fi", "5JwVVn83", "7FHHO1Xm"]}, {"partyID": "dsi4d1tf", "userIDs": ["hybSWYj8", "CWPMXKRg", "HWQWvBum"]}, {"partyID": "VH30y0jh", "userIDs": ["iIHbRwsx", "reucL7WG", "duQg9pKx"]}], "teamID": "zJojg1vU", "userIDs": ["xVgcalXf", "wS8AHBen", "PuPSMvLt"]}, {"parties": [{"partyID": "Ny4Gxiqo", "userIDs": ["OdAFpXcv", "ZqVIBoeL", "AIwjD7Lv"]}, {"partyID": "JeuJh0ys", "userIDs": ["dCR2LZwb", "sIxY1LN3", "RHWatQ91"]}, {"partyID": "eYJ6gd3z", "userIDs": ["IftQEEKz", "9fXYDSbf", "5UqFqGP0"]}], "teamID": "DMDRfSOI", "userIDs": ["1q4N90aB", "hM1XM2Ot", "qDJLfzH0"]}], "ticketIDs": ["QcVl9shm", "BQikCGA6", "Ed6IJUJL"], "tieTeamsSessionLifetime": true, "type": "NONE", "version": 74}' \
    > test.out 2>&1
eval_tap $? 54 'UpdateGameSession' test.out

#- 55 DeleteGameSession
./ng net.accelbyte.sdk.cli.Main session deleteGameSession \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'RmGywSDB' \
    > test.out 2>&1
eval_tap $? 55 'DeleteGameSession' test.out

#- 56 PatchUpdateGameSession
./ng net.accelbyte.sdk.cli.Main session patchUpdateGameSession \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'pnGwND2J' \
    --body '{"attributes": {"D9E41vDQ": {}, "Xitity69": {}, "PMIndgNG": {}}, "backfillTicketID": "cjRvLgTA", "clientVersion": "cjOnWmes", "deployment": "6Ps5zfZi", "fallbackClaimKeys": ["QKShdIwQ", "4bGJBwFs", "a27sXpKP"], "inactiveTimeout": 93, "inviteTimeout": 35, "joinability": "CLOSED", "matchPool": "zTqQGDjZ", "maxPlayers": 50, "minPlayers": 88, "preferredClaimKeys": ["6pO6J0eW", "EnVeKJP2", "idXx6ZTg"], "requestedRegions": ["YtmyUZWo", "FjH6uHQO", "2yo2A1TW"], "teams": [{"parties": [{"partyID": "HT5Anbm3", "userIDs": ["aYWO0m64", "yfgctewz", "CRHoKMk1"]}, {"partyID": "jAFAB6bc", "userIDs": ["VW3tddv2", "LVZivjml", "3gJMBJkT"]}, {"partyID": "3R542Ro1", "userIDs": ["HmfaNRxq", "me1aXCDf", "x7bXnbko"]}], "teamID": "9oRvQSvC", "userIDs": ["0FugX7uz", "MAfNZv0V", "puZxiKom"]}, {"parties": [{"partyID": "02f15HwK", "userIDs": ["rmsJpTFY", "kwCmop5A", "WGLIDNMh"]}, {"partyID": "ynOX7s7Z", "userIDs": ["r8vRMS9i", "UW0GyxAz", "GHTJy3cl"]}, {"partyID": "2hIaOv9X", "userIDs": ["2hgiRC0c", "AzZ889ml", "dZp1VeM3"]}], "teamID": "u9x7ahUQ", "userIDs": ["k7u7qdZO", "YE8SFwMy", "l9Ti6kCD"]}, {"parties": [{"partyID": "yTbbabSG", "userIDs": ["2cLWFnpR", "ppMBmn8q", "43uWUhL6"]}, {"partyID": "C4ruJkIs", "userIDs": ["1B3Kz18Q", "NAKzPSCS", "CFKQmBYV"]}, {"partyID": "SWpWKgdX", "userIDs": ["eYW5x810", "OQsP62l8", "S1NWaihG"]}], "teamID": "bxqwA2Vd", "userIDs": ["yOpGjxMG", "82IgrL36", "UbVhdF1V"]}], "ticketIDs": ["Bd4MDA42", "0s4oYEvA", "8MxTjBOC"], "tieTeamsSessionLifetime": true, "type": "DS", "version": 97}' \
    > test.out 2>&1
eval_tap $? 56 'PatchUpdateGameSession' test.out

#- 57 UpdateGameSessionBackfillTicketID
./ng net.accelbyte.sdk.cli.Main session updateGameSessionBackfillTicketID \
    --namespace "$AB_NAMESPACE" \
    --sessionId '12MM1Dty' \
    --body '{"backfillTicketID": "4xX8bPRS"}' \
    > test.out 2>&1
eval_tap $? 57 'UpdateGameSessionBackfillTicketID' test.out

#- 58 GameSessionGenerateCode
./ng net.accelbyte.sdk.cli.Main session gameSessionGenerateCode \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'N9E1TSI4' \
    > test.out 2>&1
eval_tap $? 58 'GameSessionGenerateCode' test.out

#- 59 PublicRevokeGameSessionCode
./ng net.accelbyte.sdk.cli.Main session publicRevokeGameSessionCode \
    --namespace "$AB_NAMESPACE" \
    --sessionId '2x2h2C7X' \
    > test.out 2>&1
eval_tap $? 59 'PublicRevokeGameSessionCode' test.out

#- 60 PublicGameSessionInvite
./ng net.accelbyte.sdk.cli.Main session publicGameSessionInvite \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'w6QokkgR' \
    --body '{"metadata": {"GYq6Ub2F": "ctGdmvnw", "k3rwpgKN": "hSpc9NsO", "2LkQ4dd5": "5CZAkONq"}, "platformID": "C1QUbuF0", "userID": "jhxyHcAN"}' \
    > test.out 2>&1
eval_tap $? 60 'PublicGameSessionInvite' test.out

#- 61 JoinGameSession
./ng net.accelbyte.sdk.cli.Main session joinGameSession \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'wnJr0E2I' \
    > test.out 2>&1
eval_tap $? 61 'JoinGameSession' test.out

#- 62 PublicPromoteGameSessionLeader
./ng net.accelbyte.sdk.cli.Main session publicPromoteGameSessionLeader \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'jao8SKNX' \
    --body '{"leaderID": "9JuEJ0J7"}' \
    > test.out 2>&1
eval_tap $? 62 'PublicPromoteGameSessionLeader' test.out

#- 63 LeaveGameSession
./ng net.accelbyte.sdk.cli.Main session leaveGameSession \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'e7ZKGvmK' \
    > test.out 2>&1
eval_tap $? 63 'LeaveGameSession' test.out

#- 64 PublicKickGameSessionMember
./ng net.accelbyte.sdk.cli.Main session publicKickGameSessionMember \
    --memberId 'j9UebJ0L' \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'mIetzf8S' \
    > test.out 2>&1
eval_tap $? 64 'PublicKickGameSessionMember' test.out

#- 65 PublicGameSessionReject
./ng net.accelbyte.sdk.cli.Main session publicGameSessionReject \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'dFBszAO9' \
    > test.out 2>&1
eval_tap $? 65 'PublicGameSessionReject' test.out

#- 66 GetSessionServerSecret
./ng net.accelbyte.sdk.cli.Main session getSessionServerSecret \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'i2bjjbe2' \
    > test.out 2>&1
eval_tap $? 66 'GetSessionServerSecret' test.out

#- 67 AppendTeamGameSession
eval_tap 0 67 'AppendTeamGameSession # SKIP deprecated' test.out

#- 68 PublicGameSessionCancel
./ng net.accelbyte.sdk.cli.Main session publicGameSessionCancel \
    --namespace "$AB_NAMESPACE" \
    --sessionId '4cgJlWTd' \
    --userId 'nYv2ZHhF' \
    > test.out 2>&1
eval_tap $? 68 'PublicGameSessionCancel' test.out

#- 69 PublicPartyJoinCode
./ng net.accelbyte.sdk.cli.Main session publicPartyJoinCode \
    --namespace "$AB_NAMESPACE" \
    --body '{"code": "YTiiAJs9"}' \
    > test.out 2>&1
eval_tap $? 69 'PublicPartyJoinCode' test.out

#- 70 PublicGetParty
./ng net.accelbyte.sdk.cli.Main session publicGetParty \
    --namespace "$AB_NAMESPACE" \
    --partyId 'J25tQ7U3' \
    > test.out 2>&1
eval_tap $? 70 'PublicGetParty' test.out

#- 71 PublicUpdateParty
./ng net.accelbyte.sdk.cli.Main session publicUpdateParty \
    --namespace "$AB_NAMESPACE" \
    --partyId 'o2gXKZ6y' \
    --body '{"attributes": {"k6acyxtq": {}, "Bi9bF7RF": {}, "UVEwT1Oh": {}}, "inactiveTimeout": 70, "inviteTimeout": 74, "joinability": "FRIENDS_OF_MEMBERS", "maxPlayers": 82, "minPlayers": 72, "type": "DS", "version": 19}' \
    > test.out 2>&1
eval_tap $? 71 'PublicUpdateParty' test.out

#- 72 PublicPatchUpdateParty
./ng net.accelbyte.sdk.cli.Main session publicPatchUpdateParty \
    --namespace "$AB_NAMESPACE" \
    --partyId 'dO0hwsZG' \
    --body '{"attributes": {"i4HMTLOB": {}, "aAyhgvRA": {}, "Qomd8L0B": {}}, "inactiveTimeout": 67, "inviteTimeout": 80, "joinability": "CLOSED", "maxPlayers": 89, "minPlayers": 100, "type": "P2P", "version": 89}' \
    > test.out 2>&1
eval_tap $? 72 'PublicPatchUpdateParty' test.out

#- 73 PublicGeneratePartyCode
./ng net.accelbyte.sdk.cli.Main session publicGeneratePartyCode \
    --namespace "$AB_NAMESPACE" \
    --partyId 'iWSEXmr6' \
    > test.out 2>&1
eval_tap $? 73 'PublicGeneratePartyCode' test.out

#- 74 PublicRevokePartyCode
./ng net.accelbyte.sdk.cli.Main session publicRevokePartyCode \
    --namespace "$AB_NAMESPACE" \
    --partyId 'Xh07p9Hg' \
    > test.out 2>&1
eval_tap $? 74 'PublicRevokePartyCode' test.out

#- 75 PublicPartyInvite
./ng net.accelbyte.sdk.cli.Main session publicPartyInvite \
    --namespace "$AB_NAMESPACE" \
    --partyId 'V4DS8KPN' \
    --body '{"metadata": {"7WEFi3gr": "YoyrC58u", "c8THjHUD": "xVyIZVKv", "ejVPbWCk": "VJXZ0eKA"}, "platformID": "FYbtpqi3", "userID": "HL1YtBpp"}' \
    > test.out 2>&1
eval_tap $? 75 'PublicPartyInvite' test.out

#- 76 PublicPromotePartyLeader
./ng net.accelbyte.sdk.cli.Main session publicPromotePartyLeader \
    --namespace "$AB_NAMESPACE" \
    --partyId 'UjEd2gP4' \
    --body '{"leaderID": "qpBLUv4W"}' \
    > test.out 2>&1
eval_tap $? 76 'PublicPromotePartyLeader' test.out

#- 77 PublicReadPartySessionStorage
./ng net.accelbyte.sdk.cli.Main session publicReadPartySessionStorage \
    --namespace "$AB_NAMESPACE" \
    --partyId 'doQLhDQM' \
    > test.out 2>&1
eval_tap $? 77 'PublicReadPartySessionStorage' test.out

#- 78 PublicUpdateInsertPartySessionStorage
./ng net.accelbyte.sdk.cli.Main session publicUpdateInsertPartySessionStorage \
    --namespace "$AB_NAMESPACE" \
    --partyId '3eURz8lf' \
    --userId 'btB7K2U1' \
    --body '{"eyhKHioA": {}, "SGoqImZz": {}, "UsPJlaIJ": {}}' \
    > test.out 2>&1
eval_tap $? 78 'PublicUpdateInsertPartySessionStorage' test.out

#- 79 PublicUpdateInsertPartySessionStorageReserved
./ng net.accelbyte.sdk.cli.Main session publicUpdateInsertPartySessionStorageReserved \
    --namespace "$AB_NAMESPACE" \
    --partyId 'MP3V924v' \
    --userId 'mjZHW7eL' \
    --body '{"BLJDkxP7": {}, "WkGjO9E0": {}, "8KDB5gCr": {}}' \
    > test.out 2>&1
eval_tap $? 79 'PublicUpdateInsertPartySessionStorageReserved' test.out

#- 80 PublicPartyJoin
./ng net.accelbyte.sdk.cli.Main session publicPartyJoin \
    --namespace "$AB_NAMESPACE" \
    --partyId 'NEW6RIla' \
    > test.out 2>&1
eval_tap $? 80 'PublicPartyJoin' test.out

#- 81 PublicPartyLeave
./ng net.accelbyte.sdk.cli.Main session publicPartyLeave \
    --namespace "$AB_NAMESPACE" \
    --partyId '5ZNtedZv' \
    > test.out 2>&1
eval_tap $? 81 'PublicPartyLeave' test.out

#- 82 PublicPartyReject
./ng net.accelbyte.sdk.cli.Main session publicPartyReject \
    --namespace "$AB_NAMESPACE" \
    --partyId 'JVJRS6FT' \
    > test.out 2>&1
eval_tap $? 82 'PublicPartyReject' test.out

#- 83 PublicPartyCancel
./ng net.accelbyte.sdk.cli.Main session publicPartyCancel \
    --namespace "$AB_NAMESPACE" \
    --partyId 'DNQD08sn' \
    --userId 'WQ4OsEQT' \
    > test.out 2>&1
eval_tap $? 83 'PublicPartyCancel' test.out

#- 84 PublicPartyKick
./ng net.accelbyte.sdk.cli.Main session publicPartyKick \
    --namespace "$AB_NAMESPACE" \
    --partyId 'CH4YUR66' \
    --userId 'QTgjeJDN' \
    > test.out 2>&1
eval_tap $? 84 'PublicPartyKick' test.out

#- 85 PublicCreateParty
./ng net.accelbyte.sdk.cli.Main session publicCreateParty \
    --namespace "$AB_NAMESPACE" \
    --body '{"attributes": {"MOu3TzEk": {}, "fTy2Pgy8": {}, "6BqFhW8t": {}}, "configurationName": "98VNOd5Y", "inactiveTimeout": 38, "inviteTimeout": 58, "joinability": "OPEN", "maxPlayers": 29, "members": [{"ID": "JA9fxh8t", "PlatformID": "6rh2Vo0m", "PlatformUserID": "LZed8bKr"}, {"ID": "rtVkWpUH", "PlatformID": "1prijbrs", "PlatformUserID": "3PnNQSBI"}, {"ID": "Apn8svV9", "PlatformID": "PYLTSSzD", "PlatformUserID": "lj3179V0"}], "minPlayers": 27, "textChat": true, "type": "NONE"}' \
    > test.out 2>&1
eval_tap $? 85 'PublicCreateParty' test.out

#- 86 PublicGetRecentPlayer
./ng net.accelbyte.sdk.cli.Main session publicGetRecentPlayer \
    --namespace "$AB_NAMESPACE" \
    --limit '39' \
    > test.out 2>&1
eval_tap $? 86 'PublicGetRecentPlayer' test.out

#- 87 PublicGetRecentTeamPlayer
./ng net.accelbyte.sdk.cli.Main session publicGetRecentTeamPlayer \
    --namespace "$AB_NAMESPACE" \
    --limit '98' \
    > test.out 2>&1
eval_tap $? 87 'PublicGetRecentTeamPlayer' test.out

#- 88 PublicUpdateInsertSessionStorageLeader
./ng net.accelbyte.sdk.cli.Main session publicUpdateInsertSessionStorageLeader \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'CSOyVDA3' \
    --body '{"wkBhtJ1I": {}, "Mofkq3O2": {}, "dElucKmG": {}}' \
    > test.out 2>&1
eval_tap $? 88 'PublicUpdateInsertSessionStorageLeader' test.out

#- 89 PublicUpdateInsertSessionStorage
./ng net.accelbyte.sdk.cli.Main session publicUpdateInsertSessionStorage \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'upr80jAj' \
    --userId 'kmHGJq8v' \
    --body '{"rCXvJEv3": {}, "vsc7LkuE": {}, "4Cg84QMk": {}}' \
    > test.out 2>&1
eval_tap $? 89 'PublicUpdateInsertSessionStorage' test.out

#- 90 PublicGetBulkPlayerCurrentPlatform
./ng net.accelbyte.sdk.cli.Main session publicGetBulkPlayerCurrentPlatform \
    --namespace "$AB_NAMESPACE" \
    --body '{"userIDs": ["sF5hpEUg", "7BRf9dbt", "znr6t2jc"]}' \
    > test.out 2>&1
eval_tap $? 90 'PublicGetBulkPlayerCurrentPlatform' test.out

#- 91 PublicGetPlayerAttributes
./ng net.accelbyte.sdk.cli.Main session publicGetPlayerAttributes \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 91 'PublicGetPlayerAttributes' test.out

#- 92 PublicStorePlayerAttributes
./ng net.accelbyte.sdk.cli.Main session publicStorePlayerAttributes \
    --namespace "$AB_NAMESPACE" \
    --body '{"crossplayEnabled": false, "currentPlatform": "WS8YUxnH", "data": {"bGZKAGYM": {}, "h6plYeUC": {}, "Ngw1wPzq": {}}, "platforms": [{"name": "4Y61mPwW", "userID": "F9rThW1K"}, {"name": "HoB13tx4", "userID": "DQnl1Jbb"}, {"name": "KjtnQ80A", "userID": "u1d9wVty"}], "roles": ["QvLe9U1K", "33aBlQxv", "qjy6vzlO"], "simultaneousPlatform": "YbOC7wlz"}' \
    > test.out 2>&1
eval_tap $? 92 'PublicStorePlayerAttributes' test.out

#- 93 PublicDeletePlayerAttributes
./ng net.accelbyte.sdk.cli.Main session publicDeletePlayerAttributes \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 93 'PublicDeletePlayerAttributes' test.out

#- 94 PublicQueryMyGameSessions
./ng net.accelbyte.sdk.cli.Main session publicQueryMyGameSessions \
    --namespace "$AB_NAMESPACE" \
    --order 'LC5Wt8dX' \
    --orderBy 'uTNpxhxF' \
    --status 'VS0ZcXIE' \
    > test.out 2>&1
eval_tap $? 94 'PublicQueryMyGameSessions' test.out

#- 95 PublicQueryMyParties
./ng net.accelbyte.sdk.cli.Main session publicQueryMyParties \
    --namespace "$AB_NAMESPACE" \
    --order '3VGftOPn' \
    --orderBy 'mHNA5m9Z' \
    --status 'SQA9cuI6' \
    > test.out 2>&1
eval_tap $? 95 'PublicQueryMyParties' test.out


rm -f "tmp.dat"

exit $EXIT_CODE