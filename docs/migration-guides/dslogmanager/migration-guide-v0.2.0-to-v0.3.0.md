<a name="v0.65.0"></a>
## [v0.65.0] - 2024-08-07

### BREAKING CHANGE


### Dslogmanager
The following models have been updated:
- Model `net.accelbyte.sdk.api.dslogmanager.models.ModelsNotifPayloadServerStatusChange` renamed to `net.accelbyte.sdk.api.dslogmanager.models.ModelsNotifPayloadServerStatusChangeResponse `
  - field `server` type changed from `ModelsServer` to `ModelsServerResponse`.
- Model `net.accelbyte.sdk.api.dslogmanager.models.ModelsListTerminatedServersResponse`
  - field `data` type changed from `List<ModelsNotifPayloadServerStatusChange>` to `List<ModelsNotifPayloadServerStatusChangeResponse>` enum.
