/*
 * Copyright (c) 2024 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */
package net.accelbyte.sdk.api.basic;

import net.accelbyte.sdk.core.ApiError;

public class BasicErrors {
  public static ApiError error11121 =
      new ApiError("11121", "Unable to {action}: category {category} is not valid");
  public static ApiError error11131 =
      new ApiError("11131", "Unable to {action}: File type is not supported");
  public static ApiError error11132 =
      new ApiError(
          "11132",
          "Unable to {action}: file storage exceed limitation, user ID: {userId}, namespace:"
              + " {namespace}");
  public static ApiError error11233 =
      new ApiError(
          "11233", "Unable to {action}: Country group with code [{countryGroupCode}] is not found");
  public static ApiError error11234 =
      new ApiError(
          "11234",
          "Unable to {action}: A country can't be assigned to more than one country group");
  public static ApiError error11235 =
      new ApiError(
          "11235", "Unable to {action}: Country group with specified code is already exist");
  public static ApiError error11336 =
      new ApiError("11336", "Unable to {action}: Namespace already exists");
  public static ApiError error11337 =
      new ApiError("11337", "Unable to {action}: Namespace not found");
  public static ApiError error11338 =
      new ApiError("11338", "Unable to {action}: Namespace contains invalid character(s)");
  public static ApiError error11339 =
      new ApiError("11339", "Unable to {action}: Display name contains invalid character(s)");
  public static ApiError error11340 =
      new ApiError(
          "11340",
          "Unable to {action}: The maximum number of games namespace for studio:{studio} has been"
              + " exceeded");
  public static ApiError error11440 =
      new ApiError(
          "11440", "Unable to {action}: User profile not found in namespace [{namespace}]");
  public static ApiError error11441 =
      new ApiError("11441", "Unable to {action}: User profile already exists");
  public static ApiError error11469 =
      new ApiError(
          "11469", "User profile with publicId [{publicId}] not found in namespace [{namespace}]");
  public static ApiError error11741 = new ApiError("11741", "Unable to {action}: Config not found");
  public static ApiError error11771 =
      new ApiError("11771", "Unable to {action}: Config already exists");
  public static ApiError error20000 = new ApiError("20000", "internal server error");
  public static ApiError error20001 = new ApiError("20001", "unauthorized");
  public static ApiError error20002 = new ApiError("20002", "validation error");
  public static ApiError error20006 = new ApiError("20006", "optimistic lock");
  public static ApiError error20008 = new ApiError("20008", "user not found");
  public static ApiError error20013 = new ApiError("20013", "insufficient permission");
  public static ApiError error20017 = new ApiError("20017", "user not linked");
  public static ApiError error20019 = new ApiError("20019", "unable to parse request body");
}
