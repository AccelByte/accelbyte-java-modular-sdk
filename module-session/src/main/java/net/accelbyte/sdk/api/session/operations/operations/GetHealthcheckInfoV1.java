/*
 * Copyright (c) 2024 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.session.operations.operations;

import java.io.*;
import java.util.*;
import lombok.Builder;
import lombok.Getter;
import lombok.Setter;
import net.accelbyte.sdk.api.session.models.*;
import net.accelbyte.sdk.api.session.operation_responses.operations.GetHealthcheckInfoV1OpResponse;
import net.accelbyte.sdk.core.HttpResponseException;
import net.accelbyte.sdk.core.Operation;

/** GetHealthcheckInfoV1 */
@Getter
@Setter
public class GetHealthcheckInfoV1 extends Operation {
  /** generated field's value */
  private String path = "/session/healthz";

  private String method = "GET";
  private List<String> consumes = Arrays.asList();
  private List<String> produces = Arrays.asList("application/json");
  private String locationQuery = null;

  /** fields as input parameter */

  /** */
  @Builder
  // @deprecated 2022-08-29 - All args constructor may cause problems. Use builder instead.
  @Deprecated
  public GetHealthcheckInfoV1(String customBasePath) {
    super.customBasePath = customBasePath != null ? customBasePath : "";

    securities.add("Bearer");
  }

  @Override
  public boolean isValid() {
    return true;
  }

  public GetHealthcheckInfoV1OpResponse parseResponse(
      int code, String contentType, InputStream payload) throws HttpResponseException, IOException {
    final GetHealthcheckInfoV1OpResponse response = new GetHealthcheckInfoV1OpResponse();

    response.setHttpStatusCode(code);
    response.setContentType(contentType);

    if (code == 204) {
      response.setSuccess(true);
    } else if ((code == 200) || (code == 201) || (code == 202)) {
      response.setSuccess(true);
    }

    return response;
  }

  /*
  public void handleEmptyResponse(int code, String contentType, InputStream payload) throws HttpResponseException, IOException {
      if(code != 200){
          final String json = Helper.convertInputStreamToString(payload);
          throw new HttpResponseException(code, json);
      }
  }
  */

}
