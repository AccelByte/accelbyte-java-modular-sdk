/*
 * Copyright (c) 2024 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.ams.operations.watchdogs;

import java.io.*;
import java.util.*;
import lombok.Builder;
import lombok.Getter;
import lombok.Setter;
import net.accelbyte.sdk.api.ams.models.*;
import net.accelbyte.sdk.api.ams.operation_responses.watchdogs.LocalWatchdogConnectOpResponse;
import net.accelbyte.sdk.core.HttpResponseException;
import net.accelbyte.sdk.core.Operation;

/**
 * LocalWatchdogConnect
 *
 * <p>This is to support local ds development scenarios
 *
 * <p>Required Permission: NAMESPACE:{namespace}:AMS:LOCALDS [CREATE]
 */
@Getter
@Setter
public class LocalWatchdogConnect extends Operation {
  /** generated field's value */
  private String path = "/ams/v1/namespaces/{namespace}/local/{watchdogID}/connect";

  private String method = "GET";
  private List<String> consumes = Arrays.asList();
  private List<String> produces = Arrays.asList("application/json");
  private String locationQuery = null;

  /** fields as input parameter */
  private String namespace;

  private String watchdogID;

  /**
   * @param namespace required
   * @param watchdogID required
   */
  @Builder
  // @deprecated 2022-08-29 - All args constructor may cause problems. Use builder instead.
  @Deprecated
  public LocalWatchdogConnect(String customBasePath, String namespace, String watchdogID) {
    this.namespace = namespace;
    this.watchdogID = watchdogID;
    super.customBasePath = customBasePath != null ? customBasePath : "";

    securities.add("Bearer");
  }

  @Override
  public Map<String, String> getPathParams() {
    Map<String, String> pathParams = new HashMap<>();
    if (this.namespace != null) {
      pathParams.put("namespace", this.namespace);
    }
    if (this.watchdogID != null) {
      pathParams.put("watchdogID", this.watchdogID);
    }
    return pathParams;
  }

  @Override
  public boolean isValid() {
    if (this.namespace == null) {
      return false;
    }
    if (this.watchdogID == null) {
      return false;
    }
    return true;
  }

  public LocalWatchdogConnectOpResponse parseResponse(
      int code, String contentType, InputStream payload) throws HttpResponseException, IOException {
    final LocalWatchdogConnectOpResponse response = new LocalWatchdogConnectOpResponse();

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
