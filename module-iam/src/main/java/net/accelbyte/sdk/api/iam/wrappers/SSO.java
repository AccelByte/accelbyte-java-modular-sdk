/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.iam.wrappers;

import net.accelbyte.sdk.api.iam.operations.sso.*;
import net.accelbyte.sdk.core.AccelByteSDKInterface;
import net.accelbyte.sdk.core.HttpResponse;

public class SSO {

  private AccelByteSDKInterface sdk;

  public SSO(AccelByteSDKInterface sdk) {
    this.sdk = sdk;
  }

  /**
   * @see LoginSSOClient
   */
  public void loginSSOClient(LoginSSOClient input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    input.handleEmptyResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see LogoutSSOClient
   */
  public void logoutSSOClient(LogoutSSOClient input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    input.handleEmptyResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }
}
