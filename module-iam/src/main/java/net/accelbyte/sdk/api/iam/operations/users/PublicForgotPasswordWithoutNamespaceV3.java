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
import net.accelbyte.sdk.api.iam.operation_responses.users.PublicForgotPasswordWithoutNamespaceV3OpResponse;
import net.accelbyte.sdk.core.HttpResponseException;
import net.accelbyte.sdk.core.Operation;
import net.accelbyte.sdk.core.util.Helper;

/**
 * PublicForgotPasswordWithoutNamespaceV3
 *
 * <p>This endpoint does not need a namespace in the path, we will find the namespace based on:
 *
 * <p>- If this is premium environment, the namespace will be the publisher namespace. - If this is
 * shared cloud: - If this is from Admin Portal, we will find the user by the email. - If this is
 * not from Admin Portal, we will find the namespace based on the client id.
 *
 * <p>**Note**: - The param **clientId** is required in Shared Cloud - The namespace in the response
 * is publisher/studio namespace
 */
@Getter
@Setter
public class PublicForgotPasswordWithoutNamespaceV3 extends Operation {
  /** generated field's value */
  private String path = "/iam/v3/public/users/forgot";

  private String method = "POST";
  private List<String> consumes = Arrays.asList("application/json");
  private List<String> produces = Arrays.asList("application/json");
  private String locationQuery = null;

  /** fields as input parameter */
  private ModelForgotPasswordWithoutNamespaceRequestV3 body;

  /**
   * @param body required
   */
  @Builder
  // @deprecated 2022-08-29 - All args constructor may cause problems. Use builder instead.
  @Deprecated
  public PublicForgotPasswordWithoutNamespaceV3(
      String customBasePath, ModelForgotPasswordWithoutNamespaceRequestV3 body) {
    this.body = body;
    super.customBasePath = customBasePath != null ? customBasePath : "";

    securities.add("Bearer");
  }

  @Override
  public ModelForgotPasswordWithoutNamespaceRequestV3 getBodyParams() {
    return this.body;
  }

  @Override
  public boolean isValid() {
    if (this.body == null) {
      return false;
    }
    return true;
  }

  public PublicForgotPasswordWithoutNamespaceV3OpResponse parseResponse(
      int code, String contentType, InputStream payload) throws HttpResponseException, IOException {
    final PublicForgotPasswordWithoutNamespaceV3OpResponse response =
        new PublicForgotPasswordWithoutNamespaceV3OpResponse();

    response.setHttpStatusCode(code);
    response.setContentType(contentType);

    if (code == 204) {
      response.setSuccess(true);
    } else if ((code == 200) || (code == 201)) {
      final String json = Helper.convertInputStreamToString(payload);
      response.setData(new ModelForgotPasswordResponseV3().createFromJson(json));
      response.setSuccess(true);
    } else if (code == 400) {
      final String json = Helper.convertInputStreamToString(payload);
      response.setError400(new RestErrorResponse().createFromJson(json));
      response.setError(response.getError400().translateToApiError());
    } else if (code == 500) {
      final String json = Helper.convertInputStreamToString(payload);
      response.setError500(new RestErrorResponse().createFromJson(json));
      response.setError(response.getError500().translateToApiError());
    }

    return response;
  }

  /*
  public ModelForgotPasswordResponseV3 parseResponse(int code, String contentType, InputStream payload) throws HttpResponseException, IOException {
      if(code != 200){
          final String json = Helper.convertInputStreamToString(payload);
          throw new HttpResponseException(code, json);
      }
      final String json = Helper.convertInputStreamToString(payload);
      return new ModelForgotPasswordResponseV3().createFromJson(json);
  }
  */

}
