/*
 * Copyright (c) 2024 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.platform.operations.catalog_changes;

import java.io.*;
import java.util.*;
import lombok.Builder;
import lombok.Getter;
import lombok.Setter;
import net.accelbyte.sdk.api.platform.models.*;
import net.accelbyte.sdk.api.platform.operation_responses.catalog_changes.PublishSelectedOpResponse;
import net.accelbyte.sdk.core.HttpResponseException;
import net.accelbyte.sdk.core.Operation;
import net.accelbyte.sdk.core.util.Helper;

/**
 * publishSelected
 *
 * <p>This API is used to publish selected unpublished changes.
 *
 * <p>Other detail info:
 *
 * <p>* Returns : no content
 */
@Getter
@Setter
public class PublishSelected extends Operation {
  /** generated field's value */
  private String path =
      "/platform/admin/namespaces/{namespace}/stores/{storeId}/catalogChanges/publishSelected";

  private String method = "PUT";
  private List<String> consumes = Arrays.asList("application/json");
  private List<String> produces = Arrays.asList("application/json");
  private String locationQuery = null;

  /** fields as input parameter */
  private String namespace;

  private String storeId;

  /**
   * @param namespace required
   * @param storeId required
   */
  @Builder
  // @deprecated 2022-08-29 - All args constructor may cause problems. Use builder instead.
  @Deprecated
  public PublishSelected(String customBasePath, String namespace, String storeId) {
    this.namespace = namespace;
    this.storeId = storeId;
    super.customBasePath = customBasePath != null ? customBasePath : "";

    securities.add("Bearer");
  }

  @Override
  public Map<String, String> getPathParams() {
    Map<String, String> pathParams = new HashMap<>();
    if (this.namespace != null) {
      pathParams.put("namespace", this.namespace);
    }
    if (this.storeId != null) {
      pathParams.put("storeId", this.storeId);
    }
    return pathParams;
  }

  @Override
  public boolean isValid() {
    if (this.namespace == null) {
      return false;
    }
    if (this.storeId == null) {
      return false;
    }
    return true;
  }

  public PublishSelectedOpResponse parseResponse(int code, String contentType, InputStream payload)
      throws HttpResponseException, IOException {
    final PublishSelectedOpResponse response = new PublishSelectedOpResponse();

    response.setHttpStatusCode(code);
    response.setContentType(contentType);

    if (code == 204) {
      response.setSuccess(true);
    } else if ((code == 200) || (code == 201)) {
      final String json = Helper.convertInputStreamToString(payload);
      response.setData(new StoreInfo().createFromJson(json));
      response.setSuccess(true);
    } else if (code == 400) {
      final String json = Helper.convertInputStreamToString(payload);
      response.setError400(new ErrorEntity().createFromJson(json));
      response.setError(response.getError400().translateToApiError());
    } else if (code == 404) {
      final String json = Helper.convertInputStreamToString(payload);
      response.setError404(new ErrorEntity().createFromJson(json));
      response.setError(response.getError404().translateToApiError());
    } else if (code == 409) {
      final String json = Helper.convertInputStreamToString(payload);
      response.setError409(new ErrorEntity().createFromJson(json));
      response.setError(response.getError409().translateToApiError());
    }

    return response;
  }

  /*
  public StoreInfo parseResponse(int code, String contentType, InputStream payload) throws HttpResponseException, IOException {
      if(code != 200){
          final String json = Helper.convertInputStreamToString(payload);
          throw new HttpResponseException(code, json);
      }
      final String json = Helper.convertInputStreamToString(payload);
      return new StoreInfo().createFromJson(json);
  }
  */

}
