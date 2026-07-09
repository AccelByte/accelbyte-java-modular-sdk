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
    --body '{"name": "qR46YvvR"}' \
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
    --body '{"token": "UX6zjViI"}' \
    > test.out 2>&1
eval_tap $? 7 'AdminAccountLink' test.out

#- 8 ArtifactGet
./ng net.accelbyte.sdk.cli.Main ams artifactGet \
    --namespace "$AB_NAMESPACE" \
    --artifactType 'Xk7XZCKR' \
    --count '482' \
    --endDate 'XsuIzFy8' \
    --fleetID 'GZAl7K6W' \
    --imageID 'UDfUUqVZ' \
    --maxSize '42' \
    --minSize '0' \
    --offset '3' \
    --region '584MCCmF' \
    --serverId 'vYvw7h0X' \
    --sortBy 'xR1B6sAM' \
    --sortDirection 'desc' \
    --startDate '8VVogsHi' \
    --status 'rCyrXjae' \
    > test.out 2>&1
eval_tap $? 8 'ArtifactGet' test.out

#- 9 ArtifactBulkDelete
./ng net.accelbyte.sdk.cli.Main ams artifactBulkDelete \
    --namespace "$AB_NAMESPACE" \
    --artifactType 'uyMhMdle' \
    --fleetId 'c0E6d5wY' \
    --uploadedBefore '1988-02-24' \
    > test.out 2>&1
eval_tap $? 9 'ArtifactBulkDelete' test.out

#- 10 ArtifactUsageGet
./ng net.accelbyte.sdk.cli.Main ams artifactUsageGet \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 10 'ArtifactUsageGet' test.out

#- 11 ArtifactDelete
./ng net.accelbyte.sdk.cli.Main ams artifactDelete \
    --artifactID 'epRM6RFE' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 11 'ArtifactDelete' test.out

#- 12 ArtifactGetURL
./ng net.accelbyte.sdk.cli.Main ams artifactGetURL \
    --artifactID 'qnKFuLJE' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 12 'ArtifactGetURL' test.out

#- 13 DevelopmentServerConfigurationList
./ng net.accelbyte.sdk.cli.Main ams developmentServerConfigurationList \
    --namespace "$AB_NAMESPACE" \
    --count '393' \
    --imageId 'iK9g86tn' \
    --name 'XqYws73K' \
    --offset '18' \
    --sortBy 'expires_at' \
    --sortDirection 'desc' \
    > test.out 2>&1
eval_tap $? 13 'DevelopmentServerConfigurationList' test.out

#- 14 DevelopmentServerConfigurationCreate
./ng net.accelbyte.sdk.cli.Main ams developmentServerConfigurationCreate \
    --namespace "$AB_NAMESPACE" \
    --body '{"commandLineArguments": "vT8lWRDh", "expiresAt": "1988-05-02T00:00:00Z", "imageId": "qBiojNis", "name": "GyCtkHep"}' \
    > test.out 2>&1
eval_tap $? 14 'DevelopmentServerConfigurationCreate' test.out

#- 15 DevelopmentServerConfigurationGet
./ng net.accelbyte.sdk.cli.Main ams developmentServerConfigurationGet \
    --developmentServerConfigID 'ONe0B8Ua' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 15 'DevelopmentServerConfigurationGet' test.out

#- 16 DevelopmentServerConfigurationDelete
./ng net.accelbyte.sdk.cli.Main ams developmentServerConfigurationDelete \
    --developmentServerConfigID 'c46g8Y1P' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 16 'DevelopmentServerConfigurationDelete' test.out

#- 17 DevelopmentServerConfigurationPatch
./ng net.accelbyte.sdk.cli.Main ams developmentServerConfigurationPatch \
    --developmentServerConfigID '4ySvYk2s' \
    --namespace "$AB_NAMESPACE" \
    --body '{"commandLineArguments": "Ci7aNyuw", "expiresAt": "1991-12-20T00:00:00Z"}' \
    > test.out 2>&1
eval_tap $? 17 'DevelopmentServerConfigurationPatch' test.out

#- 18 FleetList
./ng net.accelbyte.sdk.cli.Main ams fleetList \
    --namespace "$AB_NAMESPACE" \
    --active  \
    --count '72' \
    --includeInactiveRegions  \
    --name 'L8Lt3u3h' \
    --offset '37' \
    --region 'VDkZVBBm' \
    --sortBy 'name' \
    --sortDirection 'desc' \
    > test.out 2>&1
eval_tap $? 18 'FleetList' test.out

#- 19 FleetCreate
./ng net.accelbyte.sdk.cli.Main ams fleetCreate \
    --namespace "$AB_NAMESPACE" \
    --body '{"active": false, "claimKeys": ["V1vrns9l", "X9Gv7iMa", "jNpguPE2"], "dsHostConfiguration": {"instanceId": "y2KWTJeW", "serversPerVm": 88}, "fallbackFleet": "jaWMTKU2", "hibernateAfterPeriod": "lyVMzKnJ", "imageDeploymentProfile": {"commandLine": "zYLxgqm8", "imageId": "YG1fQvji", "portConfigurations": [{"name": "CrennvEU", "protocol": "VOvaKobk"}, {"name": "ien7T4iY", "protocol": "gVrXg0w8"}, {"name": "ua5IncYp", "protocol": "ZHk7XrZB"}], "timeout": {"claim": 17, "creation": 46, "drain": 61, "session": 20, "unresponsive": 3}}, "name": "liid3vc9", "onDemand": false, "regions": [{"bufferSize": 10, "dynamicBuffer": false, "maxServerCount": 94, "minServerCount": 16, "region": "lmWDLzYo", "state": "glVrgr5g"}, {"bufferSize": 70, "dynamicBuffer": true, "maxServerCount": 78, "minServerCount": 69, "region": "PxK4watt", "state": "PZWFGO1Q"}, {"bufferSize": 84, "dynamicBuffer": false, "maxServerCount": 64, "minServerCount": 33, "region": "QGDGvD02", "state": "MJ7Mojzb"}], "samplingRules": {"coredumps": {"crashed": {"collect": true, "percentage": 78}}, "logs": {"crashed": {"collect": false, "percentage": 15}, "success": {"collect": false, "percentage": 19}, "unclaimed": {"collect": false, "percentage": 14}}}}' \
    > test.out 2>&1
eval_tap $? 19 'FleetCreate' test.out

#- 20 BulkFleetDelete
./ng net.accelbyte.sdk.cli.Main ams bulkFleetDelete \
    --namespace "$AB_NAMESPACE" \
    --body '{"fleetIds": ["Zve7K8cH", "dysymsmn", "Okr3vRGQ"]}' \
    > test.out 2>&1
eval_tap $? 20 'BulkFleetDelete' test.out

#- 21 FleetGet
./ng net.accelbyte.sdk.cli.Main ams fleetGet \
    --fleetID 'Sk6p00s5' \
    --namespace "$AB_NAMESPACE" \
    --includeInactiveRegions  \
    > test.out 2>&1
eval_tap $? 21 'FleetGet' test.out

#- 22 FleetUpdate
./ng net.accelbyte.sdk.cli.Main ams fleetUpdate \
    --fleetID 'oASr8Zat' \
    --namespace "$AB_NAMESPACE" \
    --body '{"active": true, "claimKeys": ["bbSvbhMB", "r0p8tzB8", "T4bWtSDf"], "dsHostConfiguration": {"instanceId": "j74PZqap", "serversPerVm": 15}, "fallbackFleet": "QofgpmNM", "hibernateAfterPeriod": "Z0szrLvt", "imageDeploymentProfile": {"commandLine": "HoIyn08z", "imageId": "guC6oa2L", "portConfigurations": [{"name": "5l3WQwn9", "protocol": "UjG5oRxx"}, {"name": "UXaVjHKF", "protocol": "2xJ4t5x3"}, {"name": "0CSjepLZ", "protocol": "EPv5dPrw"}], "timeout": {"claim": 14, "creation": 53, "drain": 70, "session": 9, "unresponsive": 37}}, "name": "n3El5pw9", "onDemand": false, "regions": [{"bufferSize": 14, "dynamicBuffer": false, "maxServerCount": 49, "minServerCount": 20, "region": "eRD257lF", "state": "W17iyVNf"}, {"bufferSize": 58, "dynamicBuffer": true, "maxServerCount": 39, "minServerCount": 71, "region": "HtV9tFhQ", "state": "G7Y0mpwc"}, {"bufferSize": 72, "dynamicBuffer": false, "maxServerCount": 4, "minServerCount": 24, "region": "YNzk71sd", "state": "MaE1Wbwx"}], "samplingRules": {"coredumps": {"crashed": {"collect": false, "percentage": 95}}, "logs": {"crashed": {"collect": false, "percentage": 28}, "success": {"collect": true, "percentage": 43}, "unclaimed": {"collect": false, "percentage": 74}}}}' \
    > test.out 2>&1
eval_tap $? 22 'FleetUpdate' test.out

#- 23 FleetDelete
./ng net.accelbyte.sdk.cli.Main ams fleetDelete \
    --fleetID 'WHg0Axug' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 23 'FleetDelete' test.out

#- 24 FleetArtifactSamplingRulesGet
./ng net.accelbyte.sdk.cli.Main ams fleetArtifactSamplingRulesGet \
    --fleetID 'iAAKdMDU' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 24 'FleetArtifactSamplingRulesGet' test.out

#- 25 FleetArtifactSamplingRulesSet
./ng net.accelbyte.sdk.cli.Main ams fleetArtifactSamplingRulesSet \
    --fleetID 'Xly0LFqr' \
    --namespace "$AB_NAMESPACE" \
    --body '{"coredumps": {"crashed": {"collect": true, "percentage": 100}}, "logs": {"crashed": {"collect": true, "percentage": 32}, "success": {"collect": false, "percentage": 40}, "unclaimed": {"collect": false, "percentage": 89}}}' \
    > test.out 2>&1
eval_tap $? 25 'FleetArtifactSamplingRulesSet' test.out

#- 26 FleetServers
./ng net.accelbyte.sdk.cli.Main ams fleetServers \
    --fleetID 'Fw2myYAq' \
    --namespace "$AB_NAMESPACE" \
    --count '96' \
    --offset '34' \
    --region 'xAPYsCex' \
    --serverId 'RQlmhZNk' \
    --sortBy 'e4d8vj5r' \
    --sortDirection 'asc' \
    --status 'claiming' \
    > test.out 2>&1
eval_tap $? 26 'FleetServers' test.out

#- 27 FleetServerHistory
./ng net.accelbyte.sdk.cli.Main ams fleetServerHistory \
    --fleetID '8HknGvN6' \
    --namespace "$AB_NAMESPACE" \
    --count '42' \
    --offset '81' \
    --reason 'VazqczNV' \
    --region 'utwYDhoo' \
    --serverId '7HmTVXMd' \
    --sortDirection '4JumIbqH' \
    --status '0jLRe2pw' \
    > test.out 2>&1
eval_tap $? 27 'FleetServerHistory' test.out

#- 28 ImageList
./ng net.accelbyte.sdk.cli.Main ams imageList \
    --namespace "$AB_NAMESPACE" \
    --count '74' \
    --inUse 'SnpxSAcn' \
    --isProtected  \
    --name 'aiaTfY2B' \
    --offset '70' \
    --sortBy 'ON5ggaJc' \
    --sortDirection 'W6WS4uao' \
    --status 'kkbqf2QB' \
    --tag 'HLKeQq17' \
    --targetArchitecture 'KrDrzJCx' \
    > test.out 2>&1
eval_tap $? 28 'ImageList' test.out

#- 29 ImagesStorage
./ng net.accelbyte.sdk.cli.Main ams imagesStorage \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 29 'ImagesStorage' test.out

#- 30 ImageGet
./ng net.accelbyte.sdk.cli.Main ams imageGet \
    --imageID 'yzeGuV9i' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 30 'ImageGet' test.out

#- 31 ImageMarkForDeletion
./ng net.accelbyte.sdk.cli.Main ams imageMarkForDeletion \
    --imageID 'lbPIfPr3' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 31 'ImageMarkForDeletion' test.out

#- 32 ImagePatch
./ng net.accelbyte.sdk.cli.Main ams imagePatch \
    --imageID 'IQrcs3AD' \
    --namespace "$AB_NAMESPACE" \
    --body '{"addedTags": ["iboS8QWR", "882r2XII", "a3C5L7u2"], "isProtected": true, "name": "PGd8eiKg", "removedTags": ["qPUhikiR", "jciCVQsK", "W94zetHr"]}' \
    > test.out 2>&1
eval_tap $? 32 'ImagePatch' test.out

#- 33 ImageUnmarkForDeletion
./ng net.accelbyte.sdk.cli.Main ams imageUnmarkForDeletion \
    --imageID 'YtcWysAR' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 33 'ImageUnmarkForDeletion' test.out

#- 34 QoSRegionsGet
./ng net.accelbyte.sdk.cli.Main ams qoSRegionsGet \
    --namespace "$AB_NAMESPACE" \
    --status 'nnMTXBTr' \
    > test.out 2>&1
eval_tap $? 34 'QoSRegionsGet' test.out

#- 35 QoSRegionsUpdate
./ng net.accelbyte.sdk.cli.Main ams qoSRegionsUpdate \
    --namespace "$AB_NAMESPACE" \
    --region '8PrPwrcU' \
    --body '{"status": "RlS8gEaR"}' \
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
    --serverID 'PPmeRMCh' \
    > test.out 2>&1
eval_tap $? 37 'FleetServerInfo' test.out

#- 38 FleetServerConnectionInfo
./ng net.accelbyte.sdk.cli.Main ams fleetServerConnectionInfo \
    --namespace "$AB_NAMESPACE" \
    --serverID 'fl2Jg5rP' \
    > test.out 2>&1
eval_tap $? 38 'FleetServerConnectionInfo' test.out

#- 39 ServerHistory
./ng net.accelbyte.sdk.cli.Main ams serverHistory \
    --namespace "$AB_NAMESPACE" \
    --serverID 'ITdNoaU7' \
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
    --fleetID 'uTqm9Vm9' \
    --namespace "$AB_NAMESPACE" \
    --body '{"region": "cK0gca5J", "sessionId": "twVgCYqX"}' \
    > test.out 2>&1
eval_tap $? 42 'FleetClaimByID' test.out

#- 43 LocalWatchdogConnect
./ng net.accelbyte.sdk.cli.Main ams localWatchdogConnect \
    --namespace "$AB_NAMESPACE" \
    --watchdogID 'ed2Mhdub' \
    > test.out 2>&1
eval_tap $? 43 'LocalWatchdogConnect' test.out

#- 44 FleetClaimByKeys
./ng net.accelbyte.sdk.cli.Main ams fleetClaimByKeys \
    --namespace "$AB_NAMESPACE" \
    --body '{"claimKeys": ["cBYgWHeC", "BBqz8jZE", "xTWhfmgi"], "regions": ["0VYbLNad", "9OHnjPoL", "BYJGrEQ8"], "sessionId": "lgp71IUB"}' \
    > test.out 2>&1
eval_tap $? 44 'FleetClaimByKeys' test.out

#- 45 WatchdogConnect
./ng net.accelbyte.sdk.cli.Main ams watchdogConnect \
    --namespace "$AB_NAMESPACE" \
    --watchdogID 'USVd6qKx' \
    > test.out 2>&1
eval_tap $? 45 'WatchdogConnect' test.out

#- 46 UploadURLGet
./ng net.accelbyte.sdk.cli.Main ams uploadURLGet \
    > test.out 2>&1
eval_tap $? 46 'UploadURLGet' test.out

#- 47 VersionInfo
./ng net.accelbyte.sdk.cli.Main ams versionInfo \
    > test.out 2>&1
eval_tap $? 47 'VersionInfo' test.out

#- 48 BasicHealthCheck
./ng net.accelbyte.sdk.cli.Main ams basicHealthCheck \
    > test.out 2>&1
eval_tap $? 48 'BasicHealthCheck' test.out


rm -f "tmp.dat"

exit $EXIT_CODE