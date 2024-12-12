/*
 * Copyright (c) 2024 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.reporting.operations.admin_extension_categories_and_auto_moderation_actions;

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
import net.accelbyte.sdk.api.reporting.operation_responses.admin_extension_categories_and_auto_moderation_actions.AdminFindExtensionCategoryListOpResponse;

/**
 * adminFindExtensionCategoryList
 *
 * Get a list of extension category data with the specified name
 */
@Getter
@Setter
public class AdminFindExtensionCategoryList extends Operation {
    /**
     * generated field's value
     */
    private String path = "/reporting/v1/admin/extensionCategories";
    private String method = "GET";
    private List<String> consumes = Arrays.asList("application/json");
    private List<String> produces = Arrays.asList("application/json");
    private String locationQuery = null;
    /**
     * fields as input parameter
     */
    private String order;
    private String sortBy;

    /**
    */
    @Builder
    // @deprecated 2022-08-29 - All args constructor may cause problems. Use builder instead.
    @Deprecated
    public AdminFindExtensionCategoryList(
            String customBasePath,            String order,
            String sortBy
    )
    {
        this.order = order;
        this.sortBy = sortBy;
        super.customBasePath = customBasePath != null ? customBasePath : "";

        securities.add("Bearer");
    }


    @Override
    public Map<String, List<String>> getQueryParams(){
        Map<String, List<String>> queryParams = new HashMap<>();
        queryParams.put("order", this.order == null ? null : Arrays.asList(this.order));
        queryParams.put("sortBy", this.sortBy == null ? null : Arrays.asList(this.sortBy));
        return queryParams;
    }




    @Override
    public boolean isValid() {
        return true;
    }

    public AdminFindExtensionCategoryListOpResponse parseResponse(int code, String contentType, InputStream payload) throws HttpResponseException, IOException {
        final AdminFindExtensionCategoryListOpResponse response = new AdminFindExtensionCategoryListOpResponse();

        response.setHttpStatusCode(code);
        response.setContentType(contentType);

        if (code == 204) {
            response.setSuccess(true);
        }
        else if ((code == 200) || (code == 201)) {
            final String json = Helper.convertInputStreamToString(payload);
            response.setData(new RestapiExtensionCategoryListApiResponse().createFromJson(json));
            response.setSuccess(true);
        }
        else if (code == 400) {
            final String json = Helper.convertInputStreamToString(payload);
            response.setError400(new RestapiErrorResponse().createFromJson(json));
            response.setError(response.getError400().translateToApiError());
        }
        else if (code == 500) {
            final String json = Helper.convertInputStreamToString(payload);
            response.setError500(new RestapiErrorResponse().createFromJson(json));
            response.setError(response.getError500().translateToApiError());
        }

        return response;
    }

    /*
    public RestapiExtensionCategoryListApiResponse parseResponse(int code, String contentType, InputStream payload) throws HttpResponseException, IOException {
        if(code != 200){
            final String json = Helper.convertInputStreamToString(payload);
            throw new HttpResponseException(code, json);
        }
        final String json = Helper.convertInputStreamToString(payload);
        return new RestapiExtensionCategoryListApiResponse().createFromJson(json);
    }
    */

    @Override
    protected Map<String, String> getCollectionFormatMap() {
        Map<String, String> result = new HashMap<>();
        result.put("order", "None");
        result.put("sortBy", "None");
        return result;
    }
    public enum Order {
        Asc("asc"),
        Ascending("ascending"),
        Desc("desc"),
        Descending("descending");

        private String value;

        Order(String value){
            this.value = value;
        }

        @Override
        public String toString() {
            return this.value;
        }
    }

    public enum SortBy {
        ExtensionCategory("extensionCategory"),
        ExtensionCategoryName("extensionCategoryName");

        private String value;

        SortBy(String value){
            this.value = value;
        }

        @Override
        public String toString() {
            return this.value;
        }
    }


    public static class AdminFindExtensionCategoryListBuilder {
        private String order;
        private String sortBy;


        public AdminFindExtensionCategoryListBuilder order(final String order) {
            this.order = order;
            return this;
        }

        public AdminFindExtensionCategoryListBuilder orderFromEnum(final Order order) {
            this.order = order.toString();
            return this;
        }

        public AdminFindExtensionCategoryListBuilder sortBy(final String sortBy) {
            this.sortBy = sortBy;
            return this;
        }

        public AdminFindExtensionCategoryListBuilder sortByFromEnum(final SortBy sortBy) {
            this.sortBy = sortBy.toString();
            return this;
        }
    }
}