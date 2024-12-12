/*
 * Copyright (c) 2024 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.leaderboard.wrappers;


import net.accelbyte.sdk.api.leaderboard.models.*;
import net.accelbyte.sdk.api.leaderboard.operations.leaderboard_configuration.*;
import net.accelbyte.sdk.api.leaderboard.operation_responses.leaderboard_configuration.*;
import net.accelbyte.sdk.core.RequestRunner;
import net.accelbyte.sdk.core.HttpResponse;

public class LeaderboardConfiguration {

    private RequestRunner sdk;
    private String customBasePath = "";

    public LeaderboardConfiguration(RequestRunner sdk){
        this.sdk = sdk;
        String configCustomBasePath = sdk.getSdkConfiguration().getConfigRepository().getCustomServiceBasePath("leaderboard");
        if (!configCustomBasePath.equals("")) {
            this.customBasePath = configCustomBasePath;
        }
    }

    public LeaderboardConfiguration(RequestRunner sdk, String customBasePath){
        this.sdk = sdk;
        this.customBasePath = customBasePath;
    }

    /**
     * @see GetLeaderboardConfigurationsAdminV1
     */
    public GetLeaderboardConfigurationsAdminV1OpResponse getLeaderboardConfigurationsAdminV1(GetLeaderboardConfigurationsAdminV1 input) throws Exception {
        if (input.getCustomBasePath().equals("") && !customBasePath.equals("")) {
            input.setCustomBasePath(customBasePath);
        }

        final HttpResponse httpResponse = sdk.runRequest(input);
        return input.parseResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
        );
    }

    /**
     * @see CreateLeaderboardConfigurationAdminV1
     */
    public CreateLeaderboardConfigurationAdminV1OpResponse createLeaderboardConfigurationAdminV1(CreateLeaderboardConfigurationAdminV1 input) throws Exception {
        if (input.getCustomBasePath().equals("") && !customBasePath.equals("")) {
            input.setCustomBasePath(customBasePath);
        }

        final HttpResponse httpResponse = sdk.runRequest(input);
        return input.parseResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
        );
    }

    /**
     * @see DeleteBulkLeaderboardConfigurationAdminV1
     */
    public DeleteBulkLeaderboardConfigurationAdminV1OpResponse deleteBulkLeaderboardConfigurationAdminV1(DeleteBulkLeaderboardConfigurationAdminV1 input) throws Exception {
        if (input.getCustomBasePath().equals("") && !customBasePath.equals("")) {
            input.setCustomBasePath(customBasePath);
        }

        final HttpResponse httpResponse = sdk.runRequest(input);
        return input.parseResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
        );
    }

    /**
     * @see GetLeaderboardConfigurationAdminV1
     */
    public GetLeaderboardConfigurationAdminV1OpResponse getLeaderboardConfigurationAdminV1(GetLeaderboardConfigurationAdminV1 input) throws Exception {
        if (input.getCustomBasePath().equals("") && !customBasePath.equals("")) {
            input.setCustomBasePath(customBasePath);
        }

        final HttpResponse httpResponse = sdk.runRequest(input);
        return input.parseResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
        );
    }

    /**
     * @see UpdateLeaderboardConfigurationAdminV1
     */
    public UpdateLeaderboardConfigurationAdminV1OpResponse updateLeaderboardConfigurationAdminV1(UpdateLeaderboardConfigurationAdminV1 input) throws Exception {
        if (input.getCustomBasePath().equals("") && !customBasePath.equals("")) {
            input.setCustomBasePath(customBasePath);
        }

        final HttpResponse httpResponse = sdk.runRequest(input);
        return input.parseResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
        );
    }

    /**
     * @see DeleteLeaderboardConfigurationAdminV1
     */
    public DeleteLeaderboardConfigurationAdminV1OpResponse deleteLeaderboardConfigurationAdminV1(DeleteLeaderboardConfigurationAdminV1 input) throws Exception {
        if (input.getCustomBasePath().equals("") && !customBasePath.equals("")) {
            input.setCustomBasePath(customBasePath);
        }

        final HttpResponse httpResponse = sdk.runRequest(input);
        return input.parseResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
        );
    }

    /**
     * @see HardDeleteLeaderboardAdminV1
     */
    public HardDeleteLeaderboardAdminV1OpResponse hardDeleteLeaderboardAdminV1(HardDeleteLeaderboardAdminV1 input) throws Exception {
        if (input.getCustomBasePath().equals("") && !customBasePath.equals("")) {
            input.setCustomBasePath(customBasePath);
        }

        final HttpResponse httpResponse = sdk.runRequest(input);
        return input.parseResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
        );
    }

    /**
     * @see GetLeaderboardConfigurationsPublicV1
     */
    public GetLeaderboardConfigurationsPublicV1OpResponse getLeaderboardConfigurationsPublicV1(GetLeaderboardConfigurationsPublicV1 input) throws Exception {
        if (input.getCustomBasePath().equals("") && !customBasePath.equals("")) {
            input.setCustomBasePath(customBasePath);
        }

        final HttpResponse httpResponse = sdk.runRequest(input);
        return input.parseResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
        );
    }

    /**
     * @see CreateLeaderboardConfigurationPublicV1
     */
    public CreateLeaderboardConfigurationPublicV1OpResponse createLeaderboardConfigurationPublicV1(CreateLeaderboardConfigurationPublicV1 input) throws Exception {
        if (input.getCustomBasePath().equals("") && !customBasePath.equals("")) {
            input.setCustomBasePath(customBasePath);
        }

        final HttpResponse httpResponse = sdk.runRequest(input);
        return input.parseResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
        );
    }

    /**
     * @see GetLeaderboardConfigurationsPublicV2
     */
    public GetLeaderboardConfigurationsPublicV2OpResponse getLeaderboardConfigurationsPublicV2(GetLeaderboardConfigurationsPublicV2 input) throws Exception {
        if (input.getCustomBasePath().equals("") && !customBasePath.equals("")) {
            input.setCustomBasePath(customBasePath);
        }

        final HttpResponse httpResponse = sdk.runRequest(input);
        return input.parseResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
        );
    }

}
