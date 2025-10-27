/*
 * Copyright (c) 2024 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.legal.operations.localized_policy_versions;

import java.io.*;
import java.util.*;
import lombok.Builder;
import lombok.Getter;
import lombok.Setter;
import net.accelbyte.sdk.api.legal.models.*;
import net.accelbyte.sdk.api.legal.operation_responses.localized_policy_versions.OldPublicRetrieveSingleLocalizedPolicyVersionOpResponse;
import net.accelbyte.sdk.core.HttpResponseException;
import net.accelbyte.sdk.core.Operation;
import net.accelbyte.sdk.core.util.Helper;

/**
 * oldPublicRetrieveSingleLocalizedPolicyVersion
 *
 * <p>Retrieve specific localized policy version including the policy version and base policy
 * version where the localized policy version located. Other detail info:
 */
@Getter
@Setter
public class OldPublicRetrieveSingleLocalizedPolicyVersion extends Operation {
  /** generated field's value */
  private String path = "/agreement/public/localized-policy-versions/{localizedPolicyVersionId}";

  private String method = "GET";
  private List<String> consumes = Arrays.asList();
  private List<String> produces = Arrays.asList("application/json");
  private String locationQuery = null;

  /** fields as input parameter */
  private String localizedPolicyVersionId;

  /**
   * @param localizedPolicyVersionId required
   */
  @Builder
  // @deprecated 2022-08-29 - All args constructor may cause problems. Use builder instead.
  @Deprecated
  public OldPublicRetrieveSingleLocalizedPolicyVersion(
      String customBasePath, String localizedPolicyVersionId) {
    this.localizedPolicyVersionId = localizedPolicyVersionId;
    super.customBasePath = customBasePath != null ? customBasePath : "";
  }

  @Override
  public Map<String, String> getPathParams() {
    Map<String, String> pathParams = new HashMap<>();
    if (this.localizedPolicyVersionId != null) {
      pathParams.put("localizedPolicyVersionId", this.localizedPolicyVersionId);
    }
    return pathParams;
  }

  @Override
  public boolean isValid() {
    if (this.localizedPolicyVersionId == null) {
      return false;
    }
    return true;
  }

  public OldPublicRetrieveSingleLocalizedPolicyVersionOpResponse parseResponse(
      int code, String contentType, InputStream payload) throws HttpResponseException, IOException {
    final OldPublicRetrieveSingleLocalizedPolicyVersionOpResponse response =
        new OldPublicRetrieveSingleLocalizedPolicyVersionOpResponse();

    response.setHttpStatusCode(code);
    response.setContentType(contentType);

    if (code == 204) {
      response.setSuccess(true);
    } else if ((code == 200) || (code == 201)) {
      final String json = Helper.convertInputStreamToString(payload);
      response.setData(new RetrieveLocalizedPolicyVersionPublicResponse().createFromJson(json));
      response.setSuccess(true);
    } else if (code == 403) {
      final String json = Helper.convertInputStreamToString(payload);
      response.setError403(new ErrorEntity().createFromJson(json));
      response.setError(response.getError403().translateToApiError());
    } else if (code == 404) {
      final String json = Helper.convertInputStreamToString(payload);
      response.setError404(new ErrorEntity().createFromJson(json));
      response.setError(response.getError404().translateToApiError());
    }

    return response;
  }

  /*
  public RetrieveLocalizedPolicyVersionPublicResponse parseResponse(int code, String contentType, InputStream payload) throws HttpResponseException, IOException {
      if(code != 200){
          final String json = Helper.convertInputStreamToString(payload);
          throw new HttpResponseException(code, json);
      }
      final String json = Helper.convertInputStreamToString(payload);
      return new RetrieveLocalizedPolicyVersionPublicResponse().createFromJson(json);
  }
  */

}
