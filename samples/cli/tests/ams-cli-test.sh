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
    --body '{"name": "uYICo2So"}' \
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
    --body '{"token": "P8yI3rRl"}' \
    > test.out 2>&1
eval_tap $? 7 'AdminAccountLinkTokenPost' test.out

#- 8 ArtifactGet
./ng net.accelbyte.sdk.cli.Main ams artifactGet \
    --namespace "$AB_NAMESPACE" \
    --artifactType '9KiWE2ZB' \
    --count '447' \
    --endDate 'pVsUwIbA' \
    --fleetID '8ymnEwZJ' \
    --imageID 'LaGj4JYu' \
    --maxSize '59' \
    --minSize '33' \
    --offset '51' \
    --region 'IyoAsTpR' \
    --serverId 'E0bfYXZr' \
    --startDate 'bbAkUmKx' \
    --status 'jdyPf6Ux' \
    > test.out 2>&1
eval_tap $? 8 'ArtifactGet' test.out

#- 9 ArtifactBulkDelete
./ng net.accelbyte.sdk.cli.Main ams artifactBulkDelete \
    --namespace "$AB_NAMESPACE" \
    --artifactType 'AAcPuhY4' \
    --fleetId 'SOneugF2' \
    --uploadedBefore '1975-06-20' \
    > test.out 2>&1
eval_tap $? 9 'ArtifactBulkDelete' test.out

#- 10 ArtifactUsageGet
./ng net.accelbyte.sdk.cli.Main ams artifactUsageGet \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 10 'ArtifactUsageGet' test.out

#- 11 ArtifactDelete
./ng net.accelbyte.sdk.cli.Main ams artifactDelete \
    --artifactID 'RZxKb2Gl' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 11 'ArtifactDelete' test.out

#- 12 ArtifactGetURL
./ng net.accelbyte.sdk.cli.Main ams artifactGetURL \
    --artifactID 'UbH5AKT7' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 12 'ArtifactGetURL' test.out

#- 13 DevelopmentServerConfigurationList
./ng net.accelbyte.sdk.cli.Main ams developmentServerConfigurationList \
    --namespace "$AB_NAMESPACE" \
    --count '10' \
    --offset '83' \
    > test.out 2>&1
eval_tap $? 13 'DevelopmentServerConfigurationList' test.out

#- 14 DevelopmentServerConfigurationCreate
./ng net.accelbyte.sdk.cli.Main ams developmentServerConfigurationCreate \
    --namespace "$AB_NAMESPACE" \
    --body '{"commandLineArguments": "Ne01ZKOS", "expiresAt": "1982-01-04T00:00:00Z", "imageId": "ESZunEo8", "name": "13kRiDrT"}' \
    > test.out 2>&1
eval_tap $? 14 'DevelopmentServerConfigurationCreate' test.out

#- 15 DevelopmentServerConfigurationGet
./ng net.accelbyte.sdk.cli.Main ams developmentServerConfigurationGet \
    --developmentServerConfigID 'Ydn9aTMK' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 15 'DevelopmentServerConfigurationGet' test.out

#- 16 DevelopmentServerConfigurationDelete
./ng net.accelbyte.sdk.cli.Main ams developmentServerConfigurationDelete \
    --developmentServerConfigID 'YUjyyan0' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 16 'DevelopmentServerConfigurationDelete' test.out

#- 17 FleetList
./ng net.accelbyte.sdk.cli.Main ams fleetList \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 17 'FleetList' test.out

#- 18 FleetCreate
./ng net.accelbyte.sdk.cli.Main ams fleetCreate \
    --namespace "$AB_NAMESPACE" \
    --body '{"active": true, "claimKeys": ["juAcmyIa", "HAvd3dtp", "mTVOgucr"], "dsHostConfiguration": {"instanceId": "C55Cush2", "serversPerVm": 26}, "imageDeploymentProfile": {"commandLine": "3MRYhtMs", "imageId": "TDPDXTix", "portConfigurations": [{"name": "rTQqun1P", "protocol": "ZLjUu15N"}, {"name": "Kh7x0cKx", "protocol": "DEYSUow3"}, {"name": "za58fTn9", "protocol": "HUuDJzid"}], "timeout": {"creation": 96, "drain": 59, "session": 93, "unresponsive": 5}}, "name": "nW1jqoX8", "onDemand": false, "regions": [{"bufferSize": 81, "dynamicBuffer": false, "maxServerCount": 72, "minServerCount": 84, "region": "PfEC6xg8"}, {"bufferSize": 51, "dynamicBuffer": true, "maxServerCount": 16, "minServerCount": 80, "region": "xCySNmIA"}, {"bufferSize": 52, "dynamicBuffer": true, "maxServerCount": 54, "minServerCount": 14, "region": "4wdrXgin"}], "samplingRules": {"coredumps": {"crashed": {"collect": true, "percentage": 66}, "success": {"collect": false, "percentage": 97}}, "logs": {"crashed": {"collect": true, "percentage": 34}, "success": {"collect": true, "percentage": 78}}}}' \
    > test.out 2>&1
eval_tap $? 18 'FleetCreate' test.out

#- 19 FleetGet
./ng net.accelbyte.sdk.cli.Main ams fleetGet \
    --fleetID 'SNoLsUL7' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 19 'FleetGet' test.out

#- 20 FleetUpdate
./ng net.accelbyte.sdk.cli.Main ams fleetUpdate \
    --fleetID 'GIJRRVoW' \
    --namespace "$AB_NAMESPACE" \
    --body '{"active": false, "claimKeys": ["Oxq1z673", "DOsnmJsJ", "Fh3ou8ZB"], "dsHostConfiguration": {"instanceId": "fYpamcLS", "serversPerVm": 17}, "imageDeploymentProfile": {"commandLine": "QW7L0ZO6", "imageId": "txEdO1Jj", "portConfigurations": [{"name": "WP0P65Qg", "protocol": "EXZnWH5H"}, {"name": "N8qPG75p", "protocol": "NekpyQuA"}, {"name": "nRztEX9Q", "protocol": "y5Xm4rXD"}], "timeout": {"creation": 92, "drain": 41, "session": 36, "unresponsive": 29}}, "name": "I6TiuTea", "onDemand": false, "regions": [{"bufferSize": 80, "dynamicBuffer": false, "maxServerCount": 40, "minServerCount": 70, "region": "rPsbo6s2"}, {"bufferSize": 23, "dynamicBuffer": true, "maxServerCount": 9, "minServerCount": 3, "region": "Qi5NjUhh"}, {"bufferSize": 42, "dynamicBuffer": false, "maxServerCount": 27, "minServerCount": 30, "region": "XTuDn9mi"}], "samplingRules": {"coredumps": {"crashed": {"collect": false, "percentage": 65}, "success": {"collect": true, "percentage": 49}}, "logs": {"crashed": {"collect": false, "percentage": 87}, "success": {"collect": false, "percentage": 8}}}}' \
    > test.out 2>&1
eval_tap $? 20 'FleetUpdate' test.out

#- 21 FleetDelete
./ng net.accelbyte.sdk.cli.Main ams fleetDelete \
    --fleetID 'xe5rkUwI' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 21 'FleetDelete' test.out

#- 22 FleetArtifactSamplingRulesGet
./ng net.accelbyte.sdk.cli.Main ams fleetArtifactSamplingRulesGet \
    --fleetID 'NTWVS8OV' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 22 'FleetArtifactSamplingRulesGet' test.out

#- 23 FleetArtifactSamplingRulesSet
./ng net.accelbyte.sdk.cli.Main ams fleetArtifactSamplingRulesSet \
    --fleetID 'RzcOz74V' \
    --namespace "$AB_NAMESPACE" \
    --body '{"coredumps": {"crashed": {"collect": true, "percentage": 29}, "success": {"collect": true, "percentage": 0}}, "logs": {"crashed": {"collect": false, "percentage": 35}, "success": {"collect": true, "percentage": 34}}}' \
    > test.out 2>&1
eval_tap $? 23 'FleetArtifactSamplingRulesSet' test.out

#- 24 FleetServers
./ng net.accelbyte.sdk.cli.Main ams fleetServers \
    --fleetID 'VO33O0es' \
    --namespace "$AB_NAMESPACE" \
    --count '35' \
    --offset '98' \
    --region 'VO4HZtqg' \
    --serverId 'S0JFvECw' \
    --sortBy 'T4TfrMOM' \
    --sortDirection 'asc' \
    --status 'creating' \
    > test.out 2>&1
eval_tap $? 24 'FleetServers' test.out

#- 25 FleetServerHistory
./ng net.accelbyte.sdk.cli.Main ams fleetServerHistory \
    --fleetID 'iutLarjN' \
    --namespace "$AB_NAMESPACE" \
    --count '39' \
    --offset '44' \
    --reason '9CE8c4BB' \
    --region '8kB6rHOQ' \
    --serverId 'JPdEiBBk' \
    --sortDirection 'j1WV00v6' \
    --status '8MANuLZS' \
    > test.out 2>&1
eval_tap $? 25 'FleetServerHistory' test.out

#- 26 ImageList
./ng net.accelbyte.sdk.cli.Main ams imageList \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 26 'ImageList' test.out

#- 27 ImagesStorage
./ng net.accelbyte.sdk.cli.Main ams imagesStorage \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 27 'ImagesStorage' test.out

#- 28 ImageGet
./ng net.accelbyte.sdk.cli.Main ams imageGet \
    --imageID 'bVsMQpry' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 28 'ImageGet' test.out

#- 29 ImageMarkForDeletion
./ng net.accelbyte.sdk.cli.Main ams imageMarkForDeletion \
    --imageID 'Tb34K5xY' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 29 'ImageMarkForDeletion' test.out

#- 30 ImagePatch
./ng net.accelbyte.sdk.cli.Main ams imagePatch \
    --imageID 'osqXRmcK' \
    --namespace "$AB_NAMESPACE" \
    --body '{"addedTags": ["eZ5TVdAR", "bddEAums", "wegZo1d1"], "isProtected": false, "name": "4IinpcKU", "removedTags": ["LQyi7oTQ", "b7TzImMy", "qaGfWtyL"]}' \
    > test.out 2>&1
eval_tap $? 30 'ImagePatch' test.out

#- 31 ImageUnmarkForDeletion
./ng net.accelbyte.sdk.cli.Main ams imageUnmarkForDeletion \
    --imageID 'Xnq5FNiy' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 31 'ImageUnmarkForDeletion' test.out

#- 32 QoSRegionsGet
./ng net.accelbyte.sdk.cli.Main ams qoSRegionsGet \
    --namespace "$AB_NAMESPACE" \
    --status 'w3LCYxc2' \
    > test.out 2>&1
eval_tap $? 32 'QoSRegionsGet' test.out

#- 33 QoSRegionsUpdate
./ng net.accelbyte.sdk.cli.Main ams qoSRegionsUpdate \
    --namespace "$AB_NAMESPACE" \
    --region 'hQ4sm4tL' \
    --body '{"status": "FBeO4XOj"}' \
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
    --serverID 'WWX8Jx3j' \
    > test.out 2>&1
eval_tap $? 35 'FleetServerInfo' test.out

#- 36 FleetServerConnectionInfo
./ng net.accelbyte.sdk.cli.Main ams fleetServerConnectionInfo \
    --namespace "$AB_NAMESPACE" \
    --serverID 'XrvfvJe8' \
    > test.out 2>&1
eval_tap $? 36 'FleetServerConnectionInfo' test.out

#- 37 ServerHistory
./ng net.accelbyte.sdk.cli.Main ams serverHistory \
    --namespace "$AB_NAMESPACE" \
    --serverID 'LAzW4082' \
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
    --fleetID '10csQCgH' \
    --namespace "$AB_NAMESPACE" \
    --body '{"region": "sDXoNndA", "sessionId": "jbipyLWo"}' \
    > test.out 2>&1
eval_tap $? 40 'FleetClaimByID' test.out

#- 41 LocalWatchdogConnect
./ng net.accelbyte.sdk.cli.Main ams localWatchdogConnect \
    --namespace "$AB_NAMESPACE" \
    --watchdogID 'D6FKDSxn' \
    > test.out 2>&1
eval_tap $? 41 'LocalWatchdogConnect' test.out

#- 42 FleetClaimByKeys
./ng net.accelbyte.sdk.cli.Main ams fleetClaimByKeys \
    --namespace "$AB_NAMESPACE" \
    --body '{"claimKeys": ["AXVFpGoI", "Mo0EB4kV", "l2kPZ3rJ"], "regions": ["Fo2EbgtA", "ioiJGKPe", "T6xM00hW"], "sessionId": "94hPVkWs"}' \
    > test.out 2>&1
eval_tap $? 42 'FleetClaimByKeys' test.out

#- 43 WatchdogConnect
./ng net.accelbyte.sdk.cli.Main ams watchdogConnect \
    --namespace "$AB_NAMESPACE" \
    --watchdogID 'ZfHgJw53' \
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