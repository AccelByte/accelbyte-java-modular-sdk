/*
 * Copyright (c) 2024 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.match2.operations.match_pools;

import java.io.*;
import java.util.*;
import lombok.Builder;
import lombok.Getter;
import lombok.Setter;
import net.accelbyte.sdk.api.match2.models.*;
import net.accelbyte.sdk.api.match2.operation_responses.match_pools.UpdateMatchPoolOpResponse;
import net.accelbyte.sdk.core.HttpResponseException;
import net.accelbyte.sdk.core.Operation;
import net.accelbyte.sdk.core.util.Helper;

/**
 * UpdateMatchPool
 *
 * <p>Updates an existing matchmaking pool.
 *
 * <p>ticket_expiration_seconds and backfill_ticket_expiration_seconds will be set to 300 seconds (5
 * minutes) by default if not filled.
 *
 * <p>Match Function holds information about the name of the match logic server that matchmaking can
 * refers to. By default we provide ("default" and "basic"). Match Function will be used as
 * reference value for Match Function Overrides if not set. In case Customer would like to use
 * matchmaking service default match logic, then specify it in "match_function_overrides". This
 * sample configuration will let matchmaking service will use "default" match logic for make
 * matches, while validation will hit both "default" and "custom" match logics. e.g. {
 * "match_function": "custom", "match_function_overrides": { "validation": []{"default","custom"},
 * "make_matches": "default", } }
 */
@Getter
@Setter
public class UpdateMatchPool extends Operation {
  /** generated field's value */
  private String path = "/match2/v1/namespaces/{namespace}/match-pools/{pool}";

  private String method = "PUT";
  private List<String> consumes = Arrays.asList("application/json");
  private List<String> produces = Arrays.asList("application/json");
  private String locationQuery = null;

  /** fields as input parameter */
  private String namespace;

  private String pool;
  private ApiMatchPoolConfig body;

  /**
   * @param namespace required
   * @param pool required
   * @param body required
   */
  @Builder
  // @deprecated 2022-08-29 - All args constructor may cause problems. Use builder instead.
  @Deprecated
  public UpdateMatchPool(
      String customBasePath, String namespace, String pool, ApiMatchPoolConfig body) {
    this.namespace = namespace;
    this.pool = pool;
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
    if (this.pool != null) {
      pathParams.put("pool", this.pool);
    }
    return pathParams;
  }

  @Override
  public ApiMatchPoolConfig getBodyParams() {
    return this.body;
  }

  @Override
  public boolean isValid() {
    if (this.namespace == null) {
      return false;
    }
    if (this.pool == null) {
      return false;
    }
    if (this.body == null) {
      return false;
    }
    return true;
  }

  public UpdateMatchPoolOpResponse parseResponse(int code, String contentType, InputStream payload)
      throws HttpResponseException, IOException {
    final UpdateMatchPoolOpResponse response = new UpdateMatchPoolOpResponse();

    response.setHttpStatusCode(code);
    response.setContentType(contentType);

    if (code == 204) {
      response.setSuccess(true);
    } else if ((code == 200) || (code == 201)) {
      final String json = Helper.convertInputStreamToString(payload);
      response.setData(new ApiMatchPool().createFromJson(json));
      response.setSuccess(true);
    } else if (code == 400) {
      final String json = Helper.convertInputStreamToString(payload);
      response.setError400(new ResponseError().createFromJson(json));
      response.setError(response.getError400().translateToApiError());
    } else if (code == 401) {
      final String json = Helper.convertInputStreamToString(payload);
      response.setError401(new ResponseError().createFromJson(json));
      response.setError(response.getError401().translateToApiError());
    } else if (code == 403) {
      final String json = Helper.convertInputStreamToString(payload);
      response.setError403(new ResponseError().createFromJson(json));
      response.setError(response.getError403().translateToApiError());
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
  public ApiMatchPool parseResponse(int code, String contentType, InputStream payload) throws HttpResponseException, IOException {
      if(code != 200){
          final String json = Helper.convertInputStreamToString(payload);
          throw new HttpResponseException(code, json);
      }
      final String json = Helper.convertInputStreamToString(payload);
      return new ApiMatchPool().createFromJson(json);
  }
  */

}
