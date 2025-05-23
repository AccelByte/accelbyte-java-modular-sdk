/*
 * Copyright (c) 2024 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.iam.operations.o_auth2_0_v4;

import java.io.*;
import java.util.*;
import lombok.Builder;
import lombok.Getter;
import lombok.Setter;
import net.accelbyte.sdk.api.iam.models.*;
import net.accelbyte.sdk.api.iam.operation_responses.o_auth2_0_v4.AuthenticationWithPlatformLinkV4OpResponse;
import net.accelbyte.sdk.core.HttpResponseException;
import net.accelbyte.sdk.core.Operation;
import net.accelbyte.sdk.core.util.Helper;

/**
 * AuthenticationWithPlatformLinkV4
 *
 * <p>This endpoint is being used to authenticate a user account and perform platform link. It
 * validates user's email / username and password. If user already enable 2FA, then invoke
 * _/mfa/verify_ using **mfa_token** from this endpoint response.
 *
 * <p>## Device Cookie Validation
 *
 * <p>Device Cookie is used to protect the user account from brute force login attack, [more detail
 * from
 * OWASP](https://owasp.org/www-community/Slow_Down_Online_Guessing_Attacks_with_Device_Cookies).
 * This endpoint will read device cookie from cookie **auth-trust-id**. If device cookie not found,
 * it will generate a new one and set it into cookie when successfully authenticate.
 */
@Getter
@Setter
public class AuthenticationWithPlatformLinkV4 extends Operation {
  /** generated field's value */
  private String path = "/iam/v4/oauth/authenticateWithLink";

  private String method = "POST";
  private List<String> consumes = Arrays.asList("application/x-www-form-urlencoded");
  private List<String> produces = Arrays.asList("application/json");
  private String locationQuery = null;

  /** fields as input parameter */
  private Boolean extendExp;

  private String clientId;
  private String linkingToken;
  private String password;
  private String username;

  /**
   * @param clientId required
   * @param linkingToken required
   * @param password required
   * @param username required
   */
  @Builder
  // @deprecated 2022-08-29 - All args constructor may cause problems. Use builder instead.
  @Deprecated
  public AuthenticationWithPlatformLinkV4(
      String customBasePath,
      Boolean extendExp,
      String clientId,
      String linkingToken,
      String password,
      String username) {
    this.extendExp = extendExp;
    this.clientId = clientId;
    this.linkingToken = linkingToken;
    this.password = password;
    this.username = username;
    super.customBasePath = customBasePath != null ? customBasePath : "";

    securities.add("Bearer");
  }

  @Override
  public Map<String, Object> getFormParams() {
    Map<String, Object> formDataParams = new HashMap<>();
    if (this.extendExp != null) {
      formDataParams.put(
          "extend_exp", this.extendExp == null ? null : String.valueOf(this.extendExp));
    }
    if (this.clientId != null) {
      formDataParams.put("client_id", this.clientId);
    }
    if (this.linkingToken != null) {
      formDataParams.put("linkingToken", this.linkingToken);
    }
    if (this.password != null) {
      formDataParams.put("password", this.password);
    }
    if (this.username != null) {
      formDataParams.put("username", this.username);
    }
    return formDataParams;
  }

  @Override
  public boolean isValid() {
    if (this.clientId == null) {
      return false;
    }
    if (this.linkingToken == null) {
      return false;
    }
    if (this.password == null) {
      return false;
    }
    if (this.username == null) {
      return false;
    }
    return true;
  }

  public AuthenticationWithPlatformLinkV4OpResponse parseResponse(
      int code, String contentType, InputStream payload) throws HttpResponseException, IOException {
    final AuthenticationWithPlatformLinkV4OpResponse response =
        new AuthenticationWithPlatformLinkV4OpResponse();

    response.setHttpStatusCode(code);
    response.setContentType(contentType);

    if (code == 204) {
      response.setSuccess(true);
    } else if ((code == 200) || (code == 201)) {
      final String json = Helper.convertInputStreamToString(payload);
      response.setData(new OauthmodelTokenResponseV3().createFromJson(json));
      response.setSuccess(true);
    } else if (code == 400) {
      final String json = Helper.convertInputStreamToString(payload);
      response.setError400(new RestErrorResponse().createFromJson(json));
      response.setError(response.getError400().translateToApiError());
    } else if (code == 401) {
      final String json = Helper.convertInputStreamToString(payload);
      response.setError401(new OauthmodelErrorResponse().createFromJson(json));
      response.setError(response.getError401().translateToApiError());
    } else if (code == 403) {
      final String json = Helper.convertInputStreamToString(payload);
      response.setError403(new RestErrorResponse().createFromJson(json));
      response.setError(response.getError403().translateToApiError());
    } else if (code == 409) {
      final String json = Helper.convertInputStreamToString(payload);
      response.setError409(new RestErrorResponse().createFromJson(json));
      response.setError(response.getError409().translateToApiError());
    }

    return response;
  }

  /*
  public OauthmodelTokenResponseV3 parseResponse(int code, String contentType, InputStream payload) throws HttpResponseException, IOException {
      if(code != 200){
          final String json = Helper.convertInputStreamToString(payload);
          throw new HttpResponseException(code, json);
      }
      final String json = Helper.convertInputStreamToString(payload);
      return new OauthmodelTokenResponseV3().createFromJson(json);
  }
  */

}
