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
echo "1..85"

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
    --body '{"metricExcludedNamespaces": ["8fIQwAFk", "upcfUSz0", "WcNjT0O1"], "regionRetryMapping": {"nBWig8lM": ["yUqxdWeY", "4wer5Hl7", "bF8TgGWz"], "FYvYvXF5": ["wMUb4Z3Z", "iHLCmWd0", "NMhUDlcH"], "PwLX6RU9": ["JEohRj99", "WFSz0i5i", "FS1gkNP0"]}, "regionURLMapping": ["HaQpoLVF", "2BNMEe6K", "bVzYJK7j"], "testGameMode": "In1tGPUL", "testRegionURLMapping": ["ggm6jKza", "z9DMHlyz", "B69LxgpV"], "testTargetUserIDs": ["NWrVxLif", "xTPvYBEG", "OG1TOVex"]}' \
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
    --body '{"durationDays": 16}' \
    > test.out 2>&1
eval_tap $? 12 'AdminUpdateConfigurationAlertV1' test.out

#- 13 AdminCreateConfigurationAlertV1
./ng net.accelbyte.sdk.cli.Main session adminCreateConfigurationAlertV1 \
    --namespace "$AB_NAMESPACE" \
    --body '{"durationDays": 51}' \
    > test.out 2>&1
eval_tap $? 13 'AdminCreateConfigurationAlertV1' test.out

#- 14 AdminDeleteConfigurationAlertV1
./ng net.accelbyte.sdk.cli.Main session adminDeleteConfigurationAlertV1 \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 14 'AdminDeleteConfigurationAlertV1' test.out

#- 15 HandleUploadXboxPFXCertificate
./ng net.accelbyte.sdk.cli.Main session handleUploadXboxPFXCertificate \
    --namespace "$AB_NAMESPACE" \
    --description '2thFHke3' \
    --certname 'cOvzReDY' \
    --file 'tmp.dat' \
    --password 'TqVZ4DTU' \
    > test.out 2>&1
eval_tap $? 15 'HandleUploadXboxPFXCertificate' test.out

#- 16 AdminCreateConfigurationTemplateV1
./ng net.accelbyte.sdk.cli.Main session adminCreateConfigurationTemplateV1 \
    --namespace "$AB_NAMESPACE" \
    --body '{"NativeSessionSetting": {"PSNServiceLabel": 66, "PSNSupportedPlatforms": ["tu6xpqWM", "AGYk76rs", "n0BA8IeG"], "SessionTitle": "8x77G2JI", "ShouldSync": true, "XboxAllowCrossPlatform": false, "XboxSandboxID": "YRKgDrYT", "XboxServiceConfigID": "J2wZVrKu", "XboxSessionTemplateName": "0iRKXM2i", "XboxTitleID": "vj4Z8E6g", "localizedSessionName": {"XD1Ui21F": {}, "C7uwfsMJ": {}, "0IlJpnUx": {}}}, "PSNBaseUrl": "m0g5o4Rp", "appName": "KOk1hYTI", "attributes": {"WMJEDIJs": {}, "VVL3bGsE": {}, "qy6I0UR0": {}}, "autoJoin": false, "autoLeaveSession": false, "clientVersion": "UyP4dtkc", "customURLGRPC": "hBnqrSFe", "deployment": "5bvkzEGW", "disableCodeGeneration": true, "disableResendInvite": true, "dsManualSetReady": false, "dsSource": "4dQQnju1", "enableSecret": true, "fallbackClaimKeys": ["lGbfXsKb", "3EImoqON", "jtwyLVLT"], "immutableStorage": true, "inactiveTimeout": 47, "inviteTimeout": 92, "joinability": "Qbosaxjt", "leaderElectionGracePeriod": 28, "manualRejoin": false, "maxActiveSessions": 46, "maxPlayers": 73, "minPlayers": 86, "name": "7E4avkQ1", "persistent": false, "preferredClaimKeys": ["Os4nPZVY", "0H4lfe1e", "hhOndoaP"], "requestedRegions": ["VIdKhNz7", "90UScehR", "HLIYgrhi"], "textChat": true, "tieTeamsSessionLifetime": true, "type": "DpSW1auk"}' \
    > test.out 2>&1
eval_tap $? 16 'AdminCreateConfigurationTemplateV1' test.out

#- 17 AdminGetAllConfigurationTemplatesV1
./ng net.accelbyte.sdk.cli.Main session adminGetAllConfigurationTemplatesV1 \
    --namespace "$AB_NAMESPACE" \
    --limit '18' \
    --name 'DGRLjtxt' \
    --offset '44' \
    --order 'ozqQKRBR' \
    --orderBy 'CgSwQqLd' \
    > test.out 2>&1
eval_tap $? 17 'AdminGetAllConfigurationTemplatesV1' test.out

#- 18 AdminGetConfigurationTemplateV1
./ng net.accelbyte.sdk.cli.Main session adminGetConfigurationTemplateV1 \
    --name 'YEzN3enf' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 18 'AdminGetConfigurationTemplateV1' test.out

#- 19 AdminUpdateConfigurationTemplateV1
./ng net.accelbyte.sdk.cli.Main session adminUpdateConfigurationTemplateV1 \
    --name 'ibiqfCWI' \
    --namespace "$AB_NAMESPACE" \
    --body '{"NativeSessionSetting": {"PSNServiceLabel": 64, "PSNSupportedPlatforms": ["Z4jAdWiI", "BfxODnCc", "EM4mudIJ"], "SessionTitle": "BeslKcGL", "ShouldSync": true, "XboxAllowCrossPlatform": false, "XboxSandboxID": "7wbxZvgi", "XboxServiceConfigID": "QDjMKmE1", "XboxSessionTemplateName": "yoGUNPL3", "XboxTitleID": "hWGqc3b1", "localizedSessionName": {"Jrj9rjOG": {}, "r3NEqDVM": {}, "ESsHN5oR": {}}}, "PSNBaseUrl": "JcOWOoIC", "appName": "fv2vMWDE", "attributes": {"KRL4CQkl": {}, "iHMWJhRp": {}, "BiRa0all": {}}, "autoJoin": false, "autoLeaveSession": false, "clientVersion": "3JjTczYX", "customURLGRPC": "eFvgyx6Y", "deployment": "qXX0TUPM", "disableCodeGeneration": false, "disableResendInvite": false, "dsManualSetReady": false, "dsSource": "26Qu8HFC", "enableSecret": true, "fallbackClaimKeys": ["I04Yysfa", "h35IiOL2", "sGJ3AFEv"], "immutableStorage": false, "inactiveTimeout": 79, "inviteTimeout": 34, "joinability": "cp5whXPb", "leaderElectionGracePeriod": 31, "manualRejoin": false, "maxActiveSessions": 48, "maxPlayers": 58, "minPlayers": 54, "name": "BH7yYtUq", "persistent": false, "preferredClaimKeys": ["dSkWvCCz", "dy4b4w9q", "iHKEoui7"], "requestedRegions": ["7ya5khNi", "2pqEUGNh", "kp2781hl"], "textChat": false, "tieTeamsSessionLifetime": false, "type": "QpQomlw9"}' \
    > test.out 2>&1
eval_tap $? 19 'AdminUpdateConfigurationTemplateV1' test.out

#- 20 AdminDeleteConfigurationTemplateV1
./ng net.accelbyte.sdk.cli.Main session adminDeleteConfigurationTemplateV1 \
    --name 'VegWtNQ1' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 20 'AdminDeleteConfigurationTemplateV1' test.out

#- 21 AdminGetMemberActiveSession
./ng net.accelbyte.sdk.cli.Main session adminGetMemberActiveSession \
    --name 'MTzSvyM9' \
    --namespace "$AB_NAMESPACE" \
    --userId 'n1LWoX0q' \
    > test.out 2>&1
eval_tap $? 21 'AdminGetMemberActiveSession' test.out

#- 22 AdminReconcileMaxActiveSession
./ng net.accelbyte.sdk.cli.Main session adminReconcileMaxActiveSession \
    --name 'VYaVjUMI' \
    --namespace "$AB_NAMESPACE" \
    --body '{"userID": "AoskjVF2"}' \
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
    --configurationName 'DEEwhHHr' \
    --dsPodName 'tI7aQjXe' \
    --fromTime 'mluZfXMa' \
    --gameMode 'G3sOczRr' \
    --isPersistent 'FpegGEXM' \
    --isSoftDeleted 'OA7xM834' \
    --joinability 'mjvFxUTV' \
    --limit '17' \
    --matchPool 'qqL2Hzqe' \
    --memberID '9WkJMZox' \
    --offset '50' \
    --order 'XGLGh6Vp' \
    --orderBy 'mBV5P92T' \
    --sessionID 'UIuXXJxz' \
    --status 'nZFJfqAR' \
    --statusV2 'BXsdQVfo' \
    --toTime '2s2eIu3m' \
    > test.out 2>&1
eval_tap $? 25 'AdminQueryGameSessions' test.out

#- 26 AdminQueryGameSessionsByAttributes
./ng net.accelbyte.sdk.cli.Main session adminQueryGameSessionsByAttributes \
    --namespace "$AB_NAMESPACE" \
    --body '{"t3kP7SSJ": {}, "JeSftICO": {}, "UGsfL5wt": {}}' \
    > test.out 2>&1
eval_tap $? 26 'AdminQueryGameSessionsByAttributes' test.out

#- 27 AdminDeleteBulkGameSessions
./ng net.accelbyte.sdk.cli.Main session adminDeleteBulkGameSessions \
    --namespace "$AB_NAMESPACE" \
    --body '{"ids": ["wtNZjzeo", "oSeQmrK7", "sM88JKpy"]}' \
    > test.out 2>&1
eval_tap $? 27 'AdminDeleteBulkGameSessions' test.out

#- 28 AdminSetDSReady
./ng net.accelbyte.sdk.cli.Main session adminSetDSReady \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'hZVVI25u' \
    --body '{"ready": true}' \
    > test.out 2>&1
eval_tap $? 28 'AdminSetDSReady' test.out

#- 29 AdminUpdateGameSessionMember
./ng net.accelbyte.sdk.cli.Main session adminUpdateGameSessionMember \
    --memberId 'N3pjLrmL' \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'TYW69tFS' \
    --statusType '5dWFeSyF' \
    > test.out 2>&1
eval_tap $? 29 'AdminUpdateGameSessionMember' test.out

#- 30 AdminGetListNativeSession
./ng net.accelbyte.sdk.cli.Main session adminGetListNativeSession \
    --namespace "$AB_NAMESPACE" \
    --limit '35' \
    --offset '72' \
    --order 'kutAGlP3' \
    > test.out 2>&1
eval_tap $? 30 'AdminGetListNativeSession' test.out

#- 31 AdminQueryParties
./ng net.accelbyte.sdk.cli.Main session adminQueryParties \
    --namespace "$AB_NAMESPACE" \
    --isSoftDeleted '10CYGlIN' \
    --joinability 'PJqKRamp' \
    --key 'EbhlLIMN' \
    --leaderID 'pLo66QIF' \
    --limit '5' \
    --memberID 'Y1g74zFr' \
    --memberStatus 'duN33TUl' \
    --offset '90' \
    --order '0Tyq5xWi' \
    --orderBy 'KiOtP7JD' \
    --partyID '0upVMQhT' \
    --value 'OhP5EEMM' \
    > test.out 2>&1
eval_tap $? 31 'AdminQueryParties' test.out

#- 32 AdminGetPlatformCredentials
./ng net.accelbyte.sdk.cli.Main session adminGetPlatformCredentials \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 32 'AdminGetPlatformCredentials' test.out

#- 33 AdminUpdatePlatformCredentials
./ng net.accelbyte.sdk.cli.Main session adminUpdatePlatformCredentials \
    --namespace "$AB_NAMESPACE" \
    --body '{"psn": {"clientId": "cJGFP3Id", "clientSecret": "O5pHbkSc", "scope": "vLw9npUC"}}' \
    > test.out 2>&1
eval_tap $? 33 'AdminUpdatePlatformCredentials' test.out

#- 34 AdminDeletePlatformCredentials
./ng net.accelbyte.sdk.cli.Main session adminDeletePlatformCredentials \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 34 'AdminDeletePlatformCredentials' test.out

#- 35 AdminGetRecentPlayer
./ng net.accelbyte.sdk.cli.Main session adminGetRecentPlayer \
    --namespace "$AB_NAMESPACE" \
    --limit '6' \
    --userId 'YqeiPoKL' \
    > test.out 2>&1
eval_tap $? 35 'AdminGetRecentPlayer' test.out

#- 36 AdminGetRecentTeamPlayer
./ng net.accelbyte.sdk.cli.Main session adminGetRecentTeamPlayer \
    --namespace "$AB_NAMESPACE" \
    --limit '40' \
    --userId 'YEvGzduJ' \
    > test.out 2>&1
eval_tap $? 36 'AdminGetRecentTeamPlayer' test.out

#- 37 AdminReadSessionStorage
./ng net.accelbyte.sdk.cli.Main session adminReadSessionStorage \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'zGI0xSzT' \
    > test.out 2>&1
eval_tap $? 37 'AdminReadSessionStorage' test.out

#- 38 AdminDeleteUserSessionStorage
./ng net.accelbyte.sdk.cli.Main session adminDeleteUserSessionStorage \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'ANu4etmZ' \
    > test.out 2>&1
eval_tap $? 38 'AdminDeleteUserSessionStorage' test.out

#- 39 AdminReadUserSessionStorage
./ng net.accelbyte.sdk.cli.Main session adminReadUserSessionStorage \
    --namespace "$AB_NAMESPACE" \
    --sessionId '4fvvLOSR' \
    --userId 'HksKY5XM' \
    > test.out 2>&1
eval_tap $? 39 'AdminReadUserSessionStorage' test.out

#- 40 AdminQueryPlayerAttributes
./ng net.accelbyte.sdk.cli.Main session adminQueryPlayerAttributes \
    --namespace "$AB_NAMESPACE" \
    --users 'SqZZxozK' \
    > test.out 2>&1
eval_tap $? 40 'AdminQueryPlayerAttributes' test.out

#- 41 AdminGetPlayerAttributes
./ng net.accelbyte.sdk.cli.Main session adminGetPlayerAttributes \
    --namespace "$AB_NAMESPACE" \
    --userId 'jjEwynKN' \
    > test.out 2>&1
eval_tap $? 41 'AdminGetPlayerAttributes' test.out

#- 42 AdminSyncNativeSession
./ng net.accelbyte.sdk.cli.Main session adminSyncNativeSession \
    --namespace "$AB_NAMESPACE" \
    --userId 'yA3ZLxEe' \
    > test.out 2>&1
eval_tap $? 42 'AdminSyncNativeSession' test.out

#- 43 CreateGameSession
./ng net.accelbyte.sdk.cli.Main session createGameSession \
    --namespace "$AB_NAMESPACE" \
    --body '{"appName": "FNAmYeqj", "attributes": {"E6mj5h7B": {}, "m33MXkQw": {}, "mqAPs3p9": {}}, "autoJoin": false, "backfillTicketID": "j0EMhbNS", "clientVersion": "B3X75wai", "configurationName": "H4yiDQsr", "customURLGRPC": "iGtHJ0xV", "deployment": "OZtzAAG0", "dsSource": "wieWM1dq", "fallbackClaimKeys": ["rHc3yrOq", "qSCAzNuY", "HGMDcIoc"], "inactiveTimeout": 31, "inviteTimeout": 49, "joinability": "PRJN9cC1", "matchPool": "0qvppnXY", "maxPlayers": 27, "minPlayers": 42, "preferredClaimKeys": ["jAhgwFLg", "Jatr9XQJ", "wZJHGHMD"], "requestedRegions": ["9HpZewkU", "zh9sWQ4l", "12VfZ2dx"], "serverName": "vIP2Fmir", "storage": {"leader": {"DTjvho3u": {}, "ZhP1lkbA": {}, "XmT1P7MO": {}}}, "teams": [{"UserIDs": ["zavTp3Db", "Wjg9wUFm", "2OOi4kwX"], "parties": [{"partyID": "LtA1wAYm", "userIDs": ["9etc0upg", "TWqIb7UR", "o3oVxVNi"]}, {"partyID": "2EgWUBS7", "userIDs": ["wRlgj3gF", "sPYVx3Uq", "2QjBRdyj"]}, {"partyID": "P8wdG0hF", "userIDs": ["WeCu8gVo", "HAmOCn4v", "i11MRIi7"]}]}, {"UserIDs": ["q1OGBq5U", "eKpI1U1c", "ISijpJPu"], "parties": [{"partyID": "IMvBHr13", "userIDs": ["GyvYaI2s", "w7eiJ42P", "LbUu2Aaj"]}, {"partyID": "cLkFgM0t", "userIDs": ["lFZ2voXg", "Prs0NzpU", "oAHG71lm"]}, {"partyID": "F3usYmKM", "userIDs": ["R0tWq7Ei", "ikqzyk6T", "sRkaQRYE"]}]}, {"UserIDs": ["Q5HHMEIh", "l4kggagJ", "Rx1AqvDG"], "parties": [{"partyID": "JjKx8XBF", "userIDs": ["2If5lBZg", "XYwKEgMH", "mp1qzzlu"]}, {"partyID": "fdautjbt", "userIDs": ["jfnDoU1b", "N3iCB5aL", "hWhzkeHC"]}, {"partyID": "sD6Wt9JY", "userIDs": ["ps0NoiNi", "dlzVc0P4", "m0posq8U"]}]}], "textChat": true, "ticketIDs": ["xedjW3Cq", "VjUk3I1d", "P0RUDKBu"], "tieTeamsSessionLifetime": true, "type": "POsUmckM"}' \
    > test.out 2>&1
eval_tap $? 43 'CreateGameSession' test.out

#- 44 PublicQueryGameSessionsByAttributes
./ng net.accelbyte.sdk.cli.Main session publicQueryGameSessionsByAttributes \
    --namespace "$AB_NAMESPACE" \
    --body '{"Zeqo1p3n": {}, "kX5fJFyb": {}, "k5uU2nd4": {}}' \
    > test.out 2>&1
eval_tap $? 44 'PublicQueryGameSessionsByAttributes' test.out

#- 45 PublicSessionJoinCode
./ng net.accelbyte.sdk.cli.Main session publicSessionJoinCode \
    --namespace "$AB_NAMESPACE" \
    --body '{"code": "S4nrNkok"}' \
    > test.out 2>&1
eval_tap $? 45 'PublicSessionJoinCode' test.out

#- 46 GetGameSessionByPodName
./ng net.accelbyte.sdk.cli.Main session getGameSessionByPodName \
    --namespace "$AB_NAMESPACE" \
    --podName '2ckzYEYK' \
    > test.out 2>&1
eval_tap $? 46 'GetGameSessionByPodName' test.out

#- 47 GetGameSession
./ng net.accelbyte.sdk.cli.Main session getGameSession \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'zJy012a2' \
    > test.out 2>&1
eval_tap $? 47 'GetGameSession' test.out

#- 48 UpdateGameSession
./ng net.accelbyte.sdk.cli.Main session updateGameSession \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'D68MHBPA' \
    --body '{"attributes": {"ZaHAlFzC": {}, "7dQSYi8g": {}, "nmRA8lvL": {}}, "backfillTicketID": "HPzF8IIK", "clientVersion": "4MBLhuW4", "deployment": "rjlf2f43", "fallbackClaimKeys": ["XNbogZtB", "dm53RgDq", "IIZtvry3"], "inactiveTimeout": 58, "inviteTimeout": 80, "joinability": "v5gZ7yaT", "matchPool": "PYHVq1es", "maxPlayers": 49, "minPlayers": 97, "preferredClaimKeys": ["GHMpxT4G", "JVxJ84Pw", "Fq07YUCV"], "requestedRegions": ["5XAVAvbi", "p1RdHdZl", "zmOLwbXs"], "teams": [{"UserIDs": ["riHz1b7F", "TwqEkJEe", "63eaZaRu"], "parties": [{"partyID": "EUb6K5tW", "userIDs": ["phFz54UP", "S0dlYqWg", "ii83lp4l"]}, {"partyID": "2KpFvs4g", "userIDs": ["Tn4pIh8j", "twRjYpN9", "xXc4LkZu"]}, {"partyID": "rc8I1BrW", "userIDs": ["dVgSlXP2", "pmg9NnzD", "0bbraZOD"]}]}, {"UserIDs": ["CE6Y9TvG", "L3eaiTvC", "NGBdBkhv"], "parties": [{"partyID": "tZbMKClK", "userIDs": ["RDzBQXWN", "QAyQXEIZ", "dZgKPxP6"]}, {"partyID": "7BKu7vTT", "userIDs": ["SkKzA5LY", "QiM6okA4", "HcsJEhUT"]}, {"partyID": "vDQFMFb4", "userIDs": ["JQwCpldT", "Ycq50ITB", "M7J2RKBt"]}]}, {"UserIDs": ["D0Z53KM9", "K2FbauRf", "VVxp3shk"], "parties": [{"partyID": "YvG8EL6J", "userIDs": ["rzsZobvq", "H4BW7FOe", "aZkVQHAr"]}, {"partyID": "ah0XdMST", "userIDs": ["FO1OUMb8", "zfUd6rlk", "pgAGCzJm"]}, {"partyID": "3ce0hI1i", "userIDs": ["3KKnwWmS", "9XxZy23n", "F2ocNoOv"]}]}], "ticketIDs": ["Q9H9SbZT", "UpfSnd2D", "DPYE6RGi"], "tieTeamsSessionLifetime": false, "type": "mi8gzdTm", "version": 14}' \
    > test.out 2>&1
eval_tap $? 48 'UpdateGameSession' test.out

#- 49 DeleteGameSession
./ng net.accelbyte.sdk.cli.Main session deleteGameSession \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'zQeBCBT3' \
    > test.out 2>&1
eval_tap $? 49 'DeleteGameSession' test.out

#- 50 PatchUpdateGameSession
./ng net.accelbyte.sdk.cli.Main session patchUpdateGameSession \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'yrxOapxO' \
    --body '{"attributes": {"f8REdn3I": {}, "TAFmHL65": {}, "G4C3DmBb": {}}, "backfillTicketID": "byVHvPDc", "clientVersion": "p2mNtwtt", "deployment": "OoTzRi3i", "fallbackClaimKeys": ["QlG5w0Df", "7PcuOfdC", "gWFbrSVx"], "inactiveTimeout": 99, "inviteTimeout": 74, "joinability": "rdD6qulc", "matchPool": "G7I0UHNa", "maxPlayers": 54, "minPlayers": 91, "preferredClaimKeys": ["TZchtyyi", "7eAZMIU4", "PmOXoIwS"], "requestedRegions": ["RYMmikBh", "OB11PqMF", "aazObpzH"], "teams": [{"UserIDs": ["Iso06RDo", "8EDQmJJz", "NKXytUOp"], "parties": [{"partyID": "Cyf5FMae", "userIDs": ["i1j3vvWY", "L7nHr56Z", "xqzVkmZZ"]}, {"partyID": "PTIH6TWe", "userIDs": ["EkReSazr", "MCs8AcKR", "LLWSIhM2"]}, {"partyID": "BXLnj2sh", "userIDs": ["pvr7hmaX", "xWJfRxZg", "8eVZmRuy"]}]}, {"UserIDs": ["6kCId4W6", "fUO2JqbY", "lHyc3NPo"], "parties": [{"partyID": "VQ0hPRZR", "userIDs": ["eLlOITuB", "67M4zXJR", "g3UnUV2D"]}, {"partyID": "tW9tA2Qb", "userIDs": ["udhBXEWV", "a0k5riNn", "Tug6qLBr"]}, {"partyID": "I22cxMNa", "userIDs": ["oLQXghOJ", "hXsLfzho", "tiVPJuPb"]}]}, {"UserIDs": ["trRGQCSA", "C8buxHL0", "mxtSeRDz"], "parties": [{"partyID": "OA8JpIAD", "userIDs": ["qDBxya3j", "pdeZ9qF1", "3p2dkiy9"]}, {"partyID": "FttCnfGq", "userIDs": ["2UEHouiq", "rcTLu6cA", "LXN5jrZq"]}, {"partyID": "ubU1PK9f", "userIDs": ["kZ7XSyaY", "V0PX4Mv9", "0RMkWYIg"]}]}], "ticketIDs": ["rX38Vqkj", "gjDHENXm", "a11JIygI"], "tieTeamsSessionLifetime": false, "type": "itB2MPxP", "version": 22}' \
    > test.out 2>&1
eval_tap $? 50 'PatchUpdateGameSession' test.out

#- 51 UpdateGameSessionBackfillTicketID
./ng net.accelbyte.sdk.cli.Main session updateGameSessionBackfillTicketID \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'AX8CTpwY' \
    --body '{"backfillTicketID": "HdFrVCfO"}' \
    > test.out 2>&1
eval_tap $? 51 'UpdateGameSessionBackfillTicketID' test.out

#- 52 GameSessionGenerateCode
./ng net.accelbyte.sdk.cli.Main session gameSessionGenerateCode \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'uIv55gYz' \
    > test.out 2>&1
eval_tap $? 52 'GameSessionGenerateCode' test.out

#- 53 PublicRevokeGameSessionCode
./ng net.accelbyte.sdk.cli.Main session publicRevokeGameSessionCode \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'yoj7AkZ5' \
    > test.out 2>&1
eval_tap $? 53 'PublicRevokeGameSessionCode' test.out

#- 54 PublicGameSessionInvite
./ng net.accelbyte.sdk.cli.Main session publicGameSessionInvite \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'nhQFxbtr' \
    --body '{"platformID": "0fTG4DTE", "userID": "TzH6uCHF"}' \
    > test.out 2>&1
eval_tap $? 54 'PublicGameSessionInvite' test.out

#- 55 JoinGameSession
./ng net.accelbyte.sdk.cli.Main session joinGameSession \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'jB2BiZTt' \
    > test.out 2>&1
eval_tap $? 55 'JoinGameSession' test.out

#- 56 PublicPromoteGameSessionLeader
./ng net.accelbyte.sdk.cli.Main session publicPromoteGameSessionLeader \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'b7nrBQQR' \
    --body '{"leaderID": "QPksKg4H"}' \
    > test.out 2>&1
eval_tap $? 56 'PublicPromoteGameSessionLeader' test.out

#- 57 LeaveGameSession
./ng net.accelbyte.sdk.cli.Main session leaveGameSession \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'qgyUlX3U' \
    > test.out 2>&1
eval_tap $? 57 'LeaveGameSession' test.out

#- 58 PublicGameSessionReject
./ng net.accelbyte.sdk.cli.Main session publicGameSessionReject \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'JUZiQsHZ' \
    > test.out 2>&1
eval_tap $? 58 'PublicGameSessionReject' test.out

#- 59 GetSessionServerSecret
./ng net.accelbyte.sdk.cli.Main session getSessionServerSecret \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'XIBhJtyU' \
    > test.out 2>&1
eval_tap $? 59 'GetSessionServerSecret' test.out

#- 60 AppendTeamGameSession
./ng net.accelbyte.sdk.cli.Main session appendTeamGameSession \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'jMblGVN3' \
    --body '{"additionalMembers": [{"partyID": "RsjxjEi7", "userIDs": ["nFFQZkOw", "QGy2sX4L", "m2kyXUlp"]}, {"partyID": "2tmVPDUy", "userIDs": ["Q9BI3WCL", "92otIPWO", "hK83JlPX"]}, {"partyID": "Uyfkubct", "userIDs": ["7H1cGwnR", "sKm7AI1l", "E4jdcos7"]}], "proposedTeams": [{"UserIDs": ["nEx2RGlJ", "IKSgU8Uo", "uQbTChYA"], "parties": [{"partyID": "uV3G3QFL", "userIDs": ["S4k3Uke7", "D22xKc1c", "ltFTL1p2"]}, {"partyID": "SRz1eMBc", "userIDs": ["YgGB8rEI", "gKXzXjAw", "dsnwJFq7"]}, {"partyID": "ZJDOzlY9", "userIDs": ["5sckWzxV", "Z7XJfqcV", "35gOziO9"]}]}, {"UserIDs": ["juItNXz9", "KPYiqfWD", "qMwSfzdE"], "parties": [{"partyID": "nk24dGdO", "userIDs": ["NDRNqVxF", "9KI3746k", "88QceH4o"]}, {"partyID": "u0RZr0n8", "userIDs": ["itBGTdTo", "5JMRmddS", "tD5opSvB"]}, {"partyID": "Krwv1zKD", "userIDs": ["MiGKjvMW", "6zWeKyWr", "FMJZcT9O"]}]}, {"UserIDs": ["hdX6Y7ca", "9QsWcVJy", "b6l8on58"], "parties": [{"partyID": "wpgyOhm2", "userIDs": ["zU7OfHOs", "f09ZS7h1", "9vAgbcwK"]}, {"partyID": "zsqmAelQ", "userIDs": ["xF75k65X", "fPw424qv", "XdOflMuD"]}, {"partyID": "MErYVGV1", "userIDs": ["GL6oqGnu", "xofCETyP", "O47EDXOv"]}]}], "version": 55}' \
    > test.out 2>&1
eval_tap $? 60 'AppendTeamGameSession' test.out

#- 61 PublicGameSessionCancel
./ng net.accelbyte.sdk.cli.Main session publicGameSessionCancel \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'L8Yn0xsn' \
    --userId 'S3ycYEZV' \
    > test.out 2>&1
eval_tap $? 61 'PublicGameSessionCancel' test.out

#- 62 PublicPartyJoinCode
./ng net.accelbyte.sdk.cli.Main session publicPartyJoinCode \
    --namespace "$AB_NAMESPACE" \
    --body '{"code": "WZ9JiYwn"}' \
    > test.out 2>&1
eval_tap $? 62 'PublicPartyJoinCode' test.out

#- 63 PublicGetParty
./ng net.accelbyte.sdk.cli.Main session publicGetParty \
    --namespace "$AB_NAMESPACE" \
    --partyId 'KwqTsYR4' \
    > test.out 2>&1
eval_tap $? 63 'PublicGetParty' test.out

#- 64 PublicUpdateParty
./ng net.accelbyte.sdk.cli.Main session publicUpdateParty \
    --namespace "$AB_NAMESPACE" \
    --partyId 'SCDzMOHm' \
    --body '{"attributes": {"du6bqDdD": {}, "o0WNInJv": {}, "pfURtLNG": {}}, "inactiveTimeout": 87, "inviteTimeout": 8, "joinability": "zXsRGp79", "maxPlayers": 39, "minPlayers": 79, "type": "cSiI0mk4", "version": 23}' \
    > test.out 2>&1
eval_tap $? 64 'PublicUpdateParty' test.out

#- 65 PublicPatchUpdateParty
./ng net.accelbyte.sdk.cli.Main session publicPatchUpdateParty \
    --namespace "$AB_NAMESPACE" \
    --partyId 'l3l94lnC' \
    --body '{"attributes": {"fVkT55wd": {}, "2GfRts5F": {}, "19TplJG2": {}}, "inactiveTimeout": 2, "inviteTimeout": 91, "joinability": "HrFnfr9s", "maxPlayers": 17, "minPlayers": 90, "type": "XCNBqKFK", "version": 66}' \
    > test.out 2>&1
eval_tap $? 65 'PublicPatchUpdateParty' test.out

#- 66 PublicGeneratePartyCode
./ng net.accelbyte.sdk.cli.Main session publicGeneratePartyCode \
    --namespace "$AB_NAMESPACE" \
    --partyId 'WS4HiAol' \
    > test.out 2>&1
eval_tap $? 66 'PublicGeneratePartyCode' test.out

#- 67 PublicRevokePartyCode
./ng net.accelbyte.sdk.cli.Main session publicRevokePartyCode \
    --namespace "$AB_NAMESPACE" \
    --partyId '2RAkp5Oa' \
    > test.out 2>&1
eval_tap $? 67 'PublicRevokePartyCode' test.out

#- 68 PublicPartyInvite
./ng net.accelbyte.sdk.cli.Main session publicPartyInvite \
    --namespace "$AB_NAMESPACE" \
    --partyId 'eKIJSEIf' \
    --body '{"platformID": "j1VhyJgF", "userID": "JlFRFth5"}' \
    > test.out 2>&1
eval_tap $? 68 'PublicPartyInvite' test.out

#- 69 PublicPromotePartyLeader
./ng net.accelbyte.sdk.cli.Main session publicPromotePartyLeader \
    --namespace "$AB_NAMESPACE" \
    --partyId 'hW3I7If1' \
    --body '{"leaderID": "Zkdxoicm"}' \
    > test.out 2>&1
eval_tap $? 69 'PublicPromotePartyLeader' test.out

#- 70 PublicPartyJoin
./ng net.accelbyte.sdk.cli.Main session publicPartyJoin \
    --namespace "$AB_NAMESPACE" \
    --partyId 'k7Kv0NwJ' \
    > test.out 2>&1
eval_tap $? 70 'PublicPartyJoin' test.out

#- 71 PublicPartyLeave
./ng net.accelbyte.sdk.cli.Main session publicPartyLeave \
    --namespace "$AB_NAMESPACE" \
    --partyId 'qsCaS669' \
    > test.out 2>&1
eval_tap $? 71 'PublicPartyLeave' test.out

#- 72 PublicPartyReject
./ng net.accelbyte.sdk.cli.Main session publicPartyReject \
    --namespace "$AB_NAMESPACE" \
    --partyId 'rbuoWFJf' \
    > test.out 2>&1
eval_tap $? 72 'PublicPartyReject' test.out

#- 73 PublicPartyCancel
./ng net.accelbyte.sdk.cli.Main session publicPartyCancel \
    --namespace "$AB_NAMESPACE" \
    --partyId 'oeAutujV' \
    --userId '8iWv6IES' \
    > test.out 2>&1
eval_tap $? 73 'PublicPartyCancel' test.out

#- 74 PublicPartyKick
./ng net.accelbyte.sdk.cli.Main session publicPartyKick \
    --namespace "$AB_NAMESPACE" \
    --partyId 'Ek2v1yGh' \
    --userId 'NKRAO1bR' \
    > test.out 2>&1
eval_tap $? 74 'PublicPartyKick' test.out

#- 75 PublicCreateParty
./ng net.accelbyte.sdk.cli.Main session publicCreateParty \
    --namespace "$AB_NAMESPACE" \
    --body '{"attributes": {"LRoKO57Z": {}, "pTxgL2GG": {}, "UvzWe7KF": {}}, "configurationName": "NdFJH8WH", "inactiveTimeout": 7, "inviteTimeout": 45, "joinability": "m3x4ZqQE", "maxPlayers": 57, "members": [{"ID": "wuYNBIMo", "PlatformID": "OK0qZdPo", "PlatformUserID": "JeX3HP4l"}, {"ID": "uDf6O3pQ", "PlatformID": "Fuir3qjF", "PlatformUserID": "OJCkRixG"}, {"ID": "ASjOYJyK", "PlatformID": "gRrmCPmV", "PlatformUserID": "Dcwt5Unf"}], "minPlayers": 21, "textChat": false, "type": "iaaYc2nO"}' \
    > test.out 2>&1
eval_tap $? 75 'PublicCreateParty' test.out

#- 76 PublicGetRecentPlayer
./ng net.accelbyte.sdk.cli.Main session publicGetRecentPlayer \
    --namespace "$AB_NAMESPACE" \
    --limit '3' \
    > test.out 2>&1
eval_tap $? 76 'PublicGetRecentPlayer' test.out

#- 77 PublicGetRecentTeamPlayer
./ng net.accelbyte.sdk.cli.Main session publicGetRecentTeamPlayer \
    --namespace "$AB_NAMESPACE" \
    --limit '49' \
    > test.out 2>&1
eval_tap $? 77 'PublicGetRecentTeamPlayer' test.out

#- 78 PublicUpdateInsertSessionStorageLeader
./ng net.accelbyte.sdk.cli.Main session publicUpdateInsertSessionStorageLeader \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'QQN3G94i' \
    --body '{"AMWgQDqB": {}, "rAxuvuDr": {}, "m6Pu4lcL": {}}' \
    > test.out 2>&1
eval_tap $? 78 'PublicUpdateInsertSessionStorageLeader' test.out

#- 79 PublicUpdateInsertSessionStorage
./ng net.accelbyte.sdk.cli.Main session publicUpdateInsertSessionStorage \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'M9tMyr6q' \
    --userId 'D434tjpL' \
    --body '{"Msmu7gQd": {}, "4roSQXqi": {}, "qarCMz1C": {}}' \
    > test.out 2>&1
eval_tap $? 79 'PublicUpdateInsertSessionStorage' test.out

#- 80 PublicGetBulkPlayerCurrentPlatform
./ng net.accelbyte.sdk.cli.Main session publicGetBulkPlayerCurrentPlatform \
    --namespace "$AB_NAMESPACE" \
    --body '{"userIDs": ["wiZHb7hm", "Sq6FiAyd", "8Ebub27d"]}' \
    > test.out 2>&1
eval_tap $? 80 'PublicGetBulkPlayerCurrentPlatform' test.out

#- 81 PublicGetPlayerAttributes
./ng net.accelbyte.sdk.cli.Main session publicGetPlayerAttributes \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 81 'PublicGetPlayerAttributes' test.out

#- 82 PublicStorePlayerAttributes
./ng net.accelbyte.sdk.cli.Main session publicStorePlayerAttributes \
    --namespace "$AB_NAMESPACE" \
    --body '{"crossplayEnabled": true, "currentPlatform": "U0TeVNPU", "data": {"4a4Yr9Ry": {}, "rRnDSwfc": {}, "n91vfHmh": {}}, "platforms": [{"name": "cGlvNyEb", "userID": "LWIF39EW"}, {"name": "6DwPeYn8", "userID": "rrtfL4nM"}, {"name": "TpoiSBfB", "userID": "IK2jtYrC"}], "roles": ["VQ7l9JVX", "UJSrmmsC", "BUQdHQjF"], "simultaneousPlatform": "ejfMTGyQ"}' \
    > test.out 2>&1
eval_tap $? 82 'PublicStorePlayerAttributes' test.out

#- 83 PublicDeletePlayerAttributes
./ng net.accelbyte.sdk.cli.Main session publicDeletePlayerAttributes \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 83 'PublicDeletePlayerAttributes' test.out

#- 84 PublicQueryMyGameSessions
./ng net.accelbyte.sdk.cli.Main session publicQueryMyGameSessions \
    --namespace "$AB_NAMESPACE" \
    --order 'AKJN7ClH' \
    --orderBy '1gE15jqy' \
    --status 'BtOArB9j' \
    > test.out 2>&1
eval_tap $? 84 'PublicQueryMyGameSessions' test.out

#- 85 PublicQueryMyParties
./ng net.accelbyte.sdk.cli.Main session publicQueryMyParties \
    --namespace "$AB_NAMESPACE" \
    --order 'dHoFwHEO' \
    --orderBy 'movxrCP4' \
    --status 'dac9C96O' \
    > test.out 2>&1
eval_tap $? 85 'PublicQueryMyParties' test.out


rm -f "tmp.dat"

exit $EXIT_CODE