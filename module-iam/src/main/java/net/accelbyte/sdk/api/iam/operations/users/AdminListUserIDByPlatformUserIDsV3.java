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
import net.accelbyte.sdk.api.iam.operation_responses.users.AdminListUserIDByPlatformUserIDsV3OpResponse;

/**
 * AdminListUserIDByPlatformUserIDsV3
 *
 * Admin List User ID By Platform User ID
 * This endpoint intended to list game user ID from the given namespace
 * This endpoint return list of user ID by given platform ID and list of platform user ID
 * 
 * Supported platform:
 * - steam
 * - steamopenid
 * - ps4web
 * - ps4
 * - ps5
 * - live
 * - xblweb
 * - oculus
 * - oculusweb
 * - facebook
 * - google
 * - googleplaygames
 * - twitch
 * - discord
 * - android
 * - ios
 * - apple
 * - device
 * - justice
 * - epicgames
 * - nintendo
 * - awscognito
 * - netflix
 * - snapchat
 * - oidc platform id
 * 
 * Note:
 * **nintendo platform user ID**: NSA ID need to be appended with Environment ID using colon as separator. e.g kmzwa8awaa:dd1
 */
@Getter
@Setter
public class AdminListUserIDByPlatformUserIDsV3 extends Operation {
    /**
     * generated field's value
     */
    private String path = "/iam/v3/admin/namespaces/{namespace}/platforms/{platformId}/users";
    private String method = "POST";
    private List<String> consumes = Arrays.asList("application/json");
    private List<String> produces = Arrays.asList("application/json");
    private String locationQuery = null;
    /**
     * fields as input parameter
     */
    private String namespace;
    private String platformId;
    private Boolean rawPID;
    private Boolean rawPUID;
    private ModelPlatformUserIDRequest body;

    /**
    * @param namespace required
    * @param platformId required
    * @param body required
    */
    @Builder
    // @deprecated 2022-08-29 - All args constructor may cause problems. Use builder instead.
    @Deprecated
    public AdminListUserIDByPlatformUserIDsV3(
            String customBasePath,            String namespace,
            String platformId,
            Boolean rawPID,
            Boolean rawPUID,
            ModelPlatformUserIDRequest body
    )
    {
        this.namespace = namespace;
        this.platformId = platformId;
        this.rawPID = rawPID;
        this.rawPUID = rawPUID;
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
        if (this.platformId != null){
            pathParams.put("platformId", this.platformId);
        }
        return pathParams;
    }

    @Override
    public Map<String, List<String>> getQueryParams(){
        Map<String, List<String>> queryParams = new HashMap<>();
        queryParams.put("rawPID", this.rawPID == null ? null : Arrays.asList(String.valueOf(this.rawPID)));
        queryParams.put("rawPUID", this.rawPUID == null ? null : Arrays.asList(String.valueOf(this.rawPUID)));
        return queryParams;
    }


    @Override
    public ModelPlatformUserIDRequest getBodyParams(){
        return this.body;
    }


    @Override
    public boolean isValid() {
        if(this.namespace == null) {
            return false;
        }
        if(this.platformId == null) {
            return false;
        }
        if(this.body == null) {
            return false;
        }
        return true;
    }

    public AdminListUserIDByPlatformUserIDsV3OpResponse parseResponse(int code, String contentType, InputStream payload) throws HttpResponseException, IOException {
        final AdminListUserIDByPlatformUserIDsV3OpResponse response = new AdminListUserIDByPlatformUserIDsV3OpResponse();

        response.setHttpStatusCode(code);
        response.setContentType(contentType);

        if (code == 204) {
            response.setSuccess(true);
        }
        else if ((code == 200) || (code == 201)) {
            final String json = Helper.convertInputStreamToString(payload);
            response.setData(new AccountcommonUserPlatforms().createFromJson(json));
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
        else if (code == 500) {
            final String json = Helper.convertInputStreamToString(payload);
            response.setError500(new RestErrorResponse().createFromJson(json));
            response.setError(response.getError500().translateToApiError());
        }

        return response;
    }

    /*
    public AccountcommonUserPlatforms parseResponse(int code, String contentType, InputStream payload) throws HttpResponseException, IOException {
        if(code != 200){
            final String json = Helper.convertInputStreamToString(payload);
            throw new HttpResponseException(code, json);
        }
        final String json = Helper.convertInputStreamToString(payload);
        return new AccountcommonUserPlatforms().createFromJson(json);
    }
    */

    @Override
    protected Map<String, String> getCollectionFormatMap() {
        Map<String, String> result = new HashMap<>();
        result.put("rawPID", "None");
        result.put("rawPUID", "None");
        return result;
    }
}