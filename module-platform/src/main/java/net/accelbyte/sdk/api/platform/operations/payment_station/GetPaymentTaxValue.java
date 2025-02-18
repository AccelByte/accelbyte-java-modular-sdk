/*
 * Copyright (c) 2024 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.platform.operations.payment_station;

import java.io.*;
import java.util.*;
import lombok.Builder;
import lombok.Getter;
import lombok.Setter;
import net.accelbyte.sdk.api.platform.models.*;
import net.accelbyte.sdk.api.platform.operation_responses.payment_station.GetPaymentTaxValueOpResponse;
import net.accelbyte.sdk.core.HttpResponseException;
import net.accelbyte.sdk.core.Operation;
import net.accelbyte.sdk.core.util.Helper;

/**
 * getPaymentTaxValue
 *
 * <p>[Not supported yet in AGS Shared Cloud] Check and get a payment order's should pay tax. Other
 * detail info:
 *
 * <p>* Returns : tax result
 */
@Getter
@Setter
public class GetPaymentTaxValue extends Operation {
  /** generated field's value */
  private String path = "/platform/public/namespaces/{namespace}/payment/tax";

  private String method = "GET";
  private List<String> consumes = Arrays.asList("application/json");
  private List<String> produces = Arrays.asList("application/json");
  private String locationQuery = null;

  /** fields as input parameter */
  private String namespace;

  private String zipCode;
  private String paymentOrderNo;
  private String paymentProvider;

  /**
   * @param namespace required
   * @param paymentOrderNo required
   * @param paymentProvider required
   */
  @Builder
  // @deprecated 2022-08-29 - All args constructor may cause problems. Use builder instead.
  @Deprecated
  public GetPaymentTaxValue(
      String customBasePath,
      String namespace,
      String zipCode,
      String paymentOrderNo,
      String paymentProvider) {
    this.namespace = namespace;
    this.zipCode = zipCode;
    this.paymentOrderNo = paymentOrderNo;
    this.paymentProvider = paymentProvider;
    super.customBasePath = customBasePath != null ? customBasePath : "";
  }

  @Override
  public Map<String, String> getPathParams() {
    Map<String, String> pathParams = new HashMap<>();
    if (this.namespace != null) {
      pathParams.put("namespace", this.namespace);
    }
    return pathParams;
  }

  @Override
  public Map<String, List<String>> getQueryParams() {
    Map<String, List<String>> queryParams = new HashMap<>();
    queryParams.put("zipCode", this.zipCode == null ? null : Arrays.asList(this.zipCode));
    queryParams.put(
        "paymentOrderNo", this.paymentOrderNo == null ? null : Arrays.asList(this.paymentOrderNo));
    queryParams.put(
        "paymentProvider",
        this.paymentProvider == null ? null : Arrays.asList(this.paymentProvider));
    return queryParams;
  }

  @Override
  public boolean isValid() {
    if (this.namespace == null) {
      return false;
    }
    if (this.paymentOrderNo == null) {
      return false;
    }
    if (this.paymentProvider == null) {
      return false;
    }
    return true;
  }

  public GetPaymentTaxValueOpResponse parseResponse(
      int code, String contentType, InputStream payload) throws HttpResponseException, IOException {
    final GetPaymentTaxValueOpResponse response = new GetPaymentTaxValueOpResponse();

    response.setHttpStatusCode(code);
    response.setContentType(contentType);

    if (code == 204) {
      response.setSuccess(true);
    } else if ((code == 200) || (code == 201)) {
      final String json = Helper.convertInputStreamToString(payload);
      response.setData(new TaxResult().createFromJson(json));
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
  public TaxResult parseResponse(int code, String contentType, InputStream payload) throws HttpResponseException, IOException {
      if(code != 200){
          final String json = Helper.convertInputStreamToString(payload);
          throw new HttpResponseException(code, json);
      }
      final String json = Helper.convertInputStreamToString(payload);
      return new TaxResult().createFromJson(json);
  }
  */

  @Override
  protected Map<String, String> getCollectionFormatMap() {
    Map<String, String> result = new HashMap<>();
    result.put("zipCode", "None");
    result.put("paymentOrderNo", "None");
    result.put("paymentProvider", "None");
    return result;
  }

  public enum PaymentProvider {
    ADYEN("ADYEN"),
    ALIPAY("ALIPAY"),
    CHECKOUT("CHECKOUT"),
    NEONPAY("NEONPAY"),
    PAYPAL("PAYPAL"),
    STRIPE("STRIPE"),
    WALLET("WALLET"),
    WXPAY("WXPAY"),
    XSOLLA("XSOLLA");

    private String value;

    PaymentProvider(String value) {
      this.value = value;
    }

    @Override
    public String toString() {
      return this.value;
    }
  }

  public static class GetPaymentTaxValueBuilder {
    private String paymentProvider;

    public GetPaymentTaxValueBuilder paymentProvider(final String paymentProvider) {
      this.paymentProvider = paymentProvider;
      return this;
    }

    public GetPaymentTaxValueBuilder paymentProviderFromEnum(
        final PaymentProvider paymentProvider) {
      this.paymentProvider = paymentProvider.toString();
      return this;
    }
  }
}
