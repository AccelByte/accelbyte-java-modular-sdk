/*
 * Copyright (c) 2024 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.inventory.operations.admin_integration_configurations;

import java.io.*;
import java.util.*;
import lombok.Builder;
import lombok.Getter;
import lombok.Setter;
import net.accelbyte.sdk.api.inventory.models.*;
import net.accelbyte.sdk.core.HttpResponseException;
import net.accelbyte.sdk.core.Operation;
import net.accelbyte.sdk.core.util.Helper;

/**
 * AdminUpdateStatusIntegrationConfiguration
 *
 * <p>to update status integration configuration to be Active / Not Active. There cannot be
 * duplicate serviceName per namespace.
 *
 * <p>Permission: ADMIN:NAMESPACE:{namespace}:INVENTORY:INTEGRATIONCONFIGURATION [UPDATE]
 */
@Getter
@Setter
public class AdminUpdateStatusIntegrationConfiguration extends Operation {
  /** generated field's value */
  private String path =
      "/inventory/v1/admin/namespaces/{namespace}/integrationConfigurations/{integrationConfigurationId}/status";

  private String customBasePath = "";
  private String method = "PUT";
  private List<String> consumes = Arrays.asList("application/json");
  private List<String> produces = Arrays.asList("application/json");
  private String locationQuery = null;

  /** fields as input parameter */
  private String integrationConfigurationId;

  private String namespace;
  private ApimodelsUpdateStatusIntegrationConfigurationReq body;

  /**
   * @param integrationConfigurationId required
   * @param namespace required
   * @param body required
   */
  @Builder
  // @deprecated 2022-08-29 - All args constructor may cause problems. Use builder instead.
  @Deprecated
  public AdminUpdateStatusIntegrationConfiguration(
      String customBasePath,
      String integrationConfigurationId,
      String namespace,
      ApimodelsUpdateStatusIntegrationConfigurationReq body) {
    this.integrationConfigurationId = integrationConfigurationId;
    this.namespace = namespace;
    this.body = body;
    this.customBasePath = customBasePath;

    securities.add("Bearer");
  }

  @Override
  public Map<String, String> getPathParams() {
    Map<String, String> pathParams = new HashMap<>();
    if (this.integrationConfigurationId != null) {
      pathParams.put("integrationConfigurationId", this.integrationConfigurationId);
    }
    if (this.namespace != null) {
      pathParams.put("namespace", this.namespace);
    }
    return pathParams;
  }

  @Override
  public ApimodelsUpdateStatusIntegrationConfigurationReq getBodyParams() {
    return this.body;
  }

  @Override
  public boolean isValid() {
    if (this.integrationConfigurationId == null) {
      return false;
    }
    if (this.namespace == null) {
      return false;
    }
    return true;
  }

  public ApimodelsIntegrationConfigurationResp parseResponse(
      int code, String contentType, InputStream payload) throws HttpResponseException, IOException {
    if (code != 200) {
      final String json = Helper.convertInputStreamToString(payload);
      throw new HttpResponseException(code, json);
    }
    final String json = Helper.convertInputStreamToString(payload);
    return new ApimodelsIntegrationConfigurationResp().createFromJson(json);
  }
}
