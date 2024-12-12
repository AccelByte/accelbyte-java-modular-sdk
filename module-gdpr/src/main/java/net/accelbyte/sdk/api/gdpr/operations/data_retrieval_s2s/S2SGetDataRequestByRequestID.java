/*
 * Copyright (c) 2024 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.gdpr.operations.data_retrieval_s2s;

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
import net.accelbyte.sdk.api.gdpr.operation_responses.data_retrieval_s2s.S2SGetDataRequestByRequestIDOpResponse;

/**
 * S2SGetDataRequestByRequestID
 *
 * Scope: account
 * 
 * Get Personal Data Request by Request Id.
 * If the request has been completed, it will return a download url for the data package.
 * 
 * ---
 * ## This API for S2S integration purpose only
 */
@Getter
@Setter
public class S2SGetDataRequestByRequestID extends Operation {
    /**
     * generated field's value
     */
    private String path = "/gdpr/s2s/namespaces/{namespace}/requests/{requestId}";
    private String method = "GET";
    private List<String> consumes = Arrays.asList("application/json");
    private List<String> produces = Arrays.asList("application/json");
    private String locationQuery = null;
    /**
     * fields as input parameter
     */
    private String namespace;
    private String requestId;

    /**
    * @param namespace required
    * @param requestId required
    */
    @Builder
    // @deprecated 2022-08-29 - All args constructor may cause problems. Use builder instead.
    @Deprecated
    public S2SGetDataRequestByRequestID(
            String customBasePath,            String namespace,
            String requestId
    )
    {
        this.namespace = namespace;
        this.requestId = requestId;
        super.customBasePath = customBasePath != null ? customBasePath : "";

        securities.add("Bearer");
    }

    @Override
    public Map<String, String> getPathParams(){
        Map<String, String> pathParams = new HashMap<>();
        if (this.namespace != null){
            pathParams.put("namespace", this.namespace);
        }
        if (this.requestId != null){
            pathParams.put("requestId", this.requestId);
        }
        return pathParams;
    }





    @Override
    public boolean isValid() {
        if(this.namespace == null) {
            return false;
        }
        if(this.requestId == null) {
            return false;
        }
        return true;
    }

    public S2SGetDataRequestByRequestIDOpResponse parseResponse(int code, String contentType, InputStream payload) throws HttpResponseException, IOException {
        final S2SGetDataRequestByRequestIDOpResponse response = new S2SGetDataRequestByRequestIDOpResponse();

        response.setHttpStatusCode(code);
        response.setContentType(contentType);

        if (code == 204) {
            response.setSuccess(true);
        }
        else if ((code == 200) || (code == 201)) {
            final String json = Helper.convertInputStreamToString(payload);
            response.setData(new DtoS2SDataRequestSummary().createFromJson(json));
            response.setSuccess(true);
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
    public DtoS2SDataRequestSummary parseResponse(int code, String contentType, InputStream payload) throws HttpResponseException, IOException {
        if(code != 200){
            final String json = Helper.convertInputStreamToString(payload);
            throw new HttpResponseException(code, json);
        }
        final String json = Helper.convertInputStreamToString(payload);
        return new DtoS2SDataRequestSummary().createFromJson(json);
    }
    */

}