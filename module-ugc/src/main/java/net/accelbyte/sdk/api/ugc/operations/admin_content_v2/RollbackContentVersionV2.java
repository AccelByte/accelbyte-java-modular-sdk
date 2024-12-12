/*
 * Copyright (c) 2024 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.ugc.operations.admin_content_v2;

import java.io.*;
import java.util.*;

import lombok.Builder;
import lombok.Getter;
import lombok.Setter;

import net.accelbyte.sdk.api.ugc.models.*;
import net.accelbyte.sdk.core.Operation;
import net.accelbyte.sdk.core.HttpResponseException;
import net.accelbyte.sdk.core.util.Helper;
import net.accelbyte.sdk.core.ApiError;
import net.accelbyte.sdk.api.ugc.operation_responses.admin_content_v2.RollbackContentVersionV2OpResponse;

/**
 * RollbackContentVersionV2
 *
 * Rollback content's payload to specified version
 */
@Getter
@Setter
public class RollbackContentVersionV2 extends Operation {
    /**
     * generated field's value
     */
    private String path = "/ugc/v2/admin/namespaces/{namespace}/contents/{contentId}/rollback/{versionId}";
    private String method = "PUT";
    private List<String> consumes = Arrays.asList("*/*");
    private List<String> produces = Arrays.asList("application/json");
    private String locationQuery = null;
    /**
     * fields as input parameter
     */
    private String contentId;
    private String namespace;
    private String versionId;

    /**
    * @param contentId required
    * @param namespace required
    * @param versionId required
    */
    @Builder
    // @deprecated 2022-08-29 - All args constructor may cause problems. Use builder instead.
    @Deprecated
    public RollbackContentVersionV2(
            String customBasePath,            String contentId,
            String namespace,
            String versionId
    )
    {
        this.contentId = contentId;
        this.namespace = namespace;
        this.versionId = versionId;
        super.customBasePath = customBasePath != null ? customBasePath : "";

        securities.add("Bearer");
    }

    @Override
    public Map<String, String> getPathParams(){
        Map<String, String> pathParams = new HashMap<>();
        if (this.contentId != null){
            pathParams.put("contentId", this.contentId);
        }
        if (this.namespace != null){
            pathParams.put("namespace", this.namespace);
        }
        if (this.versionId != null){
            pathParams.put("versionId", this.versionId);
        }
        return pathParams;
    }





    @Override
    public boolean isValid() {
        if(this.contentId == null) {
            return false;
        }
        if(this.namespace == null) {
            return false;
        }
        if(this.versionId == null) {
            return false;
        }
        return true;
    }

    public RollbackContentVersionV2OpResponse parseResponse(int code, String contentType, InputStream payload) throws HttpResponseException, IOException {
        final RollbackContentVersionV2OpResponse response = new RollbackContentVersionV2OpResponse();

        response.setHttpStatusCode(code);
        response.setContentType(contentType);

        if (code == 204) {
            response.setSuccess(true);
        }
        else if ((code == 200) || (code == 201)) {
            final String json = Helper.convertInputStreamToString(payload);
            response.setData(new ModelsContentDownloadResponse().createFromJson(json));
            response.setSuccess(true);
        }
        else if (code == 401) {
            final String json = Helper.convertInputStreamToString(payload);
            response.setError401(new ResponseError().createFromJson(json));
            response.setError(response.getError401().translateToApiError());
        }
        else if (code == 404) {
            final String json = Helper.convertInputStreamToString(payload);
            response.setError404(new ResponseError().createFromJson(json));
            response.setError(response.getError404().translateToApiError());
        }
        else if (code == 422) {
            final String json = Helper.convertInputStreamToString(payload);
            response.setError422(new ResponseError().createFromJson(json));
            response.setError(response.getError422().translateToApiError());
        }
        else if (code == 500) {
            final String json = Helper.convertInputStreamToString(payload);
            response.setError500(new ResponseError().createFromJson(json));
            response.setError(response.getError500().translateToApiError());
        }

        return response;
    }

    /*
    public ModelsContentDownloadResponse parseResponse(int code, String contentType, InputStream payload) throws HttpResponseException, IOException {
        if(code != 200){
            final String json = Helper.convertInputStreamToString(payload);
            throw new HttpResponseException(code, json);
        }
        final String json = Helper.convertInputStreamToString(payload);
        return new ModelsContentDownloadResponse().createFromJson(json);
    }
    */

}