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
echo "1..75"

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
    --app 'FQ9nEjmT' \
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
    --limit '45' \
    --offset '12' \
    --body '{"appNames": ["2vdAIAAD", "m90VTf0I", "YUEBxaRk"], "appStatuses": ["hja7fkgm", "W37Pibpv", "TRPBI4ro"], "fuzzyAppName": "1oXq9eai", "scenario": "rLm5VhQs"}' \
    > test.out 2>&1
eval_tap $? 25 'GetAppListV2' test.out

#- 26 GetAppV2
./ng net.accelbyte.sdk.cli.Main csm getAppV2 \
    --app '8N0LSSbu' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 26 'GetAppV2' test.out

#- 27 CreateAppV2
./ng net.accelbyte.sdk.cli.Main csm createAppV2 \
    --app 'hfDFnjEI' \
    --namespace "$AB_NAMESPACE" \
    --body '{"autoscaling": {"targetCPUUtilizationPercent": 61}, "cpu": {"requestCPU": 46}, "description": "V97j81x7", "memory": {"requestMemory": 100}, "replica": {"maxReplica": 1, "minReplica": 75}, "scenario": "kdYTw2iB", "vmSharingConfiguration": "VBC5DG0O"}' \
    > test.out 2>&1
eval_tap $? 27 'CreateAppV2' test.out

#- 28 DeleteAppV2
./ng net.accelbyte.sdk.cli.Main csm deleteAppV2 \
    --app 'H5gVdn7H' \
    --namespace "$AB_NAMESPACE" \
    --forced 'pJX1sa2k' \
    > test.out 2>&1
eval_tap $? 28 'DeleteAppV2' test.out

#- 29 UpdateAppV2
./ng net.accelbyte.sdk.cli.Main csm updateAppV2 \
    --app '6h88ox2g' \
    --namespace "$AB_NAMESPACE" \
    --body '{"description": "kmplAtqj"}' \
    > test.out 2>&1
eval_tap $? 29 'UpdateAppV2' test.out

#- 30 CreateSubscriptionHandler
./ng net.accelbyte.sdk.cli.Main csm createSubscriptionHandler \
    --app 'QZWRZwjJ' \
    --namespace "$AB_NAMESPACE" \
    --body '{"topicNames": ["eQUS4Me0", "sNHnvHOG", "piZ8W9dz"]}' \
    > test.out 2>&1
eval_tap $? 30 'CreateSubscriptionHandler' test.out

#- 31 UnsubscribeTopicHandler
./ng net.accelbyte.sdk.cli.Main csm unsubscribeTopicHandler \
    --app 'wpPCqMSX' \
    --namespace "$AB_NAMESPACE" \
    --topicName 'oo3BCA99' \
    > test.out 2>&1
eval_tap $? 31 'UnsubscribeTopicHandler' test.out

#- 32 CreateDeploymentV2
./ng net.accelbyte.sdk.cli.Main csm createDeploymentV2 \
    --app 'IRpdXQu5' \
    --namespace "$AB_NAMESPACE" \
    --body '{"imageTag": "fxh5Y5RI"}' \
    > test.out 2>&1
eval_tap $? 32 'CreateDeploymentV2' test.out

#- 33 GetAppImageListV2
./ng net.accelbyte.sdk.cli.Main csm getAppImageListV2 \
    --app 'C9ykJl1f' \
    --namespace "$AB_NAMESPACE" \
    --cached 'QZsc63YA' \
    > test.out 2>&1
eval_tap $? 33 'GetAppImageListV2' test.out

#- 34 DeleteAppImagesV2
./ng net.accelbyte.sdk.cli.Main csm deleteAppImagesV2 \
    --app 'd3Oo6FAL' \
    --namespace "$AB_NAMESPACE" \
    --body '{"imageTags": ["iMfgW1Gf", "lqMRd5Ij", "LZgZduDl"]}' \
    > test.out 2>&1
eval_tap $? 34 'DeleteAppImagesV2' test.out

#- 35 CreateNoSQLDatabaseCredentialV2
./ng net.accelbyte.sdk.cli.Main csm createNoSQLDatabaseCredentialV2 \
    --app 'wRHI957k' \
    --namespace "$AB_NAMESPACE" \
    --body '{"password": "2JwbpTRd", "username": "mpZInSR8"}' \
    > test.out 2>&1
eval_tap $? 35 'CreateNoSQLDatabaseCredentialV2' test.out

#- 36 GetNoSQLDatabaseV2
./ng net.accelbyte.sdk.cli.Main csm getNoSQLDatabaseV2 \
    --app 'Jmk8kqXb' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 36 'GetNoSQLDatabaseV2' test.out

#- 37 CreateNoSQLDatabaseV2
./ng net.accelbyte.sdk.cli.Main csm createNoSQLDatabaseV2 \
    --app 'inQbJvCy' \
    --namespace "$AB_NAMESPACE" \
    --body '{"dbName": "jEVGkYzK", "password": "hLoBm0GT", "username": "p63OLCaG"}' \
    > test.out 2>&1
eval_tap $? 37 'CreateNoSQLDatabaseV2' test.out

#- 38 DeleteNoSQLDatabaseV2
./ng net.accelbyte.sdk.cli.Main csm deleteNoSQLDatabaseV2 \
    --app 'rq3ef4GZ' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 38 'DeleteNoSQLDatabaseV2' test.out

#- 39 UpdateAppResourcesV2
./ng net.accelbyte.sdk.cli.Main csm updateAppResourcesV2 \
    --app 'Miv3bAhA' \
    --namespace "$AB_NAMESPACE" \
    --body '{"autoscaling": {"targetCPUUtilizationPercent": 64}, "cpu": {"requestCPU": 80}, "memory": {"requestMemory": 45}, "replica": {"maxReplica": 83, "minReplica": 64}, "vmSharingConfiguration": "NpY27XB0"}' \
    > test.out 2>&1
eval_tap $? 39 'UpdateAppResourcesV2' test.out

#- 40 UpdateAppResourcesResourceLimitFormV2
./ng net.accelbyte.sdk.cli.Main csm updateAppResourcesResourceLimitFormV2 \
    --app 'czFOn3RR' \
    --namespace "$AB_NAMESPACE" \
    --body '{"clientEmail": "eWE7Dxoc", "preferredLimitReplica": 42, "requestReason": "IGEoLRa5"}' \
    > test.out 2>&1
eval_tap $? 40 'UpdateAppResourcesResourceLimitFormV2' test.out

#- 41 GetListOfSecretsV2
./ng net.accelbyte.sdk.cli.Main csm getListOfSecretsV2 \
    --app 'BfIthaE8' \
    --namespace "$AB_NAMESPACE" \
    --limit '29' \
    --offset '60' \
    > test.out 2>&1
eval_tap $? 41 'GetListOfSecretsV2' test.out

#- 42 SaveSecretV2
./ng net.accelbyte.sdk.cli.Main csm saveSecretV2 \
    --app 'WdEmIRwg' \
    --namespace "$AB_NAMESPACE" \
    --body '{"configName": "FJQ4eVLn", "description": "EEGsq53Y", "source": "Zr7VjXLF", "value": "zrcnagCS"}' \
    > test.out 2>&1
eval_tap $? 42 'SaveSecretV2' test.out

#- 43 UpdateSecretV2
./ng net.accelbyte.sdk.cli.Main csm updateSecretV2 \
    --app 'ORNULLkK' \
    --configId 'mHRK7Apm' \
    --namespace "$AB_NAMESPACE" \
    --body '{"description": "glFVHaac", "value": "MtFHrDtH"}' \
    > test.out 2>&1
eval_tap $? 43 'UpdateSecretV2' test.out

#- 44 DeleteSecretV2
./ng net.accelbyte.sdk.cli.Main csm deleteSecretV2 \
    --app 'YDUGsmke' \
    --configId '92pOHuYm' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 44 'DeleteSecretV2' test.out

#- 45 StartAppV2
./ng net.accelbyte.sdk.cli.Main csm startAppV2 \
    --app 'MEdcvz3Y' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 45 'StartAppV2' test.out

#- 46 StopAppV2
./ng net.accelbyte.sdk.cli.Main csm stopAppV2 \
    --app '4sL76sco' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 46 'StopAppV2' test.out

#- 47 GetNotificationSubscriberListV2
./ng net.accelbyte.sdk.cli.Main csm getNotificationSubscriberListV2 \
    --app 'Bwq0L5jj' \
    --namespace "$AB_NAMESPACE" \
    --notificationType '9N4nVy3q' \
    > test.out 2>&1
eval_tap $? 47 'GetNotificationSubscriberListV2' test.out

#- 48 BulkSaveSubscriptionAppNotificationV2
./ng net.accelbyte.sdk.cli.Main csm bulkSaveSubscriptionAppNotificationV2 \
    --app 'kCFgUDMe' \
    --namespace "$AB_NAMESPACE" \
    --body '{"subscribers": [{"emailAddress": "vGZlCSHk", "notificationType": {"bjrYnUk2": false, "aXgRLyD4": true, "1IrRq2Y2": true}, "userId": "IZ7epB24"}, {"emailAddress": "RlyoBkDZ", "notificationType": {"Aa7eT43I": false, "jqmarqKa": true, "odMgmnAY": true}, "userId": "jhIUCC07"}, {"emailAddress": "JOr3TnN1", "notificationType": {"pjpWXi2h": true, "t2lWCgtZ": false, "hNifkIv6": false}, "userId": "1b2UvgFr"}]}' \
    > test.out 2>&1
eval_tap $? 48 'BulkSaveSubscriptionAppNotificationV2' test.out

#- 49 SubscribeAppNotificationV2
./ng net.accelbyte.sdk.cli.Main csm subscribeAppNotificationV2 \
    --app '7wvYUicu' \
    --namespace "$AB_NAMESPACE" \
    --body '{"notificationType": "vS8DCyaS", "subscribers": [{"emailAddress": "e0pDcT4c", "userId": "1O7JFBRv"}, {"emailAddress": "10HZoq5l", "userId": "RrT2zLxE"}, {"emailAddress": "8y9hyrzH", "userId": "dhTxnBjg"}]}' \
    > test.out 2>&1
eval_tap $? 49 'SubscribeAppNotificationV2' test.out

#- 50 GetSubscriptionV2Handler
./ng net.accelbyte.sdk.cli.Main csm getSubscriptionV2Handler \
    --app 'xPPBPsmx' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 50 'GetSubscriptionV2Handler' test.out

#- 51 SubscribeV2Handler
./ng net.accelbyte.sdk.cli.Main csm subscribeV2Handler \
    --app '8chDVduf' \
    --namespace "$AB_NAMESPACE" \
    --body '{"notificationType": "QTSjhssV"}' \
    > test.out 2>&1
eval_tap $? 51 'SubscribeV2Handler' test.out

#- 52 UnsubscribeV2Handler
./ng net.accelbyte.sdk.cli.Main csm unsubscribeV2Handler \
    --app '6EqtQWMd' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 52 'UnsubscribeV2Handler' test.out

#- 53 DeleteSubscriptionAppNotificationByUserIDV2
./ng net.accelbyte.sdk.cli.Main csm deleteSubscriptionAppNotificationByUserIDV2 \
    --app 'jBxAB795' \
    --namespace "$AB_NAMESPACE" \
    --userId 'kYJ99LE2' \
    > test.out 2>&1
eval_tap $? 53 'DeleteSubscriptionAppNotificationByUserIDV2' test.out

#- 54 DeleteSubscriptionAppNotificationV2
eval_tap 0 54 'DeleteSubscriptionAppNotificationV2 # SKIP deprecated' test.out

#- 55 GetListOfVariablesV2
./ng net.accelbyte.sdk.cli.Main csm getListOfVariablesV2 \
    --app 'Cb6S7biX' \
    --namespace "$AB_NAMESPACE" \
    --limit '83' \
    --offset '34' \
    > test.out 2>&1
eval_tap $? 55 'GetListOfVariablesV2' test.out

#- 56 SaveVariableV2
./ng net.accelbyte.sdk.cli.Main csm saveVariableV2 \
    --app 'maPl8JR3' \
    --namespace "$AB_NAMESPACE" \
    --body '{"applyMask": false, "configName": "32zjM8Ym", "description": "PUdDYLC6", "source": "OpxyTBpw", "value": "7pNha6ZY"}' \
    > test.out 2>&1
eval_tap $? 56 'SaveVariableV2' test.out

#- 57 UpdateVariableV2
./ng net.accelbyte.sdk.cli.Main csm updateVariableV2 \
    --app 'NsFS2hfT' \
    --configId 'StMfGs3P' \
    --namespace "$AB_NAMESPACE" \
    --body '{"applyMask": false, "description": "A7bVzgQy", "value": "wAqTn9pr"}' \
    > test.out 2>&1
eval_tap $? 57 'UpdateVariableV2' test.out

#- 58 DeleteVariableV2
./ng net.accelbyte.sdk.cli.Main csm deleteVariableV2 \
    --app 'B5Aq3MIf' \
    --configId 'SOb5pJsN' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 58 'DeleteVariableV2' test.out

#- 59 ListTopicsHandler
./ng net.accelbyte.sdk.cli.Main csm listTopicsHandler \
    --namespace "$AB_NAMESPACE" \
    --fuzzyTopicName 'ewEQYTdv' \
    --isSubscribedByAppName 'kdfrt57P' \
    --isUnsubscribedByAppName 'vReadYlc' \
    --limit '41' \
    --offset '43' \
    > test.out 2>&1
eval_tap $? 59 'ListTopicsHandler' test.out

#- 60 CreateTopicHandler
./ng net.accelbyte.sdk.cli.Main csm createTopicHandler \
    --namespace "$AB_NAMESPACE" \
    --body '{"description": "9sYIVB2A", "topicName": "1XVwiVW6"}' \
    > test.out 2>&1
eval_tap $? 60 'CreateTopicHandler' test.out

#- 61 DeleteTopicHandler
./ng net.accelbyte.sdk.cli.Main csm deleteTopicHandler \
    --namespace "$AB_NAMESPACE" \
    --topicName 'ezGWEy0B' \
    > test.out 2>&1
eval_tap $? 61 'DeleteTopicHandler' test.out

#- 62 GetListOfDeploymentV2
./ng net.accelbyte.sdk.cli.Main csm getListOfDeploymentV2 \
    --namespace "$AB_NAMESPACE" \
    --limit '3' \
    --offset '82' \
    --body '{"appIds": ["0mAbznmV", "Uo1LwhqT", "S6zC0vJt"], "deploymentIds": ["KXxAGL0c", "IY3K6XmN", "kav58Bv4"], "statuses": ["bTuAPLHq", "RKHOhsk4", "C02ae6Be"]}' \
    > test.out 2>&1
eval_tap $? 62 'GetListOfDeploymentV2' test.out

#- 63 GetDeploymentV2
./ng net.accelbyte.sdk.cli.Main csm getDeploymentV2 \
    --deploymentId 'OEXzpDXI' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 63 'GetDeploymentV2' test.out

#- 64 DeleteDeploymentV2
./ng net.accelbyte.sdk.cli.Main csm deleteDeploymentV2 \
    --deploymentId 'BQZDhHRd' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 64 'DeleteDeploymentV2' test.out

#- 65 GetNoSQLClusterV2
./ng net.accelbyte.sdk.cli.Main csm getNoSQLClusterV2 \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 65 'GetNoSQLClusterV2' test.out

#- 66 UpdateNoSQLClusterV2
./ng net.accelbyte.sdk.cli.Main csm updateNoSQLClusterV2 \
    --namespace "$AB_NAMESPACE" \
    --body '{"maxDCU": 0.02411238798929327, "minDCU": 0.9728893505157782, "profileName": "nyqRidXo"}' \
    > test.out 2>&1
eval_tap $? 66 'UpdateNoSQLClusterV2' test.out

#- 67 CreateNoSQLClusterV2
./ng net.accelbyte.sdk.cli.Main csm createNoSQLClusterV2 \
    --namespace "$AB_NAMESPACE" \
    --body '{"maxDCU": 0.9105276592927538, "minDCU": 0.6754766470786222, "profileName": "SZ6q1epk"}' \
    > test.out 2>&1
eval_tap $? 67 'CreateNoSQLClusterV2' test.out

#- 68 DeleteNoSQLClusterV2
./ng net.accelbyte.sdk.cli.Main csm deleteNoSQLClusterV2 \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 68 'DeleteNoSQLClusterV2' test.out

#- 69 StartNoSQLClusterV2
./ng net.accelbyte.sdk.cli.Main csm startNoSQLClusterV2 \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 69 'StartNoSQLClusterV2' test.out

#- 70 StopNoSQLClusterV2
./ng net.accelbyte.sdk.cli.Main csm stopNoSQLClusterV2 \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 70 'StopNoSQLClusterV2' test.out

#- 71 GetNoSQLAccessTunnelV2
./ng net.accelbyte.sdk.cli.Main csm getNoSQLAccessTunnelV2 \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 71 'GetNoSQLAccessTunnelV2' test.out

#- 72 GetResourcesLimits
./ng net.accelbyte.sdk.cli.Main csm getResourcesLimits \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 72 'GetResourcesLimits' test.out

#- 73 GetNoSQLAppListV2
./ng net.accelbyte.sdk.cli.Main csm getNoSQLAppListV2 \
    --resourceId 'G9gzVNVJ' \
    --studioName 'LJW7Jnvd' \
    --appName 'RSpVaxZ2' \
    --limit '37' \
    --namespace "$AB_NAMESPACE" \
    --offset '52' \
    > test.out 2>&1
eval_tap $? 73 'GetNoSQLAppListV2' test.out

#- 74 GetNotificationSubscriberListV3
./ng net.accelbyte.sdk.cli.Main csm getNotificationSubscriberListV3 \
    --app 'GFGjS4Dp' \
    --namespace "$AB_NAMESPACE" \
    --notificationType 'RC6SZrmQ' \
    > test.out 2>&1
eval_tap $? 74 'GetNotificationSubscriberListV3' test.out

#- 75 DeleteSubscriptionAppNotificationV3
./ng net.accelbyte.sdk.cli.Main csm deleteSubscriptionAppNotificationV3 \
    --app '1nTkvoZU' \
    --namespace "$AB_NAMESPACE" \
    --emailAddress 'yxvp41NQ' \
    --userId 'M0XLYTHc' \
    > test.out 2>&1
eval_tap $? 75 'DeleteSubscriptionAppNotificationV3' test.out


rm -f "tmp.dat"

exit $EXIT_CODE