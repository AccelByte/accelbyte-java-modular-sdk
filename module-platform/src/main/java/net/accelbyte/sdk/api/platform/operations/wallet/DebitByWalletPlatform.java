/*
 * Copyright (c) 2024 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.platform.operations.wallet;

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
import net.accelbyte.sdk.api.platform.operation_responses.wallet.DebitByWalletPlatformOpResponse;

/**
 * debitByWalletPlatform
 *
 * Pay with user wallet by currency code and client platform.
 * Other detail info:
 * 
 * 
 * 
 * 
 * ## Restrictions for metadata
 * 
 * 
 * 1. Cannot use "." as the key name
 * -
 * 
 * 
 *     { "data.2": "value" }
 * 
 * 
 * 2. Cannot use "$" as the prefix in key names
 * -
 * 
 * 
 *     { "$data": "value" }
 */
@Getter
@Setter
public class DebitByWalletPlatform extends Operation {
    /**
     * generated field's value
     */
    private String path = "/platform/admin/namespaces/{namespace}/users/{userId}/wallets/{currencyCode}/debitByWalletPlatform";
    private String method = "PUT";
    private List<String> consumes = Arrays.asList("application/json");
    private List<String> produces = Arrays.asList("application/json");
    private String locationQuery = null;
    /**
     * fields as input parameter
     */
    private String currencyCode;
    private String namespace;
    private String userId;
    private DebitByWalletPlatformRequest request;

    /**
    * @param currencyCode required
    * @param namespace required
    * @param userId required
    * @param request required
    */
    @Builder
    // @deprecated 2022-08-29 - All args constructor may cause problems. Use builder instead.
    @Deprecated
    public DebitByWalletPlatform(
            String customBasePath,            String currencyCode,
            String namespace,
            String userId,
            DebitByWalletPlatformRequest request
    )
    {
        this.currencyCode = currencyCode;
        this.namespace = namespace;
        this.userId = userId;
        this.request = request;
        super.customBasePath = customBasePath != null ? customBasePath : "";

        securities.add("Bearer");
    }

    @Override
    public Map<String, String> getPathParams(){
        Map<String, String> pathParams = new HashMap<>();
        if (this.currencyCode != null){
            pathParams.put("currencyCode", this.currencyCode);
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
    public DebitByWalletPlatformRequest getBodyParams(){
        return this.request;
    }


    @Override
    public boolean isValid() {
        if(this.currencyCode == null) {
            return false;
        }
        if(this.namespace == null) {
            return false;
        }
        if(this.userId == null) {
            return false;
        }
        if(this.request == null) {
            return false;
        }
        return true;
    }

    public DebitByWalletPlatformOpResponse parseResponse(int code, String contentType, InputStream payload) throws HttpResponseException, IOException {
        final DebitByWalletPlatformOpResponse response = new DebitByWalletPlatformOpResponse();

        response.setHttpStatusCode(code);
        response.setContentType(contentType);

        if (code == 204) {
            response.setSuccess(true);
        }
        else if ((code == 200) || (code == 201)) {
            final String json = Helper.convertInputStreamToString(payload);
            response.setData(new PlatformWallet().createFromJson(json));
            response.setSuccess(true);
        }
        else if (code == 400) {
            final String json = Helper.convertInputStreamToString(payload);
            response.setError400(new ErrorEntity().createFromJson(json));
            response.setError(response.getError400().translateToApiError());
        }
        else if (code == 422) {
            final String json = Helper.convertInputStreamToString(payload);
            response.setError422(new ValidationErrorEntity().createFromJson(json));
            response.setError(response.getError422().translateToApiError());
        }

        return response;
    }

    /*
    public PlatformWallet parseResponse(int code, String contentType, InputStream payload) throws HttpResponseException, IOException {
        if(code != 200){
            final String json = Helper.convertInputStreamToString(payload);
            throw new HttpResponseException(code, json);
        }
        final String json = Helper.convertInputStreamToString(payload);
        return new PlatformWallet().createFromJson(json);
    }
    */

}