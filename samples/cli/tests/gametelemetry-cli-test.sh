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
    --deviceType 'u3xuijxx' \
    --endTime 'wyQkv5WX' \
    --eventId 'jcVFheyU' \
    --eventName '4zSLH6sy' \
    --eventPayload 'VOaY4iXC' \
    --flightId 'ddb4G30F' \
    --limit '93' \
    --offset '15' \
    --startTime 'KM5h3zCA' \
    --userId 'otw59xe1' \
    > test.out 2>&1
eval_tap $? 3 'GetEventsGameTelemetryV1AdminNamespacesNamespaceEventsGet' test.out

#- 4 ProtectedSaveEventsGameTelemetryV1ProtectedEventsPost
./ng net.accelbyte.sdk.cli.Main gametelemetry protectedSaveEventsGameTelemetryV1ProtectedEventsPost \
    --body '[{"ClientTimestamp": "1986-01-16T00:00:00Z", "DeviceType": "v305NcMR", "EventId": "dN8HeqvD", "EventName": "yfvlu2tN", "EventNamespace": "2Uey7Ldn", "EventTimestamp": "1992-11-02T00:00:00Z", "Payload": {"T95zn40R": {}, "Ekwpg9XI": {}, "9R5EdRhd": {}}}, {"ClientTimestamp": "1988-08-19T00:00:00Z", "DeviceType": "rQEF0Jvz", "EventId": "Mcx5pUEi", "EventName": "7XhFKWjQ", "EventNamespace": "tyjk7VmM", "EventTimestamp": "1976-05-05T00:00:00Z", "Payload": {"eJURy4Tp": {}, "bgBgUqUz": {}, "icdzv5Mk": {}}}, {"ClientTimestamp": "1986-04-28T00:00:00Z", "DeviceType": "Dp516HGT", "EventId": "AkEUVlIS", "EventName": "N8q3GhTY", "EventNamespace": "rMwNJXku", "EventTimestamp": "1987-05-15T00:00:00Z", "Payload": {"Qg8YJvnC": {}, "WQ4DFsuE": {}, "VA3Vwqc7": {}}}]' \
    > test.out 2>&1
eval_tap $? 4 'ProtectedSaveEventsGameTelemetryV1ProtectedEventsPost' test.out

#- 5 ProtectedGetPlaytimeGameTelemetryV1ProtectedSteamIdsSteamIdPlaytimeGet
./ng net.accelbyte.sdk.cli.Main gametelemetry protectedGetPlaytimeGameTelemetryV1ProtectedSteamIdsSteamIdPlaytimeGet \
    --steamId 'hVbP0uUf' \
    > test.out 2>&1
eval_tap $? 5 'ProtectedGetPlaytimeGameTelemetryV1ProtectedSteamIdsSteamIdPlaytimeGet' test.out

#- 6 ProtectedUpdatePlaytimeGameTelemetryV1ProtectedSteamIdsSteamIdPlaytimePlaytimePut
./ng net.accelbyte.sdk.cli.Main gametelemetry protectedUpdatePlaytimeGameTelemetryV1ProtectedSteamIdsSteamIdPlaytimePlaytimePut \
    --playtime 'QF8iiaMr' \
    --steamId 'bn9qAUZZ' \
    > test.out 2>&1
eval_tap $? 6 'ProtectedUpdatePlaytimeGameTelemetryV1ProtectedSteamIdsSteamIdPlaytimePlaytimePut' test.out


rm -f "tmp.dat"

exit $EXIT_CODE