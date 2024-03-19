/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.inventory.wrappers;

import net.accelbyte.sdk.api.inventory.models.*;
import net.accelbyte.sdk.api.inventory.operations.public_inventory_configurations.*;
import net.accelbyte.sdk.core.RequestRunner;
import net.accelbyte.sdk.core.HttpResponse;

public class PublicInventoryConfigurations {

  private RequestRunner sdk;

  public PublicInventoryConfigurations(RequestRunner sdk) {
    this.sdk = sdk;
  }

  /**
   * @see PublicListInventoryConfigurations
   */
  public ApimodelsListInventoryConfigurationsResp publicListInventoryConfigurations(
      PublicListInventoryConfigurations input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }
}
