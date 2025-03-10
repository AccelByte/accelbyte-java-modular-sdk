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
import net.accelbyte.sdk.api.iam.operation_responses.o_auth.VerifyTokenOpResponse;
import net.accelbyte.sdk.core.ApiError;
import net.accelbyte.sdk.core.HttpResponseException;
import net.accelbyte.sdk.core.Operation;
import net.accelbyte.sdk.core.util.Helper;

/**
 * VerifyToken
 *
 * <p>## The endpoint is going to be deprecated This endpoint requires all requests to have
 * Authorization header set with Basic access authentication constructed from client id and client
 * secret. ### Endpoint migration guide - **Substitute endpoint: _/iam/v3/oauth/verify [POST]_** -
 * **Note: difference in V3 response:** 1. format differenceï¼Pascal case => Camel case):
 * permissions field from Action => action, Resource => resource
 *
 * @deprecated
 */
@Deprecated
@Getter
@Setter
public class VerifyToken extends Operation {
  /** generated field's value */
  private String path = "/iam/oauth/verify";

  private String method = "POST";
  private List<String> consumes = Arrays.asList("application/x-www-form-urlencoded");
  private List<String> produces = Arrays.asList("application/json");
  private String locationQuery = null;

  /** fields as input parameter */
  private String token;

  /**
   * @param token required
   */
  @Builder
  // @deprecated 2022-08-29 - All args constructor may cause problems. Use builder instead.
  @Deprecated
  public VerifyToken(String customBasePath, String token) {
    this.token = token;
    super.customBasePath = customBasePath != null ? customBasePath : "";

    securities.add("Basic");
  }

  @Override
  public Map<String, Object> getFormParams() {
    Map<String, Object> formDataParams = new HashMap<>();
    if (this.token != null) {
      formDataParams.put("token", this.token);
    }
    return formDataParams;
  }

  @Override
  public boolean isValid() {
    if (this.token == null) {
      return false;
    }
    return true;
  }

  public VerifyTokenOpResponse parseResponse(int code, String contentType, InputStream payload)
      throws HttpResponseException, IOException {
    final VerifyTokenOpResponse response = new VerifyTokenOpResponse();

    response.setHttpStatusCode(code);
    response.setContentType(contentType);

    if (code == 204) {
      response.setSuccess(true);
    } else if ((code == 200) || (code == 201)) {
      final String json = Helper.convertInputStreamToString(payload);
      response.setData(new OauthmodelTokenResponse().createFromJson(json));
      response.setSuccess(true);
    } else if (code == 400) {
      final String data = Helper.convertInputStreamToString(payload);
      response.setError400(data);
      response.setError(new ApiError("-1", data));
    }

    return response;
  }

  /*
  public OauthmodelTokenResponse parseResponse(int code, String contentType, InputStream payload) throws HttpResponseException, IOException {
      if(code != 200){
          final String json = Helper.convertInputStreamToString(payload);
          throw new HttpResponseException(code, json);
      }
      final String json = Helper.convertInputStreamToString(payload);
      return new OauthmodelTokenResponse().createFromJson(json);
  }
  */

}
