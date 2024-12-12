/*
 * Copyright (c) 2024 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.iam.operations.users;

import java.io.*;
import java.util.*;

import lombok.Builder;
import lombok.Getter;
import lombok.Setter;

import net.accelbyte.sdk.api.iam.models.*;
import net.accelbyte.sdk.core.Operation;
import net.accelbyte.sdk.core.HttpResponseException;
import net.accelbyte.sdk.core.util.Helper;
import net.accelbyte.sdk.core.ApiError;
import net.accelbyte.sdk.api.iam.operation_responses.users.PublicSearchUserV3OpResponse;

/**
 * PublicSearchUserV3
 *
 * This endpoint search all users on the specified namespace that match the query on these fields: display name, unique display name, username or by 3rd party display name.
 * The query length should between 3-20, otherwise will not query the database.
 * The default limit value is 20.
 * 
 * ## Searching by 3rd party platform
 * 
 * **Note: searching by 3rd party platform display name will use exact query, not fuzzy query.**
 * 
 * Step when searching by 3rd party platform display name:
 * 1. set __by__ to __thirdPartyPlatform__
 * 2. set __platformId__ to the _supported platform id_
 * 3. set __platformBy__ to __platformDisplayName__
 * 
 * 
 * **Supported Platforms:**
 * - Steam group (steamnetwork):
 * - steam
 * - steamopenid
 * - PSN group (psn):
 * - ps4web
 * - ps4
 * - ps5
 * - XBOX group(xbox):
 * - live
 * - xblweb
 * - Oculus group (oculusgroup):
 * - oculus
 * - oculusweb
 * - Google group (google):
 * - google
 * - googleplaygames:
 * - epicgames
 * - facebook
 * - twitch
 * - discord
 * - android
 * - ios
 * - apple
 * - device
 * - nintendo
 * - awscognito
 * - amazon
 * - netflix
 * - snapchat
 * - _oidc platform id_
 * 
 * Note:
 * - You can use either platform id or platform group as **platformId** parameter.
 * - **Nintendo platform user id**: NSA ID need to be appended with Environment ID using colon as separator. e.g kmzwa8awaa:dd1
 */
@Getter
@Setter
public class PublicSearchUserV3 extends Operation {
    /**
     * generated field's value
     */
    private String path = "/iam/v3/public/namespaces/{namespace}/users";
    private String method = "GET";
    private List<String> consumes = Arrays.asList();
    private List<String> produces = Arrays.asList("application/json");
    private String locationQuery = null;
    /**
     * fields as input parameter
     */
    private String namespace;
    private String by;
    private Integer limit;
    private Integer offset;
    private String platformBy;
    private String platformId;
    private String query;

    /**
    * @param namespace required
    */
    @Builder
    // @deprecated 2022-08-29 - All args constructor may cause problems. Use builder instead.
    @Deprecated
    public PublicSearchUserV3(
            String customBasePath,            String namespace,
            String by,
            Integer limit,
            Integer offset,
            String platformBy,
            String platformId,
            String query
    )
    {
        this.namespace = namespace;
        this.by = by;
        this.limit = limit;
        this.offset = offset;
        this.platformBy = platformBy;
        this.platformId = platformId;
        this.query = query;
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
        queryParams.put("by", this.by == null ? null : Arrays.asList(this.by));
        queryParams.put("limit", this.limit == null ? null : Arrays.asList(String.valueOf(this.limit)));
        queryParams.put("offset", this.offset == null ? null : Arrays.asList(String.valueOf(this.offset)));
        queryParams.put("platformBy", this.platformBy == null ? null : Arrays.asList(this.platformBy));
        queryParams.put("platformId", this.platformId == null ? null : Arrays.asList(this.platformId));
        queryParams.put("query", this.query == null ? null : Arrays.asList(this.query));
        return queryParams;
    }




    @Override
    public boolean isValid() {
        if(this.namespace == null) {
            return false;
        }
        return true;
    }

    public PublicSearchUserV3OpResponse parseResponse(int code, String contentType, InputStream payload) throws HttpResponseException, IOException {
        final PublicSearchUserV3OpResponse response = new PublicSearchUserV3OpResponse();

        response.setHttpStatusCode(code);
        response.setContentType(contentType);

        if (code == 204) {
            response.setSuccess(true);
        }
        else if ((code == 200) || (code == 201)) {
            final String json = Helper.convertInputStreamToString(payload);
            response.setData(new ModelPublicUserInformationResponseV3().createFromJson(json));
            response.setSuccess(true);
        }
        else if (code == 400) {
            final String json = Helper.convertInputStreamToString(payload);
            response.setError400(new RestErrorResponse().createFromJson(json));
            response.setError(response.getError400().translateToApiError());
        }
        else if (code == 401) {
            final String json = Helper.convertInputStreamToString(payload);
            response.setError401(new RestErrorResponse().createFromJson(json));
            response.setError(response.getError401().translateToApiError());
        }
        else if (code == 404) {
            final String json = Helper.convertInputStreamToString(payload);
            response.setError404(new RestErrorResponse().createFromJson(json));
            response.setError(response.getError404().translateToApiError());
        }
        else if (code == 429) {
            final String json = Helper.convertInputStreamToString(payload);
            response.setError429(new RestErrorResponse().createFromJson(json));
            response.setError(response.getError429().translateToApiError());
        }
        else if (code == 500) {
            final String json = Helper.convertInputStreamToString(payload);
            response.setError500(new RestErrorResponse().createFromJson(json));
            response.setError(response.getError500().translateToApiError());
        }

        return response;
    }

    /*
    public ModelPublicUserInformationResponseV3 parseResponse(int code, String contentType, InputStream payload) throws HttpResponseException, IOException {
        if(code != 200){
            final String json = Helper.convertInputStreamToString(payload);
            throw new HttpResponseException(code, json);
        }
        final String json = Helper.convertInputStreamToString(payload);
        return new ModelPublicUserInformationResponseV3().createFromJson(json);
    }
    */

    @Override
    protected Map<String, String> getCollectionFormatMap() {
        Map<String, String> result = new HashMap<>();
        result.put("by", "None");
        result.put("limit", "None");
        result.put("offset", "None");
        result.put("platformBy", "None");
        result.put("platformId", "None");
        result.put("query", "None");
        return result;
    }
}