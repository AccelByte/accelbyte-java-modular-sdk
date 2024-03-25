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
echo "1..78"

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
    --body '{"regionRetryMapping": {"f671GDv3": ["waWoxnox", "ng9ibLzf", "QRjaqisI"], "FuiPAjwE": ["QJPXbJu7", "jTTLWdfy", "8Kv8b0l1"], "wKSgfAzK": ["I4UDP1Mz", "erOSx2Ro", "dfF6Fe3N"]}, "regionURLMapping": ["SJhwG1hs", "FT0PFdP2", "cF04g068"], "testGameMode": "J4V6mVNC", "testRegionURLMapping": ["lXirVntJ", "6noh8DMV", "stuyD7PF"], "testTargetUserIDs": ["hmCQTdiN", "tnOtm0Bh", "JaCDP6Vp"]}' \
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
    --body '{"durationDays": 56}' \
    > test.out 2>&1
eval_tap $? 10 'AdminUpdateConfigurationAlertV1' test.out

#- 11 AdminCreateConfigurationAlertV1
./ng net.accelbyte.sdk.cli.Main session adminCreateConfigurationAlertV1 \
    --namespace "$AB_NAMESPACE" \
    --body '{"durationDays": 97}' \
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
    --description 'BLobqsQd' \
    --certname 'IH45BIGL' \
    --file 'tmp.dat' \
    --password '8ZtVEBQA' \
    > test.out 2>&1
eval_tap $? 13 'HandleUploadXboxPFXCertificate' test.out

#- 14 AdminCreateConfigurationTemplateV1
./ng net.accelbyte.sdk.cli.Main session adminCreateConfigurationTemplateV1 \
    --namespace "$AB_NAMESPACE" \
    --body '{"NativeSessionSetting": {"PSNServiceLabel": 91, "PSNSupportedPlatforms": ["rqlRBJal", "DtpmM2s9", "FqcFOg35"], "SessionTitle": "63yy9OyF", "ShouldSync": true, "XboxAllowCrossPlatform": false, "XboxSandboxID": "76EWTnZb", "XboxServiceConfigID": "nMj1FlMF", "XboxSessionTemplateName": "GPSGfNGZ", "XboxTitleID": "6sMGatnH", "localizedSessionName": {"69LdYREV": {}, "VgxOriZL": {}, "W0UGQajj": {}}}, "PSNBaseUrl": "8fQfh1UE", "attributes": {"c4itT2N9": {}, "F7AhqV1A": {}, "WMRHf7j0": {}}, "autoJoin": true, "autoLeaveSession": false, "clientVersion": "5LbOA70p", "deployment": "5IKth8HI", "disableCodeGeneration": true, "dsManualSetReady": false, "dsSource": "7fedK9ra", "enableSecret": true, "fallbackClaimKeys": ["Ax29LHz2", "V4Y7v7UF", "krQxxPky"], "immutableStorage": true, "inactiveTimeout": 19, "inviteTimeout": 40, "joinability": "vOVjx6ZV", "leaderElectionGracePeriod": 50, "manualRejoin": false, "maxActiveSessions": 31, "maxPlayers": 10, "minPlayers": 72, "name": "bdEe5eaB", "persistent": true, "preferredClaimKeys": ["jDsznNB7", "Q0zANND7", "lNXyUR1L"], "requestedRegions": ["C3Yo2e1G", "XZFhOFNb", "REhK19Ik"], "textChat": true, "tieTeamsSessionLifetime": false, "type": "m0ZOVxjY"}' \
    > test.out 2>&1
eval_tap $? 14 'AdminCreateConfigurationTemplateV1' test.out

#- 15 AdminGetAllConfigurationTemplatesV1
./ng net.accelbyte.sdk.cli.Main session adminGetAllConfigurationTemplatesV1 \
    --namespace "$AB_NAMESPACE" \
    --limit '23' \
    --name 'uhR7V3UZ' \
    --offset '40' \
    --order 'g22p7cGF' \
    --orderBy 'qOx997rd' \
    > test.out 2>&1
eval_tap $? 15 'AdminGetAllConfigurationTemplatesV1' test.out

#- 16 AdminGetConfigurationTemplateV1
./ng net.accelbyte.sdk.cli.Main session adminGetConfigurationTemplateV1 \
    --name 'BBqetnwl' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 16 'AdminGetConfigurationTemplateV1' test.out

#- 17 AdminUpdateConfigurationTemplateV1
./ng net.accelbyte.sdk.cli.Main session adminUpdateConfigurationTemplateV1 \
    --name '4r6XWLiA' \
    --namespace "$AB_NAMESPACE" \
    --body '{"NativeSessionSetting": {"PSNServiceLabel": 47, "PSNSupportedPlatforms": ["AvouvLfp", "OU3WTYyL", "J10DdPw5"], "SessionTitle": "Cwi6FoKU", "ShouldSync": true, "XboxAllowCrossPlatform": true, "XboxSandboxID": "5VX4HFI3", "XboxServiceConfigID": "h2A3gwa0", "XboxSessionTemplateName": "erseoTwB", "XboxTitleID": "FeYoS1f3", "localizedSessionName": {"7hDiDWaN": {}, "ft8wyP4q": {}, "TQuc2ICV": {}}}, "PSNBaseUrl": "7VkxquZU", "attributes": {"uZ6Kb3xY": {}, "NMEJZwLT": {}, "paSncJ9p": {}}, "autoJoin": false, "autoLeaveSession": true, "clientVersion": "SDClNNeA", "deployment": "W8fwPgPl", "disableCodeGeneration": false, "dsManualSetReady": true, "dsSource": "NCJbV16I", "enableSecret": false, "fallbackClaimKeys": ["iZU8hx95", "Xy6wvK0h", "NIZmsQWi"], "immutableStorage": false, "inactiveTimeout": 23, "inviteTimeout": 96, "joinability": "nsnSHWkJ", "leaderElectionGracePeriod": 13, "manualRejoin": true, "maxActiveSessions": 86, "maxPlayers": 25, "minPlayers": 99, "name": "wqjxko1S", "persistent": false, "preferredClaimKeys": ["bqVH7PE3", "25Q8ngbY", "eCDQMj0f"], "requestedRegions": ["zasSmjVa", "qn1gbjnp", "3WFqQmkO"], "textChat": true, "tieTeamsSessionLifetime": true, "type": "kynv3Yew"}' \
    > test.out 2>&1
eval_tap $? 17 'AdminUpdateConfigurationTemplateV1' test.out

#- 18 AdminDeleteConfigurationTemplateV1
./ng net.accelbyte.sdk.cli.Main session adminDeleteConfigurationTemplateV1 \
    --name 'L5jV8BOE' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 18 'AdminDeleteConfigurationTemplateV1' test.out

#- 19 AdminGetMemberActiveSession
./ng net.accelbyte.sdk.cli.Main session adminGetMemberActiveSession \
    --name 'on2TQEla' \
    --namespace "$AB_NAMESPACE" \
    --userId 'bP6twYBf' \
    > test.out 2>&1
eval_tap $? 19 'AdminGetMemberActiveSession' test.out

#- 20 AdminReconcileMaxActiveSession
./ng net.accelbyte.sdk.cli.Main session adminReconcileMaxActiveSession \
    --name 'pahXMjHi' \
    --namespace "$AB_NAMESPACE" \
    --body '{"userID": "VlpDMsyG"}' \
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
    --configurationName '6j7h5WqU' \
    --dsPodName 'WOt5oTNz' \
    --fromTime 'sRUMLhOC' \
    --gameMode 'JpxZ6SKO' \
    --isPersistent 'dNvWZvXJ' \
    --isSoftDeleted '3eBD2UpK' \
    --joinability 'KMbQQY7Y' \
    --limit '65' \
    --matchPool 'O4m4GODS' \
    --memberID 'KLxw5SpU' \
    --offset '93' \
    --order 'rKnrlIx5' \
    --orderBy 'DFCW02ui' \
    --sessionID 'kZVy9IGO' \
    --status 'I8B91IzD' \
    --statusV2 'whDOkTOh' \
    --toTime 'jyxvKG6o' \
    > test.out 2>&1
eval_tap $? 23 'AdminQueryGameSessions' test.out

#- 24 AdminQueryGameSessionsByAttributes
./ng net.accelbyte.sdk.cli.Main session adminQueryGameSessionsByAttributes \
    --namespace "$AB_NAMESPACE" \
    --body '{"ndMZqGyT": {}, "CbPZOX1G": {}, "bmsXzbht": {}}' \
    > test.out 2>&1
eval_tap $? 24 'AdminQueryGameSessionsByAttributes' test.out

#- 25 AdminDeleteBulkGameSessions
./ng net.accelbyte.sdk.cli.Main session adminDeleteBulkGameSessions \
    --namespace "$AB_NAMESPACE" \
    --body '{"ids": ["fJoU1ylT", "yKw0KPCj", "yXFQGc9Z"]}' \
    > test.out 2>&1
eval_tap $? 25 'AdminDeleteBulkGameSessions' test.out

#- 26 AdminSetDSReady
./ng net.accelbyte.sdk.cli.Main session adminSetDSReady \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'Od0OL5yt' \
    --body '{"ready": false}' \
    > test.out 2>&1
eval_tap $? 26 'AdminSetDSReady' test.out

#- 27 AdminUpdateGameSessionMember
./ng net.accelbyte.sdk.cli.Main session adminUpdateGameSessionMember \
    --memberId 'mtbm4OGx' \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'G6mJQ0c5' \
    --statusType 'HtDGzI0j' \
    > test.out 2>&1
eval_tap $? 27 'AdminUpdateGameSessionMember' test.out

#- 28 AdminGetListNativeSession
./ng net.accelbyte.sdk.cli.Main session adminGetListNativeSession \
    --namespace "$AB_NAMESPACE" \
    --limit '88' \
    --offset '74' \
    --order 'IRT4kIX5' \
    > test.out 2>&1
eval_tap $? 28 'AdminGetListNativeSession' test.out

#- 29 AdminQueryParties
./ng net.accelbyte.sdk.cli.Main session adminQueryParties \
    --namespace "$AB_NAMESPACE" \
    --isSoftDeleted 'dqmLiFFX' \
    --joinability 'SlRXuOE0' \
    --key 'UiwOFd2T' \
    --leaderID 'Y5C6hEUL' \
    --limit '34' \
    --memberID '6fBEJpdV' \
    --memberStatus 'S7jIibYO' \
    --offset '26' \
    --order 'OEaTdiGo' \
    --orderBy '0EiYyuK8' \
    --partyID '6kigHYlD' \
    --value 'qFHrZAzY' \
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
    --body '{"psn": {"clientId": "jwUGh61K", "clientSecret": "P7VSub0z", "scope": "lkQaIxlL"}}' \
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
    --limit '15' \
    --userId 'CQsBlfiT' \
    > test.out 2>&1
eval_tap $? 33 'AdminGetRecentPlayer' test.out

#- 34 AdminReadSessionStorage
./ng net.accelbyte.sdk.cli.Main session adminReadSessionStorage \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'gUC5ZHWD' \
    > test.out 2>&1
eval_tap $? 34 'AdminReadSessionStorage' test.out

#- 35 AdminDeleteUserSessionStorage
./ng net.accelbyte.sdk.cli.Main session adminDeleteUserSessionStorage \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'PElhzSX4' \
    > test.out 2>&1
eval_tap $? 35 'AdminDeleteUserSessionStorage' test.out

#- 36 AdminReadUserSessionStorage
./ng net.accelbyte.sdk.cli.Main session adminReadUserSessionStorage \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'cEqOHD1r' \
    --userId 'DZMIPzIN' \
    > test.out 2>&1
eval_tap $? 36 'AdminReadUserSessionStorage' test.out

#- 37 AdminQueryPlayerAttributes
./ng net.accelbyte.sdk.cli.Main session adminQueryPlayerAttributes \
    --namespace "$AB_NAMESPACE" \
    --users 'Mt3TbROB' \
    > test.out 2>&1
eval_tap $? 37 'AdminQueryPlayerAttributes' test.out

#- 38 AdminGetPlayerAttributes
./ng net.accelbyte.sdk.cli.Main session adminGetPlayerAttributes \
    --namespace "$AB_NAMESPACE" \
    --userId 'nkE31lxp' \
    > test.out 2>&1
eval_tap $? 38 'AdminGetPlayerAttributes' test.out

#- 39 CreateGameSession
./ng net.accelbyte.sdk.cli.Main session createGameSession \
    --namespace "$AB_NAMESPACE" \
    --body '{"attributes": {"MUjIODLZ": {}, "329cBGqZ": {}, "Q5YedHCN": {}}, "autoJoin": false, "backfillTicketID": "d7kNVUxT", "clientVersion": "daOIzGoW", "configurationName": "esD3rzeo", "deployment": "Rfi28yyv", "dsSource": "ATWn3IBc", "fallbackClaimKeys": ["QQYu7vxC", "IfdMiuJr", "pIKfhzx2"], "inactiveTimeout": 99, "inviteTimeout": 65, "joinability": "Shs6cFCp", "matchPool": "7vI75hVo", "maxPlayers": 41, "minPlayers": 52, "preferredClaimKeys": ["7dgn3h9m", "reTJ1Ans", "st6Ct7K2"], "requestedRegions": ["Ou0LvH2G", "Syc0WDdZ", "tjd8zeVv"], "serverName": "QvdUTbM3", "teams": [{"UserIDs": ["YHwuOVAh", "4HFfDyzy", "lXKDvdrG"], "parties": [{"partyID": "CvjBV1dX", "userIDs": ["Wfwn21nC", "BlYjXkU4", "Ian3GsEU"]}, {"partyID": "ehnc1YF0", "userIDs": ["EFblAtzy", "hNKN4oVI", "1wSlieyb"]}, {"partyID": "OmxA0PW8", "userIDs": ["zxWG4VU3", "gSr2jbcU", "e6E9m7Lo"]}]}, {"UserIDs": ["uCugdlrn", "RmOyhwUs", "6O2LaR2t"], "parties": [{"partyID": "MCJnVwYs", "userIDs": ["yPHAWbG4", "RkjqdEnd", "4pBZuRIs"]}, {"partyID": "gbKSmFU9", "userIDs": ["SlT5sojM", "XFl2NMia", "CdYpMZUp"]}, {"partyID": "93iF0SF0", "userIDs": ["HKLwKTE2", "ddotVK5J", "czKV4Ad2"]}]}, {"UserIDs": ["ODoAuzMq", "FFUbl5XG", "pGUbktiw"], "parties": [{"partyID": "qHZw0O2j", "userIDs": ["x7ZTJfUb", "ZvGEGnfZ", "n7u42geQ"]}, {"partyID": "I88FU6QC", "userIDs": ["77Tsh37O", "Ne9wyOtP", "dy6hnsn3"]}, {"partyID": "LfJeG6a9", "userIDs": ["8RzvmHAc", "iM2nfxOa", "8TOMLmTx"]}]}], "textChat": true, "ticketIDs": ["ig9SPlxQ", "AZhaMhc1", "MjY2hu3I"], "tieTeamsSessionLifetime": true, "type": "FKwDNq3w"}' \
    > test.out 2>&1
eval_tap $? 39 'CreateGameSession' test.out

#- 40 PublicQueryGameSessionsByAttributes
./ng net.accelbyte.sdk.cli.Main session publicQueryGameSessionsByAttributes \
    --namespace "$AB_NAMESPACE" \
    --body '{"GFWdE6EU": {}, "qX2M7Tq9": {}, "RHT2HWlq": {}}' \
    > test.out 2>&1
eval_tap $? 40 'PublicQueryGameSessionsByAttributes' test.out

#- 41 PublicSessionJoinCode
./ng net.accelbyte.sdk.cli.Main session publicSessionJoinCode \
    --namespace "$AB_NAMESPACE" \
    --body '{"code": "7ftXjSdg"}' \
    > test.out 2>&1
eval_tap $? 41 'PublicSessionJoinCode' test.out

#- 42 GetGameSessionByPodName
./ng net.accelbyte.sdk.cli.Main session getGameSessionByPodName \
    --namespace "$AB_NAMESPACE" \
    --podName 'eguCbgbh' \
    > test.out 2>&1
eval_tap $? 42 'GetGameSessionByPodName' test.out

#- 43 GetGameSession
./ng net.accelbyte.sdk.cli.Main session getGameSession \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'EfghcFfe' \
    > test.out 2>&1
eval_tap $? 43 'GetGameSession' test.out

#- 44 UpdateGameSession
./ng net.accelbyte.sdk.cli.Main session updateGameSession \
    --namespace "$AB_NAMESPACE" \
    --sessionId '9c3OYWM4' \
    --body '{"attributes": {"siG4DFUU": {}, "7t0vLE9x": {}, "TScLfiUV": {}}, "backfillTicketID": "NcR9xvNr", "clientVersion": "relvoBQ8", "deployment": "RylmToOA", "fallbackClaimKeys": ["P8apNXXj", "6zRA8SaG", "nB97nhfq"], "inactiveTimeout": 44, "inviteTimeout": 22, "joinability": "ok4PMimq", "matchPool": "oSh1tJSJ", "maxPlayers": 90, "minPlayers": 30, "preferredClaimKeys": ["NFzM4pfK", "qhQuxbtw", "GpjiD5B4"], "requestedRegions": ["2i3hNl3J", "2e6wH5at", "RQ12xrQj"], "teams": [{"UserIDs": ["n7Y3oXrh", "EzgQljJM", "7NqFfn13"], "parties": [{"partyID": "BsEBx8Ex", "userIDs": ["Uq06xulz", "0aDJZkDy", "vE8Kt79B"]}, {"partyID": "ZfST9Anl", "userIDs": ["CaUyfU76", "cQjbJ3zR", "4TxP04bo"]}, {"partyID": "bhIikMc6", "userIDs": ["fkdJi21I", "HnwtVlq8", "20pCJ3t8"]}]}, {"UserIDs": ["5TLwNlZA", "FTR960hr", "GNWkBep6"], "parties": [{"partyID": "4tEixQ3e", "userIDs": ["bpH5Ae3e", "at6uVst3", "HPPvtsqQ"]}, {"partyID": "PI6zHWqg", "userIDs": ["F8REVB2Q", "SWbRDy5i", "RcblMtc8"]}, {"partyID": "IFbkikBd", "userIDs": ["ZhdvZVjf", "LgWsvzmW", "pZxpkfPu"]}]}, {"UserIDs": ["EfIk9iNe", "aPU0CigM", "hsOebQGh"], "parties": [{"partyID": "H7Kzs9bO", "userIDs": ["9TvMHD5M", "wDxyNHcR", "XMlGyyAr"]}, {"partyID": "TFky1eKt", "userIDs": ["O205acp3", "OrZ8MyQI", "CPc3RayL"]}, {"partyID": "AKCVHG9E", "userIDs": ["e0ss2HrJ", "gTwzk4TH", "EMwTwdaW"]}]}], "ticketIDs": ["tWrbqufv", "Zurm2TvF", "ySFxyH6j"], "tieTeamsSessionLifetime": true, "type": "Y9zY8MU0", "version": 43}' \
    > test.out 2>&1
eval_tap $? 44 'UpdateGameSession' test.out

#- 45 DeleteGameSession
./ng net.accelbyte.sdk.cli.Main session deleteGameSession \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'hKa5p2vL' \
    > test.out 2>&1
eval_tap $? 45 'DeleteGameSession' test.out

#- 46 PatchUpdateGameSession
./ng net.accelbyte.sdk.cli.Main session patchUpdateGameSession \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'BA84rcdG' \
    --body '{"attributes": {"NM7q8Hgj": {}, "dDEbstIP": {}, "4lMCxncE": {}}, "backfillTicketID": "KA5XzeBb", "clientVersion": "NBl0HoQj", "deployment": "FE43l70E", "fallbackClaimKeys": ["HX07l1EL", "ProStJe5", "SJeULK5O"], "inactiveTimeout": 86, "inviteTimeout": 11, "joinability": "xBcLvWqg", "matchPool": "S9jfr6vo", "maxPlayers": 80, "minPlayers": 87, "preferredClaimKeys": ["gnIYQFUB", "6sOg6i1S", "7POI3hwC"], "requestedRegions": ["jHaRxwlx", "my3cDlwT", "aETvgcyF"], "teams": [{"UserIDs": ["m1OPEo5c", "lw6Ad1ab", "XPk14EF7"], "parties": [{"partyID": "vM0OQnQO", "userIDs": ["T7gt2ieb", "iAGkshOF", "x1ImLK8j"]}, {"partyID": "bcUzDcAF", "userIDs": ["SoB7MLw0", "GJK9lOno", "Hy5UlWmo"]}, {"partyID": "cPeLoPWe", "userIDs": ["des0kloU", "mcbetW9x", "PsycUsQc"]}]}, {"UserIDs": ["whKxLzEb", "q7JpaVMm", "foPBniR8"], "parties": [{"partyID": "lHbfdejO", "userIDs": ["tSlJy3IJ", "GzylRHFs", "pCat1mhh"]}, {"partyID": "XFY6GuwQ", "userIDs": ["juJmpXVc", "8DXW7EFc", "bCuU2nEm"]}, {"partyID": "YkzV6SYo", "userIDs": ["5CyrCH2T", "esS9CCaS", "Lmat3BLK"]}]}, {"UserIDs": ["g8tDYB1n", "nQ0vxtY6", "kfMZYHfm"], "parties": [{"partyID": "m1q7gt4O", "userIDs": ["y1K5IvWE", "jyZ0VWwG", "ivNijDhM"]}, {"partyID": "Tc6Q2iP6", "userIDs": ["DeHMDPj2", "Bo64zEo6", "XXVYwFiM"]}, {"partyID": "reXDqnHU", "userIDs": ["c9gy2K2V", "TL57wCmC", "57iJk1Jt"]}]}], "ticketIDs": ["FYBqBbJ2", "7dSafKkH", "8BZXBAe8"], "tieTeamsSessionLifetime": false, "type": "ZhzZMeuB", "version": 72}' \
    > test.out 2>&1
eval_tap $? 46 'PatchUpdateGameSession' test.out

#- 47 UpdateGameSessionBackfillTicketID
./ng net.accelbyte.sdk.cli.Main session updateGameSessionBackfillTicketID \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'KU3YT73P' \
    --body '{"backfillTicketID": "TYixOnfT"}' \
    > test.out 2>&1
eval_tap $? 47 'UpdateGameSessionBackfillTicketID' test.out

#- 48 GameSessionGenerateCode
./ng net.accelbyte.sdk.cli.Main session gameSessionGenerateCode \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'y1ASzhE1' \
    > test.out 2>&1
eval_tap $? 48 'GameSessionGenerateCode' test.out

#- 49 PublicRevokeGameSessionCode
./ng net.accelbyte.sdk.cli.Main session publicRevokeGameSessionCode \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'iE6WE0EK' \
    > test.out 2>&1
eval_tap $? 49 'PublicRevokeGameSessionCode' test.out

#- 50 PublicGameSessionInvite
./ng net.accelbyte.sdk.cli.Main session publicGameSessionInvite \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'WhrdnKbg' \
    --body '{"platformID": "h0Q78Qlb", "userID": "yqc6omXt"}' \
    > test.out 2>&1
eval_tap $? 50 'PublicGameSessionInvite' test.out

#- 51 JoinGameSession
./ng net.accelbyte.sdk.cli.Main session joinGameSession \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'ndfGucoX' \
    > test.out 2>&1
eval_tap $? 51 'JoinGameSession' test.out

#- 52 PublicPromoteGameSessionLeader
./ng net.accelbyte.sdk.cli.Main session publicPromoteGameSessionLeader \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'smAi3XLP' \
    --body '{"leaderID": "WBLg1AQm"}' \
    > test.out 2>&1
eval_tap $? 52 'PublicPromoteGameSessionLeader' test.out

#- 53 LeaveGameSession
./ng net.accelbyte.sdk.cli.Main session leaveGameSession \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'R3qohp5N' \
    > test.out 2>&1
eval_tap $? 53 'LeaveGameSession' test.out

#- 54 PublicGameSessionReject
./ng net.accelbyte.sdk.cli.Main session publicGameSessionReject \
    --namespace "$AB_NAMESPACE" \
    --sessionId '0NBUyTy1' \
    > test.out 2>&1
eval_tap $? 54 'PublicGameSessionReject' test.out

#- 55 GetSessionServerSecret
./ng net.accelbyte.sdk.cli.Main session getSessionServerSecret \
    --namespace "$AB_NAMESPACE" \
    --sessionId '3NoFKObB' \
    > test.out 2>&1
eval_tap $? 55 'GetSessionServerSecret' test.out

#- 56 AppendTeamGameSession
./ng net.accelbyte.sdk.cli.Main session appendTeamGameSession \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'aB4FujIu' \
    --body '{"additionalMembers": [{"partyID": "iznf9D2f", "userIDs": ["mqh8XdUN", "CW3k5GVc", "01ePVsXq"]}, {"partyID": "2ttM934T", "userIDs": ["25cBVA96", "x318Z2Qw", "Q2Lv41P5"]}, {"partyID": "rZfM1sd1", "userIDs": ["kTRW5WT7", "qXziaVwT", "HIj5BOGj"]}], "proposedTeams": [{"UserIDs": ["Ugk90YQk", "7i8QXyYR", "u2k7iznA"], "parties": [{"partyID": "035pvUJd", "userIDs": ["u0yz4VRO", "d24SLw0n", "8wndJQHz"]}, {"partyID": "62AM7bHz", "userIDs": ["BtGWsSZK", "aXppo94m", "JbpEg5Fq"]}, {"partyID": "aJIKQh8r", "userIDs": ["LgmeG4Br", "nbJGPfs2", "2NrNkcXA"]}]}, {"UserIDs": ["594Iz0df", "DeBcuhn1", "ruryM0ht"], "parties": [{"partyID": "KiUTllXe", "userIDs": ["3vFPegOw", "4j8yWmWY", "CfsZYE38"]}, {"partyID": "1MxLc5Ng", "userIDs": ["NbFHH84c", "8U7Dtqo0", "AYdAx2KR"]}, {"partyID": "MGjo3TFh", "userIDs": ["zTl0EadE", "PXaLzMeN", "fFC4lyjJ"]}]}, {"UserIDs": ["HGRumnjb", "r9UyQ28y", "V70ThpKI"], "parties": [{"partyID": "PlnE8CGs", "userIDs": ["1GzHwKCM", "UvaQB4Bj", "aGQfoZfq"]}, {"partyID": "NAtPrDXG", "userIDs": ["r57P0Atg", "VthHmLBP", "isoQJA48"]}, {"partyID": "0SQY84xi", "userIDs": ["ejJrAlAI", "ns33A9UO", "BJKxlD72"]}]}], "version": 55}' \
    > test.out 2>&1
eval_tap $? 56 'AppendTeamGameSession' test.out

#- 57 PublicPartyJoinCode
./ng net.accelbyte.sdk.cli.Main session publicPartyJoinCode \
    --namespace "$AB_NAMESPACE" \
    --body '{"code": "rYovUdeZ"}' \
    > test.out 2>&1
eval_tap $? 57 'PublicPartyJoinCode' test.out

#- 58 PublicGetParty
./ng net.accelbyte.sdk.cli.Main session publicGetParty \
    --namespace "$AB_NAMESPACE" \
    --partyId 'H5Ox2y31' \
    > test.out 2>&1
eval_tap $? 58 'PublicGetParty' test.out

#- 59 PublicUpdateParty
./ng net.accelbyte.sdk.cli.Main session publicUpdateParty \
    --namespace "$AB_NAMESPACE" \
    --partyId 'QFwo8mzc' \
    --body '{"attributes": {"gXB5yf6B": {}, "phoZUE5n": {}, "yXBHLSTz": {}}, "inactiveTimeout": 60, "inviteTimeout": 39, "joinability": "TmkGV7ji", "maxPlayers": 35, "minPlayers": 51, "type": "a2ZiJ5Az", "version": 19}' \
    > test.out 2>&1
eval_tap $? 59 'PublicUpdateParty' test.out

#- 60 PublicPatchUpdateParty
./ng net.accelbyte.sdk.cli.Main session publicPatchUpdateParty \
    --namespace "$AB_NAMESPACE" \
    --partyId 'ZN22bWu6' \
    --body '{"attributes": {"jqoENza6": {}, "kRdgGaLi": {}, "xDpcGMpz": {}}, "inactiveTimeout": 99, "inviteTimeout": 49, "joinability": "NiIQRpjM", "maxPlayers": 0, "minPlayers": 100, "type": "cP12PTNn", "version": 89}' \
    > test.out 2>&1
eval_tap $? 60 'PublicPatchUpdateParty' test.out

#- 61 PublicGeneratePartyCode
./ng net.accelbyte.sdk.cli.Main session publicGeneratePartyCode \
    --namespace "$AB_NAMESPACE" \
    --partyId 'FKOXtZPC' \
    > test.out 2>&1
eval_tap $? 61 'PublicGeneratePartyCode' test.out

#- 62 PublicRevokePartyCode
./ng net.accelbyte.sdk.cli.Main session publicRevokePartyCode \
    --namespace "$AB_NAMESPACE" \
    --partyId 'VAIgpOPs' \
    > test.out 2>&1
eval_tap $? 62 'PublicRevokePartyCode' test.out

#- 63 PublicPartyInvite
./ng net.accelbyte.sdk.cli.Main session publicPartyInvite \
    --namespace "$AB_NAMESPACE" \
    --partyId 'gl63XpUS' \
    --body '{"platformID": "nEOiRv5M", "userID": "pmdjiDOS"}' \
    > test.out 2>&1
eval_tap $? 63 'PublicPartyInvite' test.out

#- 64 PublicPromotePartyLeader
./ng net.accelbyte.sdk.cli.Main session publicPromotePartyLeader \
    --namespace "$AB_NAMESPACE" \
    --partyId 'WYGTTTr5' \
    --body '{"leaderID": "rMMZ4yq6"}' \
    > test.out 2>&1
eval_tap $? 64 'PublicPromotePartyLeader' test.out

#- 65 PublicPartyJoin
./ng net.accelbyte.sdk.cli.Main session publicPartyJoin \
    --namespace "$AB_NAMESPACE" \
    --partyId 'DJQRsr7V' \
    > test.out 2>&1
eval_tap $? 65 'PublicPartyJoin' test.out

#- 66 PublicPartyLeave
./ng net.accelbyte.sdk.cli.Main session publicPartyLeave \
    --namespace "$AB_NAMESPACE" \
    --partyId 'Xywd4MTf' \
    > test.out 2>&1
eval_tap $? 66 'PublicPartyLeave' test.out

#- 67 PublicPartyReject
./ng net.accelbyte.sdk.cli.Main session publicPartyReject \
    --namespace "$AB_NAMESPACE" \
    --partyId '6TIOTyDd' \
    > test.out 2>&1
eval_tap $? 67 'PublicPartyReject' test.out

#- 68 PublicPartyKick
./ng net.accelbyte.sdk.cli.Main session publicPartyKick \
    --namespace "$AB_NAMESPACE" \
    --partyId 'LRlK9aVM' \
    --userId '0KFuENcl' \
    > test.out 2>&1
eval_tap $? 68 'PublicPartyKick' test.out

#- 69 PublicCreateParty
./ng net.accelbyte.sdk.cli.Main session publicCreateParty \
    --namespace "$AB_NAMESPACE" \
    --body '{"attributes": {"JbB3Nexd": {}, "vHVhoe1j": {}, "DdtK266B": {}}, "configurationName": "Z3KerelU", "inactiveTimeout": 21, "inviteTimeout": 29, "joinability": "mQVU62tr", "maxPlayers": 2, "members": [{"ID": "mlyN4eBI", "PlatformID": "B9idx3Rp", "PlatformUserID": "dnUdjJOy"}, {"ID": "0pa1TVQP", "PlatformID": "AnU6NU1e", "PlatformUserID": "TrLCiC3e"}, {"ID": "L6EkFVcB", "PlatformID": "JaH4b51J", "PlatformUserID": "jSfEzfGN"}], "minPlayers": 4, "textChat": false, "type": "CVu8WMfx"}' \
    > test.out 2>&1
eval_tap $? 69 'PublicCreateParty' test.out

#- 70 PublicGetRecentPlayer
./ng net.accelbyte.sdk.cli.Main session publicGetRecentPlayer \
    --namespace "$AB_NAMESPACE" \
    --limit '60' \
    > test.out 2>&1
eval_tap $? 70 'PublicGetRecentPlayer' test.out

#- 71 PublicUpdateInsertSessionStorageLeader
./ng net.accelbyte.sdk.cli.Main session publicUpdateInsertSessionStorageLeader \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'FjAsqvZB' \
    --body '{"JOsmMEPJ": {}, "TvkNW62K": {}, "Sv2c7mTk": {}}' \
    > test.out 2>&1
eval_tap $? 71 'PublicUpdateInsertSessionStorageLeader' test.out

#- 72 PublicUpdateInsertSessionStorage
./ng net.accelbyte.sdk.cli.Main session publicUpdateInsertSessionStorage \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'FNErz007' \
    --userId 'zb4KIxaD' \
    --body '{"smiwvK4E": {}, "1iO7c8Ai": {}, "n5Y5kJmu": {}}' \
    > test.out 2>&1
eval_tap $? 72 'PublicUpdateInsertSessionStorage' test.out

#- 73 PublicGetBulkPlayerCurrentPlatform
./ng net.accelbyte.sdk.cli.Main session publicGetBulkPlayerCurrentPlatform \
    --namespace "$AB_NAMESPACE" \
    --body '{"userIDs": ["K1snNhxI", "box3UZnW", "TpdKKyNi"]}' \
    > test.out 2>&1
eval_tap $? 73 'PublicGetBulkPlayerCurrentPlatform' test.out

#- 74 PublicGetPlayerAttributes
./ng net.accelbyte.sdk.cli.Main session publicGetPlayerAttributes \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 74 'PublicGetPlayerAttributes' test.out

#- 75 PublicStorePlayerAttributes
./ng net.accelbyte.sdk.cli.Main session publicStorePlayerAttributes \
    --namespace "$AB_NAMESPACE" \
    --body '{"crossplayEnabled": true, "currentPlatform": "bQhZLHq6", "data": {"NILiq0r5": {}, "hJPD211U": {}, "Ulmn00EI": {}}, "platforms": [{"name": "slrswwf9", "userID": "4a1hVKrE"}, {"name": "440Os260", "userID": "2YXWwTOY"}, {"name": "BYJ9aGWf", "userID": "bZwUlYnk"}], "roles": ["mnmnjDgK", "ObZafWiy", "f6HIgMrF"], "simultaneousPlatform": "0CtqmtII"}' \
    > test.out 2>&1
eval_tap $? 75 'PublicStorePlayerAttributes' test.out

#- 76 PublicDeletePlayerAttributes
./ng net.accelbyte.sdk.cli.Main session publicDeletePlayerAttributes \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 76 'PublicDeletePlayerAttributes' test.out

#- 77 PublicQueryMyGameSessions
./ng net.accelbyte.sdk.cli.Main session publicQueryMyGameSessions \
    --namespace "$AB_NAMESPACE" \
    --order 'mAoMhc11' \
    --orderBy 'n1xz8I8n' \
    --status 'Jkf0T7E9' \
    > test.out 2>&1
eval_tap $? 77 'PublicQueryMyGameSessions' test.out

#- 78 PublicQueryMyParties
./ng net.accelbyte.sdk.cli.Main session publicQueryMyParties \
    --namespace "$AB_NAMESPACE" \
    --order 'yCVeaXOL' \
    --orderBy 'LtomYoAS' \
    --status 'bDizec99' \
    > test.out 2>&1
eval_tap $? 78 'PublicQueryMyParties' test.out


rm -f "tmp.dat"

exit $EXIT_CODE