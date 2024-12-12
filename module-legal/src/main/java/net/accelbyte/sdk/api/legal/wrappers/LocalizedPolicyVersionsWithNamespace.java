/*
 * Copyright (c) 2024 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.legal.wrappers;

import java.util.*;

import net.accelbyte.sdk.api.legal.models.*;
import net.accelbyte.sdk.api.legal.operations.localized_policy_versions_with_namespace.*;
import net.accelbyte.sdk.api.legal.operation_responses.localized_policy_versions_with_namespace.*;
import net.accelbyte.sdk.core.RequestRunner;
import net.accelbyte.sdk.core.HttpResponse;

public class LocalizedPolicyVersionsWithNamespace {

    private RequestRunner sdk;
    private String customBasePath = "";

    public LocalizedPolicyVersionsWithNamespace(RequestRunner sdk){
        this.sdk = sdk;
        String configCustomBasePath = sdk.getSdkConfiguration().getConfigRepository().getCustomServiceBasePath("legal");
        if (!configCustomBasePath.equals("")) {
            this.customBasePath = configCustomBasePath;
        }
    }

    public LocalizedPolicyVersionsWithNamespace(RequestRunner sdk, String customBasePath){
        this.sdk = sdk;
        this.customBasePath = customBasePath;
    }

    /**
     * @see DeleteLocalizedPolicy
     */
    public DeleteLocalizedPolicyOpResponse deleteLocalizedPolicy(DeleteLocalizedPolicy input) throws Exception {
        if (input.getCustomBasePath().equals("") && !customBasePath.equals("")) {
            input.setCustomBasePath(customBasePath);
        }

        final HttpResponse httpResponse = sdk.runRequest(input);
        return input.parseResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
        );
    }

    /**
     * @see RetrieveLocalizedPolicyVersions1
     */
    public RetrieveLocalizedPolicyVersions1OpResponse retrieveLocalizedPolicyVersions1(RetrieveLocalizedPolicyVersions1 input) throws Exception {
        if (input.getCustomBasePath().equals("") && !customBasePath.equals("")) {
            input.setCustomBasePath(customBasePath);
        }

        final HttpResponse httpResponse = sdk.runRequest(input);
        return input.parseResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
        );
    }

    /**
     * @see CreateLocalizedPolicyVersion1
     */
    public CreateLocalizedPolicyVersion1OpResponse createLocalizedPolicyVersion1(CreateLocalizedPolicyVersion1 input) throws Exception {
        if (input.getCustomBasePath().equals("") && !customBasePath.equals("")) {
            input.setCustomBasePath(customBasePath);
        }

        final HttpResponse httpResponse = sdk.runRequest(input);
        return input.parseResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
        );
    }

    /**
     * @see RetrieveSingleLocalizedPolicyVersion1
     */
    public RetrieveSingleLocalizedPolicyVersion1OpResponse retrieveSingleLocalizedPolicyVersion1(RetrieveSingleLocalizedPolicyVersion1 input) throws Exception {
        if (input.getCustomBasePath().equals("") && !customBasePath.equals("")) {
            input.setCustomBasePath(customBasePath);
        }

        final HttpResponse httpResponse = sdk.runRequest(input);
        return input.parseResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
        );
    }

    /**
     * @see UpdateLocalizedPolicyVersion1
     */
    public UpdateLocalizedPolicyVersion1OpResponse updateLocalizedPolicyVersion1(UpdateLocalizedPolicyVersion1 input) throws Exception {
        if (input.getCustomBasePath().equals("") && !customBasePath.equals("")) {
            input.setCustomBasePath(customBasePath);
        }

        final HttpResponse httpResponse = sdk.runRequest(input);
        return input.parseResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
        );
    }

    /**
     * @see RequestPresignedURL1
     */
    public RequestPresignedURL1OpResponse requestPresignedURL1(RequestPresignedURL1 input) throws Exception {
        if (input.getCustomBasePath().equals("") && !customBasePath.equals("")) {
            input.setCustomBasePath(customBasePath);
        }

        final HttpResponse httpResponse = sdk.runRequest(input);
        return input.parseResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
        );
    }

    /**
     * @see SetDefaultPolicy1
     */
    public SetDefaultPolicy1OpResponse setDefaultPolicy1(SetDefaultPolicy1 input) throws Exception {
        if (input.getCustomBasePath().equals("") && !customBasePath.equals("")) {
            input.setCustomBasePath(customBasePath);
        }

        final HttpResponse httpResponse = sdk.runRequest(input);
        return input.parseResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
        );
    }

    /**
     * @see RetrieveSingleLocalizedPolicyVersion3
     */
    public RetrieveSingleLocalizedPolicyVersion3OpResponse retrieveSingleLocalizedPolicyVersion3(RetrieveSingleLocalizedPolicyVersion3 input) throws Exception {
        if (input.getCustomBasePath().equals("") && !customBasePath.equals("")) {
            input.setCustomBasePath(customBasePath);
        }

        final HttpResponse httpResponse = sdk.runRequest(input);
        return input.parseResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
        );
    }

}
