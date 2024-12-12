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
import net.accelbyte.sdk.api.iam.operation_responses.users_v4.AdminListInvitationHistoriesV4OpResponse;

/**
 * AdminListInvitationHistoriesV4
 *
 * This endpoint is to list all Invitation Histories for new studio namespace in multi tenant mode.
 * It will return error if the service multi tenant mode is set to false.
 * Accepted Query:
 * - namespace
 * - offset
 * - limit
 */
@Getter
@Setter
public class AdminListInvitationHistoriesV4 extends Operation {
    /**
     * generated field's value
     */
    private String path = "/iam/v4/admin/invitationHistories";
    private String method = "GET";
    private List<String> consumes = Arrays.asList();
    private List<String> produces = Arrays.asList("application/json");
    private String locationQuery = null;
    /**
     * fields as input parameter
     */
    private Integer limit;
    private String namespace;
    private Integer offset;

    /**
    */
    @Builder
    // @deprecated 2022-08-29 - All args constructor may cause problems. Use builder instead.
    @Deprecated
    public AdminListInvitationHistoriesV4(
            String customBasePath,            Integer limit,
            String namespace,
            Integer offset
    )
    {
        this.limit = limit;
        this.namespace = namespace;
        this.offset = offset;
        super.customBasePath = customBasePath != null ? customBasePath : "";

        securities.add("Bearer");
    }


    @Override
    public Map<String, List<String>> getQueryParams(){
        Map<String, List<String>> queryParams = new HashMap<>();
        queryParams.put("limit", this.limit == null ? null : Arrays.asList(String.valueOf(this.limit)));
        queryParams.put("namespace", this.namespace == null ? null : Arrays.asList(this.namespace));
        queryParams.put("offset", this.offset == null ? null : Arrays.asList(String.valueOf(this.offset)));
        return queryParams;
    }




    @Override
    public boolean isValid() {
        return true;
    }

    public AdminListInvitationHistoriesV4OpResponse parseResponse(int code, String contentType, InputStream payload) throws HttpResponseException, IOException {
        final AdminListInvitationHistoriesV4OpResponse response = new AdminListInvitationHistoriesV4OpResponse();

        response.setHttpStatusCode(code);
        response.setContentType(contentType);

        if (code == 204) {
            response.setSuccess(true);
        }
        else if ((code == 200) || (code == 201)) {
            final String json = Helper.convertInputStreamToString(payload);
            response.setData(new ModelListInvitationHistoriesV4Response().createFromJson(json));
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
        else if (code == 500) {
            final String json = Helper.convertInputStreamToString(payload);
            response.setError500(new RestErrorResponse().createFromJson(json));
            response.setError(response.getError500().translateToApiError());
        }
        else if (code == 501) {
            final String json = Helper.convertInputStreamToString(payload);
            response.setError501(new RestErrorResponse().createFromJson(json));
            response.setError(response.getError501().translateToApiError());
        }

        return response;
    }

    /*
    public ModelListInvitationHistoriesV4Response parseResponse(int code, String contentType, InputStream payload) throws HttpResponseException, IOException {
        if(code != 200){
            final String json = Helper.convertInputStreamToString(payload);
            throw new HttpResponseException(code, json);
        }
        final String json = Helper.convertInputStreamToString(payload);
        return new ModelListInvitationHistoriesV4Response().createFromJson(json);
    }
    */

    @Override
    protected Map<String, String> getCollectionFormatMap() {
        Map<String, String> result = new HashMap<>();
        result.put("limit", "None");
        result.put("namespace", "None");
        result.put("offset", "None");
        return result;
    }
}