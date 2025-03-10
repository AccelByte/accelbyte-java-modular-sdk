/*
 * Copyright (c) 2024 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.platform.operations.fulfillment_script;

import java.io.*;
import java.util.*;
import lombok.Builder;
import lombok.Getter;
import lombok.Setter;
import net.accelbyte.sdk.api.platform.models.*;
import net.accelbyte.sdk.api.platform.operation_responses.fulfillment_script.CreateFulfillmentScriptOpResponse;
import net.accelbyte.sdk.core.HttpResponseException;
import net.accelbyte.sdk.core.Operation;
import net.accelbyte.sdk.core.util.Helper;

/**
 * createFulfillmentScript
 *
 * <p>[Not supported yet in AGS Shared Cloud] Create fulfillment script. Other detail info:
 *
 * <p>Fulfillment scripts are used for adding custom fulfillment logic based on ITEM_TYPE :
 * [MEDIA,INGAMEITEM] for now, and the custom scripts only cover grantDays. Example for grantDays:
 * `order && ((order.currency && order.currency.currencyCode) == 'LP' || order.isFree) ? 30 : -1`
 */
@Getter
@Setter
public class CreateFulfillmentScript extends Operation {
  /** generated field's value */
  private String path = "/platform/admin/fulfillment/scripts/{id}";

  private String method = "POST";
  private List<String> consumes = Arrays.asList("application/json");
  private List<String> produces = Arrays.asList();
  private String locationQuery = null;

  /** fields as input parameter */
  private String id;

  private FulfillmentScriptCreate body;

  /**
   * @param id required
   */
  @Builder
  // @deprecated 2022-08-29 - All args constructor may cause problems. Use builder instead.
  @Deprecated
  public CreateFulfillmentScript(String customBasePath, String id, FulfillmentScriptCreate body) {
    this.id = id;
    this.body = body;
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
  public FulfillmentScriptCreate getBodyParams() {
    return this.body;
  }

  @Override
  public boolean isValid() {
    if (this.id == null) {
      return false;
    }
    return true;
  }

  public CreateFulfillmentScriptOpResponse parseResponse(
      int code, String contentType, InputStream payload) throws HttpResponseException, IOException {
    final CreateFulfillmentScriptOpResponse response = new CreateFulfillmentScriptOpResponse();

    response.setHttpStatusCode(code);
    response.setContentType(contentType);

    if (code == 204) {
      response.setSuccess(true);
    } else if ((code == 200) || (code == 201)) {
      final String json = Helper.convertInputStreamToString(payload);
      response.setData(new FulfillmentScriptInfo().createFromJson(json));
      response.setSuccess(true);
    } else if (code == 409) {
      final String json = Helper.convertInputStreamToString(payload);
      response.setError409(new ErrorEntity().createFromJson(json));
      response.setError(response.getError409().translateToApiError());
    }

    return response;
  }

  /*
  public FulfillmentScriptInfo parseResponse(int code, String contentType, InputStream payload) throws HttpResponseException, IOException {
      if(code != 201){
          final String json = Helper.convertInputStreamToString(payload);
          throw new HttpResponseException(code, json);
      }
      final String json = Helper.convertInputStreamToString(payload);
      return new FulfillmentScriptInfo().createFromJson(json);
  }
  */

}
