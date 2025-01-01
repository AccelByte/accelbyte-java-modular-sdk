/*
 * Copyright (c) 2024 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.leaderboard.wrappers;

import net.accelbyte.sdk.api.leaderboard.models.*;
import net.accelbyte.sdk.api.leaderboard.operation_responses.leaderboard_configuration_v3.*;
import net.accelbyte.sdk.api.leaderboard.operations.leaderboard_configuration_v3.*;
import net.accelbyte.sdk.core.HttpResponse;
import net.accelbyte.sdk.core.RequestRunner;

public class LeaderboardConfigurationV3 {

  private RequestRunner sdk;
  private String customBasePath = "";

  public LeaderboardConfigurationV3(RequestRunner sdk) {
    this.sdk = sdk;
    String configCustomBasePath =
        sdk.getSdkConfiguration().getConfigRepository().getCustomServiceBasePath("leaderboard");
    if (!configCustomBasePath.equals("")) {
      this.customBasePath = configCustomBasePath;
    }
  }

  public LeaderboardConfigurationV3(RequestRunner sdk, String customBasePath) {
    this.sdk = sdk;
    this.customBasePath = customBasePath;
  }

  /**
   * @see GetLeaderboardConfigurationsAdminV3
   */
  public GetLeaderboardConfigurationsAdminV3OpResponse getLeaderboardConfigurationsAdminV3(
      GetLeaderboardConfigurationsAdminV3 input) throws Exception {
    if (input.getCustomBasePath().equals("") && !customBasePath.equals("")) {
      input.setCustomBasePath(customBasePath);
    }

    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see CreateLeaderboardConfigurationAdminV3
   */
  public CreateLeaderboardConfigurationAdminV3OpResponse createLeaderboardConfigurationAdminV3(
      CreateLeaderboardConfigurationAdminV3 input) throws Exception {
    if (input.getCustomBasePath().equals("") && !customBasePath.equals("")) {
      input.setCustomBasePath(customBasePath);
    }

    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see DeleteBulkLeaderboardConfigurationAdminV3
   */
  public DeleteBulkLeaderboardConfigurationAdminV3OpResponse
      deleteBulkLeaderboardConfigurationAdminV3(DeleteBulkLeaderboardConfigurationAdminV3 input)
          throws Exception {
    if (input.getCustomBasePath().equals("") && !customBasePath.equals("")) {
      input.setCustomBasePath(customBasePath);
    }

    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see GetLeaderboardConfigurationAdminV3
   */
  public GetLeaderboardConfigurationAdminV3OpResponse getLeaderboardConfigurationAdminV3(
      GetLeaderboardConfigurationAdminV3 input) throws Exception {
    if (input.getCustomBasePath().equals("") && !customBasePath.equals("")) {
      input.setCustomBasePath(customBasePath);
    }

    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see UpdateLeaderboardConfigurationAdminV3
   */
  public UpdateLeaderboardConfigurationAdminV3OpResponse updateLeaderboardConfigurationAdminV3(
      UpdateLeaderboardConfigurationAdminV3 input) throws Exception {
    if (input.getCustomBasePath().equals("") && !customBasePath.equals("")) {
      input.setCustomBasePath(customBasePath);
    }

    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see DeleteLeaderboardConfigurationAdminV3
   */
  public DeleteLeaderboardConfigurationAdminV3OpResponse deleteLeaderboardConfigurationAdminV3(
      DeleteLeaderboardConfigurationAdminV3 input) throws Exception {
    if (input.getCustomBasePath().equals("") && !customBasePath.equals("")) {
      input.setCustomBasePath(customBasePath);
    }

    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see HardDeleteLeaderboardAdminV3
   */
  public HardDeleteLeaderboardAdminV3OpResponse hardDeleteLeaderboardAdminV3(
      HardDeleteLeaderboardAdminV3 input) throws Exception {
    if (input.getCustomBasePath().equals("") && !customBasePath.equals("")) {
      input.setCustomBasePath(customBasePath);
    }

    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see GetLeaderboardConfigurationsPublicV3
   */
  public GetLeaderboardConfigurationsPublicV3OpResponse getLeaderboardConfigurationsPublicV3(
      GetLeaderboardConfigurationsPublicV3 input) throws Exception {
    if (input.getCustomBasePath().equals("") && !customBasePath.equals("")) {
      input.setCustomBasePath(customBasePath);
    }

    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see GetLeaderboardConfigurationPublicV3
   */
  public GetLeaderboardConfigurationPublicV3OpResponse getLeaderboardConfigurationPublicV3(
      GetLeaderboardConfigurationPublicV3 input) throws Exception {
    if (input.getCustomBasePath().equals("") && !customBasePath.equals("")) {
      input.setCustomBasePath(customBasePath);
    }

    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }
}
