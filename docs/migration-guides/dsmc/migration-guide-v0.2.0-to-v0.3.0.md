<a name="v0.65.0"></a>
## [v0.65.0] - 2024-08-07

### BREAKING CHANGE

### General
- 64 bit numeric fields specified as `int64` integer in the OpenAPI specification was incorrectly treated as `Integer`, which now corrected back to `Long`
  - mostly used to store time / duration values, counters and ids etc

### DSMC
The following models have been updated:
- Model `net.accelbyte.sdk.api.dsmc.models.ModelsGetImageDetailResponse`
  - field `images` type change from `ModelsImageRecord` to `ModelsImageRecordResponse`.
- Model `net.net.accelbyte.sdk.api.dsmc.modelss.ModelsImageRecord` renamed to `net.accelbyte.sdk.api.dsmc.models.ModelsImageRecordResponse`.
- Model `net.accelbyte.sdk.api.dsmc.models.ModelsListImagePatchesResponse`
  - field `images` type change from `List<ModelsPatchImageRecord>` to `List<ModelsPatchImageRecordResponse>`.
- Model `net.accelbyte.sdk.api.dsmc.models.ModelsListImageResponse`
  - field `images` type change from `List<ModelsImageRecord>` to `List<ModelsImageRecordResponse>`.
- Model `net.accelbyte.sdk.api.dsmc.models.ModelsListServerResponse`
  - field `images` type change from `List<ModelsServer>` to `List<ModelsServerDetailsResponse>`.
- Operation `net.accelbyte.sdk.api.dsmc.operations.image_config.ImportImages` is **removed**.
- Operation `net.accelbyte.sdk.api.dsmc.operations.image_config.ExportImages` is **removed**.
- Operation `net.accelbyte.sdk.api.dsmc.operations.admin.GetServer`
  - response type changed from `ModelsServer` to `ModelsServerDetailsResponse`.

