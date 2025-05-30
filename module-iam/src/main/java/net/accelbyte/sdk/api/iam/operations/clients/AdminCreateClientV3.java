/*
 * Copyright (c) 2024 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.iam.operations.clients;

import java.io.*;
import java.util.*;
import lombok.Builder;
import lombok.Getter;
import lombok.Setter;
import net.accelbyte.sdk.api.iam.models.*;
import net.accelbyte.sdk.api.iam.operation_responses.clients.AdminCreateClientV3OpResponse;
import net.accelbyte.sdk.core.HttpResponseException;
import net.accelbyte.sdk.core.Operation;
import net.accelbyte.sdk.core.util.Helper;

/**
 * AdminCreateClientV3
 *
 * <p>Add a new OAuth 2.0 client A new client automatically granted with these scopes: commerce,
 * account, analytics, publishing, social.
 *
 * <p>**Note for Multi Tenant Mode (Confidential Client):** Only Super admin can set permission with
 * resource & action. Studio admin & game admin need set permission with permission module.
 *
 * <p>action code: 10301
 *
 * <p>**Fields Description:** - **clientId** : The client ID. e.g f815e5c44f364993961be3b3f26a7bf4 -
 * **clientName** : The client name. e.g E-commerce - **secret** : The client's secret. It's empty
 * if the client's type is a public client. Otherwise, the client secret is required - **namespace**
 * : The namespace where the client lives. e.g sample-game - **redirectUri** : Contains the redirect
 * URI used in OAuth callback. e.g https://example.net/platform - **oauthClientType** : The OAuth
 * 2.0 client type. The client type determines whether the authorization needs Proof Of Key Exchange
 * or not. A public client type doesn't have a client secret and should use PKCE flow. A
 * confidential client type has a client secret and don't use PKCE flow Supported oAuthClientType :
 * - **Public** - **Confidential** - **audiences** : List of target client IDs who is intended to
 * receive the token. e.g ["eaaa65618fe24293b00a61454182b435", "40073ee9bc3446d3a051a71b48509a5d"] -
 * **baseUri** : A base URI of the application. It is used for making sure the token is intended to
 * be used by the client. e.g https://example.net/platform - **clientPermissions** : Contains the
 * client's permissions - **deletable** : The flag to identify whether client is deletable
 * (optional). default value: true - **clientPlatform**: available client platform (optional).
 * default value: "" - Playstation - Xbox - Steam - Epic - IOS - GooglePlay - Nintendo - Oculus -
 * **twoFactorEnabled**: The flag to indicate whether 2FA validation is enable for this client.
 * default value: false - **oauthAccessTokenExpiration**: a configurable expiration time for
 * **access_token**, default value: 0 (mean fetch value from environment variable) -
 * **oauthRefreshTokenExpiration**: a configurable expiration time for **refresh_token**, default
 * value: 0 (mean fetch value from environment variable) - **oauthAccessTokenExpirationTimeUnit**: a
 * configurable expiration time unit for **access_token**, default value: SECONDS -
 * **oauthRefreshTokenExpirationTimeUnit**: a configurable expiration time unit for
 * **refresh_token**, default value: SECONDS
 */
@Getter
@Setter
public class AdminCreateClientV3 extends Operation {
  /** generated field's value */
  private String path = "/iam/v3/admin/namespaces/{namespace}/clients";

  private String method = "POST";
  private List<String> consumes = Arrays.asList("application/json");
  private List<String> produces = Arrays.asList("application/json");
  private String locationQuery = null;

  /** fields as input parameter */
  private String namespace;

  private ClientmodelClientCreationV3Request body;

  /**
   * @param namespace required
   * @param body required
   */
  @Builder
  // @deprecated 2022-08-29 - All args constructor may cause problems. Use builder instead.
  @Deprecated
  public AdminCreateClientV3(
      String customBasePath, String namespace, ClientmodelClientCreationV3Request body) {
    this.namespace = namespace;
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
    return pathParams;
  }

  @Override
  public ClientmodelClientCreationV3Request getBodyParams() {
    return this.body;
  }

  @Override
  public boolean isValid() {
    if (this.namespace == null) {
      return false;
    }
    if (this.body == null) {
      return false;
    }
    return true;
  }

  public AdminCreateClientV3OpResponse parseResponse(
      int code, String contentType, InputStream payload) throws HttpResponseException, IOException {
    final AdminCreateClientV3OpResponse response = new AdminCreateClientV3OpResponse();

    response.setHttpStatusCode(code);
    response.setContentType(contentType);

    if (code == 204) {
      response.setSuccess(true);
    } else if ((code == 200) || (code == 201)) {
      final String json = Helper.convertInputStreamToString(payload);
      response.setData(new ClientmodelClientV3Response().createFromJson(json));
      response.setSuccess(true);
    } else if (code == 400) {
      final String json = Helper.convertInputStreamToString(payload);
      response.setError400(new RestErrorResponse().createFromJson(json));
      response.setError(response.getError400().translateToApiError());
    } else if (code == 401) {
      final String json = Helper.convertInputStreamToString(payload);
      response.setError401(new RestErrorResponse().createFromJson(json));
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
  public ClientmodelClientV3Response parseResponse(int code, String contentType, InputStream payload) throws HttpResponseException, IOException {
      if(code != 201){
          final String json = Helper.convertInputStreamToString(payload);
          throw new HttpResponseException(code, json);
      }
      final String json = Helper.convertInputStreamToString(payload);
      return new ClientmodelClientV3Response().createFromJson(json);
  }
  */

}
