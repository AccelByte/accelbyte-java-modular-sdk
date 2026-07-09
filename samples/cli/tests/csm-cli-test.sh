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
echo "1..108"

#- 1 Login
./ng net.accelbyte.sdk.cli.Main loginClient \
    > test.out 2>&1
eval_tap $? 1 'Login' test.out

if [ $EXIT_CODE -ne 0 ]; then
  echo "Bail out! Login failed."
  exit $EXIT_CODE
fi

touch "tmp.dat"

#- 2 ListAppUI
./ng net.accelbyte.sdk.cli.Main csm listAppUI \
    --namespace "$AB_NAMESPACE" \
    --limit '28' \
    --name 'pITLaICw' \
    --offset '6' \
    > test.out 2>&1
eval_tap $? 2 'ListAppUI' test.out

#- 3 CreateAppUI
./ng net.accelbyte.sdk.cli.Main csm createAppUI \
    --namespace "$AB_NAMESPACE" \
    --body '{"name": "qGC4VG48"}' \
    > test.out 2>&1
eval_tap $? 3 'CreateAppUI' test.out

#- 4 DeleteAppUI
./ng net.accelbyte.sdk.cli.Main csm deleteAppUI \
    --appUiName 'TcGNZ7L3' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 4 'DeleteAppUI' test.out

#- 5 UploadAppUIFile
./ng net.accelbyte.sdk.cli.Main csm uploadAppUIFile \
    --appUiName 'A3WS5D6A' \
    --namespace "$AB_NAMESPACE" \
    --version 'gy5Dkm7a' \
    --file 'tmp.dat' \
    > test.out 2>&1
eval_tap $? 5 'UploadAppUIFile' test.out

#- 6 GetAppListV1
eval_tap 0 6 'GetAppListV1 # SKIP deprecated' test.out

#- 7 GetAppV1
eval_tap 0 7 'GetAppV1 # SKIP deprecated' test.out

#- 8 CreateAppV1
eval_tap 0 8 'CreateAppV1 # SKIP deprecated' test.out

#- 9 DeleteAppV1
eval_tap 0 9 'DeleteAppV1 # SKIP deprecated' test.out

#- 10 UpdateAppV1
eval_tap 0 10 'UpdateAppV1 # SKIP deprecated' test.out

#- 11 CreateDeploymentV1
eval_tap 0 11 'CreateDeploymentV1 # SKIP deprecated' test.out

#- 12 GetAppImageListV1
eval_tap 0 12 'GetAppImageListV1 # SKIP deprecated' test.out

#- 13 DeleteAppImagesV1
eval_tap 0 13 'DeleteAppImagesV1 # SKIP deprecated' test.out

#- 14 GetAppReleaseV1
./ng net.accelbyte.sdk.cli.Main csm getAppReleaseV1 \
    --app '9uw1n8Mw' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 14 'GetAppReleaseV1' test.out

#- 15 GetListOfSecretsV1
eval_tap 0 15 'GetListOfSecretsV1 # SKIP deprecated' test.out

#- 16 SaveSecretV1
eval_tap 0 16 'SaveSecretV1 # SKIP deprecated' test.out

#- 17 UpdateSecretV1
eval_tap 0 17 'UpdateSecretV1 # SKIP deprecated' test.out

#- 18 DeleteSecretV1
eval_tap 0 18 'DeleteSecretV1 # SKIP deprecated' test.out

#- 19 StartAppV1
eval_tap 0 19 'StartAppV1 # SKIP deprecated' test.out

#- 20 StopAppV1
eval_tap 0 20 'StopAppV1 # SKIP deprecated' test.out

#- 21 GetListOfVariablesV1
eval_tap 0 21 'GetListOfVariablesV1 # SKIP deprecated' test.out

#- 22 SaveVariableV1
eval_tap 0 22 'SaveVariableV1 # SKIP deprecated' test.out

#- 23 UpdateVariableV1
eval_tap 0 23 'UpdateVariableV1 # SKIP deprecated' test.out

#- 24 DeleteVariableV1
eval_tap 0 24 'DeleteVariableV1 # SKIP deprecated' test.out

#- 25 GetListOfDeploymentV1
eval_tap 0 25 'GetListOfDeploymentV1 # SKIP deprecated' test.out

#- 26 GetDeploymentV1
eval_tap 0 26 'GetDeploymentV1 # SKIP deprecated' test.out

#- 27 DeleteDeploymentV1
eval_tap 0 27 'DeleteDeploymentV1 # SKIP deprecated' test.out

#- 28 GetExtendFile
./ng net.accelbyte.sdk.cli.Main csm getExtendFile \
    --filePath '2No3ZsTl' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 28 'GetExtendFile' test.out

#- 29 PublicGetMessages
./ng net.accelbyte.sdk.cli.Main csm publicGetMessages \
    > test.out 2>&1
eval_tap $? 29 'PublicGetMessages' test.out

#- 30 GetAppListV2
./ng net.accelbyte.sdk.cli.Main csm getAppListV2 \
    --namespace "$AB_NAMESPACE" \
    --limit '4' \
    --offset '38' \
    --body '{"appNames": ["kRvfkDDj", "yGRxzmxF", "8euQMQN5"], "appStatuses": ["e5VQjWrY", "p8UXvOae", "rawWr3S0"], "fuzzyAppName": "yv2ZAQUm", "scenario": "qhf60y7t"}' \
    > test.out 2>&1
eval_tap $? 30 'GetAppListV2' test.out

#- 31 GetAppV2
./ng net.accelbyte.sdk.cli.Main csm getAppV2 \
    --app 'MsYaDrG6' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 31 'GetAppV2' test.out

#- 32 CreateAppV2
eval_tap 0 32 'CreateAppV2 # SKIP deprecated' test.out

#- 33 DeleteAppV2
./ng net.accelbyte.sdk.cli.Main csm deleteAppV2 \
    --app 'HbRtMnSX' \
    --namespace "$AB_NAMESPACE" \
    --forced '7zgJm9yo' \
    > test.out 2>&1
eval_tap $? 33 'DeleteAppV2' test.out

#- 34 UpdateAppV2
./ng net.accelbyte.sdk.cli.Main csm updateAppV2 \
    --app 'rpKYOzJ6' \
    --namespace "$AB_NAMESPACE" \
    --body '{"description": "92yRykCb", "enableDebugMode": false}' \
    > test.out 2>&1
eval_tap $? 34 'UpdateAppV2' test.out

#- 35 ApplyAppConfigV2
./ng net.accelbyte.sdk.cli.Main csm applyAppConfigV2 \
    --app 'XjZUVc7Q' \
    --namespace "$AB_NAMESPACE" \
    --body '{"autoscaling": {"targetCPUUtilizationPercent": 92}, "cpu": {"requestCPU": 67}, "description": "9vlPJXM3", "memory": {"requestMemory": 51}, "permissions": [{"action": 14, "resource": "3hSV5ogP"}, {"action": 12, "resource": "YN12LDbx"}, {"action": 23, "resource": "2dacldUM"}], "replica": {"maxReplica": 11, "minReplica": 15}, "scenario": "zG2fFYSW", "secrets": [{"name": "w7XX9gJW", "value": "fOxDyNL4"}, {"name": "KDZcS8uN", "value": "ZCHNzaEC"}, {"name": "by5sLMjn", "value": "FeL3bTbq"}], "variables": [{"name": "vLxTlUcg", "value": "L7wTwQLO"}, {"name": "tjD0hKPM", "value": "ZUIyK9Zx"}, {"name": "MQtNoyUV", "value": "HUZJXYPW"}], "vmSharingConfiguration": "xASSVgbm"}' \
    > test.out 2>&1
eval_tap $? 35 'ApplyAppConfigV2' test.out

#- 36 CreateSubscriptionHandler
./ng net.accelbyte.sdk.cli.Main csm createSubscriptionHandler \
    --app 'gRawpCmF' \
    --namespace "$AB_NAMESPACE" \
    --body '{"topicNames": ["KJW1VNdG", "aexCIf6y", "vIUMmd62"]}' \
    > test.out 2>&1
eval_tap $? 36 'CreateSubscriptionHandler' test.out

#- 37 UnsubscribeTopicHandler
./ng net.accelbyte.sdk.cli.Main csm unsubscribeTopicHandler \
    --app 'D7WptAI9' \
    --namespace "$AB_NAMESPACE" \
    --topicName 'TolJQBnC' \
    > test.out 2>&1
eval_tap $? 37 'UnsubscribeTopicHandler' test.out

#- 38 CreateDeploymentV2
./ng net.accelbyte.sdk.cli.Main csm createDeploymentV2 \
    --app '5IoanIOr' \
    --namespace "$AB_NAMESPACE" \
    --body '{"imageTag": "CnAZ6pnm"}' \
    > test.out 2>&1
eval_tap $? 38 'CreateDeploymentV2' test.out

#- 39 GetAppImageListV2
./ng net.accelbyte.sdk.cli.Main csm getAppImageListV2 \
    --app 'nOVibDo7' \
    --namespace "$AB_NAMESPACE" \
    --cached 'K4ZTeo9r' \
    > test.out 2>&1
eval_tap $? 39 'GetAppImageListV2' test.out

#- 40 DeleteAppImagesV2
./ng net.accelbyte.sdk.cli.Main csm deleteAppImagesV2 \
    --app 'vTCUb3cd' \
    --namespace "$AB_NAMESPACE" \
    --body '{"imageTags": ["pIAfjkgG", "bGzzRC0a", "ChFjzC8P"]}' \
    > test.out 2>&1
eval_tap $? 40 'DeleteAppImagesV2' test.out

#- 41 CreateKeyValueCredentialV2
./ng net.accelbyte.sdk.cli.Main csm createKeyValueCredentialV2 \
    --app '759ZTGBx' \
    --namespace "$AB_NAMESPACE" \
    --body '{"password": "tfy0kKxq", "username": "Woczfu7p"}' \
    > test.out 2>&1
eval_tap $? 41 'CreateKeyValueCredentialV2' test.out

#- 42 GetIntegrationAppKeyValueClusterV2
./ng net.accelbyte.sdk.cli.Main csm getIntegrationAppKeyValueClusterV2 \
    --app 'fBHvsrj7' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 42 'GetIntegrationAppKeyValueClusterV2' test.out

#- 43 IntegrateAppKeyValueClusterV2
./ng net.accelbyte.sdk.cli.Main csm integrateAppKeyValueClusterV2 \
    --app '0LP3QAu4' \
    --namespace "$AB_NAMESPACE" \
    --body '{"acknowledgements": {"acceptKeyValueSecureCredentialHandling": false}, "password": "jSgSbEJP", "resourceId": "bPkYYD44", "username": "BFoOuECz"}' \
    > test.out 2>&1
eval_tap $? 43 'IntegrateAppKeyValueClusterV2' test.out

#- 44 RemoveIntegrationAppKeyValueClusterV2
./ng net.accelbyte.sdk.cli.Main csm removeIntegrationAppKeyValueClusterV2 \
    --app 'iY87dsE7' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 44 'RemoveIntegrationAppKeyValueClusterV2' test.out

#- 45 CreateNewNoSQLDatabaseCredentialV2
./ng net.accelbyte.sdk.cli.Main csm createNewNoSQLDatabaseCredentialV2 \
    --app 'AVZUo7sB' \
    --namespace "$AB_NAMESPACE" \
    --body '{"acknowledgements": {"acceptNosqlSecureCredentialHandling": true}, "password": "FX8aFvju", "username": "pUXyp26i"}' \
    > test.out 2>&1
eval_tap $? 45 'CreateNewNoSQLDatabaseCredentialV2' test.out

#- 46 CreateNoSQLDatabaseCredentialV2
eval_tap 0 46 'CreateNoSQLDatabaseCredentialV2 # SKIP deprecated' test.out

#- 47 GetNoSQLDatabaseV2
./ng net.accelbyte.sdk.cli.Main csm getNoSQLDatabaseV2 \
    --app '2QUjbC6U' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 47 'GetNoSQLDatabaseV2' test.out

#- 48 CreateNoSQLDatabaseV2
./ng net.accelbyte.sdk.cli.Main csm createNoSQLDatabaseV2 \
    --app '2rogeH79' \
    --namespace "$AB_NAMESPACE" \
    --body '{"acknowledgements": {"acceptNosqlSecureCredentialHandling": false}, "dbName": "dKvdK1bJ", "password": "7Uykd3Ae", "username": "VLfctBM5"}' \
    > test.out 2>&1
eval_tap $? 48 'CreateNoSQLDatabaseV2' test.out

#- 49 DeleteNoSQLDatabaseV2
./ng net.accelbyte.sdk.cli.Main csm deleteNoSQLDatabaseV2 \
    --app 'wyIkt0Uj' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 49 'DeleteNoSQLDatabaseV2' test.out

#- 50 UpdateAppResourcesV2
./ng net.accelbyte.sdk.cli.Main csm updateAppResourcesV2 \
    --app 'UPF2qiRq' \
    --namespace "$AB_NAMESPACE" \
    --body '{"autoscaling": {"targetCPUUtilizationPercent": 32}, "cpu": {"requestCPU": 56}, "memory": {"requestMemory": 85}, "replica": {"maxReplica": 12, "minReplica": 25}, "vmSharingConfiguration": "IB56sd4K"}' \
    > test.out 2>&1
eval_tap $? 50 'UpdateAppResourcesV2' test.out

#- 51 UpdateAppResourcesResourceLimitFormV2
./ng net.accelbyte.sdk.cli.Main csm updateAppResourcesResourceLimitFormV2 \
    --app 'upTGUBgm' \
    --namespace "$AB_NAMESPACE" \
    --body '{"clientEmail": "xlBtp2Fv", "preferredLimitReplica": 25, "requestReason": "Lmtixq65"}' \
    > test.out 2>&1
eval_tap $? 51 'UpdateAppResourcesResourceLimitFormV2' test.out

#- 52 GetListOfSecretsV2
./ng net.accelbyte.sdk.cli.Main csm getListOfSecretsV2 \
    --app 'liCOzCVc' \
    --namespace "$AB_NAMESPACE" \
    --limit '87' \
    --offset '55' \
    > test.out 2>&1
eval_tap $? 52 'GetListOfSecretsV2' test.out

#- 53 SaveSecretV2
./ng net.accelbyte.sdk.cli.Main csm saveSecretV2 \
    --app 'BlVAJQf3' \
    --namespace "$AB_NAMESPACE" \
    --body '{"configName": "GRGrk5va", "description": "a6Mw1rJr", "source": "0gnVkiMO", "value": "wt6JzEKc"}' \
    > test.out 2>&1
eval_tap $? 53 'SaveSecretV2' test.out

#- 54 UpdateSecretV2
./ng net.accelbyte.sdk.cli.Main csm updateSecretV2 \
    --app 'B7nCmfrU' \
    --configId 'YoAJBRba' \
    --namespace "$AB_NAMESPACE" \
    --body '{"description": "ZQiqY713", "value": "URtFvu5B"}' \
    > test.out 2>&1
eval_tap $? 54 'UpdateSecretV2' test.out

#- 55 DeleteSecretV2
./ng net.accelbyte.sdk.cli.Main csm deleteSecretV2 \
    --app 'xkA0Znfj' \
    --configId 'yhch0eMS' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 55 'DeleteSecretV2' test.out

#- 56 CreateSQLDatabaseCredentialV2
./ng net.accelbyte.sdk.cli.Main csm createSQLDatabaseCredentialV2 \
    --app 'n5WffOIU' \
    --namespace "$AB_NAMESPACE" \
    --body '{"password": "Xx4dqWd0", "username": "fBNRHsyq"}' \
    > test.out 2>&1
eval_tap $? 56 'CreateSQLDatabaseCredentialV2' test.out

#- 57 GetSQLDatabaseV2
./ng net.accelbyte.sdk.cli.Main csm getSQLDatabaseV2 \
    --app 'w8YGo1mq' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 57 'GetSQLDatabaseV2' test.out

#- 58 CreateSQLDatabaseV2
./ng net.accelbyte.sdk.cli.Main csm createSQLDatabaseV2 \
    --app 'H0xniYPh' \
    --namespace "$AB_NAMESPACE" \
    --body '{"acknowledgements": {"acceptSQLSecureCredentialHandling": false}, "dbName": "FXnUZv2G", "password": "sWbPy00A", "username": "i1f4s1hj"}' \
    > test.out 2>&1
eval_tap $? 58 'CreateSQLDatabaseV2' test.out

#- 59 DeleteSQLDatabaseV2
./ng net.accelbyte.sdk.cli.Main csm deleteSQLDatabaseV2 \
    --app '9EzV1DQi' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 59 'DeleteSQLDatabaseV2' test.out

#- 60 StartAppV2
./ng net.accelbyte.sdk.cli.Main csm startAppV2 \
    --app 'tmLKHZUM' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 60 'StartAppV2' test.out

#- 61 StopAppV2
./ng net.accelbyte.sdk.cli.Main csm stopAppV2 \
    --app 'c4WF8nMj' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 61 'StopAppV2' test.out

#- 62 GetNotificationSubscriberListV2
./ng net.accelbyte.sdk.cli.Main csm getNotificationSubscriberListV2 \
    --app '96vXxgQI' \
    --namespace "$AB_NAMESPACE" \
    --notificationType 'UowzfeKm' \
    > test.out 2>&1
eval_tap $? 62 'GetNotificationSubscriberListV2' test.out

#- 63 BulkSaveSubscriptionAppNotificationV2
./ng net.accelbyte.sdk.cli.Main csm bulkSaveSubscriptionAppNotificationV2 \
    --app 'fbUAY2yb' \
    --namespace "$AB_NAMESPACE" \
    --body '{"subscribers": [{"emailAddress": "OfZsy7iO", "notificationType": {"esE3nG0w": true, "gmCPDenL": true, "4fhEy6Ok": true}, "userId": "7VKJJNxg"}, {"emailAddress": "0d1yCwHt", "notificationType": {"tb9ajsGP": false, "TpFEtxoe": false, "4QaOSNGd": true}, "userId": "ivOUiuIM"}, {"emailAddress": "7HJbFJun", "notificationType": {"1N6ByiV6": false, "q8gFhrhB": true, "1RZIsDiB": true}, "userId": "CtgGvHwX"}]}' \
    > test.out 2>&1
eval_tap $? 63 'BulkSaveSubscriptionAppNotificationV2' test.out

#- 64 SubscribeAppNotificationV2
./ng net.accelbyte.sdk.cli.Main csm subscribeAppNotificationV2 \
    --app 'nopGpdS5' \
    --namespace "$AB_NAMESPACE" \
    --body '{"notificationType": "1X1AAUcW", "subscribers": [{"emailAddress": "IXh5jObW", "userId": "aMOYY6ML"}, {"emailAddress": "D23C2Ne1", "userId": "FeKwmVAM"}, {"emailAddress": "fmToW9aa", "userId": "OGedq4AF"}]}' \
    > test.out 2>&1
eval_tap $? 64 'SubscribeAppNotificationV2' test.out

#- 65 GetSubscriptionV2Handler
./ng net.accelbyte.sdk.cli.Main csm getSubscriptionV2Handler \
    --app '8Ql7Ef6e' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 65 'GetSubscriptionV2Handler' test.out

#- 66 SubscribeV2Handler
./ng net.accelbyte.sdk.cli.Main csm subscribeV2Handler \
    --app 'BOdWs1R5' \
    --namespace "$AB_NAMESPACE" \
    --body '{"notificationType": "sJTzbTnS"}' \
    > test.out 2>&1
eval_tap $? 66 'SubscribeV2Handler' test.out

#- 67 UnsubscribeV2Handler
./ng net.accelbyte.sdk.cli.Main csm unsubscribeV2Handler \
    --app 'j89dqtvN' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 67 'UnsubscribeV2Handler' test.out

#- 68 DeleteSubscriptionAppNotificationByUserIDV2
./ng net.accelbyte.sdk.cli.Main csm deleteSubscriptionAppNotificationByUserIDV2 \
    --app '6C74ojKl' \
    --namespace "$AB_NAMESPACE" \
    --userId 'qb5IaRBp' \
    > test.out 2>&1
eval_tap $? 68 'DeleteSubscriptionAppNotificationByUserIDV2' test.out

#- 69 DeleteSubscriptionAppNotificationV2
eval_tap 0 69 'DeleteSubscriptionAppNotificationV2 # SKIP deprecated' test.out

#- 70 GetListOfVariablesV2
./ng net.accelbyte.sdk.cli.Main csm getListOfVariablesV2 \
    --app 'mVYpAaK4' \
    --namespace "$AB_NAMESPACE" \
    --limit '65' \
    --offset '11' \
    > test.out 2>&1
eval_tap $? 70 'GetListOfVariablesV2' test.out

#- 71 SaveVariableV2
./ng net.accelbyte.sdk.cli.Main csm saveVariableV2 \
    --app 'EIZh0dJg' \
    --namespace "$AB_NAMESPACE" \
    --body '{"applyMask": true, "configName": "OIbtRx4e", "description": "KcHgB1vl", "source": "W4tEFKa6", "value": "DY509cbA"}' \
    > test.out 2>&1
eval_tap $? 71 'SaveVariableV2' test.out

#- 72 UpdateVariableV2
./ng net.accelbyte.sdk.cli.Main csm updateVariableV2 \
    --app 'Q21ldGrX' \
    --configId 'uFjBJrhU' \
    --namespace "$AB_NAMESPACE" \
    --body '{"applyMask": false, "description": "6EprDTGn", "value": "qc7T3B1l"}' \
    > test.out 2>&1
eval_tap $? 72 'UpdateVariableV2' test.out

#- 73 DeleteVariableV2
./ng net.accelbyte.sdk.cli.Main csm deleteVariableV2 \
    --app 'hzT118Hp' \
    --configId 'yv63OSSE' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 73 'DeleteVariableV2' test.out

#- 74 ListTopicsHandler
./ng net.accelbyte.sdk.cli.Main csm listTopicsHandler \
    --namespace "$AB_NAMESPACE" \
    --fuzzyTopicName 'lm5dRF7Q' \
    --isSubscribedByAppName 'G3DvUj1c' \
    --isUnsubscribedByAppName 'nKyMdJXl' \
    --limit '51' \
    --offset '19' \
    > test.out 2>&1
eval_tap $? 74 'ListTopicsHandler' test.out

#- 75 CreateTopicHandler
./ng net.accelbyte.sdk.cli.Main csm createTopicHandler \
    --namespace "$AB_NAMESPACE" \
    --body '{"description": "ffkJxuMH", "topicName": "LHL1RQb4"}' \
    > test.out 2>&1
eval_tap $? 75 'CreateTopicHandler' test.out

#- 76 DeleteTopicHandler
./ng net.accelbyte.sdk.cli.Main csm deleteTopicHandler \
    --namespace "$AB_NAMESPACE" \
    --topicName '813lS4MD' \
    > test.out 2>&1
eval_tap $? 76 'DeleteTopicHandler' test.out

#- 77 GetListOfDeploymentV2
./ng net.accelbyte.sdk.cli.Main csm getListOfDeploymentV2 \
    --namespace "$AB_NAMESPACE" \
    --limit '70' \
    --offset '41' \
    --body '{"appIds": ["MqLXcUqf", "RIw4AIoF", "vleCBSll"], "deploymentIds": ["l2G5hvVM", "PMAUI89A", "09QyA8y8"], "statuses": ["9ywHZZnD", "Nvs3OXBw", "vCLkm1TD"]}' \
    > test.out 2>&1
eval_tap $? 77 'GetListOfDeploymentV2' test.out

#- 78 GetDeploymentV2
./ng net.accelbyte.sdk.cli.Main csm getDeploymentV2 \
    --deploymentId 'q9n41LjO' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 78 'GetDeploymentV2' test.out

#- 79 DeleteDeploymentV2
./ng net.accelbyte.sdk.cli.Main csm deleteDeploymentV2 \
    --deploymentId 's2r0vQcl' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 79 'DeleteDeploymentV2' test.out

#- 80 GetKeyValueClusterV2
./ng net.accelbyte.sdk.cli.Main csm getKeyValueClusterV2 \
    --namespace "$AB_NAMESPACE" \
    --resourceId 'XRRHmo6Y' \
    > test.out 2>&1
eval_tap $? 80 'GetKeyValueClusterV2' test.out

#- 81 ListKeyValueClusterV2
./ng net.accelbyte.sdk.cli.Main csm listKeyValueClusterV2 \
    --namespace "$AB_NAMESPACE" \
    --refresh  \
    > test.out 2>&1
eval_tap $? 81 'ListKeyValueClusterV2' test.out

#- 82 CreateKeyValueClusterV2
./ng net.accelbyte.sdk.cli.Main csm createKeyValueClusterV2 \
    --namespace "$AB_NAMESPACE" \
    --body '{"clusterName": "YjzivKis", "maxDataStorageGB": 38, "maxECPUPerSecond": 77, "profileName": "cHG1WTuQ"}' \
    > test.out 2>&1
eval_tap $? 82 'CreateKeyValueClusterV2' test.out

#- 83 GetKeyValueClusterLimitConfigV2
./ng net.accelbyte.sdk.cli.Main csm getKeyValueClusterLimitConfigV2 \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 83 'GetKeyValueClusterLimitConfigV2' test.out

#- 84 UpdateKeyValueClusterV2
./ng net.accelbyte.sdk.cli.Main csm updateKeyValueClusterV2 \
    --namespace "$AB_NAMESPACE" \
    --resourceId 'X544msDZ' \
    --body '{"maxDataStorageGB": 70, "maxECPUPerSecond": 5, "profileName": "NqkrsE8B"}' \
    > test.out 2>&1
eval_tap $? 84 'UpdateKeyValueClusterV2' test.out

#- 85 DeleteKeyValueClusterV2
./ng net.accelbyte.sdk.cli.Main csm deleteKeyValueClusterV2 \
    --namespace "$AB_NAMESPACE" \
    --resourceId 'tKeIxBLh' \
    > test.out 2>&1
eval_tap $? 85 'DeleteKeyValueClusterV2' test.out

#- 86 GetListIntegratedAppKeyValueClusterV2
./ng net.accelbyte.sdk.cli.Main csm getListIntegratedAppKeyValueClusterV2 \
    --namespace "$AB_NAMESPACE" \
    --resourceId 'RJgTcNm1' \
    > test.out 2>&1
eval_tap $? 86 'GetListIntegratedAppKeyValueClusterV2' test.out

#- 87 GetNoSQLClusterV2
./ng net.accelbyte.sdk.cli.Main csm getNoSQLClusterV2 \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 87 'GetNoSQLClusterV2' test.out

#- 88 UpdateNoSQLClusterV2
./ng net.accelbyte.sdk.cli.Main csm updateNoSQLClusterV2 \
    --namespace "$AB_NAMESPACE" \
    --body '{"maxDCU": 0.04824266819394696, "minDCU": 0.45992517347412, "profileName": "vuG4N5K3"}' \
    > test.out 2>&1
eval_tap $? 88 'UpdateNoSQLClusterV2' test.out

#- 89 CreateNoSQLClusterV2
./ng net.accelbyte.sdk.cli.Main csm createNoSQLClusterV2 \
    --namespace "$AB_NAMESPACE" \
    --body '{"maxDCU": 0.682915898078514, "minDCU": 0.552435189753625, "profileName": "o7OOTiXh"}' \
    > test.out 2>&1
eval_tap $? 89 'CreateNoSQLClusterV2' test.out

#- 90 DeleteNoSQLClusterV2
./ng net.accelbyte.sdk.cli.Main csm deleteNoSQLClusterV2 \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 90 'DeleteNoSQLClusterV2' test.out

#- 91 StartNoSQLClusterV2
./ng net.accelbyte.sdk.cli.Main csm startNoSQLClusterV2 \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 91 'StartNoSQLClusterV2' test.out

#- 92 StopNoSQLClusterV2
./ng net.accelbyte.sdk.cli.Main csm stopNoSQLClusterV2 \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 92 'StopNoSQLClusterV2' test.out

#- 93 GetNoSQLAccessTunnelV2
./ng net.accelbyte.sdk.cli.Main csm getNoSQLAccessTunnelV2 \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 93 'GetNoSQLAccessTunnelV2' test.out

#- 94 GetResourcesLimits
./ng net.accelbyte.sdk.cli.Main csm getResourcesLimits \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 94 'GetResourcesLimits' test.out

#- 95 GetSQLClusterV2
./ng net.accelbyte.sdk.cli.Main csm getSQLClusterV2 \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 95 'GetSQLClusterV2' test.out

#- 96 UpdateSQLClusterV2
./ng net.accelbyte.sdk.cli.Main csm updateSQLClusterV2 \
    --namespace "$AB_NAMESPACE" \
    --body '{"maxACU": 0.7004130326147072, "minACU": 0.43427581039382046, "multiAZ": true, "profileName": "zsOVe1cz"}' \
    > test.out 2>&1
eval_tap $? 96 'UpdateSQLClusterV2' test.out

#- 97 CreateSQLClusterV2
./ng net.accelbyte.sdk.cli.Main csm createSQLClusterV2 \
    --namespace "$AB_NAMESPACE" \
    --body '{"maxACU": 0.43703733208390516, "minACU": 0.05485247460911724, "multiAZ": true, "profileName": "9Nq6SUGk"}' \
    > test.out 2>&1
eval_tap $? 97 'CreateSQLClusterV2' test.out

#- 98 DeleteSQLClusterV2
./ng net.accelbyte.sdk.cli.Main csm deleteSQLClusterV2 \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 98 'DeleteSQLClusterV2' test.out

#- 99 StartSQLClusterV2
./ng net.accelbyte.sdk.cli.Main csm startSQLClusterV2 \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 99 'StartSQLClusterV2' test.out

#- 100 StopSQLClusterV2
./ng net.accelbyte.sdk.cli.Main csm stopSQLClusterV2 \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 100 'StopSQLClusterV2' test.out

#- 101 GetSQLAppListV2
./ng net.accelbyte.sdk.cli.Main csm getSQLAppListV2 \
    --namespace "$AB_NAMESPACE" \
    --resourceId '21PB0xjF' \
    --appName 'U3mRYnjo' \
    --gameNamespace 'bRK1qHoe' \
    --limit '74' \
    --offset '12' \
    > test.out 2>&1
eval_tap $? 101 'GetSQLAppListV2' test.out

#- 102 GetNoSQLAppListV2
./ng net.accelbyte.sdk.cli.Main csm getNoSQLAppListV2 \
    --resourceId 'PnqpZ1zu' \
    --studioName 'dmhcrEyc' \
    --appName 'ok9vCeB9' \
    --gameNamespace '0NBgIuBo' \
    --limit '0' \
    --offset '69' \
    > test.out 2>&1
eval_tap $? 102 'GetNoSQLAppListV2' test.out

#- 103 GetNotificationSubscriberListV3
./ng net.accelbyte.sdk.cli.Main csm getNotificationSubscriberListV3 \
    --app 'R2HrlXZz' \
    --namespace "$AB_NAMESPACE" \
    --notificationType 'tE3qNbUi' \
    > test.out 2>&1
eval_tap $? 103 'GetNotificationSubscriberListV3' test.out

#- 104 DeleteSubscriptionAppNotificationV3
./ng net.accelbyte.sdk.cli.Main csm deleteSubscriptionAppNotificationV3 \
    --app '3H1FVujF' \
    --namespace "$AB_NAMESPACE" \
    --emailAddress '4Pn0Bmbq' \
    --userId 'Au1WV0m0' \
    > test.out 2>&1
eval_tap $? 104 'DeleteSubscriptionAppNotificationV3' test.out

#- 105 GetAppDebugInfoV4
./ng net.accelbyte.sdk.cli.Main csm getAppDebugInfoV4 \
    --app '8tmuO8IQ' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 105 'GetAppDebugInfoV4' test.out

#- 106 UpdateAppDebugModeV4
./ng net.accelbyte.sdk.cli.Main csm updateAppDebugModeV4 \
    --app 'mp87y109' \
    --namespace "$AB_NAMESPACE" \
    --body '{"enableDebugMode": false}' \
    > test.out 2>&1
eval_tap $? 106 'UpdateAppDebugModeV4' test.out

#- 107 GetAppStatusProgressV4
./ng net.accelbyte.sdk.cli.Main csm getAppStatusProgressV4 \
    --app '6dqs99ho' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 107 'GetAppStatusProgressV4' test.out

#- 108 CreateAppV5
./ng net.accelbyte.sdk.cli.Main csm createAppV5 \
    --app 'WZrpMXxm' \
    --namespace "$AB_NAMESPACE" \
    --body '{"autoscaling": {"targetCPUUtilizationPercent": 78}, "cpu": {"requestCPU": 81}, "description": "bFXpjMpN", "memory": {"requestMemory": 26}, "preferred_k8s_namespace": "hrGNnjER", "replica": {"maxReplica": 49, "minReplica": 49}, "scenario": "iYrpZfvP", "vmSharingConfiguration": "zu5UmcBx"}' \
    > test.out 2>&1
eval_tap $? 108 'CreateAppV5' test.out


rm -f "tmp.dat"

exit $EXIT_CODE