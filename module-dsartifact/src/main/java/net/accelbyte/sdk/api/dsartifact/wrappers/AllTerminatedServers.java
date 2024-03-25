/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.dsartifact.wrappers;

import net.accelbyte.sdk.api.dsartifact.models.*;
import net.accelbyte.sdk.api.dsartifact.operations.all_terminated_servers.*;
import net.accelbyte.sdk.core.HttpResponse;
import net.accelbyte.sdk.core.RequestRunner;

public class AllTerminatedServers {

  private RequestRunner sdk;

  public AllTerminatedServers(RequestRunner sdk) {
    this.sdk = sdk;
  }

  /**
   * @see ListTerminatedServers
   */
  public ModelsListTerminatedServersResponse listTerminatedServers(ListTerminatedServers input)
      throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }
}
