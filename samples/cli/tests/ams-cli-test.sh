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
    --body '{"name": "Be8GuUbB"}' \
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
    --body '{"token": "RDw0TLch"}' \
    > test.out 2>&1
eval_tap $? 7 'AdminAccountLinkTokenPost' test.out

#- 8 ArtifactGet
./ng net.accelbyte.sdk.cli.Main ams artifactGet \
    --namespace "$AB_NAMESPACE" \
    --artifactType 'ZYNo9OR6' \
    --count '135' \
    --endDate '2cy3l5FQ' \
    --fleetID 'TIJmQ56Q' \
    --imageID '27otJlKN' \
    --maxSize '77' \
    --minSize '78' \
    --offset '21' \
    --region '870zpVsl' \
    --serverId 'NACUUFDl' \
    --startDate '9WjV0uIX' \
    --status 'tfhi3S3x' \
    > test.out 2>&1
eval_tap $? 8 'ArtifactGet' test.out

#- 9 ArtifactUsageGet
./ng net.accelbyte.sdk.cli.Main ams artifactUsageGet \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 9 'ArtifactUsageGet' test.out

#- 10 ArtifactDelete
./ng net.accelbyte.sdk.cli.Main ams artifactDelete \
    --artifactID 'xv7DQ8bZ' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 10 'ArtifactDelete' test.out

#- 11 ArtifactGetURL
./ng net.accelbyte.sdk.cli.Main ams artifactGetURL \
    --artifactID 'irPUD2G0' \
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
    --body '{"active": true, "claimKeys": ["L21baieS", "RWDgfXQ8", "1wwm5v1o"], "dsHostConfiguration": {"instanceId": "wQ9rWDVj", "instanceType": "yMzDnzHj", "serversPerVm": 68}, "imageDeploymentProfile": {"commandLine": "8Whfv9gB", "imageId": "1HwjXveZ", "portConfigurations": [{"name": "xwnfVJoX", "protocol": "iQyOvRqS"}, {"name": "0cE6Fhlt", "protocol": "4VHxzjV2"}, {"name": "zoh39GA7", "protocol": "d7J10X1O"}], "timeout": {"creation": 33, "drain": 34, "session": 3, "unresponsive": 10}}, "name": "sjL3OhGh", "regions": [{"bufferSize": 1, "maxServerCount": 70, "minServerCount": 94, "region": "JB6b52dF"}, {"bufferSize": 14, "maxServerCount": 82, "minServerCount": 44, "region": "z3pZkZxD"}, {"bufferSize": 85, "maxServerCount": 29, "minServerCount": 84, "region": "lQHD5HtS"}], "samplingRules": {"coredumps": {"crashed": {"collect": true, "percentage": 61}, "success": {"collect": false, "percentage": 14}}, "logs": {"crashed": {"collect": false, "percentage": 21}, "success": {"collect": true, "percentage": 82}}}}' \
    > test.out 2>&1
eval_tap $? 13 'FleetCreate' test.out

#- 14 FleetGet
./ng net.accelbyte.sdk.cli.Main ams fleetGet \
    --fleetID '1Z5f1RO8' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 14 'FleetGet' test.out

#- 15 FleetUpdate
./ng net.accelbyte.sdk.cli.Main ams fleetUpdate \
    --fleetID '6rJjttUT' \
    --namespace "$AB_NAMESPACE" \
    --body '{"active": false, "claimKeys": ["MoRoW4Sz", "2oP2tdcv", "tW9OBFpo"], "dsHostConfiguration": {"instanceId": "FDPGMhMw", "instanceType": "xoJvMq6X", "serversPerVm": 60}, "imageDeploymentProfile": {"commandLine": "JhQdAIQ2", "imageId": "Z3KVBcdg", "portConfigurations": [{"name": "tSzDn4aC", "protocol": "DffbdEma"}, {"name": "qyEIx0jp", "protocol": "YD0xvcgI"}, {"name": "RGrGwNzb", "protocol": "hApCTNu8"}], "timeout": {"creation": 7, "drain": 46, "session": 33, "unresponsive": 86}}, "name": "vtHfpphV", "regions": [{"bufferSize": 14, "maxServerCount": 56, "minServerCount": 64, "region": "a3ocsM24"}, {"bufferSize": 27, "maxServerCount": 82, "minServerCount": 13, "region": "dksa6eWq"}, {"bufferSize": 45, "maxServerCount": 20, "minServerCount": 5, "region": "rCr4tUyC"}], "samplingRules": {"coredumps": {"crashed": {"collect": false, "percentage": 73}, "success": {"collect": true, "percentage": 35}}, "logs": {"crashed": {"collect": true, "percentage": 20}, "success": {"collect": true, "percentage": 58}}}}' \
    > test.out 2>&1
eval_tap $? 15 'FleetUpdate' test.out

#- 16 FleetDelete
./ng net.accelbyte.sdk.cli.Main ams fleetDelete \
    --fleetID '5j0Pep3b' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 16 'FleetDelete' test.out

#- 17 FleetArtifactSamplingRulesGet
./ng net.accelbyte.sdk.cli.Main ams fleetArtifactSamplingRulesGet \
    --fleetID 'S6XTqbmR' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 17 'FleetArtifactSamplingRulesGet' test.out

#- 18 FleetArtifactSamplingRulesSet
./ng net.accelbyte.sdk.cli.Main ams fleetArtifactSamplingRulesSet \
    --fleetID 'GnfGvu0m' \
    --namespace "$AB_NAMESPACE" \
    --body '{"coredumps": {"crashed": {"collect": true, "percentage": 27}, "success": {"collect": true, "percentage": 28}}, "logs": {"crashed": {"collect": false, "percentage": 98}, "success": {"collect": true, "percentage": 59}}}' \
    > test.out 2>&1
eval_tap $? 18 'FleetArtifactSamplingRulesSet' test.out

#- 19 FleetServers
./ng net.accelbyte.sdk.cli.Main ams fleetServers \
    --fleetID 'svLFUAEx' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 19 'FleetServers' test.out

#- 20 FleetServerHistory
./ng net.accelbyte.sdk.cli.Main ams fleetServerHistory \
    --fleetID '25aLjAz5' \
    --namespace "$AB_NAMESPACE" \
    --count '95' \
    --offset '99' \
    --reason '500mf8pd' \
    --region '6gjDst24' \
    --serverId '2WX1f4ZM' \
    --sortDirection 'd0WuUrEV' \
    --status 'mnSmfLDO' \
    > test.out 2>&1
eval_tap $? 20 'FleetServerHistory' test.out

#- 21 ImageList
./ng net.accelbyte.sdk.cli.Main ams imageList \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 21 'ImageList' test.out

#- 22 ImageGet
./ng net.accelbyte.sdk.cli.Main ams imageGet \
    --imageID 'Ybd0jrap' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 22 'ImageGet' test.out

#- 23 ImagePatch
./ng net.accelbyte.sdk.cli.Main ams imagePatch \
    --imageID 'WcMMFuI3' \
    --namespace "$AB_NAMESPACE" \
    --body '{"addedTags": ["m5paBVmy", "6g2skpRP", "9GfKrOYM"], "isProtected": true, "name": "03YMcLLO", "removedTags": ["ecKPrUd1", "mZs0HvoA", "oaZ7t1Hb"]}' \
    > test.out 2>&1
eval_tap $? 23 'ImagePatch' test.out

#- 24 QoSRegionsGet
./ng net.accelbyte.sdk.cli.Main ams qoSRegionsGet \
    --namespace "$AB_NAMESPACE" \
    --status 'E8x47HY5' \
    > test.out 2>&1
eval_tap $? 24 'QoSRegionsGet' test.out

#- 25 QoSRegionsUpdate
./ng net.accelbyte.sdk.cli.Main ams qoSRegionsUpdate \
    --namespace "$AB_NAMESPACE" \
    --region 'XnpVyHen' \
    --body '{"status": "GmG1L3NB"}' \
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
    --serverID 'fgmxIgvD' \
    > test.out 2>&1
eval_tap $? 27 'FleetServerInfo' test.out

#- 28 ServerHistory
./ng net.accelbyte.sdk.cli.Main ams serverHistory \
    --namespace "$AB_NAMESPACE" \
    --serverID 'jN21lTus' \
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
    --fleetID 'zKlECuHy' \
    --namespace "$AB_NAMESPACE" \
    --body '{"region": "31vw23QG"}' \
    > test.out 2>&1
eval_tap $? 31 'FleetClaimByID' test.out

#- 32 LocalWatchdogConnect
./ng net.accelbyte.sdk.cli.Main ams localWatchdogConnect \
    --namespace "$AB_NAMESPACE" \
    --watchdogID '1Bkv5EIi' \
    > test.out 2>&1
eval_tap $? 32 'LocalWatchdogConnect' test.out

#- 33 FleetClaimByKeys
./ng net.accelbyte.sdk.cli.Main ams fleetClaimByKeys \
    --namespace "$AB_NAMESPACE" \
    --body '{"claimKeys": ["h0r0TdNl", "qVpgZztW", "2TfLA8bo"], "regions": ["u1zbo9Aq", "uDKBpdWz", "2Ol7bJ9v"]}' \
    > test.out 2>&1
eval_tap $? 33 'FleetClaimByKeys' test.out

#- 34 WatchdogConnect
./ng net.accelbyte.sdk.cli.Main ams watchdogConnect \
    --namespace "$AB_NAMESPACE" \
    --watchdogID 'lNbdyjsG' \
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