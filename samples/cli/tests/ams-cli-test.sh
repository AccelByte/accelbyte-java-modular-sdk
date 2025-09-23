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
    --body '{"name": "5xkOjXaH"}' \
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
    --body '{"token": "hvuvktQ2"}' \
    > test.out 2>&1
eval_tap $? 7 'AdminAccountLink' test.out

#- 8 ArtifactGet
./ng net.accelbyte.sdk.cli.Main ams artifactGet \
    --namespace "$AB_NAMESPACE" \
    --artifactType 'yTLXb50H' \
    --count '68' \
    --endDate 'rmdRa4Ja' \
    --fleetID 'zfGykIPY' \
    --imageID '8RA5dE0d' \
    --maxSize '64' \
    --minSize '5' \
    --offset '12' \
    --region 'oQapqp11' \
    --serverId 'viDyX6cF' \
    --sortBy '8qkc5UNZ' \
    --sortDirection 'asc' \
    --startDate 'kyynEOqI' \
    --status 'lakRQx1J' \
    > test.out 2>&1
eval_tap $? 8 'ArtifactGet' test.out

#- 9 ArtifactBulkDelete
./ng net.accelbyte.sdk.cli.Main ams artifactBulkDelete \
    --namespace "$AB_NAMESPACE" \
    --artifactType 'OHoroSZp' \
    --fleetId 'VQz2Agoo' \
    --uploadedBefore '1982-06-21' \
    > test.out 2>&1
eval_tap $? 9 'ArtifactBulkDelete' test.out

#- 10 ArtifactUsageGet
./ng net.accelbyte.sdk.cli.Main ams artifactUsageGet \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 10 'ArtifactUsageGet' test.out

#- 11 ArtifactDelete
./ng net.accelbyte.sdk.cli.Main ams artifactDelete \
    --artifactID 'QZBHvNH2' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 11 'ArtifactDelete' test.out

#- 12 ArtifactGetURL
./ng net.accelbyte.sdk.cli.Main ams artifactGetURL \
    --artifactID 'SG2hXJ7n' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 12 'ArtifactGetURL' test.out

#- 13 DevelopmentServerConfigurationList
./ng net.accelbyte.sdk.cli.Main ams developmentServerConfigurationList \
    --namespace "$AB_NAMESPACE" \
    --count '159' \
    --imageId 'txfsq9nK' \
    --name 'EHFNNTtY' \
    --offset '4' \
    --sortBy 'name' \
    --sortDirection 'desc' \
    > test.out 2>&1
eval_tap $? 13 'DevelopmentServerConfigurationList' test.out

#- 14 DevelopmentServerConfigurationCreate
./ng net.accelbyte.sdk.cli.Main ams developmentServerConfigurationCreate \
    --namespace "$AB_NAMESPACE" \
    --body '{"commandLineArguments": "d4BTvWSX", "expiresAt": "1997-01-02T00:00:00Z", "imageId": "zylhWbBL", "name": "UfmnBDN7"}' \
    > test.out 2>&1
eval_tap $? 14 'DevelopmentServerConfigurationCreate' test.out

#- 15 DevelopmentServerConfigurationGet
./ng net.accelbyte.sdk.cli.Main ams developmentServerConfigurationGet \
    --developmentServerConfigID 'xYejhD14' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 15 'DevelopmentServerConfigurationGet' test.out

#- 16 DevelopmentServerConfigurationDelete
./ng net.accelbyte.sdk.cli.Main ams developmentServerConfigurationDelete \
    --developmentServerConfigID 'lzg8yTVa' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 16 'DevelopmentServerConfigurationDelete' test.out

#- 17 DevelopmentServerConfigurationPatch
./ng net.accelbyte.sdk.cli.Main ams developmentServerConfigurationPatch \
    --developmentServerConfigID 'Vj6nkm9o' \
    --namespace "$AB_NAMESPACE" \
    --body '{"commandLineArguments": "u8xN1nFX", "expiresAt": "1991-02-20T00:00:00Z"}' \
    > test.out 2>&1
eval_tap $? 17 'DevelopmentServerConfigurationPatch' test.out

#- 18 FleetList
./ng net.accelbyte.sdk.cli.Main ams fleetList \
    --namespace "$AB_NAMESPACE" \
    --active  \
    --count '27' \
    --name 'tdK7BUwc' \
    --offset '19' \
    --region 'MtCOanaa' \
    --sortBy 'active' \
    --sortDirection 'desc' \
    > test.out 2>&1
eval_tap $? 18 'FleetList' test.out

#- 19 FleetCreate
./ng net.accelbyte.sdk.cli.Main ams fleetCreate \
    --namespace "$AB_NAMESPACE" \
    --body '{"active": true, "claimKeys": ["XEVJNpKj", "L2YytUOU", "jFXI7vcu"], "dsHostConfiguration": {"instanceId": "HVzcgWVO", "serversPerVm": 42}, "fallbackFleet": "5m7ZpiTs", "hibernateAfterPeriod": "OTKt2w1z", "imageDeploymentProfile": {"commandLine": "5sdjBnPm", "imageId": "5sqQ33RN", "portConfigurations": [{"name": "2a2O2aNC", "protocol": "66P5zJc2"}, {"name": "OZGRSouw", "protocol": "1KO8EbLF"}, {"name": "D6uAv2AT", "protocol": "o9w5gw7O"}], "timeout": {"claim": 60, "creation": 96, "drain": 100, "session": 69, "unresponsive": 49}}, "name": "636Qjfjb", "onDemand": true, "regions": [{"bufferSize": 78, "dynamicBuffer": true, "maxServerCount": 11, "minServerCount": 26, "region": "fit14uPd"}, {"bufferSize": 66, "dynamicBuffer": false, "maxServerCount": 75, "minServerCount": 19, "region": "t4Swr8Qp"}, {"bufferSize": 21, "dynamicBuffer": false, "maxServerCount": 47, "minServerCount": 97, "region": "hN4dfwjr"}], "samplingRules": {"coredumps": {"crashed": {"collect": false, "percentage": 26}}, "logs": {"crashed": {"collect": true, "percentage": 40}, "success": {"collect": true, "percentage": 57}, "unclaimed": {"collect": true, "percentage": 1}}}}' \
    > test.out 2>&1
eval_tap $? 19 'FleetCreate' test.out

#- 20 FleetGet
./ng net.accelbyte.sdk.cli.Main ams fleetGet \
    --fleetID 'nU5FsiWQ' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 20 'FleetGet' test.out

#- 21 FleetUpdate
./ng net.accelbyte.sdk.cli.Main ams fleetUpdate \
    --fleetID 'ab4lx4Oe' \
    --namespace "$AB_NAMESPACE" \
    --body '{"active": true, "claimKeys": ["WbiMaPda", "28XfulL6", "4OugAM5T"], "dsHostConfiguration": {"instanceId": "gMLOg2FR", "serversPerVm": 90}, "fallbackFleet": "nkJEEXfZ", "hibernateAfterPeriod": "1ngY9or6", "imageDeploymentProfile": {"commandLine": "Thooy7fa", "imageId": "WCCYM6bF", "portConfigurations": [{"name": "yyLOanAc", "protocol": "LSx6grql"}, {"name": "bvDVEBQF", "protocol": "WdEJvEHW"}, {"name": "dL3EQspN", "protocol": "0HHP2I2F"}], "timeout": {"claim": 79, "creation": 31, "drain": 6, "session": 85, "unresponsive": 22}}, "name": "BZHyO0UM", "onDemand": false, "regions": [{"bufferSize": 16, "dynamicBuffer": true, "maxServerCount": 34, "minServerCount": 21, "region": "14SFKZ2K"}, {"bufferSize": 63, "dynamicBuffer": true, "maxServerCount": 17, "minServerCount": 33, "region": "FK8dG5BF"}, {"bufferSize": 51, "dynamicBuffer": false, "maxServerCount": 73, "minServerCount": 3, "region": "zPtXtffP"}], "samplingRules": {"coredumps": {"crashed": {"collect": false, "percentage": 92}}, "logs": {"crashed": {"collect": false, "percentage": 81}, "success": {"collect": false, "percentage": 31}, "unclaimed": {"collect": false, "percentage": 63}}}}' \
    > test.out 2>&1
eval_tap $? 21 'FleetUpdate' test.out

#- 22 FleetDelete
./ng net.accelbyte.sdk.cli.Main ams fleetDelete \
    --fleetID 'bhdxPLqJ' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 22 'FleetDelete' test.out

#- 23 FleetArtifactSamplingRulesGet
./ng net.accelbyte.sdk.cli.Main ams fleetArtifactSamplingRulesGet \
    --fleetID 'yHygKIxq' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 23 'FleetArtifactSamplingRulesGet' test.out

#- 24 FleetArtifactSamplingRulesSet
./ng net.accelbyte.sdk.cli.Main ams fleetArtifactSamplingRulesSet \
    --fleetID 'byVwca7E' \
    --namespace "$AB_NAMESPACE" \
    --body '{"coredumps": {"crashed": {"collect": false, "percentage": 80}}, "logs": {"crashed": {"collect": true, "percentage": 94}, "success": {"collect": false, "percentage": 72}, "unclaimed": {"collect": false, "percentage": 49}}}' \
    > test.out 2>&1
eval_tap $? 24 'FleetArtifactSamplingRulesSet' test.out

#- 25 FleetServers
./ng net.accelbyte.sdk.cli.Main ams fleetServers \
    --fleetID 'IKoO4xZs' \
    --namespace "$AB_NAMESPACE" \
    --count '91' \
    --offset '39' \
    --region 'k68DzG7y' \
    --serverId 'BfIwvzst' \
    --sortBy 'W0mzFqcJ' \
    --sortDirection 'desc' \
    --status 'claimed' \
    > test.out 2>&1
eval_tap $? 25 'FleetServers' test.out

#- 26 FleetServerHistory
./ng net.accelbyte.sdk.cli.Main ams fleetServerHistory \
    --fleetID 'sTOifI0d' \
    --namespace "$AB_NAMESPACE" \
    --count '91' \
    --offset '29' \
    --reason 'PwzRK55e' \
    --region 't1zpOhhw' \
    --serverId 'Z7CwyEUi' \
    --sortDirection 'nU9oyGSb' \
    --status 'Nkdja6b4' \
    > test.out 2>&1
eval_tap $? 26 'FleetServerHistory' test.out

#- 27 ImageList
./ng net.accelbyte.sdk.cli.Main ams imageList \
    --namespace "$AB_NAMESPACE" \
    --count '72' \
    --inUse 'y1BUQyjV' \
    --isProtected  \
    --name 'ZLFhJFfs' \
    --offset '97' \
    --sortBy 'UScBRYBS' \
    --sortDirection '4GGx90Ru' \
    --status 'pM1oUCym' \
    --tag 'nwHealwi' \
    > test.out 2>&1
eval_tap $? 27 'ImageList' test.out

#- 28 ImagesStorage
./ng net.accelbyte.sdk.cli.Main ams imagesStorage \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 28 'ImagesStorage' test.out

#- 29 ImageGet
./ng net.accelbyte.sdk.cli.Main ams imageGet \
    --imageID 'rky0qEZO' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 29 'ImageGet' test.out

#- 30 ImageMarkForDeletion
./ng net.accelbyte.sdk.cli.Main ams imageMarkForDeletion \
    --imageID 'ZPX0JlIb' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 30 'ImageMarkForDeletion' test.out

#- 31 ImagePatch
./ng net.accelbyte.sdk.cli.Main ams imagePatch \
    --imageID 'ufbBhQD6' \
    --namespace "$AB_NAMESPACE" \
    --body '{"addedTags": ["dxfWWMPc", "j7zNJazO", "kgYWNWSq"], "isProtected": false, "name": "FOXZ5Jru", "removedTags": ["wetKVtrF", "bYoeMG88", "ZbHT2eZX"]}' \
    > test.out 2>&1
eval_tap $? 31 'ImagePatch' test.out

#- 32 ImageUnmarkForDeletion
./ng net.accelbyte.sdk.cli.Main ams imageUnmarkForDeletion \
    --imageID 'KI4W7Ru6' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 32 'ImageUnmarkForDeletion' test.out

#- 33 QoSRegionsGet
./ng net.accelbyte.sdk.cli.Main ams qoSRegionsGet \
    --namespace "$AB_NAMESPACE" \
    --status 'rGRKR8tz' \
    > test.out 2>&1
eval_tap $? 33 'QoSRegionsGet' test.out

#- 34 QoSRegionsUpdate
./ng net.accelbyte.sdk.cli.Main ams qoSRegionsUpdate \
    --namespace "$AB_NAMESPACE" \
    --region 'lD0vckUD' \
    --body '{"status": "ky3uPosY"}' \
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
    --serverID 'vgQ4DTPS' \
    > test.out 2>&1
eval_tap $? 36 'FleetServerInfo' test.out

#- 37 FleetServerConnectionInfo
./ng net.accelbyte.sdk.cli.Main ams fleetServerConnectionInfo \
    --namespace "$AB_NAMESPACE" \
    --serverID '4cnUTqlV' \
    > test.out 2>&1
eval_tap $? 37 'FleetServerConnectionInfo' test.out

#- 38 ServerHistory
./ng net.accelbyte.sdk.cli.Main ams serverHistory \
    --namespace "$AB_NAMESPACE" \
    --serverID 'mwgZu3YI' \
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
    --fleetID 'PohLyqnp' \
    --namespace "$AB_NAMESPACE" \
    --body '{"region": "7kmRG9jV", "sessionId": "wf1hzKl0"}' \
    > test.out 2>&1
eval_tap $? 41 'FleetClaimByID' test.out

#- 42 LocalWatchdogConnect
./ng net.accelbyte.sdk.cli.Main ams localWatchdogConnect \
    --namespace "$AB_NAMESPACE" \
    --watchdogID 'wOZJYgU6' \
    > test.out 2>&1
eval_tap $? 42 'LocalWatchdogConnect' test.out

#- 43 FleetClaimByKeys
./ng net.accelbyte.sdk.cli.Main ams fleetClaimByKeys \
    --namespace "$AB_NAMESPACE" \
    --body '{"claimKeys": ["xD470vhg", "LTbi5A4P", "ONnpN7GG"], "regions": ["3x9DdwQ4", "4FTRoX05", "MynwBFYT"], "sessionId": "qOjsTr4w"}' \
    > test.out 2>&1
eval_tap $? 43 'FleetClaimByKeys' test.out

#- 44 WatchdogConnect
./ng net.accelbyte.sdk.cli.Main ams watchdogConnect \
    --namespace "$AB_NAMESPACE" \
    --watchdogID 'eD8IKpCn' \
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