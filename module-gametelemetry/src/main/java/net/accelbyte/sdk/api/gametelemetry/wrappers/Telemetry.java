/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.gametelemetry.wrappers;

import net.accelbyte.sdk.api.gametelemetry.models.*;
import net.accelbyte.sdk.api.gametelemetry.operations.telemetry.*;
import net.accelbyte.sdk.core.HttpResponse;
import net.accelbyte.sdk.core.RequestRunner;

public class Telemetry {

  private RequestRunner sdk;

  public Telemetry(RequestRunner sdk) {
    this.sdk = sdk;
  }

  /**
   * @see GetNamespacesGameTelemetryV1AdminNamespacesGet
   */
  public ListBaseResponseStr getNamespacesGameTelemetryV1AdminNamespacesGet(
      GetNamespacesGameTelemetryV1AdminNamespacesGet input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see GetEventsGameTelemetryV1AdminNamespacesNamespaceEventsGet
   */
  public PagedResponseGetNamespaceEventResponse
      getEventsGameTelemetryV1AdminNamespacesNamespaceEventsGet(
          GetEventsGameTelemetryV1AdminNamespacesNamespaceEventsGet input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }
}
