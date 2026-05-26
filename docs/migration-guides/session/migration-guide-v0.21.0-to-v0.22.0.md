# [v0.22.0]

## BREAKING CHANGE

Following changes in AccelByte Gaming Services OpenAPI specification:

- Operation `net.accelbyte.sdk.api.session.operations.game_session.JoinGameSession`
    - Constructor signature changed: added required parameter `body` (ApimodelsJoinSessionRequest). Old: `JoinGameSession(String namespace, String sessionId)`. New: `JoinGameSession(String namespace, String sessionId, ApimodelsJoinSessionRequest body)`.

- Operation `net.accelbyte.sdk.api.session.operations.party.PublicPartyJoin`
    - Constructor signature changed: added required parameter `body` (ApimodelsJoinSessionRequest). Old: `PublicPartyJoin(String namespace, String partyId)`. New: `PublicPartyJoin(String namespace, String partyId, ApimodelsJoinSessionRequest body)`.

## NEW OPERATIONS

Following changes in AccelByte Gaming Services OpenAPI specification:

- `net.accelbyte.sdk.api.session.operations.game_session.PublicGetGameSessionPassword`
- `net.accelbyte.sdk.api.session.operations.game_session.PublicUpdateGameSessionPassword`
- `net.accelbyte.sdk.api.session.operations.party.PublicGetPartyPassword`
- `net.accelbyte.sdk.api.session.operations.party.PublicUpdatePartyPassword`
- `net.accelbyte.sdk.api.session.operations.session_storage.PublicReplaceSessionStorageLeaderV2`
- `net.accelbyte.sdk.api.session.operations.session_storage.PublicReplaceSessionStorageUserV2`
- `net.accelbyte.sdk.api.session.operations.session_storage.PublicUpdateInsertSessionStorageLeaderV2`
- `net.accelbyte.sdk.api.session.operations.session_storage.PublicUpdateInsertSessionStorageUserV2`

[v0.22.0]: https://github.com/AccelByte/accelbyte-java-modular-sdk/compare/module-session/v0.21.0..module-session/v0.22.0
