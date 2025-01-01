/*
 * Copyright (c) 2024 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.legal.operations.policies;

import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import java.io.*;
import java.util.*;
import lombok.Builder;
import lombok.Getter;
import lombok.Setter;
import net.accelbyte.sdk.api.legal.models.*;
import net.accelbyte.sdk.api.legal.operation_responses.policies.RetrieveCountryListWithPoliciesOpResponse;
import net.accelbyte.sdk.core.HttpResponseException;
import net.accelbyte.sdk.core.Operation;
import net.accelbyte.sdk.core.util.Helper;

/**
 * retrieveCountryListWithPolicies
 *
 * <p>Retrieve List of Countries that have Active and Visible Legal Policies.
 */
@Getter
@Setter
public class RetrieveCountryListWithPolicies extends Operation {
  /** generated field's value */
  private String path = "/agreement/public/policies/countries/list";

  private String method = "GET";
  private List<String> consumes = Arrays.asList();
  private List<String> produces = Arrays.asList("application/json");
  private String locationQuery = null;

  /** fields as input parameter */

  /** */
  @Builder
  // @deprecated 2022-08-29 - All args constructor may cause problems. Use builder instead.
  @Deprecated
  public RetrieveCountryListWithPolicies(String customBasePath) {
    super.customBasePath = customBasePath != null ? customBasePath : "";
  }

  @Override
  public boolean isValid() {
    return true;
  }

  public RetrieveCountryListWithPoliciesOpResponse parseResponse(
      int code, String contentType, InputStream payload) throws HttpResponseException, IOException {
    final RetrieveCountryListWithPoliciesOpResponse response =
        new RetrieveCountryListWithPoliciesOpResponse();

    response.setHttpStatusCode(code);
    response.setContentType(contentType);

    if (code == 204) {
      response.setSuccess(true);
    } else if ((code == 200) || (code == 201)) {
      final String json = Helper.convertInputStreamToString(payload);

      response.setSuccess(true);
      response.setData(new ObjectMapper().readValue(json, new TypeReference<List<String>>() {}));
    }

    return response;
  }

  /*
  public List<String> parseResponse(int code, String contentType, InputStream payload) throws HttpResponseException, IOException {
      if(code != 200){
          final String json = Helper.convertInputStreamToString(payload);
          throw new HttpResponseException(code, json);
      }
      final String json = Helper.convertInputStreamToString(payload);
      return new ObjectMapper().readValue(json, new TypeReference<List<String>>() {});
  }
  */

}
