/*
 * Copyright (c) 2024 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.platform.operations.payment_dedicated;

import java.io.*;
import java.util.*;
import lombok.Builder;
import lombok.Getter;
import lombok.Setter;
import net.accelbyte.sdk.api.platform.models.*;
import net.accelbyte.sdk.api.platform.operation_responses.payment_dedicated.SyncPaymentOrdersOpResponse;
import net.accelbyte.sdk.core.HttpResponseException;
import net.accelbyte.sdk.core.Operation;
import net.accelbyte.sdk.core.util.Helper;

/**
 * syncPaymentOrders
 *
 * <p>[Not supported yet in AGS Shared Cloud] Sync payment orders. If response contains
 * nextEvaluatedKey, please use it as query param in the next call to fetch the next batch, a batch
 * has 1000 elements or less. Other detail info:
 *
 * <p>* Returns : sync payment orders
 */
@Getter
@Setter
public class SyncPaymentOrders extends Operation {
  /** generated field's value */
  private String path = "/platform/admin/payment/orders";

  private String method = "GET";
  private List<String> consumes = Arrays.asList();
  private List<String> produces = Arrays.asList("application/json");
  private String locationQuery = null;

  /** fields as input parameter */
  private String nextEvaluatedKey;

  private String end;
  private String start;

  /**
   * @param end required
   * @param start required
   */
  @Builder
  // @deprecated 2022-08-29 - All args constructor may cause problems. Use builder instead.
  @Deprecated
  public SyncPaymentOrders(
      String customBasePath, String nextEvaluatedKey, String end, String start) {
    this.nextEvaluatedKey = nextEvaluatedKey;
    this.end = end;
    this.start = start;
    super.customBasePath = customBasePath != null ? customBasePath : "";

    securities.add("Bearer");
  }

  @Override
  public Map<String, List<String>> getQueryParams() {
    Map<String, List<String>> queryParams = new HashMap<>();
    queryParams.put(
        "nextEvaluatedKey",
        this.nextEvaluatedKey == null ? null : Arrays.asList(this.nextEvaluatedKey));
    queryParams.put("end", this.end == null ? null : Arrays.asList(this.end));
    queryParams.put("start", this.start == null ? null : Arrays.asList(this.start));
    return queryParams;
  }

  @Override
  public boolean isValid() {
    if (this.end == null) {
      return false;
    }
    if (this.start == null) {
      return false;
    }
    return true;
  }

  public SyncPaymentOrdersOpResponse parseResponse(
      int code, String contentType, InputStream payload) throws HttpResponseException, IOException {
    final SyncPaymentOrdersOpResponse response = new SyncPaymentOrdersOpResponse();

    response.setHttpStatusCode(code);
    response.setContentType(contentType);

    if (code == 204) {
      response.setSuccess(true);
    } else if ((code == 200) || (code == 201)) {
      final String json = Helper.convertInputStreamToString(payload);
      response.setData(new PaymentOrderSyncResult().createFromJson(json));
      response.setSuccess(true);
    }

    return response;
  }

  /*
  public PaymentOrderSyncResult parseResponse(int code, String contentType, InputStream payload) throws HttpResponseException, IOException {
      if(code != 200){
          final String json = Helper.convertInputStreamToString(payload);
          throw new HttpResponseException(code, json);
      }
      final String json = Helper.convertInputStreamToString(payload);
      return new PaymentOrderSyncResult().createFromJson(json);
  }
  */

  @Override
  protected Map<String, String> getCollectionFormatMap() {
    Map<String, String> result = new HashMap<>();
    result.put("nextEvaluatedKey", "None");
    result.put("end", "None");
    result.put("start", "None");
    return result;
  }
}
