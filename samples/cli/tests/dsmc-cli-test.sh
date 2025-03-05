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
    --body '{"artifactPath": "kfmmSMlC", "coreDumpEnabled": false, "image": "ItKYYqmb", "imageReplicationsMap": {"UqxQGxc0": {"failure_code": "OQAshXUH", "region": "IzsPbxMn", "status": "rfWrqNbx", "uri": "SdQOwHlf"}, "8oPHkiOo": {"failure_code": "qGxwJk1A", "region": "kJUwbGVI", "status": "HYKgwYWA", "uri": "W9d6zGHi"}, "2bW0LnTM": {"failure_code": "MMyBNuYi", "region": "Qxob6Lqs", "status": "riaS03cM", "uri": "4qPfbxpI"}}, "namespace": "W72weGt1", "patchVersion": "CCNN87Ko", "persistent": false, "ulimitFileSize": 1, "version": "LUrNm0a2"}' \
    > test.out 2>&1
eval_tap $? 4 'UpdateImage' test.out

#- 5 CreateImage
./ng net.accelbyte.sdk.cli.Main dsmc createImage \
    --body '{"artifactPath": "CbeW7KZw", "coreDumpEnabled": true, "dockerPath": "pciEtQGE", "image": "8nWej7UD", "imageSize": 12, "namespace": "k804eT0B", "persistent": true, "ulimitFileSize": 47, "version": "DDyB18NZ"}' \
    > test.out 2>&1
eval_tap $? 5 'CreateImage' test.out

#- 6 CreateImagePatch
./ng net.accelbyte.sdk.cli.Main dsmc createImagePatch \
    --body '{"artifactPath": "VOwtcphd", "coreDumpEnabled": false, "dockerPath": "3Bbcme6y", "image": "ZbGrVLa0", "imageSize": 70, "namespace": "Cf8h3UVK", "patchVersion": "G4xT0z48", "persistent": false, "ulimitFileSize": 71, "uploaderFlag": "O9GhA3b0", "version": "tjvG38wo"}' \
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
    --body '{"auto_deletion": true, "ghost_worker": true, "manual_buffer_override": false, "zombie_worker": false}' \
    > test.out 2>&1
eval_tap $? 9 'UpdateWorkerConfig' test.out

#- 10 CreateWorkerConfig
./ng net.accelbyte.sdk.cli.Main dsmc createWorkerConfig \
    --namespace "$AB_NAMESPACE" \
    --body '{"auto_deletion": true, "ghost_worker": false, "manual_buffer_override": true, "zombie_worker": true}' \
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
    --body '{"claim_timeout": 77, "creation_timeout": 4, "default_version": "yj2nCEMY", "port": 27, "ports": {"GLvVtnBZ": 83, "GSoHriS4": 21, "x2w5Vp0j": 12}, "protocol": "Aev8K4aY", "providers": ["PqPrt62I", "NwDifxar", "u0u5nF4e"], "session_timeout": 27, "unreachable_timeout": 42}' \
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
    --body '{"claim_timeout": 39, "creation_timeout": 49, "default_version": "LVhENLDy", "port": 82, "protocol": "UdJGAD7b", "providers": ["QfPmsFl1", "uyW42iyW", "qB3j3etP"], "session_timeout": 0, "unreachable_timeout": 40}' \
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
    --name 'pBqgVdX4' \
    --count '71' \
    --offset '69' \
    > test.out 2>&1
eval_tap $? 16 'GetAllDeployment' test.out

#- 17 GetDeployment
./ng net.accelbyte.sdk.cli.Main dsmc getDeployment \
    --deployment 't1jebtBi' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 17 'GetDeployment' test.out

#- 18 CreateDeployment
./ng net.accelbyte.sdk.cli.Main dsmc createDeployment \
    --deployment 'bmvD31VP' \
    --namespace "$AB_NAMESPACE" \
    --body '{"allow_version_override": true, "buffer_count": 62, "buffer_percent": 3, "configuration": "WgXleMpi", "enable_region_overrides": false, "extendable_session": true, "game_version": "7uqtIqh5", "max_count": 78, "min_count": 87, "overrides": {"63PKgNPF": {"buffer_count": 96, "buffer_percent": 84, "configuration": "uxVmpJ2c", "enable_region_overrides": false, "extendable_session": false, "game_version": "46L8oclf", "max_count": 85, "min_count": 25, "name": "otA2QnXb", "region_overrides": {"f5Djc3Wh": {"buffer_count": 75, "buffer_percent": 52, "max_count": 82, "min_count": 57, "name": "UXzOncPk", "unlimited": true, "use_buffer_percent": true}, "aeh5n53J": {"buffer_count": 43, "buffer_percent": 2, "max_count": 63, "min_count": 52, "name": "AhVXYKp8", "unlimited": false, "use_buffer_percent": false}, "S5bZW9Hb": {"buffer_count": 10, "buffer_percent": 53, "max_count": 87, "min_count": 51, "name": "B1ouIBaj", "unlimited": true, "use_buffer_percent": true}}, "regions": ["TUW2cQ4x", "2u3QKKRN", "cULPDJPw"], "session_timeout": 76, "unlimited": true, "use_buffer_percent": false}, "GKmQOzWZ": {"buffer_count": 52, "buffer_percent": 10, "configuration": "QAHaEpuq", "enable_region_overrides": false, "extendable_session": true, "game_version": "4BOtVMTY", "max_count": 23, "min_count": 74, "name": "Ph8PhYr3", "region_overrides": {"2Wj8jRZ4": {"buffer_count": 59, "buffer_percent": 56, "max_count": 26, "min_count": 56, "name": "VPxlc0r1", "unlimited": false, "use_buffer_percent": true}, "E8LIjj2O": {"buffer_count": 61, "buffer_percent": 13, "max_count": 63, "min_count": 29, "name": "JghdBgWA", "unlimited": true, "use_buffer_percent": true}, "HO1lWyWA": {"buffer_count": 41, "buffer_percent": 15, "max_count": 42, "min_count": 63, "name": "9xXUDgQJ", "unlimited": false, "use_buffer_percent": true}}, "regions": ["LnQnXb4e", "PqBMEFaB", "xDzXlUXv"], "session_timeout": 10, "unlimited": false, "use_buffer_percent": true}, "qtMR8gmJ": {"buffer_count": 57, "buffer_percent": 31, "configuration": "aTpc4kQZ", "enable_region_overrides": false, "extendable_session": true, "game_version": "NG36o5T9", "max_count": 83, "min_count": 57, "name": "8IY2RJa8", "region_overrides": {"1SUJKPCT": {"buffer_count": 42, "buffer_percent": 34, "max_count": 45, "min_count": 59, "name": "GiklAjt4", "unlimited": false, "use_buffer_percent": false}, "e9Se1mHY": {"buffer_count": 70, "buffer_percent": 5, "max_count": 80, "min_count": 39, "name": "lmBpSDnw", "unlimited": false, "use_buffer_percent": false}, "ZqEPK9tw": {"buffer_count": 87, "buffer_percent": 30, "max_count": 30, "min_count": 12, "name": "WObpCuKe", "unlimited": false, "use_buffer_percent": true}}, "regions": ["grBDTjeU", "cUxF2PsY", "XH08Ewl1"], "session_timeout": 88, "unlimited": false, "use_buffer_percent": false}}, "region_overrides": {"mfXTDYCI": {"buffer_count": 85, "buffer_percent": 56, "max_count": 33, "min_count": 1, "name": "GGYto9fB", "unlimited": false, "use_buffer_percent": false}, "ymuOyltG": {"buffer_count": 91, "buffer_percent": 83, "max_count": 93, "min_count": 57, "name": "EElXP4dj", "unlimited": true, "use_buffer_percent": true}, "FdOuR9E3": {"buffer_count": 21, "buffer_percent": 25, "max_count": 58, "min_count": 77, "name": "lsh5JV4F", "unlimited": true, "use_buffer_percent": false}}, "regions": ["aY3NFGUy", "VTTGuqlI", "uFUEyjFW"], "session_timeout": 96, "unlimited": false, "use_buffer_percent": false}' \
    > test.out 2>&1
eval_tap $? 18 'CreateDeployment' test.out

#- 19 DeleteDeployment
./ng net.accelbyte.sdk.cli.Main dsmc deleteDeployment \
    --deployment 'aqihrBUv' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 19 'DeleteDeployment' test.out

#- 20 UpdateDeployment
./ng net.accelbyte.sdk.cli.Main dsmc updateDeployment \
    --deployment '0gv51LR3' \
    --namespace "$AB_NAMESPACE" \
    --body '{"allow_version_override": true, "buffer_count": 10, "buffer_percent": 5, "configuration": "yUjw8lgz", "enable_region_overrides": false, "extendable_session": false, "game_version": "YFXEI5PD", "max_count": 38, "min_count": 95, "regions": ["MasrtRfz", "K2kBHkds", "M9fURP35"], "session_timeout": 10, "unlimited": false, "use_buffer_percent": false}' \
    > test.out 2>&1
eval_tap $? 20 'UpdateDeployment' test.out

#- 21 CreateRootRegionOverride
./ng net.accelbyte.sdk.cli.Main dsmc createRootRegionOverride \
    --deployment 'jjq7zusu' \
    --namespace "$AB_NAMESPACE" \
    --region 'JKH9QSTA' \
    --body '{"buffer_count": 1, "buffer_percent": 52, "max_count": 96, "min_count": 59, "unlimited": false, "use_buffer_percent": false}' \
    > test.out 2>&1
eval_tap $? 21 'CreateRootRegionOverride' test.out

#- 22 DeleteRootRegionOverride
./ng net.accelbyte.sdk.cli.Main dsmc deleteRootRegionOverride \
    --deployment '0EclYnZ7' \
    --namespace "$AB_NAMESPACE" \
    --region 'seoMnBF6' \
    > test.out 2>&1
eval_tap $? 22 'DeleteRootRegionOverride' test.out

#- 23 UpdateRootRegionOverride
./ng net.accelbyte.sdk.cli.Main dsmc updateRootRegionOverride \
    --deployment 'hsvL4FOW' \
    --namespace "$AB_NAMESPACE" \
    --region 'ubbd8PiQ' \
    --body '{"buffer_count": 86, "buffer_percent": 75, "max_count": 3, "min_count": 88, "unlimited": false, "use_buffer_percent": false}' \
    > test.out 2>&1
eval_tap $? 23 'UpdateRootRegionOverride' test.out

#- 24 CreateDeploymentOverride
./ng net.accelbyte.sdk.cli.Main dsmc createDeploymentOverride \
    --deployment '3nZd87Kb' \
    --namespace "$AB_NAMESPACE" \
    --version 'JUAKHeXq' \
    --body '{"buffer_count": 98, "buffer_percent": 43, "configuration": "x8R95rut", "enable_region_overrides": false, "extendable_session": true, "game_version": "vw6AitvO", "max_count": 40, "min_count": 33, "region_overrides": {"bkXVUl1M": {"buffer_count": 8, "buffer_percent": 53, "max_count": 19, "min_count": 47, "name": "xG0XMaVP", "unlimited": true, "use_buffer_percent": false}, "ZjB9NcdW": {"buffer_count": 90, "buffer_percent": 19, "max_count": 27, "min_count": 67, "name": "U2gwucCa", "unlimited": false, "use_buffer_percent": true}, "uAaUzxw5": {"buffer_count": 73, "buffer_percent": 90, "max_count": 88, "min_count": 29, "name": "lgdZInQ7", "unlimited": false, "use_buffer_percent": true}}, "regions": ["Xh3fud1B", "4jYP7BuS", "1AEOEFEi"], "session_timeout": 3, "unlimited": false, "use_buffer_percent": true}' \
    > test.out 2>&1
eval_tap $? 24 'CreateDeploymentOverride' test.out

#- 25 DeleteDeploymentOverride
./ng net.accelbyte.sdk.cli.Main dsmc deleteDeploymentOverride \
    --deployment 'Uhsbph6k' \
    --namespace "$AB_NAMESPACE" \
    --version '69POTzOt' \
    > test.out 2>&1
eval_tap $? 25 'DeleteDeploymentOverride' test.out

#- 26 UpdateDeploymentOverride
./ng net.accelbyte.sdk.cli.Main dsmc updateDeploymentOverride \
    --deployment 'kkW1FvCN' \
    --namespace "$AB_NAMESPACE" \
    --version 'JfZUAZ1g' \
    --body '{"buffer_count": 17, "buffer_percent": 1, "configuration": "EpWbpVHd", "enable_region_overrides": false, "game_version": "4FZB76P1", "max_count": 38, "min_count": 64, "regions": ["fQ3XA1AZ", "Zhd6UCrY", "dHMOzp6y"], "session_timeout": 61, "unlimited": false, "use_buffer_percent": true}' \
    > test.out 2>&1
eval_tap $? 26 'UpdateDeploymentOverride' test.out

#- 27 CreateOverrideRegionOverride
./ng net.accelbyte.sdk.cli.Main dsmc createOverrideRegionOverride \
    --deployment 'CDvtLRmp' \
    --namespace "$AB_NAMESPACE" \
    --region 'xkFTeE6d' \
    --version 'yNizWOcF' \
    --body '{"buffer_count": 72, "buffer_percent": 55, "max_count": 76, "min_count": 81, "unlimited": true, "use_buffer_percent": false}' \
    > test.out 2>&1
eval_tap $? 27 'CreateOverrideRegionOverride' test.out

#- 28 DeleteOverrideRegionOverride
./ng net.accelbyte.sdk.cli.Main dsmc deleteOverrideRegionOverride \
    --deployment 'drkNSuJl' \
    --namespace "$AB_NAMESPACE" \
    --region 'u50X60Te' \
    --version '1MUPDouY' \
    > test.out 2>&1
eval_tap $? 28 'DeleteOverrideRegionOverride' test.out

#- 29 UpdateOverrideRegionOverride
./ng net.accelbyte.sdk.cli.Main dsmc updateOverrideRegionOverride \
    --deployment 'wcAudxeN' \
    --namespace "$AB_NAMESPACE" \
    --region 'YZ6XKBa9' \
    --version 'P1h9hVue' \
    --body '{"buffer_count": 34, "buffer_percent": 39, "max_count": 8, "min_count": 53, "unlimited": true, "use_buffer_percent": true}' \
    > test.out 2>&1
eval_tap $? 29 'UpdateOverrideRegionOverride' test.out

#- 30 DeleteCreatingServerCountQueue
./ng net.accelbyte.sdk.cli.Main dsmc deleteCreatingServerCountQueue \
    --deployment 'XFK4Ri1K' \
    --namespace "$AB_NAMESPACE" \
    --version 'JKkrQK8v' \
    > test.out 2>&1
eval_tap $? 30 'DeleteCreatingServerCountQueue' test.out

#- 31 GetAllPodConfig
./ng net.accelbyte.sdk.cli.Main dsmc getAllPodConfig \
    --namespace "$AB_NAMESPACE" \
    --count '72' \
    --offset '55' \
    > test.out 2>&1
eval_tap $? 31 'GetAllPodConfig' test.out

#- 32 GetPodConfig
./ng net.accelbyte.sdk.cli.Main dsmc getPodConfig \
    --name 'LiMwpjAq' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 32 'GetPodConfig' test.out

#- 33 CreatePodConfig
./ng net.accelbyte.sdk.cli.Main dsmc createPodConfig \
    --name 'SY8LtjvA' \
    --namespace "$AB_NAMESPACE" \
    --body '{"cpu_limit": 68, "mem_limit": 7, "params": "1gexhdls"}' \
    > test.out 2>&1
eval_tap $? 33 'CreatePodConfig' test.out

#- 34 DeletePodConfig
./ng net.accelbyte.sdk.cli.Main dsmc deletePodConfig \
    --name '2RhaxLRO' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 34 'DeletePodConfig' test.out

#- 35 UpdatePodConfig
./ng net.accelbyte.sdk.cli.Main dsmc updatePodConfig \
    --name 'PmFxBuEe' \
    --namespace "$AB_NAMESPACE" \
    --body '{"cpu_limit": 95, "mem_limit": 20, "name": "4ItAMAz8", "params": "OEU8UL5x"}' \
    > test.out 2>&1
eval_tap $? 35 'UpdatePodConfig' test.out

#- 36 AddPort
./ng net.accelbyte.sdk.cli.Main dsmc addPort \
    --name 'oiTVzpvQ' \
    --namespace "$AB_NAMESPACE" \
    --body '{"port": 21}' \
    > test.out 2>&1
eval_tap $? 36 'AddPort' test.out

#- 37 DeletePort
./ng net.accelbyte.sdk.cli.Main dsmc deletePort \
    --name 'tHwzXp6Q' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 37 'DeletePort' test.out

#- 38 UpdatePort
./ng net.accelbyte.sdk.cli.Main dsmc updatePort \
    --name 'aD2KdDrV' \
    --namespace "$AB_NAMESPACE" \
    --body '{"name": "5WKaewk1", "port": 67}' \
    > test.out 2>&1
eval_tap $? 38 'UpdatePort' test.out

#- 39 ListImages
./ng net.accelbyte.sdk.cli.Main dsmc listImages \
    --namespace "$AB_NAMESPACE" \
    --q 'Cz5pxYuF' \
    --sortBy 'updatedAt' \
    --sortDirection 'desc' \
    --count '29' \
    --offset '91' \
    > test.out 2>&1
eval_tap $? 39 'ListImages' test.out

#- 40 DeleteImage
./ng net.accelbyte.sdk.cli.Main dsmc deleteImage \
    --namespace "$AB_NAMESPACE" \
    --imageURI 'pVXsJMpU' \
    --version 'vCbYo86c' \
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
    --imageURI 'i8LRn9zk' \
    --version 'k9Nb1Dvr' \
    --versionPatch 'LG9Mk48B' \
    > test.out 2>&1
eval_tap $? 42 'DeleteImagePatch' test.out

#- 43 GetImageDetail
./ng net.accelbyte.sdk.cli.Main dsmc getImageDetail \
    --namespace "$AB_NAMESPACE" \
    --version 'CBNnR5Ph' \
    > test.out 2>&1
eval_tap $? 43 'GetImageDetail' test.out

#- 44 GetImagePatches
./ng net.accelbyte.sdk.cli.Main dsmc getImagePatches \
    --namespace "$AB_NAMESPACE" \
    --version 'PGiI6lH7' \
    > test.out 2>&1
eval_tap $? 44 'GetImagePatches' test.out

#- 45 GetImagePatchDetail
./ng net.accelbyte.sdk.cli.Main dsmc getImagePatchDetail \
    --namespace "$AB_NAMESPACE" \
    --version '1ah5L4Da' \
    --versionPatch 'WSOlr3v7' \
    > test.out 2>&1
eval_tap $? 45 'GetImagePatchDetail' test.out

#- 46 AddBuffer
./ng net.accelbyte.sdk.cli.Main dsmc addBuffer \
    --namespace "$AB_NAMESPACE" \
    --body '{"AllocCount": 98, "DeploymentName": "3lJOoIRb", "JobCount": 13, "JobPriority": 100, "OverrideVersion": "KIrHy5J2", "Region": "n54c0zwB"}' \
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
    --region 'N7CbBdyO' \
    --count '43' \
    --offset '30' \
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
    --region 'gDCTAZp3' \
    > test.out 2>&1
eval_tap $? 50 'CountServerDetailed' test.out

#- 51 ListLocalServer
./ng net.accelbyte.sdk.cli.Main dsmc listLocalServer \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 51 'ListLocalServer' test.out

#- 52 DeleteLocalServer
./ng net.accelbyte.sdk.cli.Main dsmc deleteLocalServer \
    --name 'TXhJjyV8' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 52 'DeleteLocalServer' test.out

#- 53 GetServer
./ng net.accelbyte.sdk.cli.Main dsmc getServer \
    --namespace "$AB_NAMESPACE" \
    --podName 'OT8ccZXU' \
    > test.out 2>&1
eval_tap $? 53 'GetServer' test.out

#- 54 DeleteServer
./ng net.accelbyte.sdk.cli.Main dsmc deleteServer \
    --namespace "$AB_NAMESPACE" \
    --podName 'h11CKu3o' \
    > test.out 2>&1
eval_tap $? 54 'DeleteServer' test.out

#- 55 ListSession
./ng net.accelbyte.sdk.cli.Main dsmc listSession \
    --namespace "$AB_NAMESPACE" \
    --region 'IRZbsR5r' \
    --withServer  \
    --count '60' \
    --offset '20' \
    > test.out 2>&1
eval_tap $? 55 'ListSession' test.out

#- 56 CountSession
./ng net.accelbyte.sdk.cli.Main dsmc countSession \
    --namespace "$AB_NAMESPACE" \
    --region '2zdM3EiK' \
    > test.out 2>&1
eval_tap $? 56 'CountSession' test.out

#- 57 DeleteSession
./ng net.accelbyte.sdk.cli.Main dsmc deleteSession \
    --namespace "$AB_NAMESPACE" \
    --sessionID 'abWbSeo7' \
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
    --body '{"JobCount": 4, "Region": "ekns90Za", "TimeoutSecond": 65, "ZombieCount": 30}' \
    > test.out 2>&1
eval_tap $? 59 'RunZombieCleanerRequestHandler' test.out

#- 60 CreateRepository
./ng net.accelbyte.sdk.cli.Main dsmc createRepository \
    --body '{"namespace": "5fzaDg2k", "repository": "tSItGwzw"}' \
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
    --name 'aHGUgExe' \
    --count '72' \
    --offset '45' \
    > test.out 2>&1
eval_tap $? 63 'GetAllDeploymentClient' test.out

#- 64 GetDeploymentClient
./ng net.accelbyte.sdk.cli.Main dsmc getDeploymentClient \
    --deployment 'o6k0fa2p' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 64 'GetDeploymentClient' test.out

#- 65 CreateDeploymentClient
./ng net.accelbyte.sdk.cli.Main dsmc createDeploymentClient \
    --deployment 'XQUWfYRH' \
    --namespace "$AB_NAMESPACE" \
    --body '{"allow_version_override": false, "buffer_count": 60, "buffer_percent": 93, "configuration": "k7d6TTqR", "enable_region_overrides": false, "extendable_session": true, "game_version": "j2M6ITnq", "max_count": 65, "min_count": 89, "overrides": {"uWW4FZgK": {"buffer_count": 30, "buffer_percent": 50, "configuration": "W7skPqK9", "enable_region_overrides": true, "extendable_session": true, "game_version": "6Tchv7mE", "max_count": 89, "min_count": 7, "name": "B9gVbMsT", "region_overrides": {"zkkRlbOv": {"buffer_count": 17, "buffer_percent": 9, "max_count": 88, "min_count": 82, "name": "eR1gocli", "unlimited": true, "use_buffer_percent": false}, "dEHuCzMf": {"buffer_count": 71, "buffer_percent": 46, "max_count": 47, "min_count": 69, "name": "kreHaoCl", "unlimited": false, "use_buffer_percent": false}, "krV2IRX9": {"buffer_count": 48, "buffer_percent": 23, "max_count": 58, "min_count": 19, "name": "nTtRL25I", "unlimited": true, "use_buffer_percent": true}}, "regions": ["RASjgxyW", "AdB3JREa", "EHUC5OzG"], "session_timeout": 41, "unlimited": true, "use_buffer_percent": true}, "bNUjRzZ0": {"buffer_count": 67, "buffer_percent": 7, "configuration": "TH1MTykx", "enable_region_overrides": true, "extendable_session": false, "game_version": "5o5WuCv3", "max_count": 46, "min_count": 97, "name": "zsEgzDNW", "region_overrides": {"id5iv1zj": {"buffer_count": 100, "buffer_percent": 47, "max_count": 12, "min_count": 71, "name": "hrnxzvWL", "unlimited": true, "use_buffer_percent": true}, "gfun4PqD": {"buffer_count": 89, "buffer_percent": 10, "max_count": 6, "min_count": 1, "name": "yQhNkaSU", "unlimited": true, "use_buffer_percent": false}, "O04Agqge": {"buffer_count": 29, "buffer_percent": 44, "max_count": 88, "min_count": 87, "name": "4WqUHaXU", "unlimited": false, "use_buffer_percent": true}}, "regions": ["IGrIBxl0", "MMGk1zx1", "w3O9y3Kn"], "session_timeout": 56, "unlimited": false, "use_buffer_percent": true}, "kGNHYlDu": {"buffer_count": 6, "buffer_percent": 55, "configuration": "QwdnNmit", "enable_region_overrides": false, "extendable_session": false, "game_version": "rDCJKfkQ", "max_count": 82, "min_count": 1, "name": "rMNLIdF2", "region_overrides": {"681llX4j": {"buffer_count": 97, "buffer_percent": 56, "max_count": 62, "min_count": 40, "name": "VPV24rYp", "unlimited": false, "use_buffer_percent": true}, "tfGDNFfX": {"buffer_count": 7, "buffer_percent": 68, "max_count": 15, "min_count": 100, "name": "vnBjjstz", "unlimited": false, "use_buffer_percent": false}, "GduQ4XKj": {"buffer_count": 33, "buffer_percent": 11, "max_count": 85, "min_count": 90, "name": "AfGOzYri", "unlimited": false, "use_buffer_percent": true}}, "regions": ["B2ZleT2X", "GphgooVZ", "ELRFpS4Q"], "session_timeout": 42, "unlimited": true, "use_buffer_percent": true}}, "region_overrides": {"K1v2kSqa": {"buffer_count": 62, "buffer_percent": 75, "max_count": 38, "min_count": 82, "name": "tyNQymKZ", "unlimited": true, "use_buffer_percent": true}, "tbW2XBNd": {"buffer_count": 91, "buffer_percent": 39, "max_count": 88, "min_count": 43, "name": "pczKnAQV", "unlimited": false, "use_buffer_percent": false}, "nJ90qbFc": {"buffer_count": 54, "buffer_percent": 76, "max_count": 99, "min_count": 9, "name": "w0ZJ0jt2", "unlimited": false, "use_buffer_percent": false}}, "regions": ["ID20C3u0", "viPjgdff", "g9IGrqVY"], "session_timeout": 78, "unlimited": false, "use_buffer_percent": false}' \
    > test.out 2>&1
eval_tap $? 65 'CreateDeploymentClient' test.out

#- 66 DeleteDeploymentClient
./ng net.accelbyte.sdk.cli.Main dsmc deleteDeploymentClient \
    --deployment 'OX7rgAXx' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 66 'DeleteDeploymentClient' test.out

#- 67 GetAllPodConfigClient
./ng net.accelbyte.sdk.cli.Main dsmc getAllPodConfigClient \
    --namespace "$AB_NAMESPACE" \
    --count '60' \
    --offset '37' \
    > test.out 2>&1
eval_tap $? 67 'GetAllPodConfigClient' test.out

#- 68 CreatePodConfigClient
./ng net.accelbyte.sdk.cli.Main dsmc createPodConfigClient \
    --name 'dIdMd4rl' \
    --namespace "$AB_NAMESPACE" \
    --body '{"cpu_limit": 49, "mem_limit": 91, "params": "xuagicA0"}' \
    > test.out 2>&1
eval_tap $? 68 'CreatePodConfigClient' test.out

#- 69 DeletePodConfigClient
./ng net.accelbyte.sdk.cli.Main dsmc deletePodConfigClient \
    --name 'AJXIbUKd' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 69 'DeletePodConfigClient' test.out

#- 70 ListImagesClient
./ng net.accelbyte.sdk.cli.Main dsmc listImagesClient \
    --namespace "$AB_NAMESPACE" \
    --count '21' \
    --offset '47' \
    --q 'ElBI66vg' \
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
    --version 'JmsLf9aA' \
    > test.out 2>&1
eval_tap $? 72 'ImageDetailClient' test.out

#- 73 ListServerClient
./ng net.accelbyte.sdk.cli.Main dsmc listServerClient \
    --namespace "$AB_NAMESPACE" \
    --region 'puvwUz0N' \
    --count '81' \
    --offset '68' \
    > test.out 2>&1
eval_tap $? 73 'ListServerClient' test.out

#- 74 CountServerDetailedClient
./ng net.accelbyte.sdk.cli.Main dsmc countServerDetailedClient \
    --namespace "$AB_NAMESPACE" \
    --region 'FQHeyk2C' \
    > test.out 2>&1
eval_tap $? 74 'CountServerDetailedClient' test.out

#- 75 ServerHeartbeat
./ng net.accelbyte.sdk.cli.Main dsmc serverHeartbeat \
    --namespace "$AB_NAMESPACE" \
    --body '{"podName": "8ZaAftBw"}' \
    > test.out 2>&1
eval_tap $? 75 'ServerHeartbeat' test.out

#- 76 DeregisterLocalServer
./ng net.accelbyte.sdk.cli.Main dsmc deregisterLocalServer \
    --namespace "$AB_NAMESPACE" \
    --body '{"name": "VXJaoNU2"}' \
    > test.out 2>&1
eval_tap $? 76 'DeregisterLocalServer' test.out

#- 77 RegisterLocalServer
./ng net.accelbyte.sdk.cli.Main dsmc registerLocalServer \
    --namespace "$AB_NAMESPACE" \
    --body '{"custom_attribute": "UJ0xCXkC", "ip": "6cRV8JCT", "name": "652iJlNL", "port": 100}' \
    > test.out 2>&1
eval_tap $? 77 'RegisterLocalServer' test.out

#- 78 RegisterServer
./ng net.accelbyte.sdk.cli.Main dsmc registerServer \
    --namespace "$AB_NAMESPACE" \
    --body '{"custom_attribute": "8I7trxPl", "pod_name": "KHPgXMse"}' \
    > test.out 2>&1
eval_tap $? 78 'RegisterServer' test.out

#- 79 ShutdownServer
./ng net.accelbyte.sdk.cli.Main dsmc shutdownServer \
    --namespace "$AB_NAMESPACE" \
    --body '{"kill_me": false, "pod_name": "3Nf7HMV7"}' \
    > test.out 2>&1
eval_tap $? 79 'ShutdownServer' test.out

#- 80 GetServerSessionTimeout
./ng net.accelbyte.sdk.cli.Main dsmc getServerSessionTimeout \
    --namespace "$AB_NAMESPACE" \
    --podName 'wtVV7hDO' \
    > test.out 2>&1
eval_tap $? 80 'GetServerSessionTimeout' test.out

#- 81 GetServerSession
./ng net.accelbyte.sdk.cli.Main dsmc getServerSession \
    --namespace "$AB_NAMESPACE" \
    --podName 'W86M2HYC' \
    > test.out 2>&1
eval_tap $? 81 'GetServerSession' test.out

#- 82 CreateSession
./ng net.accelbyte.sdk.cli.Main dsmc createSession \
    --namespace "$AB_NAMESPACE" \
    --body '{"client_version": "t4b785FX", "configuration": "2hsNO8Xm", "deployment": "IPw6rUvi", "game_mode": "faUOhzPc", "matching_allies": [{"matching_parties": [{"party_attributes": {"7dIl94PJ": {}, "OVCAVush": {}, "YlswnRpa": {}}, "party_id": "UFqjGRIH", "party_members": [{"user_id": "qoTG8MDK"}, {"user_id": "x2pM4YbS"}, {"user_id": "h2JEw914"}]}, {"party_attributes": {"sodjA5WU": {}, "sOtyVloV": {}, "But8lsCi": {}}, "party_id": "gqdE1hCJ", "party_members": [{"user_id": "Xmywd9X9"}, {"user_id": "AtTE1Tmm"}, {"user_id": "jQPzWYN8"}]}, {"party_attributes": {"pkw9do0a": {}, "IPgLh9xP": {}, "SRN42vxG": {}}, "party_id": "6mYkxWgb", "party_members": [{"user_id": "DuxiY57Z"}, {"user_id": "fXl6gZgy"}, {"user_id": "8bqae1QD"}]}]}, {"matching_parties": [{"party_attributes": {"xF5VwxIj": {}, "iRCk4CeV": {}, "8FDAfUHn": {}}, "party_id": "SKY19OZW", "party_members": [{"user_id": "0ZtcV5y7"}, {"user_id": "zvo40pqD"}, {"user_id": "d4YvxOcr"}]}, {"party_attributes": {"j7d3aVhf": {}, "o0tVmp1o": {}, "6HSsRyQ1": {}}, "party_id": "gtT9KQXr", "party_members": [{"user_id": "8FNO9hGr"}, {"user_id": "iZgRGMww"}, {"user_id": "VeA3a0C4"}]}, {"party_attributes": {"dbTSLWyP": {}, "femRMqJh": {}, "FzQMzORs": {}}, "party_id": "0FQFRTVy", "party_members": [{"user_id": "2NnIkr4p"}, {"user_id": "6Nq8cuKB"}, {"user_id": "tZIggcRy"}]}]}, {"matching_parties": [{"party_attributes": {"ZD6M9Mu7": {}, "2ozdxKHo": {}, "hdyj1Dzf": {}}, "party_id": "8Wb6bXTo", "party_members": [{"user_id": "8N0ZWjJg"}, {"user_id": "5qt7wQ9K"}, {"user_id": "ZHgC0X8q"}]}, {"party_attributes": {"PjojJqS8": {}, "uJvPXsED": {}, "JbSFajDB": {}}, "party_id": "mGEY2MVQ", "party_members": [{"user_id": "dnB05JNL"}, {"user_id": "2nzawWmA"}, {"user_id": "hfPuP3Sj"}]}, {"party_attributes": {"TUeq2lEJ": {}, "8whZoDB9": {}, "JcE2mQl6": {}}, "party_id": "8fMb6Zpo", "party_members": [{"user_id": "g3I6Fk0d"}, {"user_id": "mGGR1eNZ"}, {"user_id": "wGixd19T"}]}]}], "namespace": "DCtMGb4e", "notification_payload": {}, "pod_name": "z3QGM1A9", "region": "tGqnxPRG", "session_id": "yQa3BeAa"}' \
    > test.out 2>&1
eval_tap $? 82 'CreateSession' test.out

#- 83 ClaimServer
./ng net.accelbyte.sdk.cli.Main dsmc claimServer \
    --namespace "$AB_NAMESPACE" \
    --body '{"game_mode": "1whL3iDw", "matching_allies": [{"matching_parties": [{"party_attributes": {"NpAq1zdw": {}, "0NwXZflF": {}, "JeBEV3rh": {}}, "party_id": "v5JpGA2t", "party_members": [{"user_id": "m5ria2b9"}, {"user_id": "e520XPnD"}, {"user_id": "cn0sjTOq"}]}, {"party_attributes": {"ckK7LcGW": {}, "eUWq7OKa": {}, "fAciibKd": {}}, "party_id": "iSVTK632", "party_members": [{"user_id": "9InHvCre"}, {"user_id": "tUynh5xy"}, {"user_id": "M6Ild7jU"}]}, {"party_attributes": {"zV2fxQlH": {}, "lh6XUH6M": {}, "q6OYRWKO": {}}, "party_id": "MUipzMLK", "party_members": [{"user_id": "GPiNyT2b"}, {"user_id": "lefoAt7Q"}, {"user_id": "vzyduSqR"}]}]}, {"matching_parties": [{"party_attributes": {"hhM3tNx3": {}, "asiYXfCN": {}, "XOGI8Es3": {}}, "party_id": "2vDxvfru", "party_members": [{"user_id": "FzxbpBBu"}, {"user_id": "ClkPZqkJ"}, {"user_id": "XydjnINT"}]}, {"party_attributes": {"cegHEV72": {}, "5aEYFgZH": {}, "qgzvVQvn": {}}, "party_id": "KOIWfpJo", "party_members": [{"user_id": "bOIDfbEK"}, {"user_id": "K7iE37WY"}, {"user_id": "3QICIGB0"}]}, {"party_attributes": {"f9RDqdVF": {}, "PpJscekz": {}, "UZjSWpMt": {}}, "party_id": "QVboV5FU", "party_members": [{"user_id": "i91WLR8l"}, {"user_id": "Zu6XKWI6"}, {"user_id": "bY4tlwwl"}]}]}, {"matching_parties": [{"party_attributes": {"o5jGoAwo": {}, "mxo5aJFF": {}, "wCQAy0Ff": {}}, "party_id": "BJSGmoLH", "party_members": [{"user_id": "H7KXvtY7"}, {"user_id": "xZskeOSS"}, {"user_id": "tQl1wlQq"}]}, {"party_attributes": {"55wfDxi6": {}, "DEEzP8fR": {}, "LkVtgVv9": {}}, "party_id": "PMh3n9J4", "party_members": [{"user_id": "sEs2IpBK"}, {"user_id": "ZOsuusDf"}, {"user_id": "0KS4XUs5"}]}, {"party_attributes": {"af5Nb3rH": {}, "iiy7KLfO": {}, "gVtEqRTv": {}}, "party_id": "dFkwC9JM", "party_members": [{"user_id": "68mbiaTF"}, {"user_id": "l2irbqrQ"}, {"user_id": "M0UaQ3qq"}]}]}], "namespace": "H8IESv1W", "notification_payload": {}, "session_id": "WZyYX9zS"}' \
    > test.out 2>&1
eval_tap $? 83 'ClaimServer' test.out

#- 84 GetSession
./ng net.accelbyte.sdk.cli.Main dsmc getSession \
    --namespace "$AB_NAMESPACE" \
    --sessionID 'TeV9ttt7' \
    > test.out 2>&1
eval_tap $? 84 'GetSession' test.out

#- 85 CancelSession
./ng net.accelbyte.sdk.cli.Main dsmc cancelSession \
    --namespace "$AB_NAMESPACE" \
    --sessionID '4DrccbnR' \
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
    --region 'wnl0MczA' \
    > test.out 2>&1
eval_tap $? 88 'ListProvidersByRegion' test.out

#- 89 PublicGetMessages
./ng net.accelbyte.sdk.cli.Main dsmc publicGetMessages \
    > test.out 2>&1
eval_tap $? 89 'PublicGetMessages' test.out


rm -f "tmp.dat"

exit $EXIT_CODE