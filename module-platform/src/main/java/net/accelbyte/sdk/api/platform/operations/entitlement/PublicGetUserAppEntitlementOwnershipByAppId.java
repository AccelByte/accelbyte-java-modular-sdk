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
import net.accelbyte.sdk.api.platform.operation_responses.entitlement.PublicGetUserAppEntitlementOwnershipByAppIdOpResponse;

/**
 * publicGetUserAppEntitlementOwnershipByAppId
 *
 * Get user app entitlement ownership by appId.
 */
@Getter
@Setter
public class PublicGetUserAppEntitlementOwnershipByAppId extends Operation {
    /**
     * generated field's value
     */
    private String path = "/platform/public/namespaces/{namespace}/users/{userId}/entitlements/ownership/byAppId";
    private String method = "GET";
    private List<String> consumes = Arrays.asList();
    private List<String> produces = Arrays.asList("application/json");
    private String locationQuery = null;
    /**
     * fields as input parameter
     */
    private String namespace;
    private String userId;
    private String appId;

    /**
    * @param namespace required
    * @param userId required
    * @param appId required
    */
    @Builder
    // @deprecated 2022-08-29 - All args constructor may cause problems. Use builder instead.
    @Deprecated
    public PublicGetUserAppEntitlementOwnershipByAppId(
            String customBasePath,            String namespace,
            String userId,
            String appId
    )
    {
        this.namespace = namespace;
        this.userId = userId;
        this.appId = appId;
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
    public Map<String, List<String>> getQueryParams(){
        Map<String, List<String>> queryParams = new HashMap<>();
        queryParams.put("appId", this.appId == null ? null : Arrays.asList(this.appId));
        return queryParams;
    }




    @Override
    public boolean isValid() {
        if(this.namespace == null) {
            return false;
        }
        if(this.userId == null) {
            return false;
        }
        if(this.appId == null) {
            return false;
        }
        return true;
    }

    public PublicGetUserAppEntitlementOwnershipByAppIdOpResponse parseResponse(int code, String contentType, InputStream payload) throws HttpResponseException, IOException {
        final PublicGetUserAppEntitlementOwnershipByAppIdOpResponse response = new PublicGetUserAppEntitlementOwnershipByAppIdOpResponse();

        response.setHttpStatusCode(code);
        response.setContentType(contentType);

        if (code == 204) {
            response.setSuccess(true);
        }
        else if ((code == 200) || (code == 201)) {
            final String json = Helper.convertInputStreamToString(payload);
            response.setData(new Ownership().createFromJson(json));
            response.setSuccess(true);
        }

        return response;
    }

    /*
    public Ownership parseResponse(int code, String contentType, InputStream payload) throws HttpResponseException, IOException {
        if(code != 200){
            final String json = Helper.convertInputStreamToString(payload);
            throw new HttpResponseException(code, json);
        }
        final String json = Helper.convertInputStreamToString(payload);
        return new Ownership().createFromJson(json);
    }
    */

    @Override
    protected Map<String, String> getCollectionFormatMap() {
        Map<String, String> result = new HashMap<>();
        result.put("appId", "None");
        return result;
    }
}