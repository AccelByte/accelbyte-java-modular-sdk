/*
 * Copyright (c) 2024 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.iam.wrappers;


import net.accelbyte.sdk.api.iam.models.*;
import net.accelbyte.sdk.api.iam.operations.override_role_config_v3.*;
import net.accelbyte.sdk.api.iam.operation_responses.override_role_config_v3.*;
import net.accelbyte.sdk.core.RequestRunner;
import net.accelbyte.sdk.core.HttpResponse;

public class OverrideRoleConfigV3 {

    private RequestRunner sdk;
    private String customBasePath = "";

    public OverrideRoleConfigV3(RequestRunner sdk){
        this.sdk = sdk;
        String configCustomBasePath = sdk.getSdkConfiguration().getConfigRepository().getCustomServiceBasePath("iam");
        if (!configCustomBasePath.equals("")) {
            this.customBasePath = configCustomBasePath;
        }
    }

    public OverrideRoleConfigV3(RequestRunner sdk, String customBasePath){
        this.sdk = sdk;
        this.customBasePath = customBasePath;
    }

    /**
     * @see AdminGetRoleOverrideConfigV3
     */
    public AdminGetRoleOverrideConfigV3OpResponse adminGetRoleOverrideConfigV3(AdminGetRoleOverrideConfigV3 input) throws Exception {
        if (input.getCustomBasePath().equals("") && !customBasePath.equals("")) {
            input.setCustomBasePath(customBasePath);
        }

        final HttpResponse httpResponse = sdk.runRequest(input);
        return input.parseResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
        );
    }

    /**
     * @see AdminUpdateRoleOverrideConfigV3
     */
    public AdminUpdateRoleOverrideConfigV3OpResponse adminUpdateRoleOverrideConfigV3(AdminUpdateRoleOverrideConfigV3 input) throws Exception {
        if (input.getCustomBasePath().equals("") && !customBasePath.equals("")) {
            input.setCustomBasePath(customBasePath);
        }

        final HttpResponse httpResponse = sdk.runRequest(input);
        return input.parseResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
        );
    }

    /**
     * @see AdminGetRoleSourceV3
     */
    public AdminGetRoleSourceV3OpResponse adminGetRoleSourceV3(AdminGetRoleSourceV3 input) throws Exception {
        if (input.getCustomBasePath().equals("") && !customBasePath.equals("")) {
            input.setCustomBasePath(customBasePath);
        }

        final HttpResponse httpResponse = sdk.runRequest(input);
        return input.parseResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
        );
    }

    /**
     * @see AdminChangeRoleOverrideConfigStatusV3
     */
    public AdminChangeRoleOverrideConfigStatusV3OpResponse adminChangeRoleOverrideConfigStatusV3(AdminChangeRoleOverrideConfigStatusV3 input) throws Exception {
        if (input.getCustomBasePath().equals("") && !customBasePath.equals("")) {
            input.setCustomBasePath(customBasePath);
        }

        final HttpResponse httpResponse = sdk.runRequest(input);
        return input.parseResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
        );
    }

    /**
     * @see AdminGetRoleNamespacePermissionV3
     */
    public AdminGetRoleNamespacePermissionV3OpResponse adminGetRoleNamespacePermissionV3(AdminGetRoleNamespacePermissionV3 input) throws Exception {
        if (input.getCustomBasePath().equals("") && !customBasePath.equals("")) {
            input.setCustomBasePath(customBasePath);
        }

        final HttpResponse httpResponse = sdk.runRequest(input);
        return input.parseResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
        );
    }

}
