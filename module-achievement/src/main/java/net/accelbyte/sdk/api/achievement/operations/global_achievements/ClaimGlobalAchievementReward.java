/*
 * Copyright (c) 2024 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.achievement.operations.global_achievements;

import java.io.*;
import java.util.*;

import lombok.Builder;
import lombok.Getter;
import lombok.Setter;

import net.accelbyte.sdk.api.achievement.models.*;
import net.accelbyte.sdk.core.Operation;
import net.accelbyte.sdk.core.HttpResponseException;
import net.accelbyte.sdk.core.util.Helper;
import net.accelbyte.sdk.core.ApiError;
import net.accelbyte.sdk.api.achievement.operation_responses.global_achievements.ClaimGlobalAchievementRewardOpResponse;

/**
 * ClaimGlobalAchievementReward
 *
 * 
 * 
 * Required permission
 * `NAMESPACE:{namespace}:USER:{userId}:ACHIEVEMENT [UPDATE]` and scope `social`
 * 
 * 
 * 
 * 
 * Note:
 * 
 * 
 * 
 * 
 * Global achievement should be unlocked to claim the reward. Only contributor of global achievement are eligible for rewards
 */
@Getter
@Setter
public class ClaimGlobalAchievementReward extends Operation {
    /**
     * generated field's value
     */
    private String path = "/achievement/v1/public/namespaces/{namespace}/users/{userId}/global/achievements/{achievementCode}/claim";
    private String method = "POST";
    private List<String> consumes = Arrays.asList("application/json");
    private List<String> produces = Arrays.asList("application/json");
    private String locationQuery = null;
    /**
     * fields as input parameter
     */
    private String achievementCode;
    private String namespace;
    private String userId;

    /**
    * @param achievementCode required
    * @param namespace required
    * @param userId required
    */
    @Builder
    // @deprecated 2022-08-29 - All args constructor may cause problems. Use builder instead.
    @Deprecated
    public ClaimGlobalAchievementReward(
            String customBasePath,            String achievementCode,
            String namespace,
            String userId
    )
    {
        this.achievementCode = achievementCode;
        this.namespace = namespace;
        this.userId = userId;
        super.customBasePath = customBasePath != null ? customBasePath : "";

        securities.add("Bearer");
    }

    @Override
    public Map<String, String> getPathParams(){
        Map<String, String> pathParams = new HashMap<>();
        if (this.achievementCode != null){
            pathParams.put("achievementCode", this.achievementCode);
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
    public boolean isValid() {
        if(this.achievementCode == null) {
            return false;
        }
        if(this.namespace == null) {
            return false;
        }
        if(this.userId == null) {
            return false;
        }
        return true;
    }

    public ClaimGlobalAchievementRewardOpResponse parseResponse(int code, String contentType, InputStream payload) throws HttpResponseException, IOException {
        final ClaimGlobalAchievementRewardOpResponse response = new ClaimGlobalAchievementRewardOpResponse();

        response.setHttpStatusCode(code);
        response.setContentType(contentType);

        if (code == 204) {
            response.setSuccess(true);
        }
        else if ((code == 200) || (code == 201) || (code == 202)) {
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
        else if (code == 500) {
            final String json = Helper.convertInputStreamToString(payload);
            response.setError500(new ResponseError().createFromJson(json));
            response.setError(response.getError500().translateToApiError());
        }

        return response;
    }

    /*
    public void handleEmptyResponse(int code, String contentType, InputStream payload) throws HttpResponseException, IOException {
        if(code != 202){
            final String json = Helper.convertInputStreamToString(payload);
            throw new HttpResponseException(code, json);
        }
    }
    */

}