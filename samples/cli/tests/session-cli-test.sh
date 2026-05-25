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
echo "1..104"

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
    --body '{"metricExcludedNamespaces": ["BgLqEFAO", "QCV0yZ5e", "HdZMJDmy"], "regionRetryMapping": {"qCQc02Yw": ["6UlJII0K", "lfsidqXU", "0r203KR8"], "2IFA7iOT": ["zU7iXK0W", "WX7ItxQe", "C03lGNBN"], "Ysj4ale9": ["lCzvfCco", "wLM37Jct", "SafkoPwQ"]}, "regionURLMapping": ["EGJZOVJL", "8w3KwUYf", "xEOAq615"], "testGameMode": "htj44g7s", "testRegionURLMapping": ["aOqlGVga", "06N1z4mU", "9ChSrsAg"], "testTargetUserIDs": ["nzpEcQqd", "utKk7nPy", "Z3dl3jTG"]}' \
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
    --body '{"durationDays": 92}' \
    > test.out 2>&1
eval_tap $? 12 'AdminUpdateConfigurationAlertV1' test.out

#- 13 AdminCreateConfigurationAlertV1
./ng net.accelbyte.sdk.cli.Main session adminCreateConfigurationAlertV1 \
    --namespace "$AB_NAMESPACE" \
    --body '{"durationDays": 99}' \
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
    --body '{"NativeSessionSetting": {"PSNDisableSystemUIMenu": ["PROMOTE_TO_LEADER", "UPDATE_INVITABLE_USER_TYPE", "UPDATE_JOINABLE_USER_TYPE"], "PSNServiceLabel": 21, "PSNSupportedPlatforms": ["Tnjl67BO", "X51SA0Uo", "DLCvVR3z"], "SessionTitle": "oWIithIv", "ShouldSync": true, "XboxAllowCrossPlatform": false, "XboxSandboxID": "K5aIMa1J", "XboxServiceConfigID": "dqzH7u0P", "XboxSessionTemplateName": "3XndlqMS", "XboxTitleID": "rMTwDDcR", "activePlatforms": ["SSZteN1z", "10pG6FOC", "bu5J9lnS"], "localizedSessionName": {"ZCWYcWVT": {}, "l2iYTlEs": {}, "L3VnJACe": {}}}, "PSNBaseUrl": "aXYCyz4H", "amsClaimTimeoutMinutes": 53, "appName": "mYhJX0XA", "asyncProcessDSRequest": {"async": false, "timeout": 53}, "attributes": {"3jEUq37J": {}, "fUZYPO9u": {}, "B5JB1XFx": {}}, "autoJoin": true, "autoLeaveSession": true, "clientVersion": "jbbHg0ZM", "customURLGRPC": "FRr3ADLV", "deployment": "TLDmqIvl", "disableCodeGeneration": true, "disableResendInvite": false, "dsManualSetReady": false, "dsSource": "bIStq8fL", "enableSecret": false, "fallbackClaimKeys": ["lko6ZxCK", "yRlL52qh", "l6KGkXhm"], "grpcSessionConfig": {"appName": "uq085cOd", "customURL": "kv3WgvCP", "functionFlag": 41}, "immutableStorage": true, "inactiveTimeout": 60, "inviteTimeout": 64, "joinability": "FRIENDS_OF_MEMBERS", "leaderElectionGracePeriod": 30, "manualRejoin": false, "maxActiveSessions": 73, "maxPlayers": 33, "minPlayers": 62, "name": "EOifPX6f", "partyCodeGeneratorString": "zPJKaSV9", "partyCodeLength": 20, "persistent": true, "preferredClaimKeys": ["26wHw2He", "HtBOrCiX", "cxeNwzS1"], "requestedRegions": ["BSxMN5Ci", "7uLSzcm1", "KHZAVy2R"], "textChat": false, "textChatMode": "GAME", "tieTeamsSessionLifetime": true, "ttlHours": 84, "type": "DS"}' \
    > test.out 2>&1
eval_tap $? 16 'AdminCreateConfigurationTemplateV1' test.out

#- 17 AdminGetAllConfigurationTemplatesV1
./ng net.accelbyte.sdk.cli.Main session adminGetAllConfigurationTemplatesV1 \
    --namespace "$AB_NAMESPACE" \
    --limit '96' \
    --name 'kWEcqJsp' \
    --offset '83' \
    --order 'DVfVBPka' \
    --orderBy 'DoWSIp2z' \
    > test.out 2>&1
eval_tap $? 17 'AdminGetAllConfigurationTemplatesV1' test.out

#- 18 AdminGetConfigurationTemplateV1
./ng net.accelbyte.sdk.cli.Main session adminGetConfigurationTemplateV1 \
    --name 'fibfoUfN' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 18 'AdminGetConfigurationTemplateV1' test.out

#- 19 AdminUpdateConfigurationTemplateV1
./ng net.accelbyte.sdk.cli.Main session adminUpdateConfigurationTemplateV1 \
    --name 'Tkw6FV9h' \
    --namespace "$AB_NAMESPACE" \
    --body '{"NativeSessionSetting": {"PSNDisableSystemUIMenu": ["PROMOTE_TO_LEADER", "PROMOTE_TO_LEADER", "PROMOTE_TO_LEADER"], "PSNServiceLabel": 37, "PSNSupportedPlatforms": ["AKDXSkMA", "1Co9bv3Y", "L2gkSWzV"], "SessionTitle": "6NVA3HCK", "ShouldSync": false, "XboxAllowCrossPlatform": false, "XboxSandboxID": "hkgO0YL5", "XboxServiceConfigID": "AMhaaC0J", "XboxSessionTemplateName": "jnFr6r6v", "XboxTitleID": "63UMLGI2", "activePlatforms": ["ITisYoXx", "FCwl1nKu", "wWsnAni9"], "localizedSessionName": {"KhfhZsw5": {}, "PclyilNc": {}, "PwKEx553": {}}}, "PSNBaseUrl": "oKEJYqG0", "amsClaimTimeoutMinutes": 63, "appName": "CGTWF7qM", "asyncProcessDSRequest": {"async": true, "timeout": 55}, "attributes": {"fip2nSjA": {}, "pHHU3Vvz": {}, "XLVH3wDn": {}}, "autoJoin": true, "autoLeaveSession": true, "clientVersion": "A16LipUt", "customURLGRPC": "aYxZDXUm", "deployment": "1xCiUSeU", "disableCodeGeneration": false, "disableResendInvite": true, "dsManualSetReady": false, "dsSource": "jonJ99y4", "enableSecret": false, "fallbackClaimKeys": ["YQmq9Ac3", "BdIZGP3Q", "OJNfHPS9"], "grpcSessionConfig": {"appName": "2m4qxrf8", "customURL": "z34N0yay", "functionFlag": 66}, "immutableStorage": true, "inactiveTimeout": 24, "inviteTimeout": 86, "joinability": "CLOSED", "leaderElectionGracePeriod": 17, "manualRejoin": true, "maxActiveSessions": 29, "maxPlayers": 77, "minPlayers": 73, "name": "S6kNvnfu", "partyCodeGeneratorString": "AmXGbsoX", "partyCodeLength": 53, "persistent": false, "preferredClaimKeys": ["48esu92g", "fETM9RJc", "gVEX6GNs"], "requestedRegions": ["wHMZUAJW", "thVfK0j2", "OioKKS2B"], "textChat": true, "textChatMode": "GAME_AND_TEAM", "tieTeamsSessionLifetime": true, "ttlHours": 47, "type": "DS"}' \
    > test.out 2>&1
eval_tap $? 19 'AdminUpdateConfigurationTemplateV1' test.out

#- 20 AdminDeleteConfigurationTemplateV1
./ng net.accelbyte.sdk.cli.Main session adminDeleteConfigurationTemplateV1 \
    --name 'lhsmeiue' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 20 'AdminDeleteConfigurationTemplateV1' test.out

#- 21 AdminGetMemberActiveSession
./ng net.accelbyte.sdk.cli.Main session adminGetMemberActiveSession \
    --name '0WLqBlta' \
    --namespace "$AB_NAMESPACE" \
    --userId 'iGrJ7Nrs' \
    > test.out 2>&1
eval_tap $? 21 'AdminGetMemberActiveSession' test.out

#- 22 AdminReconcileMaxActiveSession
./ng net.accelbyte.sdk.cli.Main session adminReconcileMaxActiveSession \
    --name 'Ig9jed5b' \
    --namespace "$AB_NAMESPACE" \
    --body '{"userID": "srDwKXZf"}' \
    > test.out 2>&1
eval_tap $? 22 'AdminReconcileMaxActiveSession' test.out

#- 23 AdminGetDSMCConfiguration
eval_tap 0 23 'AdminGetDSMCConfiguration # SKIP deprecated' test.out

#- 24 AdminSyncDSMCConfiguration
eval_tap 0 24 'AdminSyncDSMCConfiguration # SKIP deprecated' test.out

#- 25 AdminQueryGameSessions
./ng net.accelbyte.sdk.cli.Main session adminQueryGameSessions \
    --namespace "$AB_NAMESPACE" \
    --configurationName 'wt7cMHGQ' \
    --dsPodName 'yxbQxqg9' \
    --fromTime 'rsucV1Fs' \
    --gameMode '0SjNGcj2' \
    --isPersistent 'HZBZNcXb' \
    --isSoftDeleted '86JfvqTo' \
    --joinability 'INVITE_ONLY' \
    --limit '62' \
    --matchPool '8s0kfPnT' \
    --memberID 'yitenqtY' \
    --offset '77' \
    --order 'tROQF95W' \
    --orderBy '5eWf3rAH' \
    --sessionID '3rFACgW9' \
    --status 'REQUESTED' \
    --statusV2 'DS_ERROR' \
    --toTime 'f04bAQt7' \
    > test.out 2>&1
eval_tap $? 25 'AdminQueryGameSessions' test.out

#- 26 AdminQueryGameSessionsByAttributes
./ng net.accelbyte.sdk.cli.Main session adminQueryGameSessionsByAttributes \
    --namespace "$AB_NAMESPACE" \
    --body '{"fN0K3Wau": {}, "jnLRk2H8": {}, "YEh0V5g6": {}}' \
    > test.out 2>&1
eval_tap $? 26 'AdminQueryGameSessionsByAttributes' test.out

#- 27 AdminDeleteBulkGameSessions
./ng net.accelbyte.sdk.cli.Main session adminDeleteBulkGameSessions \
    --namespace "$AB_NAMESPACE" \
    --body '{"ids": ["iIrU3pzf", "FOl8ZTco", "KQoDFujC"]}' \
    > test.out 2>&1
eval_tap $? 27 'AdminDeleteBulkGameSessions' test.out

#- 28 AdminSetDSReady
./ng net.accelbyte.sdk.cli.Main session adminSetDSReady \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'b4Lroi5P' \
    --body '{"ready": false}' \
    > test.out 2>&1
eval_tap $? 28 'AdminSetDSReady' test.out

#- 29 AdminUpdateDSInformation
./ng net.accelbyte.sdk.cli.Main session adminUpdateDSInformation \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'aqv3hIff' \
    --body '{"createdRegion": "ZTwH40Q7", "deployment": "hysaf32v", "description": "wnXbViiJ", "ip": "ZH5eQIyg", "port": 22, "region": "2wujb8XT", "serverId": "nCWH0pym", "source": "G90YV1e1", "status": "DS_ERROR"}' \
    > test.out 2>&1
eval_tap $? 29 'AdminUpdateDSInformation' test.out

#- 30 AdminKickGameSessionMember
./ng net.accelbyte.sdk.cli.Main session adminKickGameSessionMember \
    --memberId 'LlIsD359' \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'dak2iQ24' \
    > test.out 2>&1
eval_tap $? 30 'AdminKickGameSessionMember' test.out

#- 31 AdminUpdateGameSessionMember
./ng net.accelbyte.sdk.cli.Main session adminUpdateGameSessionMember \
    --memberId '4H1imJlH' \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'U3CY5dvS' \
    --statusType 'pzPkpHS6' \
    > test.out 2>&1
eval_tap $? 31 'AdminUpdateGameSessionMember' test.out

#- 32 AdminGetListNativeSession
./ng net.accelbyte.sdk.cli.Main session adminGetListNativeSession \
    --namespace "$AB_NAMESPACE" \
    --limit '66' \
    --offset '7' \
    --order 'AGGIk8kw' \
    > test.out 2>&1
eval_tap $? 32 'AdminGetListNativeSession' test.out

#- 33 AdminQueryParties
./ng net.accelbyte.sdk.cli.Main session adminQueryParties \
    --namespace "$AB_NAMESPACE" \
    --configurationName '1MzcKIWB' \
    --fromTime 'R8KlkoAr' \
    --isSoftDeleted 'pB3dDJCC' \
    --joinability 'FRIENDS_OF_LEADER' \
    --key 'y93E0xrw' \
    --leaderID 'PF32IkYt' \
    --limit '89' \
    --memberID 'cqFmJ8y9' \
    --memberStatus 'DROPPED' \
    --offset '51' \
    --order 'iAbFrcGM' \
    --orderBy 'iuN4c1Yl' \
    --partyID 'gRX7Djxj' \
    --toTime 'waWei6LA' \
    --value 'aa1RBQ45' \
    > test.out 2>&1
eval_tap $? 33 'AdminQueryParties' test.out

#- 34 AdminDeleteBulkParties
./ng net.accelbyte.sdk.cli.Main session adminDeleteBulkParties \
    --namespace "$AB_NAMESPACE" \
    --body '{"ids": ["ykvfGquy", "28yleuqO", "kFHeRlAZ"]}' \
    > test.out 2>&1
eval_tap $? 34 'AdminDeleteBulkParties' test.out

#- 35 AdminReadPartySessionStorage
./ng net.accelbyte.sdk.cli.Main session adminReadPartySessionStorage \
    --namespace "$AB_NAMESPACE" \
    --partyId 'M0HKeNAM' \
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
    --body '{"psn": {"clientId": "N5No07m3", "clientSecret": "lpsLAxfG", "scope": "4DNlNbwd"}}' \
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

#- 41 AdminUploadPlatformCredentials
./ng net.accelbyte.sdk.cli.Main session adminUploadPlatformCredentials \
    --namespace "$AB_NAMESPACE" \
    --platformId 'XBOX' \
    --description 'kBNNMoTk' \
    --file 'tmp.dat' \
    --password 'FKktTm28' \
    > test.out 2>&1
eval_tap $? 41 'AdminUploadPlatformCredentials' test.out

#- 42 AdminGetRecentPlayer
./ng net.accelbyte.sdk.cli.Main session adminGetRecentPlayer \
    --namespace "$AB_NAMESPACE" \
    --limit '2' \
    --userId 'Lk5BOscW' \
    > test.out 2>&1
eval_tap $? 42 'AdminGetRecentPlayer' test.out

#- 43 AdminGetRecentTeamPlayer
./ng net.accelbyte.sdk.cli.Main session adminGetRecentTeamPlayer \
    --namespace "$AB_NAMESPACE" \
    --limit '73' \
    --userId 'fY3ud196' \
    > test.out 2>&1
eval_tap $? 43 'AdminGetRecentTeamPlayer' test.out

#- 44 AdminReadSessionStorage
./ng net.accelbyte.sdk.cli.Main session adminReadSessionStorage \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'Qv61i4p5' \
    > test.out 2>&1
eval_tap $? 44 'AdminReadSessionStorage' test.out

#- 45 AdminDeleteUserSessionStorage
./ng net.accelbyte.sdk.cli.Main session adminDeleteUserSessionStorage \
    --namespace "$AB_NAMESPACE" \
    --sessionId '0YwVh4FT' \
    > test.out 2>&1
eval_tap $? 45 'AdminDeleteUserSessionStorage' test.out

#- 46 AdminReadUserSessionStorage
./ng net.accelbyte.sdk.cli.Main session adminReadUserSessionStorage \
    --namespace "$AB_NAMESPACE" \
    --sessionId '0juRwSp3' \
    --userId '7MxoRHu8' \
    > test.out 2>&1
eval_tap $? 46 'AdminReadUserSessionStorage' test.out

#- 47 AdminQueryPlayerAttributes
./ng net.accelbyte.sdk.cli.Main session adminQueryPlayerAttributes \
    --namespace "$AB_NAMESPACE" \
    --users 'n5RZy7HM' \
    > test.out 2>&1
eval_tap $? 47 'AdminQueryPlayerAttributes' test.out

#- 48 AdminGetPlayerAttributes
./ng net.accelbyte.sdk.cli.Main session adminGetPlayerAttributes \
    --namespace "$AB_NAMESPACE" \
    --userId 'ihlYpJeK' \
    > test.out 2>&1
eval_tap $? 48 'AdminGetPlayerAttributes' test.out

#- 49 AdminSyncNativeSession
./ng net.accelbyte.sdk.cli.Main session adminSyncNativeSession \
    --namespace "$AB_NAMESPACE" \
    --userId 'vOouMsaR' \
    > test.out 2>&1
eval_tap $? 49 'AdminSyncNativeSession' test.out

#- 50 CreateGameSession
./ng net.accelbyte.sdk.cli.Main session createGameSession \
    --namespace "$AB_NAMESPACE" \
    --resolveMaxActiveSession  \
    --body '{"appName": "Dm6HYt4E", "attributes": {"vBGX7zVK": {}, "bx690fp1": {}, "Ii2ZJ1ce": {}}, "autoJoin": false, "backfillTicketID": "Ab8VebbD", "clientVersion": "yFhjXIqU", "configurationName": "qioLEY8C", "customURLGRPC": "9szfn6Vy", "deployment": "Z2bbZlzn", "dsSource": "m6un98ju", "fallbackClaimKeys": ["PNm4LASf", "GkoCsHBO", "w0MgPvyq"], "inactiveTimeout": 11, "inviteTimeout": 98, "joinability": "FRIENDS_OF_LEADER", "matchPool": "v4qf5rhB", "maxPlayers": 69, "minPlayers": 23, "password": "rEnWzAMJ", "preferredClaimKeys": ["CHjr66TU", "wEXME2cz", "t0z6uxtT"], "requestedRegions": ["7CVH67iB", "Ng0CPZcB", "s5GcIIBF"], "serverName": "C05Ix6Xg", "storage": {"leader": {"E7HSnRyH": {}, "zA5iB4ct": {}, "YSfzO0V9": {}}}, "teams": [{"parties": [{"partyID": "a1ecWbvb", "userIDs": ["8b4IKO4U", "ySh5avrX", "9dj79W3Z"]}, {"partyID": "yzVAbgCu", "userIDs": ["JJdSDxEh", "DGmIIS0x", "4gxVtinA"]}, {"partyID": "PnDX2gMT", "userIDs": ["BddkcdGT", "PQy15WSe", "52LIYNZS"]}], "teamID": "k0KFf68L", "userIDs": ["uyl04STR", "offJJcAe", "Z2Q8hI86"]}, {"parties": [{"partyID": "zeywavvu", "userIDs": ["GQ7FsovG", "45gcoFjs", "CVSUZus4"]}, {"partyID": "ykIOdKfK", "userIDs": ["73CJEdKf", "JQQAUKNl", "SuIjaaqR"]}, {"partyID": "R3eD1MAY", "userIDs": ["X3yMB3iZ", "wDqH7g1t", "wvE0scpP"]}], "teamID": "bYluTcCY", "userIDs": ["r2SiqKvh", "ZYNmN9tS", "Z77AvILQ"]}, {"parties": [{"partyID": "O3eegUrz", "userIDs": ["eGyQOEc5", "9BLz5qkt", "7wXgDLjN"]}, {"partyID": "ZqpBdccW", "userIDs": ["VCtfZ0L1", "wVsPPYH1", "N0lWjtDJ"]}, {"partyID": "TIOEyyso", "userIDs": ["Lhylva9J", "Ho8wu1Dh", "MyfF1U86"]}], "teamID": "90UzC7wS", "userIDs": ["KX4pEGFU", "3BLurBC2", "xxuZHAlb"]}], "textChat": true, "textChatMode": "TEAM", "ticketIDs": ["cPHRxo34", "qmlCSGrq", "DkDB9ZY4"], "tieTeamsSessionLifetime": false, "type": "P2P"}' \
    > test.out 2>&1
eval_tap $? 50 'CreateGameSession' test.out

#- 51 PublicQueryGameSessionsByAttributes
./ng net.accelbyte.sdk.cli.Main session publicQueryGameSessionsByAttributes \
    --namespace "$AB_NAMESPACE" \
    --body '{"gggFtyKL": {}, "7pmvja30": {}, "X6ixH74q": {}}' \
    > test.out 2>&1
eval_tap $? 51 'PublicQueryGameSessionsByAttributes' test.out

#- 52 PublicSessionJoinCode
./ng net.accelbyte.sdk.cli.Main session publicSessionJoinCode \
    --namespace "$AB_NAMESPACE" \
    --body '{"code": "FJjYT38q"}' \
    > test.out 2>&1
eval_tap $? 52 'PublicSessionJoinCode' test.out

#- 53 GetGameSessionByPodName
./ng net.accelbyte.sdk.cli.Main session getGameSessionByPodName \
    --namespace "$AB_NAMESPACE" \
    --podName 'b8NIu65I' \
    > test.out 2>&1
eval_tap $? 53 'GetGameSessionByPodName' test.out

#- 54 GetGameSession
./ng net.accelbyte.sdk.cli.Main session getGameSession \
    --namespace "$AB_NAMESPACE" \
    --sessionId '81ZNmgwX' \
    > test.out 2>&1
eval_tap $? 54 'GetGameSession' test.out

#- 55 UpdateGameSession
./ng net.accelbyte.sdk.cli.Main session updateGameSession \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'vkUgVZkI' \
    --body '{"attributes": {"ij16geH8": {}, "fqnn1qzV": {}, "4N5NlBEk": {}}, "backfillTicketID": "tjefi1Qh", "clientVersion": "1HannDWR", "deployment": "oT8QfwO8", "fallbackClaimKeys": ["LwGGzOKy", "gWk75JDF", "7wN47p7I"], "inactiveTimeout": 14, "inviteTimeout": 51, "joinability": "FRIENDS_OF_LEADER", "matchPool": "Dm8A4nzl", "maxPlayers": 65, "minPlayers": 6, "password": "ZGca9kx7", "preferredClaimKeys": ["mmqKHOPx", "7Exdh4Al", "FH9NFtVb"], "requestedRegions": ["0K1TrvQb", "P45kb11K", "mfv3cMIu"], "teams": [{"parties": [{"partyID": "AsZfANGB", "userIDs": ["S6azIf2z", "OF7fLpHO", "QAikbbSk"]}, {"partyID": "xw6ekREA", "userIDs": ["gcKbjtfd", "rgM70zKl", "wK9hceCL"]}, {"partyID": "0n42EhBV", "userIDs": ["pzFw8pm3", "kUikEDyO", "fDbhPcMK"]}], "teamID": "tzQe3XwJ", "userIDs": ["1vxmJFYf", "vVdu8RD0", "Mvwhe7Km"]}, {"parties": [{"partyID": "0vmrTzRb", "userIDs": ["IYzoID0U", "XG5UgFdH", "IXXJBgbS"]}, {"partyID": "UeppQ4Uh", "userIDs": ["wl4uPauq", "ax8ketPQ", "0p91glJK"]}, {"partyID": "zR0rW9bd", "userIDs": ["rvnypUOt", "Pscsl5Mw", "MXSihQpH"]}], "teamID": "rHiMSh24", "userIDs": ["XLkFzRgQ", "uKA15cUE", "s0o0fzKr"]}, {"parties": [{"partyID": "7i71eEYu", "userIDs": ["9GbHM69D", "LpklKXQI", "arccZlFy"]}, {"partyID": "sbdZF2wV", "userIDs": ["Q6Dvj0NZ", "Fbabwxbo", "b2ahCagi"]}, {"partyID": "XF2lLV4C", "userIDs": ["F8ba91z7", "xEHjeaH3", "W0bjIQJe"]}], "teamID": "yDlMOlp1", "userIDs": ["JxbJU2km", "W6n9BecM", "iIeJf0Gx"]}], "ticketIDs": ["axM9m2yu", "USPoAEsK", "qG71s5Zi"], "tieTeamsSessionLifetime": false, "type": "NONE", "version": 57}' \
    > test.out 2>&1
eval_tap $? 55 'UpdateGameSession' test.out

#- 56 DeleteGameSession
./ng net.accelbyte.sdk.cli.Main session deleteGameSession \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'JxmFyBt6' \
    > test.out 2>&1
eval_tap $? 56 'DeleteGameSession' test.out

#- 57 PatchUpdateGameSession
./ng net.accelbyte.sdk.cli.Main session patchUpdateGameSession \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'RghWXqWV' \
    --body '{"attributes": {"6lqOM8nu": {}, "kyJ3j3QY": {}, "ncFEzF3T": {}}, "backfillTicketID": "A71kIP19", "clientVersion": "5WL7ML3E", "deployment": "2DSrRbXi", "fallbackClaimKeys": ["43tDQJSX", "vFgQYRq6", "GM3IHzjD"], "inactiveTimeout": 69, "inviteTimeout": 20, "joinability": "PASSWORD_PROTECTED", "matchPool": "EinGOkXf", "maxPlayers": 3, "minPlayers": 48, "password": "hEgcXgLC", "preferredClaimKeys": ["g2lDHDmY", "IqRpY9gk", "JhJfIIOw"], "requestedRegions": ["aAdR7kEk", "gDqXwD1a", "DG41ETTn"], "teams": [{"parties": [{"partyID": "Y7I53PpZ", "userIDs": ["QPkovANu", "01FCRgFp", "PQ7fu2BO"]}, {"partyID": "Q4VY4C1h", "userIDs": ["4VGDZt5j", "73hD3xl5", "6n2remn7"]}, {"partyID": "75dzP1KW", "userIDs": ["k4hgXRZI", "BVXTbUwR", "XETXRmjr"]}], "teamID": "WIXvuz6R", "userIDs": ["vRgZnqHh", "At9b3XZq", "KywtEt00"]}, {"parties": [{"partyID": "E1uhXLIJ", "userIDs": ["ty9XEyMr", "4WizUrCm", "gxcrvoai"]}, {"partyID": "CIBhQJrH", "userIDs": ["yktSxafC", "ywGbOaLl", "GT9eZExU"]}, {"partyID": "vdt8brX7", "userIDs": ["Uxq93NJv", "MUtLWDbo", "2CZwg8il"]}], "teamID": "W6ypGfR8", "userIDs": ["1ETaEbyf", "LEOMldsR", "aK2fdGzh"]}, {"parties": [{"partyID": "LmokzaB0", "userIDs": ["lbctx7w2", "Xfg2TzsB", "KxiWRrOE"]}, {"partyID": "AWa1s9hu", "userIDs": ["3QbgjdL6", "b86vjCU5", "4Y9dpkhu"]}, {"partyID": "5wfkl5AD", "userIDs": ["4lOHHPSW", "l5ZQfRn3", "HDAxvFIj"]}], "teamID": "G34ZgLH4", "userIDs": ["9ZDJ4OMm", "D2HSh5PC", "BEGyFOQr"]}], "ticketIDs": ["bbhW09hP", "VjMlPCMS", "hHh4dwlG"], "tieTeamsSessionLifetime": true, "type": "DS", "version": 1}' \
    > test.out 2>&1
eval_tap $? 57 'PatchUpdateGameSession' test.out

#- 58 UpdateGameSessionBackfillTicketID
./ng net.accelbyte.sdk.cli.Main session updateGameSessionBackfillTicketID \
    --namespace "$AB_NAMESPACE" \
    --sessionId '7fzBxNf4' \
    --body '{"backfillTicketID": "whdxOULi"}' \
    > test.out 2>&1
eval_tap $? 58 'UpdateGameSessionBackfillTicketID' test.out

#- 59 GameSessionGenerateCode
./ng net.accelbyte.sdk.cli.Main session gameSessionGenerateCode \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'TgwSFi1u' \
    > test.out 2>&1
eval_tap $? 59 'GameSessionGenerateCode' test.out

#- 60 PublicRevokeGameSessionCode
./ng net.accelbyte.sdk.cli.Main session publicRevokeGameSessionCode \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'xbxaQsVO' \
    > test.out 2>&1
eval_tap $? 60 'PublicRevokeGameSessionCode' test.out

#- 61 PublicGameSessionInvite
./ng net.accelbyte.sdk.cli.Main session publicGameSessionInvite \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'zx0HmzVo' \
    --body '{"metadata": {"BlPhYbCX": "0s5GzCpb", "gs10lO4Q": "5an6IzIY", "5Glyowyn": "01vFS6qK"}, "platformID": "RViodnJq", "userID": "RRVPNC3p"}' \
    > test.out 2>&1
eval_tap $? 61 'PublicGameSessionInvite' test.out

#- 62 JoinGameSession
./ng net.accelbyte.sdk.cli.Main session joinGameSession \
    --namespace "$AB_NAMESPACE" \
    --sessionId '4Idkr2bG' \
    --body '{"password": "CIQIukl9"}' \
    > test.out 2>&1
eval_tap $? 62 'JoinGameSession' test.out

#- 63 PublicPromoteGameSessionLeader
./ng net.accelbyte.sdk.cli.Main session publicPromoteGameSessionLeader \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'Tdi9kEMR' \
    --body '{"leaderID": "4t6yvZXG"}' \
    > test.out 2>&1
eval_tap $? 63 'PublicPromoteGameSessionLeader' test.out

#- 64 LeaveGameSession
./ng net.accelbyte.sdk.cli.Main session leaveGameSession \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'xnKCEpSY' \
    > test.out 2>&1
eval_tap $? 64 'LeaveGameSession' test.out

#- 65 PublicKickGameSessionMember
./ng net.accelbyte.sdk.cli.Main session publicKickGameSessionMember \
    --memberId 'yKvvSf8H' \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'UNVbM0Fl' \
    > test.out 2>&1
eval_tap $? 65 'PublicKickGameSessionMember' test.out

#- 66 PublicGetGameSessionPassword
./ng net.accelbyte.sdk.cli.Main session publicGetGameSessionPassword \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'mjZ4kSt3' \
    > test.out 2>&1
eval_tap $? 66 'PublicGetGameSessionPassword' test.out

#- 67 PublicUpdateGameSessionPassword
./ng net.accelbyte.sdk.cli.Main session publicUpdateGameSessionPassword \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'BUqkKbZf' \
    --body '{"newPassword": "khvh04X4"}' \
    > test.out 2>&1
eval_tap $? 67 'PublicUpdateGameSessionPassword' test.out

#- 68 PublicGameSessionReject
./ng net.accelbyte.sdk.cli.Main session publicGameSessionReject \
    --namespace "$AB_NAMESPACE" \
    --sessionId '9THpU2QJ' \
    > test.out 2>&1
eval_tap $? 68 'PublicGameSessionReject' test.out

#- 69 GetSessionServerSecret
./ng net.accelbyte.sdk.cli.Main session getSessionServerSecret \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'MXz8reUu' \
    > test.out 2>&1
eval_tap $? 69 'GetSessionServerSecret' test.out

#- 70 AppendTeamGameSession
eval_tap 0 70 'AppendTeamGameSession # SKIP deprecated' test.out

#- 71 PublicGameSessionCancel
./ng net.accelbyte.sdk.cli.Main session publicGameSessionCancel \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'r5mMmrs3' \
    --userId '0Q0JuGSB' \
    > test.out 2>&1
eval_tap $? 71 'PublicGameSessionCancel' test.out

#- 72 PublicPartyJoinCode
./ng net.accelbyte.sdk.cli.Main session publicPartyJoinCode \
    --namespace "$AB_NAMESPACE" \
    --body '{"code": "QCrlrR6i"}' \
    > test.out 2>&1
eval_tap $? 72 'PublicPartyJoinCode' test.out

#- 73 PublicGetParty
./ng net.accelbyte.sdk.cli.Main session publicGetParty \
    --namespace "$AB_NAMESPACE" \
    --partyId '5b8b3WIU' \
    > test.out 2>&1
eval_tap $? 73 'PublicGetParty' test.out

#- 74 PublicUpdateParty
./ng net.accelbyte.sdk.cli.Main session publicUpdateParty \
    --namespace "$AB_NAMESPACE" \
    --partyId 'rmogib6Q' \
    --body '{"attributes": {"UgcOhPO4": {}, "SIccmQqW": {}, "PXF7ye4G": {}}, "inactiveTimeout": 14, "inviteTimeout": 59, "joinability": "OPEN", "maxPlayers": 8, "minPlayers": 100, "password": "xH7gzUck", "type": "P2P", "version": 63}' \
    > test.out 2>&1
eval_tap $? 74 'PublicUpdateParty' test.out

#- 75 PublicPatchUpdateParty
./ng net.accelbyte.sdk.cli.Main session publicPatchUpdateParty \
    --namespace "$AB_NAMESPACE" \
    --partyId '71m8zmy0' \
    --body '{"attributes": {"yEktfVkX": {}, "94fWj6fQ": {}, "xoZTpVwr": {}}, "inactiveTimeout": 53, "inviteTimeout": 21, "joinability": "FRIENDS_OF_LEADER", "maxPlayers": 15, "minPlayers": 35, "password": "MorsDXxG", "type": "DS", "version": 59}' \
    > test.out 2>&1
eval_tap $? 75 'PublicPatchUpdateParty' test.out

#- 76 PublicGeneratePartyCode
./ng net.accelbyte.sdk.cli.Main session publicGeneratePartyCode \
    --namespace "$AB_NAMESPACE" \
    --partyId 'bVnSMr6U' \
    > test.out 2>&1
eval_tap $? 76 'PublicGeneratePartyCode' test.out

#- 77 PublicRevokePartyCode
./ng net.accelbyte.sdk.cli.Main session publicRevokePartyCode \
    --namespace "$AB_NAMESPACE" \
    --partyId 'I6fg08dV' \
    > test.out 2>&1
eval_tap $? 77 'PublicRevokePartyCode' test.out

#- 78 PublicPartyInvite
./ng net.accelbyte.sdk.cli.Main session publicPartyInvite \
    --namespace "$AB_NAMESPACE" \
    --partyId 'RIVo2GYZ' \
    --body '{"metadata": {"Q9MSonyj": "nRoozUZ3", "JiubNdNd": "bz1m6BHo", "LPKOBMHE": "CDClDkv9"}, "platformID": "0W4P6Ssu", "userID": "ovq5xVq4"}' \
    > test.out 2>&1
eval_tap $? 78 'PublicPartyInvite' test.out

#- 79 PublicPromotePartyLeader
./ng net.accelbyte.sdk.cli.Main session publicPromotePartyLeader \
    --namespace "$AB_NAMESPACE" \
    --partyId '1Jn4alwz' \
    --body '{"leaderID": "alLgl3Nv"}' \
    > test.out 2>&1
eval_tap $? 79 'PublicPromotePartyLeader' test.out

#- 80 PublicGetPartyPassword
./ng net.accelbyte.sdk.cli.Main session publicGetPartyPassword \
    --namespace "$AB_NAMESPACE" \
    --partyId '4J0gwub8' \
    > test.out 2>&1
eval_tap $? 80 'PublicGetPartyPassword' test.out

#- 81 PublicUpdatePartyPassword
./ng net.accelbyte.sdk.cli.Main session publicUpdatePartyPassword \
    --namespace "$AB_NAMESPACE" \
    --partyId 'UOSALc55' \
    --body '{"newPassword": "9JyXdMd7"}' \
    > test.out 2>&1
eval_tap $? 81 'PublicUpdatePartyPassword' test.out

#- 82 PublicReadPartySessionStorage
./ng net.accelbyte.sdk.cli.Main session publicReadPartySessionStorage \
    --namespace "$AB_NAMESPACE" \
    --partyId 'E6COJqUa' \
    > test.out 2>&1
eval_tap $? 82 'PublicReadPartySessionStorage' test.out

#- 83 PublicUpdateInsertPartySessionStorage
./ng net.accelbyte.sdk.cli.Main session publicUpdateInsertPartySessionStorage \
    --namespace "$AB_NAMESPACE" \
    --partyId 'vF8ngnjG' \
    --userId 'TsZO89J3' \
    --body '{"CuJIh4w8": {}, "DWojjqOz": {}, "Dmwt5OIY": {}}' \
    > test.out 2>&1
eval_tap $? 83 'PublicUpdateInsertPartySessionStorage' test.out

#- 84 PublicUpdateInsertPartySessionStorageReserved
./ng net.accelbyte.sdk.cli.Main session publicUpdateInsertPartySessionStorageReserved \
    --namespace "$AB_NAMESPACE" \
    --partyId 'lf0YReoC' \
    --userId 'kKgawCgr' \
    --body '{"aiy2k6M4": {}, "jtQa73Vx": {}, "n34FiuQp": {}}' \
    > test.out 2>&1
eval_tap $? 84 'PublicUpdateInsertPartySessionStorageReserved' test.out

#- 85 PublicPartyJoin
./ng net.accelbyte.sdk.cli.Main session publicPartyJoin \
    --namespace "$AB_NAMESPACE" \
    --partyId 'I24gLeZF' \
    --body '{"password": "5sIEsbNl"}' \
    > test.out 2>&1
eval_tap $? 85 'PublicPartyJoin' test.out

#- 86 PublicPartyLeave
./ng net.accelbyte.sdk.cli.Main session publicPartyLeave \
    --namespace "$AB_NAMESPACE" \
    --partyId 'rpUDeSYg' \
    > test.out 2>&1
eval_tap $? 86 'PublicPartyLeave' test.out

#- 87 PublicPartyReject
./ng net.accelbyte.sdk.cli.Main session publicPartyReject \
    --namespace "$AB_NAMESPACE" \
    --partyId 'Vhls7uZa' \
    > test.out 2>&1
eval_tap $? 87 'PublicPartyReject' test.out

#- 88 PublicPartyCancel
./ng net.accelbyte.sdk.cli.Main session publicPartyCancel \
    --namespace "$AB_NAMESPACE" \
    --partyId 'NOxYsuNv' \
    --userId 'VzRfHDyB' \
    > test.out 2>&1
eval_tap $? 88 'PublicPartyCancel' test.out

#- 89 PublicPartyKick
./ng net.accelbyte.sdk.cli.Main session publicPartyKick \
    --namespace "$AB_NAMESPACE" \
    --partyId 'aia8h2fd' \
    --userId 'a1WiJINx' \
    > test.out 2>&1
eval_tap $? 89 'PublicPartyKick' test.out

#- 90 PublicCreateParty
./ng net.accelbyte.sdk.cli.Main session publicCreateParty \
    --namespace "$AB_NAMESPACE" \
    --body '{"attributes": {"4nYTWyJx": {}, "dVylDv0A": {}, "8dHPtXNo": {}}, "configurationName": "G1MhDEUR", "inactiveTimeout": 44, "inviteTimeout": 62, "joinability": "FRIENDS_OF_LEADER", "maxPlayers": 32, "members": [{"ID": "FjzuPW0g", "PlatformID": "eVEeX5Y2", "PlatformUserID": "IEYmDT2B"}, {"ID": "Y3o3145r", "PlatformID": "BQ3mtltG", "PlatformUserID": "87ouWmjb"}, {"ID": "grA5s3cV", "PlatformID": "pcMKl9Bz", "PlatformUserID": "lfiS1cVE"}], "minPlayers": 58, "password": "xFJFQ9VK", "textChat": true, "type": "P2P"}' \
    > test.out 2>&1
eval_tap $? 90 'PublicCreateParty' test.out

#- 91 PublicGetRecentPlayer
./ng net.accelbyte.sdk.cli.Main session publicGetRecentPlayer \
    --namespace "$AB_NAMESPACE" \
    --limit '98' \
    > test.out 2>&1
eval_tap $? 91 'PublicGetRecentPlayer' test.out

#- 92 PublicGetRecentTeamPlayer
./ng net.accelbyte.sdk.cli.Main session publicGetRecentTeamPlayer \
    --namespace "$AB_NAMESPACE" \
    --limit '35' \
    > test.out 2>&1
eval_tap $? 92 'PublicGetRecentTeamPlayer' test.out

#- 93 PublicUpdateInsertSessionStorageLeader
./ng net.accelbyte.sdk.cli.Main session publicUpdateInsertSessionStorageLeader \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'A3magj2N' \
    --body '{"iUCtY3ry": {}, "Bt4bb0eO": {}, "N02mXAi8": {}}' \
    > test.out 2>&1
eval_tap $? 93 'PublicUpdateInsertSessionStorageLeader' test.out

#- 94 PublicUpdateInsertSessionStorage
./ng net.accelbyte.sdk.cli.Main session publicUpdateInsertSessionStorage \
    --namespace "$AB_NAMESPACE" \
    --sessionId '5Tbs3iuK' \
    --userId 'wuiTbBQe' \
    --body '{"ffki4HUw": {}, "1SJ8l8RD": {}, "XPsVxzFQ": {}}' \
    > test.out 2>&1
eval_tap $? 94 'PublicUpdateInsertSessionStorage' test.out

#- 95 PublicGetBulkPlayerCurrentPlatform
./ng net.accelbyte.sdk.cli.Main session publicGetBulkPlayerCurrentPlatform \
    --namespace "$AB_NAMESPACE" \
    --body '{"userIDs": ["fUSJ4ZLf", "rPDTh68e", "xlUX2E05"]}' \
    > test.out 2>&1
eval_tap $? 95 'PublicGetBulkPlayerCurrentPlatform' test.out

#- 96 PublicGetPlayerAttributes
./ng net.accelbyte.sdk.cli.Main session publicGetPlayerAttributes \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 96 'PublicGetPlayerAttributes' test.out

#- 97 PublicStorePlayerAttributes
./ng net.accelbyte.sdk.cli.Main session publicStorePlayerAttributes \
    --namespace "$AB_NAMESPACE" \
    --body '{"crossplayEnabled": false, "currentPlatform": "ZoTXh8bv", "data": {"dbtxXicW": {}, "I2OL74B0": {}, "YS6fGlm2": {}}, "platforms": [{"name": "OeVTGsga", "userID": "Z7fciA4v"}, {"name": "K7EM7dUk", "userID": "wolEOdL8"}, {"name": "XX4y9qb2", "userID": "kqpmlNCM"}], "roles": ["1PXZMafe", "0LohTrMl", "lAvSzxVC"], "simultaneousPlatform": "RB9LWWjI"}' \
    > test.out 2>&1
eval_tap $? 97 'PublicStorePlayerAttributes' test.out

#- 98 PublicDeletePlayerAttributes
./ng net.accelbyte.sdk.cli.Main session publicDeletePlayerAttributes \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 98 'PublicDeletePlayerAttributes' test.out

#- 99 PublicQueryMyGameSessions
./ng net.accelbyte.sdk.cli.Main session publicQueryMyGameSessions \
    --namespace "$AB_NAMESPACE" \
    --order 'lxkRMFOp' \
    --orderBy 'RY9BZ0YO' \
    --status 'ICIrZ0ig' \
    > test.out 2>&1
eval_tap $? 99 'PublicQueryMyGameSessions' test.out

#- 100 PublicQueryMyParties
./ng net.accelbyte.sdk.cli.Main session publicQueryMyParties \
    --namespace "$AB_NAMESPACE" \
    --order 'FvzSests' \
    --orderBy '7OOOiKpP' \
    --status 'CArBvHZ1' \
    > test.out 2>&1
eval_tap $? 100 'PublicQueryMyParties' test.out

#- 101 PublicReplaceSessionStorageLeaderV2
./ng net.accelbyte.sdk.cli.Main session publicReplaceSessionStorageLeaderV2 \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'kkmws50M' \
    --body '{"dLZA3qvJ": {}, "Z0QLkH7D": {}, "XFs9Bzvg": {}}' \
    > test.out 2>&1
eval_tap $? 101 'PublicReplaceSessionStorageLeaderV2' test.out

#- 102 PublicUpdateInsertSessionStorageLeaderV2
./ng net.accelbyte.sdk.cli.Main session publicUpdateInsertSessionStorageLeaderV2 \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'QiCcwMYD' \
    --body '{"YdsneBnv": {}, "ET9wDGHK": {}, "CGG69hHQ": {}}' \
    > test.out 2>&1
eval_tap $? 102 'PublicUpdateInsertSessionStorageLeaderV2' test.out

#- 103 PublicReplaceSessionStorageUserV2
./ng net.accelbyte.sdk.cli.Main session publicReplaceSessionStorageUserV2 \
    --namespace "$AB_NAMESPACE" \
    --sessionId '3WxLg4uK' \
    --userId 'tOUqM7AW' \
    --body '{"VnLivrMf": {}, "BHk8ogrE": {}, "wLCB5ZGo": {}}' \
    > test.out 2>&1
eval_tap $? 103 'PublicReplaceSessionStorageUserV2' test.out

#- 104 PublicUpdateInsertSessionStorageUserV2
./ng net.accelbyte.sdk.cli.Main session publicUpdateInsertSessionStorageUserV2 \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'jNpVb93m' \
    --userId 'MyavklkZ' \
    --body '{"X5ZayohF": {}, "207Q3Vkk": {}, "bw8bR3we": {}}' \
    > test.out 2>&1
eval_tap $? 104 'PublicUpdateInsertSessionStorageUserV2' test.out


rm -f "tmp.dat"

exit $EXIT_CODE