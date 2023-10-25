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
echo "1..27"

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
    --body '{"name": "KwcDzoWL"}' \
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
    --body '{"token": "Sn4ccTpf"}' \
    > test.out 2>&1
eval_tap $? 7 'AccountLink' test.out

#- 8 FleetList
./ng net.accelbyte.sdk.cli.Main ams fleetList \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 8 'FleetList' test.out

#- 9 FleetCreate
./ng net.accelbyte.sdk.cli.Main ams fleetCreate \
    --namespace "$AB_NAMESPACE" \
    --body '{"active": true, "claimKeys": ["WHREtEib", "jFHNx5wo", "CQqMNKLe"], "dsHostConfiguration": {"instanceId": "FJhrRtQt", "instanceType": "FVqPPgyu", "serversPerVm": 44}, "imageDeploymentProfile": {"commandLine": "aizYMLIK", "imageId": "0FMJTfFB", "portConfigurations": [{"name": "kWjPRD2s", "protocol": "j81ciOPP"}, {"name": "XDPQERYm", "protocol": "m779pjx3"}, {"name": "ZanjJsDM", "protocol": "91oafhl7"}], "timeout": {"creation": 49, "drain": 80, "session": 34, "unresponsive": 77}}, "name": "Xwo7Qb34", "regions": [{"bufferSize": 87, "maxServerCount": 74, "minServerCount": 8, "region": "0chDIYxC"}, {"bufferSize": 25, "maxServerCount": 21, "minServerCount": 93, "region": "WHkh4uAL"}, {"bufferSize": 99, "maxServerCount": 16, "minServerCount": 42, "region": "q3jnI0NH"}]}' \
    > test.out 2>&1
eval_tap $? 9 'FleetCreate' test.out

#- 10 FleetGet
./ng net.accelbyte.sdk.cli.Main ams fleetGet \
    --fleetID 'celDYMyI' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 10 'FleetGet' test.out

#- 11 FleetUpdate
./ng net.accelbyte.sdk.cli.Main ams fleetUpdate \
    --fleetID 'wfHTWUp2' \
    --namespace "$AB_NAMESPACE" \
    --body '{"active": true, "claimKeys": ["X4q3ruPl", "BQnMeiO2", "ALG33PdU"], "dsHostConfiguration": {"instanceId": "Q5BTb54n", "instanceType": "8o1Ks1AO", "serversPerVm": 54}, "imageDeploymentProfile": {"commandLine": "BejeyKnw", "imageId": "AlfUAZCD", "portConfigurations": [{"name": "n3tmMeAv", "protocol": "SQDRevIt"}, {"name": "nYMVkk0D", "protocol": "iwwUFaBf"}, {"name": "vLFfhh21", "protocol": "1AnYkHJS"}], "timeout": {"creation": 50, "drain": 15, "session": 36, "unresponsive": 7}}, "name": "PNvxLQDi", "regions": [{"bufferSize": 38, "maxServerCount": 91, "minServerCount": 95, "region": "hq8qRqoe"}, {"bufferSize": 10, "maxServerCount": 82, "minServerCount": 56, "region": "sNJr0MDq"}, {"bufferSize": 37, "maxServerCount": 95, "minServerCount": 82, "region": "jbBPqel0"}]}' \
    > test.out 2>&1
eval_tap $? 11 'FleetUpdate' test.out

#- 12 FleetDelete
./ng net.accelbyte.sdk.cli.Main ams fleetDelete \
    --fleetID 'nI3m0ylR' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 12 'FleetDelete' test.out

#- 13 FleetServers
./ng net.accelbyte.sdk.cli.Main ams fleetServers \
    --fleetID 'DL2Q3K5O' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 13 'FleetServers' test.out

#- 14 FleetServerHistory
./ng net.accelbyte.sdk.cli.Main ams fleetServerHistory \
    --fleetID 'jb8ERyM7' \
    --namespace "$AB_NAMESPACE" \
    --count '53' \
    --offset '75' \
    --reason 't7SDI6Hc' \
    --region 'cwrMVl2W' \
    --serverId 'd9LbH45e' \
    --sortDirection 'y6SpzSbG' \
    --status 'sfuWR8oe' \
    > test.out 2>&1
eval_tap $? 14 'FleetServerHistory' test.out

#- 15 ImageList
./ng net.accelbyte.sdk.cli.Main ams imageList \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 15 'ImageList' test.out

#- 16 ImageGet
./ng net.accelbyte.sdk.cli.Main ams imageGet \
    --imageID 'XL7oqIFb' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 16 'ImageGet' test.out

#- 17 ImagePatch
./ng net.accelbyte.sdk.cli.Main ams imagePatch \
    --imageID 'ZpnPUDZ3' \
    --namespace "$AB_NAMESPACE" \
    --body '{"addedTags": ["1pFFo2th", "IuaO053N", "mdsAaIZR"], "isProtected": false, "name": "qo2ppupX", "removedTags": ["ouN3gtby", "TyHy4OHg", "1MrQKI1L"]}' \
    > test.out 2>&1
eval_tap $? 17 'ImagePatch' test.out

#- 18 InfoRegions
./ng net.accelbyte.sdk.cli.Main ams infoRegions \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 18 'InfoRegions' test.out

#- 19 FleetServerInfo
./ng net.accelbyte.sdk.cli.Main ams fleetServerInfo \
    --namespace "$AB_NAMESPACE" \
    --serverID '9ZZhPRi9' \
    > test.out 2>&1
eval_tap $? 19 'FleetServerInfo' test.out

#- 20 ServerHistory
./ng net.accelbyte.sdk.cli.Main ams serverHistory \
    --namespace "$AB_NAMESPACE" \
    --serverID 'ZI7rU3az' \
    > test.out 2>&1
eval_tap $? 20 'ServerHistory' test.out

#- 21 InfoSupportedInstances
./ng net.accelbyte.sdk.cli.Main ams infoSupportedInstances \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 21 'InfoSupportedInstances' test.out

#- 22 FleetClaimByID
./ng net.accelbyte.sdk.cli.Main ams fleetClaimByID \
    --fleetID 'gF9rEJED' \
    --namespace "$AB_NAMESPACE" \
    --body '{"region": "5Jeu0jN7"}' \
    > test.out 2>&1
eval_tap $? 22 'FleetClaimByID' test.out

#- 23 LocalWatchdogConnect
./ng net.accelbyte.sdk.cli.Main ams localWatchdogConnect \
    --namespace "$AB_NAMESPACE" \
    --watchdogID 'tVvL2GQX' \
    > test.out 2>&1
eval_tap $? 23 'LocalWatchdogConnect' test.out

#- 24 FleetClaimByKeys
./ng net.accelbyte.sdk.cli.Main ams fleetClaimByKeys \
    --namespace "$AB_NAMESPACE" \
    --body '{"claimKeys": ["HqUL8kpa", "4Rot5oHj", "zjsdGK6W"], "regions": ["dIZe1T7u", "t95FtDF4", "vDNavu2G"]}' \
    > test.out 2>&1
eval_tap $? 24 'FleetClaimByKeys' test.out

#- 25 WatchdogConnect
./ng net.accelbyte.sdk.cli.Main ams watchdogConnect \
    --namespace "$AB_NAMESPACE" \
    --watchdogID '5mY0GCPK' \
    > test.out 2>&1
eval_tap $? 25 'WatchdogConnect' test.out

#- 26 Func1
./ng net.accelbyte.sdk.cli.Main ams func1 \
    > test.out 2>&1
eval_tap $? 26 'Func1' test.out

#- 27 BasicHealthCheck
./ng net.accelbyte.sdk.cli.Main ams basicHealthCheck \
    > test.out 2>&1
eval_tap $? 27 'BasicHealthCheck' test.out


rm -f "tmp.dat"

exit $EXIT_CODE