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
echo "1..6"

#- 1 Login
./ng net.accelbyte.sdk.cli.Main loginClient \
    > test.out 2>&1
eval_tap $? 1 'Login' test.out

if [ $EXIT_CODE -ne 0 ]; then
  echo "Bail out! Login failed."
  exit $EXIT_CODE
fi

touch "tmp.dat"

#- 2 GetNamespacesGameTelemetryV1AdminNamespacesGet
./ng net.accelbyte.sdk.cli.Main gametelemetry getNamespacesGameTelemetryV1AdminNamespacesGet \
    > test.out 2>&1
eval_tap $? 2 'GetNamespacesGameTelemetryV1AdminNamespacesGet' test.out

#- 3 GetEventsGameTelemetryV1AdminNamespacesNamespaceEventsGet
./ng net.accelbyte.sdk.cli.Main gametelemetry getEventsGameTelemetryV1AdminNamespacesNamespaceEventsGet \
    --namespace "$AB_NAMESPACE" \
    --deviceType 'n4VZDHxx' \
    --endTime 'Rn6mYyDj' \
    --eventId '5Lx8kusL' \
    --eventName 'gQoRaKhA' \
    --eventPayload 'HTfjlut3' \
    --flightId 'hupBO2Fn' \
    --limit '6' \
    --offset '81' \
    --startTime 'kEK12ziL' \
    --userId 'zwMgZF4j' \
    > test.out 2>&1
eval_tap $? 3 'GetEventsGameTelemetryV1AdminNamespacesNamespaceEventsGet' test.out

#- 4 ProtectedSaveEventsGameTelemetryV1ProtectedEventsPost
./ng net.accelbyte.sdk.cli.Main gametelemetry protectedSaveEventsGameTelemetryV1ProtectedEventsPost \
    --body '[{"ClientTimestamp": "1997-11-02T00:00:00Z", "DeviceType": "1t6mUoga", "EventId": "mlUJqjdR", "EventName": "mNoEjnXP", "EventNamespace": "fqCfL8ix", "EventTimestamp": "1976-01-17T00:00:00Z", "Payload": {"SHkj73N4": {}, "visTYaSq": {}, "QTDdlKrM": {}}}, {"ClientTimestamp": "1994-12-27T00:00:00Z", "DeviceType": "gXIpcYkH", "EventId": "ah5xsLja", "EventName": "B58invmB", "EventNamespace": "UWIEyumy", "EventTimestamp": "1984-07-18T00:00:00Z", "Payload": {"lm1R9Umm": {}, "jOF0aSsy": {}, "iZvfttZv": {}}}, {"ClientTimestamp": "1976-05-01T00:00:00Z", "DeviceType": "Nyab4zGg", "EventId": "0FMqVHiJ", "EventName": "ozQ1ahg8", "EventNamespace": "BWRSqDZg", "EventTimestamp": "1974-09-17T00:00:00Z", "Payload": {"Cdsav74s": {}, "SPeTGOT3": {}, "KFRZdQRb": {}}}]' \
    > test.out 2>&1
eval_tap $? 4 'ProtectedSaveEventsGameTelemetryV1ProtectedEventsPost' test.out

#- 5 ProtectedGetPlaytimeGameTelemetryV1ProtectedSteamIdsSteamIdPlaytimeGet
./ng net.accelbyte.sdk.cli.Main gametelemetry protectedGetPlaytimeGameTelemetryV1ProtectedSteamIdsSteamIdPlaytimeGet \
    --steamId '72TbOQJZ' \
    > test.out 2>&1
eval_tap $? 5 'ProtectedGetPlaytimeGameTelemetryV1ProtectedSteamIdsSteamIdPlaytimeGet' test.out

#- 6 ProtectedUpdatePlaytimeGameTelemetryV1ProtectedSteamIdsSteamIdPlaytimePlaytimePut
./ng net.accelbyte.sdk.cli.Main gametelemetry protectedUpdatePlaytimeGameTelemetryV1ProtectedSteamIdsSteamIdPlaytimePlaytimePut \
    --playtime 'pC3fJUJ8' \
    --steamId '5ZmC22oz' \
    > test.out 2>&1
eval_tap $? 6 'ProtectedUpdatePlaytimeGameTelemetryV1ProtectedSteamIdsSteamIdPlaytimePlaytimePut' test.out


rm -f "tmp.dat"

exit $EXIT_CODE