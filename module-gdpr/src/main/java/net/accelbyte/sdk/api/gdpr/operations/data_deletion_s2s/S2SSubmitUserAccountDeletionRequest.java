/*
 * Copyright (c) 2024 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.gdpr.operations.data_deletion_s2s;

import java.io.*;
import java.util.*;

import lombok.Builder;
import lombok.Getter;
import lombok.Setter;

import net.accelbyte.sdk.api.gdpr.models.*;
import net.accelbyte.sdk.core.Operation;
import net.accelbyte.sdk.core.HttpResponseException;
import net.accelbyte.sdk.core.util.Helper;
import net.accelbyte.sdk.core.ApiError;
import net.accelbyte.sdk.api.gdpr.operation_responses.data_deletion_s2s.S2SSubmitUserAccountDeletionRequestOpResponse;

/**
 * S2SSubmitUserAccountDeletionRequest
 *
 * Scope: account
 * 
 * Submit user's account deletion request.
 * 
 * **Limitation:** This API only accepts requests with a publisher userId and does not support game userId requests at this time.
 * 
 * ---
 * ## This API for S2S integration purpose only
 * 
 * **Notes:**
 * 
 * 1. This API will **not send GDPR email notification** both for player and admin notification.
 * 2. This API will **perform account deletion immediately** without GDPR grace period (i.e. 28 days grace period).
 */
@Getter
@Setter
public class S2SSubmitUserAccountDeletionRequest extends Operation {
    /**
     * generated field's value
     */
    private String path = "/gdpr/s2s/namespaces/{namespace}/users/{userId}/deletions";
    private String method = "POST";
    private List<String> consumes = Arrays.asList("*/*");
    private List<String> produces = Arrays.asList("application/json");
    private String locationQuery = null;
    /**
     * fields as input parameter
     */
    private String namespace;
    private String userId;

    /**
    * @param namespace required
    * @param userId required
    */
    @Builder
    // @deprecated 2022-08-29 - All args constructor may cause problems. Use builder instead.
    @Deprecated
    public S2SSubmitUserAccountDeletionRequest(
            String customBasePath,            String namespace,
            String userId
    )
    {
        this.namespace = namespace;
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
        if(this.userId == null) {
            return false;
        }
        return true;
    }

    public S2SSubmitUserAccountDeletionRequestOpResponse parseResponse(int code, String contentType, InputStream payload) throws HttpResponseException, IOException {
        final S2SSubmitUserAccountDeletionRequestOpResponse response = new S2SSubmitUserAccountDeletionRequestOpResponse();

        response.setHttpStatusCode(code);
        response.setContentType(contentType);

        if (code == 204) {
            response.setSuccess(true);
        }
        else if ((code == 200) || (code == 201)) {
            final String json = Helper.convertInputStreamToString(payload);
            response.setData(new ModelsS2SRequestDeleteResponse().createFromJson(json));
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

        return response;
    }

    /*
    public ModelsS2SRequestDeleteResponse parseResponse(int code, String contentType, InputStream payload) throws HttpResponseException, IOException {
        if(code != 201){
            final String json = Helper.convertInputStreamToString(payload);
            throw new HttpResponseException(code, json);
        }
        final String json = Helper.convertInputStreamToString(payload);
        return new ModelsS2SRequestDeleteResponse().createFromJson(json);
    }
    */

}