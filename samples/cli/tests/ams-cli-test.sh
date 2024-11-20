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
    --body '{"name": "9JsclYer"}' \
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
    --body '{"token": "miH0D65m"}' \
    > test.out 2>&1
eval_tap $? 7 'AdminAccountLink' test.out

#- 8 ArtifactGet
./ng net.accelbyte.sdk.cli.Main ams artifactGet \
    --namespace "$AB_NAMESPACE" \
    --artifactType 'eVvJzptx' \
    --count '43' \
    --endDate 'sQN0qElU' \
    --fleetID 'rMbVp0WC' \
    --imageID 'dnWCO9M9' \
    --maxSize '4' \
    --minSize '77' \
    --offset '87' \
    --region 'PAwzNo6d' \
    --serverId 'LagM4tqA' \
    --sortBy 'ikvR2Zyw' \
    --sortDirection 'desc' \
    --startDate 'TdEKvwb1' \
    --status 'HR3vzQLa' \
    > test.out 2>&1
eval_tap $? 8 'ArtifactGet' test.out

#- 9 ArtifactBulkDelete
./ng net.accelbyte.sdk.cli.Main ams artifactBulkDelete \
    --namespace "$AB_NAMESPACE" \
    --artifactType 'bNVQFcg7' \
    --fleetId 'M35LOZdi' \
    --uploadedBefore '1987-02-17' \
    > test.out 2>&1
eval_tap $? 9 'ArtifactBulkDelete' test.out

#- 10 ArtifactUsageGet
./ng net.accelbyte.sdk.cli.Main ams artifactUsageGet \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 10 'ArtifactUsageGet' test.out

#- 11 ArtifactDelete
./ng net.accelbyte.sdk.cli.Main ams artifactDelete \
    --artifactID '1OCoE11q' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 11 'ArtifactDelete' test.out

#- 12 ArtifactGetURL
./ng net.accelbyte.sdk.cli.Main ams artifactGetURL \
    --artifactID '8xbbewPq' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 12 'ArtifactGetURL' test.out

#- 13 DevelopmentServerConfigurationList
./ng net.accelbyte.sdk.cli.Main ams developmentServerConfigurationList \
    --namespace "$AB_NAMESPACE" \
    --count '296' \
    --offset '93' \
    > test.out 2>&1
eval_tap $? 13 'DevelopmentServerConfigurationList' test.out

#- 14 DevelopmentServerConfigurationCreate
./ng net.accelbyte.sdk.cli.Main ams developmentServerConfigurationCreate \
    --namespace "$AB_NAMESPACE" \
    --body '{"commandLineArguments": "DcwfwesB", "expiresAt": "1975-06-09T00:00:00Z", "imageId": "7QSSAzNe", "name": "ffMuqE08"}' \
    > test.out 2>&1
eval_tap $? 14 'DevelopmentServerConfigurationCreate' test.out

#- 15 DevelopmentServerConfigurationGet
./ng net.accelbyte.sdk.cli.Main ams developmentServerConfigurationGet \
    --developmentServerConfigID 'ZqqAT8Ad' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 15 'DevelopmentServerConfigurationGet' test.out

#- 16 DevelopmentServerConfigurationDelete
./ng net.accelbyte.sdk.cli.Main ams developmentServerConfigurationDelete \
    --developmentServerConfigID 'wsrujaij' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 16 'DevelopmentServerConfigurationDelete' test.out

#- 17 FleetList
./ng net.accelbyte.sdk.cli.Main ams fleetList \
    --namespace "$AB_NAMESPACE" \
    --active  \
    --name 'Zq2Sn5np' \
    --region 'YYRJdK4g' \
    > test.out 2>&1
eval_tap $? 17 'FleetList' test.out

#- 18 FleetCreate
./ng net.accelbyte.sdk.cli.Main ams fleetCreate \
    --namespace "$AB_NAMESPACE" \
    --body '{"active": false, "claimKeys": ["WKZ0NerE", "7d5ockGc", "Pcwr6Pb4"], "dsHostConfiguration": {"instanceId": "RMinFStI", "serversPerVm": 82}, "imageDeploymentProfile": {"commandLine": "B2lOwYwl", "imageId": "svKHHXr2", "portConfigurations": [{"name": "f7gM0Ppy", "protocol": "PC6lUsLY"}, {"name": "yPqbevvm", "protocol": "8s5SxGdg"}, {"name": "xgkYOdN8", "protocol": "ixzTR4Oa"}], "timeout": {"claim": 57, "creation": 65, "drain": 79, "session": 46, "unresponsive": 14}}, "name": "89F935l4", "onDemand": true, "regions": [{"bufferSize": 77, "dynamicBuffer": true, "maxServerCount": 71, "minServerCount": 55, "region": "Q9UU4q9y"}, {"bufferSize": 77, "dynamicBuffer": false, "maxServerCount": 65, "minServerCount": 56, "region": "NNyDPb1k"}, {"bufferSize": 84, "dynamicBuffer": false, "maxServerCount": 63, "minServerCount": 55, "region": "FpruIGMX"}], "samplingRules": {"coredumps": {"crashed": {"collect": true, "percentage": 2}}, "logs": {"crashed": {"collect": true, "percentage": 25}, "success": {"collect": false, "percentage": 65}, "unclaimed": {"collect": true, "percentage": 32}}}}' \
    > test.out 2>&1
eval_tap $? 18 'FleetCreate' test.out

#- 19 FleetGet
./ng net.accelbyte.sdk.cli.Main ams fleetGet \
    --fleetID 'pZ5KANkx' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 19 'FleetGet' test.out

#- 20 FleetUpdate
./ng net.accelbyte.sdk.cli.Main ams fleetUpdate \
    --fleetID 'vhLSDJRX' \
    --namespace "$AB_NAMESPACE" \
    --body '{"active": true, "claimKeys": ["9m7ME49n", "50asbIek", "SdQyRg2T"], "dsHostConfiguration": {"instanceId": "2ZLRUlnU", "serversPerVm": 65}, "imageDeploymentProfile": {"commandLine": "TtuNlgTP", "imageId": "bv9uo2nU", "portConfigurations": [{"name": "FjcLEQUM", "protocol": "IwEj2d1k"}, {"name": "6JNgBXQn", "protocol": "qfJE54iG"}, {"name": "4D9CK8jN", "protocol": "Kd6kVKpy"}], "timeout": {"claim": 49, "creation": 82, "drain": 43, "session": 39, "unresponsive": 71}}, "name": "uzsXlVkZ", "onDemand": false, "regions": [{"bufferSize": 13, "dynamicBuffer": true, "maxServerCount": 16, "minServerCount": 99, "region": "VnqCnTB3"}, {"bufferSize": 23, "dynamicBuffer": true, "maxServerCount": 17, "minServerCount": 18, "region": "Zo8wJeJU"}, {"bufferSize": 55, "dynamicBuffer": true, "maxServerCount": 35, "minServerCount": 11, "region": "7fjKcq3b"}], "samplingRules": {"coredumps": {"crashed": {"collect": true, "percentage": 9}}, "logs": {"crashed": {"collect": true, "percentage": 79}, "success": {"collect": true, "percentage": 74}, "unclaimed": {"collect": true, "percentage": 91}}}}' \
    > test.out 2>&1
eval_tap $? 20 'FleetUpdate' test.out

#- 21 FleetDelete
./ng net.accelbyte.sdk.cli.Main ams fleetDelete \
    --fleetID 'HqxyXVJE' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 21 'FleetDelete' test.out

#- 22 FleetArtifactSamplingRulesGet
./ng net.accelbyte.sdk.cli.Main ams fleetArtifactSamplingRulesGet \
    --fleetID 'YXqbFF6C' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 22 'FleetArtifactSamplingRulesGet' test.out

#- 23 FleetArtifactSamplingRulesSet
./ng net.accelbyte.sdk.cli.Main ams fleetArtifactSamplingRulesSet \
    --fleetID 'gFkdARjK' \
    --namespace "$AB_NAMESPACE" \
    --body '{"coredumps": {"crashed": {"collect": false, "percentage": 11}}, "logs": {"crashed": {"collect": true, "percentage": 24}, "success": {"collect": true, "percentage": 74}, "unclaimed": {"collect": true, "percentage": 34}}}' \
    > test.out 2>&1
eval_tap $? 23 'FleetArtifactSamplingRulesSet' test.out

#- 24 FleetServers
./ng net.accelbyte.sdk.cli.Main ams fleetServers \
    --fleetID 'DG8X8Yau' \
    --namespace "$AB_NAMESPACE" \
    --count '55' \
    --offset '54' \
    --region 'LrB3Gb8C' \
    --serverId 'mPI5PMnF' \
    --sortBy 'lvfllte6' \
    --sortDirection 'asc' \
    --status 'claimed' \
    > test.out 2>&1
eval_tap $? 24 'FleetServers' test.out

#- 25 FleetServerHistory
./ng net.accelbyte.sdk.cli.Main ams fleetServerHistory \
    --fleetID 'Y4LdwTZB' \
    --namespace "$AB_NAMESPACE" \
    --count '25' \
    --offset '84' \
    --reason 'DLmo9JHx' \
    --region 'zay7fpgl' \
    --serverId '6esf7IGc' \
    --sortDirection 'IYOiRuDx' \
    --status 'FIR8MacA' \
    > test.out 2>&1
eval_tap $? 25 'FleetServerHistory' test.out

#- 26 ImageList
./ng net.accelbyte.sdk.cli.Main ams imageList \
    --namespace "$AB_NAMESPACE" \
    --count '20' \
    --inUse 'sRyxaDrw' \
    --isProtected  \
    --name 'UwPSJqk3' \
    --offset '0' \
    --sortBy 'ulrrrfsA' \
    --sortDirection 'DSldOrQS' \
    --status '3dykmY0Z' \
    --tag 'Sk3bXOuN' \
    > test.out 2>&1
eval_tap $? 26 'ImageList' test.out

#- 27 ImagesStorage
./ng net.accelbyte.sdk.cli.Main ams imagesStorage \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 27 'ImagesStorage' test.out

#- 28 ImageGet
./ng net.accelbyte.sdk.cli.Main ams imageGet \
    --imageID 'YZFwlFzQ' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 28 'ImageGet' test.out

#- 29 ImageMarkForDeletion
./ng net.accelbyte.sdk.cli.Main ams imageMarkForDeletion \
    --imageID 'kfLxZoWW' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 29 'ImageMarkForDeletion' test.out

#- 30 ImagePatch
./ng net.accelbyte.sdk.cli.Main ams imagePatch \
    --imageID 'UH7eV4cY' \
    --namespace "$AB_NAMESPACE" \
    --body '{"addedTags": ["vAw7MvMa", "2hvFG0Vw", "mJ9FYNNa"], "isProtected": false, "name": "R9msGlY7", "removedTags": ["XVT6THHx", "LjP9B0P3", "ZcaJqmsh"]}' \
    > test.out 2>&1
eval_tap $? 30 'ImagePatch' test.out

#- 31 ImageUnmarkForDeletion
./ng net.accelbyte.sdk.cli.Main ams imageUnmarkForDeletion \
    --imageID 'SoJRFO66' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 31 'ImageUnmarkForDeletion' test.out

#- 32 QoSRegionsGet
./ng net.accelbyte.sdk.cli.Main ams qoSRegionsGet \
    --namespace "$AB_NAMESPACE" \
    --status 'ya48ZDJF' \
    > test.out 2>&1
eval_tap $? 32 'QoSRegionsGet' test.out

#- 33 QoSRegionsUpdate
./ng net.accelbyte.sdk.cli.Main ams qoSRegionsUpdate \
    --namespace "$AB_NAMESPACE" \
    --region 'vp5x6tVB' \
    --body '{"status": "MqsCduAl"}' \
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
    --serverID 'nUiE6Rep' \
    > test.out 2>&1
eval_tap $? 35 'FleetServerInfo' test.out

#- 36 FleetServerConnectionInfo
./ng net.accelbyte.sdk.cli.Main ams fleetServerConnectionInfo \
    --namespace "$AB_NAMESPACE" \
    --serverID 'fMaBNkYE' \
    > test.out 2>&1
eval_tap $? 36 'FleetServerConnectionInfo' test.out

#- 37 ServerHistory
./ng net.accelbyte.sdk.cli.Main ams serverHistory \
    --namespace "$AB_NAMESPACE" \
    --serverID 'mjh60GaK' \
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
    --fleetID '3EtQxk1S' \
    --namespace "$AB_NAMESPACE" \
    --body '{"region": "UjuJtkSw", "sessionId": "DXubHfOP"}' \
    > test.out 2>&1
eval_tap $? 40 'FleetClaimByID' test.out

#- 41 LocalWatchdogConnect
./ng net.accelbyte.sdk.cli.Main ams localWatchdogConnect \
    --namespace "$AB_NAMESPACE" \
    --watchdogID 'jttJRUt7' \
    > test.out 2>&1
eval_tap $? 41 'LocalWatchdogConnect' test.out

#- 42 FleetClaimByKeys
./ng net.accelbyte.sdk.cli.Main ams fleetClaimByKeys \
    --namespace "$AB_NAMESPACE" \
    --body '{"claimKeys": ["tGOQFrCh", "IFPf9IUD", "DzJzOEvX"], "regions": ["k5x4jjJC", "wQby9m26", "nkuWkGJc"], "sessionId": "1hPR8k5v"}' \
    > test.out 2>&1
eval_tap $? 42 'FleetClaimByKeys' test.out

#- 43 WatchdogConnect
./ng net.accelbyte.sdk.cli.Main ams watchdogConnect \
    --namespace "$AB_NAMESPACE" \
    --watchdogID 'KUuxZCVM' \
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