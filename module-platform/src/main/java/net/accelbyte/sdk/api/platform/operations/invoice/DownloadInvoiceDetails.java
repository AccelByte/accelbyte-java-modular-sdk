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
import net.accelbyte.sdk.api.platform.operation_responses.invoice.DownloadInvoiceDetailsOpResponse;
import net.accelbyte.sdk.core.HttpResponseException;
import net.accelbyte.sdk.core.Operation;

/**
 * downloadInvoiceDetails
 *
 * <p>Download invoice details as a csv file. Other detail info:
 *
 * <p>* Returns : invoice details csv file
 */
@Getter
@Setter
public class DownloadInvoiceDetails extends Operation {
  /** generated field's value */
  private String path = "/platform/admin/namespaces/{namespace}/invoice/details.csv";

  private String method = "GET";
  private List<String> consumes = Arrays.asList();
  private List<String> produces = Arrays.asList("text/csv");
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
  public DownloadInvoiceDetails(
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

  public DownloadInvoiceDetailsOpResponse parseResponse(
      int code, String contentType, InputStream payload) throws HttpResponseException, IOException {
    final DownloadInvoiceDetailsOpResponse response = new DownloadInvoiceDetailsOpResponse();

    response.setHttpStatusCode(code);
    response.setContentType(contentType);

    if (code == 204) {
      response.setSuccess(true);
    } else if ((code == 200) || (code == 201)) {
      response.setSuccess(true);
      response.setData(payload);
    }

    return response;
  }

  /*
  public InputStream parseResponse(int code, String contentType, InputStream payload) throws HttpResponseException, IOException {
      if(code != 200){
          final String json = Helper.convertInputStreamToString(payload);
          throw new HttpResponseException(code, json);
      }
      return payload;
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

  public static class DownloadInvoiceDetailsBuilder {
    private String itemType;

    public DownloadInvoiceDetailsBuilder itemType(final String itemType) {
      this.itemType = itemType;
      return this;
    }

    public DownloadInvoiceDetailsBuilder itemTypeFromEnum(final ItemType itemType) {
      this.itemType = itemType.toString();
      return this;
    }
  }
}
