/*
 * Copyright (c) 2024 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.gdpr.wrappers;

import net.accelbyte.sdk.api.gdpr.models.*;
import net.accelbyte.sdk.api.gdpr.operation_responses.platform_account_closure_client.*;
import net.accelbyte.sdk.api.gdpr.operations.platform_account_closure_client.*;
import net.accelbyte.sdk.core.HttpResponse;
import net.accelbyte.sdk.core.RequestRunner;

public class PlatformAccountClosureClient {

  private RequestRunner sdk;
  private String customBasePath = "";

  public PlatformAccountClosureClient(RequestRunner sdk) {
    this.sdk = sdk;
    String configCustomBasePath =
        sdk.getSdkConfiguration().getConfigRepository().getCustomServiceBasePath("gdpr");
    if (!configCustomBasePath.equals("")) {
      this.customBasePath = configCustomBasePath;
    }
  }

  public PlatformAccountClosureClient(RequestRunner sdk, String customBasePath) {
    this.sdk = sdk;
    this.customBasePath = customBasePath;
  }

  /**
   * @see AdminGetPlatformAccountClosureClients
   */
  public AdminGetPlatformAccountClosureClientsOpResponse adminGetPlatformAccountClosureClients(
      AdminGetPlatformAccountClosureClients input) throws Exception {
    if (input.getCustomBasePath().equals("") && !customBasePath.equals("")) {
      input.setCustomBasePath(customBasePath);
    }

    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see AdminValidateXboxBPCertFile
   */
  public AdminValidateXboxBPCertFileOpResponse adminValidateXboxBPCertFile(
      AdminValidateXboxBPCertFile input) throws Exception {
    if (input.getCustomBasePath().equals("") && !customBasePath.equals("")) {
      input.setCustomBasePath(customBasePath);
    }

    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see AdminGetPlatformAccountClosureClient
   */
  public AdminGetPlatformAccountClosureClientOpResponse adminGetPlatformAccountClosureClient(
      AdminGetPlatformAccountClosureClient input) throws Exception {
    if (input.getCustomBasePath().equals("") && !customBasePath.equals("")) {
      input.setCustomBasePath(customBasePath);
    }

    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see AdminUpdatePlatformAccountClosureClient
   */
  public AdminUpdatePlatformAccountClosureClientOpResponse adminUpdatePlatformAccountClosureClient(
      AdminUpdatePlatformAccountClosureClient input) throws Exception {
    if (input.getCustomBasePath().equals("") && !customBasePath.equals("")) {
      input.setCustomBasePath(customBasePath);
    }

    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see AdminDeletePlatformAccountClosureClient
   */
  public AdminDeletePlatformAccountClosureClientOpResponse adminDeletePlatformAccountClosureClient(
      AdminDeletePlatformAccountClosureClient input) throws Exception {
    if (input.getCustomBasePath().equals("") && !customBasePath.equals("")) {
      input.setCustomBasePath(customBasePath);
    }

    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see AdminMockPlatformAccountClosureData
   */
  public AdminMockPlatformAccountClosureDataOpResponse adminMockPlatformAccountClosureData(
      AdminMockPlatformAccountClosureData input) throws Exception {
    if (input.getCustomBasePath().equals("") && !customBasePath.equals("")) {
      input.setCustomBasePath(customBasePath);
    }

    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }
}
