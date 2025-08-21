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
    --body '{"logLevel": "debug"}' \
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
    --body '{"metricExcludedNamespaces": ["oSOS66OK", "q1ATePv4", "93TS4Fba"], "regionRetryMapping": {"7CjtjKw5": ["ClygL57U", "SEix0Svm", "1cxmALv5"], "nrCdGTiJ": ["jojkHfGm", "8h3lqKsq", "2vnYTDjz"], "PmUwraUX": ["XHtPwFYH", "w7lZ6VPs", "l4RepcQY"]}, "regionURLMapping": ["kQtbwaDV", "YmbOT1Xh", "NKWagW21"], "testGameMode": "VoA8L9tj", "testRegionURLMapping": ["MTSk96gm", "hU79PlAH", "GGc98sy3"], "testTargetUserIDs": ["HtwYYwyE", "d73hORIq", "Dh1o3OQE"]}' \
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
    --body '{"durationDays": 67}' \
    > test.out 2>&1
eval_tap $? 12 'AdminUpdateConfigurationAlertV1' test.out

#- 13 AdminCreateConfigurationAlertV1
./ng net.accelbyte.sdk.cli.Main session adminCreateConfigurationAlertV1 \
    --namespace "$AB_NAMESPACE" \
    --body '{"durationDays": 92}' \
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
    --body '{"NativeSessionSetting": {"PSNDisableSystemUIMenu": ["UPDATE_JOINABLE_USER_TYPE", "UPDATE_INVITABLE_USER_TYPE", "KICK"], "PSNServiceLabel": 29, "PSNSupportedPlatforms": ["gUcxJsBX", "4HEkMe1P", "0vEhYVtm"], "SessionTitle": "dqAEbD92", "ShouldSync": true, "XboxAllowCrossPlatform": true, "XboxSandboxID": "y1tCyzNN", "XboxServiceConfigID": "WDJ9dInM", "XboxSessionTemplateName": "5kDkqwg6", "XboxTitleID": "Vu0u42Kr", "localizedSessionName": {"Z5goEJnR": {}, "ZIub6dF4": {}, "7VTDkthh": {}}}, "PSNBaseUrl": "4GxWqZEA", "amsClaimTimeoutMinutes": 92, "appName": "0B6fH7qf", "asyncProcessDSRequest": {"async": false, "timeout": 37}, "attributes": {"l9aaZgNM": {}, "LHAtdJb7": {}, "FVdv4PSw": {}}, "autoJoin": false, "autoLeaveSession": false, "clientVersion": "cb4xdOJR", "customURLGRPC": "5VNXi8eP", "deployment": "gD9OcIJB", "disableCodeGeneration": true, "disableResendInvite": true, "dsManualSetReady": false, "dsSource": "ZOCnoK0F", "enableSecret": true, "fallbackClaimKeys": ["jdNUkaCx", "XNvFKKtT", "M6E9eElk"], "grpcSessionConfig": {"appName": "TRBfNPHl", "customURL": "o3z5cNjH", "functionFlag": 52}, "immutableStorage": false, "inactiveTimeout": 50, "inviteTimeout": 62, "joinability": "FRIENDS_OF_MEMBERS", "leaderElectionGracePeriod": 35, "manualRejoin": false, "maxActiveSessions": 39, "maxPlayers": 62, "minPlayers": 41, "name": "s0oF92Cg", "persistent": false, "preferredClaimKeys": ["mbDMH7KE", "2NKERYuk", "y1HFpMUi"], "requestedRegions": ["H1M4mzCj", "Z8VTydUh", "oiDwVS00"], "textChat": true, "textChatMode": "NONE", "tieTeamsSessionLifetime": true, "ttlHours": 13, "type": "NONE"}' \
    > test.out 2>&1
eval_tap $? 16 'AdminCreateConfigurationTemplateV1' test.out

#- 17 AdminGetAllConfigurationTemplatesV1
./ng net.accelbyte.sdk.cli.Main session adminGetAllConfigurationTemplatesV1 \
    --namespace "$AB_NAMESPACE" \
    --limit '66' \
    --name 'ffgG1AA2' \
    --offset '34' \
    --order 'Tp4wXaRr' \
    --orderBy '30mdytoj' \
    > test.out 2>&1
eval_tap $? 17 'AdminGetAllConfigurationTemplatesV1' test.out

#- 18 AdminGetConfigurationTemplateV1
./ng net.accelbyte.sdk.cli.Main session adminGetConfigurationTemplateV1 \
    --name 'rFLdiE1N' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 18 'AdminGetConfigurationTemplateV1' test.out

#- 19 AdminUpdateConfigurationTemplateV1
./ng net.accelbyte.sdk.cli.Main session adminUpdateConfigurationTemplateV1 \
    --name 'KIVLN0jV' \
    --namespace "$AB_NAMESPACE" \
    --body '{"NativeSessionSetting": {"PSNDisableSystemUIMenu": ["PROMOTE_TO_LEADER", "UPDATE_INVITABLE_USER_TYPE", "UPDATE_INVITABLE_USER_TYPE"], "PSNServiceLabel": 46, "PSNSupportedPlatforms": ["zHAv7ztU", "szOSfSzf", "XJ1NM8dU"], "SessionTitle": "vNeCf2pe", "ShouldSync": false, "XboxAllowCrossPlatform": true, "XboxSandboxID": "qQt7BGrL", "XboxServiceConfigID": "O8EAZAWp", "XboxSessionTemplateName": "mfh5DXy7", "XboxTitleID": "w6hhme0e", "localizedSessionName": {"ZbajMBjJ": {}, "ESKdwUeK": {}, "b2Wy0zVG": {}}}, "PSNBaseUrl": "UO8O0xNw", "amsClaimTimeoutMinutes": 35, "appName": "pYcnHMHz", "asyncProcessDSRequest": {"async": false, "timeout": 94}, "attributes": {"7rm0zQ9B": {}, "TFA5kmjX": {}, "OoADsEdy": {}}, "autoJoin": false, "autoLeaveSession": true, "clientVersion": "yEA66aot", "customURLGRPC": "0rTQDnBF", "deployment": "dnBoXiQP", "disableCodeGeneration": true, "disableResendInvite": true, "dsManualSetReady": true, "dsSource": "Gr61XBVA", "enableSecret": true, "fallbackClaimKeys": ["loenjbxO", "IZzZ6XmN", "CFxFBXjD"], "grpcSessionConfig": {"appName": "infl3Pcl", "customURL": "AdhtZgRq", "functionFlag": 88}, "immutableStorage": true, "inactiveTimeout": 4, "inviteTimeout": 57, "joinability": "OPEN", "leaderElectionGracePeriod": 72, "manualRejoin": true, "maxActiveSessions": 3, "maxPlayers": 3, "minPlayers": 89, "name": "q5juLioE", "persistent": true, "preferredClaimKeys": ["qmGFl0gB", "RtmqQhM7", "UcFrQ6t0"], "requestedRegions": ["36GcRWnU", "jvHUJUL6", "RF3GUZWt"], "textChat": true, "textChatMode": "GAME", "tieTeamsSessionLifetime": false, "ttlHours": 17, "type": "NONE"}' \
    > test.out 2>&1
eval_tap $? 19 'AdminUpdateConfigurationTemplateV1' test.out

#- 20 AdminDeleteConfigurationTemplateV1
./ng net.accelbyte.sdk.cli.Main session adminDeleteConfigurationTemplateV1 \
    --name '4KFdjEf3' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 20 'AdminDeleteConfigurationTemplateV1' test.out

#- 21 AdminGetMemberActiveSession
./ng net.accelbyte.sdk.cli.Main session adminGetMemberActiveSession \
    --name '9JIsxKMI' \
    --namespace "$AB_NAMESPACE" \
    --userId 'SIGd1Nfy' \
    > test.out 2>&1
eval_tap $? 21 'AdminGetMemberActiveSession' test.out

#- 22 AdminReconcileMaxActiveSession
./ng net.accelbyte.sdk.cli.Main session adminReconcileMaxActiveSession \
    --name 'gIXdGQvt' \
    --namespace "$AB_NAMESPACE" \
    --body '{"userID": "hSZxaslh"}' \
    > test.out 2>&1
eval_tap $? 22 'AdminReconcileMaxActiveSession' test.out

#- 23 AdminGetDSMCConfiguration
eval_tap 0 23 'AdminGetDSMCConfiguration # SKIP deprecated' test.out

#- 24 AdminSyncDSMCConfiguration
eval_tap 0 24 'AdminSyncDSMCConfiguration # SKIP deprecated' test.out

#- 25 AdminQueryGameSessions
./ng net.accelbyte.sdk.cli.Main session adminQueryGameSessions \
    --namespace "$AB_NAMESPACE" \
    --configurationName '7IlUzgL0' \
    --dsPodName '3L80EuZy' \
    --fromTime 'd9pyrDC3' \
    --gameMode '2U3faUqA' \
    --isPersistent 'IytNZVjj' \
    --isSoftDeleted 'b7AC8Mee' \
    --joinability 'OPEN' \
    --limit '87' \
    --matchPool 'oJ7qtrs4' \
    --memberID 'lVptr1Xq' \
    --offset '7' \
    --order 'cStehusr' \
    --orderBy 'PbLkxIoQ' \
    --sessionID 'DPEgEb64' \
    --status 'AVAILABLE' \
    --statusV2 'UNKNOWN' \
    --toTime 'ki9rgrap' \
    > test.out 2>&1
eval_tap $? 25 'AdminQueryGameSessions' test.out

#- 26 AdminQueryGameSessionsByAttributes
./ng net.accelbyte.sdk.cli.Main session adminQueryGameSessionsByAttributes \
    --namespace "$AB_NAMESPACE" \
    --body '{"fyNjWZJQ": {}, "vXi2QHqX": {}, "qC5pMjM4": {}}' \
    > test.out 2>&1
eval_tap $? 26 'AdminQueryGameSessionsByAttributes' test.out

#- 27 AdminDeleteBulkGameSessions
./ng net.accelbyte.sdk.cli.Main session adminDeleteBulkGameSessions \
    --namespace "$AB_NAMESPACE" \
    --body '{"ids": ["2qkEgPtq", "2TMU55Iq", "iROZYxnp"]}' \
    > test.out 2>&1
eval_tap $? 27 'AdminDeleteBulkGameSessions' test.out

#- 28 AdminSetDSReady
./ng net.accelbyte.sdk.cli.Main session adminSetDSReady \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'fAE3Hpck' \
    --body '{"ready": true}' \
    > test.out 2>&1
eval_tap $? 28 'AdminSetDSReady' test.out

#- 29 AdminUpdateDSInformation
./ng net.accelbyte.sdk.cli.Main session adminUpdateDSInformation \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'My5QS5Yv' \
    --body '{"createdRegion": "JHtRMjhF", "deployment": "CCiZ1qe8", "description": "PCM47iRX", "ip": "livPBQZV", "port": 93, "region": "3AzRUekS", "serverId": "8NnXmfkg", "source": "xqtair6s", "status": "KMknwDws"}' \
    > test.out 2>&1
eval_tap $? 29 'AdminUpdateDSInformation' test.out

#- 30 AdminKickGameSessionMember
./ng net.accelbyte.sdk.cli.Main session adminKickGameSessionMember \
    --memberId 'q9NyWRKW' \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'JpoWgxm0' \
    > test.out 2>&1
eval_tap $? 30 'AdminKickGameSessionMember' test.out

#- 31 AdminUpdateGameSessionMember
./ng net.accelbyte.sdk.cli.Main session adminUpdateGameSessionMember \
    --memberId 'pM0r02T7' \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'vySPeopd' \
    --statusType 'pZDDsMBi' \
    > test.out 2>&1
eval_tap $? 31 'AdminUpdateGameSessionMember' test.out

#- 32 AdminGetListNativeSession
./ng net.accelbyte.sdk.cli.Main session adminGetListNativeSession \
    --namespace "$AB_NAMESPACE" \
    --limit '12' \
    --offset '78' \
    --order '2GJ1EBWv' \
    > test.out 2>&1
eval_tap $? 32 'AdminGetListNativeSession' test.out

#- 33 AdminQueryParties
./ng net.accelbyte.sdk.cli.Main session adminQueryParties \
    --namespace "$AB_NAMESPACE" \
    --configurationName 'GvPSZWX3' \
    --fromTime 'AWNSvING' \
    --isSoftDeleted 'CXziHZCY' \
    --joinability 'FRIENDS_OF_FRIENDS' \
    --key 'layEkx2x' \
    --leaderID '9uEhQkTy' \
    --limit '18' \
    --memberID 'RP4HPdEo' \
    --memberStatus 'LEFT' \
    --offset '69' \
    --order 'P8wKRgJH' \
    --orderBy 'paqR55rP' \
    --partyID 'uKYXb7zm' \
    --toTime '6OKxXn0Y' \
    --value 'm0v0fiJ0' \
    > test.out 2>&1
eval_tap $? 33 'AdminQueryParties' test.out

#- 34 AdminDeleteBulkParties
./ng net.accelbyte.sdk.cli.Main session adminDeleteBulkParties \
    --namespace "$AB_NAMESPACE" \
    --body '{"ids": ["MnH0ZpXd", "NZgZrSKo", "8OXNobIg"]}' \
    > test.out 2>&1
eval_tap $? 34 'AdminDeleteBulkParties' test.out

#- 35 AdminReadPartySessionStorage
./ng net.accelbyte.sdk.cli.Main session adminReadPartySessionStorage \
    --namespace "$AB_NAMESPACE" \
    --partyId 'kaBLGD3Q' \
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
    --body '{"psn": {"clientId": "c479xkLq", "clientSecret": "qkc6w9m0", "scope": "fMI7didJ"}}' \
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
    --limit '64' \
    --userId 'O7fLSt3D' \
    > test.out 2>&1
eval_tap $? 41 'AdminGetRecentPlayer' test.out

#- 42 AdminGetRecentTeamPlayer
./ng net.accelbyte.sdk.cli.Main session adminGetRecentTeamPlayer \
    --namespace "$AB_NAMESPACE" \
    --limit '44' \
    --userId 'dqeR3Zcj' \
    > test.out 2>&1
eval_tap $? 42 'AdminGetRecentTeamPlayer' test.out

#- 43 AdminReadSessionStorage
./ng net.accelbyte.sdk.cli.Main session adminReadSessionStorage \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'wibxHzF4' \
    > test.out 2>&1
eval_tap $? 43 'AdminReadSessionStorage' test.out

#- 44 AdminDeleteUserSessionStorage
./ng net.accelbyte.sdk.cli.Main session adminDeleteUserSessionStorage \
    --namespace "$AB_NAMESPACE" \
    --sessionId '8Z4IjyFj' \
    > test.out 2>&1
eval_tap $? 44 'AdminDeleteUserSessionStorage' test.out

#- 45 AdminReadUserSessionStorage
./ng net.accelbyte.sdk.cli.Main session adminReadUserSessionStorage \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'dQPDCmyH' \
    --userId 'QmzJaNOh' \
    > test.out 2>&1
eval_tap $? 45 'AdminReadUserSessionStorage' test.out

#- 46 AdminQueryPlayerAttributes
./ng net.accelbyte.sdk.cli.Main session adminQueryPlayerAttributes \
    --namespace "$AB_NAMESPACE" \
    --users 'wNG7CtfJ' \
    > test.out 2>&1
eval_tap $? 46 'AdminQueryPlayerAttributes' test.out

#- 47 AdminGetPlayerAttributes
./ng net.accelbyte.sdk.cli.Main session adminGetPlayerAttributes \
    --namespace "$AB_NAMESPACE" \
    --userId 'ZZpqKrlH' \
    > test.out 2>&1
eval_tap $? 47 'AdminGetPlayerAttributes' test.out

#- 48 AdminSyncNativeSession
./ng net.accelbyte.sdk.cli.Main session adminSyncNativeSession \
    --namespace "$AB_NAMESPACE" \
    --userId 'Gyb5du1V' \
    > test.out 2>&1
eval_tap $? 48 'AdminSyncNativeSession' test.out

#- 49 CreateGameSession
./ng net.accelbyte.sdk.cli.Main session createGameSession \
    --namespace "$AB_NAMESPACE" \
    --resolveMaxActiveSession  \
    --body '{"appName": "8ExqfYLA", "attributes": {"MYb3o20V": {}, "NlKiowan": {}, "e1zBCjCT": {}}, "autoJoin": true, "backfillTicketID": "lnog3MOx", "clientVersion": "JcHsuB8y", "configurationName": "cxudISvM", "customURLGRPC": "d6OJtcdt", "deployment": "sv0KAtAN", "dsSource": "jIscRVPe", "fallbackClaimKeys": ["JTGEj5j5", "9X6s3KUM", "gTliKIOy"], "inactiveTimeout": 0, "inviteTimeout": 60, "joinability": "FRIENDS_OF_FRIENDS", "matchPool": "BFCGvtpL", "maxPlayers": 84, "minPlayers": 14, "preferredClaimKeys": ["qFNHio8d", "1xIhplcV", "6QYgAg0C"], "requestedRegions": ["LypHrVtK", "4aLP6MVh", "FeGVm6qZ"], "serverName": "VQiWV0hd", "storage": {"leader": {"0CAciKKx": {}, "3GeydSGT": {}, "1Yj4PtWL": {}}}, "teams": [{"parties": [{"partyID": "hyq4We4k", "userIDs": ["wGFngQvQ", "fsXdtPKH", "dTqYyhgy"]}, {"partyID": "f0SaoAgE", "userIDs": ["kE28SvvZ", "3glKLKTf", "EVNR1EqY"]}, {"partyID": "ok0o17Jg", "userIDs": ["BNOqswQa", "oHE09PSo", "OHmbmtDD"]}], "teamID": "MVKlMnd1", "userIDs": ["5tUCBaEC", "Y63UHTZN", "mT7O6J3T"]}, {"parties": [{"partyID": "KbzhbX3f", "userIDs": ["lpcbaWKa", "E0atjQ5H", "3DTpGHVg"]}, {"partyID": "NDWCuv7k", "userIDs": ["zPf6MN3w", "AkIxQRrv", "iuk83vrc"]}, {"partyID": "t1nMpJR4", "userIDs": ["BdOXJMc1", "RMWGNOSd", "jfawwerb"]}], "teamID": "C6P3pvev", "userIDs": ["2ANwFJ0h", "sn7d3bg1", "89oWL9ht"]}, {"parties": [{"partyID": "Ecnu3fpR", "userIDs": ["b1nXnmON", "3MLbeFiX", "3fsmNAKs"]}, {"partyID": "0UCqslqX", "userIDs": ["ArTOXCYo", "9U0aJOek", "fFhxWcWO"]}, {"partyID": "5oOhjqu4", "userIDs": ["eQ1RUKnL", "tL61jjdP", "KXGD9zUE"]}], "teamID": "WatR2Lm7", "userIDs": ["4Y5NO8VX", "Pm263jVV", "I0JCp3ZV"]}], "textChat": true, "textChatMode": "NONE", "ticketIDs": ["iuhlXeCD", "fMrEEyms", "Ztnek1E2"], "tieTeamsSessionLifetime": false, "type": "P2P"}' \
    > test.out 2>&1
eval_tap $? 49 'CreateGameSession' test.out

#- 50 PublicQueryGameSessionsByAttributes
./ng net.accelbyte.sdk.cli.Main session publicQueryGameSessionsByAttributes \
    --namespace "$AB_NAMESPACE" \
    --body '{"yggdbW1o": {}, "NloQiA0U": {}, "MEBAsRiI": {}}' \
    > test.out 2>&1
eval_tap $? 50 'PublicQueryGameSessionsByAttributes' test.out

#- 51 PublicSessionJoinCode
./ng net.accelbyte.sdk.cli.Main session publicSessionJoinCode \
    --namespace "$AB_NAMESPACE" \
    --body '{"code": "NYmfvwJW"}' \
    > test.out 2>&1
eval_tap $? 51 'PublicSessionJoinCode' test.out

#- 52 GetGameSessionByPodName
./ng net.accelbyte.sdk.cli.Main session getGameSessionByPodName \
    --namespace "$AB_NAMESPACE" \
    --podName 'mypxtPLU' \
    > test.out 2>&1
eval_tap $? 52 'GetGameSessionByPodName' test.out

#- 53 GetGameSession
./ng net.accelbyte.sdk.cli.Main session getGameSession \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'j6rduS5a' \
    > test.out 2>&1
eval_tap $? 53 'GetGameSession' test.out

#- 54 UpdateGameSession
./ng net.accelbyte.sdk.cli.Main session updateGameSession \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'i6NFtxMR' \
    --body '{"attributes": {"TJdcYpQ7": {}, "fneIhDay": {}, "x37s0TOM": {}}, "backfillTicketID": "IDslAjrx", "clientVersion": "V379NZnj", "deployment": "DURLOxM1", "fallbackClaimKeys": ["bUuv0Akk", "fQpdeBw0", "2fjrsLXy"], "inactiveTimeout": 37, "inviteTimeout": 83, "joinability": "OPEN", "matchPool": "PkOuOXhb", "maxPlayers": 7, "minPlayers": 11, "preferredClaimKeys": ["sK94gGX5", "nxhMKolw", "4GVMy3IT"], "requestedRegions": ["aUFCvBYN", "gD8OD8Ni", "A0O2UlP3"], "teams": [{"parties": [{"partyID": "3xR5Y5dp", "userIDs": ["lJenm02V", "jls3iTu1", "coYndQzK"]}, {"partyID": "aEZ6TgMp", "userIDs": ["Wt8mlcAs", "iDwySu9z", "ryituLn1"]}, {"partyID": "kABTwJtF", "userIDs": ["tN5wWhqZ", "3TqAjWb8", "WqDAobsi"]}], "teamID": "eVSxxzOF", "userIDs": ["2MITIuFw", "28PJKjPp", "3aNhTxVc"]}, {"parties": [{"partyID": "vPllJD4G", "userIDs": ["HZNKRVcp", "72kNO07G", "HcukzuC5"]}, {"partyID": "rb6uGU21", "userIDs": ["hufe2Y0n", "UoT6Vv05", "UBs8jggS"]}, {"partyID": "IcAQ63Vc", "userIDs": ["njobT3bB", "Btdi3qwN", "oRbDkZzl"]}], "teamID": "d6QO2cd7", "userIDs": ["OU2buzAk", "jOIbF9Ha", "sPo2AytI"]}, {"parties": [{"partyID": "OdgHXZjY", "userIDs": ["31z8SGT6", "pj0uVm5z", "CKExfpyq"]}, {"partyID": "YPj3TZ87", "userIDs": ["QgNtEm50", "PH7SG8qf", "mFm12XBh"]}, {"partyID": "DQ4Jquk1", "userIDs": ["K9dcHxwE", "E5LfGbY0", "LyPWlMxQ"]}], "teamID": "8I6FKiMb", "userIDs": ["9ltjRm8v", "J9CrLraG", "aK34GBfw"]}], "ticketIDs": ["FCnABubP", "zV0ocgwH", "yPCVWLRR"], "tieTeamsSessionLifetime": false, "type": "NONE", "version": 87}' \
    > test.out 2>&1
eval_tap $? 54 'UpdateGameSession' test.out

#- 55 DeleteGameSession
./ng net.accelbyte.sdk.cli.Main session deleteGameSession \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'y73IzPkd' \
    > test.out 2>&1
eval_tap $? 55 'DeleteGameSession' test.out

#- 56 PatchUpdateGameSession
./ng net.accelbyte.sdk.cli.Main session patchUpdateGameSession \
    --namespace "$AB_NAMESPACE" \
    --sessionId '46cAgtHX' \
    --body '{"attributes": {"SsKcGKrf": {}, "PJITl3e5": {}, "tPE9H6if": {}}, "backfillTicketID": "CFsYYypq", "clientVersion": "ypHzJNTa", "deployment": "ArQJjkuD", "fallbackClaimKeys": ["S1IJrQ5l", "3sEVZ5ed", "GgDnNSGY"], "inactiveTimeout": 67, "inviteTimeout": 8, "joinability": "CLOSED", "matchPool": "IuiQjxMH", "maxPlayers": 79, "minPlayers": 49, "preferredClaimKeys": ["8CuAGIPh", "0L7ayrE3", "9660Jtry"], "requestedRegions": ["v3pTUx62", "DwFNwj4k", "1tFQIhDB"], "teams": [{"parties": [{"partyID": "5EqgQHAu", "userIDs": ["ghv6a6vZ", "OV7Yo0Rh", "fJf1GFsX"]}, {"partyID": "j7KsawdN", "userIDs": ["8ZHsA9h3", "6KGDyZyD", "C8T15xYl"]}, {"partyID": "5FR1QTF0", "userIDs": ["GYxVnO5Z", "9EvsCUD8", "FFyH7PwA"]}], "teamID": "saoax9g4", "userIDs": ["uW6pv0Zl", "DJuP3uQQ", "YsQFV16G"]}, {"parties": [{"partyID": "LJfRDSpk", "userIDs": ["VwBd3mZx", "JMRpkrHA", "khMPauQ5"]}, {"partyID": "rE2PpyuN", "userIDs": ["IRCtD2JI", "mBq0Yh7T", "JmWaKQ8p"]}, {"partyID": "cvBSeJFc", "userIDs": ["7NXC5g44", "YJrigLwC", "NEzXPrPs"]}], "teamID": "F2pKOLoG", "userIDs": ["cluu46Ev", "lILvwKeH", "YFIANlVn"]}, {"parties": [{"partyID": "SEJPHufk", "userIDs": ["N3g1Df34", "zaGr5my3", "mkP5siuS"]}, {"partyID": "GnJ8WCBq", "userIDs": ["Dfx91dFv", "Lw2Wq4FE", "4S2sKIsm"]}, {"partyID": "cpgsyCVw", "userIDs": ["xRmDePiV", "oHyZjdcq", "JXrxyIus"]}], "teamID": "3tJc2kBE", "userIDs": ["f6fxhqEG", "ShcO4Z3n", "SiLHrhZk"]}], "ticketIDs": ["BfAj8INp", "VhYsXq9L", "sSvNQ3ku"], "tieTeamsSessionLifetime": true, "type": "NONE", "version": 90}' \
    > test.out 2>&1
eval_tap $? 56 'PatchUpdateGameSession' test.out

#- 57 UpdateGameSessionBackfillTicketID
./ng net.accelbyte.sdk.cli.Main session updateGameSessionBackfillTicketID \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'V0ukJPLl' \
    --body '{"backfillTicketID": "Ubbz7G7O"}' \
    > test.out 2>&1
eval_tap $? 57 'UpdateGameSessionBackfillTicketID' test.out

#- 58 GameSessionGenerateCode
./ng net.accelbyte.sdk.cli.Main session gameSessionGenerateCode \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'QozDSWGU' \
    > test.out 2>&1
eval_tap $? 58 'GameSessionGenerateCode' test.out

#- 59 PublicRevokeGameSessionCode
./ng net.accelbyte.sdk.cli.Main session publicRevokeGameSessionCode \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'RXkpLu2M' \
    > test.out 2>&1
eval_tap $? 59 'PublicRevokeGameSessionCode' test.out

#- 60 PublicGameSessionInvite
./ng net.accelbyte.sdk.cli.Main session publicGameSessionInvite \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'wlkiO2gw' \
    --body '{"metadata": {"naTDu96m": "huXYdVbX", "ip2bc8Lu": "Z03u7OhW", "dxQnqqNg": "xqsJuKgm"}, "platformID": "R42EHcDr", "userID": "z4tGUs62"}' \
    > test.out 2>&1
eval_tap $? 60 'PublicGameSessionInvite' test.out

#- 61 JoinGameSession
./ng net.accelbyte.sdk.cli.Main session joinGameSession \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'ossBl8QH' \
    > test.out 2>&1
eval_tap $? 61 'JoinGameSession' test.out

#- 62 PublicPromoteGameSessionLeader
./ng net.accelbyte.sdk.cli.Main session publicPromoteGameSessionLeader \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'EmPZrdaV' \
    --body '{"leaderID": "6Uzj2vkX"}' \
    > test.out 2>&1
eval_tap $? 62 'PublicPromoteGameSessionLeader' test.out

#- 63 LeaveGameSession
./ng net.accelbyte.sdk.cli.Main session leaveGameSession \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'pjLNqnei' \
    > test.out 2>&1
eval_tap $? 63 'LeaveGameSession' test.out

#- 64 PublicKickGameSessionMember
./ng net.accelbyte.sdk.cli.Main session publicKickGameSessionMember \
    --memberId 'qKngUt7z' \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'bLZyFcfw' \
    > test.out 2>&1
eval_tap $? 64 'PublicKickGameSessionMember' test.out

#- 65 PublicGameSessionReject
./ng net.accelbyte.sdk.cli.Main session publicGameSessionReject \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'gH9ei8fB' \
    > test.out 2>&1
eval_tap $? 65 'PublicGameSessionReject' test.out

#- 66 GetSessionServerSecret
./ng net.accelbyte.sdk.cli.Main session getSessionServerSecret \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'hnCetQYb' \
    > test.out 2>&1
eval_tap $? 66 'GetSessionServerSecret' test.out

#- 67 AppendTeamGameSession
eval_tap 0 67 'AppendTeamGameSession # SKIP deprecated' test.out

#- 68 PublicGameSessionCancel
./ng net.accelbyte.sdk.cli.Main session publicGameSessionCancel \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'x44tm7Qn' \
    --userId 'NDw6GJOb' \
    > test.out 2>&1
eval_tap $? 68 'PublicGameSessionCancel' test.out

#- 69 PublicPartyJoinCode
./ng net.accelbyte.sdk.cli.Main session publicPartyJoinCode \
    --namespace "$AB_NAMESPACE" \
    --body '{"code": "gEwXO8lp"}' \
    > test.out 2>&1
eval_tap $? 69 'PublicPartyJoinCode' test.out

#- 70 PublicGetParty
./ng net.accelbyte.sdk.cli.Main session publicGetParty \
    --namespace "$AB_NAMESPACE" \
    --partyId 'W9OxVmUN' \
    > test.out 2>&1
eval_tap $? 70 'PublicGetParty' test.out

#- 71 PublicUpdateParty
./ng net.accelbyte.sdk.cli.Main session publicUpdateParty \
    --namespace "$AB_NAMESPACE" \
    --partyId '61lriCX1' \
    --body '{"attributes": {"i5KMXwNV": {}, "rLOmX2I6": {}, "uDyO2vCS": {}}, "inactiveTimeout": 15, "inviteTimeout": 0, "joinability": "FRIENDS_OF_LEADER", "maxPlayers": 13, "minPlayers": 14, "type": "NONE", "version": 82}' \
    > test.out 2>&1
eval_tap $? 71 'PublicUpdateParty' test.out

#- 72 PublicPatchUpdateParty
./ng net.accelbyte.sdk.cli.Main session publicPatchUpdateParty \
    --namespace "$AB_NAMESPACE" \
    --partyId '6JQ92fr1' \
    --body '{"attributes": {"IKhyAOal": {}, "mc0eSnCt": {}, "HY7LeeGl": {}}, "inactiveTimeout": 80, "inviteTimeout": 41, "joinability": "INVITE_ONLY", "maxPlayers": 61, "minPlayers": 35, "type": "P2P", "version": 52}' \
    > test.out 2>&1
eval_tap $? 72 'PublicPatchUpdateParty' test.out

#- 73 PublicGeneratePartyCode
./ng net.accelbyte.sdk.cli.Main session publicGeneratePartyCode \
    --namespace "$AB_NAMESPACE" \
    --partyId 'aaWdCaJu' \
    > test.out 2>&1
eval_tap $? 73 'PublicGeneratePartyCode' test.out

#- 74 PublicRevokePartyCode
./ng net.accelbyte.sdk.cli.Main session publicRevokePartyCode \
    --namespace "$AB_NAMESPACE" \
    --partyId 'ykpqx7eM' \
    > test.out 2>&1
eval_tap $? 74 'PublicRevokePartyCode' test.out

#- 75 PublicPartyInvite
./ng net.accelbyte.sdk.cli.Main session publicPartyInvite \
    --namespace "$AB_NAMESPACE" \
    --partyId 'VptiPDCW' \
    --body '{"metadata": {"2gM8HcTM": "iQqepmSV", "93s6Yd7l": "vOImJO00", "ngqZlrYg": "pN544jCx"}, "platformID": "N4iuqAFY", "userID": "kGtomt0C"}' \
    > test.out 2>&1
eval_tap $? 75 'PublicPartyInvite' test.out

#- 76 PublicPromotePartyLeader
./ng net.accelbyte.sdk.cli.Main session publicPromotePartyLeader \
    --namespace "$AB_NAMESPACE" \
    --partyId 'uP6abmyP' \
    --body '{"leaderID": "qYsvT2L5"}' \
    > test.out 2>&1
eval_tap $? 76 'PublicPromotePartyLeader' test.out

#- 77 PublicReadPartySessionStorage
./ng net.accelbyte.sdk.cli.Main session publicReadPartySessionStorage \
    --namespace "$AB_NAMESPACE" \
    --partyId 'MYLnIK2Y' \
    > test.out 2>&1
eval_tap $? 77 'PublicReadPartySessionStorage' test.out

#- 78 PublicUpdateInsertPartySessionStorageReserved
./ng net.accelbyte.sdk.cli.Main session publicUpdateInsertPartySessionStorageReserved \
    --namespace "$AB_NAMESPACE" \
    --partyId 'Vc3lx8CG' \
    --userId 'FT0Nj7aU' \
    --body '{"7DRmZOvS": {}, "3BMsStpb": {}, "6bJjiU74": {}}' \
    > test.out 2>&1
eval_tap $? 78 'PublicUpdateInsertPartySessionStorageReserved' test.out

#- 79 PublicPartyJoin
./ng net.accelbyte.sdk.cli.Main session publicPartyJoin \
    --namespace "$AB_NAMESPACE" \
    --partyId 'S9naOB1g' \
    > test.out 2>&1
eval_tap $? 79 'PublicPartyJoin' test.out

#- 80 PublicPartyLeave
./ng net.accelbyte.sdk.cli.Main session publicPartyLeave \
    --namespace "$AB_NAMESPACE" \
    --partyId 'JUKKbX1W' \
    > test.out 2>&1
eval_tap $? 80 'PublicPartyLeave' test.out

#- 81 PublicPartyReject
./ng net.accelbyte.sdk.cli.Main session publicPartyReject \
    --namespace "$AB_NAMESPACE" \
    --partyId 'JlKTafDU' \
    > test.out 2>&1
eval_tap $? 81 'PublicPartyReject' test.out

#- 82 PublicPartyCancel
./ng net.accelbyte.sdk.cli.Main session publicPartyCancel \
    --namespace "$AB_NAMESPACE" \
    --partyId 'hpy95yOL' \
    --userId 'I5WfABh9' \
    > test.out 2>&1
eval_tap $? 82 'PublicPartyCancel' test.out

#- 83 PublicPartyKick
./ng net.accelbyte.sdk.cli.Main session publicPartyKick \
    --namespace "$AB_NAMESPACE" \
    --partyId '2HZ0ACz6' \
    --userId 'XRqJ5G71' \
    > test.out 2>&1
eval_tap $? 83 'PublicPartyKick' test.out

#- 84 PublicCreateParty
./ng net.accelbyte.sdk.cli.Main session publicCreateParty \
    --namespace "$AB_NAMESPACE" \
    --body '{"attributes": {"rteYAyni": {}, "wY4Z4z6x": {}, "tXCfo2Iv": {}}, "configurationName": "rcXXNEm8", "inactiveTimeout": 92, "inviteTimeout": 48, "joinability": "CLOSED", "maxPlayers": 45, "members": [{"ID": "ZT6Ggork", "PlatformID": "fma1xBaL", "PlatformUserID": "bqwiqlaR"}, {"ID": "blJ5LHyR", "PlatformID": "OemaqruD", "PlatformUserID": "bTrN15lT"}, {"ID": "DvK6UVMT", "PlatformID": "1AAcMamA", "PlatformUserID": "rNk28mS0"}], "minPlayers": 76, "textChat": false, "type": "P2P"}' \
    > test.out 2>&1
eval_tap $? 84 'PublicCreateParty' test.out

#- 85 PublicGetRecentPlayer
./ng net.accelbyte.sdk.cli.Main session publicGetRecentPlayer \
    --namespace "$AB_NAMESPACE" \
    --limit '35' \
    > test.out 2>&1
eval_tap $? 85 'PublicGetRecentPlayer' test.out

#- 86 PublicGetRecentTeamPlayer
./ng net.accelbyte.sdk.cli.Main session publicGetRecentTeamPlayer \
    --namespace "$AB_NAMESPACE" \
    --limit '54' \
    > test.out 2>&1
eval_tap $? 86 'PublicGetRecentTeamPlayer' test.out

#- 87 PublicUpdateInsertSessionStorageLeader
./ng net.accelbyte.sdk.cli.Main session publicUpdateInsertSessionStorageLeader \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'WB2lMzcD' \
    --body '{"i2iXZrCz": {}, "QIlIqKui": {}, "THHoQRZK": {}}' \
    > test.out 2>&1
eval_tap $? 87 'PublicUpdateInsertSessionStorageLeader' test.out

#- 88 PublicUpdateInsertSessionStorage
./ng net.accelbyte.sdk.cli.Main session publicUpdateInsertSessionStorage \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'GHvtZern' \
    --userId 'CP0gGhke' \
    --body '{"JjQSZkwW": {}, "SLMj5bBE": {}, "WkggGiZU": {}}' \
    > test.out 2>&1
eval_tap $? 88 'PublicUpdateInsertSessionStorage' test.out

#- 89 PublicGetBulkPlayerCurrentPlatform
./ng net.accelbyte.sdk.cli.Main session publicGetBulkPlayerCurrentPlatform \
    --namespace "$AB_NAMESPACE" \
    --body '{"userIDs": ["i9gljfCa", "FQzmqoc0", "8AMTtgNp"]}' \
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
    --body '{"crossplayEnabled": false, "currentPlatform": "DBsbzk4p", "data": {"pj2DmVGG": {}, "NBTsKq5I": {}, "8HZ05d07": {}}, "platforms": [{"name": "Er97kpnK", "userID": "fJcz36zi"}, {"name": "ty189yx0", "userID": "fUtOuZDF"}, {"name": "GblNkMKp", "userID": "eXMxQPbA"}], "roles": ["WOd3VznY", "kGjV1dXQ", "VmXX3x2J"], "simultaneousPlatform": "z96pISsu"}' \
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
    --order 'kdEB5an3' \
    --orderBy '8CCefG8p' \
    --status 'FDGq1qnu' \
    > test.out 2>&1
eval_tap $? 93 'PublicQueryMyGameSessions' test.out

#- 94 PublicQueryMyParties
./ng net.accelbyte.sdk.cli.Main session publicQueryMyParties \
    --namespace "$AB_NAMESPACE" \
    --order 'ZKC3qy3A' \
    --orderBy 'TU6q85Hj' \
    --status 'CrZadHlf' \
    > test.out 2>&1
eval_tap $? 94 'PublicQueryMyParties' test.out


rm -f "tmp.dat"

exit $EXIT_CODE