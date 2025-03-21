/*
 * Copyright (c) 2024 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.platform.operations.invoice;

import java.io.*;
import java.util.*;
import lombok.Builder;
import lombok.Getter;
import lombok.Setter;
import net.accelbyte.sdk.api.platform.models.*;
import net.accelbyte.sdk.api.platform.operation_responses.invoice.GenerateInvoiceSummaryOpResponse;
import net.accelbyte.sdk.core.HttpResponseException;
import net.accelbyte.sdk.core.Operation;
import net.accelbyte.sdk.core.util.Helper;

/**
 * generateInvoiceSummary
 *
 * <p>Generate invoice summary. Other detail info:
 *
 * <p>* Returns : query orders
 */
@Getter
@Setter
public class GenerateInvoiceSummary extends Operation {
  /** generated field's value */
  private String path = "/platform/admin/namespaces/{namespace}/invoice/summary";

  private String method = "GET";
  private List<String> consumes = Arrays.asList();
  private List<String> produces = Arrays.asList("application/json");
  private String locationQuery = null;

  /** fields as input parameter */
  private String namespace;

  private String endTime;
  private String feature;
  private String itemId;
  private String itemType;
  private String startTime;

  /**
   * @param namespace required
   * @param endTime required
   * @param feature required
   * @param itemId required
   * @param itemType required
   * @param startTime required
   */
  @Builder
  // @deprecated 2022-08-29 - All args constructor may cause problems. Use builder instead.
  @Deprecated
  public GenerateInvoiceSummary(
      String customBasePath,
      String namespace,
      String endTime,
      String feature,
      String itemId,
      String itemType,
      String startTime) {
    this.namespace = namespace;
    this.endTime = endTime;
    this.feature = feature;
    this.itemId = itemId;
    this.itemType = itemType;
    this.startTime = startTime;
    super.customBasePath = customBasePath != null ? customBasePath : "";

    securities.add("Bearer");
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
    queryParams.put("endTime", this.endTime == null ? null : Arrays.asList(this.endTime));
    queryParams.put("feature", this.feature == null ? null : Arrays.asList(this.feature));
    queryParams.put("itemId", this.itemId == null ? null : Arrays.asList(this.itemId));
    queryParams.put("itemType", this.itemType == null ? null : Arrays.asList(this.itemType));
    queryParams.put("startTime", this.startTime == null ? null : Arrays.asList(this.startTime));
    return queryParams;
  }

  @Override
  public boolean isValid() {
    if (this.namespace == null) {
      return false;
    }
    if (this.endTime == null) {
      return false;
    }
    if (this.feature == null) {
      return false;
    }
    if (this.itemId == null) {
      return false;
    }
    if (this.itemType == null) {
      return false;
    }
    if (this.startTime == null) {
      return false;
    }
    return true;
  }

  public GenerateInvoiceSummaryOpResponse parseResponse(
      int code, String contentType, InputStream payload) throws HttpResponseException, IOException {
    final GenerateInvoiceSummaryOpResponse response = new GenerateInvoiceSummaryOpResponse();

    response.setHttpStatusCode(code);
    response.setContentType(contentType);

    if (code == 204) {
      response.setSuccess(true);
    } else if ((code == 200) || (code == 201)) {
      final String json = Helper.convertInputStreamToString(payload);
      response.setData(new InvoiceSummary().createFromJson(json));
      response.setSuccess(true);
    } else if (code == 422) {
      final String json = Helper.convertInputStreamToString(payload);
      response.setError422(new ValidationErrorEntity().createFromJson(json));
      response.setError(response.getError422().translateToApiError());
    }

    return response;
  }

  /*
  public InvoiceSummary parseResponse(int code, String contentType, InputStream payload) throws HttpResponseException, IOException {
      if(code != 200){
          final String json = Helper.convertInputStreamToString(payload);
          throw new HttpResponseException(code, json);
      }
      final String json = Helper.convertInputStreamToString(payload);
      return new InvoiceSummary().createFromJson(json);
  }
  */

  @Override
  protected Map<String, String> getCollectionFormatMap() {
    Map<String, String> result = new HashMap<>();
    result.put("endTime", "None");
    result.put("feature", "None");
    result.put("itemId", "None");
    result.put("itemType", "None");
    result.put("startTime", "None");
    return result;
  }

  public enum ItemType {
    APP("APP"),
    BUNDLE("BUNDLE"),
    CODE("CODE"),
    COINS("COINS"),
    EXTENSION("EXTENSION"),
    INGAMEITEM("INGAMEITEM"),
    LOOTBOX("LOOTBOX"),
    MEDIA("MEDIA"),
    OPTIONBOX("OPTIONBOX"),
    SEASON("SEASON"),
    SUBSCRIPTION("SUBSCRIPTION");

    private String value;

    ItemType(String value) {
      this.value = value;
    }

    @Override
    public String toString() {
      return this.value;
    }
  }

  public static class GenerateInvoiceSummaryBuilder {
    private String itemType;

    public GenerateInvoiceSummaryBuilder itemType(final String itemType) {
      this.itemType = itemType;
      return this;
    }

    public GenerateInvoiceSummaryBuilder itemTypeFromEnum(final ItemType itemType) {
      this.itemType = itemType.toString();
      return this;
    }
  }
}
