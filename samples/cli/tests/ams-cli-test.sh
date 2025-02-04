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
    --body '{"name": "9vy33TnA"}' \
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
    --body '{"token": "n5dUOknu"}' \
    > test.out 2>&1
eval_tap $? 7 'AdminAccountLink' test.out

#- 8 ArtifactGet
./ng net.accelbyte.sdk.cli.Main ams artifactGet \
    --namespace "$AB_NAMESPACE" \
    --artifactType 'wDQKf2re' \
    --count '491' \
    --endDate 'pcHUlmoW' \
    --fleetID '82zNIqQa' \
    --imageID '3Bk9Q5IW' \
    --maxSize '24' \
    --minSize '23' \
    --offset '56' \
    --region 'BVVkySEp' \
    --serverId 'VnU0YlAu' \
    --sortBy 'BDHVyQjt' \
    --sortDirection 'asc' \
    --startDate '6OV6tDyQ' \
    --status 'xn8YGQqP' \
    > test.out 2>&1
eval_tap $? 8 'ArtifactGet' test.out

#- 9 ArtifactBulkDelete
./ng net.accelbyte.sdk.cli.Main ams artifactBulkDelete \
    --namespace "$AB_NAMESPACE" \
    --artifactType 'zYOYKtzR' \
    --fleetId 'ZyMdsYh5' \
    --uploadedBefore '1981-06-30' \
    > test.out 2>&1
eval_tap $? 9 'ArtifactBulkDelete' test.out

#- 10 ArtifactUsageGet
./ng net.accelbyte.sdk.cli.Main ams artifactUsageGet \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 10 'ArtifactUsageGet' test.out

#- 11 ArtifactDelete
./ng net.accelbyte.sdk.cli.Main ams artifactDelete \
    --artifactID 'ds0ANFrn' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 11 'ArtifactDelete' test.out

#- 12 ArtifactGetURL
./ng net.accelbyte.sdk.cli.Main ams artifactGetURL \
    --artifactID 'AlmQG1V3' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 12 'ArtifactGetURL' test.out

#- 13 DevelopmentServerConfigurationList
./ng net.accelbyte.sdk.cli.Main ams developmentServerConfigurationList \
    --namespace "$AB_NAMESPACE" \
    --count '336' \
    --offset '80' \
    > test.out 2>&1
eval_tap $? 13 'DevelopmentServerConfigurationList' test.out

#- 14 DevelopmentServerConfigurationCreate
./ng net.accelbyte.sdk.cli.Main ams developmentServerConfigurationCreate \
    --namespace "$AB_NAMESPACE" \
    --body '{"commandLineArguments": "We4R9U12", "expiresAt": "1990-05-21T00:00:00Z", "imageId": "qEH8eZqM", "name": "11hkALgL"}' \
    > test.out 2>&1
eval_tap $? 14 'DevelopmentServerConfigurationCreate' test.out

#- 15 DevelopmentServerConfigurationGet
./ng net.accelbyte.sdk.cli.Main ams developmentServerConfigurationGet \
    --developmentServerConfigID 'aEar9L5j' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 15 'DevelopmentServerConfigurationGet' test.out

#- 16 DevelopmentServerConfigurationDelete
./ng net.accelbyte.sdk.cli.Main ams developmentServerConfigurationDelete \
    --developmentServerConfigID 'ZzgPpPgP' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 16 'DevelopmentServerConfigurationDelete' test.out

#- 17 FleetList
./ng net.accelbyte.sdk.cli.Main ams fleetList \
    --namespace "$AB_NAMESPACE" \
    --active  \
    --count '99' \
    --desc 'asc' \
    --name 'TDrwnBb6' \
    --offset '23' \
    --region 'F2xKfUXN' \
    --sortBy 'active' \
    > test.out 2>&1
eval_tap $? 17 'FleetList' test.out

#- 18 FleetCreate
./ng net.accelbyte.sdk.cli.Main ams fleetCreate \
    --namespace "$AB_NAMESPACE" \
    --body '{"active": false, "claimKeys": ["x7HQUYbE", "BYIDnyeu", "RagkAZr5"], "dsHostConfiguration": {"instanceId": "fafek2P5", "serversPerVm": 24}, "imageDeploymentProfile": {"commandLine": "A23eZ3N8", "imageId": "0gDg4Z0N", "portConfigurations": [{"name": "87wRgGqW", "protocol": "qAUft34l"}, {"name": "VmsnfKoV", "protocol": "o7Je7Wsm"}, {"name": "73pKUr4c", "protocol": "sIBxnBSx"}], "timeout": {"claim": 83, "creation": 51, "drain": 80, "session": 92, "unresponsive": 57}}, "name": "BYaZqrlw", "onDemand": true, "regions": [{"bufferSize": 98, "dynamicBuffer": false, "maxServerCount": 15, "minServerCount": 22, "region": "BB8gKiJ2"}, {"bufferSize": 14, "dynamicBuffer": true, "maxServerCount": 27, "minServerCount": 24, "region": "Sd51oJeE"}, {"bufferSize": 44, "dynamicBuffer": true, "maxServerCount": 15, "minServerCount": 14, "region": "zoOgf16b"}], "samplingRules": {"coredumps": {"crashed": {"collect": true, "percentage": 62}}, "logs": {"crashed": {"collect": false, "percentage": 96}, "success": {"collect": false, "percentage": 43}, "unclaimed": {"collect": false, "percentage": 32}}}}' \
    > test.out 2>&1
eval_tap $? 18 'FleetCreate' test.out

#- 19 FleetGet
./ng net.accelbyte.sdk.cli.Main ams fleetGet \
    --fleetID 'nm629Ek5' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 19 'FleetGet' test.out

#- 20 FleetUpdate
./ng net.accelbyte.sdk.cli.Main ams fleetUpdate \
    --fleetID 'i8wD41Je' \
    --namespace "$AB_NAMESPACE" \
    --body '{"active": false, "claimKeys": ["Y37r9gtj", "rRWCQ2wK", "VZvcKwKM"], "dsHostConfiguration": {"instanceId": "U1gwuRJH", "serversPerVm": 54}, "imageDeploymentProfile": {"commandLine": "TChqmyw8", "imageId": "VZy7zcqF", "portConfigurations": [{"name": "GMaeL7oM", "protocol": "f6mVJNqk"}, {"name": "Hn6MJKkD", "protocol": "nZalp9kJ"}, {"name": "ez0Al02E", "protocol": "pCKehD6Q"}], "timeout": {"claim": 96, "creation": 86, "drain": 100, "session": 66, "unresponsive": 42}}, "name": "NdRlEona", "onDemand": true, "regions": [{"bufferSize": 69, "dynamicBuffer": false, "maxServerCount": 43, "minServerCount": 59, "region": "pKiXUeoj"}, {"bufferSize": 41, "dynamicBuffer": true, "maxServerCount": 80, "minServerCount": 15, "region": "iwHZ2JMz"}, {"bufferSize": 99, "dynamicBuffer": true, "maxServerCount": 39, "minServerCount": 74, "region": "KurQBWf5"}], "samplingRules": {"coredumps": {"crashed": {"collect": true, "percentage": 51}}, "logs": {"crashed": {"collect": false, "percentage": 27}, "success": {"collect": false, "percentage": 9}, "unclaimed": {"collect": true, "percentage": 34}}}}' \
    > test.out 2>&1
eval_tap $? 20 'FleetUpdate' test.out

#- 21 FleetDelete
./ng net.accelbyte.sdk.cli.Main ams fleetDelete \
    --fleetID 'Wguog9Na' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 21 'FleetDelete' test.out

#- 22 FleetArtifactSamplingRulesGet
./ng net.accelbyte.sdk.cli.Main ams fleetArtifactSamplingRulesGet \
    --fleetID '5gtiGsXo' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 22 'FleetArtifactSamplingRulesGet' test.out

#- 23 FleetArtifactSamplingRulesSet
./ng net.accelbyte.sdk.cli.Main ams fleetArtifactSamplingRulesSet \
    --fleetID 'CVop7xCB' \
    --namespace "$AB_NAMESPACE" \
    --body '{"coredumps": {"crashed": {"collect": true, "percentage": 98}}, "logs": {"crashed": {"collect": true, "percentage": 84}, "success": {"collect": true, "percentage": 0}, "unclaimed": {"collect": false, "percentage": 22}}}' \
    > test.out 2>&1
eval_tap $? 23 'FleetArtifactSamplingRulesSet' test.out

#- 24 FleetServers
./ng net.accelbyte.sdk.cli.Main ams fleetServers \
    --fleetID 'ltEmUOmA' \
    --namespace "$AB_NAMESPACE" \
    --count '49' \
    --offset '29' \
    --region 'GIQn5Z9k' \
    --serverId 'tlK5VPR5' \
    --sortBy 'vzrRagoS' \
    --sortDirection 'desc' \
    --status 'crash backoff' \
    > test.out 2>&1
eval_tap $? 24 'FleetServers' test.out

#- 25 FleetServerHistory
./ng net.accelbyte.sdk.cli.Main ams fleetServerHistory \
    --fleetID 'Dig35GkN' \
    --namespace "$AB_NAMESPACE" \
    --count '76' \
    --offset '2' \
    --reason 'CssJppMn' \
    --region 'sSHlHglo' \
    --serverId 'JmtSfWWo' \
    --sortDirection 'buROjMWl' \
    --status 'meaIrvEG' \
    > test.out 2>&1
eval_tap $? 25 'FleetServerHistory' test.out

#- 26 ImageList
./ng net.accelbyte.sdk.cli.Main ams imageList \
    --namespace "$AB_NAMESPACE" \
    --count '36' \
    --inUse 'wqmGjm3J' \
    --isProtected  \
    --name 'TVF8ecpH' \
    --offset '80' \
    --sortBy 'bQgj9s61' \
    --sortDirection 'LKl2tz8y' \
    --status 'oj22RmpZ' \
    --tag 'o3DmHtPf' \
    > test.out 2>&1
eval_tap $? 26 'ImageList' test.out

#- 27 ImagesStorage
./ng net.accelbyte.sdk.cli.Main ams imagesStorage \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 27 'ImagesStorage' test.out

#- 28 ImageGet
./ng net.accelbyte.sdk.cli.Main ams imageGet \
    --imageID 'K9jhRhw8' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 28 'ImageGet' test.out

#- 29 ImageMarkForDeletion
./ng net.accelbyte.sdk.cli.Main ams imageMarkForDeletion \
    --imageID 'Aak2JQbl' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 29 'ImageMarkForDeletion' test.out

#- 30 ImagePatch
./ng net.accelbyte.sdk.cli.Main ams imagePatch \
    --imageID 'k5Hpq7B3' \
    --namespace "$AB_NAMESPACE" \
    --body '{"addedTags": ["FYMhny9f", "ttpSTF3V", "7MEBrEEQ"], "isProtected": false, "name": "Xbwm1YSB", "removedTags": ["pRMwlkTg", "cqKQPLki", "tyh78b6D"]}' \
    > test.out 2>&1
eval_tap $? 30 'ImagePatch' test.out

#- 31 ImageUnmarkForDeletion
./ng net.accelbyte.sdk.cli.Main ams imageUnmarkForDeletion \
    --imageID 'FPeoyQtl' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 31 'ImageUnmarkForDeletion' test.out

#- 32 QoSRegionsGet
./ng net.accelbyte.sdk.cli.Main ams qoSRegionsGet \
    --namespace "$AB_NAMESPACE" \
    --status 'eY8S0Tpm' \
    > test.out 2>&1
eval_tap $? 32 'QoSRegionsGet' test.out

#- 33 QoSRegionsUpdate
./ng net.accelbyte.sdk.cli.Main ams qoSRegionsUpdate \
    --namespace "$AB_NAMESPACE" \
    --region 'Bt8Yo3dU' \
    --body '{"status": "aMQ0i8iO"}' \
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
    --serverID 'KiKi4ufA' \
    > test.out 2>&1
eval_tap $? 35 'FleetServerInfo' test.out

#- 36 FleetServerConnectionInfo
./ng net.accelbyte.sdk.cli.Main ams fleetServerConnectionInfo \
    --namespace "$AB_NAMESPACE" \
    --serverID '29NoBYwS' \
    > test.out 2>&1
eval_tap $? 36 'FleetServerConnectionInfo' test.out

#- 37 ServerHistory
./ng net.accelbyte.sdk.cli.Main ams serverHistory \
    --namespace "$AB_NAMESPACE" \
    --serverID 'tEdws0yV' \
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
    --fleetID 'O18RYPmn' \
    --namespace "$AB_NAMESPACE" \
    --body '{"region": "xd7zgQUR", "sessionId": "74yHbHAE"}' \
    > test.out 2>&1
eval_tap $? 40 'FleetClaimByID' test.out

#- 41 LocalWatchdogConnect
./ng net.accelbyte.sdk.cli.Main ams localWatchdogConnect \
    --namespace "$AB_NAMESPACE" \
    --watchdogID '2PdnBBxl' \
    > test.out 2>&1
eval_tap $? 41 'LocalWatchdogConnect' test.out

#- 42 FleetClaimByKeys
./ng net.accelbyte.sdk.cli.Main ams fleetClaimByKeys \
    --namespace "$AB_NAMESPACE" \
    --body '{"claimKeys": ["QTS3XNJj", "tHVEgp3z", "nja4tqkB"], "regions": ["UW6T13lb", "nc8WYLWW", "0OQaKUWE"], "sessionId": "nDcKHRp6"}' \
    > test.out 2>&1
eval_tap $? 42 'FleetClaimByKeys' test.out

#- 43 WatchdogConnect
./ng net.accelbyte.sdk.cli.Main ams watchdogConnect \
    --namespace "$AB_NAMESPACE" \
    --watchdogID 'V0XO8tqB' \
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