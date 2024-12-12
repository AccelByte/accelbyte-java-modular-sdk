/*
 * Copyright (c) 2024 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.basic.operations.user_profile;

import java.io.*;
import java.util.*;

import lombok.Builder;
import lombok.Getter;
import lombok.Setter;

import net.accelbyte.sdk.api.basic.models.*;
import net.accelbyte.sdk.core.Operation;
import net.accelbyte.sdk.core.HttpResponseException;
import net.accelbyte.sdk.core.util.Helper;
import net.accelbyte.sdk.core.ApiError;
import net.accelbyte.sdk.api.basic.operation_responses.user_profile.PublicGetUserProfileInfoByPublicIdOpResponse;

/**
 * publicGetUserProfileInfoByPublicId
 *
 * Get user public profile by public id.
 * Other detail info:
 * 
 *   * Returns : user public profile
 */
@Getter
@Setter
public class PublicGetUserProfileInfoByPublicId extends Operation {
    /**
     * generated field's value
     */
    private String path = "/basic/v1/public/namespaces/{namespace}/profiles/public/byPublicId";
    private String method = "GET";
    private List<String> consumes = Arrays.asList();
    private List<String> produces = Arrays.asList("application/json");
    private String locationQuery = null;
    /**
     * fields as input parameter
     */
    private String namespace;
    private String publicId;

    /**
    * @param namespace required
    * @param publicId required
    */
    @Builder
    // @deprecated 2022-08-29 - All args constructor may cause problems. Use builder instead.
    @Deprecated
    public PublicGetUserProfileInfoByPublicId(
            String customBasePath,            String namespace,
            String publicId
    )
    {
        this.namespace = namespace;
        this.publicId = publicId;
        super.customBasePath = customBasePath != null ? customBasePath : "";

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
        queryParams.put("publicId", this.publicId == null ? null : Arrays.asList(this.publicId));
        return queryParams;
    }




    @Override
    public boolean isValid() {
        if(this.namespace == null) {
            return false;
        }
        if(this.publicId == null) {
            return false;
        }
        return true;
    }

    public PublicGetUserProfileInfoByPublicIdOpResponse parseResponse(int code, String contentType, InputStream payload) throws HttpResponseException, IOException {
        final PublicGetUserProfileInfoByPublicIdOpResponse response = new PublicGetUserProfileInfoByPublicIdOpResponse();

        response.setHttpStatusCode(code);
        response.setContentType(contentType);

        if (code == 204) {
            response.setSuccess(true);
        }
        else if ((code == 200) || (code == 201)) {
            final String json = Helper.convertInputStreamToString(payload);
            response.setData(new UserProfilePublicInfo().createFromJson(json));
            response.setSuccess(true);
        }
        else if (code == 400) {
            final String json = Helper.convertInputStreamToString(payload);
            response.setError400(new ValidationErrorEntity().createFromJson(json));
            response.setError(response.getError400().translateToApiError());
        }
        else if (code == 404) {
            final String json = Helper.convertInputStreamToString(payload);
            response.setError404(new ErrorEntity().createFromJson(json));
            response.setError(response.getError404().translateToApiError());
        }

        return response;
    }

    /*
    public UserProfilePublicInfo parseResponse(int code, String contentType, InputStream payload) throws HttpResponseException, IOException {
        if(code != 200){
            final String json = Helper.convertInputStreamToString(payload);
            throw new HttpResponseException(code, json);
        }
        final String json = Helper.convertInputStreamToString(payload);
        return new UserProfilePublicInfo().createFromJson(json);
    }
    */

    @Override
    protected Map<String, String> getCollectionFormatMap() {
        Map<String, String> result = new HashMap<>();
        result.put("publicId", "None");
        return result;
    }
}