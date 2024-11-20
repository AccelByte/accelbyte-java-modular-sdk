[//]: # (Code generated. DO NOT EDIT.)

# Ams Service Index

&nbsp;

## Operations

### Auth Wrapper:  [Auth](../../module-ams/src/main/java/net/accelbyte/sdk/api/ams/wrappers/Auth.java)
| Endpoint | Method | ID | Class | Example |
|---|---|---|---|---|
| `/ams/auth` | GET | AuthCheck | [AuthCheck](../../module-ams/src/main/java/net/accelbyte/sdk/api/ams/operations/auth/AuthCheck.java) | [AuthCheck](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/ams/auth/AuthCheck.java) |

### Fleet Commander Wrapper:  [FleetCommander](../../module-ams/src/main/java/net/accelbyte/sdk/api/ams/wrappers/FleetCommander.java)
| Endpoint | Method | ID | Class | Example |
|---|---|---|---|---|
| `/ams/healthz` | GET | PortalHealthCheck | [PortalHealthCheck](../../module-ams/src/main/java/net/accelbyte/sdk/api/ams/operations/fleet_commander/PortalHealthCheck.java) | [PortalHealthCheck](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/ams/fleet_commander/PortalHealthCheck.java) |
| `/ams/version` | GET | Func1 | [Func1](../../module-ams/src/main/java/net/accelbyte/sdk/api/ams/operations/fleet_commander/Func1.java) | [Func1](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/ams/fleet_commander/Func1.java) |
| `/healthz` | GET | BasicHealthCheck | [BasicHealthCheck](../../module-ams/src/main/java/net/accelbyte/sdk/api/ams/operations/fleet_commander/BasicHealthCheck.java) | [BasicHealthCheck](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/ams/fleet_commander/BasicHealthCheck.java) |

### Account Wrapper:  [Account](../../module-ams/src/main/java/net/accelbyte/sdk/api/ams/wrappers/Account.java)
| Endpoint | Method | ID | Class | Example |
|---|---|---|---|---|
| `/ams/v1/admin/namespaces/{namespace}/account` | GET | AdminAccountGet | [AdminAccountGet](../../module-ams/src/main/java/net/accelbyte/sdk/api/ams/operations/account/AdminAccountGet.java) | [AdminAccountGet](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/ams/account/AdminAccountGet.java) |
| `/ams/v1/admin/namespaces/{namespace}/account` | POST | AdminAccountCreate | [AdminAccountCreate](../../module-ams/src/main/java/net/accelbyte/sdk/api/ams/operations/account/AdminAccountCreate.java) | [AdminAccountCreate](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/ams/account/AdminAccountCreate.java) |
| `/ams/v1/admin/namespaces/{namespace}/account/link` | GET | AdminAccountLinkTokenGet | [AdminAccountLinkTokenGet](../../module-ams/src/main/java/net/accelbyte/sdk/api/ams/operations/account/AdminAccountLinkTokenGet.java) | [AdminAccountLinkTokenGet](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/ams/account/AdminAccountLinkTokenGet.java) |
| `/ams/v1/admin/namespaces/{namespace}/account/link` | POST | AdminAccountLink | [AdminAccountLink](../../module-ams/src/main/java/net/accelbyte/sdk/api/ams/operations/account/AdminAccountLink.java) | [AdminAccountLink](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/ams/account/AdminAccountLink.java) |
| `/ams/v1/namespaces/{namespace}/account` | GET | AccountGet | [AccountGet](../../module-ams/src/main/java/net/accelbyte/sdk/api/ams/operations/account/AccountGet.java) | [AccountGet](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/ams/account/AccountGet.java) |

### Artifacts Wrapper:  [Artifacts](../../module-ams/src/main/java/net/accelbyte/sdk/api/ams/wrappers/Artifacts.java)
| Endpoint | Method | ID | Class | Example |
|---|---|---|---|---|
| `/ams/v1/admin/namespaces/{namespace}/artifacts` | GET | ArtifactGet | [ArtifactGet](../../module-ams/src/main/java/net/accelbyte/sdk/api/ams/operations/artifacts/ArtifactGet.java) | [ArtifactGet](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/ams/artifacts/ArtifactGet.java) |
| `/ams/v1/admin/namespaces/{namespace}/artifacts` | DELETE | ArtifactBulkDelete | [ArtifactBulkDelete](../../module-ams/src/main/java/net/accelbyte/sdk/api/ams/operations/artifacts/ArtifactBulkDelete.java) | [ArtifactBulkDelete](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/ams/artifacts/ArtifactBulkDelete.java) |
| `/ams/v1/admin/namespaces/{namespace}/artifacts/usage` | GET | ArtifactUsageGet | [ArtifactUsageGet](../../module-ams/src/main/java/net/accelbyte/sdk/api/ams/operations/artifacts/ArtifactUsageGet.java) | [ArtifactUsageGet](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/ams/artifacts/ArtifactUsageGet.java) |
| `/ams/v1/admin/namespaces/{namespace}/artifacts/{artifactID}` | DELETE | ArtifactDelete | [ArtifactDelete](../../module-ams/src/main/java/net/accelbyte/sdk/api/ams/operations/artifacts/ArtifactDelete.java) | [ArtifactDelete](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/ams/artifacts/ArtifactDelete.java) |
| `/ams/v1/admin/namespaces/{namespace}/artifacts/{artifactID}/url` | GET | ArtifactGetURL | [ArtifactGetURL](../../module-ams/src/main/java/net/accelbyte/sdk/api/ams/operations/artifacts/ArtifactGetURL.java) | [ArtifactGetURL](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/ams/artifacts/ArtifactGetURL.java) |
| `/ams/v1/admin/namespaces/{namespace}/fleets/{fleetID}/artifacts-sampling-rules` | GET | FleetArtifactSamplingRulesGet | [FleetArtifactSamplingRulesGet](../../module-ams/src/main/java/net/accelbyte/sdk/api/ams/operations/artifacts/FleetArtifactSamplingRulesGet.java) | [FleetArtifactSamplingRulesGet](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/ams/artifacts/FleetArtifactSamplingRulesGet.java) |
| `/ams/v1/admin/namespaces/{namespace}/fleets/{fleetID}/artifacts-sampling-rules` | PUT | FleetArtifactSamplingRulesSet | [FleetArtifactSamplingRulesSet](../../module-ams/src/main/java/net/accelbyte/sdk/api/ams/operations/artifacts/FleetArtifactSamplingRulesSet.java) | [FleetArtifactSamplingRulesSet](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/ams/artifacts/FleetArtifactSamplingRulesSet.java) |

### Development Wrapper:  [Development](../../module-ams/src/main/java/net/accelbyte/sdk/api/ams/wrappers/Development.java)
| Endpoint | Method | ID | Class | Example |
|---|---|---|---|---|
| `/ams/v1/admin/namespaces/{namespace}/development/server-configurations` | GET | DevelopmentServerConfigurationList | [DevelopmentServerConfigurationList](../../module-ams/src/main/java/net/accelbyte/sdk/api/ams/operations/development/DevelopmentServerConfigurationList.java) | [DevelopmentServerConfigurationList](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/ams/development/DevelopmentServerConfigurationList.java) |
| `/ams/v1/admin/namespaces/{namespace}/development/server-configurations` | POST | DevelopmentServerConfigurationCreate | [DevelopmentServerConfigurationCreate](../../module-ams/src/main/java/net/accelbyte/sdk/api/ams/operations/development/DevelopmentServerConfigurationCreate.java) | [DevelopmentServerConfigurationCreate](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/ams/development/DevelopmentServerConfigurationCreate.java) |
| `/ams/v1/admin/namespaces/{namespace}/development/server-configurations/{developmentServerConfigID}` | GET | DevelopmentServerConfigurationGet | [DevelopmentServerConfigurationGet](../../module-ams/src/main/java/net/accelbyte/sdk/api/ams/operations/development/DevelopmentServerConfigurationGet.java) | [DevelopmentServerConfigurationGet](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/ams/development/DevelopmentServerConfigurationGet.java) |
| `/ams/v1/admin/namespaces/{namespace}/development/server-configurations/{developmentServerConfigID}` | DELETE | DevelopmentServerConfigurationDelete | [DevelopmentServerConfigurationDelete](../../module-ams/src/main/java/net/accelbyte/sdk/api/ams/operations/development/DevelopmentServerConfigurationDelete.java) | [DevelopmentServerConfigurationDelete](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/ams/development/DevelopmentServerConfigurationDelete.java) |

### Fleets Wrapper:  [Fleets](../../module-ams/src/main/java/net/accelbyte/sdk/api/ams/wrappers/Fleets.java)
| Endpoint | Method | ID | Class | Example |
|---|---|---|---|---|
| `/ams/v1/admin/namespaces/{namespace}/fleets` | GET | FleetList | [FleetList](../../module-ams/src/main/java/net/accelbyte/sdk/api/ams/operations/fleets/FleetList.java) | [FleetList](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/ams/fleets/FleetList.java) |
| `/ams/v1/admin/namespaces/{namespace}/fleets` | POST | FleetCreate | [FleetCreate](../../module-ams/src/main/java/net/accelbyte/sdk/api/ams/operations/fleets/FleetCreate.java) | [FleetCreate](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/ams/fleets/FleetCreate.java) |
| `/ams/v1/admin/namespaces/{namespace}/fleets/{fleetID}` | GET | FleetGet | [FleetGet](../../module-ams/src/main/java/net/accelbyte/sdk/api/ams/operations/fleets/FleetGet.java) | [FleetGet](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/ams/fleets/FleetGet.java) |
| `/ams/v1/admin/namespaces/{namespace}/fleets/{fleetID}` | PUT | FleetUpdate | [FleetUpdate](../../module-ams/src/main/java/net/accelbyte/sdk/api/ams/operations/fleets/FleetUpdate.java) | [FleetUpdate](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/ams/fleets/FleetUpdate.java) |
| `/ams/v1/admin/namespaces/{namespace}/fleets/{fleetID}` | DELETE | FleetDelete | [FleetDelete](../../module-ams/src/main/java/net/accelbyte/sdk/api/ams/operations/fleets/FleetDelete.java) | [FleetDelete](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/ams/fleets/FleetDelete.java) |
| `/ams/v1/admin/namespaces/{namespace}/fleets/{fleetID}/servers` | GET | FleetServers | [FleetServers](../../module-ams/src/main/java/net/accelbyte/sdk/api/ams/operations/fleets/FleetServers.java) | [FleetServers](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/ams/fleets/FleetServers.java) |
| `/ams/v1/namespaces/{namespace}/fleets/{fleetID}/claim` | PUT | FleetClaimByID | [FleetClaimByID](../../module-ams/src/main/java/net/accelbyte/sdk/api/ams/operations/fleets/FleetClaimByID.java) | [FleetClaimByID](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/ams/fleets/FleetClaimByID.java) |
| `/ams/v1/namespaces/{namespace}/servers/claim` | PUT | FleetClaimByKeys | [FleetClaimByKeys](../../module-ams/src/main/java/net/accelbyte/sdk/api/ams/operations/fleets/FleetClaimByKeys.java) | [FleetClaimByKeys](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/ams/fleets/FleetClaimByKeys.java) |

### Servers Wrapper:  [Servers](../../module-ams/src/main/java/net/accelbyte/sdk/api/ams/wrappers/Servers.java)
| Endpoint | Method | ID | Class | Example |
|---|---|---|---|---|
| `/ams/v1/admin/namespaces/{namespace}/fleets/{fleetID}/servers/history` | GET | FleetServerHistory | [FleetServerHistory](../../module-ams/src/main/java/net/accelbyte/sdk/api/ams/operations/servers/FleetServerHistory.java) | [FleetServerHistory](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/ams/servers/FleetServerHistory.java) |
| `/ams/v1/admin/namespaces/{namespace}/servers/{serverID}` | GET | FleetServerInfo | [FleetServerInfo](../../module-ams/src/main/java/net/accelbyte/sdk/api/ams/operations/servers/FleetServerInfo.java) | [FleetServerInfo](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/ams/servers/FleetServerInfo.java) |
| `/ams/v1/admin/namespaces/{namespace}/servers/{serverID}/connectioninfo` | GET | FleetServerConnectionInfo | [FleetServerConnectionInfo](../../module-ams/src/main/java/net/accelbyte/sdk/api/ams/operations/servers/FleetServerConnectionInfo.java) | [FleetServerConnectionInfo](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/ams/servers/FleetServerConnectionInfo.java) |
| `/ams/v1/admin/namespaces/{namespace}/servers/{serverID}/history` | GET | ServerHistory | [ServerHistory](../../module-ams/src/main/java/net/accelbyte/sdk/api/ams/operations/servers/ServerHistory.java) | [ServerHistory](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/ams/servers/ServerHistory.java) |

### Images Wrapper:  [Images](../../module-ams/src/main/java/net/accelbyte/sdk/api/ams/wrappers/Images.java)
| Endpoint | Method | ID | Class | Example |
|---|---|---|---|---|
| `/ams/v1/admin/namespaces/{namespace}/images` | GET | ImageList | [ImageList](../../module-ams/src/main/java/net/accelbyte/sdk/api/ams/operations/images/ImageList.java) | [ImageList](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/ams/images/ImageList.java) |
| `/ams/v1/admin/namespaces/{namespace}/images-storage` | GET | ImagesStorage | [ImagesStorage](../../module-ams/src/main/java/net/accelbyte/sdk/api/ams/operations/images/ImagesStorage.java) | [ImagesStorage](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/ams/images/ImagesStorage.java) |
| `/ams/v1/admin/namespaces/{namespace}/images/{imageID}` | GET | ImageGet | [ImageGet](../../module-ams/src/main/java/net/accelbyte/sdk/api/ams/operations/images/ImageGet.java) | [ImageGet](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/ams/images/ImageGet.java) |
| `/ams/v1/admin/namespaces/{namespace}/images/{imageID}` | DELETE | ImageMarkForDeletion | [ImageMarkForDeletion](../../module-ams/src/main/java/net/accelbyte/sdk/api/ams/operations/images/ImageMarkForDeletion.java) | [ImageMarkForDeletion](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/ams/images/ImageMarkForDeletion.java) |
| `/ams/v1/admin/namespaces/{namespace}/images/{imageID}` | PATCH | ImagePatch | [ImagePatch](../../module-ams/src/main/java/net/accelbyte/sdk/api/ams/operations/images/ImagePatch.java) | [ImagePatch](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/ams/images/ImagePatch.java) |
| `/ams/v1/admin/namespaces/{namespace}/images/{imageID}/restore` | POST | ImageUnmarkForDeletion | [ImageUnmarkForDeletion](../../module-ams/src/main/java/net/accelbyte/sdk/api/ams/operations/images/ImageUnmarkForDeletion.java) | [ImageUnmarkForDeletion](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/ams/images/ImageUnmarkForDeletion.java) |

### AMS QoS Wrapper:  [AMSQoS](../../module-ams/src/main/java/net/accelbyte/sdk/api/ams/wrappers/AMSQoS.java)
| Endpoint | Method | ID | Class | Example |
|---|---|---|---|---|
| `/ams/v1/admin/namespaces/{namespace}/qos` | GET | QoSRegionsGet | [QoSRegionsGet](../../module-ams/src/main/java/net/accelbyte/sdk/api/ams/operations/ams_qo_s/QoSRegionsGet.java) | [QoSRegionsGet](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/ams/ams_qo_s/QoSRegionsGet.java) |
| `/ams/v1/admin/namespaces/{namespace}/qos/{region}` | PATCH | QoSRegionsUpdate | [QoSRegionsUpdate](../../module-ams/src/main/java/net/accelbyte/sdk/api/ams/operations/ams_qo_s/QoSRegionsUpdate.java) | [QoSRegionsUpdate](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/ams/ams_qo_s/QoSRegionsUpdate.java) |

### AMS Info Wrapper:  [AMSInfo](../../module-ams/src/main/java/net/accelbyte/sdk/api/ams/wrappers/AMSInfo.java)
| Endpoint | Method | ID | Class | Example |
|---|---|---|---|---|
| `/ams/v1/admin/namespaces/{namespace}/regions` | GET | InfoRegions | [InfoRegions](../../module-ams/src/main/java/net/accelbyte/sdk/api/ams/operations/ams_info/InfoRegions.java) | [InfoRegions](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/ams/ams_info/InfoRegions.java) |
| `/ams/v1/admin/namespaces/{namespace}/supported-instances` | GET | InfoSupportedInstances | [InfoSupportedInstances](../../module-ams/src/main/java/net/accelbyte/sdk/api/ams/operations/ams_info/InfoSupportedInstances.java) | [InfoSupportedInstances](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/ams/ams_info/InfoSupportedInstances.java) |
| `/ams/v1/upload-url` | GET | UploadURLGet | [UploadURLGet](../../module-ams/src/main/java/net/accelbyte/sdk/api/ams/operations/ams_info/UploadURLGet.java) | [UploadURLGet](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/ams/ams_info/UploadURLGet.java) |

### Watchdogs Wrapper:  [Watchdogs](../../module-ams/src/main/java/net/accelbyte/sdk/api/ams/wrappers/Watchdogs.java)
| Endpoint | Method | ID | Class | Example |
|---|---|---|---|---|
| `/ams/v1/namespaces/{namespace}/local/{watchdogID}/connect` | GET | LocalWatchdogConnect | [LocalWatchdogConnect](../../module-ams/src/main/java/net/accelbyte/sdk/api/ams/operations/watchdogs/LocalWatchdogConnect.java) | [LocalWatchdogConnect](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/ams/watchdogs/LocalWatchdogConnect.java) |
| `/ams/v1/namespaces/{namespace}/watchdogs/{watchdogID}/connect` | GET | WatchdogConnect | [WatchdogConnect](../../module-ams/src/main/java/net/accelbyte/sdk/api/ams/operations/watchdogs/WatchdogConnect.java) | [WatchdogConnect](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/ams/watchdogs/WatchdogConnect.java) |


&nbsp;

## Models

| Model | Class |
|---|---|
| `api.AMSRegionsResponse` | [ApiAMSRegionsResponse](../../module-ams/src/main/java/net/accelbyte/sdk/api/ams/models/ApiAMSRegionsResponse.java) |
| `api.AccountCreateRequest` | [ApiAccountCreateRequest](../../module-ams/src/main/java/net/accelbyte/sdk/api/ams/models/ApiAccountCreateRequest.java) |
| `api.AccountCreateResponse` | [ApiAccountCreateResponse](../../module-ams/src/main/java/net/accelbyte/sdk/api/ams/models/ApiAccountCreateResponse.java) |
| `api.AccountLimits` | [ApiAccountLimits](../../module-ams/src/main/java/net/accelbyte/sdk/api/ams/models/ApiAccountLimits.java) |
| `api.AccountLinkRequest` | [ApiAccountLinkRequest](../../module-ams/src/main/java/net/accelbyte/sdk/api/ams/models/ApiAccountLinkRequest.java) |
| `api.AccountLinkResponse` | [ApiAccountLinkResponse](../../module-ams/src/main/java/net/accelbyte/sdk/api/ams/models/ApiAccountLinkResponse.java) |
| `api.AccountLinkTokenResponse` | [ApiAccountLinkTokenResponse](../../module-ams/src/main/java/net/accelbyte/sdk/api/ams/models/ApiAccountLinkTokenResponse.java) |
| `api.AccountResponse` | [ApiAccountResponse](../../module-ams/src/main/java/net/accelbyte/sdk/api/ams/models/ApiAccountResponse.java) |
| `api.ArtifactListResponse` | [ApiArtifactListResponse](../../module-ams/src/main/java/net/accelbyte/sdk/api/ams/models/ApiArtifactListResponse.java) |
| `api.ArtifactResponse` | [ApiArtifactResponse](../../module-ams/src/main/java/net/accelbyte/sdk/api/ams/models/ApiArtifactResponse.java) |
| `api.ArtifactSamplingRule` | [ApiArtifactSamplingRule](../../module-ams/src/main/java/net/accelbyte/sdk/api/ams/models/ApiArtifactSamplingRule.java) |
| `api.ArtifactTypeSamplingRules` | [ApiArtifactTypeSamplingRules](../../module-ams/src/main/java/net/accelbyte/sdk/api/ams/models/ApiArtifactTypeSamplingRules.java) |
| `api.ArtifactURLResponse` | [ApiArtifactURLResponse](../../module-ams/src/main/java/net/accelbyte/sdk/api/ams/models/ApiArtifactURLResponse.java) |
| `api.ArtifactUsageResponse` | [ApiArtifactUsageResponse](../../module-ams/src/main/java/net/accelbyte/sdk/api/ams/models/ApiArtifactUsageResponse.java) |
| `api.Capacity` | [ApiCapacity](../../module-ams/src/main/java/net/accelbyte/sdk/api/ams/models/ApiCapacity.java) |
| `api.CoredumpSamplingRules` | [ApiCoredumpSamplingRules](../../module-ams/src/main/java/net/accelbyte/sdk/api/ams/models/ApiCoredumpSamplingRules.java) |
| `api.DSHistoryEvent` | [ApiDSHistoryEvent](../../module-ams/src/main/java/net/accelbyte/sdk/api/ams/models/ApiDSHistoryEvent.java) |
| `api.DSHistoryList` | [ApiDSHistoryList](../../module-ams/src/main/java/net/accelbyte/sdk/api/ams/models/ApiDSHistoryList.java) |
| `api.DSHostConfiguration` | [ApiDSHostConfiguration](../../module-ams/src/main/java/net/accelbyte/sdk/api/ams/models/ApiDSHostConfiguration.java) |
| `api.DSHostConfigurationParameters` | [ApiDSHostConfigurationParameters](../../module-ams/src/main/java/net/accelbyte/sdk/api/ams/models/ApiDSHostConfigurationParameters.java) |
| `api.DevelopmentServerConfigurationCreateRequest` | [ApiDevelopmentServerConfigurationCreateRequest](../../module-ams/src/main/java/net/accelbyte/sdk/api/ams/models/ApiDevelopmentServerConfigurationCreateRequest.java) |
| `api.DevelopmentServerConfigurationCreateResponse` | [ApiDevelopmentServerConfigurationCreateResponse](../../module-ams/src/main/java/net/accelbyte/sdk/api/ams/models/ApiDevelopmentServerConfigurationCreateResponse.java) |
| `api.DevelopmentServerConfigurationGetResponse` | [ApiDevelopmentServerConfigurationGetResponse](../../module-ams/src/main/java/net/accelbyte/sdk/api/ams/models/ApiDevelopmentServerConfigurationGetResponse.java) |
| `api.DevelopmentServerConfigurationListResponse` | [ApiDevelopmentServerConfigurationListResponse](../../module-ams/src/main/java/net/accelbyte/sdk/api/ams/models/ApiDevelopmentServerConfigurationListResponse.java) |
| `api.FleetArtifactsSampleRules` | [ApiFleetArtifactsSampleRules](../../module-ams/src/main/java/net/accelbyte/sdk/api/ams/models/ApiFleetArtifactsSampleRules.java) |
| `api.FleetClaimByKeysReq` | [ApiFleetClaimByKeysReq](../../module-ams/src/main/java/net/accelbyte/sdk/api/ams/models/ApiFleetClaimByKeysReq.java) |
| `api.FleetClaimReq` | [ApiFleetClaimReq](../../module-ams/src/main/java/net/accelbyte/sdk/api/ams/models/ApiFleetClaimReq.java) |
| `api.FleetClaimResponse` | [ApiFleetClaimResponse](../../module-ams/src/main/java/net/accelbyte/sdk/api/ams/models/ApiFleetClaimResponse.java) |
| `api.FleetCreateResponse` | [ApiFleetCreateResponse](../../module-ams/src/main/java/net/accelbyte/sdk/api/ams/models/ApiFleetCreateResponse.java) |
| `api.FleetGetResponse` | [ApiFleetGetResponse](../../module-ams/src/main/java/net/accelbyte/sdk/api/ams/models/ApiFleetGetResponse.java) |
| `api.FleetListItemResponse` | [ApiFleetListItemResponse](../../module-ams/src/main/java/net/accelbyte/sdk/api/ams/models/ApiFleetListItemResponse.java) |
| `api.FleetListResponse` | [ApiFleetListResponse](../../module-ams/src/main/java/net/accelbyte/sdk/api/ams/models/ApiFleetListResponse.java) |
| `api.FleetParameters` | [ApiFleetParameters](../../module-ams/src/main/java/net/accelbyte/sdk/api/ams/models/ApiFleetParameters.java) |
| `api.FleetRegionalServerCounts` | [ApiFleetRegionalServerCounts](../../module-ams/src/main/java/net/accelbyte/sdk/api/ams/models/ApiFleetRegionalServerCounts.java) |
| `api.FleetServerConnectionInfoResponse` | [ApiFleetServerConnectionInfoResponse](../../module-ams/src/main/java/net/accelbyte/sdk/api/ams/models/ApiFleetServerConnectionInfoResponse.java) |
| `api.FleetServerHistoryEventResponse` | [ApiFleetServerHistoryEventResponse](../../module-ams/src/main/java/net/accelbyte/sdk/api/ams/models/ApiFleetServerHistoryEventResponse.java) |
| `api.FleetServerHistoryResponse` | [ApiFleetServerHistoryResponse](../../module-ams/src/main/java/net/accelbyte/sdk/api/ams/models/ApiFleetServerHistoryResponse.java) |
| `api.FleetServerInfoResponse` | [ApiFleetServerInfoResponse](../../module-ams/src/main/java/net/accelbyte/sdk/api/ams/models/ApiFleetServerInfoResponse.java) |
| `api.FleetServersResponse` | [ApiFleetServersResponse](../../module-ams/src/main/java/net/accelbyte/sdk/api/ams/models/ApiFleetServersResponse.java) |
| `api.ImageDeploymentProfile` | [ApiImageDeploymentProfile](../../module-ams/src/main/java/net/accelbyte/sdk/api/ams/models/ApiImageDeploymentProfile.java) |
| `api.ImageDetails` | [ApiImageDetails](../../module-ams/src/main/java/net/accelbyte/sdk/api/ams/models/ApiImageDetails.java) |
| `api.ImageList` | [ApiImageList](../../module-ams/src/main/java/net/accelbyte/sdk/api/ams/models/ApiImageList.java) |
| `api.ImageListItem` | [ApiImageListItem](../../module-ams/src/main/java/net/accelbyte/sdk/api/ams/models/ApiImageListItem.java) |
| `api.ImageStorage` | [ApiImageStorage](../../module-ams/src/main/java/net/accelbyte/sdk/api/ams/models/ApiImageStorage.java) |
| `api.ImageUpdate` | [ApiImageUpdate](../../module-ams/src/main/java/net/accelbyte/sdk/api/ams/models/ApiImageUpdate.java) |
| `api.InstanceTypeForNamespaceResponse` | [ApiInstanceTypeForNamespaceResponse](../../module-ams/src/main/java/net/accelbyte/sdk/api/ams/models/ApiInstanceTypeForNamespaceResponse.java) |
| `api.InstanceTypesForNamespaceResponse` | [ApiInstanceTypesForNamespaceResponse](../../module-ams/src/main/java/net/accelbyte/sdk/api/ams/models/ApiInstanceTypesForNamespaceResponse.java) |
| `api.PagingInfo` | [ApiPagingInfo](../../module-ams/src/main/java/net/accelbyte/sdk/api/ams/models/ApiPagingInfo.java) |
| `api.PortConfiguration` | [ApiPortConfiguration](../../module-ams/src/main/java/net/accelbyte/sdk/api/ams/models/ApiPortConfiguration.java) |
| `api.QoSEndpointResponse` | [ApiQoSEndpointResponse](../../module-ams/src/main/java/net/accelbyte/sdk/api/ams/models/ApiQoSEndpointResponse.java) |
| `api.QoSServer` | [ApiQoSServer](../../module-ams/src/main/java/net/accelbyte/sdk/api/ams/models/ApiQoSServer.java) |
| `api.ReferencingFleet` | [ApiReferencingFleet](../../module-ams/src/main/java/net/accelbyte/sdk/api/ams/models/ApiReferencingFleet.java) |
| `api.RegionConfig` | [ApiRegionConfig](../../module-ams/src/main/java/net/accelbyte/sdk/api/ams/models/ApiRegionConfig.java) |
| `api.Time` | [ApiTime](../../module-ams/src/main/java/net/accelbyte/sdk/api/ams/models/ApiTime.java) |
| `api.Timeout` | [ApiTimeout](../../module-ams/src/main/java/net/accelbyte/sdk/api/ams/models/ApiTimeout.java) |
| `api.UpdateServerRequest` | [ApiUpdateServerRequest](../../module-ams/src/main/java/net/accelbyte/sdk/api/ams/models/ApiUpdateServerRequest.java) |
| `response.ErrorResponse` | [ResponseErrorResponse](../../module-ams/src/main/java/net/accelbyte/sdk/api/ams/models/ResponseErrorResponse.java) |
| `time.Location` | [TimeLocation](../../module-ams/src/main/java/net/accelbyte/sdk/api/ams/models/TimeLocation.java) |
| `time.zone` | [TimeZone](../../module-ams/src/main/java/net/accelbyte/sdk/api/ams/models/TimeZone.java) |
| `time.zoneTrans` | [TimeZoneTrans](../../module-ams/src/main/java/net/accelbyte/sdk/api/ams/models/TimeZoneTrans.java) |
