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
echo "1..80"

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

#- 4 AdminGetDSMCConfigurationDefault
./ng net.accelbyte.sdk.cli.Main session adminGetDSMCConfigurationDefault \
    > test.out 2>&1
eval_tap $? 4 'AdminGetDSMCConfigurationDefault' test.out

#- 5 AdminListEnvironmentVariables
./ng net.accelbyte.sdk.cli.Main session adminListEnvironmentVariables \
    > test.out 2>&1
eval_tap $? 5 'AdminListEnvironmentVariables' test.out

#- 6 AdminListGlobalConfiguration
./ng net.accelbyte.sdk.cli.Main session adminListGlobalConfiguration \
    > test.out 2>&1
eval_tap $? 6 'AdminListGlobalConfiguration' test.out

#- 7 AdminUpdateGlobalConfiguration
./ng net.accelbyte.sdk.cli.Main session adminUpdateGlobalConfiguration \
    --body '{"regionRetryMapping": {"oZkXrS5X": ["7sRWwJ9l", "zWwgnR2e", "TNnrdc0c"], "ECQpbMlT": ["imfz9Bdd", "VnqChrmj", "A6EO9ZOX"], "sas4tFvd": ["l96tHjeS", "Ou9o3qrK", "B0IB44CC"]}, "regionURLMapping": ["j8wEOnFg", "W2Xi3Kon", "fpoeONIg"], "testGameMode": "ovpRQrlM", "testRegionURLMapping": ["l7p2XF2v", "oH7aYSYQ", "pMrG1yGw"], "testTargetUserIDs": ["O2Oy4aZE", "hPEYFs5G", "sR0YSs8A"]}' \
    > test.out 2>&1
eval_tap $? 7 'AdminUpdateGlobalConfiguration' test.out

#- 8 AdminDeleteGlobalConfiguration
./ng net.accelbyte.sdk.cli.Main session adminDeleteGlobalConfiguration \
    > test.out 2>&1
eval_tap $? 8 'AdminDeleteGlobalConfiguration' test.out

#- 9 AdminGetConfigurationAlertV1
./ng net.accelbyte.sdk.cli.Main session adminGetConfigurationAlertV1 \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 9 'AdminGetConfigurationAlertV1' test.out

#- 10 AdminUpdateConfigurationAlertV1
./ng net.accelbyte.sdk.cli.Main session adminUpdateConfigurationAlertV1 \
    --namespace "$AB_NAMESPACE" \
    --body '{"durationDays": 81}' \
    > test.out 2>&1
eval_tap $? 10 'AdminUpdateConfigurationAlertV1' test.out

#- 11 AdminCreateConfigurationAlertV1
./ng net.accelbyte.sdk.cli.Main session adminCreateConfigurationAlertV1 \
    --namespace "$AB_NAMESPACE" \
    --body '{"durationDays": 52}' \
    > test.out 2>&1
eval_tap $? 11 'AdminCreateConfigurationAlertV1' test.out

#- 12 AdminDeleteConfigurationAlertV1
./ng net.accelbyte.sdk.cli.Main session adminDeleteConfigurationAlertV1 \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 12 'AdminDeleteConfigurationAlertV1' test.out

#- 13 HandleUploadXboxPFXCertificate
./ng net.accelbyte.sdk.cli.Main session handleUploadXboxPFXCertificate \
    --namespace "$AB_NAMESPACE" \
    --description '3VvePlyC' \
    --certname 'LNZrgNt8' \
    --file 'tmp.dat' \
    --password 'qGJYQnVY' \
    > test.out 2>&1
eval_tap $? 13 'HandleUploadXboxPFXCertificate' test.out

#- 14 AdminCreateConfigurationTemplateV1
./ng net.accelbyte.sdk.cli.Main session adminCreateConfigurationTemplateV1 \
    --namespace "$AB_NAMESPACE" \
    --body '{"NativeSessionSetting": {"PSNServiceLabel": 40, "PSNSupportedPlatforms": ["znMYW4uk", "IpA0PJUH", "M3dfAJoL"], "SessionTitle": "Bo59J94X", "ShouldSync": false, "XboxAllowCrossPlatform": true, "XboxSandboxID": "OYeV6TFP", "XboxServiceConfigID": "x6lfaVVe", "XboxSessionTemplateName": "p1NOHrLM", "XboxTitleID": "CVMgQFoB", "localizedSessionName": {"lWuPzdhk": {}, "ejBjgXuv": {}, "gCVcEkfS": {}}}, "PSNBaseUrl": "nskP5K3U", "attributes": {"Dobbv0HP": {}, "201mMW6d": {}, "6of5bd67": {}}, "autoJoin": true, "autoLeaveSession": true, "clientVersion": "PkGiYR0i", "deployment": "ZIvRKxse", "disableCodeGeneration": false, "dsManualSetReady": false, "dsSource": "phsxlRgQ", "enableSecret": true, "fallbackClaimKeys": ["VBguINxe", "lndZm7BK", "SAaHfq4U"], "immutableStorage": false, "inactiveTimeout": 49, "inviteTimeout": 6, "joinability": "aNFD84hP", "leaderElectionGracePeriod": 48, "manualRejoin": false, "maxActiveSessions": 96, "maxPlayers": 8, "minPlayers": 95, "name": "5QgfPLTg", "persistent": true, "preferredClaimKeys": ["QJUVjfC6", "ornsEBOT", "XUU955Ph"], "requestedRegions": ["MZYzO3Tf", "aXBQFH17", "0WE2VwXX"], "textChat": false, "tieTeamsSessionLifetime": true, "type": "NcPh3fk1"}' \
    > test.out 2>&1
eval_tap $? 14 'AdminCreateConfigurationTemplateV1' test.out

#- 15 AdminGetAllConfigurationTemplatesV1
./ng net.accelbyte.sdk.cli.Main session adminGetAllConfigurationTemplatesV1 \
    --namespace "$AB_NAMESPACE" \
    --limit '36' \
    --name 'XFH7Y4i4' \
    --offset '41' \
    --order '34cqDyKh' \
    --orderBy 'bxqr1u7j' \
    > test.out 2>&1
eval_tap $? 15 'AdminGetAllConfigurationTemplatesV1' test.out

#- 16 AdminGetConfigurationTemplateV1
./ng net.accelbyte.sdk.cli.Main session adminGetConfigurationTemplateV1 \
    --name 'xxyUVVby' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 16 'AdminGetConfigurationTemplateV1' test.out

#- 17 AdminUpdateConfigurationTemplateV1
./ng net.accelbyte.sdk.cli.Main session adminUpdateConfigurationTemplateV1 \
    --name 'tEMMS51R' \
    --namespace "$AB_NAMESPACE" \
    --body '{"NativeSessionSetting": {"PSNServiceLabel": 77, "PSNSupportedPlatforms": ["QcJRT74d", "pAnK3WHB", "KQP4o3FY"], "SessionTitle": "TiNRacVp", "ShouldSync": false, "XboxAllowCrossPlatform": true, "XboxSandboxID": "2ZKnOvq1", "XboxServiceConfigID": "jLUZpG7W", "XboxSessionTemplateName": "fvLnywvd", "XboxTitleID": "L27AelAF", "localizedSessionName": {"zV2LdBDu": {}, "blA99arb": {}, "61AhQMWr": {}}}, "PSNBaseUrl": "qDgUWX3j", "attributes": {"RAAobkFW": {}, "JvcSsxc5": {}, "N9qHuTmT": {}}, "autoJoin": true, "autoLeaveSession": false, "clientVersion": "snVSLVw4", "deployment": "VS6gqpHf", "disableCodeGeneration": false, "dsManualSetReady": true, "dsSource": "AfOz8Mst", "enableSecret": true, "fallbackClaimKeys": ["XQxoyUmW", "fLylezjU", "RptKcvvm"], "immutableStorage": false, "inactiveTimeout": 40, "inviteTimeout": 83, "joinability": "I12Q1aRp", "leaderElectionGracePeriod": 93, "manualRejoin": true, "maxActiveSessions": 17, "maxPlayers": 1, "minPlayers": 14, "name": "D6FIVGME", "persistent": false, "preferredClaimKeys": ["7t1Pr0IV", "Y5n70Z55", "AQnShJWK"], "requestedRegions": ["zbGiaygY", "ykxmyN08", "BIrthI5s"], "textChat": false, "tieTeamsSessionLifetime": true, "type": "KHGXhQYH"}' \
    > test.out 2>&1
eval_tap $? 17 'AdminUpdateConfigurationTemplateV1' test.out

#- 18 AdminDeleteConfigurationTemplateV1
./ng net.accelbyte.sdk.cli.Main session adminDeleteConfigurationTemplateV1 \
    --name 'MB4hBQpm' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 18 'AdminDeleteConfigurationTemplateV1' test.out

#- 19 AdminGetMemberActiveSession
./ng net.accelbyte.sdk.cli.Main session adminGetMemberActiveSession \
    --name 'xjaY1Yf5' \
    --namespace "$AB_NAMESPACE" \
    --userId 'usvfDTvd' \
    > test.out 2>&1
eval_tap $? 19 'AdminGetMemberActiveSession' test.out

#- 20 AdminReconcileMaxActiveSession
./ng net.accelbyte.sdk.cli.Main session adminReconcileMaxActiveSession \
    --name 'xoL7fwBw' \
    --namespace "$AB_NAMESPACE" \
    --body '{"userID": "tOSUkXQv"}' \
    > test.out 2>&1
eval_tap $? 20 'AdminReconcileMaxActiveSession' test.out

#- 21 AdminGetDSMCConfiguration
./ng net.accelbyte.sdk.cli.Main session adminGetDSMCConfiguration \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 21 'AdminGetDSMCConfiguration' test.out

#- 22 AdminSyncDSMCConfiguration
./ng net.accelbyte.sdk.cli.Main session adminSyncDSMCConfiguration \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 22 'AdminSyncDSMCConfiguration' test.out

#- 23 AdminQueryGameSessions
./ng net.accelbyte.sdk.cli.Main session adminQueryGameSessions \
    --namespace "$AB_NAMESPACE" \
    --configurationName 'bg053EYb' \
    --dsPodName 'q1bMLDRG' \
    --fromTime 'vZriIrLE' \
    --gameMode 'gpP3UKPv' \
    --isPersistent 'jTX0rQzQ' \
    --isSoftDeleted 'Xb7ZqafV' \
    --joinability 'xlIdjSmp' \
    --limit '26' \
    --matchPool '9IZhq23l' \
    --memberID 'jf6EqN8P' \
    --offset '55' \
    --order 'vNFGUbqc' \
    --orderBy 'XjkLbWMh' \
    --sessionID 'CKoZhQIU' \
    --status '3Ta6B8Dl' \
    --statusV2 'twaC7MxY' \
    --toTime '6kWKLSCy' \
    > test.out 2>&1
eval_tap $? 23 'AdminQueryGameSessions' test.out

#- 24 AdminQueryGameSessionsByAttributes
./ng net.accelbyte.sdk.cli.Main session adminQueryGameSessionsByAttributes \
    --namespace "$AB_NAMESPACE" \
    --body '{"P6l3sjjD": {}, "7aZi0VwA": {}, "iTzKAYAt": {}}' \
    > test.out 2>&1
eval_tap $? 24 'AdminQueryGameSessionsByAttributes' test.out

#- 25 AdminDeleteBulkGameSessions
./ng net.accelbyte.sdk.cli.Main session adminDeleteBulkGameSessions \
    --namespace "$AB_NAMESPACE" \
    --body '{"ids": ["jJFCJIMS", "CHMPvW0Q", "8SIzF8Ph"]}' \
    > test.out 2>&1
eval_tap $? 25 'AdminDeleteBulkGameSessions' test.out

#- 26 AdminSetDSReady
./ng net.accelbyte.sdk.cli.Main session adminSetDSReady \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'JiChbcdT' \
    --body '{"ready": false}' \
    > test.out 2>&1
eval_tap $? 26 'AdminSetDSReady' test.out

#- 27 AdminUpdateGameSessionMember
./ng net.accelbyte.sdk.cli.Main session adminUpdateGameSessionMember \
    --memberId 'R9QfZ2Sd' \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'OF0Rns57' \
    --statusType 'Z6xY7XCY' \
    > test.out 2>&1
eval_tap $? 27 'AdminUpdateGameSessionMember' test.out

#- 28 AdminGetListNativeSession
./ng net.accelbyte.sdk.cli.Main session adminGetListNativeSession \
    --namespace "$AB_NAMESPACE" \
    --limit '88' \
    --offset '60' \
    --order 'kKcWVDz8' \
    > test.out 2>&1
eval_tap $? 28 'AdminGetListNativeSession' test.out

#- 29 AdminQueryParties
./ng net.accelbyte.sdk.cli.Main session adminQueryParties \
    --namespace "$AB_NAMESPACE" \
    --isSoftDeleted 'AWT606ob' \
    --joinability 'gPyXkPJS' \
    --key 'aPlIAISy' \
    --leaderID 'ihNtaYrZ' \
    --limit '79' \
    --memberID 'URosFOLI' \
    --memberStatus 'GwQ4i0Sv' \
    --offset '85' \
    --order 'egn4mBJI' \
    --orderBy 'xYDFtIKe' \
    --partyID 'LOvncxRb' \
    --value 'LlhQxjbV' \
    > test.out 2>&1
eval_tap $? 29 'AdminQueryParties' test.out

#- 30 AdminGetPlatformCredentials
./ng net.accelbyte.sdk.cli.Main session adminGetPlatformCredentials \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 30 'AdminGetPlatformCredentials' test.out

#- 31 AdminUpdatePlatformCredentials
./ng net.accelbyte.sdk.cli.Main session adminUpdatePlatformCredentials \
    --namespace "$AB_NAMESPACE" \
    --body '{"psn": {"clientId": "4YHQrRfz", "clientSecret": "cmnlE43k", "scope": "vvH5dLSq"}}' \
    > test.out 2>&1
eval_tap $? 31 'AdminUpdatePlatformCredentials' test.out

#- 32 AdminDeletePlatformCredentials
./ng net.accelbyte.sdk.cli.Main session adminDeletePlatformCredentials \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 32 'AdminDeletePlatformCredentials' test.out

#- 33 AdminGetRecentPlayer
./ng net.accelbyte.sdk.cli.Main session adminGetRecentPlayer \
    --namespace "$AB_NAMESPACE" \
    --limit '86' \
    --userId 'YlUuEz0d' \
    > test.out 2>&1
eval_tap $? 33 'AdminGetRecentPlayer' test.out

#- 34 AdminGetRecentTeamPlayer
./ng net.accelbyte.sdk.cli.Main session adminGetRecentTeamPlayer \
    --namespace "$AB_NAMESPACE" \
    --limit '27' \
    --userId 'BvzOc5jT' \
    > test.out 2>&1
eval_tap $? 34 'AdminGetRecentTeamPlayer' test.out

#- 35 AdminReadSessionStorage
./ng net.accelbyte.sdk.cli.Main session adminReadSessionStorage \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'Zon9ZNVG' \
    > test.out 2>&1
eval_tap $? 35 'AdminReadSessionStorage' test.out

#- 36 AdminDeleteUserSessionStorage
./ng net.accelbyte.sdk.cli.Main session adminDeleteUserSessionStorage \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'J9icoKqy' \
    > test.out 2>&1
eval_tap $? 36 'AdminDeleteUserSessionStorage' test.out

#- 37 AdminReadUserSessionStorage
./ng net.accelbyte.sdk.cli.Main session adminReadUserSessionStorage \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'gQYyRmTR' \
    --userId 'JIBCWYzb' \
    > test.out 2>&1
eval_tap $? 37 'AdminReadUserSessionStorage' test.out

#- 38 AdminQueryPlayerAttributes
./ng net.accelbyte.sdk.cli.Main session adminQueryPlayerAttributes \
    --namespace "$AB_NAMESPACE" \
    --users 'qSiavIDw' \
    > test.out 2>&1
eval_tap $? 38 'AdminQueryPlayerAttributes' test.out

#- 39 AdminGetPlayerAttributes
./ng net.accelbyte.sdk.cli.Main session adminGetPlayerAttributes \
    --namespace "$AB_NAMESPACE" \
    --userId '3rAiw1Mo' \
    > test.out 2>&1
eval_tap $? 39 'AdminGetPlayerAttributes' test.out

#- 40 CreateGameSession
./ng net.accelbyte.sdk.cli.Main session createGameSession \
    --namespace "$AB_NAMESPACE" \
    --body '{"attributes": {"oFYughaY": {}, "6YKm2na3": {}, "0Xt9C1V8": {}}, "autoJoin": true, "backfillTicketID": "wZEXpDW8", "clientVersion": "Co0JLld1", "configurationName": "9kDvPJoR", "deployment": "trfqMNaQ", "dsSource": "UhnpGgGV", "fallbackClaimKeys": ["x2kHnMD8", "2Ogl2HUn", "k5KjK2Gm"], "inactiveTimeout": 21, "inviteTimeout": 18, "joinability": "WX3piuHv", "matchPool": "b4ivxTVW", "maxPlayers": 41, "minPlayers": 7, "preferredClaimKeys": ["B5hizqMp", "vikqs5np", "nWk4jOXm"], "requestedRegions": ["YFVdWXFm", "TtwsOzAS", "kEKL988z"], "serverName": "5vUtpcda", "teams": [{"UserIDs": ["tC9BKgnW", "fl03rMFp", "NvoU1b2T"], "parties": [{"partyID": "49fxgpj5", "userIDs": ["C1ZvMEfP", "BquSLnup", "djcFFUnq"]}, {"partyID": "bBG5xjPZ", "userIDs": ["tGk4i6il", "4HFcPH45", "MhW52ycu"]}, {"partyID": "Vnhgdc1P", "userIDs": ["FxTURAz2", "Cpk82CQ3", "ej7egbpu"]}]}, {"UserIDs": ["9kMh5gNh", "7c7bIKV8", "Bzii6AFb"], "parties": [{"partyID": "63zTGlkq", "userIDs": ["f6tiA2SB", "bCV8BHC4", "r2MSO2y3"]}, {"partyID": "0pZRCJwn", "userIDs": ["JgNrLxmE", "oOuUGIfJ", "JLgbnMxD"]}, {"partyID": "dK1DFO14", "userIDs": ["FGwcx3Ob", "7ZOi5Gyl", "GieTkmTn"]}]}, {"UserIDs": ["MRq2PtYp", "4umBv9pk", "VigsdDPd"], "parties": [{"partyID": "Coceop4n", "userIDs": ["P0BDNTpN", "NtVlC7Tl", "2oRJ2owg"]}, {"partyID": "7vH3Ocb3", "userIDs": ["VOehnqts", "LtULcPVA", "gV6GqJeb"]}, {"partyID": "VYjnEqh0", "userIDs": ["o2KAzOBk", "eTCCd1cF", "MytgPBEj"]}]}], "textChat": true, "ticketIDs": ["OqlphyRl", "OA6IEwrK", "LJMNBmlb"], "tieTeamsSessionLifetime": false, "type": "YM9ryiRm"}' \
    > test.out 2>&1
eval_tap $? 40 'CreateGameSession' test.out

#- 41 PublicQueryGameSessionsByAttributes
./ng net.accelbyte.sdk.cli.Main session publicQueryGameSessionsByAttributes \
    --namespace "$AB_NAMESPACE" \
    --body '{"Q9r8FOB5": {}, "XPq0EXEl": {}, "YxXsSdB8": {}}' \
    > test.out 2>&1
eval_tap $? 41 'PublicQueryGameSessionsByAttributes' test.out

#- 42 PublicSessionJoinCode
./ng net.accelbyte.sdk.cli.Main session publicSessionJoinCode \
    --namespace "$AB_NAMESPACE" \
    --body '{"code": "skUx493n"}' \
    > test.out 2>&1
eval_tap $? 42 'PublicSessionJoinCode' test.out

#- 43 GetGameSessionByPodName
./ng net.accelbyte.sdk.cli.Main session getGameSessionByPodName \
    --namespace "$AB_NAMESPACE" \
    --podName 'T6ckgz74' \
    > test.out 2>&1
eval_tap $? 43 'GetGameSessionByPodName' test.out

#- 44 GetGameSession
./ng net.accelbyte.sdk.cli.Main session getGameSession \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'Xamdn29A' \
    > test.out 2>&1
eval_tap $? 44 'GetGameSession' test.out

#- 45 UpdateGameSession
./ng net.accelbyte.sdk.cli.Main session updateGameSession \
    --namespace "$AB_NAMESPACE" \
    --sessionId '4cTZ0DDI' \
    --body '{"attributes": {"o4nmYiOF": {}, "2aKrChuC": {}, "uo0L735N": {}}, "backfillTicketID": "5MKRJhPC", "clientVersion": "THL5hYIF", "deployment": "8pwlSNte", "fallbackClaimKeys": ["xJEUZQxS", "MpBAMs2k", "alFWRcEB"], "inactiveTimeout": 78, "inviteTimeout": 57, "joinability": "KVCYCVVo", "matchPool": "LLQileOP", "maxPlayers": 27, "minPlayers": 80, "preferredClaimKeys": ["ELEiqZrA", "TFMIwmZ3", "mNTRKdCh"], "requestedRegions": ["RowOTX8C", "3WaRCNqw", "Ha4wxo2C"], "teams": [{"UserIDs": ["loaT20KN", "83CC421m", "IWisdLcU"], "parties": [{"partyID": "WWqJR8K6", "userIDs": ["lXqZevcs", "8AlnNZAQ", "0htYorSa"]}, {"partyID": "cdACheaL", "userIDs": ["lTJs80hQ", "mjRPv5rY", "LWgi2mMc"]}, {"partyID": "gFw8zPpq", "userIDs": ["7fchiORl", "h34eWBmK", "CEcWwdhJ"]}]}, {"UserIDs": ["gqc9fXGE", "bbtpxlKV", "NcZ8mhPb"], "parties": [{"partyID": "HioYpN0B", "userIDs": ["3nAcTzXA", "j048LXgA", "VRNWvzUI"]}, {"partyID": "94AuPExo", "userIDs": ["g517n7ei", "GGI5swRI", "i3yDTBGE"]}, {"partyID": "Ba4KdVzs", "userIDs": ["61GQxzHP", "6QlNb4LW", "FfPJNAh5"]}]}, {"UserIDs": ["9RaWDOKh", "HrByV2ZX", "JJCMEvN0"], "parties": [{"partyID": "3222Pw5C", "userIDs": ["uDS4kMC8", "rHNswwD2", "FHhBFGDt"]}, {"partyID": "HUvCN9ls", "userIDs": ["pO4hU5yF", "He6Wpy8p", "6s3NMsBd"]}, {"partyID": "y1Qy1o4v", "userIDs": ["QlCgSaWH", "9Rqoy3ov", "tF64kTRd"]}]}], "ticketIDs": ["FnDBrrsc", "SSOHB6io", "pbxJdAPV"], "tieTeamsSessionLifetime": false, "type": "oarMMhQM", "version": 47}' \
    > test.out 2>&1
eval_tap $? 45 'UpdateGameSession' test.out

#- 46 DeleteGameSession
./ng net.accelbyte.sdk.cli.Main session deleteGameSession \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'FveS68Jf' \
    > test.out 2>&1
eval_tap $? 46 'DeleteGameSession' test.out

#- 47 PatchUpdateGameSession
./ng net.accelbyte.sdk.cli.Main session patchUpdateGameSession \
    --namespace "$AB_NAMESPACE" \
    --sessionId '9LPLzrwQ' \
    --body '{"attributes": {"y0Qv2zxH": {}, "H5QGMMNZ": {}, "AMMjHPCZ": {}}, "backfillTicketID": "ClLgAp2x", "clientVersion": "lIxq9LQx", "deployment": "MJ3aLeNi", "fallbackClaimKeys": ["wy6dLu1R", "VqmgBUYO", "wbsDv51w"], "inactiveTimeout": 22, "inviteTimeout": 36, "joinability": "lvKCaGBh", "matchPool": "fB7aStgM", "maxPlayers": 80, "minPlayers": 93, "preferredClaimKeys": ["80rJDC5Z", "jFOnJiHv", "M8sq976B"], "requestedRegions": ["H4tGltqt", "KUPPqkLB", "Edibqh9X"], "teams": [{"UserIDs": ["u9z7f442", "d0JrYUXb", "C7R7kDjO"], "parties": [{"partyID": "iVLMMi4g", "userIDs": ["idkRSQa8", "IJegLai9", "c8ECmNwk"]}, {"partyID": "qEoZSpyG", "userIDs": ["8DIWPUP2", "f7mid1FC", "e757DHjI"]}, {"partyID": "JV1AGP3R", "userIDs": ["3LkxHKCA", "m6kWYmTU", "tpMLFUro"]}]}, {"UserIDs": ["DNRC2xDp", "7ds7PjMQ", "miNhnyJy"], "parties": [{"partyID": "bDNgw7UQ", "userIDs": ["3sz6T1yv", "LwKM1HAM", "Wivq5hW0"]}, {"partyID": "3ZCXQYAF", "userIDs": ["DORvhhD6", "o0kWggVO", "tovJR4Pw"]}, {"partyID": "NBwUKu8p", "userIDs": ["bVVT0Tvm", "PXmep0FI", "oljjtGeF"]}]}, {"UserIDs": ["9tmpsnsa", "4tErQIVh", "4af5a9sC"], "parties": [{"partyID": "EMFfNqCz", "userIDs": ["4tn90mgw", "ZnPVfdOr", "wEj7H7oH"]}, {"partyID": "H1KNkXNQ", "userIDs": ["d4h0aJxy", "rnzR1IY1", "8RfA79P3"]}, {"partyID": "vVtyRcWz", "userIDs": ["vNT12NVY", "ACNO9xFU", "xf7hsWFQ"]}]}], "ticketIDs": ["Epw4rYIB", "2d4WfYhS", "ewwChZVo"], "tieTeamsSessionLifetime": true, "type": "EfKsrbwX", "version": 16}' \
    > test.out 2>&1
eval_tap $? 47 'PatchUpdateGameSession' test.out

#- 48 UpdateGameSessionBackfillTicketID
./ng net.accelbyte.sdk.cli.Main session updateGameSessionBackfillTicketID \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'qswx1qTF' \
    --body '{"backfillTicketID": "k8WFfEja"}' \
    > test.out 2>&1
eval_tap $? 48 'UpdateGameSessionBackfillTicketID' test.out

#- 49 GameSessionGenerateCode
./ng net.accelbyte.sdk.cli.Main session gameSessionGenerateCode \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'nuG80jU7' \
    > test.out 2>&1
eval_tap $? 49 'GameSessionGenerateCode' test.out

#- 50 PublicRevokeGameSessionCode
./ng net.accelbyte.sdk.cli.Main session publicRevokeGameSessionCode \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'h8J5d9JU' \
    > test.out 2>&1
eval_tap $? 50 'PublicRevokeGameSessionCode' test.out

#- 51 PublicGameSessionInvite
./ng net.accelbyte.sdk.cli.Main session publicGameSessionInvite \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'WkLUTPmM' \
    --body '{"platformID": "mJF6Fk83", "userID": "F0I6183h"}' \
    > test.out 2>&1
eval_tap $? 51 'PublicGameSessionInvite' test.out

#- 52 JoinGameSession
./ng net.accelbyte.sdk.cli.Main session joinGameSession \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'gf56zTFg' \
    > test.out 2>&1
eval_tap $? 52 'JoinGameSession' test.out

#- 53 PublicPromoteGameSessionLeader
./ng net.accelbyte.sdk.cli.Main session publicPromoteGameSessionLeader \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'aP04grJB' \
    --body '{"leaderID": "deJdDrJa"}' \
    > test.out 2>&1
eval_tap $? 53 'PublicPromoteGameSessionLeader' test.out

#- 54 LeaveGameSession
./ng net.accelbyte.sdk.cli.Main session leaveGameSession \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'JNs3ASaM' \
    > test.out 2>&1
eval_tap $? 54 'LeaveGameSession' test.out

#- 55 PublicGameSessionReject
./ng net.accelbyte.sdk.cli.Main session publicGameSessionReject \
    --namespace "$AB_NAMESPACE" \
    --sessionId '0zYYuvAp' \
    > test.out 2>&1
eval_tap $? 55 'PublicGameSessionReject' test.out

#- 56 GetSessionServerSecret
./ng net.accelbyte.sdk.cli.Main session getSessionServerSecret \
    --namespace "$AB_NAMESPACE" \
    --sessionId '2cBu78F1' \
    > test.out 2>&1
eval_tap $? 56 'GetSessionServerSecret' test.out

#- 57 AppendTeamGameSession
./ng net.accelbyte.sdk.cli.Main session appendTeamGameSession \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'CcsaGnn2' \
    --body '{"additionalMembers": [{"partyID": "RLquUrtu", "userIDs": ["nBuHU6IH", "c7agCe8g", "agIeDKjx"]}, {"partyID": "SqY0jma7", "userIDs": ["LD4At1Iq", "3JXGv9Ec", "uRX3Zetp"]}, {"partyID": "6ElqD5QB", "userIDs": ["lXoEpxOY", "zHG61CuZ", "v1ZVqCVF"]}], "proposedTeams": [{"UserIDs": ["oOVEvGSa", "6QRyzS0X", "iA20Z8Ux"], "parties": [{"partyID": "FXmvb2NN", "userIDs": ["ObnDOrJL", "BU6xk8Jg", "3zZpHNdp"]}, {"partyID": "GD9MjMWk", "userIDs": ["hDCIFZQK", "w6bTaDeX", "PzDjaJx0"]}, {"partyID": "xxl9xHsu", "userIDs": ["ktmJWkPY", "OhzHit94", "TIwHTNhW"]}]}, {"UserIDs": ["1N17aeiG", "3AvqKtKZ", "P0qNjlP8"], "parties": [{"partyID": "AkQ4IY9c", "userIDs": ["J0hKyYf8", "Sf3foRJP", "velNNdpt"]}, {"partyID": "xyFoAXpx", "userIDs": ["gK4mRSVx", "9Bt4VFlZ", "hUymmSeN"]}, {"partyID": "F6uNvXol", "userIDs": ["0EcLEAby", "5hsYnSw7", "FA0gM5td"]}]}, {"UserIDs": ["NTcrPJHj", "GVhYNILh", "129HCbNY"], "parties": [{"partyID": "16jWiv9D", "userIDs": ["xcx4gBxC", "BrGPMmri", "slDS6Cz2"]}, {"partyID": "ORdc6skA", "userIDs": ["4UpZ4Y3I", "acypQ6Wq", "K0T4p0Lh"]}, {"partyID": "pAsTAQ5U", "userIDs": ["RnlEt2NJ", "WriBtYFy", "75GzLghr"]}]}], "version": 83}' \
    > test.out 2>&1
eval_tap $? 57 'AppendTeamGameSession' test.out

#- 58 PublicPartyJoinCode
./ng net.accelbyte.sdk.cli.Main session publicPartyJoinCode \
    --namespace "$AB_NAMESPACE" \
    --body '{"code": "i8TlxNzW"}' \
    > test.out 2>&1
eval_tap $? 58 'PublicPartyJoinCode' test.out

#- 59 PublicGetParty
./ng net.accelbyte.sdk.cli.Main session publicGetParty \
    --namespace "$AB_NAMESPACE" \
    --partyId '03Bwx8cb' \
    > test.out 2>&1
eval_tap $? 59 'PublicGetParty' test.out

#- 60 PublicUpdateParty
./ng net.accelbyte.sdk.cli.Main session publicUpdateParty \
    --namespace "$AB_NAMESPACE" \
    --partyId 'qptDGJJc' \
    --body '{"attributes": {"outichDk": {}, "jmgKO0z1": {}, "d5zaz427": {}}, "inactiveTimeout": 53, "inviteTimeout": 48, "joinability": "gOpne7qc", "maxPlayers": 61, "minPlayers": 99, "type": "fHm1d87B", "version": 8}' \
    > test.out 2>&1
eval_tap $? 60 'PublicUpdateParty' test.out

#- 61 PublicPatchUpdateParty
./ng net.accelbyte.sdk.cli.Main session publicPatchUpdateParty \
    --namespace "$AB_NAMESPACE" \
    --partyId 'Ogq6m814' \
    --body '{"attributes": {"Ps5nPXcV": {}, "ei4suppO": {}, "xutRjZf2": {}}, "inactiveTimeout": 10, "inviteTimeout": 37, "joinability": "tHYkNfLL", "maxPlayers": 92, "minPlayers": 96, "type": "bTItionq", "version": 30}' \
    > test.out 2>&1
eval_tap $? 61 'PublicPatchUpdateParty' test.out

#- 62 PublicGeneratePartyCode
./ng net.accelbyte.sdk.cli.Main session publicGeneratePartyCode \
    --namespace "$AB_NAMESPACE" \
    --partyId 'QZ1a3TCc' \
    > test.out 2>&1
eval_tap $? 62 'PublicGeneratePartyCode' test.out

#- 63 PublicRevokePartyCode
./ng net.accelbyte.sdk.cli.Main session publicRevokePartyCode \
    --namespace "$AB_NAMESPACE" \
    --partyId 'CNcQEazQ' \
    > test.out 2>&1
eval_tap $? 63 'PublicRevokePartyCode' test.out

#- 64 PublicPartyInvite
./ng net.accelbyte.sdk.cli.Main session publicPartyInvite \
    --namespace "$AB_NAMESPACE" \
    --partyId 'lla8sk7p' \
    --body '{"platformID": "uh3i5KAp", "userID": "D0FrjGW1"}' \
    > test.out 2>&1
eval_tap $? 64 'PublicPartyInvite' test.out

#- 65 PublicPromotePartyLeader
./ng net.accelbyte.sdk.cli.Main session publicPromotePartyLeader \
    --namespace "$AB_NAMESPACE" \
    --partyId 'xSb43d9G' \
    --body '{"leaderID": "1lHw5tAn"}' \
    > test.out 2>&1
eval_tap $? 65 'PublicPromotePartyLeader' test.out

#- 66 PublicPartyJoin
./ng net.accelbyte.sdk.cli.Main session publicPartyJoin \
    --namespace "$AB_NAMESPACE" \
    --partyId 'mI9PuKqv' \
    > test.out 2>&1
eval_tap $? 66 'PublicPartyJoin' test.out

#- 67 PublicPartyLeave
./ng net.accelbyte.sdk.cli.Main session publicPartyLeave \
    --namespace "$AB_NAMESPACE" \
    --partyId 'mezo4GR9' \
    > test.out 2>&1
eval_tap $? 67 'PublicPartyLeave' test.out

#- 68 PublicPartyReject
./ng net.accelbyte.sdk.cli.Main session publicPartyReject \
    --namespace "$AB_NAMESPACE" \
    --partyId 'bGi0v1WZ' \
    > test.out 2>&1
eval_tap $? 68 'PublicPartyReject' test.out

#- 69 PublicPartyKick
./ng net.accelbyte.sdk.cli.Main session publicPartyKick \
    --namespace "$AB_NAMESPACE" \
    --partyId 'NJ1mbFGp' \
    --userId 'jPGQaLcz' \
    > test.out 2>&1
eval_tap $? 69 'PublicPartyKick' test.out

#- 70 PublicCreateParty
./ng net.accelbyte.sdk.cli.Main session publicCreateParty \
    --namespace "$AB_NAMESPACE" \
    --body '{"attributes": {"kpxKLR4h": {}, "zUkFZUhv": {}, "UaALwUVL": {}}, "configurationName": "u71Jox9F", "inactiveTimeout": 57, "inviteTimeout": 2, "joinability": "ayKKFr6L", "maxPlayers": 92, "members": [{"ID": "AAB7l0lN", "PlatformID": "jg53UewD", "PlatformUserID": "9Du6JMrA"}, {"ID": "c41J6khJ", "PlatformID": "tSarYWg5", "PlatformUserID": "7W1jEEQI"}, {"ID": "hjHUCSDv", "PlatformID": "WpZVOFXr", "PlatformUserID": "T7kuVbvl"}], "minPlayers": 64, "textChat": true, "type": "Lutih1f8"}' \
    > test.out 2>&1
eval_tap $? 70 'PublicCreateParty' test.out

#- 71 PublicGetRecentPlayer
./ng net.accelbyte.sdk.cli.Main session publicGetRecentPlayer \
    --namespace "$AB_NAMESPACE" \
    --limit '55' \
    > test.out 2>&1
eval_tap $? 71 'PublicGetRecentPlayer' test.out

#- 72 PublicGetRecentTeamPlayer
./ng net.accelbyte.sdk.cli.Main session publicGetRecentTeamPlayer \
    --namespace "$AB_NAMESPACE" \
    --limit '78' \
    > test.out 2>&1
eval_tap $? 72 'PublicGetRecentTeamPlayer' test.out

#- 73 PublicUpdateInsertSessionStorageLeader
./ng net.accelbyte.sdk.cli.Main session publicUpdateInsertSessionStorageLeader \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'W8xOS8S1' \
    --body '{"XF3aW2m2": {}, "FgNSALpH": {}, "mAr383rV": {}}' \
    > test.out 2>&1
eval_tap $? 73 'PublicUpdateInsertSessionStorageLeader' test.out

#- 74 PublicUpdateInsertSessionStorage
./ng net.accelbyte.sdk.cli.Main session publicUpdateInsertSessionStorage \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'jR2gEAa9' \
    --userId 'vg4GMPWe' \
    --body '{"XKh7JRhG": {}, "tpLUvcwE": {}, "TG82c3Ze": {}}' \
    > test.out 2>&1
eval_tap $? 74 'PublicUpdateInsertSessionStorage' test.out

#- 75 PublicGetBulkPlayerCurrentPlatform
./ng net.accelbyte.sdk.cli.Main session publicGetBulkPlayerCurrentPlatform \
    --namespace "$AB_NAMESPACE" \
    --body '{"userIDs": ["yTnnaJju", "u7PbH5hW", "icCppuHR"]}' \
    > test.out 2>&1
eval_tap $? 75 'PublicGetBulkPlayerCurrentPlatform' test.out

#- 76 PublicGetPlayerAttributes
./ng net.accelbyte.sdk.cli.Main session publicGetPlayerAttributes \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 76 'PublicGetPlayerAttributes' test.out

#- 77 PublicStorePlayerAttributes
./ng net.accelbyte.sdk.cli.Main session publicStorePlayerAttributes \
    --namespace "$AB_NAMESPACE" \
    --body '{"crossplayEnabled": false, "currentPlatform": "YFUQFXEG", "data": {"zeiZK90e": {}, "DKjKL1Tv": {}, "HNauRNaF": {}}, "platforms": [{"name": "8cR0nqRo", "userID": "CylCKygL"}, {"name": "XLA8VUCm", "userID": "NE2wHq8D"}, {"name": "KbQ8smSG", "userID": "7kZJPSBV"}], "roles": ["WeM0uHzI", "3CWEbNd2", "WNamwUzF"], "simultaneousPlatform": "69vO8hqP"}' \
    > test.out 2>&1
eval_tap $? 77 'PublicStorePlayerAttributes' test.out

#- 78 PublicDeletePlayerAttributes
./ng net.accelbyte.sdk.cli.Main session publicDeletePlayerAttributes \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 78 'PublicDeletePlayerAttributes' test.out

#- 79 PublicQueryMyGameSessions
./ng net.accelbyte.sdk.cli.Main session publicQueryMyGameSessions \
    --namespace "$AB_NAMESPACE" \
    --order 'QEon1ARK' \
    --orderBy '4z2GbilZ' \
    --status 'OdbpbYPl' \
    > test.out 2>&1
eval_tap $? 79 'PublicQueryMyGameSessions' test.out

#- 80 PublicQueryMyParties
./ng net.accelbyte.sdk.cli.Main session publicQueryMyParties \
    --namespace "$AB_NAMESPACE" \
    --order '70jeBiFO' \
    --orderBy 'ohGjX1iE' \
    --status 'MX2Btxhg' \
    > test.out 2>&1
eval_tap $? 80 'PublicQueryMyParties' test.out


rm -f "tmp.dat"

exit $EXIT_CODE