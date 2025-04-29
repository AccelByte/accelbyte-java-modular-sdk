/*
 * Copyright (c) 2024 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.iam.operations.users;

import java.io.*;
import java.util.*;
import lombok.Builder;
import lombok.Getter;
import lombok.Setter;
import net.accelbyte.sdk.api.iam.models.*;
import net.accelbyte.sdk.api.iam.operation_responses.users.AdminCursorGetUserV3OpResponse;
import net.accelbyte.sdk.core.HttpResponseException;
import net.accelbyte.sdk.core.Operation;
import net.accelbyte.sdk.core.util.Helper;

/**
 * AdminCursorGetUserV3
 *
 * <p>1. **Cursor-Based User Retrieval** This API fetches user records ordered by created_at ASC,
 * user_id ASC to ensure a stable pagination order. Pagination is handled using a cursor, which
 * consists of created_at and user_id. 2. **GraphQL-Like Querying** By default, the API only returns
 * the user ID. To include additional fields in the response, specify them in the request body under
 * the fields parameter. ***Supported fields***: ['created_at', 'email_address'] ***Note***: If a
 * value is not in the allowed list, the API will ignore it. 3. **Cursor Mechanics** The cursor
 * consists of created_at and user_id from the last retrieved record. The next query fetches records
 * strictly after the provided cursor. ***The query applies the following ordering logic***: Records
 * with a later created_at timestamp are included. If multiple records have the same created_at,
 * only records with a higher user_id are included. This ensures that records with the exact same
 * created_at as the cursor are excluded from the next page to prevent duplication. 4. **Usage** For
 * the first-time query, the request body does not require a cursor. If the data array is empty, it
 * indicates that the cursor has reached the end of the available records.
 */
@Getter
@Setter
public class AdminCursorGetUserV3 extends Operation {
  /** generated field's value */
  private String path = "/iam/v3/admin/namespaces/{namespace}/users/cursor";

  private String method = "POST";
  private List<String> consumes = Arrays.asList("application/json");
  private List<String> produces = Arrays.asList("application/json");
  private String locationQuery = null;

  /** fields as input parameter */
  private String namespace;

  private ModelCursorGetUserRequest body;

  /**
   * @param namespace required
   * @param body required
   */
  @Builder
  // @deprecated 2022-08-29 - All args constructor may cause problems. Use builder instead.
  @Deprecated
  public AdminCursorGetUserV3(
      String customBasePath, String namespace, ModelCursorGetUserRequest body) {
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
  public ModelCursorGetUserRequest getBodyParams() {
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

  public AdminCursorGetUserV3OpResponse parseResponse(
      int code, String contentType, InputStream payload) throws HttpResponseException, IOException {
    final AdminCursorGetUserV3OpResponse response = new AdminCursorGetUserV3OpResponse();

    response.setHttpStatusCode(code);
    response.setContentType(contentType);

    if (code == 204) {
      response.setSuccess(true);
    } else if ((code == 200) || (code == 201)) {
      final String json = Helper.convertInputStreamToString(payload);
      response.setData(new ModelCursorGetUserResponse().createFromJson(json));
      response.setSuccess(true);
    } else if (code == 400) {
      final String json = Helper.convertInputStreamToString(payload);
      response.setError400(new RestErrorResponse().createFromJson(json));
      response.setError(response.getError400().translateToApiError());
    } else if (code == 401) {
      final String json = Helper.convertInputStreamToString(payload);
      response.setError401(new RestErrorResponse().createFromJson(json));
      response.setError(response.getError401().translateToApiError());
    } else if (code == 403) {
      final String json = Helper.convertInputStreamToString(payload);
      response.setError403(new RestErrorResponse().createFromJson(json));
      response.setError(response.getError403().translateToApiError());
    } else if (code == 500) {
      final String json = Helper.convertInputStreamToString(payload);
      response.setError500(new RestErrorResponse().createFromJson(json));
      response.setError(response.getError500().translateToApiError());
    }

    return response;
  }

  /*
  public ModelCursorGetUserResponse parseResponse(int code, String contentType, InputStream payload) throws HttpResponseException, IOException {
      if(code != 200){
          final String json = Helper.convertInputStreamToString(payload);
          throw new HttpResponseException(code, json);
      }
      final String json = Helper.convertInputStreamToString(payload);
      return new ModelCursorGetUserResponse().createFromJson(json);
  }
  */

}
