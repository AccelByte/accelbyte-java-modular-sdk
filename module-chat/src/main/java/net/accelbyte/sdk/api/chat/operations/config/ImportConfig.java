/*
 * Copyright (c) 2024 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.chat.operations.config;

import java.io.*;
import java.util.*;

import lombok.Builder;
import lombok.Getter;
import lombok.Setter;

import net.accelbyte.sdk.api.chat.models.*;
import net.accelbyte.sdk.core.Operation;
import net.accelbyte.sdk.core.HttpResponseException;
import net.accelbyte.sdk.core.util.Helper;
import net.accelbyte.sdk.core.ApiError;
import net.accelbyte.sdk.api.chat.operation_responses.config.ImportConfigOpResponse;

/**
 * ImportConfig
 *
 * 
 * Import config configuration from file. The existing configuration will be replaced.
 * The json file to import can be obtained from the /export endpoint.
 */
@Getter
@Setter
public class ImportConfig extends Operation {
    /**
     * generated field's value
     */
    private String path = "/chat/v1/admin/config/namespaces/{namespace}/import";
    private String method = "POST";
    private List<String> consumes = Arrays.asList("multipart/form-data");
    private List<String> produces = Arrays.asList("application/json");
    private String locationQuery = null;
    /**
     * fields as input parameter
     */
    private String namespace;
    private File file;

    /**
    * @param namespace required
    */
    @Builder
    // @deprecated 2022-08-29 - All args constructor may cause problems. Use builder instead.
    @Deprecated
    public ImportConfig(
            String customBasePath,            String namespace,
            File file
    )
    {
        this.namespace = namespace;
        this.file = file;
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
    public Map<String, Object> getFormParams(){
        Map<String, Object> formDataParams = new HashMap<>();
        if (this.file != null) {
            formDataParams.put("file", this.file);
        }
        return formDataParams;
    }

    @Override
    public boolean isValid() {
        if(this.namespace == null) {
            return false;
        }
        return true;
    }

    public ImportConfigOpResponse parseResponse(int code, String contentType, InputStream payload) throws HttpResponseException, IOException {
        final ImportConfigOpResponse response = new ImportConfigOpResponse();

        response.setHttpStatusCode(code);
        response.setContentType(contentType);

        if (code == 204) {
            response.setSuccess(true);
        }
        else if ((code == 200) || (code == 201)) {
            final String json = Helper.convertInputStreamToString(payload);
            response.setData(new ModelsImportConfigResponse().createFromJson(json));
            response.setSuccess(true);
        }
        else if (code == 401) {
            final String json = Helper.convertInputStreamToString(payload);
            response.setError401(new ResponseError().createFromJson(json));
            response.setError(response.getError401().translateToApiError());
        }
        else if (code == 403) {
            final String json = Helper.convertInputStreamToString(payload);
            response.setError403(new ResponseError().createFromJson(json));
            response.setError(response.getError403().translateToApiError());
        }
        else if (code == 500) {
            final String json = Helper.convertInputStreamToString(payload);
            response.setError500(new ResponseError().createFromJson(json));
            response.setError(response.getError500().translateToApiError());
        }

        return response;
    }

    /*
    public ModelsImportConfigResponse parseResponse(int code, String contentType, InputStream payload) throws HttpResponseException, IOException {
        if(code != 200){
            final String json = Helper.convertInputStreamToString(payload);
            throw new HttpResponseException(code, json);
        }
        final String json = Helper.convertInputStreamToString(payload);
        return new ModelsImportConfigResponse().createFromJson(json);
    }
    */

}