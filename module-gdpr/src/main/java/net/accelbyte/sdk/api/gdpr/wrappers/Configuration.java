/*
 * Copyright (c) 2024 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.gdpr.wrappers;

import java.util.*;
import net.accelbyte.sdk.api.gdpr.models.*;
import net.accelbyte.sdk.api.gdpr.operation_responses.configuration.*;
import net.accelbyte.sdk.api.gdpr.operations.configuration.*;
import net.accelbyte.sdk.core.HttpResponse;
import net.accelbyte.sdk.core.RequestRunner;

public class Configuration {

  private RequestRunner sdk;
  private String customBasePath = "";

  public Configuration(RequestRunner sdk) {
    this.sdk = sdk;
    String configCustomBasePath =
        sdk.getSdkConfiguration().getConfigRepository().getCustomServiceBasePath("gdpr");
    if (!configCustomBasePath.equals("")) {
      this.customBasePath = configCustomBasePath;
    }
  }

  public Configuration(RequestRunner sdk, String customBasePath) {
    this.sdk = sdk;
    this.customBasePath = customBasePath;
  }

  /**
   * @see GetAdminEmailConfiguration
   */
  public GetAdminEmailConfigurationOpResponse getAdminEmailConfiguration(
      GetAdminEmailConfiguration input) throws Exception {
    if (input.getCustomBasePath().equals("") && !customBasePath.equals("")) {
      input.setCustomBasePath(customBasePath);
    }

    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see UpdateAdminEmailConfiguration
   */
  public UpdateAdminEmailConfigurationOpResponse updateAdminEmailConfiguration(
      UpdateAdminEmailConfiguration input) throws Exception {
    if (input.getCustomBasePath().equals("") && !customBasePath.equals("")) {
      input.setCustomBasePath(customBasePath);
    }

    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see SaveAdminEmailConfiguration
   */
  public SaveAdminEmailConfigurationOpResponse saveAdminEmailConfiguration(
      SaveAdminEmailConfiguration input) throws Exception {
    if (input.getCustomBasePath().equals("") && !customBasePath.equals("")) {
      input.setCustomBasePath(customBasePath);
    }

    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see DeleteAdminEmailConfiguration
   */
  public DeleteAdminEmailConfigurationOpResponse deleteAdminEmailConfiguration(
      DeleteAdminEmailConfiguration input) throws Exception {
    if (input.getCustomBasePath().equals("") && !customBasePath.equals("")) {
      input.setCustomBasePath(customBasePath);
    }

    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see AdminGetServicesConfiguration
   */
  public AdminGetServicesConfigurationOpResponse adminGetServicesConfiguration(
      AdminGetServicesConfiguration input) throws Exception {
    if (input.getCustomBasePath().equals("") && !customBasePath.equals("")) {
      input.setCustomBasePath(customBasePath);
    }

    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see AdminUpdateServicesConfiguration
   */
  public AdminUpdateServicesConfigurationOpResponse adminUpdateServicesConfiguration(
      AdminUpdateServicesConfiguration input) throws Exception {
    if (input.getCustomBasePath().equals("") && !customBasePath.equals("")) {
      input.setCustomBasePath(customBasePath);
    }

    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see AdminResetServicesConfiguration
   */
  public AdminResetServicesConfigurationOpResponse adminResetServicesConfiguration(
      AdminResetServicesConfiguration input) throws Exception {
    if (input.getCustomBasePath().equals("") && !customBasePath.equals("")) {
      input.setCustomBasePath(customBasePath);
    }

    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see AdminGetPlatformAccountClosureServicesConfiguration
   */
  public AdminGetPlatformAccountClosureServicesConfigurationOpResponse
      adminGetPlatformAccountClosureServicesConfiguration(
          AdminGetPlatformAccountClosureServicesConfiguration input) throws Exception {
    if (input.getCustomBasePath().equals("") && !customBasePath.equals("")) {
      input.setCustomBasePath(customBasePath);
    }

    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see AdminUpdatePlatformAccountClosureServicesConfiguration
   */
  public AdminUpdatePlatformAccountClosureServicesConfigurationOpResponse
      adminUpdatePlatformAccountClosureServicesConfiguration(
          AdminUpdatePlatformAccountClosureServicesConfiguration input) throws Exception {
    if (input.getCustomBasePath().equals("") && !customBasePath.equals("")) {
      input.setCustomBasePath(customBasePath);
    }

    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see AdminResetPlatformAccountClosureServicesConfiguration
   */
  public AdminResetPlatformAccountClosureServicesConfigurationOpResponse
      adminResetPlatformAccountClosureServicesConfiguration(
          AdminResetPlatformAccountClosureServicesConfiguration input) throws Exception {
    if (input.getCustomBasePath().equals("") && !customBasePath.equals("")) {
      input.setCustomBasePath(customBasePath);
    }

    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }
}
