/*
 * Copyright (c) 2024 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.leaderboard.operations.leaderboard_configuration_v3;

import java.io.*;
import java.util.*;
import lombok.Builder;
import lombok.Getter;
import lombok.Setter;
import net.accelbyte.sdk.api.leaderboard.models.*;
import net.accelbyte.sdk.api.leaderboard.operation_responses.leaderboard_configuration_v3.CreateLeaderboardConfigurationAdminV3OpResponse;
import net.accelbyte.sdk.core.HttpResponseException;
import net.accelbyte.sdk.core.Operation;
import net.accelbyte.sdk.core.util.Helper;

/**
 * createLeaderboardConfigurationAdminV3
 *
 * <p>Fields :
 *
 * <p>* leaderboardCode: unique leaderboard config code must be lowercase and maximum length is 48
 * characters. (required).
 *
 * <p>* name: leaderboard name, maximum length for leaderboard name is 128 characters. (required).
 *
 * <p>* description: leaderboard description, maximum length for leaderboard description is 2048
 * characters. (optional).
 *
 * <p>* iconURL: leaderboard icon image url. (optional).
 *
 * <p>* allTime: if true, all time leaderboard will be created. (required).
 *
 * <p>* descending: leaderboard order. If true, the points will be sorted in descending order.
 * (required).
 *
 * <p>* statCode: Stat Code is related with statistic code in statistic service. (required).
 *
 * <p>* cycleIds: Statistic cycle ids that will be tracked in the leaderboard. (required).
 */
@Getter
@Setter
public class CreateLeaderboardConfigurationAdminV3 extends Operation {
  /** generated field's value */
  private String path = "/leaderboard/v3/admin/namespaces/{namespace}/leaderboards";

  private String method = "POST";
  private List<String> consumes = Arrays.asList("application/json");
  private List<String> produces = Arrays.asList("application/json");
  private String locationQuery = null;

  /** fields as input parameter */
  private String namespace;

  private ModelsLeaderboardConfigReqV3 body;

  /**
   * @param namespace required
   * @param body required
   */
  @Builder
  // @deprecated 2022-08-29 - All args constructor may cause problems. Use builder instead.
  @Deprecated
  public CreateLeaderboardConfigurationAdminV3(
      String customBasePath, String namespace, ModelsLeaderboardConfigReqV3 body) {
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
  public ModelsLeaderboardConfigReqV3 getBodyParams() {
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

  public CreateLeaderboardConfigurationAdminV3OpResponse parseResponse(
      int code, String contentType, InputStream payload) throws HttpResponseException, IOException {
    final CreateLeaderboardConfigurationAdminV3OpResponse response =
        new CreateLeaderboardConfigurationAdminV3OpResponse();

    response.setHttpStatusCode(code);
    response.setContentType(contentType);

    if (code == 204) {
      response.setSuccess(true);
    } else if ((code == 200) || (code == 201)) {
      final String json = Helper.convertInputStreamToString(payload);
      response.setData(new ModelsGetLeaderboardConfigRespV3().createFromJson(json));
      response.setSuccess(true);
    } else if (code == 400) {
      final String json = Helper.convertInputStreamToString(payload);
      response.setError400(new ResponseErrorResponse().createFromJson(json));
      response.setError(response.getError400().translateToApiError());
    } else if (code == 401) {
      final String json = Helper.convertInputStreamToString(payload);
      response.setError401(new ResponseErrorResponse().createFromJson(json));
      response.setError(response.getError401().translateToApiError());
    } else if (code == 403) {
      final String json = Helper.convertInputStreamToString(payload);
      response.setError403(new ResponseErrorResponse().createFromJson(json));
      response.setError(response.getError403().translateToApiError());
    } else if (code == 409) {
      final String json = Helper.convertInputStreamToString(payload);
      response.setError409(new ResponseErrorResponse().createFromJson(json));
      response.setError(response.getError409().translateToApiError());
    } else if (code == 500) {
      final String json = Helper.convertInputStreamToString(payload);
      response.setError500(new ResponseErrorResponse().createFromJson(json));
      response.setError(response.getError500().translateToApiError());
    }

    return response;
  }

  /*
  public ModelsGetLeaderboardConfigRespV3 parseResponse(int code, String contentType, InputStream payload) throws HttpResponseException, IOException {
      if(code != 201){
          final String json = Helper.convertInputStreamToString(payload);
          throw new HttpResponseException(code, json);
      }
      final String json = Helper.convertInputStreamToString(payload);
      return new ModelsGetLeaderboardConfigRespV3().createFromJson(json);
  }
  */

}
