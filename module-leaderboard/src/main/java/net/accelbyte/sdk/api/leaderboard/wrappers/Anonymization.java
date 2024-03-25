/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.leaderboard.wrappers;

import net.accelbyte.sdk.api.leaderboard.operations.anonymization.*;
import net.accelbyte.sdk.core.HttpResponse;
import net.accelbyte.sdk.core.RequestRunner;

public class Anonymization {

  private RequestRunner sdk;

  public Anonymization(RequestRunner sdk) {
    this.sdk = sdk;
  }

  /**
   * @see AdminAnonymizeUserLeaderboardAdminV1
   */
  public void adminAnonymizeUserLeaderboardAdminV1(AdminAnonymizeUserLeaderboardAdminV1 input)
      throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    input.handleEmptyResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }
}
