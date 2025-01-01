/*
 * Copyright (c) 2024 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 */

package net.accelbyte.sdk.core;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class ApiResponseException extends Exception {

  private String code = "";

  private String fullOperationId = "";

  private int statusCode = 0;

  public ApiResponseException(BaseApiResponse response, boolean errorAvailable) {
    super(
        errorAvailable
            ? response.getFullOperationId()
                + " returns error: "
                + response.getError().getCode()
                + ". "
                + response.getError().getMessage()
            : response.getFullOperationId()
                + " returns unknown error with http status code "
                + Integer.toString(response.getHttpStatusCode()));

    code = response.getError().getCode();
    fullOperationId = response.getFullOperationId();
    statusCode = response.getHttpStatusCode();
  }

  public ApiResponseException(BaseApiResponse response, String customMessage) {
    super(customMessage);

    code = response.getError().getCode();
    fullOperationId = response.getFullOperationId();
    statusCode = response.getHttpStatusCode();
  }
}
