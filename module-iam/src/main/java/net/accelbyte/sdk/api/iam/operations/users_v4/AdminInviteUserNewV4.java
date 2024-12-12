/*
 * Copyright (c) 2024 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.iam.operations.users_v4;

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
import net.accelbyte.sdk.api.iam.operation_responses.users_v4.AdminInviteUserNewV4OpResponse;

/**
 * AdminInviteUserNewV4
 *
 * Use this endpoint to invite admin or non-admin user and assign role to them. The role must be scoped to namespace. An admin user can only
 * assign role with **assignedNamespaces** if the admin user has required permission which is same as the required permission of endpoint: [AdminAddUserRoleV4].
 * 
 * Detail request body :
 * - **emailAddresses** is required, List of email addresses that will be invited
 * - **isAdmin** is required, true if user is admin, false if user is not admin
 * - **namespace** is optional. Only works on multi tenant mode,
 * if not specified then it will be assigned Publisher namespace,
 * if specified, it will become that studio/publisher where user is invited to.
 * - **roleId** is optional, if not specified then it will only assign User role.
 * - **assignedNamespaces** is optional, List of namespaces which the Role will be assigned to the user, only works when Role is not empty.
 * 
 * The invited admin will also assigned with "User" role by default.
 */
@Getter
@Setter
public class AdminInviteUserNewV4 extends Operation {
    /**
     * generated field's value
     */
    private String path = "/iam/v4/admin/users/invite";
    private String method = "POST";
    private List<String> consumes = Arrays.asList("application/json");
    private List<String> produces = Arrays.asList("application/json");
    private String locationQuery = null;
    /**
     * fields as input parameter
     */
    private ModelInviteUserRequestV4 body;

    /**
    * @param body required
    */
    @Builder
    // @deprecated 2022-08-29 - All args constructor may cause problems. Use builder instead.
    @Deprecated
    public AdminInviteUserNewV4(
            String customBasePath,            ModelInviteUserRequestV4 body
    )
    {
        this.body = body;
        super.customBasePath = customBasePath != null ? customBasePath : "";

        securities.add("Bearer");
    }




    @Override
    public ModelInviteUserRequestV4 getBodyParams(){
        return this.body;
    }


    @Override
    public boolean isValid() {
        if(this.body == null) {
            return false;
        }
        return true;
    }

    public AdminInviteUserNewV4OpResponse parseResponse(int code, String contentType, InputStream payload) throws HttpResponseException, IOException {
        final AdminInviteUserNewV4OpResponse response = new AdminInviteUserNewV4OpResponse();

        response.setHttpStatusCode(code);
        response.setContentType(contentType);

        if (code == 204) {
            response.setSuccess(true);
        }
        else if ((code == 200) || (code == 201)) {
            final String json = Helper.convertInputStreamToString(payload);
            response.setData(new ModelInviteUserResponseV3().createFromJson(json));
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
        else if (code == 404) {
            final String json = Helper.convertInputStreamToString(payload);
            response.setError404(new RestErrorResponse().createFromJson(json));
            response.setError(response.getError404().translateToApiError());
        }
        else if (code == 409) {
            final String json = Helper.convertInputStreamToString(payload);
            response.setError409(new RestErrorResponse().createFromJson(json));
            response.setError(response.getError409().translateToApiError());
        }
        else if (code == 422) {
            final String json = Helper.convertInputStreamToString(payload);
            response.setError422(new RestErrorResponse().createFromJson(json));
            response.setError(response.getError422().translateToApiError());
        }
        else if (code == 500) {
            final String json = Helper.convertInputStreamToString(payload);
            response.setError500(new RestErrorResponse().createFromJson(json));
            response.setError(response.getError500().translateToApiError());
        }

        return response;
    }

    /*
    public ModelInviteUserResponseV3 parseResponse(int code, String contentType, InputStream payload) throws HttpResponseException, IOException {
        if(code != 201){
            final String json = Helper.convertInputStreamToString(payload);
            throw new HttpResponseException(code, json);
        }
        final String json = Helper.convertInputStreamToString(payload);
        return new ModelInviteUserResponseV3().createFromJson(json);
    }
    */

}