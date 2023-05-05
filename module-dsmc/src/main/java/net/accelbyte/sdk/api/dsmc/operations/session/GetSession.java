/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.dsmc.operations.session;

import java.io.*;
import java.util.*;
import lombok.Builder;
import lombok.Getter;
import lombok.Setter;
import net.accelbyte.sdk.api.dsmc.models.*;
import net.accelbyte.sdk.core.HttpResponseException;
import net.accelbyte.sdk.core.Operation;
import net.accelbyte.sdk.core.util.Helper;

/**
 * GetSession
 *
 * <p>Required permission: NAMESPACE:{namespace}:DSM:SESSION [READ]
 *
 * <p>Required scope: social
 *
 * <p>This endpoint is intended to be called by game session manager (matchmaker, lobby, etc.) to
 * query the status of dedicated server that is created for the session.
 *
 * <p>The server is ready to use when the status is READY. At which point, the game session manager
 * can claim the server using the GET /namespaces/{namespace}/sessions/{sessionID}/claim endpoint
 */
@Getter
@Setter
public class GetSession extends Operation {
  /** generated field's value */
  private String path = "/dsmcontroller/namespaces/{namespace}/sessions/{sessionID}";

  private String method = "GET";
  private List<String> consumes = Arrays.asList("application/json");
  private List<String> produces = Arrays.asList("application/json");
  private String locationQuery = null;
  /** fields as input parameter */
  private String namespace;

  private String sessionID;

  /**
   * @param namespace required
   * @param sessionID required
   */
  @Builder
  // deprecated(2022-08-29): All args constructor may cause problems. Use builder instead.
  @Deprecated
  public GetSession(String namespace, String sessionID) {
    this.namespace = namespace;
    this.sessionID = sessionID;

    securities.add("Bearer");
  }

  @Override
  public Map<String, String> getPathParams() {
    Map<String, String> pathParams = new HashMap<>();
    if (this.namespace != null) {
      pathParams.put("namespace", this.namespace);
    }
    if (this.sessionID != null) {
      pathParams.put("sessionID", this.sessionID);
    }
    return pathParams;
  }

  @Override
  public boolean isValid() {
    if (this.namespace == null) {
      return false;
    }
    if (this.sessionID == null) {
      return false;
    }
    return true;
  }

  public ModelsSessionResponse parseResponse(int code, String contentType, InputStream payload)
      throws HttpResponseException, IOException {
    if (code != 200) {
      final String json = Helper.convertInputStreamToString(payload);
      throw new HttpResponseException(code, json);
    }
    final String json = Helper.convertInputStreamToString(payload);
    return new ModelsSessionResponse().createFromJson(json);
  }
}
