/*
 * Copyright (c) 2024 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.session.operations.session_storage;

import java.io.*;
import java.util.*;

import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import lombok.Builder;
import lombok.Getter;
import lombok.Setter;

import net.accelbyte.sdk.api.session.models.*;
import net.accelbyte.sdk.core.Operation;
import net.accelbyte.sdk.core.HttpResponseException;
import net.accelbyte.sdk.core.util.Helper;
import net.accelbyte.sdk.core.ApiError;
import net.accelbyte.sdk.api.session.operation_responses.session_storage.AdminReadUserSessionStorageOpResponse;

/**
 * adminReadUserSessionStorage
 *
 * 
 * Read Session Storage by sessionID and userID
 * Session Storage feature only available for Gamesession
 */
@Getter
@Setter
public class AdminReadUserSessionStorage extends Operation {
    /**
     * generated field's value
     */
    private String path = "/session/v1/admin/namespaces/{namespace}/sessions/{sessionId}/storage/users/{userId}";
    private String method = "GET";
    private List<String> consumes = Arrays.asList("application/json");
    private List<String> produces = Arrays.asList("application/json");
    private String locationQuery = null;
    /**
     * fields as input parameter
     */
    private String namespace;
    private String sessionId;
    private String userId;

    /**
    * @param namespace required
    * @param sessionId required
    * @param userId required
    */
    @Builder
    // @deprecated 2022-08-29 - All args constructor may cause problems. Use builder instead.
    @Deprecated
    public AdminReadUserSessionStorage(
            String customBasePath,            String namespace,
            String sessionId,
            String userId
    )
    {
        this.namespace = namespace;
        this.sessionId = sessionId;
        this.userId = userId;
        super.customBasePath = customBasePath != null ? customBasePath : "";

        securities.add("Bearer");
    }

    @Override
    public Map<String, String> getPathParams(){
        Map<String, String> pathParams = new HashMap<>();
        if (this.namespace != null){
            pathParams.put("namespace", this.namespace);
        }
        if (this.sessionId != null){
            pathParams.put("sessionId", this.sessionId);
        }
        if (this.userId != null){
            pathParams.put("userId", this.userId);
        }
        return pathParams;
    }





    @Override
    public boolean isValid() {
        if(this.namespace == null) {
            return false;
        }
        if(this.sessionId == null) {
            return false;
        }
        if(this.userId == null) {
            return false;
        }
        return true;
    }

    public AdminReadUserSessionStorageOpResponse parseResponse(int code, String contentType, InputStream payload) throws HttpResponseException, IOException {
        final AdminReadUserSessionStorageOpResponse response = new AdminReadUserSessionStorageOpResponse();

        response.setHttpStatusCode(code);
        response.setContentType(contentType);

        if (code == 204) {
            response.setSuccess(true);
        }
        else if ((code == 200) || (code == 201)) {
            final String json = Helper.convertInputStreamToString(payload);

            response.setSuccess(true);
            response.setData(new ObjectMapper().readValue(json, new TypeReference<Map<String, ?>>() {}));
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
        else if (code == 500) {
            final String json = Helper.convertInputStreamToString(payload);
            response.setError500(new ResponseError().createFromJson(json));
            response.setError(response.getError500().translateToApiError());
        }

        return response;
    }

    /*
    public Map<String, ?> parseResponse(int code, String contentType, InputStream payload) throws HttpResponseException, IOException {
        if(code != 200){
            final String json = Helper.convertInputStreamToString(payload);
            throw new HttpResponseException(code, json);
        }
        final String json = Helper.convertInputStreamToString(payload);
        return new ObjectMapper().readValue(json, new TypeReference<Map<String, ?>>() {});
    }
    */

}