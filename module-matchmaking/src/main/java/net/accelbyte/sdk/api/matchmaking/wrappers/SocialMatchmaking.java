/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.matchmaking.wrappers;

import net.accelbyte.sdk.api.matchmaking.models.*;
import net.accelbyte.sdk.api.matchmaking.operations.social_matchmaking.*;
import net.accelbyte.sdk.core.HttpResponse;
import net.accelbyte.sdk.core.RequestRunner;

public class SocialMatchmaking {

  private RequestRunner sdk;

  public SocialMatchmaking(RequestRunner sdk) {
    this.sdk = sdk;
  }

  /**
   * @see UpdatePlayTimeWeight
   */
  public ModelsUpdatePlayerPlaytimeWeightResponse updatePlayTimeWeight(UpdatePlayTimeWeight input)
      throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }
}
