/*
 * Copyright (c) 2024 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.session.operations.game_session;

import java.io.*;
import java.util.*;
import lombok.Builder;
import lombok.Getter;
import lombok.Setter;
import net.accelbyte.sdk.api.session.models.*;
import net.accelbyte.sdk.api.session.operation_responses.game_session.GetSessionServerSecretOpResponse;
import net.accelbyte.sdk.core.HttpResponseException;
import net.accelbyte.sdk.core.Operation;
import net.accelbyte.sdk.core.util.Helper;

/**
 * getSessionServerSecret
 *
 * <p>Used by game Client to Get Secret constraints - EnableSecret = true - Type = "DS" - secret
 * value will only be produced if enableSecret is true and type is DS
 *
 * <p>if enableSecret = false - empty secret will be returned as 200 OK
 *
 * <p>Expected caller of this API - Game Client to get server secret
 *
 * <p>In the Response you will get following: - 200 OK { "secret": }
 *
 * <p>If there is error: - 400 Invalid path parameters - 401 unauthorized - 404 StatusNotFound - 500
 * Internal server error
 */
@Getter
@Setter
public class GetSessionServerSecret extends Operation {
  /** generated field's value */
  private String path = "/session/v1/public/namespaces/{namespace}/gamesessions/{sessionId}/secret";

  private String method = "GET";
  private List<String> consumes = Arrays.asList("application/json");
  private List<String> produces = Arrays.asList("application/json");
  private String locationQuery = null;

  /** fields as input parameter */
  private String namespace;

  private String sessionId;

  /**
   * @param namespace required
   * @param sessionId required
   */
  @Builder
  // @deprecated 2022-08-29 - All args constructor may cause problems. Use builder instead.
  @Deprecated
  public GetSessionServerSecret(String customBasePath, String namespace, String sessionId) {
    this.namespace = namespace;
    this.sessionId = sessionId;
    super.customBasePath = customBasePath != null ? customBasePath : "";

    securities.add("Bearer");
  }

  @Override
  public Map<String, String> getPathParams() {
    Map<String, String> pathParams = new HashMap<>();
    if (this.namespace != null) {
      pathParams.put("namespace", this.namespace);
    }
    if (this.sessionId != null) {
      pathParams.put("sessionId", this.sessionId);
    }
    return pathParams;
  }

  @Override
  public boolean isValid() {
    if (this.namespace == null) {
      return false;
    }
    if (this.sessionId == null) {
      return false;
    }
    return true;
  }

  public GetSessionServerSecretOpResponse parseResponse(
      int code, String contentType, InputStream payload) throws HttpResponseException, IOException {
    final GetSessionServerSecretOpResponse response = new GetSessionServerSecretOpResponse();

    response.setHttpStatusCode(code);
    response.setContentType(contentType);

    if (code == 204) {
      response.setSuccess(true);
    } else if ((code == 200) || (code == 201)) {
      final String json = Helper.convertInputStreamToString(payload);
      response.setData(new ApimodelsServerSecret().createFromJson(json));
      response.setSuccess(true);
    } else if (code == 400) {
      final String json = Helper.convertInputStreamToString(payload);
      response.setError400(new ResponseError().createFromJson(json));
      response.setError(response.getError400().translateToApiError());
    } else if (code == 401) {
      final String json = Helper.convertInputStreamToString(payload);
      response.setError401(new ResponseError().createFromJson(json));
      response.setError(response.getError401().translateToApiError());
    } else if (code == 404) {
      final String json = Helper.convertInputStreamToString(payload);
      response.setError404(new ResponseError().createFromJson(json));
      response.setError(response.getError404().translateToApiError());
    } else if (code == 500) {
      final String json = Helper.convertInputStreamToString(payload);
      response.setError500(new ResponseError().createFromJson(json));
      response.setError(response.getError500().translateToApiError());
    }

    return response;
  }

  /*
  public ApimodelsServerSecret parseResponse(int code, String contentType, InputStream payload) throws HttpResponseException, IOException {
      if(code != 200){
          final String json = Helper.convertInputStreamToString(payload);
          throw new HttpResponseException(code, json);
      }
      final String json = Helper.convertInputStreamToString(payload);
      return new ApimodelsServerSecret().createFromJson(json);
  }
  */

}
