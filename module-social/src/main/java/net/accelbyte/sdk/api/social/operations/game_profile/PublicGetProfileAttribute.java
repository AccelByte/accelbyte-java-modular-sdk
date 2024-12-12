/*
 * Copyright (c) 2024 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.social.operations.game_profile;

import java.io.*;
import java.util.*;

import lombok.Builder;
import lombok.Getter;
import lombok.Setter;

import net.accelbyte.sdk.api.social.models.*;
import net.accelbyte.sdk.core.Operation;
import net.accelbyte.sdk.core.HttpResponseException;
import net.accelbyte.sdk.core.util.Helper;
import net.accelbyte.sdk.core.ApiError;
import net.accelbyte.sdk.api.social.operation_responses.game_profile.PublicGetProfileAttributeOpResponse;

/**
 * publicGetProfileAttribute
 *
 * Returns game profile attribute.
 * Other detail info:
 *         *  Returns : attribute info
 */
@Getter
@Setter
public class PublicGetProfileAttribute extends Operation {
    /**
     * generated field's value
     */
    private String path = "/social/public/namespaces/{namespace}/users/{userId}/profiles/{profileId}/attributes/{attributeName}";
    private String method = "GET";
    private List<String> consumes = Arrays.asList();
    private List<String> produces = Arrays.asList("application/json");
    private String locationQuery = null;
    /**
     * fields as input parameter
     */
    private String attributeName;
    private String namespace;
    private String profileId;
    private String userId;

    /**
    * @param attributeName required
    * @param namespace required
    * @param profileId required
    * @param userId required
    */
    @Builder
    // @deprecated 2022-08-29 - All args constructor may cause problems. Use builder instead.
    @Deprecated
    public PublicGetProfileAttribute(
            String customBasePath,            String attributeName,
            String namespace,
            String profileId,
            String userId
    )
    {
        this.attributeName = attributeName;
        this.namespace = namespace;
        this.profileId = profileId;
        this.userId = userId;
        super.customBasePath = customBasePath != null ? customBasePath : "";

        securities.add("Bearer");
    }

    @Override
    public Map<String, String> getPathParams(){
        Map<String, String> pathParams = new HashMap<>();
        if (this.attributeName != null){
            pathParams.put("attributeName", this.attributeName);
        }
        if (this.namespace != null){
            pathParams.put("namespace", this.namespace);
        }
        if (this.profileId != null){
            pathParams.put("profileId", this.profileId);
        }
        if (this.userId != null){
            pathParams.put("userId", this.userId);
        }
        return pathParams;
    }





    @Override
    public boolean isValid() {
        if(this.attributeName == null) {
            return false;
        }
        if(this.namespace == null) {
            return false;
        }
        if(this.profileId == null) {
            return false;
        }
        if(this.userId == null) {
            return false;
        }
        return true;
    }

    public PublicGetProfileAttributeOpResponse parseResponse(int code, String contentType, InputStream payload) throws HttpResponseException, IOException {
        final PublicGetProfileAttributeOpResponse response = new PublicGetProfileAttributeOpResponse();

        response.setHttpStatusCode(code);
        response.setContentType(contentType);

        if (code == 204) {
            response.setSuccess(true);
        }
        else if ((code == 200) || (code == 201)) {
            final String json = Helper.convertInputStreamToString(payload);
            response.setData(new Attribute().createFromJson(json));
            response.setSuccess(true);
        }
        else if (code == 401) {
            final String json = Helper.convertInputStreamToString(payload);
            response.setError401(new ErrorEntity().createFromJson(json));
            response.setError(response.getError401().translateToApiError());
        }
        else if (code == 403) {
            final String json = Helper.convertInputStreamToString(payload);
            response.setError403(new ErrorEntity().createFromJson(json));
            response.setError(response.getError403().translateToApiError());
        }
        else if (code == 404) {
            final String json = Helper.convertInputStreamToString(payload);
            response.setError404(new ErrorEntity().createFromJson(json));
            response.setError(response.getError404().translateToApiError());
        }
        else if (code == 500) {
            final String json = Helper.convertInputStreamToString(payload);
            response.setError500(new ErrorEntity().createFromJson(json));
            response.setError(response.getError500().translateToApiError());
        }

        return response;
    }

    /*
    public Attribute parseResponse(int code, String contentType, InputStream payload) throws HttpResponseException, IOException {
        if(code != 200){
            final String json = Helper.convertInputStreamToString(payload);
            throw new HttpResponseException(code, json);
        }
        final String json = Helper.convertInputStreamToString(payload);
        return new Attribute().createFromJson(json);
    }
    */

}