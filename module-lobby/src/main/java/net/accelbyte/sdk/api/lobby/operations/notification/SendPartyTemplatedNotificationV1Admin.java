/*
 * Copyright (c) 2024 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.lobby.operations.notification;

import java.io.*;
import java.util.*;
import lombok.Builder;
import lombok.Getter;
import lombok.Setter;
import net.accelbyte.sdk.api.lobby.models.*;
import net.accelbyte.sdk.api.lobby.operation_responses.notification.SendPartyTemplatedNotificationV1AdminOpResponse;
import net.accelbyte.sdk.core.HttpResponseException;
import net.accelbyte.sdk.core.Operation;
import net.accelbyte.sdk.core.util.Helper;

/**
 * sendPartyTemplatedNotificationV1Admin
 *
 * <p>Sends templated notification to a party.
 *
 * <p>In the request body, specify which template slug (template identifier) to use and the template
 * language.
 *
 * <p>NotificationTemplate context is the key-value pair defining the value of each handlebar
 * specified in the template content. Template need to be published before it can be use to send
 * notifications
 *
 * @deprecated
 */
@Deprecated
@Getter
@Setter
public class SendPartyTemplatedNotificationV1Admin extends Operation {
  /** generated field's value */
  private String path =
      "/lobby/v1/admin/notification/namespaces/{namespace}/parties/{partyId}/templates/notify";

  private String method = "POST";
  private List<String> consumes = Arrays.asList("application/json");
  private List<String> produces = Arrays.asList("application/json");
  private String locationQuery = null;

  /** fields as input parameter */
  private String namespace;

  private String partyId;
  private ModelNotificationWithTemplateRequestV1 body;

  /**
   * @param namespace required
   * @param partyId required
   * @param body required
   */
  @Builder
  // @deprecated 2022-08-29 - All args constructor may cause problems. Use builder instead.
  @Deprecated
  public SendPartyTemplatedNotificationV1Admin(
      String customBasePath,
      String namespace,
      String partyId,
      ModelNotificationWithTemplateRequestV1 body) {
    this.namespace = namespace;
    this.partyId = partyId;
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
    if (this.partyId != null) {
      pathParams.put("partyId", this.partyId);
    }
    return pathParams;
  }

  @Override
  public ModelNotificationWithTemplateRequestV1 getBodyParams() {
    return this.body;
  }

  @Override
  public boolean isValid() {
    if (this.namespace == null) {
      return false;
    }
    if (this.partyId == null) {
      return false;
    }
    if (this.body == null) {
      return false;
    }
    return true;
  }

  public SendPartyTemplatedNotificationV1AdminOpResponse parseResponse(
      int code, String contentType, InputStream payload) throws HttpResponseException, IOException {
    final SendPartyTemplatedNotificationV1AdminOpResponse response =
        new SendPartyTemplatedNotificationV1AdminOpResponse();

    response.setHttpStatusCode(code);
    response.setContentType(contentType);

    if (code == 204) {
      response.setSuccess(true);
    } else if (code == 400) {
      final String json = Helper.convertInputStreamToString(payload);
      response.setError400(new RestapiErrorResponseV1().createFromJson(json));
      response.setError(response.getError400().translateToApiError());
    } else if (code == 401) {
      final String json = Helper.convertInputStreamToString(payload);
      response.setError401(new RestapiErrorResponseV1().createFromJson(json));
      response.setError(response.getError401().translateToApiError());
    } else if (code == 403) {
      final String json = Helper.convertInputStreamToString(payload);
      response.setError403(new RestapiErrorResponseV1().createFromJson(json));
      response.setError(response.getError403().translateToApiError());
    } else if (code == 404) {
      final String json = Helper.convertInputStreamToString(payload);
      response.setError404(new RestapiErrorResponseV1().createFromJson(json));
      response.setError(response.getError404().translateToApiError());
    }

    return response;
  }

  /*
  public void handleEmptyResponse(int code, String contentType, InputStream payload) throws HttpResponseException, IOException {
      if(code != 204){
          final String json = Helper.convertInputStreamToString(payload);
          throw new HttpResponseException(code, json);
      }
  }
  */

}
