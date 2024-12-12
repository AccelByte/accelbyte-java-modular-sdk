/*
 * Copyright (c) 2024 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.legal.operations.base_legal_policies;

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
import net.accelbyte.sdk.api.legal.operation_responses.base_legal_policies.RetrieveSinglePolicyOpResponse;

/**
 * retrieveSinglePolicy
 *
 * Retrieve a base policy.
 */
@Getter
@Setter
public class RetrieveSinglePolicy extends Operation {
    /**
     * generated field's value
     */
    private String path = "/agreement/admin/base-policies/{basePolicyId}";
    private String method = "GET";
    private List<String> consumes = Arrays.asList();
    private List<String> produces = Arrays.asList("application/json");
    private String locationQuery = null;
    /**
     * fields as input parameter
     */
    private String basePolicyId;

    /**
    * @param basePolicyId required
    */
    @Builder
    // @deprecated 2022-08-29 - All args constructor may cause problems. Use builder instead.
    @Deprecated
    public RetrieveSinglePolicy(
            String customBasePath,            String basePolicyId
    )
    {
        this.basePolicyId = basePolicyId;
        super.customBasePath = customBasePath != null ? customBasePath : "";

        securities.add("Bearer");
    }

    @Override
    public Map<String, String> getPathParams(){
        Map<String, String> pathParams = new HashMap<>();
        if (this.basePolicyId != null){
            pathParams.put("basePolicyId", this.basePolicyId);
        }
        return pathParams;
    }





    @Override
    public boolean isValid() {
        if(this.basePolicyId == null) {
            return false;
        }
        return true;
    }

    public RetrieveSinglePolicyOpResponse parseResponse(int code, String contentType, InputStream payload) throws HttpResponseException, IOException {
        final RetrieveSinglePolicyOpResponse response = new RetrieveSinglePolicyOpResponse();

        response.setHttpStatusCode(code);
        response.setContentType(contentType);

        if (code == 204) {
            response.setSuccess(true);
        }
        else if ((code == 200) || (code == 201)) {
            final String json = Helper.convertInputStreamToString(payload);
            response.setData(new RetrieveBasePolicyResponse().createFromJson(json));
            response.setSuccess(true);
        }
        else if (code == 404) {
            final String json = Helper.convertInputStreamToString(payload);
            response.setError404(new ErrorEntity().createFromJson(json));
            response.setError(response.getError404().translateToApiError());
        }

        return response;
    }

    /*
    public RetrieveBasePolicyResponse parseResponse(int code, String contentType, InputStream payload) throws HttpResponseException, IOException {
        if(code != 200){
            final String json = Helper.convertInputStreamToString(payload);
            throw new HttpResponseException(code, json);
        }
        final String json = Helper.convertInputStreamToString(payload);
        return new RetrieveBasePolicyResponse().createFromJson(json);
    }
    */

}