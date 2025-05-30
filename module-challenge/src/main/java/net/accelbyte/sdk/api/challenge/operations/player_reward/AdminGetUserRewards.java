/*
 * Copyright (c) 2024 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.challenge.operations.player_reward;

import java.io.*;
import java.util.*;
import lombok.Builder;
import lombok.Getter;
import lombok.Setter;
import net.accelbyte.sdk.api.challenge.models.*;
import net.accelbyte.sdk.api.challenge.operation_responses.player_reward.AdminGetUserRewardsOpResponse;
import net.accelbyte.sdk.core.HttpResponseException;
import net.accelbyte.sdk.core.Operation;
import net.accelbyte.sdk.core.util.Helper;

/**
 * adminGetUserRewards
 *
 * <p>- Required permission: ADMIN:NAMESPACE:{namespace}:CHALLENGE:REWARD [READ]
 */
@Getter
@Setter
public class AdminGetUserRewards extends Operation {
  /** generated field's value */
  private String path = "/challenge/v1/admin/namespaces/{namespace}/users/{userId}/rewards";

  private String method = "GET";
  private List<String> consumes = Arrays.asList();
  private List<String> produces = Arrays.asList("application/json");
  private String locationQuery = null;

  /** fields as input parameter */
  private String namespace;

  private String userId;
  private String challengeCode;
  private String goalProgressionId;
  private Integer limit;
  private Integer offset;
  private String sortBy;
  private String status;

  /**
   * @param namespace required
   * @param userId required
   */
  @Builder
  // @deprecated 2022-08-29 - All args constructor may cause problems. Use builder instead.
  @Deprecated
  public AdminGetUserRewards(
      String customBasePath,
      String namespace,
      String userId,
      String challengeCode,
      String goalProgressionId,
      Integer limit,
      Integer offset,
      String sortBy,
      String status) {
    this.namespace = namespace;
    this.userId = userId;
    this.challengeCode = challengeCode;
    this.goalProgressionId = goalProgressionId;
    this.limit = limit;
    this.offset = offset;
    this.sortBy = sortBy;
    this.status = status;
    super.customBasePath = customBasePath != null ? customBasePath : "";

    securities.add("Bearer");
  }

  @Override
  public Map<String, String> getPathParams() {
    Map<String, String> pathParams = new HashMap<>();
    if (this.namespace != null) {
      pathParams.put("namespace", this.namespace);
    }
    if (this.userId != null) {
      pathParams.put("userId", this.userId);
    }
    return pathParams;
  }

  @Override
  public Map<String, List<String>> getQueryParams() {
    Map<String, List<String>> queryParams = new HashMap<>();
    queryParams.put(
        "challengeCode", this.challengeCode == null ? null : Arrays.asList(this.challengeCode));
    queryParams.put(
        "goalProgressionId",
        this.goalProgressionId == null ? null : Arrays.asList(this.goalProgressionId));
    queryParams.put("limit", this.limit == null ? null : Arrays.asList(String.valueOf(this.limit)));
    queryParams.put(
        "offset", this.offset == null ? null : Arrays.asList(String.valueOf(this.offset)));
    queryParams.put("sortBy", this.sortBy == null ? null : Arrays.asList(this.sortBy));
    queryParams.put("status", this.status == null ? null : Arrays.asList(this.status));
    return queryParams;
  }

  @Override
  public boolean isValid() {
    if (this.namespace == null) {
      return false;
    }
    if (this.userId == null) {
      return false;
    }
    return true;
  }

  public AdminGetUserRewardsOpResponse parseResponse(
      int code, String contentType, InputStream payload) throws HttpResponseException, IOException {
    final AdminGetUserRewardsOpResponse response = new AdminGetUserRewardsOpResponse();

    response.setHttpStatusCode(code);
    response.setContentType(contentType);

    if (code == 204) {
      response.setSuccess(true);
    } else if ((code == 200) || (code == 201)) {
      final String json = Helper.convertInputStreamToString(payload);
      response.setData(new ModelListUserRewardsResponse().createFromJson(json));
      response.setSuccess(true);
    } else if (code == 401) {
      final String json = Helper.convertInputStreamToString(payload);
      response.setError401(new IamErrorResponse().createFromJson(json));
      response.setError(response.getError401().translateToApiError());
    } else if (code == 403) {
      final String json = Helper.convertInputStreamToString(payload);
      response.setError403(new IamErrorResponse().createFromJson(json));
      response.setError(response.getError403().translateToApiError());
    } else if (code == 500) {
      final String json = Helper.convertInputStreamToString(payload);
      response.setError500(new ResponseError().createFromJson(json));
      response.setError(response.getError500().translateToApiError());
    }

    return response;
  }

  /*
  public ModelListUserRewardsResponse parseResponse(int code, String contentType, InputStream payload) throws HttpResponseException, IOException {
      if(code != 200){
          final String json = Helper.convertInputStreamToString(payload);
          throw new HttpResponseException(code, json);
      }
      final String json = Helper.convertInputStreamToString(payload);
      return new ModelListUserRewardsResponse().createFromJson(json);
  }
  */

  @Override
  protected Map<String, String> getCollectionFormatMap() {
    Map<String, String> result = new HashMap<>();
    result.put("challengeCode", "None");
    result.put("goalProgressionId", "None");
    result.put("limit", "None");
    result.put("offset", "None");
    result.put("sortBy", "None");
    result.put("status", "None");
    return result;
  }

  public enum SortBy {
    CreatedAt("createdAt"),
    CreatedAtasc("createdAt:asc"),
    CreatedAtdesc("createdAt:desc"),
    UpdatedAt("updatedAt"),
    UpdatedAtasc("updatedAt:asc"),
    UpdatedAtdesc("updatedAt:desc");

    private String value;

    SortBy(String value) {
      this.value = value;
    }

    @Override
    public String toString() {
      return this.value;
    }
  }

  public enum Status {
    CLAIMED("CLAIMED"),
    UNCLAIMED("UNCLAIMED");

    private String value;

    Status(String value) {
      this.value = value;
    }

    @Override
    public String toString() {
      return this.value;
    }
  }

  public static class AdminGetUserRewardsBuilder {
    private String sortBy;
    private String status;

    public AdminGetUserRewardsBuilder sortBy(final String sortBy) {
      this.sortBy = sortBy;
      return this;
    }

    public AdminGetUserRewardsBuilder sortByFromEnum(final SortBy sortBy) {
      this.sortBy = sortBy.toString();
      return this;
    }

    public AdminGetUserRewardsBuilder status(final String status) {
      this.status = status;
      return this;
    }

    public AdminGetUserRewardsBuilder statusFromEnum(final Status status) {
      this.status = status.toString();
      return this;
    }
  }
}
