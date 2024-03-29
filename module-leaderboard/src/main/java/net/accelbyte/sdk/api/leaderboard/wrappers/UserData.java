/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.leaderboard.wrappers;

import net.accelbyte.sdk.api.leaderboard.models.*;
import net.accelbyte.sdk.api.leaderboard.operations.user_data.*;
import net.accelbyte.sdk.core.HttpResponse;
import net.accelbyte.sdk.core.RequestRunner;

public class UserData {

  private RequestRunner sdk;

  public UserData(RequestRunner sdk) {
    this.sdk = sdk;
  }

  /**
   * @see GetUserLeaderboardRankingsAdminV1
   */
  public ModelsGetAllUserLeaderboardsResp getUserLeaderboardRankingsAdminV1(
      GetUserLeaderboardRankingsAdminV1 input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }
}
