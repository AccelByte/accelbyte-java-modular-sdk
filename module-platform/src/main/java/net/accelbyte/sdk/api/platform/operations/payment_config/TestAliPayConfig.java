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
import net.accelbyte.sdk.api.platform.operation_responses.payment_config.TestAliPayConfigOpResponse;

/**
 * testAliPayConfig
 *
 *  [Not supported yet in AGS Shared Cloud] Test AliPay configuration.Reference: [Alipay Document](https://docs.open.alipay.com/270/alipay.trade.page.pay).
 * Other detail info:
 * 
 *   * Returns : test result
 */
@Getter
@Setter
public class TestAliPayConfig extends Operation {
    /**
     * generated field's value
     */
    private String path = "/platform/admin/payment/config/merchant/alipayconfig/test";
    private String method = "POST";
    private List<String> consumes = Arrays.asList("application/json");
    private List<String> produces = Arrays.asList("application/json");
    private String locationQuery = null;
    /**
     * fields as input parameter
     */
    private Boolean sandbox;
    private AliPayConfig body;

    /**
    * @param body required
    */
    @Builder
    // @deprecated 2022-08-29 - All args constructor may cause problems. Use builder instead.
    @Deprecated
    public TestAliPayConfig(
            String customBasePath,            Boolean sandbox,
            AliPayConfig body
    )
    {
        this.sandbox = sandbox;
        this.body = body;
        super.customBasePath = customBasePath != null ? customBasePath : "";

        securities.add("Bearer");
    }


    @Override
    public Map<String, List<String>> getQueryParams(){
        Map<String, List<String>> queryParams = new HashMap<>();
        queryParams.put("sandbox", this.sandbox == null ? null : Arrays.asList(String.valueOf(this.sandbox)));
        return queryParams;
    }


    @Override
    public AliPayConfig getBodyParams(){
        return this.body;
    }


    @Override
    public boolean isValid() {
        if(this.body == null) {
            return false;
        }
        return true;
    }

    public TestAliPayConfigOpResponse parseResponse(int code, String contentType, InputStream payload) throws HttpResponseException, IOException {
        final TestAliPayConfigOpResponse response = new TestAliPayConfigOpResponse();

        response.setHttpStatusCode(code);
        response.setContentType(contentType);

        if (code == 204) {
            response.setSuccess(true);
        }
        else if ((code == 200) || (code == 201)) {
            final String json = Helper.convertInputStreamToString(payload);
            response.setData(new TestResult().createFromJson(json));
            response.setSuccess(true);
        }

        return response;
    }

    /*
    public TestResult parseResponse(int code, String contentType, InputStream payload) throws HttpResponseException, IOException {
        if(code != 200){
            final String json = Helper.convertInputStreamToString(payload);
            throw new HttpResponseException(code, json);
        }
        final String json = Helper.convertInputStreamToString(payload);
        return new TestResult().createFromJson(json);
    }
    */

    @Override
    protected Map<String, String> getCollectionFormatMap() {
        Map<String, String> result = new HashMap<>();
        result.put("sandbox", "None");
        return result;
    }
}