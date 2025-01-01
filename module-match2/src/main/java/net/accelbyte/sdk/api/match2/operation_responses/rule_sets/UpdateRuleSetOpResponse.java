/*
 * Copyright (c) 2024 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.match2.operation_responses.rule_sets;

import java.io.*;
import java.util.*;
import lombok.Getter;
import lombok.Setter;
import net.accelbyte.sdk.api.match2.models.*;
import net.accelbyte.sdk.core.ApiResponseWithData;

@Getter
@Setter
public class UpdateRuleSetOpResponse extends ApiResponseWithData<ApiRuleSetPayload> {

  private ResponseError error400 = null;

  private ResponseError error401 = null;

  private ResponseError error403 = null;

  private ResponseError error404 = null;

  private ResponseError error500 = null;

  public String getFullOperationId() {
    return "net.accelbyte.sdk.api.match2.operations.rule_sets.UpdateRuleSet";
  }
}
