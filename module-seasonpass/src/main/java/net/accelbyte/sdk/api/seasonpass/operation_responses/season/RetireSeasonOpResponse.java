/*
 * Copyright (c) 2024 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.seasonpass.operation_responses.season;

import java.io.*;
import java.util.*;

import lombok.Getter;
import lombok.Setter;

import net.accelbyte.sdk.api.seasonpass.models.*;

import net.accelbyte.sdk.core.ApiResponseWithData;

@Getter
@Setter
public class RetireSeasonOpResponse extends ApiResponseWithData<SeasonInfo> {
    
    private ErrorEntity error400 = null;

    private ErrorEntity error404 = null;

    private ErrorEntity error409 = null;


    public String getFullOperationId() {
        return "net.accelbyte.sdk.api.seasonpass.operations.season.RetireSeason";
    }
}