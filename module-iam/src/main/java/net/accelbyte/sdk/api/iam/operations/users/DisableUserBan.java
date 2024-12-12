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
import net.accelbyte.sdk.api.iam.operation_responses.users.DisableUserBanOpResponse;

/**
 * DisableUserBan
 *
 * ## The endpoint is going to be deprecated
 * ### Endpoint migration guide
 * - **Substitute endpoint: _/iam/v3/admin/namespaces/{namespace}/users/{userId}/bans/{banId} [PATCH]_**
 * 
 * **Notes for using IAM in publisher - game studio scenarios**
 * The endpoint allows:
 * - The admin user in publisher namespace disables userâs ban in publisher namespace.
 * - The admin user in game namespace disables userâs ban in game namespace.
 * - The admin user in publisher namespace disables userâs ban in publisher namespace.
 * 
 * Other scenarios are not supported and will return 403: Forbidden.
 *
 * @deprecated
 */
@Deprecated
@Getter
@Setter
public class DisableUserBan extends Operation {
    /**
     * generated field's value
     */
    private String path = "/iam/namespaces/{namespace}/users/{userId}/bans/{banId}/disable";
    private String method = "PUT";
    private List<String> consumes = Arrays.asList("*/*");
    private List<String> produces = Arrays.asList("application/json");
    private String locationQuery = null;
    /**
     * fields as input parameter
     */
    private String banId;
    private String namespace;
    private String userId;

    /**
    * @param banId required
    * @param namespace required
    * @param userId required
    */
    @Builder
    // @deprecated 2022-08-29 - All args constructor may cause problems. Use builder instead.
    @Deprecated
    public DisableUserBan(
            String customBasePath,            String banId,
            String namespace,
            String userId
    )
    {
        this.banId = banId;
        this.namespace = namespace;
        this.userId = userId;
        super.customBasePath = customBasePath != null ? customBasePath : "";

        securities.add("Bearer");
    }

    @Override
    public Map<String, String> getPathParams(){
        Map<String, String> pathParams = new HashMap<>();
        if (this.banId != null){
            pathParams.put("banId", this.banId);
        }
        if (this.namespace != null){
            pathParams.put("namespace", this.namespace);
        }
        if (this.userId != null){
            pathParams.put("userId", this.userId);
        }
        return pathParams;
    }





    @Override
    public boolean isValid() {
        if(this.banId == null) {
            return false;
        }
        if(this.namespace == null) {
            return false;
        }
        if(this.userId == null) {
            return false;
        }
        return true;
    }

    public DisableUserBanOpResponse parseResponse(int code, String contentType, InputStream payload) throws HttpResponseException, IOException {
        final DisableUserBanOpResponse response = new DisableUserBanOpResponse();

        response.setHttpStatusCode(code);
        response.setContentType(contentType);

        if (code == 204) {
            response.setSuccess(true);
        }
        else if ((code == 200) || (code == 201)) {
            final String json = Helper.convertInputStreamToString(payload);
            response.setData(new ModelUserBanResponse().createFromJson(json));
            response.setSuccess(true);
        }
        else if (code == 401) {
            final String json = Helper.convertInputStreamToString(payload);
            response.setError401(new RestErrorResponse().createFromJson(json));
            response.setError(response.getError401().translateToApiError());
        }
        else if (code == 403) {
            final String data = Helper.convertInputStreamToString(payload);
            response.setError403(data);
            response.setError(new ApiError("-1", data));
        }
        else if (code == 404) {
            final String data = Helper.convertInputStreamToString(payload);
            response.setError404(data);
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
    public ModelUserBanResponse parseResponse(int code, String contentType, InputStream payload) throws HttpResponseException, IOException {
        if(code != 200){
            final String json = Helper.convertInputStreamToString(payload);
            throw new HttpResponseException(code, json);
        }
        final String json = Helper.convertInputStreamToString(payload);
        return new ModelUserBanResponse().createFromJson(json);
    }
    */

}