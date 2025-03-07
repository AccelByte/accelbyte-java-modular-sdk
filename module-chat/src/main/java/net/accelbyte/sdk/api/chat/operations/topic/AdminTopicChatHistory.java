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
import net.accelbyte.sdk.api.chat.operation_responses.topic.AdminTopicChatHistoryOpResponse;
import net.accelbyte.sdk.core.HttpResponseException;
import net.accelbyte.sdk.core.Operation;
import net.accelbyte.sdk.core.util.Helper;

/**
 * adminTopicChatHistory
 *
 * <p>Get chat history in a namespace.
 *
 * @deprecated
 */
@Deprecated
@Getter
@Setter
public class AdminTopicChatHistory extends Operation {
  /** generated field's value */
  private String path = "/chat/admin/namespaces/{namespace}/topic/{topic}/chats";

  private String method = "GET";
  private List<String> consumes = Arrays.asList("application/json");
  private List<String> produces = Arrays.asList("application/json");
  private String locationQuery = null;

  /** fields as input parameter */
  private String namespace;

  private String topic;
  private Integer endCreatedAt;
  private String keyword;
  private Integer limit;
  private Integer offset;
  private String order;
  private String senderUserId;
  private String shardId;
  private Integer startCreatedAt;
  private Boolean unfiltered;

  /**
   * @param namespace required
   * @param topic required
   */
  @Builder
  // @deprecated 2022-08-29 - All args constructor may cause problems. Use builder instead.
  @Deprecated
  public AdminTopicChatHistory(
      String customBasePath,
      String namespace,
      String topic,
      Integer endCreatedAt,
      String keyword,
      Integer limit,
      Integer offset,
      String order,
      String senderUserId,
      String shardId,
      Integer startCreatedAt,
      Boolean unfiltered) {
    this.namespace = namespace;
    this.topic = topic;
    this.endCreatedAt = endCreatedAt;
    this.keyword = keyword;
    this.limit = limit;
    this.offset = offset;
    this.order = order;
    this.senderUserId = senderUserId;
    this.shardId = shardId;
    this.startCreatedAt = startCreatedAt;
    this.unfiltered = unfiltered;
    super.customBasePath = customBasePath != null ? customBasePath : "";

    securities.add("Bearer");
  }

  @Override
  public Map<String, String> getPathParams() {
    Map<String, String> pathParams = new HashMap<>();
    if (this.namespace != null) {
      pathParams.put("namespace", this.namespace);
    }
    if (this.topic != null) {
      pathParams.put("topic", this.topic);
    }
    return pathParams;
  }

  @Override
  public Map<String, List<String>> getQueryParams() {
    Map<String, List<String>> queryParams = new HashMap<>();
    queryParams.put(
        "endCreatedAt",
        this.endCreatedAt == null ? null : Arrays.asList(String.valueOf(this.endCreatedAt)));
    queryParams.put("keyword", this.keyword == null ? null : Arrays.asList(this.keyword));
    queryParams.put("limit", this.limit == null ? null : Arrays.asList(String.valueOf(this.limit)));
    queryParams.put(
        "offset", this.offset == null ? null : Arrays.asList(String.valueOf(this.offset)));
    queryParams.put("order", this.order == null ? null : Arrays.asList(this.order));
    queryParams.put(
        "senderUserId", this.senderUserId == null ? null : Arrays.asList(this.senderUserId));
    queryParams.put("shardId", this.shardId == null ? null : Arrays.asList(this.shardId));
    queryParams.put(
        "startCreatedAt",
        this.startCreatedAt == null ? null : Arrays.asList(String.valueOf(this.startCreatedAt)));
    queryParams.put(
        "unfiltered",
        this.unfiltered == null ? null : Arrays.asList(String.valueOf(this.unfiltered)));
    return queryParams;
  }

  @Override
  public boolean isValid() {
    if (this.namespace == null) {
      return false;
    }
    if (this.topic == null) {
      return false;
    }
    return true;
  }

  public AdminTopicChatHistoryOpResponse parseResponse(
      int code, String contentType, InputStream payload) throws HttpResponseException, IOException {
    final AdminTopicChatHistoryOpResponse response = new AdminTopicChatHistoryOpResponse();

    response.setHttpStatusCode(code);
    response.setContentType(contentType);

    if (code == 204) {
      response.setSuccess(true);
    } else if ((code == 200) || (code == 201)) {
      final String json = Helper.convertInputStreamToString(payload);
      response.setData(new ModelsChatMessageWithPaginationResponse().createFromJson(json));
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
  public ModelsChatMessageWithPaginationResponse parseResponse(int code, String contentType, InputStream payload) throws HttpResponseException, IOException {
      if(code != 200){
          final String json = Helper.convertInputStreamToString(payload);
          throw new HttpResponseException(code, json);
      }
      final String json = Helper.convertInputStreamToString(payload);
      return new ModelsChatMessageWithPaginationResponse().createFromJson(json);
  }
  */

  @Override
  protected Map<String, String> getCollectionFormatMap() {
    Map<String, String> result = new HashMap<>();
    result.put("endCreatedAt", "None");
    result.put("keyword", "None");
    result.put("limit", "None");
    result.put("offset", "None");
    result.put("order", "None");
    result.put("senderUserId", "None");
    result.put("shardId", "None");
    result.put("startCreatedAt", "None");
    result.put("unfiltered", "None");
    return result;
  }
}
