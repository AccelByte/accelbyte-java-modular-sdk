/*
 * Copyright (c) 2024 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 */

package net.accelbyte.sdk.core;

import lombok.Getter;

@Getter
public class ApiError {

  public static ApiError empty = new ApiError("", "");

  private String code;

  private String message;

  private boolean isAvailable;

  public ApiError(String code, String message) {
    this.code = code;
    this.message = message;
    this.isAvailable = !code.equals("");
  }

  public Exception throwException() {
    final String msg = "Code: " + code + ", Message: " + message;
    return new Exception(msg);
  }

  public boolean isEqualWith(ApiError error) {
    return this.code.equals(error.getCode());
  }
}
