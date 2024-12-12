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
import net.accelbyte.sdk.api.iam.operation_responses.users.PublicVerifyUserByLinkV3OpResponse;

/**
 * PublicVerifyUserByLinkV3
 */
@Getter
@Setter
public class PublicVerifyUserByLinkV3 extends Operation {
    /**
     * generated field's value
     */
    private String path = "/iam/v3/public/users/verify_link/verify";
    private String method = "GET";
    private List<String> consumes = Arrays.asList();
    private List<String> produces = Arrays.asList("application/json");
    private String locationQuery = null;
    /**
     * fields as input parameter
     */
    private String code;

    /**
    */
    @Builder
    // @deprecated 2022-08-29 - All args constructor may cause problems. Use builder instead.
    @Deprecated
    public PublicVerifyUserByLinkV3(
            String customBasePath,            String code
    )
    {
        this.code = code;
        super.customBasePath = customBasePath != null ? customBasePath : "";

        securities.add("Bearer");
    }


    @Override
    public Map<String, List<String>> getQueryParams(){
        Map<String, List<String>> queryParams = new HashMap<>();
        queryParams.put("code", this.code == null ? null : Arrays.asList(this.code));
        return queryParams;
    }




    @Override
    public boolean isValid() {
        return true;
    }

    public PublicVerifyUserByLinkV3OpResponse parseResponse(int code, String contentType, InputStream payload) throws HttpResponseException, IOException {
        final PublicVerifyUserByLinkV3OpResponse response = new PublicVerifyUserByLinkV3OpResponse();

        response.setHttpStatusCode(code);
        response.setContentType(contentType);

        if (code == 204) {
            response.setSuccess(true);
        }
        else if (code == 302) {
            final String data = Helper.convertInputStreamToString(payload);
            response.setError302(data);
            response.setError(new ApiError("-1", data));
        }

        return response;
    }

    /*
    public String parseResponse(int code, String contentType, InputStream payload) throws HttpResponseException, IOException {
        final String json = Helper.convertInputStreamToString(payload);
        if(code != 302){
            throw new HttpResponseException(code, json);
        }
        return json;
    }
    */

    @Override
    protected Map<String, String> getCollectionFormatMap() {
        Map<String, String> result = new HashMap<>();
        result.put("code", "None");
        return result;
    }
}