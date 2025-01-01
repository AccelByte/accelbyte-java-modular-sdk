/*
 * Copyright (c) 2024 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.lobby.operation_responses.friends;

import java.io.*;
import java.util.*;
import lombok.Getter;
import lombok.Setter;
import net.accelbyte.sdk.api.lobby.models.*;
import net.accelbyte.sdk.core.ApiResponse;

@Getter
@Setter
public class UserAcceptFriendRequestOpResponse extends ApiResponse {

  private RestapiErrorResponseV1 error400 = null;

  private RestapiErrorResponseV1 error401 = null;

  private RestapiErrorResponseV1 error403 = null;

  private RestapiErrorResponseV1 error404 = null;

  private RestapiErrorResponseV1 error500 = null;

  public String getFullOperationId() {
    return "net.accelbyte.sdk.api.lobby.operations.friends.UserAcceptFriendRequest";
  }
}
