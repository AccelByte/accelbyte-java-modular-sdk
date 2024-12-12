/*
 * Copyright (c) 2024 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.legal.operations.policies;

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
import net.accelbyte.sdk.api.legal.operation_responses.policies.RetrieveLatestPoliciesPublicOpResponse;

/**
 * retrieveLatestPoliciesPublic
 *
 * Retrieve all active latest policies based on a namespace and country. The country will be read from user token.
 * Other detail info:
 * 
 *   * Leave the policyType empty if you want to be responded with all policy type
 *   *  Fill the tags if you want to filter the responded policy by tags
 *   *  Fill the defaultOnEmpty with true if you want to be responded with default country-specific policy if your requested country is not exist
 *   *  Fill the alwaysIncludeDefault with true if you want to be responded with always include default policy. If there are duplicate policies (default policies and country specific policies with same base policy) it'll include policy with same country code, for example:
 *     * Document 1 (default): Region US (default), UA
 *     * Document 2 (default): Region US (default)
 *     * Document 3 (default): Region US (default)
 *     * User: Region UA
 *     * Query: alwaysIncludeDefault: true
 *     * Response: Document 1 (UA), Document 2 (US), Document 3 (US)
 */
@Getter
@Setter
public class RetrieveLatestPoliciesPublic extends Operation {
    /**
     * generated field's value
     */
    private String path = "/agreement/public/policies/namespaces/{namespace}";
    private String method = "GET";
    private List<String> consumes = Arrays.asList();
    private List<String> produces = Arrays.asList("application/json");
    private String locationQuery = null;
    /**
     * fields as input parameter
     */
    private String namespace;
    private Boolean alwaysIncludeDefault;
    private Boolean defaultOnEmpty;
    private String policyType;
    private String tags;
    private Boolean visibleOnly;

    /**
    * @param namespace required
    */
    @Builder
    // @deprecated 2022-08-29 - All args constructor may cause problems. Use builder instead.
    @Deprecated
    public RetrieveLatestPoliciesPublic(
            String customBasePath,            String namespace,
            Boolean alwaysIncludeDefault,
            Boolean defaultOnEmpty,
            String policyType,
            String tags,
            Boolean visibleOnly
    )
    {
        this.namespace = namespace;
        this.alwaysIncludeDefault = alwaysIncludeDefault;
        this.defaultOnEmpty = defaultOnEmpty;
        this.policyType = policyType;
        this.tags = tags;
        this.visibleOnly = visibleOnly;
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
        queryParams.put("alwaysIncludeDefault", this.alwaysIncludeDefault == null ? null : Arrays.asList(String.valueOf(this.alwaysIncludeDefault)));
        queryParams.put("defaultOnEmpty", this.defaultOnEmpty == null ? null : Arrays.asList(String.valueOf(this.defaultOnEmpty)));
        queryParams.put("policyType", this.policyType == null ? null : Arrays.asList(this.policyType));
        queryParams.put("tags", this.tags == null ? null : Arrays.asList(this.tags));
        queryParams.put("visibleOnly", this.visibleOnly == null ? null : Arrays.asList(String.valueOf(this.visibleOnly)));
        return queryParams;
    }




    @Override
    public boolean isValid() {
        if(this.namespace == null) {
            return false;
        }
        return true;
    }

    public RetrieveLatestPoliciesPublicOpResponse parseResponse(int code, String contentType, InputStream payload) throws HttpResponseException, IOException {
        final RetrieveLatestPoliciesPublicOpResponse response = new RetrieveLatestPoliciesPublicOpResponse();

        response.setHttpStatusCode(code);
        response.setContentType(contentType);

        if (code == 204) {
            response.setSuccess(true);
        }
        else if ((code == 200) || (code == 201)) {
            final String json = Helper.convertInputStreamToString(payload);

            response.setSuccess(true);
            response.setData(new ObjectMapper().readValue(json, new TypeReference<List<RetrievePolicyPublicResponse>>() {}));
        }
        else if (code == 404) {
            final String json = Helper.convertInputStreamToString(payload);
            response.setError404(new ErrorEntity().createFromJson(json));
            response.setError(response.getError404().translateToApiError());
        }

        return response;
    }

    /*
    public List<RetrievePolicyPublicResponse> parseResponse(int code, String contentType, InputStream payload) throws HttpResponseException, IOException {
        if(code != 200){
            final String json = Helper.convertInputStreamToString(payload);
            throw new HttpResponseException(code, json);
        }
        final String json = Helper.convertInputStreamToString(payload);
        return new ObjectMapper().readValue(json, new TypeReference<List<RetrievePolicyPublicResponse>>() {});
    }
    */

    @Override
    protected Map<String, String> getCollectionFormatMap() {
        Map<String, String> result = new HashMap<>();
        result.put("alwaysIncludeDefault", "None");
        result.put("defaultOnEmpty", "None");
        result.put("policyType", "None");
        result.put("tags", "None");
        result.put("visibleOnly", "None");
        return result;
    }
    public enum PolicyType {
        LEGALDOCUMENTTYPE("LEGAL_DOCUMENT_TYPE"),
        MARKETINGPREFERENCETYPE("MARKETING_PREFERENCE_TYPE");

        private String value;

        PolicyType(String value){
            this.value = value;
        }

        @Override
        public String toString() {
            return this.value;
        }
    }


    public static class RetrieveLatestPoliciesPublicBuilder {
        private String policyType;


        public RetrieveLatestPoliciesPublicBuilder policyType(final String policyType) {
            this.policyType = policyType;
            return this;
        }

        public RetrieveLatestPoliciesPublicBuilder policyTypeFromEnum(final PolicyType policyType) {
            this.policyType = policyType.toString();
            return this;
        }
    }
}