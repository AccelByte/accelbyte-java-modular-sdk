/*
 * Copyright (c) 2024 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.platform.operations.payment_config;

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
import net.accelbyte.sdk.api.platform.operation_responses.payment_config.UpdatePaymentDomainWhitelistConfigOpResponse;

/**
 * updatePaymentDomainWhitelistConfig
 *
 *  [Not supported yet in AGS Shared Cloud] Update payment provider config by namespace.
 * 
 * 
 * 
 *      Request Body Parameters:
 * 
 * 
 *      Parameter | Type   | Required | Description
 *     -----------|--------|----------|--------------------------------------------------
 *     domains    | String | Yes      | list of domains to whitelist for the return URL.
 * 
 * 
 * 
 * Other detail info:
 * 
 *   * Validation : the domain should include the protocol (http/https), but the whitelist check will only compare the host part (www.example.com)
 *   *  Returns : payment domain whitelist config
 */
@Getter
@Setter
public class UpdatePaymentDomainWhitelistConfig extends Operation {
    /**
     * generated field's value
     */
    private String path = "/platform/admin/namespaces/{namespace}/payment/config/domains";
    private String method = "PUT";
    private List<String> consumes = Arrays.asList("application/json");
    private List<String> produces = Arrays.asList("application/json");
    private String locationQuery = null;
    /**
     * fields as input parameter
     */
    private String namespace;
    private PaymentDomainWhitelistConfigEdit body;

    /**
    * @param namespace required
    * @param body required
    */
    @Builder
    // @deprecated 2022-08-29 - All args constructor may cause problems. Use builder instead.
    @Deprecated
    public UpdatePaymentDomainWhitelistConfig(
            String customBasePath,            String namespace,
            PaymentDomainWhitelistConfigEdit body
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
    public PaymentDomainWhitelistConfigEdit getBodyParams(){
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

    public UpdatePaymentDomainWhitelistConfigOpResponse parseResponse(int code, String contentType, InputStream payload) throws HttpResponseException, IOException {
        final UpdatePaymentDomainWhitelistConfigOpResponse response = new UpdatePaymentDomainWhitelistConfigOpResponse();

        response.setHttpStatusCode(code);
        response.setContentType(contentType);

        if (code == 204) {
            response.setSuccess(true);
        }
        else if ((code == 200) || (code == 201)) {
            final String json = Helper.convertInputStreamToString(payload);
            response.setData(new PaymentDomainWhitelistConfigInfo().createFromJson(json));
            response.setSuccess(true);
        }
        else if (code == 422) {
            final String json = Helper.convertInputStreamToString(payload);
            response.setError422(new ValidationErrorEntity().createFromJson(json));
            response.setError(response.getError422().translateToApiError());
        }

        return response;
    }

    /*
    public PaymentDomainWhitelistConfigInfo parseResponse(int code, String contentType, InputStream payload) throws HttpResponseException, IOException {
        if(code != 200){
            final String json = Helper.convertInputStreamToString(payload);
            throw new HttpResponseException(code, json);
        }
        final String json = Helper.convertInputStreamToString(payload);
        return new PaymentDomainWhitelistConfigInfo().createFromJson(json);
    }
    */

}