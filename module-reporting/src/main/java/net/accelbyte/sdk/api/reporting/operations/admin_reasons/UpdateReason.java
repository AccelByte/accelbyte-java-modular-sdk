/*
 * Copyright (c) 2024 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.reporting.operations.admin_reasons;

import java.io.*;
import java.util.*;
import lombok.Builder;
import lombok.Getter;
import lombok.Setter;
import net.accelbyte.sdk.api.reporting.models.*;
import net.accelbyte.sdk.api.reporting.operation_responses.admin_reasons.UpdateReasonOpResponse;
import net.accelbyte.sdk.core.HttpResponseException;
import net.accelbyte.sdk.core.Operation;
import net.accelbyte.sdk.core.util.Helper;

/**
 * updateReason
 *
 * <p>This endpoint update a reason for a namespace with ID.
 */
@Getter
@Setter
public class UpdateReason extends Operation {
  /** generated field's value */
  private String path = "/reporting/v1/admin/namespaces/{namespace}/reasons/{reasonId}";

  private String method = "PATCH";
  private List<String> consumes = Arrays.asList("application/json");
  private List<String> produces = Arrays.asList("application/json");
  private String locationQuery = null;

  /** fields as input parameter */
  private String namespace;

  private String reasonId;
  private RestapiCreateReasonRequest body;

  /**
   * @param namespace required
   * @param reasonId required
   * @param body required
   */
  @Builder
  // @deprecated 2022-08-29 - All args constructor may cause problems. Use builder instead.
  @Deprecated
  public UpdateReason(
      String customBasePath, String namespace, String reasonId, RestapiCreateReasonRequest body) {
    this.namespace = namespace;
    this.reasonId = reasonId;
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
    if (this.reasonId != null) {
      pathParams.put("reasonId", this.reasonId);
    }
    return pathParams;
  }

  @Override
  public RestapiCreateReasonRequest getBodyParams() {
    return this.body;
  }

  @Override
  public boolean isValid() {
    if (this.namespace == null) {
      return false;
    }
    if (this.reasonId == null) {
      return false;
    }
    if (this.body == null) {
      return false;
    }
    return true;
  }

  public UpdateReasonOpResponse parseResponse(int code, String contentType, InputStream payload)
      throws HttpResponseException, IOException {
    final UpdateReasonOpResponse response = new UpdateReasonOpResponse();

    response.setHttpStatusCode(code);
    response.setContentType(contentType);

    if (code == 204) {
      response.setSuccess(true);
    } else if ((code == 200) || (code == 201)) {
      final String json = Helper.convertInputStreamToString(payload);
      response.setData(new RestapiAdminReasonResponse().createFromJson(json));
      response.setSuccess(true);
    } else if (code == 400) {
      final String json = Helper.convertInputStreamToString(payload);
      response.setError400(new RestapiErrorResponse().createFromJson(json));
      response.setError(response.getError400().translateToApiError());
    } else if (code == 409) {
      final String json = Helper.convertInputStreamToString(payload);
      response.setError409(new RestapiErrorResponse().createFromJson(json));
      response.setError(response.getError409().translateToApiError());
    } else if (code == 500) {
      final String json = Helper.convertInputStreamToString(payload);
      response.setError500(new RestapiErrorResponse().createFromJson(json));
      response.setError(response.getError500().translateToApiError());
    }

    return response;
  }

  /*
  public RestapiAdminReasonResponse parseResponse(int code, String contentType, InputStream payload) throws HttpResponseException, IOException {
      if(code != 200){
          final String json = Helper.convertInputStreamToString(payload);
          throw new HttpResponseException(code, json);
      }
      final String json = Helper.convertInputStreamToString(payload);
      return new RestapiAdminReasonResponse().createFromJson(json);
  }
  */

}
