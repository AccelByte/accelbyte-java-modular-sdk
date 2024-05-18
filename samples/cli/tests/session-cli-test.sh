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
    --body '{"regionRetryMapping": {"PIty0gYn": ["LaWm6znr", "pIHI84O7", "ZU67HFaO"], "ufa4iVcJ": ["0JtEQfal", "mkJiao5y", "es33KBps"], "dpEPVOlF": ["u4azFQxA", "OWRP7T2v", "vm1Rwj3z"]}, "regionURLMapping": ["RyhCS65x", "uKqYuGMT", "159HMdnb"], "testGameMode": "vGuhuN0Q", "testRegionURLMapping": ["csz9Fpu6", "fjAm9RTS", "dj9VzKQ0"], "testTargetUserIDs": ["BfeKQ1dO", "R4ym4WqG", "RCdZZqSq"]}' \
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
    --body '{"durationDays": 19}' \
    > test.out 2>&1
eval_tap $? 10 'AdminUpdateConfigurationAlertV1' test.out

#- 11 AdminCreateConfigurationAlertV1
./ng net.accelbyte.sdk.cli.Main session adminCreateConfigurationAlertV1 \
    --namespace "$AB_NAMESPACE" \
    --body '{"durationDays": 17}' \
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
    --description 'qVbc7kXc' \
    --certname 'Clh9Fajp' \
    --file 'tmp.dat' \
    --password '1cAEIsdo' \
    > test.out 2>&1
eval_tap $? 13 'HandleUploadXboxPFXCertificate' test.out

#- 14 AdminCreateConfigurationTemplateV1
./ng net.accelbyte.sdk.cli.Main session adminCreateConfigurationTemplateV1 \
    --namespace "$AB_NAMESPACE" \
    --body '{"NativeSessionSetting": {"PSNServiceLabel": 87, "PSNSupportedPlatforms": ["Xqmx6NMt", "YYUKqVfm", "i5vLJLON"], "SessionTitle": "4UzBiZHE", "ShouldSync": false, "XboxAllowCrossPlatform": false, "XboxSandboxID": "Cghvvf0m", "XboxServiceConfigID": "vDd8xFYM", "XboxSessionTemplateName": "ISMjS6mL", "XboxTitleID": "nXSH5WPg", "localizedSessionName": {"IurLAWFI": {}, "WjaRbgeO": {}, "M60H2sJZ": {}}}, "PSNBaseUrl": "uGNl80H1", "attributes": {"vWr209Nt": {}, "UANBUFNn": {}, "gQj7oJr4": {}}, "autoJoin": true, "autoLeaveSession": false, "clientVersion": "29j7kxOP", "deployment": "OjMMmF61", "disableCodeGeneration": true, "dsManualSetReady": true, "dsSource": "HytjXV05", "enableSecret": false, "fallbackClaimKeys": ["H9Hjv7OJ", "L9GAgRRV", "LalHv4DH"], "immutableStorage": false, "inactiveTimeout": 98, "inviteTimeout": 25, "joinability": "9IzuG9bI", "leaderElectionGracePeriod": 26, "manualRejoin": false, "maxActiveSessions": 43, "maxPlayers": 34, "minPlayers": 79, "name": "ukzUz7iJ", "persistent": false, "preferredClaimKeys": ["vnxZojjD", "EQdkw9ML", "SoXUHiMH"], "requestedRegions": ["K8HWuLsm", "dhwnOEVU", "bxK6JN1Z"], "textChat": false, "tieTeamsSessionLifetime": false, "type": "BEFysJ4C"}' \
    > test.out 2>&1
eval_tap $? 14 'AdminCreateConfigurationTemplateV1' test.out

#- 15 AdminGetAllConfigurationTemplatesV1
./ng net.accelbyte.sdk.cli.Main session adminGetAllConfigurationTemplatesV1 \
    --namespace "$AB_NAMESPACE" \
    --limit '17' \
    --name 'TDhdJHHR' \
    --offset '45' \
    --order 'dfe4mbf2' \
    --orderBy 'kr37nEpO' \
    > test.out 2>&1
eval_tap $? 15 'AdminGetAllConfigurationTemplatesV1' test.out

#- 16 AdminGetConfigurationTemplateV1
./ng net.accelbyte.sdk.cli.Main session adminGetConfigurationTemplateV1 \
    --name 'alsh0IhN' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 16 'AdminGetConfigurationTemplateV1' test.out

#- 17 AdminUpdateConfigurationTemplateV1
./ng net.accelbyte.sdk.cli.Main session adminUpdateConfigurationTemplateV1 \
    --name 'DHJu81dg' \
    --namespace "$AB_NAMESPACE" \
    --body '{"NativeSessionSetting": {"PSNServiceLabel": 37, "PSNSupportedPlatforms": ["bTTO8RDe", "x47hSDeW", "D5Rv5ZI7"], "SessionTitle": "tjggc5l0", "ShouldSync": true, "XboxAllowCrossPlatform": true, "XboxSandboxID": "5si8YDHn", "XboxServiceConfigID": "hyRIISeN", "XboxSessionTemplateName": "JRT8FwhS", "XboxTitleID": "hAuZCryg", "localizedSessionName": {"Fer5n9JV": {}, "d1vHchkZ": {}, "ZehE4RkD": {}}}, "PSNBaseUrl": "gZy2omjz", "attributes": {"pQ7DB7cJ": {}, "0u3TlnSj": {}, "yojMMOQp": {}}, "autoJoin": true, "autoLeaveSession": false, "clientVersion": "c8Iv6ly9", "deployment": "lPNyomiB", "disableCodeGeneration": false, "dsManualSetReady": false, "dsSource": "d9NYQYVT", "enableSecret": false, "fallbackClaimKeys": ["A4hc7THZ", "kFTwZkQd", "Fe6dYujq"], "immutableStorage": false, "inactiveTimeout": 71, "inviteTimeout": 36, "joinability": "auMBKsyg", "leaderElectionGracePeriod": 83, "manualRejoin": false, "maxActiveSessions": 19, "maxPlayers": 8, "minPlayers": 0, "name": "tiBfjkyz", "persistent": false, "preferredClaimKeys": ["WIHsjifL", "PVPlKuxW", "PsqugYl7"], "requestedRegions": ["yWJnWIoX", "bACcdvnO", "QhIHattW"], "textChat": false, "tieTeamsSessionLifetime": true, "type": "xTsbiYD6"}' \
    > test.out 2>&1
eval_tap $? 17 'AdminUpdateConfigurationTemplateV1' test.out

#- 18 AdminDeleteConfigurationTemplateV1
./ng net.accelbyte.sdk.cli.Main session adminDeleteConfigurationTemplateV1 \
    --name 'DdaweUYZ' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 18 'AdminDeleteConfigurationTemplateV1' test.out

#- 19 AdminGetMemberActiveSession
./ng net.accelbyte.sdk.cli.Main session adminGetMemberActiveSession \
    --name 'eZeZn59J' \
    --namespace "$AB_NAMESPACE" \
    --userId 'Q0i5J9EY' \
    > test.out 2>&1
eval_tap $? 19 'AdminGetMemberActiveSession' test.out

#- 20 AdminReconcileMaxActiveSession
./ng net.accelbyte.sdk.cli.Main session adminReconcileMaxActiveSession \
    --name 'TeefeUNy' \
    --namespace "$AB_NAMESPACE" \
    --body '{"userID": "xn31JPV2"}' \
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
    --configurationName 'vlRbZ3Ai' \
    --dsPodName 'fIA1PbID' \
    --fromTime 'xIbQiWf8' \
    --gameMode 'mXXqCJPs' \
    --isPersistent 'YJUOsLUg' \
    --isSoftDeleted 'j6UT7Mzi' \
    --joinability 'q6afRwQJ' \
    --limit '71' \
    --matchPool 'u3dBuSSE' \
    --memberID '05XRO04Q' \
    --offset '58' \
    --order 'ISeHVxBv' \
    --orderBy 'YIM3Uq9h' \
    --sessionID 'iZX8vCXc' \
    --status 'ekYHXNFG' \
    --statusV2 'ZVxPXfU8' \
    --toTime 'VMDnQFzZ' \
    > test.out 2>&1
eval_tap $? 23 'AdminQueryGameSessions' test.out

#- 24 AdminQueryGameSessionsByAttributes
./ng net.accelbyte.sdk.cli.Main session adminQueryGameSessionsByAttributes \
    --namespace "$AB_NAMESPACE" \
    --body '{"ZAA7iIlm": {}, "d3R3It9g": {}, "xIllpZgS": {}}' \
    > test.out 2>&1
eval_tap $? 24 'AdminQueryGameSessionsByAttributes' test.out

#- 25 AdminDeleteBulkGameSessions
./ng net.accelbyte.sdk.cli.Main session adminDeleteBulkGameSessions \
    --namespace "$AB_NAMESPACE" \
    --body '{"ids": ["TMylYQuH", "U0Cs5vWx", "nRsmdu1R"]}' \
    > test.out 2>&1
eval_tap $? 25 'AdminDeleteBulkGameSessions' test.out

#- 26 AdminSetDSReady
./ng net.accelbyte.sdk.cli.Main session adminSetDSReady \
    --namespace "$AB_NAMESPACE" \
    --sessionId '1ZKYL1Y2' \
    --body '{"ready": false}' \
    > test.out 2>&1
eval_tap $? 26 'AdminSetDSReady' test.out

#- 27 AdminUpdateGameSessionMember
./ng net.accelbyte.sdk.cli.Main session adminUpdateGameSessionMember \
    --memberId 'TJ1mvJ5S' \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'fkbgVLAO' \
    --statusType 's5842igK' \
    > test.out 2>&1
eval_tap $? 27 'AdminUpdateGameSessionMember' test.out

#- 28 AdminGetListNativeSession
./ng net.accelbyte.sdk.cli.Main session adminGetListNativeSession \
    --namespace "$AB_NAMESPACE" \
    --limit '65' \
    --offset '57' \
    --order '0soIhEgg' \
    > test.out 2>&1
eval_tap $? 28 'AdminGetListNativeSession' test.out

#- 29 AdminQueryParties
./ng net.accelbyte.sdk.cli.Main session adminQueryParties \
    --namespace "$AB_NAMESPACE" \
    --isSoftDeleted '7RfgEpbX' \
    --joinability 'O0gmWUk6' \
    --key 'ubBQPjJ3' \
    --leaderID 'vrnOa2nl' \
    --limit '99' \
    --memberID 'Ce5RhzPv' \
    --memberStatus 'y8pRYvv3' \
    --offset '25' \
    --order 'OyROHc5F' \
    --orderBy 'qIWpdmqc' \
    --partyID 'nWGJl6ar' \
    --value 'PxhoQMbp' \
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
    --body '{"psn": {"clientId": "StfcEF3k", "clientSecret": "J5Nujgbg", "scope": "2svrbkQU"}}' \
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
    --limit '40' \
    --userId 'yhi5JGqk' \
    > test.out 2>&1
eval_tap $? 33 'AdminGetRecentPlayer' test.out

#- 34 AdminGetRecentTeamPlayer
./ng net.accelbyte.sdk.cli.Main session adminGetRecentTeamPlayer \
    --namespace "$AB_NAMESPACE" \
    --limit '93' \
    --userId 'lw9oPDMo' \
    > test.out 2>&1
eval_tap $? 34 'AdminGetRecentTeamPlayer' test.out

#- 35 AdminReadSessionStorage
./ng net.accelbyte.sdk.cli.Main session adminReadSessionStorage \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'cmdia3mF' \
    > test.out 2>&1
eval_tap $? 35 'AdminReadSessionStorage' test.out

#- 36 AdminDeleteUserSessionStorage
./ng net.accelbyte.sdk.cli.Main session adminDeleteUserSessionStorage \
    --namespace "$AB_NAMESPACE" \
    --sessionId '3rEfJPh0' \
    > test.out 2>&1
eval_tap $? 36 'AdminDeleteUserSessionStorage' test.out

#- 37 AdminReadUserSessionStorage
./ng net.accelbyte.sdk.cli.Main session adminReadUserSessionStorage \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'VLeDz891' \
    --userId 'gy1tr2ri' \
    > test.out 2>&1
eval_tap $? 37 'AdminReadUserSessionStorage' test.out

#- 38 AdminQueryPlayerAttributes
./ng net.accelbyte.sdk.cli.Main session adminQueryPlayerAttributes \
    --namespace "$AB_NAMESPACE" \
    --users 'VO5XYaKC' \
    > test.out 2>&1
eval_tap $? 38 'AdminQueryPlayerAttributes' test.out

#- 39 AdminGetPlayerAttributes
./ng net.accelbyte.sdk.cli.Main session adminGetPlayerAttributes \
    --namespace "$AB_NAMESPACE" \
    --userId 'ISUIxZe0' \
    > test.out 2>&1
eval_tap $? 39 'AdminGetPlayerAttributes' test.out

#- 40 CreateGameSession
./ng net.accelbyte.sdk.cli.Main session createGameSession \
    --namespace "$AB_NAMESPACE" \
    --body '{"attributes": {"0K3Af3tw": {}, "Uvy1i0gy": {}, "hhRDb7pS": {}}, "autoJoin": false, "backfillTicketID": "liwyhUiS", "clientVersion": "EPrGP70Y", "configurationName": "Hrk7toSJ", "deployment": "ReCxiyJZ", "dsSource": "xfrKXzDr", "fallbackClaimKeys": ["nkgnfyrn", "j83l6yJU", "T6V0wFYB"], "inactiveTimeout": 99, "inviteTimeout": 90, "joinability": "gJ9AvYpp", "matchPool": "vqxBhOOy", "maxPlayers": 96, "minPlayers": 25, "preferredClaimKeys": ["ghk6ZFxh", "AeKUETOh", "3QmX5ywb"], "requestedRegions": ["rYOeH8bT", "SuCGECE8", "zX0q584l"], "serverName": "MA6ZZ5Df", "teams": [{"UserIDs": ["2Csh2djc", "E37KCTxO", "Pg8PeDr5"], "parties": [{"partyID": "0yj6xf6X", "userIDs": ["Bj3fMxtX", "kbY4JURl", "ZeR32fqY"]}, {"partyID": "N2HODF2l", "userIDs": ["vkQHSF2a", "UIPMpGmv", "wXJVGk0C"]}, {"partyID": "hmNVL52A", "userIDs": ["7X8FUyZq", "ePlrYfth", "1ZtniNn7"]}]}, {"UserIDs": ["BSjLB5sN", "wwS7NUi8", "tWSsDKJc"], "parties": [{"partyID": "iykGGraC", "userIDs": ["uLJR9PyG", "mflnoGTY", "G88S2pl5"]}, {"partyID": "4Vd1cwCN", "userIDs": ["XTQ1lQtq", "mo4XVWGA", "LbPzf3Pc"]}, {"partyID": "gJooWuON", "userIDs": ["tljUQQYR", "Trh8iWoL", "59NHllWR"]}]}, {"UserIDs": ["bruWufQB", "4cZocvly", "NfPyZ1PK"], "parties": [{"partyID": "nde7qC1Y", "userIDs": ["u6dhP3Pe", "7vtxJitT", "zLZTBU21"]}, {"partyID": "id3tMW5a", "userIDs": ["G3wUSqe6", "rtR86m3N", "7Wmozbr8"]}, {"partyID": "x08iAuXW", "userIDs": ["sQsac4aR", "9BVTmFJp", "IurYpLZD"]}]}], "textChat": true, "ticketIDs": ["hndbCbro", "fEvZsosc", "loH0Do7W"], "tieTeamsSessionLifetime": true, "type": "3YEgpR51"}' \
    > test.out 2>&1
eval_tap $? 40 'CreateGameSession' test.out

#- 41 PublicQueryGameSessionsByAttributes
./ng net.accelbyte.sdk.cli.Main session publicQueryGameSessionsByAttributes \
    --namespace "$AB_NAMESPACE" \
    --body '{"KeFBnNXN": {}, "azCjgEv8": {}, "1qlrPmCY": {}}' \
    > test.out 2>&1
eval_tap $? 41 'PublicQueryGameSessionsByAttributes' test.out

#- 42 PublicSessionJoinCode
./ng net.accelbyte.sdk.cli.Main session publicSessionJoinCode \
    --namespace "$AB_NAMESPACE" \
    --body '{"code": "RqQxXYrG"}' \
    > test.out 2>&1
eval_tap $? 42 'PublicSessionJoinCode' test.out

#- 43 GetGameSessionByPodName
./ng net.accelbyte.sdk.cli.Main session getGameSessionByPodName \
    --namespace "$AB_NAMESPACE" \
    --podName 'hiT8CNao' \
    > test.out 2>&1
eval_tap $? 43 'GetGameSessionByPodName' test.out

#- 44 GetGameSession
./ng net.accelbyte.sdk.cli.Main session getGameSession \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'qLRH9bLC' \
    > test.out 2>&1
eval_tap $? 44 'GetGameSession' test.out

#- 45 UpdateGameSession
./ng net.accelbyte.sdk.cli.Main session updateGameSession \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'H569yoYV' \
    --body '{"attributes": {"jfoPIShr": {}, "fy4jZJn4": {}, "3a5wgYP9": {}}, "backfillTicketID": "5NkrVLVD", "clientVersion": "KsmtRNE9", "deployment": "tB2EqCdZ", "fallbackClaimKeys": ["Ml46ZJnk", "rJbyLjsk", "2xS3eZp1"], "inactiveTimeout": 69, "inviteTimeout": 72, "joinability": "oVWpAaq9", "matchPool": "zdDT5vFw", "maxPlayers": 29, "minPlayers": 22, "preferredClaimKeys": ["pFLJeXFH", "gUoBDdHC", "BARQYxgY"], "requestedRegions": ["2PYneqoC", "p5LUHZ27", "9OnXqlyF"], "teams": [{"UserIDs": ["6Qtr8wUA", "H64XlOIL", "OLTGORn1"], "parties": [{"partyID": "6UlPCp6g", "userIDs": ["MvlxTUm5", "b3yFFUdZ", "hz17uZ2v"]}, {"partyID": "ZI3i7B7Y", "userIDs": ["aE3OtHwp", "7WIU710Q", "6WIm25gp"]}, {"partyID": "udhzwffo", "userIDs": ["L0VoedIr", "zp9U0vA2", "sPzuhnLm"]}]}, {"UserIDs": ["h80IiPrt", "Ll4noLOD", "GMSITHbh"], "parties": [{"partyID": "Nyse26r0", "userIDs": ["hZ19pcDt", "gvrR0ODu", "rZg3LrMO"]}, {"partyID": "KmGwFvFN", "userIDs": ["vw8XCp2X", "FZJOduqA", "taZMl5l0"]}, {"partyID": "LZL3cTci", "userIDs": ["KVZ9Faxh", "rJ1uS0kd", "Ib27x5el"]}]}, {"UserIDs": ["wx36CWq7", "wlxIOBve", "nhyeF7Po"], "parties": [{"partyID": "y8WGNV6U", "userIDs": ["dF9UN81H", "ELPyFeJh", "Ha8Mfvkz"]}, {"partyID": "zeaMSZuG", "userIDs": ["yYSyHc3o", "IwD2hVXr", "ubfAjSbW"]}, {"partyID": "mcURDc4c", "userIDs": ["YDHjHuCS", "M6AEsTo5", "DSBmrZlN"]}]}], "ticketIDs": ["5Q6T6N4E", "LANytppv", "aXV56jFU"], "tieTeamsSessionLifetime": false, "type": "WBw8dzlT", "version": 50}' \
    > test.out 2>&1
eval_tap $? 45 'UpdateGameSession' test.out

#- 46 DeleteGameSession
./ng net.accelbyte.sdk.cli.Main session deleteGameSession \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'BMCRGfxA' \
    > test.out 2>&1
eval_tap $? 46 'DeleteGameSession' test.out

#- 47 PatchUpdateGameSession
./ng net.accelbyte.sdk.cli.Main session patchUpdateGameSession \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'kx4PMGli' \
    --body '{"attributes": {"7C8O0r3s": {}, "simLbtFP": {}, "9uLhpHbI": {}}, "backfillTicketID": "XWW8ycAW", "clientVersion": "Qqu7w0CQ", "deployment": "Qs5F3wYx", "fallbackClaimKeys": ["cMp4W5jb", "8euTJp67", "evSsZ9eW"], "inactiveTimeout": 16, "inviteTimeout": 72, "joinability": "kr6AWuE2", "matchPool": "ksddeGFc", "maxPlayers": 66, "minPlayers": 33, "preferredClaimKeys": ["lzYnKeDE", "0wUtGdZY", "pPg8vNWL"], "requestedRegions": ["q8zbVDLK", "LuxZqzBv", "6Zmgmoz9"], "teams": [{"UserIDs": ["wdSnFEcE", "iCn4rGt0", "KBfWvYEe"], "parties": [{"partyID": "cmJ5dhHq", "userIDs": ["xiuK4LOT", "WflBdY05", "V4DHGFT4"]}, {"partyID": "yzM7YYpr", "userIDs": ["UUcvUrFr", "i3t9DScj", "VtuM7IZy"]}, {"partyID": "40wbn2Ml", "userIDs": ["AeSFMqb4", "AAITZJZX", "dE4wv6vh"]}]}, {"UserIDs": ["VV7HTXFM", "PFRmilvE", "e2b4vZJq"], "parties": [{"partyID": "O6sNIzMg", "userIDs": ["QsLu5yif", "TnPKPt99", "hhSGwJb6"]}, {"partyID": "Gs295FGQ", "userIDs": ["xbK4YpZ6", "i6XmgTp4", "ehmfbNfM"]}, {"partyID": "aUNOFIff", "userIDs": ["tthM8sMy", "TSt4gWKu", "PieiLcjm"]}]}, {"UserIDs": ["m2yG5ztr", "tLAAEQtx", "ukCMn1C8"], "parties": [{"partyID": "y3bCI8NK", "userIDs": ["XEZ1F5PW", "bpGpsvaW", "hbPFGD42"]}, {"partyID": "Upmtw8W3", "userIDs": ["TKxr3bao", "x7fBiQp8", "dfl0354H"]}, {"partyID": "YwfVsmRA", "userIDs": ["RCxJjVnI", "pdbThn14", "JNE5mk7l"]}]}], "ticketIDs": ["DaDWMLD4", "WwIpJcyF", "h5iyD0Ue"], "tieTeamsSessionLifetime": false, "type": "Sz7MjTJA", "version": 43}' \
    > test.out 2>&1
eval_tap $? 47 'PatchUpdateGameSession' test.out

#- 48 UpdateGameSessionBackfillTicketID
./ng net.accelbyte.sdk.cli.Main session updateGameSessionBackfillTicketID \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'jE77rfcr' \
    --body '{"backfillTicketID": "jemaEVJZ"}' \
    > test.out 2>&1
eval_tap $? 48 'UpdateGameSessionBackfillTicketID' test.out

#- 49 GameSessionGenerateCode
./ng net.accelbyte.sdk.cli.Main session gameSessionGenerateCode \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'vq8VbFEp' \
    > test.out 2>&1
eval_tap $? 49 'GameSessionGenerateCode' test.out

#- 50 PublicRevokeGameSessionCode
./ng net.accelbyte.sdk.cli.Main session publicRevokeGameSessionCode \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'xprdO8rv' \
    > test.out 2>&1
eval_tap $? 50 'PublicRevokeGameSessionCode' test.out

#- 51 PublicGameSessionInvite
./ng net.accelbyte.sdk.cli.Main session publicGameSessionInvite \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'U5rWSNGk' \
    --body '{"platformID": "MQGj1PRB", "userID": "iIN219tw"}' \
    > test.out 2>&1
eval_tap $? 51 'PublicGameSessionInvite' test.out

#- 52 JoinGameSession
./ng net.accelbyte.sdk.cli.Main session joinGameSession \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'nOsHq00p' \
    > test.out 2>&1
eval_tap $? 52 'JoinGameSession' test.out

#- 53 PublicPromoteGameSessionLeader
./ng net.accelbyte.sdk.cli.Main session publicPromoteGameSessionLeader \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'WyspcwNk' \
    --body '{"leaderID": "eSdwTYul"}' \
    > test.out 2>&1
eval_tap $? 53 'PublicPromoteGameSessionLeader' test.out

#- 54 LeaveGameSession
./ng net.accelbyte.sdk.cli.Main session leaveGameSession \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'mCFLDcpn' \
    > test.out 2>&1
eval_tap $? 54 'LeaveGameSession' test.out

#- 55 PublicGameSessionReject
./ng net.accelbyte.sdk.cli.Main session publicGameSessionReject \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'qHVHmByn' \
    > test.out 2>&1
eval_tap $? 55 'PublicGameSessionReject' test.out

#- 56 GetSessionServerSecret
./ng net.accelbyte.sdk.cli.Main session getSessionServerSecret \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'kSMDPX5j' \
    > test.out 2>&1
eval_tap $? 56 'GetSessionServerSecret' test.out

#- 57 AppendTeamGameSession
./ng net.accelbyte.sdk.cli.Main session appendTeamGameSession \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'RLmaUYJu' \
    --body '{"additionalMembers": [{"partyID": "PfKHRtFL", "userIDs": ["kQMCABN3", "Rd7MGDNF", "m08JH345"]}, {"partyID": "ccsDvktW", "userIDs": ["50ZbDmHQ", "xfa2kjoB", "Yl2gnMdT"]}, {"partyID": "UJnBKrxL", "userIDs": ["52HjiLOa", "T8hept9x", "DKEkfZYF"]}], "proposedTeams": [{"UserIDs": ["9poMObPS", "61wVw1YE", "bWEZE3np"], "parties": [{"partyID": "mZRgm1wI", "userIDs": ["qeNx40ag", "YDn5O0lL", "vhHR4jTY"]}, {"partyID": "I7aZbBjy", "userIDs": ["fN7g5sty", "k7FeqeCz", "AJIWDhIe"]}, {"partyID": "xJFCv79t", "userIDs": ["hsdCDhEC", "ZgDsuKbH", "f5FLQ3Qs"]}]}, {"UserIDs": ["oLZx8OBK", "xIlI9ADa", "xcwogj7I"], "parties": [{"partyID": "Ps12QsIy", "userIDs": ["89dqSfvh", "JCOY68jH", "a4zZVvVY"]}, {"partyID": "kPF1gooH", "userIDs": ["5E41JCSg", "LmjQB86i", "vnnc7IvE"]}, {"partyID": "BKEdRNrH", "userIDs": ["MLOSn7br", "1n79u63d", "ZKXSOZjy"]}]}, {"UserIDs": ["uNsaalKa", "vkKykDGy", "FCNemysK"], "parties": [{"partyID": "8cq2QDp4", "userIDs": ["Rnk3MGuY", "kjfVGfUs", "9eOM05Tp"]}, {"partyID": "St4lA2hJ", "userIDs": ["3i13PTU2", "tu6MBlV6", "khuGI9yB"]}, {"partyID": "njYqMFbr", "userIDs": ["l0FFmnDM", "iBtyc2Lo", "0sXKFNkk"]}]}], "version": 58}' \
    > test.out 2>&1
eval_tap $? 57 'AppendTeamGameSession' test.out

#- 58 PublicPartyJoinCode
./ng net.accelbyte.sdk.cli.Main session publicPartyJoinCode \
    --namespace "$AB_NAMESPACE" \
    --body '{"code": "VIZ1xXaa"}' \
    > test.out 2>&1
eval_tap $? 58 'PublicPartyJoinCode' test.out

#- 59 PublicGetParty
./ng net.accelbyte.sdk.cli.Main session publicGetParty \
    --namespace "$AB_NAMESPACE" \
    --partyId '2OMKfCBG' \
    > test.out 2>&1
eval_tap $? 59 'PublicGetParty' test.out

#- 60 PublicUpdateParty
./ng net.accelbyte.sdk.cli.Main session publicUpdateParty \
    --namespace "$AB_NAMESPACE" \
    --partyId 'dGu4XE8X' \
    --body '{"attributes": {"2xdnYJVz": {}, "guTidf42": {}, "kwnIoFhw": {}}, "inactiveTimeout": 59, "inviteTimeout": 60, "joinability": "fiK9c7kU", "maxPlayers": 84, "minPlayers": 23, "type": "Z1egNtXG", "version": 73}' \
    > test.out 2>&1
eval_tap $? 60 'PublicUpdateParty' test.out

#- 61 PublicPatchUpdateParty
./ng net.accelbyte.sdk.cli.Main session publicPatchUpdateParty \
    --namespace "$AB_NAMESPACE" \
    --partyId 'LBQNrRjy' \
    --body '{"attributes": {"DnPI9yIk": {}, "NRIrzi49": {}, "XgOWtkqq": {}}, "inactiveTimeout": 64, "inviteTimeout": 32, "joinability": "qUmb0thp", "maxPlayers": 5, "minPlayers": 47, "type": "kzVGhA8W", "version": 43}' \
    > test.out 2>&1
eval_tap $? 61 'PublicPatchUpdateParty' test.out

#- 62 PublicGeneratePartyCode
./ng net.accelbyte.sdk.cli.Main session publicGeneratePartyCode \
    --namespace "$AB_NAMESPACE" \
    --partyId 'OqZCj3Hd' \
    > test.out 2>&1
eval_tap $? 62 'PublicGeneratePartyCode' test.out

#- 63 PublicRevokePartyCode
./ng net.accelbyte.sdk.cli.Main session publicRevokePartyCode \
    --namespace "$AB_NAMESPACE" \
    --partyId 'qdFXW7DQ' \
    > test.out 2>&1
eval_tap $? 63 'PublicRevokePartyCode' test.out

#- 64 PublicPartyInvite
./ng net.accelbyte.sdk.cli.Main session publicPartyInvite \
    --namespace "$AB_NAMESPACE" \
    --partyId 'ECmIvBgF' \
    --body '{"platformID": "kDkyzf6J", "userID": "ewqTTFOL"}' \
    > test.out 2>&1
eval_tap $? 64 'PublicPartyInvite' test.out

#- 65 PublicPromotePartyLeader
./ng net.accelbyte.sdk.cli.Main session publicPromotePartyLeader \
    --namespace "$AB_NAMESPACE" \
    --partyId '73llIvpd' \
    --body '{"leaderID": "qZ7YHd2Z"}' \
    > test.out 2>&1
eval_tap $? 65 'PublicPromotePartyLeader' test.out

#- 66 PublicPartyJoin
./ng net.accelbyte.sdk.cli.Main session publicPartyJoin \
    --namespace "$AB_NAMESPACE" \
    --partyId 'uzOC4MEr' \
    > test.out 2>&1
eval_tap $? 66 'PublicPartyJoin' test.out

#- 67 PublicPartyLeave
./ng net.accelbyte.sdk.cli.Main session publicPartyLeave \
    --namespace "$AB_NAMESPACE" \
    --partyId '0OMv73AF' \
    > test.out 2>&1
eval_tap $? 67 'PublicPartyLeave' test.out

#- 68 PublicPartyReject
./ng net.accelbyte.sdk.cli.Main session publicPartyReject \
    --namespace "$AB_NAMESPACE" \
    --partyId 'qe2uxrCg' \
    > test.out 2>&1
eval_tap $? 68 'PublicPartyReject' test.out

#- 69 PublicPartyKick
./ng net.accelbyte.sdk.cli.Main session publicPartyKick \
    --namespace "$AB_NAMESPACE" \
    --partyId 'lqQXlqM6' \
    --userId 'sIoN8mjH' \
    > test.out 2>&1
eval_tap $? 69 'PublicPartyKick' test.out

#- 70 PublicCreateParty
./ng net.accelbyte.sdk.cli.Main session publicCreateParty \
    --namespace "$AB_NAMESPACE" \
    --body '{"attributes": {"4bLgJ1hk": {}, "9k5V8iJa": {}, "IW2wNsqg": {}}, "configurationName": "aIya1YeY", "inactiveTimeout": 4, "inviteTimeout": 17, "joinability": "hRhZyNzr", "maxPlayers": 51, "members": [{"ID": "qQoPIeU3", "PlatformID": "xnsDhQsl", "PlatformUserID": "xzIIWsve"}, {"ID": "XGBDkw5X", "PlatformID": "3OE0J0Mh", "PlatformUserID": "E0iwoHs0"}, {"ID": "MNfrCofY", "PlatformID": "ptht0Lx0", "PlatformUserID": "YkbueHSp"}], "minPlayers": 52, "textChat": false, "type": "BszZv8r8"}' \
    > test.out 2>&1
eval_tap $? 70 'PublicCreateParty' test.out

#- 71 PublicGetRecentPlayer
./ng net.accelbyte.sdk.cli.Main session publicGetRecentPlayer \
    --namespace "$AB_NAMESPACE" \
    --limit '27' \
    > test.out 2>&1
eval_tap $? 71 'PublicGetRecentPlayer' test.out

#- 72 PublicGetRecentTeamPlayer
./ng net.accelbyte.sdk.cli.Main session publicGetRecentTeamPlayer \
    --namespace "$AB_NAMESPACE" \
    --limit '64' \
    > test.out 2>&1
eval_tap $? 72 'PublicGetRecentTeamPlayer' test.out

#- 73 PublicUpdateInsertSessionStorageLeader
./ng net.accelbyte.sdk.cli.Main session publicUpdateInsertSessionStorageLeader \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'WjNpFRJS' \
    --body '{"E1f4x6Kp": {}, "CcHcbC7v": {}, "mh8YLq6T": {}}' \
    > test.out 2>&1
eval_tap $? 73 'PublicUpdateInsertSessionStorageLeader' test.out

#- 74 PublicUpdateInsertSessionStorage
./ng net.accelbyte.sdk.cli.Main session publicUpdateInsertSessionStorage \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'WhubEGXu' \
    --userId 'ECTEVqGA' \
    --body '{"y9D6cfBt": {}, "dQ1EvtKl": {}, "x4tbJ8Ue": {}}' \
    > test.out 2>&1
eval_tap $? 74 'PublicUpdateInsertSessionStorage' test.out

#- 75 PublicGetBulkPlayerCurrentPlatform
./ng net.accelbyte.sdk.cli.Main session publicGetBulkPlayerCurrentPlatform \
    --namespace "$AB_NAMESPACE" \
    --body '{"userIDs": ["hr6pb66Q", "greZeUNf", "ZCRkqT9q"]}' \
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
    --body '{"crossplayEnabled": true, "currentPlatform": "PhXafXOU", "data": {"yeY7koPW": {}, "RfqOj3XQ": {}, "LtXTwfBa": {}}, "platforms": [{"name": "OG0VJ70G", "userID": "kM7OdsPl"}, {"name": "DW1OZaCA", "userID": "v9tJ9Kqc"}, {"name": "bA5NnosX", "userID": "uC0zNorG"}], "roles": ["hRUcwD8F", "WQ50QfjY", "HNEajOQi"], "simultaneousPlatform": "Y3CXH7X0"}' \
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
    --order 'yowvgF64' \
    --orderBy 'WYdYznbZ' \
    --status 'BUojkFK4' \
    > test.out 2>&1
eval_tap $? 79 'PublicQueryMyGameSessions' test.out

#- 80 PublicQueryMyParties
./ng net.accelbyte.sdk.cli.Main session publicQueryMyParties \
    --namespace "$AB_NAMESPACE" \
    --order 'Y3gWhRWk' \
    --orderBy 'flgqdiXE' \
    --status 'tSzny2Ap' \
    > test.out 2>&1
eval_tap $? 80 'PublicQueryMyParties' test.out


rm -f "tmp.dat"

exit $EXIT_CODE