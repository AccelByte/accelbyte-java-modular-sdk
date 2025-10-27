/*
 * Copyright (c) 2024 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.platform.wrappers;

import java.util.*;
import net.accelbyte.sdk.api.platform.models.*;
import net.accelbyte.sdk.api.platform.operation_responses.iap_subscription.*;
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
   * @see ListOculusSubscriptionGroups
   */
  public ListOculusSubscriptionGroupsOpResponse listOculusSubscriptionGroups(
      ListOculusSubscriptionGroups input) throws Exception {
    if (input.getCustomBasePath().equals("") && !customBasePath.equals("")) {
      input.setCustomBasePath(customBasePath);
    }

    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see CreateOculusSubscriptionGroup
   */
  public CreateOculusSubscriptionGroupOpResponse createOculusSubscriptionGroup(
      CreateOculusSubscriptionGroup input) throws Exception {
    if (input.getCustomBasePath().equals("") && !customBasePath.equals("")) {
      input.setCustomBasePath(customBasePath);
    }

    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see DeleteOculusSubscriptionGroup
   */
  public DeleteOculusSubscriptionGroupOpResponse deleteOculusSubscriptionGroup(
      DeleteOculusSubscriptionGroup input) throws Exception {
    if (input.getCustomBasePath().equals("") && !customBasePath.equals("")) {
      input.setCustomBasePath(customBasePath);
    }

    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see ListOculusSubscriptionGroupTier
   */
  public ListOculusSubscriptionGroupTierOpResponse listOculusSubscriptionGroupTier(
      ListOculusSubscriptionGroupTier input) throws Exception {
    if (input.getCustomBasePath().equals("") && !customBasePath.equals("")) {
      input.setCustomBasePath(customBasePath);
    }

    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see AddTierIntoMetaQuestSubscriptionGroup
   */
  public AddTierIntoMetaQuestSubscriptionGroupOpResponse addTierIntoMetaQuestSubscriptionGroup(
      AddTierIntoMetaQuestSubscriptionGroup input) throws Exception {
    if (input.getCustomBasePath().equals("") && !customBasePath.equals("")) {
      input.setCustomBasePath(customBasePath);
    }

    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see DeleteOculusSubscriptionTier
   */
  public DeleteOculusSubscriptionTierOpResponse deleteOculusSubscriptionTier(
      DeleteOculusSubscriptionTier input) throws Exception {
    if (input.getCustomBasePath().equals("") && !customBasePath.equals("")) {
      input.setCustomBasePath(customBasePath);
    }

    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see QueryThirdPartySubscription
   */
  public QueryThirdPartySubscriptionOpResponse queryThirdPartySubscription(
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
  public QueryUserThirdPartySubscriptionOpResponse queryUserThirdPartySubscription(
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
  public GetThirdPartyPlatformSubscriptionOwnershipByGroupIdOpResponse
      getThirdPartyPlatformSubscriptionOwnershipByGroupId(
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
  public GetThirdPartyPlatformSubscriptionOwnershipByProductIdOpResponse
      getThirdPartyPlatformSubscriptionOwnershipByProductId(
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
  public QueryUserThirdPartySubscriptionTransactionsOpResponse
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
  public GetThirdPartySubscriptionDetailsOpResponse getThirdPartySubscriptionDetails(
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
  public GetSubscriptionHistoryOpResponse getSubscriptionHistory(GetSubscriptionHistory input)
      throws Exception {
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
  public SyncSubscriptionTransactionOpResponse syncSubscriptionTransaction(
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
  public GetThirdPartyUserSubscriptionDetailsOpResponse getThirdPartyUserSubscriptionDetails(
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
  public SyncSubscriptionOpResponse syncSubscription(SyncSubscription input) throws Exception {
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
  public PublicQueryUserThirdPartySubscriptionOpResponse publicQueryUserThirdPartySubscription(
      PublicQueryUserThirdPartySubscription input) throws Exception {
    if (input.getCustomBasePath().equals("") && !customBasePath.equals("")) {
      input.setCustomBasePath(customBasePath);
    }

    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }
}
