<a name="v0.67.0"></a>
## [v0.67.0] - 2024-10-10

### BREAKING CHANGE

### Match2
The following have been updated:
- Model `net.accelbyte.sdk.api.match2.models.ApiPatchNamespaceConfigRequest`
    - required user permission is changed from `ADMIN:NAMESPACE:{namespace}:MATCHMAKING:CONFIG [READ]` to `ADMIN:NAMESPACE:{namespace}:MATCHMAKING:CONFIG [UPDATE]`
- Model `net.accelbyte.sdk.api.match2.models.MatchmakerTicket`
    - field `ExcludedSessions` is now required
    - field `MatchedAt` is now required
