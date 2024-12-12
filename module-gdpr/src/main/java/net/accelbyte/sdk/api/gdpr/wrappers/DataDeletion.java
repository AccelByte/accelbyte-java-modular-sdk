/*
 * Copyright (c) 2024 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.gdpr.wrappers;


import net.accelbyte.sdk.api.gdpr.models.*;
import net.accelbyte.sdk.api.gdpr.operations.data_deletion.*;
import net.accelbyte.sdk.api.gdpr.operation_responses.data_deletion.*;
import net.accelbyte.sdk.core.RequestRunner;
import net.accelbyte.sdk.core.HttpResponse;

public class DataDeletion {

    private RequestRunner sdk;
    private String customBasePath = "";

    public DataDeletion(RequestRunner sdk){
        this.sdk = sdk;
        String configCustomBasePath = sdk.getSdkConfiguration().getConfigRepository().getCustomServiceBasePath("gdpr");
        if (!configCustomBasePath.equals("")) {
            this.customBasePath = configCustomBasePath;
        }
    }

    public DataDeletion(RequestRunner sdk, String customBasePath){
        this.sdk = sdk;
        this.customBasePath = customBasePath;
    }

    /**
     * @see AdminGetListDeletionDataRequest
     */
    public AdminGetListDeletionDataRequestOpResponse adminGetListDeletionDataRequest(AdminGetListDeletionDataRequest input) throws Exception {
        if (input.getCustomBasePath().equals("") && !customBasePath.equals("")) {
            input.setCustomBasePath(customBasePath);
        }

        final HttpResponse httpResponse = sdk.runRequest(input);
        return input.parseResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
        );
    }

    /**
     * @see AdminGetUserAccountDeletionRequest
     */
    public AdminGetUserAccountDeletionRequestOpResponse adminGetUserAccountDeletionRequest(AdminGetUserAccountDeletionRequest input) throws Exception {
        if (input.getCustomBasePath().equals("") && !customBasePath.equals("")) {
            input.setCustomBasePath(customBasePath);
        }

        final HttpResponse httpResponse = sdk.runRequest(input);
        return input.parseResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
        );
    }

    /**
     * @see AdminSubmitUserAccountDeletionRequest
     */
    public AdminSubmitUserAccountDeletionRequestOpResponse adminSubmitUserAccountDeletionRequest(AdminSubmitUserAccountDeletionRequest input) throws Exception {
        if (input.getCustomBasePath().equals("") && !customBasePath.equals("")) {
            input.setCustomBasePath(customBasePath);
        }

        final HttpResponse httpResponse = sdk.runRequest(input);
        return input.parseResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
        );
    }

    /**
     * @see AdminCancelUserAccountDeletionRequest
     */
    public AdminCancelUserAccountDeletionRequestOpResponse adminCancelUserAccountDeletionRequest(AdminCancelUserAccountDeletionRequest input) throws Exception {
        if (input.getCustomBasePath().equals("") && !customBasePath.equals("")) {
            input.setCustomBasePath(customBasePath);
        }

        final HttpResponse httpResponse = sdk.runRequest(input);
        return input.parseResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
        );
    }

    /**
     * @see PublicSubmitUserAccountDeletionRequest
     */
    public PublicSubmitUserAccountDeletionRequestOpResponse publicSubmitUserAccountDeletionRequest(PublicSubmitUserAccountDeletionRequest input) throws Exception {
        if (input.getCustomBasePath().equals("") && !customBasePath.equals("")) {
            input.setCustomBasePath(customBasePath);
        }

        final HttpResponse httpResponse = sdk.runRequest(input);
        return input.parseResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
        );
    }

    /**
     * @see PublicCancelUserAccountDeletionRequest
     */
    public PublicCancelUserAccountDeletionRequestOpResponse publicCancelUserAccountDeletionRequest(PublicCancelUserAccountDeletionRequest input) throws Exception {
        if (input.getCustomBasePath().equals("") && !customBasePath.equals("")) {
            input.setCustomBasePath(customBasePath);
        }

        final HttpResponse httpResponse = sdk.runRequest(input);
        return input.parseResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
        );
    }

    /**
     * @see PublicGetUserAccountDeletionStatus
     */
    public PublicGetUserAccountDeletionStatusOpResponse publicGetUserAccountDeletionStatus(PublicGetUserAccountDeletionStatus input) throws Exception {
        if (input.getCustomBasePath().equals("") && !customBasePath.equals("")) {
            input.setCustomBasePath(customBasePath);
        }

        final HttpResponse httpResponse = sdk.runRequest(input);
        return input.parseResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
        );
    }

    /**
     * @see PublicSubmitMyAccountDeletionRequest
     */
    public PublicSubmitMyAccountDeletionRequestOpResponse publicSubmitMyAccountDeletionRequest(PublicSubmitMyAccountDeletionRequest input) throws Exception {
        if (input.getCustomBasePath().equals("") && !customBasePath.equals("")) {
            input.setCustomBasePath(customBasePath);
        }

        final HttpResponse httpResponse = sdk.runRequest(input);
        return input.parseResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
        );
    }

    /**
     * @see PublicCancelMyAccountDeletionRequest
     */
    public PublicCancelMyAccountDeletionRequestOpResponse publicCancelMyAccountDeletionRequest(PublicCancelMyAccountDeletionRequest input) throws Exception {
        if (input.getCustomBasePath().equals("") && !customBasePath.equals("")) {
            input.setCustomBasePath(customBasePath);
        }

        final HttpResponse httpResponse = sdk.runRequest(input);
        return input.parseResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
        );
    }

    /**
     * @see PublicGetMyAccountDeletionStatus
     */
    public PublicGetMyAccountDeletionStatusOpResponse publicGetMyAccountDeletionStatus(PublicGetMyAccountDeletionStatus input) throws Exception {
        if (input.getCustomBasePath().equals("") && !customBasePath.equals("")) {
            input.setCustomBasePath(customBasePath);
        }

        final HttpResponse httpResponse = sdk.runRequest(input);
        return input.parseResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
        );
    }

}
