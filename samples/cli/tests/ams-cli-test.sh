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
    --body '{"name": "EZheat5l"}' \
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
    --body '{"token": "sw5WyGgh"}' \
    > test.out 2>&1
eval_tap $? 7 'AdminAccountLink' test.out

#- 8 ArtifactGet
./ng net.accelbyte.sdk.cli.Main ams artifactGet \
    --namespace "$AB_NAMESPACE" \
    --artifactType 'gHFfJ0g2' \
    --count '290' \
    --endDate 'PPDl0C8y' \
    --fleetID 'jk8k3cVO' \
    --imageID 'jpLMBuh0' \
    --maxSize '80' \
    --minSize '13' \
    --offset '74' \
    --region 'jZMnm8RQ' \
    --serverId 'UusWPd0q' \
    --sortBy 'BvNOl7E6' \
    --sortDirection 'asc' \
    --startDate '4y9pYaQc' \
    --status 'dJTaA8YJ' \
    > test.out 2>&1
eval_tap $? 8 'ArtifactGet' test.out

#- 9 ArtifactBulkDelete
./ng net.accelbyte.sdk.cli.Main ams artifactBulkDelete \
    --namespace "$AB_NAMESPACE" \
    --artifactType 'gKzPhPbJ' \
    --fleetId 'Idmntvve' \
    --uploadedBefore '1980-06-27' \
    > test.out 2>&1
eval_tap $? 9 'ArtifactBulkDelete' test.out

#- 10 ArtifactUsageGet
./ng net.accelbyte.sdk.cli.Main ams artifactUsageGet \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 10 'ArtifactUsageGet' test.out

#- 11 ArtifactDelete
./ng net.accelbyte.sdk.cli.Main ams artifactDelete \
    --artifactID 'UrqQydgu' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 11 'ArtifactDelete' test.out

#- 12 ArtifactGetURL
./ng net.accelbyte.sdk.cli.Main ams artifactGetURL \
    --artifactID 'nQGqcKqZ' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 12 'ArtifactGetURL' test.out

#- 13 DevelopmentServerConfigurationList
./ng net.accelbyte.sdk.cli.Main ams developmentServerConfigurationList \
    --namespace "$AB_NAMESPACE" \
    --count '389' \
    --offset '90' \
    > test.out 2>&1
eval_tap $? 13 'DevelopmentServerConfigurationList' test.out

#- 14 DevelopmentServerConfigurationCreate
./ng net.accelbyte.sdk.cli.Main ams developmentServerConfigurationCreate \
    --namespace "$AB_NAMESPACE" \
    --body '{"commandLineArguments": "jpBoUtsj", "expiresAt": "1982-08-02T00:00:00Z", "imageId": "Xcv9Icfd", "name": "cmNZtze7"}' \
    > test.out 2>&1
eval_tap $? 14 'DevelopmentServerConfigurationCreate' test.out

#- 15 DevelopmentServerConfigurationGet
./ng net.accelbyte.sdk.cli.Main ams developmentServerConfigurationGet \
    --developmentServerConfigID '6gMJuDA8' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 15 'DevelopmentServerConfigurationGet' test.out

#- 16 DevelopmentServerConfigurationDelete
./ng net.accelbyte.sdk.cli.Main ams developmentServerConfigurationDelete \
    --developmentServerConfigID 'UmVDN977' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 16 'DevelopmentServerConfigurationDelete' test.out

#- 17 FleetList
./ng net.accelbyte.sdk.cli.Main ams fleetList \
    --namespace "$AB_NAMESPACE" \
    --active  \
    --count '15' \
    --name 'tw0m8ekK' \
    --offset '48' \
    --region 'jVmEuIaN' \
    --sortBy 'active' \
    --sortDirection 'asc' \
    > test.out 2>&1
eval_tap $? 17 'FleetList' test.out

#- 18 FleetCreate
./ng net.accelbyte.sdk.cli.Main ams fleetCreate \
    --namespace "$AB_NAMESPACE" \
    --body '{"active": false, "claimKeys": ["v8hHz82W", "Bssi3lF3", "xm503WFM"], "dsHostConfiguration": {"instanceId": "ZHdNPwsF", "serversPerVm": 86}, "fallbackFleet": "BNWNJL6m", "imageDeploymentProfile": {"commandLine": "Sbl2qGcc", "imageId": "zuhzwt07", "portConfigurations": [{"name": "wXYY6TCq", "protocol": "N8mfi8Vj"}, {"name": "npgrMHfn", "protocol": "Sntd3taz"}, {"name": "HufmYG7h", "protocol": "Em5Va2GG"}], "timeout": {"claim": 31, "creation": 27, "drain": 99, "session": 45, "unresponsive": 91}}, "name": "c0iSBNRj", "onDemand": false, "regions": [{"bufferSize": 66, "dynamicBuffer": true, "maxServerCount": 28, "minServerCount": 94, "region": "CHo26Z4K"}, {"bufferSize": 24, "dynamicBuffer": true, "maxServerCount": 55, "minServerCount": 75, "region": "ccU9ZW0W"}, {"bufferSize": 7, "dynamicBuffer": true, "maxServerCount": 58, "minServerCount": 62, "region": "uAeHr0mt"}], "samplingRules": {"coredumps": {"crashed": {"collect": false, "percentage": 44}}, "logs": {"crashed": {"collect": false, "percentage": 14}, "success": {"collect": true, "percentage": 35}, "unclaimed": {"collect": false, "percentage": 22}}}}' \
    > test.out 2>&1
eval_tap $? 18 'FleetCreate' test.out

#- 19 FleetGet
./ng net.accelbyte.sdk.cli.Main ams fleetGet \
    --fleetID 'lAzIXzTh' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 19 'FleetGet' test.out

#- 20 FleetUpdate
./ng net.accelbyte.sdk.cli.Main ams fleetUpdate \
    --fleetID 'gSvAgGk7' \
    --namespace "$AB_NAMESPACE" \
    --body '{"active": true, "claimKeys": ["iA8Ywqpb", "rZthMeNV", "uQlqwD1x"], "dsHostConfiguration": {"instanceId": "chqrJWTQ", "serversPerVm": 44}, "fallbackFleet": "CrALNwng", "imageDeploymentProfile": {"commandLine": "VNWq9gGs", "imageId": "Kr3VcaG7", "portConfigurations": [{"name": "xKNiCdJ8", "protocol": "zXrUVDMk"}, {"name": "uBxRihWg", "protocol": "ehVX5Sz1"}, {"name": "h1yCNJkV", "protocol": "gGVF4A0g"}], "timeout": {"claim": 36, "creation": 45, "drain": 78, "session": 20, "unresponsive": 97}}, "name": "ZXPAjKLP", "onDemand": false, "regions": [{"bufferSize": 61, "dynamicBuffer": true, "maxServerCount": 94, "minServerCount": 6, "region": "j8VJXIDq"}, {"bufferSize": 97, "dynamicBuffer": false, "maxServerCount": 1, "minServerCount": 40, "region": "jdXP8FVG"}, {"bufferSize": 73, "dynamicBuffer": false, "maxServerCount": 13, "minServerCount": 12, "region": "sVKthC9Q"}], "samplingRules": {"coredumps": {"crashed": {"collect": false, "percentage": 49}}, "logs": {"crashed": {"collect": true, "percentage": 78}, "success": {"collect": false, "percentage": 13}, "unclaimed": {"collect": false, "percentage": 70}}}}' \
    > test.out 2>&1
eval_tap $? 20 'FleetUpdate' test.out

#- 21 FleetDelete
./ng net.accelbyte.sdk.cli.Main ams fleetDelete \
    --fleetID 'ke9y5FNv' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 21 'FleetDelete' test.out

#- 22 FleetArtifactSamplingRulesGet
./ng net.accelbyte.sdk.cli.Main ams fleetArtifactSamplingRulesGet \
    --fleetID 'IIyXKP2X' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 22 'FleetArtifactSamplingRulesGet' test.out

#- 23 FleetArtifactSamplingRulesSet
./ng net.accelbyte.sdk.cli.Main ams fleetArtifactSamplingRulesSet \
    --fleetID 'hY2ohvad' \
    --namespace "$AB_NAMESPACE" \
    --body '{"coredumps": {"crashed": {"collect": false, "percentage": 48}}, "logs": {"crashed": {"collect": true, "percentage": 7}, "success": {"collect": false, "percentage": 26}, "unclaimed": {"collect": false, "percentage": 89}}}' \
    > test.out 2>&1
eval_tap $? 23 'FleetArtifactSamplingRulesSet' test.out

#- 24 FleetServers
./ng net.accelbyte.sdk.cli.Main ams fleetServers \
    --fleetID 'wvZ4y4AZ' \
    --namespace "$AB_NAMESPACE" \
    --count '37' \
    --offset '54' \
    --region 'rjlsOdX1' \
    --serverId 'j0LHPDmt' \
    --sortBy 'o0rTzvYu' \
    --sortDirection 'asc' \
    --status 'draining' \
    > test.out 2>&1
eval_tap $? 24 'FleetServers' test.out

#- 25 FleetServerHistory
./ng net.accelbyte.sdk.cli.Main ams fleetServerHistory \
    --fleetID 'yZtkVc33' \
    --namespace "$AB_NAMESPACE" \
    --count '32' \
    --offset '62' \
    --reason 'qGqv4xz0' \
    --region 'fDoNeloh' \
    --serverId 'DGutP5QK' \
    --sortDirection 'RFYiiRAR' \
    --status 'ZxSO7Qrv' \
    > test.out 2>&1
eval_tap $? 25 'FleetServerHistory' test.out

#- 26 ImageList
./ng net.accelbyte.sdk.cli.Main ams imageList \
    --namespace "$AB_NAMESPACE" \
    --count '18' \
    --inUse 'jhl787lX' \
    --isProtected  \
    --name 'f8FBB0KM' \
    --offset '83' \
    --sortBy 'UM9UM8UR' \
    --sortDirection 'osLwMNtr' \
    --status 'K9V2h004' \
    --tag 'kda3cYdS' \
    > test.out 2>&1
eval_tap $? 26 'ImageList' test.out

#- 27 ImagesStorage
./ng net.accelbyte.sdk.cli.Main ams imagesStorage \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 27 'ImagesStorage' test.out

#- 28 ImageGet
./ng net.accelbyte.sdk.cli.Main ams imageGet \
    --imageID 'KcTYXUDd' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 28 'ImageGet' test.out

#- 29 ImageMarkForDeletion
./ng net.accelbyte.sdk.cli.Main ams imageMarkForDeletion \
    --imageID 'V1pXKKX9' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 29 'ImageMarkForDeletion' test.out

#- 30 ImagePatch
./ng net.accelbyte.sdk.cli.Main ams imagePatch \
    --imageID 'GGGAlZ00' \
    --namespace "$AB_NAMESPACE" \
    --body '{"addedTags": ["FGE5Zcyt", "VGlV3KNw", "njMra9wq"], "isProtected": true, "name": "qZXYsXxX", "removedTags": ["OzhElk9B", "duMtxjq4", "Ul5m4gWf"]}' \
    > test.out 2>&1
eval_tap $? 30 'ImagePatch' test.out

#- 31 ImageUnmarkForDeletion
./ng net.accelbyte.sdk.cli.Main ams imageUnmarkForDeletion \
    --imageID '6oFzOMyY' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 31 'ImageUnmarkForDeletion' test.out

#- 32 QoSRegionsGet
./ng net.accelbyte.sdk.cli.Main ams qoSRegionsGet \
    --namespace "$AB_NAMESPACE" \
    --status 'Cb6iJFC3' \
    > test.out 2>&1
eval_tap $? 32 'QoSRegionsGet' test.out

#- 33 QoSRegionsUpdate
./ng net.accelbyte.sdk.cli.Main ams qoSRegionsUpdate \
    --namespace "$AB_NAMESPACE" \
    --region 'ocTHZcGi' \
    --body '{"status": "hge4IEpP"}' \
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
    --serverID 'GxtvX4jU' \
    > test.out 2>&1
eval_tap $? 35 'FleetServerInfo' test.out

#- 36 FleetServerConnectionInfo
./ng net.accelbyte.sdk.cli.Main ams fleetServerConnectionInfo \
    --namespace "$AB_NAMESPACE" \
    --serverID 'CvGUVTyr' \
    > test.out 2>&1
eval_tap $? 36 'FleetServerConnectionInfo' test.out

#- 37 ServerHistory
./ng net.accelbyte.sdk.cli.Main ams serverHistory \
    --namespace "$AB_NAMESPACE" \
    --serverID 'tnZ0mdgP' \
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
    --fleetID 'tgK5K0eV' \
    --namespace "$AB_NAMESPACE" \
    --body '{"region": "gPrg45eG", "sessionId": "00nH1Dbc"}' \
    > test.out 2>&1
eval_tap $? 40 'FleetClaimByID' test.out

#- 41 LocalWatchdogConnect
./ng net.accelbyte.sdk.cli.Main ams localWatchdogConnect \
    --namespace "$AB_NAMESPACE" \
    --watchdogID 'uckJl6sy' \
    > test.out 2>&1
eval_tap $? 41 'LocalWatchdogConnect' test.out

#- 42 FleetClaimByKeys
./ng net.accelbyte.sdk.cli.Main ams fleetClaimByKeys \
    --namespace "$AB_NAMESPACE" \
    --body '{"claimKeys": ["wjkTe8B8", "ZDVWOhZF", "GUoLQkDy"], "regions": ["JsbrShw9", "uBYLf7WM", "yovON3WI"], "sessionId": "qu3igtNz"}' \
    > test.out 2>&1
eval_tap $? 42 'FleetClaimByKeys' test.out

#- 43 WatchdogConnect
./ng net.accelbyte.sdk.cli.Main ams watchdogConnect \
    --namespace "$AB_NAMESPACE" \
    --watchdogID 'neXr4CtQ' \
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