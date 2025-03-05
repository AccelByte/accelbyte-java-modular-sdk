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
    --body '{"name": "kZX8uQHO"}' \
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
    --body '{"token": "45EHIZbD"}' \
    > test.out 2>&1
eval_tap $? 7 'AdminAccountLink' test.out

#- 8 ArtifactGet
./ng net.accelbyte.sdk.cli.Main ams artifactGet \
    --namespace "$AB_NAMESPACE" \
    --artifactType 'tRTE3zvN' \
    --count '478' \
    --endDate 'SymsgYjj' \
    --fleetID '7Xgw0fYv' \
    --imageID '5h3Qxuj6' \
    --maxSize '99' \
    --minSize '98' \
    --offset '70' \
    --region 'cqWIVnIl' \
    --serverId '7tj3Bj93' \
    --sortBy 'Htgrceqy' \
    --sortDirection 'desc' \
    --startDate 'FGOipPLM' \
    --status 'ARAzc6kX' \
    > test.out 2>&1
eval_tap $? 8 'ArtifactGet' test.out

#- 9 ArtifactBulkDelete
./ng net.accelbyte.sdk.cli.Main ams artifactBulkDelete \
    --namespace "$AB_NAMESPACE" \
    --artifactType 'M0cM3Hr6' \
    --fleetId 'mIFGOkF0' \
    --uploadedBefore '1999-09-29' \
    > test.out 2>&1
eval_tap $? 9 'ArtifactBulkDelete' test.out

#- 10 ArtifactUsageGet
./ng net.accelbyte.sdk.cli.Main ams artifactUsageGet \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 10 'ArtifactUsageGet' test.out

#- 11 ArtifactDelete
./ng net.accelbyte.sdk.cli.Main ams artifactDelete \
    --artifactID '5zvVNKnv' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 11 'ArtifactDelete' test.out

#- 12 ArtifactGetURL
./ng net.accelbyte.sdk.cli.Main ams artifactGetURL \
    --artifactID 'MrcbmeVT' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 12 'ArtifactGetURL' test.out

#- 13 DevelopmentServerConfigurationList
./ng net.accelbyte.sdk.cli.Main ams developmentServerConfigurationList \
    --namespace "$AB_NAMESPACE" \
    --count '437' \
    --offset '91' \
    > test.out 2>&1
eval_tap $? 13 'DevelopmentServerConfigurationList' test.out

#- 14 DevelopmentServerConfigurationCreate
./ng net.accelbyte.sdk.cli.Main ams developmentServerConfigurationCreate \
    --namespace "$AB_NAMESPACE" \
    --body '{"commandLineArguments": "9TExrFxx", "expiresAt": "1996-05-21T00:00:00Z", "imageId": "L9OESjq7", "name": "KlE5BGPW"}' \
    > test.out 2>&1
eval_tap $? 14 'DevelopmentServerConfigurationCreate' test.out

#- 15 DevelopmentServerConfigurationGet
./ng net.accelbyte.sdk.cli.Main ams developmentServerConfigurationGet \
    --developmentServerConfigID 'h3txfp8d' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 15 'DevelopmentServerConfigurationGet' test.out

#- 16 DevelopmentServerConfigurationDelete
./ng net.accelbyte.sdk.cli.Main ams developmentServerConfigurationDelete \
    --developmentServerConfigID '0U1PlHzJ' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 16 'DevelopmentServerConfigurationDelete' test.out

#- 17 FleetList
./ng net.accelbyte.sdk.cli.Main ams fleetList \
    --namespace "$AB_NAMESPACE" \
    --active  \
    --count '24' \
    --name 'nc8d5cmA' \
    --offset '75' \
    --region 'jHlLGK0t' \
    --sortBy 'name' \
    --sortDirection 'asc' \
    > test.out 2>&1
eval_tap $? 17 'FleetList' test.out

#- 18 FleetCreate
./ng net.accelbyte.sdk.cli.Main ams fleetCreate \
    --namespace "$AB_NAMESPACE" \
    --body '{"active": true, "claimKeys": ["vfvhG2Zp", "rSMEGmJg", "l9EyjP9f"], "dsHostConfiguration": {"instanceId": "BCNTiZAs", "serversPerVm": 27}, "fallbackFleet": "3CXvtySc", "imageDeploymentProfile": {"commandLine": "zoPJWGxW", "imageId": "ipatYhMS", "portConfigurations": [{"name": "VGqM8wu0", "protocol": "BoUipIX1"}, {"name": "5WWMr4wO", "protocol": "EpQkAyPZ"}, {"name": "zvo6FFPK", "protocol": "4fc54GMi"}], "timeout": {"claim": 13, "creation": 86, "drain": 19, "session": 22, "unresponsive": 31}}, "name": "saom7Y5E", "onDemand": true, "regions": [{"bufferSize": 50, "dynamicBuffer": true, "maxServerCount": 49, "minServerCount": 54, "region": "63Hoc2LF"}, {"bufferSize": 9, "dynamicBuffer": false, "maxServerCount": 10, "minServerCount": 74, "region": "Ke0E7Nsq"}, {"bufferSize": 8, "dynamicBuffer": false, "maxServerCount": 89, "minServerCount": 50, "region": "Bjwq6zvX"}], "samplingRules": {"coredumps": {"crashed": {"collect": false, "percentage": 1}}, "logs": {"crashed": {"collect": true, "percentage": 8}, "success": {"collect": true, "percentage": 16}, "unclaimed": {"collect": false, "percentage": 47}}}}' \
    > test.out 2>&1
eval_tap $? 18 'FleetCreate' test.out

#- 19 FleetGet
./ng net.accelbyte.sdk.cli.Main ams fleetGet \
    --fleetID 'sTbaResr' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 19 'FleetGet' test.out

#- 20 FleetUpdate
./ng net.accelbyte.sdk.cli.Main ams fleetUpdate \
    --fleetID 'HRLz1Ekw' \
    --namespace "$AB_NAMESPACE" \
    --body '{"active": false, "claimKeys": ["ynth6U9w", "Q5Vwvshw", "xuonxsa4"], "dsHostConfiguration": {"instanceId": "mgHa1iOr", "serversPerVm": 64}, "fallbackFleet": "fAnQQX8D", "imageDeploymentProfile": {"commandLine": "kPixFwi9", "imageId": "IIWyOPt2", "portConfigurations": [{"name": "RBRqG58J", "protocol": "Or0MvPsu"}, {"name": "MLcSKUqM", "protocol": "UbCCVe2b"}, {"name": "36x3o6Yl", "protocol": "N6GZZ5CY"}], "timeout": {"claim": 25, "creation": 65, "drain": 14, "session": 21, "unresponsive": 89}}, "name": "361cPHQT", "onDemand": false, "regions": [{"bufferSize": 42, "dynamicBuffer": true, "maxServerCount": 9, "minServerCount": 3, "region": "ZfjJoYx7"}, {"bufferSize": 72, "dynamicBuffer": true, "maxServerCount": 95, "minServerCount": 17, "region": "MPk1uVAN"}, {"bufferSize": 83, "dynamicBuffer": false, "maxServerCount": 27, "minServerCount": 18, "region": "inTIiz3Q"}], "samplingRules": {"coredumps": {"crashed": {"collect": false, "percentage": 51}}, "logs": {"crashed": {"collect": true, "percentage": 3}, "success": {"collect": false, "percentage": 98}, "unclaimed": {"collect": true, "percentage": 20}}}}' \
    > test.out 2>&1
eval_tap $? 20 'FleetUpdate' test.out

#- 21 FleetDelete
./ng net.accelbyte.sdk.cli.Main ams fleetDelete \
    --fleetID 'YRU5oeVA' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 21 'FleetDelete' test.out

#- 22 FleetArtifactSamplingRulesGet
./ng net.accelbyte.sdk.cli.Main ams fleetArtifactSamplingRulesGet \
    --fleetID 'GPyjX6rf' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 22 'FleetArtifactSamplingRulesGet' test.out

#- 23 FleetArtifactSamplingRulesSet
./ng net.accelbyte.sdk.cli.Main ams fleetArtifactSamplingRulesSet \
    --fleetID 'V1mOfELH' \
    --namespace "$AB_NAMESPACE" \
    --body '{"coredumps": {"crashed": {"collect": true, "percentage": 90}}, "logs": {"crashed": {"collect": true, "percentage": 89}, "success": {"collect": true, "percentage": 26}, "unclaimed": {"collect": true, "percentage": 98}}}' \
    > test.out 2>&1
eval_tap $? 23 'FleetArtifactSamplingRulesSet' test.out

#- 24 FleetServers
./ng net.accelbyte.sdk.cli.Main ams fleetServers \
    --fleetID '9AeUbt2P' \
    --namespace "$AB_NAMESPACE" \
    --count '26' \
    --offset '17' \
    --region '0PgqMIKa' \
    --serverId 'cSJhCE8C' \
    --sortBy 'vWiGABdT' \
    --sortDirection 'asc' \
    --status 'draining' \
    > test.out 2>&1
eval_tap $? 24 'FleetServers' test.out

#- 25 FleetServerHistory
./ng net.accelbyte.sdk.cli.Main ams fleetServerHistory \
    --fleetID 'bw4NGkKI' \
    --namespace "$AB_NAMESPACE" \
    --count '79' \
    --offset '3' \
    --reason 'UhSS6Ozi' \
    --region '69FsPrlW' \
    --serverId '3ZfdGYi0' \
    --sortDirection '91I6xo4Y' \
    --status 'v8fCPTiF' \
    > test.out 2>&1
eval_tap $? 25 'FleetServerHistory' test.out

#- 26 ImageList
./ng net.accelbyte.sdk.cli.Main ams imageList \
    --namespace "$AB_NAMESPACE" \
    --count '80' \
    --inUse '5zW3IJMO' \
    --isProtected  \
    --name 'g1Sq0bDK' \
    --offset '88' \
    --sortBy 'OcPvmIt4' \
    --sortDirection 'NmxRkzp3' \
    --status '6qcsI9lr' \
    --tag 'VX8woBDH' \
    > test.out 2>&1
eval_tap $? 26 'ImageList' test.out

#- 27 ImagesStorage
./ng net.accelbyte.sdk.cli.Main ams imagesStorage \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 27 'ImagesStorage' test.out

#- 28 ImageGet
./ng net.accelbyte.sdk.cli.Main ams imageGet \
    --imageID 'haddOKrS' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 28 'ImageGet' test.out

#- 29 ImageMarkForDeletion
./ng net.accelbyte.sdk.cli.Main ams imageMarkForDeletion \
    --imageID '3J1YlGif' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 29 'ImageMarkForDeletion' test.out

#- 30 ImagePatch
./ng net.accelbyte.sdk.cli.Main ams imagePatch \
    --imageID '3jxeVMfN' \
    --namespace "$AB_NAMESPACE" \
    --body '{"addedTags": ["NTtKQSiq", "3W5LWuup", "FeBGS5pV"], "isProtected": true, "name": "ZW4mEIIE", "removedTags": ["NKtm7bL4", "CivUbKkO", "yWJrPhG4"]}' \
    > test.out 2>&1
eval_tap $? 30 'ImagePatch' test.out

#- 31 ImageUnmarkForDeletion
./ng net.accelbyte.sdk.cli.Main ams imageUnmarkForDeletion \
    --imageID 'EABWN9CE' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 31 'ImageUnmarkForDeletion' test.out

#- 32 QoSRegionsGet
./ng net.accelbyte.sdk.cli.Main ams qoSRegionsGet \
    --namespace "$AB_NAMESPACE" \
    --status 'SlQp4mqL' \
    > test.out 2>&1
eval_tap $? 32 'QoSRegionsGet' test.out

#- 33 QoSRegionsUpdate
./ng net.accelbyte.sdk.cli.Main ams qoSRegionsUpdate \
    --namespace "$AB_NAMESPACE" \
    --region 'yAgv2Fi2' \
    --body '{"status": "dsTbVWiT"}' \
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
    --serverID 'iv4AZtNH' \
    > test.out 2>&1
eval_tap $? 35 'FleetServerInfo' test.out

#- 36 FleetServerConnectionInfo
./ng net.accelbyte.sdk.cli.Main ams fleetServerConnectionInfo \
    --namespace "$AB_NAMESPACE" \
    --serverID 'Dn1uyBP7' \
    > test.out 2>&1
eval_tap $? 36 'FleetServerConnectionInfo' test.out

#- 37 ServerHistory
./ng net.accelbyte.sdk.cli.Main ams serverHistory \
    --namespace "$AB_NAMESPACE" \
    --serverID 'wdnpu7Qn' \
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
    --fleetID 'Ts19x7tr' \
    --namespace "$AB_NAMESPACE" \
    --body '{"region": "gAC3H2j3", "sessionId": "m0BnNrrP"}' \
    > test.out 2>&1
eval_tap $? 40 'FleetClaimByID' test.out

#- 41 LocalWatchdogConnect
./ng net.accelbyte.sdk.cli.Main ams localWatchdogConnect \
    --namespace "$AB_NAMESPACE" \
    --watchdogID 'oNOCfYKg' \
    > test.out 2>&1
eval_tap $? 41 'LocalWatchdogConnect' test.out

#- 42 FleetClaimByKeys
./ng net.accelbyte.sdk.cli.Main ams fleetClaimByKeys \
    --namespace "$AB_NAMESPACE" \
    --body '{"claimKeys": ["iqTjBMEo", "c6zP1aSQ", "3xR8OYI9"], "regions": ["Mot7vHms", "JMhZYfmE", "5DvzHo7Y"], "sessionId": "yEHl8c8S"}' \
    > test.out 2>&1
eval_tap $? 42 'FleetClaimByKeys' test.out

#- 43 WatchdogConnect
./ng net.accelbyte.sdk.cli.Main ams watchdogConnect \
    --namespace "$AB_NAMESPACE" \
    --watchdogID 'vdH5sJke' \
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