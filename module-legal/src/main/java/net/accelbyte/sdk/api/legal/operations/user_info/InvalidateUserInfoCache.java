/*
 * Copyright (c) 2024 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.legal.operations.user_info;

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
import net.accelbyte.sdk.api.legal.operation_responses.user_info.InvalidateUserInfoCacheOpResponse;

/**
 * invalidateUserInfoCache
 *
 * Invalidate user info cache in agreement service.
 *
 * @deprecated
 */
@Deprecated
@Getter
@Setter
public class InvalidateUserInfoCache extends Operation {
    /**
     * generated field's value
     */
    private String path = "/agreement/admin/userInfo";
    private String method = "DELETE";
    private List<String> consumes = Arrays.asList();
    private List<String> produces = Arrays.asList("application/json");
    private String locationQuery = null;
    /**
     * fields as input parameter
     */
    private String namespace;

    /**
    */
    @Builder
    // @deprecated 2022-08-29 - All args constructor may cause problems. Use builder instead.
    @Deprecated
    public InvalidateUserInfoCache(
            String customBasePath,            String namespace
    )
    {
        this.namespace = namespace;
        super.customBasePath = customBasePath != null ? customBasePath : "";

        securities.add("Bearer");
    }


    @Override
    public Map<String, List<String>> getQueryParams(){
        Map<String, List<String>> queryParams = new HashMap<>();
        queryParams.put("namespace", this.namespace == null ? null : Arrays.asList(this.namespace));
        return queryParams;
    }




    @Override
    public boolean isValid() {
        return true;
    }

    public InvalidateUserInfoCacheOpResponse parseResponse(int code, String contentType, InputStream payload) throws HttpResponseException, IOException {
        final InvalidateUserInfoCacheOpResponse response = new InvalidateUserInfoCacheOpResponse();

        response.setHttpStatusCode(code);
        response.setContentType(contentType);

        if (code == 204) {
            response.setSuccess(true);
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

    @Override
    protected Map<String, String> getCollectionFormatMap() {
        Map<String, String> result = new HashMap<>();
        result.put("namespace", "None");
        return result;
    }
}