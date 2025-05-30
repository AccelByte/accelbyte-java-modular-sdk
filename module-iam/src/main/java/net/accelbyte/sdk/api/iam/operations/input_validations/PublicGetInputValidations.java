/*
 * Copyright (c) 2024 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.iam.operations.input_validations;

import java.io.*;
import java.util.*;
import lombok.Builder;
import lombok.Getter;
import lombok.Setter;
import net.accelbyte.sdk.api.iam.models.*;
import net.accelbyte.sdk.api.iam.operation_responses.input_validations.PublicGetInputValidationsOpResponse;
import net.accelbyte.sdk.core.ApiError;
import net.accelbyte.sdk.core.HttpResponseException;
import net.accelbyte.sdk.core.Operation;
import net.accelbyte.sdk.core.util.Helper;

/**
 * PublicGetInputValidations
 *
 * <p>No role required This endpoint is to get list of input validation configuration. `regex`
 * parameter will be returned if `isCustomRegex` is true. Otherwise, it will be empty.
 */
@Getter
@Setter
public class PublicGetInputValidations extends Operation {
  /** generated field's value */
  private String path = "/iam/v3/public/inputValidations";

  private String method = "GET";
  private List<String> consumes = Arrays.asList("application/json");
  private List<String> produces = Arrays.asList("application/json");
  private String locationQuery = null;

  /** fields as input parameter */
  private Boolean defaultOnEmpty;

  private String languageCode;

  /** */
  @Builder
  // @deprecated 2022-08-29 - All args constructor may cause problems. Use builder instead.
  @Deprecated
  public PublicGetInputValidations(
      String customBasePath, Boolean defaultOnEmpty, String languageCode) {
    this.defaultOnEmpty = defaultOnEmpty;
    this.languageCode = languageCode;
    super.customBasePath = customBasePath != null ? customBasePath : "";
  }

  @Override
  public Map<String, List<String>> getQueryParams() {
    Map<String, List<String>> queryParams = new HashMap<>();
    queryParams.put(
        "defaultOnEmpty",
        this.defaultOnEmpty == null ? null : Arrays.asList(String.valueOf(this.defaultOnEmpty)));
    queryParams.put(
        "languageCode", this.languageCode == null ? null : Arrays.asList(this.languageCode));
    return queryParams;
  }

  @Override
  public boolean isValid() {
    return true;
  }

  public PublicGetInputValidationsOpResponse parseResponse(
      int code, String contentType, InputStream payload) throws HttpResponseException, IOException {
    final PublicGetInputValidationsOpResponse response = new PublicGetInputValidationsOpResponse();

    response.setHttpStatusCode(code);
    response.setContentType(contentType);

    if (code == 204) {
      response.setSuccess(true);
    } else if ((code == 200) || (code == 201)) {
      final String json = Helper.convertInputStreamToString(payload);
      response.setData(new ModelInputValidationsPublicResponse().createFromJson(json));
      response.setSuccess(true);
    } else if (code == 404) {
      final String data = Helper.convertInputStreamToString(payload);
      response.setError404(data);
      response.setError(new ApiError("-1", data));
    } else if (code == 500) {
      final String json = Helper.convertInputStreamToString(payload);
      response.setError500(new RestErrorResponse().createFromJson(json));
      response.setError(response.getError500().translateToApiError());
    }

    return response;
  }

  /*
  public ModelInputValidationsPublicResponse parseResponse(int code, String contentType, InputStream payload) throws HttpResponseException, IOException {
      if(code != 200){
          final String json = Helper.convertInputStreamToString(payload);
          throw new HttpResponseException(code, json);
      }
      final String json = Helper.convertInputStreamToString(payload);
      return new ModelInputValidationsPublicResponse().createFromJson(json);
  }
  */

  @Override
  protected Map<String, String> getCollectionFormatMap() {
    Map<String, String> result = new HashMap<>();
    result.put("defaultOnEmpty", "None");
    result.put("languageCode", "None");
    return result;
  }
}
