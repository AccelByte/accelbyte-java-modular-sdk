/*
 * Copyright (c) 2024 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.iam.operation_responses.users_v4;

import java.io.*;
import java.util.*;
import lombok.Getter;
import lombok.Setter;
import net.accelbyte.sdk.api.iam.models.*;
import net.accelbyte.sdk.core.ApiResponseWithData;

@Deprecated
@Getter
@Setter
public class AdminGetMyMFAStatusV4OpResponse
    extends ApiResponseWithData<ModelUserMFAStatusResponseV4> {

  private RestErrorResponse error401 = null;

  private RestErrorResponse error403 = null;

  private RestErrorResponse error404 = null;

  private RestErrorResponse error500 = null;

  public String getFullOperationId() {
    return "net.accelbyte.sdk.api.iam.operations.users_v4.AdminGetMyMFAStatusV4";
  }
}
