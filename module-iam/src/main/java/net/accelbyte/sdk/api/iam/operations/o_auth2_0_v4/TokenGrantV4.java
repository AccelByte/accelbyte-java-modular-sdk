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
import net.accelbyte.sdk.api.iam.operation_responses.o_auth2_0_v4.TokenGrantV4OpResponse;
import net.accelbyte.sdk.core.HttpResponseException;
import net.accelbyte.sdk.core.Operation;
import net.accelbyte.sdk.core.util.Helper;

/**
 * TokenGrantV4
 *
 * <p>This endpoint supports grant type: 1. Grant Type == `authorization_code`: It generates the
 * user token by given the authorization code which generated in "/iam/v3/authenticate" API
 * response. It should also pass in the redirect_uri, which should be the same as generating the
 * authorization code request. 2. Grant Type == `password`: The grant type to use for authenticating
 * a user, whether it's by email / username and password combination or through platform. 3. Grant
 * Type == `refresh_token`: Used to get a new access token for a valid refresh token. 4. Grant Type
 * == `client_credentials`: It generates a token by checking the client credentials provided through
 * Authorization header. 5. Grant Type ==
 * `urn:ietf:params:oauth:grant-type:extend_client_credentials`: It generates a token by checking
 * the client credentials provided through Authorization header. It only allows publisher/studio
 * namespace client. In generated token: 1. There wil be no roles, namespace_roles & permission. 2.
 * The scope will be fixed as 'extend'. 3. There will have a new field 'extend_namespace', the value
 * is from token request body. 6. Grant Type ==
 * `urn:ietf:params:oauth:grant-type:login_queue_ticket`: It generates a token by validating the
 * login queue ticket against login queue service.
 *
 * <p>## Access Token Content Following is the access tokenâs content: - **namespace**. It is the
 * namespace the token was generated from. - **display_name**. The display name of the sub. It is
 * empty if the token is generated from the client credential - **roles**. The subâs roles. It is
 * empty if the token is generated from the client credential - **namespace_roles**. The subâs
 * roles scoped to namespace. Improvement from roles, which make the role scoped to specific
 * namespace instead of global to publisher namespace - **permissions**. The sub or audâ
 * permissions - **bans**. The subâs list of bans. It is used by the IAM client for validating the
 * token. - **jflgs**. It stands for Justice Flags. It is a special flag used for storing additional
 * status information regarding the sub. It is implemented as a bit mask. Following explains what
 * each bit represents: - 1: Email Address Verified - 2: Phone Number Verified - 4: Anonymous - 8:
 * Suspicious Login - **aud**. The aud is the targeted resource server. - **iat**. The time the
 * token issues at. It is in Epoch time format - **exp**. The time the token expires. It is in Epoch
 * time format - **client_id**. The UserID. The sub is omitted if the token is generated from client
 * credential - **scope**. The scope of the access request, expressed as a list of space-delimited,
 * case-sensitive strings
 *
 * <p>## Bans The JWT contains user's active bans with its expiry date. List of ban types can be
 * obtained from /bans. ## Device Cookie Validation _**For grant type "password" only**_ Device
 * Cookie is used to protect the user account from brute force login attack, [more detail from
 * OWASP. This endpoint will read device cookie from request header **Auth-Trust-Id**. If device
 * cookie not found, it will generate a new one and set it into response body **auth_trust_id** when
 * successfully login. ## Track Login History This endpoint will track login history to detect
 * suspicious login activity, please provide **Device-Id** (alphanumeric) in request header
 * parameter otherwise it will set to "unknown". Align with General Data Protection Regulation in
 * Europe, user login history will be kept within 28 days by default" ## 2FA remember device To
 * remember device for 2FA, should provide cookie: device_token or header: Device-Token ## Response
 * note If it is a user token request and user hasn't accepted required legal policy, the field
 * `is_comply` will be false in response and responsed token will have no permission. action code:
 * 10703
 */
@Getter
@Setter
public class TokenGrantV4 extends Operation {
  /** generated field's value */
  private String path = "/iam/v4/oauth/token";

  private String method = "POST";
  private List<String> consumes = Arrays.asList("application/x-www-form-urlencoded");
  private List<String> produces = Arrays.asList("application/json");
  private String locationQuery = null;

  /** fields as input parameter */
  private String codeChallenge;

  private String codeChallengeMethod;
  private String additionalData;
  private String clientId;
  private String clientSecret;
  private String code;
  private String codeVerifier;
  private String extendNamespace;
  private Boolean extendExp;
  private String loginQueueTicket;
  private String password;
  private String redirectUri;
  private String refreshToken;
  private String scope;
  private String username;
  private String grantType;

  /**
   * @param grantType required
   */
  @Builder
  // @deprecated 2022-08-29 - All args constructor may cause problems. Use builder instead.
  @Deprecated
  public TokenGrantV4(
      String customBasePath,
      String codeChallenge,
      String codeChallengeMethod,
      String additionalData,
      String clientId,
      String clientSecret,
      String code,
      String codeVerifier,
      String extendNamespace,
      Boolean extendExp,
      String loginQueueTicket,
      String password,
      String redirectUri,
      String refreshToken,
      String scope,
      String username,
      String grantType) {
    this.codeChallenge = codeChallenge;
    this.codeChallengeMethod = codeChallengeMethod;
    this.additionalData = additionalData;
    this.clientId = clientId;
    this.clientSecret = clientSecret;
    this.code = code;
    this.codeVerifier = codeVerifier;
    this.extendNamespace = extendNamespace;
    this.extendExp = extendExp;
    this.loginQueueTicket = loginQueueTicket;
    this.password = password;
    this.redirectUri = redirectUri;
    this.refreshToken = refreshToken;
    this.scope = scope;
    this.username = username;
    this.grantType = grantType;
    super.customBasePath = customBasePath != null ? customBasePath : "";

    securities.add("Basic");
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
    if (this.additionalData != null) {
      formDataParams.put("additionalData", this.additionalData);
    }
    if (this.clientId != null) {
      formDataParams.put("client_id", this.clientId);
    }
    if (this.clientSecret != null) {
      formDataParams.put("client_secret", this.clientSecret);
    }
    if (this.code != null) {
      formDataParams.put("code", this.code);
    }
    if (this.codeVerifier != null) {
      formDataParams.put("code_verifier", this.codeVerifier);
    }
    if (this.extendNamespace != null) {
      formDataParams.put("extendNamespace", this.extendNamespace);
    }
    if (this.extendExp != null) {
      formDataParams.put(
          "extend_exp", this.extendExp == null ? null : String.valueOf(this.extendExp));
    }
    if (this.loginQueueTicket != null) {
      formDataParams.put("login_queue_ticket", this.loginQueueTicket);
    }
    if (this.password != null) {
      formDataParams.put("password", this.password);
    }
    if (this.redirectUri != null) {
      formDataParams.put("redirect_uri", this.redirectUri);
    }
    if (this.refreshToken != null) {
      formDataParams.put("refresh_token", this.refreshToken);
    }
    if (this.scope != null) {
      formDataParams.put("scope", this.scope);
    }
    if (this.username != null) {
      formDataParams.put("username", this.username);
    }
    if (this.grantType != null) {
      formDataParams.put("grant_type", this.grantType);
    }
    return formDataParams;
  }

  @Override
  public boolean isValid() {
    if (this.grantType == null) {
      return false;
    }
    return true;
  }

  public TokenGrantV4OpResponse parseResponse(int code, String contentType, InputStream payload)
      throws HttpResponseException, IOException {
    final TokenGrantV4OpResponse response = new TokenGrantV4OpResponse();

    response.setHttpStatusCode(code);
    response.setContentType(contentType);

    if (code == 204) {
      response.setSuccess(true);
    } else if ((code == 200) || (code == 201)) {
      final String json = Helper.convertInputStreamToString(payload);
      response.setData(new OauthmodelTokenWithDeviceCookieResponseV3().createFromJson(json));
      response.setSuccess(true);
    } else if (code == 400) {
      final String json = Helper.convertInputStreamToString(payload);
      response.setError400(new OauthmodelErrorResponse().createFromJson(json));
      response.setError(response.getError400().translateToApiError());
    } else if (code == 401) {
      final String json = Helper.convertInputStreamToString(payload);
      response.setError401(new OauthmodelErrorResponse().createFromJson(json));
      response.setError(response.getError401().translateToApiError());
    } else if (code == 403) {
      final String json = Helper.convertInputStreamToString(payload);
      response.setError403(new OauthmodelErrorResponse().createFromJson(json));
      response.setError(response.getError403().translateToApiError());
    } else if (code == 429) {
      final String json = Helper.convertInputStreamToString(payload);
      response.setError429(new OauthmodelErrorResponse().createFromJson(json));
      response.setError(response.getError429().translateToApiError());
    }

    return response;
  }

  /*
  public OauthmodelTokenWithDeviceCookieResponseV3 parseResponse(int code, String contentType, InputStream payload) throws HttpResponseException, IOException {
      if(code != 200){
          final String json = Helper.convertInputStreamToString(payload);
          throw new HttpResponseException(code, json);
      }
      final String json = Helper.convertInputStreamToString(payload);
      return new OauthmodelTokenWithDeviceCookieResponseV3().createFromJson(json);
  }
  */

  @Override
  protected Map<String, String> getCollectionFormatMap() {
    Map<String, String> result = new HashMap<>();
    result.put("code_challenge", "None");
    result.put("code_challenge_method", "None");
    return result;
  }

  public enum GrantType {
    AuthorizationCode("authorization_code"),
    ClientCredentials("client_credentials"),
    Password("password"),
    RefreshToken("refresh_token"),
    UrnietfparamsoauthgrantTypeextendClientCredentials(
        "urn:ietf:params:oauth:grant-type:extend_client_credentials"),
    UrnietfparamsoauthgrantTypeloginQueueTicket(
        "urn:ietf:params:oauth:grant-type:login_queue_ticket");

    private String value;

    GrantType(String value) {
      this.value = value;
    }

    @Override
    public String toString() {
      return this.value;
    }
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

  public static class TokenGrantV4Builder {
    private String grantType;
    private String codeChallengeMethod;

    public TokenGrantV4Builder grantType(final String grantType) {
      this.grantType = grantType;
      return this;
    }

    public TokenGrantV4Builder grantTypeFromEnum(final GrantType grantType) {
      this.grantType = grantType.toString();
      return this;
    }

    public TokenGrantV4Builder codeChallengeMethod(final String codeChallengeMethod) {
      this.codeChallengeMethod = codeChallengeMethod;
      return this;
    }

    public TokenGrantV4Builder codeChallengeMethodFromEnum(
        final CodeChallengeMethod codeChallengeMethod) {
      this.codeChallengeMethod = codeChallengeMethod.toString();
      return this;
    }
  }
}
