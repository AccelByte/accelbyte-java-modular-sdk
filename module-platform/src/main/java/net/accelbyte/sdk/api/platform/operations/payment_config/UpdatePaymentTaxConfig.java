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
import net.accelbyte.sdk.api.platform.operation_responses.payment_config.UpdatePaymentTaxConfigOpResponse;
import net.accelbyte.sdk.core.HttpResponseException;
import net.accelbyte.sdk.core.Operation;
import net.accelbyte.sdk.core.util.Helper;

/**
 * updatePaymentTaxConfig
 *
 * <p>[Not supported yet in AGS Shared Cloud] Update payment tax config.
 *
 * <p>Request Body Parameters:
 *
 * <p>Parameter | Type | Required | Description
 * --------------------------|---------|----------|---------------------------------------------------------------------
 * taxJarEnabled | Boolean | false taxJarApiToken | String | false | required, when taxJarEnabled is
 * true and there is no existing token sandboxTaxJarApiToken | String | false | optional
 * taxJarProductCodesMapping | Map | No | key is item type(APP |COINS |INGAMEITEM |BUNDLE |CODE
 * |SUBSCRIPTION) and value is product tax code:
 * https://developers.taxjar.com/api/reference/?ruby#get-list-tax-categories
 *
 * <p>Other detail info: * Returns : payment global tax config
 */
@Getter
@Setter
public class UpdatePaymentTaxConfig extends Operation {
  /** generated field's value */
  private String path = "/platform/admin/payment/config/tax";

  private String method = "PUT";
  private List<String> consumes = Arrays.asList("application/json");
  private List<String> produces = Arrays.asList("application/json");
  private String locationQuery = null;

  /** fields as input parameter */
  private PaymentTaxConfigEdit body;

  /**
   * @param body required
   */
  @Builder
  // @deprecated 2022-08-29 - All args constructor may cause problems. Use builder instead.
  @Deprecated
  public UpdatePaymentTaxConfig(String customBasePath, PaymentTaxConfigEdit body) {
    this.body = body;
    super.customBasePath = customBasePath != null ? customBasePath : "";

    securities.add("Bearer");
  }

  @Override
  public PaymentTaxConfigEdit getBodyParams() {
    return this.body;
  }

  @Override
  public boolean isValid() {
    if (this.body == null) {
      return false;
    }
    return true;
  }

  public UpdatePaymentTaxConfigOpResponse parseResponse(
      int code, String contentType, InputStream payload) throws HttpResponseException, IOException {
    final UpdatePaymentTaxConfigOpResponse response = new UpdatePaymentTaxConfigOpResponse();

    response.setHttpStatusCode(code);
    response.setContentType(contentType);

    if (code == 204) {
      response.setSuccess(true);
    } else if ((code == 200) || (code == 201)) {
      final String json = Helper.convertInputStreamToString(payload);
      response.setData(new PaymentTaxConfigInfo().createFromJson(json));
      response.setSuccess(true);
    } else if (code == 400) {
      final String json = Helper.convertInputStreamToString(payload);
      response.setError400(new ErrorEntity().createFromJson(json));
      response.setError(response.getError400().translateToApiError());
    } else if (code == 422) {
      final String json = Helper.convertInputStreamToString(payload);
      response.setError422(new ValidationErrorEntity().createFromJson(json));
      response.setError(response.getError422().translateToApiError());
    }

    return response;
  }

  /*
  public PaymentTaxConfigInfo parseResponse(int code, String contentType, InputStream payload) throws HttpResponseException, IOException {
      if(code != 200){
          final String json = Helper.convertInputStreamToString(payload);
          throw new HttpResponseException(code, json);
      }
      final String json = Helper.convertInputStreamToString(payload);
      return new PaymentTaxConfigInfo().createFromJson(json);
  }
  */

}
