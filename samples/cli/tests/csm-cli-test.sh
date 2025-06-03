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
echo "1..56"

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
    --app 'P7tDGcS9' \
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
    --limit '98' \
    --offset '29' \
    --body '{"appNames": ["rU57e86h", "BGnZbyND", "dvJ3dBNI"], "appStatuses": ["WvM8F1aP", "QcrEJj0e", "EsPQmQVL"], "fuzzyAppName": "SZwX4N2i", "scenario": "shTqIZ15"}' \
    > test.out 2>&1
eval_tap $? 25 'GetAppListV2' test.out

#- 26 GetAppV2
./ng net.accelbyte.sdk.cli.Main csm getAppV2 \
    --app 'nUcFszLr' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 26 'GetAppV2' test.out

#- 27 CreateAppV2
./ng net.accelbyte.sdk.cli.Main csm createAppV2 \
    --app 'iZB7HKzt' \
    --namespace "$AB_NAMESPACE" \
    --body '{"autoscaling": {"targetCPUUtilizationPercent": 39}, "cpu": {"requestCPU": 86}, "description": "JIZWCuz4", "memory": {"requestMemory": 71}, "replica": {"maxReplica": 46, "minReplica": 80}, "scenario": "FaGQykET", "vmSharingConfiguration": "2EN8mRDW"}' \
    > test.out 2>&1
eval_tap $? 27 'CreateAppV2' test.out

#- 28 DeleteAppV2
./ng net.accelbyte.sdk.cli.Main csm deleteAppV2 \
    --app 'bva0IQyO' \
    --namespace "$AB_NAMESPACE" \
    --forced '5s1DwEhp' \
    > test.out 2>&1
eval_tap $? 28 'DeleteAppV2' test.out

#- 29 UpdateAppV2
./ng net.accelbyte.sdk.cli.Main csm updateAppV2 \
    --app '4swnIB7X' \
    --namespace "$AB_NAMESPACE" \
    --body '{"description": "BpjKTAfc"}' \
    > test.out 2>&1
eval_tap $? 29 'UpdateAppV2' test.out

#- 30 CreateDeploymentV2
./ng net.accelbyte.sdk.cli.Main csm createDeploymentV2 \
    --app 'Xh0FYTyM' \
    --namespace "$AB_NAMESPACE" \
    --body '{"imageTag": "vFoh1j1u"}' \
    > test.out 2>&1
eval_tap $? 30 'CreateDeploymentV2' test.out

#- 31 GetAppImageListV2
./ng net.accelbyte.sdk.cli.Main csm getAppImageListV2 \
    --app 'YquGsn6x' \
    --namespace "$AB_NAMESPACE" \
    --cached 'Riv7bArw' \
    > test.out 2>&1
eval_tap $? 31 'GetAppImageListV2' test.out

#- 32 DeleteAppImagesV2
./ng net.accelbyte.sdk.cli.Main csm deleteAppImagesV2 \
    --app 'FB5Bf2Zo' \
    --namespace "$AB_NAMESPACE" \
    --body '{"imageTags": ["vZXpfsE4", "8q1WtGgL", "gaeQzcpl"]}' \
    > test.out 2>&1
eval_tap $? 32 'DeleteAppImagesV2' test.out

#- 33 UpdateAppResourcesV2
./ng net.accelbyte.sdk.cli.Main csm updateAppResourcesV2 \
    --app 'OGTiHKw4' \
    --namespace "$AB_NAMESPACE" \
    --body '{"autoscaling": {"targetCPUUtilizationPercent": 42}, "cpu": {"requestCPU": 59}, "memory": {"requestMemory": 79}, "replica": {"maxReplica": 58, "minReplica": 30}, "vmSharingConfiguration": "WJzMn78S"}' \
    > test.out 2>&1
eval_tap $? 33 'UpdateAppResourcesV2' test.out

#- 34 UpdateAppResourcesResourceLimitFormV2
./ng net.accelbyte.sdk.cli.Main csm updateAppResourcesResourceLimitFormV2 \
    --app 'Co4UUXE1' \
    --namespace "$AB_NAMESPACE" \
    --body '{"clientEmail": "3YfbNDSc", "preferredLimitReplica": 92, "requestReason": "GAn3OD5d"}' \
    > test.out 2>&1
eval_tap $? 34 'UpdateAppResourcesResourceLimitFormV2' test.out

#- 35 GetListOfSecretsV2
./ng net.accelbyte.sdk.cli.Main csm getListOfSecretsV2 \
    --app 'Oc0xIMjK' \
    --namespace "$AB_NAMESPACE" \
    --limit '92' \
    --offset '53' \
    > test.out 2>&1
eval_tap $? 35 'GetListOfSecretsV2' test.out

#- 36 SaveSecretV2
./ng net.accelbyte.sdk.cli.Main csm saveSecretV2 \
    --app 'BBpXCi26' \
    --namespace "$AB_NAMESPACE" \
    --body '{"configName": "CQseRTAS", "description": "7si7HUxl", "source": "keFvDYqC", "value": "a09WJYuZ"}' \
    > test.out 2>&1
eval_tap $? 36 'SaveSecretV2' test.out

#- 37 UpdateSecretV2
./ng net.accelbyte.sdk.cli.Main csm updateSecretV2 \
    --app 'LdcssHc9' \
    --configId 'jyS9AHl6' \
    --namespace "$AB_NAMESPACE" \
    --body '{"description": "23WUuPT1", "value": "5PzI1Pwf"}' \
    > test.out 2>&1
eval_tap $? 37 'UpdateSecretV2' test.out

#- 38 DeleteSecretV2
./ng net.accelbyte.sdk.cli.Main csm deleteSecretV2 \
    --app '9FS6cPWM' \
    --configId 'MjsJ7Wq9' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 38 'DeleteSecretV2' test.out

#- 39 StartAppV2
./ng net.accelbyte.sdk.cli.Main csm startAppV2 \
    --app 'wp9zDIgR' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 39 'StartAppV2' test.out

#- 40 StopAppV2
./ng net.accelbyte.sdk.cli.Main csm stopAppV2 \
    --app 'PTjDNerb' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 40 'StopAppV2' test.out

#- 41 GetNotificationSubscriberListV2
./ng net.accelbyte.sdk.cli.Main csm getNotificationSubscriberListV2 \
    --app 'SUeyh2Ev' \
    --namespace "$AB_NAMESPACE" \
    --notificationType 'nYKGdGs0' \
    > test.out 2>&1
eval_tap $? 41 'GetNotificationSubscriberListV2' test.out

#- 42 BulkSaveSubscriptionAppNotificationV2
./ng net.accelbyte.sdk.cli.Main csm bulkSaveSubscriptionAppNotificationV2 \
    --app 'QfGcMV5l' \
    --namespace "$AB_NAMESPACE" \
    --body '{"subscribers": [{"notificationType": {"e5ibrDSU": false, "MI44MEv9": false, "pOrClhgT": false}, "userId": "aXvdOZx2"}, {"notificationType": {"yk398AWV": false, "VAuOX3TL": false, "JJsScjJn": false}, "userId": "uJIfALBF"}, {"notificationType": {"O08WSGXL": true, "nRoZ7WQS": true, "pZJ7Saal": false}, "userId": "yuDyt99e"}]}' \
    > test.out 2>&1
eval_tap $? 42 'BulkSaveSubscriptionAppNotificationV2' test.out

#- 43 SubscribeAppNotificationV2
./ng net.accelbyte.sdk.cli.Main csm subscribeAppNotificationV2 \
    --app 'E7ia5AtF' \
    --namespace "$AB_NAMESPACE" \
    --body '{"notificationType": "yfnw3xDL", "subscribers": [{"userId": "OYX184hl"}, {"userId": "bgFRie3t"}, {"userId": "IvG802bf"}]}' \
    > test.out 2>&1
eval_tap $? 43 'SubscribeAppNotificationV2' test.out

#- 44 GetSubscriptionV2Handler
./ng net.accelbyte.sdk.cli.Main csm getSubscriptionV2Handler \
    --app 'G7teyrEX' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 44 'GetSubscriptionV2Handler' test.out

#- 45 SubscribeV2Handler
./ng net.accelbyte.sdk.cli.Main csm subscribeV2Handler \
    --app 'ZKvyIjBU' \
    --namespace "$AB_NAMESPACE" \
    --body '{"notificationType": "Q5c8W2X8"}' \
    > test.out 2>&1
eval_tap $? 45 'SubscribeV2Handler' test.out

#- 46 UnsubscribeV2Handler
./ng net.accelbyte.sdk.cli.Main csm unsubscribeV2Handler \
    --app 'fRyvMkqW' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 46 'UnsubscribeV2Handler' test.out

#- 47 DeleteSubscriptionAppNotificationByUserIDV2
./ng net.accelbyte.sdk.cli.Main csm deleteSubscriptionAppNotificationByUserIDV2 \
    --app 'Jaglmbgq' \
    --namespace "$AB_NAMESPACE" \
    --userId 'ZNHqfof6' \
    > test.out 2>&1
eval_tap $? 47 'DeleteSubscriptionAppNotificationByUserIDV2' test.out

#- 48 DeleteSubscriptionAppNotificationV2
eval_tap 0 48 'DeleteSubscriptionAppNotificationV2 # SKIP deprecated' test.out

#- 49 GetListOfVariablesV2
./ng net.accelbyte.sdk.cli.Main csm getListOfVariablesV2 \
    --app 'YPh2QKkK' \
    --namespace "$AB_NAMESPACE" \
    --limit '50' \
    --offset '94' \
    > test.out 2>&1
eval_tap $? 49 'GetListOfVariablesV2' test.out

#- 50 SaveVariableV2
./ng net.accelbyte.sdk.cli.Main csm saveVariableV2 \
    --app 'B8u6ivUc' \
    --namespace "$AB_NAMESPACE" \
    --body '{"applyMask": true, "configName": "ZMiydpmh", "description": "k9boZpp9", "source": "AMqtifZ6", "value": "cMaWk8qZ"}' \
    > test.out 2>&1
eval_tap $? 50 'SaveVariableV2' test.out

#- 51 UpdateVariableV2
./ng net.accelbyte.sdk.cli.Main csm updateVariableV2 \
    --app '5IrDRVHF' \
    --configId 'vIduQiT1' \
    --namespace "$AB_NAMESPACE" \
    --body '{"applyMask": false, "description": "0Dm8zBnp", "value": "5wtZvADR"}' \
    > test.out 2>&1
eval_tap $? 51 'UpdateVariableV2' test.out

#- 52 DeleteVariableV2
./ng net.accelbyte.sdk.cli.Main csm deleteVariableV2 \
    --app 'MNm2xJYr' \
    --configId '4zbbeqog' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 52 'DeleteVariableV2' test.out

#- 53 GetListOfDeploymentV2
./ng net.accelbyte.sdk.cli.Main csm getListOfDeploymentV2 \
    --namespace "$AB_NAMESPACE" \
    --limit '59' \
    --offset '37' \
    --body '{"appIds": ["nABMgvEX", "Je4oSHBK", "mMspCpUC"], "deploymentIds": ["tMBmbTZK", "k7EXeTLk", "B23q1Iaa"], "statuses": ["i3g2eUtw", "ym9JNGa2", "bYgKrxcM"]}' \
    > test.out 2>&1
eval_tap $? 53 'GetListOfDeploymentV2' test.out

#- 54 GetDeploymentV2
./ng net.accelbyte.sdk.cli.Main csm getDeploymentV2 \
    --deploymentId '1fNL3epO' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 54 'GetDeploymentV2' test.out

#- 55 DeleteDeploymentV2
./ng net.accelbyte.sdk.cli.Main csm deleteDeploymentV2 \
    --deploymentId 'yRnjefJD' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 55 'DeleteDeploymentV2' test.out

#- 56 GetResourcesLimits
./ng net.accelbyte.sdk.cli.Main csm getResourcesLimits \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 56 'GetResourcesLimits' test.out


rm -f "tmp.dat"

exit $EXIT_CODE