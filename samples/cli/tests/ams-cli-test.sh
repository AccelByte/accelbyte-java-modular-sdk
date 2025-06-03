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
    --body '{"name": "lwxrkWxi"}' \
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
    --body '{"token": "3QdhJWQF"}' \
    > test.out 2>&1
eval_tap $? 7 'AdminAccountLink' test.out

#- 8 ArtifactGet
./ng net.accelbyte.sdk.cli.Main ams artifactGet \
    --namespace "$AB_NAMESPACE" \
    --artifactType 'wWdvGQFd' \
    --count '474' \
    --endDate 'DxYQDDBl' \
    --fleetID 'XwkDZzE1' \
    --imageID 'NI9W9UPC' \
    --maxSize '42' \
    --minSize '8' \
    --offset '37' \
    --region 'hyYgUo9I' \
    --serverId 'MyZDz3EL' \
    --sortBy 'pz0SmjmZ' \
    --sortDirection 'desc' \
    --startDate '7DxQuZWc' \
    --status 'GMm9tINs' \
    > test.out 2>&1
eval_tap $? 8 'ArtifactGet' test.out

#- 9 ArtifactBulkDelete
./ng net.accelbyte.sdk.cli.Main ams artifactBulkDelete \
    --namespace "$AB_NAMESPACE" \
    --artifactType 'B3psPF78' \
    --fleetId 'PlXR9VRI' \
    --uploadedBefore '1997-12-18' \
    > test.out 2>&1
eval_tap $? 9 'ArtifactBulkDelete' test.out

#- 10 ArtifactUsageGet
./ng net.accelbyte.sdk.cli.Main ams artifactUsageGet \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 10 'ArtifactUsageGet' test.out

#- 11 ArtifactDelete
./ng net.accelbyte.sdk.cli.Main ams artifactDelete \
    --artifactID '0CCi9HZW' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 11 'ArtifactDelete' test.out

#- 12 ArtifactGetURL
./ng net.accelbyte.sdk.cli.Main ams artifactGetURL \
    --artifactID 'G8xfuuS8' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 12 'ArtifactGetURL' test.out

#- 13 DevelopmentServerConfigurationList
./ng net.accelbyte.sdk.cli.Main ams developmentServerConfigurationList \
    --namespace "$AB_NAMESPACE" \
    --count '421' \
    --offset '19' \
    > test.out 2>&1
eval_tap $? 13 'DevelopmentServerConfigurationList' test.out

#- 14 DevelopmentServerConfigurationCreate
./ng net.accelbyte.sdk.cli.Main ams developmentServerConfigurationCreate \
    --namespace "$AB_NAMESPACE" \
    --body '{"commandLineArguments": "1SkBvVTl", "expiresAt": "1980-03-26T00:00:00Z", "imageId": "IKLcuqwI", "name": "KF134ZzK"}' \
    > test.out 2>&1
eval_tap $? 14 'DevelopmentServerConfigurationCreate' test.out

#- 15 DevelopmentServerConfigurationGet
./ng net.accelbyte.sdk.cli.Main ams developmentServerConfigurationGet \
    --developmentServerConfigID '3x2O2Bvp' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 15 'DevelopmentServerConfigurationGet' test.out

#- 16 DevelopmentServerConfigurationDelete
./ng net.accelbyte.sdk.cli.Main ams developmentServerConfigurationDelete \
    --developmentServerConfigID 'WHmczagH' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 16 'DevelopmentServerConfigurationDelete' test.out

#- 17 DevelopmentServerConfigurationPatch
./ng net.accelbyte.sdk.cli.Main ams developmentServerConfigurationPatch \
    --developmentServerConfigID 'KBxKuriB' \
    --namespace "$AB_NAMESPACE" \
    --body '{"commandLineArguments": "cucQazAZ", "expiresAt": "1991-11-05T00:00:00Z"}' \
    > test.out 2>&1
eval_tap $? 17 'DevelopmentServerConfigurationPatch' test.out

#- 18 FleetList
./ng net.accelbyte.sdk.cli.Main ams fleetList \
    --namespace "$AB_NAMESPACE" \
    --active  \
    --count '61' \
    --name 'wVoapLja' \
    --offset '88' \
    --region 'XjlfMwSU' \
    --sortBy 'name' \
    --sortDirection 'asc' \
    > test.out 2>&1
eval_tap $? 18 'FleetList' test.out

#- 19 FleetCreate
./ng net.accelbyte.sdk.cli.Main ams fleetCreate \
    --namespace "$AB_NAMESPACE" \
    --body '{"active": false, "claimKeys": ["KOis6E4v", "mv7j2Qj4", "5Q0InsCS"], "dsHostConfiguration": {"instanceId": "J5fZDmBx", "serversPerVm": 6}, "fallbackFleet": "pQsaTGfl", "imageDeploymentProfile": {"commandLine": "CNHXsxhY", "imageId": "vRKGEOGm", "portConfigurations": [{"name": "VmOjZPKT", "protocol": "lSjTLQR1"}, {"name": "pepIFHhK", "protocol": "C6J7hQM6"}, {"name": "XsGg2KLI", "protocol": "WJP4YAnQ"}], "timeout": {"claim": 94, "creation": 24, "drain": 23, "session": 75, "unresponsive": 70}}, "name": "z1QUtJdv", "onDemand": true, "regions": [{"bufferSize": 45, "dynamicBuffer": true, "maxServerCount": 8, "minServerCount": 10, "region": "txH26ed8"}, {"bufferSize": 76, "dynamicBuffer": false, "maxServerCount": 27, "minServerCount": 96, "region": "Q9AdWuXj"}, {"bufferSize": 7, "dynamicBuffer": false, "maxServerCount": 71, "minServerCount": 63, "region": "gUhsllnH"}], "samplingRules": {"coredumps": {"crashed": {"collect": false, "percentage": 66}}, "logs": {"crashed": {"collect": false, "percentage": 67}, "success": {"collect": true, "percentage": 88}, "unclaimed": {"collect": true, "percentage": 13}}}}' \
    > test.out 2>&1
eval_tap $? 19 'FleetCreate' test.out

#- 20 FleetGet
./ng net.accelbyte.sdk.cli.Main ams fleetGet \
    --fleetID 'Bgo3AKGq' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 20 'FleetGet' test.out

#- 21 FleetUpdate
./ng net.accelbyte.sdk.cli.Main ams fleetUpdate \
    --fleetID '7gXvCab6' \
    --namespace "$AB_NAMESPACE" \
    --body '{"active": true, "claimKeys": ["JmqYETcb", "W92cyVtO", "6DKc6jVW"], "dsHostConfiguration": {"instanceId": "0pL92hn0", "serversPerVm": 37}, "fallbackFleet": "Y7LTgPNG", "imageDeploymentProfile": {"commandLine": "NnckpqoA", "imageId": "f7tTZviu", "portConfigurations": [{"name": "Jtolcg4K", "protocol": "YD2OyknL"}, {"name": "0uoCVC5K", "protocol": "fC9GPokn"}, {"name": "0BmAid6E", "protocol": "tKMe69XJ"}], "timeout": {"claim": 70, "creation": 84, "drain": 48, "session": 29, "unresponsive": 23}}, "name": "j5dbzYOt", "onDemand": true, "regions": [{"bufferSize": 79, "dynamicBuffer": true, "maxServerCount": 29, "minServerCount": 25, "region": "RezhMssl"}, {"bufferSize": 58, "dynamicBuffer": true, "maxServerCount": 40, "minServerCount": 12, "region": "ZKNay5Cl"}, {"bufferSize": 40, "dynamicBuffer": false, "maxServerCount": 24, "minServerCount": 68, "region": "udE0iLPN"}], "samplingRules": {"coredumps": {"crashed": {"collect": true, "percentage": 74}}, "logs": {"crashed": {"collect": false, "percentage": 96}, "success": {"collect": true, "percentage": 42}, "unclaimed": {"collect": false, "percentage": 30}}}}' \
    > test.out 2>&1
eval_tap $? 21 'FleetUpdate' test.out

#- 22 FleetDelete
./ng net.accelbyte.sdk.cli.Main ams fleetDelete \
    --fleetID 'DqT3ZGPo' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 22 'FleetDelete' test.out

#- 23 FleetArtifactSamplingRulesGet
./ng net.accelbyte.sdk.cli.Main ams fleetArtifactSamplingRulesGet \
    --fleetID 'kTFQgM83' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 23 'FleetArtifactSamplingRulesGet' test.out

#- 24 FleetArtifactSamplingRulesSet
./ng net.accelbyte.sdk.cli.Main ams fleetArtifactSamplingRulesSet \
    --fleetID 'ksdYeYbp' \
    --namespace "$AB_NAMESPACE" \
    --body '{"coredumps": {"crashed": {"collect": true, "percentage": 68}}, "logs": {"crashed": {"collect": true, "percentage": 92}, "success": {"collect": false, "percentage": 46}, "unclaimed": {"collect": false, "percentage": 37}}}' \
    > test.out 2>&1
eval_tap $? 24 'FleetArtifactSamplingRulesSet' test.out

#- 25 FleetServers
./ng net.accelbyte.sdk.cli.Main ams fleetServers \
    --fleetID 'wfh7kG7r' \
    --namespace "$AB_NAMESPACE" \
    --count '56' \
    --offset '91' \
    --region 'PJCzWRGp' \
    --serverId 'QxSSisb5' \
    --sortBy 'iO67XiiJ' \
    --sortDirection 'asc' \
    --status 'unresponsive' \
    > test.out 2>&1
eval_tap $? 25 'FleetServers' test.out

#- 26 FleetServerHistory
./ng net.accelbyte.sdk.cli.Main ams fleetServerHistory \
    --fleetID 'OK8gmj9s' \
    --namespace "$AB_NAMESPACE" \
    --count '44' \
    --offset '87' \
    --reason 'AppHkmlX' \
    --region 't7LHXLfd' \
    --serverId 'RIz1heka' \
    --sortDirection 'b5D0MfqD' \
    --status 'PdkjoLjy' \
    > test.out 2>&1
eval_tap $? 26 'FleetServerHistory' test.out

#- 27 ImageList
./ng net.accelbyte.sdk.cli.Main ams imageList \
    --namespace "$AB_NAMESPACE" \
    --count '49' \
    --inUse '8bkzMlor' \
    --isProtected  \
    --name 'NfAhKvBF' \
    --offset '55' \
    --sortBy 'XfcWnHFY' \
    --sortDirection '4mTuh84D' \
    --status 'GSBuLqOO' \
    --tag 'mQISSae0' \
    > test.out 2>&1
eval_tap $? 27 'ImageList' test.out

#- 28 ImagesStorage
./ng net.accelbyte.sdk.cli.Main ams imagesStorage \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 28 'ImagesStorage' test.out

#- 29 ImageGet
./ng net.accelbyte.sdk.cli.Main ams imageGet \
    --imageID 'dX6xzIfx' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 29 'ImageGet' test.out

#- 30 ImageMarkForDeletion
./ng net.accelbyte.sdk.cli.Main ams imageMarkForDeletion \
    --imageID 'Lce2oCdM' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 30 'ImageMarkForDeletion' test.out

#- 31 ImagePatch
./ng net.accelbyte.sdk.cli.Main ams imagePatch \
    --imageID '6Wl3MrGg' \
    --namespace "$AB_NAMESPACE" \
    --body '{"addedTags": ["k4poc3kW", "HctYlNdX", "9mjc2nDV"], "isProtected": false, "name": "yICuhWHD", "removedTags": ["qKwilgQS", "JD6wdu4u", "QkKmYgdG"]}' \
    > test.out 2>&1
eval_tap $? 31 'ImagePatch' test.out

#- 32 ImageUnmarkForDeletion
./ng net.accelbyte.sdk.cli.Main ams imageUnmarkForDeletion \
    --imageID 'wabrTUgL' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 32 'ImageUnmarkForDeletion' test.out

#- 33 QoSRegionsGet
./ng net.accelbyte.sdk.cli.Main ams qoSRegionsGet \
    --namespace "$AB_NAMESPACE" \
    --status '8gW9CPl3' \
    > test.out 2>&1
eval_tap $? 33 'QoSRegionsGet' test.out

#- 34 QoSRegionsUpdate
./ng net.accelbyte.sdk.cli.Main ams qoSRegionsUpdate \
    --namespace "$AB_NAMESPACE" \
    --region '0zvQIavY' \
    --body '{"status": "fYIE2b7C"}' \
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
    --serverID 'yJoAedtQ' \
    > test.out 2>&1
eval_tap $? 36 'FleetServerInfo' test.out

#- 37 FleetServerConnectionInfo
./ng net.accelbyte.sdk.cli.Main ams fleetServerConnectionInfo \
    --namespace "$AB_NAMESPACE" \
    --serverID 'QdTnigd5' \
    > test.out 2>&1
eval_tap $? 37 'FleetServerConnectionInfo' test.out

#- 38 ServerHistory
./ng net.accelbyte.sdk.cli.Main ams serverHistory \
    --namespace "$AB_NAMESPACE" \
    --serverID 'qSSRcKUj' \
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
    --fleetID 'cWxLgCNe' \
    --namespace "$AB_NAMESPACE" \
    --body '{"region": "xvR0lv5p", "sessionId": "eEkgwPfF"}' \
    > test.out 2>&1
eval_tap $? 41 'FleetClaimByID' test.out

#- 42 LocalWatchdogConnect
./ng net.accelbyte.sdk.cli.Main ams localWatchdogConnect \
    --namespace "$AB_NAMESPACE" \
    --watchdogID 'BzZzU10u' \
    > test.out 2>&1
eval_tap $? 42 'LocalWatchdogConnect' test.out

#- 43 FleetClaimByKeys
./ng net.accelbyte.sdk.cli.Main ams fleetClaimByKeys \
    --namespace "$AB_NAMESPACE" \
    --body '{"claimKeys": ["YF5cvSmo", "zvT9iqUQ", "4GShz6A9"], "regions": ["FkoRH0dw", "BUUz46VD", "wtcVelUo"], "sessionId": "589cVBrs"}' \
    > test.out 2>&1
eval_tap $? 43 'FleetClaimByKeys' test.out

#- 44 WatchdogConnect
./ng net.accelbyte.sdk.cli.Main ams watchdogConnect \
    --namespace "$AB_NAMESPACE" \
    --watchdogID 'zgi1C4hZ' \
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