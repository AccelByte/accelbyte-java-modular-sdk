/*
 * Copyright (c) 2024 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.csm.operations.configuration_v2;

import java.io.*;
import java.util.*;

import lombok.Builder;
import lombok.Getter;
import lombok.Setter;

import net.accelbyte.sdk.api.csm.models.*;
import net.accelbyte.sdk.core.Operation;
import net.accelbyte.sdk.core.HttpResponseException;
import net.accelbyte.sdk.core.util.Helper;
import net.accelbyte.sdk.core.ApiError;
import net.accelbyte.sdk.api.csm.operation_responses.configuration_v2.SaveSecretV2OpResponse;

/**
 * SaveSecretV2
 *
 * Required permission : `ADMIN:NAMESPACE:{namespace}:EXTEND:SECRET [CREATE]`
 * 
 * Save an environment secret.
 * Request body:
 * - configName : environment secret name - Required.
 * - source : source of the configuration value (plaintext or ssm) - Required.
 * - value : configuration value - Required.
 * - description : description of the configuration - Optional.
 * - applyMask : mask the value in the Helm manifest for sensitive information (true or false) - Optional.
 */
@Getter
@Setter
public class SaveSecretV2 extends Operation {
    /**
     * generated field's value
     */
    private String path = "/csm/v2/admin/namespaces/{namespace}/apps/{app}/secrets";
    private String method = "POST";
    private List<String> consumes = Arrays.asList("application/json");
    private List<String> produces = Arrays.asList("application/json");
    private String locationQuery = null;
    /**
     * fields as input parameter
     */
    private String app;
    private String namespace;
    private ApimodelSaveConfigurationV2Request body;

    /**
    * @param app required
    * @param namespace required
    * @param body required
    */
    @Builder
    // @deprecated 2022-08-29 - All args constructor may cause problems. Use builder instead.
    @Deprecated
    public SaveSecretV2(
            String customBasePath,            String app,
            String namespace,
            ApimodelSaveConfigurationV2Request body
    )
    {
        this.app = app;
        this.namespace = namespace;
        this.body = body;
        super.customBasePath = customBasePath != null ? customBasePath : "";

        securities.add("Bearer");
    }

    @Override
    public Map<String, String> getPathParams(){
        Map<String, String> pathParams = new HashMap<>();
        if (this.app != null){
            pathParams.put("app", this.app);
        }
        if (this.namespace != null){
            pathParams.put("namespace", this.namespace);
        }
        return pathParams;
    }



    @Override
    public ApimodelSaveConfigurationV2Request getBodyParams(){
        return this.body;
    }


    @Override
    public boolean isValid() {
        if(this.app == null) {
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

    public SaveSecretV2OpResponse parseResponse(int code, String contentType, InputStream payload) throws HttpResponseException, IOException {
        final SaveSecretV2OpResponse response = new SaveSecretV2OpResponse();

        response.setHttpStatusCode(code);
        response.setContentType(contentType);

        if (code == 204) {
            response.setSuccess(true);
        }
        else if ((code == 200) || (code == 201)) {
            final String json = Helper.convertInputStreamToString(payload);
            response.setData(new ApimodelSaveConfigurationV2Response().createFromJson(json));
            response.setSuccess(true);
        }
        else if (code == 400) {
            final String json = Helper.convertInputStreamToString(payload);
            response.setError400(new ResponseErrorResponse().createFromJson(json));
            response.setError(response.getError400().translateToApiError());
        }
        else if (code == 401) {
            final String json = Helper.convertInputStreamToString(payload);
            response.setError401(new ResponseErrorResponse().createFromJson(json));
            response.setError(response.getError401().translateToApiError());
        }
        else if (code == 403) {
            final String json = Helper.convertInputStreamToString(payload);
            response.setError403(new ResponseErrorResponse().createFromJson(json));
            response.setError(response.getError403().translateToApiError());
        }
        else if (code == 500) {
            final String json = Helper.convertInputStreamToString(payload);
            response.setError500(new ResponseErrorResponse().createFromJson(json));
            response.setError(response.getError500().translateToApiError());
        }

        return response;
    }

    /*
    public ApimodelSaveConfigurationV2Response parseResponse(int code, String contentType, InputStream payload) throws HttpResponseException, IOException {
        if(code != 200){
            final String json = Helper.convertInputStreamToString(payload);
            throw new HttpResponseException(code, json);
        }
        final String json = Helper.convertInputStreamToString(payload);
        return new ApimodelSaveConfigurationV2Response().createFromJson(json);
    }
    */

}