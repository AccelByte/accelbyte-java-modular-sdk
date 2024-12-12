/*
 * Copyright (c) 2024 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.iam.operations.o_auth2_0_extension;

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
import net.accelbyte.sdk.api.iam.operation_responses.o_auth2_0_extension.PlatformTokenRefreshV3OpResponse;

/**
 * PlatformTokenRefreshV3
 *
 * This endpoint will validate the third party platform token, for some platforms will also refresh the token stored in IAM, it will not generate any event or AB access/refresh token.
 * This endpoint can be used by game client to refresh third party token if game client got platform token not found error, for example got 404
 * platform token not found from IAP/DLC.
 * 
 * ## Platforms will refresh stored token:
 * - **twitch**: The platform_tokenâs value is the authorization code returned by Twitch OAuth.
 * - **epicgames**: The platform_tokenâs value is an access-token or authorization code obtained from Epicgames EOS Account Service.
 * - **ps4**: The platform_tokenâs value is the authorization code returned by Sony OAuth.
 * - **ps5**: The platform_tokenâs value is the authorization code returned by Sony OAuth.
 * - **amazon**: The platform_tokenâs value is authorization code.
 * - **awscognito**: The platform_tokenâs value is the aws cognito access token or id token (JWT).
 * - **live**: The platform_tokenâs value is xbox XSTS token
 * - **snapchat**: The platform_tokenâs value is the authorization code returned by Snapchat OAuth.
 * - **for specific generic oauth (OIDC)**: The platform_tokenâs value should be the same type as created OIDC auth type whether it is auth code, idToken or bearerToken.
 */
@Getter
@Setter
public class PlatformTokenRefreshV3 extends Operation {
    /**
     * generated field's value
     */
    private String path = "/iam/v3/platforms/{platformId}/token/verify";
    private String method = "POST";
    private List<String> consumes = Arrays.asList("application/x-www-form-urlencoded");
    private List<String> produces = Arrays.asList("application/json");
    private String locationQuery = null;
    /**
     * fields as input parameter
     */
    private String platformId;
    private String platformToken;

    /**
    * @param platformId required
    * @param platformToken required
    */
    @Builder
    // @deprecated 2022-08-29 - All args constructor may cause problems. Use builder instead.
    @Deprecated
    public PlatformTokenRefreshV3(
            String customBasePath,            String platformId,
            String platformToken
    )
    {
        this.platformId = platformId;
        this.platformToken = platformToken;
        super.customBasePath = customBasePath != null ? customBasePath : "";

        securities.add("Bearer");
    }

    @Override
    public Map<String, String> getPathParams(){
        Map<String, String> pathParams = new HashMap<>();
        if (this.platformId != null){
            pathParams.put("platformId", this.platformId);
        }
        return pathParams;
    }




    @Override
    public Map<String, Object> getFormParams(){
        Map<String, Object> formDataParams = new HashMap<>();
        if (this.platformToken != null) {
            formDataParams.put("platform_token", this.platformToken);
        }
        return formDataParams;
    }

    @Override
    public boolean isValid() {
        if(this.platformId == null) {
            return false;
        }
        if(this.platformToken == null) {
            return false;
        }
        return true;
    }

    public PlatformTokenRefreshV3OpResponse parseResponse(int code, String contentType, InputStream payload) throws HttpResponseException, IOException {
        final PlatformTokenRefreshV3OpResponse response = new PlatformTokenRefreshV3OpResponse();

        response.setHttpStatusCode(code);
        response.setContentType(contentType);

        if (code == 204) {
            response.setSuccess(true);
        }
        else if ((code == 200) || (code == 201)) {
            final String json = Helper.convertInputStreamToString(payload);
            response.setData(new OauthmodelPlatformTokenRefreshResponseV3().createFromJson(json));
            response.setSuccess(true);
        }
        else if (code == 400) {
            final String json = Helper.convertInputStreamToString(payload);
            response.setError400(new OauthmodelErrorResponse().createFromJson(json));
            response.setError(response.getError400().translateToApiError());
        }
        else if (code == 401) {
            final String json = Helper.convertInputStreamToString(payload);
            response.setError401(new OauthmodelErrorResponse().createFromJson(json));
            response.setError(response.getError401().translateToApiError());
        }
        else if (code == 403) {
            final String json = Helper.convertInputStreamToString(payload);
            response.setError403(new OauthmodelErrorResponse().createFromJson(json));
            response.setError(response.getError403().translateToApiError());
        }
        else if (code == 503) {
            final String json = Helper.convertInputStreamToString(payload);
            response.setError503(new OauthmodelErrorResponse().createFromJson(json));
            response.setError(response.getError503().translateToApiError());
        }

        return response;
    }

    /*
    public OauthmodelPlatformTokenRefreshResponseV3 parseResponse(int code, String contentType, InputStream payload) throws HttpResponseException, IOException {
        if(code != 200){
            final String json = Helper.convertInputStreamToString(payload);
            throw new HttpResponseException(code, json);
        }
        final String json = Helper.convertInputStreamToString(payload);
        return new OauthmodelPlatformTokenRefreshResponseV3().createFromJson(json);
    }
    */

}