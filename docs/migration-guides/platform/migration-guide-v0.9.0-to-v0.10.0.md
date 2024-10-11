<a name="v0.67.0"></a>
## [v0.67.0] - 2024-10-10

### BREAKING CHANGE

### Platform
The following operation(s) has been updated.
- Operation `net.accelbyte.sdk.api.platform.operations.entitlement.QueryEntitlements`
  - is switched with `net.accelbyte.sdk.api.platform.operations.entitlement.QueryEntitlements1`
- Operation `net.accelbyte.sdk.api.platform.operations.entitlement.QueryFulfillments`
  - response type changed from `FulfillmentHistoryPagingSlicedResult` to `FulfillmentPagingSlicedResult`
- Operation `net.accelbyte.sdk.cli.api.platform.payment_station.PublicGetQRCode`
  - response type IS changed from `InputStream` to `BinarySchema`