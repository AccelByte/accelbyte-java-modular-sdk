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
echo "1..96"

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
    --body '{"metricExcludedNamespaces": ["F88Gl2B6", "PXQQGnDH", "AFIB6qDi"], "regionRetryMapping": {"Ynk6Ooc6": ["ZGKPcpDA", "J117RyVF", "4aRcNNfz"], "yzihWyDg": ["u6yN5DdJ", "bcGXDKvK", "jFWUFByy"], "v7UUCMHF": ["Lu4fBw8M", "F0rzRs5F", "LmMRl6YE"]}, "regionURLMapping": ["dbMd9v3U", "idvrQ579", "UzlvTJuU"], "testGameMode": "JnTvUrx5", "testRegionURLMapping": ["M3cTjGMX", "KxEJ1UQl", "GIm6m3sV"], "testTargetUserIDs": ["j1eatSFg", "imZgYOGu", "MFvLwVkW"]}' \
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
    --body '{"durationDays": 93}' \
    > test.out 2>&1
eval_tap $? 12 'AdminUpdateConfigurationAlertV1' test.out

#- 13 AdminCreateConfigurationAlertV1
./ng net.accelbyte.sdk.cli.Main session adminCreateConfigurationAlertV1 \
    --namespace "$AB_NAMESPACE" \
    --body '{"durationDays": 11}' \
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
    --body '{"NativeSessionSetting": {"PSNDisableSystemUIMenu": ["KICK", "UPDATE_INVITABLE_USER_TYPE", "UPDATE_INVITABLE_USER_TYPE"], "PSNServiceLabel": 56, "PSNSupportedPlatforms": ["QxE5faHi", "4JwlgfVe", "Ff0kWDXn"], "SessionTitle": "ySGRTkd5", "ShouldSync": false, "XboxAllowCrossPlatform": true, "XboxSandboxID": "a2ltHomq", "XboxServiceConfigID": "tcFKs1wJ", "XboxSessionTemplateName": "5LzGCaOZ", "XboxTitleID": "iq4PTshV", "localizedSessionName": {"cF4El6KX": {}, "XeVrvjgC": {}, "JrrjInwL": {}}}, "PSNBaseUrl": "b1MMWESD", "amsClaimTimeoutMinutes": 31, "appName": "6BR3Tm9y", "asyncProcessDSRequest": {"async": false, "timeout": 98}, "attributes": {"uoezsVhf": {}, "AkPBOSDD": {}, "T2Eo8xBH": {}}, "autoJoin": true, "autoLeaveSession": true, "clientVersion": "yXf0R4Jk", "customURLGRPC": "sENllCAl", "deployment": "LX0R6h86", "disableCodeGeneration": false, "disableResendInvite": false, "dsManualSetReady": true, "dsSource": "Ghol0nE2", "enableSecret": false, "fallbackClaimKeys": ["z3A0dq1j", "hAELGmcX", "53pxZ5zZ"], "grpcSessionConfig": {"appName": "Lvkdq6GC", "customURL": "qYT16J1F", "functionFlag": 19}, "immutableStorage": true, "inactiveTimeout": 33, "inviteTimeout": 35, "joinability": "FRIENDS_OF_FRIENDS", "leaderElectionGracePeriod": 58, "manualRejoin": true, "maxActiveSessions": 18, "maxPlayers": 34, "minPlayers": 72, "name": "dzkgxjNA", "partyCodeGeneratorString": "MSgq68SK", "partyCodeLength": 4, "persistent": false, "preferredClaimKeys": ["HlkJ4c3V", "FyV8czCD", "pO6nZpKA"], "requestedRegions": ["wuTlWxDJ", "4bLEJ127", "rmgnc5Xs"], "textChat": true, "textChatMode": "GAME", "tieTeamsSessionLifetime": true, "ttlHours": 45, "type": "P2P"}' \
    > test.out 2>&1
eval_tap $? 16 'AdminCreateConfigurationTemplateV1' test.out

#- 17 AdminGetAllConfigurationTemplatesV1
./ng net.accelbyte.sdk.cli.Main session adminGetAllConfigurationTemplatesV1 \
    --namespace "$AB_NAMESPACE" \
    --limit '19' \
    --name 'rgV5dNiT' \
    --offset '29' \
    --order 'dwFSaiLL' \
    --orderBy 'YT7nW9dK' \
    > test.out 2>&1
eval_tap $? 17 'AdminGetAllConfigurationTemplatesV1' test.out

#- 18 AdminGetConfigurationTemplateV1
./ng net.accelbyte.sdk.cli.Main session adminGetConfigurationTemplateV1 \
    --name 'ecCEqx59' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 18 'AdminGetConfigurationTemplateV1' test.out

#- 19 AdminUpdateConfigurationTemplateV1
./ng net.accelbyte.sdk.cli.Main session adminUpdateConfigurationTemplateV1 \
    --name 'uS4qWPBN' \
    --namespace "$AB_NAMESPACE" \
    --body '{"NativeSessionSetting": {"PSNDisableSystemUIMenu": ["PROMOTE_TO_LEADER", "KICK", "KICK"], "PSNServiceLabel": 32, "PSNSupportedPlatforms": ["ycC0HAQf", "dFPLt7jE", "MTwkfOEN"], "SessionTitle": "BaQREjxO", "ShouldSync": true, "XboxAllowCrossPlatform": false, "XboxSandboxID": "8164zw2M", "XboxServiceConfigID": "D5ECLaGT", "XboxSessionTemplateName": "sKCkhlSs", "XboxTitleID": "zBAKo0nF", "localizedSessionName": {"pESjP6Ne": {}, "QsbZEWIL": {}, "qUxk2Kl6": {}}}, "PSNBaseUrl": "1LDZpkEw", "amsClaimTimeoutMinutes": 13, "appName": "9dWumVic", "asyncProcessDSRequest": {"async": false, "timeout": 56}, "attributes": {"FTjQcL7P": {}, "4iDbAsKr": {}, "eb3vHw9S": {}}, "autoJoin": false, "autoLeaveSession": false, "clientVersion": "zgrBrZxJ", "customURLGRPC": "JmALwLEY", "deployment": "ODqK92qJ", "disableCodeGeneration": false, "disableResendInvite": true, "dsManualSetReady": false, "dsSource": "3BsYg6Am", "enableSecret": false, "fallbackClaimKeys": ["JdEr1aeW", "DC3KjUEe", "7heez24V"], "grpcSessionConfig": {"appName": "hhdpoV3B", "customURL": "LguXrqWd", "functionFlag": 42}, "immutableStorage": true, "inactiveTimeout": 96, "inviteTimeout": 33, "joinability": "OPEN", "leaderElectionGracePeriod": 96, "manualRejoin": true, "maxActiveSessions": 46, "maxPlayers": 41, "minPlayers": 31, "name": "3FiZeGBH", "partyCodeGeneratorString": "6MB962c0", "partyCodeLength": 47, "persistent": false, "preferredClaimKeys": ["flbnsyGi", "Xw8xbtt1", "bmA1RK0b"], "requestedRegions": ["TQQY1Mof", "GAWzPzZN", "Qxw6B9eW"], "textChat": false, "textChatMode": "GAME", "tieTeamsSessionLifetime": true, "ttlHours": 3, "type": "P2P"}' \
    > test.out 2>&1
eval_tap $? 19 'AdminUpdateConfigurationTemplateV1' test.out

#- 20 AdminDeleteConfigurationTemplateV1
./ng net.accelbyte.sdk.cli.Main session adminDeleteConfigurationTemplateV1 \
    --name 'GUvTgtzg' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 20 'AdminDeleteConfigurationTemplateV1' test.out

#- 21 AdminGetMemberActiveSession
./ng net.accelbyte.sdk.cli.Main session adminGetMemberActiveSession \
    --name 'cYEHqPus' \
    --namespace "$AB_NAMESPACE" \
    --userId 'ltOlCd4j' \
    > test.out 2>&1
eval_tap $? 21 'AdminGetMemberActiveSession' test.out

#- 22 AdminReconcileMaxActiveSession
./ng net.accelbyte.sdk.cli.Main session adminReconcileMaxActiveSession \
    --name 'LAjTv1jG' \
    --namespace "$AB_NAMESPACE" \
    --body '{"userID": "xWh0ZRQk"}' \
    > test.out 2>&1
eval_tap $? 22 'AdminReconcileMaxActiveSession' test.out

#- 23 AdminGetDSMCConfiguration
eval_tap 0 23 'AdminGetDSMCConfiguration # SKIP deprecated' test.out

#- 24 AdminSyncDSMCConfiguration
eval_tap 0 24 'AdminSyncDSMCConfiguration # SKIP deprecated' test.out

#- 25 AdminQueryGameSessions
./ng net.accelbyte.sdk.cli.Main session adminQueryGameSessions \
    --namespace "$AB_NAMESPACE" \
    --configurationName 'KLqq0uD7' \
    --dsPodName 'Y4rdtGtq' \
    --fromTime 'kBKRi9XM' \
    --gameMode 'hMHf8bKt' \
    --isPersistent '0Nl7WaN9' \
    --isSoftDeleted 'jLHbKrwV' \
    --joinability 'FRIENDS_OF_FRIENDS' \
    --limit '62' \
    --matchPool 'CAn0dvbx' \
    --memberID 'BVRM224d' \
    --offset '89' \
    --order '6G3cr3Mc' \
    --orderBy 'm4uXUg2w' \
    --sessionID 'ex3AMc2P' \
    --status 'DS_ERROR' \
    --statusV2 'AVAILABLE' \
    --toTime '2V1wMeHp' \
    > test.out 2>&1
eval_tap $? 25 'AdminQueryGameSessions' test.out

#- 26 AdminQueryGameSessionsByAttributes
./ng net.accelbyte.sdk.cli.Main session adminQueryGameSessionsByAttributes \
    --namespace "$AB_NAMESPACE" \
    --body '{"Iu2fDbLj": {}, "sZRfB392": {}, "2iRUZrtk": {}}' \
    > test.out 2>&1
eval_tap $? 26 'AdminQueryGameSessionsByAttributes' test.out

#- 27 AdminDeleteBulkGameSessions
./ng net.accelbyte.sdk.cli.Main session adminDeleteBulkGameSessions \
    --namespace "$AB_NAMESPACE" \
    --body '{"ids": ["x0wCZouI", "kVhsO21H", "VEiyuLEw"]}' \
    > test.out 2>&1
eval_tap $? 27 'AdminDeleteBulkGameSessions' test.out

#- 28 AdminSetDSReady
./ng net.accelbyte.sdk.cli.Main session adminSetDSReady \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'DtnvaFvy' \
    --body '{"ready": false}' \
    > test.out 2>&1
eval_tap $? 28 'AdminSetDSReady' test.out

#- 29 AdminUpdateDSInformation
./ng net.accelbyte.sdk.cli.Main session adminUpdateDSInformation \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'CxYA5G1Y' \
    --body '{"createdRegion": "Bv2d74lL", "deployment": "izMMv4cD", "description": "L1e11F0A", "ip": "rdLJLwv3", "port": 89, "region": "NtZOnEd5", "serverId": "PmVKJkIh", "source": "3NFzjuLs", "status": "kgOc4paU"}' \
    > test.out 2>&1
eval_tap $? 29 'AdminUpdateDSInformation' test.out

#- 30 AdminKickGameSessionMember
./ng net.accelbyte.sdk.cli.Main session adminKickGameSessionMember \
    --memberId 'bAVhdkFl' \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'zeDo1XIp' \
    > test.out 2>&1
eval_tap $? 30 'AdminKickGameSessionMember' test.out

#- 31 AdminUpdateGameSessionMember
./ng net.accelbyte.sdk.cli.Main session adminUpdateGameSessionMember \
    --memberId 'dwlG8QS9' \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'qkJAXDnN' \
    --statusType 'RfQ9aVeE' \
    > test.out 2>&1
eval_tap $? 31 'AdminUpdateGameSessionMember' test.out

#- 32 AdminGetListNativeSession
./ng net.accelbyte.sdk.cli.Main session adminGetListNativeSession \
    --namespace "$AB_NAMESPACE" \
    --limit '38' \
    --offset '60' \
    --order 'w9aKdjSk' \
    > test.out 2>&1
eval_tap $? 32 'AdminGetListNativeSession' test.out

#- 33 AdminQueryParties
./ng net.accelbyte.sdk.cli.Main session adminQueryParties \
    --namespace "$AB_NAMESPACE" \
    --configurationName 'ooug2bco' \
    --fromTime 'hDwvfr71' \
    --isSoftDeleted 'F7TDuhTX' \
    --joinability 'FRIENDS_OF_MEMBERS' \
    --key '8C7melS1' \
    --leaderID 'G1CIzboz' \
    --limit '2' \
    --memberID 'n1Vwep2y' \
    --memberStatus 'LEFT' \
    --offset '21' \
    --order 'd9BfyUcy' \
    --orderBy '5tIOtfyA' \
    --partyID '9wljZ17N' \
    --toTime 'CsplgFzT' \
    --value 'C5eXmqLX' \
    > test.out 2>&1
eval_tap $? 33 'AdminQueryParties' test.out

#- 34 AdminDeleteBulkParties
./ng net.accelbyte.sdk.cli.Main session adminDeleteBulkParties \
    --namespace "$AB_NAMESPACE" \
    --body '{"ids": ["x6QKIjAe", "GaWD6fWt", "OXVg1rgB"]}' \
    > test.out 2>&1
eval_tap $? 34 'AdminDeleteBulkParties' test.out

#- 35 AdminReadPartySessionStorage
./ng net.accelbyte.sdk.cli.Main session adminReadPartySessionStorage \
    --namespace "$AB_NAMESPACE" \
    --partyId 'FE4ASxA8' \
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
    --body '{"psn": {"clientId": "MiWp9JKS", "clientSecret": "zi829vfm", "scope": "Rg6oWx44"}}' \
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
    --description 'LzE0iZA5' \
    --file 'tmp.dat' \
    --password 'aI23gAmT' \
    > test.out 2>&1
eval_tap $? 41 'AdminUploadPlatformCredentials' test.out

#- 42 AdminGetRecentPlayer
./ng net.accelbyte.sdk.cli.Main session adminGetRecentPlayer \
    --namespace "$AB_NAMESPACE" \
    --limit '52' \
    --userId 'cyymBShW' \
    > test.out 2>&1
eval_tap $? 42 'AdminGetRecentPlayer' test.out

#- 43 AdminGetRecentTeamPlayer
./ng net.accelbyte.sdk.cli.Main session adminGetRecentTeamPlayer \
    --namespace "$AB_NAMESPACE" \
    --limit '62' \
    --userId 'D81LJpp9' \
    > test.out 2>&1
eval_tap $? 43 'AdminGetRecentTeamPlayer' test.out

#- 44 AdminReadSessionStorage
./ng net.accelbyte.sdk.cli.Main session adminReadSessionStorage \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'Ko9Mjway' \
    > test.out 2>&1
eval_tap $? 44 'AdminReadSessionStorage' test.out

#- 45 AdminDeleteUserSessionStorage
./ng net.accelbyte.sdk.cli.Main session adminDeleteUserSessionStorage \
    --namespace "$AB_NAMESPACE" \
    --sessionId '2MnMMbNF' \
    > test.out 2>&1
eval_tap $? 45 'AdminDeleteUserSessionStorage' test.out

#- 46 AdminReadUserSessionStorage
./ng net.accelbyte.sdk.cli.Main session adminReadUserSessionStorage \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'd9Af8Own' \
    --userId 'FYBPZiu7' \
    > test.out 2>&1
eval_tap $? 46 'AdminReadUserSessionStorage' test.out

#- 47 AdminQueryPlayerAttributes
./ng net.accelbyte.sdk.cli.Main session adminQueryPlayerAttributes \
    --namespace "$AB_NAMESPACE" \
    --users 'rUyVtvod' \
    > test.out 2>&1
eval_tap $? 47 'AdminQueryPlayerAttributes' test.out

#- 48 AdminGetPlayerAttributes
./ng net.accelbyte.sdk.cli.Main session adminGetPlayerAttributes \
    --namespace "$AB_NAMESPACE" \
    --userId 'oEosFjh0' \
    > test.out 2>&1
eval_tap $? 48 'AdminGetPlayerAttributes' test.out

#- 49 AdminSyncNativeSession
./ng net.accelbyte.sdk.cli.Main session adminSyncNativeSession \
    --namespace "$AB_NAMESPACE" \
    --userId 'Pra7lR5T' \
    > test.out 2>&1
eval_tap $? 49 'AdminSyncNativeSession' test.out

#- 50 CreateGameSession
./ng net.accelbyte.sdk.cli.Main session createGameSession \
    --namespace "$AB_NAMESPACE" \
    --resolveMaxActiveSession  \
    --body '{"appName": "s5nDcwMb", "attributes": {"suXkVQUj": {}, "2mguKIIy": {}, "9WGJzNdh": {}}, "autoJoin": true, "backfillTicketID": "kKUFg47K", "clientVersion": "MZW8sbPy", "configurationName": "3b90WKSX", "customURLGRPC": "mX91iIE9", "deployment": "il2RxGoe", "dsSource": "GsLcaGkF", "fallbackClaimKeys": ["OBx3jOFI", "HB4cvFV1", "ILWJGoKB"], "inactiveTimeout": 68, "inviteTimeout": 75, "joinability": "OPEN", "matchPool": "b2x997wp", "maxPlayers": 91, "minPlayers": 92, "preferredClaimKeys": ["ThIiR8pp", "2SzqOtCT", "VymU30Oz"], "requestedRegions": ["HhL0d7xJ", "jp8rk3VL", "cLLBS7Cl"], "serverName": "OR5z1ILz", "storage": {"leader": {"KyeONOmC": {}, "CKdpHK1T": {}, "unE54RHU": {}}}, "teams": [{"parties": [{"partyID": "Usc1XfVC", "userIDs": ["sX05QsPb", "Cih2wlxX", "AlWYoel2"]}, {"partyID": "ZLCNC02s", "userIDs": ["e2hvlhEH", "TtLb7xUg", "Jp1T9JL8"]}, {"partyID": "jBJhnxsv", "userIDs": ["AtOglu71", "TLGsPYRW", "DPyXQ0U5"]}], "teamID": "9kwCEaT7", "userIDs": ["Jozasd5X", "L9n8nIg7", "xDFc4j40"]}, {"parties": [{"partyID": "E7RPQcYG", "userIDs": ["Iyx6J8MQ", "hprwoXmn", "o1m4E8Bs"]}, {"partyID": "YqaScnsz", "userIDs": ["Wh8IGiO0", "YlEJLct9", "Vq4QTv41"]}, {"partyID": "pNft5eSS", "userIDs": ["sQZYbPyD", "Vo5HbYAM", "TExQuGv2"]}], "teamID": "tdMSy0sO", "userIDs": ["NXMUZ0vF", "Fcv2NOuH", "xs7LgJWo"]}, {"parties": [{"partyID": "KT1MbXuN", "userIDs": ["k34R1vrG", "N8d3CXqi", "bp6UYqEJ"]}, {"partyID": "NhMhAS9P", "userIDs": ["uTRfoEzv", "CruMMLxo", "6QSaHolT"]}, {"partyID": "OcQVBskp", "userIDs": ["2nWXXL5j", "x1KpwP1z", "MS07sAOM"]}], "teamID": "P17QyIyC", "userIDs": ["95lJxiMt", "m528nY54", "ckwTRKij"]}], "textChat": false, "textChatMode": "GAME", "ticketIDs": ["36lHgVfX", "9B990XTt", "AVouDI2j"], "tieTeamsSessionLifetime": true, "type": "NONE"}' \
    > test.out 2>&1
eval_tap $? 50 'CreateGameSession' test.out

#- 51 PublicQueryGameSessionsByAttributes
./ng net.accelbyte.sdk.cli.Main session publicQueryGameSessionsByAttributes \
    --namespace "$AB_NAMESPACE" \
    --body '{"OAW4TL38": {}, "oHtd7amf": {}, "vlde6ETj": {}}' \
    > test.out 2>&1
eval_tap $? 51 'PublicQueryGameSessionsByAttributes' test.out

#- 52 PublicSessionJoinCode
./ng net.accelbyte.sdk.cli.Main session publicSessionJoinCode \
    --namespace "$AB_NAMESPACE" \
    --body '{"code": "OjUnWAkY"}' \
    > test.out 2>&1
eval_tap $? 52 'PublicSessionJoinCode' test.out

#- 53 GetGameSessionByPodName
./ng net.accelbyte.sdk.cli.Main session getGameSessionByPodName \
    --namespace "$AB_NAMESPACE" \
    --podName '9MA2FKdH' \
    > test.out 2>&1
eval_tap $? 53 'GetGameSessionByPodName' test.out

#- 54 GetGameSession
./ng net.accelbyte.sdk.cli.Main session getGameSession \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'rfhBPBgm' \
    > test.out 2>&1
eval_tap $? 54 'GetGameSession' test.out

#- 55 UpdateGameSession
./ng net.accelbyte.sdk.cli.Main session updateGameSession \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'T1USfpxA' \
    --body '{"attributes": {"jjAZhija": {}, "oThmaDtb": {}, "6Wpv9S9x": {}}, "backfillTicketID": "YXJHCAJ2", "clientVersion": "39hpzSJ5", "deployment": "Urbw4Y3V", "fallbackClaimKeys": ["bAoyORTQ", "RY9W3fHf", "pM9gJtKb"], "inactiveTimeout": 62, "inviteTimeout": 64, "joinability": "CLOSED", "matchPool": "A3jbPRSZ", "maxPlayers": 69, "minPlayers": 100, "preferredClaimKeys": ["aV1gz9zf", "0hUfqrCt", "mQk73m2s"], "requestedRegions": ["PeAHl3dF", "r8SRjV1d", "FF7ActVp"], "teams": [{"parties": [{"partyID": "5y3xaTxT", "userIDs": ["gj6d6Jxu", "ivSAN1M9", "466wBLLw"]}, {"partyID": "NhWps7lV", "userIDs": ["LwkbitYh", "MsPobGZp", "3991YokM"]}, {"partyID": "xGbGj4cM", "userIDs": ["210ClfmX", "BTOLXFSy", "qgt29MMY"]}], "teamID": "orWDWwp3", "userIDs": ["G8YmF3Dr", "nBBQb5Ks", "ytSvR3lM"]}, {"parties": [{"partyID": "Vkf8h2h9", "userIDs": ["TajgTXY5", "WgsZHFbe", "57OuWb6i"]}, {"partyID": "Mukj3fxy", "userIDs": ["PdXJgP3m", "VZncivq1", "iWNi4PlZ"]}, {"partyID": "YpxbXyjh", "userIDs": ["pth8QlrM", "lmBxQQTF", "n2Q1X1DZ"]}], "teamID": "PS3vnFdK", "userIDs": ["W8U1p0xo", "raP9OdqJ", "Qf7S44wp"]}, {"parties": [{"partyID": "N7wFRjtk", "userIDs": ["v6LQfIDK", "1tpfDZWS", "YWjXt5XW"]}, {"partyID": "pxIhUYRn", "userIDs": ["KezpeRMA", "2xyAa99W", "r7XWVji4"]}, {"partyID": "YyFv1mWp", "userIDs": ["EWj5Vpdy", "ED5CFdiJ", "c0P2HZh4"]}], "teamID": "CYPMnWND", "userIDs": ["RZZNSJqf", "ralV5oOF", "RvdG7de8"]}], "ticketIDs": ["qvtctshp", "2fp5xkgS", "DyJgByIA"], "tieTeamsSessionLifetime": true, "type": "DS", "version": 40}' \
    > test.out 2>&1
eval_tap $? 55 'UpdateGameSession' test.out

#- 56 DeleteGameSession
./ng net.accelbyte.sdk.cli.Main session deleteGameSession \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'ASEpHio7' \
    > test.out 2>&1
eval_tap $? 56 'DeleteGameSession' test.out

#- 57 PatchUpdateGameSession
./ng net.accelbyte.sdk.cli.Main session patchUpdateGameSession \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'dZQnL0ES' \
    --body '{"attributes": {"rYyRjkj7": {}, "LITvkHKO": {}, "HY9phqaA": {}}, "backfillTicketID": "FLixQSjp", "clientVersion": "HUE35jrg", "deployment": "TZvD8DlS", "fallbackClaimKeys": ["SlGycEjh", "vLcAFcsz", "RM559nHy"], "inactiveTimeout": 54, "inviteTimeout": 52, "joinability": "FRIENDS_OF_LEADER", "matchPool": "a3ZBE8Xn", "maxPlayers": 64, "minPlayers": 72, "preferredClaimKeys": ["8jBnPRqJ", "HzoUCOAq", "BDtSavD8"], "requestedRegions": ["ZiHfNlDR", "4eFCYj3O", "S8tAprm5"], "teams": [{"parties": [{"partyID": "dXRhPDiz", "userIDs": ["KYUdACMA", "mCLW65dI", "U8MImeZm"]}, {"partyID": "k9D8kJ17", "userIDs": ["PXMURKqM", "gAum1Lyi", "kXL7heWM"]}, {"partyID": "6t4Twm03", "userIDs": ["7czvAMbF", "ZgFoHCEL", "LgFFPhGT"]}], "teamID": "j9u3xJe7", "userIDs": ["3fdIizUS", "fzhkiy25", "hkRWL9D6"]}, {"parties": [{"partyID": "EniyoN3c", "userIDs": ["4gur092f", "eWdM12rw", "scRKamYE"]}, {"partyID": "uyuTdiVN", "userIDs": ["v0eIeulU", "H5CPM5jw", "yRl6sKmO"]}, {"partyID": "YD4MsYYH", "userIDs": ["QasejG41", "dceWyRuC", "1mjaVLLV"]}], "teamID": "qzWr8prF", "userIDs": ["kIOcnEuY", "c6rL0GB9", "u6jghapA"]}, {"parties": [{"partyID": "xzUYZ8uw", "userIDs": ["s7SjGULW", "42vItXps", "cWEchDhL"]}, {"partyID": "CDzYQabi", "userIDs": ["UskkE3dG", "5T72PhSr", "9B7c798X"]}, {"partyID": "IThqonhG", "userIDs": ["0nb2HfA6", "pIxbCMAy", "pvtJYbwx"]}], "teamID": "CV5SEAiE", "userIDs": ["2fIqaSU8", "rI5RZ0Ge", "ZxM0EN0g"]}], "ticketIDs": ["81PB3lxa", "TOxZTwV8", "12Rxo0yB"], "tieTeamsSessionLifetime": false, "type": "NONE", "version": 30}' \
    > test.out 2>&1
eval_tap $? 57 'PatchUpdateGameSession' test.out

#- 58 UpdateGameSessionBackfillTicketID
./ng net.accelbyte.sdk.cli.Main session updateGameSessionBackfillTicketID \
    --namespace "$AB_NAMESPACE" \
    --sessionId '9Z4WGIja' \
    --body '{"backfillTicketID": "KxfjPz74"}' \
    > test.out 2>&1
eval_tap $? 58 'UpdateGameSessionBackfillTicketID' test.out

#- 59 GameSessionGenerateCode
./ng net.accelbyte.sdk.cli.Main session gameSessionGenerateCode \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'd0cS4VBO' \
    > test.out 2>&1
eval_tap $? 59 'GameSessionGenerateCode' test.out

#- 60 PublicRevokeGameSessionCode
./ng net.accelbyte.sdk.cli.Main session publicRevokeGameSessionCode \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'YiewgeIt' \
    > test.out 2>&1
eval_tap $? 60 'PublicRevokeGameSessionCode' test.out

#- 61 PublicGameSessionInvite
./ng net.accelbyte.sdk.cli.Main session publicGameSessionInvite \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'LwDyQi6r' \
    --body '{"metadata": {"GE3spmAS": "zjWGxEUg", "EMMAnWAV": "Q4Wnc2l4", "y3wMKrhN": "Gkuh12Ik"}, "platformID": "bP9oiQqs", "userID": "TWRGYQu1"}' \
    > test.out 2>&1
eval_tap $? 61 'PublicGameSessionInvite' test.out

#- 62 JoinGameSession
./ng net.accelbyte.sdk.cli.Main session joinGameSession \
    --namespace "$AB_NAMESPACE" \
    --sessionId '1JdNpWb4' \
    > test.out 2>&1
eval_tap $? 62 'JoinGameSession' test.out

#- 63 PublicPromoteGameSessionLeader
./ng net.accelbyte.sdk.cli.Main session publicPromoteGameSessionLeader \
    --namespace "$AB_NAMESPACE" \
    --sessionId '82DLl0GD' \
    --body '{"leaderID": "2SWdKWye"}' \
    > test.out 2>&1
eval_tap $? 63 'PublicPromoteGameSessionLeader' test.out

#- 64 LeaveGameSession
./ng net.accelbyte.sdk.cli.Main session leaveGameSession \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'pngB7ixy' \
    > test.out 2>&1
eval_tap $? 64 'LeaveGameSession' test.out

#- 65 PublicKickGameSessionMember
./ng net.accelbyte.sdk.cli.Main session publicKickGameSessionMember \
    --memberId '4qZ7Zetz' \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'c6J2BHrh' \
    > test.out 2>&1
eval_tap $? 65 'PublicKickGameSessionMember' test.out

#- 66 PublicGameSessionReject
./ng net.accelbyte.sdk.cli.Main session publicGameSessionReject \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'zmuRAoVT' \
    > test.out 2>&1
eval_tap $? 66 'PublicGameSessionReject' test.out

#- 67 GetSessionServerSecret
./ng net.accelbyte.sdk.cli.Main session getSessionServerSecret \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'WlOAB150' \
    > test.out 2>&1
eval_tap $? 67 'GetSessionServerSecret' test.out

#- 68 AppendTeamGameSession
eval_tap 0 68 'AppendTeamGameSession # SKIP deprecated' test.out

#- 69 PublicGameSessionCancel
./ng net.accelbyte.sdk.cli.Main session publicGameSessionCancel \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'G843NOR3' \
    --userId 'FrfKnLuu' \
    > test.out 2>&1
eval_tap $? 69 'PublicGameSessionCancel' test.out

#- 70 PublicPartyJoinCode
./ng net.accelbyte.sdk.cli.Main session publicPartyJoinCode \
    --namespace "$AB_NAMESPACE" \
    --body '{"code": "adCfQ4VI"}' \
    > test.out 2>&1
eval_tap $? 70 'PublicPartyJoinCode' test.out

#- 71 PublicGetParty
./ng net.accelbyte.sdk.cli.Main session publicGetParty \
    --namespace "$AB_NAMESPACE" \
    --partyId 'pIlgnOeV' \
    > test.out 2>&1
eval_tap $? 71 'PublicGetParty' test.out

#- 72 PublicUpdateParty
./ng net.accelbyte.sdk.cli.Main session publicUpdateParty \
    --namespace "$AB_NAMESPACE" \
    --partyId 'gF2DQ6fX' \
    --body '{"attributes": {"bdAZj4Bs": {}, "ss39gcPx": {}, "95KWCkaN": {}}, "inactiveTimeout": 98, "inviteTimeout": 26, "joinability": "FRIENDS_OF_MEMBERS", "maxPlayers": 67, "minPlayers": 73, "type": "DS", "version": 49}' \
    > test.out 2>&1
eval_tap $? 72 'PublicUpdateParty' test.out

#- 73 PublicPatchUpdateParty
./ng net.accelbyte.sdk.cli.Main session publicPatchUpdateParty \
    --namespace "$AB_NAMESPACE" \
    --partyId 'k9NxqfXU' \
    --body '{"attributes": {"LK6KjJbf": {}, "V2epSyjr": {}, "kxgtl2X9": {}}, "inactiveTimeout": 56, "inviteTimeout": 89, "joinability": "FRIENDS_OF_FRIENDS", "maxPlayers": 22, "minPlayers": 47, "type": "DS", "version": 19}' \
    > test.out 2>&1
eval_tap $? 73 'PublicPatchUpdateParty' test.out

#- 74 PublicGeneratePartyCode
./ng net.accelbyte.sdk.cli.Main session publicGeneratePartyCode \
    --namespace "$AB_NAMESPACE" \
    --partyId 'GXOFxS1c' \
    > test.out 2>&1
eval_tap $? 74 'PublicGeneratePartyCode' test.out

#- 75 PublicRevokePartyCode
./ng net.accelbyte.sdk.cli.Main session publicRevokePartyCode \
    --namespace "$AB_NAMESPACE" \
    --partyId 'QQYatd2R' \
    > test.out 2>&1
eval_tap $? 75 'PublicRevokePartyCode' test.out

#- 76 PublicPartyInvite
./ng net.accelbyte.sdk.cli.Main session publicPartyInvite \
    --namespace "$AB_NAMESPACE" \
    --partyId 'zM4f4AZo' \
    --body '{"metadata": {"87C6DHGc": "DoYKsePs", "0qnPqzUx": "c7gLUdLk", "UNjCNRcT": "KZ6SgYJC"}, "platformID": "bA8DLMUD", "userID": "kmzbEnEz"}' \
    > test.out 2>&1
eval_tap $? 76 'PublicPartyInvite' test.out

#- 77 PublicPromotePartyLeader
./ng net.accelbyte.sdk.cli.Main session publicPromotePartyLeader \
    --namespace "$AB_NAMESPACE" \
    --partyId 'lQ3i5nWs' \
    --body '{"leaderID": "2iHrkMqr"}' \
    > test.out 2>&1
eval_tap $? 77 'PublicPromotePartyLeader' test.out

#- 78 PublicReadPartySessionStorage
./ng net.accelbyte.sdk.cli.Main session publicReadPartySessionStorage \
    --namespace "$AB_NAMESPACE" \
    --partyId 'qoBhW5Kl' \
    > test.out 2>&1
eval_tap $? 78 'PublicReadPartySessionStorage' test.out

#- 79 PublicUpdateInsertPartySessionStorage
./ng net.accelbyte.sdk.cli.Main session publicUpdateInsertPartySessionStorage \
    --namespace "$AB_NAMESPACE" \
    --partyId 'SeA4KToj' \
    --userId '71TfJrDS' \
    --body '{"e5SkBXvZ": {}, "mh9MuqJl": {}, "SoQbAlPw": {}}' \
    > test.out 2>&1
eval_tap $? 79 'PublicUpdateInsertPartySessionStorage' test.out

#- 80 PublicUpdateInsertPartySessionStorageReserved
./ng net.accelbyte.sdk.cli.Main session publicUpdateInsertPartySessionStorageReserved \
    --namespace "$AB_NAMESPACE" \
    --partyId 'hK4iG8ar' \
    --userId 'eE3kLh6M' \
    --body '{"scDSs1k9": {}, "ccULtuyv": {}, "8m71fg2V": {}}' \
    > test.out 2>&1
eval_tap $? 80 'PublicUpdateInsertPartySessionStorageReserved' test.out

#- 81 PublicPartyJoin
./ng net.accelbyte.sdk.cli.Main session publicPartyJoin \
    --namespace "$AB_NAMESPACE" \
    --partyId 'S7601Jia' \
    > test.out 2>&1
eval_tap $? 81 'PublicPartyJoin' test.out

#- 82 PublicPartyLeave
./ng net.accelbyte.sdk.cli.Main session publicPartyLeave \
    --namespace "$AB_NAMESPACE" \
    --partyId 'Wg7GHsfs' \
    > test.out 2>&1
eval_tap $? 82 'PublicPartyLeave' test.out

#- 83 PublicPartyReject
./ng net.accelbyte.sdk.cli.Main session publicPartyReject \
    --namespace "$AB_NAMESPACE" \
    --partyId 'xiv7Gj01' \
    > test.out 2>&1
eval_tap $? 83 'PublicPartyReject' test.out

#- 84 PublicPartyCancel
./ng net.accelbyte.sdk.cli.Main session publicPartyCancel \
    --namespace "$AB_NAMESPACE" \
    --partyId '1SwCgWLZ' \
    --userId 'WQz5VP6Q' \
    > test.out 2>&1
eval_tap $? 84 'PublicPartyCancel' test.out

#- 85 PublicPartyKick
./ng net.accelbyte.sdk.cli.Main session publicPartyKick \
    --namespace "$AB_NAMESPACE" \
    --partyId 'jyNhy2ya' \
    --userId 'dPXvBL7R' \
    > test.out 2>&1
eval_tap $? 85 'PublicPartyKick' test.out

#- 86 PublicCreateParty
./ng net.accelbyte.sdk.cli.Main session publicCreateParty \
    --namespace "$AB_NAMESPACE" \
    --body '{"attributes": {"PIQ3aBdF": {}, "t8ofvuGm": {}, "0wcNapoU": {}}, "configurationName": "DC1S8JGI", "inactiveTimeout": 5, "inviteTimeout": 44, "joinability": "CLOSED", "maxPlayers": 92, "members": [{"ID": "pQFfQqLI", "PlatformID": "I33k884h", "PlatformUserID": "B3em9VwQ"}, {"ID": "Ke5SlJeT", "PlatformID": "FeV4951d", "PlatformUserID": "NQ25mWcg"}, {"ID": "NXT64SZd", "PlatformID": "SuVxITk7", "PlatformUserID": "lSXFC4Oi"}], "minPlayers": 91, "textChat": false, "type": "P2P"}' \
    > test.out 2>&1
eval_tap $? 86 'PublicCreateParty' test.out

#- 87 PublicGetRecentPlayer
./ng net.accelbyte.sdk.cli.Main session publicGetRecentPlayer \
    --namespace "$AB_NAMESPACE" \
    --limit '3' \
    > test.out 2>&1
eval_tap $? 87 'PublicGetRecentPlayer' test.out

#- 88 PublicGetRecentTeamPlayer
./ng net.accelbyte.sdk.cli.Main session publicGetRecentTeamPlayer \
    --namespace "$AB_NAMESPACE" \
    --limit '77' \
    > test.out 2>&1
eval_tap $? 88 'PublicGetRecentTeamPlayer' test.out

#- 89 PublicUpdateInsertSessionStorageLeader
./ng net.accelbyte.sdk.cli.Main session publicUpdateInsertSessionStorageLeader \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'lIb5w3mz' \
    --body '{"3jGiIhOK": {}, "85uuRn4h": {}, "G5c4V76n": {}}' \
    > test.out 2>&1
eval_tap $? 89 'PublicUpdateInsertSessionStorageLeader' test.out

#- 90 PublicUpdateInsertSessionStorage
./ng net.accelbyte.sdk.cli.Main session publicUpdateInsertSessionStorage \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'DG4ezM7I' \
    --userId 'jmuhWXSV' \
    --body '{"bvI9WyWd": {}, "rK3mpJBq": {}, "LUbcarYn": {}}' \
    > test.out 2>&1
eval_tap $? 90 'PublicUpdateInsertSessionStorage' test.out

#- 91 PublicGetBulkPlayerCurrentPlatform
./ng net.accelbyte.sdk.cli.Main session publicGetBulkPlayerCurrentPlatform \
    --namespace "$AB_NAMESPACE" \
    --body '{"userIDs": ["6iCSYwBX", "Wne7O3Qt", "Wvx6AV8z"]}' \
    > test.out 2>&1
eval_tap $? 91 'PublicGetBulkPlayerCurrentPlatform' test.out

#- 92 PublicGetPlayerAttributes
./ng net.accelbyte.sdk.cli.Main session publicGetPlayerAttributes \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 92 'PublicGetPlayerAttributes' test.out

#- 93 PublicStorePlayerAttributes
./ng net.accelbyte.sdk.cli.Main session publicStorePlayerAttributes \
    --namespace "$AB_NAMESPACE" \
    --body '{"crossplayEnabled": true, "currentPlatform": "jjh7VNnd", "data": {"TiJyucC4": {}, "ewtBHmMW": {}, "VWwCva4X": {}}, "platforms": [{"name": "Mi8odAFv", "userID": "qNHXGtbR"}, {"name": "6SQjlP4t", "userID": "HxnRasJe"}, {"name": "cRU5b5zS", "userID": "mA4ne1qX"}], "roles": ["5T8rUbpk", "vWqFhOvl", "PCtt4R1s"], "simultaneousPlatform": "68eszhiO"}' \
    > test.out 2>&1
eval_tap $? 93 'PublicStorePlayerAttributes' test.out

#- 94 PublicDeletePlayerAttributes
./ng net.accelbyte.sdk.cli.Main session publicDeletePlayerAttributes \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 94 'PublicDeletePlayerAttributes' test.out

#- 95 PublicQueryMyGameSessions
./ng net.accelbyte.sdk.cli.Main session publicQueryMyGameSessions \
    --namespace "$AB_NAMESPACE" \
    --order 'iETKfmYK' \
    --orderBy '3QQUH7QG' \
    --status 'jayYQzqp' \
    > test.out 2>&1
eval_tap $? 95 'PublicQueryMyGameSessions' test.out

#- 96 PublicQueryMyParties
./ng net.accelbyte.sdk.cli.Main session publicQueryMyParties \
    --namespace "$AB_NAMESPACE" \
    --order 'bprjcyQy' \
    --orderBy '0uwtBpb2' \
    --status 'MRHxZm0t' \
    > test.out 2>&1
eval_tap $? 96 'PublicQueryMyParties' test.out


rm -f "tmp.dat"

exit $EXIT_CODE