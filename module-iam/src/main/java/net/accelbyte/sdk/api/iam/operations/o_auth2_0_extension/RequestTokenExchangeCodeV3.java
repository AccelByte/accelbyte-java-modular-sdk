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
import net.accelbyte.sdk.api.iam.operation_responses.o_auth2_0_extension.RequestTokenExchangeCodeV3OpResponse;
import net.accelbyte.sdk.core.HttpResponseException;
import net.accelbyte.sdk.core.Operation;
import net.accelbyte.sdk.core.util.Helper;

/**
 * RequestTokenExchangeCodeV3
 *
 * <p>This endpoint is being used to request the code to exchange a new token. The target new
 * token's clientId should NOT be same with current using one. Path namespace should be target
 * namespace. Client ID should match the target namespace.
 *
 * <p>The code in response can be consumed by `/iam/v3/token/exchange`
 */
@Getter
@Setter
public class RequestTokenExchangeCodeV3 extends Operation {
  /** generated field's value */
  private String path = "/iam/v3/namespace/{namespace}/token/request";

  private String method = "POST";
  private List<String> consumes = Arrays.asList("application/x-www-form-urlencoded");
  private List<String> produces = Arrays.asList("application/json");
  private String locationQuery = null;

  /** fields as input parameter */
  private String namespace;

  private String codeChallenge;
  private String codeChallengeMethod;
  private String clientId;

  /**
   * @param namespace required
   * @param clientId required
   */
  @Builder
  // @deprecated 2022-08-29 - All args constructor may cause problems. Use builder instead.
  @Deprecated
  public RequestTokenExchangeCodeV3(
      String customBasePath,
      String namespace,
      String codeChallenge,
      String codeChallengeMethod,
      String clientId) {
    this.namespace = namespace;
    this.codeChallenge = codeChallenge;
    this.codeChallengeMethod = codeChallengeMethod;
    this.clientId = clientId;
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
  public Map<String, List<String>> getQueryParams() {
    Map<String, List<String>> queryParams = new HashMap<>();
    queryParams.put(
        "code_challenge", this.codeChallenge == null ? null : Arrays.asList(this.codeChallenge));
    queryParams.put(
        "code_challenge_method",
        this.codeChallengeMethod == null ? null : Arrays.asList(this.codeChallengeMethod));
    return queryParams;
  }

  @Override
  public Map<String, Object> getFormParams() {
    Map<String, Object> formDataParams = new HashMap<>();
    if (this.clientId != null) {
      formDataParams.put("client_id", this.clientId);
    }
    return formDataParams;
  }

  @Override
  public boolean isValid() {
    if (this.namespace == null) {
      return false;
    }
    if (this.clientId == null) {
      return false;
    }
    return true;
  }

  public RequestTokenExchangeCodeV3OpResponse parseResponse(
      int code, String contentType, InputStream payload) throws HttpResponseException, IOException {
    final RequestTokenExchangeCodeV3OpResponse response =
        new RequestTokenExchangeCodeV3OpResponse();

    response.setHttpStatusCode(code);
    response.setContentType(contentType);

    if (code == 204) {
      response.setSuccess(true);
    } else if ((code == 200) || (code == 201)) {
      final String json = Helper.convertInputStreamToString(payload);
      response.setData(new OauthmodelTargetTokenCodeResponse().createFromJson(json));
      response.setSuccess(true);
    }

    return response;
  }

  /*
  public OauthmodelTargetTokenCodeResponse parseResponse(int code, String contentType, InputStream payload) throws HttpResponseException, IOException {
      if(code != 200){
          final String json = Helper.convertInputStreamToString(payload);
          throw new HttpResponseException(code, json);
      }
      final String json = Helper.convertInputStreamToString(payload);
      return new OauthmodelTargetTokenCodeResponse().createFromJson(json);
  }
  */

  @Override
  protected Map<String, String> getCollectionFormatMap() {
    Map<String, String> result = new HashMap<>();
    result.put("code_challenge", "None");
    result.put("code_challenge_method", "None");
    return result;
  }

  public enum CodeChallengeMethod {
    S256("S256"),
    Plain("plain");

    private String value;

    CodeChallengeMethod(String value) {
      this.value = value;
    }

    @Override
    public String toString() {
      return this.value;
    }
  }

  public static class RequestTokenExchangeCodeV3Builder {
    private String codeChallengeMethod;

    public RequestTokenExchangeCodeV3Builder codeChallengeMethod(final String codeChallengeMethod) {
      this.codeChallengeMethod = codeChallengeMethod;
      return this;
    }

    public RequestTokenExchangeCodeV3Builder codeChallengeMethodFromEnum(
        final CodeChallengeMethod codeChallengeMethod) {
      this.codeChallengeMethod = codeChallengeMethod.toString();
      return this;
    }
  }
}
