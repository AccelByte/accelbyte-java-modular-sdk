/*
 * Copyright (c) 2024 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.iam.operations.config;

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
import net.accelbyte.sdk.api.iam.operation_responses.config.AdminGetConfigValueV3OpResponse;

/**
 * AdminGetConfigValueV3
 *
 * This endpoint return the value of config key. The namespace should be publisher namespace or studio namespace.
 * 
 * **Supported config key:**
 * * uniqueDisplayNameEnabled
 * * usernameDisabled
 * * mandatoryEmailVerificationEnabled
 */
@Getter
@Setter
public class AdminGetConfigValueV3 extends Operation {
    /**
     * generated field's value
     */
    private String path = "/iam/v3/admin/namespaces/{namespace}/config/{configKey}";
    private String method = "GET";
    private List<String> consumes = Arrays.asList();
    private List<String> produces = Arrays.asList("application/json");
    private String locationQuery = null;
    /**
     * fields as input parameter
     */
    private String configKey;
    private String namespace;

    /**
    * @param configKey required
    * @param namespace required
    */
    @Builder
    // @deprecated 2022-08-29 - All args constructor may cause problems. Use builder instead.
    @Deprecated
    public AdminGetConfigValueV3(
            String customBasePath,            String configKey,
            String namespace
    )
    {
        this.configKey = configKey;
        this.namespace = namespace;
        super.customBasePath = customBasePath != null ? customBasePath : "";

        securities.add("Bearer");
    }

    @Override
    public Map<String, String> getPathParams(){
        Map<String, String> pathParams = new HashMap<>();
        if (this.configKey != null){
            pathParams.put("configKey", this.configKey);
        }
        if (this.namespace != null){
            pathParams.put("namespace", this.namespace);
        }
        return pathParams;
    }





    @Override
    public boolean isValid() {
        if(this.configKey == null) {
            return false;
        }
        if(this.namespace == null) {
            return false;
        }
        return true;
    }

    public AdminGetConfigValueV3OpResponse parseResponse(int code, String contentType, InputStream payload) throws HttpResponseException, IOException {
        final AdminGetConfigValueV3OpResponse response = new AdminGetConfigValueV3OpResponse();

        response.setHttpStatusCode(code);
        response.setContentType(contentType);

        if (code == 204) {
            response.setSuccess(true);
        }
        else if ((code == 200) || (code == 201)) {
            final String json = Helper.convertInputStreamToString(payload);
            response.setData(new ModelConfigValueResponseV3().createFromJson(json));
            response.setSuccess(true);
        }
        else if (code == 400) {
            final String json = Helper.convertInputStreamToString(payload);
            response.setError400(new RestErrorResponse().createFromJson(json));
            response.setError(response.getError400().translateToApiError());
        }
        else if (code == 500) {
            final String json = Helper.convertInputStreamToString(payload);
            response.setError500(new RestErrorResponse().createFromJson(json));
            response.setError(response.getError500().translateToApiError());
        }

        return response;
    }

    /*
    public ModelConfigValueResponseV3 parseResponse(int code, String contentType, InputStream payload) throws HttpResponseException, IOException {
        if(code != 200){
            final String json = Helper.convertInputStreamToString(payload);
            throw new HttpResponseException(code, json);
        }
        final String json = Helper.convertInputStreamToString(payload);
        return new ModelConfigValueResponseV3().createFromJson(json);
    }
    */

}