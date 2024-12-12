/*
 * Copyright (c) 2024 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.cloudsave.operations.admin_game_record;

import java.io.*;
import java.util.*;

import lombok.Builder;
import lombok.Getter;
import lombok.Setter;

import net.accelbyte.sdk.api.cloudsave.models.*;
import net.accelbyte.sdk.core.Operation;
import net.accelbyte.sdk.core.HttpResponseException;
import net.accelbyte.sdk.core.util.Helper;
import net.accelbyte.sdk.core.ApiError;
import net.accelbyte.sdk.api.cloudsave.operation_responses.admin_game_record.AdminPutGameRecordHandlerV1OpResponse;

/**
 * adminPutGameRecordHandlerV1
 *
 * ## Description
 * 
 * This endpoints will create new game record or replace the existing game record.
 * 
 * **Replace behaviour:**
 * The existing value will be replaced completely with the new value.
 * 
 * Example
 * - Existing JSON:
 * 
 * `{ "data1": "value" }`
 * 
 * - New JSON:
 * 
 * `{ "data2": "new value" }`
 * 
 * - Result:
 * 
 * `{ "data2": "new value" }`
 * 
 * 
 * 
 * ## Restriction
 * This is the restriction of Key Naming for the record:
 * 1. Cannot use **"."** as the key name
 * - `{ "data.2": "value" }`
 * 2. Cannot use **"$"** as the prefix in key names
 * - `{ "$data": "value" }`
 * 
 * 
 * ## Record Metadata
 * 
 * Metadata allows user to define the behaviour of the record.
 * Metadata can be defined in request body with field name **__META**.
 * When creating record, if **__META** field is not defined, the metadata value will use the default value.
 * When updating record, if **__META** field is not defined, the existing metadata value will stay as is.
 * 
 * **Metadata List:**
 * 1. set_by (default: CLIENT, type: string)
 * Indicate which party that could modify the game record.
 * SERVER: record can be modified by server only.
 * CLIENT: record can be modified by client and server.
 * 2. ttl_config (default: *empty*, type: object)
 * Indicate the TTL configuration for the game record.
 * action:
 * - DELETE: record will be deleted after TTL is reached
 * 3. tags (default: *empty array*, type: array of string)
 * Indicate the tagging for the game record.
 * 
 * **Request Body Example:**
 * ```
 * {
 * "__META": {
 * "set_by": "SERVER",
 * "ttl_config": {
 * "expires_at": "2026-01-02T15:04:05Z", // should be in RFC3339 format
 * "action": "DELETE"
 * },
 * "tags": ["tag1", "tag2"]
 * }
 * ...
 * }
 * ```
 */
@Getter
@Setter
public class AdminPutGameRecordHandlerV1 extends Operation {
    /**
     * generated field's value
     */
    private String path = "/cloudsave/v1/admin/namespaces/{namespace}/records/{key}";
    private String method = "PUT";
    private List<String> consumes = Arrays.asList("application/json");
    private List<String> produces = Arrays.asList("application/json");
    private String locationQuery = null;
    /**
     * fields as input parameter
     */
    private String key;
    private String namespace;
    private ModelsGameRecordRequest body;

    /**
    * @param key required
    * @param namespace required
    * @param body required
    */
    @Builder
    // @deprecated 2022-08-29 - All args constructor may cause problems. Use builder instead.
    @Deprecated
    public AdminPutGameRecordHandlerV1(
            String customBasePath,            String key,
            String namespace,
            ModelsGameRecordRequest body
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
    public ModelsGameRecordRequest getBodyParams(){
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

    public AdminPutGameRecordHandlerV1OpResponse parseResponse(int code, String contentType, InputStream payload) throws HttpResponseException, IOException {
        final AdminPutGameRecordHandlerV1OpResponse response = new AdminPutGameRecordHandlerV1OpResponse();

        response.setHttpStatusCode(code);
        response.setContentType(contentType);

        if (code == 204) {
            response.setSuccess(true);
        }
        else if ((code == 200) || (code == 201)) {
            final String json = Helper.convertInputStreamToString(payload);
            response.setData(new ModelsGameRecordAdminResponse().createFromJson(json));
            response.setSuccess(true);
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
    public ModelsGameRecordAdminResponse parseResponse(int code, String contentType, InputStream payload) throws HttpResponseException, IOException {
        if(code != 200){
            final String json = Helper.convertInputStreamToString(payload);
            throw new HttpResponseException(code, json);
        }
        final String json = Helper.convertInputStreamToString(payload);
        return new ModelsGameRecordAdminResponse().createFromJson(json);
    }
    */

}