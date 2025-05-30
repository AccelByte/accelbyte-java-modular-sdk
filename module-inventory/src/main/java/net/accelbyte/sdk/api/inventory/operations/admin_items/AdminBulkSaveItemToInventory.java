/*
 * Copyright (c) 2024 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.inventory.operations.admin_items;

import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import java.io.*;
import java.util.*;
import lombok.Builder;
import lombok.Getter;
import lombok.Setter;
import net.accelbyte.sdk.api.inventory.models.*;
import net.accelbyte.sdk.api.inventory.operation_responses.admin_items.AdminBulkSaveItemToInventoryOpResponse;
import net.accelbyte.sdk.core.HttpResponseException;
import net.accelbyte.sdk.core.Operation;
import net.accelbyte.sdk.core.util.Helper;

/**
 * AdminBulkSaveItemToInventory
 *
 * <p>**This endpoint is used for bulk saving purchased items to a specific inventory of the player,
 * with the following conditions for E-commerce items:** - Attributes such as slotUsed,
 * serverCustomAttributes, customAttributes, and type will be overridden by the attributes
 * configured in the AccelByte Gaming Services (AGS) Store. - Storing E-commerce items in a
 * particular slot will follow its entitlement and item configuration, such as durable, consumable,
 * stackable and non-stackable. - The quantity is dynamically set based on an itemâs useCount
 * configured in Store. When saving an item, the specified quantity will be multiplied by configured
 * useCount for that particular item. For example, if an Item is configured with a useCount of 5 in
 * the AGS Store and it is saved with a qty of 2, the itemâs quantity will be stored as 10 in the
 * playerâs inventory.
 *
 * <p>**When configuring your request, note the following:** - The source field is mandatory for
 * determining the source of the item. The supported values are OTHER (for items coming from other
 * sources) and E-commerce for items coming from the E-commerce integration. - For other-sourced
 * items, the type can be manually defined when saving the item. - A maximum of 10 items can be
 * saved in a single bulk call.
 *
 * <p>You must have this permission to access this endpoint: **Permission:
 * ADMIN:NAMESPACE:{namespace}:USER:{userId}:INVENTORY:ITEM[CREATE]**
 */
@Getter
@Setter
public class AdminBulkSaveItemToInventory extends Operation {
  /** generated field's value */
  private String path =
      "/inventory/v1/admin/namespaces/{namespace}/users/{userId}/inventories/{inventoryId}/items/bulk";

  private String method = "POST";
  private List<String> consumes = Arrays.asList("application/json");
  private List<String> produces = Arrays.asList("application/json");
  private String locationQuery = null;

  /** fields as input parameter */
  private String inventoryId;

  private String namespace;
  private String userId;
  private List<ApimodelsSaveItemToInventoryReq> body;

  /**
   * @param inventoryId required
   * @param namespace required
   * @param userId required
   * @param body required
   */
  @Builder
  // @deprecated 2022-08-29 - All args constructor may cause problems. Use builder instead.
  @Deprecated
  public AdminBulkSaveItemToInventory(
      String customBasePath,
      String inventoryId,
      String namespace,
      String userId,
      List<ApimodelsSaveItemToInventoryReq> body) {
    this.inventoryId = inventoryId;
    this.namespace = namespace;
    this.userId = userId;
    this.body = body;
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
    if (this.userId != null) {
      pathParams.put("userId", this.userId);
    }
    return pathParams;
  }

  @Override
  public List<ApimodelsSaveItemToInventoryReq> getBodyParams() {
    return this.body;
  }

  @Override
  public boolean isValid() {
    if (this.inventoryId == null) {
      return false;
    }
    if (this.namespace == null) {
      return false;
    }
    if (this.userId == null) {
      return false;
    }
    if (this.body == null) {
      return false;
    }
    return true;
  }

  public AdminBulkSaveItemToInventoryOpResponse parseResponse(
      int code, String contentType, InputStream payload) throws HttpResponseException, IOException {
    final AdminBulkSaveItemToInventoryOpResponse response =
        new AdminBulkSaveItemToInventoryOpResponse();

    response.setHttpStatusCode(code);
    response.setContentType(contentType);

    if (code == 204) {
      response.setSuccess(true);
    } else if ((code == 200) || (code == 201)) {
      final String json = Helper.convertInputStreamToString(payload);

      response.setSuccess(true);
      response.setData(
          new ObjectMapper()
              .readValue(json, new TypeReference<List<ApimodelsBulkSaveItemResp>>() {}));
    } else if (code == 400) {
      final String json = Helper.convertInputStreamToString(payload);
      response.setError400(new ApimodelsErrorResponse().createFromJson(json));
      response.setError(response.getError400().translateToApiError());
    } else if (code == 401) {
      final String json = Helper.convertInputStreamToString(payload);
      response.setError401(new ApimodelsErrorResponse().createFromJson(json));
      response.setError(response.getError401().translateToApiError());
    } else if (code == 403) {
      final String json = Helper.convertInputStreamToString(payload);
      response.setError403(new ApimodelsErrorResponse().createFromJson(json));
      response.setError(response.getError403().translateToApiError());
    } else if (code == 404) {
      final String json = Helper.convertInputStreamToString(payload);
      response.setError404(new ApimodelsErrorResponse().createFromJson(json));
      response.setError(response.getError404().translateToApiError());
    } else if (code == 422) {
      final String json = Helper.convertInputStreamToString(payload);
      response.setError422(new ApimodelsErrorResponse().createFromJson(json));
      response.setError(response.getError422().translateToApiError());
    } else if (code == 500) {
      final String json = Helper.convertInputStreamToString(payload);
      response.setError500(new ApimodelsErrorResponse().createFromJson(json));
      response.setError(response.getError500().translateToApiError());
    }

    return response;
  }

  /*
  public List<ApimodelsBulkSaveItemResp> parseResponse(int code, String contentType, InputStream payload) throws HttpResponseException, IOException {
      if(code != 200){
          final String json = Helper.convertInputStreamToString(payload);
          throw new HttpResponseException(code, json);
      }
      final String json = Helper.convertInputStreamToString(payload);
      return new ObjectMapper().readValue(json, new TypeReference<List<ApimodelsBulkSaveItemResp>>() {});
  }
  */

}
