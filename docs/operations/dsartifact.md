[//]: # (Code generated. DO NOT EDIT.)

# Dsartifact Service Index

&nbsp;

## Operations

### Artifact Upload Process Queue Wrapper:  [ArtifactUploadProcessQueue](../../module-dsartifact/src/main/java/net/accelbyte/sdk/api/dsartifact/wrappers/ArtifactUploadProcessQueue.java)
| Endpoint | Method | ID | Class | Example |
|---|---|---|---|---|
| `/dsartifact/artifacts/nodes/ipaddresses` | GET | ListNodesIPAddress | [ListNodesIPAddress](../../module-dsartifact/src/main/java/net/accelbyte/sdk/api/dsartifact/operations/artifact_upload_process_queue/ListNodesIPAddress.java) | [ListNodesIPAddress](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/dsartifact/artifact_upload_process_queue/ListNodesIPAddress.java) |
| `/dsartifact/artifacts/nodes/ipaddresses` | DELETE | DeleteNodeByID | [DeleteNodeByID](../../module-dsartifact/src/main/java/net/accelbyte/sdk/api/dsartifact/operations/artifact_upload_process_queue/DeleteNodeByID.java) | [DeleteNodeByID](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/dsartifact/artifact_upload_process_queue/DeleteNodeByID.java) |
| `/dsartifact/artifacts/queues` | GET | ListQueue | [ListQueue](../../module-dsartifact/src/main/java/net/accelbyte/sdk/api/dsartifact/operations/artifact_upload_process_queue/ListQueue.java) | [ListQueue](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/dsartifact/artifact_upload_process_queue/ListQueue.java) |
| `/dsartifact/artifacts/queues/active` | GET | GetActiveQueue | [GetActiveQueue](../../module-dsartifact/src/main/java/net/accelbyte/sdk/api/dsartifact/operations/artifact_upload_process_queue/GetActiveQueue.java) | [GetActiveQueue](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/dsartifact/artifact_upload_process_queue/GetActiveQueue.java) |
| `/dsartifact/artifacts/queues/active` | PUT | SetActiveQueue | [SetActiveQueue](../../module-dsartifact/src/main/java/net/accelbyte/sdk/api/dsartifact/operations/artifact_upload_process_queue/SetActiveQueue.java) | [SetActiveQueue](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/dsartifact/artifact_upload_process_queue/SetActiveQueue.java) |
| `/dsartifact/artifacts/queues/active` | DELETE | DeleteActiveQueue | [DeleteActiveQueue](../../module-dsartifact/src/main/java/net/accelbyte/sdk/api/dsartifact/operations/artifact_upload_process_queue/DeleteActiveQueue.java) | [DeleteActiveQueue](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/dsartifact/artifact_upload_process_queue/DeleteActiveQueue.java) |
| `/dsartifact/artifacts/queues/failed` | PUT | ReportFailedUpload | [ReportFailedUpload](../../module-dsartifact/src/main/java/net/accelbyte/sdk/api/dsartifact/operations/artifact_upload_process_queue/ReportFailedUpload.java) | [ReportFailedUpload](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/dsartifact/artifact_upload_process_queue/ReportFailedUpload.java) |
| `/dsartifact/namespaces/{namespace}/artifacts/queues` | DELETE | DeleteQueue | [DeleteQueue](../../module-dsartifact/src/main/java/net/accelbyte/sdk/api/dsartifact/operations/artifact_upload_process_queue/DeleteQueue.java) | [DeleteQueue](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/dsartifact/artifact_upload_process_queue/DeleteQueue.java) |
| `/dsartifact/namespaces/{namespace}/artifacts/queues/active/all` | GET | ListAllActiveQueue | [ListAllActiveQueue](../../module-dsartifact/src/main/java/net/accelbyte/sdk/api/dsartifact/operations/artifact_upload_process_queue/ListAllActiveQueue.java) | [ListAllActiveQueue](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/dsartifact/artifact_upload_process_queue/ListAllActiveQueue.java) |
| `/dsartifact/namespaces/{namespace}/artifacts/queues/all` | GET | ListAllQueue | [ListAllQueue](../../module-dsartifact/src/main/java/net/accelbyte/sdk/api/dsartifact/operations/artifact_upload_process_queue/ListAllQueue.java) | [ListAllQueue](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/dsartifact/artifact_upload_process_queue/ListAllQueue.java) |

### Terminated Servers Wrapper:  [TerminatedServers](../../module-dsartifact/src/main/java/net/accelbyte/sdk/api/dsartifact/wrappers/TerminatedServers.java)
| Endpoint | Method | ID | Class | Example |
|---|---|---|---|---|
| `/dsartifact/namespaces/{namespace}/servers/search` | GET | ListTerminatedServersWithNamespace | [ListTerminatedServersWithNamespace](../../module-dsartifact/src/main/java/net/accelbyte/sdk/api/dsartifact/operations/terminated_servers/ListTerminatedServersWithNamespace.java) | [ListTerminatedServersWithNamespace](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/dsartifact/terminated_servers/ListTerminatedServersWithNamespace.java) |

### Download Server Artifact Wrapper:  [DownloadServerArtifact](../../module-dsartifact/src/main/java/net/accelbyte/sdk/api/dsartifact/wrappers/DownloadServerArtifact.java)
| Endpoint | Method | ID | Class | Example |
|---|---|---|---|---|
| `/dsartifact/namespaces/{namespace}/servers/{podName}/artifacts/download` | GET | DownloadServerArtifacts | [DownloadServerArtifacts](../../module-dsartifact/src/main/java/net/accelbyte/sdk/api/dsartifact/operations/download_server_artifact/DownloadServerArtifacts.java) | [DownloadServerArtifacts](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/dsartifact/download_server_artifact/DownloadServerArtifacts.java) |
| `/dsartifact/namespaces/{namespace}/servers/{podName}/artifacts/exists` | GET | CheckServerArtifact | [CheckServerArtifact](../../module-dsartifact/src/main/java/net/accelbyte/sdk/api/dsartifact/operations/download_server_artifact/CheckServerArtifact.java) | [CheckServerArtifact](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/dsartifact/download_server_artifact/CheckServerArtifact.java) |

### All Terminated Servers Wrapper:  [AllTerminatedServers](../../module-dsartifact/src/main/java/net/accelbyte/sdk/api/dsartifact/wrappers/AllTerminatedServers.java)
| Endpoint | Method | ID | Class | Example |
|---|---|---|---|---|
| `/dsartifact/servers/search` | GET | ListTerminatedServers | [ListTerminatedServers](../../module-dsartifact/src/main/java/net/accelbyte/sdk/api/dsartifact/operations/all_terminated_servers/ListTerminatedServers.java) | [ListTerminatedServers](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/dsartifact/all_terminated_servers/ListTerminatedServers.java) |

### Operations Wrapper:  [Operations](../../module-dsartifact/src/main/java/net/accelbyte/sdk/api/dsartifact/wrappers/Operations.java)
| Endpoint | Method | ID | Class | Example |
|---|---|---|---|---|
| `/dsartifact/v1/messages` | GET | PublicGetMessages | [PublicGetMessages](../../module-dsartifact/src/main/java/net/accelbyte/sdk/api/dsartifact/operations/operations/PublicGetMessages.java) | [PublicGetMessages](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/dsartifact/operations/PublicGetMessages.java) |


&nbsp;

## Models

| Model | Class |
|---|---|
| `log.AppMessageDeclaration` | [LogAppMessageDeclaration](../../module-dsartifact/src/main/java/net/accelbyte/sdk/api/dsartifact/models/LogAppMessageDeclaration.java) |
| `models.AllQueueResult` | [ModelsAllQueueResult](../../module-dsartifact/src/main/java/net/accelbyte/sdk/api/dsartifact/models/ModelsAllQueueResult.java) |
| `models.ArtifactFileStatus` | [ModelsArtifactFileStatus](../../module-dsartifact/src/main/java/net/accelbyte/sdk/api/dsartifact/models/ModelsArtifactFileStatus.java) |
| `models.ListAllQueueResponse` | [ModelsListAllQueueResponse](../../module-dsartifact/src/main/java/net/accelbyte/sdk/api/dsartifact/models/ModelsListAllQueueResponse.java) |
| `models.ListNodesIPAddress` | [ModelsListNodesIPAddress](../../module-dsartifact/src/main/java/net/accelbyte/sdk/api/dsartifact/models/ModelsListNodesIPAddress.java) |
| `models.ListQueueResponse` | [ModelsListQueueResponse](../../module-dsartifact/src/main/java/net/accelbyte/sdk/api/dsartifact/models/ModelsListQueueResponse.java) |
| `models.ListTerminatedServersResponse` | [ModelsListTerminatedServersResponse](../../module-dsartifact/src/main/java/net/accelbyte/sdk/api/dsartifact/models/ModelsListTerminatedServersResponse.java) |
| `models.MatchResult` | [ModelsMatchResult](../../module-dsartifact/src/main/java/net/accelbyte/sdk/api/dsartifact/models/ModelsMatchResult.java) |
| `models.NotifPayloadServerStatusChange` | [ModelsNotifPayloadServerStatusChange](../../module-dsartifact/src/main/java/net/accelbyte/sdk/api/dsartifact/models/ModelsNotifPayloadServerStatusChange.java) |
| `models.PagingCursor` | [ModelsPagingCursor](../../module-dsartifact/src/main/java/net/accelbyte/sdk/api/dsartifact/models/ModelsPagingCursor.java) |
| `models.Queue` | [ModelsQueue](../../module-dsartifact/src/main/java/net/accelbyte/sdk/api/dsartifact/models/ModelsQueue.java) |
| `models.QueueResult` | [ModelsQueueResult](../../module-dsartifact/src/main/java/net/accelbyte/sdk/api/dsartifact/models/ModelsQueueResult.java) |
| `models.RequestMatchMember` | [ModelsRequestMatchMember](../../module-dsartifact/src/main/java/net/accelbyte/sdk/api/dsartifact/models/ModelsRequestMatchMember.java) |
| `models.RequestMatchParty` | [ModelsRequestMatchParty](../../module-dsartifact/src/main/java/net/accelbyte/sdk/api/dsartifact/models/ModelsRequestMatchParty.java) |
| `models.RequestMatchingAlly` | [ModelsRequestMatchingAlly](../../module-dsartifact/src/main/java/net/accelbyte/sdk/api/dsartifact/models/ModelsRequestMatchingAlly.java) |
| `models.Server` | [ModelsServer](../../module-dsartifact/src/main/java/net/accelbyte/sdk/api/dsartifact/models/ModelsServer.java) |
| `models.StatusHistory` | [ModelsStatusHistory](../../module-dsartifact/src/main/java/net/accelbyte/sdk/api/dsartifact/models/ModelsStatusHistory.java) |
| `response.Error` | [ResponseError](../../module-dsartifact/src/main/java/net/accelbyte/sdk/api/dsartifact/models/ResponseError.java) |
