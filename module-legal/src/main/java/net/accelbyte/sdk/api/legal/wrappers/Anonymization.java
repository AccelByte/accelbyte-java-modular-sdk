/*
 * Copyright (c) 2024 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.legal.wrappers;


import net.accelbyte.sdk.api.legal.operations.anonymization.*;
import net.accelbyte.sdk.api.legal.operation_responses.anonymization.*;
import net.accelbyte.sdk.core.RequestRunner;
import net.accelbyte.sdk.core.HttpResponse;

public class Anonymization {

    private RequestRunner sdk;
    private String customBasePath = "";

    public Anonymization(RequestRunner sdk){
        this.sdk = sdk;
        String configCustomBasePath = sdk.getSdkConfiguration().getConfigRepository().getCustomServiceBasePath("legal");
        if (!configCustomBasePath.equals("")) {
            this.customBasePath = configCustomBasePath;
        }
    }

    public Anonymization(RequestRunner sdk, String customBasePath){
        this.sdk = sdk;
        this.customBasePath = customBasePath;
    }

    /**
     * @see AnonymizeUserAgreement
     */
    public AnonymizeUserAgreementOpResponse anonymizeUserAgreement(AnonymizeUserAgreement input) throws Exception {
        if (input.getCustomBasePath().equals("") && !customBasePath.equals("")) {
            input.setCustomBasePath(customBasePath);
        }

        final HttpResponse httpResponse = sdk.runRequest(input);
        return input.parseResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
        );
    }

}
