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
echo "1..93"

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
    --body '{"logLevel": "warning"}' \
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
    --body '{"metricExcludedNamespaces": ["1OWeMolN", "CpxTQaNz", "eJ28ufCX"], "regionRetryMapping": {"oyoEaMqL": ["su8r0wWq", "wIMgBTxN", "lPeIwYtc"], "WrmVz3nr": ["p8NoBzca", "xFCUAvgY", "kDHzX8Oh"], "72zQ15kI": ["spFCAUNg", "IVkUuPL3", "XRTXS0Ra"]}, "regionURLMapping": ["xDjoOfqH", "wG9UfajQ", "fvV0l8VQ"], "testGameMode": "oWTItTrG", "testRegionURLMapping": ["rjUo9CUA", "CQfv3D2P", "IWjotBZn"], "testTargetUserIDs": ["y9pIhhYx", "E6sQbkTf", "awJrtfFN"]}' \
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
    --body '{"durationDays": 9}' \
    > test.out 2>&1
eval_tap $? 12 'AdminUpdateConfigurationAlertV1' test.out

#- 13 AdminCreateConfigurationAlertV1
./ng net.accelbyte.sdk.cli.Main session adminCreateConfigurationAlertV1 \
    --namespace "$AB_NAMESPACE" \
    --body '{"durationDays": 98}' \
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
    --body '{"NativeSessionSetting": {"PSNServiceLabel": 49, "PSNSupportedPlatforms": ["YRM1wgyD", "vMyD3exi", "eC193s1p"], "SessionTitle": "6h6OBDeG", "ShouldSync": false, "XboxAllowCrossPlatform": true, "XboxSandboxID": "yrKTKTcw", "XboxServiceConfigID": "HfvPISi1", "XboxSessionTemplateName": "MF2m6k0q", "XboxTitleID": "yPYU78ha", "localizedSessionName": {"BlkPFMe3": {}, "HjchrtYc": {}, "mNFwXRm2": {}}}, "PSNBaseUrl": "UH0oK2fZ", "appName": "brseEFtW", "attributes": {"O5v7YQjK": {}, "ixwg731G": {}, "iNLrN8iE": {}}, "autoJoin": false, "autoLeaveSession": false, "clientVersion": "5dmfd421", "customURLGRPC": "ygor9247", "deployment": "mIG1BVoC", "disableCodeGeneration": true, "disableResendInvite": false, "dsManualSetReady": true, "dsSource": "GB68QAPT", "enableSecret": false, "fallbackClaimKeys": ["MIlomqdL", "kPEg8oVc", "F6AyIoQP"], "grpcSessionConfig": {"appName": "7Mkaktw7", "customURL": "pR5tBmlY", "functionFlag": 90}, "immutableStorage": true, "inactiveTimeout": 90, "inviteTimeout": 65, "joinability": "CbDJo0GN", "leaderElectionGracePeriod": 37, "manualRejoin": true, "maxActiveSessions": 75, "maxPlayers": 53, "minPlayers": 83, "name": "VCYoiZkb", "persistent": false, "preferredClaimKeys": ["DCRltGHn", "bIyRo6jk", "xVx0v6Yy"], "requestedRegions": ["zbgQ8ggF", "sjrBTDLh", "mSn6cyTo"], "textChat": false, "tieTeamsSessionLifetime": false, "type": "uh7RMhbw"}' \
    > test.out 2>&1
eval_tap $? 16 'AdminCreateConfigurationTemplateV1' test.out

#- 17 AdminGetAllConfigurationTemplatesV1
./ng net.accelbyte.sdk.cli.Main session adminGetAllConfigurationTemplatesV1 \
    --namespace "$AB_NAMESPACE" \
    --limit '1' \
    --name 'FdRN9hkF' \
    --offset '7' \
    --order 'ptwJQUJd' \
    --orderBy '7SlsRZaD' \
    > test.out 2>&1
eval_tap $? 17 'AdminGetAllConfigurationTemplatesV1' test.out

#- 18 AdminGetConfigurationTemplateV1
./ng net.accelbyte.sdk.cli.Main session adminGetConfigurationTemplateV1 \
    --name 'rbSFXD4E' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 18 'AdminGetConfigurationTemplateV1' test.out

#- 19 AdminUpdateConfigurationTemplateV1
./ng net.accelbyte.sdk.cli.Main session adminUpdateConfigurationTemplateV1 \
    --name '6rwToYqX' \
    --namespace "$AB_NAMESPACE" \
    --body '{"NativeSessionSetting": {"PSNServiceLabel": 59, "PSNSupportedPlatforms": ["6jQlAhoQ", "Oy0DvhMh", "eHae1lHC"], "SessionTitle": "AhKffyQQ", "ShouldSync": true, "XboxAllowCrossPlatform": false, "XboxSandboxID": "OKj1M4D3", "XboxServiceConfigID": "TMZ1hnd1", "XboxSessionTemplateName": "HcC50vki", "XboxTitleID": "Y5jyJ3i6", "localizedSessionName": {"W5WwBvOD": {}, "FbnOQJmV": {}, "1t4HODDR": {}}}, "PSNBaseUrl": "NkUsunIc", "appName": "6Ic6FMCC", "attributes": {"G0GY00gq": {}, "1jQbfGmX": {}, "nsgL3uee": {}}, "autoJoin": false, "autoLeaveSession": false, "clientVersion": "6HuprfbV", "customURLGRPC": "YeX4OnL6", "deployment": "IZn4bjK8", "disableCodeGeneration": false, "disableResendInvite": true, "dsManualSetReady": true, "dsSource": "Y0dYThrm", "enableSecret": true, "fallbackClaimKeys": ["WxFtuvMS", "iZgpKk3D", "7KnzpMNC"], "grpcSessionConfig": {"appName": "M4dhZOJ4", "customURL": "nAtnJpXV", "functionFlag": 84}, "immutableStorage": true, "inactiveTimeout": 66, "inviteTimeout": 42, "joinability": "4hRlXwYT", "leaderElectionGracePeriod": 58, "manualRejoin": false, "maxActiveSessions": 11, "maxPlayers": 12, "minPlayers": 14, "name": "TV2Gg7lT", "persistent": true, "preferredClaimKeys": ["a7YgzAGq", "EN8aTJyM", "omE1Q2eh"], "requestedRegions": ["FBCuCSPK", "z7ZDOhF6", "V8MrGaFZ"], "textChat": true, "tieTeamsSessionLifetime": true, "type": "rBNQxS04"}' \
    > test.out 2>&1
eval_tap $? 19 'AdminUpdateConfigurationTemplateV1' test.out

#- 20 AdminDeleteConfigurationTemplateV1
./ng net.accelbyte.sdk.cli.Main session adminDeleteConfigurationTemplateV1 \
    --name 'dtbubyUk' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 20 'AdminDeleteConfigurationTemplateV1' test.out

#- 21 AdminGetMemberActiveSession
./ng net.accelbyte.sdk.cli.Main session adminGetMemberActiveSession \
    --name '7ZCIqzXr' \
    --namespace "$AB_NAMESPACE" \
    --userId 'TP6aFVh0' \
    > test.out 2>&1
eval_tap $? 21 'AdminGetMemberActiveSession' test.out

#- 22 AdminReconcileMaxActiveSession
./ng net.accelbyte.sdk.cli.Main session adminReconcileMaxActiveSession \
    --name 'jGn8YGOG' \
    --namespace "$AB_NAMESPACE" \
    --body '{"userID": "L9e6OyH0"}' \
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
    --configurationName 'Udp7gQ0c' \
    --dsPodName 'CfTOTTHk' \
    --fromTime 'hatkCPdB' \
    --gameMode '8RJDVQ0j' \
    --isPersistent 'WL61APYX' \
    --isSoftDeleted 'qT71nA61' \
    --joinability 'B1F0WZEj' \
    --limit '6' \
    --matchPool 'RK0NBXNU' \
    --memberID '1Bi1oudo' \
    --offset '6' \
    --order 'vmun4Q8T' \
    --orderBy 'IblBcBI5' \
    --sessionID 'DCKJWDs6' \
    --status 'vDE0h4XA' \
    --statusV2 '6PTc0Cm5' \
    --toTime 'Cbt9cpGK' \
    > test.out 2>&1
eval_tap $? 25 'AdminQueryGameSessions' test.out

#- 26 AdminQueryGameSessionsByAttributes
./ng net.accelbyte.sdk.cli.Main session adminQueryGameSessionsByAttributes \
    --namespace "$AB_NAMESPACE" \
    --body '{"BB86qtp9": {}, "q5aWJh8y": {}, "Ojxh1JNT": {}}' \
    > test.out 2>&1
eval_tap $? 26 'AdminQueryGameSessionsByAttributes' test.out

#- 27 AdminDeleteBulkGameSessions
./ng net.accelbyte.sdk.cli.Main session adminDeleteBulkGameSessions \
    --namespace "$AB_NAMESPACE" \
    --body '{"ids": ["pxy5P49p", "uldi26Lf", "DfeYHKMX"]}' \
    > test.out 2>&1
eval_tap $? 27 'AdminDeleteBulkGameSessions' test.out

#- 28 AdminSetDSReady
./ng net.accelbyte.sdk.cli.Main session adminSetDSReady \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'yaE2ZVzf' \
    --body '{"ready": true}' \
    > test.out 2>&1
eval_tap $? 28 'AdminSetDSReady' test.out

#- 29 AdminKickGameSessionMember
./ng net.accelbyte.sdk.cli.Main session adminKickGameSessionMember \
    --memberId 'KdNXq5pL' \
    --namespace "$AB_NAMESPACE" \
    --sessionId '9wxMBTr3' \
    > test.out 2>&1
eval_tap $? 29 'AdminKickGameSessionMember' test.out

#- 30 AdminUpdateGameSessionMember
./ng net.accelbyte.sdk.cli.Main session adminUpdateGameSessionMember \
    --memberId '7iwdU9T8' \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'mnCRiFB4' \
    --statusType 'bfWHP3vw' \
    > test.out 2>&1
eval_tap $? 30 'AdminUpdateGameSessionMember' test.out

#- 31 AdminGetListNativeSession
./ng net.accelbyte.sdk.cli.Main session adminGetListNativeSession \
    --namespace "$AB_NAMESPACE" \
    --limit '49' \
    --offset '46' \
    --order '4E389mCy' \
    > test.out 2>&1
eval_tap $? 31 'AdminGetListNativeSession' test.out

#- 32 AdminQueryParties
./ng net.accelbyte.sdk.cli.Main session adminQueryParties \
    --namespace "$AB_NAMESPACE" \
    --isSoftDeleted 'EAjb2STi' \
    --joinability 'bsbMt7lY' \
    --key 'zHaRULeH' \
    --leaderID 'c8JjTLra' \
    --limit '2' \
    --memberID 'PNYMPUQe' \
    --memberStatus 'K1QIkIMm' \
    --offset '45' \
    --order 'ITJXmfgt' \
    --orderBy 'Ee38pVFP' \
    --partyID 'Q2uPZZ5n' \
    --value 'kMrBUum7' \
    > test.out 2>&1
eval_tap $? 32 'AdminQueryParties' test.out

#- 33 AdminDeleteBulkParties
./ng net.accelbyte.sdk.cli.Main session adminDeleteBulkParties \
    --namespace "$AB_NAMESPACE" \
    --body '{"ids": ["hL77rzks", "6mqvxbyo", "8NCbNaad"]}' \
    > test.out 2>&1
eval_tap $? 33 'AdminDeleteBulkParties' test.out

#- 34 AdminReadPartySessionStorage
./ng net.accelbyte.sdk.cli.Main session adminReadPartySessionStorage \
    --namespace "$AB_NAMESPACE" \
    --partyId 'gSRitg78' \
    > test.out 2>&1
eval_tap $? 34 'AdminReadPartySessionStorage' test.out

#- 35 AdminGetPlatformCredentials
./ng net.accelbyte.sdk.cli.Main session adminGetPlatformCredentials \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 35 'AdminGetPlatformCredentials' test.out

#- 36 AdminUpdatePlatformCredentials
./ng net.accelbyte.sdk.cli.Main session adminUpdatePlatformCredentials \
    --namespace "$AB_NAMESPACE" \
    --body '{"psn": {"clientId": "Li8jsJ6d", "clientSecret": "f9gTWXtC", "scope": "CLG3tLt6"}}' \
    > test.out 2>&1
eval_tap $? 36 'AdminUpdatePlatformCredentials' test.out

#- 37 AdminDeletePlatformCredentials
./ng net.accelbyte.sdk.cli.Main session adminDeletePlatformCredentials \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 37 'AdminDeletePlatformCredentials' test.out

#- 38 AdminDeletePlatformCredentialsByPlatformId
./ng net.accelbyte.sdk.cli.Main session adminDeletePlatformCredentialsByPlatformId \
    --namespace "$AB_NAMESPACE" \
    --platformId 'PSN' \
    > test.out 2>&1
eval_tap $? 38 'AdminDeletePlatformCredentialsByPlatformId' test.out

#- 39 AdminSyncPlatformCredentials
./ng net.accelbyte.sdk.cli.Main session adminSyncPlatformCredentials \
    --namespace "$AB_NAMESPACE" \
    --platformId 'XBOX' \
    > test.out 2>&1
eval_tap $? 39 'AdminSyncPlatformCredentials' test.out

#- 40 AdminGetRecentPlayer
./ng net.accelbyte.sdk.cli.Main session adminGetRecentPlayer \
    --namespace "$AB_NAMESPACE" \
    --limit '37' \
    --userId '8anmLYUv' \
    > test.out 2>&1
eval_tap $? 40 'AdminGetRecentPlayer' test.out

#- 41 AdminGetRecentTeamPlayer
./ng net.accelbyte.sdk.cli.Main session adminGetRecentTeamPlayer \
    --namespace "$AB_NAMESPACE" \
    --limit '82' \
    --userId '4sTeRWod' \
    > test.out 2>&1
eval_tap $? 41 'AdminGetRecentTeamPlayer' test.out

#- 42 AdminReadSessionStorage
./ng net.accelbyte.sdk.cli.Main session adminReadSessionStorage \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'tg3WqibK' \
    > test.out 2>&1
eval_tap $? 42 'AdminReadSessionStorage' test.out

#- 43 AdminDeleteUserSessionStorage
./ng net.accelbyte.sdk.cli.Main session adminDeleteUserSessionStorage \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'NHOVEaLB' \
    > test.out 2>&1
eval_tap $? 43 'AdminDeleteUserSessionStorage' test.out

#- 44 AdminReadUserSessionStorage
./ng net.accelbyte.sdk.cli.Main session adminReadUserSessionStorage \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'DmJrb0vz' \
    --userId 'sMMdiqrD' \
    > test.out 2>&1
eval_tap $? 44 'AdminReadUserSessionStorage' test.out

#- 45 AdminQueryPlayerAttributes
./ng net.accelbyte.sdk.cli.Main session adminQueryPlayerAttributes \
    --namespace "$AB_NAMESPACE" \
    --users 'mgOYpcCc' \
    > test.out 2>&1
eval_tap $? 45 'AdminQueryPlayerAttributes' test.out

#- 46 AdminGetPlayerAttributes
./ng net.accelbyte.sdk.cli.Main session adminGetPlayerAttributes \
    --namespace "$AB_NAMESPACE" \
    --userId 'GJDq6sQH' \
    > test.out 2>&1
eval_tap $? 46 'AdminGetPlayerAttributes' test.out

#- 47 AdminSyncNativeSession
./ng net.accelbyte.sdk.cli.Main session adminSyncNativeSession \
    --namespace "$AB_NAMESPACE" \
    --userId '2BDiaaNJ' \
    > test.out 2>&1
eval_tap $? 47 'AdminSyncNativeSession' test.out

#- 48 CreateGameSession
./ng net.accelbyte.sdk.cli.Main session createGameSession \
    --namespace "$AB_NAMESPACE" \
    --body '{"appName": "Y2GVaOFI", "attributes": {"NUTg2FrJ": {}, "AloeRaaS": {}, "DpoM5b1J": {}}, "autoJoin": true, "backfillTicketID": "jeTPy1y2", "clientVersion": "mpY2jvsl", "configurationName": "MbxQufu7", "customURLGRPC": "RwmzjJ90", "deployment": "tOWGZsXI", "dsSource": "oHVBHPvU", "fallbackClaimKeys": ["TQjpfQBv", "XVLDv5KC", "Zcvn93oq"], "inactiveTimeout": 41, "inviteTimeout": 1, "joinability": "nSrDxOy2", "matchPool": "9av2zQUI", "maxPlayers": 44, "minPlayers": 34, "preferredClaimKeys": ["1j9xVsQw", "X77Solpa", "Yy6DpbUI"], "requestedRegions": ["MftCzJrv", "hPXDB9kc", "9fAWZeFp"], "serverName": "EBM1aKij", "storage": {"leader": {"EdAvCH8E": {}, "ZUuUjZoP": {}, "J2fIPmHy": {}}}, "teams": [{"parties": [{"partyID": "9ZcuIqqU", "userIDs": ["XHxOHP0l", "3bD4r2tD", "3DghPBib"]}, {"partyID": "zw8xyxie", "userIDs": ["LZynIrps", "eGJA29cS", "Rd9HNwBL"]}, {"partyID": "ebKTGppj", "userIDs": ["GCmTst6K", "hMiysNdb", "P7XPDv5y"]}], "teamID": "bi6vySk6", "userIDs": ["3UCo2JWK", "8r6ImT46", "mEgIxQ34"]}, {"parties": [{"partyID": "CiLCLTIv", "userIDs": ["7I8w2iVk", "88OtsGMI", "j8gmFBCE"]}, {"partyID": "PeO1g321", "userIDs": ["KhjEN1BP", "ovOEH2KU", "ub6n762g"]}, {"partyID": "qBpMQrxV", "userIDs": ["bX5STKyx", "w5Rhdtuk", "thMuq92b"]}], "teamID": "NriuXQmu", "userIDs": ["NUuApyeS", "oMZV3JSy", "Syc7doyZ"]}, {"parties": [{"partyID": "iH4fabCu", "userIDs": ["wKK2IDJk", "qU0S8RCF", "u1PyaLK6"]}, {"partyID": "HCUUr96o", "userIDs": ["CM9kV6ni", "TyD5CmNf", "Z6ZBmAF2"]}, {"partyID": "pTRUlCnE", "userIDs": ["txDlW2XN", "whd2k0rR", "6wvUerlg"]}], "teamID": "nLcVdtTy", "userIDs": ["D6l2ZALC", "16dGV1Mm", "PKUcJtQj"]}], "textChat": false, "ticketIDs": ["W1W5GYpP", "LeWevDZ6", "IzWJzbiw"], "tieTeamsSessionLifetime": true, "type": "qkXzJzVY"}' \
    > test.out 2>&1
eval_tap $? 48 'CreateGameSession' test.out

#- 49 PublicQueryGameSessionsByAttributes
./ng net.accelbyte.sdk.cli.Main session publicQueryGameSessionsByAttributes \
    --namespace "$AB_NAMESPACE" \
    --body '{"pcNLajL4": {}, "khrqNCKw": {}, "66329Trv": {}}' \
    > test.out 2>&1
eval_tap $? 49 'PublicQueryGameSessionsByAttributes' test.out

#- 50 PublicSessionJoinCode
./ng net.accelbyte.sdk.cli.Main session publicSessionJoinCode \
    --namespace "$AB_NAMESPACE" \
    --body '{"code": "CS0nuREm"}' \
    > test.out 2>&1
eval_tap $? 50 'PublicSessionJoinCode' test.out

#- 51 GetGameSessionByPodName
./ng net.accelbyte.sdk.cli.Main session getGameSessionByPodName \
    --namespace "$AB_NAMESPACE" \
    --podName 'sNbE2wKb' \
    > test.out 2>&1
eval_tap $? 51 'GetGameSessionByPodName' test.out

#- 52 GetGameSession
./ng net.accelbyte.sdk.cli.Main session getGameSession \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'lv4hZ4AW' \
    > test.out 2>&1
eval_tap $? 52 'GetGameSession' test.out

#- 53 UpdateGameSession
./ng net.accelbyte.sdk.cli.Main session updateGameSession \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'GemIeFA6' \
    --body '{"attributes": {"UzL5vTQa": {}, "YKuboitR": {}, "OLzBPk8Y": {}}, "backfillTicketID": "LL4rAXdk", "clientVersion": "lZMsHoeg", "deployment": "4GniezZU", "fallbackClaimKeys": ["b4jAahpV", "WCHaC7cW", "S0lfLGUv"], "inactiveTimeout": 96, "inviteTimeout": 1, "joinability": "mpUDoDHB", "matchPool": "bEwSLJUM", "maxPlayers": 14, "minPlayers": 48, "preferredClaimKeys": ["YiTpd8xB", "bOZHIth7", "rO0feEpL"], "requestedRegions": ["8AEnWzR6", "jB0VR32d", "rnp5omAr"], "teams": [{"parties": [{"partyID": "m7XG0o4f", "userIDs": ["G9asqk5W", "8Itvy44q", "ai3G1s7R"]}, {"partyID": "ykIyaQI7", "userIDs": ["sM1XcpDg", "duibCgMo", "oA68YMxC"]}, {"partyID": "wQo92pJx", "userIDs": ["Bka6u1kd", "OXfFLqSy", "DuuQsQtI"]}], "teamID": "xi4fPZwz", "userIDs": ["4Owjna2O", "RL8WcuFH", "iqUdGUuO"]}, {"parties": [{"partyID": "mRWTXY2L", "userIDs": ["0NgAwSdG", "Eab8sF6n", "oPIgz0lG"]}, {"partyID": "MjYnvGBy", "userIDs": ["evQj2BVF", "sL4Z32vi", "V6xKNrrS"]}, {"partyID": "wPDTCHsP", "userIDs": ["X98I785i", "MBveUaYQ", "DUWEWQRD"]}], "teamID": "J4l9RZvK", "userIDs": ["ppC1ARiw", "v3Qi0plU", "yHUSTvTl"]}, {"parties": [{"partyID": "KtpR5o2y", "userIDs": ["duj4Pahe", "XPioXggL", "HESYsNVW"]}, {"partyID": "F5sSzEIQ", "userIDs": ["Q86NxdpV", "580yKGFg", "pqquRQc9"]}, {"partyID": "fSH57t4X", "userIDs": ["4KnEBObQ", "kT4ciC6K", "rDGbcTnn"]}], "teamID": "bsVJFL5h", "userIDs": ["q4HLDV2V", "KgMFc9c7", "KM4cFEgc"]}], "ticketIDs": ["8CYJtdRq", "pkIsF6lv", "Li0vVyv4"], "tieTeamsSessionLifetime": false, "type": "e8QyzKK8", "version": 89}' \
    > test.out 2>&1
eval_tap $? 53 'UpdateGameSession' test.out

#- 54 DeleteGameSession
./ng net.accelbyte.sdk.cli.Main session deleteGameSession \
    --namespace "$AB_NAMESPACE" \
    --sessionId '9xpByXhX' \
    > test.out 2>&1
eval_tap $? 54 'DeleteGameSession' test.out

#- 55 PatchUpdateGameSession
./ng net.accelbyte.sdk.cli.Main session patchUpdateGameSession \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'UoWpOCh8' \
    --body '{"attributes": {"RKlvn6da": {}, "ju3wnJ4t": {}, "f0KSRf9k": {}}, "backfillTicketID": "dXheCkXl", "clientVersion": "GgFVLaab", "deployment": "N9Lw3iUd", "fallbackClaimKeys": ["oNzTib3C", "DLWoY6WV", "Lpr9g7Dq"], "inactiveTimeout": 88, "inviteTimeout": 9, "joinability": "JUyaTkxv", "matchPool": "zhFf9h4x", "maxPlayers": 87, "minPlayers": 14, "preferredClaimKeys": ["CpXeoQ66", "8KMvyUjy", "ob88ApLE"], "requestedRegions": ["Vm8ygPQ4", "9YFuBNo7", "RVmpj0xu"], "teams": [{"parties": [{"partyID": "ObVTfX51", "userIDs": ["ZcIyda9R", "G5FiTxGf", "F9nmkc36"]}, {"partyID": "ttOM6lYx", "userIDs": ["0viFqsjD", "bT7gCFVr", "4MUG9c2q"]}, {"partyID": "5MoHc5ci", "userIDs": ["hRGzSgiE", "jv0XSIop", "WPuVZy4B"]}], "teamID": "Ud855QTE", "userIDs": ["PYUaQSCm", "S9NCyoDf", "XHUwTJhS"]}, {"parties": [{"partyID": "Kh7SFg7z", "userIDs": ["Fx3FRDSk", "wLcPRvut", "aWxm8GlF"]}, {"partyID": "JoJKccRt", "userIDs": ["ArbfA3rH", "K0PTKsx3", "W21Wse29"]}, {"partyID": "Lcuc4jSS", "userIDs": ["qSGHSZEe", "lyYmgwjl", "3KdDLmjg"]}], "teamID": "XIYAIDgl", "userIDs": ["K4pfTqwb", "rhJQRUSt", "dhdcs4Yj"]}, {"parties": [{"partyID": "o5ykbc5h", "userIDs": ["QwpQImTS", "SdyGhdlj", "e0mWEC0W"]}, {"partyID": "2tKxrffx", "userIDs": ["8CIaZ8l4", "3kCdQPjg", "RQ5DhZZR"]}, {"partyID": "yT70fNJg", "userIDs": ["EJMmkkUG", "gmrpvIaY", "ubEXpk7H"]}], "teamID": "AnXFHdtI", "userIDs": ["7w3VZoE3", "zJ9aQ0P3", "Fvp3IUJ6"]}], "ticketIDs": ["XXCnQ1VL", "agwEYpSL", "WJ2JGnWn"], "tieTeamsSessionLifetime": true, "type": "G38e4jlQ", "version": 26}' \
    > test.out 2>&1
eval_tap $? 55 'PatchUpdateGameSession' test.out

#- 56 UpdateGameSessionBackfillTicketID
./ng net.accelbyte.sdk.cli.Main session updateGameSessionBackfillTicketID \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'z2o1kdz7' \
    --body '{"backfillTicketID": "7LJh8Bbr"}' \
    > test.out 2>&1
eval_tap $? 56 'UpdateGameSessionBackfillTicketID' test.out

#- 57 GameSessionGenerateCode
./ng net.accelbyte.sdk.cli.Main session gameSessionGenerateCode \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'ohpVDQw5' \
    > test.out 2>&1
eval_tap $? 57 'GameSessionGenerateCode' test.out

#- 58 PublicRevokeGameSessionCode
./ng net.accelbyte.sdk.cli.Main session publicRevokeGameSessionCode \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'Gwdfv2WW' \
    > test.out 2>&1
eval_tap $? 58 'PublicRevokeGameSessionCode' test.out

#- 59 PublicGameSessionInvite
./ng net.accelbyte.sdk.cli.Main session publicGameSessionInvite \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'KmzadA4x' \
    --body '{"metadata": {"e1QVt7pL": "gKSdzEdM", "ifRJgL7z": "doucsamp", "S3SCgV5I": "T6x21OTH"}, "platformID": "2z9CvjJa", "userID": "3fZdomI0"}' \
    > test.out 2>&1
eval_tap $? 59 'PublicGameSessionInvite' test.out

#- 60 JoinGameSession
./ng net.accelbyte.sdk.cli.Main session joinGameSession \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'vn8gSAWq' \
    > test.out 2>&1
eval_tap $? 60 'JoinGameSession' test.out

#- 61 PublicPromoteGameSessionLeader
./ng net.accelbyte.sdk.cli.Main session publicPromoteGameSessionLeader \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'YbxCrnGJ' \
    --body '{"leaderID": "uP3ubjuo"}' \
    > test.out 2>&1
eval_tap $? 61 'PublicPromoteGameSessionLeader' test.out

#- 62 LeaveGameSession
./ng net.accelbyte.sdk.cli.Main session leaveGameSession \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'HDzA3VcT' \
    > test.out 2>&1
eval_tap $? 62 'LeaveGameSession' test.out

#- 63 PublicKickGameSessionMember
./ng net.accelbyte.sdk.cli.Main session publicKickGameSessionMember \
    --memberId 'ADD3jpSg' \
    --namespace "$AB_NAMESPACE" \
    --sessionId '9fXrENJd' \
    > test.out 2>&1
eval_tap $? 63 'PublicKickGameSessionMember' test.out

#- 64 PublicGameSessionReject
./ng net.accelbyte.sdk.cli.Main session publicGameSessionReject \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'SGVzg5j3' \
    > test.out 2>&1
eval_tap $? 64 'PublicGameSessionReject' test.out

#- 65 GetSessionServerSecret
./ng net.accelbyte.sdk.cli.Main session getSessionServerSecret \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'DypbMR9v' \
    > test.out 2>&1
eval_tap $? 65 'GetSessionServerSecret' test.out

#- 66 AppendTeamGameSession
eval_tap 0 66 'AppendTeamGameSession # SKIP deprecated' test.out

#- 67 PublicGameSessionCancel
./ng net.accelbyte.sdk.cli.Main session publicGameSessionCancel \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'wRBcVBvN' \
    --userId 'FTrbJ2GV' \
    > test.out 2>&1
eval_tap $? 67 'PublicGameSessionCancel' test.out

#- 68 PublicPartyJoinCode
./ng net.accelbyte.sdk.cli.Main session publicPartyJoinCode \
    --namespace "$AB_NAMESPACE" \
    --body '{"code": "Qzo890QA"}' \
    > test.out 2>&1
eval_tap $? 68 'PublicPartyJoinCode' test.out

#- 69 PublicGetParty
./ng net.accelbyte.sdk.cli.Main session publicGetParty \
    --namespace "$AB_NAMESPACE" \
    --partyId 'BjVKMHbA' \
    > test.out 2>&1
eval_tap $? 69 'PublicGetParty' test.out

#- 70 PublicUpdateParty
./ng net.accelbyte.sdk.cli.Main session publicUpdateParty \
    --namespace "$AB_NAMESPACE" \
    --partyId 'Q0Q1Tk8S' \
    --body '{"attributes": {"cYtMCLA0": {}, "MtUTqs1r": {}, "CcTfXFhF": {}}, "inactiveTimeout": 87, "inviteTimeout": 62, "joinability": "BSpXAEpG", "maxPlayers": 97, "minPlayers": 50, "type": "njLaQy70", "version": 93}' \
    > test.out 2>&1
eval_tap $? 70 'PublicUpdateParty' test.out

#- 71 PublicPatchUpdateParty
./ng net.accelbyte.sdk.cli.Main session publicPatchUpdateParty \
    --namespace "$AB_NAMESPACE" \
    --partyId 'WrhS1wDZ' \
    --body '{"attributes": {"ZD46YueA": {}, "9CdEahX4": {}, "rzoWcYwN": {}}, "inactiveTimeout": 73, "inviteTimeout": 85, "joinability": "uGYV7ay6", "maxPlayers": 68, "minPlayers": 42, "type": "CAfPGybt", "version": 5}' \
    > test.out 2>&1
eval_tap $? 71 'PublicPatchUpdateParty' test.out

#- 72 PublicGeneratePartyCode
./ng net.accelbyte.sdk.cli.Main session publicGeneratePartyCode \
    --namespace "$AB_NAMESPACE" \
    --partyId 'XaT7X6HU' \
    > test.out 2>&1
eval_tap $? 72 'PublicGeneratePartyCode' test.out

#- 73 PublicRevokePartyCode
./ng net.accelbyte.sdk.cli.Main session publicRevokePartyCode \
    --namespace "$AB_NAMESPACE" \
    --partyId 'eY97DkpM' \
    > test.out 2>&1
eval_tap $? 73 'PublicRevokePartyCode' test.out

#- 74 PublicPartyInvite
./ng net.accelbyte.sdk.cli.Main session publicPartyInvite \
    --namespace "$AB_NAMESPACE" \
    --partyId 'zrnYT3SY' \
    --body '{"metadata": {"PlyLs6XN": "u2kdN6KM", "AIkOQcTX": "ch865PXG", "4dmh7DdT": "JCD8NpW3"}, "platformID": "ttpMB6Ht", "userID": "TMbD3UyD"}' \
    > test.out 2>&1
eval_tap $? 74 'PublicPartyInvite' test.out

#- 75 PublicPromotePartyLeader
./ng net.accelbyte.sdk.cli.Main session publicPromotePartyLeader \
    --namespace "$AB_NAMESPACE" \
    --partyId 'ex5pRSdW' \
    --body '{"leaderID": "20jDtH3L"}' \
    > test.out 2>&1
eval_tap $? 75 'PublicPromotePartyLeader' test.out

#- 76 PublicReadPartySessionStorage
./ng net.accelbyte.sdk.cli.Main session publicReadPartySessionStorage \
    --namespace "$AB_NAMESPACE" \
    --partyId 'OpAHfW3X' \
    > test.out 2>&1
eval_tap $? 76 'PublicReadPartySessionStorage' test.out

#- 77 PublicUpdateInsertPartySessionStorageReserved
./ng net.accelbyte.sdk.cli.Main session publicUpdateInsertPartySessionStorageReserved \
    --namespace "$AB_NAMESPACE" \
    --partyId '7bOqkR8q' \
    --userId 'PB0MNA25' \
    --body '{"QGF5Fbnr": {}, "yDFrT1Sc": {}, "LP2xBtlo": {}}' \
    > test.out 2>&1
eval_tap $? 77 'PublicUpdateInsertPartySessionStorageReserved' test.out

#- 78 PublicPartyJoin
./ng net.accelbyte.sdk.cli.Main session publicPartyJoin \
    --namespace "$AB_NAMESPACE" \
    --partyId 'VH5XgAeQ' \
    > test.out 2>&1
eval_tap $? 78 'PublicPartyJoin' test.out

#- 79 PublicPartyLeave
./ng net.accelbyte.sdk.cli.Main session publicPartyLeave \
    --namespace "$AB_NAMESPACE" \
    --partyId 'SIEWCu44' \
    > test.out 2>&1
eval_tap $? 79 'PublicPartyLeave' test.out

#- 80 PublicPartyReject
./ng net.accelbyte.sdk.cli.Main session publicPartyReject \
    --namespace "$AB_NAMESPACE" \
    --partyId 'yEQjPu9k' \
    > test.out 2>&1
eval_tap $? 80 'PublicPartyReject' test.out

#- 81 PublicPartyCancel
./ng net.accelbyte.sdk.cli.Main session publicPartyCancel \
    --namespace "$AB_NAMESPACE" \
    --partyId 'dpfzKRp7' \
    --userId '5426DavI' \
    > test.out 2>&1
eval_tap $? 81 'PublicPartyCancel' test.out

#- 82 PublicPartyKick
./ng net.accelbyte.sdk.cli.Main session publicPartyKick \
    --namespace "$AB_NAMESPACE" \
    --partyId 'QcqkGZdX' \
    --userId 'yeDmRNEe' \
    > test.out 2>&1
eval_tap $? 82 'PublicPartyKick' test.out

#- 83 PublicCreateParty
./ng net.accelbyte.sdk.cli.Main session publicCreateParty \
    --namespace "$AB_NAMESPACE" \
    --body '{"attributes": {"5lLrh9AO": {}, "536BsZgB": {}, "U5B5W61L": {}}, "configurationName": "0N7Im5jP", "inactiveTimeout": 58, "inviteTimeout": 74, "joinability": "VvLlZfDS", "maxPlayers": 77, "members": [{"ID": "Fnefip5s", "PlatformID": "fQ5Q0O8B", "PlatformUserID": "z4aMojWT"}, {"ID": "l2aqYzUI", "PlatformID": "OdtVjqbm", "PlatformUserID": "OONXUpyd"}, {"ID": "OQZuUOb1", "PlatformID": "bfAIbwuw", "PlatformUserID": "iMXuiCnj"}], "minPlayers": 1, "textChat": true, "type": "LJCnJ4sc"}' \
    > test.out 2>&1
eval_tap $? 83 'PublicCreateParty' test.out

#- 84 PublicGetRecentPlayer
./ng net.accelbyte.sdk.cli.Main session publicGetRecentPlayer \
    --namespace "$AB_NAMESPACE" \
    --limit '97' \
    > test.out 2>&1
eval_tap $? 84 'PublicGetRecentPlayer' test.out

#- 85 PublicGetRecentTeamPlayer
./ng net.accelbyte.sdk.cli.Main session publicGetRecentTeamPlayer \
    --namespace "$AB_NAMESPACE" \
    --limit '97' \
    > test.out 2>&1
eval_tap $? 85 'PublicGetRecentTeamPlayer' test.out

#- 86 PublicUpdateInsertSessionStorageLeader
./ng net.accelbyte.sdk.cli.Main session publicUpdateInsertSessionStorageLeader \
    --namespace "$AB_NAMESPACE" \
    --sessionId '2Ft2qHLH' \
    --body '{"Ks2c6ZV7": {}, "paXQRf7w": {}, "m8bGTPuv": {}}' \
    > test.out 2>&1
eval_tap $? 86 'PublicUpdateInsertSessionStorageLeader' test.out

#- 87 PublicUpdateInsertSessionStorage
./ng net.accelbyte.sdk.cli.Main session publicUpdateInsertSessionStorage \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'd4tEegzn' \
    --userId 'f22j67Ny' \
    --body '{"Sg6BQfKi": {}, "3qmqOwkJ": {}, "6w7COZPn": {}}' \
    > test.out 2>&1
eval_tap $? 87 'PublicUpdateInsertSessionStorage' test.out

#- 88 PublicGetBulkPlayerCurrentPlatform
./ng net.accelbyte.sdk.cli.Main session publicGetBulkPlayerCurrentPlatform \
    --namespace "$AB_NAMESPACE" \
    --body '{"userIDs": ["7Qb6ewmk", "huygWEl2", "OQmEV3VA"]}' \
    > test.out 2>&1
eval_tap $? 88 'PublicGetBulkPlayerCurrentPlatform' test.out

#- 89 PublicGetPlayerAttributes
./ng net.accelbyte.sdk.cli.Main session publicGetPlayerAttributes \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 89 'PublicGetPlayerAttributes' test.out

#- 90 PublicStorePlayerAttributes
./ng net.accelbyte.sdk.cli.Main session publicStorePlayerAttributes \
    --namespace "$AB_NAMESPACE" \
    --body '{"crossplayEnabled": true, "currentPlatform": "CPX2urRN", "data": {"8KzygEuh": {}, "a3bMt7WW": {}, "9KWm5fTY": {}}, "platforms": [{"name": "bv3ZlqWC", "userID": "DV2IMWlA"}, {"name": "lGG7rvtg", "userID": "G0OhNrAa"}, {"name": "6ZTxGvDG", "userID": "nXhsuIvi"}], "roles": ["VxraSECm", "oFuhBatZ", "g1vKGNLP"], "simultaneousPlatform": "wZuo7Dqu"}' \
    > test.out 2>&1
eval_tap $? 90 'PublicStorePlayerAttributes' test.out

#- 91 PublicDeletePlayerAttributes
./ng net.accelbyte.sdk.cli.Main session publicDeletePlayerAttributes \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 91 'PublicDeletePlayerAttributes' test.out

#- 92 PublicQueryMyGameSessions
./ng net.accelbyte.sdk.cli.Main session publicQueryMyGameSessions \
    --namespace "$AB_NAMESPACE" \
    --order 'AczOXwof' \
    --orderBy 'huThvsVt' \
    --status 'cpztcFkC' \
    > test.out 2>&1
eval_tap $? 92 'PublicQueryMyGameSessions' test.out

#- 93 PublicQueryMyParties
./ng net.accelbyte.sdk.cli.Main session publicQueryMyParties \
    --namespace "$AB_NAMESPACE" \
    --order 'nayyTklw' \
    --orderBy 'PtPgCQLI' \
    --status 'mienJiYf' \
    > test.out 2>&1
eval_tap $? 93 'PublicQueryMyParties' test.out


rm -f "tmp.dat"

exit $EXIT_CODE