/*
 * Copyright (c) 2024 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.legal.operations.policies_with_namespace;

import java.io.*;
import java.util.*;

import lombok.Builder;
import lombok.Getter;
import lombok.Setter;

import net.accelbyte.sdk.api.legal.models.*;
import net.accelbyte.sdk.core.Operation;
import net.accelbyte.sdk.core.HttpResponseException;
import net.accelbyte.sdk.core.util.Helper;
import net.accelbyte.sdk.core.ApiError;
import net.accelbyte.sdk.api.legal.operation_responses.policies_with_namespace.UpdatePolicy1OpResponse;

/**
 * updatePolicy_1
 *
 * Update country-specific and country-group policy.
 */
@Getter
@Setter
public class UpdatePolicy1 extends Operation {
    /**
     * generated field's value
     */
    private String path = "/agreement/admin/namespaces/{namespace}/policies/{policyId}";
    private String method = "PATCH";
    private List<String> consumes = Arrays.asList("application/json");
    private List<String> produces = Arrays.asList("application/json");
    private String locationQuery = null;
    /**
     * fields as input parameter
     */
    private String namespace;
    private String policyId;
    private UpdatePolicyRequest body;

    /**
    * @param namespace required
    * @param policyId required
    */
    @Builder
    // @deprecated 2022-08-29 - All args constructor may cause problems. Use builder instead.
    @Deprecated
    public UpdatePolicy1(
            String customBasePath,            String namespace,
            String policyId,
            UpdatePolicyRequest body
    )
    {
        this.namespace = namespace;
        this.policyId = policyId;
        this.body = body;
        super.customBasePath = customBasePath != null ? customBasePath : "";

        securities.add("Bearer");
    }

    @Override
    public Map<String, String> getPathParams(){
        Map<String, String> pathParams = new HashMap<>();
        if (this.namespace != null){
            pathParams.put("namespace", this.namespace);
        }
        if (this.policyId != null){
            pathParams.put("policyId", this.policyId);
        }
        return pathParams;
    }



    @Override
    public UpdatePolicyRequest getBodyParams(){
        return this.body;
    }


    @Override
    public boolean isValid() {
        if(this.namespace == null) {
            return false;
        }
        if(this.policyId == null) {
            return false;
        }
        return true;
    }

    public UpdatePolicy1OpResponse parseResponse(int code, String contentType, InputStream payload) throws HttpResponseException, IOException {
        final UpdatePolicy1OpResponse response = new UpdatePolicy1OpResponse();

        response.setHttpStatusCode(code);
        response.setContentType(contentType);

        if (code == 204) {
            response.setSuccess(true);
        }
        else if ((code == 200) || (code == 201) || (code == 202)) {
            response.setSuccess(true);
        }
        else if (code == 400) {
            final String json = Helper.convertInputStreamToString(payload);
            response.setError400(new ErrorEntity().createFromJson(json));
            response.setError(response.getError400().translateToApiError());
        }

        return response;
    }

    /*
    public void handleEmptyResponse(int code, String contentType, InputStream payload) throws HttpResponseException, IOException {
        if(code != 200){
            final String json = Helper.convertInputStreamToString(payload);
            throw new HttpResponseException(code, json);
        }
    }
    */

}