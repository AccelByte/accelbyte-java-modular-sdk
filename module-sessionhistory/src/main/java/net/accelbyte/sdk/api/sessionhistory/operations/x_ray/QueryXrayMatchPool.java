/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.sessionhistory.operations.x_ray;

import java.io.*;
import java.util.*;

import lombok.Builder;
import lombok.Getter;
import lombok.Setter;

import net.accelbyte.sdk.api.sessionhistory.models.*;
import net.accelbyte.sdk.core.Operation;
import net.accelbyte.sdk.core.HttpResponseException;
import net.accelbyte.sdk.core.util.Helper;

/**
 * queryXrayMatchPool
 *
 * Query xray match pool.
 */
@Getter
@Setter
public class QueryXrayMatchPool extends Operation {
    /**
     * generated field's value
     */
    private String path = "/sessionhistory/v2/admin/namespaces/{namespace}/xray/match-pools/{poolName}";
    private String method = "GET";
    private List<String> consumes = Arrays.asList("application/json");
    private List<String> produces = Arrays.asList("application/json");
    private String locationQuery = null;
    /**
     * fields as input parameter
     */
    private String namespace;
    private String poolName;
    private String endDate;
    private String startDate;

    /**
    * @param namespace required
    * @param poolName required
    * @param endDate required
    * @param startDate required
    */
    @Builder
    // @deprecated 2022-08-29 - All args constructor may cause problems. Use builder instead.
    @Deprecated
    public QueryXrayMatchPool(
            String namespace,
            String poolName,
            String endDate,
            String startDate
    )
    {
        this.namespace = namespace;
        this.poolName = poolName;
        this.endDate = endDate;
        this.startDate = startDate;

        securities.add("Bearer");
    }

    @Override
    public Map<String, String> getPathParams(){
        Map<String, String> pathParams = new HashMap<>();
        if (this.namespace != null){
            pathParams.put("namespace", this.namespace);
        }
        if (this.poolName != null){
            pathParams.put("poolName", this.poolName);
        }
        return pathParams;
    }

    @Override
    public Map<String, List<String>> getQueryParams(){
        Map<String, List<String>> queryParams = new HashMap<>();
        queryParams.put("endDate", this.endDate == null ? null : Arrays.asList(this.endDate));
        queryParams.put("startDate", this.startDate == null ? null : Arrays.asList(this.startDate));
        return queryParams;
    }




    @Override
    public boolean isValid() {
        if(this.namespace == null) {
            return false;
        }
        if(this.poolName == null) {
            return false;
        }
        if(this.endDate == null) {
            return false;
        }
        if(this.startDate == null) {
            return false;
        }
        return true;
    }

    public ApimodelsXRayMatchPoolQueryResponse parseResponse(int code, String contentType, InputStream payload) throws HttpResponseException, IOException {
        if(code != 200){
            final String json = Helper.convertInputStreamToString(payload);
            throw new HttpResponseException(code, json);
        }
        final String json = Helper.convertInputStreamToString(payload);
        return new ApimodelsXRayMatchPoolQueryResponse().createFromJson(json);
    }

    @Override
    protected Map<String, String> getCollectionFormatMap() {
        Map<String, String> result = new HashMap<>();
        result.put("endDate", "None");
        result.put("startDate", "None");
        return result;
    }
}