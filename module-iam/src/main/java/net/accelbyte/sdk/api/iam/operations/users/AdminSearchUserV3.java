/*
 * Copyright (c) 2024 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.iam.operations.users;

import java.io.*;
import java.util.*;
import lombok.Builder;
import lombok.Getter;
import lombok.Setter;
import net.accelbyte.sdk.api.iam.models.*;
import net.accelbyte.sdk.api.iam.operation_responses.users.AdminSearchUserV3OpResponse;
import net.accelbyte.sdk.core.HttpResponseException;
import net.accelbyte.sdk.core.Operation;
import net.accelbyte.sdk.core.util.Helper;

/**
 * AdminSearchUserV3
 *
 * <p>Endpoint behavior : - By default this endpoint searches all users on the specified namespace.
 * - If query parameter is defined, endpoint will search users whose email address, display name,
 * username, or third party partially match with the query. - The query parameter length must be
 * between 3 and 30 characters. For email address queries (i.e., contains '@'), the allowed length
 * is 3 to 40 characters. Otherwise, the database will not be queried. - If startDate and endDate
 * parameters is defined, endpoint will search users which created on the certain date range. - If
 * query, startDate and endDate parameters are defined, endpoint will search users whose email
 * address and display name match and created on the certain date range. - If startDate parameter is
 * defined, endpoint will search users that created start from the defined date. - If endDate
 * parameter is defined, endpoint will search users that created until the defined date. - If
 * platformId parameter is defined and by parameter is using thirdparty, endpoint will search users
 * based on the platformId they have linked to. - If platformBy parameter is defined and by
 * parameter is using thirdparty, endpoint will search users based on the platformUserId or
 * platformDisplayName they have linked to, example value: platformUserId or platformDisplayName. -
 * If limit is not defined, The default limit is 100.
 *
 * <p>GraphQL-Like Querying: - By default, the API only returns the minimum fields -> [displayName,
 * authType, createdAt, uniqueDisplayName, deletionStatus, enabled, emailAddress, skipLoginQueue,
 * testAccount] - To include additional fields in the response, specify them in the request params.
 * - Supported fields: [country, emailVerified, avatarUrl, enabled] - Note: If a value is not in the
 * allowed list, the API will ignore it.
 *
 * <p>In Multi Tenant mode :
 *
 * <p>- If super admin search in super admin namespace, the result will be all game admin user - If
 * super admin search in game studio namespace, the result will be all game admin user and players
 * under the game studio namespace - If super admin search in game namespace, the result will be all
 * game admin users and players under the game namespace - If game admin search in their game studio
 * namespace, the result will be all game admin user in the studio namespace - If game admin search
 * in their game namespace, the result will be all player in the game namespace
 *
 * <p>action code : 10133
 */
@Getter
@Setter
public class AdminSearchUserV3 extends Operation {
  /** generated field's value */
  private String path = "/iam/v3/admin/namespaces/{namespace}/users/search";

  private String method = "GET";
  private List<String> consumes = Arrays.asList("application/json");
  private List<String> produces = Arrays.asList("application/json");
  private String locationQuery = null;

  /** fields as input parameter */
  private String namespace;

  private String by;
  private String endDate;
  private Boolean includeTotal;
  private Integer limit;
  private Integer offset;
  private String platformBy;
  private String platformId;
  private String query;
  private String roleIds;
  private String selectedFields;
  private Boolean skipLoginQueue;
  private String startDate;
  private String tagIds;
  private Boolean testAccount;

  /**
   * @param namespace required
   */
  @Builder
  // @deprecated 2022-08-29 - All args constructor may cause problems. Use builder instead.
  @Deprecated
  public AdminSearchUserV3(
      String customBasePath,
      String namespace,
      String by,
      String endDate,
      Boolean includeTotal,
      Integer limit,
      Integer offset,
      String platformBy,
      String platformId,
      String query,
      String roleIds,
      String selectedFields,
      Boolean skipLoginQueue,
      String startDate,
      String tagIds,
      Boolean testAccount) {
    this.namespace = namespace;
    this.by = by;
    this.endDate = endDate;
    this.includeTotal = includeTotal;
    this.limit = limit;
    this.offset = offset;
    this.platformBy = platformBy;
    this.platformId = platformId;
    this.query = query;
    this.roleIds = roleIds;
    this.selectedFields = selectedFields;
    this.skipLoginQueue = skipLoginQueue;
    this.startDate = startDate;
    this.tagIds = tagIds;
    this.testAccount = testAccount;
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
    queryParams.put("by", this.by == null ? null : Arrays.asList(this.by));
    queryParams.put("endDate", this.endDate == null ? null : Arrays.asList(this.endDate));
    queryParams.put(
        "includeTotal",
        this.includeTotal == null ? null : Arrays.asList(String.valueOf(this.includeTotal)));
    queryParams.put("limit", this.limit == null ? null : Arrays.asList(String.valueOf(this.limit)));
    queryParams.put(
        "offset", this.offset == null ? null : Arrays.asList(String.valueOf(this.offset)));
    queryParams.put("platformBy", this.platformBy == null ? null : Arrays.asList(this.platformBy));
    queryParams.put("platformId", this.platformId == null ? null : Arrays.asList(this.platformId));
    queryParams.put("query", this.query == null ? null : Arrays.asList(this.query));
    queryParams.put("roleIds", this.roleIds == null ? null : Arrays.asList(this.roleIds));
    queryParams.put(
        "selectedFields", this.selectedFields == null ? null : Arrays.asList(this.selectedFields));
    queryParams.put(
        "skipLoginQueue",
        this.skipLoginQueue == null ? null : Arrays.asList(String.valueOf(this.skipLoginQueue)));
    queryParams.put("startDate", this.startDate == null ? null : Arrays.asList(this.startDate));
    queryParams.put("tagIds", this.tagIds == null ? null : Arrays.asList(this.tagIds));
    queryParams.put(
        "testAccount",
        this.testAccount == null ? null : Arrays.asList(String.valueOf(this.testAccount)));
    return queryParams;
  }

  @Override
  public boolean isValid() {
    if (this.namespace == null) {
      return false;
    }
    return true;
  }

  public AdminSearchUserV3OpResponse parseResponse(
      int code, String contentType, InputStream payload) throws HttpResponseException, IOException {
    final AdminSearchUserV3OpResponse response = new AdminSearchUserV3OpResponse();

    response.setHttpStatusCode(code);
    response.setContentType(contentType);

    if (code == 204) {
      response.setSuccess(true);
    } else if ((code == 200) || (code == 201)) {
      final String json = Helper.convertInputStreamToString(payload);
      response.setData(new ModelSearchUsersResponseWithPaginationV3().createFromJson(json));
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
    } else if (code == 500) {
      final String json = Helper.convertInputStreamToString(payload);
      response.setError500(new RestErrorResponse().createFromJson(json));
      response.setError(response.getError500().translateToApiError());
    }

    return response;
  }

  /*
  public ModelSearchUsersResponseWithPaginationV3 parseResponse(int code, String contentType, InputStream payload) throws HttpResponseException, IOException {
      if(code != 200){
          final String json = Helper.convertInputStreamToString(payload);
          throw new HttpResponseException(code, json);
      }
      final String json = Helper.convertInputStreamToString(payload);
      return new ModelSearchUsersResponseWithPaginationV3().createFromJson(json);
  }
  */

  @Override
  protected Map<String, String> getCollectionFormatMap() {
    Map<String, String> result = new HashMap<>();
    result.put("by", "None");
    result.put("endDate", "None");
    result.put("includeTotal", "None");
    result.put("limit", "None");
    result.put("offset", "None");
    result.put("platformBy", "None");
    result.put("platformId", "None");
    result.put("query", "None");
    result.put("roleIds", "None");
    result.put("selectedFields", "None");
    result.put("skipLoginQueue", "None");
    result.put("startDate", "None");
    result.put("tagIds", "None");
    result.put("testAccount", "None");
    return result;
  }
}
