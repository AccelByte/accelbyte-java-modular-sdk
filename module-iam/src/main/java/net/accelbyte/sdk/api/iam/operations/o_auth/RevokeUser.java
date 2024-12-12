/*
 * Copyright (c) 2024 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.iam.operations.o_auth;

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
import net.accelbyte.sdk.api.iam.operation_responses.o_auth.RevokeUserOpResponse;

/**
 * RevokeUser
 *
 * ## The endpoint is going to be deprecated
 * This endpoint requires all requests to have authorization header set with bearer token.
 * 
 * The endpoint revokes all access tokens and refresh tokens a user has prior the revocation time. It is a convenient feature for the developer (or admin) who wanted to revokes all user's access tokens and refresh tokens generated before some period of time.
 * ### Endpoint migration guide
 * - **Substitute endpoint: _/iam/v3/oauth/admin/namespaces/{namespace}/users/{userId}/revoke [POST]_**
 *
 * @deprecated
 */
@Deprecated
@Getter
@Setter
public class RevokeUser extends Operation {
    /**
     * generated field's value
     */
    private String path = "/iam/oauth/namespaces/{namespace}/users/{userId}/revoke";
    private String method = "POST";
    private List<String> consumes = Arrays.asList("application/json");
    private List<String> produces = Arrays.asList("application/json");
    private String locationQuery = null;
    /**
     * fields as input parameter
     */
    private String namespace;
    private String userId;

    /**
    * @param namespace required
    * @param userId required
    */
    @Builder
    // @deprecated 2022-08-29 - All args constructor may cause problems. Use builder instead.
    @Deprecated
    public RevokeUser(
            String customBasePath,            String namespace,
            String userId
    )
    {
        this.namespace = namespace;
        this.userId = userId;
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
    public boolean isValid() {
        if(this.namespace == null) {
            return false;
        }
        if(this.userId == null) {
            return false;
        }
        return true;
    }

    public RevokeUserOpResponse parseResponse(int code, String contentType, InputStream payload) throws HttpResponseException, IOException {
        final RevokeUserOpResponse response = new RevokeUserOpResponse();

        response.setHttpStatusCode(code);
        response.setContentType(contentType);

        if (code == 204) {
            response.setSuccess(true);
        }
        else if (code == 401) {
            final String data = Helper.convertInputStreamToString(payload);
            response.setError401(data);
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