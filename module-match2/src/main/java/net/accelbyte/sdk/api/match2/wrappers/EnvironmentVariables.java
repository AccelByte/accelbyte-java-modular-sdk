/*
 * Copyright (c) 2024 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.match2.wrappers;

import net.accelbyte.sdk.api.match2.models.*;
import net.accelbyte.sdk.api.match2.operation_responses.environment_variables.*;
import net.accelbyte.sdk.api.match2.operations.environment_variables.*;
import net.accelbyte.sdk.core.HttpResponse;
import net.accelbyte.sdk.core.RequestRunner;

public class EnvironmentVariables {

  private RequestRunner sdk;
  private String customBasePath = "";

  public EnvironmentVariables(RequestRunner sdk) {
    this.sdk = sdk;
    String configCustomBasePath =
        sdk.getSdkConfiguration().getConfigRepository().getCustomServiceBasePath("match2");
    if (!configCustomBasePath.equals("")) {
      this.customBasePath = configCustomBasePath;
    }
  }

  public EnvironmentVariables(RequestRunner sdk, String customBasePath) {
    this.sdk = sdk;
    this.customBasePath = customBasePath;
  }

  /**
   * @see EnvironmentVariableList
   */
  public EnvironmentVariableListOpResponse environmentVariableList(EnvironmentVariableList input)
      throws Exception {
    if (input.getCustomBasePath().equals("") && !customBasePath.equals("")) {
      input.setCustomBasePath(customBasePath);
    }

    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }
}
