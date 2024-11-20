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
echo "1..90"

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
    --body '{"metricExcludedNamespaces": ["LzdS0moB", "RXCrmVHP", "6GNoNxkW"], "regionRetryMapping": {"fbBXd5vr": ["NwGZItJM", "3os4ZSK9", "hjcAd5vn"], "vKdISCev": ["HgWJFnZi", "214dE3Ji", "iytkZX6r"], "WvV4mnU4": ["2DebMI0D", "zyxrEEsW", "J4sAUVEl"]}, "regionURLMapping": ["XP9S3DLt", "MOuOvX16", "xnoarUad"], "testGameMode": "wds2dokb", "testRegionURLMapping": ["WvBNb5ow", "wVZSiaEE", "0RpnZjJR"], "testTargetUserIDs": ["rAhow8pi", "S9iFGyZo", "FgZnLXi7"]}' \
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
    --body '{"durationDays": 22}' \
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
    --body '{"NativeSessionSetting": {"PSNServiceLabel": 97, "PSNSupportedPlatforms": ["2hAsjOdb", "5NLZz3D9", "0Ftph5UD"], "SessionTitle": "zxDBO5Ng", "ShouldSync": true, "XboxAllowCrossPlatform": true, "XboxSandboxID": "bXiy70Cu", "XboxServiceConfigID": "jvjeVsL9", "XboxSessionTemplateName": "8FpWv2LS", "XboxTitleID": "RSh6RYhc", "localizedSessionName": {"3odaR52d": {}, "XiwShQIU": {}, "4zORkpIP": {}}}, "PSNBaseUrl": "Na8rQtG3", "appName": "FMpqt8GH", "attributes": {"Lnruehpw": {}, "wTxbEHnO": {}, "CTG4pnSJ": {}}, "autoJoin": true, "autoLeaveSession": false, "clientVersion": "qplMKEwP", "customURLGRPC": "UuTVpbc7", "deployment": "ilvHqKjO", "disableCodeGeneration": true, "disableResendInvite": true, "dsManualSetReady": false, "dsSource": "ZQtI8THW", "enableSecret": true, "fallbackClaimKeys": ["bpOnFKmy", "8YzNWQxX", "MehoTY5W"], "grpcSessionConfig": {"appName": "rJ9zkxeF", "customURL": "4kmf2VeS", "functionFlag": 96}, "immutableStorage": false, "inactiveTimeout": 21, "inviteTimeout": 94, "joinability": "fQ32zfzo", "leaderElectionGracePeriod": 42, "manualRejoin": false, "maxActiveSessions": 92, "maxPlayers": 49, "minPlayers": 47, "name": "ZDH2QYzO", "persistent": true, "preferredClaimKeys": ["LrkLUDTj", "eV0B1c2g", "xe1HEnkp"], "requestedRegions": ["VOIQVPID", "EaWQmLn7", "H5aiXvyF"], "textChat": false, "tieTeamsSessionLifetime": false, "type": "GPz27X7N"}' \
    > test.out 2>&1
eval_tap $? 16 'AdminCreateConfigurationTemplateV1' test.out

#- 17 AdminGetAllConfigurationTemplatesV1
./ng net.accelbyte.sdk.cli.Main session adminGetAllConfigurationTemplatesV1 \
    --namespace "$AB_NAMESPACE" \
    --limit '46' \
    --name 'yOzU4TDn' \
    --offset '32' \
    --order 'm63hPrFj' \
    --orderBy 'Dm8OB59M' \
    > test.out 2>&1
eval_tap $? 17 'AdminGetAllConfigurationTemplatesV1' test.out

#- 18 AdminGetConfigurationTemplateV1
./ng net.accelbyte.sdk.cli.Main session adminGetConfigurationTemplateV1 \
    --name 'AqgksmSP' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 18 'AdminGetConfigurationTemplateV1' test.out

#- 19 AdminUpdateConfigurationTemplateV1
./ng net.accelbyte.sdk.cli.Main session adminUpdateConfigurationTemplateV1 \
    --name 'hw5ojhVL' \
    --namespace "$AB_NAMESPACE" \
    --body '{"NativeSessionSetting": {"PSNServiceLabel": 60, "PSNSupportedPlatforms": ["EaOe8aef", "VYSDgdzk", "nTvyrMTM"], "SessionTitle": "X85AiBlu", "ShouldSync": false, "XboxAllowCrossPlatform": true, "XboxSandboxID": "oRwnhr2k", "XboxServiceConfigID": "IGpi8v0t", "XboxSessionTemplateName": "1EJOQ3Ph", "XboxTitleID": "AVw7AYsP", "localizedSessionName": {"ER065dt0": {}, "HJLGC0Fb": {}, "O6N52f07": {}}}, "PSNBaseUrl": "WEVo7z1C", "appName": "wbW7sc8a", "attributes": {"KAak79Yj": {}, "FkFBZOVm": {}, "dnsTHcSH": {}}, "autoJoin": false, "autoLeaveSession": false, "clientVersion": "d4sBujwc", "customURLGRPC": "QfLIvOSG", "deployment": "1hHKCz7f", "disableCodeGeneration": true, "disableResendInvite": false, "dsManualSetReady": true, "dsSource": "5w1S2nka", "enableSecret": true, "fallbackClaimKeys": ["FFosBR0L", "mS1pGCOR", "HdG1iAyu"], "grpcSessionConfig": {"appName": "RGwuRUFL", "customURL": "A5me2TTr", "functionFlag": 88}, "immutableStorage": false, "inactiveTimeout": 40, "inviteTimeout": 98, "joinability": "QVK41oak", "leaderElectionGracePeriod": 16, "manualRejoin": false, "maxActiveSessions": 0, "maxPlayers": 65, "minPlayers": 36, "name": "IbOWLdAn", "persistent": true, "preferredClaimKeys": ["rWSVlrsm", "VyXC2hiy", "tAlc27VA"], "requestedRegions": ["xbCzcpGb", "HDZKU3rg", "rXt0Lms1"], "textChat": true, "tieTeamsSessionLifetime": false, "type": "xQkx2vXU"}' \
    > test.out 2>&1
eval_tap $? 19 'AdminUpdateConfigurationTemplateV1' test.out

#- 20 AdminDeleteConfigurationTemplateV1
./ng net.accelbyte.sdk.cli.Main session adminDeleteConfigurationTemplateV1 \
    --name 'rmkMducf' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 20 'AdminDeleteConfigurationTemplateV1' test.out

#- 21 AdminGetMemberActiveSession
./ng net.accelbyte.sdk.cli.Main session adminGetMemberActiveSession \
    --name 'ZRxChGWu' \
    --namespace "$AB_NAMESPACE" \
    --userId 'ON9h1dsz' \
    > test.out 2>&1
eval_tap $? 21 'AdminGetMemberActiveSession' test.out

#- 22 AdminReconcileMaxActiveSession
./ng net.accelbyte.sdk.cli.Main session adminReconcileMaxActiveSession \
    --name 'vXhK4yNr' \
    --namespace "$AB_NAMESPACE" \
    --body '{"userID": "zNR3A5K2"}' \
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
    --configurationName 'FQyuhV1z' \
    --dsPodName 'uTXMwXDX' \
    --fromTime 'RR6LZiz0' \
    --gameMode '1tItZaLk' \
    --isPersistent 'WHCRSkyP' \
    --isSoftDeleted 'k9JJsi44' \
    --joinability 'qogdsAwf' \
    --limit '46' \
    --matchPool 'N1MrqhWR' \
    --memberID 'PgbOA61O' \
    --offset '78' \
    --order '8HosZ65u' \
    --orderBy 'tfgGW9fZ' \
    --sessionID 'vGLXQECa' \
    --status 'kezH9HUx' \
    --statusV2 'gUjaQiq5' \
    --toTime 'UXNjwpSm' \
    > test.out 2>&1
eval_tap $? 25 'AdminQueryGameSessions' test.out

#- 26 AdminQueryGameSessionsByAttributes
./ng net.accelbyte.sdk.cli.Main session adminQueryGameSessionsByAttributes \
    --namespace "$AB_NAMESPACE" \
    --body '{"BsuJvQE2": {}, "UPcDJb7n": {}, "EilxYYTC": {}}' \
    > test.out 2>&1
eval_tap $? 26 'AdminQueryGameSessionsByAttributes' test.out

#- 27 AdminDeleteBulkGameSessions
./ng net.accelbyte.sdk.cli.Main session adminDeleteBulkGameSessions \
    --namespace "$AB_NAMESPACE" \
    --body '{"ids": ["5jIv6oJA", "lzQNWF1y", "AjWGfZnV"]}' \
    > test.out 2>&1
eval_tap $? 27 'AdminDeleteBulkGameSessions' test.out

#- 28 AdminSetDSReady
./ng net.accelbyte.sdk.cli.Main session adminSetDSReady \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'cy6unNt0' \
    --body '{"ready": false}' \
    > test.out 2>&1
eval_tap $? 28 'AdminSetDSReady' test.out

#- 29 AdminKickGameSessionMember
./ng net.accelbyte.sdk.cli.Main session adminKickGameSessionMember \
    --memberId 'n23jcq75' \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'mz40ADtt' \
    > test.out 2>&1
eval_tap $? 29 'AdminKickGameSessionMember' test.out

#- 30 AdminUpdateGameSessionMember
./ng net.accelbyte.sdk.cli.Main session adminUpdateGameSessionMember \
    --memberId 'HPJZ289O' \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'wx8y2LKt' \
    --statusType 'txr8u7QH' \
    > test.out 2>&1
eval_tap $? 30 'AdminUpdateGameSessionMember' test.out

#- 31 AdminGetListNativeSession
./ng net.accelbyte.sdk.cli.Main session adminGetListNativeSession \
    --namespace "$AB_NAMESPACE" \
    --limit '71' \
    --offset '83' \
    --order 'LQJrQqRo' \
    > test.out 2>&1
eval_tap $? 31 'AdminGetListNativeSession' test.out

#- 32 AdminQueryParties
./ng net.accelbyte.sdk.cli.Main session adminQueryParties \
    --namespace "$AB_NAMESPACE" \
    --isSoftDeleted 'gNzsicum' \
    --joinability '29t9OSmJ' \
    --key 'F9P8T3A7' \
    --leaderID 'ykFPUav4' \
    --limit '26' \
    --memberID 'PPsh7RbB' \
    --memberStatus 'mFZ7knBk' \
    --offset '11' \
    --order '6FcVizLy' \
    --orderBy 'pM36mJzd' \
    --partyID 'dULECqzR' \
    --value 'dVg54mDM' \
    > test.out 2>&1
eval_tap $? 32 'AdminQueryParties' test.out

#- 33 AdminDeleteBulkParties
./ng net.accelbyte.sdk.cli.Main session adminDeleteBulkParties \
    --namespace "$AB_NAMESPACE" \
    --body '{"ids": ["qLpBbURE", "1vZRxiJn", "2pi9QNAm"]}' \
    > test.out 2>&1
eval_tap $? 33 'AdminDeleteBulkParties' test.out

#- 34 AdminGetPlatformCredentials
./ng net.accelbyte.sdk.cli.Main session adminGetPlatformCredentials \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 34 'AdminGetPlatformCredentials' test.out

#- 35 AdminUpdatePlatformCredentials
./ng net.accelbyte.sdk.cli.Main session adminUpdatePlatformCredentials \
    --namespace "$AB_NAMESPACE" \
    --body '{"psn": {"clientId": "cPrL2HVL", "clientSecret": "JyrAiW30", "scope": "JjWRoRUt"}}' \
    > test.out 2>&1
eval_tap $? 35 'AdminUpdatePlatformCredentials' test.out

#- 36 AdminDeletePlatformCredentials
./ng net.accelbyte.sdk.cli.Main session adminDeletePlatformCredentials \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 36 'AdminDeletePlatformCredentials' test.out

#- 37 AdminDeletePlatformCredentialsByPlatformId
./ng net.accelbyte.sdk.cli.Main session adminDeletePlatformCredentialsByPlatformId \
    --namespace "$AB_NAMESPACE" \
    --platformId 'PSN' \
    > test.out 2>&1
eval_tap $? 37 'AdminDeletePlatformCredentialsByPlatformId' test.out

#- 38 AdminSyncPlatformCredentials
./ng net.accelbyte.sdk.cli.Main session adminSyncPlatformCredentials \
    --namespace "$AB_NAMESPACE" \
    --platformId 'XBOX' \
    > test.out 2>&1
eval_tap $? 38 'AdminSyncPlatformCredentials' test.out

#- 39 AdminGetRecentPlayer
./ng net.accelbyte.sdk.cli.Main session adminGetRecentPlayer \
    --namespace "$AB_NAMESPACE" \
    --limit '53' \
    --userId 'Y5zb8Mx9' \
    > test.out 2>&1
eval_tap $? 39 'AdminGetRecentPlayer' test.out

#- 40 AdminGetRecentTeamPlayer
./ng net.accelbyte.sdk.cli.Main session adminGetRecentTeamPlayer \
    --namespace "$AB_NAMESPACE" \
    --limit '20' \
    --userId '8HP0dk5m' \
    > test.out 2>&1
eval_tap $? 40 'AdminGetRecentTeamPlayer' test.out

#- 41 AdminReadSessionStorage
./ng net.accelbyte.sdk.cli.Main session adminReadSessionStorage \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'utQJG5S1' \
    > test.out 2>&1
eval_tap $? 41 'AdminReadSessionStorage' test.out

#- 42 AdminDeleteUserSessionStorage
./ng net.accelbyte.sdk.cli.Main session adminDeleteUserSessionStorage \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'HEAjDZO2' \
    > test.out 2>&1
eval_tap $? 42 'AdminDeleteUserSessionStorage' test.out

#- 43 AdminReadUserSessionStorage
./ng net.accelbyte.sdk.cli.Main session adminReadUserSessionStorage \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'a3kUfyVe' \
    --userId '7B78xCyL' \
    > test.out 2>&1
eval_tap $? 43 'AdminReadUserSessionStorage' test.out

#- 44 AdminQueryPlayerAttributes
./ng net.accelbyte.sdk.cli.Main session adminQueryPlayerAttributes \
    --namespace "$AB_NAMESPACE" \
    --users 'WRPFPlQO' \
    > test.out 2>&1
eval_tap $? 44 'AdminQueryPlayerAttributes' test.out

#- 45 AdminGetPlayerAttributes
./ng net.accelbyte.sdk.cli.Main session adminGetPlayerAttributes \
    --namespace "$AB_NAMESPACE" \
    --userId '77mFIC7u' \
    > test.out 2>&1
eval_tap $? 45 'AdminGetPlayerAttributes' test.out

#- 46 AdminSyncNativeSession
./ng net.accelbyte.sdk.cli.Main session adminSyncNativeSession \
    --namespace "$AB_NAMESPACE" \
    --userId 'EpWtBOFs' \
    > test.out 2>&1
eval_tap $? 46 'AdminSyncNativeSession' test.out

#- 47 CreateGameSession
./ng net.accelbyte.sdk.cli.Main session createGameSession \
    --namespace "$AB_NAMESPACE" \
    --body '{"appName": "DgX6AX8l", "attributes": {"1QFnAqwp": {}, "yvALWRVe": {}, "QooRJhcl": {}}, "autoJoin": true, "backfillTicketID": "C74yNqEj", "clientVersion": "Bf8pOB0V", "configurationName": "SgCiJTSg", "customURLGRPC": "iEe4u9oa", "deployment": "ELE0HEiA", "dsSource": "vgNJOU5f", "fallbackClaimKeys": ["ZcCl6bTo", "RBxrsx1p", "8L4BrIN9"], "inactiveTimeout": 43, "inviteTimeout": 13, "joinability": "kgJmuiPC", "matchPool": "7Pkr7zh6", "maxPlayers": 74, "minPlayers": 87, "preferredClaimKeys": ["ZQisrME2", "aQ6RATYb", "yOmh9KjX"], "requestedRegions": ["vCK7ZiQ6", "ztLGL8us", "BcNhF8B4"], "serverName": "Q9mpeMMm", "storage": {"leader": {"JAhkTUSS": {}, "3IiL0LRV": {}, "FV7yPeiE": {}}}, "teams": [{"parties": [{"partyID": "gVU1fPMH", "userIDs": ["4DVoxUC1", "uLFySGfp", "mLVk61Ub"]}, {"partyID": "H2bEEN69", "userIDs": ["EZcUhweM", "hatWfVRN", "XmOfNh1Z"]}, {"partyID": "Xkv6cF3V", "userIDs": ["FSFOZgqG", "15ay4yja", "Wq0KpGLt"]}], "userIDs": ["CLQdwhiR", "EWYtLYDB", "r3eLI6el"]}, {"parties": [{"partyID": "WEh1vJp1", "userIDs": ["riN3SPk3", "npGWhXVj", "pLlSOZ3i"]}, {"partyID": "QPj2NjM0", "userIDs": ["21tdnI7U", "aqMmkyOc", "YdmWWSel"]}, {"partyID": "UZljgA4w", "userIDs": ["y0fRn6Kp", "y4XG57Cf", "FcEljzd7"]}], "userIDs": ["v7pe2WSE", "2ZIB2eJD", "aALoqeQ7"]}, {"parties": [{"partyID": "Zh6V9PKA", "userIDs": ["dH6vbOk3", "j6woYNQx", "nt4Jklpc"]}, {"partyID": "2OOjRyTM", "userIDs": ["EoCeMtkG", "gqcw1Z0n", "n54TOJL9"]}, {"partyID": "G6tSIXwY", "userIDs": ["14M4ebCP", "OzD0TZCO", "qDPdnpUo"]}], "userIDs": ["mSL7S1Za", "gsZAWgEg", "LAP4freu"]}], "textChat": false, "ticketIDs": ["cdTdax0r", "MxVw1ngC", "Oyp35lcY"], "tieTeamsSessionLifetime": true, "type": "9a73nJja"}' \
    > test.out 2>&1
eval_tap $? 47 'CreateGameSession' test.out

#- 48 PublicQueryGameSessionsByAttributes
./ng net.accelbyte.sdk.cli.Main session publicQueryGameSessionsByAttributes \
    --namespace "$AB_NAMESPACE" \
    --body '{"9YW4PC7W": {}, "gNh9uhNO": {}, "dGehQDyR": {}}' \
    > test.out 2>&1
eval_tap $? 48 'PublicQueryGameSessionsByAttributes' test.out

#- 49 PublicSessionJoinCode
./ng net.accelbyte.sdk.cli.Main session publicSessionJoinCode \
    --namespace "$AB_NAMESPACE" \
    --body '{"code": "VphjG9qz"}' \
    > test.out 2>&1
eval_tap $? 49 'PublicSessionJoinCode' test.out

#- 50 GetGameSessionByPodName
./ng net.accelbyte.sdk.cli.Main session getGameSessionByPodName \
    --namespace "$AB_NAMESPACE" \
    --podName 'fZeRkTTi' \
    > test.out 2>&1
eval_tap $? 50 'GetGameSessionByPodName' test.out

#- 51 GetGameSession
./ng net.accelbyte.sdk.cli.Main session getGameSession \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'S0a3QZr7' \
    > test.out 2>&1
eval_tap $? 51 'GetGameSession' test.out

#- 52 UpdateGameSession
./ng net.accelbyte.sdk.cli.Main session updateGameSession \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'yLtl2d8i' \
    --body '{"attributes": {"JYmyMQky": {}, "KPLl8jaj": {}, "LXlx7Qaf": {}}, "backfillTicketID": "evCCCc5J", "clientVersion": "fKF5hQyI", "deployment": "QhiCzr5b", "fallbackClaimKeys": ["HwZy8hR5", "JCfCPtsu", "CLAvCrEx"], "inactiveTimeout": 73, "inviteTimeout": 7, "joinability": "N4GED1hM", "matchPool": "RdvVnmh9", "maxPlayers": 69, "minPlayers": 66, "preferredClaimKeys": ["9mkX3hbZ", "vO8n62BL", "wCV4hndT"], "requestedRegions": ["Xp4S5g9q", "AmlUf0n7", "HXRn34Kl"], "teams": [{"parties": [{"partyID": "WLGqntUU", "userIDs": ["jRjzxCMN", "NsvSXZd3", "XkvQXSd0"]}, {"partyID": "wlyMJFLU", "userIDs": ["4NJVQuoi", "IOzrYFVL", "XCHHEx3n"]}, {"partyID": "SunmIO99", "userIDs": ["AEpv7aAY", "ITGKcX2K", "WGEsnS4O"]}], "userIDs": ["3WNTUrrb", "C25j51gF", "vXKyGYhG"]}, {"parties": [{"partyID": "zefMs2kK", "userIDs": ["6BGBIL8G", "T8U9jQOv", "d8lKck6Q"]}, {"partyID": "kQ102Mql", "userIDs": ["mfthLJXC", "UyC4igbf", "32d2ps0W"]}, {"partyID": "7ek0TsQ7", "userIDs": ["ojkQGoPd", "qLYXY17o", "3G5lkfU9"]}], "userIDs": ["20Z9fD5V", "aoPnSeFC", "UOdiOYH4"]}, {"parties": [{"partyID": "0C1AryNC", "userIDs": ["euKq4rxL", "e3o1ZqkA", "Tw7eOqrK"]}, {"partyID": "KbOSrWwC", "userIDs": ["g1NlvD5a", "UNFgKrKF", "adEZJXHd"]}, {"partyID": "TQDu4h95", "userIDs": ["TbEbiO9h", "EQydxOAR", "8vOuHGSb"]}], "userIDs": ["lg6AWzvG", "ercaQfPZ", "OQWgMSjw"]}], "ticketIDs": ["bSPhrNbg", "67ojmMz5", "NZNWWhFo"], "tieTeamsSessionLifetime": true, "type": "RNDd9PEy", "version": 66}' \
    > test.out 2>&1
eval_tap $? 52 'UpdateGameSession' test.out

#- 53 DeleteGameSession
./ng net.accelbyte.sdk.cli.Main session deleteGameSession \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'K3LXvxG4' \
    > test.out 2>&1
eval_tap $? 53 'DeleteGameSession' test.out

#- 54 PatchUpdateGameSession
./ng net.accelbyte.sdk.cli.Main session patchUpdateGameSession \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'lvWck1tM' \
    --body '{"attributes": {"OhKWM0nk": {}, "ed8TND4P": {}, "BGLrI4lz": {}}, "backfillTicketID": "xs0Zz1HZ", "clientVersion": "rImxXdQB", "deployment": "sVoAGCSK", "fallbackClaimKeys": ["7ujxPUH1", "RzjSaBbj", "LxwchSzv"], "inactiveTimeout": 83, "inviteTimeout": 1, "joinability": "uGymyN1K", "matchPool": "Pg86MdXi", "maxPlayers": 99, "minPlayers": 62, "preferredClaimKeys": ["snWKxL82", "1Cv1icEp", "FhmRjF8X"], "requestedRegions": ["mjjbMmwc", "IjHIGqHw", "oFCaV3hf"], "teams": [{"parties": [{"partyID": "rKd2oDwQ", "userIDs": ["iqYcoTju", "2uJ4NAYC", "YuWkCiDT"]}, {"partyID": "2CiknDzv", "userIDs": ["1NmyKwF6", "66Wz10qR", "HyiSsEvR"]}, {"partyID": "O0TfKn3f", "userIDs": ["m7hReSu7", "d5FxC5zX", "fny334Z6"]}], "userIDs": ["LRckTRxX", "LgNaaUhF", "7ATYiMjL"]}, {"parties": [{"partyID": "yr9GrD5b", "userIDs": ["4Q1DknMe", "1WJ2Si97", "RFuHcHqF"]}, {"partyID": "9Nldz6dT", "userIDs": ["FtYpohtV", "IhaKUAhR", "mZCASWYa"]}, {"partyID": "rCOp6mvr", "userIDs": ["gNCqdpMd", "gDxTDlae", "eKrvTvuz"]}], "userIDs": ["4pu10uRi", "Tv5Cur7K", "Xf4aLyqr"]}, {"parties": [{"partyID": "8Z98oOae", "userIDs": ["n5s3cNoq", "ainpzQsP", "MEkKrxNM"]}, {"partyID": "Ht5fr71O", "userIDs": ["6dNtiL9z", "LTksdGDa", "mihCZ9gE"]}, {"partyID": "YY3AclBL", "userIDs": ["rm4jqwBq", "zX43Xqpr", "wWkaEdDH"]}], "userIDs": ["tL0UR9V5", "DpMFFKYN", "XO1frEA2"]}], "ticketIDs": ["comJcozE", "IUAiLD7E", "LiheN5ar"], "tieTeamsSessionLifetime": true, "type": "LtLGDoPO", "version": 43}' \
    > test.out 2>&1
eval_tap $? 54 'PatchUpdateGameSession' test.out

#- 55 UpdateGameSessionBackfillTicketID
./ng net.accelbyte.sdk.cli.Main session updateGameSessionBackfillTicketID \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'hVbBz6hM' \
    --body '{"backfillTicketID": "WWO3CMTZ"}' \
    > test.out 2>&1
eval_tap $? 55 'UpdateGameSessionBackfillTicketID' test.out

#- 56 GameSessionGenerateCode
./ng net.accelbyte.sdk.cli.Main session gameSessionGenerateCode \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'mwCQqYy7' \
    > test.out 2>&1
eval_tap $? 56 'GameSessionGenerateCode' test.out

#- 57 PublicRevokeGameSessionCode
./ng net.accelbyte.sdk.cli.Main session publicRevokeGameSessionCode \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'rpvkhoyo' \
    > test.out 2>&1
eval_tap $? 57 'PublicRevokeGameSessionCode' test.out

#- 58 PublicGameSessionInvite
./ng net.accelbyte.sdk.cli.Main session publicGameSessionInvite \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'B3EbsE5a' \
    --body '{"metadata": {"djTl3LfZ": "awK9BkKy", "eBWvhypy": "nEwPCKQw", "IOpVFzlF": "QD2aGM9k"}, "platformID": "gv3VW3Vy", "userID": "9osZ0KpZ"}' \
    > test.out 2>&1
eval_tap $? 58 'PublicGameSessionInvite' test.out

#- 59 JoinGameSession
./ng net.accelbyte.sdk.cli.Main session joinGameSession \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'kv5m6JkU' \
    > test.out 2>&1
eval_tap $? 59 'JoinGameSession' test.out

#- 60 PublicPromoteGameSessionLeader
./ng net.accelbyte.sdk.cli.Main session publicPromoteGameSessionLeader \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'FOZSKoa4' \
    --body '{"leaderID": "AMmrTNdV"}' \
    > test.out 2>&1
eval_tap $? 60 'PublicPromoteGameSessionLeader' test.out

#- 61 LeaveGameSession
./ng net.accelbyte.sdk.cli.Main session leaveGameSession \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'G9AuKluk' \
    > test.out 2>&1
eval_tap $? 61 'LeaveGameSession' test.out

#- 62 PublicKickGameSessionMember
./ng net.accelbyte.sdk.cli.Main session publicKickGameSessionMember \
    --memberId 'qk2KxdD2' \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'ANojK43q' \
    > test.out 2>&1
eval_tap $? 62 'PublicKickGameSessionMember' test.out

#- 63 PublicGameSessionReject
./ng net.accelbyte.sdk.cli.Main session publicGameSessionReject \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'oH4frBD4' \
    > test.out 2>&1
eval_tap $? 63 'PublicGameSessionReject' test.out

#- 64 GetSessionServerSecret
./ng net.accelbyte.sdk.cli.Main session getSessionServerSecret \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'qBnwwsPR' \
    > test.out 2>&1
eval_tap $? 64 'GetSessionServerSecret' test.out

#- 65 AppendTeamGameSession
./ng net.accelbyte.sdk.cli.Main session appendTeamGameSession \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'W5y40u5D' \
    --body '{"additionalMembers": [{"partyID": "tDhAxCwh", "userIDs": ["GkMIFbWI", "winzGrxo", "CCP0dbXM"]}, {"partyID": "4AGeiQSW", "userIDs": ["Qmjjx8mf", "DTHBjIHQ", "AymRAVyx"]}, {"partyID": "CZzsiN6j", "userIDs": ["9919oifW", "jKTYCR4u", "RSTjUFRo"]}], "proposedTeams": [{"parties": [{"partyID": "ZQaoev77", "userIDs": ["ko1XXSCV", "Vcy2y7wb", "yMmwS6HK"]}, {"partyID": "0abyPBIP", "userIDs": ["yBb6Hb9T", "EMzYZZo6", "GkMNg5QY"]}, {"partyID": "xVAShbPa", "userIDs": ["V4wzmMCW", "MGRMFasQ", "JRrT6cBA"]}], "userIDs": ["TAG8w4Dn", "WInS4NBB", "eOkZcQB2"]}, {"parties": [{"partyID": "7aZ7dEV8", "userIDs": ["ZTj1Ufm6", "IIBgto7y", "zVpxjvhF"]}, {"partyID": "kzQ8dCmK", "userIDs": ["ShAA4skf", "eBKATXgX", "HiTkqWfi"]}, {"partyID": "UpGHjOQ5", "userIDs": ["2dd2ZZ1U", "HR36O9Ju", "tlOu1TOv"]}], "userIDs": ["dL2oen9s", "5Y6gsMUe", "UvvNYTtA"]}, {"parties": [{"partyID": "GShtv81u", "userIDs": ["How14nZr", "4CshDY8i", "GbOO9SOe"]}, {"partyID": "CAkdpmS9", "userIDs": ["9ofmB6GG", "DK7EkEnG", "YxBcS5Ng"]}, {"partyID": "SZnE9or8", "userIDs": ["HXygmT9E", "GvjyHB62", "sLVFC6As"]}], "userIDs": ["VsbOLODD", "O7UVEBoX", "Uoyh25Sw"]}], "version": 10}' \
    > test.out 2>&1
eval_tap $? 65 'AppendTeamGameSession' test.out

#- 66 PublicGameSessionCancel
./ng net.accelbyte.sdk.cli.Main session publicGameSessionCancel \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'k4MchUSE' \
    --userId 'Z5BenLr9' \
    > test.out 2>&1
eval_tap $? 66 'PublicGameSessionCancel' test.out

#- 67 PublicPartyJoinCode
./ng net.accelbyte.sdk.cli.Main session publicPartyJoinCode \
    --namespace "$AB_NAMESPACE" \
    --body '{"code": "dIWmIfEQ"}' \
    > test.out 2>&1
eval_tap $? 67 'PublicPartyJoinCode' test.out

#- 68 PublicGetParty
./ng net.accelbyte.sdk.cli.Main session publicGetParty \
    --namespace "$AB_NAMESPACE" \
    --partyId 'iRD52c74' \
    > test.out 2>&1
eval_tap $? 68 'PublicGetParty' test.out

#- 69 PublicUpdateParty
./ng net.accelbyte.sdk.cli.Main session publicUpdateParty \
    --namespace "$AB_NAMESPACE" \
    --partyId '67kM9J3o' \
    --body '{"attributes": {"3k4na4VD": {}, "Ce9Rar8x": {}, "75tLYMp8": {}}, "inactiveTimeout": 28, "inviteTimeout": 83, "joinability": "0E9DlJx0", "maxPlayers": 82, "minPlayers": 5, "type": "8AFvfYJg", "version": 14}' \
    > test.out 2>&1
eval_tap $? 69 'PublicUpdateParty' test.out

#- 70 PublicPatchUpdateParty
./ng net.accelbyte.sdk.cli.Main session publicPatchUpdateParty \
    --namespace "$AB_NAMESPACE" \
    --partyId 'yo5qJSZL' \
    --body '{"attributes": {"rAjY2u71": {}, "YjJ8tg1I": {}, "56sx0tR8": {}}, "inactiveTimeout": 40, "inviteTimeout": 24, "joinability": "hysnzSYx", "maxPlayers": 49, "minPlayers": 20, "type": "VeG592a6", "version": 33}' \
    > test.out 2>&1
eval_tap $? 70 'PublicPatchUpdateParty' test.out

#- 71 PublicGeneratePartyCode
./ng net.accelbyte.sdk.cli.Main session publicGeneratePartyCode \
    --namespace "$AB_NAMESPACE" \
    --partyId 'PIQsWCPS' \
    > test.out 2>&1
eval_tap $? 71 'PublicGeneratePartyCode' test.out

#- 72 PublicRevokePartyCode
./ng net.accelbyte.sdk.cli.Main session publicRevokePartyCode \
    --namespace "$AB_NAMESPACE" \
    --partyId 'WKehrkXj' \
    > test.out 2>&1
eval_tap $? 72 'PublicRevokePartyCode' test.out

#- 73 PublicPartyInvite
./ng net.accelbyte.sdk.cli.Main session publicPartyInvite \
    --namespace "$AB_NAMESPACE" \
    --partyId 'N57Pwfm3' \
    --body '{"metadata": {"vIxNyOgQ": "8kZWNyp7", "rbZjGZEj": "Su4t8eHG", "7OHKpVzo": "oxb3wCRr"}, "platformID": "HOsZFvr2", "userID": "Mv8x0Cix"}' \
    > test.out 2>&1
eval_tap $? 73 'PublicPartyInvite' test.out

#- 74 PublicPromotePartyLeader
./ng net.accelbyte.sdk.cli.Main session publicPromotePartyLeader \
    --namespace "$AB_NAMESPACE" \
    --partyId 'wdhuZyUm' \
    --body '{"leaderID": "b4O1akKt"}' \
    > test.out 2>&1
eval_tap $? 74 'PublicPromotePartyLeader' test.out

#- 75 PublicPartyJoin
./ng net.accelbyte.sdk.cli.Main session publicPartyJoin \
    --namespace "$AB_NAMESPACE" \
    --partyId 'BJLRgwaI' \
    > test.out 2>&1
eval_tap $? 75 'PublicPartyJoin' test.out

#- 76 PublicPartyLeave
./ng net.accelbyte.sdk.cli.Main session publicPartyLeave \
    --namespace "$AB_NAMESPACE" \
    --partyId 'vyRUrry4' \
    > test.out 2>&1
eval_tap $? 76 'PublicPartyLeave' test.out

#- 77 PublicPartyReject
./ng net.accelbyte.sdk.cli.Main session publicPartyReject \
    --namespace "$AB_NAMESPACE" \
    --partyId 'iHft622S' \
    > test.out 2>&1
eval_tap $? 77 'PublicPartyReject' test.out

#- 78 PublicPartyCancel
./ng net.accelbyte.sdk.cli.Main session publicPartyCancel \
    --namespace "$AB_NAMESPACE" \
    --partyId 'LOiNm7Xb' \
    --userId 'CGgEm7xS' \
    > test.out 2>&1
eval_tap $? 78 'PublicPartyCancel' test.out

#- 79 PublicPartyKick
./ng net.accelbyte.sdk.cli.Main session publicPartyKick \
    --namespace "$AB_NAMESPACE" \
    --partyId '3krWI5gL' \
    --userId 'voeo41He' \
    > test.out 2>&1
eval_tap $? 79 'PublicPartyKick' test.out

#- 80 PublicCreateParty
./ng net.accelbyte.sdk.cli.Main session publicCreateParty \
    --namespace "$AB_NAMESPACE" \
    --body '{"attributes": {"9dJiCPK3": {}, "V6JqN03S": {}, "0g4vbe9L": {}}, "configurationName": "Ti8Gt8KP", "inactiveTimeout": 67, "inviteTimeout": 68, "joinability": "DluVhQiK", "maxPlayers": 52, "members": [{"ID": "0eJvBxDO", "PlatformID": "MffKfdmo", "PlatformUserID": "ihz41HKE"}, {"ID": "qbwioJ1O", "PlatformID": "vSzgAscE", "PlatformUserID": "JihGOsjC"}, {"ID": "GWJ3XYIR", "PlatformID": "XubxemRy", "PlatformUserID": "npJuhDdr"}], "minPlayers": 47, "textChat": true, "type": "0PaNfriR"}' \
    > test.out 2>&1
eval_tap $? 80 'PublicCreateParty' test.out

#- 81 PublicGetRecentPlayer
./ng net.accelbyte.sdk.cli.Main session publicGetRecentPlayer \
    --namespace "$AB_NAMESPACE" \
    --limit '70' \
    > test.out 2>&1
eval_tap $? 81 'PublicGetRecentPlayer' test.out

#- 82 PublicGetRecentTeamPlayer
./ng net.accelbyte.sdk.cli.Main session publicGetRecentTeamPlayer \
    --namespace "$AB_NAMESPACE" \
    --limit '62' \
    > test.out 2>&1
eval_tap $? 82 'PublicGetRecentTeamPlayer' test.out

#- 83 PublicUpdateInsertSessionStorageLeader
./ng net.accelbyte.sdk.cli.Main session publicUpdateInsertSessionStorageLeader \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'kan2E3NF' \
    --body '{"di5urYX2": {}, "95ogl5lb": {}, "RQAsIOWJ": {}}' \
    > test.out 2>&1
eval_tap $? 83 'PublicUpdateInsertSessionStorageLeader' test.out

#- 84 PublicUpdateInsertSessionStorage
./ng net.accelbyte.sdk.cli.Main session publicUpdateInsertSessionStorage \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'j9RDsUcv' \
    --userId 'RgLpNdO7' \
    --body '{"KFGgrWKZ": {}, "kdaL5p1b": {}, "43UrKl8M": {}}' \
    > test.out 2>&1
eval_tap $? 84 'PublicUpdateInsertSessionStorage' test.out

#- 85 PublicGetBulkPlayerCurrentPlatform
./ng net.accelbyte.sdk.cli.Main session publicGetBulkPlayerCurrentPlatform \
    --namespace "$AB_NAMESPACE" \
    --body '{"userIDs": ["3iYkJtZw", "aWjFufqX", "I6JSxVwS"]}' \
    > test.out 2>&1
eval_tap $? 85 'PublicGetBulkPlayerCurrentPlatform' test.out

#- 86 PublicGetPlayerAttributes
./ng net.accelbyte.sdk.cli.Main session publicGetPlayerAttributes \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 86 'PublicGetPlayerAttributes' test.out

#- 87 PublicStorePlayerAttributes
./ng net.accelbyte.sdk.cli.Main session publicStorePlayerAttributes \
    --namespace "$AB_NAMESPACE" \
    --body '{"crossplayEnabled": true, "currentPlatform": "6LZ1Qwqd", "data": {"sm11X5Qn": {}, "GmY0QlDH": {}, "n9Y9xiHU": {}}, "platforms": [{"name": "OP87s2K9", "userID": "Pa5g2xou"}, {"name": "hvhTOrgW", "userID": "1R4ViBuU"}, {"name": "TmQw57qc", "userID": "h4Fla97N"}], "roles": ["TdB2C5Rr", "rrn2AmdN", "OZ4vsp0P"], "simultaneousPlatform": "SrBnoRJh"}' \
    > test.out 2>&1
eval_tap $? 87 'PublicStorePlayerAttributes' test.out

#- 88 PublicDeletePlayerAttributes
./ng net.accelbyte.sdk.cli.Main session publicDeletePlayerAttributes \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 88 'PublicDeletePlayerAttributes' test.out

#- 89 PublicQueryMyGameSessions
./ng net.accelbyte.sdk.cli.Main session publicQueryMyGameSessions \
    --namespace "$AB_NAMESPACE" \
    --order 'QgHieBBj' \
    --orderBy 'nk0m5iTz' \
    --status 'OEi3qrZg' \
    > test.out 2>&1
eval_tap $? 89 'PublicQueryMyGameSessions' test.out

#- 90 PublicQueryMyParties
./ng net.accelbyte.sdk.cli.Main session publicQueryMyParties \
    --namespace "$AB_NAMESPACE" \
    --order 'YpPpE5C0' \
    --orderBy 'Ruy8aUJJ' \
    --status 'sXbQc1wv' \
    > test.out 2>&1
eval_tap $? 90 'PublicQueryMyParties' test.out


rm -f "tmp.dat"

exit $EXIT_CODE