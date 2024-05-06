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
    --body '{"regionRetryMapping": {"EMtRZstG": ["EudozZzA", "Jb87FHw1", "tzd0b7qF"], "22BitRcb": ["BtWhiwVG", "1yL92AJs", "T5Wuy3HU"], "ByAL5hdG": ["8pqLkFZY", "yBKqZuap", "h3Rr8UeA"]}, "regionURLMapping": ["BD5nJbwd", "HDnSP7GC", "NMutNrhz"], "testGameMode": "FAXun9Z4", "testRegionURLMapping": ["bCE28anK", "dranfBBi", "l6BKeugF"], "testTargetUserIDs": ["d3fi5qwz", "q1V2TcjF", "OKRe8MeV"]}' \
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
    --body '{"durationDays": 17}' \
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
    --description 'x3TpBu3C' \
    --certname 'RKNMWsv7' \
    --file 'tmp.dat' \
    --password 'izRCnOxI' \
    > test.out 2>&1
eval_tap $? 13 'HandleUploadXboxPFXCertificate' test.out

#- 14 AdminCreateConfigurationTemplateV1
./ng net.accelbyte.sdk.cli.Main session adminCreateConfigurationTemplateV1 \
    --namespace "$AB_NAMESPACE" \
    --body '{"NativeSessionSetting": {"PSNServiceLabel": 21, "PSNSupportedPlatforms": ["AZxMXmZS", "UD1bKlD7", "3Q8skV6s"], "SessionTitle": "L6Q45NHN", "ShouldSync": true, "XboxAllowCrossPlatform": false, "XboxSandboxID": "KkF915iy", "XboxServiceConfigID": "BbFIkJn2", "XboxSessionTemplateName": "azAqdksS", "XboxTitleID": "LS46CSaP", "localizedSessionName": {"zujO1FmR": {}, "KN7sI6nN": {}, "eqlTDdVR": {}}}, "PSNBaseUrl": "gzVpHlcS", "attributes": {"c3ytu3Ok": {}, "3IraI55N": {}, "0UjJ2qJa": {}}, "autoJoin": true, "autoLeaveSession": true, "clientVersion": "INV7u5qh", "deployment": "9N7CswEr", "disableCodeGeneration": false, "dsManualSetReady": true, "dsSource": "GVqvWKAl", "enableSecret": true, "fallbackClaimKeys": ["sVcOde3w", "xo4u4Xnk", "y7lgxdRl"], "immutableStorage": false, "inactiveTimeout": 32, "inviteTimeout": 25, "joinability": "A7AfIZsh", "leaderElectionGracePeriod": 59, "manualRejoin": true, "maxActiveSessions": 45, "maxPlayers": 20, "minPlayers": 81, "name": "qgVKBxIq", "persistent": true, "preferredClaimKeys": ["soqsxoQC", "rUoKf97g", "nYoMJNpO"], "requestedRegions": ["qPSJCydW", "fTA5xkLC", "RdQJ57nx"], "textChat": false, "tieTeamsSessionLifetime": false, "type": "IYrdoOL3"}' \
    > test.out 2>&1
eval_tap $? 14 'AdminCreateConfigurationTemplateV1' test.out

#- 15 AdminGetAllConfigurationTemplatesV1
./ng net.accelbyte.sdk.cli.Main session adminGetAllConfigurationTemplatesV1 \
    --namespace "$AB_NAMESPACE" \
    --limit '28' \
    --name '8JFM9QFy' \
    --offset '85' \
    --order '0sE8y5Ji' \
    --orderBy 'VftlL8gM' \
    > test.out 2>&1
eval_tap $? 15 'AdminGetAllConfigurationTemplatesV1' test.out

#- 16 AdminGetConfigurationTemplateV1
./ng net.accelbyte.sdk.cli.Main session adminGetConfigurationTemplateV1 \
    --name 'DG5j8nW1' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 16 'AdminGetConfigurationTemplateV1' test.out

#- 17 AdminUpdateConfigurationTemplateV1
./ng net.accelbyte.sdk.cli.Main session adminUpdateConfigurationTemplateV1 \
    --name 'wtnYqilx' \
    --namespace "$AB_NAMESPACE" \
    --body '{"NativeSessionSetting": {"PSNServiceLabel": 100, "PSNSupportedPlatforms": ["uSxIBhMO", "3RxpKBWY", "6r0D9iry"], "SessionTitle": "qBADQxoN", "ShouldSync": true, "XboxAllowCrossPlatform": false, "XboxSandboxID": "yBiAe1wy", "XboxServiceConfigID": "ONSNF30C", "XboxSessionTemplateName": "WZ2RpKRR", "XboxTitleID": "LGoVilGM", "localizedSessionName": {"01d7t0LT": {}, "2HVP2pdJ": {}, "meCU9Ben": {}}}, "PSNBaseUrl": "ntcCaX0w", "attributes": {"fwcc95fj": {}, "uJDOdpt7": {}, "s3hvNdhu": {}}, "autoJoin": true, "autoLeaveSession": true, "clientVersion": "jZZAeoyU", "deployment": "P02JA0kJ", "disableCodeGeneration": true, "dsManualSetReady": true, "dsSource": "VCPNCoZW", "enableSecret": true, "fallbackClaimKeys": ["EKeo8rdR", "AoYSFmLI", "FR8oApJo"], "immutableStorage": true, "inactiveTimeout": 100, "inviteTimeout": 17, "joinability": "KsEHRrlB", "leaderElectionGracePeriod": 14, "manualRejoin": true, "maxActiveSessions": 1, "maxPlayers": 53, "minPlayers": 37, "name": "lhYp19DU", "persistent": true, "preferredClaimKeys": ["wdtdFkQG", "ENQZVVOz", "gF74Wx7l"], "requestedRegions": ["Mquigsgd", "7m0YkKTq", "f2chaD5S"], "textChat": true, "tieTeamsSessionLifetime": false, "type": "l9rZsswx"}' \
    > test.out 2>&1
eval_tap $? 17 'AdminUpdateConfigurationTemplateV1' test.out

#- 18 AdminDeleteConfigurationTemplateV1
./ng net.accelbyte.sdk.cli.Main session adminDeleteConfigurationTemplateV1 \
    --name 'owlCuXHj' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 18 'AdminDeleteConfigurationTemplateV1' test.out

#- 19 AdminGetMemberActiveSession
./ng net.accelbyte.sdk.cli.Main session adminGetMemberActiveSession \
    --name 'kyAJo8ug' \
    --namespace "$AB_NAMESPACE" \
    --userId 'R4NYSoPj' \
    > test.out 2>&1
eval_tap $? 19 'AdminGetMemberActiveSession' test.out

#- 20 AdminReconcileMaxActiveSession
./ng net.accelbyte.sdk.cli.Main session adminReconcileMaxActiveSession \
    --name 'GkFN4wWT' \
    --namespace "$AB_NAMESPACE" \
    --body '{"userID": "zsYKg5x6"}' \
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
    --configurationName 'XYdoENqW' \
    --dsPodName 'c78qBPcH' \
    --fromTime 'Xz0wVceu' \
    --gameMode 'Fw3E9wVW' \
    --isPersistent 'EhUpUcdS' \
    --isSoftDeleted '6iZt9EtN' \
    --joinability 'JRaGycwf' \
    --limit '20' \
    --matchPool '9nVVRAWG' \
    --memberID 'iojEwaLx' \
    --offset '63' \
    --order 'GXUypqai' \
    --orderBy '2fPjCAbR' \
    --sessionID 'i0GgE8Uy' \
    --status 'fB8X2FqL' \
    --statusV2 'ZWLodcV9' \
    --toTime 'h2h6E4vC' \
    > test.out 2>&1
eval_tap $? 23 'AdminQueryGameSessions' test.out

#- 24 AdminQueryGameSessionsByAttributes
./ng net.accelbyte.sdk.cli.Main session adminQueryGameSessionsByAttributes \
    --namespace "$AB_NAMESPACE" \
    --body '{"yI32nX4c": {}, "GPR2iKdh": {}, "GzuvOoE7": {}}' \
    > test.out 2>&1
eval_tap $? 24 'AdminQueryGameSessionsByAttributes' test.out

#- 25 AdminDeleteBulkGameSessions
./ng net.accelbyte.sdk.cli.Main session adminDeleteBulkGameSessions \
    --namespace "$AB_NAMESPACE" \
    --body '{"ids": ["ttfKKoHl", "OLCmvlUz", "UaTrb9UC"]}' \
    > test.out 2>&1
eval_tap $? 25 'AdminDeleteBulkGameSessions' test.out

#- 26 AdminSetDSReady
./ng net.accelbyte.sdk.cli.Main session adminSetDSReady \
    --namespace "$AB_NAMESPACE" \
    --sessionId '93XgU2es' \
    --body '{"ready": false}' \
    > test.out 2>&1
eval_tap $? 26 'AdminSetDSReady' test.out

#- 27 AdminUpdateGameSessionMember
./ng net.accelbyte.sdk.cli.Main session adminUpdateGameSessionMember \
    --memberId 'KaBg6aNC' \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'xuFCIXGY' \
    --statusType 'Pe9O0oQK' \
    > test.out 2>&1
eval_tap $? 27 'AdminUpdateGameSessionMember' test.out

#- 28 AdminGetListNativeSession
./ng net.accelbyte.sdk.cli.Main session adminGetListNativeSession \
    --namespace "$AB_NAMESPACE" \
    --limit '23' \
    --offset '1' \
    --order 'sUdEmKLB' \
    > test.out 2>&1
eval_tap $? 28 'AdminGetListNativeSession' test.out

#- 29 AdminQueryParties
./ng net.accelbyte.sdk.cli.Main session adminQueryParties \
    --namespace "$AB_NAMESPACE" \
    --isSoftDeleted 'CkdeHCU8' \
    --joinability 'LRwshSBO' \
    --key 'utT7nRlu' \
    --leaderID '5ueFJiBx' \
    --limit '6' \
    --memberID 'GSPz2dkd' \
    --memberStatus 'Ft3Ca7BU' \
    --offset '8' \
    --order 'fFmYhXqo' \
    --orderBy 'pxdH0Ybl' \
    --partyID 'RuXATLzr' \
    --value '1Z8R54Qn' \
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
    --body '{"psn": {"clientId": "MNBNPpPL", "clientSecret": "a1OnGRE1", "scope": "JCtI8UyE"}}' \
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
    --limit '36' \
    --userId 'phHri7n3' \
    > test.out 2>&1
eval_tap $? 33 'AdminGetRecentPlayer' test.out

#- 34 AdminGetRecentTeamPlayer
./ng net.accelbyte.sdk.cli.Main session adminGetRecentTeamPlayer \
    --namespace "$AB_NAMESPACE" \
    --limit '71' \
    --userId 'TeIL309a' \
    > test.out 2>&1
eval_tap $? 34 'AdminGetRecentTeamPlayer' test.out

#- 35 AdminReadSessionStorage
./ng net.accelbyte.sdk.cli.Main session adminReadSessionStorage \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'jrYwGcHX' \
    > test.out 2>&1
eval_tap $? 35 'AdminReadSessionStorage' test.out

#- 36 AdminDeleteUserSessionStorage
./ng net.accelbyte.sdk.cli.Main session adminDeleteUserSessionStorage \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'RN5TFrnw' \
    > test.out 2>&1
eval_tap $? 36 'AdminDeleteUserSessionStorage' test.out

#- 37 AdminReadUserSessionStorage
./ng net.accelbyte.sdk.cli.Main session adminReadUserSessionStorage \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'H6Esa3vq' \
    --userId 'gBwtDs7J' \
    > test.out 2>&1
eval_tap $? 37 'AdminReadUserSessionStorage' test.out

#- 38 AdminQueryPlayerAttributes
./ng net.accelbyte.sdk.cli.Main session adminQueryPlayerAttributes \
    --namespace "$AB_NAMESPACE" \
    --users 'yr4VMBAe' \
    > test.out 2>&1
eval_tap $? 38 'AdminQueryPlayerAttributes' test.out

#- 39 AdminGetPlayerAttributes
./ng net.accelbyte.sdk.cli.Main session adminGetPlayerAttributes \
    --namespace "$AB_NAMESPACE" \
    --userId 'HiOzvwMB' \
    > test.out 2>&1
eval_tap $? 39 'AdminGetPlayerAttributes' test.out

#- 40 CreateGameSession
./ng net.accelbyte.sdk.cli.Main session createGameSession \
    --namespace "$AB_NAMESPACE" \
    --body '{"attributes": {"2mrOZXT0": {}, "ca4J5keT": {}, "VpBY0r6M": {}}, "autoJoin": false, "backfillTicketID": "GS2yGyNY", "clientVersion": "jLNeoYXk", "configurationName": "y0UX80nb", "deployment": "qk54Bx4E", "dsSource": "N5dw2ckw", "fallbackClaimKeys": ["jFszKrGV", "191kc2ua", "VYmmoFIg"], "inactiveTimeout": 33, "inviteTimeout": 89, "joinability": "soLBpkkD", "matchPool": "htg9ilzA", "maxPlayers": 95, "minPlayers": 34, "preferredClaimKeys": ["31AHJV7D", "Q0A8L1OV", "9qGukQcC"], "requestedRegions": ["I2m6x5oB", "taT6ceLF", "DpIvajb7"], "serverName": "w3KIOimk", "teams": [{"UserIDs": ["HuS2vmFf", "eDKw1YLf", "YiHi124b"], "parties": [{"partyID": "L7cp3eJh", "userIDs": ["MiItnDX3", "YAEWlSOr", "rZMDMnfG"]}, {"partyID": "0XQU1o6Z", "userIDs": ["B4QgMxPy", "AFF0nCOI", "h4nlnjBd"]}, {"partyID": "ZrjyO9dI", "userIDs": ["J1rMLwEd", "lIMvjFxt", "OR2hy7cq"]}]}, {"UserIDs": ["AaIFK9kX", "rerJprms", "i1bVgRvD"], "parties": [{"partyID": "WCz3zpIC", "userIDs": ["oyjQXQAA", "mL3apqrJ", "QPmdFwkx"]}, {"partyID": "YZXxvFaF", "userIDs": ["FruCvvsf", "I9jLZ8ni", "vlfN2KWc"]}, {"partyID": "X844dLI4", "userIDs": ["uO5KdXYx", "HinHAaLx", "uAbsKiZh"]}]}, {"UserIDs": ["MR2p1BUQ", "GERXxDcC", "AeRfZtEV"], "parties": [{"partyID": "6lBZcler", "userIDs": ["k3pMMZzs", "w5PHmB0r", "RYkWFC2u"]}, {"partyID": "AhpPTXSE", "userIDs": ["iqXxYwRR", "lMyFqw7L", "wCTYv3lN"]}, {"partyID": "EIiMpZIh", "userIDs": ["CVYOcc5A", "OQrndEbF", "jM4k6Yvp"]}]}], "textChat": false, "ticketIDs": ["ZsDFpC56", "3bzSjuV3", "QYp6qlHF"], "tieTeamsSessionLifetime": true, "type": "vWFpb3fh"}' \
    > test.out 2>&1
eval_tap $? 40 'CreateGameSession' test.out

#- 41 PublicQueryGameSessionsByAttributes
./ng net.accelbyte.sdk.cli.Main session publicQueryGameSessionsByAttributes \
    --namespace "$AB_NAMESPACE" \
    --body '{"bwSSE6SG": {}, "WA9BNHbM": {}, "Qaaz3hsh": {}}' \
    > test.out 2>&1
eval_tap $? 41 'PublicQueryGameSessionsByAttributes' test.out

#- 42 PublicSessionJoinCode
./ng net.accelbyte.sdk.cli.Main session publicSessionJoinCode \
    --namespace "$AB_NAMESPACE" \
    --body '{"code": "w88afdYZ"}' \
    > test.out 2>&1
eval_tap $? 42 'PublicSessionJoinCode' test.out

#- 43 GetGameSessionByPodName
./ng net.accelbyte.sdk.cli.Main session getGameSessionByPodName \
    --namespace "$AB_NAMESPACE" \
    --podName 'ty4rzCvM' \
    > test.out 2>&1
eval_tap $? 43 'GetGameSessionByPodName' test.out

#- 44 GetGameSession
./ng net.accelbyte.sdk.cli.Main session getGameSession \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'DzEAlcsr' \
    > test.out 2>&1
eval_tap $? 44 'GetGameSession' test.out

#- 45 UpdateGameSession
./ng net.accelbyte.sdk.cli.Main session updateGameSession \
    --namespace "$AB_NAMESPACE" \
    --sessionId '9h2oFl8v' \
    --body '{"attributes": {"webC4mJn": {}, "rvLqlXZq": {}, "Z0GpoMF3": {}}, "backfillTicketID": "4QwidyiC", "clientVersion": "AM3JT7tK", "deployment": "99I9Ct58", "fallbackClaimKeys": ["xX4ckSNc", "1hD6IrBn", "9b8KJh9c"], "inactiveTimeout": 60, "inviteTimeout": 90, "joinability": "sgtx7svg", "matchPool": "vfmxrriT", "maxPlayers": 47, "minPlayers": 52, "preferredClaimKeys": ["lwWZ4xe0", "MFcXHK9m", "uYsYRocD"], "requestedRegions": ["KIVPADqA", "8uPTowN3", "wu6HxhiK"], "teams": [{"UserIDs": ["FKHDbJky", "hWK6zCNb", "JBMiXcRQ"], "parties": [{"partyID": "Y2eSS59C", "userIDs": ["FJfIaZWp", "HEwrMzBW", "SDwbxEop"]}, {"partyID": "NIupDIwa", "userIDs": ["qdioTv3j", "wY8jtpAa", "NWx2qjcB"]}, {"partyID": "nmHtcUT0", "userIDs": ["7TKs5CuJ", "eNPLEIkj", "WJ92rc7x"]}]}, {"UserIDs": ["p9OAzNZC", "oS3vHSHl", "zTTfni4Q"], "parties": [{"partyID": "oS03Gddd", "userIDs": ["LAufO97U", "fsN2yVty", "Eiv4AlZa"]}, {"partyID": "TktTaSfI", "userIDs": ["vUIR2mmW", "JrLybjIK", "7tbyYK6w"]}, {"partyID": "rU8xtXpB", "userIDs": ["9sqtjylO", "HQJdMGfR", "LRhL9NZF"]}]}, {"UserIDs": ["9GVX3NI8", "lgLHo7Cl", "kjcebzzy"], "parties": [{"partyID": "sEBT7mWH", "userIDs": ["XYqYmkSl", "DKyHz3hX", "w713dzb8"]}, {"partyID": "QSPjI6bD", "userIDs": ["faLMoNKk", "D11uXNg7", "h62UpJWe"]}, {"partyID": "WaccIlaF", "userIDs": ["SDoyel97", "z8SEpaDu", "CR1EAsHq"]}]}], "ticketIDs": ["JZaFRKJJ", "PbUG2lyO", "cXSsMp0i"], "tieTeamsSessionLifetime": true, "type": "hpfBViO0", "version": 92}' \
    > test.out 2>&1
eval_tap $? 45 'UpdateGameSession' test.out

#- 46 DeleteGameSession
./ng net.accelbyte.sdk.cli.Main session deleteGameSession \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'ToXlHIQa' \
    > test.out 2>&1
eval_tap $? 46 'DeleteGameSession' test.out

#- 47 PatchUpdateGameSession
./ng net.accelbyte.sdk.cli.Main session patchUpdateGameSession \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'LvdnVTFD' \
    --body '{"attributes": {"8ojEepgq": {}, "paPo09q3": {}, "yITjhVuZ": {}}, "backfillTicketID": "Efz3O1C0", "clientVersion": "JiG6Pr61", "deployment": "pF9vKiA2", "fallbackClaimKeys": ["DWXROdDg", "N7NtxRUp", "cQSiWHZl"], "inactiveTimeout": 100, "inviteTimeout": 70, "joinability": "ekMCZQn9", "matchPool": "uvLfpuWp", "maxPlayers": 43, "minPlayers": 23, "preferredClaimKeys": ["1Me2F60J", "OUTJ1rjc", "r7Sac2UF"], "requestedRegions": ["ySN6Pbo9", "HGDx8wnI", "BMpzh9Cz"], "teams": [{"UserIDs": ["ol7JcVhJ", "JkIjuHHS", "WrMeoULy"], "parties": [{"partyID": "6xn6z86F", "userIDs": ["WhGv50WB", "06EfG49r", "gAxUYQr5"]}, {"partyID": "OuM4MKnI", "userIDs": ["c07bHwmV", "EsiTRKzU", "wqkUIvwN"]}, {"partyID": "AJdpu9r8", "userIDs": ["yzockjJq", "bQbSmSIO", "z7NC0ePr"]}]}, {"UserIDs": ["mNk0drc8", "CQslKtHW", "gIznxQhI"], "parties": [{"partyID": "Evdkrniy", "userIDs": ["asN2uNMw", "CW0cyxnW", "tAs8P1wZ"]}, {"partyID": "SdbJ4axB", "userIDs": ["0XaSDbxK", "2E3d92cd", "ZltnEgQy"]}, {"partyID": "LH8trdsn", "userIDs": ["VRgpB8TN", "PQFD4OBJ", "jKhGFaJT"]}]}, {"UserIDs": ["SgNU1aO5", "A9INgUUE", "fAwZouPL"], "parties": [{"partyID": "vGuaz8lJ", "userIDs": ["QD0oSnDY", "2bJN8I0a", "p0zFOxbz"]}, {"partyID": "2NUfct0g", "userIDs": ["PBnPr9yA", "nff4a0Hg", "HbC1C5BE"]}, {"partyID": "obnGt7O1", "userIDs": ["qTAZHOnH", "Dv0Wm6ZJ", "GIC1FtBL"]}]}], "ticketIDs": ["mSDawKiL", "spfjngNp", "kM9nI3ga"], "tieTeamsSessionLifetime": false, "type": "09m0Z8xs", "version": 35}' \
    > test.out 2>&1
eval_tap $? 47 'PatchUpdateGameSession' test.out

#- 48 UpdateGameSessionBackfillTicketID
./ng net.accelbyte.sdk.cli.Main session updateGameSessionBackfillTicketID \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'R4ZYM7jm' \
    --body '{"backfillTicketID": "qFSCRLo7"}' \
    > test.out 2>&1
eval_tap $? 48 'UpdateGameSessionBackfillTicketID' test.out

#- 49 GameSessionGenerateCode
./ng net.accelbyte.sdk.cli.Main session gameSessionGenerateCode \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'XFEOvwQD' \
    > test.out 2>&1
eval_tap $? 49 'GameSessionGenerateCode' test.out

#- 50 PublicRevokeGameSessionCode
./ng net.accelbyte.sdk.cli.Main session publicRevokeGameSessionCode \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'ALOWrGq4' \
    > test.out 2>&1
eval_tap $? 50 'PublicRevokeGameSessionCode' test.out

#- 51 PublicGameSessionInvite
./ng net.accelbyte.sdk.cli.Main session publicGameSessionInvite \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'ucDrLmuC' \
    --body '{"platformID": "M4hujk4I", "userID": "L6x1Vudl"}' \
    > test.out 2>&1
eval_tap $? 51 'PublicGameSessionInvite' test.out

#- 52 JoinGameSession
./ng net.accelbyte.sdk.cli.Main session joinGameSession \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'NS83WFqb' \
    > test.out 2>&1
eval_tap $? 52 'JoinGameSession' test.out

#- 53 PublicPromoteGameSessionLeader
./ng net.accelbyte.sdk.cli.Main session publicPromoteGameSessionLeader \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'z52hWOEL' \
    --body '{"leaderID": "OJhQjZVz"}' \
    > test.out 2>&1
eval_tap $? 53 'PublicPromoteGameSessionLeader' test.out

#- 54 LeaveGameSession
./ng net.accelbyte.sdk.cli.Main session leaveGameSession \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'mSEAWc4S' \
    > test.out 2>&1
eval_tap $? 54 'LeaveGameSession' test.out

#- 55 PublicGameSessionReject
./ng net.accelbyte.sdk.cli.Main session publicGameSessionReject \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'NzIMuAAa' \
    > test.out 2>&1
eval_tap $? 55 'PublicGameSessionReject' test.out

#- 56 GetSessionServerSecret
./ng net.accelbyte.sdk.cli.Main session getSessionServerSecret \
    --namespace "$AB_NAMESPACE" \
    --sessionId '3JUrOFYX' \
    > test.out 2>&1
eval_tap $? 56 'GetSessionServerSecret' test.out

#- 57 AppendTeamGameSession
./ng net.accelbyte.sdk.cli.Main session appendTeamGameSession \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'cnzZzQ2c' \
    --body '{"additionalMembers": [{"partyID": "GqXygmzj", "userIDs": ["P6uW0KV3", "uAT7hW3N", "gliaY2lh"]}, {"partyID": "14FbZM3q", "userIDs": ["OHTMCRfk", "3qppGnRh", "l2Yr66Qe"]}, {"partyID": "5gNSfjyM", "userIDs": ["9xAMa4vp", "hqNYByt0", "Bx4tlhXt"]}], "proposedTeams": [{"UserIDs": ["IHCdS2Qr", "t1l8imn5", "sfXTXU59"], "parties": [{"partyID": "rY3yaA1n", "userIDs": ["MZeEdzG2", "Px36xBN2", "CSuYkgoY"]}, {"partyID": "OLiTSsAX", "userIDs": ["U7VKfCC4", "UymCgJzo", "jcyGavEu"]}, {"partyID": "fxrd9av7", "userIDs": ["vabFw6TV", "DjkQeLDy", "JBrpXq37"]}]}, {"UserIDs": ["pIcv89F7", "Uo6Jzr9N", "JniZV5OI"], "parties": [{"partyID": "zfTvqtNe", "userIDs": ["1pNiLHvC", "09QTBZjz", "wzp5P6aw"]}, {"partyID": "2EkFQtqH", "userIDs": ["LsTX6sI0", "9wW1WXOY", "DDQt8iMo"]}, {"partyID": "iw33ABZs", "userIDs": ["eIXH7CXe", "H3dfTW6B", "Ar55XC1Q"]}]}, {"UserIDs": ["5AAP1phY", "UbsLaBRp", "ATVYNBE1"], "parties": [{"partyID": "fHHYcrR4", "userIDs": ["xYLSkZew", "QOwM22pf", "InMXBBQO"]}, {"partyID": "KS9FPpX0", "userIDs": ["mBBzK08v", "GPXvF1Ow", "gZs4Gazg"]}, {"partyID": "gu8jAC4O", "userIDs": ["UldYs46V", "OK3soeCu", "1TP5jhOi"]}]}], "version": 38}' \
    > test.out 2>&1
eval_tap $? 57 'AppendTeamGameSession' test.out

#- 58 PublicPartyJoinCode
./ng net.accelbyte.sdk.cli.Main session publicPartyJoinCode \
    --namespace "$AB_NAMESPACE" \
    --body '{"code": "xKycYnsd"}' \
    > test.out 2>&1
eval_tap $? 58 'PublicPartyJoinCode' test.out

#- 59 PublicGetParty
./ng net.accelbyte.sdk.cli.Main session publicGetParty \
    --namespace "$AB_NAMESPACE" \
    --partyId 'SR1gDx05' \
    > test.out 2>&1
eval_tap $? 59 'PublicGetParty' test.out

#- 60 PublicUpdateParty
./ng net.accelbyte.sdk.cli.Main session publicUpdateParty \
    --namespace "$AB_NAMESPACE" \
    --partyId 'gRobDRO5' \
    --body '{"attributes": {"Dmxkc4E7": {}, "n5H6Q5ed": {}, "x3CxLQY9": {}}, "inactiveTimeout": 13, "inviteTimeout": 1, "joinability": "JjYrF69S", "maxPlayers": 97, "minPlayers": 94, "type": "WwzwDPse", "version": 10}' \
    > test.out 2>&1
eval_tap $? 60 'PublicUpdateParty' test.out

#- 61 PublicPatchUpdateParty
./ng net.accelbyte.sdk.cli.Main session publicPatchUpdateParty \
    --namespace "$AB_NAMESPACE" \
    --partyId 'xmViOPdX' \
    --body '{"attributes": {"Qq37ZWxt": {}, "hF9cjWh4": {}, "NpkgjKlM": {}}, "inactiveTimeout": 50, "inviteTimeout": 52, "joinability": "EycsWiQ0", "maxPlayers": 24, "minPlayers": 100, "type": "DDqWMXnJ", "version": 49}' \
    > test.out 2>&1
eval_tap $? 61 'PublicPatchUpdateParty' test.out

#- 62 PublicGeneratePartyCode
./ng net.accelbyte.sdk.cli.Main session publicGeneratePartyCode \
    --namespace "$AB_NAMESPACE" \
    --partyId 'J5psCpss' \
    > test.out 2>&1
eval_tap $? 62 'PublicGeneratePartyCode' test.out

#- 63 PublicRevokePartyCode
./ng net.accelbyte.sdk.cli.Main session publicRevokePartyCode \
    --namespace "$AB_NAMESPACE" \
    --partyId 'JHY20bt8' \
    > test.out 2>&1
eval_tap $? 63 'PublicRevokePartyCode' test.out

#- 64 PublicPartyInvite
./ng net.accelbyte.sdk.cli.Main session publicPartyInvite \
    --namespace "$AB_NAMESPACE" \
    --partyId 'rJ6bBNbM' \
    --body '{"platformID": "VnMtDwZ6", "userID": "64RNBfEC"}' \
    > test.out 2>&1
eval_tap $? 64 'PublicPartyInvite' test.out

#- 65 PublicPromotePartyLeader
./ng net.accelbyte.sdk.cli.Main session publicPromotePartyLeader \
    --namespace "$AB_NAMESPACE" \
    --partyId 'J1rTBPeY' \
    --body '{"leaderID": "rzY8X1x0"}' \
    > test.out 2>&1
eval_tap $? 65 'PublicPromotePartyLeader' test.out

#- 66 PublicPartyJoin
./ng net.accelbyte.sdk.cli.Main session publicPartyJoin \
    --namespace "$AB_NAMESPACE" \
    --partyId '31sAlwEk' \
    > test.out 2>&1
eval_tap $? 66 'PublicPartyJoin' test.out

#- 67 PublicPartyLeave
./ng net.accelbyte.sdk.cli.Main session publicPartyLeave \
    --namespace "$AB_NAMESPACE" \
    --partyId 'cYRIGxm8' \
    > test.out 2>&1
eval_tap $? 67 'PublicPartyLeave' test.out

#- 68 PublicPartyReject
./ng net.accelbyte.sdk.cli.Main session publicPartyReject \
    --namespace "$AB_NAMESPACE" \
    --partyId 'Qcx06EHm' \
    > test.out 2>&1
eval_tap $? 68 'PublicPartyReject' test.out

#- 69 PublicPartyKick
./ng net.accelbyte.sdk.cli.Main session publicPartyKick \
    --namespace "$AB_NAMESPACE" \
    --partyId 'pueVxSQs' \
    --userId 'yItUgXWU' \
    > test.out 2>&1
eval_tap $? 69 'PublicPartyKick' test.out

#- 70 PublicCreateParty
./ng net.accelbyte.sdk.cli.Main session publicCreateParty \
    --namespace "$AB_NAMESPACE" \
    --body '{"attributes": {"PK2pmo1s": {}, "OEvhRuw1": {}, "6XPIx8ya": {}}, "configurationName": "qQRAv71s", "inactiveTimeout": 89, "inviteTimeout": 18, "joinability": "FIZEqiho", "maxPlayers": 36, "members": [{"ID": "SKNcb2VC", "PlatformID": "Ozxsy1KU", "PlatformUserID": "nKBYoTmC"}, {"ID": "PkWlfIoW", "PlatformID": "MIJSvEwc", "PlatformUserID": "IztaJKTP"}, {"ID": "1lNwCNpg", "PlatformID": "Wx7BsrS2", "PlatformUserID": "ByzfEf0p"}], "minPlayers": 66, "textChat": true, "type": "L2OpZdrc"}' \
    > test.out 2>&1
eval_tap $? 70 'PublicCreateParty' test.out

#- 71 PublicGetRecentPlayer
./ng net.accelbyte.sdk.cli.Main session publicGetRecentPlayer \
    --namespace "$AB_NAMESPACE" \
    --limit '65' \
    > test.out 2>&1
eval_tap $? 71 'PublicGetRecentPlayer' test.out

#- 72 PublicGetRecentTeamPlayer
./ng net.accelbyte.sdk.cli.Main session publicGetRecentTeamPlayer \
    --namespace "$AB_NAMESPACE" \
    --limit '11' \
    > test.out 2>&1
eval_tap $? 72 'PublicGetRecentTeamPlayer' test.out

#- 73 PublicUpdateInsertSessionStorageLeader
./ng net.accelbyte.sdk.cli.Main session publicUpdateInsertSessionStorageLeader \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'XMt0JdIB' \
    --body '{"DtLY9NSX": {}, "Jx1TGUL7": {}, "m9ExCZRI": {}}' \
    > test.out 2>&1
eval_tap $? 73 'PublicUpdateInsertSessionStorageLeader' test.out

#- 74 PublicUpdateInsertSessionStorage
./ng net.accelbyte.sdk.cli.Main session publicUpdateInsertSessionStorage \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'fVcxx9CV' \
    --userId 'CPZH2otD' \
    --body '{"kRqynaiC": {}, "cQcWUz7B": {}, "HpYnI7g1": {}}' \
    > test.out 2>&1
eval_tap $? 74 'PublicUpdateInsertSessionStorage' test.out

#- 75 PublicGetBulkPlayerCurrentPlatform
./ng net.accelbyte.sdk.cli.Main session publicGetBulkPlayerCurrentPlatform \
    --namespace "$AB_NAMESPACE" \
    --body '{"userIDs": ["yh9zC8yd", "DHIXnpc7", "kIZqf3tl"]}' \
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
    --body '{"crossplayEnabled": true, "currentPlatform": "BVlcpZQE", "data": {"f2aSPdV4": {}, "SDYPyXYc": {}, "oxROrQnD": {}}, "platforms": [{"name": "FPXITNy7", "userID": "EZ60Dz8t"}, {"name": "Ks5lMP3D", "userID": "oKg4fe0K"}, {"name": "ogQM0yX6", "userID": "iC7pMN0s"}], "roles": ["d1WFdbRq", "PYx51ihd", "BZYpEp0M"], "simultaneousPlatform": "7kC7VJ9a"}' \
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
    --order 'DF6Rnt5B' \
    --orderBy 'l9OtOz8r' \
    --status 'UNCl9Q1K' \
    > test.out 2>&1
eval_tap $? 79 'PublicQueryMyGameSessions' test.out

#- 80 PublicQueryMyParties
./ng net.accelbyte.sdk.cli.Main session publicQueryMyParties \
    --namespace "$AB_NAMESPACE" \
    --order 'vj7Exg4e' \
    --orderBy 'K5YGVq3F' \
    --status 'JsYAXK08' \
    > test.out 2>&1
eval_tap $? 80 'PublicQueryMyParties' test.out


rm -f "tmp.dat"

exit $EXIT_CODE