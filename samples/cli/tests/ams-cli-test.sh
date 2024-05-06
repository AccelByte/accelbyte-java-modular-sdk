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
echo "1..42"

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
    --body '{"name": "8FPH1SFr"}' \
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
    --body '{"token": "veOtILcP"}' \
    > test.out 2>&1
eval_tap $? 7 'AdminAccountLinkTokenPost' test.out

#- 8 ArtifactGet
./ng net.accelbyte.sdk.cli.Main ams artifactGet \
    --namespace "$AB_NAMESPACE" \
    --artifactType 'IhxLwydL' \
    --count '244' \
    --endDate 'PwPsEp2t' \
    --fleetID 'rRfpGTZr' \
    --imageID 'WKyOjr44' \
    --maxSize '62' \
    --minSize '97' \
    --offset '92' \
    --region '3GOhXVmJ' \
    --serverId '1V2u11FP' \
    --startDate 'I5fObcdz' \
    --status 'Wp5TxQ9l' \
    > test.out 2>&1
eval_tap $? 8 'ArtifactGet' test.out

#- 9 ArtifactUsageGet
./ng net.accelbyte.sdk.cli.Main ams artifactUsageGet \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 9 'ArtifactUsageGet' test.out

#- 10 ArtifactDelete
./ng net.accelbyte.sdk.cli.Main ams artifactDelete \
    --artifactID 'mGiVlDJR' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 10 'ArtifactDelete' test.out

#- 11 ArtifactGetURL
./ng net.accelbyte.sdk.cli.Main ams artifactGetURL \
    --artifactID 'u8WD6nlz' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 11 'ArtifactGetURL' test.out

#- 12 DevelopmentServerConfigurationList
./ng net.accelbyte.sdk.cli.Main ams developmentServerConfigurationList \
    --namespace "$AB_NAMESPACE" \
    --count '139' \
    --offset '30' \
    > test.out 2>&1
eval_tap $? 12 'DevelopmentServerConfigurationList' test.out

#- 13 DevelopmentServerConfigurationCreate
./ng net.accelbyte.sdk.cli.Main ams developmentServerConfigurationCreate \
    --namespace "$AB_NAMESPACE" \
    --body '{"commandLineArguments": "Y1NxpVOq", "imageId": "jdTXKrJv", "name": "bkydcECU"}' \
    > test.out 2>&1
eval_tap $? 13 'DevelopmentServerConfigurationCreate' test.out

#- 14 DevelopmentServerConfigurationGet
./ng net.accelbyte.sdk.cli.Main ams developmentServerConfigurationGet \
    --developmentServerConfigID '7tm8Zbyx' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 14 'DevelopmentServerConfigurationGet' test.out

#- 15 DevelopmentServerConfigurationDelete
./ng net.accelbyte.sdk.cli.Main ams developmentServerConfigurationDelete \
    --developmentServerConfigID 'oDkoH5dp' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 15 'DevelopmentServerConfigurationDelete' test.out

#- 16 FleetList
./ng net.accelbyte.sdk.cli.Main ams fleetList \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 16 'FleetList' test.out

#- 17 FleetCreate
./ng net.accelbyte.sdk.cli.Main ams fleetCreate \
    --namespace "$AB_NAMESPACE" \
    --body '{"active": false, "claimKeys": ["YdkmoXBX", "JcCr0sy5", "2lg0ISxO"], "dsHostConfiguration": {"instanceId": "Ag9dsu7N", "instanceType": "tzb2vnJz", "serversPerVm": 65}, "imageDeploymentProfile": {"commandLine": "OTfQdwCn", "imageId": "GudG6Jcc", "portConfigurations": [{"name": "Tc24ZzPZ", "protocol": "Iwlkah0R"}, {"name": "4POg4KsL", "protocol": "XzHrtYCP"}, {"name": "W43wCzAI", "protocol": "eqnZlnih"}], "timeout": {"creation": 2, "drain": 79, "session": 86, "unresponsive": 56}}, "name": "yzjI1I89", "onDemand": true, "regions": [{"bufferSize": 77, "maxServerCount": 42, "minServerCount": 55, "region": "2QXkClOJ"}, {"bufferSize": 50, "maxServerCount": 19, "minServerCount": 27, "region": "1TIVXybG"}, {"bufferSize": 16, "maxServerCount": 43, "minServerCount": 84, "region": "iAgzNUp7"}], "samplingRules": {"coredumps": {"crashed": {"collect": false, "percentage": 77}, "success": {"collect": true, "percentage": 84}}, "logs": {"crashed": {"collect": true, "percentage": 69}, "success": {"collect": false, "percentage": 89}}}}' \
    > test.out 2>&1
eval_tap $? 17 'FleetCreate' test.out

#- 18 FleetGet
./ng net.accelbyte.sdk.cli.Main ams fleetGet \
    --fleetID '1AOXzREX' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 18 'FleetGet' test.out

#- 19 FleetUpdate
./ng net.accelbyte.sdk.cli.Main ams fleetUpdate \
    --fleetID 'tnWQt129' \
    --namespace "$AB_NAMESPACE" \
    --body '{"active": false, "claimKeys": ["uL5cAhYu", "HAm0Mbb4", "wkOZBrBH"], "dsHostConfiguration": {"instanceId": "PmxhpRFn", "instanceType": "EBLFDp1e", "serversPerVm": 29}, "imageDeploymentProfile": {"commandLine": "gBqlOjUM", "imageId": "M3ya7NvV", "portConfigurations": [{"name": "n398tyqj", "protocol": "lyrcIHGT"}, {"name": "klL32ZbK", "protocol": "UVEg30CT"}, {"name": "ud9qXy8J", "protocol": "Zwg3zAt0"}], "timeout": {"creation": 62, "drain": 39, "session": 92, "unresponsive": 87}}, "name": "EQOR2bZ5", "onDemand": false, "regions": [{"bufferSize": 66, "maxServerCount": 80, "minServerCount": 25, "region": "kM845XV7"}, {"bufferSize": 40, "maxServerCount": 76, "minServerCount": 21, "region": "NSQZQK8W"}, {"bufferSize": 30, "maxServerCount": 20, "minServerCount": 74, "region": "YYLTr7bw"}], "samplingRules": {"coredumps": {"crashed": {"collect": false, "percentage": 1}, "success": {"collect": true, "percentage": 76}}, "logs": {"crashed": {"collect": true, "percentage": 100}, "success": {"collect": true, "percentage": 80}}}}' \
    > test.out 2>&1
eval_tap $? 19 'FleetUpdate' test.out

#- 20 FleetDelete
./ng net.accelbyte.sdk.cli.Main ams fleetDelete \
    --fleetID '8pISG1fS' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 20 'FleetDelete' test.out

#- 21 FleetArtifactSamplingRulesGet
./ng net.accelbyte.sdk.cli.Main ams fleetArtifactSamplingRulesGet \
    --fleetID 'rXA3MdR8' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 21 'FleetArtifactSamplingRulesGet' test.out

#- 22 FleetArtifactSamplingRulesSet
./ng net.accelbyte.sdk.cli.Main ams fleetArtifactSamplingRulesSet \
    --fleetID 'h7CKqwIE' \
    --namespace "$AB_NAMESPACE" \
    --body '{"coredumps": {"crashed": {"collect": true, "percentage": 46}, "success": {"collect": true, "percentage": 22}}, "logs": {"crashed": {"collect": false, "percentage": 13}, "success": {"collect": true, "percentage": 26}}}' \
    > test.out 2>&1
eval_tap $? 22 'FleetArtifactSamplingRulesSet' test.out

#- 23 FleetServers
./ng net.accelbyte.sdk.cli.Main ams fleetServers \
    --fleetID 'Ywz39EQV' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 23 'FleetServers' test.out

#- 24 FleetServerHistory
./ng net.accelbyte.sdk.cli.Main ams fleetServerHistory \
    --fleetID 'Y4GwI0iE' \
    --namespace "$AB_NAMESPACE" \
    --count '4' \
    --offset '43' \
    --reason 'ztpBmfAi' \
    --region 'jTEzyFeD' \
    --serverId 'qXSg7sDL' \
    --sortDirection 'B8H1nm31' \
    --status '7p0Av4q3' \
    > test.out 2>&1
eval_tap $? 24 'FleetServerHistory' test.out

#- 25 ImageList
./ng net.accelbyte.sdk.cli.Main ams imageList \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 25 'ImageList' test.out

#- 26 ImageGet
./ng net.accelbyte.sdk.cli.Main ams imageGet \
    --imageID 'y0pRfm6T' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 26 'ImageGet' test.out

#- 27 ImagePatch
./ng net.accelbyte.sdk.cli.Main ams imagePatch \
    --imageID 'by02YeKz' \
    --namespace "$AB_NAMESPACE" \
    --body '{"addedTags": ["pNYKO05X", "9BFkhhOv", "AmlCso1N"], "isProtected": false, "name": "YyhqY0Iy", "removedTags": ["NtCbzyVD", "LFesbsXu", "NE6rsgjZ"]}' \
    > test.out 2>&1
eval_tap $? 27 'ImagePatch' test.out

#- 28 QoSRegionsGet
./ng net.accelbyte.sdk.cli.Main ams qoSRegionsGet \
    --namespace "$AB_NAMESPACE" \
    --status 'M59d73Sq' \
    > test.out 2>&1
eval_tap $? 28 'QoSRegionsGet' test.out

#- 29 QoSRegionsUpdate
./ng net.accelbyte.sdk.cli.Main ams qoSRegionsUpdate \
    --namespace "$AB_NAMESPACE" \
    --region 'Rztay5sr' \
    --body '{"status": "CXzN2fzM"}' \
    > test.out 2>&1
eval_tap $? 29 'QoSRegionsUpdate' test.out

#- 30 InfoRegions
./ng net.accelbyte.sdk.cli.Main ams infoRegions \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 30 'InfoRegions' test.out

#- 31 FleetServerInfo
./ng net.accelbyte.sdk.cli.Main ams fleetServerInfo \
    --namespace "$AB_NAMESPACE" \
    --serverID 'myvhxxGy' \
    > test.out 2>&1
eval_tap $? 31 'FleetServerInfo' test.out

#- 32 FleetServerConnectionInfo
./ng net.accelbyte.sdk.cli.Main ams fleetServerConnectionInfo \
    --namespace "$AB_NAMESPACE" \
    --serverID 'l5wfJDxM' \
    > test.out 2>&1
eval_tap $? 32 'FleetServerConnectionInfo' test.out

#- 33 ServerHistory
./ng net.accelbyte.sdk.cli.Main ams serverHistory \
    --namespace "$AB_NAMESPACE" \
    --serverID '32kkYD0q' \
    > test.out 2>&1
eval_tap $? 33 'ServerHistory' test.out

#- 34 InfoSupportedInstances
./ng net.accelbyte.sdk.cli.Main ams infoSupportedInstances \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 34 'InfoSupportedInstances' test.out

#- 35 AccountGet
./ng net.accelbyte.sdk.cli.Main ams accountGet \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 35 'AccountGet' test.out

#- 36 FleetClaimByID
./ng net.accelbyte.sdk.cli.Main ams fleetClaimByID \
    --fleetID 'hbqi8UUf' \
    --namespace "$AB_NAMESPACE" \
    --body '{"region": "PPcnxqhq", "sessionId": "pcbc96c5"}' \
    > test.out 2>&1
eval_tap $? 36 'FleetClaimByID' test.out

#- 37 LocalWatchdogConnect
./ng net.accelbyte.sdk.cli.Main ams localWatchdogConnect \
    --namespace "$AB_NAMESPACE" \
    --watchdogID 'MVr5ErDO' \
    > test.out 2>&1
eval_tap $? 37 'LocalWatchdogConnect' test.out

#- 38 FleetClaimByKeys
./ng net.accelbyte.sdk.cli.Main ams fleetClaimByKeys \
    --namespace "$AB_NAMESPACE" \
    --body '{"claimKeys": ["W3uhexSf", "M6qm47CV", "VVHch8Wn"], "regions": ["Wm5cTvF1", "037Ryukh", "5cTgY4Zl"], "sessionId": "huRLBPP7"}' \
    > test.out 2>&1
eval_tap $? 38 'FleetClaimByKeys' test.out

#- 39 WatchdogConnect
./ng net.accelbyte.sdk.cli.Main ams watchdogConnect \
    --namespace "$AB_NAMESPACE" \
    --watchdogID 'QsrzWt4d' \
    > test.out 2>&1
eval_tap $? 39 'WatchdogConnect' test.out

#- 40 UploadURLGet
./ng net.accelbyte.sdk.cli.Main ams uploadURLGet \
    > test.out 2>&1
eval_tap $? 40 'UploadURLGet' test.out

#- 41 Func1
./ng net.accelbyte.sdk.cli.Main ams func1 \
    > test.out 2>&1
eval_tap $? 41 'Func1' test.out

#- 42 BasicHealthCheck
./ng net.accelbyte.sdk.cli.Main ams basicHealthCheck \
    > test.out 2>&1
eval_tap $? 42 'BasicHealthCheck' test.out


rm -f "tmp.dat"

exit $EXIT_CODE