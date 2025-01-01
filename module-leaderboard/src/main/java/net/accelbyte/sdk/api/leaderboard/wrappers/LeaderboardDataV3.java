/*
 * Copyright (c) 2024 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.leaderboard.wrappers;

import net.accelbyte.sdk.api.leaderboard.models.*;
import net.accelbyte.sdk.api.leaderboard.operation_responses.leaderboard_data_v3.*;
import net.accelbyte.sdk.api.leaderboard.operations.leaderboard_data_v3.*;
import net.accelbyte.sdk.core.HttpResponse;
import net.accelbyte.sdk.core.RequestRunner;

public class LeaderboardDataV3 {

  private RequestRunner sdk;
  private String customBasePath = "";

  public LeaderboardDataV3(RequestRunner sdk) {
    this.sdk = sdk;
    String configCustomBasePath =
        sdk.getSdkConfiguration().getConfigRepository().getCustomServiceBasePath("leaderboard");
    if (!configCustomBasePath.equals("")) {
      this.customBasePath = configCustomBasePath;
    }
  }

  public LeaderboardDataV3(RequestRunner sdk, String customBasePath) {
    this.sdk = sdk;
    this.customBasePath = customBasePath;
  }

  /**
   * @see GetAllTimeLeaderboardRankingAdminV3
   */
  public GetAllTimeLeaderboardRankingAdminV3OpResponse getAllTimeLeaderboardRankingAdminV3(
      GetAllTimeLeaderboardRankingAdminV3 input) throws Exception {
    if (input.getCustomBasePath().equals("") && !customBasePath.equals("")) {
      input.setCustomBasePath(customBasePath);
    }

    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see GetCurrentCycleLeaderboardRankingAdminV3
   */
  public GetCurrentCycleLeaderboardRankingAdminV3OpResponse
      getCurrentCycleLeaderboardRankingAdminV3(GetCurrentCycleLeaderboardRankingAdminV3 input)
          throws Exception {
    if (input.getCustomBasePath().equals("") && !customBasePath.equals("")) {
      input.setCustomBasePath(customBasePath);
    }

    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see DeleteAllUserRankingByCycleIdAdminV3
   */
  public DeleteAllUserRankingByCycleIdAdminV3OpResponse deleteAllUserRankingByCycleIdAdminV3(
      DeleteAllUserRankingByCycleIdAdminV3 input) throws Exception {
    if (input.getCustomBasePath().equals("") && !customBasePath.equals("")) {
      input.setCustomBasePath(customBasePath);
    }

    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see DeleteUserRankingByCycleIdAdminV3
   */
  public DeleteUserRankingByCycleIdAdminV3OpResponse deleteUserRankingByCycleIdAdminV3(
      DeleteUserRankingByCycleIdAdminV3 input) throws Exception {
    if (input.getCustomBasePath().equals("") && !customBasePath.equals("")) {
      input.setCustomBasePath(customBasePath);
    }

    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see DeleteUserRankingByLeaderboardCodeAdminV3
   */
  public DeleteUserRankingByLeaderboardCodeAdminV3OpResponse
      deleteUserRankingByLeaderboardCodeAdminV3(DeleteUserRankingByLeaderboardCodeAdminV3 input)
          throws Exception {
    if (input.getCustomBasePath().equals("") && !customBasePath.equals("")) {
      input.setCustomBasePath(customBasePath);
    }

    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see GetUserRankingAdminV3
   */
  public GetUserRankingAdminV3OpResponse getUserRankingAdminV3(GetUserRankingAdminV3 input)
      throws Exception {
    if (input.getCustomBasePath().equals("") && !customBasePath.equals("")) {
      input.setCustomBasePath(customBasePath);
    }

    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see DeleteUserRankingAdminV3
   */
  public DeleteUserRankingAdminV3OpResponse deleteUserRankingAdminV3(DeleteUserRankingAdminV3 input)
      throws Exception {
    if (input.getCustomBasePath().equals("") && !customBasePath.equals("")) {
      input.setCustomBasePath(customBasePath);
    }

    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see DeleteUserRankingsAdminV3
   */
  public DeleteUserRankingsAdminV3OpResponse deleteUserRankingsAdminV3(
      DeleteUserRankingsAdminV3 input) throws Exception {
    if (input.getCustomBasePath().equals("") && !customBasePath.equals("")) {
      input.setCustomBasePath(customBasePath);
    }

    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see GetAllTimeLeaderboardRankingPublicV3
   */
  public GetAllTimeLeaderboardRankingPublicV3OpResponse getAllTimeLeaderboardRankingPublicV3(
      GetAllTimeLeaderboardRankingPublicV3 input) throws Exception {
    if (input.getCustomBasePath().equals("") && !customBasePath.equals("")) {
      input.setCustomBasePath(customBasePath);
    }

    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see GetCurrentCycleLeaderboardRankingPublicV3
   */
  public GetCurrentCycleLeaderboardRankingPublicV3OpResponse
      getCurrentCycleLeaderboardRankingPublicV3(GetCurrentCycleLeaderboardRankingPublicV3 input)
          throws Exception {
    if (input.getCustomBasePath().equals("") && !customBasePath.equals("")) {
      input.setCustomBasePath(customBasePath);
    }

    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see BulkGetUsersRankingPublicV3
   */
  public BulkGetUsersRankingPublicV3OpResponse bulkGetUsersRankingPublicV3(
      BulkGetUsersRankingPublicV3 input) throws Exception {
    if (input.getCustomBasePath().equals("") && !customBasePath.equals("")) {
      input.setCustomBasePath(customBasePath);
    }

    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see GetUserRankingPublicV3
   */
  public GetUserRankingPublicV3OpResponse getUserRankingPublicV3(GetUserRankingPublicV3 input)
      throws Exception {
    if (input.getCustomBasePath().equals("") && !customBasePath.equals("")) {
      input.setCustomBasePath(customBasePath);
    }

    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }
}
