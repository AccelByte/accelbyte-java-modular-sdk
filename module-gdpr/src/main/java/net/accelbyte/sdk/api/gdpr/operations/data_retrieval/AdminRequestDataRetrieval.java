/*
 * Copyright (c) 2024 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.gdpr.operations.data_retrieval;

import java.io.*;
import java.util.*;
import lombok.Builder;
import lombok.Getter;
import lombok.Setter;
import net.accelbyte.sdk.api.gdpr.models.*;
import net.accelbyte.sdk.api.gdpr.operation_responses.data_retrieval.AdminRequestDataRetrievalOpResponse;
import net.accelbyte.sdk.core.HttpResponseException;
import net.accelbyte.sdk.core.Operation;
import net.accelbyte.sdk.core.util.Helper;

/**
 * AdminRequestDataRetrieval
 *
 * <p>Submit user personal data retrieval request. Scope: account
 *
 * <p>### Request Header: - **Content-Type: application/x-www-form-urlencoded**
 */
@Getter
@Setter
public class AdminRequestDataRetrieval extends Operation {
  /** generated field's value */
  private String path = "/gdpr/admin/namespaces/{namespace}/users/{userId}/requests";

  private String method = "POST";
  private List<String> consumes = Arrays.asList("application/x-www-form-urlencoded");
  private List<String> produces = Arrays.asList("application/json");
  private String locationQuery = null;

  /** fields as input parameter */
  private String namespace;

  private String userId;
  private String password;

  /**
   * @param namespace required
   * @param userId required
   */
  @Builder
  // @deprecated 2022-08-29 - All args constructor may cause problems. Use builder instead.
  @Deprecated
  public AdminRequestDataRetrieval(
      String customBasePath, String namespace, String userId, String password) {
    this.namespace = namespace;
    this.userId = userId;
    this.password = password;
    super.customBasePath = customBasePath != null ? customBasePath : "";

    securities.add("Bearer");
  }

  @Override
  public Map<String, String> getPathParams() {
    Map<String, String> pathParams = new HashMap<>();
    if (this.namespace != null) {
      pathParams.put("namespace", this.namespace);
    }
    if (this.userId != null) {
      pathParams.put("userId", this.userId);
    }
    return pathParams;
  }

  @Override
  public Map<String, Object> getFormParams() {
    Map<String, Object> formDataParams = new HashMap<>();
    if (this.password != null) {
      formDataParams.put("password", this.password);
    }
    return formDataParams;
  }

  @Override
  public boolean isValid() {
    if (this.namespace == null) {
      return false;
    }
    if (this.userId == null) {
      return false;
    }
    return true;
  }

  public AdminRequestDataRetrievalOpResponse parseResponse(
      int code, String contentType, InputStream payload) throws HttpResponseException, IOException {
    final AdminRequestDataRetrievalOpResponse response = new AdminRequestDataRetrievalOpResponse();

    response.setHttpStatusCode(code);
    response.setContentType(contentType);

    if (code == 204) {
      response.setSuccess(true);
    } else if ((code == 200) || (code == 201)) {
      final String json = Helper.convertInputStreamToString(payload);
      response.setData(new ModelsDataRetrievalResponse().createFromJson(json));
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
    } else if (code == 429) {
      final String json = Helper.convertInputStreamToString(payload);
      response.setError429(new ResponseError().createFromJson(json));
      response.setError(response.getError429().translateToApiError());
    } else if (code == 500) {
      final String json = Helper.convertInputStreamToString(payload);
      response.setError500(new ResponseError().createFromJson(json));
      response.setError(response.getError500().translateToApiError());
    }

    return response;
  }

  /*
  public ModelsDataRetrievalResponse parseResponse(int code, String contentType, InputStream payload) throws HttpResponseException, IOException {
      if(code != 201){
          final String json = Helper.convertInputStreamToString(payload);
          throw new HttpResponseException(code, json);
      }
      final String json = Helper.convertInputStreamToString(payload);
      return new ModelsDataRetrievalResponse().createFromJson(json);
  }
  */

}
