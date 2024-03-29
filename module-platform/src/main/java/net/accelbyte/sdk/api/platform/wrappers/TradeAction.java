/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.platform.wrappers;

import net.accelbyte.sdk.api.platform.models.*;
import net.accelbyte.sdk.api.platform.operations.trade_action.*;
import net.accelbyte.sdk.core.HttpResponse;
import net.accelbyte.sdk.core.RequestRunner;

public class TradeAction {

  private RequestRunner sdk;

  public TradeAction(RequestRunner sdk) {
    this.sdk = sdk;
  }

  /**
   * @see Commit
   */
  public TradeChainActionHistoryInfo commit(Commit input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see GetTradeHistoryByCriteria
   */
  public TradeActionPagingSlicedResult getTradeHistoryByCriteria(GetTradeHistoryByCriteria input)
      throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see GetTradeHistoryByTransactionId
   */
  public TradeChainActionHistoryInfo getTradeHistoryByTransactionId(
      GetTradeHistoryByTransactionId input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }
}
