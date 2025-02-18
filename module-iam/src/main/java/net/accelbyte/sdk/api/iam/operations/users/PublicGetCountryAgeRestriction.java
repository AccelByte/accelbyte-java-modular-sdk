/*
 * Copyright (c) 2024 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.iam.operations.users;

import java.io.*;
import java.util.*;
import lombok.Builder;
import lombok.Getter;
import lombok.Setter;
import net.accelbyte.sdk.api.iam.models.*;
import net.accelbyte.sdk.api.iam.operation_responses.users.PublicGetCountryAgeRestrictionOpResponse;
import net.accelbyte.sdk.core.ApiError;
import net.accelbyte.sdk.core.HttpResponseException;
import net.accelbyte.sdk.core.Operation;
import net.accelbyte.sdk.core.util.Helper;

/**
 * PublicGetCountryAgeRestriction
 *
 * <p>## The endpoint is going to be deprecated **Endpoint migration guide** - **Substitute
 * endpoint: _/iam/v3/public/namespaces/{namespace}/agerestrictions/countries/{countryCode} [GET]_**
 *
 * @deprecated
 */
@Deprecated
@Getter
@Setter
public class PublicGetCountryAgeRestriction extends Operation {
  /** generated field's value */
  private String path =
      "/iam/v2/public/namespaces/{namespace}/countries/{countryCode}/agerestrictions";

  private String method = "GET";
  private List<String> consumes = Arrays.asList();
  private List<String> produces = Arrays.asList("application/json");
  private String locationQuery = null;

  /** fields as input parameter */
  private String countryCode;

  private String namespace;

  /**
   * @param countryCode required
   * @param namespace required
   */
  @Builder
  // @deprecated 2022-08-29 - All args constructor may cause problems. Use builder instead.
  @Deprecated
  public PublicGetCountryAgeRestriction(
      String customBasePath, String countryCode, String namespace) {
    this.countryCode = countryCode;
    this.namespace = namespace;
    super.customBasePath = customBasePath != null ? customBasePath : "";

    securities.add("Bearer");
  }

  @Override
  public Map<String, String> getPathParams() {
    Map<String, String> pathParams = new HashMap<>();
    if (this.countryCode != null) {
      pathParams.put("countryCode", this.countryCode);
    }
    if (this.namespace != null) {
      pathParams.put("namespace", this.namespace);
    }
    return pathParams;
  }

  @Override
  public boolean isValid() {
    if (this.countryCode == null) {
      return false;
    }
    if (this.namespace == null) {
      return false;
    }
    return true;
  }

  public PublicGetCountryAgeRestrictionOpResponse parseResponse(
      int code, String contentType, InputStream payload) throws HttpResponseException, IOException {
    final PublicGetCountryAgeRestrictionOpResponse response =
        new PublicGetCountryAgeRestrictionOpResponse();

    response.setHttpStatusCode(code);
    response.setContentType(contentType);

    if (code == 204) {
      response.setSuccess(true);
    } else if ((code == 200) || (code == 201)) {
      final String json = Helper.convertInputStreamToString(payload);
      response.setData(new AccountcommonCountry().createFromJson(json));
      response.setSuccess(true);
    } else if (code == 401) {
      final String json = Helper.convertInputStreamToString(payload);
      response.setError401(new RestErrorResponse().createFromJson(json));
      response.setError(response.getError401().translateToApiError());
    } else if (code == 404) {
      final String data = Helper.convertInputStreamToString(payload);
      response.setError404(data);
      response.setError(new ApiError("-1", data));
    }

    return response;
  }

  /*
  public AccountcommonCountry parseResponse(int code, String contentType, InputStream payload) throws HttpResponseException, IOException {
      if(code != 200){
          final String json = Helper.convertInputStreamToString(payload);
          throw new HttpResponseException(code, json);
      }
      final String json = Helper.convertInputStreamToString(payload);
      return new AccountcommonCountry().createFromJson(json);
  }
  */

}
