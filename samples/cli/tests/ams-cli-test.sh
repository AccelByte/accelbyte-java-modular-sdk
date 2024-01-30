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
echo "1..37"

#- 1 Login
./ng net.accelbyte.sdk.cli.Main loginClient \
    > test.out 2>&1
eval_tap $? 1 'Login' test.out

if [ $EXIT_CODE -ne 0 ]; then
  echo "Bail out! Login failed."
  exit $EXIT_CODE
fi

touch "tmp.dat"

#- 2 AuthCheck
./ng net.accelbyte.sdk.cli.Main ams authCheck \
    > test.out 2>&1
eval_tap $? 2 'AuthCheck' test.out

#- 3 PortalHealthCheck
./ng net.accelbyte.sdk.cli.Main ams portalHealthCheck \
    > test.out 2>&1
eval_tap $? 3 'PortalHealthCheck' test.out

#- 4 AdminAccountGet
./ng net.accelbyte.sdk.cli.Main ams adminAccountGet \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 4 'AdminAccountGet' test.out

#- 5 AdminAccountCreate
./ng net.accelbyte.sdk.cli.Main ams adminAccountCreate \
    --namespace "$AB_NAMESPACE" \
    --body '{"name": "oJJqo6l8"}' \
    > test.out 2>&1
eval_tap $? 5 'AdminAccountCreate' test.out

#- 6 AdminAccountLinkTokenGet
./ng net.accelbyte.sdk.cli.Main ams adminAccountLinkTokenGet \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 6 'AdminAccountLinkTokenGet' test.out

#- 7 AdminAccountLinkTokenPost
./ng net.accelbyte.sdk.cli.Main ams adminAccountLinkTokenPost \
    --namespace "$AB_NAMESPACE" \
    --body '{"token": "cGNihUVx"}' \
    > test.out 2>&1
eval_tap $? 7 'AdminAccountLinkTokenPost' test.out

#- 8 ArtifactGet
./ng net.accelbyte.sdk.cli.Main ams artifactGet \
    --namespace "$AB_NAMESPACE" \
    --artifactType 'T9hsjXpN' \
    --count '135' \
    --endDate 'hEvmrMYk' \
    --fleetID 'FLd6DB3O' \
    --imageID 'XFX7YUCK' \
    --maxSize '89' \
    --minSize '16' \
    --offset '7' \
    --region 'eoPlQFrN' \
    --serverId 'sIXG9W8z' \
    --startDate 'wDM0J5yv' \
    --status 'OJ7K8zny' \
    > test.out 2>&1
eval_tap $? 8 'ArtifactGet' test.out

#- 9 ArtifactUsageGet
./ng net.accelbyte.sdk.cli.Main ams artifactUsageGet \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 9 'ArtifactUsageGet' test.out

#- 10 ArtifactDelete
./ng net.accelbyte.sdk.cli.Main ams artifactDelete \
    --artifactID 'EQlYWaoD' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 10 'ArtifactDelete' test.out

#- 11 ArtifactGetURL
./ng net.accelbyte.sdk.cli.Main ams artifactGetURL \
    --artifactID 'inmmgcU6' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 11 'ArtifactGetURL' test.out

#- 12 FleetList
./ng net.accelbyte.sdk.cli.Main ams fleetList \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 12 'FleetList' test.out

#- 13 FleetCreate
./ng net.accelbyte.sdk.cli.Main ams fleetCreate \
    --namespace "$AB_NAMESPACE" \
    --body '{"active": false, "claimKeys": ["4Yu02RlE", "CPviCZAb", "FQeBYjev"], "dsHostConfiguration": {"instanceId": "k4hbtT7i", "instanceType": "hwBtx86h", "serversPerVm": 2}, "imageDeploymentProfile": {"commandLine": "LLzB4zeb", "imageId": "l589FeYa", "portConfigurations": [{"name": "CzHfmJL2", "protocol": "p4EQIvjN"}, {"name": "dGf3MhX3", "protocol": "ciW4DiOz"}, {"name": "vLPTSxdY", "protocol": "CLpMzO4L"}], "timeout": {"creation": 44, "drain": 83, "session": 20, "unresponsive": 0}}, "name": "a0cAt9On", "regions": [{"bufferSize": 73, "maxServerCount": 7, "minServerCount": 8, "region": "MtDwwde5"}, {"bufferSize": 96, "maxServerCount": 78, "minServerCount": 20, "region": "UJEYFwyO"}, {"bufferSize": 46, "maxServerCount": 60, "minServerCount": 1, "region": "KYHJeK5u"}], "samplingRules": {"coredumps": {"crashed": {"collect": false, "percentage": 47}, "success": {"collect": true, "percentage": 1}}, "logs": {"crashed": {"collect": false, "percentage": 3}, "success": {"collect": true, "percentage": 41}}}}' \
    > test.out 2>&1
eval_tap $? 13 'FleetCreate' test.out

#- 14 FleetGet
./ng net.accelbyte.sdk.cli.Main ams fleetGet \
    --fleetID 'wTZe7AQi' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 14 'FleetGet' test.out

#- 15 FleetUpdate
./ng net.accelbyte.sdk.cli.Main ams fleetUpdate \
    --fleetID 'FRwSQIHw' \
    --namespace "$AB_NAMESPACE" \
    --body '{"active": true, "claimKeys": ["FGUSSBDu", "5qVjGRuF", "4MLMRCyL"], "dsHostConfiguration": {"instanceId": "Ibx3Lvx1", "instanceType": "2yUUBw5K", "serversPerVm": 34}, "imageDeploymentProfile": {"commandLine": "RKjw7dT2", "imageId": "gPVRdaOU", "portConfigurations": [{"name": "bALtkrUX", "protocol": "sGlfkHwj"}, {"name": "eymJtqnh", "protocol": "hDnGgXJE"}, {"name": "oUz8oCiV", "protocol": "ftlvd9kZ"}], "timeout": {"creation": 72, "drain": 74, "session": 55, "unresponsive": 62}}, "name": "k1wWDPDi", "regions": [{"bufferSize": 5, "maxServerCount": 30, "minServerCount": 38, "region": "fsCWRRAd"}, {"bufferSize": 100, "maxServerCount": 12, "minServerCount": 30, "region": "8RjbnZMa"}, {"bufferSize": 73, "maxServerCount": 84, "minServerCount": 36, "region": "doJooipf"}], "samplingRules": {"coredumps": {"crashed": {"collect": true, "percentage": 85}, "success": {"collect": false, "percentage": 53}}, "logs": {"crashed": {"collect": false, "percentage": 99}, "success": {"collect": true, "percentage": 18}}}}' \
    > test.out 2>&1
eval_tap $? 15 'FleetUpdate' test.out

#- 16 FleetDelete
./ng net.accelbyte.sdk.cli.Main ams fleetDelete \
    --fleetID 'C6p6pkfy' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 16 'FleetDelete' test.out

#- 17 FleetArtifactSamplingRulesGet
./ng net.accelbyte.sdk.cli.Main ams fleetArtifactSamplingRulesGet \
    --fleetID 'hhyBrB37' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 17 'FleetArtifactSamplingRulesGet' test.out

#- 18 FleetArtifactSamplingRulesSet
./ng net.accelbyte.sdk.cli.Main ams fleetArtifactSamplingRulesSet \
    --fleetID 'NP7QVJ2H' \
    --namespace "$AB_NAMESPACE" \
    --body '{"coredumps": {"crashed": {"collect": false, "percentage": 44}, "success": {"collect": true, "percentage": 6}}, "logs": {"crashed": {"collect": true, "percentage": 72}, "success": {"collect": true, "percentage": 14}}}' \
    > test.out 2>&1
eval_tap $? 18 'FleetArtifactSamplingRulesSet' test.out

#- 19 FleetServers
./ng net.accelbyte.sdk.cli.Main ams fleetServers \
    --fleetID 'G5N3obCL' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 19 'FleetServers' test.out

#- 20 FleetServerHistory
./ng net.accelbyte.sdk.cli.Main ams fleetServerHistory \
    --fleetID 'r7i5RYNX' \
    --namespace "$AB_NAMESPACE" \
    --count '66' \
    --offset '73' \
    --reason 'D3Nb8AAq' \
    --region 'rqoFds0e' \
    --serverId 'I9IZnxWN' \
    --sortDirection '4g4NRWRR' \
    --status 'YaGVfykR' \
    > test.out 2>&1
eval_tap $? 20 'FleetServerHistory' test.out

#- 21 ImageList
./ng net.accelbyte.sdk.cli.Main ams imageList \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 21 'ImageList' test.out

#- 22 ImageGet
./ng net.accelbyte.sdk.cli.Main ams imageGet \
    --imageID 'YhOyP5jl' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 22 'ImageGet' test.out

#- 23 ImagePatch
./ng net.accelbyte.sdk.cli.Main ams imagePatch \
    --imageID 'B7jiiLPD' \
    --namespace "$AB_NAMESPACE" \
    --body '{"addedTags": ["JsLMThzL", "8fMZHls7", "ysEvHyFW"], "isProtected": false, "name": "BtCMqFOm", "removedTags": ["mzMszUWm", "KBXeCGxX", "yRmWBwQl"]}' \
    > test.out 2>&1
eval_tap $? 23 'ImagePatch' test.out

#- 24 QoSRegionsGet
./ng net.accelbyte.sdk.cli.Main ams qoSRegionsGet \
    --namespace "$AB_NAMESPACE" \
    --status 'y6ZxwrMe' \
    > test.out 2>&1
eval_tap $? 24 'QoSRegionsGet' test.out

#- 25 QoSRegionsUpdate
./ng net.accelbyte.sdk.cli.Main ams qoSRegionsUpdate \
    --namespace "$AB_NAMESPACE" \
    --region 'R5uJUgaC' \
    --body '{"status": "yAPkjMPU"}' \
    > test.out 2>&1
eval_tap $? 25 'QoSRegionsUpdate' test.out

#- 26 InfoRegions
./ng net.accelbyte.sdk.cli.Main ams infoRegions \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 26 'InfoRegions' test.out

#- 27 FleetServerInfo
./ng net.accelbyte.sdk.cli.Main ams fleetServerInfo \
    --namespace "$AB_NAMESPACE" \
    --serverID 'YA1ZLWvc' \
    > test.out 2>&1
eval_tap $? 27 'FleetServerInfo' test.out

#- 28 ServerHistory
./ng net.accelbyte.sdk.cli.Main ams serverHistory \
    --namespace "$AB_NAMESPACE" \
    --serverID 'bYO5ap8E' \
    > test.out 2>&1
eval_tap $? 28 'ServerHistory' test.out

#- 29 InfoSupportedInstances
./ng net.accelbyte.sdk.cli.Main ams infoSupportedInstances \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 29 'InfoSupportedInstances' test.out

#- 30 AccountGet
./ng net.accelbyte.sdk.cli.Main ams accountGet \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 30 'AccountGet' test.out

#- 31 FleetClaimByID
./ng net.accelbyte.sdk.cli.Main ams fleetClaimByID \
    --fleetID 'tfXdBUrC' \
    --namespace "$AB_NAMESPACE" \
    --body '{"region": "v1Gkshqx"}' \
    > test.out 2>&1
eval_tap $? 31 'FleetClaimByID' test.out

#- 32 LocalWatchdogConnect
./ng net.accelbyte.sdk.cli.Main ams localWatchdogConnect \
    --namespace "$AB_NAMESPACE" \
    --watchdogID 'i0zJ9tMz' \
    > test.out 2>&1
eval_tap $? 32 'LocalWatchdogConnect' test.out

#- 33 FleetClaimByKeys
./ng net.accelbyte.sdk.cli.Main ams fleetClaimByKeys \
    --namespace "$AB_NAMESPACE" \
    --body '{"claimKeys": ["LxCxW6as", "tftdC3U6", "EeemTdb7"], "regions": ["ekS6s17R", "CM4HtljJ", "JqzREbRK"]}' \
    > test.out 2>&1
eval_tap $? 33 'FleetClaimByKeys' test.out

#- 34 WatchdogConnect
./ng net.accelbyte.sdk.cli.Main ams watchdogConnect \
    --namespace "$AB_NAMESPACE" \
    --watchdogID 'NJiFb4Ep' \
    > test.out 2>&1
eval_tap $? 34 'WatchdogConnect' test.out

#- 35 UploadURLGet
./ng net.accelbyte.sdk.cli.Main ams uploadURLGet \
    > test.out 2>&1
eval_tap $? 35 'UploadURLGet' test.out

#- 36 Func1
./ng net.accelbyte.sdk.cli.Main ams func1 \
    > test.out 2>&1
eval_tap $? 36 'Func1' test.out

#- 37 BasicHealthCheck
./ng net.accelbyte.sdk.cli.Main ams basicHealthCheck \
    > test.out 2>&1
eval_tap $? 37 'BasicHealthCheck' test.out


rm -f "tmp.dat"

exit $EXIT_CODE