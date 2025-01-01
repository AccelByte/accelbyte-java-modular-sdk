/*
 * Copyright (c) 2024 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.match2.operation_responses.config;

import java.io.*;
import java.util.*;
import lombok.Getter;
import lombok.Setter;
import net.accelbyte.sdk.api.match2.models.*;
import net.accelbyte.sdk.core.ApiResponseWithData;

@Getter
@Setter
public class AdminGetLogConfigOpResponse extends ApiResponseWithData<LogconfigConfiguration> {

  public String getFullOperationId() {
    return "net.accelbyte.sdk.api.match2.operations.config.AdminGetLogConfig";
  }
}
