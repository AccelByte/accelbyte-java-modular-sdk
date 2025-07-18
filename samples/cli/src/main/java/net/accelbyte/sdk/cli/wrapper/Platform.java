/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.cli.wrapper;

import net.accelbyte.sdk.cli.api.platform.fulfillment_script.*;
import net.accelbyte.sdk.cli.api.platform.item.*;
import net.accelbyte.sdk.cli.api.platform.campaign.*;
import net.accelbyte.sdk.cli.api.platform.store.*;
import net.accelbyte.sdk.cli.api.platform.service_plugin_config.*;
import net.accelbyte.sdk.cli.api.platform.category.*;
import net.accelbyte.sdk.cli.api.platform.currency.*;
import net.accelbyte.sdk.cli.api.platform.dlc.*;
import net.accelbyte.sdk.cli.api.platform.entitlement.*;
import net.accelbyte.sdk.cli.api.platform.fulfillment.*;
import net.accelbyte.sdk.cli.api.platform.clawback.*;
import net.accelbyte.sdk.cli.api.platform.iap.*;
import net.accelbyte.sdk.cli.api.platform.iap_notification.*;
import net.accelbyte.sdk.cli.api.platform.iap_subscription.*;
import net.accelbyte.sdk.cli.api.platform.invoice.*;
import net.accelbyte.sdk.cli.api.platform.key_group.*;
import net.accelbyte.sdk.cli.api.platform.order.*;
import net.accelbyte.sdk.cli.api.platform.payment_callback_config.*;
import net.accelbyte.sdk.cli.api.platform.payment_config.*;
import net.accelbyte.sdk.cli.api.platform.payment.*;
import net.accelbyte.sdk.cli.api.platform.payment_dedicated.*;
import net.accelbyte.sdk.cli.api.platform.platform.*;
import net.accelbyte.sdk.cli.api.platform.wallet.*;
import net.accelbyte.sdk.cli.api.platform.revocation.*;
import net.accelbyte.sdk.cli.api.platform.reward.*;
import net.accelbyte.sdk.cli.api.platform.section.*;
import net.accelbyte.sdk.cli.api.platform.catalog_changes.*;
import net.accelbyte.sdk.cli.api.platform.subscription.*;
import net.accelbyte.sdk.cli.api.platform.ticket.*;
import net.accelbyte.sdk.cli.api.platform.trade_action.*;
import net.accelbyte.sdk.cli.api.platform.achievement_platform.*;
import net.accelbyte.sdk.cli.api.platform.anonymization.*;
import net.accelbyte.sdk.cli.api.platform.platform_account_closure.*;
import net.accelbyte.sdk.cli.api.platform.session_platform.*;
import net.accelbyte.sdk.cli.api.platform.view.*;
import net.accelbyte.sdk.cli.api.platform.order_dedicated.*;
import net.accelbyte.sdk.cli.api.platform.payment_station.*;
import net.accelbyte.sdk.cli.api.platform.payment_account.*;

import picocli.CommandLine.Command;

@Command(name = "platform",
        mixinStandardHelpOptions = true,
        subcommands = {
                ListFulfillmentScripts.class,
                GetFulfillmentScript.class,
                CreateFulfillmentScript.class,
                DeleteFulfillmentScript.class,
                UpdateFulfillmentScript.class,
                ListItemTypeConfigs.class,
                CreateItemTypeConfig.class,
                SearchItemTypeConfig.class,
                GetItemTypeConfig.class,
                UpdateItemTypeConfig.class,
                DeleteItemTypeConfig.class,
                QueryCampaigns.class,
                CreateCampaign.class,
                GetCampaign.class,
                UpdateCampaign.class,
                RenameBatch.class,
                QueryCampaignBatchNames.class,
                GetCampaignDynamic.class,
                GetCatalogConfig.class,
                UpdateCatalogConfig.class,
                GetLootBoxPluginConfig.class,
                UpdateLootBoxPluginConfig.class,
                DeleteLootBoxPluginConfig.class,
                UplodLootBoxPluginConfigCert.class,
                GetLootBoxGrpcInfo.class,
                GetSectionPluginConfig.class,
                UpdateSectionPluginConfig.class,
                DeleteSectionPluginConfig.class,
                UploadSectionPluginConfigCert.class,
                GetRootCategories.class,
                CreateCategory.class,
                ListCategoriesBasic.class,
                GetCategory.class,
                UpdateCategory.class,
                DeleteCategory.class,
                GetChildCategories.class,
                GetDescendantCategories.class,
                QueryCodes.class,
                CreateCodes.class,
                Download.class,
                BulkDisableCodes.class,
                BulkEnableCodes.class,
                QueryRedeemHistory.class,
                GetCode.class,
                DisableCode.class,
                EnableCode.class,
                GetServicePluginConfig.class,
                UpdateServicePluginConfig.class,
                DeleteServicePluginConfig.class,
                ListCurrencies.class,
                CreateCurrency.class,
                UpdateCurrency.class,
                DeleteCurrency.class,
                GetCurrencyConfig.class,
                GetCurrencySummary.class,
                GetDLCItemConfigHistory.class,
                RestoreDLCItemConfigHistory.class,
                GetDLCItemConfig.class,
                UpdateDLCItemConfig.class,
                DeleteDLCItemConfig.class,
                GetPlatformDLCConfig.class,
                UpdatePlatformDLCConfig.class,
                DeletePlatformDLCConfig.class,
                QueryEntitlements1.class,
                QueryEntitlements.class,
                EnableEntitlementOriginFeature.class,
                GetEntitlementConfigInfo.class,
                GrantEntitlements.class,
                RevokeEntitlements.class,
                GetEntitlement.class,
                QueryFulfillmentHistories.class,
                QueryIAPClawbackHistory.class,
                MockPlayStationStreamEvent.class,
                MockXblClawbackEvent.class,
                GetAppleIAPConfig.class,
                UpdateAppleIAPConfig.class,
                DeleteAppleIAPConfig.class,
                UpdateAppleP8File.class,
                GetEpicGamesIAPConfig.class,
                UpdateEpicGamesIAPConfig.class,
                DeleteEpicGamesIAPConfig.class,
                GetGoogleIAPConfig.class,
                UpdateGoogleIAPConfig.class,
                DeleteGoogleIAPConfig.class,
                UpdateGoogleP12File.class,
                GetIAPItemConfig.class,
                UpdateIAPItemConfig.class,
                DeleteIAPItemConfig.class,
                GetOculusIAPConfig.class,
                UpdateOculusIAPConfig.class,
                DeleteOculusIAPConfig.class,
                GetPlayStationIAPConfig.class,
                UpdatePlaystationIAPConfig.class,
                DeletePlaystationIAPConfig.class,
                ValidateExistedPlaystationIAPConfig.class,
                ValidatePlaystationIAPConfig.class,
                GetSteamIAPConfig.class,
                UpdateSteamIAPConfig.class,
                DeleteSteamIAPConfig.class,
                GetTwitchIAPConfig.class,
                UpdateTwitchIAPConfig.class,
                DeleteTwitchIAPConfig.class,
                GetXblIAPConfig.class,
                UpdateXblIAPConfig.class,
                DeleteXblAPConfig.class,
                UpdateXblBPCertFile.class,
                QueryThirdPartyNotifications.class,
                QueryAbnormalTransactions.class,
                AdminGetSteamJobInfo.class,
                AdminResetSteamJobTime.class,
                AdminRefundIAPOrder.class,
                QuerySteamReportHistories.class,
                QueryThirdPartySubscription.class,
                GetIAPOrderConsumeDetails.class,
                DownloadInvoiceDetails.class,
                GenerateInvoiceSummary.class,
                SyncInGameItem.class,
                CreateItem.class,
                GetItemByAppId.class,
                QueryItems.class,
                ListBasicItemsByFeatures.class,
                GetItems.class,
                GetItemBySku.class,
                GetLocaleItemBySku.class,
                GetEstimatedPrice.class,
                GetItemIdBySku.class,
                GetBulkItemIdBySkus.class,
                BulkGetLocaleItems.class,
                GetAvailablePredicateTypes.class,
                ValidateItemPurchaseCondition.class,
                BulkUpdateRegionData.class,
                SearchItems.class,
                QueryUncategorizedItems.class,
                GetItem.class,
                UpdateItem.class,
                DeleteItem.class,
                AcquireItem.class,
                GetApp.class,
                UpdateApp.class,
                DisableItem.class,
                GetItemDynamicData.class,
                EnableItem.class,
                FeatureItem.class,
                DefeatureItem.class,
                GetLocaleItem.class,
                UpdateItemPurchaseCondition.class,
                QueryItemReferences.class,
                ReturnItem.class,
                QueryKeyGroups.class,
                CreateKeyGroup.class,
                GetKeyGroupByBoothName.class,
                GetKeyGroup.class,
                UpdateKeyGroup.class,
                GetKeyGroupDynamic.class,
                ListKeys.class,
                UploadKeys.class,
                QueryOrders.class,
                GetOrderStatistics.class,
                GetOrder.class,
                RefundOrder.class,
                GetPaymentCallbackConfig.class,
                UpdatePaymentCallbackConfig.class,
                GetPaymentMerchantConfig.class,
                UpdatePaymentDomainWhitelistConfig.class,
                QueryPaymentNotifications.class,
                QueryPaymentOrders.class,
                CreatePaymentOrderByDedicated.class,
                ListExtOrderNoByExtTxId.class,
                GetPaymentOrder.class,
                ChargePaymentOrder.class,
                RefundPaymentOrderByDedicated.class,
                SimulatePaymentOrderNotification.class,
                GetPaymentOrderChargeStatus.class,
                GetPsnEntitlementOwnership.class,
                GetXboxEntitlementOwnership.class,
                GetPlatformEntitlementConfig.class,
                UpdatePlatformEntitlementConfig.class,
                GetPlatformWalletConfig.class,
                UpdatePlatformWalletConfig.class,
                ResetPlatformWalletConfig.class,
                GetRevocationConfig.class,
                UpdateRevocationConfig.class,
                DeleteRevocationConfig.class,
                QueryRevocationHistories.class,
                GetRevocationPluginConfig.class,
                UpdateRevocationPluginConfig.class,
                DeleteRevocationPluginConfig.class,
                UploadRevocationPluginConfigCert.class,
                CreateReward.class,
                QueryRewards.class,
                ExportRewards.class,
                ImportRewards.class,
                GetReward.class,
                UpdateReward.class,
                DeleteReward.class,
                CheckEventCondition.class,
                DeleteRewardConditionRecord.class,
                QuerySections.class,
                CreateSection.class,
                PurgeExpiredSection.class,
                GetSection.class,
                UpdateSection.class,
                DeleteSection.class,
                ListStores.class,
                CreateStore.class,
                GetCatalogDefinition.class,
                DownloadCSVTemplates.class,
                ExportStoreByCSV.class,
                ImportStore.class,
                GetPublishedStore.class,
                DeletePublishedStore.class,
                GetPublishedStoreBackup.class,
                RollbackPublishedStore.class,
                GetStore.class,
                UpdateStore.class,
                DeleteStore.class,
                QueryChanges.class,
                PublishAll.class,
                PublishSelected.class,
                SelectAllRecords.class,
                SelectAllRecordsByCriteria.class,
                GetStatistic.class,
                UnselectAllRecords.class,
                SelectRecord.class,
                UnselectRecord.class,
                CloneStore.class,
                ExportStore.class,
                QueryImportHistory.class,
                ImportStoreByCSV.class,
                QuerySubscriptions.class,
                RecurringChargeSubscription.class,
                GetTicketDynamic.class,
                DecreaseTicketSale.class,
                GetTicketBoothID.class,
                IncreaseTicketSale.class,
                Commit.class,
                GetTradeHistoryByCriteria.class,
                GetTradeHistoryByTransactionId.class,
                UnlockSteamUserAchievement.class,
                GetXblUserAchievements.class,
                UpdateXblUserAchievement.class,
                AnonymizeCampaign.class,
                AnonymizeEntitlement.class,
                AnonymizeFulfillment.class,
                AnonymizeIntegration.class,
                AnonymizeOrder.class,
                AnonymizePayment.class,
                AnonymizeRevocation.class,
                AnonymizeSubscription.class,
                AnonymizeWallet.class,
                GetUserDLCByPlatform.class,
                GetUserDLC.class,
                QueryUserEntitlements.class,
                GrantUserEntitlement.class,
                GetUserAppEntitlementByAppId.class,
                QueryUserEntitlementsByAppType.class,
                GetUserEntitlementsByIds.class,
                GetUserEntitlementByItemId.class,
                GetUserActiveEntitlementsByItemIds.class,
                GetUserEntitlementBySku.class,
                ExistsAnyUserActiveEntitlement.class,
                ExistsAnyUserActiveEntitlementByItemIds.class,
                GetUserAppEntitlementOwnershipByAppId.class,
                GetUserEntitlementOwnershipByItemId.class,
                GetUserEntitlementOwnershipByItemIds.class,
                GetUserEntitlementOwnershipBySku.class,
                RevokeAllEntitlements.class,
                RevokeUserEntitlements.class,
                GetUserEntitlement.class,
                UpdateUserEntitlement.class,
                ConsumeUserEntitlement.class,
                DisableUserEntitlement.class,
                EnableUserEntitlement.class,
                GetUserEntitlementHistories.class,
                RevokeUserEntitlement.class,
                RevokeUserEntitlementByUseCount.class,
                PreCheckRevokeUserEntitlementByUseCount.class,
                RevokeUseCount.class,
                SellUserEntitlement.class,
                FulfillItem.class,
                RedeemCode.class,
                PreCheckFulfillItem.class,
                FulfillRewards.class,
                QueryUserIAPOrders.class,
                QueryAllUserIAPOrders.class,
                QueryUserIAPConsumeHistory.class,
                MockFulfillIAPItem.class,
                AdminGetIAPOrderLineItems.class,
                AdminSyncSteamAbnormalTransaction.class,
                AdminSyncSteamIAPByTransaction.class,
                QueryUserThirdPartySubscription.class,
                GetThirdPartyPlatformSubscriptionOwnershipByGroupId.class,
                GetThirdPartyPlatformSubscriptionOwnershipByProductId.class,
                QueryUserThirdPartySubscriptionTransactions.class,
                GetThirdPartySubscriptionDetails.class,
                GetSubscriptionHistory.class,
                SyncSubscriptionTransaction.class,
                GetThirdPartyUserSubscriptionDetails.class,
                SyncSubscription.class,
                QueryUserOrders.class,
                AdminCreateUserOrder.class,
                CountOfPurchasedItem.class,
                GetUserOrder.class,
                UpdateUserOrderStatus.class,
                FulfillUserOrder.class,
                GetUserOrderGrant.class,
                GetUserOrderHistories.class,
                ProcessUserOrderNotification.class,
                DownloadUserOrderReceipt.class,
                CreateUserPaymentOrder.class,
                RefundUserPaymentOrder.class,
                GetUserPlatformAccountClosureHistories.class,
                ApplyUserRedemption.class,
                DoRevocation.class,
                RegisterXblSessions.class,
                QueryUserSubscriptions.class,
                GetUserSubscriptionActivities.class,
                PlatformSubscribeSubscription.class,
                CheckUserSubscriptionSubscribableByItemId.class,
                GetUserSubscription.class,
                DeleteUserSubscription.class,
                CancelSubscription.class,
                GrantDaysToSubscription.class,
                GetUserSubscriptionBillingHistories.class,
                ProcessUserSubscriptionNotification.class,
                AcquireUserTicket.class,
                QueryUserCurrencyWallets.class,
                DebitUserWalletByCurrencyCode.class,
                ListUserCurrencyTransactions.class,
                CheckBalance.class,
                CheckWallet.class,
                CreditUserWallet.class,
                DebitByWalletPlatform.class,
                PayWithUserWallet.class,
                GetUserWallet.class,
                DebitUserWallet.class,
                DisableUserWallet.class,
                EnableUserWallet.class,
                ListUserWalletTransactions.class,
                ListViews.class,
                CreateView.class,
                GetView.class,
                UpdateView.class,
                DeleteView.class,
                GetWalletConfig.class,
                UpdateWalletConfig.class,
                QueryWallets.class,
                BulkCredit.class,
                BulkDebit.class,
                GetWallet.class,
                SyncOrders.class,
                TestAdyenConfig.class,
                TestAliPayConfig.class,
                TestCheckoutConfig.class,
                DebugMatchedPaymentMerchantConfig.class,
                TestNeonPayConfig.class,
                TestPayPalConfig.class,
                TestStripeConfig.class,
                TestWxPayConfig.class,
                TestXsollaConfig.class,
                GetPaymentMerchantConfig1.class,
                UpdateAdyenConfig.class,
                TestAdyenConfigById.class,
                UpdateAliPayConfig.class,
                TestAliPayConfigById.class,
                UpdateCheckoutConfig.class,
                TestCheckoutConfigById.class,
                UpdateNeonPayConfig.class,
                TestNeonPayConfigById.class,
                UpdatePayPalConfig.class,
                TestPayPalConfigById.class,
                UpdateStripeConfig.class,
                TestStripeConfigById.class,
                UpdateWxPayConfig.class,
                UpdateWxPayConfigCert.class,
                TestWxPayConfigById.class,
                UpdateXsollaConfig.class,
                TestXsollaConfigById.class,
                UpdateXsollaUIConfig.class,
                QueryPaymentProviderConfig.class,
                CreatePaymentProviderConfig.class,
                GetAggregatePaymentProviders.class,
                DebugMatchedPaymentProviderConfig.class,
                GetSpecialPaymentProviders.class,
                UpdatePaymentProviderConfig.class,
                DeletePaymentProviderConfig.class,
                GetPaymentTaxConfig.class,
                UpdatePaymentTaxConfig.class,
                SyncPaymentOrders.class,
                PublicGetRootCategories.class,
                DownloadCategories.class,
                PublicGetCategory.class,
                PublicGetChildCategories.class,
                PublicGetDescendantCategories.class,
                PublicListCurrencies.class,
                GeDLCDurableRewardShortMap.class,
                GetAppleConfigVersion.class,
                GetIAPItemMapping.class,
                PublicGetItemByAppId.class,
                PublicQueryItems.class,
                PublicGetItemBySku.class,
                PublicGetEstimatedPrice.class,
                PublicBulkGetItems.class,
                PublicValidateItemPurchaseCondition.class,
                PublicSearchItems.class,
                PublicGetApp.class,
                PublicGetItemDynamicData.class,
                PublicGetItem.class,
                GetPaymentCustomization.class,
                PublicGetPaymentUrl.class,
                PublicGetPaymentMethods.class,
                PublicGetUnpaidPaymentOrder.class,
                Pay.class,
                PublicCheckPaymentOrderPaidStatus.class,
                GetPaymentPublicConfig.class,
                PublicGetQRCode.class,
                PublicNormalizePaymentReturnUrl.class,
                GetPaymentTaxValue.class,
                GetRewardByCode.class,
                QueryRewards1.class,
                GetReward1.class,
                PublicListStores.class,
                PublicExistsAnyMyActiveEntitlement.class,
                PublicGetMyAppEntitlementOwnershipByAppId.class,
                PublicGetMyEntitlementOwnershipByItemId.class,
                PublicGetMyEntitlementOwnershipBySku.class,
                PublicGetEntitlementOwnershipToken.class,
                SyncTwitchDropsEntitlement.class,
                PublicGetMyWallet.class,
                SyncEpicGameDLC.class,
                SyncOculusDLC.class,
                PublicSyncPsnDlcInventory.class,
                PublicSyncPsnDlcInventoryWithMultipleServiceLabels.class,
                SyncSteamDLC.class,
                SyncXboxDLC.class,
                PublicQueryUserEntitlements.class,
                PublicGetUserAppEntitlementByAppId.class,
                PublicQueryUserEntitlementsByAppType.class,
                PublicGetUserEntitlementsByIds.class,
                PublicGetUserEntitlementByItemId.class,
                PublicGetUserEntitlementBySku.class,
                PublicUserEntitlementHistory.class,
                PublicExistsAnyUserActiveEntitlement.class,
                PublicGetUserAppEntitlementOwnershipByAppId.class,
                PublicGetUserEntitlementOwnershipByItemId.class,
                PublicGetUserEntitlementOwnershipByItemIds.class,
                PublicGetUserEntitlementOwnershipBySku.class,
                PublicGetUserEntitlement.class,
                PublicConsumeUserEntitlement.class,
                PublicSellUserEntitlement.class,
                PublicSplitUserEntitlement.class,
                PublicTransferUserEntitlement.class,
                PublicRedeemCode.class,
                PublicFulfillAppleIAPItem.class,
                SyncEpicGamesInventory.class,
                PublicFulfillGoogleIAPItem.class,
                SyncOculusConsumableEntitlements.class,
                PublicReconcilePlayStationStore.class,
                PublicReconcilePlayStationStoreWithMultipleServiceLabels.class,
                SyncSteamInventory.class,
                SyncSteamAbnormalTransaction.class,
                SyncSteamIAPByTransaction.class,
                PublicQueryUserThirdPartySubscription.class,
                SyncTwitchDropsEntitlement1.class,
                SyncXboxInventory.class,
                PublicQueryUserOrders.class,
                PublicCreateUserOrder.class,
                PublicPreviewOrderPrice.class,
                PublicGetUserOrder.class,
                PublicCancelUserOrder.class,
                PublicGetUserOrderHistories.class,
                PublicDownloadUserOrderReceipt.class,
                PublicGetPaymentAccounts.class,
                PublicDeletePaymentAccount.class,
                PublicListActiveSections.class,
                PublicQueryUserSubscriptions.class,
                PublicSubscribeSubscription.class,
                PublicCheckUserSubscriptionSubscribableByItemId.class,
                PublicGetUserSubscription.class,
                PublicChangeSubscriptionBillingAccount.class,
                PublicCancelSubscription.class,
                PublicGetUserSubscriptionBillingHistories.class,
                PublicListViews.class,
                PublicGetWallet.class,
                PublicListUserWalletTransactions.class,
                PublicGetMyDLCContent.class,
                QueryFulfillments.class,
                QueryItemsV2.class,
                ImportStore1.class,
                ExportStore1.class,
                FulfillRewardsV2.class,
                FulfillItems.class,
                RetryFulfillItems.class,
                RevokeItems.class,
                V2PublicFulfillAppleIAPItem.class,
                FulfillItemsV3.class,
                RetryFulfillItemsV3.class,
                RevokeItemsV3.class,
        }
)
public class Platform implements Runnable {

    @Override
    public void run() {

    }
}