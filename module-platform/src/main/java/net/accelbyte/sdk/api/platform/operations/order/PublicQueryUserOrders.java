/*
 * Copyright (c) 2024 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.platform.operations.order;

import java.io.*;
import java.util.*;
import lombok.Builder;
import lombok.Getter;
import lombok.Setter;
import net.accelbyte.sdk.api.platform.models.*;
import net.accelbyte.sdk.api.platform.operation_responses.order.PublicQueryUserOrdersOpResponse;
import net.accelbyte.sdk.core.HttpResponseException;
import net.accelbyte.sdk.core.Operation;
import net.accelbyte.sdk.core.util.Helper;

/**
 * publicQueryUserOrders
 *
 * <p>Query user orders. Other detail info:
 *
 * <p>* Returns : get order
 */
@Getter
@Setter
public class PublicQueryUserOrders extends Operation {
  /** generated field's value */
  private String path = "/platform/public/namespaces/{namespace}/users/{userId}/orders";

  private String method = "GET";
  private List<String> consumes = Arrays.asList("application/json");
  private List<String> produces = Arrays.asList("application/json");
  private String locationQuery = null;

  /** fields as input parameter */
  private String namespace;

  private String userId;
  private Boolean discounted;
  private String itemId;
  private Integer limit;
  private Integer offset;
  private String status;

  /**
   * @param namespace required
   * @param userId required
   */
  @Builder
  // @deprecated 2022-08-29 - All args constructor may cause problems. Use builder instead.
  @Deprecated
  public PublicQueryUserOrders(
      String customBasePath,
      String namespace,
      String userId,
      Boolean discounted,
      String itemId,
      Integer limit,
      Integer offset,
      String status) {
    this.namespace = namespace;
    this.userId = userId;
    this.discounted = discounted;
    this.itemId = itemId;
    this.limit = limit;
    this.offset = offset;
    this.status = status;
    super.customBasePath = customBasePath != null ? customBasePath : "";

    securities.add("Bearer");
  }

  @Override
  public Map<String, String> getPathParams() {
    Map<String, String> pathParams = new HashMap<>();
    if (this.namespace != null) {
      pathParams.put("namespace", this.namespace);
    }
    if (this.userId != null) {
      pathParams.put("userId", this.userId);
    }
    return pathParams;
  }

  @Override
  public Map<String, List<String>> getQueryParams() {
    Map<String, List<String>> queryParams = new HashMap<>();
    queryParams.put(
        "discounted",
        this.discounted == null ? null : Arrays.asList(String.valueOf(this.discounted)));
    queryParams.put("itemId", this.itemId == null ? null : Arrays.asList(this.itemId));
    queryParams.put("limit", this.limit == null ? null : Arrays.asList(String.valueOf(this.limit)));
    queryParams.put(
        "offset", this.offset == null ? null : Arrays.asList(String.valueOf(this.offset)));
    queryParams.put("status", this.status == null ? null : Arrays.asList(this.status));
    return queryParams;
  }

  @Override
  public boolean isValid() {
    if (this.namespace == null) {
      return false;
    }
    if (this.userId == null) {
      return false;
    }
    return true;
  }

  public PublicQueryUserOrdersOpResponse parseResponse(
      int code, String contentType, InputStream payload) throws HttpResponseException, IOException {
    final PublicQueryUserOrdersOpResponse response = new PublicQueryUserOrdersOpResponse();

    response.setHttpStatusCode(code);
    response.setContentType(contentType);

    if (code == 204) {
      response.setSuccess(true);
    } else if ((code == 200) || (code == 201)) {
      final String json = Helper.convertInputStreamToString(payload);
      response.setData(new OrderPagingSlicedResult().createFromJson(json));
      response.setSuccess(true);
    }

    return response;
  }

  /*
  public OrderPagingSlicedResult parseResponse(int code, String contentType, InputStream payload) throws HttpResponseException, IOException {
      if(code != 200){
          final String json = Helper.convertInputStreamToString(payload);
          throw new HttpResponseException(code, json);
      }
      final String json = Helper.convertInputStreamToString(payload);
      return new OrderPagingSlicedResult().createFromJson(json);
  }
  */

  @Override
  protected Map<String, String> getCollectionFormatMap() {
    Map<String, String> result = new HashMap<>();
    result.put("discounted", "None");
    result.put("itemId", "None");
    result.put("limit", "None");
    result.put("offset", "None");
    result.put("status", "None");
    return result;
  }

  public enum Status {
    CHARGEBACK("CHARGEBACK"),
    CHARGEBACKREVERSED("CHARGEBACK_REVERSED"),
    CHARGED("CHARGED"),
    CLOSED("CLOSED"),
    DELETED("DELETED"),
    FULFILLED("FULFILLED"),
    FULFILLFAILED("FULFILL_FAILED"),
    INIT("INIT"),
    REFUNDED("REFUNDED"),
    REFUNDING("REFUNDING"),
    REFUNDFAILED("REFUND_FAILED");

    private String value;

    Status(String value) {
      this.value = value;
    }

    @Override
    public String toString() {
      return this.value;
    }
  }

  public static class PublicQueryUserOrdersBuilder {
    private String status;

    public PublicQueryUserOrdersBuilder status(final String status) {
      this.status = status;
      return this;
    }

    public PublicQueryUserOrdersBuilder statusFromEnum(final Status status) {
      this.status = status.toString();
      return this;
    }
  }
}
