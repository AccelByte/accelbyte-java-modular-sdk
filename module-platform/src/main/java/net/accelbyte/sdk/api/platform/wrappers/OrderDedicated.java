/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.platform.wrappers;

import net.accelbyte.sdk.api.platform.models.*;
import net.accelbyte.sdk.api.platform.operations.order_dedicated.*;
import net.accelbyte.sdk.core.RequestRunner;
import net.accelbyte.sdk.core.HttpResponse;

public class OrderDedicated {

  private RequestRunner sdk;

  public OrderDedicated(RequestRunner sdk) {
    this.sdk = sdk;
  }

  /**
   * @see SyncOrders
   */
  public OrderSyncResult syncOrders(SyncOrders input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }
}
