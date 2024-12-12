/*
 * Copyright (c) 2024 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.session.operations.platform_credential;

import java.io.*;
import java.util.*;

import lombok.Builder;
import lombok.Getter;
import lombok.Setter;

import net.accelbyte.sdk.api.session.models.*;
import net.accelbyte.sdk.core.Operation;
import net.accelbyte.sdk.core.HttpResponseException;
import net.accelbyte.sdk.core.util.Helper;
import net.accelbyte.sdk.core.ApiError;
import net.accelbyte.sdk.api.session.operation_responses.platform_credential.AdminSyncPlatformCredentialsOpResponse;

/**
 * adminSyncPlatformCredentials
 *
 * Sync Platform Credentials.
 * 
 * Supported Platforms:
 * 1. XBOX
 * With this method, we will be performing sync to Platform Service to retrieve the existing PFX certificate which uploaded through IAP.
 * If the API returns Not Found, alternatively what you can do is either:
 * a. upload PFX file to IAP. You can access it from Admin Portal {BASE_URL}/admin/namespaces/{NAMESPACE}/in-app-purchase/xbox, or directly through API /platform/admin/namespaces/{NAMESPACE}/iap/config/xbl/cert.
 * b. upload PFX file through Session API /session/v1/admin/namespaces/{namespace}/certificates/pfx/platforms/xbl
 * We recommend approach #a, since you need to only upload the file once, and the service will do the sync.
 * If you set the PFX through Session service, when this API is invoked, we will sync and replace the existing PFX file with the one from Platform (IAP).
 */
@Getter
@Setter
public class AdminSyncPlatformCredentials extends Operation {
    /**
     * generated field's value
     */
    private String path = "/session/v1/admin/namespaces/{namespace}/platform-credentials/{platformId}/sync";
    private String method = "PUT";
    private List<String> consumes = Arrays.asList();
    private List<String> produces = Arrays.asList("application/json");
    private String locationQuery = null;
    /**
     * fields as input parameter
     */
    private String namespace;
    private String platformId;

    /**
    * @param namespace required
    * @param platformId required
    */
    @Builder
    // @deprecated 2022-08-29 - All args constructor may cause problems. Use builder instead.
    @Deprecated
    public AdminSyncPlatformCredentials(
            String customBasePath,            String namespace,
            String platformId
    )
    {
        this.namespace = namespace;
        this.platformId = platformId;
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
    public boolean isValid() {
        if(this.namespace == null) {
            return false;
        }
        if(this.platformId == null) {
            return false;
        }
        return true;
    }

    public AdminSyncPlatformCredentialsOpResponse parseResponse(int code, String contentType, InputStream payload) throws HttpResponseException, IOException {
        final AdminSyncPlatformCredentialsOpResponse response = new AdminSyncPlatformCredentialsOpResponse();

        response.setHttpStatusCode(code);
        response.setContentType(contentType);

        if (code == 204) {
            response.setSuccess(true);
        }
        else if ((code == 200) || (code == 201)) {
            final String json = Helper.convertInputStreamToString(payload);
            response.setData(new ApimodelsXblCertificateResponseBody().createFromJson(json));
            response.setSuccess(true);
        }
        else if (code == 400) {
            final String json = Helper.convertInputStreamToString(payload);
            response.setError400(new ResponseError().createFromJson(json));
            response.setError(response.getError400().translateToApiError());
        }
        else if (code == 401) {
            final String json = Helper.convertInputStreamToString(payload);
            response.setError401(new ResponseError().createFromJson(json));
            response.setError(response.getError401().translateToApiError());
        }
        else if (code == 403) {
            final String json = Helper.convertInputStreamToString(payload);
            response.setError403(new ResponseError().createFromJson(json));
            response.setError(response.getError403().translateToApiError());
        }
        else if (code == 404) {
            final String json = Helper.convertInputStreamToString(payload);
            response.setError404(new ResponseError().createFromJson(json));
            response.setError(response.getError404().translateToApiError());
        }
        else if (code == 500) {
            final String json = Helper.convertInputStreamToString(payload);
            response.setError500(new ResponseError().createFromJson(json));
            response.setError(response.getError500().translateToApiError());
        }

        return response;
    }

    /*
    public ApimodelsXblCertificateResponseBody parseResponse(int code, String contentType, InputStream payload) throws HttpResponseException, IOException {
        if(code != 200){
            final String json = Helper.convertInputStreamToString(payload);
            throw new HttpResponseException(code, json);
        }
        final String json = Helper.convertInputStreamToString(payload);
        return new ApimodelsXblCertificateResponseBody().createFromJson(json);
    }
    */

    public enum PlatformId {
        XBOX("XBOX");

        private String value;

        PlatformId(String value){
            this.value = value;
        }

        @Override
        public String toString() {
            return this.value;
        }
    }


    public static class AdminSyncPlatformCredentialsBuilder {
        private String platformId;


        public AdminSyncPlatformCredentialsBuilder platformId(final String platformId) {
            this.platformId = platformId;
            return this;
        }

        public AdminSyncPlatformCredentialsBuilder platformIdFromEnum(final PlatformId platformId) {
            this.platformId = platformId.toString();
            return this;
        }
    }
}