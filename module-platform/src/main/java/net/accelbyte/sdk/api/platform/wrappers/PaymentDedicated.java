/*
 * Copyright (c) 2024 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.platform.wrappers;

import net.accelbyte.sdk.api.platform.models.*;
import net.accelbyte.sdk.api.platform.operation_responses.payment_dedicated.*;
import net.accelbyte.sdk.api.platform.operations.payment_dedicated.*;
import net.accelbyte.sdk.core.HttpResponse;
import net.accelbyte.sdk.core.RequestRunner;

public class PaymentDedicated {

  private RequestRunner sdk;
  private String customBasePath = "";

  public PaymentDedicated(RequestRunner sdk) {
    this.sdk = sdk;
    String configCustomBasePath =
        sdk.getSdkConfiguration().getConfigRepository().getCustomServiceBasePath("platform");
    if (!configCustomBasePath.equals("")) {
      this.customBasePath = configCustomBasePath;
    }
  }

  public PaymentDedicated(RequestRunner sdk, String customBasePath) {
    this.sdk = sdk;
    this.customBasePath = customBasePath;
  }

  /**
   * @see CreatePaymentOrderByDedicated
   */
  public CreatePaymentOrderByDedicatedOpResponse createPaymentOrderByDedicated(
      CreatePaymentOrderByDedicated input) throws Exception {
    if (input.getCustomBasePath().equals("") && !customBasePath.equals("")) {
      input.setCustomBasePath(customBasePath);
    }

    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see RefundPaymentOrderByDedicated
   */
  public RefundPaymentOrderByDedicatedOpResponse refundPaymentOrderByDedicated(
      RefundPaymentOrderByDedicated input) throws Exception {
    if (input.getCustomBasePath().equals("") && !customBasePath.equals("")) {
      input.setCustomBasePath(customBasePath);
    }

    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see SyncPaymentOrders
   */
  public SyncPaymentOrdersOpResponse syncPaymentOrders(SyncPaymentOrders input) throws Exception {
    if (input.getCustomBasePath().equals("") && !customBasePath.equals("")) {
      input.setCustomBasePath(customBasePath);
    }

    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }
}
