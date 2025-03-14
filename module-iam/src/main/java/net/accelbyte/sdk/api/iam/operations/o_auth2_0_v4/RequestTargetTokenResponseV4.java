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
import net.accelbyte.sdk.api.iam.operation_responses.o_auth2_0_v4.RequestTargetTokenResponseV4OpResponse;
import net.accelbyte.sdk.core.HttpResponseException;
import net.accelbyte.sdk.core.Operation;
import net.accelbyte.sdk.core.util.Helper;

/**
 * RequestTargetTokenResponseV4
 *
 * <p>This endpoint is being used to generate target token. It requires basic header with ClientID
 * and Secret, it should match the ClientID when call `/iam/v3/namespace/{namespace}/token/request`
 * The code should be generated from `/iam/v3/namespace/{namespace}/token/request`.
 */
@Getter
@Setter
public class RequestTargetTokenResponseV4 extends Operation {
  /** generated field's value */
  private String path = "/iam/v4/oauth/token/exchange";

  private String method = "POST";
  private List<String> consumes = Arrays.asList("application/x-www-form-urlencoded");
  private List<String> produces = Arrays.asList("application/json");
  private String locationQuery = null;

  /** fields as input parameter */
  private String additionalData;

  private String code;

  /**
   * @param code required
   */
  @Builder
  // @deprecated 2022-08-29 - All args constructor may cause problems. Use builder instead.
  @Deprecated
  public RequestTargetTokenResponseV4(String customBasePath, String additionalData, String code) {
    this.additionalData = additionalData;
    this.code = code;
    super.customBasePath = customBasePath != null ? customBasePath : "";

    securities.add("Bearer");
  }

  @Override
  public Map<String, Object> getFormParams() {
    Map<String, Object> formDataParams = new HashMap<>();
    if (this.additionalData != null) {
      formDataParams.put("additionalData", this.additionalData);
    }
    if (this.code != null) {
      formDataParams.put("code", this.code);
    }
    return formDataParams;
  }

  @Override
  public boolean isValid() {
    if (this.code == null) {
      return false;
    }
    return true;
  }

  public RequestTargetTokenResponseV4OpResponse parseResponse(
      int code, String contentType, InputStream payload) throws HttpResponseException, IOException {
    final RequestTargetTokenResponseV4OpResponse response =
        new RequestTargetTokenResponseV4OpResponse();

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
