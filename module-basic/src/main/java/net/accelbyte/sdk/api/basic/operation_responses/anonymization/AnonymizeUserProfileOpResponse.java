/*
 * Copyright (c) 2024 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.basic.operation_responses.anonymization;

import java.io.*;
import java.util.*;
import lombok.Getter;
import lombok.Setter;
import net.accelbyte.sdk.api.basic.models.*;
import net.accelbyte.sdk.core.ApiResponse;

@Getter
@Setter
public class AnonymizeUserProfileOpResponse extends ApiResponse {

  private ValidationErrorEntity error400 = null;

  private ErrorEntity error401 = null;

  private ErrorEntity error403 = null;

  public String getFullOperationId() {
    return "net.accelbyte.sdk.api.basic.operations.anonymization.AnonymizeUserProfile";
  }
}
