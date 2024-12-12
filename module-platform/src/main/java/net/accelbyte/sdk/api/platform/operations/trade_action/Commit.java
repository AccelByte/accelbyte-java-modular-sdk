/*
 * Copyright (c) 2024 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.platform.operations.trade_action;

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
import net.accelbyte.sdk.api.platform.operation_responses.trade_action.CommitOpResponse;

/**
 * commit
 *
 * This API is used to create a chained operations
 * 
 * Other detail info:
 * 
 *   * Returns : chain action history
 *   *  FULFILL_ITEM operation supported item type : INGAMEITEM,LOOTBOX,OPTIONBOX
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
public class Commit extends Operation {
    /**
     * generated field's value
     */
    private String path = "/platform/admin/namespaces/{namespace}/trade/commit";
    private String method = "POST";
    private List<String> consumes = Arrays.asList("application/json");
    private List<String> produces = Arrays.asList("application/json");
    private String locationQuery = null;
    /**
     * fields as input parameter
     */
    private String namespace;
    private TradeChainedActionCommitRequest body;

    /**
    * @param namespace required
    * @param body required
    */
    @Builder
    // @deprecated 2022-08-29 - All args constructor may cause problems. Use builder instead.
    @Deprecated
    public Commit(
            String customBasePath,            String namespace,
            TradeChainedActionCommitRequest body
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
    public TradeChainedActionCommitRequest getBodyParams(){
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

    public CommitOpResponse parseResponse(int code, String contentType, InputStream payload) throws HttpResponseException, IOException {
        final CommitOpResponse response = new CommitOpResponse();

        response.setHttpStatusCode(code);
        response.setContentType(contentType);

        if (code == 204) {
            response.setSuccess(true);
        }
        else if ((code == 200) || (code == 201)) {
            final String json = Helper.convertInputStreamToString(payload);
            response.setData(new TradeChainActionHistoryInfo().createFromJson(json));
            response.setSuccess(true);
        }

        return response;
    }

    /*
    public TradeChainActionHistoryInfo parseResponse(int code, String contentType, InputStream payload) throws HttpResponseException, IOException {
        if(code != 200){
            final String json = Helper.convertInputStreamToString(payload);
            throw new HttpResponseException(code, json);
        }
        final String json = Helper.convertInputStreamToString(payload);
        return new TradeChainActionHistoryInfo().createFromJson(json);
    }
    */

}