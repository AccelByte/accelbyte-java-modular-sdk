/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.ams.wrappers;

import java.util.*;
import net.accelbyte.sdk.api.ams.models.*;
import net.accelbyte.sdk.api.ams.operations.development.*;
import net.accelbyte.sdk.core.HttpResponse;
import net.accelbyte.sdk.core.RequestRunner;

public class Development {

  private RequestRunner sdk;

  public Development(RequestRunner sdk) {
    this.sdk = sdk;
  }

  /**
   * @see DevelopmentServerConfigurationList
   */
  public List<ApiDevelopmentServerConfigurationGetResponse> developmentServerConfigurationList(
      DevelopmentServerConfigurationList input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see DevelopmentServerConfigurationCreate
   */
  public ApiDevelopmentServerConfigurationCreateResponse developmentServerConfigurationCreate(
      DevelopmentServerConfigurationCreate input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see DevelopmentServerConfigurationGet
   */
  public ApiDevelopmentServerConfigurationGetResponse developmentServerConfigurationGet(
      DevelopmentServerConfigurationGet input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see DevelopmentServerConfigurationDelete
   */
  public void developmentServerConfigurationDelete(DevelopmentServerConfigurationDelete input)
      throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    input.handleEmptyResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }
}
