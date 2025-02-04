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
    --body '{"metricExcludedNamespaces": ["wQJxU6cy", "hzVavNmn", "iNzMUo5g"], "regionRetryMapping": {"v4aW0qSM": ["qhdKMFaJ", "rmy2tqD5", "FFO5qJBp"], "fcczmqnd": ["geKtzPy1", "EJ6QTSWH", "vFaUNbbN"], "104TCYHW": ["S2oTIXww", "5TonNKwe", "CQz0YSAs"]}, "regionURLMapping": ["QRAKPq4R", "y9HKVOCQ", "SUuFpeRJ"], "testGameMode": "45RtsH2Y", "testRegionURLMapping": ["s9uuZhP0", "WcuR8I1q", "1K8ewBTU"], "testTargetUserIDs": ["mB1BDki1", "dobZCIfP", "esWRnzBr"]}' \
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
    --body '{"durationDays": 97}' \
    > test.out 2>&1
eval_tap $? 12 'AdminUpdateConfigurationAlertV1' test.out

#- 13 AdminCreateConfigurationAlertV1
./ng net.accelbyte.sdk.cli.Main session adminCreateConfigurationAlertV1 \
    --namespace "$AB_NAMESPACE" \
    --body '{"durationDays": 4}' \
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
    --body '{"NativeSessionSetting": {"PSNServiceLabel": 27, "PSNSupportedPlatforms": ["YzNoQjQd", "ksVq5IFz", "wtWPNjU2"], "SessionTitle": "uq9woRpU", "ShouldSync": true, "XboxAllowCrossPlatform": true, "XboxSandboxID": "AeAN6e6Y", "XboxServiceConfigID": "ZHyJWW9h", "XboxSessionTemplateName": "aYdVlEKr", "XboxTitleID": "HpWT4EDZ", "localizedSessionName": {"ZEJHQdD3": {}, "c3L0KVf7": {}, "TRGfHZl6": {}}}, "PSNBaseUrl": "ZIUocdES", "appName": "itUG5l67", "asyncProcessDSRequest": {"async": true, "timeout": 5}, "attributes": {"6rlZSYlD": {}, "xQD1Cj3r": {}, "kBBiHHFO": {}}, "autoJoin": true, "autoLeaveSession": true, "clientVersion": "ar1BaPBy", "customURLGRPC": "9YBHpxOV", "deployment": "5T4tJDcW", "disableCodeGeneration": true, "disableResendInvite": false, "dsManualSetReady": false, "dsSource": "p84GfvKk", "enableSecret": true, "fallbackClaimKeys": ["94VbafKg", "enSatC7S", "KpqdUIxf"], "grpcSessionConfig": {"appName": "LY9nkOC0", "customURL": "BD0rzO25", "functionFlag": 55}, "immutableStorage": true, "inactiveTimeout": 85, "inviteTimeout": 64, "joinability": "JgBsNucl", "leaderElectionGracePeriod": 61, "manualRejoin": true, "maxActiveSessions": 50, "maxPlayers": 58, "minPlayers": 9, "name": "9seUau6t", "persistent": true, "preferredClaimKeys": ["FzvKPbjN", "bHbqq8Mq", "8eq513SB"], "requestedRegions": ["IqX1jH1f", "svXEYYpU", "Itsn1Ku1"], "textChat": true, "textChatMode": "GAME", "tieTeamsSessionLifetime": false, "type": "gcKVcWQ5"}' \
    > test.out 2>&1
eval_tap $? 16 'AdminCreateConfigurationTemplateV1' test.out

#- 17 AdminGetAllConfigurationTemplatesV1
./ng net.accelbyte.sdk.cli.Main session adminGetAllConfigurationTemplatesV1 \
    --namespace "$AB_NAMESPACE" \
    --limit '93' \
    --name '0j8uqtE5' \
    --offset '72' \
    --order 'ZxLfElXt' \
    --orderBy 'wCkf8vFj' \
    > test.out 2>&1
eval_tap $? 17 'AdminGetAllConfigurationTemplatesV1' test.out

#- 18 AdminGetConfigurationTemplateV1
./ng net.accelbyte.sdk.cli.Main session adminGetConfigurationTemplateV1 \
    --name 'hPbhMOZ2' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 18 'AdminGetConfigurationTemplateV1' test.out

#- 19 AdminUpdateConfigurationTemplateV1
./ng net.accelbyte.sdk.cli.Main session adminUpdateConfigurationTemplateV1 \
    --name '0oi9GRFw' \
    --namespace "$AB_NAMESPACE" \
    --body '{"NativeSessionSetting": {"PSNServiceLabel": 53, "PSNSupportedPlatforms": ["KHINACzy", "bMcGt88I", "uB0iIVKH"], "SessionTitle": "dYusv8o9", "ShouldSync": true, "XboxAllowCrossPlatform": true, "XboxSandboxID": "IOM7e6Pj", "XboxServiceConfigID": "72Bxx7FG", "XboxSessionTemplateName": "tOgqz6fz", "XboxTitleID": "ySF4139r", "localizedSessionName": {"KQTTCo5F": {}, "PQFTwfbH": {}, "tRCwY5Si": {}}}, "PSNBaseUrl": "8LlRaUTk", "appName": "ubt2PyTZ", "asyncProcessDSRequest": {"async": true, "timeout": 99}, "attributes": {"b95PPKgT": {}, "UHi9yntP": {}, "qnu6Bei9": {}}, "autoJoin": false, "autoLeaveSession": true, "clientVersion": "4bP5GSYl", "customURLGRPC": "TNWA8pyG", "deployment": "qmy7Nwhs", "disableCodeGeneration": true, "disableResendInvite": false, "dsManualSetReady": true, "dsSource": "B03j51gO", "enableSecret": true, "fallbackClaimKeys": ["bvhxkkth", "D0R5PdfA", "jvcXY5sv"], "grpcSessionConfig": {"appName": "G6qBlPG7", "customURL": "rYz5SWGp", "functionFlag": 94}, "immutableStorage": true, "inactiveTimeout": 75, "inviteTimeout": 72, "joinability": "xa2cQQDv", "leaderElectionGracePeriod": 70, "manualRejoin": false, "maxActiveSessions": 46, "maxPlayers": 65, "minPlayers": 0, "name": "5krQxMua", "persistent": true, "preferredClaimKeys": ["8MtDXIxj", "gEsQIpBW", "BW4YC9jG"], "requestedRegions": ["J1K93bvK", "PBBUTLjY", "r0aF1mWP"], "textChat": true, "textChatMode": "GAME", "tieTeamsSessionLifetime": true, "type": "RnAs0b0G"}' \
    > test.out 2>&1
eval_tap $? 19 'AdminUpdateConfigurationTemplateV1' test.out

#- 20 AdminDeleteConfigurationTemplateV1
./ng net.accelbyte.sdk.cli.Main session adminDeleteConfigurationTemplateV1 \
    --name 'IvJ0cUrM' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 20 'AdminDeleteConfigurationTemplateV1' test.out

#- 21 AdminGetMemberActiveSession
./ng net.accelbyte.sdk.cli.Main session adminGetMemberActiveSession \
    --name '1pdVxhQW' \
    --namespace "$AB_NAMESPACE" \
    --userId 'zuxIIDQy' \
    > test.out 2>&1
eval_tap $? 21 'AdminGetMemberActiveSession' test.out

#- 22 AdminReconcileMaxActiveSession
./ng net.accelbyte.sdk.cli.Main session adminReconcileMaxActiveSession \
    --name 'NleEl2kM' \
    --namespace "$AB_NAMESPACE" \
    --body '{"userID": "3ixuoK4D"}' \
    > test.out 2>&1
eval_tap $? 22 'AdminReconcileMaxActiveSession' test.out

#- 23 AdminGetDSMCConfiguration
eval_tap 0 23 'AdminGetDSMCConfiguration # SKIP deprecated' test.out

#- 24 AdminSyncDSMCConfiguration
eval_tap 0 24 'AdminSyncDSMCConfiguration # SKIP deprecated' test.out

#- 25 AdminQueryGameSessions
./ng net.accelbyte.sdk.cli.Main session adminQueryGameSessions \
    --namespace "$AB_NAMESPACE" \
    --configurationName 'LlJmfxdF' \
    --dsPodName 'R63w9QB1' \
    --fromTime 'RfTl6PmQ' \
    --gameMode 'GfTs8ILA' \
    --isPersistent 'nYvozrE1' \
    --isSoftDeleted 'acbP70Yn' \
    --joinability 'L3Hp75RO' \
    --limit '21' \
    --matchPool '45560chD' \
    --memberID 'BDoPWpOF' \
    --offset '39' \
    --order 'Rg5ixcnT' \
    --orderBy 'n3EMPBz8' \
    --sessionID 'm1crYFSl' \
    --status 'tJ21AXsL' \
    --statusV2 '4GSLzJCR' \
    --toTime 'cWJYsGRR' \
    > test.out 2>&1
eval_tap $? 25 'AdminQueryGameSessions' test.out

#- 26 AdminQueryGameSessionsByAttributes
./ng net.accelbyte.sdk.cli.Main session adminQueryGameSessionsByAttributes \
    --namespace "$AB_NAMESPACE" \
    --body '{"AENEjQ7A": {}, "77gBlFxo": {}, "sborfYeh": {}}' \
    > test.out 2>&1
eval_tap $? 26 'AdminQueryGameSessionsByAttributes' test.out

#- 27 AdminDeleteBulkGameSessions
./ng net.accelbyte.sdk.cli.Main session adminDeleteBulkGameSessions \
    --namespace "$AB_NAMESPACE" \
    --body '{"ids": ["qNV23Zng", "xEcSQnB0", "o0BeJbFG"]}' \
    > test.out 2>&1
eval_tap $? 27 'AdminDeleteBulkGameSessions' test.out

#- 28 AdminSetDSReady
./ng net.accelbyte.sdk.cli.Main session adminSetDSReady \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'PpX97BR6' \
    --body '{"ready": false}' \
    > test.out 2>&1
eval_tap $? 28 'AdminSetDSReady' test.out

#- 29 AdminUpdateDSInformation
./ng net.accelbyte.sdk.cli.Main session adminUpdateDSInformation \
    --namespace "$AB_NAMESPACE" \
    --sessionId '7XkmYlLs' \
    --body '{"clientVersion": "xBekkLLj", "createdRegion": "OlXbmVZE", "deployment": "KkMKuqbI", "description": "6tqgYl29", "gameMode": "iR4YU9pO", "ip": "zPcj6Fj2", "port": 63, "region": "r87QemOA", "serverId": "4AsrbqLK", "source": "xRdfNHAI", "status": "nzavwRXN"}' \
    > test.out 2>&1
eval_tap $? 29 'AdminUpdateDSInformation' test.out

#- 30 AdminKickGameSessionMember
./ng net.accelbyte.sdk.cli.Main session adminKickGameSessionMember \
    --memberId 'YkdQBTAI' \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'Pz0lkZgo' \
    > test.out 2>&1
eval_tap $? 30 'AdminKickGameSessionMember' test.out

#- 31 AdminUpdateGameSessionMember
./ng net.accelbyte.sdk.cli.Main session adminUpdateGameSessionMember \
    --memberId 'zlKUWveP' \
    --namespace "$AB_NAMESPACE" \
    --sessionId '5V2vHWiS' \
    --statusType 'Zpbvpfxz' \
    > test.out 2>&1
eval_tap $? 31 'AdminUpdateGameSessionMember' test.out

#- 32 AdminGetListNativeSession
./ng net.accelbyte.sdk.cli.Main session adminGetListNativeSession \
    --namespace "$AB_NAMESPACE" \
    --limit '75' \
    --offset '51' \
    --order 't15bwYOE' \
    > test.out 2>&1
eval_tap $? 32 'AdminGetListNativeSession' test.out

#- 33 AdminQueryParties
./ng net.accelbyte.sdk.cli.Main session adminQueryParties \
    --namespace "$AB_NAMESPACE" \
    --isSoftDeleted 'R6TKZ775' \
    --joinability 'HaH74krV' \
    --key 'KdiMLYb0' \
    --leaderID 'RuPSLq9B' \
    --limit '86' \
    --memberID '6jWf9QSP' \
    --memberStatus 'eRRj619E' \
    --offset '36' \
    --order 'QkgW9JuF' \
    --orderBy 'SaGT3I1J' \
    --partyID 'VwSWoyLp' \
    --value 'ttJG4MW8' \
    > test.out 2>&1
eval_tap $? 33 'AdminQueryParties' test.out

#- 34 AdminDeleteBulkParties
./ng net.accelbyte.sdk.cli.Main session adminDeleteBulkParties \
    --namespace "$AB_NAMESPACE" \
    --body '{"ids": ["gCCGO6jx", "5GVAatgM", "6N9HGdzI"]}' \
    > test.out 2>&1
eval_tap $? 34 'AdminDeleteBulkParties' test.out

#- 35 AdminReadPartySessionStorage
./ng net.accelbyte.sdk.cli.Main session adminReadPartySessionStorage \
    --namespace "$AB_NAMESPACE" \
    --partyId 'J8WHbrHs' \
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
    --body '{"psn": {"clientId": "suZMkPAc", "clientSecret": "qDYQ9vdc", "scope": "6aCci3Lz"}}' \
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
    --limit '43' \
    --userId 'xXJAkCFD' \
    > test.out 2>&1
eval_tap $? 41 'AdminGetRecentPlayer' test.out

#- 42 AdminGetRecentTeamPlayer
./ng net.accelbyte.sdk.cli.Main session adminGetRecentTeamPlayer \
    --namespace "$AB_NAMESPACE" \
    --limit '76' \
    --userId 'wTMYeVHX' \
    > test.out 2>&1
eval_tap $? 42 'AdminGetRecentTeamPlayer' test.out

#- 43 AdminReadSessionStorage
./ng net.accelbyte.sdk.cli.Main session adminReadSessionStorage \
    --namespace "$AB_NAMESPACE" \
    --sessionId '4I3fPkfX' \
    > test.out 2>&1
eval_tap $? 43 'AdminReadSessionStorage' test.out

#- 44 AdminDeleteUserSessionStorage
./ng net.accelbyte.sdk.cli.Main session adminDeleteUserSessionStorage \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'n8ocvl53' \
    > test.out 2>&1
eval_tap $? 44 'AdminDeleteUserSessionStorage' test.out

#- 45 AdminReadUserSessionStorage
./ng net.accelbyte.sdk.cli.Main session adminReadUserSessionStorage \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'EliLM75h' \
    --userId '45r5USDs' \
    > test.out 2>&1
eval_tap $? 45 'AdminReadUserSessionStorage' test.out

#- 46 AdminQueryPlayerAttributes
./ng net.accelbyte.sdk.cli.Main session adminQueryPlayerAttributes \
    --namespace "$AB_NAMESPACE" \
    --users 'sbhJiMp9' \
    > test.out 2>&1
eval_tap $? 46 'AdminQueryPlayerAttributes' test.out

#- 47 AdminGetPlayerAttributes
./ng net.accelbyte.sdk.cli.Main session adminGetPlayerAttributes \
    --namespace "$AB_NAMESPACE" \
    --userId '5Azk3egU' \
    > test.out 2>&1
eval_tap $? 47 'AdminGetPlayerAttributes' test.out

#- 48 AdminSyncNativeSession
./ng net.accelbyte.sdk.cli.Main session adminSyncNativeSession \
    --namespace "$AB_NAMESPACE" \
    --userId 'NnBdjfnH' \
    > test.out 2>&1
eval_tap $? 48 'AdminSyncNativeSession' test.out

#- 49 CreateGameSession
./ng net.accelbyte.sdk.cli.Main session createGameSession \
    --namespace "$AB_NAMESPACE" \
    --body '{"appName": "72MAeR1C", "attributes": {"G6wUY85N": {}, "0GJFozzU": {}, "y4qWP9f9": {}}, "autoJoin": true, "backfillTicketID": "n2uOiTNO", "clientVersion": "1ln6RADa", "configurationName": "LLBbMDi3", "customURLGRPC": "09cDG22N", "deployment": "LVoqGmcF", "dsSource": "57elRr5b", "fallbackClaimKeys": ["g4PvxWbJ", "YVxtckNk", "iDyvqyEt"], "inactiveTimeout": 52, "inviteTimeout": 41, "joinability": "yTHHx8jr", "matchPool": "3DnEuDuU", "maxPlayers": 29, "minPlayers": 4, "preferredClaimKeys": ["NmYUJmRh", "GqtLNmUM", "icrVwsy3"], "requestedRegions": ["c5iRKKwW", "3eDsVt6i", "MoCBIun3"], "serverName": "G0mO8Ev0", "storage": {"leader": {"E8BVSrvG": {}, "hB9poLsV": {}, "EyHMGhAb": {}}}, "teams": [{"parties": [{"partyID": "M6zlYfxc", "userIDs": ["UrnIDFqg", "1APhwm1F", "HUxbphos"]}, {"partyID": "KQNTSjUW", "userIDs": ["JNhxJsBg", "4nemWaGW", "CiwLNtaK"]}, {"partyID": "nxzWquS8", "userIDs": ["n924CyMw", "tcVTnvmx", "cyHe1qwj"]}], "teamID": "xfkZmYtQ", "userIDs": ["IGVOzRCs", "FSnAW0pN", "5j67sZFX"]}, {"parties": [{"partyID": "L4q7Cefq", "userIDs": ["f3xWs2A6", "TB1iTvGk", "MNENgr9O"]}, {"partyID": "OksdH3b3", "userIDs": ["iaomQtPa", "lQgdpJal", "m5gvEfIT"]}, {"partyID": "3beAmycA", "userIDs": ["QUzIkWI9", "WAhVnRf5", "u0m13Q1V"]}], "teamID": "lgZtvvKE", "userIDs": ["ZbGfbISK", "OWiHiFZa", "jnRJMq6v"]}, {"parties": [{"partyID": "Fgskv1XT", "userIDs": ["qf5TgW7C", "WQkulg97", "2RESsRvH"]}, {"partyID": "PrEb7J9Y", "userIDs": ["Is6JndLC", "6J9fgJpy", "pR8JCyG7"]}, {"partyID": "RhqXutgW", "userIDs": ["MthNpzYv", "nztBlMoz", "xvqVHTaC"]}], "teamID": "8OdAeu9n", "userIDs": ["9Q8uC9Ck", "w4NzemvR", "XWi2cKts"]}], "textChat": false, "textChatMode": "TEAM", "ticketIDs": ["pPirnutA", "YDzSLO4w", "0FqEkO9q"], "tieTeamsSessionLifetime": false, "type": "cqHWQyx5"}' \
    > test.out 2>&1
eval_tap $? 49 'CreateGameSession' test.out

#- 50 PublicQueryGameSessionsByAttributes
./ng net.accelbyte.sdk.cli.Main session publicQueryGameSessionsByAttributes \
    --namespace "$AB_NAMESPACE" \
    --body '{"6PamJNlD": {}, "A9CdR2sN": {}, "hg2qewAd": {}}' \
    > test.out 2>&1
eval_tap $? 50 'PublicQueryGameSessionsByAttributes' test.out

#- 51 PublicSessionJoinCode
./ng net.accelbyte.sdk.cli.Main session publicSessionJoinCode \
    --namespace "$AB_NAMESPACE" \
    --body '{"code": "2Ce9spl6"}' \
    > test.out 2>&1
eval_tap $? 51 'PublicSessionJoinCode' test.out

#- 52 GetGameSessionByPodName
./ng net.accelbyte.sdk.cli.Main session getGameSessionByPodName \
    --namespace "$AB_NAMESPACE" \
    --podName '8dAi7Hgg' \
    > test.out 2>&1
eval_tap $? 52 'GetGameSessionByPodName' test.out

#- 53 GetGameSession
./ng net.accelbyte.sdk.cli.Main session getGameSession \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'ACuhV53f' \
    > test.out 2>&1
eval_tap $? 53 'GetGameSession' test.out

#- 54 UpdateGameSession
./ng net.accelbyte.sdk.cli.Main session updateGameSession \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'uXwWYelw' \
    --body '{"attributes": {"ulcWeuOt": {}, "Q0LAJjRh": {}, "gt0ybY69": {}}, "backfillTicketID": "lu5hrg7i", "clientVersion": "z8CkXEJ8", "deployment": "imTNIIwI", "fallbackClaimKeys": ["i3nPImyQ", "k5nnnyWS", "TFyQguyL"], "inactiveTimeout": 12, "inviteTimeout": 27, "joinability": "i4XqLCDV", "matchPool": "FraCEk25", "maxPlayers": 13, "minPlayers": 8, "preferredClaimKeys": ["Cp9BXUiE", "knfULOAn", "MrSaU2H1"], "requestedRegions": ["ZHpo2hbC", "rEeKveZ8", "FrqspESU"], "teams": [{"parties": [{"partyID": "JYEyFH3G", "userIDs": ["bxdbhoLO", "JtKtyoO1", "4AYdhfka"]}, {"partyID": "cZETJVGD", "userIDs": ["fEnDSmKr", "jHlulC0f", "JxoMwFIO"]}, {"partyID": "MyAVG3mL", "userIDs": ["WZJ5gIxE", "kZjpbjmm", "cTotcN1d"]}], "teamID": "b7yHHM1W", "userIDs": ["ctX0DeTf", "i7W4RrZb", "pL1l2Rxv"]}, {"parties": [{"partyID": "K8TXG065", "userIDs": ["hfRSWFds", "S6AI6dQG", "K9tB3sn4"]}, {"partyID": "VyXQjoBJ", "userIDs": ["GlUkZnN5", "S762Qoil", "BTQUjx8a"]}, {"partyID": "MFAgcuYn", "userIDs": ["gTCn2Xb1", "iA8V2HE4", "lPQbEgvs"]}], "teamID": "ZL9qxm1I", "userIDs": ["KumI7HCg", "GShlHj1e", "IIgEnN9k"]}, {"parties": [{"partyID": "Ms968mPF", "userIDs": ["p3V5G8Vc", "VN70DLRS", "Pf18kgJP"]}, {"partyID": "Amngd9NS", "userIDs": ["W1PSV5eo", "yDsWUpCB", "8QJ9lNUC"]}, {"partyID": "XXJgvH9J", "userIDs": ["Q9wVI1EL", "vlAEcfQr", "j7ywqmNK"]}], "teamID": "nfFWjK7K", "userIDs": ["sWT5FxL0", "wVbqUfgZ", "WbHw6Td2"]}], "ticketIDs": ["wL6cJWTX", "19IyqnW0", "F88ZDOcT"], "tieTeamsSessionLifetime": false, "type": "cHx8HUB7", "version": 16}' \
    > test.out 2>&1
eval_tap $? 54 'UpdateGameSession' test.out

#- 55 DeleteGameSession
./ng net.accelbyte.sdk.cli.Main session deleteGameSession \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'otmXxNj1' \
    > test.out 2>&1
eval_tap $? 55 'DeleteGameSession' test.out

#- 56 PatchUpdateGameSession
./ng net.accelbyte.sdk.cli.Main session patchUpdateGameSession \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'pcj4e1P7' \
    --body '{"attributes": {"F8u8iSfG": {}, "VXq7mINA": {}, "M2NmLodB": {}}, "backfillTicketID": "5fbFZ3NL", "clientVersion": "1L7V2sOi", "deployment": "o9kPnoCB", "fallbackClaimKeys": ["VyylBjy4", "6KmeB0f2", "c7LxHLIe"], "inactiveTimeout": 0, "inviteTimeout": 83, "joinability": "xuufmToY", "matchPool": "ISNkmEPz", "maxPlayers": 89, "minPlayers": 2, "preferredClaimKeys": ["jSzE76Uf", "w0fl7h9s", "R94yxpdC"], "requestedRegions": ["gB13JOPi", "OMnYX8hp", "7Y9rVRcm"], "teams": [{"parties": [{"partyID": "ueNkDqM1", "userIDs": ["X68IrX29", "iNp6FoJJ", "BsHZcqBT"]}, {"partyID": "aOKjyhHw", "userIDs": ["qzHk5xDJ", "Ykle8FNc", "NJicgOti"]}, {"partyID": "lrSh3VpF", "userIDs": ["KZKJJLXp", "xwxE3EQa", "wrAdETKR"]}], "teamID": "EHjkqDcN", "userIDs": ["eq7n8gPK", "zZ0UaFcu", "iqAc7GDB"]}, {"parties": [{"partyID": "eCCJ3TMt", "userIDs": ["nu4Y6NQu", "hES8wLRb", "z95MIrlL"]}, {"partyID": "HjE23U31", "userIDs": ["N5dZvCaM", "PBNjWRfJ", "DJqySObx"]}, {"partyID": "5tMuu3u3", "userIDs": ["l5DdnKLJ", "IbQcz5yb", "PTxmxT0v"]}], "teamID": "Q0fZj6Rh", "userIDs": ["kmvQAK7A", "WpdgSJEu", "H4HOxeiQ"]}, {"parties": [{"partyID": "0voDfE64", "userIDs": ["GN2HdTnl", "e31lK9bV", "wCb82vuV"]}, {"partyID": "vFk0SJyC", "userIDs": ["99uv89qc", "NJ7FtV7n", "KPxmvULo"]}, {"partyID": "w4862VyQ", "userIDs": ["M049xCVc", "bahVpvwI", "ixPEzvw8"]}], "teamID": "BnqqSOON", "userIDs": ["mk7ZmuO1", "zCYygOaO", "tc3mtHjN"]}], "ticketIDs": ["Oe5M8GRP", "33MuHDkE", "WvDiHyvu"], "tieTeamsSessionLifetime": false, "type": "vqI2qY65", "version": 95}' \
    > test.out 2>&1
eval_tap $? 56 'PatchUpdateGameSession' test.out

#- 57 UpdateGameSessionBackfillTicketID
./ng net.accelbyte.sdk.cli.Main session updateGameSessionBackfillTicketID \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'qrec9QrS' \
    --body '{"backfillTicketID": "w3fESrhr"}' \
    > test.out 2>&1
eval_tap $? 57 'UpdateGameSessionBackfillTicketID' test.out

#- 58 GameSessionGenerateCode
./ng net.accelbyte.sdk.cli.Main session gameSessionGenerateCode \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'Znrqsp6F' \
    > test.out 2>&1
eval_tap $? 58 'GameSessionGenerateCode' test.out

#- 59 PublicRevokeGameSessionCode
./ng net.accelbyte.sdk.cli.Main session publicRevokeGameSessionCode \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'YfdVSHO3' \
    > test.out 2>&1
eval_tap $? 59 'PublicRevokeGameSessionCode' test.out

#- 60 PublicGameSessionInvite
./ng net.accelbyte.sdk.cli.Main session publicGameSessionInvite \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'kULPXa2h' \
    --body '{"metadata": {"LWB4Qp1s": "oSCrcOhh", "R1yP2ZzV": "phJXCf04", "G4NFLJZL": "ajw7jjhC"}, "platformID": "jdXBOWGS", "userID": "fxa0w8W2"}' \
    > test.out 2>&1
eval_tap $? 60 'PublicGameSessionInvite' test.out

#- 61 JoinGameSession
./ng net.accelbyte.sdk.cli.Main session joinGameSession \
    --namespace "$AB_NAMESPACE" \
    --sessionId '2VZBFe66' \
    > test.out 2>&1
eval_tap $? 61 'JoinGameSession' test.out

#- 62 PublicPromoteGameSessionLeader
./ng net.accelbyte.sdk.cli.Main session publicPromoteGameSessionLeader \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'bYIDQgNV' \
    --body '{"leaderID": "vZXtBMR5"}' \
    > test.out 2>&1
eval_tap $? 62 'PublicPromoteGameSessionLeader' test.out

#- 63 LeaveGameSession
./ng net.accelbyte.sdk.cli.Main session leaveGameSession \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'YrOw8sYv' \
    > test.out 2>&1
eval_tap $? 63 'LeaveGameSession' test.out

#- 64 PublicKickGameSessionMember
./ng net.accelbyte.sdk.cli.Main session publicKickGameSessionMember \
    --memberId 'HDJIfTIr' \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'CDCqB9wm' \
    > test.out 2>&1
eval_tap $? 64 'PublicKickGameSessionMember' test.out

#- 65 PublicGameSessionReject
./ng net.accelbyte.sdk.cli.Main session publicGameSessionReject \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'vCGPVo9D' \
    > test.out 2>&1
eval_tap $? 65 'PublicGameSessionReject' test.out

#- 66 GetSessionServerSecret
./ng net.accelbyte.sdk.cli.Main session getSessionServerSecret \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'xTMuYGHl' \
    > test.out 2>&1
eval_tap $? 66 'GetSessionServerSecret' test.out

#- 67 AppendTeamGameSession
eval_tap 0 67 'AppendTeamGameSession # SKIP deprecated' test.out

#- 68 PublicGameSessionCancel
./ng net.accelbyte.sdk.cli.Main session publicGameSessionCancel \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'J4g8Uw2I' \
    --userId 'xQFaCLYd' \
    > test.out 2>&1
eval_tap $? 68 'PublicGameSessionCancel' test.out

#- 69 PublicPartyJoinCode
./ng net.accelbyte.sdk.cli.Main session publicPartyJoinCode \
    --namespace "$AB_NAMESPACE" \
    --body '{"code": "OsF8hC1e"}' \
    > test.out 2>&1
eval_tap $? 69 'PublicPartyJoinCode' test.out

#- 70 PublicGetParty
./ng net.accelbyte.sdk.cli.Main session publicGetParty \
    --namespace "$AB_NAMESPACE" \
    --partyId 'hnhX6JfX' \
    > test.out 2>&1
eval_tap $? 70 'PublicGetParty' test.out

#- 71 PublicUpdateParty
./ng net.accelbyte.sdk.cli.Main session publicUpdateParty \
    --namespace "$AB_NAMESPACE" \
    --partyId 'YaOSlrOL' \
    --body '{"attributes": {"Iciz4sX5": {}, "DMzdy1Tt": {}, "7fCFJn7H": {}}, "inactiveTimeout": 68, "inviteTimeout": 56, "joinability": "QV1oCLSZ", "maxPlayers": 40, "minPlayers": 5, "type": "G9SkUB2E", "version": 81}' \
    > test.out 2>&1
eval_tap $? 71 'PublicUpdateParty' test.out

#- 72 PublicPatchUpdateParty
./ng net.accelbyte.sdk.cli.Main session publicPatchUpdateParty \
    --namespace "$AB_NAMESPACE" \
    --partyId 'MtE6VtuX' \
    --body '{"attributes": {"LuhrqF8w": {}, "VBOkS0tl": {}, "xkMimoxy": {}}, "inactiveTimeout": 82, "inviteTimeout": 16, "joinability": "afQSWBMs", "maxPlayers": 48, "minPlayers": 13, "type": "fimrOCcp", "version": 24}' \
    > test.out 2>&1
eval_tap $? 72 'PublicPatchUpdateParty' test.out

#- 73 PublicGeneratePartyCode
./ng net.accelbyte.sdk.cli.Main session publicGeneratePartyCode \
    --namespace "$AB_NAMESPACE" \
    --partyId 'yu0Uluhx' \
    > test.out 2>&1
eval_tap $? 73 'PublicGeneratePartyCode' test.out

#- 74 PublicRevokePartyCode
./ng net.accelbyte.sdk.cli.Main session publicRevokePartyCode \
    --namespace "$AB_NAMESPACE" \
    --partyId '6m3fm7nM' \
    > test.out 2>&1
eval_tap $? 74 'PublicRevokePartyCode' test.out

#- 75 PublicPartyInvite
./ng net.accelbyte.sdk.cli.Main session publicPartyInvite \
    --namespace "$AB_NAMESPACE" \
    --partyId 'gVaDxiPp' \
    --body '{"metadata": {"YB7VFn9c": "MjdLX5zR", "lVwKs9dT": "ZHI4Z48P", "tLsqzZwc": "a5ZDG7nh"}, "platformID": "HabWCcaV", "userID": "CSqHEtp3"}' \
    > test.out 2>&1
eval_tap $? 75 'PublicPartyInvite' test.out

#- 76 PublicPromotePartyLeader
./ng net.accelbyte.sdk.cli.Main session publicPromotePartyLeader \
    --namespace "$AB_NAMESPACE" \
    --partyId 'pDvDEcZs' \
    --body '{"leaderID": "ZWxxlEZN"}' \
    > test.out 2>&1
eval_tap $? 76 'PublicPromotePartyLeader' test.out

#- 77 PublicReadPartySessionStorage
./ng net.accelbyte.sdk.cli.Main session publicReadPartySessionStorage \
    --namespace "$AB_NAMESPACE" \
    --partyId 'g32se30H' \
    > test.out 2>&1
eval_tap $? 77 'PublicReadPartySessionStorage' test.out

#- 78 PublicUpdateInsertPartySessionStorageReserved
./ng net.accelbyte.sdk.cli.Main session publicUpdateInsertPartySessionStorageReserved \
    --namespace "$AB_NAMESPACE" \
    --partyId 'vCoeLuo7' \
    --userId 'VQguyK9L' \
    --body '{"bcyIsxk5": {}, "rIGXupWZ": {}, "2oaT6umK": {}}' \
    > test.out 2>&1
eval_tap $? 78 'PublicUpdateInsertPartySessionStorageReserved' test.out

#- 79 PublicPartyJoin
./ng net.accelbyte.sdk.cli.Main session publicPartyJoin \
    --namespace "$AB_NAMESPACE" \
    --partyId 'GXfwBBs3' \
    > test.out 2>&1
eval_tap $? 79 'PublicPartyJoin' test.out

#- 80 PublicPartyLeave
./ng net.accelbyte.sdk.cli.Main session publicPartyLeave \
    --namespace "$AB_NAMESPACE" \
    --partyId 'IpJB8kZU' \
    > test.out 2>&1
eval_tap $? 80 'PublicPartyLeave' test.out

#- 81 PublicPartyReject
./ng net.accelbyte.sdk.cli.Main session publicPartyReject \
    --namespace "$AB_NAMESPACE" \
    --partyId 'bCnqZfJs' \
    > test.out 2>&1
eval_tap $? 81 'PublicPartyReject' test.out

#- 82 PublicPartyCancel
./ng net.accelbyte.sdk.cli.Main session publicPartyCancel \
    --namespace "$AB_NAMESPACE" \
    --partyId '6m6mlwye' \
    --userId '4AC27Bfk' \
    > test.out 2>&1
eval_tap $? 82 'PublicPartyCancel' test.out

#- 83 PublicPartyKick
./ng net.accelbyte.sdk.cli.Main session publicPartyKick \
    --namespace "$AB_NAMESPACE" \
    --partyId 'PQn5zxL0' \
    --userId 'SXJUAOmS' \
    > test.out 2>&1
eval_tap $? 83 'PublicPartyKick' test.out

#- 84 PublicCreateParty
./ng net.accelbyte.sdk.cli.Main session publicCreateParty \
    --namespace "$AB_NAMESPACE" \
    --body '{"attributes": {"KwRsqaUH": {}, "mVXOvSjs": {}, "6x1kr0ki": {}}, "configurationName": "oEoXrQuG", "inactiveTimeout": 16, "inviteTimeout": 60, "joinability": "yMMoIyfF", "maxPlayers": 57, "members": [{"ID": "wqmvhPzW", "PlatformID": "Ux3ClL5Y", "PlatformUserID": "SCYWGyxw"}, {"ID": "DVchLPpe", "PlatformID": "B2JXPD2J", "PlatformUserID": "V8z13rUY"}, {"ID": "gIt9ISwq", "PlatformID": "rtSXyJmg", "PlatformUserID": "R9vn5vsk"}], "minPlayers": 82, "textChat": false, "type": "jaaN4nyS"}' \
    > test.out 2>&1
eval_tap $? 84 'PublicCreateParty' test.out

#- 85 PublicGetRecentPlayer
./ng net.accelbyte.sdk.cli.Main session publicGetRecentPlayer \
    --namespace "$AB_NAMESPACE" \
    --limit '65' \
    > test.out 2>&1
eval_tap $? 85 'PublicGetRecentPlayer' test.out

#- 86 PublicGetRecentTeamPlayer
./ng net.accelbyte.sdk.cli.Main session publicGetRecentTeamPlayer \
    --namespace "$AB_NAMESPACE" \
    --limit '2' \
    > test.out 2>&1
eval_tap $? 86 'PublicGetRecentTeamPlayer' test.out

#- 87 PublicUpdateInsertSessionStorageLeader
./ng net.accelbyte.sdk.cli.Main session publicUpdateInsertSessionStorageLeader \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'GOI23GtX' \
    --body '{"tBOUGOug": {}, "FeC46UZk": {}, "hTc04wp0": {}}' \
    > test.out 2>&1
eval_tap $? 87 'PublicUpdateInsertSessionStorageLeader' test.out

#- 88 PublicUpdateInsertSessionStorage
./ng net.accelbyte.sdk.cli.Main session publicUpdateInsertSessionStorage \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'WIumjzv6' \
    --userId 'EscImy4z' \
    --body '{"TzkUcftf": {}, "T3PB8VFV": {}, "oVQCu4XN": {}}' \
    > test.out 2>&1
eval_tap $? 88 'PublicUpdateInsertSessionStorage' test.out

#- 89 PublicGetBulkPlayerCurrentPlatform
./ng net.accelbyte.sdk.cli.Main session publicGetBulkPlayerCurrentPlatform \
    --namespace "$AB_NAMESPACE" \
    --body '{"userIDs": ["NlVGQATS", "vx57SPDr", "nZ3lCzZX"]}' \
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
    --body '{"crossplayEnabled": true, "currentPlatform": "QPImLB8z", "data": {"Ou3yxhps": {}, "vjAzn6ip": {}, "Hl7QrDjN": {}}, "platforms": [{"name": "sDHQziV7", "userID": "KzEZK0Bi"}, {"name": "g7SUapyS", "userID": "HWSMmQgt"}, {"name": "bi0rTWyo", "userID": "Xwldm7nT"}], "roles": ["eUv4YCrV", "qDyQJFL8", "0chwrY4e"], "simultaneousPlatform": "dhsnJcCI"}' \
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
    --order 'x9KKaUhf' \
    --orderBy 'upZU4bqO' \
    --status 'e0t7EF7A' \
    > test.out 2>&1
eval_tap $? 93 'PublicQueryMyGameSessions' test.out

#- 94 PublicQueryMyParties
./ng net.accelbyte.sdk.cli.Main session publicQueryMyParties \
    --namespace "$AB_NAMESPACE" \
    --order 'B1tbe19y' \
    --orderBy 'O2TVke38' \
    --status 'kxJk23Q8' \
    > test.out 2>&1
eval_tap $? 94 'PublicQueryMyParties' test.out


rm -f "tmp.dat"

exit $EXIT_CODE