/*
 * Copyright (c) 2024 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.cloudsave.operations.admin_concurrent_record;

import java.io.*;
import java.util.*;
import lombok.Builder;
import lombok.Getter;
import lombok.Setter;
import net.accelbyte.sdk.api.cloudsave.models.*;
import net.accelbyte.sdk.api.cloudsave.operation_responses.admin_concurrent_record.AdminPutGameRecordConcurrentHandlerV1OpResponse;
import net.accelbyte.sdk.core.HttpResponseException;
import net.accelbyte.sdk.core.Operation;
import net.accelbyte.sdk.core.util.Helper;

/**
 * adminPutGameRecordConcurrentHandlerV1
 *
 * <p>## Description
 *
 * <p>This endpoints will create new game record or replace the existing game record.
 *
 * <p>**Replace behaviour:** The existing value will be replaced completely with the new value.
 *
 * <p>Example - Existing JSON:
 *
 * <p>`{ "data1": "value" }`
 *
 * <p>- New JSON:
 *
 * <p>`{ "data2": "new value" }`
 *
 * <p>- Result:
 *
 * <p>`{ "data2": "new value" }`
 *
 * <p>## Reserved Word
 *
 * <p>Reserved Word List: **__META**
 *
 * <p>The reserved word cannot be used as a field in record value, If still defining the field when
 * creating or updating the record, it will be ignored.
 *
 * <p>## Recommended Request Body Size
 *
 * <p>To ensure optimal performance and efficient resource utilization, it is recommended that the
 * request body size for this endpoint does not exceed 250 KB.
 *
 * <p>## Exceeding the recommended limit
 *
 * <p>While it's possible to handle larger request, exceeding this limit may lead to increased
 * processing time, potential performance degradation, and potential timeout issues.
 *
 * <p>## Parameters Notes 1. set_by (default: CLIENT, type: string) Indicate which party that could
 * modify the game record. SERVER: record can be modified by server only. CLIENT: record can be
 * modified by client and server. 2. updatedAt (required: true) Time format style: RFC3339 3. value
 * Json 4. tags (default: *empty array*, type: array of string) Indicate the tagging for the game
 * record. **Request Body Example:** ``` { "set_by": "SERVER", "value": {}, "updatedAt":
 * "2022-03-17T10:42:15.444Z", "tags": ["tag1", "tag2"] } ``` ## Optimistic Concurrency Control
 *
 * <p>This endpoint implement optimistic concurrency control to avoid race condition. If the record
 * has been updated since the client fetch it, the server will return HTTP status code 412
 * (precondition failed) and client need to redo the operation (fetch data and do update).
 * Otherwise, the server will process the request.
 */
@Getter
@Setter
public class AdminPutGameRecordConcurrentHandlerV1 extends Operation {
  /** generated field's value */
  private String path = "/cloudsave/v1/admin/namespaces/{namespace}/concurrent/records/{key}";

  private String method = "PUT";
  private List<String> consumes = Arrays.asList("application/json");
  private List<String> produces = Arrays.asList("application/json");
  private String locationQuery = null;

  /** fields as input parameter */
  private String key;

  private String namespace;
  private ModelsAdminConcurrentRecordRequest body;

  /**
   * @param key required
   * @param namespace required
   * @param body required
   */
  @Builder
  // @deprecated 2022-08-29 - All args constructor may cause problems. Use builder instead.
  @Deprecated
  public AdminPutGameRecordConcurrentHandlerV1(
      String customBasePath,
      String key,
      String namespace,
      ModelsAdminConcurrentRecordRequest body) {
    this.key = key;
    this.namespace = namespace;
    this.body = body;
    super.customBasePath = customBasePath != null ? customBasePath : "";

    securities.add("Bearer");
  }

  @Override
  public Map<String, String> getPathParams() {
    Map<String, String> pathParams = new HashMap<>();
    if (this.key != null) {
      pathParams.put("key", this.key);
    }
    if (this.namespace != null) {
      pathParams.put("namespace", this.namespace);
    }
    return pathParams;
  }

  @Override
  public ModelsAdminConcurrentRecordRequest getBodyParams() {
    return this.body;
  }

  @Override
  public boolean isValid() {
    if (this.key == null) {
      return false;
    }
    if (this.namespace == null) {
      return false;
    }
    if (this.body == null) {
      return false;
    }
    return true;
  }

  public AdminPutGameRecordConcurrentHandlerV1OpResponse parseResponse(
      int code, String contentType, InputStream payload) throws HttpResponseException, IOException {
    final AdminPutGameRecordConcurrentHandlerV1OpResponse response =
        new AdminPutGameRecordConcurrentHandlerV1OpResponse();

    response.setHttpStatusCode(code);
    response.setContentType(contentType);

    if (code == 204) {
      response.setSuccess(true);
    } else if (code == 400) {
      final String json = Helper.convertInputStreamToString(payload);
      response.setError400(new ModelsResponseError().createFromJson(json));
      response.setError(response.getError400().translateToApiError());
    } else if (code == 401) {
      final String json = Helper.convertInputStreamToString(payload);
      response.setError401(new ModelsResponseError().createFromJson(json));
      response.setError(response.getError401().translateToApiError());
    } else if (code == 403) {
      final String json = Helper.convertInputStreamToString(payload);
      response.setError403(new ModelsResponseError().createFromJson(json));
      response.setError(response.getError403().translateToApiError());
    } else if (code == 412) {
      final String json = Helper.convertInputStreamToString(payload);
      response.setError412(new ModelsResponseError().createFromJson(json));
      response.setError(response.getError412().translateToApiError());
    } else if (code == 500) {
      final String json = Helper.convertInputStreamToString(payload);
      response.setError500(new ModelsResponseError().createFromJson(json));
      response.setError(response.getError500().translateToApiError());
    }

    return response;
  }

  /*
  public void handleEmptyResponse(int code, String contentType, InputStream payload) throws HttpResponseException, IOException {
      if(code != 204){
          final String json = Helper.convertInputStreamToString(payload);
          throw new HttpResponseException(code, json);
      }
  }
  */

}
