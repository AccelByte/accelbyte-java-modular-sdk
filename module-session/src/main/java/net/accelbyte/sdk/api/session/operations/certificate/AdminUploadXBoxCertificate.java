/*
 * Copyright (c) 2024 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.session.operations.certificate;

import java.io.*;
import java.util.*;

import lombok.Builder;
import lombok.Getter;
import lombok.Setter;

import net.accelbyte.sdk.api.session.models.*;
import net.accelbyte.sdk.core.Operation;
import net.accelbyte.sdk.core.HttpResponseException;
import net.accelbyte.sdk.core.util.Helper;
import net.accelbyte.sdk.core.ApiError;
import net.accelbyte.sdk.api.session.operation_responses.certificate.AdminUploadXBoxCertificateOpResponse;

/**
 * adminUploadXBoxCertificate
 *
 * Upload certificates for XBox. Certificate must be in the valid form of PFX format.
 *
 * @deprecated
 */
@Deprecated
@Getter
@Setter
public class AdminUploadXBoxCertificate extends Operation {
    /**
     * generated field's value
     */
    private String path = "/session/v1/admin/namespaces/{namespace}/certificates/pfx/platforms/xbl";
    private String method = "PUT";
    private List<String> consumes = Arrays.asList("multipart/form-data");
    private List<String> produces = Arrays.asList("application/json");
    private String locationQuery = null;
    /**
     * fields as input parameter
     */
    private String namespace;
    private String description;
    private String certname;
    private File file;
    private String password;

    /**
    * @param namespace required
    * @param certname required
    * @param file required
    * @param password required
    */
    @Builder
    // @deprecated 2022-08-29 - All args constructor may cause problems. Use builder instead.
    @Deprecated
    public AdminUploadXBoxCertificate(
            String customBasePath,            String namespace,
            String description,
            String certname,
            File file,
            String password
    )
    {
        this.namespace = namespace;
        this.description = description;
        this.certname = certname;
        this.file = file;
        this.password = password;
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
    public Map<String, Object> getFormParams(){
        Map<String, Object> formDataParams = new HashMap<>();
        if (this.description != null) {
            formDataParams.put("description", this.description);
        }
        if (this.certname != null) {
            formDataParams.put("certname", this.certname);
        }
        if (this.file != null) {
            formDataParams.put("file", this.file);
        }
        if (this.password != null) {
            formDataParams.put("password", this.password);
        }
        return formDataParams;
    }

    @Override
    public boolean isValid() {
        if(this.namespace == null) {
            return false;
        }
        if(this.certname == null) {
            return false;
        }
        if(this.file == null) {
            return false;
        }
        if(this.password == null) {
            return false;
        }
        return true;
    }

    public AdminUploadXBoxCertificateOpResponse parseResponse(int code, String contentType, InputStream payload) throws HttpResponseException, IOException {
        final AdminUploadXBoxCertificateOpResponse response = new AdminUploadXBoxCertificateOpResponse();

        response.setHttpStatusCode(code);
        response.setContentType(contentType);

        if (code == 204) {
            response.setSuccess(true);
        }
        else if ((code == 200) || (code == 201)) {
            final String json = Helper.convertInputStreamToString(payload);
            response.setData(new ModelsPlatformCredentials().createFromJson(json));
            response.setSuccess(true);
        }
        else if (code == 400) {
            final String json = Helper.convertInputStreamToString(payload);
            response.setError400(new ResponseError().createFromJson(json));
            response.setError(response.getError400().translateToApiError());
        }
        else if (code == 401) {
            final String json = Helper.convertInputStreamToString(payload);
            response.setError401(new ResponseError().createFromJson(json));
            response.setError(response.getError401().translateToApiError());
        }
        else if (code == 403) {
            final String json = Helper.convertInputStreamToString(payload);
            response.setError403(new ResponseError().createFromJson(json));
            response.setError(response.getError403().translateToApiError());
        }
        else if (code == 404) {
            final String json = Helper.convertInputStreamToString(payload);
            response.setError404(new ResponseError().createFromJson(json));
            response.setError(response.getError404().translateToApiError());
        }
        else if (code == 500) {
            final String json = Helper.convertInputStreamToString(payload);
            response.setError500(new ResponseError().createFromJson(json));
            response.setError(response.getError500().translateToApiError());
        }

        return response;
    }

    /*
    public ModelsPlatformCredentials parseResponse(int code, String contentType, InputStream payload) throws HttpResponseException, IOException {
        if(code != 200){
            final String json = Helper.convertInputStreamToString(payload);
            throw new HttpResponseException(code, json);
        }
        final String json = Helper.convertInputStreamToString(payload);
        return new ModelsPlatformCredentials().createFromJson(json);
    }
    */

}