/*
 * Copyright (c) 2024 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */
package net.accelbyte.sdk.api.group;

import net.accelbyte.sdk.core.ApiError;

public class GroupErrors {
  public static ApiError error20001 = new ApiError("20001", "unauthorized access");
  public static ApiError error20002 = new ApiError("20002", "validation error");
  public static ApiError error20013 = new ApiError("20013", "insufficient permissions");
  public static ApiError error20019 = new ApiError("20019", "unable to parse request body");
  public static ApiError error20022 = new ApiError("20022", "token is not user token");
  public static ApiError error73034 = new ApiError("73034", "user not belong to any group");
  public static ApiError error73036 = new ApiError("73036", "insufficient member role permission");
  public static ApiError error73130 = new ApiError("73130", "global configuration already exist");
  public static ApiError error73131 = new ApiError("73131", "global configuration not found");
  public static ApiError error73232 = new ApiError("73232", "member role not found");
  public static ApiError error73333 = new ApiError("73333", "group not found");
  public static ApiError error73342 = new ApiError("73342", "user already joined group");
  public static ApiError error73433 = new ApiError("73433", "member group not found");
  public static ApiError error73437 = new ApiError("73437", "user already invited");
  public static ApiError error73438 = new ApiError("73438", "user already requested to join");
  public static ApiError error73440 = new ApiError("73440", "group admin cannot leave group");
  public static ApiError error73442 = new ApiError("73442", "user already joined in another group");
  public static ApiError error73443 = new ApiError("73443", "member request not found");
  public static ApiError error73444 = new ApiError("73444", "member must have role");
}
