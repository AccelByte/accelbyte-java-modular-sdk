/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.session.wrappers;

import net.accelbyte.sdk.api.session.models.*;
import net.accelbyte.sdk.api.session.operations.platform_credential.*;
import net.accelbyte.sdk.core.HttpResponse;
import net.accelbyte.sdk.core.RequestRunner;

public class PlatformCredential {

  private RequestRunner sdk;

  public PlatformCredential(RequestRunner sdk) {
    this.sdk = sdk;
  }

  /**
   * @see AdminGetPlatformCredentials
   */
  public ModelsPlatformCredentials adminGetPlatformCredentials(AdminGetPlatformCredentials input)
      throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see AdminUpdatePlatformCredentials
   */
  public ModelsPlatformCredentials adminUpdatePlatformCredentials(
      AdminUpdatePlatformCredentials input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see AdminDeletePlatformCredentials
   */
  public void adminDeletePlatformCredentials(AdminDeletePlatformCredentials input)
      throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    input.handleEmptyResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }
}
