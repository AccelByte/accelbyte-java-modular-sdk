/*
 * Copyright (c) 2024 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.ams.operations.servers;

import java.io.*;
import java.util.*;

import lombok.Builder;
import lombok.Getter;
import lombok.Setter;

import net.accelbyte.sdk.api.ams.models.*;
import net.accelbyte.sdk.core.Operation;
import net.accelbyte.sdk.core.HttpResponseException;
import net.accelbyte.sdk.core.util.Helper;
import net.accelbyte.sdk.core.ApiError;
import net.accelbyte.sdk.api.ams.operation_responses.servers.FleetServerHistoryOpResponse;

/**
 * FleetServerHistory
 *
 * Required Permission: ADMIN:NAMESPACE:{namespace}:ARMADA:FLEET [READ]
 */
@Getter
@Setter
public class FleetServerHistory extends Operation {
    /**
     * generated field's value
     */
    private String path = "/ams/v1/admin/namespaces/{namespace}/fleets/{fleetID}/servers/history";
    private String method = "GET";
    private List<String> consumes = Arrays.asList("application/json");
    private List<String> produces = Arrays.asList("application/json");
    private String locationQuery = null;
    /**
     * fields as input parameter
     */
    private String fleetID;
    private String namespace;
    private Integer count;
    private Integer offset;
    private String reason;
    private String region;
    private String serverId;
    private String sortDirection;
    private String status;

    /**
    * @param fleetID required
    * @param namespace required
    */
    @Builder
    // @deprecated 2022-08-29 - All args constructor may cause problems. Use builder instead.
    @Deprecated
    public FleetServerHistory(
            String customBasePath,            String fleetID,
            String namespace,
            Integer count,
            Integer offset,
            String reason,
            String region,
            String serverId,
            String sortDirection,
            String status
    )
    {
        this.fleetID = fleetID;
        this.namespace = namespace;
        this.count = count;
        this.offset = offset;
        this.reason = reason;
        this.region = region;
        this.serverId = serverId;
        this.sortDirection = sortDirection;
        this.status = status;
        super.customBasePath = customBasePath != null ? customBasePath : "";

        securities.add("Bearer");
    }

    @Override
    public Map<String, String> getPathParams(){
        Map<String, String> pathParams = new HashMap<>();
        if (this.fleetID != null){
            pathParams.put("fleetID", this.fleetID);
        }
        if (this.namespace != null){
            pathParams.put("namespace", this.namespace);
        }
        return pathParams;
    }

    @Override
    public Map<String, List<String>> getQueryParams(){
        Map<String, List<String>> queryParams = new HashMap<>();
        queryParams.put("count", this.count == null ? null : Arrays.asList(String.valueOf(this.count)));
        queryParams.put("offset", this.offset == null ? null : Arrays.asList(String.valueOf(this.offset)));
        queryParams.put("reason", this.reason == null ? null : Arrays.asList(this.reason));
        queryParams.put("region", this.region == null ? null : Arrays.asList(this.region));
        queryParams.put("serverId", this.serverId == null ? null : Arrays.asList(this.serverId));
        queryParams.put("sortDirection", this.sortDirection == null ? null : Arrays.asList(this.sortDirection));
        queryParams.put("status", this.status == null ? null : Arrays.asList(this.status));
        return queryParams;
    }




    @Override
    public boolean isValid() {
        if(this.fleetID == null) {
            return false;
        }
        if(this.namespace == null) {
            return false;
        }
        return true;
    }

    public FleetServerHistoryOpResponse parseResponse(int code, String contentType, InputStream payload) throws HttpResponseException, IOException {
        final FleetServerHistoryOpResponse response = new FleetServerHistoryOpResponse();

        response.setHttpStatusCode(code);
        response.setContentType(contentType);

        if (code == 204) {
            response.setSuccess(true);
        }
        else if ((code == 200) || (code == 201)) {
            final String json = Helper.convertInputStreamToString(payload);
            response.setData(new ApiDSHistoryList().createFromJson(json));
            response.setSuccess(true);
        }
        else if (code == 400) {
            final String json = Helper.convertInputStreamToString(payload);
            response.setError400(new ResponseErrorResponse().createFromJson(json));
            response.setError(response.getError400().translateToApiError());
        }
        else if (code == 401) {
            final String json = Helper.convertInputStreamToString(payload);
            response.setError401(new ResponseErrorResponse().createFromJson(json));
            response.setError(response.getError401().translateToApiError());
        }
        else if (code == 403) {
            final String json = Helper.convertInputStreamToString(payload);
            response.setError403(new ResponseErrorResponse().createFromJson(json));
            response.setError(response.getError403().translateToApiError());
        }
        else if (code == 500) {
            final String json = Helper.convertInputStreamToString(payload);
            response.setError500(new ResponseErrorResponse().createFromJson(json));
            response.setError(response.getError500().translateToApiError());
        }

        return response;
    }

    /*
    public ApiDSHistoryList parseResponse(int code, String contentType, InputStream payload) throws HttpResponseException, IOException {
        if(code != 200){
            final String json = Helper.convertInputStreamToString(payload);
            throw new HttpResponseException(code, json);
        }
        final String json = Helper.convertInputStreamToString(payload);
        return new ApiDSHistoryList().createFromJson(json);
    }
    */

    @Override
    protected Map<String, String> getCollectionFormatMap() {
        Map<String, String> result = new HashMap<>();
        result.put("count", "None");
        result.put("offset", "None");
        result.put("reason", "None");
        result.put("region", "None");
        result.put("serverId", "None");
        result.put("sortDirection", "None");
        result.put("status", "None");
        return result;
    }
}