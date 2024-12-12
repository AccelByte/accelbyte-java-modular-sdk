/*
 * Copyright (c) 2024 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.ugc.wrappers;


import net.accelbyte.sdk.api.ugc.models.*;
import net.accelbyte.sdk.api.ugc.operations.public_type.*;
import net.accelbyte.sdk.api.ugc.operation_responses.public_type.*;
import net.accelbyte.sdk.core.RequestRunner;
import net.accelbyte.sdk.core.HttpResponse;

public class PublicType {

    private RequestRunner sdk;
    private String customBasePath = "";

    public PublicType(RequestRunner sdk){
        this.sdk = sdk;
        String configCustomBasePath = sdk.getSdkConfiguration().getConfigRepository().getCustomServiceBasePath("ugc");
        if (!configCustomBasePath.equals("")) {
            this.customBasePath = configCustomBasePath;
        }
    }

    public PublicType(RequestRunner sdk, String customBasePath){
        this.sdk = sdk;
        this.customBasePath = customBasePath;
    }

    /**
     * @see GetType
     */
    public GetTypeOpResponse getType(GetType input) throws Exception {
        if (input.getCustomBasePath().equals("") && !customBasePath.equals("")) {
            input.setCustomBasePath(customBasePath);
        }

        final HttpResponse httpResponse = sdk.runRequest(input);
        return input.parseResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
        );
    }

}
