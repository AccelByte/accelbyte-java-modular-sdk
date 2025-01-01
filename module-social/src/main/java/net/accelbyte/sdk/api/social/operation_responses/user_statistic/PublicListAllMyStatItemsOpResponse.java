/*
 * Copyright (c) 2024 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.social.operation_responses.user_statistic;

import java.io.*;
import java.util.*;
import lombok.Getter;
import lombok.Setter;
import net.accelbyte.sdk.api.social.models.*;
import net.accelbyte.sdk.core.ApiResponseWithData;

@Getter
@Setter
public class PublicListAllMyStatItemsOpResponse
    extends ApiResponseWithData<List<ADTOObjectForUserStatItemValue>> {

  private ErrorEntity error400 = null;

  private ErrorEntity error403 = null;

  private ErrorEntity error404 = null;

  private ValidationErrorEntity error422 = null;

  public String getFullOperationId() {
    return "net.accelbyte.sdk.api.social.operations.user_statistic.PublicListAllMyStatItems";
  }
}
