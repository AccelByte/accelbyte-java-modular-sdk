/*
 * Copyright (c) 2024 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.basic.operations.namespace;

import java.io.*;
import java.util.*;

import lombok.Builder;
import lombok.Getter;
import lombok.Setter;

import net.accelbyte.sdk.api.basic.models.*;
import net.accelbyte.sdk.core.Operation;
import net.accelbyte.sdk.core.HttpResponseException;
import net.accelbyte.sdk.core.util.Helper;
import net.accelbyte.sdk.core.ApiError;
import net.accelbyte.sdk.api.basic.operation_responses.namespace.CreateNamespaceOpResponse;

/**
 * createNamespace
 *
 * Create a namespace.
 * By default the namespace is enabled.
 * In multi tenant mode, parentNamespace will be automatically filled with requester namespace if the requester is using studio or publisher token, and it will be filled with studio namespace if the requester uses game token. An oauth client will also be created and the id will be returned.
 * displayName rule:
 * 
 * 
 *   * Alphanumeric lowercase and uppercase are allowed
 *   * Allowed Special Character: ',. -
 *   * Must start and end with alphanumeric
 *   * Spaces and special character are allowed but cannot appear twice in a row
 * 
 * 
 * Other detail info:
 * 
 *   * Action code : 11301
 *   *  Returns : created namespace
 */
@Getter
@Setter
public class CreateNamespace extends Operation {
    /**
     * generated field's value
     */
    private String path = "/basic/v1/admin/namespaces";
    private String method = "POST";
    private List<String> consumes = Arrays.asList("application/json");
    private List<String> produces = Arrays.asList("application/json");
    private String locationQuery = null;
    /**
     * fields as input parameter
     */
    private NamespaceCreate body;

    /**
    */
    @Builder
    // @deprecated 2022-08-29 - All args constructor may cause problems. Use builder instead.
    @Deprecated
    public CreateNamespace(
            String customBasePath,            NamespaceCreate body
    )
    {
        this.body = body;
        super.customBasePath = customBasePath != null ? customBasePath : "";

        securities.add("Bearer");
    }




    @Override
    public NamespaceCreate getBodyParams(){
        return this.body;
    }


    @Override
    public boolean isValid() {
        return true;
    }

    public CreateNamespaceOpResponse parseResponse(int code, String contentType, InputStream payload) throws HttpResponseException, IOException {
        final CreateNamespaceOpResponse response = new CreateNamespaceOpResponse();

        response.setHttpStatusCode(code);
        response.setContentType(contentType);

        if (code == 204) {
            response.setSuccess(true);
        }
        else if ((code == 200) || (code == 201)) {
            final String json = Helper.convertInputStreamToString(payload);
            response.setData(new NamespaceInfo().createFromJson(json));
            response.setSuccess(true);
        }
        else if (code == 400) {
            final String json = Helper.convertInputStreamToString(payload);
            response.setError400(new ValidationErrorEntity().createFromJson(json));
            response.setError(response.getError400().translateToApiError());
        }
        else if (code == 401) {
            final String json = Helper.convertInputStreamToString(payload);
            response.setError401(new ErrorEntity().createFromJson(json));
            response.setError(response.getError401().translateToApiError());
        }
        else if (code == 403) {
            final String json = Helper.convertInputStreamToString(payload);
            response.setError403(new ErrorEntity().createFromJson(json));
            response.setError(response.getError403().translateToApiError());
        }
        else if (code == 409) {
            final String json = Helper.convertInputStreamToString(payload);
            response.setError409(new ErrorEntity().createFromJson(json));
            response.setError(response.getError409().translateToApiError());
        }

        return response;
    }

    /*
    public NamespaceInfo parseResponse(int code, String contentType, InputStream payload) throws HttpResponseException, IOException {
        if(code != 201){
            final String json = Helper.convertInputStreamToString(payload);
            throw new HttpResponseException(code, json);
        }
        final String json = Helper.convertInputStreamToString(payload);
        return new NamespaceInfo().createFromJson(json);
    }
    */

}