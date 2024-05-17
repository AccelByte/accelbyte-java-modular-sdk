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
import net.accelbyte.sdk.core.HttpResponseException;
import net.accelbyte.sdk.core.Operation;
import net.accelbyte.sdk.core.util.Helper;

/**
 * GenerateTokenByNewHeadlessAccountV4
 *
 * <p>This endpoint is being used to create headless account after 3rd platform authenticated, and
 * response token . The 'linkingToken' in request body is received from
 * "/platforms/{platformId}/token" when 3rd platform account is not linked to justice account yet.
 */
@Getter
@Setter
public class GenerateTokenByNewHeadlessAccountV4 extends Operation {
  /** generated field's value */
  private String path = "/iam/v4/oauth/headless/token";

  private String customBasePath = "";
  private String method = "POST";
  private List<String> consumes = Arrays.asList("application/x-www-form-urlencoded");
  private List<String> produces = Arrays.asList("application/json");
  private String locationQuery = null;

  /** fields as input parameter */
  private String additionalData;

  private Boolean extendExp;
  private String linkingToken;

  /**
   * @param linkingToken required
   */
  @Builder
  // @deprecated 2022-08-29 - All args constructor may cause problems. Use builder instead.
  @Deprecated
  public GenerateTokenByNewHeadlessAccountV4(
      String customBasePath, String additionalData, Boolean extendExp, String linkingToken) {
    this.additionalData = additionalData;
    this.extendExp = extendExp;
    this.linkingToken = linkingToken;
    this.customBasePath = customBasePath;

    securities.add("Bearer");
  }

  @Override
  public Map<String, Object> getFormParams() {
    Map<String, Object> formDataParams = new HashMap<>();
    if (this.additionalData != null) {
      formDataParams.put("additionalData", this.additionalData);
    }
    if (this.extendExp != null) {
      formDataParams.put(
          "extend_exp", this.extendExp == null ? null : String.valueOf(this.extendExp));
    }
    if (this.linkingToken != null) {
      formDataParams.put("linkingToken", this.linkingToken);
    }
    return formDataParams;
  }

  @Override
  public boolean isValid() {
    if (this.linkingToken == null) {
      return false;
    }
    return true;
  }

  public OauthmodelTokenResponseV3 parseResponse(int code, String contentType, InputStream payload)
      throws HttpResponseException, IOException {
    if (code != 200) {
      final String json = Helper.convertInputStreamToString(payload);
      throw new HttpResponseException(code, json);
    }
    final String json = Helper.convertInputStreamToString(payload);
    return new OauthmodelTokenResponseV3().createFromJson(json);
  }
}
