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
import net.accelbyte.sdk.api.iam.operation_responses.users.CreateUserOpResponse;

/**
 * CreateUser
 *
 * ## The endpoint is going to be deprecated
 * ### Endpoint migration guide
 * - **Substitute endpoint: _/iam/v3/public/namespaces/{namespace}/users [POST]_**
 * - **Substitute endpoint: _/iam/v4/public/namespaces/{namespace}/users [POST]_**
 * - **Note:**
 * 1. v3 & v4 introduce optional verification code
 * 2. format differenceï¼Pascal case => Camel case)
 * 
 * Available Authentication Types:
 * 1. **EMAILPASSWD**: an authentication type used for new user registration through email.
 * 2. **PHONEPASSWD**: an authentication type used for new user registration through phone number.
 * 
 * Country use ISO3166-1 alpha-2 two letter, e.g. US.
 *
 * @deprecated
 */
@Deprecated
@Getter
@Setter
public class CreateUser extends Operation {
    /**
     * generated field's value
     */
    private String path = "/iam/namespaces/{namespace}/users";
    private String method = "POST";
    private List<String> consumes = Arrays.asList("application/json");
    private List<String> produces = Arrays.asList("application/json");
    private String locationQuery = null;
    /**
     * fields as input parameter
     */
    private String namespace;
    private ModelUserCreateRequest body;

    /**
    * @param namespace required
    * @param body required
    */
    @Builder
    // @deprecated 2022-08-29 - All args constructor may cause problems. Use builder instead.
    @Deprecated
    public CreateUser(
            String customBasePath,            String namespace,
            ModelUserCreateRequest body
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
    public ModelUserCreateRequest getBodyParams(){
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

    public CreateUserOpResponse parseResponse(int code, String contentType, InputStream payload) throws HttpResponseException, IOException {
        final CreateUserOpResponse response = new CreateUserOpResponse();

        response.setHttpStatusCode(code);
        response.setContentType(contentType);

        if (code == 204) {
            response.setSuccess(true);
        }
        else if ((code == 200) || (code == 201)) {
            final String json = Helper.convertInputStreamToString(payload);
            response.setData(new ModelUserCreateResponse().createFromJson(json));
            response.setSuccess(true);
        }
        else if (code == 400) {
            final String data = Helper.convertInputStreamToString(payload);
            response.setError400(data);
            response.setError(new ApiError("-1", data));
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
        else if (code == 409) {
            final String data = Helper.convertInputStreamToString(payload);
            response.setError409(data);
            response.setError(new ApiError("-1", data));
        }

        return response;
    }

    /*
    public ModelUserCreateResponse parseResponse(int code, String contentType, InputStream payload) throws HttpResponseException, IOException {
        if(code != 201){
            final String json = Helper.convertInputStreamToString(payload);
            throw new HttpResponseException(code, json);
        }
        final String json = Helper.convertInputStreamToString(payload);
        return new ModelUserCreateResponse().createFromJson(json);
    }
    */

}