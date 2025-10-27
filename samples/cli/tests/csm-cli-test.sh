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
echo "1..67"

#- 1 Login
./ng net.accelbyte.sdk.cli.Main loginClient \
    > test.out 2>&1
eval_tap $? 1 'Login' test.out

if [ $EXIT_CODE -ne 0 ]; then
  echo "Bail out! Login failed."
  exit $EXIT_CODE
fi

touch "tmp.dat"

#- 2 GetAppListV1
eval_tap 0 2 'GetAppListV1 # SKIP deprecated' test.out

#- 3 GetAppV1
eval_tap 0 3 'GetAppV1 # SKIP deprecated' test.out

#- 4 CreateAppV1
eval_tap 0 4 'CreateAppV1 # SKIP deprecated' test.out

#- 5 DeleteAppV1
eval_tap 0 5 'DeleteAppV1 # SKIP deprecated' test.out

#- 6 UpdateAppV1
eval_tap 0 6 'UpdateAppV1 # SKIP deprecated' test.out

#- 7 CreateDeploymentV1
eval_tap 0 7 'CreateDeploymentV1 # SKIP deprecated' test.out

#- 8 GetAppImageListV1
eval_tap 0 8 'GetAppImageListV1 # SKIP deprecated' test.out

#- 9 DeleteAppImagesV1
eval_tap 0 9 'DeleteAppImagesV1 # SKIP deprecated' test.out

#- 10 GetAppReleaseV1
./ng net.accelbyte.sdk.cli.Main csm getAppReleaseV1 \
    --app 'G278nnLX' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 10 'GetAppReleaseV1' test.out

#- 11 GetListOfSecretsV1
eval_tap 0 11 'GetListOfSecretsV1 # SKIP deprecated' test.out

#- 12 SaveSecretV1
eval_tap 0 12 'SaveSecretV1 # SKIP deprecated' test.out

#- 13 UpdateSecretV1
eval_tap 0 13 'UpdateSecretV1 # SKIP deprecated' test.out

#- 14 DeleteSecretV1
eval_tap 0 14 'DeleteSecretV1 # SKIP deprecated' test.out

#- 15 StartAppV1
eval_tap 0 15 'StartAppV1 # SKIP deprecated' test.out

#- 16 StopAppV1
eval_tap 0 16 'StopAppV1 # SKIP deprecated' test.out

#- 17 GetListOfVariablesV1
eval_tap 0 17 'GetListOfVariablesV1 # SKIP deprecated' test.out

#- 18 SaveVariableV1
eval_tap 0 18 'SaveVariableV1 # SKIP deprecated' test.out

#- 19 UpdateVariableV1
eval_tap 0 19 'UpdateVariableV1 # SKIP deprecated' test.out

#- 20 DeleteVariableV1
eval_tap 0 20 'DeleteVariableV1 # SKIP deprecated' test.out

#- 21 GetListOfDeploymentV1
eval_tap 0 21 'GetListOfDeploymentV1 # SKIP deprecated' test.out

#- 22 GetDeploymentV1
eval_tap 0 22 'GetDeploymentV1 # SKIP deprecated' test.out

#- 23 DeleteDeploymentV1
eval_tap 0 23 'DeleteDeploymentV1 # SKIP deprecated' test.out

#- 24 PublicGetMessages
./ng net.accelbyte.sdk.cli.Main csm publicGetMessages \
    > test.out 2>&1
eval_tap $? 24 'PublicGetMessages' test.out

#- 25 GetAppListV2
./ng net.accelbyte.sdk.cli.Main csm getAppListV2 \
    --namespace "$AB_NAMESPACE" \
    --limit '88' \
    --offset '26' \
    --body '{"appNames": ["FhQe91rI", "o92DBzLn", "nsIuftig"], "appStatuses": ["Mxt573AJ", "n2w2xWiI", "pcjmZAUE"], "fuzzyAppName": "gnH9nG4G", "scenario": "tTAt7YKG"}' \
    > test.out 2>&1
eval_tap $? 25 'GetAppListV2' test.out

#- 26 GetAppV2
./ng net.accelbyte.sdk.cli.Main csm getAppV2 \
    --app '0j46csw0' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 26 'GetAppV2' test.out

#- 27 CreateAppV2
./ng net.accelbyte.sdk.cli.Main csm createAppV2 \
    --app 'qNeHduuq' \
    --namespace "$AB_NAMESPACE" \
    --body '{"autoscaling": {"targetCPUUtilizationPercent": 64}, "cpu": {"requestCPU": 15}, "description": "IgPZEMCp", "memory": {"requestMemory": 44}, "replica": {"maxReplica": 45, "minReplica": 43}, "scenario": "fOPfmci4", "vmSharingConfiguration": "92ezoAOc"}' \
    > test.out 2>&1
eval_tap $? 27 'CreateAppV2' test.out

#- 28 DeleteAppV2
./ng net.accelbyte.sdk.cli.Main csm deleteAppV2 \
    --app 'bG1EKFyz' \
    --namespace "$AB_NAMESPACE" \
    --forced 'ihFtdKGx' \
    > test.out 2>&1
eval_tap $? 28 'DeleteAppV2' test.out

#- 29 UpdateAppV2
./ng net.accelbyte.sdk.cli.Main csm updateAppV2 \
    --app 'RUTcFaKG' \
    --namespace "$AB_NAMESPACE" \
    --body '{"description": "ViAR0Msa"}' \
    > test.out 2>&1
eval_tap $? 29 'UpdateAppV2' test.out

#- 30 CreateDeploymentV2
./ng net.accelbyte.sdk.cli.Main csm createDeploymentV2 \
    --app 'M9Qxz0ea' \
    --namespace "$AB_NAMESPACE" \
    --body '{"imageTag": "40DPGsQL"}' \
    > test.out 2>&1
eval_tap $? 30 'CreateDeploymentV2' test.out

#- 31 GetAppImageListV2
./ng net.accelbyte.sdk.cli.Main csm getAppImageListV2 \
    --app 'v3aDPaQr' \
    --namespace "$AB_NAMESPACE" \
    --cached 'op40R5Ct' \
    > test.out 2>&1
eval_tap $? 31 'GetAppImageListV2' test.out

#- 32 DeleteAppImagesV2
./ng net.accelbyte.sdk.cli.Main csm deleteAppImagesV2 \
    --app 'ofJPB7yG' \
    --namespace "$AB_NAMESPACE" \
    --body '{"imageTags": ["U0RFdwwN", "ko5FYeLP", "z4Slivud"]}' \
    > test.out 2>&1
eval_tap $? 32 'DeleteAppImagesV2' test.out

#- 33 CreateNoSQLDatabaseCredentialV2
./ng net.accelbyte.sdk.cli.Main csm createNoSQLDatabaseCredentialV2 \
    --app 'OHYunukZ' \
    --namespace "$AB_NAMESPACE" \
    --body '{"password": "6ljTKrSc", "username": "omv5kdHf"}' \
    > test.out 2>&1
eval_tap $? 33 'CreateNoSQLDatabaseCredentialV2' test.out

#- 34 GetNoSQLDatabaseV2
./ng net.accelbyte.sdk.cli.Main csm getNoSQLDatabaseV2 \
    --app 'jK6jDxoB' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 34 'GetNoSQLDatabaseV2' test.out

#- 35 CreateNoSQLDatabaseV2
./ng net.accelbyte.sdk.cli.Main csm createNoSQLDatabaseV2 \
    --app 'Ac23603s' \
    --namespace "$AB_NAMESPACE" \
    --body '{"dbName": "fgDi8XbQ", "password": "Niev0oGU", "username": "2Ryncqi4"}' \
    > test.out 2>&1
eval_tap $? 35 'CreateNoSQLDatabaseV2' test.out

#- 36 DeleteNoSQLDatabaseV2
./ng net.accelbyte.sdk.cli.Main csm deleteNoSQLDatabaseV2 \
    --app 'JBAi8jTI' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 36 'DeleteNoSQLDatabaseV2' test.out

#- 37 UpdateAppResourcesV2
./ng net.accelbyte.sdk.cli.Main csm updateAppResourcesV2 \
    --app 'eUT94ebm' \
    --namespace "$AB_NAMESPACE" \
    --body '{"autoscaling": {"targetCPUUtilizationPercent": 74}, "cpu": {"requestCPU": 81}, "memory": {"requestMemory": 47}, "replica": {"maxReplica": 74, "minReplica": 66}, "vmSharingConfiguration": "k2i9S79Q"}' \
    > test.out 2>&1
eval_tap $? 37 'UpdateAppResourcesV2' test.out

#- 38 UpdateAppResourcesResourceLimitFormV2
./ng net.accelbyte.sdk.cli.Main csm updateAppResourcesResourceLimitFormV2 \
    --app 'ztxNFgje' \
    --namespace "$AB_NAMESPACE" \
    --body '{"clientEmail": "9btQm8Tm", "preferredLimitReplica": 17, "requestReason": "zJb776Wd"}' \
    > test.out 2>&1
eval_tap $? 38 'UpdateAppResourcesResourceLimitFormV2' test.out

#- 39 GetListOfSecretsV2
./ng net.accelbyte.sdk.cli.Main csm getListOfSecretsV2 \
    --app 'nHe7jBQv' \
    --namespace "$AB_NAMESPACE" \
    --limit '90' \
    --offset '9' \
    > test.out 2>&1
eval_tap $? 39 'GetListOfSecretsV2' test.out

#- 40 SaveSecretV2
./ng net.accelbyte.sdk.cli.Main csm saveSecretV2 \
    --app 'YBSFs9Du' \
    --namespace "$AB_NAMESPACE" \
    --body '{"configName": "5enn1Qyw", "description": "CzpTwvqU", "source": "5FWgFkCU", "value": "2Fb4PAJW"}' \
    > test.out 2>&1
eval_tap $? 40 'SaveSecretV2' test.out

#- 41 UpdateSecretV2
./ng net.accelbyte.sdk.cli.Main csm updateSecretV2 \
    --app 'MpXnbOPO' \
    --configId 'df6jDuig' \
    --namespace "$AB_NAMESPACE" \
    --body '{"description": "h6gpoe50", "value": "tkbvzDcM"}' \
    > test.out 2>&1
eval_tap $? 41 'UpdateSecretV2' test.out

#- 42 DeleteSecretV2
./ng net.accelbyte.sdk.cli.Main csm deleteSecretV2 \
    --app 'zNrDpK0V' \
    --configId 'uJXGn6Ao' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 42 'DeleteSecretV2' test.out

#- 43 StartAppV2
./ng net.accelbyte.sdk.cli.Main csm startAppV2 \
    --app 'XdaghSSm' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 43 'StartAppV2' test.out

#- 44 StopAppV2
./ng net.accelbyte.sdk.cli.Main csm stopAppV2 \
    --app 'lGv4lhof' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 44 'StopAppV2' test.out

#- 45 GetNotificationSubscriberListV2
./ng net.accelbyte.sdk.cli.Main csm getNotificationSubscriberListV2 \
    --app 'Lsbb6vWU' \
    --namespace "$AB_NAMESPACE" \
    --notificationType 'TiTmReqn' \
    > test.out 2>&1
eval_tap $? 45 'GetNotificationSubscriberListV2' test.out

#- 46 BulkSaveSubscriptionAppNotificationV2
./ng net.accelbyte.sdk.cli.Main csm bulkSaveSubscriptionAppNotificationV2 \
    --app 'apSIYUq0' \
    --namespace "$AB_NAMESPACE" \
    --body '{"subscribers": [{"emailAddress": "zemPujoR", "notificationType": {"oyKJ0UGL": false, "D58Tg9t1": false, "gIFbD5Ml": true}, "userId": "nMwSD94T"}, {"emailAddress": "P2mlxuyC", "notificationType": {"quChp4tW": true, "2gV5a5GF": false, "mit0UmkT": false}, "userId": "VO3Vgy27"}, {"emailAddress": "gjBOZM4X", "notificationType": {"SKTqs3mk": false, "EHPgSSV0": false, "DKNZNmbD": false}, "userId": "bKPEP3Lq"}]}' \
    > test.out 2>&1
eval_tap $? 46 'BulkSaveSubscriptionAppNotificationV2' test.out

#- 47 SubscribeAppNotificationV2
./ng net.accelbyte.sdk.cli.Main csm subscribeAppNotificationV2 \
    --app 'lIqHPbfC' \
    --namespace "$AB_NAMESPACE" \
    --body '{"notificationType": "fJJsxXhc", "subscribers": [{"emailAddress": "2gziFtcN", "userId": "L9ylFKjS"}, {"emailAddress": "SeUajn4i", "userId": "FeV3Kv9m"}, {"emailAddress": "Zdwa8j02", "userId": "sfTds79q"}]}' \
    > test.out 2>&1
eval_tap $? 47 'SubscribeAppNotificationV2' test.out

#- 48 GetSubscriptionV2Handler
./ng net.accelbyte.sdk.cli.Main csm getSubscriptionV2Handler \
    --app '3yJeUMzk' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 48 'GetSubscriptionV2Handler' test.out

#- 49 SubscribeV2Handler
./ng net.accelbyte.sdk.cli.Main csm subscribeV2Handler \
    --app 'vSkegv4F' \
    --namespace "$AB_NAMESPACE" \
    --body '{"notificationType": "6gSlYK8w"}' \
    > test.out 2>&1
eval_tap $? 49 'SubscribeV2Handler' test.out

#- 50 UnsubscribeV2Handler
./ng net.accelbyte.sdk.cli.Main csm unsubscribeV2Handler \
    --app 'VkZQqz5c' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 50 'UnsubscribeV2Handler' test.out

#- 51 DeleteSubscriptionAppNotificationByUserIDV2
./ng net.accelbyte.sdk.cli.Main csm deleteSubscriptionAppNotificationByUserIDV2 \
    --app 'OiKhkkuj' \
    --namespace "$AB_NAMESPACE" \
    --userId 'OXVHopvE' \
    > test.out 2>&1
eval_tap $? 51 'DeleteSubscriptionAppNotificationByUserIDV2' test.out

#- 52 DeleteSubscriptionAppNotificationV2
eval_tap 0 52 'DeleteSubscriptionAppNotificationV2 # SKIP deprecated' test.out

#- 53 GetListOfVariablesV2
./ng net.accelbyte.sdk.cli.Main csm getListOfVariablesV2 \
    --app 'g3KZH4q9' \
    --namespace "$AB_NAMESPACE" \
    --limit '72' \
    --offset '33' \
    > test.out 2>&1
eval_tap $? 53 'GetListOfVariablesV2' test.out

#- 54 SaveVariableV2
./ng net.accelbyte.sdk.cli.Main csm saveVariableV2 \
    --app 'shBbtIZG' \
    --namespace "$AB_NAMESPACE" \
    --body '{"applyMask": true, "configName": "JWXfzL1i", "description": "wzvN4NXR", "source": "tgBtWSD5", "value": "CQIfkn5u"}' \
    > test.out 2>&1
eval_tap $? 54 'SaveVariableV2' test.out

#- 55 UpdateVariableV2
./ng net.accelbyte.sdk.cli.Main csm updateVariableV2 \
    --app 'vDzzoem9' \
    --configId 'OTnUXfWE' \
    --namespace "$AB_NAMESPACE" \
    --body '{"applyMask": true, "description": "kk9pcpQJ", "value": "rmJSLPSV"}' \
    > test.out 2>&1
eval_tap $? 55 'UpdateVariableV2' test.out

#- 56 DeleteVariableV2
./ng net.accelbyte.sdk.cli.Main csm deleteVariableV2 \
    --app '8lSoYYok' \
    --configId 'uRW29t1H' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 56 'DeleteVariableV2' test.out

#- 57 GetListOfDeploymentV2
./ng net.accelbyte.sdk.cli.Main csm getListOfDeploymentV2 \
    --namespace "$AB_NAMESPACE" \
    --limit '52' \
    --offset '44' \
    --body '{"appIds": ["x4Tq8BGT", "Mb2ceIle", "WfwOp0V5"], "deploymentIds": ["d7rwIw7W", "WH98phP4", "28QY4dyd"], "statuses": ["v3rHFLa0", "94NfSs3R", "7kIFfEMP"]}' \
    > test.out 2>&1
eval_tap $? 57 'GetListOfDeploymentV2' test.out

#- 58 GetDeploymentV2
./ng net.accelbyte.sdk.cli.Main csm getDeploymentV2 \
    --deploymentId 'V0j7yUn0' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 58 'GetDeploymentV2' test.out

#- 59 DeleteDeploymentV2
./ng net.accelbyte.sdk.cli.Main csm deleteDeploymentV2 \
    --deploymentId '4lGOOhRj' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 59 'DeleteDeploymentV2' test.out

#- 60 GetNoSQLClusterV2
./ng net.accelbyte.sdk.cli.Main csm getNoSQLClusterV2 \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 60 'GetNoSQLClusterV2' test.out

#- 61 UpdateNoSQLClusterV2
./ng net.accelbyte.sdk.cli.Main csm updateNoSQLClusterV2 \
    --namespace "$AB_NAMESPACE" \
    --body '{"maxDCU": 0.5480822050418972, "minDCU": 0.8862995721145214, "profileName": "Nk1s9Ewk"}' \
    > test.out 2>&1
eval_tap $? 61 'UpdateNoSQLClusterV2' test.out

#- 62 CreateNoSQLClusterV2
./ng net.accelbyte.sdk.cli.Main csm createNoSQLClusterV2 \
    --namespace "$AB_NAMESPACE" \
    --body '{"maxDCU": 0.4348034084615139, "minDCU": 0.3881405281607828, "profileName": "Px83Rf8I"}' \
    > test.out 2>&1
eval_tap $? 62 'CreateNoSQLClusterV2' test.out

#- 63 DeleteNoSQLClusterV2
./ng net.accelbyte.sdk.cli.Main csm deleteNoSQLClusterV2 \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 63 'DeleteNoSQLClusterV2' test.out

#- 64 GetNoSQLAccessTunnelV2
./ng net.accelbyte.sdk.cli.Main csm getNoSQLAccessTunnelV2 \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 64 'GetNoSQLAccessTunnelV2' test.out

#- 65 GetResourcesLimits
./ng net.accelbyte.sdk.cli.Main csm getResourcesLimits \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 65 'GetResourcesLimits' test.out

#- 66 GetNotificationSubscriberListV3
./ng net.accelbyte.sdk.cli.Main csm getNotificationSubscriberListV3 \
    --app 'Z03snE0T' \
    --namespace "$AB_NAMESPACE" \
    --notificationType '4FHov28H' \
    > test.out 2>&1
eval_tap $? 66 'GetNotificationSubscriberListV3' test.out

#- 67 DeleteSubscriptionAppNotificationV3
./ng net.accelbyte.sdk.cli.Main csm deleteSubscriptionAppNotificationV3 \
    --app '7A4O35eW' \
    --namespace "$AB_NAMESPACE" \
    --emailAddress 'BP7YXAZW' \
    --userId 'sJ69lpxR' \
    > test.out 2>&1
eval_tap $? 67 'DeleteSubscriptionAppNotificationV3' test.out


rm -f "tmp.dat"

exit $EXIT_CODE