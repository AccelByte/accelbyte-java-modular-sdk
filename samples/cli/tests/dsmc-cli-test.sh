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
    --body '{"artifactPath": "wMMAhB5l", "coreDumpEnabled": false, "image": "R1jVXHbs", "imageReplicationsMap": {"Wx74rBve": {"failure_code": "0n422AMT", "region": "xSsVsn5w", "status": "gCSiFBuL", "uri": "27Y1TGTI"}, "6ij8hbzX": {"failure_code": "TjQ3V1zZ", "region": "euSYY9IM", "status": "SfuGCYRz", "uri": "xNVpFcNN"}, "gwhpiJDW": {"failure_code": "lNzdrJ0P", "region": "JtClACWI", "status": "2FPAzChL", "uri": "oJSLcB5o"}}, "namespace": "hvHV8n0O", "patchVersion": "LZVjjT87", "persistent": true, "ulimitFileSize": 30, "version": "39cOXgxm"}' \
    > test.out 2>&1
eval_tap $? 4 'UpdateImage' test.out

#- 5 CreateImage
./ng net.accelbyte.sdk.cli.Main dsmc createImage \
    --body '{"artifactPath": "XXBfz7SZ", "coreDumpEnabled": false, "dockerPath": "WPH5yKGm", "image": "GBvZlxLO", "imageSize": 75, "namespace": "4iCuUGXv", "persistent": true, "ulimitFileSize": 22, "version": "XuwK5gEU"}' \
    > test.out 2>&1
eval_tap $? 5 'CreateImage' test.out

#- 6 CreateImagePatch
./ng net.accelbyte.sdk.cli.Main dsmc createImagePatch \
    --body '{"artifactPath": "RzuGxqrf", "coreDumpEnabled": false, "dockerPath": "BJQhwewk", "image": "OW9RRXKC", "imageSize": 56, "namespace": "ApkA0nyO", "patchVersion": "Eep6sE5R", "persistent": false, "ulimitFileSize": 49, "uploaderFlag": "9rOm4f2E", "version": "dzeZXEmQ"}' \
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
    --body '{"auto_deletion": true, "ghost_worker": false, "manual_buffer_override": true, "zombie_worker": false}' \
    > test.out 2>&1
eval_tap $? 9 'UpdateWorkerConfig' test.out

#- 10 CreateWorkerConfig
./ng net.accelbyte.sdk.cli.Main dsmc createWorkerConfig \
    --namespace "$AB_NAMESPACE" \
    --body '{"auto_deletion": true, "ghost_worker": false, "manual_buffer_override": true, "zombie_worker": false}' \
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
    --body '{"claim_timeout": 45, "creation_timeout": 24, "default_version": "TTxbLrHN", "port": 63, "ports": {"GPOuuJvB": 92, "ar2JNgeY": 33, "WV7IScGc": 61}, "protocol": "jGQwg1xL", "providers": ["LZSYosHM", "8bZFSsLz", "29761fbX"], "session_timeout": 62, "unreachable_timeout": 39}' \
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
    --body '{"claim_timeout": 74, "creation_timeout": 83, "default_version": "8E9v2bC6", "port": 35, "protocol": "NwNdv5Eb", "providers": ["xkiBPrR1", "v6eWTvpz", "sAkWCSGf"], "session_timeout": 56, "unreachable_timeout": 45}' \
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
    --name 'OEsCHdq6' \
    --count '89' \
    --offset '19' \
    > test.out 2>&1
eval_tap $? 16 'GetAllDeployment' test.out

#- 17 GetDeployment
./ng net.accelbyte.sdk.cli.Main dsmc getDeployment \
    --deployment '0j5JuYI9' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 17 'GetDeployment' test.out

#- 18 CreateDeployment
./ng net.accelbyte.sdk.cli.Main dsmc createDeployment \
    --deployment 'i5OrIhWx' \
    --namespace "$AB_NAMESPACE" \
    --body '{"allow_version_override": false, "buffer_count": 51, "buffer_percent": 81, "configuration": "vbS7m6sb", "enable_region_overrides": true, "extendable_session": false, "game_version": "tghGYgxG", "max_count": 47, "min_count": 23, "overrides": {"XBe91XUu": {"buffer_count": 24, "buffer_percent": 75, "configuration": "89Q998y3", "enable_region_overrides": true, "extendable_session": true, "game_version": "pRYewZpR", "max_count": 47, "min_count": 31, "name": "5QtMNADy", "region_overrides": {"fNzVsmyx": {"buffer_count": 50, "buffer_percent": 21, "max_count": 68, "min_count": 83, "name": "UikQeEVK", "unlimited": true, "use_buffer_percent": true}, "7r0I6DmK": {"buffer_count": 21, "buffer_percent": 23, "max_count": 95, "min_count": 12, "name": "96IpOdbA", "unlimited": true, "use_buffer_percent": false}, "jfYMHqnT": {"buffer_count": 76, "buffer_percent": 16, "max_count": 80, "min_count": 24, "name": "jZ2FvEhV", "unlimited": true, "use_buffer_percent": true}}, "regions": ["YPd9OInf", "FMzUJySq", "CheKcJq5"], "session_timeout": 76, "unlimited": true, "use_buffer_percent": true}, "BRS65ml8": {"buffer_count": 96, "buffer_percent": 98, "configuration": "7T2kuMhj", "enable_region_overrides": true, "extendable_session": false, "game_version": "0pTwpYSR", "max_count": 42, "min_count": 56, "name": "kIQUZE1y", "region_overrides": {"ww1PomiH": {"buffer_count": 38, "buffer_percent": 70, "max_count": 46, "min_count": 42, "name": "oEcwuxit", "unlimited": false, "use_buffer_percent": true}, "E5OZ4hqA": {"buffer_count": 81, "buffer_percent": 13, "max_count": 74, "min_count": 67, "name": "fGeYM3Gt", "unlimited": true, "use_buffer_percent": true}, "ZiZtfYgf": {"buffer_count": 83, "buffer_percent": 7, "max_count": 35, "min_count": 28, "name": "2e6m5se4", "unlimited": true, "use_buffer_percent": true}}, "regions": ["Rc7DfUMe", "AlhAqzxN", "UFxHNt7V"], "session_timeout": 19, "unlimited": false, "use_buffer_percent": true}, "bEIb8ENL": {"buffer_count": 62, "buffer_percent": 69, "configuration": "PRO7LbsJ", "enable_region_overrides": false, "extendable_session": false, "game_version": "mWEnyYzT", "max_count": 57, "min_count": 53, "name": "2gf4TjuR", "region_overrides": {"ckv4D2O4": {"buffer_count": 80, "buffer_percent": 39, "max_count": 33, "min_count": 96, "name": "Y7FeSFGA", "unlimited": false, "use_buffer_percent": true}, "QimPYHwR": {"buffer_count": 15, "buffer_percent": 49, "max_count": 89, "min_count": 77, "name": "f72SMl0b", "unlimited": true, "use_buffer_percent": true}, "fNLYNPAK": {"buffer_count": 36, "buffer_percent": 87, "max_count": 20, "min_count": 9, "name": "8DcO17ue", "unlimited": false, "use_buffer_percent": false}}, "regions": ["08Dj3YLa", "2ktFFaZz", "M5aPSmcD"], "session_timeout": 18, "unlimited": true, "use_buffer_percent": true}}, "region_overrides": {"XzWYGPk1": {"buffer_count": 43, "buffer_percent": 67, "max_count": 8, "min_count": 7, "name": "pMVDLKNO", "unlimited": true, "use_buffer_percent": false}, "yl13RSoo": {"buffer_count": 4, "buffer_percent": 32, "max_count": 92, "min_count": 94, "name": "zK9gm5jp", "unlimited": false, "use_buffer_percent": false}, "hwqInEqk": {"buffer_count": 89, "buffer_percent": 69, "max_count": 49, "min_count": 38, "name": "pHZ3RYiE", "unlimited": true, "use_buffer_percent": true}}, "regions": ["Nd9H8lut", "QXtmM2wd", "KbfnWn4U"], "session_timeout": 31, "unlimited": false, "use_buffer_percent": false}' \
    > test.out 2>&1
eval_tap $? 18 'CreateDeployment' test.out

#- 19 DeleteDeployment
./ng net.accelbyte.sdk.cli.Main dsmc deleteDeployment \
    --deployment 'w1K1V32B' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 19 'DeleteDeployment' test.out

#- 20 UpdateDeployment
./ng net.accelbyte.sdk.cli.Main dsmc updateDeployment \
    --deployment 'pSKbH2lv' \
    --namespace "$AB_NAMESPACE" \
    --body '{"allow_version_override": true, "buffer_count": 96, "buffer_percent": 11, "configuration": "EBEwiM2b", "enable_region_overrides": true, "extendable_session": false, "game_version": "NHMdwZ8x", "max_count": 24, "min_count": 98, "regions": ["jITe7JyL", "tEiemBsF", "Ttqt0z3b"], "session_timeout": 52, "unlimited": true, "use_buffer_percent": false}' \
    > test.out 2>&1
eval_tap $? 20 'UpdateDeployment' test.out

#- 21 CreateRootRegionOverride
./ng net.accelbyte.sdk.cli.Main dsmc createRootRegionOverride \
    --deployment 'Ce8bgTRT' \
    --namespace "$AB_NAMESPACE" \
    --region 'juDkYc9g' \
    --body '{"buffer_count": 30, "buffer_percent": 24, "max_count": 37, "min_count": 100, "unlimited": true, "use_buffer_percent": true}' \
    > test.out 2>&1
eval_tap $? 21 'CreateRootRegionOverride' test.out

#- 22 DeleteRootRegionOverride
./ng net.accelbyte.sdk.cli.Main dsmc deleteRootRegionOverride \
    --deployment 'Efdu0MHv' \
    --namespace "$AB_NAMESPACE" \
    --region 'BcsVT11N' \
    > test.out 2>&1
eval_tap $? 22 'DeleteRootRegionOverride' test.out

#- 23 UpdateRootRegionOverride
./ng net.accelbyte.sdk.cli.Main dsmc updateRootRegionOverride \
    --deployment 'mAYthUe1' \
    --namespace "$AB_NAMESPACE" \
    --region 'brffMdiT' \
    --body '{"buffer_count": 93, "buffer_percent": 84, "max_count": 10, "min_count": 29, "unlimited": false, "use_buffer_percent": true}' \
    > test.out 2>&1
eval_tap $? 23 'UpdateRootRegionOverride' test.out

#- 24 CreateDeploymentOverride
./ng net.accelbyte.sdk.cli.Main dsmc createDeploymentOverride \
    --deployment 'UmwnogMk' \
    --namespace "$AB_NAMESPACE" \
    --version 'fc9mNYNu' \
    --body '{"buffer_count": 36, "buffer_percent": 63, "configuration": "0gVcqQh0", "enable_region_overrides": false, "extendable_session": false, "game_version": "MHv5iaQi", "max_count": 68, "min_count": 67, "region_overrides": {"tfHDWd8X": {"buffer_count": 35, "buffer_percent": 6, "max_count": 74, "min_count": 70, "name": "sXndkowy", "unlimited": true, "use_buffer_percent": false}, "Om3WLrRr": {"buffer_count": 59, "buffer_percent": 67, "max_count": 40, "min_count": 40, "name": "MlvdsxLg", "unlimited": true, "use_buffer_percent": false}, "SZyRYRwx": {"buffer_count": 46, "buffer_percent": 12, "max_count": 45, "min_count": 2, "name": "zwoVAfW7", "unlimited": false, "use_buffer_percent": false}}, "regions": ["5zlB8PoQ", "clOLFd1K", "SLUNpPyi"], "session_timeout": 47, "unlimited": false, "use_buffer_percent": false}' \
    > test.out 2>&1
eval_tap $? 24 'CreateDeploymentOverride' test.out

#- 25 DeleteDeploymentOverride
./ng net.accelbyte.sdk.cli.Main dsmc deleteDeploymentOverride \
    --deployment 'ilwQL3mt' \
    --namespace "$AB_NAMESPACE" \
    --version 'RGglEVQW' \
    > test.out 2>&1
eval_tap $? 25 'DeleteDeploymentOverride' test.out

#- 26 UpdateDeploymentOverride
./ng net.accelbyte.sdk.cli.Main dsmc updateDeploymentOverride \
    --deployment 'Do6ust13' \
    --namespace "$AB_NAMESPACE" \
    --version 'MfrO2X2i' \
    --body '{"buffer_count": 29, "buffer_percent": 13, "configuration": "lYwwm5CD", "enable_region_overrides": true, "game_version": "2ZvhKE8t", "max_count": 51, "min_count": 37, "regions": ["PW5lTXTu", "aKqudjbS", "1V6lFSqc"], "session_timeout": 17, "unlimited": true, "use_buffer_percent": true}' \
    > test.out 2>&1
eval_tap $? 26 'UpdateDeploymentOverride' test.out

#- 27 CreateOverrideRegionOverride
./ng net.accelbyte.sdk.cli.Main dsmc createOverrideRegionOverride \
    --deployment 'qjwztkOd' \
    --namespace "$AB_NAMESPACE" \
    --region 'P8Uh05Pd' \
    --version 'pbdJcJTG' \
    --body '{"buffer_count": 80, "buffer_percent": 13, "max_count": 31, "min_count": 66, "unlimited": false, "use_buffer_percent": true}' \
    > test.out 2>&1
eval_tap $? 27 'CreateOverrideRegionOverride' test.out

#- 28 DeleteOverrideRegionOverride
./ng net.accelbyte.sdk.cli.Main dsmc deleteOverrideRegionOverride \
    --deployment 'qVE8qJ7w' \
    --namespace "$AB_NAMESPACE" \
    --region 'tgQQ5qKV' \
    --version 'ZtvZuBgo' \
    > test.out 2>&1
eval_tap $? 28 'DeleteOverrideRegionOverride' test.out

#- 29 UpdateOverrideRegionOverride
./ng net.accelbyte.sdk.cli.Main dsmc updateOverrideRegionOverride \
    --deployment 'GMYvOtlI' \
    --namespace "$AB_NAMESPACE" \
    --region 'AYSyFX9r' \
    --version 'SMGQH80I' \
    --body '{"buffer_count": 100, "buffer_percent": 12, "max_count": 11, "min_count": 55, "unlimited": false, "use_buffer_percent": true}' \
    > test.out 2>&1
eval_tap $? 29 'UpdateOverrideRegionOverride' test.out

#- 30 DeleteCreatingServerCountQueue
./ng net.accelbyte.sdk.cli.Main dsmc deleteCreatingServerCountQueue \
    --deployment 'dpNyjoUj' \
    --namespace "$AB_NAMESPACE" \
    --version 'sl3JeXVF' \
    > test.out 2>&1
eval_tap $? 30 'DeleteCreatingServerCountQueue' test.out

#- 31 GetAllPodConfig
./ng net.accelbyte.sdk.cli.Main dsmc getAllPodConfig \
    --namespace "$AB_NAMESPACE" \
    --count '97' \
    --offset '19' \
    > test.out 2>&1
eval_tap $? 31 'GetAllPodConfig' test.out

#- 32 GetPodConfig
./ng net.accelbyte.sdk.cli.Main dsmc getPodConfig \
    --name 'uTBngGWV' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 32 'GetPodConfig' test.out

#- 33 CreatePodConfig
./ng net.accelbyte.sdk.cli.Main dsmc createPodConfig \
    --name '5u2058Vn' \
    --namespace "$AB_NAMESPACE" \
    --body '{"cpu_limit": 3, "mem_limit": 7, "params": "Mr4q4Qun"}' \
    > test.out 2>&1
eval_tap $? 33 'CreatePodConfig' test.out

#- 34 DeletePodConfig
./ng net.accelbyte.sdk.cli.Main dsmc deletePodConfig \
    --name 'd15ntdtD' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 34 'DeletePodConfig' test.out

#- 35 UpdatePodConfig
./ng net.accelbyte.sdk.cli.Main dsmc updatePodConfig \
    --name 'Ai2Z7036' \
    --namespace "$AB_NAMESPACE" \
    --body '{"cpu_limit": 15, "mem_limit": 56, "name": "Tom1cYx1", "params": "V1phDLZE"}' \
    > test.out 2>&1
eval_tap $? 35 'UpdatePodConfig' test.out

#- 36 AddPort
./ng net.accelbyte.sdk.cli.Main dsmc addPort \
    --name 'MzSUv2dl' \
    --namespace "$AB_NAMESPACE" \
    --body '{"port": 60}' \
    > test.out 2>&1
eval_tap $? 36 'AddPort' test.out

#- 37 DeletePort
./ng net.accelbyte.sdk.cli.Main dsmc deletePort \
    --name 'TqU4a8Dp' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 37 'DeletePort' test.out

#- 38 UpdatePort
./ng net.accelbyte.sdk.cli.Main dsmc updatePort \
    --name 'QUbMwx3c' \
    --namespace "$AB_NAMESPACE" \
    --body '{"name": "432k18ni", "port": 57}' \
    > test.out 2>&1
eval_tap $? 38 'UpdatePort' test.out

#- 39 ListImages
./ng net.accelbyte.sdk.cli.Main dsmc listImages \
    --namespace "$AB_NAMESPACE" \
    --q 'Ia5d0Bw8' \
    --sortBy 'updatedAt' \
    --sortDirection 'asc' \
    --count '0' \
    --offset '25' \
    > test.out 2>&1
eval_tap $? 39 'ListImages' test.out

#- 40 DeleteImage
./ng net.accelbyte.sdk.cli.Main dsmc deleteImage \
    --namespace "$AB_NAMESPACE" \
    --imageURI 'OyNo2zJd' \
    --version 'LQ8s9neD' \
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
    --imageURI 'kX5ut6gs' \
    --version 'dHXGHitM' \
    --versionPatch 'x6Gq2svy' \
    > test.out 2>&1
eval_tap $? 42 'DeleteImagePatch' test.out

#- 43 GetImageDetail
./ng net.accelbyte.sdk.cli.Main dsmc getImageDetail \
    --namespace "$AB_NAMESPACE" \
    --version 'OwUvS0wo' \
    > test.out 2>&1
eval_tap $? 43 'GetImageDetail' test.out

#- 44 GetImagePatches
./ng net.accelbyte.sdk.cli.Main dsmc getImagePatches \
    --namespace "$AB_NAMESPACE" \
    --version 'WTdPKcsq' \
    > test.out 2>&1
eval_tap $? 44 'GetImagePatches' test.out

#- 45 GetImagePatchDetail
./ng net.accelbyte.sdk.cli.Main dsmc getImagePatchDetail \
    --namespace "$AB_NAMESPACE" \
    --version 'emWyF70i' \
    --versionPatch 'QAe8osnV' \
    > test.out 2>&1
eval_tap $? 45 'GetImagePatchDetail' test.out

#- 46 AddBuffer
./ng net.accelbyte.sdk.cli.Main dsmc addBuffer \
    --namespace "$AB_NAMESPACE" \
    --body '{"AllocCount": 9, "DeploymentName": "I614EWxp", "JobCount": 66, "JobPriority": 1, "OverrideVersion": "Xaht1fMk", "Region": "sR07P37t"}' \
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
    --region 'acTHluKD' \
    --count '35' \
    --offset '29' \
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
    --region 't1QMBtdn' \
    > test.out 2>&1
eval_tap $? 50 'CountServerDetailed' test.out

#- 51 ListLocalServer
./ng net.accelbyte.sdk.cli.Main dsmc listLocalServer \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 51 'ListLocalServer' test.out

#- 52 DeleteLocalServer
./ng net.accelbyte.sdk.cli.Main dsmc deleteLocalServer \
    --name 'MzRorCDn' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 52 'DeleteLocalServer' test.out

#- 53 GetServer
./ng net.accelbyte.sdk.cli.Main dsmc getServer \
    --namespace "$AB_NAMESPACE" \
    --podName 'N7TOfaRR' \
    > test.out 2>&1
eval_tap $? 53 'GetServer' test.out

#- 54 DeleteServer
./ng net.accelbyte.sdk.cli.Main dsmc deleteServer \
    --namespace "$AB_NAMESPACE" \
    --podName '9eKI9U2p' \
    > test.out 2>&1
eval_tap $? 54 'DeleteServer' test.out

#- 55 ListSession
./ng net.accelbyte.sdk.cli.Main dsmc listSession \
    --namespace "$AB_NAMESPACE" \
    --region 'viUxltsX' \
    --withServer  \
    --count '15' \
    --offset '27' \
    > test.out 2>&1
eval_tap $? 55 'ListSession' test.out

#- 56 CountSession
./ng net.accelbyte.sdk.cli.Main dsmc countSession \
    --namespace "$AB_NAMESPACE" \
    --region '35yEgUfa' \
    > test.out 2>&1
eval_tap $? 56 'CountSession' test.out

#- 57 DeleteSession
./ng net.accelbyte.sdk.cli.Main dsmc deleteSession \
    --namespace "$AB_NAMESPACE" \
    --sessionID 'ja5IbY44' \
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
    --body '{"JobCount": 58, "Region": "tK4cCduU", "TimeoutSecond": 27, "ZombieCount": 43}' \
    > test.out 2>&1
eval_tap $? 59 'RunZombieCleanerRequestHandler' test.out

#- 60 CreateRepository
./ng net.accelbyte.sdk.cli.Main dsmc createRepository \
    --body '{"namespace": "R5rI2j1e", "repository": "bj5Hnl9J"}' \
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
    --name 'PARWpTvc' \
    --count '21' \
    --offset '29' \
    > test.out 2>&1
eval_tap $? 63 'GetAllDeploymentClient' test.out

#- 64 GetDeploymentClient
./ng net.accelbyte.sdk.cli.Main dsmc getDeploymentClient \
    --deployment 'VFQ5EIAA' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 64 'GetDeploymentClient' test.out

#- 65 CreateDeploymentClient
./ng net.accelbyte.sdk.cli.Main dsmc createDeploymentClient \
    --deployment 'Zt7VyYn5' \
    --namespace "$AB_NAMESPACE" \
    --body '{"allow_version_override": false, "buffer_count": 56, "buffer_percent": 81, "configuration": "gOslWUNy", "enable_region_overrides": true, "extendable_session": true, "game_version": "2gRLAdHU", "max_count": 31, "min_count": 40, "overrides": {"WSVxt3aw": {"buffer_count": 98, "buffer_percent": 10, "configuration": "D6whES0v", "enable_region_overrides": true, "extendable_session": false, "game_version": "d22NFdif", "max_count": 47, "min_count": 26, "name": "FcfO3W9I", "region_overrides": {"T37MUQEq": {"buffer_count": 70, "buffer_percent": 40, "max_count": 84, "min_count": 22, "name": "Z6qNxShm", "unlimited": true, "use_buffer_percent": false}, "XKr2pM6l": {"buffer_count": 52, "buffer_percent": 1, "max_count": 28, "min_count": 1, "name": "c7P71aJP", "unlimited": false, "use_buffer_percent": false}, "qTJCnObX": {"buffer_count": 62, "buffer_percent": 68, "max_count": 74, "min_count": 12, "name": "KeLF12Jm", "unlimited": true, "use_buffer_percent": true}}, "regions": ["cQo7e3aL", "s8mUEFdY", "AV3nbDYS"], "session_timeout": 76, "unlimited": true, "use_buffer_percent": false}, "6kSisSjO": {"buffer_count": 53, "buffer_percent": 12, "configuration": "9xjaFxWn", "enable_region_overrides": true, "extendable_session": false, "game_version": "gUwqDQv1", "max_count": 8, "min_count": 92, "name": "ueAtVbBH", "region_overrides": {"oMGX5IvS": {"buffer_count": 27, "buffer_percent": 54, "max_count": 97, "min_count": 63, "name": "CXFLSPeV", "unlimited": false, "use_buffer_percent": false}, "sFVWbto3": {"buffer_count": 76, "buffer_percent": 57, "max_count": 40, "min_count": 93, "name": "rvwdX75Y", "unlimited": false, "use_buffer_percent": false}, "KqpwEDIb": {"buffer_count": 86, "buffer_percent": 33, "max_count": 91, "min_count": 79, "name": "I31XQtRv", "unlimited": true, "use_buffer_percent": true}}, "regions": ["ybonx0OB", "Lr3PDoaS", "88dfFY0J"], "session_timeout": 87, "unlimited": false, "use_buffer_percent": true}, "G8Qv6xqq": {"buffer_count": 63, "buffer_percent": 15, "configuration": "KDT3psLa", "enable_region_overrides": false, "extendable_session": false, "game_version": "dUs3W7Va", "max_count": 46, "min_count": 67, "name": "A0ddP015", "region_overrides": {"PWHMNuIq": {"buffer_count": 67, "buffer_percent": 57, "max_count": 93, "min_count": 99, "name": "SMqKgALE", "unlimited": true, "use_buffer_percent": false}, "7iVX70qX": {"buffer_count": 71, "buffer_percent": 75, "max_count": 45, "min_count": 56, "name": "cyAkOfM6", "unlimited": false, "use_buffer_percent": true}, "tySkuM9r": {"buffer_count": 3, "buffer_percent": 49, "max_count": 62, "min_count": 35, "name": "CFvzXEZk", "unlimited": false, "use_buffer_percent": false}}, "regions": ["TVCiWzJ0", "g3eNipfb", "7Ibtxj2U"], "session_timeout": 15, "unlimited": false, "use_buffer_percent": false}}, "region_overrides": {"nljH9IkF": {"buffer_count": 56, "buffer_percent": 50, "max_count": 79, "min_count": 46, "name": "4SWbtrH6", "unlimited": false, "use_buffer_percent": true}, "R9MJfUtH": {"buffer_count": 66, "buffer_percent": 3, "max_count": 10, "min_count": 44, "name": "WQxlQfJr", "unlimited": false, "use_buffer_percent": true}, "k8EPkqKY": {"buffer_count": 28, "buffer_percent": 69, "max_count": 36, "min_count": 30, "name": "MEwhXg8w", "unlimited": true, "use_buffer_percent": true}}, "regions": ["NZGv4jaz", "NJsQ9qcw", "AQqZ3G84"], "session_timeout": 13, "unlimited": true, "use_buffer_percent": false}' \
    > test.out 2>&1
eval_tap $? 65 'CreateDeploymentClient' test.out

#- 66 DeleteDeploymentClient
./ng net.accelbyte.sdk.cli.Main dsmc deleteDeploymentClient \
    --deployment 'PRxiWjEo' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 66 'DeleteDeploymentClient' test.out

#- 67 GetAllPodConfigClient
./ng net.accelbyte.sdk.cli.Main dsmc getAllPodConfigClient \
    --namespace "$AB_NAMESPACE" \
    --count '20' \
    --offset '40' \
    > test.out 2>&1
eval_tap $? 67 'GetAllPodConfigClient' test.out

#- 68 CreatePodConfigClient
./ng net.accelbyte.sdk.cli.Main dsmc createPodConfigClient \
    --name '78EmK20h' \
    --namespace "$AB_NAMESPACE" \
    --body '{"cpu_limit": 49, "mem_limit": 47, "params": "JhUV62ZV"}' \
    > test.out 2>&1
eval_tap $? 68 'CreatePodConfigClient' test.out

#- 69 DeletePodConfigClient
./ng net.accelbyte.sdk.cli.Main dsmc deletePodConfigClient \
    --name 'ntb0uttE' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 69 'DeletePodConfigClient' test.out

#- 70 ListImagesClient
./ng net.accelbyte.sdk.cli.Main dsmc listImagesClient \
    --namespace "$AB_NAMESPACE" \
    --count '16' \
    --offset '22' \
    --q 'HlREww7D' \
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
    --version 'xQwIxKQO' \
    > test.out 2>&1
eval_tap $? 72 'ImageDetailClient' test.out

#- 73 ListServerClient
./ng net.accelbyte.sdk.cli.Main dsmc listServerClient \
    --namespace "$AB_NAMESPACE" \
    --region 'WSPUyA9E' \
    --count '32' \
    --offset '43' \
    > test.out 2>&1
eval_tap $? 73 'ListServerClient' test.out

#- 74 CountServerDetailedClient
./ng net.accelbyte.sdk.cli.Main dsmc countServerDetailedClient \
    --namespace "$AB_NAMESPACE" \
    --region 'xbOWlRMC' \
    > test.out 2>&1
eval_tap $? 74 'CountServerDetailedClient' test.out

#- 75 ServerHeartbeat
./ng net.accelbyte.sdk.cli.Main dsmc serverHeartbeat \
    --namespace "$AB_NAMESPACE" \
    --body '{"podName": "dmnP3KfG"}' \
    > test.out 2>&1
eval_tap $? 75 'ServerHeartbeat' test.out

#- 76 DeregisterLocalServer
./ng net.accelbyte.sdk.cli.Main dsmc deregisterLocalServer \
    --namespace "$AB_NAMESPACE" \
    --body '{"name": "s8WgD7Bh"}' \
    > test.out 2>&1
eval_tap $? 76 'DeregisterLocalServer' test.out

#- 77 RegisterLocalServer
./ng net.accelbyte.sdk.cli.Main dsmc registerLocalServer \
    --namespace "$AB_NAMESPACE" \
    --body '{"custom_attribute": "mzifZ9LO", "ip": "Zrw2riLY", "name": "WTuDaesj", "port": 31}' \
    > test.out 2>&1
eval_tap $? 77 'RegisterLocalServer' test.out

#- 78 RegisterServer
./ng net.accelbyte.sdk.cli.Main dsmc registerServer \
    --namespace "$AB_NAMESPACE" \
    --body '{"custom_attribute": "IdO3mOFf", "pod_name": "HT9FtRVL"}' \
    > test.out 2>&1
eval_tap $? 78 'RegisterServer' test.out

#- 79 ShutdownServer
./ng net.accelbyte.sdk.cli.Main dsmc shutdownServer \
    --namespace "$AB_NAMESPACE" \
    --body '{"kill_me": true, "pod_name": "KH8MKpvg"}' \
    > test.out 2>&1
eval_tap $? 79 'ShutdownServer' test.out

#- 80 GetServerSessionTimeout
./ng net.accelbyte.sdk.cli.Main dsmc getServerSessionTimeout \
    --namespace "$AB_NAMESPACE" \
    --podName '3E3HoyP5' \
    > test.out 2>&1
eval_tap $? 80 'GetServerSessionTimeout' test.out

#- 81 GetServerSession
./ng net.accelbyte.sdk.cli.Main dsmc getServerSession \
    --namespace "$AB_NAMESPACE" \
    --podName 'TMNRNh6K' \
    > test.out 2>&1
eval_tap $? 81 'GetServerSession' test.out

#- 82 CreateSession
./ng net.accelbyte.sdk.cli.Main dsmc createSession \
    --namespace "$AB_NAMESPACE" \
    --body '{"client_version": "onP5dv8M", "configuration": "NkcPOZCj", "deployment": "uFVB3NeZ", "game_mode": "lkHRCzsY", "matching_allies": [{"matching_parties": [{"party_attributes": {"ZErV4OQs": {}, "7Gz9cOUa": {}, "voyrpP0D": {}}, "party_id": "PrLOUrI5", "party_members": [{"user_id": "hvGAMZxp"}, {"user_id": "n6Oro13z"}, {"user_id": "n8e45MMJ"}]}, {"party_attributes": {"52V1FoMy": {}, "MijJ2t2n": {}, "uej0UUuw": {}}, "party_id": "a4JR7O79", "party_members": [{"user_id": "1RkcFtIV"}, {"user_id": "z6gVOm9k"}, {"user_id": "xRZytrd0"}]}, {"party_attributes": {"RvYuNldO": {}, "82HJn8ya": {}, "0zIRoHwz": {}}, "party_id": "ihGVtigx", "party_members": [{"user_id": "26G2Ejlx"}, {"user_id": "FIv2FmD8"}, {"user_id": "ZUmJfXv4"}]}]}, {"matching_parties": [{"party_attributes": {"Liczd9wY": {}, "2CFXs08e": {}, "NOT6Ok0Q": {}}, "party_id": "QbQ4SXm3", "party_members": [{"user_id": "f8I27V3o"}, {"user_id": "xTtifVz0"}, {"user_id": "OTkWvhmS"}]}, {"party_attributes": {"wCK0ypfD": {}, "z6wmDq25": {}, "h5lI9dXL": {}}, "party_id": "3NiHP4kc", "party_members": [{"user_id": "04jhdySW"}, {"user_id": "FzZor2MU"}, {"user_id": "4byKLm1s"}]}, {"party_attributes": {"GmPryTte": {}, "wYrolzMu": {}, "Y7M2HiZC": {}}, "party_id": "hB1w2QxK", "party_members": [{"user_id": "5r91Ep7i"}, {"user_id": "12VhhARr"}, {"user_id": "bqjdgwuF"}]}]}, {"matching_parties": [{"party_attributes": {"eGWW9utk": {}, "sb2brXzn": {}, "KfTaFzhj": {}}, "party_id": "Rtz5jCl1", "party_members": [{"user_id": "cjaHjaDM"}, {"user_id": "KUHLroA7"}, {"user_id": "uUmOmS3Z"}]}, {"party_attributes": {"Bwt2XgEt": {}, "1w0gT5SB": {}, "aMi3qDGG": {}}, "party_id": "WFlzV8AD", "party_members": [{"user_id": "hSs23Xed"}, {"user_id": "B7Sg69XP"}, {"user_id": "WVt1rSK3"}]}, {"party_attributes": {"Ox3SLvMV": {}, "mpU9FeIE": {}, "n095RoX3": {}}, "party_id": "T7Ju0WTl", "party_members": [{"user_id": "L7H69lbh"}, {"user_id": "7lk3Me0O"}, {"user_id": "FE0Q1LHV"}]}]}], "namespace": "X7xkzAMc", "notification_payload": {}, "pod_name": "xllW6slV", "region": "yRfnCt9a", "session_id": "icMrdzXa"}' \
    > test.out 2>&1
eval_tap $? 82 'CreateSession' test.out

#- 83 ClaimServer
./ng net.accelbyte.sdk.cli.Main dsmc claimServer \
    --namespace "$AB_NAMESPACE" \
    --body '{"game_mode": "HNEsUDvA", "matching_allies": [{"matching_parties": [{"party_attributes": {"aKZaplyq": {}, "su60EFmX": {}, "pdtjl2Xf": {}}, "party_id": "5kiMLlO2", "party_members": [{"user_id": "b7OhQ2ue"}, {"user_id": "iIZ0Vktt"}, {"user_id": "FTguvrF2"}]}, {"party_attributes": {"aB7xnmGJ": {}, "SonV9nmR": {}, "OAqDK9AQ": {}}, "party_id": "Oc56jXto", "party_members": [{"user_id": "iEmeb5ic"}, {"user_id": "JROgLXSS"}, {"user_id": "BqUk2ftd"}]}, {"party_attributes": {"Ot1ShjGV": {}, "nryMCAH0": {}, "y4qFBqqA": {}}, "party_id": "WXi2Uyjo", "party_members": [{"user_id": "Lh5ranct"}, {"user_id": "HsMhkStA"}, {"user_id": "yG3RjM26"}]}]}, {"matching_parties": [{"party_attributes": {"DE4idGkj": {}, "hrYkNKRR": {}, "eDIP3nEL": {}}, "party_id": "IQ7dyyxV", "party_members": [{"user_id": "RiAwB7RB"}, {"user_id": "x2dxc3Ss"}, {"user_id": "f7r1pW8B"}]}, {"party_attributes": {"ptzkvRNs": {}, "nXsFKt0E": {}, "TLc2efw2": {}}, "party_id": "aGYBxvH5", "party_members": [{"user_id": "rARrPZoc"}, {"user_id": "gpxZzipL"}, {"user_id": "hYam5VsH"}]}, {"party_attributes": {"6s6dyuGj": {}, "fjJIc3Sj": {}, "TGkun2l8": {}}, "party_id": "lMUkzmzM", "party_members": [{"user_id": "cWL33l8c"}, {"user_id": "95DYuOgN"}, {"user_id": "inklL1dB"}]}]}, {"matching_parties": [{"party_attributes": {"sgO59ZYX": {}, "WvA42w8d": {}, "jRIzn018": {}}, "party_id": "4VGHXPrG", "party_members": [{"user_id": "yVy2bQkZ"}, {"user_id": "9sE6h4LO"}, {"user_id": "6IPqCm2U"}]}, {"party_attributes": {"6F16Rfpn": {}, "3ohHK2zu": {}, "MlDcc04i": {}}, "party_id": "9jnVCqn8", "party_members": [{"user_id": "sc45mttu"}, {"user_id": "VsUcr1EO"}, {"user_id": "plrzcSCv"}]}, {"party_attributes": {"379xIFVM": {}, "7hEopilR": {}, "7To1bP7s": {}}, "party_id": "KFXKFbSO", "party_members": [{"user_id": "36YuYxbi"}, {"user_id": "mQzqkEqY"}, {"user_id": "uulr9WrC"}]}]}], "namespace": "QpKPbS7P", "notification_payload": {}, "session_id": "SZpTqkh0"}' \
    > test.out 2>&1
eval_tap $? 83 'ClaimServer' test.out

#- 84 GetSession
./ng net.accelbyte.sdk.cli.Main dsmc getSession \
    --namespace "$AB_NAMESPACE" \
    --sessionID 'D4xHcvTZ' \
    > test.out 2>&1
eval_tap $? 84 'GetSession' test.out

#- 85 CancelSession
./ng net.accelbyte.sdk.cli.Main dsmc cancelSession \
    --namespace "$AB_NAMESPACE" \
    --sessionID '8CK6okrL' \
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
    --region 'h4Sxo0YN' \
    > test.out 2>&1
eval_tap $? 88 'ListProvidersByRegion' test.out

#- 89 PublicGetMessages
./ng net.accelbyte.sdk.cli.Main dsmc publicGetMessages \
    > test.out 2>&1
eval_tap $? 89 'PublicGetMessages' test.out


rm -f "tmp.dat"

exit $EXIT_CODE