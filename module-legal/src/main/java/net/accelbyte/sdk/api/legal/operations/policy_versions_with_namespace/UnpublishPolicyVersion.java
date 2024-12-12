/*
 * Copyright (c) 2024 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.legal.operations.policy_versions_with_namespace;

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
import net.accelbyte.sdk.api.legal.operation_responses.policy_versions_with_namespace.UnpublishPolicyVersionOpResponse;

/**
 * unpublishPolicyVersion
 *
 * Un-publish a policy version from policy.Can only be un-publish if match these criteria:
 * 
 * 
 *   * Policy version has never been accepted by any user
 */
@Getter
@Setter
public class UnpublishPolicyVersion extends Operation {
    /**
     * generated field's value
     */
    private String path = "/agreement/admin/namespaces/{namespace}/policies/versions/{policyVersionId}/unpublish";
    private String method = "PATCH";
    private List<String> consumes = Arrays.asList();
    private List<String> produces = Arrays.asList("application/json");
    private String locationQuery = null;
    /**
     * fields as input parameter
     */
    private String namespace;
    private String policyVersionId;

    /**
    * @param namespace required
    * @param policyVersionId required
    */
    @Builder
    // @deprecated 2022-08-29 - All args constructor may cause problems. Use builder instead.
    @Deprecated
    public UnpublishPolicyVersion(
            String customBasePath,            String namespace,
            String policyVersionId
    )
    {
        this.namespace = namespace;
        this.policyVersionId = policyVersionId;
        super.customBasePath = customBasePath != null ? customBasePath : "";

        securities.add("Bearer");
    }

    @Override
    public Map<String, String> getPathParams(){
        Map<String, String> pathParams = new HashMap<>();
        if (this.namespace != null){
            pathParams.put("namespace", this.namespace);
        }
        if (this.policyVersionId != null){
            pathParams.put("policyVersionId", this.policyVersionId);
        }
        return pathParams;
    }





    @Override
    public boolean isValid() {
        if(this.namespace == null) {
            return false;
        }
        if(this.policyVersionId == null) {
            return false;
        }
        return true;
    }

    public UnpublishPolicyVersionOpResponse parseResponse(int code, String contentType, InputStream payload) throws HttpResponseException, IOException {
        final UnpublishPolicyVersionOpResponse response = new UnpublishPolicyVersionOpResponse();

        response.setHttpStatusCode(code);
        response.setContentType(contentType);

        if (code == 204) {
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
        if(code != 204){
            final String json = Helper.convertInputStreamToString(payload);
            throw new HttpResponseException(code, json);
        }
    }
    */

}