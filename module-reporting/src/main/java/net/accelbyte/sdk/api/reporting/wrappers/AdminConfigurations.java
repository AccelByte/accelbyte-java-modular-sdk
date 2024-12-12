/*
 * Copyright (c) 2024 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.reporting.wrappers;


import net.accelbyte.sdk.api.reporting.models.*;
import net.accelbyte.sdk.api.reporting.operations.admin_configurations.*;
import net.accelbyte.sdk.api.reporting.operation_responses.admin_configurations.*;
import net.accelbyte.sdk.core.RequestRunner;
import net.accelbyte.sdk.core.HttpResponse;

public class AdminConfigurations {

    private RequestRunner sdk;
    private String customBasePath = "";

    public AdminConfigurations(RequestRunner sdk){
        this.sdk = sdk;
        String configCustomBasePath = sdk.getSdkConfiguration().getConfigRepository().getCustomServiceBasePath("reporting");
        if (!configCustomBasePath.equals("")) {
            this.customBasePath = configCustomBasePath;
        }
    }

    public AdminConfigurations(RequestRunner sdk, String customBasePath){
        this.sdk = sdk;
        this.customBasePath = customBasePath;
    }

    /**
     * @see Get
     */
    public GetOpResponse get(Get input) throws Exception {
        if (input.getCustomBasePath().equals("") && !customBasePath.equals("")) {
            input.setCustomBasePath(customBasePath);
        }

        final HttpResponse httpResponse = sdk.runRequest(input);
        return input.parseResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
        );
    }

    /**
     * @see Upsert
     */
    public UpsertOpResponse upsert(Upsert input) throws Exception {
        if (input.getCustomBasePath().equals("") && !customBasePath.equals("")) {
            input.setCustomBasePath(customBasePath);
        }

        final HttpResponse httpResponse = sdk.runRequest(input);
        return input.parseResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
        );
    }

}
