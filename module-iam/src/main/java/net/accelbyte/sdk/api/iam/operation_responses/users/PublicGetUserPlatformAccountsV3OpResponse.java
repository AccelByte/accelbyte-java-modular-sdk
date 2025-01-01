/*
 * Copyright (c) 2024 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.iam.operation_responses.users;

import java.io.*;
import java.util.*;
import lombok.Getter;
import lombok.Setter;
import net.accelbyte.sdk.api.iam.models.*;
import net.accelbyte.sdk.core.ApiResponseWithData;

@Getter
@Setter
public class PublicGetUserPlatformAccountsV3OpResponse
    extends ApiResponseWithData<AccountcommonUserLinkedPlatformsResponseV3> {

  private RestErrorResponse error400 = null;

  private RestErrorResponse error401 = null;

  private RestErrorResponse error403 = null;

  private RestErrorResponse error404 = null;

  private RestErrorResponse error500 = null;

  public String getFullOperationId() {
    return "net.accelbyte.sdk.api.iam.operations.users.PublicGetUserPlatformAccountsV3";
  }
}
