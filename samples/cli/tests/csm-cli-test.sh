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
    --app 'PkoxfnlM' \
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
    --limit '60' \
    --offset '9' \
    --body '{"appNames": ["y3a6hlko", "0CCOR7qe", "ZjWvLlLP"], "appStatuses": ["i7qaEpgg", "YIGhUtJK", "nZvVHeBY"], "fuzzyAppName": "8M6fdnjt", "scenario": "gKKb0Irh"}' \
    > test.out 2>&1
eval_tap $? 25 'GetAppListV2' test.out

#- 26 GetAppV2
./ng net.accelbyte.sdk.cli.Main csm getAppV2 \
    --app '5Q9F6h8J' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 26 'GetAppV2' test.out

#- 27 CreateAppV2
./ng net.accelbyte.sdk.cli.Main csm createAppV2 \
    --app 'EOUCXtvk' \
    --namespace "$AB_NAMESPACE" \
    --body '{"autoscaling": {"targetCPUUtilizationPercent": 85}, "cpu": {"requestCPU": 78}, "description": "O49raRvj", "memory": {"requestMemory": 66}, "replica": {"maxReplica": 65, "minReplica": 22}, "scenario": "pq6U3M5q", "vmSharingConfiguration": "E9haEB6K"}' \
    > test.out 2>&1
eval_tap $? 27 'CreateAppV2' test.out

#- 28 DeleteAppV2
./ng net.accelbyte.sdk.cli.Main csm deleteAppV2 \
    --app 'nIKNww7F' \
    --namespace "$AB_NAMESPACE" \
    --forced 'ywa4Rcnx' \
    > test.out 2>&1
eval_tap $? 28 'DeleteAppV2' test.out

#- 29 UpdateAppV2
./ng net.accelbyte.sdk.cli.Main csm updateAppV2 \
    --app '59eQG0kq' \
    --namespace "$AB_NAMESPACE" \
    --body '{"description": "KCzq9VAh"}' \
    > test.out 2>&1
eval_tap $? 29 'UpdateAppV2' test.out

#- 30 CreateDeploymentV2
./ng net.accelbyte.sdk.cli.Main csm createDeploymentV2 \
    --app 'nSMe1zqC' \
    --namespace "$AB_NAMESPACE" \
    --body '{"imageTag": "h9izsJG3"}' \
    > test.out 2>&1
eval_tap $? 30 'CreateDeploymentV2' test.out

#- 31 GetAppImageListV2
./ng net.accelbyte.sdk.cli.Main csm getAppImageListV2 \
    --app 'CdF6PvES' \
    --namespace "$AB_NAMESPACE" \
    --cached '0WBzhHtx' \
    > test.out 2>&1
eval_tap $? 31 'GetAppImageListV2' test.out

#- 32 DeleteAppImagesV2
./ng net.accelbyte.sdk.cli.Main csm deleteAppImagesV2 \
    --app 'LOKvwhd4' \
    --namespace "$AB_NAMESPACE" \
    --body '{"imageTags": ["7Gf4Buua", "omiRkbCO", "Dmaeoojo"]}' \
    > test.out 2>&1
eval_tap $? 32 'DeleteAppImagesV2' test.out

#- 33 UpdateAppResourcesV2
./ng net.accelbyte.sdk.cli.Main csm updateAppResourcesV2 \
    --app 'PnKNZlFZ' \
    --namespace "$AB_NAMESPACE" \
    --body '{"autoscaling": {"targetCPUUtilizationPercent": 3}, "cpu": {"requestCPU": 30}, "memory": {"requestMemory": 40}, "replica": {"maxReplica": 13, "minReplica": 36}, "vmSharingConfiguration": "aOcuchIj"}' \
    > test.out 2>&1
eval_tap $? 33 'UpdateAppResourcesV2' test.out

#- 34 UpdateAppResourcesResourceLimitFormV2
./ng net.accelbyte.sdk.cli.Main csm updateAppResourcesResourceLimitFormV2 \
    --app 'C2upJQSD' \
    --namespace "$AB_NAMESPACE" \
    --body '{"clientEmail": "7Ffj8sq0", "preferredLimitReplica": 76, "requestReason": "gF8Fyvrp"}' \
    > test.out 2>&1
eval_tap $? 34 'UpdateAppResourcesResourceLimitFormV2' test.out

#- 35 GetListOfSecretsV2
./ng net.accelbyte.sdk.cli.Main csm getListOfSecretsV2 \
    --app 'jRNoTSAQ' \
    --namespace "$AB_NAMESPACE" \
    --limit '25' \
    --offset '82' \
    > test.out 2>&1
eval_tap $? 35 'GetListOfSecretsV2' test.out

#- 36 SaveSecretV2
./ng net.accelbyte.sdk.cli.Main csm saveSecretV2 \
    --app 'fewkZTlM' \
    --namespace "$AB_NAMESPACE" \
    --body '{"applyMask": false, "configName": "BLl7UTbh", "description": "qRrLYwHd", "source": "lM66mJTK", "value": "inaXfYSz"}' \
    > test.out 2>&1
eval_tap $? 36 'SaveSecretV2' test.out

#- 37 UpdateSecretV2
./ng net.accelbyte.sdk.cli.Main csm updateSecretV2 \
    --app '8R6mDKxt' \
    --configId 'LyE871HU' \
    --namespace "$AB_NAMESPACE" \
    --body '{"applyMask": true, "description": "BUWOcjLE", "value": "peRm0u6K"}' \
    > test.out 2>&1
eval_tap $? 37 'UpdateSecretV2' test.out

#- 38 DeleteSecretV2
./ng net.accelbyte.sdk.cli.Main csm deleteSecretV2 \
    --app 'PeDVl4vM' \
    --configId 'FSXyrVV0' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 38 'DeleteSecretV2' test.out

#- 39 StartAppV2
./ng net.accelbyte.sdk.cli.Main csm startAppV2 \
    --app 'E2rDPh0l' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 39 'StartAppV2' test.out

#- 40 StopAppV2
./ng net.accelbyte.sdk.cli.Main csm stopAppV2 \
    --app 'EThWRtFT' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 40 'StopAppV2' test.out

#- 41 GetNotificationSubscriberListV2
./ng net.accelbyte.sdk.cli.Main csm getNotificationSubscriberListV2 \
    --app '8TYyIZI3' \
    --namespace "$AB_NAMESPACE" \
    --notificationType 'mKY7pT2U' \
    > test.out 2>&1
eval_tap $? 41 'GetNotificationSubscriberListV2' test.out

#- 42 BulkSaveSubscriptionAppNotificationV2
./ng net.accelbyte.sdk.cli.Main csm bulkSaveSubscriptionAppNotificationV2 \
    --app 'qNAXsSJX' \
    --namespace "$AB_NAMESPACE" \
    --body '{"subscribers": [{"notificationType": {"k7mANql6": true, "ryJmEKFU": false, "rxJONora": true}, "userId": "nMM6haj8"}, {"notificationType": {"B5pQWb8a": true, "pw6FOFWW": true, "NZHkD9b6": false}, "userId": "TDQddqy1"}, {"notificationType": {"9ma0FBYq": false, "b4MeJMkg": true, "AAmyqs8Q": true}, "userId": "omahcwFT"}]}' \
    > test.out 2>&1
eval_tap $? 42 'BulkSaveSubscriptionAppNotificationV2' test.out

#- 43 SubscribeAppNotificationV2
./ng net.accelbyte.sdk.cli.Main csm subscribeAppNotificationV2 \
    --app 'EkwspGkA' \
    --namespace "$AB_NAMESPACE" \
    --body '{"notificationType": "JSfJDkE5", "subscribers": [{"userId": "tCNLe4xj"}, {"userId": "rqgdNfxn"}, {"userId": "Hv9KpzEE"}]}' \
    > test.out 2>&1
eval_tap $? 43 'SubscribeAppNotificationV2' test.out

#- 44 GetSubscriptionV2Handler
./ng net.accelbyte.sdk.cli.Main csm getSubscriptionV2Handler \
    --app 'kqf7QBic' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 44 'GetSubscriptionV2Handler' test.out

#- 45 SubscribeV2Handler
./ng net.accelbyte.sdk.cli.Main csm subscribeV2Handler \
    --app 'z7DFnzg5' \
    --namespace "$AB_NAMESPACE" \
    --body '{"notificationType": "B1VxaxdF"}' \
    > test.out 2>&1
eval_tap $? 45 'SubscribeV2Handler' test.out

#- 46 UnsubscribeV2Handler
./ng net.accelbyte.sdk.cli.Main csm unsubscribeV2Handler \
    --app 'yr3SyGLQ' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 46 'UnsubscribeV2Handler' test.out

#- 47 DeleteSubscriptionAppNotificationByUserIDV2
./ng net.accelbyte.sdk.cli.Main csm deleteSubscriptionAppNotificationByUserIDV2 \
    --app 'rTDzCddw' \
    --namespace "$AB_NAMESPACE" \
    --userId '99fJT4D8' \
    > test.out 2>&1
eval_tap $? 47 'DeleteSubscriptionAppNotificationByUserIDV2' test.out

#- 48 DeleteSubscriptionAppNotificationV2
eval_tap 0 48 'DeleteSubscriptionAppNotificationV2 # SKIP deprecated' test.out

#- 49 GetListOfVariablesV2
./ng net.accelbyte.sdk.cli.Main csm getListOfVariablesV2 \
    --app 'Twdx19nb' \
    --namespace "$AB_NAMESPACE" \
    --limit '10' \
    --offset '32' \
    > test.out 2>&1
eval_tap $? 49 'GetListOfVariablesV2' test.out

#- 50 SaveVariableV2
./ng net.accelbyte.sdk.cli.Main csm saveVariableV2 \
    --app 'Yrq187Qv' \
    --namespace "$AB_NAMESPACE" \
    --body '{"applyMask": false, "configName": "2GrKDjEX", "description": "9L727xtV", "source": "pr3r5LFQ", "value": "agRJuxI8"}' \
    > test.out 2>&1
eval_tap $? 50 'SaveVariableV2' test.out

#- 51 UpdateVariableV2
./ng net.accelbyte.sdk.cli.Main csm updateVariableV2 \
    --app 'CDkKPrB3' \
    --configId '8lYDm1pa' \
    --namespace "$AB_NAMESPACE" \
    --body '{"applyMask": false, "description": "41LWYFG0", "value": "SE3EWZ3t"}' \
    > test.out 2>&1
eval_tap $? 51 'UpdateVariableV2' test.out

#- 52 DeleteVariableV2
./ng net.accelbyte.sdk.cli.Main csm deleteVariableV2 \
    --app 'yd4hqMWN' \
    --configId 'iBwSii5H' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 52 'DeleteVariableV2' test.out

#- 53 GetListOfDeploymentV2
./ng net.accelbyte.sdk.cli.Main csm getListOfDeploymentV2 \
    --namespace "$AB_NAMESPACE" \
    --limit '30' \
    --offset '84' \
    --body '{"appIds": ["eqJg9wLC", "J84hBfO6", "4wnW7onU"], "deploymentIds": ["kchsuawr", "pK1aehsZ", "eKGfmKuN"], "statuses": ["UUPgADqZ", "kIFluuP2", "RXQ5olXs"]}' \
    > test.out 2>&1
eval_tap $? 53 'GetListOfDeploymentV2' test.out

#- 54 GetDeploymentV2
./ng net.accelbyte.sdk.cli.Main csm getDeploymentV2 \
    --deploymentId 'QIGl616u' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 54 'GetDeploymentV2' test.out

#- 55 DeleteDeploymentV2
./ng net.accelbyte.sdk.cli.Main csm deleteDeploymentV2 \
    --deploymentId 'wrIhSuYG' \
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