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
echo "1..47"

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
    --body '{"name": "2KjhA1xM"}' \
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
    --body '{"token": "MDPK9Nwp"}' \
    > test.out 2>&1
eval_tap $? 7 'AdminAccountLink' test.out

#- 8 ArtifactGet
./ng net.accelbyte.sdk.cli.Main ams artifactGet \
    --namespace "$AB_NAMESPACE" \
    --artifactType 'kzFnwfIx' \
    --count '318' \
    --endDate 'XnLLEOpG' \
    --fleetID 'NU3LKfHU' \
    --imageID 'nz6GsyRr' \
    --maxSize '4' \
    --minSize '56' \
    --offset '18' \
    --region 'DlZF29JH' \
    --serverId '9dvLw6vW' \
    --sortBy 'ZViLod9J' \
    --sortDirection 'desc' \
    --startDate 'bUfA0ZnV' \
    --status 'AUfa1DyF' \
    > test.out 2>&1
eval_tap $? 8 'ArtifactGet' test.out

#- 9 ArtifactBulkDelete
./ng net.accelbyte.sdk.cli.Main ams artifactBulkDelete \
    --namespace "$AB_NAMESPACE" \
    --artifactType 'RaHDyVqO' \
    --fleetId 'w44C5y1y' \
    --uploadedBefore '1976-03-06' \
    > test.out 2>&1
eval_tap $? 9 'ArtifactBulkDelete' test.out

#- 10 ArtifactUsageGet
./ng net.accelbyte.sdk.cli.Main ams artifactUsageGet \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 10 'ArtifactUsageGet' test.out

#- 11 ArtifactDelete
./ng net.accelbyte.sdk.cli.Main ams artifactDelete \
    --artifactID 'krU4rxrl' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 11 'ArtifactDelete' test.out

#- 12 ArtifactGetURL
./ng net.accelbyte.sdk.cli.Main ams artifactGetURL \
    --artifactID 'k26hDgNz' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 12 'ArtifactGetURL' test.out

#- 13 DevelopmentServerConfigurationList
./ng net.accelbyte.sdk.cli.Main ams developmentServerConfigurationList \
    --namespace "$AB_NAMESPACE" \
    --count '251' \
    --imageId 'gcRmkvTG' \
    --name 'zV7h0rIM' \
    --offset '65' \
    --sortBy 'expires_at' \
    --sortDirection 'desc' \
    > test.out 2>&1
eval_tap $? 13 'DevelopmentServerConfigurationList' test.out

#- 14 DevelopmentServerConfigurationCreate
./ng net.accelbyte.sdk.cli.Main ams developmentServerConfigurationCreate \
    --namespace "$AB_NAMESPACE" \
    --body '{"commandLineArguments": "cV99T2ji", "expiresAt": "1991-01-28T00:00:00Z", "imageId": "RDAZMxP4", "name": "HFrXA23x"}' \
    > test.out 2>&1
eval_tap $? 14 'DevelopmentServerConfigurationCreate' test.out

#- 15 DevelopmentServerConfigurationGet
./ng net.accelbyte.sdk.cli.Main ams developmentServerConfigurationGet \
    --developmentServerConfigID 'IQ5reMJk' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 15 'DevelopmentServerConfigurationGet' test.out

#- 16 DevelopmentServerConfigurationDelete
./ng net.accelbyte.sdk.cli.Main ams developmentServerConfigurationDelete \
    --developmentServerConfigID '6EP9BABJ' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 16 'DevelopmentServerConfigurationDelete' test.out

#- 17 DevelopmentServerConfigurationPatch
./ng net.accelbyte.sdk.cli.Main ams developmentServerConfigurationPatch \
    --developmentServerConfigID 'v9RC94Z8' \
    --namespace "$AB_NAMESPACE" \
    --body '{"commandLineArguments": "b2Fym4xC", "expiresAt": "1998-03-30T00:00:00Z"}' \
    > test.out 2>&1
eval_tap $? 17 'DevelopmentServerConfigurationPatch' test.out

#- 18 FleetList
./ng net.accelbyte.sdk.cli.Main ams fleetList \
    --namespace "$AB_NAMESPACE" \
    --active  \
    --count '17' \
    --name 'QGUpClMZ' \
    --offset '47' \
    --region 'tgRUsdK2' \
    --sortBy 'name' \
    --sortDirection 'asc' \
    > test.out 2>&1
eval_tap $? 18 'FleetList' test.out

#- 19 FleetCreate
./ng net.accelbyte.sdk.cli.Main ams fleetCreate \
    --namespace "$AB_NAMESPACE" \
    --body '{"active": true, "claimKeys": ["0F4WR4m5", "cIhvItTv", "fteXrI8Z"], "dsHostConfiguration": {"instanceId": "INrP5CgM", "serversPerVm": 71}, "fallbackFleet": "pgrvX2p7", "hibernateAfterPeriod": "4viDkQEJ", "imageDeploymentProfile": {"commandLine": "DEo2Trnn", "imageId": "uBbFBblr", "portConfigurations": [{"name": "qPvnsD0s", "protocol": "MIREJZve"}, {"name": "kyrDRi0N", "protocol": "Gpho16vs"}, {"name": "C3rFuIwB", "protocol": "6LVs7Do9"}], "timeout": {"claim": 46, "creation": 73, "drain": 86, "session": 99, "unresponsive": 87}}, "name": "NxEEde9X", "onDemand": false, "regions": [{"bufferSize": 90, "dynamicBuffer": false, "maxServerCount": 52, "minServerCount": 44, "region": "1nlFgBlq"}, {"bufferSize": 25, "dynamicBuffer": false, "maxServerCount": 22, "minServerCount": 37, "region": "yjmsTO8L"}, {"bufferSize": 67, "dynamicBuffer": true, "maxServerCount": 34, "minServerCount": 16, "region": "gK66M83D"}], "samplingRules": {"coredumps": {"crashed": {"collect": true, "percentage": 6}}, "logs": {"crashed": {"collect": false, "percentage": 99}, "success": {"collect": true, "percentage": 91}, "unclaimed": {"collect": true, "percentage": 3}}}}' \
    > test.out 2>&1
eval_tap $? 19 'FleetCreate' test.out

#- 20 FleetGet
./ng net.accelbyte.sdk.cli.Main ams fleetGet \
    --fleetID 'hD1SLWbL' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 20 'FleetGet' test.out

#- 21 FleetUpdate
./ng net.accelbyte.sdk.cli.Main ams fleetUpdate \
    --fleetID 'SVKIGCNm' \
    --namespace "$AB_NAMESPACE" \
    --body '{"active": false, "claimKeys": ["wHs30lnl", "WLldMb4v", "er1A7dZB"], "dsHostConfiguration": {"instanceId": "42DX9Wut", "serversPerVm": 18}, "fallbackFleet": "GnPCGrGD", "hibernateAfterPeriod": "yTdmHNub", "imageDeploymentProfile": {"commandLine": "6yuUukck", "imageId": "FIbbpf4R", "portConfigurations": [{"name": "sfVRrBaa", "protocol": "rQhyKY6e"}, {"name": "PWgvieMl", "protocol": "2r47TdeU"}, {"name": "gH2nPDdi", "protocol": "xQJeYEym"}], "timeout": {"claim": 49, "creation": 82, "drain": 88, "session": 23, "unresponsive": 97}}, "name": "uV6CpxGB", "onDemand": true, "regions": [{"bufferSize": 37, "dynamicBuffer": false, "maxServerCount": 40, "minServerCount": 51, "region": "ai8S6Lon"}, {"bufferSize": 41, "dynamicBuffer": false, "maxServerCount": 47, "minServerCount": 57, "region": "8zK2elzM"}, {"bufferSize": 81, "dynamicBuffer": false, "maxServerCount": 29, "minServerCount": 32, "region": "BKeBxqQF"}], "samplingRules": {"coredumps": {"crashed": {"collect": true, "percentage": 69}}, "logs": {"crashed": {"collect": true, "percentage": 44}, "success": {"collect": true, "percentage": 44}, "unclaimed": {"collect": true, "percentage": 62}}}}' \
    > test.out 2>&1
eval_tap $? 21 'FleetUpdate' test.out

#- 22 FleetDelete
./ng net.accelbyte.sdk.cli.Main ams fleetDelete \
    --fleetID 'bee10U7C' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 22 'FleetDelete' test.out

#- 23 FleetArtifactSamplingRulesGet
./ng net.accelbyte.sdk.cli.Main ams fleetArtifactSamplingRulesGet \
    --fleetID 'iWaiwW8o' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 23 'FleetArtifactSamplingRulesGet' test.out

#- 24 FleetArtifactSamplingRulesSet
./ng net.accelbyte.sdk.cli.Main ams fleetArtifactSamplingRulesSet \
    --fleetID 'jfjxpRMr' \
    --namespace "$AB_NAMESPACE" \
    --body '{"coredumps": {"crashed": {"collect": false, "percentage": 17}}, "logs": {"crashed": {"collect": false, "percentage": 15}, "success": {"collect": true, "percentage": 62}, "unclaimed": {"collect": true, "percentage": 73}}}' \
    > test.out 2>&1
eval_tap $? 24 'FleetArtifactSamplingRulesSet' test.out

#- 25 FleetServers
./ng net.accelbyte.sdk.cli.Main ams fleetServers \
    --fleetID 'OAntrUlg' \
    --namespace "$AB_NAMESPACE" \
    --count '23' \
    --offset '80' \
    --region 'QJ0lmyTO' \
    --serverId 'LewUS4cn' \
    --sortBy 'iJhIRneS' \
    --sortDirection 'asc' \
    --status 'ready' \
    > test.out 2>&1
eval_tap $? 25 'FleetServers' test.out

#- 26 FleetServerHistory
./ng net.accelbyte.sdk.cli.Main ams fleetServerHistory \
    --fleetID 'jaKx7jUj' \
    --namespace "$AB_NAMESPACE" \
    --count '84' \
    --offset '91' \
    --reason 'aDPIx2FA' \
    --region '9681HcGf' \
    --serverId 'LoOOja5w' \
    --sortDirection 'y8aHU8vU' \
    --status 'EnGtNrRh' \
    > test.out 2>&1
eval_tap $? 26 'FleetServerHistory' test.out

#- 27 ImageList
./ng net.accelbyte.sdk.cli.Main ams imageList \
    --namespace "$AB_NAMESPACE" \
    --count '4' \
    --inUse 'd7YOSC17' \
    --isProtected  \
    --name '99Cqulj4' \
    --offset '59' \
    --sortBy 'g7u5YBrl' \
    --sortDirection 'QNqDUjnX' \
    --status 'hkQi16R3' \
    --tag '6hCtXnVz' \
    --targetArchitecture 'MvPlPEPl' \
    > test.out 2>&1
eval_tap $? 27 'ImageList' test.out

#- 28 ImagesStorage
./ng net.accelbyte.sdk.cli.Main ams imagesStorage \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 28 'ImagesStorage' test.out

#- 29 ImageGet
./ng net.accelbyte.sdk.cli.Main ams imageGet \
    --imageID 'ATspS1Rd' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 29 'ImageGet' test.out

#- 30 ImageMarkForDeletion
./ng net.accelbyte.sdk.cli.Main ams imageMarkForDeletion \
    --imageID 'Maydt9x6' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 30 'ImageMarkForDeletion' test.out

#- 31 ImagePatch
./ng net.accelbyte.sdk.cli.Main ams imagePatch \
    --imageID '03BA4yoe' \
    --namespace "$AB_NAMESPACE" \
    --body '{"addedTags": ["leD91gji", "fHP942zX", "M0iYSBQn"], "isProtected": true, "name": "MXfFeKa7", "removedTags": ["B6eNoqxc", "8FswPDUL", "KZRUUGVp"]}' \
    > test.out 2>&1
eval_tap $? 31 'ImagePatch' test.out

#- 32 ImageUnmarkForDeletion
./ng net.accelbyte.sdk.cli.Main ams imageUnmarkForDeletion \
    --imageID 'eWME1jT7' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 32 'ImageUnmarkForDeletion' test.out

#- 33 QoSRegionsGet
./ng net.accelbyte.sdk.cli.Main ams qoSRegionsGet \
    --namespace "$AB_NAMESPACE" \
    --status 'Gl5TVCF0' \
    > test.out 2>&1
eval_tap $? 33 'QoSRegionsGet' test.out

#- 34 QoSRegionsUpdate
./ng net.accelbyte.sdk.cli.Main ams qoSRegionsUpdate \
    --namespace "$AB_NAMESPACE" \
    --region 'OyYA7XRW' \
    --body '{"status": "AIJPketw"}' \
    > test.out 2>&1
eval_tap $? 34 'QoSRegionsUpdate' test.out

#- 35 InfoRegions
./ng net.accelbyte.sdk.cli.Main ams infoRegions \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 35 'InfoRegions' test.out

#- 36 FleetServerInfo
./ng net.accelbyte.sdk.cli.Main ams fleetServerInfo \
    --namespace "$AB_NAMESPACE" \
    --serverID 'Q2xLqk9m' \
    > test.out 2>&1
eval_tap $? 36 'FleetServerInfo' test.out

#- 37 FleetServerConnectionInfo
./ng net.accelbyte.sdk.cli.Main ams fleetServerConnectionInfo \
    --namespace "$AB_NAMESPACE" \
    --serverID 'jVLGuObY' \
    > test.out 2>&1
eval_tap $? 37 'FleetServerConnectionInfo' test.out

#- 38 ServerHistory
./ng net.accelbyte.sdk.cli.Main ams serverHistory \
    --namespace "$AB_NAMESPACE" \
    --serverID 'LHv4UvI3' \
    > test.out 2>&1
eval_tap $? 38 'ServerHistory' test.out

#- 39 InfoSupportedInstances
./ng net.accelbyte.sdk.cli.Main ams infoSupportedInstances \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 39 'InfoSupportedInstances' test.out

#- 40 AccountGet
./ng net.accelbyte.sdk.cli.Main ams accountGet \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 40 'AccountGet' test.out

#- 41 FleetClaimByID
./ng net.accelbyte.sdk.cli.Main ams fleetClaimByID \
    --fleetID 'xkRyjvBr' \
    --namespace "$AB_NAMESPACE" \
    --body '{"region": "ewTXK7PU", "sessionId": "zdVfrc2n"}' \
    > test.out 2>&1
eval_tap $? 41 'FleetClaimByID' test.out

#- 42 LocalWatchdogConnect
./ng net.accelbyte.sdk.cli.Main ams localWatchdogConnect \
    --namespace "$AB_NAMESPACE" \
    --watchdogID 'xrqitC5G' \
    > test.out 2>&1
eval_tap $? 42 'LocalWatchdogConnect' test.out

#- 43 FleetClaimByKeys
./ng net.accelbyte.sdk.cli.Main ams fleetClaimByKeys \
    --namespace "$AB_NAMESPACE" \
    --body '{"claimKeys": ["0MiGUZeA", "25aPorqt", "sJiQ8IN1"], "regions": ["jlZ0ZaoO", "M7H3IhzK", "FPkKg3Ww"], "sessionId": "NP75VUDC"}' \
    > test.out 2>&1
eval_tap $? 43 'FleetClaimByKeys' test.out

#- 44 WatchdogConnect
./ng net.accelbyte.sdk.cli.Main ams watchdogConnect \
    --namespace "$AB_NAMESPACE" \
    --watchdogID 'AkTsRM6q' \
    > test.out 2>&1
eval_tap $? 44 'WatchdogConnect' test.out

#- 45 UploadURLGet
./ng net.accelbyte.sdk.cli.Main ams uploadURLGet \
    > test.out 2>&1
eval_tap $? 45 'UploadURLGet' test.out

#- 46 Func1
./ng net.accelbyte.sdk.cli.Main ams func1 \
    > test.out 2>&1
eval_tap $? 46 'Func1' test.out

#- 47 BasicHealthCheck
./ng net.accelbyte.sdk.cli.Main ams basicHealthCheck \
    > test.out 2>&1
eval_tap $? 47 'BasicHealthCheck' test.out


rm -f "tmp.dat"

exit $EXIT_CODE