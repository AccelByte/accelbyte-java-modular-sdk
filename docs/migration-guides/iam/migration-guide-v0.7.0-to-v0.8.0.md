<a name="v0.64.0"></a>
## [v0.64.0] - 2024-06-20

### BREAKING CHANGE


### IAM
The following models have been updated:
- Model `net.accelbyte.sdk.api.iam.models.Validation` has a new required field `profanityFilter`

The following operations have been updated:
- Operation `net.accelbyte.sdk.api.iam.operations.o_auth2_0_extension.GenerateTokenByNewHeadlessAccountV3` now requires authentication method `Basic` instead of `Bearer`
- Operation `net.accelbyte.sdk.api.iam.operations.o_auth2_0_extension.RequestTargetTokenResponseV3` now requires authentication method `Basic` instead of `Bearer`
- Operation `net.accelbyte.sdk.api.iam.operations.o_auth2_0_v4.PlatformTokenGrantV4` now requires authentication method `Basic` instead of `Bearer`
- Operation `net.accelbyte.sdk.api.iam.operations.o_auth2_0_v4.TokenGrantV4` now requires authentication method `Basic` instead of `Bearer`

- Operation `net.accelbyte.sdk.cli.api.iam.users_v4.AdminDisableMyAuthenticatorV4` now requires `body` payload
- Operation `net.accelbyte.sdk.api.iam.operations.users_v4.AdminDisableMyBackupCodesV4` now requires `body` payload
- Operation `net.accelbyte.sdk.api.iam.operations.users_v4.AdminDisableMyEmailV4` now requires `body` payload
- Operation `net.accelbyte.sdk.api.iam.operations.users_v4.PublicDisableMyAuthenticatorV4` now requires `body` payload.
- Operation `net.accelbyte.sdk.api.iam.operations.users_v4.PublicDisableMyBackupCodesV4` now requires `body` payload.
- Operation `net.accelbyte.sdk.api.iam.operations.users_v4.PublicDisableMyEmailV4` now requires `body` payload
