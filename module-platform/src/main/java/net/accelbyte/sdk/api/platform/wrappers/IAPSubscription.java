/*
 * Copyright (c) 2024 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.platform.wrappers;

import net.accelbyte.sdk.api.platform.models.*;
import net.accelbyte.sdk.api.platform.operations.iap_subscription.*;
import net.accelbyte.sdk.core.HttpResponse;
import net.accelbyte.sdk.core.RequestRunner;

public class IAPSubscription {

  private RequestRunner sdk;
  private String customBasePath = "";

  public IAPSubscription(RequestRunner sdk) {
    this.sdk = sdk;
    String configCustomBasePath =
        sdk.getSdkConfiguration().getConfigRepository().getCustomServiceBasePath("platform");
    if (!configCustomBasePath.equals("")) {
      this.customBasePath = configCustomBasePath;
    }
  }

  public IAPSubscription(RequestRunner sdk, String customBasePath) {
    this.sdk = sdk;
    this.customBasePath = customBasePath;
  }

  /**
   * @see QueryThirdPartySubscription
   */
  public ThirdPartyUserSubscriptionPagingSlicedResult queryThirdPartySubscription(
      QueryThirdPartySubscription input) throws Exception {
    if (input.getCustomBasePath().equals("") && !customBasePath.equals("")) {
      input.setCustomBasePath(customBasePath);
    }

    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see QueryUserThirdPartySubscription
   */
  public ThirdPartyUserSubscriptionPagingSlicedResult queryUserThirdPartySubscription(
      QueryUserThirdPartySubscription input) throws Exception {
    if (input.getCustomBasePath().equals("") && !customBasePath.equals("")) {
      input.setCustomBasePath(customBasePath);
    }

    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see GetThirdPartyPlatformSubscriptionOwnershipByGroupId
   */
  public ThirdPartySubscriptionOwnership getThirdPartyPlatformSubscriptionOwnershipByGroupId(
      GetThirdPartyPlatformSubscriptionOwnershipByGroupId input) throws Exception {
    if (input.getCustomBasePath().equals("") && !customBasePath.equals("")) {
      input.setCustomBasePath(customBasePath);
    }

    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see GetThirdPartyPlatformSubscriptionOwnershipByProductId
   */
  public ThirdPartySubscriptionOwnership getThirdPartyPlatformSubscriptionOwnershipByProductId(
      GetThirdPartyPlatformSubscriptionOwnershipByProductId input) throws Exception {
    if (input.getCustomBasePath().equals("") && !customBasePath.equals("")) {
      input.setCustomBasePath(customBasePath);
    }

    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see QueryUserThirdPartySubscriptionTransactions
   */
  public ThirdPartySubscriptionTransactionPagingSlicedResult
      queryUserThirdPartySubscriptionTransactions(QueryUserThirdPartySubscriptionTransactions input)
          throws Exception {
    if (input.getCustomBasePath().equals("") && !customBasePath.equals("")) {
      input.setCustomBasePath(customBasePath);
    }

    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see GetThirdPartySubscriptionDetails
   */
  public ThirdPartySubscriptionTransactionInfo getThirdPartySubscriptionDetails(
      GetThirdPartySubscriptionDetails input) throws Exception {
    if (input.getCustomBasePath().equals("") && !customBasePath.equals("")) {
      input.setCustomBasePath(customBasePath);
    }

    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see GetSubscriptionHistory
   */
  public ThirdPartySubscriptionTransactionHistoryPagingSlicedResult getSubscriptionHistory(
      GetSubscriptionHistory input) throws Exception {
    if (input.getCustomBasePath().equals("") && !customBasePath.equals("")) {
      input.setCustomBasePath(customBasePath);
    }

    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see SyncSubscriptionTransaction
   */
  public ThirdPartySubscriptionTransactionInfo syncSubscriptionTransaction(
      SyncSubscriptionTransaction input) throws Exception {
    if (input.getCustomBasePath().equals("") && !customBasePath.equals("")) {
      input.setCustomBasePath(customBasePath);
    }

    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see GetThirdPartyUserSubscriptionDetails
   */
  public ThirdPartyUserSubscriptionInfo getThirdPartyUserSubscriptionDetails(
      GetThirdPartyUserSubscriptionDetails input) throws Exception {
    if (input.getCustomBasePath().equals("") && !customBasePath.equals("")) {
      input.setCustomBasePath(customBasePath);
    }

    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see SyncSubscription
   */
  public ThirdPartyUserSubscriptionInfo syncSubscription(SyncSubscription input) throws Exception {
    if (input.getCustomBasePath().equals("") && !customBasePath.equals("")) {
      input.setCustomBasePath(customBasePath);
    }

    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see PublicQueryUserThirdPartySubscription
   */
  public ThirdPartyUserSubscriptionPagingSlicedResult publicQueryUserThirdPartySubscription(
      PublicQueryUserThirdPartySubscription input) throws Exception {
    if (input.getCustomBasePath().equals("") && !customBasePath.equals("")) {
      input.setCustomBasePath(customBasePath);
    }

    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }
}
