/*
 * Copyright (c) 2024 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.platform.operations.item;

import java.io.*;
import java.util.*;

import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import lombok.Builder;
import lombok.Getter;
import lombok.Setter;

import net.accelbyte.sdk.api.platform.models.*;
import net.accelbyte.sdk.core.Operation;
import net.accelbyte.sdk.core.HttpResponseException;
import net.accelbyte.sdk.core.util.Helper;
import net.accelbyte.sdk.core.ApiError;
import net.accelbyte.sdk.api.platform.operation_responses.item.ListItemTypeConfigsOpResponse;

/**
 * listItemTypeConfigs
 *
 *  [Not supported yet in AGS Shared Cloud] This API is used to get all item type configs.
 * 
 * Other detail info:
 * 
 *   * Returns : the list of items
 */
@Getter
@Setter
public class ListItemTypeConfigs extends Operation {
    /**
     * generated field's value
     */
    private String path = "/platform/admin/items/configs";
    private String method = "GET";
    private List<String> consumes = Arrays.asList();
    private List<String> produces = Arrays.asList("application/json");
    private String locationQuery = null;
    /**
     * fields as input parameter
     */

    /**
    */
    @Builder
    // @deprecated 2022-08-29 - All args constructor may cause problems. Use builder instead.
    @Deprecated
    public ListItemTypeConfigs(
            String customBasePath    )
    {
        super.customBasePath = customBasePath != null ? customBasePath : "";

        securities.add("Bearer");
    }






    @Override
    public boolean isValid() {
        return true;
    }

    public ListItemTypeConfigsOpResponse parseResponse(int code, String contentType, InputStream payload) throws HttpResponseException, IOException {
        final ListItemTypeConfigsOpResponse response = new ListItemTypeConfigsOpResponse();

        response.setHttpStatusCode(code);
        response.setContentType(contentType);

        if (code == 204) {
            response.setSuccess(true);
        }
        else if ((code == 200) || (code == 201)) {
            final String json = Helper.convertInputStreamToString(payload);

            response.setSuccess(true);
            response.setData(new ObjectMapper().readValue(json, new TypeReference<List<ItemTypeConfigInfo>>() {}));
        }

        return response;
    }

    /*
    public List<ItemTypeConfigInfo> parseResponse(int code, String contentType, InputStream payload) throws HttpResponseException, IOException {
        if(code != 200){
            final String json = Helper.convertInputStreamToString(payload);
            throw new HttpResponseException(code, json);
        }
        final String json = Helper.convertInputStreamToString(payload);
        return new ObjectMapper().readValue(json, new TypeReference<List<ItemTypeConfigInfo>>() {});
    }
    */

}