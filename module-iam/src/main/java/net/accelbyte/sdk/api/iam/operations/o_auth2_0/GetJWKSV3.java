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
import net.accelbyte.sdk.core.HttpResponseException;
import net.accelbyte.sdk.core.Operation;
import net.accelbyte.sdk.core.util.Helper;

/**
 * GetJWKSV3
 *
 * <p>This endpoint serves public keys for verifying JWT access tokens generated by this service.
 * When a client application wants to verify a JWT token, it needs to get the 'kid' value found in
 * the JWT token header and use it to look up the corresponding public key from a set returned by
 * this endpoint. The client application can then use that public key to verify the JWT. A client
 * application might cache the keys so it doesn't need to do request every time it needs to verify a
 * JWT token. If a client application caches the keys and a key with the same 'kid' cannot be found
 * in the cache, it should then try to refresh the keys by making a request to this endpoint again.
 * Please refer to the RFC for more information about JWK (JSON Web Key):
 * https://tools.ietf.org/html/rfc7517 action code : 10709
 */
@Getter
@Setter
public class GetJWKSV3 extends Operation {
  /** generated field's value */
  private String path = "/iam/v3/oauth/jwks";

  private String customBasePath = "";
  private String method = "GET";
  private List<String> consumes = Arrays.asList("");
  private List<String> produces = Arrays.asList("application/json");
  private String locationQuery = null;

  /** fields as input parameter */

  /** */
  @Builder
  // @deprecated 2022-08-29 - All args constructor may cause problems. Use builder instead.
  @Deprecated
  public GetJWKSV3(String customBasePath) {
    this.customBasePath = customBasePath;

    securities.add("Bearer");
  }

  @Override
  public boolean isValid() {
    return true;
  }

  public OauthcommonJWKSet parseResponse(int code, String contentType, InputStream payload)
      throws HttpResponseException, IOException {
    if (code != 200) {
      final String json = Helper.convertInputStreamToString(payload);
      throw new HttpResponseException(code, json);
    }
    final String json = Helper.convertInputStreamToString(payload);
    return new OauthcommonJWKSet().createFromJson(json);
  }
}
