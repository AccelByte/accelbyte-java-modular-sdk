/*
 * Copyright (c) 2024 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.social.operation_responses.slot;

import java.io.*;
import java.util.*;
import lombok.Getter;
import lombok.Setter;
import net.accelbyte.sdk.api.social.models.*;
import net.accelbyte.sdk.core.ApiResponse;

@Deprecated
@Getter
@Setter
public class PublicCreateUserNamespaceSlotOpResponse extends ApiResponse {

  private ErrorEntity error400 = null;

  private ErrorEntity error409 = null;

  public String getFullOperationId() {
    return "net.accelbyte.sdk.api.social.operations.slot.PublicCreateUserNamespaceSlot";
  }
}
