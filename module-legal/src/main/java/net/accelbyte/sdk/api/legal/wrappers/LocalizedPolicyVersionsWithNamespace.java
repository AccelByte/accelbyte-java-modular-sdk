/*
 * Copyright (c) 2024 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.legal.wrappers;

import java.util.*;
import net.accelbyte.sdk.api.legal.models.*;
import net.accelbyte.sdk.api.legal.operation_responses.localized_policy_versions_with_namespace.*;
import net.accelbyte.sdk.api.legal.operations.localized_policy_versions_with_namespace.*;
import net.accelbyte.sdk.core.HttpResponse;
import net.accelbyte.sdk.core.RequestRunner;

public class LocalizedPolicyVersionsWithNamespace {

  private RequestRunner sdk;
  private String customBasePath = "";

  public LocalizedPolicyVersionsWithNamespace(RequestRunner sdk) {
    this.sdk = sdk;
    String configCustomBasePath =
        sdk.getSdkConfiguration().getConfigRepository().getCustomServiceBasePath("legal");
    if (!configCustomBasePath.equals("")) {
      this.customBasePath = configCustomBasePath;
    }
  }

  public LocalizedPolicyVersionsWithNamespace(RequestRunner sdk, String customBasePath) {
    this.sdk = sdk;
    this.customBasePath = customBasePath;
  }

  /**
   * @see DeleteLocalizedPolicy
   */
  public DeleteLocalizedPolicyOpResponse deleteLocalizedPolicy(DeleteLocalizedPolicy input)
      throws Exception {
    if (input.getCustomBasePath().equals("") && !customBasePath.equals("")) {
      input.setCustomBasePath(customBasePath);
    }

    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see RetrieveLocalizedPolicyVersions
   */
  public RetrieveLocalizedPolicyVersionsOpResponse retrieveLocalizedPolicyVersions(
      RetrieveLocalizedPolicyVersions input) throws Exception {
    if (input.getCustomBasePath().equals("") && !customBasePath.equals("")) {
      input.setCustomBasePath(customBasePath);
    }

    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see CreateLocalizedPolicyVersion
   */
  public CreateLocalizedPolicyVersionOpResponse createLocalizedPolicyVersion(
      CreateLocalizedPolicyVersion input) throws Exception {
    if (input.getCustomBasePath().equals("") && !customBasePath.equals("")) {
      input.setCustomBasePath(customBasePath);
    }

    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see RetrieveSingleLocalizedPolicyVersion
   */
  public RetrieveSingleLocalizedPolicyVersionOpResponse retrieveSingleLocalizedPolicyVersion(
      RetrieveSingleLocalizedPolicyVersion input) throws Exception {
    if (input.getCustomBasePath().equals("") && !customBasePath.equals("")) {
      input.setCustomBasePath(customBasePath);
    }

    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see UpdateLocalizedPolicyVersion
   */
  public UpdateLocalizedPolicyVersionOpResponse updateLocalizedPolicyVersion(
      UpdateLocalizedPolicyVersion input) throws Exception {
    if (input.getCustomBasePath().equals("") && !customBasePath.equals("")) {
      input.setCustomBasePath(customBasePath);
    }

    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see RequestPresignedURL
   */
  public RequestPresignedURLOpResponse requestPresignedURL(RequestPresignedURL input)
      throws Exception {
    if (input.getCustomBasePath().equals("") && !customBasePath.equals("")) {
      input.setCustomBasePath(customBasePath);
    }

    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see SetDefaultLocalizedPolicy
   */
  public SetDefaultLocalizedPolicyOpResponse setDefaultLocalizedPolicy(
      SetDefaultLocalizedPolicy input) throws Exception {
    if (input.getCustomBasePath().equals("") && !customBasePath.equals("")) {
      input.setCustomBasePath(customBasePath);
    }

    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see PublicRetrieveSingleLocalizedPolicyVersion
   */
  public PublicRetrieveSingleLocalizedPolicyVersionOpResponse
      publicRetrieveSingleLocalizedPolicyVersion(PublicRetrieveSingleLocalizedPolicyVersion input)
          throws Exception {
    if (input.getCustomBasePath().equals("") && !customBasePath.equals("")) {
      input.setCustomBasePath(customBasePath);
    }

    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }
}
