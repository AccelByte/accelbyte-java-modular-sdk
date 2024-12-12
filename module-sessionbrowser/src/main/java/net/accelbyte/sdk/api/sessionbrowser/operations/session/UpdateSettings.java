/*
 * Copyright (c) 2024 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.sessionbrowser.operations.session;

import java.io.*;
import java.util.*;

import lombok.Builder;
import lombok.Getter;
import lombok.Setter;

import net.accelbyte.sdk.api.sessionbrowser.models.*;
import net.accelbyte.sdk.core.Operation;
import net.accelbyte.sdk.core.HttpResponseException;
import net.accelbyte.sdk.core.util.Helper;
import net.accelbyte.sdk.core.ApiError;
import net.accelbyte.sdk.api.sessionbrowser.operation_responses.session.UpdateSettingsOpResponse;

/**
 * UpdateSettings
 *
 * Update game session, used to update OtherSettings
 */
@Getter
@Setter
public class UpdateSettings extends Operation {
    /**
     * generated field's value
     */
    private String path = "/sessionbrowser/namespaces/{namespace}/gamesession/{sessionID}/settings";
    private String method = "PUT";
    private List<String> consumes = Arrays.asList("application/json");
    private List<String> produces = Arrays.asList("application/json");
    private String locationQuery = null;
    /**
     * fields as input parameter
     */
    private String namespace;
    private String sessionID;
    private ModelsUpdateSettingsRequest body;

    /**
    * @param namespace required
    * @param sessionID required
    * @param body required
    */
    @Builder
    // @deprecated 2022-08-29 - All args constructor may cause problems. Use builder instead.
    @Deprecated
    public UpdateSettings(
            String customBasePath,            String namespace,
            String sessionID,
            ModelsUpdateSettingsRequest body
    )
    {
        this.namespace = namespace;
        this.sessionID = sessionID;
        this.body = body;
        super.customBasePath = customBasePath != null ? customBasePath : "";

        securities.add("Bearer");
    }

    @Override
    public Map<String, String> getPathParams(){
        Map<String, String> pathParams = new HashMap<>();
        if (this.namespace != null){
            pathParams.put("namespace", this.namespace);
        }
        if (this.sessionID != null){
            pathParams.put("sessionID", this.sessionID);
        }
        return pathParams;
    }



    @Override
    public ModelsUpdateSettingsRequest getBodyParams(){
        return this.body;
    }


    @Override
    public boolean isValid() {
        if(this.namespace == null) {
            return false;
        }
        if(this.sessionID == null) {
            return false;
        }
        if(this.body == null) {
            return false;
        }
        return true;
    }

    public UpdateSettingsOpResponse parseResponse(int code, String contentType, InputStream payload) throws HttpResponseException, IOException {
        final UpdateSettingsOpResponse response = new UpdateSettingsOpResponse();

        response.setHttpStatusCode(code);
        response.setContentType(contentType);

        if (code == 204) {
            response.setSuccess(true);
        }
        else if ((code == 200) || (code == 201)) {
            final String json = Helper.convertInputStreamToString(payload);
            response.setData(new ModelsSessionResponse().createFromJson(json));
            response.setSuccess(true);
        }
        else if (code == 400) {
            final String json = Helper.convertInputStreamToString(payload);
            response.setError400(new RestapiErrorResponseV2().createFromJson(json));
            response.setError(response.getError400().translateToApiError());
        }
        else if (code == 404) {
            final String json = Helper.convertInputStreamToString(payload);
            response.setError404(new RestapiErrorResponseV2().createFromJson(json));
            response.setError(response.getError404().translateToApiError());
        }
        else if (code == 500) {
            final String json = Helper.convertInputStreamToString(payload);
            response.setError500(new RestapiErrorResponseV2().createFromJson(json));
            response.setError(response.getError500().translateToApiError());
        }

        return response;
    }

    /*
    public ModelsSessionResponse parseResponse(int code, String contentType, InputStream payload) throws HttpResponseException, IOException {
        if(code != 200){
            final String json = Helper.convertInputStreamToString(payload);
            throw new HttpResponseException(code, json);
        }
        final String json = Helper.convertInputStreamToString(payload);
        return new ModelsSessionResponse().createFromJson(json);
    }
    */

}