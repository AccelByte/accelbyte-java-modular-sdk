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
    --body '{"name": "HbRlFJAt"}' \
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
    --body '{"token": "cR8vCsGT"}' \
    > test.out 2>&1
eval_tap $? 7 'AdminAccountLink' test.out

#- 8 ArtifactGet
./ng net.accelbyte.sdk.cli.Main ams artifactGet \
    --namespace "$AB_NAMESPACE" \
    --artifactType 'AkMhagiR' \
    --count '239' \
    --endDate 'FeQVXu8D' \
    --fleetID 'zwrSOq2q' \
    --imageID 'YSZgeLGI' \
    --maxSize '99' \
    --minSize '34' \
    --offset '27' \
    --region 'xXUkEYBu' \
    --serverId 'ZHh1yOB4' \
    --sortBy 'kfcgNy39' \
    --sortDirection 'desc' \
    --startDate '8URmM0Wr' \
    --status 'VX3zH3s6' \
    > test.out 2>&1
eval_tap $? 8 'ArtifactGet' test.out

#- 9 ArtifactBulkDelete
./ng net.accelbyte.sdk.cli.Main ams artifactBulkDelete \
    --namespace "$AB_NAMESPACE" \
    --artifactType 'VIzSDWNR' \
    --fleetId '2GQP7fWC' \
    --uploadedBefore '1983-04-21' \
    > test.out 2>&1
eval_tap $? 9 'ArtifactBulkDelete' test.out

#- 10 ArtifactUsageGet
./ng net.accelbyte.sdk.cli.Main ams artifactUsageGet \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 10 'ArtifactUsageGet' test.out

#- 11 ArtifactDelete
./ng net.accelbyte.sdk.cli.Main ams artifactDelete \
    --artifactID 'vmcnUEQg' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 11 'ArtifactDelete' test.out

#- 12 ArtifactGetURL
./ng net.accelbyte.sdk.cli.Main ams artifactGetURL \
    --artifactID 'VOYywyZE' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 12 'ArtifactGetURL' test.out

#- 13 DevelopmentServerConfigurationList
./ng net.accelbyte.sdk.cli.Main ams developmentServerConfigurationList \
    --namespace "$AB_NAMESPACE" \
    --count '328' \
    --imageId 'MLk6D4iF' \
    --name 'FKbZ1681' \
    --offset '95' \
    --sortBy 'name' \
    --sortDirection 'desc' \
    > test.out 2>&1
eval_tap $? 13 'DevelopmentServerConfigurationList' test.out

#- 14 DevelopmentServerConfigurationCreate
./ng net.accelbyte.sdk.cli.Main ams developmentServerConfigurationCreate \
    --namespace "$AB_NAMESPACE" \
    --body '{"commandLineArguments": "UFu2ifwG", "expiresAt": "1988-03-17T00:00:00Z", "imageId": "wBkxN4Rb", "name": "MDtK467D"}' \
    > test.out 2>&1
eval_tap $? 14 'DevelopmentServerConfigurationCreate' test.out

#- 15 DevelopmentServerConfigurationGet
./ng net.accelbyte.sdk.cli.Main ams developmentServerConfigurationGet \
    --developmentServerConfigID 'o0aJu85O' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 15 'DevelopmentServerConfigurationGet' test.out

#- 16 DevelopmentServerConfigurationDelete
./ng net.accelbyte.sdk.cli.Main ams developmentServerConfigurationDelete \
    --developmentServerConfigID '52NdKSbx' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 16 'DevelopmentServerConfigurationDelete' test.out

#- 17 DevelopmentServerConfigurationPatch
./ng net.accelbyte.sdk.cli.Main ams developmentServerConfigurationPatch \
    --developmentServerConfigID 'XDQMC8zB' \
    --namespace "$AB_NAMESPACE" \
    --body '{"commandLineArguments": "x0kbB367", "expiresAt": "1982-01-22T00:00:00Z"}' \
    > test.out 2>&1
eval_tap $? 17 'DevelopmentServerConfigurationPatch' test.out

#- 18 FleetList
./ng net.accelbyte.sdk.cli.Main ams fleetList \
    --namespace "$AB_NAMESPACE" \
    --active  \
    --count '37' \
    --name '5az75S4n' \
    --offset '21' \
    --region 'vavu8y57' \
    --sortBy 'active' \
    --sortDirection 'desc' \
    > test.out 2>&1
eval_tap $? 18 'FleetList' test.out

#- 19 FleetCreate
./ng net.accelbyte.sdk.cli.Main ams fleetCreate \
    --namespace "$AB_NAMESPACE" \
    --body '{"active": true, "claimKeys": ["Vc39Yems", "lmHZSV12", "h1V9ToLI"], "dsHostConfiguration": {"instanceId": "Sl6X5ITy", "serversPerVm": 83}, "fallbackFleet": "CRVTJCv6", "hibernateAfterPeriod": "KDm2zrRM", "imageDeploymentProfile": {"commandLine": "QBPrX2Jp", "imageId": "GLxNNh4N", "portConfigurations": [{"name": "fkaUgf8a", "protocol": "UFlJKmH8"}, {"name": "CWpZNdP8", "protocol": "6pedH453"}, {"name": "YCa4hTJT", "protocol": "NFdaj6IQ"}], "timeout": {"claim": 86, "creation": 24, "drain": 37, "session": 98, "unresponsive": 7}}, "name": "E7UDTqxr", "onDemand": true, "regions": [{"bufferSize": 73, "dynamicBuffer": true, "maxServerCount": 60, "minServerCount": 29, "region": "J0DIPB9h"}, {"bufferSize": 11, "dynamicBuffer": false, "maxServerCount": 91, "minServerCount": 59, "region": "Wn19DmvV"}, {"bufferSize": 57, "dynamicBuffer": true, "maxServerCount": 45, "minServerCount": 56, "region": "Zr03rJEt"}], "samplingRules": {"coredumps": {"crashed": {"collect": true, "percentage": 99}}, "logs": {"crashed": {"collect": true, "percentage": 18}, "success": {"collect": false, "percentage": 11}, "unclaimed": {"collect": false, "percentage": 68}}}}' \
    > test.out 2>&1
eval_tap $? 19 'FleetCreate' test.out

#- 20 BulkFleetDelete
./ng net.accelbyte.sdk.cli.Main ams bulkFleetDelete \
    --namespace "$AB_NAMESPACE" \
    --body '{"fleetIds": ["kZbkN3FJ", "3diS8RbU", "EuHsB1i7"]}' \
    > test.out 2>&1
eval_tap $? 20 'BulkFleetDelete' test.out

#- 21 FleetGet
./ng net.accelbyte.sdk.cli.Main ams fleetGet \
    --fleetID 'z2EMxZ1R' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 21 'FleetGet' test.out

#- 22 FleetUpdate
./ng net.accelbyte.sdk.cli.Main ams fleetUpdate \
    --fleetID '1238DIY8' \
    --namespace "$AB_NAMESPACE" \
    --body '{"active": true, "claimKeys": ["1gptZ2TD", "I2JBciWl", "p8kHK5lB"], "dsHostConfiguration": {"instanceId": "7UBJ3Dqf", "serversPerVm": 67}, "fallbackFleet": "FNlMJJRb", "hibernateAfterPeriod": "PlmVkcBq", "imageDeploymentProfile": {"commandLine": "y8rorGAD", "imageId": "r4gU0jxH", "portConfigurations": [{"name": "KzBQcmXC", "protocol": "BseGJFVT"}, {"name": "wt9kqGPb", "protocol": "7ps1A3JB"}, {"name": "tnyFDAFd", "protocol": "26QmINEu"}], "timeout": {"claim": 33, "creation": 68, "drain": 5, "session": 8, "unresponsive": 4}}, "name": "llycBN9p", "onDemand": false, "regions": [{"bufferSize": 38, "dynamicBuffer": true, "maxServerCount": 79, "minServerCount": 27, "region": "tivCeYAp"}, {"bufferSize": 34, "dynamicBuffer": false, "maxServerCount": 68, "minServerCount": 50, "region": "Fypbg2EV"}, {"bufferSize": 36, "dynamicBuffer": false, "maxServerCount": 84, "minServerCount": 63, "region": "SiSQE9O7"}], "samplingRules": {"coredumps": {"crashed": {"collect": false, "percentage": 99}}, "logs": {"crashed": {"collect": true, "percentage": 60}, "success": {"collect": false, "percentage": 84}, "unclaimed": {"collect": true, "percentage": 84}}}}' \
    > test.out 2>&1
eval_tap $? 22 'FleetUpdate' test.out

#- 23 FleetDelete
./ng net.accelbyte.sdk.cli.Main ams fleetDelete \
    --fleetID 'lZMgypvj' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 23 'FleetDelete' test.out

#- 24 FleetArtifactSamplingRulesGet
./ng net.accelbyte.sdk.cli.Main ams fleetArtifactSamplingRulesGet \
    --fleetID 'jcWzcZPx' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 24 'FleetArtifactSamplingRulesGet' test.out

#- 25 FleetArtifactSamplingRulesSet
./ng net.accelbyte.sdk.cli.Main ams fleetArtifactSamplingRulesSet \
    --fleetID 'BrhCioEo' \
    --namespace "$AB_NAMESPACE" \
    --body '{"coredumps": {"crashed": {"collect": true, "percentage": 58}}, "logs": {"crashed": {"collect": false, "percentage": 63}, "success": {"collect": false, "percentage": 66}, "unclaimed": {"collect": false, "percentage": 12}}}' \
    > test.out 2>&1
eval_tap $? 25 'FleetArtifactSamplingRulesSet' test.out

#- 26 FleetServers
./ng net.accelbyte.sdk.cli.Main ams fleetServers \
    --fleetID 'GhhaYZMk' \
    --namespace "$AB_NAMESPACE" \
    --count '15' \
    --offset '49' \
    --region 'Rgm5wNEK' \
    --serverId 'TJfB3ASQ' \
    --sortBy 'YwIxeO2w' \
    --sortDirection 'asc' \
    --status 'creating' \
    > test.out 2>&1
eval_tap $? 26 'FleetServers' test.out

#- 27 FleetServerHistory
./ng net.accelbyte.sdk.cli.Main ams fleetServerHistory \
    --fleetID 'sRBZ62Fn' \
    --namespace "$AB_NAMESPACE" \
    --count '80' \
    --offset '4' \
    --reason 'LlZQSY1k' \
    --region '4OsbgZsj' \
    --serverId 'BgKhuatC' \
    --sortDirection 'bk1Y8Cgx' \
    --status 'p29lJ87b' \
    > test.out 2>&1
eval_tap $? 27 'FleetServerHistory' test.out

#- 28 ImageList
./ng net.accelbyte.sdk.cli.Main ams imageList \
    --namespace "$AB_NAMESPACE" \
    --count '69' \
    --inUse '7SclYKe6' \
    --isProtected  \
    --name 'mbMZd19Z' \
    --offset '37' \
    --sortBy '7lhmUWiQ' \
    --sortDirection 'MfZiyAXA' \
    --status 'zqJuJzzO' \
    --tag 'auEElqGT' \
    --targetArchitecture 'omOL9EWv' \
    > test.out 2>&1
eval_tap $? 28 'ImageList' test.out

#- 29 ImagesStorage
./ng net.accelbyte.sdk.cli.Main ams imagesStorage \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 29 'ImagesStorage' test.out

#- 30 ImageGet
./ng net.accelbyte.sdk.cli.Main ams imageGet \
    --imageID 'zazB6GM1' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 30 'ImageGet' test.out

#- 31 ImageMarkForDeletion
./ng net.accelbyte.sdk.cli.Main ams imageMarkForDeletion \
    --imageID 'YEQ6m3am' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 31 'ImageMarkForDeletion' test.out

#- 32 ImagePatch
./ng net.accelbyte.sdk.cli.Main ams imagePatch \
    --imageID 'P8xENQwR' \
    --namespace "$AB_NAMESPACE" \
    --body '{"addedTags": ["stRHnaDh", "k1rNjmnr", "SpgFnNbv"], "isProtected": true, "name": "wvItlKgQ", "removedTags": ["nIFg5kHC", "O1tUeNdB", "wsNdlOf0"]}' \
    > test.out 2>&1
eval_tap $? 32 'ImagePatch' test.out

#- 33 ImageUnmarkForDeletion
./ng net.accelbyte.sdk.cli.Main ams imageUnmarkForDeletion \
    --imageID '9w01FJDI' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 33 'ImageUnmarkForDeletion' test.out

#- 34 QoSRegionsGet
./ng net.accelbyte.sdk.cli.Main ams qoSRegionsGet \
    --namespace "$AB_NAMESPACE" \
    --status 'iO20CCjM' \
    > test.out 2>&1
eval_tap $? 34 'QoSRegionsGet' test.out

#- 35 QoSRegionsUpdate
./ng net.accelbyte.sdk.cli.Main ams qoSRegionsUpdate \
    --namespace "$AB_NAMESPACE" \
    --region 'gWLVajBp' \
    --body '{"status": "161izKMh"}' \
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
    --serverID 'mlu9rlU0' \
    > test.out 2>&1
eval_tap $? 37 'FleetServerInfo' test.out

#- 38 FleetServerConnectionInfo
./ng net.accelbyte.sdk.cli.Main ams fleetServerConnectionInfo \
    --namespace "$AB_NAMESPACE" \
    --serverID 'VBHEm6Nv' \
    > test.out 2>&1
eval_tap $? 38 'FleetServerConnectionInfo' test.out

#- 39 ServerHistory
./ng net.accelbyte.sdk.cli.Main ams serverHistory \
    --namespace "$AB_NAMESPACE" \
    --serverID 'lyDrfPfb' \
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
    --fleetID 'X2cpDzZD' \
    --namespace "$AB_NAMESPACE" \
    --body '{"region": "7lsLO2oV", "sessionId": "McI2pRZt"}' \
    > test.out 2>&1
eval_tap $? 42 'FleetClaimByID' test.out

#- 43 LocalWatchdogConnect
./ng net.accelbyte.sdk.cli.Main ams localWatchdogConnect \
    --namespace "$AB_NAMESPACE" \
    --watchdogID 'q3yjX2O2' \
    > test.out 2>&1
eval_tap $? 43 'LocalWatchdogConnect' test.out

#- 44 FleetClaimByKeys
./ng net.accelbyte.sdk.cli.Main ams fleetClaimByKeys \
    --namespace "$AB_NAMESPACE" \
    --body '{"claimKeys": ["oTbhn4Sc", "ySFEPFUf", "iQhhgFRP"], "regions": ["50BY7Rz7", "erppEGBr", "479LnlxN"], "sessionId": "KfYyRUbp"}' \
    > test.out 2>&1
eval_tap $? 44 'FleetClaimByKeys' test.out

#- 45 WatchdogConnect
./ng net.accelbyte.sdk.cli.Main ams watchdogConnect \
    --namespace "$AB_NAMESPACE" \
    --watchdogID 'U4DNdZRF' \
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