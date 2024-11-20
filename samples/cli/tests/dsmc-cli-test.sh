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
    --body '{"artifactPath": "xa1X2tYO", "coreDumpEnabled": true, "image": "g7zDkcs4", "imageReplicationsMap": {"fQjldJuX": {"failure_code": "Ba7kdVz8", "region": "jAsOZUXZ", "status": "BofB03OX", "uri": "JkK68TgY"}, "wM2xdmvH": {"failure_code": "V2BrAnCz", "region": "zhsNUAKe", "status": "YP7d9SKQ", "uri": "DNAs2MD8"}, "hFXF9C2c": {"failure_code": "55g9XpyE", "region": "9xUa4esT", "status": "Iq2pHGTJ", "uri": "mAHNvAUG"}}, "namespace": "ayGRukgt", "patchVersion": "QcBS8uUo", "persistent": false, "ulimitFileSize": 19, "version": "G28YqqLC"}' \
    > test.out 2>&1
eval_tap $? 4 'UpdateImage' test.out

#- 5 CreateImage
./ng net.accelbyte.sdk.cli.Main dsmc createImage \
    --body '{"artifactPath": "4NmwuVKg", "coreDumpEnabled": true, "dockerPath": "vmbbFJyl", "image": "iAvMo48c", "imageSize": 52, "namespace": "0ZiLH0H6", "persistent": true, "ulimitFileSize": 6, "version": "FlSqSVLU"}' \
    > test.out 2>&1
eval_tap $? 5 'CreateImage' test.out

#- 6 CreateImagePatch
./ng net.accelbyte.sdk.cli.Main dsmc createImagePatch \
    --body '{"artifactPath": "uWo7R1xS", "coreDumpEnabled": false, "dockerPath": "3bSdOlfT", "image": "1qmCZgpD", "imageSize": 75, "namespace": "S7KHdwmS", "patchVersion": "rdUcWOZB", "persistent": false, "ulimitFileSize": 33, "uploaderFlag": "CiIOPosd", "version": "PE79mE49"}' \
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
    --body '{"auto_deletion": true, "ghost_worker": true, "manual_buffer_override": false, "zombie_worker": true}' \
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
    --body '{"claim_timeout": 74, "creation_timeout": 60, "default_version": "FEnDSuTS", "port": 46, "ports": {"nJtdPcEx": 16, "dAl54alg": 5, "VIPrquRc": 19}, "protocol": "hwEFw8tQ", "providers": ["gzJCrbr2", "gW0ldAxR", "q9lf8sEp"], "session_timeout": 10, "unreachable_timeout": 47}' \
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
    --body '{"claim_timeout": 19, "creation_timeout": 77, "default_version": "qFIpbWkh", "port": 16, "protocol": "Z8CDdPE4", "providers": ["BSXVpLJ6", "sVadQ4A1", "h9sApcj2"], "session_timeout": 0, "unreachable_timeout": 63}' \
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
    --name 'unsMhZzA' \
    --count '53' \
    --offset '82' \
    > test.out 2>&1
eval_tap $? 16 'GetAllDeployment' test.out

#- 17 GetDeployment
./ng net.accelbyte.sdk.cli.Main dsmc getDeployment \
    --deployment 'CLALnp6l' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 17 'GetDeployment' test.out

#- 18 CreateDeployment
./ng net.accelbyte.sdk.cli.Main dsmc createDeployment \
    --deployment 'ZLgNz42w' \
    --namespace "$AB_NAMESPACE" \
    --body '{"allow_version_override": true, "buffer_count": 37, "buffer_percent": 93, "configuration": "uG0noYrl", "enable_region_overrides": false, "extendable_session": false, "game_version": "5hMNjSzP", "max_count": 79, "min_count": 18, "overrides": {"GEvx2rWW": {"buffer_count": 50, "buffer_percent": 7, "configuration": "g2plTrPD", "enable_region_overrides": true, "extendable_session": false, "game_version": "C6QpFQXG", "max_count": 18, "min_count": 73, "name": "m4IwwPXA", "region_overrides": {"N7JAZjNZ": {"buffer_count": 19, "buffer_percent": 25, "max_count": 74, "min_count": 75, "name": "HtPdqCKP", "unlimited": false, "use_buffer_percent": true}, "Kn0Ho1rM": {"buffer_count": 68, "buffer_percent": 66, "max_count": 8, "min_count": 100, "name": "7hisXqQK", "unlimited": true, "use_buffer_percent": true}, "a0VkEhmO": {"buffer_count": 80, "buffer_percent": 61, "max_count": 32, "min_count": 46, "name": "p9n4bPMh", "unlimited": false, "use_buffer_percent": false}}, "regions": ["TXzaFq1G", "wyn5snYy", "EsgNcZPt"], "session_timeout": 30, "unlimited": true, "use_buffer_percent": false}, "sIYHNbYA": {"buffer_count": 98, "buffer_percent": 92, "configuration": "5B9fmzNs", "enable_region_overrides": false, "extendable_session": false, "game_version": "UdirVAPn", "max_count": 27, "min_count": 0, "name": "OFqebuQd", "region_overrides": {"AtfTC3rg": {"buffer_count": 43, "buffer_percent": 74, "max_count": 90, "min_count": 98, "name": "u7rrAEbN", "unlimited": true, "use_buffer_percent": true}, "gr5htEBJ": {"buffer_count": 62, "buffer_percent": 41, "max_count": 98, "min_count": 62, "name": "FwR1mP86", "unlimited": true, "use_buffer_percent": false}, "ekOvLuz1": {"buffer_count": 25, "buffer_percent": 29, "max_count": 58, "min_count": 57, "name": "mRw1d2Co", "unlimited": true, "use_buffer_percent": false}}, "regions": ["x7hAsPPL", "HUsAHZUQ", "d3CSlL6r"], "session_timeout": 72, "unlimited": true, "use_buffer_percent": true}, "2cocl8zo": {"buffer_count": 16, "buffer_percent": 94, "configuration": "CGGFYAxP", "enable_region_overrides": true, "extendable_session": false, "game_version": "EvPEDfeC", "max_count": 33, "min_count": 87, "name": "mAFaasF2", "region_overrides": {"0m8iE3yg": {"buffer_count": 4, "buffer_percent": 18, "max_count": 49, "min_count": 41, "name": "epsm0aUB", "unlimited": false, "use_buffer_percent": false}, "ohKosm4G": {"buffer_count": 73, "buffer_percent": 24, "max_count": 86, "min_count": 18, "name": "oR884Ted", "unlimited": true, "use_buffer_percent": false}, "UhSqvmpO": {"buffer_count": 11, "buffer_percent": 97, "max_count": 60, "min_count": 7, "name": "JqxgmmkS", "unlimited": false, "use_buffer_percent": true}}, "regions": ["0q6bchOC", "hJfXpsNY", "AAOWI4WZ"], "session_timeout": 100, "unlimited": true, "use_buffer_percent": false}}, "region_overrides": {"xC6W9lof": {"buffer_count": 64, "buffer_percent": 3, "max_count": 88, "min_count": 39, "name": "PeqOjJhN", "unlimited": true, "use_buffer_percent": true}, "DufxHN3I": {"buffer_count": 9, "buffer_percent": 1, "max_count": 7, "min_count": 19, "name": "TKOyv3QO", "unlimited": false, "use_buffer_percent": false}, "BN8nWuEg": {"buffer_count": 32, "buffer_percent": 46, "max_count": 90, "min_count": 29, "name": "19lxuFMf", "unlimited": true, "use_buffer_percent": false}}, "regions": ["8SVivLc8", "5wJ7X29q", "dzEyZXCl"], "session_timeout": 34, "unlimited": false, "use_buffer_percent": true}' \
    > test.out 2>&1
eval_tap $? 18 'CreateDeployment' test.out

#- 19 DeleteDeployment
./ng net.accelbyte.sdk.cli.Main dsmc deleteDeployment \
    --deployment 'sx76QcXH' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 19 'DeleteDeployment' test.out

#- 20 UpdateDeployment
./ng net.accelbyte.sdk.cli.Main dsmc updateDeployment \
    --deployment 'WeOzTc3B' \
    --namespace "$AB_NAMESPACE" \
    --body '{"allow_version_override": false, "buffer_count": 8, "buffer_percent": 47, "configuration": "WCf8ovcm", "enable_region_overrides": true, "extendable_session": false, "game_version": "30eL32mr", "max_count": 22, "min_count": 60, "regions": ["XvzaX0YQ", "g41EElPK", "5zvk8mar"], "session_timeout": 21, "unlimited": false, "use_buffer_percent": true}' \
    > test.out 2>&1
eval_tap $? 20 'UpdateDeployment' test.out

#- 21 CreateRootRegionOverride
./ng net.accelbyte.sdk.cli.Main dsmc createRootRegionOverride \
    --deployment 'gRTf7xJF' \
    --namespace "$AB_NAMESPACE" \
    --region 'Q0nrsf0S' \
    --body '{"buffer_count": 31, "buffer_percent": 32, "max_count": 7, "min_count": 45, "unlimited": false, "use_buffer_percent": true}' \
    > test.out 2>&1
eval_tap $? 21 'CreateRootRegionOverride' test.out

#- 22 DeleteRootRegionOverride
./ng net.accelbyte.sdk.cli.Main dsmc deleteRootRegionOverride \
    --deployment 'VWxUHJf7' \
    --namespace "$AB_NAMESPACE" \
    --region 'NAU7Lkdj' \
    > test.out 2>&1
eval_tap $? 22 'DeleteRootRegionOverride' test.out

#- 23 UpdateRootRegionOverride
./ng net.accelbyte.sdk.cli.Main dsmc updateRootRegionOverride \
    --deployment 'GfhpztkM' \
    --namespace "$AB_NAMESPACE" \
    --region 'gAEyu8qX' \
    --body '{"buffer_count": 8, "buffer_percent": 73, "max_count": 32, "min_count": 46, "unlimited": true, "use_buffer_percent": true}' \
    > test.out 2>&1
eval_tap $? 23 'UpdateRootRegionOverride' test.out

#- 24 CreateDeploymentOverride
./ng net.accelbyte.sdk.cli.Main dsmc createDeploymentOverride \
    --deployment 'iHpNptf1' \
    --namespace "$AB_NAMESPACE" \
    --version 'G2SZYIBS' \
    --body '{"buffer_count": 15, "buffer_percent": 78, "configuration": "7fWoX9RP", "enable_region_overrides": true, "extendable_session": true, "game_version": "TIzjNP3E", "max_count": 78, "min_count": 79, "region_overrides": {"Ws7x9eBt": {"buffer_count": 22, "buffer_percent": 56, "max_count": 58, "min_count": 73, "name": "aQm0KVU2", "unlimited": true, "use_buffer_percent": true}, "WO687ii1": {"buffer_count": 41, "buffer_percent": 44, "max_count": 9, "min_count": 82, "name": "4GRYamEF", "unlimited": true, "use_buffer_percent": true}, "AQjTFrbj": {"buffer_count": 76, "buffer_percent": 12, "max_count": 8, "min_count": 37, "name": "qP5KdCJt", "unlimited": false, "use_buffer_percent": false}}, "regions": ["jMMK3Ejv", "8AJqGyk3", "XhjtGZxm"], "session_timeout": 24, "unlimited": false, "use_buffer_percent": true}' \
    > test.out 2>&1
eval_tap $? 24 'CreateDeploymentOverride' test.out

#- 25 DeleteDeploymentOverride
./ng net.accelbyte.sdk.cli.Main dsmc deleteDeploymentOverride \
    --deployment 'DVBB72KO' \
    --namespace "$AB_NAMESPACE" \
    --version 'Qfp1Y2cW' \
    > test.out 2>&1
eval_tap $? 25 'DeleteDeploymentOverride' test.out

#- 26 UpdateDeploymentOverride
./ng net.accelbyte.sdk.cli.Main dsmc updateDeploymentOverride \
    --deployment 'L4wATify' \
    --namespace "$AB_NAMESPACE" \
    --version 'XvQeOOSy' \
    --body '{"buffer_count": 13, "buffer_percent": 29, "configuration": "zDKsD1IJ", "enable_region_overrides": true, "game_version": "w8Ob0DLt", "max_count": 24, "min_count": 20, "regions": ["Pxr2ogAE", "iStOasEL", "QEDkky8y"], "session_timeout": 81, "unlimited": false, "use_buffer_percent": true}' \
    > test.out 2>&1
eval_tap $? 26 'UpdateDeploymentOverride' test.out

#- 27 CreateOverrideRegionOverride
./ng net.accelbyte.sdk.cli.Main dsmc createOverrideRegionOverride \
    --deployment 'HyW7T2Ti' \
    --namespace "$AB_NAMESPACE" \
    --region 'LfF9MAgZ' \
    --version '8s5YgQKF' \
    --body '{"buffer_count": 88, "buffer_percent": 21, "max_count": 73, "min_count": 90, "unlimited": true, "use_buffer_percent": false}' \
    > test.out 2>&1
eval_tap $? 27 'CreateOverrideRegionOverride' test.out

#- 28 DeleteOverrideRegionOverride
./ng net.accelbyte.sdk.cli.Main dsmc deleteOverrideRegionOverride \
    --deployment 'Nmo3MGGs' \
    --namespace "$AB_NAMESPACE" \
    --region '2pXS0ATN' \
    --version 'aee87Yzg' \
    > test.out 2>&1
eval_tap $? 28 'DeleteOverrideRegionOverride' test.out

#- 29 UpdateOverrideRegionOverride
./ng net.accelbyte.sdk.cli.Main dsmc updateOverrideRegionOverride \
    --deployment 'NlAZsPcM' \
    --namespace "$AB_NAMESPACE" \
    --region 'FPvYyOnx' \
    --version 'vCPloSYZ' \
    --body '{"buffer_count": 12, "buffer_percent": 35, "max_count": 59, "min_count": 79, "unlimited": true, "use_buffer_percent": false}' \
    > test.out 2>&1
eval_tap $? 29 'UpdateOverrideRegionOverride' test.out

#- 30 DeleteCreatingServerCountQueue
./ng net.accelbyte.sdk.cli.Main dsmc deleteCreatingServerCountQueue \
    --deployment 'JzZLfMyU' \
    --namespace "$AB_NAMESPACE" \
    --version 'Unnhrm0y' \
    > test.out 2>&1
eval_tap $? 30 'DeleteCreatingServerCountQueue' test.out

#- 31 GetAllPodConfig
./ng net.accelbyte.sdk.cli.Main dsmc getAllPodConfig \
    --namespace "$AB_NAMESPACE" \
    --count '58' \
    --offset '95' \
    > test.out 2>&1
eval_tap $? 31 'GetAllPodConfig' test.out

#- 32 GetPodConfig
./ng net.accelbyte.sdk.cli.Main dsmc getPodConfig \
    --name 'kFyUIhQ9' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 32 'GetPodConfig' test.out

#- 33 CreatePodConfig
./ng net.accelbyte.sdk.cli.Main dsmc createPodConfig \
    --name '6p7kTGxu' \
    --namespace "$AB_NAMESPACE" \
    --body '{"cpu_limit": 37, "mem_limit": 20, "params": "kGgDEmqr"}' \
    > test.out 2>&1
eval_tap $? 33 'CreatePodConfig' test.out

#- 34 DeletePodConfig
./ng net.accelbyte.sdk.cli.Main dsmc deletePodConfig \
    --name 'clcPcs5b' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 34 'DeletePodConfig' test.out

#- 35 UpdatePodConfig
./ng net.accelbyte.sdk.cli.Main dsmc updatePodConfig \
    --name 'xVx60wRf' \
    --namespace "$AB_NAMESPACE" \
    --body '{"cpu_limit": 2, "mem_limit": 15, "name": "CXFW8FWE", "params": "81dmxWmg"}' \
    > test.out 2>&1
eval_tap $? 35 'UpdatePodConfig' test.out

#- 36 AddPort
./ng net.accelbyte.sdk.cli.Main dsmc addPort \
    --name 'IEI4Mo5z' \
    --namespace "$AB_NAMESPACE" \
    --body '{"port": 62}' \
    > test.out 2>&1
eval_tap $? 36 'AddPort' test.out

#- 37 DeletePort
./ng net.accelbyte.sdk.cli.Main dsmc deletePort \
    --name 'sVnjflf1' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 37 'DeletePort' test.out

#- 38 UpdatePort
./ng net.accelbyte.sdk.cli.Main dsmc updatePort \
    --name 'YPzJaRha' \
    --namespace "$AB_NAMESPACE" \
    --body '{"name": "PbD5KWqQ", "port": 8}' \
    > test.out 2>&1
eval_tap $? 38 'UpdatePort' test.out

#- 39 ListImages
./ng net.accelbyte.sdk.cli.Main dsmc listImages \
    --namespace "$AB_NAMESPACE" \
    --q '3nDWXWjl' \
    --sortBy 'createdAt' \
    --sortDirection 'desc' \
    --count '78' \
    --offset '64' \
    > test.out 2>&1
eval_tap $? 39 'ListImages' test.out

#- 40 DeleteImage
./ng net.accelbyte.sdk.cli.Main dsmc deleteImage \
    --namespace "$AB_NAMESPACE" \
    --imageURI '3YJLCzdS' \
    --version 'Mi5G2W4C' \
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
    --imageURI 'eGI1iAHE' \
    --version 'eZBZJotd' \
    --versionPatch 'RbhvE7E3' \
    > test.out 2>&1
eval_tap $? 42 'DeleteImagePatch' test.out

#- 43 GetImageDetail
./ng net.accelbyte.sdk.cli.Main dsmc getImageDetail \
    --namespace "$AB_NAMESPACE" \
    --version 'LhA9Fg6s' \
    > test.out 2>&1
eval_tap $? 43 'GetImageDetail' test.out

#- 44 GetImagePatches
./ng net.accelbyte.sdk.cli.Main dsmc getImagePatches \
    --namespace "$AB_NAMESPACE" \
    --version 'CJoQZGTN' \
    > test.out 2>&1
eval_tap $? 44 'GetImagePatches' test.out

#- 45 GetImagePatchDetail
./ng net.accelbyte.sdk.cli.Main dsmc getImagePatchDetail \
    --namespace "$AB_NAMESPACE" \
    --version 'RXGCqUYj' \
    --versionPatch 'sSQCMCqw' \
    > test.out 2>&1
eval_tap $? 45 'GetImagePatchDetail' test.out

#- 46 AddBuffer
./ng net.accelbyte.sdk.cli.Main dsmc addBuffer \
    --namespace "$AB_NAMESPACE" \
    --body '{"AllocCount": 72, "DeploymentName": "srQ6qoBi", "JobCount": 55, "JobPriority": 98, "OverrideVersion": "ePADdA24", "Region": "a7sKW5gq"}' \
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
    --region 'DfLPVztQ' \
    --count '72' \
    --offset '2' \
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
    --region 'pAHwVsgR' \
    > test.out 2>&1
eval_tap $? 50 'CountServerDetailed' test.out

#- 51 ListLocalServer
./ng net.accelbyte.sdk.cli.Main dsmc listLocalServer \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 51 'ListLocalServer' test.out

#- 52 DeleteLocalServer
./ng net.accelbyte.sdk.cli.Main dsmc deleteLocalServer \
    --name 'BrbPUsgc' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 52 'DeleteLocalServer' test.out

#- 53 GetServer
./ng net.accelbyte.sdk.cli.Main dsmc getServer \
    --namespace "$AB_NAMESPACE" \
    --podName '8141iyLH' \
    > test.out 2>&1
eval_tap $? 53 'GetServer' test.out

#- 54 DeleteServer
./ng net.accelbyte.sdk.cli.Main dsmc deleteServer \
    --namespace "$AB_NAMESPACE" \
    --podName 'm3ZbY7yZ' \
    > test.out 2>&1
eval_tap $? 54 'DeleteServer' test.out

#- 55 ListSession
./ng net.accelbyte.sdk.cli.Main dsmc listSession \
    --namespace "$AB_NAMESPACE" \
    --region 'iHarqurA' \
    --withServer  \
    --count '75' \
    --offset '3' \
    > test.out 2>&1
eval_tap $? 55 'ListSession' test.out

#- 56 CountSession
./ng net.accelbyte.sdk.cli.Main dsmc countSession \
    --namespace "$AB_NAMESPACE" \
    --region 'jzOeSShK' \
    > test.out 2>&1
eval_tap $? 56 'CountSession' test.out

#- 57 DeleteSession
./ng net.accelbyte.sdk.cli.Main dsmc deleteSession \
    --namespace "$AB_NAMESPACE" \
    --sessionID 'RHFkPVyG' \
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
    --body '{"JobCount": 42, "Region": "q8icKEIM", "TimeoutSecond": 31, "ZombieCount": 62}' \
    > test.out 2>&1
eval_tap $? 59 'RunZombieCleanerRequestHandler' test.out

#- 60 CreateRepository
./ng net.accelbyte.sdk.cli.Main dsmc createRepository \
    --body '{"namespace": "2Xktm3gD", "repository": "180OPhEu"}' \
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
    --name 'INIMlg0t' \
    --count '46' \
    --offset '85' \
    > test.out 2>&1
eval_tap $? 63 'GetAllDeploymentClient' test.out

#- 64 GetDeploymentClient
./ng net.accelbyte.sdk.cli.Main dsmc getDeploymentClient \
    --deployment '7Gwlb38J' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 64 'GetDeploymentClient' test.out

#- 65 CreateDeploymentClient
./ng net.accelbyte.sdk.cli.Main dsmc createDeploymentClient \
    --deployment '29RsFIi1' \
    --namespace "$AB_NAMESPACE" \
    --body '{"allow_version_override": false, "buffer_count": 67, "buffer_percent": 31, "configuration": "fAV0scV7", "enable_region_overrides": false, "extendable_session": true, "game_version": "aaEQjvGt", "max_count": 1, "min_count": 15, "overrides": {"ra54APxC": {"buffer_count": 8, "buffer_percent": 65, "configuration": "IkdWWl5N", "enable_region_overrides": false, "extendable_session": true, "game_version": "xLPWVUmw", "max_count": 3, "min_count": 18, "name": "63q9Be6u", "region_overrides": {"vpgEgseq": {"buffer_count": 12, "buffer_percent": 20, "max_count": 29, "min_count": 50, "name": "B8YSH5Wd", "unlimited": true, "use_buffer_percent": true}, "JiJE59z5": {"buffer_count": 95, "buffer_percent": 80, "max_count": 34, "min_count": 29, "name": "kegSs6tL", "unlimited": true, "use_buffer_percent": false}, "H2PdW8OY": {"buffer_count": 79, "buffer_percent": 88, "max_count": 88, "min_count": 67, "name": "zpa9lgcm", "unlimited": false, "use_buffer_percent": false}}, "regions": ["ZBHKnY8R", "HM87RO2w", "laeBjQtq"], "session_timeout": 28, "unlimited": false, "use_buffer_percent": false}, "blKTCYQK": {"buffer_count": 2, "buffer_percent": 17, "configuration": "Q1tWGozC", "enable_region_overrides": false, "extendable_session": false, "game_version": "sjez1nct", "max_count": 74, "min_count": 26, "name": "Guk4K8KJ", "region_overrides": {"AwoQiAoD": {"buffer_count": 9, "buffer_percent": 31, "max_count": 53, "min_count": 39, "name": "zDN5wMKX", "unlimited": true, "use_buffer_percent": false}, "V5Ynubdr": {"buffer_count": 72, "buffer_percent": 96, "max_count": 66, "min_count": 41, "name": "ku0Xx0yt", "unlimited": true, "use_buffer_percent": false}, "REyBiJok": {"buffer_count": 40, "buffer_percent": 64, "max_count": 5, "min_count": 49, "name": "Nps5S3ww", "unlimited": true, "use_buffer_percent": false}}, "regions": ["WMmmFvR1", "OnGistta", "r75qWlOV"], "session_timeout": 1, "unlimited": false, "use_buffer_percent": true}, "Mou5fR3B": {"buffer_count": 99, "buffer_percent": 35, "configuration": "tumJIq4m", "enable_region_overrides": true, "extendable_session": true, "game_version": "n8XxQgYU", "max_count": 45, "min_count": 74, "name": "tA5rLyOc", "region_overrides": {"P6kLeXVl": {"buffer_count": 18, "buffer_percent": 87, "max_count": 76, "min_count": 28, "name": "dsNsKIkJ", "unlimited": true, "use_buffer_percent": false}, "MVZS0dIb": {"buffer_count": 30, "buffer_percent": 100, "max_count": 60, "min_count": 43, "name": "LA1r0Mak", "unlimited": true, "use_buffer_percent": false}, "u7ilFPk6": {"buffer_count": 54, "buffer_percent": 98, "max_count": 5, "min_count": 13, "name": "1HmUELM5", "unlimited": false, "use_buffer_percent": false}}, "regions": ["z9LoZKHk", "eX5vCyWo", "T1MNureE"], "session_timeout": 75, "unlimited": true, "use_buffer_percent": false}}, "region_overrides": {"QqkSTybO": {"buffer_count": 18, "buffer_percent": 69, "max_count": 36, "min_count": 33, "name": "8TeiN1nO", "unlimited": true, "use_buffer_percent": true}, "X77cdYDX": {"buffer_count": 48, "buffer_percent": 25, "max_count": 4, "min_count": 43, "name": "UxQG6Pzi", "unlimited": false, "use_buffer_percent": false}, "1dccOneA": {"buffer_count": 39, "buffer_percent": 9, "max_count": 48, "min_count": 81, "name": "Qc8ptxAd", "unlimited": false, "use_buffer_percent": true}}, "regions": ["g3XNNfdG", "SPQflite", "VX51jRAR"], "session_timeout": 84, "unlimited": false, "use_buffer_percent": false}' \
    > test.out 2>&1
eval_tap $? 65 'CreateDeploymentClient' test.out

#- 66 DeleteDeploymentClient
./ng net.accelbyte.sdk.cli.Main dsmc deleteDeploymentClient \
    --deployment 'fkwWAMhl' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 66 'DeleteDeploymentClient' test.out

#- 67 GetAllPodConfigClient
./ng net.accelbyte.sdk.cli.Main dsmc getAllPodConfigClient \
    --namespace "$AB_NAMESPACE" \
    --count '68' \
    --offset '25' \
    > test.out 2>&1
eval_tap $? 67 'GetAllPodConfigClient' test.out

#- 68 CreatePodConfigClient
./ng net.accelbyte.sdk.cli.Main dsmc createPodConfigClient \
    --name '5y7oMFU7' \
    --namespace "$AB_NAMESPACE" \
    --body '{"cpu_limit": 72, "mem_limit": 19, "params": "6abSVSRd"}' \
    > test.out 2>&1
eval_tap $? 68 'CreatePodConfigClient' test.out

#- 69 DeletePodConfigClient
./ng net.accelbyte.sdk.cli.Main dsmc deletePodConfigClient \
    --name 'VG6kTOhZ' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 69 'DeletePodConfigClient' test.out

#- 70 ListImagesClient
./ng net.accelbyte.sdk.cli.Main dsmc listImagesClient \
    --namespace "$AB_NAMESPACE" \
    --count '70' \
    --offset '26' \
    --q 'CSFlKvYu' \
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
    --version 'YN2rgPPH' \
    > test.out 2>&1
eval_tap $? 72 'ImageDetailClient' test.out

#- 73 ListServerClient
./ng net.accelbyte.sdk.cli.Main dsmc listServerClient \
    --namespace "$AB_NAMESPACE" \
    --region 'uFUeBs7A' \
    --count '52' \
    --offset '65' \
    > test.out 2>&1
eval_tap $? 73 'ListServerClient' test.out

#- 74 CountServerDetailedClient
./ng net.accelbyte.sdk.cli.Main dsmc countServerDetailedClient \
    --namespace "$AB_NAMESPACE" \
    --region 'x6vsCr7E' \
    > test.out 2>&1
eval_tap $? 74 'CountServerDetailedClient' test.out

#- 75 ServerHeartbeat
./ng net.accelbyte.sdk.cli.Main dsmc serverHeartbeat \
    --namespace "$AB_NAMESPACE" \
    --body '{"podName": "3goE66dJ"}' \
    > test.out 2>&1
eval_tap $? 75 'ServerHeartbeat' test.out

#- 76 DeregisterLocalServer
./ng net.accelbyte.sdk.cli.Main dsmc deregisterLocalServer \
    --namespace "$AB_NAMESPACE" \
    --body '{"name": "c28i3wTU"}' \
    > test.out 2>&1
eval_tap $? 76 'DeregisterLocalServer' test.out

#- 77 RegisterLocalServer
./ng net.accelbyte.sdk.cli.Main dsmc registerLocalServer \
    --namespace "$AB_NAMESPACE" \
    --body '{"custom_attribute": "t6iWFkOE", "ip": "ADbt6x4p", "name": "FNXW7xRW", "port": 84}' \
    > test.out 2>&1
eval_tap $? 77 'RegisterLocalServer' test.out

#- 78 RegisterServer
./ng net.accelbyte.sdk.cli.Main dsmc registerServer \
    --namespace "$AB_NAMESPACE" \
    --body '{"custom_attribute": "JQss7wj6", "pod_name": "0Fdk5IXd"}' \
    > test.out 2>&1
eval_tap $? 78 'RegisterServer' test.out

#- 79 ShutdownServer
./ng net.accelbyte.sdk.cli.Main dsmc shutdownServer \
    --namespace "$AB_NAMESPACE" \
    --body '{"kill_me": false, "pod_name": "NvDru41H"}' \
    > test.out 2>&1
eval_tap $? 79 'ShutdownServer' test.out

#- 80 GetServerSessionTimeout
./ng net.accelbyte.sdk.cli.Main dsmc getServerSessionTimeout \
    --namespace "$AB_NAMESPACE" \
    --podName 'hY06ngAl' \
    > test.out 2>&1
eval_tap $? 80 'GetServerSessionTimeout' test.out

#- 81 GetServerSession
./ng net.accelbyte.sdk.cli.Main dsmc getServerSession \
    --namespace "$AB_NAMESPACE" \
    --podName 'FivCB520' \
    > test.out 2>&1
eval_tap $? 81 'GetServerSession' test.out

#- 82 CreateSession
./ng net.accelbyte.sdk.cli.Main dsmc createSession \
    --namespace "$AB_NAMESPACE" \
    --body '{"client_version": "fBeprQST", "configuration": "OrPtdtCW", "deployment": "Vin1XVjd", "game_mode": "98I28hdy", "matching_allies": [{"matching_parties": [{"party_attributes": {"NnWDe3SF": {}, "RjxZQrwF": {}, "Q18d5Iyf": {}}, "party_id": "f1T6Fry5", "party_members": [{"user_id": "cNhvEvaB"}, {"user_id": "KPBmh9dT"}, {"user_id": "EUMH2v4v"}]}, {"party_attributes": {"cfMd5zEi": {}, "syImoS2W": {}, "GoiswlMS": {}}, "party_id": "VDYKXfQ6", "party_members": [{"user_id": "u4zyyQFx"}, {"user_id": "2OUVf2CV"}, {"user_id": "BouLCeLG"}]}, {"party_attributes": {"2CMrsfqA": {}, "tK2vq303": {}, "kcjU4eDr": {}}, "party_id": "DKJ3wLg0", "party_members": [{"user_id": "wsLsa2d2"}, {"user_id": "cKUeCWs3"}, {"user_id": "Vb8XfZOd"}]}]}, {"matching_parties": [{"party_attributes": {"oDEAFgt7": {}, "PGLAiswN": {}, "5sA5Qwhi": {}}, "party_id": "AFu5bqJe", "party_members": [{"user_id": "A4kZnCO6"}, {"user_id": "bCqA8IBj"}, {"user_id": "4hht6cua"}]}, {"party_attributes": {"ex5LqRYH": {}, "78dnXsOs": {}, "RarHxONq": {}}, "party_id": "ABQLSrAz", "party_members": [{"user_id": "QufQ1tk7"}, {"user_id": "OgC21Nl1"}, {"user_id": "GnPzM38m"}]}, {"party_attributes": {"JvQLAwju": {}, "BT6LMdKc": {}, "sj8tErUb": {}}, "party_id": "3x1hQGC9", "party_members": [{"user_id": "Aw7lp1B8"}, {"user_id": "BxCeGZbf"}, {"user_id": "zqnYev83"}]}]}, {"matching_parties": [{"party_attributes": {"zpNOg2t4": {}, "dPaF4dOb": {}, "lKyyJrSB": {}}, "party_id": "EAdVCrUW", "party_members": [{"user_id": "cJSDLNVs"}, {"user_id": "JmxxRWci"}, {"user_id": "6UQqzps1"}]}, {"party_attributes": {"9zSjmkWK": {}, "Chj1Nz7H": {}, "2vFbdheN": {}}, "party_id": "MUdEpwfn", "party_members": [{"user_id": "ocfQEUzy"}, {"user_id": "9B42cxrj"}, {"user_id": "1m31LIi7"}]}, {"party_attributes": {"TWUHE2FH": {}, "crEI6x7R": {}, "CZuBlTCU": {}}, "party_id": "7SjeJrC7", "party_members": [{"user_id": "ZSZYgeLt"}, {"user_id": "RtvkRuHS"}, {"user_id": "P5AfUkM3"}]}]}], "namespace": "4XewXps3", "notification_payload": {}, "pod_name": "uMNkmxpA", "region": "GsesNZu1", "session_id": "LJTuu24p"}' \
    > test.out 2>&1
eval_tap $? 82 'CreateSession' test.out

#- 83 ClaimServer
./ng net.accelbyte.sdk.cli.Main dsmc claimServer \
    --namespace "$AB_NAMESPACE" \
    --body '{"game_mode": "b7mINJkZ", "matching_allies": [{"matching_parties": [{"party_attributes": {"JublO3ZO": {}, "fLmiAXNM": {}, "93FzIeT5": {}}, "party_id": "uiPNdXXJ", "party_members": [{"user_id": "0GJ4bgdI"}, {"user_id": "s3vvnTdi"}, {"user_id": "IhKkajOg"}]}, {"party_attributes": {"5WI9M3Gu": {}, "i8WifiYw": {}, "JIWr1hfK": {}}, "party_id": "7Re84jmr", "party_members": [{"user_id": "QWetag7Q"}, {"user_id": "1nFS1Wa9"}, {"user_id": "YZTER1bk"}]}, {"party_attributes": {"wk1qGBE7": {}, "V0bkQwTE": {}, "TleHU3jW": {}}, "party_id": "qqT5MuBq", "party_members": [{"user_id": "kCEvWE4R"}, {"user_id": "MwovSdWI"}, {"user_id": "cGEM5RWy"}]}]}, {"matching_parties": [{"party_attributes": {"NPW5PNSq": {}, "mfdG7N7b": {}, "Wa574Grh": {}}, "party_id": "KiCqfEla", "party_members": [{"user_id": "uwKmK6RJ"}, {"user_id": "Qtgov2uZ"}, {"user_id": "F8pq8rMr"}]}, {"party_attributes": {"NUwPyxB8": {}, "ltCv2Ctf": {}, "DY4UjmFH": {}}, "party_id": "lO9Ex48R", "party_members": [{"user_id": "YAJCbx8s"}, {"user_id": "CB5fQDWw"}, {"user_id": "rBOAVdaB"}]}, {"party_attributes": {"mEFJ1G3q": {}, "NYOPVZ8O": {}, "ReefP5TR": {}}, "party_id": "YNZeHKQv", "party_members": [{"user_id": "dhbVKCQi"}, {"user_id": "oJPOv5Oh"}, {"user_id": "6XK91hrx"}]}]}, {"matching_parties": [{"party_attributes": {"u13TwVZD": {}, "29LfuRNt": {}, "oWpOqBpC": {}}, "party_id": "YaWHAKtc", "party_members": [{"user_id": "xMaFPfpZ"}, {"user_id": "YY66LoML"}, {"user_id": "nPGgiaDA"}]}, {"party_attributes": {"zJCQL3CE": {}, "IiddcKH9": {}, "qf0y3V1T": {}}, "party_id": "SqwysGne", "party_members": [{"user_id": "sLn8XNQH"}, {"user_id": "VVDJ8IHV"}, {"user_id": "heBLJTmi"}]}, {"party_attributes": {"R6M0Yu5P": {}, "B8yDgKw5": {}, "HonvzyX9": {}}, "party_id": "tH321lZC", "party_members": [{"user_id": "ey9KBlqY"}, {"user_id": "coXtyfAo"}, {"user_id": "3khY1hwS"}]}]}], "namespace": "UGq5LSP7", "notification_payload": {}, "session_id": "fwAcYGDK"}' \
    > test.out 2>&1
eval_tap $? 83 'ClaimServer' test.out

#- 84 GetSession
./ng net.accelbyte.sdk.cli.Main dsmc getSession \
    --namespace "$AB_NAMESPACE" \
    --sessionID 'I1TqP4b8' \
    > test.out 2>&1
eval_tap $? 84 'GetSession' test.out

#- 85 CancelSession
./ng net.accelbyte.sdk.cli.Main dsmc cancelSession \
    --namespace "$AB_NAMESPACE" \
    --sessionID '3QZGSsDs' \
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
    --region '4cdA52QI' \
    > test.out 2>&1
eval_tap $? 88 'ListProvidersByRegion' test.out

#- 89 PublicGetMessages
./ng net.accelbyte.sdk.cli.Main dsmc publicGetMessages \
    > test.out 2>&1
eval_tap $? 89 'PublicGetMessages' test.out


rm -f "tmp.dat"

exit $EXIT_CODE