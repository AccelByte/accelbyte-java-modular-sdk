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
    --body '{"logLevel": "info"}' \
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
    --body '{"metricExcludedNamespaces": ["Epe0W5p1", "OAwW7fj2", "ZtvdNTqi"], "regionRetryMapping": {"7Y6Srkvn": ["4RcD0bYD", "nxW8HI99", "od48iVAA"], "Vj8vQMbw": ["p0JfT70l", "kW718gRY", "DMiWDR62"], "lJRWeQzU": ["YPhV9GpC", "UxaER6hc", "JjmBid8P"]}, "regionURLMapping": ["2lMRRz2F", "7TnPDnuo", "sQeMBErZ"], "testGameMode": "jpMH8kIn", "testRegionURLMapping": ["Ji276gjV", "oZ8mw8YY", "5xSVXWob"], "testTargetUserIDs": ["hn0a91CB", "hzqMmJHN", "UTP6OMac"]}' \
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
    --body '{"durationDays": 37}' \
    > test.out 2>&1
eval_tap $? 12 'AdminUpdateConfigurationAlertV1' test.out

#- 13 AdminCreateConfigurationAlertV1
./ng net.accelbyte.sdk.cli.Main session adminCreateConfigurationAlertV1 \
    --namespace "$AB_NAMESPACE" \
    --body '{"durationDays": 18}' \
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
    --body '{"NativeSessionSetting": {"PSNServiceLabel": 46, "PSNSupportedPlatforms": ["y0OSkWIZ", "KqritOIx", "pBUUk2fM"], "SessionTitle": "EOV3S8z2", "ShouldSync": true, "XboxAllowCrossPlatform": false, "XboxSandboxID": "1FWmndx4", "XboxServiceConfigID": "O3ZqbIyp", "XboxSessionTemplateName": "bK9Px0Hu", "XboxTitleID": "o7tM90zr", "localizedSessionName": {"WHUkcmHs": {}, "3iRg1ttt": {}, "zh6pZ8E3": {}}}, "PSNBaseUrl": "TbYK2aTH", "appName": "hqEu1wIW", "asyncProcessDSRequest": {"async": false, "timeout": 52}, "attributes": {"x1256e69": {}, "WC6DJt4V": {}, "pW2BDD7c": {}}, "autoJoin": true, "autoLeaveSession": true, "clientVersion": "nwpKfScs", "customURLGRPC": "ZZ8ihNXV", "deployment": "XhKukSyS", "disableCodeGeneration": true, "disableResendInvite": false, "dsManualSetReady": false, "dsSource": "CpVDeGxq", "enableSecret": false, "fallbackClaimKeys": ["ufMjnvun", "NhesvJqg", "C4m4IA9V"], "grpcSessionConfig": {"appName": "k4ddq052", "customURL": "mBH8OkZP", "functionFlag": 80}, "immutableStorage": false, "inactiveTimeout": 42, "inviteTimeout": 1, "joinability": "ohECmdTd", "leaderElectionGracePeriod": 16, "manualRejoin": true, "maxActiveSessions": 14, "maxPlayers": 18, "minPlayers": 52, "name": "ryh1d4ef", "persistent": false, "preferredClaimKeys": ["8VDJ81li", "QcZh5ixm", "jOTiuRjC"], "requestedRegions": ["diDR6ZPY", "GF3jK4Q5", "OEChKMcs"], "textChat": true, "textChatMode": "NONE", "tieTeamsSessionLifetime": true, "ttlHours": 54, "type": "wKE2iSRr"}' \
    > test.out 2>&1
eval_tap $? 16 'AdminCreateConfigurationTemplateV1' test.out

#- 17 AdminGetAllConfigurationTemplatesV1
./ng net.accelbyte.sdk.cli.Main session adminGetAllConfigurationTemplatesV1 \
    --namespace "$AB_NAMESPACE" \
    --limit '18' \
    --name 'EGVZ8lCY' \
    --offset '84' \
    --order 'RbVYoiXr' \
    --orderBy 'e7HCu3kw' \
    > test.out 2>&1
eval_tap $? 17 'AdminGetAllConfigurationTemplatesV1' test.out

#- 18 AdminGetConfigurationTemplateV1
./ng net.accelbyte.sdk.cli.Main session adminGetConfigurationTemplateV1 \
    --name 'S0jTlfeH' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 18 'AdminGetConfigurationTemplateV1' test.out

#- 19 AdminUpdateConfigurationTemplateV1
./ng net.accelbyte.sdk.cli.Main session adminUpdateConfigurationTemplateV1 \
    --name 'QGgfPk5f' \
    --namespace "$AB_NAMESPACE" \
    --body '{"NativeSessionSetting": {"PSNServiceLabel": 72, "PSNSupportedPlatforms": ["nFuue11v", "vfd5A0Ph", "jsyn98b5"], "SessionTitle": "JXyyQcoi", "ShouldSync": true, "XboxAllowCrossPlatform": false, "XboxSandboxID": "o1Z849Xp", "XboxServiceConfigID": "VL5y9fQX", "XboxSessionTemplateName": "LzYAcoCV", "XboxTitleID": "JY17dG1v", "localizedSessionName": {"aPT4jgUi": {}, "V4Nq6MEO": {}, "NdSKUMgF": {}}}, "PSNBaseUrl": "0V9wAoHu", "appName": "v6q3h28X", "asyncProcessDSRequest": {"async": true, "timeout": 99}, "attributes": {"lsgmgkDh": {}, "4GTLkbqG": {}, "1uGeIukx": {}}, "autoJoin": true, "autoLeaveSession": true, "clientVersion": "X8Eoplas", "customURLGRPC": "C1sp1vZK", "deployment": "hfAMzLi9", "disableCodeGeneration": false, "disableResendInvite": true, "dsManualSetReady": true, "dsSource": "JQEtAVLv", "enableSecret": true, "fallbackClaimKeys": ["7dk6SMxp", "HptpU6Jy", "3qpn7Mmu"], "grpcSessionConfig": {"appName": "k2aIKYfY", "customURL": "BcPeUn1O", "functionFlag": 69}, "immutableStorage": false, "inactiveTimeout": 36, "inviteTimeout": 72, "joinability": "xYUkXxmY", "leaderElectionGracePeriod": 19, "manualRejoin": true, "maxActiveSessions": 86, "maxPlayers": 100, "minPlayers": 27, "name": "P3ORLrrf", "persistent": true, "preferredClaimKeys": ["TVFnPOe8", "U8r6BqCW", "fRPdgsAm"], "requestedRegions": ["40oD29kz", "CjJ97BJL", "vgZfbnG7"], "textChat": false, "textChatMode": "NONE", "tieTeamsSessionLifetime": false, "ttlHours": 7, "type": "4eJB2Nol"}' \
    > test.out 2>&1
eval_tap $? 19 'AdminUpdateConfigurationTemplateV1' test.out

#- 20 AdminDeleteConfigurationTemplateV1
./ng net.accelbyte.sdk.cli.Main session adminDeleteConfigurationTemplateV1 \
    --name '5PtEbrn1' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 20 'AdminDeleteConfigurationTemplateV1' test.out

#- 21 AdminGetMemberActiveSession
./ng net.accelbyte.sdk.cli.Main session adminGetMemberActiveSession \
    --name '0eMR9uuq' \
    --namespace "$AB_NAMESPACE" \
    --userId 'IqXYc9Y6' \
    > test.out 2>&1
eval_tap $? 21 'AdminGetMemberActiveSession' test.out

#- 22 AdminReconcileMaxActiveSession
./ng net.accelbyte.sdk.cli.Main session adminReconcileMaxActiveSession \
    --name 'f1wWamfs' \
    --namespace "$AB_NAMESPACE" \
    --body '{"userID": "Fs6690Fc"}' \
    > test.out 2>&1
eval_tap $? 22 'AdminReconcileMaxActiveSession' test.out

#- 23 AdminGetDSMCConfiguration
eval_tap 0 23 'AdminGetDSMCConfiguration # SKIP deprecated' test.out

#- 24 AdminSyncDSMCConfiguration
eval_tap 0 24 'AdminSyncDSMCConfiguration # SKIP deprecated' test.out

#- 25 AdminQueryGameSessions
./ng net.accelbyte.sdk.cli.Main session adminQueryGameSessions \
    --namespace "$AB_NAMESPACE" \
    --configurationName 'h9C0WdMN' \
    --dsPodName 'eOlTTmJo' \
    --fromTime 'Pbm5esJp' \
    --gameMode '7XO8AIuz' \
    --isPersistent '1vr0pUv1' \
    --isSoftDeleted 'oYkbtuUU' \
    --joinability 'CKbOHloS' \
    --limit '51' \
    --matchPool 'P1FWVfEx' \
    --memberID 'DhVRVDMl' \
    --offset '4' \
    --order 'gcO5yk1e' \
    --orderBy '6F0X6fKi' \
    --sessionID '9ThqC9nr' \
    --status 'ISuB5p2e' \
    --statusV2 'YLmHYCG3' \
    --toTime 'a4dzuQZf' \
    > test.out 2>&1
eval_tap $? 25 'AdminQueryGameSessions' test.out

#- 26 AdminQueryGameSessionsByAttributes
./ng net.accelbyte.sdk.cli.Main session adminQueryGameSessionsByAttributes \
    --namespace "$AB_NAMESPACE" \
    --body '{"8rmJU6rS": {}, "WIwtVWTX": {}, "qjOjlmio": {}}' \
    > test.out 2>&1
eval_tap $? 26 'AdminQueryGameSessionsByAttributes' test.out

#- 27 AdminDeleteBulkGameSessions
./ng net.accelbyte.sdk.cli.Main session adminDeleteBulkGameSessions \
    --namespace "$AB_NAMESPACE" \
    --body '{"ids": ["WHqRS2cg", "PfMR7qKk", "W7imdm94"]}' \
    > test.out 2>&1
eval_tap $? 27 'AdminDeleteBulkGameSessions' test.out

#- 28 AdminSetDSReady
./ng net.accelbyte.sdk.cli.Main session adminSetDSReady \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'gS0P0sLm' \
    --body '{"ready": false}' \
    > test.out 2>&1
eval_tap $? 28 'AdminSetDSReady' test.out

#- 29 AdminUpdateDSInformation
./ng net.accelbyte.sdk.cli.Main session adminUpdateDSInformation \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'm2ci4WG7' \
    --body '{"createdRegion": "Qz7DdoMy", "deployment": "zu6bsEzn", "description": "bmZVO6pG", "ip": "KpEIcDff", "port": 4, "region": "q2s1TbJ2", "serverId": "jcdqvPrr", "source": "Wkfvjzx6", "status": "jeQXfNOc"}' \
    > test.out 2>&1
eval_tap $? 29 'AdminUpdateDSInformation' test.out

#- 30 AdminKickGameSessionMember
./ng net.accelbyte.sdk.cli.Main session adminKickGameSessionMember \
    --memberId 'M7FWpRWq' \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'JoHdnFAl' \
    > test.out 2>&1
eval_tap $? 30 'AdminKickGameSessionMember' test.out

#- 31 AdminUpdateGameSessionMember
./ng net.accelbyte.sdk.cli.Main session adminUpdateGameSessionMember \
    --memberId 'CGWLmrSt' \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'tWD8Tq4Z' \
    --statusType 'EJBJd2HD' \
    > test.out 2>&1
eval_tap $? 31 'AdminUpdateGameSessionMember' test.out

#- 32 AdminGetListNativeSession
./ng net.accelbyte.sdk.cli.Main session adminGetListNativeSession \
    --namespace "$AB_NAMESPACE" \
    --limit '54' \
    --offset '47' \
    --order 'Epfl9GWw' \
    > test.out 2>&1
eval_tap $? 32 'AdminGetListNativeSession' test.out

#- 33 AdminQueryParties
./ng net.accelbyte.sdk.cli.Main session adminQueryParties \
    --namespace "$AB_NAMESPACE" \
    --fromTime 'Lp4whGdo' \
    --isSoftDeleted 'MdGiW60M' \
    --joinability 'tT0fT2Cy' \
    --key 'mQ2hppf5' \
    --leaderID 'BdyfqZvR' \
    --limit '100' \
    --memberID '49l5fjRS' \
    --memberStatus '2sECma6U' \
    --offset '9' \
    --order 'nzG0MT9N' \
    --orderBy 'p333FEUk' \
    --partyID 'xrjhRJM1' \
    --toTime 'AL9RSdgu' \
    --value 'L6CQVhs5' \
    > test.out 2>&1
eval_tap $? 33 'AdminQueryParties' test.out

#- 34 AdminDeleteBulkParties
./ng net.accelbyte.sdk.cli.Main session adminDeleteBulkParties \
    --namespace "$AB_NAMESPACE" \
    --body '{"ids": ["W2vX90Sn", "9MaFZghm", "7PR4eHJp"]}' \
    > test.out 2>&1
eval_tap $? 34 'AdminDeleteBulkParties' test.out

#- 35 AdminReadPartySessionStorage
./ng net.accelbyte.sdk.cli.Main session adminReadPartySessionStorage \
    --namespace "$AB_NAMESPACE" \
    --partyId 'vzUzoNlz' \
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
    --body '{"psn": {"clientId": "erZeiQlF", "clientSecret": "b1j8VCLN", "scope": "u8jJ6KJY"}}' \
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
    --platformId 'PSN' \
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
    --limit '4' \
    --userId 'IIYT7fR6' \
    > test.out 2>&1
eval_tap $? 41 'AdminGetRecentPlayer' test.out

#- 42 AdminGetRecentTeamPlayer
./ng net.accelbyte.sdk.cli.Main session adminGetRecentTeamPlayer \
    --namespace "$AB_NAMESPACE" \
    --limit '69' \
    --userId 'BVeZv2Io' \
    > test.out 2>&1
eval_tap $? 42 'AdminGetRecentTeamPlayer' test.out

#- 43 AdminReadSessionStorage
./ng net.accelbyte.sdk.cli.Main session adminReadSessionStorage \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'zcAUnwTX' \
    > test.out 2>&1
eval_tap $? 43 'AdminReadSessionStorage' test.out

#- 44 AdminDeleteUserSessionStorage
./ng net.accelbyte.sdk.cli.Main session adminDeleteUserSessionStorage \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'V02wbcvY' \
    > test.out 2>&1
eval_tap $? 44 'AdminDeleteUserSessionStorage' test.out

#- 45 AdminReadUserSessionStorage
./ng net.accelbyte.sdk.cli.Main session adminReadUserSessionStorage \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'rJ0M2wpJ' \
    --userId 'Y8atue5e' \
    > test.out 2>&1
eval_tap $? 45 'AdminReadUserSessionStorage' test.out

#- 46 AdminQueryPlayerAttributes
./ng net.accelbyte.sdk.cli.Main session adminQueryPlayerAttributes \
    --namespace "$AB_NAMESPACE" \
    --users 'n7NcrAJ2' \
    > test.out 2>&1
eval_tap $? 46 'AdminQueryPlayerAttributes' test.out

#- 47 AdminGetPlayerAttributes
./ng net.accelbyte.sdk.cli.Main session adminGetPlayerAttributes \
    --namespace "$AB_NAMESPACE" \
    --userId 'guleIwGP' \
    > test.out 2>&1
eval_tap $? 47 'AdminGetPlayerAttributes' test.out

#- 48 AdminSyncNativeSession
./ng net.accelbyte.sdk.cli.Main session adminSyncNativeSession \
    --namespace "$AB_NAMESPACE" \
    --userId '3ogBZ70C' \
    > test.out 2>&1
eval_tap $? 48 'AdminSyncNativeSession' test.out

#- 49 CreateGameSession
./ng net.accelbyte.sdk.cli.Main session createGameSession \
    --namespace "$AB_NAMESPACE" \
    --body '{"appName": "fySLiaR5", "attributes": {"OVFLKOBV": {}, "2OIr3qyE": {}, "wLp23lIT": {}}, "autoJoin": true, "backfillTicketID": "WLxy1BPi", "clientVersion": "7MiDduFb", "configurationName": "uGX9HGHq", "customURLGRPC": "2ONFptOF", "deployment": "Gj4MzeXM", "dsSource": "8kKSQnl5", "fallbackClaimKeys": ["yOhMLu2a", "HO3UnRTN", "szQCvYU9"], "inactiveTimeout": 48, "inviteTimeout": 87, "joinability": "rqajHM9V", "matchPool": "ClaoICqO", "maxPlayers": 75, "minPlayers": 10, "preferredClaimKeys": ["8tH7RrV8", "7ybNPqfu", "QrSeIJzu"], "requestedRegions": ["kpDiut1E", "ydaAGeFC", "5YSatYeE"], "serverName": "CcP2zIqN", "storage": {"leader": {"6vnBDRzr": {}, "lCYLTDnD": {}, "mZvqrN9F": {}}}, "teams": [{"parties": [{"partyID": "U2BgEXlA", "userIDs": ["MH0YGbdr", "Ie4THEcH", "ekydOo4G"]}, {"partyID": "ycWE3TgX", "userIDs": ["MZIKQjVW", "QsDaxToq", "B6ax7eOS"]}, {"partyID": "mAPde7j0", "userIDs": ["LhieMPVs", "VwG3YwaV", "bmlk4eEn"]}], "teamID": "BiHKeSOb", "userIDs": ["U5VcmYqg", "WWF6tjEK", "CpBT056G"]}, {"parties": [{"partyID": "F6d2eDn1", "userIDs": ["L6A3ojlP", "qnqzmKO1", "6knf2iGE"]}, {"partyID": "k20IJMHT", "userIDs": ["nEDDBqtl", "WkJma2L0", "Kh1ToGby"]}, {"partyID": "LXC2fzFo", "userIDs": ["fZ0mGxGI", "XrZf6QDx", "8rMk3lT4"]}], "teamID": "4YR9E75h", "userIDs": ["tzTFAVC2", "D0sbEb1H", "MhS0mwSj"]}, {"parties": [{"partyID": "sR4vZ5GN", "userIDs": ["FKCRA7xy", "nJmHzq2b", "ItL4JJ8D"]}, {"partyID": "4L2oUFzX", "userIDs": ["gZVA8tPD", "omPlslnA", "PnCrHwYp"]}, {"partyID": "BwnEgDnL", "userIDs": ["oOmrVygy", "rBziUcua", "7PRb6rk1"]}], "teamID": "zuLBiK4p", "userIDs": ["AjuvWcYH", "eR9QDXUc", "nQYju5k8"]}], "textChat": false, "textChatMode": "GAME", "ticketIDs": ["9926Nbm0", "Y5QXYIoM", "PVSfasW7"], "tieTeamsSessionLifetime": true, "type": "gdxwMOCF"}' \
    > test.out 2>&1
eval_tap $? 49 'CreateGameSession' test.out

#- 50 PublicQueryGameSessionsByAttributes
./ng net.accelbyte.sdk.cli.Main session publicQueryGameSessionsByAttributes \
    --namespace "$AB_NAMESPACE" \
    --body '{"GqqyVfbK": {}, "V5CL0cwG": {}, "zCa6oVr3": {}}' \
    > test.out 2>&1
eval_tap $? 50 'PublicQueryGameSessionsByAttributes' test.out

#- 51 PublicSessionJoinCode
./ng net.accelbyte.sdk.cli.Main session publicSessionJoinCode \
    --namespace "$AB_NAMESPACE" \
    --body '{"code": "AAPmbJMu"}' \
    > test.out 2>&1
eval_tap $? 51 'PublicSessionJoinCode' test.out

#- 52 GetGameSessionByPodName
./ng net.accelbyte.sdk.cli.Main session getGameSessionByPodName \
    --namespace "$AB_NAMESPACE" \
    --podName '25npJiOR' \
    > test.out 2>&1
eval_tap $? 52 'GetGameSessionByPodName' test.out

#- 53 GetGameSession
./ng net.accelbyte.sdk.cli.Main session getGameSession \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'UN8LbJoO' \
    > test.out 2>&1
eval_tap $? 53 'GetGameSession' test.out

#- 54 UpdateGameSession
./ng net.accelbyte.sdk.cli.Main session updateGameSession \
    --namespace "$AB_NAMESPACE" \
    --sessionId '790VZ7az' \
    --body '{"attributes": {"gOJcopga": {}, "ecoOodeX": {}, "Tk0AcKzn": {}}, "backfillTicketID": "TgvrFCLU", "clientVersion": "8IsjopNz", "deployment": "UcQfnAca", "fallbackClaimKeys": ["I3FzAPEM", "gNoLBQ1W", "QfelayiA"], "inactiveTimeout": 35, "inviteTimeout": 44, "joinability": "ZNRa59kl", "matchPool": "R2FsNQ9H", "maxPlayers": 11, "minPlayers": 79, "preferredClaimKeys": ["pUB7bm9B", "LV3SRtBm", "dEWNYJ9L"], "requestedRegions": ["FyiN8VCv", "ZbXMxhTk", "KFUPcxqA"], "teams": [{"parties": [{"partyID": "yLZK2L3n", "userIDs": ["lrChyTdc", "IaY9Oev4", "8C5d5Kmh"]}, {"partyID": "LYDSpWX4", "userIDs": ["VuIF3K5T", "Q8Ny7oOH", "v23nHb9o"]}, {"partyID": "n26014wM", "userIDs": ["KCCHdkUw", "EoX5gvWG", "z0QtHyjp"]}], "teamID": "GCxxy7ip", "userIDs": ["9HAFIrxn", "eLVAkgYq", "camWCjpM"]}, {"parties": [{"partyID": "rC1wQTtT", "userIDs": ["3fyPmo0y", "hvqWrUhc", "bX48VBKk"]}, {"partyID": "uckZNj13", "userIDs": ["Zl0aIuCt", "4QE2cn0g", "KglN1sDi"]}, {"partyID": "8AsSiCXE", "userIDs": ["5Ur3XFKq", "euyCT1X4", "HXaGLsic"]}], "teamID": "QIq19DqU", "userIDs": ["0Vnnjcjx", "S65OFbXd", "05IbC6j7"]}, {"parties": [{"partyID": "igbuVTTu", "userIDs": ["gcnWzsTR", "SIcBMeIg", "2NksAXlJ"]}, {"partyID": "ZQEPSXhg", "userIDs": ["vEolLC8U", "pielJXKn", "mhpBlUP3"]}, {"partyID": "4oPhKE2V", "userIDs": ["t91V2T8U", "jIFHMONJ", "MgyYov2m"]}], "teamID": "qSoSbkOm", "userIDs": ["nGUdPMCX", "5NHy3tqc", "WmK94sNB"]}], "ticketIDs": ["RS0gAPL6", "YxcW6sVR", "hKmmFyzK"], "tieTeamsSessionLifetime": true, "type": "KoO0xS0h", "version": 5}' \
    > test.out 2>&1
eval_tap $? 54 'UpdateGameSession' test.out

#- 55 DeleteGameSession
./ng net.accelbyte.sdk.cli.Main session deleteGameSession \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'IfcgkPRn' \
    > test.out 2>&1
eval_tap $? 55 'DeleteGameSession' test.out

#- 56 PatchUpdateGameSession
./ng net.accelbyte.sdk.cli.Main session patchUpdateGameSession \
    --namespace "$AB_NAMESPACE" \
    --sessionId '08VDoKtj' \
    --body '{"attributes": {"vWRwAgfS": {}, "PnQFx8pH": {}, "NJGNNVlC": {}}, "backfillTicketID": "ksZsHcVB", "clientVersion": "zdIqg6tL", "deployment": "h6eIO87J", "fallbackClaimKeys": ["cwmbjkhc", "peDFbxG9", "FGQdxZZQ"], "inactiveTimeout": 91, "inviteTimeout": 92, "joinability": "IbC7aqUr", "matchPool": "JCIRRo4I", "maxPlayers": 61, "minPlayers": 51, "preferredClaimKeys": ["00PSbOpL", "f2xYAbvW", "yfcW98Hv"], "requestedRegions": ["yFwIPwdL", "aTqdimfa", "ivq9nAkX"], "teams": [{"parties": [{"partyID": "yK3Cj3fX", "userIDs": ["LPudJ1ED", "ZhWrwZVZ", "paVmd4gP"]}, {"partyID": "CY32gl2B", "userIDs": ["iYm8W2D7", "Bw7av05f", "VnNAOGrh"]}, {"partyID": "OQBF5j53", "userIDs": ["rNtPDBOz", "VbHUZVUv", "ITCL8Gyv"]}], "teamID": "v998IrZE", "userIDs": ["HqBraqXp", "TahEaZ2C", "WPkqD40W"]}, {"parties": [{"partyID": "qvLIHwCW", "userIDs": ["n6Qx6JOc", "H2e3uS5Z", "w4Mr9DqR"]}, {"partyID": "XznvvThZ", "userIDs": ["j73y6TGk", "uNpIBqeu", "zdj4J9NA"]}, {"partyID": "nUjUmJkR", "userIDs": ["TpqOj0gJ", "JjBMSG3x", "HlNJX4d7"]}], "teamID": "HzD894Xg", "userIDs": ["GWroQW3E", "dJvV3Rrt", "lrToeJo0"]}, {"parties": [{"partyID": "eCl3poqE", "userIDs": ["j0qXVs31", "ntpXo5qm", "jB1FtnDD"]}, {"partyID": "15eN5kh8", "userIDs": ["o7Acj7gV", "cwLBd1cp", "trBReBYX"]}, {"partyID": "v7SpoI6G", "userIDs": ["Cz77iua8", "maJPN9j3", "lLqgnBHl"]}], "teamID": "P8DPllkc", "userIDs": ["QhZUY4OF", "HYXMSabg", "ActE4Ows"]}], "ticketIDs": ["s9o51izH", "jMrc76wq", "q9OI3Grk"], "tieTeamsSessionLifetime": true, "type": "D60CY3gv", "version": 29}' \
    > test.out 2>&1
eval_tap $? 56 'PatchUpdateGameSession' test.out

#- 57 UpdateGameSessionBackfillTicketID
./ng net.accelbyte.sdk.cli.Main session updateGameSessionBackfillTicketID \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'qGw1xZm6' \
    --body '{"backfillTicketID": "gvbKAVK2"}' \
    > test.out 2>&1
eval_tap $? 57 'UpdateGameSessionBackfillTicketID' test.out

#- 58 GameSessionGenerateCode
./ng net.accelbyte.sdk.cli.Main session gameSessionGenerateCode \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'EFMKc6CF' \
    > test.out 2>&1
eval_tap $? 58 'GameSessionGenerateCode' test.out

#- 59 PublicRevokeGameSessionCode
./ng net.accelbyte.sdk.cli.Main session publicRevokeGameSessionCode \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'dWTgUSHC' \
    > test.out 2>&1
eval_tap $? 59 'PublicRevokeGameSessionCode' test.out

#- 60 PublicGameSessionInvite
./ng net.accelbyte.sdk.cli.Main session publicGameSessionInvite \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'sMnsSCHL' \
    --body '{"metadata": {"6ECimlvu": "GE6vDDLi", "1d3SrHXS": "cmEpib7k", "daggEkTP": "aMTUV5Xw"}, "platformID": "sy5KVj0r", "userID": "CW9euMVs"}' \
    > test.out 2>&1
eval_tap $? 60 'PublicGameSessionInvite' test.out

#- 61 JoinGameSession
./ng net.accelbyte.sdk.cli.Main session joinGameSession \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'bsFqDGFT' \
    > test.out 2>&1
eval_tap $? 61 'JoinGameSession' test.out

#- 62 PublicPromoteGameSessionLeader
./ng net.accelbyte.sdk.cli.Main session publicPromoteGameSessionLeader \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'AttOhR1f' \
    --body '{"leaderID": "GixDaopG"}' \
    > test.out 2>&1
eval_tap $? 62 'PublicPromoteGameSessionLeader' test.out

#- 63 LeaveGameSession
./ng net.accelbyte.sdk.cli.Main session leaveGameSession \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'J5luBcuK' \
    > test.out 2>&1
eval_tap $? 63 'LeaveGameSession' test.out

#- 64 PublicKickGameSessionMember
./ng net.accelbyte.sdk.cli.Main session publicKickGameSessionMember \
    --memberId 'SkLJg0A7' \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'fbocOVix' \
    > test.out 2>&1
eval_tap $? 64 'PublicKickGameSessionMember' test.out

#- 65 PublicGameSessionReject
./ng net.accelbyte.sdk.cli.Main session publicGameSessionReject \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'Iu0teGMk' \
    > test.out 2>&1
eval_tap $? 65 'PublicGameSessionReject' test.out

#- 66 GetSessionServerSecret
./ng net.accelbyte.sdk.cli.Main session getSessionServerSecret \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'BqKWfvlb' \
    > test.out 2>&1
eval_tap $? 66 'GetSessionServerSecret' test.out

#- 67 AppendTeamGameSession
eval_tap 0 67 'AppendTeamGameSession # SKIP deprecated' test.out

#- 68 PublicGameSessionCancel
./ng net.accelbyte.sdk.cli.Main session publicGameSessionCancel \
    --namespace "$AB_NAMESPACE" \
    --sessionId '2kUPfsCp' \
    --userId '7daanMAU' \
    > test.out 2>&1
eval_tap $? 68 'PublicGameSessionCancel' test.out

#- 69 PublicPartyJoinCode
./ng net.accelbyte.sdk.cli.Main session publicPartyJoinCode \
    --namespace "$AB_NAMESPACE" \
    --body '{"code": "buZ9J9bd"}' \
    > test.out 2>&1
eval_tap $? 69 'PublicPartyJoinCode' test.out

#- 70 PublicGetParty
./ng net.accelbyte.sdk.cli.Main session publicGetParty \
    --namespace "$AB_NAMESPACE" \
    --partyId 'AENlNIXl' \
    > test.out 2>&1
eval_tap $? 70 'PublicGetParty' test.out

#- 71 PublicUpdateParty
./ng net.accelbyte.sdk.cli.Main session publicUpdateParty \
    --namespace "$AB_NAMESPACE" \
    --partyId 'XUybzjX3' \
    --body '{"attributes": {"mqH4uHi0": {}, "rttG5aMj": {}, "FCWveMs6": {}}, "inactiveTimeout": 33, "inviteTimeout": 62, "joinability": "JYfsCORS", "maxPlayers": 3, "minPlayers": 100, "type": "8BfmuAg3", "version": 29}' \
    > test.out 2>&1
eval_tap $? 71 'PublicUpdateParty' test.out

#- 72 PublicPatchUpdateParty
./ng net.accelbyte.sdk.cli.Main session publicPatchUpdateParty \
    --namespace "$AB_NAMESPACE" \
    --partyId 'YqqFwZI3' \
    --body '{"attributes": {"j05HIa7k": {}, "r52OIMbi": {}, "rwWiRztv": {}}, "inactiveTimeout": 66, "inviteTimeout": 26, "joinability": "4c72DKrj", "maxPlayers": 57, "minPlayers": 77, "type": "0lFfmC6h", "version": 71}' \
    > test.out 2>&1
eval_tap $? 72 'PublicPatchUpdateParty' test.out

#- 73 PublicGeneratePartyCode
./ng net.accelbyte.sdk.cli.Main session publicGeneratePartyCode \
    --namespace "$AB_NAMESPACE" \
    --partyId 'WmI58Mi4' \
    > test.out 2>&1
eval_tap $? 73 'PublicGeneratePartyCode' test.out

#- 74 PublicRevokePartyCode
./ng net.accelbyte.sdk.cli.Main session publicRevokePartyCode \
    --namespace "$AB_NAMESPACE" \
    --partyId 'wNmKn5I2' \
    > test.out 2>&1
eval_tap $? 74 'PublicRevokePartyCode' test.out

#- 75 PublicPartyInvite
./ng net.accelbyte.sdk.cli.Main session publicPartyInvite \
    --namespace "$AB_NAMESPACE" \
    --partyId 'RknmjF72' \
    --body '{"metadata": {"LhszdtgP": "dA3iMVUW", "J7T0mb4T": "SxXf1UaR", "xUAPmWHI": "z7nyS4Fz"}, "platformID": "HMcCJROC", "userID": "rdRygFup"}' \
    > test.out 2>&1
eval_tap $? 75 'PublicPartyInvite' test.out

#- 76 PublicPromotePartyLeader
./ng net.accelbyte.sdk.cli.Main session publicPromotePartyLeader \
    --namespace "$AB_NAMESPACE" \
    --partyId 'AAVN9FYn' \
    --body '{"leaderID": "DHUMxODI"}' \
    > test.out 2>&1
eval_tap $? 76 'PublicPromotePartyLeader' test.out

#- 77 PublicReadPartySessionStorage
./ng net.accelbyte.sdk.cli.Main session publicReadPartySessionStorage \
    --namespace "$AB_NAMESPACE" \
    --partyId 'kAzwKTLZ' \
    > test.out 2>&1
eval_tap $? 77 'PublicReadPartySessionStorage' test.out

#- 78 PublicUpdateInsertPartySessionStorageReserved
./ng net.accelbyte.sdk.cli.Main session publicUpdateInsertPartySessionStorageReserved \
    --namespace "$AB_NAMESPACE" \
    --partyId '4zaahH8z' \
    --userId 'vWrZIgxN' \
    --body '{"LFX0noKA": {}, "SfQm5aoh": {}, "wggcg9ns": {}}' \
    > test.out 2>&1
eval_tap $? 78 'PublicUpdateInsertPartySessionStorageReserved' test.out

#- 79 PublicPartyJoin
./ng net.accelbyte.sdk.cli.Main session publicPartyJoin \
    --namespace "$AB_NAMESPACE" \
    --partyId 'ePhI7qgU' \
    > test.out 2>&1
eval_tap $? 79 'PublicPartyJoin' test.out

#- 80 PublicPartyLeave
./ng net.accelbyte.sdk.cli.Main session publicPartyLeave \
    --namespace "$AB_NAMESPACE" \
    --partyId 'VSUIEuSn' \
    > test.out 2>&1
eval_tap $? 80 'PublicPartyLeave' test.out

#- 81 PublicPartyReject
./ng net.accelbyte.sdk.cli.Main session publicPartyReject \
    --namespace "$AB_NAMESPACE" \
    --partyId 'rtyA9199' \
    > test.out 2>&1
eval_tap $? 81 'PublicPartyReject' test.out

#- 82 PublicPartyCancel
./ng net.accelbyte.sdk.cli.Main session publicPartyCancel \
    --namespace "$AB_NAMESPACE" \
    --partyId '7QbS5oyQ' \
    --userId '2ynGHva8' \
    > test.out 2>&1
eval_tap $? 82 'PublicPartyCancel' test.out

#- 83 PublicPartyKick
./ng net.accelbyte.sdk.cli.Main session publicPartyKick \
    --namespace "$AB_NAMESPACE" \
    --partyId 'rCTq6qWa' \
    --userId 'OxHlGi0S' \
    > test.out 2>&1
eval_tap $? 83 'PublicPartyKick' test.out

#- 84 PublicCreateParty
./ng net.accelbyte.sdk.cli.Main session publicCreateParty \
    --namespace "$AB_NAMESPACE" \
    --body '{"attributes": {"6rpan0bw": {}, "2hCHCuCa": {}, "U1FlVVEn": {}}, "configurationName": "7ExKZQpe", "inactiveTimeout": 30, "inviteTimeout": 37, "joinability": "fbp8xUEU", "maxPlayers": 5, "members": [{"ID": "1fbqRxBS", "PlatformID": "Y6M86GeB", "PlatformUserID": "eX16ejVY"}, {"ID": "VIs7HUk6", "PlatformID": "PVoVY3fE", "PlatformUserID": "5e7J1los"}, {"ID": "3MzwjtFW", "PlatformID": "ztIKC5eK", "PlatformUserID": "86s3PKfn"}], "minPlayers": 14, "textChat": false, "type": "hbH99iR3"}' \
    > test.out 2>&1
eval_tap $? 84 'PublicCreateParty' test.out

#- 85 PublicGetRecentPlayer
./ng net.accelbyte.sdk.cli.Main session publicGetRecentPlayer \
    --namespace "$AB_NAMESPACE" \
    --limit '83' \
    > test.out 2>&1
eval_tap $? 85 'PublicGetRecentPlayer' test.out

#- 86 PublicGetRecentTeamPlayer
./ng net.accelbyte.sdk.cli.Main session publicGetRecentTeamPlayer \
    --namespace "$AB_NAMESPACE" \
    --limit '75' \
    > test.out 2>&1
eval_tap $? 86 'PublicGetRecentTeamPlayer' test.out

#- 87 PublicUpdateInsertSessionStorageLeader
./ng net.accelbyte.sdk.cli.Main session publicUpdateInsertSessionStorageLeader \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'FaxdhhVa' \
    --body '{"u2OkAsCs": {}, "vpIHmQyv": {}, "NLNvMURn": {}}' \
    > test.out 2>&1
eval_tap $? 87 'PublicUpdateInsertSessionStorageLeader' test.out

#- 88 PublicUpdateInsertSessionStorage
./ng net.accelbyte.sdk.cli.Main session publicUpdateInsertSessionStorage \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'o4txLDwT' \
    --userId 'To9vHsrt' \
    --body '{"ihF5ruSn": {}, "F7NyLYPR": {}, "CVJhfrPd": {}}' \
    > test.out 2>&1
eval_tap $? 88 'PublicUpdateInsertSessionStorage' test.out

#- 89 PublicGetBulkPlayerCurrentPlatform
./ng net.accelbyte.sdk.cli.Main session publicGetBulkPlayerCurrentPlatform \
    --namespace "$AB_NAMESPACE" \
    --body '{"userIDs": ["C8COaDvY", "WlyFA7Lo", "cDyfD3BJ"]}' \
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
    --body '{"crossplayEnabled": true, "currentPlatform": "RuoPwXU4", "data": {"IDRJKcL9": {}, "PFgw6PK2": {}, "Uc5V2oJv": {}}, "platforms": [{"name": "7H1arXHD", "userID": "D4XeV3fz"}, {"name": "ERu0jv5j", "userID": "cSf1mi5R"}, {"name": "bwVRky6a", "userID": "oYt8lCQk"}], "roles": ["JqDRtBaJ", "oikVK7OJ", "bCGVHfSF"], "simultaneousPlatform": "nYsZdmx4"}' \
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
    --order 'pVKA0hEp' \
    --orderBy '0S5kLpx5' \
    --status 'gFIej6kV' \
    > test.out 2>&1
eval_tap $? 93 'PublicQueryMyGameSessions' test.out

#- 94 PublicQueryMyParties
./ng net.accelbyte.sdk.cli.Main session publicQueryMyParties \
    --namespace "$AB_NAMESPACE" \
    --order '9UJ9QNBb' \
    --orderBy 'RGA5JJbu' \
    --status 'THNTmzN4' \
    > test.out 2>&1
eval_tap $? 94 'PublicQueryMyParties' test.out


rm -f "tmp.dat"

exit $EXIT_CODE