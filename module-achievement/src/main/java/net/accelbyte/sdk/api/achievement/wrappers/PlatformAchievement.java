/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.achievement.wrappers;

import net.accelbyte.sdk.api.achievement.models.*;
import net.accelbyte.sdk.api.achievement.operations.platform_achievement.*;
import net.accelbyte.sdk.core.HttpResponse;
import net.accelbyte.sdk.core.RequestRunner;

public class PlatformAchievement {

  private RequestRunner sdk;

  public PlatformAchievement(RequestRunner sdk) {
    this.sdk = sdk;
  }

  /**
   * @see BulkCreatePSNEvent
   */
  public ModelsBulkCreatePSNEventResponse bulkCreatePSNEvent(BulkCreatePSNEvent input)
      throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }
}
