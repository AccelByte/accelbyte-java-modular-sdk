/*
 * Copyright (c) 2024 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.chat.operations.topic;

import java.io.*;
import java.util.*;
import lombok.Builder;
import lombok.Getter;
import lombok.Setter;
import net.accelbyte.sdk.api.chat.models.*;
import net.accelbyte.sdk.api.chat.operation_responses.topic.PublicDeleteChatOpResponse;
import net.accelbyte.sdk.core.HttpResponseException;
import net.accelbyte.sdk.core.Operation;
import net.accelbyte.sdk.core.util.Helper;

/**
 * publicDeleteChat
 *
 * <p>Delete chat.
 */
@Getter
@Setter
public class PublicDeleteChat extends Operation {
  /** generated field's value */
  private String path = "/chat/public/namespaces/{namespace}/topic/{topic}/chats/{chatId}";

  private String method = "DELETE";
  private List<String> consumes = Arrays.asList("application/json");
  private List<String> produces = Arrays.asList("application/json");
  private String locationQuery = null;

  /** fields as input parameter */
  private String chatId;

  private String namespace;
  private String topic;

  /**
   * @param chatId required
   * @param namespace required
   * @param topic required
   */
  @Builder
  // @deprecated 2022-08-29 - All args constructor may cause problems. Use builder instead.
  @Deprecated
  public PublicDeleteChat(String customBasePath, String chatId, String namespace, String topic) {
    this.chatId = chatId;
    this.namespace = namespace;
    this.topic = topic;
    super.customBasePath = customBasePath != null ? customBasePath : "";

    securities.add("Bearer");
  }

  @Override
  public Map<String, String> getPathParams() {
    Map<String, String> pathParams = new HashMap<>();
    if (this.chatId != null) {
      pathParams.put("chatId", this.chatId);
    }
    if (this.namespace != null) {
      pathParams.put("namespace", this.namespace);
    }
    if (this.topic != null) {
      pathParams.put("topic", this.topic);
    }
    return pathParams;
  }

  @Override
  public boolean isValid() {
    if (this.chatId == null) {
      return false;
    }
    if (this.namespace == null) {
      return false;
    }
    if (this.topic == null) {
      return false;
    }
    return true;
  }

  public PublicDeleteChatOpResponse parseResponse(int code, String contentType, InputStream payload)
      throws HttpResponseException, IOException {
    final PublicDeleteChatOpResponse response = new PublicDeleteChatOpResponse();

    response.setHttpStatusCode(code);
    response.setContentType(contentType);

    if (code == 204) {
      response.setSuccess(true);
    } else if (code == 400) {
      final String json = Helper.convertInputStreamToString(payload);
      response.setError400(new RestapiErrorResponseBody().createFromJson(json));
      response.setError(response.getError400().translateToApiError());
    } else if (code == 401) {
      final String json = Helper.convertInputStreamToString(payload);
      response.setError401(new RestapiErrorResponseBody().createFromJson(json));
      response.setError(response.getError401().translateToApiError());
    } else if (code == 403) {
      final String json = Helper.convertInputStreamToString(payload);
      response.setError403(new RestapiErrorResponseBody().createFromJson(json));
      response.setError(response.getError403().translateToApiError());
    } else if (code == 500) {
      final String json = Helper.convertInputStreamToString(payload);
      response.setError500(new RestapiErrorResponseBody().createFromJson(json));
      response.setError(response.getError500().translateToApiError());
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
