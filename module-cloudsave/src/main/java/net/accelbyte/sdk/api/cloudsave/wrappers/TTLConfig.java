/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.cloudsave.wrappers;

import net.accelbyte.sdk.api.cloudsave.operations.ttl_config.*;
import net.accelbyte.sdk.core.HttpResponse;
import net.accelbyte.sdk.core.RequestRunner;

public class TTLConfig {

  private RequestRunner sdk;

  public TTLConfig(RequestRunner sdk) {
    this.sdk = sdk;
  }

  /**
   * @see DeleteGameBinaryRecordTTLConfig
   */
  public void deleteGameBinaryRecordTTLConfig(DeleteGameBinaryRecordTTLConfig input)
      throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    input.handleEmptyResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see DeleteGameRecordTTLConfig
   */
  public void deleteGameRecordTTLConfig(DeleteGameRecordTTLConfig input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    input.handleEmptyResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }
}
