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
import net.accelbyte.sdk.api.platform.operation_responses.entitlement.*;
import net.accelbyte.sdk.api.platform.operations.entitlement.*;
import net.accelbyte.sdk.core.HttpResponse;
import net.accelbyte.sdk.core.RequestRunner;

public class Entitlement {

  private RequestRunner sdk;
  private String customBasePath = "";

  public Entitlement(RequestRunner sdk) {
    this.sdk = sdk;
    String configCustomBasePath =
        sdk.getSdkConfiguration().getConfigRepository().getCustomServiceBasePath("platform");
    if (!configCustomBasePath.equals("")) {
      this.customBasePath = configCustomBasePath;
    }
  }

  public Entitlement(RequestRunner sdk, String customBasePath) {
    this.sdk = sdk;
    this.customBasePath = customBasePath;
  }

  /**
   * @see QueryEntitlements1
   */
  public QueryEntitlements1OpResponse queryEntitlements1(QueryEntitlements1 input)
      throws Exception {
    if (input.getCustomBasePath().equals("") && !customBasePath.equals("")) {
      input.setCustomBasePath(customBasePath);
    }

    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see QueryEntitlements
   */
  public QueryEntitlementsOpResponse queryEntitlements(QueryEntitlements input) throws Exception {
    if (input.getCustomBasePath().equals("") && !customBasePath.equals("")) {
      input.setCustomBasePath(customBasePath);
    }

    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see EnableEntitlementOriginFeature
   */
  public EnableEntitlementOriginFeatureOpResponse enableEntitlementOriginFeature(
      EnableEntitlementOriginFeature input) throws Exception {
    if (input.getCustomBasePath().equals("") && !customBasePath.equals("")) {
      input.setCustomBasePath(customBasePath);
    }

    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see GetEntitlementConfigInfo
   */
  public GetEntitlementConfigInfoOpResponse getEntitlementConfigInfo(GetEntitlementConfigInfo input)
      throws Exception {
    if (input.getCustomBasePath().equals("") && !customBasePath.equals("")) {
      input.setCustomBasePath(customBasePath);
    }

    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see GrantEntitlements
   */
  public GrantEntitlementsOpResponse grantEntitlements(GrantEntitlements input) throws Exception {
    if (input.getCustomBasePath().equals("") && !customBasePath.equals("")) {
      input.setCustomBasePath(customBasePath);
    }

    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see RevokeEntitlements
   */
  public RevokeEntitlementsOpResponse revokeEntitlements(RevokeEntitlements input)
      throws Exception {
    if (input.getCustomBasePath().equals("") && !customBasePath.equals("")) {
      input.setCustomBasePath(customBasePath);
    }

    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see GetEntitlement
   */
  public GetEntitlementOpResponse getEntitlement(GetEntitlement input) throws Exception {
    if (input.getCustomBasePath().equals("") && !customBasePath.equals("")) {
      input.setCustomBasePath(customBasePath);
    }

    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see GetPlatformEntitlementConfig
   */
  public GetPlatformEntitlementConfigOpResponse getPlatformEntitlementConfig(
      GetPlatformEntitlementConfig input) throws Exception {
    if (input.getCustomBasePath().equals("") && !customBasePath.equals("")) {
      input.setCustomBasePath(customBasePath);
    }

    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see UpdatePlatformEntitlementConfig
   */
  public UpdatePlatformEntitlementConfigOpResponse updatePlatformEntitlementConfig(
      UpdatePlatformEntitlementConfig input) throws Exception {
    if (input.getCustomBasePath().equals("") && !customBasePath.equals("")) {
      input.setCustomBasePath(customBasePath);
    }

    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see QueryUserEntitlements
   */
  public QueryUserEntitlementsOpResponse queryUserEntitlements(QueryUserEntitlements input)
      throws Exception {
    if (input.getCustomBasePath().equals("") && !customBasePath.equals("")) {
      input.setCustomBasePath(customBasePath);
    }

    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see GrantUserEntitlement
   */
  public GrantUserEntitlementOpResponse grantUserEntitlement(GrantUserEntitlement input)
      throws Exception {
    if (input.getCustomBasePath().equals("") && !customBasePath.equals("")) {
      input.setCustomBasePath(customBasePath);
    }

    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see GetUserAppEntitlementByAppId
   */
  public GetUserAppEntitlementByAppIdOpResponse getUserAppEntitlementByAppId(
      GetUserAppEntitlementByAppId input) throws Exception {
    if (input.getCustomBasePath().equals("") && !customBasePath.equals("")) {
      input.setCustomBasePath(customBasePath);
    }

    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see QueryUserEntitlementsByAppType
   */
  public QueryUserEntitlementsByAppTypeOpResponse queryUserEntitlementsByAppType(
      QueryUserEntitlementsByAppType input) throws Exception {
    if (input.getCustomBasePath().equals("") && !customBasePath.equals("")) {
      input.setCustomBasePath(customBasePath);
    }

    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see GetUserEntitlementsByIds
   */
  public GetUserEntitlementsByIdsOpResponse getUserEntitlementsByIds(GetUserEntitlementsByIds input)
      throws Exception {
    if (input.getCustomBasePath().equals("") && !customBasePath.equals("")) {
      input.setCustomBasePath(customBasePath);
    }

    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see GetUserEntitlementByItemId
   */
  public GetUserEntitlementByItemIdOpResponse getUserEntitlementByItemId(
      GetUserEntitlementByItemId input) throws Exception {
    if (input.getCustomBasePath().equals("") && !customBasePath.equals("")) {
      input.setCustomBasePath(customBasePath);
    }

    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see GetUserActiveEntitlementsByItemIds
   */
  public GetUserActiveEntitlementsByItemIdsOpResponse getUserActiveEntitlementsByItemIds(
      GetUserActiveEntitlementsByItemIds input) throws Exception {
    if (input.getCustomBasePath().equals("") && !customBasePath.equals("")) {
      input.setCustomBasePath(customBasePath);
    }

    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see GetUserEntitlementBySku
   */
  public GetUserEntitlementBySkuOpResponse getUserEntitlementBySku(GetUserEntitlementBySku input)
      throws Exception {
    if (input.getCustomBasePath().equals("") && !customBasePath.equals("")) {
      input.setCustomBasePath(customBasePath);
    }

    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see ExistsAnyUserActiveEntitlement
   */
  public ExistsAnyUserActiveEntitlementOpResponse existsAnyUserActiveEntitlement(
      ExistsAnyUserActiveEntitlement input) throws Exception {
    if (input.getCustomBasePath().equals("") && !customBasePath.equals("")) {
      input.setCustomBasePath(customBasePath);
    }

    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see ExistsAnyUserActiveEntitlementByItemIds
   */
  public ExistsAnyUserActiveEntitlementByItemIdsOpResponse existsAnyUserActiveEntitlementByItemIds(
      ExistsAnyUserActiveEntitlementByItemIds input) throws Exception {
    if (input.getCustomBasePath().equals("") && !customBasePath.equals("")) {
      input.setCustomBasePath(customBasePath);
    }

    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see GetUserAppEntitlementOwnershipByAppId
   */
  public GetUserAppEntitlementOwnershipByAppIdOpResponse getUserAppEntitlementOwnershipByAppId(
      GetUserAppEntitlementOwnershipByAppId input) throws Exception {
    if (input.getCustomBasePath().equals("") && !customBasePath.equals("")) {
      input.setCustomBasePath(customBasePath);
    }

    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see GetUserEntitlementOwnershipByItemId
   */
  public GetUserEntitlementOwnershipByItemIdOpResponse getUserEntitlementOwnershipByItemId(
      GetUserEntitlementOwnershipByItemId input) throws Exception {
    if (input.getCustomBasePath().equals("") && !customBasePath.equals("")) {
      input.setCustomBasePath(customBasePath);
    }

    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see GetUserEntitlementOwnershipByItemIds
   */
  public GetUserEntitlementOwnershipByItemIdsOpResponse getUserEntitlementOwnershipByItemIds(
      GetUserEntitlementOwnershipByItemIds input) throws Exception {
    if (input.getCustomBasePath().equals("") && !customBasePath.equals("")) {
      input.setCustomBasePath(customBasePath);
    }

    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see GetUserEntitlementOwnershipBySku
   */
  public GetUserEntitlementOwnershipBySkuOpResponse getUserEntitlementOwnershipBySku(
      GetUserEntitlementOwnershipBySku input) throws Exception {
    if (input.getCustomBasePath().equals("") && !customBasePath.equals("")) {
      input.setCustomBasePath(customBasePath);
    }

    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see RevokeAllEntitlements
   */
  public RevokeAllEntitlementsOpResponse revokeAllEntitlements(RevokeAllEntitlements input)
      throws Exception {
    if (input.getCustomBasePath().equals("") && !customBasePath.equals("")) {
      input.setCustomBasePath(customBasePath);
    }

    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see RevokeUserEntitlements
   */
  public RevokeUserEntitlementsOpResponse revokeUserEntitlements(RevokeUserEntitlements input)
      throws Exception {
    if (input.getCustomBasePath().equals("") && !customBasePath.equals("")) {
      input.setCustomBasePath(customBasePath);
    }

    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see GetUserEntitlement
   */
  public GetUserEntitlementOpResponse getUserEntitlement(GetUserEntitlement input)
      throws Exception {
    if (input.getCustomBasePath().equals("") && !customBasePath.equals("")) {
      input.setCustomBasePath(customBasePath);
    }

    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see UpdateUserEntitlement
   */
  public UpdateUserEntitlementOpResponse updateUserEntitlement(UpdateUserEntitlement input)
      throws Exception {
    if (input.getCustomBasePath().equals("") && !customBasePath.equals("")) {
      input.setCustomBasePath(customBasePath);
    }

    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see ConsumeUserEntitlement
   */
  public ConsumeUserEntitlementOpResponse consumeUserEntitlement(ConsumeUserEntitlement input)
      throws Exception {
    if (input.getCustomBasePath().equals("") && !customBasePath.equals("")) {
      input.setCustomBasePath(customBasePath);
    }

    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see DisableUserEntitlement
   */
  public DisableUserEntitlementOpResponse disableUserEntitlement(DisableUserEntitlement input)
      throws Exception {
    if (input.getCustomBasePath().equals("") && !customBasePath.equals("")) {
      input.setCustomBasePath(customBasePath);
    }

    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see EnableUserEntitlement
   */
  public EnableUserEntitlementOpResponse enableUserEntitlement(EnableUserEntitlement input)
      throws Exception {
    if (input.getCustomBasePath().equals("") && !customBasePath.equals("")) {
      input.setCustomBasePath(customBasePath);
    }

    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see GetUserEntitlementHistories
   */
  public GetUserEntitlementHistoriesOpResponse getUserEntitlementHistories(
      GetUserEntitlementHistories input) throws Exception {
    if (input.getCustomBasePath().equals("") && !customBasePath.equals("")) {
      input.setCustomBasePath(customBasePath);
    }

    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see RevokeUserEntitlement
   */
  public RevokeUserEntitlementOpResponse revokeUserEntitlement(RevokeUserEntitlement input)
      throws Exception {
    if (input.getCustomBasePath().equals("") && !customBasePath.equals("")) {
      input.setCustomBasePath(customBasePath);
    }

    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see RevokeUserEntitlementByUseCount
   */
  public RevokeUserEntitlementByUseCountOpResponse revokeUserEntitlementByUseCount(
      RevokeUserEntitlementByUseCount input) throws Exception {
    if (input.getCustomBasePath().equals("") && !customBasePath.equals("")) {
      input.setCustomBasePath(customBasePath);
    }

    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see PreCheckRevokeUserEntitlementByUseCount
   */
  public PreCheckRevokeUserEntitlementByUseCountOpResponse preCheckRevokeUserEntitlementByUseCount(
      PreCheckRevokeUserEntitlementByUseCount input) throws Exception {
    if (input.getCustomBasePath().equals("") && !customBasePath.equals("")) {
      input.setCustomBasePath(customBasePath);
    }

    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see RevokeUseCount
   * @deprecated
   */
  @Deprecated
  public RevokeUseCountOpResponse revokeUseCount(RevokeUseCount input) throws Exception {
    if (input.getCustomBasePath().equals("") && !customBasePath.equals("")) {
      input.setCustomBasePath(customBasePath);
    }

    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see SellUserEntitlement
   */
  public SellUserEntitlementOpResponse sellUserEntitlement(SellUserEntitlement input)
      throws Exception {
    if (input.getCustomBasePath().equals("") && !customBasePath.equals("")) {
      input.setCustomBasePath(customBasePath);
    }

    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see PublicExistsAnyMyActiveEntitlement
   */
  public PublicExistsAnyMyActiveEntitlementOpResponse publicExistsAnyMyActiveEntitlement(
      PublicExistsAnyMyActiveEntitlement input) throws Exception {
    if (input.getCustomBasePath().equals("") && !customBasePath.equals("")) {
      input.setCustomBasePath(customBasePath);
    }

    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see PublicGetMyAppEntitlementOwnershipByAppId
   */
  public PublicGetMyAppEntitlementOwnershipByAppIdOpResponse
      publicGetMyAppEntitlementOwnershipByAppId(PublicGetMyAppEntitlementOwnershipByAppId input)
          throws Exception {
    if (input.getCustomBasePath().equals("") && !customBasePath.equals("")) {
      input.setCustomBasePath(customBasePath);
    }

    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see PublicGetMyEntitlementOwnershipByItemId
   */
  public PublicGetMyEntitlementOwnershipByItemIdOpResponse publicGetMyEntitlementOwnershipByItemId(
      PublicGetMyEntitlementOwnershipByItemId input) throws Exception {
    if (input.getCustomBasePath().equals("") && !customBasePath.equals("")) {
      input.setCustomBasePath(customBasePath);
    }

    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see PublicGetMyEntitlementOwnershipBySku
   */
  public PublicGetMyEntitlementOwnershipBySkuOpResponse publicGetMyEntitlementOwnershipBySku(
      PublicGetMyEntitlementOwnershipBySku input) throws Exception {
    if (input.getCustomBasePath().equals("") && !customBasePath.equals("")) {
      input.setCustomBasePath(customBasePath);
    }

    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see PublicGetEntitlementOwnershipToken
   */
  public PublicGetEntitlementOwnershipTokenOpResponse publicGetEntitlementOwnershipToken(
      PublicGetEntitlementOwnershipToken input) throws Exception {
    if (input.getCustomBasePath().equals("") && !customBasePath.equals("")) {
      input.setCustomBasePath(customBasePath);
    }

    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see PublicQueryUserEntitlements
   */
  public PublicQueryUserEntitlementsOpResponse publicQueryUserEntitlements(
      PublicQueryUserEntitlements input) throws Exception {
    if (input.getCustomBasePath().equals("") && !customBasePath.equals("")) {
      input.setCustomBasePath(customBasePath);
    }

    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see PublicGetUserAppEntitlementByAppId
   */
  public PublicGetUserAppEntitlementByAppIdOpResponse publicGetUserAppEntitlementByAppId(
      PublicGetUserAppEntitlementByAppId input) throws Exception {
    if (input.getCustomBasePath().equals("") && !customBasePath.equals("")) {
      input.setCustomBasePath(customBasePath);
    }

    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see PublicQueryUserEntitlementsByAppType
   */
  public PublicQueryUserEntitlementsByAppTypeOpResponse publicQueryUserEntitlementsByAppType(
      PublicQueryUserEntitlementsByAppType input) throws Exception {
    if (input.getCustomBasePath().equals("") && !customBasePath.equals("")) {
      input.setCustomBasePath(customBasePath);
    }

    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see PublicGetUserEntitlementsByIds
   */
  public PublicGetUserEntitlementsByIdsOpResponse publicGetUserEntitlementsByIds(
      PublicGetUserEntitlementsByIds input) throws Exception {
    if (input.getCustomBasePath().equals("") && !customBasePath.equals("")) {
      input.setCustomBasePath(customBasePath);
    }

    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see PublicGetUserEntitlementByItemId
   * @deprecated
   */
  @Deprecated
  public PublicGetUserEntitlementByItemIdOpResponse publicGetUserEntitlementByItemId(
      PublicGetUserEntitlementByItemId input) throws Exception {
    if (input.getCustomBasePath().equals("") && !customBasePath.equals("")) {
      input.setCustomBasePath(customBasePath);
    }

    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see PublicGetUserEntitlementBySku
   * @deprecated
   */
  @Deprecated
  public PublicGetUserEntitlementBySkuOpResponse publicGetUserEntitlementBySku(
      PublicGetUserEntitlementBySku input) throws Exception {
    if (input.getCustomBasePath().equals("") && !customBasePath.equals("")) {
      input.setCustomBasePath(customBasePath);
    }

    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see PublicUserEntitlementHistory
   */
  public PublicUserEntitlementHistoryOpResponse publicUserEntitlementHistory(
      PublicUserEntitlementHistory input) throws Exception {
    if (input.getCustomBasePath().equals("") && !customBasePath.equals("")) {
      input.setCustomBasePath(customBasePath);
    }

    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see PublicExistsAnyUserActiveEntitlement
   */
  public PublicExistsAnyUserActiveEntitlementOpResponse publicExistsAnyUserActiveEntitlement(
      PublicExistsAnyUserActiveEntitlement input) throws Exception {
    if (input.getCustomBasePath().equals("") && !customBasePath.equals("")) {
      input.setCustomBasePath(customBasePath);
    }

    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see PublicGetUserAppEntitlementOwnershipByAppId
   */
  public PublicGetUserAppEntitlementOwnershipByAppIdOpResponse
      publicGetUserAppEntitlementOwnershipByAppId(PublicGetUserAppEntitlementOwnershipByAppId input)
          throws Exception {
    if (input.getCustomBasePath().equals("") && !customBasePath.equals("")) {
      input.setCustomBasePath(customBasePath);
    }

    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see PublicGetUserEntitlementOwnershipByItemId
   */
  public PublicGetUserEntitlementOwnershipByItemIdOpResponse
      publicGetUserEntitlementOwnershipByItemId(PublicGetUserEntitlementOwnershipByItemId input)
          throws Exception {
    if (input.getCustomBasePath().equals("") && !customBasePath.equals("")) {
      input.setCustomBasePath(customBasePath);
    }

    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see PublicGetUserEntitlementOwnershipByItemIds
   */
  public PublicGetUserEntitlementOwnershipByItemIdsOpResponse
      publicGetUserEntitlementOwnershipByItemIds(PublicGetUserEntitlementOwnershipByItemIds input)
          throws Exception {
    if (input.getCustomBasePath().equals("") && !customBasePath.equals("")) {
      input.setCustomBasePath(customBasePath);
    }

    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see PublicGetUserEntitlementOwnershipBySku
   */
  public PublicGetUserEntitlementOwnershipBySkuOpResponse publicGetUserEntitlementOwnershipBySku(
      PublicGetUserEntitlementOwnershipBySku input) throws Exception {
    if (input.getCustomBasePath().equals("") && !customBasePath.equals("")) {
      input.setCustomBasePath(customBasePath);
    }

    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see PublicGetUserEntitlement
   */
  public PublicGetUserEntitlementOpResponse publicGetUserEntitlement(PublicGetUserEntitlement input)
      throws Exception {
    if (input.getCustomBasePath().equals("") && !customBasePath.equals("")) {
      input.setCustomBasePath(customBasePath);
    }

    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see PublicConsumeUserEntitlement
   */
  public PublicConsumeUserEntitlementOpResponse publicConsumeUserEntitlement(
      PublicConsumeUserEntitlement input) throws Exception {
    if (input.getCustomBasePath().equals("") && !customBasePath.equals("")) {
      input.setCustomBasePath(customBasePath);
    }

    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see PublicSellUserEntitlement
   */
  public PublicSellUserEntitlementOpResponse publicSellUserEntitlement(
      PublicSellUserEntitlement input) throws Exception {
    if (input.getCustomBasePath().equals("") && !customBasePath.equals("")) {
      input.setCustomBasePath(customBasePath);
    }

    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see PublicSplitUserEntitlement
   */
  public PublicSplitUserEntitlementOpResponse publicSplitUserEntitlement(
      PublicSplitUserEntitlement input) throws Exception {
    if (input.getCustomBasePath().equals("") && !customBasePath.equals("")) {
      input.setCustomBasePath(customBasePath);
    }

    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see PublicTransferUserEntitlement
   */
  public PublicTransferUserEntitlementOpResponse publicTransferUserEntitlement(
      PublicTransferUserEntitlement input) throws Exception {
    if (input.getCustomBasePath().equals("") && !customBasePath.equals("")) {
      input.setCustomBasePath(customBasePath);
    }

    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }
}
