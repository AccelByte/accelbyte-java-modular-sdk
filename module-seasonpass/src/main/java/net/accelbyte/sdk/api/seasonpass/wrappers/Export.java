/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.seasonpass.wrappers;

import java.io.*;
import net.accelbyte.sdk.api.seasonpass.operations.export.*;
import net.accelbyte.sdk.core.HttpResponse;
import net.accelbyte.sdk.core.RequestRunner;

public class Export {

  private RequestRunner sdk;

  public Export(RequestRunner sdk) {
    this.sdk = sdk;
  }

  /**
   * @see ExportSeason
   */
  public InputStream exportSeason(ExportSeason input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }
}
