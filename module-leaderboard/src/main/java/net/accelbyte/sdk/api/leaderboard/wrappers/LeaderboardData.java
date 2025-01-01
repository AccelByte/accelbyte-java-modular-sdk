/*
 * Copyright (c) 2024 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.leaderboard.wrappers;

import java.util.*;
import net.accelbyte.sdk.api.leaderboard.models.*;
import net.accelbyte.sdk.api.leaderboard.operation_responses.leaderboard_data.*;
import net.accelbyte.sdk.api.leaderboard.operations.leaderboard_data.*;
import net.accelbyte.sdk.core.HttpResponse;
import net.accelbyte.sdk.core.RequestRunner;

public class LeaderboardData {

  private RequestRunner sdk;
  private String customBasePath = "";

  public LeaderboardData(RequestRunner sdk) {
    this.sdk = sdk;
    String configCustomBasePath =
        sdk.getSdkConfiguration().getConfigRepository().getCustomServiceBasePath("leaderboard");
    if (!configCustomBasePath.equals("")) {
      this.customBasePath = configCustomBasePath;
    }
  }

  public LeaderboardData(RequestRunner sdk, String customBasePath) {
    this.sdk = sdk;
    this.customBasePath = customBasePath;
  }

  /**
   * @see AdminGetArchivedLeaderboardRankingDataV1Handler
   */
  public AdminGetArchivedLeaderboardRankingDataV1HandlerOpResponse
      adminGetArchivedLeaderboardRankingDataV1Handler(
          AdminGetArchivedLeaderboardRankingDataV1Handler input) throws Exception {
    if (input.getCustomBasePath().equals("") && !customBasePath.equals("")) {
      input.setCustomBasePath(customBasePath);
    }

    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see CreateArchivedLeaderboardRankingDataV1Handler
   */
  public CreateArchivedLeaderboardRankingDataV1HandlerOpResponse
      createArchivedLeaderboardRankingDataV1Handler(
          CreateArchivedLeaderboardRankingDataV1Handler input) throws Exception {
    if (input.getCustomBasePath().equals("") && !customBasePath.equals("")) {
      input.setCustomBasePath(customBasePath);
    }

    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see GetAllTimeLeaderboardRankingAdminV1
   */
  public GetAllTimeLeaderboardRankingAdminV1OpResponse getAllTimeLeaderboardRankingAdminV1(
      GetAllTimeLeaderboardRankingAdminV1 input) throws Exception {
    if (input.getCustomBasePath().equals("") && !customBasePath.equals("")) {
      input.setCustomBasePath(customBasePath);
    }

    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see GetCurrentMonthLeaderboardRankingAdminV1
   */
  public GetCurrentMonthLeaderboardRankingAdminV1OpResponse
      getCurrentMonthLeaderboardRankingAdminV1(GetCurrentMonthLeaderboardRankingAdminV1 input)
          throws Exception {
    if (input.getCustomBasePath().equals("") && !customBasePath.equals("")) {
      input.setCustomBasePath(customBasePath);
    }

    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see DeleteUserRankingByLeaderboardCodeAdminV1
   */
  public DeleteUserRankingByLeaderboardCodeAdminV1OpResponse
      deleteUserRankingByLeaderboardCodeAdminV1(DeleteUserRankingByLeaderboardCodeAdminV1 input)
          throws Exception {
    if (input.getCustomBasePath().equals("") && !customBasePath.equals("")) {
      input.setCustomBasePath(customBasePath);
    }

    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see GetCurrentSeasonLeaderboardRankingAdminV1
   */
  public GetCurrentSeasonLeaderboardRankingAdminV1OpResponse
      getCurrentSeasonLeaderboardRankingAdminV1(GetCurrentSeasonLeaderboardRankingAdminV1 input)
          throws Exception {
    if (input.getCustomBasePath().equals("") && !customBasePath.equals("")) {
      input.setCustomBasePath(customBasePath);
    }

    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see GetTodayLeaderboardRankingAdminV1
   */
  public GetTodayLeaderboardRankingAdminV1OpResponse getTodayLeaderboardRankingAdminV1(
      GetTodayLeaderboardRankingAdminV1 input) throws Exception {
    if (input.getCustomBasePath().equals("") && !customBasePath.equals("")) {
      input.setCustomBasePath(customBasePath);
    }

    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see GetUserRankingAdminV1
   */
  public GetUserRankingAdminV1OpResponse getUserRankingAdminV1(GetUserRankingAdminV1 input)
      throws Exception {
    if (input.getCustomBasePath().equals("") && !customBasePath.equals("")) {
      input.setCustomBasePath(customBasePath);
    }

    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see UpdateUserPointAdminV1
   */
  public UpdateUserPointAdminV1OpResponse updateUserPointAdminV1(UpdateUserPointAdminV1 input)
      throws Exception {
    if (input.getCustomBasePath().equals("") && !customBasePath.equals("")) {
      input.setCustomBasePath(customBasePath);
    }

    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see DeleteUserRankingAdminV1
   */
  public DeleteUserRankingAdminV1OpResponse deleteUserRankingAdminV1(DeleteUserRankingAdminV1 input)
      throws Exception {
    if (input.getCustomBasePath().equals("") && !customBasePath.equals("")) {
      input.setCustomBasePath(customBasePath);
    }

    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see GetCurrentWeekLeaderboardRankingAdminV1
   */
  public GetCurrentWeekLeaderboardRankingAdminV1OpResponse getCurrentWeekLeaderboardRankingAdminV1(
      GetCurrentWeekLeaderboardRankingAdminV1 input) throws Exception {
    if (input.getCustomBasePath().equals("") && !customBasePath.equals("")) {
      input.setCustomBasePath(customBasePath);
    }

    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see DeleteUserRankingsAdminV1
   */
  public DeleteUserRankingsAdminV1OpResponse deleteUserRankingsAdminV1(
      DeleteUserRankingsAdminV1 input) throws Exception {
    if (input.getCustomBasePath().equals("") && !customBasePath.equals("")) {
      input.setCustomBasePath(customBasePath);
    }

    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see GetAllTimeLeaderboardRankingPublicV1
   */
  public GetAllTimeLeaderboardRankingPublicV1OpResponse getAllTimeLeaderboardRankingPublicV1(
      GetAllTimeLeaderboardRankingPublicV1 input) throws Exception {
    if (input.getCustomBasePath().equals("") && !customBasePath.equals("")) {
      input.setCustomBasePath(customBasePath);
    }

    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see GetArchivedLeaderboardRankingDataV1Handler
   */
  public GetArchivedLeaderboardRankingDataV1HandlerOpResponse
      getArchivedLeaderboardRankingDataV1Handler(GetArchivedLeaderboardRankingDataV1Handler input)
          throws Exception {
    if (input.getCustomBasePath().equals("") && !customBasePath.equals("")) {
      input.setCustomBasePath(customBasePath);
    }

    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see GetCurrentMonthLeaderboardRankingPublicV1
   */
  public GetCurrentMonthLeaderboardRankingPublicV1OpResponse
      getCurrentMonthLeaderboardRankingPublicV1(GetCurrentMonthLeaderboardRankingPublicV1 input)
          throws Exception {
    if (input.getCustomBasePath().equals("") && !customBasePath.equals("")) {
      input.setCustomBasePath(customBasePath);
    }

    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see GetCurrentSeasonLeaderboardRankingPublicV1
   */
  public GetCurrentSeasonLeaderboardRankingPublicV1OpResponse
      getCurrentSeasonLeaderboardRankingPublicV1(GetCurrentSeasonLeaderboardRankingPublicV1 input)
          throws Exception {
    if (input.getCustomBasePath().equals("") && !customBasePath.equals("")) {
      input.setCustomBasePath(customBasePath);
    }

    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see GetTodayLeaderboardRankingPublicV1
   */
  public GetTodayLeaderboardRankingPublicV1OpResponse getTodayLeaderboardRankingPublicV1(
      GetTodayLeaderboardRankingPublicV1 input) throws Exception {
    if (input.getCustomBasePath().equals("") && !customBasePath.equals("")) {
      input.setCustomBasePath(customBasePath);
    }

    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see GetUserRankingPublicV1
   */
  public GetUserRankingPublicV1OpResponse getUserRankingPublicV1(GetUserRankingPublicV1 input)
      throws Exception {
    if (input.getCustomBasePath().equals("") && !customBasePath.equals("")) {
      input.setCustomBasePath(customBasePath);
    }

    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see DeleteUserRankingPublicV1
   */
  public DeleteUserRankingPublicV1OpResponse deleteUserRankingPublicV1(
      DeleteUserRankingPublicV1 input) throws Exception {
    if (input.getCustomBasePath().equals("") && !customBasePath.equals("")) {
      input.setCustomBasePath(customBasePath);
    }

    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see GetCurrentWeekLeaderboardRankingPublicV1
   */
  public GetCurrentWeekLeaderboardRankingPublicV1OpResponse
      getCurrentWeekLeaderboardRankingPublicV1(GetCurrentWeekLeaderboardRankingPublicV1 input)
          throws Exception {
    if (input.getCustomBasePath().equals("") && !customBasePath.equals("")) {
      input.setCustomBasePath(customBasePath);
    }

    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see GetAllTimeLeaderboardRankingPublicV2
   */
  public GetAllTimeLeaderboardRankingPublicV2OpResponse getAllTimeLeaderboardRankingPublicV2(
      GetAllTimeLeaderboardRankingPublicV2 input) throws Exception {
    if (input.getCustomBasePath().equals("") && !customBasePath.equals("")) {
      input.setCustomBasePath(customBasePath);
    }

    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }
}
