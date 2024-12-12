/*
 * Copyright (c) 2024 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.csm.operations.deployment;

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
import net.accelbyte.sdk.api.csm.operation_responses.deployment.CreateDeploymentV1OpResponse;

/**
 * CreateDeploymentV1
 *
 * Required permission : `ADMIN:NAMESPACE:{namespace}:EXTEND:DEPLOYMENT [CREATE]`
 * 
 * Creates Deployment for extend service
 * 
 * This endpoint intended to apply the helm release or deploying the custom service image.
 * Logic in this endpoint:
 * - Getting the repo from AppHistory table and image tag from request
 * - Getting the Helm Manifest template from S3
 * - Filling the Helm Manifest values
 * - Installing the Helm Manifest to deploy the custom service image into K8s based on given namespace
 * - Storing the filled Helm Manifest to S3
 * - Storing the Deployment information to Database
 * 
 * Required: Valid Access Token
 *
 * @deprecated
 */
@Deprecated
@Getter
@Setter
public class CreateDeploymentV1 extends Operation {
    /**
     * generated field's value
     */
    private String path = "/csm/v1/admin/namespaces/{namespace}/apps/{app}/deployments";
    private String method = "POST";
    private List<String> consumes = Arrays.asList("application/json");
    private List<String> produces = Arrays.asList("application/json");
    private String locationQuery = null;
    /**
     * fields as input parameter
     */
    private String app;
    private String namespace;
    private GeneratedCreateDeploymentV1Request body;

    /**
    * @param app required
    * @param namespace required
    * @param body required
    */
    @Builder
    // @deprecated 2022-08-29 - All args constructor may cause problems. Use builder instead.
    @Deprecated
    public CreateDeploymentV1(
            String customBasePath,            String app,
            String namespace,
            GeneratedCreateDeploymentV1Request body
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
    public GeneratedCreateDeploymentV1Request getBodyParams(){
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

    public CreateDeploymentV1OpResponse parseResponse(int code, String contentType, InputStream payload) throws HttpResponseException, IOException {
        final CreateDeploymentV1OpResponse response = new CreateDeploymentV1OpResponse();

        response.setHttpStatusCode(code);
        response.setContentType(contentType);

        if (code == 204) {
            response.setSuccess(true);
        }
        else if ((code == 200) || (code == 201)) {
            final String json = Helper.convertInputStreamToString(payload);
            response.setData(new GeneratedCreateDeploymentV1Response().createFromJson(json));
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
    public GeneratedCreateDeploymentV1Response parseResponse(int code, String contentType, InputStream payload) throws HttpResponseException, IOException {
        if(code != 201){
            final String json = Helper.convertInputStreamToString(payload);
            throw new HttpResponseException(code, json);
        }
        final String json = Helper.convertInputStreamToString(payload);
        return new GeneratedCreateDeploymentV1Response().createFromJson(json);
    }
    */

}