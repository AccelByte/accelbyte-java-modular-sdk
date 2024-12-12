/*
 * Copyright (c) 2024 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.social.operations.user_statistic;

import java.io.*;
import java.util.*;

import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import lombok.Builder;
import lombok.Getter;
import lombok.Setter;

import net.accelbyte.sdk.api.social.models.*;
import net.accelbyte.sdk.core.Operation;
import net.accelbyte.sdk.core.HttpResponseException;
import net.accelbyte.sdk.core.util.Helper;
import net.accelbyte.sdk.core.ApiError;
import net.accelbyte.sdk.api.social.operation_responses.user_statistic.BulkFetchOrDefaultStatItemsOpResponse;

/**
 * bulkFetchOrDefaultStatItems
 *
 * Bulk fetch multiple user's stat item values for a given namespace and statCode.
 * NOTE: If stat item does not exist, will return default value. Other detail info:
 * + *Returns*: list of user's stat item values
 */
@Getter
@Setter
public class BulkFetchOrDefaultStatItems extends Operation {
    /**
     * generated field's value
     */
    private String path = "/social/v1/admin/namespaces/{namespace}/statitems/value/bulk/getOrDefault";
    private String method = "GET";
    private List<String> consumes = Arrays.asList();
    private List<String> produces = Arrays.asList("application/json");
    private String locationQuery = null;
    /**
     * fields as input parameter
     */
    private String namespace;
    private String statCode;
    private List<String> userIds;

    /**
    * @param namespace required
    * @param statCode required
    * @param userIds required
    */
    @Builder
    // @deprecated 2022-08-29 - All args constructor may cause problems. Use builder instead.
    @Deprecated
    public BulkFetchOrDefaultStatItems(
            String customBasePath,            String namespace,
            String statCode,
            List<String> userIds
    )
    {
        this.namespace = namespace;
        this.statCode = statCode;
        this.userIds = userIds;
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
        queryParams.put("statCode", this.statCode == null ? null : Arrays.asList(this.statCode));
        queryParams.put("userIds", this.userIds == null ? null : this.userIds.stream().map(i -> String.valueOf(i)).collect(java.util.stream.Collectors.toList()));
        return queryParams;
    }




    @Override
    public boolean isValid() {
        if(this.namespace == null) {
            return false;
        }
        if(this.statCode == null) {
            return false;
        }
        if(this.userIds == null) {
            return false;
        }
        return true;
    }

    public BulkFetchOrDefaultStatItemsOpResponse parseResponse(int code, String contentType, InputStream payload) throws HttpResponseException, IOException {
        final BulkFetchOrDefaultStatItemsOpResponse response = new BulkFetchOrDefaultStatItemsOpResponse();

        response.setHttpStatusCode(code);
        response.setContentType(contentType);

        if (code == 204) {
            response.setSuccess(true);
        }
        else if ((code == 200) || (code == 201)) {
            final String json = Helper.convertInputStreamToString(payload);

            response.setSuccess(true);
            response.setData(new ObjectMapper().readValue(json, new TypeReference<List<ADTOObjectForUserStatItemValue>>() {}));
        }
        else if (code == 401) {
            final String json = Helper.convertInputStreamToString(payload);
            response.setError401(new ErrorEntity().createFromJson(json));
            response.setError(response.getError401().translateToApiError());
        }
        else if (code == 403) {
            final String json = Helper.convertInputStreamToString(payload);
            response.setError403(new ErrorEntity().createFromJson(json));
            response.setError(response.getError403().translateToApiError());
        }
        else if (code == 404) {
            final String json = Helper.convertInputStreamToString(payload);
            response.setError404(new ErrorEntity().createFromJson(json));
            response.setError(response.getError404().translateToApiError());
        }
        else if (code == 422) {
            final String json = Helper.convertInputStreamToString(payload);
            response.setError422(new ValidationErrorEntity().createFromJson(json));
            response.setError(response.getError422().translateToApiError());
        }
        else if (code == 500) {
            final String json = Helper.convertInputStreamToString(payload);
            response.setError500(new ErrorEntity().createFromJson(json));
            response.setError(response.getError500().translateToApiError());
        }

        return response;
    }

    /*
    public List<ADTOObjectForUserStatItemValue> parseResponse(int code, String contentType, InputStream payload) throws HttpResponseException, IOException {
        if(code != 200){
            final String json = Helper.convertInputStreamToString(payload);
            throw new HttpResponseException(code, json);
        }
        final String json = Helper.convertInputStreamToString(payload);
        return new ObjectMapper().readValue(json, new TypeReference<List<ADTOObjectForUserStatItemValue>>() {});
    }
    */

    @Override
    protected Map<String, String> getCollectionFormatMap() {
        Map<String, String> result = new HashMap<>();
        result.put("statCode", "None");
        result.put("userIds", "multi");
        return result;
    }
}