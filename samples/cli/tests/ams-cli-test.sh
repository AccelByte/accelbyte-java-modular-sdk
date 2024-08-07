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
    --body '{"name": "UhhPfmUF"}' \
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
    --body '{"token": "DoJUGmpO"}' \
    > test.out 2>&1
eval_tap $? 7 'AdminAccountLinkTokenPost' test.out

#- 8 ArtifactGet
./ng net.accelbyte.sdk.cli.Main ams artifactGet \
    --namespace "$AB_NAMESPACE" \
    --artifactType 'NjzR55cW' \
    --count '315' \
    --endDate '5HOXuX7r' \
    --fleetID 'Fh2fP9Pc' \
    --imageID 'e60KDDMm' \
    --maxSize '90' \
    --minSize '72' \
    --offset '14' \
    --region 'jzTskRXW' \
    --serverId 'vkzu9v0C' \
    --startDate 'gJApe3Tm' \
    --status '7iRxqGUa' \
    > test.out 2>&1
eval_tap $? 8 'ArtifactGet' test.out

#- 9 ArtifactBulkDelete
./ng net.accelbyte.sdk.cli.Main ams artifactBulkDelete \
    --namespace "$AB_NAMESPACE" \
    --artifactType 'zvzoEKPw' \
    --fleetId 'H328Wwx3' \
    --uploadedBefore '1993-01-22' \
    > test.out 2>&1
eval_tap $? 9 'ArtifactBulkDelete' test.out

#- 10 ArtifactUsageGet
./ng net.accelbyte.sdk.cli.Main ams artifactUsageGet \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 10 'ArtifactUsageGet' test.out

#- 11 ArtifactDelete
./ng net.accelbyte.sdk.cli.Main ams artifactDelete \
    --artifactID 'py8SVtmW' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 11 'ArtifactDelete' test.out

#- 12 ArtifactGetURL
./ng net.accelbyte.sdk.cli.Main ams artifactGetURL \
    --artifactID 'k09qP7Vr' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 12 'ArtifactGetURL' test.out

#- 13 DevelopmentServerConfigurationList
./ng net.accelbyte.sdk.cli.Main ams developmentServerConfigurationList \
    --namespace "$AB_NAMESPACE" \
    --count '249' \
    --offset '54' \
    > test.out 2>&1
eval_tap $? 13 'DevelopmentServerConfigurationList' test.out

#- 14 DevelopmentServerConfigurationCreate
./ng net.accelbyte.sdk.cli.Main ams developmentServerConfigurationCreate \
    --namespace "$AB_NAMESPACE" \
    --body '{"commandLineArguments": "hO3mIkya", "imageId": "QKH1vcrI", "name": "kbXJPtBl"}' \
    > test.out 2>&1
eval_tap $? 14 'DevelopmentServerConfigurationCreate' test.out

#- 15 DevelopmentServerConfigurationGet
./ng net.accelbyte.sdk.cli.Main ams developmentServerConfigurationGet \
    --developmentServerConfigID 'vBCTVP4X' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 15 'DevelopmentServerConfigurationGet' test.out

#- 16 DevelopmentServerConfigurationDelete
./ng net.accelbyte.sdk.cli.Main ams developmentServerConfigurationDelete \
    --developmentServerConfigID 'XtInxXoG' \
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
    --body '{"active": true, "claimKeys": ["uaRq4R9Z", "Jf6Skh8M", "EKBV2FnT"], "dsHostConfiguration": {"instanceId": "ygp7AvJ6", "instanceType": "5EIlbOeA", "serversPerVm": 57}, "imageDeploymentProfile": {"commandLine": "C7KznTxC", "imageId": "CSn8DDxR", "portConfigurations": [{"name": "EvdG6kH4", "protocol": "RxiEDUr2"}, {"name": "OLI7A0tU", "protocol": "w6aLV9Eg"}, {"name": "HYC2ssnH", "protocol": "NSf6oiwx"}], "timeout": {"creation": 51, "drain": 66, "session": 66, "unresponsive": 14}}, "name": "p6wD1q4i", "onDemand": false, "regions": [{"bufferSize": 60, "dynamicBuffer": false, "maxServerCount": 88, "minServerCount": 80, "region": "z7EGqNPH"}, {"bufferSize": 15, "dynamicBuffer": false, "maxServerCount": 96, "minServerCount": 81, "region": "vSaxGekd"}, {"bufferSize": 3, "dynamicBuffer": false, "maxServerCount": 100, "minServerCount": 8, "region": "JiCu1uFr"}], "samplingRules": {"coredumps": {"crashed": {"collect": true, "percentage": 94}, "success": {"collect": false, "percentage": 54}}, "logs": {"crashed": {"collect": true, "percentage": 98}, "success": {"collect": false, "percentage": 71}}}}' \
    > test.out 2>&1
eval_tap $? 18 'FleetCreate' test.out

#- 19 FleetGet
./ng net.accelbyte.sdk.cli.Main ams fleetGet \
    --fleetID 'T245YjER' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 19 'FleetGet' test.out

#- 20 FleetUpdate
./ng net.accelbyte.sdk.cli.Main ams fleetUpdate \
    --fleetID '5Dcki5GN' \
    --namespace "$AB_NAMESPACE" \
    --body '{"active": true, "claimKeys": ["1cs8989K", "xMyyl2MG", "0M6bsU7W"], "dsHostConfiguration": {"instanceId": "XG65DnhE", "instanceType": "vOUGPXv8", "serversPerVm": 91}, "imageDeploymentProfile": {"commandLine": "USCqmqGL", "imageId": "Zc1qKRIu", "portConfigurations": [{"name": "8Kz1Q5N7", "protocol": "smGxmJIz"}, {"name": "JpBscVxi", "protocol": "InUaqOMI"}, {"name": "O1dUuFim", "protocol": "UqMWHMs7"}], "timeout": {"creation": 14, "drain": 38, "session": 36, "unresponsive": 48}}, "name": "g4SZFjYy", "onDemand": true, "regions": [{"bufferSize": 6, "dynamicBuffer": false, "maxServerCount": 49, "minServerCount": 87, "region": "bCVXFKUC"}, {"bufferSize": 100, "dynamicBuffer": true, "maxServerCount": 3, "minServerCount": 44, "region": "g7RvJYOM"}, {"bufferSize": 32, "dynamicBuffer": false, "maxServerCount": 95, "minServerCount": 35, "region": "2asCxyPE"}], "samplingRules": {"coredumps": {"crashed": {"collect": true, "percentage": 70}, "success": {"collect": true, "percentage": 44}}, "logs": {"crashed": {"collect": true, "percentage": 2}, "success": {"collect": false, "percentage": 12}}}}' \
    > test.out 2>&1
eval_tap $? 20 'FleetUpdate' test.out

#- 21 FleetDelete
./ng net.accelbyte.sdk.cli.Main ams fleetDelete \
    --fleetID 'JLtm6kUQ' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 21 'FleetDelete' test.out

#- 22 FleetArtifactSamplingRulesGet
./ng net.accelbyte.sdk.cli.Main ams fleetArtifactSamplingRulesGet \
    --fleetID 'jVZNmKYU' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 22 'FleetArtifactSamplingRulesGet' test.out

#- 23 FleetArtifactSamplingRulesSet
./ng net.accelbyte.sdk.cli.Main ams fleetArtifactSamplingRulesSet \
    --fleetID '3K3G0E9T' \
    --namespace "$AB_NAMESPACE" \
    --body '{"coredumps": {"crashed": {"collect": true, "percentage": 10}, "success": {"collect": false, "percentage": 53}}, "logs": {"crashed": {"collect": true, "percentage": 76}, "success": {"collect": false, "percentage": 32}}}' \
    > test.out 2>&1
eval_tap $? 23 'FleetArtifactSamplingRulesSet' test.out

#- 24 FleetServers
./ng net.accelbyte.sdk.cli.Main ams fleetServers \
    --fleetID 'kJt5DvNP' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 24 'FleetServers' test.out

#- 25 FleetServerHistory
./ng net.accelbyte.sdk.cli.Main ams fleetServerHistory \
    --fleetID '7YGVLiOk' \
    --namespace "$AB_NAMESPACE" \
    --count '22' \
    --offset '31' \
    --reason 'Flh6JAaW' \
    --region 'BgTAmCqq' \
    --serverId 'x8LkwE1y' \
    --sortDirection 'FThqy8mF' \
    --status 'G0L1d8wj' \
    > test.out 2>&1
eval_tap $? 25 'FleetServerHistory' test.out

#- 26 ImageList
./ng net.accelbyte.sdk.cli.Main ams imageList \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 26 'ImageList' test.out

#- 27 ImagesStorage
./ng net.accelbyte.sdk.cli.Main ams imagesStorage \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 27 'ImagesStorage' test.out

#- 28 ImageGet
./ng net.accelbyte.sdk.cli.Main ams imageGet \
    --imageID '0L1joOEN' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 28 'ImageGet' test.out

#- 29 ImageMarkForDeletion
./ng net.accelbyte.sdk.cli.Main ams imageMarkForDeletion \
    --imageID 'Xf8GicHU' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 29 'ImageMarkForDeletion' test.out

#- 30 ImagePatch
./ng net.accelbyte.sdk.cli.Main ams imagePatch \
    --imageID 'eV1eynAZ' \
    --namespace "$AB_NAMESPACE" \
    --body '{"addedTags": ["XmmOQnFb", "YnaQPwFa", "aVhNAT3Y"], "isProtected": true, "name": "qdBFoiU6", "removedTags": ["sF5VgmLG", "dQtiaQEu", "MinrB55q"]}' \
    > test.out 2>&1
eval_tap $? 30 'ImagePatch' test.out

#- 31 ImageUnmarkForDeletion
./ng net.accelbyte.sdk.cli.Main ams imageUnmarkForDeletion \
    --imageID 'Jmp4BCGZ' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 31 'ImageUnmarkForDeletion' test.out

#- 32 QoSRegionsGet
./ng net.accelbyte.sdk.cli.Main ams qoSRegionsGet \
    --namespace "$AB_NAMESPACE" \
    --status 'oGXHoNqz' \
    > test.out 2>&1
eval_tap $? 32 'QoSRegionsGet' test.out

#- 33 QoSRegionsUpdate
./ng net.accelbyte.sdk.cli.Main ams qoSRegionsUpdate \
    --namespace "$AB_NAMESPACE" \
    --region 'lNlrk9Hu' \
    --body '{"status": "Fwzu0nNr"}' \
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
    --serverID 'P9dNYTCt' \
    > test.out 2>&1
eval_tap $? 35 'FleetServerInfo' test.out

#- 36 FleetServerConnectionInfo
./ng net.accelbyte.sdk.cli.Main ams fleetServerConnectionInfo \
    --namespace "$AB_NAMESPACE" \
    --serverID '0lvR96Ss' \
    > test.out 2>&1
eval_tap $? 36 'FleetServerConnectionInfo' test.out

#- 37 ServerHistory
./ng net.accelbyte.sdk.cli.Main ams serverHistory \
    --namespace "$AB_NAMESPACE" \
    --serverID 'S4RPt3HC' \
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
    --fleetID 'XGlIPeUC' \
    --namespace "$AB_NAMESPACE" \
    --body '{"region": "Na9keRqx", "sessionId": "xIfZ58KN"}' \
    > test.out 2>&1
eval_tap $? 40 'FleetClaimByID' test.out

#- 41 LocalWatchdogConnect
./ng net.accelbyte.sdk.cli.Main ams localWatchdogConnect \
    --namespace "$AB_NAMESPACE" \
    --watchdogID 'o3NCMFeU' \
    > test.out 2>&1
eval_tap $? 41 'LocalWatchdogConnect' test.out

#- 42 FleetClaimByKeys
./ng net.accelbyte.sdk.cli.Main ams fleetClaimByKeys \
    --namespace "$AB_NAMESPACE" \
    --body '{"claimKeys": ["e9UZxfJQ", "bU15Awgq", "wqTZKoQY"], "regions": ["VRUlnuBJ", "sJv9cOMw", "U2Lr3xSe"], "sessionId": "bMhZpCzz"}' \
    > test.out 2>&1
eval_tap $? 42 'FleetClaimByKeys' test.out

#- 43 WatchdogConnect
./ng net.accelbyte.sdk.cli.Main ams watchdogConnect \
    --namespace "$AB_NAMESPACE" \
    --watchdogID 'WejZABMS' \
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