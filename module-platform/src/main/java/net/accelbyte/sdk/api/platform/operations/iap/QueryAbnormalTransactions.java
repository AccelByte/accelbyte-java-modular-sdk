/*
 * Copyright (c) 2024 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.platform.operations.iap;

import java.io.*;
import java.util.*;
import lombok.Builder;
import lombok.Getter;
import lombok.Setter;
import net.accelbyte.sdk.api.platform.models.*;
import net.accelbyte.sdk.api.platform.operation_responses.iap.QueryAbnormalTransactionsOpResponse;
import net.accelbyte.sdk.core.HttpResponseException;
import net.accelbyte.sdk.core.Operation;
import net.accelbyte.sdk.core.util.Helper;

/** queryAbnormalTransactions */
@Getter
@Setter
public class QueryAbnormalTransactions extends Operation {
  /** generated field's value */
  private String path = "/platform/admin/namespaces/{namespace}/iap/steam/abnormal_transactions";

  private String method = "GET";
  private List<String> consumes = Arrays.asList();
  private List<String> produces = Arrays.asList("application/json");
  private String locationQuery = null;

  /** fields as input parameter */
  private String namespace;

  private Integer limit;
  private Integer offset;
  private String orderId;
  private String steamId;

  /**
   * @param namespace required
   */
  @Builder
  // @deprecated 2022-08-29 - All args constructor may cause problems. Use builder instead.
  @Deprecated
  public QueryAbnormalTransactions(
      String customBasePath,
      String namespace,
      Integer limit,
      Integer offset,
      String orderId,
      String steamId) {
    this.namespace = namespace;
    this.limit = limit;
    this.offset = offset;
    this.orderId = orderId;
    this.steamId = steamId;
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
    queryParams.put("limit", this.limit == null ? null : Arrays.asList(String.valueOf(this.limit)));
    queryParams.put(
        "offset", this.offset == null ? null : Arrays.asList(String.valueOf(this.offset)));
    queryParams.put("orderId", this.orderId == null ? null : Arrays.asList(this.orderId));
    queryParams.put("steamId", this.steamId == null ? null : Arrays.asList(this.steamId));
    return queryParams;
  }

  @Override
  public boolean isValid() {
    if (this.namespace == null) {
      return false;
    }
    return true;
  }

  public QueryAbnormalTransactionsOpResponse parseResponse(
      int code, String contentType, InputStream payload) throws HttpResponseException, IOException {
    final QueryAbnormalTransactionsOpResponse response = new QueryAbnormalTransactionsOpResponse();

    response.setHttpStatusCode(code);
    response.setContentType(contentType);

    if (code == 204) {
      response.setSuccess(true);
    } else if ((code == 200) || (code == 201)) {
      final String json = Helper.convertInputStreamToString(payload);
      response.setData(new SteamAbnormalTransactionPagingSlicedResult().createFromJson(json));
      response.setSuccess(true);
    }

    return response;
  }

  /*
  public SteamAbnormalTransactionPagingSlicedResult parseResponse(int code, String contentType, InputStream payload) throws HttpResponseException, IOException {
      if(code != 200){
          final String json = Helper.convertInputStreamToString(payload);
          throw new HttpResponseException(code, json);
      }
      final String json = Helper.convertInputStreamToString(payload);
      return new SteamAbnormalTransactionPagingSlicedResult().createFromJson(json);
  }
  */

  @Override
  protected Map<String, String> getCollectionFormatMap() {
    Map<String, String> result = new HashMap<>();
    result.put("limit", "None");
    result.put("offset", "None");
    result.put("orderId", "None");
    result.put("steamId", "None");
    return result;
  }
}
