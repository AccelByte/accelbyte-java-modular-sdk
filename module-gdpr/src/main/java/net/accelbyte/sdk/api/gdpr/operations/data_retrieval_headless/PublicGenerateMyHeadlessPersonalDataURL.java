/*
 * Copyright (c) 2024 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.gdpr.operations.data_retrieval_headless;

import java.io.*;
import java.util.*;
import lombok.Builder;
import lombok.Getter;
import lombok.Setter;
import net.accelbyte.sdk.api.gdpr.models.*;
import net.accelbyte.sdk.api.gdpr.operation_responses.data_retrieval_headless.PublicGenerateMyHeadlessPersonalDataURLOpResponse;
import net.accelbyte.sdk.core.HttpResponseException;
import net.accelbyte.sdk.core.Operation;
import net.accelbyte.sdk.core.util.Helper;

/**
 * PublicGenerateMyHeadlessPersonalDataURL
 *
 * <p>Generate a download url for a completed Personal Data Request for headless account scenario
 * (without a password). **Typically used by web portal** to invoke headless player GDPR using 3rd
 * platform web authentication. Requires a valid access token and a fresh **gdpr_token** cookie
 * (max-age 5 minutes). The gdpr_token is issued by the IAM service during 3rd platform web
 * authentication.
 *
 * <p>If a full account is available, use `POST
 * /gdpr/public/namespaces/{namespace}/users/{userId}/requests/{requestDate}/generate` instead.
 */
@Getter
@Setter
public class PublicGenerateMyHeadlessPersonalDataURL extends Operation {
  /** generated field's value */
  private String path = "/gdpr/public/users/me/headless/requests/{requestDate}/generate";

  private String method = "POST";
  private List<String> consumes = Arrays.asList("*/*");
  private List<String> produces = Arrays.asList("application/json");
  private String locationQuery = null;

  /** fields as input parameter */
  private String requestDate;

  /**
   * @param requestDate required
   */
  @Builder
  // @deprecated 2022-08-29 - All args constructor may cause problems. Use builder instead.
  @Deprecated
  public PublicGenerateMyHeadlessPersonalDataURL(String customBasePath, String requestDate) {
    this.requestDate = requestDate;
    super.customBasePath = customBasePath != null ? customBasePath : "";

    securities.add("Bearer");
  }

  @Override
  public Map<String, String> getPathParams() {
    Map<String, String> pathParams = new HashMap<>();
    if (this.requestDate != null) {
      pathParams.put("requestDate", this.requestDate);
    }
    return pathParams;
  }

  @Override
  public boolean isValid() {
    if (this.requestDate == null) {
      return false;
    }
    return true;
  }

  public PublicGenerateMyHeadlessPersonalDataURLOpResponse parseResponse(
      int code, String contentType, InputStream payload) throws HttpResponseException, IOException {
    final PublicGenerateMyHeadlessPersonalDataURLOpResponse response =
        new PublicGenerateMyHeadlessPersonalDataURLOpResponse();

    response.setHttpStatusCode(code);
    response.setContentType(contentType);

    if (code == 204) {
      response.setSuccess(true);
    } else if ((code == 200) || (code == 201)) {
      final String json = Helper.convertInputStreamToString(payload);
      response.setData(new ModelsUserDataURL().createFromJson(json));
      response.setSuccess(true);
    } else if (code == 400) {
      final String json = Helper.convertInputStreamToString(payload);
      response.setError400(new ResponseError().createFromJson(json));
      response.setError(response.getError400().translateToApiError());
    } else if (code == 401) {
      final String json = Helper.convertInputStreamToString(payload);
      response.setError401(new ResponseError().createFromJson(json));
      response.setError(response.getError401().translateToApiError());
    } else if (code == 403) {
      final String json = Helper.convertInputStreamToString(payload);
      response.setError403(new ResponseError().createFromJson(json));
      response.setError(response.getError403().translateToApiError());
    } else if (code == 404) {
      final String json = Helper.convertInputStreamToString(payload);
      response.setError404(new ResponseError().createFromJson(json));
      response.setError(response.getError404().translateToApiError());
    } else if (code == 429) {
      final String json = Helper.convertInputStreamToString(payload);
      response.setError429(new ResponseError().createFromJson(json));
      response.setError(response.getError429().translateToApiError());
    } else if (code == 500) {
      final String json = Helper.convertInputStreamToString(payload);
      response.setError500(new ResponseError().createFromJson(json));
      response.setError(response.getError500().translateToApiError());
    }

    return response;
  }

  /*
  public ModelsUserDataURL parseResponse(int code, String contentType, InputStream payload) throws HttpResponseException, IOException {
      if(code != 200){
          final String json = Helper.convertInputStreamToString(payload);
          throw new HttpResponseException(code, json);
      }
      final String json = Helper.convertInputStreamToString(payload);
      return new ModelsUserDataURL().createFromJson(json);
  }
  */

}
