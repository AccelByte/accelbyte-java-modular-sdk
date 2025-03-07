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
import net.accelbyte.sdk.api.iam.operation_responses.o_auth.TokenGrantOpResponse;
import net.accelbyte.sdk.core.HttpResponseException;
import net.accelbyte.sdk.core.Operation;
import net.accelbyte.sdk.core.util.Helper;

/**
 * TokenGrant
 *
 * <p>## The endpoint is going to be deprecated
 *
 * <p>### Endpoint migration guide
 *
 * <p>- **Substitute endpoint: /iam/v3/oauth/token [POST]** - **Note: difference in V3 response:**
 * format differenceï¼Pascal case => Camel case): permissions field from Action => action, Resource
 * => resource
 *
 * <p>This endpoint requires all requests to have `Authorization` header set with `Basic` access
 * authentication constructed from client id and client secret.
 *
 * <p>This endpoint supports different **grant types**:
 *
 * <p>1. Grant Type == `client_credentials`: This endpoint will check the client credentials
 * provided through Authorization header. 2. Grant Type == `password`: The grant type to use for
 * authenticating a user, whether it's by email / username and password combination or through
 * platform. 3. Grant Type == `refresh_token`: Used to get a new access token for a valid refresh
 * token. 4. Grant Type == `authorization_code`: It generates the user token by given the
 * authorization code which generated in "/authorize" API response. It should also pass in the
 * redirect_uri, which should be the same as generating the authorization code request.
 *
 * <p>For platform authentication, use grant type `password`. The `username` field would be in form
 * of `platform:`, for example `platform:steam` for Steam. For the `password` field, set it to the
 * authentication/authorization ticket or token obtainable through the respective platform SDK after
 * authenticated the user to the platform. Supported platforms:
 *
 * <p>- **steam** - use `platform:steam` as the username and use the authentication ticket obtained
 * from Steam through the Steam SDK as the password. - **ps4** - use `platform:ps4` as the username
 * and use the authorization code obtained from the PlayStation Network through a player PS4 unit as
 * the password. - **live** - use `platform:live` as the username and use token obtained from Xbox
 * Secure Token Service (XSTS) as the password. - **oculus** - use `platform:oculus` as the username
 * and use the `user_id:nonce` as password obtained from Oculus through the Oculus SDK.
 *
 * <p>The access token and refresh token are in form of JWT token. An access token JWT contains data
 * which structure is similar to the Response Class below, but without OAuth-related data. To verify
 * a token, use the public keys obtained from the `/jwks` endpoint below.
 *
 * <p>## Access Token Content
 *
 * <p>Following is the access tokenâs content:
 *
 * <p>- **namespace**. It is the namespace the token was generated from. - **display_name**. The
 * display name of the sub. It is empty if the token is generated from the client credential -
 * **roles**. The subâs roles. It is empty if the token is generated from the client credential -
 * **namespace_roles**. The subâs roles scoped to namespace. Improvement from roles, which make
 * the role scoped to specific namespace instead of global to publisher namespace - **permissions**.
 * The sub or audâ permissions - **bans**. The subâs list of bans. It is used by the IAM client
 * for validating the token. - **jflgs**. It stands for Justice Flags. It is a special flag used for
 * storing additional status information regarding the sub. It is implemented as a bit mask.
 * Following explains what each bit represents: - 1: Email Address Verified - 2: Phone Number
 * Verified - 4: Anonymous - **aud**. The aud is the client ID. - **iat**. The time the token issues
 * at. It is in Epoch time format - **exp**. The time the token expires. It is in Epoch time format
 * - **sub**. The UserID. The sub is omitted if the token is generated from client credential
 *
 * <p>## Bans
 *
 * <p>The JWT contains user's active bans with its expiry date. List of ban types can be obtained
 * from /bans.
 *
 * <p>## Track Login History
 *
 * <p>This endpoint will track login history to detect suspicious login activity, please provide
 * "device_id" (alphanumeric) in request header parameter otherwise we will set to "unknown". Align
 * with General Data Protection Regulation in Europe, user login history will be kept within 28 days
 * by default"
 *
 * @deprecated
 */
@Deprecated
@Getter
@Setter
public class TokenGrant extends Operation {
  /** generated field's value */
  private String path = "/iam/oauth/token";

  private String method = "POST";
  private List<String> consumes = Arrays.asList("application/x-www-form-urlencoded");
  private List<String> produces = Arrays.asList("application/json");
  private String locationQuery = null;

  /** fields as input parameter */
  private String code;

  private Boolean extendExp;
  private String namespace;
  private String password;
  private String redirectUri;
  private String refreshToken;
  private String username;
  private String grantType;

  /**
   * @param grantType required
   */
  @Builder
  // @deprecated 2022-08-29 - All args constructor may cause problems. Use builder instead.
  @Deprecated
  public TokenGrant(
      String customBasePath,
      String code,
      Boolean extendExp,
      String namespace,
      String password,
      String redirectUri,
      String refreshToken,
      String username,
      String grantType) {
    this.code = code;
    this.extendExp = extendExp;
    this.namespace = namespace;
    this.password = password;
    this.redirectUri = redirectUri;
    this.refreshToken = refreshToken;
    this.username = username;
    this.grantType = grantType;
    super.customBasePath = customBasePath != null ? customBasePath : "";

    securities.add("Bearer");
  }

  @Override
  public Map<String, Object> getFormParams() {
    Map<String, Object> formDataParams = new HashMap<>();
    if (this.code != null) {
      formDataParams.put("code", this.code);
    }
    if (this.extendExp != null) {
      formDataParams.put(
          "extend_exp", this.extendExp == null ? null : String.valueOf(this.extendExp));
    }
    if (this.namespace != null) {
      formDataParams.put("namespace", this.namespace);
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

  public TokenGrantOpResponse parseResponse(int code, String contentType, InputStream payload)
      throws HttpResponseException, IOException {
    final TokenGrantOpResponse response = new TokenGrantOpResponse();

    response.setHttpStatusCode(code);
    response.setContentType(contentType);

    if (code == 204) {
      response.setSuccess(true);
    } else if ((code == 200) || (code == 201)) {
      final String json = Helper.convertInputStreamToString(payload);
      response.setData(new OauthmodelTokenResponse().createFromJson(json));
      response.setSuccess(true);
    } else if (code == 400) {
      final String json = Helper.convertInputStreamToString(payload);
      response.setError400(new OauthmodelErrorResponse().createFromJson(json));
      response.setError(response.getError400().translateToApiError());
    } else if (code == 401) {
      final String json = Helper.convertInputStreamToString(payload);
      response.setError401(new OauthmodelErrorResponse().createFromJson(json));
      response.setError(response.getError401().translateToApiError());
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

  public enum GrantType {
    AuthorizationCode("authorization_code"),
    ClientCredentials("client_credentials"),
    Password("password"),
    RefreshToken("refresh_token");

    private String value;

    GrantType(String value) {
      this.value = value;
    }

    @Override
    public String toString() {
      return this.value;
    }
  }

  public static class TokenGrantBuilder {
    private String grantType;

    public TokenGrantBuilder grantType(final String grantType) {
      this.grantType = grantType;
      return this;
    }

    public TokenGrantBuilder grantTypeFromEnum(final GrantType grantType) {
      this.grantType = grantType.toString();
      return this;
    }
  }
}
