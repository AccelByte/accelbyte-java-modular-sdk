/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.challenge.wrappers;

import net.accelbyte.sdk.api.challenge.models.*;
import net.accelbyte.sdk.api.challenge.operations.challenge_list.*;
import net.accelbyte.sdk.core.HttpResponse;
import net.accelbyte.sdk.core.RequestRunner;

public class ChallengeList {

  private RequestRunner sdk;

  public ChallengeList(RequestRunner sdk) {
    this.sdk = sdk;
  }

  /**
   * @see GetChallenges
   */
  public ModelListChallengeResponse getChallenges(GetChallenges input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see PublicGetScheduledGoals
   */
  public ModelGetGoalsResponse publicGetScheduledGoals(PublicGetScheduledGoals input)
      throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }
}
