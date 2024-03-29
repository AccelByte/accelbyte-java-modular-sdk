/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.social.wrappers;

import net.accelbyte.sdk.api.social.models.*;
import net.accelbyte.sdk.api.social.operations.user_statistic_cycle.*;
import net.accelbyte.sdk.core.HttpResponse;
import net.accelbyte.sdk.core.RequestRunner;

public class UserStatisticCycle {

  private RequestRunner sdk;

  public UserStatisticCycle(RequestRunner sdk) {
    this.sdk = sdk;
  }

  /**
   * @see GetUserStatCycleItems
   */
  public UserStatCycleItemPagingSlicedResult getUserStatCycleItems(GetUserStatCycleItems input)
      throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see PublicListMyStatCycleItems
   */
  public UserStatCycleItemPagingSlicedResult publicListMyStatCycleItems(
      PublicListMyStatCycleItems input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see GetUserStatCycleItems1
   */
  public UserStatCycleItemPagingSlicedResult getUserStatCycleItems1(GetUserStatCycleItems1 input)
      throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }
}
