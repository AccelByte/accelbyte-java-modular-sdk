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
import net.accelbyte.sdk.api.platform.operation_responses.campaign.BulkDisableCodesOpResponse;
import net.accelbyte.sdk.core.HttpResponseException;
import net.accelbyte.sdk.core.Operation;
import net.accelbyte.sdk.core.util.Helper;

/**
 * bulkDisableCodes
 *
 * <p>Bulk disable codes.
 *
 * <p>Bulk disable campaign codes, all matched codes will be disabled except those have already been
 * redeemed. Other detail info:
 *
 * <p>* Returns : the number of code actually disabled
 */
@Getter
@Setter
public class BulkDisableCodes extends Operation {
  /** generated field's value */
  private String path =
      "/platform/admin/namespaces/{namespace}/codes/campaigns/{campaignId}/disable/bulk";

  private String method = "PUT";
  private List<String> consumes = Arrays.asList("application/json");
  private List<String> produces = Arrays.asList("application/json");
  private String locationQuery = null;

  /** fields as input parameter */
  private String campaignId;

  private String namespace;
  private String batchName;
  private List<Integer> batchNo;

  /**
   * @param campaignId required
   * @param namespace required
   */
  @Builder
  // @deprecated 2022-08-29 - All args constructor may cause problems. Use builder instead.
  @Deprecated
  public BulkDisableCodes(
      String customBasePath,
      String campaignId,
      String namespace,
      String batchName,
      List<Integer> batchNo) {
    this.campaignId = campaignId;
    this.namespace = namespace;
    this.batchName = batchName;
    this.batchNo = batchNo;
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

  public BulkDisableCodesOpResponse parseResponse(int code, String contentType, InputStream payload)
      throws HttpResponseException, IOException {
    final BulkDisableCodesOpResponse response = new BulkDisableCodesOpResponse();

    response.setHttpStatusCode(code);
    response.setContentType(contentType);

    if (code == 204) {
      response.setSuccess(true);
    } else if ((code == 200) || (code == 201)) {
      final String json = Helper.convertInputStreamToString(payload);
      response.setData(new BulkOperationResult().createFromJson(json));
      response.setSuccess(true);
    }

    return response;
  }

  /*
  public BulkOperationResult parseResponse(int code, String contentType, InputStream payload) throws HttpResponseException, IOException {
      if(code != 200){
          final String json = Helper.convertInputStreamToString(payload);
          throw new HttpResponseException(code, json);
      }
      final String json = Helper.convertInputStreamToString(payload);
      return new BulkOperationResult().createFromJson(json);
  }
  */

  @Override
  protected Map<String, String> getCollectionFormatMap() {
    Map<String, String> result = new HashMap<>();
    result.put("batchName", "None");
    result.put("batchNo", "multi");
    return result;
  }
}
