/*
 * Copyright (c) 2024 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.gdpr.operation_responses.configuration;

import java.io.*;
import java.util.*;
import lombok.Getter;
import lombok.Setter;
import net.accelbyte.sdk.api.gdpr.models.*;
import net.accelbyte.sdk.core.ApiResponseWithData;

@Getter
@Setter
public class AdminUpdateServicesConfigurationOpResponse
    extends ApiResponseWithData<DtoServiceConfigurationUpdateRequest> {

  private ResponseError error400 = null;

  private ResponseError error401 = null;

  private ResponseError error500 = null;

  public String getFullOperationId() {
    return "net.accelbyte.sdk.api.gdpr.operations.configuration.AdminUpdateServicesConfiguration";
  }
}
