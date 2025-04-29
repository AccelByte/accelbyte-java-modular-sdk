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
    --body '{"artifactPath": "BY6rhsse", "coreDumpEnabled": true, "image": "FAgL4P9W", "imageReplicationsMap": {"1qhfRQ4F": {"failure_code": "4uSuZGSw", "region": "jfLNRQLM", "status": "cpN9PyN5", "uri": "NKVBDP90"}, "iEUGO42E": {"failure_code": "d4Em5M3U", "region": "hFsWef15", "status": "F1P3SRWt", "uri": "LadUNhd3"}, "bInrHx8D": {"failure_code": "g0AyV6P1", "region": "HbYJpmte", "status": "dMK0RjSK", "uri": "Kz2637y5"}}, "namespace": "KSmZCTYp", "patchVersion": "6hOgs2tX", "persistent": false, "ulimitFileSize": 20, "version": "IgRz9j6N"}' \
    > test.out 2>&1
eval_tap $? 4 'UpdateImage' test.out

#- 5 CreateImage
./ng net.accelbyte.sdk.cli.Main dsmc createImage \
    --body '{"artifactPath": "GxCDw8lh", "coreDumpEnabled": true, "dockerPath": "gwGkNS0f", "image": "wnROhGWL", "imageSize": 28, "namespace": "2ibML4R7", "persistent": true, "ulimitFileSize": 93, "version": "S0b8lZco"}' \
    > test.out 2>&1
eval_tap $? 5 'CreateImage' test.out

#- 6 CreateImagePatch
./ng net.accelbyte.sdk.cli.Main dsmc createImagePatch \
    --body '{"artifactPath": "uwWLlXJD", "coreDumpEnabled": true, "dockerPath": "fvTneUve", "image": "a1DemHUw", "imageSize": 51, "namespace": "sFty01UQ", "patchVersion": "7qQ9Y6QR", "persistent": true, "ulimitFileSize": 97, "uploaderFlag": "Kc3Pj4qV", "version": "fnC33Eu7"}' \
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
    --body '{"auto_deletion": true, "ghost_worker": true, "manual_buffer_override": true, "zombie_worker": false}' \
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
    --body '{"claim_timeout": 46, "creation_timeout": 92, "default_version": "qFyc2MWp", "port": 53, "ports": {"ttgu6mTT": 61, "kEopCKsF": 81, "uG66itCO": 51}, "protocol": "mnxcXL8N", "providers": ["NyvXOtaW", "cAgaUrMD", "FP9fszjB"], "session_timeout": 53, "unreachable_timeout": 63}' \
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
    --body '{"claim_timeout": 95, "creation_timeout": 65, "default_version": "YBtQIM0I", "port": 81, "protocol": "9jI6VjLX", "providers": ["CdRoC08t", "ZxN58FZw", "JWbHOiuc"], "session_timeout": 100, "unreachable_timeout": 17}' \
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
    --name '9fpnzlA6' \
    --count '11' \
    --offset '39' \
    > test.out 2>&1
eval_tap $? 16 'GetAllDeployment' test.out

#- 17 GetDeployment
./ng net.accelbyte.sdk.cli.Main dsmc getDeployment \
    --deployment 'QtS4wYxA' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 17 'GetDeployment' test.out

#- 18 CreateDeployment
./ng net.accelbyte.sdk.cli.Main dsmc createDeployment \
    --deployment 'DbgvFgEC' \
    --namespace "$AB_NAMESPACE" \
    --body '{"allow_version_override": false, "buffer_count": 53, "buffer_percent": 97, "configuration": "PJmksBYL", "enable_region_overrides": true, "extendable_session": false, "game_version": "y6kbg7ij", "max_count": 40, "min_count": 93, "overrides": {"lJPqRSlG": {"buffer_count": 55, "buffer_percent": 73, "configuration": "rhgFBZia", "enable_region_overrides": false, "extendable_session": true, "game_version": "emyuBPNR", "max_count": 65, "min_count": 25, "name": "LM2wI2qi", "region_overrides": {"2sNI6BOY": {"buffer_count": 40, "buffer_percent": 56, "max_count": 77, "min_count": 69, "name": "MYZ5LDtk", "unlimited": false, "use_buffer_percent": false}, "NZQP1xm1": {"buffer_count": 0, "buffer_percent": 10, "max_count": 3, "min_count": 72, "name": "YqkOyDvg", "unlimited": false, "use_buffer_percent": true}, "B4kJQAmr": {"buffer_count": 14, "buffer_percent": 95, "max_count": 98, "min_count": 100, "name": "nXczDa94", "unlimited": true, "use_buffer_percent": false}}, "regions": ["0FhL7ulT", "RDV1Kupd", "dKhxl2hl"], "session_timeout": 13, "unlimited": true, "use_buffer_percent": true}, "pLzBznGg": {"buffer_count": 58, "buffer_percent": 78, "configuration": "OMJC14uw", "enable_region_overrides": true, "extendable_session": true, "game_version": "2Bz5q2IL", "max_count": 93, "min_count": 28, "name": "gEE6R9k6", "region_overrides": {"t3HZrwQq": {"buffer_count": 92, "buffer_percent": 75, "max_count": 63, "min_count": 29, "name": "mMhPWGeV", "unlimited": false, "use_buffer_percent": true}, "9XtDlBBF": {"buffer_count": 78, "buffer_percent": 4, "max_count": 55, "min_count": 61, "name": "ruMfhqBq", "unlimited": false, "use_buffer_percent": true}, "rZIromOx": {"buffer_count": 33, "buffer_percent": 81, "max_count": 2, "min_count": 10, "name": "brROKDk3", "unlimited": true, "use_buffer_percent": false}}, "regions": ["3E6wqIVo", "qGI5jn3x", "fmX4BVKy"], "session_timeout": 79, "unlimited": false, "use_buffer_percent": true}, "VDwuHse5": {"buffer_count": 86, "buffer_percent": 68, "configuration": "tov4wbmG", "enable_region_overrides": true, "extendable_session": false, "game_version": "W3TkaRFd", "max_count": 78, "min_count": 14, "name": "NZ8ccftG", "region_overrides": {"dFNx7XDR": {"buffer_count": 23, "buffer_percent": 6, "max_count": 48, "min_count": 42, "name": "44VNkyct", "unlimited": false, "use_buffer_percent": true}, "pNcsswPG": {"buffer_count": 78, "buffer_percent": 3, "max_count": 70, "min_count": 100, "name": "5WiMDvzH", "unlimited": false, "use_buffer_percent": true}, "FLq8aLza": {"buffer_count": 4, "buffer_percent": 72, "max_count": 45, "min_count": 36, "name": "nM2bIakw", "unlimited": true, "use_buffer_percent": false}}, "regions": ["U4khbOWS", "HH9T2Rg4", "iEIcLKXT"], "session_timeout": 36, "unlimited": false, "use_buffer_percent": false}}, "region_overrides": {"ndA7V9pR": {"buffer_count": 24, "buffer_percent": 32, "max_count": 58, "min_count": 51, "name": "sTMSKczA", "unlimited": false, "use_buffer_percent": false}, "3owFYoI7": {"buffer_count": 16, "buffer_percent": 64, "max_count": 59, "min_count": 45, "name": "wvfdn7Ek", "unlimited": false, "use_buffer_percent": false}, "Bllpco9G": {"buffer_count": 63, "buffer_percent": 23, "max_count": 2, "min_count": 60, "name": "aAgDAcuX", "unlimited": true, "use_buffer_percent": true}}, "regions": ["XUJUDnwI", "xLqEV2uw", "EnAW9yMY"], "session_timeout": 7, "unlimited": false, "use_buffer_percent": false}' \
    > test.out 2>&1
eval_tap $? 18 'CreateDeployment' test.out

#- 19 DeleteDeployment
./ng net.accelbyte.sdk.cli.Main dsmc deleteDeployment \
    --deployment 'nKrjgzf4' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 19 'DeleteDeployment' test.out

#- 20 UpdateDeployment
./ng net.accelbyte.sdk.cli.Main dsmc updateDeployment \
    --deployment 'vyAFCYP3' \
    --namespace "$AB_NAMESPACE" \
    --body '{"allow_version_override": true, "buffer_count": 93, "buffer_percent": 28, "configuration": "lUKW8IKK", "enable_region_overrides": false, "extendable_session": false, "game_version": "WTAfnUhX", "max_count": 12, "min_count": 43, "regions": ["2xVuU1Z2", "2kWysWBO", "Ycl4Rq1s"], "session_timeout": 77, "unlimited": true, "use_buffer_percent": false}' \
    > test.out 2>&1
eval_tap $? 20 'UpdateDeployment' test.out

#- 21 CreateRootRegionOverride
./ng net.accelbyte.sdk.cli.Main dsmc createRootRegionOverride \
    --deployment '1DGKhqDZ' \
    --namespace "$AB_NAMESPACE" \
    --region 'MUKBFz1c' \
    --body '{"buffer_count": 4, "buffer_percent": 22, "max_count": 88, "min_count": 10, "unlimited": false, "use_buffer_percent": true}' \
    > test.out 2>&1
eval_tap $? 21 'CreateRootRegionOverride' test.out

#- 22 DeleteRootRegionOverride
./ng net.accelbyte.sdk.cli.Main dsmc deleteRootRegionOverride \
    --deployment 'Eh020Geh' \
    --namespace "$AB_NAMESPACE" \
    --region 'XUQSKIoJ' \
    > test.out 2>&1
eval_tap $? 22 'DeleteRootRegionOverride' test.out

#- 23 UpdateRootRegionOverride
./ng net.accelbyte.sdk.cli.Main dsmc updateRootRegionOverride \
    --deployment '3vfzTO6D' \
    --namespace "$AB_NAMESPACE" \
    --region 'ZrgDUVr4' \
    --body '{"buffer_count": 40, "buffer_percent": 27, "max_count": 43, "min_count": 57, "unlimited": false, "use_buffer_percent": false}' \
    > test.out 2>&1
eval_tap $? 23 'UpdateRootRegionOverride' test.out

#- 24 CreateDeploymentOverride
./ng net.accelbyte.sdk.cli.Main dsmc createDeploymentOverride \
    --deployment 'KHxthkiw' \
    --namespace "$AB_NAMESPACE" \
    --version 'p1K8ZOsh' \
    --body '{"buffer_count": 13, "buffer_percent": 10, "configuration": "p3c5c01M", "enable_region_overrides": true, "extendable_session": false, "game_version": "jcxd9GUO", "max_count": 13, "min_count": 63, "region_overrides": {"fV2WNGr1": {"buffer_count": 81, "buffer_percent": 26, "max_count": 40, "min_count": 25, "name": "d47z56Le", "unlimited": false, "use_buffer_percent": false}, "Ac5Hkm80": {"buffer_count": 63, "buffer_percent": 58, "max_count": 23, "min_count": 31, "name": "YRbvsYzc", "unlimited": true, "use_buffer_percent": false}, "3ZLJwR4t": {"buffer_count": 72, "buffer_percent": 11, "max_count": 92, "min_count": 40, "name": "a009ekIR", "unlimited": true, "use_buffer_percent": true}}, "regions": ["e11Xlh4I", "NFs0Vz5o", "a7fUwaou"], "session_timeout": 91, "unlimited": false, "use_buffer_percent": false}' \
    > test.out 2>&1
eval_tap $? 24 'CreateDeploymentOverride' test.out

#- 25 DeleteDeploymentOverride
./ng net.accelbyte.sdk.cli.Main dsmc deleteDeploymentOverride \
    --deployment 'Jdqa3WaC' \
    --namespace "$AB_NAMESPACE" \
    --version 'mHd9js9f' \
    > test.out 2>&1
eval_tap $? 25 'DeleteDeploymentOverride' test.out

#- 26 UpdateDeploymentOverride
./ng net.accelbyte.sdk.cli.Main dsmc updateDeploymentOverride \
    --deployment 'XxjS1vZc' \
    --namespace "$AB_NAMESPACE" \
    --version 'FJYeaER8' \
    --body '{"buffer_count": 39, "buffer_percent": 96, "configuration": "3UV38byV", "enable_region_overrides": false, "game_version": "rYsshgxT", "max_count": 88, "min_count": 54, "regions": ["uHctb8II", "OUXNvDSw", "zemovIYo"], "session_timeout": 58, "unlimited": false, "use_buffer_percent": false}' \
    > test.out 2>&1
eval_tap $? 26 'UpdateDeploymentOverride' test.out

#- 27 CreateOverrideRegionOverride
./ng net.accelbyte.sdk.cli.Main dsmc createOverrideRegionOverride \
    --deployment '1LXbAhCi' \
    --namespace "$AB_NAMESPACE" \
    --region 'O8XoBZGO' \
    --version 'DE43fhcj' \
    --body '{"buffer_count": 88, "buffer_percent": 10, "max_count": 91, "min_count": 92, "unlimited": false, "use_buffer_percent": true}' \
    > test.out 2>&1
eval_tap $? 27 'CreateOverrideRegionOverride' test.out

#- 28 DeleteOverrideRegionOverride
./ng net.accelbyte.sdk.cli.Main dsmc deleteOverrideRegionOverride \
    --deployment 'uvKb2d6I' \
    --namespace "$AB_NAMESPACE" \
    --region 'vsBLLsxm' \
    --version 'RiZgOVgH' \
    > test.out 2>&1
eval_tap $? 28 'DeleteOverrideRegionOverride' test.out

#- 29 UpdateOverrideRegionOverride
./ng net.accelbyte.sdk.cli.Main dsmc updateOverrideRegionOverride \
    --deployment 'l44LujcA' \
    --namespace "$AB_NAMESPACE" \
    --region '571JXyWL' \
    --version 'r3Ypv8Ax' \
    --body '{"buffer_count": 84, "buffer_percent": 94, "max_count": 75, "min_count": 62, "unlimited": false, "use_buffer_percent": true}' \
    > test.out 2>&1
eval_tap $? 29 'UpdateOverrideRegionOverride' test.out

#- 30 DeleteCreatingServerCountQueue
./ng net.accelbyte.sdk.cli.Main dsmc deleteCreatingServerCountQueue \
    --deployment 'G9YFVvz0' \
    --namespace "$AB_NAMESPACE" \
    --version 'pJtFn1cr' \
    > test.out 2>&1
eval_tap $? 30 'DeleteCreatingServerCountQueue' test.out

#- 31 GetAllPodConfig
./ng net.accelbyte.sdk.cli.Main dsmc getAllPodConfig \
    --namespace "$AB_NAMESPACE" \
    --count '68' \
    --offset '22' \
    > test.out 2>&1
eval_tap $? 31 'GetAllPodConfig' test.out

#- 32 GetPodConfig
./ng net.accelbyte.sdk.cli.Main dsmc getPodConfig \
    --name 'ZsOhlQEJ' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 32 'GetPodConfig' test.out

#- 33 CreatePodConfig
./ng net.accelbyte.sdk.cli.Main dsmc createPodConfig \
    --name 'PQrW31uh' \
    --namespace "$AB_NAMESPACE" \
    --body '{"cpu_limit": 59, "mem_limit": 70, "params": "TNC6Bi5u"}' \
    > test.out 2>&1
eval_tap $? 33 'CreatePodConfig' test.out

#- 34 DeletePodConfig
./ng net.accelbyte.sdk.cli.Main dsmc deletePodConfig \
    --name 'kMMwNEx1' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 34 'DeletePodConfig' test.out

#- 35 UpdatePodConfig
./ng net.accelbyte.sdk.cli.Main dsmc updatePodConfig \
    --name '7ZLfiVGW' \
    --namespace "$AB_NAMESPACE" \
    --body '{"cpu_limit": 76, "mem_limit": 90, "name": "JC5EGHyq", "params": "QoRFbBvj"}' \
    > test.out 2>&1
eval_tap $? 35 'UpdatePodConfig' test.out

#- 36 AddPort
./ng net.accelbyte.sdk.cli.Main dsmc addPort \
    --name 'TlNm8u40' \
    --namespace "$AB_NAMESPACE" \
    --body '{"port": 37}' \
    > test.out 2>&1
eval_tap $? 36 'AddPort' test.out

#- 37 DeletePort
./ng net.accelbyte.sdk.cli.Main dsmc deletePort \
    --name '8SswrRRc' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 37 'DeletePort' test.out

#- 38 UpdatePort
./ng net.accelbyte.sdk.cli.Main dsmc updatePort \
    --name 'hgRqke3Q' \
    --namespace "$AB_NAMESPACE" \
    --body '{"name": "rJDme3qm", "port": 29}' \
    > test.out 2>&1
eval_tap $? 38 'UpdatePort' test.out

#- 39 ListImages
./ng net.accelbyte.sdk.cli.Main dsmc listImages \
    --namespace "$AB_NAMESPACE" \
    --q 'szXQEvhX' \
    --sortBy 'version' \
    --sortDirection 'asc' \
    --count '2' \
    --offset '17' \
    > test.out 2>&1
eval_tap $? 39 'ListImages' test.out

#- 40 DeleteImage
./ng net.accelbyte.sdk.cli.Main dsmc deleteImage \
    --namespace "$AB_NAMESPACE" \
    --imageURI '12jpdfc8' \
    --version 'XJxJrLFb' \
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
    --imageURI 'aLKbyJLC' \
    --version 'pBAgF6JJ' \
    --versionPatch 'PGeZSTlt' \
    > test.out 2>&1
eval_tap $? 42 'DeleteImagePatch' test.out

#- 43 GetImageDetail
./ng net.accelbyte.sdk.cli.Main dsmc getImageDetail \
    --namespace "$AB_NAMESPACE" \
    --version 'dlNTPz1R' \
    > test.out 2>&1
eval_tap $? 43 'GetImageDetail' test.out

#- 44 GetImagePatches
./ng net.accelbyte.sdk.cli.Main dsmc getImagePatches \
    --namespace "$AB_NAMESPACE" \
    --version 'eCzoGJtM' \
    > test.out 2>&1
eval_tap $? 44 'GetImagePatches' test.out

#- 45 GetImagePatchDetail
./ng net.accelbyte.sdk.cli.Main dsmc getImagePatchDetail \
    --namespace "$AB_NAMESPACE" \
    --version 'o5M3FbA4' \
    --versionPatch 'OpR4EjWA' \
    > test.out 2>&1
eval_tap $? 45 'GetImagePatchDetail' test.out

#- 46 AddBuffer
./ng net.accelbyte.sdk.cli.Main dsmc addBuffer \
    --namespace "$AB_NAMESPACE" \
    --body '{"AllocCount": 23, "DeploymentName": "SlY5BFZ0", "JobCount": 93, "JobPriority": 69, "OverrideVersion": "5So2oOrJ", "Region": "UC6BV6ta"}' \
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
    --region 'rrKjmnMF' \
    --count '46' \
    --offset '13' \
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
    --region 'oL1CiXef' \
    > test.out 2>&1
eval_tap $? 50 'CountServerDetailed' test.out

#- 51 ListLocalServer
./ng net.accelbyte.sdk.cli.Main dsmc listLocalServer \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 51 'ListLocalServer' test.out

#- 52 DeleteLocalServer
./ng net.accelbyte.sdk.cli.Main dsmc deleteLocalServer \
    --name 'hdbcdMS5' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 52 'DeleteLocalServer' test.out

#- 53 GetServer
./ng net.accelbyte.sdk.cli.Main dsmc getServer \
    --namespace "$AB_NAMESPACE" \
    --podName 'WgyT4WJE' \
    > test.out 2>&1
eval_tap $? 53 'GetServer' test.out

#- 54 DeleteServer
./ng net.accelbyte.sdk.cli.Main dsmc deleteServer \
    --namespace "$AB_NAMESPACE" \
    --podName 'yAx6oQ4p' \
    > test.out 2>&1
eval_tap $? 54 'DeleteServer' test.out

#- 55 ListSession
./ng net.accelbyte.sdk.cli.Main dsmc listSession \
    --namespace "$AB_NAMESPACE" \
    --region 'P4WCvRMy' \
    --withServer  \
    --count '38' \
    --offset '13' \
    > test.out 2>&1
eval_tap $? 55 'ListSession' test.out

#- 56 CountSession
./ng net.accelbyte.sdk.cli.Main dsmc countSession \
    --namespace "$AB_NAMESPACE" \
    --region 'pviUZBNy' \
    > test.out 2>&1
eval_tap $? 56 'CountSession' test.out

#- 57 DeleteSession
./ng net.accelbyte.sdk.cli.Main dsmc deleteSession \
    --namespace "$AB_NAMESPACE" \
    --sessionID 'C7Hlrpvi' \
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
    --body '{"JobCount": 59, "Region": "u0qDxSrB", "TimeoutSecond": 7, "ZombieCount": 20}' \
    > test.out 2>&1
eval_tap $? 59 'RunZombieCleanerRequestHandler' test.out

#- 60 CreateRepository
./ng net.accelbyte.sdk.cli.Main dsmc createRepository \
    --body '{"namespace": "G1sNpQBi", "repository": "dHSWZ0OL"}' \
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
    --name 'drv96wfT' \
    --count '18' \
    --offset '55' \
    > test.out 2>&1
eval_tap $? 63 'GetAllDeploymentClient' test.out

#- 64 GetDeploymentClient
./ng net.accelbyte.sdk.cli.Main dsmc getDeploymentClient \
    --deployment 'Vg181nde' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 64 'GetDeploymentClient' test.out

#- 65 CreateDeploymentClient
./ng net.accelbyte.sdk.cli.Main dsmc createDeploymentClient \
    --deployment 'BY3JpaTk' \
    --namespace "$AB_NAMESPACE" \
    --body '{"allow_version_override": true, "buffer_count": 84, "buffer_percent": 8, "configuration": "X8zazLYm", "enable_region_overrides": true, "extendable_session": false, "game_version": "ZUrTp946", "max_count": 57, "min_count": 10, "overrides": {"4uba5pum": {"buffer_count": 53, "buffer_percent": 28, "configuration": "lB5DtbjK", "enable_region_overrides": true, "extendable_session": true, "game_version": "VCz0hgf7", "max_count": 95, "min_count": 11, "name": "iF3vxFGM", "region_overrides": {"dqqTGB9t": {"buffer_count": 81, "buffer_percent": 37, "max_count": 42, "min_count": 93, "name": "sPou5ygE", "unlimited": false, "use_buffer_percent": true}, "qGn7E0Kt": {"buffer_count": 35, "buffer_percent": 22, "max_count": 3, "min_count": 2, "name": "7L2Cxsce", "unlimited": true, "use_buffer_percent": true}, "stKE5JtE": {"buffer_count": 14, "buffer_percent": 18, "max_count": 95, "min_count": 78, "name": "NIYrii9A", "unlimited": false, "use_buffer_percent": false}}, "regions": ["XNqLCpO7", "RHcRvlbO", "P0vEeE8C"], "session_timeout": 19, "unlimited": false, "use_buffer_percent": false}, "LbX2gdFE": {"buffer_count": 88, "buffer_percent": 14, "configuration": "Pgh16VVf", "enable_region_overrides": false, "extendable_session": true, "game_version": "2Hmq72NO", "max_count": 59, "min_count": 90, "name": "YHRmPasr", "region_overrides": {"EGwgZDMD": {"buffer_count": 85, "buffer_percent": 93, "max_count": 89, "min_count": 5, "name": "QcYYE3Do", "unlimited": true, "use_buffer_percent": false}, "zRn7irTo": {"buffer_count": 26, "buffer_percent": 15, "max_count": 62, "min_count": 44, "name": "sz7qskYW", "unlimited": true, "use_buffer_percent": true}, "8NGjxHLY": {"buffer_count": 96, "buffer_percent": 26, "max_count": 47, "min_count": 61, "name": "3d3GHPhB", "unlimited": false, "use_buffer_percent": false}}, "regions": ["6QZUqCzd", "t8RODRqN", "zP8XzZRQ"], "session_timeout": 2, "unlimited": false, "use_buffer_percent": true}, "f5yjx9W0": {"buffer_count": 11, "buffer_percent": 35, "configuration": "YpcIa6pi", "enable_region_overrides": false, "extendable_session": true, "game_version": "tJeHuwXo", "max_count": 33, "min_count": 54, "name": "n8ZWOzX3", "region_overrides": {"M0sZ4EyL": {"buffer_count": 35, "buffer_percent": 95, "max_count": 87, "min_count": 6, "name": "M6uz83wC", "unlimited": true, "use_buffer_percent": true}, "nRlrXdFJ": {"buffer_count": 54, "buffer_percent": 34, "max_count": 2, "min_count": 99, "name": "i9DbCdwl", "unlimited": true, "use_buffer_percent": true}, "e89xbX7a": {"buffer_count": 19, "buffer_percent": 55, "max_count": 82, "min_count": 88, "name": "v5Fs6KUh", "unlimited": true, "use_buffer_percent": true}}, "regions": ["SQbKF1Uu", "B7LuUYTm", "qgrbLMoG"], "session_timeout": 95, "unlimited": false, "use_buffer_percent": false}}, "region_overrides": {"mK0J54AL": {"buffer_count": 56, "buffer_percent": 100, "max_count": 72, "min_count": 42, "name": "Sk5jIeom", "unlimited": true, "use_buffer_percent": false}, "h2FFvAR5": {"buffer_count": 81, "buffer_percent": 83, "max_count": 67, "min_count": 12, "name": "a9NdEWgk", "unlimited": true, "use_buffer_percent": true}, "DdBSnJOc": {"buffer_count": 52, "buffer_percent": 83, "max_count": 6, "min_count": 30, "name": "tLFDS2gY", "unlimited": true, "use_buffer_percent": true}}, "regions": ["34uqrFFl", "trBLTjci", "C2VNKSQn"], "session_timeout": 20, "unlimited": false, "use_buffer_percent": true}' \
    > test.out 2>&1
eval_tap $? 65 'CreateDeploymentClient' test.out

#- 66 DeleteDeploymentClient
./ng net.accelbyte.sdk.cli.Main dsmc deleteDeploymentClient \
    --deployment 'dfattpMB' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 66 'DeleteDeploymentClient' test.out

#- 67 GetAllPodConfigClient
./ng net.accelbyte.sdk.cli.Main dsmc getAllPodConfigClient \
    --namespace "$AB_NAMESPACE" \
    --count '10' \
    --offset '46' \
    > test.out 2>&1
eval_tap $? 67 'GetAllPodConfigClient' test.out

#- 68 CreatePodConfigClient
./ng net.accelbyte.sdk.cli.Main dsmc createPodConfigClient \
    --name 'oNXUt9RG' \
    --namespace "$AB_NAMESPACE" \
    --body '{"cpu_limit": 78, "mem_limit": 53, "params": "GijiMPFD"}' \
    > test.out 2>&1
eval_tap $? 68 'CreatePodConfigClient' test.out

#- 69 DeletePodConfigClient
./ng net.accelbyte.sdk.cli.Main dsmc deletePodConfigClient \
    --name 'qWKJNC80' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 69 'DeletePodConfigClient' test.out

#- 70 ListImagesClient
./ng net.accelbyte.sdk.cli.Main dsmc listImagesClient \
    --namespace "$AB_NAMESPACE" \
    --count '88' \
    --offset '90' \
    --q 'b00NKsSu' \
    --sortBy 'updatedAt' \
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
    --version 'nzWhCdKs' \
    > test.out 2>&1
eval_tap $? 72 'ImageDetailClient' test.out

#- 73 ListServerClient
./ng net.accelbyte.sdk.cli.Main dsmc listServerClient \
    --namespace "$AB_NAMESPACE" \
    --region 'qwz38AHL' \
    --count '82' \
    --offset '58' \
    > test.out 2>&1
eval_tap $? 73 'ListServerClient' test.out

#- 74 CountServerDetailedClient
./ng net.accelbyte.sdk.cli.Main dsmc countServerDetailedClient \
    --namespace "$AB_NAMESPACE" \
    --region 'heckAOKQ' \
    > test.out 2>&1
eval_tap $? 74 'CountServerDetailedClient' test.out

#- 75 ServerHeartbeat
./ng net.accelbyte.sdk.cli.Main dsmc serverHeartbeat \
    --namespace "$AB_NAMESPACE" \
    --body '{"podName": "zyhTuNMd"}' \
    > test.out 2>&1
eval_tap $? 75 'ServerHeartbeat' test.out

#- 76 DeregisterLocalServer
./ng net.accelbyte.sdk.cli.Main dsmc deregisterLocalServer \
    --namespace "$AB_NAMESPACE" \
    --body '{"name": "dGEIn3gq"}' \
    > test.out 2>&1
eval_tap $? 76 'DeregisterLocalServer' test.out

#- 77 RegisterLocalServer
./ng net.accelbyte.sdk.cli.Main dsmc registerLocalServer \
    --namespace "$AB_NAMESPACE" \
    --body '{"custom_attribute": "6i6PenGy", "ip": "P1iLcao0", "name": "sAVDROvx", "port": 61}' \
    > test.out 2>&1
eval_tap $? 77 'RegisterLocalServer' test.out

#- 78 RegisterServer
./ng net.accelbyte.sdk.cli.Main dsmc registerServer \
    --namespace "$AB_NAMESPACE" \
    --body '{"custom_attribute": "fMOOVmwg", "pod_name": "LXlx7r0P"}' \
    > test.out 2>&1
eval_tap $? 78 'RegisterServer' test.out

#- 79 ShutdownServer
./ng net.accelbyte.sdk.cli.Main dsmc shutdownServer \
    --namespace "$AB_NAMESPACE" \
    --body '{"kill_me": true, "pod_name": "KCvk7mmU"}' \
    > test.out 2>&1
eval_tap $? 79 'ShutdownServer' test.out

#- 80 GetServerSessionTimeout
./ng net.accelbyte.sdk.cli.Main dsmc getServerSessionTimeout \
    --namespace "$AB_NAMESPACE" \
    --podName 'mfhBrgtP' \
    > test.out 2>&1
eval_tap $? 80 'GetServerSessionTimeout' test.out

#- 81 GetServerSession
./ng net.accelbyte.sdk.cli.Main dsmc getServerSession \
    --namespace "$AB_NAMESPACE" \
    --podName 'AKZ3fCRl' \
    > test.out 2>&1
eval_tap $? 81 'GetServerSession' test.out

#- 82 CreateSession
./ng net.accelbyte.sdk.cli.Main dsmc createSession \
    --namespace "$AB_NAMESPACE" \
    --body '{"client_version": "rxaKL9YV", "configuration": "MolAgp1D", "deployment": "cwR909WB", "game_mode": "zfQGGBMu", "matching_allies": [{"matching_parties": [{"party_attributes": {"3xFj3Y58": {}, "9R3gpHbQ": {}, "Uh3hwcD0": {}}, "party_id": "h8qFmxSX", "party_members": [{"user_id": "l5l5GIAb"}, {"user_id": "RXeO1kAN"}, {"user_id": "qh7uot7I"}]}, {"party_attributes": {"Las3Flwr": {}, "WspZi3fo": {}, "bVHx3kZ8": {}}, "party_id": "JuLG7Dzl", "party_members": [{"user_id": "cJ1Pvc5Z"}, {"user_id": "ZbxdcrlU"}, {"user_id": "z2TF6X0X"}]}, {"party_attributes": {"gExgamNs": {}, "kxFVyDV3": {}, "bzU6Z5R6": {}}, "party_id": "jmekl1DY", "party_members": [{"user_id": "DwwHD5bs"}, {"user_id": "YXyuXWFo"}, {"user_id": "RyCuAk1c"}]}]}, {"matching_parties": [{"party_attributes": {"YcghmyG0": {}, "Spv98puQ": {}, "W3jXrpWP": {}}, "party_id": "3BDk9rdW", "party_members": [{"user_id": "Bx9N1KOm"}, {"user_id": "QlufttlX"}, {"user_id": "eT4ccpxs"}]}, {"party_attributes": {"jCpm4ufB": {}, "g0QspHJ8": {}, "11upHhs1": {}}, "party_id": "Ja3lRNSJ", "party_members": [{"user_id": "GUByTOMy"}, {"user_id": "gsMJSuRd"}, {"user_id": "dfWspTg3"}]}, {"party_attributes": {"GOm5gBMO": {}, "MFvGUWW6": {}, "DcSxHhSn": {}}, "party_id": "GiJ8mIzm", "party_members": [{"user_id": "xkNlYSjQ"}, {"user_id": "ft9nP366"}, {"user_id": "F0VYacEa"}]}]}, {"matching_parties": [{"party_attributes": {"uekN1ixy": {}, "yGAT02pA": {}, "QMqTwFkT": {}}, "party_id": "AUpxZvxP", "party_members": [{"user_id": "6g5DDEvJ"}, {"user_id": "GM6TZWM9"}, {"user_id": "FULQ11vg"}]}, {"party_attributes": {"YA3SSdym": {}, "PpOsLYos": {}, "T6ID0nv7": {}}, "party_id": "PHK1COwV", "party_members": [{"user_id": "PXdEKqRJ"}, {"user_id": "aOkW5a3C"}, {"user_id": "xjTqCOW3"}]}, {"party_attributes": {"xsJSg4XM": {}, "KR4trZsC": {}, "mww6nuNw": {}}, "party_id": "Yo8kLEsr", "party_members": [{"user_id": "3NUJ9z50"}, {"user_id": "0zet7yKa"}, {"user_id": "07OBfYcK"}]}]}], "namespace": "hzJ9VSbj", "notification_payload": {}, "pod_name": "9WSZ8Wef", "region": "4bnV1dVw", "session_id": "lZkJKWJk"}' \
    > test.out 2>&1
eval_tap $? 82 'CreateSession' test.out

#- 83 ClaimServer
./ng net.accelbyte.sdk.cli.Main dsmc claimServer \
    --namespace "$AB_NAMESPACE" \
    --body '{"game_mode": "KOvXndhT", "matching_allies": [{"matching_parties": [{"party_attributes": {"66UU67rQ": {}, "4ph2I3ah": {}, "bSKUeEc6": {}}, "party_id": "h5uTq2ps", "party_members": [{"user_id": "GQUe27la"}, {"user_id": "rxtPht5P"}, {"user_id": "pwh4v4Au"}]}, {"party_attributes": {"9fayOSoB": {}, "TAz9RN94": {}, "mVF3EYKE": {}}, "party_id": "3ZeKXWFD", "party_members": [{"user_id": "wDDynYtk"}, {"user_id": "38FIpCk5"}, {"user_id": "tDQ8Y6fJ"}]}, {"party_attributes": {"hsYtxju0": {}, "QxAv2lcX": {}, "vMdKunMg": {}}, "party_id": "dk75353A", "party_members": [{"user_id": "KUDHjZTs"}, {"user_id": "WH3dKjBP"}, {"user_id": "o4498G9e"}]}]}, {"matching_parties": [{"party_attributes": {"VDO8ClDk": {}, "7URnbs6j": {}, "j4F8BwU3": {}}, "party_id": "kNrtmRsr", "party_members": [{"user_id": "QrRHg7jN"}, {"user_id": "5FG4gHMy"}, {"user_id": "rxxtLA1w"}]}, {"party_attributes": {"KJCUbDRt": {}, "EEE7axZ8": {}, "BCuCTMj2": {}}, "party_id": "HX1KeEwU", "party_members": [{"user_id": "9zlvHcHz"}, {"user_id": "Sc42iIdO"}, {"user_id": "V1jHRvSr"}]}, {"party_attributes": {"nYyklC7g": {}, "A6cuxfXI": {}, "D5oxlPAP": {}}, "party_id": "jfgVCBH5", "party_members": [{"user_id": "vAhn5Uyi"}, {"user_id": "vhak48YU"}, {"user_id": "T2DU42au"}]}]}, {"matching_parties": [{"party_attributes": {"wgtBjtop": {}, "jjUeXP5A": {}, "J9B1Eubv": {}}, "party_id": "2NyEj6qI", "party_members": [{"user_id": "FNyk9ziY"}, {"user_id": "Ue9hoW4g"}, {"user_id": "sQpvvMnD"}]}, {"party_attributes": {"BERhJ7jY": {}, "tJWheAAC": {}, "ncYYpv5q": {}}, "party_id": "ldeVUvdL", "party_members": [{"user_id": "J8X1Cx2f"}, {"user_id": "RgryjQuh"}, {"user_id": "Wgf6PtLQ"}]}, {"party_attributes": {"a193kVnA": {}, "YEfDSABE": {}, "CsO3XPRA": {}}, "party_id": "ngwST72u", "party_members": [{"user_id": "PJ30bTsa"}, {"user_id": "DcLDjLiK"}, {"user_id": "IPXBWAH6"}]}]}], "namespace": "T2tTgD3k", "notification_payload": {}, "session_id": "0a3m1Oel"}' \
    > test.out 2>&1
eval_tap $? 83 'ClaimServer' test.out

#- 84 GetSession
./ng net.accelbyte.sdk.cli.Main dsmc getSession \
    --namespace "$AB_NAMESPACE" \
    --sessionID 'xLm2Jp3t' \
    > test.out 2>&1
eval_tap $? 84 'GetSession' test.out

#- 85 CancelSession
./ng net.accelbyte.sdk.cli.Main dsmc cancelSession \
    --namespace "$AB_NAMESPACE" \
    --sessionID 'heuhE64a' \
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
    --region '3VrvAvIa' \
    > test.out 2>&1
eval_tap $? 88 'ListProvidersByRegion' test.out

#- 89 PublicGetMessages
./ng net.accelbyte.sdk.cli.Main dsmc publicGetMessages \
    > test.out 2>&1
eval_tap $? 89 'PublicGetMessages' test.out


rm -f "tmp.dat"

exit $EXIT_CODE