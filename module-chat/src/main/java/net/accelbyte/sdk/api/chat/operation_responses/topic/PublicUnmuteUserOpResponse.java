/*
 * Copyright (c) 2024 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.chat.operation_responses.topic;

import java.io.*;
import java.util.*;
import lombok.Getter;
import lombok.Setter;
import net.accelbyte.sdk.api.chat.models.*;
import net.accelbyte.sdk.core.ApiResponse;

@Getter
@Setter
public class PublicUnmuteUserOpResponse extends ApiResponse {

  private RestapiErrorResponseBody error400 = null;

  private RestapiErrorResponseBody error401 = null;

  private RestapiErrorResponseBody error403 = null;

  private RestapiErrorResponseBody error500 = null;

  public String getFullOperationId() {
    return "net.accelbyte.sdk.api.chat.operations.topic.PublicUnmuteUser";
  }
}
