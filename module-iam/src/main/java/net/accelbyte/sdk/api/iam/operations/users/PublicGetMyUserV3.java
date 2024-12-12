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
import net.accelbyte.sdk.api.iam.operation_responses.users.PublicGetMyUserV3OpResponse;

/**
 * PublicGetMyUserV3
 *
 * Get my user data
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
 * 
 * action code : 10147
 */
@Getter
@Setter
public class PublicGetMyUserV3 extends Operation {
    /**
     * generated field's value
     */
    private String path = "/iam/v3/public/users/me";
    private String method = "GET";
    private List<String> consumes = Arrays.asList();
    private List<String> produces = Arrays.asList("application/json");
    private String locationQuery = null;
    /**
     * fields as input parameter
     */
    private Boolean includeAllPlatforms;

    /**
    */
    @Builder
    // @deprecated 2022-08-29 - All args constructor may cause problems. Use builder instead.
    @Deprecated
    public PublicGetMyUserV3(
            String customBasePath,            Boolean includeAllPlatforms
    )
    {
        this.includeAllPlatforms = includeAllPlatforms;
        super.customBasePath = customBasePath != null ? customBasePath : "";

        securities.add("Bearer");
    }


    @Override
    public Map<String, List<String>> getQueryParams(){
        Map<String, List<String>> queryParams = new HashMap<>();
        queryParams.put("includeAllPlatforms", this.includeAllPlatforms == null ? null : Arrays.asList(String.valueOf(this.includeAllPlatforms)));
        return queryParams;
    }




    @Override
    public boolean isValid() {
        return true;
    }

    public PublicGetMyUserV3OpResponse parseResponse(int code, String contentType, InputStream payload) throws HttpResponseException, IOException {
        final PublicGetMyUserV3OpResponse response = new PublicGetMyUserV3OpResponse();

        response.setHttpStatusCode(code);
        response.setContentType(contentType);

        if (code == 204) {
            response.setSuccess(true);
        }
        else if ((code == 200) || (code == 201)) {
            final String json = Helper.convertInputStreamToString(payload);
            response.setData(new ModelUserResponseV3().createFromJson(json));
            response.setSuccess(true);
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
    public ModelUserResponseV3 parseResponse(int code, String contentType, InputStream payload) throws HttpResponseException, IOException {
        if(code != 200){
            final String json = Helper.convertInputStreamToString(payload);
            throw new HttpResponseException(code, json);
        }
        final String json = Helper.convertInputStreamToString(payload);
        return new ModelUserResponseV3().createFromJson(json);
    }
    */

    @Override
    protected Map<String, String> getCollectionFormatMap() {
        Map<String, String> result = new HashMap<>();
        result.put("includeAllPlatforms", "None");
        return result;
    }
}