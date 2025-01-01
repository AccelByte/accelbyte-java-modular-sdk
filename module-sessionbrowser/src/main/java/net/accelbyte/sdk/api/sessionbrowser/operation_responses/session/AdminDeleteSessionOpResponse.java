/*
 * Copyright (c) 2024 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.sessionbrowser.operation_responses.session;

import java.io.*;
import java.util.*;
import lombok.Getter;
import lombok.Setter;
import net.accelbyte.sdk.api.sessionbrowser.models.*;
import net.accelbyte.sdk.core.ApiResponseWithData;

@Deprecated
@Getter
@Setter
public class AdminDeleteSessionOpResponse extends ApiResponseWithData<ModelsAdminSessionResponse> {

  private RestapiErrorResponseV2 error400 = null;

  private RestapiErrorResponseV2 error404 = null;

  private RestapiErrorResponseV2 error500 = null;

  public String getFullOperationId() {
    return "net.accelbyte.sdk.api.sessionbrowser.operations.session.AdminDeleteSession";
  }
}
