/*
 * Copyright (c) 2024 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.chat.operation_responses.operations;

import java.io.*;
import java.util.*;
import lombok.Getter;
import lombok.Setter;
import net.accelbyte.sdk.api.chat.models.*;
import net.accelbyte.sdk.core.ApiResponseWithData;

@Getter
@Setter
public class PublicGetMessagesOpResponse
    extends ApiResponseWithData<List<LogAppMessageDeclaration>> {

  private RestapiErrorResponseBody error500 = null;

  public String getFullOperationId() {
    return "net.accelbyte.sdk.api.chat.operations.operations.PublicGetMessages";
  }
}
