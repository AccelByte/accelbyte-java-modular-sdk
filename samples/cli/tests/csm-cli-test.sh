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
echo "1..104"

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
    --limit '55' \
    --name 'eLCD02KV' \
    --offset '59' \
    > test.out 2>&1
eval_tap $? 2 'ListAppUI' test.out

#- 3 CreateAppUI
./ng net.accelbyte.sdk.cli.Main csm createAppUI \
    --namespace "$AB_NAMESPACE" \
    --body '{"name": "IUv2fuQD"}' \
    > test.out 2>&1
eval_tap $? 3 'CreateAppUI' test.out

#- 4 DeleteAppUI
./ng net.accelbyte.sdk.cli.Main csm deleteAppUI \
    --appUiName 'GDTnLZBK' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 4 'DeleteAppUI' test.out

#- 5 UploadAppUIFile
./ng net.accelbyte.sdk.cli.Main csm uploadAppUIFile \
    --appUiName 'xZZJsfZy' \
    --namespace "$AB_NAMESPACE" \
    --version 'DeZnOLSW' \
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
    --app 'Wi0UCL0q' \
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
    --filePath 'Itw9lnE2' \
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
    --limit '3' \
    --offset '91' \
    --body '{"appNames": ["fGSzEj4X", "zhUkekUl", "EjywYbCE"], "appStatuses": ["h8qyqCqq", "NSaSVZM4", "ISCw0Wl7"], "fuzzyAppName": "ySwUcqmJ", "scenario": "dfcFIq00"}' \
    > test.out 2>&1
eval_tap $? 30 'GetAppListV2' test.out

#- 31 GetAppV2
./ng net.accelbyte.sdk.cli.Main csm getAppV2 \
    --app '9BOefNWo' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 31 'GetAppV2' test.out

#- 32 CreateAppV2
./ng net.accelbyte.sdk.cli.Main csm createAppV2 \
    --app 'tUwqPzQy' \
    --namespace "$AB_NAMESPACE" \
    --body '{"autoscaling": {"targetCPUUtilizationPercent": 18}, "cpu": {"requestCPU": 46}, "description": "Sijn6bBb", "memory": {"requestMemory": 26}, "replica": {"maxReplica": 42, "minReplica": 10}, "scenario": "jyOeqhEs", "vmSharingConfiguration": "dF7IBY4m"}' \
    > test.out 2>&1
eval_tap $? 32 'CreateAppV2' test.out

#- 33 DeleteAppV2
./ng net.accelbyte.sdk.cli.Main csm deleteAppV2 \
    --app '8v51SGgH' \
    --namespace "$AB_NAMESPACE" \
    --forced 'ggSpcAcn' \
    > test.out 2>&1
eval_tap $? 33 'DeleteAppV2' test.out

#- 34 UpdateAppV2
./ng net.accelbyte.sdk.cli.Main csm updateAppV2 \
    --app 'HhzHT18C' \
    --namespace "$AB_NAMESPACE" \
    --body '{"description": "og2nOwaW"}' \
    > test.out 2>&1
eval_tap $? 34 'UpdateAppV2' test.out

#- 35 ApplyAppConfigV2
./ng net.accelbyte.sdk.cli.Main csm applyAppConfigV2 \
    --app 'FnKj52HJ' \
    --namespace "$AB_NAMESPACE" \
    --body '{"autoscaling": {"targetCPUUtilizationPercent": 87}, "cpu": {"requestCPU": 59}, "description": "x4DxjbQ4", "memory": {"requestMemory": 19}, "permissions": [{"action": 18, "resource": "8QVmfst8"}, {"action": 62, "resource": "EX1aa1Zq"}, {"action": 100, "resource": "Hymim9H4"}], "replica": {"maxReplica": 31, "minReplica": 19}, "scenario": "rI8pVH5P", "secrets": [{"name": "Hwzpa8G4", "value": "d6IIh4Xl"}, {"name": "PrLxaoHi", "value": "z4dZTrmp"}, {"name": "yf7dbOQi", "value": "L59sUEkN"}], "variables": [{"name": "cLHopUJ9", "value": "j2945axA"}, {"name": "xIeDqLkV", "value": "0VW8yMSW"}, {"name": "H9qVk30r", "value": "xhVOVVNe"}], "vmSharingConfiguration": "YIwFHaCG"}' \
    > test.out 2>&1
eval_tap $? 35 'ApplyAppConfigV2' test.out

#- 36 CreateSubscriptionHandler
./ng net.accelbyte.sdk.cli.Main csm createSubscriptionHandler \
    --app 'tsDx0LvT' \
    --namespace "$AB_NAMESPACE" \
    --body '{"topicNames": ["hgK2BUTW", "dJ4EXvTg", "RkgQRq9y"]}' \
    > test.out 2>&1
eval_tap $? 36 'CreateSubscriptionHandler' test.out

#- 37 UnsubscribeTopicHandler
./ng net.accelbyte.sdk.cli.Main csm unsubscribeTopicHandler \
    --app 'Wa7iX18M' \
    --namespace "$AB_NAMESPACE" \
    --topicName 'ZJlL24iB' \
    > test.out 2>&1
eval_tap $? 37 'UnsubscribeTopicHandler' test.out

#- 38 CreateDeploymentV2
./ng net.accelbyte.sdk.cli.Main csm createDeploymentV2 \
    --app 'P4FUN7bp' \
    --namespace "$AB_NAMESPACE" \
    --body '{"imageTag": "wm1teaHp"}' \
    > test.out 2>&1
eval_tap $? 38 'CreateDeploymentV2' test.out

#- 39 GetAppImageListV2
./ng net.accelbyte.sdk.cli.Main csm getAppImageListV2 \
    --app 'Siac2JBT' \
    --namespace "$AB_NAMESPACE" \
    --cached '41WkjboZ' \
    > test.out 2>&1
eval_tap $? 39 'GetAppImageListV2' test.out

#- 40 DeleteAppImagesV2
./ng net.accelbyte.sdk.cli.Main csm deleteAppImagesV2 \
    --app 'c5gim4gn' \
    --namespace "$AB_NAMESPACE" \
    --body '{"imageTags": ["pSDQ6zjz", "MITQSTOK", "ECurxGmt"]}' \
    > test.out 2>&1
eval_tap $? 40 'DeleteAppImagesV2' test.out

#- 41 CreateKeyValueCredentialV2
./ng net.accelbyte.sdk.cli.Main csm createKeyValueCredentialV2 \
    --app 'NFoCimta' \
    --namespace "$AB_NAMESPACE" \
    --body '{"password": "jUeXyoMf", "username": "VIAoKQyJ"}' \
    > test.out 2>&1
eval_tap $? 41 'CreateKeyValueCredentialV2' test.out

#- 42 GetIntegrationAppKeyValueClusterV2
./ng net.accelbyte.sdk.cli.Main csm getIntegrationAppKeyValueClusterV2 \
    --app 'hVQAMcK6' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 42 'GetIntegrationAppKeyValueClusterV2' test.out

#- 43 IntegrateAppKeyValueClusterV2
./ng net.accelbyte.sdk.cli.Main csm integrateAppKeyValueClusterV2 \
    --app 'R6fVF5rQ' \
    --namespace "$AB_NAMESPACE" \
    --body '{"acknowledgements": {"acceptKeyValueSecureCredentialHandling": false}, "password": "fXxaRc6K", "resourceId": "XH266B6C", "username": "C1Lupz0F"}' \
    > test.out 2>&1
eval_tap $? 43 'IntegrateAppKeyValueClusterV2' test.out

#- 44 RemoveIntegrationAppKeyValueClusterV2
./ng net.accelbyte.sdk.cli.Main csm removeIntegrationAppKeyValueClusterV2 \
    --app 'qPKvNOO8' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 44 'RemoveIntegrationAppKeyValueClusterV2' test.out

#- 45 CreateNewNoSQLDatabaseCredentialV2
./ng net.accelbyte.sdk.cli.Main csm createNewNoSQLDatabaseCredentialV2 \
    --app 'KzAmc6PC' \
    --namespace "$AB_NAMESPACE" \
    --body '{"acknowledgements": {"acceptNosqlSecureCredentialHandling": true}, "password": "aVmCneu6", "username": "QVrrVgi1"}' \
    > test.out 2>&1
eval_tap $? 45 'CreateNewNoSQLDatabaseCredentialV2' test.out

#- 46 CreateNoSQLDatabaseCredentialV2
eval_tap 0 46 'CreateNoSQLDatabaseCredentialV2 # SKIP deprecated' test.out

#- 47 GetNoSQLDatabaseV2
./ng net.accelbyte.sdk.cli.Main csm getNoSQLDatabaseV2 \
    --app 'xzyV7cVW' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 47 'GetNoSQLDatabaseV2' test.out

#- 48 CreateNoSQLDatabaseV2
./ng net.accelbyte.sdk.cli.Main csm createNoSQLDatabaseV2 \
    --app 's6G7aFBP' \
    --namespace "$AB_NAMESPACE" \
    --body '{"acknowledgements": {"acceptNosqlSecureCredentialHandling": true}, "dbName": "NEoolWut", "password": "QVLD80pK", "username": "Hss6YOXy"}' \
    > test.out 2>&1
eval_tap $? 48 'CreateNoSQLDatabaseV2' test.out

#- 49 DeleteNoSQLDatabaseV2
./ng net.accelbyte.sdk.cli.Main csm deleteNoSQLDatabaseV2 \
    --app 'TjV6aoUo' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 49 'DeleteNoSQLDatabaseV2' test.out

#- 50 UpdateAppResourcesV2
./ng net.accelbyte.sdk.cli.Main csm updateAppResourcesV2 \
    --app 'SQQoBy2R' \
    --namespace "$AB_NAMESPACE" \
    --body '{"autoscaling": {"targetCPUUtilizationPercent": 63}, "cpu": {"requestCPU": 58}, "memory": {"requestMemory": 80}, "replica": {"maxReplica": 51, "minReplica": 77}, "vmSharingConfiguration": "FDFXbL1U"}' \
    > test.out 2>&1
eval_tap $? 50 'UpdateAppResourcesV2' test.out

#- 51 UpdateAppResourcesResourceLimitFormV2
./ng net.accelbyte.sdk.cli.Main csm updateAppResourcesResourceLimitFormV2 \
    --app 'tTnqAm30' \
    --namespace "$AB_NAMESPACE" \
    --body '{"clientEmail": "UKqtqskY", "preferredLimitReplica": 91, "requestReason": "MJjaHmze"}' \
    > test.out 2>&1
eval_tap $? 51 'UpdateAppResourcesResourceLimitFormV2' test.out

#- 52 GetListOfSecretsV2
./ng net.accelbyte.sdk.cli.Main csm getListOfSecretsV2 \
    --app 'J9MuNMQn' \
    --namespace "$AB_NAMESPACE" \
    --limit '86' \
    --offset '94' \
    > test.out 2>&1
eval_tap $? 52 'GetListOfSecretsV2' test.out

#- 53 SaveSecretV2
./ng net.accelbyte.sdk.cli.Main csm saveSecretV2 \
    --app 'hK12d3NR' \
    --namespace "$AB_NAMESPACE" \
    --body '{"configName": "QtQcmQQ5", "description": "6t516Bd6", "source": "Lm8F7CnF", "value": "TvJX7srA"}' \
    > test.out 2>&1
eval_tap $? 53 'SaveSecretV2' test.out

#- 54 UpdateSecretV2
./ng net.accelbyte.sdk.cli.Main csm updateSecretV2 \
    --app 'w7mhSK9Z' \
    --configId 'x5m5iuWS' \
    --namespace "$AB_NAMESPACE" \
    --body '{"description": "17l1OTJr", "value": "czkP0fuj"}' \
    > test.out 2>&1
eval_tap $? 54 'UpdateSecretV2' test.out

#- 55 DeleteSecretV2
./ng net.accelbyte.sdk.cli.Main csm deleteSecretV2 \
    --app 'HrrsE8Aq' \
    --configId '6EmaHI5B' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 55 'DeleteSecretV2' test.out

#- 56 CreateSQLDatabaseCredentialV2
./ng net.accelbyte.sdk.cli.Main csm createSQLDatabaseCredentialV2 \
    --app 'PrmPNGY4' \
    --namespace "$AB_NAMESPACE" \
    --body '{"password": "TPJU0s0p", "username": "LUpGPYG2"}' \
    > test.out 2>&1
eval_tap $? 56 'CreateSQLDatabaseCredentialV2' test.out

#- 57 GetSQLDatabaseV2
./ng net.accelbyte.sdk.cli.Main csm getSQLDatabaseV2 \
    --app 'lEXytLUK' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 57 'GetSQLDatabaseV2' test.out

#- 58 CreateSQLDatabaseV2
./ng net.accelbyte.sdk.cli.Main csm createSQLDatabaseV2 \
    --app '0wOjcprx' \
    --namespace "$AB_NAMESPACE" \
    --body '{"acknowledgements": {"acceptSQLSecureCredentialHandling": true}, "dbName": "L8W58YjD", "password": "UwXBvJOn", "username": "TA74Eqak"}' \
    > test.out 2>&1
eval_tap $? 58 'CreateSQLDatabaseV2' test.out

#- 59 DeleteSQLDatabaseV2
./ng net.accelbyte.sdk.cli.Main csm deleteSQLDatabaseV2 \
    --app 'kzqiOudR' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 59 'DeleteSQLDatabaseV2' test.out

#- 60 StartAppV2
./ng net.accelbyte.sdk.cli.Main csm startAppV2 \
    --app 'IXhzajdc' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 60 'StartAppV2' test.out

#- 61 StopAppV2
./ng net.accelbyte.sdk.cli.Main csm stopAppV2 \
    --app 'uZfVnZjW' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 61 'StopAppV2' test.out

#- 62 GetNotificationSubscriberListV2
./ng net.accelbyte.sdk.cli.Main csm getNotificationSubscriberListV2 \
    --app '4URaAk05' \
    --namespace "$AB_NAMESPACE" \
    --notificationType 'klwJBIED' \
    > test.out 2>&1
eval_tap $? 62 'GetNotificationSubscriberListV2' test.out

#- 63 BulkSaveSubscriptionAppNotificationV2
./ng net.accelbyte.sdk.cli.Main csm bulkSaveSubscriptionAppNotificationV2 \
    --app 'Dm0eajKY' \
    --namespace "$AB_NAMESPACE" \
    --body '{"subscribers": [{"emailAddress": "QyBM9vhr", "notificationType": {"mZWWUFjw": false, "uzkHfZc7": true, "SI9IyhCD": false}, "userId": "9CZHjKwO"}, {"emailAddress": "KnQ1hq0S", "notificationType": {"2ootcm2I": false, "qogi3wyb": true, "6XBAvsLa": false}, "userId": "DW7X1dbt"}, {"emailAddress": "rdAI3Dpi", "notificationType": {"auJEpRGc": true, "qwyZtjIt": false, "S4eu7Y5T": false}, "userId": "rPmEbYNj"}]}' \
    > test.out 2>&1
eval_tap $? 63 'BulkSaveSubscriptionAppNotificationV2' test.out

#- 64 SubscribeAppNotificationV2
./ng net.accelbyte.sdk.cli.Main csm subscribeAppNotificationV2 \
    --app 'NVbJ9SEj' \
    --namespace "$AB_NAMESPACE" \
    --body '{"notificationType": "XR42paKQ", "subscribers": [{"emailAddress": "a1FKxuv5", "userId": "V1imVuzU"}, {"emailAddress": "8FLtko7H", "userId": "iVuv8T6P"}, {"emailAddress": "DAsto5dG", "userId": "WTxwISKc"}]}' \
    > test.out 2>&1
eval_tap $? 64 'SubscribeAppNotificationV2' test.out

#- 65 GetSubscriptionV2Handler
./ng net.accelbyte.sdk.cli.Main csm getSubscriptionV2Handler \
    --app 'zpEfJ6D1' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 65 'GetSubscriptionV2Handler' test.out

#- 66 SubscribeV2Handler
./ng net.accelbyte.sdk.cli.Main csm subscribeV2Handler \
    --app 'NL939bNq' \
    --namespace "$AB_NAMESPACE" \
    --body '{"notificationType": "xrhfJbN4"}' \
    > test.out 2>&1
eval_tap $? 66 'SubscribeV2Handler' test.out

#- 67 UnsubscribeV2Handler
./ng net.accelbyte.sdk.cli.Main csm unsubscribeV2Handler \
    --app 'amkL7rKo' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 67 'UnsubscribeV2Handler' test.out

#- 68 DeleteSubscriptionAppNotificationByUserIDV2
./ng net.accelbyte.sdk.cli.Main csm deleteSubscriptionAppNotificationByUserIDV2 \
    --app 'M5til8Wv' \
    --namespace "$AB_NAMESPACE" \
    --userId 'a814zS2k' \
    > test.out 2>&1
eval_tap $? 68 'DeleteSubscriptionAppNotificationByUserIDV2' test.out

#- 69 DeleteSubscriptionAppNotificationV2
eval_tap 0 69 'DeleteSubscriptionAppNotificationV2 # SKIP deprecated' test.out

#- 70 GetListOfVariablesV2
./ng net.accelbyte.sdk.cli.Main csm getListOfVariablesV2 \
    --app 'ANf8wb8o' \
    --namespace "$AB_NAMESPACE" \
    --limit '56' \
    --offset '73' \
    > test.out 2>&1
eval_tap $? 70 'GetListOfVariablesV2' test.out

#- 71 SaveVariableV2
./ng net.accelbyte.sdk.cli.Main csm saveVariableV2 \
    --app 'OWzIkpQt' \
    --namespace "$AB_NAMESPACE" \
    --body '{"applyMask": true, "configName": "BhHKLJXh", "description": "mIu1IKEM", "source": "fXnMguH4", "value": "5aEE8Iez"}' \
    > test.out 2>&1
eval_tap $? 71 'SaveVariableV2' test.out

#- 72 UpdateVariableV2
./ng net.accelbyte.sdk.cli.Main csm updateVariableV2 \
    --app 'ix0YK6To' \
    --configId 'vKHBRuY0' \
    --namespace "$AB_NAMESPACE" \
    --body '{"applyMask": false, "description": "BBNnvl4Y", "value": "6oetbWPZ"}' \
    > test.out 2>&1
eval_tap $? 72 'UpdateVariableV2' test.out

#- 73 DeleteVariableV2
./ng net.accelbyte.sdk.cli.Main csm deleteVariableV2 \
    --app 'WCsMeWQy' \
    --configId 'ZMisP3Jz' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 73 'DeleteVariableV2' test.out

#- 74 ListTopicsHandler
./ng net.accelbyte.sdk.cli.Main csm listTopicsHandler \
    --namespace "$AB_NAMESPACE" \
    --fuzzyTopicName '0kQrsqtK' \
    --isSubscribedByAppName 'dHMWGqBI' \
    --isUnsubscribedByAppName 'I3T7jMGq' \
    --limit '16' \
    --offset '73' \
    > test.out 2>&1
eval_tap $? 74 'ListTopicsHandler' test.out

#- 75 CreateTopicHandler
./ng net.accelbyte.sdk.cli.Main csm createTopicHandler \
    --namespace "$AB_NAMESPACE" \
    --body '{"description": "qMRG2v7P", "topicName": "k8cRBtVe"}' \
    > test.out 2>&1
eval_tap $? 75 'CreateTopicHandler' test.out

#- 76 DeleteTopicHandler
./ng net.accelbyte.sdk.cli.Main csm deleteTopicHandler \
    --namespace "$AB_NAMESPACE" \
    --topicName '0zhvlxYC' \
    > test.out 2>&1
eval_tap $? 76 'DeleteTopicHandler' test.out

#- 77 GetListOfDeploymentV2
./ng net.accelbyte.sdk.cli.Main csm getListOfDeploymentV2 \
    --namespace "$AB_NAMESPACE" \
    --limit '77' \
    --offset '68' \
    --body '{"appIds": ["UOvxCFv4", "PGO1EOpq", "9chr6enM"], "deploymentIds": ["a3EQvD58", "W2hBb5ot", "CFLroHBq"], "statuses": ["QgNHbJfK", "EQ3obVCK", "Qbonr0KH"]}' \
    > test.out 2>&1
eval_tap $? 77 'GetListOfDeploymentV2' test.out

#- 78 GetDeploymentV2
./ng net.accelbyte.sdk.cli.Main csm getDeploymentV2 \
    --deploymentId '7kzQ6VN5' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 78 'GetDeploymentV2' test.out

#- 79 DeleteDeploymentV2
./ng net.accelbyte.sdk.cli.Main csm deleteDeploymentV2 \
    --deploymentId '3rk2dAPu' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 79 'DeleteDeploymentV2' test.out

#- 80 GetKeyValueClusterV2
./ng net.accelbyte.sdk.cli.Main csm getKeyValueClusterV2 \
    --namespace "$AB_NAMESPACE" \
    --resourceId 'oFL0lHm2' \
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
    --body '{"clusterName": "aBrxdym9", "maxDataStorageGB": 29, "maxECPUPerSecond": 41, "profileName": "1pdOzwgv"}' \
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
    --resourceId 'RmpXOvmj' \
    --body '{"maxDataStorageGB": 79, "maxECPUPerSecond": 79, "profileName": "u1B4Ajga"}' \
    > test.out 2>&1
eval_tap $? 84 'UpdateKeyValueClusterV2' test.out

#- 85 DeleteKeyValueClusterV2
./ng net.accelbyte.sdk.cli.Main csm deleteKeyValueClusterV2 \
    --namespace "$AB_NAMESPACE" \
    --resourceId 'S0Pgafo3' \
    > test.out 2>&1
eval_tap $? 85 'DeleteKeyValueClusterV2' test.out

#- 86 GetListIntegratedAppKeyValueClusterV2
./ng net.accelbyte.sdk.cli.Main csm getListIntegratedAppKeyValueClusterV2 \
    --namespace "$AB_NAMESPACE" \
    --resourceId 'H2gVlgk7' \
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
    --body '{"maxDCU": 0.07343945086453163, "minDCU": 0.7526464352502588, "profileName": "tO9Wf5oa"}' \
    > test.out 2>&1
eval_tap $? 88 'UpdateNoSQLClusterV2' test.out

#- 89 CreateNoSQLClusterV2
./ng net.accelbyte.sdk.cli.Main csm createNoSQLClusterV2 \
    --namespace "$AB_NAMESPACE" \
    --body '{"maxDCU": 0.8983921352325008, "minDCU": 0.3890870113127025, "profileName": "MMvnGnAv"}' \
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
    --body '{"maxACU": 0.13128158414609348, "minACU": 0.7226259976282071, "multiAZ": false, "profileName": "hyN1B7st"}' \
    > test.out 2>&1
eval_tap $? 96 'UpdateSQLClusterV2' test.out

#- 97 CreateSQLClusterV2
./ng net.accelbyte.sdk.cli.Main csm createSQLClusterV2 \
    --namespace "$AB_NAMESPACE" \
    --body '{"maxACU": 0.6322448120905212, "minACU": 0.060153472241309736, "multiAZ": true, "profileName": "xqrs6rdH"}' \
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
    --resourceId 'T9CSoMZ4' \
    --appName 'kN9c0gPR' \
    --gameNamespace 'P1z1NoU2' \
    --limit '38' \
    --offset '93' \
    > test.out 2>&1
eval_tap $? 101 'GetSQLAppListV2' test.out

#- 102 GetNoSQLAppListV2
./ng net.accelbyte.sdk.cli.Main csm getNoSQLAppListV2 \
    --resourceId 'p9uayT6k' \
    --studioName 'QzAoPVdu' \
    --appName '1ADUN071' \
    --limit '30' \
    --namespace "$AB_NAMESPACE" \
    --offset '70' \
    > test.out 2>&1
eval_tap $? 102 'GetNoSQLAppListV2' test.out

#- 103 GetNotificationSubscriberListV3
./ng net.accelbyte.sdk.cli.Main csm getNotificationSubscriberListV3 \
    --app 'C9cCQGsO' \
    --namespace "$AB_NAMESPACE" \
    --notificationType 'xGXCfOLQ' \
    > test.out 2>&1
eval_tap $? 103 'GetNotificationSubscriberListV3' test.out

#- 104 DeleteSubscriptionAppNotificationV3
./ng net.accelbyte.sdk.cli.Main csm deleteSubscriptionAppNotificationV3 \
    --app '2LTrC10l' \
    --namespace "$AB_NAMESPACE" \
    --emailAddress 'hkTwpzPE' \
    --userId 'HB4JgQJe' \
    > test.out 2>&1
eval_tap $? 104 'DeleteSubscriptionAppNotificationV3' test.out


rm -f "tmp.dat"

exit $EXIT_CODE