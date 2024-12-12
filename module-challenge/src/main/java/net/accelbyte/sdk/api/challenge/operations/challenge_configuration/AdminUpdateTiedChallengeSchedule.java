/*
 * Copyright (c) 2024 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.challenge.operations.challenge_configuration;

import java.io.*;
import java.util.*;

import lombok.Builder;
import lombok.Getter;
import lombok.Setter;

import net.accelbyte.sdk.api.challenge.models.*;
import net.accelbyte.sdk.core.Operation;
import net.accelbyte.sdk.core.HttpResponseException;
import net.accelbyte.sdk.core.util.Helper;
import net.accelbyte.sdk.core.ApiError;
import net.accelbyte.sdk.api.challenge.operation_responses.challenge_configuration.AdminUpdateTiedChallengeScheduleOpResponse;

/**
 * adminUpdateTiedChallengeSchedule
 *
 * 
 *     * Required permission: ADMIN:NAMESPACE:{namespace}:CHALLENGE [UPDATE]
 * 
 * Request body:
 *     * action: Update the challenge schedule. The available options are:
 *       * STOP: Ends the challenge, changing its status to RETIRED. This option supports all types of challenges.
 *       * ACCELERATE: Speeds up the challenge's end time. Note that this option does not apply to challenges with an 'endAfter' value.
 *     * endDate: The timestamp specifying when the challenge should end (required if the action is ACCELERATE).
 */
@Getter
@Setter
public class AdminUpdateTiedChallengeSchedule extends Operation {
    /**
     * generated field's value
     */
    private String path = "/challenge/v1/admin/namespaces/{namespace}/challenges/{challengeCode}/tied/schedule";
    private String method = "PUT";
    private List<String> consumes = Arrays.asList("application/json");
    private List<String> produces = Arrays.asList("application/json");
    private String locationQuery = null;
    /**
     * fields as input parameter
     */
    private String challengeCode;
    private String namespace;
    private ModelUpdateChallengeScheduleRequest body;

    /**
    * @param challengeCode required
    * @param namespace required
    * @param body required
    */
    @Builder
    // @deprecated 2022-08-29 - All args constructor may cause problems. Use builder instead.
    @Deprecated
    public AdminUpdateTiedChallengeSchedule(
            String customBasePath,            String challengeCode,
            String namespace,
            ModelUpdateChallengeScheduleRequest body
    )
    {
        this.challengeCode = challengeCode;
        this.namespace = namespace;
        this.body = body;
        super.customBasePath = customBasePath != null ? customBasePath : "";

        securities.add("Bearer");
    }

    @Override
    public Map<String, String> getPathParams(){
        Map<String, String> pathParams = new HashMap<>();
        if (this.challengeCode != null){
            pathParams.put("challengeCode", this.challengeCode);
        }
        if (this.namespace != null){
            pathParams.put("namespace", this.namespace);
        }
        return pathParams;
    }



    @Override
    public ModelUpdateChallengeScheduleRequest getBodyParams(){
        return this.body;
    }


    @Override
    public boolean isValid() {
        if(this.challengeCode == null) {
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

    public AdminUpdateTiedChallengeScheduleOpResponse parseResponse(int code, String contentType, InputStream payload) throws HttpResponseException, IOException {
        final AdminUpdateTiedChallengeScheduleOpResponse response = new AdminUpdateTiedChallengeScheduleOpResponse();

        response.setHttpStatusCode(code);
        response.setContentType(contentType);

        if (code == 204) {
            response.setSuccess(true);
        }
        else if ((code == 200) || (code == 201)) {
            final String json = Helper.convertInputStreamToString(payload);
            response.setData(new ModelChallengeResponse().createFromJson(json));
            response.setSuccess(true);
        }
        else if (code == 400) {
            final String json = Helper.convertInputStreamToString(payload);
            response.setError400(new ResponseError().createFromJson(json));
            response.setError(response.getError400().translateToApiError());
        }
        else if (code == 401) {
            final String json = Helper.convertInputStreamToString(payload);
            response.setError401(new ResponseError().createFromJson(json));
            response.setError(response.getError401().translateToApiError());
        }
        else if (code == 403) {
            final String json = Helper.convertInputStreamToString(payload);
            response.setError403(new ResponseError().createFromJson(json));
            response.setError(response.getError403().translateToApiError());
        }
        else if (code == 404) {
            final String json = Helper.convertInputStreamToString(payload);
            response.setError404(new ResponseError().createFromJson(json));
            response.setError(response.getError404().translateToApiError());
        }
        else if (code == 500) {
            final String json = Helper.convertInputStreamToString(payload);
            response.setError500(new ResponseError().createFromJson(json));
            response.setError(response.getError500().translateToApiError());
        }

        return response;
    }

    /*
    public ModelChallengeResponse parseResponse(int code, String contentType, InputStream payload) throws HttpResponseException, IOException {
        if(code != 200){
            final String json = Helper.convertInputStreamToString(payload);
            throw new HttpResponseException(code, json);
        }
        final String json = Helper.convertInputStreamToString(payload);
        return new ModelChallengeResponse().createFromJson(json);
    }
    */

}