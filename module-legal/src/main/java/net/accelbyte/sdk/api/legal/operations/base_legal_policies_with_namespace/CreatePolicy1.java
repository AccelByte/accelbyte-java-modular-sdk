/*
 * Copyright (c) 2024 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.legal.operations.base_legal_policies_with_namespace;

import java.io.*;
import java.util.*;
import lombok.Builder;
import lombok.Getter;
import lombok.Setter;
import net.accelbyte.sdk.api.legal.models.*;
import net.accelbyte.sdk.api.legal.operation_responses.base_legal_policies_with_namespace.CreatePolicy1OpResponse;
import net.accelbyte.sdk.core.HttpResponseException;
import net.accelbyte.sdk.core.Operation;
import net.accelbyte.sdk.core.util.Helper;

/**
 * createPolicy_1
 *
 * <p>Create a legal policy. Note:
 *
 * <p>* countryType field only accept COUNTRY or COUNTRY_GROUP. * COUNTRY_GROUP countryType requires
 * the countryGroupName and affectedCountries fields to be provided.
 *
 * <p>* policy with COUNTRY_GROUP type include multiple countries and apply the same policy across
 * the entire list of countries
 */
@Getter
@Setter
public class CreatePolicy1 extends Operation {
  /** generated field's value */
  private String path = "/agreement/admin/namespaces/{namespace}/base-policies";

  private String method = "POST";
  private List<String> consumes = Arrays.asList("application/json");
  private List<String> produces = Arrays.asList("application/json");
  private String locationQuery = null;

  /** fields as input parameter */
  private String namespace;

  private CreateBasePolicyRequestV2 body;

  /**
   * @param namespace required
   */
  @Builder
  // @deprecated 2022-08-29 - All args constructor may cause problems. Use builder instead.
  @Deprecated
  public CreatePolicy1(String customBasePath, String namespace, CreateBasePolicyRequestV2 body) {
    this.namespace = namespace;
    this.body = body;
    super.customBasePath = customBasePath != null ? customBasePath : "";

    securities.add("Bearer");
  }

  @Override
  public Map<String, String> getPathParams() {
    Map<String, String> pathParams = new HashMap<>();
    if (this.namespace != null) {
      pathParams.put("namespace", this.namespace);
    }
    return pathParams;
  }

  @Override
  public CreateBasePolicyRequestV2 getBodyParams() {
    return this.body;
  }

  @Override
  public boolean isValid() {
    if (this.namespace == null) {
      return false;
    }
    return true;
  }

  public CreatePolicy1OpResponse parseResponse(int code, String contentType, InputStream payload)
      throws HttpResponseException, IOException {
    final CreatePolicy1OpResponse response = new CreatePolicy1OpResponse();

    response.setHttpStatusCode(code);
    response.setContentType(contentType);

    if (code == 204) {
      response.setSuccess(true);
    } else if ((code == 200) || (code == 201)) {
      final String json = Helper.convertInputStreamToString(payload);
      response.setData(new CreateBasePolicyResponse().createFromJson(json));
      response.setSuccess(true);
    } else if (code == 400) {
      final String json = Helper.convertInputStreamToString(payload);
      response.setError400(new ErrorEntity().createFromJson(json));
      response.setError(response.getError400().translateToApiError());
    } else if (code == 409) {
      final String json = Helper.convertInputStreamToString(payload);
      response.setError409(new ErrorEntity().createFromJson(json));
      response.setError(response.getError409().translateToApiError());
    } else if (code == 422) {
      final String json = Helper.convertInputStreamToString(payload);
      response.setError422(new ValidationErrorEntity().createFromJson(json));
      response.setError(response.getError422().translateToApiError());
    }

    return response;
  }

  /*
  public CreateBasePolicyResponse parseResponse(int code, String contentType, InputStream payload) throws HttpResponseException, IOException {
      if(code != 201){
          final String json = Helper.convertInputStreamToString(payload);
          throw new HttpResponseException(code, json);
      }
      final String json = Helper.convertInputStreamToString(payload);
      return new CreateBasePolicyResponse().createFromJson(json);
  }
  */

}
