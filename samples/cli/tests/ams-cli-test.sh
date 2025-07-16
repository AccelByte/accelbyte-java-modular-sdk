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
    --body '{"name": "L1wHT4ht"}' \
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
    --body '{"token": "qdEScdDR"}' \
    > test.out 2>&1
eval_tap $? 7 'AdminAccountLink' test.out

#- 8 ArtifactGet
./ng net.accelbyte.sdk.cli.Main ams artifactGet \
    --namespace "$AB_NAMESPACE" \
    --artifactType 'NwVWbFLL' \
    --count '42' \
    --endDate 'KGUi6xWP' \
    --fleetID 'o3PaFswx' \
    --imageID 'Qdy8rZ8P' \
    --maxSize '36' \
    --minSize '1' \
    --offset '84' \
    --region 'kkGASFLB' \
    --serverId 'MAuymUHm' \
    --sortBy 'aJsaM2RD' \
    --sortDirection 'desc' \
    --startDate 'hyf5BUWS' \
    --status 'NiAQYZN2' \
    > test.out 2>&1
eval_tap $? 8 'ArtifactGet' test.out

#- 9 ArtifactBulkDelete
./ng net.accelbyte.sdk.cli.Main ams artifactBulkDelete \
    --namespace "$AB_NAMESPACE" \
    --artifactType 'fqHwxkdK' \
    --fleetId 'kqJHEkVo' \
    --uploadedBefore '1992-04-29' \
    > test.out 2>&1
eval_tap $? 9 'ArtifactBulkDelete' test.out

#- 10 ArtifactUsageGet
./ng net.accelbyte.sdk.cli.Main ams artifactUsageGet \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 10 'ArtifactUsageGet' test.out

#- 11 ArtifactDelete
./ng net.accelbyte.sdk.cli.Main ams artifactDelete \
    --artifactID 'l446d2rt' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 11 'ArtifactDelete' test.out

#- 12 ArtifactGetURL
./ng net.accelbyte.sdk.cli.Main ams artifactGetURL \
    --artifactID 'UO2dKHIF' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 12 'ArtifactGetURL' test.out

#- 13 DevelopmentServerConfigurationList
./ng net.accelbyte.sdk.cli.Main ams developmentServerConfigurationList \
    --namespace "$AB_NAMESPACE" \
    --count '12' \
    --offset '58' \
    > test.out 2>&1
eval_tap $? 13 'DevelopmentServerConfigurationList' test.out

#- 14 DevelopmentServerConfigurationCreate
./ng net.accelbyte.sdk.cli.Main ams developmentServerConfigurationCreate \
    --namespace "$AB_NAMESPACE" \
    --body '{"commandLineArguments": "In6NgNW7", "expiresAt": "1985-02-17T00:00:00Z", "imageId": "pRPAbMZA", "name": "LfY4E1vQ"}' \
    > test.out 2>&1
eval_tap $? 14 'DevelopmentServerConfigurationCreate' test.out

#- 15 DevelopmentServerConfigurationGet
./ng net.accelbyte.sdk.cli.Main ams developmentServerConfigurationGet \
    --developmentServerConfigID 'qE4XczDV' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 15 'DevelopmentServerConfigurationGet' test.out

#- 16 DevelopmentServerConfigurationDelete
./ng net.accelbyte.sdk.cli.Main ams developmentServerConfigurationDelete \
    --developmentServerConfigID 'KaJ52RVI' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 16 'DevelopmentServerConfigurationDelete' test.out

#- 17 DevelopmentServerConfigurationPatch
./ng net.accelbyte.sdk.cli.Main ams developmentServerConfigurationPatch \
    --developmentServerConfigID 'zHC92nbG' \
    --namespace "$AB_NAMESPACE" \
    --body '{"commandLineArguments": "gHUCqfrQ", "expiresAt": "1983-12-19T00:00:00Z"}' \
    > test.out 2>&1
eval_tap $? 17 'DevelopmentServerConfigurationPatch' test.out

#- 18 FleetList
./ng net.accelbyte.sdk.cli.Main ams fleetList \
    --namespace "$AB_NAMESPACE" \
    --active  \
    --count '58' \
    --name 'WeUzAmlm' \
    --offset '11' \
    --region 'M99qxAKL' \
    --sortBy 'active' \
    --sortDirection 'desc' \
    > test.out 2>&1
eval_tap $? 18 'FleetList' test.out

#- 19 FleetCreate
./ng net.accelbyte.sdk.cli.Main ams fleetCreate \
    --namespace "$AB_NAMESPACE" \
    --body '{"active": false, "claimKeys": ["BcieRC51", "A5IERomU", "V5zXEtt9"], "dsHostConfiguration": {"instanceId": "LJ1G1ZOZ", "serversPerVm": 84}, "fallbackFleet": "kUiSYAT5", "hibernateAfterPeriod": "xko8PfRX", "imageDeploymentProfile": {"commandLine": "1z1iM4am", "imageId": "Cg3a6kFm", "portConfigurations": [{"name": "FI5aiKsg", "protocol": "yN0jS8zb"}, {"name": "HfdS449H", "protocol": "Kj0m2M2l"}, {"name": "eNvS2HfQ", "protocol": "KCFkqSyh"}], "timeout": {"claim": 55, "creation": 5, "drain": 67, "session": 80, "unresponsive": 29}}, "name": "4VKaSjwe", "onDemand": false, "regions": [{"bufferSize": 31, "dynamicBuffer": true, "maxServerCount": 61, "minServerCount": 91, "region": "uogFXF1C"}, {"bufferSize": 13, "dynamicBuffer": false, "maxServerCount": 37, "minServerCount": 75, "region": "4BRNCY4v"}, {"bufferSize": 58, "dynamicBuffer": true, "maxServerCount": 73, "minServerCount": 38, "region": "cgaRZV5U"}], "samplingRules": {"coredumps": {"crashed": {"collect": true, "percentage": 50}}, "logs": {"crashed": {"collect": false, "percentage": 18}, "success": {"collect": false, "percentage": 63}, "unclaimed": {"collect": true, "percentage": 98}}}}' \
    > test.out 2>&1
eval_tap $? 19 'FleetCreate' test.out

#- 20 FleetGet
./ng net.accelbyte.sdk.cli.Main ams fleetGet \
    --fleetID '4Fof9IJx' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 20 'FleetGet' test.out

#- 21 FleetUpdate
./ng net.accelbyte.sdk.cli.Main ams fleetUpdate \
    --fleetID 'uJ3auQYE' \
    --namespace "$AB_NAMESPACE" \
    --body '{"active": true, "claimKeys": ["6C8vY4bN", "l26OvCax", "e4pcC67F"], "dsHostConfiguration": {"instanceId": "81lhVhkW", "serversPerVm": 88}, "fallbackFleet": "t49HzsSi", "hibernateAfterPeriod": "c70DBLlT", "imageDeploymentProfile": {"commandLine": "nF8sAWXl", "imageId": "8FX0ap1A", "portConfigurations": [{"name": "nf9NvwPx", "protocol": "wQnzQdoZ"}, {"name": "eeab6O3r", "protocol": "VE5YsMOp"}, {"name": "xyPoWeBD", "protocol": "Oo6QVgUv"}], "timeout": {"claim": 19, "creation": 12, "drain": 32, "session": 78, "unresponsive": 61}}, "name": "5gQOaxoq", "onDemand": true, "regions": [{"bufferSize": 48, "dynamicBuffer": true, "maxServerCount": 34, "minServerCount": 8, "region": "UuG2YBid"}, {"bufferSize": 58, "dynamicBuffer": false, "maxServerCount": 12, "minServerCount": 18, "region": "YN1Vf8tk"}, {"bufferSize": 41, "dynamicBuffer": true, "maxServerCount": 43, "minServerCount": 45, "region": "a19emV3d"}], "samplingRules": {"coredumps": {"crashed": {"collect": true, "percentage": 38}}, "logs": {"crashed": {"collect": true, "percentage": 2}, "success": {"collect": true, "percentage": 85}, "unclaimed": {"collect": false, "percentage": 6}}}}' \
    > test.out 2>&1
eval_tap $? 21 'FleetUpdate' test.out

#- 22 FleetDelete
./ng net.accelbyte.sdk.cli.Main ams fleetDelete \
    --fleetID 'adA5Hngm' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 22 'FleetDelete' test.out

#- 23 FleetArtifactSamplingRulesGet
./ng net.accelbyte.sdk.cli.Main ams fleetArtifactSamplingRulesGet \
    --fleetID 'uwyqd7vl' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 23 'FleetArtifactSamplingRulesGet' test.out

#- 24 FleetArtifactSamplingRulesSet
./ng net.accelbyte.sdk.cli.Main ams fleetArtifactSamplingRulesSet \
    --fleetID 'Nmh8ZJhX' \
    --namespace "$AB_NAMESPACE" \
    --body '{"coredumps": {"crashed": {"collect": false, "percentage": 74}}, "logs": {"crashed": {"collect": true, "percentage": 14}, "success": {"collect": true, "percentage": 78}, "unclaimed": {"collect": true, "percentage": 84}}}' \
    > test.out 2>&1
eval_tap $? 24 'FleetArtifactSamplingRulesSet' test.out

#- 25 FleetServers
./ng net.accelbyte.sdk.cli.Main ams fleetServers \
    --fleetID 'LVAQ61Zo' \
    --namespace "$AB_NAMESPACE" \
    --count '80' \
    --offset '7' \
    --region 'xyA5vkVM' \
    --serverId 'DpBtU1je' \
    --sortBy '75PyA5hr' \
    --sortDirection 'asc' \
    --status 'claiming' \
    > test.out 2>&1
eval_tap $? 25 'FleetServers' test.out

#- 26 FleetServerHistory
./ng net.accelbyte.sdk.cli.Main ams fleetServerHistory \
    --fleetID 'vzFGG57z' \
    --namespace "$AB_NAMESPACE" \
    --count '45' \
    --offset '99' \
    --reason '8RnUizOR' \
    --region 'Yp73w5dN' \
    --serverId 'xEVaxLJW' \
    --sortDirection '2imq17ex' \
    --status 'gcdMSZHb' \
    > test.out 2>&1
eval_tap $? 26 'FleetServerHistory' test.out

#- 27 ImageList
./ng net.accelbyte.sdk.cli.Main ams imageList \
    --namespace "$AB_NAMESPACE" \
    --count '76' \
    --inUse 'xk3lmiN6' \
    --isProtected  \
    --name 'uqtlqTCa' \
    --offset '14' \
    --sortBy 'JXxftwSl' \
    --sortDirection 'kSQquxWS' \
    --status '1YbpAu2g' \
    --tag 'Nigg1eS0' \
    > test.out 2>&1
eval_tap $? 27 'ImageList' test.out

#- 28 ImagesStorage
./ng net.accelbyte.sdk.cli.Main ams imagesStorage \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 28 'ImagesStorage' test.out

#- 29 ImageGet
./ng net.accelbyte.sdk.cli.Main ams imageGet \
    --imageID 'a9uGEK3x' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 29 'ImageGet' test.out

#- 30 ImageMarkForDeletion
./ng net.accelbyte.sdk.cli.Main ams imageMarkForDeletion \
    --imageID 'FlFQLiCA' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 30 'ImageMarkForDeletion' test.out

#- 31 ImagePatch
./ng net.accelbyte.sdk.cli.Main ams imagePatch \
    --imageID 'nHcwdwd6' \
    --namespace "$AB_NAMESPACE" \
    --body '{"addedTags": ["1zAzfyfy", "e2h8HfEV", "jxKbWP6A"], "isProtected": true, "name": "3TXlNOR4", "removedTags": ["gfWrsyEj", "UaxtvUo3", "AP1QEKln"]}' \
    > test.out 2>&1
eval_tap $? 31 'ImagePatch' test.out

#- 32 ImageUnmarkForDeletion
./ng net.accelbyte.sdk.cli.Main ams imageUnmarkForDeletion \
    --imageID 'LgXK6Wk9' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 32 'ImageUnmarkForDeletion' test.out

#- 33 QoSRegionsGet
./ng net.accelbyte.sdk.cli.Main ams qoSRegionsGet \
    --namespace "$AB_NAMESPACE" \
    --status 'clropBFr' \
    > test.out 2>&1
eval_tap $? 33 'QoSRegionsGet' test.out

#- 34 QoSRegionsUpdate
./ng net.accelbyte.sdk.cli.Main ams qoSRegionsUpdate \
    --namespace "$AB_NAMESPACE" \
    --region 'GrnMuwtu' \
    --body '{"status": "YsnBp16J"}' \
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
    --serverID 'CtOrgH7U' \
    > test.out 2>&1
eval_tap $? 36 'FleetServerInfo' test.out

#- 37 FleetServerConnectionInfo
./ng net.accelbyte.sdk.cli.Main ams fleetServerConnectionInfo \
    --namespace "$AB_NAMESPACE" \
    --serverID 'f732zuUP' \
    > test.out 2>&1
eval_tap $? 37 'FleetServerConnectionInfo' test.out

#- 38 ServerHistory
./ng net.accelbyte.sdk.cli.Main ams serverHistory \
    --namespace "$AB_NAMESPACE" \
    --serverID 'C5MW4wVb' \
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
    --fleetID 'e9hoNTHW' \
    --namespace "$AB_NAMESPACE" \
    --body '{"region": "j2hd6awX", "sessionId": "C1Yn9SAA"}' \
    > test.out 2>&1
eval_tap $? 41 'FleetClaimByID' test.out

#- 42 LocalWatchdogConnect
./ng net.accelbyte.sdk.cli.Main ams localWatchdogConnect \
    --namespace "$AB_NAMESPACE" \
    --watchdogID 'au0NGi5U' \
    > test.out 2>&1
eval_tap $? 42 'LocalWatchdogConnect' test.out

#- 43 FleetClaimByKeys
./ng net.accelbyte.sdk.cli.Main ams fleetClaimByKeys \
    --namespace "$AB_NAMESPACE" \
    --body '{"claimKeys": ["UJCG0DdC", "yw0QcUVp", "rKAHFgsV"], "regions": ["FaVAXzCj", "nSvaOM8U", "QSxyZDgM"], "sessionId": "JqVHPkfz"}' \
    > test.out 2>&1
eval_tap $? 43 'FleetClaimByKeys' test.out

#- 44 WatchdogConnect
./ng net.accelbyte.sdk.cli.Main ams watchdogConnect \
    --namespace "$AB_NAMESPACE" \
    --watchdogID 'uqRnzgb1' \
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