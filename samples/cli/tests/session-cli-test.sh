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
    --body '{"regionRetryMapping": {"4bCzSzLC": ["2q7VnJhQ", "fZ4M2cVb", "FTjPHORN"], "4kXfWTi5": ["sZbmFol8", "qWqRqJkO", "GUPYUE6s"], "l6wGZAFc": ["n7dekIHM", "RDLTvPUn", "SQuUZLlY"]}, "regionURLMapping": ["eiMQouq0", "gpZpkHM8", "vCiSqobb"], "testGameMode": "CbshJcIH", "testRegionURLMapping": ["7pqq6Zus", "rhdz0OKT", "an0wwXKS"], "testTargetUserIDs": ["Qmb2ALal", "VXBZpz2x", "cbrYmE4v"]}' \
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
    --body '{"durationDays": 55}' \
    > test.out 2>&1
eval_tap $? 10 'AdminUpdateConfigurationAlertV1' test.out

#- 11 AdminCreateConfigurationAlertV1
./ng net.accelbyte.sdk.cli.Main session adminCreateConfigurationAlertV1 \
    --namespace "$AB_NAMESPACE" \
    --body '{"durationDays": 91}' \
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
    --description 'ZC5qKL9M' \
    --certname 'YuGnx8H6' \
    --file 'tmp.dat' \
    --password '9qyrsFSJ' \
    > test.out 2>&1
eval_tap $? 13 'HandleUploadXboxPFXCertificate' test.out

#- 14 AdminCreateConfigurationTemplateV1
./ng net.accelbyte.sdk.cli.Main session adminCreateConfigurationTemplateV1 \
    --namespace "$AB_NAMESPACE" \
    --body '{"NativeSessionSetting": {"PSNServiceLabel": 26, "PSNSupportedPlatforms": ["dYJ7EGr2", "GJF0MPkh", "jyGQauLQ"], "SessionTitle": "9G5q9RmM", "ShouldSync": false, "XboxAllowCrossPlatform": true, "XboxSandboxID": "t8yjQJDL", "XboxServiceConfigID": "XSKXXc1D", "XboxSessionTemplateName": "bPfQRDBV", "XboxTitleID": "MB89T19f", "localizedSessionName": {"tzyCRW32": {}, "rkyaPZ82": {}, "toyTHLJd": {}}}, "PSNBaseUrl": "QZcWyWl2", "attributes": {"5M8MsQmg": {}, "iLBkdvgt": {}, "sauHkCtr": {}}, "autoJoin": false, "clientVersion": "z1q9Uz5k", "deployment": "mVruQPtN", "disableCodeGeneration": true, "dsManualSetReady": true, "dsSource": "b9ON10Cr", "enableSecret": true, "fallbackClaimKeys": ["7Z5XkxkG", "GxZvtzVJ", "e49gOKj5"], "immutableStorage": false, "inactiveTimeout": 91, "inviteTimeout": 72, "joinability": "188KAT7C", "leaderElectionGracePeriod": 5, "manualRejoin": true, "maxActiveSessions": 44, "maxPlayers": 69, "minPlayers": 93, "name": "7KmVQK6z", "persistent": false, "preferredClaimKeys": ["4RbAovsv", "JhqYiLCS", "FkwnjNoy"], "requestedRegions": ["SUT3pPHA", "NAcFza9i", "Y9szD9P1"], "textChat": false, "tieTeamsSessionLifetime": true, "type": "20x7znHd"}' \
    > test.out 2>&1
eval_tap $? 14 'AdminCreateConfigurationTemplateV1' test.out

#- 15 AdminGetAllConfigurationTemplatesV1
./ng net.accelbyte.sdk.cli.Main session adminGetAllConfigurationTemplatesV1 \
    --namespace "$AB_NAMESPACE" \
    --limit '38' \
    --name 'ZTnmhMj5' \
    --offset '1' \
    --order '7xbHLxAS' \
    --orderBy 'SHwScqry' \
    > test.out 2>&1
eval_tap $? 15 'AdminGetAllConfigurationTemplatesV1' test.out

#- 16 AdminGetConfigurationTemplateV1
./ng net.accelbyte.sdk.cli.Main session adminGetConfigurationTemplateV1 \
    --name 'VAhCJdyp' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 16 'AdminGetConfigurationTemplateV1' test.out

#- 17 AdminUpdateConfigurationTemplateV1
./ng net.accelbyte.sdk.cli.Main session adminUpdateConfigurationTemplateV1 \
    --name 'UzK7akcz' \
    --namespace "$AB_NAMESPACE" \
    --body '{"NativeSessionSetting": {"PSNServiceLabel": 76, "PSNSupportedPlatforms": ["LBC5bo2f", "ncZHi4z9", "wC9wjXba"], "SessionTitle": "y9yap4jF", "ShouldSync": true, "XboxAllowCrossPlatform": false, "XboxSandboxID": "EfwIFYuP", "XboxServiceConfigID": "CBXDXoIb", "XboxSessionTemplateName": "xecvKIoU", "XboxTitleID": "MvnxwecE", "localizedSessionName": {"RehVf2Cg": {}, "ziwJVjo0": {}, "DhsHMXSR": {}}}, "PSNBaseUrl": "i1d3Um5M", "attributes": {"9PnrS6aC": {}, "aJcNodqn": {}, "i6wyMPMv": {}}, "autoJoin": true, "clientVersion": "WgH7KBMQ", "deployment": "hva9mRfi", "disableCodeGeneration": false, "dsManualSetReady": false, "dsSource": "9dIBmIET", "enableSecret": false, "fallbackClaimKeys": ["fS68yCLO", "2pSb78YY", "aE1cIKFo"], "immutableStorage": false, "inactiveTimeout": 36, "inviteTimeout": 96, "joinability": "kXsVYOyB", "leaderElectionGracePeriod": 83, "manualRejoin": true, "maxActiveSessions": 50, "maxPlayers": 91, "minPlayers": 15, "name": "x71d6ly0", "persistent": false, "preferredClaimKeys": ["KLhm1IdP", "eRQz53eh", "bmhGzCP9"], "requestedRegions": ["s7gTtfDA", "SIS1vWNH", "IBR3qRHp"], "textChat": true, "tieTeamsSessionLifetime": true, "type": "u8xx8wDq"}' \
    > test.out 2>&1
eval_tap $? 17 'AdminUpdateConfigurationTemplateV1' test.out

#- 18 AdminDeleteConfigurationTemplateV1
./ng net.accelbyte.sdk.cli.Main session adminDeleteConfigurationTemplateV1 \
    --name 'mAiXbhXo' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 18 'AdminDeleteConfigurationTemplateV1' test.out

#- 19 AdminGetMemberActiveSession
./ng net.accelbyte.sdk.cli.Main session adminGetMemberActiveSession \
    --name 'utUipUaU' \
    --namespace "$AB_NAMESPACE" \
    --userId '8scAIhhl' \
    > test.out 2>&1
eval_tap $? 19 'AdminGetMemberActiveSession' test.out

#- 20 AdminReconcileMaxActiveSession
./ng net.accelbyte.sdk.cli.Main session adminReconcileMaxActiveSession \
    --name 'RIQkwqjy' \
    --namespace "$AB_NAMESPACE" \
    --body '{"userID": "2vI5fhp1"}' \
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
    --configurationName 'BPYJkfGW' \
    --dsPodName 'bXzNyiP5' \
    --fromTime '5bxnWYRZ' \
    --gameMode '5Db4m0JY' \
    --isPersistent 'Ibr44rDo' \
    --isSoftDeleted 'AQsggkKZ' \
    --joinability '74H2zaPB' \
    --limit '88' \
    --matchPool 'wgH3YPau' \
    --memberID '1oEVxnKf' \
    --offset '10' \
    --order 'lLcyrLAX' \
    --orderBy '1ZRIx8Hc' \
    --sessionID '846pj9xF' \
    --status 'Mo4p2FzG' \
    --statusV2 'DuGThK0s' \
    --toTime 'bakDE2To' \
    > test.out 2>&1
eval_tap $? 23 'AdminQueryGameSessions' test.out

#- 24 AdminQueryGameSessionsByAttributes
./ng net.accelbyte.sdk.cli.Main session adminQueryGameSessionsByAttributes \
    --namespace "$AB_NAMESPACE" \
    --body '{"UhWRc3YQ": {}, "apEjBjfk": {}, "3QF8fzLu": {}}' \
    > test.out 2>&1
eval_tap $? 24 'AdminQueryGameSessionsByAttributes' test.out

#- 25 AdminDeleteBulkGameSessions
./ng net.accelbyte.sdk.cli.Main session adminDeleteBulkGameSessions \
    --namespace "$AB_NAMESPACE" \
    --body '{"ids": ["HOke5vpO", "F1vzCyWu", "JbOw9huJ"]}' \
    > test.out 2>&1
eval_tap $? 25 'AdminDeleteBulkGameSessions' test.out

#- 26 AdminSetDSReady
./ng net.accelbyte.sdk.cli.Main session adminSetDSReady \
    --namespace "$AB_NAMESPACE" \
    --sessionId '2Qch3gQ6' \
    --body '{"ready": false}' \
    > test.out 2>&1
eval_tap $? 26 'AdminSetDSReady' test.out

#- 27 AdminUpdateGameSessionMember
./ng net.accelbyte.sdk.cli.Main session adminUpdateGameSessionMember \
    --memberId 'ZgiSOI90' \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'urHv6bmx' \
    --statusType 'UyjVlpgO' \
    > test.out 2>&1
eval_tap $? 27 'AdminUpdateGameSessionMember' test.out

#- 28 AdminGetListNativeSession
./ng net.accelbyte.sdk.cli.Main session adminGetListNativeSession \
    --namespace "$AB_NAMESPACE" \
    --limit '47' \
    --offset '0' \
    --order 'RwHB1SsG' \
    > test.out 2>&1
eval_tap $? 28 'AdminGetListNativeSession' test.out

#- 29 AdminQueryParties
./ng net.accelbyte.sdk.cli.Main session adminQueryParties \
    --namespace "$AB_NAMESPACE" \
    --joinability '4e03FywV' \
    --key 'fVY6hHOS' \
    --leaderID 'BUN80xD7' \
    --limit '88' \
    --memberID '72Yxd93n' \
    --memberStatus 'aWj3SD9A' \
    --offset '16' \
    --order '0gjW0lIj' \
    --orderBy 'UZZmAAHJ' \
    --partyID 'gfbvlB1s' \
    --value 'ipzjcmRR' \
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
    --body '{"psn": {"clientId": "Co5U9Qle", "clientSecret": "wtrtp92z", "scope": "lrsiK1Jd"}}' \
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
    --sessionId '4v68EfBW' \
    > test.out 2>&1
eval_tap $? 33 'AdminReadSessionStorage' test.out

#- 34 AdminDeleteUserSessionStorage
./ng net.accelbyte.sdk.cli.Main session adminDeleteUserSessionStorage \
    --namespace "$AB_NAMESPACE" \
    --sessionId '4Md17xdj' \
    > test.out 2>&1
eval_tap $? 34 'AdminDeleteUserSessionStorage' test.out

#- 35 AdminReadUserSessionStorage
./ng net.accelbyte.sdk.cli.Main session adminReadUserSessionStorage \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'xSGm5ymw' \
    --userId '3s0tVWVP' \
    > test.out 2>&1
eval_tap $? 35 'AdminReadUserSessionStorage' test.out

#- 36 AdminQueryPlayerAttributes
./ng net.accelbyte.sdk.cli.Main session adminQueryPlayerAttributes \
    --namespace "$AB_NAMESPACE" \
    --users 'OMw75mP8' \
    > test.out 2>&1
eval_tap $? 36 'AdminQueryPlayerAttributes' test.out

#- 37 AdminGetPlayerAttributes
./ng net.accelbyte.sdk.cli.Main session adminGetPlayerAttributes \
    --namespace "$AB_NAMESPACE" \
    --userId 'Vd0b31oW' \
    > test.out 2>&1
eval_tap $? 37 'AdminGetPlayerAttributes' test.out

#- 38 CreateGameSession
./ng net.accelbyte.sdk.cli.Main session createGameSession \
    --namespace "$AB_NAMESPACE" \
    --body '{"attributes": {"7SOkvH12": {}, "0eoXJIuY": {}, "KWJmU8xa": {}}, "autoJoin": true, "backfillTicketID": "Tia4WCJL", "clientVersion": "qxnE2tij", "configurationName": "0Kivc0as", "deployment": "p5Nr6A8Y", "dsSource": "EePoRx2m", "fallbackClaimKeys": ["T3HRivVF", "qfOjnmuR", "5SnmZYF3"], "inactiveTimeout": 7, "inviteTimeout": 4, "joinability": "mtvdpczE", "matchPool": "OYfAUGSZ", "maxPlayers": 21, "minPlayers": 11, "preferredClaimKeys": ["FgMAn72I", "QsCOeUM0", "VX1phKcg"], "requestedRegions": ["Bidnt1km", "xId70zZ9", "pV7pwQHa"], "serverName": "UhiVbMaY", "teams": [{"UserIDs": ["oT0Gkkmx", "HGR5y0Xv", "5ybfveiz"], "parties": [{"partyID": "dhFAYgco", "userIDs": ["sQpAWcFt", "ZKQB51BR", "NkLHWpbO"]}, {"partyID": "x9uvpwPe", "userIDs": ["6XgTbCQG", "WoVWgDEM", "M2TLWGcI"]}, {"partyID": "Z3b41Sqi", "userIDs": ["t9zNeK7b", "yGAnvxqp", "EQsNBYjC"]}]}, {"UserIDs": ["VEou44Bw", "XxvsGwjB", "ZtWiGYf3"], "parties": [{"partyID": "iXIHTXcn", "userIDs": ["mLNZPefr", "sBpox3w0", "bt6DxP0s"]}, {"partyID": "TQGfzCvv", "userIDs": ["xLeAl4o2", "0cF6XLsZ", "zxNNiNMM"]}, {"partyID": "coi8t9Kf", "userIDs": ["Xxx3sdCJ", "GheasEmV", "oe0D6W6N"]}]}, {"UserIDs": ["R4unYcO6", "vV4k1qKj", "ZjIXzgFP"], "parties": [{"partyID": "mYaPdiOI", "userIDs": ["DWkM21Bq", "ClqoKXIe", "MdGLV1cy"]}, {"partyID": "7t1hywN8", "userIDs": ["LtSCfGip", "U0zCnDVi", "ySNP7KKX"]}, {"partyID": "3rrvpz1F", "userIDs": ["JG1RymDr", "dq3B3UIf", "vOopvpox"]}]}], "textChat": false, "ticketIDs": ["f2RKkvlD", "CvJvvzHz", "HAOhJglT"], "tieTeamsSessionLifetime": false, "type": "JrpyLqMM"}' \
    > test.out 2>&1
eval_tap $? 38 'CreateGameSession' test.out

#- 39 PublicQueryGameSessionsByAttributes
./ng net.accelbyte.sdk.cli.Main session publicQueryGameSessionsByAttributes \
    --namespace "$AB_NAMESPACE" \
    --body '{"o20I5RQB": {}, "Q57nazw7": {}, "YAiHL47g": {}}' \
    > test.out 2>&1
eval_tap $? 39 'PublicQueryGameSessionsByAttributes' test.out

#- 40 PublicSessionJoinCode
./ng net.accelbyte.sdk.cli.Main session publicSessionJoinCode \
    --namespace "$AB_NAMESPACE" \
    --body '{"code": "e48fk216"}' \
    > test.out 2>&1
eval_tap $? 40 'PublicSessionJoinCode' test.out

#- 41 GetGameSessionByPodName
./ng net.accelbyte.sdk.cli.Main session getGameSessionByPodName \
    --namespace "$AB_NAMESPACE" \
    --podName 'lIKm9zTh' \
    > test.out 2>&1
eval_tap $? 41 'GetGameSessionByPodName' test.out

#- 42 GetGameSession
./ng net.accelbyte.sdk.cli.Main session getGameSession \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'TtiGrsGv' \
    > test.out 2>&1
eval_tap $? 42 'GetGameSession' test.out

#- 43 UpdateGameSession
./ng net.accelbyte.sdk.cli.Main session updateGameSession \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'FkEK95qV' \
    --body '{"attributes": {"l9FLeywO": {}, "ILEwkQMI": {}, "6G6DQ1tY": {}}, "backfillTicketID": "GenWdqHQ", "clientVersion": "PXnWM1rN", "deployment": "N53sHxnJ", "fallbackClaimKeys": ["Zdxg13CL", "OTvqqXuO", "5nb1qf6U"], "inactiveTimeout": 88, "inviteTimeout": 70, "joinability": "ijNNIX38", "matchPool": "I5cf3pAk", "maxPlayers": 71, "minPlayers": 57, "preferredClaimKeys": ["2Nvp57SV", "EmKqym61", "kvGiV5oB"], "requestedRegions": ["11y38fOZ", "64rpuaJL", "BxCj3RWL"], "teams": [{"UserIDs": ["iqoYTqk3", "705AGssU", "FeX4XV4E"], "parties": [{"partyID": "qslChdUM", "userIDs": ["iQrO8Tqu", "XbMG8Scl", "J52PLICo"]}, {"partyID": "Z7ezc6Zq", "userIDs": ["ue5VkJTJ", "M2uOP0eP", "86jQsHXH"]}, {"partyID": "EEuSurio", "userIDs": ["2jhERXZW", "Ibm82NE3", "zJ2jUmMH"]}]}, {"UserIDs": ["alO4q1R1", "n4FFUZ5F", "tmM9173m"], "parties": [{"partyID": "4TgTcZk4", "userIDs": ["SUnftGUI", "F8uy4Xy4", "wgkXfntg"]}, {"partyID": "zwq06a0n", "userIDs": ["OgwzWSj0", "wxN26Is9", "3bWlwDlY"]}, {"partyID": "mTtjmW28", "userIDs": ["yl2NCOgT", "KFOPUhDW", "bAjRXRN3"]}]}, {"UserIDs": ["G6oAOdGd", "UKlhyR2r", "o8sYcQLm"], "parties": [{"partyID": "bkhEl3E2", "userIDs": ["aQGAGjiD", "iD4amAew", "ycXs7AFU"]}, {"partyID": "mGu2kixt", "userIDs": ["gbfvUN7X", "uRmqhMCk", "ZU6XuYn1"]}, {"partyID": "VRmHWbR7", "userIDs": ["OYrPUlgP", "gAzLsuIO", "XONJmVvR"]}]}], "ticketIDs": ["C6PdXSBM", "UuwWsb6G", "dDNCrPmP"], "tieTeamsSessionLifetime": true, "type": "6xrnk9kr", "version": 18}' \
    > test.out 2>&1
eval_tap $? 43 'UpdateGameSession' test.out

#- 44 DeleteGameSession
./ng net.accelbyte.sdk.cli.Main session deleteGameSession \
    --namespace "$AB_NAMESPACE" \
    --sessionId '9j0VoCTo' \
    > test.out 2>&1
eval_tap $? 44 'DeleteGameSession' test.out

#- 45 PatchUpdateGameSession
./ng net.accelbyte.sdk.cli.Main session patchUpdateGameSession \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'R8hENSYg' \
    --body '{"attributes": {"Tc3qUgN7": {}, "57yVYw8m": {}, "bRTpjN9t": {}}, "backfillTicketID": "32ddRLxl", "clientVersion": "4FlU7Bq7", "deployment": "4AThjQf7", "fallbackClaimKeys": ["JRtxOIsS", "NvD6r2Pt", "7clzlIbm"], "inactiveTimeout": 36, "inviteTimeout": 12, "joinability": "2ESYYauf", "matchPool": "UhLE4Z0F", "maxPlayers": 60, "minPlayers": 72, "preferredClaimKeys": ["B9Az9wcC", "oorf66GM", "JJFybtxW"], "requestedRegions": ["Ch9Vajqy", "MnjuxDQv", "lmfiFurO"], "teams": [{"UserIDs": ["uPtVKZHu", "1rmqkoy4", "M2lzT1tq"], "parties": [{"partyID": "PxGY19Pv", "userIDs": ["zoy0bbMq", "7rJqrJhb", "UJVA6Qrd"]}, {"partyID": "b2gQ666M", "userIDs": ["DDj0K5s0", "1TUiD4ih", "FmkOBof5"]}, {"partyID": "1GWhHEOw", "userIDs": ["eulh4aw3", "GceIrcUq", "HQS2YmYE"]}]}, {"UserIDs": ["Rz6lhfVo", "qugeVgn7", "JpL79bhC"], "parties": [{"partyID": "fRRFEcRE", "userIDs": ["W3Cnf8zR", "3XRD0K1M", "TvQoE2Lc"]}, {"partyID": "GKVBYj5j", "userIDs": ["KBxJyZ9P", "FaNExT49", "WWVWrWn1"]}, {"partyID": "DelCWiXl", "userIDs": ["jQ4UHyV6", "tAEn7r92", "RuEivW8w"]}]}, {"UserIDs": ["K8Yr8elv", "gNMdsNKO", "NpJezfT2"], "parties": [{"partyID": "wK2e1FM5", "userIDs": ["ET7DuRww", "YptwuPSL", "5i8rBK8Y"]}, {"partyID": "sBT2hscx", "userIDs": ["e5AIngTF", "toJyn7Wh", "BGEe3VKQ"]}, {"partyID": "PtgK9MSK", "userIDs": ["o3kjD7MP", "7W7T7m1T", "6S86XfnH"]}]}], "ticketIDs": ["gvvVzTRT", "jV6F58BI", "ZK9c7wIU"], "tieTeamsSessionLifetime": true, "type": "47qXajwS", "version": 69}' \
    > test.out 2>&1
eval_tap $? 45 'PatchUpdateGameSession' test.out

#- 46 UpdateGameSessionBackfillTicketID
./ng net.accelbyte.sdk.cli.Main session updateGameSessionBackfillTicketID \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'YOEFGAa5' \
    --body '{"backfillTicketID": "NZeuv8WQ"}' \
    > test.out 2>&1
eval_tap $? 46 'UpdateGameSessionBackfillTicketID' test.out

#- 47 GameSessionGenerateCode
./ng net.accelbyte.sdk.cli.Main session gameSessionGenerateCode \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'qaUAiEOz' \
    > test.out 2>&1
eval_tap $? 47 'GameSessionGenerateCode' test.out

#- 48 PublicRevokeGameSessionCode
./ng net.accelbyte.sdk.cli.Main session publicRevokeGameSessionCode \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'Dbv190q9' \
    > test.out 2>&1
eval_tap $? 48 'PublicRevokeGameSessionCode' test.out

#- 49 PublicGameSessionInvite
./ng net.accelbyte.sdk.cli.Main session publicGameSessionInvite \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'NrnQa8z8' \
    --body '{"platformID": "B9AHGYlY", "userID": "ShZuv0cW"}' \
    > test.out 2>&1
eval_tap $? 49 'PublicGameSessionInvite' test.out

#- 50 JoinGameSession
./ng net.accelbyte.sdk.cli.Main session joinGameSession \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'zuY8gqmQ' \
    > test.out 2>&1
eval_tap $? 50 'JoinGameSession' test.out

#- 51 PublicPromoteGameSessionLeader
./ng net.accelbyte.sdk.cli.Main session publicPromoteGameSessionLeader \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'mPdVxnc8' \
    --body '{"leaderID": "8apjlE0N"}' \
    > test.out 2>&1
eval_tap $? 51 'PublicPromoteGameSessionLeader' test.out

#- 52 LeaveGameSession
./ng net.accelbyte.sdk.cli.Main session leaveGameSession \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'AffRuRC0' \
    > test.out 2>&1
eval_tap $? 52 'LeaveGameSession' test.out

#- 53 PublicGameSessionReject
./ng net.accelbyte.sdk.cli.Main session publicGameSessionReject \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'EHt7gbZd' \
    > test.out 2>&1
eval_tap $? 53 'PublicGameSessionReject' test.out

#- 54 GetSessionServerSecret
./ng net.accelbyte.sdk.cli.Main session getSessionServerSecret \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'jP2GTE4i' \
    > test.out 2>&1
eval_tap $? 54 'GetSessionServerSecret' test.out

#- 55 AppendTeamGameSession
./ng net.accelbyte.sdk.cli.Main session appendTeamGameSession \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'lc1NRD1H' \
    --body '{"additionalMembers": [{"partyID": "aM80YIyr", "userIDs": ["EuQWmOLv", "oHk4OmAi", "HiZsfhz8"]}, {"partyID": "ezJ6XURf", "userIDs": ["97huXcDS", "5sUrUf6p", "mTo5mRFG"]}, {"partyID": "FX5T9Ihb", "userIDs": ["AqznmEjU", "gc5HXYIl", "y2C8fIvN"]}], "proposedTeams": [{"UserIDs": ["b2yJF7pY", "q9lwqyR8", "3Pcya0zJ"], "parties": [{"partyID": "vWLV9Zx2", "userIDs": ["o01KHvve", "zZHs16Tz", "ufvVe7bc"]}, {"partyID": "PomHJBlz", "userIDs": ["Daw0JFcA", "auECl6E3", "7NeT7mhT"]}, {"partyID": "ZBmJMveJ", "userIDs": ["b5pf0K5m", "HOSe9g4D", "InS2KhXh"]}]}, {"UserIDs": ["7hIff07u", "gS4csijh", "quLTUkUp"], "parties": [{"partyID": "sZUxhl1y", "userIDs": ["8Sy5sCSk", "AvOvQxdv", "kDUvwR9B"]}, {"partyID": "8qT5V72Q", "userIDs": ["9ZbgxL7o", "MNJnMSz1", "SpbmsLNV"]}, {"partyID": "Jpr6R5C8", "userIDs": ["7ke9VDqa", "GYmwg0xb", "faisXvGB"]}]}, {"UserIDs": ["3q5eGo68", "EQq6xX7O", "JxCbQcG4"], "parties": [{"partyID": "GuqvNavR", "userIDs": ["t646Ydp7", "ObZdpdjp", "fzZv9rXS"]}, {"partyID": "DqVoFaK7", "userIDs": ["KIyRMNng", "ggG87yhX", "xL9orMWS"]}, {"partyID": "cPxb5wG6", "userIDs": ["oghOg8vA", "g29RBVop", "KOpqzIim"]}]}], "version": 61}' \
    > test.out 2>&1
eval_tap $? 55 'AppendTeamGameSession' test.out

#- 56 PublicPartyJoinCode
./ng net.accelbyte.sdk.cli.Main session publicPartyJoinCode \
    --namespace "$AB_NAMESPACE" \
    --body '{"code": "uFf7zkva"}' \
    > test.out 2>&1
eval_tap $? 56 'PublicPartyJoinCode' test.out

#- 57 PublicGetParty
./ng net.accelbyte.sdk.cli.Main session publicGetParty \
    --namespace "$AB_NAMESPACE" \
    --partyId '1kn7f7KW' \
    > test.out 2>&1
eval_tap $? 57 'PublicGetParty' test.out

#- 58 PublicUpdateParty
./ng net.accelbyte.sdk.cli.Main session publicUpdateParty \
    --namespace "$AB_NAMESPACE" \
    --partyId 'XPzVGdJV' \
    --body '{"attributes": {"66klg9Lf": {}, "EGvbRaWq": {}, "w9l2Pz2M": {}}, "inactiveTimeout": 70, "inviteTimeout": 13, "joinability": "mLYhoWJz", "maxPlayers": 94, "minPlayers": 89, "type": "OxIuuCov", "version": 59}' \
    > test.out 2>&1
eval_tap $? 58 'PublicUpdateParty' test.out

#- 59 PublicPatchUpdateParty
./ng net.accelbyte.sdk.cli.Main session publicPatchUpdateParty \
    --namespace "$AB_NAMESPACE" \
    --partyId 'xLBSdatx' \
    --body '{"attributes": {"EHm4PCah": {}, "LDbugPOg": {}, "fYLPUv6C": {}}, "inactiveTimeout": 48, "inviteTimeout": 74, "joinability": "H7RVI0vW", "maxPlayers": 58, "minPlayers": 24, "type": "H0UgiXKi", "version": 25}' \
    > test.out 2>&1
eval_tap $? 59 'PublicPatchUpdateParty' test.out

#- 60 PublicGeneratePartyCode
./ng net.accelbyte.sdk.cli.Main session publicGeneratePartyCode \
    --namespace "$AB_NAMESPACE" \
    --partyId '95Sj4Jlv' \
    > test.out 2>&1
eval_tap $? 60 'PublicGeneratePartyCode' test.out

#- 61 PublicRevokePartyCode
./ng net.accelbyte.sdk.cli.Main session publicRevokePartyCode \
    --namespace "$AB_NAMESPACE" \
    --partyId 'BhsocuLl' \
    > test.out 2>&1
eval_tap $? 61 'PublicRevokePartyCode' test.out

#- 62 PublicPartyInvite
./ng net.accelbyte.sdk.cli.Main session publicPartyInvite \
    --namespace "$AB_NAMESPACE" \
    --partyId 'ZjIxEFzN' \
    --body '{"platformID": "JnjEUR9g", "userID": "qMYTLQ6K"}' \
    > test.out 2>&1
eval_tap $? 62 'PublicPartyInvite' test.out

#- 63 PublicPromotePartyLeader
./ng net.accelbyte.sdk.cli.Main session publicPromotePartyLeader \
    --namespace "$AB_NAMESPACE" \
    --partyId 'r8DkXH1D' \
    --body '{"leaderID": "P5VI4tGq"}' \
    > test.out 2>&1
eval_tap $? 63 'PublicPromotePartyLeader' test.out

#- 64 PublicPartyJoin
./ng net.accelbyte.sdk.cli.Main session publicPartyJoin \
    --namespace "$AB_NAMESPACE" \
    --partyId 'gFNeXumm' \
    > test.out 2>&1
eval_tap $? 64 'PublicPartyJoin' test.out

#- 65 PublicPartyLeave
./ng net.accelbyte.sdk.cli.Main session publicPartyLeave \
    --namespace "$AB_NAMESPACE" \
    --partyId 'C3IJRLgs' \
    > test.out 2>&1
eval_tap $? 65 'PublicPartyLeave' test.out

#- 66 PublicPartyReject
./ng net.accelbyte.sdk.cli.Main session publicPartyReject \
    --namespace "$AB_NAMESPACE" \
    --partyId 'KTpnNarF' \
    > test.out 2>&1
eval_tap $? 66 'PublicPartyReject' test.out

#- 67 PublicPartyKick
./ng net.accelbyte.sdk.cli.Main session publicPartyKick \
    --namespace "$AB_NAMESPACE" \
    --partyId 'wClfQXyg' \
    --userId 'Q6WDwgIh' \
    > test.out 2>&1
eval_tap $? 67 'PublicPartyKick' test.out

#- 68 PublicCreateParty
./ng net.accelbyte.sdk.cli.Main session publicCreateParty \
    --namespace "$AB_NAMESPACE" \
    --body '{"attributes": {"sOJ3sgc4": {}, "FJon6pak": {}, "nofOy5fF": {}}, "configurationName": "t7eiFra4", "inactiveTimeout": 28, "inviteTimeout": 57, "joinability": "GX4Ue34B", "maxPlayers": 8, "members": [{"ID": "sCjlhmbd", "PlatformID": "WqYjqU9x", "PlatformUserID": "pZH1Xekj"}, {"ID": "YNX2FCGn", "PlatformID": "7bTxbr4G", "PlatformUserID": "aTZL3zI7"}, {"ID": "5pPArECF", "PlatformID": "23FY1f0h", "PlatformUserID": "CLiwK4Jm"}], "minPlayers": 52, "textChat": false, "type": "QkAYXPg8"}' \
    > test.out 2>&1
eval_tap $? 68 'PublicCreateParty' test.out

#- 69 PublicGetRecentPlayer
./ng net.accelbyte.sdk.cli.Main session publicGetRecentPlayer \
    --namespace "$AB_NAMESPACE" \
    --limit '79' \
    --userId 'GS4VAlne' \
    > test.out 2>&1
eval_tap $? 69 'PublicGetRecentPlayer' test.out

#- 70 PublicUpdateInsertSessionStorageLeader
./ng net.accelbyte.sdk.cli.Main session publicUpdateInsertSessionStorageLeader \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'MedabOPF' \
    --body '{"kAyHsP7j": {}, "mHX5NOR0": {}, "RBSmFY2H": {}}' \
    > test.out 2>&1
eval_tap $? 70 'PublicUpdateInsertSessionStorageLeader' test.out

#- 71 PublicUpdateInsertSessionStorage
./ng net.accelbyte.sdk.cli.Main session publicUpdateInsertSessionStorage \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'QuBPBmu2' \
    --userId 'hHkBKhf2' \
    --body '{"g38vxL8M": {}, "OHTwKudT": {}, "ekJLIfOL": {}}' \
    > test.out 2>&1
eval_tap $? 71 'PublicUpdateInsertSessionStorage' test.out

#- 72 PublicGetBulkPlayerCurrentPlatform
./ng net.accelbyte.sdk.cli.Main session publicGetBulkPlayerCurrentPlatform \
    --namespace "$AB_NAMESPACE" \
    --body '{"userIDs": ["GIi37ijo", "lT6y3MQn", "db81HzyY"]}' \
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
    --body '{"crossplayEnabled": true, "currentPlatform": "VBaw6iid", "data": {"OHmGDfCN": {}, "Q96IHazC": {}, "u6bIlfEB": {}}, "platforms": [{"name": "EsB6WnYx", "userID": "ZNtJupVi"}, {"name": "E8rI9jvZ", "userID": "xPTP7Z1F"}, {"name": "Xtd2I0j0", "userID": "xqMwoyBF"}], "roles": ["YeuI468e", "srDOVCbm", "VbLuEZoE"]}' \
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
    --order 'l3bTrKle' \
    --orderBy 'U7ppirxt' \
    --status 'V4CV0Gpl' \
    > test.out 2>&1
eval_tap $? 76 'PublicQueryMyGameSessions' test.out

#- 77 PublicQueryMyParties
./ng net.accelbyte.sdk.cli.Main session publicQueryMyParties \
    --namespace "$AB_NAMESPACE" \
    --order 'GcpbPr8S' \
    --orderBy 'QjPeZlsw' \
    --status 'onlcRm9v' \
    > test.out 2>&1
eval_tap $? 77 'PublicQueryMyParties' test.out


rm -f "tmp.dat"

exit $EXIT_CODE