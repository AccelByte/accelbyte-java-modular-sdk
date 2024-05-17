/*
 * Copyright (c) 2024 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.platform.operations.item;

import java.io.*;
import java.util.*;
import lombok.Builder;
import lombok.Getter;
import lombok.Setter;
import net.accelbyte.sdk.api.platform.models.*;
import net.accelbyte.sdk.core.HttpResponseException;
import net.accelbyte.sdk.core.Operation;
import net.accelbyte.sdk.core.util.Helper;

/**
 * createItemTypeConfig
 *
 * <p>[Not Supported Yet In Starter] This API is used to create an item type config.
 *
 * <p>* Returns : item type config data
 */
@Getter
@Setter
public class CreateItemTypeConfig extends Operation {
  /** generated field's value */
  private String path = "/platform/admin/items/configs";

  private String customBasePath = "";
  private String method = "POST";
  private List<String> consumes = Arrays.asList("application/json");
  private List<String> produces = Arrays.asList("application/json");
  private String locationQuery = null;

  /** fields as input parameter */
  private ItemTypeConfigCreate body;

  /** */
  @Builder
  // @deprecated 2022-08-29 - All args constructor may cause problems. Use builder instead.
  @Deprecated
  public CreateItemTypeConfig(String customBasePath, ItemTypeConfigCreate body) {
    this.body = body;
    this.customBasePath = customBasePath;

    securities.add("Bearer");
  }

  @Override
  public ItemTypeConfigCreate getBodyParams() {
    return this.body;
  }

  @Override
  public boolean isValid() {
    return true;
  }

  public void handleEmptyResponse(int code, String contentType, InputStream payload)
      throws HttpResponseException, IOException {
    if (code != 201) {
      final String json = Helper.convertInputStreamToString(payload);
      throw new HttpResponseException(code, json);
    }
  }
}
