/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.legal.wrappers;

import net.accelbyte.sdk.api.legal.models.*;
import net.accelbyte.sdk.api.legal.operations.admin_user_eligibilities.*;
import net.accelbyte.sdk.core.HttpResponse;
import net.accelbyte.sdk.core.RequestRunner;

public class AdminUserEligibilities {

  private RequestRunner sdk;

  public AdminUserEligibilities(RequestRunner sdk) {
    this.sdk = sdk;
  }

  /**
   * @see AdminRetrieveEligibilities
   */
  public RetrieveUserEligibilitiesIndirectResponse adminRetrieveEligibilities(
      AdminRetrieveEligibilities input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }
}
