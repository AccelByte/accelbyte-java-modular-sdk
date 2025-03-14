/*
 * Copyright (c) 2024 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.iam.operations.o_auth;

import java.io.*;
import java.util.*;
import lombok.Builder;
import lombok.Getter;
import lombok.Setter;
import net.accelbyte.sdk.api.iam.models.*;
import net.accelbyte.sdk.api.iam.operation_responses.o_auth.RevokeAUserOpResponse;
import net.accelbyte.sdk.core.ApiError;
import net.accelbyte.sdk.core.HttpResponseException;
import net.accelbyte.sdk.core.Operation;
import net.accelbyte.sdk.core.util.Helper;

/**
 * RevokeAUser
 *
 * <p>## The endpoint is going to be deprecated This endpoint revokes a user. This endpoint requires
 * all requests to have Authorization header set with Bearer access authentication with valid access
 * token. When other clients know that the userID has been revoked and the token is issued before
 * the revocation, forcing a new token will contain banned permissions.
 *
 * <p>### Endpoint migration guide - **Substitute endpoint:
 * _/iam/v3/oauth/admin/namespaces/{namespace}/users/{userId}/revoke [POST]_**
 *
 * @deprecated
 */
@Deprecated
@Getter
@Setter
public class RevokeAUser extends Operation {
  /** generated field's value */
  private String path = "/iam/oauth/revoke/user";

  private String method = "POST";
  private List<String> consumes = Arrays.asList("application/x-www-form-urlencoded");
  private List<String> produces = Arrays.asList("application/json");
  private String locationQuery = null;

  /** fields as input parameter */
  private String userID;

  /**
   * @param userID required
   */
  @Builder
  // @deprecated 2022-08-29 - All args constructor may cause problems. Use builder instead.
  @Deprecated
  public RevokeAUser(String customBasePath, String userID) {
    this.userID = userID;
    super.customBasePath = customBasePath != null ? customBasePath : "";

    securities.add("Bearer");
  }

  @Override
  public Map<String, Object> getFormParams() {
    Map<String, Object> formDataParams = new HashMap<>();
    if (this.userID != null) {
      formDataParams.put("userID", this.userID);
    }
    return formDataParams;
  }

  @Override
  public boolean isValid() {
    if (this.userID == null) {
      return false;
    }
    return true;
  }

  public RevokeAUserOpResponse parseResponse(int code, String contentType, InputStream payload)
      throws HttpResponseException, IOException {
    final RevokeAUserOpResponse response = new RevokeAUserOpResponse();

    response.setHttpStatusCode(code);
    response.setContentType(contentType);

    if (code == 204) {
      response.setSuccess(true);
    } else if ((code == 200) || (code == 201) || (code == 202)) {
      response.setSuccess(true);
    } else if (code == 400) {
      final String data = Helper.convertInputStreamToString(payload);
      response.setError400(data);
      response.setError(new ApiError("-1", data));
    } else if (code == 401) {
      final String data = Helper.convertInputStreamToString(payload);
      response.setError401(data);
      response.setError(new ApiError("-1", data));
    }

    return response;
  }

  /*
  public void handleEmptyResponse(int code, String contentType, InputStream payload) throws HttpResponseException, IOException {
      if(code != 200){
          final String json = Helper.convertInputStreamToString(payload);
          throw new HttpResponseException(code, json);
      }
  }
  */

}
