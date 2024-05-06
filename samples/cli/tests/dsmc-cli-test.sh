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
    --body '{"artifactPath": "fbCrW6Hz", "coreDumpEnabled": false, "image": "odkmaNfl", "imageReplicationsMap": {"RmOtPgCY": {"failure_code": "dQsLu8Yi", "region": "7T32BiAS", "status": "nGEJeRaR", "uri": "tosI5ztm"}, "GNRYUQfs": {"failure_code": "SDsKhoQP", "region": "7FbsomAG", "status": "s5k9GwJZ", "uri": "AUcVJ6MJ"}, "S2in96vd": {"failure_code": "H5GwIseH", "region": "WZjEXrAM", "status": "1VMzD5s4", "uri": "Tv5TCW0H"}}, "namespace": "GK8osSP3", "patchVersion": "6VJhjqXL", "persistent": false, "version": "oQoy1qRI"}' \
    > test.out 2>&1
eval_tap $? 4 'UpdateImage' test.out

#- 5 CreateImage
./ng net.accelbyte.sdk.cli.Main dsmc createImage \
    --body '{"artifactPath": "AU3s3OY1", "coreDumpEnabled": false, "dockerPath": "0ocgZbgZ", "image": "l0IWHXPw", "imageSize": 7, "namespace": "6j56BQ3k", "persistent": true, "ulimitFileSize": 86, "version": "Sl5YAeKX"}' \
    > test.out 2>&1
eval_tap $? 5 'CreateImage' test.out

#- 6 ImportImages
./ng net.accelbyte.sdk.cli.Main dsmc importImages \
    --file 'tmp.dat' \
    > test.out 2>&1
eval_tap $? 6 'ImportImages' test.out

#- 7 CreateImagePatch
./ng net.accelbyte.sdk.cli.Main dsmc createImagePatch \
    --body '{"artifactPath": "Ponw602z", "coreDumpEnabled": false, "dockerPath": "0bEYgTmO", "image": "pgMZnKsM", "imageSize": 38, "namespace": "BNJ8O2rN", "patchVersion": "qY0w1AES", "persistent": false, "ulimitFileSize": 20, "uploaderFlag": "wHyTGr27", "version": "nNRkWjQX"}' \
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
    --body '{"claim_timeout": 80, "creation_timeout": 1, "default_version": "h0YmGI7r", "port": 39, "ports": {"22JGlhBU": 2, "fOplNlZm": 9, "THO4mAa1": 18}, "protocol": "asxjpWV0", "providers": ["Qv1xgzsN", "ZDPcdW9o", "jN6kzZZn"], "session_timeout": 20, "unreachable_timeout": 83}' \
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
    --body '{"claim_timeout": 15, "creation_timeout": 97, "default_version": "gfnDdACw", "port": 88, "protocol": "v6GBKTkq", "providers": ["wcXdG9Sq", "SHIdif3j", "iUA4sXQs"], "session_timeout": 95, "unreachable_timeout": 67}' \
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
    --name '6VsZvFVp' \
    --count '78' \
    --offset '22' \
    > test.out 2>&1
eval_tap $? 14 'GetAllDeployment' test.out

#- 15 GetDeployment
./ng net.accelbyte.sdk.cli.Main dsmc getDeployment \
    --deployment 'AP3PMqAF' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 15 'GetDeployment' test.out

#- 16 CreateDeployment
./ng net.accelbyte.sdk.cli.Main dsmc createDeployment \
    --deployment 'Ja7MkbFA' \
    --namespace "$AB_NAMESPACE" \
    --body '{"allow_version_override": false, "buffer_count": 72, "buffer_percent": 98, "configuration": "q3p3AldI", "enable_region_overrides": false, "extendable_session": false, "game_version": "4FiUAuVi", "max_count": 87, "min_count": 26, "overrides": {"cEwe60OW": {"buffer_count": 75, "buffer_percent": 2, "configuration": "22WK6Hdm", "enable_region_overrides": false, "extendable_session": false, "game_version": "vKRxzu4l", "max_count": 35, "min_count": 35, "name": "UgvWTTIp", "region_overrides": {"YzLCh7ic": {"buffer_count": 6, "buffer_percent": 22, "max_count": 18, "min_count": 5, "name": "nasZvp4z", "unlimited": false, "use_buffer_percent": false}, "ny1iMIEj": {"buffer_count": 41, "buffer_percent": 90, "max_count": 50, "min_count": 24, "name": "3YDdSxN1", "unlimited": false, "use_buffer_percent": false}, "dPIyFAzn": {"buffer_count": 67, "buffer_percent": 20, "max_count": 53, "min_count": 37, "name": "LMPVhl70", "unlimited": false, "use_buffer_percent": true}}, "regions": ["DSv7i0iC", "8uiH0fvN", "7nFxRF61"], "session_timeout": 32, "unlimited": false, "use_buffer_percent": true}, "akZEgoda": {"buffer_count": 97, "buffer_percent": 73, "configuration": "b3kZFFMc", "enable_region_overrides": false, "extendable_session": true, "game_version": "dpbTBZTW", "max_count": 99, "min_count": 98, "name": "y3NFnsZn", "region_overrides": {"omAQuwTM": {"buffer_count": 8, "buffer_percent": 61, "max_count": 55, "min_count": 62, "name": "LLdRrGEX", "unlimited": false, "use_buffer_percent": false}, "hBOy7yZt": {"buffer_count": 60, "buffer_percent": 12, "max_count": 2, "min_count": 17, "name": "yHVipMMh", "unlimited": true, "use_buffer_percent": true}, "wcJ91P3q": {"buffer_count": 34, "buffer_percent": 24, "max_count": 95, "min_count": 48, "name": "AuZuYoKx", "unlimited": false, "use_buffer_percent": true}}, "regions": ["gdGKNs8H", "2RilszLr", "fzZVpgoa"], "session_timeout": 4, "unlimited": true, "use_buffer_percent": false}, "rigkc3Z1": {"buffer_count": 38, "buffer_percent": 22, "configuration": "tzcgW3uX", "enable_region_overrides": true, "extendable_session": true, "game_version": "hVIehlOL", "max_count": 91, "min_count": 4, "name": "vEewxLNM", "region_overrides": {"rNENyfOf": {"buffer_count": 6, "buffer_percent": 91, "max_count": 39, "min_count": 29, "name": "bTCwJzjU", "unlimited": true, "use_buffer_percent": true}, "PGRqKpTm": {"buffer_count": 56, "buffer_percent": 61, "max_count": 61, "min_count": 37, "name": "DEXj3sRa", "unlimited": false, "use_buffer_percent": false}, "5CVhwmVT": {"buffer_count": 6, "buffer_percent": 32, "max_count": 27, "min_count": 41, "name": "3PLC31V6", "unlimited": false, "use_buffer_percent": true}}, "regions": ["r0SbMIjt", "OcRe1a1i", "1bUprCJU"], "session_timeout": 72, "unlimited": false, "use_buffer_percent": false}}, "region_overrides": {"6VQqxF2W": {"buffer_count": 96, "buffer_percent": 7, "max_count": 9, "min_count": 45, "name": "y30pEPvP", "unlimited": false, "use_buffer_percent": false}, "A2yGmJgb": {"buffer_count": 76, "buffer_percent": 45, "max_count": 88, "min_count": 94, "name": "Lf5hC36K", "unlimited": false, "use_buffer_percent": false}, "9rVEuOuJ": {"buffer_count": 21, "buffer_percent": 1, "max_count": 26, "min_count": 50, "name": "ECaVkUHT", "unlimited": true, "use_buffer_percent": false}}, "regions": ["BvprA7VJ", "eNyyYQgY", "iMnsVqpi"], "session_timeout": 98, "unlimited": true, "use_buffer_percent": true}' \
    > test.out 2>&1
eval_tap $? 16 'CreateDeployment' test.out

#- 17 DeleteDeployment
./ng net.accelbyte.sdk.cli.Main dsmc deleteDeployment \
    --deployment 'sMskJfh1' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 17 'DeleteDeployment' test.out

#- 18 UpdateDeployment
./ng net.accelbyte.sdk.cli.Main dsmc updateDeployment \
    --deployment 'TgaQ0xCD' \
    --namespace "$AB_NAMESPACE" \
    --body '{"allow_version_override": false, "buffer_count": 93, "buffer_percent": 24, "configuration": "DGGFJyfY", "enable_region_overrides": false, "extendable_session": false, "game_version": "4PXElC0Q", "max_count": 36, "min_count": 45, "regions": ["FcN9ttOs", "dYn28dMy", "4q8ojyYN"], "session_timeout": 92, "unlimited": false, "use_buffer_percent": true}' \
    > test.out 2>&1
eval_tap $? 18 'UpdateDeployment' test.out

#- 19 CreateRootRegionOverride
./ng net.accelbyte.sdk.cli.Main dsmc createRootRegionOverride \
    --deployment 'quEQbAYw' \
    --namespace "$AB_NAMESPACE" \
    --region 'TKeruCz5' \
    --body '{"buffer_count": 3, "buffer_percent": 68, "max_count": 9, "min_count": 55, "unlimited": false, "use_buffer_percent": false}' \
    > test.out 2>&1
eval_tap $? 19 'CreateRootRegionOverride' test.out

#- 20 DeleteRootRegionOverride
./ng net.accelbyte.sdk.cli.Main dsmc deleteRootRegionOverride \
    --deployment 'H8OB5BBb' \
    --namespace "$AB_NAMESPACE" \
    --region 'zmmdRw91' \
    > test.out 2>&1
eval_tap $? 20 'DeleteRootRegionOverride' test.out

#- 21 UpdateRootRegionOverride
./ng net.accelbyte.sdk.cli.Main dsmc updateRootRegionOverride \
    --deployment '5nzfNZA3' \
    --namespace "$AB_NAMESPACE" \
    --region '6bw8Hgfi' \
    --body '{"buffer_count": 39, "buffer_percent": 57, "max_count": 7, "min_count": 41, "unlimited": true, "use_buffer_percent": false}' \
    > test.out 2>&1
eval_tap $? 21 'UpdateRootRegionOverride' test.out

#- 22 CreateDeploymentOverride
./ng net.accelbyte.sdk.cli.Main dsmc createDeploymentOverride \
    --deployment 'jxWG1CpS' \
    --namespace "$AB_NAMESPACE" \
    --version 'GcuRp5uR' \
    --body '{"buffer_count": 21, "buffer_percent": 69, "configuration": "2xHtX7ES", "enable_region_overrides": true, "extendable_session": false, "game_version": "VDk21WE0", "max_count": 85, "min_count": 82, "region_overrides": {"k5YAQi0h": {"buffer_count": 85, "buffer_percent": 19, "max_count": 12, "min_count": 10, "name": "53chnqI4", "unlimited": false, "use_buffer_percent": true}, "ELM4yf2L": {"buffer_count": 82, "buffer_percent": 91, "max_count": 61, "min_count": 16, "name": "Nl9L7oBb", "unlimited": true, "use_buffer_percent": false}, "THD1pROY": {"buffer_count": 41, "buffer_percent": 44, "max_count": 7, "min_count": 78, "name": "dsrVnK8W", "unlimited": false, "use_buffer_percent": true}}, "regions": ["5DVmhBkt", "vHfapZXf", "FD5KLjJI"], "session_timeout": 96, "unlimited": true, "use_buffer_percent": false}' \
    > test.out 2>&1
eval_tap $? 22 'CreateDeploymentOverride' test.out

#- 23 DeleteDeploymentOverride
./ng net.accelbyte.sdk.cli.Main dsmc deleteDeploymentOverride \
    --deployment 'iCEIWwfa' \
    --namespace "$AB_NAMESPACE" \
    --version 'NZdOdzqE' \
    > test.out 2>&1
eval_tap $? 23 'DeleteDeploymentOverride' test.out

#- 24 UpdateDeploymentOverride
./ng net.accelbyte.sdk.cli.Main dsmc updateDeploymentOverride \
    --deployment 'T0yX6IY7' \
    --namespace "$AB_NAMESPACE" \
    --version 'oAjqe2nB' \
    --body '{"buffer_count": 10, "buffer_percent": 94, "configuration": "GyHbCYtl", "enable_region_overrides": false, "game_version": "v31z2KOL", "max_count": 97, "min_count": 89, "regions": ["YpIF812B", "gHtirKrx", "cZs12Z0g"], "session_timeout": 27, "unlimited": false, "use_buffer_percent": true}' \
    > test.out 2>&1
eval_tap $? 24 'UpdateDeploymentOverride' test.out

#- 25 CreateOverrideRegionOverride
./ng net.accelbyte.sdk.cli.Main dsmc createOverrideRegionOverride \
    --deployment 'UuRkfUky' \
    --namespace "$AB_NAMESPACE" \
    --region 'tL7L6Ipy' \
    --version 'ztIT5VVq' \
    --body '{"buffer_count": 60, "buffer_percent": 59, "max_count": 18, "min_count": 43, "unlimited": false, "use_buffer_percent": true}' \
    > test.out 2>&1
eval_tap $? 25 'CreateOverrideRegionOverride' test.out

#- 26 DeleteOverrideRegionOverride
./ng net.accelbyte.sdk.cli.Main dsmc deleteOverrideRegionOverride \
    --deployment '2mSPcx9D' \
    --namespace "$AB_NAMESPACE" \
    --region 'yCXnIdZx' \
    --version 'ocykUI4M' \
    > test.out 2>&1
eval_tap $? 26 'DeleteOverrideRegionOverride' test.out

#- 27 UpdateOverrideRegionOverride
./ng net.accelbyte.sdk.cli.Main dsmc updateOverrideRegionOverride \
    --deployment 'JcJQZ8nz' \
    --namespace "$AB_NAMESPACE" \
    --region 'gFNdidRn' \
    --version 'Cy4D5Mbj' \
    --body '{"buffer_count": 53, "buffer_percent": 38, "max_count": 53, "min_count": 2, "unlimited": false, "use_buffer_percent": false}' \
    > test.out 2>&1
eval_tap $? 27 'UpdateOverrideRegionOverride' test.out

#- 28 GetAllPodConfig
./ng net.accelbyte.sdk.cli.Main dsmc getAllPodConfig \
    --namespace "$AB_NAMESPACE" \
    --count '0' \
    --offset '81' \
    > test.out 2>&1
eval_tap $? 28 'GetAllPodConfig' test.out

#- 29 GetPodConfig
./ng net.accelbyte.sdk.cli.Main dsmc getPodConfig \
    --name 'TAeOHP77' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 29 'GetPodConfig' test.out

#- 30 CreatePodConfig
./ng net.accelbyte.sdk.cli.Main dsmc createPodConfig \
    --name 'wh5n5YMb' \
    --namespace "$AB_NAMESPACE" \
    --body '{"cpu_limit": 64, "mem_limit": 93, "params": "6qtaSfLm"}' \
    > test.out 2>&1
eval_tap $? 30 'CreatePodConfig' test.out

#- 31 DeletePodConfig
./ng net.accelbyte.sdk.cli.Main dsmc deletePodConfig \
    --name 'D3J6NdRi' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 31 'DeletePodConfig' test.out

#- 32 UpdatePodConfig
./ng net.accelbyte.sdk.cli.Main dsmc updatePodConfig \
    --name 'KfyT9PM4' \
    --namespace "$AB_NAMESPACE" \
    --body '{"cpu_limit": 37, "mem_limit": 91, "name": "wJGosFrv", "params": "0LwsVwUE"}' \
    > test.out 2>&1
eval_tap $? 32 'UpdatePodConfig' test.out

#- 33 AddPort
./ng net.accelbyte.sdk.cli.Main dsmc addPort \
    --name '0xbhds4P' \
    --namespace "$AB_NAMESPACE" \
    --body '{"port": 32}' \
    > test.out 2>&1
eval_tap $? 33 'AddPort' test.out

#- 34 DeletePort
./ng net.accelbyte.sdk.cli.Main dsmc deletePort \
    --name 'TtANjEzO' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 34 'DeletePort' test.out

#- 35 UpdatePort
./ng net.accelbyte.sdk.cli.Main dsmc updatePort \
    --name 'ZbataXf4' \
    --namespace "$AB_NAMESPACE" \
    --body '{"name": "UieajfK3", "port": 62}' \
    > test.out 2>&1
eval_tap $? 35 'UpdatePort' test.out

#- 36 ListImages
./ng net.accelbyte.sdk.cli.Main dsmc listImages \
    --namespace "$AB_NAMESPACE" \
    --q 'xrRc0bh4' \
    --sortBy 'createdAt' \
    --sortDirection 'desc' \
    --count '96' \
    --offset '49' \
    > test.out 2>&1
eval_tap $? 36 'ListImages' test.out

#- 37 DeleteImage
./ng net.accelbyte.sdk.cli.Main dsmc deleteImage \
    --namespace "$AB_NAMESPACE" \
    --imageURI '6huKeQKO' \
    --version '8SJfEUif' \
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
    --imageURI 'MQj4wKBz' \
    --version 'vU5Rpw7n' \
    --versionPatch 'dGjryQM5' \
    > test.out 2>&1
eval_tap $? 40 'DeleteImagePatch' test.out

#- 41 GetImageDetail
./ng net.accelbyte.sdk.cli.Main dsmc getImageDetail \
    --namespace "$AB_NAMESPACE" \
    --version 'GMVqnJoG' \
    > test.out 2>&1
eval_tap $? 41 'GetImageDetail' test.out

#- 42 GetImagePatches
./ng net.accelbyte.sdk.cli.Main dsmc getImagePatches \
    --namespace "$AB_NAMESPACE" \
    --version 'nmIMq32n' \
    > test.out 2>&1
eval_tap $? 42 'GetImagePatches' test.out

#- 43 GetImagePatchDetail
./ng net.accelbyte.sdk.cli.Main dsmc getImagePatchDetail \
    --namespace "$AB_NAMESPACE" \
    --version '4jxdC730' \
    --versionPatch 'm4TLNU2s' \
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
    --region '5OrS1xG6' \
    --count '30' \
    --offset '10' \
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
    --region 'vSv48rf6' \
    > test.out 2>&1
eval_tap $? 47 'CountServerDetailed' test.out

#- 48 ListLocalServer
./ng net.accelbyte.sdk.cli.Main dsmc listLocalServer \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 48 'ListLocalServer' test.out

#- 49 DeleteLocalServer
./ng net.accelbyte.sdk.cli.Main dsmc deleteLocalServer \
    --name 'h493PHH6' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 49 'DeleteLocalServer' test.out

#- 50 GetServer
./ng net.accelbyte.sdk.cli.Main dsmc getServer \
    --namespace "$AB_NAMESPACE" \
    --podName 'qec8n7at' \
    > test.out 2>&1
eval_tap $? 50 'GetServer' test.out

#- 51 DeleteServer
./ng net.accelbyte.sdk.cli.Main dsmc deleteServer \
    --namespace "$AB_NAMESPACE" \
    --podName 'LOpYO4Xv' \
    > test.out 2>&1
eval_tap $? 51 'DeleteServer' test.out

#- 52 ListSession
./ng net.accelbyte.sdk.cli.Main dsmc listSession \
    --namespace "$AB_NAMESPACE" \
    --region 'IEbagET4' \
    --withServer  \
    --count '46' \
    --offset '92' \
    > test.out 2>&1
eval_tap $? 52 'ListSession' test.out

#- 53 CountSession
./ng net.accelbyte.sdk.cli.Main dsmc countSession \
    --namespace "$AB_NAMESPACE" \
    --region 'ej6fKKV8' \
    > test.out 2>&1
eval_tap $? 53 'CountSession' test.out

#- 54 DeleteSession
./ng net.accelbyte.sdk.cli.Main dsmc deleteSession \
    --namespace "$AB_NAMESPACE" \
    --sessionID 'lW9MX2pu' \
    > test.out 2>&1
eval_tap $? 54 'DeleteSession' test.out

#- 55 CreateRepository
./ng net.accelbyte.sdk.cli.Main dsmc createRepository \
    --body '{"namespace": "haalUxpl", "repository": "UrgTcFEV"}' \
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
    --name '5qqc2bcm' \
    --count '63' \
    --offset '48' \
    > test.out 2>&1
eval_tap $? 58 'GetAllDeploymentClient' test.out

#- 59 CreateDeploymentClient
./ng net.accelbyte.sdk.cli.Main dsmc createDeploymentClient \
    --deployment 'ae3Okx6Q' \
    --namespace "$AB_NAMESPACE" \
    --body '{"allow_version_override": false, "buffer_count": 87, "buffer_percent": 8, "configuration": "qDRNeCbg", "enable_region_overrides": true, "extendable_session": false, "game_version": "uIvyZsCN", "max_count": 33, "min_count": 40, "overrides": {"ntafdLkE": {"buffer_count": 21, "buffer_percent": 51, "configuration": "TwhIZ9Wp", "enable_region_overrides": true, "extendable_session": false, "game_version": "CRsOfAtt", "max_count": 80, "min_count": 24, "name": "kFg9CdJQ", "region_overrides": {"Krw395YW": {"buffer_count": 3, "buffer_percent": 43, "max_count": 39, "min_count": 64, "name": "h040K4BV", "unlimited": true, "use_buffer_percent": false}, "j3M0T9wS": {"buffer_count": 48, "buffer_percent": 0, "max_count": 34, "min_count": 80, "name": "sHuqJz62", "unlimited": false, "use_buffer_percent": true}, "eibU8Xjk": {"buffer_count": 30, "buffer_percent": 44, "max_count": 32, "min_count": 22, "name": "VLeHKo0N", "unlimited": true, "use_buffer_percent": false}}, "regions": ["GfcoIpLJ", "G08soav4", "ic78dPWd"], "session_timeout": 45, "unlimited": true, "use_buffer_percent": false}, "zgD3Qltq": {"buffer_count": 84, "buffer_percent": 27, "configuration": "sfLXrjNY", "enable_region_overrides": false, "extendable_session": false, "game_version": "cz8AjERt", "max_count": 2, "min_count": 18, "name": "ufnHc62t", "region_overrides": {"eGzrI89E": {"buffer_count": 88, "buffer_percent": 39, "max_count": 81, "min_count": 37, "name": "RTMdfJow", "unlimited": true, "use_buffer_percent": false}, "l6AnszYm": {"buffer_count": 29, "buffer_percent": 65, "max_count": 35, "min_count": 17, "name": "L5mojYpR", "unlimited": true, "use_buffer_percent": false}, "F2EmOyd6": {"buffer_count": 30, "buffer_percent": 96, "max_count": 9, "min_count": 97, "name": "NyRYf2Ce", "unlimited": false, "use_buffer_percent": false}}, "regions": ["yPclmPb3", "i1LNTzRx", "Oc3u0skU"], "session_timeout": 88, "unlimited": false, "use_buffer_percent": true}, "nCy1cxhd": {"buffer_count": 42, "buffer_percent": 29, "configuration": "ad5Qv5Bg", "enable_region_overrides": true, "extendable_session": true, "game_version": "8PFKJE1p", "max_count": 57, "min_count": 53, "name": "LaJUl910", "region_overrides": {"Shb2SWj9": {"buffer_count": 19, "buffer_percent": 93, "max_count": 19, "min_count": 13, "name": "efoaMyMn", "unlimited": false, "use_buffer_percent": false}, "t8yfSe9w": {"buffer_count": 20, "buffer_percent": 72, "max_count": 96, "min_count": 5, "name": "gql8HgM0", "unlimited": false, "use_buffer_percent": false}, "7r0sLx9q": {"buffer_count": 9, "buffer_percent": 72, "max_count": 52, "min_count": 95, "name": "jlyP8px6", "unlimited": true, "use_buffer_percent": true}}, "regions": ["rFFZqkNo", "Bwpwyo9w", "NsV25CDc"], "session_timeout": 44, "unlimited": true, "use_buffer_percent": true}}, "region_overrides": {"mHx5bFfz": {"buffer_count": 86, "buffer_percent": 94, "max_count": 34, "min_count": 16, "name": "da8enbCm", "unlimited": false, "use_buffer_percent": false}, "0ClT5dfl": {"buffer_count": 97, "buffer_percent": 29, "max_count": 60, "min_count": 100, "name": "ViXweMpb", "unlimited": false, "use_buffer_percent": false}, "oxsXMWLi": {"buffer_count": 52, "buffer_percent": 63, "max_count": 17, "min_count": 89, "name": "11UqBJU2", "unlimited": true, "use_buffer_percent": true}}, "regions": ["Ad4NwPqz", "eeMW3jWb", "51s8HY46"], "session_timeout": 46, "unlimited": false, "use_buffer_percent": false}' \
    > test.out 2>&1
eval_tap $? 59 'CreateDeploymentClient' test.out

#- 60 DeleteDeploymentClient
./ng net.accelbyte.sdk.cli.Main dsmc deleteDeploymentClient \
    --deployment 'MvNXYx1K' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 60 'DeleteDeploymentClient' test.out

#- 61 GetAllPodConfigClient
./ng net.accelbyte.sdk.cli.Main dsmc getAllPodConfigClient \
    --namespace "$AB_NAMESPACE" \
    --count '71' \
    --offset '57' \
    > test.out 2>&1
eval_tap $? 61 'GetAllPodConfigClient' test.out

#- 62 CreatePodConfigClient
./ng net.accelbyte.sdk.cli.Main dsmc createPodConfigClient \
    --name '66wfx4Nm' \
    --namespace "$AB_NAMESPACE" \
    --body '{"cpu_limit": 34, "mem_limit": 7, "params": "WGlDSry6"}' \
    > test.out 2>&1
eval_tap $? 62 'CreatePodConfigClient' test.out

#- 63 DeletePodConfigClient
./ng net.accelbyte.sdk.cli.Main dsmc deletePodConfigClient \
    --name 'Z0u90aJo' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 63 'DeletePodConfigClient' test.out

#- 64 ListImagesClient
./ng net.accelbyte.sdk.cli.Main dsmc listImagesClient \
    --namespace "$AB_NAMESPACE" \
    --count '22' \
    --offset '62' \
    --q '74U3R8yx' \
    --sortBy 'version' \
    --sortDirection 'desc' \
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
    --version 'S1mN1gzb' \
    > test.out 2>&1
eval_tap $? 66 'ImageDetailClient' test.out

#- 67 ListServerClient
./ng net.accelbyte.sdk.cli.Main dsmc listServerClient \
    --namespace "$AB_NAMESPACE" \
    --region '9KMBwtw1' \
    --count '84' \
    --offset '74' \
    > test.out 2>&1
eval_tap $? 67 'ListServerClient' test.out

#- 68 ServerHeartbeat
./ng net.accelbyte.sdk.cli.Main dsmc serverHeartbeat \
    --namespace "$AB_NAMESPACE" \
    --body '{"podName": "VU1F9xim"}' \
    > test.out 2>&1
eval_tap $? 68 'ServerHeartbeat' test.out

#- 69 DeregisterLocalServer
./ng net.accelbyte.sdk.cli.Main dsmc deregisterLocalServer \
    --namespace "$AB_NAMESPACE" \
    --body '{"name": "ttzGfO5D"}' \
    > test.out 2>&1
eval_tap $? 69 'DeregisterLocalServer' test.out

#- 70 RegisterLocalServer
./ng net.accelbyte.sdk.cli.Main dsmc registerLocalServer \
    --namespace "$AB_NAMESPACE" \
    --body '{"custom_attribute": "bhsrXSwg", "ip": "9zuLifMq", "name": "uL82mMe2", "port": 69}' \
    > test.out 2>&1
eval_tap $? 70 'RegisterLocalServer' test.out

#- 71 RegisterServer
./ng net.accelbyte.sdk.cli.Main dsmc registerServer \
    --namespace "$AB_NAMESPACE" \
    --body '{"custom_attribute": "LRauhJvV", "pod_name": "a1seaPRg"}' \
    > test.out 2>&1
eval_tap $? 71 'RegisterServer' test.out

#- 72 ShutdownServer
./ng net.accelbyte.sdk.cli.Main dsmc shutdownServer \
    --namespace "$AB_NAMESPACE" \
    --body '{"kill_me": false, "pod_name": "cjOVOk8W"}' \
    > test.out 2>&1
eval_tap $? 72 'ShutdownServer' test.out

#- 73 GetServerSessionTimeout
./ng net.accelbyte.sdk.cli.Main dsmc getServerSessionTimeout \
    --namespace "$AB_NAMESPACE" \
    --podName 'Od5XHa0H' \
    > test.out 2>&1
eval_tap $? 73 'GetServerSessionTimeout' test.out

#- 74 GetServerSession
./ng net.accelbyte.sdk.cli.Main dsmc getServerSession \
    --namespace "$AB_NAMESPACE" \
    --podName 'PTTD3uws' \
    > test.out 2>&1
eval_tap $? 74 'GetServerSession' test.out

#- 75 CreateSession
./ng net.accelbyte.sdk.cli.Main dsmc createSession \
    --namespace "$AB_NAMESPACE" \
    --body '{"client_version": "q8ObK8G8", "configuration": "LMoiAWEi", "deployment": "1jgFhnc8", "game_mode": "LUfJpAFI", "matching_allies": [{"matching_parties": [{"party_attributes": {"oAbzgYNP": {}, "XRJ3ArwC": {}, "pQ9hQdR9": {}}, "party_id": "QI9yC6NI", "party_members": [{"user_id": "Vpaj0tYX"}, {"user_id": "oxz06CdQ"}, {"user_id": "vQd1ilMY"}]}, {"party_attributes": {"6a3ehJId": {}, "gLK8cFKx": {}, "rpHr6I6A": {}}, "party_id": "35rITAdj", "party_members": [{"user_id": "wjbmsqEK"}, {"user_id": "MMkEL0sG"}, {"user_id": "euxKd8nM"}]}, {"party_attributes": {"CPXSH9aD": {}, "DdtNAL5B": {}, "XJ9KT9Ga": {}}, "party_id": "uki9EA9t", "party_members": [{"user_id": "EvyYIxAK"}, {"user_id": "iA0FY855"}, {"user_id": "8EM8FwC1"}]}]}, {"matching_parties": [{"party_attributes": {"3ltZ3PY8": {}, "NFOfyXtU": {}, "vHECcYpv": {}}, "party_id": "Lv2ZJjZX", "party_members": [{"user_id": "qJzFutll"}, {"user_id": "qeyaRaS3"}, {"user_id": "c94LZMT0"}]}, {"party_attributes": {"dpVMC7ZP": {}, "XENIyg1f": {}, "iI2DgKd3": {}}, "party_id": "9Vsz6beD", "party_members": [{"user_id": "OnOETj6C"}, {"user_id": "kzJ4p8Cq"}, {"user_id": "NdzsPzWN"}]}, {"party_attributes": {"KtvUyneB": {}, "HgGeG2yT": {}, "jLrktDSm": {}}, "party_id": "UkU3zQfL", "party_members": [{"user_id": "xL18oSMd"}, {"user_id": "JISBzmTx"}, {"user_id": "Nksriliy"}]}]}, {"matching_parties": [{"party_attributes": {"N6YpNmVC": {}, "wzoazHf4": {}, "ShgWuzHr": {}}, "party_id": "4HsHkZAe", "party_members": [{"user_id": "Fer4ed92"}, {"user_id": "7QVa6EkF"}, {"user_id": "2HOjeNpM"}]}, {"party_attributes": {"Q2RQUge4": {}, "7Ib4fVLz": {}, "8YJxcIF9": {}}, "party_id": "SwEH8s0G", "party_members": [{"user_id": "FDcyN4S2"}, {"user_id": "ztefRa6d"}, {"user_id": "IgWNJoVB"}]}, {"party_attributes": {"LDkw6tPl": {}, "AqmkZ6RG": {}, "TsYTBB5o": {}}, "party_id": "8uH7DmsC", "party_members": [{"user_id": "hF50WD8Q"}, {"user_id": "EtspMadE"}, {"user_id": "2ZxMKO49"}]}]}], "namespace": "STl8mTfx", "notification_payload": {}, "pod_name": "zrKBZOaF", "region": "emx4IRPj", "session_id": "Mgy9Lo1K"}' \
    > test.out 2>&1
eval_tap $? 75 'CreateSession' test.out

#- 76 ClaimServer
./ng net.accelbyte.sdk.cli.Main dsmc claimServer \
    --namespace "$AB_NAMESPACE" \
    --body '{"session_id": "72BefSOn"}' \
    > test.out 2>&1
eval_tap $? 76 'ClaimServer' test.out

#- 77 GetSession
./ng net.accelbyte.sdk.cli.Main dsmc getSession \
    --namespace "$AB_NAMESPACE" \
    --sessionID 'Pc302f35' \
    > test.out 2>&1
eval_tap $? 77 'GetSession' test.out

#- 78 CancelSession
./ng net.accelbyte.sdk.cli.Main dsmc cancelSession \
    --namespace "$AB_NAMESPACE" \
    --sessionID 'wjCvVsOI' \
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
    --region 'KTDLUHGE' \
    > test.out 2>&1
eval_tap $? 81 'ListProvidersByRegion' test.out

#- 82 PublicGetMessages
./ng net.accelbyte.sdk.cli.Main dsmc publicGetMessages \
    > test.out 2>&1
eval_tap $? 82 'PublicGetMessages' test.out


rm -f "tmp.dat"

exit $EXIT_CODE