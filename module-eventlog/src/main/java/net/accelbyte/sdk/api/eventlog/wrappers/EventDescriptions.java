/*
 * Copyright (c) 2024 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.eventlog.wrappers;

import net.accelbyte.sdk.api.eventlog.models.*;
import net.accelbyte.sdk.api.eventlog.operations.event_descriptions.*;
import net.accelbyte.sdk.core.HttpResponse;
import net.accelbyte.sdk.core.RequestRunner;

public class EventDescriptions {

  private RequestRunner sdk;
  private String customBasePath = "";

  public EventDescriptions(RequestRunner sdk) {
    this.sdk = sdk;
    String configCustomBasePath =
        sdk.getSdkConfiguration().getConfigRepository().getCustomServiceBasePath("eventlog");
    if (!configCustomBasePath.equals("")) {
      this.customBasePath = configCustomBasePath;
    }
  }

  public EventDescriptions(RequestRunner sdk, String customBasePath) {
    this.sdk = sdk;
    this.customBasePath = customBasePath;
  }

  /**
   * @see AgentTypeDescriptionHandler
   * @deprecated
   */
  @Deprecated
  public ModelsMultipleAgentType agentTypeDescriptionHandler(AgentTypeDescriptionHandler input)
      throws Exception {
    if (!customBasePath.equals("")) {
      input.setCustomBasePath(customBasePath);
    }

    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see SpecificAgentTypeDescriptionHandler
   * @deprecated
   */
  @Deprecated
  public ModelsMultipleAgentType specificAgentTypeDescriptionHandler(
      SpecificAgentTypeDescriptionHandler input) throws Exception {
    if (!customBasePath.equals("")) {
      input.setCustomBasePath(customBasePath);
    }

    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see EventIDDescriptionHandler
   * @deprecated
   */
  @Deprecated
  public ModelsMultipleEventID eventIDDescriptionHandler(EventIDDescriptionHandler input)
      throws Exception {
    if (!customBasePath.equals("")) {
      input.setCustomBasePath(customBasePath);
    }

    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see SpecificEventIDDescriptionHandler
   * @deprecated
   */
  @Deprecated
  public ModelsMultipleEventID specificEventIDDescriptionHandler(
      SpecificEventIDDescriptionHandler input) throws Exception {
    if (!customBasePath.equals("")) {
      input.setCustomBasePath(customBasePath);
    }

    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see EventLevelDescriptionHandler
   * @deprecated
   */
  @Deprecated
  public ModelsMultipleEventLevel eventLevelDescriptionHandler(EventLevelDescriptionHandler input)
      throws Exception {
    if (!customBasePath.equals("")) {
      input.setCustomBasePath(customBasePath);
    }

    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see SpecificEventLevelDescriptionHandler
   * @deprecated
   */
  @Deprecated
  public ModelsMultipleEventLevel specificEventLevelDescriptionHandler(
      SpecificEventLevelDescriptionHandler input) throws Exception {
    if (!customBasePath.equals("")) {
      input.setCustomBasePath(customBasePath);
    }

    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see EventTypeDescriptionHandler
   * @deprecated
   */
  @Deprecated
  public ModelsMultipleEventType eventTypeDescriptionHandler(EventTypeDescriptionHandler input)
      throws Exception {
    if (!customBasePath.equals("")) {
      input.setCustomBasePath(customBasePath);
    }

    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see SpecificEventTypeDescriptionHandler
   * @deprecated
   */
  @Deprecated
  public ModelsMultipleEventType specificEventTypeDescriptionHandler(
      SpecificEventTypeDescriptionHandler input) throws Exception {
    if (!customBasePath.equals("")) {
      input.setCustomBasePath(customBasePath);
    }

    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see UXNameDescriptionHandler
   * @deprecated
   */
  @Deprecated
  public ModelsMultipleUX uxNameDescriptionHandler(UXNameDescriptionHandler input)
      throws Exception {
    if (!customBasePath.equals("")) {
      input.setCustomBasePath(customBasePath);
    }

    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see SpecificUXDescriptionHandler
   * @deprecated
   */
  @Deprecated
  public ModelsMultipleUX specificUXDescriptionHandler(SpecificUXDescriptionHandler input)
      throws Exception {
    if (!customBasePath.equals("")) {
      input.setCustomBasePath(customBasePath);
    }

    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }
}
