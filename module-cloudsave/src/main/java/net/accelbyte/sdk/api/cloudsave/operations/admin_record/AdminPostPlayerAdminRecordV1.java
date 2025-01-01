/*
 * Copyright (c) 2024 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.cloudsave.operations.admin_record;

import java.io.*;
import java.util.*;
import lombok.Builder;
import lombok.Getter;
import lombok.Setter;
import net.accelbyte.sdk.api.cloudsave.models.*;
import net.accelbyte.sdk.api.cloudsave.operation_responses.admin_record.AdminPostPlayerAdminRecordV1OpResponse;
import net.accelbyte.sdk.core.HttpResponseException;
import net.accelbyte.sdk.core.Operation;
import net.accelbyte.sdk.core.util.Helper;

/**
 * adminPostPlayerAdminRecordV1
 *
 * <p>## Description
 *
 * <p>This endpoints will create new admin player record or append the existing admin game record.
 *
 * <p>**Append example:**
 *
 * <p>Example 1 - Existing JSON:
 *
 * <p>`{ "data1": "value" }`
 *
 * <p>- New JSON:
 *
 * <p>`{ "data2": "new value" }`
 *
 * <p>- Result:
 *
 * <p>`{ "data1": "value", "data2": "new value" }`
 *
 * <p>Example 2 - Existing JSON:
 *
 * <p>`{ "data1": { "data2": "value" }`
 *
 * <p>- New JSON:
 *
 * <p>`{ "data1": { "data3": "new value" }`
 *
 * <p>- Result:
 *
 * <p>`{ "data1": { "data2": "value", "data3": "new value" }`
 *
 * <p>## Restriction This is the restriction of Key Naming for the record: 1. Cannot use **"."** as
 * the key name - `{ "data.2": "value" }` 2. Cannot use **"$"** as the prefix in key names - `{
 * "$data": "value" }`
 *
 * <p>## Record Metadata
 *
 * <p>Metadata allows user to define the behaviour of the record. Metadata can be defined in request
 * body with field name **__META**. When creating record, if **__META** field is not defined, the
 * metadata value will use the default value. When updating record, if **__META** field is not
 * defined, the existing metadata value will stay as is.
 *
 * <p>**Metadata List:** 1. tags (default: *empty array*, type: array of string) Indicate the
 * tagging for the admin record. 2. ttl_config (default: *empty*, type: object) Indicate the TTL
 * configuration for the admin record. action: - DELETE: record will be deleted after TTL is reached
 *
 * <p>**Request Body Example:** ``` { "__META": { "tags": ["tag1", "tag2"], "ttl_config": {
 * "expires_at": "2026-01-02T15:04:05Z", // should be in RFC3339 format "action": "DELETE" }, } ...
 * } ```
 */
@Getter
@Setter
public class AdminPostPlayerAdminRecordV1 extends Operation {
  /** generated field's value */
  private String path =
      "/cloudsave/v1/admin/namespaces/{namespace}/users/{userId}/adminrecords/{key}";

  private String method = "POST";
  private List<String> consumes = Arrays.asList("application/json");
  private List<String> produces = Arrays.asList("application/json");
  private String locationQuery = null;

  /** fields as input parameter */
  private String key;

  private String namespace;
  private String userId;
  private ModelsAdminPlayerRecordRequest body;

  /**
   * @param key required
   * @param namespace required
   * @param userId required
   * @param body required
   */
  @Builder
  // @deprecated 2022-08-29 - All args constructor may cause problems. Use builder instead.
  @Deprecated
  public AdminPostPlayerAdminRecordV1(
      String customBasePath,
      String key,
      String namespace,
      String userId,
      ModelsAdminPlayerRecordRequest body) {
    this.key = key;
    this.namespace = namespace;
    this.userId = userId;
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
    if (this.userId != null) {
      pathParams.put("userId", this.userId);
    }
    return pathParams;
  }

  @Override
  public ModelsAdminPlayerRecordRequest getBodyParams() {
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
    if (this.userId == null) {
      return false;
    }
    if (this.body == null) {
      return false;
    }
    return true;
  }

  public AdminPostPlayerAdminRecordV1OpResponse parseResponse(
      int code, String contentType, InputStream payload) throws HttpResponseException, IOException {
    final AdminPostPlayerAdminRecordV1OpResponse response =
        new AdminPostPlayerAdminRecordV1OpResponse();

    response.setHttpStatusCode(code);
    response.setContentType(contentType);

    if (code == 204) {
      response.setSuccess(true);
    } else if ((code == 200) || (code == 201)) {
      final String json = Helper.convertInputStreamToString(payload);
      response.setData(new ModelsAdminPlayerRecordResponse().createFromJson(json));
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
    } else if (code == 500) {
      final String json = Helper.convertInputStreamToString(payload);
      response.setError500(new ModelsResponseError().createFromJson(json));
      response.setError(response.getError500().translateToApiError());
    }

    return response;
  }

  /*
  public ModelsAdminPlayerRecordResponse parseResponse(int code, String contentType, InputStream payload) throws HttpResponseException, IOException {
      if(code != 201){
          final String json = Helper.convertInputStreamToString(payload);
          throw new HttpResponseException(code, json);
      }
      final String json = Helper.convertInputStreamToString(payload);
      return new ModelsAdminPlayerRecordResponse().createFromJson(json);
  }
  */

}
