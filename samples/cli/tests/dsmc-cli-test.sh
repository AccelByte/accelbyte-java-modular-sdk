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
echo "1..89"

#- 1 Login
./ng net.accelbyte.sdk.cli.Main loginClient \
    > test.out 2>&1
eval_tap $? 1 'Login' test.out

if [ $EXIT_CODE -ne 0 ]; then
  echo "Bail out! Login failed."
  exit $EXIT_CODE
fi

touch "tmp.dat"

#- 2 ListConfig
./ng net.accelbyte.sdk.cli.Main dsmc listConfig \
    > test.out 2>&1
eval_tap $? 2 'ListConfig' test.out

#- 3 SaveConfig
eval_tap 0 3 'SaveConfig # SKIP deprecated' test.out

#- 4 UpdateImage
./ng net.accelbyte.sdk.cli.Main dsmc updateImage \
    --body '{"artifactPath": "gBBhdsyz", "coreDumpEnabled": false, "image": "r3Gdcagu", "imageReplicationsMap": {"Zogb5vLz": {"failure_code": "6rnRKnne", "region": "RCobqMXl", "status": "cryfWmrG", "uri": "b7K1duGM"}, "T7W1fs8t": {"failure_code": "1P6DgQSV", "region": "55G7R7Lk", "status": "xrWVFyjj", "uri": "sf02BzT1"}, "GWxjiCNS": {"failure_code": "kNKq7Qg1", "region": "XfDlfXIZ", "status": "AcUYDKvm", "uri": "scK0iZI3"}}, "namespace": "lRMysdvW", "patchVersion": "mxbYYU49", "persistent": false, "ulimitFileSize": 56, "version": "JQsi2sGA"}' \
    > test.out 2>&1
eval_tap $? 4 'UpdateImage' test.out

#- 5 CreateImage
./ng net.accelbyte.sdk.cli.Main dsmc createImage \
    --body '{"artifactPath": "ibVoaK9P", "coreDumpEnabled": true, "dockerPath": "yzU688EI", "image": "7TtSQxJg", "imageSize": 24, "namespace": "DQ58aDFN", "persistent": true, "ulimitFileSize": 68, "version": "YEdb0KNw"}' \
    > test.out 2>&1
eval_tap $? 5 'CreateImage' test.out

#- 6 CreateImagePatch
./ng net.accelbyte.sdk.cli.Main dsmc createImagePatch \
    --body '{"artifactPath": "azM9Weax", "coreDumpEnabled": false, "dockerPath": "T2kLqSNR", "image": "78AFyKca", "imageSize": 55, "namespace": "lJs6xh4j", "patchVersion": "aT44VwNM", "persistent": false, "ulimitFileSize": 34, "uploaderFlag": "UBARjgax", "version": "cvwruQwr"}' \
    > test.out 2>&1
eval_tap $? 6 'CreateImagePatch' test.out

#- 7 GetLowestInstanceSpec
./ng net.accelbyte.sdk.cli.Main dsmc getLowestInstanceSpec \
    > test.out 2>&1
eval_tap $? 7 'GetLowestInstanceSpec' test.out

#- 8 GetWorkerConfig
./ng net.accelbyte.sdk.cli.Main dsmc getWorkerConfig \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 8 'GetWorkerConfig' test.out

#- 9 UpdateWorkerConfig
./ng net.accelbyte.sdk.cli.Main dsmc updateWorkerConfig \
    --namespace "$AB_NAMESPACE" \
    --body '{"auto_deletion": true, "ghost_worker": true, "manual_buffer_override": true, "zombie_worker": true}' \
    > test.out 2>&1
eval_tap $? 9 'UpdateWorkerConfig' test.out

#- 10 CreateWorkerConfig
./ng net.accelbyte.sdk.cli.Main dsmc createWorkerConfig \
    --namespace "$AB_NAMESPACE" \
    --body '{"auto_deletion": false, "ghost_worker": false, "manual_buffer_override": true, "zombie_worker": true}' \
    > test.out 2>&1
eval_tap $? 10 'CreateWorkerConfig' test.out

#- 11 GetConfig
./ng net.accelbyte.sdk.cli.Main dsmc getConfig \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 11 'GetConfig' test.out

#- 12 CreateConfig
./ng net.accelbyte.sdk.cli.Main dsmc createConfig \
    --namespace "$AB_NAMESPACE" \
    --body '{"claim_timeout": 61, "creation_timeout": 86, "default_version": "zH6QEERD", "port": 51, "ports": {"EGYsf6FV": 68, "voKkI9Wh": 19, "eA0shuQF": 6}, "protocol": "rLZqxS4g", "providers": ["QGEe91eU", "8E2Ww76J", "G618bPtJ"], "session_timeout": 39, "unreachable_timeout": 33}' \
    > test.out 2>&1
eval_tap $? 12 'CreateConfig' test.out

#- 13 DeleteConfig
./ng net.accelbyte.sdk.cli.Main dsmc deleteConfig \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 13 'DeleteConfig' test.out

#- 14 UpdateConfig
./ng net.accelbyte.sdk.cli.Main dsmc updateConfig \
    --namespace "$AB_NAMESPACE" \
    --body '{"claim_timeout": 14, "creation_timeout": 5, "default_version": "289GWQHp", "port": 49, "protocol": "mb1ysNUZ", "providers": ["1qVl16NF", "l7a57KGe", "dNp7qAN7"], "session_timeout": 4, "unreachable_timeout": 53}' \
    > test.out 2>&1
eval_tap $? 14 'UpdateConfig' test.out

#- 15 ClearCache
./ng net.accelbyte.sdk.cli.Main dsmc clearCache \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 15 'ClearCache' test.out

#- 16 GetAllDeployment
./ng net.accelbyte.sdk.cli.Main dsmc getAllDeployment \
    --namespace "$AB_NAMESPACE" \
    --name '3f29A7dc' \
    --count '81' \
    --offset '64' \
    > test.out 2>&1
eval_tap $? 16 'GetAllDeployment' test.out

#- 17 GetDeployment
./ng net.accelbyte.sdk.cli.Main dsmc getDeployment \
    --deployment 'EQV3F8AO' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 17 'GetDeployment' test.out

#- 18 CreateDeployment
./ng net.accelbyte.sdk.cli.Main dsmc createDeployment \
    --deployment 'SHGqeGr5' \
    --namespace "$AB_NAMESPACE" \
    --body '{"allow_version_override": true, "buffer_count": 85, "buffer_percent": 18, "configuration": "EPdw0EQK", "enable_region_overrides": true, "extendable_session": false, "game_version": "Q2xqTp0a", "max_count": 56, "min_count": 14, "overrides": {"k50eypTk": {"buffer_count": 35, "buffer_percent": 8, "configuration": "fXynlk7V", "enable_region_overrides": false, "extendable_session": false, "game_version": "1PxEvUxb", "max_count": 68, "min_count": 67, "name": "BcGKe4Lh", "region_overrides": {"W2waIUlP": {"buffer_count": 32, "buffer_percent": 20, "max_count": 13, "min_count": 28, "name": "XfGEVuxg", "unlimited": true, "use_buffer_percent": true}, "MfZnotPf": {"buffer_count": 37, "buffer_percent": 13, "max_count": 70, "min_count": 65, "name": "Pib7asvb", "unlimited": false, "use_buffer_percent": false}, "eC5NOnA3": {"buffer_count": 49, "buffer_percent": 58, "max_count": 53, "min_count": 75, "name": "kpkLNF8V", "unlimited": false, "use_buffer_percent": false}}, "regions": ["IeL1Uyhf", "dskW1tFe", "9ys5G3xe"], "session_timeout": 9, "unlimited": false, "use_buffer_percent": true}, "KULUTYj7": {"buffer_count": 83, "buffer_percent": 7, "configuration": "GK3sQkAy", "enable_region_overrides": true, "extendable_session": true, "game_version": "uaalZtgU", "max_count": 95, "min_count": 91, "name": "wtZcrcOY", "region_overrides": {"XPCYGqSA": {"buffer_count": 95, "buffer_percent": 96, "max_count": 20, "min_count": 78, "name": "mih0EqQQ", "unlimited": true, "use_buffer_percent": false}, "2ubrBVpm": {"buffer_count": 76, "buffer_percent": 20, "max_count": 73, "min_count": 4, "name": "Vy5qj5vd", "unlimited": true, "use_buffer_percent": false}, "pkEKddjf": {"buffer_count": 62, "buffer_percent": 96, "max_count": 61, "min_count": 97, "name": "fhoyUGam", "unlimited": false, "use_buffer_percent": true}}, "regions": ["uiHAD8lp", "4UA7p72Q", "gvFLUJcO"], "session_timeout": 19, "unlimited": true, "use_buffer_percent": true}, "5WAY87XH": {"buffer_count": 70, "buffer_percent": 32, "configuration": "BXxCIYZh", "enable_region_overrides": true, "extendable_session": true, "game_version": "YMnRJHZl", "max_count": 55, "min_count": 8, "name": "1ifGW4i7", "region_overrides": {"AgdYqL3a": {"buffer_count": 70, "buffer_percent": 36, "max_count": 29, "min_count": 98, "name": "I5IuPer6", "unlimited": true, "use_buffer_percent": true}, "mcqnMA0B": {"buffer_count": 69, "buffer_percent": 30, "max_count": 95, "min_count": 55, "name": "uJ9mO0jl", "unlimited": true, "use_buffer_percent": false}, "DV8AaKoC": {"buffer_count": 85, "buffer_percent": 47, "max_count": 74, "min_count": 43, "name": "ZPdWsA2H", "unlimited": false, "use_buffer_percent": true}}, "regions": ["jYM7zsCl", "9cbGtnyc", "HZl0wilo"], "session_timeout": 81, "unlimited": true, "use_buffer_percent": true}}, "region_overrides": {"UTMayAl2": {"buffer_count": 62, "buffer_percent": 48, "max_count": 16, "min_count": 15, "name": "PjquWPVt", "unlimited": true, "use_buffer_percent": true}, "2sWGr8xA": {"buffer_count": 16, "buffer_percent": 46, "max_count": 88, "min_count": 85, "name": "dW4CfX7n", "unlimited": true, "use_buffer_percent": true}, "UdZFfnwb": {"buffer_count": 80, "buffer_percent": 22, "max_count": 47, "min_count": 66, "name": "9bBizJl1", "unlimited": false, "use_buffer_percent": true}}, "regions": ["7oXDAImY", "6mvjpAx3", "3wkL4ihe"], "session_timeout": 59, "unlimited": false, "use_buffer_percent": true}' \
    > test.out 2>&1
eval_tap $? 18 'CreateDeployment' test.out

#- 19 DeleteDeployment
./ng net.accelbyte.sdk.cli.Main dsmc deleteDeployment \
    --deployment 'iErQNJbO' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 19 'DeleteDeployment' test.out

#- 20 UpdateDeployment
./ng net.accelbyte.sdk.cli.Main dsmc updateDeployment \
    --deployment 'IUYEPXHr' \
    --namespace "$AB_NAMESPACE" \
    --body '{"allow_version_override": false, "buffer_count": 13, "buffer_percent": 88, "configuration": "GGo7NS5J", "enable_region_overrides": true, "extendable_session": true, "game_version": "iUkU6wbq", "max_count": 45, "min_count": 87, "regions": ["lxGF7Ncg", "ruiSQz8q", "4HMHyXvF"], "session_timeout": 86, "unlimited": true, "use_buffer_percent": true}' \
    > test.out 2>&1
eval_tap $? 20 'UpdateDeployment' test.out

#- 21 CreateRootRegionOverride
./ng net.accelbyte.sdk.cli.Main dsmc createRootRegionOverride \
    --deployment 'y4FGZW0n' \
    --namespace "$AB_NAMESPACE" \
    --region 'CB4U5lYM' \
    --body '{"buffer_count": 13, "buffer_percent": 41, "max_count": 19, "min_count": 96, "unlimited": true, "use_buffer_percent": false}' \
    > test.out 2>&1
eval_tap $? 21 'CreateRootRegionOverride' test.out

#- 22 DeleteRootRegionOverride
./ng net.accelbyte.sdk.cli.Main dsmc deleteRootRegionOverride \
    --deployment '79bitgdL' \
    --namespace "$AB_NAMESPACE" \
    --region 'Waok8BbI' \
    > test.out 2>&1
eval_tap $? 22 'DeleteRootRegionOverride' test.out

#- 23 UpdateRootRegionOverride
./ng net.accelbyte.sdk.cli.Main dsmc updateRootRegionOverride \
    --deployment 'AS8xdtoS' \
    --namespace "$AB_NAMESPACE" \
    --region '639HE2X2' \
    --body '{"buffer_count": 74, "buffer_percent": 23, "max_count": 78, "min_count": 87, "unlimited": true, "use_buffer_percent": false}' \
    > test.out 2>&1
eval_tap $? 23 'UpdateRootRegionOverride' test.out

#- 24 CreateDeploymentOverride
./ng net.accelbyte.sdk.cli.Main dsmc createDeploymentOverride \
    --deployment '9qLpEF0X' \
    --namespace "$AB_NAMESPACE" \
    --version 'ULZuTDcd' \
    --body '{"buffer_count": 62, "buffer_percent": 52, "configuration": "qYjwxNqh", "enable_region_overrides": false, "extendable_session": false, "game_version": "fuSCDff6", "max_count": 73, "min_count": 47, "region_overrides": {"x7yUlDhK": {"buffer_count": 33, "buffer_percent": 55, "max_count": 97, "min_count": 89, "name": "tK8ed5gr", "unlimited": true, "use_buffer_percent": false}, "BggFw95h": {"buffer_count": 63, "buffer_percent": 85, "max_count": 59, "min_count": 85, "name": "uALOnuCg", "unlimited": false, "use_buffer_percent": true}, "zUGUMCs4": {"buffer_count": 55, "buffer_percent": 99, "max_count": 59, "min_count": 35, "name": "yWt5EglH", "unlimited": true, "use_buffer_percent": true}}, "regions": ["vhWSTjlP", "xcSxYCEn", "y9yjumek"], "session_timeout": 22, "unlimited": true, "use_buffer_percent": false}' \
    > test.out 2>&1
eval_tap $? 24 'CreateDeploymentOverride' test.out

#- 25 DeleteDeploymentOverride
./ng net.accelbyte.sdk.cli.Main dsmc deleteDeploymentOverride \
    --deployment '0y7hXseY' \
    --namespace "$AB_NAMESPACE" \
    --version '2ZNbQ9xx' \
    > test.out 2>&1
eval_tap $? 25 'DeleteDeploymentOverride' test.out

#- 26 UpdateDeploymentOverride
./ng net.accelbyte.sdk.cli.Main dsmc updateDeploymentOverride \
    --deployment 'gpOI1zmf' \
    --namespace "$AB_NAMESPACE" \
    --version 'YRcIYlTf' \
    --body '{"buffer_count": 72, "buffer_percent": 89, "configuration": "5QM1j2o1", "enable_region_overrides": true, "game_version": "W52mUvrx", "max_count": 52, "min_count": 34, "regions": ["EKYXte6S", "mKjDxW2s", "tW8SEz2w"], "session_timeout": 96, "unlimited": false, "use_buffer_percent": false}' \
    > test.out 2>&1
eval_tap $? 26 'UpdateDeploymentOverride' test.out

#- 27 CreateOverrideRegionOverride
./ng net.accelbyte.sdk.cli.Main dsmc createOverrideRegionOverride \
    --deployment '4xQ8sdGF' \
    --namespace "$AB_NAMESPACE" \
    --region 'Bwww9on0' \
    --version 'SAiyfN2V' \
    --body '{"buffer_count": 95, "buffer_percent": 69, "max_count": 86, "min_count": 9, "unlimited": true, "use_buffer_percent": true}' \
    > test.out 2>&1
eval_tap $? 27 'CreateOverrideRegionOverride' test.out

#- 28 DeleteOverrideRegionOverride
./ng net.accelbyte.sdk.cli.Main dsmc deleteOverrideRegionOverride \
    --deployment 'q0W9s90c' \
    --namespace "$AB_NAMESPACE" \
    --region 'WfQH9s7A' \
    --version 'N3zD1oQV' \
    > test.out 2>&1
eval_tap $? 28 'DeleteOverrideRegionOverride' test.out

#- 29 UpdateOverrideRegionOverride
./ng net.accelbyte.sdk.cli.Main dsmc updateOverrideRegionOverride \
    --deployment 'ywOKTIdK' \
    --namespace "$AB_NAMESPACE" \
    --region 'vWUmiI7X' \
    --version 'Ganra5mF' \
    --body '{"buffer_count": 51, "buffer_percent": 2, "max_count": 81, "min_count": 30, "unlimited": false, "use_buffer_percent": true}' \
    > test.out 2>&1
eval_tap $? 29 'UpdateOverrideRegionOverride' test.out

#- 30 DeleteCreatingServerCountQueue
./ng net.accelbyte.sdk.cli.Main dsmc deleteCreatingServerCountQueue \
    --deployment 'BJ5RymfT' \
    --namespace "$AB_NAMESPACE" \
    --version 'OyVWwXDF' \
    > test.out 2>&1
eval_tap $? 30 'DeleteCreatingServerCountQueue' test.out

#- 31 GetAllPodConfig
./ng net.accelbyte.sdk.cli.Main dsmc getAllPodConfig \
    --namespace "$AB_NAMESPACE" \
    --count '80' \
    --offset '5' \
    > test.out 2>&1
eval_tap $? 31 'GetAllPodConfig' test.out

#- 32 GetPodConfig
./ng net.accelbyte.sdk.cli.Main dsmc getPodConfig \
    --name 'k4ETWdcm' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 32 'GetPodConfig' test.out

#- 33 CreatePodConfig
./ng net.accelbyte.sdk.cli.Main dsmc createPodConfig \
    --name 'Hd7m1VDT' \
    --namespace "$AB_NAMESPACE" \
    --body '{"cpu_limit": 97, "mem_limit": 50, "params": "ABfMKGTL"}' \
    > test.out 2>&1
eval_tap $? 33 'CreatePodConfig' test.out

#- 34 DeletePodConfig
./ng net.accelbyte.sdk.cli.Main dsmc deletePodConfig \
    --name 'G8hII1Hc' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 34 'DeletePodConfig' test.out

#- 35 UpdatePodConfig
./ng net.accelbyte.sdk.cli.Main dsmc updatePodConfig \
    --name 'TgwkgXGi' \
    --namespace "$AB_NAMESPACE" \
    --body '{"cpu_limit": 25, "mem_limit": 23, "name": "R00OLvY5", "params": "C0OGl8AW"}' \
    > test.out 2>&1
eval_tap $? 35 'UpdatePodConfig' test.out

#- 36 AddPort
./ng net.accelbyte.sdk.cli.Main dsmc addPort \
    --name 'Bz3P1nS3' \
    --namespace "$AB_NAMESPACE" \
    --body '{"port": 11}' \
    > test.out 2>&1
eval_tap $? 36 'AddPort' test.out

#- 37 DeletePort
./ng net.accelbyte.sdk.cli.Main dsmc deletePort \
    --name 'YKmn8vI4' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 37 'DeletePort' test.out

#- 38 UpdatePort
./ng net.accelbyte.sdk.cli.Main dsmc updatePort \
    --name 'L3Qv1UID' \
    --namespace "$AB_NAMESPACE" \
    --body '{"name": "qbkSdH3w", "port": 34}' \
    > test.out 2>&1
eval_tap $? 38 'UpdatePort' test.out

#- 39 ListImages
./ng net.accelbyte.sdk.cli.Main dsmc listImages \
    --namespace "$AB_NAMESPACE" \
    --q 'iJXEIUWD' \
    --sortBy 'createdAt' \
    --sortDirection 'asc' \
    --count '29' \
    --offset '4' \
    > test.out 2>&1
eval_tap $? 39 'ListImages' test.out

#- 40 DeleteImage
./ng net.accelbyte.sdk.cli.Main dsmc deleteImage \
    --namespace "$AB_NAMESPACE" \
    --imageURI 'jL5w5HdK' \
    --version 'tCl8zV1u' \
    > test.out 2>&1
eval_tap $? 40 'DeleteImage' test.out

#- 41 GetImageLimit
./ng net.accelbyte.sdk.cli.Main dsmc getImageLimit \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 41 'GetImageLimit' test.out

#- 42 DeleteImagePatch
./ng net.accelbyte.sdk.cli.Main dsmc deleteImagePatch \
    --namespace "$AB_NAMESPACE" \
    --imageURI 'Do1UqFa9' \
    --version 'Cj8c5qLG' \
    --versionPatch 'nv3ot3T7' \
    > test.out 2>&1
eval_tap $? 42 'DeleteImagePatch' test.out

#- 43 GetImageDetail
./ng net.accelbyte.sdk.cli.Main dsmc getImageDetail \
    --namespace "$AB_NAMESPACE" \
    --version 'MQVtvSXq' \
    > test.out 2>&1
eval_tap $? 43 'GetImageDetail' test.out

#- 44 GetImagePatches
./ng net.accelbyte.sdk.cli.Main dsmc getImagePatches \
    --namespace "$AB_NAMESPACE" \
    --version 'o2cIxSeC' \
    > test.out 2>&1
eval_tap $? 44 'GetImagePatches' test.out

#- 45 GetImagePatchDetail
./ng net.accelbyte.sdk.cli.Main dsmc getImagePatchDetail \
    --namespace "$AB_NAMESPACE" \
    --version 'zp6GE3Un' \
    --versionPatch 'Nl5RukD7' \
    > test.out 2>&1
eval_tap $? 45 'GetImagePatchDetail' test.out

#- 46 AddBuffer
./ng net.accelbyte.sdk.cli.Main dsmc addBuffer \
    --namespace "$AB_NAMESPACE" \
    --body '{"AllocCount": 36, "DeploymentName": "CA5DGBH9", "JobCount": 82, "JobPriority": 33, "OverrideVersion": "nn8LmGTq", "Region": "vgZ88ASw"}' \
    > test.out 2>&1
eval_tap $? 46 'AddBuffer' test.out

#- 47 GetRepository
./ng net.accelbyte.sdk.cli.Main dsmc getRepository \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 47 'GetRepository' test.out

#- 48 ListServer
./ng net.accelbyte.sdk.cli.Main dsmc listServer \
    --namespace "$AB_NAMESPACE" \
    --region 'w9GYq5Q5' \
    --count '82' \
    --offset '8' \
    > test.out 2>&1
eval_tap $? 48 'ListServer' test.out

#- 49 CountServer
./ng net.accelbyte.sdk.cli.Main dsmc countServer \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 49 'CountServer' test.out

#- 50 CountServerDetailed
./ng net.accelbyte.sdk.cli.Main dsmc countServerDetailed \
    --namespace "$AB_NAMESPACE" \
    --region 'BqcpH1Y1' \
    > test.out 2>&1
eval_tap $? 50 'CountServerDetailed' test.out

#- 51 ListLocalServer
./ng net.accelbyte.sdk.cli.Main dsmc listLocalServer \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 51 'ListLocalServer' test.out

#- 52 DeleteLocalServer
./ng net.accelbyte.sdk.cli.Main dsmc deleteLocalServer \
    --name 'ZxwdcVKy' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 52 'DeleteLocalServer' test.out

#- 53 GetServer
./ng net.accelbyte.sdk.cli.Main dsmc getServer \
    --namespace "$AB_NAMESPACE" \
    --podName 'Gs3g6W9o' \
    > test.out 2>&1
eval_tap $? 53 'GetServer' test.out

#- 54 DeleteServer
./ng net.accelbyte.sdk.cli.Main dsmc deleteServer \
    --namespace "$AB_NAMESPACE" \
    --podName 'mEkOUxfE' \
    > test.out 2>&1
eval_tap $? 54 'DeleteServer' test.out

#- 55 ListSession
./ng net.accelbyte.sdk.cli.Main dsmc listSession \
    --namespace "$AB_NAMESPACE" \
    --region 'J2qAgApt' \
    --withServer  \
    --count '39' \
    --offset '31' \
    > test.out 2>&1
eval_tap $? 55 'ListSession' test.out

#- 56 CountSession
./ng net.accelbyte.sdk.cli.Main dsmc countSession \
    --namespace "$AB_NAMESPACE" \
    --region '0Qf90835' \
    > test.out 2>&1
eval_tap $? 56 'CountSession' test.out

#- 57 DeleteSession
./ng net.accelbyte.sdk.cli.Main dsmc deleteSession \
    --namespace "$AB_NAMESPACE" \
    --sessionID 'HAgPzscL' \
    > test.out 2>&1
eval_tap $? 57 'DeleteSession' test.out

#- 58 RunGhostCleanerRequestHandler
./ng net.accelbyte.sdk.cli.Main dsmc runGhostCleanerRequestHandler \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 58 'RunGhostCleanerRequestHandler' test.out

#- 59 RunZombieCleanerRequestHandler
./ng net.accelbyte.sdk.cli.Main dsmc runZombieCleanerRequestHandler \
    --namespace "$AB_NAMESPACE" \
    --body '{"JobCount": 14, "Region": "V3dwDFMk", "TimeoutSecond": 52, "ZombieCount": 47}' \
    > test.out 2>&1
eval_tap $? 59 'RunZombieCleanerRequestHandler' test.out

#- 60 CreateRepository
./ng net.accelbyte.sdk.cli.Main dsmc createRepository \
    --body '{"namespace": "gUq1Us6d", "repository": "lqqzndgZ"}' \
    > test.out 2>&1
eval_tap $? 60 'CreateRepository' test.out

#- 61 ExportConfigV1
./ng net.accelbyte.sdk.cli.Main dsmc exportConfigV1 \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 61 'ExportConfigV1' test.out

#- 62 ImportConfigV1
./ng net.accelbyte.sdk.cli.Main dsmc importConfigV1 \
    --namespace "$AB_NAMESPACE" \
    --file 'tmp.dat' \
    > test.out 2>&1
eval_tap $? 62 'ImportConfigV1' test.out

#- 63 GetAllDeploymentClient
./ng net.accelbyte.sdk.cli.Main dsmc getAllDeploymentClient \
    --namespace "$AB_NAMESPACE" \
    --name '3GxmziCj' \
    --count '7' \
    --offset '79' \
    > test.out 2>&1
eval_tap $? 63 'GetAllDeploymentClient' test.out

#- 64 GetDeploymentClient
./ng net.accelbyte.sdk.cli.Main dsmc getDeploymentClient \
    --deployment 'wFY29NEA' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 64 'GetDeploymentClient' test.out

#- 65 CreateDeploymentClient
./ng net.accelbyte.sdk.cli.Main dsmc createDeploymentClient \
    --deployment 'ZNxgeJH9' \
    --namespace "$AB_NAMESPACE" \
    --body '{"allow_version_override": false, "buffer_count": 46, "buffer_percent": 61, "configuration": "kwPB9Rc2", "enable_region_overrides": false, "extendable_session": true, "game_version": "w9zVmxVV", "max_count": 14, "min_count": 83, "overrides": {"zQoh26ZL": {"buffer_count": 54, "buffer_percent": 84, "configuration": "VaMwDrYA", "enable_region_overrides": true, "extendable_session": false, "game_version": "t37ZaNZd", "max_count": 55, "min_count": 66, "name": "1X98AdCs", "region_overrides": {"b4TWpyxs": {"buffer_count": 55, "buffer_percent": 72, "max_count": 71, "min_count": 32, "name": "QxrTxqOI", "unlimited": true, "use_buffer_percent": false}, "2h7evx9s": {"buffer_count": 51, "buffer_percent": 29, "max_count": 5, "min_count": 1, "name": "8BaCx8dn", "unlimited": true, "use_buffer_percent": true}, "LOQyHesK": {"buffer_count": 96, "buffer_percent": 97, "max_count": 35, "min_count": 15, "name": "wjFJXj35", "unlimited": true, "use_buffer_percent": true}}, "regions": ["9oJgrdgx", "MRTs9Tdk", "q902HCux"], "session_timeout": 100, "unlimited": false, "use_buffer_percent": false}, "cNSdaUJp": {"buffer_count": 33, "buffer_percent": 87, "configuration": "K0vx6U1E", "enable_region_overrides": false, "extendable_session": false, "game_version": "Tk7qxajm", "max_count": 30, "min_count": 57, "name": "pgRglZQ4", "region_overrides": {"E0lLcAgl": {"buffer_count": 66, "buffer_percent": 64, "max_count": 12, "min_count": 19, "name": "uUdWLfTM", "unlimited": true, "use_buffer_percent": false}, "yDEtORL8": {"buffer_count": 72, "buffer_percent": 65, "max_count": 34, "min_count": 49, "name": "1tOj3G11", "unlimited": false, "use_buffer_percent": true}, "9ORIQV3j": {"buffer_count": 49, "buffer_percent": 11, "max_count": 67, "min_count": 65, "name": "OldmXApF", "unlimited": false, "use_buffer_percent": false}}, "regions": ["OdqvD29c", "hiruUcBT", "ZPQPiy2C"], "session_timeout": 27, "unlimited": true, "use_buffer_percent": false}, "vI7VvmXa": {"buffer_count": 92, "buffer_percent": 7, "configuration": "EBaANN8j", "enable_region_overrides": false, "extendable_session": false, "game_version": "99SWdLmJ", "max_count": 54, "min_count": 94, "name": "OrOQE2Wj", "region_overrides": {"GEbqgtXC": {"buffer_count": 94, "buffer_percent": 47, "max_count": 34, "min_count": 27, "name": "WsrRvGRH", "unlimited": false, "use_buffer_percent": false}, "nCjo1IPc": {"buffer_count": 8, "buffer_percent": 12, "max_count": 37, "min_count": 56, "name": "bOd5mhtk", "unlimited": true, "use_buffer_percent": true}, "aV3umoWb": {"buffer_count": 28, "buffer_percent": 81, "max_count": 47, "min_count": 82, "name": "URVpI6MG", "unlimited": true, "use_buffer_percent": false}}, "regions": ["ulvAhiCX", "IGPwdPWQ", "eeXBurKh"], "session_timeout": 43, "unlimited": true, "use_buffer_percent": true}}, "region_overrides": {"s1OCIl6z": {"buffer_count": 49, "buffer_percent": 29, "max_count": 61, "min_count": 34, "name": "sc42ac3i", "unlimited": true, "use_buffer_percent": true}, "Gcux2Jzx": {"buffer_count": 63, "buffer_percent": 18, "max_count": 50, "min_count": 76, "name": "P2tfdNqJ", "unlimited": true, "use_buffer_percent": true}, "24jqeRrj": {"buffer_count": 52, "buffer_percent": 24, "max_count": 8, "min_count": 89, "name": "liwWHAhN", "unlimited": true, "use_buffer_percent": true}}, "regions": ["HaSUuF4d", "YIfYF4L7", "HtzReQMN"], "session_timeout": 18, "unlimited": false, "use_buffer_percent": true}' \
    > test.out 2>&1
eval_tap $? 65 'CreateDeploymentClient' test.out

#- 66 DeleteDeploymentClient
./ng net.accelbyte.sdk.cli.Main dsmc deleteDeploymentClient \
    --deployment 'lCQDGUSq' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 66 'DeleteDeploymentClient' test.out

#- 67 GetAllPodConfigClient
./ng net.accelbyte.sdk.cli.Main dsmc getAllPodConfigClient \
    --namespace "$AB_NAMESPACE" \
    --count '65' \
    --offset '72' \
    > test.out 2>&1
eval_tap $? 67 'GetAllPodConfigClient' test.out

#- 68 CreatePodConfigClient
./ng net.accelbyte.sdk.cli.Main dsmc createPodConfigClient \
    --name '2lQ3jg9O' \
    --namespace "$AB_NAMESPACE" \
    --body '{"cpu_limit": 76, "mem_limit": 77, "params": "1vfm0oy6"}' \
    > test.out 2>&1
eval_tap $? 68 'CreatePodConfigClient' test.out

#- 69 DeletePodConfigClient
./ng net.accelbyte.sdk.cli.Main dsmc deletePodConfigClient \
    --name 'H34jERkY' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 69 'DeletePodConfigClient' test.out

#- 70 ListImagesClient
./ng net.accelbyte.sdk.cli.Main dsmc listImagesClient \
    --namespace "$AB_NAMESPACE" \
    --count '0' \
    --offset '99' \
    --q '2vE4aqot' \
    --sortBy 'version' \
    --sortDirection 'asc' \
    > test.out 2>&1
eval_tap $? 70 'ListImagesClient' test.out

#- 71 ImageLimitClient
./ng net.accelbyte.sdk.cli.Main dsmc imageLimitClient \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 71 'ImageLimitClient' test.out

#- 72 ImageDetailClient
./ng net.accelbyte.sdk.cli.Main dsmc imageDetailClient \
    --namespace "$AB_NAMESPACE" \
    --version 'x4jHSGBL' \
    > test.out 2>&1
eval_tap $? 72 'ImageDetailClient' test.out

#- 73 ListServerClient
./ng net.accelbyte.sdk.cli.Main dsmc listServerClient \
    --namespace "$AB_NAMESPACE" \
    --region 'QDBrhMia' \
    --count '63' \
    --offset '94' \
    > test.out 2>&1
eval_tap $? 73 'ListServerClient' test.out

#- 74 CountServerDetailedClient
./ng net.accelbyte.sdk.cli.Main dsmc countServerDetailedClient \
    --namespace "$AB_NAMESPACE" \
    --region 'UoIyM3cQ' \
    > test.out 2>&1
eval_tap $? 74 'CountServerDetailedClient' test.out

#- 75 ServerHeartbeat
./ng net.accelbyte.sdk.cli.Main dsmc serverHeartbeat \
    --namespace "$AB_NAMESPACE" \
    --body '{"podName": "lNcj3PlA"}' \
    > test.out 2>&1
eval_tap $? 75 'ServerHeartbeat' test.out

#- 76 DeregisterLocalServer
./ng net.accelbyte.sdk.cli.Main dsmc deregisterLocalServer \
    --namespace "$AB_NAMESPACE" \
    --body '{"name": "GAh9AmI0"}' \
    > test.out 2>&1
eval_tap $? 76 'DeregisterLocalServer' test.out

#- 77 RegisterLocalServer
./ng net.accelbyte.sdk.cli.Main dsmc registerLocalServer \
    --namespace "$AB_NAMESPACE" \
    --body '{"custom_attribute": "IGQuU1vP", "ip": "sDPUbMet", "name": "cBFocXne", "port": 67}' \
    > test.out 2>&1
eval_tap $? 77 'RegisterLocalServer' test.out

#- 78 RegisterServer
./ng net.accelbyte.sdk.cli.Main dsmc registerServer \
    --namespace "$AB_NAMESPACE" \
    --body '{"custom_attribute": "f3tn7Z43", "pod_name": "EXa5uqoF"}' \
    > test.out 2>&1
eval_tap $? 78 'RegisterServer' test.out

#- 79 ShutdownServer
./ng net.accelbyte.sdk.cli.Main dsmc shutdownServer \
    --namespace "$AB_NAMESPACE" \
    --body '{"kill_me": false, "pod_name": "qSi2HP2B"}' \
    > test.out 2>&1
eval_tap $? 79 'ShutdownServer' test.out

#- 80 GetServerSessionTimeout
./ng net.accelbyte.sdk.cli.Main dsmc getServerSessionTimeout \
    --namespace "$AB_NAMESPACE" \
    --podName 'Ou8ZgovI' \
    > test.out 2>&1
eval_tap $? 80 'GetServerSessionTimeout' test.out

#- 81 GetServerSession
./ng net.accelbyte.sdk.cli.Main dsmc getServerSession \
    --namespace "$AB_NAMESPACE" \
    --podName '4WUbBSZy' \
    > test.out 2>&1
eval_tap $? 81 'GetServerSession' test.out

#- 82 CreateSession
./ng net.accelbyte.sdk.cli.Main dsmc createSession \
    --namespace "$AB_NAMESPACE" \
    --body '{"client_version": "HZ1xWQ3n", "configuration": "R7RMRTXr", "deployment": "MrqTQ56G", "game_mode": "JcAosS9z", "matching_allies": [{"matching_parties": [{"party_attributes": {"thiHIOpo": {}, "gYIHVYAL": {}, "AlEUPzzw": {}}, "party_id": "3iOGC8Ru", "party_members": [{"user_id": "X4d6yRth"}, {"user_id": "n5KCoV0d"}, {"user_id": "WMT8Qr04"}]}, {"party_attributes": {"g42ogAO3": {}, "BRYXCJ3p": {}, "W6QEfp1H": {}}, "party_id": "nuSp3gTa", "party_members": [{"user_id": "XMBWcEcw"}, {"user_id": "F3JOBJ6X"}, {"user_id": "Avq7TIx9"}]}, {"party_attributes": {"Ed9KbFCU": {}, "Oz3KRu6b": {}, "2vkW0yWX": {}}, "party_id": "JRJ9Qdk1", "party_members": [{"user_id": "9INkLILv"}, {"user_id": "YolxQufz"}, {"user_id": "G8liIGjW"}]}]}, {"matching_parties": [{"party_attributes": {"jGEgHSuG": {}, "jgUyj9UD": {}, "J71mFDmD": {}}, "party_id": "QFWYCvnx", "party_members": [{"user_id": "BVi8cHUG"}, {"user_id": "M53I5HoB"}, {"user_id": "ywHPS9JQ"}]}, {"party_attributes": {"y1H8jpZ8": {}, "JAXNEfxP": {}, "0Ax8NHka": {}}, "party_id": "QFTHel1S", "party_members": [{"user_id": "yxha4YXb"}, {"user_id": "o6GWmPSZ"}, {"user_id": "sCz9M4pJ"}]}, {"party_attributes": {"FkGh1hl5": {}, "EZdKWIuQ": {}, "PXsGcGRD": {}}, "party_id": "0Gn7mhvy", "party_members": [{"user_id": "hCb6GBmu"}, {"user_id": "18FNuFeU"}, {"user_id": "AWUDuWEr"}]}]}, {"matching_parties": [{"party_attributes": {"B4v2p6Aa": {}, "225E89BR": {}, "P1FhLi24": {}}, "party_id": "suRM2hsH", "party_members": [{"user_id": "XwE7NlZu"}, {"user_id": "UZ0tVWqS"}, {"user_id": "YLuEf97U"}]}, {"party_attributes": {"GLuIqHAt": {}, "MD0ym1Ze": {}, "ixABHRex": {}}, "party_id": "GVqfzkzQ", "party_members": [{"user_id": "GmEiw60n"}, {"user_id": "5YcGc3fI"}, {"user_id": "VSNC4pYA"}]}, {"party_attributes": {"1jjS9Osm": {}, "4HwHlk2Q": {}, "sb3yKwQJ": {}}, "party_id": "pi0pIogC", "party_members": [{"user_id": "CleXbcYW"}, {"user_id": "LL1qucBS"}, {"user_id": "WOdttB9F"}]}]}], "namespace": "X1cB98tA", "notification_payload": {}, "pod_name": "4RW4aYMo", "region": "NUI4BwcH", "session_id": "qKl6Mvwz"}' \
    > test.out 2>&1
eval_tap $? 82 'CreateSession' test.out

#- 83 ClaimServer
./ng net.accelbyte.sdk.cli.Main dsmc claimServer \
    --namespace "$AB_NAMESPACE" \
    --body '{"game_mode": "3RqqkuQB", "matching_allies": [{"matching_parties": [{"party_attributes": {"XYhGGnoG": {}, "Oo4TW5v9": {}, "9E2pstpV": {}}, "party_id": "kBDTT1Bv", "party_members": [{"user_id": "5e828kqA"}, {"user_id": "AQDLZrMv"}, {"user_id": "Vo0pZAcG"}]}, {"party_attributes": {"I0s8za58": {}, "M4s8pUSb": {}, "TFrfEUZz": {}}, "party_id": "dB6WGsGR", "party_members": [{"user_id": "un7bKkiB"}, {"user_id": "PZFTrXDD"}, {"user_id": "vId6vamx"}]}, {"party_attributes": {"ze7IsXgD": {}, "xQlV7XL2": {}, "MqW4h4qq": {}}, "party_id": "3jhEt05G", "party_members": [{"user_id": "mzFN4twC"}, {"user_id": "Db8iwSWt"}, {"user_id": "npmIdi0I"}]}]}, {"matching_parties": [{"party_attributes": {"7jVw3Btf": {}, "kwRwjiKs": {}, "AyARkkJw": {}}, "party_id": "Efkl5mpY", "party_members": [{"user_id": "EhReSjWx"}, {"user_id": "s0haXdfM"}, {"user_id": "b0Y6lMuQ"}]}, {"party_attributes": {"JcS47Ze3": {}, "4ct4LyJT": {}, "NenZV32k": {}}, "party_id": "y04DOGk6", "party_members": [{"user_id": "wPaKC0rF"}, {"user_id": "Wnxlb6Fh"}, {"user_id": "Lz5hM20L"}]}, {"party_attributes": {"gO1N9ynx": {}, "tCvZkihq": {}, "K9Eog2Yf": {}}, "party_id": "v9hbPcHW", "party_members": [{"user_id": "2ECgFb1q"}, {"user_id": "Av6Bv273"}, {"user_id": "KybsTog4"}]}]}, {"matching_parties": [{"party_attributes": {"ngmJ5fLd": {}, "il3Yfe3g": {}, "Cyskvn4N": {}}, "party_id": "5F53klyL", "party_members": [{"user_id": "tWJcO0TL"}, {"user_id": "LkjJutsb"}, {"user_id": "5lsnUMeJ"}]}, {"party_attributes": {"GLEVWcQb": {}, "KLGwRHWI": {}, "9qJIgmRQ": {}}, "party_id": "yBN0jSGI", "party_members": [{"user_id": "mf7lL7gV"}, {"user_id": "ELRMBp01"}, {"user_id": "SbaQlREH"}]}, {"party_attributes": {"ZoSRD3qd": {}, "b9ynUG7h": {}, "woZGRN5w": {}}, "party_id": "FfX7gn6B", "party_members": [{"user_id": "hbcOJ1qZ"}, {"user_id": "LZX6dQf7"}, {"user_id": "h6Gm3fd8"}]}]}], "namespace": "lsxsUZ3d", "notification_payload": {}, "session_id": "QBgDFIbF"}' \
    > test.out 2>&1
eval_tap $? 83 'ClaimServer' test.out

#- 84 GetSession
./ng net.accelbyte.sdk.cli.Main dsmc getSession \
    --namespace "$AB_NAMESPACE" \
    --sessionID 'Mlr4f5KB' \
    > test.out 2>&1
eval_tap $? 84 'GetSession' test.out

#- 85 CancelSession
./ng net.accelbyte.sdk.cli.Main dsmc cancelSession \
    --namespace "$AB_NAMESPACE" \
    --sessionID 'QciQcnjL' \
    > test.out 2>&1
eval_tap $? 85 'CancelSession' test.out

#- 86 GetDefaultProvider
./ng net.accelbyte.sdk.cli.Main dsmc getDefaultProvider \
    > test.out 2>&1
eval_tap $? 86 'GetDefaultProvider' test.out

#- 87 ListProviders
./ng net.accelbyte.sdk.cli.Main dsmc listProviders \
    > test.out 2>&1
eval_tap $? 87 'ListProviders' test.out

#- 88 ListProvidersByRegion
./ng net.accelbyte.sdk.cli.Main dsmc listProvidersByRegion \
    --region 'gvj3IrjX' \
    > test.out 2>&1
eval_tap $? 88 'ListProvidersByRegion' test.out

#- 89 PublicGetMessages
./ng net.accelbyte.sdk.cli.Main dsmc publicGetMessages \
    > test.out 2>&1
eval_tap $? 89 'PublicGetMessages' test.out


rm -f "tmp.dat"

exit $EXIT_CODE