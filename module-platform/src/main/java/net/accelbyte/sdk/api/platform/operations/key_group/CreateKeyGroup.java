/*
 * Copyright (c) 2024 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.platform.operations.key_group;

import java.io.*;
import java.util.*;

import lombok.Builder;
import lombok.Getter;
import lombok.Setter;

import net.accelbyte.sdk.api.platform.models.*;
import net.accelbyte.sdk.core.Operation;
import net.accelbyte.sdk.core.HttpResponseException;
import net.accelbyte.sdk.core.util.Helper;
import net.accelbyte.sdk.core.ApiError;
import net.accelbyte.sdk.api.platform.operation_responses.key_group.CreateKeyGroupOpResponse;

/**
 * createKeyGroup
 *
 * Create key group.
 * Other detail info:
 * 
 *   * Returns : created key group
 */
@Getter
@Setter
public class CreateKeyGroup extends Operation {
    /**
     * generated field's value
     */
    private String path = "/platform/admin/namespaces/{namespace}/keygroups";
    private String method = "POST";
    private List<String> consumes = Arrays.asList("application/json");
    private List<String> produces = Arrays.asList("application/json");
    private String locationQuery = null;
    /**
     * fields as input parameter
     */
    private String namespace;
    private KeyGroupCreate body;

    /**
    * @param namespace required
    * @param body required
    */
    @Builder
    // @deprecated 2022-08-29 - All args constructor may cause problems. Use builder instead.
    @Deprecated
    public CreateKeyGroup(
            String customBasePath,            String namespace,
            KeyGroupCreate body
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
    public KeyGroupCreate getBodyParams(){
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

    public CreateKeyGroupOpResponse parseResponse(int code, String contentType, InputStream payload) throws HttpResponseException, IOException {
        final CreateKeyGroupOpResponse response = new CreateKeyGroupOpResponse();

        response.setHttpStatusCode(code);
        response.setContentType(contentType);

        if (code == 204) {
            response.setSuccess(true);
        }
        else if ((code == 200) || (code == 201)) {
            final String json = Helper.convertInputStreamToString(payload);
            response.setData(new KeyGroupInfo().createFromJson(json));
            response.setSuccess(true);
        }
        else if (code == 409) {
            final String json = Helper.convertInputStreamToString(payload);
            response.setError409(new ErrorEntity().createFromJson(json));
            response.setError(response.getError409().translateToApiError());
        }
        else if (code == 422) {
            final String json = Helper.convertInputStreamToString(payload);
            response.setError422(new ValidationErrorEntity().createFromJson(json));
            response.setError(response.getError422().translateToApiError());
        }

        return response;
    }

    /*
    public KeyGroupInfo parseResponse(int code, String contentType, InputStream payload) throws HttpResponseException, IOException {
        if(code != 201){
            final String json = Helper.convertInputStreamToString(payload);
            throw new HttpResponseException(code, json);
        }
        final String json = Helper.convertInputStreamToString(payload);
        return new KeyGroupInfo().createFromJson(json);
    }
    */

}