/*
 * Copyright (c) 2024 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.csm.wrappers;

import net.accelbyte.sdk.api.csm.models.*;
import net.accelbyte.sdk.api.csm.operations.image.*;
import net.accelbyte.sdk.core.HttpResponse;
import net.accelbyte.sdk.core.RequestRunner;

public class Image {

  private RequestRunner sdk;
  private String customBasePath = "";

  public Image(RequestRunner sdk) {
    this.sdk = sdk;
    String configCustomBasePath =
        sdk.getSdkConfiguration().getConfigRepository().getCustomServiceBasePath("csm");
    if (!configCustomBasePath.equals("")) {
      this.customBasePath = configCustomBasePath;
    }
  }

  public Image(RequestRunner sdk, String customBasePath) {
    this.sdk = sdk;
    this.customBasePath = customBasePath;
  }

  /**
   * @see GetAppImageListV1
   * @deprecated
   */
  @Deprecated
  public GeneratedGetAppImageListV1Response getAppImageListV1(GetAppImageListV1 input)
      throws Exception {
    if (input.getCustomBasePath().equals("") && !customBasePath.equals("")) {
      input.setCustomBasePath(customBasePath);
    }

    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see DeleteAppImagesV1
   * @deprecated
   */
  @Deprecated
  public void deleteAppImagesV1(DeleteAppImagesV1 input) throws Exception {
    if (input.getCustomBasePath().equals("") && !customBasePath.equals("")) {
      input.setCustomBasePath(customBasePath);
    }

    final HttpResponse httpResponse = sdk.runRequest(input);
    input.handleEmptyResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }
}
