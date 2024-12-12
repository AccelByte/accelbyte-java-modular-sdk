/*
 * Copyright (c) 2024 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.csm.operations.deployment_v2;

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
import net.accelbyte.sdk.api.csm.operation_responses.deployment_v2.GetDeploymentV2OpResponse;

/**
 * GetDeploymentV2
 *
 * Required permission : `ADMIN:NAMESPACE:{namespace}:EXTEND:DEPLOYMENT [READ]`
 * 
 * Get Deployment information by given DeploymentID
 * 
 * This endpoint intended to get Deployment information.
 * 
 * Required: Valid Access Token
 */
@Getter
@Setter
public class GetDeploymentV2 extends Operation {
    /**
     * generated field's value
     */
    private String path = "/csm/v2/admin/namespaces/{namespace}/deployments/{deploymentId}";
    private String method = "GET";
    private List<String> consumes = Arrays.asList("application/json");
    private List<String> produces = Arrays.asList("application/json");
    private String locationQuery = null;
    /**
     * fields as input parameter
     */
    private String deploymentId;
    private String namespace;

    /**
    * @param deploymentId required
    * @param namespace required
    */
    @Builder
    // @deprecated 2022-08-29 - All args constructor may cause problems. Use builder instead.
    @Deprecated
    public GetDeploymentV2(
            String customBasePath,            String deploymentId,
            String namespace
    )
    {
        this.deploymentId = deploymentId;
        this.namespace = namespace;
        super.customBasePath = customBasePath != null ? customBasePath : "";

        securities.add("Bearer");
    }

    @Override
    public Map<String, String> getPathParams(){
        Map<String, String> pathParams = new HashMap<>();
        if (this.deploymentId != null){
            pathParams.put("deploymentId", this.deploymentId);
        }
        if (this.namespace != null){
            pathParams.put("namespace", this.namespace);
        }
        return pathParams;
    }





    @Override
    public boolean isValid() {
        if(this.deploymentId == null) {
            return false;
        }
        if(this.namespace == null) {
            return false;
        }
        return true;
    }

    public GetDeploymentV2OpResponse parseResponse(int code, String contentType, InputStream payload) throws HttpResponseException, IOException {
        final GetDeploymentV2OpResponse response = new GetDeploymentV2OpResponse();

        response.setHttpStatusCode(code);
        response.setContentType(contentType);

        if (code == 204) {
            response.setSuccess(true);
        }
        else if ((code == 200) || (code == 201)) {
            final String json = Helper.convertInputStreamToString(payload);
            response.setData(new ApimodelGetDeploymentListV2DataItem().createFromJson(json));
            response.setSuccess(true);
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
        else if (code == 404) {
            final String json = Helper.convertInputStreamToString(payload);
            response.setError404(new ResponseErrorResponse().createFromJson(json));
            response.setError(response.getError404().translateToApiError());
        }
        else if (code == 500) {
            final String json = Helper.convertInputStreamToString(payload);
            response.setError500(new ResponseErrorResponse().createFromJson(json));
            response.setError(response.getError500().translateToApiError());
        }

        return response;
    }

    /*
    public ApimodelGetDeploymentListV2DataItem parseResponse(int code, String contentType, InputStream payload) throws HttpResponseException, IOException {
        if(code != 200){
            final String json = Helper.convertInputStreamToString(payload);
            throw new HttpResponseException(code, json);
        }
        final String json = Helper.convertInputStreamToString(payload);
        return new ApimodelGetDeploymentListV2DataItem().createFromJson(json);
    }
    */

}