/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.dsartifact.wrappers;

import net.accelbyte.sdk.api.dsartifact.models.*;
import net.accelbyte.sdk.api.dsartifact.operations.download_server_artifact.*;
import net.accelbyte.sdk.core.AccelByteSDKInterface;
import net.accelbyte.sdk.core.HttpResponse;

public class DownloadServerArtifact {

  private AccelByteSDKInterface sdk;

  public DownloadServerArtifact(AccelByteSDKInterface sdk) {
    this.sdk = sdk;
  }

  /**
   * @see DownloadServerArtifacts
   */
  public void downloadServerArtifacts(DownloadServerArtifacts input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    input.handleEmptyResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see CheckServerArtifact
   */
  public ModelsArtifactFileStatus checkServerArtifact(CheckServerArtifact input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }
}
