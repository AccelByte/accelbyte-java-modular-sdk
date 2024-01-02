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
echo "1..35"

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

#- 4 AccountGet
./ng net.accelbyte.sdk.cli.Main ams accountGet \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 4 'AccountGet' test.out

#- 5 AccountCreate
./ng net.accelbyte.sdk.cli.Main ams accountCreate \
    --namespace "$AB_NAMESPACE" \
    --body '{"name": "NCFsP7HY"}' \
    > test.out 2>&1
eval_tap $? 5 'AccountCreate' test.out

#- 6 AccountLinkTokenGet
./ng net.accelbyte.sdk.cli.Main ams accountLinkTokenGet \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 6 'AccountLinkTokenGet' test.out

#- 7 AccountLink
./ng net.accelbyte.sdk.cli.Main ams accountLink \
    --namespace "$AB_NAMESPACE" \
    --body '{"token": "2FixlpUu"}' \
    > test.out 2>&1
eval_tap $? 7 'AccountLink' test.out

#- 8 ArtifactGet
./ng net.accelbyte.sdk.cli.Main ams artifactGet \
    --namespace "$AB_NAMESPACE" \
    --artifactType 'F1LWZYbm' \
    --endDate 's6Z90mhH' \
    --fleetID '3FCNA3JS' \
    --imageID 'PaRcxL1V' \
    --maxSize '82' \
    --minSize '60' \
    --region 'C5zWLlpq' \
    --startDate 'imHMCCtN' \
    --status 'sB6zwGUG' \
    > test.out 2>&1
eval_tap $? 8 'ArtifactGet' test.out

#- 9 ArtifactUsageGet
./ng net.accelbyte.sdk.cli.Main ams artifactUsageGet \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 9 'ArtifactUsageGet' test.out

#- 10 ArtifactDelete
./ng net.accelbyte.sdk.cli.Main ams artifactDelete \
    --artifactID 'sY76UN4c' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 10 'ArtifactDelete' test.out

#- 11 ArtifactGetURL
./ng net.accelbyte.sdk.cli.Main ams artifactGetURL \
    --artifactID '35agfEg4' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 11 'ArtifactGetURL' test.out

#- 12 FleetList
./ng net.accelbyte.sdk.cli.Main ams fleetList \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 12 'FleetList' test.out

#- 13 FleetCreate
./ng net.accelbyte.sdk.cli.Main ams fleetCreate \
    --namespace "$AB_NAMESPACE" \
    --body '{"active": false, "claimKeys": ["mUtSisEI", "QCv6Iu8c", "zNEMOGdY"], "dsHostConfiguration": {"instanceId": "VijPibUr", "instanceType": "yipPHKSX", "serversPerVm": 31}, "imageDeploymentProfile": {"commandLine": "WIKP8ua2", "imageId": "EoZoZmhU", "portConfigurations": [{"name": "Mb0GPtpM", "protocol": "9SRjOyc1"}, {"name": "NyfXWE7H", "protocol": "6GPsF5iT"}, {"name": "7hFjWnR4", "protocol": "SdIVQ62a"}], "timeout": {"creation": 50, "drain": 42, "session": 53, "unresponsive": 66}}, "name": "s7QwiKfo", "regions": [{"bufferSize": 26, "maxServerCount": 64, "minServerCount": 70, "region": "qePz9Tey"}, {"bufferSize": 16, "maxServerCount": 65, "minServerCount": 75, "region": "xwHst1mT"}, {"bufferSize": 66, "maxServerCount": 66, "minServerCount": 24, "region": "9BKoMAIz"}], "samplingRules": {"coredumps": {"crashed": {"collect": false, "percentage": 12}, "success": {"collect": false, "percentage": 54}}, "logs": {"crashed": {"collect": false, "percentage": 36}, "success": {"collect": false, "percentage": 100}}}}' \
    > test.out 2>&1
eval_tap $? 13 'FleetCreate' test.out

#- 14 FleetGet
./ng net.accelbyte.sdk.cli.Main ams fleetGet \
    --fleetID 'GWus8alq' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 14 'FleetGet' test.out

#- 15 FleetUpdate
./ng net.accelbyte.sdk.cli.Main ams fleetUpdate \
    --fleetID 'gtjTkCa0' \
    --namespace "$AB_NAMESPACE" \
    --body '{"active": false, "claimKeys": ["UgvfklwP", "Twbjtpqr", "wDSoHeay"], "dsHostConfiguration": {"instanceId": "JxiwOykZ", "instanceType": "mYmBOgla", "serversPerVm": 33}, "imageDeploymentProfile": {"commandLine": "FJHpjDSk", "imageId": "mzEfcAxC", "portConfigurations": [{"name": "twmDfeIt", "protocol": "dxXay0LO"}, {"name": "UVeHdQFy", "protocol": "dshHcTdQ"}, {"name": "8xogT8wr", "protocol": "QEVVbsqd"}], "timeout": {"creation": 10, "drain": 50, "session": 23, "unresponsive": 97}}, "name": "jz7TNu0k", "regions": [{"bufferSize": 22, "maxServerCount": 35, "minServerCount": 11, "region": "5nNvNkfV"}, {"bufferSize": 24, "maxServerCount": 22, "minServerCount": 87, "region": "ZiByUcyW"}, {"bufferSize": 96, "maxServerCount": 19, "minServerCount": 50, "region": "J5OGAHul"}], "samplingRules": {"coredumps": {"crashed": {"collect": true, "percentage": 58}, "success": {"collect": true, "percentage": 10}}, "logs": {"crashed": {"collect": false, "percentage": 67}, "success": {"collect": false, "percentage": 33}}}}' \
    > test.out 2>&1
eval_tap $? 15 'FleetUpdate' test.out

#- 16 FleetDelete
./ng net.accelbyte.sdk.cli.Main ams fleetDelete \
    --fleetID '0OdW01rT' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 16 'FleetDelete' test.out

#- 17 FleetArtifactSamplingRulesGet
./ng net.accelbyte.sdk.cli.Main ams fleetArtifactSamplingRulesGet \
    --fleetID 'T0zEvPhf' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 17 'FleetArtifactSamplingRulesGet' test.out

#- 18 FleetArtifactSamplingRulesSet
./ng net.accelbyte.sdk.cli.Main ams fleetArtifactSamplingRulesSet \
    --fleetID 'ZezjCsAR' \
    --namespace "$AB_NAMESPACE" \
    --body '{"coredumps": {"crashed": {"collect": false, "percentage": 78}, "success": {"collect": true, "percentage": 90}}, "logs": {"crashed": {"collect": false, "percentage": 84}, "success": {"collect": true, "percentage": 77}}}' \
    > test.out 2>&1
eval_tap $? 18 'FleetArtifactSamplingRulesSet' test.out

#- 19 FleetServers
./ng net.accelbyte.sdk.cli.Main ams fleetServers \
    --fleetID 'IedAZbei' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 19 'FleetServers' test.out

#- 20 FleetServerHistory
./ng net.accelbyte.sdk.cli.Main ams fleetServerHistory \
    --fleetID '4Nkr2xKb' \
    --namespace "$AB_NAMESPACE" \
    --count '45' \
    --offset '70' \
    --reason 'Z29uN8oj' \
    --region 'zRu5GOrM' \
    --serverId '8UBcyIvX' \
    --sortDirection 'nlpjqQCG' \
    --status 'BFgrOCVd' \
    > test.out 2>&1
eval_tap $? 20 'FleetServerHistory' test.out

#- 21 ImageList
./ng net.accelbyte.sdk.cli.Main ams imageList \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 21 'ImageList' test.out

#- 22 ImageGet
./ng net.accelbyte.sdk.cli.Main ams imageGet \
    --imageID 'MkLL6m3U' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 22 'ImageGet' test.out

#- 23 ImagePatch
./ng net.accelbyte.sdk.cli.Main ams imagePatch \
    --imageID 'oqNajreS' \
    --namespace "$AB_NAMESPACE" \
    --body '{"addedTags": ["C1lwJjOw", "0qZsZXPM", "mi98rl34"], "isProtected": false, "name": "mLXaaLoS", "removedTags": ["Mb4iNYGY", "p95LGmSi", "wTng20QV"]}' \
    > test.out 2>&1
eval_tap $? 23 'ImagePatch' test.out

#- 24 QoSRegionsGet
./ng net.accelbyte.sdk.cli.Main ams qoSRegionsGet \
    --namespace "$AB_NAMESPACE" \
    --status 'w07Mz4jP' \
    > test.out 2>&1
eval_tap $? 24 'QoSRegionsGet' test.out

#- 25 QoSRegionsUpdate
./ng net.accelbyte.sdk.cli.Main ams qoSRegionsUpdate \
    --namespace "$AB_NAMESPACE" \
    --region 'gjJH4WNP' \
    --body '{"status": "7BaFIjPh"}' \
    > test.out 2>&1
eval_tap $? 25 'QoSRegionsUpdate' test.out

#- 26 InfoRegions
./ng net.accelbyte.sdk.cli.Main ams infoRegions \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 26 'InfoRegions' test.out

#- 27 FleetServerInfo
./ng net.accelbyte.sdk.cli.Main ams fleetServerInfo \
    --namespace "$AB_NAMESPACE" \
    --serverID 'SUGf6i31' \
    > test.out 2>&1
eval_tap $? 27 'FleetServerInfo' test.out

#- 28 ServerHistory
./ng net.accelbyte.sdk.cli.Main ams serverHistory \
    --namespace "$AB_NAMESPACE" \
    --serverID 'TU8YMRCR' \
    > test.out 2>&1
eval_tap $? 28 'ServerHistory' test.out

#- 29 InfoSupportedInstances
./ng net.accelbyte.sdk.cli.Main ams infoSupportedInstances \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 29 'InfoSupportedInstances' test.out

#- 30 FleetClaimByID
./ng net.accelbyte.sdk.cli.Main ams fleetClaimByID \
    --fleetID 'fQP4iEDL' \
    --namespace "$AB_NAMESPACE" \
    --body '{"region": "lc1lBgu9"}' \
    > test.out 2>&1
eval_tap $? 30 'FleetClaimByID' test.out

#- 31 LocalWatchdogConnect
./ng net.accelbyte.sdk.cli.Main ams localWatchdogConnect \
    --namespace "$AB_NAMESPACE" \
    --watchdogID '8vh84jYw' \
    > test.out 2>&1
eval_tap $? 31 'LocalWatchdogConnect' test.out

#- 32 FleetClaimByKeys
./ng net.accelbyte.sdk.cli.Main ams fleetClaimByKeys \
    --namespace "$AB_NAMESPACE" \
    --body '{"claimKeys": ["uD52K0wU", "EfVAlbzv", "NJ09dHri"], "regions": ["KAJDlgoO", "bSEsezSK", "VrTENTTd"]}' \
    > test.out 2>&1
eval_tap $? 32 'FleetClaimByKeys' test.out

#- 33 WatchdogConnect
./ng net.accelbyte.sdk.cli.Main ams watchdogConnect \
    --namespace "$AB_NAMESPACE" \
    --watchdogID '3qWMt46V' \
    > test.out 2>&1
eval_tap $? 33 'WatchdogConnect' test.out

#- 34 Func1
./ng net.accelbyte.sdk.cli.Main ams func1 \
    > test.out 2>&1
eval_tap $? 34 'Func1' test.out

#- 35 BasicHealthCheck
./ng net.accelbyte.sdk.cli.Main ams basicHealthCheck \
    > test.out 2>&1
eval_tap $? 35 'BasicHealthCheck' test.out


rm -f "tmp.dat"

exit $EXIT_CODE