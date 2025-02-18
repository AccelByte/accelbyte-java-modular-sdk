/*
 * Copyright (c) 2024 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.iam.operations.o_auth2_0;

import java.io.*;
import java.util.*;
import lombok.Builder;
import lombok.Getter;
import lombok.Setter;
import net.accelbyte.sdk.api.iam.models.*;
import net.accelbyte.sdk.api.iam.operation_responses.o_auth2_0.Verify2faCodeOpResponse;
import net.accelbyte.sdk.core.HttpResponseException;
import net.accelbyte.sdk.core.Operation;
import net.accelbyte.sdk.core.util.Helper;

/**
 * Verify2FACode
 *
 * <p>Verify 2FA code This endpoint is used for verifying 2FA code. ## 2FA remember device To
 * remember device for 2FA, should provide cookie: device_token or header: Device-Token
 */
@Getter
@Setter
public class Verify2faCode extends Operation {
  /** generated field's value */
  private String path = "/iam/v3/oauth/mfa/verify";

  private String method = "POST";
  private List<String> consumes = Arrays.asList("application/x-www-form-urlencoded");
  private List<String> produces = Arrays.asList("application/json");
  private String locationQuery = null;

  /** fields as input parameter */
  private String code;

  private String factor;
  private String mfaToken;
  private Boolean rememberDevice;

  /**
   * @param code required
   * @param factor required
   * @param mfaToken required
   * @param rememberDevice required
   */
  @Builder
  // @deprecated 2022-08-29 - All args constructor may cause problems. Use builder instead.
  @Deprecated
  public Verify2faCode(
      String customBasePath, String code, String factor, String mfaToken, Boolean rememberDevice) {
    this.code = code;
    this.factor = factor;
    this.mfaToken = mfaToken;
    this.rememberDevice = rememberDevice;
    super.customBasePath = customBasePath != null ? customBasePath : "";

    securities.add("Bearer");
  }

  @Override
  public Map<String, Object> getFormParams() {
    Map<String, Object> formDataParams = new HashMap<>();
    if (this.code != null) {
      formDataParams.put("code", this.code);
    }
    if (this.factor != null) {
      formDataParams.put("factor", this.factor);
    }
    if (this.mfaToken != null) {
      formDataParams.put("mfaToken", this.mfaToken);
    }
    if (this.rememberDevice != null) {
      formDataParams.put(
          "rememberDevice",
          this.rememberDevice == null ? null : String.valueOf(this.rememberDevice));
    }
    return formDataParams;
  }

  @Override
  public boolean isValid() {
    if (this.code == null) {
      return false;
    }
    if (this.factor == null) {
      return false;
    }
    if (this.mfaToken == null) {
      return false;
    }
    if (this.rememberDevice == null) {
      return false;
    }
    return true;
  }

  public Verify2faCodeOpResponse parseResponse(int code, String contentType, InputStream payload)
      throws HttpResponseException, IOException {
    final Verify2faCodeOpResponse response = new Verify2faCodeOpResponse();

    response.setHttpStatusCode(code);
    response.setContentType(contentType);

    if (code == 204) {
      response.setSuccess(true);
    } else if ((code == 200) || (code == 201)) {
      final String json = Helper.convertInputStreamToString(payload);
      response.setData(new OauthmodelTokenResponseV3().createFromJson(json));
      response.setSuccess(true);
    } else if (code == 401) {
      final String json = Helper.convertInputStreamToString(payload);
      response.setError401(new OauthmodelErrorResponse().createFromJson(json));
      response.setError(response.getError401().translateToApiError());
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
