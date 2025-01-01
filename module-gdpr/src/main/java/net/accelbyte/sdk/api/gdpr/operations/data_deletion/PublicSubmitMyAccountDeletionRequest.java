/*
 * Copyright (c) 2024 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.gdpr.operations.data_deletion;

import java.io.*;
import java.util.*;
import lombok.Builder;
import lombok.Getter;
import lombok.Setter;
import net.accelbyte.sdk.api.gdpr.models.*;
import net.accelbyte.sdk.api.gdpr.operation_responses.data_deletion.PublicSubmitMyAccountDeletionRequestOpResponse;
import net.accelbyte.sdk.core.HttpResponseException;
import net.accelbyte.sdk.core.Operation;
import net.accelbyte.sdk.core.util.Helper;

/**
 * PublicSubmitMyAccountDeletionRequest
 *
 * <p>Submit my account deletion requests. Requires valid user access token This is for in-game only
 * and require a valid platformId and platform token. If a full account is not logged by 3rd
 * platform, then please use
 * [/gdpr/public/namespaces/{namespace}/users/{userId}/deletions](#operations-Data_Deletion-PublicSubmitUserAccountDeletionRequest)
 *
 * <p>### Request Header: - **Content-Type: application/x-www-form-urlencoded**
 */
@Getter
@Setter
public class PublicSubmitMyAccountDeletionRequest extends Operation {
  /** generated field's value */
  private String path = "/gdpr/public/users/me/deletions";

  private String method = "POST";
  private List<String> consumes = Arrays.asList("application/x-www-form-urlencoded");
  private List<String> produces = Arrays.asList("application/json");
  private String locationQuery = null;

  /** fields as input parameter */
  private String platformId;

  private String platformToken;

  /**
   * @param platformId required
   * @param platformToken required
   */
  @Builder
  // @deprecated 2022-08-29 - All args constructor may cause problems. Use builder instead.
  @Deprecated
  public PublicSubmitMyAccountDeletionRequest(
      String customBasePath, String platformId, String platformToken) {
    this.platformId = platformId;
    this.platformToken = platformToken;
    super.customBasePath = customBasePath != null ? customBasePath : "";

    securities.add("Bearer");
  }

  @Override
  public Map<String, Object> getFormParams() {
    Map<String, Object> formDataParams = new HashMap<>();
    if (this.platformId != null) {
      formDataParams.put("platformId", this.platformId);
    }
    if (this.platformToken != null) {
      formDataParams.put("platformToken", this.platformToken);
    }
    return formDataParams;
  }

  @Override
  public boolean isValid() {
    if (this.platformId == null) {
      return false;
    }
    if (this.platformToken == null) {
      return false;
    }
    return true;
  }

  public PublicSubmitMyAccountDeletionRequestOpResponse parseResponse(
      int code, String contentType, InputStream payload) throws HttpResponseException, IOException {
    final PublicSubmitMyAccountDeletionRequestOpResponse response =
        new PublicSubmitMyAccountDeletionRequestOpResponse();

    response.setHttpStatusCode(code);
    response.setContentType(contentType);

    if (code == 204) {
      response.setSuccess(true);
    } else if ((code == 200) || (code == 201)) {
      final String json = Helper.convertInputStreamToString(payload);
      response.setData(new ModelsRequestDeleteResponse().createFromJson(json));
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
    } else if (code == 409) {
      final String json = Helper.convertInputStreamToString(payload);
      response.setError409(new ResponseError().createFromJson(json));
      response.setError(response.getError409().translateToApiError());
    } else if (code == 500) {
      final String json = Helper.convertInputStreamToString(payload);
      response.setError500(new ResponseError().createFromJson(json));
      response.setError(response.getError500().translateToApiError());
    }

    return response;
  }

  /*
  public ModelsRequestDeleteResponse parseResponse(int code, String contentType, InputStream payload) throws HttpResponseException, IOException {
      if(code != 201){
          final String json = Helper.convertInputStreamToString(payload);
          throw new HttpResponseException(code, json);
      }
      final String json = Helper.convertInputStreamToString(payload);
      return new ModelsRequestDeleteResponse().createFromJson(json);
  }
  */

}
