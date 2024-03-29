/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.dslogmanager.wrappers;

import java.io.*;
import net.accelbyte.sdk.api.dslogmanager.models.*;
import net.accelbyte.sdk.api.dslogmanager.operations.all_terminated_servers.*;
import net.accelbyte.sdk.core.HttpResponse;
import net.accelbyte.sdk.core.RequestRunner;

public class AllTerminatedServers {

  private RequestRunner sdk;

  public AllTerminatedServers(RequestRunner sdk) {
    this.sdk = sdk;
  }

  /**
   * @see BatchDownloadServerLogs
   */
  public InputStream batchDownloadServerLogs(BatchDownloadServerLogs input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see ListAllTerminatedServers
   */
  public ModelsListTerminatedServersResponse listAllTerminatedServers(
      ListAllTerminatedServers input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }
}
