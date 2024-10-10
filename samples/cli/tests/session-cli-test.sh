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
echo "1..87"

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
    --body '{"metricExcludedNamespaces": ["BR1kmEuJ", "tiDpsUwP", "NcNTe5EC"], "regionRetryMapping": {"ZrNEVsMF": ["UMxouslR", "2rIq9up5", "KBciFscy"], "VBeajbvh": ["w495CBnJ", "Vos5OCUX", "wJpXIcCo"], "msGldDlc": ["k8SNJDB6", "98euV9Xt", "csYpebZz"]}, "regionURLMapping": ["pnUQ7a3M", "Lors73Q4", "aXKGUIec"], "testGameMode": "Nzq9rZgv", "testRegionURLMapping": ["LLDYDbyp", "X5cUF8Bx", "E3HKGlaI"], "testTargetUserIDs": ["s1elrmRB", "Pr3gxlBm", "dnzWxAUW"]}' \
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
    --body '{"durationDays": 34}' \
    > test.out 2>&1
eval_tap $? 12 'AdminUpdateConfigurationAlertV1' test.out

#- 13 AdminCreateConfigurationAlertV1
./ng net.accelbyte.sdk.cli.Main session adminCreateConfigurationAlertV1 \
    --namespace "$AB_NAMESPACE" \
    --body '{"durationDays": 16}' \
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
    --description 'spwU2mNa' \
    --certname 'tIyspVqx' \
    --file 'tmp.dat' \
    --password 'LRAg57Ja' \
    > test.out 2>&1
eval_tap $? 15 'HandleUploadXboxPFXCertificate' test.out

#- 16 AdminCreateConfigurationTemplateV1
./ng net.accelbyte.sdk.cli.Main session adminCreateConfigurationTemplateV1 \
    --namespace "$AB_NAMESPACE" \
    --body '{"NativeSessionSetting": {"PSNServiceLabel": 92, "PSNSupportedPlatforms": ["meTNwuqr", "Zqb8hT2x", "GLMHWl84"], "SessionTitle": "ygSWgLbm", "ShouldSync": false, "XboxAllowCrossPlatform": false, "XboxSandboxID": "6UC7bxhg", "XboxServiceConfigID": "QYaaqeDj", "XboxSessionTemplateName": "Hdinm6le", "XboxTitleID": "en0qzGNd", "localizedSessionName": {"pdgx5Kzb": {}, "MIFmGGuT": {}, "t16AZKm5": {}}}, "PSNBaseUrl": "Z5pqMj8y", "appName": "eF0bAKwm", "attributes": {"4nsGoqkr": {}, "dqcrlHV1": {}, "UT2IGbNj": {}}, "autoJoin": true, "autoLeaveSession": false, "clientVersion": "bdXzzEui", "customURLGRPC": "nOF4YHUn", "deployment": "mvgHlz56", "disableCodeGeneration": false, "disableResendInvite": true, "dsManualSetReady": true, "dsSource": "qEz2lYB2", "enableSecret": false, "fallbackClaimKeys": ["gW7kT5Ad", "DBdIUXy2", "66NZngAf"], "grpcSessionConfig": {"appName": "ujSgze1E", "customURL": "xYCwPYI7", "functionFlag": 27}, "immutableStorage": false, "inactiveTimeout": 96, "inviteTimeout": 37, "joinability": "pqm0Jify", "leaderElectionGracePeriod": 47, "manualRejoin": true, "maxActiveSessions": 42, "maxPlayers": 84, "minPlayers": 73, "name": "ufjreR8P", "persistent": false, "preferredClaimKeys": ["SPjjeTKC", "xMrV2T6V", "KDgurtGw"], "requestedRegions": ["WG3IvbJa", "OXFQZWL6", "VVqA8TsQ"], "textChat": false, "tieTeamsSessionLifetime": true, "type": "jPLm2zQA"}' \
    > test.out 2>&1
eval_tap $? 16 'AdminCreateConfigurationTemplateV1' test.out

#- 17 AdminGetAllConfigurationTemplatesV1
./ng net.accelbyte.sdk.cli.Main session adminGetAllConfigurationTemplatesV1 \
    --namespace "$AB_NAMESPACE" \
    --limit '62' \
    --name 'cvK71ezZ' \
    --offset '64' \
    --order 'jsQYidcn' \
    --orderBy 'z82tixlU' \
    > test.out 2>&1
eval_tap $? 17 'AdminGetAllConfigurationTemplatesV1' test.out

#- 18 AdminGetConfigurationTemplateV1
./ng net.accelbyte.sdk.cli.Main session adminGetConfigurationTemplateV1 \
    --name 'suKa2zAs' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 18 'AdminGetConfigurationTemplateV1' test.out

#- 19 AdminUpdateConfigurationTemplateV1
./ng net.accelbyte.sdk.cli.Main session adminUpdateConfigurationTemplateV1 \
    --name '8pWn7XtC' \
    --namespace "$AB_NAMESPACE" \
    --body '{"NativeSessionSetting": {"PSNServiceLabel": 50, "PSNSupportedPlatforms": ["ZVzzQ4Xx", "pGPA1uMf", "7jreEwFy"], "SessionTitle": "UByFO2Nt", "ShouldSync": false, "XboxAllowCrossPlatform": false, "XboxSandboxID": "HXPFs6OC", "XboxServiceConfigID": "Y9tfDbn0", "XboxSessionTemplateName": "b6gBcbof", "XboxTitleID": "vUemQoeI", "localizedSessionName": {"xIuTQpkG": {}, "qvW0aXNe": {}, "AYijiZ4k": {}}}, "PSNBaseUrl": "vZs5c8XD", "appName": "YGHZcqQE", "attributes": {"F1jXlADv": {}, "81hiil2l": {}, "tYavs7xX": {}}, "autoJoin": true, "autoLeaveSession": true, "clientVersion": "MaTnxb41", "customURLGRPC": "deEl8qqV", "deployment": "TzsQwTsT", "disableCodeGeneration": true, "disableResendInvite": false, "dsManualSetReady": false, "dsSource": "QlQlSn7F", "enableSecret": true, "fallbackClaimKeys": ["7YNkrga3", "DU8Dkon9", "A0eIgk8j"], "grpcSessionConfig": {"appName": "cDkHKqBG", "customURL": "Vv18F19T", "functionFlag": 47}, "immutableStorage": false, "inactiveTimeout": 45, "inviteTimeout": 27, "joinability": "T42QlYBo", "leaderElectionGracePeriod": 9, "manualRejoin": true, "maxActiveSessions": 75, "maxPlayers": 80, "minPlayers": 53, "name": "AQd8rZd3", "persistent": false, "preferredClaimKeys": ["1P7Rpbgm", "IRmRkH6I", "imMYRiKD"], "requestedRegions": ["ODn6yCnD", "RmhzdKQt", "pCRdzMAk"], "textChat": false, "tieTeamsSessionLifetime": false, "type": "oHMNwMKR"}' \
    > test.out 2>&1
eval_tap $? 19 'AdminUpdateConfigurationTemplateV1' test.out

#- 20 AdminDeleteConfigurationTemplateV1
./ng net.accelbyte.sdk.cli.Main session adminDeleteConfigurationTemplateV1 \
    --name 'G1YQ2ova' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 20 'AdminDeleteConfigurationTemplateV1' test.out

#- 21 AdminGetMemberActiveSession
./ng net.accelbyte.sdk.cli.Main session adminGetMemberActiveSession \
    --name 'qXBRIQUn' \
    --namespace "$AB_NAMESPACE" \
    --userId 'mb437z2e' \
    > test.out 2>&1
eval_tap $? 21 'AdminGetMemberActiveSession' test.out

#- 22 AdminReconcileMaxActiveSession
./ng net.accelbyte.sdk.cli.Main session adminReconcileMaxActiveSession \
    --name 'z4st10Q4' \
    --namespace "$AB_NAMESPACE" \
    --body '{"userID": "bXQeZEWn"}' \
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
    --configurationName 'xcyCIdv9' \
    --dsPodName 'xDQ5DYiU' \
    --fromTime 'nlsv0f85' \
    --gameMode 'QWV2WcWX' \
    --isPersistent 'PbnSg4h9' \
    --isSoftDeleted 'NTzVnii0' \
    --joinability 'xHQSLr25' \
    --limit '75' \
    --matchPool 'u5un6jdd' \
    --memberID 'oTSd9VcG' \
    --offset '11' \
    --order 'TAoMu62I' \
    --orderBy '3AHsszps' \
    --sessionID 'WZOIguz2' \
    --status 'UUCxfmxl' \
    --statusV2 'rYW1JRYB' \
    --toTime 'GJmVvpKV' \
    > test.out 2>&1
eval_tap $? 25 'AdminQueryGameSessions' test.out

#- 26 AdminQueryGameSessionsByAttributes
./ng net.accelbyte.sdk.cli.Main session adminQueryGameSessionsByAttributes \
    --namespace "$AB_NAMESPACE" \
    --body '{"HiI9EUxe": {}, "NdOfQaFY": {}, "3ALo2h5o": {}}' \
    > test.out 2>&1
eval_tap $? 26 'AdminQueryGameSessionsByAttributes' test.out

#- 27 AdminDeleteBulkGameSessions
./ng net.accelbyte.sdk.cli.Main session adminDeleteBulkGameSessions \
    --namespace "$AB_NAMESPACE" \
    --body '{"ids": ["8Z7346mv", "8jBZ0yuT", "ssw3743U"]}' \
    > test.out 2>&1
eval_tap $? 27 'AdminDeleteBulkGameSessions' test.out

#- 28 AdminSetDSReady
./ng net.accelbyte.sdk.cli.Main session adminSetDSReady \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'oOeuHIBC' \
    --body '{"ready": true}' \
    > test.out 2>&1
eval_tap $? 28 'AdminSetDSReady' test.out

#- 29 AdminKickGameSessionMember
./ng net.accelbyte.sdk.cli.Main session adminKickGameSessionMember \
    --memberId '0nEBfQol' \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'id3tZvgU' \
    > test.out 2>&1
eval_tap $? 29 'AdminKickGameSessionMember' test.out

#- 30 AdminUpdateGameSessionMember
./ng net.accelbyte.sdk.cli.Main session adminUpdateGameSessionMember \
    --memberId 'PtHplckw' \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'izPQ1fNn' \
    --statusType 'nZ06Wpqq' \
    > test.out 2>&1
eval_tap $? 30 'AdminUpdateGameSessionMember' test.out

#- 31 AdminGetListNativeSession
./ng net.accelbyte.sdk.cli.Main session adminGetListNativeSession \
    --namespace "$AB_NAMESPACE" \
    --limit '44' \
    --offset '98' \
    --order '4QUtCQfs' \
    > test.out 2>&1
eval_tap $? 31 'AdminGetListNativeSession' test.out

#- 32 AdminQueryParties
./ng net.accelbyte.sdk.cli.Main session adminQueryParties \
    --namespace "$AB_NAMESPACE" \
    --isSoftDeleted 'YoFiS8Ap' \
    --joinability 'hXCwrhsE' \
    --key 'zO1Zship' \
    --leaderID 'JNFuETeo' \
    --limit '89' \
    --memberID '8qYHJ80Z' \
    --memberStatus 'zGjiVArp' \
    --offset '48' \
    --order 'yqD6mXyH' \
    --orderBy 'n6bN7Fxs' \
    --partyID 'QxEqCqXh' \
    --value 'R0AkVYER' \
    > test.out 2>&1
eval_tap $? 32 'AdminQueryParties' test.out

#- 33 AdminGetPlatformCredentials
./ng net.accelbyte.sdk.cli.Main session adminGetPlatformCredentials \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 33 'AdminGetPlatformCredentials' test.out

#- 34 AdminUpdatePlatformCredentials
./ng net.accelbyte.sdk.cli.Main session adminUpdatePlatformCredentials \
    --namespace "$AB_NAMESPACE" \
    --body '{"psn": {"clientId": "8hBDvoo3", "clientSecret": "MDIdpqRd", "scope": "rKa66WvQ"}}' \
    > test.out 2>&1
eval_tap $? 34 'AdminUpdatePlatformCredentials' test.out

#- 35 AdminDeletePlatformCredentials
./ng net.accelbyte.sdk.cli.Main session adminDeletePlatformCredentials \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 35 'AdminDeletePlatformCredentials' test.out

#- 36 AdminGetRecentPlayer
./ng net.accelbyte.sdk.cli.Main session adminGetRecentPlayer \
    --namespace "$AB_NAMESPACE" \
    --limit '68' \
    --userId 'p2EYRlOo' \
    > test.out 2>&1
eval_tap $? 36 'AdminGetRecentPlayer' test.out

#- 37 AdminGetRecentTeamPlayer
./ng net.accelbyte.sdk.cli.Main session adminGetRecentTeamPlayer \
    --namespace "$AB_NAMESPACE" \
    --limit '13' \
    --userId 'C2tNgSAO' \
    > test.out 2>&1
eval_tap $? 37 'AdminGetRecentTeamPlayer' test.out

#- 38 AdminReadSessionStorage
./ng net.accelbyte.sdk.cli.Main session adminReadSessionStorage \
    --namespace "$AB_NAMESPACE" \
    --sessionId '7Dy6abGw' \
    > test.out 2>&1
eval_tap $? 38 'AdminReadSessionStorage' test.out

#- 39 AdminDeleteUserSessionStorage
./ng net.accelbyte.sdk.cli.Main session adminDeleteUserSessionStorage \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'r0OR2otZ' \
    > test.out 2>&1
eval_tap $? 39 'AdminDeleteUserSessionStorage' test.out

#- 40 AdminReadUserSessionStorage
./ng net.accelbyte.sdk.cli.Main session adminReadUserSessionStorage \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'jkjRqZyH' \
    --userId 'hAZ42jV5' \
    > test.out 2>&1
eval_tap $? 40 'AdminReadUserSessionStorage' test.out

#- 41 AdminQueryPlayerAttributes
./ng net.accelbyte.sdk.cli.Main session adminQueryPlayerAttributes \
    --namespace "$AB_NAMESPACE" \
    --users 'ZREsl7Hx' \
    > test.out 2>&1
eval_tap $? 41 'AdminQueryPlayerAttributes' test.out

#- 42 AdminGetPlayerAttributes
./ng net.accelbyte.sdk.cli.Main session adminGetPlayerAttributes \
    --namespace "$AB_NAMESPACE" \
    --userId '9BeP6RLb' \
    > test.out 2>&1
eval_tap $? 42 'AdminGetPlayerAttributes' test.out

#- 43 AdminSyncNativeSession
./ng net.accelbyte.sdk.cli.Main session adminSyncNativeSession \
    --namespace "$AB_NAMESPACE" \
    --userId 'vRQVaYDN' \
    > test.out 2>&1
eval_tap $? 43 'AdminSyncNativeSession' test.out

#- 44 CreateGameSession
./ng net.accelbyte.sdk.cli.Main session createGameSession \
    --namespace "$AB_NAMESPACE" \
    --body '{"appName": "znYaJrPE", "attributes": {"07A1gu94": {}, "cQglIrUG": {}, "plry00gu": {}}, "autoJoin": true, "backfillTicketID": "n2WsRg3r", "clientVersion": "rJusOMBM", "configurationName": "oqNLCzm1", "customURLGRPC": "hSE4c1Sn", "deployment": "jGVIkgj4", "dsSource": "W2LIKmiX", "fallbackClaimKeys": ["c2HKfISv", "NdJ8TBA9", "PeCJbCf3"], "inactiveTimeout": 80, "inviteTimeout": 17, "joinability": "4OFOHOIo", "matchPool": "OuowIGft", "maxPlayers": 26, "minPlayers": 63, "preferredClaimKeys": ["g59e9xbS", "V6SrGPhe", "Dk3rczFt"], "requestedRegions": ["PqCpEiUl", "o14O0oMU", "cPKWRbEa"], "serverName": "qL0hslKS", "storage": {"leader": {"PZwyIjJi": {}, "447vUS4q": {}, "mqusc19W": {}}}, "teams": [{"parties": [{"partyID": "bxgNFayR", "userIDs": ["w769n4Ne", "ahkkYiko", "FuiJLADc"]}, {"partyID": "KpdREzlH", "userIDs": ["uapEVkgB", "aB26eusJ", "xgjWv59F"]}, {"partyID": "VJRV2efu", "userIDs": ["TzxjPxQ8", "4F80Q8GT", "nbY82b1m"]}], "userIDs": ["bSZGqgKZ", "OYSLZv4Z", "4nPwCECx"]}, {"parties": [{"partyID": "TrTys21d", "userIDs": ["suCUOo80", "IvD5rDMc", "IWceNlEz"]}, {"partyID": "zOKygQVv", "userIDs": ["OkpsAbxz", "WxFyC6op", "TGPHhHyn"]}, {"partyID": "UNNubdI1", "userIDs": ["bMSOuJtz", "q1elRmtI", "4p0dcb5h"]}], "userIDs": ["DozeGhLv", "t8B7cpBw", "3QjmBmFK"]}, {"parties": [{"partyID": "dj1xGnO3", "userIDs": ["dffHNMsV", "3vRC5pg1", "pmkkHw6G"]}, {"partyID": "vdIgHI1h", "userIDs": ["ADHfJ1Yb", "ma9nSZmR", "YwO2y5up"]}, {"partyID": "FE7TNb6w", "userIDs": ["Drz0H6Ez", "ShSPwict", "oa2WjImq"]}], "userIDs": ["ymb4q21D", "nrNAtWdX", "ldcPEDvG"]}], "textChat": true, "ticketIDs": ["6uPKzfD6", "VN5Ir6bZ", "fVKd3LjZ"], "tieTeamsSessionLifetime": true, "type": "7mHnCLgm"}' \
    > test.out 2>&1
eval_tap $? 44 'CreateGameSession' test.out

#- 45 PublicQueryGameSessionsByAttributes
./ng net.accelbyte.sdk.cli.Main session publicQueryGameSessionsByAttributes \
    --namespace "$AB_NAMESPACE" \
    --body '{"IwszKmMV": {}, "M4sTwrQW": {}, "h1lJHVnc": {}}' \
    > test.out 2>&1
eval_tap $? 45 'PublicQueryGameSessionsByAttributes' test.out

#- 46 PublicSessionJoinCode
./ng net.accelbyte.sdk.cli.Main session publicSessionJoinCode \
    --namespace "$AB_NAMESPACE" \
    --body '{"code": "sagdoEyK"}' \
    > test.out 2>&1
eval_tap $? 46 'PublicSessionJoinCode' test.out

#- 47 GetGameSessionByPodName
./ng net.accelbyte.sdk.cli.Main session getGameSessionByPodName \
    --namespace "$AB_NAMESPACE" \
    --podName 'E35YhCAE' \
    > test.out 2>&1
eval_tap $? 47 'GetGameSessionByPodName' test.out

#- 48 GetGameSession
./ng net.accelbyte.sdk.cli.Main session getGameSession \
    --namespace "$AB_NAMESPACE" \
    --sessionId '2B6XsdhN' \
    > test.out 2>&1
eval_tap $? 48 'GetGameSession' test.out

#- 49 UpdateGameSession
./ng net.accelbyte.sdk.cli.Main session updateGameSession \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'gkwBoEMg' \
    --body '{"attributes": {"hRJ9OY60": {}, "wud1XweL": {}, "SV1ud6YJ": {}}, "backfillTicketID": "tPGabU8R", "clientVersion": "W2vqP649", "deployment": "NxsCTdxy", "fallbackClaimKeys": ["xUOGHWVa", "CmOfQvtf", "EzoAcv82"], "inactiveTimeout": 38, "inviteTimeout": 84, "joinability": "teKNc7LQ", "matchPool": "sygiIjkc", "maxPlayers": 90, "minPlayers": 42, "preferredClaimKeys": ["WOPNGs8f", "keL1ISdw", "244gw2VR"], "requestedRegions": ["dmb3mgcl", "hCQoNJWk", "TTgfYpsU"], "teams": [{"parties": [{"partyID": "4We8mr66", "userIDs": ["ImKRTnzv", "vN7F7nIu", "lzpfN8de"]}, {"partyID": "FcfTxqp0", "userIDs": ["vl8L8Dpr", "ypkpuk9S", "CPS9xJPU"]}, {"partyID": "zHFvNdQp", "userIDs": ["0sIoulHU", "tLatDtoS", "5YS4Gp1m"]}], "userIDs": ["IGFxpeMj", "EFGn0ogn", "aTL87Onl"]}, {"parties": [{"partyID": "VGYTGUek", "userIDs": ["kJCcbfEA", "1zpkSFYg", "71x2zCY6"]}, {"partyID": "TGYy5Z81", "userIDs": ["BpHGeeIJ", "lRPoCSyB", "ekfuVY8S"]}, {"partyID": "GXcL4c3u", "userIDs": ["dv88MYDD", "2QKgCHij", "jPVQmvJu"]}], "userIDs": ["akf3Lria", "6UqlkCy8", "QFJeoQuC"]}, {"parties": [{"partyID": "IHtRcUBV", "userIDs": ["z95Tx4tX", "Wp03Gqep", "CMglwLEi"]}, {"partyID": "6KRisYrO", "userIDs": ["D9G1FKbn", "gyuJm3Qy", "vajdXs09"]}, {"partyID": "5PUce8rc", "userIDs": ["ybalEckZ", "cnZAhCYn", "mvBk8SK3"]}], "userIDs": ["ZfJlPsx7", "6Dme9Leh", "k9JJd4SH"]}], "ticketIDs": ["iZUYVvZW", "Bps8mZGF", "6Buby03v"], "tieTeamsSessionLifetime": false, "type": "xR4J0CVt", "version": 97}' \
    > test.out 2>&1
eval_tap $? 49 'UpdateGameSession' test.out

#- 50 DeleteGameSession
./ng net.accelbyte.sdk.cli.Main session deleteGameSession \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'UPyijlHP' \
    > test.out 2>&1
eval_tap $? 50 'DeleteGameSession' test.out

#- 51 PatchUpdateGameSession
./ng net.accelbyte.sdk.cli.Main session patchUpdateGameSession \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'mk9QhxW3' \
    --body '{"attributes": {"1NlxrOeo": {}, "TTaW7Cnr": {}, "dGRFg0Sn": {}}, "backfillTicketID": "MXsa0g2i", "clientVersion": "57GGAqxD", "deployment": "5CQf66bN", "fallbackClaimKeys": ["FXX0DvK3", "pzEO2awr", "h0jDZSXt"], "inactiveTimeout": 58, "inviteTimeout": 50, "joinability": "yZjhS6yQ", "matchPool": "3kf3NJp6", "maxPlayers": 94, "minPlayers": 39, "preferredClaimKeys": ["nFSCgV5t", "q9DeuBsi", "KMq69l2i"], "requestedRegions": ["g9As7Z1g", "67142xX4", "jc7U58EM"], "teams": [{"parties": [{"partyID": "dNDp5MeS", "userIDs": ["9zaH9YYr", "n3FtUJqW", "Qy18GRft"]}, {"partyID": "pwjf7y6a", "userIDs": ["JCT14kGw", "4hOIny7I", "mUM6A1Rm"]}, {"partyID": "9CvhpnkL", "userIDs": ["yIPLqTV5", "gKjXeL7v", "1dla30AB"]}], "userIDs": ["5oSB20Ms", "Or4jAEwp", "reyeOq6L"]}, {"parties": [{"partyID": "t1UB4jkx", "userIDs": ["NLKNI50C", "N1AHmHzt", "oCdYSelL"]}, {"partyID": "tNXoFMlb", "userIDs": ["HXs1rAaw", "DSUED8aJ", "oZ2Q9CQj"]}, {"partyID": "2pj5og8P", "userIDs": ["hMBsyZLB", "r9WDa6WM", "P1srg3ib"]}], "userIDs": ["i97HSqd9", "1FzRzSD5", "9mYatGfD"]}, {"parties": [{"partyID": "fF9JRnZn", "userIDs": ["oSX6Jtbv", "PtojC374", "lnspfzZp"]}, {"partyID": "SoWt16VB", "userIDs": ["xqjnfcGr", "XwsCXgTQ", "pRUPUYHd"]}, {"partyID": "wmCMYHkA", "userIDs": ["yxIwiDdU", "6Hl9mNDs", "nFzIroz8"]}], "userIDs": ["X2YF7daE", "wDjswOSs", "c9BZcTXR"]}], "ticketIDs": ["83k5GTp9", "eNFmKqMV", "v9BdJvxk"], "tieTeamsSessionLifetime": false, "type": "iUhr1uYA", "version": 2}' \
    > test.out 2>&1
eval_tap $? 51 'PatchUpdateGameSession' test.out

#- 52 UpdateGameSessionBackfillTicketID
./ng net.accelbyte.sdk.cli.Main session updateGameSessionBackfillTicketID \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'rstcSAuP' \
    --body '{"backfillTicketID": "OSpzrZf9"}' \
    > test.out 2>&1
eval_tap $? 52 'UpdateGameSessionBackfillTicketID' test.out

#- 53 GameSessionGenerateCode
./ng net.accelbyte.sdk.cli.Main session gameSessionGenerateCode \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'GDKDjT82' \
    > test.out 2>&1
eval_tap $? 53 'GameSessionGenerateCode' test.out

#- 54 PublicRevokeGameSessionCode
./ng net.accelbyte.sdk.cli.Main session publicRevokeGameSessionCode \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'O9kRXuhK' \
    > test.out 2>&1
eval_tap $? 54 'PublicRevokeGameSessionCode' test.out

#- 55 PublicGameSessionInvite
./ng net.accelbyte.sdk.cli.Main session publicGameSessionInvite \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'aLrPmiUP' \
    --body '{"platformID": "evVxUMUc", "userID": "uF17bCn6"}' \
    > test.out 2>&1
eval_tap $? 55 'PublicGameSessionInvite' test.out

#- 56 JoinGameSession
./ng net.accelbyte.sdk.cli.Main session joinGameSession \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'weGeak4u' \
    > test.out 2>&1
eval_tap $? 56 'JoinGameSession' test.out

#- 57 PublicPromoteGameSessionLeader
./ng net.accelbyte.sdk.cli.Main session publicPromoteGameSessionLeader \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'hK6EbMBl' \
    --body '{"leaderID": "xAQttVii"}' \
    > test.out 2>&1
eval_tap $? 57 'PublicPromoteGameSessionLeader' test.out

#- 58 LeaveGameSession
./ng net.accelbyte.sdk.cli.Main session leaveGameSession \
    --namespace "$AB_NAMESPACE" \
    --sessionId '539AHJPK' \
    > test.out 2>&1
eval_tap $? 58 'LeaveGameSession' test.out

#- 59 PublicKickGameSessionMember
./ng net.accelbyte.sdk.cli.Main session publicKickGameSessionMember \
    --memberId 'd8pKkfij' \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'K9FqLgCf' \
    > test.out 2>&1
eval_tap $? 59 'PublicKickGameSessionMember' test.out

#- 60 PublicGameSessionReject
./ng net.accelbyte.sdk.cli.Main session publicGameSessionReject \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'j6MHPGRG' \
    > test.out 2>&1
eval_tap $? 60 'PublicGameSessionReject' test.out

#- 61 GetSessionServerSecret
./ng net.accelbyte.sdk.cli.Main session getSessionServerSecret \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'pqQUVrzp' \
    > test.out 2>&1
eval_tap $? 61 'GetSessionServerSecret' test.out

#- 62 AppendTeamGameSession
./ng net.accelbyte.sdk.cli.Main session appendTeamGameSession \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'd0bMIbvc' \
    --body '{"additionalMembers": [{"partyID": "JPsJLUBx", "userIDs": ["AZeVPveX", "XdK7hdIh", "n83Jm1pS"]}, {"partyID": "rUr8aOys", "userIDs": ["OjaFPTv6", "emPeMve7", "OfY5aDMf"]}, {"partyID": "SR9nIafP", "userIDs": ["DrJq1gXX", "exhNavHs", "Pl09aLKm"]}], "proposedTeams": [{"parties": [{"partyID": "srwUjDIX", "userIDs": ["eZUucY2z", "Q1BZ9DCK", "1QaGBFJw"]}, {"partyID": "SSTYzUC8", "userIDs": ["SaaP23f8", "YjgjFVxe", "4fESfjJa"]}, {"partyID": "T4wWrORZ", "userIDs": ["WOToCT7F", "gynfzq5M", "dkQKS7zO"]}], "userIDs": ["fFSkXP4W", "c02l5pYg", "jcHwKeHD"]}, {"parties": [{"partyID": "77xIXnzv", "userIDs": ["YrBltMhe", "KogFeKvE", "CXfhdNDW"]}, {"partyID": "kMD1MMZ6", "userIDs": ["8BgnbrXE", "6oFDfCtj", "PuNVrLnz"]}, {"partyID": "yjQUWVwE", "userIDs": ["dtYGVvqg", "msHOs4gh", "dd1Ypl40"]}], "userIDs": ["txmBStbl", "IfeKlbtd", "NEFpcNLD"]}, {"parties": [{"partyID": "2YI5RHJZ", "userIDs": ["1OlaZRy4", "BRp5j79R", "MjSA7QOX"]}, {"partyID": "ngK08s1j", "userIDs": ["NyuFPtHp", "3lM7ZV1R", "kxMEWZyB"]}, {"partyID": "nnZ7g585", "userIDs": ["5J7KTqni", "eoEH5UtB", "5jChFCYs"]}], "userIDs": ["XiaCwjgv", "zAAiaxwF", "Gkqwsdap"]}], "version": 94}' \
    > test.out 2>&1
eval_tap $? 62 'AppendTeamGameSession' test.out

#- 63 PublicGameSessionCancel
./ng net.accelbyte.sdk.cli.Main session publicGameSessionCancel \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'yA9EgqJg' \
    --userId 'FZlBibz2' \
    > test.out 2>&1
eval_tap $? 63 'PublicGameSessionCancel' test.out

#- 64 PublicPartyJoinCode
./ng net.accelbyte.sdk.cli.Main session publicPartyJoinCode \
    --namespace "$AB_NAMESPACE" \
    --body '{"code": "roV3INfd"}' \
    > test.out 2>&1
eval_tap $? 64 'PublicPartyJoinCode' test.out

#- 65 PublicGetParty
./ng net.accelbyte.sdk.cli.Main session publicGetParty \
    --namespace "$AB_NAMESPACE" \
    --partyId 'LETI7wkl' \
    > test.out 2>&1
eval_tap $? 65 'PublicGetParty' test.out

#- 66 PublicUpdateParty
./ng net.accelbyte.sdk.cli.Main session publicUpdateParty \
    --namespace "$AB_NAMESPACE" \
    --partyId 'Ig5roLyD' \
    --body '{"attributes": {"iVwzcWKs": {}, "mtp3AM0W": {}, "xa2sbLRF": {}}, "inactiveTimeout": 74, "inviteTimeout": 23, "joinability": "U2G4hRLt", "maxPlayers": 26, "minPlayers": 43, "type": "bWuObYAN", "version": 78}' \
    > test.out 2>&1
eval_tap $? 66 'PublicUpdateParty' test.out

#- 67 PublicPatchUpdateParty
./ng net.accelbyte.sdk.cli.Main session publicPatchUpdateParty \
    --namespace "$AB_NAMESPACE" \
    --partyId 'OOWR1F3O' \
    --body '{"attributes": {"I1vWJSxU": {}, "E3qMGNte": {}, "iuLBfBSU": {}}, "inactiveTimeout": 90, "inviteTimeout": 74, "joinability": "6cVCfbLT", "maxPlayers": 87, "minPlayers": 61, "type": "VpOywYXm", "version": 11}' \
    > test.out 2>&1
eval_tap $? 67 'PublicPatchUpdateParty' test.out

#- 68 PublicGeneratePartyCode
./ng net.accelbyte.sdk.cli.Main session publicGeneratePartyCode \
    --namespace "$AB_NAMESPACE" \
    --partyId 'EqmccYtZ' \
    > test.out 2>&1
eval_tap $? 68 'PublicGeneratePartyCode' test.out

#- 69 PublicRevokePartyCode
./ng net.accelbyte.sdk.cli.Main session publicRevokePartyCode \
    --namespace "$AB_NAMESPACE" \
    --partyId '95WAR3d9' \
    > test.out 2>&1
eval_tap $? 69 'PublicRevokePartyCode' test.out

#- 70 PublicPartyInvite
./ng net.accelbyte.sdk.cli.Main session publicPartyInvite \
    --namespace "$AB_NAMESPACE" \
    --partyId 'LJf5YmOs' \
    --body '{"platformID": "gshDazN1", "userID": "snhScpHI"}' \
    > test.out 2>&1
eval_tap $? 70 'PublicPartyInvite' test.out

#- 71 PublicPromotePartyLeader
./ng net.accelbyte.sdk.cli.Main session publicPromotePartyLeader \
    --namespace "$AB_NAMESPACE" \
    --partyId 'SyjMsvN1' \
    --body '{"leaderID": "d0Y8zAuV"}' \
    > test.out 2>&1
eval_tap $? 71 'PublicPromotePartyLeader' test.out

#- 72 PublicPartyJoin
./ng net.accelbyte.sdk.cli.Main session publicPartyJoin \
    --namespace "$AB_NAMESPACE" \
    --partyId '1GexXSTD' \
    > test.out 2>&1
eval_tap $? 72 'PublicPartyJoin' test.out

#- 73 PublicPartyLeave
./ng net.accelbyte.sdk.cli.Main session publicPartyLeave \
    --namespace "$AB_NAMESPACE" \
    --partyId 'dk4fH89C' \
    > test.out 2>&1
eval_tap $? 73 'PublicPartyLeave' test.out

#- 74 PublicPartyReject
./ng net.accelbyte.sdk.cli.Main session publicPartyReject \
    --namespace "$AB_NAMESPACE" \
    --partyId 'OgQReytN' \
    > test.out 2>&1
eval_tap $? 74 'PublicPartyReject' test.out

#- 75 PublicPartyCancel
./ng net.accelbyte.sdk.cli.Main session publicPartyCancel \
    --namespace "$AB_NAMESPACE" \
    --partyId 'pKluaKGt' \
    --userId '408mXkde' \
    > test.out 2>&1
eval_tap $? 75 'PublicPartyCancel' test.out

#- 76 PublicPartyKick
./ng net.accelbyte.sdk.cli.Main session publicPartyKick \
    --namespace "$AB_NAMESPACE" \
    --partyId 'YqkDg6tL' \
    --userId 'Yd5oqNll' \
    > test.out 2>&1
eval_tap $? 76 'PublicPartyKick' test.out

#- 77 PublicCreateParty
./ng net.accelbyte.sdk.cli.Main session publicCreateParty \
    --namespace "$AB_NAMESPACE" \
    --body '{"attributes": {"CkAB3wbD": {}, "QfTfy2R9": {}, "x31mMYZW": {}}, "configurationName": "aFbOeX2k", "inactiveTimeout": 65, "inviteTimeout": 77, "joinability": "vOiHvSJS", "maxPlayers": 33, "members": [{"ID": "N2ypBldg", "PlatformID": "W1NStghG", "PlatformUserID": "E5zg6F44"}, {"ID": "VfILCxO8", "PlatformID": "sJsQFrtI", "PlatformUserID": "RMU4L4Rh"}, {"ID": "LemkTG9a", "PlatformID": "YxIDG1Gj", "PlatformUserID": "yS5Zppr2"}], "minPlayers": 91, "textChat": false, "type": "Nl2QOU3H"}' \
    > test.out 2>&1
eval_tap $? 77 'PublicCreateParty' test.out

#- 78 PublicGetRecentPlayer
./ng net.accelbyte.sdk.cli.Main session publicGetRecentPlayer \
    --namespace "$AB_NAMESPACE" \
    --limit '36' \
    > test.out 2>&1
eval_tap $? 78 'PublicGetRecentPlayer' test.out

#- 79 PublicGetRecentTeamPlayer
./ng net.accelbyte.sdk.cli.Main session publicGetRecentTeamPlayer \
    --namespace "$AB_NAMESPACE" \
    --limit '72' \
    > test.out 2>&1
eval_tap $? 79 'PublicGetRecentTeamPlayer' test.out

#- 80 PublicUpdateInsertSessionStorageLeader
./ng net.accelbyte.sdk.cli.Main session publicUpdateInsertSessionStorageLeader \
    --namespace "$AB_NAMESPACE" \
    --sessionId '3dEcJXd9' \
    --body '{"pULlaIhx": {}, "zvXhUJRT": {}, "ccvOCHi6": {}}' \
    > test.out 2>&1
eval_tap $? 80 'PublicUpdateInsertSessionStorageLeader' test.out

#- 81 PublicUpdateInsertSessionStorage
./ng net.accelbyte.sdk.cli.Main session publicUpdateInsertSessionStorage \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'bZVPZuaK' \
    --userId 'Npfp2Jsd' \
    --body '{"AkWx3aDs": {}, "jt6UecYz": {}, "Vr0uYNfe": {}}' \
    > test.out 2>&1
eval_tap $? 81 'PublicUpdateInsertSessionStorage' test.out

#- 82 PublicGetBulkPlayerCurrentPlatform
./ng net.accelbyte.sdk.cli.Main session publicGetBulkPlayerCurrentPlatform \
    --namespace "$AB_NAMESPACE" \
    --body '{"userIDs": ["MmsdHp9X", "nFYXbuE8", "nb2pRbVf"]}' \
    > test.out 2>&1
eval_tap $? 82 'PublicGetBulkPlayerCurrentPlatform' test.out

#- 83 PublicGetPlayerAttributes
./ng net.accelbyte.sdk.cli.Main session publicGetPlayerAttributes \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 83 'PublicGetPlayerAttributes' test.out

#- 84 PublicStorePlayerAttributes
./ng net.accelbyte.sdk.cli.Main session publicStorePlayerAttributes \
    --namespace "$AB_NAMESPACE" \
    --body '{"crossplayEnabled": true, "currentPlatform": "6MZTdbZU", "data": {"iGFXNw9u": {}, "AAIveSy9": {}, "xUnrOBat": {}}, "platforms": [{"name": "kY3b4EXp", "userID": "QxzdEttg"}, {"name": "JVBcba2l", "userID": "boC3mkCj"}, {"name": "k22vHHwm", "userID": "aant9TSQ"}], "roles": ["SxnSTVGg", "kwv9QbDg", "hn58E0xC"], "simultaneousPlatform": "TZGILK4Z"}' \
    > test.out 2>&1
eval_tap $? 84 'PublicStorePlayerAttributes' test.out

#- 85 PublicDeletePlayerAttributes
./ng net.accelbyte.sdk.cli.Main session publicDeletePlayerAttributes \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 85 'PublicDeletePlayerAttributes' test.out

#- 86 PublicQueryMyGameSessions
./ng net.accelbyte.sdk.cli.Main session publicQueryMyGameSessions \
    --namespace "$AB_NAMESPACE" \
    --order 'yOKdiZHu' \
    --orderBy 'xDKMtJVZ' \
    --status 'yzFoAyGH' \
    > test.out 2>&1
eval_tap $? 86 'PublicQueryMyGameSessions' test.out

#- 87 PublicQueryMyParties
./ng net.accelbyte.sdk.cli.Main session publicQueryMyParties \
    --namespace "$AB_NAMESPACE" \
    --order 'zVwPiGDb' \
    --orderBy 'MewEPQSj' \
    --status 'Xd0lUxvy' \
    > test.out 2>&1
eval_tap $? 87 'PublicQueryMyParties' test.out


rm -f "tmp.dat"

exit $EXIT_CODE