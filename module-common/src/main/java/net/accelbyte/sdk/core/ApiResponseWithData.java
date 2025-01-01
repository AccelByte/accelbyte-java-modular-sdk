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
public abstract class ApiResponseWithData<T> extends BaseApiResponse {

  private T data = null;

  public T ensureSuccess() throws ApiResponseException {
    this.throwExceptionIfError();

    if (data == null) {
      final String msg = this.getFullOperationId() + " returns NULL.";
      throw new ApiResponseException(this, msg);
    }

    return data;
  }
}
