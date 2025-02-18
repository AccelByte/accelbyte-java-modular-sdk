/*
 * Copyright (c) 2024 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.platform.operations.payment;

import java.io.*;
import java.util.*;
import lombok.Builder;
import lombok.Getter;
import lombok.Setter;
import net.accelbyte.sdk.api.platform.models.*;
import net.accelbyte.sdk.api.platform.operation_responses.payment.SimulatePaymentOrderNotificationOpResponse;
import net.accelbyte.sdk.core.HttpResponseException;
import net.accelbyte.sdk.core.Operation;
import net.accelbyte.sdk.core.util.Helper;

/**
 * simulatePaymentOrderNotification
 *
 * <p>[Not supported yet in AGS Shared Cloud] [TEST FACILITY ONLY] Forbidden in live environment.
 * Simulate payment notification on sandbox payment order, usually for test usage to simulate real
 * currency payment notification. Other detail info:
 *
 * <p>* Returns : notification process result
 */
@Getter
@Setter
public class SimulatePaymentOrderNotification extends Operation {
  /** generated field's value */
  private String path =
      "/platform/admin/namespaces/{namespace}/payment/orders/{paymentOrderNo}/simulate-notification";

  private String method = "PUT";
  private List<String> consumes = Arrays.asList("application/json");
  private List<String> produces = Arrays.asList("application/json");
  private String locationQuery = null;

  /** fields as input parameter */
  private String namespace;

  private String paymentOrderNo;
  private PaymentOrderNotifySimulation body;

  /**
   * @param namespace required
   * @param paymentOrderNo required
   * @param body required
   */
  @Builder
  // @deprecated 2022-08-29 - All args constructor may cause problems. Use builder instead.
  @Deprecated
  public SimulatePaymentOrderNotification(
      String customBasePath,
      String namespace,
      String paymentOrderNo,
      PaymentOrderNotifySimulation body) {
    this.namespace = namespace;
    this.paymentOrderNo = paymentOrderNo;
    this.body = body;
    super.customBasePath = customBasePath != null ? customBasePath : "";

    securities.add("Bearer");
  }

  @Override
  public Map<String, String> getPathParams() {
    Map<String, String> pathParams = new HashMap<>();
    if (this.namespace != null) {
      pathParams.put("namespace", this.namespace);
    }
    if (this.paymentOrderNo != null) {
      pathParams.put("paymentOrderNo", this.paymentOrderNo);
    }
    return pathParams;
  }

  @Override
  public PaymentOrderNotifySimulation getBodyParams() {
    return this.body;
  }

  @Override
  public boolean isValid() {
    if (this.namespace == null) {
      return false;
    }
    if (this.paymentOrderNo == null) {
      return false;
    }
    if (this.body == null) {
      return false;
    }
    return true;
  }

  public SimulatePaymentOrderNotificationOpResponse parseResponse(
      int code, String contentType, InputStream payload) throws HttpResponseException, IOException {
    final SimulatePaymentOrderNotificationOpResponse response =
        new SimulatePaymentOrderNotificationOpResponse();

    response.setHttpStatusCode(code);
    response.setContentType(contentType);

    if (code == 204) {
      response.setSuccess(true);
    } else if ((code == 200) || (code == 201)) {
      final String json = Helper.convertInputStreamToString(payload);
      response.setData(new NotificationProcessResult().createFromJson(json));
      response.setSuccess(true);
    } else if (code == 400) {
      final String json = Helper.convertInputStreamToString(payload);
      response.setError400(new ErrorEntity().createFromJson(json));
      response.setError(response.getError400().translateToApiError());
    } else if (code == 404) {
      final String json = Helper.convertInputStreamToString(payload);
      response.setError404(new ErrorEntity().createFromJson(json));
      response.setError(response.getError404().translateToApiError());
    }

    return response;
  }

  /*
  public NotificationProcessResult parseResponse(int code, String contentType, InputStream payload) throws HttpResponseException, IOException {
      if(code != 200){
          final String json = Helper.convertInputStreamToString(payload);
          throw new HttpResponseException(code, json);
      }
      final String json = Helper.convertInputStreamToString(payload);
      return new NotificationProcessResult().createFromJson(json);
  }
  */

}
