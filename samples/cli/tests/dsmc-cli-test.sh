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
    --body '{"artifactPath": "XvtDTfdw", "coreDumpEnabled": false, "image": "dKkqtog2", "imageReplicationsMap": {"JdsoRlGU": {"failure_code": "ohrKX3pp", "region": "VeOJVyIU", "status": "nh2jySmT", "uri": "FhPvMZJH"}, "9dcSuFjI": {"failure_code": "Wew32AWY", "region": "9VnnwAqD", "status": "qSIqK6tf", "uri": "DIflXTid"}, "mHMXv7f3": {"failure_code": "NiRkxl6f", "region": "crGv7F8H", "status": "KqeKLjGG", "uri": "BKtYPDYl"}}, "namespace": "TWtEDbG8", "patchVersion": "uh5oXa6B", "persistent": true, "ulimitFileSize": 89, "version": "WnGxKl9t"}' \
    > test.out 2>&1
eval_tap $? 4 'UpdateImage' test.out

#- 5 CreateImage
./ng net.accelbyte.sdk.cli.Main dsmc createImage \
    --body '{"artifactPath": "5locrLi2", "coreDumpEnabled": true, "dockerPath": "myPImbQ7", "image": "DkKx0iZt", "imageSize": 0, "namespace": "cN818Mo2", "persistent": false, "ulimitFileSize": 75, "version": "Mg4GEOy9"}' \
    > test.out 2>&1
eval_tap $? 5 'CreateImage' test.out

#- 6 CreateImagePatch
./ng net.accelbyte.sdk.cli.Main dsmc createImagePatch \
    --body '{"artifactPath": "VYUGBTcD", "coreDumpEnabled": false, "dockerPath": "4XuJpJBn", "image": "aAqHSBH9", "imageSize": 53, "namespace": "JaFOQthm", "patchVersion": "103ToO1M", "persistent": false, "ulimitFileSize": 14, "uploaderFlag": "y6PEyq3G", "version": "zTUzGZMp"}' \
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
    --body '{"auto_deletion": true, "ghost_worker": false, "manual_buffer_override": false, "zombie_worker": true}' \
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
    --body '{"claim_timeout": 27, "creation_timeout": 62, "default_version": "6g0xXIMo", "port": 37, "ports": {"zIhmaLqA": 44, "3EqjMKZn": 6, "WIE3gfqi": 14}, "protocol": "URC8vMME", "providers": ["gFgm1kby", "nfRAuPcs", "r950Qswz"], "session_timeout": 74, "unreachable_timeout": 11}' \
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
    --body '{"claim_timeout": 78, "creation_timeout": 18, "default_version": "0BkBZcp5", "port": 95, "protocol": "tqw58nC4", "providers": ["RwK0qVoa", "FVFvDSmr", "4kBfn5xU"], "session_timeout": 80, "unreachable_timeout": 79}' \
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
    --name 'hdIrrsEg' \
    --count '93' \
    --offset '49' \
    > test.out 2>&1
eval_tap $? 16 'GetAllDeployment' test.out

#- 17 GetDeployment
./ng net.accelbyte.sdk.cli.Main dsmc getDeployment \
    --deployment 's7EYDSPf' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 17 'GetDeployment' test.out

#- 18 CreateDeployment
./ng net.accelbyte.sdk.cli.Main dsmc createDeployment \
    --deployment 'rbARfUKC' \
    --namespace "$AB_NAMESPACE" \
    --body '{"allow_version_override": true, "buffer_count": 32, "buffer_percent": 30, "configuration": "ymElUJla", "enable_region_overrides": false, "extendable_session": true, "game_version": "UeyTfWoy", "max_count": 59, "min_count": 56, "overrides": {"mTNdMs3E": {"buffer_count": 28, "buffer_percent": 95, "configuration": "LyL0liaH", "enable_region_overrides": false, "extendable_session": false, "game_version": "g2ulK6SF", "max_count": 63, "min_count": 65, "name": "Ald5G4LP", "region_overrides": {"bTK9kcXr": {"buffer_count": 48, "buffer_percent": 36, "max_count": 64, "min_count": 66, "name": "Jk9ZN82a", "unlimited": true, "use_buffer_percent": false}, "cNIMFtES": {"buffer_count": 97, "buffer_percent": 38, "max_count": 16, "min_count": 29, "name": "zcRYYKVH", "unlimited": true, "use_buffer_percent": true}, "Vgb6bW18": {"buffer_count": 20, "buffer_percent": 63, "max_count": 36, "min_count": 40, "name": "ZmNseJ8U", "unlimited": true, "use_buffer_percent": true}}, "regions": ["5oT1yAqV", "Qqx40CUU", "02SAqaoY"], "session_timeout": 2, "unlimited": true, "use_buffer_percent": true}, "zTUDtwYh": {"buffer_count": 65, "buffer_percent": 90, "configuration": "FLbcA2gq", "enable_region_overrides": true, "extendable_session": false, "game_version": "tDj9I6XM", "max_count": 16, "min_count": 17, "name": "zqpgxxgG", "region_overrides": {"k8Qpfg2a": {"buffer_count": 10, "buffer_percent": 67, "max_count": 73, "min_count": 26, "name": "dfSYJtwe", "unlimited": false, "use_buffer_percent": false}, "pBuMbVuW": {"buffer_count": 58, "buffer_percent": 38, "max_count": 83, "min_count": 79, "name": "1Sx7tQS9", "unlimited": false, "use_buffer_percent": true}, "57JcT9Rf": {"buffer_count": 7, "buffer_percent": 60, "max_count": 97, "min_count": 94, "name": "4khiLmyx", "unlimited": true, "use_buffer_percent": false}}, "regions": ["5VOsvCh1", "t9XoJXFU", "OjsY5xpy"], "session_timeout": 86, "unlimited": true, "use_buffer_percent": true}, "6LODYqwU": {"buffer_count": 76, "buffer_percent": 41, "configuration": "4mnJ7H7s", "enable_region_overrides": false, "extendable_session": true, "game_version": "8K6hDCmE", "max_count": 43, "min_count": 36, "name": "vY3gJVDx", "region_overrides": {"KtSdpEFu": {"buffer_count": 86, "buffer_percent": 56, "max_count": 64, "min_count": 72, "name": "ypeilBno", "unlimited": false, "use_buffer_percent": false}, "lhYW5tHT": {"buffer_count": 57, "buffer_percent": 44, "max_count": 20, "min_count": 12, "name": "b33RVJuJ", "unlimited": false, "use_buffer_percent": true}, "LOW9oe6V": {"buffer_count": 36, "buffer_percent": 62, "max_count": 11, "min_count": 19, "name": "o6cyXikL", "unlimited": true, "use_buffer_percent": true}}, "regions": ["OfaPqP2f", "7ijEUZuh", "MQRZQIPW"], "session_timeout": 49, "unlimited": false, "use_buffer_percent": true}}, "region_overrides": {"XHom8qgv": {"buffer_count": 8, "buffer_percent": 13, "max_count": 23, "min_count": 56, "name": "s5TF00oC", "unlimited": false, "use_buffer_percent": false}, "S3trfVr4": {"buffer_count": 42, "buffer_percent": 9, "max_count": 13, "min_count": 74, "name": "CToYmaxD", "unlimited": false, "use_buffer_percent": false}, "gOcTISgd": {"buffer_count": 78, "buffer_percent": 2, "max_count": 86, "min_count": 86, "name": "auE2ggou", "unlimited": true, "use_buffer_percent": true}}, "regions": ["4gXZqJRR", "gHAQHlD7", "p8MMHSwE"], "session_timeout": 69, "unlimited": true, "use_buffer_percent": true}' \
    > test.out 2>&1
eval_tap $? 18 'CreateDeployment' test.out

#- 19 DeleteDeployment
./ng net.accelbyte.sdk.cli.Main dsmc deleteDeployment \
    --deployment 'd262eNXZ' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 19 'DeleteDeployment' test.out

#- 20 UpdateDeployment
./ng net.accelbyte.sdk.cli.Main dsmc updateDeployment \
    --deployment 'fIcuYHLz' \
    --namespace "$AB_NAMESPACE" \
    --body '{"allow_version_override": true, "buffer_count": 25, "buffer_percent": 72, "configuration": "04mmseFG", "enable_region_overrides": false, "extendable_session": true, "game_version": "HzexJ1Aj", "max_count": 63, "min_count": 25, "regions": ["xbHfCJO2", "gTDMDPAC", "Bu7awd5w"], "session_timeout": 58, "unlimited": true, "use_buffer_percent": false}' \
    > test.out 2>&1
eval_tap $? 20 'UpdateDeployment' test.out

#- 21 CreateRootRegionOverride
./ng net.accelbyte.sdk.cli.Main dsmc createRootRegionOverride \
    --deployment '9tjeDRs3' \
    --namespace "$AB_NAMESPACE" \
    --region 'JN6OnrbX' \
    --body '{"buffer_count": 25, "buffer_percent": 60, "max_count": 45, "min_count": 28, "unlimited": false, "use_buffer_percent": false}' \
    > test.out 2>&1
eval_tap $? 21 'CreateRootRegionOverride' test.out

#- 22 DeleteRootRegionOverride
./ng net.accelbyte.sdk.cli.Main dsmc deleteRootRegionOverride \
    --deployment 'o5qC6WE1' \
    --namespace "$AB_NAMESPACE" \
    --region 'OXhLODZ5' \
    > test.out 2>&1
eval_tap $? 22 'DeleteRootRegionOverride' test.out

#- 23 UpdateRootRegionOverride
./ng net.accelbyte.sdk.cli.Main dsmc updateRootRegionOverride \
    --deployment 'JsLxGFAO' \
    --namespace "$AB_NAMESPACE" \
    --region 'uV3EXt6Z' \
    --body '{"buffer_count": 22, "buffer_percent": 10, "max_count": 42, "min_count": 63, "unlimited": false, "use_buffer_percent": true}' \
    > test.out 2>&1
eval_tap $? 23 'UpdateRootRegionOverride' test.out

#- 24 CreateDeploymentOverride
./ng net.accelbyte.sdk.cli.Main dsmc createDeploymentOverride \
    --deployment 'g9ZScLxI' \
    --namespace "$AB_NAMESPACE" \
    --version '3ZHNggqf' \
    --body '{"buffer_count": 32, "buffer_percent": 63, "configuration": "MIgzaM8l", "enable_region_overrides": true, "extendable_session": false, "game_version": "lSXgYyVX", "max_count": 10, "min_count": 20, "region_overrides": {"DEd6kgKb": {"buffer_count": 6, "buffer_percent": 91, "max_count": 7, "min_count": 8, "name": "sTsvrBu9", "unlimited": true, "use_buffer_percent": false}, "CTUkxR38": {"buffer_count": 21, "buffer_percent": 41, "max_count": 37, "min_count": 52, "name": "cJ5kHyhl", "unlimited": false, "use_buffer_percent": false}, "alGbEUt8": {"buffer_count": 3, "buffer_percent": 61, "max_count": 58, "min_count": 40, "name": "LfLpi8n1", "unlimited": false, "use_buffer_percent": true}}, "regions": ["LyeTMg8i", "2A72d0pN", "Bc07ZEMY"], "session_timeout": 27, "unlimited": true, "use_buffer_percent": false}' \
    > test.out 2>&1
eval_tap $? 24 'CreateDeploymentOverride' test.out

#- 25 DeleteDeploymentOverride
./ng net.accelbyte.sdk.cli.Main dsmc deleteDeploymentOverride \
    --deployment 'npqM2PSb' \
    --namespace "$AB_NAMESPACE" \
    --version 'fziB1Pb1' \
    > test.out 2>&1
eval_tap $? 25 'DeleteDeploymentOverride' test.out

#- 26 UpdateDeploymentOverride
./ng net.accelbyte.sdk.cli.Main dsmc updateDeploymentOverride \
    --deployment '0hmM6CBy' \
    --namespace "$AB_NAMESPACE" \
    --version 'ybso03QH' \
    --body '{"buffer_count": 56, "buffer_percent": 30, "configuration": "ov5OrHt9", "enable_region_overrides": true, "game_version": "LpMsePAF", "max_count": 1, "min_count": 2, "regions": ["kPR1ZnyW", "eQwXZ35t", "sFkKCBlK"], "session_timeout": 82, "unlimited": false, "use_buffer_percent": true}' \
    > test.out 2>&1
eval_tap $? 26 'UpdateDeploymentOverride' test.out

#- 27 CreateOverrideRegionOverride
./ng net.accelbyte.sdk.cli.Main dsmc createOverrideRegionOverride \
    --deployment '70VVWNt9' \
    --namespace "$AB_NAMESPACE" \
    --region 'kp7xooNU' \
    --version '4c4QxQBK' \
    --body '{"buffer_count": 18, "buffer_percent": 82, "max_count": 66, "min_count": 75, "unlimited": true, "use_buffer_percent": false}' \
    > test.out 2>&1
eval_tap $? 27 'CreateOverrideRegionOverride' test.out

#- 28 DeleteOverrideRegionOverride
./ng net.accelbyte.sdk.cli.Main dsmc deleteOverrideRegionOverride \
    --deployment 'Qi1DsQb6' \
    --namespace "$AB_NAMESPACE" \
    --region 'WdoICNTn' \
    --version 'ecQpeCZj' \
    > test.out 2>&1
eval_tap $? 28 'DeleteOverrideRegionOverride' test.out

#- 29 UpdateOverrideRegionOverride
./ng net.accelbyte.sdk.cli.Main dsmc updateOverrideRegionOverride \
    --deployment 'dPpEHdls' \
    --namespace "$AB_NAMESPACE" \
    --region 'TFT5nRzs' \
    --version 'vDcX3Fjq' \
    --body '{"buffer_count": 31, "buffer_percent": 2, "max_count": 51, "min_count": 2, "unlimited": true, "use_buffer_percent": false}' \
    > test.out 2>&1
eval_tap $? 29 'UpdateOverrideRegionOverride' test.out

#- 30 DeleteCreatingServerCountQueue
./ng net.accelbyte.sdk.cli.Main dsmc deleteCreatingServerCountQueue \
    --deployment 'NZcUpDIp' \
    --namespace "$AB_NAMESPACE" \
    --version '0ty3N6IE' \
    > test.out 2>&1
eval_tap $? 30 'DeleteCreatingServerCountQueue' test.out

#- 31 GetAllPodConfig
./ng net.accelbyte.sdk.cli.Main dsmc getAllPodConfig \
    --namespace "$AB_NAMESPACE" \
    --count '49' \
    --offset '62' \
    > test.out 2>&1
eval_tap $? 31 'GetAllPodConfig' test.out

#- 32 GetPodConfig
./ng net.accelbyte.sdk.cli.Main dsmc getPodConfig \
    --name 'YVSsjAuz' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 32 'GetPodConfig' test.out

#- 33 CreatePodConfig
./ng net.accelbyte.sdk.cli.Main dsmc createPodConfig \
    --name '86rSJLLN' \
    --namespace "$AB_NAMESPACE" \
    --body '{"cpu_limit": 6, "mem_limit": 83, "params": "IfixVUwf"}' \
    > test.out 2>&1
eval_tap $? 33 'CreatePodConfig' test.out

#- 34 DeletePodConfig
./ng net.accelbyte.sdk.cli.Main dsmc deletePodConfig \
    --name 'C3u00yEZ' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 34 'DeletePodConfig' test.out

#- 35 UpdatePodConfig
./ng net.accelbyte.sdk.cli.Main dsmc updatePodConfig \
    --name 'kou5YHPR' \
    --namespace "$AB_NAMESPACE" \
    --body '{"cpu_limit": 52, "mem_limit": 59, "name": "s3WiIE5d", "params": "VoAyragI"}' \
    > test.out 2>&1
eval_tap $? 35 'UpdatePodConfig' test.out

#- 36 AddPort
./ng net.accelbyte.sdk.cli.Main dsmc addPort \
    --name 'r4bCFfkL' \
    --namespace "$AB_NAMESPACE" \
    --body '{"port": 59}' \
    > test.out 2>&1
eval_tap $? 36 'AddPort' test.out

#- 37 DeletePort
./ng net.accelbyte.sdk.cli.Main dsmc deletePort \
    --name 'PtCnhihW' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 37 'DeletePort' test.out

#- 38 UpdatePort
./ng net.accelbyte.sdk.cli.Main dsmc updatePort \
    --name 'optv5Kky' \
    --namespace "$AB_NAMESPACE" \
    --body '{"name": "4zLzXUMI", "port": 94}' \
    > test.out 2>&1
eval_tap $? 38 'UpdatePort' test.out

#- 39 ListImages
./ng net.accelbyte.sdk.cli.Main dsmc listImages \
    --namespace "$AB_NAMESPACE" \
    --q 'mmEdaq1l' \
    --sortBy 'updatedAt' \
    --sortDirection 'desc' \
    --count '37' \
    --offset '63' \
    > test.out 2>&1
eval_tap $? 39 'ListImages' test.out

#- 40 DeleteImage
./ng net.accelbyte.sdk.cli.Main dsmc deleteImage \
    --namespace "$AB_NAMESPACE" \
    --imageURI '4lNBoxqs' \
    --version 'FXaiFp6e' \
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
    --imageURI 'LTif20XK' \
    --version 'Waf18xTd' \
    --versionPatch 'Y6uJrNT1' \
    > test.out 2>&1
eval_tap $? 42 'DeleteImagePatch' test.out

#- 43 GetImageDetail
./ng net.accelbyte.sdk.cli.Main dsmc getImageDetail \
    --namespace "$AB_NAMESPACE" \
    --version 'xnlvuPGP' \
    > test.out 2>&1
eval_tap $? 43 'GetImageDetail' test.out

#- 44 GetImagePatches
./ng net.accelbyte.sdk.cli.Main dsmc getImagePatches \
    --namespace "$AB_NAMESPACE" \
    --version '6dvybw62' \
    > test.out 2>&1
eval_tap $? 44 'GetImagePatches' test.out

#- 45 GetImagePatchDetail
./ng net.accelbyte.sdk.cli.Main dsmc getImagePatchDetail \
    --namespace "$AB_NAMESPACE" \
    --version 'lsCOlNGo' \
    --versionPatch 'A9tfdvY5' \
    > test.out 2>&1
eval_tap $? 45 'GetImagePatchDetail' test.out

#- 46 AddBuffer
./ng net.accelbyte.sdk.cli.Main dsmc addBuffer \
    --namespace "$AB_NAMESPACE" \
    --body '{"AllocCount": 27, "DeploymentName": "xwUcURl2", "JobCount": 33, "JobPriority": 100, "OverrideVersion": "68dpF4Ae", "Region": "Ie98lfUj"}' \
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
    --region '5cDh7xqW' \
    --count '11' \
    --offset '56' \
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
    --region 'PJky78nS' \
    > test.out 2>&1
eval_tap $? 50 'CountServerDetailed' test.out

#- 51 ListLocalServer
./ng net.accelbyte.sdk.cli.Main dsmc listLocalServer \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 51 'ListLocalServer' test.out

#- 52 DeleteLocalServer
./ng net.accelbyte.sdk.cli.Main dsmc deleteLocalServer \
    --name 'qZSeVs8q' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 52 'DeleteLocalServer' test.out

#- 53 GetServer
./ng net.accelbyte.sdk.cli.Main dsmc getServer \
    --namespace "$AB_NAMESPACE" \
    --podName 'W8loigwY' \
    > test.out 2>&1
eval_tap $? 53 'GetServer' test.out

#- 54 DeleteServer
./ng net.accelbyte.sdk.cli.Main dsmc deleteServer \
    --namespace "$AB_NAMESPACE" \
    --podName 'jgQDARNk' \
    > test.out 2>&1
eval_tap $? 54 'DeleteServer' test.out

#- 55 ListSession
./ng net.accelbyte.sdk.cli.Main dsmc listSession \
    --namespace "$AB_NAMESPACE" \
    --region '0qI9VO4S' \
    --withServer  \
    --count '70' \
    --offset '59' \
    > test.out 2>&1
eval_tap $? 55 'ListSession' test.out

#- 56 CountSession
./ng net.accelbyte.sdk.cli.Main dsmc countSession \
    --namespace "$AB_NAMESPACE" \
    --region 'AMttD4I7' \
    > test.out 2>&1
eval_tap $? 56 'CountSession' test.out

#- 57 DeleteSession
./ng net.accelbyte.sdk.cli.Main dsmc deleteSession \
    --namespace "$AB_NAMESPACE" \
    --sessionID 'FkthF56D' \
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
    --body '{"JobCount": 100, "Region": "IZhGdBGk", "TimeoutSecond": 79, "ZombieCount": 32}' \
    > test.out 2>&1
eval_tap $? 59 'RunZombieCleanerRequestHandler' test.out

#- 60 CreateRepository
./ng net.accelbyte.sdk.cli.Main dsmc createRepository \
    --body '{"namespace": "qIlHTiFF", "repository": "IgnHRC6Q"}' \
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
    --name 'VAURB4PR' \
    --count '26' \
    --offset '84' \
    > test.out 2>&1
eval_tap $? 63 'GetAllDeploymentClient' test.out

#- 64 GetDeploymentClient
./ng net.accelbyte.sdk.cli.Main dsmc getDeploymentClient \
    --deployment 'IzOb5YrS' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 64 'GetDeploymentClient' test.out

#- 65 CreateDeploymentClient
./ng net.accelbyte.sdk.cli.Main dsmc createDeploymentClient \
    --deployment 'AMVDmL9O' \
    --namespace "$AB_NAMESPACE" \
    --body '{"allow_version_override": true, "buffer_count": 93, "buffer_percent": 40, "configuration": "ufzsp8uO", "enable_region_overrides": false, "extendable_session": false, "game_version": "PqHqgVim", "max_count": 33, "min_count": 69, "overrides": {"8piu7AIm": {"buffer_count": 17, "buffer_percent": 57, "configuration": "6FssBq3X", "enable_region_overrides": true, "extendable_session": false, "game_version": "9TYljMgE", "max_count": 15, "min_count": 49, "name": "nKSpMxbR", "region_overrides": {"SD7403r4": {"buffer_count": 1, "buffer_percent": 74, "max_count": 45, "min_count": 99, "name": "ILyrwhC0", "unlimited": false, "use_buffer_percent": true}, "yUcVzZcd": {"buffer_count": 100, "buffer_percent": 80, "max_count": 67, "min_count": 40, "name": "xpJzqZyu", "unlimited": true, "use_buffer_percent": true}, "85v3XUiI": {"buffer_count": 1, "buffer_percent": 48, "max_count": 71, "min_count": 26, "name": "oPtazvkE", "unlimited": true, "use_buffer_percent": true}}, "regions": ["qwhrmrAo", "EPsNves9", "K1ObkgyQ"], "session_timeout": 33, "unlimited": true, "use_buffer_percent": false}, "qDncBZsV": {"buffer_count": 20, "buffer_percent": 19, "configuration": "FWnefTcL", "enable_region_overrides": true, "extendable_session": false, "game_version": "KNmr1Pbk", "max_count": 65, "min_count": 51, "name": "lrXllVAp", "region_overrides": {"mNfgeftG": {"buffer_count": 55, "buffer_percent": 15, "max_count": 42, "min_count": 43, "name": "ssgUb7TX", "unlimited": false, "use_buffer_percent": false}, "LokFqKrE": {"buffer_count": 3, "buffer_percent": 73, "max_count": 83, "min_count": 71, "name": "aeKs7FQ7", "unlimited": false, "use_buffer_percent": false}, "7822kaT1": {"buffer_count": 66, "buffer_percent": 87, "max_count": 53, "min_count": 34, "name": "9zDJeTpw", "unlimited": false, "use_buffer_percent": false}}, "regions": ["7IzmlrJY", "kzwhbNh1", "F9or092r"], "session_timeout": 62, "unlimited": false, "use_buffer_percent": true}, "ZkZ150cP": {"buffer_count": 91, "buffer_percent": 6, "configuration": "U2uhzMVC", "enable_region_overrides": false, "extendable_session": true, "game_version": "n2Y7QO4W", "max_count": 41, "min_count": 64, "name": "2ilvC4j2", "region_overrides": {"qKtK9Zb2": {"buffer_count": 34, "buffer_percent": 20, "max_count": 51, "min_count": 29, "name": "0PBjamiS", "unlimited": false, "use_buffer_percent": true}, "R3451tjr": {"buffer_count": 60, "buffer_percent": 87, "max_count": 13, "min_count": 9, "name": "Li8U2Obr", "unlimited": false, "use_buffer_percent": true}, "9NRuyx3Y": {"buffer_count": 50, "buffer_percent": 61, "max_count": 11, "min_count": 69, "name": "DYJtsc0o", "unlimited": false, "use_buffer_percent": false}}, "regions": ["DLasxmIM", "zFWVoQcU", "1nYHxc3v"], "session_timeout": 12, "unlimited": false, "use_buffer_percent": false}}, "region_overrides": {"kkHZT4MF": {"buffer_count": 69, "buffer_percent": 98, "max_count": 24, "min_count": 44, "name": "R6yj4YAc", "unlimited": true, "use_buffer_percent": true}, "tuWAg5k4": {"buffer_count": 14, "buffer_percent": 97, "max_count": 95, "min_count": 69, "name": "DgRCZdc2", "unlimited": true, "use_buffer_percent": false}, "4APtTrNG": {"buffer_count": 86, "buffer_percent": 76, "max_count": 9, "min_count": 11, "name": "uQL4SMJR", "unlimited": false, "use_buffer_percent": false}}, "regions": ["uFnOlCx9", "pGPFNGoN", "5qqD93g8"], "session_timeout": 35, "unlimited": false, "use_buffer_percent": true}' \
    > test.out 2>&1
eval_tap $? 65 'CreateDeploymentClient' test.out

#- 66 DeleteDeploymentClient
./ng net.accelbyte.sdk.cli.Main dsmc deleteDeploymentClient \
    --deployment 'MS5OMCK3' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 66 'DeleteDeploymentClient' test.out

#- 67 GetAllPodConfigClient
./ng net.accelbyte.sdk.cli.Main dsmc getAllPodConfigClient \
    --namespace "$AB_NAMESPACE" \
    --count '71' \
    --offset '58' \
    > test.out 2>&1
eval_tap $? 67 'GetAllPodConfigClient' test.out

#- 68 CreatePodConfigClient
./ng net.accelbyte.sdk.cli.Main dsmc createPodConfigClient \
    --name 'qK7MaOnR' \
    --namespace "$AB_NAMESPACE" \
    --body '{"cpu_limit": 1, "mem_limit": 55, "params": "Fg4gJAds"}' \
    > test.out 2>&1
eval_tap $? 68 'CreatePodConfigClient' test.out

#- 69 DeletePodConfigClient
./ng net.accelbyte.sdk.cli.Main dsmc deletePodConfigClient \
    --name 'F9jBD4x8' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 69 'DeletePodConfigClient' test.out

#- 70 ListImagesClient
./ng net.accelbyte.sdk.cli.Main dsmc listImagesClient \
    --namespace "$AB_NAMESPACE" \
    --count '36' \
    --offset '78' \
    --q 'BLZrttIP' \
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
    --version 'ed4hXh7I' \
    > test.out 2>&1
eval_tap $? 72 'ImageDetailClient' test.out

#- 73 ListServerClient
./ng net.accelbyte.sdk.cli.Main dsmc listServerClient \
    --namespace "$AB_NAMESPACE" \
    --region '6kweCaPQ' \
    --count '1' \
    --offset '75' \
    > test.out 2>&1
eval_tap $? 73 'ListServerClient' test.out

#- 74 CountServerDetailedClient
./ng net.accelbyte.sdk.cli.Main dsmc countServerDetailedClient \
    --namespace "$AB_NAMESPACE" \
    --region 'WoXQEz5Z' \
    > test.out 2>&1
eval_tap $? 74 'CountServerDetailedClient' test.out

#- 75 ServerHeartbeat
./ng net.accelbyte.sdk.cli.Main dsmc serverHeartbeat \
    --namespace "$AB_NAMESPACE" \
    --body '{"podName": "Gya7KYDE"}' \
    > test.out 2>&1
eval_tap $? 75 'ServerHeartbeat' test.out

#- 76 DeregisterLocalServer
./ng net.accelbyte.sdk.cli.Main dsmc deregisterLocalServer \
    --namespace "$AB_NAMESPACE" \
    --body '{"name": "QKkcBd5v"}' \
    > test.out 2>&1
eval_tap $? 76 'DeregisterLocalServer' test.out

#- 77 RegisterLocalServer
./ng net.accelbyte.sdk.cli.Main dsmc registerLocalServer \
    --namespace "$AB_NAMESPACE" \
    --body '{"custom_attribute": "DOJ6AgxL", "ip": "U4EaiNU4", "name": "Ub5pWVvL", "port": 20}' \
    > test.out 2>&1
eval_tap $? 77 'RegisterLocalServer' test.out

#- 78 RegisterServer
./ng net.accelbyte.sdk.cli.Main dsmc registerServer \
    --namespace "$AB_NAMESPACE" \
    --body '{"custom_attribute": "rSPUtuPN", "pod_name": "kqsmEGfr"}' \
    > test.out 2>&1
eval_tap $? 78 'RegisterServer' test.out

#- 79 ShutdownServer
./ng net.accelbyte.sdk.cli.Main dsmc shutdownServer \
    --namespace "$AB_NAMESPACE" \
    --body '{"kill_me": true, "pod_name": "Uve7zCOt"}' \
    > test.out 2>&1
eval_tap $? 79 'ShutdownServer' test.out

#- 80 GetServerSessionTimeout
./ng net.accelbyte.sdk.cli.Main dsmc getServerSessionTimeout \
    --namespace "$AB_NAMESPACE" \
    --podName 'kqOYmSBU' \
    > test.out 2>&1
eval_tap $? 80 'GetServerSessionTimeout' test.out

#- 81 GetServerSession
./ng net.accelbyte.sdk.cli.Main dsmc getServerSession \
    --namespace "$AB_NAMESPACE" \
    --podName 'OYLLyN7I' \
    > test.out 2>&1
eval_tap $? 81 'GetServerSession' test.out

#- 82 CreateSession
./ng net.accelbyte.sdk.cli.Main dsmc createSession \
    --namespace "$AB_NAMESPACE" \
    --body '{"client_version": "vh29W0Rm", "configuration": "55FxXQOR", "deployment": "MRGX9bCX", "game_mode": "D58jzgGY", "matching_allies": [{"matching_parties": [{"party_attributes": {"yvrUnxQx": {}, "08b6NeNR": {}, "dZprFCRH": {}}, "party_id": "uZz7MDHQ", "party_members": [{"user_id": "LY88nDsA"}, {"user_id": "GPkJAg2K"}, {"user_id": "BSv9UbrB"}]}, {"party_attributes": {"NIUnGyYU": {}, "pzjHNVwd": {}, "vlB9MHyO": {}}, "party_id": "iWgYfguE", "party_members": [{"user_id": "jvk4nfTC"}, {"user_id": "W3FtfoJZ"}, {"user_id": "L4ARgy48"}]}, {"party_attributes": {"be58fS5r": {}, "PnVQOMKg": {}, "s5NcMUXR": {}}, "party_id": "aOwrKThv", "party_members": [{"user_id": "Y6LoyYZB"}, {"user_id": "hX0hXMeb"}, {"user_id": "4hsUFjDE"}]}]}, {"matching_parties": [{"party_attributes": {"t0TDgS5C": {}, "5DJBqsWq": {}, "hft1VjPD": {}}, "party_id": "IQvEszlP", "party_members": [{"user_id": "g9FKSHvD"}, {"user_id": "f6w4WiXx"}, {"user_id": "T1GTsReJ"}]}, {"party_attributes": {"8sy9LaaM": {}, "WCEKAJtP": {}, "2aydukmo": {}}, "party_id": "zhbWBZpZ", "party_members": [{"user_id": "o3OTVoLH"}, {"user_id": "lrI6fXs5"}, {"user_id": "l8JVbFc0"}]}, {"party_attributes": {"QMnqPFIq": {}, "5MDio5sQ": {}, "aDgl1gX9": {}}, "party_id": "oUytqfz1", "party_members": [{"user_id": "EKRkAyCW"}, {"user_id": "oufgZwor"}, {"user_id": "YtvKU4wO"}]}]}, {"matching_parties": [{"party_attributes": {"DGYLKCVi": {}, "AQswwqMl": {}, "Zs8MW7u5": {}}, "party_id": "smzZQR6C", "party_members": [{"user_id": "gXPTXd91"}, {"user_id": "ADdaoMk4"}, {"user_id": "WB6GubiD"}]}, {"party_attributes": {"lAYu9fG9": {}, "CfPdwGQc": {}, "2fg3Vdyn": {}}, "party_id": "YMdAQ9AO", "party_members": [{"user_id": "XfSx8bi2"}, {"user_id": "K8XWSL9h"}, {"user_id": "LCgrUxCk"}]}, {"party_attributes": {"6RlnWTyS": {}, "7ASgnVWd": {}, "5QIm741B": {}}, "party_id": "OerEKdMc", "party_members": [{"user_id": "lFU7Oiyg"}, {"user_id": "W377iDOo"}, {"user_id": "wA5V8MYG"}]}]}], "namespace": "NNgntgio", "notification_payload": {}, "pod_name": "pNPnewJM", "region": "omAE9rBp", "session_id": "hA6HJDPW"}' \
    > test.out 2>&1
eval_tap $? 82 'CreateSession' test.out

#- 83 ClaimServer
./ng net.accelbyte.sdk.cli.Main dsmc claimServer \
    --namespace "$AB_NAMESPACE" \
    --body '{"game_mode": "YowPaJpC", "matching_allies": [{"matching_parties": [{"party_attributes": {"Kx7stL9I": {}, "06AF9TyY": {}, "AXxidxJl": {}}, "party_id": "Ucp3J4SB", "party_members": [{"user_id": "JemhMJzc"}, {"user_id": "BCqR2VhH"}, {"user_id": "fBk99nG7"}]}, {"party_attributes": {"zApLwChc": {}, "lBEingMJ": {}, "7byLC2FO": {}}, "party_id": "1QwvuwDg", "party_members": [{"user_id": "HcGKh4tp"}, {"user_id": "hDVh4Yqh"}, {"user_id": "gpGZf8RL"}]}, {"party_attributes": {"tLAPQYp8": {}, "vOykihjw": {}, "wKyNN4XZ": {}}, "party_id": "Stkfhpeg", "party_members": [{"user_id": "cuaddmJq"}, {"user_id": "4ThzeWvP"}, {"user_id": "DCinosFr"}]}]}, {"matching_parties": [{"party_attributes": {"QwiEg2PW": {}, "MwAsyhft": {}, "IKgiUskP": {}}, "party_id": "uvs57URX", "party_members": [{"user_id": "nWQREhTg"}, {"user_id": "h85EEtZC"}, {"user_id": "AqKQxQHZ"}]}, {"party_attributes": {"TqGhJymG": {}, "eWRggAvi": {}, "hH3qj3gE": {}}, "party_id": "nEWmEFI5", "party_members": [{"user_id": "IxRgrVQ2"}, {"user_id": "OftOXiUV"}, {"user_id": "g5MIXF0H"}]}, {"party_attributes": {"Ux5OXcPi": {}, "OEMEJqZ4": {}, "weilnAHr": {}}, "party_id": "XgQLULnS", "party_members": [{"user_id": "B5MJodT1"}, {"user_id": "bS6TEj4o"}, {"user_id": "UvnwwMfN"}]}]}, {"matching_parties": [{"party_attributes": {"Xqq7IDyf": {}, "lnsTX2Qd": {}, "xp86MG8P": {}}, "party_id": "kQGnNY8E", "party_members": [{"user_id": "1XNwl0ZT"}, {"user_id": "8Pz7Gr0b"}, {"user_id": "QrhdHIaT"}]}, {"party_attributes": {"QSRkIcIo": {}, "Cs52XZoU": {}, "tI1GhOQq": {}}, "party_id": "Or5sPChL", "party_members": [{"user_id": "lQuSFY0s"}, {"user_id": "x4VdahO8"}, {"user_id": "jy6HY41P"}]}, {"party_attributes": {"yq2xUoBo": {}, "gJqLkZoU": {}, "YA72iOs0": {}}, "party_id": "12XUL7WW", "party_members": [{"user_id": "WHQsSuih"}, {"user_id": "ZskFoHAN"}, {"user_id": "RZUcRv7s"}]}]}], "namespace": "DIhjpsj5", "notification_payload": {}, "session_id": "Mtsb46uA"}' \
    > test.out 2>&1
eval_tap $? 83 'ClaimServer' test.out

#- 84 GetSession
./ng net.accelbyte.sdk.cli.Main dsmc getSession \
    --namespace "$AB_NAMESPACE" \
    --sessionID 'mLFL0dzA' \
    > test.out 2>&1
eval_tap $? 84 'GetSession' test.out

#- 85 CancelSession
./ng net.accelbyte.sdk.cli.Main dsmc cancelSession \
    --namespace "$AB_NAMESPACE" \
    --sessionID 'Kb3BXaQZ' \
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
    --region 'jiMPjTvr' \
    > test.out 2>&1
eval_tap $? 88 'ListProvidersByRegion' test.out

#- 89 PublicGetMessages
./ng net.accelbyte.sdk.cli.Main dsmc publicGetMessages \
    > test.out 2>&1
eval_tap $? 89 'PublicGetMessages' test.out


rm -f "tmp.dat"

exit $EXIT_CODE