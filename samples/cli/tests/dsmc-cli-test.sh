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
    --body '{"artifactPath": "wRftX1hL", "coreDumpEnabled": false, "image": "0xgAEWaj", "imageReplicationsMap": {"tc8Q10Rs": {"failure_code": "rKZ1vtcb", "region": "9Q91Z03e", "status": "khwSdHNg", "uri": "jAVh2EAO"}, "a3QxqjOG": {"failure_code": "XTPwKG2C", "region": "BAYiRAjH", "status": "eTKTD577", "uri": "dH04WSxQ"}, "vLmXfWx0": {"failure_code": "xYgOUOAc", "region": "t4W0Saor", "status": "9syCyVaz", "uri": "088ork4q"}}, "namespace": "0VkhzFUn", "patchVersion": "BrAvF6MT", "persistent": true, "version": "gx44QRbG"}' \
    > test.out 2>&1
eval_tap $? 4 'UpdateImage' test.out

#- 5 CreateImage
./ng net.accelbyte.sdk.cli.Main dsmc createImage \
    --body '{"artifactPath": "1039U5uC", "coreDumpEnabled": false, "dockerPath": "4I34f9Lh", "image": "BgKVMu2G", "imageSize": 22, "namespace": "Mmjlut34", "persistent": false, "ulimitFileSize": 85, "version": "fJ4EjJ2J"}' \
    > test.out 2>&1
eval_tap $? 5 'CreateImage' test.out

#- 6 ImportImages
./ng net.accelbyte.sdk.cli.Main dsmc importImages \
    --file 'tmp.dat' \
    > test.out 2>&1
eval_tap $? 6 'ImportImages' test.out

#- 7 CreateImagePatch
./ng net.accelbyte.sdk.cli.Main dsmc createImagePatch \
    --body '{"artifactPath": "8VuI72v8", "coreDumpEnabled": true, "dockerPath": "vycA3Ql7", "image": "9uSMzqTn", "imageSize": 85, "namespace": "wSW9JokX", "patchVersion": "f4cnRaiY", "persistent": true, "ulimitFileSize": 9, "uploaderFlag": "aX2vc1xf", "version": "KGqnMgtC"}' \
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
    --body '{"claim_timeout": 11, "creation_timeout": 65, "default_version": "W5Xqg4mk", "port": 99, "ports": {"KI8NBiNR": 14, "2GZ0m5fJ": 85, "uyObXwkI": 84}, "protocol": "4bScDZQ9", "providers": ["MJWJ1kJq", "tEJ5QC78", "vcJLYuRL"], "session_timeout": 31, "unreachable_timeout": 94}' \
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
    --body '{"claim_timeout": 86, "creation_timeout": 67, "default_version": "abTGp1uZ", "port": 7, "protocol": "C4Z9aDdr", "providers": ["1gvG0BJL", "106YKJg3", "X77LQKpq"], "session_timeout": 34, "unreachable_timeout": 17}' \
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
    --name 'EuzhbJkt' \
    --count '63' \
    --offset '20' \
    > test.out 2>&1
eval_tap $? 14 'GetAllDeployment' test.out

#- 15 GetDeployment
./ng net.accelbyte.sdk.cli.Main dsmc getDeployment \
    --deployment 'ypDfCSBJ' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 15 'GetDeployment' test.out

#- 16 CreateDeployment
./ng net.accelbyte.sdk.cli.Main dsmc createDeployment \
    --deployment '36ovY2i7' \
    --namespace "$AB_NAMESPACE" \
    --body '{"allow_version_override": true, "buffer_count": 53, "buffer_percent": 50, "configuration": "p5AQhZ4q", "enable_region_overrides": true, "extendable_session": true, "game_version": "DC1CW935", "max_count": 24, "min_count": 20, "overrides": {"wN1noM2o": {"buffer_count": 28, "buffer_percent": 34, "configuration": "E0so3Asa", "enable_region_overrides": false, "extendable_session": false, "game_version": "Sgd9kIIr", "max_count": 37, "min_count": 81, "name": "vPkS43hM", "region_overrides": {"0Vp32HdP": {"buffer_count": 25, "buffer_percent": 77, "max_count": 76, "min_count": 63, "name": "0UitSlqK", "unlimited": false, "use_buffer_percent": false}, "6KuwkfNl": {"buffer_count": 61, "buffer_percent": 77, "max_count": 54, "min_count": 62, "name": "77gJ5MSq", "unlimited": false, "use_buffer_percent": true}, "UEHlVqtS": {"buffer_count": 39, "buffer_percent": 51, "max_count": 54, "min_count": 39, "name": "boHYsts5", "unlimited": false, "use_buffer_percent": false}}, "regions": ["7pyKQtQW", "zk9GeWRk", "JwHVpx33"], "session_timeout": 80, "unlimited": false, "use_buffer_percent": true}, "1E8NHUX0": {"buffer_count": 17, "buffer_percent": 25, "configuration": "SSA00gLl", "enable_region_overrides": true, "extendable_session": true, "game_version": "w8xhJbJw", "max_count": 29, "min_count": 28, "name": "Vv5bfXOm", "region_overrides": {"KfsHIjJI": {"buffer_count": 53, "buffer_percent": 36, "max_count": 3, "min_count": 28, "name": "WOjQss2E", "unlimited": true, "use_buffer_percent": false}, "c8HMKcwc": {"buffer_count": 36, "buffer_percent": 44, "max_count": 55, "min_count": 49, "name": "qOAq57Ow", "unlimited": true, "use_buffer_percent": true}, "UZPKoaMh": {"buffer_count": 80, "buffer_percent": 10, "max_count": 91, "min_count": 36, "name": "TgITT6Js", "unlimited": true, "use_buffer_percent": false}}, "regions": ["84TEHlgD", "nnh9tmgU", "8lvAgn9r"], "session_timeout": 41, "unlimited": false, "use_buffer_percent": false}, "ee7ZZKSW": {"buffer_count": 72, "buffer_percent": 56, "configuration": "NIDMveQg", "enable_region_overrides": false, "extendable_session": false, "game_version": "8iUzud15", "max_count": 80, "min_count": 82, "name": "LazUPb3Y", "region_overrides": {"4zXzFviy": {"buffer_count": 14, "buffer_percent": 80, "max_count": 77, "min_count": 59, "name": "qj32BLGQ", "unlimited": true, "use_buffer_percent": true}, "OnSJF06y": {"buffer_count": 1, "buffer_percent": 50, "max_count": 40, "min_count": 56, "name": "GsZIfNvv", "unlimited": true, "use_buffer_percent": true}, "rwr2lpxW": {"buffer_count": 61, "buffer_percent": 92, "max_count": 27, "min_count": 25, "name": "bjzreJKz", "unlimited": true, "use_buffer_percent": true}}, "regions": ["6g9pe7R2", "oOGvECUg", "od4blbGa"], "session_timeout": 2, "unlimited": false, "use_buffer_percent": true}}, "region_overrides": {"JisrCz3i": {"buffer_count": 76, "buffer_percent": 8, "max_count": 49, "min_count": 52, "name": "eTnHyiMU", "unlimited": true, "use_buffer_percent": false}, "uen6vmrn": {"buffer_count": 36, "buffer_percent": 40, "max_count": 10, "min_count": 8, "name": "Nn6Hhpy7", "unlimited": true, "use_buffer_percent": false}, "dsO9RPdO": {"buffer_count": 92, "buffer_percent": 3, "max_count": 54, "min_count": 82, "name": "4QMzGWOv", "unlimited": false, "use_buffer_percent": true}}, "regions": ["ehgrD5ri", "wBsZ956G", "aQBigAOD"], "session_timeout": 59, "unlimited": false, "use_buffer_percent": false}' \
    > test.out 2>&1
eval_tap $? 16 'CreateDeployment' test.out

#- 17 DeleteDeployment
./ng net.accelbyte.sdk.cli.Main dsmc deleteDeployment \
    --deployment 'rdqtiNdC' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 17 'DeleteDeployment' test.out

#- 18 UpdateDeployment
./ng net.accelbyte.sdk.cli.Main dsmc updateDeployment \
    --deployment 'QDnEOyVp' \
    --namespace "$AB_NAMESPACE" \
    --body '{"allow_version_override": false, "buffer_count": 69, "buffer_percent": 81, "configuration": "8lt592Ac", "enable_region_overrides": true, "extendable_session": false, "game_version": "c8RmZ3gR", "max_count": 87, "min_count": 19, "regions": ["4R9a4x2s", "l5hccDFT", "TNDDgxT0"], "session_timeout": 16, "unlimited": false, "use_buffer_percent": false}' \
    > test.out 2>&1
eval_tap $? 18 'UpdateDeployment' test.out

#- 19 CreateRootRegionOverride
./ng net.accelbyte.sdk.cli.Main dsmc createRootRegionOverride \
    --deployment 'nXWp8Bq0' \
    --namespace "$AB_NAMESPACE" \
    --region 'TLabchx0' \
    --body '{"buffer_count": 1, "buffer_percent": 57, "max_count": 84, "min_count": 90, "unlimited": true, "use_buffer_percent": false}' \
    > test.out 2>&1
eval_tap $? 19 'CreateRootRegionOverride' test.out

#- 20 DeleteRootRegionOverride
./ng net.accelbyte.sdk.cli.Main dsmc deleteRootRegionOverride \
    --deployment '3upDm4Z5' \
    --namespace "$AB_NAMESPACE" \
    --region 'XPuTdJ3N' \
    > test.out 2>&1
eval_tap $? 20 'DeleteRootRegionOverride' test.out

#- 21 UpdateRootRegionOverride
./ng net.accelbyte.sdk.cli.Main dsmc updateRootRegionOverride \
    --deployment 'p7lI5vOi' \
    --namespace "$AB_NAMESPACE" \
    --region 'dp37Q7Dh' \
    --body '{"buffer_count": 10, "buffer_percent": 20, "max_count": 16, "min_count": 41, "unlimited": false, "use_buffer_percent": false}' \
    > test.out 2>&1
eval_tap $? 21 'UpdateRootRegionOverride' test.out

#- 22 CreateDeploymentOverride
./ng net.accelbyte.sdk.cli.Main dsmc createDeploymentOverride \
    --deployment 'mVCG4EKf' \
    --namespace "$AB_NAMESPACE" \
    --version '6GxNM42r' \
    --body '{"buffer_count": 28, "buffer_percent": 74, "configuration": "4TnJjpWo", "enable_region_overrides": true, "extendable_session": true, "game_version": "73Asft13", "max_count": 11, "min_count": 65, "region_overrides": {"836I8LXs": {"buffer_count": 80, "buffer_percent": 96, "max_count": 52, "min_count": 16, "name": "X8x81MUs", "unlimited": false, "use_buffer_percent": false}, "ja9Y2pOG": {"buffer_count": 66, "buffer_percent": 85, "max_count": 90, "min_count": 88, "name": "P9cObMQi", "unlimited": true, "use_buffer_percent": false}, "oWDYopYn": {"buffer_count": 61, "buffer_percent": 55, "max_count": 0, "min_count": 48, "name": "wsfWtU1d", "unlimited": true, "use_buffer_percent": false}}, "regions": ["ygTvx7QL", "EZhGWVZt", "3S5PHPeu"], "session_timeout": 71, "unlimited": false, "use_buffer_percent": true}' \
    > test.out 2>&1
eval_tap $? 22 'CreateDeploymentOverride' test.out

#- 23 DeleteDeploymentOverride
./ng net.accelbyte.sdk.cli.Main dsmc deleteDeploymentOverride \
    --deployment 'hzaAljNo' \
    --namespace "$AB_NAMESPACE" \
    --version 'aOLyL9ZB' \
    > test.out 2>&1
eval_tap $? 23 'DeleteDeploymentOverride' test.out

#- 24 UpdateDeploymentOverride
./ng net.accelbyte.sdk.cli.Main dsmc updateDeploymentOverride \
    --deployment 'tuzQFbTk' \
    --namespace "$AB_NAMESPACE" \
    --version 'MCi2PvCh' \
    --body '{"buffer_count": 0, "buffer_percent": 98, "configuration": "402AfZpo", "enable_region_overrides": false, "game_version": "bcqV25Ka", "max_count": 56, "min_count": 22, "regions": ["3oIuL1Rz", "Em78NHvM", "DQFDJdQV"], "session_timeout": 83, "unlimited": true, "use_buffer_percent": false}' \
    > test.out 2>&1
eval_tap $? 24 'UpdateDeploymentOverride' test.out

#- 25 CreateOverrideRegionOverride
./ng net.accelbyte.sdk.cli.Main dsmc createOverrideRegionOverride \
    --deployment 'fwUfDkKO' \
    --namespace "$AB_NAMESPACE" \
    --region 'gdfcf03R' \
    --version 'MXS75reY' \
    --body '{"buffer_count": 13, "buffer_percent": 50, "max_count": 87, "min_count": 63, "unlimited": false, "use_buffer_percent": false}' \
    > test.out 2>&1
eval_tap $? 25 'CreateOverrideRegionOverride' test.out

#- 26 DeleteOverrideRegionOverride
./ng net.accelbyte.sdk.cli.Main dsmc deleteOverrideRegionOverride \
    --deployment 'RytpnpuW' \
    --namespace "$AB_NAMESPACE" \
    --region 'MHRoS58Y' \
    --version '3k12lmgM' \
    > test.out 2>&1
eval_tap $? 26 'DeleteOverrideRegionOverride' test.out

#- 27 UpdateOverrideRegionOverride
./ng net.accelbyte.sdk.cli.Main dsmc updateOverrideRegionOverride \
    --deployment 'ZcVKk34p' \
    --namespace "$AB_NAMESPACE" \
    --region 'ItjYI6jC' \
    --version 'TfsoIF7N' \
    --body '{"buffer_count": 88, "buffer_percent": 10, "max_count": 35, "min_count": 94, "unlimited": false, "use_buffer_percent": false}' \
    > test.out 2>&1
eval_tap $? 27 'UpdateOverrideRegionOverride' test.out

#- 28 GetAllPodConfig
./ng net.accelbyte.sdk.cli.Main dsmc getAllPodConfig \
    --namespace "$AB_NAMESPACE" \
    --count '81' \
    --offset '11' \
    > test.out 2>&1
eval_tap $? 28 'GetAllPodConfig' test.out

#- 29 GetPodConfig
./ng net.accelbyte.sdk.cli.Main dsmc getPodConfig \
    --name 'mQaai29T' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 29 'GetPodConfig' test.out

#- 30 CreatePodConfig
./ng net.accelbyte.sdk.cli.Main dsmc createPodConfig \
    --name 'CjSG3HMG' \
    --namespace "$AB_NAMESPACE" \
    --body '{"cpu_limit": 92, "mem_limit": 28, "params": "alCBLeFp"}' \
    > test.out 2>&1
eval_tap $? 30 'CreatePodConfig' test.out

#- 31 DeletePodConfig
./ng net.accelbyte.sdk.cli.Main dsmc deletePodConfig \
    --name 'EC6J5fhP' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 31 'DeletePodConfig' test.out

#- 32 UpdatePodConfig
./ng net.accelbyte.sdk.cli.Main dsmc updatePodConfig \
    --name 'DEaRQuD6' \
    --namespace "$AB_NAMESPACE" \
    --body '{"cpu_limit": 14, "mem_limit": 28, "name": "SRX7RUt1", "params": "BG1e9w1I"}' \
    > test.out 2>&1
eval_tap $? 32 'UpdatePodConfig' test.out

#- 33 AddPort
./ng net.accelbyte.sdk.cli.Main dsmc addPort \
    --name '6T1mnZgF' \
    --namespace "$AB_NAMESPACE" \
    --body '{"port": 17}' \
    > test.out 2>&1
eval_tap $? 33 'AddPort' test.out

#- 34 DeletePort
./ng net.accelbyte.sdk.cli.Main dsmc deletePort \
    --name '6Yr37Sqs' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 34 'DeletePort' test.out

#- 35 UpdatePort
./ng net.accelbyte.sdk.cli.Main dsmc updatePort \
    --name '6iIROqfU' \
    --namespace "$AB_NAMESPACE" \
    --body '{"name": "8O9OAesC", "port": 27}' \
    > test.out 2>&1
eval_tap $? 35 'UpdatePort' test.out

#- 36 ListImages
./ng net.accelbyte.sdk.cli.Main dsmc listImages \
    --namespace "$AB_NAMESPACE" \
    --q '62xPfKvj' \
    --sortBy 'updatedAt' \
    --sortDirection 'asc' \
    --count '26' \
    --offset '100' \
    > test.out 2>&1
eval_tap $? 36 'ListImages' test.out

#- 37 DeleteImage
./ng net.accelbyte.sdk.cli.Main dsmc deleteImage \
    --namespace "$AB_NAMESPACE" \
    --imageURI '0Dxjjatl' \
    --version 'aTHxi1Oi' \
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
    --imageURI 'JIYSX9A1' \
    --version 'NHisz0z4' \
    --versionPatch 'wOjQPNjA' \
    > test.out 2>&1
eval_tap $? 40 'DeleteImagePatch' test.out

#- 41 GetImageDetail
./ng net.accelbyte.sdk.cli.Main dsmc getImageDetail \
    --namespace "$AB_NAMESPACE" \
    --version 'uI4gzvn9' \
    > test.out 2>&1
eval_tap $? 41 'GetImageDetail' test.out

#- 42 GetImagePatches
./ng net.accelbyte.sdk.cli.Main dsmc getImagePatches \
    --namespace "$AB_NAMESPACE" \
    --version 'TJo4HDif' \
    > test.out 2>&1
eval_tap $? 42 'GetImagePatches' test.out

#- 43 GetImagePatchDetail
./ng net.accelbyte.sdk.cli.Main dsmc getImagePatchDetail \
    --namespace "$AB_NAMESPACE" \
    --version 'gbEiU9mh' \
    --versionPatch 'ovnHXbjG' \
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
    --region '83SXffRY' \
    --count '94' \
    --offset '32' \
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
    --region 'UtWOEvhK' \
    > test.out 2>&1
eval_tap $? 47 'CountServerDetailed' test.out

#- 48 ListLocalServer
./ng net.accelbyte.sdk.cli.Main dsmc listLocalServer \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 48 'ListLocalServer' test.out

#- 49 DeleteLocalServer
./ng net.accelbyte.sdk.cli.Main dsmc deleteLocalServer \
    --name 'KnqwlQ4o' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 49 'DeleteLocalServer' test.out

#- 50 GetServer
./ng net.accelbyte.sdk.cli.Main dsmc getServer \
    --namespace "$AB_NAMESPACE" \
    --podName 'HywjBlLL' \
    > test.out 2>&1
eval_tap $? 50 'GetServer' test.out

#- 51 DeleteServer
./ng net.accelbyte.sdk.cli.Main dsmc deleteServer \
    --namespace "$AB_NAMESPACE" \
    --podName 'nBVklmfU' \
    > test.out 2>&1
eval_tap $? 51 'DeleteServer' test.out

#- 52 ListSession
./ng net.accelbyte.sdk.cli.Main dsmc listSession \
    --namespace "$AB_NAMESPACE" \
    --region 'izNGKN1G' \
    --withServer  \
    --count '78' \
    --offset '68' \
    > test.out 2>&1
eval_tap $? 52 'ListSession' test.out

#- 53 CountSession
./ng net.accelbyte.sdk.cli.Main dsmc countSession \
    --namespace "$AB_NAMESPACE" \
    --region 'WVQD6riH' \
    > test.out 2>&1
eval_tap $? 53 'CountSession' test.out

#- 54 DeleteSession
./ng net.accelbyte.sdk.cli.Main dsmc deleteSession \
    --namespace "$AB_NAMESPACE" \
    --sessionID 'dsc3KzBw' \
    > test.out 2>&1
eval_tap $? 54 'DeleteSession' test.out

#- 55 CreateRepository
./ng net.accelbyte.sdk.cli.Main dsmc createRepository \
    --body '{"namespace": "6PPuefs1", "repository": "VuURj55b"}' \
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
    --name 'hHBjLhAg' \
    --count '94' \
    --offset '62' \
    > test.out 2>&1
eval_tap $? 58 'GetAllDeploymentClient' test.out

#- 59 CreateDeploymentClient
./ng net.accelbyte.sdk.cli.Main dsmc createDeploymentClient \
    --deployment 'Fc4OpQMi' \
    --namespace "$AB_NAMESPACE" \
    --body '{"allow_version_override": true, "buffer_count": 98, "buffer_percent": 0, "configuration": "Mn6YXkZZ", "enable_region_overrides": true, "extendable_session": false, "game_version": "w09YtOX3", "max_count": 67, "min_count": 31, "overrides": {"TKw89rzM": {"buffer_count": 41, "buffer_percent": 19, "configuration": "WYa5zsHT", "enable_region_overrides": false, "extendable_session": true, "game_version": "TdVyBVaH", "max_count": 4, "min_count": 27, "name": "mZENVL9W", "region_overrides": {"4kLiyFfQ": {"buffer_count": 63, "buffer_percent": 84, "max_count": 66, "min_count": 21, "name": "6Kiv8pLs", "unlimited": true, "use_buffer_percent": true}, "pzR77ozt": {"buffer_count": 51, "buffer_percent": 65, "max_count": 17, "min_count": 21, "name": "QX5owSFI", "unlimited": false, "use_buffer_percent": false}, "Usgfes8M": {"buffer_count": 34, "buffer_percent": 57, "max_count": 4, "min_count": 43, "name": "8WEpvL7X", "unlimited": true, "use_buffer_percent": true}}, "regions": ["eBtr6pH4", "ELBITJHP", "aMXC15ok"], "session_timeout": 99, "unlimited": false, "use_buffer_percent": true}, "wG0bSQ7P": {"buffer_count": 46, "buffer_percent": 2, "configuration": "xqEmPFzQ", "enable_region_overrides": true, "extendable_session": false, "game_version": "hNHLT8gc", "max_count": 0, "min_count": 87, "name": "zeDfKKae", "region_overrides": {"b0ps9jNQ": {"buffer_count": 100, "buffer_percent": 11, "max_count": 51, "min_count": 96, "name": "OrPltKZv", "unlimited": true, "use_buffer_percent": true}, "bZqrOoQr": {"buffer_count": 7, "buffer_percent": 11, "max_count": 61, "min_count": 85, "name": "UCPFEsgO", "unlimited": false, "use_buffer_percent": false}, "LwNNceST": {"buffer_count": 8, "buffer_percent": 76, "max_count": 7, "min_count": 53, "name": "jSVtZQNa", "unlimited": true, "use_buffer_percent": true}}, "regions": ["M8j7KlEF", "XfOd38fA", "CdAY8u5a"], "session_timeout": 57, "unlimited": false, "use_buffer_percent": false}, "8zNuU1Ef": {"buffer_count": 75, "buffer_percent": 34, "configuration": "8ml50PaC", "enable_region_overrides": true, "extendable_session": false, "game_version": "m24qfk6O", "max_count": 38, "min_count": 25, "name": "NvI9HNQD", "region_overrides": {"BYCT8P4v": {"buffer_count": 45, "buffer_percent": 53, "max_count": 97, "min_count": 22, "name": "QQAtDOiE", "unlimited": false, "use_buffer_percent": false}, "1eoVK5Vc": {"buffer_count": 69, "buffer_percent": 94, "max_count": 10, "min_count": 5, "name": "o8Da1GFL", "unlimited": false, "use_buffer_percent": true}, "061O7u4Z": {"buffer_count": 28, "buffer_percent": 64, "max_count": 9, "min_count": 63, "name": "n0uThyWK", "unlimited": false, "use_buffer_percent": true}}, "regions": ["iNuZDnpj", "bp9XqoEH", "8tSDCoCv"], "session_timeout": 99, "unlimited": true, "use_buffer_percent": true}}, "region_overrides": {"gwVk1nhg": {"buffer_count": 70, "buffer_percent": 49, "max_count": 46, "min_count": 50, "name": "mmc21DOR", "unlimited": false, "use_buffer_percent": true}, "ib3LZ2KI": {"buffer_count": 0, "buffer_percent": 6, "max_count": 43, "min_count": 54, "name": "M0zcYs76", "unlimited": true, "use_buffer_percent": false}, "G0K97rsp": {"buffer_count": 61, "buffer_percent": 36, "max_count": 96, "min_count": 38, "name": "Oci9GRNC", "unlimited": true, "use_buffer_percent": false}}, "regions": ["oREzNgCI", "B2J7PlxO", "ms6VD2f7"], "session_timeout": 55, "unlimited": true, "use_buffer_percent": false}' \
    > test.out 2>&1
eval_tap $? 59 'CreateDeploymentClient' test.out

#- 60 DeleteDeploymentClient
./ng net.accelbyte.sdk.cli.Main dsmc deleteDeploymentClient \
    --deployment 'CjuUBqzE' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 60 'DeleteDeploymentClient' test.out

#- 61 GetAllPodConfigClient
./ng net.accelbyte.sdk.cli.Main dsmc getAllPodConfigClient \
    --namespace "$AB_NAMESPACE" \
    --count '18' \
    --offset '18' \
    > test.out 2>&1
eval_tap $? 61 'GetAllPodConfigClient' test.out

#- 62 CreatePodConfigClient
./ng net.accelbyte.sdk.cli.Main dsmc createPodConfigClient \
    --name 'ADdx47i2' \
    --namespace "$AB_NAMESPACE" \
    --body '{"cpu_limit": 58, "mem_limit": 86, "params": "b4MsqMx2"}' \
    > test.out 2>&1
eval_tap $? 62 'CreatePodConfigClient' test.out

#- 63 DeletePodConfigClient
./ng net.accelbyte.sdk.cli.Main dsmc deletePodConfigClient \
    --name 'eI4xNhmv' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 63 'DeletePodConfigClient' test.out

#- 64 ListImagesClient
./ng net.accelbyte.sdk.cli.Main dsmc listImagesClient \
    --namespace "$AB_NAMESPACE" \
    --count '31' \
    --offset '22' \
    --q 'KHYDfQOh' \
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
    --version 'y81QzZ00' \
    > test.out 2>&1
eval_tap $? 66 'ImageDetailClient' test.out

#- 67 ListServerClient
./ng net.accelbyte.sdk.cli.Main dsmc listServerClient \
    --namespace "$AB_NAMESPACE" \
    --region 'xVMUd2Gh' \
    --count '69' \
    --offset '38' \
    > test.out 2>&1
eval_tap $? 67 'ListServerClient' test.out

#- 68 ServerHeartbeat
./ng net.accelbyte.sdk.cli.Main dsmc serverHeartbeat \
    --namespace "$AB_NAMESPACE" \
    --body '{"podName": "cpz9KHZ3"}' \
    > test.out 2>&1
eval_tap $? 68 'ServerHeartbeat' test.out

#- 69 DeregisterLocalServer
./ng net.accelbyte.sdk.cli.Main dsmc deregisterLocalServer \
    --namespace "$AB_NAMESPACE" \
    --body '{"name": "NbY5bOy5"}' \
    > test.out 2>&1
eval_tap $? 69 'DeregisterLocalServer' test.out

#- 70 RegisterLocalServer
./ng net.accelbyte.sdk.cli.Main dsmc registerLocalServer \
    --namespace "$AB_NAMESPACE" \
    --body '{"custom_attribute": "8YDyUVR1", "ip": "DnocPno9", "name": "FdbbeXT4", "port": 2}' \
    > test.out 2>&1
eval_tap $? 70 'RegisterLocalServer' test.out

#- 71 RegisterServer
./ng net.accelbyte.sdk.cli.Main dsmc registerServer \
    --namespace "$AB_NAMESPACE" \
    --body '{"custom_attribute": "GGHDbipi", "pod_name": "1GYRagYh"}' \
    > test.out 2>&1
eval_tap $? 71 'RegisterServer' test.out

#- 72 ShutdownServer
./ng net.accelbyte.sdk.cli.Main dsmc shutdownServer \
    --namespace "$AB_NAMESPACE" \
    --body '{"kill_me": true, "pod_name": "2Er83k52"}' \
    > test.out 2>&1
eval_tap $? 72 'ShutdownServer' test.out

#- 73 GetServerSessionTimeout
./ng net.accelbyte.sdk.cli.Main dsmc getServerSessionTimeout \
    --namespace "$AB_NAMESPACE" \
    --podName 'wj5KBL2F' \
    > test.out 2>&1
eval_tap $? 73 'GetServerSessionTimeout' test.out

#- 74 GetServerSession
./ng net.accelbyte.sdk.cli.Main dsmc getServerSession \
    --namespace "$AB_NAMESPACE" \
    --podName 'WMKZLOK6' \
    > test.out 2>&1
eval_tap $? 74 'GetServerSession' test.out

#- 75 CreateSession
./ng net.accelbyte.sdk.cli.Main dsmc createSession \
    --namespace "$AB_NAMESPACE" \
    --body '{"client_version": "njWdn8Fx", "configuration": "8USJVCzJ", "deployment": "mgx47G4s", "game_mode": "15MZP46R", "matching_allies": [{"matching_parties": [{"party_attributes": {"zvbBSOM9": {}, "wlXfDMJe": {}, "4LJifBqe": {}}, "party_id": "82llIQk8", "party_members": [{"user_id": "oVP7zqXh"}, {"user_id": "U7f7LoJW"}, {"user_id": "pIy0Fw6J"}]}, {"party_attributes": {"lFDSgLtj": {}, "jZfgwISa": {}, "LPUOCxd5": {}}, "party_id": "75CyCoXA", "party_members": [{"user_id": "6Pav1R2C"}, {"user_id": "8wKUC29a"}, {"user_id": "G51NKig3"}]}, {"party_attributes": {"Td6EGc3Y": {}, "Ykz7PfjX": {}, "Hf9zhsIY": {}}, "party_id": "90tbjZpb", "party_members": [{"user_id": "Va7p8H89"}, {"user_id": "vHz4E8Z6"}, {"user_id": "1D6xt6QY"}]}]}, {"matching_parties": [{"party_attributes": {"XBgGgLcb": {}, "VEecWEkV": {}, "ij54mngX": {}}, "party_id": "cgexCkRt", "party_members": [{"user_id": "zYnE5HdV"}, {"user_id": "5BZrNOWM"}, {"user_id": "Pw8JaLPB"}]}, {"party_attributes": {"JPJ5M8FJ": {}, "kzMpMrDI": {}, "NPux8VEA": {}}, "party_id": "mMBpmzV2", "party_members": [{"user_id": "AuegU40a"}, {"user_id": "6jZuWiby"}, {"user_id": "iPS1gUF6"}]}, {"party_attributes": {"9FyQIrEV": {}, "J4VumLfA": {}, "cybl5sYF": {}}, "party_id": "8rz6Rs17", "party_members": [{"user_id": "plOKM7ur"}, {"user_id": "8oiavsRp"}, {"user_id": "bDfeehZE"}]}]}, {"matching_parties": [{"party_attributes": {"lewN5xc5": {}, "Hcfji1LN": {}, "qIMeiulz": {}}, "party_id": "IIPjK2zO", "party_members": [{"user_id": "naCYASon"}, {"user_id": "7wusWNHQ"}, {"user_id": "2VCkfo9N"}]}, {"party_attributes": {"V9VwsJcV": {}, "w5lpapqd": {}, "PfAwmbKu": {}}, "party_id": "yS4wGITW", "party_members": [{"user_id": "lVadPRU6"}, {"user_id": "iPjr3FWv"}, {"user_id": "6De40c0t"}]}, {"party_attributes": {"Y0YPF86m": {}, "I1KDI9qG": {}, "sgUeFQvL": {}}, "party_id": "QR5eXWns", "party_members": [{"user_id": "CaDk2VZ3"}, {"user_id": "44ZIaCrg"}, {"user_id": "mZIofeat"}]}]}], "namespace": "LfW4f4ku", "notification_payload": {}, "pod_name": "Fvpkrdv9", "region": "pd3hzw8p", "session_id": "CgKnYENl"}' \
    > test.out 2>&1
eval_tap $? 75 'CreateSession' test.out

#- 76 ClaimServer
./ng net.accelbyte.sdk.cli.Main dsmc claimServer \
    --namespace "$AB_NAMESPACE" \
    --body '{"session_id": "HiaVZ7SY"}' \
    > test.out 2>&1
eval_tap $? 76 'ClaimServer' test.out

#- 77 GetSession
./ng net.accelbyte.sdk.cli.Main dsmc getSession \
    --namespace "$AB_NAMESPACE" \
    --sessionID '82xxO77k' \
    > test.out 2>&1
eval_tap $? 77 'GetSession' test.out

#- 78 CancelSession
./ng net.accelbyte.sdk.cli.Main dsmc cancelSession \
    --namespace "$AB_NAMESPACE" \
    --sessionID '7KgQNnk1' \
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
    --region '2K1MS4l2' \
    > test.out 2>&1
eval_tap $? 81 'ListProvidersByRegion' test.out

#- 82 PublicGetMessages
./ng net.accelbyte.sdk.cli.Main dsmc publicGetMessages \
    > test.out 2>&1
eval_tap $? 82 'PublicGetMessages' test.out


rm -f "tmp.dat"

exit $EXIT_CODE