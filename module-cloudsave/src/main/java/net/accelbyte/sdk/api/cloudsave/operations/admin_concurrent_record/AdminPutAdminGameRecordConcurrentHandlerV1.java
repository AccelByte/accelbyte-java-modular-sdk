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
import net.accelbyte.sdk.core.HttpResponseException;
import net.accelbyte.sdk.core.Operation;
import net.accelbyte.sdk.core.util.Helper;

/**
 * adminPutAdminGameRecordConcurrentHandlerV1
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
 * <p>## Restriction This is the restriction of Key Naming for the record: 1. Cannot use **"."** as
 * the key name - `{ "data.2": "value" }` 2. Cannot use **"$"** as the prefix in key names - `{
 * "$data": "value" }` 3. Cannot use empty string in key names - `{ "": "value" }`
 *
 * <p>## Reserved Word
 *
 * <p>Reserved Word List: **__META**
 *
 * <p>The reserved word cannot be used as a field in record value, If still defining the field when
 * creating or updating the record, it will be ignored.
 *
 * <p>## Parameters Notes 1. updatedAt (required: true) Time format style: RFC3339 2. value Json 3.
 * tags (default: *empty array*, type: array of string) Indicate the tagging for the admin record.
 * **Request Body Example:** ``` { "value": {}, "updatedAt": "2022-03-17T10:42:15.444Z", "tags":
 * ["tag1", "tag2"] } ``` ## Optimistic Concurrency Control
 *
 * <p>This endpoint implement optimistic concurrency control to avoid race condition. If the record
 * has been updated since the client fetch it, the server will return HTTP status code 412
 * (precondition failed) and client need to redo the operation (fetch data and do update).
 * Otherwise, the server will process the request.
 */
@Getter
@Setter
public class AdminPutAdminGameRecordConcurrentHandlerV1 extends Operation {
  /** generated field's value */
  private String path = "/cloudsave/v1/admin/namespaces/{namespace}/concurrent/adminrecords/{key}";

  private String customBasePath = "";
  private String method = "PUT";
  private List<String> consumes = Arrays.asList("application/json");
  private List<String> produces = Arrays.asList("application/json");
  private String locationQuery = null;

  /** fields as input parameter */
  private String key;

  private String namespace;
  private ModelsAdminGameConcurrentRecordRequest body;

  /**
   * @param key required
   * @param namespace required
   * @param body required
   */
  @Builder
  // @deprecated 2022-08-29 - All args constructor may cause problems. Use builder instead.
  @Deprecated
  public AdminPutAdminGameRecordConcurrentHandlerV1(
      String customBasePath,
      String key,
      String namespace,
      ModelsAdminGameConcurrentRecordRequest body) {
    this.key = key;
    this.namespace = namespace;
    this.body = body;
    this.customBasePath = customBasePath;

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
  public ModelsAdminGameConcurrentRecordRequest getBodyParams() {
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
    return true;
  }

  public void handleEmptyResponse(int code, String contentType, InputStream payload)
      throws HttpResponseException, IOException {
    if (code != 204) {
      final String json = Helper.convertInputStreamToString(payload);
      throw new HttpResponseException(code, json);
    }
  }
}
