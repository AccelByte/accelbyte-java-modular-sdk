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
    --body '{"artifactPath": "2K8tMUNb", "coreDumpEnabled": true, "image": "gHVc0hSp", "imageReplicationsMap": {"FiDU5nsM": {"failure_code": "0T9QRvnI", "region": "MLL6Cxbg", "status": "tonjFePg", "uri": "93IvVa2M"}, "VjBA6lg3": {"failure_code": "ycm5ujhk", "region": "k8iGhNg5", "status": "0BcyRGZS", "uri": "AbEknHUu"}, "IkHR04TL": {"failure_code": "RmgONHqW", "region": "lZAqTUwj", "status": "F179Udsu", "uri": "DCaeYqRw"}}, "namespace": "kZC0ZCbF", "patchVersion": "J2gfrKox", "persistent": false, "version": "TzJnIPb4"}' \
    > test.out 2>&1
eval_tap $? 4 'UpdateImage' test.out

#- 5 CreateImage
./ng net.accelbyte.sdk.cli.Main dsmc createImage \
    --body '{"artifactPath": "EfFPB9Oq", "coreDumpEnabled": true, "dockerPath": "F6UItJlI", "image": "Q7vvuaax", "imageSize": 56, "namespace": "ahrDRLby", "persistent": true, "ulimitFileSize": 8, "version": "EHdImLEe"}' \
    > test.out 2>&1
eval_tap $? 5 'CreateImage' test.out

#- 6 ImportImages
./ng net.accelbyte.sdk.cli.Main dsmc importImages \
    --file 'tmp.dat' \
    > test.out 2>&1
eval_tap $? 6 'ImportImages' test.out

#- 7 CreateImagePatch
./ng net.accelbyte.sdk.cli.Main dsmc createImagePatch \
    --body '{"artifactPath": "DyCKLRJh", "coreDumpEnabled": true, "dockerPath": "2NwB9yfB", "image": "hp3MXKqK", "imageSize": 17, "namespace": "82J8aDBP", "patchVersion": "JPxT6p1Y", "persistent": true, "ulimitFileSize": 75, "uploaderFlag": "4cNpygQO", "version": "ljGFI0Gs"}' \
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
    --body '{"claim_timeout": 67, "creation_timeout": 68, "default_version": "e3y91nE1", "port": 3, "ports": {"TGj30v2Z": 54, "PmClrNu3": 65, "ihmg5SqV": 92}, "protocol": "xhvRatxd", "providers": ["SJoneO1T", "Ld9UeZQd", "dN3Kl4HF"], "session_timeout": 10, "unreachable_timeout": 58}' \
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
    --body '{"claim_timeout": 4, "creation_timeout": 46, "default_version": "0IA4Bsmb", "port": 41, "protocol": "uE39xlfi", "providers": ["7GeoMAIJ", "YzXdOr21", "4Wc3yUYL"], "session_timeout": 23, "unreachable_timeout": 64}' \
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
    --name 'LdezMYq1' \
    --count '52' \
    --offset '20' \
    > test.out 2>&1
eval_tap $? 14 'GetAllDeployment' test.out

#- 15 GetDeployment
./ng net.accelbyte.sdk.cli.Main dsmc getDeployment \
    --deployment 'FC73Ys61' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 15 'GetDeployment' test.out

#- 16 CreateDeployment
./ng net.accelbyte.sdk.cli.Main dsmc createDeployment \
    --deployment 'yxTMpdJk' \
    --namespace "$AB_NAMESPACE" \
    --body '{"allow_version_override": false, "buffer_count": 65, "buffer_percent": 96, "configuration": "YHvhcOwz", "enable_region_overrides": false, "extendable_session": true, "game_version": "0Lz7nppN", "max_count": 75, "min_count": 91, "overrides": {"mVzi5WRY": {"buffer_count": 32, "buffer_percent": 59, "configuration": "q9QxiZoT", "enable_region_overrides": true, "extendable_session": false, "game_version": "IGd76iAb", "max_count": 59, "min_count": 46, "name": "3wCARTK0", "region_overrides": {"TVKzMGhs": {"buffer_count": 94, "buffer_percent": 42, "max_count": 54, "min_count": 74, "name": "ZxjfU65f", "unlimited": false, "use_buffer_percent": true}, "jaysy2aE": {"buffer_count": 2, "buffer_percent": 88, "max_count": 88, "min_count": 55, "name": "2uuRH83i", "unlimited": true, "use_buffer_percent": false}, "0ZcUmQB2": {"buffer_count": 14, "buffer_percent": 84, "max_count": 5, "min_count": 6, "name": "Bxpo75q2", "unlimited": true, "use_buffer_percent": true}}, "regions": ["3t1FDPdj", "rZcalmkt", "0JVs8hSM"], "session_timeout": 16, "unlimited": true, "use_buffer_percent": false}, "o2wITYom": {"buffer_count": 62, "buffer_percent": 48, "configuration": "BrgC4FrN", "enable_region_overrides": true, "extendable_session": false, "game_version": "SYcMnUXY", "max_count": 95, "min_count": 4, "name": "hVWS73T8", "region_overrides": {"o1xVDTTL": {"buffer_count": 60, "buffer_percent": 93, "max_count": 58, "min_count": 23, "name": "TKBGkRcf", "unlimited": true, "use_buffer_percent": true}, "f4nbrh3H": {"buffer_count": 93, "buffer_percent": 84, "max_count": 4, "min_count": 30, "name": "oai9hGk2", "unlimited": false, "use_buffer_percent": true}, "Ma5maM8g": {"buffer_count": 14, "buffer_percent": 99, "max_count": 90, "min_count": 6, "name": "iIWpDlP9", "unlimited": false, "use_buffer_percent": true}}, "regions": ["WUSkb5yR", "z6dSObAg", "aGEPQZJZ"], "session_timeout": 2, "unlimited": true, "use_buffer_percent": false}, "mXMDRFN6": {"buffer_count": 62, "buffer_percent": 37, "configuration": "Lkb6gLcG", "enable_region_overrides": false, "extendable_session": false, "game_version": "njE9ERpD", "max_count": 0, "min_count": 0, "name": "eLLiXmKt", "region_overrides": {"hPDEK6GX": {"buffer_count": 90, "buffer_percent": 69, "max_count": 92, "min_count": 30, "name": "nNm00vfe", "unlimited": false, "use_buffer_percent": false}, "kXMAbbjV": {"buffer_count": 54, "buffer_percent": 34, "max_count": 79, "min_count": 57, "name": "0QjYFYnr", "unlimited": false, "use_buffer_percent": false}, "w0qng5op": {"buffer_count": 19, "buffer_percent": 23, "max_count": 2, "min_count": 17, "name": "VkCk0SUd", "unlimited": false, "use_buffer_percent": true}}, "regions": ["8diENSTc", "8dtvPeKg", "RghrO0QJ"], "session_timeout": 63, "unlimited": true, "use_buffer_percent": false}}, "region_overrides": {"eAA0pCjb": {"buffer_count": 4, "buffer_percent": 20, "max_count": 2, "min_count": 9, "name": "kWPQKnAF", "unlimited": true, "use_buffer_percent": true}, "zPew84vX": {"buffer_count": 42, "buffer_percent": 87, "max_count": 98, "min_count": 25, "name": "gZHkz61t", "unlimited": false, "use_buffer_percent": false}, "naAlqIp0": {"buffer_count": 86, "buffer_percent": 49, "max_count": 9, "min_count": 65, "name": "0s2DeOAu", "unlimited": false, "use_buffer_percent": true}}, "regions": ["wXjDwcoO", "YXi5DVhd", "g4FcpcRP"], "session_timeout": 54, "unlimited": false, "use_buffer_percent": true}' \
    > test.out 2>&1
eval_tap $? 16 'CreateDeployment' test.out

#- 17 DeleteDeployment
./ng net.accelbyte.sdk.cli.Main dsmc deleteDeployment \
    --deployment 'H9mhtLuD' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 17 'DeleteDeployment' test.out

#- 18 UpdateDeployment
./ng net.accelbyte.sdk.cli.Main dsmc updateDeployment \
    --deployment 'UVckbMgJ' \
    --namespace "$AB_NAMESPACE" \
    --body '{"allow_version_override": true, "buffer_count": 46, "buffer_percent": 62, "configuration": "I1aNjS5t", "enable_region_overrides": false, "extendable_session": false, "game_version": "G2Y9IUIL", "max_count": 67, "min_count": 9, "regions": ["XU0uYzGE", "uUfj01Nr", "rcpoQgXR"], "session_timeout": 7, "unlimited": true, "use_buffer_percent": false}' \
    > test.out 2>&1
eval_tap $? 18 'UpdateDeployment' test.out

#- 19 CreateRootRegionOverride
./ng net.accelbyte.sdk.cli.Main dsmc createRootRegionOverride \
    --deployment 'tDUP7rb7' \
    --namespace "$AB_NAMESPACE" \
    --region '3UTRmwwU' \
    --body '{"buffer_count": 58, "buffer_percent": 42, "max_count": 59, "min_count": 98, "unlimited": false, "use_buffer_percent": false}' \
    > test.out 2>&1
eval_tap $? 19 'CreateRootRegionOverride' test.out

#- 20 DeleteRootRegionOverride
./ng net.accelbyte.sdk.cli.Main dsmc deleteRootRegionOverride \
    --deployment '57tLlRVe' \
    --namespace "$AB_NAMESPACE" \
    --region 'qJvsB2Vw' \
    > test.out 2>&1
eval_tap $? 20 'DeleteRootRegionOverride' test.out

#- 21 UpdateRootRegionOverride
./ng net.accelbyte.sdk.cli.Main dsmc updateRootRegionOverride \
    --deployment 'AXtFFfGb' \
    --namespace "$AB_NAMESPACE" \
    --region 'YcqgUUE4' \
    --body '{"buffer_count": 11, "buffer_percent": 70, "max_count": 74, "min_count": 67, "unlimited": false, "use_buffer_percent": true}' \
    > test.out 2>&1
eval_tap $? 21 'UpdateRootRegionOverride' test.out

#- 22 CreateDeploymentOverride
./ng net.accelbyte.sdk.cli.Main dsmc createDeploymentOverride \
    --deployment 'fSfl1hH4' \
    --namespace "$AB_NAMESPACE" \
    --version 'ClhDgMYl' \
    --body '{"buffer_count": 69, "buffer_percent": 83, "configuration": "wq9Xx0iz", "enable_region_overrides": true, "extendable_session": false, "game_version": "sj8ENm5r", "max_count": 69, "min_count": 63, "region_overrides": {"bZPRz8ur": {"buffer_count": 89, "buffer_percent": 88, "max_count": 50, "min_count": 20, "name": "qqrH0PnG", "unlimited": false, "use_buffer_percent": true}, "0sNxETvo": {"buffer_count": 29, "buffer_percent": 26, "max_count": 28, "min_count": 99, "name": "pQ7Fk1uJ", "unlimited": false, "use_buffer_percent": true}, "ld1Jvjyb": {"buffer_count": 75, "buffer_percent": 54, "max_count": 21, "min_count": 52, "name": "W2qA7cYC", "unlimited": false, "use_buffer_percent": true}}, "regions": ["dR8ETeKq", "OiiWH3xa", "4cugFvgy"], "session_timeout": 29, "unlimited": true, "use_buffer_percent": false}' \
    > test.out 2>&1
eval_tap $? 22 'CreateDeploymentOverride' test.out

#- 23 DeleteDeploymentOverride
./ng net.accelbyte.sdk.cli.Main dsmc deleteDeploymentOverride \
    --deployment 'FP0Xohjc' \
    --namespace "$AB_NAMESPACE" \
    --version 'HqaWIIuw' \
    > test.out 2>&1
eval_tap $? 23 'DeleteDeploymentOverride' test.out

#- 24 UpdateDeploymentOverride
./ng net.accelbyte.sdk.cli.Main dsmc updateDeploymentOverride \
    --deployment 'xIw7Qdgu' \
    --namespace "$AB_NAMESPACE" \
    --version '6LYvWWO1' \
    --body '{"buffer_count": 56, "buffer_percent": 1, "configuration": "lZqksQfq", "enable_region_overrides": true, "game_version": "mVbK8MTW", "max_count": 15, "min_count": 85, "regions": ["PPlb9tYi", "9nSVlwYm", "PMVze0bN"], "session_timeout": 67, "unlimited": false, "use_buffer_percent": true}' \
    > test.out 2>&1
eval_tap $? 24 'UpdateDeploymentOverride' test.out

#- 25 CreateOverrideRegionOverride
./ng net.accelbyte.sdk.cli.Main dsmc createOverrideRegionOverride \
    --deployment 'pch4Y9fy' \
    --namespace "$AB_NAMESPACE" \
    --region 'fKcPXVIB' \
    --version '1ZH6tqcI' \
    --body '{"buffer_count": 47, "buffer_percent": 35, "max_count": 24, "min_count": 89, "unlimited": false, "use_buffer_percent": false}' \
    > test.out 2>&1
eval_tap $? 25 'CreateOverrideRegionOverride' test.out

#- 26 DeleteOverrideRegionOverride
./ng net.accelbyte.sdk.cli.Main dsmc deleteOverrideRegionOverride \
    --deployment 'uXfkDhZw' \
    --namespace "$AB_NAMESPACE" \
    --region 'XSmVVoTq' \
    --version 'hf6CASOJ' \
    > test.out 2>&1
eval_tap $? 26 'DeleteOverrideRegionOverride' test.out

#- 27 UpdateOverrideRegionOverride
./ng net.accelbyte.sdk.cli.Main dsmc updateOverrideRegionOverride \
    --deployment 'l34cUZiV' \
    --namespace "$AB_NAMESPACE" \
    --region 'QcvYYsR3' \
    --version 'poDXAYEw' \
    --body '{"buffer_count": 18, "buffer_percent": 61, "max_count": 12, "min_count": 94, "unlimited": false, "use_buffer_percent": false}' \
    > test.out 2>&1
eval_tap $? 27 'UpdateOverrideRegionOverride' test.out

#- 28 GetAllPodConfig
./ng net.accelbyte.sdk.cli.Main dsmc getAllPodConfig \
    --namespace "$AB_NAMESPACE" \
    --count '51' \
    --offset '4' \
    > test.out 2>&1
eval_tap $? 28 'GetAllPodConfig' test.out

#- 29 GetPodConfig
./ng net.accelbyte.sdk.cli.Main dsmc getPodConfig \
    --name 'Mzgj6vz1' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 29 'GetPodConfig' test.out

#- 30 CreatePodConfig
./ng net.accelbyte.sdk.cli.Main dsmc createPodConfig \
    --name 'M7IBe4s9' \
    --namespace "$AB_NAMESPACE" \
    --body '{"cpu_limit": 76, "mem_limit": 35, "params": "4hWKdU24"}' \
    > test.out 2>&1
eval_tap $? 30 'CreatePodConfig' test.out

#- 31 DeletePodConfig
./ng net.accelbyte.sdk.cli.Main dsmc deletePodConfig \
    --name 'wijkDxDp' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 31 'DeletePodConfig' test.out

#- 32 UpdatePodConfig
./ng net.accelbyte.sdk.cli.Main dsmc updatePodConfig \
    --name 'BSqMuWDt' \
    --namespace "$AB_NAMESPACE" \
    --body '{"cpu_limit": 0, "mem_limit": 16, "name": "DTFzcvXQ", "params": "wmKcW5mo"}' \
    > test.out 2>&1
eval_tap $? 32 'UpdatePodConfig' test.out

#- 33 AddPort
./ng net.accelbyte.sdk.cli.Main dsmc addPort \
    --name 'LLV49hsX' \
    --namespace "$AB_NAMESPACE" \
    --body '{"port": 2}' \
    > test.out 2>&1
eval_tap $? 33 'AddPort' test.out

#- 34 DeletePort
./ng net.accelbyte.sdk.cli.Main dsmc deletePort \
    --name 'qV9aLTWz' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 34 'DeletePort' test.out

#- 35 UpdatePort
./ng net.accelbyte.sdk.cli.Main dsmc updatePort \
    --name 'uwHlJmJP' \
    --namespace "$AB_NAMESPACE" \
    --body '{"name": "tx90PIBF", "port": 76}' \
    > test.out 2>&1
eval_tap $? 35 'UpdatePort' test.out

#- 36 ListImages
./ng net.accelbyte.sdk.cli.Main dsmc listImages \
    --namespace "$AB_NAMESPACE" \
    --q 'Gg77hBz5' \
    --sortBy 'createdAt' \
    --sortDirection 'asc' \
    --count '75' \
    --offset '31' \
    > test.out 2>&1
eval_tap $? 36 'ListImages' test.out

#- 37 DeleteImage
./ng net.accelbyte.sdk.cli.Main dsmc deleteImage \
    --namespace "$AB_NAMESPACE" \
    --imageURI 'TAWVSokX' \
    --version '4qpWJhrx' \
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
    --imageURI 'EY5Ee41e' \
    --version 'mvOBZciw' \
    --versionPatch 'vavK1B86' \
    > test.out 2>&1
eval_tap $? 40 'DeleteImagePatch' test.out

#- 41 GetImageDetail
./ng net.accelbyte.sdk.cli.Main dsmc getImageDetail \
    --namespace "$AB_NAMESPACE" \
    --version 'eOWdrtEA' \
    > test.out 2>&1
eval_tap $? 41 'GetImageDetail' test.out

#- 42 GetImagePatches
./ng net.accelbyte.sdk.cli.Main dsmc getImagePatches \
    --namespace "$AB_NAMESPACE" \
    --version 'NClhLaO1' \
    > test.out 2>&1
eval_tap $? 42 'GetImagePatches' test.out

#- 43 GetImagePatchDetail
./ng net.accelbyte.sdk.cli.Main dsmc getImagePatchDetail \
    --namespace "$AB_NAMESPACE" \
    --version '2WokQPux' \
    --versionPatch 'c8wMEF37' \
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
    --region 'R1zVDCeR' \
    --count '89' \
    --offset '50' \
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
    --region 'ArCMXCJn' \
    > test.out 2>&1
eval_tap $? 47 'CountServerDetailed' test.out

#- 48 ListLocalServer
./ng net.accelbyte.sdk.cli.Main dsmc listLocalServer \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 48 'ListLocalServer' test.out

#- 49 DeleteLocalServer
./ng net.accelbyte.sdk.cli.Main dsmc deleteLocalServer \
    --name 'Nowr4HWS' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 49 'DeleteLocalServer' test.out

#- 50 GetServer
./ng net.accelbyte.sdk.cli.Main dsmc getServer \
    --namespace "$AB_NAMESPACE" \
    --podName 'B9EdHOF2' \
    > test.out 2>&1
eval_tap $? 50 'GetServer' test.out

#- 51 DeleteServer
./ng net.accelbyte.sdk.cli.Main dsmc deleteServer \
    --namespace "$AB_NAMESPACE" \
    --podName 'k5UIQ28P' \
    > test.out 2>&1
eval_tap $? 51 'DeleteServer' test.out

#- 52 ListSession
./ng net.accelbyte.sdk.cli.Main dsmc listSession \
    --namespace "$AB_NAMESPACE" \
    --region 'x7G2trpQ' \
    --withServer  \
    --count '48' \
    --offset '40' \
    > test.out 2>&1
eval_tap $? 52 'ListSession' test.out

#- 53 CountSession
./ng net.accelbyte.sdk.cli.Main dsmc countSession \
    --namespace "$AB_NAMESPACE" \
    --region 'rsAYEe4S' \
    > test.out 2>&1
eval_tap $? 53 'CountSession' test.out

#- 54 DeleteSession
./ng net.accelbyte.sdk.cli.Main dsmc deleteSession \
    --namespace "$AB_NAMESPACE" \
    --sessionID 'Zcdodpy6' \
    > test.out 2>&1
eval_tap $? 54 'DeleteSession' test.out

#- 55 CreateRepository
./ng net.accelbyte.sdk.cli.Main dsmc createRepository \
    --body '{"namespace": "K8tt0hRr", "repository": "ijZzGrLa"}' \
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
    --name 'DE4Z69yO' \
    --count '54' \
    --offset '4' \
    > test.out 2>&1
eval_tap $? 58 'GetAllDeploymentClient' test.out

#- 59 CreateDeploymentClient
./ng net.accelbyte.sdk.cli.Main dsmc createDeploymentClient \
    --deployment 'rEEx7dNh' \
    --namespace "$AB_NAMESPACE" \
    --body '{"allow_version_override": false, "buffer_count": 90, "buffer_percent": 33, "configuration": "4hRRTAJa", "enable_region_overrides": true, "extendable_session": true, "game_version": "jTu7U2HG", "max_count": 75, "min_count": 78, "overrides": {"vMyMbrV0": {"buffer_count": 51, "buffer_percent": 82, "configuration": "uDiADZjB", "enable_region_overrides": true, "extendable_session": true, "game_version": "YMvbmPUn", "max_count": 81, "min_count": 40, "name": "SLSkgUyg", "region_overrides": {"luqb23Tr": {"buffer_count": 87, "buffer_percent": 90, "max_count": 45, "min_count": 45, "name": "iVEf7pEq", "unlimited": false, "use_buffer_percent": true}, "xPS9CQed": {"buffer_count": 15, "buffer_percent": 4, "max_count": 53, "min_count": 8, "name": "ANYJGp6Q", "unlimited": false, "use_buffer_percent": false}, "scpH1rYK": {"buffer_count": 28, "buffer_percent": 13, "max_count": 25, "min_count": 12, "name": "xBs9AsK4", "unlimited": false, "use_buffer_percent": true}}, "regions": ["SYm54yxM", "nouu9qxD", "SZMi9DPI"], "session_timeout": 40, "unlimited": true, "use_buffer_percent": true}, "WyFslK7j": {"buffer_count": 15, "buffer_percent": 87, "configuration": "gXQfFoIo", "enable_region_overrides": false, "extendable_session": true, "game_version": "KMLcgbdo", "max_count": 11, "min_count": 70, "name": "Ucb5Of10", "region_overrides": {"TG6iBVVx": {"buffer_count": 7, "buffer_percent": 33, "max_count": 35, "min_count": 84, "name": "XCaN4bT4", "unlimited": false, "use_buffer_percent": false}, "kZH9UC63": {"buffer_count": 47, "buffer_percent": 40, "max_count": 80, "min_count": 38, "name": "PJzrsWBF", "unlimited": true, "use_buffer_percent": true}, "g19IkHZG": {"buffer_count": 43, "buffer_percent": 3, "max_count": 64, "min_count": 36, "name": "0rheM3q5", "unlimited": false, "use_buffer_percent": false}}, "regions": ["XdY1vbBe", "lNcFwVhY", "cz5GVfcc"], "session_timeout": 28, "unlimited": true, "use_buffer_percent": true}, "zJmIbPj1": {"buffer_count": 9, "buffer_percent": 51, "configuration": "W9yx9Bv3", "enable_region_overrides": true, "extendable_session": false, "game_version": "6InatgGV", "max_count": 16, "min_count": 49, "name": "BcaizbuG", "region_overrides": {"1my9dW1j": {"buffer_count": 94, "buffer_percent": 11, "max_count": 65, "min_count": 61, "name": "VsQzYDLp", "unlimited": true, "use_buffer_percent": true}, "vrWujVtq": {"buffer_count": 74, "buffer_percent": 97, "max_count": 42, "min_count": 99, "name": "aRqQujSg", "unlimited": true, "use_buffer_percent": true}, "uFt38RRM": {"buffer_count": 29, "buffer_percent": 11, "max_count": 14, "min_count": 22, "name": "6KbMiN4W", "unlimited": true, "use_buffer_percent": true}}, "regions": ["R2j8G7MR", "qmwLy9Tf", "c1rxbGoY"], "session_timeout": 74, "unlimited": true, "use_buffer_percent": true}}, "region_overrides": {"h06UkoLl": {"buffer_count": 78, "buffer_percent": 32, "max_count": 34, "min_count": 84, "name": "FGYXx9AW", "unlimited": true, "use_buffer_percent": false}, "iP7CV6cQ": {"buffer_count": 59, "buffer_percent": 71, "max_count": 4, "min_count": 61, "name": "2JSZfwRW", "unlimited": false, "use_buffer_percent": false}, "JZ6wej4U": {"buffer_count": 51, "buffer_percent": 16, "max_count": 81, "min_count": 75, "name": "MTnPLK4Y", "unlimited": true, "use_buffer_percent": true}}, "regions": ["tIau3RDt", "I1chkbN9", "IbDhdcmN"], "session_timeout": 84, "unlimited": false, "use_buffer_percent": false}' \
    > test.out 2>&1
eval_tap $? 59 'CreateDeploymentClient' test.out

#- 60 DeleteDeploymentClient
./ng net.accelbyte.sdk.cli.Main dsmc deleteDeploymentClient \
    --deployment 'rw3IAIWW' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 60 'DeleteDeploymentClient' test.out

#- 61 GetAllPodConfigClient
./ng net.accelbyte.sdk.cli.Main dsmc getAllPodConfigClient \
    --namespace "$AB_NAMESPACE" \
    --count '62' \
    --offset '85' \
    > test.out 2>&1
eval_tap $? 61 'GetAllPodConfigClient' test.out

#- 62 CreatePodConfigClient
./ng net.accelbyte.sdk.cli.Main dsmc createPodConfigClient \
    --name '8t7MDk1R' \
    --namespace "$AB_NAMESPACE" \
    --body '{"cpu_limit": 21, "mem_limit": 51, "params": "hjUknypC"}' \
    > test.out 2>&1
eval_tap $? 62 'CreatePodConfigClient' test.out

#- 63 DeletePodConfigClient
./ng net.accelbyte.sdk.cli.Main dsmc deletePodConfigClient \
    --name '5aPLTATW' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 63 'DeletePodConfigClient' test.out

#- 64 ListImagesClient
./ng net.accelbyte.sdk.cli.Main dsmc listImagesClient \
    --namespace "$AB_NAMESPACE" \
    --count '89' \
    --offset '43' \
    --q 'vBQg7PO2' \
    --sortBy 'updatedAt' \
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
    --version 'Mrx0l6oL' \
    > test.out 2>&1
eval_tap $? 66 'ImageDetailClient' test.out

#- 67 ListServerClient
./ng net.accelbyte.sdk.cli.Main dsmc listServerClient \
    --namespace "$AB_NAMESPACE" \
    --region 'sm42trO3' \
    --count '48' \
    --offset '48' \
    > test.out 2>&1
eval_tap $? 67 'ListServerClient' test.out

#- 68 ServerHeartbeat
./ng net.accelbyte.sdk.cli.Main dsmc serverHeartbeat \
    --namespace "$AB_NAMESPACE" \
    --body '{"podName": "vcJKZbMc"}' \
    > test.out 2>&1
eval_tap $? 68 'ServerHeartbeat' test.out

#- 69 DeregisterLocalServer
./ng net.accelbyte.sdk.cli.Main dsmc deregisterLocalServer \
    --namespace "$AB_NAMESPACE" \
    --body '{"name": "9vGUbhdv"}' \
    > test.out 2>&1
eval_tap $? 69 'DeregisterLocalServer' test.out

#- 70 RegisterLocalServer
./ng net.accelbyte.sdk.cli.Main dsmc registerLocalServer \
    --namespace "$AB_NAMESPACE" \
    --body '{"custom_attribute": "K27PMg5S", "ip": "2GFGT97Y", "name": "IZYudbg2", "port": 87}' \
    > test.out 2>&1
eval_tap $? 70 'RegisterLocalServer' test.out

#- 71 RegisterServer
./ng net.accelbyte.sdk.cli.Main dsmc registerServer \
    --namespace "$AB_NAMESPACE" \
    --body '{"custom_attribute": "3EJBqqyo", "pod_name": "jb161lwK"}' \
    > test.out 2>&1
eval_tap $? 71 'RegisterServer' test.out

#- 72 ShutdownServer
./ng net.accelbyte.sdk.cli.Main dsmc shutdownServer \
    --namespace "$AB_NAMESPACE" \
    --body '{"kill_me": true, "pod_name": "aWJZ3ySn"}' \
    > test.out 2>&1
eval_tap $? 72 'ShutdownServer' test.out

#- 73 GetServerSessionTimeout
./ng net.accelbyte.sdk.cli.Main dsmc getServerSessionTimeout \
    --namespace "$AB_NAMESPACE" \
    --podName 'MM28yg9C' \
    > test.out 2>&1
eval_tap $? 73 'GetServerSessionTimeout' test.out

#- 74 GetServerSession
./ng net.accelbyte.sdk.cli.Main dsmc getServerSession \
    --namespace "$AB_NAMESPACE" \
    --podName '10HCa3Jj' \
    > test.out 2>&1
eval_tap $? 74 'GetServerSession' test.out

#- 75 CreateSession
./ng net.accelbyte.sdk.cli.Main dsmc createSession \
    --namespace "$AB_NAMESPACE" \
    --body '{"client_version": "OHKnxooP", "configuration": "dInlKir5", "deployment": "icPDWftM", "game_mode": "mY8gxLt4", "matching_allies": [{"matching_parties": [{"party_attributes": {"LmoMubZQ": {}, "Q5HuKynJ": {}, "NSyNXmjO": {}}, "party_id": "s3DgvsEQ", "party_members": [{"user_id": "JHdNlwUc"}, {"user_id": "X3Zs8whH"}, {"user_id": "C15A2RRU"}]}, {"party_attributes": {"XCPMxkbp": {}, "j1eWjrrO": {}, "io1PZAMg": {}}, "party_id": "1qFsKOrR", "party_members": [{"user_id": "hj8bgh0O"}, {"user_id": "MDXXgt9V"}, {"user_id": "502XBtpe"}]}, {"party_attributes": {"32wS2MEV": {}, "H5lTSvIE": {}, "WvnI10i6": {}}, "party_id": "Ia2fdQnR", "party_members": [{"user_id": "1mKp0722"}, {"user_id": "bAM4TZw9"}, {"user_id": "0KXnsDut"}]}]}, {"matching_parties": [{"party_attributes": {"s4x2rW7R": {}, "aMl4QNyO": {}, "fwbA7vhh": {}}, "party_id": "gDzoKF5E", "party_members": [{"user_id": "1VIh5vc5"}, {"user_id": "jT0vtbGv"}, {"user_id": "mmazh2jZ"}]}, {"party_attributes": {"NMFyY4QT": {}, "HD0PFW97": {}, "KKnQhvJ4": {}}, "party_id": "cqyr1gSM", "party_members": [{"user_id": "UsEEFAv7"}, {"user_id": "fhVIREWZ"}, {"user_id": "JtLCfSe0"}]}, {"party_attributes": {"IZP36Mw7": {}, "u6iHNDdQ": {}, "CrXR7zzQ": {}}, "party_id": "OqTfv9UZ", "party_members": [{"user_id": "WbBQOaaz"}, {"user_id": "e7e4f5TG"}, {"user_id": "0DsVUH20"}]}]}, {"matching_parties": [{"party_attributes": {"BfiiGfsg": {}, "zKkt0WsE": {}, "kdavjxAF": {}}, "party_id": "JBjXXnVw", "party_members": [{"user_id": "NNhEtrGx"}, {"user_id": "Q4w9YSpV"}, {"user_id": "ePNkKXQx"}]}, {"party_attributes": {"LnwgRb6u": {}, "St2ogKkS": {}, "0qCxFbz8": {}}, "party_id": "9Qd2Elub", "party_members": [{"user_id": "7f1T8lv8"}, {"user_id": "X6bBVVZE"}, {"user_id": "NQvkCZw1"}]}, {"party_attributes": {"LHPU3ucx": {}, "TVJ8wrPa": {}, "4KrAVNQ0": {}}, "party_id": "nVAV5QBa", "party_members": [{"user_id": "7sWrsNEw"}, {"user_id": "rkW0uRYQ"}, {"user_id": "XytilIMA"}]}]}], "namespace": "y3yc2Hy4", "notification_payload": {}, "pod_name": "c5dC59CD", "region": "s790TxOR", "session_id": "3IXQkSDi"}' \
    > test.out 2>&1
eval_tap $? 75 'CreateSession' test.out

#- 76 ClaimServer
./ng net.accelbyte.sdk.cli.Main dsmc claimServer \
    --namespace "$AB_NAMESPACE" \
    --body '{"session_id": "xSTNBbgB"}' \
    > test.out 2>&1
eval_tap $? 76 'ClaimServer' test.out

#- 77 GetSession
./ng net.accelbyte.sdk.cli.Main dsmc getSession \
    --namespace "$AB_NAMESPACE" \
    --sessionID 'TfAcmCyo' \
    > test.out 2>&1
eval_tap $? 77 'GetSession' test.out

#- 78 CancelSession
./ng net.accelbyte.sdk.cli.Main dsmc cancelSession \
    --namespace "$AB_NAMESPACE" \
    --sessionID 'wspRYR99' \
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
    --region 'AAmopeBJ' \
    > test.out 2>&1
eval_tap $? 81 'ListProvidersByRegion' test.out

#- 82 PublicGetMessages
./ng net.accelbyte.sdk.cli.Main dsmc publicGetMessages \
    > test.out 2>&1
eval_tap $? 82 'PublicGetMessages' test.out


rm -f "tmp.dat"

exit $EXIT_CODE