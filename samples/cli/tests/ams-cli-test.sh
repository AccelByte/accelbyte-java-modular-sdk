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
    --body '{"name": "Yg40MSBS"}' \
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
    --body '{"token": "lsP77vnX"}' \
    > test.out 2>&1
eval_tap $? 7 'AdminAccountLink' test.out

#- 8 ArtifactGet
./ng net.accelbyte.sdk.cli.Main ams artifactGet \
    --namespace "$AB_NAMESPACE" \
    --artifactType 'JtG389jM' \
    --count '344' \
    --endDate '3XZp8FG8' \
    --fleetID 'Iy1emxxJ' \
    --imageID '8FM5aRjx' \
    --maxSize '25' \
    --minSize '5' \
    --offset '11' \
    --region 'klHoGXrK' \
    --serverId 'E9inHlIG' \
    --sortBy 'ynextWtO' \
    --sortDirection 'desc' \
    --startDate 'u7iB6JiM' \
    --status 'DMWzdaR4' \
    > test.out 2>&1
eval_tap $? 8 'ArtifactGet' test.out

#- 9 ArtifactBulkDelete
./ng net.accelbyte.sdk.cli.Main ams artifactBulkDelete \
    --namespace "$AB_NAMESPACE" \
    --artifactType '98DeQsTU' \
    --fleetId 'ohURihh3' \
    --uploadedBefore '1976-10-06' \
    > test.out 2>&1
eval_tap $? 9 'ArtifactBulkDelete' test.out

#- 10 ArtifactUsageGet
./ng net.accelbyte.sdk.cli.Main ams artifactUsageGet \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 10 'ArtifactUsageGet' test.out

#- 11 ArtifactDelete
./ng net.accelbyte.sdk.cli.Main ams artifactDelete \
    --artifactID 'qeONYybN' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 11 'ArtifactDelete' test.out

#- 12 ArtifactGetURL
./ng net.accelbyte.sdk.cli.Main ams artifactGetURL \
    --artifactID 'SNRPMRG9' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 12 'ArtifactGetURL' test.out

#- 13 DevelopmentServerConfigurationList
./ng net.accelbyte.sdk.cli.Main ams developmentServerConfigurationList \
    --namespace "$AB_NAMESPACE" \
    --count '178' \
    --imageId 'n1SrLmpS' \
    --name 'cRLY8k5l' \
    --offset '90' \
    --sortBy 'name' \
    --sortDirection 'desc' \
    > test.out 2>&1
eval_tap $? 13 'DevelopmentServerConfigurationList' test.out

#- 14 DevelopmentServerConfigurationCreate
./ng net.accelbyte.sdk.cli.Main ams developmentServerConfigurationCreate \
    --namespace "$AB_NAMESPACE" \
    --body '{"commandLineArguments": "JnMzxuWg", "expiresAt": "1988-05-18T00:00:00Z", "imageId": "baWdKAd5", "name": "k8oOc32F"}' \
    > test.out 2>&1
eval_tap $? 14 'DevelopmentServerConfigurationCreate' test.out

#- 15 DevelopmentServerConfigurationGet
./ng net.accelbyte.sdk.cli.Main ams developmentServerConfigurationGet \
    --developmentServerConfigID '8pcdhoMS' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 15 'DevelopmentServerConfigurationGet' test.out

#- 16 DevelopmentServerConfigurationDelete
./ng net.accelbyte.sdk.cli.Main ams developmentServerConfigurationDelete \
    --developmentServerConfigID '7n2APcv8' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 16 'DevelopmentServerConfigurationDelete' test.out

#- 17 DevelopmentServerConfigurationPatch
./ng net.accelbyte.sdk.cli.Main ams developmentServerConfigurationPatch \
    --developmentServerConfigID 'OXlEkqUm' \
    --namespace "$AB_NAMESPACE" \
    --body '{"commandLineArguments": "4Puo1sxH", "expiresAt": "1997-07-08T00:00:00Z"}' \
    > test.out 2>&1
eval_tap $? 17 'DevelopmentServerConfigurationPatch' test.out

#- 18 FleetList
./ng net.accelbyte.sdk.cli.Main ams fleetList \
    --namespace "$AB_NAMESPACE" \
    --active  \
    --count '56' \
    --name 'OHkqELkZ' \
    --offset '84' \
    --region '89DI4Kf2' \
    --sortBy 'active' \
    --sortDirection 'asc' \
    > test.out 2>&1
eval_tap $? 18 'FleetList' test.out

#- 19 FleetCreate
./ng net.accelbyte.sdk.cli.Main ams fleetCreate \
    --namespace "$AB_NAMESPACE" \
    --body '{"active": false, "claimKeys": ["RUjk5cTj", "aq8uzmGK", "Ir7TwWl4"], "dsHostConfiguration": {"instanceId": "y5sABQi5", "serversPerVm": 82}, "fallbackFleet": "FNNaFW2T", "hibernateAfterPeriod": "6BsMaYMR", "imageDeploymentProfile": {"commandLine": "Rtm9vaNB", "imageId": "2JvPuj1g", "portConfigurations": [{"name": "pKwJJXBL", "protocol": "w691IFi2"}, {"name": "N9J8DuQv", "protocol": "Qh6WQQ7e"}, {"name": "G5zKnAVb", "protocol": "zUDFPiXt"}], "timeout": {"claim": 10, "creation": 79, "drain": 95, "session": 91, "unresponsive": 5}}, "name": "a2WlkN2h", "onDemand": true, "regions": [{"bufferSize": 62, "dynamicBuffer": false, "maxServerCount": 18, "minServerCount": 35, "region": "g9P71wkt"}, {"bufferSize": 65, "dynamicBuffer": true, "maxServerCount": 72, "minServerCount": 80, "region": "Vi0wPEUU"}, {"bufferSize": 18, "dynamicBuffer": true, "maxServerCount": 10, "minServerCount": 36, "region": "nO2C9ooF"}], "samplingRules": {"coredumps": {"crashed": {"collect": true, "percentage": 68}}, "logs": {"crashed": {"collect": false, "percentage": 67}, "success": {"collect": true, "percentage": 92}, "unclaimed": {"collect": false, "percentage": 76}}}}' \
    > test.out 2>&1
eval_tap $? 19 'FleetCreate' test.out

#- 20 BulkFleetDelete
./ng net.accelbyte.sdk.cli.Main ams bulkFleetDelete \
    --namespace "$AB_NAMESPACE" \
    --body '{"fleetIds": ["KzOS6Ulm", "182bzKWc", "NBDvmhgt"]}' \
    > test.out 2>&1
eval_tap $? 20 'BulkFleetDelete' test.out

#- 21 FleetGet
./ng net.accelbyte.sdk.cli.Main ams fleetGet \
    --fleetID 'p8tgQxD1' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 21 'FleetGet' test.out

#- 22 FleetUpdate
./ng net.accelbyte.sdk.cli.Main ams fleetUpdate \
    --fleetID 'hGLCbNTR' \
    --namespace "$AB_NAMESPACE" \
    --body '{"active": true, "claimKeys": ["2gnCPvOo", "50xDsTaI", "wdRmJeii"], "dsHostConfiguration": {"instanceId": "6WXGaKVQ", "serversPerVm": 45}, "fallbackFleet": "JsAP8OhC", "hibernateAfterPeriod": "43idQ02B", "imageDeploymentProfile": {"commandLine": "YeZOOTIf", "imageId": "V4HqqrRh", "portConfigurations": [{"name": "WedQzjbk", "protocol": "lSPC3BUT"}, {"name": "P9fsBDwH", "protocol": "x322GL0W"}, {"name": "Nf8MtQfw", "protocol": "C4oglXqL"}], "timeout": {"claim": 84, "creation": 91, "drain": 78, "session": 6, "unresponsive": 8}}, "name": "kJ7Q9rd7", "onDemand": false, "regions": [{"bufferSize": 56, "dynamicBuffer": true, "maxServerCount": 11, "minServerCount": 60, "region": "CCppnaVV"}, {"bufferSize": 19, "dynamicBuffer": true, "maxServerCount": 54, "minServerCount": 13, "region": "aDaNi34A"}, {"bufferSize": 62, "dynamicBuffer": false, "maxServerCount": 24, "minServerCount": 61, "region": "kxSFLNP9"}], "samplingRules": {"coredumps": {"crashed": {"collect": true, "percentage": 54}}, "logs": {"crashed": {"collect": false, "percentage": 54}, "success": {"collect": true, "percentage": 74}, "unclaimed": {"collect": true, "percentage": 4}}}}' \
    > test.out 2>&1
eval_tap $? 22 'FleetUpdate' test.out

#- 23 FleetDelete
./ng net.accelbyte.sdk.cli.Main ams fleetDelete \
    --fleetID 'lXXc3d6o' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 23 'FleetDelete' test.out

#- 24 FleetArtifactSamplingRulesGet
./ng net.accelbyte.sdk.cli.Main ams fleetArtifactSamplingRulesGet \
    --fleetID 'R3VkBUmE' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 24 'FleetArtifactSamplingRulesGet' test.out

#- 25 FleetArtifactSamplingRulesSet
./ng net.accelbyte.sdk.cli.Main ams fleetArtifactSamplingRulesSet \
    --fleetID 'OObjcd1m' \
    --namespace "$AB_NAMESPACE" \
    --body '{"coredumps": {"crashed": {"collect": false, "percentage": 39}}, "logs": {"crashed": {"collect": true, "percentage": 97}, "success": {"collect": false, "percentage": 47}, "unclaimed": {"collect": false, "percentage": 92}}}' \
    > test.out 2>&1
eval_tap $? 25 'FleetArtifactSamplingRulesSet' test.out

#- 26 FleetServers
./ng net.accelbyte.sdk.cli.Main ams fleetServers \
    --fleetID 'M0bPLquI' \
    --namespace "$AB_NAMESPACE" \
    --count '94' \
    --offset '26' \
    --region 'YXPwpxSy' \
    --serverId 'KbA3aVh4' \
    --sortBy 'hdnlswcw' \
    --sortDirection 'asc' \
    --status 'crash backoff' \
    > test.out 2>&1
eval_tap $? 26 'FleetServers' test.out

#- 27 FleetServerHistory
./ng net.accelbyte.sdk.cli.Main ams fleetServerHistory \
    --fleetID '8dl5iEgr' \
    --namespace "$AB_NAMESPACE" \
    --count '6' \
    --offset '39' \
    --reason 'jJ9leInj' \
    --region 'Ke7SNyUL' \
    --serverId 'GhHoCSjT' \
    --sortDirection '1EPLLBV9' \
    --status 'cfLL1hVv' \
    > test.out 2>&1
eval_tap $? 27 'FleetServerHistory' test.out

#- 28 ImageList
./ng net.accelbyte.sdk.cli.Main ams imageList \
    --namespace "$AB_NAMESPACE" \
    --count '5' \
    --inUse 'Hnhs6Y44' \
    --isProtected  \
    --name 'PKpBXN4z' \
    --offset '86' \
    --sortBy '4PnRKS8B' \
    --sortDirection 'jXASwwGW' \
    --status '1yHXg4X4' \
    --tag 'S2HWCjt8' \
    --targetArchitecture 'l1EI5gc3' \
    > test.out 2>&1
eval_tap $? 28 'ImageList' test.out

#- 29 ImagesStorage
./ng net.accelbyte.sdk.cli.Main ams imagesStorage \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 29 'ImagesStorage' test.out

#- 30 ImageGet
./ng net.accelbyte.sdk.cli.Main ams imageGet \
    --imageID 'sUFA7s8G' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 30 'ImageGet' test.out

#- 31 ImageMarkForDeletion
./ng net.accelbyte.sdk.cli.Main ams imageMarkForDeletion \
    --imageID '8jI5oy5D' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 31 'ImageMarkForDeletion' test.out

#- 32 ImagePatch
./ng net.accelbyte.sdk.cli.Main ams imagePatch \
    --imageID 'AZuEFPyY' \
    --namespace "$AB_NAMESPACE" \
    --body '{"addedTags": ["vuFdonwL", "hzXsEbSL", "rJ2RFyiC"], "isProtected": false, "name": "gIJCuOdo", "removedTags": ["6ZF1ZbUg", "e3O7EwmL", "D5mbN2e9"]}' \
    > test.out 2>&1
eval_tap $? 32 'ImagePatch' test.out

#- 33 ImageUnmarkForDeletion
./ng net.accelbyte.sdk.cli.Main ams imageUnmarkForDeletion \
    --imageID 'uf9t0yTY' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 33 'ImageUnmarkForDeletion' test.out

#- 34 QoSRegionsGet
./ng net.accelbyte.sdk.cli.Main ams qoSRegionsGet \
    --namespace "$AB_NAMESPACE" \
    --status 'n99wLzxE' \
    > test.out 2>&1
eval_tap $? 34 'QoSRegionsGet' test.out

#- 35 QoSRegionsUpdate
./ng net.accelbyte.sdk.cli.Main ams qoSRegionsUpdate \
    --namespace "$AB_NAMESPACE" \
    --region 'OV0Pqnf1' \
    --body '{"status": "EFzQKgyM"}' \
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
    --serverID 'STGilt6e' \
    > test.out 2>&1
eval_tap $? 37 'FleetServerInfo' test.out

#- 38 FleetServerConnectionInfo
./ng net.accelbyte.sdk.cli.Main ams fleetServerConnectionInfo \
    --namespace "$AB_NAMESPACE" \
    --serverID 'ZYFk9rKA' \
    > test.out 2>&1
eval_tap $? 38 'FleetServerConnectionInfo' test.out

#- 39 ServerHistory
./ng net.accelbyte.sdk.cli.Main ams serverHistory \
    --namespace "$AB_NAMESPACE" \
    --serverID 'pEPgZaLS' \
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
    --fleetID 'B5HcS2NI' \
    --namespace "$AB_NAMESPACE" \
    --body '{"region": "oQDqI85e", "sessionId": "WZUsF7hD"}' \
    > test.out 2>&1
eval_tap $? 42 'FleetClaimByID' test.out

#- 43 LocalWatchdogConnect
./ng net.accelbyte.sdk.cli.Main ams localWatchdogConnect \
    --namespace "$AB_NAMESPACE" \
    --watchdogID 'VBTgao8E' \
    > test.out 2>&1
eval_tap $? 43 'LocalWatchdogConnect' test.out

#- 44 FleetClaimByKeys
./ng net.accelbyte.sdk.cli.Main ams fleetClaimByKeys \
    --namespace "$AB_NAMESPACE" \
    --body '{"claimKeys": ["o6sXCNeV", "R8ckrhqK", "jLakWwsU"], "regions": ["oV1t7ZK0", "5f9EqQKt", "9KsQIaXP"], "sessionId": "IMGcTcRh"}' \
    > test.out 2>&1
eval_tap $? 44 'FleetClaimByKeys' test.out

#- 45 WatchdogConnect
./ng net.accelbyte.sdk.cli.Main ams watchdogConnect \
    --namespace "$AB_NAMESPACE" \
    --watchdogID 'XNlRFCle' \
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