/*
 * Copyright (c) 2024 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.inventory.wrappers;

import net.accelbyte.sdk.api.inventory.models.*;
import net.accelbyte.sdk.api.inventory.operation_responses.public_inventory_configurations.*;
import net.accelbyte.sdk.api.inventory.operations.public_inventory_configurations.*;
import net.accelbyte.sdk.core.HttpResponse;
import net.accelbyte.sdk.core.RequestRunner;

public class PublicInventoryConfigurations {

  private RequestRunner sdk;
  private String customBasePath = "";

  public PublicInventoryConfigurations(RequestRunner sdk) {
    this.sdk = sdk;
    String configCustomBasePath =
        sdk.getSdkConfiguration().getConfigRepository().getCustomServiceBasePath("inventory");
    if (!configCustomBasePath.equals("")) {
      this.customBasePath = configCustomBasePath;
    }
  }

  public PublicInventoryConfigurations(RequestRunner sdk, String customBasePath) {
    this.sdk = sdk;
    this.customBasePath = customBasePath;
  }

  /**
   * @see PublicListInventoryConfigurations
   */
  public PublicListInventoryConfigurationsOpResponse publicListInventoryConfigurations(
      PublicListInventoryConfigurations input) throws Exception {
    if (input.getCustomBasePath().equals("") && !customBasePath.equals("")) {
      input.setCustomBasePath(customBasePath);
    }

    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }
}
