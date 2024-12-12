/*
 * Copyright (c) 2024 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.social.operations.slot;

import java.io.*;
import java.util.*;

import lombok.Builder;
import lombok.Getter;
import lombok.Setter;

import net.accelbyte.sdk.api.social.models.*;
import net.accelbyte.sdk.core.Operation;
import net.accelbyte.sdk.core.HttpResponseException;
import net.accelbyte.sdk.core.util.Helper;
import net.accelbyte.sdk.core.ApiError;
import net.accelbyte.sdk.api.social.operation_responses.slot.PublicCreateUserNamespaceSlotOpResponse;

/**
 * publicCreateUserNamespaceSlot
 *
 * 
 * 
 * ## The endpoint is going to be deprecated
 * 
 * 
 * Creates a slot.
 * Other detail info:
 *         *  Returns : created slot info
 *
 * @deprecated
 */
@Deprecated
@Getter
@Setter
public class PublicCreateUserNamespaceSlot extends Operation {
    /**
     * generated field's value
     */
    private String path = "/social/public/namespaces/{namespace}/users/{userId}/slots";
    private String method = "POST";
    private List<String> consumes = Arrays.asList("multipart/form-data");
    private List<String> produces = Arrays.asList("application/json");
    private String locationQuery = null;
    /**
     * fields as input parameter
     */
    private String namespace;
    private String userId;
    private String label;
    private List<String> tags;
    private String checksum;
    private String customAttribute;
    private File file;

    /**
    * @param namespace required
    * @param userId required
    */
    @Builder
    // @deprecated 2022-08-29 - All args constructor may cause problems. Use builder instead.
    @Deprecated
    public PublicCreateUserNamespaceSlot(
            String customBasePath,            String namespace,
            String userId,
            String label,
            List<String> tags,
            String checksum,
            String customAttribute,
            File file
    )
    {
        this.namespace = namespace;
        this.userId = userId;
        this.label = label;
        this.tags = tags;
        this.checksum = checksum;
        this.customAttribute = customAttribute;
        this.file = file;
        super.customBasePath = customBasePath != null ? customBasePath : "";

        securities.add("Bearer");
    }

    @Override
    public Map<String, String> getPathParams(){
        Map<String, String> pathParams = new HashMap<>();
        if (this.namespace != null){
            pathParams.put("namespace", this.namespace);
        }
        if (this.userId != null){
            pathParams.put("userId", this.userId);
        }
        return pathParams;
    }

    @Override
    public Map<String, List<String>> getQueryParams(){
        Map<String, List<String>> queryParams = new HashMap<>();
        queryParams.put("label", this.label == null ? null : Arrays.asList(this.label));
        queryParams.put("tags", this.tags == null ? null : this.tags.stream().map(i -> String.valueOf(i)).collect(java.util.stream.Collectors.toList()));
        return queryParams;
    }



    @Override
    public Map<String, Object> getFormParams(){
        Map<String, Object> formDataParams = new HashMap<>();
        if (this.checksum != null) {
            formDataParams.put("checksum", this.checksum);
        }
        if (this.customAttribute != null) {
            formDataParams.put("customAttribute", this.customAttribute);
        }
        if (this.file != null) {
            formDataParams.put("file", this.file);
        }
        return formDataParams;
    }

    @Override
    public boolean isValid() {
        if(this.namespace == null) {
            return false;
        }
        if(this.userId == null) {
            return false;
        }
        return true;
    }

    public PublicCreateUserNamespaceSlotOpResponse parseResponse(int code, String contentType, InputStream payload) throws HttpResponseException, IOException {
        final PublicCreateUserNamespaceSlotOpResponse response = new PublicCreateUserNamespaceSlotOpResponse();

        response.setHttpStatusCode(code);
        response.setContentType(contentType);

        if (code == 204) {
            response.setSuccess(true);
        }
        else if (code == 201) {
            response.setSuccess(true);
        }
        else if (code == 400) {
            final String json = Helper.convertInputStreamToString(payload);
            response.setError400(new ErrorEntity().createFromJson(json));
            response.setError(response.getError400().translateToApiError());
        }
        else if (code == 409) {
            final String json = Helper.convertInputStreamToString(payload);
            response.setError409(new ErrorEntity().createFromJson(json));
            response.setError(response.getError409().translateToApiError());
        }

        return response;
    }

    /*
    public void handleEmptyResponse(int code, String contentType, InputStream payload) throws HttpResponseException, IOException {
        if(code != 201){
            final String json = Helper.convertInputStreamToString(payload);
            throw new HttpResponseException(code, json);
        }
    }
    */

    @Override
    protected Map<String, String> getCollectionFormatMap() {
        Map<String, String> result = new HashMap<>();
        result.put("label", "None");
        result.put("tags", "multi");
        return result;
    }
}