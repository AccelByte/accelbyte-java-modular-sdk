# [v0.21.0]

## BREAKING CHANGE

Following changes in AccelByte Gaming Services OpenAPI specification:

- Operation `net.accelbyte.sdk.api.platform.operations.payment_station.PublicGetQRCode`
    - `parseResponse` return type changed from `BinarySchema` to `InputStream`. The `BinarySchema` model class has been removed.
    - Wrapper method `net.accelbyte.sdk.api.platform.wrappers.PaymentStation.publicGetQRCode` return type changed from `BinarySchema` to `InputStream`.

- Operation `net.accelbyte.sdk.api.platform.operations.wallet.CheckBalance`
    - Method changed: previously `handleEmptyResponse` (void), now `parseResponse` returning `CheckBalanceResponse`.
    - Wrapper method `net.accelbyte.sdk.api.platform.wrappers.Wallet.checkBalance` return type changed from `void` to `CheckBalanceResponse`.

## NEW OPERATIONS

Following changes in AccelByte Gaming Services OpenAPI specification:

- `net.accelbyte.sdk.api.platform.operations.iap.AdminSyncTwitchDropsEntitlement`

[v0.21.0]: https://github.com/AccelByte/accelbyte-java-modular-sdk/compare/module-platform/v0.20.0..module-platform/v0.21.0
