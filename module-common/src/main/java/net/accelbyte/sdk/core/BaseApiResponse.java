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
public abstract class BaseApiResponse {

  private boolean isSuccess = false;

  private int httpStatusCode = 200;

  private String contentType = "";

  private ApiError error = ApiError.empty;

  public abstract String getFullOperationId();

  public void throwExceptionIfError() throws ApiResponseException {
    if (!isSuccess && error.isAvailable()) throw new ApiResponseException(this, true);
    else if (!isSuccess) throw new ApiResponseException(this, false);
  }
}
