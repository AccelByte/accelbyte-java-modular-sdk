/*
 * Copyright (c) 2024 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.inventory.operations.admin_inventory_configurations;

import java.io.*;
import java.util.*;

import lombok.Builder;
import lombok.Getter;
import lombok.Setter;

import net.accelbyte.sdk.api.inventory.models.*;
import net.accelbyte.sdk.core.Operation;
import net.accelbyte.sdk.core.HttpResponseException;
import net.accelbyte.sdk.core.util.Helper;
import net.accelbyte.sdk.core.ApiError;
import net.accelbyte.sdk.api.inventory.operation_responses.admin_inventory_configurations.AdminUpdateInventoryConfigurationOpResponse;

/**
 * AdminUpdateInventoryConfiguration
 *
 * 
 * Updating inventory configuration.
 * There cannot be duplicate code per namespace.
 * 
 * Permission: ADMIN:NAMESPACE:{namespace}:INVENTORY:CONFIGURATION [UPDATE]
 */
@Getter
@Setter
public class AdminUpdateInventoryConfiguration extends Operation {
    /**
     * generated field's value
     */
    private String path = "/inventory/v1/admin/namespaces/{namespace}/inventoryConfigurations/{inventoryConfigurationId}";
    private String method = "PUT";
    private List<String> consumes = Arrays.asList("application/json");
    private List<String> produces = Arrays.asList("application/json");
    private String locationQuery = null;
    /**
     * fields as input parameter
     */
    private String inventoryConfigurationId;
    private String namespace;
    private ApimodelsInventoryConfigurationReq body;

    /**
    * @param inventoryConfigurationId required
    * @param namespace required
    * @param body required
    */
    @Builder
    // @deprecated 2022-08-29 - All args constructor may cause problems. Use builder instead.
    @Deprecated
    public AdminUpdateInventoryConfiguration(
            String customBasePath,            String inventoryConfigurationId,
            String namespace,
            ApimodelsInventoryConfigurationReq body
    )
    {
        this.inventoryConfigurationId = inventoryConfigurationId;
        this.namespace = namespace;
        this.body = body;
        super.customBasePath = customBasePath != null ? customBasePath : "";

        securities.add("Bearer");
    }

    @Override
    public Map<String, String> getPathParams(){
        Map<String, String> pathParams = new HashMap<>();
        if (this.inventoryConfigurationId != null){
            pathParams.put("inventoryConfigurationId", this.inventoryConfigurationId);
        }
        if (this.namespace != null){
            pathParams.put("namespace", this.namespace);
        }
        return pathParams;
    }



    @Override
    public ApimodelsInventoryConfigurationReq getBodyParams(){
        return this.body;
    }


    @Override
    public boolean isValid() {
        if(this.inventoryConfigurationId == null) {
            return false;
        }
        if(this.namespace == null) {
            return false;
        }
        if(this.body == null) {
            return false;
        }
        return true;
    }

    public AdminUpdateInventoryConfigurationOpResponse parseResponse(int code, String contentType, InputStream payload) throws HttpResponseException, IOException {
        final AdminUpdateInventoryConfigurationOpResponse response = new AdminUpdateInventoryConfigurationOpResponse();

        response.setHttpStatusCode(code);
        response.setContentType(contentType);

        if (code == 204) {
            response.setSuccess(true);
        }
        else if ((code == 200) || (code == 201)) {
            final String json = Helper.convertInputStreamToString(payload);
            response.setData(new ApimodelsInventoryConfigurationResp().createFromJson(json));
            response.setSuccess(true);
        }
        else if (code == 400) {
            final String json = Helper.convertInputStreamToString(payload);
            response.setError400(new ApimodelsErrorResponse().createFromJson(json));
            response.setError(response.getError400().translateToApiError());
        }
        else if (code == 404) {
            final String json = Helper.convertInputStreamToString(payload);
            response.setError404(new ApimodelsErrorResponse().createFromJson(json));
            response.setError(response.getError404().translateToApiError());
        }
        else if (code == 409) {
            final String json = Helper.convertInputStreamToString(payload);
            response.setError409(new ApimodelsErrorResponse().createFromJson(json));
            response.setError(response.getError409().translateToApiError());
        }
        else if (code == 500) {
            final String json = Helper.convertInputStreamToString(payload);
            response.setError500(new ApimodelsErrorResponse().createFromJson(json));
            response.setError(response.getError500().translateToApiError());
        }

        return response;
    }

    /*
    public ApimodelsInventoryConfigurationResp parseResponse(int code, String contentType, InputStream payload) throws HttpResponseException, IOException {
        if(code != 200){
            final String json = Helper.convertInputStreamToString(payload);
            throw new HttpResponseException(code, json);
        }
        final String json = Helper.convertInputStreamToString(payload);
        return new ApimodelsInventoryConfigurationResp().createFromJson(json);
    }
    */

}