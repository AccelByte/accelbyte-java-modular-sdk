/*
 * Copyright (c) 2024 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.platform.operations.trade_action;

import java.io.*;
import java.util.*;
import lombok.Builder;
import lombok.Getter;
import lombok.Setter;
import net.accelbyte.sdk.api.platform.models.*;
import net.accelbyte.sdk.api.platform.operation_responses.trade_action.GetTradeHistoryByTransactionIdOpResponse;
import net.accelbyte.sdk.core.HttpResponseException;
import net.accelbyte.sdk.core.Operation;
import net.accelbyte.sdk.core.util.Helper;

/**
 * getTradeHistoryByTransactionId
 *
 * <p>This API is used to fetch a specific trade history using transaction ID
 *
 * <p>Other detail info:
 *
 * <p>* Returns : trade history based on transaction ID
 */
@Getter
@Setter
public class GetTradeHistoryByTransactionId extends Operation {
  /** generated field's value */
  private String path = "/platform/admin/namespaces/{namespace}/trade/{transactionId}";

  private String method = "GET";
  private List<String> consumes = Arrays.asList();
  private List<String> produces = Arrays.asList("application/json");
  private String locationQuery = null;

  /** fields as input parameter */
  private String namespace;

  private String transactionId;

  /**
   * @param namespace required
   * @param transactionId required
   */
  @Builder
  // @deprecated 2022-08-29 - All args constructor may cause problems. Use builder instead.
  @Deprecated
  public GetTradeHistoryByTransactionId(
      String customBasePath, String namespace, String transactionId) {
    this.namespace = namespace;
    this.transactionId = transactionId;
    super.customBasePath = customBasePath != null ? customBasePath : "";

    securities.add("Bearer");
  }

  @Override
  public Map<String, String> getPathParams() {
    Map<String, String> pathParams = new HashMap<>();
    if (this.namespace != null) {
      pathParams.put("namespace", this.namespace);
    }
    if (this.transactionId != null) {
      pathParams.put("transactionId", this.transactionId);
    }
    return pathParams;
  }

  @Override
  public boolean isValid() {
    if (this.namespace == null) {
      return false;
    }
    if (this.transactionId == null) {
      return false;
    }
    return true;
  }

  public GetTradeHistoryByTransactionIdOpResponse parseResponse(
      int code, String contentType, InputStream payload) throws HttpResponseException, IOException {
    final GetTradeHistoryByTransactionIdOpResponse response =
        new GetTradeHistoryByTransactionIdOpResponse();

    response.setHttpStatusCode(code);
    response.setContentType(contentType);

    if (code == 204) {
      response.setSuccess(true);
    } else if ((code == 200) || (code == 201)) {
      final String json = Helper.convertInputStreamToString(payload);
      response.setData(new TradeChainActionHistoryInfo().createFromJson(json));
      response.setSuccess(true);
    }

    return response;
  }

  /*
  public TradeChainActionHistoryInfo parseResponse(int code, String contentType, InputStream payload) throws HttpResponseException, IOException {
      if(code != 200){
          final String json = Helper.convertInputStreamToString(payload);
          throw new HttpResponseException(code, json);
      }
      final String json = Helper.convertInputStreamToString(payload);
      return new TradeChainActionHistoryInfo().createFromJson(json);
  }
  */

}
