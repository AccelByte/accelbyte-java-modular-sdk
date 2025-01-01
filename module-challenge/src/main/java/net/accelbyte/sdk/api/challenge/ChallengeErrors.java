/*
 * Copyright (c) 2024 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */
package net.accelbyte.sdk.api.challenge;

import net.accelbyte.sdk.core.ApiError;

public class ChallengeErrors {
  public static ApiError error20000 = new ApiError("20000", "internal server error: {{message}}");
  public static ApiError error20001 = new ApiError("20001", "unauthorized access");
  public static ApiError error20013 = new ApiError("20013", "insufficient permission");
  public static ApiError error20018 = new ApiError("20018", "bad request: {{message}}");
  public static ApiError error20029 = new ApiError("20029", "not found");
  public static ApiError error99002 = new ApiError("99002", "duplicate key error: {{message}}");
  public static ApiError error99003 =
      new ApiError("99003", "challenge validation error: {{message}}");
  public static ApiError error99004 = new ApiError("99004", "unprocessable entity: {{message}}");
}
