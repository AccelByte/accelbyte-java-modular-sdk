/*
 * Copyright (c) 2024 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.dsartifact.operations.artifact_upload_process_queue;

import java.io.*;
import java.util.*;

import lombok.Builder;
import lombok.Getter;
import lombok.Setter;

import net.accelbyte.sdk.api.dsartifact.models.*;
import net.accelbyte.sdk.core.Operation;
import net.accelbyte.sdk.core.HttpResponseException;
import net.accelbyte.sdk.core.util.Helper;
import net.accelbyte.sdk.core.ApiError;
import net.accelbyte.sdk.api.dsartifact.operation_responses.artifact_upload_process_queue.DeleteQueueOpResponse;

/**
 * deleteQueue
 *
 * Required permission: ADMIN:NAMESPACE:{namespace}:DSAM:ARTIFACT:QUEUE [DELETE]
 * 
 * Required scope: social
 * 
 * This endpoint will delete a queue entry
 */
@Getter
@Setter
public class DeleteQueue extends Operation {
    /**
     * generated field's value
     */
    private String path = "/dsartifact/namespaces/{namespace}/artifacts/queues";
    private String method = "DELETE";
    private List<String> consumes = Arrays.asList("application/json");
    private List<String> produces = Arrays.asList("application/json","text/x-log");
    private String locationQuery = null;
    /**
     * fields as input parameter
     */
    private String namespace;
    private String nodeIP;
    private String podName;

    /**
    * @param namespace required
    * @param nodeIP required
    * @param podName required
    */
    @Builder
    // @deprecated 2022-08-29 - All args constructor may cause problems. Use builder instead.
    @Deprecated
    public DeleteQueue(
            String customBasePath,            String namespace,
            String nodeIP,
            String podName
    )
    {
        this.namespace = namespace;
        this.nodeIP = nodeIP;
        this.podName = podName;
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
    public Map<String, List<String>> getQueryParams(){
        Map<String, List<String>> queryParams = new HashMap<>();
        queryParams.put("nodeIP", this.nodeIP == null ? null : Arrays.asList(this.nodeIP));
        queryParams.put("podName", this.podName == null ? null : Arrays.asList(this.podName));
        return queryParams;
    }




    @Override
    public boolean isValid() {
        if(this.namespace == null) {
            return false;
        }
        if(this.nodeIP == null) {
            return false;
        }
        if(this.podName == null) {
            return false;
        }
        return true;
    }

    public DeleteQueueOpResponse parseResponse(int code, String contentType, InputStream payload) throws HttpResponseException, IOException {
        final DeleteQueueOpResponse response = new DeleteQueueOpResponse();

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

    @Override
    protected Map<String, String> getCollectionFormatMap() {
        Map<String, String> result = new HashMap<>();
        result.put("nodeIP", "None");
        result.put("podName", "None");
        return result;
    }
}