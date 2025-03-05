/*
 * Copyright (c) 2024 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.match2.operations.backfill;

import java.io.*;
import java.util.*;
import lombok.Builder;
import lombok.Getter;
import lombok.Setter;
import net.accelbyte.sdk.api.match2.models.*;
import net.accelbyte.sdk.api.match2.operation_responses.backfill.AdminQueryBackfillOpResponse;
import net.accelbyte.sdk.core.HttpResponseException;
import net.accelbyte.sdk.core.Operation;
import net.accelbyte.sdk.core.util.Helper;

/**
 * AdminQueryBackfill
 *
 * <p>Admin Query backfill ticket
 */
@Getter
@Setter
public class AdminQueryBackfill extends Operation {
  /** generated field's value */
  private String path = "/match2/v1/namespaces/{namespace}/backfill";

  private String method = "GET";
  private List<String> consumes = Arrays.asList("application/json");
  private List<String> produces = Arrays.asList("application/json");
  private String locationQuery = null;

  /** fields as input parameter */
  private String namespace;

  private String fromTime;
  private Boolean isActive;
  private Integer limit;
  private String matchPool;
  private Integer offset;
  private String playerID;
  private String region;
  private String sessionID;
  private String toTime;

  /**
   * @param namespace required
   */
  @Builder
  // @deprecated 2022-08-29 - All args constructor may cause problems. Use builder instead.
  @Deprecated
  public AdminQueryBackfill(
      String customBasePath,
      String namespace,
      String fromTime,
      Boolean isActive,
      Integer limit,
      String matchPool,
      Integer offset,
      String playerID,
      String region,
      String sessionID,
      String toTime) {
    this.namespace = namespace;
    this.fromTime = fromTime;
    this.isActive = isActive;
    this.limit = limit;
    this.matchPool = matchPool;
    this.offset = offset;
    this.playerID = playerID;
    this.region = region;
    this.sessionID = sessionID;
    this.toTime = toTime;
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
    queryParams.put("fromTime", this.fromTime == null ? null : Arrays.asList(this.fromTime));
    queryParams.put(
        "isActive", this.isActive == null ? null : Arrays.asList(String.valueOf(this.isActive)));
    queryParams.put("limit", this.limit == null ? null : Arrays.asList(String.valueOf(this.limit)));
    queryParams.put("matchPool", this.matchPool == null ? null : Arrays.asList(this.matchPool));
    queryParams.put(
        "offset", this.offset == null ? null : Arrays.asList(String.valueOf(this.offset)));
    queryParams.put("playerID", this.playerID == null ? null : Arrays.asList(this.playerID));
    queryParams.put("region", this.region == null ? null : Arrays.asList(this.region));
    queryParams.put("sessionID", this.sessionID == null ? null : Arrays.asList(this.sessionID));
    queryParams.put("toTime", this.toTime == null ? null : Arrays.asList(this.toTime));
    return queryParams;
  }

  @Override
  public boolean isValid() {
    if (this.namespace == null) {
      return false;
    }
    return true;
  }

  public AdminQueryBackfillOpResponse parseResponse(
      int code, String contentType, InputStream payload) throws HttpResponseException, IOException {
    final AdminQueryBackfillOpResponse response = new AdminQueryBackfillOpResponse();

    response.setHttpStatusCode(code);
    response.setContentType(contentType);

    if (code == 204) {
      response.setSuccess(true);
    } else if ((code == 200) || (code == 201)) {
      final String json = Helper.convertInputStreamToString(payload);
      response.setData(new ApiListBackfillQueryResponse().createFromJson(json));
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
  public ApiListBackfillQueryResponse parseResponse(int code, String contentType, InputStream payload) throws HttpResponseException, IOException {
      if(code != 200){
          final String json = Helper.convertInputStreamToString(payload);
          throw new HttpResponseException(code, json);
      }
      final String json = Helper.convertInputStreamToString(payload);
      return new ApiListBackfillQueryResponse().createFromJson(json);
  }
  */

  @Override
  protected Map<String, String> getCollectionFormatMap() {
    Map<String, String> result = new HashMap<>();
    result.put("fromTime", "None");
    result.put("isActive", "None");
    result.put("limit", "None");
    result.put("matchPool", "None");
    result.put("offset", "None");
    result.put("playerID", "None");
    result.put("region", "None");
    result.put("sessionID", "None");
    result.put("toTime", "None");
    return result;
  }
}
