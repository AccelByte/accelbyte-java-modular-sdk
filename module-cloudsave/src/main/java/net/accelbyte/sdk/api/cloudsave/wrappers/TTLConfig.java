/*
 * Copyright (c) 2024 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.cloudsave.wrappers;


import net.accelbyte.sdk.api.cloudsave.operations.ttl_config.*;
import net.accelbyte.sdk.api.cloudsave.operation_responses.ttl_config.*;
import net.accelbyte.sdk.core.RequestRunner;
import net.accelbyte.sdk.core.HttpResponse;

public class TTLConfig {

    private RequestRunner sdk;
    private String customBasePath = "";

    public TTLConfig(RequestRunner sdk){
        this.sdk = sdk;
        String configCustomBasePath = sdk.getSdkConfiguration().getConfigRepository().getCustomServiceBasePath("cloudsave");
        if (!configCustomBasePath.equals("")) {
            this.customBasePath = configCustomBasePath;
        }
    }

    public TTLConfig(RequestRunner sdk, String customBasePath){
        this.sdk = sdk;
        this.customBasePath = customBasePath;
    }

    /**
     * @see DeleteAdminGameRecordTTLConfig
     */
    public DeleteAdminGameRecordTTLConfigOpResponse deleteAdminGameRecordTTLConfig(DeleteAdminGameRecordTTLConfig input) throws Exception {
        if (input.getCustomBasePath().equals("") && !customBasePath.equals("")) {
            input.setCustomBasePath(customBasePath);
        }

        final HttpResponse httpResponse = sdk.runRequest(input);
        return input.parseResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
        );
    }

    /**
     * @see DeleteGameBinaryRecordTTLConfig
     */
    public DeleteGameBinaryRecordTTLConfigOpResponse deleteGameBinaryRecordTTLConfig(DeleteGameBinaryRecordTTLConfig input) throws Exception {
        if (input.getCustomBasePath().equals("") && !customBasePath.equals("")) {
            input.setCustomBasePath(customBasePath);
        }

        final HttpResponse httpResponse = sdk.runRequest(input);
        return input.parseResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
        );
    }

    /**
     * @see DeleteGameRecordTTLConfig
     */
    public DeleteGameRecordTTLConfigOpResponse deleteGameRecordTTLConfig(DeleteGameRecordTTLConfig input) throws Exception {
        if (input.getCustomBasePath().equals("") && !customBasePath.equals("")) {
            input.setCustomBasePath(customBasePath);
        }

        final HttpResponse httpResponse = sdk.runRequest(input);
        return input.parseResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
        );
    }

}
