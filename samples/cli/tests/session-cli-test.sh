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
    --body '{"regionRetryMapping": {"RytUp13Q": ["um8xmzxq", "U1fEaoSN", "mjGZLUW7"], "c6QSlUWZ": ["vm46sOoC", "IN517Yya", "PPmCRIw0"], "UcxP5Zbk": ["Lz8ZGoAv", "9yu0nKvz", "zDZbTWDu"]}, "regionURLMapping": ["TkXf3HvT", "yQEXVWfF", "PfYhDzqs"], "testGameMode": "5tfxXD3N", "testRegionURLMapping": ["c3SurZVO", "81z7LwQu", "9yA4FP2z"], "testTargetUserIDs": ["D6IqIgSC", "WBJer31l", "Tzq0aKdK"]}' \
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
    --body '{"durationDays": 12}' \
    > test.out 2>&1
eval_tap $? 10 'AdminUpdateConfigurationAlertV1' test.out

#- 11 AdminCreateConfigurationAlertV1
./ng net.accelbyte.sdk.cli.Main session adminCreateConfigurationAlertV1 \
    --namespace "$AB_NAMESPACE" \
    --body '{"durationDays": 78}' \
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
    --description 'Xv464Vzq' \
    --certname 'FWXyOHKs' \
    --file 'tmp.dat' \
    --password 'MgTVcIf5' \
    > test.out 2>&1
eval_tap $? 13 'HandleUploadXboxPFXCertificate' test.out

#- 14 AdminCreateConfigurationTemplateV1
./ng net.accelbyte.sdk.cli.Main session adminCreateConfigurationTemplateV1 \
    --namespace "$AB_NAMESPACE" \
    --body '{"NativeSessionSetting": {"PSNServiceLabel": 53, "PSNSupportedPlatforms": ["ZgCC2pDt", "0gehdJtz", "OVcHgkQf"], "SessionTitle": "324i7tb9", "ShouldSync": true, "XboxAllowCrossPlatform": true, "XboxSandboxID": "1kOxTYjY", "XboxServiceConfigID": "c9qCKqid", "XboxSessionTemplateName": "p5fxqIVv", "XboxTitleID": "xt6sEXen", "localizedSessionName": {"3MrHfqkF": {}, "K8F4G9RK": {}, "KQSG687l": {}}}, "PSNBaseUrl": "9Q6zur7i", "attributes": {"oqtRvGqu": {}, "8pHkHXtf": {}, "d6nhDyvK": {}}, "autoJoin": false, "clientVersion": "zhdLHAqT", "deployment": "BBCvkemK", "disableCodeGeneration": false, "dsManualSetReady": true, "dsSource": "6E8xxgxg", "enableSecret": false, "fallbackClaimKeys": ["fOp3sUFA", "iPUX1ifX", "5YV1B6DI"], "immutableStorage": true, "inactiveTimeout": 8, "inviteTimeout": 5, "joinability": "R4wMtP5n", "leaderElectionGracePeriod": 18, "maxActiveSessions": 67, "maxPlayers": 10, "minPlayers": 52, "name": "8WF0518M", "persistent": true, "preferredClaimKeys": ["Vooef4eM", "aLFX7DbD", "lxhk8Wy4"], "requestedRegions": ["5OEwRSnQ", "JiuTmJPE", "GeB7QuUg"], "textChat": false, "tieTeamsSessionLifetime": false, "type": "Bt23HAe8"}' \
    > test.out 2>&1
eval_tap $? 14 'AdminCreateConfigurationTemplateV1' test.out

#- 15 AdminGetAllConfigurationTemplatesV1
./ng net.accelbyte.sdk.cli.Main session adminGetAllConfigurationTemplatesV1 \
    --namespace "$AB_NAMESPACE" \
    --limit '18' \
    --name 'm6QAfkla' \
    --offset '85' \
    --order 'dtLUFkZF' \
    --orderBy 'iw6cC03W' \
    > test.out 2>&1
eval_tap $? 15 'AdminGetAllConfigurationTemplatesV1' test.out

#- 16 AdminGetConfigurationTemplateV1
./ng net.accelbyte.sdk.cli.Main session adminGetConfigurationTemplateV1 \
    --name 'j2CknQKo' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 16 'AdminGetConfigurationTemplateV1' test.out

#- 17 AdminUpdateConfigurationTemplateV1
./ng net.accelbyte.sdk.cli.Main session adminUpdateConfigurationTemplateV1 \
    --name 'djWp2CAm' \
    --namespace "$AB_NAMESPACE" \
    --body '{"NativeSessionSetting": {"PSNServiceLabel": 8, "PSNSupportedPlatforms": ["0OCFdgbn", "wqpomDFE", "D23ZoMZv"], "SessionTitle": "zC9AfInx", "ShouldSync": false, "XboxAllowCrossPlatform": false, "XboxSandboxID": "te4Un3TY", "XboxServiceConfigID": "9C8ICWxI", "XboxSessionTemplateName": "8nhIkwy6", "XboxTitleID": "PxF3djnO", "localizedSessionName": {"C7loHKyP": {}, "dmIacuQB": {}, "xQ8kxJHu": {}}}, "PSNBaseUrl": "pDwE5IuU", "attributes": {"GKSQyS6l": {}, "snC0XSZt": {}, "9bfg2bSy": {}}, "autoJoin": false, "clientVersion": "lJgTB7Gj", "deployment": "WBdRsKRa", "disableCodeGeneration": true, "dsManualSetReady": true, "dsSource": "yDcXjXGI", "enableSecret": false, "fallbackClaimKeys": ["owcGWsKM", "FjoYE9Gw", "VsIjfQlF"], "immutableStorage": true, "inactiveTimeout": 73, "inviteTimeout": 58, "joinability": "Jenc80a2", "leaderElectionGracePeriod": 34, "maxActiveSessions": 54, "maxPlayers": 86, "minPlayers": 59, "name": "WZ86ZoCO", "persistent": false, "preferredClaimKeys": ["3Rsm6piR", "d6EMpkcE", "yqipefgD"], "requestedRegions": ["HhVBISs2", "dhqsKVsn", "cevdtw8m"], "textChat": true, "tieTeamsSessionLifetime": true, "type": "IPsDrcqk"}' \
    > test.out 2>&1
eval_tap $? 17 'AdminUpdateConfigurationTemplateV1' test.out

#- 18 AdminDeleteConfigurationTemplateV1
./ng net.accelbyte.sdk.cli.Main session adminDeleteConfigurationTemplateV1 \
    --name 'lipvT3jt' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 18 'AdminDeleteConfigurationTemplateV1' test.out

#- 19 AdminGetMemberActiveSession
./ng net.accelbyte.sdk.cli.Main session adminGetMemberActiveSession \
    --name 'Za7xkMKs' \
    --namespace "$AB_NAMESPACE" \
    --userId 'RDWAEXQg' \
    > test.out 2>&1
eval_tap $? 19 'AdminGetMemberActiveSession' test.out

#- 20 AdminReconcileMaxActiveSession
./ng net.accelbyte.sdk.cli.Main session adminReconcileMaxActiveSession \
    --name '6nH6KDpc' \
    --namespace "$AB_NAMESPACE" \
    --body '{"userID": "RCY0B1kD"}' \
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
    --configurationName '4QoHNLvn' \
    --dsPodName 'fva1EFEB' \
    --fromTime 'xtLUkhXL' \
    --gameMode 'SodrNump' \
    --isPersistent 'puuwks8i' \
    --isSoftDeleted 'yGz8c4SE' \
    --joinability '7LTVoVpH' \
    --limit '62' \
    --matchPool 'uNucvHIC' \
    --memberID 'L8FYu9Ma' \
    --offset '82' \
    --order 'xAXifqcc' \
    --orderBy 'M2HHqV2t' \
    --sessionID 'Ur9qnoVQ' \
    --status '1U8INJWe' \
    --statusV2 'N0eLS5sB' \
    --toTime 'nnh56Pgv' \
    > test.out 2>&1
eval_tap $? 23 'AdminQueryGameSessions' test.out

#- 24 AdminQueryGameSessionsByAttributes
./ng net.accelbyte.sdk.cli.Main session adminQueryGameSessionsByAttributes \
    --namespace "$AB_NAMESPACE" \
    --body '{"RkgG48UE": {}, "B8Ip9HZm": {}, "t2UWlzLi": {}}' \
    > test.out 2>&1
eval_tap $? 24 'AdminQueryGameSessionsByAttributes' test.out

#- 25 AdminDeleteBulkGameSessions
./ng net.accelbyte.sdk.cli.Main session adminDeleteBulkGameSessions \
    --namespace "$AB_NAMESPACE" \
    --body '{"ids": ["hl5tl0iq", "YZpkKu90", "CAIX7mwe"]}' \
    > test.out 2>&1
eval_tap $? 25 'AdminDeleteBulkGameSessions' test.out

#- 26 AdminSetDSReady
./ng net.accelbyte.sdk.cli.Main session adminSetDSReady \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'SAQUPcfM' \
    --body '{"ready": false}' \
    > test.out 2>&1
eval_tap $? 26 'AdminSetDSReady' test.out

#- 27 AdminUpdateGameSessionMember
./ng net.accelbyte.sdk.cli.Main session adminUpdateGameSessionMember \
    --memberId '6hj1Jksm' \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'hmY2cDB9' \
    --statusType 'ZmmWZ9wy' \
    > test.out 2>&1
eval_tap $? 27 'AdminUpdateGameSessionMember' test.out

#- 28 AdminGetListNativeSession
./ng net.accelbyte.sdk.cli.Main session adminGetListNativeSession \
    --namespace "$AB_NAMESPACE" \
    --limit '64' \
    --offset '29' \
    --order 'Qerp9jID' \
    > test.out 2>&1
eval_tap $? 28 'AdminGetListNativeSession' test.out

#- 29 AdminQueryParties
./ng net.accelbyte.sdk.cli.Main session adminQueryParties \
    --namespace "$AB_NAMESPACE" \
    --joinability 'unCbtCdI' \
    --key 'ufIdSMly' \
    --leaderID 'aEcwydrD' \
    --limit '95' \
    --memberID 'AZ3u5eIo' \
    --memberStatus 'RztOCNSg' \
    --offset '68' \
    --order 'iGryyxDk' \
    --orderBy 'krlOcXWE' \
    --partyID '7E63NNtt' \
    --value 'eqlX3KlE' \
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
    --body '{"psn": {"clientId": "Y1i5CNVm", "clientSecret": "34Yrfufb", "scope": "goXlVLrn"}}' \
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
    --sessionId '06y2X1zt' \
    > test.out 2>&1
eval_tap $? 33 'AdminReadSessionStorage' test.out

#- 34 AdminDeleteUserSessionStorage
./ng net.accelbyte.sdk.cli.Main session adminDeleteUserSessionStorage \
    --namespace "$AB_NAMESPACE" \
    --sessionId '2RHNY3YL' \
    > test.out 2>&1
eval_tap $? 34 'AdminDeleteUserSessionStorage' test.out

#- 35 AdminReadUserSessionStorage
./ng net.accelbyte.sdk.cli.Main session adminReadUserSessionStorage \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'II3l1kJd' \
    --userId '4KxPVb59' \
    > test.out 2>&1
eval_tap $? 35 'AdminReadUserSessionStorage' test.out

#- 36 AdminQueryPlayerAttributes
./ng net.accelbyte.sdk.cli.Main session adminQueryPlayerAttributes \
    --namespace "$AB_NAMESPACE" \
    --users 'WSJTYsYX' \
    > test.out 2>&1
eval_tap $? 36 'AdminQueryPlayerAttributes' test.out

#- 37 AdminGetPlayerAttributes
./ng net.accelbyte.sdk.cli.Main session adminGetPlayerAttributes \
    --namespace "$AB_NAMESPACE" \
    --userId 'nVGvR2DC' \
    > test.out 2>&1
eval_tap $? 37 'AdminGetPlayerAttributes' test.out

#- 38 CreateGameSession
./ng net.accelbyte.sdk.cli.Main session createGameSession \
    --namespace "$AB_NAMESPACE" \
    --body '{"attributes": {"3nFiqqwC": {}, "f6U1eRqN": {}, "O4se33xO": {}}, "autoJoin": true, "backfillTicketID": "HrOZ3zGO", "clientVersion": "XZHtMknC", "configurationName": "CLb2L4XQ", "deployment": "9LTqIwYT", "dsSource": "VOFdNr5g", "fallbackClaimKeys": ["7VHrLrZK", "gmLfBnCy", "l8kOM6al"], "inactiveTimeout": 96, "inviteTimeout": 27, "joinability": "60T2CS3m", "matchPool": "mKFtNHqx", "maxPlayers": 50, "minPlayers": 29, "preferredClaimKeys": ["iyyHhFMe", "zRrYEfGn", "z4Ox3Vhf"], "requestedRegions": ["fJrpotG4", "1m5NZjVD", "38LwBz99"], "serverName": "8zbHkww3", "teams": [{"UserIDs": ["xbOxCenz", "GCMiLGBg", "31KnGkvN"], "parties": [{"partyID": "Jk85YceH", "userIDs": ["Waw3TK3M", "7pcXSgqz", "SSY788zt"]}, {"partyID": "EtKHQz65", "userIDs": ["wORwFhyo", "apcQPTrU", "Y6dKpIXY"]}, {"partyID": "9arEpFlp", "userIDs": ["oV8eZJhG", "6TpOQ6RL", "kjvOTXtT"]}]}, {"UserIDs": ["y5qkdtz2", "PFaY3hkx", "7xZIr24v"], "parties": [{"partyID": "U9LftKNT", "userIDs": ["qxblWHiV", "E4DDK74c", "zey5ZUzW"]}, {"partyID": "xHpcI81S", "userIDs": ["ol7SyLt5", "VyKFsyh2", "Q9oAZzE1"]}, {"partyID": "tgFCpvkN", "userIDs": ["STAvkFcg", "J7lqlijN", "IBnfphOc"]}]}, {"UserIDs": ["WdMaIvY5", "iCqubib6", "l8BRVAyh"], "parties": [{"partyID": "DTiuXAta", "userIDs": ["6AoRXxUJ", "EeCQXFpW", "86PPLztu"]}, {"partyID": "LtgjsMa8", "userIDs": ["1QvQdFD2", "ADwHwzKw", "1aeYKYcY"]}, {"partyID": "mYz954oi", "userIDs": ["ZPuWSZXt", "XAiTH9mL", "4SwNoEhX"]}]}], "textChat": false, "ticketIDs": ["47etow5U", "Ji9URuaB", "kYTOjwb6"], "tieTeamsSessionLifetime": false, "type": "OkS0Vr28"}' \
    > test.out 2>&1
eval_tap $? 38 'CreateGameSession' test.out

#- 39 PublicQueryGameSessionsByAttributes
./ng net.accelbyte.sdk.cli.Main session publicQueryGameSessionsByAttributes \
    --namespace "$AB_NAMESPACE" \
    --body '{"1DifA28b": {}, "5zRO34am": {}, "4AOWPY7J": {}}' \
    > test.out 2>&1
eval_tap $? 39 'PublicQueryGameSessionsByAttributes' test.out

#- 40 PublicSessionJoinCode
./ng net.accelbyte.sdk.cli.Main session publicSessionJoinCode \
    --namespace "$AB_NAMESPACE" \
    --body '{"code": "k9ua6VGe"}' \
    > test.out 2>&1
eval_tap $? 40 'PublicSessionJoinCode' test.out

#- 41 GetGameSessionByPodName
./ng net.accelbyte.sdk.cli.Main session getGameSessionByPodName \
    --namespace "$AB_NAMESPACE" \
    --podName '5YPUERZU' \
    > test.out 2>&1
eval_tap $? 41 'GetGameSessionByPodName' test.out

#- 42 GetGameSession
./ng net.accelbyte.sdk.cli.Main session getGameSession \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'ZU1adRGf' \
    > test.out 2>&1
eval_tap $? 42 'GetGameSession' test.out

#- 43 UpdateGameSession
./ng net.accelbyte.sdk.cli.Main session updateGameSession \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'R3sQTbcB' \
    --body '{"attributes": {"HKXwQ4DF": {}, "GlaId0gJ": {}, "eKUouV1s": {}}, "backfillTicketID": "pmdOVqJP", "clientVersion": "nBWRfl51", "deployment": "AE6toTlV", "fallbackClaimKeys": ["uKvz2InA", "u50jpJ8j", "14V8nq2G"], "inactiveTimeout": 70, "inviteTimeout": 88, "joinability": "zYaO3j88", "matchPool": "l3MF2PMj", "maxPlayers": 72, "minPlayers": 81, "preferredClaimKeys": ["diSM1U5t", "H3vHI2cP", "BeK2u9Ac"], "requestedRegions": ["rrmpsoB2", "dHNIYWQT", "IMWT2BM2"], "teams": [{"UserIDs": ["Ms4pyKAE", "kHt3JelG", "RpaUox5l"], "parties": [{"partyID": "IabZoGrg", "userIDs": ["pKQf8XKD", "2GUvpD4W", "teJLBltc"]}, {"partyID": "rrSd3kgx", "userIDs": ["nLEyuOXd", "G29AoZzJ", "N9DXLqXU"]}, {"partyID": "bO7tOie4", "userIDs": ["cewG3SbL", "tStAwhIx", "oBCGRLiv"]}]}, {"UserIDs": ["eUfEVEPJ", "FHxjKsli", "vybeodTI"], "parties": [{"partyID": "HO4c9SSw", "userIDs": ["f9Dz9rED", "XUHTIfFX", "2GyuuCQZ"]}, {"partyID": "nfWeBFdY", "userIDs": ["eO6660xi", "px5oC3f0", "hnIk6xHV"]}, {"partyID": "skG0mhvS", "userIDs": ["XeigaOUt", "xb6oalhT", "7qKBuAF7"]}]}, {"UserIDs": ["THjpYgl1", "fLKuqi7s", "LMcENmNQ"], "parties": [{"partyID": "T9tEL3TW", "userIDs": ["F39j2Ik7", "aaFhdQSh", "JUYSwz7o"]}, {"partyID": "d3cGaqn6", "userIDs": ["BYJTYOGv", "T163uqUh", "1V1CmaMz"]}, {"partyID": "fzgW87zJ", "userIDs": ["J62iHr3B", "ilTcuhrx", "S12nSAF7"]}]}], "ticketIDs": ["WJ8xQBdG", "ozEsU0Oa", "kBaUHk4P"], "tieTeamsSessionLifetime": false, "type": "WSe9r0Ir", "version": 15}' \
    > test.out 2>&1
eval_tap $? 43 'UpdateGameSession' test.out

#- 44 DeleteGameSession
./ng net.accelbyte.sdk.cli.Main session deleteGameSession \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'hR5HgXkJ' \
    > test.out 2>&1
eval_tap $? 44 'DeleteGameSession' test.out

#- 45 PatchUpdateGameSession
./ng net.accelbyte.sdk.cli.Main session patchUpdateGameSession \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'mkzBbUYx' \
    --body '{"attributes": {"as5r9mRa": {}, "zIl9pYiQ": {}, "jBMxHLeT": {}}, "backfillTicketID": "vby2guF6", "clientVersion": "inZAeRlu", "deployment": "naQ7CPko", "fallbackClaimKeys": ["jn2j3x5t", "X8RZUG3B", "1yazIuCN"], "inactiveTimeout": 32, "inviteTimeout": 77, "joinability": "Y6MSt5hj", "matchPool": "xTlJW6Tg", "maxPlayers": 30, "minPlayers": 87, "preferredClaimKeys": ["OmeTLXti", "dnt8mXRP", "BgvA8NTT"], "requestedRegions": ["KNnkTahB", "1EIRRaG7", "j5d9R4Gs"], "teams": [{"UserIDs": ["aSpnlKUL", "RdBoGczK", "iiYl1OWm"], "parties": [{"partyID": "rUF5Hmmk", "userIDs": ["1BHCDnfl", "MMNcuwT6", "bv6DKupC"]}, {"partyID": "LebSszNO", "userIDs": ["f5xi7it6", "LgwFwMl6", "ZkPduezE"]}, {"partyID": "jAqbJs8L", "userIDs": ["XOkM3AJY", "EMFUpuBn", "SX3jzAai"]}]}, {"UserIDs": ["zHYqNKDj", "ds2eKmu0", "DCoXKOzD"], "parties": [{"partyID": "DteHQL2B", "userIDs": ["w8YFgYP1", "7OgXDAie", "p6YehAGd"]}, {"partyID": "XNpJjfxc", "userIDs": ["yGKx8XMX", "UE3HkvBr", "OIvgUgyV"]}, {"partyID": "J2ZLdcHi", "userIDs": ["VHuSLFnP", "x6iEmifd", "D0DIpsWO"]}]}, {"UserIDs": ["guYAjaU4", "VKcoNDgJ", "dPIBdudV"], "parties": [{"partyID": "Ysh2g2BK", "userIDs": ["dTWtDGXf", "yPY6BJgy", "Msvaf4Jp"]}, {"partyID": "rZ5lkRNH", "userIDs": ["JWplNeXw", "YUhPSxdk", "pN6cmX4Z"]}, {"partyID": "AVAKHtii", "userIDs": ["q7bQ5Fqj", "ZRcm7aDJ", "QmXu49cR"]}]}], "ticketIDs": ["gixY5cr6", "aPjQQYp3", "rrrfxIZe"], "tieTeamsSessionLifetime": true, "type": "oQ9QSf7B", "version": 3}' \
    > test.out 2>&1
eval_tap $? 45 'PatchUpdateGameSession' test.out

#- 46 UpdateGameSessionBackfillTicketID
./ng net.accelbyte.sdk.cli.Main session updateGameSessionBackfillTicketID \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'MmWLRzwg' \
    --body '{"backfillTicketID": "8upRkjEh"}' \
    > test.out 2>&1
eval_tap $? 46 'UpdateGameSessionBackfillTicketID' test.out

#- 47 GameSessionGenerateCode
./ng net.accelbyte.sdk.cli.Main session gameSessionGenerateCode \
    --namespace "$AB_NAMESPACE" \
    --sessionId '6pLs7P23' \
    > test.out 2>&1
eval_tap $? 47 'GameSessionGenerateCode' test.out

#- 48 PublicRevokeGameSessionCode
./ng net.accelbyte.sdk.cli.Main session publicRevokeGameSessionCode \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'hmPDwKa9' \
    > test.out 2>&1
eval_tap $? 48 'PublicRevokeGameSessionCode' test.out

#- 49 PublicGameSessionInvite
./ng net.accelbyte.sdk.cli.Main session publicGameSessionInvite \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'cIh5HxXf' \
    --body '{"platformID": "QeufGba0", "userID": "aE18da1I"}' \
    > test.out 2>&1
eval_tap $? 49 'PublicGameSessionInvite' test.out

#- 50 JoinGameSession
./ng net.accelbyte.sdk.cli.Main session joinGameSession \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'v4Se2OxZ' \
    > test.out 2>&1
eval_tap $? 50 'JoinGameSession' test.out

#- 51 PublicPromoteGameSessionLeader
./ng net.accelbyte.sdk.cli.Main session publicPromoteGameSessionLeader \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'mBOB7zUW' \
    --body '{"leaderID": "d7Fz2r1K"}' \
    > test.out 2>&1
eval_tap $? 51 'PublicPromoteGameSessionLeader' test.out

#- 52 LeaveGameSession
./ng net.accelbyte.sdk.cli.Main session leaveGameSession \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'fd9qNUSJ' \
    > test.out 2>&1
eval_tap $? 52 'LeaveGameSession' test.out

#- 53 PublicGameSessionReject
./ng net.accelbyte.sdk.cli.Main session publicGameSessionReject \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'vp2FMzCD' \
    > test.out 2>&1
eval_tap $? 53 'PublicGameSessionReject' test.out

#- 54 GetSessionServerSecret
./ng net.accelbyte.sdk.cli.Main session getSessionServerSecret \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'JtAPem9R' \
    > test.out 2>&1
eval_tap $? 54 'GetSessionServerSecret' test.out

#- 55 AppendTeamGameSession
./ng net.accelbyte.sdk.cli.Main session appendTeamGameSession \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'MhwCKIAM' \
    --body '{"additionalMembers": [{"partyID": "VwdLyCXv", "userIDs": ["S4vTBmFz", "ppaChzz8", "gqt8BTVS"]}, {"partyID": "WeAkvIVV", "userIDs": ["PtVTTzWc", "4zFarfHH", "GNwgC7eU"]}, {"partyID": "TPLA9Uin", "userIDs": ["EfBHov4V", "b8U4T97Z", "4A6TBOwo"]}], "proposedTeams": [{"UserIDs": ["iRkztWaf", "UF0hsE5p", "iRutfY8K"], "parties": [{"partyID": "ap7w2Pel", "userIDs": ["dFWgDF7b", "ELNDjWTQ", "h0W3MuTQ"]}, {"partyID": "5C3oSBXs", "userIDs": ["Io9d0XqF", "SkAQr3UG", "BTJmrLaZ"]}, {"partyID": "dEGbkJoV", "userIDs": ["SUjLyFc5", "VAaz8IQS", "KAXr9H3G"]}]}, {"UserIDs": ["d6qSOfp5", "ab87QvvO", "VLjXp4VL"], "parties": [{"partyID": "w0VphO4p", "userIDs": ["6zXZtIKv", "ZI9D8AsW", "pAQUQOSf"]}, {"partyID": "WJrdZleX", "userIDs": ["NN0cBEi9", "YINF4z5O", "xUofCNM7"]}, {"partyID": "DQPHRiO0", "userIDs": ["VKl1QvZh", "dAveRj8z", "p4l7L8e4"]}]}, {"UserIDs": ["zpYmIzz2", "7KWPHR02", "MvH0XPkP"], "parties": [{"partyID": "dInJ5xR4", "userIDs": ["sr7D7AYN", "GkZlapzZ", "eF0whMNA"]}, {"partyID": "six99o2P", "userIDs": ["cirvJFq1", "zRO0kuoj", "xP4pciAl"]}, {"partyID": "B4j16AG6", "userIDs": ["erlHU7bI", "o2DtFTSl", "pP2V8iZV"]}]}], "version": 31}' \
    > test.out 2>&1
eval_tap $? 55 'AppendTeamGameSession' test.out

#- 56 PublicPartyJoinCode
./ng net.accelbyte.sdk.cli.Main session publicPartyJoinCode \
    --namespace "$AB_NAMESPACE" \
    --body '{"code": "G3rBhcYp"}' \
    > test.out 2>&1
eval_tap $? 56 'PublicPartyJoinCode' test.out

#- 57 PublicGetParty
./ng net.accelbyte.sdk.cli.Main session publicGetParty \
    --namespace "$AB_NAMESPACE" \
    --partyId 'EPBBSoOl' \
    > test.out 2>&1
eval_tap $? 57 'PublicGetParty' test.out

#- 58 PublicUpdateParty
./ng net.accelbyte.sdk.cli.Main session publicUpdateParty \
    --namespace "$AB_NAMESPACE" \
    --partyId 'YUHDWTCS' \
    --body '{"attributes": {"4d663HLV": {}, "TOrNcKco": {}, "eEu1PQTG": {}}, "inactiveTimeout": 12, "inviteTimeout": 91, "joinability": "RKugtcGX", "maxPlayers": 58, "minPlayers": 93, "type": "nH6fSfsr", "version": 47}' \
    > test.out 2>&1
eval_tap $? 58 'PublicUpdateParty' test.out

#- 59 PublicPatchUpdateParty
./ng net.accelbyte.sdk.cli.Main session publicPatchUpdateParty \
    --namespace "$AB_NAMESPACE" \
    --partyId 'RtuB0woI' \
    --body '{"attributes": {"26grZKXn": {}, "yVbijLLk": {}, "Dcg53ELq": {}}, "inactiveTimeout": 85, "inviteTimeout": 32, "joinability": "39W4Zi2p", "maxPlayers": 35, "minPlayers": 57, "type": "tqhRJzYA", "version": 39}' \
    > test.out 2>&1
eval_tap $? 59 'PublicPatchUpdateParty' test.out

#- 60 PublicGeneratePartyCode
./ng net.accelbyte.sdk.cli.Main session publicGeneratePartyCode \
    --namespace "$AB_NAMESPACE" \
    --partyId 'uqJzxE95' \
    > test.out 2>&1
eval_tap $? 60 'PublicGeneratePartyCode' test.out

#- 61 PublicRevokePartyCode
./ng net.accelbyte.sdk.cli.Main session publicRevokePartyCode \
    --namespace "$AB_NAMESPACE" \
    --partyId '0LGGgVVh' \
    > test.out 2>&1
eval_tap $? 61 'PublicRevokePartyCode' test.out

#- 62 PublicPartyInvite
./ng net.accelbyte.sdk.cli.Main session publicPartyInvite \
    --namespace "$AB_NAMESPACE" \
    --partyId 'XlWvThpy' \
    --body '{"platformID": "l9ETardd", "userID": "KQ07pUve"}' \
    > test.out 2>&1
eval_tap $? 62 'PublicPartyInvite' test.out

#- 63 PublicPromotePartyLeader
./ng net.accelbyte.sdk.cli.Main session publicPromotePartyLeader \
    --namespace "$AB_NAMESPACE" \
    --partyId 'xBFrcH2u' \
    --body '{"leaderID": "36dUS61J"}' \
    > test.out 2>&1
eval_tap $? 63 'PublicPromotePartyLeader' test.out

#- 64 PublicPartyJoin
./ng net.accelbyte.sdk.cli.Main session publicPartyJoin \
    --namespace "$AB_NAMESPACE" \
    --partyId 'aE1o6oD7' \
    > test.out 2>&1
eval_tap $? 64 'PublicPartyJoin' test.out

#- 65 PublicPartyLeave
./ng net.accelbyte.sdk.cli.Main session publicPartyLeave \
    --namespace "$AB_NAMESPACE" \
    --partyId 'afeCXrQA' \
    > test.out 2>&1
eval_tap $? 65 'PublicPartyLeave' test.out

#- 66 PublicPartyReject
./ng net.accelbyte.sdk.cli.Main session publicPartyReject \
    --namespace "$AB_NAMESPACE" \
    --partyId 'Ppx3AOEy' \
    > test.out 2>&1
eval_tap $? 66 'PublicPartyReject' test.out

#- 67 PublicPartyKick
./ng net.accelbyte.sdk.cli.Main session publicPartyKick \
    --namespace "$AB_NAMESPACE" \
    --partyId '98yNC8tm' \
    --userId 'dT9Mn1LR' \
    > test.out 2>&1
eval_tap $? 67 'PublicPartyKick' test.out

#- 68 PublicCreateParty
./ng net.accelbyte.sdk.cli.Main session publicCreateParty \
    --namespace "$AB_NAMESPACE" \
    --body '{"attributes": {"4RS906Ga": {}, "q5pazeI1": {}, "6nVzTfLg": {}}, "configurationName": "z6PyiCra", "inactiveTimeout": 71, "inviteTimeout": 49, "joinability": "aVi0pvIl", "maxPlayers": 9, "members": [{"ID": "Q9v0Dtsw", "PlatformID": "W6wPbO5M", "PlatformUserID": "cY98zmUC"}, {"ID": "gYf1tcVy", "PlatformID": "ZwozQ0It", "PlatformUserID": "j3g3YJkt"}, {"ID": "3Mqat2Bd", "PlatformID": "UnxVQG82", "PlatformUserID": "qvL3TvpU"}], "minPlayers": 85, "textChat": false, "type": "yZRASX4M"}' \
    > test.out 2>&1
eval_tap $? 68 'PublicCreateParty' test.out

#- 69 PublicGetRecentPlayer
./ng net.accelbyte.sdk.cli.Main session publicGetRecentPlayer \
    --namespace "$AB_NAMESPACE" \
    --limit '31' \
    --userId '1QPZbjVr' \
    > test.out 2>&1
eval_tap $? 69 'PublicGetRecentPlayer' test.out

#- 70 PublicUpdateInsertSessionStorageLeader
./ng net.accelbyte.sdk.cli.Main session publicUpdateInsertSessionStorageLeader \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'SseFomtA' \
    --body '{"G5joLLEU": {}, "QJORTzkF": {}, "osaBoRUV": {}}' \
    > test.out 2>&1
eval_tap $? 70 'PublicUpdateInsertSessionStorageLeader' test.out

#- 71 PublicUpdateInsertSessionStorage
./ng net.accelbyte.sdk.cli.Main session publicUpdateInsertSessionStorage \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'hCYgbze3' \
    --userId 'ZZpOsScn' \
    --body '{"i3flebyh": {}, "MM6UYF3S": {}, "rati3WLN": {}}' \
    > test.out 2>&1
eval_tap $? 71 'PublicUpdateInsertSessionStorage' test.out

#- 72 PublicGetBulkPlayerCurrentPlatform
./ng net.accelbyte.sdk.cli.Main session publicGetBulkPlayerCurrentPlatform \
    --namespace "$AB_NAMESPACE" \
    --body '{"userIDs": ["BXZPuTjo", "pvf7OqLN", "KpWex6Tr"]}' \
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
    --body '{"crossplayEnabled": false, "currentPlatform": "r8sLwd7q", "data": {"nns6cjgd": {}, "h600GM41": {}, "bLzlwyio": {}}, "platforms": [{"name": "zkTztiEN", "userID": "Jwi32h5l"}, {"name": "Bz1vo51v", "userID": "zINSaMwV"}, {"name": "F93Pmmrp", "userID": "FMy6Ugry"}], "roles": ["1OAfMOaA", "Le8G0x8K", "TgA7fHHw"]}' \
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
    --order 'Uf91GFOU' \
    --orderBy 'RW58RKqC' \
    --status 'v4rhJgZt' \
    > test.out 2>&1
eval_tap $? 76 'PublicQueryMyGameSessions' test.out

#- 77 PublicQueryMyParties
./ng net.accelbyte.sdk.cli.Main session publicQueryMyParties \
    --namespace "$AB_NAMESPACE" \
    --order 'o8Z1y4kr' \
    --orderBy '7AeOI2XT' \
    --status 'wbMZ095Z' \
    > test.out 2>&1
eval_tap $? 77 'PublicQueryMyParties' test.out


rm -f "tmp.dat"

exit $EXIT_CODE