[//]: # (Code generated. DO NOT EDIT.)

# Gametelemetry Service Index

&nbsp;

## Operations

### telemetry Wrapper:  [Telemetry](../../module-gametelemetry/src/main/java/net/accelbyte/sdk/api/gametelemetry/wrappers/Telemetry.java)
| Endpoint | Method | ID | Class | Example |
|---|---|---|---|---|
| `/game-telemetry/v1/admin/namespaces` | GET | GetNamespacesGameTelemetryV1AdminNamespacesGet | [GetNamespacesGameTelemetryV1AdminNamespacesGet](../../module-gametelemetry/src/main/java/net/accelbyte/sdk/api/gametelemetry/operations/telemetry/GetNamespacesGameTelemetryV1AdminNamespacesGet.java) | [GetNamespacesGameTelemetryV1AdminNamespacesGet](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/gametelemetry/telemetry/GetNamespacesGameTelemetryV1AdminNamespacesGet.java) |
| `/game-telemetry/v1/admin/namespaces/{namespace}/events` | GET | GetEventsGameTelemetryV1AdminNamespacesNamespaceEventsGet | [GetEventsGameTelemetryV1AdminNamespacesNamespaceEventsGet](../../module-gametelemetry/src/main/java/net/accelbyte/sdk/api/gametelemetry/operations/telemetry/GetEventsGameTelemetryV1AdminNamespacesNamespaceEventsGet.java) | [GetEventsGameTelemetryV1AdminNamespacesNamespaceEventsGet](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/gametelemetry/telemetry/GetEventsGameTelemetryV1AdminNamespacesNamespaceEventsGet.java) |

### Gametelemetry Operations Wrapper:  [GametelemetryOperations](../../module-gametelemetry/src/main/java/net/accelbyte/sdk/api/gametelemetry/wrappers/GametelemetryOperations.java)
| Endpoint | Method | ID | Class | Example |
|---|---|---|---|---|
| `/game-telemetry/v1/protected/events` | POST | ProtectedSaveEventsGameTelemetryV1ProtectedEventsPost | [ProtectedSaveEventsGameTelemetryV1ProtectedEventsPost](../../module-gametelemetry/src/main/java/net/accelbyte/sdk/api/gametelemetry/operations/gametelemetry_operations/ProtectedSaveEventsGameTelemetryV1ProtectedEventsPost.java) | [ProtectedSaveEventsGameTelemetryV1ProtectedEventsPost](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/gametelemetry/gametelemetry_operations/ProtectedSaveEventsGameTelemetryV1ProtectedEventsPost.java) |
| `/game-telemetry/v1/protected/steamIds/{steamId}/playtime` | GET | ProtectedGetPlaytimeGameTelemetryV1ProtectedSteamIdsSteamIdPlaytimeGet | [ProtectedGetPlaytimeGameTelemetryV1ProtectedSteamIdsSteamIdPlaytimeGet](../../module-gametelemetry/src/main/java/net/accelbyte/sdk/api/gametelemetry/operations/gametelemetry_operations/ProtectedGetPlaytimeGameTelemetryV1ProtectedSteamIdsSteamIdPlaytimeGet.java) | [ProtectedGetPlaytimeGameTelemetryV1ProtectedSteamIdsSteamIdPlaytimeGet](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/gametelemetry/gametelemetry_operations/ProtectedGetPlaytimeGameTelemetryV1ProtectedSteamIdsSteamIdPlaytimeGet.java) |
| `/game-telemetry/v1/protected/steamIds/{steamId}/playtime/{playtime}` | PUT | ProtectedUpdatePlaytimeGameTelemetryV1ProtectedSteamIdsSteamIdPlaytimePlaytimePut | [ProtectedUpdatePlaytimeGameTelemetryV1ProtectedSteamIdsSteamIdPlaytimePlaytimePut](../../module-gametelemetry/src/main/java/net/accelbyte/sdk/api/gametelemetry/operations/gametelemetry_operations/ProtectedUpdatePlaytimeGameTelemetryV1ProtectedSteamIdsSteamIdPlaytimePlaytimePut.java) | [ProtectedUpdatePlaytimeGameTelemetryV1ProtectedSteamIdsSteamIdPlaytimePlaytimePut](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/gametelemetry/gametelemetry_operations/ProtectedUpdatePlaytimeGameTelemetryV1ProtectedSteamIdsSteamIdPlaytimePlaytimePut.java) |


&nbsp;

## Models

| Model | Class |
|---|---|
| `BaseErrorResponse` | [BaseErrorResponse](../../module-gametelemetry/src/main/java/net/accelbyte/sdk/api/gametelemetry/models/BaseErrorResponse.java) |
| `GetNamespaceEventResponse` | [GetNamespaceEventResponse](../../module-gametelemetry/src/main/java/net/accelbyte/sdk/api/gametelemetry/models/GetNamespaceEventResponse.java) |
| `HTTPValidationError` | [HTTPValidationError](../../module-gametelemetry/src/main/java/net/accelbyte/sdk/api/gametelemetry/models/HTTPValidationError.java) |
| `ListBaseResponse_str_` | [ListBaseResponseStr](../../module-gametelemetry/src/main/java/net/accelbyte/sdk/api/gametelemetry/models/ListBaseResponseStr.java) |
| `PagedResponse_GetNamespaceEventResponse_` | [PagedResponseGetNamespaceEventResponse](../../module-gametelemetry/src/main/java/net/accelbyte/sdk/api/gametelemetry/models/PagedResponseGetNamespaceEventResponse.java) |
| `Paging` | [Paging](../../module-gametelemetry/src/main/java/net/accelbyte/sdk/api/gametelemetry/models/Paging.java) |
| `PlayTimeResponse` | [PlayTimeResponse](../../module-gametelemetry/src/main/java/net/accelbyte/sdk/api/gametelemetry/models/PlayTimeResponse.java) |
| `TelemetryBody` | [TelemetryBody](../../module-gametelemetry/src/main/java/net/accelbyte/sdk/api/gametelemetry/models/TelemetryBody.java) |
| `ValidationError` | [ValidationError](../../module-gametelemetry/src/main/java/net/accelbyte/sdk/api/gametelemetry/models/ValidationError.java) |
