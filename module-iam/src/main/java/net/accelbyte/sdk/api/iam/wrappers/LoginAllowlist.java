/*
 * Copyright (c) 2024 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.iam.wrappers;


import net.accelbyte.sdk.api.iam.models.*;
import net.accelbyte.sdk.api.iam.operations.login_allowlist.*;
import net.accelbyte.sdk.api.iam.operation_responses.login_allowlist.*;
import net.accelbyte.sdk.core.RequestRunner;
import net.accelbyte.sdk.core.HttpResponse;

public class LoginAllowlist {

    private RequestRunner sdk;
    private String customBasePath = "";

    public LoginAllowlist(RequestRunner sdk){
        this.sdk = sdk;
        String configCustomBasePath = sdk.getSdkConfiguration().getConfigRepository().getCustomServiceBasePath("iam");
        if (!configCustomBasePath.equals("")) {
            this.customBasePath = configCustomBasePath;
        }
    }

    public LoginAllowlist(RequestRunner sdk, String customBasePath){
        this.sdk = sdk;
        this.customBasePath = customBasePath;
    }

    /**
     * @see AdminGetLoginAllowlistV3
     */
    public AdminGetLoginAllowlistV3OpResponse adminGetLoginAllowlistV3(AdminGetLoginAllowlistV3 input) throws Exception {
        if (input.getCustomBasePath().equals("") && !customBasePath.equals("")) {
            input.setCustomBasePath(customBasePath);
        }

        final HttpResponse httpResponse = sdk.runRequest(input);
        return input.parseResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
        );
    }

    /**
     * @see AdminUpdateLoginAllowlistV3
     */
    public AdminUpdateLoginAllowlistV3OpResponse adminUpdateLoginAllowlistV3(AdminUpdateLoginAllowlistV3 input) throws Exception {
        if (input.getCustomBasePath().equals("") && !customBasePath.equals("")) {
            input.setCustomBasePath(customBasePath);
        }

        final HttpResponse httpResponse = sdk.runRequest(input);
        return input.parseResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
        );
    }

}
