/*
 * Copyright (c) 2024 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.legal.operations.base_legal_policies;

import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import java.io.*;
import java.util.*;
import lombok.Builder;
import lombok.Getter;
import lombok.Setter;
import net.accelbyte.sdk.api.legal.models.*;
import net.accelbyte.sdk.api.legal.operation_responses.base_legal_policies.RetrieveAllLegalPoliciesOpResponse;
import net.accelbyte.sdk.core.HttpResponseException;
import net.accelbyte.sdk.core.Operation;
import net.accelbyte.sdk.core.util.Helper;

/**
 * retrieveAllLegalPolicies
 *
 * <p>Retrieve all base policies.
 */
@Getter
@Setter
public class RetrieveAllLegalPolicies extends Operation {
  /** generated field's value */
  private String path = "/agreement/admin/base-policies";

  private String method = "GET";
  private List<String> consumes = Arrays.asList();
  private List<String> produces = Arrays.asList("application/json");
  private String locationQuery = null;

  /** fields as input parameter */
  private Boolean visibleOnly;

  /** */
  @Builder
  // @deprecated 2022-08-29 - All args constructor may cause problems. Use builder instead.
  @Deprecated
  public RetrieveAllLegalPolicies(String customBasePath, Boolean visibleOnly) {
    this.visibleOnly = visibleOnly;
    super.customBasePath = customBasePath != null ? customBasePath : "";

    securities.add("Bearer");
  }

  @Override
  public Map<String, List<String>> getQueryParams() {
    Map<String, List<String>> queryParams = new HashMap<>();
    queryParams.put(
        "visibleOnly",
        this.visibleOnly == null ? null : Arrays.asList(String.valueOf(this.visibleOnly)));
    return queryParams;
  }

  @Override
  public boolean isValid() {
    return true;
  }

  public RetrieveAllLegalPoliciesOpResponse parseResponse(
      int code, String contentType, InputStream payload) throws HttpResponseException, IOException {
    final RetrieveAllLegalPoliciesOpResponse response = new RetrieveAllLegalPoliciesOpResponse();

    response.setHttpStatusCode(code);
    response.setContentType(contentType);

    if (code == 204) {
      response.setSuccess(true);
    } else if ((code == 200) || (code == 201)) {
      final String json = Helper.convertInputStreamToString(payload);

      response.setSuccess(true);
      response.setData(
          new ObjectMapper()
              .readValue(json, new TypeReference<List<RetrieveBasePolicyResponse>>() {}));
    }

    return response;
  }

  /*
  public List<RetrieveBasePolicyResponse> parseResponse(int code, String contentType, InputStream payload) throws HttpResponseException, IOException {
      if(code != 200){
          final String json = Helper.convertInputStreamToString(payload);
          throw new HttpResponseException(code, json);
      }
      final String json = Helper.convertInputStreamToString(payload);
      return new ObjectMapper().readValue(json, new TypeReference<List<RetrieveBasePolicyResponse>>() {});
  }
  */

  @Override
  protected Map<String, String> getCollectionFormatMap() {
    Map<String, String> result = new HashMap<>();
    result.put("visibleOnly", "None");
    return result;
  }
}
