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
    --body '{"artifactPath": "vyJPa1p7", "coreDumpEnabled": false, "image": "Y1speKoO", "imageReplicationsMap": {"Vd3AXQMN": {"failure_code": "PqGPc7aB", "region": "u4Didmvw", "status": "igsjYuCr", "uri": "Dcqq6Zwl"}, "SiolCQTG": {"failure_code": "Li1Q25UI", "region": "sGWU4O4p", "status": "npHYKT7d", "uri": "upAreA3Z"}, "oCLJz920": {"failure_code": "bfb3TSXI", "region": "HbxBCclp", "status": "Zhtj7GOO", "uri": "XCo4MmnZ"}}, "namespace": "NzNTDtWQ", "patchVersion": "ErA5avbD", "persistent": true, "version": "ktO5o6Sd"}' \
    > test.out 2>&1
eval_tap $? 4 'UpdateImage' test.out

#- 5 CreateImage
./ng net.accelbyte.sdk.cli.Main dsmc createImage \
    --body '{"artifactPath": "sA0VGqKW", "coreDumpEnabled": false, "dockerPath": "cMYJu2FQ", "image": "fkUxiQFC", "imageSize": 35, "namespace": "oFwCQoda", "persistent": true, "ulimitFileSize": 44, "version": "bnTI7ZAU"}' \
    > test.out 2>&1
eval_tap $? 5 'CreateImage' test.out

#- 6 ImportImages
./ng net.accelbyte.sdk.cli.Main dsmc importImages \
    --file 'tmp.dat' \
    > test.out 2>&1
eval_tap $? 6 'ImportImages' test.out

#- 7 CreateImagePatch
./ng net.accelbyte.sdk.cli.Main dsmc createImagePatch \
    --body '{"artifactPath": "LuPEG3ow", "coreDumpEnabled": true, "dockerPath": "w8g53ZZh", "image": "QzyBTfFF", "imageSize": 7, "namespace": "d8NIIPg0", "patchVersion": "M4A1kq6m", "persistent": false, "ulimitFileSize": 22, "uploaderFlag": "kLEViixe", "version": "oJEK2sZE"}' \
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
    --body '{"claim_timeout": 56, "creation_timeout": 70, "default_version": "i0c7lcPu", "port": 85, "ports": {"JbKApO0g": 48, "EtEsbnwB": 92, "5QMNTEKh": 28}, "protocol": "lrFB446i", "providers": ["qHOp7eIA", "Lf9vTMRH", "cd8NBwfK"], "session_timeout": 62, "unreachable_timeout": 83}' \
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
    --body '{"claim_timeout": 67, "creation_timeout": 46, "default_version": "6aaZ1obo", "port": 16, "protocol": "2Fai632Q", "providers": ["h2Al72Ey", "Vml1Y8cb", "3fzxbSB1"], "session_timeout": 7, "unreachable_timeout": 18}' \
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
    --name 'VmCs5FJm' \
    --count '11' \
    --offset '87' \
    > test.out 2>&1
eval_tap $? 14 'GetAllDeployment' test.out

#- 15 GetDeployment
./ng net.accelbyte.sdk.cli.Main dsmc getDeployment \
    --deployment 'pJeiEL7K' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 15 'GetDeployment' test.out

#- 16 CreateDeployment
./ng net.accelbyte.sdk.cli.Main dsmc createDeployment \
    --deployment 'PYCr9jH6' \
    --namespace "$AB_NAMESPACE" \
    --body '{"allow_version_override": true, "buffer_count": 29, "buffer_percent": 92, "configuration": "4zOQifKH", "enable_region_overrides": true, "extendable_session": false, "game_version": "Aw3LEhJT", "max_count": 7, "min_count": 75, "overrides": {"Pl94YzYO": {"buffer_count": 73, "buffer_percent": 21, "configuration": "I4GckLxi", "enable_region_overrides": true, "extendable_session": true, "game_version": "120fok7a", "max_count": 21, "min_count": 66, "name": "HEZkelCu", "region_overrides": {"WkIAX5Iz": {"buffer_count": 40, "buffer_percent": 71, "max_count": 57, "min_count": 15, "name": "SQVxQ28V", "unlimited": false, "use_buffer_percent": false}, "FESyTkVP": {"buffer_count": 15, "buffer_percent": 95, "max_count": 5, "min_count": 27, "name": "PT5OIPE5", "unlimited": false, "use_buffer_percent": true}, "ms9LQxOU": {"buffer_count": 6, "buffer_percent": 8, "max_count": 20, "min_count": 98, "name": "NwgrxoQK", "unlimited": true, "use_buffer_percent": false}}, "regions": ["hjNmp5zg", "g6IrYcEC", "5jM5LWbq"], "session_timeout": 63, "unlimited": false, "use_buffer_percent": false}, "xYSFoyeu": {"buffer_count": 41, "buffer_percent": 89, "configuration": "4pGXOaa5", "enable_region_overrides": false, "extendable_session": false, "game_version": "1sXxyCow", "max_count": 27, "min_count": 6, "name": "8G0I519q", "region_overrides": {"gMVDkqoo": {"buffer_count": 1, "buffer_percent": 100, "max_count": 68, "min_count": 46, "name": "3L1dQ3C8", "unlimited": true, "use_buffer_percent": false}, "hfc1ylac": {"buffer_count": 51, "buffer_percent": 92, "max_count": 48, "min_count": 49, "name": "NJ9ACkBh", "unlimited": false, "use_buffer_percent": true}, "adrB6QUO": {"buffer_count": 24, "buffer_percent": 97, "max_count": 84, "min_count": 30, "name": "pXL1dON5", "unlimited": true, "use_buffer_percent": false}}, "regions": ["Gfem4NeQ", "LBnGAdkS", "31wHaUQ9"], "session_timeout": 77, "unlimited": true, "use_buffer_percent": false}, "h3nZ4Er0": {"buffer_count": 34, "buffer_percent": 38, "configuration": "Gauw0fYB", "enable_region_overrides": true, "extendable_session": false, "game_version": "nz7OgSHo", "max_count": 40, "min_count": 42, "name": "3d1kSJpC", "region_overrides": {"t2gLR3iU": {"buffer_count": 11, "buffer_percent": 57, "max_count": 92, "min_count": 89, "name": "5EPWXAgt", "unlimited": false, "use_buffer_percent": true}, "MvnFz6jZ": {"buffer_count": 58, "buffer_percent": 42, "max_count": 44, "min_count": 23, "name": "eVzuwy5i", "unlimited": true, "use_buffer_percent": true}, "Nxb9ukXm": {"buffer_count": 74, "buffer_percent": 56, "max_count": 95, "min_count": 8, "name": "yEAYAX24", "unlimited": false, "use_buffer_percent": true}}, "regions": ["Q8Puty1L", "T8DZXXQJ", "c7aj06az"], "session_timeout": 82, "unlimited": false, "use_buffer_percent": false}}, "region_overrides": {"zuAylpX4": {"buffer_count": 70, "buffer_percent": 12, "max_count": 23, "min_count": 2, "name": "VV63PRYC", "unlimited": false, "use_buffer_percent": true}, "D85SDgdD": {"buffer_count": 22, "buffer_percent": 95, "max_count": 55, "min_count": 80, "name": "0tYPwD9x", "unlimited": true, "use_buffer_percent": true}, "GynRAzeJ": {"buffer_count": 58, "buffer_percent": 9, "max_count": 89, "min_count": 64, "name": "z5rnSTUC", "unlimited": false, "use_buffer_percent": true}}, "regions": ["zylIwC49", "uoNWHsGi", "sMzc1XQK"], "session_timeout": 45, "unlimited": false, "use_buffer_percent": false}' \
    > test.out 2>&1
eval_tap $? 16 'CreateDeployment' test.out

#- 17 DeleteDeployment
./ng net.accelbyte.sdk.cli.Main dsmc deleteDeployment \
    --deployment 'hyrkZw07' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 17 'DeleteDeployment' test.out

#- 18 UpdateDeployment
./ng net.accelbyte.sdk.cli.Main dsmc updateDeployment \
    --deployment 'JPgvuoVJ' \
    --namespace "$AB_NAMESPACE" \
    --body '{"allow_version_override": true, "buffer_count": 98, "buffer_percent": 51, "configuration": "nKNEBqlH", "enable_region_overrides": false, "extendable_session": false, "game_version": "HuCijWVh", "max_count": 63, "min_count": 27, "regions": ["ZPOYCEzg", "fhxAycZg", "LawJg3Q7"], "session_timeout": 37, "unlimited": false, "use_buffer_percent": true}' \
    > test.out 2>&1
eval_tap $? 18 'UpdateDeployment' test.out

#- 19 CreateRootRegionOverride
./ng net.accelbyte.sdk.cli.Main dsmc createRootRegionOverride \
    --deployment 'mCWZ4Enu' \
    --namespace "$AB_NAMESPACE" \
    --region 'tXbahTQA' \
    --body '{"buffer_count": 1, "buffer_percent": 25, "max_count": 34, "min_count": 83, "unlimited": true, "use_buffer_percent": false}' \
    > test.out 2>&1
eval_tap $? 19 'CreateRootRegionOverride' test.out

#- 20 DeleteRootRegionOverride
./ng net.accelbyte.sdk.cli.Main dsmc deleteRootRegionOverride \
    --deployment 'GNuJklyU' \
    --namespace "$AB_NAMESPACE" \
    --region 'bojII15J' \
    > test.out 2>&1
eval_tap $? 20 'DeleteRootRegionOverride' test.out

#- 21 UpdateRootRegionOverride
./ng net.accelbyte.sdk.cli.Main dsmc updateRootRegionOverride \
    --deployment '7hTscmoG' \
    --namespace "$AB_NAMESPACE" \
    --region 'PZ1VM3XJ' \
    --body '{"buffer_count": 71, "buffer_percent": 18, "max_count": 97, "min_count": 54, "unlimited": true, "use_buffer_percent": false}' \
    > test.out 2>&1
eval_tap $? 21 'UpdateRootRegionOverride' test.out

#- 22 CreateDeploymentOverride
./ng net.accelbyte.sdk.cli.Main dsmc createDeploymentOverride \
    --deployment '2fnC55Cc' \
    --namespace "$AB_NAMESPACE" \
    --version 'QVVtKNNy' \
    --body '{"buffer_count": 87, "buffer_percent": 86, "configuration": "kZKMFOUG", "enable_region_overrides": false, "extendable_session": true, "game_version": "BaE4vhUG", "max_count": 40, "min_count": 21, "region_overrides": {"p6b0MnhM": {"buffer_count": 79, "buffer_percent": 63, "max_count": 45, "min_count": 48, "name": "yyj8RWTF", "unlimited": false, "use_buffer_percent": true}, "V6smOvBj": {"buffer_count": 35, "buffer_percent": 59, "max_count": 7, "min_count": 62, "name": "BXPQYVij", "unlimited": true, "use_buffer_percent": false}, "iQvaqnbW": {"buffer_count": 38, "buffer_percent": 78, "max_count": 67, "min_count": 35, "name": "pwdqwOg5", "unlimited": true, "use_buffer_percent": true}}, "regions": ["fRdaJGTt", "EdZkbLUb", "s4JYdYRO"], "session_timeout": 48, "unlimited": false, "use_buffer_percent": true}' \
    > test.out 2>&1
eval_tap $? 22 'CreateDeploymentOverride' test.out

#- 23 DeleteDeploymentOverride
./ng net.accelbyte.sdk.cli.Main dsmc deleteDeploymentOverride \
    --deployment 'uYVk0q06' \
    --namespace "$AB_NAMESPACE" \
    --version 'T50jvLnK' \
    > test.out 2>&1
eval_tap $? 23 'DeleteDeploymentOverride' test.out

#- 24 UpdateDeploymentOverride
./ng net.accelbyte.sdk.cli.Main dsmc updateDeploymentOverride \
    --deployment '7y3aaPbv' \
    --namespace "$AB_NAMESPACE" \
    --version 'yhHAGyOb' \
    --body '{"buffer_count": 75, "buffer_percent": 13, "configuration": "H2ns2zYO", "enable_region_overrides": false, "game_version": "YWjwM8mM", "max_count": 36, "min_count": 3, "regions": ["8hE6yhem", "ZaX7VEuc", "sItsSuAA"], "session_timeout": 84, "unlimited": false, "use_buffer_percent": false}' \
    > test.out 2>&1
eval_tap $? 24 'UpdateDeploymentOverride' test.out

#- 25 CreateOverrideRegionOverride
./ng net.accelbyte.sdk.cli.Main dsmc createOverrideRegionOverride \
    --deployment 'QA4hJiCz' \
    --namespace "$AB_NAMESPACE" \
    --region 'CzHRVQi8' \
    --version 'FXlcF4sS' \
    --body '{"buffer_count": 80, "buffer_percent": 5, "max_count": 62, "min_count": 61, "unlimited": false, "use_buffer_percent": true}' \
    > test.out 2>&1
eval_tap $? 25 'CreateOverrideRegionOverride' test.out

#- 26 DeleteOverrideRegionOverride
./ng net.accelbyte.sdk.cli.Main dsmc deleteOverrideRegionOverride \
    --deployment 'DvnNghAV' \
    --namespace "$AB_NAMESPACE" \
    --region 'aYcgKtzM' \
    --version 'eITdCeyj' \
    > test.out 2>&1
eval_tap $? 26 'DeleteOverrideRegionOverride' test.out

#- 27 UpdateOverrideRegionOverride
./ng net.accelbyte.sdk.cli.Main dsmc updateOverrideRegionOverride \
    --deployment 'eCELdChR' \
    --namespace "$AB_NAMESPACE" \
    --region 'EieHherh' \
    --version 'Ms0qvWBY' \
    --body '{"buffer_count": 80, "buffer_percent": 64, "max_count": 74, "min_count": 94, "unlimited": true, "use_buffer_percent": true}' \
    > test.out 2>&1
eval_tap $? 27 'UpdateOverrideRegionOverride' test.out

#- 28 GetAllPodConfig
./ng net.accelbyte.sdk.cli.Main dsmc getAllPodConfig \
    --namespace "$AB_NAMESPACE" \
    --count '80' \
    --offset '97' \
    > test.out 2>&1
eval_tap $? 28 'GetAllPodConfig' test.out

#- 29 GetPodConfig
./ng net.accelbyte.sdk.cli.Main dsmc getPodConfig \
    --name '639njbqe' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 29 'GetPodConfig' test.out

#- 30 CreatePodConfig
./ng net.accelbyte.sdk.cli.Main dsmc createPodConfig \
    --name 'No3Rul8Z' \
    --namespace "$AB_NAMESPACE" \
    --body '{"cpu_limit": 20, "mem_limit": 60, "params": "yDxhNZCQ"}' \
    > test.out 2>&1
eval_tap $? 30 'CreatePodConfig' test.out

#- 31 DeletePodConfig
./ng net.accelbyte.sdk.cli.Main dsmc deletePodConfig \
    --name '7Ovui48U' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 31 'DeletePodConfig' test.out

#- 32 UpdatePodConfig
./ng net.accelbyte.sdk.cli.Main dsmc updatePodConfig \
    --name 'njZpwpr2' \
    --namespace "$AB_NAMESPACE" \
    --body '{"cpu_limit": 58, "mem_limit": 40, "name": "6soxhhOE", "params": "MzLZ2Twh"}' \
    > test.out 2>&1
eval_tap $? 32 'UpdatePodConfig' test.out

#- 33 AddPort
./ng net.accelbyte.sdk.cli.Main dsmc addPort \
    --name 'rArpPbnj' \
    --namespace "$AB_NAMESPACE" \
    --body '{"port": 0}' \
    > test.out 2>&1
eval_tap $? 33 'AddPort' test.out

#- 34 DeletePort
./ng net.accelbyte.sdk.cli.Main dsmc deletePort \
    --name '3Chr6Qc8' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 34 'DeletePort' test.out

#- 35 UpdatePort
./ng net.accelbyte.sdk.cli.Main dsmc updatePort \
    --name 'IkSBo9ml' \
    --namespace "$AB_NAMESPACE" \
    --body '{"name": "kzdFO778", "port": 19}' \
    > test.out 2>&1
eval_tap $? 35 'UpdatePort' test.out

#- 36 ListImages
./ng net.accelbyte.sdk.cli.Main dsmc listImages \
    --namespace "$AB_NAMESPACE" \
    --q 'JEhe6zMt' \
    --sortBy 'version' \
    --sortDirection 'asc' \
    --count '45' \
    --offset '98' \
    > test.out 2>&1
eval_tap $? 36 'ListImages' test.out

#- 37 DeleteImage
./ng net.accelbyte.sdk.cli.Main dsmc deleteImage \
    --namespace "$AB_NAMESPACE" \
    --imageURI 'ZRZazKsg' \
    --version 'i5Ax4kjF' \
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
    --imageURI 'TcNvKKO6' \
    --version '6IxANbKO' \
    --versionPatch 'gboI090a' \
    > test.out 2>&1
eval_tap $? 40 'DeleteImagePatch' test.out

#- 41 GetImageDetail
./ng net.accelbyte.sdk.cli.Main dsmc getImageDetail \
    --namespace "$AB_NAMESPACE" \
    --version 'JfQBsKs3' \
    > test.out 2>&1
eval_tap $? 41 'GetImageDetail' test.out

#- 42 GetImagePatches
./ng net.accelbyte.sdk.cli.Main dsmc getImagePatches \
    --namespace "$AB_NAMESPACE" \
    --version 'b3Ze5gUA' \
    > test.out 2>&1
eval_tap $? 42 'GetImagePatches' test.out

#- 43 GetImagePatchDetail
./ng net.accelbyte.sdk.cli.Main dsmc getImagePatchDetail \
    --namespace "$AB_NAMESPACE" \
    --version '2fbUUJHT' \
    --versionPatch 'TeKdEkCT' \
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
    --region 'UlyRJ3J6' \
    --count '16' \
    --offset '41' \
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
    --region 'wLZt8d7k' \
    > test.out 2>&1
eval_tap $? 47 'CountServerDetailed' test.out

#- 48 ListLocalServer
./ng net.accelbyte.sdk.cli.Main dsmc listLocalServer \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 48 'ListLocalServer' test.out

#- 49 DeleteLocalServer
./ng net.accelbyte.sdk.cli.Main dsmc deleteLocalServer \
    --name 'SAArJqzC' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 49 'DeleteLocalServer' test.out

#- 50 GetServer
./ng net.accelbyte.sdk.cli.Main dsmc getServer \
    --namespace "$AB_NAMESPACE" \
    --podName '9VbXiMTD' \
    > test.out 2>&1
eval_tap $? 50 'GetServer' test.out

#- 51 DeleteServer
./ng net.accelbyte.sdk.cli.Main dsmc deleteServer \
    --namespace "$AB_NAMESPACE" \
    --podName '8FAX5so1' \
    > test.out 2>&1
eval_tap $? 51 'DeleteServer' test.out

#- 52 ListSession
./ng net.accelbyte.sdk.cli.Main dsmc listSession \
    --namespace "$AB_NAMESPACE" \
    --region 'hck1tVBc' \
    --withServer  \
    --count '55' \
    --offset '67' \
    > test.out 2>&1
eval_tap $? 52 'ListSession' test.out

#- 53 CountSession
./ng net.accelbyte.sdk.cli.Main dsmc countSession \
    --namespace "$AB_NAMESPACE" \
    --region '47FkSUPi' \
    > test.out 2>&1
eval_tap $? 53 'CountSession' test.out

#- 54 DeleteSession
./ng net.accelbyte.sdk.cli.Main dsmc deleteSession \
    --namespace "$AB_NAMESPACE" \
    --sessionID 'A3cC8Cf0' \
    > test.out 2>&1
eval_tap $? 54 'DeleteSession' test.out

#- 55 CreateRepository
./ng net.accelbyte.sdk.cli.Main dsmc createRepository \
    --body '{"namespace": "NkReA3hH", "repository": "GbAxCTKn"}' \
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
    --name 'Qfwky9Mr' \
    --count '13' \
    --offset '7' \
    > test.out 2>&1
eval_tap $? 58 'GetAllDeploymentClient' test.out

#- 59 CreateDeploymentClient
./ng net.accelbyte.sdk.cli.Main dsmc createDeploymentClient \
    --deployment 'jgKsQ5Nu' \
    --namespace "$AB_NAMESPACE" \
    --body '{"allow_version_override": true, "buffer_count": 9, "buffer_percent": 18, "configuration": "hjX3yfUK", "enable_region_overrides": true, "extendable_session": false, "game_version": "50mEO10x", "max_count": 5, "min_count": 60, "overrides": {"i1lNeMCd": {"buffer_count": 23, "buffer_percent": 25, "configuration": "G6GW87lR", "enable_region_overrides": true, "extendable_session": false, "game_version": "u8UQfAxM", "max_count": 56, "min_count": 83, "name": "UMS7A8hJ", "region_overrides": {"9VcBQjqa": {"buffer_count": 33, "buffer_percent": 99, "max_count": 80, "min_count": 50, "name": "EJoSDAKv", "unlimited": false, "use_buffer_percent": true}, "dqwemEI2": {"buffer_count": 40, "buffer_percent": 30, "max_count": 59, "min_count": 11, "name": "RcHaOQNt", "unlimited": false, "use_buffer_percent": true}, "Txc7HgpM": {"buffer_count": 61, "buffer_percent": 79, "max_count": 57, "min_count": 55, "name": "yG4UzkjR", "unlimited": false, "use_buffer_percent": true}}, "regions": ["zW0WNO6p", "9CwPY6YN", "gGqBJ6H1"], "session_timeout": 98, "unlimited": true, "use_buffer_percent": true}, "OdryJOTK": {"buffer_count": 46, "buffer_percent": 32, "configuration": "OUMSIcmk", "enable_region_overrides": true, "extendable_session": false, "game_version": "ud4KroBD", "max_count": 89, "min_count": 42, "name": "XrfBiFA3", "region_overrides": {"0IctwoZh": {"buffer_count": 13, "buffer_percent": 10, "max_count": 89, "min_count": 99, "name": "JzVtufFN", "unlimited": true, "use_buffer_percent": false}, "vBLMOHZK": {"buffer_count": 59, "buffer_percent": 54, "max_count": 47, "min_count": 19, "name": "QFsxSzmJ", "unlimited": false, "use_buffer_percent": false}, "ZQl9h1lg": {"buffer_count": 73, "buffer_percent": 15, "max_count": 51, "min_count": 8, "name": "Wmg6dwEw", "unlimited": false, "use_buffer_percent": true}}, "regions": ["UXca6Znb", "lBm29JxS", "fRIe1GLd"], "session_timeout": 92, "unlimited": false, "use_buffer_percent": true}, "FDoPRnc1": {"buffer_count": 99, "buffer_percent": 61, "configuration": "YsnQ5QcQ", "enable_region_overrides": true, "extendable_session": true, "game_version": "9UHE4w3b", "max_count": 51, "min_count": 27, "name": "af0mtzRE", "region_overrides": {"SoJSU4sc": {"buffer_count": 86, "buffer_percent": 54, "max_count": 73, "min_count": 16, "name": "Z48OHILl", "unlimited": true, "use_buffer_percent": true}, "sMNNIvjs": {"buffer_count": 53, "buffer_percent": 7, "max_count": 0, "min_count": 70, "name": "iB2BZw61", "unlimited": false, "use_buffer_percent": false}, "4G6O9bvU": {"buffer_count": 26, "buffer_percent": 90, "max_count": 0, "min_count": 61, "name": "XLzymZDV", "unlimited": false, "use_buffer_percent": true}}, "regions": ["miCgqjXx", "OhVu8tAQ", "nwpAkZ73"], "session_timeout": 82, "unlimited": true, "use_buffer_percent": true}}, "region_overrides": {"CDBpsdb0": {"buffer_count": 86, "buffer_percent": 83, "max_count": 54, "min_count": 99, "name": "3sxcKabh", "unlimited": false, "use_buffer_percent": false}, "pgbymi3W": {"buffer_count": 14, "buffer_percent": 5, "max_count": 49, "min_count": 96, "name": "5IDoeHHk", "unlimited": false, "use_buffer_percent": false}, "94nZVQrW": {"buffer_count": 96, "buffer_percent": 69, "max_count": 35, "min_count": 83, "name": "1yoALktZ", "unlimited": true, "use_buffer_percent": true}}, "regions": ["6Rc9rvjk", "Ih9lzEFQ", "y6bNd1ku"], "session_timeout": 90, "unlimited": true, "use_buffer_percent": true}' \
    > test.out 2>&1
eval_tap $? 59 'CreateDeploymentClient' test.out

#- 60 DeleteDeploymentClient
./ng net.accelbyte.sdk.cli.Main dsmc deleteDeploymentClient \
    --deployment 'BaSu8OVr' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 60 'DeleteDeploymentClient' test.out

#- 61 GetAllPodConfigClient
./ng net.accelbyte.sdk.cli.Main dsmc getAllPodConfigClient \
    --namespace "$AB_NAMESPACE" \
    --count '85' \
    --offset '34' \
    > test.out 2>&1
eval_tap $? 61 'GetAllPodConfigClient' test.out

#- 62 CreatePodConfigClient
./ng net.accelbyte.sdk.cli.Main dsmc createPodConfigClient \
    --name 'wwHpX8uV' \
    --namespace "$AB_NAMESPACE" \
    --body '{"cpu_limit": 64, "mem_limit": 81, "params": "UfsfJ3UM"}' \
    > test.out 2>&1
eval_tap $? 62 'CreatePodConfigClient' test.out

#- 63 DeletePodConfigClient
./ng net.accelbyte.sdk.cli.Main dsmc deletePodConfigClient \
    --name 'qei295OU' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 63 'DeletePodConfigClient' test.out

#- 64 ListImagesClient
./ng net.accelbyte.sdk.cli.Main dsmc listImagesClient \
    --namespace "$AB_NAMESPACE" \
    --count '78' \
    --offset '40' \
    --q 'cMjN7AX0' \
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
    --version 'oFNYpR6k' \
    > test.out 2>&1
eval_tap $? 66 'ImageDetailClient' test.out

#- 67 ListServerClient
./ng net.accelbyte.sdk.cli.Main dsmc listServerClient \
    --namespace "$AB_NAMESPACE" \
    --region 'wlXfQUbd' \
    --count '30' \
    --offset '18' \
    > test.out 2>&1
eval_tap $? 67 'ListServerClient' test.out

#- 68 ServerHeartbeat
./ng net.accelbyte.sdk.cli.Main dsmc serverHeartbeat \
    --namespace "$AB_NAMESPACE" \
    --body '{"podName": "6fv1969R"}' \
    > test.out 2>&1
eval_tap $? 68 'ServerHeartbeat' test.out

#- 69 DeregisterLocalServer
./ng net.accelbyte.sdk.cli.Main dsmc deregisterLocalServer \
    --namespace "$AB_NAMESPACE" \
    --body '{"name": "tqjz7vz6"}' \
    > test.out 2>&1
eval_tap $? 69 'DeregisterLocalServer' test.out

#- 70 RegisterLocalServer
./ng net.accelbyte.sdk.cli.Main dsmc registerLocalServer \
    --namespace "$AB_NAMESPACE" \
    --body '{"custom_attribute": "VUGqSjJ5", "ip": "n2pI42iW", "name": "oOZHmX1U", "port": 27}' \
    > test.out 2>&1
eval_tap $? 70 'RegisterLocalServer' test.out

#- 71 RegisterServer
./ng net.accelbyte.sdk.cli.Main dsmc registerServer \
    --namespace "$AB_NAMESPACE" \
    --body '{"custom_attribute": "YuZCxeBN", "pod_name": "uprJfIjX"}' \
    > test.out 2>&1
eval_tap $? 71 'RegisterServer' test.out

#- 72 ShutdownServer
./ng net.accelbyte.sdk.cli.Main dsmc shutdownServer \
    --namespace "$AB_NAMESPACE" \
    --body '{"kill_me": false, "pod_name": "STGlrx6H"}' \
    > test.out 2>&1
eval_tap $? 72 'ShutdownServer' test.out

#- 73 GetServerSessionTimeout
./ng net.accelbyte.sdk.cli.Main dsmc getServerSessionTimeout \
    --namespace "$AB_NAMESPACE" \
    --podName 'tmh8NAar' \
    > test.out 2>&1
eval_tap $? 73 'GetServerSessionTimeout' test.out

#- 74 GetServerSession
./ng net.accelbyte.sdk.cli.Main dsmc getServerSession \
    --namespace "$AB_NAMESPACE" \
    --podName 'zwjJWZw2' \
    > test.out 2>&1
eval_tap $? 74 'GetServerSession' test.out

#- 75 CreateSession
./ng net.accelbyte.sdk.cli.Main dsmc createSession \
    --namespace "$AB_NAMESPACE" \
    --body '{"client_version": "f7t25Ref", "configuration": "xFdpKxvQ", "deployment": "uoGPdfKz", "game_mode": "8RfMNaiu", "matching_allies": [{"matching_parties": [{"party_attributes": {"64mSpN7v": {}, "mj8NM6qe": {}, "9pBuWwp1": {}}, "party_id": "aTqjm6CX", "party_members": [{"user_id": "3hLQ540X"}, {"user_id": "wUo1JubB"}, {"user_id": "X6RuNXpg"}]}, {"party_attributes": {"s9lhOrT4": {}, "h0MW06jF": {}, "bdDQWIw6": {}}, "party_id": "lZYvgQPM", "party_members": [{"user_id": "BIVU5g46"}, {"user_id": "xy5grIJx"}, {"user_id": "1SFxa3xV"}]}, {"party_attributes": {"OU2giAtk": {}, "1jkHx5be": {}, "RFYU1lwA": {}}, "party_id": "os3Fn8Zh", "party_members": [{"user_id": "DwjzMXIz"}, {"user_id": "bxFzCaw1"}, {"user_id": "Crv9nLkN"}]}]}, {"matching_parties": [{"party_attributes": {"KTFTT5zf": {}, "kRuTOZxB": {}, "60xbtVHJ": {}}, "party_id": "XlK92upu", "party_members": [{"user_id": "fv0hV9Ia"}, {"user_id": "uOjGsy6g"}, {"user_id": "lHWpoeyi"}]}, {"party_attributes": {"MxGJNPYY": {}, "jtw7VlDF": {}, "4QlP0WwP": {}}, "party_id": "kUyTXeIW", "party_members": [{"user_id": "iexMc0iA"}, {"user_id": "5WkDkC8k"}, {"user_id": "MJgT6zu0"}]}, {"party_attributes": {"VXNVYwIo": {}, "WmRjRaMa": {}, "Ea3PXiTN": {}}, "party_id": "npEvP88J", "party_members": [{"user_id": "Mk0dSths"}, {"user_id": "8DxPFPLF"}, {"user_id": "FruHzGTx"}]}]}, {"matching_parties": [{"party_attributes": {"1mXlqgC5": {}, "aFjmTYsK": {}, "BT4HvAt3": {}}, "party_id": "L6AD8bfJ", "party_members": [{"user_id": "hxYkzzj8"}, {"user_id": "dYZpgcvO"}, {"user_id": "wC7wyIQQ"}]}, {"party_attributes": {"kTFaedcM": {}, "b2dTxqLH": {}, "sLIjSthm": {}}, "party_id": "RaKEMUB9", "party_members": [{"user_id": "YsXDpzAF"}, {"user_id": "XusbzOC4"}, {"user_id": "LvE7iq1y"}]}, {"party_attributes": {"r99PP72Z": {}, "3Rq1Fzhl": {}, "85jHdEg8": {}}, "party_id": "iVKHvt7r", "party_members": [{"user_id": "VB98IA8m"}, {"user_id": "l1U4emTq"}, {"user_id": "8rUk1xL0"}]}]}], "namespace": "rdFKgZEP", "notification_payload": {}, "pod_name": "ECvsqsYL", "region": "X1vNJxkN", "session_id": "79ottuyb"}' \
    > test.out 2>&1
eval_tap $? 75 'CreateSession' test.out

#- 76 ClaimServer
./ng net.accelbyte.sdk.cli.Main dsmc claimServer \
    --namespace "$AB_NAMESPACE" \
    --body '{"session_id": "B1FNVbOZ"}' \
    > test.out 2>&1
eval_tap $? 76 'ClaimServer' test.out

#- 77 GetSession
./ng net.accelbyte.sdk.cli.Main dsmc getSession \
    --namespace "$AB_NAMESPACE" \
    --sessionID 'dqMIASKD' \
    > test.out 2>&1
eval_tap $? 77 'GetSession' test.out

#- 78 CancelSession
./ng net.accelbyte.sdk.cli.Main dsmc cancelSession \
    --namespace "$AB_NAMESPACE" \
    --sessionID 'BboCS3bq' \
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
    --region 'Fox8Y4JF' \
    > test.out 2>&1
eval_tap $? 81 'ListProvidersByRegion' test.out

#- 82 PublicGetMessages
./ng net.accelbyte.sdk.cli.Main dsmc publicGetMessages \
    > test.out 2>&1
eval_tap $? 82 'PublicGetMessages' test.out


rm -f "tmp.dat"

exit $EXIT_CODE