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
    --body '{"artifactPath": "Xuwb5GUd", "coreDumpEnabled": true, "image": "oxjYy4NH", "imageReplicationsMap": {"8TUP2Va8": {"failure_code": "BcNTXF8p", "region": "U4VgAfpd", "status": "qce4LbHD", "uri": "RK31Oi49"}, "ysRGvTOj": {"failure_code": "GVNp9HfF", "region": "adi3QNAy", "status": "O7t29SP7", "uri": "zAsrW0Si"}, "SY8PgA5c": {"failure_code": "c7Lnm0Ys", "region": "4fEnvV5Y", "status": "GMYTxn3u", "uri": "tTd2rbx2"}}, "namespace": "8DL4fz5V", "patchVersion": "J3Tlr2VJ", "persistent": true, "version": "tWTdDse3"}' \
    > test.out 2>&1
eval_tap $? 4 'UpdateImage' test.out

#- 5 CreateImage
./ng net.accelbyte.sdk.cli.Main dsmc createImage \
    --body '{"artifactPath": "p3XhiJ9h", "coreDumpEnabled": true, "dockerPath": "yTIE3kUf", "image": "XSpH1TI6", "imageSize": 34, "namespace": "YNXATGlr", "persistent": true, "ulimitFileSize": 37, "version": "bIZbaWhI"}' \
    > test.out 2>&1
eval_tap $? 5 'CreateImage' test.out

#- 6 ImportImages
./ng net.accelbyte.sdk.cli.Main dsmc importImages \
    --file 'tmp.dat' \
    > test.out 2>&1
eval_tap $? 6 'ImportImages' test.out

#- 7 CreateImagePatch
./ng net.accelbyte.sdk.cli.Main dsmc createImagePatch \
    --body '{"artifactPath": "dDOdzq36", "coreDumpEnabled": true, "dockerPath": "HT9QvREt", "image": "ankNH1a5", "imageSize": 11, "namespace": "1kfndWID", "patchVersion": "jFgKGg21", "persistent": false, "ulimitFileSize": 80, "uploaderFlag": "TtNglqBn", "version": "kOInnnbp"}' \
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
    --body '{"claim_timeout": 84, "creation_timeout": 75, "default_version": "6mxn6f1V", "port": 26, "ports": {"X2pTlbne": 75, "0tU15Ixs": 73, "Jp3xIlwE": 24}, "protocol": "h0iOQeNP", "providers": ["ZM6CG25x", "KfLSegYt", "tFVEVhoL"], "session_timeout": 48, "unreachable_timeout": 60}' \
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
    --body '{"claim_timeout": 97, "creation_timeout": 17, "default_version": "QGpqWMn4", "port": 93, "protocol": "e7qwMQui", "providers": ["4O1zylHC", "uGRqhbp7", "tFfUZzrV"], "session_timeout": 83, "unreachable_timeout": 56}' \
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
    --name 'r41LjhCE' \
    --count '51' \
    --offset '21' \
    > test.out 2>&1
eval_tap $? 14 'GetAllDeployment' test.out

#- 15 GetDeployment
./ng net.accelbyte.sdk.cli.Main dsmc getDeployment \
    --deployment 'nw2pMRjl' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 15 'GetDeployment' test.out

#- 16 CreateDeployment
./ng net.accelbyte.sdk.cli.Main dsmc createDeployment \
    --deployment 'xNrrLtVD' \
    --namespace "$AB_NAMESPACE" \
    --body '{"allow_version_override": true, "buffer_count": 93, "buffer_percent": 67, "configuration": "LxBNGfgN", "enable_region_overrides": false, "extendable_session": true, "game_version": "N8vBMtSt", "max_count": 86, "min_count": 68, "overrides": {"hYFIaIk1": {"buffer_count": 80, "buffer_percent": 31, "configuration": "BTQQMZpn", "enable_region_overrides": false, "extendable_session": true, "game_version": "yQUUuZJt", "max_count": 80, "min_count": 88, "name": "EPK8TsRp", "region_overrides": {"qu7th2VP": {"buffer_count": 14, "buffer_percent": 69, "max_count": 62, "min_count": 64, "name": "4Zzgc5F9", "unlimited": true, "use_buffer_percent": true}, "nfoELlfC": {"buffer_count": 72, "buffer_percent": 39, "max_count": 70, "min_count": 10, "name": "XmqIedf9", "unlimited": true, "use_buffer_percent": false}, "FXG2ftNw": {"buffer_count": 47, "buffer_percent": 51, "max_count": 3, "min_count": 47, "name": "jS7Uh4jr", "unlimited": false, "use_buffer_percent": false}}, "regions": ["eNvIviTO", "IfWfw8kQ", "IPQCeVrk"], "session_timeout": 58, "unlimited": false, "use_buffer_percent": false}, "rL18NTdr": {"buffer_count": 4, "buffer_percent": 1, "configuration": "9ESxTFfS", "enable_region_overrides": false, "extendable_session": false, "game_version": "7WP7IwiW", "max_count": 57, "min_count": 74, "name": "M4AGfaAo", "region_overrides": {"4mNmy7Tg": {"buffer_count": 64, "buffer_percent": 15, "max_count": 49, "min_count": 72, "name": "nJKb8pfX", "unlimited": true, "use_buffer_percent": false}, "aho4QvJE": {"buffer_count": 92, "buffer_percent": 81, "max_count": 72, "min_count": 15, "name": "IEhCIJwQ", "unlimited": true, "use_buffer_percent": true}, "7oat0xkb": {"buffer_count": 50, "buffer_percent": 91, "max_count": 6, "min_count": 47, "name": "Xs9rta1e", "unlimited": false, "use_buffer_percent": true}}, "regions": ["2qhXGUT9", "moeduuQ0", "Sq7JH9wY"], "session_timeout": 17, "unlimited": false, "use_buffer_percent": false}, "DsPPiyTl": {"buffer_count": 47, "buffer_percent": 60, "configuration": "uQLdzKGC", "enable_region_overrides": false, "extendable_session": true, "game_version": "ZAO9QukN", "max_count": 52, "min_count": 24, "name": "Dfruo0fe", "region_overrides": {"ZpunvUZg": {"buffer_count": 56, "buffer_percent": 63, "max_count": 10, "min_count": 99, "name": "ax8XPHPD", "unlimited": true, "use_buffer_percent": false}, "p7kbSLtv": {"buffer_count": 92, "buffer_percent": 39, "max_count": 20, "min_count": 24, "name": "kYzKuNJY", "unlimited": false, "use_buffer_percent": false}, "pBeXN9h7": {"buffer_count": 29, "buffer_percent": 75, "max_count": 83, "min_count": 87, "name": "R1yRTCXk", "unlimited": false, "use_buffer_percent": true}}, "regions": ["11PMU3qu", "Tu1YiYYf", "MKft8w1S"], "session_timeout": 27, "unlimited": true, "use_buffer_percent": true}}, "region_overrides": {"PFD2OtaW": {"buffer_count": 83, "buffer_percent": 48, "max_count": 11, "min_count": 24, "name": "yxUrSbQn", "unlimited": true, "use_buffer_percent": false}, "HXrlqdgJ": {"buffer_count": 10, "buffer_percent": 69, "max_count": 72, "min_count": 28, "name": "irqH3kIN", "unlimited": false, "use_buffer_percent": true}, "K97piXnr": {"buffer_count": 76, "buffer_percent": 69, "max_count": 74, "min_count": 97, "name": "3V5Tfxlt", "unlimited": true, "use_buffer_percent": true}}, "regions": ["acZoGRYf", "kukFFSr9", "yv2eHOr3"], "session_timeout": 58, "unlimited": true, "use_buffer_percent": true}' \
    > test.out 2>&1
eval_tap $? 16 'CreateDeployment' test.out

#- 17 DeleteDeployment
./ng net.accelbyte.sdk.cli.Main dsmc deleteDeployment \
    --deployment 'kelDGy1P' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 17 'DeleteDeployment' test.out

#- 18 UpdateDeployment
./ng net.accelbyte.sdk.cli.Main dsmc updateDeployment \
    --deployment 'HG2uD3bW' \
    --namespace "$AB_NAMESPACE" \
    --body '{"allow_version_override": true, "buffer_count": 65, "buffer_percent": 23, "configuration": "ZZ0qXzF4", "enable_region_overrides": false, "extendable_session": false, "game_version": "qhP9OXPn", "max_count": 48, "min_count": 63, "regions": ["qX431wCp", "2B1Ajp3w", "kgSv1Aa5"], "session_timeout": 12, "unlimited": true, "use_buffer_percent": false}' \
    > test.out 2>&1
eval_tap $? 18 'UpdateDeployment' test.out

#- 19 CreateRootRegionOverride
./ng net.accelbyte.sdk.cli.Main dsmc createRootRegionOverride \
    --deployment 'jwtF0otw' \
    --namespace "$AB_NAMESPACE" \
    --region 'STasYPI4' \
    --body '{"buffer_count": 83, "buffer_percent": 34, "max_count": 15, "min_count": 47, "unlimited": true, "use_buffer_percent": false}' \
    > test.out 2>&1
eval_tap $? 19 'CreateRootRegionOverride' test.out

#- 20 DeleteRootRegionOverride
./ng net.accelbyte.sdk.cli.Main dsmc deleteRootRegionOverride \
    --deployment 'xMi3rWRZ' \
    --namespace "$AB_NAMESPACE" \
    --region '09GhuRRe' \
    > test.out 2>&1
eval_tap $? 20 'DeleteRootRegionOverride' test.out

#- 21 UpdateRootRegionOverride
./ng net.accelbyte.sdk.cli.Main dsmc updateRootRegionOverride \
    --deployment '9jJuQGsl' \
    --namespace "$AB_NAMESPACE" \
    --region 'O49IXgKD' \
    --body '{"buffer_count": 77, "buffer_percent": 97, "max_count": 60, "min_count": 11, "unlimited": true, "use_buffer_percent": false}' \
    > test.out 2>&1
eval_tap $? 21 'UpdateRootRegionOverride' test.out

#- 22 CreateDeploymentOverride
./ng net.accelbyte.sdk.cli.Main dsmc createDeploymentOverride \
    --deployment 'c0us3j7N' \
    --namespace "$AB_NAMESPACE" \
    --version 'J845UOFd' \
    --body '{"buffer_count": 70, "buffer_percent": 66, "configuration": "bVoM3W5d", "enable_region_overrides": false, "extendable_session": true, "game_version": "cPRR6g0L", "max_count": 5, "min_count": 32, "region_overrides": {"lECIUSUv": {"buffer_count": 4, "buffer_percent": 9, "max_count": 72, "min_count": 82, "name": "2llgQaka", "unlimited": true, "use_buffer_percent": false}, "DnZtXHQr": {"buffer_count": 28, "buffer_percent": 95, "max_count": 99, "min_count": 48, "name": "cEJQsgQs", "unlimited": true, "use_buffer_percent": false}, "74yzQsXS": {"buffer_count": 16, "buffer_percent": 96, "max_count": 11, "min_count": 96, "name": "g3uueh5w", "unlimited": true, "use_buffer_percent": true}}, "regions": ["7AaDTGUl", "htu36eUS", "khQVrwjN"], "session_timeout": 0, "unlimited": true, "use_buffer_percent": true}' \
    > test.out 2>&1
eval_tap $? 22 'CreateDeploymentOverride' test.out

#- 23 DeleteDeploymentOverride
./ng net.accelbyte.sdk.cli.Main dsmc deleteDeploymentOverride \
    --deployment '6beR5uu8' \
    --namespace "$AB_NAMESPACE" \
    --version 'kUUB76IU' \
    > test.out 2>&1
eval_tap $? 23 'DeleteDeploymentOverride' test.out

#- 24 UpdateDeploymentOverride
./ng net.accelbyte.sdk.cli.Main dsmc updateDeploymentOverride \
    --deployment 'R51HiqAx' \
    --namespace "$AB_NAMESPACE" \
    --version 'jNMff3WS' \
    --body '{"buffer_count": 79, "buffer_percent": 47, "configuration": "TI17RTKx", "enable_region_overrides": true, "game_version": "uPXQsyiV", "max_count": 1, "min_count": 7, "regions": ["Ik6uoNPA", "AjLfzVzt", "Qua6YONF"], "session_timeout": 45, "unlimited": false, "use_buffer_percent": false}' \
    > test.out 2>&1
eval_tap $? 24 'UpdateDeploymentOverride' test.out

#- 25 CreateOverrideRegionOverride
./ng net.accelbyte.sdk.cli.Main dsmc createOverrideRegionOverride \
    --deployment 'DquWeEiO' \
    --namespace "$AB_NAMESPACE" \
    --region 'me2NeyyG' \
    --version 'Qv56J3Iy' \
    --body '{"buffer_count": 40, "buffer_percent": 53, "max_count": 24, "min_count": 85, "unlimited": true, "use_buffer_percent": true}' \
    > test.out 2>&1
eval_tap $? 25 'CreateOverrideRegionOverride' test.out

#- 26 DeleteOverrideRegionOverride
./ng net.accelbyte.sdk.cli.Main dsmc deleteOverrideRegionOverride \
    --deployment 'JVe4Xi3D' \
    --namespace "$AB_NAMESPACE" \
    --region 'L5icP1Vr' \
    --version 'iIZibO6k' \
    > test.out 2>&1
eval_tap $? 26 'DeleteOverrideRegionOverride' test.out

#- 27 UpdateOverrideRegionOverride
./ng net.accelbyte.sdk.cli.Main dsmc updateOverrideRegionOverride \
    --deployment 'MYsOJbie' \
    --namespace "$AB_NAMESPACE" \
    --region 'nvxFIa8r' \
    --version 'Y6BL6FeB' \
    --body '{"buffer_count": 75, "buffer_percent": 93, "max_count": 59, "min_count": 24, "unlimited": false, "use_buffer_percent": true}' \
    > test.out 2>&1
eval_tap $? 27 'UpdateOverrideRegionOverride' test.out

#- 28 GetAllPodConfig
./ng net.accelbyte.sdk.cli.Main dsmc getAllPodConfig \
    --namespace "$AB_NAMESPACE" \
    --count '83' \
    --offset '4' \
    > test.out 2>&1
eval_tap $? 28 'GetAllPodConfig' test.out

#- 29 GetPodConfig
./ng net.accelbyte.sdk.cli.Main dsmc getPodConfig \
    --name 'U4eBQTYQ' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 29 'GetPodConfig' test.out

#- 30 CreatePodConfig
./ng net.accelbyte.sdk.cli.Main dsmc createPodConfig \
    --name '1b2MKlcq' \
    --namespace "$AB_NAMESPACE" \
    --body '{"cpu_limit": 84, "mem_limit": 2, "params": "Apc8t0u7"}' \
    > test.out 2>&1
eval_tap $? 30 'CreatePodConfig' test.out

#- 31 DeletePodConfig
./ng net.accelbyte.sdk.cli.Main dsmc deletePodConfig \
    --name '44r6oN7T' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 31 'DeletePodConfig' test.out

#- 32 UpdatePodConfig
./ng net.accelbyte.sdk.cli.Main dsmc updatePodConfig \
    --name 'zHsKVbvb' \
    --namespace "$AB_NAMESPACE" \
    --body '{"cpu_limit": 10, "mem_limit": 7, "name": "Mzl1SubN", "params": "VR9LIoZb"}' \
    > test.out 2>&1
eval_tap $? 32 'UpdatePodConfig' test.out

#- 33 AddPort
./ng net.accelbyte.sdk.cli.Main dsmc addPort \
    --name 'y2ledxKD' \
    --namespace "$AB_NAMESPACE" \
    --body '{"port": 69}' \
    > test.out 2>&1
eval_tap $? 33 'AddPort' test.out

#- 34 DeletePort
./ng net.accelbyte.sdk.cli.Main dsmc deletePort \
    --name 'JXx2Uopo' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 34 'DeletePort' test.out

#- 35 UpdatePort
./ng net.accelbyte.sdk.cli.Main dsmc updatePort \
    --name 'MhrBugMc' \
    --namespace "$AB_NAMESPACE" \
    --body '{"name": "bJEK6Vx2", "port": 67}' \
    > test.out 2>&1
eval_tap $? 35 'UpdatePort' test.out

#- 36 ListImages
./ng net.accelbyte.sdk.cli.Main dsmc listImages \
    --namespace "$AB_NAMESPACE" \
    --q '6jT3J5kE' \
    --sortBy 'createdAt' \
    --sortDirection 'asc' \
    --count '13' \
    --offset '96' \
    > test.out 2>&1
eval_tap $? 36 'ListImages' test.out

#- 37 DeleteImage
./ng net.accelbyte.sdk.cli.Main dsmc deleteImage \
    --namespace "$AB_NAMESPACE" \
    --imageURI '2G7BtpKV' \
    --version 's6nVRUvH' \
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
    --imageURI 'itjWTuB6' \
    --version 'TWTY5BVH' \
    --versionPatch 'M7qyDsLw' \
    > test.out 2>&1
eval_tap $? 40 'DeleteImagePatch' test.out

#- 41 GetImageDetail
./ng net.accelbyte.sdk.cli.Main dsmc getImageDetail \
    --namespace "$AB_NAMESPACE" \
    --version 'Slh4VCDc' \
    > test.out 2>&1
eval_tap $? 41 'GetImageDetail' test.out

#- 42 GetImagePatches
./ng net.accelbyte.sdk.cli.Main dsmc getImagePatches \
    --namespace "$AB_NAMESPACE" \
    --version '0VNCobTE' \
    > test.out 2>&1
eval_tap $? 42 'GetImagePatches' test.out

#- 43 GetImagePatchDetail
./ng net.accelbyte.sdk.cli.Main dsmc getImagePatchDetail \
    --namespace "$AB_NAMESPACE" \
    --version 'Wf4JukLr' \
    --versionPatch '6gJtddiG' \
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
    --region 'K3EgJTS2' \
    --count '27' \
    --offset '87' \
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
    --region 'lPRHWlEx' \
    > test.out 2>&1
eval_tap $? 47 'CountServerDetailed' test.out

#- 48 ListLocalServer
./ng net.accelbyte.sdk.cli.Main dsmc listLocalServer \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 48 'ListLocalServer' test.out

#- 49 DeleteLocalServer
./ng net.accelbyte.sdk.cli.Main dsmc deleteLocalServer \
    --name 'rhKOqDgc' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 49 'DeleteLocalServer' test.out

#- 50 GetServer
./ng net.accelbyte.sdk.cli.Main dsmc getServer \
    --namespace "$AB_NAMESPACE" \
    --podName 'rg8XOYrD' \
    > test.out 2>&1
eval_tap $? 50 'GetServer' test.out

#- 51 DeleteServer
./ng net.accelbyte.sdk.cli.Main dsmc deleteServer \
    --namespace "$AB_NAMESPACE" \
    --podName 'YE84TKQy' \
    > test.out 2>&1
eval_tap $? 51 'DeleteServer' test.out

#- 52 ListSession
./ng net.accelbyte.sdk.cli.Main dsmc listSession \
    --namespace "$AB_NAMESPACE" \
    --region 'zA1sjFXj' \
    --withServer  \
    --count '67' \
    --offset '97' \
    > test.out 2>&1
eval_tap $? 52 'ListSession' test.out

#- 53 CountSession
./ng net.accelbyte.sdk.cli.Main dsmc countSession \
    --namespace "$AB_NAMESPACE" \
    --region 'zyNBB0nt' \
    > test.out 2>&1
eval_tap $? 53 'CountSession' test.out

#- 54 DeleteSession
./ng net.accelbyte.sdk.cli.Main dsmc deleteSession \
    --namespace "$AB_NAMESPACE" \
    --sessionID 'j7viYOdt' \
    > test.out 2>&1
eval_tap $? 54 'DeleteSession' test.out

#- 55 CreateRepository
./ng net.accelbyte.sdk.cli.Main dsmc createRepository \
    --body '{"namespace": "WqGm8Tm0", "repository": "hBmkE8iD"}' \
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
    --name 'dDAa2utg' \
    --count '5' \
    --offset '4' \
    > test.out 2>&1
eval_tap $? 58 'GetAllDeploymentClient' test.out

#- 59 CreateDeploymentClient
./ng net.accelbyte.sdk.cli.Main dsmc createDeploymentClient \
    --deployment 'em4lgQmW' \
    --namespace "$AB_NAMESPACE" \
    --body '{"allow_version_override": true, "buffer_count": 86, "buffer_percent": 40, "configuration": "hraGNnI2", "enable_region_overrides": true, "extendable_session": true, "game_version": "tpAtDAWL", "max_count": 50, "min_count": 89, "overrides": {"6Wudk9HA": {"buffer_count": 15, "buffer_percent": 49, "configuration": "LZHvtnr8", "enable_region_overrides": true, "extendable_session": true, "game_version": "UYfDMIMM", "max_count": 21, "min_count": 17, "name": "GnynhcK6", "region_overrides": {"sdtyLTDL": {"buffer_count": 72, "buffer_percent": 13, "max_count": 3, "min_count": 73, "name": "UGV19evT", "unlimited": true, "use_buffer_percent": false}, "VyidJKBf": {"buffer_count": 83, "buffer_percent": 48, "max_count": 88, "min_count": 93, "name": "Pkcnw5sq", "unlimited": true, "use_buffer_percent": true}, "GHBcQdOE": {"buffer_count": 89, "buffer_percent": 59, "max_count": 61, "min_count": 62, "name": "ADuTik74", "unlimited": false, "use_buffer_percent": true}}, "regions": ["gpNRp5fS", "vadoYufW", "s36wPE70"], "session_timeout": 78, "unlimited": false, "use_buffer_percent": true}, "wclcV3D0": {"buffer_count": 40, "buffer_percent": 69, "configuration": "HW6uHCKw", "enable_region_overrides": false, "extendable_session": false, "game_version": "xnUkvKTQ", "max_count": 26, "min_count": 92, "name": "9p9k9ieA", "region_overrides": {"I5gSFa4C": {"buffer_count": 62, "buffer_percent": 92, "max_count": 64, "min_count": 22, "name": "xcC2AdNq", "unlimited": false, "use_buffer_percent": false}, "TZmXmv1t": {"buffer_count": 18, "buffer_percent": 8, "max_count": 27, "min_count": 56, "name": "xaShapyg", "unlimited": false, "use_buffer_percent": false}, "hi9h8OpI": {"buffer_count": 85, "buffer_percent": 5, "max_count": 36, "min_count": 93, "name": "VQb4RQkD", "unlimited": false, "use_buffer_percent": true}}, "regions": ["LAEbLBz1", "eiSDUzEF", "XMGDW5SQ"], "session_timeout": 32, "unlimited": false, "use_buffer_percent": false}, "1HlQ74Yx": {"buffer_count": 97, "buffer_percent": 19, "configuration": "y4PtaltU", "enable_region_overrides": true, "extendable_session": false, "game_version": "hSISB1EZ", "max_count": 76, "min_count": 85, "name": "5VVRIlgy", "region_overrides": {"WqZD1Pm1": {"buffer_count": 24, "buffer_percent": 80, "max_count": 94, "min_count": 55, "name": "vvuLp9HJ", "unlimited": true, "use_buffer_percent": true}, "awGMBbsk": {"buffer_count": 16, "buffer_percent": 17, "max_count": 50, "min_count": 65, "name": "o0rBTgXK", "unlimited": true, "use_buffer_percent": true}, "0BZN5udT": {"buffer_count": 65, "buffer_percent": 39, "max_count": 25, "min_count": 65, "name": "yq30BWaF", "unlimited": false, "use_buffer_percent": true}}, "regions": ["bGbPHy4g", "Qn1lLY2R", "GbGYNm5L"], "session_timeout": 14, "unlimited": false, "use_buffer_percent": true}}, "region_overrides": {"WGnnTKXi": {"buffer_count": 20, "buffer_percent": 56, "max_count": 17, "min_count": 7, "name": "9Yi9uIxA", "unlimited": true, "use_buffer_percent": true}, "hLB1NaJn": {"buffer_count": 73, "buffer_percent": 23, "max_count": 19, "min_count": 66, "name": "hAeRIP67", "unlimited": true, "use_buffer_percent": true}, "lFnabVPM": {"buffer_count": 14, "buffer_percent": 84, "max_count": 76, "min_count": 100, "name": "xUuOLNfN", "unlimited": true, "use_buffer_percent": true}}, "regions": ["5hZvvBc7", "z9ZutesN", "kAKJrSrV"], "session_timeout": 88, "unlimited": false, "use_buffer_percent": false}' \
    > test.out 2>&1
eval_tap $? 59 'CreateDeploymentClient' test.out

#- 60 DeleteDeploymentClient
./ng net.accelbyte.sdk.cli.Main dsmc deleteDeploymentClient \
    --deployment 'mBVv6lQl' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 60 'DeleteDeploymentClient' test.out

#- 61 GetAllPodConfigClient
./ng net.accelbyte.sdk.cli.Main dsmc getAllPodConfigClient \
    --namespace "$AB_NAMESPACE" \
    --count '76' \
    --offset '13' \
    > test.out 2>&1
eval_tap $? 61 'GetAllPodConfigClient' test.out

#- 62 CreatePodConfigClient
./ng net.accelbyte.sdk.cli.Main dsmc createPodConfigClient \
    --name 'Q2KBwpj9' \
    --namespace "$AB_NAMESPACE" \
    --body '{"cpu_limit": 74, "mem_limit": 40, "params": "TbdzAu7n"}' \
    > test.out 2>&1
eval_tap $? 62 'CreatePodConfigClient' test.out

#- 63 DeletePodConfigClient
./ng net.accelbyte.sdk.cli.Main dsmc deletePodConfigClient \
    --name 'bdeRJZWJ' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 63 'DeletePodConfigClient' test.out

#- 64 ListImagesClient
./ng net.accelbyte.sdk.cli.Main dsmc listImagesClient \
    --namespace "$AB_NAMESPACE" \
    --count '58' \
    --offset '62' \
    --q '8oyfHoXd' \
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
    --version '80MSq71K' \
    > test.out 2>&1
eval_tap $? 66 'ImageDetailClient' test.out

#- 67 ListServerClient
./ng net.accelbyte.sdk.cli.Main dsmc listServerClient \
    --namespace "$AB_NAMESPACE" \
    --region 'kxw60qzs' \
    --count '62' \
    --offset '59' \
    > test.out 2>&1
eval_tap $? 67 'ListServerClient' test.out

#- 68 ServerHeartbeat
./ng net.accelbyte.sdk.cli.Main dsmc serverHeartbeat \
    --namespace "$AB_NAMESPACE" \
    --body '{"podName": "CwWZhHPI"}' \
    > test.out 2>&1
eval_tap $? 68 'ServerHeartbeat' test.out

#- 69 DeregisterLocalServer
./ng net.accelbyte.sdk.cli.Main dsmc deregisterLocalServer \
    --namespace "$AB_NAMESPACE" \
    --body '{"name": "oDIQJofb"}' \
    > test.out 2>&1
eval_tap $? 69 'DeregisterLocalServer' test.out

#- 70 RegisterLocalServer
./ng net.accelbyte.sdk.cli.Main dsmc registerLocalServer \
    --namespace "$AB_NAMESPACE" \
    --body '{"custom_attribute": "S4uGzZBm", "ip": "WWxgrwyq", "name": "bxYk8ruu", "port": 85}' \
    > test.out 2>&1
eval_tap $? 70 'RegisterLocalServer' test.out

#- 71 RegisterServer
./ng net.accelbyte.sdk.cli.Main dsmc registerServer \
    --namespace "$AB_NAMESPACE" \
    --body '{"custom_attribute": "wtvYN0ee", "pod_name": "Ln6Q5PqM"}' \
    > test.out 2>&1
eval_tap $? 71 'RegisterServer' test.out

#- 72 ShutdownServer
./ng net.accelbyte.sdk.cli.Main dsmc shutdownServer \
    --namespace "$AB_NAMESPACE" \
    --body '{"kill_me": false, "pod_name": "nc1YdIDU"}' \
    > test.out 2>&1
eval_tap $? 72 'ShutdownServer' test.out

#- 73 GetServerSessionTimeout
./ng net.accelbyte.sdk.cli.Main dsmc getServerSessionTimeout \
    --namespace "$AB_NAMESPACE" \
    --podName 'dwAeJoKI' \
    > test.out 2>&1
eval_tap $? 73 'GetServerSessionTimeout' test.out

#- 74 GetServerSession
./ng net.accelbyte.sdk.cli.Main dsmc getServerSession \
    --namespace "$AB_NAMESPACE" \
    --podName 'xn9zM1Hk' \
    > test.out 2>&1
eval_tap $? 74 'GetServerSession' test.out

#- 75 CreateSession
./ng net.accelbyte.sdk.cli.Main dsmc createSession \
    --namespace "$AB_NAMESPACE" \
    --body '{"client_version": "jpM8tG8Q", "configuration": "O6l2u90E", "deployment": "NGij9Did", "game_mode": "HpCJb5Dg", "matching_allies": [{"matching_parties": [{"party_attributes": {"de1k1Vv9": {}, "5bDSDxWH": {}, "F7XBZ7Xe": {}}, "party_id": "F5snmHjy", "party_members": [{"user_id": "rT2DD1W0"}, {"user_id": "PZ7GH1h3"}, {"user_id": "ACA3gooW"}]}, {"party_attributes": {"1aoAnRXV": {}, "TBmiRO6i": {}, "cQ5JB71T": {}}, "party_id": "Sl7SQBog", "party_members": [{"user_id": "HN2lHksC"}, {"user_id": "w5Y0YguU"}, {"user_id": "a2R68Y7K"}]}, {"party_attributes": {"nR4ZYuIp": {}, "TfcZv8ZB": {}, "PTDWUfZd": {}}, "party_id": "7snZx23V", "party_members": [{"user_id": "Lnj08pDy"}, {"user_id": "nyeeAUrc"}, {"user_id": "pwWkrmFz"}]}]}, {"matching_parties": [{"party_attributes": {"S9AbW5Lr": {}, "XvcXfeSx": {}, "WbZf0a15": {}}, "party_id": "JH5mc8OL", "party_members": [{"user_id": "lwc4rPhR"}, {"user_id": "R3Hbqvno"}, {"user_id": "bOMeLvgy"}]}, {"party_attributes": {"MRI77KPq": {}, "NgNHMaNN": {}, "U4dgKIba": {}}, "party_id": "SP8wffFV", "party_members": [{"user_id": "Yy6v60vd"}, {"user_id": "yyZupN2e"}, {"user_id": "b9kSF4Ta"}]}, {"party_attributes": {"9fgWRzeV": {}, "1N9Qoj9x": {}, "R3ZDrQGD": {}}, "party_id": "nfroTmcp", "party_members": [{"user_id": "jagSjt6S"}, {"user_id": "3rEtn3Df"}, {"user_id": "vmTEqyTc"}]}]}, {"matching_parties": [{"party_attributes": {"DhqDddDf": {}, "Q8io5AVZ": {}, "LYp1wHbP": {}}, "party_id": "Vuokub1r", "party_members": [{"user_id": "Yt0nmPnj"}, {"user_id": "QpC3OlNE"}, {"user_id": "5NGeO6bL"}]}, {"party_attributes": {"wuOgCcMU": {}, "36dArUnd": {}, "IXtTQ8Q9": {}}, "party_id": "enUkiskO", "party_members": [{"user_id": "Fvp8dl12"}, {"user_id": "jwxD8vNv"}, {"user_id": "J4jwhn0K"}]}, {"party_attributes": {"bgNtURH1": {}, "Aje7cvNR": {}, "BYZf5irQ": {}}, "party_id": "6BRZ2YsY", "party_members": [{"user_id": "sQm9UM5S"}, {"user_id": "3ON8dOO7"}, {"user_id": "q5P46Uyz"}]}]}], "namespace": "HrBAzi1l", "notification_payload": {}, "pod_name": "geMlxIWe", "region": "bCsxzLVT", "session_id": "gilEq9vN"}' \
    > test.out 2>&1
eval_tap $? 75 'CreateSession' test.out

#- 76 ClaimServer
./ng net.accelbyte.sdk.cli.Main dsmc claimServer \
    --namespace "$AB_NAMESPACE" \
    --body '{"session_id": "hpJoXauI"}' \
    > test.out 2>&1
eval_tap $? 76 'ClaimServer' test.out

#- 77 GetSession
./ng net.accelbyte.sdk.cli.Main dsmc getSession \
    --namespace "$AB_NAMESPACE" \
    --sessionID 'p5xP98EA' \
    > test.out 2>&1
eval_tap $? 77 'GetSession' test.out

#- 78 CancelSession
./ng net.accelbyte.sdk.cli.Main dsmc cancelSession \
    --namespace "$AB_NAMESPACE" \
    --sessionID '6OXXXhZk' \
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
    --region 'JabFbD8t' \
    > test.out 2>&1
eval_tap $? 81 'ListProvidersByRegion' test.out

#- 82 PublicGetMessages
./ng net.accelbyte.sdk.cli.Main dsmc publicGetMessages \
    > test.out 2>&1
eval_tap $? 82 'PublicGetMessages' test.out


rm -f "tmp.dat"

exit $EXIT_CODE