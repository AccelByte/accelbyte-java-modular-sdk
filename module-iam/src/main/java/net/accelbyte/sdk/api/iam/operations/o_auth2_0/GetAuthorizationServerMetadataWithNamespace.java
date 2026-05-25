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
import net.accelbyte.sdk.api.iam.operation_responses.o_auth2_0.GetAuthorizationServerMetadataWithNamespaceOpResponse;
import net.accelbyte.sdk.core.HttpResponseException;
import net.accelbyte.sdk.core.Operation;
import net.accelbyte.sdk.core.util.Helper;

/**
 * GetAuthorizationServerMetadataWithNamespace
 *
 * <p>Implements RFC 8414((https://datatracker.ietf.org/doc/html/rfc8414)), providing a standardized
 * mechanism for OAuth 2.0 clients to discover authorization server metadata. Clients can retrieve
 * detailed information about server capabilities, supported grant types, cryptographic algorithms,
 * and API locations without manual configuration. ### Key Features: Dynamic Discovery: Clients
 * automatically discover server capabilities Standard Compliance: Implements RFC 8414 OAuth 2.0
 * Authorization Server Metadata Security Information: Provides details about supported security
 * features API Discovery: Returns URLs for all OAuth APIs (authorization, token, revocation, etc.)
 * ### Request: Method: GET Path: '/.well-known/oauth-authorization-server/{namespace}' Headers:
 * Accept: application/json ### Response: Returns a JSON object containing comprehensive metadata
 * about the OAuth authorization server configuration.
 */
@Getter
@Setter
public class GetAuthorizationServerMetadataWithNamespace extends Operation {
  /** generated field's value */
  private String path = "/iam/.well-known/oauth-authorization-server/{namespace}";

  private String method = "GET";
  private List<String> consumes = Arrays.asList("*/*");
  private List<String> produces = Arrays.asList("application/json");
  private String locationQuery = null;

  /** fields as input parameter */
  private String namespace;

  /**
   * @param namespace required
   */
  @Builder
  // @deprecated 2022-08-29 - All args constructor may cause problems. Use builder instead.
  @Deprecated
  public GetAuthorizationServerMetadataWithNamespace(String customBasePath, String namespace) {
    this.namespace = namespace;
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
  public boolean isValid() {
    if (this.namespace == null) {
      return false;
    }
    return true;
  }

  public GetAuthorizationServerMetadataWithNamespaceOpResponse parseResponse(
      int code, String contentType, InputStream payload) throws HttpResponseException, IOException {
    final GetAuthorizationServerMetadataWithNamespaceOpResponse response =
        new GetAuthorizationServerMetadataWithNamespaceOpResponse();

    response.setHttpStatusCode(code);
    response.setContentType(contentType);

    if (code == 204) {
      response.setSuccess(true);
    } else if ((code == 200) || (code == 201)) {
      final String json = Helper.convertInputStreamToString(payload);
      response.setData(new OauthcommonASMetadataResponse().createFromJson(json));
      response.setSuccess(true);
    }

    return response;
  }

  /*
  public OauthcommonASMetadataResponse parseResponse(int code, String contentType, InputStream payload) throws HttpResponseException, IOException {
      if(code != 200){
          final String json = Helper.convertInputStreamToString(payload);
          throw new HttpResponseException(code, json);
      }
      final String json = Helper.convertInputStreamToString(payload);
      return new OauthcommonASMetadataResponse().createFromJson(json);
  }
  */

}
