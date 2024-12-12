/*
 * Copyright (c) 2024 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.session.wrappers;


import net.accelbyte.sdk.api.session.models.*;
import net.accelbyte.sdk.api.session.operations.configuration_template.*;
import net.accelbyte.sdk.api.session.operation_responses.configuration_template.*;
import net.accelbyte.sdk.core.RequestRunner;
import net.accelbyte.sdk.core.HttpResponse;

public class ConfigurationTemplate {

    private RequestRunner sdk;
    private String customBasePath = "";

    public ConfigurationTemplate(RequestRunner sdk){
        this.sdk = sdk;
        String configCustomBasePath = sdk.getSdkConfiguration().getConfigRepository().getCustomServiceBasePath("session");
        if (!configCustomBasePath.equals("")) {
            this.customBasePath = configCustomBasePath;
        }
    }

    public ConfigurationTemplate(RequestRunner sdk, String customBasePath){
        this.sdk = sdk;
        this.customBasePath = customBasePath;
    }

    /**
     * @see AdminGetConfigurationAlertV1
     */
    public AdminGetConfigurationAlertV1OpResponse adminGetConfigurationAlertV1(AdminGetConfigurationAlertV1 input) throws Exception {
        if (input.getCustomBasePath().equals("") && !customBasePath.equals("")) {
            input.setCustomBasePath(customBasePath);
        }

        final HttpResponse httpResponse = sdk.runRequest(input);
        return input.parseResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
        );
    }

    /**
     * @see AdminUpdateConfigurationAlertV1
     */
    public AdminUpdateConfigurationAlertV1OpResponse adminUpdateConfigurationAlertV1(AdminUpdateConfigurationAlertV1 input) throws Exception {
        if (input.getCustomBasePath().equals("") && !customBasePath.equals("")) {
            input.setCustomBasePath(customBasePath);
        }

        final HttpResponse httpResponse = sdk.runRequest(input);
        return input.parseResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
        );
    }

    /**
     * @see AdminCreateConfigurationAlertV1
     */
    public AdminCreateConfigurationAlertV1OpResponse adminCreateConfigurationAlertV1(AdminCreateConfigurationAlertV1 input) throws Exception {
        if (input.getCustomBasePath().equals("") && !customBasePath.equals("")) {
            input.setCustomBasePath(customBasePath);
        }

        final HttpResponse httpResponse = sdk.runRequest(input);
        return input.parseResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
        );
    }

    /**
     * @see AdminDeleteConfigurationAlertV1
     */
    public AdminDeleteConfigurationAlertV1OpResponse adminDeleteConfigurationAlertV1(AdminDeleteConfigurationAlertV1 input) throws Exception {
        if (input.getCustomBasePath().equals("") && !customBasePath.equals("")) {
            input.setCustomBasePath(customBasePath);
        }

        final HttpResponse httpResponse = sdk.runRequest(input);
        return input.parseResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
        );
    }

    /**
     * @see AdminCreateConfigurationTemplateV1
     */
    public AdminCreateConfigurationTemplateV1OpResponse adminCreateConfigurationTemplateV1(AdminCreateConfigurationTemplateV1 input) throws Exception {
        if (input.getCustomBasePath().equals("") && !customBasePath.equals("")) {
            input.setCustomBasePath(customBasePath);
        }

        final HttpResponse httpResponse = sdk.runRequest(input);
        return input.parseResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
        );
    }

    /**
     * @see AdminGetAllConfigurationTemplatesV1
     */
    public AdminGetAllConfigurationTemplatesV1OpResponse adminGetAllConfigurationTemplatesV1(AdminGetAllConfigurationTemplatesV1 input) throws Exception {
        if (input.getCustomBasePath().equals("") && !customBasePath.equals("")) {
            input.setCustomBasePath(customBasePath);
        }

        final HttpResponse httpResponse = sdk.runRequest(input);
        return input.parseResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
        );
    }

    /**
     * @see AdminGetConfigurationTemplateV1
     */
    public AdminGetConfigurationTemplateV1OpResponse adminGetConfigurationTemplateV1(AdminGetConfigurationTemplateV1 input) throws Exception {
        if (input.getCustomBasePath().equals("") && !customBasePath.equals("")) {
            input.setCustomBasePath(customBasePath);
        }

        final HttpResponse httpResponse = sdk.runRequest(input);
        return input.parseResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
        );
    }

    /**
     * @see AdminUpdateConfigurationTemplateV1
     */
    public AdminUpdateConfigurationTemplateV1OpResponse adminUpdateConfigurationTemplateV1(AdminUpdateConfigurationTemplateV1 input) throws Exception {
        if (input.getCustomBasePath().equals("") && !customBasePath.equals("")) {
            input.setCustomBasePath(customBasePath);
        }

        final HttpResponse httpResponse = sdk.runRequest(input);
        return input.parseResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
        );
    }

    /**
     * @see AdminDeleteConfigurationTemplateV1
     */
    public AdminDeleteConfigurationTemplateV1OpResponse adminDeleteConfigurationTemplateV1(AdminDeleteConfigurationTemplateV1 input) throws Exception {
        if (input.getCustomBasePath().equals("") && !customBasePath.equals("")) {
            input.setCustomBasePath(customBasePath);
        }

        final HttpResponse httpResponse = sdk.runRequest(input);
        return input.parseResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
        );
    }

    /**
     * @see AdminGetDSMCConfiguration
     */
    public AdminGetDSMCConfigurationOpResponse adminGetDSMCConfiguration(AdminGetDSMCConfiguration input) throws Exception {
        if (input.getCustomBasePath().equals("") && !customBasePath.equals("")) {
            input.setCustomBasePath(customBasePath);
        }

        final HttpResponse httpResponse = sdk.runRequest(input);
        return input.parseResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
        );
    }

    /**
     * @see AdminSyncDSMCConfiguration
     */
    public AdminSyncDSMCConfigurationOpResponse adminSyncDSMCConfiguration(AdminSyncDSMCConfiguration input) throws Exception {
        if (input.getCustomBasePath().equals("") && !customBasePath.equals("")) {
            input.setCustomBasePath(customBasePath);
        }

        final HttpResponse httpResponse = sdk.runRequest(input);
        return input.parseResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
        );
    }

}
