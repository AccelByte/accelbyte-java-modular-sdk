/*
 * Copyright (c) 2024 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.lobby.operations.config;

import java.io.*;
import java.util.*;
import lombok.Builder;
import lombok.Getter;
import lombok.Setter;
import net.accelbyte.sdk.api.lobby.models.*;
import net.accelbyte.sdk.api.lobby.operation_responses.config.AdminExportConfigV1OpResponse;
import net.accelbyte.sdk.core.HttpResponseException;
import net.accelbyte.sdk.core.Operation;
import net.accelbyte.sdk.core.util.Helper;

/**
 * adminExportConfigV1
 *
 * <p>Export lobby configuration to a json file. The file can then be imported from the /import
 * endpoint.
 *
 * <p>JSON Schema of the exported file: { "required": [ "namespace", "entitlementItemID",
 * "chatRateLimitDuration", "unregisterDelay", "generalRateLimitDuration",
 * "autoKickOnDisconnectDelay", "chatRateLimitBurst", "generalRateLimitBurst", "maxPartyMember",
 * "autoKickOnDisconnect", "profanityFilter", "enableChat", "entitlementCheck",
 * "cancelTicketOnDisconnect", "concurrentUsersLimit", "readyConsentTimeout",
 * "disableInvitationOnJoinParty", "allowJoinPartyDuringMatchmaking", "allowInviteNonConnectedUser",
 * "keepPresenceActivityOnDisconnect", "maxDSWaitTime", "maxFriendsLimit", "requestMetadataMaxSize"
 * ], "properties": { "allowInviteNonConnectedUser": { "type": "boolean" },
 * "allowJoinPartyDuringMatchmaking": { "type": "boolean" }, "autoKickOnDisconnect": { "type":
 * "boolean" }, "autoKickOnDisconnectDelay": { "type": "integer", "format": "int64" },
 * "cancelTicketOnDisconnect": { "type": "boolean" }, "chatRateLimitBurst": { "type": "integer",
 * "format": "int32" }, "chatRateLimitDuration": { "type": "integer", "format": "int64" },
 * "concurrentUsersLimit": { "type": "integer", "format": "int32" }, "disableInvitationOnJoinParty":
 * { "type": "boolean" }, "enableChat": { "type": "boolean" }, "entitlementCheck": { "type":
 * "boolean" }, "entitlementItemID": { "type": "string" }, "generalRateLimitBurst": { "type":
 * "integer", "format": "int32" }, "generalRateLimitDuration": { "type": "integer", "format":
 * "int64" }, "keepPresenceActivityOnDisconnect": { "type": "boolean" }, "maxDSWaitTime": { "type":
 * "integer", "format": "int64" }, "maxFriendsLimit": { "type": "integer", "format": "int32" },
 * "maxPartyMember": { "type": "integer", "format": "int32" }, "namespace": { "type": "string" },
 * "profanityFilter": { "type": "boolean" }, "readyConsentTimeout": { "type": "integer", "format":
 * "int64" }, "requestMetadataMaxSize": { "type": "integer", "format": "int32" }, "unregisterDelay":
 * { "type": "integer", "format": "int64" } } }
 */
@Getter
@Setter
public class AdminExportConfigV1 extends Operation {
  /** generated field's value */
  private String path = "/lobby/v1/admin/config/namespaces/{namespace}/export";

  private String method = "GET";
  private List<String> consumes = Arrays.asList();
  private List<String> produces = Arrays.asList("application/json");
  private String locationQuery = null;

  /** fields as input parameter */
  private String namespace;

  /**
   * @param namespace required
   */
  @Builder
  // @deprecated 2022-08-29 - All args constructor may cause problems. Use builder instead.
  @Deprecated
  public AdminExportConfigV1(String customBasePath, String namespace) {
    this.namespace = namespace;
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
  public boolean isValid() {
    if (this.namespace == null) {
      return false;
    }
    return true;
  }

  public AdminExportConfigV1OpResponse parseResponse(
      int code, String contentType, InputStream payload) throws HttpResponseException, IOException {
    final AdminExportConfigV1OpResponse response = new AdminExportConfigV1OpResponse();

    response.setHttpStatusCode(code);
    response.setContentType(contentType);

    if (code == 204) {
      response.setSuccess(true);
    } else if ((code == 200) || (code == 201)) {
      response.setSuccess(true);
      response.setData(payload);
    } else if (code == 401) {
      final String json = Helper.convertInputStreamToString(payload);
      response.setError401(new ResponseError().createFromJson(json));
      response.setError(response.getError401().translateToApiError());
    } else if (code == 403) {
      final String json = Helper.convertInputStreamToString(payload);
      response.setError403(new ResponseError().createFromJson(json));
      response.setError(response.getError403().translateToApiError());
    } else if (code == 500) {
      final String json = Helper.convertInputStreamToString(payload);
      response.setError500(new ResponseError().createFromJson(json));
      response.setError(response.getError500().translateToApiError());
    }

    return response;
  }

  /*
  public InputStream parseResponse(int code, String contentType, InputStream payload) throws HttpResponseException, IOException {
      if(code != 200){
          final String json = Helper.convertInputStreamToString(payload);
          throw new HttpResponseException(code, json);
      }
      return payload;
  }
  */

}
