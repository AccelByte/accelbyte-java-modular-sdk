<a name="v0.65.0"></a>
## [v0.65.0] - 2024-08-07

### BREAKING CHANGE

### General
- 64 bit numeric fields specified as `int64` integer in the OpenAPI specification was incorrectly treated as `Integer`, which now corrected back to `Long`
  - mostly used to store time / duration values, counters and ids etc

### IAM
The following models have been updated:
- Model `net.accelbyte.sdk.api.iam.models.AccountcommonDistinctLinkedPlatformV3` have existing fields now marked as `NON_NULL`:
    - `details`
