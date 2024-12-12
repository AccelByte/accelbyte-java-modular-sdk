/*
 * Copyright (c) 2024 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.platform.operations.wallet;

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
import net.accelbyte.sdk.api.platform.operation_responses.wallet.UpdatePlatformWalletConfigOpResponse;

/**
 * updatePlatformWalletConfig
 *
 * Update platform wallet config.
 * Other detail info:
 * 
 *   * Returns : platform wallet config
 */
@Getter
@Setter
public class UpdatePlatformWalletConfig extends Operation {
    /**
     * generated field's value
     */
    private String path = "/platform/admin/namespaces/{namespace}/platforms/{platform}/wallet/config";
    private String method = "PUT";
    private List<String> consumes = Arrays.asList("application/json");
    private List<String> produces = Arrays.asList("application/json");
    private String locationQuery = null;
    /**
     * fields as input parameter
     */
    private String namespace;
    private String platform;
    private PlatformWalletConfigUpdate body;

    /**
    * @param namespace required
    * @param platform required
    * @param body required
    */
    @Builder
    // @deprecated 2022-08-29 - All args constructor may cause problems. Use builder instead.
    @Deprecated
    public UpdatePlatformWalletConfig(
            String customBasePath,            String namespace,
            String platform,
            PlatformWalletConfigUpdate body
    )
    {
        this.namespace = namespace;
        this.platform = platform;
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
        if (this.platform != null){
            pathParams.put("platform", this.platform);
        }
        return pathParams;
    }



    @Override
    public PlatformWalletConfigUpdate getBodyParams(){
        return this.body;
    }


    @Override
    public boolean isValid() {
        if(this.namespace == null) {
            return false;
        }
        if(this.platform == null) {
            return false;
        }
        if(this.body == null) {
            return false;
        }
        return true;
    }

    public UpdatePlatformWalletConfigOpResponse parseResponse(int code, String contentType, InputStream payload) throws HttpResponseException, IOException {
        final UpdatePlatformWalletConfigOpResponse response = new UpdatePlatformWalletConfigOpResponse();

        response.setHttpStatusCode(code);
        response.setContentType(contentType);

        if (code == 204) {
            response.setSuccess(true);
        }
        else if ((code == 200) || (code == 201)) {
            final String json = Helper.convertInputStreamToString(payload);
            response.setData(new PlatformWalletConfigInfo().createFromJson(json));
            response.setSuccess(true);
        }

        return response;
    }

    /*
    public PlatformWalletConfigInfo parseResponse(int code, String contentType, InputStream payload) throws HttpResponseException, IOException {
        if(code != 200){
            final String json = Helper.convertInputStreamToString(payload);
            throw new HttpResponseException(code, json);
        }
        final String json = Helper.convertInputStreamToString(payload);
        return new PlatformWalletConfigInfo().createFromJson(json);
    }
    */

    public enum Platform {
        Epic("Epic"),
        GooglePlay("GooglePlay"),
        IOS("IOS"),
        Nintendo("Nintendo"),
        Oculus("Oculus"),
        Other("Other"),
        Playstation("Playstation"),
        Steam("Steam"),
        Xbox("Xbox");

        private String value;

        Platform(String value){
            this.value = value;
        }

        @Override
        public String toString() {
            return this.value;
        }
    }


    public static class UpdatePlatformWalletConfigBuilder {
        private String platform;


        public UpdatePlatformWalletConfigBuilder platform(final String platform) {
            this.platform = platform;
            return this;
        }

        public UpdatePlatformWalletConfigBuilder platformFromEnum(final Platform platform) {
            this.platform = platform.toString();
            return this;
        }
    }
}