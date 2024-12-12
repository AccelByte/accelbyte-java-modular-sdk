/*
 * Copyright (c) 2024 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.qosm.operations.admin;

import java.io.*;
import java.util.*;

import lombok.Builder;
import lombok.Getter;
import lombok.Setter;

import net.accelbyte.sdk.api.qosm.models.*;
import net.accelbyte.sdk.core.Operation;
import net.accelbyte.sdk.core.HttpResponseException;
import net.accelbyte.sdk.core.util.Helper;
import net.accelbyte.sdk.core.ApiError;
import net.accelbyte.sdk.api.qosm.operation_responses.admin.UpdateServerConfigOpResponse;

/**
 * UpdateServerConfig
 *
 * ```
 * Required permission: ADMIN:NAMESPACE:{namespace}:QOS:SERVER [UPDATE]
 * Required scope: social
 * 
 * This endpoint updates the registered QoS service's configurable configuration'.
 * ```
 */
@Getter
@Setter
public class UpdateServerConfig extends Operation {
    /**
     * generated field's value
     */
    private String path = "/qosm/admin/namespaces/{namespace}/servers/{region}";
    private String method = "PATCH";
    private List<String> consumes = Arrays.asList("application/json");
    private List<String> produces = Arrays.asList("application/json");
    private String locationQuery = null;
    /**
     * fields as input parameter
     */
    private String namespace;
    private String region;
    private ModelsUpdateServerRequest body;

    /**
    * @param namespace required
    * @param region required
    * @param body required
    */
    @Builder
    // @deprecated 2022-08-29 - All args constructor may cause problems. Use builder instead.
    @Deprecated
    public UpdateServerConfig(
            String customBasePath,            String namespace,
            String region,
            ModelsUpdateServerRequest body
    )
    {
        this.namespace = namespace;
        this.region = region;
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
        if (this.region != null){
            pathParams.put("region", this.region);
        }
        return pathParams;
    }



    @Override
    public ModelsUpdateServerRequest getBodyParams(){
        return this.body;
    }


    @Override
    public boolean isValid() {
        if(this.namespace == null) {
            return false;
        }
        if(this.region == null) {
            return false;
        }
        if(this.body == null) {
            return false;
        }
        return true;
    }

    public UpdateServerConfigOpResponse parseResponse(int code, String contentType, InputStream payload) throws HttpResponseException, IOException {
        final UpdateServerConfigOpResponse response = new UpdateServerConfigOpResponse();

        response.setHttpStatusCode(code);
        response.setContentType(contentType);

        if (code == 204) {
            response.setSuccess(true);
        }
        else if (code == 400) {
            final String json = Helper.convertInputStreamToString(payload);
            response.setError400(new ResponseError().createFromJson(json));
            response.setError(response.getError400().translateToApiError());
        }
        else if (code == 404) {
            final String json = Helper.convertInputStreamToString(payload);
            response.setError404(new ResponseError().createFromJson(json));
            response.setError(response.getError404().translateToApiError());
        }
        else if (code == 500) {
            final String json = Helper.convertInputStreamToString(payload);
            response.setError500(new ResponseError().createFromJson(json));
            response.setError(response.getError500().translateToApiError());
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