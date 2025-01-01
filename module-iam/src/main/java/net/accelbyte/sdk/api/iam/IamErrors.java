/*
 * Copyright (c) 2024 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */
package net.accelbyte.sdk.api.iam;

import net.accelbyte.sdk.core.ApiError;

public class IamErrors {
  public static ApiError error422 = new ApiError("422", "request is unprocessable");
  public static ApiError error10130 = new ApiError("10130", "user under age");
  public static ApiError error10131 = new ApiError("10131", "invalid date of birth");
  public static ApiError error10132 = new ApiError("10132", "invalid email address");
  public static ApiError error10133 = new ApiError("10133", "email already used");
  public static ApiError error10136 =
      new ApiError("10136", "code is either been used or not valid anymore");
  public static ApiError error10137 = new ApiError("10137", "code is expired");
  public static ApiError error10138 = new ApiError("10138", "code not match");
  public static ApiError error10139 = new ApiError("10139", "platform account not found");
  public static ApiError error10140 = new ApiError("10140", "user verified");
  public static ApiError error10141 = new ApiError("10141", "email verified");
  public static ApiError error10142 =
      new ApiError("10142", "new password cannot be same with original");
  public static ApiError error10143 = new ApiError("10143", "password not match");
  public static ApiError error10144 = new ApiError("10144", "user has no bans");
  public static ApiError error10145 =
      new ApiError("10145", "disallow game access publisher user's ban");
  public static ApiError error10146 = new ApiError("10146", "userID not match");
  public static ApiError error10148 =
      new ApiError("10148", "verification code context doesn't match the required context");
  public static ApiError error10149 =
      new ApiError("10149", "verification contact type doesn't match");
  public static ApiError error10152 = new ApiError("10152", "verification code not found");
  public static ApiError error10153 = new ApiError("10153", "user exist");
  public static ApiError error10154 = new ApiError("10154", "country not found");
  public static ApiError error10155 = new ApiError("10155", "country is not defined");
  public static ApiError error10156 = new ApiError("10156", "role not found");
  public static ApiError error10157 = new ApiError("10157", "specified role is not admin role");
  public static ApiError error10158 = new ApiError("10158", "ban not found");
  public static ApiError error10159 = new ApiError("10159", "operator is not a role manager");
  public static ApiError error10160 = new ApiError("10160", "user already has the role");
  public static ApiError error10161 = new ApiError("10161", "user already the role member");
  public static ApiError error10162 = new ApiError("10162", "invalid verification");
  public static ApiError error10163 =
      new ApiError("10163", "platform is already linked with the user account");
  public static ApiError error10169 = new ApiError("10169", "age restriction not found");
  public static ApiError error10170 = new ApiError("10170", "account is already a full account");
  public static ApiError error10171 = new ApiError("10171", "email address not found");
  public static ApiError error10172 =
      new ApiError("10172", "platform user is already linked with the account");
  public static ApiError error10173 =
      new ApiError("10173", "platform is already linked with another user account");
  public static ApiError error10174 = new ApiError("10174", "platform client not found");
  public static ApiError error10175 = new ApiError("10175", "third party credential not found");
  public static ApiError error10177 = new ApiError("10177", "username already used");
  public static ApiError error10180 =
      new ApiError("10180", "admin invitation not found or expired");
  public static ApiError error10182 =
      new ApiError("10182", "given namespace cannot be assigned to the role");
  public static ApiError error10183 = new ApiError("10183", "unprocessable entity");
  public static ApiError error10185 = new ApiError("10185", "publisher namespace not allowed");
  public static ApiError error10188 = new ApiError("10188", "input validation field not found");
  public static ApiError error10189 = new ApiError("10189", "invalid factor");
  public static ApiError error10190 = new ApiError("10190", "auth secret key expired");
  public static ApiError error10191 = new ApiError("10191", "email address not verified");
  public static ApiError error10192 = new ApiError("10192", "factor not enabled");
  public static ApiError error10193 = new ApiError("10193", "mfa not enabled");
  public static ApiError error10194 = new ApiError("10194", "factor already enabled");
  public static ApiError error10195 = new ApiError("10195", "no valid backup code found");
  public static ApiError error10200 =
      new ApiError("10200", "link to a different platform account is not allowed");
  public static ApiError error10202 =
      new ApiError("10202", "active device ban config already exists");
  public static ApiError error10204 = new ApiError("10204", "device can not be banned");
  public static ApiError error10207 = new ApiError("10207", "user namespace is not available");
  public static ApiError error10208 = new ApiError("10208", "platform token expired");
  public static ApiError error10213 = new ApiError("10213", "country is blocked");
  public static ApiError error10215 = new ApiError("10215", "Simultaneous ticket is required");
  public static ApiError error10216 = new ApiError("10216", "Native ticket is required");
  public static ApiError error10217 =
      new ApiError(
          "10217",
          "Native ticket's account linked AGS account has different linking history with input"
              + " simultaneous ticket's");
  public static ApiError error10218 =
      new ApiError(
          "10218",
          "Simultaneous ticket's account linked AGS account has different linking history with"
              + " input native ticket's");
  public static ApiError error10219 =
      new ApiError(
          "10219",
          "Native ticket's account linked AGS is already linked simultaneous but different with the"
              + " input simultaneous ticket's");
  public static ApiError error10220 =
      new ApiError(
          "10220",
          "Native ticket's account linked AGS account is different with the one which simultaneous"
              + " ticket's linked to");
  public static ApiError error10221 =
      new ApiError(
          "10221",
          "Simultaneous ticket's account linked AGS is already linked native but different with the"
              + " input native ticket's");
  public static ApiError error10222 = new ApiError("10222", "unique display name already exists");
  public static ApiError error10226 =
      new ApiError("10226", "third party platform is not supported");
  public static ApiError error10228 = new ApiError("10228", "invalid mfa token");
  public static ApiError error10229 = new ApiError("10229", "request body exceed max limitation");
  public static ApiError error10235 = new ApiError("10235", "date of birth not allowed to update");
  public static ApiError error10236 = new ApiError("10236", "username not allowed to update");
  public static ApiError error10237 = new ApiError("10237", "display name not allowed to update");
  public static ApiError error10238 = new ApiError("10238", "country not allowed to update");
  public static ApiError error10240 = new ApiError("10240", "namespace is not game namespace");
  public static ApiError error10364 = new ApiError("10364", "client exists");
  public static ApiError error10365 = new ApiError("10365", "client not found");
  public static ApiError error10456 = new ApiError("10456", "role not found");
  public static ApiError error10457 = new ApiError("10457", "specified role is not admin role");
  public static ApiError error10459 = new ApiError("10459", "operator is not a role manager");
  public static ApiError error10466 = new ApiError("10466", "invalid role members");
  public static ApiError error10467 = new ApiError("10467", "role has no manager");
  public static ApiError error10468 = new ApiError("10468", "role manager exist");
  public static ApiError error10469 = new ApiError("10469", "role member exist");
  public static ApiError error10470 = new ApiError("10470", "role is empty");
  public static ApiError error20000 = new ApiError("20000", "internal server error");
  public static ApiError error20001 = new ApiError("20001", "unauthorized access");
  public static ApiError error20002 = new ApiError("20002", "validation error");
  public static ApiError error20003 = new ApiError("20003", "forbidden access");
  public static ApiError error20007 = new ApiError("20007", "too many requests");
  public static ApiError error20008 = new ApiError("20008", "user not found");
  public static ApiError error20009 = new ApiError("20009", "request_conflict");
  public static ApiError error20013 = new ApiError("20013", "insufficient permissions");
  public static ApiError error20019 = new ApiError("20019", "unable to parse request body");
  public static ApiError error20021 = new ApiError("20021", "invalid pagination parameter");
  public static ApiError error20022 = new ApiError("20022", "token is not user token");
  public static ApiError error20024 = new ApiError("20024", "not implemented");
  public static ApiError error20025 = new ApiError("20025", "not a publisher user");
  public static ApiError error1014001 = new ApiError("1014001", "unable to parse request body");
  public static ApiError error1014002 = new ApiError("1014002", "user already exists");
  public static ApiError error1014016 = new ApiError("1014016", "unable to parse request body");
  public static ApiError error1014017 = new ApiError("1014017", "user not found");
  public static ApiError error1014018 = new ApiError("1014018", "verification code not found");
  public static ApiError error1014019 = new ApiError("1014019", "verification code already used");
  public static ApiError error1014020 = new ApiError("1014020", "verification code invalid");
  public static ApiError error1014021 = new ApiError("1014021", "verification code expired");
  public static ApiError error1015073 =
      new ApiError("1015073", "new password same as old password");
}
