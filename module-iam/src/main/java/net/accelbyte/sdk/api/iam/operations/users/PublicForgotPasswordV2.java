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
import net.accelbyte.sdk.api.iam.operation_responses.users.PublicForgotPasswordV2OpResponse;

/**
 * PublicForgotPasswordV2
 *
 * ## The endpoint is going to be deprecated
 * **Endpoint migration guide**
 * - **Substitute endpoint: _/iam/v3/public/namespaces/{namespace}/users/forgot [POST]_**
 * 
 * **Special note for publisher-game scenario:** Game Client should provide game namespace path parameter and Publisher Client should provide publisher namespace path parameter.
 * The password reset code will be sent to the publisher account's email address.
 *
 * @deprecated
 */
@Deprecated
@Getter
@Setter
public class PublicForgotPasswordV2 extends Operation {
    /**
     * generated field's value
     */
    private String path = "/iam/v2/public/namespaces/{namespace}/users/forgotPassword";
    private String method = "POST";
    private List<String> consumes = Arrays.asList("application/json");
    private List<String> produces = Arrays.asList("application/json");
    private String locationQuery = null;
    /**
     * fields as input parameter
     */
    private String namespace;
    private ModelSendVerificationCodeRequest body;

    /**
    * @param namespace required
    * @param body required
    */
    @Builder
    // @deprecated 2022-08-29 - All args constructor may cause problems. Use builder instead.
    @Deprecated
    public PublicForgotPasswordV2(
            String customBasePath,            String namespace,
            ModelSendVerificationCodeRequest body
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
    public ModelSendVerificationCodeRequest getBodyParams(){
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

    public PublicForgotPasswordV2OpResponse parseResponse(int code, String contentType, InputStream payload) throws HttpResponseException, IOException {
        final PublicForgotPasswordV2OpResponse response = new PublicForgotPasswordV2OpResponse();

        response.setHttpStatusCode(code);
        response.setContentType(contentType);

        if (code == 204) {
            response.setSuccess(true);
        }
        else if (code == 400) {
            final String data = Helper.convertInputStreamToString(payload);
            response.setError400(data);
            response.setError(new ApiError("-1", data));
        }
        else if (code == 404) {
            final String data = Helper.convertInputStreamToString(payload);
            response.setError404(data);
            response.setError(new ApiError("-1", data));
        }
        else if (code == 429) {
            final String data = Helper.convertInputStreamToString(payload);
            response.setError429(data);
            response.setError(new ApiError("-1", data));
        }
        else if (code == 500) {
            final String data = Helper.convertInputStreamToString(payload);
            response.setError500(data);
            response.setError(new ApiError("-1", data));
        }

        return response;
    }

    /*
    public void handleEmptyResponse(int code, String contentType, InputStream payload) throws HttpResponseException, IOException {
        if(code != 204){
            final String json = Helper.convertInputStreamToString(payload);
            throw new HttpResponseException(code, json);
        }
    }
    */

}