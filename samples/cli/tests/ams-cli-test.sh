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
    --body '{"name": "vuTq6DaZ"}' \
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
    --body '{"token": "4IprCbz2"}' \
    > test.out 2>&1
eval_tap $? 7 'AdminAccountLink' test.out

#- 8 ArtifactGet
./ng net.accelbyte.sdk.cli.Main ams artifactGet \
    --namespace "$AB_NAMESPACE" \
    --artifactType 'imaJjeex' \
    --count '304' \
    --endDate 'eIsQldHN' \
    --fleetID 'C8l3U2zX' \
    --imageID 'U8SnCueW' \
    --maxSize '89' \
    --minSize '33' \
    --offset '59' \
    --region 'Cahm357Y' \
    --serverId 'AJBXBJtS' \
    --sortBy 'dMTSF1hb' \
    --sortDirection 'asc' \
    --startDate '3YC94fh9' \
    --status 'OgPkrcT7' \
    > test.out 2>&1
eval_tap $? 8 'ArtifactGet' test.out

#- 9 ArtifactBulkDelete
./ng net.accelbyte.sdk.cli.Main ams artifactBulkDelete \
    --namespace "$AB_NAMESPACE" \
    --artifactType 'zo1d7azA' \
    --fleetId 'wx8zn6Cd' \
    --uploadedBefore '1997-05-05' \
    > test.out 2>&1
eval_tap $? 9 'ArtifactBulkDelete' test.out

#- 10 ArtifactUsageGet
./ng net.accelbyte.sdk.cli.Main ams artifactUsageGet \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 10 'ArtifactUsageGet' test.out

#- 11 ArtifactDelete
./ng net.accelbyte.sdk.cli.Main ams artifactDelete \
    --artifactID 'fcSaUZdH' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 11 'ArtifactDelete' test.out

#- 12 ArtifactGetURL
./ng net.accelbyte.sdk.cli.Main ams artifactGetURL \
    --artifactID 'S49wh1Uz' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 12 'ArtifactGetURL' test.out

#- 13 DevelopmentServerConfigurationList
./ng net.accelbyte.sdk.cli.Main ams developmentServerConfigurationList \
    --namespace "$AB_NAMESPACE" \
    --count '460' \
    --offset '47' \
    > test.out 2>&1
eval_tap $? 13 'DevelopmentServerConfigurationList' test.out

#- 14 DevelopmentServerConfigurationCreate
./ng net.accelbyte.sdk.cli.Main ams developmentServerConfigurationCreate \
    --namespace "$AB_NAMESPACE" \
    --body '{"commandLineArguments": "rTfvL3eS", "expiresAt": "1999-07-16T00:00:00Z", "imageId": "DJnC7E7Z", "name": "XsNIGPH8"}' \
    > test.out 2>&1
eval_tap $? 14 'DevelopmentServerConfigurationCreate' test.out

#- 15 DevelopmentServerConfigurationGet
./ng net.accelbyte.sdk.cli.Main ams developmentServerConfigurationGet \
    --developmentServerConfigID '67st4qBZ' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 15 'DevelopmentServerConfigurationGet' test.out

#- 16 DevelopmentServerConfigurationDelete
./ng net.accelbyte.sdk.cli.Main ams developmentServerConfigurationDelete \
    --developmentServerConfigID 'r0FnCq4P' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 16 'DevelopmentServerConfigurationDelete' test.out

#- 17 FleetList
./ng net.accelbyte.sdk.cli.Main ams fleetList \
    --namespace "$AB_NAMESPACE" \
    --active  \
    --count '51' \
    --name 'YV0HisWD' \
    --offset '36' \
    --region 'LzwdjBoL' \
    --sortBy 'name' \
    --sortDirection 'asc' \
    > test.out 2>&1
eval_tap $? 17 'FleetList' test.out

#- 18 FleetCreate
./ng net.accelbyte.sdk.cli.Main ams fleetCreate \
    --namespace "$AB_NAMESPACE" \
    --body '{"active": true, "claimKeys": ["Jr2rkhR8", "b1hHGmCE", "gDmNhEJW"], "dsHostConfiguration": {"instanceId": "6Mu8GawP", "serversPerVm": 58}, "fallbackFleet": "qNytpTHC", "imageDeploymentProfile": {"commandLine": "TbPJvYgM", "imageId": "Zzg99vIJ", "portConfigurations": [{"name": "jj5FOJL7", "protocol": "HY1c2qyG"}, {"name": "uJvUmrIE", "protocol": "8f7tiiah"}, {"name": "C3RZoiuQ", "protocol": "fEshSAcj"}], "timeout": {"claim": 35, "creation": 47, "drain": 89, "session": 9, "unresponsive": 19}}, "name": "TmFSyu13", "onDemand": true, "regions": [{"bufferSize": 49, "dynamicBuffer": false, "maxServerCount": 34, "minServerCount": 95, "region": "AZXeOMc4"}, {"bufferSize": 2, "dynamicBuffer": true, "maxServerCount": 52, "minServerCount": 67, "region": "FfJ9k238"}, {"bufferSize": 13, "dynamicBuffer": true, "maxServerCount": 90, "minServerCount": 34, "region": "2itDazCO"}], "samplingRules": {"coredumps": {"crashed": {"collect": true, "percentage": 74}}, "logs": {"crashed": {"collect": true, "percentage": 57}, "success": {"collect": true, "percentage": 59}, "unclaimed": {"collect": true, "percentage": 15}}}}' \
    > test.out 2>&1
eval_tap $? 18 'FleetCreate' test.out

#- 19 FleetGet
./ng net.accelbyte.sdk.cli.Main ams fleetGet \
    --fleetID 'F52WtzsI' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 19 'FleetGet' test.out

#- 20 FleetUpdate
./ng net.accelbyte.sdk.cli.Main ams fleetUpdate \
    --fleetID 'xRhY2VP1' \
    --namespace "$AB_NAMESPACE" \
    --body '{"active": true, "claimKeys": ["QvT6IPBp", "rKc4P3f9", "WeKDi1jO"], "dsHostConfiguration": {"instanceId": "1iAbgJ2Z", "serversPerVm": 86}, "fallbackFleet": "bCilkzYV", "imageDeploymentProfile": {"commandLine": "bS4XzYUH", "imageId": "GfDHr3Va", "portConfigurations": [{"name": "MfpDlxF2", "protocol": "ECwwDNtb"}, {"name": "EvwcLhtq", "protocol": "vLnsmzfW"}, {"name": "z7JsTRdL", "protocol": "hbDSpm35"}], "timeout": {"claim": 44, "creation": 10, "drain": 9, "session": 87, "unresponsive": 40}}, "name": "qjfLFuPe", "onDemand": true, "regions": [{"bufferSize": 3, "dynamicBuffer": false, "maxServerCount": 97, "minServerCount": 96, "region": "B4sjEf6l"}, {"bufferSize": 95, "dynamicBuffer": true, "maxServerCount": 99, "minServerCount": 34, "region": "yR3C7zYD"}, {"bufferSize": 36, "dynamicBuffer": true, "maxServerCount": 15, "minServerCount": 93, "region": "bk4Lw4Lo"}], "samplingRules": {"coredumps": {"crashed": {"collect": false, "percentage": 71}}, "logs": {"crashed": {"collect": false, "percentage": 74}, "success": {"collect": true, "percentage": 12}, "unclaimed": {"collect": false, "percentage": 60}}}}' \
    > test.out 2>&1
eval_tap $? 20 'FleetUpdate' test.out

#- 21 FleetDelete
./ng net.accelbyte.sdk.cli.Main ams fleetDelete \
    --fleetID 'Vi5DDo7Z' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 21 'FleetDelete' test.out

#- 22 FleetArtifactSamplingRulesGet
./ng net.accelbyte.sdk.cli.Main ams fleetArtifactSamplingRulesGet \
    --fleetID 'xIBWvHaX' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 22 'FleetArtifactSamplingRulesGet' test.out

#- 23 FleetArtifactSamplingRulesSet
./ng net.accelbyte.sdk.cli.Main ams fleetArtifactSamplingRulesSet \
    --fleetID 'ScQthT9K' \
    --namespace "$AB_NAMESPACE" \
    --body '{"coredumps": {"crashed": {"collect": false, "percentage": 79}}, "logs": {"crashed": {"collect": false, "percentage": 62}, "success": {"collect": false, "percentage": 76}, "unclaimed": {"collect": true, "percentage": 62}}}' \
    > test.out 2>&1
eval_tap $? 23 'FleetArtifactSamplingRulesSet' test.out

#- 24 FleetServers
./ng net.accelbyte.sdk.cli.Main ams fleetServers \
    --fleetID 'ZSRRIuhE' \
    --namespace "$AB_NAMESPACE" \
    --count '24' \
    --offset '24' \
    --region '63YvGmT7' \
    --serverId 'ueiQDTiz' \
    --sortBy '2K5lirtG' \
    --sortDirection 'asc' \
    --status 'claimed' \
    > test.out 2>&1
eval_tap $? 24 'FleetServers' test.out

#- 25 FleetServerHistory
./ng net.accelbyte.sdk.cli.Main ams fleetServerHistory \
    --fleetID 'bwBH19YG' \
    --namespace "$AB_NAMESPACE" \
    --count '88' \
    --offset '13' \
    --reason 'lU0feQzu' \
    --region 'ne84z0ef' \
    --serverId '3X5wnE5w' \
    --sortDirection 'lrIKiGmP' \
    --status 'W8yRDTOE' \
    > test.out 2>&1
eval_tap $? 25 'FleetServerHistory' test.out

#- 26 ImageList
./ng net.accelbyte.sdk.cli.Main ams imageList \
    --namespace "$AB_NAMESPACE" \
    --count '64' \
    --inUse 'yrgSI5vj' \
    --isProtected  \
    --name 'ML300XBl' \
    --offset '21' \
    --sortBy '9V0NamxB' \
    --sortDirection 'Eyyv1lGo' \
    --status 'UqHfxYm6' \
    --tag 'zUnkpSEC' \
    > test.out 2>&1
eval_tap $? 26 'ImageList' test.out

#- 27 ImagesStorage
./ng net.accelbyte.sdk.cli.Main ams imagesStorage \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 27 'ImagesStorage' test.out

#- 28 ImageGet
./ng net.accelbyte.sdk.cli.Main ams imageGet \
    --imageID 'W3H7QA1B' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 28 'ImageGet' test.out

#- 29 ImageMarkForDeletion
./ng net.accelbyte.sdk.cli.Main ams imageMarkForDeletion \
    --imageID 'uvrPmo89' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 29 'ImageMarkForDeletion' test.out

#- 30 ImagePatch
./ng net.accelbyte.sdk.cli.Main ams imagePatch \
    --imageID 'FQyoriGm' \
    --namespace "$AB_NAMESPACE" \
    --body '{"addedTags": ["EKNFoSJ2", "kBfKn6Gf", "R3RY5HKi"], "isProtected": false, "name": "d56oEtuE", "removedTags": ["I3Im7LRx", "Vd2z4tlk", "LlmpbmJ9"]}' \
    > test.out 2>&1
eval_tap $? 30 'ImagePatch' test.out

#- 31 ImageUnmarkForDeletion
./ng net.accelbyte.sdk.cli.Main ams imageUnmarkForDeletion \
    --imageID '0UpTrE13' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 31 'ImageUnmarkForDeletion' test.out

#- 32 QoSRegionsGet
./ng net.accelbyte.sdk.cli.Main ams qoSRegionsGet \
    --namespace "$AB_NAMESPACE" \
    --status 'pHAkY5mc' \
    > test.out 2>&1
eval_tap $? 32 'QoSRegionsGet' test.out

#- 33 QoSRegionsUpdate
./ng net.accelbyte.sdk.cli.Main ams qoSRegionsUpdate \
    --namespace "$AB_NAMESPACE" \
    --region 'OUMhHZ7z' \
    --body '{"status": "0XMHxzWQ"}' \
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
    --serverID 'eiNk9EnK' \
    > test.out 2>&1
eval_tap $? 35 'FleetServerInfo' test.out

#- 36 FleetServerConnectionInfo
./ng net.accelbyte.sdk.cli.Main ams fleetServerConnectionInfo \
    --namespace "$AB_NAMESPACE" \
    --serverID 'y5FTdUPC' \
    > test.out 2>&1
eval_tap $? 36 'FleetServerConnectionInfo' test.out

#- 37 ServerHistory
./ng net.accelbyte.sdk.cli.Main ams serverHistory \
    --namespace "$AB_NAMESPACE" \
    --serverID 'Bx6VxwTL' \
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
    --fleetID 'VBHPQwSG' \
    --namespace "$AB_NAMESPACE" \
    --body '{"region": "Af41VqUQ", "sessionId": "L8OViKxF"}' \
    > test.out 2>&1
eval_tap $? 40 'FleetClaimByID' test.out

#- 41 LocalWatchdogConnect
./ng net.accelbyte.sdk.cli.Main ams localWatchdogConnect \
    --namespace "$AB_NAMESPACE" \
    --watchdogID 'fA4O3OFr' \
    > test.out 2>&1
eval_tap $? 41 'LocalWatchdogConnect' test.out

#- 42 FleetClaimByKeys
./ng net.accelbyte.sdk.cli.Main ams fleetClaimByKeys \
    --namespace "$AB_NAMESPACE" \
    --body '{"claimKeys": ["nCQ9T1Za", "3XYdEWvo", "KFUll73K"], "regions": ["02Eo4QGO", "OgxsZYls", "50Iwrh5H"], "sessionId": "UTRW0brt"}' \
    > test.out 2>&1
eval_tap $? 42 'FleetClaimByKeys' test.out

#- 43 WatchdogConnect
./ng net.accelbyte.sdk.cli.Main ams watchdogConnect \
    --namespace "$AB_NAMESPACE" \
    --watchdogID 'kUysQCrG' \
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