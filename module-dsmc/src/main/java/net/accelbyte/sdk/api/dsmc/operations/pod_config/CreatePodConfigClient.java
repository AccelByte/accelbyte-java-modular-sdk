/*
 * Copyright (c) 2024 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.dsmc.operations.pod_config;

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
import net.accelbyte.sdk.api.dsmc.operation_responses.pod_config.CreatePodConfigClientOpResponse;

/**
 * CreatePodConfigClient
 *
 * Required permission: NAMESPACE:{namespace}:DSM:CONFIG [CREATE]
 * 
 * Required scope: social
 * 
 * This endpoint create a dedicated servers pod config in a namespace.
 */
@Getter
@Setter
public class CreatePodConfigClient extends Operation {
    /**
     * generated field's value
     */
    private String path = "/dsmcontroller/namespaces/{namespace}/configs/pods/{name}";
    private String method = "POST";
    private List<String> consumes = Arrays.asList("application/json");
    private List<String> produces = Arrays.asList("application/json");
    private String locationQuery = null;
    /**
     * fields as input parameter
     */
    private String name;
    private String namespace;
    private ModelsCreatePodConfigRequest body;

    /**
    * @param name required
    * @param namespace required
    * @param body required
    */
    @Builder
    // @deprecated 2022-08-29 - All args constructor may cause problems. Use builder instead.
    @Deprecated
    public CreatePodConfigClient(
            String customBasePath,            String name,
            String namespace,
            ModelsCreatePodConfigRequest body
    )
    {
        this.name = name;
        this.namespace = namespace;
        this.body = body;
        super.customBasePath = customBasePath != null ? customBasePath : "";

        securities.add("Bearer");
    }

    @Override
    public Map<String, String> getPathParams(){
        Map<String, String> pathParams = new HashMap<>();
        if (this.name != null){
            pathParams.put("name", this.name);
        }
        if (this.namespace != null){
            pathParams.put("namespace", this.namespace);
        }
        return pathParams;
    }



    @Override
    public ModelsCreatePodConfigRequest getBodyParams(){
        return this.body;
    }


    @Override
    public boolean isValid() {
        if(this.name == null) {
            return false;
        }
        if(this.namespace == null) {
            return false;
        }
        if(this.body == null) {
            return false;
        }
        return true;
    }

    public CreatePodConfigClientOpResponse parseResponse(int code, String contentType, InputStream payload) throws HttpResponseException, IOException {
        final CreatePodConfigClientOpResponse response = new CreatePodConfigClientOpResponse();

        response.setHttpStatusCode(code);
        response.setContentType(contentType);

        if (code == 204) {
            response.setSuccess(true);
        }
        else if ((code == 200) || (code == 201)) {
            final String json = Helper.convertInputStreamToString(payload);
            response.setData(new ModelsPodConfigRecord().createFromJson(json));
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

        return response;
    }

    /*
    public ModelsPodConfigRecord parseResponse(int code, String contentType, InputStream payload) throws HttpResponseException, IOException {
        if(code != 201){
            final String json = Helper.convertInputStreamToString(payload);
            throw new HttpResponseException(code, json);
        }
        final String json = Helper.convertInputStreamToString(payload);
        return new ModelsPodConfigRecord().createFromJson(json);
    }
    */

}