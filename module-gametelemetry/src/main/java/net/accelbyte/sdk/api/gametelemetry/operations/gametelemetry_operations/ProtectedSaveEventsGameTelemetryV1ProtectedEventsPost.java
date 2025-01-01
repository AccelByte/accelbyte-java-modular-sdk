/*
 * Copyright (c) 2024 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.gametelemetry.operations.gametelemetry_operations;

import java.io.*;
import java.util.*;
import lombok.Builder;
import lombok.Getter;
import lombok.Setter;
import net.accelbyte.sdk.api.gametelemetry.models.*;
import net.accelbyte.sdk.api.gametelemetry.operation_responses.gametelemetry_operations.ProtectedSaveEventsGameTelemetryV1ProtectedEventsPostOpResponse;
import net.accelbyte.sdk.core.HttpResponseException;
import net.accelbyte.sdk.core.Operation;
import net.accelbyte.sdk.core.util.Helper;

/**
 * protected_save_events_game_telemetry_v1_protected_events_post
 *
 * <p>This endpoint requires valid JWT token. This endpoint does not require permission.
 *
 * <p>This endpoint send events into designated streaming pipeline and each request can contain
 * single or multiple events.
 *
 * <p>Format of the event:
 *
 * <p>- **EventNamespace (required)**: Namespace of the relevant game with domain name format.
 *
 * <p>Only accept input with valid characters. Allowed characters: Aa-Zz0-9_.-
 *
 * <p>It is encouraged to use alphanumeric only characters. _.- will be deprecated soon
 *
 * <p>Example: accelbyte
 *
 * <p>- **EventName (required)**: Name of the event.
 *
 * <p>Only accept input with valid characters. Allowed characters: Aa-Zz0-9_.-
 *
 * <p>It is encouraged to use alphanumeric only characters. _.- will be deprecated soon
 *
 * <p>Example: player_killed, mission_accomplished
 *
 * <p>- **Payload (required)**: An arbitrary json with the payload of the said event.
 *
 * <p>Default maximum payload size is 1MB
 *
 * <p>- **ClientTimestamp (optional)**: Timestamp of the event captured by the client SDK.
 *
 * <p>- **DeviceType (optional)**: The device type of the user.
 */
@Getter
@Setter
public class ProtectedSaveEventsGameTelemetryV1ProtectedEventsPost extends Operation {
  /** generated field's value */
  private String path = "/game-telemetry/v1/protected/events";

  private String method = "POST";
  private List<String> consumes = Arrays.asList("application/json");
  private List<String> produces = Arrays.asList("application/json");
  private String locationQuery = null;

  /** fields as input parameter */
  private List<TelemetryBody> body;

  /**
   * @param body required
   */
  @Builder
  // @deprecated 2022-08-29 - All args constructor may cause problems. Use builder instead.
  @Deprecated
  public ProtectedSaveEventsGameTelemetryV1ProtectedEventsPost(
      String customBasePath, List<TelemetryBody> body) {
    this.body = body;
    super.customBasePath = customBasePath != null ? customBasePath : "";

    securities.add("Bearer");
    securities.add("Cookie");
  }

  @Override
  public Map<String, String> getCookieParams() {
    Map<String, String> cookieParams = new HashMap<>();
    return cookieParams;
  }

  @Override
  public List<TelemetryBody> getBodyParams() {
    return this.body;
  }

  @Override
  public boolean isValid() {
    if (this.body == null) {
      return false;
    }
    return true;
  }

  public ProtectedSaveEventsGameTelemetryV1ProtectedEventsPostOpResponse parseResponse(
      int code, String contentType, InputStream payload) throws HttpResponseException, IOException {
    final ProtectedSaveEventsGameTelemetryV1ProtectedEventsPostOpResponse response =
        new ProtectedSaveEventsGameTelemetryV1ProtectedEventsPostOpResponse();

    response.setHttpStatusCode(code);
    response.setContentType(contentType);

    if (code == 204) {
      response.setSuccess(true);
    } else if (code == 422) {
      final String json = Helper.convertInputStreamToString(payload);
      response.setError422(new BaseErrorResponse().createFromJson(json));
      response.setError(response.getError422().translateToApiError());
    } else if (code == 500) {
      final String json = Helper.convertInputStreamToString(payload);
      response.setError500(new BaseErrorResponse().createFromJson(json));
      response.setError(response.getError500().translateToApiError());
    } else if (code == 507) {
      final String json = Helper.convertInputStreamToString(payload);
      response.setError507(new BaseErrorResponse().createFromJson(json));
      response.setError(response.getError507().translateToApiError());
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
