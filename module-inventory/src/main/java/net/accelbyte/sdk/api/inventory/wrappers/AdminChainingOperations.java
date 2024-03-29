/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.inventory.wrappers;

import net.accelbyte.sdk.api.inventory.models.*;
import net.accelbyte.sdk.api.inventory.operations.admin_chaining_operations.*;
import net.accelbyte.sdk.core.HttpResponse;
import net.accelbyte.sdk.core.RequestRunner;

public class AdminChainingOperations {

  private RequestRunner sdk;

  public AdminChainingOperations(RequestRunner sdk) {
    this.sdk = sdk;
  }

  /**
   * @see AdminCreateChainingOperations
   */
  public ApimodelsChainingOperationResp adminCreateChainingOperations(
      AdminCreateChainingOperations input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }
}
