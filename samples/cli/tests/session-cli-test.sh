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
echo "1..96"

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
    --body '{"metricExcludedNamespaces": ["owLgWKW1", "cOASqZFl", "bd488TWP"], "regionRetryMapping": {"I6A6VgNF": ["2oHkuMC6", "F2n3jBa0", "5PMrHzRq"], "tkdGZMAO": ["y7qhBFlw", "UISbe9wX", "n9jz4W0C"], "xgIwzlJs": ["RXPtXJxN", "lOB6Hk5O", "ZVF94SNL"]}, "regionURLMapping": ["5y1dGoTG", "m2DlrHV8", "f8UWKLaM"], "testGameMode": "4FDUZ9z0", "testRegionURLMapping": ["JvBy6xyV", "AcHPNi7C", "4F0BxZah"], "testTargetUserIDs": ["wmAQWfQc", "8vKXbjVO", "OpnjxWlw"]}' \
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
    --body '{"durationDays": 38}' \
    > test.out 2>&1
eval_tap $? 12 'AdminUpdateConfigurationAlertV1' test.out

#- 13 AdminCreateConfigurationAlertV1
./ng net.accelbyte.sdk.cli.Main session adminCreateConfigurationAlertV1 \
    --namespace "$AB_NAMESPACE" \
    --body '{"durationDays": 8}' \
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
    --body '{"NativeSessionSetting": {"PSNDisableSystemUIMenu": ["UPDATE_INVITABLE_USER_TYPE", "KICK", "UPDATE_JOINABLE_USER_TYPE"], "PSNServiceLabel": 39, "PSNSupportedPlatforms": ["0yd5XGmb", "NBI3JdJu", "GZaYs3ga"], "SessionTitle": "A3P1N2XP", "ShouldSync": false, "XboxAllowCrossPlatform": true, "XboxSandboxID": "f5lStDeO", "XboxServiceConfigID": "ZqddHzLK", "XboxSessionTemplateName": "xAML88IE", "XboxTitleID": "6YztCaBG", "localizedSessionName": {"A3VBAmjX": {}, "XPX3i78y": {}, "wFkcYgmu": {}}}, "PSNBaseUrl": "2oCIVDve", "amsClaimTimeoutMinutes": 47, "appName": "muejWq1H", "asyncProcessDSRequest": {"async": true, "timeout": 84}, "attributes": {"dB1Ap1Z4": {}, "WTuldEs3": {}, "ooJk9Z4V": {}}, "autoJoin": false, "autoLeaveSession": false, "clientVersion": "dTWhcozj", "customURLGRPC": "R7kc50KH", "deployment": "kpAm1KCS", "disableCodeGeneration": true, "disableResendInvite": true, "dsManualSetReady": false, "dsSource": "DCkFW2Qz", "enableSecret": false, "fallbackClaimKeys": ["jQmUwWtj", "kTaKf7Kc", "g3w47jnU"], "grpcSessionConfig": {"appName": "7OQC0zhB", "customURL": "Dqle6Mjq", "functionFlag": 15}, "immutableStorage": true, "inactiveTimeout": 78, "inviteTimeout": 18, "joinability": "FRIENDS_OF_LEADER", "leaderElectionGracePeriod": 3, "manualRejoin": true, "maxActiveSessions": 35, "maxPlayers": 27, "minPlayers": 22, "name": "P4s8WBg2", "partyCodeGeneratorString": "KJNEflwV", "partyCodeLength": 56, "persistent": true, "preferredClaimKeys": ["gNsnp2At", "P8BajyNg", "xJdbIqOS"], "requestedRegions": ["gpCM0yqy", "pmqeTvSu", "8YRn9Oeb"], "textChat": false, "textChatMode": "NONE", "tieTeamsSessionLifetime": true, "ttlHours": 13, "type": "P2P"}' \
    > test.out 2>&1
eval_tap $? 16 'AdminCreateConfigurationTemplateV1' test.out

#- 17 AdminGetAllConfigurationTemplatesV1
./ng net.accelbyte.sdk.cli.Main session adminGetAllConfigurationTemplatesV1 \
    --namespace "$AB_NAMESPACE" \
    --limit '63' \
    --name 'gZB8tXF0' \
    --offset '51' \
    --order '8Gshoahk' \
    --orderBy 'dl8nMuJO' \
    > test.out 2>&1
eval_tap $? 17 'AdminGetAllConfigurationTemplatesV1' test.out

#- 18 AdminGetConfigurationTemplateV1
./ng net.accelbyte.sdk.cli.Main session adminGetConfigurationTemplateV1 \
    --name 'j8vk8T0n' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 18 'AdminGetConfigurationTemplateV1' test.out

#- 19 AdminUpdateConfigurationTemplateV1
./ng net.accelbyte.sdk.cli.Main session adminUpdateConfigurationTemplateV1 \
    --name 'NePdpOeL' \
    --namespace "$AB_NAMESPACE" \
    --body '{"NativeSessionSetting": {"PSNDisableSystemUIMenu": ["UPDATE_INVITABLE_USER_TYPE", "PROMOTE_TO_LEADER", "UPDATE_INVITABLE_USER_TYPE"], "PSNServiceLabel": 20, "PSNSupportedPlatforms": ["ZlxBJnRR", "Y6RoOGNH", "NxemKa3K"], "SessionTitle": "PC3rbpXs", "ShouldSync": true, "XboxAllowCrossPlatform": false, "XboxSandboxID": "fdWgLC4D", "XboxServiceConfigID": "mNtJDDEc", "XboxSessionTemplateName": "0Ajyvhsa", "XboxTitleID": "SzN2Vk6P", "localizedSessionName": {"uih7f67E": {}, "qbBwzDlY": {}, "5KrmBLhW": {}}}, "PSNBaseUrl": "PnOqwZ6X", "amsClaimTimeoutMinutes": 91, "appName": "rZlBEtHb", "asyncProcessDSRequest": {"async": false, "timeout": 90}, "attributes": {"j8un7X1s": {}, "1wZgfVGm": {}, "KWUKxOn2": {}}, "autoJoin": true, "autoLeaveSession": false, "clientVersion": "w4eQIhhl", "customURLGRPC": "78LhVdCA", "deployment": "9GwS2ypt", "disableCodeGeneration": false, "disableResendInvite": false, "dsManualSetReady": false, "dsSource": "Ms7854tf", "enableSecret": false, "fallbackClaimKeys": ["Snj2fkSU", "AdSywTEQ", "nXyoNWiZ"], "grpcSessionConfig": {"appName": "pLGzNSH0", "customURL": "WSOOERsA", "functionFlag": 34}, "immutableStorage": true, "inactiveTimeout": 27, "inviteTimeout": 35, "joinability": "OPEN", "leaderElectionGracePeriod": 91, "manualRejoin": false, "maxActiveSessions": 40, "maxPlayers": 43, "minPlayers": 85, "name": "wBVIguzN", "partyCodeGeneratorString": "h7xy4yKB", "partyCodeLength": 17, "persistent": false, "preferredClaimKeys": ["iYC10lKU", "q8BraE23", "3shd8dPo"], "requestedRegions": ["NpUvHzL7", "zC2QpFbR", "EOM0geI4"], "textChat": true, "textChatMode": "TEAM", "tieTeamsSessionLifetime": true, "ttlHours": 86, "type": "NONE"}' \
    > test.out 2>&1
eval_tap $? 19 'AdminUpdateConfigurationTemplateV1' test.out

#- 20 AdminDeleteConfigurationTemplateV1
./ng net.accelbyte.sdk.cli.Main session adminDeleteConfigurationTemplateV1 \
    --name 'NAlOA8KN' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 20 'AdminDeleteConfigurationTemplateV1' test.out

#- 21 AdminGetMemberActiveSession
./ng net.accelbyte.sdk.cli.Main session adminGetMemberActiveSession \
    --name 'lBWbagTX' \
    --namespace "$AB_NAMESPACE" \
    --userId 'N1bGwQ7H' \
    > test.out 2>&1
eval_tap $? 21 'AdminGetMemberActiveSession' test.out

#- 22 AdminReconcileMaxActiveSession
./ng net.accelbyte.sdk.cli.Main session adminReconcileMaxActiveSession \
    --name 'CZ2xXl0S' \
    --namespace "$AB_NAMESPACE" \
    --body '{"userID": "OTlxOc3K"}' \
    > test.out 2>&1
eval_tap $? 22 'AdminReconcileMaxActiveSession' test.out

#- 23 AdminGetDSMCConfiguration
eval_tap 0 23 'AdminGetDSMCConfiguration # SKIP deprecated' test.out

#- 24 AdminSyncDSMCConfiguration
eval_tap 0 24 'AdminSyncDSMCConfiguration # SKIP deprecated' test.out

#- 25 AdminQueryGameSessions
./ng net.accelbyte.sdk.cli.Main session adminQueryGameSessions \
    --namespace "$AB_NAMESPACE" \
    --configurationName '6NRMcdt3' \
    --dsPodName 'c3WJ0GPz' \
    --fromTime '6lgfc2Rz' \
    --gameMode 'v8gjufUn' \
    --isPersistent 'vqHMppxy' \
    --isSoftDeleted 'jeEyC4LZ' \
    --joinability 'FRIENDS_OF_FRIENDS' \
    --limit '72' \
    --matchPool 'aPHVbNEs' \
    --memberID 'tE08EkRR' \
    --offset '33' \
    --order 'Liz2qOZu' \
    --orderBy 'HMenxcxU' \
    --sessionID 'EVpXC0m0' \
    --status 'DS_ERROR' \
    --statusV2 'REQUESTED' \
    --toTime 'NGhgo389' \
    > test.out 2>&1
eval_tap $? 25 'AdminQueryGameSessions' test.out

#- 26 AdminQueryGameSessionsByAttributes
./ng net.accelbyte.sdk.cli.Main session adminQueryGameSessionsByAttributes \
    --namespace "$AB_NAMESPACE" \
    --body '{"czXPhUXe": {}, "hZJMVZW1": {}, "YrJLYYco": {}}' \
    > test.out 2>&1
eval_tap $? 26 'AdminQueryGameSessionsByAttributes' test.out

#- 27 AdminDeleteBulkGameSessions
./ng net.accelbyte.sdk.cli.Main session adminDeleteBulkGameSessions \
    --namespace "$AB_NAMESPACE" \
    --body '{"ids": ["UcyO5hSd", "RU93DxZu", "HQGWgk8B"]}' \
    > test.out 2>&1
eval_tap $? 27 'AdminDeleteBulkGameSessions' test.out

#- 28 AdminSetDSReady
./ng net.accelbyte.sdk.cli.Main session adminSetDSReady \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'XzqxjyAQ' \
    --body '{"ready": false}' \
    > test.out 2>&1
eval_tap $? 28 'AdminSetDSReady' test.out

#- 29 AdminUpdateDSInformation
./ng net.accelbyte.sdk.cli.Main session adminUpdateDSInformation \
    --namespace "$AB_NAMESPACE" \
    --sessionId '8mNecMGU' \
    --body '{"createdRegion": "VrpA5cwx", "deployment": "IlPMiWtz", "description": "u3UVNS3Q", "ip": "rvtf3wFq", "port": 95, "region": "VusHKEC2", "serverId": "6GSc42Xj", "source": "XJSPPalk", "status": "Pl0kyDF5"}' \
    > test.out 2>&1
eval_tap $? 29 'AdminUpdateDSInformation' test.out

#- 30 AdminKickGameSessionMember
./ng net.accelbyte.sdk.cli.Main session adminKickGameSessionMember \
    --memberId 'FnGsD1h4' \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'SG4jo4e4' \
    > test.out 2>&1
eval_tap $? 30 'AdminKickGameSessionMember' test.out

#- 31 AdminUpdateGameSessionMember
./ng net.accelbyte.sdk.cli.Main session adminUpdateGameSessionMember \
    --memberId 'XgTp7zvb' \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'A38YClOT' \
    --statusType 'BPniphAF' \
    > test.out 2>&1
eval_tap $? 31 'AdminUpdateGameSessionMember' test.out

#- 32 AdminGetListNativeSession
./ng net.accelbyte.sdk.cli.Main session adminGetListNativeSession \
    --namespace "$AB_NAMESPACE" \
    --limit '6' \
    --offset '13' \
    --order 'BXXtCIak' \
    > test.out 2>&1
eval_tap $? 32 'AdminGetListNativeSession' test.out

#- 33 AdminQueryParties
./ng net.accelbyte.sdk.cli.Main session adminQueryParties \
    --namespace "$AB_NAMESPACE" \
    --configurationName 'acaOXEPf' \
    --fromTime 'QlMeMwT8' \
    --isSoftDeleted 'gZBW3iIL' \
    --joinability 'FRIENDS_OF_LEADER' \
    --key 'rmmbNgIT' \
    --leaderID 'TK2dGpby' \
    --limit '69' \
    --memberID 'GPmdBvSY' \
    --memberStatus 'JOINED' \
    --offset '82' \
    --order 'zjoztKPM' \
    --orderBy 'oQEil2xi' \
    --partyID 'dPxuhPHP' \
    --toTime 'h3HKR7qD' \
    --value 'UeXmTtts' \
    > test.out 2>&1
eval_tap $? 33 'AdminQueryParties' test.out

#- 34 AdminDeleteBulkParties
./ng net.accelbyte.sdk.cli.Main session adminDeleteBulkParties \
    --namespace "$AB_NAMESPACE" \
    --body '{"ids": ["04G85Pqf", "nUwJ2BPG", "rQx4aSMk"]}' \
    > test.out 2>&1
eval_tap $? 34 'AdminDeleteBulkParties' test.out

#- 35 AdminReadPartySessionStorage
./ng net.accelbyte.sdk.cli.Main session adminReadPartySessionStorage \
    --namespace "$AB_NAMESPACE" \
    --partyId '8H8vXyfi' \
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
    --body '{"psn": {"clientId": "UaodfyFh", "clientSecret": "8YlxMR9z", "scope": "7eEoIiCT"}}' \
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

#- 41 AdminUploadPlatformCredentials
./ng net.accelbyte.sdk.cli.Main session adminUploadPlatformCredentials \
    --namespace "$AB_NAMESPACE" \
    --platformId 'XBOX' \
    --description '2WVvdjTK' \
    --file 'tmp.dat' \
    --password 'mfESDPaU' \
    > test.out 2>&1
eval_tap $? 41 'AdminUploadPlatformCredentials' test.out

#- 42 AdminGetRecentPlayer
./ng net.accelbyte.sdk.cli.Main session adminGetRecentPlayer \
    --namespace "$AB_NAMESPACE" \
    --limit '47' \
    --userId 'Um6EDfAX' \
    > test.out 2>&1
eval_tap $? 42 'AdminGetRecentPlayer' test.out

#- 43 AdminGetRecentTeamPlayer
./ng net.accelbyte.sdk.cli.Main session adminGetRecentTeamPlayer \
    --namespace "$AB_NAMESPACE" \
    --limit '49' \
    --userId 'y7L8W4U3' \
    > test.out 2>&1
eval_tap $? 43 'AdminGetRecentTeamPlayer' test.out

#- 44 AdminReadSessionStorage
./ng net.accelbyte.sdk.cli.Main session adminReadSessionStorage \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'n6DwgbIl' \
    > test.out 2>&1
eval_tap $? 44 'AdminReadSessionStorage' test.out

#- 45 AdminDeleteUserSessionStorage
./ng net.accelbyte.sdk.cli.Main session adminDeleteUserSessionStorage \
    --namespace "$AB_NAMESPACE" \
    --sessionId '1PhobweL' \
    > test.out 2>&1
eval_tap $? 45 'AdminDeleteUserSessionStorage' test.out

#- 46 AdminReadUserSessionStorage
./ng net.accelbyte.sdk.cli.Main session adminReadUserSessionStorage \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'Dludr7t1' \
    --userId 'mpVjEHco' \
    > test.out 2>&1
eval_tap $? 46 'AdminReadUserSessionStorage' test.out

#- 47 AdminQueryPlayerAttributes
./ng net.accelbyte.sdk.cli.Main session adminQueryPlayerAttributes \
    --namespace "$AB_NAMESPACE" \
    --users 'KO38I8YA' \
    > test.out 2>&1
eval_tap $? 47 'AdminQueryPlayerAttributes' test.out

#- 48 AdminGetPlayerAttributes
./ng net.accelbyte.sdk.cli.Main session adminGetPlayerAttributes \
    --namespace "$AB_NAMESPACE" \
    --userId 'dJWHuymL' \
    > test.out 2>&1
eval_tap $? 48 'AdminGetPlayerAttributes' test.out

#- 49 AdminSyncNativeSession
./ng net.accelbyte.sdk.cli.Main session adminSyncNativeSession \
    --namespace "$AB_NAMESPACE" \
    --userId '8b5fHa1Y' \
    > test.out 2>&1
eval_tap $? 49 'AdminSyncNativeSession' test.out

#- 50 CreateGameSession
./ng net.accelbyte.sdk.cli.Main session createGameSession \
    --namespace "$AB_NAMESPACE" \
    --resolveMaxActiveSession  \
    --body '{"appName": "Z3AZxiJG", "attributes": {"YGTE67eZ": {}, "ldFHvqII": {}, "4b15YzVi": {}}, "autoJoin": false, "backfillTicketID": "QJjZv8h7", "clientVersion": "UvCi0OA4", "configurationName": "V9qgc7zE", "customURLGRPC": "9mepU43H", "deployment": "smPoa7eM", "dsSource": "aaSpdT4P", "fallbackClaimKeys": ["sUtLpQP8", "gfP4sHqb", "AMpD6ePj"], "inactiveTimeout": 67, "inviteTimeout": 81, "joinability": "INVITE_ONLY", "matchPool": "HVNCpVuX", "maxPlayers": 8, "minPlayers": 64, "preferredClaimKeys": ["q0MI6lkf", "nIkq5V91", "yjpE5bOy"], "requestedRegions": ["bEFJ2pl9", "RKirn5U6", "jxkiUAyw"], "serverName": "gjGZoDEJ", "storage": {"leader": {"w7KrjhuV": {}, "Cbku4SAc": {}, "ChpbrlXX": {}}}, "teams": [{"parties": [{"partyID": "QHqkVIfu", "userIDs": ["63s6hFeF", "nW5Q87XH", "bjWnlvBP"]}, {"partyID": "ywbaIpV6", "userIDs": ["I8cluLOD", "Hkec8tiG", "AT1GwxVJ"]}, {"partyID": "eveRG6nx", "userIDs": ["bVBiuCkz", "MPJhjHU9", "dYiSxfgZ"]}], "teamID": "dsEVAeyJ", "userIDs": ["Q9o1eS76", "OQMasgIs", "mE8Zf0ra"]}, {"parties": [{"partyID": "xCCAyWZg", "userIDs": ["AgIuujNy", "RDZaLfnu", "5vQKdhtu"]}, {"partyID": "xXEXiM0A", "userIDs": ["JoziYNjd", "eDqAIJfv", "HHTkvGTs"]}, {"partyID": "CCgzCAWs", "userIDs": ["giATU6Cv", "VGN4W7nX", "TzzTrRMr"]}], "teamID": "oxpMGyfS", "userIDs": ["gBm1vFUO", "xO5jIlYT", "EkCBEmBo"]}, {"parties": [{"partyID": "9KqFdfe8", "userIDs": ["IaLhU5VJ", "rQoHLWoz", "3GdwqbCo"]}, {"partyID": "RWMYIkSA", "userIDs": ["WVz48S6u", "VGUjFgI9", "KKh0zsuh"]}, {"partyID": "lYb7aiys", "userIDs": ["4DnGbPHZ", "TX1jD1zQ", "BqaQHL5m"]}], "teamID": "YhIsSg36", "userIDs": ["6fEpXFe2", "2Pp1qrSA", "QG4LlurP"]}], "textChat": false, "textChatMode": "TEAM", "ticketIDs": ["7vrGUSFa", "YVL9gPnp", "OyQspONQ"], "tieTeamsSessionLifetime": false, "type": "NONE"}' \
    > test.out 2>&1
eval_tap $? 50 'CreateGameSession' test.out

#- 51 PublicQueryGameSessionsByAttributes
./ng net.accelbyte.sdk.cli.Main session publicQueryGameSessionsByAttributes \
    --namespace "$AB_NAMESPACE" \
    --body '{"Ysw7REe1": {}, "33hOqbOP": {}, "st4pPR9T": {}}' \
    > test.out 2>&1
eval_tap $? 51 'PublicQueryGameSessionsByAttributes' test.out

#- 52 PublicSessionJoinCode
./ng net.accelbyte.sdk.cli.Main session publicSessionJoinCode \
    --namespace "$AB_NAMESPACE" \
    --body '{"code": "nAOdWEDA"}' \
    > test.out 2>&1
eval_tap $? 52 'PublicSessionJoinCode' test.out

#- 53 GetGameSessionByPodName
./ng net.accelbyte.sdk.cli.Main session getGameSessionByPodName \
    --namespace "$AB_NAMESPACE" \
    --podName 'SA148QL3' \
    > test.out 2>&1
eval_tap $? 53 'GetGameSessionByPodName' test.out

#- 54 GetGameSession
./ng net.accelbyte.sdk.cli.Main session getGameSession \
    --namespace "$AB_NAMESPACE" \
    --sessionId '7OB580qt' \
    > test.out 2>&1
eval_tap $? 54 'GetGameSession' test.out

#- 55 UpdateGameSession
./ng net.accelbyte.sdk.cli.Main session updateGameSession \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'Tz9yYZtL' \
    --body '{"attributes": {"7A9pgCBx": {}, "nq16TFPU": {}, "Kqun1D5J": {}}, "backfillTicketID": "wQONj7Yc", "clientVersion": "FxwroPEy", "deployment": "l1hilk1e", "fallbackClaimKeys": ["EnLWYbf8", "NR17tPx3", "J9eZozpj"], "inactiveTimeout": 57, "inviteTimeout": 72, "joinability": "FRIENDS_OF_FRIENDS", "matchPool": "dljFqKhl", "maxPlayers": 64, "minPlayers": 96, "preferredClaimKeys": ["OXdvgsHH", "ErQM2Fzd", "VKIgevGy"], "requestedRegions": ["ume1x72K", "a6R6wkFC", "hCI3iUIB"], "teams": [{"parties": [{"partyID": "50q84ytR", "userIDs": ["U6ZLvyGF", "sSSIlhKP", "w88xj9M4"]}, {"partyID": "vWnfw1QT", "userIDs": ["pgyEbHIF", "tpmuUHdg", "6JaciHKC"]}, {"partyID": "mC9mAsQE", "userIDs": ["mkeWP7Ss", "DhQ30H5M", "AfCAbU0g"]}], "teamID": "6RuaFF48", "userIDs": ["TqekyIhE", "qDHRTppn", "dPMmKwqD"]}, {"parties": [{"partyID": "O1UgnWf8", "userIDs": ["bN2yxgM1", "KRJKkIVu", "WQiZpuiT"]}, {"partyID": "EVeAXMh3", "userIDs": ["dGCfpojT", "DjA7ZXBa", "H0ktGksG"]}, {"partyID": "hDJNElNF", "userIDs": ["AWeUQpMP", "XAngrG7B", "jYaKYs4r"]}], "teamID": "6hyKd2R4", "userIDs": ["P6CvchqY", "O7yFrpuS", "Cz1RaTFV"]}, {"parties": [{"partyID": "eHgSwJvU", "userIDs": ["tN8UkTnr", "egOoU1RH", "WZQCJlkX"]}, {"partyID": "hHaiivhC", "userIDs": ["ftLhraoz", "vBr6kXwD", "vJJ0zrDA"]}, {"partyID": "J88VsfBd", "userIDs": ["jybQvSvG", "LeMTTIf7", "EstC84ZI"]}], "teamID": "NznIPnHm", "userIDs": ["WeHZn9BW", "JzMa7uMf", "rNReyb91"]}], "ticketIDs": ["qdepRFP3", "7C8tdDrn", "3t3FrUmJ"], "tieTeamsSessionLifetime": true, "type": "DS", "version": 11}' \
    > test.out 2>&1
eval_tap $? 55 'UpdateGameSession' test.out

#- 56 DeleteGameSession
./ng net.accelbyte.sdk.cli.Main session deleteGameSession \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'E5DbuNTq' \
    > test.out 2>&1
eval_tap $? 56 'DeleteGameSession' test.out

#- 57 PatchUpdateGameSession
./ng net.accelbyte.sdk.cli.Main session patchUpdateGameSession \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'yWwzvXk5' \
    --body '{"attributes": {"rAaOBIfY": {}, "qdgAGkca": {}, "xQvdKVSH": {}}, "backfillTicketID": "cTRM10LW", "clientVersion": "2qHigmcl", "deployment": "wIrfxEEe", "fallbackClaimKeys": ["G7aALumD", "rD1pl6jt", "FARdFyfn"], "inactiveTimeout": 57, "inviteTimeout": 6, "joinability": "INVITE_ONLY", "matchPool": "ttR5nCNc", "maxPlayers": 50, "minPlayers": 40, "preferredClaimKeys": ["Uruj0VUQ", "rwcvgBEb", "a9hFbcuB"], "requestedRegions": ["YafKWnkJ", "WYqKwMMM", "bQDvT6i9"], "teams": [{"parties": [{"partyID": "8B7uake3", "userIDs": ["rX5Nny5N", "JuoZWfbb", "uTMoa0ph"]}, {"partyID": "ZGbbXWtF", "userIDs": ["VPMimqp3", "Z9557n9w", "1WmCIQrM"]}, {"partyID": "3vNJyejw", "userIDs": ["cLpRzGTN", "b8DG78uq", "YULV5ekm"]}], "teamID": "QtyfYF04", "userIDs": ["d27z9pZ1", "EosqEFF9", "lPAz4TzF"]}, {"parties": [{"partyID": "pCvypjPJ", "userIDs": ["jPNK5gqI", "gvilGfGV", "gLpsekYq"]}, {"partyID": "KDrpG10G", "userIDs": ["7bQB5uA2", "vCHEOlO4", "OaNMBZ2P"]}, {"partyID": "GXy0i5ya", "userIDs": ["ZgP7o9jE", "l65hNTh3", "5DTuqg4B"]}], "teamID": "vKUuZZWP", "userIDs": ["jukVOVnU", "964plcNU", "L3VInojB"]}, {"parties": [{"partyID": "OPljlfHE", "userIDs": ["KMutH8pw", "BQkD6mT4", "K5rQkUT1"]}, {"partyID": "WvUraNPU", "userIDs": ["PNxaNVZS", "KRcbun1h", "rUSMrBEE"]}, {"partyID": "ab0CYmwO", "userIDs": ["FgGjQZl7", "6QYHCkFG", "VO5kuKQ1"]}], "teamID": "qRvruVVz", "userIDs": ["tWZ4qlpw", "Szn8SJDJ", "v6fsgfxb"]}], "ticketIDs": ["nvYDE1Fx", "ZjZ9hgzX", "HxxTEX8o"], "tieTeamsSessionLifetime": true, "type": "DS", "version": 48}' \
    > test.out 2>&1
eval_tap $? 57 'PatchUpdateGameSession' test.out

#- 58 UpdateGameSessionBackfillTicketID
./ng net.accelbyte.sdk.cli.Main session updateGameSessionBackfillTicketID \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'JNKGlsJC' \
    --body '{"backfillTicketID": "wiAzE5rh"}' \
    > test.out 2>&1
eval_tap $? 58 'UpdateGameSessionBackfillTicketID' test.out

#- 59 GameSessionGenerateCode
./ng net.accelbyte.sdk.cli.Main session gameSessionGenerateCode \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'FDrEtwJP' \
    > test.out 2>&1
eval_tap $? 59 'GameSessionGenerateCode' test.out

#- 60 PublicRevokeGameSessionCode
./ng net.accelbyte.sdk.cli.Main session publicRevokeGameSessionCode \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'LkAmErtL' \
    > test.out 2>&1
eval_tap $? 60 'PublicRevokeGameSessionCode' test.out

#- 61 PublicGameSessionInvite
./ng net.accelbyte.sdk.cli.Main session publicGameSessionInvite \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'y1wlAtgG' \
    --body '{"metadata": {"OtSlBumO": "7pTWGZ1x", "d1zryZt1": "5shhf4m3", "lq6oIbKl": "cZNKYbjo"}, "platformID": "J8tndGkU", "userID": "xzbmCJ40"}' \
    > test.out 2>&1
eval_tap $? 61 'PublicGameSessionInvite' test.out

#- 62 JoinGameSession
./ng net.accelbyte.sdk.cli.Main session joinGameSession \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'Cx1JqDDG' \
    > test.out 2>&1
eval_tap $? 62 'JoinGameSession' test.out

#- 63 PublicPromoteGameSessionLeader
./ng net.accelbyte.sdk.cli.Main session publicPromoteGameSessionLeader \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'EsnEiYBt' \
    --body '{"leaderID": "cTeZMcGu"}' \
    > test.out 2>&1
eval_tap $? 63 'PublicPromoteGameSessionLeader' test.out

#- 64 LeaveGameSession
./ng net.accelbyte.sdk.cli.Main session leaveGameSession \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'BR5vCMYx' \
    > test.out 2>&1
eval_tap $? 64 'LeaveGameSession' test.out

#- 65 PublicKickGameSessionMember
./ng net.accelbyte.sdk.cli.Main session publicKickGameSessionMember \
    --memberId 'xw9SziwR' \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'wIWVbyFN' \
    > test.out 2>&1
eval_tap $? 65 'PublicKickGameSessionMember' test.out

#- 66 PublicGameSessionReject
./ng net.accelbyte.sdk.cli.Main session publicGameSessionReject \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'tRtbmMQP' \
    > test.out 2>&1
eval_tap $? 66 'PublicGameSessionReject' test.out

#- 67 GetSessionServerSecret
./ng net.accelbyte.sdk.cli.Main session getSessionServerSecret \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'qi3cNXIN' \
    > test.out 2>&1
eval_tap $? 67 'GetSessionServerSecret' test.out

#- 68 AppendTeamGameSession
eval_tap 0 68 'AppendTeamGameSession # SKIP deprecated' test.out

#- 69 PublicGameSessionCancel
./ng net.accelbyte.sdk.cli.Main session publicGameSessionCancel \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'G487Nu7t' \
    --userId 'pCkUx9Sv' \
    > test.out 2>&1
eval_tap $? 69 'PublicGameSessionCancel' test.out

#- 70 PublicPartyJoinCode
./ng net.accelbyte.sdk.cli.Main session publicPartyJoinCode \
    --namespace "$AB_NAMESPACE" \
    --body '{"code": "5MnzTC6B"}' \
    > test.out 2>&1
eval_tap $? 70 'PublicPartyJoinCode' test.out

#- 71 PublicGetParty
./ng net.accelbyte.sdk.cli.Main session publicGetParty \
    --namespace "$AB_NAMESPACE" \
    --partyId 'a4GqZSpA' \
    > test.out 2>&1
eval_tap $? 71 'PublicGetParty' test.out

#- 72 PublicUpdateParty
./ng net.accelbyte.sdk.cli.Main session publicUpdateParty \
    --namespace "$AB_NAMESPACE" \
    --partyId 'aS4eBBRz' \
    --body '{"attributes": {"d09PozEi": {}, "srER7j4v": {}, "dM0ofc7S": {}}, "inactiveTimeout": 34, "inviteTimeout": 22, "joinability": "FRIENDS_OF_FRIENDS", "maxPlayers": 70, "minPlayers": 32, "type": "P2P", "version": 32}' \
    > test.out 2>&1
eval_tap $? 72 'PublicUpdateParty' test.out

#- 73 PublicPatchUpdateParty
./ng net.accelbyte.sdk.cli.Main session publicPatchUpdateParty \
    --namespace "$AB_NAMESPACE" \
    --partyId 'JfvVlQxS' \
    --body '{"attributes": {"hGSuyaVo": {}, "Xu1whg23": {}, "ISvZmdwj": {}}, "inactiveTimeout": 87, "inviteTimeout": 85, "joinability": "FRIENDS_OF_LEADER", "maxPlayers": 71, "minPlayers": 76, "type": "NONE", "version": 36}' \
    > test.out 2>&1
eval_tap $? 73 'PublicPatchUpdateParty' test.out

#- 74 PublicGeneratePartyCode
./ng net.accelbyte.sdk.cli.Main session publicGeneratePartyCode \
    --namespace "$AB_NAMESPACE" \
    --partyId 'MCAssRYZ' \
    > test.out 2>&1
eval_tap $? 74 'PublicGeneratePartyCode' test.out

#- 75 PublicRevokePartyCode
./ng net.accelbyte.sdk.cli.Main session publicRevokePartyCode \
    --namespace "$AB_NAMESPACE" \
    --partyId 'TGPEnQiX' \
    > test.out 2>&1
eval_tap $? 75 'PublicRevokePartyCode' test.out

#- 76 PublicPartyInvite
./ng net.accelbyte.sdk.cli.Main session publicPartyInvite \
    --namespace "$AB_NAMESPACE" \
    --partyId 'i0z4m6L9' \
    --body '{"metadata": {"sxS2RGDB": "a63rqhgl", "IWCWfhVM": "vrXQMdhx", "0zBXbxem": "pM6ufwJB"}, "platformID": "vCXCcHco", "userID": "Z4VqGCKv"}' \
    > test.out 2>&1
eval_tap $? 76 'PublicPartyInvite' test.out

#- 77 PublicPromotePartyLeader
./ng net.accelbyte.sdk.cli.Main session publicPromotePartyLeader \
    --namespace "$AB_NAMESPACE" \
    --partyId 'DHz7bRsp' \
    --body '{"leaderID": "QuVBrV8u"}' \
    > test.out 2>&1
eval_tap $? 77 'PublicPromotePartyLeader' test.out

#- 78 PublicReadPartySessionStorage
./ng net.accelbyte.sdk.cli.Main session publicReadPartySessionStorage \
    --namespace "$AB_NAMESPACE" \
    --partyId '3rP8NH0z' \
    > test.out 2>&1
eval_tap $? 78 'PublicReadPartySessionStorage' test.out

#- 79 PublicUpdateInsertPartySessionStorage
./ng net.accelbyte.sdk.cli.Main session publicUpdateInsertPartySessionStorage \
    --namespace "$AB_NAMESPACE" \
    --partyId 'gHmipwJL' \
    --userId 'AIeEsv2s' \
    --body '{"iIK0Xrp6": {}, "3uXmXbsJ": {}, "t6WpQ3nr": {}}' \
    > test.out 2>&1
eval_tap $? 79 'PublicUpdateInsertPartySessionStorage' test.out

#- 80 PublicUpdateInsertPartySessionStorageReserved
./ng net.accelbyte.sdk.cli.Main session publicUpdateInsertPartySessionStorageReserved \
    --namespace "$AB_NAMESPACE" \
    --partyId 'wVaeea5W' \
    --userId 'SnJvTXRK' \
    --body '{"swOm7Iom": {}, "uiWQniGY": {}, "QOiRujz0": {}}' \
    > test.out 2>&1
eval_tap $? 80 'PublicUpdateInsertPartySessionStorageReserved' test.out

#- 81 PublicPartyJoin
./ng net.accelbyte.sdk.cli.Main session publicPartyJoin \
    --namespace "$AB_NAMESPACE" \
    --partyId '2sdSnCA6' \
    > test.out 2>&1
eval_tap $? 81 'PublicPartyJoin' test.out

#- 82 PublicPartyLeave
./ng net.accelbyte.sdk.cli.Main session publicPartyLeave \
    --namespace "$AB_NAMESPACE" \
    --partyId 'IJfPzP0y' \
    > test.out 2>&1
eval_tap $? 82 'PublicPartyLeave' test.out

#- 83 PublicPartyReject
./ng net.accelbyte.sdk.cli.Main session publicPartyReject \
    --namespace "$AB_NAMESPACE" \
    --partyId 'MyX0dChb' \
    > test.out 2>&1
eval_tap $? 83 'PublicPartyReject' test.out

#- 84 PublicPartyCancel
./ng net.accelbyte.sdk.cli.Main session publicPartyCancel \
    --namespace "$AB_NAMESPACE" \
    --partyId 'N4ojgnQm' \
    --userId 'M2MuLzNC' \
    > test.out 2>&1
eval_tap $? 84 'PublicPartyCancel' test.out

#- 85 PublicPartyKick
./ng net.accelbyte.sdk.cli.Main session publicPartyKick \
    --namespace "$AB_NAMESPACE" \
    --partyId 'Ld91KMKt' \
    --userId 'd2wcBkDY' \
    > test.out 2>&1
eval_tap $? 85 'PublicPartyKick' test.out

#- 86 PublicCreateParty
./ng net.accelbyte.sdk.cli.Main session publicCreateParty \
    --namespace "$AB_NAMESPACE" \
    --body '{"attributes": {"xxFkh3kx": {}, "sqphtBCK": {}, "QU5LFXSv": {}}, "configurationName": "P2ekwYJd", "inactiveTimeout": 24, "inviteTimeout": 44, "joinability": "CLOSED", "maxPlayers": 6, "members": [{"ID": "3lrJoiIr", "PlatformID": "Tolm0V8c", "PlatformUserID": "qBTa8Zg7"}, {"ID": "dvUM09r6", "PlatformID": "a2d0qpVL", "PlatformUserID": "oLClBkTb"}, {"ID": "NskAjVs8", "PlatformID": "Zdfly9r6", "PlatformUserID": "RcHK37t7"}], "minPlayers": 9, "textChat": false, "type": "NONE"}' \
    > test.out 2>&1
eval_tap $? 86 'PublicCreateParty' test.out

#- 87 PublicGetRecentPlayer
./ng net.accelbyte.sdk.cli.Main session publicGetRecentPlayer \
    --namespace "$AB_NAMESPACE" \
    --limit '1' \
    > test.out 2>&1
eval_tap $? 87 'PublicGetRecentPlayer' test.out

#- 88 PublicGetRecentTeamPlayer
./ng net.accelbyte.sdk.cli.Main session publicGetRecentTeamPlayer \
    --namespace "$AB_NAMESPACE" \
    --limit '66' \
    > test.out 2>&1
eval_tap $? 88 'PublicGetRecentTeamPlayer' test.out

#- 89 PublicUpdateInsertSessionStorageLeader
./ng net.accelbyte.sdk.cli.Main session publicUpdateInsertSessionStorageLeader \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'LFQYWnuJ' \
    --body '{"a4lUCYLI": {}, "yzsSRTE5": {}, "pmKzGBRH": {}}' \
    > test.out 2>&1
eval_tap $? 89 'PublicUpdateInsertSessionStorageLeader' test.out

#- 90 PublicUpdateInsertSessionStorage
./ng net.accelbyte.sdk.cli.Main session publicUpdateInsertSessionStorage \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'qyEKyCIO' \
    --userId 'RBpHDav5' \
    --body '{"vaddeQvf": {}, "Xy3cwcTM": {}, "PGToORLQ": {}}' \
    > test.out 2>&1
eval_tap $? 90 'PublicUpdateInsertSessionStorage' test.out

#- 91 PublicGetBulkPlayerCurrentPlatform
./ng net.accelbyte.sdk.cli.Main session publicGetBulkPlayerCurrentPlatform \
    --namespace "$AB_NAMESPACE" \
    --body '{"userIDs": ["kryv8FhM", "cfGtUa3D", "kgKk8Hxu"]}' \
    > test.out 2>&1
eval_tap $? 91 'PublicGetBulkPlayerCurrentPlatform' test.out

#- 92 PublicGetPlayerAttributes
./ng net.accelbyte.sdk.cli.Main session publicGetPlayerAttributes \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 92 'PublicGetPlayerAttributes' test.out

#- 93 PublicStorePlayerAttributes
./ng net.accelbyte.sdk.cli.Main session publicStorePlayerAttributes \
    --namespace "$AB_NAMESPACE" \
    --body '{"crossplayEnabled": false, "currentPlatform": "kCBubK59", "data": {"bq6wJPTe": {}, "jCymDc0v": {}, "2yYhIIV9": {}}, "platforms": [{"name": "nddUnOcN", "userID": "PWlTif3w"}, {"name": "djRgl0Dp", "userID": "dPObPhV9"}, {"name": "NstWxTJt", "userID": "jK6sjhkF"}], "roles": ["D2yobWqg", "Bghzn1Hd", "6G4GrPWz"], "simultaneousPlatform": "D6vID1Tm"}' \
    > test.out 2>&1
eval_tap $? 93 'PublicStorePlayerAttributes' test.out

#- 94 PublicDeletePlayerAttributes
./ng net.accelbyte.sdk.cli.Main session publicDeletePlayerAttributes \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 94 'PublicDeletePlayerAttributes' test.out

#- 95 PublicQueryMyGameSessions
./ng net.accelbyte.sdk.cli.Main session publicQueryMyGameSessions \
    --namespace "$AB_NAMESPACE" \
    --order '48IcSfhV' \
    --orderBy '8rMVAFM6' \
    --status 'lMsZavBu' \
    > test.out 2>&1
eval_tap $? 95 'PublicQueryMyGameSessions' test.out

#- 96 PublicQueryMyParties
./ng net.accelbyte.sdk.cli.Main session publicQueryMyParties \
    --namespace "$AB_NAMESPACE" \
    --order '1Lz8fZCf' \
    --orderBy 'wfBqkjNo' \
    --status 'OBewGPR0' \
    > test.out 2>&1
eval_tap $? 96 'PublicQueryMyParties' test.out


rm -f "tmp.dat"

exit $EXIT_CODE