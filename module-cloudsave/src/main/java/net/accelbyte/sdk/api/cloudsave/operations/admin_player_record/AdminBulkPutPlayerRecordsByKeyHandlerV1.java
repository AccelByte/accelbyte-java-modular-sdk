/*
 * Copyright (c) 2024 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.cloudsave.operations.admin_player_record;

import java.io.*;
import java.util.*;

import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import lombok.Builder;
import lombok.Getter;
import lombok.Setter;

import net.accelbyte.sdk.api.cloudsave.models.*;
import net.accelbyte.sdk.core.Operation;
import net.accelbyte.sdk.core.HttpResponseException;
import net.accelbyte.sdk.core.util.Helper;
import net.accelbyte.sdk.core.ApiError;
import net.accelbyte.sdk.api.cloudsave.operation_responses.admin_player_record.AdminBulkPutPlayerRecordsByKeyHandlerV1OpResponse;

/**
 * adminBulkPutPlayerRecordsByKeyHandlerV1
 *
 * This endpoints will create new player record or replace the existing player record in bulk.
 * Maximum number of user ids per request is 10.
 * Maximum total size of the request payload is 5 MB.
 */
@Getter
@Setter
public class AdminBulkPutPlayerRecordsByKeyHandlerV1 extends Operation {
    /**
     * generated field's value
     */
    private String path = "/cloudsave/v1/admin/namespaces/{namespace}/users/records/{key}/bulk";
    private String method = "PUT";
    private List<String> consumes = Arrays.asList("application/json");
    private List<String> produces = Arrays.asList("application/json");
    private String locationQuery = null;
    /**
     * fields as input parameter
     */
    private String key;
    private String namespace;
    private ModelsBulkUpdatePlayerRecordsByKeyRequest body;

    /**
    * @param key required
    * @param namespace required
    * @param body required
    */
    @Builder
    // @deprecated 2022-08-29 - All args constructor may cause problems. Use builder instead.
    @Deprecated
    public AdminBulkPutPlayerRecordsByKeyHandlerV1(
            String customBasePath,            String key,
            String namespace,
            ModelsBulkUpdatePlayerRecordsByKeyRequest body
    )
    {
        this.key = key;
        this.namespace = namespace;
        this.body = body;
        super.customBasePath = customBasePath != null ? customBasePath : "";

        securities.add("Bearer");
    }

    @Override
    public Map<String, String> getPathParams(){
        Map<String, String> pathParams = new HashMap<>();
        if (this.key != null){
            pathParams.put("key", this.key);
        }
        if (this.namespace != null){
            pathParams.put("namespace", this.namespace);
        }
        return pathParams;
    }



    @Override
    public ModelsBulkUpdatePlayerRecordsByKeyRequest getBodyParams(){
        return this.body;
    }


    @Override
    public boolean isValid() {
        if(this.key == null) {
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

    public AdminBulkPutPlayerRecordsByKeyHandlerV1OpResponse parseResponse(int code, String contentType, InputStream payload) throws HttpResponseException, IOException {
        final AdminBulkPutPlayerRecordsByKeyHandlerV1OpResponse response = new AdminBulkPutPlayerRecordsByKeyHandlerV1OpResponse();

        response.setHttpStatusCode(code);
        response.setContentType(contentType);

        if (code == 204) {
            response.setSuccess(true);
        }
        else if ((code == 200) || (code == 201)) {
            final String json = Helper.convertInputStreamToString(payload);

            response.setSuccess(true);
            response.setData(new ObjectMapper().readValue(json, new TypeReference<List<ModelsBulkUpdatePlayerRecordByKeyResponse>>() {}));
        }
        else if (code == 400) {
            final String json = Helper.convertInputStreamToString(payload);
            response.setError400(new ModelsResponseError().createFromJson(json));
            response.setError(response.getError400().translateToApiError());
        }
        else if (code == 401) {
            final String json = Helper.convertInputStreamToString(payload);
            response.setError401(new ModelsResponseError().createFromJson(json));
            response.setError(response.getError401().translateToApiError());
        }
        else if (code == 403) {
            final String json = Helper.convertInputStreamToString(payload);
            response.setError403(new ModelsResponseError().createFromJson(json));
            response.setError(response.getError403().translateToApiError());
        }
        else if (code == 500) {
            final String json = Helper.convertInputStreamToString(payload);
            response.setError500(new ModelsResponseError().createFromJson(json));
            response.setError(response.getError500().translateToApiError());
        }

        return response;
    }

    /*
    public List<ModelsBulkUpdatePlayerRecordByKeyResponse> parseResponse(int code, String contentType, InputStream payload) throws HttpResponseException, IOException {
        if(code != 200){
            final String json = Helper.convertInputStreamToString(payload);
            throw new HttpResponseException(code, json);
        }
        final String json = Helper.convertInputStreamToString(payload);
        return new ObjectMapper().readValue(json, new TypeReference<List<ModelsBulkUpdatePlayerRecordByKeyResponse>>() {});
    }
    */

}