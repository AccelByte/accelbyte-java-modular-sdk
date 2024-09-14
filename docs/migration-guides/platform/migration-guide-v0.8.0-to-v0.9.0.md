<a name="v0.66.0"></a>
## [v0.66.0] - 2024-09-09

### BREAKING CHANGE

### Platform
- Operation `net.accelbyte.sdk.api.platform.operations.achievement_platform.UnlockSteamUserAchievement`
  - request body is now required
- Operation `net.accelbyte.sdk.api.platform.operations.achievement_platform.UpdateXblUserAchievement`
  - request body is now required
- Operation `net.accelbyte.sdk.api.platform.operations.campaign.ApplyUserRedemption`
  - request body is now required
- Operation `net.accelbyte.sdk.api.platform.operations.campaign.CreateCampaign`
  - request body is now required
- Operation `net.accelbyte.sdk.api.platform.operations.campaign.CreateCodes`
  - request body is now required
- Operation `net.accelbyte.sdk.api.platform.operations.campaignUpdateCampaign`
  - request body is now required
- Operation `net.accelbyte.sdk.api.platform.operations.category.CreateCategory`
  - request body is now required
- Operation `net.accelbyte.sdk.api.platform.operations.category.UpdateCategory`
  - request body is now required
- Operation `net.accelbyte.sdk.api.platform.operations.category.CreateCurrency`
  - request body is now required
- Operation `net.accelbyte.sdk.api.platform.operations.category.UpdateCurrency`
  - request body is now required
- Operation `net.accelbyte.sdk.api.platform.operations.dlc.SyncSteamDLC`
  - request body is now required
- Operation `net.accelbyte.sdk.api.platform.operations.dlc.UpdateDLCItemConfig`
  - request body is now required
- Operation `net.accelbyte.sdk.api.platform.operations.dlc.UpdatePlatformDLCConfig`
  - request body is now required
- Operation `net.accelbyte.sdk.api.platform.operations.entitlement.ConsumeUserEntitlement`
  - request body is now required
- Operation `net.accelbyte.sdk.api.platform.operations.entitlement.GrantEntitlements`
  - request body is now required
- Operation `net.accelbyte.sdk.api.platform.operations.entitlement.GrantUserEntitlement`
  - request body is now required
- Operation `net.accelbyte.sdk.api.platform.operations.entitlement.PublicConsumeUserEntitlement`
  - request body is now required
- Operation `net.accelbyte.sdk.api.platform.operations.entitlement.ublicSellUserEntitlement`
  - request body is now required
- Operation `net.accelbyte.sdk.api.platform.operations.entitlement.PublicSplitUserEntitlement`
  - request body is now required
- Operation `net.accelbyte.sdk.api.platform.operations.entitlement.PublicTransferUserEntitlement`
  - request body is now required
- Operation `net.accelbyte.sdk.api.platform.operations.entitlement.RevokeUseCount`
  - request body is now required
- Operation `net.accelbyte.sdk.api.platform.operations.entitlement.RevokeUserEntitlement`
  - request body is now required
- Operation `net.accelbyte.sdk.api.platform.operations.entitlement.RevokeUserEntitlementByUseCount`
  - request body is now required
- Operation `net.accelbyte.sdk.api.platform.operations.entitlement.SellUserEntitlement`
  - request body is now required
- Operation `net.accelbyte.sdk.api.platform.operations.entitlement.UpdatePlatformEntitlementConfig`
  - request body is now required
- Operation `net.accelbyte.sdk.api.platform.operations.entitlement.UpdateUserEntitlement`
  - request body is now required
- Operation `net.accelbyte.sdk.api.platform.operations.fulfillment.FulfillItem`
  - request body is now required
- Operation `net.accelbyte.sdk.api.platform.operations.fulfillment.FulfillItems`
  - request body is now required
- Operation `net.accelbyte.sdk.api.platform.operations.fulfillment.FulfillRewards`
  - request body is now required
- Operation `net.accelbyte.sdk.api.platform.operations.fulfillment.FulfillRewardsV2`
  - request body is now required
- Operation `net.accelbyte.sdk.api.platform.operations.fulfillment.PreCheckFulfillItem`
  - request body is now required
- Operation `net.accelbyte.sdk.api.platform.operations.fulfillment.PublicRedeemCode`
  - request body is now required
- Operation `net.accelbyte.sdk.api.platform.operations.fulfillment.RedeemCode`
  - request body is now required
- Operation `net.accelbyte.sdk.api.platform.operations.iap.MockFulfillIAPItem`
  - request body is now required
- Operation `net.accelbyte.sdk.api.platform.operations.iap.PublicFulfillAppleIAPItem`
  - request body is now required
- Operation `net.accelbyte.sdk.api.platform.operations.iap.PublicFulfillGoogleIAPItem`
  - request body is now required
- Operation `net.accelbyte.sdk.api.platform.operations.iap.PublicReconcilePlayStationStoreWithMultipleServiceLabels`
  - request body is now required
- Operation `net.accelbyte.sdk.api.platform.operations.iap.SyncSteamInventory`
  - request body is now required
- Operation `net.accelbyte.sdk.api.platform.operations.iap.SyncTwitchDropsEntitlement`
  - request body is now required
- Operation `net.accelbyte.sdk.api.platform.operations.iap.SyncTwitchDropsEntitlement1`
  - request body is now required
- Operation `net.accelbyte.sdk.api.platform.operations.iap.UpdateAppleIAPConfig`
  - request body is now required
- Operation `net.accelbyte.sdk.api.platform.operations.iap.UpdateEpicGamesIAPConfig`
  - request body is now required
- Operation `net.accelbyte.sdk.api.platform.operations.iap.UpdateGoogleIAPConfig`
  - request body is now required
- Operation `net.accelbyte.sdk.api.platform.operations.iap.UpdateIAPItemConfig`
  - request body is now required
- Operation `net.accelbyte.sdk.api.platform.operations.iap.UpdateOculusIAPConfig`
  - request body is now required
- Operation `net.accelbyte.sdk.api.platform.operations.iap.UpdatePlaystationIAPConfig`
  - request body is now required
- Operation `net.accelbyte.sdk.api.platform.operations.iap.UpdateSteamIAPConfig`
  - request body is now required
- Operation `net.accelbyte.sdk.api.platform.operations.iap.UpdateTwitchIAPConfig`
  - request body is now required
- Operation `net.accelbyte.sdk.api.platform.operations.iap.UpdateXblIAPConfig`
  - request body is now required
- Operation `net.accelbyte.sdk.api.platform.operations.iap.ValidatePlaystationIAPConfig`
  - request body is now required
- Operation `net.accelbyte.sdk.cli.api.platform.invoice.DownloadInvoiceDetails`
  - request field feature is now required
  - request field itemId is now required
  - request field itemType is now required
- Operation `net.accelbyte.sdk.cli.api.platform.invoice.GenerateInvoiceSummary`
  - request field feature is now required
  - request field itemId is now required
  - request field itemType is now required
- Operation `net.accelbyte.sdk.api.platform.operations.item.AcquireItem`
  - request body is now required
- Operation `net.accelbyte.sdk.api.platform.operations.item.CreateItem`
  - request body is now required
- Operation `net.accelbyte.sdk.api.platform.operations.item.CreateItemTypeConfig`
  - request body is now required
- Operation `net.accelbyte.sdk.api.platform.operations.item.PublicValidateItemPurchaseCondition`
  - request body is now required
- Operation `net.accelbyte.sdk.api.platform.operations.item.ReturnItem`
  - request body is now required
- Operation `net.accelbyte.sdk.api.platform.operations.item.SyncInGameItem`
  - request body is now required
- Operation `net.accelbyte.sdk.api.platform.operations.item.UpdateApp`
  - request body is now required
- Operation `net.accelbyte.sdk.api.platform.operations.item.UpdateItem`
  - request body is now required
- Operation `net.accelbyte.sdk.api.platform.operations.item.UpdateItemPurchaseCondition`
  - request body is now required
- Operation `net.accelbyte.sdk.api.platform.operations.item.UpdateItemTypeConfig`
  - request body is now required
- Operation `net.accelbyte.sdk.api.platform.operations.item.ValidateItemPurchaseCondition`
  - request body is now required
- Operation `net.accelbyte.sdk.api.platform.operations.key_group.CreateKeyGroup`
  - request body is now required
- Operation `net.accelbyte.sdk.api.platform.operations.key_group.UpdateKeyGroup`
  - request body is now required
- Operatoin `net.accelbyte.sdk.api.platform.operations.order.AdminCreateUserOrder`
  - request body is now required
- Operatoin `net.accelbyte.sdk.api.platform.operations.order.ProcessUserOrderNotification`
  - request body is now required
- Operatoin `net.accelbyte.sdk.api.platform.operations.order.PublicCreateUserOrder`
  - request body is now required
- Operatoin `net.accelbyte.sdk.api.platform.operations.order.PublicPreviewOrderPrice`
  - request body is now required
- Operatoin `net.accelbyte.sdk.api.platform.operations.order.RefundOrder`
  - request body is now required
- Operatoin `net.accelbyte.sdk.api.platform.operations.order.UpdateUserOrderStatus`
  - request body is now required
- Operation `net.accelbyte.sdk.api.platform.operations.payment.ChargePaymentOrder`
  - request body is now required
- Operation `net.accelbyte.sdk.api.platform.operations.payment.CreateUserPaymentOrder`
  - request body is now required
- Operation `net.accelbyte.sdk.api.platform.operations.payment.RefundUserPaymentOrder`
  - request body is now required
- Operation `net.accelbyte.sdk.api.platform.operations.payment.SimulatePaymentOrderNotification`
  - request body is now required
- Operation `net.accelbyte.sdk.api.platform.operations.payment_callback_config.UpdatePaymentCallbackConfig`
  - request body is now required
- Operation `net.accelbyte.sdk.api.platform.operations.payment_callback_config.CreatePaymentProviderConfig`
  - request body is now required
- Operation `net.accelbyte.sdk.api.platform.operations.payment_callback_config.TestAdyenConfig`
  - request body is now required
- Operation `net.accelbyte.sdk.api.platform.operations.payment_callback_config.TestAliPayConfig`
  - request body is now required
- Operation `net.accelbyte.sdk.api.platform.operations.payment_callback_config.TestCheckoutConfig`
  - request body is now required
- Operation `net.accelbyte.sdk.api.platform.operations.payment_callback_config.TestNeonPayConfig`
  - request body is now required
- Operation `net.accelbyte.sdk.api.platform.operations.payment_callback_config.TestPayPalConfig`
  - request body is now required
- Operation `net.accelbyte.sdk.api.platform.operations.payment_callback_config.TestStripeConfig`
  - request body is now required
- Operation `net.accelbyte.sdk.api.platform.operations.payment_callback_config.TestWxPayConfig`
  - request body is now required
- Operation `net.accelbyte.sdk.api.platform.operations.payment_callback_config.TestXsollaConfig`
  - request body is now required
- Operation `net.accelbyte.sdk.api.platform.operations.payment_callback_config.UpdateAdyenConfig`
  - request body is now required
- Operation `net.accelbyte.sdk.api.platform.operations.payment_callback_config.UpdateAliPayConfig`
  - request body is now required
- Operation `net.accelbyte.sdk.api.platform.operations.payment_callback_config.UpdateCheckoutConfig`
  - request body is now required
- Operation `net.accelbyte.sdk.api.platform.operations.payment_callback_config.UpdateNeonPayConfig`
  - request body is now required
- Operation `net.accelbyte.sdk.api.platform.operations.payment_callback_config.UpdatePayPalConfig`
  - request body is now required
- Operation `net.accelbyte.sdk.api.platform.operations.payment_callback_config.UpdatePaymentDomainWhitelistConfig`
  - request body is now required
- Operation `net.accelbyte.sdk.api.platform.operations.payment_callback_config.UpdatePaymentProviderConfig`
  - request body is now required
- Operation `net.accelbyte.sdk.api.platform.operations.payment_callback_config.UpdatePaymentTaxConfig`
  - request body is now required
- Operation `net.accelbyte.sdk.api.platform.operations.payment_callback_config.UpdateStripeConfig`
  - request body is now required
- Operation `net.accelbyte.sdk.api.platform.operations.payment_callback_config.UpdateWxPayConfig`
  - request body is now required
- Operation `net.accelbyte.sdk.api.platform.operations.payment_callback_config.UpdateXsollaConfig`
  - request body is now required
- Operation `net.accelbyte.sdk.api.platform.operations.payment_callback_config.UpdateXsollaUIConfig`
  - request body is now required
- Operation `net.accelbyte.sdk.api.platform.operations.payment_dedicated.CreatePaymentOrderByDedicated`
  - request body is now required
- Operation `net.accelbyte.sdk.api.platform.operations.payment_dedicated.CRefundPaymentOrderByDedicated`
  - request body is now required
- Operation `net.accelbyte.sdk.api.platform.operations.payment_station.Pay`
  - request body is now required
- Operation `net.accelbyte.sdk.api.platform.operations.payment_station.PublicGetPaymentUrl`
  - request body is now required
- Operation `net.accelbyte.sdk.api.platform.operations.platform.GetPsnEntitlementOwnership`
  - request body is now required
- Operation `net.accelbyte.sdk.api.platform.operations.platform.GetXboxEntitlementOwnership`
  - request body is now required
- Operation `net.accelbyte.sdk.api.platform.operations.revocation.DoRevocation`
  - request body is now required
- Operation `net.accelbyte.sdk.api.platform.operations.revocation.UpdateRevocationConfig`
  - request body is now required
- Operation `net.accelbyte.sdk.api.platform.operations.reward.CreateReward`
  - request body is now required
- Operation `net.accelbyte.sdk.api.platform.operations.reward.DeleteRewardConditionRecord`
  - request body is now required
- Operation `net.accelbyte.sdk.api.platform.operations.reward.UpdateReward`
  - request body is now required
- Operation `net.accelbyte.sdk.api.platform.operations.section.CreateSection`
  - request body is now required
- Operation `net.accelbyte.sdk.api.platform.operations.section.UpdateSection`
  - request body is now required
- Operation `net.accelbyte.sdk.api.platform.operations.service_plugin_config.UpdateLootBoxPluginConfig`
  - request body is now required
- Operation `net.accelbyte.sdk.api.platform.operations.service_plugin_config.UpdateRevocationPluginConfig`
  - request body is now required
- Operation `net.accelbyte.sdk.api.platform.operations.service_plugin_config.UpdateSectionPluginConfig`
  - request body is now required
- Operation `net.accelbyte.sdk.api.platform.operations.service_plugin_config.UpdateServicePluginConfig`
  - request body is now required
- Operation `net.accelbyte.sdk.api.platform.operations.session_platform.RegisterXblSessions`
  - request body is now required
- Operation `net.accelbyte.sdk.api.platform.operations.store.CreateStore`
  - request body is now required
- Operation `net.accelbyte.sdk.api.platform.operations.store.ExportStoreByCSV`
  - request body is now required
- Operation `net.accelbyte.sdk.api.platform.operations.store.ImportStoreByCSV`
  - request field category is now required
  - request field display is now required
  - request field notes is now required
  - request field section is now required
- Operation `net.accelbyte.sdk.api.platform.operations.store.UpdateCatalogConfig`
  - request body is now required
- Operation `net.accelbyte.sdk.api.platform.operations.store.Store/UpdateStore`
  - request body is now required
- Operation `net.accelbyte.sdk.api.platform.operations.subscription.CancelSubscription`
  - request body is now required
- Operation `net.accelbyte.sdk.api.platform.operations.subscription.GrantDaysToSubscription`
  - request body is now required
- Operation `net.accelbyte.sdk.api.platform.operations.subscription.PlatformSubscribeSubscription`
  - request body is now required
- Operation `net.accelbyte.sdk.api.platform.operations.subscription.ProcessUserSubscriptionNotification`
  - request body is now required
- Operation `net.accelbyte.sdk.api.platform.operations.subscription.PublicCancelSubscription`
  - request body is now required
- Operation `net.accelbyte.sdk.api.platform.operations.subscription.PublicSubscribeSubscription`
  - request body is now required
- Operation `net.accelbyte.sdk.api.platform.operations.ticket.AcquireUserTicket`
  - request body is now required
- Operation `net.accelbyte.sdk.api.platform.operations.ticket.DecreaseTicketSale`
  - request body is now required
- Operation `net.accelbyte.sdk.api.platform.operations.ticket.IncreaseTicketSale`
  - request body is now required
- Operation `net.accelbyte.sdk.api.platform.operations.trade_action.Commit`
  - request body is now required
- Operation `net.accelbyte.sdk.api.platform.operations.view.CreateView`
  - request body is now required
- Operation `net.accelbyte.sdk.api.platform.operations.view.UpdateView`
  - request body is now required
- Operation `net.accelbyte.sdk.api.platform.operations.wallet.BulkCredit`
  - request body is now required
- Operation `net.accelbyte.sdk.api.platform.operations.wallet.BulkDebit`
  - request body is now required
- Operation `net.accelbyte.sdk.api.platform.operations.wallet.CreditUserWallet`
  - request body is now required
- Operation `net.accelbyte.sdk.api.platform.operations.wallet.DebitUserWallet`
  - request body is now required
- Operation `net.accelbyte.sdk.api.platform.operations.wallet.DebitUserWalletByCurrencyCode`
  - request body is now required
- Operation `net.accelbyte.sdk.api.platform.operations.wallet.PayWithUserWallet`
  - request body is now required
- Operation `net.accelbyte.sdk.api.platform.operations.wallet.UpdatePlatformWalletConfig`
  - request body is now required
    No newline at end of file