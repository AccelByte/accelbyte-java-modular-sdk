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
    --body '{"artifactPath": "HD8i4UNK", "coreDumpEnabled": true, "image": "Wb1l9axV", "imageReplicationsMap": {"PuUOe06Y": {"failure_code": "rcysGsnn", "region": "XyQBGIhl", "status": "qss2MJEQ", "uri": "IFUjSIBM"}, "RjQVBIG4": {"failure_code": "5mdpuMbc", "region": "UAHASiLn", "status": "qm0MuAhb", "uri": "McB8vW2I"}, "RBRA1EGq": {"failure_code": "2JVCxGkA", "region": "B1Nl5hCf", "status": "GPZGkOGH", "uri": "U6TH1B5o"}}, "namespace": "iQ1qw8Cm", "patchVersion": "f3zDW0Yy", "persistent": false, "ulimitFileSize": 0, "version": "p0Ib4iJi"}' \
    > test.out 2>&1
eval_tap $? 4 'UpdateImage' test.out

#- 5 CreateImage
./ng net.accelbyte.sdk.cli.Main dsmc createImage \
    --body '{"artifactPath": "W7zPYkdq", "coreDumpEnabled": false, "dockerPath": "VOA8tLJV", "image": "mcosSXtx", "imageSize": 80, "namespace": "RsnBwcBA", "persistent": true, "ulimitFileSize": 84, "version": "1WbncUZg"}' \
    > test.out 2>&1
eval_tap $? 5 'CreateImage' test.out

#- 6 CreateImagePatch
./ng net.accelbyte.sdk.cli.Main dsmc createImagePatch \
    --body '{"artifactPath": "LsX0FqUp", "coreDumpEnabled": false, "dockerPath": "xGktfoHg", "image": "Vm9jzaqK", "imageSize": 23, "namespace": "nnwpZIZc", "patchVersion": "7pDWQz9k", "persistent": false, "ulimitFileSize": 1, "uploaderFlag": "76Bzlbj0", "version": "hJaA9ImD"}' \
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
    --body '{"auto_deletion": false, "ghost_worker": false, "manual_buffer_override": true, "zombie_worker": false}' \
    > test.out 2>&1
eval_tap $? 9 'UpdateWorkerConfig' test.out

#- 10 CreateWorkerConfig
./ng net.accelbyte.sdk.cli.Main dsmc createWorkerConfig \
    --namespace "$AB_NAMESPACE" \
    --body '{"auto_deletion": true, "ghost_worker": true, "manual_buffer_override": true, "zombie_worker": true}' \
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
    --body '{"claim_timeout": 43, "creation_timeout": 70, "default_version": "AmLZ8FaD", "port": 93, "ports": {"WQ0yOb5O": 23, "qcO2Z2KD": 85, "yWIRtmGW": 98}, "protocol": "4puamkhU", "providers": ["NdCfFiIc", "Oh2Iu9dw", "t98Fn4o7"], "session_timeout": 26, "unreachable_timeout": 3}' \
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
    --body '{"claim_timeout": 15, "creation_timeout": 70, "default_version": "7mXgf8sP", "port": 24, "protocol": "wCXhCZCR", "providers": ["bGSCqFym", "5qW89jvP", "Ngx1rs6Y"], "session_timeout": 69, "unreachable_timeout": 2}' \
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
    --name 'aC1eSUkc' \
    --count '100' \
    --offset '35' \
    > test.out 2>&1
eval_tap $? 16 'GetAllDeployment' test.out

#- 17 GetDeployment
./ng net.accelbyte.sdk.cli.Main dsmc getDeployment \
    --deployment 'h3NBVsrQ' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 17 'GetDeployment' test.out

#- 18 CreateDeployment
./ng net.accelbyte.sdk.cli.Main dsmc createDeployment \
    --deployment 'Z94PHRRS' \
    --namespace "$AB_NAMESPACE" \
    --body '{"allow_version_override": false, "buffer_count": 52, "buffer_percent": 90, "configuration": "IpDRn3Dy", "enable_region_overrides": false, "extendable_session": true, "game_version": "XohneOs0", "max_count": 39, "min_count": 21, "overrides": {"He8Ucxy0": {"buffer_count": 3, "buffer_percent": 68, "configuration": "spgi70bf", "enable_region_overrides": true, "extendable_session": false, "game_version": "Iv9TK1HF", "max_count": 67, "min_count": 17, "name": "2aIURm91", "region_overrides": {"7MrMZJSB": {"buffer_count": 82, "buffer_percent": 74, "max_count": 9, "min_count": 30, "name": "K1SHx2OM", "unlimited": false, "use_buffer_percent": false}, "fNrl7hYk": {"buffer_count": 65, "buffer_percent": 11, "max_count": 30, "min_count": 67, "name": "qJLqH4vz", "unlimited": false, "use_buffer_percent": true}, "74Cco5le": {"buffer_count": 46, "buffer_percent": 99, "max_count": 40, "min_count": 78, "name": "wtbYVODl", "unlimited": false, "use_buffer_percent": false}}, "regions": ["pRTvNObR", "Z3RxLR0A", "wm8OtVQu"], "session_timeout": 5, "unlimited": false, "use_buffer_percent": false}, "OYUjaWZu": {"buffer_count": 35, "buffer_percent": 99, "configuration": "9GgcE2I0", "enable_region_overrides": false, "extendable_session": false, "game_version": "VWzT8T9z", "max_count": 54, "min_count": 11, "name": "ccoWpLMG", "region_overrides": {"zCxqMiu4": {"buffer_count": 84, "buffer_percent": 52, "max_count": 73, "min_count": 76, "name": "QrfuW8PS", "unlimited": false, "use_buffer_percent": false}, "rYNbCuZ9": {"buffer_count": 26, "buffer_percent": 3, "max_count": 53, "min_count": 61, "name": "cwDzmnOV", "unlimited": false, "use_buffer_percent": false}, "Plri8Lau": {"buffer_count": 60, "buffer_percent": 14, "max_count": 61, "min_count": 34, "name": "npOA4OBS", "unlimited": false, "use_buffer_percent": true}}, "regions": ["X0s3lTR2", "x1AggV2d", "aOFn2tlO"], "session_timeout": 86, "unlimited": true, "use_buffer_percent": false}, "dDki7HQh": {"buffer_count": 55, "buffer_percent": 19, "configuration": "tvSPTAqb", "enable_region_overrides": false, "extendable_session": true, "game_version": "nZCr7Fhe", "max_count": 33, "min_count": 33, "name": "ICz7oMzK", "region_overrides": {"bww1on4C": {"buffer_count": 5, "buffer_percent": 34, "max_count": 12, "min_count": 4, "name": "2IzrN5Px", "unlimited": false, "use_buffer_percent": false}, "oJefr4eT": {"buffer_count": 33, "buffer_percent": 53, "max_count": 2, "min_count": 54, "name": "vgB8aZFa", "unlimited": false, "use_buffer_percent": true}, "LUhaVO4V": {"buffer_count": 22, "buffer_percent": 77, "max_count": 64, "min_count": 80, "name": "4E3QNyUV", "unlimited": false, "use_buffer_percent": true}}, "regions": ["wJqgk2NO", "j3rN1FlW", "juye6wSf"], "session_timeout": 7, "unlimited": false, "use_buffer_percent": true}}, "region_overrides": {"itrnP6fc": {"buffer_count": 62, "buffer_percent": 12, "max_count": 57, "min_count": 48, "name": "K6teMu5i", "unlimited": true, "use_buffer_percent": true}, "E0SvtNjY": {"buffer_count": 44, "buffer_percent": 6, "max_count": 13, "min_count": 60, "name": "qdFv9FdF", "unlimited": true, "use_buffer_percent": false}, "5auMar69": {"buffer_count": 40, "buffer_percent": 56, "max_count": 42, "min_count": 68, "name": "4T6G0d7P", "unlimited": false, "use_buffer_percent": true}}, "regions": ["DYalDxfI", "C5ZDRllR", "DEoT27Ab"], "session_timeout": 31, "unlimited": true, "use_buffer_percent": true}' \
    > test.out 2>&1
eval_tap $? 18 'CreateDeployment' test.out

#- 19 DeleteDeployment
./ng net.accelbyte.sdk.cli.Main dsmc deleteDeployment \
    --deployment 'UKABPq0B' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 19 'DeleteDeployment' test.out

#- 20 UpdateDeployment
./ng net.accelbyte.sdk.cli.Main dsmc updateDeployment \
    --deployment 'OfulLdI4' \
    --namespace "$AB_NAMESPACE" \
    --body '{"allow_version_override": true, "buffer_count": 97, "buffer_percent": 69, "configuration": "sGjZ45ON", "enable_region_overrides": false, "extendable_session": true, "game_version": "nR3zfzsZ", "max_count": 12, "min_count": 43, "regions": ["q5k5oiHe", "VYB00lgn", "HpTay8td"], "session_timeout": 85, "unlimited": false, "use_buffer_percent": true}' \
    > test.out 2>&1
eval_tap $? 20 'UpdateDeployment' test.out

#- 21 CreateRootRegionOverride
./ng net.accelbyte.sdk.cli.Main dsmc createRootRegionOverride \
    --deployment 'lVgcrHz1' \
    --namespace "$AB_NAMESPACE" \
    --region 'fBajXXpv' \
    --body '{"buffer_count": 23, "buffer_percent": 99, "max_count": 6, "min_count": 89, "unlimited": true, "use_buffer_percent": true}' \
    > test.out 2>&1
eval_tap $? 21 'CreateRootRegionOverride' test.out

#- 22 DeleteRootRegionOverride
./ng net.accelbyte.sdk.cli.Main dsmc deleteRootRegionOverride \
    --deployment '9FPNTYhW' \
    --namespace "$AB_NAMESPACE" \
    --region 'UolRZEZD' \
    > test.out 2>&1
eval_tap $? 22 'DeleteRootRegionOverride' test.out

#- 23 UpdateRootRegionOverride
./ng net.accelbyte.sdk.cli.Main dsmc updateRootRegionOverride \
    --deployment 'PxEfhPWf' \
    --namespace "$AB_NAMESPACE" \
    --region 'wzlmTus9' \
    --body '{"buffer_count": 71, "buffer_percent": 7, "max_count": 97, "min_count": 81, "unlimited": true, "use_buffer_percent": false}' \
    > test.out 2>&1
eval_tap $? 23 'UpdateRootRegionOverride' test.out

#- 24 CreateDeploymentOverride
./ng net.accelbyte.sdk.cli.Main dsmc createDeploymentOverride \
    --deployment 'sbG96O6a' \
    --namespace "$AB_NAMESPACE" \
    --version 'cRK9YE9i' \
    --body '{"buffer_count": 58, "buffer_percent": 93, "configuration": "EZhhXbfs", "enable_region_overrides": false, "extendable_session": false, "game_version": "Un6s4yPr", "max_count": 33, "min_count": 47, "region_overrides": {"7KcAQ4uU": {"buffer_count": 32, "buffer_percent": 10, "max_count": 99, "min_count": 75, "name": "P818W6ez", "unlimited": true, "use_buffer_percent": false}, "axRLrpu6": {"buffer_count": 78, "buffer_percent": 89, "max_count": 87, "min_count": 48, "name": "qrVpJWAh", "unlimited": false, "use_buffer_percent": true}, "gj0zxksI": {"buffer_count": 46, "buffer_percent": 83, "max_count": 51, "min_count": 4, "name": "SFa4ncEC", "unlimited": false, "use_buffer_percent": true}}, "regions": ["fm52NvMA", "VBcOZBGg", "ZhtVyuOb"], "session_timeout": 68, "unlimited": true, "use_buffer_percent": false}' \
    > test.out 2>&1
eval_tap $? 24 'CreateDeploymentOverride' test.out

#- 25 DeleteDeploymentOverride
./ng net.accelbyte.sdk.cli.Main dsmc deleteDeploymentOverride \
    --deployment 'NB9gOTav' \
    --namespace "$AB_NAMESPACE" \
    --version 'rX6KOodj' \
    > test.out 2>&1
eval_tap $? 25 'DeleteDeploymentOverride' test.out

#- 26 UpdateDeploymentOverride
./ng net.accelbyte.sdk.cli.Main dsmc updateDeploymentOverride \
    --deployment 'LPMkvkzx' \
    --namespace "$AB_NAMESPACE" \
    --version 'yUA78i6d' \
    --body '{"buffer_count": 70, "buffer_percent": 69, "configuration": "5SBCGPAM", "enable_region_overrides": true, "game_version": "rps9XxBP", "max_count": 30, "min_count": 12, "regions": ["xyrMFFXa", "H83dpY66", "X1jlTv7u"], "session_timeout": 40, "unlimited": false, "use_buffer_percent": false}' \
    > test.out 2>&1
eval_tap $? 26 'UpdateDeploymentOverride' test.out

#- 27 CreateOverrideRegionOverride
./ng net.accelbyte.sdk.cli.Main dsmc createOverrideRegionOverride \
    --deployment 'BSyElvzD' \
    --namespace "$AB_NAMESPACE" \
    --region 'orHEZErs' \
    --version 't2xpF7Jt' \
    --body '{"buffer_count": 16, "buffer_percent": 0, "max_count": 34, "min_count": 91, "unlimited": true, "use_buffer_percent": true}' \
    > test.out 2>&1
eval_tap $? 27 'CreateOverrideRegionOverride' test.out

#- 28 DeleteOverrideRegionOverride
./ng net.accelbyte.sdk.cli.Main dsmc deleteOverrideRegionOverride \
    --deployment 'u2OEkwxx' \
    --namespace "$AB_NAMESPACE" \
    --region 'K2hlvxF8' \
    --version 'B9Zb9SOJ' \
    > test.out 2>&1
eval_tap $? 28 'DeleteOverrideRegionOverride' test.out

#- 29 UpdateOverrideRegionOverride
./ng net.accelbyte.sdk.cli.Main dsmc updateOverrideRegionOverride \
    --deployment '3x8pYzHs' \
    --namespace "$AB_NAMESPACE" \
    --region 'W3NOWgsZ' \
    --version 'MEkas4TR' \
    --body '{"buffer_count": 20, "buffer_percent": 30, "max_count": 38, "min_count": 71, "unlimited": true, "use_buffer_percent": false}' \
    > test.out 2>&1
eval_tap $? 29 'UpdateOverrideRegionOverride' test.out

#- 30 DeleteCreatingServerCountQueue
./ng net.accelbyte.sdk.cli.Main dsmc deleteCreatingServerCountQueue \
    --deployment '2UasvVMg' \
    --namespace "$AB_NAMESPACE" \
    --version 'tUHhKfG6' \
    > test.out 2>&1
eval_tap $? 30 'DeleteCreatingServerCountQueue' test.out

#- 31 GetAllPodConfig
./ng net.accelbyte.sdk.cli.Main dsmc getAllPodConfig \
    --namespace "$AB_NAMESPACE" \
    --count '24' \
    --offset '42' \
    > test.out 2>&1
eval_tap $? 31 'GetAllPodConfig' test.out

#- 32 GetPodConfig
./ng net.accelbyte.sdk.cli.Main dsmc getPodConfig \
    --name 'SdUSRKKe' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 32 'GetPodConfig' test.out

#- 33 CreatePodConfig
./ng net.accelbyte.sdk.cli.Main dsmc createPodConfig \
    --name 'htpXkBOK' \
    --namespace "$AB_NAMESPACE" \
    --body '{"cpu_limit": 1, "mem_limit": 15, "params": "xbAeTqRV"}' \
    > test.out 2>&1
eval_tap $? 33 'CreatePodConfig' test.out

#- 34 DeletePodConfig
./ng net.accelbyte.sdk.cli.Main dsmc deletePodConfig \
    --name '6A5haDIE' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 34 'DeletePodConfig' test.out

#- 35 UpdatePodConfig
./ng net.accelbyte.sdk.cli.Main dsmc updatePodConfig \
    --name 'zEGI0fUf' \
    --namespace "$AB_NAMESPACE" \
    --body '{"cpu_limit": 54, "mem_limit": 67, "name": "wL3lL0PK", "params": "7F6eHpJY"}' \
    > test.out 2>&1
eval_tap $? 35 'UpdatePodConfig' test.out

#- 36 AddPort
./ng net.accelbyte.sdk.cli.Main dsmc addPort \
    --name 'U1j04oFL' \
    --namespace "$AB_NAMESPACE" \
    --body '{"port": 19}' \
    > test.out 2>&1
eval_tap $? 36 'AddPort' test.out

#- 37 DeletePort
./ng net.accelbyte.sdk.cli.Main dsmc deletePort \
    --name '9sXpYqN6' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 37 'DeletePort' test.out

#- 38 UpdatePort
./ng net.accelbyte.sdk.cli.Main dsmc updatePort \
    --name 'JDtiMtts' \
    --namespace "$AB_NAMESPACE" \
    --body '{"name": "xF6KQzmk", "port": 10}' \
    > test.out 2>&1
eval_tap $? 38 'UpdatePort' test.out

#- 39 ListImages
./ng net.accelbyte.sdk.cli.Main dsmc listImages \
    --namespace "$AB_NAMESPACE" \
    --q 'DhT9FVjP' \
    --sortBy 'updatedAt' \
    --sortDirection 'desc' \
    --count '32' \
    --offset '72' \
    > test.out 2>&1
eval_tap $? 39 'ListImages' test.out

#- 40 DeleteImage
./ng net.accelbyte.sdk.cli.Main dsmc deleteImage \
    --namespace "$AB_NAMESPACE" \
    --imageURI '0Wh8fnT2' \
    --version 'b47DIeiK' \
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
    --imageURI 'KGq5XkhQ' \
    --version '1vH9akFW' \
    --versionPatch 'Q8FjqsX2' \
    > test.out 2>&1
eval_tap $? 42 'DeleteImagePatch' test.out

#- 43 GetImageDetail
./ng net.accelbyte.sdk.cli.Main dsmc getImageDetail \
    --namespace "$AB_NAMESPACE" \
    --version '8FksxaTp' \
    > test.out 2>&1
eval_tap $? 43 'GetImageDetail' test.out

#- 44 GetImagePatches
./ng net.accelbyte.sdk.cli.Main dsmc getImagePatches \
    --namespace "$AB_NAMESPACE" \
    --version 'fzLZ0G6r' \
    > test.out 2>&1
eval_tap $? 44 'GetImagePatches' test.out

#- 45 GetImagePatchDetail
./ng net.accelbyte.sdk.cli.Main dsmc getImagePatchDetail \
    --namespace "$AB_NAMESPACE" \
    --version 'BZSFFot3' \
    --versionPatch 'm7B8S4nV' \
    > test.out 2>&1
eval_tap $? 45 'GetImagePatchDetail' test.out

#- 46 AddBuffer
./ng net.accelbyte.sdk.cli.Main dsmc addBuffer \
    --namespace "$AB_NAMESPACE" \
    --body '{"AllocCount": 7, "DeploymentName": "gIAV5iQi", "JobCount": 11, "JobPriority": 34, "OverrideVersion": "YWGG41zG", "Region": "sRyhoMzg"}' \
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
    --region 'qm0df1bk' \
    --count '90' \
    --offset '91' \
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
    --region 'V30ywlmt' \
    > test.out 2>&1
eval_tap $? 50 'CountServerDetailed' test.out

#- 51 ListLocalServer
./ng net.accelbyte.sdk.cli.Main dsmc listLocalServer \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 51 'ListLocalServer' test.out

#- 52 DeleteLocalServer
./ng net.accelbyte.sdk.cli.Main dsmc deleteLocalServer \
    --name 'jrajy3zq' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 52 'DeleteLocalServer' test.out

#- 53 GetServer
./ng net.accelbyte.sdk.cli.Main dsmc getServer \
    --namespace "$AB_NAMESPACE" \
    --podName '2k5y5d9E' \
    > test.out 2>&1
eval_tap $? 53 'GetServer' test.out

#- 54 DeleteServer
./ng net.accelbyte.sdk.cli.Main dsmc deleteServer \
    --namespace "$AB_NAMESPACE" \
    --podName 'rDYHfGOr' \
    > test.out 2>&1
eval_tap $? 54 'DeleteServer' test.out

#- 55 ListSession
./ng net.accelbyte.sdk.cli.Main dsmc listSession \
    --namespace "$AB_NAMESPACE" \
    --region 'iNrmLjuL' \
    --withServer  \
    --count '60' \
    --offset '92' \
    > test.out 2>&1
eval_tap $? 55 'ListSession' test.out

#- 56 CountSession
./ng net.accelbyte.sdk.cli.Main dsmc countSession \
    --namespace "$AB_NAMESPACE" \
    --region 'SAtz0YKD' \
    > test.out 2>&1
eval_tap $? 56 'CountSession' test.out

#- 57 DeleteSession
./ng net.accelbyte.sdk.cli.Main dsmc deleteSession \
    --namespace "$AB_NAMESPACE" \
    --sessionID 'u8Mt6tcl' \
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
    --body '{"JobCount": 81, "Region": "156Hk53m", "TimeoutSecond": 79, "ZombieCount": 52}' \
    > test.out 2>&1
eval_tap $? 59 'RunZombieCleanerRequestHandler' test.out

#- 60 CreateRepository
./ng net.accelbyte.sdk.cli.Main dsmc createRepository \
    --body '{"namespace": "uaO0l3MB", "repository": "Sd0zo8lX"}' \
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
    --name 'f5pr1vha' \
    --count '39' \
    --offset '15' \
    > test.out 2>&1
eval_tap $? 63 'GetAllDeploymentClient' test.out

#- 64 GetDeploymentClient
./ng net.accelbyte.sdk.cli.Main dsmc getDeploymentClient \
    --deployment 'Tl3yrmCE' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 64 'GetDeploymentClient' test.out

#- 65 CreateDeploymentClient
./ng net.accelbyte.sdk.cli.Main dsmc createDeploymentClient \
    --deployment 'EvKCk99I' \
    --namespace "$AB_NAMESPACE" \
    --body '{"allow_version_override": false, "buffer_count": 3, "buffer_percent": 76, "configuration": "QSCNBIlz", "enable_region_overrides": true, "extendable_session": true, "game_version": "vXhFkhfD", "max_count": 21, "min_count": 49, "overrides": {"nCIskitq": {"buffer_count": 86, "buffer_percent": 31, "configuration": "nllrGIJc", "enable_region_overrides": true, "extendable_session": true, "game_version": "wB8m1P5X", "max_count": 50, "min_count": 1, "name": "sksG6I1H", "region_overrides": {"ydbxDm9Y": {"buffer_count": 67, "buffer_percent": 22, "max_count": 25, "min_count": 7, "name": "c2yJAdkY", "unlimited": false, "use_buffer_percent": true}, "cCDw6i03": {"buffer_count": 36, "buffer_percent": 22, "max_count": 56, "min_count": 52, "name": "EarRGoRt", "unlimited": true, "use_buffer_percent": false}, "sK0CdCwT": {"buffer_count": 39, "buffer_percent": 78, "max_count": 100, "min_count": 86, "name": "QnbKVxDD", "unlimited": true, "use_buffer_percent": false}}, "regions": ["k0mPFvbt", "Sm033LwZ", "zOJbkpbz"], "session_timeout": 60, "unlimited": false, "use_buffer_percent": true}, "wWqE1Hs7": {"buffer_count": 8, "buffer_percent": 12, "configuration": "OExbFmwJ", "enable_region_overrides": true, "extendable_session": false, "game_version": "yowY1fei", "max_count": 43, "min_count": 20, "name": "hZzEEEcc", "region_overrides": {"z0xY4kVQ": {"buffer_count": 1, "buffer_percent": 81, "max_count": 30, "min_count": 75, "name": "ALRuLOPh", "unlimited": true, "use_buffer_percent": true}, "6o1zB6Mq": {"buffer_count": 30, "buffer_percent": 58, "max_count": 53, "min_count": 10, "name": "1e5ZcMHv", "unlimited": false, "use_buffer_percent": false}, "Kd3h5b2R": {"buffer_count": 42, "buffer_percent": 43, "max_count": 6, "min_count": 22, "name": "lu8cx4tR", "unlimited": false, "use_buffer_percent": false}}, "regions": ["5DYNkWfw", "aeucthcB", "UsHYu9Zu"], "session_timeout": 32, "unlimited": true, "use_buffer_percent": true}, "7Kk34M0c": {"buffer_count": 12, "buffer_percent": 4, "configuration": "dK9Fm4Vo", "enable_region_overrides": false, "extendable_session": true, "game_version": "yTiCBMMW", "max_count": 62, "min_count": 82, "name": "VETFp3lq", "region_overrides": {"XAPenpL0": {"buffer_count": 45, "buffer_percent": 68, "max_count": 66, "min_count": 15, "name": "NB5LWONZ", "unlimited": true, "use_buffer_percent": true}, "3uJnwluw": {"buffer_count": 78, "buffer_percent": 84, "max_count": 7, "min_count": 4, "name": "6iw4qSYV", "unlimited": false, "use_buffer_percent": false}, "vsVw4O8f": {"buffer_count": 5, "buffer_percent": 90, "max_count": 80, "min_count": 6, "name": "zDgEg4ca", "unlimited": true, "use_buffer_percent": false}}, "regions": ["nIPtVDJb", "k6cAcgPI", "S3jzXjIK"], "session_timeout": 15, "unlimited": true, "use_buffer_percent": false}}, "region_overrides": {"Lz36K1II": {"buffer_count": 5, "buffer_percent": 78, "max_count": 91, "min_count": 30, "name": "wZh5v301", "unlimited": true, "use_buffer_percent": true}, "DQX3mTwS": {"buffer_count": 4, "buffer_percent": 68, "max_count": 33, "min_count": 100, "name": "ZErOHJkZ", "unlimited": false, "use_buffer_percent": true}, "BNC0lYNd": {"buffer_count": 60, "buffer_percent": 58, "max_count": 40, "min_count": 71, "name": "6oH7hjZy", "unlimited": false, "use_buffer_percent": false}}, "regions": ["qVplmJJ1", "TRWvFwpN", "HAx44rOj"], "session_timeout": 33, "unlimited": false, "use_buffer_percent": true}' \
    > test.out 2>&1
eval_tap $? 65 'CreateDeploymentClient' test.out

#- 66 DeleteDeploymentClient
./ng net.accelbyte.sdk.cli.Main dsmc deleteDeploymentClient \
    --deployment 'JcTwcXFk' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 66 'DeleteDeploymentClient' test.out

#- 67 GetAllPodConfigClient
./ng net.accelbyte.sdk.cli.Main dsmc getAllPodConfigClient \
    --namespace "$AB_NAMESPACE" \
    --count '12' \
    --offset '78' \
    > test.out 2>&1
eval_tap $? 67 'GetAllPodConfigClient' test.out

#- 68 CreatePodConfigClient
./ng net.accelbyte.sdk.cli.Main dsmc createPodConfigClient \
    --name 'zfLXhsrw' \
    --namespace "$AB_NAMESPACE" \
    --body '{"cpu_limit": 71, "mem_limit": 90, "params": "YQMcrv5j"}' \
    > test.out 2>&1
eval_tap $? 68 'CreatePodConfigClient' test.out

#- 69 DeletePodConfigClient
./ng net.accelbyte.sdk.cli.Main dsmc deletePodConfigClient \
    --name 'lH7GjHqg' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 69 'DeletePodConfigClient' test.out

#- 70 ListImagesClient
./ng net.accelbyte.sdk.cli.Main dsmc listImagesClient \
    --namespace "$AB_NAMESPACE" \
    --count '81' \
    --offset '0' \
    --q '0v6mRG1V' \
    --sortBy 'updatedAt' \
    --sortDirection 'desc' \
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
    --version '5hIsWXsa' \
    > test.out 2>&1
eval_tap $? 72 'ImageDetailClient' test.out

#- 73 ListServerClient
./ng net.accelbyte.sdk.cli.Main dsmc listServerClient \
    --namespace "$AB_NAMESPACE" \
    --region 'wadoKW6a' \
    --count '71' \
    --offset '79' \
    > test.out 2>&1
eval_tap $? 73 'ListServerClient' test.out

#- 74 CountServerDetailedClient
./ng net.accelbyte.sdk.cli.Main dsmc countServerDetailedClient \
    --namespace "$AB_NAMESPACE" \
    --region 'xwIHnee7' \
    > test.out 2>&1
eval_tap $? 74 'CountServerDetailedClient' test.out

#- 75 ServerHeartbeat
./ng net.accelbyte.sdk.cli.Main dsmc serverHeartbeat \
    --namespace "$AB_NAMESPACE" \
    --body '{"podName": "27w72eCP"}' \
    > test.out 2>&1
eval_tap $? 75 'ServerHeartbeat' test.out

#- 76 DeregisterLocalServer
./ng net.accelbyte.sdk.cli.Main dsmc deregisterLocalServer \
    --namespace "$AB_NAMESPACE" \
    --body '{"name": "gcE4ZXVh"}' \
    > test.out 2>&1
eval_tap $? 76 'DeregisterLocalServer' test.out

#- 77 RegisterLocalServer
./ng net.accelbyte.sdk.cli.Main dsmc registerLocalServer \
    --namespace "$AB_NAMESPACE" \
    --body '{"custom_attribute": "U49akzf5", "ip": "YOfagxxV", "name": "QObamJFM", "port": 34}' \
    > test.out 2>&1
eval_tap $? 77 'RegisterLocalServer' test.out

#- 78 RegisterServer
./ng net.accelbyte.sdk.cli.Main dsmc registerServer \
    --namespace "$AB_NAMESPACE" \
    --body '{"custom_attribute": "L6HBjzcv", "pod_name": "79qp6g8Y"}' \
    > test.out 2>&1
eval_tap $? 78 'RegisterServer' test.out

#- 79 ShutdownServer
./ng net.accelbyte.sdk.cli.Main dsmc shutdownServer \
    --namespace "$AB_NAMESPACE" \
    --body '{"kill_me": false, "pod_name": "Hr4AomMx"}' \
    > test.out 2>&1
eval_tap $? 79 'ShutdownServer' test.out

#- 80 GetServerSessionTimeout
./ng net.accelbyte.sdk.cli.Main dsmc getServerSessionTimeout \
    --namespace "$AB_NAMESPACE" \
    --podName 'JvpDuGiS' \
    > test.out 2>&1
eval_tap $? 80 'GetServerSessionTimeout' test.out

#- 81 GetServerSession
./ng net.accelbyte.sdk.cli.Main dsmc getServerSession \
    --namespace "$AB_NAMESPACE" \
    --podName 'QFaggDKQ' \
    > test.out 2>&1
eval_tap $? 81 'GetServerSession' test.out

#- 82 CreateSession
./ng net.accelbyte.sdk.cli.Main dsmc createSession \
    --namespace "$AB_NAMESPACE" \
    --body '{"client_version": "j9zsRg86", "configuration": "66rxdoHG", "deployment": "swRUOXLW", "game_mode": "Tq7pYoMV", "matching_allies": [{"matching_parties": [{"party_attributes": {"oZOZ5OzS": {}, "gNHmmQlG": {}, "pZYPV2As": {}}, "party_id": "atjr2b8Y", "party_members": [{"user_id": "GSZj66nJ"}, {"user_id": "TcQLnY6l"}, {"user_id": "XnZU4sD4"}]}, {"party_attributes": {"NNevE7gA": {}, "vAv49G29": {}, "hxNdlDjj": {}}, "party_id": "QQ3YkiKW", "party_members": [{"user_id": "AQlPgI8P"}, {"user_id": "bz0hI9mq"}, {"user_id": "5grXfuQo"}]}, {"party_attributes": {"mnHVECCC": {}, "eIWy0Uhn": {}, "cnpaFMWw": {}}, "party_id": "lzepnTBZ", "party_members": [{"user_id": "Np9w0QEE"}, {"user_id": "OQyXUCuj"}, {"user_id": "BhkhNhDE"}]}]}, {"matching_parties": [{"party_attributes": {"Oh5fRZQt": {}, "KUSoEW4o": {}, "dkCDSGh9": {}}, "party_id": "NlsbbwDQ", "party_members": [{"user_id": "oAEv9HHB"}, {"user_id": "Atn0BZlM"}, {"user_id": "zecT1ARW"}]}, {"party_attributes": {"FVaXgCNz": {}, "nAvs3COw": {}, "1QW13WEy": {}}, "party_id": "QnA5vqqt", "party_members": [{"user_id": "VITt4MRo"}, {"user_id": "rLxOsC7U"}, {"user_id": "a9bmSvqX"}]}, {"party_attributes": {"GORZtr8g": {}, "wlerDSns": {}, "Zt1Z6zsf": {}}, "party_id": "QPGh7RDu", "party_members": [{"user_id": "JV3mZVEs"}, {"user_id": "rgDFbs2m"}, {"user_id": "4a3S1uQM"}]}]}, {"matching_parties": [{"party_attributes": {"EqOgY1i8": {}, "Yr1DIzoR": {}, "wdXviLLJ": {}}, "party_id": "kzRkInJV", "party_members": [{"user_id": "LSS6bKlV"}, {"user_id": "nNVxP3rD"}, {"user_id": "B5pQeQ5j"}]}, {"party_attributes": {"49OSIGfH": {}, "fUYWEDK3": {}, "Oep17FFR": {}}, "party_id": "Bt1a4tg2", "party_members": [{"user_id": "95FMdfQd"}, {"user_id": "hB2j0hNF"}, {"user_id": "y72euynr"}]}, {"party_attributes": {"kzYSsBj0": {}, "o6A3poae": {}, "rS6IhB74": {}}, "party_id": "7Xy1LEnD", "party_members": [{"user_id": "eKTN3Ut8"}, {"user_id": "gqgvFgOD"}, {"user_id": "JmPzUNLk"}]}]}], "namespace": "BFxfbrDR", "notification_payload": {}, "pod_name": "JzgdQHrQ", "region": "0FrSBQVB", "session_id": "hW8khL8U"}' \
    > test.out 2>&1
eval_tap $? 82 'CreateSession' test.out

#- 83 ClaimServer
./ng net.accelbyte.sdk.cli.Main dsmc claimServer \
    --namespace "$AB_NAMESPACE" \
    --body '{"game_mode": "oPHKEG0r", "matching_allies": [{"matching_parties": [{"party_attributes": {"D8VVxowi": {}, "F2MMD7rz": {}, "GuV0821L": {}}, "party_id": "VuUr7Fl2", "party_members": [{"user_id": "QkppoH4F"}, {"user_id": "TByvuim5"}, {"user_id": "ZWsQcju1"}]}, {"party_attributes": {"VpVEUX5Q": {}, "jBPh1YFf": {}, "R4y2EPLU": {}}, "party_id": "bzXTPpjv", "party_members": [{"user_id": "xFDiknOT"}, {"user_id": "9TNgNthN"}, {"user_id": "2BZ8eyEb"}]}, {"party_attributes": {"DI1zXOla": {}, "x4uxG3P0": {}, "GNyueP7x": {}}, "party_id": "f6lBkgoX", "party_members": [{"user_id": "Ss0ACwEv"}, {"user_id": "EJPMiDE6"}, {"user_id": "2ValGArZ"}]}]}, {"matching_parties": [{"party_attributes": {"3idiwp7k": {}, "163Qzl9q": {}, "p8CemQPU": {}}, "party_id": "kdVWkeZj", "party_members": [{"user_id": "h2qoeCRe"}, {"user_id": "VA4xGHmo"}, {"user_id": "EwtRGbqV"}]}, {"party_attributes": {"jZRdhXr9": {}, "tp35cGbk": {}, "nqpXz4aY": {}}, "party_id": "ZgAYO83M", "party_members": [{"user_id": "AgMq2B9j"}, {"user_id": "GYtRYTJw"}, {"user_id": "RwhVWs2y"}]}, {"party_attributes": {"2XDVeDdp": {}, "RFeLlCHt": {}, "CTiZaHcy": {}}, "party_id": "QJHGTNvC", "party_members": [{"user_id": "nvTdb5Em"}, {"user_id": "KoVoFMK8"}, {"user_id": "UZeSbDWi"}]}]}, {"matching_parties": [{"party_attributes": {"3AqUfA5n": {}, "up7WI0Jj": {}, "scoHG67z": {}}, "party_id": "2hIlSYrh", "party_members": [{"user_id": "SpRWVH6N"}, {"user_id": "hnmgoBvY"}, {"user_id": "Lr3Id4fT"}]}, {"party_attributes": {"BaNT8uhi": {}, "ZWaipt0x": {}, "zHHSFA0j": {}}, "party_id": "HZkbrjyc", "party_members": [{"user_id": "e8cYn9dE"}, {"user_id": "RGaCIooq"}, {"user_id": "kpMao4pd"}]}, {"party_attributes": {"H8KdBDAV": {}, "GUwfK2oL": {}, "0Eh5XK8d": {}}, "party_id": "hQPIpqIW", "party_members": [{"user_id": "Dx5qdojN"}, {"user_id": "FGcPfIh6"}, {"user_id": "uyM65tve"}]}]}], "namespace": "FX13i3BL", "notification_payload": {}, "session_id": "I5aFibcf"}' \
    > test.out 2>&1
eval_tap $? 83 'ClaimServer' test.out

#- 84 GetSession
./ng net.accelbyte.sdk.cli.Main dsmc getSession \
    --namespace "$AB_NAMESPACE" \
    --sessionID '9egcNIt5' \
    > test.out 2>&1
eval_tap $? 84 'GetSession' test.out

#- 85 CancelSession
./ng net.accelbyte.sdk.cli.Main dsmc cancelSession \
    --namespace "$AB_NAMESPACE" \
    --sessionID '5Pwll9Oc' \
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
    --region 'GQ6eNCMp' \
    > test.out 2>&1
eval_tap $? 88 'ListProvidersByRegion' test.out

#- 89 PublicGetMessages
./ng net.accelbyte.sdk.cli.Main dsmc publicGetMessages \
    > test.out 2>&1
eval_tap $? 89 'PublicGetMessages' test.out


rm -f "tmp.dat"

exit $EXIT_CODE