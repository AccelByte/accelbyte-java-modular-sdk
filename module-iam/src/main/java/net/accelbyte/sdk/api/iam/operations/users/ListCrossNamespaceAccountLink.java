/*
 * Copyright (c) 2024 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.iam.operations.users;

import java.io.*;
import java.util.*;

import lombok.Builder;
import lombok.Getter;
import lombok.Setter;

import net.accelbyte.sdk.api.iam.models.*;
import net.accelbyte.sdk.core.Operation;
import net.accelbyte.sdk.core.HttpResponseException;
import net.accelbyte.sdk.core.util.Helper;
import net.accelbyte.sdk.core.ApiError;
import net.accelbyte.sdk.api.iam.operation_responses.users.ListCrossNamespaceAccountLinkOpResponse;

/**
 * ListCrossNamespaceAccountLink
 *
 * ## The endpoint is going to be deprecated
 * ### Endpoint migration guide
 * - **Substitute endpoint: _/iam/v3/public/namespaces/{namespace}/users/me/platforms/{platformId} [POST]_**
 * 
 * Access token from original namespace is needed as authorization header. Access token from designated account needed as form parameter to verify the ownership of that account.
 * When platformID (device platfom ID) is specified, platform login method for that specific platform ID is removed.
 * This means to protect account from second hand device usage.
 *
 * @deprecated
 */
@Deprecated
@Getter
@Setter
public class ListCrossNamespaceAccountLink extends Operation {
    /**
     * generated field's value
     */
    private String path = "/iam/namespaces/{namespace}/users/{userId}/crosslink";
    private String method = "POST";
    private List<String> consumes = Arrays.asList("application/x-www-form-urlencoded");
    private List<String> produces = Arrays.asList("application/json");
    private String locationQuery = null;
    /**
     * fields as input parameter
     */
    private String namespace;
    private String userId;
    private String platformId;
    private String linkingToken;

    /**
    * @param namespace required
    * @param userId required
    * @param linkingToken required
    */
    @Builder
    // @deprecated 2022-08-29 - All args constructor may cause problems. Use builder instead.
    @Deprecated
    public ListCrossNamespaceAccountLink(
            String customBasePath,            String namespace,
            String userId,
            String platformId,
            String linkingToken
    )
    {
        this.namespace = namespace;
        this.userId = userId;
        this.platformId = platformId;
        this.linkingToken = linkingToken;
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
    public Map<String, Object> getFormParams(){
        Map<String, Object> formDataParams = new HashMap<>();
        if (this.platformId != null) {
            formDataParams.put("platformId", this.platformId);
        }
        if (this.linkingToken != null) {
            formDataParams.put("linkingToken", this.linkingToken);
        }
        return formDataParams;
    }

    @Override
    public boolean isValid() {
        if(this.namespace == null) {
            return false;
        }
        if(this.userId == null) {
            return false;
        }
        if(this.linkingToken == null) {
            return false;
        }
        return true;
    }

    public ListCrossNamespaceAccountLinkOpResponse parseResponse(int code, String contentType, InputStream payload) throws HttpResponseException, IOException {
        final ListCrossNamespaceAccountLinkOpResponse response = new ListCrossNamespaceAccountLinkOpResponse();

        response.setHttpStatusCode(code);
        response.setContentType(contentType);

        if (code == 204) {
            response.setSuccess(true);
        }
        else if (code == 400) {
            final String json = Helper.convertInputStreamToString(payload);
            response.setError400(new RestErrorResponse().createFromJson(json));
            response.setError(response.getError400().translateToApiError());
        }
        else if (code == 401) {
            final String json = Helper.convertInputStreamToString(payload);
            response.setError401(new RestErrorResponse().createFromJson(json));
            response.setError(response.getError401().translateToApiError());
        }
        else if (code == 403) {
            final String json = Helper.convertInputStreamToString(payload);
            response.setError403(new RestErrorResponse().createFromJson(json));
            response.setError(response.getError403().translateToApiError());
        }
        else if (code == 404) {
            final String data = Helper.convertInputStreamToString(payload);
            response.setError404(data);
            response.setError(new ApiError("-1", data));
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