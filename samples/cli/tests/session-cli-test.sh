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
echo "1..77"

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
    --body '{"regionRetryMapping": {"XgKAgSw3": ["S4bMkrx6", "OPqvD71l", "vATntYiD"], "09Dwj5dM": ["K06UNkVN", "8xFkfRiX", "hMGmmwBl"], "5hiGjs9T": ["NIVVsP2j", "s8stKmQS", "ueiAoi1P"]}, "regionURLMapping": ["8vx3uHQE", "dnouHKfb", "1mfzri12"], "testGameMode": "PJC0eBJT", "testRegionURLMapping": ["wpZD4fGw", "X9zKULeX", "pmVSSbDf"], "testTargetUserIDs": ["E3HDjBs9", "kSL1Eqnu", "MMUyfIwg"]}' \
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
    --body '{"durationDays": 57}' \
    > test.out 2>&1
eval_tap $? 10 'AdminUpdateConfigurationAlertV1' test.out

#- 11 AdminCreateConfigurationAlertV1
./ng net.accelbyte.sdk.cli.Main session adminCreateConfigurationAlertV1 \
    --namespace "$AB_NAMESPACE" \
    --body '{"durationDays": 10}' \
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
    --description 'DQnp9hEx' \
    --certname 'ec77NmES' \
    --file 'tmp.dat' \
    --password '4faxTkdv' \
    > test.out 2>&1
eval_tap $? 13 'HandleUploadXboxPFXCertificate' test.out

#- 14 AdminCreateConfigurationTemplateV1
./ng net.accelbyte.sdk.cli.Main session adminCreateConfigurationTemplateV1 \
    --namespace "$AB_NAMESPACE" \
    --body '{"NativeSessionSetting": {"PSNServiceLabel": 69, "PSNSupportedPlatforms": ["O3lfugMi", "67LAFakP", "4Qz4xG8w"], "SessionTitle": "LdQM0Mdz", "ShouldSync": true, "XboxAllowCrossPlatform": true, "XboxSandboxID": "dHZqhj6S", "XboxServiceConfigID": "jv6Ss36N", "XboxSessionTemplateName": "Tx0odw5h", "XboxTitleID": "ekGi1OzB", "localizedSessionName": {"WPXBGhiI": {}, "xCHTGIve": {}, "tC34viyY": {}}}, "PSNBaseUrl": "FwsfMotO", "attributes": {"lUPZEP58": {}, "M31ZtRvB": {}, "qhL1qpYA": {}}, "autoJoin": false, "clientVersion": "ZGFnm993", "deployment": "OhVgndnr", "disableCodeGeneration": true, "dsManualSetReady": false, "dsSource": "YwXJ66Bv", "enableSecret": false, "fallbackClaimKeys": ["ulTLjMjx", "tSqSkHlr", "FWuB0OZn"], "immutableStorage": true, "inactiveTimeout": 91, "inviteTimeout": 31, "joinability": "CUlDY4Gn", "leaderElectionGracePeriod": 60, "maxActiveSessions": 25, "maxPlayers": 53, "minPlayers": 42, "name": "SFsBWGp8", "persistent": false, "preferredClaimKeys": ["5pGEznPW", "2Y0gE8xT", "VT9QDCki"], "requestedRegions": ["otcxeGCm", "9hmMH4Pc", "PrCuYG2Z"], "textChat": true, "tieTeamsSessionLifetime": true, "type": "XzFZEsch"}' \
    > test.out 2>&1
eval_tap $? 14 'AdminCreateConfigurationTemplateV1' test.out

#- 15 AdminGetAllConfigurationTemplatesV1
./ng net.accelbyte.sdk.cli.Main session adminGetAllConfigurationTemplatesV1 \
    --namespace "$AB_NAMESPACE" \
    --limit '92' \
    --name 'lV6hMF6I' \
    --offset '45' \
    --order 'NhL6hqxg' \
    --orderBy 'X4wCTCaK' \
    > test.out 2>&1
eval_tap $? 15 'AdminGetAllConfigurationTemplatesV1' test.out

#- 16 AdminGetConfigurationTemplateV1
./ng net.accelbyte.sdk.cli.Main session adminGetConfigurationTemplateV1 \
    --name 'x6VfXhv1' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 16 'AdminGetConfigurationTemplateV1' test.out

#- 17 AdminUpdateConfigurationTemplateV1
./ng net.accelbyte.sdk.cli.Main session adminUpdateConfigurationTemplateV1 \
    --name 'ZIKzkvCB' \
    --namespace "$AB_NAMESPACE" \
    --body '{"NativeSessionSetting": {"PSNServiceLabel": 99, "PSNSupportedPlatforms": ["eI6EFSWx", "O0DHEnAZ", "GVtYQTTQ"], "SessionTitle": "5fReYxa2", "ShouldSync": true, "XboxAllowCrossPlatform": false, "XboxSandboxID": "ln0jNV2j", "XboxServiceConfigID": "Wf3hG2vj", "XboxSessionTemplateName": "yE0FRF8S", "XboxTitleID": "1d5YnTR6", "localizedSessionName": {"BNn2UEaY": {}, "tAQSkS7Z": {}, "hDqpwu4I": {}}}, "PSNBaseUrl": "5nxFazq2", "attributes": {"9uTqozYB": {}, "92zWLHmK": {}, "2aEEXdP8": {}}, "autoJoin": false, "clientVersion": "royVul0b", "deployment": "NV7BdETU", "disableCodeGeneration": false, "dsManualSetReady": true, "dsSource": "fWFgXd8n", "enableSecret": false, "fallbackClaimKeys": ["qW5brhD2", "lBuYbKNX", "dtKXUelc"], "immutableStorage": true, "inactiveTimeout": 95, "inviteTimeout": 6, "joinability": "9rTBLerL", "leaderElectionGracePeriod": 39, "maxActiveSessions": 85, "maxPlayers": 64, "minPlayers": 72, "name": "UBjnVITE", "persistent": true, "preferredClaimKeys": ["nAFeCZSY", "BohKRnmf", "oyykiWXX"], "requestedRegions": ["1nEIVDdZ", "yiAaKY1X", "AwGnMJbR"], "textChat": false, "tieTeamsSessionLifetime": true, "type": "MlYCc3du"}' \
    > test.out 2>&1
eval_tap $? 17 'AdminUpdateConfigurationTemplateV1' test.out

#- 18 AdminDeleteConfigurationTemplateV1
./ng net.accelbyte.sdk.cli.Main session adminDeleteConfigurationTemplateV1 \
    --name 'YAJL8srz' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 18 'AdminDeleteConfigurationTemplateV1' test.out

#- 19 AdminGetMemberActiveSession
./ng net.accelbyte.sdk.cli.Main session adminGetMemberActiveSession \
    --name '4EkuhbOm' \
    --namespace "$AB_NAMESPACE" \
    --userId 'XS260wD1' \
    > test.out 2>&1
eval_tap $? 19 'AdminGetMemberActiveSession' test.out

#- 20 AdminReconcileMaxActiveSession
./ng net.accelbyte.sdk.cli.Main session adminReconcileMaxActiveSession \
    --name 'moVxr8SL' \
    --namespace "$AB_NAMESPACE" \
    --body '{"userID": "ytzF8uIc"}' \
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
    --configurationName 'yrwNRcpw' \
    --dsPodName 'RCAcstsE' \
    --fromTime 'w8PnSUyw' \
    --gameMode 'oEUMkvec' \
    --isPersistent 'ecL1wdey' \
    --isSoftDeleted 'sPIJtafT' \
    --joinability '9vgo6nsF' \
    --limit '29' \
    --matchPool 'iISKlBzT' \
    --memberID 'KSr3YUsi' \
    --offset '45' \
    --order 'UAfZEKvr' \
    --orderBy 'TkaRW4qW' \
    --sessionID 'VFUJc7lr' \
    --status 'nugQSQIF' \
    --statusV2 'fAlEXrB7' \
    --toTime 'qpYYkYEc' \
    > test.out 2>&1
eval_tap $? 23 'AdminQueryGameSessions' test.out

#- 24 AdminQueryGameSessionsByAttributes
./ng net.accelbyte.sdk.cli.Main session adminQueryGameSessionsByAttributes \
    --namespace "$AB_NAMESPACE" \
    --body '{"x6Wnvf1n": {}, "nEyo1G4n": {}, "iKHDLc0E": {}}' \
    > test.out 2>&1
eval_tap $? 24 'AdminQueryGameSessionsByAttributes' test.out

#- 25 AdminDeleteBulkGameSessions
./ng net.accelbyte.sdk.cli.Main session adminDeleteBulkGameSessions \
    --namespace "$AB_NAMESPACE" \
    --body '{"ids": ["v0Q9xXgu", "9q6cFygH", "UmqAxmab"]}' \
    > test.out 2>&1
eval_tap $? 25 'AdminDeleteBulkGameSessions' test.out

#- 26 AdminSetDSReady
./ng net.accelbyte.sdk.cli.Main session adminSetDSReady \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'mfqB89JS' \
    --body '{"ready": true}' \
    > test.out 2>&1
eval_tap $? 26 'AdminSetDSReady' test.out

#- 27 AdminUpdateGameSessionMember
./ng net.accelbyte.sdk.cli.Main session adminUpdateGameSessionMember \
    --memberId 'DJ1WUFdM' \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'AZ9nZmuz' \
    --statusType 'KcOYWn4L' \
    > test.out 2>&1
eval_tap $? 27 'AdminUpdateGameSessionMember' test.out

#- 28 AdminGetListNativeSession
./ng net.accelbyte.sdk.cli.Main session adminGetListNativeSession \
    --namespace "$AB_NAMESPACE" \
    --limit '29' \
    --offset '65' \
    --order 'ZQOGgvTF' \
    > test.out 2>&1
eval_tap $? 28 'AdminGetListNativeSession' test.out

#- 29 AdminQueryParties
./ng net.accelbyte.sdk.cli.Main session adminQueryParties \
    --namespace "$AB_NAMESPACE" \
    --joinability 'YmbgJeCX' \
    --key 'DVfpIxga' \
    --leaderID 'GmtdaLfK' \
    --limit '8' \
    --memberID '2A2lJPav' \
    --memberStatus 'IHczEWAU' \
    --offset '53' \
    --order 'RTev1fRT' \
    --orderBy 'YpwnndQi' \
    --partyID 'KAsTfO8b' \
    --value 'yaVEKfpG' \
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
    --body '{"psn": {"clientId": "i9W7InTG", "clientSecret": "RyAqOkRy", "scope": "mTB7yOAV"}}' \
    > test.out 2>&1
eval_tap $? 31 'AdminUpdatePlatformCredentials' test.out

#- 32 AdminDeletePlatformCredentials
./ng net.accelbyte.sdk.cli.Main session adminDeletePlatformCredentials \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 32 'AdminDeletePlatformCredentials' test.out

#- 33 AdminReadSessionStorage
./ng net.accelbyte.sdk.cli.Main session adminReadSessionStorage \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'UT5qVgdh' \
    > test.out 2>&1
eval_tap $? 33 'AdminReadSessionStorage' test.out

#- 34 AdminDeleteUserSessionStorage
./ng net.accelbyte.sdk.cli.Main session adminDeleteUserSessionStorage \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'qmoyeFKZ' \
    > test.out 2>&1
eval_tap $? 34 'AdminDeleteUserSessionStorage' test.out

#- 35 AdminReadUserSessionStorage
./ng net.accelbyte.sdk.cli.Main session adminReadUserSessionStorage \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'q70UQkyf' \
    --userId 'h7dg3kt0' \
    > test.out 2>&1
eval_tap $? 35 'AdminReadUserSessionStorage' test.out

#- 36 AdminQueryPlayerAttributes
./ng net.accelbyte.sdk.cli.Main session adminQueryPlayerAttributes \
    --namespace "$AB_NAMESPACE" \
    --users 'sbj2pvv8' \
    > test.out 2>&1
eval_tap $? 36 'AdminQueryPlayerAttributes' test.out

#- 37 AdminGetPlayerAttributes
./ng net.accelbyte.sdk.cli.Main session adminGetPlayerAttributes \
    --namespace "$AB_NAMESPACE" \
    --userId 'fQ57NugD' \
    > test.out 2>&1
eval_tap $? 37 'AdminGetPlayerAttributes' test.out

#- 38 CreateGameSession
./ng net.accelbyte.sdk.cli.Main session createGameSession \
    --namespace "$AB_NAMESPACE" \
    --body '{"attributes": {"HpExCmYS": {}, "4Htr4x4e": {}, "Slk9uUFr": {}}, "autoJoin": true, "backfillTicketID": "cRhiJrHf", "clientVersion": "zX5B0uQy", "configurationName": "fBjp9eF3", "deployment": "GrPUcCCl", "dsSource": "9lwPZG4K", "fallbackClaimKeys": ["TgGGXZHi", "nOq224Ve", "lUsOyZqm"], "inactiveTimeout": 47, "inviteTimeout": 3, "joinability": "uKiTnYBH", "matchPool": "sBj7dsgv", "maxPlayers": 11, "minPlayers": 61, "preferredClaimKeys": ["asFGRphf", "Whi9FX04", "Pd52R4rH"], "requestedRegions": ["c8ki2XTT", "auyF6jcs", "Fkt23Mil"], "serverName": "mGiPFQtc", "teams": [{"UserIDs": ["25ERKvBt", "v1Li8ZFR", "QsPXPwN9"], "parties": [{"partyID": "LMHmVmG8", "userIDs": ["YhIZSAdp", "hALF0uBo", "pFOs8mPN"]}, {"partyID": "UAw3aGfX", "userIDs": ["Y8R4b8Yo", "vhCdCDwS", "0QavHQCK"]}, {"partyID": "NeE2TnBI", "userIDs": ["4uj931iD", "gg12icuC", "6vIZdwoD"]}]}, {"UserIDs": ["xxSfg6ph", "ZAHCQeG5", "e2kXVUS7"], "parties": [{"partyID": "NDedYP0D", "userIDs": ["EoPJxnhz", "n83VK1wz", "RboyG9DD"]}, {"partyID": "mRp0Q1si", "userIDs": ["COaklrDX", "14n9S40e", "zK9YDNFf"]}, {"partyID": "8NbrxOKw", "userIDs": ["o7b7oKKZ", "MPIh2uly", "nBgZW2c9"]}]}, {"UserIDs": ["nGAYDhDd", "nGpBP99k", "TSnU72SQ"], "parties": [{"partyID": "GHr9Kxo0", "userIDs": ["X1ayWZ6G", "Y08kmfHf", "M9ehq2zO"]}, {"partyID": "GrvC3dxV", "userIDs": ["QR8fcRMT", "S0gqWF0j", "LmMcPdNw"]}, {"partyID": "er3NlZXz", "userIDs": ["gh9kc6j8", "LFHZeNtB", "4kJ8DQSK"]}]}], "textChat": false, "ticketIDs": ["qb8Ny3Bz", "rLemp36A", "tqJJbwMx"], "tieTeamsSessionLifetime": false, "type": "TdYvFn0p"}' \
    > test.out 2>&1
eval_tap $? 38 'CreateGameSession' test.out

#- 39 PublicQueryGameSessionsByAttributes
./ng net.accelbyte.sdk.cli.Main session publicQueryGameSessionsByAttributes \
    --namespace "$AB_NAMESPACE" \
    --body '{"uJYwdH5P": {}, "ZPDnhnqs": {}, "6XrbjrMA": {}}' \
    > test.out 2>&1
eval_tap $? 39 'PublicQueryGameSessionsByAttributes' test.out

#- 40 PublicSessionJoinCode
./ng net.accelbyte.sdk.cli.Main session publicSessionJoinCode \
    --namespace "$AB_NAMESPACE" \
    --body '{"code": "QRy5NCuO"}' \
    > test.out 2>&1
eval_tap $? 40 'PublicSessionJoinCode' test.out

#- 41 GetGameSessionByPodName
./ng net.accelbyte.sdk.cli.Main session getGameSessionByPodName \
    --namespace "$AB_NAMESPACE" \
    --podName 'L6Y45CfA' \
    > test.out 2>&1
eval_tap $? 41 'GetGameSessionByPodName' test.out

#- 42 GetGameSession
./ng net.accelbyte.sdk.cli.Main session getGameSession \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'vOW2tGXK' \
    > test.out 2>&1
eval_tap $? 42 'GetGameSession' test.out

#- 43 UpdateGameSession
./ng net.accelbyte.sdk.cli.Main session updateGameSession \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'La7OXloD' \
    --body '{"attributes": {"6ufKubGl": {}, "69jdeVn6": {}, "2PDUCIGx": {}}, "backfillTicketID": "6RBPQNQu", "clientVersion": "NsHHXSzZ", "deployment": "i3WPvXrM", "fallbackClaimKeys": ["GWTiJ03E", "CijWJjww", "q9bpffsX"], "inactiveTimeout": 51, "inviteTimeout": 47, "joinability": "CkvVL23k", "matchPool": "4fsjMt5c", "maxPlayers": 11, "minPlayers": 77, "preferredClaimKeys": ["yR7lurzk", "QyS6zid0", "pzGyR2TE"], "requestedRegions": ["4mBh7Ig7", "Z6mDlnYx", "u6v8Xto2"], "teams": [{"UserIDs": ["eaCtNN94", "HyRdmn9w", "y4h0IUuq"], "parties": [{"partyID": "eQS9Gihb", "userIDs": ["KBCCRqld", "U65E7ffU", "XwDbLrzS"]}, {"partyID": "MCbC6Tjt", "userIDs": ["gDNRtQY4", "esTJj79l", "O1T83MR2"]}, {"partyID": "pfLIqmar", "userIDs": ["mOpB7kA8", "Ek4Zisyj", "k8oRNnxe"]}]}, {"UserIDs": ["G0jUBn0k", "RrgNjcQX", "3WQdNGeI"], "parties": [{"partyID": "b5coM6Al", "userIDs": ["mv8HBN81", "lWsf8DOW", "hlv07LEO"]}, {"partyID": "AqkYgLs2", "userIDs": ["Nx7rljTV", "J5vZ5DkM", "cR3wVx1O"]}, {"partyID": "3EU5QKqU", "userIDs": ["edvB6sOp", "8bMp14rS", "IFmsb2YF"]}]}, {"UserIDs": ["jRBxlPVf", "FHW468BJ", "O2DFlU8W"], "parties": [{"partyID": "oHyoBmb4", "userIDs": ["uVRUQntB", "Pvug3FOC", "DY8Pb4Aj"]}, {"partyID": "Z221ZHaV", "userIDs": ["w3OYIhcn", "8C3UZTOa", "ogB0Mzk4"]}, {"partyID": "TAJxIr4I", "userIDs": ["v0zaHtyj", "HyqrFsrb", "1MxGFBOb"]}]}], "ticketIDs": ["k6QjKFfn", "T7oaaJU5", "GO6xgMtW"], "tieTeamsSessionLifetime": true, "type": "TBvB3p2B", "version": 4}' \
    > test.out 2>&1
eval_tap $? 43 'UpdateGameSession' test.out

#- 44 DeleteGameSession
./ng net.accelbyte.sdk.cli.Main session deleteGameSession \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'TckcDs1T' \
    > test.out 2>&1
eval_tap $? 44 'DeleteGameSession' test.out

#- 45 PatchUpdateGameSession
./ng net.accelbyte.sdk.cli.Main session patchUpdateGameSession \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'lTvA5txt' \
    --body '{"attributes": {"d4qvdFGT": {}, "RTHsoCVB": {}, "5kArVLUm": {}}, "backfillTicketID": "e2XQEYmC", "clientVersion": "Fi4sgEBP", "deployment": "K1Iv4Axl", "fallbackClaimKeys": ["gg2HisVZ", "P0tClc62", "BcmK2a5b"], "inactiveTimeout": 7, "inviteTimeout": 14, "joinability": "gZMOM8BA", "matchPool": "bpBVhZ5r", "maxPlayers": 77, "minPlayers": 49, "preferredClaimKeys": ["bQpd5yPD", "oqgt2oAE", "7OGHTd46"], "requestedRegions": ["VzJe3q7j", "y7Ge0Mfa", "7yBI7jWZ"], "teams": [{"UserIDs": ["241kdvlz", "fNXfC2y7", "XP0wtWnX"], "parties": [{"partyID": "1lI4lr8f", "userIDs": ["3GXmPW1b", "DH8kjEDV", "bYRJ6U3z"]}, {"partyID": "cbeOeAJX", "userIDs": ["LBJjG3Vq", "3dCPHNa2", "WkwGj3FH"]}, {"partyID": "OgZDFOuJ", "userIDs": ["0zbSztB5", "3FrV0z0z", "VYe55lhL"]}]}, {"UserIDs": ["CxnoBakM", "Xm0ATISv", "XD6aWjtt"], "parties": [{"partyID": "5kGp6bNG", "userIDs": ["FuJq3xzv", "6spxrTOQ", "rubaAKeM"]}, {"partyID": "OXcbvgDE", "userIDs": ["uP9A8MQZ", "eGgh0fYG", "69L6pYRw"]}, {"partyID": "OGzaWTRd", "userIDs": ["mkVRAiKK", "vXdtUEyK", "npeKug9t"]}]}, {"UserIDs": ["gzGzGpgP", "FBaGaTbl", "LZg6ca0L"], "parties": [{"partyID": "Cpfxyiud", "userIDs": ["bmcUfJly", "njkvqFiN", "xtUS4jjn"]}, {"partyID": "aNPzKPLD", "userIDs": ["oFSKQXfm", "rDHVQ8Or", "EZWP3cX8"]}, {"partyID": "ZxIYZDdV", "userIDs": ["hW5vUTuC", "nD1EC0RW", "haHhirkM"]}]}], "ticketIDs": ["mTCaPyYe", "mk0SQT5Z", "5raNUzBI"], "tieTeamsSessionLifetime": false, "type": "hHmJwI7M", "version": 5}' \
    > test.out 2>&1
eval_tap $? 45 'PatchUpdateGameSession' test.out

#- 46 UpdateGameSessionBackfillTicketID
./ng net.accelbyte.sdk.cli.Main session updateGameSessionBackfillTicketID \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'Kprv285F' \
    --body '{"backfillTicketID": "qpqxMmUP"}' \
    > test.out 2>&1
eval_tap $? 46 'UpdateGameSessionBackfillTicketID' test.out

#- 47 GameSessionGenerateCode
./ng net.accelbyte.sdk.cli.Main session gameSessionGenerateCode \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'aT6ESc04' \
    > test.out 2>&1
eval_tap $? 47 'GameSessionGenerateCode' test.out

#- 48 PublicRevokeGameSessionCode
./ng net.accelbyte.sdk.cli.Main session publicRevokeGameSessionCode \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'uaLmRJed' \
    > test.out 2>&1
eval_tap $? 48 'PublicRevokeGameSessionCode' test.out

#- 49 PublicGameSessionInvite
./ng net.accelbyte.sdk.cli.Main session publicGameSessionInvite \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'fdwIW5Hk' \
    --body '{"platformID": "FBDKNBQh", "userID": "vtqKj2wE"}' \
    > test.out 2>&1
eval_tap $? 49 'PublicGameSessionInvite' test.out

#- 50 JoinGameSession
./ng net.accelbyte.sdk.cli.Main session joinGameSession \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'ej3HwSD3' \
    > test.out 2>&1
eval_tap $? 50 'JoinGameSession' test.out

#- 51 PublicPromoteGameSessionLeader
./ng net.accelbyte.sdk.cli.Main session publicPromoteGameSessionLeader \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'hyOXwu82' \
    --body '{"leaderID": "FEeS4Gmw"}' \
    > test.out 2>&1
eval_tap $? 51 'PublicPromoteGameSessionLeader' test.out

#- 52 LeaveGameSession
./ng net.accelbyte.sdk.cli.Main session leaveGameSession \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'kljc1PQc' \
    > test.out 2>&1
eval_tap $? 52 'LeaveGameSession' test.out

#- 53 PublicGameSessionReject
./ng net.accelbyte.sdk.cli.Main session publicGameSessionReject \
    --namespace "$AB_NAMESPACE" \
    --sessionId '2O8CyiaR' \
    > test.out 2>&1
eval_tap $? 53 'PublicGameSessionReject' test.out

#- 54 GetSessionServerSecret
./ng net.accelbyte.sdk.cli.Main session getSessionServerSecret \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'u8FpfRGO' \
    > test.out 2>&1
eval_tap $? 54 'GetSessionServerSecret' test.out

#- 55 AppendTeamGameSession
./ng net.accelbyte.sdk.cli.Main session appendTeamGameSession \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'vz4NJtb5' \
    --body '{"additionalMembers": [{"partyID": "TN3Qoaoh", "userIDs": ["PPlMa4Ir", "dYSMJcQk", "VAOFPObG"]}, {"partyID": "pyPqT24C", "userIDs": ["p8QOer8g", "UAq17ppE", "oEpYX34Y"]}, {"partyID": "HTVk0pd4", "userIDs": ["q7IO3fqR", "CZBjB9Qz", "WJnWEdmn"]}], "proposedTeams": [{"UserIDs": ["flPEbun0", "jBQzhomv", "OPslPXUe"], "parties": [{"partyID": "CInP4kuK", "userIDs": ["LxpZNpcG", "J0unzilb", "wTnCL2yc"]}, {"partyID": "m77ngRvq", "userIDs": ["4XuiK4Cc", "MXpRVJbe", "8shOSbyM"]}, {"partyID": "VMVDFgu6", "userIDs": ["lDEwGsKZ", "EJLv5G76", "higTwuB0"]}]}, {"UserIDs": ["nClS98Vi", "WpfC15qb", "Ecsh3INd"], "parties": [{"partyID": "6I8Oaq75", "userIDs": ["GN2FNnNb", "Kig9GCez", "MvOpD3aA"]}, {"partyID": "ki6VMEAp", "userIDs": ["ACKdNqEo", "P9u4UXcD", "lEQ9VcAo"]}, {"partyID": "HtDEZlfn", "userIDs": ["R5MjsuXG", "pgHzLU2C", "QUZyrkYh"]}]}, {"UserIDs": ["IxskWu7i", "s7sjtFZT", "dfRUW38u"], "parties": [{"partyID": "bZdTWQWc", "userIDs": ["NrxsUrMb", "mMP5jEjY", "XLFWrPxp"]}, {"partyID": "KqFSgn3M", "userIDs": ["RBypvs0K", "UMHjQq2Q", "tIOfSq2V"]}, {"partyID": "zvwOaQxr", "userIDs": ["AC18u020", "DpcgLJQF", "16rW2nGN"]}]}], "version": 20}' \
    > test.out 2>&1
eval_tap $? 55 'AppendTeamGameSession' test.out

#- 56 PublicPartyJoinCode
./ng net.accelbyte.sdk.cli.Main session publicPartyJoinCode \
    --namespace "$AB_NAMESPACE" \
    --body '{"code": "mvuXacRp"}' \
    > test.out 2>&1
eval_tap $? 56 'PublicPartyJoinCode' test.out

#- 57 PublicGetParty
./ng net.accelbyte.sdk.cli.Main session publicGetParty \
    --namespace "$AB_NAMESPACE" \
    --partyId 'di36QMLJ' \
    > test.out 2>&1
eval_tap $? 57 'PublicGetParty' test.out

#- 58 PublicUpdateParty
./ng net.accelbyte.sdk.cli.Main session publicUpdateParty \
    --namespace "$AB_NAMESPACE" \
    --partyId '2ZNSx7Yu' \
    --body '{"attributes": {"SK4HcDTt": {}, "863iXNY4": {}, "1QTz5iql": {}}, "inactiveTimeout": 66, "inviteTimeout": 37, "joinability": "dpNb0qo4", "maxPlayers": 35, "minPlayers": 75, "type": "ZWBnYy0R", "version": 27}' \
    > test.out 2>&1
eval_tap $? 58 'PublicUpdateParty' test.out

#- 59 PublicPatchUpdateParty
./ng net.accelbyte.sdk.cli.Main session publicPatchUpdateParty \
    --namespace "$AB_NAMESPACE" \
    --partyId 'vm0OaHA1' \
    --body '{"attributes": {"mCnYj4pi": {}, "CA0GTTDL": {}, "lmUs3af4": {}}, "inactiveTimeout": 46, "inviteTimeout": 52, "joinability": "FYTFTWcK", "maxPlayers": 70, "minPlayers": 14, "type": "EYCbzG0C", "version": 36}' \
    > test.out 2>&1
eval_tap $? 59 'PublicPatchUpdateParty' test.out

#- 60 PublicGeneratePartyCode
./ng net.accelbyte.sdk.cli.Main session publicGeneratePartyCode \
    --namespace "$AB_NAMESPACE" \
    --partyId 'UCklw8UF' \
    > test.out 2>&1
eval_tap $? 60 'PublicGeneratePartyCode' test.out

#- 61 PublicRevokePartyCode
./ng net.accelbyte.sdk.cli.Main session publicRevokePartyCode \
    --namespace "$AB_NAMESPACE" \
    --partyId 'KQIkF2yB' \
    > test.out 2>&1
eval_tap $? 61 'PublicRevokePartyCode' test.out

#- 62 PublicPartyInvite
./ng net.accelbyte.sdk.cli.Main session publicPartyInvite \
    --namespace "$AB_NAMESPACE" \
    --partyId 'p0dlBVuS' \
    --body '{"platformID": "ORbPHtun", "userID": "edg5xmuh"}' \
    > test.out 2>&1
eval_tap $? 62 'PublicPartyInvite' test.out

#- 63 PublicPromotePartyLeader
./ng net.accelbyte.sdk.cli.Main session publicPromotePartyLeader \
    --namespace "$AB_NAMESPACE" \
    --partyId 'pfOZrXQ0' \
    --body '{"leaderID": "UgqxNQOs"}' \
    > test.out 2>&1
eval_tap $? 63 'PublicPromotePartyLeader' test.out

#- 64 PublicPartyJoin
./ng net.accelbyte.sdk.cli.Main session publicPartyJoin \
    --namespace "$AB_NAMESPACE" \
    --partyId 'G9SsUisK' \
    > test.out 2>&1
eval_tap $? 64 'PublicPartyJoin' test.out

#- 65 PublicPartyLeave
./ng net.accelbyte.sdk.cli.Main session publicPartyLeave \
    --namespace "$AB_NAMESPACE" \
    --partyId '8eJOr90x' \
    > test.out 2>&1
eval_tap $? 65 'PublicPartyLeave' test.out

#- 66 PublicPartyReject
./ng net.accelbyte.sdk.cli.Main session publicPartyReject \
    --namespace "$AB_NAMESPACE" \
    --partyId 'xBSm89yL' \
    > test.out 2>&1
eval_tap $? 66 'PublicPartyReject' test.out

#- 67 PublicPartyKick
./ng net.accelbyte.sdk.cli.Main session publicPartyKick \
    --namespace "$AB_NAMESPACE" \
    --partyId 'R1Qmv1kE' \
    --userId 'M0ow7wBa' \
    > test.out 2>&1
eval_tap $? 67 'PublicPartyKick' test.out

#- 68 PublicCreateParty
./ng net.accelbyte.sdk.cli.Main session publicCreateParty \
    --namespace "$AB_NAMESPACE" \
    --body '{"attributes": {"ksne0qEZ": {}, "zYdsOuVl": {}, "GoEeuiyv": {}}, "configurationName": "ekjjtX86", "inactiveTimeout": 74, "inviteTimeout": 54, "joinability": "8aOdc8wE", "maxPlayers": 60, "members": [{"ID": "VK8WFxLc", "PlatformID": "CbWq9SM3", "PlatformUserID": "gVfdA4kE"}, {"ID": "fxiSl2vm", "PlatformID": "FbySok0g", "PlatformUserID": "5JrQHzzX"}, {"ID": "ZQ5cyUsW", "PlatformID": "LRhhrgUx", "PlatformUserID": "NHZg0ZvX"}], "minPlayers": 98, "textChat": false, "type": "rjO2ZABk"}' \
    > test.out 2>&1
eval_tap $? 68 'PublicCreateParty' test.out

#- 69 PublicGetRecentPlayer
./ng net.accelbyte.sdk.cli.Main session publicGetRecentPlayer \
    --namespace "$AB_NAMESPACE" \
    --limit '69' \
    --userId '2CpZPdml' \
    > test.out 2>&1
eval_tap $? 69 'PublicGetRecentPlayer' test.out

#- 70 PublicUpdateInsertSessionStorageLeader
./ng net.accelbyte.sdk.cli.Main session publicUpdateInsertSessionStorageLeader \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'AKx1zxHJ' \
    --body '{"tQ6XgMOX": {}, "CscjqGve": {}, "IjLei8rF": {}}' \
    > test.out 2>&1
eval_tap $? 70 'PublicUpdateInsertSessionStorageLeader' test.out

#- 71 PublicUpdateInsertSessionStorage
./ng net.accelbyte.sdk.cli.Main session publicUpdateInsertSessionStorage \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'GKJ6GsX9' \
    --userId 'E70r9IbK' \
    --body '{"1ItxD59z": {}, "ziZFhEeP": {}, "e59aOlJM": {}}' \
    > test.out 2>&1
eval_tap $? 71 'PublicUpdateInsertSessionStorage' test.out

#- 72 PublicGetBulkPlayerCurrentPlatform
./ng net.accelbyte.sdk.cli.Main session publicGetBulkPlayerCurrentPlatform \
    --namespace "$AB_NAMESPACE" \
    --body '{"userIDs": ["7OEneRdC", "ItrN7LVf", "pzmf2UOr"]}' \
    > test.out 2>&1
eval_tap $? 72 'PublicGetBulkPlayerCurrentPlatform' test.out

#- 73 PublicGetPlayerAttributes
./ng net.accelbyte.sdk.cli.Main session publicGetPlayerAttributes \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 73 'PublicGetPlayerAttributes' test.out

#- 74 PublicStorePlayerAttributes
./ng net.accelbyte.sdk.cli.Main session publicStorePlayerAttributes \
    --namespace "$AB_NAMESPACE" \
    --body '{"crossplayEnabled": true, "currentPlatform": "onXqSI31", "data": {"KcWCqQgK": {}, "JRM5WJ6l": {}, "Uvumy15Y": {}}, "platforms": [{"name": "7TbzpalL", "userID": "IWY5UkmP"}, {"name": "eXAJZTJQ", "userID": "ithfEZ8x"}, {"name": "8qN3DQsy", "userID": "WKHSPLOB"}], "roles": ["lony939h", "CVNy0rrn", "ztxv48h6"]}' \
    > test.out 2>&1
eval_tap $? 74 'PublicStorePlayerAttributes' test.out

#- 75 PublicDeletePlayerAttributes
./ng net.accelbyte.sdk.cli.Main session publicDeletePlayerAttributes \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 75 'PublicDeletePlayerAttributes' test.out

#- 76 PublicQueryMyGameSessions
./ng net.accelbyte.sdk.cli.Main session publicQueryMyGameSessions \
    --namespace "$AB_NAMESPACE" \
    --order 'UWcye4uR' \
    --orderBy 'i6V9VAQG' \
    --status '1obflJLW' \
    > test.out 2>&1
eval_tap $? 76 'PublicQueryMyGameSessions' test.out

#- 77 PublicQueryMyParties
./ng net.accelbyte.sdk.cli.Main session publicQueryMyParties \
    --namespace "$AB_NAMESPACE" \
    --order 'vPNoroCZ' \
    --orderBy 'iRsg5Y5b' \
    --status '3YAhaTAQ' \
    > test.out 2>&1
eval_tap $? 77 'PublicQueryMyParties' test.out


rm -f "tmp.dat"

exit $EXIT_CODE