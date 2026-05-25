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
echo "1..48"

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
    --body '{"name": "Thtl2dfr"}' \
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
    --body '{"token": "zq7z6mxi"}' \
    > test.out 2>&1
eval_tap $? 7 'AdminAccountLink' test.out

#- 8 ArtifactGet
./ng net.accelbyte.sdk.cli.Main ams artifactGet \
    --namespace "$AB_NAMESPACE" \
    --artifactType 'oEUdW95N' \
    --count '45' \
    --endDate '0BeOU10z' \
    --fleetID 'EDqyY3kJ' \
    --imageID 'zOrjJwDq' \
    --maxSize '67' \
    --minSize '65' \
    --offset '20' \
    --region 'mJntvWCv' \
    --serverId 'gSphWYTp' \
    --sortBy 'Egv80Moc' \
    --sortDirection 'desc' \
    --startDate 'gZU3TS80' \
    --status 'OYQKmiJS' \
    > test.out 2>&1
eval_tap $? 8 'ArtifactGet' test.out

#- 9 ArtifactBulkDelete
./ng net.accelbyte.sdk.cli.Main ams artifactBulkDelete \
    --namespace "$AB_NAMESPACE" \
    --artifactType 'pCeLoNsg' \
    --fleetId '3EdDN3RH' \
    --uploadedBefore '1999-03-28' \
    > test.out 2>&1
eval_tap $? 9 'ArtifactBulkDelete' test.out

#- 10 ArtifactUsageGet
./ng net.accelbyte.sdk.cli.Main ams artifactUsageGet \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 10 'ArtifactUsageGet' test.out

#- 11 ArtifactDelete
./ng net.accelbyte.sdk.cli.Main ams artifactDelete \
    --artifactID '7bLWIHhX' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 11 'ArtifactDelete' test.out

#- 12 ArtifactGetURL
./ng net.accelbyte.sdk.cli.Main ams artifactGetURL \
    --artifactID 'AEwyaVus' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 12 'ArtifactGetURL' test.out

#- 13 DevelopmentServerConfigurationList
./ng net.accelbyte.sdk.cli.Main ams developmentServerConfigurationList \
    --namespace "$AB_NAMESPACE" \
    --count '191' \
    --imageId 'iU2QDLvd' \
    --name '9X50Mppw' \
    --offset '19' \
    --sortBy 'expires_at' \
    --sortDirection 'desc' \
    > test.out 2>&1
eval_tap $? 13 'DevelopmentServerConfigurationList' test.out

#- 14 DevelopmentServerConfigurationCreate
./ng net.accelbyte.sdk.cli.Main ams developmentServerConfigurationCreate \
    --namespace "$AB_NAMESPACE" \
    --body '{"commandLineArguments": "HkDJQmmU", "expiresAt": "1973-10-10T00:00:00Z", "imageId": "FnEC9qHF", "name": "hrTMQ7Gt"}' \
    > test.out 2>&1
eval_tap $? 14 'DevelopmentServerConfigurationCreate' test.out

#- 15 DevelopmentServerConfigurationGet
./ng net.accelbyte.sdk.cli.Main ams developmentServerConfigurationGet \
    --developmentServerConfigID 'WxGtEm6e' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 15 'DevelopmentServerConfigurationGet' test.out

#- 16 DevelopmentServerConfigurationDelete
./ng net.accelbyte.sdk.cli.Main ams developmentServerConfigurationDelete \
    --developmentServerConfigID 'f4XRPtLW' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 16 'DevelopmentServerConfigurationDelete' test.out

#- 17 DevelopmentServerConfigurationPatch
./ng net.accelbyte.sdk.cli.Main ams developmentServerConfigurationPatch \
    --developmentServerConfigID 'Tx4dVzzK' \
    --namespace "$AB_NAMESPACE" \
    --body '{"commandLineArguments": "IiJ6dpBf", "expiresAt": "1985-01-14T00:00:00Z"}' \
    > test.out 2>&1
eval_tap $? 17 'DevelopmentServerConfigurationPatch' test.out

#- 18 FleetList
./ng net.accelbyte.sdk.cli.Main ams fleetList \
    --namespace "$AB_NAMESPACE" \
    --active  \
    --count '28' \
    --name 'dgSDrJii' \
    --offset '15' \
    --region 'noi1wcRv' \
    --sortBy 'name' \
    --sortDirection 'desc' \
    > test.out 2>&1
eval_tap $? 18 'FleetList' test.out

#- 19 FleetCreate
./ng net.accelbyte.sdk.cli.Main ams fleetCreate \
    --namespace "$AB_NAMESPACE" \
    --body '{"active": false, "claimKeys": ["8Z909FNN", "s8N3MWg6", "pn9Iztyw"], "dsHostConfiguration": {"instanceId": "0RLsdvNX", "serversPerVm": 68}, "fallbackFleet": "DRcO2FoL", "hibernateAfterPeriod": "LynK76hp", "imageDeploymentProfile": {"commandLine": "DvtMs2iC", "imageId": "qGWR2Hga", "portConfigurations": [{"name": "N662yZZy", "protocol": "fKIOhgcL"}, {"name": "gcYh0fuq", "protocol": "HHx0hNdJ"}, {"name": "LCFknQk0", "protocol": "W5MBsQoU"}], "timeout": {"claim": 93, "creation": 3, "drain": 21, "session": 24, "unresponsive": 94}}, "name": "a9p30ofG", "onDemand": true, "regions": [{"bufferSize": 16, "dynamicBuffer": true, "maxServerCount": 69, "minServerCount": 34, "region": "cO4xJqwZ"}, {"bufferSize": 15, "dynamicBuffer": true, "maxServerCount": 4, "minServerCount": 81, "region": "Xx0sO1d2"}, {"bufferSize": 70, "dynamicBuffer": false, "maxServerCount": 58, "minServerCount": 81, "region": "YbglthnJ"}], "samplingRules": {"coredumps": {"crashed": {"collect": false, "percentage": 59}}, "logs": {"crashed": {"collect": false, "percentage": 40}, "success": {"collect": false, "percentage": 61}, "unclaimed": {"collect": true, "percentage": 1}}}}' \
    > test.out 2>&1
eval_tap $? 19 'FleetCreate' test.out

#- 20 BulkFleetDelete
./ng net.accelbyte.sdk.cli.Main ams bulkFleetDelete \
    --namespace "$AB_NAMESPACE" \
    --body '{"fleetIds": ["mWtqpKcv", "k0uA3VRc", "9kjc1RYX"]}' \
    > test.out 2>&1
eval_tap $? 20 'BulkFleetDelete' test.out

#- 21 FleetGet
./ng net.accelbyte.sdk.cli.Main ams fleetGet \
    --fleetID '6WhdCs1S' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 21 'FleetGet' test.out

#- 22 FleetUpdate
./ng net.accelbyte.sdk.cli.Main ams fleetUpdate \
    --fleetID 'vci0OFOB' \
    --namespace "$AB_NAMESPACE" \
    --body '{"active": false, "claimKeys": ["DjaVJ0us", "xtCSfLd4", "T7uPwRWp"], "dsHostConfiguration": {"instanceId": "i6OLubXQ", "serversPerVm": 64}, "fallbackFleet": "W0K7B4He", "hibernateAfterPeriod": "V2w4Bqtm", "imageDeploymentProfile": {"commandLine": "l5SeWFwf", "imageId": "UmICHjsp", "portConfigurations": [{"name": "TlaNV1EV", "protocol": "e1WvDWE7"}, {"name": "2g8dMw6B", "protocol": "v7BOfmNY"}, {"name": "XT4HV8Vu", "protocol": "4ncNnLU0"}], "timeout": {"claim": 90, "creation": 78, "drain": 75, "session": 12, "unresponsive": 66}}, "name": "9ufZKJbw", "onDemand": true, "regions": [{"bufferSize": 34, "dynamicBuffer": true, "maxServerCount": 54, "minServerCount": 22, "region": "L2NO0fYw"}, {"bufferSize": 37, "dynamicBuffer": false, "maxServerCount": 34, "minServerCount": 50, "region": "MB4ZtGIq"}, {"bufferSize": 54, "dynamicBuffer": true, "maxServerCount": 44, "minServerCount": 68, "region": "1b4zB6KA"}], "samplingRules": {"coredumps": {"crashed": {"collect": false, "percentage": 35}}, "logs": {"crashed": {"collect": false, "percentage": 4}, "success": {"collect": true, "percentage": 80}, "unclaimed": {"collect": false, "percentage": 71}}}}' \
    > test.out 2>&1
eval_tap $? 22 'FleetUpdate' test.out

#- 23 FleetDelete
./ng net.accelbyte.sdk.cli.Main ams fleetDelete \
    --fleetID 'g5xFZ19J' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 23 'FleetDelete' test.out

#- 24 FleetArtifactSamplingRulesGet
./ng net.accelbyte.sdk.cli.Main ams fleetArtifactSamplingRulesGet \
    --fleetID 'ONUGOoEY' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 24 'FleetArtifactSamplingRulesGet' test.out

#- 25 FleetArtifactSamplingRulesSet
./ng net.accelbyte.sdk.cli.Main ams fleetArtifactSamplingRulesSet \
    --fleetID 'FmHeYDbh' \
    --namespace "$AB_NAMESPACE" \
    --body '{"coredumps": {"crashed": {"collect": true, "percentage": 0}}, "logs": {"crashed": {"collect": false, "percentage": 20}, "success": {"collect": false, "percentage": 16}, "unclaimed": {"collect": false, "percentage": 55}}}' \
    > test.out 2>&1
eval_tap $? 25 'FleetArtifactSamplingRulesSet' test.out

#- 26 FleetServers
./ng net.accelbyte.sdk.cli.Main ams fleetServers \
    --fleetID 'Z2DxNCDb' \
    --namespace "$AB_NAMESPACE" \
    --count '72' \
    --offset '10' \
    --region 'US6asSLt' \
    --serverId 'yIk6LnDI' \
    --sortBy 'mkjGuMoh' \
    --sortDirection 'asc' \
    --status 'unresponsive' \
    > test.out 2>&1
eval_tap $? 26 'FleetServers' test.out

#- 27 FleetServerHistory
./ng net.accelbyte.sdk.cli.Main ams fleetServerHistory \
    --fleetID 'DDQaBUZ7' \
    --namespace "$AB_NAMESPACE" \
    --count '15' \
    --offset '7' \
    --reason 'ZzSw7EPE' \
    --region 'P3pmdvNV' \
    --serverId 'oyyFmycO' \
    --sortDirection 'DrFuC01S' \
    --status 'FuqBmBDb' \
    > test.out 2>&1
eval_tap $? 27 'FleetServerHistory' test.out

#- 28 ImageList
./ng net.accelbyte.sdk.cli.Main ams imageList \
    --namespace "$AB_NAMESPACE" \
    --count '50' \
    --inUse 'NkKyhXvt' \
    --isProtected  \
    --name 'oebBGnc7' \
    --offset '79' \
    --sortBy 'Dfs1zbjO' \
    --sortDirection 'DLTAv5IU' \
    --status 'tdCYv3oP' \
    --tag 'rkRQ7hdD' \
    --targetArchitecture '6MmdxmV7' \
    > test.out 2>&1
eval_tap $? 28 'ImageList' test.out

#- 29 ImagesStorage
./ng net.accelbyte.sdk.cli.Main ams imagesStorage \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 29 'ImagesStorage' test.out

#- 30 ImageGet
./ng net.accelbyte.sdk.cli.Main ams imageGet \
    --imageID 'gSIqu3J2' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 30 'ImageGet' test.out

#- 31 ImageMarkForDeletion
./ng net.accelbyte.sdk.cli.Main ams imageMarkForDeletion \
    --imageID 'lTtMohSH' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 31 'ImageMarkForDeletion' test.out

#- 32 ImagePatch
./ng net.accelbyte.sdk.cli.Main ams imagePatch \
    --imageID 'uNXSaf5q' \
    --namespace "$AB_NAMESPACE" \
    --body '{"addedTags": ["4H9g76xg", "iT63mqTu", "uikpc1SB"], "isProtected": false, "name": "wBmoMjlm", "removedTags": ["uL6DltCi", "DtppVTAF", "kfAzaKlw"]}' \
    > test.out 2>&1
eval_tap $? 32 'ImagePatch' test.out

#- 33 ImageUnmarkForDeletion
./ng net.accelbyte.sdk.cli.Main ams imageUnmarkForDeletion \
    --imageID 'IwdcUrEZ' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 33 'ImageUnmarkForDeletion' test.out

#- 34 QoSRegionsGet
./ng net.accelbyte.sdk.cli.Main ams qoSRegionsGet \
    --namespace "$AB_NAMESPACE" \
    --status 'cIvu3vWa' \
    > test.out 2>&1
eval_tap $? 34 'QoSRegionsGet' test.out

#- 35 QoSRegionsUpdate
./ng net.accelbyte.sdk.cli.Main ams qoSRegionsUpdate \
    --namespace "$AB_NAMESPACE" \
    --region '2WUW8HeO' \
    --body '{"status": "atjfKiCw"}' \
    > test.out 2>&1
eval_tap $? 35 'QoSRegionsUpdate' test.out

#- 36 InfoRegions
./ng net.accelbyte.sdk.cli.Main ams infoRegions \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 36 'InfoRegions' test.out

#- 37 FleetServerInfo
./ng net.accelbyte.sdk.cli.Main ams fleetServerInfo \
    --namespace "$AB_NAMESPACE" \
    --serverID 'wALchapw' \
    > test.out 2>&1
eval_tap $? 37 'FleetServerInfo' test.out

#- 38 FleetServerConnectionInfo
./ng net.accelbyte.sdk.cli.Main ams fleetServerConnectionInfo \
    --namespace "$AB_NAMESPACE" \
    --serverID 'nsFaQNy5' \
    > test.out 2>&1
eval_tap $? 38 'FleetServerConnectionInfo' test.out

#- 39 ServerHistory
./ng net.accelbyte.sdk.cli.Main ams serverHistory \
    --namespace "$AB_NAMESPACE" \
    --serverID 'rET9ZG3d' \
    > test.out 2>&1
eval_tap $? 39 'ServerHistory' test.out

#- 40 InfoSupportedInstances
./ng net.accelbyte.sdk.cli.Main ams infoSupportedInstances \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 40 'InfoSupportedInstances' test.out

#- 41 AccountGet
./ng net.accelbyte.sdk.cli.Main ams accountGet \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 41 'AccountGet' test.out

#- 42 FleetClaimByID
./ng net.accelbyte.sdk.cli.Main ams fleetClaimByID \
    --fleetID 'jx417Omv' \
    --namespace "$AB_NAMESPACE" \
    --body '{"region": "9Wp5u4fV", "sessionId": "JcfMYA5y"}' \
    > test.out 2>&1
eval_tap $? 42 'FleetClaimByID' test.out

#- 43 LocalWatchdogConnect
./ng net.accelbyte.sdk.cli.Main ams localWatchdogConnect \
    --namespace "$AB_NAMESPACE" \
    --watchdogID 'h4iC2U0c' \
    > test.out 2>&1
eval_tap $? 43 'LocalWatchdogConnect' test.out

#- 44 FleetClaimByKeys
./ng net.accelbyte.sdk.cli.Main ams fleetClaimByKeys \
    --namespace "$AB_NAMESPACE" \
    --body '{"claimKeys": ["OPiosWuA", "YNTbAbpl", "DPeP2pfg"], "regions": ["2cTxKuEY", "5gAOWbR4", "DoC1AyLm"], "sessionId": "lmzvkKd6"}' \
    > test.out 2>&1
eval_tap $? 44 'FleetClaimByKeys' test.out

#- 45 WatchdogConnect
./ng net.accelbyte.sdk.cli.Main ams watchdogConnect \
    --namespace "$AB_NAMESPACE" \
    --watchdogID 'ur7jOobo' \
    > test.out 2>&1
eval_tap $? 45 'WatchdogConnect' test.out

#- 46 UploadURLGet
./ng net.accelbyte.sdk.cli.Main ams uploadURLGet \
    > test.out 2>&1
eval_tap $? 46 'UploadURLGet' test.out

#- 47 Func1
./ng net.accelbyte.sdk.cli.Main ams func1 \
    > test.out 2>&1
eval_tap $? 47 'Func1' test.out

#- 48 BasicHealthCheck
./ng net.accelbyte.sdk.cli.Main ams basicHealthCheck \
    > test.out 2>&1
eval_tap $? 48 'BasicHealthCheck' test.out


rm -f "tmp.dat"

exit $EXIT_CODE