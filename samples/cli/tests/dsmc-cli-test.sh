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
    --body '{"artifactPath": "8MERdlDD", "coreDumpEnabled": false, "image": "QuWXZwYy", "imageReplicationsMap": {"RDjyu2os": {"failure_code": "sHbHUTXA", "region": "1GMgMYbz", "status": "GrZCp6xU", "uri": "cwZTQMqH"}, "eNcpWJCD": {"failure_code": "eweM14yz", "region": "7ysfWtcG", "status": "zC00ZjTV", "uri": "fvQ0HlWz"}, "Nogt1Pyg": {"failure_code": "N5PlgYFB", "region": "emq06TdI", "status": "LPUCV3cH", "uri": "b9FvBrPE"}}, "namespace": "W728qnpU", "patchVersion": "wxwbaMwE", "persistent": true, "version": "Weesep0b"}' \
    > test.out 2>&1
eval_tap $? 4 'UpdateImage' test.out

#- 5 CreateImage
./ng net.accelbyte.sdk.cli.Main dsmc createImage \
    --body '{"artifactPath": "pLIO7kdy", "coreDumpEnabled": false, "dockerPath": "XpXbeYx9", "image": "wJcfjDZC", "imageSize": 40, "namespace": "fAVPGc7y", "persistent": true, "ulimitFileSize": 24, "version": "6b8N84ba"}' \
    > test.out 2>&1
eval_tap $? 5 'CreateImage' test.out

#- 6 ImportImages
./ng net.accelbyte.sdk.cli.Main dsmc importImages \
    --file 'tmp.dat' \
    > test.out 2>&1
eval_tap $? 6 'ImportImages' test.out

#- 7 CreateImagePatch
./ng net.accelbyte.sdk.cli.Main dsmc createImagePatch \
    --body '{"artifactPath": "QRKpIfHP", "coreDumpEnabled": true, "dockerPath": "ZuJw3UyP", "image": "lxNg731a", "imageSize": 11, "namespace": "pgPOmoJR", "patchVersion": "voq2k3ry", "persistent": true, "ulimitFileSize": 70, "uploaderFlag": "U2rhVStL", "version": "gUzRyy7V"}' \
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
    --body '{"claim_timeout": 39, "creation_timeout": 61, "default_version": "v1ipV0Cc", "port": 98, "ports": {"uMde3111": 96, "gIhXMyLQ": 95, "PIdjiN08": 50}, "protocol": "xJWBaknm", "providers": ["Po9G0JdU", "Xx8Ju91k", "yMfh8NR3"], "session_timeout": 50, "unreachable_timeout": 17}' \
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
    --body '{"claim_timeout": 50, "creation_timeout": 25, "default_version": "GskJA6SN", "port": 13, "protocol": "TiFGVNJQ", "providers": ["socbC1OS", "Hkt2OChz", "L6lqDXUO"], "session_timeout": 88, "unreachable_timeout": 34}' \
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
    --name 'XcXUEOn6' \
    --count '54' \
    --offset '2' \
    > test.out 2>&1
eval_tap $? 14 'GetAllDeployment' test.out

#- 15 GetDeployment
./ng net.accelbyte.sdk.cli.Main dsmc getDeployment \
    --deployment 'pjuUFOLh' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 15 'GetDeployment' test.out

#- 16 CreateDeployment
./ng net.accelbyte.sdk.cli.Main dsmc createDeployment \
    --deployment 'dNAwkN5j' \
    --namespace "$AB_NAMESPACE" \
    --body '{"allow_version_override": true, "buffer_count": 3, "buffer_percent": 30, "configuration": "aD0tvKEB", "enable_region_overrides": false, "extendable_session": false, "game_version": "gfR0QE5l", "max_count": 86, "min_count": 49, "overrides": {"1ygcsMkw": {"buffer_count": 44, "buffer_percent": 74, "configuration": "wQXc7vLz", "enable_region_overrides": true, "extendable_session": false, "game_version": "dIw4eb7G", "max_count": 61, "min_count": 92, "name": "smXCBgtq", "region_overrides": {"tuw5UF4e": {"buffer_count": 90, "buffer_percent": 60, "max_count": 58, "min_count": 45, "name": "9Z1vKdDS", "unlimited": true, "use_buffer_percent": false}, "qx2J6q5w": {"buffer_count": 58, "buffer_percent": 6, "max_count": 54, "min_count": 81, "name": "uiIWRTjQ", "unlimited": false, "use_buffer_percent": true}, "Qu8k1RpZ": {"buffer_count": 90, "buffer_percent": 71, "max_count": 25, "min_count": 20, "name": "Yd1TWzFl", "unlimited": true, "use_buffer_percent": true}}, "regions": ["yxeG9PAO", "hL8M91fK", "hJnfcMR4"], "session_timeout": 53, "unlimited": false, "use_buffer_percent": true}, "Smtsr5J7": {"buffer_count": 33, "buffer_percent": 3, "configuration": "HmLTSYXC", "enable_region_overrides": false, "extendable_session": true, "game_version": "bKbpFCed", "max_count": 15, "min_count": 3, "name": "wgwlEHIj", "region_overrides": {"wNHGaB8l": {"buffer_count": 35, "buffer_percent": 19, "max_count": 73, "min_count": 3, "name": "e30uBFAq", "unlimited": false, "use_buffer_percent": true}, "uF73qtPV": {"buffer_count": 22, "buffer_percent": 11, "max_count": 84, "min_count": 19, "name": "zw0pIxPd", "unlimited": false, "use_buffer_percent": false}, "YarIvY7p": {"buffer_count": 71, "buffer_percent": 72, "max_count": 51, "min_count": 59, "name": "9wdTw1hv", "unlimited": true, "use_buffer_percent": true}}, "regions": ["OCGxgjWB", "T6N1pulL", "7SdJkl8f"], "session_timeout": 78, "unlimited": false, "use_buffer_percent": false}, "sOfBxl9G": {"buffer_count": 37, "buffer_percent": 23, "configuration": "m2UlYAo8", "enable_region_overrides": false, "extendable_session": false, "game_version": "oGkuGnkR", "max_count": 2, "min_count": 50, "name": "ZGkGiWsi", "region_overrides": {"YpzTvi6R": {"buffer_count": 21, "buffer_percent": 42, "max_count": 93, "min_count": 54, "name": "1UdUdQEF", "unlimited": true, "use_buffer_percent": false}, "pBc4IE2a": {"buffer_count": 0, "buffer_percent": 22, "max_count": 0, "min_count": 35, "name": "OkAxLo5n", "unlimited": true, "use_buffer_percent": false}, "vyIkccrA": {"buffer_count": 96, "buffer_percent": 71, "max_count": 39, "min_count": 49, "name": "V5Zn2Qy1", "unlimited": false, "use_buffer_percent": true}}, "regions": ["fTlUH3Cv", "YYqsp43y", "BR609WNU"], "session_timeout": 96, "unlimited": false, "use_buffer_percent": false}}, "region_overrides": {"Okgxd4Ke": {"buffer_count": 77, "buffer_percent": 95, "max_count": 26, "min_count": 67, "name": "CE4EAEiz", "unlimited": true, "use_buffer_percent": true}, "9HjO1hIA": {"buffer_count": 39, "buffer_percent": 48, "max_count": 20, "min_count": 89, "name": "no7ucVJK", "unlimited": false, "use_buffer_percent": false}, "rI5IDzJy": {"buffer_count": 98, "buffer_percent": 26, "max_count": 9, "min_count": 4, "name": "Unbj261z", "unlimited": false, "use_buffer_percent": true}}, "regions": ["Tui5FvMg", "I6bRsbNy", "SvQEkm0D"], "session_timeout": 85, "unlimited": true, "use_buffer_percent": false}' \
    > test.out 2>&1
eval_tap $? 16 'CreateDeployment' test.out

#- 17 DeleteDeployment
./ng net.accelbyte.sdk.cli.Main dsmc deleteDeployment \
    --deployment 'XRoev4YF' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 17 'DeleteDeployment' test.out

#- 18 UpdateDeployment
./ng net.accelbyte.sdk.cli.Main dsmc updateDeployment \
    --deployment 'nbfRprQF' \
    --namespace "$AB_NAMESPACE" \
    --body '{"allow_version_override": true, "buffer_count": 0, "buffer_percent": 35, "configuration": "YSLNOEWi", "enable_region_overrides": true, "extendable_session": false, "game_version": "YOctxEkv", "max_count": 21, "min_count": 97, "regions": ["pTImzDmV", "iOpHQJQ9", "1yCOutRk"], "session_timeout": 39, "unlimited": false, "use_buffer_percent": false}' \
    > test.out 2>&1
eval_tap $? 18 'UpdateDeployment' test.out

#- 19 CreateRootRegionOverride
./ng net.accelbyte.sdk.cli.Main dsmc createRootRegionOverride \
    --deployment 'mYD05W1V' \
    --namespace "$AB_NAMESPACE" \
    --region 'ssOLB9mD' \
    --body '{"buffer_count": 40, "buffer_percent": 72, "max_count": 67, "min_count": 17, "unlimited": false, "use_buffer_percent": true}' \
    > test.out 2>&1
eval_tap $? 19 'CreateRootRegionOverride' test.out

#- 20 DeleteRootRegionOverride
./ng net.accelbyte.sdk.cli.Main dsmc deleteRootRegionOverride \
    --deployment 'pVegdj34' \
    --namespace "$AB_NAMESPACE" \
    --region '7SkZG6Wl' \
    > test.out 2>&1
eval_tap $? 20 'DeleteRootRegionOverride' test.out

#- 21 UpdateRootRegionOverride
./ng net.accelbyte.sdk.cli.Main dsmc updateRootRegionOverride \
    --deployment 'oH5MNiwn' \
    --namespace "$AB_NAMESPACE" \
    --region 'X2KxZ7kT' \
    --body '{"buffer_count": 37, "buffer_percent": 12, "max_count": 3, "min_count": 82, "unlimited": true, "use_buffer_percent": true}' \
    > test.out 2>&1
eval_tap $? 21 'UpdateRootRegionOverride' test.out

#- 22 CreateDeploymentOverride
./ng net.accelbyte.sdk.cli.Main dsmc createDeploymentOverride \
    --deployment 'LA6wIo6I' \
    --namespace "$AB_NAMESPACE" \
    --version 'BR6rCU0E' \
    --body '{"buffer_count": 9, "buffer_percent": 24, "configuration": "kfNZiUP4", "enable_region_overrides": false, "extendable_session": false, "game_version": "FueaTqs6", "max_count": 32, "min_count": 35, "region_overrides": {"cqcgYCGg": {"buffer_count": 53, "buffer_percent": 39, "max_count": 43, "min_count": 51, "name": "Lo4CIFLv", "unlimited": false, "use_buffer_percent": false}, "gHM3WDOz": {"buffer_count": 64, "buffer_percent": 3, "max_count": 27, "min_count": 48, "name": "5UlmoleC", "unlimited": false, "use_buffer_percent": true}, "HaCyzOAZ": {"buffer_count": 76, "buffer_percent": 76, "max_count": 59, "min_count": 95, "name": "0JteE5Pn", "unlimited": true, "use_buffer_percent": true}}, "regions": ["7ZC7Xnn5", "xObJlfma", "tS0vmfsW"], "session_timeout": 73, "unlimited": true, "use_buffer_percent": false}' \
    > test.out 2>&1
eval_tap $? 22 'CreateDeploymentOverride' test.out

#- 23 DeleteDeploymentOverride
./ng net.accelbyte.sdk.cli.Main dsmc deleteDeploymentOverride \
    --deployment 'Pnt76zpb' \
    --namespace "$AB_NAMESPACE" \
    --version 'qsYuQxXx' \
    > test.out 2>&1
eval_tap $? 23 'DeleteDeploymentOverride' test.out

#- 24 UpdateDeploymentOverride
./ng net.accelbyte.sdk.cli.Main dsmc updateDeploymentOverride \
    --deployment '2ePw6huK' \
    --namespace "$AB_NAMESPACE" \
    --version 'qaFmx7Yb' \
    --body '{"buffer_count": 100, "buffer_percent": 37, "configuration": "LKyAm2DN", "enable_region_overrides": false, "game_version": "qiVzHNLI", "max_count": 29, "min_count": 39, "regions": ["cYfKcnL6", "kXEpYCzJ", "P1nSfplD"], "session_timeout": 66, "unlimited": false, "use_buffer_percent": false}' \
    > test.out 2>&1
eval_tap $? 24 'UpdateDeploymentOverride' test.out

#- 25 CreateOverrideRegionOverride
./ng net.accelbyte.sdk.cli.Main dsmc createOverrideRegionOverride \
    --deployment 'bUFiH9oa' \
    --namespace "$AB_NAMESPACE" \
    --region 'genKKld1' \
    --version 'hZoVtGZT' \
    --body '{"buffer_count": 69, "buffer_percent": 43, "max_count": 12, "min_count": 27, "unlimited": true, "use_buffer_percent": false}' \
    > test.out 2>&1
eval_tap $? 25 'CreateOverrideRegionOverride' test.out

#- 26 DeleteOverrideRegionOverride
./ng net.accelbyte.sdk.cli.Main dsmc deleteOverrideRegionOverride \
    --deployment '0WL1v8se' \
    --namespace "$AB_NAMESPACE" \
    --region 'Zfjs9XaB' \
    --version 'L6esErfQ' \
    > test.out 2>&1
eval_tap $? 26 'DeleteOverrideRegionOverride' test.out

#- 27 UpdateOverrideRegionOverride
./ng net.accelbyte.sdk.cli.Main dsmc updateOverrideRegionOverride \
    --deployment 'hCkNC9do' \
    --namespace "$AB_NAMESPACE" \
    --region 'MefxhT4Z' \
    --version 'RwxXcopA' \
    --body '{"buffer_count": 89, "buffer_percent": 25, "max_count": 90, "min_count": 22, "unlimited": false, "use_buffer_percent": true}' \
    > test.out 2>&1
eval_tap $? 27 'UpdateOverrideRegionOverride' test.out

#- 28 GetAllPodConfig
./ng net.accelbyte.sdk.cli.Main dsmc getAllPodConfig \
    --namespace "$AB_NAMESPACE" \
    --count '47' \
    --offset '97' \
    > test.out 2>&1
eval_tap $? 28 'GetAllPodConfig' test.out

#- 29 GetPodConfig
./ng net.accelbyte.sdk.cli.Main dsmc getPodConfig \
    --name 'zhQ7jLq8' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 29 'GetPodConfig' test.out

#- 30 CreatePodConfig
./ng net.accelbyte.sdk.cli.Main dsmc createPodConfig \
    --name 'C9CTXXvp' \
    --namespace "$AB_NAMESPACE" \
    --body '{"cpu_limit": 48, "mem_limit": 82, "params": "d08TuMG1"}' \
    > test.out 2>&1
eval_tap $? 30 'CreatePodConfig' test.out

#- 31 DeletePodConfig
./ng net.accelbyte.sdk.cli.Main dsmc deletePodConfig \
    --name 'kRFFaDlM' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 31 'DeletePodConfig' test.out

#- 32 UpdatePodConfig
./ng net.accelbyte.sdk.cli.Main dsmc updatePodConfig \
    --name 'kzMA9Owb' \
    --namespace "$AB_NAMESPACE" \
    --body '{"cpu_limit": 49, "mem_limit": 16, "name": "yAtXmKSs", "params": "cncCaygl"}' \
    > test.out 2>&1
eval_tap $? 32 'UpdatePodConfig' test.out

#- 33 AddPort
./ng net.accelbyte.sdk.cli.Main dsmc addPort \
    --name 'ioWOpWVZ' \
    --namespace "$AB_NAMESPACE" \
    --body '{"port": 68}' \
    > test.out 2>&1
eval_tap $? 33 'AddPort' test.out

#- 34 DeletePort
./ng net.accelbyte.sdk.cli.Main dsmc deletePort \
    --name 'j8DSuWKO' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 34 'DeletePort' test.out

#- 35 UpdatePort
./ng net.accelbyte.sdk.cli.Main dsmc updatePort \
    --name 'msradacz' \
    --namespace "$AB_NAMESPACE" \
    --body '{"name": "mVucb91v", "port": 52}' \
    > test.out 2>&1
eval_tap $? 35 'UpdatePort' test.out

#- 36 ListImages
./ng net.accelbyte.sdk.cli.Main dsmc listImages \
    --namespace "$AB_NAMESPACE" \
    --q 'FXvJXz7X' \
    --sortBy 'createdAt' \
    --sortDirection 'desc' \
    --count '65' \
    --offset '38' \
    > test.out 2>&1
eval_tap $? 36 'ListImages' test.out

#- 37 DeleteImage
./ng net.accelbyte.sdk.cli.Main dsmc deleteImage \
    --namespace "$AB_NAMESPACE" \
    --imageURI 'sHWREppG' \
    --version 'uh5xC6i6' \
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
    --imageURI '51eoT1M9' \
    --version '952Rn0rf' \
    --versionPatch 'zlNIK828' \
    > test.out 2>&1
eval_tap $? 40 'DeleteImagePatch' test.out

#- 41 GetImageDetail
./ng net.accelbyte.sdk.cli.Main dsmc getImageDetail \
    --namespace "$AB_NAMESPACE" \
    --version 'xpPIcEUm' \
    > test.out 2>&1
eval_tap $? 41 'GetImageDetail' test.out

#- 42 GetImagePatches
./ng net.accelbyte.sdk.cli.Main dsmc getImagePatches \
    --namespace "$AB_NAMESPACE" \
    --version 'GCuprDQi' \
    > test.out 2>&1
eval_tap $? 42 'GetImagePatches' test.out

#- 43 GetImagePatchDetail
./ng net.accelbyte.sdk.cli.Main dsmc getImagePatchDetail \
    --namespace "$AB_NAMESPACE" \
    --version 'nyVwRZCt' \
    --versionPatch 'eOmNRdlD' \
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
    --region 'oDZuG4RI' \
    --count '3' \
    --offset '71' \
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
    --region 'Ey6Fa1YH' \
    > test.out 2>&1
eval_tap $? 47 'CountServerDetailed' test.out

#- 48 ListLocalServer
./ng net.accelbyte.sdk.cli.Main dsmc listLocalServer \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 48 'ListLocalServer' test.out

#- 49 DeleteLocalServer
./ng net.accelbyte.sdk.cli.Main dsmc deleteLocalServer \
    --name 'Ma2EpQFe' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 49 'DeleteLocalServer' test.out

#- 50 GetServer
./ng net.accelbyte.sdk.cli.Main dsmc getServer \
    --namespace "$AB_NAMESPACE" \
    --podName 'w3aX6Izf' \
    > test.out 2>&1
eval_tap $? 50 'GetServer' test.out

#- 51 DeleteServer
./ng net.accelbyte.sdk.cli.Main dsmc deleteServer \
    --namespace "$AB_NAMESPACE" \
    --podName 'Oj5MJdZY' \
    > test.out 2>&1
eval_tap $? 51 'DeleteServer' test.out

#- 52 ListSession
./ng net.accelbyte.sdk.cli.Main dsmc listSession \
    --namespace "$AB_NAMESPACE" \
    --region 'b8rp9FsS' \
    --withServer  \
    --count '65' \
    --offset '1' \
    > test.out 2>&1
eval_tap $? 52 'ListSession' test.out

#- 53 CountSession
./ng net.accelbyte.sdk.cli.Main dsmc countSession \
    --namespace "$AB_NAMESPACE" \
    --region 'fkbctsyD' \
    > test.out 2>&1
eval_tap $? 53 'CountSession' test.out

#- 54 DeleteSession
./ng net.accelbyte.sdk.cli.Main dsmc deleteSession \
    --namespace "$AB_NAMESPACE" \
    --sessionID 'pkIqVCzT' \
    > test.out 2>&1
eval_tap $? 54 'DeleteSession' test.out

#- 55 CreateRepository
./ng net.accelbyte.sdk.cli.Main dsmc createRepository \
    --body '{"namespace": "YL5EYnpx", "repository": "6Q82McSj"}' \
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
    --name 'Cyg6D5p5' \
    --count '91' \
    --offset '49' \
    > test.out 2>&1
eval_tap $? 58 'GetAllDeploymentClient' test.out

#- 59 CreateDeploymentClient
./ng net.accelbyte.sdk.cli.Main dsmc createDeploymentClient \
    --deployment 'LVtJ0RsK' \
    --namespace "$AB_NAMESPACE" \
    --body '{"allow_version_override": false, "buffer_count": 65, "buffer_percent": 23, "configuration": "1YZaGeEO", "enable_region_overrides": true, "extendable_session": true, "game_version": "0tdKJEDN", "max_count": 33, "min_count": 54, "overrides": {"b1nj9v1N": {"buffer_count": 95, "buffer_percent": 46, "configuration": "WjLtFfKa", "enable_region_overrides": false, "extendable_session": true, "game_version": "zWDdBmZe", "max_count": 14, "min_count": 41, "name": "kmkwTihN", "region_overrides": {"dDV1HOdZ": {"buffer_count": 80, "buffer_percent": 16, "max_count": 23, "min_count": 73, "name": "LnsndgXn", "unlimited": false, "use_buffer_percent": true}, "saFeUK2d": {"buffer_count": 85, "buffer_percent": 37, "max_count": 21, "min_count": 97, "name": "s4kx5FOf", "unlimited": true, "use_buffer_percent": true}, "oQG9GxZ0": {"buffer_count": 68, "buffer_percent": 8, "max_count": 85, "min_count": 59, "name": "7f0GdFsX", "unlimited": false, "use_buffer_percent": true}}, "regions": ["eU41SmdN", "BJ7PIvim", "rjEoq7lz"], "session_timeout": 14, "unlimited": false, "use_buffer_percent": true}, "aBf5JzuD": {"buffer_count": 24, "buffer_percent": 98, "configuration": "s725c1BU", "enable_region_overrides": false, "extendable_session": true, "game_version": "jtMUxyAB", "max_count": 97, "min_count": 15, "name": "8b4TaTvY", "region_overrides": {"MQutga1f": {"buffer_count": 54, "buffer_percent": 48, "max_count": 17, "min_count": 55, "name": "NjTYMIuy", "unlimited": false, "use_buffer_percent": false}, "lGPQQAEC": {"buffer_count": 25, "buffer_percent": 33, "max_count": 44, "min_count": 42, "name": "wG5RM8Zn", "unlimited": true, "use_buffer_percent": false}, "lEMUXuY2": {"buffer_count": 30, "buffer_percent": 17, "max_count": 75, "min_count": 77, "name": "gP3rfLbc", "unlimited": false, "use_buffer_percent": false}}, "regions": ["VS3xt6Aj", "DCbP0Bkc", "gKC1lg10"], "session_timeout": 19, "unlimited": true, "use_buffer_percent": false}, "KjZSdl1o": {"buffer_count": 17, "buffer_percent": 86, "configuration": "9lSkTVH9", "enable_region_overrides": true, "extendable_session": true, "game_version": "jA8VG33Z", "max_count": 12, "min_count": 69, "name": "wcbVXEvw", "region_overrides": {"ajUyazzo": {"buffer_count": 59, "buffer_percent": 10, "max_count": 92, "min_count": 80, "name": "tGpbQJBA", "unlimited": false, "use_buffer_percent": true}, "6qon1YRf": {"buffer_count": 65, "buffer_percent": 6, "max_count": 0, "min_count": 94, "name": "Hf2lEs9g", "unlimited": false, "use_buffer_percent": true}, "XqPOGbAB": {"buffer_count": 49, "buffer_percent": 73, "max_count": 39, "min_count": 48, "name": "AiefSq34", "unlimited": true, "use_buffer_percent": true}}, "regions": ["F0RexUlL", "shgzH6gl", "Drg1MQ4R"], "session_timeout": 39, "unlimited": false, "use_buffer_percent": false}}, "region_overrides": {"gQzmOAck": {"buffer_count": 24, "buffer_percent": 44, "max_count": 73, "min_count": 61, "name": "4SeBuOh0", "unlimited": false, "use_buffer_percent": true}, "N7CRTdNw": {"buffer_count": 39, "buffer_percent": 37, "max_count": 88, "min_count": 91, "name": "X7UjtFsu", "unlimited": false, "use_buffer_percent": false}, "h2KX4wAJ": {"buffer_count": 92, "buffer_percent": 37, "max_count": 60, "min_count": 69, "name": "oOvowD63", "unlimited": true, "use_buffer_percent": false}}, "regions": ["WcBFzoIC", "bjuNGGft", "uqfi1YDK"], "session_timeout": 61, "unlimited": true, "use_buffer_percent": true}' \
    > test.out 2>&1
eval_tap $? 59 'CreateDeploymentClient' test.out

#- 60 DeleteDeploymentClient
./ng net.accelbyte.sdk.cli.Main dsmc deleteDeploymentClient \
    --deployment 'zyWnxqh0' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 60 'DeleteDeploymentClient' test.out

#- 61 GetAllPodConfigClient
./ng net.accelbyte.sdk.cli.Main dsmc getAllPodConfigClient \
    --namespace "$AB_NAMESPACE" \
    --count '67' \
    --offset '21' \
    > test.out 2>&1
eval_tap $? 61 'GetAllPodConfigClient' test.out

#- 62 CreatePodConfigClient
./ng net.accelbyte.sdk.cli.Main dsmc createPodConfigClient \
    --name 'n2OOGJY6' \
    --namespace "$AB_NAMESPACE" \
    --body '{"cpu_limit": 46, "mem_limit": 21, "params": "B9oloagi"}' \
    > test.out 2>&1
eval_tap $? 62 'CreatePodConfigClient' test.out

#- 63 DeletePodConfigClient
./ng net.accelbyte.sdk.cli.Main dsmc deletePodConfigClient \
    --name 'GLyZTiO4' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 63 'DeletePodConfigClient' test.out

#- 64 ListImagesClient
./ng net.accelbyte.sdk.cli.Main dsmc listImagesClient \
    --namespace "$AB_NAMESPACE" \
    --count '4' \
    --offset '36' \
    --q '45G9UgDV' \
    --sortBy 'version' \
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
    --version 'sUfhip3m' \
    > test.out 2>&1
eval_tap $? 66 'ImageDetailClient' test.out

#- 67 ListServerClient
./ng net.accelbyte.sdk.cli.Main dsmc listServerClient \
    --namespace "$AB_NAMESPACE" \
    --region 'TkKxmSTp' \
    --count '58' \
    --offset '30' \
    > test.out 2>&1
eval_tap $? 67 'ListServerClient' test.out

#- 68 ServerHeartbeat
./ng net.accelbyte.sdk.cli.Main dsmc serverHeartbeat \
    --namespace "$AB_NAMESPACE" \
    --body '{"podName": "6ixTIWKX"}' \
    > test.out 2>&1
eval_tap $? 68 'ServerHeartbeat' test.out

#- 69 DeregisterLocalServer
./ng net.accelbyte.sdk.cli.Main dsmc deregisterLocalServer \
    --namespace "$AB_NAMESPACE" \
    --body '{"name": "TdOdK5vT"}' \
    > test.out 2>&1
eval_tap $? 69 'DeregisterLocalServer' test.out

#- 70 RegisterLocalServer
./ng net.accelbyte.sdk.cli.Main dsmc registerLocalServer \
    --namespace "$AB_NAMESPACE" \
    --body '{"custom_attribute": "TqtsWn1u", "ip": "EdqXeZyS", "name": "NevpdFNn", "port": 0}' \
    > test.out 2>&1
eval_tap $? 70 'RegisterLocalServer' test.out

#- 71 RegisterServer
./ng net.accelbyte.sdk.cli.Main dsmc registerServer \
    --namespace "$AB_NAMESPACE" \
    --body '{"custom_attribute": "ij9KCgXo", "pod_name": "ZD8szUD2"}' \
    > test.out 2>&1
eval_tap $? 71 'RegisterServer' test.out

#- 72 ShutdownServer
./ng net.accelbyte.sdk.cli.Main dsmc shutdownServer \
    --namespace "$AB_NAMESPACE" \
    --body '{"kill_me": true, "pod_name": "EibSpCH9"}' \
    > test.out 2>&1
eval_tap $? 72 'ShutdownServer' test.out

#- 73 GetServerSessionTimeout
./ng net.accelbyte.sdk.cli.Main dsmc getServerSessionTimeout \
    --namespace "$AB_NAMESPACE" \
    --podName 'b5LelIgA' \
    > test.out 2>&1
eval_tap $? 73 'GetServerSessionTimeout' test.out

#- 74 GetServerSession
./ng net.accelbyte.sdk.cli.Main dsmc getServerSession \
    --namespace "$AB_NAMESPACE" \
    --podName 'MwRPO30b' \
    > test.out 2>&1
eval_tap $? 74 'GetServerSession' test.out

#- 75 CreateSession
./ng net.accelbyte.sdk.cli.Main dsmc createSession \
    --namespace "$AB_NAMESPACE" \
    --body '{"client_version": "1FVGNRkl", "configuration": "Wcr4tXol", "deployment": "f5ilHzYo", "game_mode": "0jy9w4IG", "matching_allies": [{"matching_parties": [{"party_attributes": {"SFnXXVZh": {}, "HbYEOnUE": {}, "Mf5GrOY2": {}}, "party_id": "fBBo0AfK", "party_members": [{"user_id": "eM09rowf"}, {"user_id": "ZV3h7ZcQ"}, {"user_id": "sOkJKP9S"}]}, {"party_attributes": {"CAyEpSZg": {}, "p27OVol3": {}, "iiDOIK4l": {}}, "party_id": "FdmvJu1L", "party_members": [{"user_id": "HyQnXfnX"}, {"user_id": "rB4kkeee"}, {"user_id": "ixB4fcfC"}]}, {"party_attributes": {"iOIylZRd": {}, "8vKlJYWm": {}, "V0BH4g1m": {}}, "party_id": "aOTnMYbg", "party_members": [{"user_id": "54akla48"}, {"user_id": "qr5vPkSs"}, {"user_id": "AOQqafWa"}]}]}, {"matching_parties": [{"party_attributes": {"mi1OZ89R": {}, "HycU2svV": {}, "9zjeaCoB": {}}, "party_id": "Og8pVd1o", "party_members": [{"user_id": "2xIaSLra"}, {"user_id": "appDpqDV"}, {"user_id": "gBU2EoaH"}]}, {"party_attributes": {"I4CU7VdE": {}, "1eyRBTvO": {}, "nHygLokb": {}}, "party_id": "LHFz7tMg", "party_members": [{"user_id": "BKzaasaH"}, {"user_id": "8r646AUR"}, {"user_id": "StGE9tgv"}]}, {"party_attributes": {"abqEGTCe": {}, "Jq5l3kKA": {}, "FGu25spP": {}}, "party_id": "rgtiu2oc", "party_members": [{"user_id": "k3SkALun"}, {"user_id": "jbzvjO3N"}, {"user_id": "TIWgDBNf"}]}]}, {"matching_parties": [{"party_attributes": {"JVp8vAsD": {}, "QyH72sF3": {}, "EGgK2QWX": {}}, "party_id": "ZkOYxS5x", "party_members": [{"user_id": "7P1RTUqS"}, {"user_id": "0CLZ65hl"}, {"user_id": "svyy7LDu"}]}, {"party_attributes": {"vQ1Ru8o2": {}, "RNjmWxKS": {}, "gK4IFwON": {}}, "party_id": "358Kj6Lm", "party_members": [{"user_id": "MZ6WkrxO"}, {"user_id": "jIDqkrHZ"}, {"user_id": "j6lGwKIl"}]}, {"party_attributes": {"FGolQtaU": {}, "LzNaB4Df": {}, "e8F9Spj5": {}}, "party_id": "oQ1pOax3", "party_members": [{"user_id": "CQmTopQo"}, {"user_id": "DL1RHW2d"}, {"user_id": "Ms5Oun2a"}]}]}], "namespace": "kDsx1Tgu", "notification_payload": {}, "pod_name": "HMnJq3t3", "region": "9KakCDNK", "session_id": "T1aQ179L"}' \
    > test.out 2>&1
eval_tap $? 75 'CreateSession' test.out

#- 76 ClaimServer
./ng net.accelbyte.sdk.cli.Main dsmc claimServer \
    --namespace "$AB_NAMESPACE" \
    --body '{"session_id": "Cf2jVnO0"}' \
    > test.out 2>&1
eval_tap $? 76 'ClaimServer' test.out

#- 77 GetSession
./ng net.accelbyte.sdk.cli.Main dsmc getSession \
    --namespace "$AB_NAMESPACE" \
    --sessionID 'PEbQRTDy' \
    > test.out 2>&1
eval_tap $? 77 'GetSession' test.out

#- 78 CancelSession
./ng net.accelbyte.sdk.cli.Main dsmc cancelSession \
    --namespace "$AB_NAMESPACE" \
    --sessionID 'kPS8y4Q2' \
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
    --region 'xQaRDbhI' \
    > test.out 2>&1
eval_tap $? 81 'ListProvidersByRegion' test.out

#- 82 PublicGetMessages
./ng net.accelbyte.sdk.cli.Main dsmc publicGetMessages \
    > test.out 2>&1
eval_tap $? 82 'PublicGetMessages' test.out


rm -f "tmp.dat"

exit $EXIT_CODE