/*
 * Copyright (c) 2024 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.sessionbrowser.operations.session;

import java.io.*;
import java.util.*;

import lombok.Builder;
import lombok.Getter;
import lombok.Setter;

import net.accelbyte.sdk.api.sessionbrowser.models.*;
import net.accelbyte.sdk.core.Operation;
import net.accelbyte.sdk.core.HttpResponseException;
import net.accelbyte.sdk.core.util.Helper;
import net.accelbyte.sdk.core.ApiError;
import net.accelbyte.sdk.api.sessionbrowser.operation_responses.session.GetActiveMatchmakingGameSessionsOpResponse;

/**
 * GetActiveMatchmakingGameSessions
 *
 * Get all active session for matchmaking game, this return only dedicated session type
 */
@Getter
@Setter
public class GetActiveMatchmakingGameSessions extends Operation {
    /**
     * generated field's value
     */
    private String path = "/sessionbrowser/admin/namespaces/{namespace}/gamesession/active/matchmaking-game";
    private String method = "GET";
    private List<String> consumes = Arrays.asList();
    private List<String> produces = Arrays.asList("application/json");
    private String locationQuery = null;
    /**
     * fields as input parameter
     */
    private String namespace;
    private Integer limit;
    private String matchId;
    private Integer offset;
    private String serverRegion;
    private String sessionId;

    /**
    * @param namespace required
    */
    @Builder
    // @deprecated 2022-08-29 - All args constructor may cause problems. Use builder instead.
    @Deprecated
    public GetActiveMatchmakingGameSessions(
            String customBasePath,            String namespace,
            Integer limit,
            String matchId,
            Integer offset,
            String serverRegion,
            String sessionId
    )
    {
        this.namespace = namespace;
        this.limit = limit;
        this.matchId = matchId;
        this.offset = offset;
        this.serverRegion = serverRegion;
        this.sessionId = sessionId;
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
    public Map<String, List<String>> getQueryParams(){
        Map<String, List<String>> queryParams = new HashMap<>();
        queryParams.put("limit", this.limit == null ? null : Arrays.asList(String.valueOf(this.limit)));
        queryParams.put("match_id", this.matchId == null ? null : Arrays.asList(this.matchId));
        queryParams.put("offset", this.offset == null ? null : Arrays.asList(String.valueOf(this.offset)));
        queryParams.put("server_region", this.serverRegion == null ? null : Arrays.asList(this.serverRegion));
        queryParams.put("session_id", this.sessionId == null ? null : Arrays.asList(this.sessionId));
        return queryParams;
    }




    @Override
    public boolean isValid() {
        if(this.namespace == null) {
            return false;
        }
        return true;
    }

    public GetActiveMatchmakingGameSessionsOpResponse parseResponse(int code, String contentType, InputStream payload) throws HttpResponseException, IOException {
        final GetActiveMatchmakingGameSessionsOpResponse response = new GetActiveMatchmakingGameSessionsOpResponse();

        response.setHttpStatusCode(code);
        response.setContentType(contentType);

        if (code == 204) {
            response.setSuccess(true);
        }
        else if ((code == 200) || (code == 201)) {
            final String json = Helper.convertInputStreamToString(payload);
            response.setData(new ModelsActiveMatchmakingGameResponse().createFromJson(json));
            response.setSuccess(true);
        }
        else if (code == 400) {
            final String json = Helper.convertInputStreamToString(payload);
            response.setError400(new RestapiErrorResponseV2().createFromJson(json));
            response.setError(response.getError400().translateToApiError());
        }
        else if (code == 500) {
            final String json = Helper.convertInputStreamToString(payload);
            response.setError500(new RestapiErrorResponseV2().createFromJson(json));
            response.setError(response.getError500().translateToApiError());
        }

        return response;
    }

    /*
    public ModelsActiveMatchmakingGameResponse parseResponse(int code, String contentType, InputStream payload) throws HttpResponseException, IOException {
        if(code != 200){
            final String json = Helper.convertInputStreamToString(payload);
            throw new HttpResponseException(code, json);
        }
        final String json = Helper.convertInputStreamToString(payload);
        return new ModelsActiveMatchmakingGameResponse().createFromJson(json);
    }
    */

    @Override
    protected Map<String, String> getCollectionFormatMap() {
        Map<String, String> result = new HashMap<>();
        result.put("limit", "None");
        result.put("match_id", "None");
        result.put("offset", "None");
        result.put("server_region", "None");
        result.put("session_id", "None");
        return result;
    }
}