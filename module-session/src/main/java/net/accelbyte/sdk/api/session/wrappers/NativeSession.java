/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.session.wrappers;

import net.accelbyte.sdk.api.session.models.*;
import net.accelbyte.sdk.api.session.operations.native_session.*;
import net.accelbyte.sdk.core.AccelByteSDKInterface;
import net.accelbyte.sdk.core.HttpResponse;

public class NativeSession {

  private AccelByteSDKInterface sdk;

  public NativeSession(AccelByteSDKInterface sdk) {
    this.sdk = sdk;
  }

  /**
   * @see AdminGetListNativeSession
   */
  public ApimodelsNativeSessionPagingResponse adminGetListNativeSession(
      AdminGetListNativeSession input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }
}
