[//]: # (Code generated. DO NOT EDIT.)

# Dslogmanager Service Index

&nbsp;

## Operations

### Admin Wrapper:  [Admin](../../module-dslogmanager/src/main/java/net/accelbyte/sdk/api/dslogmanager/wrappers/Admin.java)
| Endpoint | Method | ID | Class | Example |
|---|---|---|---|---|
| `/dslogmanager/admin/namespaces/{namespace}/servers/{podName}/logs` | GET | GetServerLogs | [GetServerLogs](../../module-dslogmanager/src/main/java/net/accelbyte/sdk/api/dslogmanager/operations/admin/GetServerLogs.java) | [GetServerLogs](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/dslogmanager/admin/GetServerLogs.java) |

### Terminated Servers Wrapper:  [TerminatedServers](../../module-dslogmanager/src/main/java/net/accelbyte/sdk/api/dslogmanager/wrappers/TerminatedServers.java)
| Endpoint | Method | ID | Class | Example |
|---|---|---|---|---|
| `/dslogmanager/namespaces/{namespace}/servers/search` | GET | ListTerminatedServers | [ListTerminatedServers](../../module-dslogmanager/src/main/java/net/accelbyte/sdk/api/dslogmanager/operations/terminated_servers/ListTerminatedServers.java) | [ListTerminatedServers](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/dslogmanager/terminated_servers/ListTerminatedServers.java) |
| `/dslogmanager/namespaces/{namespace}/servers/{podName}/logs/download` | GET | DownloadServerLogs | [DownloadServerLogs](../../module-dslogmanager/src/main/java/net/accelbyte/sdk/api/dslogmanager/operations/terminated_servers/DownloadServerLogs.java) | [DownloadServerLogs](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/dslogmanager/terminated_servers/DownloadServerLogs.java) |
| `/dslogmanager/namespaces/{namespace}/servers/{podName}/logs/exists` | GET | CheckServerLogs | [CheckServerLogs](../../module-dslogmanager/src/main/java/net/accelbyte/sdk/api/dslogmanager/operations/terminated_servers/CheckServerLogs.java) | [CheckServerLogs](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/dslogmanager/terminated_servers/CheckServerLogs.java) |

### All Terminated Servers Wrapper:  [AllTerminatedServers](../../module-dslogmanager/src/main/java/net/accelbyte/sdk/api/dslogmanager/wrappers/AllTerminatedServers.java)
| Endpoint | Method | ID | Class | Example |
|---|---|---|---|---|
| `/dslogmanager/servers/logs/download` | POST | BatchDownloadServerLogs | [BatchDownloadServerLogs](../../module-dslogmanager/src/main/java/net/accelbyte/sdk/api/dslogmanager/operations/all_terminated_servers/BatchDownloadServerLogs.java) | [BatchDownloadServerLogs](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/dslogmanager/all_terminated_servers/BatchDownloadServerLogs.java) |
| `/dslogmanager/servers/metadata` | POST | ListMetadataServers | [ListMetadataServers](../../module-dslogmanager/src/main/java/net/accelbyte/sdk/api/dslogmanager/operations/all_terminated_servers/ListMetadataServers.java) | [ListMetadataServers](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/dslogmanager/all_terminated_servers/ListMetadataServers.java) |
| `/dslogmanager/servers/search` | GET | ListAllTerminatedServers | [ListAllTerminatedServers](../../module-dslogmanager/src/main/java/net/accelbyte/sdk/api/dslogmanager/operations/all_terminated_servers/ListAllTerminatedServers.java) | [ListAllTerminatedServers](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/dslogmanager/all_terminated_servers/ListAllTerminatedServers.java) |

### Dslogmanager Operations Wrapper:  [DslogmanagerOperations](../../module-dslogmanager/src/main/java/net/accelbyte/sdk/api/dslogmanager/wrappers/DslogmanagerOperations.java)
| Endpoint | Method | ID | Class | Example |
|---|---|---|---|---|
| `/dslogmanager/v1/messages` | GET | PublicGetMessages | [PublicGetMessages](../../module-dslogmanager/src/main/java/net/accelbyte/sdk/api/dslogmanager/operations/dslogmanager_operations/PublicGetMessages.java) | [PublicGetMessages](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/dslogmanager/dslogmanager_operations/PublicGetMessages.java) |


&nbsp;

## Models

| Model | Class |
|---|---|
| `log.AppMessageDeclaration` | [LogAppMessageDeclaration](../../module-dslogmanager/src/main/java/net/accelbyte/sdk/api/dslogmanager/models/LogAppMessageDeclaration.java) |
| `models.AllocationEvent` | [ModelsAllocationEvent](../../module-dslogmanager/src/main/java/net/accelbyte/sdk/api/dslogmanager/models/ModelsAllocationEvent.java) |
| `models.BatchDownloadLogsRequest` | [ModelsBatchDownloadLogsRequest](../../module-dslogmanager/src/main/java/net/accelbyte/sdk/api/dslogmanager/models/ModelsBatchDownloadLogsRequest.java) |
| `models.DownloadLogsRequest` | [ModelsDownloadLogsRequest](../../module-dslogmanager/src/main/java/net/accelbyte/sdk/api/dslogmanager/models/ModelsDownloadLogsRequest.java) |
| `models.ListTerminatedServersResponse` | [ModelsListTerminatedServersResponse](../../module-dslogmanager/src/main/java/net/accelbyte/sdk/api/dslogmanager/models/ModelsListTerminatedServersResponse.java) |
| `models.LogFileStatus` | [ModelsLogFileStatus](../../module-dslogmanager/src/main/java/net/accelbyte/sdk/api/dslogmanager/models/ModelsLogFileStatus.java) |
| `models.MatchResult` | [ModelsMatchResult](../../module-dslogmanager/src/main/java/net/accelbyte/sdk/api/dslogmanager/models/ModelsMatchResult.java) |
| `models.MetadataServersRequest` | [ModelsMetadataServersRequest](../../module-dslogmanager/src/main/java/net/accelbyte/sdk/api/dslogmanager/models/ModelsMetadataServersRequest.java) |
| `models.NotifPayloadServerStatusChangeResponse` | [ModelsNotifPayloadServerStatusChangeResponse](../../module-dslogmanager/src/main/java/net/accelbyte/sdk/api/dslogmanager/models/ModelsNotifPayloadServerStatusChangeResponse.java) |
| `models.PagingCursor` | [ModelsPagingCursor](../../module-dslogmanager/src/main/java/net/accelbyte/sdk/api/dslogmanager/models/ModelsPagingCursor.java) |
| `models.RequestMatchMember` | [ModelsRequestMatchMember](../../module-dslogmanager/src/main/java/net/accelbyte/sdk/api/dslogmanager/models/ModelsRequestMatchMember.java) |
| `models.RequestMatchParty` | [ModelsRequestMatchParty](../../module-dslogmanager/src/main/java/net/accelbyte/sdk/api/dslogmanager/models/ModelsRequestMatchParty.java) |
| `models.RequestMatchingAlly` | [ModelsRequestMatchingAlly](../../module-dslogmanager/src/main/java/net/accelbyte/sdk/api/dslogmanager/models/ModelsRequestMatchingAlly.java) |
| `models.ServerLogs` | [ModelsServerLogs](../../module-dslogmanager/src/main/java/net/accelbyte/sdk/api/dslogmanager/models/ModelsServerLogs.java) |
| `models.ServerResponse` | [ModelsServerResponse](../../module-dslogmanager/src/main/java/net/accelbyte/sdk/api/dslogmanager/models/ModelsServerResponse.java) |
| `models.StatusHistory` | [ModelsStatusHistory](../../module-dslogmanager/src/main/java/net/accelbyte/sdk/api/dslogmanager/models/ModelsStatusHistory.java) |
| `response.Error` | [ResponseError](../../module-dslogmanager/src/main/java/net/accelbyte/sdk/api/dslogmanager/models/ResponseError.java) |
