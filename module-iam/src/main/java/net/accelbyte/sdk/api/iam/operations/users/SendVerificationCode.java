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
import net.accelbyte.sdk.api.iam.operation_responses.users.SendVerificationCodeOpResponse;
import net.accelbyte.sdk.core.ApiError;
import net.accelbyte.sdk.core.HttpResponseException;
import net.accelbyte.sdk.core.Operation;
import net.accelbyte.sdk.core.util.Helper;

/**
 * SendVerificationCode
 *
 * <p>## The endpoint is going to be deprecated ### Endpoint migration guide - **Substitute
 * endpoint: _/iam/v3/public/namespaces/{namespace}/users/me/code/request [POST]_**
 *
 * <p>The verification code is sent to either the phone number or email address. It depends on the
 * LoginID's value. Available contexts for use : 1. **UserAccountRegistration** a context type used
 * for verifying email address in user account registration. It returns 409 if the email address
 * already verified. **_It is the default context if the Context field is empty_** 2.
 * **UpdateEmailAddress** a context type used for verify user before updating email address.(Without
 * email address verified checking) 3. **upgradeHeadlessAccount** The context is intended to be used
 * whenever the email address wanted to be automatically verified on upgrading a headless account.
 * If this context used, IAM rejects the request if the loginId field's value is already used by
 * others by returning HTTP Status Code 409.
 *
 * @deprecated
 */
@Deprecated
@Getter
@Setter
public class SendVerificationCode extends Operation {
  /** generated field's value */
  private String path = "/iam/namespaces/{namespace}/users/{userId}/verificationcode";

  private String method = "POST";
  private List<String> consumes = Arrays.asList("application/json");
  private List<String> produces = Arrays.asList("application/json");
  private String locationQuery = null;

  /** fields as input parameter */
  private String namespace;

  private String userId;
  private ModelSendVerificationCodeRequest body;

  /**
   * @param namespace required
   * @param userId required
   * @param body required
   */
  @Builder
  // @deprecated 2022-08-29 - All args constructor may cause problems. Use builder instead.
  @Deprecated
  public SendVerificationCode(
      String customBasePath,
      String namespace,
      String userId,
      ModelSendVerificationCodeRequest body) {
    this.namespace = namespace;
    this.userId = userId;
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
    if (this.userId != null) {
      pathParams.put("userId", this.userId);
    }
    return pathParams;
  }

  @Override
  public ModelSendVerificationCodeRequest getBodyParams() {
    return this.body;
  }

  @Override
  public boolean isValid() {
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

  public SendVerificationCodeOpResponse parseResponse(
      int code, String contentType, InputStream payload) throws HttpResponseException, IOException {
    final SendVerificationCodeOpResponse response = new SendVerificationCodeOpResponse();

    response.setHttpStatusCode(code);
    response.setContentType(contentType);

    if (code == 204) {
      response.setSuccess(true);
    } else if (code == 400) {
      final String data = Helper.convertInputStreamToString(payload);
      response.setError400(data);
      response.setError(new ApiError("-1", data));
    } else if (code == 401) {
      final String json = Helper.convertInputStreamToString(payload);
      response.setError401(new RestErrorResponse().createFromJson(json));
      response.setError(response.getError401().translateToApiError());
    } else if (code == 403) {
      final String data = Helper.convertInputStreamToString(payload);
      response.setError403(data);
      response.setError(new ApiError("-1", data));
    } else if (code == 404) {
      final String data = Helper.convertInputStreamToString(payload);
      response.setError404(data);
      response.setError(new ApiError("-1", data));
    } else if (code == 409) {
      final String data = Helper.convertInputStreamToString(payload);
      response.setError409(data);
      response.setError(new ApiError("-1", data));
    } else if (code == 429) {
      final String data = Helper.convertInputStreamToString(payload);
      response.setError429(data);
      response.setError(new ApiError("-1", data));
    } else if (code == 500) {
      final String data = Helper.convertInputStreamToString(payload);
      response.setError500(data);
      response.setError(new ApiError("-1", data));
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
