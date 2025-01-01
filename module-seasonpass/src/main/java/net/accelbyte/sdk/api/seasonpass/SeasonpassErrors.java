/*
 * Copyright (c) 2024 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */
package net.accelbyte.sdk.api.seasonpass;

import net.accelbyte.sdk.core.ApiError;

public class SeasonpassErrors {
  public static ApiError error20002 = new ApiError("20002", "validation error");
  public static ApiError error20026 = new ApiError("20026", "publisher namespace not allowed");
  public static ApiError error30141 =
      new ApiError("30141", "Store [{storeId}] does not exist in namespace [{namespace}]");
  public static ApiError error30142 =
      new ApiError("30142", "Published store does not exist in namespace [{namespace}]");
  public static ApiError error30341 =
      new ApiError("30341", "Item [{itemId}] does not exist in namespace [{namespace}]");
  public static ApiError error36141 =
      new ApiError("36141", "Currency [{currencyCode}] does not exist in namespace [{namespace}]");
  public static ApiError error49121 =
      new ApiError("49121", "Default language [{language}] required in localizations");
  public static ApiError error49122 = new ApiError("49122", "Invalid time range");
  public static ApiError error49124 = new ApiError("49124", "Manual claim not supported");
  public static ApiError error49141 =
      new ApiError("49141", "Tier item does not exist in the store of namespace [{namespace}]");
  public static ApiError error49142 =
      new ApiError("49142", "Pass item does not exist in the store of namespace [{namespace}]");
  public static ApiError error49143 =
      new ApiError("49143", "Season [{seasonId}] does not exist in namespace [{namespace}]");
  public static ApiError error49144 = new ApiError("49144", "Reward [{code}] does not exist");
  public static ApiError error49145 = new ApiError("49145", "Pass [{code}] does not exist");
  public static ApiError error49146 = new ApiError("49146", "Tier does not exist");
  public static ApiError error49147 = new ApiError("49147", "Published season does not exist");
  public static ApiError error49148 = new ApiError("49148", "User season does not exist");
  public static ApiError error49171 = new ApiError("49171", "Invalid season status [{status}]");
  public static ApiError error49172 = new ApiError("49172", "Season is already ended");
  public static ApiError error49173 =
      new ApiError("49173", "Reward [{code}] already exists in the season");
  public static ApiError error49174 =
      new ApiError("49174", "Pass [{code}] already exists in the season");
  public static ApiError error49175 =
      new ApiError("49175", "Published season already exists in namespace [{namespace}]");
  public static ApiError error49176 = new ApiError("49176", "Rewards are not provided");
  public static ApiError error49177 = new ApiError("49177", "Passes are not provided");
  public static ApiError error49178 = new ApiError("49178", "Tiers are not provided");
  public static ApiError error49179 = new ApiError("49179", "Reward [{code}] is in use");
  public static ApiError error49180 = new ApiError("49180", "Season is already started");
  public static ApiError error49181 = new ApiError("49181", "Season has not ended");
  public static ApiError error49182 = new ApiError("49182", "Reward is already claimed");
  public static ApiError error49183 =
      new ApiError("49183", "Pass item does not match published season pass");
  public static ApiError error49184 =
      new ApiError("49184", "Tier item does not match published season tier");
  public static ApiError error49185 = new ApiError("49185", "Season has not started");
  public static ApiError error49186 = new ApiError("49186", "Pass already owned");
  public static ApiError error49187 = new ApiError("49187", "Exceed max tier count");
  public static ApiError error49188 = new ApiError("49188", "Reward is claiming");
  public static ApiError error49189 =
      new ApiError(
          "49189", "Duplicate season name [{name}] for publishing in namespace [{namespace}]");
}
