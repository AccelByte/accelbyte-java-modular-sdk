/*
 * Copyright (c) 2024 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.dsmc.operations.public_;

import java.io.*;
import java.util.*;

import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import lombok.Builder;
import lombok.Getter;
import lombok.Setter;

import net.accelbyte.sdk.api.dsmc.models.*;
import net.accelbyte.sdk.core.Operation;
import net.accelbyte.sdk.core.HttpResponseException;
import net.accelbyte.sdk.core.util.Helper;
import net.accelbyte.sdk.core.ApiError;
import net.accelbyte.sdk.api.dsmc.operation_responses.public_.ListProvidersByRegionOpResponse;

/**
 * ListProvidersByRegion
 *
 * This endpoint returns the providers by region.
 */
@Getter
@Setter
public class ListProvidersByRegion extends Operation {
    /**
     * generated field's value
     */
    private String path = "/dsmcontroller/public/providers/regions/{region}";
    private String method = "GET";
    private List<String> consumes = Arrays.asList("application/json");
    private List<String> produces = Arrays.asList("application/json");
    private String locationQuery = null;
    /**
     * fields as input parameter
     */
    private String region;

    /**
    * @param region required
    */
    @Builder
    // @deprecated 2022-08-29 - All args constructor may cause problems. Use builder instead.
    @Deprecated
    public ListProvidersByRegion(
            String customBasePath,            String region
    )
    {
        this.region = region;
        super.customBasePath = customBasePath != null ? customBasePath : "";

        securities.add("Bearer");
    }

    @Override
    public Map<String, String> getPathParams(){
        Map<String, String> pathParams = new HashMap<>();
        if (this.region != null){
            pathParams.put("region", this.region);
        }
        return pathParams;
    }





    @Override
    public boolean isValid() {
        if(this.region == null) {
            return false;
        }
        return true;
    }

    public ListProvidersByRegionOpResponse parseResponse(int code, String contentType, InputStream payload) throws HttpResponseException, IOException {
        final ListProvidersByRegionOpResponse response = new ListProvidersByRegionOpResponse();

        response.setHttpStatusCode(code);
        response.setContentType(contentType);

        if (code == 204) {
            response.setSuccess(true);
        }
        else if ((code == 200) || (code == 201)) {
            final String json = Helper.convertInputStreamToString(payload);

            response.setSuccess(true);
            response.setData(new ObjectMapper().readValue(json, new TypeReference<List<String>>() {}));
        }

        return response;
    }

    /*
    public List<String> parseResponse(int code, String contentType, InputStream payload) throws HttpResponseException, IOException {
        if(code != 200){
            final String json = Helper.convertInputStreamToString(payload);
            throw new HttpResponseException(code, json);
        }
        final String json = Helper.convertInputStreamToString(payload);
        return new ObjectMapper().readValue(json, new TypeReference<List<String>>() {});
    }
    */

}