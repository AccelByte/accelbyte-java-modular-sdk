/*
 * Copyright (c) 2024 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.leaderboard.operations.leaderboard_data;

import java.io.*;
import java.util.*;
import lombok.Builder;
import lombok.Getter;
import lombok.Setter;
import net.accelbyte.sdk.api.leaderboard.models.*;
import net.accelbyte.sdk.core.HttpResponseException;
import net.accelbyte.sdk.core.Operation;
import net.accelbyte.sdk.core.util.Helper;

/**
 * GetAllTimeLeaderboardRankingPublicV2
 *
 * <p>Get rankings in an all time leaderboard.
 */
@Getter
@Setter
public class GetAllTimeLeaderboardRankingPublicV2 extends Operation {
  /** generated field's value */
  private String path =
      "/leaderboard/v2/public/namespaces/{namespace}/leaderboards/{leaderboardCode}/alltime";

  private String customBasePath = "";
  private String method = "GET";
  private List<String> consumes = Arrays.asList();
  private List<String> produces = Arrays.asList("application/json");
  private String locationQuery = null;

  /** fields as input parameter */
  private String leaderboardCode;

  private String namespace;
  private Integer limit;
  private Integer offset;

  /**
   * @param leaderboardCode required
   * @param namespace required
   */
  @Builder
  // @deprecated 2022-08-29 - All args constructor may cause problems. Use builder instead.
  @Deprecated
  public GetAllTimeLeaderboardRankingPublicV2(
      String customBasePath,
      String leaderboardCode,
      String namespace,
      Integer limit,
      Integer offset) {
    this.leaderboardCode = leaderboardCode;
    this.namespace = namespace;
    this.limit = limit;
    this.offset = offset;
    this.customBasePath = customBasePath;

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
    return pathParams;
  }

  @Override
  public Map<String, List<String>> getQueryParams() {
    Map<String, List<String>> queryParams = new HashMap<>();
    queryParams.put("limit", this.limit == null ? null : Arrays.asList(String.valueOf(this.limit)));
    queryParams.put(
        "offset", this.offset == null ? null : Arrays.asList(String.valueOf(this.offset)));
    return queryParams;
  }

  @Override
  public boolean isValid() {
    if (this.leaderboardCode == null) {
      return false;
    }
    if (this.namespace == null) {
      return false;
    }
    return true;
  }

  public V2GetPublicLeaderboardRankingResponse parseResponse(
      int code, String contentType, InputStream payload) throws HttpResponseException, IOException {
    if (code != 200) {
      final String json = Helper.convertInputStreamToString(payload);
      throw new HttpResponseException(code, json);
    }
    final String json = Helper.convertInputStreamToString(payload);
    return new V2GetPublicLeaderboardRankingResponse().createFromJson(json);
  }

  @Override
  protected Map<String, String> getCollectionFormatMap() {
    Map<String, String> result = new HashMap<>();
    result.put("limit", "None");
    result.put("offset", "None");
    return result;
  }
}
