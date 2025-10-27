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
import net.accelbyte.sdk.api.legal.operation_responses.localized_policy_versions.*;
import net.accelbyte.sdk.api.legal.operations.localized_policy_versions.*;
import net.accelbyte.sdk.core.HttpResponse;
import net.accelbyte.sdk.core.RequestRunner;

public class LocalizedPolicyVersions {

  private RequestRunner sdk;
  private String customBasePath = "";

  public LocalizedPolicyVersions(RequestRunner sdk) {
    this.sdk = sdk;
    String configCustomBasePath =
        sdk.getSdkConfiguration().getConfigRepository().getCustomServiceBasePath("legal");
    if (!configCustomBasePath.equals("")) {
      this.customBasePath = configCustomBasePath;
    }
  }

  public LocalizedPolicyVersions(RequestRunner sdk, String customBasePath) {
    this.sdk = sdk;
    this.customBasePath = customBasePath;
  }

  /**
   * @see OldRetrieveLocalizedPolicyVersions
   */
  public OldRetrieveLocalizedPolicyVersionsOpResponse oldRetrieveLocalizedPolicyVersions(
      OldRetrieveLocalizedPolicyVersions input) throws Exception {
    if (input.getCustomBasePath().equals("") && !customBasePath.equals("")) {
      input.setCustomBasePath(customBasePath);
    }

    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see OldCreateLocalizedPolicyVersion
   */
  public OldCreateLocalizedPolicyVersionOpResponse oldCreateLocalizedPolicyVersion(
      OldCreateLocalizedPolicyVersion input) throws Exception {
    if (input.getCustomBasePath().equals("") && !customBasePath.equals("")) {
      input.setCustomBasePath(customBasePath);
    }

    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see OldRetrieveSingleLocalizedPolicyVersion
   */
  public OldRetrieveSingleLocalizedPolicyVersionOpResponse oldRetrieveSingleLocalizedPolicyVersion(
      OldRetrieveSingleLocalizedPolicyVersion input) throws Exception {
    if (input.getCustomBasePath().equals("") && !customBasePath.equals("")) {
      input.setCustomBasePath(customBasePath);
    }

    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see OldUpdateLocalizedPolicyVersion
   */
  public OldUpdateLocalizedPolicyVersionOpResponse oldUpdateLocalizedPolicyVersion(
      OldUpdateLocalizedPolicyVersion input) throws Exception {
    if (input.getCustomBasePath().equals("") && !customBasePath.equals("")) {
      input.setCustomBasePath(customBasePath);
    }

    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see OldRequestPresignedURL
   */
  public OldRequestPresignedURLOpResponse oldRequestPresignedURL(OldRequestPresignedURL input)
      throws Exception {
    if (input.getCustomBasePath().equals("") && !customBasePath.equals("")) {
      input.setCustomBasePath(customBasePath);
    }

    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see OldSetDefaultLocalizedPolicy
   */
  public OldSetDefaultLocalizedPolicyOpResponse oldSetDefaultLocalizedPolicy(
      OldSetDefaultLocalizedPolicy input) throws Exception {
    if (input.getCustomBasePath().equals("") && !customBasePath.equals("")) {
      input.setCustomBasePath(customBasePath);
    }

    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see OldPublicRetrieveSingleLocalizedPolicyVersion
   */
  public OldPublicRetrieveSingleLocalizedPolicyVersionOpResponse
      oldPublicRetrieveSingleLocalizedPolicyVersion(
          OldPublicRetrieveSingleLocalizedPolicyVersion input) throws Exception {
    if (input.getCustomBasePath().equals("") && !customBasePath.equals("")) {
      input.setCustomBasePath(customBasePath);
    }

    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }
}
