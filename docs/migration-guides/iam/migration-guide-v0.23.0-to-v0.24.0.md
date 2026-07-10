### BREAKING CHANGE

### IAM

- Operation `net.accelbyte.sdk.api.iam.operations.o_auth.PlatformTokenRequestHandler` is renamed to `NamespaceScopedPlatformTokenGrant`
- Wrapper method `net.accelbyte.sdk.api.iam.wrappers.OAuth.platformTokenRequestHandler(...)` is renamed to `namespaceScopedPlatformTokenGrant(...)`
- Model `net.accelbyte.sdk.api.iam.models.ModelLinkRequest` is renamed to `ModelReAuthRequest`
    - Wrapper method `net.accelbyte.sdk.api.iam.wrappers.Users.publicGetAsyncStatus` return type changed from `ModelLinkRequest` to `ModelReAuthRequest`
    - Wrapper method `net.accelbyte.sdk.api.iam.wrappers.Users.publicProcessWebLinkPlatformV3` return type changed from `ModelLinkRequest` to `ModelReAuthRequest`
