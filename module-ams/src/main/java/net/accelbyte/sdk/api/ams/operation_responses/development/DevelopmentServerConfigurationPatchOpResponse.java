/*
 * Copyright (c) 2024 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.ams.operation_responses.development;

import java.io.*;
import java.util.*;
import lombok.Getter;
import lombok.Setter;
import net.accelbyte.sdk.api.ams.models.*;
import net.accelbyte.sdk.core.ApiResponse;

@Getter
@Setter
public class DevelopmentServerConfigurationPatchOpResponse extends ApiResponse {

  private ResponseErrorResponse error401 = null;

  private ResponseErrorResponse error403 = null;

  private ResponseErrorResponse error404 = null;

  private ResponseErrorResponse error500 = null;

  public String getFullOperationId() {
    return "net.accelbyte.sdk.api.ams.operations.development.DevelopmentServerConfigurationPatch";
  }
}
