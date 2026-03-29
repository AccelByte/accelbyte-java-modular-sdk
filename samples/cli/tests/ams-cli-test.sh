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
    --body '{"name": "vb6Yrrtl"}' \
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
    --body '{"token": "wSsbXWdW"}' \
    > test.out 2>&1
eval_tap $? 7 'AdminAccountLink' test.out

#- 8 ArtifactGet
./ng net.accelbyte.sdk.cli.Main ams artifactGet \
    --namespace "$AB_NAMESPACE" \
    --artifactType 'dNla0iP3' \
    --count '108' \
    --endDate 'aRnPlRFH' \
    --fleetID 'Fmp4Qg5S' \
    --imageID 'dyifJxoX' \
    --maxSize '39' \
    --minSize '20' \
    --offset '82' \
    --region 'yXAOsx7W' \
    --serverId 'd1v9ZgXn' \
    --sortBy 'DrQqEzif' \
    --sortDirection 'asc' \
    --startDate 'DhrGBYxM' \
    --status 'SuwuurRN' \
    > test.out 2>&1
eval_tap $? 8 'ArtifactGet' test.out

#- 9 ArtifactBulkDelete
./ng net.accelbyte.sdk.cli.Main ams artifactBulkDelete \
    --namespace "$AB_NAMESPACE" \
    --artifactType '4Qkcq5ZA' \
    --fleetId 'Etc4R06q' \
    --uploadedBefore '1996-02-10' \
    > test.out 2>&1
eval_tap $? 9 'ArtifactBulkDelete' test.out

#- 10 ArtifactUsageGet
./ng net.accelbyte.sdk.cli.Main ams artifactUsageGet \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 10 'ArtifactUsageGet' test.out

#- 11 ArtifactDelete
./ng net.accelbyte.sdk.cli.Main ams artifactDelete \
    --artifactID '12VyldhZ' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 11 'ArtifactDelete' test.out

#- 12 ArtifactGetURL
./ng net.accelbyte.sdk.cli.Main ams artifactGetURL \
    --artifactID 'mmKdVkM0' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 12 'ArtifactGetURL' test.out

#- 13 DevelopmentServerConfigurationList
./ng net.accelbyte.sdk.cli.Main ams developmentServerConfigurationList \
    --namespace "$AB_NAMESPACE" \
    --count '116' \
    --imageId 'Z4U17CyE' \
    --name 'FGCN1m9F' \
    --offset '52' \
    --sortBy 'expires_at' \
    --sortDirection 'asc' \
    > test.out 2>&1
eval_tap $? 13 'DevelopmentServerConfigurationList' test.out

#- 14 DevelopmentServerConfigurationCreate
./ng net.accelbyte.sdk.cli.Main ams developmentServerConfigurationCreate \
    --namespace "$AB_NAMESPACE" \
    --body '{"commandLineArguments": "Pmrr7akN", "expiresAt": "1986-04-29T00:00:00Z", "imageId": "Ipl3o02p", "name": "1uRbmacA"}' \
    > test.out 2>&1
eval_tap $? 14 'DevelopmentServerConfigurationCreate' test.out

#- 15 DevelopmentServerConfigurationGet
./ng net.accelbyte.sdk.cli.Main ams developmentServerConfigurationGet \
    --developmentServerConfigID '1qrgoWUl' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 15 'DevelopmentServerConfigurationGet' test.out

#- 16 DevelopmentServerConfigurationDelete
./ng net.accelbyte.sdk.cli.Main ams developmentServerConfigurationDelete \
    --developmentServerConfigID '3x5hwt2C' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 16 'DevelopmentServerConfigurationDelete' test.out

#- 17 DevelopmentServerConfigurationPatch
./ng net.accelbyte.sdk.cli.Main ams developmentServerConfigurationPatch \
    --developmentServerConfigID 'bOV2MZhv' \
    --namespace "$AB_NAMESPACE" \
    --body '{"commandLineArguments": "Nbd2iaKg", "expiresAt": "1983-07-24T00:00:00Z"}' \
    > test.out 2>&1
eval_tap $? 17 'DevelopmentServerConfigurationPatch' test.out

#- 18 FleetList
./ng net.accelbyte.sdk.cli.Main ams fleetList \
    --namespace "$AB_NAMESPACE" \
    --active  \
    --count '46' \
    --name 'xaMRAFFd' \
    --offset '52' \
    --region 'kwAaWBU7' \
    --sortBy 'name' \
    --sortDirection 'asc' \
    > test.out 2>&1
eval_tap $? 18 'FleetList' test.out

#- 19 FleetCreate
./ng net.accelbyte.sdk.cli.Main ams fleetCreate \
    --namespace "$AB_NAMESPACE" \
    --body '{"active": false, "claimKeys": ["GlKo9blu", "9EFXmZX6", "TjtAjG9I"], "dsHostConfiguration": {"instanceId": "oeyyBdzn", "serversPerVm": 84}, "fallbackFleet": "FMhkAqYJ", "hibernateAfterPeriod": "cvfzN9AP", "imageDeploymentProfile": {"commandLine": "FH6kue9S", "imageId": "nJwaA1Mb", "portConfigurations": [{"name": "hjHiBlel", "protocol": "jrpMbPwg"}, {"name": "4v3hzftl", "protocol": "kcUKpdwB"}, {"name": "SwNxpIsB", "protocol": "PYR2WB7l"}], "timeout": {"claim": 99, "creation": 60, "drain": 49, "session": 75, "unresponsive": 70}}, "name": "c5c0th1Q", "onDemand": false, "regions": [{"bufferSize": 45, "dynamicBuffer": false, "maxServerCount": 4, "minServerCount": 92, "region": "NEKeuZ2m"}, {"bufferSize": 21, "dynamicBuffer": true, "maxServerCount": 48, "minServerCount": 32, "region": "7E4iI5tw"}, {"bufferSize": 0, "dynamicBuffer": false, "maxServerCount": 79, "minServerCount": 78, "region": "6XKZ2K1d"}], "samplingRules": {"coredumps": {"crashed": {"collect": false, "percentage": 15}}, "logs": {"crashed": {"collect": false, "percentage": 64}, "success": {"collect": true, "percentage": 60}, "unclaimed": {"collect": false, "percentage": 57}}}}' \
    > test.out 2>&1
eval_tap $? 19 'FleetCreate' test.out

#- 20 BulkFleetDelete
./ng net.accelbyte.sdk.cli.Main ams bulkFleetDelete \
    --namespace "$AB_NAMESPACE" \
    --body '{"fleetIds": ["2xuGJRr7", "WIKB4XVA", "QaXSsCpf"]}' \
    > test.out 2>&1
eval_tap $? 20 'BulkFleetDelete' test.out

#- 21 FleetGet
./ng net.accelbyte.sdk.cli.Main ams fleetGet \
    --fleetID 'wqP0YOAC' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 21 'FleetGet' test.out

#- 22 FleetUpdate
./ng net.accelbyte.sdk.cli.Main ams fleetUpdate \
    --fleetID 'TIL1a6Hd' \
    --namespace "$AB_NAMESPACE" \
    --body '{"active": false, "claimKeys": ["c2Bu4npv", "gt8R7TUE", "Sm7Emt24"], "dsHostConfiguration": {"instanceId": "dkhIfDHg", "serversPerVm": 87}, "fallbackFleet": "ARf0WAbZ", "hibernateAfterPeriod": "N1I0jpkO", "imageDeploymentProfile": {"commandLine": "oJtq2mB5", "imageId": "Jd7sODwN", "portConfigurations": [{"name": "5JZHlJ84", "protocol": "3Xtc9Icr"}, {"name": "eMfzsORY", "protocol": "vW32HjNA"}, {"name": "9FLhnKUf", "protocol": "mNk4otkQ"}], "timeout": {"claim": 48, "creation": 95, "drain": 34, "session": 47, "unresponsive": 61}}, "name": "sNG5zIej", "onDemand": true, "regions": [{"bufferSize": 85, "dynamicBuffer": true, "maxServerCount": 18, "minServerCount": 84, "region": "xPHSUATV"}, {"bufferSize": 85, "dynamicBuffer": false, "maxServerCount": 53, "minServerCount": 68, "region": "BxZf00kM"}, {"bufferSize": 63, "dynamicBuffer": false, "maxServerCount": 53, "minServerCount": 14, "region": "5qKtWd0G"}], "samplingRules": {"coredumps": {"crashed": {"collect": true, "percentage": 75}}, "logs": {"crashed": {"collect": false, "percentage": 91}, "success": {"collect": true, "percentage": 79}, "unclaimed": {"collect": false, "percentage": 57}}}}' \
    > test.out 2>&1
eval_tap $? 22 'FleetUpdate' test.out

#- 23 FleetDelete
./ng net.accelbyte.sdk.cli.Main ams fleetDelete \
    --fleetID 'LY0YkMPR' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 23 'FleetDelete' test.out

#- 24 FleetArtifactSamplingRulesGet
./ng net.accelbyte.sdk.cli.Main ams fleetArtifactSamplingRulesGet \
    --fleetID 'w38rjuYS' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 24 'FleetArtifactSamplingRulesGet' test.out

#- 25 FleetArtifactSamplingRulesSet
./ng net.accelbyte.sdk.cli.Main ams fleetArtifactSamplingRulesSet \
    --fleetID 'wESGUwOV' \
    --namespace "$AB_NAMESPACE" \
    --body '{"coredumps": {"crashed": {"collect": false, "percentage": 43}}, "logs": {"crashed": {"collect": false, "percentage": 98}, "success": {"collect": true, "percentage": 70}, "unclaimed": {"collect": false, "percentage": 8}}}' \
    > test.out 2>&1
eval_tap $? 25 'FleetArtifactSamplingRulesSet' test.out

#- 26 FleetServers
./ng net.accelbyte.sdk.cli.Main ams fleetServers \
    --fleetID 'WCMjW7SD' \
    --namespace "$AB_NAMESPACE" \
    --count '14' \
    --offset '36' \
    --region 'Eho9MVDu' \
    --serverId 'jVvGRavL' \
    --sortBy '4iROcy4L' \
    --sortDirection 'asc' \
    --status 'creating' \
    > test.out 2>&1
eval_tap $? 26 'FleetServers' test.out

#- 27 FleetServerHistory
./ng net.accelbyte.sdk.cli.Main ams fleetServerHistory \
    --fleetID 'B4EQzdSr' \
    --namespace "$AB_NAMESPACE" \
    --count '22' \
    --offset '9' \
    --reason 'j93yHgyq' \
    --region 'mqkyZft4' \
    --serverId 'KK1wqvI2' \
    --sortDirection 'bdiwNE7L' \
    --status 'BQMaUa9D' \
    > test.out 2>&1
eval_tap $? 27 'FleetServerHistory' test.out

#- 28 ImageList
./ng net.accelbyte.sdk.cli.Main ams imageList \
    --namespace "$AB_NAMESPACE" \
    --count '97' \
    --inUse 'js9yKshB' \
    --isProtected  \
    --name 'MdWz2wpD' \
    --offset '88' \
    --sortBy 'G9YXVFT5' \
    --sortDirection '2clZIgg8' \
    --status 'pUcd3F31' \
    --tag 'WO44rW6V' \
    --targetArchitecture 'gbcrkWQK' \
    > test.out 2>&1
eval_tap $? 28 'ImageList' test.out

#- 29 ImagesStorage
./ng net.accelbyte.sdk.cli.Main ams imagesStorage \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 29 'ImagesStorage' test.out

#- 30 ImageGet
./ng net.accelbyte.sdk.cli.Main ams imageGet \
    --imageID 'u6cMvyWp' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 30 'ImageGet' test.out

#- 31 ImageMarkForDeletion
./ng net.accelbyte.sdk.cli.Main ams imageMarkForDeletion \
    --imageID 'R5Mmiq6r' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 31 'ImageMarkForDeletion' test.out

#- 32 ImagePatch
./ng net.accelbyte.sdk.cli.Main ams imagePatch \
    --imageID '6N5H24OX' \
    --namespace "$AB_NAMESPACE" \
    --body '{"addedTags": ["p1f5ngmV", "LkkeU7al", "vT6NfdrW"], "isProtected": true, "name": "U50TxuIo", "removedTags": ["Je8Q5JbI", "vBYvaMNa", "cQ0nxMlM"]}' \
    > test.out 2>&1
eval_tap $? 32 'ImagePatch' test.out

#- 33 ImageUnmarkForDeletion
./ng net.accelbyte.sdk.cli.Main ams imageUnmarkForDeletion \
    --imageID '0E73nD8c' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 33 'ImageUnmarkForDeletion' test.out

#- 34 QoSRegionsGet
./ng net.accelbyte.sdk.cli.Main ams qoSRegionsGet \
    --namespace "$AB_NAMESPACE" \
    --status 'n8jfm1wM' \
    > test.out 2>&1
eval_tap $? 34 'QoSRegionsGet' test.out

#- 35 QoSRegionsUpdate
./ng net.accelbyte.sdk.cli.Main ams qoSRegionsUpdate \
    --namespace "$AB_NAMESPACE" \
    --region 'tri6mb5f' \
    --body '{"status": "se9UmIkn"}' \
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
    --serverID 't5T2gcOX' \
    > test.out 2>&1
eval_tap $? 37 'FleetServerInfo' test.out

#- 38 FleetServerConnectionInfo
./ng net.accelbyte.sdk.cli.Main ams fleetServerConnectionInfo \
    --namespace "$AB_NAMESPACE" \
    --serverID 'BVTrYa6n' \
    > test.out 2>&1
eval_tap $? 38 'FleetServerConnectionInfo' test.out

#- 39 ServerHistory
./ng net.accelbyte.sdk.cli.Main ams serverHistory \
    --namespace "$AB_NAMESPACE" \
    --serverID '3f8a1AQd' \
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
    --fleetID '3eZu4ytm' \
    --namespace "$AB_NAMESPACE" \
    --body '{"region": "PAYTrP4j", "sessionId": "9dQeMgKz"}' \
    > test.out 2>&1
eval_tap $? 42 'FleetClaimByID' test.out

#- 43 LocalWatchdogConnect
./ng net.accelbyte.sdk.cli.Main ams localWatchdogConnect \
    --namespace "$AB_NAMESPACE" \
    --watchdogID 'STf2qbGm' \
    > test.out 2>&1
eval_tap $? 43 'LocalWatchdogConnect' test.out

#- 44 FleetClaimByKeys
./ng net.accelbyte.sdk.cli.Main ams fleetClaimByKeys \
    --namespace "$AB_NAMESPACE" \
    --body '{"claimKeys": ["DejoKS39", "Hx7MqsdV", "8x3TxDtq"], "regions": ["HEsYfsKs", "OzsIxRYQ", "HifRIYuS"], "sessionId": "j81MSkt0"}' \
    > test.out 2>&1
eval_tap $? 44 'FleetClaimByKeys' test.out

#- 45 WatchdogConnect
./ng net.accelbyte.sdk.cli.Main ams watchdogConnect \
    --namespace "$AB_NAMESPACE" \
    --watchdogID 'd18hvVLl' \
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