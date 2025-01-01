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
    --body '{"artifactPath": "PSpbuT9E", "coreDumpEnabled": true, "image": "ZoBQeAz5", "imageReplicationsMap": {"S3T8z2I3": {"failure_code": "UOQTjk0b", "region": "ZYRyrEHM", "status": "FUY7UAB7", "uri": "SUxlLbVA"}, "l6JpNjeT": {"failure_code": "xIaU6l68", "region": "nWbxVK8E", "status": "7lh7HmMZ", "uri": "F7rFWJP1"}, "P1C6lhhR": {"failure_code": "KsifmShO", "region": "bmfAfoer", "status": "B1DwDbhX", "uri": "94nx7s5t"}}, "namespace": "m3JMynPV", "patchVersion": "gpnLHoqs", "persistent": false, "ulimitFileSize": 73, "version": "9jDmgOrs"}' \
    > test.out 2>&1
eval_tap $? 4 'UpdateImage' test.out

#- 5 CreateImage
./ng net.accelbyte.sdk.cli.Main dsmc createImage \
    --body '{"artifactPath": "b6pVdAQa", "coreDumpEnabled": true, "dockerPath": "6Ogfvdzj", "image": "PVTrcSPC", "imageSize": 19, "namespace": "8wiMfkGq", "persistent": false, "ulimitFileSize": 36, "version": "gh1m8j2y"}' \
    > test.out 2>&1
eval_tap $? 5 'CreateImage' test.out

#- 6 CreateImagePatch
./ng net.accelbyte.sdk.cli.Main dsmc createImagePatch \
    --body '{"artifactPath": "Orlpuchg", "coreDumpEnabled": true, "dockerPath": "XOLPtKU2", "image": "Q8SjZ2pc", "imageSize": 8, "namespace": "za3aakL9", "patchVersion": "QHcKO2cr", "persistent": true, "ulimitFileSize": 63, "uploaderFlag": "jcwgutZM", "version": "v3X1xolz"}' \
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
    --body '{"auto_deletion": false, "ghost_worker": true, "manual_buffer_override": false, "zombie_worker": false}' \
    > test.out 2>&1
eval_tap $? 9 'UpdateWorkerConfig' test.out

#- 10 CreateWorkerConfig
./ng net.accelbyte.sdk.cli.Main dsmc createWorkerConfig \
    --namespace "$AB_NAMESPACE" \
    --body '{"auto_deletion": true, "ghost_worker": true, "manual_buffer_override": false, "zombie_worker": true}' \
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
    --body '{"claim_timeout": 91, "creation_timeout": 56, "default_version": "YS4tYlfk", "port": 66, "ports": {"RrMzyWya": 22, "dsT5wD3V": 13, "A18V93ar": 11}, "protocol": "1qR44Vb1", "providers": ["NxUNLbGg", "dqyDzNUY", "cI0M2zog"], "session_timeout": 87, "unreachable_timeout": 59}' \
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
    --body '{"claim_timeout": 52, "creation_timeout": 87, "default_version": "qE1W2rKR", "port": 46, "protocol": "6dcf1SoM", "providers": ["qYP9GfDw", "rkvJvzO8", "18cER20v"], "session_timeout": 82, "unreachable_timeout": 36}' \
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
    --name 'vZM1TyH6' \
    --count '91' \
    --offset '8' \
    > test.out 2>&1
eval_tap $? 16 'GetAllDeployment' test.out

#- 17 GetDeployment
./ng net.accelbyte.sdk.cli.Main dsmc getDeployment \
    --deployment 'sIOjStQO' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 17 'GetDeployment' test.out

#- 18 CreateDeployment
./ng net.accelbyte.sdk.cli.Main dsmc createDeployment \
    --deployment 'YNqX2C4F' \
    --namespace "$AB_NAMESPACE" \
    --body '{"allow_version_override": true, "buffer_count": 19, "buffer_percent": 84, "configuration": "TonqCpQk", "enable_region_overrides": false, "extendable_session": false, "game_version": "Fnqmn6lq", "max_count": 58, "min_count": 91, "overrides": {"GV82HvQN": {"buffer_count": 69, "buffer_percent": 55, "configuration": "MoT4rLbO", "enable_region_overrides": true, "extendable_session": true, "game_version": "UBawHqkT", "max_count": 11, "min_count": 50, "name": "t9N9oMvF", "region_overrides": {"I7GPfo0O": {"buffer_count": 4, "buffer_percent": 9, "max_count": 87, "min_count": 16, "name": "znhzvqFU", "unlimited": false, "use_buffer_percent": false}, "GXCLsXeN": {"buffer_count": 23, "buffer_percent": 48, "max_count": 97, "min_count": 81, "name": "auFt6xE0", "unlimited": false, "use_buffer_percent": true}, "RwI9Walr": {"buffer_count": 0, "buffer_percent": 4, "max_count": 31, "min_count": 96, "name": "FxgGMXEQ", "unlimited": false, "use_buffer_percent": true}}, "regions": ["whf6c8TY", "HCfGGUxF", "c5GNCHmw"], "session_timeout": 21, "unlimited": true, "use_buffer_percent": true}, "2UaIEqjI": {"buffer_count": 7, "buffer_percent": 54, "configuration": "s0yem8IR", "enable_region_overrides": true, "extendable_session": false, "game_version": "UeeTmd8J", "max_count": 58, "min_count": 43, "name": "5KbYa326", "region_overrides": {"7ffGtfmv": {"buffer_count": 23, "buffer_percent": 11, "max_count": 19, "min_count": 51, "name": "RKWssQSQ", "unlimited": true, "use_buffer_percent": false}, "1XDD3AFv": {"buffer_count": 59, "buffer_percent": 50, "max_count": 72, "min_count": 65, "name": "cL7gsuRE", "unlimited": true, "use_buffer_percent": false}, "ZnmJlzgk": {"buffer_count": 55, "buffer_percent": 47, "max_count": 28, "min_count": 40, "name": "GxzOYe0c", "unlimited": true, "use_buffer_percent": true}}, "regions": ["QZ8PBMKo", "MVMm2z7X", "fcSkAR9p"], "session_timeout": 28, "unlimited": true, "use_buffer_percent": true}, "fk2Qfo9n": {"buffer_count": 64, "buffer_percent": 58, "configuration": "mIJijEAK", "enable_region_overrides": false, "extendable_session": false, "game_version": "17eLL0DN", "max_count": 62, "min_count": 38, "name": "MJCiCsWp", "region_overrides": {"uFL2O496": {"buffer_count": 75, "buffer_percent": 24, "max_count": 64, "min_count": 59, "name": "aDAeivRY", "unlimited": true, "use_buffer_percent": true}, "8NYNxVLm": {"buffer_count": 7, "buffer_percent": 92, "max_count": 82, "min_count": 66, "name": "j5DDwtAa", "unlimited": false, "use_buffer_percent": true}, "CzBsjfpr": {"buffer_count": 25, "buffer_percent": 66, "max_count": 16, "min_count": 14, "name": "KUJtl14V", "unlimited": false, "use_buffer_percent": false}}, "regions": ["GULcNWU3", "jFl0atNI", "Uy00q2QP"], "session_timeout": 65, "unlimited": true, "use_buffer_percent": true}}, "region_overrides": {"Ur4Xv3Ri": {"buffer_count": 71, "buffer_percent": 54, "max_count": 46, "min_count": 62, "name": "EeFz4ssZ", "unlimited": true, "use_buffer_percent": true}, "oel81st1": {"buffer_count": 21, "buffer_percent": 0, "max_count": 51, "min_count": 52, "name": "CUhtQlP8", "unlimited": false, "use_buffer_percent": false}, "RClAz7ov": {"buffer_count": 2, "buffer_percent": 72, "max_count": 0, "min_count": 52, "name": "Ux97PK7q", "unlimited": true, "use_buffer_percent": true}}, "regions": ["GxGFcsc1", "cbl5D140", "tIynhTzp"], "session_timeout": 12, "unlimited": false, "use_buffer_percent": false}' \
    > test.out 2>&1
eval_tap $? 18 'CreateDeployment' test.out

#- 19 DeleteDeployment
./ng net.accelbyte.sdk.cli.Main dsmc deleteDeployment \
    --deployment '7MDewgXb' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 19 'DeleteDeployment' test.out

#- 20 UpdateDeployment
./ng net.accelbyte.sdk.cli.Main dsmc updateDeployment \
    --deployment 'DsW2wVKC' \
    --namespace "$AB_NAMESPACE" \
    --body '{"allow_version_override": true, "buffer_count": 0, "buffer_percent": 29, "configuration": "v7elztdT", "enable_region_overrides": true, "extendable_session": false, "game_version": "9NvZn2Vx", "max_count": 88, "min_count": 32, "regions": ["ajTY1kHU", "5YbbJu8N", "5JcaFWUC"], "session_timeout": 41, "unlimited": true, "use_buffer_percent": true}' \
    > test.out 2>&1
eval_tap $? 20 'UpdateDeployment' test.out

#- 21 CreateRootRegionOverride
./ng net.accelbyte.sdk.cli.Main dsmc createRootRegionOverride \
    --deployment 'WqZNtlnK' \
    --namespace "$AB_NAMESPACE" \
    --region 'ouBVV2vS' \
    --body '{"buffer_count": 88, "buffer_percent": 41, "max_count": 98, "min_count": 100, "unlimited": true, "use_buffer_percent": true}' \
    > test.out 2>&1
eval_tap $? 21 'CreateRootRegionOverride' test.out

#- 22 DeleteRootRegionOverride
./ng net.accelbyte.sdk.cli.Main dsmc deleteRootRegionOverride \
    --deployment 'nV77HCf1' \
    --namespace "$AB_NAMESPACE" \
    --region '9Ov0S3G4' \
    > test.out 2>&1
eval_tap $? 22 'DeleteRootRegionOverride' test.out

#- 23 UpdateRootRegionOverride
./ng net.accelbyte.sdk.cli.Main dsmc updateRootRegionOverride \
    --deployment 'yMv6lMiE' \
    --namespace "$AB_NAMESPACE" \
    --region 'ULOApo37' \
    --body '{"buffer_count": 54, "buffer_percent": 15, "max_count": 85, "min_count": 63, "unlimited": true, "use_buffer_percent": true}' \
    > test.out 2>&1
eval_tap $? 23 'UpdateRootRegionOverride' test.out

#- 24 CreateDeploymentOverride
./ng net.accelbyte.sdk.cli.Main dsmc createDeploymentOverride \
    --deployment 'LPxe2pj2' \
    --namespace "$AB_NAMESPACE" \
    --version 'hNTfvMgL' \
    --body '{"buffer_count": 1, "buffer_percent": 68, "configuration": "2ShWxWGJ", "enable_region_overrides": false, "extendable_session": false, "game_version": "gCIej1Bc", "max_count": 44, "min_count": 34, "region_overrides": {"bTFXk5WS": {"buffer_count": 22, "buffer_percent": 36, "max_count": 78, "min_count": 54, "name": "oKor8W4L", "unlimited": false, "use_buffer_percent": false}, "8vxRCepf": {"buffer_count": 50, "buffer_percent": 66, "max_count": 66, "min_count": 42, "name": "jPWYKQir", "unlimited": true, "use_buffer_percent": true}, "mWbyfVm7": {"buffer_count": 49, "buffer_percent": 28, "max_count": 54, "min_count": 34, "name": "UKLdHjxD", "unlimited": true, "use_buffer_percent": false}}, "regions": ["0K2t6wpa", "jFOnLlpG", "8Dze0Fd0"], "session_timeout": 8, "unlimited": true, "use_buffer_percent": false}' \
    > test.out 2>&1
eval_tap $? 24 'CreateDeploymentOverride' test.out

#- 25 DeleteDeploymentOverride
./ng net.accelbyte.sdk.cli.Main dsmc deleteDeploymentOverride \
    --deployment 'p8wNg1LA' \
    --namespace "$AB_NAMESPACE" \
    --version 'SSECzTJL' \
    > test.out 2>&1
eval_tap $? 25 'DeleteDeploymentOverride' test.out

#- 26 UpdateDeploymentOverride
./ng net.accelbyte.sdk.cli.Main dsmc updateDeploymentOverride \
    --deployment 'n9LZadck' \
    --namespace "$AB_NAMESPACE" \
    --version 'okSYuiNZ' \
    --body '{"buffer_count": 40, "buffer_percent": 57, "configuration": "IMPopEZt", "enable_region_overrides": false, "game_version": "RwppeVp9", "max_count": 89, "min_count": 78, "regions": ["MVzREhOB", "p2iiCnay", "49rgdCWv"], "session_timeout": 93, "unlimited": true, "use_buffer_percent": true}' \
    > test.out 2>&1
eval_tap $? 26 'UpdateDeploymentOverride' test.out

#- 27 CreateOverrideRegionOverride
./ng net.accelbyte.sdk.cli.Main dsmc createOverrideRegionOverride \
    --deployment '9lf688hr' \
    --namespace "$AB_NAMESPACE" \
    --region '7zZWMlbW' \
    --version 'OvaSsWfO' \
    --body '{"buffer_count": 9, "buffer_percent": 47, "max_count": 82, "min_count": 41, "unlimited": true, "use_buffer_percent": false}' \
    > test.out 2>&1
eval_tap $? 27 'CreateOverrideRegionOverride' test.out

#- 28 DeleteOverrideRegionOverride
./ng net.accelbyte.sdk.cli.Main dsmc deleteOverrideRegionOverride \
    --deployment 'C3MtqUkc' \
    --namespace "$AB_NAMESPACE" \
    --region 'Dbo8EBu5' \
    --version 'uAZ48tAI' \
    > test.out 2>&1
eval_tap $? 28 'DeleteOverrideRegionOverride' test.out

#- 29 UpdateOverrideRegionOverride
./ng net.accelbyte.sdk.cli.Main dsmc updateOverrideRegionOverride \
    --deployment 'nMg6ABUL' \
    --namespace "$AB_NAMESPACE" \
    --region '1Hlo4ADC' \
    --version '37q4ObL0' \
    --body '{"buffer_count": 61, "buffer_percent": 52, "max_count": 87, "min_count": 77, "unlimited": false, "use_buffer_percent": true}' \
    > test.out 2>&1
eval_tap $? 29 'UpdateOverrideRegionOverride' test.out

#- 30 DeleteCreatingServerCountQueue
./ng net.accelbyte.sdk.cli.Main dsmc deleteCreatingServerCountQueue \
    --deployment 'oJT19Vkf' \
    --namespace "$AB_NAMESPACE" \
    --version 'yrsitZNn' \
    > test.out 2>&1
eval_tap $? 30 'DeleteCreatingServerCountQueue' test.out

#- 31 GetAllPodConfig
./ng net.accelbyte.sdk.cli.Main dsmc getAllPodConfig \
    --namespace "$AB_NAMESPACE" \
    --count '7' \
    --offset '92' \
    > test.out 2>&1
eval_tap $? 31 'GetAllPodConfig' test.out

#- 32 GetPodConfig
./ng net.accelbyte.sdk.cli.Main dsmc getPodConfig \
    --name 'oFCfxqTq' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 32 'GetPodConfig' test.out

#- 33 CreatePodConfig
./ng net.accelbyte.sdk.cli.Main dsmc createPodConfig \
    --name 'QWnT7hlk' \
    --namespace "$AB_NAMESPACE" \
    --body '{"cpu_limit": 45, "mem_limit": 87, "params": "POZ7lYoy"}' \
    > test.out 2>&1
eval_tap $? 33 'CreatePodConfig' test.out

#- 34 DeletePodConfig
./ng net.accelbyte.sdk.cli.Main dsmc deletePodConfig \
    --name 'dNNosCSN' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 34 'DeletePodConfig' test.out

#- 35 UpdatePodConfig
./ng net.accelbyte.sdk.cli.Main dsmc updatePodConfig \
    --name 'FVp0BRFH' \
    --namespace "$AB_NAMESPACE" \
    --body '{"cpu_limit": 28, "mem_limit": 9, "name": "YrH4y3iN", "params": "3wFwJaZ2"}' \
    > test.out 2>&1
eval_tap $? 35 'UpdatePodConfig' test.out

#- 36 AddPort
./ng net.accelbyte.sdk.cli.Main dsmc addPort \
    --name '2fTG3bGO' \
    --namespace "$AB_NAMESPACE" \
    --body '{"port": 17}' \
    > test.out 2>&1
eval_tap $? 36 'AddPort' test.out

#- 37 DeletePort
./ng net.accelbyte.sdk.cli.Main dsmc deletePort \
    --name '2MGD14h9' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 37 'DeletePort' test.out

#- 38 UpdatePort
./ng net.accelbyte.sdk.cli.Main dsmc updatePort \
    --name 'FEZ36WBj' \
    --namespace "$AB_NAMESPACE" \
    --body '{"name": "Y0T0qOt4", "port": 17}' \
    > test.out 2>&1
eval_tap $? 38 'UpdatePort' test.out

#- 39 ListImages
./ng net.accelbyte.sdk.cli.Main dsmc listImages \
    --namespace "$AB_NAMESPACE" \
    --q 'bquBW3ON' \
    --sortBy 'version' \
    --sortDirection 'asc' \
    --count '76' \
    --offset '34' \
    > test.out 2>&1
eval_tap $? 39 'ListImages' test.out

#- 40 DeleteImage
./ng net.accelbyte.sdk.cli.Main dsmc deleteImage \
    --namespace "$AB_NAMESPACE" \
    --imageURI 'Eqw4YfMp' \
    --version '3LkNdh1N' \
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
    --imageURI 'ZwsPvfn0' \
    --version 'D6nDgM14' \
    --versionPatch '6YjZcRpI' \
    > test.out 2>&1
eval_tap $? 42 'DeleteImagePatch' test.out

#- 43 GetImageDetail
./ng net.accelbyte.sdk.cli.Main dsmc getImageDetail \
    --namespace "$AB_NAMESPACE" \
    --version 'LUikFmSf' \
    > test.out 2>&1
eval_tap $? 43 'GetImageDetail' test.out

#- 44 GetImagePatches
./ng net.accelbyte.sdk.cli.Main dsmc getImagePatches \
    --namespace "$AB_NAMESPACE" \
    --version 'kwvfCAXw' \
    > test.out 2>&1
eval_tap $? 44 'GetImagePatches' test.out

#- 45 GetImagePatchDetail
./ng net.accelbyte.sdk.cli.Main dsmc getImagePatchDetail \
    --namespace "$AB_NAMESPACE" \
    --version 'HGRruLmR' \
    --versionPatch 'KM33ZCe7' \
    > test.out 2>&1
eval_tap $? 45 'GetImagePatchDetail' test.out

#- 46 AddBuffer
./ng net.accelbyte.sdk.cli.Main dsmc addBuffer \
    --namespace "$AB_NAMESPACE" \
    --body '{"AllocCount": 55, "DeploymentName": "hVzoio3P", "JobCount": 10, "JobPriority": 90, "OverrideVersion": "aanLVtVF", "Region": "As9cU53q"}' \
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
    --region 'Q5LflbpJ' \
    --count '1' \
    --offset '22' \
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
    --region 'xWAiej6J' \
    > test.out 2>&1
eval_tap $? 50 'CountServerDetailed' test.out

#- 51 ListLocalServer
./ng net.accelbyte.sdk.cli.Main dsmc listLocalServer \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 51 'ListLocalServer' test.out

#- 52 DeleteLocalServer
./ng net.accelbyte.sdk.cli.Main dsmc deleteLocalServer \
    --name 'dyZYcYoj' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 52 'DeleteLocalServer' test.out

#- 53 GetServer
./ng net.accelbyte.sdk.cli.Main dsmc getServer \
    --namespace "$AB_NAMESPACE" \
    --podName 'HvsXAL8x' \
    > test.out 2>&1
eval_tap $? 53 'GetServer' test.out

#- 54 DeleteServer
./ng net.accelbyte.sdk.cli.Main dsmc deleteServer \
    --namespace "$AB_NAMESPACE" \
    --podName 'POPIKD6y' \
    > test.out 2>&1
eval_tap $? 54 'DeleteServer' test.out

#- 55 ListSession
./ng net.accelbyte.sdk.cli.Main dsmc listSession \
    --namespace "$AB_NAMESPACE" \
    --region '7md5Ykjg' \
    --withServer  \
    --count '64' \
    --offset '99' \
    > test.out 2>&1
eval_tap $? 55 'ListSession' test.out

#- 56 CountSession
./ng net.accelbyte.sdk.cli.Main dsmc countSession \
    --namespace "$AB_NAMESPACE" \
    --region 'wKHPYsdS' \
    > test.out 2>&1
eval_tap $? 56 'CountSession' test.out

#- 57 DeleteSession
./ng net.accelbyte.sdk.cli.Main dsmc deleteSession \
    --namespace "$AB_NAMESPACE" \
    --sessionID 'pDLanMvh' \
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
    --body '{"JobCount": 79, "Region": "TccNErjP", "TimeoutSecond": 62, "ZombieCount": 75}' \
    > test.out 2>&1
eval_tap $? 59 'RunZombieCleanerRequestHandler' test.out

#- 60 CreateRepository
./ng net.accelbyte.sdk.cli.Main dsmc createRepository \
    --body '{"namespace": "57rLtyxn", "repository": "jBBydfr0"}' \
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
    --name 'hP6cJhFn' \
    --count '98' \
    --offset '62' \
    > test.out 2>&1
eval_tap $? 63 'GetAllDeploymentClient' test.out

#- 64 GetDeploymentClient
./ng net.accelbyte.sdk.cli.Main dsmc getDeploymentClient \
    --deployment 'voCq952O' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 64 'GetDeploymentClient' test.out

#- 65 CreateDeploymentClient
./ng net.accelbyte.sdk.cli.Main dsmc createDeploymentClient \
    --deployment '4pWYZUpu' \
    --namespace "$AB_NAMESPACE" \
    --body '{"allow_version_override": false, "buffer_count": 74, "buffer_percent": 94, "configuration": "TFEjryHc", "enable_region_overrides": false, "extendable_session": true, "game_version": "AFVKiNC4", "max_count": 89, "min_count": 10, "overrides": {"00U7DkRY": {"buffer_count": 60, "buffer_percent": 55, "configuration": "60itvCFi", "enable_region_overrides": true, "extendable_session": true, "game_version": "hwGQBMfA", "max_count": 78, "min_count": 69, "name": "QScTzD0a", "region_overrides": {"ok2StvKa": {"buffer_count": 37, "buffer_percent": 25, "max_count": 27, "min_count": 78, "name": "4ZI0lLrE", "unlimited": false, "use_buffer_percent": true}, "gjgOhL4o": {"buffer_count": 68, "buffer_percent": 59, "max_count": 0, "min_count": 75, "name": "zGsjrSS1", "unlimited": false, "use_buffer_percent": false}, "HF5BhAe5": {"buffer_count": 12, "buffer_percent": 2, "max_count": 79, "min_count": 100, "name": "GevugCkk", "unlimited": false, "use_buffer_percent": true}}, "regions": ["7d2MRHEy", "8J490w8G", "TISKIMzk"], "session_timeout": 84, "unlimited": true, "use_buffer_percent": true}, "3u98zQvF": {"buffer_count": 88, "buffer_percent": 74, "configuration": "jMTxK8P9", "enable_region_overrides": false, "extendable_session": false, "game_version": "qyc7Uj6n", "max_count": 61, "min_count": 47, "name": "nGZDcjQt", "region_overrides": {"hyFRDV8o": {"buffer_count": 63, "buffer_percent": 53, "max_count": 8, "min_count": 6, "name": "hlNids1E", "unlimited": true, "use_buffer_percent": false}, "vjZpNOPG": {"buffer_count": 50, "buffer_percent": 75, "max_count": 90, "min_count": 57, "name": "PdIjlY6B", "unlimited": false, "use_buffer_percent": true}, "yJawGdrd": {"buffer_count": 72, "buffer_percent": 4, "max_count": 22, "min_count": 14, "name": "9ej6iyzh", "unlimited": false, "use_buffer_percent": true}}, "regions": ["7cIcml42", "KvfT15q4", "oQSm8fx1"], "session_timeout": 69, "unlimited": false, "use_buffer_percent": false}, "ISPykHPC": {"buffer_count": 61, "buffer_percent": 86, "configuration": "JFzz8Id3", "enable_region_overrides": true, "extendable_session": false, "game_version": "Eb1s4f6H", "max_count": 95, "min_count": 37, "name": "97pSOipI", "region_overrides": {"7PvfIUi6": {"buffer_count": 46, "buffer_percent": 53, "max_count": 92, "min_count": 42, "name": "RzGiQutZ", "unlimited": true, "use_buffer_percent": true}, "ooteqmef": {"buffer_count": 72, "buffer_percent": 25, "max_count": 22, "min_count": 8, "name": "PANbHi7i", "unlimited": true, "use_buffer_percent": true}, "o3PqP0xY": {"buffer_count": 5, "buffer_percent": 55, "max_count": 28, "min_count": 11, "name": "bf1eoaWH", "unlimited": true, "use_buffer_percent": true}}, "regions": ["VszKmEq0", "2JauHeOM", "aMsK4rR2"], "session_timeout": 93, "unlimited": false, "use_buffer_percent": true}}, "region_overrides": {"bTxptrMh": {"buffer_count": 92, "buffer_percent": 20, "max_count": 60, "min_count": 84, "name": "YHhL6OJd", "unlimited": true, "use_buffer_percent": false}, "VLmyX6pA": {"buffer_count": 43, "buffer_percent": 34, "max_count": 27, "min_count": 60, "name": "RK3fTx0R", "unlimited": true, "use_buffer_percent": true}, "K2ND5F6o": {"buffer_count": 30, "buffer_percent": 42, "max_count": 40, "min_count": 18, "name": "tmZDOMHL", "unlimited": false, "use_buffer_percent": true}}, "regions": ["UUObCwrS", "P2AxfTCS", "uZrAeMiZ"], "session_timeout": 99, "unlimited": false, "use_buffer_percent": false}' \
    > test.out 2>&1
eval_tap $? 65 'CreateDeploymentClient' test.out

#- 66 DeleteDeploymentClient
./ng net.accelbyte.sdk.cli.Main dsmc deleteDeploymentClient \
    --deployment '1GknP5sf' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 66 'DeleteDeploymentClient' test.out

#- 67 GetAllPodConfigClient
./ng net.accelbyte.sdk.cli.Main dsmc getAllPodConfigClient \
    --namespace "$AB_NAMESPACE" \
    --count '81' \
    --offset '37' \
    > test.out 2>&1
eval_tap $? 67 'GetAllPodConfigClient' test.out

#- 68 CreatePodConfigClient
./ng net.accelbyte.sdk.cli.Main dsmc createPodConfigClient \
    --name 'QKmXzz41' \
    --namespace "$AB_NAMESPACE" \
    --body '{"cpu_limit": 55, "mem_limit": 71, "params": "X9UnueJf"}' \
    > test.out 2>&1
eval_tap $? 68 'CreatePodConfigClient' test.out

#- 69 DeletePodConfigClient
./ng net.accelbyte.sdk.cli.Main dsmc deletePodConfigClient \
    --name 'IACoLKYK' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 69 'DeletePodConfigClient' test.out

#- 70 ListImagesClient
./ng net.accelbyte.sdk.cli.Main dsmc listImagesClient \
    --namespace "$AB_NAMESPACE" \
    --count '33' \
    --offset '48' \
    --q 'hodqmxsL' \
    --sortBy 'createdAt' \
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
    --version 'iNcAhU7u' \
    > test.out 2>&1
eval_tap $? 72 'ImageDetailClient' test.out

#- 73 ListServerClient
./ng net.accelbyte.sdk.cli.Main dsmc listServerClient \
    --namespace "$AB_NAMESPACE" \
    --region 'HwHST3mz' \
    --count '34' \
    --offset '91' \
    > test.out 2>&1
eval_tap $? 73 'ListServerClient' test.out

#- 74 CountServerDetailedClient
./ng net.accelbyte.sdk.cli.Main dsmc countServerDetailedClient \
    --namespace "$AB_NAMESPACE" \
    --region 'tbMvXxNU' \
    > test.out 2>&1
eval_tap $? 74 'CountServerDetailedClient' test.out

#- 75 ServerHeartbeat
./ng net.accelbyte.sdk.cli.Main dsmc serverHeartbeat \
    --namespace "$AB_NAMESPACE" \
    --body '{"podName": "Bj31G7Q8"}' \
    > test.out 2>&1
eval_tap $? 75 'ServerHeartbeat' test.out

#- 76 DeregisterLocalServer
./ng net.accelbyte.sdk.cli.Main dsmc deregisterLocalServer \
    --namespace "$AB_NAMESPACE" \
    --body '{"name": "5OAJGSFC"}' \
    > test.out 2>&1
eval_tap $? 76 'DeregisterLocalServer' test.out

#- 77 RegisterLocalServer
./ng net.accelbyte.sdk.cli.Main dsmc registerLocalServer \
    --namespace "$AB_NAMESPACE" \
    --body '{"custom_attribute": "r3IUP24u", "ip": "Hw6pVkQI", "name": "WgLUkT91", "port": 12}' \
    > test.out 2>&1
eval_tap $? 77 'RegisterLocalServer' test.out

#- 78 RegisterServer
./ng net.accelbyte.sdk.cli.Main dsmc registerServer \
    --namespace "$AB_NAMESPACE" \
    --body '{"custom_attribute": "ZRyAXdu4", "pod_name": "AEJOa9J8"}' \
    > test.out 2>&1
eval_tap $? 78 'RegisterServer' test.out

#- 79 ShutdownServer
./ng net.accelbyte.sdk.cli.Main dsmc shutdownServer \
    --namespace "$AB_NAMESPACE" \
    --body '{"kill_me": true, "pod_name": "5Zu3TGEK"}' \
    > test.out 2>&1
eval_tap $? 79 'ShutdownServer' test.out

#- 80 GetServerSessionTimeout
./ng net.accelbyte.sdk.cli.Main dsmc getServerSessionTimeout \
    --namespace "$AB_NAMESPACE" \
    --podName 'rqOVIM0C' \
    > test.out 2>&1
eval_tap $? 80 'GetServerSessionTimeout' test.out

#- 81 GetServerSession
./ng net.accelbyte.sdk.cli.Main dsmc getServerSession \
    --namespace "$AB_NAMESPACE" \
    --podName 'Gv5RW9LQ' \
    > test.out 2>&1
eval_tap $? 81 'GetServerSession' test.out

#- 82 CreateSession
./ng net.accelbyte.sdk.cli.Main dsmc createSession \
    --namespace "$AB_NAMESPACE" \
    --body '{"client_version": "Z2Tniywu", "configuration": "gJHWp2Uw", "deployment": "ZA7BO2Cu", "game_mode": "vL4ffgYh", "matching_allies": [{"matching_parties": [{"party_attributes": {"5ZaFEp5a": {}, "gRfAWDbS": {}, "WbQutvkg": {}}, "party_id": "GHgIoZ74", "party_members": [{"user_id": "DXJYUJrH"}, {"user_id": "LqFzDarg"}, {"user_id": "JFzTpXGU"}]}, {"party_attributes": {"9UKnG53o": {}, "Js75pEyz": {}, "JAi9FN5g": {}}, "party_id": "ICNIGrIt", "party_members": [{"user_id": "YurS64SE"}, {"user_id": "5xyrvCBb"}, {"user_id": "jCMVVJQP"}]}, {"party_attributes": {"iqvfKOwZ": {}, "oi6RTjcU": {}, "GUEEIK0p": {}}, "party_id": "yVjpr1nE", "party_members": [{"user_id": "RSh14sbv"}, {"user_id": "Ehktxf6s"}, {"user_id": "JxPw1I8V"}]}]}, {"matching_parties": [{"party_attributes": {"9H8Db5gm": {}, "xsTjxUaL": {}, "euY000Ss": {}}, "party_id": "PjXCnY6L", "party_members": [{"user_id": "fZNPfU9a"}, {"user_id": "xrM5N5td"}, {"user_id": "X9Vk5Lfn"}]}, {"party_attributes": {"nE7eMDU7": {}, "iChtqod6": {}, "tFhMBBSy": {}}, "party_id": "nuv3f6bY", "party_members": [{"user_id": "cnUhHe8e"}, {"user_id": "Re8b9yap"}, {"user_id": "kaWLjpzS"}]}, {"party_attributes": {"3UZOXQjR": {}, "q4ihmTLe": {}, "invq3Dse": {}}, "party_id": "GklgTCMP", "party_members": [{"user_id": "dURBUJDu"}, {"user_id": "CbMMhrwd"}, {"user_id": "jQd0VcTY"}]}]}, {"matching_parties": [{"party_attributes": {"B2At3vN1": {}, "Io76UDxW": {}, "9vO8X3iF": {}}, "party_id": "pRHj9Ltf", "party_members": [{"user_id": "CczBpF9E"}, {"user_id": "ADPbpb71"}, {"user_id": "fLtaqwxF"}]}, {"party_attributes": {"7QL9aBc7": {}, "o9LiBH85": {}, "5lHCpxzc": {}}, "party_id": "Jf8mj0xQ", "party_members": [{"user_id": "Eb63S4Y6"}, {"user_id": "a88U3OQL"}, {"user_id": "XsNJKnQF"}]}, {"party_attributes": {"KSr2pbz1": {}, "VkRxA8Mt": {}, "1PV8agRj": {}}, "party_id": "RUZo7v61", "party_members": [{"user_id": "Xlz2OQKJ"}, {"user_id": "GXGbUBag"}, {"user_id": "ZkikTYG8"}]}]}], "namespace": "s9iJEQwB", "notification_payload": {}, "pod_name": "UCPjIYGt", "region": "7g8iNWrI", "session_id": "LovIwFL7"}' \
    > test.out 2>&1
eval_tap $? 82 'CreateSession' test.out

#- 83 ClaimServer
./ng net.accelbyte.sdk.cli.Main dsmc claimServer \
    --namespace "$AB_NAMESPACE" \
    --body '{"game_mode": "T6dYnhCF", "matching_allies": [{"matching_parties": [{"party_attributes": {"FuBd6gtH": {}, "RVXwPgys": {}, "u3Y8iK6v": {}}, "party_id": "UW8bszlS", "party_members": [{"user_id": "Qk0cyuGe"}, {"user_id": "478uJcTG"}, {"user_id": "D0O0znuJ"}]}, {"party_attributes": {"URTzluqt": {}, "dr530DWx": {}, "56S0BUgy": {}}, "party_id": "YZglNm5k", "party_members": [{"user_id": "vlESkoTL"}, {"user_id": "0cNY4y3Z"}, {"user_id": "OBTN6Dln"}]}, {"party_attributes": {"GGC8F6D4": {}, "XjP3vT3T": {}, "YqFAYAaf": {}}, "party_id": "XH51D1LI", "party_members": [{"user_id": "IYBFYbxf"}, {"user_id": "Wi7qGTsU"}, {"user_id": "lZBeagyO"}]}]}, {"matching_parties": [{"party_attributes": {"vl3ULr0H": {}, "LFcHvy9k": {}, "VBUECERV": {}}, "party_id": "j5euhFz6", "party_members": [{"user_id": "ATJ94ECR"}, {"user_id": "wcN7Yv6X"}, {"user_id": "b69A0JzE"}]}, {"party_attributes": {"FPUvE31r": {}, "EejHxsIP": {}, "fia4nA29": {}}, "party_id": "afkplvtc", "party_members": [{"user_id": "tnQxNrGX"}, {"user_id": "lkQa8wMu"}, {"user_id": "mUU6IyNc"}]}, {"party_attributes": {"pOySxKhN": {}, "focPesJB": {}, "UwHxiYpS": {}}, "party_id": "wnbJZaez", "party_members": [{"user_id": "oFlDLFhK"}, {"user_id": "R8GRXH4s"}, {"user_id": "qZ7jLkkd"}]}]}, {"matching_parties": [{"party_attributes": {"rmvQzON1": {}, "xv2Bj0X5": {}, "M3tT8Yjl": {}}, "party_id": "Ajol0qO3", "party_members": [{"user_id": "O1aIG2qi"}, {"user_id": "UG0Q90ch"}, {"user_id": "o3fzWj18"}]}, {"party_attributes": {"VDtWvQgH": {}, "CcPZVcY6": {}, "qkqQxdUW": {}}, "party_id": "P0FHtysv", "party_members": [{"user_id": "JkzbBAP7"}, {"user_id": "WEPZic9w"}, {"user_id": "Z30tpyXf"}]}, {"party_attributes": {"wpVWp4t9": {}, "LqhkoM5V": {}, "atKbiDax": {}}, "party_id": "vtP9gVII", "party_members": [{"user_id": "gf0k7Ll0"}, {"user_id": "hN7g6w0w"}, {"user_id": "4JLJRd6F"}]}]}], "namespace": "XwgMJ5Kc", "notification_payload": {}, "session_id": "RMo5n9zq"}' \
    > test.out 2>&1
eval_tap $? 83 'ClaimServer' test.out

#- 84 GetSession
./ng net.accelbyte.sdk.cli.Main dsmc getSession \
    --namespace "$AB_NAMESPACE" \
    --sessionID 'hH1SHnJ1' \
    > test.out 2>&1
eval_tap $? 84 'GetSession' test.out

#- 85 CancelSession
./ng net.accelbyte.sdk.cli.Main dsmc cancelSession \
    --namespace "$AB_NAMESPACE" \
    --sessionID 'JtaMvwSg' \
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
    --region '8apejTF3' \
    > test.out 2>&1
eval_tap $? 88 'ListProvidersByRegion' test.out

#- 89 PublicGetMessages
./ng net.accelbyte.sdk.cli.Main dsmc publicGetMessages \
    > test.out 2>&1
eval_tap $? 89 'PublicGetMessages' test.out


rm -f "tmp.dat"

exit $EXIT_CODE