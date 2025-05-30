/*
 * Copyright (c) 2024 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.cloudsave.operation_responses.admin_player_record;

import java.io.*;
import java.util.*;
import lombok.Getter;
import lombok.Setter;
import net.accelbyte.sdk.api.cloudsave.models.*;
import net.accelbyte.sdk.core.ApiResponseWithData;

@Getter
@Setter
public class BulkGetPlayerRecordSizeHandlerV1OpResponse
    extends ApiResponseWithData<ModelsBulkGetPlayerRecordSizeResponse> {

  private ModelsResponseError error400 = null;

  private ModelsResponseError error401 = null;

  private ModelsResponseError error403 = null;

  private ModelsResponseError error500 = null;

  public String getFullOperationId() {
    return "net.accelbyte.sdk.api.cloudsave.operations.admin_player_record.BulkGetPlayerRecordSizeHandlerV1";
  }
}
