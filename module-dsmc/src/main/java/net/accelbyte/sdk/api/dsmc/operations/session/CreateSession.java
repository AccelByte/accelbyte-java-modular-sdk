/*
 * Copyright (c) 2024 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.dsmc.operations.session;

import java.io.*;
import java.util.*;

import lombok.Builder;
import lombok.Getter;
import lombok.Setter;

import net.accelbyte.sdk.api.dsmc.models.*;
import net.accelbyte.sdk.core.Operation;
import net.accelbyte.sdk.core.HttpResponseException;
import net.accelbyte.sdk.core.util.Helper;
import net.accelbyte.sdk.core.ApiError;
import net.accelbyte.sdk.api.dsmc.operation_responses.session.CreateSessionOpResponse;

/**
 * CreateSession
 *
 * Required permission: NAMESPACE:{namespace}:DSM:SESSION [CREATE]
 * 
 * Required scope: social
 * 
 * This endpoint is intended to be called by game session manager (matchmaker, lobby, etc.) to get a dedicated server for a game session.
 * 
 * If a dedicated server is available, it will respond with a dedicated server details ready to be used.
 * 
 * Otherwise it will trigger new dedicated server creation and respond with a server status CREATING. The game session manager then expected to wait and query the server readiness with GET /namespaces/{namespace}/sessions/{sessionID} endpoint until the serverstatus is READY
 * 
 * Specify pod_name with name of local DS in the request to create a session using the registered local DS
 */
@Getter
@Setter
public class CreateSession extends Operation {
    /**
     * generated field's value
     */
    private String path = "/dsmcontroller/namespaces/{namespace}/sessions";
    private String method = "POST";
    private List<String> consumes = Arrays.asList("application/json");
    private List<String> produces = Arrays.asList("application/json");
    private String locationQuery = null;
    /**
     * fields as input parameter
     */
    private String namespace;
    private ModelsCreateSessionRequest body;

    /**
    * @param namespace required
    * @param body required
    */
    @Builder
    // @deprecated 2022-08-29 - All args constructor may cause problems. Use builder instead.
    @Deprecated
    public CreateSession(
            String customBasePath,            String namespace,
            ModelsCreateSessionRequest body
    )
    {
        this.namespace = namespace;
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
        return pathParams;
    }



    @Override
    public ModelsCreateSessionRequest getBodyParams(){
        return this.body;
    }


    @Override
    public boolean isValid() {
        if(this.namespace == null) {
            return false;
        }
        if(this.body == null) {
            return false;
        }
        return true;
    }

    public CreateSessionOpResponse parseResponse(int code, String contentType, InputStream payload) throws HttpResponseException, IOException {
        final CreateSessionOpResponse response = new CreateSessionOpResponse();

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
            response.setError400(new ResponseError().createFromJson(json));
            response.setError(response.getError400().translateToApiError());
        }
        else if (code == 401) {
            final String json = Helper.convertInputStreamToString(payload);
            response.setError401(new ResponseError().createFromJson(json));
            response.setError(response.getError401().translateToApiError());
        }
        else if (code == 404) {
            final String json = Helper.convertInputStreamToString(payload);
            response.setError404(new ResponseError().createFromJson(json));
            response.setError(response.getError404().translateToApiError());
        }
        else if (code == 409) {
            final String json = Helper.convertInputStreamToString(payload);
            response.setError409(new ResponseError().createFromJson(json));
            response.setError(response.getError409().translateToApiError());
        }
        else if (code == 500) {
            final String json = Helper.convertInputStreamToString(payload);
            response.setError500(new ResponseError().createFromJson(json));
            response.setError(response.getError500().translateToApiError());
        }
        else if (code == 503) {
            final String json = Helper.convertInputStreamToString(payload);
            response.setError503(new ResponseError().createFromJson(json));
            response.setError(response.getError503().translateToApiError());
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