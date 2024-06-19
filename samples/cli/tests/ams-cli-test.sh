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
echo "1..45"

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
    --body '{"name": "f1kzMg6n"}' \
    > test.out 2>&1
eval_tap $? 5 'AdminAccountCreate' test.out

#- 6 AdminAccountLinkTokenGet
./ng net.accelbyte.sdk.cli.Main ams adminAccountLinkTokenGet \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 6 'AdminAccountLinkTokenGet' test.out

#- 7 AdminAccountLinkTokenPost
./ng net.accelbyte.sdk.cli.Main ams adminAccountLinkTokenPost \
    --namespace "$AB_NAMESPACE" \
    --body '{"token": "zOMDROnJ"}' \
    > test.out 2>&1
eval_tap $? 7 'AdminAccountLinkTokenPost' test.out

#- 8 ArtifactGet
./ng net.accelbyte.sdk.cli.Main ams artifactGet \
    --namespace "$AB_NAMESPACE" \
    --artifactType 'dHb9KWvZ' \
    --count '349' \
    --endDate 'i3ckHHpd' \
    --fleetID '5wrbwKcf' \
    --imageID 'tIbFbVQn' \
    --maxSize '31' \
    --minSize '22' \
    --offset '26' \
    --region 'XWY1xXqL' \
    --serverId '7qBgz5ui' \
    --startDate 'gnTZNiLm' \
    --status 'fYR4BXYM' \
    > test.out 2>&1
eval_tap $? 8 'ArtifactGet' test.out

#- 9 ArtifactBulkDelete
./ng net.accelbyte.sdk.cli.Main ams artifactBulkDelete \
    --namespace "$AB_NAMESPACE" \
    --artifactType 's2NQp9Ne' \
    --fleetId 'sPDMIQpn' \
    --uploadedBefore '1983-01-20' \
    > test.out 2>&1
eval_tap $? 9 'ArtifactBulkDelete' test.out

#- 10 ArtifactUsageGet
./ng net.accelbyte.sdk.cli.Main ams artifactUsageGet \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 10 'ArtifactUsageGet' test.out

#- 11 ArtifactDelete
./ng net.accelbyte.sdk.cli.Main ams artifactDelete \
    --artifactID 'fIOn6RSs' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 11 'ArtifactDelete' test.out

#- 12 ArtifactGetURL
./ng net.accelbyte.sdk.cli.Main ams artifactGetURL \
    --artifactID 'TBaAdD7Q' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 12 'ArtifactGetURL' test.out

#- 13 DevelopmentServerConfigurationList
./ng net.accelbyte.sdk.cli.Main ams developmentServerConfigurationList \
    --namespace "$AB_NAMESPACE" \
    --count '154' \
    --offset '64' \
    > test.out 2>&1
eval_tap $? 13 'DevelopmentServerConfigurationList' test.out

#- 14 DevelopmentServerConfigurationCreate
./ng net.accelbyte.sdk.cli.Main ams developmentServerConfigurationCreate \
    --namespace "$AB_NAMESPACE" \
    --body '{"commandLineArguments": "FShN5NNG", "imageId": "zp7BrXdw", "name": "MkqiMwJa"}' \
    > test.out 2>&1
eval_tap $? 14 'DevelopmentServerConfigurationCreate' test.out

#- 15 DevelopmentServerConfigurationGet
./ng net.accelbyte.sdk.cli.Main ams developmentServerConfigurationGet \
    --developmentServerConfigID '2GRlaF5i' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 15 'DevelopmentServerConfigurationGet' test.out

#- 16 DevelopmentServerConfigurationDelete
./ng net.accelbyte.sdk.cli.Main ams developmentServerConfigurationDelete \
    --developmentServerConfigID 'UeAbs8yg' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 16 'DevelopmentServerConfigurationDelete' test.out

#- 17 FleetList
./ng net.accelbyte.sdk.cli.Main ams fleetList \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 17 'FleetList' test.out

#- 18 FleetCreate
./ng net.accelbyte.sdk.cli.Main ams fleetCreate \
    --namespace "$AB_NAMESPACE" \
    --body '{"active": false, "claimKeys": ["3xubRKMO", "2p6oNFBx", "qVVsAZxA"], "dsHostConfiguration": {"instanceId": "ARKAzY7F", "instanceType": "zROWTE9I", "serversPerVm": 40}, "imageDeploymentProfile": {"commandLine": "P2HBOXQd", "imageId": "sEut7yAx", "portConfigurations": [{"name": "HgKBDPRk", "protocol": "kqaS7v6v"}, {"name": "RYxPdYPk", "protocol": "SKh38Igp"}, {"name": "RW9wqssQ", "protocol": "l7Bl4eAY"}], "timeout": {"creation": 14, "drain": 44, "session": 79, "unresponsive": 81}}, "name": "3Duv0IZ3", "onDemand": true, "regions": [{"bufferSize": 81, "maxServerCount": 29, "minServerCount": 48, "region": "MiW2L4Es"}, {"bufferSize": 81, "maxServerCount": 59, "minServerCount": 75, "region": "2qbYaePv"}, {"bufferSize": 72, "maxServerCount": 25, "minServerCount": 25, "region": "kmtgKnCv"}], "samplingRules": {"coredumps": {"crashed": {"collect": false, "percentage": 74}, "success": {"collect": false, "percentage": 27}}, "logs": {"crashed": {"collect": false, "percentage": 16}, "success": {"collect": false, "percentage": 84}}}}' \
    > test.out 2>&1
eval_tap $? 18 'FleetCreate' test.out

#- 19 FleetGet
./ng net.accelbyte.sdk.cli.Main ams fleetGet \
    --fleetID '5WfrTF5H' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 19 'FleetGet' test.out

#- 20 FleetUpdate
./ng net.accelbyte.sdk.cli.Main ams fleetUpdate \
    --fleetID 'amnBc21w' \
    --namespace "$AB_NAMESPACE" \
    --body '{"active": true, "claimKeys": ["McAo5dwC", "SXppcbFp", "vOgGKnJT"], "dsHostConfiguration": {"instanceId": "246ARsjY", "instanceType": "NIOF9YKv", "serversPerVm": 70}, "imageDeploymentProfile": {"commandLine": "5NhWXKdD", "imageId": "vAt1tF8A", "portConfigurations": [{"name": "Hb2C2GOt", "protocol": "BVpxWlce"}, {"name": "hMYibrkj", "protocol": "QkRjf6nk"}, {"name": "pcoVRcZZ", "protocol": "INVq8g9o"}], "timeout": {"creation": 97, "drain": 10, "session": 92, "unresponsive": 21}}, "name": "6fzxcgTI", "onDemand": true, "regions": [{"bufferSize": 89, "maxServerCount": 88, "minServerCount": 11, "region": "neLG2TtR"}, {"bufferSize": 12, "maxServerCount": 60, "minServerCount": 93, "region": "2KcBa91E"}, {"bufferSize": 29, "maxServerCount": 59, "minServerCount": 56, "region": "p7vRmXBD"}], "samplingRules": {"coredumps": {"crashed": {"collect": true, "percentage": 45}, "success": {"collect": false, "percentage": 98}}, "logs": {"crashed": {"collect": true, "percentage": 72}, "success": {"collect": false, "percentage": 9}}}}' \
    > test.out 2>&1
eval_tap $? 20 'FleetUpdate' test.out

#- 21 FleetDelete
./ng net.accelbyte.sdk.cli.Main ams fleetDelete \
    --fleetID 'zB45YPv3' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 21 'FleetDelete' test.out

#- 22 FleetArtifactSamplingRulesGet
./ng net.accelbyte.sdk.cli.Main ams fleetArtifactSamplingRulesGet \
    --fleetID '4PH3aZld' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 22 'FleetArtifactSamplingRulesGet' test.out

#- 23 FleetArtifactSamplingRulesSet
./ng net.accelbyte.sdk.cli.Main ams fleetArtifactSamplingRulesSet \
    --fleetID '4euIoS9R' \
    --namespace "$AB_NAMESPACE" \
    --body '{"coredumps": {"crashed": {"collect": true, "percentage": 99}, "success": {"collect": true, "percentage": 0}}, "logs": {"crashed": {"collect": false, "percentage": 90}, "success": {"collect": true, "percentage": 77}}}' \
    > test.out 2>&1
eval_tap $? 23 'FleetArtifactSamplingRulesSet' test.out

#- 24 FleetServers
./ng net.accelbyte.sdk.cli.Main ams fleetServers \
    --fleetID 'cTIfIokv' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 24 'FleetServers' test.out

#- 25 FleetServerHistory
./ng net.accelbyte.sdk.cli.Main ams fleetServerHistory \
    --fleetID 'hDXmFxCu' \
    --namespace "$AB_NAMESPACE" \
    --count '20' \
    --offset '80' \
    --reason 'hIHWezvR' \
    --region 'q2cY0KNM' \
    --serverId 'ozbtoGJW' \
    --sortDirection 'fcBjoCzY' \
    --status 'LIJKyhJ1' \
    > test.out 2>&1
eval_tap $? 25 'FleetServerHistory' test.out

#- 26 ImageList
./ng net.accelbyte.sdk.cli.Main ams imageList \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 26 'ImageList' test.out

#- 27 ImageGet
./ng net.accelbyte.sdk.cli.Main ams imageGet \
    --imageID 'Hy7MaiZe' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 27 'ImageGet' test.out

#- 28 ImageMarkForDeletion
./ng net.accelbyte.sdk.cli.Main ams imageMarkForDeletion \
    --imageID 'wa3P89qR' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 28 'ImageMarkForDeletion' test.out

#- 29 ImagePatch
./ng net.accelbyte.sdk.cli.Main ams imagePatch \
    --imageID 'e7bz6E6r' \
    --namespace "$AB_NAMESPACE" \
    --body '{"addedTags": ["BOJXlzRN", "jADroFUP", "k7pmpZtb"], "isProtected": true, "name": "u1OlGBlV", "removedTags": ["xDjZ4Sw9", "rBkhwryX", "DUsbuS5g"]}' \
    > test.out 2>&1
eval_tap $? 29 'ImagePatch' test.out

#- 30 ImageUnmarkForDeletion
./ng net.accelbyte.sdk.cli.Main ams imageUnmarkForDeletion \
    --imageID 'Z8nDU5JX' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 30 'ImageUnmarkForDeletion' test.out

#- 31 QoSRegionsGet
./ng net.accelbyte.sdk.cli.Main ams qoSRegionsGet \
    --namespace "$AB_NAMESPACE" \
    --status 'pJ29RoKQ' \
    > test.out 2>&1
eval_tap $? 31 'QoSRegionsGet' test.out

#- 32 QoSRegionsUpdate
./ng net.accelbyte.sdk.cli.Main ams qoSRegionsUpdate \
    --namespace "$AB_NAMESPACE" \
    --region 'EehK2t06' \
    --body '{"status": "4hvg4InK"}' \
    > test.out 2>&1
eval_tap $? 32 'QoSRegionsUpdate' test.out

#- 33 InfoRegions
./ng net.accelbyte.sdk.cli.Main ams infoRegions \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 33 'InfoRegions' test.out

#- 34 FleetServerInfo
./ng net.accelbyte.sdk.cli.Main ams fleetServerInfo \
    --namespace "$AB_NAMESPACE" \
    --serverID 'fag5KJ8g' \
    > test.out 2>&1
eval_tap $? 34 'FleetServerInfo' test.out

#- 35 FleetServerConnectionInfo
./ng net.accelbyte.sdk.cli.Main ams fleetServerConnectionInfo \
    --namespace "$AB_NAMESPACE" \
    --serverID 'FU9ZPhvR' \
    > test.out 2>&1
eval_tap $? 35 'FleetServerConnectionInfo' test.out

#- 36 ServerHistory
./ng net.accelbyte.sdk.cli.Main ams serverHistory \
    --namespace "$AB_NAMESPACE" \
    --serverID 'evlYaPQN' \
    > test.out 2>&1
eval_tap $? 36 'ServerHistory' test.out

#- 37 InfoSupportedInstances
./ng net.accelbyte.sdk.cli.Main ams infoSupportedInstances \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 37 'InfoSupportedInstances' test.out

#- 38 AccountGet
./ng net.accelbyte.sdk.cli.Main ams accountGet \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 38 'AccountGet' test.out

#- 39 FleetClaimByID
./ng net.accelbyte.sdk.cli.Main ams fleetClaimByID \
    --fleetID 'RYXuK3lH' \
    --namespace "$AB_NAMESPACE" \
    --body '{"region": "9Eqlh7BB", "sessionId": "M8g7SWpz"}' \
    > test.out 2>&1
eval_tap $? 39 'FleetClaimByID' test.out

#- 40 LocalWatchdogConnect
./ng net.accelbyte.sdk.cli.Main ams localWatchdogConnect \
    --namespace "$AB_NAMESPACE" \
    --watchdogID 'HM3YQBxR' \
    > test.out 2>&1
eval_tap $? 40 'LocalWatchdogConnect' test.out

#- 41 FleetClaimByKeys
./ng net.accelbyte.sdk.cli.Main ams fleetClaimByKeys \
    --namespace "$AB_NAMESPACE" \
    --body '{"claimKeys": ["wTH9nssh", "Irq88YUb", "kLHF5Cm8"], "regions": ["2DMnndjL", "uLuerpPu", "VKfMNwhj"], "sessionId": "5NV9yNWP"}' \
    > test.out 2>&1
eval_tap $? 41 'FleetClaimByKeys' test.out

#- 42 WatchdogConnect
./ng net.accelbyte.sdk.cli.Main ams watchdogConnect \
    --namespace "$AB_NAMESPACE" \
    --watchdogID 'WRF58SmQ' \
    > test.out 2>&1
eval_tap $? 42 'WatchdogConnect' test.out

#- 43 UploadURLGet
./ng net.accelbyte.sdk.cli.Main ams uploadURLGet \
    > test.out 2>&1
eval_tap $? 43 'UploadURLGet' test.out

#- 44 Func1
./ng net.accelbyte.sdk.cli.Main ams func1 \
    > test.out 2>&1
eval_tap $? 44 'Func1' test.out

#- 45 BasicHealthCheck
./ng net.accelbyte.sdk.cli.Main ams basicHealthCheck \
    > test.out 2>&1
eval_tap $? 45 'BasicHealthCheck' test.out


rm -f "tmp.dat"

exit $EXIT_CODE