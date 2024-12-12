/*
 * Copyright (c) 2024 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.reporting.operations.admin_extension_categories_and_auto_moderation_actions;

import java.io.*;
import java.util.*;

import lombok.Builder;
import lombok.Getter;
import lombok.Setter;

import net.accelbyte.sdk.api.reporting.models.*;
import net.accelbyte.sdk.core.Operation;
import net.accelbyte.sdk.core.HttpResponseException;
import net.accelbyte.sdk.core.util.Helper;
import net.accelbyte.sdk.core.ApiError;
import net.accelbyte.sdk.api.reporting.operation_responses.admin_extension_categories_and_auto_moderation_actions.AdminCreateExtensionCategoryOpResponse;

/**
 * adminCreateExtensionCategory
 *
 * Create extension category data
 */
@Getter
@Setter
public class AdminCreateExtensionCategory extends Operation {
    /**
     * generated field's value
     */
    private String path = "/reporting/v1/admin/extensionCategories";
    private String method = "POST";
    private List<String> consumes = Arrays.asList("application/json");
    private List<String> produces = Arrays.asList("application/json");
    private String locationQuery = null;
    /**
     * fields as input parameter
     */
    private RestapiExtensionCategoryApiRequest body;

    /**
    * @param body required
    */
    @Builder
    // @deprecated 2022-08-29 - All args constructor may cause problems. Use builder instead.
    @Deprecated
    public AdminCreateExtensionCategory(
            String customBasePath,            RestapiExtensionCategoryApiRequest body
    )
    {
        this.body = body;
        super.customBasePath = customBasePath != null ? customBasePath : "";

        securities.add("Bearer");
    }




    @Override
    public RestapiExtensionCategoryApiRequest getBodyParams(){
        return this.body;
    }


    @Override
    public boolean isValid() {
        if(this.body == null) {
            return false;
        }
        return true;
    }

    public AdminCreateExtensionCategoryOpResponse parseResponse(int code, String contentType, InputStream payload) throws HttpResponseException, IOException {
        final AdminCreateExtensionCategoryOpResponse response = new AdminCreateExtensionCategoryOpResponse();

        response.setHttpStatusCode(code);
        response.setContentType(contentType);

        if (code == 204) {
            response.setSuccess(true);
        }
        else if ((code == 200) || (code == 201)) {
            final String json = Helper.convertInputStreamToString(payload);
            response.setData(new RestapiExtensionCategoryApiResponse().createFromJson(json));
            response.setSuccess(true);
        }
        else if (code == 400) {
            final String json = Helper.convertInputStreamToString(payload);
            response.setError400(new RestapiErrorResponse().createFromJson(json));
            response.setError(response.getError400().translateToApiError());
        }
        else if (code == 500) {
            final String json = Helper.convertInputStreamToString(payload);
            response.setError500(new RestapiErrorResponse().createFromJson(json));
            response.setError(response.getError500().translateToApiError());
        }

        return response;
    }

    /*
    public RestapiExtensionCategoryApiResponse parseResponse(int code, String contentType, InputStream payload) throws HttpResponseException, IOException {
        if(code != 201){
            final String json = Helper.convertInputStreamToString(payload);
            throw new HttpResponseException(code, json);
        }
        final String json = Helper.convertInputStreamToString(payload);
        return new RestapiExtensionCategoryApiResponse().createFromJson(json);
    }
    */

}