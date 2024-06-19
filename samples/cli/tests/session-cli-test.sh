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
echo "1..83"

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
    --body '{"logLevel": "info"}' \
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
    --body '{"regionRetryMapping": {"JjwKPTKF": ["Va809zfg", "xEDfiSAo", "pRxud92h"], "EarOTR3O": ["7nDLhWYV", "hx5qLUHP", "hzFgRBu9"], "hkfJZC5t": ["yfYy47Wa", "Pz7q9Ql1", "jTLCMO6b"]}, "regionURLMapping": ["Shmek32U", "RMRHzucF", "XBZtIzcU"], "testGameMode": "Rsb4JSyV", "testRegionURLMapping": ["yawTzszI", "cX9pyJP6", "IFRp5QDL"], "testTargetUserIDs": ["gxxQAIQF", "rA04m96n", "3dXaUIcY"]}' \
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
    --body '{"durationDays": 32}' \
    > test.out 2>&1
eval_tap $? 12 'AdminUpdateConfigurationAlertV1' test.out

#- 13 AdminCreateConfigurationAlertV1
./ng net.accelbyte.sdk.cli.Main session adminCreateConfigurationAlertV1 \
    --namespace "$AB_NAMESPACE" \
    --body '{"durationDays": 20}' \
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
    --description 'UEPhDov2' \
    --certname 'kZFEhGJD' \
    --file 'tmp.dat' \
    --password 'Dxc9kcvC' \
    > test.out 2>&1
eval_tap $? 15 'HandleUploadXboxPFXCertificate' test.out

#- 16 AdminCreateConfigurationTemplateV1
./ng net.accelbyte.sdk.cli.Main session adminCreateConfigurationTemplateV1 \
    --namespace "$AB_NAMESPACE" \
    --body '{"NativeSessionSetting": {"PSNServiceLabel": 22, "PSNSupportedPlatforms": ["MKq1wTMB", "q8YEYGYn", "qDT5Az8j"], "SessionTitle": "MsnhHQlu", "ShouldSync": false, "XboxAllowCrossPlatform": true, "XboxSandboxID": "IDXq7hbL", "XboxServiceConfigID": "bmZsxsMp", "XboxSessionTemplateName": "SNrDKbky", "XboxTitleID": "aOcA5q3E", "localizedSessionName": {"loP28dYn": {}, "eRrWLwQH": {}, "XQYHCkO6": {}}}, "PSNBaseUrl": "9qoK69PS", "attributes": {"NkRozpJk": {}, "ZWiD5lBq": {}, "SXWmHJzr": {}}, "autoJoin": false, "autoLeaveSession": true, "clientVersion": "EAXMGoWe", "customURLGRPC": "VUOS5sFc", "deployment": "6HcVxkdd", "disableCodeGeneration": true, "dsManualSetReady": false, "dsSource": "DmTflfQk", "enableSecret": true, "fallbackClaimKeys": ["PGZ4dIo2", "vxRsxF5l", "0iDfbdul"], "immutableStorage": false, "inactiveTimeout": 52, "inviteTimeout": 54, "joinability": "Sl12Zsgl", "leaderElectionGracePeriod": 31, "manualRejoin": false, "maxActiveSessions": 22, "maxPlayers": 68, "minPlayers": 93, "name": "7KQL7iY5", "persistent": false, "preferredClaimKeys": ["mrM2DL9C", "bYrBUrIl", "MFNbJY4V"], "requestedRegions": ["8KunaSj6", "TnYotBmh", "Z1gbI4cs"], "textChat": true, "tieTeamsSessionLifetime": false, "type": "fJcgD6vR"}' \
    > test.out 2>&1
eval_tap $? 16 'AdminCreateConfigurationTemplateV1' test.out

#- 17 AdminGetAllConfigurationTemplatesV1
./ng net.accelbyte.sdk.cli.Main session adminGetAllConfigurationTemplatesV1 \
    --namespace "$AB_NAMESPACE" \
    --limit '4' \
    --name 'BnaKbLOy' \
    --offset '99' \
    --order 'qQnvzB6v' \
    --orderBy '2n6au7Aw' \
    > test.out 2>&1
eval_tap $? 17 'AdminGetAllConfigurationTemplatesV1' test.out

#- 18 AdminGetConfigurationTemplateV1
./ng net.accelbyte.sdk.cli.Main session adminGetConfigurationTemplateV1 \
    --name 'UveBb36m' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 18 'AdminGetConfigurationTemplateV1' test.out

#- 19 AdminUpdateConfigurationTemplateV1
./ng net.accelbyte.sdk.cli.Main session adminUpdateConfigurationTemplateV1 \
    --name 'cxwcj4Et' \
    --namespace "$AB_NAMESPACE" \
    --body '{"NativeSessionSetting": {"PSNServiceLabel": 24, "PSNSupportedPlatforms": ["zhBh33R0", "MJmQj9IJ", "L9S0c632"], "SessionTitle": "n9eqA3TQ", "ShouldSync": true, "XboxAllowCrossPlatform": false, "XboxSandboxID": "zeTrh8vM", "XboxServiceConfigID": "RxNYm9B5", "XboxSessionTemplateName": "zD4sMEIk", "XboxTitleID": "7b82oGqd", "localizedSessionName": {"7jzQly23": {}, "tyKq0Q0j": {}, "1MaF2ayD": {}}}, "PSNBaseUrl": "gT1DTxA4", "attributes": {"4iKvMiwF": {}, "ILcEqXcm": {}, "1Lz6MVqc": {}}, "autoJoin": false, "autoLeaveSession": false, "clientVersion": "s5ajOsaK", "customURLGRPC": "QBLL6rr7", "deployment": "WqmglJ7G", "disableCodeGeneration": true, "dsManualSetReady": false, "dsSource": "0jXcsHJo", "enableSecret": true, "fallbackClaimKeys": ["aTytAE4P", "vVEsxeIs", "kzBhXko5"], "immutableStorage": true, "inactiveTimeout": 64, "inviteTimeout": 21, "joinability": "syVsuWNs", "leaderElectionGracePeriod": 64, "manualRejoin": false, "maxActiveSessions": 14, "maxPlayers": 12, "minPlayers": 44, "name": "T1Dx6pYv", "persistent": true, "preferredClaimKeys": ["dK6w2IZM", "l8xE44Y7", "MzjRLTCD"], "requestedRegions": ["Pgq29UcL", "i3ivLmOc", "4O8CqCWR"], "textChat": false, "tieTeamsSessionLifetime": false, "type": "teFkq2Z7"}' \
    > test.out 2>&1
eval_tap $? 19 'AdminUpdateConfigurationTemplateV1' test.out

#- 20 AdminDeleteConfigurationTemplateV1
./ng net.accelbyte.sdk.cli.Main session adminDeleteConfigurationTemplateV1 \
    --name '6qllJI3E' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 20 'AdminDeleteConfigurationTemplateV1' test.out

#- 21 AdminGetMemberActiveSession
./ng net.accelbyte.sdk.cli.Main session adminGetMemberActiveSession \
    --name 'pM4MYSZJ' \
    --namespace "$AB_NAMESPACE" \
    --userId 'jYbQRvmt' \
    > test.out 2>&1
eval_tap $? 21 'AdminGetMemberActiveSession' test.out

#- 22 AdminReconcileMaxActiveSession
./ng net.accelbyte.sdk.cli.Main session adminReconcileMaxActiveSession \
    --name 'CkYY9q4P' \
    --namespace "$AB_NAMESPACE" \
    --body '{"userID": "nXXvJmvj"}' \
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
    --configurationName '9Ygbszgo' \
    --dsPodName 'zX10QC8Q' \
    --fromTime 'Pg5Dq8WB' \
    --gameMode 'pEvCm6zk' \
    --isPersistent 'M7L8aCep' \
    --isSoftDeleted 'iPYRvs2C' \
    --joinability '6MnVhmOn' \
    --limit '81' \
    --matchPool 'sTEaIhzJ' \
    --memberID '1FqT1FKn' \
    --offset '72' \
    --order '1CvG8AjT' \
    --orderBy 'a6kMLwGD' \
    --sessionID 'gL1w4iKF' \
    --status 'hYTv7R91' \
    --statusV2 'Mi2xqbwV' \
    --toTime '3Ci0v0Gy' \
    > test.out 2>&1
eval_tap $? 25 'AdminQueryGameSessions' test.out

#- 26 AdminQueryGameSessionsByAttributes
./ng net.accelbyte.sdk.cli.Main session adminQueryGameSessionsByAttributes \
    --namespace "$AB_NAMESPACE" \
    --body '{"ZoFs4yq2": {}, "gPXDZ6qx": {}, "0QaWvoUV": {}}' \
    > test.out 2>&1
eval_tap $? 26 'AdminQueryGameSessionsByAttributes' test.out

#- 27 AdminDeleteBulkGameSessions
./ng net.accelbyte.sdk.cli.Main session adminDeleteBulkGameSessions \
    --namespace "$AB_NAMESPACE" \
    --body '{"ids": ["2ISR2QEV", "5WtSuD1S", "7hbWgqQO"]}' \
    > test.out 2>&1
eval_tap $? 27 'AdminDeleteBulkGameSessions' test.out

#- 28 AdminSetDSReady
./ng net.accelbyte.sdk.cli.Main session adminSetDSReady \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'BnIpeqEs' \
    --body '{"ready": true}' \
    > test.out 2>&1
eval_tap $? 28 'AdminSetDSReady' test.out

#- 29 AdminUpdateGameSessionMember
./ng net.accelbyte.sdk.cli.Main session adminUpdateGameSessionMember \
    --memberId 'kdq7nE4h' \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'IO9KGnor' \
    --statusType 'Qj9uG0sB' \
    > test.out 2>&1
eval_tap $? 29 'AdminUpdateGameSessionMember' test.out

#- 30 AdminGetListNativeSession
./ng net.accelbyte.sdk.cli.Main session adminGetListNativeSession \
    --namespace "$AB_NAMESPACE" \
    --limit '77' \
    --offset '79' \
    --order '7pAm6Iuk' \
    > test.out 2>&1
eval_tap $? 30 'AdminGetListNativeSession' test.out

#- 31 AdminQueryParties
./ng net.accelbyte.sdk.cli.Main session adminQueryParties \
    --namespace "$AB_NAMESPACE" \
    --isSoftDeleted 'bJcreKTP' \
    --joinability 'yI0fB0mz' \
    --key 'NvhECkE5' \
    --leaderID 'lLQOHM1b' \
    --limit '82' \
    --memberID 'm17XiSDR' \
    --memberStatus '6FInRDY5' \
    --offset '24' \
    --order 'UcWi3qap' \
    --orderBy 'yLfkgMVO' \
    --partyID '9fU42a8o' \
    --value 'Haap68O8' \
    > test.out 2>&1
eval_tap $? 31 'AdminQueryParties' test.out

#- 32 AdminGetPlatformCredentials
./ng net.accelbyte.sdk.cli.Main session adminGetPlatformCredentials \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 32 'AdminGetPlatformCredentials' test.out

#- 33 AdminUpdatePlatformCredentials
./ng net.accelbyte.sdk.cli.Main session adminUpdatePlatformCredentials \
    --namespace "$AB_NAMESPACE" \
    --body '{"psn": {"clientId": "THGLPSCi", "clientSecret": "GtQGqH4Z", "scope": "wWIy0hzm"}}' \
    > test.out 2>&1
eval_tap $? 33 'AdminUpdatePlatformCredentials' test.out

#- 34 AdminDeletePlatformCredentials
./ng net.accelbyte.sdk.cli.Main session adminDeletePlatformCredentials \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 34 'AdminDeletePlatformCredentials' test.out

#- 35 AdminGetRecentPlayer
./ng net.accelbyte.sdk.cli.Main session adminGetRecentPlayer \
    --namespace "$AB_NAMESPACE" \
    --limit '39' \
    --userId 'sV5RqhdP' \
    > test.out 2>&1
eval_tap $? 35 'AdminGetRecentPlayer' test.out

#- 36 AdminGetRecentTeamPlayer
./ng net.accelbyte.sdk.cli.Main session adminGetRecentTeamPlayer \
    --namespace "$AB_NAMESPACE" \
    --limit '47' \
    --userId 'eWJUgzD6' \
    > test.out 2>&1
eval_tap $? 36 'AdminGetRecentTeamPlayer' test.out

#- 37 AdminReadSessionStorage
./ng net.accelbyte.sdk.cli.Main session adminReadSessionStorage \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'xIjkv7Fd' \
    > test.out 2>&1
eval_tap $? 37 'AdminReadSessionStorage' test.out

#- 38 AdminDeleteUserSessionStorage
./ng net.accelbyte.sdk.cli.Main session adminDeleteUserSessionStorage \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'c2kjgaNT' \
    > test.out 2>&1
eval_tap $? 38 'AdminDeleteUserSessionStorage' test.out

#- 39 AdminReadUserSessionStorage
./ng net.accelbyte.sdk.cli.Main session adminReadUserSessionStorage \
    --namespace "$AB_NAMESPACE" \
    --sessionId '3IVJCk7D' \
    --userId 'y7PkhKFy' \
    > test.out 2>&1
eval_tap $? 39 'AdminReadUserSessionStorage' test.out

#- 40 AdminQueryPlayerAttributes
./ng net.accelbyte.sdk.cli.Main session adminQueryPlayerAttributes \
    --namespace "$AB_NAMESPACE" \
    --users 'SbWLgapx' \
    > test.out 2>&1
eval_tap $? 40 'AdminQueryPlayerAttributes' test.out

#- 41 AdminGetPlayerAttributes
./ng net.accelbyte.sdk.cli.Main session adminGetPlayerAttributes \
    --namespace "$AB_NAMESPACE" \
    --userId 'y5I0Qvmw' \
    > test.out 2>&1
eval_tap $? 41 'AdminGetPlayerAttributes' test.out

#- 42 AdminSyncNativeSession
./ng net.accelbyte.sdk.cli.Main session adminSyncNativeSession \
    --namespace "$AB_NAMESPACE" \
    --userId 'Ihg5VwAQ' \
    > test.out 2>&1
eval_tap $? 42 'AdminSyncNativeSession' test.out

#- 43 CreateGameSession
./ng net.accelbyte.sdk.cli.Main session createGameSession \
    --namespace "$AB_NAMESPACE" \
    --body '{"attributes": {"050wVIVQ": {}, "slDm8Osv": {}, "hBZh52j3": {}}, "autoJoin": false, "backfillTicketID": "elGt7jpG", "clientVersion": "XVVTYhkn", "configurationName": "d89Wu6nq", "customURLGRPC": "nbSRUrcv", "deployment": "i9kPlkJB", "dsSource": "qzCfr4VY", "fallbackClaimKeys": ["p3BY1J86", "fmyKmWdO", "OfBLc6wD"], "inactiveTimeout": 34, "inviteTimeout": 28, "joinability": "ibvC6Lyp", "matchPool": "tIGn95ko", "maxPlayers": 95, "minPlayers": 70, "preferredClaimKeys": ["xxK06QbE", "sNgAos3x", "iifp36aD"], "requestedRegions": ["ybfF5tTm", "YkWgWvyQ", "gZ0Fi1Rx"], "serverName": "InnsKdLM", "teams": [{"UserIDs": ["rxfTmDr1", "0bxo5sfH", "qCSzyhq7"], "parties": [{"partyID": "Bt96n3SX", "userIDs": ["gRQs1Cge", "cLISaBgp", "kijoeA6O"]}, {"partyID": "zSImAUor", "userIDs": ["1PP6n3kB", "B7poF7h6", "0tHklpEf"]}, {"partyID": "8sFZjKBw", "userIDs": ["3Lpfnegz", "LZZ0BPUV", "8IlvzuOl"]}]}, {"UserIDs": ["6rSFSoTO", "C0zO3cCE", "7KrSwSCH"], "parties": [{"partyID": "aw2SmVhv", "userIDs": ["6eDGiLIZ", "Ib5s4p8x", "y2cudW3Q"]}, {"partyID": "6Gj9iDgx", "userIDs": ["ZxWUimtn", "ajGxbZI7", "aFLLPs90"]}, {"partyID": "rTYp36Ss", "userIDs": ["Lq2WkYOm", "UhPdkL9P", "tljMUqaJ"]}]}, {"UserIDs": ["nTH3fPAn", "qyJNqj97", "DaRepLdZ"], "parties": [{"partyID": "VLJMJRMt", "userIDs": ["iCP8CyvU", "x9MjQd5d", "wdI95TME"]}, {"partyID": "4vzLRCm7", "userIDs": ["ERpRd6Do", "DwcF2Dn9", "qiQeFnx2"]}, {"partyID": "mXBIjhR5", "userIDs": ["ZtYXmERK", "lsSBiJwY", "GRygzpFH"]}]}], "textChat": true, "ticketIDs": ["1FNTK3fo", "Oz3mFy5o", "dJboeYA5"], "tieTeamsSessionLifetime": true, "type": "AQ5YIJ04"}' \
    > test.out 2>&1
eval_tap $? 43 'CreateGameSession' test.out

#- 44 PublicQueryGameSessionsByAttributes
./ng net.accelbyte.sdk.cli.Main session publicQueryGameSessionsByAttributes \
    --namespace "$AB_NAMESPACE" \
    --body '{"e7Lb7JsA": {}, "1LddC0U8": {}, "yRw1wCnt": {}}' \
    > test.out 2>&1
eval_tap $? 44 'PublicQueryGameSessionsByAttributes' test.out

#- 45 PublicSessionJoinCode
./ng net.accelbyte.sdk.cli.Main session publicSessionJoinCode \
    --namespace "$AB_NAMESPACE" \
    --body '{"code": "VqtKBQ1b"}' \
    > test.out 2>&1
eval_tap $? 45 'PublicSessionJoinCode' test.out

#- 46 GetGameSessionByPodName
./ng net.accelbyte.sdk.cli.Main session getGameSessionByPodName \
    --namespace "$AB_NAMESPACE" \
    --podName 'ThxiIrCk' \
    > test.out 2>&1
eval_tap $? 46 'GetGameSessionByPodName' test.out

#- 47 GetGameSession
./ng net.accelbyte.sdk.cli.Main session getGameSession \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'N0e0VNFE' \
    > test.out 2>&1
eval_tap $? 47 'GetGameSession' test.out

#- 48 UpdateGameSession
./ng net.accelbyte.sdk.cli.Main session updateGameSession \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'DRqHCC83' \
    --body '{"attributes": {"XDRpkPMU": {}, "8aaarbkU": {}, "XD7RRryy": {}}, "backfillTicketID": "f0cHV5XC", "clientVersion": "3GUOgDK3", "deployment": "aSBdubVz", "fallbackClaimKeys": ["DRgFMf4Y", "E7b9NhoC", "jmpKI3cz"], "inactiveTimeout": 66, "inviteTimeout": 96, "joinability": "7ff5E34B", "matchPool": "6YYEii8A", "maxPlayers": 32, "minPlayers": 22, "preferredClaimKeys": ["tvNLWOKK", "W69cp8Ko", "aq0W8E5k"], "requestedRegions": ["d7gHCQfm", "rFK2Pkjz", "viw6RJOg"], "teams": [{"UserIDs": ["zD2jNuw9", "yF6nRLEY", "YGZKFou4"], "parties": [{"partyID": "yzmCs49O", "userIDs": ["Rr2AJgNA", "5hwBRZlZ", "sPSnRbio"]}, {"partyID": "LtYYeM2g", "userIDs": ["TV5I4U51", "mV5Vza3P", "TVTuSKm1"]}, {"partyID": "O9OlaRdc", "userIDs": ["daiVtU9q", "Im1rjg3i", "J7X1TfL6"]}]}, {"UserIDs": ["PEDXwuK2", "SVJCCfTC", "efDWnEeA"], "parties": [{"partyID": "vb06Hshs", "userIDs": ["KBcB8bng", "4DLRubNf", "Cc4QRNyu"]}, {"partyID": "EU83iju6", "userIDs": ["UMS5n9St", "5ulrLK6D", "cQlZEYJ7"]}, {"partyID": "NnAL49Cx", "userIDs": ["ldMGGH6q", "yI4IA4r9", "d9TYfJLn"]}]}, {"UserIDs": ["IsFROaLs", "ZdZ0iVgQ", "jrn8GlPB"], "parties": [{"partyID": "BeNQ4f6a", "userIDs": ["oGmF4Het", "R9v3a33X", "MepIoocV"]}, {"partyID": "HEyG0rjV", "userIDs": ["bJ6QnUhi", "QK8sVNgw", "f6zoCcuH"]}, {"partyID": "fTTIGetu", "userIDs": ["3rUeMjLe", "hZ0MBeD5", "h7BwYRwR"]}]}], "ticketIDs": ["hNUAK1GD", "fV1GYmaj", "7ixoBjpN"], "tieTeamsSessionLifetime": false, "type": "yzPJtmvA", "version": 46}' \
    > test.out 2>&1
eval_tap $? 48 'UpdateGameSession' test.out

#- 49 DeleteGameSession
./ng net.accelbyte.sdk.cli.Main session deleteGameSession \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'dFWe24Uw' \
    > test.out 2>&1
eval_tap $? 49 'DeleteGameSession' test.out

#- 50 PatchUpdateGameSession
./ng net.accelbyte.sdk.cli.Main session patchUpdateGameSession \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'zTMepo3r' \
    --body '{"attributes": {"IlbKbgKU": {}, "8G8NQTMd": {}, "tFwWS9WZ": {}}, "backfillTicketID": "akNhNyi2", "clientVersion": "tiloGlmH", "deployment": "QpUUq5h9", "fallbackClaimKeys": ["GgJ5sfmj", "Om3K6dgP", "Tlh90Ely"], "inactiveTimeout": 42, "inviteTimeout": 72, "joinability": "BQb2t5hW", "matchPool": "Ix995gSg", "maxPlayers": 25, "minPlayers": 40, "preferredClaimKeys": ["y9Y3i8iP", "7qrGxtXE", "IeAQpab9"], "requestedRegions": ["578AgdRh", "My1vFYs8", "xZDgV0nQ"], "teams": [{"UserIDs": ["9AizuN6E", "DkJdvv58", "a4GV8Rs3"], "parties": [{"partyID": "D9ebFgLZ", "userIDs": ["OnZNFS0a", "FNzBVMEl", "ucX2LpxJ"]}, {"partyID": "szxnj1m8", "userIDs": ["BopcwFe5", "ZlCeutHG", "TMFnBvzh"]}, {"partyID": "k41p5QBq", "userIDs": ["vDjfRxGo", "SbiboJyE", "2qJOAVll"]}]}, {"UserIDs": ["F1upEyIM", "2Ktgc0Kd", "VW97IUn9"], "parties": [{"partyID": "Reu5YjYD", "userIDs": ["jnuGsrwG", "Ir76TFAH", "39FoHYIv"]}, {"partyID": "DoRlYBeY", "userIDs": ["5dx03Bgm", "x2H5kCgz", "KmwTYXed"]}, {"partyID": "qPvUeRMX", "userIDs": ["71wkVXEn", "QJL0MKrv", "nLs7UqDD"]}]}, {"UserIDs": ["O8qDHzxk", "vORTQ5Qp", "9QKyH2Mb"], "parties": [{"partyID": "TszVVObn", "userIDs": ["nnuJDgRz", "jCWZ0XgQ", "qv6zY5Sq"]}, {"partyID": "8meKKa3S", "userIDs": ["9bcqtOgq", "PK1UJeGf", "bahuEn0a"]}, {"partyID": "tHQfwRh9", "userIDs": ["FzDcsTDu", "G643bb1P", "7NJq18yi"]}]}], "ticketIDs": ["Zjn9W1oM", "VdbtZonT", "xEBNUU82"], "tieTeamsSessionLifetime": true, "type": "8RsDoHCQ", "version": 74}' \
    > test.out 2>&1
eval_tap $? 50 'PatchUpdateGameSession' test.out

#- 51 UpdateGameSessionBackfillTicketID
./ng net.accelbyte.sdk.cli.Main session updateGameSessionBackfillTicketID \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'uTTtbaqq' \
    --body '{"backfillTicketID": "0EnGHN29"}' \
    > test.out 2>&1
eval_tap $? 51 'UpdateGameSessionBackfillTicketID' test.out

#- 52 GameSessionGenerateCode
./ng net.accelbyte.sdk.cli.Main session gameSessionGenerateCode \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'oc8I4m5n' \
    > test.out 2>&1
eval_tap $? 52 'GameSessionGenerateCode' test.out

#- 53 PublicRevokeGameSessionCode
./ng net.accelbyte.sdk.cli.Main session publicRevokeGameSessionCode \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'JipGI28h' \
    > test.out 2>&1
eval_tap $? 53 'PublicRevokeGameSessionCode' test.out

#- 54 PublicGameSessionInvite
./ng net.accelbyte.sdk.cli.Main session publicGameSessionInvite \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'XVv23bM7' \
    --body '{"platformID": "8TWkvJaD", "userID": "44psP0ko"}' \
    > test.out 2>&1
eval_tap $? 54 'PublicGameSessionInvite' test.out

#- 55 JoinGameSession
./ng net.accelbyte.sdk.cli.Main session joinGameSession \
    --namespace "$AB_NAMESPACE" \
    --sessionId '5NtSuxjW' \
    > test.out 2>&1
eval_tap $? 55 'JoinGameSession' test.out

#- 56 PublicPromoteGameSessionLeader
./ng net.accelbyte.sdk.cli.Main session publicPromoteGameSessionLeader \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'E1ZWCXQj' \
    --body '{"leaderID": "3l3BtDz4"}' \
    > test.out 2>&1
eval_tap $? 56 'PublicPromoteGameSessionLeader' test.out

#- 57 LeaveGameSession
./ng net.accelbyte.sdk.cli.Main session leaveGameSession \
    --namespace "$AB_NAMESPACE" \
    --sessionId '801ahcz3' \
    > test.out 2>&1
eval_tap $? 57 'LeaveGameSession' test.out

#- 58 PublicGameSessionReject
./ng net.accelbyte.sdk.cli.Main session publicGameSessionReject \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'p1uiGscq' \
    > test.out 2>&1
eval_tap $? 58 'PublicGameSessionReject' test.out

#- 59 GetSessionServerSecret
./ng net.accelbyte.sdk.cli.Main session getSessionServerSecret \
    --namespace "$AB_NAMESPACE" \
    --sessionId '72b2y7QU' \
    > test.out 2>&1
eval_tap $? 59 'GetSessionServerSecret' test.out

#- 60 AppendTeamGameSession
./ng net.accelbyte.sdk.cli.Main session appendTeamGameSession \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'XVrsIlwj' \
    --body '{"additionalMembers": [{"partyID": "qLnJs2jS", "userIDs": ["x8LW9GFQ", "ryBpvc3u", "n4lqucdC"]}, {"partyID": "6tDY1cik", "userIDs": ["t09vX30o", "IXzCLKV0", "NvG4nSPS"]}, {"partyID": "WzPM5mph", "userIDs": ["Iw90l51f", "qg4cx1n4", "TQlcd3t6"]}], "proposedTeams": [{"UserIDs": ["WmD3QH3R", "eMqyjVKV", "hn68ffiG"], "parties": [{"partyID": "D7a1Vo86", "userIDs": ["6QHZSWk4", "JDnxwlMO", "26Ct4qN5"]}, {"partyID": "5dPh6ar2", "userIDs": ["8kjm0fFY", "dZTlbAHE", "GVKd1cBH"]}, {"partyID": "gUvypcv8", "userIDs": ["kahIDjxu", "UkjVXvYO", "wvZeeO3X"]}]}, {"UserIDs": ["E0tapKeD", "v1V00fZH", "GRIoFYtO"], "parties": [{"partyID": "czEnOKeT", "userIDs": ["M2sbXKVg", "JT9hh1Tw", "Yd5Hj3Yi"]}, {"partyID": "XsITpkHA", "userIDs": ["THR4Dah6", "tV3U1AVZ", "jHOY6g9b"]}, {"partyID": "FzcuUXbT", "userIDs": ["qiAdZECa", "ht56Jc2h", "KXxYGwxL"]}]}, {"UserIDs": ["R5ifCt6L", "urkbNzBu", "FAXUGl2E"], "parties": [{"partyID": "FMVRk0VP", "userIDs": ["sN4SYACL", "QCZWcghe", "8UGHlfrC"]}, {"partyID": "IYFjxe19", "userIDs": ["rinlAL70", "lcjM4tlX", "1HULSy8p"]}, {"partyID": "g49NctdH", "userIDs": ["NrBmSNaI", "DKH6WhlX", "u9NC1rrb"]}]}], "version": 41}' \
    > test.out 2>&1
eval_tap $? 60 'AppendTeamGameSession' test.out

#- 61 PublicPartyJoinCode
./ng net.accelbyte.sdk.cli.Main session publicPartyJoinCode \
    --namespace "$AB_NAMESPACE" \
    --body '{"code": "nF4BvJ47"}' \
    > test.out 2>&1
eval_tap $? 61 'PublicPartyJoinCode' test.out

#- 62 PublicGetParty
./ng net.accelbyte.sdk.cli.Main session publicGetParty \
    --namespace "$AB_NAMESPACE" \
    --partyId 'Un6SM5RI' \
    > test.out 2>&1
eval_tap $? 62 'PublicGetParty' test.out

#- 63 PublicUpdateParty
./ng net.accelbyte.sdk.cli.Main session publicUpdateParty \
    --namespace "$AB_NAMESPACE" \
    --partyId 'X3Hy4smr' \
    --body '{"attributes": {"O2C1Pfsc": {}, "UyFV8JOl": {}, "nCzQGW0b": {}}, "inactiveTimeout": 76, "inviteTimeout": 71, "joinability": "0Bd1VBHC", "maxPlayers": 6, "minPlayers": 16, "type": "27gt1qTo", "version": 91}' \
    > test.out 2>&1
eval_tap $? 63 'PublicUpdateParty' test.out

#- 64 PublicPatchUpdateParty
./ng net.accelbyte.sdk.cli.Main session publicPatchUpdateParty \
    --namespace "$AB_NAMESPACE" \
    --partyId 'jLfsDkz5' \
    --body '{"attributes": {"Ei1bYiaf": {}, "XTpFF8Dv": {}, "9ZtYnhLg": {}}, "inactiveTimeout": 38, "inviteTimeout": 9, "joinability": "ZDZuzkjv", "maxPlayers": 38, "minPlayers": 93, "type": "kcKQGZwL", "version": 49}' \
    > test.out 2>&1
eval_tap $? 64 'PublicPatchUpdateParty' test.out

#- 65 PublicGeneratePartyCode
./ng net.accelbyte.sdk.cli.Main session publicGeneratePartyCode \
    --namespace "$AB_NAMESPACE" \
    --partyId 'npNmG0ux' \
    > test.out 2>&1
eval_tap $? 65 'PublicGeneratePartyCode' test.out

#- 66 PublicRevokePartyCode
./ng net.accelbyte.sdk.cli.Main session publicRevokePartyCode \
    --namespace "$AB_NAMESPACE" \
    --partyId 'kpE3Vgrw' \
    > test.out 2>&1
eval_tap $? 66 'PublicRevokePartyCode' test.out

#- 67 PublicPartyInvite
./ng net.accelbyte.sdk.cli.Main session publicPartyInvite \
    --namespace "$AB_NAMESPACE" \
    --partyId 'ngV5PF4S' \
    --body '{"platformID": "0yqbNeag", "userID": "2yvANH0B"}' \
    > test.out 2>&1
eval_tap $? 67 'PublicPartyInvite' test.out

#- 68 PublicPromotePartyLeader
./ng net.accelbyte.sdk.cli.Main session publicPromotePartyLeader \
    --namespace "$AB_NAMESPACE" \
    --partyId 'D5FVZq3j' \
    --body '{"leaderID": "FNkbEaCx"}' \
    > test.out 2>&1
eval_tap $? 68 'PublicPromotePartyLeader' test.out

#- 69 PublicPartyJoin
./ng net.accelbyte.sdk.cli.Main session publicPartyJoin \
    --namespace "$AB_NAMESPACE" \
    --partyId 'gO5eI6As' \
    > test.out 2>&1
eval_tap $? 69 'PublicPartyJoin' test.out

#- 70 PublicPartyLeave
./ng net.accelbyte.sdk.cli.Main session publicPartyLeave \
    --namespace "$AB_NAMESPACE" \
    --partyId 'KrmLcU8n' \
    > test.out 2>&1
eval_tap $? 70 'PublicPartyLeave' test.out

#- 71 PublicPartyReject
./ng net.accelbyte.sdk.cli.Main session publicPartyReject \
    --namespace "$AB_NAMESPACE" \
    --partyId 'CbayVS1Y' \
    > test.out 2>&1
eval_tap $? 71 'PublicPartyReject' test.out

#- 72 PublicPartyKick
./ng net.accelbyte.sdk.cli.Main session publicPartyKick \
    --namespace "$AB_NAMESPACE" \
    --partyId '2fYjm5F5' \
    --userId 'x7bfWGFe' \
    > test.out 2>&1
eval_tap $? 72 'PublicPartyKick' test.out

#- 73 PublicCreateParty
./ng net.accelbyte.sdk.cli.Main session publicCreateParty \
    --namespace "$AB_NAMESPACE" \
    --body '{"attributes": {"J6AM1sBY": {}, "njXIreO4": {}, "iVsiFU2T": {}}, "configurationName": "TeUEqZ3D", "inactiveTimeout": 80, "inviteTimeout": 33, "joinability": "JeMma8IQ", "maxPlayers": 71, "members": [{"ID": "bSflq3Ln", "PlatformID": "vcWCObFx", "PlatformUserID": "C0WTCAsB"}, {"ID": "3o0mQTnO", "PlatformID": "luJyWU0t", "PlatformUserID": "aqKzFTVO"}, {"ID": "kPrYIHQV", "PlatformID": "1jD5nDJw", "PlatformUserID": "qtkc9d51"}], "minPlayers": 88, "textChat": false, "type": "0j1VgJNK"}' \
    > test.out 2>&1
eval_tap $? 73 'PublicCreateParty' test.out

#- 74 PublicGetRecentPlayer
./ng net.accelbyte.sdk.cli.Main session publicGetRecentPlayer \
    --namespace "$AB_NAMESPACE" \
    --limit '45' \
    > test.out 2>&1
eval_tap $? 74 'PublicGetRecentPlayer' test.out

#- 75 PublicGetRecentTeamPlayer
./ng net.accelbyte.sdk.cli.Main session publicGetRecentTeamPlayer \
    --namespace "$AB_NAMESPACE" \
    --limit '29' \
    > test.out 2>&1
eval_tap $? 75 'PublicGetRecentTeamPlayer' test.out

#- 76 PublicUpdateInsertSessionStorageLeader
./ng net.accelbyte.sdk.cli.Main session publicUpdateInsertSessionStorageLeader \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'oXG0cf7Q' \
    --body '{"8TGHpQpL": {}, "17FRfWx7": {}, "Iv7U1mAX": {}}' \
    > test.out 2>&1
eval_tap $? 76 'PublicUpdateInsertSessionStorageLeader' test.out

#- 77 PublicUpdateInsertSessionStorage
./ng net.accelbyte.sdk.cli.Main session publicUpdateInsertSessionStorage \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'IgoHa8SH' \
    --userId 'hZ8KMXBn' \
    --body '{"q0A69hXX": {}, "oG5lV3Wx": {}, "1ulM4Usv": {}}' \
    > test.out 2>&1
eval_tap $? 77 'PublicUpdateInsertSessionStorage' test.out

#- 78 PublicGetBulkPlayerCurrentPlatform
./ng net.accelbyte.sdk.cli.Main session publicGetBulkPlayerCurrentPlatform \
    --namespace "$AB_NAMESPACE" \
    --body '{"userIDs": ["IYu9hmBH", "AuttXCrd", "nJDEzLxJ"]}' \
    > test.out 2>&1
eval_tap $? 78 'PublicGetBulkPlayerCurrentPlatform' test.out

#- 79 PublicGetPlayerAttributes
./ng net.accelbyte.sdk.cli.Main session publicGetPlayerAttributes \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 79 'PublicGetPlayerAttributes' test.out

#- 80 PublicStorePlayerAttributes
./ng net.accelbyte.sdk.cli.Main session publicStorePlayerAttributes \
    --namespace "$AB_NAMESPACE" \
    --body '{"crossplayEnabled": true, "currentPlatform": "BZMwuMLp", "data": {"aXIMGE94": {}, "wnL1LLLo": {}, "8sMHtTt3": {}}, "platforms": [{"name": "rCGHx7cb", "userID": "aQlqN3Ga"}, {"name": "RUIPxQmD", "userID": "Wh2o21kP"}, {"name": "f4IpumaV", "userID": "PPNfN3Ey"}], "roles": ["TrTLIFXu", "Rdost33L", "jjBDumhL"], "simultaneousPlatform": "4hsZnqgR"}' \
    > test.out 2>&1
eval_tap $? 80 'PublicStorePlayerAttributes' test.out

#- 81 PublicDeletePlayerAttributes
./ng net.accelbyte.sdk.cli.Main session publicDeletePlayerAttributes \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 81 'PublicDeletePlayerAttributes' test.out

#- 82 PublicQueryMyGameSessions
./ng net.accelbyte.sdk.cli.Main session publicQueryMyGameSessions \
    --namespace "$AB_NAMESPACE" \
    --order 'lqGruU7Y' \
    --orderBy 'aICYkOzn' \
    --status '5JKy2bfQ' \
    > test.out 2>&1
eval_tap $? 82 'PublicQueryMyGameSessions' test.out

#- 83 PublicQueryMyParties
./ng net.accelbyte.sdk.cli.Main session publicQueryMyParties \
    --namespace "$AB_NAMESPACE" \
    --order 'nrE3Sp5t' \
    --orderBy 'rK22PW7Z' \
    --status 'HXYhKuyT' \
    > test.out 2>&1
eval_tap $? 83 'PublicQueryMyParties' test.out


rm -f "tmp.dat"

exit $EXIT_CODE