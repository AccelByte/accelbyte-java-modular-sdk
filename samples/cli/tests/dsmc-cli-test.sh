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
    --body '{"artifactPath": "GDB1UrTF", "coreDumpEnabled": false, "image": "hr0cvXAq", "imageReplicationsMap": {"frm5b8Sl": {"failure_code": "QZbfFz0v", "region": "5KxPa8Lb", "status": "7TBbQsN4", "uri": "eu1tS3H1"}, "Cc987g8H": {"failure_code": "BCu4xEDu", "region": "lOiAmQHq", "status": "ZR1hWv33", "uri": "0JOwCopW"}, "eOTzQrPR": {"failure_code": "Yrv4aCUQ", "region": "rKNpPC0e", "status": "VLVuuWyD", "uri": "CplgV0T7"}}, "namespace": "ETW3Gg46", "patchVersion": "6V8HdhEh", "persistent": false, "version": "F5OlOQdQ"}' \
    > test.out 2>&1
eval_tap $? 4 'UpdateImage' test.out

#- 5 CreateImage
./ng net.accelbyte.sdk.cli.Main dsmc createImage \
    --body '{"artifactPath": "nPtGJMpQ", "coreDumpEnabled": false, "dockerPath": "JD1cMP80", "image": "D4sPskkG", "imageSize": 92, "namespace": "ngqdsUiq", "persistent": true, "ulimitFileSize": 39, "version": "1AEtADQP"}' \
    > test.out 2>&1
eval_tap $? 5 'CreateImage' test.out

#- 6 ImportImages
./ng net.accelbyte.sdk.cli.Main dsmc importImages \
    --file 'tmp.dat' \
    > test.out 2>&1
eval_tap $? 6 'ImportImages' test.out

#- 7 CreateImagePatch
./ng net.accelbyte.sdk.cli.Main dsmc createImagePatch \
    --body '{"artifactPath": "1IbOLezg", "coreDumpEnabled": false, "dockerPath": "volspiCx", "image": "vcxa5zQP", "imageSize": 7, "namespace": "iTb8FAUB", "patchVersion": "Sa10uP3c", "persistent": false, "ulimitFileSize": 77, "uploaderFlag": "pvSUAPjJ", "version": "n9TBsaiM"}' \
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
    --body '{"claim_timeout": 92, "creation_timeout": 18, "default_version": "xSnXtMhD", "port": 56, "ports": {"GjHnTvKq": 90, "B5Q0oyBw": 18, "ER0CvzEN": 19}, "protocol": "dLanie3p", "providers": ["sQeacGfU", "I64q1wrp", "W6yjpl5m"], "session_timeout": 64, "unreachable_timeout": 2}' \
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
    --body '{"claim_timeout": 22, "creation_timeout": 9, "default_version": "uPXvvV7G", "port": 46, "protocol": "LjtRp8xj", "providers": ["QWyuZS1L", "zVkNWKdV", "6jOnDw7S"], "session_timeout": 45, "unreachable_timeout": 44}' \
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
    --name '9uyvUqNf' \
    --count '16' \
    --offset '82' \
    > test.out 2>&1
eval_tap $? 14 'GetAllDeployment' test.out

#- 15 GetDeployment
./ng net.accelbyte.sdk.cli.Main dsmc getDeployment \
    --deployment '451fiTsW' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 15 'GetDeployment' test.out

#- 16 CreateDeployment
./ng net.accelbyte.sdk.cli.Main dsmc createDeployment \
    --deployment 'AUVEgYk3' \
    --namespace "$AB_NAMESPACE" \
    --body '{"allow_version_override": true, "buffer_count": 80, "buffer_percent": 6, "configuration": "6fFjf2FN", "enable_region_overrides": true, "extendable_session": true, "game_version": "uHTWUpNx", "max_count": 29, "min_count": 75, "overrides": {"m2VPKfkq": {"buffer_count": 41, "buffer_percent": 53, "configuration": "Sj1yz2Or", "enable_region_overrides": true, "extendable_session": false, "game_version": "7k1AUrza", "max_count": 49, "min_count": 27, "name": "LHFDM0xI", "region_overrides": {"DIYRuD1w": {"buffer_count": 88, "buffer_percent": 76, "max_count": 11, "min_count": 30, "name": "CSqT8g6h", "unlimited": false, "use_buffer_percent": true}, "JsqjoMqy": {"buffer_count": 62, "buffer_percent": 21, "max_count": 60, "min_count": 72, "name": "GUGbRhqm", "unlimited": true, "use_buffer_percent": true}, "aV6jCeYr": {"buffer_count": 42, "buffer_percent": 61, "max_count": 3, "min_count": 73, "name": "VbxZfFLb", "unlimited": false, "use_buffer_percent": false}}, "regions": ["9SNZGPIE", "WF1uOgGg", "sln5ADB7"], "session_timeout": 73, "unlimited": true, "use_buffer_percent": true}, "0sbzThqw": {"buffer_count": 73, "buffer_percent": 45, "configuration": "PTE85tUR", "enable_region_overrides": true, "extendable_session": false, "game_version": "5A3kDV43", "max_count": 58, "min_count": 44, "name": "AaioW0gA", "region_overrides": {"d4m91FvA": {"buffer_count": 2, "buffer_percent": 27, "max_count": 29, "min_count": 72, "name": "6MHO9hRD", "unlimited": false, "use_buffer_percent": true}, "z5H1LUkf": {"buffer_count": 51, "buffer_percent": 34, "max_count": 37, "min_count": 68, "name": "8FXwOVVM", "unlimited": true, "use_buffer_percent": true}, "zkocj3dw": {"buffer_count": 53, "buffer_percent": 9, "max_count": 15, "min_count": 90, "name": "hT6AMUAR", "unlimited": false, "use_buffer_percent": true}}, "regions": ["E0IChNZe", "irP6klP3", "migE5DNY"], "session_timeout": 53, "unlimited": true, "use_buffer_percent": true}, "msTPo8cM": {"buffer_count": 67, "buffer_percent": 77, "configuration": "fiB1nr35", "enable_region_overrides": true, "extendable_session": false, "game_version": "OIZl5K1b", "max_count": 34, "min_count": 35, "name": "YAoPcKOi", "region_overrides": {"A6suxIyh": {"buffer_count": 99, "buffer_percent": 9, "max_count": 93, "min_count": 44, "name": "zYoMK26n", "unlimited": true, "use_buffer_percent": true}, "Upygrx4Z": {"buffer_count": 7, "buffer_percent": 89, "max_count": 0, "min_count": 8, "name": "LySuaPPZ", "unlimited": false, "use_buffer_percent": false}, "fAVJ5tA2": {"buffer_count": 86, "buffer_percent": 12, "max_count": 21, "min_count": 89, "name": "vaAhIO5z", "unlimited": true, "use_buffer_percent": true}}, "regions": ["719Tt5BT", "bq6HLywN", "3zYY635Q"], "session_timeout": 59, "unlimited": true, "use_buffer_percent": true}}, "region_overrides": {"VVkiZHMI": {"buffer_count": 43, "buffer_percent": 60, "max_count": 2, "min_count": 13, "name": "EdayZm2G", "unlimited": true, "use_buffer_percent": true}, "oRZOmWVx": {"buffer_count": 16, "buffer_percent": 66, "max_count": 72, "min_count": 38, "name": "hzJGHM4d", "unlimited": false, "use_buffer_percent": false}, "OmKPeHUA": {"buffer_count": 68, "buffer_percent": 87, "max_count": 55, "min_count": 28, "name": "QWx2rqMI", "unlimited": true, "use_buffer_percent": false}}, "regions": ["X9YIQ5nN", "NOrHJ41c", "KtGaN2Jv"], "session_timeout": 49, "unlimited": true, "use_buffer_percent": false}' \
    > test.out 2>&1
eval_tap $? 16 'CreateDeployment' test.out

#- 17 DeleteDeployment
./ng net.accelbyte.sdk.cli.Main dsmc deleteDeployment \
    --deployment 'BN8aCd0b' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 17 'DeleteDeployment' test.out

#- 18 UpdateDeployment
./ng net.accelbyte.sdk.cli.Main dsmc updateDeployment \
    --deployment 'TVybCFaw' \
    --namespace "$AB_NAMESPACE" \
    --body '{"allow_version_override": false, "buffer_count": 41, "buffer_percent": 67, "configuration": "6tnX5FVC", "enable_region_overrides": true, "extendable_session": true, "game_version": "EV8a2Ew9", "max_count": 7, "min_count": 23, "regions": ["xAixyAES", "vbXiiprb", "rZBZ0E8d"], "session_timeout": 66, "unlimited": false, "use_buffer_percent": true}' \
    > test.out 2>&1
eval_tap $? 18 'UpdateDeployment' test.out

#- 19 CreateRootRegionOverride
./ng net.accelbyte.sdk.cli.Main dsmc createRootRegionOverride \
    --deployment 'tnJMMDZV' \
    --namespace "$AB_NAMESPACE" \
    --region 'Zfbwy9Gw' \
    --body '{"buffer_count": 37, "buffer_percent": 80, "max_count": 56, "min_count": 51, "unlimited": false, "use_buffer_percent": false}' \
    > test.out 2>&1
eval_tap $? 19 'CreateRootRegionOverride' test.out

#- 20 DeleteRootRegionOverride
./ng net.accelbyte.sdk.cli.Main dsmc deleteRootRegionOverride \
    --deployment 'UADw6AZA' \
    --namespace "$AB_NAMESPACE" \
    --region 'XbqTizvy' \
    > test.out 2>&1
eval_tap $? 20 'DeleteRootRegionOverride' test.out

#- 21 UpdateRootRegionOverride
./ng net.accelbyte.sdk.cli.Main dsmc updateRootRegionOverride \
    --deployment 'i033wNwh' \
    --namespace "$AB_NAMESPACE" \
    --region 'Skft6Wbl' \
    --body '{"buffer_count": 35, "buffer_percent": 80, "max_count": 70, "min_count": 59, "unlimited": false, "use_buffer_percent": true}' \
    > test.out 2>&1
eval_tap $? 21 'UpdateRootRegionOverride' test.out

#- 22 CreateDeploymentOverride
./ng net.accelbyte.sdk.cli.Main dsmc createDeploymentOverride \
    --deployment 'QSQ526Qj' \
    --namespace "$AB_NAMESPACE" \
    --version 'QgxeChZt' \
    --body '{"buffer_count": 42, "buffer_percent": 3, "configuration": "nJB5teeX", "enable_region_overrides": true, "extendable_session": true, "game_version": "Y19mINGX", "max_count": 18, "min_count": 27, "region_overrides": {"jcnYZ2Hv": {"buffer_count": 15, "buffer_percent": 4, "max_count": 11, "min_count": 100, "name": "8UYBR5ro", "unlimited": true, "use_buffer_percent": true}, "u6BIU13N": {"buffer_count": 49, "buffer_percent": 43, "max_count": 40, "min_count": 37, "name": "IaljToX3", "unlimited": true, "use_buffer_percent": true}, "HpWsw4IU": {"buffer_count": 96, "buffer_percent": 31, "max_count": 18, "min_count": 37, "name": "kWOG6BoM", "unlimited": false, "use_buffer_percent": false}}, "regions": ["NLoiErxS", "2IH3OceM", "LJdMq7ad"], "session_timeout": 57, "unlimited": true, "use_buffer_percent": false}' \
    > test.out 2>&1
eval_tap $? 22 'CreateDeploymentOverride' test.out

#- 23 DeleteDeploymentOverride
./ng net.accelbyte.sdk.cli.Main dsmc deleteDeploymentOverride \
    --deployment 'JGuDieaq' \
    --namespace "$AB_NAMESPACE" \
    --version 'jN5K5c9b' \
    > test.out 2>&1
eval_tap $? 23 'DeleteDeploymentOverride' test.out

#- 24 UpdateDeploymentOverride
./ng net.accelbyte.sdk.cli.Main dsmc updateDeploymentOverride \
    --deployment 'msKlL8Zz' \
    --namespace "$AB_NAMESPACE" \
    --version 'LnYANSIi' \
    --body '{"buffer_count": 25, "buffer_percent": 13, "configuration": "IOEmt3Id", "enable_region_overrides": false, "game_version": "57dgimLf", "max_count": 61, "min_count": 46, "regions": ["h5e021GM", "x4OyBNcp", "AHecSPNV"], "session_timeout": 24, "unlimited": false, "use_buffer_percent": true}' \
    > test.out 2>&1
eval_tap $? 24 'UpdateDeploymentOverride' test.out

#- 25 CreateOverrideRegionOverride
./ng net.accelbyte.sdk.cli.Main dsmc createOverrideRegionOverride \
    --deployment 'KXGXTLTe' \
    --namespace "$AB_NAMESPACE" \
    --region 'fN24YEhG' \
    --version 'uKAIuAwE' \
    --body '{"buffer_count": 78, "buffer_percent": 23, "max_count": 100, "min_count": 15, "unlimited": true, "use_buffer_percent": false}' \
    > test.out 2>&1
eval_tap $? 25 'CreateOverrideRegionOverride' test.out

#- 26 DeleteOverrideRegionOverride
./ng net.accelbyte.sdk.cli.Main dsmc deleteOverrideRegionOverride \
    --deployment '6xYkQdlZ' \
    --namespace "$AB_NAMESPACE" \
    --region 'pPGHYJp0' \
    --version 'XqoXVr6J' \
    > test.out 2>&1
eval_tap $? 26 'DeleteOverrideRegionOverride' test.out

#- 27 UpdateOverrideRegionOverride
./ng net.accelbyte.sdk.cli.Main dsmc updateOverrideRegionOverride \
    --deployment 'nZXpW627' \
    --namespace "$AB_NAMESPACE" \
    --region 'XCkbmbBm' \
    --version '00tds1qZ' \
    --body '{"buffer_count": 35, "buffer_percent": 14, "max_count": 41, "min_count": 52, "unlimited": false, "use_buffer_percent": false}' \
    > test.out 2>&1
eval_tap $? 27 'UpdateOverrideRegionOverride' test.out

#- 28 GetAllPodConfig
./ng net.accelbyte.sdk.cli.Main dsmc getAllPodConfig \
    --namespace "$AB_NAMESPACE" \
    --count '85' \
    --offset '31' \
    > test.out 2>&1
eval_tap $? 28 'GetAllPodConfig' test.out

#- 29 GetPodConfig
./ng net.accelbyte.sdk.cli.Main dsmc getPodConfig \
    --name 'FkauLUKt' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 29 'GetPodConfig' test.out

#- 30 CreatePodConfig
./ng net.accelbyte.sdk.cli.Main dsmc createPodConfig \
    --name 'rPTgRjbn' \
    --namespace "$AB_NAMESPACE" \
    --body '{"cpu_limit": 70, "mem_limit": 25, "params": "zvlWliKE"}' \
    > test.out 2>&1
eval_tap $? 30 'CreatePodConfig' test.out

#- 31 DeletePodConfig
./ng net.accelbyte.sdk.cli.Main dsmc deletePodConfig \
    --name 'KVlnynDa' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 31 'DeletePodConfig' test.out

#- 32 UpdatePodConfig
./ng net.accelbyte.sdk.cli.Main dsmc updatePodConfig \
    --name 'BTsDfUQ0' \
    --namespace "$AB_NAMESPACE" \
    --body '{"cpu_limit": 30, "mem_limit": 11, "name": "ENfMJ4dx", "params": "sZXEHG7j"}' \
    > test.out 2>&1
eval_tap $? 32 'UpdatePodConfig' test.out

#- 33 AddPort
./ng net.accelbyte.sdk.cli.Main dsmc addPort \
    --name 'YDrhf4Je' \
    --namespace "$AB_NAMESPACE" \
    --body '{"port": 22}' \
    > test.out 2>&1
eval_tap $? 33 'AddPort' test.out

#- 34 DeletePort
./ng net.accelbyte.sdk.cli.Main dsmc deletePort \
    --name 'PRByfRSe' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 34 'DeletePort' test.out

#- 35 UpdatePort
./ng net.accelbyte.sdk.cli.Main dsmc updatePort \
    --name '0GHItmaZ' \
    --namespace "$AB_NAMESPACE" \
    --body '{"name": "po3JzeDv", "port": 43}' \
    > test.out 2>&1
eval_tap $? 35 'UpdatePort' test.out

#- 36 ListImages
./ng net.accelbyte.sdk.cli.Main dsmc listImages \
    --namespace "$AB_NAMESPACE" \
    --q 'BqTWHq5J' \
    --sortBy 'version' \
    --sortDirection 'asc' \
    --count '2' \
    --offset '90' \
    > test.out 2>&1
eval_tap $? 36 'ListImages' test.out

#- 37 DeleteImage
./ng net.accelbyte.sdk.cli.Main dsmc deleteImage \
    --namespace "$AB_NAMESPACE" \
    --imageURI '2J1OiHNr' \
    --version 'Uft1LN4m' \
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
    --imageURI 'mAHHCPIz' \
    --version 'UKxhm2oL' \
    --versionPatch '8oi94Grh' \
    > test.out 2>&1
eval_tap $? 40 'DeleteImagePatch' test.out

#- 41 GetImageDetail
./ng net.accelbyte.sdk.cli.Main dsmc getImageDetail \
    --namespace "$AB_NAMESPACE" \
    --version 'Z65DHg8V' \
    > test.out 2>&1
eval_tap $? 41 'GetImageDetail' test.out

#- 42 GetImagePatches
./ng net.accelbyte.sdk.cli.Main dsmc getImagePatches \
    --namespace "$AB_NAMESPACE" \
    --version '7aGRJ0xg' \
    > test.out 2>&1
eval_tap $? 42 'GetImagePatches' test.out

#- 43 GetImagePatchDetail
./ng net.accelbyte.sdk.cli.Main dsmc getImagePatchDetail \
    --namespace "$AB_NAMESPACE" \
    --version 'e1oHnajV' \
    --versionPatch 'jJYZmJOf' \
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
    --region 'pPYGTfYD' \
    --count '47' \
    --offset '69' \
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
    --region 'oQ9YNL5g' \
    > test.out 2>&1
eval_tap $? 47 'CountServerDetailed' test.out

#- 48 ListLocalServer
./ng net.accelbyte.sdk.cli.Main dsmc listLocalServer \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 48 'ListLocalServer' test.out

#- 49 DeleteLocalServer
./ng net.accelbyte.sdk.cli.Main dsmc deleteLocalServer \
    --name 'z1uzYUk0' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 49 'DeleteLocalServer' test.out

#- 50 GetServer
./ng net.accelbyte.sdk.cli.Main dsmc getServer \
    --namespace "$AB_NAMESPACE" \
    --podName 'tDwugujP' \
    > test.out 2>&1
eval_tap $? 50 'GetServer' test.out

#- 51 DeleteServer
./ng net.accelbyte.sdk.cli.Main dsmc deleteServer \
    --namespace "$AB_NAMESPACE" \
    --podName '5kJ0ze4K' \
    > test.out 2>&1
eval_tap $? 51 'DeleteServer' test.out

#- 52 ListSession
./ng net.accelbyte.sdk.cli.Main dsmc listSession \
    --namespace "$AB_NAMESPACE" \
    --region 'dM1QBkCA' \
    --withServer  \
    --count '86' \
    --offset '21' \
    > test.out 2>&1
eval_tap $? 52 'ListSession' test.out

#- 53 CountSession
./ng net.accelbyte.sdk.cli.Main dsmc countSession \
    --namespace "$AB_NAMESPACE" \
    --region 'rWKgRe09' \
    > test.out 2>&1
eval_tap $? 53 'CountSession' test.out

#- 54 DeleteSession
./ng net.accelbyte.sdk.cli.Main dsmc deleteSession \
    --namespace "$AB_NAMESPACE" \
    --sessionID 'JH7zBMKr' \
    > test.out 2>&1
eval_tap $? 54 'DeleteSession' test.out

#- 55 CreateRepository
./ng net.accelbyte.sdk.cli.Main dsmc createRepository \
    --body '{"namespace": "vcOThfcW", "repository": "WNcZEVPc"}' \
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
    --name 'plVk4Vde' \
    --count '77' \
    --offset '61' \
    > test.out 2>&1
eval_tap $? 58 'GetAllDeploymentClient' test.out

#- 59 CreateDeploymentClient
./ng net.accelbyte.sdk.cli.Main dsmc createDeploymentClient \
    --deployment 'iefm0JKq' \
    --namespace "$AB_NAMESPACE" \
    --body '{"allow_version_override": true, "buffer_count": 88, "buffer_percent": 10, "configuration": "gRdWOwyv", "enable_region_overrides": false, "extendable_session": false, "game_version": "rjWjK3Rq", "max_count": 66, "min_count": 65, "overrides": {"xoo9h1zZ": {"buffer_count": 1, "buffer_percent": 15, "configuration": "J9Iqkqzg", "enable_region_overrides": true, "extendable_session": true, "game_version": "zK8VaolU", "max_count": 65, "min_count": 93, "name": "kbWiKAtr", "region_overrides": {"FhprKFkV": {"buffer_count": 28, "buffer_percent": 65, "max_count": 42, "min_count": 44, "name": "O4SgaPy0", "unlimited": false, "use_buffer_percent": true}, "55MGZLto": {"buffer_count": 99, "buffer_percent": 27, "max_count": 20, "min_count": 23, "name": "Qz4sNfBj", "unlimited": false, "use_buffer_percent": false}, "7zpnh2hC": {"buffer_count": 66, "buffer_percent": 73, "max_count": 56, "min_count": 21, "name": "bNnyE8Sl", "unlimited": true, "use_buffer_percent": true}}, "regions": ["CCE8Xhyn", "DaERGPaF", "2umZr01u"], "session_timeout": 29, "unlimited": true, "use_buffer_percent": true}, "K6H9QH1u": {"buffer_count": 24, "buffer_percent": 7, "configuration": "ylHggXxb", "enable_region_overrides": true, "extendable_session": true, "game_version": "Q1I6zrdS", "max_count": 75, "min_count": 16, "name": "ZvlgukcJ", "region_overrides": {"DHSPc1vj": {"buffer_count": 28, "buffer_percent": 39, "max_count": 38, "min_count": 15, "name": "EfCge2Z3", "unlimited": true, "use_buffer_percent": true}, "sQJxqIuL": {"buffer_count": 37, "buffer_percent": 50, "max_count": 22, "min_count": 31, "name": "phUpFbUs", "unlimited": true, "use_buffer_percent": true}, "NnP7EfYZ": {"buffer_count": 68, "buffer_percent": 19, "max_count": 60, "min_count": 10, "name": "7aya5cpo", "unlimited": true, "use_buffer_percent": true}}, "regions": ["rSKXmgRu", "5z8j3rOQ", "DcjjbHF9"], "session_timeout": 8, "unlimited": true, "use_buffer_percent": true}, "BNF5YWuB": {"buffer_count": 34, "buffer_percent": 79, "configuration": "ioM6Wsw6", "enable_region_overrides": true, "extendable_session": true, "game_version": "RFDMq5Y3", "max_count": 34, "min_count": 95, "name": "kBpuKLtG", "region_overrides": {"zWErLigz": {"buffer_count": 91, "buffer_percent": 55, "max_count": 34, "min_count": 7, "name": "51fLF5Gd", "unlimited": false, "use_buffer_percent": false}, "7JBfon9w": {"buffer_count": 77, "buffer_percent": 58, "max_count": 74, "min_count": 86, "name": "sEHIg48V", "unlimited": true, "use_buffer_percent": true}, "CqXvREq1": {"buffer_count": 46, "buffer_percent": 41, "max_count": 52, "min_count": 24, "name": "YsUyXVUQ", "unlimited": true, "use_buffer_percent": false}}, "regions": ["NfM6TWOB", "KqIQcGu3", "L0BYn6mc"], "session_timeout": 99, "unlimited": false, "use_buffer_percent": true}}, "region_overrides": {"e29PR02p": {"buffer_count": 11, "buffer_percent": 80, "max_count": 60, "min_count": 11, "name": "fAECPY6g", "unlimited": false, "use_buffer_percent": true}, "hxnGyb2T": {"buffer_count": 87, "buffer_percent": 50, "max_count": 51, "min_count": 28, "name": "MGxwAjiy", "unlimited": true, "use_buffer_percent": false}, "N2XmHYWt": {"buffer_count": 1, "buffer_percent": 24, "max_count": 15, "min_count": 58, "name": "fAT3iriG", "unlimited": true, "use_buffer_percent": true}}, "regions": ["1LwfHAq6", "1GrE0n0s", "6eM4EYhb"], "session_timeout": 1, "unlimited": false, "use_buffer_percent": false}' \
    > test.out 2>&1
eval_tap $? 59 'CreateDeploymentClient' test.out

#- 60 DeleteDeploymentClient
./ng net.accelbyte.sdk.cli.Main dsmc deleteDeploymentClient \
    --deployment '34JXax4K' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 60 'DeleteDeploymentClient' test.out

#- 61 GetAllPodConfigClient
./ng net.accelbyte.sdk.cli.Main dsmc getAllPodConfigClient \
    --namespace "$AB_NAMESPACE" \
    --count '63' \
    --offset '44' \
    > test.out 2>&1
eval_tap $? 61 'GetAllPodConfigClient' test.out

#- 62 CreatePodConfigClient
./ng net.accelbyte.sdk.cli.Main dsmc createPodConfigClient \
    --name 'Vgs8pVAh' \
    --namespace "$AB_NAMESPACE" \
    --body '{"cpu_limit": 42, "mem_limit": 17, "params": "FlSVv9gH"}' \
    > test.out 2>&1
eval_tap $? 62 'CreatePodConfigClient' test.out

#- 63 DeletePodConfigClient
./ng net.accelbyte.sdk.cli.Main dsmc deletePodConfigClient \
    --name 'qgXkyk1Y' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 63 'DeletePodConfigClient' test.out

#- 64 ListImagesClient
./ng net.accelbyte.sdk.cli.Main dsmc listImagesClient \
    --namespace "$AB_NAMESPACE" \
    --count '21' \
    --offset '40' \
    --q '9hChlz59' \
    --sortBy 'updatedAt' \
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
    --version 'fXVQ31LX' \
    > test.out 2>&1
eval_tap $? 66 'ImageDetailClient' test.out

#- 67 ListServerClient
./ng net.accelbyte.sdk.cli.Main dsmc listServerClient \
    --namespace "$AB_NAMESPACE" \
    --region 'W2zje8CF' \
    --count '77' \
    --offset '58' \
    > test.out 2>&1
eval_tap $? 67 'ListServerClient' test.out

#- 68 ServerHeartbeat
./ng net.accelbyte.sdk.cli.Main dsmc serverHeartbeat \
    --namespace "$AB_NAMESPACE" \
    --body '{"podName": "XIbsmdbu"}' \
    > test.out 2>&1
eval_tap $? 68 'ServerHeartbeat' test.out

#- 69 DeregisterLocalServer
./ng net.accelbyte.sdk.cli.Main dsmc deregisterLocalServer \
    --namespace "$AB_NAMESPACE" \
    --body '{"name": "wF6X1g6z"}' \
    > test.out 2>&1
eval_tap $? 69 'DeregisterLocalServer' test.out

#- 70 RegisterLocalServer
./ng net.accelbyte.sdk.cli.Main dsmc registerLocalServer \
    --namespace "$AB_NAMESPACE" \
    --body '{"custom_attribute": "7oEJzWir", "ip": "1Gct89g3", "name": "9abgCb4P", "port": 11}' \
    > test.out 2>&1
eval_tap $? 70 'RegisterLocalServer' test.out

#- 71 RegisterServer
./ng net.accelbyte.sdk.cli.Main dsmc registerServer \
    --namespace "$AB_NAMESPACE" \
    --body '{"custom_attribute": "FaaeVmFj", "pod_name": "J6J3ej6w"}' \
    > test.out 2>&1
eval_tap $? 71 'RegisterServer' test.out

#- 72 ShutdownServer
./ng net.accelbyte.sdk.cli.Main dsmc shutdownServer \
    --namespace "$AB_NAMESPACE" \
    --body '{"kill_me": true, "pod_name": "JoKhb8RB"}' \
    > test.out 2>&1
eval_tap $? 72 'ShutdownServer' test.out

#- 73 GetServerSessionTimeout
./ng net.accelbyte.sdk.cli.Main dsmc getServerSessionTimeout \
    --namespace "$AB_NAMESPACE" \
    --podName 'BAcRjKbI' \
    > test.out 2>&1
eval_tap $? 73 'GetServerSessionTimeout' test.out

#- 74 GetServerSession
./ng net.accelbyte.sdk.cli.Main dsmc getServerSession \
    --namespace "$AB_NAMESPACE" \
    --podName 'YsV96yt7' \
    > test.out 2>&1
eval_tap $? 74 'GetServerSession' test.out

#- 75 CreateSession
./ng net.accelbyte.sdk.cli.Main dsmc createSession \
    --namespace "$AB_NAMESPACE" \
    --body '{"client_version": "Xqyh9AAN", "configuration": "tmAOOIQi", "deployment": "NXWLWh6o", "game_mode": "LuTVt1Qe", "matching_allies": [{"matching_parties": [{"party_attributes": {"Jmyvpusm": {}, "bFqeu2fF": {}, "Vg2svXJW": {}}, "party_id": "pmuJGepm", "party_members": [{"user_id": "JxjR3ylp"}, {"user_id": "oL8uhpJ6"}, {"user_id": "oWXvOKN4"}]}, {"party_attributes": {"Qey4LlFB": {}, "onyI4CmY": {}, "hCarZ6cy": {}}, "party_id": "3vaA4abV", "party_members": [{"user_id": "SrWIgeMh"}, {"user_id": "6QMImXNT"}, {"user_id": "G9sTvUHs"}]}, {"party_attributes": {"SjMSSWtT": {}, "9xHPwxkX": {}, "3hlOH8Mq": {}}, "party_id": "edDRoAW9", "party_members": [{"user_id": "acZpXVpD"}, {"user_id": "tdsDNhi1"}, {"user_id": "FlHVp0yT"}]}]}, {"matching_parties": [{"party_attributes": {"m41aJKU4": {}, "I6hPtANV": {}, "xndOKUgr": {}}, "party_id": "Iy6sDuUy", "party_members": [{"user_id": "JiCfT8Ma"}, {"user_id": "1q8N4tf3"}, {"user_id": "H4Zms1TL"}]}, {"party_attributes": {"AHkPpjEq": {}, "di99wUwe": {}, "rJ5f8KP5": {}}, "party_id": "X24OPdf2", "party_members": [{"user_id": "TWHeFnHk"}, {"user_id": "d88Z2Pcm"}, {"user_id": "VwnAhbmy"}]}, {"party_attributes": {"5nkjEWfQ": {}, "gZVa9gp2": {}, "fYgoGosF": {}}, "party_id": "1Ny3nKgM", "party_members": [{"user_id": "LaTITPhQ"}, {"user_id": "JOHhGREk"}, {"user_id": "3roWPe1e"}]}]}, {"matching_parties": [{"party_attributes": {"uZFzi6JV": {}, "H0rn9jCI": {}, "TUooObUL": {}}, "party_id": "sbDOumtS", "party_members": [{"user_id": "FUwgxrvz"}, {"user_id": "8P2kq0Y9"}, {"user_id": "QSstYHuU"}]}, {"party_attributes": {"FTaYOfKR": {}, "X8NeyvO5": {}, "MCANWrjK": {}}, "party_id": "OMoOMLV1", "party_members": [{"user_id": "ibaCDaSA"}, {"user_id": "WrJMJKHe"}, {"user_id": "utUMhbIL"}]}, {"party_attributes": {"s4LBvdIo": {}, "B86OKBVi": {}, "fdUdOrya": {}}, "party_id": "qW6HJbmx", "party_members": [{"user_id": "iF5vAegd"}, {"user_id": "n3644Slp"}, {"user_id": "r7DuZKLI"}]}]}], "namespace": "rx5BKK0M", "notification_payload": {}, "pod_name": "CLJaWJcJ", "region": "JZ8uH48v", "session_id": "axCYoBmJ"}' \
    > test.out 2>&1
eval_tap $? 75 'CreateSession' test.out

#- 76 ClaimServer
./ng net.accelbyte.sdk.cli.Main dsmc claimServer \
    --namespace "$AB_NAMESPACE" \
    --body '{"session_id": "78HrmYOi"}' \
    > test.out 2>&1
eval_tap $? 76 'ClaimServer' test.out

#- 77 GetSession
./ng net.accelbyte.sdk.cli.Main dsmc getSession \
    --namespace "$AB_NAMESPACE" \
    --sessionID 'A9VA21mk' \
    > test.out 2>&1
eval_tap $? 77 'GetSession' test.out

#- 78 CancelSession
./ng net.accelbyte.sdk.cli.Main dsmc cancelSession \
    --namespace "$AB_NAMESPACE" \
    --sessionID '67X4mfJl' \
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
    --region 'iKEvpKfQ' \
    > test.out 2>&1
eval_tap $? 81 'ListProvidersByRegion' test.out

#- 82 PublicGetMessages
./ng net.accelbyte.sdk.cli.Main dsmc publicGetMessages \
    > test.out 2>&1
eval_tap $? 82 'PublicGetMessages' test.out


rm -f "tmp.dat"

exit $EXIT_CODE