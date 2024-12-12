/*
 * Copyright (c) 2024 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.leaderboard.operation_responses.user_data_v3;

import java.io.*;
import java.util.*;

import lombok.Getter;
import lombok.Setter;

import net.accelbyte.sdk.api.leaderboard.models.*;

import net.accelbyte.sdk.core.ApiResponseWithData;

@Getter
@Setter
public class GetUserLeaderboardRankingsAdminV3OpResponse extends ApiResponseWithData<ModelsGetAllUserLeaderboardsRespV3> {
    
    private ResponseErrorResponse error401 = null;

    private ResponseErrorResponse error403 = null;

    private ResponseErrorResponse error500 = null;


    public String getFullOperationId() {
        return "net.accelbyte.sdk.api.leaderboard.operations.user_data_v3.GetUserLeaderboardRankingsAdminV3";
    }
}