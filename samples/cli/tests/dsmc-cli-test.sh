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
    --body '{"artifactPath": "jRILMcr1", "coreDumpEnabled": true, "image": "MX0CSPqb", "imageReplicationsMap": {"xQNQwdx2": {"failure_code": "nT7snqVS", "region": "4K77olQp", "status": "Okbmm0KH", "uri": "QG7IuFrZ"}, "ZjTdA5HX": {"failure_code": "e7hzWddV", "region": "WMIqooaM", "status": "UU9cic2A", "uri": "mZwGXoJW"}, "YAOFIFmN": {"failure_code": "LUe2xftq", "region": "vGUNvHOD", "status": "0HyzG3CF", "uri": "dPJSsfWL"}}, "namespace": "55rZFrVO", "patchVersion": "iffyux87", "persistent": true, "ulimitFileSize": 11, "version": "0wBgcASN"}' \
    > test.out 2>&1
eval_tap $? 4 'UpdateImage' test.out

#- 5 CreateImage
./ng net.accelbyte.sdk.cli.Main dsmc createImage \
    --body '{"artifactPath": "OH145cf5", "coreDumpEnabled": true, "dockerPath": "ZwC47sfs", "image": "OeuuT9dd", "imageSize": 89, "namespace": "FzAolr9X", "persistent": true, "ulimitFileSize": 73, "version": "bEqnyZfj"}' \
    > test.out 2>&1
eval_tap $? 5 'CreateImage' test.out

#- 6 CreateImagePatch
./ng net.accelbyte.sdk.cli.Main dsmc createImagePatch \
    --body '{"artifactPath": "dX8Tz1t6", "coreDumpEnabled": false, "dockerPath": "XxcfoX9y", "image": "ZLMocH1s", "imageSize": 75, "namespace": "r7z6eBbn", "patchVersion": "zZArDxDd", "persistent": false, "ulimitFileSize": 12, "uploaderFlag": "RRAEsvgW", "version": "3mr10DvL"}' \
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
    --body '{"auto_deletion": false, "ghost_worker": false, "manual_buffer_override": false, "zombie_worker": false}' \
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
    --body '{"claim_timeout": 54, "creation_timeout": 30, "default_version": "qlQWkFXK", "port": 44, "ports": {"yJRddk3m": 20, "VYxbZfT2": 60, "IwBo3FlF": 39}, "protocol": "vCbmF0qi", "providers": ["4IG7hEOM", "v4h6Fknd", "fDtrW2Uz"], "session_timeout": 57, "unreachable_timeout": 26}' \
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
    --body '{"claim_timeout": 58, "creation_timeout": 45, "default_version": "rTXajDad", "port": 11, "protocol": "I8TGYXIm", "providers": ["Gjd6pSUY", "YA6gUWtE", "uDLuyIRl"], "session_timeout": 34, "unreachable_timeout": 48}' \
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
    --name 'hGCZlmQU' \
    --count '10' \
    --offset '7' \
    > test.out 2>&1
eval_tap $? 16 'GetAllDeployment' test.out

#- 17 GetDeployment
./ng net.accelbyte.sdk.cli.Main dsmc getDeployment \
    --deployment 'XRjOZwav' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 17 'GetDeployment' test.out

#- 18 CreateDeployment
./ng net.accelbyte.sdk.cli.Main dsmc createDeployment \
    --deployment 'VpYJwMhg' \
    --namespace "$AB_NAMESPACE" \
    --body '{"allow_version_override": false, "buffer_count": 49, "buffer_percent": 81, "configuration": "BKdF9ds4", "enable_region_overrides": true, "extendable_session": true, "game_version": "QR5fqnt3", "max_count": 65, "min_count": 24, "overrides": {"7i0aKQID": {"buffer_count": 35, "buffer_percent": 72, "configuration": "OEmujBW7", "enable_region_overrides": true, "extendable_session": true, "game_version": "pLNncUBY", "max_count": 97, "min_count": 2, "name": "vvS0mMxh", "region_overrides": {"tCjL4oB5": {"buffer_count": 58, "buffer_percent": 21, "max_count": 64, "min_count": 99, "name": "I8BphrWC", "unlimited": true, "use_buffer_percent": false}, "sijFCaL1": {"buffer_count": 8, "buffer_percent": 71, "max_count": 8, "min_count": 71, "name": "Evy4egZh", "unlimited": true, "use_buffer_percent": false}, "jyNS4D8H": {"buffer_count": 22, "buffer_percent": 73, "max_count": 47, "min_count": 16, "name": "FlXdjUij", "unlimited": false, "use_buffer_percent": true}}, "regions": ["acWXm2Ve", "nwSX2DK2", "4mjJDVlO"], "session_timeout": 76, "unlimited": false, "use_buffer_percent": false}, "AQ8lzhfW": {"buffer_count": 94, "buffer_percent": 39, "configuration": "aNVx0fHA", "enable_region_overrides": true, "extendable_session": true, "game_version": "xLaN7YRe", "max_count": 50, "min_count": 60, "name": "6DZkdPZ6", "region_overrides": {"o3eHqI7K": {"buffer_count": 67, "buffer_percent": 44, "max_count": 9, "min_count": 22, "name": "8RLvGgle", "unlimited": false, "use_buffer_percent": false}, "h97l8ZtR": {"buffer_count": 80, "buffer_percent": 43, "max_count": 18, "min_count": 70, "name": "mRCesjh2", "unlimited": false, "use_buffer_percent": true}, "7IQ2UdQ2": {"buffer_count": 18, "buffer_percent": 43, "max_count": 16, "min_count": 16, "name": "bVt32oVK", "unlimited": false, "use_buffer_percent": true}}, "regions": ["Hy0INUMg", "guiknooN", "UP5GJUhz"], "session_timeout": 54, "unlimited": false, "use_buffer_percent": false}, "3s0vw5r3": {"buffer_count": 53, "buffer_percent": 37, "configuration": "YQFMgp69", "enable_region_overrides": true, "extendable_session": true, "game_version": "DC8q1XUV", "max_count": 9, "min_count": 13, "name": "gKvmbcjA", "region_overrides": {"aHyDLUPt": {"buffer_count": 40, "buffer_percent": 37, "max_count": 6, "min_count": 1, "name": "rOhoIlgf", "unlimited": true, "use_buffer_percent": false}, "yBxtpGdS": {"buffer_count": 0, "buffer_percent": 5, "max_count": 58, "min_count": 70, "name": "yKIADYH3", "unlimited": true, "use_buffer_percent": true}, "C8QrJxa3": {"buffer_count": 47, "buffer_percent": 34, "max_count": 68, "min_count": 71, "name": "BLFZiCJa", "unlimited": false, "use_buffer_percent": false}}, "regions": ["iuNynXZG", "odNHhFM8", "cnD4PkdI"], "session_timeout": 10, "unlimited": false, "use_buffer_percent": true}}, "region_overrides": {"ZSEVPtnZ": {"buffer_count": 62, "buffer_percent": 54, "max_count": 58, "min_count": 8, "name": "nGnBfYVN", "unlimited": true, "use_buffer_percent": false}, "lFZgty83": {"buffer_count": 85, "buffer_percent": 17, "max_count": 39, "min_count": 67, "name": "jVgAmnKJ", "unlimited": false, "use_buffer_percent": true}, "9wxpnldm": {"buffer_count": 67, "buffer_percent": 36, "max_count": 81, "min_count": 65, "name": "n24vVeJN", "unlimited": true, "use_buffer_percent": true}}, "regions": ["RSK2siMT", "DzRSatlL", "Sj45lc05"], "session_timeout": 79, "unlimited": false, "use_buffer_percent": true}' \
    > test.out 2>&1
eval_tap $? 18 'CreateDeployment' test.out

#- 19 DeleteDeployment
./ng net.accelbyte.sdk.cli.Main dsmc deleteDeployment \
    --deployment 'EGT56JRu' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 19 'DeleteDeployment' test.out

#- 20 UpdateDeployment
./ng net.accelbyte.sdk.cli.Main dsmc updateDeployment \
    --deployment 'MQ7c4Qb0' \
    --namespace "$AB_NAMESPACE" \
    --body '{"allow_version_override": true, "buffer_count": 2, "buffer_percent": 34, "configuration": "rcaS9Kio", "enable_region_overrides": true, "extendable_session": false, "game_version": "xbDJ8wkn", "max_count": 10, "min_count": 77, "regions": ["X3nk1Ux0", "2QM1ePNM", "uUhGYtvt"], "session_timeout": 84, "unlimited": false, "use_buffer_percent": true}' \
    > test.out 2>&1
eval_tap $? 20 'UpdateDeployment' test.out

#- 21 CreateRootRegionOverride
./ng net.accelbyte.sdk.cli.Main dsmc createRootRegionOverride \
    --deployment 'yZkMQj8m' \
    --namespace "$AB_NAMESPACE" \
    --region 'zNBS1RJ7' \
    --body '{"buffer_count": 41, "buffer_percent": 83, "max_count": 15, "min_count": 38, "unlimited": false, "use_buffer_percent": true}' \
    > test.out 2>&1
eval_tap $? 21 'CreateRootRegionOverride' test.out

#- 22 DeleteRootRegionOverride
./ng net.accelbyte.sdk.cli.Main dsmc deleteRootRegionOverride \
    --deployment 'LuCT8M03' \
    --namespace "$AB_NAMESPACE" \
    --region 'mrMGsF2M' \
    > test.out 2>&1
eval_tap $? 22 'DeleteRootRegionOverride' test.out

#- 23 UpdateRootRegionOverride
./ng net.accelbyte.sdk.cli.Main dsmc updateRootRegionOverride \
    --deployment 'isltMurP' \
    --namespace "$AB_NAMESPACE" \
    --region '5i1SREcV' \
    --body '{"buffer_count": 72, "buffer_percent": 65, "max_count": 70, "min_count": 88, "unlimited": true, "use_buffer_percent": true}' \
    > test.out 2>&1
eval_tap $? 23 'UpdateRootRegionOverride' test.out

#- 24 CreateDeploymentOverride
./ng net.accelbyte.sdk.cli.Main dsmc createDeploymentOverride \
    --deployment 'CzjrnlXe' \
    --namespace "$AB_NAMESPACE" \
    --version 'lGQWvBMk' \
    --body '{"buffer_count": 100, "buffer_percent": 35, "configuration": "1UPTGPK8", "enable_region_overrides": true, "extendable_session": true, "game_version": "bBfLQVJG", "max_count": 50, "min_count": 16, "region_overrides": {"99d0iQZJ": {"buffer_count": 66, "buffer_percent": 83, "max_count": 49, "min_count": 35, "name": "FsCYtUln", "unlimited": false, "use_buffer_percent": false}, "r8MnSDdM": {"buffer_count": 46, "buffer_percent": 22, "max_count": 30, "min_count": 92, "name": "5WcIFvZi", "unlimited": false, "use_buffer_percent": true}, "c6qBF1LS": {"buffer_count": 46, "buffer_percent": 92, "max_count": 92, "min_count": 86, "name": "sE1UEXfD", "unlimited": true, "use_buffer_percent": false}}, "regions": ["PlMSKjNj", "oxQMn3bu", "VMsxVn1I"], "session_timeout": 35, "unlimited": false, "use_buffer_percent": true}' \
    > test.out 2>&1
eval_tap $? 24 'CreateDeploymentOverride' test.out

#- 25 DeleteDeploymentOverride
./ng net.accelbyte.sdk.cli.Main dsmc deleteDeploymentOverride \
    --deployment 'B86NvjIN' \
    --namespace "$AB_NAMESPACE" \
    --version 'gRN9RHBU' \
    > test.out 2>&1
eval_tap $? 25 'DeleteDeploymentOverride' test.out

#- 26 UpdateDeploymentOverride
./ng net.accelbyte.sdk.cli.Main dsmc updateDeploymentOverride \
    --deployment 'lgyRg9iF' \
    --namespace "$AB_NAMESPACE" \
    --version '6ISvdfZA' \
    --body '{"buffer_count": 52, "buffer_percent": 16, "configuration": "DtRMkgWK", "enable_region_overrides": true, "game_version": "oFStLvUY", "max_count": 6, "min_count": 88, "regions": ["XvXScGur", "ETJyYG6E", "hGMqCGe2"], "session_timeout": 37, "unlimited": true, "use_buffer_percent": true}' \
    > test.out 2>&1
eval_tap $? 26 'UpdateDeploymentOverride' test.out

#- 27 CreateOverrideRegionOverride
./ng net.accelbyte.sdk.cli.Main dsmc createOverrideRegionOverride \
    --deployment '0MDB2CXS' \
    --namespace "$AB_NAMESPACE" \
    --region '8NRbJGUK' \
    --version 'ssXLnAOi' \
    --body '{"buffer_count": 79, "buffer_percent": 54, "max_count": 3, "min_count": 63, "unlimited": false, "use_buffer_percent": true}' \
    > test.out 2>&1
eval_tap $? 27 'CreateOverrideRegionOverride' test.out

#- 28 DeleteOverrideRegionOverride
./ng net.accelbyte.sdk.cli.Main dsmc deleteOverrideRegionOverride \
    --deployment 'WWjZXhZS' \
    --namespace "$AB_NAMESPACE" \
    --region 'nI2OqbiS' \
    --version 'bSWSW5iv' \
    > test.out 2>&1
eval_tap $? 28 'DeleteOverrideRegionOverride' test.out

#- 29 UpdateOverrideRegionOverride
./ng net.accelbyte.sdk.cli.Main dsmc updateOverrideRegionOverride \
    --deployment 'IgeEcCyW' \
    --namespace "$AB_NAMESPACE" \
    --region 'exQuj1gE' \
    --version 'VK5Tc9Qw' \
    --body '{"buffer_count": 93, "buffer_percent": 33, "max_count": 87, "min_count": 48, "unlimited": true, "use_buffer_percent": false}' \
    > test.out 2>&1
eval_tap $? 29 'UpdateOverrideRegionOverride' test.out

#- 30 DeleteCreatingServerCountQueue
./ng net.accelbyte.sdk.cli.Main dsmc deleteCreatingServerCountQueue \
    --deployment 'OhRxisqe' \
    --namespace "$AB_NAMESPACE" \
    --version 'XRFc39GG' \
    > test.out 2>&1
eval_tap $? 30 'DeleteCreatingServerCountQueue' test.out

#- 31 GetAllPodConfig
./ng net.accelbyte.sdk.cli.Main dsmc getAllPodConfig \
    --namespace "$AB_NAMESPACE" \
    --count '62' \
    --offset '18' \
    > test.out 2>&1
eval_tap $? 31 'GetAllPodConfig' test.out

#- 32 GetPodConfig
./ng net.accelbyte.sdk.cli.Main dsmc getPodConfig \
    --name '3RxvQqfc' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 32 'GetPodConfig' test.out

#- 33 CreatePodConfig
./ng net.accelbyte.sdk.cli.Main dsmc createPodConfig \
    --name 'mlFOxUUu' \
    --namespace "$AB_NAMESPACE" \
    --body '{"cpu_limit": 13, "mem_limit": 83, "params": "MK8fiYpO"}' \
    > test.out 2>&1
eval_tap $? 33 'CreatePodConfig' test.out

#- 34 DeletePodConfig
./ng net.accelbyte.sdk.cli.Main dsmc deletePodConfig \
    --name 'HRu3MtR7' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 34 'DeletePodConfig' test.out

#- 35 UpdatePodConfig
./ng net.accelbyte.sdk.cli.Main dsmc updatePodConfig \
    --name 'EKL2N9yD' \
    --namespace "$AB_NAMESPACE" \
    --body '{"cpu_limit": 17, "mem_limit": 22, "name": "Um3e31M3", "params": "LNa8iwZr"}' \
    > test.out 2>&1
eval_tap $? 35 'UpdatePodConfig' test.out

#- 36 AddPort
./ng net.accelbyte.sdk.cli.Main dsmc addPort \
    --name 'gfx9SYuI' \
    --namespace "$AB_NAMESPACE" \
    --body '{"port": 73}' \
    > test.out 2>&1
eval_tap $? 36 'AddPort' test.out

#- 37 DeletePort
./ng net.accelbyte.sdk.cli.Main dsmc deletePort \
    --name 'b7BAP9Mi' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 37 'DeletePort' test.out

#- 38 UpdatePort
./ng net.accelbyte.sdk.cli.Main dsmc updatePort \
    --name 'v2BN7vQf' \
    --namespace "$AB_NAMESPACE" \
    --body '{"name": "jLFGLZ2n", "port": 69}' \
    > test.out 2>&1
eval_tap $? 38 'UpdatePort' test.out

#- 39 ListImages
./ng net.accelbyte.sdk.cli.Main dsmc listImages \
    --namespace "$AB_NAMESPACE" \
    --q 'kdcob3Yv' \
    --sortBy 'version' \
    --sortDirection 'desc' \
    --count '59' \
    --offset '53' \
    > test.out 2>&1
eval_tap $? 39 'ListImages' test.out

#- 40 DeleteImage
./ng net.accelbyte.sdk.cli.Main dsmc deleteImage \
    --namespace "$AB_NAMESPACE" \
    --imageURI 'czKVmhyD' \
    --version 'EPRrGNbt' \
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
    --imageURI 'vvIx8nwm' \
    --version 'AvYFxKAi' \
    --versionPatch 'VeFtIiOE' \
    > test.out 2>&1
eval_tap $? 42 'DeleteImagePatch' test.out

#- 43 GetImageDetail
./ng net.accelbyte.sdk.cli.Main dsmc getImageDetail \
    --namespace "$AB_NAMESPACE" \
    --version 'keFuyZOU' \
    > test.out 2>&1
eval_tap $? 43 'GetImageDetail' test.out

#- 44 GetImagePatches
./ng net.accelbyte.sdk.cli.Main dsmc getImagePatches \
    --namespace "$AB_NAMESPACE" \
    --version '4jNaMfTo' \
    > test.out 2>&1
eval_tap $? 44 'GetImagePatches' test.out

#- 45 GetImagePatchDetail
./ng net.accelbyte.sdk.cli.Main dsmc getImagePatchDetail \
    --namespace "$AB_NAMESPACE" \
    --version 'jAM4neMC' \
    --versionPatch 'So3ZiTKW' \
    > test.out 2>&1
eval_tap $? 45 'GetImagePatchDetail' test.out

#- 46 AddBuffer
./ng net.accelbyte.sdk.cli.Main dsmc addBuffer \
    --namespace "$AB_NAMESPACE" \
    --body '{"AllocCount": 97, "DeploymentName": "HGHhM1J3", "JobCount": 71, "JobPriority": 19, "OverrideVersion": "0faaxnX5", "Region": "ONQ9FFN7"}' \
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
    --region 'epov2vjH' \
    --count '48' \
    --offset '37' \
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
    --region 'u3njpTB9' \
    > test.out 2>&1
eval_tap $? 50 'CountServerDetailed' test.out

#- 51 ListLocalServer
./ng net.accelbyte.sdk.cli.Main dsmc listLocalServer \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 51 'ListLocalServer' test.out

#- 52 DeleteLocalServer
./ng net.accelbyte.sdk.cli.Main dsmc deleteLocalServer \
    --name 'KRnYKQUM' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 52 'DeleteLocalServer' test.out

#- 53 GetServer
./ng net.accelbyte.sdk.cli.Main dsmc getServer \
    --namespace "$AB_NAMESPACE" \
    --podName 'GE7l6PXA' \
    > test.out 2>&1
eval_tap $? 53 'GetServer' test.out

#- 54 DeleteServer
./ng net.accelbyte.sdk.cli.Main dsmc deleteServer \
    --namespace "$AB_NAMESPACE" \
    --podName 'HEKhqCct' \
    > test.out 2>&1
eval_tap $? 54 'DeleteServer' test.out

#- 55 ListSession
./ng net.accelbyte.sdk.cli.Main dsmc listSession \
    --namespace "$AB_NAMESPACE" \
    --region 'JYhjWLPu' \
    --withServer  \
    --count '23' \
    --offset '45' \
    > test.out 2>&1
eval_tap $? 55 'ListSession' test.out

#- 56 CountSession
./ng net.accelbyte.sdk.cli.Main dsmc countSession \
    --namespace "$AB_NAMESPACE" \
    --region 'nHw6neaw' \
    > test.out 2>&1
eval_tap $? 56 'CountSession' test.out

#- 57 DeleteSession
./ng net.accelbyte.sdk.cli.Main dsmc deleteSession \
    --namespace "$AB_NAMESPACE" \
    --sessionID 'wrtfLlSa' \
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
    --body '{"JobCount": 32, "Region": "535elnW4", "TimeoutSecond": 12, "ZombieCount": 7}' \
    > test.out 2>&1
eval_tap $? 59 'RunZombieCleanerRequestHandler' test.out

#- 60 CreateRepository
./ng net.accelbyte.sdk.cli.Main dsmc createRepository \
    --body '{"namespace": "VdinLYIl", "repository": "y114DoeR"}' \
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
    --name 'ofvObutL' \
    --count '88' \
    --offset '25' \
    > test.out 2>&1
eval_tap $? 63 'GetAllDeploymentClient' test.out

#- 64 GetDeploymentClient
./ng net.accelbyte.sdk.cli.Main dsmc getDeploymentClient \
    --deployment 'gg3GBsJb' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 64 'GetDeploymentClient' test.out

#- 65 CreateDeploymentClient
./ng net.accelbyte.sdk.cli.Main dsmc createDeploymentClient \
    --deployment 'fr6Dt9iQ' \
    --namespace "$AB_NAMESPACE" \
    --body '{"allow_version_override": true, "buffer_count": 85, "buffer_percent": 68, "configuration": "mAmNiiwh", "enable_region_overrides": false, "extendable_session": false, "game_version": "PJAJdVhP", "max_count": 88, "min_count": 13, "overrides": {"XfXKs8fJ": {"buffer_count": 68, "buffer_percent": 36, "configuration": "Z2idJfgc", "enable_region_overrides": false, "extendable_session": false, "game_version": "0BBPtMzH", "max_count": 84, "min_count": 35, "name": "zUUzIqQA", "region_overrides": {"y5kKWGhV": {"buffer_count": 59, "buffer_percent": 45, "max_count": 68, "min_count": 98, "name": "e73TfEoq", "unlimited": false, "use_buffer_percent": false}, "D5RBEmyH": {"buffer_count": 24, "buffer_percent": 13, "max_count": 8, "min_count": 22, "name": "02KYZUtW", "unlimited": false, "use_buffer_percent": true}, "2VgqZYDG": {"buffer_count": 21, "buffer_percent": 73, "max_count": 12, "min_count": 25, "name": "T1mhFPcW", "unlimited": true, "use_buffer_percent": false}}, "regions": ["umkQ2hhK", "i2FWSxb1", "1aJCCZSh"], "session_timeout": 63, "unlimited": true, "use_buffer_percent": false}, "YNQF7Ga6": {"buffer_count": 61, "buffer_percent": 12, "configuration": "CbCPrSQO", "enable_region_overrides": false, "extendable_session": false, "game_version": "2kTlJv7v", "max_count": 76, "min_count": 77, "name": "hmxtCkBN", "region_overrides": {"rgSdorq1": {"buffer_count": 87, "buffer_percent": 58, "max_count": 46, "min_count": 59, "name": "cEeNjakh", "unlimited": false, "use_buffer_percent": true}, "CtXZ6SBp": {"buffer_count": 10, "buffer_percent": 13, "max_count": 43, "min_count": 23, "name": "TJOkYW7t", "unlimited": true, "use_buffer_percent": true}, "HXpUQuY0": {"buffer_count": 73, "buffer_percent": 56, "max_count": 85, "min_count": 38, "name": "j6Ny6Tck", "unlimited": false, "use_buffer_percent": false}}, "regions": ["9aJrVjow", "dw6ZoYyb", "MppmSIAs"], "session_timeout": 63, "unlimited": false, "use_buffer_percent": true}, "16EldLVz": {"buffer_count": 64, "buffer_percent": 19, "configuration": "4QBidETe", "enable_region_overrides": true, "extendable_session": false, "game_version": "Lns25TGs", "max_count": 19, "min_count": 95, "name": "na1TI9kZ", "region_overrides": {"Xtc9s28G": {"buffer_count": 31, "buffer_percent": 5, "max_count": 90, "min_count": 14, "name": "y8jQ76CZ", "unlimited": false, "use_buffer_percent": false}, "Rua6R9NB": {"buffer_count": 59, "buffer_percent": 43, "max_count": 9, "min_count": 29, "name": "qLRIlEyr", "unlimited": false, "use_buffer_percent": true}, "KihAbWF4": {"buffer_count": 40, "buffer_percent": 91, "max_count": 57, "min_count": 70, "name": "qqwbV5ph", "unlimited": false, "use_buffer_percent": true}}, "regions": ["WN6lMEeH", "8og0cMfS", "tZK6ahEh"], "session_timeout": 24, "unlimited": false, "use_buffer_percent": true}}, "region_overrides": {"cKztx4Kw": {"buffer_count": 28, "buffer_percent": 89, "max_count": 37, "min_count": 6, "name": "YomnoewO", "unlimited": true, "use_buffer_percent": false}, "6PPy5Gq6": {"buffer_count": 32, "buffer_percent": 27, "max_count": 38, "min_count": 76, "name": "XGc9Qvmo", "unlimited": true, "use_buffer_percent": false}, "l3zPz8Mv": {"buffer_count": 71, "buffer_percent": 8, "max_count": 86, "min_count": 73, "name": "S8pXNfAr", "unlimited": false, "use_buffer_percent": true}}, "regions": ["XylROWTc", "p2HkcFdf", "Hh1fM7FB"], "session_timeout": 52, "unlimited": false, "use_buffer_percent": true}' \
    > test.out 2>&1
eval_tap $? 65 'CreateDeploymentClient' test.out

#- 66 DeleteDeploymentClient
./ng net.accelbyte.sdk.cli.Main dsmc deleteDeploymentClient \
    --deployment '4ues6861' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 66 'DeleteDeploymentClient' test.out

#- 67 GetAllPodConfigClient
./ng net.accelbyte.sdk.cli.Main dsmc getAllPodConfigClient \
    --namespace "$AB_NAMESPACE" \
    --count '84' \
    --offset '86' \
    > test.out 2>&1
eval_tap $? 67 'GetAllPodConfigClient' test.out

#- 68 CreatePodConfigClient
./ng net.accelbyte.sdk.cli.Main dsmc createPodConfigClient \
    --name 'SfzVw2qE' \
    --namespace "$AB_NAMESPACE" \
    --body '{"cpu_limit": 88, "mem_limit": 90, "params": "Ggech0s6"}' \
    > test.out 2>&1
eval_tap $? 68 'CreatePodConfigClient' test.out

#- 69 DeletePodConfigClient
./ng net.accelbyte.sdk.cli.Main dsmc deletePodConfigClient \
    --name 'Uphz9Lds' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 69 'DeletePodConfigClient' test.out

#- 70 ListImagesClient
./ng net.accelbyte.sdk.cli.Main dsmc listImagesClient \
    --namespace "$AB_NAMESPACE" \
    --count '55' \
    --offset '14' \
    --q 'bnSFtE0k' \
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
    --version 'zlKxpVnC' \
    > test.out 2>&1
eval_tap $? 72 'ImageDetailClient' test.out

#- 73 ListServerClient
./ng net.accelbyte.sdk.cli.Main dsmc listServerClient \
    --namespace "$AB_NAMESPACE" \
    --region 'xrQPdpg4' \
    --count '4' \
    --offset '22' \
    > test.out 2>&1
eval_tap $? 73 'ListServerClient' test.out

#- 74 CountServerDetailedClient
./ng net.accelbyte.sdk.cli.Main dsmc countServerDetailedClient \
    --namespace "$AB_NAMESPACE" \
    --region '2oSyOGIz' \
    > test.out 2>&1
eval_tap $? 74 'CountServerDetailedClient' test.out

#- 75 ServerHeartbeat
./ng net.accelbyte.sdk.cli.Main dsmc serverHeartbeat \
    --namespace "$AB_NAMESPACE" \
    --body '{"podName": "rrfy0o2Z"}' \
    > test.out 2>&1
eval_tap $? 75 'ServerHeartbeat' test.out

#- 76 DeregisterLocalServer
./ng net.accelbyte.sdk.cli.Main dsmc deregisterLocalServer \
    --namespace "$AB_NAMESPACE" \
    --body '{"name": "suHz4mbo"}' \
    > test.out 2>&1
eval_tap $? 76 'DeregisterLocalServer' test.out

#- 77 RegisterLocalServer
./ng net.accelbyte.sdk.cli.Main dsmc registerLocalServer \
    --namespace "$AB_NAMESPACE" \
    --body '{"custom_attribute": "fXptPQH3", "ip": "iruCR1ty", "name": "VCjFfUjs", "port": 89}' \
    > test.out 2>&1
eval_tap $? 77 'RegisterLocalServer' test.out

#- 78 RegisterServer
./ng net.accelbyte.sdk.cli.Main dsmc registerServer \
    --namespace "$AB_NAMESPACE" \
    --body '{"custom_attribute": "V7ogwIZw", "pod_name": "DizKNJit"}' \
    > test.out 2>&1
eval_tap $? 78 'RegisterServer' test.out

#- 79 ShutdownServer
./ng net.accelbyte.sdk.cli.Main dsmc shutdownServer \
    --namespace "$AB_NAMESPACE" \
    --body '{"kill_me": true, "pod_name": "UKCaWnTd"}' \
    > test.out 2>&1
eval_tap $? 79 'ShutdownServer' test.out

#- 80 GetServerSessionTimeout
./ng net.accelbyte.sdk.cli.Main dsmc getServerSessionTimeout \
    --namespace "$AB_NAMESPACE" \
    --podName 'bue4gXR3' \
    > test.out 2>&1
eval_tap $? 80 'GetServerSessionTimeout' test.out

#- 81 GetServerSession
./ng net.accelbyte.sdk.cli.Main dsmc getServerSession \
    --namespace "$AB_NAMESPACE" \
    --podName 'Sgtx5rTg' \
    > test.out 2>&1
eval_tap $? 81 'GetServerSession' test.out

#- 82 CreateSession
./ng net.accelbyte.sdk.cli.Main dsmc createSession \
    --namespace "$AB_NAMESPACE" \
    --body '{"client_version": "OFN8uIAS", "configuration": "K05AJAju", "deployment": "g1XPUcfH", "game_mode": "ZJQ8CBs3", "matching_allies": [{"matching_parties": [{"party_attributes": {"0Hy5FupG": {}, "0eJ1SKWf": {}, "JcVRTcGA": {}}, "party_id": "BRSgIxTT", "party_members": [{"user_id": "xjquWBag"}, {"user_id": "GzQPwTPU"}, {"user_id": "PtHfrH4K"}]}, {"party_attributes": {"sFPhtlAK": {}, "yuiOsUHI": {}, "wBviqZo7": {}}, "party_id": "H62BCFNA", "party_members": [{"user_id": "q5Y1qoXG"}, {"user_id": "qysw9L13"}, {"user_id": "Pu9xBDdo"}]}, {"party_attributes": {"8sXotaxw": {}, "COVzwFWP": {}, "zEBQicpf": {}}, "party_id": "HGbuO38Y", "party_members": [{"user_id": "loetnM0n"}, {"user_id": "GNlZY6GU"}, {"user_id": "ix653fFC"}]}]}, {"matching_parties": [{"party_attributes": {"854jHdHh": {}, "Rdp9x5Ye": {}, "BIgNlQzk": {}}, "party_id": "TpELin0F", "party_members": [{"user_id": "1HE1MJPe"}, {"user_id": "VYKDHlRy"}, {"user_id": "O8WcqPZQ"}]}, {"party_attributes": {"GqdmXkIj": {}, "aEuoLaC2": {}, "vgHGBMLY": {}}, "party_id": "neN6GGqk", "party_members": [{"user_id": "Ah3x3kz1"}, {"user_id": "WMB8u6Sh"}, {"user_id": "epfZDPow"}]}, {"party_attributes": {"swsvlLiu": {}, "3c4C0iFC": {}, "J4IcW9O3": {}}, "party_id": "6VTH1rq0", "party_members": [{"user_id": "UJfFiygP"}, {"user_id": "O3paBjGz"}, {"user_id": "qW28YZsj"}]}]}, {"matching_parties": [{"party_attributes": {"Xk0rRij5": {}, "bfSAU5j8": {}, "5SIzo9BN": {}}, "party_id": "MIuargZs", "party_members": [{"user_id": "t5LS2nSX"}, {"user_id": "v7AWDCdd"}, {"user_id": "fwRqiB5T"}]}, {"party_attributes": {"OScDrwTQ": {}, "qHbRJt8r": {}, "JVnzeeYn": {}}, "party_id": "GiWEPoJ1", "party_members": [{"user_id": "pj2luWka"}, {"user_id": "FAJHSwz3"}, {"user_id": "J2D0Qoti"}]}, {"party_attributes": {"OhK1tmaB": {}, "0X74MCGO": {}, "rASjzF7n": {}}, "party_id": "mWKIRLcG", "party_members": [{"user_id": "Kf78UN4W"}, {"user_id": "b7B6Z98f"}, {"user_id": "6hqry3Xv"}]}]}], "namespace": "MudKWNmx", "notification_payload": {}, "pod_name": "O5PGRtA3", "region": "9ukxslpu", "session_id": "oj6Liv9N"}' \
    > test.out 2>&1
eval_tap $? 82 'CreateSession' test.out

#- 83 ClaimServer
./ng net.accelbyte.sdk.cli.Main dsmc claimServer \
    --namespace "$AB_NAMESPACE" \
    --body '{"game_mode": "oMxLvHaT", "matching_allies": [{"matching_parties": [{"party_attributes": {"oJoF4hR2": {}, "ZMJ6ZwKM": {}, "BAlSXQVK": {}}, "party_id": "PXbrlxar", "party_members": [{"user_id": "EgWfXBov"}, {"user_id": "nVkz5IFT"}, {"user_id": "W14aiUWq"}]}, {"party_attributes": {"1qrgC5fB": {}, "VpCCx7AO": {}, "rLrGtAEg": {}}, "party_id": "9P3KzhUU", "party_members": [{"user_id": "1wdnjATM"}, {"user_id": "KB3PCMHc"}, {"user_id": "M83Mj1yY"}]}, {"party_attributes": {"9lfbHimO": {}, "bUfoBBza": {}, "9UBKbuEj": {}}, "party_id": "A158s5Sh", "party_members": [{"user_id": "c6DSRGyD"}, {"user_id": "6E8QFvaz"}, {"user_id": "0LjQm8lK"}]}]}, {"matching_parties": [{"party_attributes": {"Iw9gjpFx": {}, "mjUF6dZK": {}, "Qyp511yT": {}}, "party_id": "IH5OOL1f", "party_members": [{"user_id": "WD1khmWX"}, {"user_id": "4F8VfHsN"}, {"user_id": "xay6jk9T"}]}, {"party_attributes": {"nxL5Vtpn": {}, "syWuvZcD": {}, "nOvwy3aK": {}}, "party_id": "jroa47Bs", "party_members": [{"user_id": "FrUmsrpR"}, {"user_id": "przJFuK3"}, {"user_id": "RYWUW4Wm"}]}, {"party_attributes": {"HyeHwB42": {}, "k3DlSJMv": {}, "YUM6xMzD": {}}, "party_id": "qgLM5tip", "party_members": [{"user_id": "4PHmRatj"}, {"user_id": "29H5RmR8"}, {"user_id": "ciuyn6ax"}]}]}, {"matching_parties": [{"party_attributes": {"rRmwrHXT": {}, "8566oXdk": {}, "Aw4zzJZa": {}}, "party_id": "4eYIRgg4", "party_members": [{"user_id": "Vx7Vammc"}, {"user_id": "VxB3Sj4o"}, {"user_id": "XMR4KeUR"}]}, {"party_attributes": {"piB7WPVC": {}, "Eszwe1Nk": {}, "dTGItX6B": {}}, "party_id": "pqEfYRxx", "party_members": [{"user_id": "mLMUxNq3"}, {"user_id": "TWUTnVov"}, {"user_id": "9GcQWyat"}]}, {"party_attributes": {"3Z7pN8Uh": {}, "C5clcVDO": {}, "6YDEK07V": {}}, "party_id": "rjgXRdux", "party_members": [{"user_id": "iS5Bu7AO"}, {"user_id": "J6iWhe9p"}, {"user_id": "uv3iA5vx"}]}]}], "namespace": "E1OddBzJ", "notification_payload": {}, "session_id": "7bP2ktXV"}' \
    > test.out 2>&1
eval_tap $? 83 'ClaimServer' test.out

#- 84 GetSession
./ng net.accelbyte.sdk.cli.Main dsmc getSession \
    --namespace "$AB_NAMESPACE" \
    --sessionID 'caesKfA2' \
    > test.out 2>&1
eval_tap $? 84 'GetSession' test.out

#- 85 CancelSession
./ng net.accelbyte.sdk.cli.Main dsmc cancelSession \
    --namespace "$AB_NAMESPACE" \
    --sessionID 'ucuxIjeW' \
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
    --region 'ZOXi0Ic3' \
    > test.out 2>&1
eval_tap $? 88 'ListProvidersByRegion' test.out

#- 89 PublicGetMessages
./ng net.accelbyte.sdk.cli.Main dsmc publicGetMessages \
    > test.out 2>&1
eval_tap $? 89 'PublicGetMessages' test.out


rm -f "tmp.dat"

exit $EXIT_CODE