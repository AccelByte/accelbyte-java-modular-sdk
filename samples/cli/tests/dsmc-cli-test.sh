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
    --body '{"artifactPath": "MbRUagZF", "coreDumpEnabled": false, "image": "Tzn6ExEh", "imageReplicationsMap": {"GQTLbBPt": {"failure_code": "tymmGjOq", "region": "lXYljGrB", "status": "GO8RrveK", "uri": "bpow3RtB"}, "6HGJgo6o": {"failure_code": "uVHJYn37", "region": "TRll0QmZ", "status": "YdcVkZZY", "uri": "TWYNHWLM"}, "boojRHCD": {"failure_code": "YtuSnuTL", "region": "ZAFBbuyh", "status": "8FCcau0U", "uri": "80ZKBnP4"}}, "namespace": "igJO8uUA", "patchVersion": "5Yl2rX0I", "persistent": true, "ulimitFileSize": 55, "version": "4mDnc1vQ"}' \
    > test.out 2>&1
eval_tap $? 4 'UpdateImage' test.out

#- 5 CreateImage
./ng net.accelbyte.sdk.cli.Main dsmc createImage \
    --body '{"artifactPath": "g3WHKlIC", "coreDumpEnabled": false, "dockerPath": "2Pd1YcRs", "image": "krd0ramC", "imageSize": 64, "namespace": "DtL9WYx2", "persistent": false, "ulimitFileSize": 71, "version": "ukbu3U5h"}' \
    > test.out 2>&1
eval_tap $? 5 'CreateImage' test.out

#- 6 CreateImagePatch
./ng net.accelbyte.sdk.cli.Main dsmc createImagePatch \
    --body '{"artifactPath": "HxhmiQsy", "coreDumpEnabled": false, "dockerPath": "srrDbcoF", "image": "nCjrpdOS", "imageSize": 63, "namespace": "qgtxKRpR", "patchVersion": "dEPvSTUR", "persistent": false, "ulimitFileSize": 5, "uploaderFlag": "BUaGJw02", "version": "hC2PDvKb"}' \
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
    --body '{"auto_deletion": false, "ghost_worker": false, "manual_buffer_override": false, "zombie_worker": false}' \
    > test.out 2>&1
eval_tap $? 9 'UpdateWorkerConfig' test.out

#- 10 CreateWorkerConfig
./ng net.accelbyte.sdk.cli.Main dsmc createWorkerConfig \
    --namespace "$AB_NAMESPACE" \
    --body '{"auto_deletion": false, "ghost_worker": true, "manual_buffer_override": false, "zombie_worker": false}' \
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
    --body '{"claim_timeout": 26, "creation_timeout": 14, "default_version": "ylPpYhUp", "port": 0, "ports": {"dF8yHPzp": 62, "2VDm6rVB": 71, "nqxapKi5": 94}, "protocol": "mLilaUGm", "providers": ["bGiy4a0i", "r7GBFcmc", "rhSRSiW9"], "session_timeout": 74, "unreachable_timeout": 92}' \
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
    --body '{"claim_timeout": 94, "creation_timeout": 89, "default_version": "B5FPBVTI", "port": 13, "protocol": "tRO4VMXT", "providers": ["QgDCgvXM", "NVTvs2nv", "bhPL4JyX"], "session_timeout": 72, "unreachable_timeout": 75}' \
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
    --name 'qSFK4xb6' \
    --count '89' \
    --offset '89' \
    > test.out 2>&1
eval_tap $? 16 'GetAllDeployment' test.out

#- 17 GetDeployment
./ng net.accelbyte.sdk.cli.Main dsmc getDeployment \
    --deployment 'MDW4y6mh' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 17 'GetDeployment' test.out

#- 18 CreateDeployment
./ng net.accelbyte.sdk.cli.Main dsmc createDeployment \
    --deployment 'zwZNXKHP' \
    --namespace "$AB_NAMESPACE" \
    --body '{"allow_version_override": true, "buffer_count": 68, "buffer_percent": 75, "configuration": "wKOdlGpQ", "enable_region_overrides": false, "extendable_session": true, "game_version": "NaQaFIr7", "max_count": 93, "min_count": 27, "overrides": {"CKwQ463a": {"buffer_count": 92, "buffer_percent": 98, "configuration": "DmeSHjyq", "enable_region_overrides": false, "extendable_session": true, "game_version": "IYUPVTon", "max_count": 56, "min_count": 17, "name": "37mrj2ZB", "region_overrides": {"c5ZH8xmO": {"buffer_count": 48, "buffer_percent": 53, "max_count": 0, "min_count": 59, "name": "QiXbX2iL", "unlimited": true, "use_buffer_percent": false}, "ABDptC11": {"buffer_count": 93, "buffer_percent": 63, "max_count": 75, "min_count": 56, "name": "u1fzaXRQ", "unlimited": true, "use_buffer_percent": false}, "VYtNOlo7": {"buffer_count": 18, "buffer_percent": 7, "max_count": 78, "min_count": 46, "name": "vkNmFiEq", "unlimited": false, "use_buffer_percent": true}}, "regions": ["7KG9JGYW", "ieKJmTBx", "NRs2ft3L"], "session_timeout": 90, "unlimited": true, "use_buffer_percent": true}, "XkP4erf9": {"buffer_count": 51, "buffer_percent": 77, "configuration": "uC8j8RVZ", "enable_region_overrides": false, "extendable_session": false, "game_version": "AKDo0s6Z", "max_count": 59, "min_count": 23, "name": "cOSIszwc", "region_overrides": {"UIK9Tdom": {"buffer_count": 98, "buffer_percent": 47, "max_count": 92, "min_count": 96, "name": "wgA9RadN", "unlimited": false, "use_buffer_percent": true}, "0Gm9m7kp": {"buffer_count": 96, "buffer_percent": 91, "max_count": 68, "min_count": 85, "name": "Y3ZIR9SV", "unlimited": true, "use_buffer_percent": false}, "ljUYPeMo": {"buffer_count": 16, "buffer_percent": 74, "max_count": 34, "min_count": 24, "name": "1D6cFfKj", "unlimited": false, "use_buffer_percent": true}}, "regions": ["LJV2X0Uz", "oAATJHpP", "DDS4lDQr"], "session_timeout": 96, "unlimited": true, "use_buffer_percent": true}, "SBIQkWlf": {"buffer_count": 83, "buffer_percent": 41, "configuration": "dXj2kYK3", "enable_region_overrides": false, "extendable_session": true, "game_version": "VPM4HcPh", "max_count": 85, "min_count": 20, "name": "y8dYcLRu", "region_overrides": {"vTVl40kI": {"buffer_count": 38, "buffer_percent": 71, "max_count": 26, "min_count": 45, "name": "6lMjV803", "unlimited": false, "use_buffer_percent": true}, "x9dzNaWv": {"buffer_count": 84, "buffer_percent": 47, "max_count": 69, "min_count": 81, "name": "Knfduf8J", "unlimited": false, "use_buffer_percent": false}, "yre1YqFu": {"buffer_count": 54, "buffer_percent": 13, "max_count": 100, "min_count": 28, "name": "6azYgmia", "unlimited": false, "use_buffer_percent": false}}, "regions": ["Lz2AJ8cx", "Ktf4rJRc", "VG6vS9rr"], "session_timeout": 0, "unlimited": true, "use_buffer_percent": false}}, "region_overrides": {"8C3xhSlo": {"buffer_count": 75, "buffer_percent": 80, "max_count": 36, "min_count": 80, "name": "lfegHakj", "unlimited": false, "use_buffer_percent": true}, "OezkbOAF": {"buffer_count": 84, "buffer_percent": 75, "max_count": 28, "min_count": 83, "name": "iYx0jbBb", "unlimited": true, "use_buffer_percent": false}, "qnGD2O9n": {"buffer_count": 9, "buffer_percent": 66, "max_count": 21, "min_count": 77, "name": "MfiUNaBd", "unlimited": false, "use_buffer_percent": true}}, "regions": ["6J2qxo6g", "G8yKqq3b", "uMZJRjwt"], "session_timeout": 90, "unlimited": true, "use_buffer_percent": true}' \
    > test.out 2>&1
eval_tap $? 18 'CreateDeployment' test.out

#- 19 DeleteDeployment
./ng net.accelbyte.sdk.cli.Main dsmc deleteDeployment \
    --deployment 'bqhYqWv7' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 19 'DeleteDeployment' test.out

#- 20 UpdateDeployment
./ng net.accelbyte.sdk.cli.Main dsmc updateDeployment \
    --deployment 'oPMstKUT' \
    --namespace "$AB_NAMESPACE" \
    --body '{"allow_version_override": true, "buffer_count": 5, "buffer_percent": 83, "configuration": "5h7O3XW9", "enable_region_overrides": true, "extendable_session": true, "game_version": "mdBcCsC9", "max_count": 3, "min_count": 45, "regions": ["KzndMSDt", "UJ0quMcG", "aIdTodoD"], "session_timeout": 16, "unlimited": true, "use_buffer_percent": true}' \
    > test.out 2>&1
eval_tap $? 20 'UpdateDeployment' test.out

#- 21 CreateRootRegionOverride
./ng net.accelbyte.sdk.cli.Main dsmc createRootRegionOverride \
    --deployment '7cnlL8Xw' \
    --namespace "$AB_NAMESPACE" \
    --region 'g3ZTdwdA' \
    --body '{"buffer_count": 20, "buffer_percent": 68, "max_count": 61, "min_count": 16, "unlimited": false, "use_buffer_percent": true}' \
    > test.out 2>&1
eval_tap $? 21 'CreateRootRegionOverride' test.out

#- 22 DeleteRootRegionOverride
./ng net.accelbyte.sdk.cli.Main dsmc deleteRootRegionOverride \
    --deployment 'WcBSEsDw' \
    --namespace "$AB_NAMESPACE" \
    --region 'cx86Tanw' \
    > test.out 2>&1
eval_tap $? 22 'DeleteRootRegionOverride' test.out

#- 23 UpdateRootRegionOverride
./ng net.accelbyte.sdk.cli.Main dsmc updateRootRegionOverride \
    --deployment 'BKU4NgBd' \
    --namespace "$AB_NAMESPACE" \
    --region '2z0pe7EQ' \
    --body '{"buffer_count": 35, "buffer_percent": 91, "max_count": 36, "min_count": 10, "unlimited": true, "use_buffer_percent": false}' \
    > test.out 2>&1
eval_tap $? 23 'UpdateRootRegionOverride' test.out

#- 24 CreateDeploymentOverride
./ng net.accelbyte.sdk.cli.Main dsmc createDeploymentOverride \
    --deployment 'US8Hgj3a' \
    --namespace "$AB_NAMESPACE" \
    --version 'TtwQJkhw' \
    --body '{"buffer_count": 99, "buffer_percent": 86, "configuration": "2cc3QYFd", "enable_region_overrides": false, "extendable_session": false, "game_version": "zmnPdXm3", "max_count": 3, "min_count": 92, "region_overrides": {"m5zGvitf": {"buffer_count": 0, "buffer_percent": 17, "max_count": 78, "min_count": 1, "name": "1icAGGSu", "unlimited": false, "use_buffer_percent": false}, "2evefNSt": {"buffer_count": 83, "buffer_percent": 29, "max_count": 3, "min_count": 86, "name": "lrvVyD3v", "unlimited": false, "use_buffer_percent": true}, "AWXfEMqE": {"buffer_count": 95, "buffer_percent": 89, "max_count": 38, "min_count": 99, "name": "rxYKrPqC", "unlimited": false, "use_buffer_percent": true}}, "regions": ["T82xQkQ0", "lDf2NDiE", "FToIe2Id"], "session_timeout": 42, "unlimited": false, "use_buffer_percent": true}' \
    > test.out 2>&1
eval_tap $? 24 'CreateDeploymentOverride' test.out

#- 25 DeleteDeploymentOverride
./ng net.accelbyte.sdk.cli.Main dsmc deleteDeploymentOverride \
    --deployment 'k6YznwR9' \
    --namespace "$AB_NAMESPACE" \
    --version 'cc8EGuHo' \
    > test.out 2>&1
eval_tap $? 25 'DeleteDeploymentOverride' test.out

#- 26 UpdateDeploymentOverride
./ng net.accelbyte.sdk.cli.Main dsmc updateDeploymentOverride \
    --deployment 'GTLa8TEF' \
    --namespace "$AB_NAMESPACE" \
    --version 'sGR40U0x' \
    --body '{"buffer_count": 98, "buffer_percent": 100, "configuration": "9t2xJezV", "enable_region_overrides": false, "game_version": "S2ZB5V3V", "max_count": 97, "min_count": 5, "regions": ["8ibsu72o", "CQQ9MvSS", "jzSrbr5D"], "session_timeout": 7, "unlimited": true, "use_buffer_percent": true}' \
    > test.out 2>&1
eval_tap $? 26 'UpdateDeploymentOverride' test.out

#- 27 CreateOverrideRegionOverride
./ng net.accelbyte.sdk.cli.Main dsmc createOverrideRegionOverride \
    --deployment 'UZr9Fy7n' \
    --namespace "$AB_NAMESPACE" \
    --region 'fu4VIi9b' \
    --version 'kT11UwEH' \
    --body '{"buffer_count": 3, "buffer_percent": 39, "max_count": 58, "min_count": 29, "unlimited": true, "use_buffer_percent": false}' \
    > test.out 2>&1
eval_tap $? 27 'CreateOverrideRegionOverride' test.out

#- 28 DeleteOverrideRegionOverride
./ng net.accelbyte.sdk.cli.Main dsmc deleteOverrideRegionOverride \
    --deployment 'MIWIatPQ' \
    --namespace "$AB_NAMESPACE" \
    --region '7Nf5GtLS' \
    --version 'AWXrIFxT' \
    > test.out 2>&1
eval_tap $? 28 'DeleteOverrideRegionOverride' test.out

#- 29 UpdateOverrideRegionOverride
./ng net.accelbyte.sdk.cli.Main dsmc updateOverrideRegionOverride \
    --deployment 'HkYJoHwz' \
    --namespace "$AB_NAMESPACE" \
    --region 'GlQocC7K' \
    --version '85oSaM6H' \
    --body '{"buffer_count": 90, "buffer_percent": 84, "max_count": 9, "min_count": 39, "unlimited": true, "use_buffer_percent": false}' \
    > test.out 2>&1
eval_tap $? 29 'UpdateOverrideRegionOverride' test.out

#- 30 DeleteCreatingServerCountQueue
./ng net.accelbyte.sdk.cli.Main dsmc deleteCreatingServerCountQueue \
    --deployment 'INghuaLv' \
    --namespace "$AB_NAMESPACE" \
    --version 'rGHd2dA4' \
    > test.out 2>&1
eval_tap $? 30 'DeleteCreatingServerCountQueue' test.out

#- 31 GetAllPodConfig
./ng net.accelbyte.sdk.cli.Main dsmc getAllPodConfig \
    --namespace "$AB_NAMESPACE" \
    --count '59' \
    --offset '73' \
    > test.out 2>&1
eval_tap $? 31 'GetAllPodConfig' test.out

#- 32 GetPodConfig
./ng net.accelbyte.sdk.cli.Main dsmc getPodConfig \
    --name 'yZo1Pbj2' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 32 'GetPodConfig' test.out

#- 33 CreatePodConfig
./ng net.accelbyte.sdk.cli.Main dsmc createPodConfig \
    --name 'AIyFG9El' \
    --namespace "$AB_NAMESPACE" \
    --body '{"cpu_limit": 42, "mem_limit": 78, "params": "vxBRytQe"}' \
    > test.out 2>&1
eval_tap $? 33 'CreatePodConfig' test.out

#- 34 DeletePodConfig
./ng net.accelbyte.sdk.cli.Main dsmc deletePodConfig \
    --name 'icHKJacE' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 34 'DeletePodConfig' test.out

#- 35 UpdatePodConfig
./ng net.accelbyte.sdk.cli.Main dsmc updatePodConfig \
    --name '3O5qEDjy' \
    --namespace "$AB_NAMESPACE" \
    --body '{"cpu_limit": 43, "mem_limit": 52, "name": "QJFYI2eA", "params": "HuiOv3CK"}' \
    > test.out 2>&1
eval_tap $? 35 'UpdatePodConfig' test.out

#- 36 AddPort
./ng net.accelbyte.sdk.cli.Main dsmc addPort \
    --name 'olz4bIGt' \
    --namespace "$AB_NAMESPACE" \
    --body '{"port": 41}' \
    > test.out 2>&1
eval_tap $? 36 'AddPort' test.out

#- 37 DeletePort
./ng net.accelbyte.sdk.cli.Main dsmc deletePort \
    --name 'SP990Cls' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 37 'DeletePort' test.out

#- 38 UpdatePort
./ng net.accelbyte.sdk.cli.Main dsmc updatePort \
    --name 'Me9bp1BH' \
    --namespace "$AB_NAMESPACE" \
    --body '{"name": "hgn7QLoC", "port": 33}' \
    > test.out 2>&1
eval_tap $? 38 'UpdatePort' test.out

#- 39 ListImages
./ng net.accelbyte.sdk.cli.Main dsmc listImages \
    --namespace "$AB_NAMESPACE" \
    --q 'ZajGCnW6' \
    --sortBy 'version' \
    --sortDirection 'asc' \
    --count '22' \
    --offset '22' \
    > test.out 2>&1
eval_tap $? 39 'ListImages' test.out

#- 40 DeleteImage
./ng net.accelbyte.sdk.cli.Main dsmc deleteImage \
    --namespace "$AB_NAMESPACE" \
    --imageURI 'hEMUhAJp' \
    --version 'B2kZPv5C' \
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
    --imageURI 'yFCnQtzO' \
    --version 'pjubUhpq' \
    --versionPatch 'lW7b81hS' \
    > test.out 2>&1
eval_tap $? 42 'DeleteImagePatch' test.out

#- 43 GetImageDetail
./ng net.accelbyte.sdk.cli.Main dsmc getImageDetail \
    --namespace "$AB_NAMESPACE" \
    --version 'EkxzNmRx' \
    > test.out 2>&1
eval_tap $? 43 'GetImageDetail' test.out

#- 44 GetImagePatches
./ng net.accelbyte.sdk.cli.Main dsmc getImagePatches \
    --namespace "$AB_NAMESPACE" \
    --version 'GVY63fIH' \
    > test.out 2>&1
eval_tap $? 44 'GetImagePatches' test.out

#- 45 GetImagePatchDetail
./ng net.accelbyte.sdk.cli.Main dsmc getImagePatchDetail \
    --namespace "$AB_NAMESPACE" \
    --version 'zZCLTYWX' \
    --versionPatch 'FBGSVbiD' \
    > test.out 2>&1
eval_tap $? 45 'GetImagePatchDetail' test.out

#- 46 AddBuffer
./ng net.accelbyte.sdk.cli.Main dsmc addBuffer \
    --namespace "$AB_NAMESPACE" \
    --body '{"AllocCount": 40, "DeploymentName": "q272J2NF", "JobCount": 45, "JobPriority": 57, "OverrideVersion": "jj4Qefa9", "Region": "x4BBbJLF"}' \
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
    --region '261IP7LC' \
    --count '61' \
    --offset '100' \
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
    --region '1NS2zZ3d' \
    > test.out 2>&1
eval_tap $? 50 'CountServerDetailed' test.out

#- 51 ListLocalServer
./ng net.accelbyte.sdk.cli.Main dsmc listLocalServer \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 51 'ListLocalServer' test.out

#- 52 DeleteLocalServer
./ng net.accelbyte.sdk.cli.Main dsmc deleteLocalServer \
    --name 'fZpv32v7' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 52 'DeleteLocalServer' test.out

#- 53 GetServer
./ng net.accelbyte.sdk.cli.Main dsmc getServer \
    --namespace "$AB_NAMESPACE" \
    --podName 'Kfgcu6vU' \
    > test.out 2>&1
eval_tap $? 53 'GetServer' test.out

#- 54 DeleteServer
./ng net.accelbyte.sdk.cli.Main dsmc deleteServer \
    --namespace "$AB_NAMESPACE" \
    --podName 'zPgSvzcY' \
    > test.out 2>&1
eval_tap $? 54 'DeleteServer' test.out

#- 55 ListSession
./ng net.accelbyte.sdk.cli.Main dsmc listSession \
    --namespace "$AB_NAMESPACE" \
    --region 'MZuuDuOQ' \
    --withServer  \
    --count '56' \
    --offset '41' \
    > test.out 2>&1
eval_tap $? 55 'ListSession' test.out

#- 56 CountSession
./ng net.accelbyte.sdk.cli.Main dsmc countSession \
    --namespace "$AB_NAMESPACE" \
    --region 'GH646Y8X' \
    > test.out 2>&1
eval_tap $? 56 'CountSession' test.out

#- 57 DeleteSession
./ng net.accelbyte.sdk.cli.Main dsmc deleteSession \
    --namespace "$AB_NAMESPACE" \
    --sessionID 'J0FUmGK0' \
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
    --body '{"JobCount": 87, "Region": "PI5Vx1Il", "TimeoutSecond": 76, "ZombieCount": 87}' \
    > test.out 2>&1
eval_tap $? 59 'RunZombieCleanerRequestHandler' test.out

#- 60 CreateRepository
./ng net.accelbyte.sdk.cli.Main dsmc createRepository \
    --body '{"namespace": "clD6c85r", "repository": "yWj6d5WV"}' \
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
    --name 'BcrMI4Em' \
    --count '34' \
    --offset '28' \
    > test.out 2>&1
eval_tap $? 63 'GetAllDeploymentClient' test.out

#- 64 GetDeploymentClient
./ng net.accelbyte.sdk.cli.Main dsmc getDeploymentClient \
    --deployment 'KpRegc8i' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 64 'GetDeploymentClient' test.out

#- 65 CreateDeploymentClient
./ng net.accelbyte.sdk.cli.Main dsmc createDeploymentClient \
    --deployment 'VLciefw1' \
    --namespace "$AB_NAMESPACE" \
    --body '{"allow_version_override": true, "buffer_count": 90, "buffer_percent": 63, "configuration": "sWVBjtTI", "enable_region_overrides": true, "extendable_session": true, "game_version": "ValMfkte", "max_count": 94, "min_count": 45, "overrides": {"COEip9GP": {"buffer_count": 37, "buffer_percent": 66, "configuration": "z8o8K4nW", "enable_region_overrides": false, "extendable_session": false, "game_version": "FYZEjbjs", "max_count": 48, "min_count": 37, "name": "dfTH9NP4", "region_overrides": {"htBIPSFf": {"buffer_count": 0, "buffer_percent": 48, "max_count": 59, "min_count": 27, "name": "LhE2kUzH", "unlimited": false, "use_buffer_percent": false}, "PGWEgzEK": {"buffer_count": 66, "buffer_percent": 39, "max_count": 30, "min_count": 39, "name": "1XkPTqTl", "unlimited": true, "use_buffer_percent": false}, "pIk5WNy4": {"buffer_count": 96, "buffer_percent": 23, "max_count": 83, "min_count": 21, "name": "NvhWKOju", "unlimited": true, "use_buffer_percent": false}}, "regions": ["CdkerYiD", "1snoWRwm", "frc8Iylc"], "session_timeout": 14, "unlimited": true, "use_buffer_percent": true}, "zoUCmYP5": {"buffer_count": 81, "buffer_percent": 79, "configuration": "zkeJMFFk", "enable_region_overrides": true, "extendable_session": false, "game_version": "sfjr9YJy", "max_count": 42, "min_count": 15, "name": "4bUCasEy", "region_overrides": {"xVGjAY6R": {"buffer_count": 4, "buffer_percent": 47, "max_count": 81, "min_count": 59, "name": "jmnK2sfq", "unlimited": false, "use_buffer_percent": false}, "8WD73eYU": {"buffer_count": 55, "buffer_percent": 63, "max_count": 67, "min_count": 46, "name": "AfkkLpws", "unlimited": false, "use_buffer_percent": false}, "xRrgGPE0": {"buffer_count": 68, "buffer_percent": 34, "max_count": 82, "min_count": 41, "name": "Yr8bawm3", "unlimited": false, "use_buffer_percent": true}}, "regions": ["AKO3a2Mz", "Dsz45TD2", "bdM4aD8X"], "session_timeout": 15, "unlimited": false, "use_buffer_percent": true}, "C9Zr1cuw": {"buffer_count": 85, "buffer_percent": 9, "configuration": "tJP6M9EI", "enable_region_overrides": true, "extendable_session": true, "game_version": "WNtuM7ZY", "max_count": 91, "min_count": 58, "name": "lnwfm7Ad", "region_overrides": {"Hq0i9O0B": {"buffer_count": 78, "buffer_percent": 14, "max_count": 54, "min_count": 59, "name": "iwVZGJG5", "unlimited": false, "use_buffer_percent": true}, "wxyLlEbC": {"buffer_count": 88, "buffer_percent": 22, "max_count": 26, "min_count": 89, "name": "Yhl1FADa", "unlimited": false, "use_buffer_percent": false}, "u2Rco569": {"buffer_count": 76, "buffer_percent": 13, "max_count": 63, "min_count": 22, "name": "HaGLjEQs", "unlimited": false, "use_buffer_percent": false}}, "regions": ["RYC4N5jt", "zstUEqcm", "nUNOXedd"], "session_timeout": 60, "unlimited": true, "use_buffer_percent": false}}, "region_overrides": {"g5dHiIKX": {"buffer_count": 92, "buffer_percent": 34, "max_count": 86, "min_count": 39, "name": "yJhuLgBi", "unlimited": true, "use_buffer_percent": true}, "i2knIAOC": {"buffer_count": 3, "buffer_percent": 98, "max_count": 88, "min_count": 20, "name": "9O9RqRAf", "unlimited": true, "use_buffer_percent": true}, "HyQiPn7V": {"buffer_count": 61, "buffer_percent": 75, "max_count": 8, "min_count": 26, "name": "ErALhrVr", "unlimited": true, "use_buffer_percent": true}}, "regions": ["N6LkpEnK", "nkSDUBlG", "ki0uXZUF"], "session_timeout": 56, "unlimited": false, "use_buffer_percent": false}' \
    > test.out 2>&1
eval_tap $? 65 'CreateDeploymentClient' test.out

#- 66 DeleteDeploymentClient
./ng net.accelbyte.sdk.cli.Main dsmc deleteDeploymentClient \
    --deployment 'DBA7c8h3' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 66 'DeleteDeploymentClient' test.out

#- 67 GetAllPodConfigClient
./ng net.accelbyte.sdk.cli.Main dsmc getAllPodConfigClient \
    --namespace "$AB_NAMESPACE" \
    --count '76' \
    --offset '21' \
    > test.out 2>&1
eval_tap $? 67 'GetAllPodConfigClient' test.out

#- 68 CreatePodConfigClient
./ng net.accelbyte.sdk.cli.Main dsmc createPodConfigClient \
    --name 'u8nrRiwC' \
    --namespace "$AB_NAMESPACE" \
    --body '{"cpu_limit": 20, "mem_limit": 93, "params": "op6HQoYz"}' \
    > test.out 2>&1
eval_tap $? 68 'CreatePodConfigClient' test.out

#- 69 DeletePodConfigClient
./ng net.accelbyte.sdk.cli.Main dsmc deletePodConfigClient \
    --name 'GEyCRkXY' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 69 'DeletePodConfigClient' test.out

#- 70 ListImagesClient
./ng net.accelbyte.sdk.cli.Main dsmc listImagesClient \
    --namespace "$AB_NAMESPACE" \
    --count '80' \
    --offset '46' \
    --q 'nwjqZ3vf' \
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
    --version 'wM0odmRy' \
    > test.out 2>&1
eval_tap $? 72 'ImageDetailClient' test.out

#- 73 ListServerClient
./ng net.accelbyte.sdk.cli.Main dsmc listServerClient \
    --namespace "$AB_NAMESPACE" \
    --region 'Qadr7ZKv' \
    --count '59' \
    --offset '49' \
    > test.out 2>&1
eval_tap $? 73 'ListServerClient' test.out

#- 74 CountServerDetailedClient
./ng net.accelbyte.sdk.cli.Main dsmc countServerDetailedClient \
    --namespace "$AB_NAMESPACE" \
    --region 'TkRyBEk6' \
    > test.out 2>&1
eval_tap $? 74 'CountServerDetailedClient' test.out

#- 75 ServerHeartbeat
./ng net.accelbyte.sdk.cli.Main dsmc serverHeartbeat \
    --namespace "$AB_NAMESPACE" \
    --body '{"podName": "7yswX6ts"}' \
    > test.out 2>&1
eval_tap $? 75 'ServerHeartbeat' test.out

#- 76 DeregisterLocalServer
./ng net.accelbyte.sdk.cli.Main dsmc deregisterLocalServer \
    --namespace "$AB_NAMESPACE" \
    --body '{"name": "lc7exvDK"}' \
    > test.out 2>&1
eval_tap $? 76 'DeregisterLocalServer' test.out

#- 77 RegisterLocalServer
./ng net.accelbyte.sdk.cli.Main dsmc registerLocalServer \
    --namespace "$AB_NAMESPACE" \
    --body '{"custom_attribute": "ujSKJaZo", "ip": "Aip4ZFR2", "name": "ExiP4GMD", "port": 48}' \
    > test.out 2>&1
eval_tap $? 77 'RegisterLocalServer' test.out

#- 78 RegisterServer
./ng net.accelbyte.sdk.cli.Main dsmc registerServer \
    --namespace "$AB_NAMESPACE" \
    --body '{"custom_attribute": "hSSE5w21", "pod_name": "MLoAfeHY"}' \
    > test.out 2>&1
eval_tap $? 78 'RegisterServer' test.out

#- 79 ShutdownServer
./ng net.accelbyte.sdk.cli.Main dsmc shutdownServer \
    --namespace "$AB_NAMESPACE" \
    --body '{"kill_me": true, "pod_name": "XxAL5s6Y"}' \
    > test.out 2>&1
eval_tap $? 79 'ShutdownServer' test.out

#- 80 GetServerSessionTimeout
./ng net.accelbyte.sdk.cli.Main dsmc getServerSessionTimeout \
    --namespace "$AB_NAMESPACE" \
    --podName 'bqIqKAKl' \
    > test.out 2>&1
eval_tap $? 80 'GetServerSessionTimeout' test.out

#- 81 GetServerSession
./ng net.accelbyte.sdk.cli.Main dsmc getServerSession \
    --namespace "$AB_NAMESPACE" \
    --podName '7cvXnuoD' \
    > test.out 2>&1
eval_tap $? 81 'GetServerSession' test.out

#- 82 CreateSession
./ng net.accelbyte.sdk.cli.Main dsmc createSession \
    --namespace "$AB_NAMESPACE" \
    --body '{"client_version": "O8mfLjWx", "configuration": "3GIJaeVq", "deployment": "ZiDXyC3U", "game_mode": "7ZaPl9YL", "matching_allies": [{"matching_parties": [{"party_attributes": {"u06nP1pg": {}, "8KSgpCSg": {}, "3tKXKT7r": {}}, "party_id": "x4nsiNqB", "party_members": [{"user_id": "ezVJ6ouO"}, {"user_id": "xehuOVYh"}, {"user_id": "LBi6w83S"}]}, {"party_attributes": {"jB9bmTcM": {}, "MDjXVoeR": {}, "2cGALLB5": {}}, "party_id": "T2P2rAN8", "party_members": [{"user_id": "nLEvqTzI"}, {"user_id": "MVWfmJWY"}, {"user_id": "Il5mu9Xn"}]}, {"party_attributes": {"tsoY2ZeF": {}, "fH6czqIG": {}, "wZ7ilrF7": {}}, "party_id": "vjhaP9bX", "party_members": [{"user_id": "amD4UX5S"}, {"user_id": "gQeBoVM5"}, {"user_id": "XkwjFr2H"}]}]}, {"matching_parties": [{"party_attributes": {"sbu3upyR": {}, "NthVZ7tQ": {}, "rteUW41D": {}}, "party_id": "vyB1DSPH", "party_members": [{"user_id": "9JCCLEwZ"}, {"user_id": "Xit3HHdB"}, {"user_id": "r8SvbU6E"}]}, {"party_attributes": {"QSGq5xyH": {}, "iuVjLGUr": {}, "mcZcRkDV": {}}, "party_id": "JeYsCJwU", "party_members": [{"user_id": "Z5mm409u"}, {"user_id": "fHPk04xs"}, {"user_id": "g7zeu5jL"}]}, {"party_attributes": {"x7nIsU8l": {}, "dB8nfyp7": {}, "Tur1iY1C": {}}, "party_id": "GXQ6QS48", "party_members": [{"user_id": "NbiHSYzu"}, {"user_id": "QSuzjgej"}, {"user_id": "wmxxrfMW"}]}]}, {"matching_parties": [{"party_attributes": {"6T1UdieU": {}, "O1RI7CmX": {}, "TH5PYzyt": {}}, "party_id": "TDBMOr9j", "party_members": [{"user_id": "TjKXvCrZ"}, {"user_id": "zGWPQYBo"}, {"user_id": "xGUxxOuK"}]}, {"party_attributes": {"6GAvZrcc": {}, "4YeHN2s5": {}, "UUvwqRIJ": {}}, "party_id": "Xt6OkgHV", "party_members": [{"user_id": "h8BN8XI1"}, {"user_id": "3UCSkDQe"}, {"user_id": "pBfuSLjQ"}]}, {"party_attributes": {"BXlFGeur": {}, "BF5r3Ucu": {}, "JbnpDOpN": {}}, "party_id": "GFfmxuUg", "party_members": [{"user_id": "e7gvbNme"}, {"user_id": "AP7lixXn"}, {"user_id": "Sxl4Latz"}]}]}], "namespace": "W8IBsbmb", "notification_payload": {}, "pod_name": "l4rPFC4K", "region": "jvo4NVtN", "session_id": "sOHhwkmd"}' \
    > test.out 2>&1
eval_tap $? 82 'CreateSession' test.out

#- 83 ClaimServer
./ng net.accelbyte.sdk.cli.Main dsmc claimServer \
    --namespace "$AB_NAMESPACE" \
    --body '{"game_mode": "KmzAzvOO", "matching_allies": [{"matching_parties": [{"party_attributes": {"KbAenHuz": {}, "nbyQFAXJ": {}, "4vaKEQyE": {}}, "party_id": "m1mjQIK8", "party_members": [{"user_id": "7hZ8h8t1"}, {"user_id": "MqnnUChE"}, {"user_id": "3aHoiZ7D"}]}, {"party_attributes": {"FOn7Zwwg": {}, "NRzTlWfZ": {}, "rPkh8I2Q": {}}, "party_id": "2Kg5DYdT", "party_members": [{"user_id": "c3r35nx8"}, {"user_id": "H0l2KUx6"}, {"user_id": "MHYNkzr9"}]}, {"party_attributes": {"sFrRUFnM": {}, "cgl7D5gC": {}, "I0dc5hHW": {}}, "party_id": "3Z3BOOwB", "party_members": [{"user_id": "gz83FwRb"}, {"user_id": "dVJsDRdZ"}, {"user_id": "LTWtfoWe"}]}]}, {"matching_parties": [{"party_attributes": {"5rU6Qn7Z": {}, "sSSd7HmD": {}, "CJAauWw6": {}}, "party_id": "WlWag27N", "party_members": [{"user_id": "K3OqBDHn"}, {"user_id": "C5LUg2jB"}, {"user_id": "2y2UMPkc"}]}, {"party_attributes": {"xmsFepOh": {}, "flmzav3V": {}, "Eud5zyTB": {}}, "party_id": "O4ntuQhS", "party_members": [{"user_id": "ajDN91Df"}, {"user_id": "2Cx2zKev"}, {"user_id": "oN5nynPH"}]}, {"party_attributes": {"1RvPuOvi": {}, "IVlCZBqa": {}, "soNJlDIC": {}}, "party_id": "Lq8V2BFt", "party_members": [{"user_id": "aONsofIH"}, {"user_id": "rkCVmRAy"}, {"user_id": "YXg5wzy6"}]}]}, {"matching_parties": [{"party_attributes": {"FKZKhQ3G": {}, "n4m4r6w7": {}, "k1hXRSa1": {}}, "party_id": "uQvs1CRM", "party_members": [{"user_id": "PhI9VqGm"}, {"user_id": "zk6zDZiF"}, {"user_id": "cvEju36v"}]}, {"party_attributes": {"npwIhEQ6": {}, "GEWmoaJF": {}, "6yixl9vc": {}}, "party_id": "hWW15mVe", "party_members": [{"user_id": "6i1cS0Jq"}, {"user_id": "Oa42AJkf"}, {"user_id": "iOKJhERh"}]}, {"party_attributes": {"xv70kaXg": {}, "oPNiTHgU": {}, "jyCxgU7q": {}}, "party_id": "8enYBA0V", "party_members": [{"user_id": "YMKLqC2q"}, {"user_id": "JYAmR6z4"}, {"user_id": "9NGUhzEL"}]}]}], "namespace": "NBp96O3N", "notification_payload": {}, "session_id": "36bjJh9o"}' \
    > test.out 2>&1
eval_tap $? 83 'ClaimServer' test.out

#- 84 GetSession
./ng net.accelbyte.sdk.cli.Main dsmc getSession \
    --namespace "$AB_NAMESPACE" \
    --sessionID 'GqC1YZ7Z' \
    > test.out 2>&1
eval_tap $? 84 'GetSession' test.out

#- 85 CancelSession
./ng net.accelbyte.sdk.cli.Main dsmc cancelSession \
    --namespace "$AB_NAMESPACE" \
    --sessionID 'j0mwCQir' \
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
    --region 'jnXvLwBi' \
    > test.out 2>&1
eval_tap $? 88 'ListProvidersByRegion' test.out

#- 89 PublicGetMessages
./ng net.accelbyte.sdk.cli.Main dsmc publicGetMessages \
    > test.out 2>&1
eval_tap $? 89 'PublicGetMessages' test.out


rm -f "tmp.dat"

exit $EXIT_CODE