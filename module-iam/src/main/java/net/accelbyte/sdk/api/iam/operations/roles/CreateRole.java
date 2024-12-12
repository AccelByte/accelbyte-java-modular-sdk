/*
 * Copyright (c) 2024 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.iam.operations.roles;

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
import net.accelbyte.sdk.api.iam.operation_responses.roles.CreateRoleOpResponse;

/**
 * CreateRole
 *
 * ## The endpoint is going to be deprecated
 * Role can only be assigned to other users by the role's manager.
 * 
 * If role is an administrator role (i.e. AdminRole == true), it will list out the role's members.
 * 
 * Administrator role can be created only when at least 1 manager is specified.
 * ### Endpoint migration guide
 * - **Substitute endpoint: _/iam/v3/admin/roles [POST]_**
 *
 * @deprecated
 */
@Deprecated
@Getter
@Setter
public class CreateRole extends Operation {
    /**
     * generated field's value
     */
    private String path = "/iam/roles";
    private String method = "POST";
    private List<String> consumes = Arrays.asList("application/json");
    private List<String> produces = Arrays.asList("application/json");
    private String locationQuery = null;
    /**
     * fields as input parameter
     */
    private ModelRoleCreateRequest body;

    /**
    * @param body required
    */
    @Builder
    // @deprecated 2022-08-29 - All args constructor may cause problems. Use builder instead.
    @Deprecated
    public CreateRole(
            String customBasePath,            ModelRoleCreateRequest body
    )
    {
        this.body = body;
        super.customBasePath = customBasePath != null ? customBasePath : "";

        securities.add("Bearer");
    }




    @Override
    public ModelRoleCreateRequest getBodyParams(){
        return this.body;
    }


    @Override
    public boolean isValid() {
        if(this.body == null) {
            return false;
        }
        return true;
    }

    public CreateRoleOpResponse parseResponse(int code, String contentType, InputStream payload) throws HttpResponseException, IOException {
        final CreateRoleOpResponse response = new CreateRoleOpResponse();

        response.setHttpStatusCode(code);
        response.setContentType(contentType);

        if (code == 204) {
            response.setSuccess(true);
        }
        else if ((code == 200) || (code == 201)) {
            final String json = Helper.convertInputStreamToString(payload);
            response.setData(new AccountcommonRole().createFromJson(json));
            response.setSuccess(true);
        }
        else if (code == 400) {
            final String json = Helper.convertInputStreamToString(payload);
            response.setError400(new RestErrorResponse().createFromJson(json));
            response.setError(response.getError400().translateToApiError());
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

        return response;
    }

    /*
    public AccountcommonRole parseResponse(int code, String contentType, InputStream payload) throws HttpResponseException, IOException {
        if(code != 201){
            final String json = Helper.convertInputStreamToString(payload);
            throw new HttpResponseException(code, json);
        }
        final String json = Helper.convertInputStreamToString(payload);
        return new AccountcommonRole().createFromJson(json);
    }
    */

}