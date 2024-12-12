/*
 * Copyright (c) 2024 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.ams.operation_responses.fleets;

import java.io.*;
import java.util.*;

import lombok.Getter;
import lombok.Setter;

import net.accelbyte.sdk.api.ams.models.*;

import net.accelbyte.sdk.core.ApiResponseWithData;

@Getter
@Setter
public class FleetListOpResponse extends ApiResponseWithData<ApiFleetListResponse> {
    
    private ResponseErrorResponse error500 = null;


    public String getFullOperationId() {
        return "net.accelbyte.sdk.api.ams.operations.fleets.FleetList";
    }
}