/*
 * Copyright (c) 2024 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.lobby.operation_responses.admin;

import java.io.*;
import java.util.*;
import lombok.Getter;
import lombok.Setter;
import net.accelbyte.sdk.api.lobby.models.*;
import net.accelbyte.sdk.core.ApiResponse;

@Deprecated
@Getter
@Setter
public class AdminDeleteGlobalConfigOpResponse extends ApiResponse {

  private RestapiErrorResponseBody error401 = null;

  private RestapiErrorResponseBody error403 = null;

  public String getFullOperationId() {
    return "net.accelbyte.sdk.api.lobby.operations.admin.AdminDeleteGlobalConfig";
  }
}
