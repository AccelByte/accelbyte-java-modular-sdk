/*
 * Copyright (c) 2024 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.platform.operations.item;

import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import java.io.*;
import java.util.*;
import lombok.Builder;
import lombok.Getter;
import lombok.Setter;
import net.accelbyte.sdk.api.platform.models.*;
import net.accelbyte.sdk.api.platform.operation_responses.item.PublicBulkGetItemsOpResponse;
import net.accelbyte.sdk.core.HttpResponseException;
import net.accelbyte.sdk.core.Operation;
import net.accelbyte.sdk.core.util.Helper;

/**
 * publicBulkGetItems
 *
 * <p>This API is used to bulk get locale items. If item not exist in specific region, default
 * region item will return.
 *
 * <p>Other detail info:
 *
 * <p>* Optional permission : resource="PREVIEW", action=1(CREATE) (user with this permission can
 * view draft store items) * Optional permission : resource="SANDBOX", action=1(CREATE) (user with
 * this permission can view draft store items) * Returns : the list of items info
 */
@Getter
@Setter
public class PublicBulkGetItems extends Operation {
  /** generated field's value */
  private String path = "/platform/public/namespaces/{namespace}/items/locale/byIds";

  private String method = "GET";
  private List<String> consumes = Arrays.asList();
  private List<String> produces = Arrays.asList("application/json");
  private String locationQuery = null;

  /** fields as input parameter */
  private String namespace;

  private Boolean autoCalcEstimatedPrice;
  private String language;
  private String region;
  private String storeId;
  private String itemIds;

  /**
   * @param namespace required
   * @param itemIds required
   */
  @Builder
  // @deprecated 2022-08-29 - All args constructor may cause problems. Use builder instead.
  @Deprecated
  public PublicBulkGetItems(
      String customBasePath,
      String namespace,
      Boolean autoCalcEstimatedPrice,
      String language,
      String region,
      String storeId,
      String itemIds) {
    this.namespace = namespace;
    this.autoCalcEstimatedPrice = autoCalcEstimatedPrice;
    this.language = language;
    this.region = region;
    this.storeId = storeId;
    this.itemIds = itemIds;
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
    queryParams.put(
        "autoCalcEstimatedPrice",
        this.autoCalcEstimatedPrice == null
            ? null
            : Arrays.asList(String.valueOf(this.autoCalcEstimatedPrice)));
    queryParams.put("language", this.language == null ? null : Arrays.asList(this.language));
    queryParams.put("region", this.region == null ? null : Arrays.asList(this.region));
    queryParams.put("storeId", this.storeId == null ? null : Arrays.asList(this.storeId));
    queryParams.put("itemIds", this.itemIds == null ? null : Arrays.asList(this.itemIds));
    return queryParams;
  }

  @Override
  public boolean isValid() {
    if (this.namespace == null) {
      return false;
    }
    if (this.itemIds == null) {
      return false;
    }
    return true;
  }

  public PublicBulkGetItemsOpResponse parseResponse(
      int code, String contentType, InputStream payload) throws HttpResponseException, IOException {
    final PublicBulkGetItemsOpResponse response = new PublicBulkGetItemsOpResponse();

    response.setHttpStatusCode(code);
    response.setContentType(contentType);

    if (code == 204) {
      response.setSuccess(true);
    } else if ((code == 200) || (code == 201)) {
      final String json = Helper.convertInputStreamToString(payload);

      response.setSuccess(true);
      response.setData(new ObjectMapper().readValue(json, new TypeReference<List<ItemInfo>>() {}));
    } else if (code == 404) {
      final String json = Helper.convertInputStreamToString(payload);
      response.setError404(new ErrorEntity().createFromJson(json));
      response.setError(response.getError404().translateToApiError());
    }

    return response;
  }

  /*
  public List<ItemInfo> parseResponse(int code, String contentType, InputStream payload) throws HttpResponseException, IOException {
      if(code != 200){
          final String json = Helper.convertInputStreamToString(payload);
          throw new HttpResponseException(code, json);
      }
      final String json = Helper.convertInputStreamToString(payload);
      return new ObjectMapper().readValue(json, new TypeReference<List<ItemInfo>>() {});
  }
  */

  @Override
  protected Map<String, String> getCollectionFormatMap() {
    Map<String, String> result = new HashMap<>();
    result.put("autoCalcEstimatedPrice", "None");
    result.put("language", "None");
    result.put("region", "None");
    result.put("storeId", "None");
    result.put("itemIds", "None");
    return result;
  }
}
