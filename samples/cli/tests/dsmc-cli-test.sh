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
echo "1..82"

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
    --body '{"artifactPath": "xT9H2NY3", "coreDumpEnabled": false, "image": "53ujTTZv", "imageReplicationsMap": {"rETQimqV": {"failure_code": "xyYtwAbo", "region": "fBfWr4pu", "status": "APPDs03n", "uri": "ULR8idDx"}, "sayNaLKm": {"failure_code": "Xx0SwXer", "region": "bVVbt56h", "status": "RYvDVyh2", "uri": "DYsFLQtm"}, "ql6sp7FN": {"failure_code": "nSUIipGV", "region": "JEfdHmlD", "status": "w1DIuRCl", "uri": "PlLOywbM"}}, "namespace": "wg5vjSxG", "patchVersion": "WobAzorP", "persistent": true, "version": "f2GGrDLR"}' \
    > test.out 2>&1
eval_tap $? 4 'UpdateImage' test.out

#- 5 CreateImage
./ng net.accelbyte.sdk.cli.Main dsmc createImage \
    --body '{"artifactPath": "z8Ar7CNl", "coreDumpEnabled": false, "dockerPath": "mtgafPfN", "image": "tTT2dJ7l", "imageSize": 93, "namespace": "TVSquWOG", "persistent": true, "ulimitFileSize": 31, "version": "HUGWciZY"}' \
    > test.out 2>&1
eval_tap $? 5 'CreateImage' test.out

#- 6 ImportImages
./ng net.accelbyte.sdk.cli.Main dsmc importImages \
    --file 'tmp.dat' \
    > test.out 2>&1
eval_tap $? 6 'ImportImages' test.out

#- 7 CreateImagePatch
./ng net.accelbyte.sdk.cli.Main dsmc createImagePatch \
    --body '{"artifactPath": "0J5NokHq", "coreDumpEnabled": true, "dockerPath": "MdVyWHso", "image": "lL0FDtpa", "imageSize": 16, "namespace": "HYDdDzAj", "patchVersion": "P3YMnRG1", "persistent": false, "ulimitFileSize": 12, "uploaderFlag": "vQFLEXHn", "version": "nMxlWmjI"}' \
    > test.out 2>&1
eval_tap $? 7 'CreateImagePatch' test.out

#- 8 GetLowestInstanceSpec
./ng net.accelbyte.sdk.cli.Main dsmc getLowestInstanceSpec \
    > test.out 2>&1
eval_tap $? 8 'GetLowestInstanceSpec' test.out

#- 9 GetConfig
./ng net.accelbyte.sdk.cli.Main dsmc getConfig \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 9 'GetConfig' test.out

#- 10 CreateConfig
./ng net.accelbyte.sdk.cli.Main dsmc createConfig \
    --namespace "$AB_NAMESPACE" \
    --body '{"claim_timeout": 73, "creation_timeout": 7, "default_version": "8YPCO9Cd", "port": 77, "ports": {"WOwF9iik": 60, "a0caV1uw": 7, "AQ77xlAm": 45}, "protocol": "r4wledk7", "providers": ["IJv0CBUz", "ENE5pS25", "X06qfBoJ"], "session_timeout": 11, "unreachable_timeout": 11}' \
    > test.out 2>&1
eval_tap $? 10 'CreateConfig' test.out

#- 11 DeleteConfig
./ng net.accelbyte.sdk.cli.Main dsmc deleteConfig \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 11 'DeleteConfig' test.out

#- 12 UpdateConfig
./ng net.accelbyte.sdk.cli.Main dsmc updateConfig \
    --namespace "$AB_NAMESPACE" \
    --body '{"claim_timeout": 7, "creation_timeout": 84, "default_version": "djlbjJLa", "port": 80, "protocol": "0Jxkikq8", "providers": ["cDf3BhDw", "Sa6j5WY7", "DiY6j7qh"], "session_timeout": 71, "unreachable_timeout": 48}' \
    > test.out 2>&1
eval_tap $? 12 'UpdateConfig' test.out

#- 13 ClearCache
./ng net.accelbyte.sdk.cli.Main dsmc clearCache \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 13 'ClearCache' test.out

#- 14 GetAllDeployment
./ng net.accelbyte.sdk.cli.Main dsmc getAllDeployment \
    --namespace "$AB_NAMESPACE" \
    --name 'I3BiIlnr' \
    --count '51' \
    --offset '82' \
    > test.out 2>&1
eval_tap $? 14 'GetAllDeployment' test.out

#- 15 GetDeployment
./ng net.accelbyte.sdk.cli.Main dsmc getDeployment \
    --deployment '44JRV4VO' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 15 'GetDeployment' test.out

#- 16 CreateDeployment
./ng net.accelbyte.sdk.cli.Main dsmc createDeployment \
    --deployment 'f16AGyYX' \
    --namespace "$AB_NAMESPACE" \
    --body '{"allow_version_override": true, "buffer_count": 54, "buffer_percent": 24, "configuration": "RrXlayol", "enable_region_overrides": false, "extendable_session": false, "game_version": "SSZ9qbRp", "max_count": 27, "min_count": 3, "overrides": {"noLaOVQ8": {"buffer_count": 8, "buffer_percent": 65, "configuration": "scERQFw3", "enable_region_overrides": false, "extendable_session": false, "game_version": "uNfxPXCv", "max_count": 54, "min_count": 63, "name": "B4p1zUgN", "region_overrides": {"eH29rjWq": {"buffer_count": 53, "buffer_percent": 54, "max_count": 92, "min_count": 59, "name": "BbczUORt", "unlimited": true, "use_buffer_percent": false}, "Kx5N7ILU": {"buffer_count": 79, "buffer_percent": 60, "max_count": 45, "min_count": 12, "name": "isyCX4BG", "unlimited": true, "use_buffer_percent": false}, "706d3tbe": {"buffer_count": 83, "buffer_percent": 8, "max_count": 44, "min_count": 53, "name": "QvI5xspe", "unlimited": false, "use_buffer_percent": true}}, "regions": ["6PkaTrVg", "sCFGKZna", "FBdyjpXx"], "session_timeout": 93, "unlimited": true, "use_buffer_percent": false}, "D2I9KHhN": {"buffer_count": 55, "buffer_percent": 46, "configuration": "NawDbDHt", "enable_region_overrides": true, "extendable_session": false, "game_version": "286reZcG", "max_count": 96, "min_count": 4, "name": "nK74ZZeN", "region_overrides": {"Hmf4Q1ra": {"buffer_count": 71, "buffer_percent": 37, "max_count": 68, "min_count": 41, "name": "VZPqwczO", "unlimited": false, "use_buffer_percent": false}, "k8HJN2HQ": {"buffer_count": 81, "buffer_percent": 70, "max_count": 43, "min_count": 10, "name": "RXcajD9x", "unlimited": false, "use_buffer_percent": true}, "CoTnfM00": {"buffer_count": 9, "buffer_percent": 50, "max_count": 40, "min_count": 41, "name": "QC7LDOv3", "unlimited": false, "use_buffer_percent": true}}, "regions": ["wDZZqxNe", "YEwyeOZO", "fcXSHqIw"], "session_timeout": 30, "unlimited": false, "use_buffer_percent": false}, "LYJCWfCp": {"buffer_count": 31, "buffer_percent": 83, "configuration": "tT18xjcH", "enable_region_overrides": false, "extendable_session": false, "game_version": "BV9mVwsk", "max_count": 30, "min_count": 61, "name": "TJxoFYLC", "region_overrides": {"YKFvUzyR": {"buffer_count": 5, "buffer_percent": 31, "max_count": 99, "min_count": 22, "name": "fxsQwq1j", "unlimited": true, "use_buffer_percent": true}, "ayZBnxYf": {"buffer_count": 53, "buffer_percent": 49, "max_count": 12, "min_count": 37, "name": "OF03NEuj", "unlimited": false, "use_buffer_percent": false}, "L3KTlAg9": {"buffer_count": 39, "buffer_percent": 29, "max_count": 75, "min_count": 15, "name": "bQdCVsCa", "unlimited": false, "use_buffer_percent": true}}, "regions": ["fOpIgZrK", "BXn7tn9f", "jFzVpjgj"], "session_timeout": 76, "unlimited": true, "use_buffer_percent": true}}, "region_overrides": {"v8LHGreu": {"buffer_count": 78, "buffer_percent": 55, "max_count": 53, "min_count": 10, "name": "bjvoD8Yf", "unlimited": false, "use_buffer_percent": true}, "5dUDYrsj": {"buffer_count": 55, "buffer_percent": 24, "max_count": 38, "min_count": 1, "name": "FvcKtq0E", "unlimited": true, "use_buffer_percent": false}, "mmfcBE6w": {"buffer_count": 7, "buffer_percent": 58, "max_count": 34, "min_count": 31, "name": "6tOLggOO", "unlimited": false, "use_buffer_percent": false}}, "regions": ["oR1q8nZk", "wqu1Oila", "OKCjtR0M"], "session_timeout": 85, "unlimited": false, "use_buffer_percent": false}' \
    > test.out 2>&1
eval_tap $? 16 'CreateDeployment' test.out

#- 17 DeleteDeployment
./ng net.accelbyte.sdk.cli.Main dsmc deleteDeployment \
    --deployment 'BmSv956G' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 17 'DeleteDeployment' test.out

#- 18 UpdateDeployment
./ng net.accelbyte.sdk.cli.Main dsmc updateDeployment \
    --deployment 'imfv4utG' \
    --namespace "$AB_NAMESPACE" \
    --body '{"allow_version_override": true, "buffer_count": 47, "buffer_percent": 16, "configuration": "6rf8WiIP", "enable_region_overrides": false, "extendable_session": false, "game_version": "RZsnIkUQ", "max_count": 99, "min_count": 48, "regions": ["VEHwKfEy", "jxubNq8x", "qfQnre7M"], "session_timeout": 80, "unlimited": true, "use_buffer_percent": false}' \
    > test.out 2>&1
eval_tap $? 18 'UpdateDeployment' test.out

#- 19 CreateRootRegionOverride
./ng net.accelbyte.sdk.cli.Main dsmc createRootRegionOverride \
    --deployment '5hx2Wnjz' \
    --namespace "$AB_NAMESPACE" \
    --region 'WXELfiSc' \
    --body '{"buffer_count": 70, "buffer_percent": 45, "max_count": 88, "min_count": 39, "unlimited": false, "use_buffer_percent": false}' \
    > test.out 2>&1
eval_tap $? 19 'CreateRootRegionOverride' test.out

#- 20 DeleteRootRegionOverride
./ng net.accelbyte.sdk.cli.Main dsmc deleteRootRegionOverride \
    --deployment 'GV0vEqjt' \
    --namespace "$AB_NAMESPACE" \
    --region 'S5h57tyI' \
    > test.out 2>&1
eval_tap $? 20 'DeleteRootRegionOverride' test.out

#- 21 UpdateRootRegionOverride
./ng net.accelbyte.sdk.cli.Main dsmc updateRootRegionOverride \
    --deployment '3cgnEQvc' \
    --namespace "$AB_NAMESPACE" \
    --region '41zdZt5Y' \
    --body '{"buffer_count": 84, "buffer_percent": 65, "max_count": 52, "min_count": 33, "unlimited": false, "use_buffer_percent": false}' \
    > test.out 2>&1
eval_tap $? 21 'UpdateRootRegionOverride' test.out

#- 22 CreateDeploymentOverride
./ng net.accelbyte.sdk.cli.Main dsmc createDeploymentOverride \
    --deployment 'yHqlvQUh' \
    --namespace "$AB_NAMESPACE" \
    --version 'q7ZHAYqi' \
    --body '{"buffer_count": 76, "buffer_percent": 95, "configuration": "zbSec6Tl", "enable_region_overrides": true, "extendable_session": true, "game_version": "8jyKJGgZ", "max_count": 18, "min_count": 0, "region_overrides": {"A9AMdn10": {"buffer_count": 30, "buffer_percent": 15, "max_count": 13, "min_count": 0, "name": "bKEunGDt", "unlimited": true, "use_buffer_percent": true}, "LbnKC7u4": {"buffer_count": 9, "buffer_percent": 96, "max_count": 23, "min_count": 9, "name": "iyUWDLfe", "unlimited": true, "use_buffer_percent": true}, "kRfV2WBR": {"buffer_count": 55, "buffer_percent": 7, "max_count": 13, "min_count": 45, "name": "ZhQoOtVU", "unlimited": true, "use_buffer_percent": false}}, "regions": ["e5Vfpnx4", "sRUL78X8", "weU5S2ej"], "session_timeout": 29, "unlimited": true, "use_buffer_percent": false}' \
    > test.out 2>&1
eval_tap $? 22 'CreateDeploymentOverride' test.out

#- 23 DeleteDeploymentOverride
./ng net.accelbyte.sdk.cli.Main dsmc deleteDeploymentOverride \
    --deployment 'wL7tgOfQ' \
    --namespace "$AB_NAMESPACE" \
    --version 'loW3tFFx' \
    > test.out 2>&1
eval_tap $? 23 'DeleteDeploymentOverride' test.out

#- 24 UpdateDeploymentOverride
./ng net.accelbyte.sdk.cli.Main dsmc updateDeploymentOverride \
    --deployment 'ZaFHaFN6' \
    --namespace "$AB_NAMESPACE" \
    --version 'nmVkFXGf' \
    --body '{"buffer_count": 3, "buffer_percent": 47, "configuration": "VYNIKZcr", "enable_region_overrides": true, "game_version": "aRyFTVCQ", "max_count": 90, "min_count": 85, "regions": ["qgWYEjRd", "oy56Qpmj", "MoLNIJUI"], "session_timeout": 7, "unlimited": true, "use_buffer_percent": true}' \
    > test.out 2>&1
eval_tap $? 24 'UpdateDeploymentOverride' test.out

#- 25 CreateOverrideRegionOverride
./ng net.accelbyte.sdk.cli.Main dsmc createOverrideRegionOverride \
    --deployment 'uW8XXrqM' \
    --namespace "$AB_NAMESPACE" \
    --region 'AJO5NYUf' \
    --version 'QlYdLJDe' \
    --body '{"buffer_count": 94, "buffer_percent": 0, "max_count": 94, "min_count": 2, "unlimited": false, "use_buffer_percent": true}' \
    > test.out 2>&1
eval_tap $? 25 'CreateOverrideRegionOverride' test.out

#- 26 DeleteOverrideRegionOverride
./ng net.accelbyte.sdk.cli.Main dsmc deleteOverrideRegionOverride \
    --deployment 'UA8PLADL' \
    --namespace "$AB_NAMESPACE" \
    --region 'QQxZSMON' \
    --version 'Go4ONKIj' \
    > test.out 2>&1
eval_tap $? 26 'DeleteOverrideRegionOverride' test.out

#- 27 UpdateOverrideRegionOverride
./ng net.accelbyte.sdk.cli.Main dsmc updateOverrideRegionOverride \
    --deployment 'xtOLbu5W' \
    --namespace "$AB_NAMESPACE" \
    --region 'VaesUvbD' \
    --version 'Ys1wOWb2' \
    --body '{"buffer_count": 43, "buffer_percent": 7, "max_count": 5, "min_count": 81, "unlimited": true, "use_buffer_percent": false}' \
    > test.out 2>&1
eval_tap $? 27 'UpdateOverrideRegionOverride' test.out

#- 28 GetAllPodConfig
./ng net.accelbyte.sdk.cli.Main dsmc getAllPodConfig \
    --namespace "$AB_NAMESPACE" \
    --count '100' \
    --offset '55' \
    > test.out 2>&1
eval_tap $? 28 'GetAllPodConfig' test.out

#- 29 GetPodConfig
./ng net.accelbyte.sdk.cli.Main dsmc getPodConfig \
    --name 'HA4OWNPT' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 29 'GetPodConfig' test.out

#- 30 CreatePodConfig
./ng net.accelbyte.sdk.cli.Main dsmc createPodConfig \
    --name '0771028Q' \
    --namespace "$AB_NAMESPACE" \
    --body '{"cpu_limit": 11, "mem_limit": 35, "params": "BucIeOT4"}' \
    > test.out 2>&1
eval_tap $? 30 'CreatePodConfig' test.out

#- 31 DeletePodConfig
./ng net.accelbyte.sdk.cli.Main dsmc deletePodConfig \
    --name 'auqIwnUB' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 31 'DeletePodConfig' test.out

#- 32 UpdatePodConfig
./ng net.accelbyte.sdk.cli.Main dsmc updatePodConfig \
    --name '4JcYU0I2' \
    --namespace "$AB_NAMESPACE" \
    --body '{"cpu_limit": 56, "mem_limit": 82, "name": "vodP9Ubu", "params": "uM1O7rqG"}' \
    > test.out 2>&1
eval_tap $? 32 'UpdatePodConfig' test.out

#- 33 AddPort
./ng net.accelbyte.sdk.cli.Main dsmc addPort \
    --name '7I0z0XTK' \
    --namespace "$AB_NAMESPACE" \
    --body '{"port": 33}' \
    > test.out 2>&1
eval_tap $? 33 'AddPort' test.out

#- 34 DeletePort
./ng net.accelbyte.sdk.cli.Main dsmc deletePort \
    --name 'eHsD6zF1' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 34 'DeletePort' test.out

#- 35 UpdatePort
./ng net.accelbyte.sdk.cli.Main dsmc updatePort \
    --name 'veDq1HYg' \
    --namespace "$AB_NAMESPACE" \
    --body '{"name": "Pd6TRviS", "port": 74}' \
    > test.out 2>&1
eval_tap $? 35 'UpdatePort' test.out

#- 36 ListImages
./ng net.accelbyte.sdk.cli.Main dsmc listImages \
    --namespace "$AB_NAMESPACE" \
    --q '7GKUHFgq' \
    --sortBy 'version' \
    --sortDirection 'desc' \
    --count '26' \
    --offset '51' \
    > test.out 2>&1
eval_tap $? 36 'ListImages' test.out

#- 37 DeleteImage
./ng net.accelbyte.sdk.cli.Main dsmc deleteImage \
    --namespace "$AB_NAMESPACE" \
    --imageURI 'bZAjCr2p' \
    --version '5a3PXEiU' \
    > test.out 2>&1
eval_tap $? 37 'DeleteImage' test.out

#- 38 ExportImages
./ng net.accelbyte.sdk.cli.Main dsmc exportImages \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 38 'ExportImages' test.out

#- 39 GetImageLimit
./ng net.accelbyte.sdk.cli.Main dsmc getImageLimit \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 39 'GetImageLimit' test.out

#- 40 DeleteImagePatch
./ng net.accelbyte.sdk.cli.Main dsmc deleteImagePatch \
    --namespace "$AB_NAMESPACE" \
    --imageURI 'oNoxv1a2' \
    --version '4gVwelxl' \
    --versionPatch 'n2d0HIa2' \
    > test.out 2>&1
eval_tap $? 40 'DeleteImagePatch' test.out

#- 41 GetImageDetail
./ng net.accelbyte.sdk.cli.Main dsmc getImageDetail \
    --namespace "$AB_NAMESPACE" \
    --version 'QOaDUYfC' \
    > test.out 2>&1
eval_tap $? 41 'GetImageDetail' test.out

#- 42 GetImagePatches
./ng net.accelbyte.sdk.cli.Main dsmc getImagePatches \
    --namespace "$AB_NAMESPACE" \
    --version 'NAhuyv5t' \
    > test.out 2>&1
eval_tap $? 42 'GetImagePatches' test.out

#- 43 GetImagePatchDetail
./ng net.accelbyte.sdk.cli.Main dsmc getImagePatchDetail \
    --namespace "$AB_NAMESPACE" \
    --version '5TUck9Lz' \
    --versionPatch 'ZNRIZ2s1' \
    > test.out 2>&1
eval_tap $? 43 'GetImagePatchDetail' test.out

#- 44 GetRepository
./ng net.accelbyte.sdk.cli.Main dsmc getRepository \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 44 'GetRepository' test.out

#- 45 ListServer
./ng net.accelbyte.sdk.cli.Main dsmc listServer \
    --namespace "$AB_NAMESPACE" \
    --region 'ij0afNdU' \
    --count '0' \
    --offset '87' \
    > test.out 2>&1
eval_tap $? 45 'ListServer' test.out

#- 46 CountServer
./ng net.accelbyte.sdk.cli.Main dsmc countServer \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 46 'CountServer' test.out

#- 47 CountServerDetailed
./ng net.accelbyte.sdk.cli.Main dsmc countServerDetailed \
    --namespace "$AB_NAMESPACE" \
    --region 'S1oXlJIH' \
    > test.out 2>&1
eval_tap $? 47 'CountServerDetailed' test.out

#- 48 ListLocalServer
./ng net.accelbyte.sdk.cli.Main dsmc listLocalServer \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 48 'ListLocalServer' test.out

#- 49 DeleteLocalServer
./ng net.accelbyte.sdk.cli.Main dsmc deleteLocalServer \
    --name 'eWuPWB74' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 49 'DeleteLocalServer' test.out

#- 50 GetServer
./ng net.accelbyte.sdk.cli.Main dsmc getServer \
    --namespace "$AB_NAMESPACE" \
    --podName 'bxkkAeDA' \
    > test.out 2>&1
eval_tap $? 50 'GetServer' test.out

#- 51 DeleteServer
./ng net.accelbyte.sdk.cli.Main dsmc deleteServer \
    --namespace "$AB_NAMESPACE" \
    --podName 'XERnOHwX' \
    > test.out 2>&1
eval_tap $? 51 'DeleteServer' test.out

#- 52 ListSession
./ng net.accelbyte.sdk.cli.Main dsmc listSession \
    --namespace "$AB_NAMESPACE" \
    --region 'CQURNb3c' \
    --withServer  \
    --count '72' \
    --offset '71' \
    > test.out 2>&1
eval_tap $? 52 'ListSession' test.out

#- 53 CountSession
./ng net.accelbyte.sdk.cli.Main dsmc countSession \
    --namespace "$AB_NAMESPACE" \
    --region 'nA7gushO' \
    > test.out 2>&1
eval_tap $? 53 'CountSession' test.out

#- 54 DeleteSession
./ng net.accelbyte.sdk.cli.Main dsmc deleteSession \
    --namespace "$AB_NAMESPACE" \
    --sessionID 'GbJY81jr' \
    > test.out 2>&1
eval_tap $? 54 'DeleteSession' test.out

#- 55 CreateRepository
./ng net.accelbyte.sdk.cli.Main dsmc createRepository \
    --body '{"namespace": "oM46qCMH", "repository": "h4iQEr3J"}' \
    > test.out 2>&1
eval_tap $? 55 'CreateRepository' test.out

#- 56 ExportConfigV1
./ng net.accelbyte.sdk.cli.Main dsmc exportConfigV1 \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 56 'ExportConfigV1' test.out

#- 57 ImportConfigV1
./ng net.accelbyte.sdk.cli.Main dsmc importConfigV1 \
    --namespace "$AB_NAMESPACE" \
    --file 'tmp.dat' \
    > test.out 2>&1
eval_tap $? 57 'ImportConfigV1' test.out

#- 58 GetAllDeploymentClient
./ng net.accelbyte.sdk.cli.Main dsmc getAllDeploymentClient \
    --namespace "$AB_NAMESPACE" \
    --name 'nQZmC7HS' \
    --count '25' \
    --offset '0' \
    > test.out 2>&1
eval_tap $? 58 'GetAllDeploymentClient' test.out

#- 59 CreateDeploymentClient
./ng net.accelbyte.sdk.cli.Main dsmc createDeploymentClient \
    --deployment 'PnZWl8fj' \
    --namespace "$AB_NAMESPACE" \
    --body '{"allow_version_override": false, "buffer_count": 73, "buffer_percent": 73, "configuration": "ujyYtMhu", "enable_region_overrides": false, "extendable_session": false, "game_version": "hPOG726g", "max_count": 34, "min_count": 79, "overrides": {"p5ScZ2C5": {"buffer_count": 7, "buffer_percent": 18, "configuration": "DLGsYxtK", "enable_region_overrides": false, "extendable_session": true, "game_version": "vVqOYoLa", "max_count": 45, "min_count": 30, "name": "RF3UQ5TU", "region_overrides": {"eVLPA9Pz": {"buffer_count": 19, "buffer_percent": 59, "max_count": 2, "min_count": 28, "name": "SSiWgldR", "unlimited": false, "use_buffer_percent": true}, "BYWbZx8V": {"buffer_count": 4, "buffer_percent": 72, "max_count": 84, "min_count": 51, "name": "sky9lAR4", "unlimited": false, "use_buffer_percent": true}, "Pgyjntqc": {"buffer_count": 35, "buffer_percent": 43, "max_count": 54, "min_count": 95, "name": "KQBOB1tm", "unlimited": true, "use_buffer_percent": true}}, "regions": ["dkvpXYVW", "eN0foOFX", "MttRIN7y"], "session_timeout": 4, "unlimited": false, "use_buffer_percent": false}, "CIsPvB5Y": {"buffer_count": 31, "buffer_percent": 57, "configuration": "gS2vUXSK", "enable_region_overrides": true, "extendable_session": false, "game_version": "5m6BPzBW", "max_count": 77, "min_count": 13, "name": "c5LYaVBr", "region_overrides": {"w0Or6B3U": {"buffer_count": 73, "buffer_percent": 22, "max_count": 54, "min_count": 72, "name": "dheLQmAY", "unlimited": false, "use_buffer_percent": false}, "6saAvP5o": {"buffer_count": 24, "buffer_percent": 36, "max_count": 42, "min_count": 38, "name": "mBbaPIa4", "unlimited": false, "use_buffer_percent": true}, "h2lSfo3s": {"buffer_count": 37, "buffer_percent": 53, "max_count": 98, "min_count": 67, "name": "gEqm9b2H", "unlimited": true, "use_buffer_percent": true}}, "regions": ["BfRip6nx", "pbK81lRY", "3G1BQ6sG"], "session_timeout": 20, "unlimited": false, "use_buffer_percent": true}, "Mqrb9zFR": {"buffer_count": 83, "buffer_percent": 15, "configuration": "nJG0u8R0", "enable_region_overrides": true, "extendable_session": false, "game_version": "JSVsqbFP", "max_count": 12, "min_count": 16, "name": "iL5536Be", "region_overrides": {"nBCBhPsn": {"buffer_count": 71, "buffer_percent": 92, "max_count": 42, "min_count": 95, "name": "uvG1jmvF", "unlimited": true, "use_buffer_percent": true}, "WDlUV72g": {"buffer_count": 80, "buffer_percent": 58, "max_count": 58, "min_count": 14, "name": "nQtQJbVd", "unlimited": false, "use_buffer_percent": false}, "xPNYIHNp": {"buffer_count": 45, "buffer_percent": 73, "max_count": 1, "min_count": 30, "name": "iApVjcHS", "unlimited": false, "use_buffer_percent": true}}, "regions": ["tkWoRIdL", "rKRfOh4W", "I03i2RE4"], "session_timeout": 27, "unlimited": true, "use_buffer_percent": false}}, "region_overrides": {"SJ59JXFs": {"buffer_count": 80, "buffer_percent": 30, "max_count": 33, "min_count": 25, "name": "6EKLii6r", "unlimited": true, "use_buffer_percent": false}, "qM1iruS4": {"buffer_count": 48, "buffer_percent": 40, "max_count": 51, "min_count": 84, "name": "wG5Uh5qX", "unlimited": true, "use_buffer_percent": true}, "bx2SynVk": {"buffer_count": 4, "buffer_percent": 51, "max_count": 30, "min_count": 72, "name": "Nh7QiCsC", "unlimited": true, "use_buffer_percent": false}}, "regions": ["kebuVFM9", "UVC1Okzz", "eCJi5X3X"], "session_timeout": 7, "unlimited": true, "use_buffer_percent": true}' \
    > test.out 2>&1
eval_tap $? 59 'CreateDeploymentClient' test.out

#- 60 DeleteDeploymentClient
./ng net.accelbyte.sdk.cli.Main dsmc deleteDeploymentClient \
    --deployment 'UvbN87aL' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 60 'DeleteDeploymentClient' test.out

#- 61 GetAllPodConfigClient
./ng net.accelbyte.sdk.cli.Main dsmc getAllPodConfigClient \
    --namespace "$AB_NAMESPACE" \
    --count '29' \
    --offset '15' \
    > test.out 2>&1
eval_tap $? 61 'GetAllPodConfigClient' test.out

#- 62 CreatePodConfigClient
./ng net.accelbyte.sdk.cli.Main dsmc createPodConfigClient \
    --name '7hgkC0Ge' \
    --namespace "$AB_NAMESPACE" \
    --body '{"cpu_limit": 93, "mem_limit": 66, "params": "wBGWb36v"}' \
    > test.out 2>&1
eval_tap $? 62 'CreatePodConfigClient' test.out

#- 63 DeletePodConfigClient
./ng net.accelbyte.sdk.cli.Main dsmc deletePodConfigClient \
    --name '8ZWoq52p' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 63 'DeletePodConfigClient' test.out

#- 64 ListImagesClient
./ng net.accelbyte.sdk.cli.Main dsmc listImagesClient \
    --namespace "$AB_NAMESPACE" \
    --count '55' \
    --offset '87' \
    --q 'oHzlbNqr' \
    --sortBy 'version' \
    --sortDirection 'asc' \
    > test.out 2>&1
eval_tap $? 64 'ListImagesClient' test.out

#- 65 ImageLimitClient
./ng net.accelbyte.sdk.cli.Main dsmc imageLimitClient \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 65 'ImageLimitClient' test.out

#- 66 ImageDetailClient
./ng net.accelbyte.sdk.cli.Main dsmc imageDetailClient \
    --namespace "$AB_NAMESPACE" \
    --version 'wmxQyNlH' \
    > test.out 2>&1
eval_tap $? 66 'ImageDetailClient' test.out

#- 67 ListServerClient
./ng net.accelbyte.sdk.cli.Main dsmc listServerClient \
    --namespace "$AB_NAMESPACE" \
    --region 'TPKR6dYY' \
    --count '15' \
    --offset '78' \
    > test.out 2>&1
eval_tap $? 67 'ListServerClient' test.out

#- 68 ServerHeartbeat
./ng net.accelbyte.sdk.cli.Main dsmc serverHeartbeat \
    --namespace "$AB_NAMESPACE" \
    --body '{"podName": "qwQIcPDv"}' \
    > test.out 2>&1
eval_tap $? 68 'ServerHeartbeat' test.out

#- 69 DeregisterLocalServer
./ng net.accelbyte.sdk.cli.Main dsmc deregisterLocalServer \
    --namespace "$AB_NAMESPACE" \
    --body '{"name": "I1HBKu3R"}' \
    > test.out 2>&1
eval_tap $? 69 'DeregisterLocalServer' test.out

#- 70 RegisterLocalServer
./ng net.accelbyte.sdk.cli.Main dsmc registerLocalServer \
    --namespace "$AB_NAMESPACE" \
    --body '{"custom_attribute": "NlBC9YE9", "ip": "14ef5HiX", "name": "tOG7uLS3", "port": 12}' \
    > test.out 2>&1
eval_tap $? 70 'RegisterLocalServer' test.out

#- 71 RegisterServer
./ng net.accelbyte.sdk.cli.Main dsmc registerServer \
    --namespace "$AB_NAMESPACE" \
    --body '{"custom_attribute": "DQ2g47yZ", "pod_name": "0fJs1RCf"}' \
    > test.out 2>&1
eval_tap $? 71 'RegisterServer' test.out

#- 72 ShutdownServer
./ng net.accelbyte.sdk.cli.Main dsmc shutdownServer \
    --namespace "$AB_NAMESPACE" \
    --body '{"kill_me": false, "pod_name": "2Z0sUdKM"}' \
    > test.out 2>&1
eval_tap $? 72 'ShutdownServer' test.out

#- 73 GetServerSessionTimeout
./ng net.accelbyte.sdk.cli.Main dsmc getServerSessionTimeout \
    --namespace "$AB_NAMESPACE" \
    --podName 'E4Vd5buo' \
    > test.out 2>&1
eval_tap $? 73 'GetServerSessionTimeout' test.out

#- 74 GetServerSession
./ng net.accelbyte.sdk.cli.Main dsmc getServerSession \
    --namespace "$AB_NAMESPACE" \
    --podName 'zhXr3eRw' \
    > test.out 2>&1
eval_tap $? 74 'GetServerSession' test.out

#- 75 CreateSession
./ng net.accelbyte.sdk.cli.Main dsmc createSession \
    --namespace "$AB_NAMESPACE" \
    --body '{"client_version": "KjA1olNK", "configuration": "oq11fuhj", "deployment": "k9WnwDAP", "game_mode": "q0m1K7uN", "matching_allies": [{"matching_parties": [{"party_attributes": {"7czUxTqe": {}, "vKP3I5Fv": {}, "ZdCMGWFR": {}}, "party_id": "LI2UNgQR", "party_members": [{"user_id": "s9NulvXB"}, {"user_id": "lZjZLP8U"}, {"user_id": "zsiTFJgm"}]}, {"party_attributes": {"jsOhM2fA": {}, "ngClIDTU": {}, "5n4HVxue": {}}, "party_id": "4ra0deAE", "party_members": [{"user_id": "WsPVnBhD"}, {"user_id": "wdSqS9n6"}, {"user_id": "vLVV4py3"}]}, {"party_attributes": {"iQvG1Uje": {}, "oYDa4Fma": {}, "g51wTQ1Q": {}}, "party_id": "DWW6gPfG", "party_members": [{"user_id": "mNxSHwjo"}, {"user_id": "L5iI9KXN"}, {"user_id": "8Rr6zO88"}]}]}, {"matching_parties": [{"party_attributes": {"wvUWFttD": {}, "xcAHC6x0": {}, "WjWYD6ix": {}}, "party_id": "w5I4OjQM", "party_members": [{"user_id": "ym34JxwS"}, {"user_id": "dMVJC5Rd"}, {"user_id": "kRahhVO7"}]}, {"party_attributes": {"v1n3pZiD": {}, "iQcubyJ9": {}, "E630xjMO": {}}, "party_id": "tHBJ4Seb", "party_members": [{"user_id": "2ovkd92r"}, {"user_id": "9WStJzeJ"}, {"user_id": "QJeSTNL6"}]}, {"party_attributes": {"vsNqNmFd": {}, "ifmA1MN0": {}, "m6ob4bZV": {}}, "party_id": "AqByC21j", "party_members": [{"user_id": "v8qoY20e"}, {"user_id": "chMIUA2Y"}, {"user_id": "xaNF4t9O"}]}]}, {"matching_parties": [{"party_attributes": {"AoqTAywU": {}, "Sda4598N": {}, "r6wKrSFM": {}}, "party_id": "wCSxo92B", "party_members": [{"user_id": "ojYDojBJ"}, {"user_id": "2DZKnVEg"}, {"user_id": "UdQGqavl"}]}, {"party_attributes": {"f5fKfqWd": {}, "pIvMzlbX": {}, "JlRllqja": {}}, "party_id": "qEL99GQS", "party_members": [{"user_id": "MJDTTpFE"}, {"user_id": "LvWKQs4F"}, {"user_id": "5nHxjTbE"}]}, {"party_attributes": {"URi14sO6": {}, "OKDdb8Pn": {}, "KP9bJGR3": {}}, "party_id": "pLLlMjLI", "party_members": [{"user_id": "bbk0QprR"}, {"user_id": "0fxWRQ56"}, {"user_id": "uFcfXoGD"}]}]}], "namespace": "Q0YccYa4", "notification_payload": {}, "pod_name": "Pog4cRRy", "region": "KYRMVaRb", "session_id": "BpgJsDDN"}' \
    > test.out 2>&1
eval_tap $? 75 'CreateSession' test.out

#- 76 ClaimServer
./ng net.accelbyte.sdk.cli.Main dsmc claimServer \
    --namespace "$AB_NAMESPACE" \
    --body '{"session_id": "GGOjw3YV"}' \
    > test.out 2>&1
eval_tap $? 76 'ClaimServer' test.out

#- 77 GetSession
./ng net.accelbyte.sdk.cli.Main dsmc getSession \
    --namespace "$AB_NAMESPACE" \
    --sessionID 'R7Ct87C5' \
    > test.out 2>&1
eval_tap $? 77 'GetSession' test.out

#- 78 CancelSession
./ng net.accelbyte.sdk.cli.Main dsmc cancelSession \
    --namespace "$AB_NAMESPACE" \
    --sessionID '1D3v8Rpk' \
    > test.out 2>&1
eval_tap $? 78 'CancelSession' test.out

#- 79 GetDefaultProvider
./ng net.accelbyte.sdk.cli.Main dsmc getDefaultProvider \
    > test.out 2>&1
eval_tap $? 79 'GetDefaultProvider' test.out

#- 80 ListProviders
./ng net.accelbyte.sdk.cli.Main dsmc listProviders \
    > test.out 2>&1
eval_tap $? 80 'ListProviders' test.out

#- 81 ListProvidersByRegion
./ng net.accelbyte.sdk.cli.Main dsmc listProvidersByRegion \
    --region '2bHD5ESA' \
    > test.out 2>&1
eval_tap $? 81 'ListProvidersByRegion' test.out

#- 82 PublicGetMessages
./ng net.accelbyte.sdk.cli.Main dsmc publicGetMessages \
    > test.out 2>&1
eval_tap $? 82 'PublicGetMessages' test.out


rm -f "tmp.dat"

exit $EXIT_CODE