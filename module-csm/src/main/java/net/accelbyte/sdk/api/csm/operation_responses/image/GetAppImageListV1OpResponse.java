/*
 * Copyright (c) 2024 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.csm.operation_responses.image;

import java.io.*;
import java.util.*;
import lombok.Getter;
import lombok.Setter;
import net.accelbyte.sdk.api.csm.models.*;
import net.accelbyte.sdk.core.ApiResponseWithData;

@Deprecated
@Getter
@Setter
public class GetAppImageListV1OpResponse
    extends ApiResponseWithData<GeneratedGetAppImageListV1Response> {

  private ResponseErrorResponse error401 = null;

  private ResponseErrorResponse error403 = null;

  private ResponseErrorResponse error404 = null;

  private ResponseErrorResponse error500 = null;

  public String getFullOperationId() {
    return "net.accelbyte.sdk.api.csm.operations.image.GetAppImageListV1";
  }
}
