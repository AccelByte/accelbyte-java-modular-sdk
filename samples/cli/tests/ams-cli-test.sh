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
echo "1..46"

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
    --body '{"name": "b0pUZgCd"}' \
    > test.out 2>&1
eval_tap $? 5 'AdminAccountCreate' test.out

#- 6 AdminAccountLinkTokenGet
./ng net.accelbyte.sdk.cli.Main ams adminAccountLinkTokenGet \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 6 'AdminAccountLinkTokenGet' test.out

#- 7 AdminAccountLink
./ng net.accelbyte.sdk.cli.Main ams adminAccountLink \
    --namespace "$AB_NAMESPACE" \
    --body '{"token": "IBudC6ed"}' \
    > test.out 2>&1
eval_tap $? 7 'AdminAccountLink' test.out

#- 8 ArtifactGet
./ng net.accelbyte.sdk.cli.Main ams artifactGet \
    --namespace "$AB_NAMESPACE" \
    --artifactType 'hsdukA9k' \
    --count '381' \
    --endDate 'Ced2GqK1' \
    --fleetID 'ckZPcuNX' \
    --imageID 'HCEtJUTT' \
    --maxSize '99' \
    --minSize '99' \
    --offset '64' \
    --region 'uTZprL8S' \
    --serverId 'AWxAa0r3' \
    --sortBy 'zLFe3bbt' \
    --sortDirection 'asc' \
    --startDate 'r5bLD6k4' \
    --status 'hZ3StlIu' \
    > test.out 2>&1
eval_tap $? 8 'ArtifactGet' test.out

#- 9 ArtifactBulkDelete
./ng net.accelbyte.sdk.cli.Main ams artifactBulkDelete \
    --namespace "$AB_NAMESPACE" \
    --artifactType 'tD0wKtH7' \
    --fleetId 'rxdq9sOs' \
    --uploadedBefore '1989-05-15' \
    > test.out 2>&1
eval_tap $? 9 'ArtifactBulkDelete' test.out

#- 10 ArtifactUsageGet
./ng net.accelbyte.sdk.cli.Main ams artifactUsageGet \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 10 'ArtifactUsageGet' test.out

#- 11 ArtifactDelete
./ng net.accelbyte.sdk.cli.Main ams artifactDelete \
    --artifactID '9Nh8DhQi' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 11 'ArtifactDelete' test.out

#- 12 ArtifactGetURL
./ng net.accelbyte.sdk.cli.Main ams artifactGetURL \
    --artifactID 'uTZsGKue' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 12 'ArtifactGetURL' test.out

#- 13 DevelopmentServerConfigurationList
./ng net.accelbyte.sdk.cli.Main ams developmentServerConfigurationList \
    --namespace "$AB_NAMESPACE" \
    --count '12' \
    --offset '64' \
    > test.out 2>&1
eval_tap $? 13 'DevelopmentServerConfigurationList' test.out

#- 14 DevelopmentServerConfigurationCreate
./ng net.accelbyte.sdk.cli.Main ams developmentServerConfigurationCreate \
    --namespace "$AB_NAMESPACE" \
    --body '{"commandLineArguments": "NsFMMgjO", "expiresAt": "1984-01-20T00:00:00Z", "imageId": "P2v8mXO8", "name": "EWs6vgKt"}' \
    > test.out 2>&1
eval_tap $? 14 'DevelopmentServerConfigurationCreate' test.out

#- 15 DevelopmentServerConfigurationGet
./ng net.accelbyte.sdk.cli.Main ams developmentServerConfigurationGet \
    --developmentServerConfigID 'IIzkyNof' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 15 'DevelopmentServerConfigurationGet' test.out

#- 16 DevelopmentServerConfigurationDelete
./ng net.accelbyte.sdk.cli.Main ams developmentServerConfigurationDelete \
    --developmentServerConfigID 'wmOkIzc6' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 16 'DevelopmentServerConfigurationDelete' test.out

#- 17 FleetList
./ng net.accelbyte.sdk.cli.Main ams fleetList \
    --namespace "$AB_NAMESPACE" \
    --active  \
    --count '2' \
    --desc 'asc' \
    --name 'hkZ0vhsh' \
    --offset '98' \
    --region 'CdWSptli' \
    --sortBy 'active' \
    > test.out 2>&1
eval_tap $? 17 'FleetList' test.out

#- 18 FleetCreate
./ng net.accelbyte.sdk.cli.Main ams fleetCreate \
    --namespace "$AB_NAMESPACE" \
    --body '{"active": false, "claimKeys": ["b2Vkl9rX", "DxyJ7dkg", "233mHEgs"], "dsHostConfiguration": {"instanceId": "cUrhlbqb", "serversPerVm": 54}, "imageDeploymentProfile": {"commandLine": "6QFCvp0M", "imageId": "gA24gkOu", "portConfigurations": [{"name": "7utRTTKd", "protocol": "2Dhb2m1n"}, {"name": "7ESmb6nm", "protocol": "xpHOjyM7"}, {"name": "MjbC0YzX", "protocol": "gtFremVs"}], "timeout": {"claim": 2, "creation": 56, "drain": 14, "session": 83, "unresponsive": 33}}, "name": "fQdOgr3M", "onDemand": false, "regions": [{"bufferSize": 4, "dynamicBuffer": false, "maxServerCount": 27, "minServerCount": 30, "region": "3bWJSIwD"}, {"bufferSize": 19, "dynamicBuffer": true, "maxServerCount": 24, "minServerCount": 38, "region": "04KZtvBV"}, {"bufferSize": 62, "dynamicBuffer": true, "maxServerCount": 40, "minServerCount": 40, "region": "i3GCz1Bz"}], "samplingRules": {"coredumps": {"crashed": {"collect": false, "percentage": 66}}, "logs": {"crashed": {"collect": true, "percentage": 81}, "success": {"collect": true, "percentage": 66}, "unclaimed": {"collect": true, "percentage": 55}}}}' \
    > test.out 2>&1
eval_tap $? 18 'FleetCreate' test.out

#- 19 FleetGet
./ng net.accelbyte.sdk.cli.Main ams fleetGet \
    --fleetID 'WQksCckk' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 19 'FleetGet' test.out

#- 20 FleetUpdate
./ng net.accelbyte.sdk.cli.Main ams fleetUpdate \
    --fleetID 'sSID0SBM' \
    --namespace "$AB_NAMESPACE" \
    --body '{"active": false, "claimKeys": ["iDrDc7Zr", "MdZH3pmN", "1qO1OKtX"], "dsHostConfiguration": {"instanceId": "UkmRNwTs", "serversPerVm": 99}, "imageDeploymentProfile": {"commandLine": "Bd6ECQLO", "imageId": "OdRnqHgP", "portConfigurations": [{"name": "0EDSU1ni", "protocol": "uam9Q7LK"}, {"name": "bSgUfF47", "protocol": "HOknf7QL"}, {"name": "oJfMQCrJ", "protocol": "cg1yLQxh"}], "timeout": {"claim": 46, "creation": 96, "drain": 39, "session": 11, "unresponsive": 41}}, "name": "TSUSPpur", "onDemand": true, "regions": [{"bufferSize": 92, "dynamicBuffer": true, "maxServerCount": 55, "minServerCount": 42, "region": "UFMx9jds"}, {"bufferSize": 28, "dynamicBuffer": false, "maxServerCount": 83, "minServerCount": 37, "region": "c3KA9AkQ"}, {"bufferSize": 26, "dynamicBuffer": false, "maxServerCount": 74, "minServerCount": 85, "region": "RxvaEuE7"}], "samplingRules": {"coredumps": {"crashed": {"collect": false, "percentage": 21}}, "logs": {"crashed": {"collect": false, "percentage": 97}, "success": {"collect": true, "percentage": 18}, "unclaimed": {"collect": true, "percentage": 11}}}}' \
    > test.out 2>&1
eval_tap $? 20 'FleetUpdate' test.out

#- 21 FleetDelete
./ng net.accelbyte.sdk.cli.Main ams fleetDelete \
    --fleetID '8LRaMSFB' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 21 'FleetDelete' test.out

#- 22 FleetArtifactSamplingRulesGet
./ng net.accelbyte.sdk.cli.Main ams fleetArtifactSamplingRulesGet \
    --fleetID 'YImfwkkx' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 22 'FleetArtifactSamplingRulesGet' test.out

#- 23 FleetArtifactSamplingRulesSet
./ng net.accelbyte.sdk.cli.Main ams fleetArtifactSamplingRulesSet \
    --fleetID 'BLgp2iGZ' \
    --namespace "$AB_NAMESPACE" \
    --body '{"coredumps": {"crashed": {"collect": false, "percentage": 93}}, "logs": {"crashed": {"collect": false, "percentage": 54}, "success": {"collect": true, "percentage": 42}, "unclaimed": {"collect": true, "percentage": 1}}}' \
    > test.out 2>&1
eval_tap $? 23 'FleetArtifactSamplingRulesSet' test.out

#- 24 FleetServers
./ng net.accelbyte.sdk.cli.Main ams fleetServers \
    --fleetID 'kbXWvL5B' \
    --namespace "$AB_NAMESPACE" \
    --count '94' \
    --offset '16' \
    --region 'um9Kyaw3' \
    --serverId 'Y9LLn3cp' \
    --sortBy 'OON3BA2E' \
    --sortDirection 'desc' \
    --status 'claiming' \
    > test.out 2>&1
eval_tap $? 24 'FleetServers' test.out

#- 25 FleetServerHistory
./ng net.accelbyte.sdk.cli.Main ams fleetServerHistory \
    --fleetID 'THWsHc8x' \
    --namespace "$AB_NAMESPACE" \
    --count '4' \
    --offset '51' \
    --reason '9tIX2Pgc' \
    --region 'dECmIqy5' \
    --serverId 'Hg2EiTlJ' \
    --sortDirection 'cDyzLLND' \
    --status 'PqTaYSAG' \
    > test.out 2>&1
eval_tap $? 25 'FleetServerHistory' test.out

#- 26 ImageList
./ng net.accelbyte.sdk.cli.Main ams imageList \
    --namespace "$AB_NAMESPACE" \
    --count '94' \
    --inUse 'QqijyO2d' \
    --isProtected  \
    --name 'ACz06Ajv' \
    --offset '5' \
    --sortBy '5LuqatYi' \
    --sortDirection '3KulgEqF' \
    --status 'KGiiHH8W' \
    --tag 'r0g2h1AN' \
    > test.out 2>&1
eval_tap $? 26 'ImageList' test.out

#- 27 ImagesStorage
./ng net.accelbyte.sdk.cli.Main ams imagesStorage \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 27 'ImagesStorage' test.out

#- 28 ImageGet
./ng net.accelbyte.sdk.cli.Main ams imageGet \
    --imageID 'H1IJsRAV' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 28 'ImageGet' test.out

#- 29 ImageMarkForDeletion
./ng net.accelbyte.sdk.cli.Main ams imageMarkForDeletion \
    --imageID '8UnebLH8' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 29 'ImageMarkForDeletion' test.out

#- 30 ImagePatch
./ng net.accelbyte.sdk.cli.Main ams imagePatch \
    --imageID '6whb7sCp' \
    --namespace "$AB_NAMESPACE" \
    --body '{"addedTags": ["YbdOTUuZ", "UQJ6oToF", "K2kfo68m"], "isProtected": true, "name": "nOGlW3SV", "removedTags": ["cW0mBwn0", "eMGMbJA2", "pVXJZIFS"]}' \
    > test.out 2>&1
eval_tap $? 30 'ImagePatch' test.out

#- 31 ImageUnmarkForDeletion
./ng net.accelbyte.sdk.cli.Main ams imageUnmarkForDeletion \
    --imageID 'HMsvMLbO' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 31 'ImageUnmarkForDeletion' test.out

#- 32 QoSRegionsGet
./ng net.accelbyte.sdk.cli.Main ams qoSRegionsGet \
    --namespace "$AB_NAMESPACE" \
    --status 'DRzmRTZW' \
    > test.out 2>&1
eval_tap $? 32 'QoSRegionsGet' test.out

#- 33 QoSRegionsUpdate
./ng net.accelbyte.sdk.cli.Main ams qoSRegionsUpdate \
    --namespace "$AB_NAMESPACE" \
    --region '3BgK2oCz' \
    --body '{"status": "gGOFgRk6"}' \
    > test.out 2>&1
eval_tap $? 33 'QoSRegionsUpdate' test.out

#- 34 InfoRegions
./ng net.accelbyte.sdk.cli.Main ams infoRegions \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 34 'InfoRegions' test.out

#- 35 FleetServerInfo
./ng net.accelbyte.sdk.cli.Main ams fleetServerInfo \
    --namespace "$AB_NAMESPACE" \
    --serverID 'BRF9L7ND' \
    > test.out 2>&1
eval_tap $? 35 'FleetServerInfo' test.out

#- 36 FleetServerConnectionInfo
./ng net.accelbyte.sdk.cli.Main ams fleetServerConnectionInfo \
    --namespace "$AB_NAMESPACE" \
    --serverID 'y1aotBrC' \
    > test.out 2>&1
eval_tap $? 36 'FleetServerConnectionInfo' test.out

#- 37 ServerHistory
./ng net.accelbyte.sdk.cli.Main ams serverHistory \
    --namespace "$AB_NAMESPACE" \
    --serverID 'c6q2ZJQz' \
    > test.out 2>&1
eval_tap $? 37 'ServerHistory' test.out

#- 38 InfoSupportedInstances
./ng net.accelbyte.sdk.cli.Main ams infoSupportedInstances \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 38 'InfoSupportedInstances' test.out

#- 39 AccountGet
./ng net.accelbyte.sdk.cli.Main ams accountGet \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 39 'AccountGet' test.out

#- 40 FleetClaimByID
./ng net.accelbyte.sdk.cli.Main ams fleetClaimByID \
    --fleetID 'PuXU0Yrr' \
    --namespace "$AB_NAMESPACE" \
    --body '{"region": "6lFK8EIc", "sessionId": "x9sbjGfY"}' \
    > test.out 2>&1
eval_tap $? 40 'FleetClaimByID' test.out

#- 41 LocalWatchdogConnect
./ng net.accelbyte.sdk.cli.Main ams localWatchdogConnect \
    --namespace "$AB_NAMESPACE" \
    --watchdogID 'CrQnk9p5' \
    > test.out 2>&1
eval_tap $? 41 'LocalWatchdogConnect' test.out

#- 42 FleetClaimByKeys
./ng net.accelbyte.sdk.cli.Main ams fleetClaimByKeys \
    --namespace "$AB_NAMESPACE" \
    --body '{"claimKeys": ["O17EZp2H", "Lg83QiZq", "DvP8ppEI"], "regions": ["fAGbWGn7", "bdTYGwvg", "VF1E0mDJ"], "sessionId": "AdrIgNq7"}' \
    > test.out 2>&1
eval_tap $? 42 'FleetClaimByKeys' test.out

#- 43 WatchdogConnect
./ng net.accelbyte.sdk.cli.Main ams watchdogConnect \
    --namespace "$AB_NAMESPACE" \
    --watchdogID 'poRqP05h' \
    > test.out 2>&1
eval_tap $? 43 'WatchdogConnect' test.out

#- 44 UploadURLGet
./ng net.accelbyte.sdk.cli.Main ams uploadURLGet \
    > test.out 2>&1
eval_tap $? 44 'UploadURLGet' test.out

#- 45 Func1
./ng net.accelbyte.sdk.cli.Main ams func1 \
    > test.out 2>&1
eval_tap $? 45 'Func1' test.out

#- 46 BasicHealthCheck
./ng net.accelbyte.sdk.cli.Main ams basicHealthCheck \
    > test.out 2>&1
eval_tap $? 46 'BasicHealthCheck' test.out


rm -f "tmp.dat"

exit $EXIT_CODE