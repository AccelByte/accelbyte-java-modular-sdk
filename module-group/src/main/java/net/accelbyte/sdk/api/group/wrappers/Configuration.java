/*
 * Copyright (c) 2024 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.group.wrappers;

import net.accelbyte.sdk.api.group.models.*;
import net.accelbyte.sdk.api.group.operation_responses.configuration.*;
import net.accelbyte.sdk.api.group.operations.configuration.*;
import net.accelbyte.sdk.core.HttpResponse;
import net.accelbyte.sdk.core.RequestRunner;

public class Configuration {

  private RequestRunner sdk;
  private String customBasePath = "";

  public Configuration(RequestRunner sdk) {
    this.sdk = sdk;
    String configCustomBasePath =
        sdk.getSdkConfiguration().getConfigRepository().getCustomServiceBasePath("group");
    if (!configCustomBasePath.equals("")) {
      this.customBasePath = configCustomBasePath;
    }
  }

  public Configuration(RequestRunner sdk, String customBasePath) {
    this.sdk = sdk;
    this.customBasePath = customBasePath;
  }

  /**
   * @see ListGroupConfigurationAdminV1
   */
  public ListGroupConfigurationAdminV1OpResponse listGroupConfigurationAdminV1(
      ListGroupConfigurationAdminV1 input) throws Exception {
    if (input.getCustomBasePath().equals("") && !customBasePath.equals("")) {
      input.setCustomBasePath(customBasePath);
    }

    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see CreateGroupConfigurationAdminV1
   */
  public CreateGroupConfigurationAdminV1OpResponse createGroupConfigurationAdminV1(
      CreateGroupConfigurationAdminV1 input) throws Exception {
    if (input.getCustomBasePath().equals("") && !customBasePath.equals("")) {
      input.setCustomBasePath(customBasePath);
    }

    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see InitiateGroupConfigurationAdminV1
   */
  public InitiateGroupConfigurationAdminV1OpResponse initiateGroupConfigurationAdminV1(
      InitiateGroupConfigurationAdminV1 input) throws Exception {
    if (input.getCustomBasePath().equals("") && !customBasePath.equals("")) {
      input.setCustomBasePath(customBasePath);
    }

    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see GetGroupConfigurationAdminV1
   */
  public GetGroupConfigurationAdminV1OpResponse getGroupConfigurationAdminV1(
      GetGroupConfigurationAdminV1 input) throws Exception {
    if (input.getCustomBasePath().equals("") && !customBasePath.equals("")) {
      input.setCustomBasePath(customBasePath);
    }

    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see DeleteGroupConfigurationV1
   */
  public DeleteGroupConfigurationV1OpResponse deleteGroupConfigurationV1(
      DeleteGroupConfigurationV1 input) throws Exception {
    if (input.getCustomBasePath().equals("") && !customBasePath.equals("")) {
      input.setCustomBasePath(customBasePath);
    }

    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see UpdateGroupConfigurationAdminV1
   */
  public UpdateGroupConfigurationAdminV1OpResponse updateGroupConfigurationAdminV1(
      UpdateGroupConfigurationAdminV1 input) throws Exception {
    if (input.getCustomBasePath().equals("") && !customBasePath.equals("")) {
      input.setCustomBasePath(customBasePath);
    }

    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see UpdateGroupConfigurationGlobalRuleAdminV1
   */
  public UpdateGroupConfigurationGlobalRuleAdminV1OpResponse
      updateGroupConfigurationGlobalRuleAdminV1(UpdateGroupConfigurationGlobalRuleAdminV1 input)
          throws Exception {
    if (input.getCustomBasePath().equals("") && !customBasePath.equals("")) {
      input.setCustomBasePath(customBasePath);
    }

    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see DeleteGroupConfigurationGlobalRuleAdminV1
   */
  public DeleteGroupConfigurationGlobalRuleAdminV1OpResponse
      deleteGroupConfigurationGlobalRuleAdminV1(DeleteGroupConfigurationGlobalRuleAdminV1 input)
          throws Exception {
    if (input.getCustomBasePath().equals("") && !customBasePath.equals("")) {
      input.setCustomBasePath(customBasePath);
    }

    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }
}
