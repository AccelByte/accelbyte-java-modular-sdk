/*
 * Copyright (c) 2024 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.platform.operations.campaign;

import java.io.*;
import java.util.*;
import lombok.Builder;
import lombok.Getter;
import lombok.Setter;
import net.accelbyte.sdk.api.platform.models.*;
import net.accelbyte.sdk.api.platform.operation_responses.campaign.GetCodeOpResponse;
import net.accelbyte.sdk.core.HttpResponseException;
import net.accelbyte.sdk.core.Operation;
import net.accelbyte.sdk.core.util.Helper;

/**
 * getCode
 *
 * <p>Get campaign code, it will check code whether available to redeem if redeemable true. Other
 * detail info:
 *
 * <p>* Returns : code info
 */
@Getter
@Setter
public class GetCode extends Operation {
  /** generated field's value */
  private String path = "/platform/admin/namespaces/{namespace}/codes/{code}";

  private String method = "GET";
  private List<String> consumes = Arrays.asList();
  private List<String> produces = Arrays.asList("application/json");
  private String locationQuery = null;

  /** fields as input parameter */
  private String code;

  private String namespace;
  private Boolean redeemable;
  private Boolean withBatchName;

  /**
   * @param code required
   * @param namespace required
   */
  @Builder
  // @deprecated 2022-08-29 - All args constructor may cause problems. Use builder instead.
  @Deprecated
  public GetCode(
      String customBasePath,
      String code,
      String namespace,
      Boolean redeemable,
      Boolean withBatchName) {
    this.code = code;
    this.namespace = namespace;
    this.redeemable = redeemable;
    this.withBatchName = withBatchName;
    super.customBasePath = customBasePath != null ? customBasePath : "";

    securities.add("Bearer");
  }

  @Override
  public Map<String, String> getPathParams() {
    Map<String, String> pathParams = new HashMap<>();
    if (this.code != null) {
      pathParams.put("code", this.code);
    }
    if (this.namespace != null) {
      pathParams.put("namespace", this.namespace);
    }
    return pathParams;
  }

  @Override
  public Map<String, List<String>> getQueryParams() {
    Map<String, List<String>> queryParams = new HashMap<>();
    queryParams.put(
        "redeemable",
        this.redeemable == null ? null : Arrays.asList(String.valueOf(this.redeemable)));
    queryParams.put(
        "withBatchName",
        this.withBatchName == null ? null : Arrays.asList(String.valueOf(this.withBatchName)));
    return queryParams;
  }

  @Override
  public boolean isValid() {
    if (this.code == null) {
      return false;
    }
    if (this.namespace == null) {
      return false;
    }
    return true;
  }

  public GetCodeOpResponse parseResponse(int code, String contentType, InputStream payload)
      throws HttpResponseException, IOException {
    final GetCodeOpResponse response = new GetCodeOpResponse();

    response.setHttpStatusCode(code);
    response.setContentType(contentType);

    if (code == 204) {
      response.setSuccess(true);
    } else if ((code == 200) || (code == 201)) {
      final String json = Helper.convertInputStreamToString(payload);
      response.setData(new CodeInfo().createFromJson(json));
      response.setSuccess(true);
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
  public CodeInfo parseResponse(int code, String contentType, InputStream payload) throws HttpResponseException, IOException {
      if(code != 200){
          final String json = Helper.convertInputStreamToString(payload);
          throw new HttpResponseException(code, json);
      }
      final String json = Helper.convertInputStreamToString(payload);
      return new CodeInfo().createFromJson(json);
  }
  */

  @Override
  protected Map<String, String> getCollectionFormatMap() {
    Map<String, String> result = new HashMap<>();
    result.put("redeemable", "None");
    result.put("withBatchName", "None");
    return result;
  }
}
