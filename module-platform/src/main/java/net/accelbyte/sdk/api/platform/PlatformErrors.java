/*
 * Copyright (c) 2024 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */
package net.accelbyte.sdk.api.platform;

import net.accelbyte.sdk.core.ApiError;

public class PlatformErrors {
  public static ApiError error20002 = new ApiError("20002", "validation error");
  public static ApiError error20006 = new ApiError("20006", "optimistic lock");
  public static ApiError error20007 = new ApiError("20007", "too many requests");
  public static ApiError error20008 =
      new ApiError("20008", "user [{userId}] does not exist in namespace [{namespace}]");
  public static ApiError error20016 = new ApiError("20016", "action is banned");
  public static ApiError error20018 = new ApiError("20018", "ecommerce item type not supported");
  public static ApiError error20024 =
      new ApiError("20024", "insufficient inventory capacity (max. slots)");
  public static ApiError error20027 = new ApiError("20027", "Invalid time range");
  public static ApiError error30021 =
      new ApiError("30021", "Default language [{language}] required");
  public static ApiError error30022 =
      new ApiError("30022", "Default region [{region}] is required");
  public static ApiError error30023 =
      new ApiError("30023", "Catalog plugin grpc server address required");
  public static ApiError error30024 = new ApiError("30024", "Unable to parse CSV cell [{content}]");
  public static ApiError error30025 =
      new ApiError(
          "30025", "[{header}] is required by CSV import/export for catalogType [{catalogType}]");
  public static ApiError error30041 =
      new ApiError("30041", "Changelog [{changelogId}] does not exist in namespace [{namespace}]");
  public static ApiError error30071 =
      new ApiError(
          "30071",
          "Can't unselect item [{itemId}] when the item which is bound to is already selected in"
              + " namespace [{namespace}]");
  public static ApiError error30072 =
      new ApiError(
          "30072",
          "Can't unselect category [{categoryPath}] when item with this category is already"
              + " selected in namespace [{namespace}]");
  public static ApiError error30073 = new ApiError("30073", "Can't unselect store change");
  public static ApiError error30074 =
      new ApiError(
          "30074",
          "Can't unselect subscription's content [{itemId}] when subscription is already selected"
              + " in namespace [{namespace}]");
  public static ApiError error30076 =
      new ApiError(
          "30076", "CSV header [{headerName}] is not supported for CatalogType [{catalogType}]");
  public static ApiError error30121 = new ApiError("30121", "Store data is invalid");
  public static ApiError error30122 = new ApiError("30122", "Store's meta mismatch");
  public static ApiError error30141 =
      new ApiError("30141", "Store [{storeId}] does not exist in namespace [{namespace}]");
  public static ApiError error30142 =
      new ApiError("30142", "Published store does not exist in namespace [{namespace}]");
  public static ApiError error30143 =
      new ApiError(
          "30143", "Published store [{storeId}] backup does not exist in namespace [{namespace}]");
  public static ApiError error30171 =
      new ApiError("30171", "Store [{store}] can't change default language to [{language}]");
  public static ApiError error30172 =
      new ApiError("30172", "Store [{store}] can't change default region to [{region}]");
  public static ApiError error30173 = new ApiError("30173", "Published store can't modify content");
  public static ApiError error30174 =
      new ApiError("30174", "Draft store already exists in namespace [{namespace}]");
  public static ApiError error30175 =
      new ApiError("30175", "Duplicated currencyCode [{currencyCode}] in Region [{region}]");
  public static ApiError error30241 =
      new ApiError("30241", "Category [{categoryPath}] does not exist in namespace [{namespace}]");
  public static ApiError error30271 =
      new ApiError("30271", "Category [{categoryPath}] already exists in namespace [{namespace}]");
  public static ApiError error30272 =
      new ApiError("30272", "Category [{categoryPath}] is not empty in namespace [{namespace}]");
  public static ApiError error30301 =
      new ApiError(
          "30301", "Unsupported Item Type [{itemType}] for box item [{itemId}] with expiration");
  public static ApiError error30321 = new ApiError("30321", "Invalid item discount amount");
  public static ApiError error30322 =
      new ApiError("30322", "Bundle item [{itemId}] can't be bundled");
  public static ApiError error30323 = new ApiError("30323", "Target namespace is required");
  public static ApiError error30324 = new ApiError("30324", "Invalid namespace [{namespace}]");
  public static ApiError error30325 =
      new ApiError("30325", "Code item [{itemId}] can't be bundled");
  public static ApiError error30326 =
      new ApiError("30326", "Subscription item [{itemId}] can't be bundled");
  public static ApiError error30327 = new ApiError("30327", "Invalid item trial price");
  public static ApiError error30329 =
      new ApiError("30329", "Invalid bundled item [{itemId}] quantity");
  public static ApiError error30330 =
      new ApiError("30330", "Invalid item region price currency namespace [{namespace}]");
  public static ApiError error30331 = new ApiError("30331", "Invalid purchase condition");
  public static ApiError error30332 =
      new ApiError("30332", "Invalid option box item [{itemId}] quantity");
  public static ApiError error30333 =
      new ApiError(
          "30333", "Item [{itemId}] item type [{itemType}] can't be bundled into option box");
  public static ApiError error30334 =
      new ApiError("30334", "Option box item [{itemId}] can't be bundled");
  public static ApiError error30335 =
      new ApiError(
          "30335",
          "Item [{itemId}] can't be deleted in non-forced mode if item has been published");
  public static ApiError error30336 =
      new ApiError("30336", "Item type [{itemType}] does not support");
  public static ApiError error30337 =
      new ApiError("30337", "Invalid loot box item [{itemId}] quantity");
  public static ApiError error30338 =
      new ApiError(
          "30338", "Item [{itemId}] item type [{itemType}] can't be bundled into loot box");
  public static ApiError error30339 =
      new ApiError("30339", "Loot box item [{itemId}] can't be bundled");
  public static ApiError error30341 =
      new ApiError("30341", "Item [{itemId}] does not exist in namespace [{namespace}]");
  public static ApiError error30342 =
      new ApiError("30342", "Item of appId [{appId}] does not exist");
  public static ApiError error30343 = new ApiError("30343", "Item of sku [{sku}] does not exist");
  public static ApiError error30371 = new ApiError("30371", "Item maxCount not allow reduce");
  public static ApiError error30372 = new ApiError("30372", "ItemType is not updatable");
  public static ApiError error30373 =
      new ApiError("30373", "ItemType [{itemType}] is not allowed in namespace [{namespace}]");
  public static ApiError error30374 =
      new ApiError("30374", "Item sku [{sku}] already exists in namespace [{namespace}]");
  public static ApiError error30375 =
      new ApiError(
          "30375",
          "Item id [{itemId}] of sku [{sku}] is duplicate with un-published deleted item in"
              + " namespace [{namespace}]");
  public static ApiError error30376 =
      new ApiError("30376", "Publisher namespace don’t allow sellback item");
  public static ApiError error30377 =
      new ApiError("30377", "This item type [{itemType}] don’t allow sellback");
  public static ApiError error30378 =
      new ApiError("30378", "Sale price don’t allow real currency [{currencyCode}]");
  public static ApiError error30379 = new ApiError("30379", "Item sku is not updatable");
  public static ApiError error30380 =
      new ApiError(
          "30380", "Box item [{itemId}] duration and end date can’t be set at the same time");
  public static ApiError error30381 =
      new ApiError(
          "30381",
          "Currency [{currency}] is not set for bundle Item [{itemId}] in region [{region}]");
  public static ApiError error30382 = new ApiError("30382", "Duplicated Item sku [{sku}]");
  public static ApiError error30383 =
      new ApiError(
          "30383",
          "Item app id [{appId}] already exists in namespace [{namespace}] item [{itemId}]");
  public static ApiError error30386 =
      new ApiError(
          "30386",
          "The item [{itemId}] is currently associated and cannot be deleted in namespace"
              + " [{namespace}], Feature {featureName}, Module {moduleName}, and Reference ID"
              + " {referenceId} are using this item ID");
  public static ApiError error30387 =
      new ApiError(
          "30387",
          "The item [{itemId}] is currently associated and cannot be disabled in namespace"
              + " [{namespace}], Feature {featureName}, Module {moduleName}, and Reference ID"
              + " {referenceId} are using this item ID");
  public static ApiError error30541 =
      new ApiError("30541", "Item type config [{id}] doesn't exist");
  public static ApiError error30641 =
      new ApiError("30641", "View [{viewId}] does not exist in namespace [{namespace}]");
  public static ApiError error30741 =
      new ApiError("30741", "Section [{sectionId}] does not exist in namespace [{namespace}]");
  public static ApiError error30771 =
      new ApiError(
          "30771",
          "Item [{itemId}] not found in User Section [{sectionId}], UserId [{userId}], Namespace"
              + " [{namespace}]");
  public static ApiError error30772 =
      new ApiError("30772", "Section [{sectionId}] is not available or expired");
  public static ApiError error31121 =
      new ApiError("31121", "OptionBox entitlement [{entitlementId}] use count is not 1");
  public static ApiError error31122 =
      new ApiError("31122", "OptionBox entitlement [{entitlementId}] options size is not 1");
  public static ApiError error31123 =
      new ApiError("31123", "Unable to acquire box item, box item [{itemId}] expired");
  public static ApiError error31141 =
      new ApiError(
          "31141", "Entitlement [{entitlementId}] does not exist in namespace [{namespace}]");
  public static ApiError error31142 =
      new ApiError(
          "31142", "Entitlement with appId [{appId}] does not exist in namespace [{namespace}]");
  public static ApiError error31143 =
      new ApiError(
          "31143", "Entitlement with sku [{sku}] does not exist in namespace [{namespace}]");
  public static ApiError error31144 =
      new ApiError(
          "31144", "Entitlement with itemId [{itemId}] does not exist in namespace [{namespace}]");
  public static ApiError error31145 =
      new ApiError(
          "31145", "Option [{option}] doesn't exist in OptionBox entitlement [{entitlementId}]");
  public static ApiError error31147 =
      new ApiError("31147", "Origin [Steam] and System need exist in allowPlatformOrigin");
  public static ApiError error31171 =
      new ApiError("31171", "Entitlement [{entitlementId}] already revoked");
  public static ApiError error31172 =
      new ApiError("31172", "Entitlement [{entitlementId}] not active");
  public static ApiError error31173 =
      new ApiError("31173", "Entitlement [{entitlementId}] is not consumable");
  public static ApiError error31174 =
      new ApiError("31174", "Entitlement [{entitlementId}] already consumed");
  public static ApiError error31176 =
      new ApiError("31176", "Entitlement [{entitlementId}] use count is insufficient");
  public static ApiError error31177 = new ApiError("31177", "Permanent item already owned");
  public static ApiError error31178 =
      new ApiError("31178", "Entitlement [{entitlementId}] out of time range");
  public static ApiError error31179 = new ApiError("31179", "Duplicate entitlement exists");
  public static ApiError error31180 = new ApiError("31180", "Duplicate request id: [{requestId}]");
  public static ApiError error31181 =
      new ApiError("31181", "Entitlement [{entitlementId}] is not sellable");
  public static ApiError error31182 =
      new ApiError("31182", "Entitlement [{entitlementId}] already sold");
  public static ApiError error31183 =
      new ApiError(
          "31183",
          "Entitlement [{entitlementId}] origin [{origin}] not allowed be operated at"
              + " [{platform}]");
  public static ApiError error31184 =
      new ApiError(
          "31184",
          "Source entitlement [{sourceEntitlementId}] and target entitlement"
              + " [{targetEntitlementId}] should have same collectionId, timeRange, origin and"
              + " itemId");
  public static ApiError error31185 =
      new ApiError(
          "31185",
          "Transferred source entitlement [{sourceEntitlementId}] and target entitlement"
              + " [{targetEntitlementId}] can not be set to same");
  public static ApiError error32121 = new ApiError("32121", "Order price mismatch");
  public static ApiError error32122 =
      new ApiError("32122", "Item type [{itemType}] does not support");
  public static ApiError error32123 = new ApiError("32123", "Item is not purchasable");
  public static ApiError error32124 = new ApiError("32124", "Invalid currency namespace");
  public static ApiError error32125 =
      new ApiError("32125", "The user does not meet the purchase conditions");
  public static ApiError error32126 =
      new ApiError("32126", "Section ID is required for placing this order");
  public static ApiError error32127 =
      new ApiError("32127", "Discount code [{code}] can't be used on this item: {tips}");
  public static ApiError error32128 =
      new ApiError("32128", "Discount code [{code}] can not be used with other code together");
  public static ApiError error32129 =
      new ApiError("32129", "Can't use discount code on free order");
  public static ApiError error32130 =
      new ApiError("32130", "The total discount amount cannot exceed the order price");
  public static ApiError error32141 = new ApiError("32141", "Order [{orderNo}] does not exist");
  public static ApiError error32171 = new ApiError("32171", "Order [{orderNo}] is not refundable");
  public static ApiError error32172 =
      new ApiError("32172", "Invalid order status [{status}] for order [{orderNo}]");
  public static ApiError error32173 =
      new ApiError("32173", "Receipt of order [{orderNo}] is not downloadable");
  public static ApiError error32175 =
      new ApiError("32175", "Exceed item [{itemId}] max count [{maxCount}] per user");
  public static ApiError error32176 =
      new ApiError("32176", "Exceed item [{itemId}] max count [{maxCount}]");
  public static ApiError error32177 = new ApiError("32177", "Order [{orderNo}] is not cancelable");
  public static ApiError error32178 =
      new ApiError(
          "32178",
          "User [{userId}] already owned all durable items in flexible bundle [{bundleId}],"
              + " namespace: [{namespace}]");
  public static ApiError error33045 =
      new ApiError(
          "33045", "errors.net.accelbyte.platform.payment.payment_merchant_config_not_found");
  public static ApiError error33121 =
      new ApiError(
          "33121",
          "Recurring payment failed with code: [{errorCode}] and message: [{errorMessage}] by"
              + " provider: [{provider}]");
  public static ApiError error33122 =
      new ApiError("33122", "Subscription not match when create payment order");
  public static ApiError error33123 = new ApiError("33123", "Invalid zipcode");
  public static ApiError error33141 =
      new ApiError("33141", "Payment Order [{paymentOrderNo}] does not exist");
  public static ApiError error33145 = new ApiError("33145", "Recurring token not found");
  public static ApiError error33171 =
      new ApiError(
          "33171", "Invalid payment order status [{status}] for payment order [{paymentOrderNo}]");
  public static ApiError error33172 =
      new ApiError("33172", "Payment order [{paymentOrderNo}] is not refundable");
  public static ApiError error33173 =
      new ApiError("33173", "ExtOrderNo [{extOrderNo}] already exists in namespace [{namespace}]");
  public static ApiError error33221 = new ApiError("33221", "TaxJar api token required");
  public static ApiError error33241 =
      new ApiError("33241", "Payment provider config [{id}] does not exist");
  public static ApiError error33242 =
      new ApiError("33242", "Payment merchant config [{id}] does not exist");
  public static ApiError error33243 =
      new ApiError("33243", "Payment callback config for [{namespace}] does not exist");
  public static ApiError error33271 =
      new ApiError(
          "33271",
          "Payment provider config for namespace [{namespace}] and region [{region}] already"
              + " exists");
  public static ApiError error33321 =
      new ApiError(
          "33321", "Payment provider [{paymentProvider}] not support currency [{currency}]");
  public static ApiError error33322 =
      new ApiError("33322", "Payment provider [{paymentProvider}] not supported");
  public static ApiError error33332 =
      new ApiError("33332", "Amount too small, please contact administrator");
  public static ApiError error33333 =
      new ApiError(
          "33333",
          "Neon Pay checkout payment order [{paymentOrderNo}] failed with message [{errMsg}]");
  public static ApiError error34021 =
      new ApiError("34021", "Reward data for namespace [{namespace}] is invalid");
  public static ApiError error34023 =
      new ApiError(
          "34023",
          "Reward Item [{itemId}] with item type [{itemType}] is not supported for duration or"
              + " endDate");
  public static ApiError error34027 =
      new ApiError(
          "34027",
          "Reward Item [{sku}] with item type [{itemType}] is not supported for duration or"
              + " endDate");
  public static ApiError error34041 =
      new ApiError("34041", "Reward [{rewardId}] does not exist in namespace [{namespace}]");
  public static ApiError error34042 =
      new ApiError("34042", "Reward item [{itemId}] does not exist in namespace [{namespace}]");
  public static ApiError error34043 =
      new ApiError(
          "34043", "Reward with code [{rewardCode}] does not exist in namespace [{namespace}]");
  public static ApiError error34044 =
      new ApiError("34044", "Reward item [{sku}] does not exist in namespace [{namespace}]");
  public static ApiError error34071 =
      new ApiError(
          "34071", "Reward with code [{rewardCode}] already exists in namespace [{namespace}]");
  public static ApiError error34072 =
      new ApiError(
          "34072",
          "Duplicate reward condition [{rewardConditionName}] found in reward [{rewardCode}]");
  public static ApiError error34074 =
      new ApiError(
          "34074", "Reward Item [{itemId}] duration and end date can’t be set at the same time");
  public static ApiError error34076 =
      new ApiError(
          "34076", "Reward Item [{sku}] duration and end date can’t be set at the same time");
  public static ApiError error35123 = new ApiError("35123", "Wallet [{walletId}] is inactive");
  public static ApiError error35124 =
      new ApiError("35124", "Wallet [{currencyCode}] has insufficient balance");
  public static ApiError error35141 = new ApiError("35141", "Wallet [{walletId}] does not exist");
  public static ApiError error36141 =
      new ApiError("36141", "Currency [{currencyCode}] does not exist in namespace [{namespace}]");
  public static ApiError error36171 =
      new ApiError("36171", "Currency [{currencyCode}] already exists in namespace [{namespace}]");
  public static ApiError error36172 =
      new ApiError(
          "36172", "Real Currency [{currencyCode}] not allowed in game namespace [{namespace}]");
  public static ApiError error37041 =
      new ApiError("37041", "Ticket booth [{boothName}] does not exist in namespace [{namespace}]");
  public static ApiError error37071 =
      new ApiError(
          "37071", "Insufficient ticket in booth [{boothName}] in namespace [{namespace}]");
  public static ApiError error37121 =
      new ApiError("37121", "Invalid currency namespace [{namespace}] in discount config: {tips}");
  public static ApiError error37141 =
      new ApiError("37141", "Campaign [{campaignId}] does not exist in namespace [{namespace}]");
  public static ApiError error37142 =
      new ApiError("37142", "Code [{code}] does not exist in namespace [{namespace}]");
  public static ApiError error37143 =
      new ApiError(
          "37143",
          "Batch name [{batchName}] does not exist for campaign [{campaignId}] in namespace"
              + " [{namespace}].");
  public static ApiError error37144 =
      new ApiError(
          "37144",
          "Campaign batch name does not exist for batch number [{batchNo}] campaign [{campaignId}]"
              + " in namespace [{namespace}].");
  public static ApiError error37171 =
      new ApiError("37171", "Campaign [{name}] already exists in namespace [{namespace}]");
  public static ApiError error37172 =
      new ApiError("37172", "Campaign [{campaignId}] is inactive in namespace [{namespace}]");
  public static ApiError error37173 =
      new ApiError("37173", "Code [{code}] is inactive in namespace [{namespace}]");
  public static ApiError error37174 =
      new ApiError("37174", "Exceeded max redeem count per code [{maxCount}]");
  public static ApiError error37175 =
      new ApiError("37175", "Exceeded max redeem count per code per user [{maxCount}]");
  public static ApiError error37176 =
      new ApiError("37176", "Code [{code}] has been redeemed in namespace [{namespace}]");
  public static ApiError error37177 = new ApiError("37177", "Code redemption not started");
  public static ApiError error37178 = new ApiError("37178", "Code redemption already ended");
  public static ApiError error37179 =
      new ApiError("37179", "Exceeded max redeem count per campaign per user [{maxCount}]");
  public static ApiError error37180 =
      new ApiError("37180", "Code [{code}] already exists in namespace [{namespace}]");
  public static ApiError error37221 = new ApiError("37221", "Invalid key file");
  public static ApiError error37241 =
      new ApiError("37241", "Key group [{keyGroupId}] does not exist in namespace [{namespace}]");
  public static ApiError error37271 =
      new ApiError("37271", "Key group [{name}] already exists in namespace [{namespace}]");
  public static ApiError error38121 = new ApiError("38121", "Duplicate permanent item exists");
  public static ApiError error38122 = new ApiError("38122", "Subscription endDate required");
  public static ApiError error38128 =
      new ApiError(
          "38128", "Cannot retry fulfillment with different payload. Please check the items list.");
  public static ApiError error38129 =
      new ApiError(
          "38129", "Cannot combine same item [{itemId}] with different [{fieldName}] value");
  public static ApiError error38130 =
      new ApiError("38130", "Cannot fulfill item with type [{itemType}] in item [{itemIdentity}]");
  public static ApiError error38141 = new ApiError("38141", "Fulfillment script does not exist");
  public static ApiError error38145 =
      new ApiError("38145", "Fulfillment with transactionId [{transactionId}] does not exist");
  public static ApiError error38171 = new ApiError("38171", "Fulfillment script already exists");
  public static ApiError error39121 =
      new ApiError("39121", "Apple iap receipt verify failed with status code [{statusCode}]");
  public static ApiError error39122 =
      new ApiError(
          "39122",
          "Google iap receipt is invalid with status code [{statusCode}] and error message"
              + " [{message}]");
  public static ApiError error39123 =
      new ApiError("39123", "IAP request is not in valid application");
  public static ApiError error39124 =
      new ApiError(
          "39124", "IAP request platform [{platformId}] user id is not linked with current user");
  public static ApiError error39125 =
      new ApiError("39125", "Invalid platform [{platformId}] user token");
  public static ApiError error39126 =
      new ApiError("39126", "User id [{}] in namespace [{}] doesn't link platform [{}]");
  public static ApiError error39127 =
      new ApiError("39127", "Invalid service label [{serviceLabel}]");
  public static ApiError error39128 = new ApiError("39128", "Steam publisher key is invalid");
  public static ApiError error39129 = new ApiError("39129", "Steam app id is invalid");
  public static ApiError error39130 =
      new ApiError("39130", "Invalid playstation config: [{message}]");
  public static ApiError error39131 =
      new ApiError("39131", "Invalid Apple IAP config under namespace [{namespace}]: [{message}]");
  public static ApiError error39132 =
      new ApiError(
          "39132",
          "Bad request for playstation under namespace [{namespace}], reason: [{reason}].");
  public static ApiError error39133 = new ApiError("39133", "Bad request for Oculus: [{reason}]");
  public static ApiError error39134 =
      new ApiError("39134", "Invalid Oculus IAP config under namespace [{namespace}]: [{message}]");
  public static ApiError error39135 =
      new ApiError("39135", "Invalid Google IAP config under namespace [{namespace}]: [{message}]");
  public static ApiError error39136 =
      new ApiError(
          "39136",
          "Request Apple API failed with status code [{statusCode}] and error message [{message}]");
  public static ApiError error39137 =
      new ApiError(
          "39137",
          "Verify Apple transaction failed with status [{status}] and error message [{message}]");
  public static ApiError error39138 =
      new ApiError(
          "39138",
          "Apple IAP version mismatch detected: The current configuration is set to "
              + " [{configVersion}], but the API version is [{apiVersion}]. Please ensure that both"
              + " the configuration and API versions are aligned");
  public static ApiError error39141 =
      new ApiError(
          "39141",
          "Apple iap receipt of transaction [{transactionId}] for productId [{}] does not exist");
  public static ApiError error39142 =
      new ApiError("39142", "Apple IAP config not found in namespace [{namespace}]");
  public static ApiError error39143 =
      new ApiError("39143", "PlayStation IAP config not found in namespace [{namespace}]");
  public static ApiError error39144 =
      new ApiError("39144", "Steam IAP config not found in namespace [{namespace}].");
  public static ApiError error39145 =
      new ApiError("39145", "XBox IAP config not found in namespace [{namespace}].");
  public static ApiError error39146 =
      new ApiError("39146", "Oculus IAP config not found in namespace [{namespace}].");
  public static ApiError error39147 =
      new ApiError("39147", "Epic IAP config not found in namespace [{namespace}].");
  public static ApiError error39148 =
      new ApiError("39148", "Google IAP config not found in namespace [{namespace}].");
  public static ApiError error39149 =
      new ApiError(
          "39149",
          "Third Party Subscription Transaction [{id}] not found for user [{userId}] in the"
              + " namespace [{namespace}].");
  public static ApiError error39150 =
      new ApiError(
          "39150",
          "Third Party User Subscription [{id}] not found for user [{userId}] in the namespace"
              + " [{namespace}]..");
  public static ApiError error39151 =
      new ApiError("39151", "IAP order no [{iapOrderNo}] not found in namespace [{namespace}].");
  public static ApiError error39171 =
      new ApiError(
          "39171",
          "The bundle id in namespace [{namespace}] expect [{expected}] but was [{actual}]");
  public static ApiError error39172 =
      new ApiError(
          "39172",
          "The order id in namespace [{namespace}] expect [{expected}] but was [{actual}]");
  public static ApiError error39173 =
      new ApiError(
          "39173",
          "The purchase status of google play order [{orderId}] in namespace [{namespace}] expect"
              + " [{expected}] but was [{actual}]");
  public static ApiError error39174 =
      new ApiError(
          "39174",
          "The google iap purchase time of order [{orderId}] in namespace [{namespace}] expect"
              + " [{expected}] but was [{actual}]");
  public static ApiError error39175 =
      new ApiError("39175", "Duplicate IAP item mapping, IAPType: [{iapType}] and id: [{iapId}]");
  public static ApiError error39183 =
      new ApiError(
          "39183",
          "Steam transaction [{orderId}] is still pending or failed, status [{status}], please try"
              + " it later");
  public static ApiError error39184 =
      new ApiError(
          "39184",
          "Steam api exception with error code [{errorCode}] and error message [{message}]");
  public static ApiError error39185 =
      new ApiError(
          "39185",
          "This endpoint only works on sync mode [{workSyncMode}], but current steam iap config"
              + " sync mode is [{currentSyncMode}] under namespace [{namespace}]");
  public static ApiError error39221 =
      new ApiError("39221", "Invalid Xbox Business Partner Certificate or password: [{message}]");
  public static ApiError error39244 = new ApiError("39244", "Steam config does not exist");
  public static ApiError error39245 = new ApiError("39245", "Steam app id does not exist");
  public static ApiError error39321 =
      new ApiError("39321", "Invalid IAP item config namespace [{namespace}]: [{message}]");
  public static ApiError error39341 =
      new ApiError("39341", "IAP item config cannot be found in namespace [{namespace}]");
  public static ApiError error39441 =
      new ApiError("39441", "Platform dlc config cannot be found in namespace [{namespace}]");
  public static ApiError error39442 =
      new ApiError("39442", "DLC item config cannot be found in namespace [{namespace}]");
  public static ApiError error39471 =
      new ApiError("39471", "Duplicated dlc reward id [{dlcRewardId}] in namespace [{namespace}] ");
  public static ApiError error39621 =
      new ApiError(
          "39621", "Steam api common exception with status code [statusCode] details: [details]");
  public static ApiError error40121 =
      new ApiError("40121", "Item type [{itemType}] does not support");
  public static ApiError error40122 =
      new ApiError("40122", "Subscription already been subscribed by user");
  public static ApiError error40123 =
      new ApiError("40123", "Currency [{currencyCode}] does not support");
  public static ApiError error40125 =
      new ApiError("40125", "Subscription [{subscriptionId}] has no real currency billing account");
  public static ApiError error40141 =
      new ApiError("40141", "Subscription [{subscriptionId}] does not exist");
  public static ApiError error40171 =
      new ApiError("40171", "Subscription [{subscriptionId}] is not active");
  public static ApiError error40172 =
      new ApiError(
          "40172", "Subscription [{subscriptionId}] is charging, waiting for payment notification");
  public static ApiError error40173 =
      new ApiError(
          "40173",
          "Subscription [{subscriptionId}] current currency [{currentCurrency}] not match request"
              + " currency [{requestCurrency}]");
  public static ApiError error41171 =
      new ApiError("41171", "Request has different payload on previous call");
  public static ApiError error41172 =
      new ApiError("41172", "Request has different user id on previous call");
  public static ApiError error49147 = new ApiError("49147", "Published season does not exist");
  public static ApiError error49183 =
      new ApiError("49183", "Pass item does not match published season pass");
  public static ApiError error49184 =
      new ApiError("49184", "Tier item does not match published season tier");
  public static ApiError error49185 = new ApiError("49185", "Season has not started");
  public static ApiError error49186 = new ApiError("49186", "Pass already owned");
  public static ApiError error49187 = new ApiError("49187", "Exceed max tier count");
  public static ApiError error394721 =
      new ApiError("394721", "Invalid platform DLC config namespace [{namespace}]: [{message}]");
  public static ApiError error1100001 = new ApiError("1100001", "record not found: inventory");
}
