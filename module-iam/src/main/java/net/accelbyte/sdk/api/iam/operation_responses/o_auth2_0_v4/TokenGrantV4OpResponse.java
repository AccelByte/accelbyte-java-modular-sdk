/*
 * Copyright (c) 2024 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.iam.operation_responses.o_auth2_0_v4;

import java.io.*;
import java.util.*;
import lombok.Getter;
import lombok.Setter;
import net.accelbyte.sdk.api.iam.models.*;
import net.accelbyte.sdk.core.ApiResponseWithData;

@Getter
@Setter
public class TokenGrantV4OpResponse
    extends ApiResponseWithData<OauthmodelTokenWithDeviceCookieResponseV3> {

  private OauthmodelErrorResponse error400 = null;

  private OauthmodelErrorResponse error401 = null;

  private OauthmodelErrorResponse error403 = null;

  private OauthmodelErrorResponse error429 = null;

  public String getFullOperationId() {
    return "net.accelbyte.sdk.api.iam.operations.o_auth2_0_v4.TokenGrantV4";
  }
}
