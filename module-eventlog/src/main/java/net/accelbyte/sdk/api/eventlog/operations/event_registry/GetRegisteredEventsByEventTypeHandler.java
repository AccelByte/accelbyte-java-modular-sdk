/*
 * Copyright (c) 2024 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.eventlog.operations.event_registry;

import java.io.*;
import java.util.*;
import lombok.Builder;
import lombok.Getter;
import lombok.Setter;
import net.accelbyte.sdk.api.eventlog.models.*;
import net.accelbyte.sdk.core.HttpResponseException;
import net.accelbyte.sdk.core.Operation;
import net.accelbyte.sdk.core.util.Helper;

/**
 * GetRegisteredEventsByEventTypeHandler
 *
 * <p>Required permission `ADMIN:NAMESPACE:{namespace}:EVENT [READ]`and scope `analytics`
 *
 * @deprecated
 */
@Deprecated
@Getter
@Setter
public class GetRegisteredEventsByEventTypeHandler extends Operation {
  /** generated field's value */
  private String path = "/event/registry/eventTypes/{eventType}";

  private String method = "GET";
  private List<String> consumes = Arrays.asList();
  private List<String> produces = Arrays.asList("application/json");
  private String locationQuery = null;

  /** fields as input parameter */
  private String eventType;

  /**
   * @param eventType required
   */
  @Builder
  // @deprecated 2022-08-29 - All args constructor may cause problems. Use builder instead.
  @Deprecated
  public GetRegisteredEventsByEventTypeHandler(String customBasePath, String eventType) {
    this.eventType = eventType;
    super.customBasePath = customBasePath != null ? customBasePath : "";

    securities.add("Bearer");
  }

  @Override
  public Map<String, String> getPathParams() {
    Map<String, String> pathParams = new HashMap<>();
    if (this.eventType != null) {
      pathParams.put("eventType", this.eventType);
    }
    return pathParams;
  }

  @Override
  public boolean isValid() {
    if (this.eventType == null) {
      return false;
    }
    return true;
  }

  public ModelsEventRegistry parseResponse(int code, String contentType, InputStream payload)
      throws HttpResponseException, IOException {
    if (code != 200) {
      final String json = Helper.convertInputStreamToString(payload);
      throw new HttpResponseException(code, json);
    }
    final String json = Helper.convertInputStreamToString(payload);
    return new ModelsEventRegistry().createFromJson(json);
  }
}
