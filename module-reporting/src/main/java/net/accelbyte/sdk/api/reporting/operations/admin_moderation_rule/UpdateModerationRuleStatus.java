/*
 * Copyright (c) 2024 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.reporting.operations.admin_moderation_rule;

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
import net.accelbyte.sdk.api.reporting.operation_responses.admin_moderation_rule.UpdateModerationRuleStatusOpResponse;

/**
 * updateModerationRuleStatus
 *
 * This endpoint enable/disable moderation rule status.
 */
@Getter
@Setter
public class UpdateModerationRuleStatus extends Operation {
    /**
     * generated field's value
     */
    private String path = "/reporting/v1/admin/namespaces/{namespace}/rule/{ruleId}/status";
    private String method = "PUT";
    private List<String> consumes = Arrays.asList("application/json");
    private List<String> produces = Arrays.asList("application/json");
    private String locationQuery = null;
    /**
     * fields as input parameter
     */
    private String namespace;
    private String ruleId;
    private RestapiModerationRuleActiveRequest body;

    /**
    * @param namespace required
    * @param ruleId required
    * @param body required
    */
    @Builder
    // @deprecated 2022-08-29 - All args constructor may cause problems. Use builder instead.
    @Deprecated
    public UpdateModerationRuleStatus(
            String customBasePath,            String namespace,
            String ruleId,
            RestapiModerationRuleActiveRequest body
    )
    {
        this.namespace = namespace;
        this.ruleId = ruleId;
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
        if (this.ruleId != null){
            pathParams.put("ruleId", this.ruleId);
        }
        return pathParams;
    }



    @Override
    public RestapiModerationRuleActiveRequest getBodyParams(){
        return this.body;
    }


    @Override
    public boolean isValid() {
        if(this.namespace == null) {
            return false;
        }
        if(this.ruleId == null) {
            return false;
        }
        if(this.body == null) {
            return false;
        }
        return true;
    }

    public UpdateModerationRuleStatusOpResponse parseResponse(int code, String contentType, InputStream payload) throws HttpResponseException, IOException {
        final UpdateModerationRuleStatusOpResponse response = new UpdateModerationRuleStatusOpResponse();

        response.setHttpStatusCode(code);
        response.setContentType(contentType);

        if (code == 204) {
            response.setSuccess(true);
        }
        else if (code == 400) {
            final String json = Helper.convertInputStreamToString(payload);
            response.setError400(new RestapiErrorResponse().createFromJson(json));
            response.setError(response.getError400().translateToApiError());
        }
        else if (code == 404) {
            final String json = Helper.convertInputStreamToString(payload);
            response.setError404(new RestapiErrorResponse().createFromJson(json));
            response.setError(response.getError404().translateToApiError());
        }
        else if (code == 500) {
            final String json = Helper.convertInputStreamToString(payload);
            response.setError500(new RestapiErrorResponse().createFromJson(json));
            response.setError(response.getError500().translateToApiError());
        }

        return response;
    }

    /*
    public void handleEmptyResponse(int code, String contentType, InputStream payload) throws HttpResponseException, IOException {
        if(code != 204){
            final String json = Helper.convertInputStreamToString(payload);
            throw new HttpResponseException(code, json);
        }
    }
    */

}