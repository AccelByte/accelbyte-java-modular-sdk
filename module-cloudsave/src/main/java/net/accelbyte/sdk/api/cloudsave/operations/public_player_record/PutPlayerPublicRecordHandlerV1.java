/*
 * Copyright (c) 2024 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.cloudsave.operations.public_player_record;

import java.io.*;
import java.util.*;
import lombok.Builder;
import lombok.Getter;
import lombok.Setter;
import net.accelbyte.sdk.api.cloudsave.models.*;
import net.accelbyte.sdk.api.cloudsave.operation_responses.public_player_record.PutPlayerPublicRecordHandlerV1OpResponse;
import net.accelbyte.sdk.core.HttpResponseException;
import net.accelbyte.sdk.core.Operation;
import net.accelbyte.sdk.core.util.Helper;

/**
 * putPlayerPublicRecordHandlerV1
 *
 * <p>## Description
 *
 * <p>This endpoints will create new player public record or replace the existing player public
 * record.
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
 * <p>## Warning: This endpoint is going to deprecate
 *
 * <p>This endpoint is going to deprecate in the future please don't use it.
 *
 * <p>For alternative, please use these endpoints: - **POST
 * /cloudsave/v1/namespaces/{namespace}/users/{userId}/records/{key}** and utilizing **__META**
 * functionality - **PUT /cloudsave/v1/namespaces/{namespace}/users/{userId}/records/{key}** and
 * utilizing **__META** functionality - **DELETE
 * /cloudsave/v1/namespaces/{namespace}/users/{userId}/records/{key}**
 */
@Getter
@Setter
public class PutPlayerPublicRecordHandlerV1 extends Operation {
  /** generated field's value */
  private String path = "/cloudsave/v1/namespaces/{namespace}/users/{userId}/records/{key}/public";

  private String method = "PUT";
  private List<String> consumes = Arrays.asList("application/json");
  private List<String> produces = Arrays.asList("application/json");
  private String locationQuery = null;

  /** fields as input parameter */
  private String key;

  private String namespace;
  private String userId;
  private ModelsPlayerRecordRequest body;

  /**
   * @param key required
   * @param namespace required
   * @param userId required
   * @param body required
   */
  @Builder
  // @deprecated 2022-08-29 - All args constructor may cause problems. Use builder instead.
  @Deprecated
  public PutPlayerPublicRecordHandlerV1(
      String customBasePath,
      String key,
      String namespace,
      String userId,
      ModelsPlayerRecordRequest body) {
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
  public ModelsPlayerRecordRequest getBodyParams() {
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

  public PutPlayerPublicRecordHandlerV1OpResponse parseResponse(
      int code, String contentType, InputStream payload) throws HttpResponseException, IOException {
    final PutPlayerPublicRecordHandlerV1OpResponse response =
        new PutPlayerPublicRecordHandlerV1OpResponse();

    response.setHttpStatusCode(code);
    response.setContentType(contentType);

    if (code == 204) {
      response.setSuccess(true);
    } else if ((code == 200) || (code == 201)) {
      final String json = Helper.convertInputStreamToString(payload);
      response.setData(new ModelsPlayerRecordResponse().createFromJson(json));
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
  public ModelsPlayerRecordResponse parseResponse(int code, String contentType, InputStream payload) throws HttpResponseException, IOException {
      if(code != 200){
          final String json = Helper.convertInputStreamToString(payload);
          throw new HttpResponseException(code, json);
      }
      final String json = Helper.convertInputStreamToString(payload);
      return new ModelsPlayerRecordResponse().createFromJson(json);
  }
  */

}
