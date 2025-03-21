/*
 * Copyright (c) 2024 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.iam.operations.o_auth2_0_extension;

import java.io.*;
import java.util.*;
import lombok.Builder;
import lombok.Getter;
import lombok.Setter;
import net.accelbyte.sdk.api.iam.models.*;
import net.accelbyte.sdk.api.iam.operation_responses.o_auth2_0_extension.RequestTokenByOneTimeLinkCodeResponseV3OpResponse;
import net.accelbyte.sdk.core.HttpResponseException;
import net.accelbyte.sdk.core.Operation;
import net.accelbyte.sdk.core.util.Helper;

/**
 * RequestTokenByOneTimeLinkCodeResponseV3
 *
 * <p>This endpoint is being used to generate user's token by one time link code. It requires a code
 * which can be generated from `/iam/v3/link/code/request` or
 * `/iam/v3/public/users/me/link/forward`.
 *
 * <p>This endpoint support creating transient token by utilizing **isTransient** param:
 * **isTransient=true** will generate a transient token with a short Time Expiration and without a
 * refresh token **isTransient=false** will consume the one-time code and generate the access token
 * with a refresh token.
 */
@Getter
@Setter
public class RequestTokenByOneTimeLinkCodeResponseV3 extends Operation {
  /** generated field's value */
  private String path = "/iam/v3/link/token/exchange";

  private String method = "POST";
  private List<String> consumes = Arrays.asList("application/x-www-form-urlencoded");
  private List<String> produces = Arrays.asList("application/json");
  private String locationQuery = null;

  /** fields as input parameter */
  private String additionalData;

  private Boolean isTransient;
  private String clientId;
  private String oneTimeLinkCode;

  /**
   * @param clientId required
   * @param oneTimeLinkCode required
   */
  @Builder
  // @deprecated 2022-08-29 - All args constructor may cause problems. Use builder instead.
  @Deprecated
  public RequestTokenByOneTimeLinkCodeResponseV3(
      String customBasePath,
      String additionalData,
      Boolean isTransient,
      String clientId,
      String oneTimeLinkCode) {
    this.additionalData = additionalData;
    this.isTransient = isTransient;
    this.clientId = clientId;
    this.oneTimeLinkCode = oneTimeLinkCode;
    super.customBasePath = customBasePath != null ? customBasePath : "";
  }

  @Override
  public Map<String, Object> getFormParams() {
    Map<String, Object> formDataParams = new HashMap<>();
    if (this.additionalData != null) {
      formDataParams.put("additionalData", this.additionalData);
    }
    if (this.isTransient != null) {
      formDataParams.put(
          "isTransient", this.isTransient == null ? null : String.valueOf(this.isTransient));
    }
    if (this.clientId != null) {
      formDataParams.put("client_id", this.clientId);
    }
    if (this.oneTimeLinkCode != null) {
      formDataParams.put("oneTimeLinkCode", this.oneTimeLinkCode);
    }
    return formDataParams;
  }

  @Override
  public boolean isValid() {
    if (this.clientId == null) {
      return false;
    }
    if (this.oneTimeLinkCode == null) {
      return false;
    }
    return true;
  }

  public RequestTokenByOneTimeLinkCodeResponseV3OpResponse parseResponse(
      int code, String contentType, InputStream payload) throws HttpResponseException, IOException {
    final RequestTokenByOneTimeLinkCodeResponseV3OpResponse response =
        new RequestTokenByOneTimeLinkCodeResponseV3OpResponse();

    response.setHttpStatusCode(code);
    response.setContentType(contentType);

    if (code == 204) {
      response.setSuccess(true);
    } else if ((code == 200) || (code == 201)) {
      final String json = Helper.convertInputStreamToString(payload);
      response.setData(new OauthmodelTokenResponseV3().createFromJson(json));
      response.setSuccess(true);
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
