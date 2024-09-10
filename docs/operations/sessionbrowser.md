[//]: # (Code generated. DO NOT EDIT.)

# Sessionbrowser Service Index

&nbsp;

## Operations

### Session Wrapper:  [Session](../../module-sessionbrowser/src/main/java/net/accelbyte/sdk/api/sessionbrowser/wrappers/Session.java)
| Endpoint | Method | ID | Class | Example |
|---|---|---|---|---|
| `/sessionbrowser/admin/namespaces/{namespace}/gamesession` | GET | AdminQuerySession | [AdminQuerySession](../../module-sessionbrowser/src/main/java/net/accelbyte/sdk/api/sessionbrowser/operations/session/AdminQuerySession.java) | [AdminQuerySession](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/sessionbrowser/session/AdminQuerySession.java) |
| `/sessionbrowser/admin/namespaces/{namespace}/gamesession/active/count` | GET | GetTotalActiveSession | [GetTotalActiveSession](../../module-sessionbrowser/src/main/java/net/accelbyte/sdk/api/sessionbrowser/operations/session/GetTotalActiveSession.java) | [GetTotalActiveSession](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/sessionbrowser/session/GetTotalActiveSession.java) |
| `/sessionbrowser/admin/namespaces/{namespace}/gamesession/active/custom-game` | GET | GetActiveCustomGameSessions | [GetActiveCustomGameSessions](../../module-sessionbrowser/src/main/java/net/accelbyte/sdk/api/sessionbrowser/operations/session/GetActiveCustomGameSessions.java) | [GetActiveCustomGameSessions](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/sessionbrowser/session/GetActiveCustomGameSessions.java) |
| `/sessionbrowser/admin/namespaces/{namespace}/gamesession/active/matchmaking-game` | GET | GetActiveMatchmakingGameSessions | [GetActiveMatchmakingGameSessions](../../module-sessionbrowser/src/main/java/net/accelbyte/sdk/api/sessionbrowser/operations/session/GetActiveMatchmakingGameSessions.java) | [GetActiveMatchmakingGameSessions](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/sessionbrowser/session/GetActiveMatchmakingGameSessions.java) |
| `/sessionbrowser/admin/namespaces/{namespace}/gamesession/{sessionID}` | GET | AdminGetSession | [AdminGetSession](../../module-sessionbrowser/src/main/java/net/accelbyte/sdk/api/sessionbrowser/operations/session/AdminGetSession.java) | [AdminGetSession](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/sessionbrowser/session/AdminGetSession.java) |
| `/sessionbrowser/admin/namespaces/{namespace}/gamesession/{sessionID}` | DELETE | AdminDeleteSession | [AdminDeleteSession](../../module-sessionbrowser/src/main/java/net/accelbyte/sdk/api/sessionbrowser/operations/session/AdminDeleteSession.java) | [AdminDeleteSession](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/sessionbrowser/session/AdminDeleteSession.java) |
| `/sessionbrowser/admin/namespaces/{namespace}/sessions/history/search` | GET | AdminSearchSessionsV2 | [AdminSearchSessionsV2](../../module-sessionbrowser/src/main/java/net/accelbyte/sdk/api/sessionbrowser/operations/session/AdminSearchSessionsV2.java) | [AdminSearchSessionsV2](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/sessionbrowser/session/AdminSearchSessionsV2.java) |
| `/sessionbrowser/admin/namespaces/{namespace}/sessions/{matchID}/history/detailed` | GET | GetSessionHistoryDetailed | [GetSessionHistoryDetailed](../../module-sessionbrowser/src/main/java/net/accelbyte/sdk/api/sessionbrowser/operations/session/GetSessionHistoryDetailed.java) | [GetSessionHistoryDetailed](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/sessionbrowser/session/GetSessionHistoryDetailed.java) |
| `/sessionbrowser/namespaces/{namespace}/gamesession` | GET | UserQuerySession | [UserQuerySession](../../module-sessionbrowser/src/main/java/net/accelbyte/sdk/api/sessionbrowser/operations/session/UserQuerySession.java) | [UserQuerySession](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/sessionbrowser/session/UserQuerySession.java) |
| `/sessionbrowser/namespaces/{namespace}/gamesession` | POST | CreateSession | [CreateSession](../../module-sessionbrowser/src/main/java/net/accelbyte/sdk/api/sessionbrowser/operations/session/CreateSession.java) | [CreateSession](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/sessionbrowser/session/CreateSession.java) |
| `/sessionbrowser/namespaces/{namespace}/gamesession/bulk` | GET | GetSessionByUserIDs | [GetSessionByUserIDs](../../module-sessionbrowser/src/main/java/net/accelbyte/sdk/api/sessionbrowser/operations/session/GetSessionByUserIDs.java) | [GetSessionByUserIDs](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/sessionbrowser/session/GetSessionByUserIDs.java) |
| `/sessionbrowser/namespaces/{namespace}/gamesession/{sessionID}` | GET | GetSession | [GetSession](../../module-sessionbrowser/src/main/java/net/accelbyte/sdk/api/sessionbrowser/operations/session/GetSession.java) | [GetSession](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/sessionbrowser/session/GetSession.java) |
| `/sessionbrowser/namespaces/{namespace}/gamesession/{sessionID}` | PUT | UpdateSession | [UpdateSession](../../module-sessionbrowser/src/main/java/net/accelbyte/sdk/api/sessionbrowser/operations/session/UpdateSession.java) | [UpdateSession](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/sessionbrowser/session/UpdateSession.java) |
| `/sessionbrowser/namespaces/{namespace}/gamesession/{sessionID}` | DELETE | DeleteSession | [DeleteSession](../../module-sessionbrowser/src/main/java/net/accelbyte/sdk/api/sessionbrowser/operations/session/DeleteSession.java) | [DeleteSession](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/sessionbrowser/session/DeleteSession.java) |
| `/sessionbrowser/namespaces/{namespace}/gamesession/{sessionID}/join` | POST | JoinSession | [JoinSession](../../module-sessionbrowser/src/main/java/net/accelbyte/sdk/api/sessionbrowser/operations/session/JoinSession.java) | [JoinSession](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/sessionbrowser/session/JoinSession.java) |
| `/sessionbrowser/namespaces/{namespace}/gamesession/{sessionID}/localds` | DELETE | DeleteSessionLocalDS | [DeleteSessionLocalDS](../../module-sessionbrowser/src/main/java/net/accelbyte/sdk/api/sessionbrowser/operations/session/DeleteSessionLocalDS.java) | [DeleteSessionLocalDS](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/sessionbrowser/session/DeleteSessionLocalDS.java) |
| `/sessionbrowser/namespaces/{namespace}/gamesession/{sessionID}/player` | POST | AddPlayerToSession | [AddPlayerToSession](../../module-sessionbrowser/src/main/java/net/accelbyte/sdk/api/sessionbrowser/operations/session/AddPlayerToSession.java) | [AddPlayerToSession](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/sessionbrowser/session/AddPlayerToSession.java) |
| `/sessionbrowser/namespaces/{namespace}/gamesession/{sessionID}/player/{userID}` | DELETE | RemovePlayerFromSession | [RemovePlayerFromSession](../../module-sessionbrowser/src/main/java/net/accelbyte/sdk/api/sessionbrowser/operations/session/RemovePlayerFromSession.java) | [RemovePlayerFromSession](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/sessionbrowser/session/RemovePlayerFromSession.java) |
| `/sessionbrowser/namespaces/{namespace}/gamesession/{sessionID}/settings` | PUT | UpdateSettings | [UpdateSettings](../../module-sessionbrowser/src/main/java/net/accelbyte/sdk/api/sessionbrowser/operations/session/UpdateSettings.java) | [UpdateSettings](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/sessionbrowser/session/UpdateSettings.java) |
| `/sessionbrowser/namespaces/{namespace}/recentplayer/{userID}` | GET | GetRecentPlayer | [GetRecentPlayer](../../module-sessionbrowser/src/main/java/net/accelbyte/sdk/api/sessionbrowser/operations/session/GetRecentPlayer.java) | [GetRecentPlayer](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/sessionbrowser/session/GetRecentPlayer.java) |


&nbsp;

## Models

| Model | Class |
|---|---|
| `models.ActiveCustomGameResponse` | [ModelsActiveCustomGameResponse](../../module-sessionbrowser/src/main/java/net/accelbyte/sdk/api/sessionbrowser/models/ModelsActiveCustomGameResponse.java) |
| `models.ActiveMatchmakingGameResponse` | [ModelsActiveMatchmakingGameResponse](../../module-sessionbrowser/src/main/java/net/accelbyte/sdk/api/sessionbrowser/models/ModelsActiveMatchmakingGameResponse.java) |
| `models.AddPlayerRequest` | [ModelsAddPlayerRequest](../../module-sessionbrowser/src/main/java/net/accelbyte/sdk/api/sessionbrowser/models/ModelsAddPlayerRequest.java) |
| `models.AddPlayerResponse` | [ModelsAddPlayerResponse](../../module-sessionbrowser/src/main/java/net/accelbyte/sdk/api/sessionbrowser/models/ModelsAddPlayerResponse.java) |
| `models.AdminSessionResponse` | [ModelsAdminSessionResponse](../../module-sessionbrowser/src/main/java/net/accelbyte/sdk/api/sessionbrowser/models/ModelsAdminSessionResponse.java) |
| `models.CountActiveSessionResponse` | [ModelsCountActiveSessionResponse](../../module-sessionbrowser/src/main/java/net/accelbyte/sdk/api/sessionbrowser/models/ModelsCountActiveSessionResponse.java) |
| `models.CreateSessionRequest` | [ModelsCreateSessionRequest](../../module-sessionbrowser/src/main/java/net/accelbyte/sdk/api/sessionbrowser/models/ModelsCreateSessionRequest.java) |
| `models.CustomGameResponse` | [ModelsCustomGameResponse](../../module-sessionbrowser/src/main/java/net/accelbyte/sdk/api/sessionbrowser/models/ModelsCustomGameResponse.java) |
| `models.GameSession` | [ModelsGameSession](../../module-sessionbrowser/src/main/java/net/accelbyte/sdk/api/sessionbrowser/models/ModelsGameSession.java) |
| `models.GameSessionSetting` | [ModelsGameSessionSetting](../../module-sessionbrowser/src/main/java/net/accelbyte/sdk/api/sessionbrowser/models/ModelsGameSessionSetting.java) |
| `models.GetSessionHistoryDetailedResponseItem` | [ModelsGetSessionHistoryDetailedResponseItem](../../module-sessionbrowser/src/main/java/net/accelbyte/sdk/api/sessionbrowser/models/ModelsGetSessionHistoryDetailedResponseItem.java) |
| `models.GetSessionHistorySearchResponseItemV2` | [ModelsGetSessionHistorySearchResponseItemV2](../../module-sessionbrowser/src/main/java/net/accelbyte/sdk/api/sessionbrowser/models/ModelsGetSessionHistorySearchResponseItemV2.java) |
| `models.GetSessionHistorySearchResponseV2` | [ModelsGetSessionHistorySearchResponseV2](../../module-sessionbrowser/src/main/java/net/accelbyte/sdk/api/sessionbrowser/models/ModelsGetSessionHistorySearchResponseV2.java) |
| `models.JoinGameSessionRequest` | [ModelsJoinGameSessionRequest](../../module-sessionbrowser/src/main/java/net/accelbyte/sdk/api/sessionbrowser/models/ModelsJoinGameSessionRequest.java) |
| `models.MatchAttributes` | [ModelsMatchAttributes](../../module-sessionbrowser/src/main/java/net/accelbyte/sdk/api/sessionbrowser/models/ModelsMatchAttributes.java) |
| `models.MatchMaking` | [ModelsMatchMaking](../../module-sessionbrowser/src/main/java/net/accelbyte/sdk/api/sessionbrowser/models/ModelsMatchMaking.java) |
| `models.MatchingAlly` | [ModelsMatchingAlly](../../module-sessionbrowser/src/main/java/net/accelbyte/sdk/api/sessionbrowser/models/ModelsMatchingAlly.java) |
| `models.MatchingParty` | [ModelsMatchingParty](../../module-sessionbrowser/src/main/java/net/accelbyte/sdk/api/sessionbrowser/models/ModelsMatchingParty.java) |
| `models.Pagination` | [ModelsPagination](../../module-sessionbrowser/src/main/java/net/accelbyte/sdk/api/sessionbrowser/models/ModelsPagination.java) |
| `models.PagingCursor` | [ModelsPagingCursor](../../module-sessionbrowser/src/main/java/net/accelbyte/sdk/api/sessionbrowser/models/ModelsPagingCursor.java) |
| `models.PartyMember` | [ModelsPartyMember](../../module-sessionbrowser/src/main/java/net/accelbyte/sdk/api/sessionbrowser/models/ModelsPartyMember.java) |
| `models.RecentPlayerHistory` | [ModelsRecentPlayerHistory](../../module-sessionbrowser/src/main/java/net/accelbyte/sdk/api/sessionbrowser/models/ModelsRecentPlayerHistory.java) |
| `models.RecentPlayerQueryResponse` | [ModelsRecentPlayerQueryResponse](../../module-sessionbrowser/src/main/java/net/accelbyte/sdk/api/sessionbrowser/models/ModelsRecentPlayerQueryResponse.java) |
| `models.Server` | [ModelsServer](../../module-sessionbrowser/src/main/java/net/accelbyte/sdk/api/sessionbrowser/models/ModelsServer.java) |
| `models.SessionByUserIDsResponse` | [ModelsSessionByUserIDsResponse](../../module-sessionbrowser/src/main/java/net/accelbyte/sdk/api/sessionbrowser/models/ModelsSessionByUserIDsResponse.java) |
| `models.SessionPlayerHistory` | [ModelsSessionPlayerHistory](../../module-sessionbrowser/src/main/java/net/accelbyte/sdk/api/sessionbrowser/models/ModelsSessionPlayerHistory.java) |
| `models.SessionPlayerJoining` | [ModelsSessionPlayerJoining](../../module-sessionbrowser/src/main/java/net/accelbyte/sdk/api/sessionbrowser/models/ModelsSessionPlayerJoining.java) |
| `models.SessionQueryResponse` | [ModelsSessionQueryResponse](../../module-sessionbrowser/src/main/java/net/accelbyte/sdk/api/sessionbrowser/models/ModelsSessionQueryResponse.java) |
| `models.SessionResponse` | [ModelsSessionResponse](../../module-sessionbrowser/src/main/java/net/accelbyte/sdk/api/sessionbrowser/models/ModelsSessionResponse.java) |
| `models.StatusHistory` | [ModelsStatusHistory](../../module-sessionbrowser/src/main/java/net/accelbyte/sdk/api/sessionbrowser/models/ModelsStatusHistory.java) |
| `models.UpdateSessionRequest` | [ModelsUpdateSessionRequest](../../module-sessionbrowser/src/main/java/net/accelbyte/sdk/api/sessionbrowser/models/ModelsUpdateSessionRequest.java) |
| `models.UpdateSettingsRequest` | [ModelsUpdateSettingsRequest](../../module-sessionbrowser/src/main/java/net/accelbyte/sdk/api/sessionbrowser/models/ModelsUpdateSettingsRequest.java) |
| `response.Error` | [ResponseError](../../module-sessionbrowser/src/main/java/net/accelbyte/sdk/api/sessionbrowser/models/ResponseError.java) |
| `restapi.ErrorResponseV2` | [RestapiErrorResponseV2](../../module-sessionbrowser/src/main/java/net/accelbyte/sdk/api/sessionbrowser/models/RestapiErrorResponseV2.java) |
| `restapi.ErrorV1` | [RestapiErrorV1](../../module-sessionbrowser/src/main/java/net/accelbyte/sdk/api/sessionbrowser/models/RestapiErrorV1.java) |
