/*
 * Copyright (c) 2024 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.platform.operations.payment_station;

import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import java.io.*;
import java.util.*;
import lombok.Builder;
import lombok.Getter;
import lombok.Setter;
import net.accelbyte.sdk.api.platform.models.*;
import net.accelbyte.sdk.api.platform.operation_responses.payment_station.GetPaymentPublicConfigOpResponse;
import net.accelbyte.sdk.core.HttpResponseException;
import net.accelbyte.sdk.core.Operation;
import net.accelbyte.sdk.core.util.Helper;

/**
 * getPaymentPublicConfig
 *
 * <p>[Not supported yet in AGS Shared Cloud] Get payment provider public config, at current only
 * Strip provide public config. Other detail info:
 *
 * <p>* Returns : Public config
 */
@Getter
@Setter
public class GetPaymentPublicConfig extends Operation {
  /** generated field's value */
  private String path = "/platform/public/namespaces/{namespace}/payment/publicconfig";

  private String method = "GET";
  private List<String> consumes = Arrays.asList("application/json");
  private List<String> produces = Arrays.asList("application/json");
  private String locationQuery = null;

  /** fields as input parameter */
  private String namespace;

  private Boolean sandbox;
  private String paymentProvider;
  private String region;

  /**
   * @param namespace required
   * @param paymentProvider required
   * @param region required
   */
  @Builder
  // @deprecated 2022-08-29 - All args constructor may cause problems. Use builder instead.
  @Deprecated
  public GetPaymentPublicConfig(
      String customBasePath,
      String namespace,
      Boolean sandbox,
      String paymentProvider,
      String region) {
    this.namespace = namespace;
    this.sandbox = sandbox;
    this.paymentProvider = paymentProvider;
    this.region = region;
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
    queryParams.put(
        "sandbox", this.sandbox == null ? null : Arrays.asList(String.valueOf(this.sandbox)));
    queryParams.put(
        "paymentProvider",
        this.paymentProvider == null ? null : Arrays.asList(this.paymentProvider));
    queryParams.put("region", this.region == null ? null : Arrays.asList(this.region));
    return queryParams;
  }

  @Override
  public boolean isValid() {
    if (this.namespace == null) {
      return false;
    }
    if (this.paymentProvider == null) {
      return false;
    }
    if (this.region == null) {
      return false;
    }
    return true;
  }

  public GetPaymentPublicConfigOpResponse parseResponse(
      int code, String contentType, InputStream payload) throws HttpResponseException, IOException {
    final GetPaymentPublicConfigOpResponse response = new GetPaymentPublicConfigOpResponse();

    response.setHttpStatusCode(code);
    response.setContentType(contentType);

    if (code == 204) {
      response.setSuccess(true);
    } else if ((code == 200) || (code == 201)) {
      final String json = Helper.convertInputStreamToString(payload);

      response.setSuccess(true);
      response.setData(new ObjectMapper().readValue(json, new TypeReference<Map<String, ?>>() {}));
    }

    return response;
  }

  /*
  public Map<String, ?> parseResponse(int code, String contentType, InputStream payload) throws HttpResponseException, IOException {
      if(code != 200){
          final String json = Helper.convertInputStreamToString(payload);
          throw new HttpResponseException(code, json);
      }
      final String json = Helper.convertInputStreamToString(payload);
      return new ObjectMapper().readValue(json, new TypeReference<Map<String, ?>>() {});
  }
  */

  @Override
  protected Map<String, String> getCollectionFormatMap() {
    Map<String, String> result = new HashMap<>();
    result.put("sandbox", "None");
    result.put("paymentProvider", "None");
    result.put("region", "None");
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

  public static class GetPaymentPublicConfigBuilder {
    private String paymentProvider;

    public GetPaymentPublicConfigBuilder paymentProvider(final String paymentProvider) {
      this.paymentProvider = paymentProvider;
      return this;
    }

    public GetPaymentPublicConfigBuilder paymentProviderFromEnum(
        final PaymentProvider paymentProvider) {
      this.paymentProvider = paymentProvider.toString();
      return this;
    }
  }
}
