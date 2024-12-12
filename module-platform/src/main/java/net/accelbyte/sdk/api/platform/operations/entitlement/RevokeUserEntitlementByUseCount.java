/*
 * Copyright (c) 2024 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.platform.operations.entitlement;

import java.io.*;
import java.util.*;

import lombok.Builder;
import lombok.Getter;
import lombok.Setter;

import net.accelbyte.sdk.api.platform.models.*;
import net.accelbyte.sdk.core.Operation;
import net.accelbyte.sdk.core.HttpResponseException;
import net.accelbyte.sdk.core.util.Helper;
import net.accelbyte.sdk.core.ApiError;
import net.accelbyte.sdk.api.platform.operation_responses.entitlement.RevokeUserEntitlementByUseCountOpResponse;

/**
 * revokeUserEntitlementByUseCount
 *
 * Revoke specified count of user entitlement.
 * Other detail info:
 * 
 *   * Returns : The revoked entitlement
 */
@Getter
@Setter
public class RevokeUserEntitlementByUseCount extends Operation {
    /**
     * generated field's value
     */
    private String path = "/platform/admin/namespaces/{namespace}/users/{userId}/entitlements/{entitlementId}/revoke/byUseCount";
    private String method = "POST";
    private List<String> consumes = Arrays.asList("application/json");
    private List<String> produces = Arrays.asList("application/json");
    private String locationQuery = null;
    /**
     * fields as input parameter
     */
    private String entitlementId;
    private String namespace;
    private String userId;
    private RevokeUseCountRequest body;

    /**
    * @param entitlementId required
    * @param namespace required
    * @param userId required
    * @param body required
    */
    @Builder
    // @deprecated 2022-08-29 - All args constructor may cause problems. Use builder instead.
    @Deprecated
    public RevokeUserEntitlementByUseCount(
            String customBasePath,            String entitlementId,
            String namespace,
            String userId,
            RevokeUseCountRequest body
    )
    {
        this.entitlementId = entitlementId;
        this.namespace = namespace;
        this.userId = userId;
        this.body = body;
        super.customBasePath = customBasePath != null ? customBasePath : "";

        securities.add("Bearer");
    }

    @Override
    public Map<String, String> getPathParams(){
        Map<String, String> pathParams = new HashMap<>();
        if (this.entitlementId != null){
            pathParams.put("entitlementId", this.entitlementId);
        }
        if (this.namespace != null){
            pathParams.put("namespace", this.namespace);
        }
        if (this.userId != null){
            pathParams.put("userId", this.userId);
        }
        return pathParams;
    }



    @Override
    public RevokeUseCountRequest getBodyParams(){
        return this.body;
    }


    @Override
    public boolean isValid() {
        if(this.entitlementId == null) {
            return false;
        }
        if(this.namespace == null) {
            return false;
        }
        if(this.userId == null) {
            return false;
        }
        if(this.body == null) {
            return false;
        }
        return true;
    }

    public RevokeUserEntitlementByUseCountOpResponse parseResponse(int code, String contentType, InputStream payload) throws HttpResponseException, IOException {
        final RevokeUserEntitlementByUseCountOpResponse response = new RevokeUserEntitlementByUseCountOpResponse();

        response.setHttpStatusCode(code);
        response.setContentType(contentType);

        if (code == 204) {
            response.setSuccess(true);
        }
        else if ((code == 200) || (code == 201)) {
            final String json = Helper.convertInputStreamToString(payload);
            response.setData(new EntitlementIfc().createFromJson(json));
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
    public EntitlementIfc parseResponse(int code, String contentType, InputStream payload) throws HttpResponseException, IOException {
        if(code != 200){
            final String json = Helper.convertInputStreamToString(payload);
            throw new HttpResponseException(code, json);
        }
        final String json = Helper.convertInputStreamToString(payload);
        return new EntitlementIfc().createFromJson(json);
    }
    */

}