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
import net.accelbyte.sdk.core.HttpResponse;
import net.accelbyte.sdk.core.RequestRunner;

public class LeaderboardConfiguration {

  private RequestRunner sdk;
  private String customBasePath = "";

  public LeaderboardConfiguration(RequestRunner sdk) {
    this.sdk = sdk;
    String configCustomBasePath =
        sdk.getSdkConfiguration().getConfigRepository().getCustomServiceBasePath("leaderboard");
    if (!configCustomBasePath.equals("")) {
      this.customBasePath = configCustomBasePath;
    }
  }

  public LeaderboardConfiguration(RequestRunner sdk, String customBasePath) {
    this.sdk = sdk;
    this.customBasePath = customBasePath;
  }

  /**
   * @see GetLeaderboardConfigurationsAdminV1
   */
  public ModelsGetAllLeaderboardConfigsResp getLeaderboardConfigurationsAdminV1(
      GetLeaderboardConfigurationsAdminV1 input) throws Exception {
    if (!customBasePath.equals("")) {
      input.setCustomBasePath(customBasePath);
    }

    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see CreateLeaderboardConfigurationAdminV1
   */
  public ModelsLeaderboardConfigReq createLeaderboardConfigurationAdminV1(
      CreateLeaderboardConfigurationAdminV1 input) throws Exception {
    if (!customBasePath.equals("")) {
      input.setCustomBasePath(customBasePath);
    }

    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see DeleteBulkLeaderboardConfigurationAdminV1
   */
  public ModelsDeleteBulkLeaderboardsResp deleteBulkLeaderboardConfigurationAdminV1(
      DeleteBulkLeaderboardConfigurationAdminV1 input) throws Exception {
    if (!customBasePath.equals("")) {
      input.setCustomBasePath(customBasePath);
    }

    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see GetLeaderboardConfigurationAdminV1
   */
  public ModelsGetLeaderboardConfigResp getLeaderboardConfigurationAdminV1(
      GetLeaderboardConfigurationAdminV1 input) throws Exception {
    if (!customBasePath.equals("")) {
      input.setCustomBasePath(customBasePath);
    }

    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see UpdateLeaderboardConfigurationAdminV1
   */
  public ModelsGetLeaderboardConfigResp updateLeaderboardConfigurationAdminV1(
      UpdateLeaderboardConfigurationAdminV1 input) throws Exception {
    if (!customBasePath.equals("")) {
      input.setCustomBasePath(customBasePath);
    }

    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see DeleteLeaderboardConfigurationAdminV1
   */
  public void deleteLeaderboardConfigurationAdminV1(DeleteLeaderboardConfigurationAdminV1 input)
      throws Exception {
    if (!customBasePath.equals("")) {
      input.setCustomBasePath(customBasePath);
    }

    final HttpResponse httpResponse = sdk.runRequest(input);
    input.handleEmptyResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see HardDeleteLeaderboardAdminV1
   */
  public void hardDeleteLeaderboardAdminV1(HardDeleteLeaderboardAdminV1 input) throws Exception {
    if (!customBasePath.equals("")) {
      input.setCustomBasePath(customBasePath);
    }

    final HttpResponse httpResponse = sdk.runRequest(input);
    input.handleEmptyResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see GetLeaderboardConfigurationsPublicV1
   */
  public ModelsGetAllLeaderboardConfigsPublicResp getLeaderboardConfigurationsPublicV1(
      GetLeaderboardConfigurationsPublicV1 input) throws Exception {
    if (!customBasePath.equals("")) {
      input.setCustomBasePath(customBasePath);
    }

    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see CreateLeaderboardConfigurationPublicV1
   */
  public ModelsLeaderboardConfigReq createLeaderboardConfigurationPublicV1(
      CreateLeaderboardConfigurationPublicV1 input) throws Exception {
    if (!customBasePath.equals("")) {
      input.setCustomBasePath(customBasePath);
    }

    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see GetLeaderboardConfigurationsPublicV2
   */
  public V2GetAllLeaderboardConfigsPublicResp getLeaderboardConfigurationsPublicV2(
      GetLeaderboardConfigurationsPublicV2 input) throws Exception {
    if (!customBasePath.equals("")) {
      input.setCustomBasePath(customBasePath);
    }

    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }
}
