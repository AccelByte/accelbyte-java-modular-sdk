<a name="v0.64.0"></a>
## [v0.64.0] - 2024-06-20

### BREAKING CHANGE


### Platform
The following operations have been updated:
- Operations `net.accelbyte.sdk.api.platform.operations.item.QueryItemsV1` is now renamed into `net.accelbyte.sdk.api.platform.operations.item.QueryItemsV2`
  - field `itemType` type is changed from `String` to `List<String>`
- Operations `net.accelbyte.sdk.api.platform.operations.payment_config.GetPaymentMerchantConfig` field `id` has been replaced by `namespace`
