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
    --body '{"metricExcludedNamespaces": ["BSeGZ1Pt", "VyxlPk5r", "5mKZu38N"], "regionRetryMapping": {"lpYU5uq1": ["5PLbzbpt", "7LW8qRvI", "bCWhXN8l"], "bC8NgaL5": ["JTR0wrJ0", "hsf3sGjb", "UFQmwdSK"], "Q0CyeaU0": ["rRBCI7so", "lTR8c3Ue", "VaMVMKNw"]}, "regionURLMapping": ["09FfOSVp", "S4Y3Lzg0", "pHh7WM3O"], "testGameMode": "iHnAuPlv", "testRegionURLMapping": ["r5Mn4YlC", "lCksGqFD", "gqmIF2RK"], "testTargetUserIDs": ["Z5vbFVxB", "NfNXAB4S", "QOX7idkN"]}' \
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
    --body '{"durationDays": 42}' \
    > test.out 2>&1
eval_tap $? 12 'AdminUpdateConfigurationAlertV1' test.out

#- 13 AdminCreateConfigurationAlertV1
./ng net.accelbyte.sdk.cli.Main session adminCreateConfigurationAlertV1 \
    --namespace "$AB_NAMESPACE" \
    --body '{"durationDays": 14}' \
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
    --body '{"NativeSessionSetting": {"PSNDisableSystemUIMenu": ["KICK", "PROMOTE_TO_LEADER", "UPDATE_INVITABLE_USER_TYPE"], "PSNServiceLabel": 68, "PSNSupportedPlatforms": ["s0ZA2qnO", "9lgQn9oO", "yK4wXZ8z"], "SessionTitle": "Z4YQPaUy", "ShouldSync": true, "XboxAllowCrossPlatform": true, "XboxSandboxID": "gipGvDJv", "XboxServiceConfigID": "SYzNXruE", "XboxSessionTemplateName": "Twwzk4fT", "XboxTitleID": "YBuyx3h4", "localizedSessionName": {"1WYCwkg5": {}, "CSIHIoje": {}, "JhMzrfYF": {}}}, "PSNBaseUrl": "OynVft3u", "amsClaimTimeoutMinutes": 15, "appName": "gRqZ7sxK", "asyncProcessDSRequest": {"async": true, "timeout": 0}, "attributes": {"8Ce7xz9g": {}, "mu0NVkTD": {}, "RjwuJkhx": {}}, "autoJoin": false, "autoLeaveSession": false, "clientVersion": "1TB15X6C", "customURLGRPC": "CC4Jgk39", "deployment": "4r7NHai8", "disableCodeGeneration": true, "disableResendInvite": true, "dsManualSetReady": false, "dsSource": "i3HgMhkv", "enableSecret": true, "fallbackClaimKeys": ["0m2dCsRm", "mdXSwlIk", "tZZHLoN1"], "grpcSessionConfig": {"appName": "5VqyQGWS", "customURL": "lDerpLSe", "functionFlag": 31}, "immutableStorage": false, "inactiveTimeout": 54, "inviteTimeout": 76, "joinability": "penKZVuL", "leaderElectionGracePeriod": 67, "manualRejoin": true, "maxActiveSessions": 35, "maxPlayers": 68, "minPlayers": 13, "name": "lvFlQ9q9", "persistent": true, "preferredClaimKeys": ["nQ9qv5On", "4S5g56es", "zNfwvJtQ"], "requestedRegions": ["j0M3k9EX", "Bu8OgUyt", "icMChJNG"], "textChat": true, "textChatMode": "GAME", "tieTeamsSessionLifetime": true, "ttlHours": 75, "type": "8jt7o3zb"}' \
    > test.out 2>&1
eval_tap $? 16 'AdminCreateConfigurationTemplateV1' test.out

#- 17 AdminGetAllConfigurationTemplatesV1
./ng net.accelbyte.sdk.cli.Main session adminGetAllConfigurationTemplatesV1 \
    --namespace "$AB_NAMESPACE" \
    --limit '99' \
    --name 'X8HSyg6W' \
    --offset '47' \
    --order 'dMLmT8TO' \
    --orderBy 'kMZO02Xj' \
    > test.out 2>&1
eval_tap $? 17 'AdminGetAllConfigurationTemplatesV1' test.out

#- 18 AdminGetConfigurationTemplateV1
./ng net.accelbyte.sdk.cli.Main session adminGetConfigurationTemplateV1 \
    --name 'pnb9fOQX' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 18 'AdminGetConfigurationTemplateV1' test.out

#- 19 AdminUpdateConfigurationTemplateV1
./ng net.accelbyte.sdk.cli.Main session adminUpdateConfigurationTemplateV1 \
    --name 'pEWwCbbj' \
    --namespace "$AB_NAMESPACE" \
    --body '{"NativeSessionSetting": {"PSNDisableSystemUIMenu": ["PROMOTE_TO_LEADER", "UPDATE_INVITABLE_USER_TYPE", "KICK"], "PSNServiceLabel": 63, "PSNSupportedPlatforms": ["YI1ksBQJ", "sjwLNcrt", "vIjy9NCY"], "SessionTitle": "1w1Uu3uJ", "ShouldSync": true, "XboxAllowCrossPlatform": true, "XboxSandboxID": "Z0ym2M1C", "XboxServiceConfigID": "5lrK4wy1", "XboxSessionTemplateName": "pWaKpc4G", "XboxTitleID": "pwaoyR3U", "localizedSessionName": {"JiqMnYrl": {}, "ZnGI5A9E": {}, "5k1tL0MG": {}}}, "PSNBaseUrl": "51HZSO04", "amsClaimTimeoutMinutes": 82, "appName": "PwqeZqXr", "asyncProcessDSRequest": {"async": true, "timeout": 65}, "attributes": {"kpsxX4wB": {}, "cZEfDlDn": {}, "O0tEjIB8": {}}, "autoJoin": false, "autoLeaveSession": false, "clientVersion": "G0N4J5FT", "customURLGRPC": "hlilzobU", "deployment": "yEvm2RWH", "disableCodeGeneration": false, "disableResendInvite": true, "dsManualSetReady": false, "dsSource": "AYzGMHWK", "enableSecret": true, "fallbackClaimKeys": ["DOLziVR6", "q6gXkAzt", "FrE6FG8j"], "grpcSessionConfig": {"appName": "ayznbjqf", "customURL": "V2MzeNOZ", "functionFlag": 16}, "immutableStorage": true, "inactiveTimeout": 65, "inviteTimeout": 10, "joinability": "ASwGFu83", "leaderElectionGracePeriod": 96, "manualRejoin": false, "maxActiveSessions": 79, "maxPlayers": 36, "minPlayers": 27, "name": "eSHPxB7Z", "persistent": false, "preferredClaimKeys": ["WYgxkcWv", "OfCfoNbp", "fP2SvAbH"], "requestedRegions": ["M08DRNo0", "3M7C59ps", "AqTNDypZ"], "textChat": false, "textChatMode": "TEAM", "tieTeamsSessionLifetime": true, "ttlHours": 99, "type": "v4HLxtcA"}' \
    > test.out 2>&1
eval_tap $? 19 'AdminUpdateConfigurationTemplateV1' test.out

#- 20 AdminDeleteConfigurationTemplateV1
./ng net.accelbyte.sdk.cli.Main session adminDeleteConfigurationTemplateV1 \
    --name 'rtzgbonF' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 20 'AdminDeleteConfigurationTemplateV1' test.out

#- 21 AdminGetMemberActiveSession
./ng net.accelbyte.sdk.cli.Main session adminGetMemberActiveSession \
    --name '7BEuII6F' \
    --namespace "$AB_NAMESPACE" \
    --userId 'gsvrFTIn' \
    > test.out 2>&1
eval_tap $? 21 'AdminGetMemberActiveSession' test.out

#- 22 AdminReconcileMaxActiveSession
./ng net.accelbyte.sdk.cli.Main session adminReconcileMaxActiveSession \
    --name 'NXWgoXug' \
    --namespace "$AB_NAMESPACE" \
    --body '{"userID": "5kNVmUOD"}' \
    > test.out 2>&1
eval_tap $? 22 'AdminReconcileMaxActiveSession' test.out

#- 23 AdminGetDSMCConfiguration
eval_tap 0 23 'AdminGetDSMCConfiguration # SKIP deprecated' test.out

#- 24 AdminSyncDSMCConfiguration
eval_tap 0 24 'AdminSyncDSMCConfiguration # SKIP deprecated' test.out

#- 25 AdminQueryGameSessions
./ng net.accelbyte.sdk.cli.Main session adminQueryGameSessions \
    --namespace "$AB_NAMESPACE" \
    --configurationName 'nFoN3yWN' \
    --dsPodName 'YhVfGX6u' \
    --fromTime 'fY9dAdE4' \
    --gameMode 'J96QviJV' \
    --isPersistent 'VdWYyfa2' \
    --isSoftDeleted 'ITtS1Cub' \
    --joinability 'vxsSnTlG' \
    --limit '52' \
    --matchPool 'MqR6f5E5' \
    --memberID '2XLuXiBr' \
    --offset '28' \
    --order 'oaMOU5K6' \
    --orderBy 'ON19KIG2' \
    --sessionID 'oidsbh41' \
    --status 'kzmwH0K6' \
    --statusV2 '3uYGuFOA' \
    --toTime 'Rg8mYGbb' \
    > test.out 2>&1
eval_tap $? 25 'AdminQueryGameSessions' test.out

#- 26 AdminQueryGameSessionsByAttributes
./ng net.accelbyte.sdk.cli.Main session adminQueryGameSessionsByAttributes \
    --namespace "$AB_NAMESPACE" \
    --body '{"QZbvCLWZ": {}, "4K0eELDa": {}, "ojS2S8fZ": {}}' \
    > test.out 2>&1
eval_tap $? 26 'AdminQueryGameSessionsByAttributes' test.out

#- 27 AdminDeleteBulkGameSessions
./ng net.accelbyte.sdk.cli.Main session adminDeleteBulkGameSessions \
    --namespace "$AB_NAMESPACE" \
    --body '{"ids": ["nW9a8gaR", "SzatE9Mw", "h3qdeOXK"]}' \
    > test.out 2>&1
eval_tap $? 27 'AdminDeleteBulkGameSessions' test.out

#- 28 AdminSetDSReady
./ng net.accelbyte.sdk.cli.Main session adminSetDSReady \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'tZMxb634' \
    --body '{"ready": true}' \
    > test.out 2>&1
eval_tap $? 28 'AdminSetDSReady' test.out

#- 29 AdminUpdateDSInformation
./ng net.accelbyte.sdk.cli.Main session adminUpdateDSInformation \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'kUuP1Iq8' \
    --body '{"createdRegion": "L5TVKfSy", "deployment": "FJiQwpqF", "description": "VQ16xQNM", "ip": "cxvUghVA", "port": 68, "region": "CGOa4123", "serverId": "FIp5uoB4", "source": "7WsG6dJe", "status": "ogvZIfUj"}' \
    > test.out 2>&1
eval_tap $? 29 'AdminUpdateDSInformation' test.out

#- 30 AdminKickGameSessionMember
./ng net.accelbyte.sdk.cli.Main session adminKickGameSessionMember \
    --memberId 'fopony9p' \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'WpMQC8E7' \
    > test.out 2>&1
eval_tap $? 30 'AdminKickGameSessionMember' test.out

#- 31 AdminUpdateGameSessionMember
./ng net.accelbyte.sdk.cli.Main session adminUpdateGameSessionMember \
    --memberId 'EQ4xk3dR' \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'rwtUdxJL' \
    --statusType 'Jq3ON8Zj' \
    > test.out 2>&1
eval_tap $? 31 'AdminUpdateGameSessionMember' test.out

#- 32 AdminGetListNativeSession
./ng net.accelbyte.sdk.cli.Main session adminGetListNativeSession \
    --namespace "$AB_NAMESPACE" \
    --limit '0' \
    --offset '100' \
    --order 'OsLAE6Mg' \
    > test.out 2>&1
eval_tap $? 32 'AdminGetListNativeSession' test.out

#- 33 AdminQueryParties
./ng net.accelbyte.sdk.cli.Main session adminQueryParties \
    --namespace "$AB_NAMESPACE" \
    --fromTime 'b04a0qkC' \
    --isSoftDeleted 'OJWojR6F' \
    --joinability 'jxSsUT0q' \
    --key 'o8Gu5jJC' \
    --leaderID 'iNmHpD79' \
    --limit '4' \
    --memberID 'RpNO2Kp3' \
    --memberStatus 'G4cIeHFl' \
    --offset '70' \
    --order 'kRvlGzSt' \
    --orderBy 'a1UGPGep' \
    --partyID 'a9G6peVt' \
    --toTime 'leiTUIeO' \
    --value 'aSki5HUs' \
    > test.out 2>&1
eval_tap $? 33 'AdminQueryParties' test.out

#- 34 AdminDeleteBulkParties
./ng net.accelbyte.sdk.cli.Main session adminDeleteBulkParties \
    --namespace "$AB_NAMESPACE" \
    --body '{"ids": ["NbuIhTJZ", "ySt68JP0", "MFdPc5oH"]}' \
    > test.out 2>&1
eval_tap $? 34 'AdminDeleteBulkParties' test.out

#- 35 AdminReadPartySessionStorage
./ng net.accelbyte.sdk.cli.Main session adminReadPartySessionStorage \
    --namespace "$AB_NAMESPACE" \
    --partyId 'QQKmn7cn' \
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
    --body '{"psn": {"clientId": "daZsGu2c", "clientSecret": "7CbbMNqq", "scope": "2HcmzNPR"}}' \
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
    --limit '96' \
    --userId 'YC737K75' \
    > test.out 2>&1
eval_tap $? 41 'AdminGetRecentPlayer' test.out

#- 42 AdminGetRecentTeamPlayer
./ng net.accelbyte.sdk.cli.Main session adminGetRecentTeamPlayer \
    --namespace "$AB_NAMESPACE" \
    --limit '58' \
    --userId '5UvIF1sh' \
    > test.out 2>&1
eval_tap $? 42 'AdminGetRecentTeamPlayer' test.out

#- 43 AdminReadSessionStorage
./ng net.accelbyte.sdk.cli.Main session adminReadSessionStorage \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'mtT9sMZ8' \
    > test.out 2>&1
eval_tap $? 43 'AdminReadSessionStorage' test.out

#- 44 AdminDeleteUserSessionStorage
./ng net.accelbyte.sdk.cli.Main session adminDeleteUserSessionStorage \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'TLWtIi8i' \
    > test.out 2>&1
eval_tap $? 44 'AdminDeleteUserSessionStorage' test.out

#- 45 AdminReadUserSessionStorage
./ng net.accelbyte.sdk.cli.Main session adminReadUserSessionStorage \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'bZQhUvRY' \
    --userId 'o3JwcHXd' \
    > test.out 2>&1
eval_tap $? 45 'AdminReadUserSessionStorage' test.out

#- 46 AdminQueryPlayerAttributes
./ng net.accelbyte.sdk.cli.Main session adminQueryPlayerAttributes \
    --namespace "$AB_NAMESPACE" \
    --users 'sha8FCBP' \
    > test.out 2>&1
eval_tap $? 46 'AdminQueryPlayerAttributes' test.out

#- 47 AdminGetPlayerAttributes
./ng net.accelbyte.sdk.cli.Main session adminGetPlayerAttributes \
    --namespace "$AB_NAMESPACE" \
    --userId '7bOt28hl' \
    > test.out 2>&1
eval_tap $? 47 'AdminGetPlayerAttributes' test.out

#- 48 AdminSyncNativeSession
./ng net.accelbyte.sdk.cli.Main session adminSyncNativeSession \
    --namespace "$AB_NAMESPACE" \
    --userId 'dZTZzhlX' \
    > test.out 2>&1
eval_tap $? 48 'AdminSyncNativeSession' test.out

#- 49 CreateGameSession
./ng net.accelbyte.sdk.cli.Main session createGameSession \
    --namespace "$AB_NAMESPACE" \
    --resolveMaxActiveSession  \
    --body '{"appName": "HyLig0cG", "attributes": {"Q10UpUtf": {}, "Sguq2ndX": {}, "c6sHxZ2t": {}}, "autoJoin": true, "backfillTicketID": "fEpG5yep", "clientVersion": "vMC0itVV", "configurationName": "fijF0hJm", "customURLGRPC": "sRBwoOXS", "deployment": "ZxFYY0Iu", "dsSource": "VBqyBIDG", "fallbackClaimKeys": ["7czKeRg1", "x1j6WyeC", "LEAUhm2j"], "inactiveTimeout": 29, "inviteTimeout": 48, "joinability": "iqrWWFMR", "matchPool": "wRdFlwN9", "maxPlayers": 94, "minPlayers": 6, "preferredClaimKeys": ["l3NywyHG", "wRQ6v9hb", "NatS3B64"], "requestedRegions": ["UB3Cctse", "EUQKH0Yt", "gSrFD5KR"], "serverName": "nGVse5TD", "storage": {"leader": {"2AB1JaDq": {}, "Q9R5ERHD": {}, "5MeUN9Yc": {}}}, "teams": [{"parties": [{"partyID": "M0AA0Jqb", "userIDs": ["7yDUreyP", "OBR8Fr8c", "enB6LsoC"]}, {"partyID": "ZiEcoJtv", "userIDs": ["B3NswzbF", "lJBQHjPH", "L9FveJZo"]}, {"partyID": "KpBYv59j", "userIDs": ["JbH5Zl6T", "07GC95Lh", "9imAdm4K"]}], "teamID": "C3ASOgWD", "userIDs": ["zVmo7bNk", "DZ7wUmZq", "ScUXXd5Z"]}, {"parties": [{"partyID": "4O0f0xsm", "userIDs": ["gZStnrag", "CI5Lpcn3", "4qLyZtUA"]}, {"partyID": "FC317WGh", "userIDs": ["bKgfw1PM", "qDaZKw17", "hvxnTeJg"]}, {"partyID": "hewpABZ6", "userIDs": ["DN7YteSz", "QGilCgUy", "hbikvID2"]}], "teamID": "zMfd2y5g", "userIDs": ["95Vmyhzg", "twAiT2lK", "SDWEFLD5"]}, {"parties": [{"partyID": "amFgcoIH", "userIDs": ["C5QHOGyE", "NBjZ3DLd", "tIgh4v1e"]}, {"partyID": "M0uUcBJ5", "userIDs": ["U1F3lyXH", "HPRxMlB9", "GY2Vp70f"]}, {"partyID": "tkydNwBf", "userIDs": ["Bj4D2oYN", "N2faEVFf", "LdC4y7GT"]}], "teamID": "7RjTlNxh", "userIDs": ["KxqZRkf5", "x58nnGfc", "IWzlvziJ"]}], "textChat": true, "textChatMode": "NONE", "ticketIDs": ["UKFQIzWg", "wU7Qxgf7", "3KpM8bgg"], "tieTeamsSessionLifetime": false, "type": "S44tI8ou"}' \
    > test.out 2>&1
eval_tap $? 49 'CreateGameSession' test.out

#- 50 PublicQueryGameSessionsByAttributes
./ng net.accelbyte.sdk.cli.Main session publicQueryGameSessionsByAttributes \
    --namespace "$AB_NAMESPACE" \
    --body '{"FfhuS78S": {}, "TBga3nAe": {}, "905t9mB9": {}}' \
    > test.out 2>&1
eval_tap $? 50 'PublicQueryGameSessionsByAttributes' test.out

#- 51 PublicSessionJoinCode
./ng net.accelbyte.sdk.cli.Main session publicSessionJoinCode \
    --namespace "$AB_NAMESPACE" \
    --body '{"code": "j2UkppBe"}' \
    > test.out 2>&1
eval_tap $? 51 'PublicSessionJoinCode' test.out

#- 52 GetGameSessionByPodName
./ng net.accelbyte.sdk.cli.Main session getGameSessionByPodName \
    --namespace "$AB_NAMESPACE" \
    --podName 'LpK6QVOu' \
    > test.out 2>&1
eval_tap $? 52 'GetGameSessionByPodName' test.out

#- 53 GetGameSession
./ng net.accelbyte.sdk.cli.Main session getGameSession \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'T34hIjYH' \
    > test.out 2>&1
eval_tap $? 53 'GetGameSession' test.out

#- 54 UpdateGameSession
./ng net.accelbyte.sdk.cli.Main session updateGameSession \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'H3AeygFl' \
    --body '{"attributes": {"6Sw1DOQA": {}, "n0orjEhR": {}, "rSPTkzgt": {}}, "backfillTicketID": "SK2fhBCE", "clientVersion": "59ntN6HM", "deployment": "hwoTDVWL", "fallbackClaimKeys": ["ywrxW8p8", "gfoOlvDu", "Oxz97f1X"], "inactiveTimeout": 58, "inviteTimeout": 76, "joinability": "8gGE1Kte", "matchPool": "sEZmELMu", "maxPlayers": 95, "minPlayers": 37, "preferredClaimKeys": ["9sKkWNH2", "JfZYtFaC", "zH9HyVWh"], "requestedRegions": ["PhWGVG6W", "ZHINzvl5", "Wt4sUYX1"], "teams": [{"parties": [{"partyID": "R0ttvHKK", "userIDs": ["m8V0C7MR", "YQsJO16R", "Icqg8FfN"]}, {"partyID": "afmp0uP3", "userIDs": ["eELkkkAQ", "PKCFnY0Q", "uN35egFb"]}, {"partyID": "pjJcUcFQ", "userIDs": ["A8SbU8Co", "krCJosJy", "lUZ0YNC4"]}], "teamID": "KKmZQBbm", "userIDs": ["23x270kj", "KBKjjwc8", "yjFthKUb"]}, {"parties": [{"partyID": "TWmja1ws", "userIDs": ["Pq9twk41", "QYz7F9Dr", "z1JqYNAU"]}, {"partyID": "Fs2JWbu2", "userIDs": ["FqHz8lwl", "kFKPDzig", "sP7V9Gsi"]}, {"partyID": "iZYB5Eox", "userIDs": ["isUAYvAG", "UrZin31x", "j0f9RG1B"]}], "teamID": "dQPDwdjN", "userIDs": ["7KKFHUnT", "oo0uGjqX", "4rzI6e85"]}, {"parties": [{"partyID": "xW7SazoN", "userIDs": ["vDKLp2Mc", "pSKY5k2G", "kMoWOH7u"]}, {"partyID": "vQprddIR", "userIDs": ["bWLWWAKM", "U7XY1Y9g", "2Cr93GCF"]}, {"partyID": "xxOxBvHv", "userIDs": ["mmqRDcWS", "bPFZRmXI", "FhumMNnu"]}], "teamID": "eUd6tk6A", "userIDs": ["3kqljMfQ", "YRSX7uEL", "MoL0PyG8"]}], "ticketIDs": ["QCLa95Er", "tQIxxYIo", "gaPXt5vp"], "tieTeamsSessionLifetime": false, "type": "eTJFhHG1", "version": 7}' \
    > test.out 2>&1
eval_tap $? 54 'UpdateGameSession' test.out

#- 55 DeleteGameSession
./ng net.accelbyte.sdk.cli.Main session deleteGameSession \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'aRFD7yC7' \
    > test.out 2>&1
eval_tap $? 55 'DeleteGameSession' test.out

#- 56 PatchUpdateGameSession
./ng net.accelbyte.sdk.cli.Main session patchUpdateGameSession \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'lBynGvTX' \
    --body '{"attributes": {"ZZQIbc5i": {}, "mMY9ks2v": {}, "xOQP2mPP": {}}, "backfillTicketID": "MnzU2fKI", "clientVersion": "amaKrBeF", "deployment": "KUzuiqSU", "fallbackClaimKeys": ["VvLmckvx", "GyaYqAr1", "UtndI1SK"], "inactiveTimeout": 18, "inviteTimeout": 77, "joinability": "6bQqGPpE", "matchPool": "kY2JxbMd", "maxPlayers": 99, "minPlayers": 4, "preferredClaimKeys": ["5S7bkhPL", "lPwDS71a", "uF42nulX"], "requestedRegions": ["98enI6dm", "MRDOHGEm", "nPHVzDlO"], "teams": [{"parties": [{"partyID": "k8GeYxaQ", "userIDs": ["SzwN6p1I", "PDG1gUVQ", "fe1Oqq9s"]}, {"partyID": "kGxNlo0t", "userIDs": ["0jQWDxrN", "9ISKZyuf", "DBV7kF69"]}, {"partyID": "klDhNGwg", "userIDs": ["FXHYe3Ea", "O3jwrcQz", "w1sxfDoy"]}], "teamID": "zMOwmTk2", "userIDs": ["kMdAOXqW", "0DvN6Fgl", "0NEo7h6D"]}, {"parties": [{"partyID": "cpXjarRa", "userIDs": ["jiVpW5mH", "YCv4QIPp", "O1N42mMW"]}, {"partyID": "yVbJkxil", "userIDs": ["JaPRZ4j2", "QERi8Ch2", "4foB5kW2"]}, {"partyID": "J8ADILrG", "userIDs": ["MZcwzJJz", "PWLB2dEz", "mnHEOG9h"]}], "teamID": "G3aTzIQT", "userIDs": ["WiJ01788", "u4XwoMkf", "lv4buyz1"]}, {"parties": [{"partyID": "C45VZH2w", "userIDs": ["gNkL2TGu", "KSf3Wl93", "n2BpoxVw"]}, {"partyID": "qDo6fHyr", "userIDs": ["Ggq1kI5X", "FPLAgamh", "lvvXwSfh"]}, {"partyID": "h3zaKp9T", "userIDs": ["iLF3slLJ", "cynj26ID", "TOrmwoQA"]}], "teamID": "lr0SW0hw", "userIDs": ["hIJrtKYD", "5Cdr24YX", "FoUidH6d"]}], "ticketIDs": ["KIMloBtF", "lkJg9a59", "UXBkdLax"], "tieTeamsSessionLifetime": false, "type": "UO0F5pPZ", "version": 6}' \
    > test.out 2>&1
eval_tap $? 56 'PatchUpdateGameSession' test.out

#- 57 UpdateGameSessionBackfillTicketID
./ng net.accelbyte.sdk.cli.Main session updateGameSessionBackfillTicketID \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'F6bYZZRD' \
    --body '{"backfillTicketID": "TqtaZcAg"}' \
    > test.out 2>&1
eval_tap $? 57 'UpdateGameSessionBackfillTicketID' test.out

#- 58 GameSessionGenerateCode
./ng net.accelbyte.sdk.cli.Main session gameSessionGenerateCode \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'uFsLB49p' \
    > test.out 2>&1
eval_tap $? 58 'GameSessionGenerateCode' test.out

#- 59 PublicRevokeGameSessionCode
./ng net.accelbyte.sdk.cli.Main session publicRevokeGameSessionCode \
    --namespace "$AB_NAMESPACE" \
    --sessionId '1GcJsnBv' \
    > test.out 2>&1
eval_tap $? 59 'PublicRevokeGameSessionCode' test.out

#- 60 PublicGameSessionInvite
./ng net.accelbyte.sdk.cli.Main session publicGameSessionInvite \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'arTz3HCi' \
    --body '{"metadata": {"fbFCPeaB": "hfhZPpEO", "lVGtW7YN": "bmyIVweT", "NmoGOGQA": "QTiow4XD"}, "platformID": "6i0BanMI", "userID": "pvlBJAKJ"}' \
    > test.out 2>&1
eval_tap $? 60 'PublicGameSessionInvite' test.out

#- 61 JoinGameSession
./ng net.accelbyte.sdk.cli.Main session joinGameSession \
    --namespace "$AB_NAMESPACE" \
    --sessionId '3pOhDALE' \
    > test.out 2>&1
eval_tap $? 61 'JoinGameSession' test.out

#- 62 PublicPromoteGameSessionLeader
./ng net.accelbyte.sdk.cli.Main session publicPromoteGameSessionLeader \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'dbwcJcdx' \
    --body '{"leaderID": "wmlrvzBf"}' \
    > test.out 2>&1
eval_tap $? 62 'PublicPromoteGameSessionLeader' test.out

#- 63 LeaveGameSession
./ng net.accelbyte.sdk.cli.Main session leaveGameSession \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'vPZrlAH7' \
    > test.out 2>&1
eval_tap $? 63 'LeaveGameSession' test.out

#- 64 PublicKickGameSessionMember
./ng net.accelbyte.sdk.cli.Main session publicKickGameSessionMember \
    --memberId '0fEyNm4i' \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'alpDo4Mr' \
    > test.out 2>&1
eval_tap $? 64 'PublicKickGameSessionMember' test.out

#- 65 PublicGameSessionReject
./ng net.accelbyte.sdk.cli.Main session publicGameSessionReject \
    --namespace "$AB_NAMESPACE" \
    --sessionId '0rlm4kLz' \
    > test.out 2>&1
eval_tap $? 65 'PublicGameSessionReject' test.out

#- 66 GetSessionServerSecret
./ng net.accelbyte.sdk.cli.Main session getSessionServerSecret \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'itXHS4kH' \
    > test.out 2>&1
eval_tap $? 66 'GetSessionServerSecret' test.out

#- 67 AppendTeamGameSession
eval_tap 0 67 'AppendTeamGameSession # SKIP deprecated' test.out

#- 68 PublicGameSessionCancel
./ng net.accelbyte.sdk.cli.Main session publicGameSessionCancel \
    --namespace "$AB_NAMESPACE" \
    --sessionId '3ndrf7wQ' \
    --userId 'SUWFKt0w' \
    > test.out 2>&1
eval_tap $? 68 'PublicGameSessionCancel' test.out

#- 69 PublicPartyJoinCode
./ng net.accelbyte.sdk.cli.Main session publicPartyJoinCode \
    --namespace "$AB_NAMESPACE" \
    --body '{"code": "GlAKLn22"}' \
    > test.out 2>&1
eval_tap $? 69 'PublicPartyJoinCode' test.out

#- 70 PublicGetParty
./ng net.accelbyte.sdk.cli.Main session publicGetParty \
    --namespace "$AB_NAMESPACE" \
    --partyId 'v68KVqa2' \
    > test.out 2>&1
eval_tap $? 70 'PublicGetParty' test.out

#- 71 PublicUpdateParty
./ng net.accelbyte.sdk.cli.Main session publicUpdateParty \
    --namespace "$AB_NAMESPACE" \
    --partyId 'pV3UHPuS' \
    --body '{"attributes": {"FydcDW4S": {}, "5oaniewV": {}, "f2Qi5vAL": {}}, "inactiveTimeout": 100, "inviteTimeout": 70, "joinability": "QaYK6cKC", "maxPlayers": 10, "minPlayers": 33, "type": "9Opr9lsm", "version": 68}' \
    > test.out 2>&1
eval_tap $? 71 'PublicUpdateParty' test.out

#- 72 PublicPatchUpdateParty
./ng net.accelbyte.sdk.cli.Main session publicPatchUpdateParty \
    --namespace "$AB_NAMESPACE" \
    --partyId 'RILsb873' \
    --body '{"attributes": {"v66a2MAT": {}, "fXm9wzFt": {}, "MoyYEpzN": {}}, "inactiveTimeout": 97, "inviteTimeout": 95, "joinability": "Yn4Jka5m", "maxPlayers": 74, "minPlayers": 48, "type": "9vQ7QQl2", "version": 67}' \
    > test.out 2>&1
eval_tap $? 72 'PublicPatchUpdateParty' test.out

#- 73 PublicGeneratePartyCode
./ng net.accelbyte.sdk.cli.Main session publicGeneratePartyCode \
    --namespace "$AB_NAMESPACE" \
    --partyId 'EOF8OZjC' \
    > test.out 2>&1
eval_tap $? 73 'PublicGeneratePartyCode' test.out

#- 74 PublicRevokePartyCode
./ng net.accelbyte.sdk.cli.Main session publicRevokePartyCode \
    --namespace "$AB_NAMESPACE" \
    --partyId '0On64LyI' \
    > test.out 2>&1
eval_tap $? 74 'PublicRevokePartyCode' test.out

#- 75 PublicPartyInvite
./ng net.accelbyte.sdk.cli.Main session publicPartyInvite \
    --namespace "$AB_NAMESPACE" \
    --partyId 'UMxhSkSt' \
    --body '{"metadata": {"dVyz46Ui": "jAS7O0EZ", "8BZZzu2A": "VTsGSUpI", "iZmcPaA2": "FIlONfmB"}, "platformID": "R7hCfY7B", "userID": "LLtpBeQ3"}' \
    > test.out 2>&1
eval_tap $? 75 'PublicPartyInvite' test.out

#- 76 PublicPromotePartyLeader
./ng net.accelbyte.sdk.cli.Main session publicPromotePartyLeader \
    --namespace "$AB_NAMESPACE" \
    --partyId 'AtKvniVw' \
    --body '{"leaderID": "8DQn2am8"}' \
    > test.out 2>&1
eval_tap $? 76 'PublicPromotePartyLeader' test.out

#- 77 PublicReadPartySessionStorage
./ng net.accelbyte.sdk.cli.Main session publicReadPartySessionStorage \
    --namespace "$AB_NAMESPACE" \
    --partyId 'VTWpoonr' \
    > test.out 2>&1
eval_tap $? 77 'PublicReadPartySessionStorage' test.out

#- 78 PublicUpdateInsertPartySessionStorageReserved
./ng net.accelbyte.sdk.cli.Main session publicUpdateInsertPartySessionStorageReserved \
    --namespace "$AB_NAMESPACE" \
    --partyId 'vvUHZSqW' \
    --userId 'rq4neiGS' \
    --body '{"kqQYXH0G": {}, "wv7kLQ0z": {}, "ano8fCfT": {}}' \
    > test.out 2>&1
eval_tap $? 78 'PublicUpdateInsertPartySessionStorageReserved' test.out

#- 79 PublicPartyJoin
./ng net.accelbyte.sdk.cli.Main session publicPartyJoin \
    --namespace "$AB_NAMESPACE" \
    --partyId 't0hc5o0R' \
    > test.out 2>&1
eval_tap $? 79 'PublicPartyJoin' test.out

#- 80 PublicPartyLeave
./ng net.accelbyte.sdk.cli.Main session publicPartyLeave \
    --namespace "$AB_NAMESPACE" \
    --partyId 'jzypiyii' \
    > test.out 2>&1
eval_tap $? 80 'PublicPartyLeave' test.out

#- 81 PublicPartyReject
./ng net.accelbyte.sdk.cli.Main session publicPartyReject \
    --namespace "$AB_NAMESPACE" \
    --partyId '9AimtClL' \
    > test.out 2>&1
eval_tap $? 81 'PublicPartyReject' test.out

#- 82 PublicPartyCancel
./ng net.accelbyte.sdk.cli.Main session publicPartyCancel \
    --namespace "$AB_NAMESPACE" \
    --partyId 'V0JdILlB' \
    --userId 'oH04LAs1' \
    > test.out 2>&1
eval_tap $? 82 'PublicPartyCancel' test.out

#- 83 PublicPartyKick
./ng net.accelbyte.sdk.cli.Main session publicPartyKick \
    --namespace "$AB_NAMESPACE" \
    --partyId '7JsXhZNr' \
    --userId 'aIiDFZfW' \
    > test.out 2>&1
eval_tap $? 83 'PublicPartyKick' test.out

#- 84 PublicCreateParty
./ng net.accelbyte.sdk.cli.Main session publicCreateParty \
    --namespace "$AB_NAMESPACE" \
    --body '{"attributes": {"SXK1Ez2S": {}, "zaqsNpT1": {}, "6h41zxXO": {}}, "configurationName": "TDb4vvgf", "inactiveTimeout": 65, "inviteTimeout": 64, "joinability": "7vH0ZwJx", "maxPlayers": 6, "members": [{"ID": "YajftyL0", "PlatformID": "aBNynT9d", "PlatformUserID": "kguMivBh"}, {"ID": "klv39O8e", "PlatformID": "I6ZSprsn", "PlatformUserID": "cc90ayhw"}, {"ID": "iPSyHidJ", "PlatformID": "LSMplJuy", "PlatformUserID": "H59ISUvY"}], "minPlayers": 56, "textChat": false, "type": "JSv3tV9T"}' \
    > test.out 2>&1
eval_tap $? 84 'PublicCreateParty' test.out

#- 85 PublicGetRecentPlayer
./ng net.accelbyte.sdk.cli.Main session publicGetRecentPlayer \
    --namespace "$AB_NAMESPACE" \
    --limit '50' \
    > test.out 2>&1
eval_tap $? 85 'PublicGetRecentPlayer' test.out

#- 86 PublicGetRecentTeamPlayer
./ng net.accelbyte.sdk.cli.Main session publicGetRecentTeamPlayer \
    --namespace "$AB_NAMESPACE" \
    --limit '26' \
    > test.out 2>&1
eval_tap $? 86 'PublicGetRecentTeamPlayer' test.out

#- 87 PublicUpdateInsertSessionStorageLeader
./ng net.accelbyte.sdk.cli.Main session publicUpdateInsertSessionStorageLeader \
    --namespace "$AB_NAMESPACE" \
    --sessionId '2jPbMInv' \
    --body '{"rEYqLULV": {}, "oGs4ZcHu": {}, "2WnRpvSI": {}}' \
    > test.out 2>&1
eval_tap $? 87 'PublicUpdateInsertSessionStorageLeader' test.out

#- 88 PublicUpdateInsertSessionStorage
./ng net.accelbyte.sdk.cli.Main session publicUpdateInsertSessionStorage \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'EgooaRpn' \
    --userId 'PLJFLBjy' \
    --body '{"NcOwGA9A": {}, "lzrv7X3B": {}, "nvJ6pat2": {}}' \
    > test.out 2>&1
eval_tap $? 88 'PublicUpdateInsertSessionStorage' test.out

#- 89 PublicGetBulkPlayerCurrentPlatform
./ng net.accelbyte.sdk.cli.Main session publicGetBulkPlayerCurrentPlatform \
    --namespace "$AB_NAMESPACE" \
    --body '{"userIDs": ["RJmLjdAY", "imqYiASe", "zxTDyeN3"]}' \
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
    --body '{"crossplayEnabled": false, "currentPlatform": "yMYZKAdx", "data": {"caajhtza": {}, "BzVnBgxO": {}, "nKE9n8nW": {}}, "platforms": [{"name": "85jVWzkN", "userID": "y3m7DC9k"}, {"name": "i1lemYZV", "userID": "ZxzHp3wR"}, {"name": "iKcYIjsj", "userID": "ibQNgcfB"}], "roles": ["FkRPk2mx", "8uo2V6gd", "jXc80TUi"], "simultaneousPlatform": "TYk3SsRz"}' \
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
    --order 'pamjWL2c' \
    --orderBy 'pJNlkESp' \
    --status '14W9XuiB' \
    > test.out 2>&1
eval_tap $? 93 'PublicQueryMyGameSessions' test.out

#- 94 PublicQueryMyParties
./ng net.accelbyte.sdk.cli.Main session publicQueryMyParties \
    --namespace "$AB_NAMESPACE" \
    --order 'V5GA0c4x' \
    --orderBy 'jfpT01B3' \
    --status 'xMmNld0s' \
    > test.out 2>&1
eval_tap $? 94 'PublicQueryMyParties' test.out


rm -f "tmp.dat"

exit $EXIT_CODE