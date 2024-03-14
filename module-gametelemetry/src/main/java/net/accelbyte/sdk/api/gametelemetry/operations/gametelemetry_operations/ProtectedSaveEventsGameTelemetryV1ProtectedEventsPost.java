/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
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
import net.accelbyte.sdk.core.Operation;
import net.accelbyte.sdk.core.HttpResponseException;
import net.accelbyte.sdk.core.util.Helper;

/**
 * protected_save_events_game_telemetry_v1_protected_events_post
 *
 * This endpoint requires valid JWT token.
 * This endpoint does not require permission.
 * 
 * This endpoint send events into designated streaming pipeline and each request can contain single or multiple events.
 * 
 * 
 * Format of the event:
 * 
 * - **EventNamespace (required)**: Namespace of the relevant game with domain name format.
 * 
 * 
 * Only accept input with valid characters. Allowed characters: Aa-Zz0-9_.-
 * 
 * 
 * 
 * 
 * It is encouraged to use alphanumeric only characters. _.- will be deprecated soon
 * 
 * 
 * 
 * 
 * Example: accelbyte
 * 
 * 
 * 
 * - **EventName (required)**: Name of the event.
 * 
 * 
 * Only accept input with valid characters. Allowed characters: Aa-Zz0-9_.-
 * 
 * 
 * 
 * 
 * It is encouraged to use alphanumeric only characters. _.- will be deprecated soon
 * 
 * 
 * 
 * 
 * Example: player_killed, mission_accomplished
 * 
 * 
 * 
 * - **Payload (required)**: An arbitrary json with the payload of the said event.
 * 
 * 
 * Default maximum payload size is 1MB
 * 
 * 
 * 
 * - **ClientTimestamp (optional)**: Timestamp of the event captured by the client SDK.
 */
@Getter
@Setter
public class ProtectedSaveEventsGameTelemetryV1ProtectedEventsPost extends Operation {
    /**
     * generated field's value
     */
    private String path = "/game-telemetry/v1/protected/events";
    private String method = "POST";
    private List<String> consumes = Arrays.asList("application/json");
    private List<String> produces = Arrays.asList("application/json");
    private String locationQuery = null;
    /**
     * fields as input parameter
     */
    private List<TelemetryBody> body;

    /**
    * @param body required
    */
    @Builder
    // @deprecated 2022-08-29 - All args constructor may cause problems. Use builder instead.
    @Deprecated
    public ProtectedSaveEventsGameTelemetryV1ProtectedEventsPost(
            List<TelemetryBody> body
    )
    {
        this.body = body;

        securities.add("Bearer");
        securities.add("Cookie");
    }



    @Override
    public Map<String, String> getCookieParams(){
        Map<String, String> cookieParams = new HashMap<>();
        return cookieParams;
    }

    @Override
    public List<TelemetryBody> getBodyParams(){
        return this.body;
    }


    @Override
    public boolean isValid() {
        return true;
    }

    public void handleEmptyResponse(int code, String contentType, InputStream payload) throws HttpResponseException, IOException {
        if(code != 204){
            final String json = Helper.convertInputStreamToString(payload);
            throw new HttpResponseException(code, json);
        }
    }

}