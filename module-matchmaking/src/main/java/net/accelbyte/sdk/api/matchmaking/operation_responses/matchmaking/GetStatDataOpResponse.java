/*
 * Copyright (c) 2024 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.matchmaking.operation_responses.matchmaking;

import java.io.*;
import java.util.*;
import lombok.Getter;
import lombok.Setter;
import net.accelbyte.sdk.api.matchmaking.models.*;
import net.accelbyte.sdk.core.ApiResponseWithData;

@Deprecated
@Getter
@Setter
public class GetStatDataOpResponse extends ApiResponseWithData<ModelsStatResumeResponse> {

  private ResponseErrorV1 error400 = null;

  private ResponseErrorV1 error401 = null;

  private ResponseErrorV1 error403 = null;

  private ResponseErrorV1 error404 = null;

  private ResponseErrorV1 error500 = null;

  public String getFullOperationId() {
    return "net.accelbyte.sdk.api.matchmaking.operations.matchmaking.GetStatData";
  }
}
