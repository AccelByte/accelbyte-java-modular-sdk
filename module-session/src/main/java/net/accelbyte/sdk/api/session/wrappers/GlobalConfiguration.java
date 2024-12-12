/*
 * Copyright (c) 2024 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.session.wrappers;


import net.accelbyte.sdk.api.session.models.*;
import net.accelbyte.sdk.api.session.operations.global_configuration.*;
import net.accelbyte.sdk.api.session.operation_responses.global_configuration.*;
import net.accelbyte.sdk.core.RequestRunner;
import net.accelbyte.sdk.core.HttpResponse;

public class GlobalConfiguration {

    private RequestRunner sdk;
    private String customBasePath = "";

    public GlobalConfiguration(RequestRunner sdk){
        this.sdk = sdk;
        String configCustomBasePath = sdk.getSdkConfiguration().getConfigRepository().getCustomServiceBasePath("session");
        if (!configCustomBasePath.equals("")) {
            this.customBasePath = configCustomBasePath;
        }
    }

    public GlobalConfiguration(RequestRunner sdk, String customBasePath){
        this.sdk = sdk;
        this.customBasePath = customBasePath;
    }

    /**
     * @see AdminListGlobalConfiguration
     */
    public AdminListGlobalConfigurationOpResponse adminListGlobalConfiguration(AdminListGlobalConfiguration input) throws Exception {
        if (input.getCustomBasePath().equals("") && !customBasePath.equals("")) {
            input.setCustomBasePath(customBasePath);
        }

        final HttpResponse httpResponse = sdk.runRequest(input);
        return input.parseResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
        );
    }

    /**
     * @see AdminUpdateGlobalConfiguration
     */
    public AdminUpdateGlobalConfigurationOpResponse adminUpdateGlobalConfiguration(AdminUpdateGlobalConfiguration input) throws Exception {
        if (input.getCustomBasePath().equals("") && !customBasePath.equals("")) {
            input.setCustomBasePath(customBasePath);
        }

        final HttpResponse httpResponse = sdk.runRequest(input);
        return input.parseResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
        );
    }

    /**
     * @see AdminDeleteGlobalConfiguration
     */
    public AdminDeleteGlobalConfigurationOpResponse adminDeleteGlobalConfiguration(AdminDeleteGlobalConfiguration input) throws Exception {
        if (input.getCustomBasePath().equals("") && !customBasePath.equals("")) {
            input.setCustomBasePath(customBasePath);
        }

        final HttpResponse httpResponse = sdk.runRequest(input);
        return input.parseResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
        );
    }

}
