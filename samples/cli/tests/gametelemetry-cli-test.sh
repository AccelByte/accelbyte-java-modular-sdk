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
    --deviceType '2d4bWaDe' \
    --endTime 'YQIcGNH9' \
    --eventId 'WXNZt5jA' \
    --eventName 'Xy7tDqLH' \
    --eventPayload '66PnDyRk' \
    --flightId 'cb6YYTov' \
    --limit '97' \
    --offset '17' \
    --startTime 'd9VWLJS1' \
    --userId 'adiWdbut' \
    > test.out 2>&1
eval_tap $? 3 'GetEventsGameTelemetryV1AdminNamespacesNamespaceEventsGet' test.out

#- 4 ProtectedSaveEventsGameTelemetryV1ProtectedEventsPost
./ng net.accelbyte.sdk.cli.Main gametelemetry protectedSaveEventsGameTelemetryV1ProtectedEventsPost \
    --body '[{"ClientTimestamp": "1977-06-07T00:00:00Z", "DeviceType": "UQHA3a1g", "EventId": "RB82kRaX", "EventName": "SDChvvS3", "EventNamespace": "cSK42M34", "EventTimestamp": "1999-04-14T00:00:00Z", "Payload": {"JlPIWd4m": {}, "a1C6nNcB": {}, "f6qvb0Nw": {}}}, {"ClientTimestamp": "1977-11-23T00:00:00Z", "DeviceType": "4gdBz2K8", "EventId": "O6Nj0rEq", "EventName": "2HjwE5CI", "EventNamespace": "KeNmUI03", "EventTimestamp": "1985-05-13T00:00:00Z", "Payload": {"hF8R9yRU": {}, "iA4OnUOk": {}, "VBwuDNXu": {}}}, {"ClientTimestamp": "1988-09-26T00:00:00Z", "DeviceType": "oonzBxF0", "EventId": "zGjCDbOo", "EventName": "gBH2T5lL", "EventNamespace": "Yz6g3ONP", "EventTimestamp": "1983-08-22T00:00:00Z", "Payload": {"n5GTJUx3": {}, "hwmpuBSR": {}, "Z76agXTO": {}}}]' \
    > test.out 2>&1
eval_tap $? 4 'ProtectedSaveEventsGameTelemetryV1ProtectedEventsPost' test.out

#- 5 ProtectedGetPlaytimeGameTelemetryV1ProtectedSteamIdsSteamIdPlaytimeGet
./ng net.accelbyte.sdk.cli.Main gametelemetry protectedGetPlaytimeGameTelemetryV1ProtectedSteamIdsSteamIdPlaytimeGet \
    --steamId 'tnowruAD' \
    > test.out 2>&1
eval_tap $? 5 'ProtectedGetPlaytimeGameTelemetryV1ProtectedSteamIdsSteamIdPlaytimeGet' test.out

#- 6 ProtectedUpdatePlaytimeGameTelemetryV1ProtectedSteamIdsSteamIdPlaytimePlaytimePut
./ng net.accelbyte.sdk.cli.Main gametelemetry protectedUpdatePlaytimeGameTelemetryV1ProtectedSteamIdsSteamIdPlaytimePlaytimePut \
    --playtime 'OEcqeHIK' \
    --steamId 'D4KtUCaC' \
    > test.out 2>&1
eval_tap $? 6 'ProtectedUpdatePlaytimeGameTelemetryV1ProtectedSteamIdsSteamIdPlaytimePlaytimePut' test.out


rm -f "tmp.dat"

exit $EXIT_CODE