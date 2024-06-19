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
    --body '{"artifactPath": "Zlcfets5", "coreDumpEnabled": false, "image": "2nGGfF0n", "imageReplicationsMap": {"eCvWfNsF": {"failure_code": "cAKkqSyA", "region": "LZRbuOZp", "status": "egSb1n9v", "uri": "nGaTM29T"}, "gIj7w1F3": {"failure_code": "8z7Oqajb", "region": "NU5g7Sl8", "status": "5g4aCkte", "uri": "46UivYLy"}, "HZxDJgVK": {"failure_code": "MWRFtMTE", "region": "WNZjbDsA", "status": "am0NLmdd", "uri": "uLh0eYpy"}}, "namespace": "zoaXNjCR", "patchVersion": "zjpfF2LH", "persistent": true, "version": "SB2a7qE0"}' \
    > test.out 2>&1
eval_tap $? 4 'UpdateImage' test.out

#- 5 CreateImage
./ng net.accelbyte.sdk.cli.Main dsmc createImage \
    --body '{"artifactPath": "UVXrb1Ju", "coreDumpEnabled": true, "dockerPath": "MKSBm4lp", "image": "iFsGS2Bx", "imageSize": 26, "namespace": "54krC6Uk", "persistent": false, "ulimitFileSize": 3, "version": "CAn37xp0"}' \
    > test.out 2>&1
eval_tap $? 5 'CreateImage' test.out

#- 6 ImportImages
./ng net.accelbyte.sdk.cli.Main dsmc importImages \
    --file 'tmp.dat' \
    > test.out 2>&1
eval_tap $? 6 'ImportImages' test.out

#- 7 CreateImagePatch
./ng net.accelbyte.sdk.cli.Main dsmc createImagePatch \
    --body '{"artifactPath": "sWRDlshT", "coreDumpEnabled": true, "dockerPath": "A73sU8kg", "image": "HeipAjHK", "imageSize": 63, "namespace": "20aatr8a", "patchVersion": "rbE56hdC", "persistent": true, "ulimitFileSize": 43, "uploaderFlag": "ba1uh6VP", "version": "4GHNGKW4"}' \
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
    --body '{"claim_timeout": 45, "creation_timeout": 97, "default_version": "ATG9NK0x", "port": 48, "ports": {"VX6nG3UD": 17, "NxBvdu9m": 2, "NRr6fJMy": 35}, "protocol": "1vO3Jt0T", "providers": ["UWIdtn4b", "xf19WWFS", "81WgducU"], "session_timeout": 36, "unreachable_timeout": 61}' \
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
    --body '{"claim_timeout": 78, "creation_timeout": 75, "default_version": "i1v0QXjX", "port": 22, "protocol": "8gliIDSM", "providers": ["ckQ00UK9", "AvgubNg3", "Bts2Jcza"], "session_timeout": 64, "unreachable_timeout": 4}' \
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
    --name 'IyY1SeaT' \
    --count '27' \
    --offset '21' \
    > test.out 2>&1
eval_tap $? 14 'GetAllDeployment' test.out

#- 15 GetDeployment
./ng net.accelbyte.sdk.cli.Main dsmc getDeployment \
    --deployment '1mYNYKwO' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 15 'GetDeployment' test.out

#- 16 CreateDeployment
./ng net.accelbyte.sdk.cli.Main dsmc createDeployment \
    --deployment 'KcH6qoqH' \
    --namespace "$AB_NAMESPACE" \
    --body '{"allow_version_override": false, "buffer_count": 35, "buffer_percent": 51, "configuration": "6b7Q8Jin", "enable_region_overrides": true, "extendable_session": false, "game_version": "SZIa2Iy3", "max_count": 39, "min_count": 50, "overrides": {"aTmez8CA": {"buffer_count": 68, "buffer_percent": 42, "configuration": "WIg9MuTN", "enable_region_overrides": false, "extendable_session": true, "game_version": "fvXisGr3", "max_count": 45, "min_count": 4, "name": "5E4WNhxK", "region_overrides": {"LREMc3KX": {"buffer_count": 29, "buffer_percent": 6, "max_count": 5, "min_count": 9, "name": "XgpOVtXd", "unlimited": false, "use_buffer_percent": true}, "yehJQKup": {"buffer_count": 89, "buffer_percent": 83, "max_count": 99, "min_count": 95, "name": "v20dYFyN", "unlimited": false, "use_buffer_percent": false}, "2Tle4yJP": {"buffer_count": 62, "buffer_percent": 14, "max_count": 83, "min_count": 96, "name": "zpGzkusa", "unlimited": true, "use_buffer_percent": false}}, "regions": ["KKqvdKTp", "LkPR5oVc", "jLHiYeBw"], "session_timeout": 62, "unlimited": true, "use_buffer_percent": true}, "vXJ56Zwi": {"buffer_count": 8, "buffer_percent": 90, "configuration": "IYvwZNSJ", "enable_region_overrides": false, "extendable_session": false, "game_version": "FgKyAZHX", "max_count": 6, "min_count": 84, "name": "vmgCRaPs", "region_overrides": {"ct5Cg2WT": {"buffer_count": 70, "buffer_percent": 41, "max_count": 8, "min_count": 5, "name": "uSspjrbk", "unlimited": false, "use_buffer_percent": false}, "brHQkbaB": {"buffer_count": 11, "buffer_percent": 61, "max_count": 95, "min_count": 70, "name": "dWwJKGhY", "unlimited": false, "use_buffer_percent": false}, "BAV1V6KK": {"buffer_count": 11, "buffer_percent": 90, "max_count": 46, "min_count": 61, "name": "Svbv8yno", "unlimited": false, "use_buffer_percent": false}}, "regions": ["LjNkQxqK", "CeADTKZz", "rioP1EzS"], "session_timeout": 38, "unlimited": true, "use_buffer_percent": true}, "08io1DdE": {"buffer_count": 3, "buffer_percent": 22, "configuration": "Y00IKstp", "enable_region_overrides": true, "extendable_session": false, "game_version": "TaN8JWYf", "max_count": 17, "min_count": 49, "name": "d7w6mrgG", "region_overrides": {"HTH7l1gE": {"buffer_count": 75, "buffer_percent": 80, "max_count": 7, "min_count": 74, "name": "Udtz0NMY", "unlimited": true, "use_buffer_percent": true}, "4gp38vPT": {"buffer_count": 92, "buffer_percent": 100, "max_count": 52, "min_count": 20, "name": "Sulg5BK4", "unlimited": false, "use_buffer_percent": true}, "iMOSX1K9": {"buffer_count": 39, "buffer_percent": 92, "max_count": 67, "min_count": 60, "name": "YR9xG3yq", "unlimited": true, "use_buffer_percent": true}}, "regions": ["1Sy277r8", "sb6nMxRs", "4iDh7OvX"], "session_timeout": 93, "unlimited": true, "use_buffer_percent": true}}, "region_overrides": {"nrdav0Tc": {"buffer_count": 12, "buffer_percent": 40, "max_count": 73, "min_count": 76, "name": "u6C1r7ts", "unlimited": false, "use_buffer_percent": true}, "vHKINrsB": {"buffer_count": 60, "buffer_percent": 64, "max_count": 87, "min_count": 88, "name": "xmglrftH", "unlimited": false, "use_buffer_percent": true}, "DM9QChmZ": {"buffer_count": 53, "buffer_percent": 45, "max_count": 6, "min_count": 88, "name": "Y95s1346", "unlimited": true, "use_buffer_percent": true}}, "regions": ["Ckdj9sJz", "UZfpSMQa", "BAwoYa1h"], "session_timeout": 41, "unlimited": true, "use_buffer_percent": true}' \
    > test.out 2>&1
eval_tap $? 16 'CreateDeployment' test.out

#- 17 DeleteDeployment
./ng net.accelbyte.sdk.cli.Main dsmc deleteDeployment \
    --deployment 'wjYpYAQU' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 17 'DeleteDeployment' test.out

#- 18 UpdateDeployment
./ng net.accelbyte.sdk.cli.Main dsmc updateDeployment \
    --deployment 'ro2RJ2WD' \
    --namespace "$AB_NAMESPACE" \
    --body '{"allow_version_override": false, "buffer_count": 6, "buffer_percent": 95, "configuration": "o8qgHbLK", "enable_region_overrides": false, "extendable_session": true, "game_version": "ardASMpf", "max_count": 35, "min_count": 65, "regions": ["0UM0qXx2", "os95U7wa", "fEaMWDjl"], "session_timeout": 77, "unlimited": false, "use_buffer_percent": true}' \
    > test.out 2>&1
eval_tap $? 18 'UpdateDeployment' test.out

#- 19 CreateRootRegionOverride
./ng net.accelbyte.sdk.cli.Main dsmc createRootRegionOverride \
    --deployment '5k57NXvh' \
    --namespace "$AB_NAMESPACE" \
    --region 'RyZxuVLk' \
    --body '{"buffer_count": 74, "buffer_percent": 18, "max_count": 5, "min_count": 16, "unlimited": true, "use_buffer_percent": true}' \
    > test.out 2>&1
eval_tap $? 19 'CreateRootRegionOverride' test.out

#- 20 DeleteRootRegionOverride
./ng net.accelbyte.sdk.cli.Main dsmc deleteRootRegionOverride \
    --deployment 'UrrkX6cJ' \
    --namespace "$AB_NAMESPACE" \
    --region 'EewrN35I' \
    > test.out 2>&1
eval_tap $? 20 'DeleteRootRegionOverride' test.out

#- 21 UpdateRootRegionOverride
./ng net.accelbyte.sdk.cli.Main dsmc updateRootRegionOverride \
    --deployment 's2iqYiZD' \
    --namespace "$AB_NAMESPACE" \
    --region 'sFk4ArJ5' \
    --body '{"buffer_count": 38, "buffer_percent": 12, "max_count": 98, "min_count": 90, "unlimited": true, "use_buffer_percent": true}' \
    > test.out 2>&1
eval_tap $? 21 'UpdateRootRegionOverride' test.out

#- 22 CreateDeploymentOverride
./ng net.accelbyte.sdk.cli.Main dsmc createDeploymentOverride \
    --deployment 'MnIDKPQX' \
    --namespace "$AB_NAMESPACE" \
    --version 'sCKAunH6' \
    --body '{"buffer_count": 22, "buffer_percent": 56, "configuration": "ysZYBLx5", "enable_region_overrides": false, "extendable_session": true, "game_version": "lIPG910f", "max_count": 7, "min_count": 30, "region_overrides": {"f9ZLzRer": {"buffer_count": 18, "buffer_percent": 35, "max_count": 90, "min_count": 13, "name": "B6Mhxlh5", "unlimited": true, "use_buffer_percent": false}, "T0FYlcAz": {"buffer_count": 57, "buffer_percent": 56, "max_count": 28, "min_count": 70, "name": "i3IfUnG5", "unlimited": true, "use_buffer_percent": true}, "Xp8Ug4PV": {"buffer_count": 41, "buffer_percent": 47, "max_count": 12, "min_count": 55, "name": "THZKwBGM", "unlimited": true, "use_buffer_percent": true}}, "regions": ["0BwnSbve", "Jsh6T3D1", "amByJLJz"], "session_timeout": 49, "unlimited": true, "use_buffer_percent": true}' \
    > test.out 2>&1
eval_tap $? 22 'CreateDeploymentOverride' test.out

#- 23 DeleteDeploymentOverride
./ng net.accelbyte.sdk.cli.Main dsmc deleteDeploymentOverride \
    --deployment '4VvcYByv' \
    --namespace "$AB_NAMESPACE" \
    --version 'UrsXiHqW' \
    > test.out 2>&1
eval_tap $? 23 'DeleteDeploymentOverride' test.out

#- 24 UpdateDeploymentOverride
./ng net.accelbyte.sdk.cli.Main dsmc updateDeploymentOverride \
    --deployment 'oYocMtv1' \
    --namespace "$AB_NAMESPACE" \
    --version 'zrPX0cgp' \
    --body '{"buffer_count": 25, "buffer_percent": 57, "configuration": "cekEvuA9", "enable_region_overrides": false, "game_version": "FaSQjeyq", "max_count": 70, "min_count": 16, "regions": ["IUNM0bxC", "EeWYe1ik", "2jhSCwew"], "session_timeout": 75, "unlimited": true, "use_buffer_percent": false}' \
    > test.out 2>&1
eval_tap $? 24 'UpdateDeploymentOverride' test.out

#- 25 CreateOverrideRegionOverride
./ng net.accelbyte.sdk.cli.Main dsmc createOverrideRegionOverride \
    --deployment 'OAfA8YnH' \
    --namespace "$AB_NAMESPACE" \
    --region 'z7eoUrq7' \
    --version '0g3VcLtf' \
    --body '{"buffer_count": 7, "buffer_percent": 14, "max_count": 65, "min_count": 59, "unlimited": true, "use_buffer_percent": true}' \
    > test.out 2>&1
eval_tap $? 25 'CreateOverrideRegionOverride' test.out

#- 26 DeleteOverrideRegionOverride
./ng net.accelbyte.sdk.cli.Main dsmc deleteOverrideRegionOverride \
    --deployment 'MNwO9jrT' \
    --namespace "$AB_NAMESPACE" \
    --region 'ixbAypCU' \
    --version 'Lut386de' \
    > test.out 2>&1
eval_tap $? 26 'DeleteOverrideRegionOverride' test.out

#- 27 UpdateOverrideRegionOverride
./ng net.accelbyte.sdk.cli.Main dsmc updateOverrideRegionOverride \
    --deployment '8uhLVeWE' \
    --namespace "$AB_NAMESPACE" \
    --region 'fwXfk2qD' \
    --version '4CY23uVV' \
    --body '{"buffer_count": 51, "buffer_percent": 26, "max_count": 78, "min_count": 95, "unlimited": true, "use_buffer_percent": false}' \
    > test.out 2>&1
eval_tap $? 27 'UpdateOverrideRegionOverride' test.out

#- 28 GetAllPodConfig
./ng net.accelbyte.sdk.cli.Main dsmc getAllPodConfig \
    --namespace "$AB_NAMESPACE" \
    --count '10' \
    --offset '4' \
    > test.out 2>&1
eval_tap $? 28 'GetAllPodConfig' test.out

#- 29 GetPodConfig
./ng net.accelbyte.sdk.cli.Main dsmc getPodConfig \
    --name 'G9VGaINT' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 29 'GetPodConfig' test.out

#- 30 CreatePodConfig
./ng net.accelbyte.sdk.cli.Main dsmc createPodConfig \
    --name 'TumrJkX1' \
    --namespace "$AB_NAMESPACE" \
    --body '{"cpu_limit": 7, "mem_limit": 2, "params": "lyRd7SMB"}' \
    > test.out 2>&1
eval_tap $? 30 'CreatePodConfig' test.out

#- 31 DeletePodConfig
./ng net.accelbyte.sdk.cli.Main dsmc deletePodConfig \
    --name 'u9eTOZZj' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 31 'DeletePodConfig' test.out

#- 32 UpdatePodConfig
./ng net.accelbyte.sdk.cli.Main dsmc updatePodConfig \
    --name 'YnTbHDTr' \
    --namespace "$AB_NAMESPACE" \
    --body '{"cpu_limit": 25, "mem_limit": 49, "name": "6R6So7H6", "params": "5Ts0GGiS"}' \
    > test.out 2>&1
eval_tap $? 32 'UpdatePodConfig' test.out

#- 33 AddPort
./ng net.accelbyte.sdk.cli.Main dsmc addPort \
    --name 'mflLyrIX' \
    --namespace "$AB_NAMESPACE" \
    --body '{"port": 66}' \
    > test.out 2>&1
eval_tap $? 33 'AddPort' test.out

#- 34 DeletePort
./ng net.accelbyte.sdk.cli.Main dsmc deletePort \
    --name 'ckZjIPhL' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 34 'DeletePort' test.out

#- 35 UpdatePort
./ng net.accelbyte.sdk.cli.Main dsmc updatePort \
    --name 'yZOTKOzV' \
    --namespace "$AB_NAMESPACE" \
    --body '{"name": "B2qwqluj", "port": 21}' \
    > test.out 2>&1
eval_tap $? 35 'UpdatePort' test.out

#- 36 ListImages
./ng net.accelbyte.sdk.cli.Main dsmc listImages \
    --namespace "$AB_NAMESPACE" \
    --q 'xCnWVvQb' \
    --sortBy 'updatedAt' \
    --sortDirection 'desc' \
    --count '49' \
    --offset '90' \
    > test.out 2>&1
eval_tap $? 36 'ListImages' test.out

#- 37 DeleteImage
./ng net.accelbyte.sdk.cli.Main dsmc deleteImage \
    --namespace "$AB_NAMESPACE" \
    --imageURI 'gou1H4v9' \
    --version 'P4MCixub' \
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
    --imageURI '1yqT0D4i' \
    --version 'QArTpQeF' \
    --versionPatch 'jdmQ8Igj' \
    > test.out 2>&1
eval_tap $? 40 'DeleteImagePatch' test.out

#- 41 GetImageDetail
./ng net.accelbyte.sdk.cli.Main dsmc getImageDetail \
    --namespace "$AB_NAMESPACE" \
    --version 'CBoEZp1j' \
    > test.out 2>&1
eval_tap $? 41 'GetImageDetail' test.out

#- 42 GetImagePatches
./ng net.accelbyte.sdk.cli.Main dsmc getImagePatches \
    --namespace "$AB_NAMESPACE" \
    --version 'UW15Jbv9' \
    > test.out 2>&1
eval_tap $? 42 'GetImagePatches' test.out

#- 43 GetImagePatchDetail
./ng net.accelbyte.sdk.cli.Main dsmc getImagePatchDetail \
    --namespace "$AB_NAMESPACE" \
    --version '9Iy6boti' \
    --versionPatch 'Lw9RBqDb' \
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
    --region 'lBdYDUpe' \
    --count '100' \
    --offset '13' \
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
    --region 'goaqF26B' \
    > test.out 2>&1
eval_tap $? 47 'CountServerDetailed' test.out

#- 48 ListLocalServer
./ng net.accelbyte.sdk.cli.Main dsmc listLocalServer \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 48 'ListLocalServer' test.out

#- 49 DeleteLocalServer
./ng net.accelbyte.sdk.cli.Main dsmc deleteLocalServer \
    --name 'WlgeO5xJ' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 49 'DeleteLocalServer' test.out

#- 50 GetServer
./ng net.accelbyte.sdk.cli.Main dsmc getServer \
    --namespace "$AB_NAMESPACE" \
    --podName 'bFRFBvGm' \
    > test.out 2>&1
eval_tap $? 50 'GetServer' test.out

#- 51 DeleteServer
./ng net.accelbyte.sdk.cli.Main dsmc deleteServer \
    --namespace "$AB_NAMESPACE" \
    --podName 'WfyNRKHg' \
    > test.out 2>&1
eval_tap $? 51 'DeleteServer' test.out

#- 52 ListSession
./ng net.accelbyte.sdk.cli.Main dsmc listSession \
    --namespace "$AB_NAMESPACE" \
    --region 'OKH0Mwge' \
    --withServer  \
    --count '82' \
    --offset '15' \
    > test.out 2>&1
eval_tap $? 52 'ListSession' test.out

#- 53 CountSession
./ng net.accelbyte.sdk.cli.Main dsmc countSession \
    --namespace "$AB_NAMESPACE" \
    --region '8SSCnjSF' \
    > test.out 2>&1
eval_tap $? 53 'CountSession' test.out

#- 54 DeleteSession
./ng net.accelbyte.sdk.cli.Main dsmc deleteSession \
    --namespace "$AB_NAMESPACE" \
    --sessionID 'sY0bxcp3' \
    > test.out 2>&1
eval_tap $? 54 'DeleteSession' test.out

#- 55 CreateRepository
./ng net.accelbyte.sdk.cli.Main dsmc createRepository \
    --body '{"namespace": "B9JA0wdB", "repository": "A7HqjLVr"}' \
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
    --name 'TeifEs6s' \
    --count '20' \
    --offset '76' \
    > test.out 2>&1
eval_tap $? 58 'GetAllDeploymentClient' test.out

#- 59 CreateDeploymentClient
./ng net.accelbyte.sdk.cli.Main dsmc createDeploymentClient \
    --deployment 'nBGG9mfK' \
    --namespace "$AB_NAMESPACE" \
    --body '{"allow_version_override": false, "buffer_count": 5, "buffer_percent": 50, "configuration": "wbJClePf", "enable_region_overrides": false, "extendable_session": true, "game_version": "VuPw2Ddk", "max_count": 92, "min_count": 24, "overrides": {"DpWNxMXH": {"buffer_count": 62, "buffer_percent": 69, "configuration": "ActvP5AY", "enable_region_overrides": false, "extendable_session": false, "game_version": "ZplxA6qh", "max_count": 20, "min_count": 28, "name": "h2kGLPLc", "region_overrides": {"USLRC5mo": {"buffer_count": 18, "buffer_percent": 8, "max_count": 89, "min_count": 47, "name": "onncqbFJ", "unlimited": false, "use_buffer_percent": true}, "jehhwyMd": {"buffer_count": 37, "buffer_percent": 51, "max_count": 2, "min_count": 80, "name": "YVC2wwi5", "unlimited": true, "use_buffer_percent": false}, "Jr7KbkWv": {"buffer_count": 50, "buffer_percent": 18, "max_count": 8, "min_count": 35, "name": "1YRjFhBt", "unlimited": true, "use_buffer_percent": false}}, "regions": ["uiLjIZh7", "6XTKw4wm", "JWf41Z2e"], "session_timeout": 10, "unlimited": true, "use_buffer_percent": true}, "hemYZLFM": {"buffer_count": 93, "buffer_percent": 25, "configuration": "UO46QYw5", "enable_region_overrides": true, "extendable_session": true, "game_version": "WTh9QWfM", "max_count": 80, "min_count": 24, "name": "N5CDlBa2", "region_overrides": {"v14TCMgc": {"buffer_count": 27, "buffer_percent": 37, "max_count": 39, "min_count": 17, "name": "UnCsrmk9", "unlimited": false, "use_buffer_percent": false}, "EvigdYHu": {"buffer_count": 45, "buffer_percent": 50, "max_count": 72, "min_count": 45, "name": "AuO0hU8g", "unlimited": false, "use_buffer_percent": false}, "9tUzEZkx": {"buffer_count": 13, "buffer_percent": 35, "max_count": 2, "min_count": 82, "name": "MrtfiZJ6", "unlimited": false, "use_buffer_percent": false}}, "regions": ["heb4sgd2", "7uwA3RG6", "fmJcZjem"], "session_timeout": 20, "unlimited": false, "use_buffer_percent": true}, "HakyvQGT": {"buffer_count": 53, "buffer_percent": 99, "configuration": "62q2RHfJ", "enable_region_overrides": false, "extendable_session": true, "game_version": "uJ03wWwT", "max_count": 72, "min_count": 63, "name": "jiIRTmfa", "region_overrides": {"qnlcJKeE": {"buffer_count": 90, "buffer_percent": 55, "max_count": 69, "min_count": 4, "name": "jRJydN67", "unlimited": true, "use_buffer_percent": false}, "PdE3oJ5C": {"buffer_count": 11, "buffer_percent": 96, "max_count": 67, "min_count": 77, "name": "8YjcJILc", "unlimited": false, "use_buffer_percent": false}, "xxczk1yW": {"buffer_count": 43, "buffer_percent": 83, "max_count": 30, "min_count": 30, "name": "0enb7QP0", "unlimited": true, "use_buffer_percent": false}}, "regions": ["cckUVTAc", "Z44X0UZf", "6rMXSx2V"], "session_timeout": 40, "unlimited": false, "use_buffer_percent": false}}, "region_overrides": {"WmHQpkTZ": {"buffer_count": 6, "buffer_percent": 45, "max_count": 9, "min_count": 95, "name": "9tHFe38J", "unlimited": false, "use_buffer_percent": true}, "11My5RpW": {"buffer_count": 66, "buffer_percent": 38, "max_count": 50, "min_count": 25, "name": "RLoISrZe", "unlimited": true, "use_buffer_percent": true}, "qqqNEXHb": {"buffer_count": 84, "buffer_percent": 94, "max_count": 44, "min_count": 97, "name": "IqgKD0lD", "unlimited": true, "use_buffer_percent": true}}, "regions": ["H3osetpn", "4cTqQquJ", "NFYevPND"], "session_timeout": 89, "unlimited": true, "use_buffer_percent": true}' \
    > test.out 2>&1
eval_tap $? 59 'CreateDeploymentClient' test.out

#- 60 DeleteDeploymentClient
./ng net.accelbyte.sdk.cli.Main dsmc deleteDeploymentClient \
    --deployment 'TiS4sZTy' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 60 'DeleteDeploymentClient' test.out

#- 61 GetAllPodConfigClient
./ng net.accelbyte.sdk.cli.Main dsmc getAllPodConfigClient \
    --namespace "$AB_NAMESPACE" \
    --count '56' \
    --offset '4' \
    > test.out 2>&1
eval_tap $? 61 'GetAllPodConfigClient' test.out

#- 62 CreatePodConfigClient
./ng net.accelbyte.sdk.cli.Main dsmc createPodConfigClient \
    --name '2Grry9Fk' \
    --namespace "$AB_NAMESPACE" \
    --body '{"cpu_limit": 36, "mem_limit": 3, "params": "AJUz87sn"}' \
    > test.out 2>&1
eval_tap $? 62 'CreatePodConfigClient' test.out

#- 63 DeletePodConfigClient
./ng net.accelbyte.sdk.cli.Main dsmc deletePodConfigClient \
    --name 'PloM7Q0i' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 63 'DeletePodConfigClient' test.out

#- 64 ListImagesClient
./ng net.accelbyte.sdk.cli.Main dsmc listImagesClient \
    --namespace "$AB_NAMESPACE" \
    --count '45' \
    --offset '25' \
    --q 'VRIY34fG' \
    --sortBy 'createdAt' \
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
    --version 'P06X6yNe' \
    > test.out 2>&1
eval_tap $? 66 'ImageDetailClient' test.out

#- 67 ListServerClient
./ng net.accelbyte.sdk.cli.Main dsmc listServerClient \
    --namespace "$AB_NAMESPACE" \
    --region 'o6O3IC0v' \
    --count '18' \
    --offset '46' \
    > test.out 2>&1
eval_tap $? 67 'ListServerClient' test.out

#- 68 ServerHeartbeat
./ng net.accelbyte.sdk.cli.Main dsmc serverHeartbeat \
    --namespace "$AB_NAMESPACE" \
    --body '{"podName": "ORVVeU7j"}' \
    > test.out 2>&1
eval_tap $? 68 'ServerHeartbeat' test.out

#- 69 DeregisterLocalServer
./ng net.accelbyte.sdk.cli.Main dsmc deregisterLocalServer \
    --namespace "$AB_NAMESPACE" \
    --body '{"name": "5eukJUaj"}' \
    > test.out 2>&1
eval_tap $? 69 'DeregisterLocalServer' test.out

#- 70 RegisterLocalServer
./ng net.accelbyte.sdk.cli.Main dsmc registerLocalServer \
    --namespace "$AB_NAMESPACE" \
    --body '{"custom_attribute": "FCeAvAdo", "ip": "Z5BM2j6H", "name": "W89uhuZ6", "port": 16}' \
    > test.out 2>&1
eval_tap $? 70 'RegisterLocalServer' test.out

#- 71 RegisterServer
./ng net.accelbyte.sdk.cli.Main dsmc registerServer \
    --namespace "$AB_NAMESPACE" \
    --body '{"custom_attribute": "eG7eZ7EL", "pod_name": "xcqBVOok"}' \
    > test.out 2>&1
eval_tap $? 71 'RegisterServer' test.out

#- 72 ShutdownServer
./ng net.accelbyte.sdk.cli.Main dsmc shutdownServer \
    --namespace "$AB_NAMESPACE" \
    --body '{"kill_me": true, "pod_name": "S8rIMlfo"}' \
    > test.out 2>&1
eval_tap $? 72 'ShutdownServer' test.out

#- 73 GetServerSessionTimeout
./ng net.accelbyte.sdk.cli.Main dsmc getServerSessionTimeout \
    --namespace "$AB_NAMESPACE" \
    --podName 'c6SNCTKv' \
    > test.out 2>&1
eval_tap $? 73 'GetServerSessionTimeout' test.out

#- 74 GetServerSession
./ng net.accelbyte.sdk.cli.Main dsmc getServerSession \
    --namespace "$AB_NAMESPACE" \
    --podName 'T2Xz8jBG' \
    > test.out 2>&1
eval_tap $? 74 'GetServerSession' test.out

#- 75 CreateSession
./ng net.accelbyte.sdk.cli.Main dsmc createSession \
    --namespace "$AB_NAMESPACE" \
    --body '{"client_version": "fGc9xxp9", "configuration": "zoOh9w7m", "deployment": "0iymLkak", "game_mode": "sigR7GnV", "matching_allies": [{"matching_parties": [{"party_attributes": {"Dv4bd3ex": {}, "1wfg9XIQ": {}, "y2wNpDIX": {}}, "party_id": "7Q1jrYKx", "party_members": [{"user_id": "XbnhoTP1"}, {"user_id": "nHLeHUAw"}, {"user_id": "uJCM1uN9"}]}, {"party_attributes": {"Yo84j4oz": {}, "86RvKv00": {}, "jWHQBEIm": {}}, "party_id": "XTyJBoap", "party_members": [{"user_id": "A2XKgl5o"}, {"user_id": "VXy0q3ij"}, {"user_id": "5kRQBwvF"}]}, {"party_attributes": {"T1itWjI7": {}, "gRlMG7Ls": {}, "L9lMf18a": {}}, "party_id": "qwqFMF6u", "party_members": [{"user_id": "u2iTtssE"}, {"user_id": "TOkRAy9q"}, {"user_id": "mlnM7aYd"}]}]}, {"matching_parties": [{"party_attributes": {"1w0Zdmc3": {}, "LRUihu2i": {}, "bwjGa0Tc": {}}, "party_id": "149wZLVQ", "party_members": [{"user_id": "bgDhBgeh"}, {"user_id": "C9DzUdda"}, {"user_id": "NgZkuZwy"}]}, {"party_attributes": {"d5DUPMRK": {}, "LhhAsahy": {}, "FKCOptFB": {}}, "party_id": "yQnT9eCJ", "party_members": [{"user_id": "BJ05C5fo"}, {"user_id": "kvTCjPqa"}, {"user_id": "BqSKjAHS"}]}, {"party_attributes": {"l28KoA7r": {}, "le7dZueO": {}, "LCtHFetP": {}}, "party_id": "O4xh76Yk", "party_members": [{"user_id": "RHrFKOl5"}, {"user_id": "Jed8Ogpv"}, {"user_id": "RMHymkX8"}]}]}, {"matching_parties": [{"party_attributes": {"j5vxDBO5": {}, "FEKawrz0": {}, "O0fvMfrx": {}}, "party_id": "Mb8St9nY", "party_members": [{"user_id": "cEP1A5P5"}, {"user_id": "4T49Yh7N"}, {"user_id": "MXBkcjJv"}]}, {"party_attributes": {"hDZVxCpf": {}, "EjgR6T8m": {}, "5oGMG1oQ": {}}, "party_id": "x06ns48M", "party_members": [{"user_id": "q01qMsde"}, {"user_id": "mg3eHIJK"}, {"user_id": "4o8Lkwqa"}]}, {"party_attributes": {"fT4BVIN8": {}, "0gQ9UkzO": {}, "MhOEub1I": {}}, "party_id": "vz2g5Ig8", "party_members": [{"user_id": "5ZwjdVRG"}, {"user_id": "gmQO6U4I"}, {"user_id": "f8WaJbBx"}]}]}], "namespace": "yFX1glEj", "notification_payload": {}, "pod_name": "HmgqQfow", "region": "XgzF7Ptl", "session_id": "ZdfDJl7x"}' \
    > test.out 2>&1
eval_tap $? 75 'CreateSession' test.out

#- 76 ClaimServer
./ng net.accelbyte.sdk.cli.Main dsmc claimServer \
    --namespace "$AB_NAMESPACE" \
    --body '{"session_id": "SnZUOqUS"}' \
    > test.out 2>&1
eval_tap $? 76 'ClaimServer' test.out

#- 77 GetSession
./ng net.accelbyte.sdk.cli.Main dsmc getSession \
    --namespace "$AB_NAMESPACE" \
    --sessionID '8yD5hecn' \
    > test.out 2>&1
eval_tap $? 77 'GetSession' test.out

#- 78 CancelSession
./ng net.accelbyte.sdk.cli.Main dsmc cancelSession \
    --namespace "$AB_NAMESPACE" \
    --sessionID 'yVTKm5Dh' \
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
    --region 'DOFJOmbq' \
    > test.out 2>&1
eval_tap $? 81 'ListProvidersByRegion' test.out

#- 82 PublicGetMessages
./ng net.accelbyte.sdk.cli.Main dsmc publicGetMessages \
    > test.out 2>&1
eval_tap $? 82 'PublicGetMessages' test.out


rm -f "tmp.dat"

exit $EXIT_CODE