/*
 * Copyright (c) 2024 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.leaderboard.operations.user_visibility_v3;

import java.io.*;
import java.util.*;
import lombok.Builder;
import lombok.Getter;
import lombok.Setter;
import net.accelbyte.sdk.api.leaderboard.models.*;
import net.accelbyte.sdk.api.leaderboard.operation_responses.user_visibility_v3.SetUserLeaderboardVisibilityV3OpResponse;
import net.accelbyte.sdk.core.HttpResponseException;
import net.accelbyte.sdk.core.Operation;
import net.accelbyte.sdk.core.util.Helper;

/**
 * SetUserLeaderboardVisibilityV3
 *
 * <p>User with false visibility status will have hidden attribute set to true on it's leaderboard
 * entry
 */
@Getter
@Setter
public class SetUserLeaderboardVisibilityV3 extends Operation {
  /** generated field's value */
  private String path =
      "/leaderboard/v3/admin/namespaces/{namespace}/leaderboards/{leaderboardCode}/users/{userId}/visibility";

  private String method = "PUT";
  private List<String> consumes = Arrays.asList("application/json");
  private List<String> produces = Arrays.asList("application/json");
  private String locationQuery = null;

  /** fields as input parameter */
  private String leaderboardCode;

  private String namespace;
  private String userId;
  private ModelsSetUserVisibilityRequest body;

  /**
   * @param leaderboardCode required
   * @param namespace required
   * @param userId required
   * @param body required
   */
  @Builder
  // @deprecated 2022-08-29 - All args constructor may cause problems. Use builder instead.
  @Deprecated
  public SetUserLeaderboardVisibilityV3(
      String customBasePath,
      String leaderboardCode,
      String namespace,
      String userId,
      ModelsSetUserVisibilityRequest body) {
    this.leaderboardCode = leaderboardCode;
    this.namespace = namespace;
    this.userId = userId;
    this.body = body;
    super.customBasePath = customBasePath != null ? customBasePath : "";

    securities.add("Bearer");
  }

  @Override
  public Map<String, String> getPathParams() {
    Map<String, String> pathParams = new HashMap<>();
    if (this.leaderboardCode != null) {
      pathParams.put("leaderboardCode", this.leaderboardCode);
    }
    if (this.namespace != null) {
      pathParams.put("namespace", this.namespace);
    }
    if (this.userId != null) {
      pathParams.put("userId", this.userId);
    }
    return pathParams;
  }

  @Override
  public ModelsSetUserVisibilityRequest getBodyParams() {
    return this.body;
  }

  @Override
  public boolean isValid() {
    if (this.leaderboardCode == null) {
      return false;
    }
    if (this.namespace == null) {
      return false;
    }
    if (this.userId == null) {
      return false;
    }
    if (this.body == null) {
      return false;
    }
    return true;
  }

  public SetUserLeaderboardVisibilityV3OpResponse parseResponse(
      int code, String contentType, InputStream payload) throws HttpResponseException, IOException {
    final SetUserLeaderboardVisibilityV3OpResponse response =
        new SetUserLeaderboardVisibilityV3OpResponse();

    response.setHttpStatusCode(code);
    response.setContentType(contentType);

    if (code == 204) {
      response.setSuccess(true);
    } else if ((code == 200) || (code == 201)) {
      final String json = Helper.convertInputStreamToString(payload);
      response.setData(new ModelsGetUserVisibilityResponse().createFromJson(json));
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
    } else if (code == 500) {
      final String json = Helper.convertInputStreamToString(payload);
      response.setError500(new ResponseErrorResponse().createFromJson(json));
      response.setError(response.getError500().translateToApiError());
    }

    return response;
  }

  /*
  public ModelsGetUserVisibilityResponse parseResponse(int code, String contentType, InputStream payload) throws HttpResponseException, IOException {
      if(code != 200){
          final String json = Helper.convertInputStreamToString(payload);
          throw new HttpResponseException(code, json);
      }
      final String json = Helper.convertInputStreamToString(payload);
      return new ModelsGetUserVisibilityResponse().createFromJson(json);
  }
  */

}
