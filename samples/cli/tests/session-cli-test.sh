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
    --body '{"logLevel": "panic"}' \
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
    --body '{"metricExcludedNamespaces": ["r4Uf8Prb", "KdDVhuTy", "sRuL4Ec1"], "regionRetryMapping": {"3HnRp2Nw": ["nPSiyJvf", "2pKNH17a", "D81Bo6Jx"], "W1xRow9V": ["HIv4gKMM", "M0Bm9jmw", "PRe5mZe9"], "4oAbhlNO": ["3cI3bVgS", "gXoZEzTG", "aW1fc6Bh"]}, "regionURLMapping": ["Vdej3vnR", "U9ymrvXq", "jM3uHDxW"], "testGameMode": "SF0gn8ZK", "testRegionURLMapping": ["Agd9VNXL", "sNuerWJd", "wupHuTZS"], "testTargetUserIDs": ["H1WoGBJ9", "6Eq5lAbn", "Wz9OBwde"]}' \
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
    --body '{"durationDays": 15}' \
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
    --body '{"NativeSessionSetting": {"PSNDisableSystemUIMenu": ["UPDATE_INVITABLE_USER_TYPE", "KICK", "UPDATE_INVITABLE_USER_TYPE"], "PSNServiceLabel": 9, "PSNSupportedPlatforms": ["JFMNHIc7", "VcksaBR4", "llqIgDet"], "SessionTitle": "kr2JYDDx", "ShouldSync": false, "XboxAllowCrossPlatform": true, "XboxSandboxID": "tWQIXUIc", "XboxServiceConfigID": "ij5dfCVt", "XboxSessionTemplateName": "sBuX1oke", "XboxTitleID": "U2HzmnKp", "localizedSessionName": {"9xRjHhEs": {}, "RBDT3rTD": {}, "5Y6rZRn9": {}}}, "PSNBaseUrl": "NJTSboei", "amsClaimTimeoutMinutes": 22, "appName": "KWVY66Sq", "asyncProcessDSRequest": {"async": false, "timeout": 50}, "attributes": {"lhMkZlUI": {}, "ZnjYsq35": {}, "lFPZyjuM": {}}, "autoJoin": false, "autoLeaveSession": false, "clientVersion": "DIbMU5l2", "customURLGRPC": "DDFarTi6", "deployment": "jfJ6yzqR", "disableCodeGeneration": true, "disableResendInvite": true, "dsManualSetReady": true, "dsSource": "Oj6OatE3", "enableSecret": true, "fallbackClaimKeys": ["WszTQQnF", "QQYEVgh8", "eHtxca0H"], "grpcSessionConfig": {"appName": "0xjRZxmk", "customURL": "4MDYYpew", "functionFlag": 19}, "immutableStorage": true, "inactiveTimeout": 68, "inviteTimeout": 44, "joinability": "jKWWiSqf", "leaderElectionGracePeriod": 76, "manualRejoin": false, "maxActiveSessions": 90, "maxPlayers": 92, "minPlayers": 34, "name": "rVOG9PHW", "persistent": false, "preferredClaimKeys": ["ITGJWtq0", "5E7Ayg1X", "vNAn3J9g"], "requestedRegions": ["MNU7GTYG", "A3n4I9Or", "d2bVnbwy"], "textChat": true, "textChatMode": "GAME", "tieTeamsSessionLifetime": false, "ttlHours": 8, "type": "LBkyDj6E"}' \
    > test.out 2>&1
eval_tap $? 16 'AdminCreateConfigurationTemplateV1' test.out

#- 17 AdminGetAllConfigurationTemplatesV1
./ng net.accelbyte.sdk.cli.Main session adminGetAllConfigurationTemplatesV1 \
    --namespace "$AB_NAMESPACE" \
    --limit '41' \
    --name 'NU0EgVWb' \
    --offset '6' \
    --order 'SrXXCuyt' \
    --orderBy 'c32u38I1' \
    > test.out 2>&1
eval_tap $? 17 'AdminGetAllConfigurationTemplatesV1' test.out

#- 18 AdminGetConfigurationTemplateV1
./ng net.accelbyte.sdk.cli.Main session adminGetConfigurationTemplateV1 \
    --name '4fY4yBrT' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 18 'AdminGetConfigurationTemplateV1' test.out

#- 19 AdminUpdateConfigurationTemplateV1
./ng net.accelbyte.sdk.cli.Main session adminUpdateConfigurationTemplateV1 \
    --name 'y483x6Lx' \
    --namespace "$AB_NAMESPACE" \
    --body '{"NativeSessionSetting": {"PSNDisableSystemUIMenu": ["UPDATE_INVITABLE_USER_TYPE", "KICK", "PROMOTE_TO_LEADER"], "PSNServiceLabel": 83, "PSNSupportedPlatforms": ["gbvnPU0i", "2QjEwP30", "aQheysAl"], "SessionTitle": "qEq5L0ed", "ShouldSync": false, "XboxAllowCrossPlatform": false, "XboxSandboxID": "iwyDeLLo", "XboxServiceConfigID": "XU9XvNND", "XboxSessionTemplateName": "qDAj7cTU", "XboxTitleID": "fWTEMGUU", "localizedSessionName": {"KSN1eprV": {}, "AFIe95Bd": {}, "V6i8AGRO": {}}}, "PSNBaseUrl": "ovsHYuUj", "amsClaimTimeoutMinutes": 58, "appName": "FJ9Q1S8x", "asyncProcessDSRequest": {"async": true, "timeout": 30}, "attributes": {"pLmhYzlp": {}, "Dx9jwuFV": {}, "u1fCtZLB": {}}, "autoJoin": true, "autoLeaveSession": true, "clientVersion": "zvXB43Br", "customURLGRPC": "EUVRA6M1", "deployment": "d1KTwRVS", "disableCodeGeneration": true, "disableResendInvite": false, "dsManualSetReady": false, "dsSource": "YjsFf22l", "enableSecret": true, "fallbackClaimKeys": ["z8UOByeB", "ipWjYJlu", "xld0CKxG"], "grpcSessionConfig": {"appName": "UrBRnRLl", "customURL": "52Z2wNUP", "functionFlag": 5}, "immutableStorage": true, "inactiveTimeout": 4, "inviteTimeout": 2, "joinability": "TL5De1Ek", "leaderElectionGracePeriod": 30, "manualRejoin": true, "maxActiveSessions": 93, "maxPlayers": 48, "minPlayers": 4, "name": "sn13h9sK", "persistent": true, "preferredClaimKeys": ["iXbZCdxb", "wFON0BZg", "isiAEh9T"], "requestedRegions": ["amkbr90B", "NifX385q", "V34QibaD"], "textChat": true, "textChatMode": "TEAM", "tieTeamsSessionLifetime": true, "ttlHours": 10, "type": "uGHO4Sf0"}' \
    > test.out 2>&1
eval_tap $? 19 'AdminUpdateConfigurationTemplateV1' test.out

#- 20 AdminDeleteConfigurationTemplateV1
./ng net.accelbyte.sdk.cli.Main session adminDeleteConfigurationTemplateV1 \
    --name 'iYJX6BYL' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 20 'AdminDeleteConfigurationTemplateV1' test.out

#- 21 AdminGetMemberActiveSession
./ng net.accelbyte.sdk.cli.Main session adminGetMemberActiveSession \
    --name 'o8L0l9KD' \
    --namespace "$AB_NAMESPACE" \
    --userId 'ltLlfnOJ' \
    > test.out 2>&1
eval_tap $? 21 'AdminGetMemberActiveSession' test.out

#- 22 AdminReconcileMaxActiveSession
./ng net.accelbyte.sdk.cli.Main session adminReconcileMaxActiveSession \
    --name '1LOmUM24' \
    --namespace "$AB_NAMESPACE" \
    --body '{"userID": "em31w4Nl"}' \
    > test.out 2>&1
eval_tap $? 22 'AdminReconcileMaxActiveSession' test.out

#- 23 AdminGetDSMCConfiguration
eval_tap 0 23 'AdminGetDSMCConfiguration # SKIP deprecated' test.out

#- 24 AdminSyncDSMCConfiguration
eval_tap 0 24 'AdminSyncDSMCConfiguration # SKIP deprecated' test.out

#- 25 AdminQueryGameSessions
./ng net.accelbyte.sdk.cli.Main session adminQueryGameSessions \
    --namespace "$AB_NAMESPACE" \
    --configurationName 'NKY7Dccr' \
    --dsPodName '21qnNriQ' \
    --fromTime '2y8iTU1D' \
    --gameMode 'fkqLzaLm' \
    --isPersistent 'VdNgehTZ' \
    --isSoftDeleted '6Fhmonol' \
    --joinability '3xaAOoap' \
    --limit '32' \
    --matchPool 'm5UvhzT4' \
    --memberID 'FnLtUCYo' \
    --offset '18' \
    --order '2eWfRqjN' \
    --orderBy 'OiL8X6zs' \
    --sessionID 'UKzkQSdo' \
    --status 'itInRS7F' \
    --statusV2 'hzVcSzO0' \
    --toTime 'hxhYQYJ5' \
    > test.out 2>&1
eval_tap $? 25 'AdminQueryGameSessions' test.out

#- 26 AdminQueryGameSessionsByAttributes
./ng net.accelbyte.sdk.cli.Main session adminQueryGameSessionsByAttributes \
    --namespace "$AB_NAMESPACE" \
    --body '{"OORyBSlK": {}, "1KAetWQz": {}, "8QQdwDza": {}}' \
    > test.out 2>&1
eval_tap $? 26 'AdminQueryGameSessionsByAttributes' test.out

#- 27 AdminDeleteBulkGameSessions
./ng net.accelbyte.sdk.cli.Main session adminDeleteBulkGameSessions \
    --namespace "$AB_NAMESPACE" \
    --body '{"ids": ["I4p4e65G", "rhls6grB", "Nw9ZBzIC"]}' \
    > test.out 2>&1
eval_tap $? 27 'AdminDeleteBulkGameSessions' test.out

#- 28 AdminSetDSReady
./ng net.accelbyte.sdk.cli.Main session adminSetDSReady \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'UMhkEI6k' \
    --body '{"ready": true}' \
    > test.out 2>&1
eval_tap $? 28 'AdminSetDSReady' test.out

#- 29 AdminUpdateDSInformation
./ng net.accelbyte.sdk.cli.Main session adminUpdateDSInformation \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'fHOrjlaS' \
    --body '{"createdRegion": "u5tdPkKg", "deployment": "1hg18j7G", "description": "bTnB2rAp", "ip": "WOtmxUsW", "port": 92, "region": "Yuzw5TnM", "serverId": "J0oDLX0w", "source": "CgsNA6aQ", "status": "mXAibrSy"}' \
    > test.out 2>&1
eval_tap $? 29 'AdminUpdateDSInformation' test.out

#- 30 AdminKickGameSessionMember
./ng net.accelbyte.sdk.cli.Main session adminKickGameSessionMember \
    --memberId 'RzcnfcJj' \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'Moqt2F9F' \
    > test.out 2>&1
eval_tap $? 30 'AdminKickGameSessionMember' test.out

#- 31 AdminUpdateGameSessionMember
./ng net.accelbyte.sdk.cli.Main session adminUpdateGameSessionMember \
    --memberId '2fWV1kMd' \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'db0CONFh' \
    --statusType 'SAg6FlUR' \
    > test.out 2>&1
eval_tap $? 31 'AdminUpdateGameSessionMember' test.out

#- 32 AdminGetListNativeSession
./ng net.accelbyte.sdk.cli.Main session adminGetListNativeSession \
    --namespace "$AB_NAMESPACE" \
    --limit '21' \
    --offset '68' \
    --order 'oM9Mb835' \
    > test.out 2>&1
eval_tap $? 32 'AdminGetListNativeSession' test.out

#- 33 AdminQueryParties
./ng net.accelbyte.sdk.cli.Main session adminQueryParties \
    --namespace "$AB_NAMESPACE" \
    --fromTime 'x6WuteJp' \
    --isSoftDeleted 'SMb1jz3N' \
    --joinability 'nevzlBuw' \
    --key 'bWFuqA7R' \
    --leaderID '5ydgM58q' \
    --limit '77' \
    --memberID 'e7nsxDVR' \
    --memberStatus 'dRdeKLiI' \
    --offset '57' \
    --order 'nd9kJCTq' \
    --orderBy 'n63noWuI' \
    --partyID 'uBvcNbg6' \
    --toTime 'Q04FWyfA' \
    --value 'ysbtcRXD' \
    > test.out 2>&1
eval_tap $? 33 'AdminQueryParties' test.out

#- 34 AdminDeleteBulkParties
./ng net.accelbyte.sdk.cli.Main session adminDeleteBulkParties \
    --namespace "$AB_NAMESPACE" \
    --body '{"ids": ["3Od7YKXw", "8q9qW5fT", "RaKX3Q2Q"]}' \
    > test.out 2>&1
eval_tap $? 34 'AdminDeleteBulkParties' test.out

#- 35 AdminReadPartySessionStorage
./ng net.accelbyte.sdk.cli.Main session adminReadPartySessionStorage \
    --namespace "$AB_NAMESPACE" \
    --partyId 'bRYfxSW3' \
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
    --body '{"psn": {"clientId": "l5alchPD", "clientSecret": "CWVMGhxw", "scope": "xqRMN7JD"}}' \
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
    --limit '89' \
    --userId '1cLpWYvd' \
    > test.out 2>&1
eval_tap $? 41 'AdminGetRecentPlayer' test.out

#- 42 AdminGetRecentTeamPlayer
./ng net.accelbyte.sdk.cli.Main session adminGetRecentTeamPlayer \
    --namespace "$AB_NAMESPACE" \
    --limit '30' \
    --userId 'ekn06WkM' \
    > test.out 2>&1
eval_tap $? 42 'AdminGetRecentTeamPlayer' test.out

#- 43 AdminReadSessionStorage
./ng net.accelbyte.sdk.cli.Main session adminReadSessionStorage \
    --namespace "$AB_NAMESPACE" \
    --sessionId '5fQWcGXl' \
    > test.out 2>&1
eval_tap $? 43 'AdminReadSessionStorage' test.out

#- 44 AdminDeleteUserSessionStorage
./ng net.accelbyte.sdk.cli.Main session adminDeleteUserSessionStorage \
    --namespace "$AB_NAMESPACE" \
    --sessionId '69RatKP6' \
    > test.out 2>&1
eval_tap $? 44 'AdminDeleteUserSessionStorage' test.out

#- 45 AdminReadUserSessionStorage
./ng net.accelbyte.sdk.cli.Main session adminReadUserSessionStorage \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'LlwQQiSd' \
    --userId 'hYVHRaTJ' \
    > test.out 2>&1
eval_tap $? 45 'AdminReadUserSessionStorage' test.out

#- 46 AdminQueryPlayerAttributes
./ng net.accelbyte.sdk.cli.Main session adminQueryPlayerAttributes \
    --namespace "$AB_NAMESPACE" \
    --users 'TlSccZax' \
    > test.out 2>&1
eval_tap $? 46 'AdminQueryPlayerAttributes' test.out

#- 47 AdminGetPlayerAttributes
./ng net.accelbyte.sdk.cli.Main session adminGetPlayerAttributes \
    --namespace "$AB_NAMESPACE" \
    --userId 'dUhmnnr0' \
    > test.out 2>&1
eval_tap $? 47 'AdminGetPlayerAttributes' test.out

#- 48 AdminSyncNativeSession
./ng net.accelbyte.sdk.cli.Main session adminSyncNativeSession \
    --namespace "$AB_NAMESPACE" \
    --userId 'LGFWqT9n' \
    > test.out 2>&1
eval_tap $? 48 'AdminSyncNativeSession' test.out

#- 49 CreateGameSession
./ng net.accelbyte.sdk.cli.Main session createGameSession \
    --namespace "$AB_NAMESPACE" \
    --resolveMaxActiveSession  \
    --body '{"appName": "CbCIM4ES", "attributes": {"ifkPvN9Y": {}, "9yhILPFi": {}, "c0X14hwn": {}}, "autoJoin": false, "backfillTicketID": "av38iLGU", "clientVersion": "vADTP8MA", "configurationName": "5eqXLk4K", "customURLGRPC": "PbPw6C3I", "deployment": "6rsxCHn9", "dsSource": "gQ7QwXti", "fallbackClaimKeys": ["kbREDqiA", "ZLXtmWLH", "bVIAfGRA"], "inactiveTimeout": 90, "inviteTimeout": 26, "joinability": "rNCJQHs9", "matchPool": "AaJajlPr", "maxPlayers": 65, "minPlayers": 53, "preferredClaimKeys": ["IPEstg0R", "FmNPjMzO", "teSTBWjm"], "requestedRegions": ["VgtDZLP8", "On55ydbA", "XzZaFLmI"], "serverName": "c0dflPFK", "storage": {"leader": {"SHZd9a67": {}, "mzAhF94P": {}, "Grw893nv": {}}}, "teams": [{"parties": [{"partyID": "7xJ0NXce", "userIDs": ["txqkdI6n", "5MpFxNJJ", "KcNmUeqy"]}, {"partyID": "1YfLIfwD", "userIDs": ["b6xJ1FHG", "05iynu0d", "SmORaGtb"]}, {"partyID": "KYEthdeT", "userIDs": ["sWoUuNo6", "JkSfyc4q", "7CrqgH0F"]}], "teamID": "FcFjcWdv", "userIDs": ["EYZNjiO0", "ymQsQqs9", "75aIsW8q"]}, {"parties": [{"partyID": "D3LICKKn", "userIDs": ["qUGUoJ4C", "NqxDYLnL", "aAbJfZ5m"]}, {"partyID": "Bv60006G", "userIDs": ["zsSR3Ada", "CztWG5f1", "6AQjx3W8"]}, {"partyID": "kssI8vqT", "userIDs": ["L2y0up1N", "TyeIJq96", "x0dY79S9"]}], "teamID": "AbrQWonB", "userIDs": ["yfS3upxB", "cy3tjpyb", "3PE0ETXr"]}, {"parties": [{"partyID": "ftDNjcdK", "userIDs": ["BQPl5d8M", "yZbtOAWM", "6CUKo852"]}, {"partyID": "XOuie1cy", "userIDs": ["cMVfZi9j", "6PoLWb9O", "osTDZlZF"]}, {"partyID": "Nb1CZc96", "userIDs": ["QCgm8gYJ", "Zz5XbIDI", "FI7Vn3Kc"]}], "teamID": "L9YXNMr3", "userIDs": ["FUxiIWCo", "saJhWAn7", "TTeir5II"]}], "textChat": false, "textChatMode": "TEAM", "ticketIDs": ["ZWPoEJ22", "cjFgQivc", "RmImaVBG"], "tieTeamsSessionLifetime": false, "type": "S247SlgO"}' \
    > test.out 2>&1
eval_tap $? 49 'CreateGameSession' test.out

#- 50 PublicQueryGameSessionsByAttributes
./ng net.accelbyte.sdk.cli.Main session publicQueryGameSessionsByAttributes \
    --namespace "$AB_NAMESPACE" \
    --body '{"m2IRiPPV": {}, "5gAuo5YW": {}, "t3i9zYHG": {}}' \
    > test.out 2>&1
eval_tap $? 50 'PublicQueryGameSessionsByAttributes' test.out

#- 51 PublicSessionJoinCode
./ng net.accelbyte.sdk.cli.Main session publicSessionJoinCode \
    --namespace "$AB_NAMESPACE" \
    --body '{"code": "R6NnKRQO"}' \
    > test.out 2>&1
eval_tap $? 51 'PublicSessionJoinCode' test.out

#- 52 GetGameSessionByPodName
./ng net.accelbyte.sdk.cli.Main session getGameSessionByPodName \
    --namespace "$AB_NAMESPACE" \
    --podName 'sIh2LVYB' \
    > test.out 2>&1
eval_tap $? 52 'GetGameSessionByPodName' test.out

#- 53 GetGameSession
./ng net.accelbyte.sdk.cli.Main session getGameSession \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'U5ui9a0e' \
    > test.out 2>&1
eval_tap $? 53 'GetGameSession' test.out

#- 54 UpdateGameSession
./ng net.accelbyte.sdk.cli.Main session updateGameSession \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'srx5Rgtl' \
    --body '{"attributes": {"p1vjXpci": {}, "gDX8mdmR": {}, "50RVKXLC": {}}, "backfillTicketID": "8mnXY3Uw", "clientVersion": "vzrY7Mqb", "deployment": "KEjNhLSe", "fallbackClaimKeys": ["DvwOoxS6", "bNHcZ02t", "toyYRZrA"], "inactiveTimeout": 86, "inviteTimeout": 98, "joinability": "Z2WkvpIa", "matchPool": "mC9YjsSE", "maxPlayers": 19, "minPlayers": 100, "preferredClaimKeys": ["L6wdCs6z", "2LPNzhJL", "L2tj2kCl"], "requestedRegions": ["Bac2OqRl", "yzDwiszQ", "cLUqq32b"], "teams": [{"parties": [{"partyID": "r39x7qHz", "userIDs": ["tX4anZJ5", "1ZsVFANo", "Q8CXwFI6"]}, {"partyID": "RhcbllP1", "userIDs": ["1orJzbk2", "u61qDYws", "etPS2FzQ"]}, {"partyID": "M4veuRYs", "userIDs": ["U9iPLZIj", "KfQIiBWa", "yNckGhS4"]}], "teamID": "CGVplZty", "userIDs": ["5cNaufsC", "v31PIXED", "TXrG1J6k"]}, {"parties": [{"partyID": "ejD3vFSN", "userIDs": ["tB5huqmm", "nTf5EJAi", "DC3x5vof"]}, {"partyID": "s8QbS4cF", "userIDs": ["qcIFxvXe", "uwLvopDv", "dR1FRdT0"]}, {"partyID": "smRU9Er3", "userIDs": ["p2RzPs46", "arBYyJoj", "G3zvAMaa"]}], "teamID": "XUUPACRa", "userIDs": ["b187uUpo", "Fb4pzw4q", "MTvFXutM"]}, {"parties": [{"partyID": "OyxMzDyw", "userIDs": ["lmU9EUyG", "GeRcfalH", "fWIyNwbc"]}, {"partyID": "DWZXySnk", "userIDs": ["PZMpzpDa", "wrGS5GVv", "41EgTnZp"]}, {"partyID": "FxtwVV3j", "userIDs": ["1IcN9Idt", "9eqim1X8", "mJASAp32"]}], "teamID": "TRkc3HSZ", "userIDs": ["CfB2rUyX", "5M30K5LM", "ihPaqSws"]}], "ticketIDs": ["ZR6A428u", "7vu6Erja", "AFg8jUoA"], "tieTeamsSessionLifetime": false, "type": "kEIySRKm", "version": 98}' \
    > test.out 2>&1
eval_tap $? 54 'UpdateGameSession' test.out

#- 55 DeleteGameSession
./ng net.accelbyte.sdk.cli.Main session deleteGameSession \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'gfS9puoE' \
    > test.out 2>&1
eval_tap $? 55 'DeleteGameSession' test.out

#- 56 PatchUpdateGameSession
./ng net.accelbyte.sdk.cli.Main session patchUpdateGameSession \
    --namespace "$AB_NAMESPACE" \
    --sessionId '5lXaqaI5' \
    --body '{"attributes": {"AaHsIKwL": {}, "wbe73pOi": {}, "BkKa4qF5": {}}, "backfillTicketID": "Et1Xmwgx", "clientVersion": "pKz0uPcy", "deployment": "44mgTBKv", "fallbackClaimKeys": ["C0TEYk20", "HvyDPsBb", "56S3NzUr"], "inactiveTimeout": 34, "inviteTimeout": 93, "joinability": "1qJluEqx", "matchPool": "HeUHvgzz", "maxPlayers": 43, "minPlayers": 45, "preferredClaimKeys": ["9IOnfHIy", "tyWiHrys", "IHU7Aymx"], "requestedRegions": ["NkoG0E2y", "GElveHIc", "DqCMaA0f"], "teams": [{"parties": [{"partyID": "T0zo2gq0", "userIDs": ["W4yuA8F8", "IwQGhZWc", "QEkZdT3t"]}, {"partyID": "bDt3FAVL", "userIDs": ["7wH2Eaxd", "Main5T8L", "LpLbVhkz"]}, {"partyID": "DzfqsGkW", "userIDs": ["eObsCMbG", "NQ9ZfXit", "qSCscms9"]}], "teamID": "UA35qExW", "userIDs": ["V5ffSjMe", "J7djQYNe", "c3xdXChb"]}, {"parties": [{"partyID": "xYQ2xiEP", "userIDs": ["6bbdwVCr", "XNtI2yFw", "rxOGsTKy"]}, {"partyID": "tKYfq7aE", "userIDs": ["eXyj9TIp", "LLBo7HjX", "P8ot2TZr"]}, {"partyID": "EB5N6wGT", "userIDs": ["W8XYvhgy", "oNMXBLPz", "pkA8qeSS"]}], "teamID": "7UYlvdU1", "userIDs": ["5DqxEdom", "U1dkCS2h", "oPEFm4QP"]}, {"parties": [{"partyID": "WggcV3h5", "userIDs": ["1k3rub4U", "kxBvNW1B", "60HSC8cn"]}, {"partyID": "yLJDm6kX", "userIDs": ["M0XSa4Ue", "M53HM0MN", "XMjSwRDm"]}, {"partyID": "5rhKz4Lu", "userIDs": ["eVNvtRf4", "YT7bPQSZ", "pknxaXy4"]}], "teamID": "Qs2JB50T", "userIDs": ["vzoDTFsP", "cmtOLd54", "bVLZSJnM"]}], "ticketIDs": ["46u0TU4W", "Uh7Fr5z6", "lzC9Ieae"], "tieTeamsSessionLifetime": false, "type": "L3It80J1", "version": 87}' \
    > test.out 2>&1
eval_tap $? 56 'PatchUpdateGameSession' test.out

#- 57 UpdateGameSessionBackfillTicketID
./ng net.accelbyte.sdk.cli.Main session updateGameSessionBackfillTicketID \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'k9vFcwFF' \
    --body '{"backfillTicketID": "SEgKm6qD"}' \
    > test.out 2>&1
eval_tap $? 57 'UpdateGameSessionBackfillTicketID' test.out

#- 58 GameSessionGenerateCode
./ng net.accelbyte.sdk.cli.Main session gameSessionGenerateCode \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'GGMeg0Ow' \
    > test.out 2>&1
eval_tap $? 58 'GameSessionGenerateCode' test.out

#- 59 PublicRevokeGameSessionCode
./ng net.accelbyte.sdk.cli.Main session publicRevokeGameSessionCode \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'm0zVIPJe' \
    > test.out 2>&1
eval_tap $? 59 'PublicRevokeGameSessionCode' test.out

#- 60 PublicGameSessionInvite
./ng net.accelbyte.sdk.cli.Main session publicGameSessionInvite \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'uUtZKcjG' \
    --body '{"metadata": {"is1YdbqD": "UTfMURIq", "eHvlb9gC": "O9NJDONf", "jFiKIWCC": "8qFOImJ9"}, "platformID": "Wz0TS3Qq", "userID": "XMn8fV4Z"}' \
    > test.out 2>&1
eval_tap $? 60 'PublicGameSessionInvite' test.out

#- 61 JoinGameSession
./ng net.accelbyte.sdk.cli.Main session joinGameSession \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'I9hAZan8' \
    > test.out 2>&1
eval_tap $? 61 'JoinGameSession' test.out

#- 62 PublicPromoteGameSessionLeader
./ng net.accelbyte.sdk.cli.Main session publicPromoteGameSessionLeader \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'IaULeAQd' \
    --body '{"leaderID": "ApJ4Hs7c"}' \
    > test.out 2>&1
eval_tap $? 62 'PublicPromoteGameSessionLeader' test.out

#- 63 LeaveGameSession
./ng net.accelbyte.sdk.cli.Main session leaveGameSession \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'rRlKblcc' \
    > test.out 2>&1
eval_tap $? 63 'LeaveGameSession' test.out

#- 64 PublicKickGameSessionMember
./ng net.accelbyte.sdk.cli.Main session publicKickGameSessionMember \
    --memberId 'C6qACLWb' \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'jlLpJ9ug' \
    > test.out 2>&1
eval_tap $? 64 'PublicKickGameSessionMember' test.out

#- 65 PublicGameSessionReject
./ng net.accelbyte.sdk.cli.Main session publicGameSessionReject \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'AswfUdN1' \
    > test.out 2>&1
eval_tap $? 65 'PublicGameSessionReject' test.out

#- 66 GetSessionServerSecret
./ng net.accelbyte.sdk.cli.Main session getSessionServerSecret \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'ZclU3SiC' \
    > test.out 2>&1
eval_tap $? 66 'GetSessionServerSecret' test.out

#- 67 AppendTeamGameSession
eval_tap 0 67 'AppendTeamGameSession # SKIP deprecated' test.out

#- 68 PublicGameSessionCancel
./ng net.accelbyte.sdk.cli.Main session publicGameSessionCancel \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'xYXyIJtL' \
    --userId 'Wb9zch2P' \
    > test.out 2>&1
eval_tap $? 68 'PublicGameSessionCancel' test.out

#- 69 PublicPartyJoinCode
./ng net.accelbyte.sdk.cli.Main session publicPartyJoinCode \
    --namespace "$AB_NAMESPACE" \
    --body '{"code": "saNQLjYl"}' \
    > test.out 2>&1
eval_tap $? 69 'PublicPartyJoinCode' test.out

#- 70 PublicGetParty
./ng net.accelbyte.sdk.cli.Main session publicGetParty \
    --namespace "$AB_NAMESPACE" \
    --partyId 'VMYFyxdQ' \
    > test.out 2>&1
eval_tap $? 70 'PublicGetParty' test.out

#- 71 PublicUpdateParty
./ng net.accelbyte.sdk.cli.Main session publicUpdateParty \
    --namespace "$AB_NAMESPACE" \
    --partyId '6qrNxDGp' \
    --body '{"attributes": {"DnUAvkza": {}, "Vj9VgjHo": {}, "McgapyZg": {}}, "inactiveTimeout": 70, "inviteTimeout": 73, "joinability": "03LIeJH6", "maxPlayers": 60, "minPlayers": 99, "type": "U3AY9JKn", "version": 7}' \
    > test.out 2>&1
eval_tap $? 71 'PublicUpdateParty' test.out

#- 72 PublicPatchUpdateParty
./ng net.accelbyte.sdk.cli.Main session publicPatchUpdateParty \
    --namespace "$AB_NAMESPACE" \
    --partyId 'I5EWbbKa' \
    --body '{"attributes": {"oTG7tZwv": {}, "mNkYWvtr": {}, "ow0JosWg": {}}, "inactiveTimeout": 99, "inviteTimeout": 67, "joinability": "IVfx2lYq", "maxPlayers": 80, "minPlayers": 96, "type": "M0mhc5AU", "version": 10}' \
    > test.out 2>&1
eval_tap $? 72 'PublicPatchUpdateParty' test.out

#- 73 PublicGeneratePartyCode
./ng net.accelbyte.sdk.cli.Main session publicGeneratePartyCode \
    --namespace "$AB_NAMESPACE" \
    --partyId '0NZxSEWG' \
    > test.out 2>&1
eval_tap $? 73 'PublicGeneratePartyCode' test.out

#- 74 PublicRevokePartyCode
./ng net.accelbyte.sdk.cli.Main session publicRevokePartyCode \
    --namespace "$AB_NAMESPACE" \
    --partyId 'Rq7RAV3o' \
    > test.out 2>&1
eval_tap $? 74 'PublicRevokePartyCode' test.out

#- 75 PublicPartyInvite
./ng net.accelbyte.sdk.cli.Main session publicPartyInvite \
    --namespace "$AB_NAMESPACE" \
    --partyId 'twXphgay' \
    --body '{"metadata": {"pTwvkXsx": "z59hPB35", "tS0AdoY9": "srmEGAe4", "r61Zjpn4": "K6ZiWYI7"}, "platformID": "DcFvuOtl", "userID": "zYbhFUyV"}' \
    > test.out 2>&1
eval_tap $? 75 'PublicPartyInvite' test.out

#- 76 PublicPromotePartyLeader
./ng net.accelbyte.sdk.cli.Main session publicPromotePartyLeader \
    --namespace "$AB_NAMESPACE" \
    --partyId 'etntktcM' \
    --body '{"leaderID": "lzjNUvDe"}' \
    > test.out 2>&1
eval_tap $? 76 'PublicPromotePartyLeader' test.out

#- 77 PublicReadPartySessionStorage
./ng net.accelbyte.sdk.cli.Main session publicReadPartySessionStorage \
    --namespace "$AB_NAMESPACE" \
    --partyId 'DIk379Tk' \
    > test.out 2>&1
eval_tap $? 77 'PublicReadPartySessionStorage' test.out

#- 78 PublicUpdateInsertPartySessionStorageReserved
./ng net.accelbyte.sdk.cli.Main session publicUpdateInsertPartySessionStorageReserved \
    --namespace "$AB_NAMESPACE" \
    --partyId 'zdPmB2hf' \
    --userId 'iDjWSkzC' \
    --body '{"Jdm69qUw": {}, "sw8tUKkm": {}, "MBFGAyrP": {}}' \
    > test.out 2>&1
eval_tap $? 78 'PublicUpdateInsertPartySessionStorageReserved' test.out

#- 79 PublicPartyJoin
./ng net.accelbyte.sdk.cli.Main session publicPartyJoin \
    --namespace "$AB_NAMESPACE" \
    --partyId 'hsCHEvuX' \
    > test.out 2>&1
eval_tap $? 79 'PublicPartyJoin' test.out

#- 80 PublicPartyLeave
./ng net.accelbyte.sdk.cli.Main session publicPartyLeave \
    --namespace "$AB_NAMESPACE" \
    --partyId 'gTLKgjw8' \
    > test.out 2>&1
eval_tap $? 80 'PublicPartyLeave' test.out

#- 81 PublicPartyReject
./ng net.accelbyte.sdk.cli.Main session publicPartyReject \
    --namespace "$AB_NAMESPACE" \
    --partyId 'yQHKUFNe' \
    > test.out 2>&1
eval_tap $? 81 'PublicPartyReject' test.out

#- 82 PublicPartyCancel
./ng net.accelbyte.sdk.cli.Main session publicPartyCancel \
    --namespace "$AB_NAMESPACE" \
    --partyId 'StfGJRxQ' \
    --userId 'Jg3rYwe6' \
    > test.out 2>&1
eval_tap $? 82 'PublicPartyCancel' test.out

#- 83 PublicPartyKick
./ng net.accelbyte.sdk.cli.Main session publicPartyKick \
    --namespace "$AB_NAMESPACE" \
    --partyId 'UCFZI6i7' \
    --userId 'CDt7IC4u' \
    > test.out 2>&1
eval_tap $? 83 'PublicPartyKick' test.out

#- 84 PublicCreateParty
./ng net.accelbyte.sdk.cli.Main session publicCreateParty \
    --namespace "$AB_NAMESPACE" \
    --body '{"attributes": {"9ZWFZOSI": {}, "2yl86U14": {}, "cm2QQ2hk": {}}, "configurationName": "iyLPUKUx", "inactiveTimeout": 19, "inviteTimeout": 20, "joinability": "faMn1pd3", "maxPlayers": 96, "members": [{"ID": "35Bn1fkD", "PlatformID": "R1a1iYlu", "PlatformUserID": "6S7uSM4H"}, {"ID": "YKEd0vzn", "PlatformID": "Sm7PYbiV", "PlatformUserID": "TZlz1qW3"}, {"ID": "YlGq1ClY", "PlatformID": "HJd405f2", "PlatformUserID": "HwdspuNW"}], "minPlayers": 89, "textChat": false, "type": "clZHHM0w"}' \
    > test.out 2>&1
eval_tap $? 84 'PublicCreateParty' test.out

#- 85 PublicGetRecentPlayer
./ng net.accelbyte.sdk.cli.Main session publicGetRecentPlayer \
    --namespace "$AB_NAMESPACE" \
    --limit '66' \
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
    --sessionId 'DRY9osN6' \
    --body '{"KYNsol9F": {}, "MOqor7lQ": {}, "3eTqDXaQ": {}}' \
    > test.out 2>&1
eval_tap $? 87 'PublicUpdateInsertSessionStorageLeader' test.out

#- 88 PublicUpdateInsertSessionStorage
./ng net.accelbyte.sdk.cli.Main session publicUpdateInsertSessionStorage \
    --namespace "$AB_NAMESPACE" \
    --sessionId '8G4jjjPm' \
    --userId 'IaRyhRtq' \
    --body '{"NLO9L9XN": {}, "bUq3KpYD": {}, "zPMnZxj0": {}}' \
    > test.out 2>&1
eval_tap $? 88 'PublicUpdateInsertSessionStorage' test.out

#- 89 PublicGetBulkPlayerCurrentPlatform
./ng net.accelbyte.sdk.cli.Main session publicGetBulkPlayerCurrentPlatform \
    --namespace "$AB_NAMESPACE" \
    --body '{"userIDs": ["g9JiZOGT", "H7rMDQFY", "eklB6FNu"]}' \
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
    --body '{"crossplayEnabled": false, "currentPlatform": "IiaXG9Ju", "data": {"FYzIENh6": {}, "bjlEKI4M": {}, "Vv6QTyAF": {}}, "platforms": [{"name": "vRyoeggR", "userID": "w9TJMXRX"}, {"name": "uGQ86m67", "userID": "BlTE7gRW"}, {"name": "POIVyi7K", "userID": "Vku8Ng8l"}], "roles": ["iNweTypz", "oXR9khP9", "JAxwY899"], "simultaneousPlatform": "RNyXU3o7"}' \
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
    --order 'HDxvOyoy' \
    --orderBy '6YYlJfzx' \
    --status 'NQZMQl0e' \
    > test.out 2>&1
eval_tap $? 93 'PublicQueryMyGameSessions' test.out

#- 94 PublicQueryMyParties
./ng net.accelbyte.sdk.cli.Main session publicQueryMyParties \
    --namespace "$AB_NAMESPACE" \
    --order '11hDiH2P' \
    --orderBy 'zy1ehWxZ' \
    --status '8Vrm9xia' \
    > test.out 2>&1
eval_tap $? 94 'PublicQueryMyParties' test.out


rm -f "tmp.dat"

exit $EXIT_CODE