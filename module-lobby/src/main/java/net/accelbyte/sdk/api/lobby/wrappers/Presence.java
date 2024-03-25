/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.lobby.wrappers;

import net.accelbyte.sdk.api.lobby.models.*;
import net.accelbyte.sdk.api.lobby.operations.presence.*;
import net.accelbyte.sdk.core.HttpResponse;
import net.accelbyte.sdk.core.RequestRunner;

public class Presence {

  private RequestRunner sdk;

  public Presence(RequestRunner sdk) {
    this.sdk = sdk;
  }

  /**
   * @see UsersPresenceHandlerV1
   */
  public HandlersGetUsersPresenceResponse usersPresenceHandlerV1(UsersPresenceHandlerV1 input)
      throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }
}
