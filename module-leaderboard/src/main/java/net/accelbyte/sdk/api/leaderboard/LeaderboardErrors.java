/*
 * Copyright (c) 2024 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */
package net.accelbyte.sdk.api.leaderboard;

import net.accelbyte.sdk.core.ApiError;

public class LeaderboardErrors
{
    public static ApiError error20000 = new ApiError("20000", "internal server error");
    public static ApiError error20001 = new ApiError("20001", "unauthorized access");
    public static ApiError error20002 = new ApiError("20002", "validation error");
    public static ApiError error20013 = new ApiError("20013", "insufficient permissions");
    public static ApiError error20019 = new ApiError("20019", "unable to parse request body");
    public static ApiError error71130 = new ApiError("71130", "leaderboard config not found");
    public static ApiError error71132 = new ApiError("71132", "leaderboard configuration already exist");
    public static ApiError error71133 = new ApiError("71133", "leaderboard configuration deleted");
    public static ApiError error71230 = new ApiError("71230", "leaderboard configuration not found");
    public static ApiError error71233 = new ApiError("71233", "user ranking data not found");
    public static ApiError error71235 = new ApiError("71235", "leaderboard ranking not found");
    public static ApiError error71236 = new ApiError("71236", "leaderboard ranking count failed");
    public static ApiError error71237 = new ApiError("71237", "leaderboard ranking not created for inactive leaderboard");
    public static ApiError error71239 = new ApiError("71239", "leaderboard is not archived");
    public static ApiError error71241 = new ApiError("71241", "forbidden environment");
    public static ApiError error71242 = new ApiError("71242", "stat code not found in namespace");
    public static ApiError error71243 = new ApiError("71243", "cycle doesn't belong to the stat code");
    public static ApiError error71244 = new ApiError("71244", "cycle is already stopped");
}