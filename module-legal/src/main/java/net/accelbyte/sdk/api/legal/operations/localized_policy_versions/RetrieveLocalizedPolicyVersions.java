/*
 * Copyright (c) 2024 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.legal.operations.localized_policy_versions;

import java.io.*;
import java.util.*;

import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import lombok.Builder;
import lombok.Getter;
import lombok.Setter;

import net.accelbyte.sdk.api.legal.models.*;
import net.accelbyte.sdk.core.Operation;
import net.accelbyte.sdk.core.HttpResponseException;
import net.accelbyte.sdk.core.util.Helper;
import net.accelbyte.sdk.core.ApiError;
import net.accelbyte.sdk.api.legal.operation_responses.localized_policy_versions.RetrieveLocalizedPolicyVersionsOpResponse;

/**
 * retrieveLocalizedPolicyVersions
 *
 * Retrieve versions of a particular country-specific policy.
 */
@Getter
@Setter
public class RetrieveLocalizedPolicyVersions extends Operation {
    /**
     * generated field's value
     */
    private String path = "/agreement/admin/localized-policy-versions/versions/{policyVersionId}";
    private String method = "GET";
    private List<String> consumes = Arrays.asList();
    private List<String> produces = Arrays.asList("application/json");
    private String locationQuery = null;
    /**
     * fields as input parameter
     */
    private String policyVersionId;

    /**
    * @param policyVersionId required
    */
    @Builder
    // @deprecated 2022-08-29 - All args constructor may cause problems. Use builder instead.
    @Deprecated
    public RetrieveLocalizedPolicyVersions(
            String customBasePath,            String policyVersionId
    )
    {
        this.policyVersionId = policyVersionId;
        super.customBasePath = customBasePath != null ? customBasePath : "";

        securities.add("Bearer");
    }

    @Override
    public Map<String, String> getPathParams(){
        Map<String, String> pathParams = new HashMap<>();
        if (this.policyVersionId != null){
            pathParams.put("policyVersionId", this.policyVersionId);
        }
        return pathParams;
    }





    @Override
    public boolean isValid() {
        if(this.policyVersionId == null) {
            return false;
        }
        return true;
    }

    public RetrieveLocalizedPolicyVersionsOpResponse parseResponse(int code, String contentType, InputStream payload) throws HttpResponseException, IOException {
        final RetrieveLocalizedPolicyVersionsOpResponse response = new RetrieveLocalizedPolicyVersionsOpResponse();

        response.setHttpStatusCode(code);
        response.setContentType(contentType);

        if (code == 204) {
            response.setSuccess(true);
        }
        else if ((code == 200) || (code == 201)) {
            final String json = Helper.convertInputStreamToString(payload);

            response.setSuccess(true);
            response.setData(new ObjectMapper().readValue(json, new TypeReference<List<RetrieveLocalizedPolicyVersionResponse>>() {}));
        }

        return response;
    }

    /*
    public List<RetrieveLocalizedPolicyVersionResponse> parseResponse(int code, String contentType, InputStream payload) throws HttpResponseException, IOException {
        if(code != 200){
            final String json = Helper.convertInputStreamToString(payload);
            throw new HttpResponseException(code, json);
        }
        final String json = Helper.convertInputStreamToString(payload);
        return new ObjectMapper().readValue(json, new TypeReference<List<RetrieveLocalizedPolicyVersionResponse>>() {});
    }
    */

}