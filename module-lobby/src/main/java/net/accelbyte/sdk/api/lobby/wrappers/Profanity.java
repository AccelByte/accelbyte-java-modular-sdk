/*
 * Copyright (c) 2024 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.lobby.wrappers;

import java.util.*;
import net.accelbyte.sdk.api.lobby.models.*;
import net.accelbyte.sdk.api.lobby.operation_responses.profanity.*;
import net.accelbyte.sdk.api.lobby.operations.profanity.*;
import net.accelbyte.sdk.core.HttpResponse;
import net.accelbyte.sdk.core.RequestRunner;

public class Profanity {

  private RequestRunner sdk;
  private String customBasePath = "";

  public Profanity(RequestRunner sdk) {
    this.sdk = sdk;
    String configCustomBasePath =
        sdk.getSdkConfiguration().getConfigRepository().getCustomServiceBasePath("lobby");
    if (!configCustomBasePath.equals("")) {
      this.customBasePath = configCustomBasePath;
    }
  }

  public Profanity(RequestRunner sdk, String customBasePath) {
    this.sdk = sdk;
    this.customBasePath = customBasePath;
  }

  /**
   * @see AdminDebugProfanityFilters
   * @deprecated
   */
  @Deprecated
  public AdminDebugProfanityFiltersOpResponse adminDebugProfanityFilters(
      AdminDebugProfanityFilters input) throws Exception {
    if (input.getCustomBasePath().equals("") && !customBasePath.equals("")) {
      input.setCustomBasePath(customBasePath);
    }

    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see AdminGetProfanityListFiltersV1
   * @deprecated
   */
  @Deprecated
  public AdminGetProfanityListFiltersV1OpResponse adminGetProfanityListFiltersV1(
      AdminGetProfanityListFiltersV1 input) throws Exception {
    if (input.getCustomBasePath().equals("") && !customBasePath.equals("")) {
      input.setCustomBasePath(customBasePath);
    }

    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see AdminAddProfanityFilterIntoList
   * @deprecated
   */
  @Deprecated
  public AdminAddProfanityFilterIntoListOpResponse adminAddProfanityFilterIntoList(
      AdminAddProfanityFilterIntoList input) throws Exception {
    if (input.getCustomBasePath().equals("") && !customBasePath.equals("")) {
      input.setCustomBasePath(customBasePath);
    }

    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see AdminAddProfanityFilters
   * @deprecated
   */
  @Deprecated
  public AdminAddProfanityFiltersOpResponse adminAddProfanityFilters(AdminAddProfanityFilters input)
      throws Exception {
    if (input.getCustomBasePath().equals("") && !customBasePath.equals("")) {
      input.setCustomBasePath(customBasePath);
    }

    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see AdminImportProfanityFiltersFromFile
   * @deprecated
   */
  @Deprecated
  public AdminImportProfanityFiltersFromFileOpResponse adminImportProfanityFiltersFromFile(
      AdminImportProfanityFiltersFromFile input) throws Exception {
    if (input.getCustomBasePath().equals("") && !customBasePath.equals("")) {
      input.setCustomBasePath(customBasePath);
    }

    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see AdminDeleteProfanityFilter
   * @deprecated
   */
  @Deprecated
  public AdminDeleteProfanityFilterOpResponse adminDeleteProfanityFilter(
      AdminDeleteProfanityFilter input) throws Exception {
    if (input.getCustomBasePath().equals("") && !customBasePath.equals("")) {
      input.setCustomBasePath(customBasePath);
    }

    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see AdminGetProfanityLists
   * @deprecated
   */
  @Deprecated
  public AdminGetProfanityListsOpResponse adminGetProfanityLists(AdminGetProfanityLists input)
      throws Exception {
    if (input.getCustomBasePath().equals("") && !customBasePath.equals("")) {
      input.setCustomBasePath(customBasePath);
    }

    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see AdminCreateProfanityList
   * @deprecated
   */
  @Deprecated
  public AdminCreateProfanityListOpResponse adminCreateProfanityList(AdminCreateProfanityList input)
      throws Exception {
    if (input.getCustomBasePath().equals("") && !customBasePath.equals("")) {
      input.setCustomBasePath(customBasePath);
    }

    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see AdminUpdateProfanityList
   * @deprecated
   */
  @Deprecated
  public AdminUpdateProfanityListOpResponse adminUpdateProfanityList(AdminUpdateProfanityList input)
      throws Exception {
    if (input.getCustomBasePath().equals("") && !customBasePath.equals("")) {
      input.setCustomBasePath(customBasePath);
    }

    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see AdminDeleteProfanityList
   * @deprecated
   */
  @Deprecated
  public AdminDeleteProfanityListOpResponse adminDeleteProfanityList(AdminDeleteProfanityList input)
      throws Exception {
    if (input.getCustomBasePath().equals("") && !customBasePath.equals("")) {
      input.setCustomBasePath(customBasePath);
    }

    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see AdminGetProfanityRule
   * @deprecated
   */
  @Deprecated
  public AdminGetProfanityRuleOpResponse adminGetProfanityRule(AdminGetProfanityRule input)
      throws Exception {
    if (input.getCustomBasePath().equals("") && !customBasePath.equals("")) {
      input.setCustomBasePath(customBasePath);
    }

    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see AdminSetProfanityRuleForNamespace
   * @deprecated
   */
  @Deprecated
  public AdminSetProfanityRuleForNamespaceOpResponse adminSetProfanityRuleForNamespace(
      AdminSetProfanityRuleForNamespace input) throws Exception {
    if (input.getCustomBasePath().equals("") && !customBasePath.equals("")) {
      input.setCustomBasePath(customBasePath);
    }

    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see AdminVerifyMessageProfanityResponse
   * @deprecated
   */
  @Deprecated
  public AdminVerifyMessageProfanityResponseOpResponse adminVerifyMessageProfanityResponse(
      AdminVerifyMessageProfanityResponse input) throws Exception {
    if (input.getCustomBasePath().equals("") && !customBasePath.equals("")) {
      input.setCustomBasePath(customBasePath);
    }

    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }
}
