[//]: # (Code generated. DO NOT EDIT.)

# Match2 Service Index

&nbsp;

## Operations

### Operations Wrapper:  [Operations](../../module-match2/src/main/java/net/accelbyte/sdk/api/match2/wrappers/Operations.java)
| Endpoint | Method | ID | Class | Example |
|---|---|---|---|---|
| `/healthz` | GET | GetHealthcheckInfo | [GetHealthcheckInfo](../../module-match2/src/main/java/net/accelbyte/sdk/api/match2/operations/operations/GetHealthcheckInfo.java) | [GetHealthcheckInfo](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/match2/operations/GetHealthcheckInfo.java) |
| `/match2/healthz` | GET | GetHealthcheckInfoV1 | [GetHealthcheckInfoV1](../../module-match2/src/main/java/net/accelbyte/sdk/api/match2/operations/operations/GetHealthcheckInfoV1.java) | [GetHealthcheckInfoV1](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/match2/operations/GetHealthcheckInfoV1.java) |
| `/match2/version` | GET | VersionCheckHandler | [VersionCheckHandler](../../module-match2/src/main/java/net/accelbyte/sdk/api/match2/operations/operations/VersionCheckHandler.java) | [VersionCheckHandler](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/match2/operations/VersionCheckHandler.java) |

### Config Wrapper:  [Config](../../module-match2/src/main/java/net/accelbyte/sdk/api/match2/wrappers/Config.java)
| Endpoint | Method | ID | Class | Example |
|---|---|---|---|---|
| `/match2/v1/admin/config/log` | GET | AdminGetLogConfig | [AdminGetLogConfig](../../module-match2/src/main/java/net/accelbyte/sdk/api/match2/operations/config/AdminGetLogConfig.java) | [AdminGetLogConfig](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/match2/config/AdminGetLogConfig.java) |
| `/match2/v1/admin/config/log` | PATCH | AdminPatchUpdateLogConfig | [AdminPatchUpdateLogConfig](../../module-match2/src/main/java/net/accelbyte/sdk/api/match2/operations/config/AdminPatchUpdateLogConfig.java) | [AdminPatchUpdateLogConfig](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/match2/config/AdminPatchUpdateLogConfig.java) |
| `/match2/v1/config` | GET | AdminGetAllConfigV1 | [AdminGetAllConfigV1](../../module-match2/src/main/java/net/accelbyte/sdk/api/match2/operations/config/AdminGetAllConfigV1.java) | [AdminGetAllConfigV1](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/match2/config/AdminGetAllConfigV1.java) |
| `/match2/v1/config/namespaces/{namespace}` | GET | AdminGetConfigV1 | [AdminGetConfigV1](../../module-match2/src/main/java/net/accelbyte/sdk/api/match2/operations/config/AdminGetConfigV1.java) | [AdminGetConfigV1](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/match2/config/AdminGetConfigV1.java) |
| `/match2/v1/config/namespaces/{namespace}` | PATCH | AdminPatchConfigV1 | [AdminPatchConfigV1](../../module-match2/src/main/java/net/accelbyte/sdk/api/match2/operations/config/AdminPatchConfigV1.java) | [AdminPatchConfigV1](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/match2/config/AdminPatchConfigV1.java) |

### Environment-Variables Wrapper:  [EnvironmentVariables](../../module-match2/src/main/java/net/accelbyte/sdk/api/match2/wrappers/EnvironmentVariables.java)
| Endpoint | Method | ID | Class | Example |
|---|---|---|---|---|
| `/match2/v1/environment-variables` | GET | EnvironmentVariableList | [EnvironmentVariableList](../../module-match2/src/main/java/net/accelbyte/sdk/api/match2/operations/environment_variables/EnvironmentVariableList.java) | [EnvironmentVariableList](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/match2/environment_variables/EnvironmentVariableList.java) |

### Backfill Wrapper:  [Backfill](../../module-match2/src/main/java/net/accelbyte/sdk/api/match2/wrappers/Backfill.java)
| Endpoint | Method | ID | Class | Example |
|---|---|---|---|---|
| `/match2/v1/namespaces/{namespace}/backfill` | POST | CreateBackfill | [CreateBackfill](../../module-match2/src/main/java/net/accelbyte/sdk/api/match2/operations/backfill/CreateBackfill.java) | [CreateBackfill](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/match2/backfill/CreateBackfill.java) |
| `/match2/v1/namespaces/{namespace}/backfill/proposal` | GET | GetBackfillProposal | [GetBackfillProposal](../../module-match2/src/main/java/net/accelbyte/sdk/api/match2/operations/backfill/GetBackfillProposal.java) | [GetBackfillProposal](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/match2/backfill/GetBackfillProposal.java) |
| `/match2/v1/namespaces/{namespace}/backfill/{backfillID}` | GET | GetBackfill | [GetBackfill](../../module-match2/src/main/java/net/accelbyte/sdk/api/match2/operations/backfill/GetBackfill.java) | [GetBackfill](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/match2/backfill/GetBackfill.java) |
| `/match2/v1/namespaces/{namespace}/backfill/{backfillID}` | DELETE | DeleteBackfill | [DeleteBackfill](../../module-match2/src/main/java/net/accelbyte/sdk/api/match2/operations/backfill/DeleteBackfill.java) | [DeleteBackfill](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/match2/backfill/DeleteBackfill.java) |
| `/match2/v1/namespaces/{namespace}/backfill/{backfillID}/proposal/accept` | PUT | AcceptBackfill | [AcceptBackfill](../../module-match2/src/main/java/net/accelbyte/sdk/api/match2/operations/backfill/AcceptBackfill.java) | [AcceptBackfill](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/match2/backfill/AcceptBackfill.java) |
| `/match2/v1/namespaces/{namespace}/backfill/{backfillID}/proposal/reject` | PUT | RejectBackfill | [RejectBackfill](../../module-match2/src/main/java/net/accelbyte/sdk/api/match2/operations/backfill/RejectBackfill.java) | [RejectBackfill](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/match2/backfill/RejectBackfill.java) |

### Match-Functions Wrapper:  [MatchFunctions](../../module-match2/src/main/java/net/accelbyte/sdk/api/match2/wrappers/MatchFunctions.java)
| Endpoint | Method | ID | Class | Example |
|---|---|---|---|---|
| `/match2/v1/namespaces/{namespace}/match-functions` | GET | MatchFunctionList | [MatchFunctionList](../../module-match2/src/main/java/net/accelbyte/sdk/api/match2/operations/match_functions/MatchFunctionList.java) | [MatchFunctionList](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/match2/match_functions/MatchFunctionList.java) |
| `/match2/v1/namespaces/{namespace}/match-functions` | POST | CreateMatchFunction | [CreateMatchFunction](../../module-match2/src/main/java/net/accelbyte/sdk/api/match2/operations/match_functions/CreateMatchFunction.java) | [CreateMatchFunction](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/match2/match_functions/CreateMatchFunction.java) |
| `/match2/v1/namespaces/{namespace}/match-functions/{name}` | PUT | UpdateMatchFunction | [UpdateMatchFunction](../../module-match2/src/main/java/net/accelbyte/sdk/api/match2/operations/match_functions/UpdateMatchFunction.java) | [UpdateMatchFunction](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/match2/match_functions/UpdateMatchFunction.java) |
| `/match2/v1/namespaces/{namespace}/match-functions/{name}` | DELETE | DeleteMatchFunction | [DeleteMatchFunction](../../module-match2/src/main/java/net/accelbyte/sdk/api/match2/operations/match_functions/DeleteMatchFunction.java) | [DeleteMatchFunction](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/match2/match_functions/DeleteMatchFunction.java) |

### Match-Pools Wrapper:  [MatchPools](../../module-match2/src/main/java/net/accelbyte/sdk/api/match2/wrappers/MatchPools.java)
| Endpoint | Method | ID | Class | Example |
|---|---|---|---|---|
| `/match2/v1/namespaces/{namespace}/match-pools` | GET | MatchPoolList | [MatchPoolList](../../module-match2/src/main/java/net/accelbyte/sdk/api/match2/operations/match_pools/MatchPoolList.java) | [MatchPoolList](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/match2/match_pools/MatchPoolList.java) |
| `/match2/v1/namespaces/{namespace}/match-pools` | POST | CreateMatchPool | [CreateMatchPool](../../module-match2/src/main/java/net/accelbyte/sdk/api/match2/operations/match_pools/CreateMatchPool.java) | [CreateMatchPool](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/match2/match_pools/CreateMatchPool.java) |
| `/match2/v1/namespaces/{namespace}/match-pools/{pool}` | GET | MatchPoolDetails | [MatchPoolDetails](../../module-match2/src/main/java/net/accelbyte/sdk/api/match2/operations/match_pools/MatchPoolDetails.java) | [MatchPoolDetails](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/match2/match_pools/MatchPoolDetails.java) |
| `/match2/v1/namespaces/{namespace}/match-pools/{pool}` | PUT | UpdateMatchPool | [UpdateMatchPool](../../module-match2/src/main/java/net/accelbyte/sdk/api/match2/operations/match_pools/UpdateMatchPool.java) | [UpdateMatchPool](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/match2/match_pools/UpdateMatchPool.java) |
| `/match2/v1/namespaces/{namespace}/match-pools/{pool}` | DELETE | DeleteMatchPool | [DeleteMatchPool](../../module-match2/src/main/java/net/accelbyte/sdk/api/match2/operations/match_pools/DeleteMatchPool.java) | [DeleteMatchPool](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/match2/match_pools/DeleteMatchPool.java) |
| `/match2/v1/namespaces/{namespace}/match-pools/{pool}/metrics` | GET | MatchPoolMetric | [MatchPoolMetric](../../module-match2/src/main/java/net/accelbyte/sdk/api/match2/operations/match_pools/MatchPoolMetric.java) | [MatchPoolMetric](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/match2/match_pools/MatchPoolMetric.java) |
| `/match2/v1/namespaces/{namespace}/match-pools/{pool}/metrics/player` | GET | GetPlayerMetric | [GetPlayerMetric](../../module-match2/src/main/java/net/accelbyte/sdk/api/match2/operations/match_pools/GetPlayerMetric.java) | [GetPlayerMetric](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/match2/match_pools/GetPlayerMetric.java) |
| `/match2/v1/namespaces/{namespace}/match-pools/{pool}/tickets` | GET | AdminGetMatchPoolTickets | [AdminGetMatchPoolTickets](../../module-match2/src/main/java/net/accelbyte/sdk/api/match2/operations/match_pools/AdminGetMatchPoolTickets.java) | [AdminGetMatchPoolTickets](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/match2/match_pools/AdminGetMatchPoolTickets.java) |

### Match-Tickets Wrapper:  [MatchTickets](../../module-match2/src/main/java/net/accelbyte/sdk/api/match2/wrappers/MatchTickets.java)
| Endpoint | Method | ID | Class | Example |
|---|---|---|---|---|
| `/match2/v1/namespaces/{namespace}/match-tickets` | POST | CreateMatchTicket | [CreateMatchTicket](../../module-match2/src/main/java/net/accelbyte/sdk/api/match2/operations/match_tickets/CreateMatchTicket.java) | [CreateMatchTicket](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/match2/match_tickets/CreateMatchTicket.java) |
| `/match2/v1/namespaces/{namespace}/match-tickets/me` | GET | GetMyMatchTickets | [GetMyMatchTickets](../../module-match2/src/main/java/net/accelbyte/sdk/api/match2/operations/match_tickets/GetMyMatchTickets.java) | [GetMyMatchTickets](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/match2/match_tickets/GetMyMatchTickets.java) |
| `/match2/v1/namespaces/{namespace}/match-tickets/{ticketid}` | GET | MatchTicketDetails | [MatchTicketDetails](../../module-match2/src/main/java/net/accelbyte/sdk/api/match2/operations/match_tickets/MatchTicketDetails.java) | [MatchTicketDetails](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/match2/match_tickets/MatchTicketDetails.java) |
| `/match2/v1/namespaces/{namespace}/match-tickets/{ticketid}` | DELETE | DeleteMatchTicket | [DeleteMatchTicket](../../module-match2/src/main/java/net/accelbyte/sdk/api/match2/operations/match_tickets/DeleteMatchTicket.java) | [DeleteMatchTicket](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/match2/match_tickets/DeleteMatchTicket.java) |

### Rule-Sets Wrapper:  [RuleSets](../../module-match2/src/main/java/net/accelbyte/sdk/api/match2/wrappers/RuleSets.java)
| Endpoint | Method | ID | Class | Example |
|---|---|---|---|---|
| `/match2/v1/namespaces/{namespace}/rulesets` | GET | RuleSetList | [RuleSetList](../../module-match2/src/main/java/net/accelbyte/sdk/api/match2/operations/rule_sets/RuleSetList.java) | [RuleSetList](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/match2/rule_sets/RuleSetList.java) |
| `/match2/v1/namespaces/{namespace}/rulesets` | POST | CreateRuleSet | [CreateRuleSet](../../module-match2/src/main/java/net/accelbyte/sdk/api/match2/operations/rule_sets/CreateRuleSet.java) | [CreateRuleSet](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/match2/rule_sets/CreateRuleSet.java) |
| `/match2/v1/namespaces/{namespace}/rulesets/{ruleset}` | GET | RuleSetDetails | [RuleSetDetails](../../module-match2/src/main/java/net/accelbyte/sdk/api/match2/operations/rule_sets/RuleSetDetails.java) | [RuleSetDetails](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/match2/rule_sets/RuleSetDetails.java) |
| `/match2/v1/namespaces/{namespace}/rulesets/{ruleset}` | PUT | UpdateRuleSet | [UpdateRuleSet](../../module-match2/src/main/java/net/accelbyte/sdk/api/match2/operations/rule_sets/UpdateRuleSet.java) | [UpdateRuleSet](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/match2/rule_sets/UpdateRuleSet.java) |
| `/match2/v1/namespaces/{namespace}/rulesets/{ruleset}` | DELETE | DeleteRuleSet | [DeleteRuleSet](../../module-match2/src/main/java/net/accelbyte/sdk/api/match2/operations/rule_sets/DeleteRuleSet.java) | [DeleteRuleSet](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/match2/rule_sets/DeleteRuleSet.java) |


&nbsp;

## Models

| Model | Class |
|---|---|
| `api.BackFillAcceptRequest` | [ApiBackFillAcceptRequest](../../module-match2/src/main/java/net/accelbyte/sdk/api/match2/models/ApiBackFillAcceptRequest.java) |
| `api.BackFillCreateRequest` | [ApiBackFillCreateRequest](../../module-match2/src/main/java/net/accelbyte/sdk/api/match2/models/ApiBackFillCreateRequest.java) |
| `api.BackfillCreateResponse` | [ApiBackfillCreateResponse](../../module-match2/src/main/java/net/accelbyte/sdk/api/match2/models/ApiBackfillCreateResponse.java) |
| `api.BackfillGetResponse` | [ApiBackfillGetResponse](../../module-match2/src/main/java/net/accelbyte/sdk/api/match2/models/ApiBackfillGetResponse.java) |
| `api.BackfillProposalResponse` | [ApiBackfillProposalResponse](../../module-match2/src/main/java/net/accelbyte/sdk/api/match2/models/ApiBackfillProposalResponse.java) |
| `api.ListEnvironmentVariablesResponse` | [ApiListEnvironmentVariablesResponse](../../module-match2/src/main/java/net/accelbyte/sdk/api/match2/models/ApiListEnvironmentVariablesResponse.java) |
| `api.ListMatchFunctionsResponse` | [ApiListMatchFunctionsResponse](../../module-match2/src/main/java/net/accelbyte/sdk/api/match2/models/ApiListMatchFunctionsResponse.java) |
| `api.ListMatchPoolTicketsResponse` | [ApiListMatchPoolTicketsResponse](../../module-match2/src/main/java/net/accelbyte/sdk/api/match2/models/ApiListMatchPoolTicketsResponse.java) |
| `api.ListMatchPoolsResponse` | [ApiListMatchPoolsResponse](../../module-match2/src/main/java/net/accelbyte/sdk/api/match2/models/ApiListMatchPoolsResponse.java) |
| `api.ListRuleSetsResponse` | [ApiListRuleSetsResponse](../../module-match2/src/main/java/net/accelbyte/sdk/api/match2/models/ApiListRuleSetsResponse.java) |
| `api.Match` | [ApiMatch](../../module-match2/src/main/java/net/accelbyte/sdk/api/match2/models/ApiMatch.java) |
| `api.MatchFunctionConfig` | [ApiMatchFunctionConfig](../../module-match2/src/main/java/net/accelbyte/sdk/api/match2/models/ApiMatchFunctionConfig.java) |
| `api.MatchFunctionOverride` | [ApiMatchFunctionOverride](../../module-match2/src/main/java/net/accelbyte/sdk/api/match2/models/ApiMatchFunctionOverride.java) |
| `api.MatchFunctionRequest` | [ApiMatchFunctionRequest](../../module-match2/src/main/java/net/accelbyte/sdk/api/match2/models/ApiMatchFunctionRequest.java) |
| `api.MatchPool` | [ApiMatchPool](../../module-match2/src/main/java/net/accelbyte/sdk/api/match2/models/ApiMatchPool.java) |
| `api.MatchPoolConfig` | [ApiMatchPoolConfig](../../module-match2/src/main/java/net/accelbyte/sdk/api/match2/models/ApiMatchPoolConfig.java) |
| `api.MatchRuleSetNameData` | [ApiMatchRuleSetNameData](../../module-match2/src/main/java/net/accelbyte/sdk/api/match2/models/ApiMatchRuleSetNameData.java) |
| `api.MatchTicketRequest` | [ApiMatchTicketRequest](../../module-match2/src/main/java/net/accelbyte/sdk/api/match2/models/ApiMatchTicketRequest.java) |
| `api.MatchTicketResponse` | [ApiMatchTicketResponse](../../module-match2/src/main/java/net/accelbyte/sdk/api/match2/models/ApiMatchTicketResponse.java) |
| `api.MatchTicketStatus` | [ApiMatchTicketStatus](../../module-match2/src/main/java/net/accelbyte/sdk/api/match2/models/ApiMatchTicketStatus.java) |
| `api.MatchTicketStatuses` | [ApiMatchTicketStatuses](../../module-match2/src/main/java/net/accelbyte/sdk/api/match2/models/ApiMatchTicketStatuses.java) |
| `api.NamespaceConfigList` | [ApiNamespaceConfigList](../../module-match2/src/main/java/net/accelbyte/sdk/api/match2/models/ApiNamespaceConfigList.java) |
| `api.Party` | [ApiParty](../../module-match2/src/main/java/net/accelbyte/sdk/api/match2/models/ApiParty.java) |
| `api.PatchNamespaceConfigRequest` | [ApiPatchNamespaceConfigRequest](../../module-match2/src/main/java/net/accelbyte/sdk/api/match2/models/ApiPatchNamespaceConfigRequest.java) |
| `api.PlayerData` | [ApiPlayerData](../../module-match2/src/main/java/net/accelbyte/sdk/api/match2/models/ApiPlayerData.java) |
| `api.PlayerMetricRecord` | [ApiPlayerMetricRecord](../../module-match2/src/main/java/net/accelbyte/sdk/api/match2/models/ApiPlayerMetricRecord.java) |
| `api.ProposedProposal` | [ApiProposedProposal](../../module-match2/src/main/java/net/accelbyte/sdk/api/match2/models/ApiProposedProposal.java) |
| `api.RuleSetPayload` | [ApiRuleSetPayload](../../module-match2/src/main/java/net/accelbyte/sdk/api/match2/models/ApiRuleSetPayload.java) |
| `api.Team` | [ApiTeam](../../module-match2/src/main/java/net/accelbyte/sdk/api/match2/models/ApiTeam.java) |
| `api.Ticket` | [ApiTicket](../../module-match2/src/main/java/net/accelbyte/sdk/api/match2/models/ApiTicket.java) |
| `api.TicketMetricResultRecord` | [ApiTicketMetricResultRecord](../../module-match2/src/main/java/net/accelbyte/sdk/api/match2/models/ApiTicketMetricResultRecord.java) |
| `api.backFillRejectRequest` | [ApiBackFillRejectRequest](../../module-match2/src/main/java/net/accelbyte/sdk/api/match2/models/ApiBackFillRejectRequest.java) |
| `config.EnvironmentVariable` | [ConfigEnvironmentVariable](../../module-match2/src/main/java/net/accelbyte/sdk/api/match2/models/ConfigEnvironmentVariable.java) |
| `configmodels.NamespaceConfig` | [ConfigmodelsNamespaceConfig](../../module-match2/src/main/java/net/accelbyte/sdk/api/match2/models/ConfigmodelsNamespaceConfig.java) |
| `logconfig.Configuration` | [LogconfigConfiguration](../../module-match2/src/main/java/net/accelbyte/sdk/api/match2/models/LogconfigConfiguration.java) |
| `matchmaker.MatchTicketRecord` | [MatchmakerMatchTicketRecord](../../module-match2/src/main/java/net/accelbyte/sdk/api/match2/models/MatchmakerMatchTicketRecord.java) |
| `matchmaker.Party` | [MatchmakerParty](../../module-match2/src/main/java/net/accelbyte/sdk/api/match2/models/MatchmakerParty.java) |
| `matchmaker.ProposedProposal` | [MatchmakerProposedProposal](../../module-match2/src/main/java/net/accelbyte/sdk/api/match2/models/MatchmakerProposedProposal.java) |
| `matchmaker.Team` | [MatchmakerTeam](../../module-match2/src/main/java/net/accelbyte/sdk/api/match2/models/MatchmakerTeam.java) |
| `matchmaker.Ticket` | [MatchmakerTicket](../../module-match2/src/main/java/net/accelbyte/sdk/api/match2/models/MatchmakerTicket.java) |
| `models.Configuration` | [ModelsConfiguration](../../module-match2/src/main/java/net/accelbyte/sdk/api/match2/models/ModelsConfiguration.java) |
| `models.DSInformation` | [ModelsDSInformation](../../module-match2/src/main/java/net/accelbyte/sdk/api/match2/models/ModelsDSInformation.java) |
| `models.GameSession` | [ModelsGameSession](../../module-match2/src/main/java/net/accelbyte/sdk/api/match2/models/ModelsGameSession.java) |
| `models.Pagination` | [ModelsPagination](../../module-match2/src/main/java/net/accelbyte/sdk/api/match2/models/ModelsPagination.java) |
| `models.Server` | [ModelsServer](../../module-match2/src/main/java/net/accelbyte/sdk/api/match2/models/ModelsServer.java) |
| `models.User` | [ModelsUser](../../module-match2/src/main/java/net/accelbyte/sdk/api/match2/models/ModelsUser.java) |
| `player.PlayerData` | [PlayerPlayerData](../../module-match2/src/main/java/net/accelbyte/sdk/api/match2/models/PlayerPlayerData.java) |
| `response.Error` | [ResponseError](../../module-match2/src/main/java/net/accelbyte/sdk/api/match2/models/ResponseError.java) |
