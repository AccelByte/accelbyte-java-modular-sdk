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
import net.accelbyte.sdk.api.platform.operation_responses.campaign.DownloadOpResponse;
import net.accelbyte.sdk.core.HttpResponseException;
import net.accelbyte.sdk.core.Operation;

/**
 * download
 *
 * <p>Download all or a batch of campaign's codes as a csv file. Other detail info:
 *
 * <p>* Returns : codes csv file * The csv file will always have Batch Name column, but this column
 * will be filled only when the withBatchName parameter is true , or when the batchName filter is
 * not blank.
 */
@Getter
@Setter
public class Download extends Operation {
  /** generated field's value */
  private String path =
      "/platform/admin/namespaces/{namespace}/codes/campaigns/{campaignId}/codes.csv";

  private String method = "GET";
  private List<String> consumes = Arrays.asList();
  private List<String> produces = Arrays.asList("text/csv");
  private String locationQuery = null;

  /** fields as input parameter */
  private String campaignId;

  private String namespace;
  private String batchName;
  private List<Integer> batchNo;
  private Boolean withBatchName;

  /**
   * @param campaignId required
   * @param namespace required
   */
  @Builder
  // @deprecated 2022-08-29 - All args constructor may cause problems. Use builder instead.
  @Deprecated
  public Download(
      String customBasePath,
      String campaignId,
      String namespace,
      String batchName,
      List<Integer> batchNo,
      Boolean withBatchName) {
    this.campaignId = campaignId;
    this.namespace = namespace;
    this.batchName = batchName;
    this.batchNo = batchNo;
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
    queryParams.put("batchName", this.batchName == null ? null : Arrays.asList(this.batchName));
    queryParams.put(
        "batchNo",
        this.batchNo == null
            ? null
            : this.batchNo.stream()
                .map(i -> String.valueOf(i))
                .collect(java.util.stream.Collectors.toList()));
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

  public DownloadOpResponse parseResponse(int code, String contentType, InputStream payload)
      throws HttpResponseException, IOException {
    final DownloadOpResponse response = new DownloadOpResponse();

    response.setHttpStatusCode(code);
    response.setContentType(contentType);

    if (code == 204) {
      response.setSuccess(true);
    } else if ((code == 200) || (code == 201)) {
      response.setSuccess(true);
      response.setData(payload);
    }

    return response;
  }

  /*
  public InputStream parseResponse(int code, String contentType, InputStream payload) throws HttpResponseException, IOException {
      if(code != 200){
          final String json = Helper.convertInputStreamToString(payload);
          throw new HttpResponseException(code, json);
      }
      return payload;
  }
  */

  @Override
  protected Map<String, String> getCollectionFormatMap() {
    Map<String, String> result = new HashMap<>();
    result.put("batchName", "None");
    result.put("batchNo", "multi");
    result.put("withBatchName", "None");
    return result;
  }
}
