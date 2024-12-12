/*
 * Copyright (c) 2024 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.inventory.wrappers;


import net.accelbyte.sdk.api.inventory.models.*;
import net.accelbyte.sdk.api.inventory.operations.public_tags.*;
import net.accelbyte.sdk.api.inventory.operation_responses.public_tags.*;
import net.accelbyte.sdk.core.RequestRunner;
import net.accelbyte.sdk.core.HttpResponse;

public class PublicTags {

    private RequestRunner sdk;
    private String customBasePath = "";

    public PublicTags(RequestRunner sdk){
        this.sdk = sdk;
        String configCustomBasePath = sdk.getSdkConfiguration().getConfigRepository().getCustomServiceBasePath("inventory");
        if (!configCustomBasePath.equals("")) {
            this.customBasePath = configCustomBasePath;
        }
    }

    public PublicTags(RequestRunner sdk, String customBasePath){
        this.sdk = sdk;
        this.customBasePath = customBasePath;
    }

    /**
     * @see PublicListTags
     */
    public PublicListTagsOpResponse publicListTags(PublicListTags input) throws Exception {
        if (input.getCustomBasePath().equals("") && !customBasePath.equals("")) {
            input.setCustomBasePath(customBasePath);
        }

        final HttpResponse httpResponse = sdk.runRequest(input);
        return input.parseResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
        );
    }

}
