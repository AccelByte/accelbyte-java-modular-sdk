/*
 * Copyright (c) 2024 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.gdpr.operations.platform_account_closure_client;

import java.io.*;
import java.util.*;
import lombok.Builder;
import lombok.Getter;
import lombok.Setter;
import net.accelbyte.sdk.api.gdpr.models.*;
import net.accelbyte.sdk.api.gdpr.operation_responses.platform_account_closure_client.AdminValidateXboxBPCertFileOpResponse;
import net.accelbyte.sdk.core.HttpResponseException;
import net.accelbyte.sdk.core.Operation;
import net.accelbyte.sdk.core.util.Helper;

/**
 * AdminValidateXboxBPCertFile
 *
 * <p>Check xbox BP cert file whether it's expired and return expiration date
 */
@Getter
@Setter
public class AdminValidateXboxBPCertFile extends Operation {
  /** generated field's value */
  private String path = "/gdpr/admin/namespaces/{namespace}/platforms/xbox/closure/cert/validation";

  private String method = "POST";
  private List<String> consumes = Arrays.asList("application/json");
  private List<String> produces = Arrays.asList("application/json");
  private String locationQuery = null;

  /** fields as input parameter */
  private String namespace;

  private DtoXboxBPCertValidationRequest body;

  /**
   * @param namespace required
   * @param body required
   */
  @Builder
  // @deprecated 2022-08-29 - All args constructor may cause problems. Use builder instead.
  @Deprecated
  public AdminValidateXboxBPCertFile(
      String customBasePath, String namespace, DtoXboxBPCertValidationRequest body) {
    this.namespace = namespace;
    this.body = body;
    super.customBasePath = customBasePath != null ? customBasePath : "";

    securities.add("Bearer");
  }

  @Override
  public Map<String, String> getPathParams() {
    Map<String, String> pathParams = new HashMap<>();
    if (this.namespace != null) {
      pathParams.put("namespace", this.namespace);
    }
    return pathParams;
  }

  @Override
  public DtoXboxBPCertValidationRequest getBodyParams() {
    return this.body;
  }

  @Override
  public boolean isValid() {
    if (this.namespace == null) {
      return false;
    }
    if (this.body == null) {
      return false;
    }
    return true;
  }

  public AdminValidateXboxBPCertFileOpResponse parseResponse(
      int code, String contentType, InputStream payload) throws HttpResponseException, IOException {
    final AdminValidateXboxBPCertFileOpResponse response =
        new AdminValidateXboxBPCertFileOpResponse();

    response.setHttpStatusCode(code);
    response.setContentType(contentType);

    if (code == 204) {
      response.setSuccess(true);
    } else if ((code == 200) || (code == 201)) {
      final String json = Helper.convertInputStreamToString(payload);
      response.setData(new DtoXboxBPCertValidationResponse().createFromJson(json));
      response.setSuccess(true);
    } else if (code == 400) {
      final String json = Helper.convertInputStreamToString(payload);
      response.setError400(new ResponseError().createFromJson(json));
      response.setError(response.getError400().translateToApiError());
    } else if (code == 401) {
      final String json = Helper.convertInputStreamToString(payload);
      response.setError401(new ResponseError().createFromJson(json));
      response.setError(response.getError401().translateToApiError());
    } else if (code == 403) {
      final String json = Helper.convertInputStreamToString(payload);
      response.setError403(new ResponseError().createFromJson(json));
      response.setError(response.getError403().translateToApiError());
    } else if (code == 404) {
      final String json = Helper.convertInputStreamToString(payload);
      response.setError404(new ResponseError().createFromJson(json));
      response.setError(response.getError404().translateToApiError());
    } else if (code == 500) {
      final String json = Helper.convertInputStreamToString(payload);
      response.setError500(new ResponseError().createFromJson(json));
      response.setError(response.getError500().translateToApiError());
    }

    return response;
  }

  /*
  public DtoXboxBPCertValidationResponse parseResponse(int code, String contentType, InputStream payload) throws HttpResponseException, IOException {
      if(code != 200){
          final String json = Helper.convertInputStreamToString(payload);
          throw new HttpResponseException(code, json);
      }
      final String json = Helper.convertInputStreamToString(payload);
      return new DtoXboxBPCertValidationResponse().createFromJson(json);
  }
  */

}