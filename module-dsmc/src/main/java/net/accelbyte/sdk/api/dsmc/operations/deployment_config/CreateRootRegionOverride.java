/*
 * Copyright (c) 2024 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.dsmc.operations.deployment_config;

import java.io.*;
import java.util.*;
import lombok.Builder;
import lombok.Getter;
import lombok.Setter;
import net.accelbyte.sdk.api.dsmc.models.*;
import net.accelbyte.sdk.api.dsmc.operation_responses.deployment_config.CreateRootRegionOverrideOpResponse;
import net.accelbyte.sdk.core.HttpResponseException;
import net.accelbyte.sdk.core.Operation;
import net.accelbyte.sdk.core.util.Helper;

/**
 * CreateRootRegionOverride
 *
 * <p>Required permission: ADMIN:NAMESPACE:{namespace}:DSM:CONFIG [CREATE]
 *
 * <p>Required scope: social
 *
 * <p>This endpoint creates a dedicated servers deployment override in a namespace in a region for
 * root deployment.
 */
@Getter
@Setter
public class CreateRootRegionOverride extends Operation {
  /** generated field's value */
  private String path =
      "/dsmcontroller/admin/namespaces/{namespace}/configs/deployments/{deployment}/overrides/regions/{region}";

  private String method = "POST";
  private List<String> consumes = Arrays.asList("application/json");
  private List<String> produces = Arrays.asList("application/json");
  private String locationQuery = null;

  /** fields as input parameter */
  private String deployment;

  private String namespace;
  private String region;
  private ModelsCreateRegionOverrideRequest body;

  /**
   * @param deployment required
   * @param namespace required
   * @param region required
   * @param body required
   */
  @Builder
  // @deprecated 2022-08-29 - All args constructor may cause problems. Use builder instead.
  @Deprecated
  public CreateRootRegionOverride(
      String customBasePath,
      String deployment,
      String namespace,
      String region,
      ModelsCreateRegionOverrideRequest body) {
    this.deployment = deployment;
    this.namespace = namespace;
    this.region = region;
    this.body = body;
    super.customBasePath = customBasePath != null ? customBasePath : "";

    securities.add("Bearer");
  }

  @Override
  public Map<String, String> getPathParams() {
    Map<String, String> pathParams = new HashMap<>();
    if (this.deployment != null) {
      pathParams.put("deployment", this.deployment);
    }
    if (this.namespace != null) {
      pathParams.put("namespace", this.namespace);
    }
    if (this.region != null) {
      pathParams.put("region", this.region);
    }
    return pathParams;
  }

  @Override
  public ModelsCreateRegionOverrideRequest getBodyParams() {
    return this.body;
  }

  @Override
  public boolean isValid() {
    if (this.deployment == null) {
      return false;
    }
    if (this.namespace == null) {
      return false;
    }
    if (this.region == null) {
      return false;
    }
    if (this.body == null) {
      return false;
    }
    return true;
  }

  public CreateRootRegionOverrideOpResponse parseResponse(
      int code, String contentType, InputStream payload) throws HttpResponseException, IOException {
    final CreateRootRegionOverrideOpResponse response = new CreateRootRegionOverrideOpResponse();

    response.setHttpStatusCode(code);
    response.setContentType(contentType);

    if (code == 204) {
      response.setSuccess(true);
    } else if ((code == 200) || (code == 201)) {
      final String json = Helper.convertInputStreamToString(payload);
      response.setData(new ModelsDeploymentWithOverride().createFromJson(json));
      response.setSuccess(true);
    } else if (code == 400) {
      final String json = Helper.convertInputStreamToString(payload);
      response.setError400(new ResponseError().createFromJson(json));
      response.setError(response.getError400().translateToApiError());
    } else if (code == 401) {
      final String json = Helper.convertInputStreamToString(payload);
      response.setError401(new ResponseError().createFromJson(json));
      response.setError(response.getError401().translateToApiError());
    } else if (code == 404) {
      final String json = Helper.convertInputStreamToString(payload);
      response.setError404(new ResponseError().createFromJson(json));
      response.setError(response.getError404().translateToApiError());
    } else if (code == 409) {
      final String json = Helper.convertInputStreamToString(payload);
      response.setError409(new ResponseError().createFromJson(json));
      response.setError(response.getError409().translateToApiError());
    } else if (code == 500) {
      final String json = Helper.convertInputStreamToString(payload);
      response.setError500(new ResponseError().createFromJson(json));
      response.setError(response.getError500().translateToApiError());
    }

    return response;
  }

  /*
  public ModelsDeploymentWithOverride parseResponse(int code, String contentType, InputStream payload) throws HttpResponseException, IOException {
      if(code != 201){
          final String json = Helper.convertInputStreamToString(payload);
          throw new HttpResponseException(code, json);
      }
      final String json = Helper.convertInputStreamToString(payload);
      return new ModelsDeploymentWithOverride().createFromJson(json);
  }
  */

}
