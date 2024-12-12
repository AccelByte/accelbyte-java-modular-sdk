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
import net.accelbyte.sdk.api.iam.operation_responses.users.PublicGetUsersPlatformInfosV3OpResponse;

/**
 * PublicGetUsersPlatformInfosV3
 *
 * Note:
 * 1. the max count of user ids in the request is 100
 * 2. if platform id is not empty, the result will only contain the corresponding platform infos
 * 3. if platform id is empty, the result will contain all the supported platform infos
 * 
 * __Supported 3rd platforms:__
 * 
 * * __PSN(ps4web, ps4, ps5)__
 * * account id
 * * display name
 * * avatar
 * * __Xbox(live, xblweb)__
 * * xuid or pxuid
 * * display name
 * * __Steam(steam, steamopenid)__
 * * steam id
 * * display name
 * * avatar
 * * __EpicGames(epicgames)__
 * * epic account id
 * * display name
 */
@Getter
@Setter
public class PublicGetUsersPlatformInfosV3 extends Operation {
    /**
     * generated field's value
     */
    private String path = "/iam/v3/public/namespaces/{namespace}/users/platforms";
    private String method = "POST";
    private List<String> consumes = Arrays.asList("application/json");
    private List<String> produces = Arrays.asList("application/json");
    private String locationQuery = null;
    /**
     * fields as input parameter
     */
    private String namespace;
    private ModelUsersPlatformInfosRequestV3 body;

    /**
    * @param namespace required
    * @param body required
    */
    @Builder
    // @deprecated 2022-08-29 - All args constructor may cause problems. Use builder instead.
    @Deprecated
    public PublicGetUsersPlatformInfosV3(
            String customBasePath,            String namespace,
            ModelUsersPlatformInfosRequestV3 body
    )
    {
        this.namespace = namespace;
        this.body = body;
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
    public ModelUsersPlatformInfosRequestV3 getBodyParams(){
        return this.body;
    }


    @Override
    public boolean isValid() {
        if(this.namespace == null) {
            return false;
        }
        if(this.body == null) {
            return false;
        }
        return true;
    }

    public PublicGetUsersPlatformInfosV3OpResponse parseResponse(int code, String contentType, InputStream payload) throws HttpResponseException, IOException {
        final PublicGetUsersPlatformInfosV3OpResponse response = new PublicGetUsersPlatformInfosV3OpResponse();

        response.setHttpStatusCode(code);
        response.setContentType(contentType);

        if (code == 204) {
            response.setSuccess(true);
        }
        else if ((code == 200) || (code == 201)) {
            final String json = Helper.convertInputStreamToString(payload);
            response.setData(new ModelUsersPlatformInfosResponse().createFromJson(json));
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
        else if (code == 500) {
            final String json = Helper.convertInputStreamToString(payload);
            response.setError500(new RestErrorResponse().createFromJson(json));
            response.setError(response.getError500().translateToApiError());
        }

        return response;
    }

    /*
    public ModelUsersPlatformInfosResponse parseResponse(int code, String contentType, InputStream payload) throws HttpResponseException, IOException {
        if(code != 200){
            final String json = Helper.convertInputStreamToString(payload);
            throw new HttpResponseException(code, json);
        }
        final String json = Helper.convertInputStreamToString(payload);
        return new ModelUsersPlatformInfosResponse().createFromJson(json);
    }
    */

}