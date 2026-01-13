/*
 * Copyright (c) 2024 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.csm.wrappers;

import net.accelbyte.sdk.api.csm.models.*;
import net.accelbyte.sdk.api.csm.operation_responses.managed_resources.*;
import net.accelbyte.sdk.api.csm.operations.managed_resources.*;
import net.accelbyte.sdk.core.HttpResponse;
import net.accelbyte.sdk.core.RequestRunner;

public class ManagedResources {

  private RequestRunner sdk;
  private String customBasePath = "";

  public ManagedResources(RequestRunner sdk) {
    this.sdk = sdk;
    String configCustomBasePath =
        sdk.getSdkConfiguration().getConfigRepository().getCustomServiceBasePath("csm");
    if (!configCustomBasePath.equals("")) {
      this.customBasePath = configCustomBasePath;
    }
  }

  public ManagedResources(RequestRunner sdk, String customBasePath) {
    this.sdk = sdk;
    this.customBasePath = customBasePath;
  }

  /**
   * @see CreateNoSQLDatabaseCredentialV2
   */
  public CreateNoSQLDatabaseCredentialV2OpResponse createNoSQLDatabaseCredentialV2(
      CreateNoSQLDatabaseCredentialV2 input) throws Exception {
    if (input.getCustomBasePath().equals("") && !customBasePath.equals("")) {
      input.setCustomBasePath(customBasePath);
    }

    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see GetNoSQLDatabaseV2
   */
  public GetNoSQLDatabaseV2OpResponse getNoSQLDatabaseV2(GetNoSQLDatabaseV2 input)
      throws Exception {
    if (input.getCustomBasePath().equals("") && !customBasePath.equals("")) {
      input.setCustomBasePath(customBasePath);
    }

    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see CreateNoSQLDatabaseV2
   */
  public CreateNoSQLDatabaseV2OpResponse createNoSQLDatabaseV2(CreateNoSQLDatabaseV2 input)
      throws Exception {
    if (input.getCustomBasePath().equals("") && !customBasePath.equals("")) {
      input.setCustomBasePath(customBasePath);
    }

    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see DeleteNoSQLDatabaseV2
   */
  public DeleteNoSQLDatabaseV2OpResponse deleteNoSQLDatabaseV2(DeleteNoSQLDatabaseV2 input)
      throws Exception {
    if (input.getCustomBasePath().equals("") && !customBasePath.equals("")) {
      input.setCustomBasePath(customBasePath);
    }

    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see GetNoSQLClusterV2
   */
  public GetNoSQLClusterV2OpResponse getNoSQLClusterV2(GetNoSQLClusterV2 input) throws Exception {
    if (input.getCustomBasePath().equals("") && !customBasePath.equals("")) {
      input.setCustomBasePath(customBasePath);
    }

    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see UpdateNoSQLClusterV2
   */
  public UpdateNoSQLClusterV2OpResponse updateNoSQLClusterV2(UpdateNoSQLClusterV2 input)
      throws Exception {
    if (input.getCustomBasePath().equals("") && !customBasePath.equals("")) {
      input.setCustomBasePath(customBasePath);
    }

    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see CreateNoSQLClusterV2
   */
  public CreateNoSQLClusterV2OpResponse createNoSQLClusterV2(CreateNoSQLClusterV2 input)
      throws Exception {
    if (input.getCustomBasePath().equals("") && !customBasePath.equals("")) {
      input.setCustomBasePath(customBasePath);
    }

    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see DeleteNoSQLClusterV2
   */
  public DeleteNoSQLClusterV2OpResponse deleteNoSQLClusterV2(DeleteNoSQLClusterV2 input)
      throws Exception {
    if (input.getCustomBasePath().equals("") && !customBasePath.equals("")) {
      input.setCustomBasePath(customBasePath);
    }

    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see StartNoSQLClusterV2
   */
  public StartNoSQLClusterV2OpResponse startNoSQLClusterV2(StartNoSQLClusterV2 input)
      throws Exception {
    if (input.getCustomBasePath().equals("") && !customBasePath.equals("")) {
      input.setCustomBasePath(customBasePath);
    }

    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see StopNoSQLClusterV2
   */
  public StopNoSQLClusterV2OpResponse stopNoSQLClusterV2(StopNoSQLClusterV2 input)
      throws Exception {
    if (input.getCustomBasePath().equals("") && !customBasePath.equals("")) {
      input.setCustomBasePath(customBasePath);
    }

    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see GetNoSQLAccessTunnelV2
   */
  public GetNoSQLAccessTunnelV2OpResponse getNoSQLAccessTunnelV2(GetNoSQLAccessTunnelV2 input)
      throws Exception {
    if (input.getCustomBasePath().equals("") && !customBasePath.equals("")) {
      input.setCustomBasePath(customBasePath);
    }

    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see GetNoSQLAppListV2
   */
  public GetNoSQLAppListV2OpResponse getNoSQLAppListV2(GetNoSQLAppListV2 input) throws Exception {
    if (input.getCustomBasePath().equals("") && !customBasePath.equals("")) {
      input.setCustomBasePath(customBasePath);
    }

    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }
}
