/*
 * Copyright (c) 2024 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.platform.operations.payment_config;

import java.io.*;
import java.util.*;
import lombok.Builder;
import lombok.Getter;
import lombok.Setter;
import net.accelbyte.sdk.api.platform.models.*;
import net.accelbyte.sdk.api.platform.operation_responses.payment_config.GetPaymentMerchantConfig1OpResponse;
import net.accelbyte.sdk.core.HttpResponseException;
import net.accelbyte.sdk.core.Operation;
import net.accelbyte.sdk.core.util.Helper;

/**
 * getPaymentMerchantConfig_1
 *
 * <p>[Not supported yet in AGS Shared Cloud] Get payment merchant config by id. Other detail info:
 *
 * <p>* Returns : payment merchant config info
 */
@Getter
@Setter
public class GetPaymentMerchantConfig1 extends Operation {
  /** generated field's value */
  private String path = "/platform/admin/payment/config/merchant/{id}";

  private String method = "GET";
  private List<String> consumes = Arrays.asList();
  private List<String> produces = Arrays.asList("application/json");
  private String locationQuery = null;

  /** fields as input parameter */
  private String id;

  /**
   * @param id required
   */
  @Builder
  // @deprecated 2022-08-29 - All args constructor may cause problems. Use builder instead.
  @Deprecated
  public GetPaymentMerchantConfig1(String customBasePath, String id) {
    this.id = id;
    super.customBasePath = customBasePath != null ? customBasePath : "";

    securities.add("Bearer");
  }

  @Override
  public Map<String, String> getPathParams() {
    Map<String, String> pathParams = new HashMap<>();
    if (this.id != null) {
      pathParams.put("id", this.id);
    }
    return pathParams;
  }

  @Override
  public boolean isValid() {
    if (this.id == null) {
      return false;
    }
    return true;
  }

  public GetPaymentMerchantConfig1OpResponse parseResponse(
      int code, String contentType, InputStream payload) throws HttpResponseException, IOException {
    final GetPaymentMerchantConfig1OpResponse response = new GetPaymentMerchantConfig1OpResponse();

    response.setHttpStatusCode(code);
    response.setContentType(contentType);

    if (code == 204) {
      response.setSuccess(true);
    } else if ((code == 200) || (code == 201)) {
      final String json = Helper.convertInputStreamToString(payload);
      response.setData(new PaymentMerchantConfigInfo().createFromJson(json));
      response.setSuccess(true);
    } else if (code == 404) {
      final String json = Helper.convertInputStreamToString(payload);
      response.setError404(new ErrorEntity().createFromJson(json));
      response.setError(response.getError404().translateToApiError());
    }

    return response;
  }

  /*
  public PaymentMerchantConfigInfo parseResponse(int code, String contentType, InputStream payload) throws HttpResponseException, IOException {
      if(code != 200){
          final String json = Helper.convertInputStreamToString(payload);
          throw new HttpResponseException(code, json);
      }
      final String json = Helper.convertInputStreamToString(payload);
      return new PaymentMerchantConfigInfo().createFromJson(json);
  }
  */

}
