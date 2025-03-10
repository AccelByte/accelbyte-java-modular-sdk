/*
 * Copyright (c) 2024 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.inventory.operations.admin_items;

import java.io.*;
import java.util.*;
import lombok.Builder;
import lombok.Getter;
import lombok.Setter;
import net.accelbyte.sdk.api.inventory.models.*;
import net.accelbyte.sdk.api.inventory.operation_responses.admin_items.AdminGetInventoryItemOpResponse;
import net.accelbyte.sdk.core.HttpResponseException;
import net.accelbyte.sdk.core.Operation;
import net.accelbyte.sdk.core.util.Helper;

/**
 * AdminGetInventoryItem
 *
 * <p>Getting an item info.
 *
 * <p>Permission: ADMIN:NAMESPACE:{namespace}:USER:{userId}:INVENTORY:ITEM [READ]
 */
@Getter
@Setter
public class AdminGetInventoryItem extends Operation {
  /** generated field's value */
  private String path =
      "/inventory/v1/admin/namespaces/{namespace}/inventories/{inventoryId}/slots/{slotId}/sourceItems/{sourceItemId}";

  private String method = "GET";
  private List<String> consumes = Arrays.asList();
  private List<String> produces = Arrays.asList("application/json");
  private String locationQuery = null;

  /** fields as input parameter */
  private String inventoryId;

  private String namespace;
  private String slotId;
  private String sourceItemId;

  /**
   * @param inventoryId required
   * @param namespace required
   * @param slotId required
   * @param sourceItemId required
   */
  @Builder
  // @deprecated 2022-08-29 - All args constructor may cause problems. Use builder instead.
  @Deprecated
  public AdminGetInventoryItem(
      String customBasePath,
      String inventoryId,
      String namespace,
      String slotId,
      String sourceItemId) {
    this.inventoryId = inventoryId;
    this.namespace = namespace;
    this.slotId = slotId;
    this.sourceItemId = sourceItemId;
    super.customBasePath = customBasePath != null ? customBasePath : "";

    securities.add("Bearer");
  }

  @Override
  public Map<String, String> getPathParams() {
    Map<String, String> pathParams = new HashMap<>();
    if (this.inventoryId != null) {
      pathParams.put("inventoryId", this.inventoryId);
    }
    if (this.namespace != null) {
      pathParams.put("namespace", this.namespace);
    }
    if (this.slotId != null) {
      pathParams.put("slotId", this.slotId);
    }
    if (this.sourceItemId != null) {
      pathParams.put("sourceItemId", this.sourceItemId);
    }
    return pathParams;
  }

  @Override
  public boolean isValid() {
    if (this.inventoryId == null) {
      return false;
    }
    if (this.namespace == null) {
      return false;
    }
    if (this.slotId == null) {
      return false;
    }
    if (this.sourceItemId == null) {
      return false;
    }
    return true;
  }

  public AdminGetInventoryItemOpResponse parseResponse(
      int code, String contentType, InputStream payload) throws HttpResponseException, IOException {
    final AdminGetInventoryItemOpResponse response = new AdminGetInventoryItemOpResponse();

    response.setHttpStatusCode(code);
    response.setContentType(contentType);

    if (code == 204) {
      response.setSuccess(true);
    } else if ((code == 200) || (code == 201)) {
      final String json = Helper.convertInputStreamToString(payload);
      response.setData(new ApimodelsItemResp().createFromJson(json));
      response.setSuccess(true);
    } else if (code == 400) {
      final String json = Helper.convertInputStreamToString(payload);
      response.setError400(new ApimodelsErrorResponse().createFromJson(json));
      response.setError(response.getError400().translateToApiError());
    } else if (code == 404) {
      final String json = Helper.convertInputStreamToString(payload);
      response.setError404(new ApimodelsErrorResponse().createFromJson(json));
      response.setError(response.getError404().translateToApiError());
    } else if (code == 500) {
      final String json = Helper.convertInputStreamToString(payload);
      response.setError500(new ApimodelsErrorResponse().createFromJson(json));
      response.setError(response.getError500().translateToApiError());
    }

    return response;
  }

  /*
  public ApimodelsItemResp parseResponse(int code, String contentType, InputStream payload) throws HttpResponseException, IOException {
      if(code != 200){
          final String json = Helper.convertInputStreamToString(payload);
          throw new HttpResponseException(code, json);
      }
      final String json = Helper.convertInputStreamToString(payload);
      return new ApimodelsItemResp().createFromJson(json);
  }
  */

}
