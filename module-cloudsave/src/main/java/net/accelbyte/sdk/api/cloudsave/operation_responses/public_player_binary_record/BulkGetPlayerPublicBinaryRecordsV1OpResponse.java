/*
 * Copyright (c) 2024 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.cloudsave.operation_responses.public_player_binary_record;

import java.io.*;
import java.util.*;
import lombok.Getter;
import lombok.Setter;
import net.accelbyte.sdk.api.cloudsave.models.*;
import net.accelbyte.sdk.core.ApiResponseWithData;

@Getter
@Setter
public class BulkGetPlayerPublicBinaryRecordsV1OpResponse
    extends ApiResponseWithData<ModelsBulkGetPlayerBinaryRecordResponse> {

  private ModelsResponseError error400 = null;

  private ModelsResponseError error401 = null;

  private ModelsResponseError error403 = null;

  private ModelsResponseError error500 = null;

  public String getFullOperationId() {
    return "net.accelbyte.sdk.api.cloudsave.operations.public_player_binary_record.BulkGetPlayerPublicBinaryRecordsV1";
  }
}
