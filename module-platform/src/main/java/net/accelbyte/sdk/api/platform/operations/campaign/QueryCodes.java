/*
 * Copyright (c) 2024 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.platform.operations.campaign;

import java.io.*;
import java.util.*;
import lombok.Builder;
import lombok.Getter;
import lombok.Setter;
import net.accelbyte.sdk.api.platform.models.*;
import net.accelbyte.sdk.api.platform.operation_responses.campaign.QueryCodesOpResponse;
import net.accelbyte.sdk.core.HttpResponseException;
import net.accelbyte.sdk.core.Operation;
import net.accelbyte.sdk.core.util.Helper;

/**
 * queryCodes
 *
 * <p>Query campaign codes. Other detail info:
 *
 * <p>* Returns : list of codes * The batchName field in the codes response will be present only
 * when the withBatchName parameter is true , or when the batchName filter is not blank.
 */
@Getter
@Setter
public class QueryCodes extends Operation {
  /** generated field's value */
  private String path = "/platform/admin/namespaces/{namespace}/codes/campaigns/{campaignId}";

  private String method = "GET";
  private List<String> consumes = Arrays.asList();
  private List<String> produces = Arrays.asList("application/json");
  private String locationQuery = null;

  /** fields as input parameter */
  private String campaignId;

  private String namespace;
  private Boolean activeOnly;
  private String batchName;
  private List<Integer> batchNo;
  private String code;
  private Integer limit;
  private Integer offset;
  private Boolean withBatchName;

  /**
   * @param campaignId required
   * @param namespace required
   */
  @Builder
  // @deprecated 2022-08-29 - All args constructor may cause problems. Use builder instead.
  @Deprecated
  public QueryCodes(
      String customBasePath,
      String campaignId,
      String namespace,
      Boolean activeOnly,
      String batchName,
      List<Integer> batchNo,
      String code,
      Integer limit,
      Integer offset,
      Boolean withBatchName) {
    this.campaignId = campaignId;
    this.namespace = namespace;
    this.activeOnly = activeOnly;
    this.batchName = batchName;
    this.batchNo = batchNo;
    this.code = code;
    this.limit = limit;
    this.offset = offset;
    this.withBatchName = withBatchName;
    super.customBasePath = customBasePath != null ? customBasePath : "";

    securities.add("Bearer");
  }

  @Override
  public Map<String, String> getPathParams() {
    Map<String, String> pathParams = new HashMap<>();
    if (this.campaignId != null) {
      pathParams.put("campaignId", this.campaignId);
    }
    if (this.namespace != null) {
      pathParams.put("namespace", this.namespace);
    }
    return pathParams;
  }

  @Override
  public Map<String, List<String>> getQueryParams() {
    Map<String, List<String>> queryParams = new HashMap<>();
    queryParams.put(
        "activeOnly",
        this.activeOnly == null ? null : Arrays.asList(String.valueOf(this.activeOnly)));
    queryParams.put("batchName", this.batchName == null ? null : Arrays.asList(this.batchName));
    queryParams.put(
        "batchNo",
        this.batchNo == null
            ? null
            : this.batchNo.stream()
                .map(i -> String.valueOf(i))
                .collect(java.util.stream.Collectors.toList()));
    queryParams.put("code", this.code == null ? null : Arrays.asList(this.code));
    queryParams.put("limit", this.limit == null ? null : Arrays.asList(String.valueOf(this.limit)));
    queryParams.put(
        "offset", this.offset == null ? null : Arrays.asList(String.valueOf(this.offset)));
    queryParams.put(
        "withBatchName",
        this.withBatchName == null ? null : Arrays.asList(String.valueOf(this.withBatchName)));
    return queryParams;
  }

  @Override
  public boolean isValid() {
    if (this.campaignId == null) {
      return false;
    }
    if (this.namespace == null) {
      return false;
    }
    return true;
  }

  public QueryCodesOpResponse parseResponse(int code, String contentType, InputStream payload)
      throws HttpResponseException, IOException {
    final QueryCodesOpResponse response = new QueryCodesOpResponse();

    response.setHttpStatusCode(code);
    response.setContentType(contentType);

    if (code == 204) {
      response.setSuccess(true);
    } else if ((code == 200) || (code == 201)) {
      final String json = Helper.convertInputStreamToString(payload);
      response.setData(new CodeInfoPagingSlicedResult().createFromJson(json));
      response.setSuccess(true);
    }

    return response;
  }

  /*
  public CodeInfoPagingSlicedResult parseResponse(int code, String contentType, InputStream payload) throws HttpResponseException, IOException {
      if(code != 200){
          final String json = Helper.convertInputStreamToString(payload);
          throw new HttpResponseException(code, json);
      }
      final String json = Helper.convertInputStreamToString(payload);
      return new CodeInfoPagingSlicedResult().createFromJson(json);
  }
  */

  @Override
  protected Map<String, String> getCollectionFormatMap() {
    Map<String, String> result = new HashMap<>();
    result.put("activeOnly", "None");
    result.put("batchName", "None");
    result.put("batchNo", "multi");
    result.put("code", "None");
    result.put("limit", "None");
    result.put("offset", "None");
    result.put("withBatchName", "None");
    return result;
  }
}
