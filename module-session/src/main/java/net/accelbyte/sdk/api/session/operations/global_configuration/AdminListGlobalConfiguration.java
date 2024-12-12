/*
 * Copyright (c) 2024 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.session.operations.global_configuration;

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
import net.accelbyte.sdk.api.session.operation_responses.global_configuration.AdminListGlobalConfigurationOpResponse;

/**
 * adminListGlobalConfiguration
 *
 * Record of global configuration data.
 */
@Getter
@Setter
public class AdminListGlobalConfiguration extends Operation {
    /**
     * generated field's value
     */
    private String path = "/session/v1/admin/global-configurations";
    private String method = "GET";
    private List<String> consumes = Arrays.asList("application/json");
    private List<String> produces = Arrays.asList("application/json");
    private String locationQuery = null;
    /**
     * fields as input parameter
     */

    /**
    */
    @Builder
    // @deprecated 2022-08-29 - All args constructor may cause problems. Use builder instead.
    @Deprecated
    public AdminListGlobalConfiguration(
            String customBasePath    )
    {
        super.customBasePath = customBasePath != null ? customBasePath : "";

        securities.add("Bearer");
    }






    @Override
    public boolean isValid() {
        return true;
    }

    public AdminListGlobalConfigurationOpResponse parseResponse(int code, String contentType, InputStream payload) throws HttpResponseException, IOException {
        final AdminListGlobalConfigurationOpResponse response = new AdminListGlobalConfigurationOpResponse();

        response.setHttpStatusCode(code);
        response.setContentType(contentType);

        if (code == 204) {
            response.setSuccess(true);
        }
        else if ((code == 200) || (code == 201)) {
            final String json = Helper.convertInputStreamToString(payload);
            response.setData(new ApimodelsGlobalConfigurationResponse().createFromJson(json));
            response.setSuccess(true);
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

        return response;
    }

    /*
    public ApimodelsGlobalConfigurationResponse parseResponse(int code, String contentType, InputStream payload) throws HttpResponseException, IOException {
        if(code != 200){
            final String json = Helper.convertInputStreamToString(payload);
            throw new HttpResponseException(code, json);
        }
        final String json = Helper.convertInputStreamToString(payload);
        return new ApimodelsGlobalConfigurationResponse().createFromJson(json);
    }
    */

}