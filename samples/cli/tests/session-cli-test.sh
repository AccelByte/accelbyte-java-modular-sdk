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
echo "1..98"

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

#- 3 PprofHandler
./ng net.accelbyte.sdk.cli.Main session pprofHandler \
    > test.out 2>&1
eval_tap $? 3 'PprofHandler' test.out

#- 4 AllocsHandler
./ng net.accelbyte.sdk.cli.Main session allocsHandler \
    > test.out 2>&1
eval_tap $? 4 'AllocsHandler' test.out

#- 5 BlockHandler
./ng net.accelbyte.sdk.cli.Main session blockHandler \
    > test.out 2>&1
eval_tap $? 5 'BlockHandler' test.out

#- 6 CmdlineHandler
./ng net.accelbyte.sdk.cli.Main session cmdlineHandler \
    > test.out 2>&1
eval_tap $? 6 'CmdlineHandler' test.out

#- 7 GoroutineHandler
./ng net.accelbyte.sdk.cli.Main session goroutineHandler \
    > test.out 2>&1
eval_tap $? 7 'GoroutineHandler' test.out

#- 8 HeapHandler
./ng net.accelbyte.sdk.cli.Main session heapHandler \
    > test.out 2>&1
eval_tap $? 8 'HeapHandler' test.out

#- 9 MutexHandler
./ng net.accelbyte.sdk.cli.Main session mutexHandler \
    > test.out 2>&1
eval_tap $? 9 'MutexHandler' test.out

#- 10 Profile
./ng net.accelbyte.sdk.cli.Main session profile \
    > test.out 2>&1
eval_tap $? 10 'Profile' test.out

#- 11 SymbolHandler
./ng net.accelbyte.sdk.cli.Main session symbolHandler \
    > test.out 2>&1
eval_tap $? 11 'SymbolHandler' test.out

#- 12 ThreadcreateHandler
./ng net.accelbyte.sdk.cli.Main session threadcreateHandler \
    > test.out 2>&1
eval_tap $? 12 'ThreadcreateHandler' test.out

#- 13 TraceHandler
./ng net.accelbyte.sdk.cli.Main session traceHandler \
    > test.out 2>&1
eval_tap $? 13 'TraceHandler' test.out

#- 14 GetHealthcheckInfoV1
./ng net.accelbyte.sdk.cli.Main session getHealthcheckInfoV1 \
    > test.out 2>&1
eval_tap $? 14 'GetHealthcheckInfoV1' test.out

#- 15 AdminGetLogConfig
./ng net.accelbyte.sdk.cli.Main session adminGetLogConfig \
    > test.out 2>&1
eval_tap $? 15 'AdminGetLogConfig' test.out

#- 16 AdminPatchUpdateLogConfig
./ng net.accelbyte.sdk.cli.Main session adminPatchUpdateLogConfig \
    --body '{"logLevel": "error"}' \
    > test.out 2>&1
eval_tap $? 16 'AdminPatchUpdateLogConfig' test.out

#- 17 AdminGetDSMCConfigurationDefault
./ng net.accelbyte.sdk.cli.Main session adminGetDSMCConfigurationDefault \
    > test.out 2>&1
eval_tap $? 17 'AdminGetDSMCConfigurationDefault' test.out

#- 18 AdminListEnvironmentVariables
./ng net.accelbyte.sdk.cli.Main session adminListEnvironmentVariables \
    > test.out 2>&1
eval_tap $? 18 'AdminListEnvironmentVariables' test.out

#- 19 AdminListGlobalConfiguration
./ng net.accelbyte.sdk.cli.Main session adminListGlobalConfiguration \
    > test.out 2>&1
eval_tap $? 19 'AdminListGlobalConfiguration' test.out

#- 20 AdminUpdateGlobalConfiguration
./ng net.accelbyte.sdk.cli.Main session adminUpdateGlobalConfiguration \
    --body '{"metricExcludedNamespaces": ["S8nkuxUZ", "R6nnuFUo", "S8uTrVIT"], "regionRetryMapping": {"2iKDuQxt": ["f2fWcwyD", "f38cdoVW", "nOJ8Ee5k"], "qsqWEoln": ["QnUehLpL", "D0kg1yyM", "4ycHzBcp"], "ugxbzGwA": ["SJzHEG08", "d3tRn9LE", "2feu2siY"]}, "regionURLMapping": ["VTooY2Dk", "FCsIxbGg", "hXfQ68U9"], "testGameMode": "edt30FAh", "testRegionURLMapping": ["BpFbAl5Q", "GJr4uEJC", "Lw4ThyG7"], "testTargetUserIDs": ["uOUuQYMF", "K6JTuzX0", "SwF98YRO"]}' \
    > test.out 2>&1
eval_tap $? 20 'AdminUpdateGlobalConfiguration' test.out

#- 21 AdminDeleteGlobalConfiguration
./ng net.accelbyte.sdk.cli.Main session adminDeleteGlobalConfiguration \
    > test.out 2>&1
eval_tap $? 21 'AdminDeleteGlobalConfiguration' test.out

#- 22 AdminGetConfigurationAlertV1
./ng net.accelbyte.sdk.cli.Main session adminGetConfigurationAlertV1 \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 22 'AdminGetConfigurationAlertV1' test.out

#- 23 AdminUpdateConfigurationAlertV1
./ng net.accelbyte.sdk.cli.Main session adminUpdateConfigurationAlertV1 \
    --namespace "$AB_NAMESPACE" \
    --body '{"durationDays": 44}' \
    > test.out 2>&1
eval_tap $? 23 'AdminUpdateConfigurationAlertV1' test.out

#- 24 AdminCreateConfigurationAlertV1
./ng net.accelbyte.sdk.cli.Main session adminCreateConfigurationAlertV1 \
    --namespace "$AB_NAMESPACE" \
    --body '{"durationDays": 74}' \
    > test.out 2>&1
eval_tap $? 24 'AdminCreateConfigurationAlertV1' test.out

#- 25 AdminDeleteConfigurationAlertV1
./ng net.accelbyte.sdk.cli.Main session adminDeleteConfigurationAlertV1 \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 25 'AdminDeleteConfigurationAlertV1' test.out

#- 26 HandleUploadXboxPFXCertificate
./ng net.accelbyte.sdk.cli.Main session handleUploadXboxPFXCertificate \
    --namespace "$AB_NAMESPACE" \
    --description 'TbtxkCSb' \
    --certname '9nZAGVay' \
    --file 'tmp.dat' \
    --password 'KRsBcwfP' \
    > test.out 2>&1
eval_tap $? 26 'HandleUploadXboxPFXCertificate' test.out

#- 27 AdminCreateConfigurationTemplateV1
./ng net.accelbyte.sdk.cli.Main session adminCreateConfigurationTemplateV1 \
    --namespace "$AB_NAMESPACE" \
    --body '{"NativeSessionSetting": {"PSNServiceLabel": 88, "PSNSupportedPlatforms": ["WPe3CJmi", "fb6tUFkO", "fQUuYkvu"], "SessionTitle": "3TpiI1yu", "ShouldSync": false, "XboxAllowCrossPlatform": false, "XboxSandboxID": "ikuHUWon", "XboxServiceConfigID": "xKonpTHp", "XboxSessionTemplateName": "yYU3MUy1", "XboxTitleID": "qBhjlPzr", "localizedSessionName": {"JQO2p2k4": {}, "zFrY7Wyr": {}, "tF4YFG4h": {}}}, "PSNBaseUrl": "eVSEkAaB", "appName": "6u70e5nh", "attributes": {"IRsbSNRi": {}, "JcTqNKFJ": {}, "wQViWnfa": {}}, "autoJoin": false, "autoLeaveSession": true, "clientVersion": "3Q2shAFL", "customURLGRPC": "yk2beleV", "deployment": "TqODU1cZ", "disableCodeGeneration": true, "disableResendInvite": true, "dsManualSetReady": false, "dsSource": "7KOnqFyu", "enableSecret": true, "fallbackClaimKeys": ["7sgayRTp", "TsD9odGL", "BIkJE63o"], "immutableStorage": false, "inactiveTimeout": 79, "inviteTimeout": 91, "joinability": "6xv5KSGP", "leaderElectionGracePeriod": 50, "manualRejoin": false, "maxActiveSessions": 10, "maxPlayers": 83, "minPlayers": 23, "name": "hclhVhbJ", "persistent": false, "preferredClaimKeys": ["wpNXMOwz", "urVyaFAb", "vju39Tjs"], "requestedRegions": ["gcaWhsdW", "ClSqRRY4", "fcQ2fw4L"], "textChat": false, "tieTeamsSessionLifetime": true, "type": "lrlXskh2"}' \
    > test.out 2>&1
eval_tap $? 27 'AdminCreateConfigurationTemplateV1' test.out

#- 28 AdminGetAllConfigurationTemplatesV1
./ng net.accelbyte.sdk.cli.Main session adminGetAllConfigurationTemplatesV1 \
    --namespace "$AB_NAMESPACE" \
    --limit '82' \
    --name 'sJH5Kp6c' \
    --offset '59' \
    --order 'MBBCPkyz' \
    --orderBy 'hVLANUOk' \
    > test.out 2>&1
eval_tap $? 28 'AdminGetAllConfigurationTemplatesV1' test.out

#- 29 AdminGetConfigurationTemplateV1
./ng net.accelbyte.sdk.cli.Main session adminGetConfigurationTemplateV1 \
    --name 'w5UHMof9' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 29 'AdminGetConfigurationTemplateV1' test.out

#- 30 AdminUpdateConfigurationTemplateV1
./ng net.accelbyte.sdk.cli.Main session adminUpdateConfigurationTemplateV1 \
    --name 'VOecWkwU' \
    --namespace "$AB_NAMESPACE" \
    --body '{"NativeSessionSetting": {"PSNServiceLabel": 44, "PSNSupportedPlatforms": ["6s5AvXgH", "4tclsU8S", "3ODmyT8b"], "SessionTitle": "d3LFoeJJ", "ShouldSync": false, "XboxAllowCrossPlatform": true, "XboxSandboxID": "M3zAr9uS", "XboxServiceConfigID": "XWzIgPbf", "XboxSessionTemplateName": "NBgTgLv6", "XboxTitleID": "0lMGFY6U", "localizedSessionName": {"5YGbCsvl": {}, "lmZwfJKL": {}, "ONoVsEpW": {}}}, "PSNBaseUrl": "SzE41uB3", "appName": "xG3atWkX", "attributes": {"Y5oI9nIE": {}, "8BncYNrY": {}, "h3NFPYIU": {}}, "autoJoin": true, "autoLeaveSession": true, "clientVersion": "h8kSHwLn", "customURLGRPC": "eUZpTq7i", "deployment": "pkI56bkp", "disableCodeGeneration": false, "disableResendInvite": false, "dsManualSetReady": false, "dsSource": "dBnYQ3xF", "enableSecret": false, "fallbackClaimKeys": ["hEYNfznz", "kkx7fHti", "JJHPzu13"], "immutableStorage": false, "inactiveTimeout": 47, "inviteTimeout": 8, "joinability": "VQoHU0Vo", "leaderElectionGracePeriod": 34, "manualRejoin": true, "maxActiveSessions": 2, "maxPlayers": 78, "minPlayers": 86, "name": "NBjhpFaw", "persistent": true, "preferredClaimKeys": ["NnkpM7Nh", "jpbhGchF", "mjUM9USf"], "requestedRegions": ["hk79jluN", "QF38giPq", "ZGS8UfcQ"], "textChat": true, "tieTeamsSessionLifetime": false, "type": "qYhI6v3n"}' \
    > test.out 2>&1
eval_tap $? 30 'AdminUpdateConfigurationTemplateV1' test.out

#- 31 AdminDeleteConfigurationTemplateV1
./ng net.accelbyte.sdk.cli.Main session adminDeleteConfigurationTemplateV1 \
    --name 'kg2oEOdJ' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 31 'AdminDeleteConfigurationTemplateV1' test.out

#- 32 AdminGetMemberActiveSession
./ng net.accelbyte.sdk.cli.Main session adminGetMemberActiveSession \
    --name '5cSgWd30' \
    --namespace "$AB_NAMESPACE" \
    --userId 'gy0YnHXl' \
    > test.out 2>&1
eval_tap $? 32 'AdminGetMemberActiveSession' test.out

#- 33 AdminReconcileMaxActiveSession
./ng net.accelbyte.sdk.cli.Main session adminReconcileMaxActiveSession \
    --name 'naFKpYzI' \
    --namespace "$AB_NAMESPACE" \
    --body '{"userID": "5h3ATrTx"}' \
    > test.out 2>&1
eval_tap $? 33 'AdminReconcileMaxActiveSession' test.out

#- 34 AdminGetDSMCConfiguration
./ng net.accelbyte.sdk.cli.Main session adminGetDSMCConfiguration \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 34 'AdminGetDSMCConfiguration' test.out

#- 35 AdminSyncDSMCConfiguration
./ng net.accelbyte.sdk.cli.Main session adminSyncDSMCConfiguration \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 35 'AdminSyncDSMCConfiguration' test.out

#- 36 AdminQueryGameSessions
./ng net.accelbyte.sdk.cli.Main session adminQueryGameSessions \
    --namespace "$AB_NAMESPACE" \
    --configurationName 'zzNvqkBz' \
    --dsPodName 'ilZ1TDT2' \
    --fromTime 'bAP2iHxC' \
    --gameMode 'gTANsIhi' \
    --isPersistent 'IO28GrZs' \
    --isSoftDeleted 'OXwbFdF5' \
    --joinability 'f3zf3IJD' \
    --limit '51' \
    --matchPool 'pUeB6Drz' \
    --memberID 'Qw37XPWH' \
    --offset '66' \
    --order 'jF9yxpSr' \
    --orderBy '1hPl2JtB' \
    --sessionID 'pAZpXARQ' \
    --status 'wbHQwa0G' \
    --statusV2 'BTxyVORf' \
    --toTime 'xDuSFAD2' \
    > test.out 2>&1
eval_tap $? 36 'AdminQueryGameSessions' test.out

#- 37 AdminQueryGameSessionsByAttributes
./ng net.accelbyte.sdk.cli.Main session adminQueryGameSessionsByAttributes \
    --namespace "$AB_NAMESPACE" \
    --body '{"nM9wmX3D": {}, "lQQaGFkM": {}, "kh0llxbM": {}}' \
    > test.out 2>&1
eval_tap $? 37 'AdminQueryGameSessionsByAttributes' test.out

#- 38 AdminDeleteBulkGameSessions
./ng net.accelbyte.sdk.cli.Main session adminDeleteBulkGameSessions \
    --namespace "$AB_NAMESPACE" \
    --body '{"ids": ["peXM7gzG", "QzoPb1TB", "h3korsUP"]}' \
    > test.out 2>&1
eval_tap $? 38 'AdminDeleteBulkGameSessions' test.out

#- 39 AdminSetDSReady
./ng net.accelbyte.sdk.cli.Main session adminSetDSReady \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'QND17ntQ' \
    --body '{"ready": true}' \
    > test.out 2>&1
eval_tap $? 39 'AdminSetDSReady' test.out

#- 40 AdminKickGameSessionMember
./ng net.accelbyte.sdk.cli.Main session adminKickGameSessionMember \
    --memberId 'iNRdWLJH' \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'knHp83Uv' \
    > test.out 2>&1
eval_tap $? 40 'AdminKickGameSessionMember' test.out

#- 41 AdminUpdateGameSessionMember
./ng net.accelbyte.sdk.cli.Main session adminUpdateGameSessionMember \
    --memberId '9tVuO5id' \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'jwGYBd36' \
    --statusType 'w4ykoOrS' \
    > test.out 2>&1
eval_tap $? 41 'AdminUpdateGameSessionMember' test.out

#- 42 AdminGetListNativeSession
./ng net.accelbyte.sdk.cli.Main session adminGetListNativeSession \
    --namespace "$AB_NAMESPACE" \
    --limit '18' \
    --offset '1' \
    --order 'R3ra9Ohf' \
    > test.out 2>&1
eval_tap $? 42 'AdminGetListNativeSession' test.out

#- 43 AdminQueryParties
./ng net.accelbyte.sdk.cli.Main session adminQueryParties \
    --namespace "$AB_NAMESPACE" \
    --isSoftDeleted 'r8Bkh9x4' \
    --joinability 'nDe35u2Y' \
    --key 'EvD0RXIJ' \
    --leaderID 'arlNtnoa' \
    --limit '8' \
    --memberID '6rnHcFpq' \
    --memberStatus 'MROdoe5K' \
    --offset '28' \
    --order 'ibjp3imn' \
    --orderBy '2muqd7Q4' \
    --partyID 'HSuxDVQQ' \
    --value 'V7NctqY0' \
    > test.out 2>&1
eval_tap $? 43 'AdminQueryParties' test.out

#- 44 AdminGetPlatformCredentials
./ng net.accelbyte.sdk.cli.Main session adminGetPlatformCredentials \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 44 'AdminGetPlatformCredentials' test.out

#- 45 AdminUpdatePlatformCredentials
./ng net.accelbyte.sdk.cli.Main session adminUpdatePlatformCredentials \
    --namespace "$AB_NAMESPACE" \
    --body '{"psn": {"clientId": "VrAc5w7g", "clientSecret": "pVpiZILm", "scope": "D6M3wPT4"}}' \
    > test.out 2>&1
eval_tap $? 45 'AdminUpdatePlatformCredentials' test.out

#- 46 AdminDeletePlatformCredentials
./ng net.accelbyte.sdk.cli.Main session adminDeletePlatformCredentials \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 46 'AdminDeletePlatformCredentials' test.out

#- 47 AdminGetRecentPlayer
./ng net.accelbyte.sdk.cli.Main session adminGetRecentPlayer \
    --namespace "$AB_NAMESPACE" \
    --limit '0' \
    --userId 'qWif5Hi8' \
    > test.out 2>&1
eval_tap $? 47 'AdminGetRecentPlayer' test.out

#- 48 AdminGetRecentTeamPlayer
./ng net.accelbyte.sdk.cli.Main session adminGetRecentTeamPlayer \
    --namespace "$AB_NAMESPACE" \
    --limit '72' \
    --userId 'KLqS44S3' \
    > test.out 2>&1
eval_tap $? 48 'AdminGetRecentTeamPlayer' test.out

#- 49 AdminReadSessionStorage
./ng net.accelbyte.sdk.cli.Main session adminReadSessionStorage \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'EfjxDsII' \
    > test.out 2>&1
eval_tap $? 49 'AdminReadSessionStorage' test.out

#- 50 AdminDeleteUserSessionStorage
./ng net.accelbyte.sdk.cli.Main session adminDeleteUserSessionStorage \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'Vl8tpVSe' \
    > test.out 2>&1
eval_tap $? 50 'AdminDeleteUserSessionStorage' test.out

#- 51 AdminReadUserSessionStorage
./ng net.accelbyte.sdk.cli.Main session adminReadUserSessionStorage \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'Va4bw0ww' \
    --userId '42QWogSH' \
    > test.out 2>&1
eval_tap $? 51 'AdminReadUserSessionStorage' test.out

#- 52 AdminQueryPlayerAttributes
./ng net.accelbyte.sdk.cli.Main session adminQueryPlayerAttributes \
    --namespace "$AB_NAMESPACE" \
    --users '7UH1tX5w' \
    > test.out 2>&1
eval_tap $? 52 'AdminQueryPlayerAttributes' test.out

#- 53 AdminGetPlayerAttributes
./ng net.accelbyte.sdk.cli.Main session adminGetPlayerAttributes \
    --namespace "$AB_NAMESPACE" \
    --userId 'FEthxoax' \
    > test.out 2>&1
eval_tap $? 53 'AdminGetPlayerAttributes' test.out

#- 54 AdminSyncNativeSession
./ng net.accelbyte.sdk.cli.Main session adminSyncNativeSession \
    --namespace "$AB_NAMESPACE" \
    --userId 'aT4jjjGr' \
    > test.out 2>&1
eval_tap $? 54 'AdminSyncNativeSession' test.out

#- 55 CreateGameSession
./ng net.accelbyte.sdk.cli.Main session createGameSession \
    --namespace "$AB_NAMESPACE" \
    --body '{"appName": "oYyImxH7", "attributes": {"TqpHQIWj": {}, "YRLDyK8M": {}, "nIAzvqyo": {}}, "autoJoin": false, "backfillTicketID": "miDmXFIj", "clientVersion": "4w7qd1Rx", "configurationName": "5ap1tNA8", "customURLGRPC": "w2PdmMDP", "deployment": "WDABgNts", "dsSource": "pTvXCFQt", "fallbackClaimKeys": ["ybDd2Skt", "iu4B9uWm", "zg5OoByq"], "inactiveTimeout": 0, "inviteTimeout": 77, "joinability": "VOex4zg9", "matchPool": "awEGXGBL", "maxPlayers": 67, "minPlayers": 48, "preferredClaimKeys": ["jsybbb6r", "mxQ8egPo", "YIjIwMYD"], "requestedRegions": ["Vtr1NM1W", "29Heah7x", "9s3WqPFR"], "serverName": "iP4SIiJE", "storage": {"leader": {"j2BqBNwT": {}, "6kGfyekW": {}, "Nfs7mNHs": {}}}, "teams": [{"parties": [{"partyID": "lRuzH0js", "userIDs": ["jKz6dfPy", "pbP4KQaC", "w91U0Nsu"]}, {"partyID": "kiyF3iL6", "userIDs": ["pvf0qaQH", "Ncxl9NNB", "zGrnoEIp"]}, {"partyID": "WiEDv4lQ", "userIDs": ["4CizIBlx", "2WHe89uC", "zqwN9Ulb"]}], "userIDs": ["ckGgoPk9", "Rx7KjWe9", "EVFQZYR8"]}, {"parties": [{"partyID": "HHQfOg0l", "userIDs": ["yOYcVzMc", "OTkC6kho", "4ehwrzYe"]}, {"partyID": "oKd1Gi67", "userIDs": ["GXe2d6Bz", "deyIsfM9", "EeIn1W4C"]}, {"partyID": "w8ENxkev", "userIDs": ["Cka3t9M1", "Hs6f0jsj", "1JfYhQaZ"]}], "userIDs": ["wC6ZA3QE", "uLv8nLnY", "9Y3IK75E"]}, {"parties": [{"partyID": "sCNfUGYZ", "userIDs": ["35DLNvse", "qjCWOJcH", "JnpyEdXB"]}, {"partyID": "sNUfl2wy", "userIDs": ["zcQzbgjF", "bbSlIB5Q", "S60qlCGe"]}, {"partyID": "X7ucsoiW", "userIDs": ["x5TbjaBk", "dVYDt9MW", "QVxuLgHe"]}], "userIDs": ["755Jjgqt", "WjsPNk3c", "hzWpvFjp"]}], "textChat": true, "ticketIDs": ["J5FkWpgr", "17kIKxzv", "M6Lq3M7B"], "tieTeamsSessionLifetime": false, "type": "GGHmnyUM"}' \
    > test.out 2>&1
eval_tap $? 55 'CreateGameSession' test.out

#- 56 PublicQueryGameSessionsByAttributes
./ng net.accelbyte.sdk.cli.Main session publicQueryGameSessionsByAttributes \
    --namespace "$AB_NAMESPACE" \
    --body '{"U5btFUIy": {}, "3kZDpa3z": {}, "dz4whZCH": {}}' \
    > test.out 2>&1
eval_tap $? 56 'PublicQueryGameSessionsByAttributes' test.out

#- 57 PublicSessionJoinCode
./ng net.accelbyte.sdk.cli.Main session publicSessionJoinCode \
    --namespace "$AB_NAMESPACE" \
    --body '{"code": "OoLKp0t9"}' \
    > test.out 2>&1
eval_tap $? 57 'PublicSessionJoinCode' test.out

#- 58 GetGameSessionByPodName
./ng net.accelbyte.sdk.cli.Main session getGameSessionByPodName \
    --namespace "$AB_NAMESPACE" \
    --podName 'iQliTRMk' \
    > test.out 2>&1
eval_tap $? 58 'GetGameSessionByPodName' test.out

#- 59 GetGameSession
./ng net.accelbyte.sdk.cli.Main session getGameSession \
    --namespace "$AB_NAMESPACE" \
    --sessionId '5tEi1YTp' \
    > test.out 2>&1
eval_tap $? 59 'GetGameSession' test.out

#- 60 UpdateGameSession
./ng net.accelbyte.sdk.cli.Main session updateGameSession \
    --namespace "$AB_NAMESPACE" \
    --sessionId '2P9V6aLG' \
    --body '{"attributes": {"YEU3CjU8": {}, "meiO7Vq3": {}, "XKkKtHw0": {}}, "backfillTicketID": "8sRDt7jq", "clientVersion": "wC8Nmcer", "deployment": "xLcxu6zX", "fallbackClaimKeys": ["KgKgeEBr", "Z1BmrTKB", "ONX1CazF"], "inactiveTimeout": 30, "inviteTimeout": 77, "joinability": "vWBrLpKG", "matchPool": "pR4Ri6bf", "maxPlayers": 74, "minPlayers": 89, "preferredClaimKeys": ["kaOufnJ9", "mlUBubZQ", "fKXrbtMH"], "requestedRegions": ["XEetCFD2", "i5cyYIWa", "Gyq7B2m1"], "teams": [{"parties": [{"partyID": "pkmVhYnL", "userIDs": ["BNg6z3g1", "hvvvzAyw", "UQqw2GjA"]}, {"partyID": "CopS34lc", "userIDs": ["Lap4PdoX", "cmuZUp3j", "njHytDNY"]}, {"partyID": "GLj4qK5O", "userIDs": ["YGc7cRsp", "XNZnYxQo", "8FlbBJVk"]}], "userIDs": ["fXMYFEC7", "LWXdWgZO", "ANpJtCYs"]}, {"parties": [{"partyID": "EbE67VTq", "userIDs": ["gUB3d5oF", "EwnGvhKJ", "OHQQdvxy"]}, {"partyID": "1znM452w", "userIDs": ["8MRS2GZW", "wIlClbSH", "a46tSi3W"]}, {"partyID": "mU5YX8f7", "userIDs": ["XJBFDZEx", "uTSkDK5R", "GOBUmDWF"]}], "userIDs": ["iurx3a28", "iCLrSDIc", "omirnSFr"]}, {"parties": [{"partyID": "0lajhIb7", "userIDs": ["lKWLJllo", "3pdKdMcm", "2XJHcrbS"]}, {"partyID": "9cRbHiwY", "userIDs": ["wdlzfN5Q", "6UXRwVRQ", "HYhMZdOT"]}, {"partyID": "7h2BaG1Y", "userIDs": ["YtEqkItU", "kiWZUud8", "Inq1g1SV"]}], "userIDs": ["5j5km0rt", "gMrwxVsG", "BuBernyQ"]}], "ticketIDs": ["utzk2g47", "b2MwlTrN", "cRG3CyQs"], "tieTeamsSessionLifetime": false, "type": "zLcIsYAD", "version": 76}' \
    > test.out 2>&1
eval_tap $? 60 'UpdateGameSession' test.out

#- 61 DeleteGameSession
./ng net.accelbyte.sdk.cli.Main session deleteGameSession \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'ioHrBGBG' \
    > test.out 2>&1
eval_tap $? 61 'DeleteGameSession' test.out

#- 62 PatchUpdateGameSession
./ng net.accelbyte.sdk.cli.Main session patchUpdateGameSession \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'Z78FAKqI' \
    --body '{"attributes": {"bx0VW6HA": {}, "d1teaOSi": {}, "WsAq3jKU": {}}, "backfillTicketID": "WsrB5PNz", "clientVersion": "4OnqpXUk", "deployment": "cVZ3IPaO", "fallbackClaimKeys": ["m1BWWhbL", "Ftpa41rx", "RdXAjUBa"], "inactiveTimeout": 12, "inviteTimeout": 34, "joinability": "kwEOw3VV", "matchPool": "rgInB0ZH", "maxPlayers": 53, "minPlayers": 31, "preferredClaimKeys": ["FEiUuCXw", "19ymyeXg", "K9jpaFrm"], "requestedRegions": ["8NK9GMt6", "lU5p3G8c", "0kh5mZNr"], "teams": [{"parties": [{"partyID": "eFEF5b7S", "userIDs": ["bLHK19jz", "zBOSaSCH", "dCUrD1kH"]}, {"partyID": "bDiXz7gj", "userIDs": ["yvW1Wkjf", "IL8G5wC7", "E1BixTa5"]}, {"partyID": "yFUkMDk0", "userIDs": ["cFO3EQ1u", "3UAxQ05G", "xbY7Bbkq"]}], "userIDs": ["ztVVXEHl", "PVN5xEcA", "gMRPBC45"]}, {"parties": [{"partyID": "7STePQ7C", "userIDs": ["uNlcM7uR", "MZAAVf1A", "s2XK095p"]}, {"partyID": "Sl8oCdL2", "userIDs": ["gdvQbEZc", "RnUwLARb", "yusSlLxh"]}, {"partyID": "DhIo2zlh", "userIDs": ["QOKscKS0", "dJcsYC2p", "ivWTRoFi"]}], "userIDs": ["WpKwsBIz", "ABCCTK3f", "ompeBk7X"]}, {"parties": [{"partyID": "QvpT4di4", "userIDs": ["edmU6mJv", "jVn7iumZ", "CzOcFnCD"]}, {"partyID": "966ezNml", "userIDs": ["l4uT0u7p", "2e1r323U", "h6XvQJ52"]}, {"partyID": "UADs4VNg", "userIDs": ["XQlQDKjr", "1sK3QvtU", "NNpm6NSe"]}], "userIDs": ["uycKJP4x", "QwbavqWS", "yJF9v41Z"]}], "ticketIDs": ["8tAoPpq1", "3imUrrcE", "4wRRmy7y"], "tieTeamsSessionLifetime": false, "type": "t7XN1Vgp", "version": 16}' \
    > test.out 2>&1
eval_tap $? 62 'PatchUpdateGameSession' test.out

#- 63 UpdateGameSessionBackfillTicketID
./ng net.accelbyte.sdk.cli.Main session updateGameSessionBackfillTicketID \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'l7ZCm0ED' \
    --body '{"backfillTicketID": "JnuiLSv9"}' \
    > test.out 2>&1
eval_tap $? 63 'UpdateGameSessionBackfillTicketID' test.out

#- 64 GameSessionGenerateCode
./ng net.accelbyte.sdk.cli.Main session gameSessionGenerateCode \
    --namespace "$AB_NAMESPACE" \
    --sessionId '5Fa6pfHs' \
    > test.out 2>&1
eval_tap $? 64 'GameSessionGenerateCode' test.out

#- 65 PublicRevokeGameSessionCode
./ng net.accelbyte.sdk.cli.Main session publicRevokeGameSessionCode \
    --namespace "$AB_NAMESPACE" \
    --sessionId '9Pkuejj4' \
    > test.out 2>&1
eval_tap $? 65 'PublicRevokeGameSessionCode' test.out

#- 66 PublicGameSessionInvite
./ng net.accelbyte.sdk.cli.Main session publicGameSessionInvite \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'pFCxXMr2' \
    --body '{"platformID": "IPIrKzKW", "userID": "ynCTK5vf"}' \
    > test.out 2>&1
eval_tap $? 66 'PublicGameSessionInvite' test.out

#- 67 JoinGameSession
./ng net.accelbyte.sdk.cli.Main session joinGameSession \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'YIlywptu' \
    > test.out 2>&1
eval_tap $? 67 'JoinGameSession' test.out

#- 68 PublicPromoteGameSessionLeader
./ng net.accelbyte.sdk.cli.Main session publicPromoteGameSessionLeader \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'CXlFnImP' \
    --body '{"leaderID": "koh1JHUd"}' \
    > test.out 2>&1
eval_tap $? 68 'PublicPromoteGameSessionLeader' test.out

#- 69 LeaveGameSession
./ng net.accelbyte.sdk.cli.Main session leaveGameSession \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'UA9rqIhq' \
    > test.out 2>&1
eval_tap $? 69 'LeaveGameSession' test.out

#- 70 PublicKickGameSessionMember
./ng net.accelbyte.sdk.cli.Main session publicKickGameSessionMember \
    --memberId 'CGAuue4z' \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'dkJFK2oM' \
    > test.out 2>&1
eval_tap $? 70 'PublicKickGameSessionMember' test.out

#- 71 PublicGameSessionReject
./ng net.accelbyte.sdk.cli.Main session publicGameSessionReject \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'AtHfCBrN' \
    > test.out 2>&1
eval_tap $? 71 'PublicGameSessionReject' test.out

#- 72 GetSessionServerSecret
./ng net.accelbyte.sdk.cli.Main session getSessionServerSecret \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'Efn9y4oP' \
    > test.out 2>&1
eval_tap $? 72 'GetSessionServerSecret' test.out

#- 73 AppendTeamGameSession
./ng net.accelbyte.sdk.cli.Main session appendTeamGameSession \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'AORBUbMO' \
    --body '{"additionalMembers": [{"partyID": "61420DtZ", "userIDs": ["IombmdYV", "vNllvFJE", "pF1sAvMB"]}, {"partyID": "l6cHFNEF", "userIDs": ["a9KZwrRn", "RLdEyF4B", "5gsJF6sK"]}, {"partyID": "XvMGHx8T", "userIDs": ["S6u64blR", "z5UnoEbp", "eFuQR4JI"]}], "proposedTeams": [{"parties": [{"partyID": "057lXTP7", "userIDs": ["QTFooBlF", "zSa6XJG2", "lxGjtnlO"]}, {"partyID": "JfgFHXMQ", "userIDs": ["9epcaNo2", "9J5YwRMg", "NRPYw4bz"]}, {"partyID": "yvCaB16Y", "userIDs": ["mHz2XKv6", "aYJWPc3q", "1TApoE6s"]}], "userIDs": ["6ktRbyL8", "I1YsWNmz", "BmbLUvyy"]}, {"parties": [{"partyID": "XF8sA9xa", "userIDs": ["cS8pxE8j", "sWEnqWm4", "uREGb4sm"]}, {"partyID": "G6yLs8td", "userIDs": ["yD6A8dFt", "Ixe6Irnv", "1c9OF7q9"]}, {"partyID": "d27UQY9V", "userIDs": ["6yP4eT4b", "tjMRIqow", "VZMGePey"]}], "userIDs": ["4EJcbYLX", "sU0mIbW5", "dcxCwmW7"]}, {"parties": [{"partyID": "egbZtj6C", "userIDs": ["2HNGhOpL", "Pav3TaWw", "pxyxmVvs"]}, {"partyID": "DfxuOEwh", "userIDs": ["2iqkrfkl", "n0Bp34Ij", "zHfpzvVS"]}, {"partyID": "jzRu53hh", "userIDs": ["hrjpxVh4", "ylWHfhDq", "yAs6voXY"]}], "userIDs": ["p4Pp1Ugs", "T8kMQPdy", "vvG0kpV3"]}], "version": 54}' \
    > test.out 2>&1
eval_tap $? 73 'AppendTeamGameSession' test.out

#- 74 PublicGameSessionCancel
./ng net.accelbyte.sdk.cli.Main session publicGameSessionCancel \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'AcgRwS9B' \
    --userId '4XCnKS2Q' \
    > test.out 2>&1
eval_tap $? 74 'PublicGameSessionCancel' test.out

#- 75 PublicPartyJoinCode
./ng net.accelbyte.sdk.cli.Main session publicPartyJoinCode \
    --namespace "$AB_NAMESPACE" \
    --body '{"code": "9yBC6zVN"}' \
    > test.out 2>&1
eval_tap $? 75 'PublicPartyJoinCode' test.out

#- 76 PublicGetParty
./ng net.accelbyte.sdk.cli.Main session publicGetParty \
    --namespace "$AB_NAMESPACE" \
    --partyId '87XgK7QP' \
    > test.out 2>&1
eval_tap $? 76 'PublicGetParty' test.out

#- 77 PublicUpdateParty
./ng net.accelbyte.sdk.cli.Main session publicUpdateParty \
    --namespace "$AB_NAMESPACE" \
    --partyId 'WcINshgR' \
    --body '{"attributes": {"LvYcI1kE": {}, "RIwgN5Js": {}, "gm4cxsJ2": {}}, "inactiveTimeout": 95, "inviteTimeout": 79, "joinability": "bnY1tWM0", "maxPlayers": 26, "minPlayers": 66, "type": "cjBgHVc1", "version": 56}' \
    > test.out 2>&1
eval_tap $? 77 'PublicUpdateParty' test.out

#- 78 PublicPatchUpdateParty
./ng net.accelbyte.sdk.cli.Main session publicPatchUpdateParty \
    --namespace "$AB_NAMESPACE" \
    --partyId 'mH4Ap5oI' \
    --body '{"attributes": {"cECDlVDM": {}, "Uqfa7GNc": {}, "Ny3LvS5e": {}}, "inactiveTimeout": 12, "inviteTimeout": 56, "joinability": "RRnyD57j", "maxPlayers": 27, "minPlayers": 28, "type": "rbWGwyx3", "version": 81}' \
    > test.out 2>&1
eval_tap $? 78 'PublicPatchUpdateParty' test.out

#- 79 PublicGeneratePartyCode
./ng net.accelbyte.sdk.cli.Main session publicGeneratePartyCode \
    --namespace "$AB_NAMESPACE" \
    --partyId 'U2iTk87f' \
    > test.out 2>&1
eval_tap $? 79 'PublicGeneratePartyCode' test.out

#- 80 PublicRevokePartyCode
./ng net.accelbyte.sdk.cli.Main session publicRevokePartyCode \
    --namespace "$AB_NAMESPACE" \
    --partyId 'ZkyoqVAR' \
    > test.out 2>&1
eval_tap $? 80 'PublicRevokePartyCode' test.out

#- 81 PublicPartyInvite
./ng net.accelbyte.sdk.cli.Main session publicPartyInvite \
    --namespace "$AB_NAMESPACE" \
    --partyId 'PGkDvBPP' \
    --body '{"platformID": "jQDqCZgJ", "userID": "6D6HYv0W"}' \
    > test.out 2>&1
eval_tap $? 81 'PublicPartyInvite' test.out

#- 82 PublicPromotePartyLeader
./ng net.accelbyte.sdk.cli.Main session publicPromotePartyLeader \
    --namespace "$AB_NAMESPACE" \
    --partyId 'dwyn07Wy' \
    --body '{"leaderID": "JwQ3bNNV"}' \
    > test.out 2>&1
eval_tap $? 82 'PublicPromotePartyLeader' test.out

#- 83 PublicPartyJoin
./ng net.accelbyte.sdk.cli.Main session publicPartyJoin \
    --namespace "$AB_NAMESPACE" \
    --partyId '6AvUlSVA' \
    > test.out 2>&1
eval_tap $? 83 'PublicPartyJoin' test.out

#- 84 PublicPartyLeave
./ng net.accelbyte.sdk.cli.Main session publicPartyLeave \
    --namespace "$AB_NAMESPACE" \
    --partyId 'sEttLUfW' \
    > test.out 2>&1
eval_tap $? 84 'PublicPartyLeave' test.out

#- 85 PublicPartyReject
./ng net.accelbyte.sdk.cli.Main session publicPartyReject \
    --namespace "$AB_NAMESPACE" \
    --partyId 'WQaP6WJz' \
    > test.out 2>&1
eval_tap $? 85 'PublicPartyReject' test.out

#- 86 PublicPartyCancel
./ng net.accelbyte.sdk.cli.Main session publicPartyCancel \
    --namespace "$AB_NAMESPACE" \
    --partyId 'nAhvvveT' \
    --userId 'UZFVSnxg' \
    > test.out 2>&1
eval_tap $? 86 'PublicPartyCancel' test.out

#- 87 PublicPartyKick
./ng net.accelbyte.sdk.cli.Main session publicPartyKick \
    --namespace "$AB_NAMESPACE" \
    --partyId 'HRmw8mpC' \
    --userId '3ccPbU30' \
    > test.out 2>&1
eval_tap $? 87 'PublicPartyKick' test.out

#- 88 PublicCreateParty
./ng net.accelbyte.sdk.cli.Main session publicCreateParty \
    --namespace "$AB_NAMESPACE" \
    --body '{"attributes": {"IWncddge": {}, "ZOBx71jh": {}, "ksas56px": {}}, "configurationName": "0i4c35Bb", "inactiveTimeout": 63, "inviteTimeout": 34, "joinability": "AAd72Ens", "maxPlayers": 21, "members": [{"ID": "N6MQjNLp", "PlatformID": "lYC1LcC1", "PlatformUserID": "1fJ0kbuQ"}, {"ID": "1t9UmfNr", "PlatformID": "TU5NF0ej", "PlatformUserID": "E4wmdToa"}, {"ID": "7JUXq6MZ", "PlatformID": "VWmin4iJ", "PlatformUserID": "HQIyxcCq"}], "minPlayers": 0, "textChat": true, "type": "4EJrhB9k"}' \
    > test.out 2>&1
eval_tap $? 88 'PublicCreateParty' test.out

#- 89 PublicGetRecentPlayer
./ng net.accelbyte.sdk.cli.Main session publicGetRecentPlayer \
    --namespace "$AB_NAMESPACE" \
    --limit '28' \
    > test.out 2>&1
eval_tap $? 89 'PublicGetRecentPlayer' test.out

#- 90 PublicGetRecentTeamPlayer
./ng net.accelbyte.sdk.cli.Main session publicGetRecentTeamPlayer \
    --namespace "$AB_NAMESPACE" \
    --limit '58' \
    > test.out 2>&1
eval_tap $? 90 'PublicGetRecentTeamPlayer' test.out

#- 91 PublicUpdateInsertSessionStorageLeader
./ng net.accelbyte.sdk.cli.Main session publicUpdateInsertSessionStorageLeader \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'oIIAUpB6' \
    --body '{"1D5obGIo": {}, "A4Fz4kp1": {}, "nbKSiwWL": {}}' \
    > test.out 2>&1
eval_tap $? 91 'PublicUpdateInsertSessionStorageLeader' test.out

#- 92 PublicUpdateInsertSessionStorage
./ng net.accelbyte.sdk.cli.Main session publicUpdateInsertSessionStorage \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'CVnROqFC' \
    --userId 'N9b9bcDi' \
    --body '{"mhZDtZkP": {}, "0XTyriA3": {}, "0JohoLaL": {}}' \
    > test.out 2>&1
eval_tap $? 92 'PublicUpdateInsertSessionStorage' test.out

#- 93 PublicGetBulkPlayerCurrentPlatform
./ng net.accelbyte.sdk.cli.Main session publicGetBulkPlayerCurrentPlatform \
    --namespace "$AB_NAMESPACE" \
    --body '{"userIDs": ["B5eQqMAQ", "F3ujngdA", "Ye7zFVSe"]}' \
    > test.out 2>&1
eval_tap $? 93 'PublicGetBulkPlayerCurrentPlatform' test.out

#- 94 PublicGetPlayerAttributes
./ng net.accelbyte.sdk.cli.Main session publicGetPlayerAttributes \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 94 'PublicGetPlayerAttributes' test.out

#- 95 PublicStorePlayerAttributes
./ng net.accelbyte.sdk.cli.Main session publicStorePlayerAttributes \
    --namespace "$AB_NAMESPACE" \
    --body '{"crossplayEnabled": false, "currentPlatform": "fAt1CBOF", "data": {"EjboMLc4": {}, "XiOHrwD5": {}, "RDnE51Ft": {}}, "platforms": [{"name": "toRz9I8w", "userID": "NSSBiksw"}, {"name": "mkufdelw", "userID": "vq4CdzBn"}, {"name": "jVeozlt5", "userID": "zag9rCqs"}], "roles": ["cTFDfmdQ", "OMdW2g8Z", "6qwHVy1r"], "simultaneousPlatform": "PgXqRQAG"}' \
    > test.out 2>&1
eval_tap $? 95 'PublicStorePlayerAttributes' test.out

#- 96 PublicDeletePlayerAttributes
./ng net.accelbyte.sdk.cli.Main session publicDeletePlayerAttributes \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 96 'PublicDeletePlayerAttributes' test.out

#- 97 PublicQueryMyGameSessions
./ng net.accelbyte.sdk.cli.Main session publicQueryMyGameSessions \
    --namespace "$AB_NAMESPACE" \
    --order 'xjHT1nB7' \
    --orderBy '8YrqKsi8' \
    --status 'n6kbmBPg' \
    > test.out 2>&1
eval_tap $? 97 'PublicQueryMyGameSessions' test.out

#- 98 PublicQueryMyParties
./ng net.accelbyte.sdk.cli.Main session publicQueryMyParties \
    --namespace "$AB_NAMESPACE" \
    --order 'PuOvIzfa' \
    --orderBy 'ONP4qUB7' \
    --status 'DkCEi3hL' \
    > test.out 2>&1
eval_tap $? 98 'PublicQueryMyParties' test.out


rm -f "tmp.dat"

exit $EXIT_CODE