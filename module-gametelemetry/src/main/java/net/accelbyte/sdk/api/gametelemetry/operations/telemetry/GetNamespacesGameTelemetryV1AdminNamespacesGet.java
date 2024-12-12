/*
 * Copyright (c) 2024 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.gametelemetry.operations.telemetry;

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
import net.accelbyte.sdk.api.gametelemetry.operation_responses.telemetry.GetNamespacesGameTelemetryV1AdminNamespacesGetOpResponse;

/**
 * get_namespaces_game_telemetry_v1_admin_namespaces_get
 *
 * This endpoint requires valid JWT token and telemetry permission
 * This endpoint retrieves namespace list
 */
@Getter
@Setter
public class GetNamespacesGameTelemetryV1AdminNamespacesGet extends Operation {
    /**
     * generated field's value
     */
    private String path = "/game-telemetry/v1/admin/namespaces";
    private String method = "GET";
    private List<String> consumes = Arrays.asList();
    private List<String> produces = Arrays.asList("application/json");
    private String locationQuery = null;
    /**
     * fields as input parameter
     */

    /**
    */
    @Builder
    // @deprecated 2022-08-29 - All args constructor may cause problems. Use builder instead.
    @Deprecated
    public GetNamespacesGameTelemetryV1AdminNamespacesGet(
            String customBasePath    )
    {
        super.customBasePath = customBasePath != null ? customBasePath : "";

        securities.add("Bearer");
        securities.add("Cookie");
    }






    @Override
    public boolean isValid() {
        return true;
    }

    public GetNamespacesGameTelemetryV1AdminNamespacesGetOpResponse parseResponse(int code, String contentType, InputStream payload) throws HttpResponseException, IOException {
        final GetNamespacesGameTelemetryV1AdminNamespacesGetOpResponse response = new GetNamespacesGameTelemetryV1AdminNamespacesGetOpResponse();

        response.setHttpStatusCode(code);
        response.setContentType(contentType);

        if (code == 204) {
            response.setSuccess(true);
        }
        else if ((code == 200) || (code == 201)) {
            final String json = Helper.convertInputStreamToString(payload);
            response.setData(new ListBaseResponseStr().createFromJson(json));
            response.setSuccess(true);
        }
        else if (code == 500) {
            final String json = Helper.convertInputStreamToString(payload);
            response.setError500(new BaseErrorResponse().createFromJson(json));
            response.setError(response.getError500().translateToApiError());
        }

        return response;
    }

    /*
    public ListBaseResponseStr parseResponse(int code, String contentType, InputStream payload) throws HttpResponseException, IOException {
        if(code != 200){
            final String json = Helper.convertInputStreamToString(payload);
            throw new HttpResponseException(code, json);
        }
        final String json = Helper.convertInputStreamToString(payload);
        return new ListBaseResponseStr().createFromJson(json);
    }
    */

}