/*
 * Copyright (c) 2024 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.sessionhistory.operations.operations;

import java.io.*;
import java.util.*;

import lombok.Builder;
import lombok.Getter;
import lombok.Setter;

import net.accelbyte.sdk.api.sessionhistory.models.*;
import net.accelbyte.sdk.core.Operation;
import net.accelbyte.sdk.core.HttpResponseException;
import net.accelbyte.sdk.core.util.Helper;
import net.accelbyte.sdk.core.ApiError;
import net.accelbyte.sdk.api.sessionhistory.operation_responses.operations.GetHealthcheckInfoOpResponse;

/**
 * GetHealthcheckInfo
 */
@Getter
@Setter
public class GetHealthcheckInfo extends Operation {
    /**
     * generated field's value
     */
    private String path = "/healthz";
    private String method = "GET";
    private List<String> consumes = Arrays.asList();
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
    public GetHealthcheckInfo(
            String customBasePath    )
    {
        super.customBasePath = customBasePath != null ? customBasePath : "";

        securities.add("Bearer");
    }






    @Override
    public boolean isValid() {
        return true;
    }

    public GetHealthcheckInfoOpResponse parseResponse(int code, String contentType, InputStream payload) throws HttpResponseException, IOException {
        final GetHealthcheckInfoOpResponse response = new GetHealthcheckInfoOpResponse();

        response.setHttpStatusCode(code);
        response.setContentType(contentType);

        if (code == 204) {
            response.setSuccess(true);
        }

        return response;
    }

    /*
    public void handleEmptyResponse(int code, String contentType, InputStream payload) throws HttpResponseException, IOException {
        if(code != 200){
            final String json = Helper.convertInputStreamToString(payload);
            throw new HttpResponseException(code, json);
        }
    }
    */

}