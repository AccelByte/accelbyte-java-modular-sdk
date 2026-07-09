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
    --body '{"logLevel": "warning"}' \
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
    --body '{"metricExcludedNamespaces": ["DkM2ExF9", "sS3xykmU", "EkrlrfhG"], "regionRetryMapping": {"3p44fWdu": ["T9Qiq5F4", "gm5duweT", "9mAqcpYS"], "dq8v691Z": ["kUYpp0zK", "42PP2Hfw", "iz4az1Ml"], "EZZ5jBMu": ["GM1tf1OD", "VxLlSOkC", "yY88rHl4"]}, "regionURLMapping": ["0gMD87vm", "HAIWHfUY", "JYhXLMnV"], "testGameMode": "Qy1fFlAD", "testRegionURLMapping": ["ZDXX8x0r", "n45oxYfl", "LVpQDUTX"], "testTargetUserIDs": ["9k6z7BEu", "X8xoVRh8", "5fF9gfmb"]}' \
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
    --body '{"durationDays": 2}' \
    > test.out 2>&1
eval_tap $? 12 'AdminUpdateConfigurationAlertV1' test.out

#- 13 AdminCreateConfigurationAlertV1
./ng net.accelbyte.sdk.cli.Main session adminCreateConfigurationAlertV1 \
    --namespace "$AB_NAMESPACE" \
    --body '{"durationDays": 36}' \
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
    --body '{"NativeSessionSetting": {"PSNDisableSystemUIMenu": ["PROMOTE_TO_LEADER", "UPDATE_JOINABLE_USER_TYPE", "KICK"], "PSNServiceLabel": 92, "PSNSupportedPlatforms": ["eUe6Z26W", "r7VcMYz1", "SQQzOnK6"], "SessionTitle": "22kMAcLB", "ShouldSync": false, "XboxAllowCrossPlatform": true, "XboxSandboxID": "RQaXuCFg", "XboxServiceConfigID": "ufPK6guH", "XboxSessionTemplateName": "cy0kVjHF", "XboxTitleID": "6P69hDrh", "activePlatforms": ["KaVNxTDU", "tuAAf4Ay", "ejenBmlb"], "localizedSessionName": {"mEokYeRt": {}, "504CAMqr": {}, "AAhSZXXv": {}}}, "PSNBaseUrl": "FO2VeyGy", "amsClaimTimeoutMinutes": 69, "appName": "R01JIyjH", "asyncProcessDSRequest": {"async": false, "timeout": 44}, "attributes": {"dYB5c742": {}, "fWKYKT4q": {}, "XFjBXHlq": {}}, "autoJoin": true, "autoLeaveSession": false, "clientVersion": "6y9crRxq", "customURLGRPC": "MxTOLSLo", "deployment": "JrSu41r4", "disableCodeGeneration": true, "disableResendInvite": false, "dsManualSetReady": false, "dsSource": "w0EWkCCU", "enableSecret": false, "fallbackClaimKeys": ["WAtVnGET", "9xCibMzz", "VvPdqoUt"], "grpcSessionConfig": {"appName": "Wvkk0OCo", "customURL": "R3fvJ06Q", "functionFlag": 49}, "immutableStorage": false, "inactiveTimeout": 41, "inviteTimeout": 5, "joinability": "OPEN", "leaderElectionGracePeriod": 52, "manualRejoin": true, "maxActiveSessions": 7, "maxPlayers": 76, "minPlayers": 36, "name": "ACCB2tdp", "partyCodeGeneratorString": "i1GhwEID", "partyCodeLength": 56, "persistent": false, "preferredClaimKeys": ["Dt5leL0r", "wk5tXDF7", "SBuF7xSB"], "requestedRegions": ["K6NOKiDA", "QfAQZZ93", "icIA5773"], "textChat": false, "textChatMode": "GAME_AND_TEAM", "tieTeamsSessionLifetime": true, "ttlHours": 95, "type": "P2P"}' \
    > test.out 2>&1
eval_tap $? 16 'AdminCreateConfigurationTemplateV1' test.out

#- 17 AdminGetAllConfigurationTemplatesV1
./ng net.accelbyte.sdk.cli.Main session adminGetAllConfigurationTemplatesV1 \
    --namespace "$AB_NAMESPACE" \
    --limit '26' \
    --name 'lXlRbqMY' \
    --offset '35' \
    --order '9cPWIKYa' \
    --orderBy 'xWkcfHCi' \
    > test.out 2>&1
eval_tap $? 17 'AdminGetAllConfigurationTemplatesV1' test.out

#- 18 AdminGetConfigurationTemplateV1
./ng net.accelbyte.sdk.cli.Main session adminGetConfigurationTemplateV1 \
    --name 'J06LdWKX' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 18 'AdminGetConfigurationTemplateV1' test.out

#- 19 AdminUpdateConfigurationTemplateV1
./ng net.accelbyte.sdk.cli.Main session adminUpdateConfigurationTemplateV1 \
    --name 'DWPACQPg' \
    --namespace "$AB_NAMESPACE" \
    --body '{"NativeSessionSetting": {"PSNDisableSystemUIMenu": ["UPDATE_INVITABLE_USER_TYPE", "KICK", "UPDATE_INVITABLE_USER_TYPE"], "PSNServiceLabel": 37, "PSNSupportedPlatforms": ["GiJ9E9pw", "5kqNxmtD", "uSexuSMW"], "SessionTitle": "eigO5Jn8", "ShouldSync": true, "XboxAllowCrossPlatform": true, "XboxSandboxID": "esH4oajo", "XboxServiceConfigID": "vHIoMoSk", "XboxSessionTemplateName": "CeyJYtpU", "XboxTitleID": "cri6Pa7m", "activePlatforms": ["KvSgrPCb", "rxjIQHsc", "S6YXSVTw"], "localizedSessionName": {"kUPgHix7": {}, "H6sRY3KR": {}, "Vlvznnv7": {}}}, "PSNBaseUrl": "d1iFIgTu", "amsClaimTimeoutMinutes": 49, "appName": "DIMfQcv6", "asyncProcessDSRequest": {"async": true, "timeout": 43}, "attributes": {"PKk8rMOm": {}, "uDgaM69F": {}, "nvtYRwni": {}}, "autoJoin": false, "autoLeaveSession": false, "clientVersion": "7vHUqsl3", "customURLGRPC": "q5C2Kle0", "deployment": "csNijuLz", "disableCodeGeneration": true, "disableResendInvite": true, "dsManualSetReady": true, "dsSource": "idfWYb21", "enableSecret": true, "fallbackClaimKeys": ["Za3YXIkc", "lImkaynb", "TU7bjLh3"], "grpcSessionConfig": {"appName": "Nyiov6Kx", "customURL": "VV17gZ80", "functionFlag": 12}, "immutableStorage": false, "inactiveTimeout": 21, "inviteTimeout": 29, "joinability": "FRIENDS_OF_FRIENDS", "leaderElectionGracePeriod": 52, "manualRejoin": false, "maxActiveSessions": 56, "maxPlayers": 71, "minPlayers": 88, "name": "MbQdklVo", "partyCodeGeneratorString": "PH5CYdYW", "partyCodeLength": 44, "persistent": false, "preferredClaimKeys": ["k8FzCBJ6", "KXNbdPOh", "XTDxWswl"], "requestedRegions": ["39u4Qeea", "IU40UmsT", "kWhCy4a4"], "textChat": false, "textChatMode": "GAME_AND_TEAM", "tieTeamsSessionLifetime": false, "ttlHours": 56, "type": "P2P"}' \
    > test.out 2>&1
eval_tap $? 19 'AdminUpdateConfigurationTemplateV1' test.out

#- 20 AdminDeleteConfigurationTemplateV1
./ng net.accelbyte.sdk.cli.Main session adminDeleteConfigurationTemplateV1 \
    --name 'i6bsZsGl' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 20 'AdminDeleteConfigurationTemplateV1' test.out

#- 21 AdminGetMemberActiveSession
./ng net.accelbyte.sdk.cli.Main session adminGetMemberActiveSession \
    --name 'K5jGRQlk' \
    --namespace "$AB_NAMESPACE" \
    --userId 'uqScx39n' \
    > test.out 2>&1
eval_tap $? 21 'AdminGetMemberActiveSession' test.out

#- 22 AdminReconcileMaxActiveSession
./ng net.accelbyte.sdk.cli.Main session adminReconcileMaxActiveSession \
    --name 'WHJvjMo5' \
    --namespace "$AB_NAMESPACE" \
    --body '{"userID": "Tr852YRM"}' \
    > test.out 2>&1
eval_tap $? 22 'AdminReconcileMaxActiveSession' test.out

#- 23 AdminGetDSMCConfiguration
eval_tap 0 23 'AdminGetDSMCConfiguration # SKIP deprecated' test.out

#- 24 AdminSyncDSMCConfiguration
eval_tap 0 24 'AdminSyncDSMCConfiguration # SKIP deprecated' test.out

#- 25 AdminQueryGameSessions
./ng net.accelbyte.sdk.cli.Main session adminQueryGameSessions \
    --namespace "$AB_NAMESPACE" \
    --configurationName 'LVo7OQvv' \
    --dsPodName '5HIEfB8u' \
    --fromTime 'K6SWIQPn' \
    --gameMode '9z358Iog' \
    --isPersistent 'HDx2NC6h' \
    --isSoftDeleted 'I2QfzZAE' \
    --joinability 'FRIENDS_OF_FRIENDS' \
    --limit '74' \
    --matchPool 'sxPsYE06' \
    --memberID 'uPb7CJ9D' \
    --offset '31' \
    --order 'sBuAeZxy' \
    --orderBy 'GiXHCo4k' \
    --sessionID 'UnycizGT' \
    --status 'NEED_TO_REQUEST' \
    --statusV2 'AVAILABLE' \
    --toTime 'CICv2AwX' \
    > test.out 2>&1
eval_tap $? 25 'AdminQueryGameSessions' test.out

#- 26 AdminQueryGameSessionsByAttributes
./ng net.accelbyte.sdk.cli.Main session adminQueryGameSessionsByAttributes \
    --namespace "$AB_NAMESPACE" \
    --body '{"J4RSr0WB": {}, "yqSLwNkj": {}, "cuK36RSZ": {}}' \
    > test.out 2>&1
eval_tap $? 26 'AdminQueryGameSessionsByAttributes' test.out

#- 27 AdminDeleteBulkGameSessions
./ng net.accelbyte.sdk.cli.Main session adminDeleteBulkGameSessions \
    --namespace "$AB_NAMESPACE" \
    --body '{"ids": ["Nl5FwmZP", "SxrkVbHh", "bHDRCpfD"]}' \
    > test.out 2>&1
eval_tap $? 27 'AdminDeleteBulkGameSessions' test.out

#- 28 AdminSetDSReady
./ng net.accelbyte.sdk.cli.Main session adminSetDSReady \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'A2g1mnL6' \
    --body '{"ready": true}' \
    > test.out 2>&1
eval_tap $? 28 'AdminSetDSReady' test.out

#- 29 AdminUpdateDSInformation
./ng net.accelbyte.sdk.cli.Main session adminUpdateDSInformation \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'IAGEOXDa' \
    --body '{"createdRegion": "na9eFXpJ", "deployment": "3ZpxDAFh", "description": "dnaZcwvC", "ip": "NLqXiFJ0", "port": 94, "region": "SQvVyw6C", "serverId": "J3xyB4VP", "source": "90HPIuU9", "status": "DS_ERROR"}' \
    > test.out 2>&1
eval_tap $? 29 'AdminUpdateDSInformation' test.out

#- 30 AdminKickGameSessionMember
./ng net.accelbyte.sdk.cli.Main session adminKickGameSessionMember \
    --memberId 'Aj6tQ97Y' \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'UGqEBsG5' \
    > test.out 2>&1
eval_tap $? 30 'AdminKickGameSessionMember' test.out

#- 31 AdminUpdateGameSessionMember
./ng net.accelbyte.sdk.cli.Main session adminUpdateGameSessionMember \
    --memberId 'RGnfB3rQ' \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'ihPUtDZW' \
    --statusType 'y1cSn3ye' \
    > test.out 2>&1
eval_tap $? 31 'AdminUpdateGameSessionMember' test.out

#- 32 AdminGetListNativeSession
./ng net.accelbyte.sdk.cli.Main session adminGetListNativeSession \
    --namespace "$AB_NAMESPACE" \
    --limit '26' \
    --offset '80' \
    --order 'pCBf9Omi' \
    > test.out 2>&1
eval_tap $? 32 'AdminGetListNativeSession' test.out

#- 33 AdminQueryParties
./ng net.accelbyte.sdk.cli.Main session adminQueryParties \
    --namespace "$AB_NAMESPACE" \
    --configurationName 'QYMYiDRZ' \
    --fromTime 'LCm5cZ8n' \
    --isSoftDeleted 'GONb74Z4' \
    --joinability 'FRIENDS_OF_MEMBERS' \
    --key 'NsKEX0WY' \
    --leaderID 'IeVmyxCS' \
    --limit '1' \
    --memberID '7hjjUg3Y' \
    --memberStatus 'DROPPED' \
    --offset '6' \
    --order 'pSlRcGKb' \
    --orderBy 'Pq6h8ZaH' \
    --partyID 'tLoJWwyY' \
    --toTime 'uurewmzk' \
    --value 'GwDD6pxt' \
    > test.out 2>&1
eval_tap $? 33 'AdminQueryParties' test.out

#- 34 AdminDeleteBulkParties
./ng net.accelbyte.sdk.cli.Main session adminDeleteBulkParties \
    --namespace "$AB_NAMESPACE" \
    --body '{"ids": ["8DOlKtdp", "691D3lSq", "wQuUarKA"]}' \
    > test.out 2>&1
eval_tap $? 34 'AdminDeleteBulkParties' test.out

#- 35 AdminReadPartySessionStorage
./ng net.accelbyte.sdk.cli.Main session adminReadPartySessionStorage \
    --namespace "$AB_NAMESPACE" \
    --partyId 'ohyCRYdy' \
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
    --body '{"psn": {"clientId": "gYB1jzCL", "clientSecret": "8WEVWMWA", "scope": "gStwCgGh"}}' \
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
    --description 'WcWMeGAX' \
    --file 'tmp.dat' \
    --password 'zLLPEqnL' \
    > test.out 2>&1
eval_tap $? 41 'AdminUploadPlatformCredentials' test.out

#- 42 AdminGetRecentPlayer
./ng net.accelbyte.sdk.cli.Main session adminGetRecentPlayer \
    --namespace "$AB_NAMESPACE" \
    --limit '60' \
    --userId 'k47rwpsf' \
    > test.out 2>&1
eval_tap $? 42 'AdminGetRecentPlayer' test.out

#- 43 AdminGetRecentTeamPlayer
./ng net.accelbyte.sdk.cli.Main session adminGetRecentTeamPlayer \
    --namespace "$AB_NAMESPACE" \
    --limit '51' \
    --userId 'hHh0ya0i' \
    > test.out 2>&1
eval_tap $? 43 'AdminGetRecentTeamPlayer' test.out

#- 44 AdminReadSessionStorage
./ng net.accelbyte.sdk.cli.Main session adminReadSessionStorage \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'nbWkeBl3' \
    > test.out 2>&1
eval_tap $? 44 'AdminReadSessionStorage' test.out

#- 45 AdminDeleteUserSessionStorage
./ng net.accelbyte.sdk.cli.Main session adminDeleteUserSessionStorage \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'RYPyLUVc' \
    > test.out 2>&1
eval_tap $? 45 'AdminDeleteUserSessionStorage' test.out

#- 46 AdminReadUserSessionStorage
./ng net.accelbyte.sdk.cli.Main session adminReadUserSessionStorage \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'jOpkv7nN' \
    --userId 'kjgcFw5o' \
    > test.out 2>&1
eval_tap $? 46 'AdminReadUserSessionStorage' test.out

#- 47 AdminQueryPlayerAttributes
./ng net.accelbyte.sdk.cli.Main session adminQueryPlayerAttributes \
    --namespace "$AB_NAMESPACE" \
    --users 'VFhcFnM8' \
    > test.out 2>&1
eval_tap $? 47 'AdminQueryPlayerAttributes' test.out

#- 48 AdminGetPlayerAttributes
./ng net.accelbyte.sdk.cli.Main session adminGetPlayerAttributes \
    --namespace "$AB_NAMESPACE" \
    --userId 'PuH5i8KR' \
    > test.out 2>&1
eval_tap $? 48 'AdminGetPlayerAttributes' test.out

#- 49 AdminSyncNativeSession
./ng net.accelbyte.sdk.cli.Main session adminSyncNativeSession \
    --namespace "$AB_NAMESPACE" \
    --userId 'dWqfafNG' \
    > test.out 2>&1
eval_tap $? 49 'AdminSyncNativeSession' test.out

#- 50 CreateGameSession
./ng net.accelbyte.sdk.cli.Main session createGameSession \
    --namespace "$AB_NAMESPACE" \
    --resolveMaxActiveSession  \
    --body '{"appName": "I9iGQWzA", "attributes": {"URvJIl03": {}, "8Zt2p8BV": {}, "FupD50f1": {}}, "autoJoin": true, "backfillTicketID": "VzfKlPnb", "clientVersion": "Pq3TQ9Ub", "configurationName": "BWCQS70j", "customURLGRPC": "zyPIsWVe", "deployment": "cvKUt8hb", "dsSource": "u9Q36skn", "fallbackClaimKeys": ["2gZ2P8UA", "C2F74I1X", "KV1djrso"], "inactiveTimeout": 31, "inviteTimeout": 49, "joinability": "FRIENDS_OF_MEMBERS", "matchPool": "LXa0btzV", "maxPlayers": 25, "minPlayers": 71, "password": "fvQncP3V", "preferredClaimKeys": ["QBZGFsQW", "HjSjiFzv", "lWbABKlQ"], "requestedRegions": ["BEArkTjQ", "cnbchFVb", "EBh28VI4"], "serverName": "6CSe8Sdr", "storage": {"leader": {"85n3Dz8F": {}, "sLSf5OGD": {}, "Xukk9w61": {}}}, "teams": [{"parties": [{"partyID": "ibwlqE0X", "userIDs": ["kKcgVfyB", "HvwRzoET", "j5JPjEr3"]}, {"partyID": "M6qHKqLO", "userIDs": ["P7XQNBXv", "pQWA4Sdv", "65a01HOF"]}, {"partyID": "c3uL4gV1", "userIDs": ["e68kUxQC", "hGbSp2qy", "QRvwNbkT"]}], "teamID": "DtMhR35i", "userIDs": ["tzDM80M8", "xLFMJ5De", "Qd6taYUa"]}, {"parties": [{"partyID": "58XNMJkU", "userIDs": ["kJvjidJQ", "EbGX81fO", "osdaSzPe"]}, {"partyID": "0I7CDiH3", "userIDs": ["QwMb6TkF", "9hQORv0Y", "s8xF1ooJ"]}, {"partyID": "9IgPN5MI", "userIDs": ["TmYOjAcL", "AkURKYvI", "K03vOdZY"]}], "teamID": "y7gjmuB0", "userIDs": ["zdSsg1Mg", "r3qKTu5w", "Ai85LRnP"]}, {"parties": [{"partyID": "z7ytjcMm", "userIDs": ["HSweQ9ZG", "snMSwiEQ", "OcQCoumP"]}, {"partyID": "pFZehW05", "userIDs": ["iQ7DJdq3", "2i2FOG2q", "8GIVkoiF"]}, {"partyID": "V4n0DoOu", "userIDs": ["nr9ur7xz", "bKBF7g8b", "RfDA58iC"]}], "teamID": "3GOUu5TB", "userIDs": ["QhMVfpe5", "aIp90RVs", "I7cPJSQg"]}], "textChat": true, "textChatMode": "GAME", "ticketIDs": ["WHBpat09", "ctKcWP7L", "CQEp7Hhn"], "tieTeamsSessionLifetime": false, "type": "DS"}' \
    > test.out 2>&1
eval_tap $? 50 'CreateGameSession' test.out

#- 51 PublicQueryGameSessionsByAttributes
./ng net.accelbyte.sdk.cli.Main session publicQueryGameSessionsByAttributes \
    --namespace "$AB_NAMESPACE" \
    --body '{"eY7OLjDm": {}, "OGv8wKWO": {}, "xkwNkcB2": {}}' \
    > test.out 2>&1
eval_tap $? 51 'PublicQueryGameSessionsByAttributes' test.out

#- 52 PublicSessionJoinCode
./ng net.accelbyte.sdk.cli.Main session publicSessionJoinCode \
    --namespace "$AB_NAMESPACE" \
    --body '{"code": "mMpbkIw3"}' \
    > test.out 2>&1
eval_tap $? 52 'PublicSessionJoinCode' test.out

#- 53 GetGameSessionByPodName
./ng net.accelbyte.sdk.cli.Main session getGameSessionByPodName \
    --namespace "$AB_NAMESPACE" \
    --podName 'RKrlsAUM' \
    > test.out 2>&1
eval_tap $? 53 'GetGameSessionByPodName' test.out

#- 54 GetGameSession
./ng net.accelbyte.sdk.cli.Main session getGameSession \
    --namespace "$AB_NAMESPACE" \
    --sessionId '5GpS10Xh' \
    > test.out 2>&1
eval_tap $? 54 'GetGameSession' test.out

#- 55 UpdateGameSession
./ng net.accelbyte.sdk.cli.Main session updateGameSession \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'cu4sBioM' \
    --body '{"attributes": {"PgkSU4NC": {}, "Kop8wTPR": {}, "k3lh6Vd8": {}}, "backfillTicketID": "xRlFRAXJ", "clientVersion": "sRmMJLnm", "deployment": "hBrfzBtG", "fallbackClaimKeys": ["NkWYABzR", "ukcHiESI", "ZZ4FWfpW"], "inactiveTimeout": 12, "inviteTimeout": 93, "joinability": "PASSWORD_PROTECTED", "matchPool": "KlFK32yT", "maxPlayers": 84, "minPlayers": 92, "password": "azES0cIG", "preferredClaimKeys": ["TtdN1etb", "hnpY8VZC", "Y0p7RwBj"], "requestedRegions": ["85Ewxz8m", "d4sRnI90", "0yomiKkq"], "teams": [{"parties": [{"partyID": "gmT6yJtA", "userIDs": ["RrqCJfFK", "A1pIq6Ij", "OpJP5zpE"]}, {"partyID": "5i2ahGhf", "userIDs": ["z96ZI9HK", "X6v8Bn2l", "OXA3FtGF"]}, {"partyID": "DSQvfDcd", "userIDs": ["Tnqd65d6", "b45UZmXA", "itWSExhn"]}], "teamID": "kXovtP3E", "userIDs": ["Qg5nWpnH", "jN4fVsw0", "5rnPlazZ"]}, {"parties": [{"partyID": "J5z65XbL", "userIDs": ["PokfkSSQ", "BC2LZMOj", "Df1Ax7av"]}, {"partyID": "4hn5EUNC", "userIDs": ["TuqlMQtC", "ZGLSG0sZ", "O5Q22Zv6"]}, {"partyID": "ByJszzpI", "userIDs": ["eelW1pTb", "xyNLpEpr", "MNVoUQ5c"]}], "teamID": "24nBsMwV", "userIDs": ["QcweAk26", "lQMzmD6p", "TmPljb5V"]}, {"parties": [{"partyID": "IqE4bSkE", "userIDs": ["2F4g1xhN", "UApGw2qL", "v4ha8lvw"]}, {"partyID": "9P9kLrj3", "userIDs": ["nlmbqx6Y", "fvGIFGKk", "br9ms0Z6"]}, {"partyID": "s8UWTxhZ", "userIDs": ["dUyKkdPb", "DkhMrlkv", "lcCZjeP7"]}], "teamID": "kmDYOuVq", "userIDs": ["dq781TED", "kGCM1Les", "fYkCMZj9"]}], "ticketIDs": ["ShtENIrH", "zQsZ78Lf", "jyIPytTy"], "tieTeamsSessionLifetime": true, "type": "P2P", "version": 13}' \
    > test.out 2>&1
eval_tap $? 55 'UpdateGameSession' test.out

#- 56 DeleteGameSession
./ng net.accelbyte.sdk.cli.Main session deleteGameSession \
    --namespace "$AB_NAMESPACE" \
    --sessionId '4sDZrywv' \
    > test.out 2>&1
eval_tap $? 56 'DeleteGameSession' test.out

#- 57 PatchUpdateGameSession
./ng net.accelbyte.sdk.cli.Main session patchUpdateGameSession \
    --namespace "$AB_NAMESPACE" \
    --sessionId '5yK8R899' \
    --body '{"attributes": {"SnuFb6hP": {}, "xWblsnSS": {}, "ZstpJ24P": {}}, "backfillTicketID": "BiSr5v42", "clientVersion": "Pms7AQc9", "deployment": "nua506cu", "fallbackClaimKeys": ["9UnVHaze", "k7PHpxCF", "Arrtyune"], "inactiveTimeout": 51, "inviteTimeout": 58, "joinability": "OPEN", "matchPool": "RUhWpdej", "maxPlayers": 26, "minPlayers": 99, "password": "qN1Og7Y7", "preferredClaimKeys": ["uZWD6ALq", "VVHw96JP", "HJCs4Ih8"], "requestedRegions": ["PXO9ZQNL", "L7MGkB2B", "KOjdEzae"], "teams": [{"parties": [{"partyID": "5rxzrYZ5", "userIDs": ["m5e4fvZe", "jv9t6mZN", "IUmzGxbX"]}, {"partyID": "rn59eEbP", "userIDs": ["v4xWcs5z", "EPHrJqlD", "kXIUfcp7"]}, {"partyID": "cDe2KV0f", "userIDs": ["BKjK1c6L", "8cSk5qCC", "fG5W5tlu"]}], "teamID": "FkZOJ88T", "userIDs": ["3Noap4xv", "IIkekqUz", "Wm4ClGX2"]}, {"parties": [{"partyID": "HyL96G6v", "userIDs": ["ShOgciAY", "j739czPt", "iz8SuOaW"]}, {"partyID": "e1UQhLUf", "userIDs": ["o3PjGJRj", "yK5WtB3E", "uFLEK07e"]}, {"partyID": "dgBvRC9U", "userIDs": ["jCpKZasb", "R2g0rJP7", "7naq3GgM"]}], "teamID": "Z6KvtpfH", "userIDs": ["Lw9ZTWVX", "UW5hcruM", "MKQ2kEI7"]}, {"parties": [{"partyID": "Lz4vuVgx", "userIDs": ["8AQqItJz", "rEOfuHw8", "sNI3ETHF"]}, {"partyID": "pgg2qZjK", "userIDs": ["yIoWNsLC", "kZb9GRfX", "lRenTNb9"]}, {"partyID": "MTOmXVXx", "userIDs": ["hdyDOSr8", "s4WRZk6v", "8cxfHpj7"]}], "teamID": "90DAiqfK", "userIDs": ["eTJ6NG0T", "Xu9VJvkC", "8b6g20Xj"]}], "ticketIDs": ["MdyPkFlV", "YY76D43Q", "g5jijIJ6"], "tieTeamsSessionLifetime": false, "type": "NONE", "version": 96}' \
    > test.out 2>&1
eval_tap $? 57 'PatchUpdateGameSession' test.out

#- 58 UpdateGameSessionBackfillTicketID
./ng net.accelbyte.sdk.cli.Main session updateGameSessionBackfillTicketID \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'MOOKmc2C' \
    --body '{"backfillTicketID": "E7DpHS4k"}' \
    > test.out 2>&1
eval_tap $? 58 'UpdateGameSessionBackfillTicketID' test.out

#- 59 GameSessionGenerateCode
./ng net.accelbyte.sdk.cli.Main session gameSessionGenerateCode \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'fIWANDGB' \
    > test.out 2>&1
eval_tap $? 59 'GameSessionGenerateCode' test.out

#- 60 PublicRevokeGameSessionCode
./ng net.accelbyte.sdk.cli.Main session publicRevokeGameSessionCode \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'rIlSKcmG' \
    > test.out 2>&1
eval_tap $? 60 'PublicRevokeGameSessionCode' test.out

#- 61 PublicGameSessionInvite
./ng net.accelbyte.sdk.cli.Main session publicGameSessionInvite \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'H8cUDFlf' \
    --body '{"metadata": {"msMvS4EI": "sa57hGfZ", "rkFV5ang": "ishDJv67", "Dt5Zg6QX": "1UV2vcyU"}, "platformID": "qushKSvT", "userID": "gNkBjrKA"}' \
    > test.out 2>&1
eval_tap $? 61 'PublicGameSessionInvite' test.out

#- 62 JoinGameSession
./ng net.accelbyte.sdk.cli.Main session joinGameSession \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'YCOsOrLX' \
    --body '{"password": "RwBFtueG"}' \
    > test.out 2>&1
eval_tap $? 62 'JoinGameSession' test.out

#- 63 PublicPromoteGameSessionLeader
./ng net.accelbyte.sdk.cli.Main session publicPromoteGameSessionLeader \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'EQEVWFKd' \
    --body '{"leaderID": "LUxI6epw"}' \
    > test.out 2>&1
eval_tap $? 63 'PublicPromoteGameSessionLeader' test.out

#- 64 LeaveGameSession
./ng net.accelbyte.sdk.cli.Main session leaveGameSession \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'fMUxzDFC' \
    > test.out 2>&1
eval_tap $? 64 'LeaveGameSession' test.out

#- 65 PublicKickGameSessionMember
./ng net.accelbyte.sdk.cli.Main session publicKickGameSessionMember \
    --memberId 'zBaSRpZV' \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'iPfQRUuD' \
    > test.out 2>&1
eval_tap $? 65 'PublicKickGameSessionMember' test.out

#- 66 PublicGetGameSessionPassword
./ng net.accelbyte.sdk.cli.Main session publicGetGameSessionPassword \
    --namespace "$AB_NAMESPACE" \
    --sessionId '5ZGT0RDy' \
    > test.out 2>&1
eval_tap $? 66 'PublicGetGameSessionPassword' test.out

#- 67 PublicUpdateGameSessionPassword
./ng net.accelbyte.sdk.cli.Main session publicUpdateGameSessionPassword \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'KA1Aj3j7' \
    --body '{"newPassword": "j6CYZAj2"}' \
    > test.out 2>&1
eval_tap $? 67 'PublicUpdateGameSessionPassword' test.out

#- 68 PublicGameSessionReject
./ng net.accelbyte.sdk.cli.Main session publicGameSessionReject \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'lhtNxzZT' \
    > test.out 2>&1
eval_tap $? 68 'PublicGameSessionReject' test.out

#- 69 GetSessionServerSecret
./ng net.accelbyte.sdk.cli.Main session getSessionServerSecret \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'WxOWMoO3' \
    > test.out 2>&1
eval_tap $? 69 'GetSessionServerSecret' test.out

#- 70 AppendTeamGameSession
eval_tap 0 70 'AppendTeamGameSession # SKIP deprecated' test.out

#- 71 PublicGameSessionCancel
./ng net.accelbyte.sdk.cli.Main session publicGameSessionCancel \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'vJ8TwoFQ' \
    --userId 's1kBNLWH' \
    > test.out 2>&1
eval_tap $? 71 'PublicGameSessionCancel' test.out

#- 72 PublicPartyJoinCode
./ng net.accelbyte.sdk.cli.Main session publicPartyJoinCode \
    --namespace "$AB_NAMESPACE" \
    --body '{"code": "Fl3j14wx"}' \
    > test.out 2>&1
eval_tap $? 72 'PublicPartyJoinCode' test.out

#- 73 PublicGetParty
./ng net.accelbyte.sdk.cli.Main session publicGetParty \
    --namespace "$AB_NAMESPACE" \
    --partyId 'BuaHPJCM' \
    > test.out 2>&1
eval_tap $? 73 'PublicGetParty' test.out

#- 74 PublicUpdateParty
./ng net.accelbyte.sdk.cli.Main session publicUpdateParty \
    --namespace "$AB_NAMESPACE" \
    --partyId 'oeIJK1Fm' \
    --body '{"attributes": {"vQZbOrFs": {}, "3Y1CWkuM": {}, "hWxNF0dm": {}}, "inactiveTimeout": 18, "inviteTimeout": 84, "joinability": "OPEN", "maxPlayers": 62, "minPlayers": 98, "password": "yyB8xGI6", "type": "DS", "version": 37}' \
    > test.out 2>&1
eval_tap $? 74 'PublicUpdateParty' test.out

#- 75 PublicPatchUpdateParty
./ng net.accelbyte.sdk.cli.Main session publicPatchUpdateParty \
    --namespace "$AB_NAMESPACE" \
    --partyId 'PuDOcKUx' \
    --body '{"attributes": {"zS9xfGJr": {}, "ie8B12ii": {}, "I8R6rjZ8": {}}, "inactiveTimeout": 5, "inviteTimeout": 74, "joinability": "FRIENDS_OF_MEMBERS", "maxPlayers": 64, "minPlayers": 96, "password": "KdeVWKIF", "type": "DS", "version": 53}' \
    > test.out 2>&1
eval_tap $? 75 'PublicPatchUpdateParty' test.out

#- 76 PublicGeneratePartyCode
./ng net.accelbyte.sdk.cli.Main session publicGeneratePartyCode \
    --namespace "$AB_NAMESPACE" \
    --partyId '4ANWjWd8' \
    > test.out 2>&1
eval_tap $? 76 'PublicGeneratePartyCode' test.out

#- 77 PublicRevokePartyCode
./ng net.accelbyte.sdk.cli.Main session publicRevokePartyCode \
    --namespace "$AB_NAMESPACE" \
    --partyId 'COCm6KyS' \
    > test.out 2>&1
eval_tap $? 77 'PublicRevokePartyCode' test.out

#- 78 PublicPartyInvite
./ng net.accelbyte.sdk.cli.Main session publicPartyInvite \
    --namespace "$AB_NAMESPACE" \
    --partyId 'sfrANj1i' \
    --body '{"metadata": {"iYEJTAPL": "x3SLkDuw", "kL2VSwkJ": "xmrvcO5K", "G6fIX5Ef": "UZzDqZAx"}, "platformID": "GfGZ4SaJ", "userID": "jS2tL7dB"}' \
    > test.out 2>&1
eval_tap $? 78 'PublicPartyInvite' test.out

#- 79 PublicPromotePartyLeader
./ng net.accelbyte.sdk.cli.Main session publicPromotePartyLeader \
    --namespace "$AB_NAMESPACE" \
    --partyId 'LRwKAmRI' \
    --body '{"leaderID": "DszDS1fv"}' \
    > test.out 2>&1
eval_tap $? 79 'PublicPromotePartyLeader' test.out

#- 80 PublicGetPartyPassword
./ng net.accelbyte.sdk.cli.Main session publicGetPartyPassword \
    --namespace "$AB_NAMESPACE" \
    --partyId '1u9W61jb' \
    > test.out 2>&1
eval_tap $? 80 'PublicGetPartyPassword' test.out

#- 81 PublicUpdatePartyPassword
./ng net.accelbyte.sdk.cli.Main session publicUpdatePartyPassword \
    --namespace "$AB_NAMESPACE" \
    --partyId 'Pzg6KYoz' \
    --body '{"newPassword": "f1aEfiR2"}' \
    > test.out 2>&1
eval_tap $? 81 'PublicUpdatePartyPassword' test.out

#- 82 PublicReadPartySessionStorage
./ng net.accelbyte.sdk.cli.Main session publicReadPartySessionStorage \
    --namespace "$AB_NAMESPACE" \
    --partyId 'o0a8AWQt' \
    > test.out 2>&1
eval_tap $? 82 'PublicReadPartySessionStorage' test.out

#- 83 PublicUpdateInsertPartySessionStorage
./ng net.accelbyte.sdk.cli.Main session publicUpdateInsertPartySessionStorage \
    --namespace "$AB_NAMESPACE" \
    --partyId 'g2y2s2TK' \
    --userId '30hqxQbh' \
    --body '{"BVWLM4JO": {}, "aQ2n9YER": {}, "Hoq6A0qh": {}}' \
    > test.out 2>&1
eval_tap $? 83 'PublicUpdateInsertPartySessionStorage' test.out

#- 84 PublicUpdateInsertPartySessionStorageReserved
./ng net.accelbyte.sdk.cli.Main session publicUpdateInsertPartySessionStorageReserved \
    --namespace "$AB_NAMESPACE" \
    --partyId 'vKvx8ztG' \
    --userId 'cScEdxNz' \
    --body '{"DyU8bTYd": {}, "hmsnXSij": {}, "zoFigJ6q": {}}' \
    > test.out 2>&1
eval_tap $? 84 'PublicUpdateInsertPartySessionStorageReserved' test.out

#- 85 PublicPartyJoin
./ng net.accelbyte.sdk.cli.Main session publicPartyJoin \
    --namespace "$AB_NAMESPACE" \
    --partyId '2u9P0m30' \
    --body '{"password": "EpJtAaZb"}' \
    > test.out 2>&1
eval_tap $? 85 'PublicPartyJoin' test.out

#- 86 PublicPartyLeave
./ng net.accelbyte.sdk.cli.Main session publicPartyLeave \
    --namespace "$AB_NAMESPACE" \
    --partyId 'iP2NhSVl' \
    > test.out 2>&1
eval_tap $? 86 'PublicPartyLeave' test.out

#- 87 PublicPartyReject
./ng net.accelbyte.sdk.cli.Main session publicPartyReject \
    --namespace "$AB_NAMESPACE" \
    --partyId 'd3ACaKh2' \
    > test.out 2>&1
eval_tap $? 87 'PublicPartyReject' test.out

#- 88 PublicPartyCancel
./ng net.accelbyte.sdk.cli.Main session publicPartyCancel \
    --namespace "$AB_NAMESPACE" \
    --partyId 'lMk1ozvn' \
    --userId 'u4rWfh9b' \
    > test.out 2>&1
eval_tap $? 88 'PublicPartyCancel' test.out

#- 89 PublicPartyKick
./ng net.accelbyte.sdk.cli.Main session publicPartyKick \
    --namespace "$AB_NAMESPACE" \
    --partyId 'KmtwpGx8' \
    --userId 'z8ZqHv7m' \
    > test.out 2>&1
eval_tap $? 89 'PublicPartyKick' test.out

#- 90 PublicCreateParty
./ng net.accelbyte.sdk.cli.Main session publicCreateParty \
    --namespace "$AB_NAMESPACE" \
    --body '{"attributes": {"FB0FgDYR": {}, "yn9RzUOr": {}, "yCSwYtWX": {}}, "configurationName": "H2ztLrmi", "inactiveTimeout": 59, "inviteTimeout": 71, "joinability": "FRIENDS_OF_MEMBERS", "maxPlayers": 41, "members": [{"ID": "q0qAMdUf", "PlatformID": "4EiXsWBq", "PlatformUserID": "1C8TtJrs"}, {"ID": "h4zDMCep", "PlatformID": "6tUZawCd", "PlatformUserID": "lXtRjULD"}, {"ID": "WTrUcWFs", "PlatformID": "MIzun42r", "PlatformUserID": "yxWv0et1"}], "minPlayers": 39, "password": "BUMuN6Pl", "textChat": true, "type": "P2P"}' \
    > test.out 2>&1
eval_tap $? 90 'PublicCreateParty' test.out

#- 91 PublicGetRecentPlayer
./ng net.accelbyte.sdk.cli.Main session publicGetRecentPlayer \
    --namespace "$AB_NAMESPACE" \
    --limit '32' \
    > test.out 2>&1
eval_tap $? 91 'PublicGetRecentPlayer' test.out

#- 92 PublicGetRecentTeamPlayer
./ng net.accelbyte.sdk.cli.Main session publicGetRecentTeamPlayer \
    --namespace "$AB_NAMESPACE" \
    --limit '84' \
    > test.out 2>&1
eval_tap $? 92 'PublicGetRecentTeamPlayer' test.out

#- 93 PublicUpdateInsertSessionStorageLeader
./ng net.accelbyte.sdk.cli.Main session publicUpdateInsertSessionStorageLeader \
    --namespace "$AB_NAMESPACE" \
    --sessionId '5eCEUvF0' \
    --body '{"divMqblc": {}, "f3uyq4S8": {}, "dDR7AZlQ": {}}' \
    > test.out 2>&1
eval_tap $? 93 'PublicUpdateInsertSessionStorageLeader' test.out

#- 94 PublicUpdateInsertSessionStorage
./ng net.accelbyte.sdk.cli.Main session publicUpdateInsertSessionStorage \
    --namespace "$AB_NAMESPACE" \
    --sessionId '7xxTN0xk' \
    --userId 'kubB0DQi' \
    --body '{"as05t4Gr": {}, "9qtpXb8H": {}, "0E0F3bE2": {}}' \
    > test.out 2>&1
eval_tap $? 94 'PublicUpdateInsertSessionStorage' test.out

#- 95 PublicGetBulkPlayerCurrentPlatform
./ng net.accelbyte.sdk.cli.Main session publicGetBulkPlayerCurrentPlatform \
    --namespace "$AB_NAMESPACE" \
    --body '{"userIDs": ["HrgcLBPR", "v0ny0iE3", "7qbF9kqw"]}' \
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
    --body '{"crossplayEnabled": true, "currentPlatform": "jbtgecBj", "data": {"KzOgVXUy": {}, "2o1BwTdH": {}, "69YMzJJy": {}}, "platforms": [{"name": "10R0W4cY", "userID": "erqdWtzH"}, {"name": "lTqHI0Ka", "userID": "YpQDqguH"}, {"name": "n9tfXrT3", "userID": "8JLtKNSU"}], "roles": ["EszGSKXI", "C1iWHGV2", "bkbvyP6P"], "simultaneousPlatform": "jlF2HhTw"}' \
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
    --order 'PHu7wNRN' \
    --orderBy 'azpjJbyG' \
    --status 'usLUrGC4' \
    > test.out 2>&1
eval_tap $? 99 'PublicQueryMyGameSessions' test.out

#- 100 PublicQueryMyParties
./ng net.accelbyte.sdk.cli.Main session publicQueryMyParties \
    --namespace "$AB_NAMESPACE" \
    --order 'KmqcOiz6' \
    --orderBy 'YRUsuyZC' \
    --status '1SQqQtPL' \
    > test.out 2>&1
eval_tap $? 100 'PublicQueryMyParties' test.out

#- 101 PublicReplaceSessionStorageLeaderV2
./ng net.accelbyte.sdk.cli.Main session publicReplaceSessionStorageLeaderV2 \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'SSxqBMx5' \
    --body '{"PHceML1s": {}, "6TDNnhvc": {}, "XBpi7FcP": {}}' \
    > test.out 2>&1
eval_tap $? 101 'PublicReplaceSessionStorageLeaderV2' test.out

#- 102 PublicUpdateInsertSessionStorageLeaderV2
./ng net.accelbyte.sdk.cli.Main session publicUpdateInsertSessionStorageLeaderV2 \
    --namespace "$AB_NAMESPACE" \
    --sessionId '9h6x9J13' \
    --body '{"NaN67PgM": {}, "6h6S44UY": {}, "gf5etX9S": {}}' \
    > test.out 2>&1
eval_tap $? 102 'PublicUpdateInsertSessionStorageLeaderV2' test.out

#- 103 PublicReplaceSessionStorageUserV2
./ng net.accelbyte.sdk.cli.Main session publicReplaceSessionStorageUserV2 \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'Wx01oWp7' \
    --userId 'NgESdYQa' \
    --body '{"RupsSqGG": {}, "hrEsrpuJ": {}, "fIeSNQ38": {}}' \
    > test.out 2>&1
eval_tap $? 103 'PublicReplaceSessionStorageUserV2' test.out

#- 104 PublicUpdateInsertSessionStorageUserV2
./ng net.accelbyte.sdk.cli.Main session publicUpdateInsertSessionStorageUserV2 \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'yAwwhzAV' \
    --userId 'hmIGV6Qe' \
    --body '{"AuXvsGLZ": {}, "931Ydo2K": {}, "wBM526Cm": {}}' \
    > test.out 2>&1
eval_tap $? 104 'PublicUpdateInsertSessionStorageUserV2' test.out


rm -f "tmp.dat"

exit $EXIT_CODE