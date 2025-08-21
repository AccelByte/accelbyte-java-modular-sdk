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
    --body '{"name": "1hBw6T1d"}' \
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
    --body '{"token": "lyipWDIl"}' \
    > test.out 2>&1
eval_tap $? 7 'AdminAccountLink' test.out

#- 8 ArtifactGet
./ng net.accelbyte.sdk.cli.Main ams artifactGet \
    --namespace "$AB_NAMESPACE" \
    --artifactType 'JSM1uhqJ' \
    --count '495' \
    --endDate 'swWWFIVP' \
    --fleetID 'Vr7fbEQk' \
    --imageID 'mBhYBUlD' \
    --maxSize '58' \
    --minSize '23' \
    --offset '28' \
    --region 'CAhY7Fk2' \
    --serverId 'SpU5ZaBM' \
    --sortBy 'BYadcYfs' \
    --sortDirection 'asc' \
    --startDate 'nGtvVwRz' \
    --status 'BdjwkAzZ' \
    > test.out 2>&1
eval_tap $? 8 'ArtifactGet' test.out

#- 9 ArtifactBulkDelete
./ng net.accelbyte.sdk.cli.Main ams artifactBulkDelete \
    --namespace "$AB_NAMESPACE" \
    --artifactType 'GbqIevli' \
    --fleetId 'Hz54cwBq' \
    --uploadedBefore '1977-10-11' \
    > test.out 2>&1
eval_tap $? 9 'ArtifactBulkDelete' test.out

#- 10 ArtifactUsageGet
./ng net.accelbyte.sdk.cli.Main ams artifactUsageGet \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 10 'ArtifactUsageGet' test.out

#- 11 ArtifactDelete
./ng net.accelbyte.sdk.cli.Main ams artifactDelete \
    --artifactID 'YndUR36W' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 11 'ArtifactDelete' test.out

#- 12 ArtifactGetURL
./ng net.accelbyte.sdk.cli.Main ams artifactGetURL \
    --artifactID 'hFXejbuG' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 12 'ArtifactGetURL' test.out

#- 13 DevelopmentServerConfigurationList
./ng net.accelbyte.sdk.cli.Main ams developmentServerConfigurationList \
    --namespace "$AB_NAMESPACE" \
    --count '411' \
    --imageId 'HwQeblxK' \
    --name 'r7StbCdq' \
    --offset '75' \
    --sortBy 'created_at' \
    --sortDirection 'asc' \
    > test.out 2>&1
eval_tap $? 13 'DevelopmentServerConfigurationList' test.out

#- 14 DevelopmentServerConfigurationCreate
./ng net.accelbyte.sdk.cli.Main ams developmentServerConfigurationCreate \
    --namespace "$AB_NAMESPACE" \
    --body '{"commandLineArguments": "Xbu6Zgyc", "expiresAt": "1975-01-12T00:00:00Z", "imageId": "MGpF973o", "name": "sulUig0A"}' \
    > test.out 2>&1
eval_tap $? 14 'DevelopmentServerConfigurationCreate' test.out

#- 15 DevelopmentServerConfigurationGet
./ng net.accelbyte.sdk.cli.Main ams developmentServerConfigurationGet \
    --developmentServerConfigID 'SJC2HHPe' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 15 'DevelopmentServerConfigurationGet' test.out

#- 16 DevelopmentServerConfigurationDelete
./ng net.accelbyte.sdk.cli.Main ams developmentServerConfigurationDelete \
    --developmentServerConfigID 'PyyWU9kZ' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 16 'DevelopmentServerConfigurationDelete' test.out

#- 17 DevelopmentServerConfigurationPatch
./ng net.accelbyte.sdk.cli.Main ams developmentServerConfigurationPatch \
    --developmentServerConfigID '9wmICiuq' \
    --namespace "$AB_NAMESPACE" \
    --body '{"commandLineArguments": "qmWt0PZq", "expiresAt": "1973-03-24T00:00:00Z"}' \
    > test.out 2>&1
eval_tap $? 17 'DevelopmentServerConfigurationPatch' test.out

#- 18 FleetList
./ng net.accelbyte.sdk.cli.Main ams fleetList \
    --namespace "$AB_NAMESPACE" \
    --active  \
    --count '48' \
    --name 'BralFVQW' \
    --offset '10' \
    --region '6tTHoN5n' \
    --sortBy 'name' \
    --sortDirection 'asc' \
    > test.out 2>&1
eval_tap $? 18 'FleetList' test.out

#- 19 FleetCreate
./ng net.accelbyte.sdk.cli.Main ams fleetCreate \
    --namespace "$AB_NAMESPACE" \
    --body '{"active": false, "claimKeys": ["QKSeE8VL", "HsFgBxM9", "San5DwxP"], "dsHostConfiguration": {"instanceId": "XsmUVVNa", "serversPerVm": 50}, "fallbackFleet": "6K80ER9Q", "hibernateAfterPeriod": "ERPvkLfD", "imageDeploymentProfile": {"commandLine": "Fe85jzD8", "imageId": "lWfolt0J", "portConfigurations": [{"name": "aXaoeNmW", "protocol": "nTHaLWW4"}, {"name": "XdriMEog", "protocol": "tsSFgF3x"}, {"name": "wLdYwZTQ", "protocol": "JdNYdEiU"}], "timeout": {"claim": 84, "creation": 71, "drain": 82, "session": 48, "unresponsive": 81}}, "name": "XMX05p9N", "onDemand": true, "regions": [{"bufferSize": 45, "dynamicBuffer": true, "maxServerCount": 47, "minServerCount": 29, "region": "SC6EaSec"}, {"bufferSize": 40, "dynamicBuffer": false, "maxServerCount": 78, "minServerCount": 84, "region": "gqlYd2JD"}, {"bufferSize": 14, "dynamicBuffer": true, "maxServerCount": 65, "minServerCount": 80, "region": "IoKfCs2H"}], "samplingRules": {"coredumps": {"crashed": {"collect": true, "percentage": 38}}, "logs": {"crashed": {"collect": true, "percentage": 83}, "success": {"collect": true, "percentage": 62}, "unclaimed": {"collect": true, "percentage": 69}}}}' \
    > test.out 2>&1
eval_tap $? 19 'FleetCreate' test.out

#- 20 FleetGet
./ng net.accelbyte.sdk.cli.Main ams fleetGet \
    --fleetID 'gOleWfFH' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 20 'FleetGet' test.out

#- 21 FleetUpdate
./ng net.accelbyte.sdk.cli.Main ams fleetUpdate \
    --fleetID 'ywZyvCr3' \
    --namespace "$AB_NAMESPACE" \
    --body '{"active": true, "claimKeys": ["rYH200rJ", "pm5OX2lB", "GjlviJuo"], "dsHostConfiguration": {"instanceId": "dWiuuRh9", "serversPerVm": 77}, "fallbackFleet": "bmA1DIJG", "hibernateAfterPeriod": "eALCFuT6", "imageDeploymentProfile": {"commandLine": "QoQMpRA0", "imageId": "DZ7U9yRu", "portConfigurations": [{"name": "lEGI6OUj", "protocol": "96MW9TWk"}, {"name": "r0EgjCmJ", "protocol": "g6esSMGs"}, {"name": "QdGY6iym", "protocol": "BahExjqc"}], "timeout": {"claim": 97, "creation": 45, "drain": 62, "session": 86, "unresponsive": 75}}, "name": "pWf6EGqf", "onDemand": true, "regions": [{"bufferSize": 63, "dynamicBuffer": true, "maxServerCount": 12, "minServerCount": 29, "region": "dniAH54h"}, {"bufferSize": 43, "dynamicBuffer": true, "maxServerCount": 57, "minServerCount": 76, "region": "fiqJw0gK"}, {"bufferSize": 4, "dynamicBuffer": false, "maxServerCount": 4, "minServerCount": 76, "region": "Klt2TzTM"}], "samplingRules": {"coredumps": {"crashed": {"collect": false, "percentage": 97}}, "logs": {"crashed": {"collect": false, "percentage": 46}, "success": {"collect": false, "percentage": 68}, "unclaimed": {"collect": false, "percentage": 74}}}}' \
    > test.out 2>&1
eval_tap $? 21 'FleetUpdate' test.out

#- 22 FleetDelete
./ng net.accelbyte.sdk.cli.Main ams fleetDelete \
    --fleetID 'UNsNyh41' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 22 'FleetDelete' test.out

#- 23 FleetArtifactSamplingRulesGet
./ng net.accelbyte.sdk.cli.Main ams fleetArtifactSamplingRulesGet \
    --fleetID 'DXEyF2FH' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 23 'FleetArtifactSamplingRulesGet' test.out

#- 24 FleetArtifactSamplingRulesSet
./ng net.accelbyte.sdk.cli.Main ams fleetArtifactSamplingRulesSet \
    --fleetID '1JCgBVb0' \
    --namespace "$AB_NAMESPACE" \
    --body '{"coredumps": {"crashed": {"collect": true, "percentage": 18}}, "logs": {"crashed": {"collect": false, "percentage": 64}, "success": {"collect": true, "percentage": 59}, "unclaimed": {"collect": false, "percentage": 42}}}' \
    > test.out 2>&1
eval_tap $? 24 'FleetArtifactSamplingRulesSet' test.out

#- 25 FleetServers
./ng net.accelbyte.sdk.cli.Main ams fleetServers \
    --fleetID 'dcnHtxoQ' \
    --namespace "$AB_NAMESPACE" \
    --count '1' \
    --offset '24' \
    --region 'pyiaKfU5' \
    --serverId 'BrL7hGXV' \
    --sortBy 'maTHmvGz' \
    --sortDirection 'desc' \
    --status 'draining' \
    > test.out 2>&1
eval_tap $? 25 'FleetServers' test.out

#- 26 FleetServerHistory
./ng net.accelbyte.sdk.cli.Main ams fleetServerHistory \
    --fleetID 'lslEtD7K' \
    --namespace "$AB_NAMESPACE" \
    --count '21' \
    --offset '67' \
    --reason '6gdjN2xh' \
    --region 'porCU5j5' \
    --serverId 'ImSFsf6l' \
    --sortDirection 'vidRvjqu' \
    --status 'bb070jPA' \
    > test.out 2>&1
eval_tap $? 26 'FleetServerHistory' test.out

#- 27 ImageList
./ng net.accelbyte.sdk.cli.Main ams imageList \
    --namespace "$AB_NAMESPACE" \
    --count '33' \
    --inUse 'UwjdiN4t' \
    --isProtected  \
    --name 'fC38no3d' \
    --offset '16' \
    --sortBy 'an249jKi' \
    --sortDirection 'kuLEmwlN' \
    --status 'QggrS2Uk' \
    --tag 'ru4lleiE' \
    > test.out 2>&1
eval_tap $? 27 'ImageList' test.out

#- 28 ImagesStorage
./ng net.accelbyte.sdk.cli.Main ams imagesStorage \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 28 'ImagesStorage' test.out

#- 29 ImageGet
./ng net.accelbyte.sdk.cli.Main ams imageGet \
    --imageID 'kg8vju8A' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 29 'ImageGet' test.out

#- 30 ImageMarkForDeletion
./ng net.accelbyte.sdk.cli.Main ams imageMarkForDeletion \
    --imageID 'yJ89T5lO' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 30 'ImageMarkForDeletion' test.out

#- 31 ImagePatch
./ng net.accelbyte.sdk.cli.Main ams imagePatch \
    --imageID 'YJBh4Hf8' \
    --namespace "$AB_NAMESPACE" \
    --body '{"addedTags": ["AvQ63OlU", "xRZMMB68", "VSw3HdEw"], "isProtected": false, "name": "vl5kxVpJ", "removedTags": ["M5nH0Z6R", "WnU3SnFa", "hA81zfbQ"]}' \
    > test.out 2>&1
eval_tap $? 31 'ImagePatch' test.out

#- 32 ImageUnmarkForDeletion
./ng net.accelbyte.sdk.cli.Main ams imageUnmarkForDeletion \
    --imageID '5ltrSUpT' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 32 'ImageUnmarkForDeletion' test.out

#- 33 QoSRegionsGet
./ng net.accelbyte.sdk.cli.Main ams qoSRegionsGet \
    --namespace "$AB_NAMESPACE" \
    --status '5YouuZYR' \
    > test.out 2>&1
eval_tap $? 33 'QoSRegionsGet' test.out

#- 34 QoSRegionsUpdate
./ng net.accelbyte.sdk.cli.Main ams qoSRegionsUpdate \
    --namespace "$AB_NAMESPACE" \
    --region 'skNSDwv9' \
    --body '{"status": "uc0eyMwG"}' \
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
    --serverID 'FnB70Ubp' \
    > test.out 2>&1
eval_tap $? 36 'FleetServerInfo' test.out

#- 37 FleetServerConnectionInfo
./ng net.accelbyte.sdk.cli.Main ams fleetServerConnectionInfo \
    --namespace "$AB_NAMESPACE" \
    --serverID 'BeO7ZeUp' \
    > test.out 2>&1
eval_tap $? 37 'FleetServerConnectionInfo' test.out

#- 38 ServerHistory
./ng net.accelbyte.sdk.cli.Main ams serverHistory \
    --namespace "$AB_NAMESPACE" \
    --serverID 'bPtWe9cm' \
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
    --fleetID 'rGMH8LfS' \
    --namespace "$AB_NAMESPACE" \
    --body '{"region": "TrVB2fH9", "sessionId": "4sKQDGzd"}' \
    > test.out 2>&1
eval_tap $? 41 'FleetClaimByID' test.out

#- 42 LocalWatchdogConnect
./ng net.accelbyte.sdk.cli.Main ams localWatchdogConnect \
    --namespace "$AB_NAMESPACE" \
    --watchdogID '7hmXSh8I' \
    > test.out 2>&1
eval_tap $? 42 'LocalWatchdogConnect' test.out

#- 43 FleetClaimByKeys
./ng net.accelbyte.sdk.cli.Main ams fleetClaimByKeys \
    --namespace "$AB_NAMESPACE" \
    --body '{"claimKeys": ["W5uAjqy2", "gCRUp738", "thi3V07o"], "regions": ["2k9rx3fa", "WNb70yjJ", "sBw2qiSH"], "sessionId": "xRPJ44zF"}' \
    > test.out 2>&1
eval_tap $? 43 'FleetClaimByKeys' test.out

#- 44 WatchdogConnect
./ng net.accelbyte.sdk.cli.Main ams watchdogConnect \
    --namespace "$AB_NAMESPACE" \
    --watchdogID 'eCHCoRGo' \
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