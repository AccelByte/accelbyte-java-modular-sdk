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
    --body '{"artifactPath": "vOBCFTN6", "coreDumpEnabled": false, "image": "AVKkVd88", "imageReplicationsMap": {"FPLw1qKR": {"failure_code": "dsKvR1J6", "region": "2Mtihyqp", "status": "JPqn1eya", "uri": "ikLVsC0L"}, "k7LK1wiu": {"failure_code": "Uyw72JYh", "region": "9hhFe5nZ", "status": "hoGechuR", "uri": "fegUYEzX"}, "xIDmfrGl": {"failure_code": "JEPlXP7c", "region": "5lbajsbQ", "status": "UHCIBjO0", "uri": "lAVqaDd5"}}, "namespace": "OHeI8ffp", "patchVersion": "LSetZmnr", "persistent": false, "version": "pCionglm"}' \
    > test.out 2>&1
eval_tap $? 4 'UpdateImage' test.out

#- 5 CreateImage
./ng net.accelbyte.sdk.cli.Main dsmc createImage \
    --body '{"artifactPath": "i8hWYflN", "coreDumpEnabled": false, "dockerPath": "pXwnbxDw", "image": "J95pDh6W", "imageSize": 49, "namespace": "gG4x3IJt", "persistent": true, "ulimitFileSize": 56, "version": "XXux5hbs"}' \
    > test.out 2>&1
eval_tap $? 5 'CreateImage' test.out

#- 6 ImportImages
./ng net.accelbyte.sdk.cli.Main dsmc importImages \
    --file 'tmp.dat' \
    > test.out 2>&1
eval_tap $? 6 'ImportImages' test.out

#- 7 CreateImagePatch
./ng net.accelbyte.sdk.cli.Main dsmc createImagePatch \
    --body '{"artifactPath": "0jRzBc1S", "coreDumpEnabled": true, "dockerPath": "ZkxWhRI7", "image": "zlHHn96j", "imageSize": 76, "namespace": "eKigGFa8", "patchVersion": "JbdM1uV4", "persistent": false, "ulimitFileSize": 17, "uploaderFlag": "GqK9I8Ua", "version": "P20mCvZ5"}' \
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
    --body '{"claim_timeout": 42, "creation_timeout": 70, "default_version": "CCjNzDEo", "port": 83, "ports": {"ojgPkJPo": 95, "KndTZwMc": 85, "Fd2Rboi4": 94}, "protocol": "yxjAskeN", "providers": ["ibLYVAGP", "DaMDLZtP", "uuOlHc92"], "session_timeout": 71, "unreachable_timeout": 93}' \
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
    --body '{"claim_timeout": 90, "creation_timeout": 27, "default_version": "CHydUZOI", "port": 93, "protocol": "aEkDIEef", "providers": ["dZYWkkD8", "s2bRGpUT", "1BZJJM2Y"], "session_timeout": 81, "unreachable_timeout": 27}' \
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
    --name 'l36QT626' \
    --count '34' \
    --offset '81' \
    > test.out 2>&1
eval_tap $? 14 'GetAllDeployment' test.out

#- 15 GetDeployment
./ng net.accelbyte.sdk.cli.Main dsmc getDeployment \
    --deployment 'KkOHEDPB' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 15 'GetDeployment' test.out

#- 16 CreateDeployment
./ng net.accelbyte.sdk.cli.Main dsmc createDeployment \
    --deployment 'Y9sTPuIe' \
    --namespace "$AB_NAMESPACE" \
    --body '{"allow_version_override": true, "buffer_count": 14, "buffer_percent": 48, "configuration": "Zpl7f2jx", "enable_region_overrides": false, "extendable_session": false, "game_version": "fgOx7WQi", "max_count": 70, "min_count": 84, "overrides": {"0Hnzq4U7": {"buffer_count": 8, "buffer_percent": 38, "configuration": "aaySp9wX", "enable_region_overrides": true, "extendable_session": false, "game_version": "aN9j2gwt", "max_count": 19, "min_count": 64, "name": "sJUZaTvd", "region_overrides": {"MmnUTX1b": {"buffer_count": 42, "buffer_percent": 15, "max_count": 58, "min_count": 44, "name": "ftJ8fB2J", "unlimited": false, "use_buffer_percent": true}, "oabYK5oW": {"buffer_count": 31, "buffer_percent": 60, "max_count": 66, "min_count": 50, "name": "esocTBBS", "unlimited": true, "use_buffer_percent": false}, "9z8tVsqA": {"buffer_count": 11, "buffer_percent": 6, "max_count": 43, "min_count": 1, "name": "JvdEuaDa", "unlimited": false, "use_buffer_percent": false}}, "regions": ["7KsymA4K", "mzbPk1xC", "dZ5GU4DX"], "session_timeout": 97, "unlimited": true, "use_buffer_percent": true}, "pcP2Lju7": {"buffer_count": 58, "buffer_percent": 70, "configuration": "rfUMUd7D", "enable_region_overrides": false, "extendable_session": true, "game_version": "l33kZz4q", "max_count": 92, "min_count": 98, "name": "vtyq4vLA", "region_overrides": {"gEGVagQO": {"buffer_count": 60, "buffer_percent": 64, "max_count": 100, "min_count": 15, "name": "C1T00O6x", "unlimited": false, "use_buffer_percent": false}, "9XAUEhte": {"buffer_count": 15, "buffer_percent": 56, "max_count": 7, "min_count": 74, "name": "EwKcD2FF", "unlimited": false, "use_buffer_percent": false}, "KV9y33hh": {"buffer_count": 87, "buffer_percent": 90, "max_count": 74, "min_count": 83, "name": "ig9Cy3ck", "unlimited": true, "use_buffer_percent": true}}, "regions": ["ZXWOdeJN", "VQP8nmRV", "9zZrc19o"], "session_timeout": 11, "unlimited": true, "use_buffer_percent": false}, "AJhnh6FD": {"buffer_count": 73, "buffer_percent": 17, "configuration": "pgA8fGpN", "enable_region_overrides": false, "extendable_session": false, "game_version": "jf7KcAmY", "max_count": 27, "min_count": 66, "name": "yW7KnLHL", "region_overrides": {"R0yXaFxL": {"buffer_count": 51, "buffer_percent": 26, "max_count": 49, "min_count": 77, "name": "wYwNR6T8", "unlimited": false, "use_buffer_percent": false}, "E5t6WQ9h": {"buffer_count": 20, "buffer_percent": 87, "max_count": 32, "min_count": 43, "name": "hq0eVflz", "unlimited": true, "use_buffer_percent": false}, "3oMVXqV5": {"buffer_count": 99, "buffer_percent": 82, "max_count": 42, "min_count": 60, "name": "edtV8ASw", "unlimited": false, "use_buffer_percent": true}}, "regions": ["0VBPblWh", "zIlfgowc", "IWtFh9HI"], "session_timeout": 55, "unlimited": true, "use_buffer_percent": false}}, "region_overrides": {"MJfmdGHP": {"buffer_count": 95, "buffer_percent": 53, "max_count": 10, "min_count": 75, "name": "PhBvynoM", "unlimited": true, "use_buffer_percent": true}, "ElwlInuB": {"buffer_count": 52, "buffer_percent": 18, "max_count": 40, "min_count": 75, "name": "RlrvImnJ", "unlimited": true, "use_buffer_percent": true}, "SL0wQUL3": {"buffer_count": 52, "buffer_percent": 71, "max_count": 25, "min_count": 35, "name": "YIy8LyNL", "unlimited": false, "use_buffer_percent": true}}, "regions": ["J2qYI69V", "vYZzWJZX", "CyKpo4UN"], "session_timeout": 6, "unlimited": true, "use_buffer_percent": true}' \
    > test.out 2>&1
eval_tap $? 16 'CreateDeployment' test.out

#- 17 DeleteDeployment
./ng net.accelbyte.sdk.cli.Main dsmc deleteDeployment \
    --deployment 'RU9Wq7Be' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 17 'DeleteDeployment' test.out

#- 18 UpdateDeployment
./ng net.accelbyte.sdk.cli.Main dsmc updateDeployment \
    --deployment 'JaGGLl7j' \
    --namespace "$AB_NAMESPACE" \
    --body '{"allow_version_override": false, "buffer_count": 26, "buffer_percent": 16, "configuration": "BjtjBdO0", "enable_region_overrides": false, "extendable_session": true, "game_version": "O7f4ERzV", "max_count": 15, "min_count": 30, "regions": ["UvKjDNaY", "WGbxVy6v", "rp243dLW"], "session_timeout": 82, "unlimited": true, "use_buffer_percent": false}' \
    > test.out 2>&1
eval_tap $? 18 'UpdateDeployment' test.out

#- 19 CreateRootRegionOverride
./ng net.accelbyte.sdk.cli.Main dsmc createRootRegionOverride \
    --deployment 'xmxz469k' \
    --namespace "$AB_NAMESPACE" \
    --region 'aOVpEYYr' \
    --body '{"buffer_count": 29, "buffer_percent": 89, "max_count": 94, "min_count": 35, "unlimited": true, "use_buffer_percent": true}' \
    > test.out 2>&1
eval_tap $? 19 'CreateRootRegionOverride' test.out

#- 20 DeleteRootRegionOverride
./ng net.accelbyte.sdk.cli.Main dsmc deleteRootRegionOverride \
    --deployment 'xcI54tpV' \
    --namespace "$AB_NAMESPACE" \
    --region 'mmDmDlF2' \
    > test.out 2>&1
eval_tap $? 20 'DeleteRootRegionOverride' test.out

#- 21 UpdateRootRegionOverride
./ng net.accelbyte.sdk.cli.Main dsmc updateRootRegionOverride \
    --deployment 'ZoGJ5iJp' \
    --namespace "$AB_NAMESPACE" \
    --region '5v4YEtdS' \
    --body '{"buffer_count": 30, "buffer_percent": 21, "max_count": 8, "min_count": 24, "unlimited": false, "use_buffer_percent": true}' \
    > test.out 2>&1
eval_tap $? 21 'UpdateRootRegionOverride' test.out

#- 22 CreateDeploymentOverride
./ng net.accelbyte.sdk.cli.Main dsmc createDeploymentOverride \
    --deployment 'yuPiikRD' \
    --namespace "$AB_NAMESPACE" \
    --version '0Az1wFyC' \
    --body '{"buffer_count": 49, "buffer_percent": 98, "configuration": "LUnBCZeW", "enable_region_overrides": false, "extendable_session": false, "game_version": "imWE9xu4", "max_count": 74, "min_count": 20, "region_overrides": {"nkKuIrFz": {"buffer_count": 28, "buffer_percent": 85, "max_count": 4, "min_count": 26, "name": "KZin7WEH", "unlimited": false, "use_buffer_percent": true}, "SBu8NQGB": {"buffer_count": 61, "buffer_percent": 70, "max_count": 11, "min_count": 34, "name": "a3z3NCC7", "unlimited": false, "use_buffer_percent": false}, "GeCl7T9s": {"buffer_count": 52, "buffer_percent": 87, "max_count": 42, "min_count": 100, "name": "dM6003RU", "unlimited": false, "use_buffer_percent": true}}, "regions": ["m8iyl98P", "PfgtPc77", "Jygt8BYa"], "session_timeout": 99, "unlimited": false, "use_buffer_percent": true}' \
    > test.out 2>&1
eval_tap $? 22 'CreateDeploymentOverride' test.out

#- 23 DeleteDeploymentOverride
./ng net.accelbyte.sdk.cli.Main dsmc deleteDeploymentOverride \
    --deployment '34No1WQ3' \
    --namespace "$AB_NAMESPACE" \
    --version '7qCQSsRN' \
    > test.out 2>&1
eval_tap $? 23 'DeleteDeploymentOverride' test.out

#- 24 UpdateDeploymentOverride
./ng net.accelbyte.sdk.cli.Main dsmc updateDeploymentOverride \
    --deployment 'Rp5jAYsk' \
    --namespace "$AB_NAMESPACE" \
    --version 'SNgJ9D4t' \
    --body '{"buffer_count": 65, "buffer_percent": 97, "configuration": "XMtSLdbb", "enable_region_overrides": false, "game_version": "ijtIUnmY", "max_count": 51, "min_count": 87, "regions": ["YSLCPsJu", "jam2befg", "ljPxNUSn"], "session_timeout": 51, "unlimited": true, "use_buffer_percent": true}' \
    > test.out 2>&1
eval_tap $? 24 'UpdateDeploymentOverride' test.out

#- 25 CreateOverrideRegionOverride
./ng net.accelbyte.sdk.cli.Main dsmc createOverrideRegionOverride \
    --deployment 'OLUmrA6Z' \
    --namespace "$AB_NAMESPACE" \
    --region '6H5FSMZ2' \
    --version 'h6DwL53P' \
    --body '{"buffer_count": 4, "buffer_percent": 19, "max_count": 63, "min_count": 36, "unlimited": false, "use_buffer_percent": true}' \
    > test.out 2>&1
eval_tap $? 25 'CreateOverrideRegionOverride' test.out

#- 26 DeleteOverrideRegionOverride
./ng net.accelbyte.sdk.cli.Main dsmc deleteOverrideRegionOverride \
    --deployment 'uQmpzTER' \
    --namespace "$AB_NAMESPACE" \
    --region 'hPHO7O1I' \
    --version 'GVxcMmpx' \
    > test.out 2>&1
eval_tap $? 26 'DeleteOverrideRegionOverride' test.out

#- 27 UpdateOverrideRegionOverride
./ng net.accelbyte.sdk.cli.Main dsmc updateOverrideRegionOverride \
    --deployment 'wJeiTIM1' \
    --namespace "$AB_NAMESPACE" \
    --region 'sOJq5bDc' \
    --version 'MN0Si86H' \
    --body '{"buffer_count": 16, "buffer_percent": 93, "max_count": 92, "min_count": 73, "unlimited": false, "use_buffer_percent": false}' \
    > test.out 2>&1
eval_tap $? 27 'UpdateOverrideRegionOverride' test.out

#- 28 GetAllPodConfig
./ng net.accelbyte.sdk.cli.Main dsmc getAllPodConfig \
    --namespace "$AB_NAMESPACE" \
    --count '77' \
    --offset '47' \
    > test.out 2>&1
eval_tap $? 28 'GetAllPodConfig' test.out

#- 29 GetPodConfig
./ng net.accelbyte.sdk.cli.Main dsmc getPodConfig \
    --name 'EdfCYQ9e' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 29 'GetPodConfig' test.out

#- 30 CreatePodConfig
./ng net.accelbyte.sdk.cli.Main dsmc createPodConfig \
    --name '6dH0BjMo' \
    --namespace "$AB_NAMESPACE" \
    --body '{"cpu_limit": 43, "mem_limit": 74, "params": "Q6bDPPXX"}' \
    > test.out 2>&1
eval_tap $? 30 'CreatePodConfig' test.out

#- 31 DeletePodConfig
./ng net.accelbyte.sdk.cli.Main dsmc deletePodConfig \
    --name 'GS8dakJ7' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 31 'DeletePodConfig' test.out

#- 32 UpdatePodConfig
./ng net.accelbyte.sdk.cli.Main dsmc updatePodConfig \
    --name 'fCPyrYOA' \
    --namespace "$AB_NAMESPACE" \
    --body '{"cpu_limit": 12, "mem_limit": 15, "name": "LSceRswE", "params": "5mhoPkN9"}' \
    > test.out 2>&1
eval_tap $? 32 'UpdatePodConfig' test.out

#- 33 AddPort
./ng net.accelbyte.sdk.cli.Main dsmc addPort \
    --name '1e0U5HvF' \
    --namespace "$AB_NAMESPACE" \
    --body '{"port": 16}' \
    > test.out 2>&1
eval_tap $? 33 'AddPort' test.out

#- 34 DeletePort
./ng net.accelbyte.sdk.cli.Main dsmc deletePort \
    --name 'v368ladb' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 34 'DeletePort' test.out

#- 35 UpdatePort
./ng net.accelbyte.sdk.cli.Main dsmc updatePort \
    --name 'WOEtv2V2' \
    --namespace "$AB_NAMESPACE" \
    --body '{"name": "5woGI1fG", "port": 1}' \
    > test.out 2>&1
eval_tap $? 35 'UpdatePort' test.out

#- 36 ListImages
./ng net.accelbyte.sdk.cli.Main dsmc listImages \
    --namespace "$AB_NAMESPACE" \
    --q '7WIyA0Pj' \
    --sortBy 'version' \
    --sortDirection 'desc' \
    --count '40' \
    --offset '56' \
    > test.out 2>&1
eval_tap $? 36 'ListImages' test.out

#- 37 DeleteImage
./ng net.accelbyte.sdk.cli.Main dsmc deleteImage \
    --namespace "$AB_NAMESPACE" \
    --imageURI 'k5UShNPV' \
    --version 'hJzPFJgf' \
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
    --imageURI 'mqIL2Zws' \
    --version '0Ifus2YF' \
    --versionPatch 'yO1Mliq2' \
    > test.out 2>&1
eval_tap $? 40 'DeleteImagePatch' test.out

#- 41 GetImageDetail
./ng net.accelbyte.sdk.cli.Main dsmc getImageDetail \
    --namespace "$AB_NAMESPACE" \
    --version '8iJKd81b' \
    > test.out 2>&1
eval_tap $? 41 'GetImageDetail' test.out

#- 42 GetImagePatches
./ng net.accelbyte.sdk.cli.Main dsmc getImagePatches \
    --namespace "$AB_NAMESPACE" \
    --version 'bISlWe64' \
    > test.out 2>&1
eval_tap $? 42 'GetImagePatches' test.out

#- 43 GetImagePatchDetail
./ng net.accelbyte.sdk.cli.Main dsmc getImagePatchDetail \
    --namespace "$AB_NAMESPACE" \
    --version 'RPAsuEKw' \
    --versionPatch 'zZkUspYw' \
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
    --region 'abW7UqVe' \
    --count '85' \
    --offset '51' \
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
    --region '70hNLnWJ' \
    > test.out 2>&1
eval_tap $? 47 'CountServerDetailed' test.out

#- 48 ListLocalServer
./ng net.accelbyte.sdk.cli.Main dsmc listLocalServer \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 48 'ListLocalServer' test.out

#- 49 DeleteLocalServer
./ng net.accelbyte.sdk.cli.Main dsmc deleteLocalServer \
    --name 'Levq0RQ3' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 49 'DeleteLocalServer' test.out

#- 50 GetServer
./ng net.accelbyte.sdk.cli.Main dsmc getServer \
    --namespace "$AB_NAMESPACE" \
    --podName '4aJmo6u9' \
    > test.out 2>&1
eval_tap $? 50 'GetServer' test.out

#- 51 DeleteServer
./ng net.accelbyte.sdk.cli.Main dsmc deleteServer \
    --namespace "$AB_NAMESPACE" \
    --podName 'ZJVIRCu0' \
    > test.out 2>&1
eval_tap $? 51 'DeleteServer' test.out

#- 52 ListSession
./ng net.accelbyte.sdk.cli.Main dsmc listSession \
    --namespace "$AB_NAMESPACE" \
    --region 'Wdl6Tjec' \
    --withServer  \
    --count '20' \
    --offset '88' \
    > test.out 2>&1
eval_tap $? 52 'ListSession' test.out

#- 53 CountSession
./ng net.accelbyte.sdk.cli.Main dsmc countSession \
    --namespace "$AB_NAMESPACE" \
    --region 'ZsbvkFTO' \
    > test.out 2>&1
eval_tap $? 53 'CountSession' test.out

#- 54 DeleteSession
./ng net.accelbyte.sdk.cli.Main dsmc deleteSession \
    --namespace "$AB_NAMESPACE" \
    --sessionID 'SDABvIbF' \
    > test.out 2>&1
eval_tap $? 54 'DeleteSession' test.out

#- 55 CreateRepository
./ng net.accelbyte.sdk.cli.Main dsmc createRepository \
    --body '{"namespace": "xHjUeak8", "repository": "QIs5W7fu"}' \
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
    --name 'Tbh2NJEc' \
    --count '11' \
    --offset '50' \
    > test.out 2>&1
eval_tap $? 58 'GetAllDeploymentClient' test.out

#- 59 CreateDeploymentClient
./ng net.accelbyte.sdk.cli.Main dsmc createDeploymentClient \
    --deployment 'stvGTqFp' \
    --namespace "$AB_NAMESPACE" \
    --body '{"allow_version_override": false, "buffer_count": 60, "buffer_percent": 23, "configuration": "LSdv01YY", "enable_region_overrides": false, "extendable_session": true, "game_version": "emS5Szo5", "max_count": 5, "min_count": 70, "overrides": {"8umCu00M": {"buffer_count": 86, "buffer_percent": 32, "configuration": "77qVLqFu", "enable_region_overrides": false, "extendable_session": false, "game_version": "KXbIzUJD", "max_count": 96, "min_count": 7, "name": "nGJpcp0W", "region_overrides": {"xSq0ElnO": {"buffer_count": 87, "buffer_percent": 22, "max_count": 40, "min_count": 99, "name": "Prt9Ak5g", "unlimited": true, "use_buffer_percent": true}, "gmmwu1n2": {"buffer_count": 72, "buffer_percent": 72, "max_count": 97, "min_count": 42, "name": "xLPjv6Oj", "unlimited": false, "use_buffer_percent": false}, "UOgYa98f": {"buffer_count": 45, "buffer_percent": 58, "max_count": 0, "min_count": 24, "name": "YBfGpEmW", "unlimited": false, "use_buffer_percent": true}}, "regions": ["f92dWhhN", "fq04hXfL", "N4G3c56i"], "session_timeout": 93, "unlimited": true, "use_buffer_percent": true}, "sBWh1gAN": {"buffer_count": 81, "buffer_percent": 34, "configuration": "JI4CpkmM", "enable_region_overrides": false, "extendable_session": true, "game_version": "I6Ikiinh", "max_count": 38, "min_count": 20, "name": "FArvtf8w", "region_overrides": {"oXH4MNVf": {"buffer_count": 86, "buffer_percent": 15, "max_count": 76, "min_count": 64, "name": "Rqusbn7O", "unlimited": true, "use_buffer_percent": true}, "Xd9dqBww": {"buffer_count": 86, "buffer_percent": 21, "max_count": 1, "min_count": 86, "name": "tgzcq1oP", "unlimited": false, "use_buffer_percent": false}, "L3xnBdce": {"buffer_count": 37, "buffer_percent": 47, "max_count": 76, "min_count": 75, "name": "h6gXrFmU", "unlimited": true, "use_buffer_percent": true}}, "regions": ["DzdV3Abh", "grmA1jEK", "B3QLJM94"], "session_timeout": 6, "unlimited": true, "use_buffer_percent": true}, "QOL7ToXf": {"buffer_count": 60, "buffer_percent": 10, "configuration": "0yyWthbz", "enable_region_overrides": true, "extendable_session": true, "game_version": "qeqeDiFh", "max_count": 38, "min_count": 0, "name": "sIzDGxaq", "region_overrides": {"zZTmyA7P": {"buffer_count": 85, "buffer_percent": 35, "max_count": 51, "min_count": 91, "name": "HiXO2ZD6", "unlimited": false, "use_buffer_percent": true}, "oBzp5OcI": {"buffer_count": 92, "buffer_percent": 93, "max_count": 21, "min_count": 13, "name": "GnvAqAdl", "unlimited": true, "use_buffer_percent": false}, "vf1YbWer": {"buffer_count": 56, "buffer_percent": 100, "max_count": 97, "min_count": 5, "name": "Z4SEUwev", "unlimited": false, "use_buffer_percent": true}}, "regions": ["d7rRWcXP", "mgmA4AqA", "a3exKV6b"], "session_timeout": 29, "unlimited": false, "use_buffer_percent": false}}, "region_overrides": {"YTkaiY60": {"buffer_count": 41, "buffer_percent": 1, "max_count": 99, "min_count": 78, "name": "ghv7Vuvh", "unlimited": true, "use_buffer_percent": true}, "iTAVqPQQ": {"buffer_count": 10, "buffer_percent": 24, "max_count": 24, "min_count": 88, "name": "jt3FKRhz", "unlimited": false, "use_buffer_percent": true}, "kV5sHu5b": {"buffer_count": 63, "buffer_percent": 52, "max_count": 61, "min_count": 82, "name": "LJBCbGdO", "unlimited": true, "use_buffer_percent": true}}, "regions": ["tuJiUXGY", "iKUdVJrh", "P0hM4uM2"], "session_timeout": 51, "unlimited": false, "use_buffer_percent": true}' \
    > test.out 2>&1
eval_tap $? 59 'CreateDeploymentClient' test.out

#- 60 DeleteDeploymentClient
./ng net.accelbyte.sdk.cli.Main dsmc deleteDeploymentClient \
    --deployment 'nxiQ8f2L' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 60 'DeleteDeploymentClient' test.out

#- 61 GetAllPodConfigClient
./ng net.accelbyte.sdk.cli.Main dsmc getAllPodConfigClient \
    --namespace "$AB_NAMESPACE" \
    --count '84' \
    --offset '99' \
    > test.out 2>&1
eval_tap $? 61 'GetAllPodConfigClient' test.out

#- 62 CreatePodConfigClient
./ng net.accelbyte.sdk.cli.Main dsmc createPodConfigClient \
    --name '0Fz5AIkF' \
    --namespace "$AB_NAMESPACE" \
    --body '{"cpu_limit": 17, "mem_limit": 49, "params": "eXhISrES"}' \
    > test.out 2>&1
eval_tap $? 62 'CreatePodConfigClient' test.out

#- 63 DeletePodConfigClient
./ng net.accelbyte.sdk.cli.Main dsmc deletePodConfigClient \
    --name 'Up6kzPPZ' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 63 'DeletePodConfigClient' test.out

#- 64 ListImagesClient
./ng net.accelbyte.sdk.cli.Main dsmc listImagesClient \
    --namespace "$AB_NAMESPACE" \
    --count '64' \
    --offset '100' \
    --q 'lsxvqaTn' \
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
    --version 'X8OcbQzz' \
    > test.out 2>&1
eval_tap $? 66 'ImageDetailClient' test.out

#- 67 ListServerClient
./ng net.accelbyte.sdk.cli.Main dsmc listServerClient \
    --namespace "$AB_NAMESPACE" \
    --region 'l6D7DFon' \
    --count '73' \
    --offset '98' \
    > test.out 2>&1
eval_tap $? 67 'ListServerClient' test.out

#- 68 ServerHeartbeat
./ng net.accelbyte.sdk.cli.Main dsmc serverHeartbeat \
    --namespace "$AB_NAMESPACE" \
    --body '{"podName": "DpkAD1a1"}' \
    > test.out 2>&1
eval_tap $? 68 'ServerHeartbeat' test.out

#- 69 DeregisterLocalServer
./ng net.accelbyte.sdk.cli.Main dsmc deregisterLocalServer \
    --namespace "$AB_NAMESPACE" \
    --body '{"name": "C1ra4LoZ"}' \
    > test.out 2>&1
eval_tap $? 69 'DeregisterLocalServer' test.out

#- 70 RegisterLocalServer
./ng net.accelbyte.sdk.cli.Main dsmc registerLocalServer \
    --namespace "$AB_NAMESPACE" \
    --body '{"custom_attribute": "8865so9l", "ip": "hdqwNJjb", "name": "WbLWre99", "port": 19}' \
    > test.out 2>&1
eval_tap $? 70 'RegisterLocalServer' test.out

#- 71 RegisterServer
./ng net.accelbyte.sdk.cli.Main dsmc registerServer \
    --namespace "$AB_NAMESPACE" \
    --body '{"custom_attribute": "sjjt4Zog", "pod_name": "fIahfn2g"}' \
    > test.out 2>&1
eval_tap $? 71 'RegisterServer' test.out

#- 72 ShutdownServer
./ng net.accelbyte.sdk.cli.Main dsmc shutdownServer \
    --namespace "$AB_NAMESPACE" \
    --body '{"kill_me": true, "pod_name": "8zwxP6DZ"}' \
    > test.out 2>&1
eval_tap $? 72 'ShutdownServer' test.out

#- 73 GetServerSessionTimeout
./ng net.accelbyte.sdk.cli.Main dsmc getServerSessionTimeout \
    --namespace "$AB_NAMESPACE" \
    --podName 'GlkoUqJT' \
    > test.out 2>&1
eval_tap $? 73 'GetServerSessionTimeout' test.out

#- 74 GetServerSession
./ng net.accelbyte.sdk.cli.Main dsmc getServerSession \
    --namespace "$AB_NAMESPACE" \
    --podName 'QXeVfXOx' \
    > test.out 2>&1
eval_tap $? 74 'GetServerSession' test.out

#- 75 CreateSession
./ng net.accelbyte.sdk.cli.Main dsmc createSession \
    --namespace "$AB_NAMESPACE" \
    --body '{"client_version": "geUUCv0t", "configuration": "FvdZwL3d", "deployment": "l1vxawna", "game_mode": "LbRmdKe1", "matching_allies": [{"matching_parties": [{"party_attributes": {"P1K1voal": {}, "KVWkpaHi": {}, "JabuxDku": {}}, "party_id": "KqazWI39", "party_members": [{"user_id": "w5x1uF78"}, {"user_id": "mG0KUPKk"}, {"user_id": "RVuuICPi"}]}, {"party_attributes": {"fouWapjH": {}, "XARlBPG5": {}, "8VxGQaO6": {}}, "party_id": "F72TPzk7", "party_members": [{"user_id": "s8mc9qAf"}, {"user_id": "R9ulml18"}, {"user_id": "cIdzKxJi"}]}, {"party_attributes": {"W6CnCxnz": {}, "VictK6jK": {}, "fpOdfU77": {}}, "party_id": "vxbAOoVr", "party_members": [{"user_id": "m0Nst4LG"}, {"user_id": "OkExFTSa"}, {"user_id": "5GSzXK4d"}]}]}, {"matching_parties": [{"party_attributes": {"VCL8be4Q": {}, "Cjv8XLUK": {}, "lakyBcex": {}}, "party_id": "FiTIQANc", "party_members": [{"user_id": "wxC45SCm"}, {"user_id": "7LEy3qpR"}, {"user_id": "UHywn2HX"}]}, {"party_attributes": {"wSdnqz7e": {}, "jm6iAYtB": {}, "QlvDWXym": {}}, "party_id": "QdnQa2mK", "party_members": [{"user_id": "Cwpz90lq"}, {"user_id": "rLdelMQg"}, {"user_id": "XAFNTpqA"}]}, {"party_attributes": {"XJ6e8uj9": {}, "NFpIDbfd": {}, "fSELImwP": {}}, "party_id": "QkCFw9Oo", "party_members": [{"user_id": "CH3si0Gp"}, {"user_id": "NdfkxI1q"}, {"user_id": "TNLz0H3C"}]}]}, {"matching_parties": [{"party_attributes": {"TeBbPA0t": {}, "SSUf65gc": {}, "2SYZYRmd": {}}, "party_id": "bpqTHrBs", "party_members": [{"user_id": "crMFgAgW"}, {"user_id": "hcDvB7vR"}, {"user_id": "HGfn16j8"}]}, {"party_attributes": {"ANeVGBVm": {}, "WBWTVyhO": {}, "VWn2SKLG": {}}, "party_id": "oCBYuAhX", "party_members": [{"user_id": "gE9XRHB0"}, {"user_id": "ANskmGjd"}, {"user_id": "tKTkeUTM"}]}, {"party_attributes": {"FvU4IrXP": {}, "1AGVv5DS": {}, "Qbsm87sf": {}}, "party_id": "qJq21MP3", "party_members": [{"user_id": "1mu6ezHk"}, {"user_id": "D85x5GAg"}, {"user_id": "NVUI7kHD"}]}]}], "namespace": "M8f5m8up", "notification_payload": {}, "pod_name": "IkUPZg1l", "region": "zHZQeCd6", "session_id": "8Kr8ie41"}' \
    > test.out 2>&1
eval_tap $? 75 'CreateSession' test.out

#- 76 ClaimServer
./ng net.accelbyte.sdk.cli.Main dsmc claimServer \
    --namespace "$AB_NAMESPACE" \
    --body '{"session_id": "tWvhkbm3"}' \
    > test.out 2>&1
eval_tap $? 76 'ClaimServer' test.out

#- 77 GetSession
./ng net.accelbyte.sdk.cli.Main dsmc getSession \
    --namespace "$AB_NAMESPACE" \
    --sessionID 'LgNFMMbs' \
    > test.out 2>&1
eval_tap $? 77 'GetSession' test.out

#- 78 CancelSession
./ng net.accelbyte.sdk.cli.Main dsmc cancelSession \
    --namespace "$AB_NAMESPACE" \
    --sessionID 'VWU00ugz' \
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
    --region 'dmEn9YgG' \
    > test.out 2>&1
eval_tap $? 81 'ListProvidersByRegion' test.out

#- 82 PublicGetMessages
./ng net.accelbyte.sdk.cli.Main dsmc publicGetMessages \
    > test.out 2>&1
eval_tap $? 82 'PublicGetMessages' test.out


rm -f "tmp.dat"

exit $EXIT_CODE