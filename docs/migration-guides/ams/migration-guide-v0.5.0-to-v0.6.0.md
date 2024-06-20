<a name="v0.64.0"></a>
## [v0.64.0] - 2024-06-20

### BREAKING CHANGE


### AMS
The following models have been updated:
- Model `net.accelbyte.sdk.api.ams.models.ApiImageDetails` has a new required field `deleteAt`
- Model `net.accelbyte.sdk.api.ams.models.ApiImageListItem` has a new required field `deleteAt`

The following operations have been updated:
- `net.accelbyte.sdk.api.ams.operations.images.ImageGet` required permission changed from `ADMIN:NAMESPACE:{namespace}:ARMADA:ACCOUNT [READ]` to `ADMIN:NAMESPACE:{namespace}:AMS:IMAGE [READ]`
- `net.accelbyte.sdk.api.ams.operations.images.ImageList` required permission changed from `ADMIN:NAMESPACE:{namespace}:ARMADA:ACCOUNT [READ]` to `ADMIN:NAMESPACE:{namespace}:AMS:IMAGE [READ]`
- `net.accelbyte.sdk.api.ams.operations.images.ImagePatch` required permission changed from `ADMIN:NAMESPACE:{namespace}:ARMADA:ACCOUNT [UPDATE]` to `ADMIN:NAMESPACE:{namespace}:AMS:IMAGE [UPDATE]`

