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

import lombok.Builder;
import lombok.Getter;
import lombok.Setter;

import net.accelbyte.sdk.api.platform.models.*;
import net.accelbyte.sdk.core.Operation;
import net.accelbyte.sdk.core.HttpResponseException;
import net.accelbyte.sdk.core.util.Helper;
import net.accelbyte.sdk.core.ApiError;
import net.accelbyte.sdk.api.platform.operation_responses.item.UpdateAppOpResponse;

/**
 * updateApp
 *
 * This API is used to update an app.
 * 
 * An app update example:
 * 
 * 
 *     {
 * 
 *       "developer": "accelbyte",
 * 
 *       "publisher": "accelbyte",
 * 
 *       "websiteUrl": "http://accelbyte.io",
 * 
 *       "forumUrl": "http://accelbyte.io",
 * 
 *       "platforms": ["Windows(allowed values: Windows, MacOS, Linux, IOS, Android)"],
 * 
 *       "platformRequirements": {
 * 
 *         "Windows": [
 * 
 *           {
 * 
 *             "label":"minimum(can be minimum or recommended)",
 * 
 *             "osVersion":"os version",
 * 
 *             "processor":"processor",
 * 
 *             "ram":"RAM",
 * 
 *             "graphics":"graphics",
 * 
 *             "directXVersion":"directXVersion",
 * 
 *             "diskSpace":"diskSpace",
 * 
 *             "soundCard":"soundCard",
 * 
 *             "additionals":"additionals"
 * 
 *           }
 * 
 *          ]
 * 
 *       },
 * 
 *       "carousel": [
 * 
 *         {
 * 
 *           "type":"image(allowed values: image, video)",
 * 
 *           "videoSource":"generic(allowed values:generic, youtube, viemo)",
 * 
 *           "url":"url",
 * 
 *           "alt":"alternative url or text",
 * 
 *           "thumbnailUrl":"thumbnail url",
 * 
 *           "previewUrl":"preview url",
 * 
 *         }
 * 
 *       ],
 * 
 *       "localizations": {
 * 
 *         "en": {
 * 
 *           "slogan":"slogan",
 * 
 *           "announcement":"announcement",
 * 
 *         }
 * 
 *       },
 * 
 *       "primaryGenre": "Action",
 * 
 *       "genres": ["Action", "Adventure"],
 * 
 *       "players": ["Single"],
 * 
 *       "releaseDate": "optional yyyy-MM-dd'T'HH:mm:ss.SSS'Z'"
 * 
 *     }
 * 
 * Other detail info:
 * 
 *   * Returns : updated app data
 */
@Getter
@Setter
public class UpdateApp extends Operation {
    /**
     * generated field's value
     */
    private String path = "/platform/admin/namespaces/{namespace}/items/{itemId}/app";
    private String method = "PUT";
    private List<String> consumes = Arrays.asList("application/json");
    private List<String> produces = Arrays.asList("application/json");
    private String locationQuery = null;
    /**
     * fields as input parameter
     */
    private String itemId;
    private String namespace;
    private String storeId;
    private AppUpdate body;

    /**
    * @param itemId required
    * @param namespace required
    * @param storeId required
    * @param body required
    */
    @Builder
    // @deprecated 2022-08-29 - All args constructor may cause problems. Use builder instead.
    @Deprecated
    public UpdateApp(
            String customBasePath,            String itemId,
            String namespace,
            String storeId,
            AppUpdate body
    )
    {
        this.itemId = itemId;
        this.namespace = namespace;
        this.storeId = storeId;
        this.body = body;
        super.customBasePath = customBasePath != null ? customBasePath : "";

        securities.add("Bearer");
    }

    @Override
    public Map<String, String> getPathParams(){
        Map<String, String> pathParams = new HashMap<>();
        if (this.itemId != null){
            pathParams.put("itemId", this.itemId);
        }
        if (this.namespace != null){
            pathParams.put("namespace", this.namespace);
        }
        return pathParams;
    }

    @Override
    public Map<String, List<String>> getQueryParams(){
        Map<String, List<String>> queryParams = new HashMap<>();
        queryParams.put("storeId", this.storeId == null ? null : Arrays.asList(this.storeId));
        return queryParams;
    }


    @Override
    public AppUpdate getBodyParams(){
        return this.body;
    }


    @Override
    public boolean isValid() {
        if(this.itemId == null) {
            return false;
        }
        if(this.namespace == null) {
            return false;
        }
        if(this.storeId == null) {
            return false;
        }
        if(this.body == null) {
            return false;
        }
        return true;
    }

    public UpdateAppOpResponse parseResponse(int code, String contentType, InputStream payload) throws HttpResponseException, IOException {
        final UpdateAppOpResponse response = new UpdateAppOpResponse();

        response.setHttpStatusCode(code);
        response.setContentType(contentType);

        if (code == 204) {
            response.setSuccess(true);
        }
        else if ((code == 200) || (code == 201)) {
            final String json = Helper.convertInputStreamToString(payload);
            response.setData(new FullAppInfo().createFromJson(json));
            response.setSuccess(true);
        }
        else if (code == 404) {
            final String json = Helper.convertInputStreamToString(payload);
            response.setError404(new ErrorEntity().createFromJson(json));
            response.setError(response.getError404().translateToApiError());
        }
        else if (code == 409) {
            final String json = Helper.convertInputStreamToString(payload);
            response.setError409(new ErrorEntity().createFromJson(json));
            response.setError(response.getError409().translateToApiError());
        }
        else if (code == 422) {
            final String json = Helper.convertInputStreamToString(payload);
            response.setError422(new ValidationErrorEntity().createFromJson(json));
            response.setError(response.getError422().translateToApiError());
        }

        return response;
    }

    /*
    public FullAppInfo parseResponse(int code, String contentType, InputStream payload) throws HttpResponseException, IOException {
        if(code != 200){
            final String json = Helper.convertInputStreamToString(payload);
            throw new HttpResponseException(code, json);
        }
        final String json = Helper.convertInputStreamToString(payload);
        return new FullAppInfo().createFromJson(json);
    }
    */

    @Override
    protected Map<String, String> getCollectionFormatMap() {
        Map<String, String> result = new HashMap<>();
        result.put("storeId", "None");
        return result;
    }
}