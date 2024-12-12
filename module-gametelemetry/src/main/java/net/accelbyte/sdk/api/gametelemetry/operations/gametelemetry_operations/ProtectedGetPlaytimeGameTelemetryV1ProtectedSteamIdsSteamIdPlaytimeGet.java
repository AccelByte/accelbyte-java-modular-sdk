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
import net.accelbyte.sdk.core.Operation;
import net.accelbyte.sdk.core.HttpResponseException;
import net.accelbyte.sdk.core.util.Helper;
import net.accelbyte.sdk.core.ApiError;
import net.accelbyte.sdk.api.gametelemetry.operation_responses.gametelemetry_operations.ProtectedGetPlaytimeGameTelemetryV1ProtectedSteamIdsSteamIdPlaytimeGetOpResponse;

/**
 * protected_get_playtime_game_telemetry_v1_protected_steamIds__steamId__playtime_get
 *
 * This endpoint requires valid JWT token.
 * This endpoint does not require permission.
 * 
 * This endpoint retrieves player's total playtime in Steam for a specific game (AppId) and store them in service's cache.
 * 
 * Players' Steam account must be set into public to enable the service fetch their total playtime data.
 */
@Getter
@Setter
public class ProtectedGetPlaytimeGameTelemetryV1ProtectedSteamIdsSteamIdPlaytimeGet extends Operation {
    /**
     * generated field's value
     */
    private String path = "/game-telemetry/v1/protected/steamIds/{steamId}/playtime";
    private String method = "GET";
    private List<String> consumes = Arrays.asList();
    private List<String> produces = Arrays.asList("application/json");
    private String locationQuery = null;
    /**
     * fields as input parameter
     */
    private String steamId;

    /**
    * @param steamId required
    */
    @Builder
    // @deprecated 2022-08-29 - All args constructor may cause problems. Use builder instead.
    @Deprecated
    public ProtectedGetPlaytimeGameTelemetryV1ProtectedSteamIdsSteamIdPlaytimeGet(
            String customBasePath,            String steamId
    )
    {
        this.steamId = steamId;
        super.customBasePath = customBasePath != null ? customBasePath : "";

        securities.add("Bearer");
        securities.add("Cookie");
    }

    @Override
    public Map<String, String> getPathParams(){
        Map<String, String> pathParams = new HashMap<>();
        if (this.steamId != null){
            pathParams.put("steamId", this.steamId);
        }
        return pathParams;
    }


    @Override
    public Map<String, String> getCookieParams(){
        Map<String, String> cookieParams = new HashMap<>();
        return cookieParams;
    }



    @Override
    public boolean isValid() {
        if(this.steamId == null) {
            return false;
        }
        return true;
    }

    public ProtectedGetPlaytimeGameTelemetryV1ProtectedSteamIdsSteamIdPlaytimeGetOpResponse parseResponse(int code, String contentType, InputStream payload) throws HttpResponseException, IOException {
        final ProtectedGetPlaytimeGameTelemetryV1ProtectedSteamIdsSteamIdPlaytimeGetOpResponse response = new ProtectedGetPlaytimeGameTelemetryV1ProtectedSteamIdsSteamIdPlaytimeGetOpResponse();

        response.setHttpStatusCode(code);
        response.setContentType(contentType);

        if (code == 204) {
            response.setSuccess(true);
        }
        else if ((code == 200) || (code == 201)) {
            final String json = Helper.convertInputStreamToString(payload);
            response.setData(new PlayTimeResponse().createFromJson(json));
            response.setSuccess(true);
        }
        else if (code == 404) {
            final String json = Helper.convertInputStreamToString(payload);
            response.setError404(new BaseErrorResponse().createFromJson(json));
            response.setError(response.getError404().translateToApiError());
        }
        else if (code == 422) {
            final String json = Helper.convertInputStreamToString(payload);
            response.setError422(new BaseErrorResponse().createFromJson(json));
            response.setError(response.getError422().translateToApiError());
        }
        else if (code == 500) {
            final String json = Helper.convertInputStreamToString(payload);
            response.setError500(new BaseErrorResponse().createFromJson(json));
            response.setError(response.getError500().translateToApiError());
        }

        return response;
    }

    /*
    public PlayTimeResponse parseResponse(int code, String contentType, InputStream payload) throws HttpResponseException, IOException {
        if(code != 200){
            final String json = Helper.convertInputStreamToString(payload);
            throw new HttpResponseException(code, json);
        }
        final String json = Helper.convertInputStreamToString(payload);
        return new PlayTimeResponse().createFromJson(json);
    }
    */

}